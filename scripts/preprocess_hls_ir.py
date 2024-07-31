import argparse, subprocess
from pathlib import Path
from os import environ

from llvm.opt_utils import *
from llvm.clang_utils import *


'''
The output directory will have the following structure:
    .
    ├── approx
    ├── dfg
    |   ├── dfg.txt
    ├── data_stats
    ├── ir
    |   ├── <input_ir_stem>.(bc|ll)
    |   ├── <input_ir_stem>.md.bc
    |   ├── [<input_ir_stem>_instrumented.bc]
    |   └── [<populate_io_stem>.(bc|ll)]
    ├── outputs
    └── <input_ir_stem>
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
    parser = argparse.ArgumentParser(prog="preprocess_hls_ir", description="Preprocess an IR from Vitis HLS")
    parser.add_argument("-ir", "--input-ir", help = "Input IR file path", required=True)
    parser.add_argument("-out-dir", "--output-dir", help = "Output directory", required=True)
    parser.add_argument("-pop-io", "--populate-io", help = "Path to the populate_io IR file", default=None, required=False)
    parser.add_argument("-tcl", "--tcl", help = "Path to the TCL script file", default=None, required=False)
    parser.add_argument("-inst", "--instrument", help = "Instrument the IR file", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    args = parse_args()
    input_ir_path = Path(args.input_ir)
    output_dir = Path(args.output_dir)
    populate_io_path = Path(args.populate_io)
    tcl_path = Path(args.tcl)
    instrument_ir = args.instrument

    approx_folder = output_dir / "approx"
    data_stats_folder = output_dir / "data_stats"
    dfg_folder = output_dir / "dfg"
    ir_folder = output_dir / "ir"
    outputs_folder = output_dir / "outputs"

    # Create the output directories
    output_dir.mkdir(parents=True, exist_ok=True)
    approx_folder.mkdir(parents=True, exist_ok=True)
    data_stats_folder.mkdir(parents=True, exist_ok=True)
    dfg_folder.mkdir(parents=True, exist_ok=True)
    ir_folder.mkdir(parents=True, exist_ok=True)
    outputs_folder.mkdir(parents=True, exist_ok=True)

    # Move the input IR and populate_io files to the ir subdirectory
    subprocess.run(f"mv {input_ir_path.as_posix()} {ir_folder.as_posix()}", shell=True)
    if populate_io_path is not None:
        subprocess.run(f"mv {populate_io_path.as_posix()} {ir_folder.as_posix()}", shell=True)

    input_ir_path = ir_folder / input_ir_path.name
    populate_io_path = ir_folder / populate_io_path.name

    # Update the metadata of the input IR file
    input_ir_path = update_md(input_ir_path)

    if tcl_path is not None:
        # Update the IR metadata with the directives from the TCL script
        temp_ir_path = add_directives_md(input_ir_path, tcl_path)
        input_ir_path.unlink()
        temp_ir_path.rename(input_ir_path)

    get_dfg(input_ir_path, dfg_folder / "dfg.txt")

    if instrument_ir:
        # Instrument the input IR file
        input_ir_path = instrument(input_ir_path, data_stats_folder / "data_stats.txt", populate_io_path=populate_io_path)

    executable_path = output_dir / input_ir_path.stem
    create_executable_from_llvm_ir(input_ir_path, executable_path)