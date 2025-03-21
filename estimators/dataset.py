import os
import torch
import shutil
import math
from collections import defaultdict
from typing import Union, Optional, List, Dict

from torch import Tensor
from torch_geometric.data import Dataset, HeteroData
from torch_geometric.typing import NodeType, Metadata


def compute_stats(
    dataset_dir: str, 
    metric: str, 
    benchmarks: Optional[Union[List[str], str]] = None,
    filtered_feature_indices: Optional[Dict[NodeType, List[int]]] = None
) -> Dict[NodeType, Dict[str, Tensor]]:
    """Compute mean and standard deviation of features."""

    if not os.path.exists(dataset_dir):
        raise FileNotFoundError(
            f"Directory {dataset_dir} does not exist."
        )
    if benchmarks is None:
        benchmarks = sorted(os.listdir(dataset_dir))
    elif isinstance(benchmarks, str):
        benchmarks = [benchmarks]

    feat_sums = defaultdict(lambda: torch.zeros(0))
    feat_squares = defaultdict(lambda: torch.zeros(0))
    counts = defaultdict(lambda: 0)
    node_types = set()

    for bench in benchmarks:
        bench_path = os.path.join(dataset_dir, bench)
        if not os.path.isdir(bench_path):
            continue
        solutions = os.listdir(bench_path)
        solutions = sorted(solutions, key=lambda s: int(s.split("solution")[1]))
        for sol in solutions:
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
        
        if nt in filtered_feature_indices:
            for col in filtered_feature_indices[nt]:
                mean[col] = 0
                std[col] = 1

        stats[nt] = {'mean': mean, 'std': std}

    return stats


class HLSDataset(Dataset):
    def __init__(
        self,
        root: str,
        metric: str,
        separate_data: bool = False,
        normalize_features: bool = True,
        source_dataset_dir: Optional[str] = None,
        feature_stats: Optional[Dict[NodeType, Dict[str, Tensor]]] = None,
        benchmarks: Optional[List[str]] = None,
        num_virtual_nodes: int = 0,
        base_targets: Optional[Dict[str, float]] = None,
        **kwargs
    ):
        self.root = root
        self.metric = metric
        self.separate_data = separate_data
        self.normalize_features = normalize_features
        self.source_dataset_dir = source_dataset_dir if source_dataset_dir else root
        self.num_virtual_nodes = num_virtual_nodes
        self.base_targets = base_targets
            
        if benchmarks is None:
            self.benchmarks = sorted(os.listdir(self.source_dataset_dir))
        elif isinstance(benchmarks, str):
            self.benchmarks = [benchmarks]
        else:
            self.benchmarks = benchmarks

        if normalize_features and feature_stats is None:
            self.feature_stats = compute_stats(
                source_dataset_dir, metric, self.benchmarks
            )
        else:
            self.feature_stats = feature_stats

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
        if not self.separate_data:
            return
        
        if not os.path.exists(self.source_dataset_dir):
            raise FileNotFoundError(
                f"Source dataset directory {self.source_dataset_dir} does not exist."
            )
        if os.path.exists(self.raw_dir):
            shutil.rmtree(self.raw_dir)
            os.makedirs(self.raw_dir)
        
        for bench in self.benchmarks:
            src = os.path.join(self.source_dataset_dir, bench)
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

        for bench in self.benchmarks:
            bench_path = os.path.join(self.raw_dir, bench)
            if not os.path.isdir(bench_path):
                print(f"Skipping {bench} (directory not found)")
                continue

            if self.base_targets and bench in self.base_targets:
                base_solution_target = self.base_targets[bench]
            else:
                base_solution_target = -1

            solutions = os.listdir(bench_path)
            solutions = sorted(solutions, key=lambda s: int(s.split("solution")[1]))
            for sol in solutions:
                sol_path = os.path.join(bench_path, sol)

                cdfg_path = os.path.join(sol_path, "cdfg.pt")
                if not os.path.exists(cdfg_path):
                    continue

                targets_path = os.path.join(sol_path, "targets.txt")
                if not os.path.exists(targets_path):
                    continue

                target_value = self._get_target_value(targets_path)
                if target_value == -1:
                    continue

                data = self._load_and_process_data(
                    cdfg_path, target_value, base_solution_target
                )
                output_path = os.path.join(self.processed_dir, f"{bench}_{sol}.pt")
                torch.save(data, output_path)

                self._processed_file_names.append(f"{bench}_{sol}.pt")
                self._raw_file_names.append(
                    (f"{bench}/{sol}/cdfg.pt", f"{bench}/{sol}/targets.txt")
                )

    def len(self):
        return len(self.processed_paths)

    def get(self, ind):
        data = torch.load(self.processed_paths[ind])
        return data 
    
    def _get_target_value(self, targets_path: str) -> float:
        target_value = -1
        with open(targets_path, 'r') as f:
            for line in f:
                if line.startswith(self.metric):
                    target_value = float(line.split("=")[1].strip())
                    break
        return target_value
    
    def _get_normalized_node_features(
        self, 
        x_dict: Dict[NodeType, Tensor]
    ) -> Dict[NodeType, Tensor]:
        normalized_x_dict = {}
        for nt, feats in x_dict.items():
            if nt not in self.feature_stats:
                normalized_x_dict[nt] = feats
                continue
            stats = self.feature_stats[nt]
            mean = stats['mean'].unsqueeze(0)
            std = stats['std'].unsqueeze(0)
            normalized_x_dict[nt] = (feats - mean) / std
        return normalized_x_dict
    
    def _load_and_process_data(
        self, 
        data_path: str, 
        target_value: float, 
        base_solution_target: float = -1.0
    ) -> HeteroData:
        data = torch.load(data_path)
        data.y = torch.tensor([target_value])

        if self.normalize_features:
            normalized_x_dict = self._get_normalized_node_features(data.x_dict)
            for nt, feats in normalized_x_dict.items():
                data[nt].x = feats
                
        if self.num_virtual_nodes > 0:
            # Add virtual nodes and connect them to instruction ('inst') nodes
            inst_count = data["inst"].x.shape[0]
            feature_dim = data["inst"].x.shape[1]

            data["virtual"].x = torch.zeros((self.num_virtual_nodes, feature_dim))

            edges_per_virtual_node = math.ceil(inst_count / float(self.num_virtual_nodes))
            virtual_edges = []
            for i in range(self.num_virtual_nodes):
                start = i * edges_per_virtual_node
                end = (i + 1) * edges_per_virtual_node
                if end > inst_count:
                    start = inst_count - edges_per_virtual_node
                    end = inst_count
                virtual_edges.append(torch.stack([
                    torch.arange(start, end),
                    torch.tensor([i] * (end - start))
                ]))

            data[("inst", "virtual", "virtual")].edge_index = torch.cat(virtual_edges, dim=1)
            data[("virtual", "virtual", "virtual")].edge_index = torch.stack([
                torch.arange(self.num_virtual_nodes),
                torch.arange(self.num_virtual_nodes)
            ])

        if base_solution_target >= 0:
            # Include a node containing the target value of the "base" solution 
            # (i.e., the solution with no directives)
            data["base"].x = torch.tensor([base_solution_target]).unsqueeze(0)

            # Connect the "base" node to all the nodes of the other types
            for nt in data.x_dict.keys():
                if nt == "base" or nt.startswith("virtual"):
                    continue
                num_nodes = data[nt].x.shape[0]
                data[("base", "base", nt)].edge_index = torch.stack([
                    torch.zeros(num_nodes, dtype=torch.long),
                    torch.arange(num_nodes)
                ])
            
            # Create self-edges for the "base" node
            data[("base", "self", "base")].edge_index = torch.zeros((2, 1), dtype=torch.long)

        return data
