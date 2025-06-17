import json
from collections import defaultdict
from typing import Optional, Tuple, Dict, List

import torch
import matplotlib.pyplot as plt

from torch_geometric.data import HeteroData
from torch_geometric.typing import NodeType, EdgeType

from gnn.data.utils.parsers import parse_tcl_directives
from gnn.data.utils.llvm_defs import (
    TYPE_ENCODING, OP_ENCODING, 
    MAX_ARRAY_DIMS, 
    TypeID, Opcode
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

    # Hierarchy reverse edges
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
    'region': 8
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
    
    def as_dict(self):
        return {
            'index': self.index,
            'type': self.node_type,
            'features': self.feature_dict
        }
    
    def __str__(self):
        return json.dumps(self.as_dict(), indent=2)
    
    def __repr__(self):
        return str(self)


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


class VariableNode(Node):
    def __init__(self, index, pgml_id, var_type, bitwidth, 
                 function_name=None, node_name=None, 
                 is_param=False, is_interface=False,
                 is_global=False, array_features=None):
        super().__init__(index, 'var', function_name)
        self.pgml_id = pgml_id
        self.node_name = node_name

        self.var_type = int(var_type)
        self.bitwidth = int(bitwidth)
        encoded_var_type = TYPE_ENCODING.get(
            self.var_type, 
            TYPE_ENCODING[TypeID.UNKNOWN]
        )
        self.set_feature('type', encoded_var_type)
        self.set_feature('bitwidth', self.bitwidth)
        self.set_feature('is_param', int(is_param))
        self.set_feature('is_interface', int(is_interface))
        self.set_feature('is_global', int(is_global))

        self.is_array = array_features is not None
        if not self.is_array:
            array_features = {
                'base_type': TYPE_ENCODING[TypeID.UNKNOWN],
                'base_bitwidth': 0,
                'dimensions': [0] * (MAX_ARRAY_DIMS + 1),
                'partition_factor': 0,
                'partition_type': [0, 0, 0],
                'partition_dim': [0] * (MAX_ARRAY_DIMS + 1)
            }
        self.extend_features(array_features)


class ConstantNode(Node):
    def __init__(self, index, pgml_id, const_type, bitwidth, 
                 function_name=None, node_name=None, 
                 is_param=False, is_interface=False,
                 is_global=False, array_features=None):
        super().__init__(index, 'const', function_name)
        self.pgml_id = pgml_id
        self.node_name = node_name

        self.const_type = int(const_type)
        self.bitwidth = int(bitwidth)
        encoded_const_type = TYPE_ENCODING.get(
            self.const_type, 
            TYPE_ENCODING[TypeID.UNKNOWN]
        )
        self.set_feature('type', encoded_const_type)
        self.set_feature('bitwidth', self.bitwidth)
        self.set_feature('is_param', int(is_param))
        self.set_feature('is_interface', int(is_interface))
        self.set_feature('is_global', int(is_global))

        self.is_array = array_features is not None
        if not self.is_array:
            array_features = {
                'base_type': TYPE_ENCODING[TypeID.UNKNOWN],
                'base_bitwidth': 0,
                'dimensions': [1] * (MAX_ARRAY_DIMS + 1),
                'partition_factor': 0,
                'partition_type': [0, 0, 0],
                'partition_dim': [0] * (MAX_ARRAY_DIMS + 1)
            }
        self.extend_features(array_features)


class RegionNode(Node):
    def __init__(self, index, trip_count=0, depth=0, 
                 function_name=None, node_name=None):
        super().__init__(index, 'region', function_name)
        self.node_name = node_name
        self.set_feature('trip_count', trip_count)
        self.set_feature('depth', depth)
        self.set_feature('pipeline', 0)
        self.set_feature('loop_flatten', 0)
        self.set_feature('loop_merge', 0)
        self.set_feature('unroll_factor', 0)
        self.set_feature('dataflow', 0)
        self.set_feature('inline', 0)


HeteroGraph = Tuple[
    Dict[NodeType, List[Node]], 
    Dict[EdgeType, List[Tuple[int, int]]]
]


def initialize_graph_structure(
    ir_filepath: str, 
    ir_metadata_filepath: str,
    top_level_function: str
) -> HeteroGraph:
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

    return node_dict, edge_dict


def to_hetero_data(
    node_dict: Dict[NodeType, List[Node]],
    edge_dict: Dict[EdgeType, List[Tuple[int, int]]],
    add_self_loops: bool = True,
    output_path: Optional[str] = None
) -> HeteroData:
    data = HeteroData()
    for nt in NODE_TYPES:
        nodes = node_dict.get(nt, [])
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
        edges = edge_dict.get(et)
        if edges:
            src, dst = zip(*edges)
            src = torch.tensor(src, dtype=torch.long)
            dst = torch.tensor(dst, dtype=torch.long)
            data[et].edge_index = torch.stack([src, dst], dim=0)
        else:
            data[et].edge_index = torch.empty((2, 0), dtype=torch.long)

    if add_self_loops:
        for nt in NODE_TYPES:
            nodes = node_dict.get(nt)
            et = (nt, 'self', nt)
            if nodes:
                src = torch.arange(len(nodes), dtype=torch.long)
                dst = src.clone()
                data[et].edge_index = torch.stack([src, dst], dim=0)
            else:
                data[et].edge_index = torch.empty((2, 0), dtype=torch.long)

    if output_path is not None:
        torch.save(data, output_path)

    return data


def generate_hetero_graph(
    node_dict: Dict[NodeType, List[Node]],
    edge_dict: Dict[EdgeType, List[Tuple[int, int]]],
    dct_tcl_filepath: Optional[str] = None,
    add_self_loops: bool = True,
    output_path: Optional[str] = None
) -> HeteroData:
    if dct_tcl_filepath is not None:
        include_directives(node_dict, dct_tcl_filepath)

    data = to_hetero_data(
        node_dict, edge_dict, 
        add_self_loops=add_self_loops,
        output_path=output_path
    )
    return data


def include_directives(node_dict, dct_tcl_filepath):
    def find_region(node_name, function_name):
        for node in node_dict['region']:
            if node.name == node_name:
                if (node.function_name == function_name
                    or not node.function_name
                    or not function_name):
                    return node
        return None
    
    def find_array(node_name, function_name):
        for nt in ['var', 'const']:
            for node in node_dict[nt]:
                if node.node_name == node_name:
                    if (node.function_name == function_name
                        or not node.function_name
                        or not function_name):
                        return node
        # If not found, search for the array name only
        for nt in ['var', 'const']:
            for node in node_dict[nt]:
                if node.text == node_name:
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
                    factor = max(1, node.features['trip_count'])
                node.features['unroll_factor'] = factor
            else:
                node.features[dct_type] = 1
        else:
            function_name = dct_args.get('location', '')
            array_name = dct_args.get('variable')

            node = find_array(array_name, function_name)
            if node is None:
                print(f"Warning: Node not found for array partition directive with "
                      f"location {function_name} and variable {array_name}")
                continue

            partition_dim = min(int(dct_args.get('dim', 0)), MAX_ARRAY_DIMS)
            node.features['partition_dim'] [partition_dim] = 1

            partition_type = dct_args.get('type', 'complete')
            if partition_type == 'complete':
                node.features['partition_type'][0] = 1
            elif partition_type == 'cyclic':
                node.features['partition_type'][1] = 1
            else:
                node.features['partition_type'][2] = 1

            partition_factor = int(dct_args.get('factor', 0))
            if partition_factor <= 0 or partition_type == 'complete':
                dims = node.features['dimensions']
                if partition_dim == 0:
                    partition_factor = 1
                    for dim in dims:
                        partition_factor *= dim
                else:
                    partition_factor = dims[partition_dim-1]
            node.features['partition_factor'] = max(1, partition_factor)


def find_instruction_metadata(ir_metadata, instruction_id):
    for node in ir_metadata.get('instruction', []):
        if node['id'] == instruction_id:
            return node
    return None
        

def find_variable_metadata(metadata, node_full_text, function_name):
    def is_global_variable(node):
        return (int(node.get('isGlobal', 0)) == 1 and 
                int(node.get('isParam', 0)) == 0)
    
    var_name = node_full_text.split('%')[1]
    if ' ' in var_name:
        var_name = var_name.split(' ')[0]
    var_name = var_name.strip()
    for node in metadata.get('variable', []):
        if node['name'] == var_name:
            if (is_global_variable(node) 
                or node['functionName'] == function_name):
                return node
    return None


def find_global_metadata(metadata, const_name, const_value, function_name):
    if 'internal' in const_value and '.' in const_name:
        function_name, const_name = const_name.split('.')
        for node in metadata.get('variable', []):
            if (int(node.get('isInternalConst', 0)) == 1
                and node['name'] == const_name 
                and node['functionName'] == function_name):
                return node
    else:
        for node in metadata.get('variable', []):
            if (int(node.get('isGlobal', 0)) == 1 
                and node['name'] == const_name):
                return node
    return None


def extract_type_info(node_full_text):
    if '*' in node_full_text:
        type_encoding = TYPE_ENCODING[TypeID.POINTER]
        bitwidth = 64
    elif node_full_text[0] == 'i':
        type_encoding = TYPE_ENCODING[TypeID.INT]
        bitwidth = int(node_full_text[1:])
    elif node_full_text == 'float':
        type_encoding = TYPE_ENCODING[TypeID.FLOAT]
        bitwidth = 32
    elif node_full_text == 'double':
        type_encoding = TYPE_ENCODING[TypeID.DOUBLE]
        bitwidth = 64
    elif node_full_text == 'half':
        type_encoding = TYPE_ENCODING[TypeID.HALF]
        bitwidth = 16
    else: # Placeholder for other types
        type_encoding = TYPE_ENCODING[TypeID.UNKNOWN]
        bitwidth = 0
    return {'type': type_encoding, 'bitwidth': bitwidth}


def parse_array_features(metadata):
    base_type_encoding = TYPE_ENCODING.get(
        int(metadata['baseType']), 
        TYPE_ENCODING[TypeID.UNKNOWN]
    )
    base_bitwidth = int(metadata['baseTypeBitwidth'])

    dims = [
        int(dim) for dim in metadata['dimensions']
    ]
    num_dims = int(metadata['numDims'])
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
        'base_bitwidth': base_bitwidth,
        'dimensions': dims,
        'partition_factor': 0,
        'partition_type': [0, 0, 0],  # complete, cyclic, block
        'partition_dim': [0] * (MAX_ARRAY_DIMS + 1)  # One-hot encoding
    }
    return feature_dict


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
            is_param = int(metadata.get('isParam', 0)) == 1
            is_interface = is_param and function_name == top_level_function
            array_features = None
            if int(metadata.get('isArray', 0)) == 1:
                array_features = parse_array_features(metadata)

            node_index = node_indices['var']
            node_indices['var'] += 1

            node = VariableNode(
                node_index, pgml_id=pgml_node_id,
                var_type=metadata['type'], 
                bitwidth=metadata['bitwidth'],
                node_name=metadata.get('name'),
                function_name=function_name,
                is_global=is_global,
                is_param=is_param,
                is_interface=is_interface,
                array_features=array_features
            )

        elif node_type == 2: # Constant
            array_features = None
            # Check if internal
            if '=' in node_full_text:
                const_name, const_value = node_full_text.split('=')
                const_name = const_name.strip(' @')
                metadata = find_global_metadata(
                    ir_metadata, const_name, const_value, function_name
                )
                if metadata is None:
                    continue
                is_global = int(metadata.get('isGlobal', 0)) == 1
                is_param = int(metadata.get('isParam', 0)) == 1
                is_interface = is_param and function_name == top_level_function
                const_type = metadata['type']
                bitwidth = metadata['bitwidth']
                node_name = metadata.get('name')
                if int(metadata.get('isArray', 0)) == 1:
                    array_features = parse_array_features(metadata)
            else:
                is_global = is_param = is_interface = False
                const_features = extract_type_info(node_full_text)
                const_type = const_features['type']
                bitwidth = const_features['bitwidth']
                node_name = None
                    
            node_index = node_indices['const']
            node_indices['const'] += 1

            node = ConstantNode(
                node_index, pgml_id=pgml_node_id,
                const_type=const_type, 
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

        trip_count = int(region['tripCount'])
        depth = int(region['depth'])
        if int(region['isLoop']) == 1:
            trip_count = max(1, trip_count)
        else:
            trip_count = 0

        node = RegionNode(
            node_index, trip_count=trip_count, 
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
