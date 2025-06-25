import re
import os
import json
from pathlib import Path
from typing import List, Tuple, Union, Dict

import xml.etree.ElementTree as ET

from gnn.data.utils.xml_utils import findint, findfloat

# Total number of resources available on the target device
# (xcu50-fsvh2104-2-e)
AVAILABLE_RESOURCES = {
    "bram": 2688,
    "dsp": 5952,
    "ff": 1743360,
    "lut": 871680
}

POWER_METRICS = ['total_power', 'dynamic_power', 'static_power']
TIMING_METRICS = ['wns', 'tns', 'target_clk', 'achieved_clk']
AREA_METRICS = ['lut', 'ff', 'dsp', 'bram']
METRICS = AREA_METRICS + TIMING_METRICS + POWER_METRICS + ['cc']


def extract_timing_summary(solution_dir, filtered=False) -> Dict[str, float]:
    if filtered:
        rpt_path = Path(solution_dir) / 'reports/export_impl.xml'
        if rpt_path.is_file():
            return _parse_timing_report_xml(rpt_path)
        
        rpt_path = Path(solution_dir) / 'reports/impl_timing_summary.rpt'
        if rpt_path.is_file():
            return _parse_timing_report_txt(rpt_path)
        
        return {m: -1.0 for m in TIMING_METRICS}

    rpt_path = Path(solution_dir) / 'impl/report/verilog/export_impl.xml'
    if rpt_path.is_file():
        return _parse_timing_report_xml(rpt_path)
    
    rpt_path = Path(solution_dir) / 'impl/verilog/report/vivado_impl.xml'
    if rpt_path.is_file():
        return _parse_timing_report_xml(rpt_path)
    
    rpt_path = Path(solution_dir) / 'impl/verilog/project.runs/impl_1/bd_0_wrapper_timing_summary_routed.rpt'
    if rpt_path.is_file():
        return _parse_timing_report_txt(rpt_path)
    
    return {m: -1.0 for m in TIMING_METRICS}


def extract_utilization(solution_dir, filtered=False) -> Dict[str, int]:
    if filtered:
        rpt_path = Path(solution_dir) / 'reports/export_impl.xml'
        if rpt_path.is_file():
            return _parse_utilization_report_xml(rpt_path)
        
        rpt_path = Path(solution_dir) / 'reports/impl_utilization_placed.rpt'
        if rpt_path.is_file():
            return _parse_utilization_report_txt(rpt_path)
        
        return {m: -1 for m in AREA_METRICS}

    rpt_path = Path(solution_dir) / 'impl/report/verilog/export_impl.xml'
    if rpt_path.is_file():
        return _parse_utilization_report_xml(rpt_path)
    
    rpt_path = Path(solution_dir) / 'impl/verilog/report/vivado_impl.xml'
    if rpt_path.is_file():
        return _parse_utilization_report_xml(rpt_path)
    
    rpt_path = Path(solution_dir) / 'impl/verilog/project.runs/impl_1/bd_0_wrapper_utilization_placed.rpt'
    if rpt_path.is_file():
        return _parse_utilization_report_txt(rpt_path)
    
    return {m: -1 for m in AREA_METRICS}


def extract_cc_report(solution_dir, filtered=False) -> Dict[str, int]:
    if filtered:
        rpt_path = Path(solution_dir) / 'reports/csynth.xml'
    else:
        rpt_path = Path(solution_dir)/ 'syn/report/csynth.xml'

    if not os.path.exists(rpt_path):
        print(f'CC report not found in {solution_dir}')
        return {'cc': -1}

    tree = ET.parse(rpt_path)
    root = tree.getroot()
    cc = findint(
        root, 
        'PerformanceEstimates/SummaryOfOverallLatency/Average-caseLatency', 
        default=-1
    )
    return {'cc': cc}


def extract_power_report(solution_dir, filtered=False) -> Dict[str, float]:
    if filtered:
        rpt_path = f'{solution_dir}/reports/impl_power.rpt'
    else:
        rpt_path = f'{solution_dir}/impl/verilog/project.runs/impl_1/bd_0_wrapper_power_routed.rpt'

    if not Path(rpt_path).is_file():
        print(f'Power report not found in {solution_dir}')
        return {m: -1.0 for m in POWER_METRICS}
    
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


def extract_metrics(solution_dir, filtered=False) -> Dict[str, Union[float, int]]:
    metrics = {}

    metrics.update(extract_utilization(solution_dir, filtered))
    metrics['snru'] = compute_snru(metrics)

    metrics.update(extract_timing_summary(solution_dir, filtered))
    metrics.update(extract_power_report(solution_dir, filtered))
    metrics.update(extract_cc_report(solution_dir, filtered))

    achieved_clk = metrics.get('achieved_clk', -1.0)
    cc = metrics.get('cc', -1)
    if achieved_clk > 0.0 and cc > 0:
        metrics['time'] = achieved_clk * cc
    else:
        metrics['time'] = -1.0

    return metrics


def extract_utilization_per_module(solution_dir, filtered=False):
    RESOURCES = ['BRAM', 'DSP', 'FF', 'LUT']
    if filtered:
        rpt_path = Path(solution_dir) / 'reports/export_impl.xml'
    else:
        rpt_path = Path(solution_dir) / 'impl/report/verilog/export_impl.xml'
        if not rpt_path.is_file():
            rpt_path = Path(solution_dir) / 'impl/verilog/report/vivado_impl.xml'

    if not rpt_path.is_file():
        print(f'Utilization report not found in {solution_dir}')
        return {}
    
    tree = ET.parse(rpt_path)
    root = tree.getroot()

    modules = root.findall('RtlModules/RtlModule')
    module_utilization = {}
    for module in modules:
        module_resources = {}
        module_type = module.get('TYPE')
        if module_type == 'function':
            module_name = module.get('MODULENAME')
            local_resources = module.find('LocalResources')
            if module_name is None or local_resources is None:
                continue

            for res in RESOURCES:
                res_elem = int(local_resources.get(res, default=0))
                module_resources[f"local_{res.lower()}"] = res_elem
        else:
            module_name = module.get('DISPNAME')

        resources = module.find('Resources')
        if resources is None:
            resources = module.find('LocalResources')
            if resources is None:
                continue

        for res in RESOURCES:
            res_elem = int(resources.get(res, default=0))
            module_resources[res.lower()] = res_elem

        module_utilization[module_name] = module_resources

    return module_utilization


def extract_auto_dcts_from_log(hls_log_path):
    AUTO_INLINE_CODE = '[HLS 214-178]'
    AUTO_PIPE_CODE = '[HLS 214-376]'
    AUTO_AP_CODE = '[XFORM 203-102]'
    AUTO_LF_CODE = '[XFORM 203-541]'

    with open(hls_log_path, "r") as f:
        lines = f.readlines()

    auto_dcts = {
        "inline": set(),
        "pipeline": set(),
        "array_partition": set(),
        "loop_flatten": set()
    }

    for line in lines:
        if AUTO_INLINE_CODE in line:
            if 'Inlining function \'' not in line:
                continue
            function = line.split('Inlining function \'')[1].split('\'')[0].strip()
            auto_dcts['inline'].add(function)

        elif AUTO_PIPE_CODE in line:
            if 'automatically set the pipeline for Loop<' not in line:
                continue
            loop = line.split('automatically set the pipeline for Loop<')[1].split('>')[0].strip()
            auto_dcts['pipeline'].add(loop)

        elif AUTO_AP_CODE in line:
            if 'Automatically partitioning small array \'' not in line:
                continue
            array = line.split('Automatically partitioning small array \'')[1].split('\'')[0].strip()
            auto_dcts['array_partition'].add(array)

        elif AUTO_LF_CODE in line:
            if 'Flattening a loop nest \'' not in line or 'in function \'' not in line:
                continue
            loop = line.split('Flattening a loop nest \'')[1].split('\'')[0].strip()
            function = line.split('in function \'')[1].split('\'')[0].strip()
            auto_dcts['loop_flatten'].add((loop, function))

    return auto_dcts 

def export_directives_as_tcl(
    solution_data_json_path: Union[str, Path],
    output_path: Union[str, Path]
):
    with open(solution_data_json_path, "r") as f:
        data = json.load(f)
    directives = data["HlsSolution"]["DirectiveTcl"]
    with open(output_path, "w") as f:
        directives = "\n".join(directives)
        f.write(directives)


def parse_tcl_directives(dct_tcl_path) -> List[Tuple[str, Dict[str, str]]]:
    if not os.path.exists(dct_tcl_path):
        raise ValueError(f"Directives file not found: {dct_tcl_path}")
    with open(dct_tcl_path, "r") as f:
        lines = f.readlines()
    directives = []
    for line in lines:
        if (not line.startswith('set_directive_')
            or line.startswith('set_directive_top')):
            continue
        directives.append(parse_directive_cmd(line))
    return directives


def parse_directive_cmd(directive_cmd) -> Tuple[str, Dict[str, str]]:
    cmd = directive_cmd.split(' ')[0].split('set_directive_')[1]
    args = directive_cmd.split(' ')[1:]
    parsed_args = _parse_directive_options(args)
    return cmd, parsed_args


def compute_snru(util_report: Dict[str, int]) -> float:
    if any(v == -1 for v in util_report.values()):
        return -1.0
    return sum([
        util_report[res] / total
        for res, total in AVAILABLE_RESOURCES.items()
        if res in util_report and total > 0
    ]) * 100.0


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
    integer_pattern = '[+-]?\d+'
    decimal_pattern = '[+-]?\d*\.?\d+'
    rx_int = re.compile(integer_pattern, re.VERBOSE)
    rx_dec = re.compile(decimal_pattern, re.VERBOSE)
    
    lut = bram = ff = dsp = -1
        
    with open(rpt_path, "r") as rpt:
        lines = rpt.readlines()

    lut_line = _find_line_containing(lines, 'CLB LUTs')
    ff_line = _find_line_containing(lines, 'Register as Flip Flop')
    dsp_line = _find_line_containing(lines, 'DSPs')
    bram_line = _find_line_containing(lines, 'Block RAM Tile')

    if lut_line != -1:
        lut = int((rx_int.findall(lines[lut_line]))[0])
    if ff_line != -1:
        ff = int((rx_int.findall(lines[ff_line]))[0])
    if dsp_line != -1:
        dsp = int((rx_int.findall(lines[dsp_line]))[0])
    if bram_line != -1:
        # This value is multiplied by 2 in the XML reports
        # but in the text report it is not, so we multiply it here
        bram = int(float((rx_dec.findall(lines[bram_line]))[0]) * 2)
        
    return {'lut': lut, 'ff': ff, 'dsp': dsp, 'bram': bram}


def _parse_timing_report_txt(rpt_path):
    decimal_pattern = '[+-]?\d*\.?\d+'
    rx = re.compile(decimal_pattern, re.VERBOSE)

    wns = tns = -1.0
    target_clk = 8.0

    with open(rpt_path, "r") as rpt:
        lines = rpt.readlines()

    start_idx = _find_line_containing(lines, 'WNS(ns)', 'TNS(ns)')
    if start_idx == -1:
        return {
            'wns': -1.0,
            'tns': -1.0,
            'target_clk': target_clk,
            'achieved_clk': -1.0
        }
    
    rpt_line = lines[start_idx + 2]
    rpts = rx.findall(rpt_line)
    wns = float(rpts[0])
    tns = float(rpts[1])
    
    return {
        'wns': wns,
        'tns': tns,
        'target_clk': target_clk,
        'achieved_clk': target_clk - wns if wns >= 0 else -1.0
    }


def _find_line_containing(lines: List[str], *search_string) -> int:
    for i, line in enumerate(lines):
        if all(s in line for s in search_string):
            return i
    return -1


def _parse_directive_options(directive_options: List[str]) -> Dict[str, str]:
    parsed_args = {}

    is_loc_parsed = False
    i = 0
    while i < len(directive_options):
        if not directive_options[i]:
            i += 1
            continue
        if directive_options[i].startswith('-'):
            if directive_options[i].find('=') != -1:
                key, value = directive_options[i].split('=')
                parsed_args[key[1:]] = value
            elif directive_options[i] == '-off':
                parsed_args['off'] = "true"
            else:
                parsed_args[directive_options[i][1:]] = directive_options[i+1]
                i += 1
        elif not is_loc_parsed:
            parsed_args['location'] = directive_options[i]
            is_loc_parsed = True
        else:
            parsed_args['variable'] = directive_options[i]
        i += 1

    for key, args in parsed_args.items():
        parsed_args[key] = args.strip('" \n')

    return parsed_args

