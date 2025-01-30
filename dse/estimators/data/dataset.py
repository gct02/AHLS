from typing import Union, Optional

import os
import torch
from pathlib import Path
from torch.utils.data import Dataset

class HLSDataset(Dataset):
    def __init__(
        self, 
        dataset_path: Union[Path, str], 
        target_metric: str, 
        test_benchmark: Optional[str] = None, 
        load_test_data: bool = False
    ):
        assert test_benchmark is not None or not load_test_data, \
            "Test benchmark must be specified when loading test data."
        self.target = target_metric
        self.data_path = dataset_path
        self.test_benchmark = test_benchmark
        self.load_test_data = load_test_data
        self.data = []
        self.__load_data()

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx:int):
        return self.data[idx]

    def __del__(self):
        del self.data

    def __load_data(self):
        self.data = []

        if not os.path.exists(self.data_path):
            raise FileNotFoundError(f"Dataset path {self.data_path} does not exist.")
        
        benchmark_list = os.listdir(self.data_path) if not self.load_test_data else [self.test_benchmark]

        for benchmark_name in benchmark_list:
            benchmark_path = os.fsdecode(os.path.join(self.data_path, benchmark_name))
            if not os.path.isdir(benchmark_path):
                continue

            benchmark_path = os.fsdecode(benchmark_path)
            instance_list = sorted(os.listdir(benchmark_path))

            for instance_name in instance_list:
                instance_path = os.fsdecode(os.path.join(benchmark_path, instance_name))

                with open(os.path.join(instance_path, f"targets.txt"), 'r') as f:
                    line = f.readline().split('=')
                    while line[0] != self.target:
                        line = f.readline().split('=')

                    target_value = float(line[1])
                
                if target_value == -1:
                    continue

                cdfg_path = os.path.join(instance_path, "cdfg.pt")
                if not os.path.exists(cdfg_path):
                    continue

                cdfg = torch.load(cdfg_path)
                target_value = torch.tensor([target_value])
                self.data.append((cdfg, target_value))
