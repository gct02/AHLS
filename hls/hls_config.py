from string import Template


def gen_design_config_tcl(
    prj_path, 
    src_files, 
    top_fn, 
    solution_name, 
    output_path,
    dct_tcl_path=None,
    device='xcu50-fsvh2104-2-e', 
    clock_period='8'
):
    source_config = f'source {dct_tcl_path}' if dct_tcl_path else ''
    if isinstance(src_files, list):
        src_files = ' '.join(src_files)

    substitutions = {
        'PRJ_NAME': prj_path,
        'SRC_FILES': src_files,
        'TOP_FN': top_fn,
        'SOL_NAME': solution_name,
        'SOURCE_DCT_CONFIG': source_config,
        'DEVICE': device,
        'CLOCK_PERIOD': str(clock_period)
    }
    template = Template(_TEMPLATE)
    script = template.substitute(substitutions)

    with open(output_path, 'w') as f:
        f.write(script)


_TEMPLATE = """open_project $PRJ_NAME
add_files { $SRC_FILES }
set_top $TOP_FN
open_solution -reset $SOL_NAME
config_compile -pipeline_loops 999
config_array_partition -throughput_driven off
set_part $DEVICE
create_clock -period $CLOCK_PERIOD -name default
$SOURCE_DCT_CONFIG
csynth_design
export_design -flow impl -format syn_dcp -rtl verilog
exit
"""