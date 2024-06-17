import subprocess, argparse
import numpy as np
from pathlib import Path
from os import environ

from llvm.opt_utils import *
from llvm.clang_utils import *
from design_metrics.error_eval import *

'''
This script assumes that the input design IR file is already instrumented and linked with the populate_io IR file.
The working directory should be structured as follows:
    .
    ├── approx
    ├── data_stats
    ├── ir
    │   ├── <design_name>_instrumented.bc
    |   ...
    ├── outputs
    ├── <design_name>
    ...

The script will execute the input design and the transformed design, compare their outputs using the specified error metric,
and print the error value.
'''

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
    parser.add_argument("-w", "--dir", help = "The working directory", required=True)
    parser.add_argument("-d", "--design", help = "Design name", required=True)
    parser.add_argument("-A", "--args", help = "Arguments to the design executable (excluding the output file path, i.e. the last argument)", nargs="*", required=False, default=[])
    parser.add_argument("-a", "--approx", help = "Path to the file containing the AC trainsformations to apply on the input design", required=True)
    parser.add_argument("-e", "--error", help = "Error metric to use for evaluation", choices=["MSE", "RMSE", "accuracy", "errorrate"], required=True)
    return parser.parse_args()

if __name__ == "__main__":
    args = parse_args()
    working_dir = Path(args.dir)
    design_name = args.design
    input_args = " ".join(args.args)
    ac_transforms_path = Path(args.approx)
    error_metric = args.error

    # Make a string describing the input arguments for the design executable
    # For instance, if the arguments are "-i input.txt -n 2", this string will be "_input.txt_2"
    input_args_str = ""
    for input_arg in args.args:
        if input_arg[0] != "-":
            input_args_str += "_" + input_arg[(input_arg.rfind("/") + 1):] if "/" in input_arg else "_" + input_arg

    # Make a list with all AC transforms to apply on the input design and a string describing tthese transforms
    # For instance, if the AC transformations are "v2c -opid 32 -const 5", this string will be "_v2c_32_5"
    approx_args = []
    approx_args_str = ""
    with open(ac_transforms_path, 'r') as f:
        approx_args = f.read().splitlines()
        for ac_transform in approx_args:
            ac_transform = ac_transform.split()
            for ac_arg in ac_transform:
                if ac_arg[0] != "-":
                    approx_args_str += "_" + ac_arg
    
    # The output and data stats files of the original and transformed designs will have, respectively,
    # the suffixes {input_args_str} and {input_args_str}{approx_args_str}
    original_files_suffix = input_args_str
    approx_files_suffix = input_args_str + approx_args_str

    # Execute the original design
    original_output_dir = working_dir / Path(f"outputs/output{original_files_suffix}.txt")
    run_cmd = f"{(working_dir / Path(design_name)).as_posix()} {input_args} {original_output_dir.as_posix()}"
    subprocess.run(run_cmd, shell=True)

    # Rename and move the data stats file of the original design
    original_data_stats_name = f"data_stats{original_files_suffix}.txt"
    rename_data_stats_cmd = f"mv data_stats.txt {(working_dir / Path('data_stats/' + original_data_stats_name)).as_posix()}"
    subprocess.run(rename_data_stats_cmd, shell=True)

    # Apply the AC transformations on the input design
    transformed_design_name = f"{design_name}{approx_args_str}"
    original_ir_path = working_dir / Path(f"ir/{design_name}_instrumented.bc")
    transformed_ir_path = working_dir / Path(f"ir/{transformed_design_name}.bc")
    temp_ir_path = working_dir / Path(f"ir/temp.bc")

    # Copy the original IR file to a temporary file
    copy_cmd = f"cp {original_ir_path} {temp_ir_path}"
    subprocess.run(copy_cmd, shell=True)

    for ac_transform in approx_args:
        apply_act(temp_ir_path, ac_transform, transformed_ir_path)
        copy_cmd = f"cp {transformed_ir_path} {temp_ir_path}"
        subprocess.run(copy_cmd, shell=True)

    # Delete the temporary IR file
    delete_cmd = f"rm {temp_ir_path}"
    subprocess.run(delete_cmd, shell=True)

    # Compile the transformed IR file to an executable
    transformed_executable_path = working_dir / Path(f"{transformed_design_name}")
    create_executable_from_llvm_ir(transformed_ir_path, transformed_executable_path)

    # Execute the transformed design
    transformed_output_dir = working_dir / Path(f"outputs/output{approx_files_suffix}.txt")
    run_cmd = f"{transformed_executable_path} {input_args} {transformed_output_dir.as_posix()}"
    subprocess.run(run_cmd, shell=True)

    # Rename and move the data stats file of the transformed design
    transformed_data_stats_name = f"data_stats{approx_files_suffix}.txt"
    rename_data_stats_cmd = f"mv data_stats.txt {(working_dir / Path('data_stats/' + transformed_data_stats_name)).as_posix()}"
    subprocess.run(rename_data_stats_cmd, shell=True)

    original_raw_output_path = original_output_dir.parent / Path(original_output_dir.stem + "_raw.txt")
    transformed_raw_output_path = transformed_output_dir.parent / Path(transformed_output_dir.stem + "_raw.txt")

    with open(original_raw_output_path, 'r') as f:
        original_output = np.array(list(map(int, f.read().split())), dtype=np.float32)

    with open(transformed_raw_output_path, 'r') as f:
        approx_output = np.array(list(map(int, f.read().split())), dtype=np.float32)

    match error_metric:
        case 'MSE':
            error = MSE(original_output, approx_output)
        case 'RMSE':
            error = RMSE(original_output, approx_output)
        case 'accuracy':
            error = accuracy(original_output, approx_output)
        case 'errorrate':
            error = error_rate(original_output, approx_output)
        case _:
            print(f"Error: Unknown error metric `{error_metric}'")
    
    print(f"{error_metric}: {error}")
