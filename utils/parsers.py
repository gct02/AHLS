import re
import os
import json
from pathlib import Path
from typing import List, Tuple, Union, Dict, Optional

import numpy as np
import pandas as pd
import xml.etree.ElementTree as ET
from numpy.typing import NDArray

from utils.xmlutils import findint, findfloat


Number = Union[int, float]
Report = Dict[str, Number] 


def extract_timing_summary(solution_dir, filtered=False) -> Report:
    try:
        rpt_dir = _find_report_folder(solution_dir, filtered)
    except ValueError as e:
        print(e)
        return None

    rpt_path = rpt_dir + 'export_impl.xml'
    if os.path.exists(rpt_path):
        return _parse_timing_report_xml(rpt_path)
    
    rpt_path = rpt_dir + 'impl_timing_summary.rpt'
    if os.path.exists(rpt_path):
        return _parse_timing_report_txt(rpt_path)
    
    print(f'Timing report not found in {solution_dir}')
    return None


def extract_utilization(solution_dir, filtered=False) -> Report:
    try:
        rpt_dir = _find_report_folder(solution_dir, filtered)
    except ValueError as e:
        print(e)
        return None

    rpt_path = rpt_dir + 'export_impl.xml'
    if os.path.exists(rpt_path):
        return _parse_utilization_report_xml(rpt_path)
    
    rpt_path = rpt_dir + 'impl_utilization_placed.rpt'
    if os.path.exists(rpt_path):
        return _parse_utilization_report_txt(rpt_path)

    print(f'Utilization report not found in {solution_dir}')
    return None


def extract_hls_cc_report(solution_dir, filtered=False) -> int:
    if filtered:
        rpt_path = f'{solution_dir}/reports/csynth.xml'
    else:
        rpt_path = f'{solution_dir}/syn/report/csynth.xml'

    if not os.path.exists(rpt_path):
        print(f'CC report not found in {solution_dir}')
        return -1

    tree = ET.parse(rpt_path)
    root = tree.getroot()
    return findint(
        root, 'PerformanceEstimates/SummaryOfOverallLatency/Average-caseLatency', -1
    )


def extract_power_report(solution_dir, filtered=False) -> Report:
    if filtered:
        rpt_path = f'{solution_dir}/reports/impl_power.rpt'
    else:
        rpt_path = f'{solution_dir}/impl/verilog/project.runs/impl_1/bd_0_wrapper_power_routed.rpt'

    if not Path(rpt_path).is_file():
        print(f'Power report not found in {solution_dir}')
        return {'total_power': -1.0, 'dynamic_power': -1.0, 'static_power': -1.0}
    
    with open(rpt_path, "r") as rpt:
        lines = rpt.readlines()

    numeric_pattern = '[-+]? (?: (?: \d* \. \d+ ) | (?: \d+ \.? ) )(?: [Ee] [+-]? \d+ ) ?'
    rx = re.compile(numeric_pattern, re.VERBOSE)

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
    solution_dir, filtered=False
) -> Dict[str, Union[Report, Number]]:
    def extend_metrics(metrics_dict, other_metrics):
        for key, value in other_metrics.items():
            metrics_dict[key] = max(0, value)

    timing = extract_timing_summary(solution_dir, filtered)
    if timing is None:
        print(f'Timing report not found in {solution_dir}')
        return None
    utilization = extract_utilization(solution_dir, filtered)
    if utilization is None:
        print(f'Utilization report not found in {solution_dir}')
        return None
    cc = extract_hls_cc_report(solution_dir, filtered)
    if cc == -1:
        print(f'CC report not found in {solution_dir}')
        return None
    power = extract_power_report(solution_dir, filtered)
    if power is None:
        print(f'Power report not found in {solution_dir}')
        return None
    
    metrics = {}
    extend_metrics(metrics, utilization)
    extend_metrics(metrics, timing)
    extend_metrics(metrics, power)
    metrics['cc'] = cc
    metrics['time'] = timing['achieved_clk'] * cc

    return metrics


def extract_impl_report(solution_dir, filtered=False) -> Dict[str, Union[Report, Number]]:
    reports = {}
    reports['timing'] = extract_timing_summary(solution_dir, filtered)
    reports['utilization'] = extract_utilization(solution_dir, filtered)
    reports['power'] = extract_power_report(solution_dir, filtered)
    reports['cc'] = extract_hls_cc_report(solution_dir, filtered)
    reports['time'] = reports['timing']['achieved_clk'] * reports['cc']

    try:
        rpt_dir = _find_report_folder(solution_dir, filtered)
    except ValueError as e:
        print(e)
        return None
    
    rpt_path = rpt_dir + 'export_impl.xml'
    if not os.path.exists(rpt_path):
        print(f'Implementation report not found in {solution_dir}')
        return None
    
    tree = ET.parse(rpt_path)
    root = tree.getroot()

    module_data = {}
    for module in root.find('RtlModules').findall('RtlModule'):
        name = module.attrib['DISPNAME']
        data = {"LUT": 0, "FF": 0, "BRAM": 0, "DSP": 0}
        resources = module.find('Resources')
        if resources is not None:
            data['LUT'] = int(resources.attrib.get('LUT', 0))
            data['FF'] = int(resources.attrib.get('FF', 0))
            data['BRAM'] = int(resources.attrib.get('BRAM', 0))
            data['DSP'] = int(resources.attrib.get('DSP', 0))
        module_data[name] = data
    
    reports['module_data'] = module_data
    return reports


def parse_tcl_directives_file(tcl_path) -> List[Tuple[str, Dict[str, str]]]:
    if not os.path.exists(tcl_path):
        raise ValueError(f"Directives file not found: {tcl_path}")
    with open(tcl_path, "r") as f:
        lines = f.readlines()
    directives = [_parse_directive_cmd(l) for l in lines]
    return directives


def _parse_utilization_report_xml(rpt_path):
    tree = ET.parse(rpt_path)
    root = tree.getroot()
    return {
        'lut': findint(root, 'AreaReport/Resources/LUT', -1),
        'bram': findint(root, 'AreaReport/Resources/BRAM', -1),
        'ff': findint(root, 'AreaReport/Resources/FF', -1),
        'dsp': findint(root, 'AreaReport/Resources/DSP', -1),
    }


def _parse_timing_report_xml(rpt_path):
    tree = ET.parse(rpt_path)
    root = tree.getroot()
    return {
        'wns': findfloat(root, 'TimingReport/WNS_FINAL', -1.0),
        'tns': findfloat(root, 'TimingReport/TNS_FINAL', -1.0),
        'target_clk': findfloat(root, 'TimingReport/TargetClockPeriod', -1.0),
        'achieved_clk': findfloat(root, 'TimingReport/AchievedClockPeriod', -1.0)
    }


def _parse_utilization_report_txt(rpt_path):
    integer_pattern = '-?\d+'
    rx = re.compile(integer_pattern, re.VERBOSE)
    
    lut = bram = ff = dsp = -1
        
    with open(rpt_path, "r") as rpt:
        lines = rpt.readlines()

    lut_line = _find_line_containing(lines, 'CLB LUTs')
    ff_line = _find_line_containing(lines, 'Register as Flip Flop')
    dsp_line = _find_line_containing(lines, 'DSPs')
    bram_line = _find_line_containing(lines, 'Block RAM Tile')

    if lut_line != -1:
        lut = int((rx.findall(lines[lut_line]))[0])
    if ff_line != -1:
        ff = int((rx.findall(lines[ff_line]))[0])
    if dsp_line != -1:
        dsp = int((rx.findall(lines[dsp_line]))[0])
    if bram_line != -1:
        bram = int((rx.findall(lines[bram_line]))[0])
        
    return {'lut': lut, 'ff': ff, 'dsp': dsp, 'bram': bram}


def _parse_timing_report_txt(rpt_path):
    decimal_pattern = '-?[0-9]\d*(\.\d+)?'
    rx = re.compile(decimal_pattern, re.VERBOSE)

    wns = tns = -1.0
    target_clk = 8.0

    with open(rpt_path, "r") as rpt:
        lines = rpt.readlines()

    start_idx = _find_line_containing(lines, 'WNS(ns)', 'TNS(ns)')
    if start_idx == -1:
        raise ValueError("WNS and TNS not found in the report file")
    
    rpt_line = lines[start_idx + 2]
    wns = float((rx.findall(rpt_line))[0])
    tns = float((rx.findall(rpt_line))[1])
    
    return {
        'wns': wns,
        'tns': tns,
        'target_clk': target_clk,
        'achieved_clk': target_clk - wns
    }


def collate_data_for_analysis(
    data_path: str, 
    benchmark: str, 
    filtered: bool = False,
    directive_config_path: Optional[str] = None
) -> Tuple[pd.DataFrame, Optional[NDArray[np.int_]]]:
    metrics = []
    directives = [] if directive_config_path else None
    bench_dir = f"{data_path}/{benchmark}"
    for solution in os.listdir(bench_dir):
        solution_dir = os.path.join(bench_dir, solution)
        report = extract_metrics(solution_dir, filtered)
        if report is None:
            continue
        report['benchmark'] = benchmark
        report['solution'] = solution
        metrics.append(report)
        if directive_config_path is not None:
            tcl_path = f'{solution_dir}/directives.tcl'
            directives.append(
                parse_and_encode_directives(directive_config_path, tcl_path)
            )
    if directives is not None:
        directives = np.stack(directives)
    metrics = pd.pd.DataFrame(metrics)
    return metrics, directives
    

def parse_and_encode_directives(directive_config_path, tcl_path) -> NDArray[np.int_]:
    if not os.path.exists(tcl_path):
        raise ValueError(f"Directives file not found: {tcl_path}")
    if not os.path.exists(directive_config_path):
        raise ValueError(f"Directive configuration file not found: {directive_config_path}")
    
    with open(directive_config_path, "r") as f:
        directive_groups = json.load(f)

    available_directives = {
        "pipeline", "unroll", "loop_merge", "loop_flatten", "array_partition"
    }
    directives = parse_tcl_directives_file(tcl_path)
    directives = [d for d in directives if d[0] in available_directives]

    directive_configs = []
    for group in directive_groups["directives"].values():
        if len(group["possible_directives"]) <= 1:
            continue
        group_directives = []
        for directive_cmd in group["possible_directives"][1:]:
            dir_type, dir_args = _parse_directive_cmd(directive_cmd)
            if dir_type in available_directives:
                group_directives.append((dir_type, dir_args))
        directive_configs.append(group_directives)

    max_group_size = max(len(group) for group in directive_configs)
    directive_indices = [[0] * max_group_size for _ in range(len(directive_configs))]

    for dir_type, dir_args in directives:
        for i, group in enumerate(directive_configs):
            found = False
            for j, (group_dir_type, group_dir_args) in enumerate(group):
                if group_dir_type == dir_type and group_dir_args == dir_args:
                    directive_indices[i][j] = 1
                    found = True
            if found:
                break

    return np.array(directive_indices, dtype=np.int_)


def _find_report_folder(solution_dir, filtered=False) -> str:
    rpt_dir = f'{solution_dir}/' + ('reports/' if filtered else 'impl/report/verilog/')
    if not os.path.exists(rpt_dir):
        raise ValueError(f'Report directory not found in {solution_dir}')
    return rpt_dir


def _find_line_containing(lines: List[str], *search_string) -> int:
    for i, line in enumerate(lines):
        if all(s in line for s in search_string):
            return i
    return -1


def _parse_directive_cmd(directive_cmd, is_json=False) -> Tuple[str, Dict[str, str]]:
    cmd = directive_cmd.split(' ')[0].split('set_directive_')[1]
    args = directive_cmd.split(' ')[1:]
    parsed_args = _parse_directive_options(args, is_json)
    return cmd, parsed_args


def _parse_directive_options(args: List[str], is_json=False) -> Dict[str, str]:
    parsed_args = {}

    is_loc_parsed = False
    i = 0
    while i < len(args):
        if not args[i]:
            i += 1
            continue
        if args[i].startswith('-'):
            if args[i].find('=') != -1:
                key, value = args[i].split('=')
                parsed_args[key] = value
            else:
                parsed_args[args[i][1:]] = args[i + 1]
                i += 1
        elif not is_loc_parsed:
            if is_json:
                parsed_args['location'] = args[i]
            else:
                parsed_args['location'] = args[i]
            is_loc_parsed = True
        else:
            parsed_args['variable'] = args[i]
        i += 1

    for key, value in parsed_args.items():
        parsed_args[key] = value.strip('"').strip()

    return parsed_args

