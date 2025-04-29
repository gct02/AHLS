import os
import json
import xml.etree.ElementTree as ET
from collections import defaultdict
from typing import Optional, Dict

from gnn.data.utils.xml_utils import findint, findfloat
from gnn.data.utils.parsers import extract_impl_report


TARGET_RESOURCES = ['FF', 'LUT', 'DSP', 'BRAM']


class BaseNode:
    def __init__(self, element: ET.Element, is_region: bool = False):
        if is_region:
            self.id = findint(element, 'mId')
            if self.id is None:
                raise ValueError("Element does not contain 'mId' tag")
            self.name = element.findtext('mTag')
            self.rtl_name = None
        else:
            value = element.find('Value')
            obj = element.find('Obj') if value is None else value.find('Obj')
            if obj is None:
                raise ValueError("Element does not contain 'Obj' or 'Value/Obj' tag")
            
            self.id = findint(obj, 'id')
            if self.id is None:
                raise ValueError("Element does not contain 'id' tag")
            self.name = obj.findtext('name')
            self.rtl_name = obj.findtext('rtlName')

        self.attrs = {}
    
    def as_dict(self):
        return {
            'id': self.id, 
            'name': self.name, 
            'rtl_name': self.rtl_name, 
            'attrs': self.attrs
        }
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()


class PortNode(BaseNode):
    def __init__(self, element: ET.Element):
        super().__init__(element)

        self.label = self.name

        # 0: input, 1: output, 2: bidirectional
        direction = findint(element, 'direction', 2)
        if direction == 0:
            direction = [0, 1]
        elif direction == 1:
            direction = [1, 0]
        else:
            direction = [1, 1]

        self.attrs.update({
            'direction': direction,
            'bitwidth': findint(element, 'Value/bitwidth', 0),
            'port_type': element.findtext('port_type', ''),
            'array_size': findint(element, 'array_size', 0),

            # Placeholders for array partitioning attributes
            'array_partition': 0,
            'partition_type': [0, 0, 0],
            'partition_dim': [0, 0, 0, 0],
            'partition_factor': 0
        })


class InstructionNode(BaseNode):
    def __init__(
        self, element: ET.Element, 
        resource_usage_dict: Dict[str, Dict[str, int]],
    ):
        super().__init__(element)

        opcode = element.findtext('opcode', '')
        self.label = opcode

        node_resources = resource_usage_dict.get(self.rtl_name, {})
        for resource_type in TARGET_RESOURCES:
            self.attrs[resource_type] = node_resources.get(resource_type, 0)

        self.attrs.update({
            'opcode': opcode,
            'impl': element.findtext('Value/Obj/coreName', ''),
            'array_size': findint(element, 'Value/Obj/storageDepth', 0),
            'bitwidth': findint(element, 'Value/bitwidth', 0),
            'delay': findfloat(element, 'm_delay', 0.0),

            # Placeholders for array partitioning attributes
            'array_partition': 0,
            'partition_type': [0, 0, 0],
            'partition_dim': [0, 0, 0, 0],
            'partition_factor': 0
        })

        self.operand_edges = [
            int(edge.text) 
            for edge in element.find('oprand_edges').findall('item')
        ]


class ConstantNode(BaseNode):
    def __init__(self, element: ET.Element):
        super().__init__(element)

        self.label = element.findtext('content', '')

        self.attrs.update({
            'bitwidth': findint(element, 'Value/bitwidth', 0),
            'const_type': element.findtext('const_type', ''),
        })


class BlockNode(BaseNode):
    def __init__(self, element: ET.Element):
        super().__init__(element)

        self.label = self.name

        self.instrs = [
            int(instr.text) 
            for instr in element.find('node_objs').findall('item')
        ]


class RegionNode(BaseNode):
    def __init__(self, element: ET.Element):
        super().__init__(element, is_region=True)

        self.label = self.name

        self.is_loop = True if findint(element, 'mType', 0) == 1 else False
        self.attrs = self._extract_attrs(element)

        self.sub_regions = self._extract_items(element, 'sub_regions')
        self.blocks = self._extract_items(element, 'basic_blocks')

        self.instrs = [] # Placeholder for instructions

    def _extract_attrs(self, element):
        min_lat = max(1, findint(element, 'mMinLatency', 0))
        max_lat = max(min_lat, findint(element, 'mMaxLatency', 0))
        min_tc = max(1, findint(element, 'mMinTripCount', 0))
        max_tc = max(min_tc, findint(element, 'mMaxTripCount', 0))
        if (ii := findint(element, 'mII', 0)) <= 0:
            ii = max(1, max_lat / max_tc)

        return {
            'min_latency': min_lat, 'max_latency': max_lat, 'ii': ii,
            'min_trip_count': min_tc, 'max_trip_count': max_tc,

            # Placeholders for region-level directives attributes
            'loop_merge': 0, 'loop_flatten': 0, 'pipeline': 0, 
            'unroll': 0, 'unroll_factor': 0, 'pipeline_off': 0, 
            'loop_flatten_off': 0
        }
    
    def _extract_items(self, element, tag):
        return [
            int(item.text) 
            for item in element.find(tag).findall('item')
        ]
    
    def as_dict(self):
        return {
            'id': self.id, 
            'name': self.name, 
            'attrs': self.attrs,
            'sub_regions': self.sub_regions,
            'instrs': self.instrs
        }
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return self.__str__()


class CDFG:
    def __init__(
        self, root: ET.Element, 
        resource_usage_dict: Dict[str, Dict[str, int]],
        offsets: Optional[Dict[str, int]] = None,
        remove_blocks: bool = True
    ):
        self.nodes = defaultdict(list)
        self.edges = defaultdict(list)

        self._offsets = offsets if offsets else defaultdict(int)
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

        self.function_calls = []

        try:
            self._parse_nodes(cdfg, cdfg_regions, resource_usage_dict)
            self._parse_edges(cdfg)
            self._build_hierarchy_edges()
        except Exception as e:
            print(f"Error parsing CDFG: {e}")
            raise

        if remove_blocks:
            self._remove_blocks()

    def _parse_nodes(self, cdfg, cdfg_regions, resource_usage_dict):
        consts = cdfg.find('consts')
        if consts is None:
            raise ValueError("CDFG does not contain 'consts' section")
        self._process_constants(consts)

        # 'nodes' section contains instructions and global variables
        # (represented as instructions with 'GlobalMem' opcode)
        instrs = cdfg.find('nodes')
        if instrs is None:
            raise ValueError("CDFG does not contain 'nodes' section")
        self._process_node_type(
            instrs, 'instr', InstructionNode, resource_usage_dict
        )

        ports = cdfg.find('ports')
        if ports is None:
            raise ValueError("CDFG does not contain 'ports' section")
        self._process_node_type(ports, 'port', PortNode)

        blocks = cdfg.find('blocks')
        if blocks is None:
            raise ValueError("CDFG does not contain 'blocks' section")
        self._process_blocks(blocks)

        self._process_regions(cdfg_regions)

    def _process_constants(self, consts):
        # Constant nodes with type 6 are used to represent 
        # call edges and will be removed later
        dummy_consts = []
        for elem in consts.findall('item'):
            node = ConstantNode(elem)
            if node.attrs['const_type'] == '6':
                dummy_consts.append(node)
            else:
                self.nodes['const'].append(node)
        self.nodes['const'].extend(dummy_consts)
        self._map_node_ids('const')

    def _process_node_type(
        self, section, node_type, node_class, 
        resource_usage_dict=None
    ):
        offset = self._offsets[node_type]
        for i, elem in enumerate(section.findall('item')):
            if resource_usage_dict is not None:
                node = node_class(elem, resource_usage_dict)
            else:
                node = node_class(elem)
            self._node_id_map[node.id] = (i + offset, node_type)
            node.id = i + offset
            self.nodes[node_type].append(node)

    def _process_blocks(self, blocks):
        offset = self._offsets['block']
        for i, elem in enumerate(blocks.findall('item')):
            node = BlockNode(elem)
            self._node_id_map[node.id] = (i + offset, 'block')
            node.id = i + offset
            node.instrs = [self._node_id_map[i][0] for i in node.instrs]
            self.nodes['block'].append(node)

    def _process_regions(self, regions):
        offset = self._offsets['region']
        for elem in regions.findall('item'):
            node = RegionNode(elem)
            node.id += offset
            node.sub_regions = [
                sub_region_id + offset 
                for sub_region_id in node.sub_regions
            ]
            node.blocks = [
                self._node_id_map[block_id][0] 
                for block_id in node.blocks
            ]
            self.nodes['region'].append(node)

    def _map_node_ids(self, node_types):
        offset = self._offsets[node_types]
        for i, node in enumerate(self.nodes[node_types]):
            self._node_id_map[node.id] = (i + offset, node_types)
            self.nodes[node_types][i].id = i + offset

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
            if edge_type == ('const', 'data', 'instr'):
                src_node = self.nodes[src_type][src - self._offsets[src_type]]
                if src_node.attrs['const_type'] == '6':
                    callee_name = src_node.name
                    self.function_calls.append((dst, callee_name))
                    continue

            self.edges[edge_type].append((src, dst))

        # Remove dummy constant edges (representing call edges)
        for i, node in enumerate(self.nodes['const']):
            if node.attrs['const_type'] == '6':
                del self.nodes['const'][i:]

    def _map_edge_type(self, edge_type):
        return {'1': 'data', '2': 'control', '4': 'mem'}.get(edge_type, '')

    def _build_hierarchy_edges(self):
        for i, region in enumerate(self.nodes['region']):
            for sub_region_id in region.sub_regions:
                self.edges[('region', 'hrchy', 'region')].append((region.id, sub_region_id))
            for block_id in region.blocks:
                for instr_id in self.nodes['block'][block_id - self._offsets['block']].instrs:
                    self.nodes['region'][i].instrs.append(instr_id)
                    self.edges[('region', 'hrchy', 'instr')].append((region.id, instr_id))

    def _remove_blocks(self):
        block_region_map = {}
        for region in self.nodes['region']:
            for block_id in region.blocks:
                block_region_map[block_id] = region.id

        # Map blocks that are not in any region to the top-level region
        top_level_region = self.nodes['region'][0].id
        for block in self.nodes['block']:
            if block.id not in block_region_map:
                block_region_map[block.id] = top_level_region
                for instr_id in block.instrs:
                    self.nodes['region'][0].instrs.append(instr_id)
                    self.edges[('region', 'hrchy', 'instr')].append((top_level_region, instr_id))

        for src, dst in self.edges[('block', 'control', 'block')]:
            src_region = block_region_map.get(src)
            dst_region = block_region_map.get(dst)
            if src_region is not None and dst_region is not None:
                self.edges[('region', 'control', 'region')].append((src_region, dst_region))
        
        for src, dst in self.edges[('block', 'control', 'instr')]:
            src_region = block_region_map.get(src)
            if src_region is not None:
                self.edges[('region', 'control', 'instr')].append((src_region, dst))

        self.edges = {
            et: edges for et, edges in self.edges.items()
            if et[0] != 'block' and et[2] != 'block'
        }
        del self.nodes['block']
    

class FSMState:
    def __init__(self, element: ET.Element):
        self.id  = findint(element, "id")
        self.operations = self._extract_operations(element)

    @property
    def name(self):
        return f"state_{self.id}"

    def _extract_operations(self, element):
        return [
            {
                "id": findint(op, "id"), 
                "stage": findint(op, "stage"), 
                "latency": findint(op, "latency")
            }
            for op in element.find('operations').findall('item')
        ]


class FSM:
    def __init__(self, root: ET.Element):
        self.states = self._extract_states(root)
        self.transitions = self._extract_transitions(root)
    
    def _extract_states(self, element):
        return [
            FSMState(state)
            for state in element.find('states').findall('item')
        ]
    
    def _extract_transitions(self, element):
        transitions = []
        for transition in element.find('transitions').findall('item'):
            src = findint(transition, 'inState')
            dst = findint(transition, 'outState')
            if src is None or dst is None:
                continue
            transitions.append((src, dst))
        return transitions


class HLSData:
    def __init__(
        self, solution_dir: str, 
        filtered: bool = False, 
        kernel_name: Optional[str] = None
    ):
        self.kernel_name = kernel_name
        self.nodes = defaultdict(list)
        self.edges = defaultdict(list)
        self.metrics = {}

        rpt = extract_impl_report(solution_dir, filtered=filtered)
        self.metrics = {}
        for category in ['timing', 'utilization', 'power']:
            for key, value in rpt[category].items():
                if key not in self.metrics:
                    self.metrics[key] = value

        self.resource_usage = {
            key: value
            for key, value in rpt['module_data'].items() if key in TARGET_RESOURCES
        }

        self._offsets = {
            'instr': 0, 'const': 0, 'port': 0, 
            'block': 0, 'region': -1
        }
        self._cdfgs = {}

        try:
            self._process_adb_files(solution_dir, filtered)
            self._include_call_flow()
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
            cdfg = CDFG(root, self.resource_usage, offsets=self._offsets)
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
    solution_dir, 
    filtered=False,
    kernel_name=None,
    output_path=None
):
    hls_data = HLSData(solution_dir, filtered=filtered, kernel_name=kernel_name)
    if output_path:
        hls_data.dump(output_path)
    else:
        print(hls_data)
    return hls_data