import os, pickle
import torch
from torch.utils.data import Dataset

DEVICE_NUM_LUT = 870000
DEVICE_NUM_FF = 1740000
DEVICE_NUM_DSP = 5952

class HLSDataset(Dataset):
    def __init__(self, data_path, target_metric, test_set_index=None, get_test=False):
        target_metric = target_metric.lower().strip()
        assert target_metric in ["lut", "ff", "dsp", "bram", "cp"], "target_metric should be one of ['lut', 'ff', 'dsp', 'bram', 'cp']"
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

                dfg_post_dirs_path = os.path.join(instance_folder, "dfg_post_dirs.pkl")
                dfg_pre_dirs_path = os.path.join(instance_folder, "dfg_pre_dirs.pkl")
                dfg_post_dirs = pickle.load(open(dfg_post_dirs_path, 'rb'))
                dfg_pre_dirs = pickle.load(open(dfg_pre_dirs_path, 'rb'))
                
                dfgs = (dfg_pre_dirs, dfg_post_dirs)

                with open(os.path.join(instance_folder, f"{self.target}_label.txt"), 'r') as f:
                    target_value = torch.FloatTensor([float(f.readline().strip())])

                self.data.append((dfgs, target_value))