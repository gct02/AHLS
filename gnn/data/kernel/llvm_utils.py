import os
import subprocess
from typing import Optional


def extract_llvm_ir_array_info(
    hls_ir_dir: str, 
    array_md_out_path: str,
    loop_md_out_path: str,
    array_access_info_out_path: str,
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
    
    ir_base = os.path.join(hls_ir_dir, "a.g.ld.0.bc")
    ir_lowered = os.path.join(hls_ir_dir, "a.o.3.bc")
    if not os.path.exists(ir_base) or not os.path.exists(ir_lowered):
        raise FileNotFoundError(f"Required IR files not found in {hls_ir_dir}")
    
    try:
        subprocess.check_output(
            f"{opt} -load {dse_lib} -extract-array-md -out-array-md "
            f"{array_md_out_path} < {ir_base}", 
            shell=True, stderr=subprocess.STDOUT
        )
        subprocess.check_output(
            f"{opt} -load {dse_lib} -extract-loop-md -out-loop-md "
            f"{loop_md_out_path} < {ir_base}",
            shell=True, stderr=subprocess.STDOUT
        )
        subprocess.check_output(
            f"{opt} -load {dse_lib} -extract-array-access-info -out-access-info "
            f"{array_access_info_out_path} < {ir_lowered}",
            shell=True, stderr=subprocess.STDOUT
        )
    except subprocess.CalledProcessError as e:
        if os.path.exists(array_md_out_path):
            os.remove(array_md_out_path)
        if os.path.exists(array_access_info_out_path):
            os.remove(array_access_info_out_path)
        raise RuntimeError(f"Error processing IR: {e.output.decode()}")