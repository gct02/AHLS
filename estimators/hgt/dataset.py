import os, pickle
import torch
from torch.utils.data import Dataset

class HLSDatasetLUT(Dataset):
    def __init__(self, data_path, test_set_index=None, get_test=False):
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
            if self.test_set_index is not None:
                benchmarks = [benchmarks[self.test_set_index]]
            else:
                return
        else:
            if self.test_set_index is not None:
                del benchmarks[self.test_set_index]
        for benchmark in benchmarks:
            benchmark_folder = os.fsdecode(os.path.join(self.data_path, benchmark))
            instances = sorted(os.listdir(benchmark_folder))
            for instance in instances:
                instance_folder = os.fsdecode(os.path.join(benchmark_folder, instance))

                cdfg_path = os.path.join(instance_folder, "cdfg.pkl")
                cdfg = pickle.load(open(cdfg_path, 'rb'))

                with open(os.path.join(instance_folder, "lut.txt"), 'r') as f:
                    lut = torch.FloatTensor([float(f.readline().strip())])

                self.data.append((cdfg, lut))

class HLSDatasetFF(Dataset):
    def __init__(self, data_path:str):
        self.data_path = data_path
        self.data = None
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

        for benchmark in benchmarks:
            benchmark_folder = os.fsdecode(os.path.join(self.data_path, benchmark))
            instances = sorted(os.listdir(benchmark_folder))
            for instance in instances:
                instance_folder = os.fsdecode(os.path.join(benchmark_folder, instance))
                
                cdfg_path = os.path.join(instance_folder, "cdfg.pkl")
                cdfg = pickle.load(open(cdfg_path, 'rb'))

                with open(os.path.join(instance_folder, "ff.txt"), 'r') as f:
                    ff = torch.FloatTensor(list(map(float, f.readlines()[0].strip().split(','))))

                self.data.append((cdfg, ff))

class HLSDatasetDSP(Dataset):
    def __init__(self, data_path:str):
        self.data_path = data_path
        self.data = None
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

        for benchmark in benchmarks:
            benchmark_folder = os.fsdecode(os.path.join(self.data_path, benchmark))
            instances = sorted(os.listdir(benchmark_folder))
            for instance in instances:
                instance_folder = os.fsdecode(os.path.join(benchmark_folder, instance))
                
                cdfg_path = os.path.join(instance_folder, "cdfg.pkl")
                cdfg = pickle.load(open(cdfg_path, 'rb'))

                with open(os.path.join(instance_folder, "dsp.txt"), 'r') as f:
                    dsp = torch.FloatTensor(list(map(float, f.readlines()[0].strip().split(','))))

                self.data.append((cdfg, dsp))