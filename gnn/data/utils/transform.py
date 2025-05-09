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


def process_ir(in_ir_path: Union[str, Path], out_md_path: Union[str, Path]):
    if isinstance(in_ir_path, str):
        in_ir_path = Path(in_ir_path)
    if isinstance(out_md_path, str):
        out_md_path = Path(out_md_path)

    if not in_ir_path.exists():
        raise FileNotFoundError(f"IR file not found: {in_ir_path.as_posix()}")

    options = "-mem2reg -indvars -loop-simplify -scalar-evolution -instnamer"
    out_ir_path = in_ir_path.parent / f"{in_ir_path.stem}.mod.bc"
    try:
        subprocess.check_output(
            f"{OPT} {options} < {in_ir_path.as_posix()} > {out_ir_path.as_posix()};", 
            shell=True, stderr=subprocess.STDOUT
        )
        subprocess.check_output(
            f"{OPT} -load {DSE_LIB} -extract-md -out {out_md_path.as_posix()} < {out_ir_path.as_posix()};", 
            shell=True, stderr=subprocess.STDOUT
        )
    except subprocess.CalledProcessError as e:
        out_ir_path.unlink(missing_ok=True)
        out_md_path.unlink(missing_ok=True)
        raise RuntimeError(f"Error processing IR: {e.output.decode()}")