import os
import torch
import shutil
import json
from typing import Union, Optional, List, Dict

from torch import Tensor
from torch_geometric.data import Dataset, HeteroData
from torch_geometric.typing import NodeType


def extract_feature_boundaries(
    dataset_dir: str, 
    benchmarks: Optional[Union[str, List[str]]] = None
) -> Dict[NodeType, Dict[str, Tensor]]:
    bounds = {}

    if benchmarks is None:
        benchmarks = sorted(os.listdir(dataset_dir))
    elif isinstance(benchmarks, str):
        benchmarks = [benchmarks]

    for bench in benchmarks:
        bench_dir = os.path.join(dataset_dir, bench)
        if not os.path.isdir(bench_dir):
            print(f"Skipping {bench} (directory not found)")
            continue

        solutions = os.listdir(bench_dir)
        solutions = [s for s in solutions if "solution" in s]
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

            if not metrics:
                print(f"Skipping {sol} (metrics file empty)")
                continue

            data = torch.load(graph_path)

            for nt, x in data.x_dict.items():
                if x.size(0) == 0:
                    continue

                min = torch.min(x, dim=0).values
                max = torch.max(x, dim=0).values
                if nt not in bounds:
                    bounds[nt] = {"min": min, "max": max}
                    continue

                bounds[nt]["min"] = torch.minimum(bounds[nt]["min"], min)
                bounds[nt]["max"] = torch.maximum(bounds[nt]["max"], max)

    return bounds


class HLSDataset(Dataset):
    def __init__(
        self, 
        root: str, 
        metric: str,
        mode: str = "train",
        scale_features: bool = False,
        feature_bounds: Optional[Dict[NodeType, Dict[str, Tensor]]] = None,
        benchmarks: Optional[Union[str, List[str]]] = None,
        separate: bool = True,
        **kwargs
    ):
        self._true_root = root
        self._full_dir = os.path.join(root, "full")
        self._metric = metric

        self.root = os.path.join(root, mode)

        self._separate = separate
        if not benchmarks:
            self.benchmarks = sorted(os.listdir(self._full_dir))
        elif not isinstance(benchmarks, list):
            self.benchmarks = [benchmarks]
        else:
            self.benchmarks = benchmarks

        if scale_features:
            if feature_bounds is None:
                self.feature_bounds = extract_feature_boundaries(self._full_dir, self.benchmarks)
            else:
                self.feature_bounds = feature_bounds
        else:
            self.feature_bounds = None

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
            raise FileNotFoundError(f"Directory {self._full_dir} does not exist.")
        
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

        for bench in self.benchmarks:
            bench_dir = os.path.join(self.raw_dir, bench)
            if not os.path.isdir(bench_dir):
                print(f"Skipping {bench} (directory not found)")
                continue

            base_metrics_path = os.path.join(bench_dir, "base_metrics.json")
            if not os.path.exists(base_metrics_path):
                print(f"Skipping {bench} (base metrics file not found)")
                continue

            with open(base_metrics_path, 'r') as f:
                base_metrics = json.load(f)

            base_target = float(base_metrics.get(self._metric, -1.0)) if base_metrics else -1.0
            if base_target < 0:
                print(f"Skipping {bench} (base target value not found)")
                continue

            solutions = os.listdir(bench_dir)
            solutions = [s for s in solutions if "solution" in s]
            solutions = sorted(solutions, key=lambda s: int(s.split("solution")[1]))

            for sol in solutions:
                sol_dir = os.path.join(bench_dir, sol)
                if not os.path.isdir(sol_dir):
                    print(f"Skipping {sol} (directory not found)")
                    continue

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

                target = float(metrics.get(self._metric, -1.0)) if metrics else -1.0
                if target < 0:
                    print(f"Skipping {sol} (target value not found)")
                    continue

                data = torch.load(graph_path)

                data.y = torch.tensor([target])
                data.y_base = torch.tensor([base_target])

                if self.feature_bounds is not None:
                    data = self._scale_features(data)

                output_path = os.path.join(self.processed_dir, f"{bench}_{sol}.pt")
                torch.save(data, output_path)

                self._processed_file_names.append(f"{bench}_{sol}.pt")
                self._raw_file_names.append(
                    (f"{bench}/{sol}/graph.pt", f"{bench}/{sol}/metrics.txt")
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

            min = self.feature_bounds[nt]["min"]
            max = self.feature_bounds[nt]["max"]
            range = max - min
            range[range == 0] = 1

            data.x_dict[nt] = (x - min) / range

        return data
