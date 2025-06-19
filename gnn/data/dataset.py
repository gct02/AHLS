import os
import torch
import shutil
import json
import math
from collections import defaultdict
from typing import Union, Optional, List, Dict, Tuple

import numpy as np
from torch import Tensor
from torch_geometric.data import Dataset
from torch_geometric.typing import NodeType

from gnn.data.graph import CDFG
from gnn.data.utils.parsers import METRICS

TARGET_AREA_METRICS = ['lut', 'ff', 'dsp', 'bram']
TARGET_TIMING_METRICS = ['achieved_clk', 'cc']
TARGET_POWER_METRICS = ['dynamic_power', 'static_power']

TARGET_METRICS = {
    'area': TARGET_AREA_METRICS,
    'timing': TARGET_TIMING_METRICS,
    'power': TARGET_POWER_METRICS
}
TARGET_SIZE_PER_TYPE = {
    key: len(value) 
    for key, value in TARGET_METRICS.items()
}


class HLSDataset(Dataset):
    def __init__(
        self, 
        root: str, 
        target_metric: str,
        mode: str = "train",
        standardize: bool = False,
        scaling_stats: Optional[Dict[str, Dict[str, float]]] = None,
        benchmarks: Optional[Union[str, List[str]]] = None,
        apply_log_transform: bool = False,
        **kwargs
    ):
        target_metric = target_metric.lower()
        if target_metric not in TARGET_METRICS:
            raise ValueError(
                f"Invalid target metric '{target_metric}'. "
                f"Available options are: {list(TARGET_METRICS.keys())}"
            )
        self.evaluation_metrics = TARGET_METRICS[target_metric]
        self.full_dataset_dir = os.path.join(root, "full")
        self.root = os.path.join(root, mode)
        self.log_transform = apply_log_transform

        if not benchmarks:
            benchmarks = sorted(os.listdir(self.full_dataset_dir))
        elif not isinstance(benchmarks, list):
            benchmarks = [benchmarks]

        # Filter out unavailable benchmarks
        self.benchmarks = []
        self.base_targets = {}
        for benchmark in benchmarks:
            benchmark_dir = os.path.join(self.full_dataset_dir, benchmark)
            if not os.path.isdir(benchmark_dir):
                print(f"Skipping {benchmark} (directory not found)")
                continue

            base_metrics_path = os.path.join(benchmark_dir, "base_metrics.json")
            if not os.path.exists(base_metrics_path):
                print(f"Skipping {benchmark} (base metrics file not found)")
                continue

            with open(base_metrics_path, 'r') as f:
                base_metrics = json.load(f)

            if not base_metrics or not _all_metrics_present(base_metrics):
                print(f"Skipping {benchmark} (missing metrics in base solution)")
                continue

            base_target = []
            for metric in self.evaluation_metrics:
                base_target.append(float(base_metrics[metric]))
            base_target = torch.tensor(base_target).unsqueeze(0)
            if self.log_transform:
                base_target = torch.log1p(base_target)
            
            self.base_targets[benchmark] = base_target
            self.benchmarks.append(benchmark)

        self.standardize = standardize
        self.scaling_stats = None
        if standardize:
            if not scaling_stats:
                scaling_stats = compute_scaling_stats(
                    self.full_dataset_dir, 
                    benchmarks=self.benchmarks
                )
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
                if not "solution" in solution:
                    continue
                solution_dir = os.path.join(benchmark_dir, solution)
                if os.path.isdir(solution_dir):
                    idx = int(solution.split("solution")[1])
                    solution_dict[idx][benchmark] = solution_dir

        for idx in sorted(solution_dict.keys()):
            solution_dirs = solution_dict[idx]
            if len(solution_dirs) == 0:
                print(f"Skipping {idx} (no solution directories found)")
                continue

            for benchmark, solution_dir in solution_dirs.items():
                graph_path = os.path.join(solution_dir, "graph.json")
                if not os.path.exists(graph_path):
                    print(f"Skipping {idx} (graph file not found)")
                    continue

                metrics_path = os.path.join(solution_dir, "metrics.json")
                if not os.path.exists(metrics_path):
                    print(f"Skipping {idx} (metrics file not found)")
                    continue

                with open(metrics_path, 'r') as f:
                    metrics = json.load(f)

                if not metrics or not _all_metrics_present(metrics):
                    print(f"Skipping {idx} (missing metrics)")
                    continue

                target = []
                for metric in self.evaluation_metrics:
                    target.append(float(metrics[metric]))
                target = torch.tensor(target).unsqueeze(0)
                if self.log_transform:
                    target = torch.log1p(target)

                graph = CDFG.from_json(graph_path)
                if self.standardize:
                    self._standardize_features(graph)

                data = graph.to_pyg_hetero_data()
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
    
    def _standardize_features(self, graph: CDFG):
        def log_transform(value):
            if isinstance(value, (list, tuple)):
                return [math.log1p(float(v)) for v in value]
            else:
                return math.log1p(float(value))
            
        def scale(key, value, mean, std):
            if key in ['dimensions', 'trip_count', 'unroll_factor', 
                       'array_partition_factor']:
                 value = log_transform(value)
            if isinstance(value, (list, tuple)):
                return [(float(v) - mean) / std for v in value]
            else:
                return (float(value) - mean) / std
            
        for nt in ['var', 'const', 'region']:
            if nt not in graph.nodes:
                continue
            for node in graph.nodes[nt]:
                for key, value in node.feature_dict.items():
                    if key not in self.scaling_stats:
                        continue
                    mean = self.scaling_stats[key]['mean']
                    std = self.scaling_stats[key]['std']
                    if std == 0:
                        std = 1
                    node.feature_dict[key] = scale(key, value, mean, std)


def compute_scaling_stats(
    dataset_dir: str,
    benchmarks: Optional[Union[str, List[str]]] = None
) -> Dict[str, Dict[str, float]]:
    feature_values = {
        'primitive_bitwidth': [],
        'dimensions': [],
        'trip_count': [],
        'unroll_factor': [],
        'array_partition_factor': []
    }
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
            graph_path = os.path.join(sol_dir, "graph.json")
            if not os.path.exists(graph_path):
                print(f"Skipping {sol} (graph file not found)")
                continue

            graph = CDFG.from_json(graph_path)
            for nt, nodes in graph.nodes.items():
                if nt in ["var", "const"]:
                    for node in nodes:
                        primitive_bitwidth = node.feature_dict.get('primitive_bitwidth', 0)
                        if primitive_bitwidth <= 0:
                            continue
                        feature_values['primitive_bitwidth'].append(primitive_bitwidth)
                        if node.feature_dict.get('is_array', 0) == 0:
                            continue
                        for dim in node.feature_dict.get('dimensions', []):
                            if dim > 1:
                                feature_values['dimensions'].append(math.log1p(float(dim)))
                        if node.feature_dict.get('array_partition', 0) == 1:
                            factor = node.feature_dict.get('array_partition_factor', 1)
                            if factor > 1:
                                feature_values['array_partition_factor'].append(
                                    math.log1p(float(factor))
                                )

                elif nt == "region" and node.feature_dict.get('is_loop', 0) == 1:
                    trip_count = node.feature_dict.get('trip_count', 0)
                    if trip_count > 0:
                        feature_values['trip_count'].append(math.log1p(trip_count))
                    if node.feature_dict.get('unroll', 0) == 1:
                        factor = node.feature_dict.get('unroll_factor', 1)
                        if factor > 1:
                            feature_values['unroll_factor'].append(
                                math.log1p(float(factor))
                            )
    scaling_stats = {}
    for key, values in feature_values.items():
        if not values:
            continue
        mean = np.mean(values)
        std = np.std(values)
        if std == 0:
            std = 1
        scaling_stats[key] = {'mean': mean, 'std': std}

    return scaling_stats


def _compute_feature_ranges(
    dataset_dir: str,
    benchmarks: Optional[Union[str, List[str]]] = None
) -> Dict[NodeType, Tuple[Tensor, Tensor]]:
    if benchmarks is None:
        benchmarks = sorted(os.listdir(dataset_dir))
    elif isinstance(benchmarks, str):
        benchmarks = [benchmarks]

    feat_ranges = {}
    for bench in benchmarks:
        bench_dir = os.path.join(dataset_dir, bench)
        if not os.path.isdir(bench_dir):
            print(f"Skipping {bench} (directory not found)")
            continue

        solutions = [s for s in os.listdir(bench_dir) if "solution" in s]
        solutions = sorted(solutions, key=lambda s: int(s.split("solution")[1]))

        for sol in solutions:
            sol_dir = os.path.join(bench_dir, sol)
            graph_path = os.path.join(sol_dir, "graph.pt")
            if not os.path.exists(graph_path):
                print(f"Skipping {sol} (graph file not found)")
                continue

            metrics_path = os.path.join(sol_dir, "metrics.json")
            if not os.path.exists(metrics_path):
                print(f"Skipping {sol} (metrics file not found)")
                continue

            with open(metrics_path, 'r') as f:
                metrics = json.load(f)

            if not metrics or not _all_metrics_present(metrics):
                print(f"Skipping {sol} (missing metrics)")
                continue

            data = torch.load(graph_path)

            for nt, x in data.x_dict.items():
                if x.size(0) == 0:
                    continue
                mins = torch.min(x, dim=0).values
                maxs = torch.max(x, dim=0).values
                if nt not in feat_ranges:
                    feat_ranges[nt] = (mins, maxs)
                else:
                    ranges = feat_ranges[nt]
                    feat_ranges[nt] = (
                        torch.minimum(ranges[0], mins), 
                        torch.maximum(ranges[1], maxs)
                    )

    return feat_ranges


def _all_metrics_present(metrics: Dict[str, float]) -> bool:
    for metric in METRICS:
        if metric not in metrics or float(metrics[metric]) < -1e-6:
            return False
    return True