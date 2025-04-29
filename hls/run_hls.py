import subprocess
import argparse
import os
import sys
from string import Template


_TEMPLATE = """open_project $PRJ_NAME
add_files { $SRC_FILES }
set_top $TOP_FUNC
open_solution -reset $SOL_NAME
config_array_partition -throughput_driven off
config_compile -pipeline_loops 9999999
config_unroll -tripcount_threshold 0
set_part $DEVICE
create_clock -period $CLOCK_PERIOD -name default
$TCL_DIRECTIVES_SOURCE
csynth_design
export_design -flow impl -format syn_dcp -rtl verilog
exit
"""


def gen_tcl(
    prj_name, src_files, top_func, sol_name, 
    device='xcu50-fsvh2104-2-e', clock_period='8',
    directives_tcl_path=None
):
    if directives_tcl_path is None:
        source_tcl = ''
    else:
        source_tcl = f'source {directives_tcl_path}'

    if isinstance(src_files, list):
        src_files = ' '.join(src_files)

    substitutions = {
        'PRJ_NAME': prj_name,
        'SRC_FILES': src_files,
        'TOP_FUNC': top_func,
        'SOL_NAME': sol_name,
        'TCL_DIRECTIVES_SOURCE': source_tcl,
        'DEVICE': device,
        'CLOCK_PERIOD': str(clock_period)
    }
    tcl_template = Template(_TEMPLATE)
    tcl_script = tcl_template.substitute(substitutions)

    tcl_path = os.path.join(os.path.dirname(sys.argv[0]), 'run_hls.tcl')
    with open(tcl_path, 'w') as f:
        f.write(tcl_script)

    return tcl_path


def run_vitis(
    prj_name, src_files, top_func, sol_name, 
    device='xcu50-fsvh2104-2-e', clock_period='8',
    directives_tcl_path=None
):
    tcl_path = gen_tcl(prj_name, src_files, top_func, sol_name, device, 
                       clock_period, directives_tcl_path)
    call_vitis_script_path = os.path.join(os.path.dirname(sys.argv[0]), 'call_vitis.sh')
    subprocess.check_output("bash " + call_vitis_script_path, shell=True)
    os.remove(tcl_path)


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('prj_name', type=str)
    parser.add_argument('src_files', type=str, nargs='+')
    parser.add_argument('-t', '--top-func', type=str)
    parser.add_argument('-s', '--solution', type=str)
    parser.add_argument('-d', '--directives-tcl', type=str)
    parser.add_argument('--device', type=str, default='xcu50-fsvh2104-2-e')
    parser.add_argument('--clock', type=str, default='8')
    return parser.parse_args()


if __name__ == '__main__':
    args = parse_args()
    run_vitis(
        args.prj_name, args.src_files, args.top_func, args.solution,
        args.device, args.clock, args.directives_tcl
    )