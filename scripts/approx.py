import numpy as np

import subprocess, argparse, time, psutil, struct
from pathlib import Path
from os import environ

from llvm.opt_utils import *
from llvm.clang_utils import *
from metrics.error_measure import *


'''
This script assumes that the input design IR file is already instrumented and linked with the populate_io IR file.
The project's working directory should be structured as follows:
    .
    ├── approx
    ├── dfg
    ├── data_stats
    ├── ir
    |   ...
    │   ├── <design_name>.inst.bc
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


def run_with_timeout(run_cmd, max_execution_time, transformed_executable_path: Path, transformed_output_dir: Path):
    """
    Runs a subprocess with a timeout and handles process termination.
    """
    timeout_exceeded = False
    try:
        process = subprocess.Popen(run_cmd, shell=True)
        start_time = time.time()

        while True:
            if time.time() - start_time > max_execution_time:
                # Process exceeded timeout, terminate it
                for proc in psutil.process_iter():
                    if proc.name() == transformed_executable_path:
                        proc.terminate()
                        timeout_error_msg = f"Error: Transformed design took more than {max_execution_time} seconds to execute."
                        timeout_exceeded = True
                        break
                break
            # Check if process has finished naturally
            if process.poll() is not None:
                break
            time.sleep(1) # Check every second

        # Clean up output directory if process failed or timed out
        if timeout_exceeded:
            if transformed_output_dir.exists():
                transformed_output_dir.unlink()
            if Path("data_stats.txt").exists():
                Path("data_stats.txt").unlink()
            raise TimeoutError(timeout_error_msg)

    except Exception as e:
        if transformed_output_dir.exists():
            transformed_output_dir.unlink()
        if Path("data_stats.txt").exists():
            Path("data_stats.txt").unlink()
        raise Exception(f"Error while executing transformed design: {e}")


def create_approx_design(input_ir: Path, act_with_args: str) -> Path:
    approx_suffix = ""
    act_tokens = act_with_args.split()
    for token in act_tokens:
        if token[0] != "-":
            approx_suffix += "_" + token[(token.rfind("/") + 1):] if "/" in token else "_" + token

    approx_ir_path = input_ir.parent / Path(input_ir.stem + approx_suffix + ".bc")
    apply_act(input_ir, act_with_args, approx_ir_path)

    return approx_ir_path


def parse_args():
    parser = argparse.ArgumentParser(prog="ahls", description="AHLS: Approximate HLS")
    parser.add_argument("-w", "--dir", help = "The project's working directory", required=True)
    parser.add_argument("-d", "--design", help = "Design's exact executable name", required=True)
    parser.add_argument("-A", "--args", help = "Arguments to the design's executable (excluding the output file path, i.e., the last argument)", \
                        nargs="*", required=False, default=[])
    parser.add_argument("-a", "--approx", help = "Path to the file containing the AC transformations", required=True)
    parser.add_argument("-e", "--error", help = "Error metric to use for evaluation", choices=["MSE", "RMSE", "accuracy", "errorrate"], required=True)
    parser.add_argument("-t", "--outtype", help = "Output type of the design", choices=["int", "float", "double"], required=True)
    parser.add_argument("-x", "--hex", help = "Sinalize that the output is in hex format", action="store_true")
    return parser.parse_args()


def str_to_float(s, hex):
    if hex:
        if '0x' in s:
            return struct.unpack('f', bytes.fromhex(s[2:]))[0]
        return struct.unpack('f', bytes.fromhex(s))[0]
    return float(s)


def str_to_double(s, hex):
    if hex:
        if '0x' in s:
            return struct.unpack('d', bytes.fromhex(s[2:]))[0]
        return struct.unpack('d', bytes.fromhex(s))[0]
    return float(s)


def str_to_int(s, hex):
    if hex:
        return int(s, 16)
    return int(s)


def str_to_num(s, outtype, hex):
    if outtype == "float":
        return str_to_float(s, hex)
    elif outtype == "int":
        return str_to_int(s, hex)
    else:
        return str_to_double(s, hex)
    

if __name__ == "__main__":
    args = parse_args()
    working_dir = Path(args.dir)
    design_name = args.design
    input_args = " ".join(args.args)
    ac_transforms_path = Path(args.approx)
    error_metric = args.error
    output_type = args.outtype
    hex_output = args.hex

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

    start = time.time()
    try:
        subprocess.run(run_cmd, shell=True)
    except subprocess.CalledProcessError as e:
        print(f"Error while executing original design: {e}")
        if original_output_dir.exists():
            original_output_dir.unlink()
        if Path("data_stats.txt").exists():
            Path("data_stats.txt").unlink()
        exit(1)
    end = time.time()

    original_execution_time = end - start

    # Rename and move the data stats file of the original design
    original_data_stats_name = f"data_stats{original_files_suffix}.txt"
    rename_data_stats_cmd = f"mv data_stats.txt {(working_dir / Path('data_stats/' + original_data_stats_name)).as_posix()}"
    subprocess.run(rename_data_stats_cmd, shell=True)

    # Apply the AC transformations on the input design
    transformed_design_name = f"{design_name}{approx_args_str}"
    original_ir_path = working_dir / Path(f"ir/{design_name}.inst.bc")
    transformed_ir_path = working_dir / Path(f"ir/{transformed_design_name}.bc")
    temp_ir_path = working_dir / Path(f"ir/temp.bc")

    # Copy the original IR file to a temporary file
    copy_cmd = f"cp {original_ir_path.as_posix()} {temp_ir_path.as_posix()}"
    subprocess.run(copy_cmd, shell=True)

    for ac_transform in approx_args:
        apply_act(temp_ir_path, ac_transform, transformed_ir_path)
        copy_cmd = f"cp {transformed_ir_path.as_posix()} {temp_ir_path.as_posix()}"
        subprocess.run(copy_cmd, shell=True)

    # Apply LLVM optimizations on the transformed IR file
    mem2reg_cmd = f"{OPT} -mem2reg {temp_ir_path.as_posix()} -o {transformed_ir_path.as_posix()}"
    subprocess.run(mem2reg_cmd, shell=True)
    copy_cmd = f"cp {transformed_ir_path.as_posix()} {temp_ir_path.as_posix()}"
    subprocess.run(copy_cmd, shell=True)
    opt_cmd = f"{OPT} -sccp -dce -O3 {temp_ir_path.as_posix()} -o {transformed_ir_path.as_posix()}"
    subprocess.run(opt_cmd, shell=True)

    # Delete the temporary IR file
    delete_cmd = f"rm {temp_ir_path}"
    subprocess.run(delete_cmd, shell=True)

    # Compile the transformed IR file to an executable
    transformed_executable_path = working_dir / Path(f"{transformed_design_name}")
    create_executable_from_llvm_ir(transformed_ir_path, transformed_executable_path)

    # Execute the transformed design
    transformed_output_dir = working_dir / Path(f"outputs/output{approx_files_suffix}.txt")
    run_cmd = f"{transformed_executable_path} {input_args} {transformed_output_dir.as_posix()}"
    
    max_execution_time = original_execution_time * 2
    run_with_timeout(run_cmd, max_execution_time, transformed_executable_path, transformed_output_dir)

    # Rename and move the data stats file of the transformed design
    transformed_data_stats_name = f"data_stats{approx_files_suffix}.txt"
    rename_data_stats_cmd = f"mv data_stats.txt {(working_dir / Path('data_stats/' + transformed_data_stats_name)).as_posix()}"
    subprocess.run(rename_data_stats_cmd, shell=True)

    original_raw_output_path = original_output_dir.parent / Path(original_output_dir.stem + "_raw.txt")
    transformed_raw_output_path = transformed_output_dir.parent / Path(transformed_output_dir.stem + "_raw.txt")

    with open(original_raw_output_path, 'r') as f:
        original_output = np.array(list(map(lambda x: str_to_num(x, output_type, hex_output), f.read().split())), dtype=np.float64)

    with open(transformed_raw_output_path, 'r') as f:
        approx_output = np.array(list(map(lambda x: str_to_num(x, output_type, hex_output), f.read().split())), dtype=np.float64)

    if error_metric == 'MSE':
        error = MSE(original_output, approx_output)
        print(f"{error_metric}: {error}")
    elif error_metric == 'RMSE':
        error = RMSE(original_output, approx_output)
        print(f"{error_metric}: {error}")
    elif error_metric == 'accuracy':
        error = accuracy(original_output, approx_output)
        print(f"{error_metric}: {error}")
    elif error_metric == 'errorrate':
        error = error_rate(original_output, approx_output)
        print(f"{error_metric}: {error}")
    else:
        print(f"Error: Unknown error metric `{error_metric}'")
