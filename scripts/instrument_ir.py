import argparse, subprocess
from pathlib import Path
from os import environ

from llvm.opt_utils import *
from llvm.clang_utils import *

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
    parser.add_argument("-i", "--input", help = "Input IR file path", required=True)
    parser.add_argument("-p", "--populate-io", help = "Path to the populate_io IR file", required=True)
    parser.add_argument("-o", "--output", help = "Output directory", required=True)
    return parser.parse_args()

if __name__ == "__main__":
    '''
    The output directory will have the following structure:
        .
        ├── approx
        ├── data_stats
        ├── ir
        |   ├── <input_ir_stem>.(bc|ll)
        |   ├── <input_ir_stem>.md.bc
        |   ├── <input_ir_stem>.pf.bc
        |   ├── <input_ir_stem>_instrumented.bc
        |   ├── <populate_io_stem>.(bc|ll)
        |   └── <populate_io_stem>.md.bc
        ├── outputs
        └── <input_ir_stem>
    '''
    args = parse_args()
    input_ir_path = Path(args.input)
    populate_io_path = Path(args.populate_io)
    output_dir = Path(args.output)

    approx_folder = output_dir / Path("approx")
    data_stats_folder = output_dir / Path("data_stats")
    ir_folder = output_dir / Path("ir")
    outputs_folder = output_dir / Path("outputs")

    # Create the output directories
    output_dir.mkdir(parents=True, exist_ok=True)
    approx_folder.mkdir(parents=True, exist_ok=True)
    data_stats_folder.mkdir(parents=True, exist_ok=True)
    ir_folder.mkdir(parents=True, exist_ok=True)
    outputs_folder.mkdir(parents=True, exist_ok=True)

    mv_input_ir_cmd = f"mv {input_ir_path.as_posix()} {ir_folder.as_posix()}"
    mv_populate_io_cmd = f"mv {populate_io_path.as_posix()} {ir_folder.as_posix()}"

    # Move the input IR and populate_io files to the ir subdirectory
    subprocess.run(mv_input_ir_cmd, shell=True)
    subprocess.run(mv_populate_io_cmd, shell=True)

    input_ir_path = ir_folder / input_ir_path.name
    populate_io_path = ir_folder / populate_io_path.name

    # Instrument the input IR file
    instrumented_ir_path = update_md_and_instrument(input_ir_path, Path("data_stats.txt"), populate_io_path)

    executable_path = output_dir / input_ir_path.stem
    create_executable_from_llvm_ir(instrumented_ir_path, executable_path)