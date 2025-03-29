import xml.etree.ElementTree as ET
import re
import os
from collections import defaultdict
from typing import Optional, Dict

try:
    from utils.xmlutils import findint, findfloat
    from utils.parsers import extract_impl_report
except ImportError:
    print("ImportError: Please make sure you have the required packages in your PYTHONPATH")
    pass


AVAILABLE_METRICS = {'FF', 'LUT', 'DSP', 'BRAM'}


ResourceMapper = Dict[str, Dict[str, int]]


class BaseNode:
    def __init__(self, element: ET.Element, rtl_resources=None):
        self.id, self.name, self.rtl_name = self._extract_basic_info(element)
        self.attributes = {}
        
        if rtl_resources is not None:
            self._assign_resources(rtl_resources)

    def _extract_basic_info(self, element):
        value = element.find('Value')
        obj = element.find('Obj') if value is None else value.find('Obj')
        return findint(obj, 'id'), obj.findtext('name'), obj.findtext('rtlName')

    def _assign_resources(self, rtl_resources):
        self.attributes.update(
            rtl_resources.get(self.rtl_name, {res: 0 for res in AVAILABLE_METRICS})
        )


class PortNode(BaseNode):
    def __init__(self, element: ET.Element):
        super().__init__(element)
        self.type = 'port'
        self.attributes.update({
            'bitwidth': findint(element, 'Value/bitwidth'),
            'direction': findint(element, 'direction'),
            'port_type': findint(element, 'if_type'),
            'array_size': findint(element, 'array_size')
        })


class InstructionNode(BaseNode):
    def __init__(
        self, element: ET.Element, rtl_resources=None):
        super().__init__(element, rtl_resources)
        self.type = 'instr'
        self.attributes.update({
            'core_name': element.findtext('Value/Obj/coreName'),
            'storage_depth': findint(element, 'Value/Obj/storageDepth'),
            'bitwidth': findint(element, 'Value/bitwidth'),
            'opcode': element.findtext('opcode'),
            'critical': findint(element, 'm_isOnCriticalPath'),
            'delay': findfloat(element, 'm_delay')
        })
        self.operand_edges = self._extract_operand_edges(element)

    def _extract_operand_edges(self, element):
        return [int(edge.text) for edge in element.find('oprand_edges').findall('item')]


class ConstantNode(BaseNode):
    def __init__(self, element: ET.Element):
        super().__init__(element)
        self.type = 'const'
        self.attributes.update({
            'bitwidth': findint(element, 'Value/bitwidth'),
            'const_type': findint(element, 'const_type')
        })


class BlockNode(BaseNode):
    def __init__(self, element: ET.Element, rtl_resources=None):
        super().__init__(element, rtl_resources)
        self.type = 'block'
        self.instrs = self._extract_instructions(element)

    def _extract_instructions(self, element):
        return [int(instr.text) for instr in element.find('node_objs').findall('item')]


class RegionNode:
    def __init__(self, element: ET.Element):
        self.id = findint(element, 'mId') - 1
        self.name = element.findtext('mTag')
        self.type = 'region'
        self.attributes = self._extract_attributes(element)
        self.sub_regions = self._extract_items(element, 'sub_regions', -1)
        self.blocks = self._extract_items(element, 'basic_blocks')

    def _extract_attributes(self, element):
        return {
            'region_type': element.findtext('mType'),
            'ii': findint(element, 'mII', 0),
            'depth': findint(element, 'mDepth', 0),
            'min_trip_count': findint(element, 'mMinTripCount', 0),
            'max_trip_count': findint(element, 'mMaxTripCount', 0),
            'min_latency': findint(element, 'mMinLatency', 0),
            'max_latency': findint(element, 'mMaxLatency', 0),
            "unroll": 0,
            "pipeline": 0,
            "loop_flatten": 0,
            "loop_merge": 0,
            "unroll_factor": 0
        }
    
    def _extract_items(self, element, tag, offset=0):
        return [int(item.text) + offset for item in element.find(tag).findall('item')]


class CDFG:
    def __init__(
        self, root: ET.Element, 
        offsets: Optional[Dict[str, int]] = None,
        rtl_resources=None
    ):
        self.nodes = defaultdict(list)
        self.edges = defaultdict(list)
        self._node_id_map = defaultdict(dict)
        self._offsets = offsets if offsets else defaultdict(int)
        self._indices = defaultdict(int)
        self._edge_id_map = defaultdict(dict)

        cdfg = root.find('syndb/cdfg')
        self.name = cdfg.findtext('name')
        self.ret_bitwidth = findint(cdfg, 'ret_bitwidth')
        self._resources = rtl_resources

        self._complement_resource_info(root)

        self._parse_nodes(cdfg, root)
        self._parse_edges(cdfg)
        self._build_hierarchy_edges()

    def _parse_nodes(self, cdfg, root):
        self._process_constants(cdfg.find('consts'))
        self._process_node_type(cdfg.find('nodes'), 'instr', InstructionNode, self._resources)
        self._process_node_type(cdfg.find('ports'), 'port', PortNode)
        self._process_blocks(cdfg.find('blocks'))
        self._process_regions(root.find('syndb/cdfg_regions'))

    def _process_constants(self, consts):
        dummy_consts = []
        # Insert the constant nodes with const_type = 6 at the end
		# as they will be removed later
        for elem in consts.findall('item'):
            node = ConstantNode(elem)
            if node.attributes['const_type'] == 6:
                dummy_consts.append(node)
            else:
                self.nodes['const'].append(node)
        self.nodes['const'].extend(dummy_consts)
        self._map_node_ids('const')

    def _process_node_type(self, section, ntype, node_class, resources=None):
        offset = self._offsets[ntype]
        for i, elem in enumerate(section.findall('item')):
            node = node_class(elem, resources) if resources else node_class(elem)
            self._node_id_map[ntype][node.id] = i + offset
            node.id = i + offset
            self.nodes[ntype].append(node)

    def _process_blocks(self, blocks):
        offset = self._offsets['block']
        for i, elem in enumerate(blocks.findall('item')):
            node = BlockNode(elem, self._resources)
            self._node_id_map['block'][node.id] = i + offset
            node.id = i + offset
            node.instrs = [self._node_id_map['instr'][instr] for instr in node.instrs]
            self.nodes['block'].append(node)

    def _process_regions(self, regions):
        offset = self._offsets['region']
        for elem in regions.findall('item'):
            node = RegionNode(elem)
            node.id += offset
            node.sub_regions = [sr + offset for sr in node.sub_regions]
            node.blocks = [self._node_id_map['block'][b] for b in node.blocks]
            self.nodes['region'].append(node)

    def _map_node_ids(self, ntype):
        offset = self._offsets[ntype]
        for i, node in enumerate(self.nodes[ntype]):
            self._node_id_map[ntype][node.id] = i + offset
            node.id = i + offset

    def _parse_edges(self, cdfg):
        for elem in cdfg.find('edges').findall('item'):
            etype = self._map_edge_type(elem.findtext('edge_type', ''))
            if etype == '':
                continue
            src = findint(elem, 'source_obj')
            dst = findint(elem, 'sink_obj')
            if src is None or dst is None:
                continue
            src, stype = self._get_id_and_type(src)
            dst, dtype = self._get_id_and_type(src)
            if src is None or dst is None:
                continue
            etype = (stype, etype, dtype)
            self.edges[etype].append((src, dst))
            self._edge_id_map[findint(elem, 'id')] = self._indices[etype]
            self._indices[etype] += 1

        for instr in self.nodes['instr']:
            instr.operand_edges = [self._edge_id_map[eid] for eid in instr.operand_edges]

    def _get_id_and_type(self, original_id):
        for ntype, nmap in self._node_id_map.items():
            if original_id in nmap:
                return nmap[original_id], ntype
        return None, None

    def _map_edge_type(self, etype):
        return {'1': 'operand', '2': 'pred', '4': 'mem'}.get(etype, '')

    def _build_hierarchy_edges(self):
        for reg in self.nodes['region']:
            for rid in reg.sub_regions:
                self.edges[('region', 'hrchy', 'region')].append((reg.id, rid))
            for bid in reg.blocks:
                self.edges[('region', 'hrchy', 'block')].append((reg.id, bid))
                for iid in self.nodes['block'][bid - self._offsets['block']].instrs:
                    self.edges[('block', 'hrchy', 'instr')].append((bid, iid))

    def _complement_resource_info(self, root):
        res_items = root.findall('*/res/*/item')
        rx = re.compile(' \(.*\)')
        
        for item in res_items:
            rtl_name = re.sub(rx, '', item.find('first').text).strip()
            rtl_resources = item.find('second')
            if rtl_name in self._resources or rtl_resources is None:
                continue
            res_map = {res: 0 for res in AVAILABLE_METRICS}
            for res in rtl_resources.iter('item'):
                res_name = res.findtext('first')
                if res_name in res_map:
                    res_map[res_name] = findint(res, 'second')
            self._resources[rtl_name] = res_map


class HLSData:
    def __init__(self, solution_dir, filtered=False, name=''):
        self.name = name
        self.nodes = defaultdict(list)
        self.edges = defaultdict(list)
        self._offsets = defaultdict(int)
        self._cdfgs = {}

        rpt = extract_impl_report(solution_dir, filtered=filtered)
        self._get_metrics(rpt)
        
        self._process_adb_files(solution_dir, filtered, rpt['module_data'])
        self._include_call_flow()

    def _get_metrics(self, report):
        self.metrics = {}
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
            cdfg = CDFG(root, offsets=self._offsets, rtl_resources=rtl_resources)
            self._cdfgs[cdfg.name] = cdfg
            
            self._merge_cdfg_data(cdfg)

    def _merge_cdfg_data(self, cdfg):
        for ntype, nodes in cdfg.nodes.items():
            self.nodes[ntype].extend(nodes)
            self._offsets[ntype] += len(nodes)
        
        for etype, edges in cdfg.edges.items():
            self.edges[etype].extend(edges)

    def _include_call_flow(self):
        def get_dummy_constant(cdfg, idx):
            for node in cdfg.nodes['const']:
                if node.id == idx:
                    return node
            return None
        
        call_etype = ('instr', 'call', 'instr')
        dummy_etype = ('const', 'operand', 'instr')
        
        for cdfg in self._cdfgs.values():
            for instr in cdfg.nodes['instr']:
                if instr.attributes["opcode"] != "call":
                    continue
                # The source node of the first operand edge 
                # contains the name of the called function
                eid = instr.operand_edges[0]
                dummy_edge = cdfg.edges[dummy_etype][eid]
                dummy_node = get_dummy_constant(cdfg, dummy_edge[0])
                if dummy_node is None:
                    continue
                callee = self._cdfgs[dummy_node.name]
                callee_start = callee.nodes['instr'][0]
                
                self.edges[call_etype].append((instr.id, callee_start.id))
        
        self._remove_dummy_constants(dummy_etype)

    def _remove_dummy_constants(self, dummy_etype):
        """ Remove constant nodes that were used to represent call edges """
        for i, node in enumerate(self.nodes['const']):
            if node.attributes["const_type"] == 6:
                del self.nodes['const'][i:]
                self.edges[dummy_etype] = [
                    (src, dst) for src, dst in self.edges[dummy_etype] 
                    if src < i
                ]
                break


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
