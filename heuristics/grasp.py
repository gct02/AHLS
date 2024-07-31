from pathlib import Path
import random, subprocess
import torch

from heuristics.heuristic import Heuristic
from heuristics.random_search import RandACT
from estimators.gnn.gat import GAT
from metrics import error_measure, resource_savings
from scripts.approx import create_approx_design, run_with_timeout
from llvm.clang_utils import create_executable_from_llvm_ir

class GRASP(Heuristic):
    def __init__(self, trained_estimator_path: Path, n_iter=100):
        self.n_iter = n_iter
        with open(trained_estimator_path, "rb") as f:
            self.estimator = torch.load(f)

    # Randomized Greedy Construction
    def RGC(self, design_ir, ac_transforms):
        ...

    def locas_search(self, ac_transforms):
        ...

    def run(self, design_ir: Path, design_executable: Path, data_stats: Path, ac_transforms: list, exact_design_exec_time: float, input_args: str):
        """
        Parameters
        ----------
        * design_ir:
            Intermediate representation of the design. It assumes that this IR is already preprocessed
            (i.e., with metadata added with the 'update-md' pass and instrumented with the 'profile' pass,
            as well as linked with the IR containing the functions to handle the input/output of the design).
        * data_stats:
            Path to the file containing the statistics obtained from the profiled operations.
        * ac_transforms:
            List of available AC transformations (i.e., ACTs applied to the design_ir constructs).

        Returns
        -------
        None

        Notes
        -----
        The run method is responsible for executing the GRASP heuristic. It should initially apply all the 
        transformations in ac_transforms and test them, keeping only the ones that do not break the program.
        With the subset of AC transformations that is kept after this process, we calculate the error measure E
        and resource savings R of each design and build a Restricted Candidate List (RCL) with the Pareto-optimal
        solutions (considering the minimization of E and maximization of R). Starting from this initial RCL, we
        run the RGC and Local Search procedures n_iter times.
        """
        valid_approx_designs = []
        approx_data_stats = []
        timeout = 2 * exact_design_exec_time

        for ac_transform in ac_transforms:
            approx_design_path = create_approx_design(design_ir, ac_transform)
            approx_design_executable = design_executable.parent / Path(approx_design_path.stem)
            create_executable_from_llvm_ir(approx_design_path, approx_design_executable)
            approx_args_str = approx_design_path.stem[len(design_ir.stem)-1:]
            approx_output_path = design_executable.parent / Path(f"outputs/output{approx_args_str}.txt") 
            approx_data_stats_path = data_stats.parent / Path(data_stats.stem + approx_args_str + ".txt")
            run_cmd = f"{approx_design_executable.as_posix()} {input_args} {approx_output_path}"
            valid = True
            try:
                run_with_timeout(run_cmd, timeout, approx_design_executable, approx_output_path)
            except Exception as e:
                valid = False
            if valid:
                valid_approx_designs.append(approx_design_path)
                approx_data_stats.append(approx_data_stats_path)
                rename_data_stats_cmd = f"mv data_stats.txt {approx_data_stats_path.as_posix()}"
                subprocess.run(rename_data_stats_cmd, shell=True)


        

    

    
    
