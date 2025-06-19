import json
import copy
from collections import defaultdict
from typing import Optional, Tuple, Dict, List, Any

import torch
import matplotlib.pyplot as plt

from torch_geometric.data import HeteroData
from torch_geometric.typing import NodeType, EdgeType

from gnn.data.utils.parsers import parse_tcl_directives
from gnn.data.utils.llvm_defs import (
    TypeID, Opcode,
    TYPE_ENCODING, 
    OP_ENCODING, 
    MAX_ARRAY_DIMS, 
    MAX_LOOP_DEPTH
)

NODE_TYPES = [
    'instr', 'var', 'const', 'region'
]
EDGE_TYPES = [
    # Data flow
    ('instr', 'data', 'var'),
    ('var', 'data', 'instr'),
    ('const', 'data', 'instr'),

    # Control flow
    ('instr', 'control', 'instr'),

    # Call flow
    ('instr', 'call', 'instr'),

    # Hierarchy edges
    ('region', 'hrchy', 'region'),
    ('region', 'hrchy', 'instr'),

    # Reversed hierarchy edges
    ('region', 'hrchy_rev', 'region'),
    ('instr', 'hrchy_rev', 'region'),
] + [
    # Self-loops
    (nt, 'self', nt) for nt in NODE_TYPES
]
METADATA = (NODE_TYPES, EDGE_TYPES)

FEATURE_SIZE_BY_TYPE = {
    'instr': 12,
    'var': 27,
    'const': 27,
    'region': 14
}

DIRECTIVES = [
    'pipeline', 'unroll', 'array_partition', 
    'loop_merge', 'loop_flatten',
    'dataflow', 'inline'
]


class Node:
    def __init__(self, index, node_type, function_name=None):
        self.index = index
        self.node_type = node_type
        self.function_name = function_name
        self.feature_dict = {}

    def set_feature(self, key, value):
        self.feature_dict[key] = value

    def get_feature(self, key):
        return self.feature_dict.get(key, None)
    
    def extend_features(self, features):
        if isinstance(features, dict):
            for key, value in features.items():
                self.set_feature(key, value)
        elif isinstance(features, list):
            for feature in features:
                if isinstance(feature, dict):
                    self.extend_features(feature)
                else:
                    raise ValueError("Features must be a dict or a list of dicts.")
        else:
            raise ValueError("Features must be a dict or a list of dicts.")
    
    def get_feature_vector(self):
        feature_vector = []
        for feature in self.feature_dict.values():
            if isinstance(feature, list):
                feature_vector.extend(feature)
            else:
                feature_vector.append(feature)
        return torch.tensor(feature_vector, dtype=torch.float32)


class InstructionNode(Node):
    def __init__(self, index, pgml_id, opcode, function_name=None):
        super().__init__(index, 'instr', function_name)
        self.pgml_id = pgml_id

        self.opcode = int(opcode)
        encoded_opcode = OP_ENCODING.get(
            self.opcode, 
            OP_ENCODING[Opcode.UNKNOWN]
        )
        self.set_feature('opcode', encoded_opcode)

    def to_dict(self):
        return {
            'index': self.index,
            'pgml_id': self.pgml_id,
            'opcode': self.opcode,
            'function_name': self.function_name
        }
    
    @classmethod
    def from_dict(cls, data):
        return cls(
            index=data['index'],
            pgml_id=data['pgml_id'],
            opcode=data['opcode'],
            function_name=data.get('function_name', None)
        )
    

class DataNode(Node):
    def __init__(self, index, node_type, pgml_id, data_type, bitwidth, 
                 function_name=None, node_name=None, 
                 is_param=False, is_interface=False,
                 is_global=False, array_features=None):
        super().__init__(index, node_type, function_name)
        self.pgml_id = pgml_id
        self.name = node_name

        self.data_type = int(data_type)
        encoded_data_type = TYPE_ENCODING.get(
            self.data_type, 
            TYPE_ENCODING[TypeID.UNKNOWN]
        )
        self.set_feature('type', encoded_data_type)
        self.set_feature('is_param', int(is_param))
        self.set_feature('is_interface', int(is_interface))
        self.set_feature('is_global', int(is_global))

        if array_features is None:
            self.set_feature('primitive_bitwidth', bitwidth)
            self.set_feature('is_array', 0)
            array_features = {
                'base_type': TYPE_ENCODING[TypeID.UNKNOWN],
                'dimensions': [0] * MAX_ARRAY_DIMS,
                'array_partition': 0,
                'array_partition_factor': 0,
                'array_partition_type': [0, 0, 0],
                'array_partition_dim': [0] * (MAX_ARRAY_DIMS + 1)
            }
        else:
            self.set_feature('primitive_bitwidth', 
                             array_features.get('primitive_bitwidth', 64))
            self.set_feature('is_array', 1)
        self.extend_features(array_features)

    def to_dict(self):
        return {
            'index': self.index,
            'pgml_id': self.pgml_id,
            'data_type': self.data_type,
            'bitwidth': self.get_feature('primitive_bitwidth'),
            'function_name': self.function_name,
            'node_name': self.name,
            'is_param': self.get_feature('is_param'),
            'is_interface': self.get_feature('is_interface'),
            'is_global': self.get_feature('is_global'),
            'array_features': {
                'base_type': self.get_feature('base_type'),
                'primitive_bitwidth': self.get_feature('primitive_bitwidth'),
                'dimensions': self.get_feature('dimensions'),
                'array_partition': self.get_feature('array_partition'),
                'array_partition_factor': self.get_feature('array_partition_factor'),
                'array_partition_type': self.get_feature('array_partition_type'),
                'array_partition_dim': self.get_feature('array_partition_dim')
            }
        }


class VariableNode(DataNode):
    def __init__(self, index, pgml_id, data_type, bitwidth, 
                 function_name=None, node_name=None, 
                 is_param=False, is_interface=False,
                 is_global=False, array_features=None):
        super().__init__(index, 'var', pgml_id, data_type, bitwidth, 
                         function_name, node_name, 
                         is_param, is_interface, is_global, 
                         array_features)
    
    @classmethod
    def from_dict(cls, data):
        return cls(
            index=data['index'],
            pgml_id=data['pgml_id'],
            data_type=data['data_type'],
            bitwidth=data['bitwidth'],
            function_name=data.get('function_name'),
            node_name=data.get('node_name'),
            is_param=data.get('is_param', False),
            is_interface=data.get('is_interface', False),
            is_global=data.get('is_global', False),
            array_features=data.get('array_features')
        )


class ConstantNode(DataNode):
    def __init__(self, index, pgml_id, data_type, bitwidth, 
                 function_name=None, node_name=None, 
                 is_param=False, is_interface=False,
                 is_global=False, array_features=None):
        super().__init__(index, 'const', pgml_id, data_type, bitwidth, 
                         function_name, node_name, 
                         is_param, is_interface, is_global, 
                         array_features)
    
    @classmethod
    def from_dict(cls, data):
        return cls(
            index=data['index'],
            pgml_id=data['pgml_id'],
            data_type=data['data_type'],
            bitwidth=data['bitwidth'],
            function_name=data.get('function_name'),
            node_name=data.get('node_name'),
            is_param=data.get('is_param', False),
            is_interface=data.get('is_interface', False),
            is_global=data.get('is_global', False),
            array_features=data.get('array_features')
        )


class RegionNode(Node):
    def __init__(self, index, is_loop=False,
                 trip_count=0, depth=0, 
                 function_name=None, node_name=None,
                 directive_features=None):
        super().__init__(index, 'region', function_name)
        self.name = node_name

        self.set_feature('is_loop', int(is_loop))
        self.set_feature('trip_count', int(trip_count))

        depth_encoded = [0] * MAX_LOOP_DEPTH
        if depth >= MAX_LOOP_DEPTH:
            depth = MAX_LOOP_DEPTH - 1
        depth_encoded[max(0, int(depth))] = 1
        self.set_feature('depth', depth_encoded)

        if not directive_features:
            directive_features = {
                'pipeline': 0,
                'loop_flatten': 0,
                'loop_merge': 0,
                'unroll': 0,
                'unroll_factor': 0,
                'dataflow': 0,
                'inline': 0
            }
        self.extend_features(directive_features)

    def to_dict(self):
        return {
            'index': self.index,
            'is_loop': self.get_feature('is_loop'),
            'trip_count': self.get_feature('trip_count'),
            'depth': (self.get_feature('depth').index(1) 
                      if 1 in self.get_feature('depth') else 0),
            'function_name': self.function_name,
            'node_name': self.name,
            'directive_features': {
                'pipeline': self.get_feature('pipeline'),
                'loop_flatten': self.get_feature('loop_flatten'),
                'loop_merge': self.get_feature('loop_merge'),
                'unroll': self.get_feature('unroll'),
                'unroll_factor': self.get_feature('unroll_factor'),
                'dataflow': self.get_feature('dataflow'),
                'inline': self.get_feature('inline')
            }
        }
    
    @classmethod
    def from_dict(cls, data):
        return cls(
            index=data['index'],
            is_loop=data.get('is_loop', 0),
            trip_count=data.get('trip_count', 0),
            depth=data.get('depth', 0),
            function_name=data.get('function_name'),
            node_name=data.get('node_name'),
            directive_features=data.get('directive_features')
        )


NodeDict = Dict[NodeType, List[Node]]
EdgeDict = Dict[EdgeType, List[Tuple[int, int]]]


CLASS_MAP = {
    'instr': InstructionNode,
    'var': VariableNode,
    'const': ConstantNode,
    'region': RegionNode,
}

def create_node_from_dict(node_type: str, node_data: Dict[str, Any]) -> Node:
    """
    Factory function to create a Node object from its type string and data dictionary.
    """
    node_class = CLASS_MAP.get(node_type)
    if node_class is None:
        raise ValueError(f"Unknown node type specified: '{node_type}'")
    
    return node_class.from_dict(node_data)


class CDFG:
    def __init__(self, 
                 nodes: Optional[NodeDict] = None, 
                 edges: Optional[EdgeDict] = None):
        self.nodes = nodes or {}
        self.edges = edges or {}

        for nt in NODE_TYPES:
            if nt not in self.nodes:
                self.nodes[nt] = []

        for et in EDGE_TYPES:
            if et not in self.edges:
                self.edges[et] = []

    def add_node(self, node: Node):
        if node.node_type not in self.nodes:
            self.nodes[node.node_type] = []
        self.nodes[node.node_type].append(node)

    def add_edge(self, src: Node, dst: Node, rel_type: str):
        edge_type = (src.node_type, rel_type, dst.node_type)
        if edge_type not in self.edges:
            self.edges[edge_type] = []
        self.edges[edge_type].append((src.index, dst.index))

    def to_dict(self):
        return {
            'nodes': {
                nt: [node.to_dict() for node in nodes] 
                for nt, nodes in self.nodes.items()
            },
            'edges': {
                '__'.join(list(et)): edges 
                for et, edges in self.edges.items()
            }
        }
    
    def to_json(self, filepath: str):
        with open(filepath, 'w') as f:
            json.dump(self.to_dict(), f, indent=2)

    @classmethod
    def from_json(cls, filepath: str):
        with open(filepath, 'r') as f:
            data = json.load(f)
        
        nodes = {
            nt: [create_node_from_dict(nt, node) for node in node_list] 
            for nt, node_list in data['nodes'].items()
        }
        edges = {
            tuple(et.split('__')): [
                (int(edge[0]), int(edge[1])) for edge in edge_list
            ] 
            for et, edge_list in data['edges'].items()
        }
        return cls(nodes=nodes, edges=edges)
    
    def to_pyg_hetero_data(self, add_self_loops: bool = True) -> HeteroData:
        data = HeteroData()
        for nt in NODE_TYPES:
            nodes = self.nodes.get(nt, [])
            feature_vectors = []
            for node in nodes:
                feature_vectors.append(node.get_feature_vector())
            if len(feature_vectors) > 0:
                data[nt].x = torch.stack(feature_vectors, dim=0)
            else:
                data[nt].x = torch.empty(
                    (0, FEATURE_SIZE_BY_TYPE[nt]), dtype=torch.float32
                )
            data[nt].label = [
                node.name 
                if hasattr(node, 'name') and node.name else node.index
                for node in nodes
            ]

        for et in EDGE_TYPES:
            if et[1] == 'self':
                continue
            edges = self.edges.get(et)
            if edges:
                src, dst = zip(*edges)
                src = torch.tensor(src, dtype=torch.long)
                dst = torch.tensor(dst, dtype=torch.long)
                data[et].edge_index = torch.stack([src, dst], dim=0)
            else:
                data[et].edge_index = torch.empty((2, 0), dtype=torch.long)

        if add_self_loops:
            for nt in NODE_TYPES:
                nodes = self.nodes.get(nt)
                et = (nt, 'self', nt)
                if nodes:
                    src = torch.arange(len(nodes), dtype=torch.long)
                    dst = src.clone()
                    data[et].edge_index = torch.stack([src, dst], dim=0)
                else:
                    data[et].edge_index = torch.empty((2, 0), dtype=torch.long)
        return data


def generate_base_design_graph(
    ir_filepath: str, 
    ir_metadata_filepath: str,
    top_level_function: str
) -> CDFG:
    import programl

    with open(ir_metadata_filepath, 'r') as f:
        ir_metadata = json.load(f)

    with open(ir_filepath, 'r') as f:
        pgml_graph = programl.from_llvm_ir(f.read())

    pgml_graph = programl.to_json(pgml_graph)

    pgml_nodes = pgml_graph.get('nodes', [])
    pgml_edges = pgml_graph.get('links', [])
    pgml_functions = [
        f['name'] 
        for f in pgml_graph.get('graph', {}).get('function', [])
        if 'name' in f
    ]

    node_dict, hrchy_edge_dict = build_nodes(
        pgml_nodes, pgml_functions, ir_metadata, 
        top_level_function
    )
    edge_dict = build_edges(pgml_edges, node_dict)

    for et, edges in hrchy_edge_dict.items():
        if et not in edge_dict:
            edge_dict[et] = []
        edge_dict[et].extend(edges)
        src_type, rel_type, dst_type = et
        if rel_type == 'hrchy':
            rev_et = (dst_type, 'hrchy_rev', src_type)
            if rev_et not in edge_dict:
                edge_dict[rev_et] = []
            rev_edges = [(dst, src) for src, dst in edges]
            edge_dict[rev_et].extend(rev_edges)

    return CDFG(
        nodes=node_dict, 
        edges=edge_dict
    )


def generate_optimized_design_graph(
    base_design_graph: CDFG, 
    dct_tcl_filepath: str
) -> CDFG:
    cdfg = copy.deepcopy(base_design_graph)

    def find_region(node_name, function_name):
        for node in cdfg.nodes['region']:
            if node.name == node_name:
                if (node.function_name == function_name
                    or not node.function_name):
                    return node
        return None
    
    def find_array(node_name, function_name):
        for nt in ['var', 'const']:
            for node in cdfg.nodes[nt]:
                if node.name == node_name:
                    if (node.function_name == function_name
                        or not node.function_name):
                        return node
        # If not found, search for the node name only
        # This is a fallback for cases where the function name is not specified
        for nt in ['var', 'const']:
            for node in cdfg.nodes[nt]:
                if node.name == node_name:
                    return node
        return None
    
    directives = parse_tcl_directives(dct_tcl_filepath)

    for dct_type, dct_args in directives:
        if dct_type not in DIRECTIVES or 'off' in dct_args:
            continue

        if dct_type != 'array_partition':
            location = dct_args.get('location')
            if location is None:
                continue
            if '/' in location:
                function_name, region_name = location.split('/')
            else:
                function_name = location
                region_name = location

            node = find_region(region_name, function_name)
            if node is None:
                print(f"Warning: Node not found for {dct_type} "
                      f"directive with location {location}")
                continue

            if dct_type == 'unroll':
                factor = int(dct_args.get('factor', 0))
                if factor <= 0:
                    factor = max(1, node.feature_dict['trip_count'])
                node.feature_dict['unroll_factor'] = factor
        else:
            function_name = dct_args.get('location', '')
            array_name = dct_args.get('variable')

            node = find_array(array_name, function_name)
            if node is None:
                print(f"Warning: Node not found for array partition directive with "
                      f"location {function_name} and variable {array_name}")
                continue

            partition_dim = min(int(dct_args.get('dim', 0)), MAX_ARRAY_DIMS)
            node.feature_dict['array_partition_dim'][partition_dim] = 1

            partition_type = dct_args.get('type', 'complete')
            if partition_type == 'complete':
                node.feature_dict['array_partition_type'][0] = 1
            elif partition_type == 'cyclic':
                node.feature_dict['array_partition_type'][1] = 1
            else:
                node.feature_dict['array_partition_type'][2] = 1

            factor = int(dct_args.get('factor', 0))
            if factor <= 0 or partition_type == 'complete':
                dims = node.feature_dict['dimensions']
                if partition_dim == 0:
                    factor = 1
                    for dim in dims:
                        factor *= dim
                else:
                    factor = dims[partition_dim-1]
            node.feature_dict['array_partition_factor'] = max(1, factor)

        node.feature_dict[dct_type] = 1

    return cdfg


def build_nodes(pgml_nodes, pgml_functions, 
                ir_metadata, top_level_function):
    node_dict = defaultdict(list)
    node_indices = defaultdict(int)
    id_to_index_mapping = {"instr": {}, "region": {}}

    for pgml_node in pgml_nodes:
        node_text = pgml_node.get('text', '')
        if not node_text or node_text  == '[external]':
            continue

        node_full_text = pgml_node['features']['full_text'][0]
        pgml_node_id = int(pgml_node['id'])
        function_index = int(pgml_node['function'])
        node_type = int(pgml_node['type'])
        function_name = pgml_functions[function_index]

        if node_type == 0: # Instruction
            if '!id.' not in node_full_text:
                continue

            instruction_id = node_full_text.split('!id.')[1]
            if ' ' in instruction_id:
                instruction_id = instruction_id.split(' ')[0]
            instruction_id = int(instruction_id.strip())

            metadata = find_instruction_metadata(ir_metadata, instruction_id)
            if metadata is None:
                continue

            node_index = node_indices['instr']
            node_indices['instr'] += 1
            id_to_index_mapping['instr'][instruction_id] = node_index

            node = InstructionNode(
                node_index, pgml_id=pgml_node_id,
                opcode=metadata['opcode'],
                function_name=function_name
            )
            node_dict['instr'].append(node)

        elif node_type == 1: # Variable
            metadata = find_variable_metadata(
                ir_metadata, node_full_text, function_name
            )
            if metadata is None:
                continue

            is_global = int(metadata.get('isGlobal', 0)) == 1
            if is_global:
                function_name = metadata.get('functionName', '')
            is_param = int(metadata.get('isParam', 0)) == 1
            is_interface = is_param and function_name == top_level_function
            array_features = None
            if int(metadata.get('isArray', 0)) == 1:
                array_features = parse_array_features(metadata)
                bitwidth = array_features['primitive_bitwidth']
            else:
                bitwidth = int(metadata['bitwidth'])

            node_index = node_indices['var']
            node_indices['var'] += 1

            node = VariableNode(
                node_index, pgml_id=pgml_node_id,
                data_type=metadata['type'], 
                bitwidth=bitwidth,
                node_name=metadata['name'],
                function_name=function_name,
                is_global=is_global,
                is_param=is_param,
                is_interface=is_interface,
                array_features=array_features
            )
            node_dict['var'].append(node)

        elif node_type == 2: # Constant
            array_features = None
            if '=' in node_full_text:
                # Named constant (local or global)
                name, value = node_full_text.split('=')
                name = name.strip(' @')
                metadata = find_global_metadata(ir_metadata, name, value)
                if metadata is None:
                    continue
                node_name = metadata['name']
                function_name = metadata['functionName']
                is_global = int(metadata.get('isGlobal', 0)) == 1
                is_param = int(metadata.get('isParam', 0)) == 1
                is_interface = is_param and function_name == top_level_function
                const_type = metadata['type']
                bitwidth = metadata['bitwidth']
                if int(metadata.get('isArray', 0)) == 1:
                    array_features = parse_array_features(metadata)
                    bitwidth = array_features['primitive_bitwidth']
                else:
                    bitwidth = int(metadata['bitwidth'])
            else:
                # Unnamed constant (e.g., literal)
                is_global = is_param = is_interface = False
                const_features = extract_const_data_info(pgml_node)
                const_type = const_features['type']
                bitwidth = const_features['bitwidth']
                node_name = ''
                    
            node_index = node_indices['const']
            node_indices['const'] += 1

            node = ConstantNode(
                node_index, pgml_id=pgml_node_id,
                data_type=const_type, 
                bitwidth=bitwidth,
                node_name=node_name,
                function_name=function_name,
                is_global=is_global,
                is_param=is_param,
                is_interface=is_interface,
                array_features=array_features
            )
            node_dict['const'].append(node)

        else:
            print(f"Warning: Unknown node type {node_type}")
            continue

    regions = ir_metadata.get('region', [])
    for region in regions:
        node_index = node_indices['region']
        node_indices['region'] += 1

        region_id = int(region['id'])
        id_to_index_mapping['region'][region_id] = node_index

        is_loop = int(region.get('isLoop', 0)) == 1
        trip_count = int(region['tripCount'])
        depth = int(region['depth'])
        if is_loop:
            trip_count = max(1, trip_count)
        else:
            trip_count = 0

        node = RegionNode(
            node_index, is_loop, trip_count=trip_count, 
            depth=depth, node_name=region.get('name', ''),
            function_name=region.get('functionName', '')
        )
        node_dict['region'].append(node)

    hrchy_edge_dict = {
        ('region', 'hrchy', 'region'): [], 
        ('region', 'hrchy', 'instr'): []
    }

    # Ensure that regions with higher IDs are processed first
    regions.sort(key=lambda x: int(x['id']), reverse=True)
    instructions_seen = set()

    for region in regions:
        region_index = id_to_index_mapping['region'][int(region['id'])]
        for sub_region_id in region['subRegions']:
            sub_region_index = id_to_index_mapping['region'].get(sub_region_id)
            if sub_region_index is not None:
                hrchy_edge_dict[('region', 'hrchy', 'region')].append(
                    (region_index, sub_region_index)
                )
        for instr_id in region['instructions']:
            if instr_id in instructions_seen:
                continue
            instructions_seen.add(instr_id)
            instr_index = id_to_index_mapping['instr'].get(instr_id)
            if instr_index is not None:
                hrchy_edge_dict[('region', 'hrchy', 'instr')].append(
                    (region_index, instr_index)
                )
        
    return node_dict, hrchy_edge_dict


def build_edges(pgml_edges, graph_nodes):
    def find_node(pgml_id):
        for nt in ['instr', 'var', 'const']:
            for node in graph_nodes[nt]:
                if node.pgml_id == pgml_id:
                    return node
        return None

    edge_dict = defaultdict(list)
    for edge in pgml_edges:
        src = find_node(edge['source'])
        dst = find_node(edge['target'])
        if src is None or dst is None:
            continue
        flow = edge['flow']
        if flow == 0:
            flow = 'control'
        elif flow == 1:
            flow = 'data'
        else:
            flow = 'call'
        edge_type = (src.node_type, flow, dst.node_type)
        edge_dict[edge_type].append((src.index, dst.index))
        
    return edge_dict


def parse_array_features(array_metadata):
    base_type_encoding = TYPE_ENCODING.get(
        int(array_metadata['baseType']), 
        TYPE_ENCODING[TypeID.UNKNOWN]
    )
    base_bitwidth = int(array_metadata['baseTypeBitwidth'])

    dims = [
        int(dim) for dim in array_metadata['dimensions']
    ]
    num_dims = int(array_metadata['numDims'])
    if num_dims > MAX_ARRAY_DIMS:
        remaining_dims = dims[MAX_ARRAY_DIMS-1:]
        remaining_size = 1
        for dim in remaining_dims:
            remaining_size *= dim
        dims = dims[:MAX_ARRAY_DIMS-1] + [remaining_size]
    elif num_dims < MAX_ARRAY_DIMS:
        dims += [1] * (MAX_ARRAY_DIMS - num_dims)

    feature_dict = {
        'base_type': base_type_encoding,
        'primitive_bitwidth': base_bitwidth,
        'dimensions': dims,
        'array_partition': 0,
        'array_partition_factor': 0,
        'array_partition_type': [0, 0, 0],  # complete, cyclic, block
        'array_partition_dim': [0] * (MAX_ARRAY_DIMS + 1)  # One-hot encoding
    }
    return feature_dict


def find_instruction_metadata(ir_metadata, instruction_id):
    for node in ir_metadata.get('instruction', []):
        if node['id'] == instruction_id:
            return node
    return None
        

def find_variable_metadata(metadata, node_full_text, function_name):
    var_name = node_full_text.split('%')[1]
    if ' ' in var_name:
        var_name = var_name.split(' ')[0]
    var_name = var_name.strip()
    for node in metadata.get('variable', []):
        if node['name'] == var_name:
            if (int(node.get('isGlobal', 0)) == 1
                or node['functionName'] == function_name):
                return node
    return None


def find_global_metadata(metadata, name, value):
    if 'internal constant' in value and '.' in name:
        function_name, const_name = name.split('.')
        const_name = const_name.strip()
        function_name = function_name.strip()
        for node in metadata.get('variable', []):
            if (node['name'] == const_name 
                and node['functionName'] == function_name):
                return node
    else:
        for node in metadata.get('variable', []):
            if (int(node.get('isGlobal', 0)) == 1 
                and node['name'] == name):
                return node
    return None


def extract_const_data_info(pgml_node):
    full_text = pgml_node['features']['full_text'][0]
    if '*' in full_text:
        type_id = TypeID.POINTER
        bitwidth = 64
    elif full_text[0] == 'i':
        type_id = TypeID.INT
        bitwidth = int(full_text[1:full_text.index(' ')])
    elif full_text == 'float':
        type_id = TypeID.FLOAT
        bitwidth = 32
    elif full_text == 'double':
        type_id = TypeID.DOUBLE
        bitwidth = 64
    elif full_text == 'half':
        type_id = TypeID.HALF
        bitwidth = 16
    else: # Placeholder for other types
        type_id = TypeID.UNKNOWN
        bitwidth = 0
    return {'type': type_id, 'bitwidth': bitwidth}


def plot_graph(data, plot_type, batched=False):
    import networkx as nx
    from torch_geometric.utils import to_networkx
    from matplotlib.lines import Line2D
    from matplotlib.patches import Patch

    node_color_dict = {
        "instr": "#2489d0",
        "var": "#1cc49a",
        "const": "#9f5fe9",
        "region": "#d15a56"
    }
    edge_color_dict = {
        "data": "#0570a1",
        "control": "#05917E",
        "call": "#ab4bb8",
        "hrchy": "#888B8D"
    }

    if plot_type == "full":
        ntypes = node_color_dict.keys()
        etypes = [
            et for et in EDGE_TYPES
            if et[1] in edge_color_dict 
            and et[0] in ntypes and et[2] in ntypes
        ]
    elif plot_type in edge_color_dict:
        etypes = [
            et for et in EDGE_TYPES
            if et[1] == plot_type 
            and et[0] in node_color_dict and et[2] in node_color_dict
        ]
        ntypes = set()
        for et in etypes:
            ntypes.add(et[0])
            ntypes.add(et[2])

    filtered_data = HeteroData()
    for nt, x in data.x_dict.items():
        if nt not in ntypes:
            filtered_data[nt].x = torch.empty(
                (0, FEATURE_SIZE_BY_TYPE[nt]), dtype=torch.float32
            )
            filtered_data[nt].label = []
        else:
            filtered_data[nt].x = x
            filtered_data[nt].label = data[nt].label

    for et, edge_index in data.edge_index_dict.items():
        if et not in etypes:
            filtered_data[et].edge_index = torch.empty(
                (2, 0), dtype=torch.long
            )
        else:
            filtered_data[et].edge_index = edge_index

    G = to_networkx(
        data=filtered_data, 
        node_attrs=['x', 'label'],
        remove_self_loops=True
    )
    
    ncolors, nlabels = [], {}
    for node, attrs in G.nodes(data=True):
        nt = attrs.get("type")
        if nt is None:
            continue
        if nt not in node_color_dict:
            ncolors.append("#ffffff")
        else:
            ncolors.append(node_color_dict[nt])
        nlabels[node] = attrs["label"]

    ecolors = []
    for src, dst, attrs in G.edges(data=True):
        et = attrs.get("type")
        if et is None:
            continue
        if et not in edge_color_dict:
            ecolor = "#ffffff"
        else:
            ecolor = edge_color_dict[et]
        ecolors.append(ecolor)
        G.edges[src, dst]["color"] = ecolor

    node_legend = [
        Patch(color=color, label=nt) 
        for nt, color in ncolors.items()
    ]
    edge_legend = [
        Line2D([0], [0], color=color, lw=2, label=et)
        for et, color in ecolors.items()
    ]

    if plot_type in ["full", "data", "hrchy"] and not batched:
        pos = nx.kamada_kawai_layout(G, scale=2)
    else:
        pos = nx.spring_layout(G, scale=2)

    plt.figure(figsize=(12, 8))
    nx.draw_networkx(
        G, pos, labels=nlabels, node_color=ncolors, 
        edge_color=ecolors, style="dashed", node_size=150, 
        font_size=8, arrowsize=9, width=.8, alpha=.8
    )
    plt.legend(
        handles=node_legend + edge_legend, loc='lower center', 
        bbox_to_anchor=(0.5, -0.1), ncol=3, fontsize=8, frameon=False
    )
    plt.show()
