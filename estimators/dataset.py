import os
import torch
import shutil
from collections import defaultdict
from typing import Union, Optional, List, Dict

from torch import Tensor
from torch_geometric.data import Dataset
from torch_geometric.typing import NodeType, Metadata


def compute_stats(
    dataset_dir_path: str, 
    metric: str, 
    benches: Optional[Union[List[str], str]] = None,
    filter_feats: Optional[Dict[NodeType, List[int]]] = None
) -> Dict[NodeType, Dict[str, Tensor]]:
    """Compute mean and standard deviation of features."""

    if not os.path.exists(dataset_dir_path):
        raise FileNotFoundError(
            f"Directory {dataset_dir_path} does not exist."
        )
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
        metadata: Optional[Metadata] = None,
        dataset_dir_path: Optional[str] = None,
        copy_data: bool = False,
        process_data: bool = True,
        stats: Optional[Dict[NodeType, Dict[str, Tensor]]] = None,
        benches: Optional[List[str]] = None,
        num_virtual_nodes: Optional[Union[int, Dict[NodeType, int]]] = None,
        base_targets: Optional[Dict[str, float]] = None,
        **kwargs
    ):
        self.dataset_dir_path = dataset_dir_path if dataset_dir_path else root
        self.root = root
        self.stats = stats
        self.metric = metric

        self.copy_data = copy_data
        self.process_data = process_data

        self.base_targets = base_targets
        
        if num_virtual_nodes and metadata and isinstance(num_virtual_nodes, int):
            self.num_virtual_nodes = {f"virtual_{nt}": num_virtual_nodes for nt in metadata[0]}
        else:
            self.num_virtual_nodes = num_virtual_nodes
            
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
            raise FileNotFoundError(
                f"Dataset directory {self.dataset_dir_path} does not exist."
            )
        if not os.path.exists(self.raw_dir):
            os.makedirs(self.raw_dir)
        
        for bench in self.benches:
            src = os.path.join(self.dataset_dir_path, bench)
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

        for bench in self.benches:
            bench_path = os.path.join(self.raw_dir, bench)
            if not os.path.isdir(bench_path):
                continue

            if self.base_targets and bench in self.base_targets:
                base_target = self.base_targets[bench]
            else:
                base_target = 0

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

                    processed_data.y = torch.tensor([target_value])

                    for nt in data.x_dict.keys():
                        if nt not in self.stats:
                            continue

                        stats = self.stats[nt]
                        mean = stats['mean'].unsqueeze(0)
                        std = stats['std'].unsqueeze(0)
                        node_feats = data.x_dict[nt]
                        processed_data[nt].x = (node_feats - mean) / std
                        
                if self.num_virtual_nodes:
                    if isinstance(self.num_virtual_nodes, int):
                        self.num_virtual_nodes = {f"virtual_{nt}": self.num_virtual_nodes 
                                                  for nt in data.x_dict.keys()}

                    for virtual_type, num_virtual_nodes in self.num_virtual_nodes.items():
                        if num_virtual_nodes == 0:
                            continue

                        original_type = virtual_type.split("_")[1]
                        num_nodes = data[original_type].x.shape[0]
                        feature_dim = data[original_type].x.shape[1]

                        processed_data[virtual_type].x = torch.zeros((num_virtual_nodes, feature_dim))

                        # Connect the virtual node to all the nodes of the original type
                        virtual_edge_index = torch.zeros((2, num_nodes * num_virtual_nodes), dtype=torch.long)
                        virtual_edge_index[0] = torch.arange(num_nodes).repeat(num_virtual_nodes)
                        virtual_edge_index[1] = torch.arange(num_virtual_nodes).repeat(num_nodes)
                        original_type = virtual_type.split("_")[1]
                        processed_data[(original_type, "virtual", virtual_type)].edge_index = virtual_edge_index

                        self_edge_index = torch.zeros((2, num_virtual_nodes), dtype=torch.long)
                        self_edge_index[0] = torch.arange(num_virtual_nodes)
                        self_edge_index[1] = torch.arange(num_virtual_nodes)
                        processed_data[(virtual_type, "self", virtual_type)].edge_index = self_edge_index

                if self.base_targets:
                    # Include a node containing the target value of the "base" solution 
                    # (i.e., the solution with no directives) as a feature and connect it to all nodes
                    processed_data["base"].x = torch.tensor([base_target]).unsqueeze(0)

                    for nt in processed_data.x_dict.keys():
                        if nt == "base" or nt.startswith("virtual"):
                            continue
                        num_nodes = processed_data[nt].x.shape[0]
                        processed_data[("base", "base", nt)].edge_index = torch.stack([
                            torch.zeros(num_nodes, dtype=torch.long),
                            torch.arange(num_nodes)
                        ])
                        
                    processed_data[("base", "self", "base")].edge_index = torch.zeros((2, 1), dtype=torch.long)

                processed_path = os.path.join(self.processed_dir, f"{bench}_{sol}.pt")
                torch.save(processed_data, processed_path)

                self._processed_file_names.append(f"{bench}_{sol}.pt")
                self._raw_file_names.append((f"{bench}/{sol}/cdfg.pt", f"{bench}/{sol}/targets.txt"))

    def len(self):
        return len(self.processed_paths)

    def get(self, ind):
        data = torch.load(self.processed_paths[ind])
        return data 
