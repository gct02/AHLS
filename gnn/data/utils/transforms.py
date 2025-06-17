import subprocess
from pathlib import Path
from os import environ
from typing import Optional, Union

try:
    DSE_LIB = environ['DSE_LIB']
    OPT = environ['OPT']
except KeyError as error:
    print(f"Error: environment variable {error.args[0]} not defined.")
    exit(1)


def process_ir(
    src_path: Union[str, Path],
    dst_path: Union[str, Path], 
    md_output_path: Union[str, Path],
    preserve_temp_files: bool = False
):
    src_path, dst_path, md_output_path = _to_path(src_path, dst_path, md_output_path)

    if dst_path.suffix != ".ll":
        dst_path = dst_path.with_suffix(".ll")

    ir1 = src_path.parent / f"{src_path.stem}.1.clean.bc"
    ir2 = src_path.parent / f"{src_path.stem}.2.opt.bc"
    ir3 = src_path.parent / f"{src_path.stem}.3.md.bc"
    try:
        run_opt(src_path, "-lowerswitch -lowerinvoke -indirectbr-expand", ir1)
        run_opt(ir1, "-mem2reg -indvars -loop-simplify -scalar-evolution", ir2)
        run_opt(ir2, "-assign-ids", ir3, load_dse_lib=True)
        run_opt(ir3, f"-extract-md -out {md_output_path.as_posix()}", load_dse_lib=True)
        run_opt(ir3, "-strip-debug", dst_path, output_ll=True)
    except subprocess.CalledProcessError as e:
        print(f"Error processing {src_path}: {e}")
        dst_path.unlink(missing_ok=True)
        md_output_path.unlink(missing_ok=True)
        raise e
    finally:
        if not preserve_temp_files:
            ir1.unlink(missing_ok=True)
            ir2.unlink(missing_ok=True)
            ir3.unlink(missing_ok=True)


def run_opt(
    src_path: Path, 
    opt_args: Path, 
    dst_path: Optional[Path] = None, 
    output_ll: bool = False, 
    load_dse_lib: bool = False
):
    try:
        cmd = OPT
        if load_dse_lib:
            cmd += f" -load {DSE_LIB}"
        cmd += f" {opt_args}"
        if output_ll:
            cmd += " -S"
            if dst_path and dst_path.suffix != ".ll":
                dst_path = dst_path.with_suffix(".ll")
        cmd += f" < {src_path.as_posix()}"
        if dst_path:
            cmd += f" > {dst_path.as_posix()}"
        subprocess.check_output(cmd, shell=True, 
                                stderr=subprocess.STDOUT)
    except subprocess.CalledProcessError as e:
        print(f"Error processing {src_path}: {e}")
        if dst_path:
            dst_path.unlink(missing_ok=True)
        raise e


def _to_path(*args):
    """
    Convert all string arguments to Path objects.
    """
    for i in range(len(args)):
        if isinstance(args[i], str):
            args[i] = Path(args[i])
    return args