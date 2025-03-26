import json
import re
from pathlib import Path
from collections import defaultdict
from typing import List, Tuple, Union, Dict, Any

import numpy as np
import pandas as pd
import xml.etree.ElementTree as ET
from numpy.typing import NDArray


def parse_utilization_rpt_xml(rpt_path: Path):
    tree = ET.parse(rpt_path)
    root = tree.getroot()

    lut = root.find('AreaReport/Resources/LUT').text
    bram = root.find('AreaReport/Resources/BRAM').text
    ff = root.find('AreaReport/Resources/FF').text
    dsp = root.find('AreaReport/Resources/DSP').text
    clb = root.find('AreaReport/Resources/CLB').text
    latch = root.find('AreaReport/Resources/LATCH').text

    metrics = {
        'lut': float(lut),
        'bram': float(bram),
        'ff': float(ff),
        'dsp': float(dsp),
        'clb': float(clb),
        'latch': float(latch)
    }
    return metrics


def parse_timing_rpt_xml(rpt_path: Path):
    tree = ET.parse(rpt_path)
    root = tree.getroot()

    wns = root.find('TimingReport/WNS_FINAL').text
    tns = root.find('TimingReport/TNS_FINAL').text
    target_clk = root.find('TimingReport/TargetClockPeriod').text
    achieved_clk = root.find('TimingReport/AchievedClockPeriod').text

    metrics = {
        'wns': float(wns),
        'tns': float(tns),
        'target_clk': float(target_clk),
        'achieved_clk': float(achieved_clk)
    }
    return metrics


def parse_utilization_rpt_txt(rpt_path: Path):
    numeric_const_pattern = '-?\d+'
    rx = re.compile(numeric_const_pattern, re.VERBOSE)

    lut = bram = ff = dsp = clb = latch = -1
        
    with open(rpt_path, "r") as rpt:
        lines = rpt.readlines()

    for line in lines:
        if lut != -1 and ff != -1 and latch != -1:
            if clb == -1:
                if line.find('CLB') != -1:
                    clb = int((rx.findall(line))[0])
            else:
                if line.find('Block RAM Tile') != -1 and bram == -1:
                    bram = int((rx.findall(line))[0])
                elif line.find('DSPs') != -1 and dsp == -1:
                    dsp = int((rx.findall(line))[0])
        else:
            if line.find('CLB LUTs') != -1 and lut == -1:
                lut = int((rx.findall(line))[0])
            elif line.find('Register as Flip Flop') != -1 and ff == -1:
                ff = int((rx.findall(line))[0])
            elif line.find('Register as Latch') != -1 and latch == -1:
                latch = int((rx.findall(line))[0])
        
        if lut != -1 and bram != -1 and ff != -1 and \
           dsp != -1 and clb != -1 and latch != -1:
            break
        
    metrics = {
        'lut': float(lut),
        'bram': float(bram),
        'ff': float(ff),
        'dsp': float(dsp),
        'clb': float(clb),
        'latch': float(latch)
    }
    return metrics


def parse_timing_rpt_txt(rpt_path: Path):
    numeric_const_pattern = '-?[0-9]\d*(\.\d+)?'
    rx = re.compile(numeric_const_pattern, re.VERBOSE)

    wns = tns = achieved_clk = -1.0
    target_clk = 8.0

    with open(rpt_path, "r") as rpt:
        lines = rpt.readlines()

    n_lines = len(lines)
    i = 0
    while i < n_lines and \
        (wns == -1.0 or tns == -1.0 or achieved_clk == -1.0):
        line = lines[i]
        if line.find('WNS(ns)') != -1 and line.find('TNS(ns)') != -1:
            line = lines[i+2]
            wns = float((rx.findall(line))[0])
            tns = float((rx.findall(line))[1])
            achieved_clk = target_clk - wns
            break
        i += 1

    metrics = {
        'wns': wns,
        'tns': tns,
        'target_clk': target_clk,
        'achieved_clk': achieved_clk
    }
    return metrics


def directives_to_one_hot(
    directive_index: int, 
    num_directives: int
) -> NDArray[Any]:
    one_hot = np.zeros(num_directives)
    one_hot[directive_index] = 1
    return one_hot
    

def parse_directive_cmd_args(
    args: List[str], 
    is_json: bool = False
) -> Dict[str, str]:
    parsed_args = {}
    nargs = len(args)
    location_found = False
    for i in range(nargs):
        if args[i].startswith('-'):
            if args[i].find('=') != -1:
                key, value = args[i].split('=')
                parsed_args[key] = value
            else:
                parsed_args[args[i][1:]] = args[i + 1]
                i += 1
        elif not location_found:
            if is_json:
                parsed_args['location'] = args[i].replace('"', '')
            else:
                parsed_args['location'] = args[i]
            location_found = True
        else:
            parsed_args['array'] = args[i]
    return parsed_args


def parse_directive_cmd(
    directive_cmd: str,
    is_json: bool = False
) -> Tuple[str, Dict[str, str]]:
    cmd = directive_cmd.split(' ')[0].strip("set_directive_")
    args = directive_cmd.split(' ')[1:]
    parsed_args = parse_directive_cmd_args(args, is_json)
    return cmd, parsed_args


def parse_directive_tcl(
    directive_tcl_path: str
) -> List[Tuple[str, Dict[str, str]]]:
    with open(directive_tcl_path, "r") as f:
        lines = f.readlines()
    directives = [parse_directive_cmd(l) for l in lines]
    return directives


def finc_directive_in_list(
    directive: List[Union[str, int]],
    directive_list: List[List[Union[str, int]]]
) -> bool:
    for directive_in_list in directive_list:
        if directive == directive_in_list:
            return True
    return False


# def get_one_hot_directives(
#     directive_config_file: Path, 
#     hls_json_path: Path
# ) -> NDArray[Any]:
#     sol_directive_cmds = extract_hls_directive_cmds(hls_json_path)
#     sol_directives = []
#     for directive_cmd in sol_directive_cmds:
#         cmd, args = parse_directive_cmd(directive_cmd, is_json=True)
#         if cmd != "set_directive_top":
#             sol_directives.append((cmd, args))

#     with open(directive_config_file, "r") as f:
#         directive_groups = json.load(f)

#     one_hot_directives = []

#     for gp in directive_groups.values():
#         if not isinstance(gp, dict):
#             continue
#         for directive_dict in gp.values():
#             directives = directive_dict["possible_directives"][1:]
#             index = 0
#             for i, directive in enumerate(directives):
#                 directive_data = parse_directive_cmd(directive)
#                 if len(directive_data) == 0:
#                     continue
#                 if finc_directive_in_list(directive_data, 
#                                           sol_directives):
#                     index = i + 1
#                     break
#             num_directives = len(directives) + 1
#             one_hot_directive = directives_to_one_hot(index, 
#                                                       num_directives)
#             one_hot_directives.append(one_hot_directive)

#     max_directives = max(len(directive) for directive in one_hot_directives)
#     for i, directive in enumerate(one_hot_directives):
#         if len(directive) < max_directives:
#             one_hot_directives[i] = np.pad(directive, (0, max_directives - len(directive)))
            
#     one_hot_directives = np.ndarray(
#         shape=(len(one_hot_directives), max_directives), 
#         buffer=np.array(one_hot_directives)
#     )

#     return one_hot_directives


def extract_hls_directive_cmds(
    hls_json_path: Union[Path, str]
) -> List[str]:
    with open(hls_json_path, "r") as f:
        data = json.load(f)
    directives = data["HlsSolution"]["DirectiveTcl"]
    return directives


def extract_timing_summary(
    dataset_path: Union[Path, str], 
    bench_name: str, 
    solution: str,
    filtered: bool = False
) -> Dict[str, float]:
    if filtered:
        path = f'{dataset_path}/{bench_name}/{solution}/reports/'
    else:
        path = f'{dataset_path}/{bench_name}/{solution}/impl/report/verilog/'

    rpt_path = Path(f'{path}export_impl.xml')
    if rpt_path.is_file() == False:
        rpt_path = Path(f'{path}impl_timing_summary.rpt')
        if rpt_path.is_file() == False:
            print(f'Timing report not found for {bench_name}/{solution}')
            metrics = {
                'wns': -1.0,
                'tns': -1.0,
                'target_clk': -1.0,
                'achieved_clk': -1.0
            }
        else:
            metrics = parse_timing_rpt_txt(rpt_path)
    else:
        metrics = parse_timing_rpt_xml(rpt_path)

    return metrics


def extract_utilization(
    dataset_path: Union[Path, str], 
    bench_name: str, 
    solution: str,
    filtered: bool = False
) -> Dict[str, float]:
    if filtered:
        path = f'{dataset_path}/{bench_name}/{solution}/reports/'
    else:
        path = f'{dataset_path}/{bench_name}/{solution}/impl/report/verilog/'

    rpt_path = Path(f'{path}export_impl.xml')
    if rpt_path.is_file() == False:
        rpt_path = Path(f'{path}impl_utilization_placed.rpt')
        if rpt_path.is_file() == False:
            print(f'Utilization report not found for {bench_name}/{solution}')
            metrics = {
                'lut': -1.0,
                'bram': -1.0,
                'ff': -1.0,
                'dsp': -1.0,
                'clb': -1.0,
                'latch': -1.0
            }
        else:
            metrics = parse_utilization_rpt_txt(rpt_path)
    else:
        metrics = parse_utilization_rpt_xml(rpt_path)

    return metrics


def extract_hls_cc_report(
    dataset_path: Union[Path, str],
    bench_name: str, 
    solution: str,
    filtered: bool = False
) -> float:
    if filtered:
        rpt_path = f'{dataset_path}/{bench_name}/{solution}/reports/csynth.xml'
    else:
        rpt_path = f'{dataset_path}/{bench_name}/{solution}/syn/report/csynth.xml'

    if Path(rpt_path).is_file() == False:
        print(f'CC report not found for {bench_name}/{solution}')
        return {'cc': -1.0}

    tree = ET.parse(rpt_path)
    root = tree.getroot()

    cc = root.find(
        'PerformanceEstimates/SummaryOfOverallLatency/Average-caseLatency'
    ).text

    return float(cc)


def extract_power_report(
    dataset_path: Union[Path, str],
    bench_name: str, 
    solution: str,
    filtered: bool = False
) -> Dict[str, float]:
    solution_path = f'{dataset_path}/{bench_name}/{solution}'
    if filtered:
        power_report_path = f'{solution_path}/reports/impl_power.rpt'
    else:
        power_report_path = f'{solution_path}/impl/verilog/project.runs/impl_1/bd_0_wrapper_power_routed.rpt'

    if not Path(power_report_path).is_file():
        print(f'Power report not found for {bench_name}/{solution}')
        return {
            'total_power': -1.0,
            'dynamic_power': -1.0,
            'static_power': -1.0
        }
    
    with open(power_report_path, "r") as rpt:
        lines = rpt.readlines()

    numeric_const_pattern = '[-+]? (?: (?: \d* \. \d+ ) | (?: \d+ \.? ) )(?: [Ee] [+-]? \d+ ) ?'
    rx = re.compile(numeric_const_pattern, re.VERBOSE)

    total_power = dynamic_power = static_power = -1.0
    for line in lines:
        if line.find('Total On-Chip Power (W)') != -1:
            total_power = float((rx.findall(line))[0])
        if line.find('Dynamic (W)') != -1:
            dynamic_power = float((rx.findall(line))[0])
        if line.find('Device Static (W)') != -1:
            static_power = float((rx.findall(line))[0])

    return {
        'total_power': total_power,
        'dynamic_power': dynamic_power,
        'static_power': static_power
    }


def extract_metrics(
    dataset_path: Union[Path, str],
    bench_name: str,
    solution: str,
    filtered: bool = False
) -> Dict[str, float]:
    metrics = extract_timing_summary(dataset_path, bench_name, solution, filtered)
    metrics.update(extract_utilization(dataset_path, bench_name, solution, filtered))
    metrics.update({'cc': extract_hls_cc_report(dataset_path, bench_name, solution, filtered)})
    metrics.update(extract_power_report(dataset_path, bench_name, solution, filtered))
    return metrics


def organize_data(
    dataset_path: Union[Path, str], 
    bench_name: str, 
    available_directives: Union[Union[Path, str], None] = None,
    filtered: bool = False,
    directives: bool = False
) -> Union[Tuple[pd.DataFrame, List[NDArray[Any]]], pd.DataFrame]:
    dset_dir = f'{dataset_path}/{bench_name}'
    max_solutions = 300

    list_to_df = []
    if directives:
        one_hot_directives_list = []

    for i in range(1, max_solutions + 1):
        sol_dir = f'solution{i}'
        if Path(f'{dset_dir}/{sol_dir}').is_dir():
            # if directives:
            #     solution_data_json = Path(f'{dset_dir}/{sol_dir}/solution{i}_data.json')
            #     if solution_data_json.exists():
            #         one_hot_directives = get_one_hot_directives(
            #             available_directives, 
            #             solution_data_json
            #         )
            #         one_hot_directives_list.append(one_hot_directives)
            #     else:
            #         one_hot_directives_list.append(np.zeros(10))

            timing_rpt = extract_timing_summary(dataset_path, bench_name, sol_dir, filtered)
            utilization_rpt  = extract_utilization(dataset_path, bench_name, sol_dir, filtered)
            cc = extract_hls_cc_report(dataset_path, bench_name, sol_dir, filtered)
            
            achieved_clk = timing_rpt['achieved_clk']
            if achieved_clk == -1.0 or cc == -1.0:
                total_time = -1.0
            else:
                total_time = achieved_clk * cc

            timing_rpt = list(timing_rpt.values())
            utilization_rpt = list(utilization_rpt.values())

            metrics = [sol_dir] + utilization_rpt + timing_rpt + [cc] + [total_time]
            list_to_df.append(metrics)

    cols = ['solution', 'lut', 'bram', 'ff', 'dsp', 'clb', 'latch', 
            'target_clk', 'achieved_clk', 'wns', 'tns', 'cc', 'time']
    
    bench_dataframe = pd.DataFrame(list_to_df, columns=cols)
    
    if directives:
        max_0 = max(one_hot_directives_list, key=lambda x: x.shape[0]).shape[0]
        max_1 = max(one_hot_directives_list, key=lambda x: x.shape[1] if len(x.shape) > 1 else 0).shape[1]

        for i, one_hot_directives in enumerate(one_hot_directives_list):
            if len(one_hot_directives.shape) < 2:
                one_hot_directives_list[i] = np.zeros((max_0, max_1))

        return bench_dataframe, one_hot_directives_list
    else:
        return bench_dataframe
