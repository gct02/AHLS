import os
import torch
import shutil
import json
import pickle
import math
from typing import Dict

from torch_geometric.data import Dataset

from gnn.data.dataset import (
    TARGET_METRICS, 
    NO_LOG_SCALING_KEYS,
    is_valid_report
)
from gnn.data.kernel_graph import VitisKernelInfo
from gnn.data.graph import to_hetero_data


class HLSFineTuningDataset(Dataset):
    def __init__(
        self, 
        root,
        scaling_stats: Dict[str, Dict[str, float]],
        target_metric: str = "area",
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
        self.scaling_stats = scaling_stats
        self.benchmark = benchmark

        base_solution_dir = os.path.join(self.raw_dir, "solution0")
        if (not os.path.exists(base_solution_dir) or 
            not os.path.isdir(base_solution_dir)):
            raise FileNotFoundError(
                f"Base solution directory {base_solution_dir} "
                f"does not exist or is not a directory."
            )

        base_metrics_path = os.path.join(base_solution_dir, "metrics.json")
        if not os.path.exists(base_metrics_path):
            raise FileNotFoundError(
                f"Base metrics file {base_metrics_path} does not exist."
            )
        
        with open(base_metrics_path, 'r') as f:
            base_metrics = json.load(f)

        if not is_valid_report(base_metrics, self.evaluation_metrics):
            raise ValueError(
                f"Missing or invalid base metrics in {base_metrics_path}."
            )

        self.base_target = torch.tensor(
            [float(base_metrics[key]) for key in self.evaluation_metrics]
        ).log1p().unsqueeze(0)

        self.solution_dirs = []
        self._raw_file_names = []
        self._processed_file_names = []

        for solution in os.listdir(self.raw_dir):
            solution_dir = os.path.join(self.raw_dir, solution)
            if (not os.path.isdir(solution_dir) or
                not solution.startswith("solution")):
                continue

            kernel_info_path = os.path.join(solution_dir, "vitis_kernel_info.pkl")
            if not os.path.exists(kernel_info_path):
                print(f"Deleting {solution} folder (kernel info file not found)")
                shutil.rmtree(solution_dir)
                continue

            metrics_path = os.path.join(solution_dir, "metrics.json")
            if not os.path.exists(metrics_path):
                print(f"Deleting {solution} folder (metrics file not found)")
                shutil.rmtree(solution_dir)
                continue

            with open(metrics_path, 'r') as f:
                metrics = json.load(f)

            if not is_valid_report(metrics, self.evaluation_metrics):
                print(f"Deleting {solution} folder (invalid metrics)")
                shutil.rmtree(solution_dir)
                continue

            self._raw_file_names.append(
                (f"{solution}/graph.json", f"{solution}/metrics.json")
            )
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
            kernel_info_path = os.path.join(solution_dir, "vitis_kernel_info.pkl")
            metrics_path = os.path.join(solution_dir, "metrics.json")
            idx = int(solution_dir.split("solution")[-1])

            with open(metrics_path, 'r') as f:
                metrics = json.load(f)

            target = torch.tensor(
                [float(metrics[key]) for key in self.evaluation_metrics]
            ).log1p().unsqueeze(0)

            with open(kernel_info_path, 'rb') as f:
                kernel_info = pickle.load(f)
            
            self._standardize_features(kernel_info)

            data = to_hetero_data(kernel_info)
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
    
    def _standardize_features(self, kernel_info: VitisKernelInfo):
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
                for key, value in node.attrs.items():
                    if key not in self.scaling_stats:
                        continue
                    mean = self.scaling_stats[key]['mean']
                    std = self.scaling_stats[key]['std']
                    if std < 1e-8:
                        std = 1
                    if key not in NO_LOG_SCALING_KEYS:
                        value = log_transform(value)
                    node.attrs[key] = scale(value, mean, std)

