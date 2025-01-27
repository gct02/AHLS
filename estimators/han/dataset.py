import os
import pickle
import torch
from typing import Union
from pathlib import Path
from torch.utils.data import Dataset

class HLSDataset(Dataset):
    def __init__(
        self, 
        data_path: Union[Path, str], 
        target_metric: str, 
        test_set_index: Union[int, None] = None, 
        get_test: bool = False
    ):
        self.target = target_metric
        self.data_path = data_path
        self.test_set_index = test_set_index
        self.get_test = get_test
        self.data = []
        self.__load_data()

    def __len__(self):
        return len(self.data)

    def __getitem__(self, idx:int):
        return self.data[idx]

    def __del__(self):
        del self.data
        torch.cuda.empty_cache()

    def __load_data(self):
        self.data = []
        benchmarks = sorted(os.listdir(self.data_path))

        if self.get_test:
            if self.test_set_index == None or \
               self.test_set_index >= len(benchmarks):
                return
            benchmarks = [benchmarks[self.test_set_index]]
        else:
            if self.test_set_index is not None:
                del benchmarks[self.test_set_index]

        for bench in benchmarks:
            bench_folder = os.fsdecode(os.path.join(self.data_path, bench))
            instances = sorted(os.listdir(bench_folder))

            for inst in instances:
                inst_folder = os.fsdecode(os.path.join(bench_folder, inst))

                cdfg_path = os.path.join(inst_folder, "cdfg.pkl")
                if not os.path.exists(cdfg_path):
                    continue

                cdfg = pickle.load(open(cdfg_path, 'rb'))

                with open(os.path.join(inst_folder, f"targets.txt"), 'r') as f:
                    line = f.readline().split('=')
                    metric = line[0]
                    while metric != self.target:
                        line = f.readline().split('=')
                        metric = line[0]
                    target_value = float(line[1])
                    target_value = torch.tensor([target_value])

                self.data.append((cdfg, target_value))
