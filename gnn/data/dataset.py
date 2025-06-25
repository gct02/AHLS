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

from gnn.data.kernel.kernel_info import VitisKernelInfo
from gnn.data.graph import to_hetero_data
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
        log_transform: bool = False,
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
        self.log_transform = log_transform

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
                    benchmarks=self.benchmarks,
                    log_transform=log_transform
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

                if not metrics or not _all_metrics_present(metrics):
                    print(f"Skipping {idx} (missing metrics)")
                    continue

                target = []
                for metric in self.evaluation_metrics:
                    target.append(float(metrics[metric]))
                target = torch.tensor(target).unsqueeze(0)
                if self.log_transform:
                    target = torch.log1p(target)

                with open(kernel_info_path, 'rb') as f:
                    kernel_info: VitisKernelInfo = pickle.load(f)

                if self.standardize:
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
    
    def _standardize_features(self, kernel_info: VitisKernelInfo):
        TO_LOG_TRANSFORM_KEYS = [
            'min_trip_count', 'max_trip_count',
            'min_latency', 'max_latency',
            'num_instrs', 'dims',
            'unroll_factor', 'partition_factor'
        ]
        if self.log_transform:
            TO_LOG_TRANSFORM_KEYS += TARGET_AREA_METRICS

        def log_transform(value):
            if isinstance(value, (list, tuple)):
                return [math.log1p(float(v)) for v in value]
            else:
                return math.log1p(float(value))
            
        def scale(key, value, mean, std):
            if key in TO_LOG_TRANSFORM_KEYS:
                 value = log_transform(value)
            if isinstance(value, (list, tuple)):
                return [(float(v) - mean) / std for v in value]
            else:
                return (float(value) - mean) / std
            
        for nt, nodes in kernel_info.nodes.items():
            for node in nodes:
                for key, value in node.attrs.items():
                    if key not in self.scaling_stats:
                        continue
                    mean = self.scaling_stats[key]['mean']
                    std = self.scaling_stats[key]['std']
                    if std == 0:
                        std = 1
                    node.attrs[key] = scale(key, value, mean, std)


def compute_scaling_stats(
    dataset_dir: str,
    benchmarks: Optional[Union[str, List[str]]] = None,
    log_transform: bool = False
) -> Dict[str, Dict[str, float]]:
    feature_values = {
        'primitive_bitwidth': [],
        'dims': [],
        'delay': [],
        'trip_count': [],
        'latency': [],
        'ii': [],
        'num_instrs': [],
        'unroll_factor': [],
        'partition_factor': [],
        'lut': [], 
        'ff': [], 
        'dsp': [], 
        'bram': []
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
            kernel_info_path = os.path.join(sol_dir, "vitis_kernel_info.pkl")
            if not os.path.exists(kernel_info_path):
                print(f"Skipping {sol} (kernel info file not found)")
                continue

            with open(kernel_info_path, 'rb') as f:
                kernel_info: VitisKernelInfo = pickle.load(f)

            for nt, nodes in kernel_info.nodes.items():
                if nt in ["instr", "port", "const"]:
                    for node in nodes:
                        bitwidth = node.attrs.get('primitive_bitwidth', 0)
                        if bitwidth <= 0:
                            continue
                        feature_values['primitive_bitwidth'].append(bitwidth)

                        if nt == "const" or not node.is_array:
                            continue

                        for dim in node.attrs.get('dims', []):
                            if dim > 1:
                                feature_values['dims'].append(math.log1p(float(dim)))

                        if node.attrs.get('array_partition', 0) == 1:
                            factor = node.attrs.get('partition_factor', 1)
                            if factor > 1:
                                feature_values['partition_factor'].append(
                                    math.log1p(float(factor))
                                )

                        if nt == "instr":
                            delay = node.attrs.get('delay', 0)
                            if delay > 0:
                                feature_values['delay'].append(delay)
                            
                            for area_metric in TARGET_AREA_METRICS:
                                area_value = node.attrs.get(area_metric, 0)
                                if area_value > 0:
                                    area_value = float(area_value)
                                    if log_transform:
                                        area_value = math.log1p(area_value)
                                    feature_values[area_metric].append(area_value)
                elif nt == "region":
                    for node in nodes:
                        min_latency = node.attrs.get('min_latency', 0)
                        if min_latency > 0:
                            feature_values['latency'].append(
                                math.log1p(float(min_latency))
                            )
                        max_latency = node.attrs.get('max_latency', 0)
                        if max_latency > 0:
                            feature_values['latency'].append(
                                math.log1p(float(max_latency))
                            )

                        if node.is_loop:
                            min_trip_count = node.attrs.get('min_trip_count', 0)
                            if min_trip_count > 0:
                                feature_values['trip_count'].append(
                                    math.log1p(float(min_trip_count))
                                )
                            max_trip_count = node.attrs.get('max_trip_count', 0)
                            if max_trip_count > 0:
                                feature_values['trip_count'].append(
                                    math.log1p(float(max_trip_count))
                                )
                            ii = node.attrs.get('ii', 0)
                            if ii > 0:
                                feature_values['ii'].append(ii)
                            if node.attrs.get('unroll', 0) == 1:
                                unroll_factor = node.attrs.get('unroll_factor', 1)
                                if unroll_factor > 1:
                                    feature_values['unroll_factor'].append(
                                        math.log1p(float(unroll_factor))
                                    )
                elif nt == "block":
                    for node in nodes:
                        num_instrs = node.attrs.get('num_instrs', 0)
                        if num_instrs > 0:
                            feature_values['num_instrs'].append(
                                math.log1p(float(num_instrs))
                            )
    
    scaling_stats = {}
    for key, values in feature_values.items():
        if not values:
            continue
        mean = np.mean(values)
        std = np.std(values)
        if std == 0:
            std = 1
        if key in ['latency', 'trip_count']:
            scaling_stats[f"min_{key}"] = {'mean': mean, 'std': std}
            scaling_stats[f"max_{key}"] = {'mean': mean, 'std': std}
        else:
            scaling_stats[key] = {'mean': mean, 'std': std}

    return scaling_stats


def _all_metrics_present(metrics: Dict[str, float]) -> bool:
    for metric in TARGET_AREA_METRICS:
        if metric not in metrics or float(metrics[metric]) < -1e-6:
            return False
    return True