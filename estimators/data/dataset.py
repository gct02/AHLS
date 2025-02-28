from typing import Union, Optional, List, Dict

import os
import torch
from collections import defaultdict
from pathlib import Path
from torch.utils.data import Dataset
from torch import Tensor

class HLSDataset(Dataset):
    def __init__(
        self, 
        dataset_path: Union[Path, str], 
        target_metric: str,
        normalize: bool = False,
        benchmarks: Optional[Union[str, List[str]]] = None,
        feature_stats: Optional[Dict[str, Dict[str, Tensor]]] = None,
        filter_cols: Optional[Dict[str, List[int]]] = None
    ):
        self.target = target_metric
        self.dataset_path = dataset_path
        self.normalize = normalize
        self.benchmarks = benchmarks
        self.filter_cols = filter_cols
        self.feature_stats = None
        self.base_instances = None

        self._load_data_paths()

        if self.normalize:
            if feature_stats is None:
                self.compute_feature_stats()
            else:
                self.feature_stats = feature_stats.copy()

    def compute_feature_stats(self):
        """Compute mean and standard deviation of features for normalization."""
        
        feature_sums = defaultdict(lambda: torch.zeros(0))
        feature_squares = defaultdict(lambda: torch.zeros(0))
        counts = defaultdict(lambda: 0)
        node_types = set()

        for cdfg_path, _ in self.data_paths:
            cdfg = torch.load(cdfg_path)
            for nt, features in cdfg.x_dict.items():
                node_types.add(nt)
                if (features is None or features.numel() == 0 
                    or features.shape[0] == 0):
                    continue
                    
                if (nt not in feature_sums 
                    or feature_sums[nt].numel() == 0):
                    feature_sums[nt] = features.sum(dim=0)
                    feature_squares[nt] = (features**2).sum(dim=0)
                else:
                    feature_sums[nt] += features.sum(dim=0)
                    feature_squares[nt] += (features**2).sum(dim=0)

                if nt not in counts:
                    counts[nt] = features.shape[0]
                else:
                    counts[nt] += features.shape[0]

                # Remove 'inst' nodes with all-zero features from the counts
                if nt == 'inst':
                    zero_features = features.sum(dim=1) == 0
                    counts[nt] -= zero_features.sum().item()

        self.feature_stats = {}
        for nt in node_types:
            if nt not in counts or counts[nt] == 0:
                self.feature_stats[nt] = {'mean': 0, 'std': 1}
                continue
                
            mean = feature_sums[nt] / counts[nt]
            std = torch.sqrt(
                (feature_squares[nt] / counts[nt]) - mean**2
            ).clamp_min(1e-8)

            if self.filter_cols is not None and nt in self.filter_cols:
                for col in self.filter_cols[nt]:
                    mean[col] = 0
                    std[col] = 1
            
            self.feature_stats[nt] = {
                'mean': mean,
                'std': std
            }

    def get_base_instances(self):
        if self.base_instances is not None:
            return self.base_instances

        self.base_instances = {}
        for cdfg_path, targets_path in self.base_data_paths.values():
            cdfg, target, bench = self._load_instance(cdfg_path, targets_path)
            self.base_instances[bench] = (cdfg, target)

        return self.base_instances

    def __len__(self):
        return len(self.data_paths)

    def __getitem__(self, idx: int):
        cdfg_path, targets_path = self.data_paths[idx]
        return self._load_instance(cdfg_path, targets_path)
    
    def _load_instance(self, cdfg_path: str, targets_path: str):
        bench = cdfg_path.split("/")[-3]
        base_target = self.base_targets[bench]
        target_value = self._get_target_value(targets_path) - base_target
        
        # Load CDFG from disk
        cdfg = torch.load(cdfg_path)

        # Apply normalization
        if self.normalize:
            for nt in cdfg.x_dict.keys():
                if nt not in self.feature_stats:
                    continue
                    
                stats = self.feature_stats[nt]
                cdfg[nt].x = ((cdfg.x_dict[nt] - stats['mean'].unsqueeze(0)) 
                              / stats['std'].unsqueeze(0))

        return cdfg, torch.tensor([target_value]), bench
    
    def _get_target_value(self, targets_path: str) -> float:
        target_value = -1
        with open(targets_path, 'r') as f:
            for line in f:
                if line.startswith(self.target):
                    target_value = float(line.split("=")[1].strip())
                    break

        return target_value

    def _load_data_paths(self):
        if not os.path.exists(self.dataset_path):
            raise FileNotFoundError(f"Dataset path {self.dataset_path} does not exist.")
        
        available_benchmarks = os.listdir(self.dataset_path)
        if self.benchmarks is None:
            self.benchmarks = available_benchmarks
        else:
            if not isinstance(self.benchmarks, list):
                self.benchmarks = [self.benchmarks]

            for bench in self.benchmarks:
                if bench not in available_benchmarks:
                    raise FileNotFoundError(f"Benchmark {bench} not found in {self.dataset_path}")
                
        self.benchmarks = sorted(self.benchmarks)
        self.data_paths = []
        self.base_targets = {}
        self.base_data_paths = {}

        for bench in self.benchmarks:
            benchmark_path = os.path.join(self.dataset_path, bench)
            if not os.path.isdir(benchmark_path):
                continue

            solutions = sorted(os.listdir(benchmark_path))
            base_solution = solutions[0]
            solutions = solutions[1:]

            base_instance_path = os.path.join(benchmark_path, base_solution)

            base_targets_path = os.path.join(base_instance_path, "targets.txt")
            if not os.path.exists(base_targets_path):
                raise FileNotFoundError(f"Base targets file not found in {base_targets_path}")
            
            base_cdfg_path = os.path.join(base_instance_path, "cdfg.pt")
            if not os.path.exists(base_cdfg_path):
                raise FileNotFoundError(f"Base CDFG file not found in {base_cdfg_path}")
            
            base_target = self._get_target_value(base_targets_path)
            if base_target == -1:
                raise ValueError(f"Invalid target in {base_targets_path}")
            
            self.base_targets[bench] = base_target
            self.base_data_paths[bench] = (base_cdfg_path, base_targets_path)

            for sol in solutions:
                instance_path = os.path.join(benchmark_path, sol)
                targets_path = os.path.join(instance_path, "targets.txt")
                if not os.path.exists(targets_path):
                    continue

                target_value = self._get_target_value(targets_path)
                if target_value == -1:
                    continue

                cdfg_path = os.path.join(instance_path, "cdfg.pt")
                if not os.path.exists(cdfg_path):
                    continue

                self.data_paths.append((cdfg_path, targets_path))