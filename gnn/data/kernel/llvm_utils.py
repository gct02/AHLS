import os
import subprocess
from pathlib import Path

from typing import Union


try:
    DSE_LIB = os.environ['DSE_LIB']
    OPT = os.environ['OPT']
except KeyError as error:
    print(f"Error: environment variable {error.args[0]} not defined.")
    raise


def extract_llvm_ir_metadata(
    input_ir_path: Union[str, Path], 
    output_path: Union[str, Path]
):
    if isinstance(input_ir_path, str):
        input_ir_path = Path(input_ir_path)
    if isinstance(output_path, str):
        output_path = Path(output_path)

    if not input_ir_path.exists():
        raise FileNotFoundError(f"IR file not found: {input_ir_path.as_posix()}")

    options = "-mem2reg -indvars -loop-simplify -scalar-evolution -instnamer"
    modified_ir_path = input_ir_path.parent / f"{input_ir_path.stem}.mod.bc"
    try:
        subprocess.check_output(
            f"{OPT} {options} < {input_ir_path.as_posix()} > {modified_ir_path.as_posix()};", 
            shell=True, stderr=subprocess.STDOUT
        )
        subprocess.check_output(
            f"{OPT} -load {DSE_LIB} -extract-md -out {output_path.as_posix()} < {modified_ir_path.as_posix()};", 
            shell=True, stderr=subprocess.STDOUT
        )
    except subprocess.CalledProcessError as e:
        modified_ir_path.unlink(missing_ok=True)
        output_path.unlink(missing_ok=True)
        raise RuntimeError(f"Error processing IR: {e.output.decode()}")