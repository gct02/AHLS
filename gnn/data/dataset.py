import os
import torch
import shutil
import json
import pickle
import math
from collections import defaultdict
from typing import Union, Optional, List, Dict

import numpy as np
from torch_geometric.data import Dataset

from gnn.data.kernel_graph import KernelGraph
from gnn.data.graph import to_hetero_data

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

NUMERICAL_FEATS = [
    'original_primitive_bitwidth', 'primitive_bitwidth', 
    'latency', 'delay', 'original_dims', 'array_size', 
    'trip_count', 'partition_factor', 'unroll_factor', 
    'achieved_ii_base', 'target_ii', 'callee_size', 
    'num_ops_in_block', 'num_loads_in_block',
    'num_stores_in_block', 'num_allocas_in_block',
    'num_getelementptrs_in_block', 'num_phis_in_block',
    'num_calls_in_block', 'num_ops_in_region',
    'num_loads_in_region', 'num_stores_in_region',
    'num_allocas_in_region', 'num_getelementptrs_in_region',
    'num_phis_in_region', 'num_calls_in_region',
    'num_blocks', 'num_sub_regions'
] + TARGET_AREA_METRICS + [
    f'block_{metric}_sum' for metric in TARGET_AREA_METRICS
] + [
    f'region_{metric}_sum' for metric in TARGET_AREA_METRICS
]

NO_LOG_SCALING_KEYS = ['original_primitive_bitwidth', 'primitive_bitwidth', 'delay']


class HLSDataset(Dataset):
    def __init__(
        self, 
        root: str = "gnn/dataset", 
        target_metric: str = "area",
        mode: str = "train",
        scaling_stats: Optional[Dict[str, Dict[str, float]]] = None,
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

            with open(metrics_path, 'r') as f:
                metrics = json.load(f)

            if not is_valid_report(metrics, self.evaluation_metrics):
                print(f"Skipping {benchmark} (missing metrics in base solution)")
                continue

            target = torch.tensor(
                [float(metrics[key]) for key in self.evaluation_metrics]
            ).log1p().unsqueeze(0)
            
            self.base_targets[benchmark] = target
            self.benchmarks.append(benchmark)

        if not scaling_stats:
            self.scaling_stats = compute_scaling_stats(
                self.full_dataset_dir, benchmarks=self.benchmarks,
            )
        else:
            self.scaling_stats = scaling_stats

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

                target = torch.tensor(
                    [float(metrics[key]) for key in self.evaluation_metrics]
                ).log1p().unsqueeze(0)

                with open(kernel_info_path, 'rb') as f:
                    kernel_info = pickle.load(f)

                self._standardize_features(kernel_info)

                data = to_hetero_data(kernel_info)
                data.y = target
                data.y_base = self.base_targets[benchmark]
                data.solution_index = idx
                data.benchmark = benchmark

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
            
        for nodes in kernel_info.nodes.values():
            for node in nodes:
                for key, value in node.feature_dict.items():
                    if key in self.scaling_stats:
                        mean = self.scaling_stats[key]['mean']
                        std = self.scaling_stats[key]['std']
                        if std < 1e-8:
                            std = 1.0
                        if key not in NO_LOG_SCALING_KEYS:
                            value = log_transform(value)
                        node.feature_dict[key] = scale(value, mean, std)


def compute_scaling_stats(
    dataset_dir: str,
    benchmarks: Optional[Union[str, List[str]]] = None
) -> Dict[str, Dict[str, float]]:
    """Compute statistics (mean and std deviation) for numerical features in the dataset.
    Args:
        dataset_dir (str): Path to the dataset directory.
        benchmarks (Optional[Union[str, List[str]]]): Specific benchmarks to compute stats for.
    Returns:
        Dict[str, Dict[str, float]]: Scaling statistics for each numerical feature.
    """
    numerical_feats = {feat: [] for feat in NUMERICAL_FEATS}

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
                kernel_info: KernelGraph = pickle.load(f)

            for nodes in kernel_info.nodes.values():
                for node in nodes:
                    for key, value in node.feature_dict.items():
                        if 'trip_count' in key:
                            base_key = 'trip_count'
                        elif 'latency' in key:
                            base_key = 'latency'
                        else:
                            base_key = key
                        
                        if base_key in numerical_feats:
                            if 'dims' in base_key:
                                for dim in value:
                                    if dim > 1:
                                        numerical_feats[base_key].append(float(dim))
                            elif float(value) > 1e-8:
                                numerical_feats[base_key].append(float(value))

    scaling_stats = {}
    for key, values in numerical_feats.items():
        if not values:
            scaling_stats[key] = {'mean': 0.0, 'std': 1.0}
            continue

        values_arr = np.array(values, dtype=np.float64)
        if key not in NO_LOG_SCALING_KEYS:
            values_arr = np.log1p(values_arr)

        mean = np.mean(values_arr)
        std = np.std(values_arr)
        if std < 1e-8:
            std = 1.0

        scaling_stats[key] = {'mean': mean, 'std': std}

    if 'latency' in scaling_stats:
        scaling_stats['min_latency'] = scaling_stats['latency']
        scaling_stats['max_latency'] = scaling_stats['latency']
    if 'trip_count' in scaling_stats:
        scaling_stats['min_trip_count'] = scaling_stats['trip_count']
        scaling_stats['max_trip_count'] = scaling_stats['trip_count']

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