from scripts.approx import run_with_timeout
from llvm.opt_utils import apply_v2c
from llvm.clang_utils import create_executable_from_llvm_ir
from llvm.exceptions import *
from metrics.data_stats import *
from pathlib import Path
from sys import argv
import subprocess, time, os

APPROX_ERROR = -1

def apply_v2m_to_all_ops(exact_ir_path, exact_data_stats_path, approx_ir_folder, approx_exec_folder):
    data_stats = parse_data_stats_file(exact_data_stats_path)
    approx_ir_paths = []
    approx_exec_paths = []
    for opid, op_stats in data_stats.items():
        mean = op_stats[5]
        approx_ir_path = approx_ir_folder / Path(exact_ir_path.stem + f"_v2c_{opid}_{mean}.bc")
        apply_v2c(exact_ir_path, opid, mean, approx_ir_path)
        approx_exec_path = approx_exec_folder / Path(approx_ir_path.stem)
        create_executable_from_llvm_ir(approx_ir_path, approx_exec_path)
        approx_ir_paths.append(approx_ir_path)
        approx_exec_paths.append(approx_exec_path)
    return approx_ir_paths, approx_exec_paths, data_stats

def run_approx(approx_exec_path: Path, input_args, output_path, data_stats_path, timeout):
    exec_cmd = f"{approx_exec_path.as_posix()} {input_args} {output_path.as_posix()}"
    try:
        run_with_timeout(exec_cmd, timeout, approx_exec_path, output_path)
    except Exception as e:
        return APPROX_ERROR
    mv_data_stats_cmd = f"mv data_stats.txt {data_stats_path.as_posix()}"
    subprocess.run(mv_data_stats_cmd, stderr=subprocess.STDOUT, shell=True)
    return 0

def create_design_subdirs(parent_dir: Path, design_name: str):
    data_stats_dir = parent_dir / "data_stats"
    exec_dir = parent_dir / "exec"
    ir_dir = parent_dir / "ir"
    output_dir = parent_dir / "outputs"

    data_stats_design_dir = data_stats_dir / design_name
    exec_design_dir = exec_dir / design_name
    ir_design_dir = ir_dir / design_name
    output_design_dir = output_dir / design_name

    data_stats_design_dir.mkdir(parents=True, exist_ok=True)
    exec_design_dir.mkdir(parents=True, exist_ok=True)
    ir_design_dir.mkdir(parents=True, exist_ok=True)
    output_design_dir.mkdir(parents=True, exist_ok=True)

    return data_stats_design_dir, exec_design_dir, ir_design_dir, output_design_dir

if __name__ == "__main__":
    input_ir = Path(argv[1])
    input_exec = Path(argv[2])
    input_exec_args = argv[2]

    current_file_dir = Path(__file__).parent
    ahls_dataset = current_file_dir / "ahls_dataset"

    approx_designs_dir = ahls_dataset / "approx_designs"
    approx_data_stats_dir = approx_designs_dir / "data_stats"
    approx_exec_dir = approx_designs_dir / "exec"
    approx_ir_dir = approx_designs_dir / "ir"
    approx_output_dir = approx_designs_dir / "outputs"

    exact_designs_dir = ahls_dataset / "exact_designs"
    exact_data_stats_dir = exact_designs_dir / "data_stats"
    exact_exec_dir = exact_designs_dir / "exec"
    exact_ir_dir = exact_designs_dir / "ir"
    exact_output_dir = exact_designs_dir / "outputs"

    design_name = input_exec.stem
    exact_design_data_stats_dir, exact_design_exec_dir, exact_design_ir_dir, exact_design_output_dir = create_design_subdirs(exact_designs_dir, design_name)
    approx_design_data_stats_dir, approx_design_exec_dir, approx_design_ir_dir, approx_design_output_dir = create_design_subdirs(approx_designs_dir, design_name)

    subprocess.run(f"mv {input_ir.as_posix()} {exact_design_data_stats_dir.as_posix()}", stderr=subprocess.STDOUT, shell=True)
    subprocess.run(f"mv {input_exec.as_posix()} {exact_design_exec_dir.as_posix()}", stderr=subprocess.STDOUT, shell=True)

    input_args_str = ""
    for input_arg in input_exec_args.split():
        if input_arg[0] != "-":
            input_args_str += "_" + input_arg[(input_arg.rfind("/") + 1):] if "/" in input_arg else "_" + input_arg

    exact_output_path = exact_design_output_dir / f"{design_name}{input_args_str}.txt"
    exact_data_stats_path = exact_design_data_stats_dir / f"{design_name}{input_args_str}.txt"

    # Execute the exact design
    start = time.time()
    subprocess.run(f"{input_exec.as_posix()} {input_exec_args} {exact_output_path.as_posix()}", stderr=subprocess.STDOUT, shell=True)
    end = time.time()
    exact_exec_time = end - start
    timeout = 2 * exact_exec_time

    subprocess.run(f"mv data_stats.txt {exact_data_stats_path.as_posix()}", stderr=subprocess.STDOUT, shell=True)

    apply_v2m_to_all_ops(exact_design_ir_dir, exact_data_stats_path, approx_design_ir_dir, approx_design_exec_dir)