import os
import torch
import shutil
import json
import pickle
import math

from torch_geometric.data import Dataset, Data

from gnn.data.dataset import (
    StatsDict,
    KernelGraph,
    TARGET_METRICS, 
    NO_LOG_SCALING_KEYS,
    is_valid_report
)


class HLSFineTuningDataset(Dataset):
    def __init__(
        self, 
        root,
        scaling_stats: StatsDict,
        base_target_scaling_stats: StatsDict,
        target_scaling_stats: StatsDict,
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
        self.base_target_scaling_stats = base_target_scaling_stats
        self.target_scaling_stats = target_scaling_stats
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

        self.base_targets = []
        for key, value in zip(self.evaluation_metrics, base_metrics):
            if key in self.base_target_scaling_stats:
                mean = self.base_target_scaling_stats[key]['mean']
                std = self.base_target_scaling_stats[key]['std']
                if std < 1e-8:
                    std = 1.0
                value = math.log1p(float(value))
                value = (value - mean) / std
            else:
                value = float(value)
            self.base_targets.append(value)

        self.base_targets = torch.tensor(self.base_targets, dtype=torch.float32).unsqueeze(0)

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

            target = []
            for key in self.evaluation_metrics:
                if key in self.target_scaling_stats:
                    mean = self.target_scaling_stats[key]['mean']
                    std = self.target_scaling_stats[key]['std']
                    if std < 1e-8:
                        std = 1.0
                    value = math.log1p(float(metrics[key]))
                    value = (value - mean) / std
                else:
                    value = float(metrics[key])
                target.append(value)

            target = torch.tensor(target, dtype=torch.float32).unsqueeze(0)

            original_target = [float(metrics[key]) for key in self.evaluation_metrics]
            original_target = torch.tensor(original_target, dtype=torch.float32).unsqueeze(0)

            with open(kernel_info_path, 'rb') as f:
                kernel_info = pickle.load(f)
            
            self._standardize_features(kernel_info)

            node_id_map = {node_id: i for i, node_id in enumerate(kernel_info.nodes.keys())}

            xs = [None] * len(node_id_map)
            for node_id, node in kernel_info.nodes.items():
                xs[node_id_map[node_id]] = torch.tensor(node.get_homogeneous_features(), dtype=torch.float32)

            edge_indices = []
            edge_attrs = []
            for edge in kernel_info.edges.values():
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
                'y_base': self.base_targets,
                'benchmark': self.benchmark,
                'solution_index': idx
            }
            data = Data.from_dict(data)

            output_path = os.path.join(self.processed_dir, f"{self.benchmark}_{idx}.pt")
            torch.save(data, output_path)

            self._processed_file_names.append(f"{self.benchmark}_{idx}.pt")

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
                    if std < 1e-8:
                        std = 1.0
                    if key not in NO_LOG_SCALING_KEYS:
                        value = log_transform(value)
                    node.feature_dict[key] = scale(value, mean, std)

