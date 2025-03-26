import xml.etree.ElementTree as ET
import re
import os
from typing import Optional, Dict

try:
    from utils.xmlutils import findint, findfloat
except ImportError:
    print("ImportError: Please make sure you have the required packages in your PYTHONPATH")
    pass


RESOURCES_CONSIDERED = {'FF', 'LUT', 'DSP', 'BRAM'}


ResourceMapper = Dict[str, Dict[str, int]]


class BaseNode:
    def __init__(
        self, node: ET.Element, 
        rtl_resources: Optional[ResourceMapper] = None
    ):
        value = node.find('Value')
        obj = node.find('Obj') if value is None else value.find('Obj')

        self.id = findint(obj, 'id')
        self.type = findint(obj, 'type')
        self.name = obj.findtext('name')
        self.rtl_name = obj.findtext('rtlName')

        self.resources = None
        if rtl_resources is not None:
            self._assign_resources(rtl_resources)

    def _assign_resources(self, rtl_resources):
        if (self.rtl_name is not None 
            and self.rtl_name in rtl_resources):
            self.resources = rtl_resources[self.rtl_name]
        else:
            self.resources = {res: 0 for res in RESOURCES_CONSIDERED}


class PortNode(BaseNode):
    def __init__(self, node: ET.Element):
        super().__init__(node)

        self.bitwidth = findint(node, 'Value/bitwidth')
        self.direction = findint(node, 'direction') 
        self.port_type = findint(node, 'if_type') 
        self.array_size = findint(node, 'array_size')


class InstructionNode(BaseNode):
    def __init__(
        self, node: ET.Element, 
        rtl_resources: Optional[ResourceMapper] = None
    ):
        super().__init__(node, rtl_resources)

        self.core = node.findtext('Value/Obj/coreName') 
        self.is_storage = findint(node, 'Value/Obj/isStorage')
        self.storage_depth = findint(node, 'Value/Obj/storageDepth')
        self.bitwidth = findint(node, 'Value/bitwidth')
        self.opcode = node.findtext('opcode') 
        self.is_on_critical_path = findint(node, 'm_isOnCriticalPath')
        self.delay = findfloat(node, 'm_delay')

        self.operand_edges = []
        for edge in node.find('oprand_edges').findall('item'):
            self.operand_edges.append(int(edge.text))


class ConstantNode(BaseNode):
    def __init__(self, node: ET.Element):
        super().__init__(node)

        self.bitwidth = findint(node, 'Value/bitwidth')
        self.const_type = findint(node, 'const_type') 
        self.const_value = node.findtext('content')


class BlockNode(BaseNode):
    def __init__(
        self, node: ET.Element, 
        rtl_resources: Optional[ResourceMapper] = None
    ):
        super().__init__(node, rtl_resources)

        self.instrs = []
        for instr in node.find('node_objs').findall('item'):
            self.instrs.append(int(instr.text))


class Edge:
    def __init__(self, edge: ET.Element):
        self.id = findint(edge, 'id')
        self.type = edge.findtext('edge_type')
        self.src = findint(edge, 'source_obj')
        self.dst = findint(edge, 'sink_obj')
        self.is_backedge = findint(edge, 'is_back_edge')


class CDFGRegion:
    def __init__(self, region: ET.Element):
        self.id = findint(region, 'mId')
        self.name = region.findtext('mTag')
        self.region_type = findint(region, 'mType')
        self.ii = findint(region, 'mII')
        self.depth = findint(region, 'mDepth')
        self.min_trip_count = findint(region, 'mMinTripCount')
        self.max_trip_count = findint(region, 'mMaxTripCount')
        self.min_latency = findint(region, 'mMinLatency')
        self.max_latency = findint(region, 'mMaxLatency')
        
        # Attributes for optimization directives
        self.pipeline = 0
        self.unroll = 0
        self.loop_flatten = 0
        self.loop_merge = 0
        self.unroll_factor = 0

        self.sub_regions = []
        for sub_region in region.find('sub_regions').findall('item'):
            self.sub_regions.append(int(sub_region.text))

        self.blocks = []
        for block in region.find('basic_blocks').findall('item'):
            self.blocks.append(int(block.text))


class CDFG:
    def __init__(
        self, root: ET.Element, 
        include_rtl_resources=True
    ):
        cdfg = root.find('syndb/cdfg')
        self.name = cdfg.findtext('name')
        self.ret_bitwidth = findint(cdfg, 'ret_bitwidth')

        if include_rtl_resources:
            rtl_resources = self._get_rtl_resources(root)
        else:
            rtl_resources = None

        self.instr_nodes = {}
        for instr in cdfg.find('nodes').findall('item'):
            instr_node = InstructionNode(instr, rtl_resources)
            self.instr_nodes[instr_node.id] = instr_node

        self.block_nodes = {}
        for block in cdfg.find('blocks').findall('item'):
            block_node = BlockNode(block, rtl_resources)
            self.block_nodes[block_node.id] = block_node

        self.const_nodes = {}
        for const in cdfg.find('consts').findall('item'):
            const_node = ConstantNode(const)
            self.const_nodes[const_node.id] = const_node

        self.port_nodes = {}
        for port in cdfg.find('ports').findall('item'):
            port_node = PortNode(port)
            self.port_nodes[port_node.id] = port_node

        self.edges = {}
        for edge in cdfg.find('edges').findall('item'):
            edge = Edge(edge)
            self.edges[edge.id] = edge

        self._build_region_nodes(root)
        self._build_region_edges()

    def _get_rtl_resources(self, root):
        res_items = root.findall('*/res/*/item')
        rx = re.compile(' \(.*\)')
        node_res_map = {}

        for item in res_items:
            rtl_name = re.sub(rx, '', item.find('first').text).strip()
            if rtl_name in node_res_map:
                continue

            rtl_resources = item.find('second')
            if rtl_resources is None:
                continue

            res_map = {res: 0 for res in RESOURCES_CONSIDERED}
            for res in rtl_resources.iter('item'):
                res_name = res.findtext('first')
                if res_name not in RESOURCES_CONSIDERED:
                    continue

                res_count = findint(res, 'second')
                res_map[res_name] = res_count

            node_res_map[rtl_name] = res_map
            
        return node_res_map
    
    def _build_region_nodes(self, root):
        cdfg_regions = root.find('syndb/cdfg_regions')
        self.region_nodes = {}
        max_node_id = max(
            max(self.instr_nodes.keys()),
            max(self.const_nodes.keys()),
            max(self.port_nodes.keys()),
            max(self.block_nodes.keys())
        )
        for region in cdfg_regions.findall('item'):
            region_node = CDFGRegion(region)
            region_node.id += max_node_id
            for i in range(len(region_node.sub_regions)):
                region_node.sub_regions[i] += max_node_id
            self.region_nodes[region_node.id] = region_node
    
    def _build_region_edges(self):
        self.region_edges = {
            ("region", "hierarchy", "region"): [],
            ("region", "hierarchy", "block"): [],
            ("region", "hierarchy", "instr"): [],
            ("block", "hierarchy", "instr"): []
        }
        for reg in self.region_nodes.values():
            for rid in reg.sub_regions:
                self.region_edges[("region", "hierarchy", "region")].append((reg.id, rid))
            for bid in reg.blocks:
                self.region_edges[("region", "hierarchy", "block")].append((reg.id, bid))
                block = self.block_nodes[bid]
                for iid in block.instrs:
                    self.region_edges[("region", "hierarchy", "instr")].append((reg.id, iid))
                    self.region_edges[("block", "hierarchy", "instr")].append((bid, iid))


class FSMStateOperation:
    def __init__(self, op: ET.Element):
        self.id = findint(op, 'id')
        self.stage = findint(op, 'stage')
        self.latency = findint(op, 'latency')


class FSMState:
    def __init__(self, state: ET.Element):
        self.id = findint(state, 'id')
        self.operations = []
        for op in state.find('operations').findall('item'):
            op = FSMStateOperation(op)
            self.operations.append(op)


class FSMTransition:
    def __init__(self, transition: ET.Element):
        self.src = findint(transition, 'inState')
        self.dst = findint(transition, 'outState')


class FSM:
    def __init__(self, root: ET.Element):
        fsm = root.find('syndb/fsm')
        self.states = {}
        for state in fsm.find('states').findall('item'):
            state = FSMState(state)
            self.states[state.id] = state

        self.transitions = []
        for transition in fsm.find('transitions').findall('item'):
            transition = FSMTransition(transition)
            self.transitions.append(transition)


class HLSFunctionData:
    def __init__(self, file_path: str):
        tree = ET.parse(file_path)
        root = tree.getroot()

        self.cdfg = CDFG(root)
        self.fsm = FSM(root)

        self.name = self.cdfg.name
        self.ret_bitwidth = self.cdfg.ret_bitwidth

    def reindex_cdfg(self, offset):        
        def adjust_node_ids(nodes):
            adjusted_nodes = {}
            for node in nodes.values():
                node.id += offset
                adjusted_nodes[node.id] = node
            return adjusted_nodes

        self.cdfg.instr_nodes = adjust_node_ids(self.cdfg.instr_nodes)
        self.cdfg.const_nodes = adjust_node_ids(self.cdfg.const_nodes)
        self.cdfg.port_nodes = adjust_node_ids(self.cdfg.port_nodes)

        adjusted_block_nodes = {}
        for block in self.cdfg.block_nodes.values():
            block.id += offset
            for i in range(len(block.instrs)):
                block.instrs[i] += offset
            adjusted_block_nodes[block.id] = block
        self.cdfg.block_nodes = adjusted_block_nodes

        adjusted_region_nodes = {}
        for region in self.cdfg.region_nodes.values():
            region.id += offset
            for i in range(len(region.sub_regions)):
                region.sub_regions[i] += offset
            for i in range(len(region.blocks)):
                region.blocks[i] += offset
            adjusted_region_nodes[region.id] = region
        self.cdfg.region_nodes = adjusted_region_nodes

        for edge in self.cdfg.edges.values():
            edge.src += offset
            edge.dst += offset

        for edge in self.cdfg.region_edges.values():
            for i in range(len(edge)):
                edge[i] = (edge[i][0] + offset, edge[i][1] + offset)

    def reindex_fsm(self, base_index):
        adjusted_states = {}
        for state in self.fsm.states.values():
            state.id += base_index
            for i in range(len(state.operations)):
                state.operations[i].id += base_index
            adjusted_states[state.id] = state
        self.fsm.states = adjusted_states

        for i in range(len(self.fsm.transitions)):
            self.fsm.transitions[i].src += base_index
            self.fsm.transitions[i].dst += base_index

    def reindex(self, base_index_cdfg, base_index_fsm):
        self.reindex_cdfg(base_index_cdfg)
        self.reindex_fsm(base_index_fsm)

    def get_max_node_id(self):
        return max(self.cdfg.region_nodes.keys())
        
    def get_max_state_id(self):
        return max(self.fsm.states.keys())


class HLSData:
    def __init__(self, solution_dir, filtered=False, name=''):
        self.name = name
        self.function_data = {}

        file_paths = collect_adb_files(solution_dir, filtered)
        max_node_id, max_state_id = -1, -1

        for path in file_paths:
            print(f"Processing file: {path}")
            func_data = HLSFunctionData(path)

            # The reindexing of the first iteration is done to make the minimum
            # node (and state) id 0. The reindexing of the subsequent iterations
            # are done to ensure that the node ids are unique across all functions
            func_data.reindex(max_node_id, max_state_id)
            max_node_id = func_data.get_max_node_id()
            max_state_id = func_data.get_max_state_id()

            self.function_data[func_data.name] = func_data

        self._build_call_edges()

    def _build_call_edges(self):
        self.call_edges = []
        for caller_data in self.function_data.values():
            cdfg = caller_data.cdfg
            for instr in cdfg.instr_nodes.values():
                if instr.opcode != "call":
                    continue
                # The name of the called function is stored in 
                # the source node of the first operand edge
                op1 = instr.operand_edges[0]
                callee_name = cdfg.const_nodes[cdfg.edges[op1].src].name
                callee_instrs = self.function_data[callee_name].cdfg.instr_nodes
                callee_first_instr = next(iter(callee_instrs.values()))

                self.call_edges.append((instr.id, callee_first_instr.id))


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


if __name__ == "__main__":
    """For testing purposes"""
    import sys
    from pathlib import Path
    from sys import argv

    if __package__ is None:                  
        DIR = Path(__file__).resolve().parent
        sys.path.insert(0, str(DIR.parent))
        sys.path.insert(0, str(DIR.parent.parent))
        __package__ = DIR.name

    from utils.xmlutils import findint, findfloat

    hlsdata = HLSData(argv[1])
    print(hlsdata.call_edges)