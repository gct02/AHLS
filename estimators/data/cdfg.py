from typing import List, Dict, Tuple, Union, Optional
from torch.types import Number

import builtins
import torch
import matplotlib.pyplot as plt
from pathlib import Path
from enum import Enum
from torch import Tensor
from torch_geometric.typing import NodeType
from torch_geometric.data import HeteroData, Data
from torch_geometric.utils import to_networkx

NODE_TYPES = ['inst', 'var', 'const', 'array', 'bb', 'func']
EDGE_TYPES = [
    ('inst', 'prec', 'inst'), ('inst', 'succ', 'inst'), ('inst', 'calls', 'inst'),
    ('inst', 'called_by', 'inst'), ('inst', 'uses', 'var'), ('inst', 'prod', 'var'),
    ('inst', 'uses', 'array'), ('inst', 'uses', 'const'), ('inst', 'belongs_to', 'bb'), 
    ('inst', 'belongs_to', 'func'), ('inst', 'id', 'inst'), ('var', 'used_by', 'inst'), 
    ('var', 'prod_by', 'inst'), ('var', 'id', 'var'), ('const', 'used_by', 'inst'), 
    ('const', 'id', 'const'), ('array', 'used_by', 'inst'), ('array', 'id', 'array'), 
    ('bb', 'contains', 'inst'), ('bb', 'belongs_to', 'func'), ('bb', 'prec', 'bb'), 
    ('bb', 'succ', 'bb'), ('bb', 'id', 'bb'), ('func', 'contains', 'bb'),
    ('func', 'contains', 'inst'), ('func', 'calls', 'func'), ('func', 'called_by', 'func'), 
    ('func', 'id', 'func')
]
METADATA = (NODE_TYPES, EDGE_TYPES)

INST_FEATURE_SIZE = 12
VAR_FEATURE_SIZE = 7
CONST_FEATURE_SIZE = 7
ARRAY_FEATURE_SIZE = 16
BB_FEATURE_SIZE = 8
FUNCTION_FEATURE_SIZE = 2

FEATURE_SIZE_PER_NODE_TYPE = {
    'inst': INST_FEATURE_SIZE,
    'var': VAR_FEATURE_SIZE,
    'const': CONST_FEATURE_SIZE,
    'array': ARRAY_FEATURE_SIZE,
    'bb': BB_FEATURE_SIZE,
    'func': FUNCTION_FEATURE_SIZE
}

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

class NodeType(builtins.int, Enum):
    INST = 0
    VAR = 1
    CONST = 2
    ARRAY = 3
    BB = 4
    FUNC = 5

# Type IDs from LLVM 7.0
class TypeID(builtins.int, Enum):
    VoidTyID = 0        # type with no size
    HalfTyID = 1        # 16-bit floating point type
    FloatTyID = 2       # 32-bit floating point type
    DoubleTyID = 3      # 64-bit floating point type
    X86_FP80TyID = 4    # 80-bit floating point type (X87)
    FP128TyID = 5       # 128-bit floating point type (112-bit mantissa)
    PPC_FP128TyID = 6   # 128-bit floating point type (two 64-bits, PowerPC)
    LabelTyID = 7       # Labels
    MetadataTyID = 8    # Metadata
    X86_MMXTyID = 9     # MMX vectors (64 bits, X86 specific)
    TokenTyID = 10      # Tokens
    IntegerTyID = 11    # Arbitrary bit width integers
    FunctionTyID = 12   # Functions
    StructTyID = 13     # Structures
    ArrayTyID = 14      # Arrays
    PointerTyID = 15    # Pointers
    VectorTyID = 16     # SIMD 'packed' format, or other vector type

_ONE_HOT_VOID_TYPE = [1, 0, 0, 0, 0, 0]
_ONE_HOT_FP_TYPE = [0, 1, 0, 0, 0, 0]
_ONE_HOT_INT_TYPE = [0, 0, 1, 0, 0, 0]
_ONE_HOT_VECTOR_TYPE = [0, 0, 0, 1, 0, 0]
_ONE_HOT_POINTER_TYPE = [0, 0, 0, 0, 1, 0]
_ONE_HOT_UNK_TYPE = [0, 0, 0, 0, 0, 1]

def _get_loop_depth(md: Dict[str, Number]) -> int:
    if "loopDepth" not in md:
        return 0 # Use 0 for instructions outside loops
    loop_depth = md["loopDepth"]
    return loop_depth

def _get_trip_count(md: Dict[str, Number]) -> int:
    if "tripCount" not in md:
        return 1 # Use 1 for instructions outside loops
    trip_count = md["tripCount"]
    return trip_count

def _get_pipeline_info(md: Dict[str, Number]) -> List[int]:
    if "pipeline" not in md:
        return [0, 0]
    pipelined = md["pipeline"]
    is_function_level = md["functionLevel"]
    return [pipelined, is_function_level]

def _get_array_partition_info(md: Dict[str, Number]) -> List[int]:
    if "arrayPartition" not in md:
        return [0] * 7
    dim = md["arrayPartitionDim"]
    partition_type = md["arrayPartitionType"]
    one_hot_partition_type = [0, 0, 0]
    one_hot_partition_type[partition_type - 1] = 1
    factor = md["arrayPartitionFactor"]
    dim_size = md["arrayPartitionDimSize"]
    return [1] + one_hot_partition_type + [dim, factor, dim_size]

def _get_unroll_info(md: Dict[str, Number]) -> List[int]:
    if "unroll" not in md:
        return [0, 0, 0]
    complete = md["unrollComplete"]
    factor = md["unrollFactor"]
    return [1, complete, factor]

def _get_loop_flatten_info(md: Dict[str, Number]) -> List[int]:
    if "loopFlatten" not in md:
        return [0]
    flattened = md["loopFlatten"]
    return [flattened]

def _get_loop_merge_info(md: Dict[str, Number]) -> List[int]:
    if "loopMerge" not in md:
        return [0, 0]
    merged = md["loopMerge"]
    is_function_level = md["functionLevel"]
    return [merged, is_function_level]

def _get_array_info(md: Dict[str, Number]) -> List[int]:
    return [
        md["numDims"], md["numElements"], 
        md["elementType"], md["elementBitwidth"]
    ]

def _get_bitwidth(md: Dict[str, Number]) -> int:
    return md["bitwidth"]

def _map_instruction_to_one_hot(instruction: str) -> List[int]:
    if instruction in _OPCODE_DICT:
        return _OPCODE_DICT[instruction]
    return [0] * 12 # Unknown instruction

def _map_type_to_one_hot(type_id: int) -> List[int]:
    # Note: Arrays are treated separately as another node type
    if type_id == TypeID.VoidTyID:
        return _ONE_HOT_VOID_TYPE
    if type_id >= TypeID.HalfTyID and type_id <= TypeID.PPC_FP128TyID:
        return _ONE_HOT_FP_TYPE
    if type_id == TypeID.IntegerTyID:
        return _ONE_HOT_INT_TYPE
    if type_id == TypeID.VectorTyID or type_id == TypeID.X86_MMXTyID:
        return _ONE_HOT_VECTOR_TYPE
    if type_id == TypeID.PointerTyID:
        return _ONE_HOT_POINTER_TYPE
    # Other types (e.g. struct, label, token, etc.)
    return _ONE_HOT_UNK_TYPE

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

def _is_ptr_type(type_str: str) -> bool:
    return type_str[-1] == '*'

def _is_array_type(type_str: str) -> bool:
    return (not _is_ptr_type(type_str) 
            and '[' in type_str and ']' in type_str)

def _is_vector_type(type_str: str, node_full_text: str) -> bool:
    return (not _is_ptr_type(type_str) and ('vector' in type_str 
            or ('<' in node_full_text and '>' in node_full_text)))

def _is_iter_type(type_str: str, node_full_text: str) -> bool:
    return _is_array_type(type_str) or _is_vector_type(type_str, node_full_text)

def _is_iter_or_ptr_type(type_str: str, node_full_text: str) -> bool:
    return _is_ptr_type(type_str) or _is_iter_type(type_str, node_full_text)

def _is_void_type(type_str: str, node_full_text: str) -> bool:
    return (not _is_iter_or_ptr_type(type_str, node_full_text) 
            and 'void' in type_str)

def _is_half_type(type_str: str, node_full_text: str) -> bool:
    return (not _is_iter_or_ptr_type(type_str, node_full_text)
            and 'half' in type_str)

def _is_float_type(type_str: str, node_full_text: str) -> bool:
    return (not _is_iter_or_ptr_type(type_str, node_full_text) 
            and 'float' in type_str)

def _is_double_type(type_str: str, node_full_text: str) -> bool:
    return (not _is_iter_or_ptr_type(type_str, node_full_text)
            and 'double' in type_str)

def _is_int_type(type_str: str, node_full_text: str) -> bool:
    return (not _is_iter_or_ptr_type(type_str, node_full_text) 
            and type_str[0] == 'i')

def _get_type_id_from_string(type_str: str, node_full_text: str = "") -> int:
    if _is_ptr_type(type_str): 
        return TypeID.PointerTyID
    if _is_array_type(type_str):   
        return TypeID.ArrayTyID
    if _is_void_type(type_str, node_full_text): 
        return TypeID.VoidTyID
    if _is_half_type(type_str, node_full_text):
        return TypeID.HalfTyID
    if _is_float_type(type_str, node_full_text):
        return TypeID.FloatTyID
    if _is_double_type(type_str, node_full_text):
        return TypeID.DoubleTyID
    if _is_int_type(type_str, node_full_text):
        return TypeID.IntegerTyID
    if _is_vector_type(type_str, node_full_text):
        return TypeID.VectorTyID
    # Other types (e.g. struct, label, token, etc.)
    return -1

def _get_bitwidth_from_str(type_str: str, node_full_text: str = "") -> int:
    if _is_ptr_type(type_str):
        return 0
    if _is_iter_type(type_str, node_full_text):
        if '<' in node_full_text and '>' in node_full_text:
            n_elems = int(node_full_text.split('[<')[1].split(' x')[0])
            elem_type = node_full_text.split('x ')[1].split(']>')[0]
            elem_bw = _get_bitwidth_from_str(elem_type, node_full_text)
        else:
            n_elems = int(type_str.split('[')[1].split(' x')[0])
            elem_type = type_str.split('x ')[1].split(']')[0]
            elem_bw = _get_bitwidth_from_str(elem_type, node_full_text)
        return n_elems * elem_bw
    if _is_void_type(type_str, node_full_text):
        return 0
    if _is_half_type(type_str, node_full_text):
        return 16
    if _is_float_type(type_str, node_full_text):
        return 32
    if _is_double_type(type_str, node_full_text):
        return 64 
    if _is_int_type(type_str, node_full_text):
        return int(type_str[1:])
    # Other types (e.g. struct, label, token, etc.)
    return 0

def _parse_literal_const_info(node_full_text: str) -> List[int]:
    type_str = node_full_text.split(' ')[0].strip()
    type_id = _get_type_id_from_string(type_str, node_full_text)
    one_hot_type = _map_type_to_one_hot(type_id)
    bitwidth = _get_bitwidth_from_str(type_str, node_full_text)
    features = one_hot_type + [bitwidth]
    return features

def _build_nodes(
    programl_graph,
    metadata: Dict[str, Dict[str, Dict[str, str]]],
    ir_instructions: Dict[int, str]
) -> Tuple[HeteroData, Dict[str, List[int]]]:
    inst_bb_map, inst_func_map, bb_func_map = {}, {}, {}
    nodes = {nt: [] for nt in NODE_TYPES}
    indices = {nt: [] for nt in NODE_TYPES}
    graph = HeteroData()

    # External functions are represented as a function, a basic block, 
    # and an instruction node, all of them with all-zero features and index 0
    nodes['inst'].append(torch.zeros(INST_FEATURE_SIZE, dtype=torch.float32))
    nodes['bb'].append(torch.zeros(BB_FEATURE_SIZE, dtype=torch.float32))
    nodes['func'].append(torch.zeros(FUNCTION_FEATURE_SIZE, dtype=torch.float32))
    indices["inst"].append(0)
    indices["bb"].append(0)
    indices["func"].append(0)
    inst_bb_map[0] = 0
    inst_func_map[0] = 0
    bb_func_map[0] = 0

    for i, node in enumerate(programl_graph.node):
        node_type, node_text = node.type, node.text
        if node_text == "" or node_text == "[external]":
            continue

        node_full_text = node.features.feature["full_text"].bytes_list.value.__str__()[1:-1]
        node_full_text = node_full_text[2:-1] if node_full_text[0] == 'b' else node_full_text

        if node_type == NodeType.INST:
            if "!ID." not in node_full_text:
                nodes['inst'].append(torch.zeros(INST_FEATURE_SIZE, dtype=torch.float32))
                indices["inst"].append(i)
                continue

            id = int(node_full_text.split('!ID.')[1].split(' ')[0])
            node_full_text = ir_instructions[id]
            md = _process_metadata_entries(metadata["instruction"][str(id)])

            one_hot_op = _map_instruction_to_one_hot(node_text)

            nodes['inst'].append(torch.tensor(one_hot_op, dtype=torch.float32))
            indices["inst"].append(i)

            bb_id = md["bbID"]
            function_id = md["functionID"]

            inst_bb_map[i] = bb_id
            inst_func_map[i] = function_id

            loop_depth = _get_loop_depth(md)
            trip_count = _get_trip_count(md)
            pipeline_features = _get_pipeline_info(md)
            unroll_features = _get_unroll_info(md)
            loop_merge_features = _get_loop_merge_info(md)
            loop_flatten_features = _get_loop_flatten_info(md)

            function_level_pipeline = pipeline_features[1] == 1
            function_level_loop_merge = loop_merge_features[1] == 1
            
            if bb_id not in indices["bb"]:
                bb_pipeline = 0 if function_level_pipeline else pipeline_features[0]
                bb_loop_merge = 0 if function_level_loop_merge else loop_merge_features[0]
                bb_features = ([loop_depth, trip_count, bb_pipeline, bb_loop_merge]
                               + unroll_features + loop_flatten_features)
                nodes['bb'].append(torch.tensor(bb_features, dtype=torch.float32))
                indices["bb"].append(bb_id)
                bb_func_map[bb_id] = function_id

            if function_id not in indices["func"]:
                function_pipeline = 0 if not function_level_pipeline else pipeline_features[0]
                function_loop_merge = 0 if not function_level_loop_merge else loop_merge_features[0]
                function_features = [function_pipeline, function_loop_merge]
                nodes['func'].append(torch.tensor(function_features, dtype=torch.float32))
                indices["func"].append(function_id)

        else: # Variable or Constant
            tokens = node_full_text.split(' ')
            if node_full_text.startswith('@'): 
                name = tokens[0].strip('@')
            elif node_full_text.startswith('%'):
                name = tokens[0].strip('%')
            elif len(tokens) > 1 and tokens[1].startswith('%'):
                name = tokens[1].strip('%')
            # elif len(tokens) > 1 and tokens[1].startswith('@'):
            #     name = tokens[1].strip('@')
            else:
                # Value does not have a name (e.g. literal constant)
                if '*' in node_full_text:
                    # Value is a pointer
                    one_hot_pointer_type = _ONE_HOT_POINTER_TYPE
                    bitwidth = 0
                    features = one_hot_pointer_type + [bitwidth]
                else:
                    # Value is a literal constant
                    features = _parse_literal_const_info(node_full_text)
                node_type_str = 'var' if node_type == NodeType.VAR else 'const'
                nodes[node_type_str].append(torch.tensor(features, dtype=torch.float32))
                indices[node_type_str].append(i)
                continue

            md = _process_metadata_entries(metadata["value"][name])

            if "isArray" in md and md["isArray"] == 1:
                array_md = _get_array_info(md)
                one_hot_type = _map_type_to_one_hot(array_md[2])
                array_partition_md = _get_array_partition_info(md)
                features = (array_md[:2] + one_hot_type + array_md[3:]
                            + array_partition_md)
                nodes['array'].append(torch.tensor(features, dtype=torch.float32))
                indices["array"].append(i)
                continue
            
            one_hot_type = _one_hot_encode_type(md)
            bitwidth = _get_bitwidth(md)
            features = one_hot_type + [bitwidth]

            node_type_str = 'var' if node_type == NodeType.VAR else 'const'
            nodes[node_type_str].append(torch.tensor(features, dtype=torch.float32))
            indices[node_type_str].append(i)

    for key in nodes.keys():
        if len(nodes[key]) > 0:
            graph[key].x = torch.stack(nodes[key])
        else:
            feature_dim = FEATURE_SIZE_PER_NODE_TYPE[key]
            graph[key].x = torch.empty((0, feature_dim), dtype=torch.float32)

    return graph, indices, inst_bb_map, inst_func_map, bb_func_map

def _build_edge_tensor(src: int, dst: int) -> Tensor:
    return torch.tensor([src, dst], dtype=torch.int64)

def _create_scope_edges(
    mapping: Dict[int, int],
    indices: Dict[str, List[int]],
    containing_type: str,
    contained_type: str
) -> Tuple[List[Tensor], List[Tensor]]:
    edges = []
    inv_edges = []
    for node_id, scope_id in mapping.items():
        src_idx = indices[containing_type].index(scope_id)
        dst_idx = indices[contained_type].index(node_id)
        edge_tensor = _build_edge_tensor(src_idx, dst_idx)
        inv_edge_tensor = _build_edge_tensor(dst_idx, src_idx)
        edges.append(edge_tensor)
        inv_edges.append(inv_edge_tensor)
    return edges, inv_edges

def _build_edges(
    programl_graph,
    graph: HeteroData,
    indices: Dict[str, List[int]],
    cfg_edges: List[List[int]],
    inst_bb_map: Dict[int, int],
    inst_func_map: Dict[int, int],
    bb_func_map: Dict[int, int]
) -> HeteroData:
    edge_dict = {et: [] for et in EDGE_TYPES}
    
    for edge in programl_graph.edge:
        src, dst = edge.source, edge.target
        src_type = programl_graph.node[src].type
        dst_type = programl_graph.node[dst].type
        if src_type == 0: 
            # Instruction source
            src_idx = indices["inst"].index(src)
            if dst_type == 0:
                # Instruction destination
                dst_idx = indices["inst"].index(dst)
                edge_tensor = _build_edge_tensor(src_idx, dst_idx)
                inv_edge_tensor = _build_edge_tensor(dst_idx, src_idx)
                if edge.flow == 0:
                    # Control edge
                    edge_dict[('inst', 'prec', 'inst')].append(edge_tensor)
                    edge_dict[('inst', 'succ', 'inst')].append(inv_edge_tensor)
                else:
                    # Call edge
                    edge_dict[('inst', 'calls', 'inst')].append(edge_tensor)
                    edge_dict[('inst', 'called_by', 'inst')].append(inv_edge_tensor)
            else:
                # Variable destination
                dst_idx = indices["var"].index(dst)
                edge_tensor = _build_edge_tensor(src_idx, dst_idx)
                inv_edge_tensor = _build_edge_tensor(dst_idx, src_idx)
                edge_dict[('inst', 'prod', 'var')].append(edge_tensor)
                edge_dict[('var', 'prod_by', 'inst')].append(inv_edge_tensor)
        elif src in indices["array"]:
            # Array source, only used by instructions
            src_idx = indices["array"].index(src)
            dst_idx = indices["inst"].index(dst)
            edge_tensor = _build_edge_tensor(src_idx, dst_idx)
            inv_edge_tensor = _build_edge_tensor(dst_idx, src_idx)
            edge_dict[('array', 'used_by', 'inst')].append(edge_tensor)
            edge_dict[('inst', 'uses', 'array')].append(inv_edge_tensor)
        elif src_type == 1:
            # Variable source, only used by instructions
            src_idx = indices["var"].index(src)
            dst_idx = indices["inst"].index(dst)
            edge_tensor = _build_edge_tensor(src_idx, dst_idx)
            inv_edge_tensor = _build_edge_tensor(dst_idx, src_idx)
            edge_dict[('var', 'used_by', 'inst')].append(edge_tensor)
            edge_dict[('inst', 'uses', 'var')].append(inv_edge_tensor)
        else:
            # Constant source, only used by instructions
            src_idx = indices["const"].index(src)
            dst_idx = indices["inst"].index(dst)
            edge_tensor = _build_edge_tensor(src_idx, dst_idx)
            inv_edge_tensor = _build_edge_tensor(dst_idx, src_idx)
            edge_dict[('const', 'used_by', 'inst')].append(edge_tensor)
            edge_dict[('inst', 'uses', 'const')].append(inv_edge_tensor)

    inst_bb_edges, bb_inst_edges = _create_scope_edges(
        inst_bb_map, indices, 'bb', 'inst'
    )
    inst_func_edges, func_inst_edges = _create_scope_edges(
        inst_func_map, indices, 'func', 'inst'
    )
    bb_func_edges, func_bb_edges = _create_scope_edges(
        bb_func_map, indices, 'func', 'bb'
    )
    edge_dict[('bb', 'contains', 'inst')] = inst_bb_edges
    edge_dict[('inst', 'belongs_to', 'bb')] = bb_inst_edges
    edge_dict[('func', 'contains', 'inst')] = inst_func_edges
    edge_dict[('inst', 'belongs_to', 'func')] = func_inst_edges
    edge_dict[('func', 'contains', 'bb')] = bb_func_edges
    edge_dict[('bb', 'belongs_to', 'func')] = func_bb_edges

    for call_edges in edge_dict[('inst', 'calls', 'inst')]:
        src_inst = indices['inst'][call_edges[0].item()]
        dst_inst = indices['inst'][call_edges[1].item()]
        if src_inst not in inst_func_map or dst_inst not in inst_func_map:
            continue
        src_function = indices['func'].index(inst_func_map[src_inst])
        dst_function = indices['func'].index(inst_func_map[dst_inst])
        edge_tensor = _build_edge_tensor(src_function, dst_function)
        inv_edge_tensor = _build_edge_tensor(dst_function, src_function)
        edge_dict[('func', 'calls', 'func')].append(edge_tensor)
        edge_dict[('func', 'called_by', 'func')].append(inv_edge_tensor)

    for edge in cfg_edges:
        src_bb_idx = indices["bb"].index(edge[0])
        dst_bb_idx = indices["bb"].index(edge[1])
        edge_tensor = _build_edge_tensor(src_bb_idx, dst_bb_idx)
        inv_edge_tensor = _build_edge_tensor(dst_bb_idx, src_bb_idx)
        edge_dict[('bb', 'prec', 'bb')].append(edge_tensor)
        edge_dict[('bb', 'succ', 'bb')].append(inv_edge_tensor)

    for k, v in indices.items():
        n_vals = len(v)
        for i in range(n_vals):
            edge_tensor = _build_edge_tensor(i, i)
            edge_dict[(k, 'id', k)].append(edge_tensor)

    for et, edges in edge_dict.items():
        if len(edges) > 0:
            graph[et].edge_index = torch.stack(edges).transpose(0, 1)
        else:
            graph[et].edge_index = torch.empty((2, 0), dtype=torch.int64)

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

def _parse_cfg_file(cfg_path: Path) -> List[Tuple[int, int]]:
    # The format of the cfg file is as follows:
    # <num_edges>
    # <src_node_1>,<dst_node_1>
    # <src_node_2>,<dst_node_2>
    # ...
    with open(cfg_path, 'r') as f:
        lines = f.readlines()[1:]
    
    edges = [tuple(map(int, line.strip().split(','))) 
             for line in lines]
    return edges

def _map_instruction_ids(
    ir_text: Union[str, List[str]]
) -> Dict[int, str]:
    if isinstance(ir_text, str):
        ir_text = ir_text.split('\n')

    id_md_prefix = "!ID."
    inst_dict = {}
    for line in ir_text:
        if id_md_prefix not in line:
            continue
        id = int(line.split(id_md_prefix)[1].split(' ')[0])
        inst_dict[id] = line

    return inst_dict

def build_cdfg(
    ir_path: Path,
    metadata_path: Path,
    cfg_path: Path
) -> HeteroData:
    import programl

    with open(ir_path, 'r') as ir_file:
        ir_text = ir_file.read()

    programl_cdfg = programl.from_llvm_ir(ir_text)

    inst_dict = _map_instruction_ids(ir_text)
    metadata = _parse_md_file(metadata_path)
    cfg_edges = _parse_cfg_file(cfg_path)

    ret = _build_nodes(programl_cdfg, metadata, inst_dict)
    cdfg, node_indices, inst_bb_map, inst_func_map, bb_func_map = ret
    
    cdfg = _build_edges(
        programl_cdfg, cdfg, node_indices, cfg_edges, 
        inst_bb_map, inst_func_map, bb_func_map
    )

    return cdfg

def plot_cdfg(
    cdfg: Union[HeteroData, Data],
    output_path: Optional[Path] = None
) -> None:
    import networkx as nx

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
    import programl
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