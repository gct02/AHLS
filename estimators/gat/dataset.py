import os, pickle
import torch
from torch.utils.data import Dataset

class HLSDatasetLUT(Dataset):
    def __init__(self, data_path):
        self.data_path = data_path
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
        for benchmark in benchmarks:
            benchmark_folder = os.fsdecode(os.path.join(self.data_path, benchmark))
            instances = sorted(os.listdir(benchmark_folder))
            for instance in instances:
                instance_folder = os.fsdecode(os.path.join(benchmark_folder, instance))
                # 'dfg_pre_dirs.*' is the DFG before the application of the HLS directives 
                # (corresponding to the IR 'a.g.ld.5.gdce.bc'), while 'dfg_post_dirs.*' is the DFG 
                # after the application of the HLS directives (corresponding to the IR 'a.o.3.bc')
                dfg_pre_lut_path = os.path.join(instance_folder, "dfg_pre_dirs_lut_ff.pkl")
                dfg_post_lut_path = os.path.join(instance_folder, "dfg_post_dirs_lut_ff.pkl")
                dfg_lut_pre = pickle.load(open(dfg_pre_lut_path, 'rb'))
                dfg_lut_post = pickle.load(open(dfg_post_lut_path, 'rb'))
                dfgs_lut = (dfg_lut_pre, dfg_lut_post)

                with open(os.path.join(instance_folder, "lut_label.txt"), 'r') as f:
                    lut = torch.FloatTensor([float(f.readline().strip())])

                self.data.append((dfgs_lut, lut))

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
                # 'dfg_pre_dirs.*' is the DFG before the application of the HLS directives 
                # (corresponding to the IR 'a.g.ld.5.gdce.bc'), while 'dfg_post_dirs.*' is the DFG 
                # after the application of the HLS directives (corresponding to the IR 'a.o.3.bc')
                dfg_pre_ff_path = os.path.join(instance_folder, "dfg_pre_dirs_lut_ff.pkl")
                dfg_post_ff_path = os.path.join(instance_folder, "dfg_post_dirs_lut_ff.pkl")
                dfg_ff_pre = pickle.load(open(dfg_pre_ff_path, 'rb'))
                dfg_ff_post = pickle.load(open(dfg_post_ff_path, 'rb'))
                dfgs_ff = (dfg_ff_pre, dfg_ff_post)

                with open(os.path.join(instance_folder, "ff_label.txt"), 'r') as f:
                    ff = torch.FloatTensor(list(map(float, f.readlines()[0].strip().split(','))))

                self.data.append((dfgs_ff, ff))

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
                # 'dfg_pre_dirs.*' is the DFG before the application of the HLS directives 
                # (corresponding to the IR 'a.g.ld.5.gdce.bc'), while 'dfg_post_dirs.*' is the DFG 
                # after the application of the HLS directives (corresponding to the IR 'a.o.3.bc')
                dfg_pre_dsp_path = os.path.join(instance_folder, "dfg_pre_dirs_dsp.pkl")
                dfg_post_dsp_path = os.path.join(instance_folder, "dfg_post_dirs_dsp.pkl")
                dfg_dsp_pre = pickle.load(open(dfg_pre_dsp_path, 'rb'))
                dfg_dsp_post = pickle.load(open(dfg_post_dsp_path, 'rb'))
                dfgs_dsp = (dfg_dsp_pre, dfg_dsp_post)

                with open(os.path.join(instance_folder, "dsp_label.txt"), 'r') as f:
                    dsp = torch.FloatTensor(list(map(float, f.readlines()[0].strip().split(','))))

                self.data.append((dfgs_dsp, dsp))


