import subprocess
from pathlib import Path
from os import environ
from exceptions import *

try:
    DSE_LIB = environ['DSE_LIB']
    OPT = environ['OPT']
    CLANG = environ['CLANG']
    LLVM_LINK = environ['LLVM_LINK']
except KeyError as error:
    print(f"Error: environment variable {error.args[0]} not defined.")
    raise

def execute_opt(
    input_path: Path, 
    output_path: Path = None,
    args: str = "",
) -> None:
    """
    Execute the opt command with the arguments in args on the IR file
    at input_path and write the output to output_path.
    """

    opt_cmd = f"{OPT} -load {DSE_LIB} {args} < {input_path.as_posix()}"
    if output_path is not None:
        opt_cmd += f" > {output_path.as_posix()}"
    
    try:
        subprocess.check_output(opt_cmd, shell=True,
                                stderr=subprocess.STDOUT)
    except subprocess.CalledProcessError as error:
        raise OptError(input_path.as_posix(), 
                       error.returncode, error.output)

def update_md(
    ir_path: Path, 
    output_path: Path = None
) -> Path:
    """
    Apply the update-md pass to the IR file at ir_path and return 
    the path to the updated IR file.
    The update-md pass updates the metadata of the operations in the IR 
    to include the module's operations IDs, opcodes, bitwidths and directives 
    information.
    """
    if output_path is None:
        output_path = ir_path.parent / (ir_path.stem + ".md.bc")

    update_md_cmd = f"{OPT} -load {DSE_LIB} -update-md < " + \
                    f"{ir_path.as_posix()} > {output_path.as_posix()}"

    try: 
        subprocess.check_output(update_md_cmd, shell=True,
                                stderr=subprocess.STDOUT)
        return output_path
    except subprocess.CalledProcessError as error:
        raise UpdateMDError(ir_path.as_posix(), 
                            error.returncode, error.output)
    
def preprocess_vitis_hls_ir(
    ir_path: Path, 
    output_path: Path
) -> Path:
    """
    Preprocess the Vitis HLS IR file at ir_path and write the preprocessed 
    IR to output_path.
    """
    temp_path = ir_path.parent / (ir_path.stem + "_temp.bc")
    
    try:
        execute_opt(ir_path, temp_path, 
                    "-strip-debug -mem2reg -instcombine -loop-simplify -indvars")
        execute_opt(temp_path, temp_path, "-analyze -scalar-evolution")
        execute_opt(temp_path, args="-prep-x86")
        temp_path.unlink()
        return output_path
    except subprocess.CalledProcessError as error:
        temp_path.unlink()
        raise PreprocessVitisHLSError(ir_path.as_posix(), 
                                      error.returncode, error.output)
    
def instrument(
    ir_path: Path, 
    data_stats_file_path: Path, 
    populate_io_path: Path = None, 
    output_path: Path = None
) -> Path:
    """
    Instrument the IR file at ir_path with profiling functions, 
    link the instrumented IR with the populate_io IR and return 
    the path to the instrumented IR file.

    The instrumented IR file contains calls to profile functions 
    after each binary operation and a call to a function that writes 
    the profile data to the file in data_stats_file_path.
    """
    profiled_ir_path = ir_path.parent / (Path(ir_path.stem).stem + ".inst.temp.bc")

    profile_cmd = f"{OPT} -load {DSE_LIB} -profile -pf " + \
                  f"-data-stats-file {data_stats_file_path.as_posix()} " + \
                  f"< {ir_path.as_posix()} > {profiled_ir_path.as_posix()}"

    try:
        # Instrument the IR with profiling functions
        subprocess.check_output(profile_cmd, shell=True,
                                stderr=subprocess.STDOUT)
    except subprocess.CalledProcessError as error:
        raise InstrumentationError(ir_path.as_posix(), 
                                   error.returncode, error.output)

    if output_path is None:
        output_path = ir_path.parent / Path(ir_path.stem + ".inst.bc")
    profiler_path = Path(__file__).parent / "profiler/profiler.bc"

    # Link the profiled IR with the profiler and, if necessary, 
    # with a function to handle input/output data (defined in 'populate_io_path')
    try:
        if populate_io_path is not None:
            link_cmd = f"{LLVM_LINK} {profiled_ir_path.as_posix()} " + \
                       f"{profiler_path.as_posix()} {populate_io_path.as_posix()} " + \
                       f"-o {output_path.as_posix()}"
        else:
            link_cmd = f"{LLVM_LINK} {profiled_ir_path.as_posix()} " + \
                       f"{profiler_path.as_posix()} -o {output_path.as_posix()}"
            
        subprocess.check_output(link_cmd, shell=True,
                                stderr=subprocess.STDOUT)
        profiled_ir_path.unlink()
        return output_path
    except subprocess.CalledProcessError as error:
        raise InstrumentationError(ir_path.as_posix(), error.returncode, error.output)
    
    
def update_md_and_instrument(
    ir_path: Path, 
    data_stats_file_path: Path, 
    populate_io_path: Path = None, 
    output_path: Path = None
) -> Path:
    """
    Update the metadata of the IR file at ir_path and instrument it 
    with profiling functions.
    Return the path to the instrumented IR file.
    """
    try:
        ir_md_updated_path = update_md(ir_path)
        instrumented_ir_path = instrument(
            ir_md_updated_path, 
            data_stats_file_path, 
            populate_io_path, 
            output_path
        )
        return instrumented_ir_path
    except AHLSPassException as error:
        raise error


def apply_v2c(
    ir_path: Path, 
    op_to_prune: int, 
    const: int, 
    output_path: Path = None
) -> Path:
    """
    Apply the variable-to-constant (v2c) transformation to the IR file 
    at ir_path and return the path to the transformed IR file.
    """
    if output_path is None:
        output_path = ir_path.parent / \
                      (ir_path.stem + f"_v2c_{op_to_prune}_{const}.bc")
    
    v2c_cmd = f"{OPT} -load {DSE_LIB} -v2c -opid {op_to_prune} -const " + \
              f"{const} < {ir_path.as_posix()} > {output_path.as_posix()}"
    
    try:
        subprocess.check_output(v2c_cmd, shell=True,
                                stderr=subprocess.STDOUT)
        return output_path
    except subprocess.CalledProcessError as error:
        raise V2CError(ir_path.as_posix(), 
                       error.returncode, error.output)
    
def apply_act(ir_path: Path, act: str, *args) -> Path:
    """
    Apply the ACT to the IR file at ir_path and return the path 
    to the transformed IR file.
    """
    postfix = f"_{act}_{'_'.join(list(filter(lambda x : x[0] != '-', args)))}.bc"
    output_path = ir_path.parent / (ir_path.stem + postfix)
    
    act_cmd = f"{OPT} -load {DSE_LIB} -{act} {' '.join(args)} < " + \
              f"{ir_path.as_posix()} > {output_path.as_posix()}"
    
    try:
        subprocess.check_output(act_cmd, shell=True,
                                stderr=subprocess.STDOUT)
        return output_path
    except subprocess.CalledProcessError as error:
        raise ACTError(act, ir_path.as_posix(), 
                       error.returncode, error.output)
    
def apply_act(
    ir_path: Path, 
    act_with_args: str, 
    output_path: Path
) -> None:
    """
    Apply the ACT to the IR file at ir_path and write the 
    transformed IR to output_path.
    """
    act_cmd = f"{OPT} -load {DSE_LIB} -{act_with_args} < {ir_path.as_posix()} " + \
              f"> {output_path.as_posix()}"
    try:
        subprocess.check_output(act_cmd, shell=True,
                                stderr=subprocess.STDOUT)
    except subprocess.CalledProcessError as error:
        raise ACTError(act_with_args, ir_path.as_posix(), 
                       error.returncode, error.output)
    
def add_directives_md(
    ir_path: Path, 
    tcl_path: Path, 
    output_path: Path = None
) -> Path:
    if output_path is None:
        output_path = ir_path.parent / (ir_path.stem + ".dir.bc")
    
    add_directives_md_cmd = f"{OPT} -load {DSE_LIB} -add-directives-md -tcl " + \
                            f"{tcl_path.as_posix()} < {ir_path.as_posix()} > " + \
                            output_path.as_posix()
    try:
        subprocess.check_output(add_directives_md_cmd, shell=True,
                                stderr=subprocess.STDOUT)
        return output_path
    except subprocess.CalledProcessError as error:
        raise AddDirectivesMDError(ir_path.as_posix(), 
                                   error.returncode, error.output)

def generate_dfg(
    ir_path: Path, 
    dfg_path: Path, 
    has_updated_md: bool = True
) -> None:
    if has_updated_md is False:
        ir_path = update_md(ir_path)

    get_dfg_cmd = f"{OPT} -load {DSE_LIB} -dfg -df {dfg_path.as_posix()} " + \
                  f"< {ir_path.as_posix()};"

    try:
        subprocess.check_output(get_dfg_cmd, shell=True,
                                stderr=subprocess.STDOUT)
    except subprocess.CalledProcessError as error:
        raise GetDFGError(ir_path.as_posix(), 
                          error.returncode, error.output)