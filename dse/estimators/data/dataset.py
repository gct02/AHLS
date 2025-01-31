from typing import Union, Optional, List, Dict

import os
import torch
from pathlib import Path
from torch.utils.data import Dataset

class HLSDataset(Dataset):
    def __init__(
        self, 
        dataset_path: Union[Path, str], 
        target_metric: str,
        normalize: bool = True,
        benchmarks: Optional[Union[str, List[str]]] = None,
        feature_stats: Optional[Dict[str, Dict[str, torch.Tensor]]] = None
    ):
        self.target = target_metric
        self.dataset_path = dataset_path
        self.normalize = normalize
        self.benchmarks = benchmarks

        self._load_data()

        if self.normalize:
            if feature_stats is None:
                self._compute_stats()
            else:
                self.feature_stats = feature_stats

    def _compute_stats(self):
        """Compute mean and std for each node type across all graphs"""
        self.feature_stats = {}
        for cdfg, _ in self.data:
            for k, v in cdfg.x_dict.items():
                if k not in self.feature_stats:
                    self.feature_stats[k] = {'mean': [], 'std': []}
                self.feature_stats[k]['mean'].append(v.mean(dim=0))
                self.feature_stats[k]['std'].append(v.std(dim=0))

        for k, v in self.feature_stats.items():
            self.feature_stats[k]['mean'] = torch.stack(v['mean']).mean(dim=0)
            self.feature_stats[k]['std'] = torch.stack(v['std']).mean(dim=0)

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx:int):
        cdfg, target = self.data[idx]
        
        if self.normalize:
            for k, v in cdfg.x_dict.items():
                stats = self.feature_stats[k]
                cdfg.x_dict[k] = (v - stats['mean']) / stats['std']

        return cdfg, target

    def __del__(self):
        del self.data

    def _load_data(self):
        if not os.path.exists(self.dataset_path):
            raise FileNotFoundError(f"Dataset path {self.dataset_path} does not exist.")
        
        available_benchmarks = os.listdir(self.dataset_path)
        if self.benchmarks is None:
            self.benchmarks = available_benchmarks
        else:
            if not isinstance(self.benchmarks, list):
                self.benchmarks = [self.benchmarks]

            for benchmark in self.benchmarks:
                if benchmark not in available_benchmarks:
                    raise FileNotFoundError(f"Benchmark {benchmark} not found in {self.dataset_path}")
                
        self.benchmarks = sorted(self.benchmarks)
        self.data = []
        for benchmark_name in self.benchmarks:
            benchmark_path = os.fsdecode(os.path.join(self.dataset_path, benchmark_name))
            if not os.path.isdir(benchmark_path):
                continue

            benchmark_path = os.fsdecode(benchmark_path)
            solutions = sorted(os.listdir(benchmark_path))

            for solution_name in solutions:
                instance_path = os.fsdecode(os.path.join(benchmark_path, solution_name))

                targets_path = os.path.join(instance_path, "targets.txt")
                if not os.path.exists(targets_path):
                    continue

                cdfg_path = os.path.join(instance_path, "cdfg.pt")
                if not os.path.exists(cdfg_path):
                    continue

                target_value = -1
                with open(os.path.join(instance_path, f"targets.txt"), 'r') as f:
                    while (line := f.readline()):
                        if line.startswith(self.target):
                            target_value = float(line.split("=")[1])
                            break

                if target_value == -1:
                    continue

                cdfg = torch.load(cdfg_path)
                target_value = torch.tensor([target_value])
                self.data.append((cdfg, target_value))
