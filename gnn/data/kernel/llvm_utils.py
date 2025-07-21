import os
import json
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
    
    array_md_out_path_tmp1 = array_md_out_path + ".tmp1"
    array_md_out_path_tmp2 = array_md_out_path + ".tmp2"
    array_access_info_out_path_tmp1 = array_access_info_out_path + ".tmp1"
    array_access_info_out_path_tmp2 = array_access_info_out_path + ".tmp2"
    
    try:
        subprocess.check_output(
            f"{opt} -load {dse_lib} -extract-loop-md -out-loop-md "
            f"{loop_md_out_path} < {ir_base}",
            shell=True, stderr=subprocess.STDOUT
        )

        subprocess.check_output(
            f"{opt} -load {dse_lib} -extract-array-md -out-array-md "
            f"{array_md_out_path_tmp1} < {ir_lowered}",
            shell=True, stderr=subprocess.STDOUT
        )
        subprocess.check_output(
            f"{opt} -load {dse_lib} -extract-array-md -out-array-md "
            f"{array_md_out_path_tmp2} < {ir_base}", 
            shell=True, stderr=subprocess.STDOUT
        )
        _merge_array_md_files(
            array_md_out_path, 
            array_md_out_path_tmp1, 
            array_md_out_path_tmp2
        )
        os.remove(array_md_out_path_tmp1)
        os.remove(array_md_out_path_tmp2)

        subprocess.check_output(
            f"{opt} -load {dse_lib} -extract-array-access-info -out-access-info "
            f"{array_access_info_out_path_tmp1} < {ir_lowered}",
            shell=True, stderr=subprocess.STDOUT
        )
        subprocess.check_output(
            f"{opt} -load {dse_lib} -extract-array-access-info -out-access-info "
            f"{array_access_info_out_path_tmp2} < {ir_base}",
            shell=True, stderr=subprocess.STDOUT
        )
        _merge_array_access_info_files(
            array_access_info_out_path, 
            array_access_info_out_path_tmp1, 
            array_access_info_out_path_tmp2
        )
        os.remove(array_access_info_out_path_tmp1)
        os.remove(array_access_info_out_path_tmp2)

    except subprocess.CalledProcessError as e:
        if os.path.exists(array_md_out_path):
            os.remove(array_md_out_path)
        if os.path.exists(array_access_info_out_path):
            os.remove(array_access_info_out_path)
        if os.path.exists(loop_md_out_path):
            os.remove(loop_md_out_path)
        if os.path.exists(array_md_out_path_tmp1):
            os.remove(array_md_out_path_tmp1)
        if os.path.exists(array_md_out_path_tmp2):
            os.remove(array_md_out_path_tmp2)
        raise RuntimeError(f"Error processing IR: {e.output.decode()}")
    

def _merge_array_md_files(
    array_md_out_path: str,
    array_md_out_path_tmp1: str,
    array_md_out_path_tmp2: str
):
    with open(array_md_out_path_tmp1, 'r') as f1:
        md1 = json.load(f1)

    with open(array_md_out_path_tmp2, 'r') as f2:
        md2 = json.load(f2)

    md1_list = md1.get("ArrayMetadata", [])
    md2_list = md2.get("ArrayMetadata", [])
    md_list = md1_list + md2_list

    merged_md_dict = {}
    for md in md_list:
        name = md.get("Name")
        if name is not None:
            function = md.get("FunctionName", "global")
            label = f"{function}.{name}"
            if label not in merged_md_dict:
                merged_md_dict[label] = md
    
    merged_md_list = list(merged_md_dict.values())
    merged_md = {"ArrayMetadata": merged_md_list}

    with open(array_md_out_path, 'w') as out_file:
        json.dump(merged_md, out_file, indent=2)


def _merge_array_access_info_files(
    array_access_info_out_path: str,
    array_access_info_out_path_tmp1: str,
    array_access_info_out_path_tmp2: str
):
    with open(array_access_info_out_path_tmp1, 'r') as f1:
        info1 = json.load(f1)

    with open(array_access_info_out_path_tmp2, 'r') as f2:
        info2 = json.load(f2)

    info1_list = info1.get("ArrayAccessInfo", [])
    info2_list = info2.get("ArrayAccessInfo", [])
    info_list = info1_list + info2_list

    merged_info_dict = {}
    for info in info_list:
        name = info.get("Name")
        if name is not None:
            function = info.get("FunctionName", "global")
            label = f"{function}.{name}"
            if label not in merged_info_dict:
                merged_info_dict[label] = info
    
    merged_info_list = list(merged_info_dict.values())
    merged_info = {"ArrayAccessInfo": merged_info_list}

    with open(array_access_info_out_path, 'w') as out_file:
        json.dump(merged_info, out_file, indent=2)