import xml.etree.ElementTree as ET
import re
import os
import json
from collections import defaultdict
from typing import Optional, Dict

try:
    from utils.xmlutils import findint, findfloat
    from utils.parsers import extract_impl_report
except ImportError:
    print("ImportError: Please make sure you have the required packages in your PYTHONPATH")
    pass


RESOURCES_CONSIDERED = {'FF', 'LUT', 'DSP', 'BRAM'}


ResourceMapper = Dict[str, Dict[str, int]]


class BaseNode:
    def __init__(self, element: ET.Element):
        self.id, self.name, self.rtl_name = self._extract_basic_info(element)
        self.attrs = {}

    def _extract_basic_info(self, element):
        value = element.find('Value')
        obj = element.find('Obj') if value is None else value.find('Obj')
        return findint(obj, 'id'), obj.findtext('name'), obj.findtext('rtlName')
    
    def __str__(self):
        data_dict = {
            'id': self.id, 
            'name': self.name, 
            'rtl_name': self.rtl_name, 
            'attrs': self.attrs
        }
        return json.dumps(data_dict, indent=2)
    
    def __repr__(self):
        return self.__str__()


class PortNode(BaseNode):
    def __init__(self, element: ET.Element):
        super().__init__(element)

        direction = findint(element, 'direction', 2)
        if direction == 0:
            direction = [0, 1]
        elif direction == 1:
            direction = [1, 0]
        else:
            direction = [1, 1]

        self.attrs.update({
            'bitwidth': findint(element, 'Value/bitwidth', 0),
            'port_type': element.findtext('port_type', ''),
            'size': findint(element, 'array_size', 0),
            'direction': direction,
            'array_partition': 0,
            'partition_type': [0, 0, 0],
            'partition_dim': [0, 0, 0, 0],
            'partition_factor': 0
        })


class InstructionNode(BaseNode):
    def __init__(
        self, 
        element: ET.Element, 
        ground_truth_resources: Optional[ResourceMapper] = None,
        estimated_resources: Optional[ResourceMapper] = None
    ):
        super().__init__(element)

        if ground_truth_resources is not None:
            resources = ground_truth_resources.get(self.rtl_name, {})
            for res in RESOURCES_CONSIDERED:
                self.attrs["ground_truth_" + res] = resources.get(res, 0)

        if estimated_resources is not None:
            resources = estimated_resources.get(self.rtl_name, {})
            for res in RESOURCES_CONSIDERED:
                self.attrs["estimated_" + res] = resources.get(res, 0)

        self.attrs.update({
            'impl': element.findtext('Value/Obj/coreName', ''),
            'size': findint(element, 'Value/Obj/storageDepth', 0),
            'bitwidth': findint(element, 'Value/bitwidth', 0),
            'opcode': element.findtext('opcode', ''),
            'delay': findfloat(element, 'm_delay', 0.0),
            'array_partition': 0,
            'partition_type': [0, 0, 0],
            'partition_dim': [0, 0, 0, 0],
            'partition_factor': 0
        })
        self.operand_edges = self._extract_operand_edges(element)

    def _extract_operand_edges(self, element):
        return [
            int(edge.text) 
            for edge in element.find('oprand_edges').findall('item')
        ]


class ConstantNode(BaseNode):
    def __init__(self, element: ET.Element):
        super().__init__(element)
        self.attrs.update({
            'bitwidth': findint(element, 'Value/bitwidth', 0),
            'const_type': element.findtext('const_type', ''),
        })


class BlockNode(BaseNode):
    def __init__(self, element: ET.Element):
        super().__init__(element)
        self.instrs = self._extract_instructions(element)

    def _extract_instructions(self, element):
        return [
            int(instr.text) 
            for instr in element.find('node_objs').findall('item')
        ]


class RegionNode:
    def __init__(self, element: ET.Element):
        self.id = findint(element, 'mId') - 1
        self.name = element.findtext('mTag')
        self.attrs = self._extract_attrs(element)
        self.sub_regions = self._extract_items(element, 'sub_regions', -1)
        self.blocks = self._extract_items(element, 'basic_blocks')

    def _extract_attrs(self, element):
        is_loop = findint(element, 'mType', 0)
        min_lat = max(1, findint(element, 'mMinLatency', 0))
        max_lat = max(min_lat, findint(element, 'mMaxLatency', 0))
        if is_loop == 1:
            min_tc = max(1, findint(element, 'mMinTripCount', 0))
            max_tc = max(min_tc, findint(element, 'mMaxTripCount', 0))
            depth = max(1, findint(element, 'mDepth', 0))
        else:
            min_tc = max_tc = 0
            depth = max(0, findint(element, 'mDepth', 0))

        return {
            'is_loop': is_loop, 'depth': depth, 'min_latency': min_lat, 
            'max_latency': max_lat, 'min_trip_count': min_tc, 
            'max_trip_count': max_tc, 'pipeline': 0, 'loop_merge': 0, 
            'loop_flatten': 0, 'unroll': 0, 'unroll_factor': 0
        }
    
    def _extract_items(self, element, tag, offset=0):
        return [
            int(item.text) + offset 
            for item in element.find(tag).findall('item')
        ]
    
    def __str__(self):
        data_dict = {
            'id': self.id, 
            'name': self.name, 
            'attrs': self.attrs
        }
        return json.dumps(data_dict, indent=2)
    
    def __repr__(self):
        return self.__str__()


class CDFG:
    def __init__(
        self, 
        root: ET.Element, 
        offsets: Optional[Dict[str, int]] = None,
        ground_truth_resources: Optional[ResourceMapper] = None
    ):
        self.nodes = defaultdict(list)
        self.edges = defaultdict(list)
        self._offsets = offsets if offsets else defaultdict(int)
        self._node_id_map = {}

        cdfg = root.find('syndb/cdfg')
        self.function_name = cdfg.findtext('name')
        self.ret_bitwidth = findint(cdfg, 'ret_bitwidth')
        
        if ground_truth_resources is None:
            self._ground_truth_resources = {}
        else:
            self._ground_truth_resources = ground_truth_resources

        self._estimated_resources = self._get_estimated_resources(root)

        self._parse_nodes(cdfg, root)
        self._parse_edges(cdfg)
        self._build_hierarchy_edges()

        self._prune_blocks()

    def _parse_nodes(self, cdfg, root):
        self._process_constants(cdfg.find('consts'))
        self._process_node_type(
            cdfg.find('nodes'), 'instr', InstructionNode, 
            self._ground_truth_resources, self._estimated_resources
        )
        self._process_node_type(cdfg.find('ports'), 'port', PortNode)
        self._process_blocks(cdfg.find('blocks'))
        self._process_regions(root.find('syndb/cdfg_regions'))

    def _process_constants(self, consts):
        dummy_consts = []
        # Constant nodes with type 6 are used to represent 
        # call edges and will be removed later
        for elem in consts.findall('item'):
            node = ConstantNode(elem)
            if node.attrs['const_type'] == '6':
                dummy_consts.append(node)
            else:
                self.nodes['const'].append(node)
        self.nodes['const'].extend(dummy_consts)
        self._map_node_ids('const')

    def _process_node_type(
            self, section, ntype, node_class, 
            ground_truth_resources=None, estimated_resources=None
        ):
        offset = self._offsets[ntype]
        for i, elem in enumerate(section.findall('item')):
            if (ground_truth_resources is not None
                or estimated_resources is not None):
                node = node_class(
                    elem, ground_truth_resources, estimated_resources
                )
            else:
                node = node_class(elem)
            self._node_id_map[node.id] = (i + offset, ntype)
            node.id = i + offset
            self.nodes[ntype].append(node)

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
            node.sub_regions = [sr + offset for sr in node.sub_regions]
            node.blocks = [self._node_id_map[b][0] for b in node.blocks]
            self.nodes['region'].append(node)

    def _map_node_ids(self, ntype):
        offset = self._offsets[ntype]
        for i, node in enumerate(self.nodes[ntype]):
            self._node_id_map[node.id] = (i + offset, ntype)
            self.nodes[ntype][i].id = i + offset

    def _parse_edges(self, cdfg):
        edge_id_map = {}
        indices = 0
        const_etype = ('const', 'data', 'instr')

        for elem in cdfg.find('edges').findall('item'):
            etype = self._map_edge_type(elem.findtext('edge_type', ''))
            if etype == '':
                continue
            src = findint(elem, 'source_obj')
            dst = findint(elem, 'sink_obj')
            if src is None or dst is None:
                continue
            src, stype = self._node_id_map.get(src, (None, None))
            dst, dtype = self._node_id_map.get(dst, (None, None))
            if src is None or dst is None:
                continue
            etype = (stype, etype, dtype)
            self.edges[etype].append((src, dst))

            if etype == const_etype:
                edge_id_map[findint(elem, 'id')] = indices
                indices += 1

        for i, instr in enumerate(self.nodes['instr']):
            filtered_edges = []
            for old_id in instr.operand_edges:
                new_id = edge_id_map.get(old_id)
                if new_id is None:
                    continue
                filtered_edges.append(self.edges[const_etype][new_id])
            self.nodes['instr'][i].operand_edges = filtered_edges

    def _map_edge_type(self, etype):
        return {'1': 'data', '2': 'control', '4': 'mem'}.get(etype, '')

    def _build_hierarchy_edges(self):
        for region in self.nodes['region']:
            for sri in region.sub_regions:
                self.edges[('region', 'hrchy', 'region')].append((region.id, sri))
            for bi in region.blocks:
                for ii in self.nodes['block'][bi - self._offsets['block']].instrs:
                    self.edges[('region', 'hrchy', 'instr')].append((region.id, ii))

    def _prune_blocks(self):
        block_region_map = {}
        for region in self.nodes['region']:
            for bi in region.blocks:
                block_region_map[bi] = region.id

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

    def _get_estimated_resources(self, root):
        res_items = root.findall('*/res/*/item')
        rx = re.compile(' \(.*\)')

        estimated_resources = {}
        
        for item in res_items:
            rtl_name = re.sub(rx, '', item.find('first').text).strip()
            rtl_resources = item.find('second')
            if rtl_resources is None or rtl_name in estimated_resources:
                continue
            res_map = {}
            for res in rtl_resources.iter('item'):
                res_name = res.findtext('first')
                if res_name in RESOURCES_CONSIDERED:
                    res_map[res_name] = findint(res, 'second', 0)
            estimated_resources[rtl_name] = res_map
        
        return estimated_resources


class HLSData:
    def __init__(
        self, 
        solution_dir: str, 
        filtered: bool = False, 
        name: Optional[str] = None
    ):
        self.name = name
        self.nodes = defaultdict(list)
        self.edges = defaultdict(list)
        self.metrics = {}

        self._offsets = defaultdict(int)
        self._cdfgs = {}

        if solution_dir == 'dummy':
            return

        rpt = extract_impl_report(solution_dir, filtered=filtered)
        self._get_metrics(rpt)
        
        self._process_adb_files(solution_dir, filtered, rpt['module_data'])
        self._include_call_flow()

    def _get_metrics(self, report):
        for key, value in report['timing'].items():
            self.metrics[key] = value
        for key, value in report['utilization'].items():
            self.metrics[key] = value
        for key, value in report['power'].items():
            self.metrics[key] = value
        self.metrics['cc'] = report['cc']

    def _process_adb_files(self, solution_dir, filtered, rtl_resources=None):
        adb_file_list = collect_adb_files(solution_dir, filtered)
        
        for path in adb_file_list:
            print(f"Processing file: {path}")
            tree = ET.parse(path)
            root = tree.getroot()
            cdfg = CDFG(root, offsets=self._offsets, ground_truth_resources=rtl_resources)
            self._cdfgs[cdfg.function_name] = cdfg

            self._merge_cdfg_data(cdfg)

    def _merge_cdfg_data(self, cdfg):
        for ntype, nodes in cdfg.nodes.items():
            self.nodes[ntype].extend(nodes)
            self._offsets[ntype] += len(nodes)
        
        for etype, edges in cdfg.edges.items():
            self.edges[etype].extend(edges)

    def _include_call_flow(self):
        call_etype = ('instr', 'call', 'instr')
        dummy_etype = ('const', 'data', 'instr')
        
        for instr in self.nodes['instr']:
            if instr.attrs["opcode"] != "call" or not instr.operand_edges:
                continue
            # The source node of the first operand edge 
            # contains the name of the called function
            dummy_edge = instr.operand_edges[0]
            dummy_node = self.nodes['const'][dummy_edge[0]]
            callee = self._cdfgs[dummy_node.name]
            callee_start = callee.nodes['instr'][0]
            
            self.edges[call_etype].append((instr.id, callee_start.id))
        
        self._remove_dummy_constants(dummy_etype)

    def _remove_dummy_constants(self, dummy_etype):
        """ Remove constant nodes that were used to represent call edges """
        for i, node in enumerate(self.nodes['const']):
            if node.attrs["const_type"] == '6':
                del self.nodes['const'][i:]
                self.edges[dummy_etype] = [
                    (src, dst) 
                    for src, dst in self.edges[dummy_etype] if src < i
                ]
                break

    def dump(self, filepath):
        with open(filepath, 'w') as f:
            json.dump(self.__dict__(), f, indent=2)
    
    def __str__(self):
        data_dict = {
            'name': self.name,
            'metrics': self.metrics,
            'nodes': {
                nt: [node.__dict__() for node in nodes] 
                for nt, nodes in self.nodes.items()
            },
            'edges': {
                f"{et[0]}__{et[1]}__{et[2]}": edges 
                for et, edges in self.edges.items()
            }
        }
        return json.dumps(data_dict, indent=2)
    
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