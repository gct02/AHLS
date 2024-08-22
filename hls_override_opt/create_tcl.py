from string import Template
from pathlib import Path

def generate_tcl_with_input_ir(src_files: list, top_function: str, proj_dir: Path, input_ir: Path):
    src_files_str = " ".join(src_files)

    substitutions = {
        'proj': proj_dir,
        'top': top_function,
        'src': src_files_str,
        'input_ir': input_ir.as_posix(),
        'output_ir': 'a.g.ld.6.user.bc',
        'OPT': '$OPT',
        'LLVM_CUSTOM_OPT': '$LLVM_CUSTOM_OPT',
        'LLVM_CUSTOM_INPUT': '$LLVM_CUSTOM_INPUT',
        'LLVM_CUSTOM_OUTPUT': '$LLVM_CUSTOM_OUTPUT',
        'AHLS_LLVM_LIB': '$AHLS_LLVM_LIB'
    }

    with open('./template.tcl') as f:
        tcl_template = Template(f.read())
    
    tcl_script = tcl_template.substitute(substitutions)

    with open('./run_hls.tcl') as f:
        f.write(tcl_script)
