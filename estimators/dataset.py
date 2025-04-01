import os
import torch
import shutil
import json
from typing import Union, Optional, List, Dict

from torch import Tensor
from torch_geometric.data import Dataset, HeteroData
from torch_geometric.typing import NodeType


def compute_min_max(
    dataset_dir: str, benchmarks: Optional[Union[str, List[str]]] = None
) -> Dict[NodeType, Dict[str, Tensor]]:
    feature_min_max = {}
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
                mins = torch.min(node_features, dim=0).values
                maxs = torch.max(node_features, dim=0).values
                if nt not in feature_min_max:
                    feature_min_max[nt] = {"min": mins, "max": maxs}
                else:
                    feature_min_max[nt]["min"] = torch.minimum(
                        feature_min_max[nt]["min"], mins
                    )
                    feature_min_max[nt]["max"] = torch.maximum(
                        feature_min_max[nt]["max"], maxs
                    )

    return feature_min_max


class HLSDataset(Dataset):
    def __init__(
        self, root: str, metric: str,
        split_data: bool = False,
        source_data_dir: Optional[str] = None,
        benchmarks: Optional[Union[str, List[str]]] = None,
        normalize: bool = False,
        feature_range: Optional[Dict[NodeType, Dict[str, Tensor]]] = None,
        **kwargs
    ):
        self.root = root
        self.metric = metric
        self.split_data = split_data
        self.source_data_dir = source_data_dir if source_data_dir else root
        self.normalize = normalize
            
        if benchmarks is None:
            self.benchmarks = sorted(os.listdir(self.source_data_dir))
        elif isinstance(benchmarks, str):
            self.benchmarks = [benchmarks]
        else:
            self.benchmarks = benchmarks

        if normalize and feature_range is None:
            self.feature_range = compute_min_max(
                self.source_data_dir, self.benchmarks
            )
        else:
            self.feature_range = feature_range

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
        if not self.split_data:
            return
        if not os.path.exists(self.source_data_dir):
            raise FileNotFoundError(
                f"Source dataset directory {self.source_data_dir} does not exist."
            )
        if os.path.exists(self.raw_dir):
            shutil.rmtree(self.raw_dir)
            os.makedirs(self.raw_dir)
        
        for bench in self.benchmarks:
            src = os.path.join(self.source_data_dir, bench)
            dst = os.path.join(self.raw_dir, bench)
            shutil.copytree(src, dst)
    
    def process(self):
        if not os.path.exists(self.raw_dir):
            raise FileNotFoundError(
                f"Raw directory {self.raw_dir} does not exist."
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
                graph_path = os.path.join(sol_dir, "graph.pt")
                metrics_path = os.path.join(sol_dir, "metrics.json")

                if not os.path.exists(graph_path) or not os.path.exists(metrics_path):
                    print(f"Skipping {sol} (graph or metrics file not found)")
                    continue

                target_value = self._get_target_value(metrics_path)
                if target_value is None:
                    print(f"Skipping {sol} (target value not found)")
                    continue

                graph = torch.load(graph_path)
                graph.y = torch.tensor([target_value])

                if self.normalize:
                    graph = self._normalize(graph)

                output_path = os.path.join(self.processed_dir, f"{bench}_{sol}.pt")
                torch.save(graph, output_path)

                self._processed_file_names.append(f"{bench}_{sol}.pt")
                self._raw_file_names.append(
                    (f"{bench}/{sol}/graph.pt", f"{bench}/{sol}/metrics.txt")
                )

    def len(self):
        return len(self.processed_paths)

    def get(self, ind):
        data = torch.load(self.processed_paths[ind])
        return data 
    
    def _normalize(self, graph: HeteroData) -> HeteroData:
        for nt, node_features in graph.x_dict.items():
            mins = self.feature_range[nt]["min"]
            maxs = self.feature_range[nt]["max"]
            ranges = maxs - mins
            ranges[ranges == 0] = 1
            graph.x_dict[nt] = (node_features - mins) / ranges
        return graph
    
    def _get_target_value(self, metrics_path: str) -> Optional[float]:
        with open(metrics_path, 'r') as f:
            metrics = json.load(f)
            if metrics and self.metric in metrics:
                return float(metrics[self.metric])
        return None