import os
import subprocess
from typing import Optional


def extract_llvm_ir_array_info(
    hls_ir_dir: str, 
    array_info_out_path: str,
    global_array_usage_out_path: str,
    opt_path: str = '/usr/bin/opt', 
    dse_lib_path: Optional[str] = None
):
    dse_lib = os.environ.get('DSE_LIB', dse_lib_path)
    opt = os.environ.get('OPT', opt_path)

    if dse_lib is None or not os.path.exists(dse_lib):
        raise FileNotFoundError(f"DSE library not found: {dse_lib}")
    if not os.path.exists(opt):
        raise FileNotFoundError(f"LLVM opt not found: {opt}")

    if not os.path.exists(hls_ir_dir):
        raise FileNotFoundError(f"HLS IR directory not found: {hls_ir_dir}")
    
    ir_1 = os.path.join(hls_ir_dir, "a.g.ld.5.gdce.bc")
    ir_2 = os.path.join(hls_ir_dir, "a.o.3.bc")

    try:
        subprocess.check_output(
            f"{opt} -load {dse_lib} -extract-array-info -out {array_info_out_path} < {ir_1};", 
            shell=True, stderr=subprocess.STDOUT
        )
        subprocess.check_output(
            f"{opt} -load {dse_lib} -extract-global-array-uses -out-usage {global_array_usage_out_path} < {ir_2};", 
            shell=True, stderr=subprocess.STDOUT
        )
    except subprocess.CalledProcessError as e:
        if os.path.exists(array_info_out_path):
            os.remove(array_info_out_path)
        if os.path.exists(global_array_usage_out_path):
            os.remove(global_array_usage_out_path)
        raise RuntimeError(f"Error processing IR: {e.output.decode()}")