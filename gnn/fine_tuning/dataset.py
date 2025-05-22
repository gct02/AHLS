import os
import torch
import shutil
import json
from typing import Dict, Tuple

from torch import Tensor
from torch_geometric.data import Dataset, HeteroData
from torch_geometric.typing import NodeType


# Total number of resources available on the target device
# (xcu50-fsvh2104-2-e)
AVAILABLE_RESOURCES = {
    "bram": 2688,
    "dsp": 5952,
    "ff": 1743360,
    "lut": 871680
}


class HLSFineTuningDataset(Dataset):
    def __init__(
        self, 
        root: str, 
        metric: str,
        scale_features: bool = False,
        log_transform: bool = False,
        **kwargs
    ):
        self.root = root

        self.base_metrics_path = os.path.join(root, "base_metrics.json")
        if not os.path.exists(self.base_metrics_path):
            raise ValueError(f"Base metrics file not found: "
                             f"{self.base_metrics_path}")
        
        with open(self.base_metrics_path, 'r') as f:
            base_metrics = json.load(f)

        if not base_metrics:
            raise ValueError(f"Base metrics file is empty: "
                             f"{self.base_metrics_path}")

        metric = metric.lower()
        if metric == "snru":
            try:
                self._base_target = self._compute_snru(base_metrics)
            except ValueError:
                raise ValueError(f"SNRU computation failed in "
                                 f"{self.base_metrics_path}")
        else:
            self._base_target = float(base_metrics.get(metric, -1.0))
            if self._base_target < 0:
                raise ValueError(f"Base target value not found in "
                                 f"{self.base_metrics_path}")

        self._metric = metric
        self._log_transform = log_transform

        self._raw_file_names = []
        self._processed_file_names = []

        # Remove instances with no target value
        for solution in os.listdir(self.raw_dir):
            solution_dir = os.path.join(self.raw_dir, solution)
            graph_path = os.path.join(solution_dir, "graph.pt")
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

            if not metrics:
                print(f"Deleting {solution} folder (metrics file is empty)")
                shutil.rmtree(solution_dir)
                continue

            if self._metric == "snru":
                try:
                    target = self._compute_snru(metrics)
                except ValueError:
                    print(f"Deleting {solution} folder (SNRU computation failed)")
                    shutil.rmtree(solution_dir)
                    continue
            else:
                target = float(metrics.get(self._metric, -1.0))
                if target < 0:
                    print(f"Deleting {solution} folder (target value not found)")
                    shutil.rmtree(solution_dir)
                    continue

            self._raw_file_names.append((f"{solution}/graph.pt",
                                         f"{solution}/metrics.json"))

        self.feature_ranges = (_compute_feature_ranges(self.raw_dir, metric) 
                               if scale_features else None)

        super(HLSFineTuningDataset, self).__init__(self.root, **kwargs)
    
    @property
    def raw_file_names(self):
        return self._raw_file_names

    @property
    def processed_file_names(self):
        return self._processed_file_names
    
    @property
    def download(self):
        return False
    
    def process(self):
        if not os.path.exists(self.raw_dir):
            raise FileNotFoundError(
                f"Raw dataset directory {self.raw_dir} does not exist."
            )
        if os.path.exists(self.processed_dir):
            shutil.rmtree(self.processed_dir)
        os.makedirs(self.processed_dir)

        for i, solution in enumerate(os.listdir(self.raw_dir)):
            solution_dir = os.path.join(self.raw_dir, solution)

            graph_path = os.path.join(solution_dir, "graph.pt")
            metrics_path = os.path.join(solution_dir, "metrics.json")

            with open(metrics_path, 'r') as f:
                metrics = json.load(f)

            if self._metric == "snru":
                target = self._compute_snru(metrics)
            else:
                target = float(metrics.get(self._metric))

            data = torch.load(graph_path)
            data.y = torch.tensor([target])
            data.y_base = torch.tensor([self._base_target]).unsqueeze(0)
            if self._log_transform:
                data.y = torch.log1p(data.y)
                data.y_base = torch.log1p(data.y_base)

            if self.feature_ranges is not None:
                data = self._scale_features(data)

            self._processed_file_names.append(f"{i}.pt")
            output_path = os.path.join(self.processed_dir, f"{i}.pt")
            torch.save(data, output_path)

    def len(self):
        return len(self.processed_paths)

    def get(self, ind):
        return torch.load(self.processed_paths[ind]) 
    
    def _scale_features(self, data: HeteroData) -> HeteroData:
        for nt, x in data.x_dict.items():
            if x.size(0) == 0:
                continue
            mins, maxs = self.feature_ranges[nt]
            diffs = maxs - mins
            diffs[diffs == 0] = 1
            data.x_dict[nt] = (x - mins) / diffs
        return data
    
    def _compute_snru(metrics):
        """Compute the SNRU (Sum of Normalized Resource Utilization) metric."""
        snru = 0
        for resource, available in AVAILABLE_RESOURCES.items():
            value = metrics.get(resource, -1)
            if value < 0:
                raise ValueError(f"Resource {resource} not found in metrics.")
            snru += value / available
        snru /= len(AVAILABLE_RESOURCES)
        return snru
    

def _compute_feature_ranges(
    dataset_dir: str, 
    metric: str
) -> Dict[NodeType, Dict[NodeType, Tuple[Tensor, Tensor]]]:
    feature_ranges = {}
    for solution in os.listdir(dataset_dir):
        solution_dir = os.path.join(dataset_dir, solution)
        if "solution" not in solution or not os.path.isdir(solution_dir):
            continue

        graph_path = os.path.join(solution_dir, "graph.pt")
        if not os.path.exists(graph_path):
            print(f"Skipping {solution} (graph file not found)")
            continue

        metrics_path = os.path.join(solution_dir, "metrics.json")
        if not os.path.exists(metrics_path):
            print(f"Skipping {solution} (metrics file not found)")
            continue

        with open(metrics_path, 'r') as f:
            metrics = json.load(f)

        target = float(metrics.get(metric, -1.0)) if metrics else -1.0
        if target < 0:
            print(f"Skipping {solution} (target value not found)")
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