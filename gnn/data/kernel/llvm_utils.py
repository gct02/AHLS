import os
import subprocess
from typing import Optional


def extract_llvm_ir_array_info(
    ir_path: str, output_path: str,
    opt_path: str = '/usr/bin/opt', 
    dse_lib_path: Optional[str] = None
):
    dse_lib = os.environ.get('DSE_LIB', dse_lib_path)
    opt = os.environ.get('OPT', opt_path)
    if dse_lib is None or not os.path.exists(dse_lib):
        raise FileNotFoundError(f"DSE library not found: {dse_lib}")
    if not os.path.exists(opt):
        raise FileNotFoundError(f"LLVM opt not found: {opt}")

    if not os.path.exists(ir_path):
        raise FileNotFoundError(f"IR file not found: {ir_path}")

    try:
        subprocess.check_output(
            f"{opt} -load {dse_lib} -extract-array-info -out {output_path} < {ir_path};", 
            shell=True, stderr=subprocess.STDOUT
        )
    except subprocess.CalledProcessError as e:
        if os.path.exists(output_path):
            os.remove(output_path)
        raise RuntimeError(f"Error processing IR: {e.output.decode()}")