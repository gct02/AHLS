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

def update_md(ir_path: Path) -> Path:
    """
    Apply the update-md pass to the IR file at ir_path and return the path to the updated IR file.
    The update-md pass updates the metadata of the operations in the IR to include the operation ID and signedness information.
    """
    output_path = ir_path.parent / (ir_path.stem + ".md.bc")

    # Update operation metadata (include ID and signedness information)
    update_md_cmd = f"{OPT} -load {AHLS_LLVM_LIB} -update-md < {ir_path.as_posix()} > {output_path.as_posix()}"

    try: 
        subprocess.check_output(update_md_cmd, stderr=subprocess.STDOUT, shell=True)
        return output_path
    except subprocess.CalledProcessError as error:
        raise UpdateMDError(ir_path.as_posix(), error.returncode, error.output)
    
def instrument(ir_path: Path, data_stats_file_path: Path, populate_io_path: Path) -> Path:
    """
    Instrument the IR file at ir_path with profiling functions, link the instrumented IR with the populate_io IR
    and return the path to the instrumented IR file.
    The instrumented IR file contains calls to profile functions after each binary operation and a call to a function
    that writes the profile data to the file in data_stats_file_path.
    """
    profiled_ir_path = ir_path.parent / (Path(ir_path.stem).stem + ".pf.bc")

    # Instrument the IR with profiling functions
    profile_cmd = f"{OPT} -load {AHLS_LLVM_LIB} -profile -pf {data_stats_file_path.as_posix()} < {ir_path.as_posix()} > {profiled_ir_path.as_posix()}"

    try:
        subprocess.check_output(profile_cmd, stderr=subprocess.STDOUT, shell=True)
    except subprocess.CalledProcessError as error:
        raise InstrumentationError(ir_path.as_posix(), error.returncode, error.output)

    # Link the profiled IR with the profiler and the function that populates the input/output data
    output_path = ir_path.parent / Path(Path(ir_path.stem).stem + "_instrumented.bc")
    profiler_path = Path(__file__).parent / "profiler/profiler.bc"
    link_cmd = f"{LLVM_LINK} {profiled_ir_path.as_posix()} {profiler_path.as_posix()} {populate_io_path.as_posix()} -o {output_path.as_posix()}"

    try:
        subprocess.check_output(link_cmd, stderr=subprocess.STDOUT, shell=True)
        return output_path
    except subprocess.CalledProcessError as error:
        raise InstrumentationError(ir_path.as_posix(), error.returncode, error.output)
    
def update_md_and_instrument(ir_path: Path, data_stats_file_path: Path, populate_io_path: Path) -> Path:
    """
    Update the metadata of the IR file at ir_path and instrument it with profiling functions.
    Return the path to the instrumented IR file.
    """
    ir_md_updated_path = update_md(ir_path)
    return instrument(ir_md_updated_path, data_stats_file_path, populate_io_path)

def apply_v2c(ir_path: Path, op_to_prune, const, output_path=None) -> Path:
    """
    Apply the variable-to-constant (v2c) transformation to the IR file at ir_path and return the path to the transformed IR file.
    """
    if output_path is None:
        output_path = ir_path.parent / (ir_path.stem + f"_v2c_{op_to_prune}_{const}.bc")
    
    # Apply the v2c transformation to the IR
    v2c_cmd = f"{OPT} -load {AHLS_LLVM_LIB} -v2c -opid {op_to_prune} -const {const} < {ir_path.as_posix()} > {output_path.as_posix()}"
    
    try:
        subprocess.check_output(v2c_cmd, stderr=subprocess.STDOUT, shell=True)
        return output_path
    except subprocess.CalledProcessError as error:
        raise V2CError(ir_path.as_posix(), error.returncode, error.output)
    
def apply_act(ir_path: Path, act: str, *args) -> Path:
    """
    Apply the ACT to the IR file at ir_path and return the path to the transformed IR file.
    """
    output_path = ir_path.parent / \
                  (ir_path.stem + f"_{act}_{'_'.join(list(filter(lambda x : x[0] != '-', args)))}.bc")
    
    # Apply the ACT transformation to the IR
    act_cmd = f"{OPT} -load {AHLS_LLVM_LIB} -{act} {' '.join(args)} < {ir_path.as_posix()} > {output_path.as_posix()}"
    
    try:
        subprocess.check_output(act_cmd, stderr=subprocess.STDOUT, shell=True)
        return output_path
    except subprocess.CalledProcessError as error:
        raise ACTError(act, ir_path.as_posix(), error.returncode, error.output)
    
def apply_act(ir_path: Path, act_with_args: str, output_path: Path) -> None:
    """
    Apply the ACT to the IR file at ir_path and write the transformed IR to output_path.
    """
    act_cmd = f"{OPT} -load {AHLS_LLVM_LIB} -{act_with_args} < {ir_path.as_posix()} > {output_path.as_posix()}"
    
    try:
        subprocess.check_output(act_cmd, stderr=subprocess.STDOUT, shell=True)
    except subprocess.CalledProcessError as error:
        raise ACTError(act_with_args, ir_path.as_posix(), error.returncode, error.output)

def extract_op_attrs_and_uses(md_ir_path: Path, op_attrs_path: Path, op_uses_path: Path):
    """
    Extract the operation attributes and uses from the IR file at md_ir_path and write them to op_attrs_path and op_uses_path respectively.
    """
    # Extract operation attributes
    op_attrs_cmd = f"{OPT} -load {AHLS_LLVM_LIB} -get-attrs -attr {op_attrs_path.as_posix()} < {md_ir_path.as_posix()}"
    try:
        subprocess.check_output(op_attrs_cmd, stderr=subprocess.STDOUT, shell=True)
    except subprocess.CalledProcessError as error:
        raise ExtractOpAttrsError(md_ir_path.as_posix(), error.returncode, error.output)

    # Extract operation uses
    op_uses_cmd = f"{OPT} -load {AHLS_LLVM_LIB} -get-uses -u {op_uses_path.as_posix()} < {md_ir_path.as_posix()}"
    try:
        subprocess.check_output(op_uses_cmd, stderr=subprocess.STDOUT, shell=True)
    except subprocess.CalledProcessError as error:
        raise ExtractOpUsesError(md_ir_path.as_posix(), error.returncode, error.output)
