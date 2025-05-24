import os
import re
import json
import xml.etree.ElementTree as ET
from abc import ABC, abstractmethod
from enum import IntEnum
from typing import Optional, Dict, Union, List, Tuple

from gnn.data.utils.xml_utils import findint, findfloat
from gnn.data.utils.parsers import extract_impl_report


CDFG_NODE_TYPES = [
    "instr", "port", "array", 
    "const", "block", "region"
]

CDFG_EDGE_TYPES = [
    # Data flow edges
    ("const", "data", "instr"), 
    ("instr", "data", "instr"),
    ("port", "data", "instr"), 
    ("array", "data", "instr"),

    # Edges representing constant pointers 
    # to global arrays
    ("array", "data", "const"),

    # Control flow edges
    ("block", "control", "instr"), 
    ("block", "control", "block"), 

    # Call flow edges
    ("instr", "call", "instr"),

    # Memory edges (load->store)
    ("instr", "mem", "instr"),

    # Array allocation edges
    ("instr", "alloca", "array"),

    # Edges for hierarchical relationships
    ("region", "hrchy", "region"), 
    ("region", "hrchy", "block"),
    ("region", "hrchy", "instr"),
    ("block", "hrchy", "instr"),
]

TARGET_RESOURCES = ['FF', 'LUT', 'DSP', 'BRAM']
MAX_ARRAY_DIM = 4


ArrayInfo = Dict[str, Union[int, str, List[int]]]
AttributeDict = Dict[str, Union[int, float, List[int]]]


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
    def __init__(self, element: ET.Element, function_name: str):
        value = element.find('Value')
        obj = element.find('Obj') if value is None else value.find('Obj')
        if obj is None:
            raise ValueError("Element does not contain 'Obj' or 'Value/Obj' tag")
        
        self.id = findint(obj, 'id')
        if self.id is None:
            raise ValueError("Element does not contain 'id' tag")
        
        self.name = obj.findtext('name', '')
        self.rtl_name = obj.findtext('rtlName', '')
        self.function_name = function_name
        self.attrs = {}
        self.label = None

    def as_dict(self):
        return {'name': self.name, 'attributes': self.attrs}
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()
    

class ArrayNode(Node):
    def __init__(
        self, 
        array_info: ArrayInfo,
        node_id: int,
        is_top_level_port: bool = False,
        direction: Optional[PortDirection] = None,
        resources: Optional[Dict[str, int]] = None
    ):
        self.id = node_id
        self.name = array_info['Name']
        self.function_name = array_info.get('FunctionName', '')

        self.label = self.name

        self.is_top_level_port = is_top_level_port
        self.total_size = max(1, array_info.get('TotalSize', 1))

        is_global = int(array_info.get('IsGlobal', 0))

        if is_top_level_port:
            array_impl = [1, 0, 0] # RTL port
        elif self.total_size > 1024:
            array_impl = [0, 1, 0] # BRAM, LUTRAM or URAM
        else:
            array_impl = [0, 0, 1] # Shift register

        direction_encoding = [0, 0, 0]
        if direction is not None:
            is_port = 1
            direction_encoding[direction] = 1
        else:
            is_port = 0

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

        self.attrs = {
            'dims': dims,
            'base_type': array_info.get('BaseType', -1),
            'base_bitwidth': array_info.get('BaseBitwidth', 0),
            'is_global': is_global,
            'is_port': is_port,
            'direction': direction_encoding,
            'array_impl': array_impl,

            # Attributes of HLS directives
            'array_partition': 0,
            'partition_type': [0, 0, 0],
            'partition_dim': [0] * (MAX_ARRAY_DIM + 1),
            'partition_factor': 0
        }

        if resources is not None:
            for resource_type in TARGET_RESOURCES:
                self.attrs[resource_type] = resources.get(resource_type, 0)
        else:
            for resource_type in TARGET_RESOURCES:
                self.attrs[resource_type] = 0

    def as_dict(self):
        return {'name': self.name, 'attributes': self.attrs}
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()
    

class RegionNode(Node):
    def __init__(self, element: ET.Element, function_name: str):
        self.id = findint(element, 'mId')
        if self.id is None:
            raise ValueError("Element does not contain 'mId' tag")
        
        self.name = element.findtext('mTag')
        self.label = self.name
        self.function_name = function_name

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
            'min_latency': min_lat, 'max_latency': max_lat,
            'min_trip_count': min_tc, 'max_trip_count': max_tc,
            'loop_depth': loop_depth, 'ii': ii, 

            # Attributes of HLS directives
            'pipeline': 0,
            'unroll': 0,
            'unroll_factor': 0,
            'loop_merge': 0,
            'loop_flatten': 0,
            'dataflow': 0, 
            'inline': 0,
        }

        self.sub_regions = self._extract_items(element, 'sub_regions')
        self.parents = []

        self.blocks = self._extract_items(element, 'basic_blocks')
        self.instrs = []
    
    def _extract_items(self, element, tag):
        return [
            int(item.text) for item in element.find(tag).findall('item')
        ]
    
    def as_dict(self):
        return {
            'name': self.name, 
            'attributes': self.attrs,
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
        function_name: str,
        is_top_level_port: bool
    ):
        super().__init__(element, function_name)

        self.label = self.name

        direction = findint(element, 'direction', PortDirection.BI)
        if direction == PortDirection.IN:
            direction = [1, 0, 0]
        elif direction == PortDirection.OUT:
            direction = [0, 1, 0]
        else:
            direction = [0, 0, 1]

        self.attrs.update({
            'direction': direction,
            'top_level': int(is_top_level_port),
            'bitwidth': findint(element, 'Value/bitwidth', 0),
            'port_type': element.findtext('if_type', '')
        })


class InstructionNode(CDFGNode):
    def __init__(
        self, 
        element: ET.Element, 
        function_name: str,
        resources: Optional[Dict[str, int]] = None,
    ):
        super().__init__(element, function_name)

        opcode = element.findtext('opcode', '')
        self.label = opcode

        self.line_number = findint(element, 'Value/Obj/lineNumber', 0)

        if resources is not None:
            for resource_type in TARGET_RESOURCES:
                self.attrs[resource_type] = resources.get(resource_type, 0)
        else:
            for resource_type in TARGET_RESOURCES:
                self.attrs[resource_type] = 0

        self.attrs.update({
            'opcode': opcode,
            'impl': element.findtext('Value/Obj/coreName', ''),
            'bitwidth': findint(element, 'Value/bitwidth', 0),
            'delay': findfloat(element, 'm_delay', 0.0),
        })

        self.operand_edges = [
            int(edge.text) 
            for edge in element.find('oprand_edges').findall('item')
        ]


class ConstantNode(CDFGNode):
    def __init__(self, element: ET.Element, function_name: str):
        super().__init__(element, function_name)

        self.label = element.findtext('content', '')
        self.attrs.update({
            'bitwidth': findint(element, 'Value/bitwidth', 0),
            'const_type': element.findtext('const_type', ''),
        })


class BlockNode(CDFGNode):
    def __init__(
        self, 
        element: ET.Element, 
        function_name: str,
        instr_nodes: List[InstructionNode],
        node_id_map: Dict[int, Tuple[int, str]],
        instr_offset: int = 0
    ):
        super().__init__(element, function_name)

        self.label = self.name
        self.attrs = {resource_type: 0 for resource_type in TARGET_RESOURCES}
        self._parse_instrs(element, instr_nodes, node_id_map, instr_offset)

    def _parse_instrs(self, element, instr_nodes, node_id_map, instr_offset):
        self.instrs = []
        for instr in element.find('node_objs').findall('item'):
            instr_id, instr_type = node_id_map.get(int(instr.text), (None, None))
            if instr_id is None or instr_type != 'instr':
                continue
            self.instrs.append(instr_id)
            instr_node = instr_nodes[instr_id - instr_offset]
            for resource_type in TARGET_RESOURCES:
                self.attrs[resource_type] += instr_node.attrs[resource_type]
        
        self.attrs["num_instrs"] = len(self.instrs)

    def as_dict(self):
        return {
            'name': self.name, 
            'attributes': self.attrs,
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

        self._get_node_resource_map(root)

        try:
            self._parse_nodes(cdfg, cdfg_regions, array_info_list)
            self._parse_edges(cdfg)
            self._build_hierarchy_edges()
        except Exception as e:
            print(f"Error parsing CDFG: {e}")
            raise

    def _parse_nodes(self, cdfg, regions, array_info_list):
        if (consts := cdfg.find('consts')) is None:
            raise ValueError("CDFG does not contain 'consts' section")
        if (instrs := cdfg.find('nodes')) is None:
            raise ValueError("CDFG does not contain 'nodes' section")
        if (ports := cdfg.find('ports')) is None:
            raise ValueError("CDFG does not contain 'ports' section")
        if (blocks := cdfg.find('blocks')) is None:
            raise ValueError("CDFG does not contain 'blocks' section")
        
        self._process_instrs(instrs, array_info_list)
        self._process_ports(ports, array_info_list)
        self._process_consts(consts)
        self._process_blocks(blocks)
        self._process_regions(regions)

    def _process_instrs(self, instrs, array_info_list):
        # Note: 'nodes' section contains instructions and global variables
        # (represented as instructions with a 'GlobalMem' opcode)
        self._alloca_array_map = {}
        instr_offset = self._offsets['instr']
        array_offset = self._offsets['array']
        instr_idx, array_idx = 0, 0

        for elem in instrs.findall('item'):
            value = elem.find('Value')
            obj = elem.find('Obj') if value is None else value.find('Obj')
            if obj is None:
                raise ValueError("Element does not contain 'Obj' or 'Value/Obj' tag")
            
            node_id = findint(obj, 'id')
            if node_id is None:
                raise ValueError("Element does not contain 'id' tag")
            
            node_name = obj.findtext('name', '')
            rtl_name = obj.findtext('rtlName', '')
            opcode = elem.findtext('opcode')
            resources = self._node_resource_map.get(rtl_name) if rtl_name else None

            array_info = get_array_info(array_info_list, node_name, self.name)
            array_node = None
            if array_info is not None:
                array_id = array_idx + array_offset
                array_idx += 1
                array_node = ArrayNode(array_info, array_id, resources=resources)
                self.nodes['array'].append(array_node)
                if opcode == 'GlobalMem':
                    self._node_id_map[node_id] = (array_id, 'array')
                    continue
                        
            instr_node = InstructionNode(elem, self.name, resources=resources)
            instr_id = instr_idx + instr_offset
            self._node_id_map[instr_node.id] = (instr_id, 'instr')
            instr_node.id = instr_id
            instr_idx += 1
            self.nodes['instr'].append(instr_node)

            if array_node is not None and opcode == 'alloca':
                self.edges[('instr', 'alloca', 'array')].append((instr_id, array_id))
                self._alloca_array_map[instr_id] = array_id

    def _process_ports(self, ports, array_info_list):
        port_offset = self._offsets['port']
        array_offset = self._offsets['array']
        port_idx, array_idx = 0, len(self.nodes['array'])

        for elem in ports.findall('item'):
            value = elem.find('Value')
            obj = elem.find('Obj') if value is None else value.find('Obj')
            if obj is None:
                raise ValueError("Element does not contain 'Obj' or 'Value/Obj' tag")
            
            node_id = findint(obj, 'id')
            if node_id is None:
                raise ValueError("Element does not contain 'id' tag")
            
            node_name = obj.findtext('name', '')
            direction = findint(elem, 'direction', PortDirection.BI)

            array_info = get_array_info(array_info_list, node_name, self.name)
            if array_info is not None:
                array_id = array_idx + array_offset
                array_idx += 1
                node = ArrayNode(
                    array_info, array_id,
                    is_top_level_port=self.is_top_level, 
                    direction=direction
                )
                self._node_id_map[node_id] = (array_id, 'array')
                self.nodes['array'].append(node)
            else:
                node = PortNode(elem, self.name, self.is_top_level)
                port_id = port_idx + port_offset
                self._node_id_map[node.id] = (port_id, 'port')
                node.id = port_id
                port_idx += 1
                self.nodes['port'].append(node)

    def _process_consts(self, consts):
        # Constant nodes with type 6 are used to represent 
        # call edges and will be removed later
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
        instr_nodes = self.nodes['instr']
        instr_offset = self._offsets['instr']
        for i, elem in enumerate(blocks.findall('item')):
            node = BlockNode(
                elem, self.name, instr_nodes, 
                self._node_id_map, instr_offset
            )
            self._node_id_map[node.id] = (i + offset, 'block')
            node.id = i + offset
            self.nodes['block'].append(node)

    def _process_regions(self, regions):
        offset = self._offsets['region']
        for elem in regions.findall('item'):
            node = RegionNode(elem, self.name)
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
            self.nodes['region'].append(node)

        for i, node in enumerate(self.nodes['region']):
            for sub_region_id in node.sub_regions:
                self.nodes['region'][sub_region_id - offset].parents.append(node.id)

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

            elif src_nt == "instr" and rel == "data":
                src_node = self.nodes[src_nt][src - self._offsets[src_nt]]
                if src_node.id in self._alloca_array_map:
                    src = self._alloca_array_map[src_node.id]
                    et = ('array', 'data', dst_nt)

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

    def _get_node_resource_map(self, root):
        res_items = root.findall('*/res/*/item')
        rx = re.compile(' \(.*\)')

        self._node_resource_map = {}
        
        for item in res_items:
            rtl_name = re.sub(rx, '', item.find('first').text).strip()
            rtl_resources = item.find('second')
            if rtl_resources is None or rtl_name in self._node_resource_map:
                continue
            res_map = {res: 0 for res in TARGET_RESOURCES}
            for res in rtl_resources.iter('item'):
                res_name = res.findtext('first')
                if res_name in res_map:
                    res_map[res_name] = findint(res, 'second')
            self._node_resource_map[rtl_name] = res_map

    def as_dict(self):
        return {
            'name': self.name,
            'return_bitwidth': self.ret_bitwidth,
            'nodes': {
                nt: [n.as_dict() for n in nodes] 
                for nt, nodes in self.nodes.items()
            },
            'edges': {
                f"{et[0]}__{et[1]}__{et[2]}": edges 
                for et, edges in self.edges.items()
            }
        }
    
    def dump(self, filepath):
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
        self.metrics = {}

        rpt = extract_impl_report(solution_dir, filtered=filtered)
        for category in ['timing', 'utilization', 'power']:
            for key, value in rpt[category].items():
                if key not in self.metrics:
                    self.metrics[key] = value

        self._offsets = {nt: 0 for nt in CDFG_NODE_TYPES}
        self._cdfgs = {}
        self.region_hrchy = {}

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
            global_array_usage_json = json.load(f)

        if not global_array_usage_json:
            raise ValueError("Global array usage info is empty")
        
        global_array_usage = global_array_usage_json.get('GlobalArrayUsageInfo')

        try:
            self._process_adb_files(solution_dir, filtered, array_info_list)
            self._include_call_flow()
            self._build_region_hrchy()
            self._complement_array_edges(global_array_usage)
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
                root, self.top_level_function, 
                array_info_list, offsets=self._offsets
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

    def _build_region_hrchy(self):
        for node in self.nodes['region']:
            regions_above = set()
            regions_below = set()
            blocks = set(node.blocks)
            instrs = set(node.instrs)

            parents = set(node.parents)
            while parents:
                parent_id = parents.pop()
                if parent_id not in regions_above:
                    regions_above.add(parent_id)
                    parents.update(self.nodes['region'][parent_id - self._offsets['region']].parents)
            
            children = set(node.sub_regions)
            while children:
                child_id = children.pop()
                if child_id not in regions_below:
                    regions_below.add(child_id)
                    child_node = self.nodes['region'][child_id - self._offsets['region']]
                    blocks.update(child_node.blocks)
                    instrs.update(child_node.instrs)
                    children.update(child_node.sub_regions)

            self.region_hrchy[node.id] = {
                'above': regions_above, 'below': regions_below,
                'block': blocks, 'instr': instrs
            }

    def _complement_array_edges(self, global_array_usage):
        def get_array_node(array_name):
            for node in self.nodes['array']:
                if node.name == array_name:
                    return node
            return None
        
        def get_instr_node(instr_name, function_name, idx):
            for node in self.nodes['instr']:
                if node.function_name != function_name:
                    continue

                if instr_name:
                    if node.name == instr_name:
                        return node
                else:               
                    funtion = self._cdfgs.get(function_name)
                    if funtion is None:
                        continue

                    instrs = funtion.nodes['instr']
                    if idx < len(instrs):
                        return instrs[idx]

            return None
        
        for array_info in global_array_usage:
            array_name = array_info['Name']

            array_node = get_array_node(array_name)
            if array_node is None:
                continue

            for usage in array_info['Uses']:
                instr_name = usage['Name']
                function_name = usage['FunctionName']
                idx = usage['Idx']
                instr_node = get_instr_node(instr_name, function_name, idx)
                if instr_node is None:
                    continue
                self.edges[('array', 'data', 'instr')].append((array_node.id, instr_node.id))

        # Add a (Array -> GEP) edge for each (Array -> ArrayPtr -> GEP) path
        for src_array_id, dst_const_id in self.edges.get(("array", "data", "const"), []):
            for src_const_id, dst_instr_id in self.edges.get(("const", "data", "instr"), []):
                if src_const_id == dst_const_id:
                    dst_instr = self.nodes['instr'][dst_instr_id]
                    if dst_instr.attrs['opcode'] == 'getelementptr':
                        self.edges[("array", "data", "instr")].append((src_array_id, dst_instr_id))

        # Add a (Array -> Instr) edge for each (Array -> GEP -> Instr) path
        for src_array_id, dst_instr_id in self.edges.get(("array", "data", "instr"), []):
            dst_instr = self.nodes['instr'][dst_instr_id]
            if dst_instr.attrs['opcode'] == 'getelementptr':
                for src_instr_id, next_instr_id in self.edges.get(("instr", "data", "instr"), []):
                    if src_instr_id == dst_instr_id:
                        self.edges[("array", "data", "instr")].append((src_array_id, next_instr_id))

    def as_dict(self):
        return {
            'name': self.kernel_name,
            'metrics': self.metrics,
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
    
    def __repr__(self):
        return self.__str__()
    

def get_array_info(
    array_info_list: List[ArrayInfo],
    array_name: str,
    function_name: str
) -> Optional[ArrayInfo]:
    for array_info in array_info_list:
        if array_info['Name'] == array_name:
            other_function_name = array_info.get('FunctionName', '')
            if (not other_function_name
                or other_function_name == function_name):
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
