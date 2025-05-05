import json
from collections import defaultdict
from typing import Optional

import torch
import matplotlib.pyplot as plt
from torch_geometric.data import HeteroData

from gnn.data.utils.parsers import parse_tcl_directives
from gnn.data.utils.llvm_defs import (
    TYPE_ENCODING, TYPE_ENCODING_SIZE, OP_ENCODING, OP_ENCODING_SIZE,
    MAX_ARRAY_DIMS, TypeID, Opcode
)


NODE_TYPES = ['instr', 'var', 'const', 'array', 'region']

EDGE_TYPES = [
    # Data flow
    ('instr', 'data', 'var'),
    ('var', 'data', 'instr'),
    ('instr', 'data', 'array'),
    ('array', 'data', 'instr'),
    ('const', 'data', 'instr'),

    # Control flow
    ('instr', 'control', 'instr'),

    # Call flow
    ('instr', 'call', 'instr'),

    # Loop and function hierarchy
    ('region', 'hrchy', 'region'),
    ('region', 'hrchy', 'instr'),
] + [
    # Self-loops
    (nt, 'self', nt) for nt in NODE_TYPES
]

METADATA = (NODE_TYPES, EDGE_TYPES)

INSTR_FEATURE_DIMS = 13
VAR_FEATURE_DIMS = 7
CONST_FEATURE_DIMS = 7
ARRAY_FEATURE_DIMS = 21
REGION_FEATURE_DIMS = 8

NODE_FEATURE_DIMS = {
    'instr': INSTR_FEATURE_DIMS,
    'var': VAR_FEATURE_DIMS,
    'const': CONST_FEATURE_DIMS,
    'array': ARRAY_FEATURE_DIMS,
    'region': REGION_FEATURE_DIMS
}

DIRECTIVES = [
    'pipeline', 'unroll', 'loop_flatten', 
    'loop_merge', 'array_partition',
    'dataflow', 'inline'
]


class Node:
    def __init__(
        self, index, node_type, 
        programl_id=None, ir_id=None,
        text=None, full_text=None,
        function_id=None, function_name=None, 
        features=None
    ):
        self.index = index
        self.type = node_type
        self.programl_id = programl_id
        self.ir_id = ir_id
        self.text = text
        self.full_text = full_text
        self.function_id = function_id
        self.function_name = function_name
        self.features = features if features is not None else {}

    def set_feature(self, key, value):
        self.features[key] = value

    def get_feature(self, key):
        return self.features.get(key, None)

    def __repr__(self):
        return f"Node({self.type}, {self.index}, {self.text}, {self.function_id})"


def build_graph(
    llvm_ir_path: str, metadata_path: str, 
    add_self_loops: bool = True,
    directive_file_path: Optional[str] = None,
    output_path: Optional[str] = None
) -> HeteroData:
    import programl

    with open(metadata_path, 'r') as f:
        metadata = json.load(f)

    with open(llvm_ir_path, 'r') as f:
        programl_graph = programl.from_llvm_ir(f.read())

    programl_graph_json = programl.to_json(programl_graph)

    programl_nodes = programl_graph_json.get('nodes', [])
    programl_edges = programl_graph_json.get('links', [])
    functions = []
    for function in programl_graph_json.get('graph', {}).get('function', []):
        functions.append(function['name'])

    nodes, hrchy_edge_dict = build_nodes(programl_nodes, metadata, functions)

    if directive_file_path is not None:
        include_directives(nodes, directive_file_path)

    edge_dict = build_edges(programl_edges, nodes)

    for et, edges in hrchy_edge_dict.items():
        if et not in edge_dict:
            edge_dict[et] = []
        edge_dict[et].extend(edges)

    hetero_data = HeteroData()
    for nt in NODE_TYPES:
        node_feature_list = []
        for node in nodes[nt]:
            feature_vector = []
            for feature in node.features.values():
                if not isinstance(feature, list):
                    feature_vector.append(feature)
                else:
                    feature_vector.extend(feature)
            feature_vector = torch.tensor(feature_vector, dtype=torch.float)
            node_feature_list.append(feature_vector)

        if len(node_feature_list) > 0:
            hetero_data[nt].x = torch.stack(node_feature_list).contiguous()
        else:
            hetero_data[nt].x = torch.empty((0, NODE_FEATURE_DIMS[nt]), dtype=torch.float)

        hetero_data[nt].num_nodes = hetero_data[nt].x.size(0)
        hetero_data[nt].label = [n.text for n in nodes[nt]]

    for et in EDGE_TYPES:
        if et[1] == 'self' and add_self_loops:
            hetero_data[et] = torch.arange(
                hetero_data[et[0]].num_nodes, dtype=torch.long
            ).view(1, -1).repeat(2, 1)
        else:
            edge_index = edge_dict.get(et, [])
            if len(edge_index) > 0:
                edge_index = torch.stack(
                    [torch.tensor(e, dtype=torch.long) for e in edge_index]
                ).t().contiguous()
                hetero_data[et].edge_index = edge_index
                hetero_data[et].num_edges = edge_index.size(1)
            else:
                hetero_data[et].edge_index = torch.empty((2, 0), dtype=torch.long)
                hetero_data[et].num_edges = 0

    if output_path is not None:
        torch.save(hetero_data, output_path)

    return hetero_data


def include_directives(nodes, directive_file_path):
    def find_region(node_name, function_name):
        for node in nodes['region']:
            if (not node_name or node.text == node_name) and \
               (not function_name or node.function_name == function_name):
                return node
        return None
    
    def find_array(node_name, function_name):
        for node in nodes['array']:
            if node.text == node_name:
                if not node.function_name or node.function_name == function_name:
                    return node
        return None
    
    directives = parse_tcl_directives(directive_file_path)

    for directive_type, directive_args in directives:
        if directive_type not in DIRECTIVES:
            continue
        if directive_type != 'array_partition':
            location = directive_args.get('location')
            if location is None:
                continue
            if '/' in location:
                function_name, region_name = location.split('/')
            else:
                function_name, region_name = location, ''

            node = find_region(region_name, function_name)
            if node is None:
                print(f"Warning: Node not found for {directive_type} directive with location {location}")
                continue

            if directive_type == 'unroll':
                factor = int(directive_args.get('factor', 0))
                if factor <= 0:
                    factor = max(1, node.features['trip_count'])
                node.features['unroll'] = 1
                node.features['unroll_factor'] = factor
            elif directive_type == 'pipeline' and 'off' in directive_args:
                node.features['pipeline_off'] = 1
            elif directive_type == 'loop_flatten' and 'off' in directive_args:
                node.features['loop_flatten_off'] = 1
            else:
                node.features[directive_type] = 1
            
        else:
            function_name = directive_args.get('location', '')
            array_name = directive_args.get('variable')
            node = find_array(array_name, function_name)
            if node is None:
                print(f"Warning: Node not found for array partition directive with "
                      f"location {function_name} and variable {array_name}")
                continue

            partition_dim = min(int(directive_args.get('dim', 0)),
                                MAX_ARRAY_DIMS)
            partition_dim_encoding = [0] * (MAX_ARRAY_DIMS + 1)
            partition_dim_encoding[partition_dim] = 1

            partition_type = directive_args.get('type', 'complete')
            if partition_type == 'complete':
                partition_type_encoding = [1, 0, 0]
            elif partition_type == 'cyclic':
                partition_type_encoding = [0, 1, 0]
            else:
                partition_type_encoding = [0, 0, 1]

            partition_factor = int(directive_args.get('factor', 0))
            if partition_factor <= 0:
                array_dims = node.features['dims']
                if partition_dim == 0:
                    partition_factor = array_dims[0]
                    for dim in array_dims[1:]:
                        partition_factor *= dim
                else:
                    partition_factor = array_dims[partition_dim-1]
            partition_factor = max(1, partition_factor)

            node.features['partition_factor'] = partition_factor
            node.features['partition_dim'] = partition_dim_encoding
            node.features['partition_type'] = partition_type_encoding


def get_instruction_metadata(
    metadata, function_name, 
    node_id=None, node_full_text=None
):
    if node_id is None:
        if node_full_text is None or '=' not in node_full_text:
            return None
        key = 'name'
        query = node_full_text.split('=')[0].strip(' %@')
    else:
        key = 'id'
        query = node_id
    
    for node in metadata['instruction']:
        if node['functionName'] == function_name and node[key] == query:
            return node
    return None
        

def get_variable_metadata(metadata, function_name, node_full_text):
    var_name = node_full_text.split('%')[1]
    if ' ' in var_name:
        var_name = var_name.split(' ')[0]
    var_name = var_name.strip()
    for entity_type in ['port', 'variable']:
        for node in metadata.get(entity_type, []):
            is_global = int(node.get('isGlobal', 0)) == 1
            is_param = int(node.get('isParam', 0)) == 1
            if is_global and not is_param:
                if node['name'] == var_name:
                    return node
            else:
                if node['functionName'] == function_name and node['name'] == var_name:
                    return node
    return None


def get_internal_constant_metadata(metadata, function_name, const_name):
    for node in metadata.get('variable', []):
        if node['functionName'] == function_name and node['name'] == const_name:
            return node
    return None


def get_const_node_features(node_text):
    if '*' in node_text:
        type_encoding = TYPE_ENCODING[TypeID.POINTER]
        bitwidth = 0
    elif node_text[0] == 'i':
        type_encoding = TYPE_ENCODING[TypeID.INT]
        bitwidth = int(node_text[1:])
    elif node_text == 'float':
        type_encoding = TYPE_ENCODING[TypeID.FLOAT]
        bitwidth = 32
    elif node_text == 'double':
        type_encoding = TYPE_ENCODING[TypeID.DOUBLE]
        bitwidth = 64
    elif node_text == 'half':
        type_encoding = TYPE_ENCODING[TypeID.HALF]
        bitwidth = 16
    else: # Placeholder for other types
        type_encoding = TYPE_ENCODING[TypeID.VOID]
        bitwidth = 0
    return {'type': type_encoding, 'bitwidth': bitwidth}


def build_nodes(programl_nodes, metadata, functions):
    def create_variable_node(
        nodes, node_indices, node_metadata,
        programl_id, function_id, function_name,
        node_name, full_text
    ):
        is_array = int(node_metadata.get('isArray', 0)) == 1
        if is_array:
            node_index = node_indices['array']
            node_indices['array'] += 1

            base_type = int(node_metadata['baseType'])
            type_encoding = TYPE_ENCODING.get(base_type, [0] * TYPE_ENCODING_SIZE)

            base_bitwidth = int(node_metadata['baseTypeBitwidth'])
            n_dims = int(node_metadata['numDims'])

            dims = [int(dim) for dim in node_metadata['dimensions']]
            if n_dims > MAX_ARRAY_DIMS:
                n_dims = MAX_ARRAY_DIMS
                remaining_dims = dims[n_dims-1:]
                remaining_size = 1
                for dim in remaining_dims:
                    remaining_size *= dim
                dims = dims[:n_dims-1] + [remaining_size]
            elif n_dims < MAX_ARRAY_DIMS:
                dims += [0] * (MAX_ARRAY_DIMS - n_dims)
            
            features = {
                'type': type_encoding,
                'bitwidth': base_bitwidth,
                'n_dims': n_dims,
                'dims': dims,
                'partition_factor': 1,
                'partition_dim': [0] * (MAX_ARRAY_DIMS + 1),
                'partition_type': [0, 0, 0]
            }
            nodes['array'].append(Node(
                node_index, 'array', 
                programl_id=programl_id, 
                text=node_name, 
                full_text=full_text, 
                function_id=function_id, 
                function_name=function_name,
                features=features
            ))
        else:
            node_index = node_indices['var']
            node_indices['var'] += 1

            var_type = int(node_metadata['type'])
            bitwidth = int(node_metadata['bitwidth'])
            type_encoding = TYPE_ENCODING.get(var_type, TYPE_ENCODING[TypeID.VOID])

            nodes['var'].append(Node(
                node_index, 'var', 
                programl_id=programl_id,
                text=node_name, 
                full_text=full_text, 
                function_id=function_id, 
                function_name=function_name,
                features={'type': type_encoding, 'bitwidth': bitwidth}
            ))

    nodes = defaultdict(list)
    node_indices = defaultdict(int)
    hrchy_edges = {
        ('region', 'hrchy', 'region'): [], 
        ('region', 'hrchy', 'instr'): []
    }
    ir_id_index_map = {"instr": {}, "region": {}}

    for node in programl_nodes:
        if (text := node['text']) == '[external]':
            continue
        full_text = node['features']['full_text'][0]
        programl_id = int(node['id'])
        function_id = int(node['function'])
        function_name = functions[function_id]
        node_type = int(node['type'])

        if node_type == 0: # Instruction
            if '!id.' not in full_text:
                continue
            ir_instr_id = full_text.split('!id.')[1]
            if ' ' in ir_instr_id:
                ir_instr_id = ir_instr_id.split(' ')[0]
            
            ir_instr_id = int(ir_instr_id.strip())

            node_metadata = get_instruction_metadata(
                metadata, function_name, ir_instr_id, full_text
            )
            if node_metadata is None:
                continue

            opcode = int(node_metadata['opcode'])
            opcode = OP_ENCODING.get(opcode, [0] * OP_ENCODING_SIZE)

            node_index = node_indices['instr']
            node_indices['instr'] += 1
            ir_id_index_map['instr'][ir_instr_id] = node_index

            nodes['instr'].append(Node(
                node_index, 'instr', 
                programl_id=programl_id, 
                ir_id=ir_instr_id,
                text=text, 
                full_text=full_text, 
                function_id=function_id, 
                function_name=function_name, 
                features={'opcode': opcode}
            ))

        elif node_type == 1: # Variable
            node_metadata = get_variable_metadata(metadata, function_name, full_text)
            if node_metadata is None:
                continue

            function_name = node_metadata.get('functionName')
            node_name = node_metadata.get('name')
            create_variable_node(
                nodes, node_indices, node_metadata,
                programl_id, function_id, function_name,
                node_name, full_text
            )

        elif node_type == 2: # Constant
            # Check if internal
            if '=' in full_text:
                const_name, const_value = full_text.split('=')
                const_name = const_name.strip(' @')
                if 'internal' in const_value:
                    function_name, const_name = const_name.split('.')
                    function_id = functions.index(function_name)
                    node_metadata = get_internal_constant_metadata(
                        metadata, function_name, const_name
                    )
                    if node_metadata is not None:
                        create_variable_node(
                            nodes, node_indices, node_metadata,
                            programl_id, function_id, function_name,
                            const_name, full_text
                        )
                        continue
                else:
                    node_metadata = None
                    for entry in metadata.get('variable', []):
                        if entry['name'] == const_name:
                            node_metadata = entry
                            break
                    function_name = node_metadata.get('functionName', '')
                    if node_metadata is not None:
                        create_variable_node(
                            nodes, node_indices, node_metadata,
                            programl_id, function_id, function_name,
                            const_name, full_text
                        )
                        continue

            node_index = node_indices['const']
            node_indices['const'] += 1
            features = get_const_node_features(text)
            nodes['const'].append(Node(
                node_index, 'const', 
                programl_id=programl_id,
                text=text, 
                full_text=full_text, 
                function_id=function_id,
                function_name=function_name,
                features=features
            ))

    regions = metadata.get('region', [])

    for region in regions:
        node_index = node_indices['region']
        node_indices['region'] += 1

        ir_region_id = int(region['id'])
        ir_id_index_map['region'][ir_region_id] = node_index

        is_loop = int(region['isLoop'])
        trip_count = int(region['tripCount'])
        depth = int(region['depth'])

        features = {
            'is_loop': is_loop,
            'trip_count': trip_count,
            'depth': depth,
            'pipeline': 0,
            'pipeline_off': 0,
            'loop_flatten': 0,
            'loop_flatten_off': 0,
            'loop_merge': 0,
            'unroll': 0,
            'unroll_factor': 1,
            'dataflow': 0,
            'inline': 0
        }
        name = region.get('name')
        function_id = int(region.get('functionID', -1))
        function_name = region.get('functionName')

        nodes['region'].append(Node(
            node_index, 'region',
            ir_id=ir_region_id,
            text=name, 
            full_text=name, 
            function_id=function_id, 
            function_name=function_name, 
            features=features
        ))

    # Ensure that regions with higher IDs are processed first
    regions.sort(key=lambda x: int(x['id']), reverse=True)
    instrs_seen = set()

    for region in regions:
        ir_region_id = int(region['id'])
        node_index = ir_id_index_map['region'].get(ir_region_id)
        if node_index is None:
            continue

        for sub_region_id in region['subRegions']:
            sub_region_index = ir_id_index_map['region'].get(sub_region_id)
            if sub_region_index is None:
                continue
            hrchy_edges[('region', 'hrchy', 'region')].append(
                [node_index, sub_region_index]
            )
        for instr_id in region['instructions']:
            if instr_id in instrs_seen:
                continue
            instrs_seen.add(instr_id)
            instr_index = ir_id_index_map['instr'].get(instr_id)
            if instr_index is None:
                continue
            hrchy_edges[('region', 'hrchy', 'instr')].append(
                [node_index, instr_index]
            )
        
    return nodes, hrchy_edges


def build_edges(programl_edges, nodes):
    def find_node(programl_id):
        for nt in ['instr', 'var', 'const', 'array']:
            for node in nodes[nt]:
                if node.programl_id == programl_id:
                    return node
        return None

    edge_dict = defaultdict(list)

    for edge in programl_edges:
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

        edge_dict[(src.type, flow, dst.type)].append(
            [src.index, dst.index]
        )
        
    return edge_dict


def plot_graph(hetero_data, plot_types=['full'], batched=False):
    import networkx as nx
    from torch_geometric.utils import to_networkx
    from matplotlib.lines import Line2D
    from matplotlib.patches import Patch

    node_colors = {
        "instr": "#2489d0",
        "var": "#1fbfa2",
        "const": "#8e6df0",
        "array": "#c79037",
        "region": "#c65551"
    }
    edge_colors = {
        "data": "#0d7ca1",
        "control": "#08924b",
        "call": "#9148e4",
        "hrchy": "#5c5f63"
    }

    def plot(plot_type):
        if plot_type == "full":
            ntypes = NODE_TYPES
            etypes = [et for et in EDGE_TYPES if et[1] != "self"]
        elif plot_type == "call":
            ntypes = ["instr"]
            etypes = [et for et in EDGE_TYPES if et[1] == "call"]
        elif plot_type == "control":
            ntypes = ["instr"]
            etypes = [et for et in EDGE_TYPES if et[1] == "control"]
        elif plot_type == "data":
            ntypes = ["instr", "const", "var", "array"]
            etypes = [et for et in EDGE_TYPES if et[1] == "data"]
        elif plot_type == "hrchy":
            ntypes = ["instr", "region"]
            etypes = [et for et in EDGE_TYPES if et[1] == "hrchy"]
        else:
            raise ValueError(f"Unknown plot_type: {plot_type}")

        data_trans = HeteroData()
        for nt, x in hetero_data.x_dict.items():
            if nt not in ntypes:
                data_trans[nt].x = torch.empty((0, NODE_FEATURE_DIMS[nt]), dtype=torch.float32)
            else:
                data_trans[nt].x = x

            data_trans[nt].label = hetero_data[nt].label

        for et, edge_index in hetero_data.edge_index_dict.items():
            if et not in etypes:
                data_trans[et].edge_index = torch.empty((2, 0), dtype=torch.long)
            else:
                data_trans[et].edge_index = edge_index

        G = to_networkx(data_trans, remove_self_loops=True, node_attrs=['x', 'label'])
        
        ncolors, nlabels = [], {}
        for node, attrs in G.nodes(data=True):
            nt = attrs.get("type")
            if nt is None or nt not in ntypes:
                continue
            ncolors.append(node_colors[nt])
            nlabels[node] = attrs["label"]

        ecolors = []
        for src, dst, attrs in G.edges(data=True):
            et = attrs.get("type")
            if et is None or et not in etypes:
                continue
            ecolor = edge_colors[et[1]]
            ecolors.append(ecolor)
            G.edges[src, dst]["color"] = ecolor

        node_legend = [Patch(color=color, label=nt) for nt, color in node_colors.items()]
        edge_legend = [
            Line2D([0], [0], color=color, lw=2, label=et)
            for et, color in edge_colors.items()
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

    if not isinstance(plot_types, list):
        plot_types = [plot_types]

    for plot_type in plot_types:
        plot(plot_type)


if __name__ == '__main__':
    import subprocess
    from pathlib import Path
    from os import environ
    from sys import exit, argv

    try:
        DSE_LIB = environ['DSE_LIB']
        OPT = environ['OPT']
        CLANG = environ['CLANG']
        LLVM_LINK = environ['LLVM_LINK']
    except KeyError as error:
        print(f"Error: environment variable {error.args[0]} not defined.")
        exit(1)

    def run_opt(src_path: Path, dst_path: Path, opt_args: Path, output_ll=True):
        try:
            if output_ll:
                opt_args += " -S"
            subprocess.check_output(
                f"{OPT} -load {DSE_LIB} {opt_args} < {src_path.as_posix()} > {dst_path.as_posix()};", 
                shell=True, stderr=subprocess.STDOUT
            )
        except subprocess.CalledProcessError as e:
            print(f"Error processing {src_path}: {e}")
            dst_path.unlink(missing_ok=True)
            raise e

    def process_ir(src_path: Path, dst_path: Path, metadata_path: Path):
        tmp1 = src_path.parent / "tmp1.ll"
        tmp2 = src_path.parent / "tmp2.ll"
        default_clean = "-lowerswitch -lowerinvoke -indirectbr-expand" 
        default_opt = "-mem2reg -indvars -loop-simplify -scalar-evolution"
        try:
            run_opt(src_path, tmp1, default_clean)
            run_opt(tmp1, tmp2, "-clear-intrinsics")
            run_opt(tmp2, tmp1, default_opt)
            run_opt(tmp1, tmp2, "-assign-ids")
            subprocess.check_output(
                f"{OPT} -load {DSE_LIB} -extract-md -out {metadata_path.as_posix()} < {tmp2.as_posix()};", 
                shell=True, stderr=subprocess.STDOUT
            )
            run_opt(tmp2, dst_path, "-debugify -strip-debug")
        except subprocess.CalledProcessError as e:
            print(f"Error processing {src_path}: {e}")
            tmp1.unlink(missing_ok=True)
            tmp2.unlink(missing_ok=True)
            dst_path.unlink(missing_ok=True)
            metadata_path.unlink(missing_ok=True)
            raise e
        finally:
            tmp1.unlink(missing_ok=True)
            tmp2.unlink(missing_ok=True)

    ir_path = Path(argv[1])
    transformed_ir_path = ir_path.parent / "transformed.ll"
    metadata_path = ir_path.parent / "metadata.json"

    try:
        process_ir(ir_path, transformed_ir_path, metadata_path)
    except Exception as e:
        print(f"Error processing {ir_path}: {e}")
        exit(1)

    if len(argv) > 2:
        directive_file_path = Path(argv[2])
        if not directive_file_path.exists():
            print(f"Error: Directive file {directive_file_path} does not exist.")
            exit(1)
    else:
        directive_file_path = None

    hetero_data = build_graph(
        transformed_ir_path, metadata_path, 
        directive_file_path=directive_file_path,
        output_path=ir_path.parent / "graph.pt"
    )
    print(hetero_data)

    plot_graph(
        hetero_data, 
        plot_types=['full', 'data', 'control', 'call', 'hrchy']
    )
