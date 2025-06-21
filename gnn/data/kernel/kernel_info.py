import os
import xml.etree.ElementTree as ET
from typing import Dict

from gnn.data.utils.parsers import extract_utilization_per_module


class ModuleInfo:
    def __init__(self, root: ET.Element, 
                 utilization_dict: Dict[str, Dict[str, int]]):
        cdfg = root.find('syndb/cdfg')
        if cdfg is None:
            raise ValueError("CDFG element not found in the XML.")
        
        regions = root.findall('syndb/cdfg_regions')
        if regions is None:
            raise ValueError("CDFG regions element not found in the XML.")
        
        nodes = cdfg.find('nodes')
        if nodes is None:
            raise ValueError("CDFG does not contain 'nodes' section")
        
        self.name = cdfg.get('name', '')
        self.nodes = self._parse_nodes(nodes, utilization_dict)
        self.regions = self._parse_regions(regions, utilization_dict)

    def _parse_nodes(self, nodes, utilization_dict):
        parsed_nodes = {}

        for item in nodes.findall('item'):
            value = item.find('Value')
            obj = item.find('Obj') if value is None else value.find('Obj')
            if obj is None:
                raise ValueError("Element does not contain 'Obj' or 'Value/Obj' tag")
            
            rtl_name = obj.findtext('rtlName', '')
            name = obj.findtext('name', '')
            if not rtl_name or not name:
                continue

            utilization = utilization_dict.get(rtl_name, {})
            if not utilization:
                continue
            parsed_nodes[name] = utilization

        return parsed_nodes
    
    def _parse_regions(self, regions, utilization_dict):
        parsed_regions = {}

        for item in regions.findall('item'):
            region_name = item.findtext('mTag', '')
            if not region_name or region_name not in utilization_dict:
                continue
            parsed_regions[region_name] = utilization_dict[region_name]

        return parsed_regions
    

class KernelInfo:
    def __init__(self, solution_dir: str, 
                 benchmark_name: str, 
                 filtered: bool = False):
        self.benchmark_name = benchmark_name

        utilization_dict = extract_utilization_per_module(
            solution_dir, filtered=filtered
        )
        self.modules = self._process_adb_files(
            solution_dir, filtered, utilization_dict
        )

    def _process_adb_files(self, solution_dir, filtered, utilization_dict):
        modules = {}
        try:
            adb_file_list = collect_adb_files(solution_dir, filtered)
        except FileNotFoundError as e:
            print(e)
            raise

        if not adb_file_list:
            print(f"No ADB files found in {solution_dir}")
            raise FileNotFoundError("No ADB files found")

        for path in adb_file_list:
            print(f"Processing file: {path}")
            tree = ET.parse(path)
            root = tree.getroot()
            module_info = ModuleInfo(root, utilization_dict)
            modules[module_info.name] = module_info

        return modules


def collect_adb_files(solution_dir, filtered=False):
    if filtered:
        ir_dir = os.path.join(solution_dir, "IRs")
    else:
        ir_dir = os.path.join(solution_dir, ".autopilot/db")

    if not os.path.exists(ir_dir):
        raise FileNotFoundError(f"Directory {ir_dir} not found")

    file_paths = []
    for file_name in os.listdir(ir_dir):
        if file_name.endswith(".adb"):
            if ".bind" in file_name or ".sched" in file_name:
                continue
            print(f"Found file: {file_name}")
            file_paths.append(os.path.join(ir_dir, file_name))

    return file_paths