import os
import torch
import shutil
import json
import pickle
import math
from collections import defaultdict
from typing import Union, Optional, List, Dict

import numpy as np

from torch_geometric.data import Dataset, Data

from estimators.area.graph import (
    NO_LOG_SCALING_KEYS,
    KernelGraph,
    compute_scaling_stats
)
from estimators.common.parsers import AREA_METRICS

NUM_TARGETS = len(AREA_METRICS)

StatsDict = Dict[str, Dict[str, float]]


class HLSDataset(Dataset):
    def __init__(
        self, 
        root: str = "estimators/area/dataset", 
        mode: str = "train",
        benchmarks: Optional[Union[str, List[str]]] = None,
        scaling_stats: Optional[StatsDict] = None,
        target_scaling_stats: Optional[StatsDict] = None,
        base_target_scaling_stats: Optional[StatsDict] = None,
        **kwargs
    ):
        self.full_dataset_dir = os.path.join(root, "full")
        self.root = os.path.join(root, mode)

        if not benchmarks:
            benchmarks = sorted(os.listdir(self.full_dataset_dir))
        elif not isinstance(benchmarks, list):
            benchmarks = [benchmarks]

        base_graphs = {}
        self.base_targets = {}
        self.benchmarks = []

        base_target_dict = {key: [] for key in AREA_METRICS}

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

            graph_path = os.path.join(benchmark_dir, "base_graph.pkl")
            if not os.path.exists(graph_path):
                print(f"Skipping {benchmark} (kernel info file not found)")
                continue

            with open(metrics_path, 'r') as f:
                metrics = json.load(f)

            if any(metrics.get(key, -1) < 0 for key in AREA_METRICS):
                print(f"Skipping {benchmark} (missing metrics in base solution)")
                continue

            with open(graph_path, 'rb') as f:
                graph = pickle.load(f)

            self.base_targets[benchmark] = []
            base_graphs[benchmark] = graph
            self.benchmarks.append(benchmark)

            for key in AREA_METRICS:
                value = math.log1p(float(metrics[key]))
                base_target_dict[key].append(value)
                self.base_targets[benchmark].append(value)

        if not scaling_stats:
            self.scaling_stats = compute_scaling_stats(list(base_graphs.values()))
            dct_scaling_stats = compute_dct_scaling_stats(
                self.full_dataset_dir, benchmarks=self.benchmarks
            )
            self.scaling_stats.update(dct_scaling_stats)
        else:
            self.scaling_stats = scaling_stats

        if not target_scaling_stats:
            self.target_scaling_stats = compute_target_scaling_stats(
                self.full_dataset_dir, benchmarks=self.benchmarks
            )
        else:
            self.target_scaling_stats = target_scaling_stats

        if not base_target_scaling_stats:
            self.base_target_scaling_stats = compute_base_target_scaling_stats(
                base_target_dict, log_transform=False
            )
        else:
            self.base_target_scaling_stats = base_target_scaling_stats
        
        # Standardize base targets
        for bench, base_target in self.base_targets.items():
            target = []
            for key, value in zip(AREA_METRICS, base_target):
                mean = self.base_target_scaling_stats[key]['mean']
                std = self.base_target_scaling_stats[key]['std']
                value = (value - mean) / std
                target.append(value)

            self.base_targets[bench] = torch.tensor(target, dtype=torch.float32).unsqueeze(0)

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
                graph_path = os.path.join(solution_dir, "graph.pkl")
                if not os.path.exists(graph_path):
                    print(f"Skipping {idx} (kernel info file not found)")
                    continue

                metrics_path = os.path.join(solution_dir, "metrics.json")
                if not os.path.exists(metrics_path):
                    print(f"Skipping {idx} (metrics file not found)")
                    continue

                with open(metrics_path, 'r') as f:
                    metrics = json.load(f)

                if any(metrics.get(key, -1) < 0 for key in AREA_METRICS):
                    print(f"Skipping {idx} (missing metrics)")
                    continue

                target = []
                original_target = []
                for key in AREA_METRICS:
                    mean = self.target_scaling_stats[key]['mean']
                    std = self.target_scaling_stats[key]['std']
                    value = float(metrics[key])
                    original_target.append(value)
                    value = (math.log1p(value) - mean) / std
                    target.append(value)

                target = torch.tensor(target, dtype=torch.float32).unsqueeze(0)
                original_target = torch.tensor(original_target, dtype=torch.float32).unsqueeze(0)

                with open(graph_path, 'rb') as f:
                    graph = pickle.load(f)

                self._standardize_features(graph)

                node_id_map = {node_id: i for i, node_id in enumerate(graph.nodes.keys())}

                xs = [None] * len(node_id_map)
                for node_id, node in graph.nodes.items():
                    if len(node.get_homogeneous_features()) > 200:
                        print(node_id)
                    xs[node_id_map[node_id]] = torch.tensor(node.get_homogeneous_features(), dtype=torch.float32)

                edge_indices = []
                edge_attrs = []
                for edge in graph.edges.values():
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
                    if key not in NO_LOG_SCALING_KEYS:
                        value = log_transform(value)
                    node.feature_dict[key] = scale(value, mean, std)


def compute_base_target_scaling_stats(
    base_targets: Dict[str, List[float]],
    log_transform: bool = True
) -> StatsDict:
    scaling_stats = {}
    for key in AREA_METRICS:
        if not base_targets[key]:
            scaling_stats[key] = {'mean': 0.0, 'std': 1.0}
            continue

        values = np.array(base_targets[key], dtype=np.float64)
        if log_transform:
            values = np.log1p(values)
        mean = np.mean(values)
        std = np.std(values)
        if std < 1e-8:
            std = 1.0
        scaling_stats[key] = {'mean': mean, 'std': std}

    return scaling_stats


def compute_target_scaling_stats(
    dataset_dir: str,
    benchmarks: Optional[Union[str, List[str]]] = None,
    log_transform: bool = True
) -> StatsDict:
    targets = {key: [] for key in AREA_METRICS}

    if benchmarks is None:
        benchmarks = sorted(os.listdir(dataset_dir))
    elif isinstance(benchmarks, str):
        benchmarks = [benchmarks]

    for bench in benchmarks:
        bench_dir = os.path.join(dataset_dir, bench)
        if not os.path.isdir(bench_dir):
            print(f"Skipping {bench} (directory not found)")
            continue

        for sol in os.listdir(bench_dir):
            sol_dir = os.path.join(bench_dir, sol)
            if not os.path.isdir(sol_dir) or not sol.startswith("solution"):
                continue

            metrics_path = os.path.join(sol_dir, "metrics.json")
            if not os.path.exists(metrics_path):
                print(f"Skipping {sol} (metrics file not found)")
                continue

            with open(metrics_path, 'r') as f:
                metrics = json.load(f)

            if any(metrics.get(key, -1) < 0 for key in AREA_METRICS):
                print(f"Skipping {sol} (missing metrics in solution)")
                continue

            for key in AREA_METRICS:
                targets[key].append(float(metrics[key]))

    scaling_stats = {}
    for key in AREA_METRICS:
        if not targets[key]:
            scaling_stats[key] = {'mean': 0.0, 'std': 1.0}
        else:
            values = np.array(targets[key], dtype=np.float64)
            if log_transform:
                values = np.log1p(values)
            mean = np.mean(values)
            std = np.std(values)
            if std < 1e-8:
                std = 1.0
            scaling_stats[key] = {'mean': mean, 'std': std}

    return scaling_stats


def compute_dct_scaling_stats(
    dataset_dir: str,
    benchmarks: Optional[Union[str, List[str]]] = None
) -> StatsDict:
    numerical_feats = {feat: [] for feat in ['unroll_factor', 'partition_factor']}
    
    if benchmarks is None:
        benchmarks = sorted(os.listdir(dataset_dir))
    elif isinstance(benchmarks, str):
        benchmarks = [benchmarks]

    for bench in benchmarks:
        bench_dir = os.path.join(dataset_dir, bench)
        if not os.path.isdir(bench_dir):
            print(f"Skipping {bench} (directory not found)")
            continue

        for sol in os.listdir(bench_dir):
            sol_dir = os.path.join(bench_dir, sol)
            if not os.path.isdir(sol_dir) or not sol.startswith("solution"):
                continue

            graph_path = os.path.join(sol_dir, "graph.pkl")
            if not os.path.exists(graph_path):
                print(f"Skipping {sol} (kernel info file not found)")
                continue

            with open(graph_path, 'rb') as f:
                kernel_info = pickle.load(f)

            for node in kernel_info.nodes.values():
                if node.node_type == 'region' and node.is_loop:
                    unroll_factor = float(node.feature_dict.get('unroll_factor', 0))
                    numerical_feats['unroll_factor'].append(unroll_factor)
                elif node.node_type in ['internal_mem', 'port'] and node.is_array:
                    partition_factor = float(node.feature_dict.get('partition_factor', 0))
                    numerical_feats['partition_factor'].append(partition_factor)

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
