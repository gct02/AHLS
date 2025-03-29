import os
import torch
import shutil
import json
from typing import Union, Optional, List

from torch_geometric.data import Dataset


class HLSDataset(Dataset):
    def __init__(
        self, root: str, metric: str,
        separate_data: bool = False,
        source_data_dir: Optional[str] = None,
        benchmarks: Optional[Union[str, List[str]]] = None,
        **kwargs
    ):
        self.root = root
        self.metric = metric
        self.separate_data = separate_data

        if source_data_dir is None:
            self.source_dataset_dir = root
        else:
            if not os.path.exists(source_data_dir):
                raise FileNotFoundError(
                    f"Source dataset directory {source_data_dir} does not exist."
                )
            self.source_dataset_dir = source_data_dir
            
        if benchmarks is None:
            self.benchmarks = sorted(os.listdir(self.source_dataset_dir))
        elif isinstance(benchmarks, str):
            self.benchmarks = [benchmarks]
        else:
            self.benchmarks = benchmarks

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

            solutions = os.listdir(bench_path)
            solutions = sorted(solutions, key=lambda s: int(s.split("solution")[1]))
            for sol in solutions:
                sol_path = os.path.join(bench_path, sol)
                graph_path = os.path.join(sol_path, "graph.pt")
                metrics_path = os.path.join(sol_path, "metrics.json")

                if not os.path.exists(graph_path) or not os.path.exists(metrics_path):
                    print(f"Skipping {sol} (graph or metrics not found)")
                    continue

                target_value = self._get_target_value(metrics_path)
                if target_value is None:
                    print(f"Skipping {sol} (target value not found)")
                    continue

                graph = torch.load(graph_path)
                graph.y = torch.tensor([target_value])

                output_path = os.path.join(self.processed_dir, f"{bench}_{sol}.pt")
                torch.save(graph, output_path)

                self._processed_file_names.append(f"{bench}_{sol}.pt")
                self._raw_file_names.append(
                    (f"{bench}/{sol}/graph.pt", f"{bench}/{sol}/metrics.txt")
                )

    def len(self):
        return len(self.processed_paths)

    def get(self, ind):
        data = torch.load(self.processed_paths[ind])
        return data 
    
    def _get_target_value(self, metrics_path: str) -> Optional[float]:
        with open(metrics_path, 'r') as f:
            metrics = json.load(f)
            for report in metrics.values():
                if self.metric in report:
                    return float(report[self.metric])
        return None