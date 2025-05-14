import os
import json
import xml.etree.ElementTree as ET
from collections import defaultdict
from abc import ABC, abstractmethod
from enum import IntEnum
from typing import Optional, Dict, Union, List, Tuple

from gnn.data.utils.xml_utils import findint, findfloat
from gnn.data.utils.parsers import extract_impl_report


BASIC_NODE_TYPES = [
    "instr", "port", "array", 
    "const", "block", "region"
]

BASIC_EDGE_TYPES = [
    # Data flow edges
    ("const", "data", "instr"), 
    ("instr", "data", "instr"),
    ("port", "data", "instr"), 
    ("array", "data", "instr"),

    # Edges representing GEP instructions with globals
    ("instr", "data", "const"),
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

    # Hierarchical edges (representing CDFG structure)
    ("region", "hrchy", "region"), 
    ("region", "hrchy", "block"),
    ("region", "hrchy", "instr"),
    ("block", "hrchy", "instr"),
]

TARGET_RESOURCES = ['FF', 'LUT', 'DSP', 'BRAM']
MAX_ARRAY_DIM = 4


MetadataEntry = Dict[str, Union[str, int, float, bool, List[int]]]
MetadataDict = Dict[str, MetadataEntry]

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


class DirectiveNode(Node):
    def __init__(
        self, directive_type: str,
        function_name: Optional[str] = None,
        target_name: Optional[str] = None,
        node_id: Optional[int] = None,
        attrs: Optional[AttributeDict] = None
    ):
        self.id = node_id
        self.directive_type = directive_type
        self.function_name = function_name if function_name else ''
        self.target_name = target_name if target_name else ''
        self.name = f"{directive_type} {self.function_name}/{self.target_name}"
        self.label = self.name

        self.attrs = attrs if attrs else {}

    def as_dict(self):
        return {
            'name': self.name,
            'attributes': self.attrs
        }
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()


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
        array_metadata: MetadataEntry,
        node_name: str,
        node_id: int,
        function_name: str,
        is_top_level: bool,
        direction: Optional[PortDirection] = None,
        resources: Optional[Dict[str, int]] = None
    ):
        self.id = node_id
        self.name = node_name
        self.label = node_name
        self.function_name = function_name

        total_array_size = array_metadata['TotalSize']

        if direction is not None and is_top_level:
            array_impl = [1, 0, 0] # RTL port
        elif total_array_size > 1024:
            array_impl = [0, 1, 0] # BRAM, LUTRAM or URAM
        else:
            array_impl = [0, 0, 1] # Shift register

        if direction is None:
            direction_encoding = [0, 0, 0, 1]
        elif direction == PortDirection.IN:
            direction_encoding = [1, 0, 0, 0]
        elif direction == PortDirection.OUT:
            direction_encoding = [0, 1, 0, 0]
        else:
            direction_encoding = [0, 0, 1, 0]

        dims = array_metadata.get('Dimensions', [])
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
            'num_dims': num_dims,
            'total_size': total_array_size,
            'base_type': array_metadata.get('BaseType', ''),
            'base_bitwidth': array_metadata.get('BaseBitWidth', 0),
            'direction': direction_encoding,
            'array_impl': array_impl,
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
    def __init__(
        self, 
        element: ET.Element, 
        function_name: str, 
        metadata: MetadataDict,
    ):
        self.id = findint(element, 'mId')
        if self.id is None:
            raise ValueError("Element does not contain 'mId' tag")
        self.name = element.findtext('mTag')
        self.label = self.name
        self.function_name = function_name

        self.is_loop = True if findint(element, 'mType', 0) == 1 else False

        metadata_entry = find_in_metadata(
            metadata, 'Loop', self.name, function_name
        )
        if metadata_entry is not None:
            loop_depth = metadata_entry.get('LoopDepth', 0)
        else:
            loop_depth = findint(element, 'mDepth', 0)
            if self.is_loop:
                loop_depth = max(1, loop_depth)
            
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
            'dataflow': 0, 'inline': 0
        }
        self.sub_regions = self._extract_items(element, 'sub_regions')
        self.blocks = self._extract_items(element, 'basic_blocks')
        self.parents = []
        self.instrs = []
        self.arrays = []
    
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
        is_top_level: bool
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
            'top_level': int(is_top_level),
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
        instruction_nodes: List[InstructionNode],
        node_id_map: Dict[int, Tuple[int, str]]
    ):
        super().__init__(element, function_name)

        self.label = self.name
        self.attrs = {resource_type: 0 for resource_type in TARGET_RESOURCES}

        self.instrs = [
            int(instr.text) 
            for instr in element.find('node_objs').findall('item')
        ]
        self.arrays = []
        self.attrs["num_instrs"] = len(self.instrs)
        self._get_instruction_resources(instruction_nodes, node_id_map)
    
    def _get_instruction_resources(self, instruction_nodes, node_id_map):
        instr_dict = {instr.id: instr for instr in instruction_nodes}
        for instr_id in self.instrs:
            instr_id = node_id_map.get(instr_id, (None, None))[0]
            if instr_id is None:
                continue
            instr = instr_dict.get(instr_id)
            if instr is None:
                continue
            for resource_type in TARGET_RESOURCES:
                self.attrs[resource_type] += instr.attrs[resource_type]

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
        top_level_name: str, 
        metadata: MetadataDict,
        resource_dict: Dict[str, Dict[str, int]],
        offsets: Optional[Dict[str, int]] = None,
    ):
        self.nodes = {nt: [] for nt in BASIC_NODE_TYPES}
        self.edges = {et: [] for et in BASIC_EDGE_TYPES}

        self._offsets = offsets if offsets else {nt: 0 for nt in BASIC_NODE_TYPES}
        self._node_id_map = {}

        cdfg = root.find('syndb/cdfg')
        if cdfg is None:
            raise ValueError("CDFG not found in the XML file")
        cdfg_regions = root.find('syndb/cdfg_regions')
        if cdfg_regions is None:
            raise ValueError("CDFG regions not found in the XML file")

        # Extract function information
        self.function_name = cdfg.findtext('name')
        self.ret_bitwidth = findint(cdfg, 'ret_bitwidth')
        self.is_top_level = self.function_name == top_level_name
        self.function_calls = []

        try:
            self._parse_nodes(cdfg, cdfg_regions, resource_dict, metadata)
            self._parse_edges(cdfg)
            self._build_hierarchy_edges()
        except Exception as e:
            print(f"Error parsing CDFG: {e}")
            raise

    def _parse_nodes(self, cdfg, regions, resource_dict, metadata):
        consts = cdfg.find('consts')
        if consts is None:
            raise ValueError("CDFG does not contain 'consts' section")
        self._process_consts(consts)

        # 'nodes' section contains instructions and global variables
        # (represented as instructions with 'GlobalMem' opcode)
        instrs = cdfg.find('nodes')
        if instrs is None:
            raise ValueError("CDFG does not contain 'nodes' section")
        self._process_instrs(instrs, resource_dict, metadata)

        ports = cdfg.find('ports')
        if ports is None:
            raise ValueError("CDFG does not contain 'ports' section")
        self._process_ports(ports, metadata)

        blocks = cdfg.find('blocks')
        if blocks is None:
            raise ValueError("CDFG does not contain 'blocks' section")
        self._process_blocks(blocks)

        self._process_regions(regions, metadata)

    def _process_instrs(self, instrs, resource_dict, metadata):
        self._alloca_instrs = {}
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

            resources = resource_dict.get(rtl_name) if rtl_name else None

            metadata_entry = find_in_metadata(
                metadata, 'Array', node_name, self.function_name
            )
            array_node = None
            if metadata_entry is not None:
                array_id = array_idx + array_offset
                array_idx += 1
                array_node = ArrayNode(
                    metadata_entry, node_name, array_id, metadata_entry.get('FunctionName', ''),
                    self.is_top_level, resources=resources
                )
                self.nodes['array'].append(array_node)

                if opcode == 'GlobalMem':
                    self._node_id_map[node_id] = (array_id, 'array')
                    continue
                        
            instr_node = InstructionNode(
                elem, self.function_name, resources=resources
            )
            self._node_id_map[instr_node.id] = (instr_idx + instr_offset, 'instr')
            instr_node.id = instr_idx + instr_offset
            instr_idx += 1
            self.nodes['instr'].append(instr_node)

            if array_node is not None:
                if opcode == 'alloca':
                    self.edges[('instr', 'alloca', 'array')].append((instr_node.id, array_node.id))
                    self._alloca_instrs[instr_node.id] = array_node.id

    def _process_ports(self, ports, metadata):
        port_offset = self._offsets['port']
        array_offset = self._offsets['array']
        port_idx = 0
        array_idx = len(self.nodes['array'])

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

            metadata_entry = find_in_metadata(
                metadata, 'Array', node_name, self.function_name
            )
            if metadata_entry is not None:
                array_id = array_idx + array_offset
                array_idx += 1
                node = ArrayNode(
                    metadata_entry, node_name, array_id, self.function_name,
                    self.is_top_level, direction=direction
                )
                self._node_id_map[node_id] = (array_id, 'array')
                self.nodes['array'].append(node)
            else:
                node = PortNode(elem, self.function_name, self.is_top_level)
                self._node_id_map[node.id] = (port_idx + port_offset, 'port')
                node.id = port_idx + port_offset
                port_idx += 1
                self.nodes['port'].append(node)

    def _process_consts(self, consts):
        # Constant nodes with type 6 are used to represent 
        # call edges and will be removed later
        offset = self._offsets['const']
        dummy_consts = []

        for elem in consts.findall('item'):
            node = ConstantNode(elem, self.function_name)
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
            node = BlockNode(elem, self.function_name, self.nodes['instr'], self._node_id_map)
            self._node_id_map[node.id] = (i + offset, 'block')
            node.id = i + offset
            instrs = []
            for instr_id in node.instrs:
                node_id, node_type = self._node_id_map.get(instr_id, (None, None))
                if node_id is not None and node_type == 'instr':
                    instrs.append(node_id)
                elif node_type == 'array':
                    node.arrays.append(instr_id)
            node.instrs = instrs
            self.nodes['block'].append(node)

    def _process_regions(self, regions, metadata):
        offset = self._offsets['region']
        for elem in regions.findall('item'):
            node = RegionNode(elem, self.function_name, metadata)
            node.id += offset - 1
            node.sub_regions = [
                sub_region_id + offset - 1
                for sub_region_id in node.sub_regions
            ]
            node.blocks = [
                self._node_id_map[block_id][0] 
                for block_id in node.blocks if block_id in self._node_id_map
            ]
            self.nodes['region'].append(node)

        for i, node in enumerate(self.nodes['region']):
            for sub_region_id in node.sub_regions:
                self.nodes['region'][sub_region_id - offset].parents.append(node.id)

    def _parse_edges(self, cdfg):
        for elem in cdfg.find('edges').findall('item'):
            rel_type = self._map_edge_type(elem.findtext('edge_type', ''))
            if rel_type == '':
                continue

            src = findint(elem, 'source_obj')
            dst = findint(elem, 'sink_obj')
            if src is None or dst is None:
                continue

            src, src_type = self._node_id_map.get(src, (None, None))
            dst, dst_type = self._node_id_map.get(dst, (None, None))
            if src is None or dst is None:
                continue

            edge_type = (src_type, rel_type, dst_type)
            if edge_type not in BASIC_EDGE_TYPES:
                print(f"Skipping edge type: {edge_type}")
                continue

            if edge_type == ('const', 'data', 'instr'):
                src_node = self.nodes[src_type][src - self._offsets[src_type]]
                if src_node.attrs['const_type'] == '6':
                    callee_name = src_node.name
                    self.function_calls.append((dst, callee_name))
                    continue
            elif src_type == "instr" and rel_type == "data":
                src_node = self.nodes[src_type][src - self._offsets[src_type]]
                if src_node.id in self._alloca_instrs:
                    src = self._alloca_instrs[src_node.id]
                    edge_type = ('array', 'data', dst_type)
            

            if edge_type not in self.edges:
                print(f"Unexpected edge type {edge_type} found on ADB file")
                continue

            self.edges[edge_type].append((src, dst))

        # Remove dummy constants (representing call edges)
        for i, node in enumerate(self.nodes['const']):
            if node.attrs['const_type'] == '6':
                del self.nodes['const'][i:]
                break
        
        # Add a (array -> gep) edge for each (array -> const_ptr -> gep) path
        array_ref_edges = self.edges.get(("array", "data", "const"), [])
        for src_array_id, dst_const_id in array_ref_edges:
            for src_const_id, dst_instr_id in self.edges.get(("const", "data", "instr"), []):
                if src_const_id == dst_const_id:
                    dst_instr = self.nodes['instr'][dst_instr_id - self._offsets['instr']]
                    if dst_instr.attrs['opcode'] == 'getelementptr':
                        self.edges[("array", "data", "instr")].append((src_array_id, dst_instr_id))

        # Add a (array -> op) edge for each (array -> gep -> op) path
        for src_array_id, dst_instr_id in self.edges.get(("array", "data", "instr"), []):
            dst_instr = self.nodes['instr'][dst_instr_id - self._offsets['instr']]
            if dst_instr.attrs['opcode'] == 'getelementptr':
                for src_instr_id, next_instr_id in self.edges.get(("instr", "data", "instr"), []):
                    if src_instr_id == dst_instr_id:
                        self.edges[("array", "data", "instr")].append((src_array_id, next_instr_id))

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
                for array_id in block_node.arrays:
                    self.nodes['region'][i].arrays.append(array_id)

    def as_dict(self):
        return {
            'name': self.function_name,
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


class HLSData:
    def __init__(
        self, 
        solution_dir: str, 
        top_level_name: str, 
        metadata_path: str,
        kernel_name: str,
        filtered: bool = False
    ):
        self.top_level_name = top_level_name
        self.kernel_name = kernel_name
        self.nodes = {nt: [] for nt in BASIC_NODE_TYPES}
        self.edges = {et: [] for et in BASIC_EDGE_TYPES}
        self.metrics = {}

        rpt = extract_impl_report(solution_dir, filtered=filtered)
        for category in ['timing', 'utilization', 'power']:
            for key, value in rpt[category].items():
                if key not in self.metrics:
                    self.metrics[key] = value

        self.resource_usage = {
            key: value
            for key, value in rpt['module_data'].items() 
            if key in TARGET_RESOURCES
        }
        self._offsets = {nt: 0 for nt in BASIC_NODE_TYPES}
        self._cdfgs = {}
        self.region_hrchy = {}

        with open(metadata_path, 'r') as f:
            self.metadata = json.load(f)

        try:
            self._process_adb_files(solution_dir, filtered)
            self._include_call_flow()
            self._build_region_hrchy()
        except Exception as e:
            print(f"Error processing ADB files: {e}")
            raise

    def _process_adb_files(self, solution_dir, filtered):
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
                root, self.top_level_name, self.metadata,
                self.resource_usage, offsets=self._offsets
            )
            self._cdfgs[cdfg.function_name] = cdfg
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
        for i, node in enumerate(self.nodes['region']):
            regions_above = set()
            regions_below = set()
            blocks = set(node.blocks)
            instrs = set(node.instrs)
            arrays = set(node.arrays)

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
                    arrays.update(child_node.arrays)
                    children.update(child_node.sub_regions)

            self.region_hrchy[node.id] = {
                'above': regions_above,
                'below': regions_below,
                'blocks': blocks,
                'instrs': instrs,
                'arrays': arrays
            }

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

    def dump(self, filepath):
        with open(filepath, 'w') as f:
            json.dump(self.as_dict(), f, indent=2)
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()
    

def find_in_metadata(
    metadata: MetadataDict,
    entity_type: str,
    node_name: str,
    function_name: str
) -> Optional[MetadataEntry]:
    if entity_type not in metadata:
        return None
    for entry in metadata[entity_type]:
        if entry['Name'] == node_name:
            entry_function_name = entry.get('FunctionName', '')
            if (entry_function_name == '' or entry_function_name is None
                or entry_function_name == function_name):
                return entry
    return None


def collect_adb_files(solution_dir, filtered=False):
    if filtered:
        hls_db_dir = os.path.join(solution_dir, "IRs")
    else:
        hls_db_dir = os.path.join(solution_dir, ".autopilot/db")

    if not os.path.exists(hls_db_dir):
        raise FileNotFoundError(f"Directory {hls_db_dir} not found")

    file_paths = []
    for file_name in os.listdir(hls_db_dir):
        if file_name.endswith(".adb"):
            if ".bind" in file_name or ".sched" in file_name:
                continue
            print(f"Found file: {file_name}")
            file_paths.append(os.path.join(hls_db_dir, file_name))

    return file_paths


def parse_adb(
    solution_dir: str, 
    top_level_name: str,
    metadata_path: str,
    kernel_name: str,
    filtered: bool = False,
    output_path: str = None
) -> HLSData:
    hls_data = HLSData(
        solution_dir, top_level_name, metadata_path,
        kernel_name, filtered=filtered,
    )
    if output_path:
        hls_data.dump(output_path)
    else:
        print(hls_data)
    return hls_data