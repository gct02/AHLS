import subprocess, argparse
import numpy as np
from pathlib import Path
from os import environ
from sys import argv

from llvm.opt_utils import *
from llvm.clang_utils import *
from design_metrics.error_eval import *

try:
    AHLS_LLVM_LIB = environ['AHLS_LLVM_LIB']
    OPT = environ['OPT']
    CLANG = environ['CLANG']
    LLVM_LINK = environ['LLVM_LINK']
except KeyError as ahls_error:
    print(f"Error: environment variable {ahls_error.args[0]} not defined.")
    raise

def parse_args():
    parser = argparse.ArgumentParser(prog="ahls", description="AHLS: Approximate HLS")
    parser.add_argument("-i", "--input", help = "Input design IR path", required=True)
    parser.add_argument("-A", "--args", help = "Arguments to the design executable (excluding the output file path, i.e. the last argument)", nargs="+", required=True)
    parser.add_argument("-x", "--approx", help = "Path to the file containing the AC transformations to apply on the input design", required=True)
    parser.add_argument("-p", "--populate-io", help = "Path to the populate_io.ll file", required=True)
    parser.add_argument("-o", "--output", help = "Directory to store outputs from the execution of both the exact and approximate design", required=True)
    parser.add_argument("-e", "--error", help = "Error metric to use for evaluation", required=False, choices=["MSE", "RMSE", "accuracy", "errorrate"], default="MSE")
    parser.add_argument("-d", "--datastats", help = "Data stats file name", required=False, default="data_stats.txt")
    return parser.parse_args()

if __name__ == "__main__":
    args = parse_args()
    input_ir_path = Path(args.input)
    input_args = " ".join(args.args)
    ac_transforms_path = Path(args.approx)
    output_dir = Path(args.output)
    populate_io_path = Path(args.populate_io)
    error_metric = args.error
    data_stats_file = args.datastats

    input_ir_dir = input_ir_path.parent

    instrumented_ir_path = update_md_and_instrument(input_ir_path, data_stats_file, populate_io_path)
    instrumented_executable_path = input_ir_dir / Path(instrumented_ir_path.stem)
    create_executable_from_llvm_ir(instrumented_ir_path, instrumented_executable_path)

    approx_ir_path = instrumented_ir_path
    transforms_str = ""

    with open(ac_transforms_path, 'r') as f:
        ac_transforms = f.read().splitlines()
        for ac_transform in ac_transforms:
            ac_transform = ac_transform.split()
            transforms_str += "_" + "_".join(ac_transform)
            act = ac_transform[0]
            match act:
                case 'v2c':
                    op_to_prune = int(ac_transform[1])
                    const = float(ac_transform[2])
                    approx_ir_path = apply_v2c(approx_ir_path, op_to_prune, const)
                case _:
                    print(f"Error: Unknown ACT `{act}'")
    
    approx_executable_path = input_ir_dir / Path(approx_ir_path.stem)
    create_executable_from_llvm_ir(approx_ir_path, approx_executable_path)

    exact_output_path = output_dir / Path("output.txt")
    approx_output_path = output_dir / Path(f"output{transforms_str}.txt")

    # Run the instrumented executable
    run_exact_design_cmd = f"{instrumented_executable_path} {input_args} {exact_output_path}"
    run_approx_design_cmd = f"{approx_executable_path} {input_args} {approx_output_path}"

    subprocess.run(run_exact_design_cmd, stderr=subprocess.STDOUT, shell=True)
    subprocess.run(run_approx_design_cmd, stderr=subprocess.STDOUT, shell=True)

    exact_raw_output_path = exact_output_path.parent / Path(exact_output_path.stem + "_raw" + exact_output_path.suffix)
    approx_raw_output_path = approx_output_path.parent / Path(approx_output_path.stem + "_raw" + approx_output_path.suffix)

    with open(exact_raw_output_path, 'r') as f:
        exact_output = np.array(list(map(int, f.read().split())), dtype=np.float32)

    with open(approx_raw_output_path, 'r') as f:
        approx_output = np.array(list(map(int, f.read().split())), dtype=np.float32)

    match error_metric:
        case 'MSE':
            error = MSE(exact_output, approx_output)
        case 'RMSE':
            error = RMSE(exact_output, approx_output)
        case 'accuracy':
            error = accuracy(exact_output, approx_output)
        case 'errorrate':
            error = error_rate(exact_output, approx_output)
        case _:
            print(f"Error: Unknown error metric `{error_metric}'")
    
    print(f"{error_metric}: {error}")