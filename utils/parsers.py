import numpy as np
import pandas as pd
import json
import re
import xml.etree.ElementTree as ET
from typing import List, Tuple, Union, Any
from numpy.typing import NDArray
from pathlib import Path

def parse_utilization_rpt_xml(rpt_path:Path):
    tree = ET.parse(rpt_path)
    root = tree.getroot()

    lut   = root.find('AreaReport/Resources/LUT').text
    bram  = root.find('AreaReport/Resources/BRAM').text
    ff    = root.find('AreaReport/Resources/FF').text
    dsp   = root.find('AreaReport/Resources/DSP').text
    clb   = root.find('AreaReport/Resources/CLB').text
    latch = root.find('AreaReport/Resources/LATCH').text

    return lut, bram, ff, dsp, clb, latch

def parse_timing_rpt_xml(rpt_path:Path):
    tree = ET.parse(rpt_path)
    root = tree.getroot()

    wns          = root.find('TimingReport/WNS_FINAL').text
    tns          = root.find('TimingReport/TNS_FINAL').text
    target_clk   = root.find('TimingReport/TargetClockPeriod').text
    achieved_clk = root.find('TimingReport/AchievedClockPeriod').text

    return wns, tns, target_clk, achieved_clk

def parse_utilization_rpt_txt(rpt_path:Path):
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

    return lut, bram, ff, dsp, clb, latch

def parse_timing_rpt_txt(rpt_path:Path):
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

    return wns, tns, target_clk, achieved_clk

def directives_to_one_hot(
    directive_index:int, 
    num_directives:int
) -> NDArray[Any]:
    one_hot = np.zeros(num_directives)
    one_hot[directive_index] = 1
    return one_hot

def find_directive_arg(
    key:str,
    arg_list:List[str]
) -> Tuple[int, Union[str, None]]:
    try:
        index = arg_list.index(key)
        return index, arg_list[index + 1]
    except ValueError:
        return -1, None

def parse_directive_tcl_cmd(
    directive_tcl_cmd:str
) -> List[str]:
    dir_type = directive_tcl_cmd.split(' ')[0]
    dir_args = directive_tcl_cmd.split(' ')[1:]

    if dir_type == 'set_directive_pipeline' \
        or dir_type == 'set_directive_loop_merge' \
        or dir_type == 'set_directive_loop_flatten':
        # All these directives have the same format:
        # set_directive_<directive_type> "<location>"
        location = dir_args[0].strip('\"')
        return [dir_type, location]

    if dir_type == 'set_directive_unroll':
        factor_index, factor = find_directive_arg('-factor', dir_args)
        if factor is not None:
            factor = int(factor)
            dir_args.pop(factor_index)
            dir_args.pop(factor_index)
        else:
            factor = 0
        location = dir_args[-1].strip('\"')
        return [dir_type, location, factor]

    if dir_type == 'set_directive_array_partition':
        partition_type_index, partition_type = find_directive_arg('-type', dir_args)
        if partition_type is None:
            partition_type = 'complete'
        else:
            dir_args.pop(partition_type_index)
            dir_args.pop(partition_type_index)
        partition_factor_index, partition_factor = find_directive_arg('-factor', dir_args)
        if partition_factor is not None:
            partition_factor = int(partition_factor)
            dir_args.pop(partition_factor_index)
            dir_args.pop(partition_factor_index)
        else:
            partition_factor = 0
        partition_dim_index, partition_dim = find_directive_arg('-dim', dir_args)
        if partition_dim is not None:
            partition_dim = int(partition_dim)
            dir_args.pop(partition_dim_index)
            dir_args.pop(partition_dim_index)
        else:
            partition_dim = 0
        partition_array = dir_args[-1]
        location = dir_args[-2].strip('\"')
        return [dir_type, location, partition_array, partition_type,
                partition_factor, partition_dim]

    return []

def finc_directive_in_list(
    directive: List[Union[str, int]],
    directive_list: List[List[Union[str, int]]]
) -> bool:
    for directive_in_list in directive_list:
        if directive == directive_in_list:
            return True
    return False

def get_one_hot_directives(
    directives_file:Path, 
    solution_data_json:Path
) -> NDArray[Any]:
    solution_directives_tcl = extract_solution_directives(solution_data_json)
    solution_directives = []
    for directive_tcl in solution_directives_tcl:
        parsed_directive = parse_directive_tcl_cmd(directive_tcl)
        if len(parsed_directive) > 0:
            solution_directives.append(parsed_directive)

    with open(directives_file, "r") as f:
        available_directives = json.load(f)

    one_hot_directives = []

    for directive_group in available_directives.values():
        if type(directive_group) is not dict:
            continue
        for directive_dict in directive_group.values():
            directives = directive_dict["possible_directives"][1:]
            directive_index = 0
            for i, directive in enumerate(directives):
                parsed_directive = parse_directive_tcl_cmd(directive)
                if len(parsed_directive) == 0:
                    continue
                if finc_directive_in_list(parsed_directive, 
                                          solution_directives):
                    directive_index = i + 1
                    break
            num_directives = len(directives) + 1
            one_hot_directive = directives_to_one_hot(directive_index, 
                                                      num_directives)
            one_hot_directives.append(one_hot_directive)

    max_directives = max(len(directive) for directive in one_hot_directives)
    for i, directive in enumerate(one_hot_directives):
        if len(directive) < max_directives:
            one_hot_directives[i] = np.pad(directive, (0, max_directives - len(directive)))
            
    one_hot_directives = np.ndarray(
        shape=(len(one_hot_directives), max_directives), 
        buffer=np.array(one_hot_directives)
    )

    return one_hot_directives

def extract_solution_directives(
    solution_data_json:Union[Path, str]
) -> List[str]:
    with open(solution_data_json, "r") as f:
        data = json.load(f)
    directives = data["HlsSolution"]["DirectiveTcl"]
    return directives

def extract_timing_summary(
    dataset_path:Union[Path, str], 
    bench_name:str, 
    solution:str,
    filtered:bool=False
) -> Tuple[float, float, float, float]:
    if filtered:
        path = f'{dataset_path}/{bench_name}/{solution}/reports/'
    else:
        path = f'{dataset_path}/{bench_name}/{solution}/impl/report/verilog/'

    rpt_path = Path(f'{path}export_impl.xml')
    if rpt_path.is_file() == False:
        rpt_path = Path(f'{path}impl_timing_summary.rpt')
        if rpt_path.is_file() == False:
            return -1.0, -1.0, -1.0, -1.0
        
        wns, tns, target_clk, achieved_clk = parse_timing_rpt_txt(rpt_path)
    else:
        wns, tns, target_clk, achieved_clk = parse_timing_rpt_xml(rpt_path)

    return float(wns), float(tns), float(target_clk), float(achieved_clk)

def extract_utilization(
    dataset_path:Union[Path, str], 
    bench_name:str, 
    solution:str,
    filtered:bool=False
) -> Tuple[int, int, int, int, int, int]:
    if filtered:
        path = f'{dataset_path}/{bench_name}/{solution}/reports/'
    else:
        path = f'{dataset_path}/{bench_name}/{solution}/impl/report/verilog/'

    rpt_path = Path(f'{path}export_impl.xml')
    if rpt_path.is_file() == False:
        rpt_path = Path(f'{path}impl_utilization_placed.rpt')
        if rpt_path.is_file() == False:
            return -1, -1, -1, -1, -1, -1
        lut, bram, ff, dsp, clb, latch = parse_utilization_rpt_txt(rpt_path)
    else:
        lut, bram, ff, dsp, clb, latch = parse_utilization_rpt_xml(rpt_path)

    return int(lut), int(bram), int(ff), int(dsp), int(clb), int(latch)

def extract_hls_cc_report(
    dataset_path:Union[Path, str],
    bench_name:str, 
    solution:str,
    filtered:bool=False
) -> int:
    if filtered:
        rpt_path = f'{dataset_path}/{bench_name}/{solution}/reports/csynth.xml'
    else:
        rpt_path = f'{dataset_path}/{bench_name}/{solution}/syn/report/csynth.xml'

    if Path(rpt_path).is_file() == False:
        return -1

    tree = ET.parse(rpt_path)
    root = tree.getroot()

    cc = root.find(
        'PerformanceEstimates/SummaryOfOverallLatency/Average-caseLatency'
    ).text

    return int(cc)

def organize_data(
    dataset_path:Union[Path, str], 
    bench_name:str, 
    available_directives:Union[Union[Path, str], None]=None,
    filtered:bool=False,
    directives:bool=False
) -> Union[Tuple[pd.DataFrame, List[NDArray[Any]]], pd.DataFrame]:
    dset_dir = f'{dataset_path}/{bench_name}'
    sol_index = 1
    sol_dir = 'solution' + str(sol_index)

    list_to_df = []
    if directives:
        one_hot_directives_list = []

    for _ in Path(dset_dir).iterdir():
        if Path(f'{dset_dir}/{sol_dir}').is_dir():
            if directives:
                solution_data_json = Path(f'{dset_dir}/{sol_dir}/solution{sol_index}_data.json')
                if solution_data_json.exists():
                    one_hot_directives = get_one_hot_directives(
                        available_directives, 
                        solution_data_json
                    )
                    one_hot_directives_list.append(one_hot_directives)
                else:
                    one_hot_directives_list.append(np.zeros(2))

            wns, tns, target_clk, achieved_clk = extract_timing_summary(
                dataset_path, 
                bench_name, 
                sol_dir, 
                filtered
            )
            lut, bram, ff, dsp, clb, latch  = extract_utilization(
                dataset_path, 
                bench_name, 
                sol_dir, 
                filtered
            )
            cc = extract_hls_cc_report(
                dataset_path, 
                bench_name, 
                sol_dir, 
                filtered
            )
            if achieved_clk == -1.0 or cc == -1:
                timing = -1.0
            else:
                timing = achieved_clk * cc

            metrics = [sol_dir, lut, bram, ff, dsp, clb, latch, 
                        target_clk, achieved_clk, wns, tns, cc, timing]

            list_to_df.append(metrics)

        sol_index += 1
        sol_dir = "solution" + str(sol_index)

    cols = ['solution', 'lut', 'bram', 'ff', 'dsp', 'clb', 'latch', 
            'target_clk', 'achieved_clk', 'wns', 'tns', 'cycles', 
            'estimated_time']
    
    bench_dataframe = pd.DataFrame(list_to_df, columns=cols)
    
    if directives:
        return bench_dataframe, one_hot_directives_list
    else:
        return bench_dataframe
