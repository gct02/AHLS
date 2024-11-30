from string import Template

def generate_tcl(src_files, top_function, proj_dir, proj_name):
    src_files_str = " ".join(src_files)

    substitutions = {
        'proj': proj_dir,
        'top': top_function,
        'src': src_files_str,
    }

    with open('./template.tcl') as f:
        tcl_template = Template(f.read())
    
    tcl_script = tcl_template.substitute(substitutions)

    with open(f"hls/tcl/run_hls_{proj_name}.tcl", "w") as f:
        f.write(tcl_script)

def generate_tcl(src_files, top_function, proj_dir, proj_name, input_ir):
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

    with open('./template_override_opt.tcl') as f:
        tcl_template = Template(f.read())
    
    tcl_script = tcl_template.substitute(substitutions)

    with open(f"hls/tcl/run_hls_{proj_name}_override_opt.tcl", "w") as f:
        f.write(tcl_script)