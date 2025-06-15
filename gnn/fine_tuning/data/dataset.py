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
        base_metrics_path: str,
        scale_features: bool = False,
        feature_ranges: Dict[NodeType, Tuple[Tensor, Tensor]] = None,
        log_transform: bool = False,
        **kwargs
    ):
        self.root = root

        if not os.path.exists(base_metrics_path):
            raise ValueError(f"Base metrics file not found: "
                             f"{self.base_metrics_path}")
        
        with open(base_metrics_path, 'r') as f:
            base_metrics = json.load(f)

        if not base_metrics:
            raise ValueError(f"Base metrics file is empty: "
                             f"{self.base_metrics_path}")

        metric = metric.lower()
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

            target = float(metrics.get(self._metric, -1.0))
            if target < 0:
                print(f"Deleting {solution} folder (target value not found)")
                shutil.rmtree(solution_dir)
                continue

            self._raw_file_names.append((f"{solution}/graph.pt",
                                         f"{solution}/metrics.json"))
            
        self.feature_ranges = feature_ranges if scale_features else None

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

        for i, solution in enumerate(os.listdir(self.raw_dir)):
            solution_dir = os.path.join(self.raw_dir, solution)

            graph_path = os.path.join(solution_dir, "graph.pt")
            metrics_path = os.path.join(solution_dir, "metrics.json")

            with open(metrics_path, 'r') as f:
                metrics = json.load(f)

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
