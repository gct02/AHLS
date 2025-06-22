import os
import torch
import shutil
import json
import math
from typing import Optional, Dict

from torch_geometric.data import Dataset

from gnn.data.graph import CDFG
from gnn.data.dataset import TARGET_METRICS
from gnn.data.utils.parsers import METRICS


class HLSFineTuningDataset(Dataset):
    def __init__(
        self, 
        root: str, 
        target_metric: str,
        standardize: bool = False,
        scaling_stats: Optional[Dict[str, Dict[str, float]]] = None,
        apply_log_transform: bool = False,
        benchmark: str = "",
        **kwargs
    ):
        target_metric = target_metric.lower()
        if target_metric not in TARGET_METRICS:
            raise ValueError(
                f"Invalid target metric '{target_metric}'. "
                f"Available options are: {list(TARGET_METRICS.keys())}"
            )
        self.evaluation_metrics = TARGET_METRICS[target_metric]
        self.root = root
        self.log_transform = apply_log_transform
        self.standardize = standardize
        self.scaling_stats = scaling_stats
        self.benchmark = benchmark

        # Filter out unavailable benchmarks
        base_metrics_path = os.path.join(self.raw_dir, "base_metrics.json")
        if not os.path.exists(base_metrics_path):
            raise FileNotFoundError(
                f"Base metrics file {base_metrics_path} does not exist."
            )
        
        with open(base_metrics_path, 'r') as f:
            base_metrics = json.load(f)

        if not base_metrics or not _all_metrics_present(base_metrics):
            raise ValueError(
                f"Missing or invalid base metrics in {base_metrics_path}."
            )

        self.base_target = []
        for metric in self.evaluation_metrics:
            self.base_target.append(float(base_metrics[metric]))
        self.base_target = torch.tensor(self.base_target).unsqueeze(0)
        if self.log_transform:
            self.base_target = torch.log1p(self.base_target)

        self.solution_dirs = []
        self._raw_file_names = []
        self._processed_file_names = []

        for solution in os.listdir(self.raw_dir):
            if not solution.startswith("solution"):
                continue
            solution_dir = os.path.join(self.raw_dir, solution)
            if not os.path.isdir(solution_dir):
                continue

            graph_path = os.path.join(solution_dir, "graph.json")
            if not os.path.exists(graph_path):
                print(f"Deleting {solution} folder (graph file not found)")
                shutil.rmtree(solution_dir)
                continue

            metrics_path = os.path.join(solution_dir, "metrics.json")
            if not os.path.exists(metrics_path):
                print(f"Deleting {solution} folder (metrics file not found)")
                shutil.rmtree(solution_dir)
                continue

            with open(metrics_path, 'r') as f:
                metrics = json.load(f)

            if not metrics or not _all_metrics_present(metrics):
                print(f"Skipping {solution} (missing metrics)")
                continue

            self._raw_file_names.append((f"{solution}/graph.json",
                                         f"{solution}/metrics.json"))
            self.solution_dirs.append(solution_dir)

        super(HLSFineTuningDataset, self).__init__(self.root, **kwargs)
    
    @property
    def raw_file_names(self):
        return self._raw_file_names
    
    @property
    def processed_file_names(self):
        return self._processed_file_names
    
    def process(self):
        if not os.path.exists(self.raw_dir):
            raise FileNotFoundError(
                f"Raw dataset directory {self.raw_dir} does not exist."
            )
        if os.path.exists(self.processed_dir):
            shutil.rmtree(self.processed_dir)
        os.makedirs(self.processed_dir)

        for solution_dir in self.solution_dirs:
            graph_path = os.path.join(solution_dir, "graph.json")
            metrics_path = os.path.join(solution_dir, "metrics.json")
            idx = int(solution_dir.split("solution")[-1])

            with open(metrics_path, 'r') as f:
                metrics = json.load(f)

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
            data.y_base = self.base_target
            data.solution_index = idx
            data.benchmark = self.benchmark

            output_path = os.path.join(self.processed_dir, f"{self.benchmark}_{idx}.pt")
            torch.save(data, output_path)
            self._processed_file_names.append(f"{self.benchmark}_{idx}.pt")

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


def _all_metrics_present(metrics: Dict[str, float]) -> bool:
    for metric in METRICS:
        if metric not in metrics or float(metrics[metric]) < -1e-6:
            return False
    return True