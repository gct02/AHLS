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
    if benchmarks is None:
        benchmarks = sorted(os.listdir(dataset_dir))
    elif isinstance(benchmarks, str):
        benchmarks = [benchmarks]

    feature_bounds = {}
    
    for bench in benchmarks:
        bench_dir = os.path.join(dataset_dir, bench)
        if not os.path.isdir(bench_dir):
            print(f"Skipping {bench} (directory not found)")
            continue

        solutions = os.listdir(bench_dir)
        solutions = sorted(solutions, key=lambda s: int(s.split("solution")[1]))
        for sol in solutions:
            sol_dir = os.path.join(bench_dir, sol)
            graph_path = os.path.join(sol_dir, "graph.pt")
            if not os.path.exists(graph_path):
                print(f"Skipping {sol} (graph file not found)")
                continue

            graph = torch.load(graph_path)
            for nt, node_features in graph.x_dict.items():
                if node_features.size(0) == 0:
                    continue
                min_values = torch.min(node_features, dim=0).values
                max_values = torch.max(node_features, dim=0).values
                if nt not in feature_bounds:
                    feature_bounds[nt] = {"min": min_values, "max": max_values}
                else:
                    feature_bounds[nt]["min"] = torch.minimum(
                        feature_bounds[nt]["min"], min_values
                    )
                    feature_bounds[nt]["max"] = torch.maximum(
                        feature_bounds[nt]["max"], max_values
                    )

    return feature_bounds


class HLSDataset(Dataset):
    def __init__(
        self, 
        root: str, 
        metric: str,
        scale_features: bool = False,
        feature_bounds: Optional[Dict[NodeType, Dict[str, Tensor]]] = None,
        separate: bool = False,
        full_data_dir: Optional[str] = None,
        benchmarks: Optional[Union[str, List[str]]] = None,
        **kwargs
    ):
        self.root = root
        self.raw_dir = os.path.join(root, "raw")
        self.processed_dir = os.path.join(root, "processed")
        self.full_data_dir = full_data_dir if separate else None
        self.metric = metric
        
        if full_data_dir is not None:
            if benchmarks is None:
                self.benchmarks = sorted(os.listdir(self.full_data_dir))
            elif not isinstance(benchmarks, list):
                self.benchmarks = [benchmarks]
            else:
                self.benchmarks = benchmarks
        else:
            self.benchmarks = None

        if separate and (self.full_data_dir is None or self.benchmarks is None):
            raise ValueError(
                "To separate the data, `full_data_dir` and `benchmarks` "
                "must be provided."
            )

        if scale_features:
            if feature_bounds is None:
                self.feature_bounds = extract_feature_boundaries(
                    self.full_data_dir, self.benchmarks
                )
            else:
                self.feature_bounds = feature_bounds
        else:
            self.feature_bounds = None

        self._raw_file_names = []
        self._processed_file_names = []

        super(HLSDataset, self).__init__(root, **kwargs)
    
    @property
    def raw_file_names(self):
        return self._raw_file_names
    
    @property
    def processed_file_names(self):
        return self._processed_file_names
    
    def download(self):
        if not self.full_data_dir or not self.benchmarks:
            return
        if not os.path.exists(self.full_data_dir):
            raise FileNotFoundError(
                f"Full dataset directory {self.full_data_dir} does not exist."
            )
        if os.path.exists(self.raw_dir):
            shutil.rmtree(self.raw_dir)
            os.makedirs(self.raw_dir)
        
        for bench in self.benchmarks:
            src = os.path.join(self.full_data_dir, bench)
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

            solutions = os.listdir(bench_dir)
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

                if metrics and (target := metrics.get(self.metric)) is not None:
                    target = float(target)
                    
                if target is None or target == -1:
                    print(f"Skipping {sol} (target value not found)")
                    continue

                graph = torch.load(graph_path)
                graph.y = torch.tensor([target])
                if self.feature_bounds is not None:
                    graph = self._scale_graph_features(graph)

                out_path = os.path.join(self.processed_dir, f"{bench}_{sol}.pt")
                torch.save(graph, out_path)

                self._processed_file_names.append(f"{bench}_{sol}.pt")
                self._raw_file_names.append(
                    (f"{bench}/{sol}/graph.pt", f"{bench}/{sol}/metrics.txt")
                )

    def len(self):
        return len(self.processed_paths)

    def get(self, ind):
        data = torch.load(self.processed_paths[ind])
        return data 
    
    def _scale_graph_features(self, graph: HeteroData) -> HeteroData:
        for nt, node_features in graph.x_dict.items():
            if node_features.size(0) == 0:
                continue
            min_values = self.feature_bounds[nt]["min"]
            max_values = self.feature_bounds[nt]["max"]
            ranges = max_values - min_values
            ranges[ranges == 0] = 1
            graph.x_dict[nt] = (node_features - min_values) / ranges
        return graph
