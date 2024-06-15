import subprocess
from pathlib import Path
from os import environ

from llvm.exceptions import *

try:
    AHLS_LLVM_LIB = environ['AHLS_LLVM_LIB']
    OPT = environ['OPT']
    CLANG = environ['CLANG']
    LLVM_LINK = environ['LLVM_LINK']
except KeyError as error:
    print(f"Error: environment variable {error.args[0]} not defined.")
    raise

def update_md(ir_path : Path) -> Path:
    output_path = ir_path.parent / Path(ir_path.stem + ".md.bc")

    # Update operation metadata (include ID and signedness information)
    update_md_cmd = f"{OPT} -load {AHLS_LLVM_LIB} -update-md < {ir_path} > {output_path}"

    try: 
        subprocess.check_output(update_md_cmd, stderr=subprocess.STDOUT, shell=True)
        return output_path
    except subprocess.CalledProcessError as error:
        raise UpdateMDError(ir_path.as_posix(), error.returncode, error.output)
    
def instrument(ir_path : Path, data_stats_file_path : Path, populate_io_path : Path) -> Path:
    profiled_ir_path = ir_path.parent / Path(Path(ir_path.stem).stem + ".pf.bc")

    # Insert calls to profile functions after each binary operation and a call 
    # to a function that writes the profile data to the file in data_stats_file_path
    profile_cmd = f"{OPT} -load {AHLS_LLVM_LIB} -profile -pf {data_stats_file_path} < {ir_path} > {profiled_ir_path}"

    try:
        subprocess.check_output(profile_cmd, stderr=subprocess.STDOUT, shell=True)
    except subprocess.CalledProcessError as error:
        raise InstrumentationError(ir_path.as_posix(), error.returncode, error.output)

    # Link the profiled IR with the profiler and the function that populates the input/output data
    output_path = ir_path.parent / Path(Path(ir_path.stem).stem + "_instrumented.bc")
    profiler_path = Path(__file__).parent / Path("profiler/profiler.bc")
    link_cmd = f"{LLVM_LINK} {profiled_ir_path} {profiler_path} {populate_io_path} -o {output_path}"

    try:
        subprocess.check_output(link_cmd, stderr=subprocess.STDOUT, shell=True)
        return output_path
    except subprocess.CalledProcessError as error:
        raise InstrumentationError(ir_path.as_posix(), error.returncode, error.output)
    
def update_md_and_instrument(ir_path : Path, data_stats_file_path : Path, populate_io_path : Path) -> Path:
    ir_md_updated_path = update_md(ir_path)
    return instrument(ir_md_updated_path, data_stats_file_path, populate_io_path)
    
def apply_v2c(ir_path : Path, op_to_prune : int, const : int | float) -> Path:
    output_path = ir_path.parent / Path(ir_path.stem + f"_v2c_{op_to_prune}_{const}.bc")
    
    # Apply the v2c transformation to the IR
    v2c_cmd = f"{OPT} -load {AHLS_LLVM_LIB} -v2c -opid {op_to_prune} -const {const} < {ir_path} > {output_path}"
    
    try:
        subprocess.check_output(v2c_cmd, stderr=subprocess.STDOUT, shell=True)
        return output_path
    except subprocess.CalledProcessError as error:
        raise V2CError(ir_path.as_posix(), error.returncode, error.output)


