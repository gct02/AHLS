import os
import torch
import shutil
import json
import pickle
import math
from collections import defaultdict
from typing import Union, Optional, List, Dict, Tuple

import numpy as np
from torch_geometric.data import Dataset, Data

from gnn.data.graph import KernelGraph, compute_scaling_stats, NO_LOG_SCALING_KEYS

TARGET_AREA_METRICS = ['lut', 'ff', 'dsp', 'bram']
TARGET_TIMING_METRICS = ['achieved_clk', 'cc']
TARGET_POWER_METRICS = ['dynamic_power', 'static_power']

TARGET_METRICS = {
    'area': TARGET_AREA_METRICS,
    'timing': TARGET_TIMING_METRICS,
    'power': TARGET_POWER_METRICS
}

METRIC_SIZES_BY_CATEGORY = {
    key: len(value) 
    for key, value in TARGET_METRICS.items()
}

NUMERICAL_DCT_FEATURES = ['partition_factor', 'unroll_factor', 'target_ii']

StatsDict = Dict[str, Dict[str, float]]


class HLSDataset(Dataset):
    def __init__(
        self, 
        root: str = "gnn/dataset", 
        target_metric: str = "area",
        mode: str = "train",
        scaling_stats: Optional[StatsDict] = None,
        base_target_scaling_stats: Optional[StatsDict] = None,
        target_scaling_stats: Optional[StatsDict] = None,
        benchmarks: Optional[Union[str, List[str]]] = None,
        **kwargs
    ):
        self.target_metric = target_metric.lower()
        if target_metric not in TARGET_METRICS:
            raise ValueError(
                f"Invalid target metric '{target_metric}'. "
                f"Available options are: {list(TARGET_METRICS.keys())}"
            )
        self.evaluation_metrics = TARGET_METRICS[target_metric]
        self.full_dataset_dir = os.path.join(root, "full")
        self.root = os.path.join(root, mode)

        if not benchmarks:
            benchmarks = sorted(os.listdir(self.full_dataset_dir))
        elif not isinstance(benchmarks, list):
            benchmarks = [benchmarks]

        base_graphs = {}
        self.base_targets = {}
        self.benchmarks = []

        # Filter out unavailable benchmarks
        for benchmark in benchmarks:
            benchmark_dir = os.path.join(self.full_dataset_dir, benchmark)
            if not os.path.isdir(benchmark_dir):
                print(f"Skipping {benchmark} (directory not found)")
                continue

            metrics_path = os.path.join(benchmark_dir, "base_metrics.json")
            if not os.path.exists(metrics_path):
                print(f"Skipping {benchmark} (base metrics file not found)")
                continue

            kernel_info_path = os.path.join(benchmark_dir, "base_vitis_kernel_info.pkl")
            if not os.path.exists(kernel_info_path):
                print(f"Skipping {benchmark} (kernel info file not found)")
                continue

            with open(metrics_path, 'r') as f:
                metrics = json.load(f)

            if not is_valid_report(metrics, self.evaluation_metrics):
                print(f"Skipping {benchmark} (missing metrics in base solution)")
                continue

            target = [float(metrics[key]) for key in self.evaluation_metrics]

            with open(kernel_info_path, 'rb') as f:
                kernel_info = pickle.load(f)
            
            base_graphs[benchmark] = kernel_info
            self.base_targets[benchmark] = target
            self.benchmarks.append(benchmark)

        if not scaling_stats:
            self.scaling_stats = compute_scaling_stats(list(base_graphs.values()))
            dct_scaling_stats = compute_dct_scaling_stats(
                self.full_dataset_dir, 
                benchmarks=self.benchmarks
            )
            self.scaling_stats.update(dct_scaling_stats)
            self.base_target_scaling_stats, self.target_scaling_stats = compute_target_scaling_stats(
                self.full_dataset_dir, 
                benchmarks=self.benchmarks
            )
        else:
            self.scaling_stats = scaling_stats
            self.base_target_scaling_stats = base_target_scaling_stats
            self.target_scaling_stats = target_scaling_stats
        
        for bench, base_target in self.base_targets.items():
            scaled_target = []
            for key, value in zip(self.evaluation_metrics, base_target):
                if key in self.base_target_scaling_stats:
                    mean = self.base_target_scaling_stats[key]['mean']
                    std = self.base_target_scaling_stats[key]['std']
                    if std < 1e-8:
                        std = 1.0
                    value = math.log1p(float(value))
                    value = (value - mean) / std
                else:
                    value = float(value)
                scaled_target.append(value)
            self.base_targets[bench] = torch.tensor(scaled_target, dtype=torch.float32).unsqueeze(0)

        self._raw_file_names = []
        self._processed_file_names = []

        super(HLSDataset, self).__init__(self.root, **kwargs)
    
    @property
    def raw_file_names(self):
        return self._raw_file_names
    
    @property
    def processed_file_names(self):
        return self._processed_file_names
    
    def download(self):
        if not os.path.exists(self.full_dataset_dir):
            raise FileNotFoundError(
                f"Directory {self.full_dataset_dir} does not exist."
            )
        if os.path.exists(self.raw_dir):
            shutil.rmtree(self.raw_dir)
        os.makedirs(self.raw_dir)
            
        for bench in self.benchmarks:
            src = os.path.join(self.full_dataset_dir, bench)
            dst = os.path.join(self.raw_dir, bench)
            shutil.copytree(src, dst)
    
    def process(self):
        if not os.path.exists(self.raw_dir):
            raise FileNotFoundError(
                f"Raw dataset directory {self.raw_dir} does not exist."
            )
        if os.path.exists(self.processed_dir):
            shutil.rmtree(self.processed_dir)
        os.makedirs(self.processed_dir)

        solution_dict = defaultdict(dict)
        for benchmark in self.benchmarks:
            benchmark_dir = os.path.join(self.raw_dir, benchmark)
            for solution in os.listdir(benchmark_dir):
                solution_dir = os.path.join(benchmark_dir, solution)
                if (not os.path.isdir(solution_dir) or 
                    not solution.startswith("solution")):
                    continue
                idx = int(solution.split("solution")[1])
                solution_dict[idx][benchmark] = solution_dir

        for idx in sorted(solution_dict.keys()):
            solution_dirs = solution_dict[idx]
            if len(solution_dirs) == 0:
                print(f"Skipping {idx} (no solution directories found)")
                continue

            for benchmark, solution_dir in solution_dirs.items():
                kernel_info_path = os.path.join(solution_dir, "vitis_kernel_info.pkl")
                if not os.path.exists(kernel_info_path):
                    print(f"Skipping {idx} (kernel info file not found)")
                    continue

                metrics_path = os.path.join(solution_dir, "metrics.json")
                if not os.path.exists(metrics_path):
                    print(f"Skipping {idx} (metrics file not found)")
                    continue

                with open(metrics_path, 'r') as f:
                    metrics = json.load(f)

                if not is_valid_report(metrics, self.evaluation_metrics):
                    print(f"Skipping {idx} (missing metrics)")
                    continue

                target = []
                for key in self.evaluation_metrics:
                    if key in self.target_scaling_stats:
                        mean = self.target_scaling_stats[key]['mean']
                        std = self.target_scaling_stats[key]['std']
                        if std < 1e-8:
                            std = 1.0
                        value = math.log1p(float(metrics[key]))
                        value = (value - mean) / std
                    else:
                        value = float(metrics[key])
                    target.append(value)

                target = torch.tensor(target, dtype=torch.float32).unsqueeze(0)

                original_target = [float(metrics[key]) for key in self.evaluation_metrics]
                original_target = torch.tensor(original_target, dtype=torch.float32).unsqueeze(0)

                with open(kernel_info_path, 'rb') as f:
                    kernel_info = pickle.load(f)

                self._standardize_features(kernel_info)

                node_id_map = {node_id: i for i, node_id in enumerate(kernel_info.nodes.keys())}

                xs = [None] * len(node_id_map)
                for node_id, node in kernel_info.nodes.items():
                    xs[node_id_map[node_id]] = torch.tensor(node.get_homogeneous_features(), dtype=torch.float32)

                edge_indices = []
                edge_attrs = []
                for edge in kernel_info.edges.values():
                    src_idx = node_id_map.get(edge.src)
                    dst_idx = node_id_map.get(edge.dst)
                    if src_idx is not None and dst_idx is not None:
                        edge_indices.append([src_idx, dst_idx])
                        edge_attrs.append(torch.tensor(edge.one_hot_etype + [int(edge.is_back_edge)], dtype=torch.float32))

                data = {
                    'x': torch.stack(xs, dim=0),
                    'edge_attr': torch.stack(edge_attrs, dim=0),
                    'edge_index': torch.tensor(edge_indices, dtype=torch.long).t().contiguous(),
                    'y': target,
                    'original_y': original_target,
                    'y_base': self.base_targets[benchmark],
                    'benchmark': benchmark,
                    'solution_index': idx
                }
                data = Data.from_dict(data)

                output_path = os.path.join(self.processed_dir, f"{benchmark}_{idx}.pt")
                torch.save(data, output_path)

                self._processed_file_names.append(f"{benchmark}_{idx}.pt")
                self._raw_file_names.append(
                    (f"{benchmark}/{idx}/graph.pt", f"{benchmark}/{idx}/metrics.txt")
                )

    def len(self):
        return len(self.processed_paths)

    def get(self, ind):
        data = torch.load(self.processed_paths[ind])
        return data 
    
    def _standardize_features(self, kernel_info: KernelGraph):
        def log_transform(value):
            if isinstance(value, (list, tuple)):
                return [math.log1p(float(v)) for v in value]
            return math.log1p(float(value))
            
        def scale(value, mean, std):
            if isinstance(value, (list, tuple)):
                return [(float(v) - mean) / std for v in value]
            return (float(value) - mean) / std
            
        for node in kernel_info.nodes.values():
            for key, value in node.feature_dict.items():
                if key in self.scaling_stats:
                    mean = self.scaling_stats[key]['mean']
                    std = self.scaling_stats[key]['std']
                    if std < 1e-8:
                        std = 1.0
                    if key not in NO_LOG_SCALING_KEYS:
                        value = log_transform(value)
                    node.feature_dict[key] = scale(value, mean, std)


def compute_target_scaling_stats(
    dataset_dir: str,
    benchmarks: Optional[Union[str, List[str]]] = None
) -> Tuple[StatsDict, StatsDict]:
    base_targets = {key: [] for key in TARGET_AREA_METRICS}
    targets = {key: [] for key in TARGET_AREA_METRICS}

    if benchmarks is None:
        benchmarks = sorted(os.listdir(dataset_dir))
    elif isinstance(benchmarks, str):
        benchmarks = [benchmarks]

    for bench in benchmarks:
        bench_dir = os.path.join(dataset_dir, bench)
        if not os.path.isdir(bench_dir):
            print(f"Skipping {bench} (directory not found)")
            continue

        base_metrics_path = os.path.join(bench_dir, "base_metrics.json")
        if not os.path.exists(base_metrics_path):
            print(f"Skipping {bench} (base metrics file not found)")
            continue

        with open(base_metrics_path, 'r') as f:
            base_metrics = json.load(f)

        if not is_valid_report(base_metrics, TARGET_AREA_METRICS):
            print(f"Skipping {bench} (missing base metrics)")
            continue

        for key in TARGET_AREA_METRICS:
            base_targets[key].append(float(base_metrics[key]))

        solutions = [s for s in os.listdir(bench_dir) if "solution" in s]
        solutions = sorted(solutions, key=lambda s: int(s.split("solution")[1]))

        for sol in solutions:
            sol_dir = os.path.join(bench_dir, sol)
            metrics_path = os.path.join(sol_dir, "metrics.json")
            if not os.path.exists(metrics_path):
                print(f"Skipping {sol} (metrics file not found)")
                continue

            with open(metrics_path, 'r') as f:
                metrics = json.load(f)

            if not is_valid_report(metrics, TARGET_AREA_METRICS):
                print(f"Skipping {sol} (missing metrics in solution)")
                continue

            for key in TARGET_AREA_METRICS:
                targets[key].append(float(metrics[key]))

    base_scaling_stats = {}
    scaling_stats = {}
    for key in TARGET_AREA_METRICS:
        if not base_targets[key]:
            base_scaling_stats[key] = {'mean': 0.0, 'std': 1.0}
        else:
            base_values = np.array(base_targets[key], dtype=np.float64)
            base_values = np.log1p(base_values)
            mean = np.mean(base_values)
            std = np.std(base_values)
            if std < 1e-8:
                std = 1.0
            base_scaling_stats[key] = {'mean': mean, 'std': std}

        if not targets[key]:
            scaling_stats[key] = {'mean': 0.0, 'std': 1.0}
        else:
            values = np.array(targets[key], dtype=np.float64)
            values = np.log1p(values)
            mean = np.mean(values)
            std = np.std(values)
            if std < 1e-8:
                std = 1.0
            scaling_stats[key] = {'mean': mean, 'std': std}

    return base_scaling_stats, scaling_stats


def compute_dct_scaling_stats(
    dataset_dir: str,
    benchmarks: Optional[Union[str, List[str]]] = None
) -> StatsDict:
    """Compute statistics (mean and std deviation) for numerical features in the dataset.
    Args:
        dataset_dir (str): Path to the dataset directory.
        benchmarks (Optional[Union[str, List[str]]]): Specific benchmarks to compute stats for.
    Returns:
        Dict[str, Dict[str, float]]: Scaling statistics for each numerical feature.
    """
    numerical_feats = {feat: [] for feat in NUMERICAL_DCT_FEATURES}

    if benchmarks is None:
        benchmarks = sorted(os.listdir(dataset_dir))
    elif isinstance(benchmarks, str):
        benchmarks = [benchmarks]

    for bench in benchmarks:
        bench_dir = os.path.join(dataset_dir, bench)
        if not os.path.isdir(bench_dir):
            print(f"Skipping {bench} (directory not found)")
            continue

        solutions = [s for s in os.listdir(bench_dir) if "solution" in s]
        solutions = sorted(solutions, key=lambda s: int(s.split("solution")[1]))

        for sol in solutions:
            sol_dir = os.path.join(bench_dir, sol)
            kernel_info_path = os.path.join(sol_dir, "vitis_kernel_info.pkl")
            if not os.path.exists(kernel_info_path):
                print(f"Skipping {sol} (kernel info file not found)")
                continue

            with open(kernel_info_path, 'rb') as f:
                kernel_info = pickle.load(f)

            for node in kernel_info.nodes.values():
                for key, value in node.feature_dict.items():
                    if key in numerical_feats and value > 0:
                        numerical_feats[key].append(float(value))

    scaling_stats = {}
    for key, values in numerical_feats.items():
        if not values:
            scaling_stats[key] = {'mean': 0.0, 'std': 1.0}
            continue

        values_arr = np.array(values, dtype=np.float64)
        values_arr = np.log1p(values_arr)
        mean = np.mean(values_arr)
        std = np.std(values_arr)
        if std < 1e-8:
            std = 1.0

        scaling_stats[key] = {'mean': mean, 'std': std}

    return scaling_stats


def is_valid_report(
    report: Dict[str, float], 
    target_metrics: List[str]
) -> bool:
    if not report:
        return False
    for metric in target_metrics:
        if metric not in report or float(report[metric]) < -1e-6:
            return False
    return True