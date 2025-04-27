import os
import torch
import shutil
import json
from collections import defaultdict
from typing import Union, Optional, List, Dict, Tuple

from torch import Tensor
from torch_geometric.data import Dataset, HeteroData
from torch_geometric.typing import NodeType


class HLSDataset(Dataset):
    def __init__(
        self, root: str, metric: str,
        mode: str = "train",
        scale_features: bool = False,
        feature_ranges: Optional[Dict[NodeType, Tuple[Tensor, Tensor]]] = None,
        benchmarks: Optional[Union[str, List[str]]] = None,
        separate: bool = True,
        log_transform: bool = False,
        **kwargs
    ):
        self._true_root = root
        self._full_dir = os.path.join(root, "full")
        self._metric = metric
        self._separate = separate

        self.log_transform = log_transform

        self.root = os.path.join(root, mode)

        if not benchmarks:
            benchmarks = sorted(os.listdir(self._full_dir))
        elif not isinstance(benchmarks, list):
            benchmarks = [benchmarks]

        # Filter out unavailable benchmarks
        self.benchmarks = []
        self.base_targets = {}
        for benchmark in benchmarks:
            benchmark_dir = os.path.join(self._full_dir, benchmark)
            if not os.path.isdir(benchmark_dir):
                print(f"Skipping {benchmark} (directory not found)")
                continue

            base_metrics_path = os.path.join(benchmark_dir, "base_metrics.json")
            if not os.path.exists(base_metrics_path):
                print(f"Skipping {benchmark} (base metrics file not found)")
                continue

            with open(base_metrics_path, 'r') as f:
                base_metrics = json.load(f)

            if not base_metrics:
                print(f"Skipping {benchmark} (base metrics file is empty)")
                continue

            if (base_target := float(base_metrics.get(self._metric, -1.0))) < 0:
                print(f"Skipping {benchmark} (base target value not found)")
                continue
            
            self.benchmarks.append(benchmark)
            self.base_targets[benchmark] = base_target

        if scale_features:
            if not feature_ranges:
                self.feature_ranges = _compute_feature_ranges(
                    self._full_dir, metric, self.benchmarks
                )
            else:
                self.feature_ranges = feature_ranges
        else:
            self.feature_ranges = None

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
        if not self._separate:
            return
        if not os.path.exists(self._full_dir):
            raise FileNotFoundError(
                f"Directory {self._full_dir} does not exist."
            )
        if os.path.exists(self.raw_dir):
            shutil.rmtree(self.raw_dir)
        os.makedirs(self.raw_dir)
            
        for bench in self.benchmarks:
            src = os.path.join(self._full_dir, bench)
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
                graph_path = os.path.join(solution_dir, "graph.pt")
                if not os.path.exists(graph_path):
                    print(f"Skipping {idx} (graph file not found)")
                    continue

                metrics_path = os.path.join(solution_dir, "metrics.json")
                if not os.path.exists(metrics_path):
                    print(f"Skipping {idx} (metrics file not found)")
                    continue

                with open(metrics_path, 'r') as f:
                    metrics = json.load(f)

                target = float(metrics.get(self._metric, -1.0)) if metrics else -1.0
                if target < 0:
                    print(f"Skipping {idx} (target value not found)")
                    continue

                data = torch.load(graph_path)

                data.y = torch.tensor([target])
                data.y_base = torch.tensor([self.base_targets[benchmark]]).unsqueeze(0)
                if self.log_transform:
                    data.y = torch.log1p(data.y)
                    data.y_base = torch.log1p(data.y_base)

                data.solution_index = idx
                data.benchmark = benchmark

                if self.feature_ranges is not None:
                    data = self._scale_features(data)

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
    
    def _scale_features(self, data: HeteroData) -> HeteroData:
        for nt, x in data.x_dict.items():
            if x.size(0) == 0:
                continue
            mins, maxs = self.feature_ranges[nt]
            diffs = maxs - mins
            diffs[diffs == 0] = 1
            data.x_dict[nt] = (x - mins) / diffs
        return data


def _compute_feature_ranges(
    dataset_dir: str, metric: str,
    benchmarks: Optional[Union[str, List[str]]] = None
) -> Dict[NodeType, Dict[NodeType, Tuple[Tensor, Tensor]]]:
    if benchmarks is None:
        benchmarks = sorted(os.listdir(dataset_dir))
    elif isinstance(benchmarks, str):
        benchmarks = [benchmarks]

    feature_ranges = {}
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

            target = float(metrics.get(metric, -1.0)) if metrics else -1.0
            if target < 0:
                print(f"Skipping {sol} (target value not found)")
                continue

            data = torch.load(graph_path)

            for nt, x in data.x_dict.items():
                if x.size(0) == 0:
                    continue
                mins = torch.min(x, dim=0).values
                maxs = torch.max(x, dim=0).values
                if nt not in feature_ranges:
                    feature_ranges[nt] = [mins, maxs]
                else:
                    ranges = feature_ranges[nt]
                    feature_ranges[nt][0] = torch.minimum(ranges[0], mins)
                    feature_ranges[nt][1] = torch.maximum(ranges[1], maxs)

    for nt, (mins, maxs) in feature_ranges.items():
        feature_ranges[nt] = (mins, maxs)

    return feature_ranges