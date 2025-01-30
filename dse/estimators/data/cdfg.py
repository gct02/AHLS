from typing import List, Dict, Tuple, Union, Optional
from torch.types import Number
from torch_geometric.typing import NodeType

import torch
import programl
import matplotlib.pyplot as plt
import networkx as nx
from torch import Tensor
from pathlib import Path
from torch_geometric.data import HeteroData, Data
from torch_geometric.utils import to_networkx

# "One-hot-like" encoding of the opcodes
_OPCODE_DICT = {
    # Arithmetic
    'add':           [1,0,0,0,0, 0,0,0,0,0,1,0],
    'fadd':          [1,0,0,0,0, 0,0,0,0,0,1,0],
    'sub':           [1,0,0,0,0, 0,0,0,0,1,0,0],
    'fsub':          [1,0,0,0,0, 0,0,0,0,1,0,0],
    'mul':           [1,0,0,0,0, 0,0,0,1,0,0,0],
    'fmul':          [1,0,0,0,0, 0,0,0,1,0,0,0],
    'udiv':          [1,0,0,0,0, 0,0,1,0,0,0,1],
    'sdiv':          [1,0,0,0,0, 0,0,1,0,0,0,0],
    'fdiv':          [1,0,0,0,0, 0,0,1,0,0,0,0],
    'urem':          [1,0,0,0,0, 0,1,0,0,0,0,1],
    'srem':          [1,0,0,0,0, 0,1,0,0,0,0,0],
    'frem':          [1,0,0,0,0, 0,1,0,0,0,0,0],
    'sqrt':          [1,0,0,0,0, 1,0,0,0,0,0,0],
    'fsqrt':         [1,0,0,0,0, 1,0,0,0,0,0,0],

    # Logical
    'shl':           [0,1,0,0,0, 0,0,0,0,0,0,1],
    'lshr':          [0,1,0,0,0, 0,0,0,0,0,1,0],
    'ashr':          [0,1,0,0,0, 0,0,0,0,1,0,0],
    'and':           [0,1,0,0,0, 0,0,0,1,0,0,0],
    'or':            [0,1,0,0,0, 0,0,1,0,0,0,0],
    'xor':           [0,1,0,0,0, 0,1,0,0,0,0,0],
    'icmp':          [0,1,0,0,0, 1,0,0,0,0,0,0],
    'fcmp':          [0,1,0,0,0, 1,0,0,0,0,0,0],

    # Memory
    'alloca':        [0,0,1,0,0, 0,0,0,0,0,0,1],
    'load':          [0,0,1,0,0, 0,0,0,0,0,1,0],
    'store':         [0,0,1,0,0, 0,0,0,0,1,0,0],
    'getelementptr': [0,0,1,0,0, 0,0,0,1,0,0,0],
    'fence':         [0,0,1,0,0, 0,0,1,0,0,0,0],

    # Casts
    'trunc':         [0,0,0,1,0, 0,0,0,0,0,1,0],
    'fptrunc':       [0,0,0,1,0, 0,0,0,0,0,1,0],
    'zext':          [0,0,0,1,0, 0,0,0,0,1,0,1],
    'sext':          [0,0,0,1,0, 0,0,0,0,1,0,0],
    'fptoui':        [0,0,0,1,0, 0,0,0,1,0,0,1],
    'fptosi':        [0,0,0,1,0, 0,0,0,1,0,0,0],
    'uitofp':        [0,0,0,1,0, 0,0,0,1,0,0,1],
    'sitofp':        [0,0,0,1,0, 0,0,0,1,0,0,0],
    'bitcast':       [0,0,0,1,0, 0,0,1,0,0,0,0],
    'ptrtoint':      [0,0,0,1,0, 0,1,0,0,0,0,0],
    'inttoptr':      [0,0,0,1,0, 1,0,0,0,0,0,0],

    # Control flow
    'br':            [0,0,0,0,1, 0,0,0,0,0,0,1],
    'resume':        [0,0,0,0,1, 0,0,0,0,0,1,0],
    'ret':           [0,0,0,0,1, 0,0,0,0,1,0,0],
    'call':          [0,0,0,0,1, 0,0,0,1,0,0,0],
    'phi':           [0,0,0,0,1, 0,0,1,0,0,0,0],
    'select':        [0,0,0,0,1, 0,1,0,0,0,0,0],
}

_INST_FEATURE_SIZE = 20
_VAR_FEATURE_SIZE = 8
_CONST_FEATURE_SIZE = 8
_ARRAY_FEATURE_SIZE = 17

def _retrieve_feature_size(node_type: str) -> int:
    if node_type == 'inst':
        return _INST_FEATURE_SIZE
    elif node_type == 'var':
        return _VAR_FEATURE_SIZE
    elif node_type == 'const':
        return _CONST_FEATURE_SIZE
    else:
        return _ARRAY_FEATURE_SIZE

def _retrieve_loop_depth(md: Dict[str, Number]) -> int:
    if "loopDepth" not in md:
        return 0 # Use 0 for instructions outside loops
    loop_depth = md["loopDepth"]
    return loop_depth

def _retrieve_trip_count(md: Dict[str, Number]) -> int:
    if "tripCount" not in md:
        return 1 # Use 1 for instructions outside loops
    trip_count = md["tripCount"]
    return 1 if trip_count < 1 else trip_count

def _retrieve_pipeline_info(md: Dict[str, Number]) -> List[int]:
    if "pipeline" not in md:
        return [0]
    pipelined = md["pipeline"]
    return [pipelined]

def _retrieve_array_partition_info(md: Dict[str, Number]) -> List[int]:
    if "arrayPartition" not in md:
        return [0] * 7
    dim = md["arrayPartitionDim"]
    partition_type = md["arrayPartitionType"]
    one_hot_partition_type = [0, 0, 0]
    one_hot_partition_type[partition_type - 1] = 1
    factor = md["arrayPartitionFactor"]
    dim_size = md["arrayPartitionDimSize"]
    return [1] + one_hot_partition_type + [dim, factor, dim_size]

def _retrieve_unroll_info(md: Dict[str, Number]) -> List[int]:
    if "unroll" not in md:
        return [0, 0, 0]
    complete = md["unrollComplete"]
    factor = md["unrollFactor"]
    return [1, complete, factor]

def _retrieve_loop_flatten_info(md: Dict[str, Number]) -> List[int]:
    if "loopFlatten" not in md:
        return [0]
    flattened = md["loopFlatten"]
    return [flattened]

def _retrieve_loop_merge_info(md: Dict[str, Number]) -> List[int]:
    if "loopMerge" not in md:
        return [0]
    merged = md["loopMerge"]
    return [merged]

def _retrieve_array_info(md: Dict[str, Number]) -> List[int]:
    return [
        md["numDims"], md["numElements"], 
        md["elementType"], md["elementBitwidth"]
    ]

def _retrieve_bitwidth(md: Dict[str, Number]) -> int:
    return md["bitwidth"]

def _one_hot_encode_instruction(instruction: str) -> List[int]:
    if instruction in _OPCODE_DICT:
        return _OPCODE_DICT[instruction]
    return [0] * 12 # Unknown instruction

def _map_type_to_one_hot(type_id: int) -> List[int]:
    # Note: Arrays are treated separately as another node type
    if type_id == 0: # VoidTyID
        return [1, 0, 0, 0, 0, 0, 0]
    elif type_id <= 6: # Floating point types
        return [0, 1, 0, 0, 0, 0, 0]
    elif type_id == 11: # IntegerTyID
        return [0, 0, 1, 0, 0, 0, 0]
    elif type_id == 9 or type_id == 16: # Vector types
        return [0, 0, 0, 1, 0, 0, 0]
    elif type_id == 15: # PointerTyID
        return [0, 0, 0, 0, 1, 0, 0]
    elif type_id == 7: # LabelTyID
        return [0, 0, 0, 0, 0, 1, 0]
    else: # Other types
        return [0, 0, 0, 0, 0, 0, 1]

def _one_hot_encode_type(md: Dict[str, Number]) -> List[int]:
    type_id = md["type"] if "type" in md else -1
    return _map_type_to_one_hot(type_id)

def _process_metadata_entries(raw_md: Dict[str, str]) -> Dict[str, Number]:
    processed_md = {}
    for key, value in raw_md.items():
        if key == "functionName":
            continue
        if value == "true":
            processed_md[key] = 1
        elif value == "false":
            processed_md[key] = 0
        else:
            try:
                processed_md[key] = int(value)
            except ValueError:
                try:
                    processed_md[key] = float(value)
                except ValueError:
                    processed_md[key] = 0
    return processed_md

def _retrieve_type_id_from_string(
    type_str: str,
    node_full_text: str = ""
) -> int:
    if type_str[-1] == '*':  
        # Pointer type
        return 15
    if '[' in type_str:      
        # Array type
        return 14
    if 'void' in type_str:   
        # Void type
        return 0
    if 'half' in type_str:   
        # 16-bit float type
        return 1
    if 'float' in type_str:  
        # 32-bit float type
        return 2
    if 'double' in type_str: 
        # 64-bit float type
        return 3
    if type_str[0] == 'i':   
        # Int type
        return 11
    if ('vector' in type_str 
        or ('<' in node_full_text 
            and '>' in node_full_text)): 
        # Vector type
        return 9
    # Other types (e.g. struct, label, token, etc.)
    return -1

def _retrieve_bitwidth_from_string(
    type_str: str,
    node_full_text: str = ""
) -> int:
    if type_str[-1] == '*':  
        # Pointer type
        return 0
    if '[' in type_str:      
        # Array type
        n_elems = int(type_str.split('[')[1].split(' x')[0])
        elem_type = type_str.split('x ')[1].split(']')[0]
        elem_bitwidth = _retrieve_bitwidth_from_string(
            elem_type, node_full_text
        )
        return n_elems * elem_bitwidth
    if 'void' in type_str:   
        # Void type
        return 0
    if 'half' in type_str:   
        # 16-bit float type
        return 16
    if 'float' in type_str:  
        # 32-bit float type
        return 32
    if 'double' in type_str: 
        # 64-bit float type
        return 64 
    if type_str[0] == 'i':   
        # Int type
        return int(type_str[1:])
    if ('vector' in type_str 
        or ('<' in node_full_text 
            and '>' in node_full_text)): 
        # Vector type
        n_elems = int(node_full_text.split('<')[1].split(' x')[0])
        elem_type = node_full_text.split('x ')[1].split('>')[0]
        elem_bitwidth = _retrieve_bitwidth(elem_type, elem_type)
        return n_elems * elem_bitwidth
    # Other types (e.g. struct, label, token, etc.)
    return 0

def _retrieve_array_info_from_string(
    type_str: str
) -> List[int]:
    num_dims = type_str.count('[')
    num_elems_last_dim = int(type_str.split('[')[-1].split(' x')[0])
    num_elems = num_dims * num_elems_last_dim

    elem_type = type_str.split('x ')[1].split(']')[0]
    elem_type_id = _retrieve_type_id_from_string(elem_type)
    elem_bitwidth = _retrieve_bitwidth_from_string(elem_type)

    return [num_dims, num_elems, elem_type_id, elem_bitwidth]

def _parse_literal_const_info(
    node_full_text: str
) -> Tuple[List[int], bool]:
    type_str = node_full_text.split(' ')[0]

    type_id = _retrieve_type_id_from_string(type_str, node_full_text)

    if type_id == 14: # Array type
        is_array = True
        array_md = _retrieve_array_info_from_string(node_full_text)
        element_type = array_md[2]
        one_hot_element_type = _one_hot_encode_type(element_type)
        array_partition_md = [0] * 7
        features = (array_md[:2] + one_hot_element_type 
                    + array_md[3:] + array_partition_md)
    else:
        is_array = False
        one_hot_type = _one_hot_encode_type(type_id)
        bitwidth = _retrieve_bitwidth_from_string(type_str, node_full_text)
        features = one_hot_type + [bitwidth]

    return features, is_array

def _build_nodes(
    programl_graph,
    metadata: Dict[str, Dict[str, Dict[str, str]]],
    ir_instructions: Dict[int, str]
) -> Tuple[HeteroData, Dict[str, List[int]]]:
    graph = HeteroData()

    nodes = {'inst': [], 'var': [], 'const': [], 'array': []}
    indices = {'inst': [], 'var': [], 'const': [], 'array': []}

    for i, node in enumerate(programl_graph.node):
        node_type = node.type
        node_text = node.text

        if node_text == "" or node_text == "[external]":
            if node_type == 0:
                nodes['inst'].append(torch.zeros(_INST_FEATURE_SIZE, dtype=torch.float32))
                indices["inst"].append(i)
            elif node_type == 1:
                nodes['var'].append(torch.zeros(_VAR_FEATURE_SIZE, dtype=torch.float32))
                indices["var"].append(i)
            else:
                nodes['const'].append(torch.zeros(_CONST_FEATURE_SIZE, dtype=torch.float32))
                indices["const"].append(i)
            continue

        node_full_text = node.features.feature["full_text"].bytes_list.value.__str__()[1:-1]
        if node_full_text != "":
            node_full_text = node_full_text[2:-1]

        if node.type == 0:
            # Instruction
            if "!ID." not in node_full_text:
                nodes['inst'].append(torch.zeros(_INST_FEATURE_SIZE, dtype=torch.float32))
                indices["inst"].append(i)
                continue

            id = int(node_full_text.split('!ID.')[1].split(' ')[0])
            node_full_text = ir_instructions[id]

            raw_md = metadata["instruction"][str(id)]
            md = _process_metadata_entries(raw_md)

            one_hot_op = _one_hot_encode_instruction(node_text)
            loop_depth = _retrieve_loop_depth(md)
            trip_count = _retrieve_trip_count(md)

            directives = _retrieve_pipeline_info(md) \
                         + _retrieve_unroll_info(md) \
                         + _retrieve_loop_flatten_info(md) \
                         + _retrieve_loop_merge_info(md)

            features = one_hot_op + [loop_depth, trip_count] + directives
            nodes['inst'].append(torch.tensor(features, dtype=torch.float32))
            indices["inst"].append(i)

        elif node.type == 1 or node.type == 2: 
            # Variable or Constant
            is_literal = False

            if node_full_text.startswith('@'): # Global value
                name = node_full_text.split(' ')[0].strip('@')
            else: # Local value
                name = node_full_text.split(' ')[1]
                if name.startswith('%'):
                    name = name.strip('%')
                else:
                    is_literal = True

            if is_literal:
                features, is_array = _parse_literal_const_info(node_full_text)
                if is_array:
                    nodes['array'].append(torch.tensor(features, dtype=torch.float32))
                    indices["array"].append(i)
                else:
                    nodes['const'].append(torch.tensor(features, dtype=torch.float32))
                    indices["const"].append(i)
                continue

            raw_md = metadata["value"][name]
            md = _process_metadata_entries(raw_md)

            if "isArray" in md:
                array_md = _retrieve_array_info(md)
                one_hot_type = _one_hot_encode_type(array_md[2])
                array_partition_md = _retrieve_array_partition_info(md)
                features = (array_md[:2] + one_hot_type + array_md[3:]
                            + array_partition_md)
                nodes['array'].append(torch.tensor(features, dtype=torch.float32))
                indices["array"].append(i)
                continue
            
            one_hot_type = _one_hot_encode_type(md)
            bitwidth = _retrieve_bitwidth(md)

            features = one_hot_type + [bitwidth]

            if node.type == 1: 
                # Variable
                nodes['var'].append(torch.tensor(features, dtype=torch.float32))
                indices["var"].append(i)
            else: 
                # Constant
                nodes['const'].append(torch.tensor(features, dtype=torch.float32))
                indices["const"].append(i)

    for key in nodes.keys():
        if len(nodes[key]) > 0:
            graph[key].x = torch.stack(nodes[key])
        else:
            feature_dim = _retrieve_feature_size(key)
            graph[key].x = torch.empty((0, feature_dim), dtype=torch.float32)

    return graph, indices

def _build_edge_tensor(src: int, dst: int) -> Tensor:
    return torch.tensor([src, dst], dtype=torch.int64)

def _build_edges(
    programl_graph,
    graph: HeteroData,
    indices: Dict[str, List[int]]
) -> HeteroData:
    edges = {
        ('inst','control','inst'): [], 
        ('inst','call','inst'): [], 
        ('inst','data','var'): [],
        ('var','data','inst'): [], 
        ('const','data','inst'): [],
        ('array','data','inst'): [],
        ('inst', 'data', 'array'): [],
        ('inst','id','inst'): [], 
        ('var','id','var'): [],
        ('const','id','const'): [],
        ('array','id','array'): []
    }
    
    for edge in programl_graph.edge:
        src = edge.source
        dst = edge.target
        src_type = programl_graph.node[src].type
        dst_type = programl_graph.node[dst].type

        if src_type == 0: 
            # src is 'inst'
            src_idx = indices["inst"].index(src)
            if dst_type == 0: 
                # dst is 'inst'
                dst_idx = indices["inst"].index(dst)
                edge_tensor = _build_edge_tensor(src_idx, dst_idx)
                if edge.flow == 0:
                    edges[('inst','control','inst')].append(edge_tensor)
                else:
                    edges[('inst','call','inst')].append(edge_tensor)
            elif dst in indices["array"]: 
                # dst is 'array'
                dst_idx = indices["array"].index(dst)
                edge_tensor = _build_edge_tensor(src_idx, dst_idx)
                edges[('inst', 'data', 'array')].append(edge_tensor)
            else:
                # dst is 'var'
                dst_idx = indices["var"].index(dst)
                edge_tensor = _build_edge_tensor(src_idx, dst_idx)
                edges[('inst','data','var')].append(edge_tensor)
        elif src_type == 1:
            if src in indices["array"]:
                # src is 'array'
                src_idx = indices["array"].index(src)
                dst_idx = indices["inst"].index(dst)
                edge_tensor = _build_edge_tensor(src_idx, dst_idx)
                edges[('array','data','inst')].append(edge_tensor)
            else:
                # src is 'var'
                src_idx = indices["var"].index(src)
                dst_idx = indices["inst"].index(dst)
                edge_tensor = _build_edge_tensor(src_idx, dst_idx)
            edges[('var','data','inst')].append(edge_tensor)
        elif src in indices["array"]:
            # src is 'array'
            src_idx = indices["array"].index(src)
            dst_idx = indices["inst"].index(dst)
            edge_tensor = _build_edge_tensor(src_idx, dst_idx)
            edges[('array','data','inst')].append(edge_tensor)
        else:
            # src is 'const'
            src_idx = indices["const"].index(src)
            dst_idx = indices["inst"].index(dst)
            edge_tensor = _build_edge_tensor(src_idx, dst_idx)
            edges[('const','data','inst')].append(edge_tensor)

    n_inst = len(indices["inst"])
    for i in range(n_inst):
        edge_tensor = _build_edge_tensor(i, i)
        edges[('inst','id','inst')].append(edge_tensor)

    n_var = len(indices["var"])
    for i in range(n_var):
        edge_tensor = _build_edge_tensor(i, i)
        edges[('var','id','var')].append(edge_tensor)

    n_const = len(indices["const"])
    for i in range(n_const):
        edge_tensor = _build_edge_tensor(i, i)
        edges[('const','id','const')].append(edge_tensor)

    n_array = len(indices["array"])
    for i in range(n_array):
        edge_tensor = _build_edge_tensor(i, i)
        edges[('array','id','array')].append(edge_tensor)

    for edge_type, edge_list in edges.items():
        if len(edge_list) > 0:
            graph[edge_type].edge_index = torch.stack(edge_list).transpose(0, 1)
        else:
            graph[edge_type].edge_index = torch.empty((2, 0), dtype=torch.int64)

    return graph

def _parse_md_file(metadata_path: Path) -> Dict[str, Dict[str, Dict[str, str]]]:
    # The format of the metadata file is as follows:
    # <node_type_1>:
    #   <node_name_1>:
    #     <metadata_name_1>: <metadata_value_1>
    #     <metadata_name_2>: <metadata_value_2>
    #     ...
    #   <node_name_2>:
    #   ...
    # <node_type_2>:
    # ...
    with open(metadata_path, 'r') as f:
        lines = f.readlines()

    node_type, node_name = None, None
    metadata = {}
    for line in lines:
        if line.startswith('    '):
            if node_name is None:
                continue
            if node_name not in metadata[node_type]:
                metadata[node_type][node_name] = {}
            metadata_name, metadata_value = line.strip().split(': ')
            metadata[node_type][node_name][metadata_name] = metadata_value
        elif line.startswith('  '):
            node_name = line.strip(": \n")
        else:
            node_type = line.strip(": \n")
            metadata[node_type] = {}

    return metadata

def build_cdfg(
    ir_path: Path,
    metadata_path: Path,
) -> HeteroData:
    with open(ir_path, 'r') as ir_file:
        ir_text = ir_file.read()

    programl_cdfg = programl.from_llvm_ir(ir_text)

    ir_lines = ir_text.split('\n')
    ir_instructions = {}
    for line in ir_lines:
        if "!ID" in line:
            instruction_id = int(line.split('!ID.')[1].split(' ')[0])
            ir_instructions[instruction_id] = line

    metadata = _parse_md_file(metadata_path)

    cdfg, node_indices = _build_nodes(programl_cdfg, metadata, ir_instructions)
    cdfg = _build_edges(programl_cdfg, cdfg, node_indices)

    return cdfg

def plot_cdfg(
    cdfg: Union[HeteroData, Data],
    output_path: Optional[Path] = None
) -> None:
    def get_short_type(node_type: NodeType) -> str:
        if node_type == 'inst':
            return 'I'
        elif node_type == 'var':
            return 'V'
        elif node_type == 'const':
            return 'C'
        elif node_type == 'array':
            return 'A'
        else:
            return 'U'
        
    def get_label(type: NodeType, idx: int) -> str:
        return f"{get_short_type(type)}{idx}"

    nx_cdfg = to_networkx(
        cdfg, remove_self_loops=True,
        to_undirected=False, node_attrs=['x']
    )

    # Define colors for the nodes
    node_type_colors = {
        "inst": "#EA801C",
        "var": "#3C99E6",
        "const": "#954CD9",
        "array": "#6DED8F",
    }

    node_colors = []
    labels = {}
    for node, attrs in nx_cdfg.nodes(data=True):
        node_type = attrs["type"]
        color = node_type_colors[node_type]
        node_colors.append(color)
        labels[node] = get_label(node_type, node)

    # Define colors for the edges
    edge_type_colors = {
        ('inst','control','inst'): "#CF2519",
        ('inst','call','inst'): "#8F19CF",
        ('inst','data','var'): "#1F1F1F",
        ('var','data','inst'): "#1F1F1F",
        ('const','data','inst'): "#1F1F1F",
        ('array','data','inst'): "#1F1F1F",
        ('inst', 'data', 'array'): "#1F1F1F",
        ('inst','id','inst'): "#FFFFFF",
        ('var','id','var'): "#FFFFFF",
        ('const','id','const'): "#FFFFFF",
        ('array','id','array'): "#FFFFFF",
    }

    edge_colors = []
    for from_node, to_node, attrs in nx_cdfg.edges(data=True):
        edge_type = attrs["type"]
        color = edge_type_colors[edge_type]
        nx_cdfg.edges[from_node, to_node]["color"] = color
        edge_colors.append(color)

    # Draw the graph
    pos = nx.kamada_kawai_layout(nx_cdfg)
    nx.draw_networkx(
        nx_cdfg,
        pos=pos,
        labels=labels,
        with_labels=True,
        node_color=node_colors,
        edge_color=edge_colors,
        node_size=60,
        width=0.7,
        font_size=9
    )
    plt.axis("off")
    if output_path is not None:
        plt.savefig(output_path)
    else:
        plt.show()
    plt.close()

def print_cdfg(
    cdfg: HeteroData,
    output_path: Optional[Path] = None
) -> None:
    cdfg_dict = cdfg.to_dict()
    if output_path is not None:
        with open(output_path, "w") as f:
            f.write(str(cdfg_dict))
    else:
        print(cdfg_dict)

if __name__ == "__main__":
    # *** For debugging *** #
    from sys import argv

    ir_path = Path(argv[1])
    metadata_path = Path(argv[2])
    output_path = Path(argv[3])

    with open(ir_path, 'r') as ir_file:
        ir_text = ir_file.read()

    programl_cdfg = programl.from_llvm_ir(ir_text)
    cdfg = build_cdfg(ir_path, metadata_path)

    cdfg_dict = cdfg.to_dict()

    with open(output_path, "w") as f:
        f.write(str(cdfg_dict))