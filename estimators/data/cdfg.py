from typing import List, Dict, Tuple, Union, Optional
from torch.types import Number

import torch
import matplotlib.pyplot as plt
from pathlib import Path
from enum import IntEnum
from torch import Tensor
from torch_geometric.typing import NodeType
from torch_geometric.data import HeteroData, Data
from torch_geometric.utils import to_networkx

NODE_TYPES = ['inst', 'var', 'const', 'array', 'bb', 'func', 'loop_pragma', 'array_pragma']
EDGE_TYPES = [
    ('inst', 'prec', 'inst'), ('inst', 'succ', 'inst'), ('inst', 'calls', 'inst'),
    ('inst', 'called_by', 'inst'), ('inst', 'uses', 'var'), ('inst', 'prod', 'var'),
    ('inst', 'prod', 'array'), ('inst', 'uses', 'array'), ('inst', 'uses', 'const'), 
    ('inst', 'belongs_to', 'bb'), ('inst', 'belongs_to', 'func'), ('inst', 'id', 'inst'), 
    ('var', 'used_by', 'inst'), ('var', 'prod_by', 'inst'), ('var', 'id', 'var'), 
    ('const', 'used_by', 'inst'), ('const', 'id', 'const'), ('array', 'used_by', 'inst'), 
    ('array', 'transf_by', 'array_pragma'), ('array', 'prod_by', 'inst'), ('array', 'id', 'array'), 
    ('bb', 'contains', 'inst'), ('bb', 'belongs_to', 'func'), ('bb', 'prec', 'bb'), 
    ('bb', 'succ', 'bb'), ('bb', 'transf_by', 'loop_pragma'), ('bb', 'id', 'bb'), 
    ('func', 'contains', 'bb'), ('func', 'contains', 'inst'), ('func', 'calls', 'func'), 
    ('func', 'called_by', 'func'), ('func', 'transf_by', 'loop_pragma'), ('func', 'id', 'func'), 
    ('loop_pragma', 'transf', 'bb'), ('loop_pragma', 'transf', 'func'), ('loop_pragma', 'id', 'loop_pragma'), 
    ('array_pragma', 'transf', 'array'), ('array_pragma', 'id', 'array_pragma')
]
METADATA = (NODE_TYPES, EDGE_TYPES)

class LoopPragmaType(IntEnum):
    UNROLL = 0
    PIPELINE = 1
    FLATTEN = 2
    MERGE = 3

NUM_LOOP_PRAGMA_TYPES = 4

INST_FEAT_SIZE = 17
VAR_FEAT_SIZE = 6
CONST_FEAT_SIZE = 6
ARRAY_FEAT_SIZE = 11
BB_FEAT_SIZE = 4
FUNC_FEAT_SIZE = 11
LOOP_PRAGMA_FEAT_SIZE = NUM_LOOP_PRAGMA_TYPES + 2
ARRAY_PRAGMA_FEAT_SIZE = 9

FEAT_SIZE_PER_NODE_TYPE = {
    'inst': INST_FEAT_SIZE,
    'var': VAR_FEAT_SIZE,
    'const': CONST_FEAT_SIZE,
    'array': ARRAY_FEAT_SIZE,
    'bb': BB_FEAT_SIZE,
    'func': FUNC_FEAT_SIZE,
    'loop_pragma': LOOP_PRAGMA_FEAT_SIZE,
    'array_pragma': ARRAY_PRAGMA_FEAT_SIZE
}

class NodeType(IntEnum):
    INST = 0
    VAR = 1
    CONST = 2
    ARRAY = 3
    BB = 4
    FUNC = 5

# Type IDs from LLVM 7.0
class LLVMTypeID(IntEnum):
    VOID = 0
    HALF = 1
    FLOAT = 2
    DOUBLE = 3
    X86_FP80 = 4
    FP128 = 5
    PPC_FP128 = 6
    LABEL = 7
    METADATA = 8
    X86_MMX = 9
    TOKEN = 10
    INT = 11
    FUNCTION = 12
    STRUCT = 13
    ARRAY = 14
    POINTER = 15
    VECTOR = 16

# Opcodes from LLVM 7.0

class LLVMOpcode(IntEnum):
    RET = 1
    BR = 2
    SWITCH = 3
    ADD = 11
    FADD = 12
    SUB = 13
    FSUB = 14
    MUL = 15
    FMUL = 16
    UDIV = 17
    SDIV = 18
    FDIV = 19
    UREM = 20
    SREM = 21
    FREM = 22
    SHL = 23
    LSHR = 24
    ASHR = 25
    AND = 26
    OR = 27
    XOR = 28
    ALLOCA = 29
    LOAD = 30
    STORE = 31
    GETELEMENTPTR = 32
    TRUNC = 36
    ZEXT = 37
    SEXT = 38
    FPTRUNC = 43
    FPEXT = 44
    BITCAST = 47
    ICMP = 51
    FCMP = 52
    PHI = 53
    CALL = 54

# "One-hot-like" encoding of instructions (12 bits)
# The first 5 bits represent the instruction category
# The next 5 bits represent the instruction type
# The 11th bit represents the instruction is a floating-point operation
# The 12th bit represents the instruction is signed
INSTRUCTION_ENC = {
    # Arithmetic
    LLVMOpcode.ADD:           [1,0,0,0,0, 1,0,0,0,0, 0,1],
    LLVMOpcode.FADD:          [1,0,0,0,0, 1,0,0,0,0, 1,0],
    LLVMOpcode.SUB:           [1,0,0,0,0, 0,1,0,0,0, 0,1],
    LLVMOpcode.FSUB:          [1,0,0,0,0, 0,1,0,0,0, 1,0],
    LLVMOpcode.MUL:           [1,0,0,0,0, 0,0,1,0,0, 0,1],
    LLVMOpcode.FMUL:          [1,0,0,0,0, 0,0,1,0,0, 1,0],
    LLVMOpcode.SDIV:          [1,0,0,0,0, 0,0,0,1,0, 0,1],
    LLVMOpcode.UDIV:          [1,0,0,0,0, 0,0,0,1,0, 0,0],
    LLVMOpcode.FDIV:          [1,0,0,0,0, 0,0,0,1,0, 1,0],
    LLVMOpcode.SREM:          [1,0,0,0,0, 0,0,0,0,1, 0,1],
    LLVMOpcode.UREM:          [1,0,0,0,0, 0,0,0,0,1, 0,0],
    LLVMOpcode.FREM:          [1,0,0,0,0, 0,0,0,0,1, 1,0],

    # Logical
    LLVMOpcode.SHL:           [0,1,0,0,0, 1,0,0,0,0, 0,0],
    LLVMOpcode.LSHR:          [0,1,0,0,0, 0,1,0,0,0, 0,0],
    LLVMOpcode.ASHR:          [0,1,0,0,0, 0,1,0,0,0, 0,1],
    LLVMOpcode.AND:           [0,1,0,0,0, 0,0,1,0,0, 0,0],
    LLVMOpcode.OR:            [0,1,0,0,0, 0,0,0,1,0, 0,0],
    LLVMOpcode.XOR:           [0,1,0,0,0, 0,0,0,0,1, 0,0],

    # Memory
    LLVMOpcode.ALLOCA:        [0,0,1,0,0, 1,0,0,0,0, 0,0],
    LLVMOpcode.LOAD:          [0,0,1,0,0, 0,1,0,0,0, 0,0],
    LLVMOpcode.STORE:         [0,0,1,0,0, 0,0,1,0,0, 0,0],
    LLVMOpcode.GETELEMENTPTR: [0,0,1,0,0, 0,0,0,1,0, 0,0],

    # Casts
    LLVMOpcode.TRUNC:         [0,0,0,1,0, 1,0,0,0,0, 0,0],
    LLVMOpcode.FPTRUNC:       [0,0,0,1,0, 1,0,0,0,0, 1,0],
    LLVMOpcode.ZEXT:          [0,0,0,1,0, 0,1,0,0,0, 0,0],
    LLVMOpcode.SEXT:          [0,0,0,1,0, 0,1,0,0,0, 0,1],
    LLVMOpcode.FPEXT:         [0,0,0,1,0, 0,1,0,0,0, 1,0],
    LLVMOpcode.BITCAST:       [0,0,0,1,0, 0,0,1,0,0, 0,0],

    # Control flow
    LLVMOpcode.BR:            [0,0,0,0,1, 1,0,0,0,0, 0,0],
    LLVMOpcode.RET:           [0,0,0,0,1, 0,1,0,0,0, 0,0],
    LLVMOpcode.CALL:          [0,0,0,0,1, 0,0,1,0,0, 0,0],
    LLVMOpcode.PHI:           [0,0,0,0,1, 0,0,0,1,0, 0,0],
    LLVMOpcode.ICMP:          [0,0,0,0,1, 0,0,0,0,1, 0,0],
    LLVMOpcode.FCMP:          [0,0,0,0,1, 0,0,0,0,1, 1,0]
}
INSTRUCTION_ENC_SIZE = 12

TYPE_ENC = {
    LLVMTypeID.INT:       [1,0,0,0,0],
    LLVMTypeID.HALF:      [0,1,0,0,0],
    LLVMTypeID.FLOAT:     [0,1,0,0,0],
    LLVMTypeID.DOUBLE:    [0,1,0,0,0],
    LLVMTypeID.X86_FP80:  [0,1,0,0,0],
    LLVMTypeID.FP128:     [0,1,0,0,0],
    LLVMTypeID.PPC_FP128: [0,1,0,0,0],
    LLVMTypeID.POINTER:   [0,0,1,0,0],
    LLVMTypeID.STRUCT:    [0,0,0,1,0],

    LLVMTypeID.VOID:      [0,0,0,0,1],
    LLVMTypeID.VECTOR:    [0,0,0,0,1],
    LLVMTypeID.ARRAY:     [0,0,0,0,1],
    LLVMTypeID.LABEL:     [0,0,0,0,1],
    LLVMTypeID.METADATA:  [0,0,0,0,1],
    LLVMTypeID.X86_MMX:   [0,0,0,0,1],
    LLVMTypeID.TOKEN:     [0,0,0,0,1],
    LLVMTypeID.FUNCTION:  [0,0,0,0,1]
}
TYPE_ENC_SIZE = 5

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

def _get_pipeline_info(md: Dict[str, Number]) -> Tuple[List[int], int]:
    if "pipeline" not in md or md["pipeline"] == 0:
        return [0, 0], -1
    is_function_level = md["functionLevel"]
    return [is_function_level], md["pipelineID"]

def _get_array_partition_info(md: Dict[str, Number]) -> Tuple[List[int], int]:
    if "arrayPartition" not in md or md["arrayPartition"] == 0:
        return [0] * ARRAY_PRAGMA_FEAT_SIZE, -1
    max_dims = 4 # Maximum number of dimensions (4D arrays) for now
    dim = md["arrayPartitionDim"]
    enc_dim = [0] * (max_dims + 1)
    if dim > max_dims:
        dim = max_dims
    enc_dim[dim] = 1
    partition_type = md["arrayPartitionType"]
    enc_partition_type = [0, 0, 0]
    enc_partition_type[partition_type - 1] = 1
    factor = md["arrayPartitionFactor"]
    return enc_partition_type + enc_dim + [factor], md["arrayPartitionID"]

def _get_unroll_info(md: Dict[str, Number]) -> Tuple[List[int], int]:
    if "unroll" not in md or md["unroll"] == 0:
        return [0, 0, 0], -1
    complete = md["unrollComplete"]
    factor = md["unrollFactor"]
    return [complete, factor], md["unrollID"]

def _get_loop_flatten_info(md: Dict[str, Number]) -> Tuple[List[int], int]:
    if "loopFlatten" not in md:
        return [0], -1
    flattened = md["loopFlatten"]
    return [flattened], md["loopFlattenID"]

def _get_loop_merge_info(md: Dict[str, Number]) -> Tuple[List[int], int]:
    if "loopMerge" not in md or md["loopMerge"] == 0:
        return [0, 0], -1
    is_function_level = md["functionLevel"]
    return [is_function_level], md["loopMergeID"]

def _get_array_info(md: Dict[str, Number]) -> List[int]:
    n_dims = md["numDims"]
    elem_type = md["elementType"]
    elem_bw = md["elementBitwidth"]
    dim_size = [0] * 4

    for i in range(1, n_dims + 1):
        curr_dim_size = md[f"numElements.{i}"]
        if i > 4:
            dim_size[-1] *= curr_dim_size
        else:
            dim_size[i - 1] = curr_dim_size

    return [n_dims] + dim_size + [elem_type, elem_bw]

def _process_metadata_entries(
    raw_md: Dict[str, str]
) -> Dict[str, Union[int, float]]:
    processed_md = {}
    for key, value in raw_md.items():
        if key == "functionName":
            continue
        try:
            processed_md[key] = int(value)
        except ValueError:
            try:
                processed_md[key] = float(value)
            except ValueError:
                # Boolean (possibly represented as a string) 
                # or non-numeric value 
                processed_md[key] = 1 if value == "true" else 0
    return processed_md

def _get_type_id_from_text(node_text: str) -> int:
    if node_text[-1] == '*':
        return LLVMTypeID.POINTER
    if '[' in node_text and ']' in node_text:
        return LLVMTypeID.ARRAY
    if 'half' in node_text:
        return LLVMTypeID.HALF
    if 'float' in node_text:
        return LLVMTypeID.FLOAT
    if 'double' in node_text:
        return LLVMTypeID.DOUBLE
    if node_text[0] == 'i':
        return LLVMTypeID.INT
    if 'struct' in node_text:
        return LLVMTypeID.STRUCT
    return LLVMTypeID.VOID

def _get_bitwidth_from_text(node_text: str) -> int:
    if node_text[-1] == '*':
        return 0
    if '[' in node_text and ']' in node_text:
        n_elems = int(node_text.split('[')[1].split(' x')[0])
        elem_type = node_text.split('x ')[1].split(']')[0]
        elem_bw = _get_bitwidth_from_text(elem_type)
        return n_elems * elem_bw
    if 'half' in node_text:
        return 16
    if 'float' in node_text:
        return 32
    if 'double' in node_text:
        return 64 
    if node_text[0] == 'i':
        return int(node_text[1:])
    return 0

def _parse_literal_const_info(node_text: str) -> List[int]:
    type_id = _get_type_id_from_text(node_text)
    bitwidth = _get_bitwidth_from_text(node_text)
    return TYPE_ENC[type_id] + [bitwidth]

def _build_nodes(
    programl_graph,
    metadata: Dict[str, Dict[str, Dict[str, str]]],
    inst_dict: Dict[int, str]
):
    inst_bb_map, inst_func_map, bb_func_map = {}, {}, {}
    pragma_bb_map, pragma_func_map, pragma_array_map = {}, {}, {}
    nodes = {nt: [] for nt in NODE_TYPES}
    indices = {nt: [] for nt in NODE_TYPES}
    graph = HeteroData()

    # External functions are represented as a function, 
    # a basic block, and an instruction node, all of them 
    # with all-zero features and index 0
    nodes['inst'].append(torch.zeros(INST_FEAT_SIZE, dtype=torch.float32))
    nodes['bb'].append(torch.zeros(BB_FEAT_SIZE, dtype=torch.float32))
    nodes['func'].append(torch.zeros(FUNC_FEAT_SIZE, dtype=torch.float32))
    indices["inst"].append(0)
    indices["bb"].append(0)
    indices["func"].append(0)
    inst_bb_map[0] = 0
    inst_func_map[0] = 0
    bb_func_map[0] = 0

    for i, node in enumerate(programl_graph.node):
        node_type, node_text = node.type, node.text
        if len(node_text) == 0 or node_text == "[external]":
            continue

        node_full_text = (node.features.feature["full_text"]
                          .bytes_list.value.__str__()[1:-1])
        if node_full_text[0] == 'b':
            node_full_text = node_full_text[2:-1]

        if node_type == NodeType.INST:
            if "!ID." not in node_full_text:
                nodes['inst'].append(torch.zeros(INST_FEAT_SIZE, dtype=torch.float32))
                indices["inst"].append(i)
                continue

            id = int(node_full_text.split('!ID.')[1].split(' ')[0])
            node_full_text = inst_dict[id]
            md = _process_metadata_entries(metadata["instruction"][str(id)])

            opcode = md["opcode"]
            if opcode not in INSTRUCTION_ENC:
                # Unknown instruction
                one_hot_inst = [0] * INSTRUCTION_ENC_SIZE
            else:
                one_hot_inst = INSTRUCTION_ENC[opcode]

            num_operands = md["numOperands"]
            num_uses = md["numUses"]
            mod_memory = md["modifiesMemory"]
            reads_memory = md["readsMemory"]
            mod_cfg = md["modifiesControlFlow"]

            inst_features = ([num_operands, num_uses] + one_hot_inst 
                             + [mod_memory, reads_memory, mod_cfg])
            nodes['inst'].append(torch.tensor(inst_features, dtype=torch.float32))
            indices["inst"].append(i)

            bb_id = md["bbID"]
            function_id = md["functionID"]

            inst_bb_map[i] = bb_id
            inst_func_map[i] = function_id

            loop_depth = _get_loop_depth(md)
            trip_count = _get_trip_count(md)

            pipeline_features, pipeline_id = _get_pipeline_info(md)
            unroll_features, unroll_id = _get_unroll_info(md)
            loop_merge_features, loop_merge_id = _get_loop_merge_info(md)
            _, loop_flatten_id = _get_loop_flatten_info(md)

            function_level_pipeline = pipeline_features[0] == 1
            function_level_loop_merge = loop_merge_features[0] == 1
            
            if bb_id not in indices["bb"]:
                bb_size = md["bbSize"]
                in_loop = md["inLoop"]

                if (function_level_pipeline == 0 and pipeline_id != -1
                    and pipeline_id not in indices["loop_pragma"]):
                    features = torch.zeros(LOOP_PRAGMA_FEAT_SIZE, dtype=torch.float32)
                    features[LoopPragmaType.PIPELINE] = 1
                    nodes['loop_pragma'].append(features)
                    indices["loop_pragma"].append(pipeline_id)
                    pragma_bb_map[pipeline_id] = bb_id
                
                if (function_level_loop_merge == 0 and loop_merge_id != -1
                    and loop_merge_id not in indices["loop_pragma"]):
                    features = torch.zeros(LOOP_PRAGMA_FEAT_SIZE, dtype=torch.float32)
                    features[LoopPragmaType.MERGE] = 1
                    nodes['loop_pragma'].append(features)
                    indices["loop_pragma"].append(loop_merge_id)
                    pragma_bb_map[loop_merge_id] = bb_id

                if loop_flatten_id != -1 and loop_flatten_id not in indices["loop_pragma"]:
                    features = torch.zeros(LOOP_PRAGMA_FEAT_SIZE, dtype=torch.float32)
                    features[LoopPragmaType.FLATTEN] = 1
                    nodes['loop_pragma'].append(features)
                    indices["loop_pragma"].append(loop_flatten_id)
                    pragma_bb_map[loop_flatten_id] = bb_id

                if unroll_id != -1 and unroll_id not in indices["loop_pragma"]:
                    features = torch.zeros(LOOP_PRAGMA_FEAT_SIZE, dtype=torch.float32)
                    features[LoopPragmaType.UNROLL] = 1
                    features[-1] = unroll_features[-1]
                    features[-2] = unroll_features[-2]
                    nodes['loop_pragma'].append(features)
                    indices["loop_pragma"].append(unroll_id)
                    pragma_bb_map[unroll_id] = bb_id
                    
                bb_features = [bb_size, in_loop, loop_depth, trip_count]
                nodes['bb'].append(torch.tensor(bb_features, dtype=torch.float32))
                indices["bb"].append(bb_id)
                bb_func_map[bb_id] = function_id

            if function_id not in indices["func"]:
                n_operands = md["funcNumOperands"]
                n_uses = md["funcNumUses"]
                ret_type = md["funcRetType"]
                ret_bw = md["funcRetBitwidth"]
                n_insts = md["funcNumInsts"]
                n_bbs = md["funcNumBBs"]
                n_loops = md["funcNumLoops"]
                ret_type_features = TYPE_ENC[ret_type] + [ret_bw]

                if (function_level_pipeline == 1 and pipeline_id != -1
                    and pipeline_id not in indices["loop_pragma"]):
                    features = torch.zeros(LOOP_PRAGMA_FEAT_SIZE, dtype=torch.float32)
                    features[LoopPragmaType.PIPELINE] = 1
                    nodes['loop_pragma'].append(features)
                    indices["loop_pragma"].append(pipeline_id)
                    pragma_func_map[pipeline_id] = function_id

                if (function_level_loop_merge == 1 and loop_merge_id != -1
                    and loop_merge_id not in indices["loop_pragma"]):
                    features = torch.zeros(LOOP_PRAGMA_FEAT_SIZE, dtype=torch.float32)
                    features[LoopPragmaType.MERGE] = 1
                    nodes['loop_pragma'].append(features)
                    indices["loop_pragma"].append(loop_merge_id)
                    pragma_func_map[loop_merge_id] = function_id

                function_features = ([n_operands, n_uses, n_insts, n_bbs, n_loops]
                                     + ret_type_features)
                nodes['func'].append(torch.tensor(function_features, dtype=torch.float32))
                indices["func"].append(function_id)

        elif node_type == NodeType.VAR or node_type == NodeType.CONST:
            if '@' in node_full_text:
                name = node_full_text[node_full_text.find('@') + 1:].split(' ')[0]
            elif '%' in node_full_text:
                name = node_full_text[node_full_text.find('%') + 1:].split(' ')[0]
            else:
                # Value does not have a name (e.g. literal constant)
                if '*' in node_full_text:
                    # Value is a pointer
                    features = TYPE_ENC[LLVMTypeID.POINTER] + [0]
                else:
                    # Value is a literal constant
                    features = _parse_literal_const_info(node_text)

                node_type_str = 'var' if node_type == NodeType.VAR else 'const'
                nodes[node_type_str].append(torch.tensor(features, dtype=torch.float32))
                indices[node_type_str].append(i)
                continue

            if ',' in name:
                name = name.split(',')[0]
            if ')' in name:
                name = name.split(')')[0]

            if name in metadata["value"]:
                md = _process_metadata_entries(metadata["value"][name])
            else:
                function_id = node.function + 1

                name = f"{name}.{function_id}"
                if name in metadata["param"]:
                    md = _process_metadata_entries(metadata["param"][name])
                else:
                    md = {}

            if "isArray" in md and md["isArray"] == 1:
                array_md = _get_array_info(md)
                elem_type = array_md[5]
                elem_bw = array_md[6]

                elem_type_features = TYPE_ENC[elem_type] + [elem_bw]
                partition_md, partition_id = _get_array_partition_info(md)

                if partition_id != -1 and partition_id not in indices["array_pragma"]:
                    nodes['array_pragma'].append(torch.tensor(partition_md, dtype=torch.float32))
                    indices["array_pragma"].append(partition_id)
                    pragma_array_map[partition_id] = i

                features = array_md[:5] + elem_type_features
                nodes['array'].append(torch.tensor(features, dtype=torch.float32))
                indices["array"].append(i)
                continue
            
            type_id = md["type"]
            bitwidth = md["bitwidth"]
            features = TYPE_ENC[type_id] + [bitwidth]

            node_type_str = 'var' if node_type == NodeType.VAR else 'const'
            nodes[node_type_str].append(torch.tensor(features, dtype=torch.float32))
            indices[node_type_str].append(i)

    for key in nodes.keys():
        if len(nodes[key]) > 0:
            graph[key].x = torch.stack(nodes[key])
        else:
            feature_dim = FEAT_SIZE_PER_NODE_TYPE[key]
            graph[key].x = torch.empty((0, feature_dim), dtype=torch.float32)

    return (graph, indices, inst_bb_map, inst_func_map, bb_func_map, 
            pragma_bb_map, pragma_func_map, pragma_array_map)

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

def _create_pragma_edges(
    mapping: Dict[int, int],
    indices: Dict[str, List[int]],
    pragma_type: str,
    obj_type: str
) -> List[Tensor]:
    edges = []
    inv_edges = []
    for node_id, pragma_id in mapping.items():
        src_idx = indices[pragma_type].index(node_id)
        dst_idx = indices[obj_type].index(pragma_id)
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
    bb_func_map: Dict[int, int],
    pragma_bb_map: Dict[int, int],
    pragma_func_map: Dict[int, int],
    pragma_array_map: Dict[int, int]
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
                if dst in indices["var"]:
                    dst_idx = indices["var"].index(dst)
                    edge_tensor = _build_edge_tensor(src_idx, dst_idx)
                    inv_edge_tensor = _build_edge_tensor(dst_idx, src_idx)
                    edge_dict[('inst', 'prod', 'var')].append(edge_tensor)
                    edge_dict[('var', 'prod_by', 'inst')].append(inv_edge_tensor)
                elif dst in indices["array"]:
                    dst_idx = indices["array"].index(dst)
                    edge_tensor = _build_edge_tensor(src_idx, dst_idx)
                    inv_edge_tensor = _build_edge_tensor(dst_idx, src_idx)
                    edge_dict[('inst', 'prod', 'array')].append(edge_tensor)
                    edge_dict[('array', 'prod_by', 'inst')].append(inv_edge_tensor)
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

    pragma_bb_edges, bb_pragma_edges = _create_pragma_edges(
        pragma_bb_map, indices, 'loop_pragma', 'bb'
    )
    pragma_func_edges, func_pragma_edges = _create_pragma_edges(
        pragma_func_map, indices, 'loop_pragma', 'func'
    )
    pragma_array_edges, array_pragma_edges = _create_pragma_edges(
        pragma_array_map, indices, 'array_pragma', 'array'
    )
    edge_dict[('loop_pragma', 'transf', 'bb')] = pragma_bb_edges
    edge_dict[('bb', 'transf_by', 'loop_pragma')] = bb_pragma_edges
    edge_dict[('loop_pragma', 'transf', 'func')] = pragma_func_edges
    edge_dict[('func', 'transf_by', 'loop_pragma')] = func_pragma_edges
    edge_dict[('array_pragma', 'transf', 'array')] = pragma_array_edges
    edge_dict[('array', 'transf_by', 'array_pragma')] = array_pragma_edges

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

def _parse_md_file(
    metadata_path: Path
) -> Dict[str, Dict[str, Dict[str, str]]]:
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

def _parse_cfg_file(
    cfg_path: Path
) -> List[Tuple[int, int]]:
    # The format of the cfg file is as follows:
    # <num_edges>
    # <src_node_1>,<dst_node_1>
    # <src_node_2>,<dst_node_2>
    # ...
    with open(cfg_path, 'r') as f:
        lines = f.readlines()[1:]
    
    edges = [tuple(map(int, l.strip().split(','))) for l in lines]
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
    cfg_path: Path,
    output_folder: Optional[Path] = None
) -> HeteroData:
    import programl

    with open(ir_path, 'r') as ir_file:
        ir_text = ir_file.read()

    programl_cdfg = programl.from_llvm_ir(ir_text)

    inst_dict = _map_instruction_ids(ir_text)
    metadata = _parse_md_file(metadata_path)
    cfg_edges = _parse_cfg_file(cfg_path)

    ret = _build_nodes(programl_cdfg, metadata, inst_dict)
    cdfg, node_indices, inst_bb_map, inst_func_map, bb_func_map, \
        pragma_bb_map, pragma_func_map, pragma_array_map = ret
    
    cdfg = _build_edges(
        programl_cdfg, cdfg, node_indices, cfg_edges, 
        inst_bb_map, inst_func_map, bb_func_map,
        pragma_bb_map, pragma_func_map, pragma_array_map
    )

    cdfg_pt_out_path = output_folder / f"cdfg.pt"
    cdfg_txt_out_path = output_folder / f"cdfg.txt"
    programl_out_path = output_folder / f"pgml_cdfg.pbtxt"

    torch.save(cdfg, cdfg_pt_out_path)
    print_cdfg(cdfg, cdfg_txt_out_path)
    with open(programl_out_path, 'w') as f:
        f.write(str(programl_cdfg))

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
        elif node_type == 'bb':
            return 'B'
        elif node_type == 'func':
            return 'F'
        elif node_type == 'loop_pragma':
            return 'LP'
        elif node_type == 'array_pragma':
            return 'AP'
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
        "bb": "#FF0000",
        "func": "#00FF00",
        "loop_pragma": "#C3FF00",
        "array_pragma": "#006EFF"
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
        # Instruction-Instruction Edges
        ('inst', 'prec', 'inst'): "#CF2519",      # Control dependency
        ('inst', 'succ', 'inst'): "#CF2519",      # Control dependency
        ('inst', 'calls', 'inst'): "#8F19CF",     # Call relationship
        ('inst', 'called_by', 'inst'): "#8F19CF", # Call relationship
        ('inst', 'id', 'inst'): "#FFFFFF",        # Identity

        # Instruction-Variable Edges
        ('inst', 'uses', 'var'): "#1F1F1F",  # Data dependency
        ('inst', 'prod', 'var'): "#1F1F1F",  # Data dependency
        ('var', 'used_by', 'inst'): "#1F1F1F",  # Reverse data dependency
        ('var', 'prod_by', 'inst'): "#1F1F1F",  # Reverse data dependency
        ('var', 'id', 'var'): "#FFFFFF",  # Identity

        # Instruction-Array Edges
        ('inst', 'prod', 'array'): "#1F1F1F",  # Data dependency
        ('inst', 'uses', 'array'): "#1F1F1F",  # Data dependency
        ('array', 'used_by', 'inst'): "#1F1F1F",  # Reverse data dependency
        ('array', 'prod_by', 'inst'): "#1F1F1F",  # Reverse data dependency
        ('array', 'id', 'array'): "#FFFFFF",  # Identity

        # Instruction-Constant Edges
        ('inst', 'uses', 'const'): "#1F1F1F",  # Data dependency
        ('const', 'used_by', 'inst'): "#1F1F1F",  # Reverse data dependency
        ('const', 'id', 'const'): "#FFFFFF",  # Identity

        # Instruction-Basic Block Edges
        ('inst', 'belongs_to', 'bb'): "#197BCF",  # Membership relation

        # Instruction-Function Edges
        ('inst', 'belongs_to', 'func'): "#197BCF",  # Membership relation

        # Basic Block Edges
        ('bb', 'contains', 'inst'): "#197BCF",  # Containment relation
        ('bb', 'belongs_to', 'func'): "#197BCF",  # Membership relation
        ('bb', 'prec', 'bb'): "#CF2519",  # Control flow
        ('bb', 'succ', 'bb'): "#CF2519",  # Control flow
        ('bb', 'transf_by', 'loop_pragma'): "#19CF8F",  # Transformation
        ('bb', 'id', 'bb'): "#FFFFFF",  # Identity

        # Function Edges
        ('func', 'contains', 'bb'): "#197BCF",  # Containment relation
        ('func', 'contains', 'inst'): "#197BCF",  # Containment relation
        ('func', 'calls', 'func'): "#8F19CF",  # Function call relationship
        ('func', 'called_by', 'func'): "#8F19CF",  # Function call relationship
        ('func', 'transf_by', 'loop_pragma'): "#19CF8F",  # Transformation
        ('func', 'id', 'func'): "#FFFFFF",  # Identity

        # Pragmas
        ('loop_pragma', 'transf', 'bb'): "#19CF8F",  # Transformation
        ('loop_pragma', 'transf', 'func'): "#19CF8F",  # Transformation
        ('loop_pragma', 'id', 'loop_pragma'): "#FFFFFF",  # Identity

        ('array_pragma', 'transf', 'array'): "#19CF8F",  # Transformation
        ('array_pragma', 'id', 'array_pragma'): "#FFFFFF",  # Identity
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
    # Set print options to display the full tensor
    torch.set_printoptions(profile="full", threshold=1e9, linewidth=200)
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