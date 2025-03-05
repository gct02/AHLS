from typing import Union, Optional, List, Dict
from torch_geometric.typing import NodeType

import os
import torch
import shutil
from collections import defaultdict
from torch_geometric.data import Dataset
from torch import Tensor

def compute_stats(
    dataset_dir_path: str, 
    metric: str, 
    benches: Optional[Union[List[str], str]] = None,
    filter_feats: Optional[Dict[NodeType, List[int]]] = None
) -> Dict[NodeType, Dict[str, Tensor]]:
    """Compute mean and standard deviation of features."""

    if not os.path.exists(dataset_dir_path):
        raise FileNotFoundError(f"Directory {dataset_dir_path} does not exist.")

    if benches is None:
        benches = sorted(os.listdir(dataset_dir_path))
    elif isinstance(benches, str):
        benches = [benches]

    feat_sums = defaultdict(lambda: torch.zeros(0))
    feat_squares = defaultdict(lambda: torch.zeros(0))
    counts = defaultdict(lambda: 0)
    node_types = set()

    for bench in benches:
        bench_path = os.path.join(dataset_dir_path, bench)
        if not os.path.isdir(bench_path):
            continue
        sols = os.listdir(bench_path)
        sols = sorted(sols, key=lambda s: int(s.split("solution")[1]))
        for sol in sols:
            sol_path = os.path.join(bench_path, sol)
            targets_path = os.path.join(sol_path, "targets.txt")
            if not os.path.exists(targets_path):
                continue

            target_value = -1
            with open(targets_path, 'r') as f:
                for line in f:
                    if line.startswith(metric):
                        target_value = float(line.split("=")[1].strip())
                        break

            if target_value == -1:
                continue

            cdfg_path = os.path.join(sol_path, "cdfg.pt")
            if not os.path.exists(cdfg_path):
                continue

            cdfg = torch.load(cdfg_path)
            for nt, feats in cdfg.x_dict.items():
                node_types.add(nt)
                if feats is None or feats.numel() == 0:
                    continue

                if nt not in feat_sums or feat_sums[nt].numel() == 0:
                    feat_sums[nt] = feats.sum(dim=0)
                    feat_squares[nt] = (feats**2).sum(dim=0)
                else:
                    feat_sums[nt] += feats.sum(dim=0)
                    feat_squares[nt] += (feats**2).sum(dim=0)

                if nt not in counts:
                    counts[nt] = feats.shape[0]
                else:
                    counts[nt] += feats.shape[0]

                if nt == 'inst':
                    zero_feats = feats.sum(dim=1) == 0
                    counts[nt] -= zero_feats.sum().item()

    stats = {}
    for nt in node_types:
        if nt not in counts or counts[nt] == 0:
            stats[nt] = {'mean': 0, 'std': 1}
            continue

        if counts[nt] == 1:
            mean = feat_sums[nt]
            std = torch.ones_like(mean)
        else:
            mean = feat_sums[nt] / counts[nt]
            std = torch.sqrt((feat_squares[nt] - (feat_sums[nt]**2) / counts[nt]) 
                             / (counts[nt] - 1)).clamp_min(1e-8)
        
        if nt in filter_feats:
            for col in filter_feats[nt]:
                mean[col] = 0
                std[col] = 1

        stats[nt] = {'mean': mean, 'std': std}

    return stats


class HLSDataset(Dataset):
    def __init__(
        self,
        root: str,
        metric: str,
        dataset_dir_path: Optional[str] = None,
        copy_data: bool = False,
        process_data: bool = True,
        stats: Optional[Dict[NodeType, Dict[str, Tensor]]] = None,
        benches: Optional[List[str]] = None,
        **kwargs
    ):
        self.dataset_dir_path = dataset_dir_path if dataset_dir_path else root
        self.root = root
        self.stats = stats
        self.metric = metric
        self.copy_data = copy_data
        self.process_data = process_data
            
        if benches is None:
            self.benches = sorted(os.listdir(self.dataset_dir_path))
        elif isinstance(benches, str):
            self.benches = [benches]
        else:
            self.benches = benches

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
        if not self.copy_data:
            return
        
        if not os.path.exists(self.dataset_dir_path):
            raise FileNotFoundError(f"Dataset directory {self.dataset_dir_path} does not exist.")
        
        if not os.path.exists(self.raw_dir):
            os.makedirs(self.raw_dir)
        
        for bench in self.benches:
            src = os.path.join(self.dataset_dir_path, bench)
            dst = os.path.join(self.raw_dir, bench)
            shutil.copytree(src, dst)
    
    def process(self):
        if not os.path.exists(self.raw_dir):
            raise FileNotFoundError(f"Raw directory {self.raw_dir} does not exist.")
        
        if not os.path.exists(self.processed_dir):
            os.makedirs(self.processed_dir)

        for bench in self.benches:
            bench_path = os.path.join(self.raw_dir, bench)
            if not os.path.isdir(bench_path):
                continue

            sols = os.listdir(bench_path)
            sols = sorted(sols, key=lambda s: int(s.split("solution")[1]))
            for sol in sols:
                sol_path = os.path.join(bench_path, sol)
                targets_path = os.path.join(sol_path, "targets.txt")
                if not os.path.exists(targets_path):
                    continue

                target_value = -1
                with open(targets_path, 'r') as f:
                    for line in f:
                        if line.startswith(self.metric):
                            target_value = float(line.split("=")[1].strip())
                            break

                if target_value == -1:
                    continue

                cdfg_path = os.path.join(sol_path, "cdfg.pt")
                if not os.path.exists(cdfg_path):
                    continue

                if self.process_data:
                    data = torch.load(cdfg_path)
                    processed_data = data.clone()

                    for nt in data.x_dict.keys():
                        if nt not in self.stats:
                            continue

                        stats = self.stats[nt]
                        processed_data.x_dict[nt] = ((data.x_dict[nt] - stats['mean'].unsqueeze(0))
                                                     / stats['std'].unsqueeze(0))
                    
                    # TODO: Rebuild the graphs without the base_metrics node type
                    if 'base_metrics' in processed_data.x_dict:
                        for et in processed_data.edge_index_dict.keys():
                            if et[0] == 'base_metrics' or et[2] == 'base_metrics':
                                del processed_data[et]
                        del processed_data['base_metrics']
                        
                    processed_data.y = torch.tensor([target_value])

                    processed_path = os.path.join(self.processed_dir, f"{bench}_{sol}.pt")
                    torch.save(processed_data, processed_path)

                self._processed_file_names.append(f"{bench}_{sol}.pt")
                self._raw_file_names.append((f"{bench}/{sol}/cdfg.pt", f"{bench}/{sol}/targets.txt"))

    def len(self):
        return len(self.processed_paths)

    def get(self, ind):
        data = torch.load(self.processed_paths[ind])
        return data 
