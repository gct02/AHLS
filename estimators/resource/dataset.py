import os
import torch
import shutil
from typing import Union, Optional, List, Dict

from torch import Tensor
from torch_geometric.data import Dataset

def compute_stats(
    dataset_dir_path: str, 
    metric: str, 
    benches: Optional[Union[List[str], str]] = None,
) -> Dict[str, Tensor]:
    """Compute mean and standard deviation of features."""

    if not os.path.exists(dataset_dir_path):
        raise FileNotFoundError(f"Directory {dataset_dir_path} does not exist.")

    if benches is None:
        benches = sorted(os.listdir(dataset_dir_path))
    elif isinstance(benches, str):
        benches = [benches]

    x_list = []
    edge_index_list = []
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

            dfg_path = os.path.join(sol_path, "dfg.pt")
            if not os.path.exists(dfg_path):
                continue

            dfg = torch.load(dfg_path)
            x_list.append(dfg.x)
            edge_index_list.append(dfg.edge_index)

    x = torch.cat(x_list, dim=0)
    edge_index = torch.cat(edge_index_list, dim=1)

    feat_sums = x.sum(dim=0)
    feat_squares = (x**2).sum(dim=0)
    counts = x.size(0)

    mean = feat_sums / counts
    std = torch.sqrt(feat_squares / counts - mean**2).clamp_min(1e-6)

    binary_feature_mask = torch.logical_or(x == 0, x == 1)
    binary_feature_mask = torch.all(binary_feature_mask, dim=0)

    mean[binary_feature_mask] = 0
    std[binary_feature_mask] = 1

    deg = torch.bincount(edge_index[1], minlength=x.size(0))
    deg = torch.bincount(deg, minlength=deg.max() + 1)
    deg = deg.to(x.dtype).view(-1, 1)

    return {'mean': mean, 'std': std, 'deg': deg}


class HLSDataset(Dataset):
    def __init__(
        self,
        root: str,
        metric: str,
        dataset_dir_path: Optional[str] = None,
        copy_data: bool = False,
        process_data: bool = True,
        stats: Optional[Dict[str, Tensor]] = None,
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

                dfg_path = os.path.join(sol_path, "dfg.pt")
                if not os.path.exists(dfg_path):
                    continue

                if self.process_data:
                    data = torch.load(dfg_path)
                    processed_data = data.clone()

                    mean = self.stats['mean'].unsqueeze(0)
                    std = self.stats['std'].unsqueeze(0)

                    processed_data.x = (data.x - mean) / std
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
