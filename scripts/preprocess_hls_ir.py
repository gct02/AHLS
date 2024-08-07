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
    |   └── dfg.txt
    ├── data_stats
    ├── ir
    |   ├── <project_name>.bc
    |   ├── <project_name>.md.bc
    |   └── [<project_name>.md.inst.bc]
    ├── outputs
    └── <project_name>
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
    parser.add_argument("-ir", "--hls-ir", help="HLS kernel IR file path", required=True)
    parser.add_argument("-pj", "--project-name", help="Project name", required=True)
    parser.add_argument("-o", "--output-dir", help="Output directory", required=True)
    parser.add_argument("-host", "--host-ir", help="Host IR file path (i.e. the IR with a main function that calls the HLS top function)", default=None, required=False)
    parser.add_argument("-io", "--populate-io", help="Path to the populate_io IR file", default=None, required=False)
    parser.add_argument("-tcl", "--tcl", help="Path to the TCL script file", default=None, required=False)
    parser.add_argument("-inst", "--instrument", help="Instrument the IR file", action="store_true")
    parser.add_argument("-e", "--executable", help="Create an executable from the IR file", action="store_true")
    parser.add_argument("-dfg", "--dfg", help="Path to the file where the DFG of the IR should be written", default=None, required=False)
    return parser.parse_args()


if __name__ == "__main__":
    args = parse_args()
    input_ir_path = Path(args.hls_ir)
    output_dir = Path(args.output_dir)
    project_name = args.project_name
    host_ir_path = args.host_ir
    populate_io_path = args.populate_io
    tcl_path = args.tcl
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

    # Preprocess the Vitus HLS IR to make it executable on CPU
    input_ir_path = preprocess_vitis_hls_ir(input_ir_path, ir_folder / f"{project_name}.bc")

    if host_ir_path is not None:
        # Link the HLS IR with the host IR
        host_ir_path = Path(host_ir_path)
        temp_ir_path = ir_folder / f"{project_name}.temp.bc"
        link_cmd = f"{LLVM_LINK} {input_ir_path.as_posix()} {host_ir_path.as_posix()} -o {temp_ir_path.as_posix()}"
        subprocess.run(link_cmd, stderr=subprocess.STDOUT, shell=True)
        input_ir_path.unlink()
        temp_ir_path.rename(input_ir_path)

    # Update the metadata of the input IR file
    input_ir_path = update_md(input_ir_path)

    if tcl_path is not None:
        # Update the IR metadata with the directives from the TCL script
        tcl_path = Path(tcl_path)
        temp_ir_path = add_directives_md(input_ir_path, tcl_path)
        input_ir_path.unlink()
        temp_ir_path.rename(input_ir_path)

    get_dfg(input_ir_path, dfg_folder / "dfg.txt")

    if args.dfg is not None:
        # Move the DFG file to the specified path
        subprocess.run(f"mv {dfg_folder / 'dfg.txt'} {args.dfg}", stderr=subprocess.STDOUT, shell=True)

    if instrument_ir:
        # Instrument the input IR file
        if populate_io_path is not None:
            populate_io_path = Path(populate_io_path)
        input_ir_path = instrument(input_ir_path, data_stats_folder / "data_stats.txt", populate_io_path=populate_io_path)

    if args.executable:
        executable_path = output_dir / project_name
        create_executable_from_llvm_ir(input_ir_path, executable_path)