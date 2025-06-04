import os
import re
import json
import xml.etree.ElementTree as ET
from abc import ABC, abstractmethod
from enum import IntEnum
from typing import Optional, Dict, Union, List, Tuple

from gnn.data.utils.xml_utils import findint, findfloat
from gnn.data.utils.parsers import (
    extract_metrics,
    extract_utilization_per_module
)


CDFG_NODE_TYPES = [
    "instr", "port", "const", "block", "region"
]

CDFG_EDGE_TYPES = [
    # Data flow edges
    ("const", "data", "instr"), 
    ("instr", "data", "instr"),
    ("port", "data", "instr"), 

    # Edges representing relationships between load and 
    # store instructions that access the same memory
    ("instr", "mem", "instr"),

    # Edges representing constant pointers to global arrays
    ("instr", "data", "const"),
    ("port", "data", "const"),

    # Control flow edges
    ("block", "control", "instr"), 
    ("block", "control", "block"), 

    # Call flow edges
    ("instr", "call", "instr"),

    # Edges for hierarchical relationships
    ("region", "hrchy", "region"), 
    ("region", "hrchy", "block"),
    ("region", "hrchy", "instr"),
    ("block", "hrchy", "instr"),
]

RESOURCES = {'FF', 'LUT', 'DSP', 'BRAM'}
MAX_ARRAY_DIM = 4


ArrayInfo = Dict[str, Union[int, str, List[int]]]


class PortDirection(IntEnum):
    IN = 0
    OUT = 1
    BI = 2


class Node(ABC):
    @abstractmethod
    def as_dict(self):
        pass

    @abstractmethod
    def __str__(self):
        pass

    @abstractmethod
    def __repr__(self):
        pass


class CDFGNode(Node):
    def __init__(self, element: ET.Element, function: str):
        value = element.find('Value')
        obj = element.find('Obj') if value is None else value.find('Obj')
        if obj is None:
            raise ValueError("Element does not contain 'Obj' or 'Value/Obj' tag")
        
        self.id = findint(obj, 'id')
        if self.id is None:
            raise ValueError("Element does not contain 'id' tag")
        
        self.name = obj.findtext('name', '')
        self.rtl_name = obj.findtext('rtlName', '')
        self.function = function
        self.attrs = {}
        self.label = self.name

    def as_dict(self):
        attributes = {}
        for key, value in self.attributes.items():
            if isinstance(value, list):
                attributes[key] = value.index(1) if 1 in value else -1
            else:
                attributes[key] = value
        return {'name': self.label, 'attributes': attributes}
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()
    

class RegionNode(Node):
    def __init__(
        self, 
        element: ET.Element, 
        function: str,
        utilization: Optional[Dict[str, int]] = None
    ):
        self.id = findint(element, 'mId')
        if self.id is None:
            raise ValueError("Element does not contain 'mId' tag")
        
        self.name = element.findtext('mTag')
        self.function = function
        self.label = (f"{self.function}/{self.name}" 
                      if self.name and self.name != self.function
                      else self.function)
        self.label = self.label.replace(' ', '_')

        self.is_loop = findint(element, 'mType', 0) == 1
        loop_depth = findint(element, 'mDepth', 0)
        loop_depth = max(1, loop_depth) if self.is_loop else 0

        min_lat = max(1, findint(element, 'mMinLatency', 0))
        max_lat = max(min_lat, findint(element, 'mMaxLatency', 0))
        min_tc = max(1, findint(element, 'mMinTripCount', 0))
        max_tc = max(min_tc, findint(element, 'mMaxTripCount', 0))

        if (ii := findint(element, 'mII', 0)) <= 0:
            ii = max(1, max_lat / max_tc)

        self.attrs = {
            'min_latency': min_lat, 
            'max_latency': max_lat,
            'min_trip_count': min_tc, 
            'max_trip_count': max_tc,
            'loop_depth': loop_depth, 
            'ii': ii, 

            'pipeline': 0,
            'unroll': 0,
            'unroll_factor': 0,
            'loop_merge': 0,
            'loop_flatten': 0,
            'dataflow': 0, 
            'inline': 0,
        }

        if utilization is not None:
            for res in RESOURCES:
                self.attrs[f"local_{res}"] = utilization.get(res, 0)
        else:
            for res in RESOURCES:
                self.attrs[f"local_{res}"] = 0

        self.sub_regions = self._extract_items(element, 'sub_regions')
        self.blocks = self._extract_items(element, 'basic_blocks')
        self.instrs = []
    
    def _extract_items(self, element, tag):
        return [
            int(item.text) 
            for item in element.find(tag).findall('item')
        ]
    
    def as_dict(self):
        attributes = {}
        for key, value in self.attrs.items():
            if isinstance(value, list):
                attributes[key] = value.index(1) if 1 in value else -1
            else:
                attributes[key] = value
        return {
            'name': self.label, 
            'attributes': attributes,
            'sub_regions': self.sub_regions,
            'blocks': self.blocks,
            'instructions': self.instrs
        }
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()


class PortNode(CDFGNode):
    def __init__(
        self, 
        element: ET.Element, 
        function: str,
        is_top_level: bool,
        array_info: Optional[ArrayInfo] = None
    ):
        super().__init__(element, function)
        
        self.is_array = array_info is not None
        if self.is_array:
            base_type = array_info.get('BaseType', -1)
            self.total_size = max(1, array_info.get('TotalSize', 1))

            dims = array_info.get('Dimensions', [])
            num_dims = len(dims)
            if num_dims > MAX_ARRAY_DIM:
                # Truncate to MAX_ARRAY_DIM, multiplying the last dimension
                # by the product of the remaining dimensions
                for i in range(num_dims - 1, MAX_ARRAY_DIM - 1, -1):
                    dims[i - 1] *= dims[i]
                    dims.pop()
            elif num_dims < MAX_ARRAY_DIM: # Pad with 1s
                dims.extend([1] * (MAX_ARRAY_DIM - num_dims))
        else:
            base_type = -1
            self.total_size = 1
            dims = [1] * MAX_ARRAY_DIM

        self.label = f'{self.function}/{self.name}'
        self.is_top_level = is_top_level

        direction_idx = findint(element, 'direction')
        if direction_idx is None or direction_idx < 0 or direction_idx > 2:
            direction_idx = PortDirection.BI # Default to bidirectional
        direction = [0, 0, 0]
        direction[direction_idx] = 1

        self.attrs.update({
            'direction': direction,
            'top_level': int(is_top_level),
            'bitwidth': findint(element, 'Value/bitwidth', 0),
            'port_type': element.findtext('if_type', '-1'),

            'base_type': str(base_type),
            'dims': dims,

            'array_partition': 0,
            'partition_type': [0, 0, 0],
            'partition_dim': [0] * (MAX_ARRAY_DIM + 1),
            'partition_factor': 0
        })

    def as_dict(self):
        attributes = {}
        for key, value in self.attrs.items():
            if isinstance(value, list):
                attributes[key] = value.index(1) if 1 in value else -1
            else:
                attributes[key] = value
        return {
            'name': self.label, 
            'is_array': self.is_array,
            'attributes': attributes
        }

    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()


class InstructionNode(CDFGNode):
    def __init__(
        self, 
        element: ET.Element, 
        function: str,
        resource_estimates: Optional[Dict[str, int]] = None,
        utilization: Optional[Dict[str, int]] = None,
        array_info: Optional[ArrayInfo] = None
    ):
        super().__init__(element, function)

        self.is_array = array_info is not None
        if self.is_array:
            base_type = array_info.get('BaseType', -1)
            self.total_size = max(1, array_info.get('TotalSize', 1))

            dims = array_info.get('Dimensions', [])
            num_dims = len(dims)
            if num_dims > MAX_ARRAY_DIM:
                # Truncate to MAX_ARRAY_DIM, multiplying the last dimension
                # by the product of the remaining dimensions
                for i in range(num_dims - 1, MAX_ARRAY_DIM - 1, -1):
                    dims[i - 1] *= dims[i]
                    dims.pop()
            elif num_dims < MAX_ARRAY_DIM: # Pad with 1s
                dims.extend([1] * (MAX_ARRAY_DIM - num_dims))
        else:
            base_type = -1
            self.total_size = 1
            dims = [1] * MAX_ARRAY_DIM

        self.opcode = element.findtext('opcode', '')
        self.label = 'gep' if self.opcode == 'getelementptr' else self.opcode

        self.line_number = findint(element, 'Value/Obj/lineNumber', 0)

        self.attrs.update({
            'opcode': self.opcode,
            'impl': element.findtext('Value/Obj/coreName', ''),
            'bitwidth': findint(element, 'Value/bitwidth', 0),
            'delay': findfloat(element, 'm_delay', 0.0),

            'base_type': str(base_type),
            'dims': dims,

            'array_partition': 0,
            'partition_type': [0, 0, 0],
            'partition_dim': [0] * (MAX_ARRAY_DIM + 1),
            'partition_factor': 0
        })

        self.operand_edges = [
            int(edge.text) 
            for edge in element.find('oprand_edges').findall('item')
        ]

        if resource_estimates is not None:
            for res in RESOURCES:
                self.attrs[f"{res}_estimate"] = resource_estimates.get(res, 0)
        else:
            for res in RESOURCES:
                self.attrs[f"{res}_estimate"] = 0

        if utilization is not None:
            for res in RESOURCES:
                self.attrs[res] = utilization.get(res, 0)
        else:
            for res in RESOURCES:
                self.attrs[res] = 0

    def as_dict(self):
        attributes = {}
        for key, value in self.attrs.items():
            if isinstance(value, list):
                attributes[key] = value.index(1) if 1 in value else -1
            else:
                attributes[key] = value
        return {
            'name': self.label, 
            'rtl_name': self.rtl_name,
            'function': self.function,
            'opcode': self.opcode,
            'is_array': self.is_array,
            'attributes': attributes
        }
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()


class ConstantNode(CDFGNode):
    def __init__(self, element: ET.Element, function_name: str):
        super().__init__(element, function_name)

        self.label = element.findtext('content', '')
        self.attrs.update({
            'bitwidth': findint(element, 'Value/bitwidth', 0),
            'const_type': element.findtext('const_type', '-1'),
        })

    def as_dict(self):
        attributes = {}
        for key, value in self.attrs.items():
            if isinstance(value, list):
                attributes[key] = value.index(1) if 1 in value else -1
            else:
                attributes[key] = value
        return {
            'name': self.name, 
            'content': self.label,
            'attributes': attributes
        }
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()


class BlockNode(CDFGNode):
    def __init__(self, element: ET.Element, function: str):
        super().__init__(element, function)

        self.label = f"{self.function}/{self.name}"
        self.instrs = self._extract_items(element, 'node_objs')

    def _extract_items(self, element, tag):
        return [
            int(item.text) 
            for item in element.find(tag).findall('item')
        ]

    def as_dict(self):
        return {
            'name': self.label, 
            'instructions': self.instrs
        }
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()


class CDFG:
    def __init__(
        self, 
        root: ET.Element, 
        top_level_function: str, 
        array_info_list: List[ArrayInfo],
        utilization: Dict[str, Dict[str, int]],
        offsets: Optional[Dict[str, int]] = None,
    ):
        self.nodes = {nt: [] for nt in CDFG_NODE_TYPES}
        self.edges = {et: [] for et in CDFG_EDGE_TYPES}

        self._offsets = offsets if offsets else {nt: 0 for nt in CDFG_NODE_TYPES}
        self._node_id_map = {}

        cdfg = root.find('syndb/cdfg')
        if cdfg is None:
            raise ValueError("CDFG not found in the XML file")
        cdfg_regions = root.find('syndb/cdfg_regions')
        if cdfg_regions is None:
            raise ValueError("CDFG regions not found in the XML file")

        # Extract function information
        self.name = cdfg.findtext('name')
        self.ret_bitwidth = findint(cdfg, 'ret_bitwidth')
        self.is_top_level = self.name == top_level_function
        self.function_calls = []

        self._get_resource_estimate_map(root)

        try:
            self._parse_nodes(cdfg, cdfg_regions, array_info_list, utilization)
            self._parse_edges(cdfg)
            self._build_hierarchy_edges()
        except Exception as e:
            print(f"Error parsing CDFG: {e}")
            raise

    def _parse_nodes(self, cdfg, regions, array_info_list, utilization):
        if (consts := cdfg.find('consts')) is None:
            raise ValueError("CDFG does not contain 'consts' section")
        if (instrs := cdfg.find('nodes')) is None:
            raise ValueError("CDFG does not contain 'nodes' section")
        if (ports := cdfg.find('ports')) is None:
            raise ValueError("CDFG does not contain 'ports' section")
        if (blocks := cdfg.find('blocks')) is None:
            raise ValueError("CDFG does not contain 'blocks' section")
        
        self._process_instrs(instrs, array_info_list, utilization)
        self._process_ports(ports, array_info_list)
        self._process_consts(consts)
        self._process_blocks(blocks)
        self._process_regions(regions, utilization)

    def _process_instrs(self, instrs, array_info_list, utilization):
        # Note: the 'nodes' section contains instructions and global variables
        # (represented as instructions with a 'GlobalMem' opcode)
        offset = self._offsets['instr']

        for i, elem in enumerate(instrs.findall('item')):
            value = elem.find('Value')
            obj = elem.find('Obj') if value is None else value.find('Obj')
            if obj is None:
                raise ValueError("Element does not contain 'Obj' or 'Value/Obj' tag")
            
            name = obj.findtext('name', '')
            rtl_name = obj.findtext('rtlName', '')
            resource_estimates = self._resource_estimate_map.get(rtl_name) if rtl_name else None
            utilization_info = utilization.get(rtl_name) if rtl_name else None
            opcode = elem.findtext('opcode', '')

            array_info = get_array_info(
                array_info_list, name, self.name, 
                is_global_mem=opcode == 'GlobalMem'
            )
            node = InstructionNode(
                elem, self.name, 
                resource_estimates=resource_estimates,
                utilization=utilization_info,
                array_info=array_info
            )
            self._node_id_map[node.id] = (i + offset, 'instr')
            node.id = i + offset
            self.nodes['instr'].append(node)

    def _process_ports(self, ports, array_info_list):
        offset = self._offsets['port']

        for i, elem in enumerate(ports.findall('item')):
            value = elem.find('Value')
            obj = elem.find('Obj') if value is None else value.find('Obj')
            if obj is None:
                raise ValueError("Element does not contain 'Obj' or 'Value/Obj' tag")
            name = obj.findtext('name', '')

            array_info = get_array_info(array_info_list, name, self.name)
            node = PortNode(
                elem, self.name, self.is_top_level, 
                array_info=array_info
            )
            self._node_id_map[node.id] = (i + offset, 'port')
            node.id = i + offset
            self.nodes['port'].append(node)

    def _process_consts(self, consts):
        # Note: Constant nodes with type 6 are used to 
        # represent call edges and will be removed later
        offset = self._offsets['const']
        dummy_consts = []

        for elem in consts.findall('item'):
            node = ConstantNode(elem, self.name)
            if node.attrs['const_type'] == '6':
                dummy_consts.append(node)
            else:
                self.nodes['const'].append(node)

        self.nodes['const'].extend(dummy_consts)

        for i, node in enumerate(self.nodes['const']):
            self._node_id_map[node.id] = (i + offset, 'const')
            self.nodes['const'][i].id = i + offset

    def _process_blocks(self, blocks):
        offset = self._offsets['block']
        for i, elem in enumerate(blocks.findall('item')):
            node = BlockNode(elem, self.name)
            self._node_id_map[node.id] = (i + offset, 'block')
            node.id = i + offset
            node.instrs = [
                self._node_id_map[instr_id][0]
                for instr_id in node.instrs
                if instr_id in self._node_id_map
            ]
            self.nodes['block'].append(node)

    def _process_regions(self, regions, utilization):
        offset = self._offsets['region']
        for elem in regions.findall('item'):
            region_name = elem.findtext('mTag', '')
            if region_name:
                utilization_info = utilization.get(region_name, {})
            else:
                utilization_info = None

            node = RegionNode(elem, self.name, utilization=utilization_info)
            node.id += offset - 1
            
            node.sub_regions = [
                sub_region_id + offset - 1
                for sub_region_id in node.sub_regions
            ]
            node.blocks = [
                self._node_id_map[block_id][0] 
                for block_id in node.blocks 
                if block_id in self._node_id_map
            ]

            utilization_info = utilization.get(node.name)
            if utilization_info is not None:
                for res in RESOURCES:
                    node.attrs[f"local_{res}"] = utilization_info.get(res, 0)

            self.nodes['region'].append(node)

    def _parse_edges(self, cdfg):
        for elem in cdfg.find('edges').findall('item'):
            rel = self._map_edge_type(elem.findtext('edge_type', ''))
            if rel == '':
                continue

            src = findint(elem, 'source_obj')
            dst = findint(elem, 'sink_obj')
            if src is None or dst is None:
                continue

            src, src_nt = self._node_id_map.get(src, (None, None))
            dst, dst_nt = self._node_id_map.get(dst, (None, None))
            if src is None or dst is None:
                continue

            et = (src_nt, rel, dst_nt)
            if et not in CDFG_EDGE_TYPES:
                print(f"Skipping edge type: {et}")
                continue

            if et == ('const', 'data', 'instr'):
                src_node = self.nodes[src_nt][src - self._offsets[src_nt]]
                if src_node.attrs['const_type'] == '6':
                    callee_name = src_node.name
                    self.function_calls.append((dst, callee_name))
                    continue

            self.edges[et].append((src, dst))

        # Remove dummy constants (representing call edges)
        for i, node in enumerate(self.nodes['const']):
            if node.attrs['const_type'] == '6':
                del self.nodes['const'][i:]
                break

    def _map_edge_type(self, edge_type):
        return {'1': 'data', '2': 'control', '4': 'mem'}.get(edge_type, '')

    def _build_hierarchy_edges(self):
        block_offset = self._offsets['block']
        for i, region in enumerate(self.nodes['region']):
            for sub_region_id in region.sub_regions:
                self.edges[('region', 'hrchy', 'region')].append((region.id, sub_region_id))
            for block_id in region.blocks:
                self.edges[('region', 'hrchy', 'block')].append((region.id, block_id))
                block_node = self.nodes['block'][block_id - block_offset]
                for instr_id in block_node.instrs:
                    self.nodes['region'][i].instrs.append(instr_id)
                    self.edges[('region', 'hrchy', 'instr')].append((region.id, instr_id))
                    self.edges[('block', 'hrchy', 'instr')].append((block_id, instr_id))

    def _get_resource_estimate_map(self, root):
        res_items = root.findall('*/res/*/item')
        rx = re.compile(' \(.*\)')

        self._resource_estimate_map = {}
        
        for item in res_items:
            rtl_name = re.sub(rx, '', item.find('first').text).strip()
            rtl_resources = item.find('second')
            if rtl_resources is None or rtl_name in self._resource_estimate_map:
                continue
            res_map = {res: 0 for res in RESOURCES}
            for res in rtl_resources.iter('item'):
                res_name = res.findtext('first')
                if res_name in res_map:
                    res_map[res_name] = findint(res, 'second')
            self._resource_estimate_map[rtl_name] = res_map

    def as_dict(self):
        return {
            'name': self.name,
            'ret_bitwidth': self.ret_bitwidth,
            'is_top_level': self.is_top_level,
            'function_calls': self.function_calls,
            'resource_estimates': self._resource_estimate_map,
            'nodes': {
                nt: [n.as_dict() for n in nodes] 
                for nt, nodes in self.nodes.items()
            },
            'edges': {
                f"{et[0]}__{et[1]}__{et[2]}": edges 
                for et, edges in self.edges.items()
            }
        }
    
    def save_as_json(self, filepath):
        with open(filepath, 'w') as f:
            json.dump(self.as_dict(), f, indent=2)

    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)


class VitisKernelInfo:
    def __init__(
        self, 
        solution_dir: str, 
        top_level_function: str, 
        array_info_path: str,
        global_array_usage_path: str,
        kernel_name: Optional[str] = None,
        filtered: bool = False
    ):
        self.top_level_function = top_level_function
        self.kernel_name = kernel_name if kernel_name else top_level_function
        self.nodes = {nt: [] for nt in CDFG_NODE_TYPES}
        self.edges = {et: [] for et in CDFG_EDGE_TYPES}

        self.metrics = extract_metrics(solution_dir, filtered=filtered)
        self.utilization = extract_utilization_per_module(solution_dir, filtered=filtered)

        self._offsets = {nt: 0 for nt in CDFG_NODE_TYPES}
        self._cdfgs = {}

        with open(array_info_path, 'r') as f:
            array_info_json = json.load(f)

        if not array_info_json:
            raise ValueError("Array info is empty")
        
        array_info_list = array_info_json.get('ArrayInfo')
        
        for i in range(len(array_info_list)):
            for key, value in array_info_list[i].items():
                if isinstance(value, str) and key not in ['Name', 'FunctionName']:
                    array_info_list[i][key] = int(value.strip())
                elif isinstance(value, list):
                    for j in range(len(value)):
                        if isinstance(value[j], str):
                            value[j] = int(value[j].strip())

        with open(global_array_usage_path, 'r') as f:
            global_array_usage = json.load(f)

        if not global_array_usage:
            raise ValueError("Global array usage info is empty")
        
        global_array_usage = global_array_usage.get('GlobalArrayUsageInfo')

        try:
            self._process_adb_files(solution_dir, filtered, array_info_list)
            self._include_call_flow()
            self._complement_cdfg_edges(global_array_usage)
        except Exception as e:
            print(f"Error processing ADB files: {e}")
            raise

    def _process_adb_files(self, solution_dir, filtered, array_info_list):
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
            cdfg = CDFG(
                root=root, 
                top_level_function=self.top_level_function, 
                array_info_list=array_info_list, 
                utilization=self.utilization,
                offsets=self._offsets
            )
            self._cdfgs[cdfg.name] = cdfg
            self._merge_cdfg_data(cdfg)

    def _merge_cdfg_data(self, cdfg):
        for node_type, nodes in cdfg.nodes.items():
            self.nodes[node_type].extend(nodes)
            self._offsets[node_type] += len(nodes)

        for edge_type, edges in cdfg.edges.items():
            self.edges[edge_type].extend(edges)

    def _include_call_flow(self):
        call_edge_type = ('instr', 'call', 'instr')
        for cdfg in self._cdfgs.values():
            for function_call in cdfg.function_calls:
                callee = function_call[1]
                callee_cdfg = self._cdfgs[callee]
                callee_start = callee_cdfg.nodes['instr'][0]
                self.edges[call_edge_type].append((function_call[0], callee_start.id))

    def _complement_cdfg_edges(self, global_array_usage):
        def get_global_array_node(array_name):
            for node in self.nodes['instr']:
                if (node.name == array_name 
                    and node.attrs['opcode'] == 'GlobalMem'):
                    return node
            return None
        
        for array_info in global_array_usage:
            array_node = get_global_array_node(array_info['Name'])
            if array_node is None:
                continue

            for array_use in array_info['Uses']:
                function_name = array_use.get('FunctionName', '')
                if not function_name:
                    continue

                cdfg = self._cdfgs.get(function_name)
                if cdfg is None:
                    continue

                instr_nodes = cdfg.nodes['instr']
                instr_id = -1
                instr_name = array_use.get('Name', '')
                store_idx = array_use.get('StoreIdx', -1)

                if store_idx >= 0:
                    store_count = 0
                    for instr_node in instr_nodes:
                        if instr_node.attrs.get('opcode', '') == 'store':
                            if store_count == store_idx:
                                instr_id = instr_node.id
                                break
                            store_count += 1
                elif instr_name:
                    for instr_node in instr_nodes:
                        if (instr_node.name == instr_name
                            and instr_node.attrs.get('opcode', '') in ['load', 'getelementptr']):
                            instr_id = instr_node.id
                            break
                
                if instr_id == -1:
                    continue

                src, dst = array_node.id, instr_id
                if not self._edge_exists(src, dst, ('instr', 'data', 'instr')):
                    self.edges[('instr', 'data', 'instr')].append((src, dst))
    
    def _edge_exists(self, src: int, dst: int, edge_type: Tuple[str, str, str]) -> bool:
        return any(
            src == edge[0] and dst == edge[1] 
            for edge in self.edges.get(edge_type, [])
        )

    def as_dict(self):
        return {
            'name': self.kernel_name,
            'top_level_function': self.top_level_function,
            'metrics': self.metrics,
            'utilization': self.utilization,
            'cdfgs': {
                name: cdfg.as_dict() 
                for name, cdfg in self._cdfgs.items()
            }
        }

    def save_as_json(self, filepath):
        with open(filepath, 'w') as f:
            json.dump(self.as_dict(), f, indent=2)
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()
    

def get_array_info(
    array_info_list: List[ArrayInfo],
    array_name: str,
    function_name: str,
    is_global_mem: bool = False
) -> Optional[ArrayInfo]:
    for array_info in array_info_list:
        if array_info['Name'] == array_name:
            if array_info.get('FunctionName', '') == function_name:
                return array_info
    # If no entry is found and `is_global_mem` is True, search for the global array
    if is_global_mem:
        for array_info in array_info_list:
            if 'IsGlobal' in array_info and array_info['IsGlobal']:
                if array_info['Name'] == array_name:
                    return array_info
    # If no entry is found, search for the array name only
    for array_info in array_info_list:
        if array_info['Name'] == array_name:
            return array_info
    return None


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


if __name__ == "__main__":
    # Example usage
    import sys

    from gnn.data.kernel.llvm_utils import extract_llvm_ir_array_info

    solution_dir = sys.argv[1] if len(sys.argv) > 1 else "data/base_instances/ADPCM/solution0"
    top_level_function = sys.argv[2] if len(sys.argv) > 2 else "adpcm_main"
    output_path = sys.argv[3] if len(sys.argv) > 3 else "kernel_info.json"
    kernel_name = sys.argv[4] if len(sys.argv) > 4 else "ADPCM"

    ir_dir = os.path.join(solution_dir, ".autopilot/db")
    if not os.path.exists(ir_dir):
        print(f"Directory {ir_dir} not found")
        sys.exit(1)

    array_info_path = os.path.join(ir_dir, "array_info.json")
    global_array_usage_path = os.path.join(ir_dir, "global_array_usage.json")

    # Extract array info from LLVM IR files
    extract_llvm_ir_array_info(ir_dir, array_info_path, global_array_usage_path)

    if not os.path.exists(array_info_path):
        print(f"Array info file {array_info_path} not found")
        sys.exit(1)

    if not os.path.exists(global_array_usage_path):
        print(f"Global array usage file {global_array_usage_path} not found")
        sys.exit(1)

    kernel_info = VitisKernelInfo(
        solution_dir, 
        top_level_function, 
        array_info_path, 
        global_array_usage_path,
        kernel_name=kernel_name,
        filtered=False
    )
    
    print(kernel_info)
    kernel_info.save_as_json(output_path)