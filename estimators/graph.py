from typing import List, Dict, Tuple, Union, Optional
from torch.types import Number
from torch_geometric.typing import NodeType, EdgeType

import torch
import matplotlib.pyplot as plt
from pathlib import Path
from enum import IntEnum
from torch import Tensor
from torch_geometric.data import HeteroData, Data
from torch_geometric.utils import to_networkx, remove_isolated_nodes

NODE_TYPES = ['inst', 'var', 'const', 'array', 'bb', 'func']
EDGE_TYPES = [
        # Instruction-Instruction Edges
        ('inst', 'control', 'inst'),     # Control-flow
        ('inst', 'control_rev', 'inst'), # Control-flow (reverse)
        ('inst', 'call', 'inst'),        # Call-flow
        ('inst', 'call_rev', 'inst'),    # Call-flow (reverse)

        # Instruction-Variable Edges
        ('inst', 'data', 'var'),       # Data-flow
        ('var', 'data', 'inst'),       # Data-flow
        ('inst', 'data_rev', 'var'),   # Data-flow (reverse)
        ('var', 'data_rev', 'inst'),   # Data-flow (reverse)

        # Instruction-Array Edges
        ('inst', 'data', 'array'),     # Data-flow
        ('array', 'data', 'inst'),     # Data-flow
        ('inst', 'data_rev', 'array'), # Data-flow (reverse)
        ('array', 'data_rev', 'inst'), # Data-flow (reverse)

        # Instruction-Constant Edges
        ('const', 'data', 'inst'),     # Data-flow
        ('inst', 'data_rev', 'const'), # Data-flow (reverse)

        # Instruction-Basic-Block Edges
        ('inst', 'member', 'bb'),      # Membership relation

        # Instruction-Function Edges
        ('inst', 'member', 'func'),    # Membership relation

        # Basic-Block Edges
        ('bb', 'contains', 'inst'),    # Containment relation
        ('bb', 'member', 'func'),      # Membership relation
        ('bb', 'control', 'bb'),       # Control-flow
        ('bb', 'control_rev', 'bb'),   # Control-flow (reverse)

        # Function Edges
        ('func', 'contains', 'bb'),    # Containment relation
        ('func', 'contains', 'inst'),  # Containment relation

        # Self-loops
        ('inst', 'self', 'inst'),
        ('var', 'self', 'var'),
        ('const', 'self', 'const'),
        ('array', 'self', 'array'),
        ('bb', 'self', 'bb'),
        ('func', 'self', 'func')
]
METADATA = (NODE_TYPES, EDGE_TYPES)

INST_FEATURES = 16
VAR_FEATURES = 7
CONST_FEATURES = 7
ARRAY_FEATURES = 22
BB_FEATURES = 9
FUNC_FEATURES = 14

NODE_FEATURE_DIMS = {
    'inst': INST_FEATURES,
    'var': VAR_FEATURES,
    'const': CONST_FEATURES,
    'array': ARRAY_FEATURES,
    'bb': BB_FEATURES,
    'func': FUNC_FEATURES
}

class NodeType(IntEnum):
    INST = 0
    VAR = 1
    CONST = 2

class EdgeFlow(IntEnum):
    CONTROL = 0
    DATA = 1
    CALL = 2

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

# Hierarchical "one-hot-like" encoding of instructions (12 bits)
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
    LLVMTypeID.INT:       [1,0,0,0,0,0],
    LLVMTypeID.HALF:      [0,1,0,0,0,0],
    LLVMTypeID.FLOAT:     [0,1,0,0,0,0],
    LLVMTypeID.DOUBLE:    [0,1,0,0,0,0],
    LLVMTypeID.X86_FP80:  [0,1,0,0,0,0],
    LLVMTypeID.FP128:     [0,1,0,0,0,0],
    LLVMTypeID.PPC_FP128: [0,1,0,0,0,0],
    LLVMTypeID.POINTER:   [0,0,1,0,0,0],
    LLVMTypeID.STRUCT:    [0,0,0,1,0,0],
    LLVMTypeID.VOID:      [0,0,0,0,1,0],
    LLVMTypeID.VECTOR:    [0,0,0,0,0,1],

    LLVMTypeID.ARRAY:     [0,0,0,0,0,1],
    LLVMTypeID.LABEL:     [0,0,0,0,0,1],
    LLVMTypeID.METADATA:  [0,0,0,0,0,1],
    LLVMTypeID.X86_MMX:   [0,0,0,0,0,1],
    LLVMTypeID.TOKEN:     [0,0,0,0,0,1],
    LLVMTypeID.FUNCTION:  [0,0,0,0,0,1]
}
TYPE_ENC_SIZE = 6

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
    if "pipeline" not in md or md["pipeline"] == 0:
        return [0, -1]
    is_function_level = md["functionLevel"]
    pragma_id = md["pipelineID"]
    return [is_function_level, pragma_id]

def _get_array_partition_info(md: Dict[str, Number]) -> List[int]:
    if "arrayPartition" not in md or md["arrayPartition"] == 0:
        return [0] * 9 + [-1]
    MAX_ARRAY_DIMS = 4 # Maximum number of dimensions (4D arrays) for now
    dim = md["arrayPartitionDim"]
    enc_dim = [0] * (MAX_ARRAY_DIMS + 1)
    if dim > MAX_ARRAY_DIMS:
        dim = MAX_ARRAY_DIMS
    enc_dim[dim] = 1
    partition_type = md["arrayPartitionType"]
    enc_partition_type = [0, 0, 0]
    enc_partition_type[partition_type - 1] = 1
    factor = md["arrayPartitionFactor"]
    pragma_id = md["arrayPartitionID"]
    return enc_partition_type + enc_dim + [factor, pragma_id]

def _get_unroll_info(md: Dict[str, Number]) -> List[int]:
    if "unroll" not in md or md["unroll"] == 0:
        return [0, 0, -1]
    complete = md["unrollComplete"]
    factor = md["unrollFactor"]
    pragma_id = md["unrollID"]
    return [complete, factor, pragma_id]

def _get_loop_flatten_info(md: Dict[str, Number]) -> List[int]:
    if "loopFlatten" not in md or md["loopFlatten"] == 0:
        return [-1]
    pragma_id = md["loopFlattenID"]
    return [pragma_id]

def _get_loop_merge_info(md: Dict[str, Number]) -> List[int]:
    if "loopMerge" not in md or md["loopMerge"] == 0:
        return [0, -1]
    is_function_level = md["functionLevel"]
    pragma_id = md["loopMergeID"]
    return [is_function_level, pragma_id]

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

def _build_edge_tensor(src: int, dst: int) -> Tensor:
    return torch.tensor([src, dst], dtype=torch.int64)

def _build_nodes(
    programl_graph,
    metadata: Dict[str, Dict[str, Dict[str, str]]],
    inst_dict: Dict[int, str]
) -> Tuple[HeteroData, Dict[NodeType, List[int]], Dict[EdgeType, Tensor]]:
    nodes = {nt: [] for nt in NODE_TYPES}
    indices = {nt: [] for nt in NODE_TYPES}

    additional_edges = {
        ('inst', 'member', 'bb'): [], 
        ('inst', 'member', 'func'): [], 
        ('bb', 'member', 'func'): [],
        ('bb', 'contains', 'inst'): [], 
        ('func', 'contains', 'inst'): [], 
        ('func', 'contains', 'bb'): []
    }

    # External functions are represented an instruction node
    # with all-zero features and index 0
    nodes['inst'].append(torch.zeros(INST_FEATURES, dtype=torch.float32))
    indices["inst"].append(0)

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

            num_uses = md["numUses"]
            mod_mem = md["modifiesMemory"]
            reads_mem = md["readsMemory"]
            mod_cf = md["modifiesControlFlow"]

            inst_features = one_hot_inst + [num_uses, mod_mem, reads_mem, mod_cf]
            nodes['inst'].append(torch.tensor(inst_features, dtype=torch.float32))
            indices["inst"].append(i)

            bb_id = md["bbID"]
            function_id = md["functionID"]

            additional_edges[('inst', 'member', 'bb')].append((i, bb_id))
            additional_edges[('bb', 'contains', 'inst')].append((bb_id, i))
            additional_edges[('inst', 'member', 'func')].append((i, function_id))
            additional_edges[('func', 'contains', 'inst')].append((function_id, i))

            pipeline_md = _get_pipeline_info(md)
            unroll_md = _get_unroll_info(md)
            merge_md = _get_loop_merge_info(md)
            flatten_md = _get_loop_flatten_info(md)

            pipeline_id = pipeline_md[-1]
            unroll_id = unroll_md[-1]
            merge_id = merge_md[-1]
            flatten_id = flatten_md[-1]

            function_pipeline = pipeline_md[0] == 1
            function_merge = merge_md[0] == 1
            
            if bb_id not in indices["bb"]:
                bb_size = md["bbSize"]
                depth = _get_loop_depth(md)
                tc = _get_trip_count(md)

                pipelined = 1 if pipeline_id != -1 and not function_pipeline else 0
                unrolled = 1 if unroll_id != -1 else 0
                merged = 1 if merge_id != -1 and not function_merge else 0
                flattened = 1 if flatten_id != -1 else 0
                if unrolled:
                    unroll_feats = unroll_md[:-1]
                else:
                    unroll_feats = [0, 0]

                features = ([bb_size, depth, tc, pipelined, merged, flattened, unrolled] 
                            + unroll_feats)
                nodes['bb'].append(torch.tensor(features, dtype=torch.float32))
                indices["bb"].append(bb_id)
                additional_edges[('bb', 'member', 'func')].append((bb_id, function_id))
                additional_edges[('func', 'contains', 'bb')].append((function_id, bb_id))

            if function_id not in indices["func"]:
                n_operands = md["funcNumOperands"]
                n_uses = md["funcNumUses"]
                n_insts = md["funcNumInsts"]
                n_bbs = md["funcNumBBs"]
                n_loops = md["funcNumLoops"]

                ret_type = md["funcRetType"]
                ret_bw = md["funcRetBitwidth"]
                ret_type_features = TYPE_ENC[ret_type] + [ret_bw]

                pipelined = 1 if pipeline_id != -1 and function_pipeline else 0
                merged = 1 if merge_id != -1 and function_merge else 0

                features = ([n_operands, n_uses, n_insts, n_bbs, n_loops]
                            + ret_type_features + [pipelined, merged])
                nodes['func'].append(torch.tensor(features, dtype=torch.float32))
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

                nt = 'var' if node_type == NodeType.VAR else 'const'
                nodes[nt].append(torch.tensor(features, dtype=torch.float32))
                indices[nt].append(i)
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
                    continue

            if "isArray" in md and md["isArray"] == 1:
                array_md = _get_array_info(md)
                elem_type_id = array_md[5]
                elem_bw = array_md[6]
                elem_type_features = TYPE_ENC[elem_type_id] + [elem_bw]

                partition_md = _get_array_partition_info(md)
                partition_id = partition_md[-1]
                partitioned = 1 if partition_id != -1 else 0
                if partitioned:
                    partition_feats = partition_md[:-1]
                else:
                    partition_feats = [0] * 9

                features = array_md[:5] + elem_type_features + [partitioned] + partition_feats
                nt = 'array'
            else:
                type_id = md["type"]
                bw = md["bitwidth"]
                features = TYPE_ENC[type_id] + [bw]
                nt = 'var' if node_type == NodeType.VAR else 'const'

            nodes[nt].append(torch.tensor(features, dtype=torch.float32))
            indices[nt].append(i)

    graph = HeteroData()
    for key in nodes.keys():
        if len(nodes[key]) > 0:
            graph[key].x = torch.stack(nodes[key])
        else:
            feature_dim = NODE_FEATURE_DIMS[key]
            graph[key].x = torch.empty((0, feature_dim), dtype=torch.float32)

    reindexed_edges = {}
    for et, edges in additional_edges.items():
        reindexed_edges[et] = []
        for edge in edges:
            src, dst = edge
            src_idx = indices[et[0]].index(src)
            dst_idx = indices[et[2]].index(dst)
            reindexed_edges[et].append(_build_edge_tensor(src_idx, dst_idx))
        if len(edges) > 0:
            reindexed_edges[et] = torch.stack(reindexed_edges[et]).transpose(0, 1)
        else:
            reindexed_edges[et] = torch.empty((2, 0), dtype=torch.int64)

    return graph, indices, reindexed_edges

def _build_edges(
    programl_graph,
    graph: HeteroData,
    indices: Dict[str, List[int]],
    cfg_edges: List[Tuple[int, int]],
    additional_edges: Dict[EdgeType, Tensor]
) -> HeteroData:
    edge_dict = {et: [] for et in EDGE_TYPES}
    
    for edge in programl_graph.edge:
        src, dst = edge.source, edge.target
        if src in indices["inst"]: 
            src_idx = indices["inst"].index(src)
            if dst in indices["inst"]:
                dst_idx = indices["inst"].index(dst)
                edge_tensor = _build_edge_tensor(src_idx, dst_idx)
                rev_edge_tensor = _build_edge_tensor(dst_idx, src_idx)
                if edge.flow == EdgeFlow.CONTROL:
                    edge_dict[('inst', 'control', 'inst')].append(edge_tensor)
                    edge_dict[('inst', 'control_rev', 'inst')].append(rev_edge_tensor)
                else:
                    edge_dict[('inst', 'call', 'inst')].append(edge_tensor)
                    edge_dict[('inst', 'call_rev', 'inst')].append(rev_edge_tensor)
            else:
                if dst in indices["array"]:
                    dst_type_name = 'array'
                elif dst in indices["var"]:
                    dst_type_name = 'var'
                else:
                    continue
                dst_idx = indices[dst_type_name].index(dst)
                edge_tensor = _build_edge_tensor(src_idx, dst_idx)
                rev_edge_tensor = _build_edge_tensor(dst_idx, src_idx)
                edge_dict[('inst', 'data', dst_type_name)].append(edge_tensor)
                edge_dict[(dst_type_name, 'data_rev', 'inst')].append(rev_edge_tensor)
        elif dst in indices["inst"]:
            if src in indices["array"]:
                src_type_name = 'array'
            elif src in indices["var"]:
                src_type_name = 'var'
            elif src in indices["const"]:
                src_type_name = 'const'
            else:
                continue
            src_idx = indices[src_type_name].index(src)
            dst_idx = indices["inst"].index(dst)
            edge_tensor = _build_edge_tensor(src_idx, dst_idx)
            rev_edge_tensor = _build_edge_tensor(dst_idx, src_idx)
            edge_dict[(src_type_name, 'data', 'inst')].append(edge_tensor)
            edge_dict[('inst', 'data_rev', src_type_name)].append(rev_edge_tensor)

    for edge in cfg_edges:
        if edge[0] not in indices["bb"] or edge[1] not in indices["bb"]:
            continue
        src_idx = indices["bb"].index(edge[0])
        dst_idx = indices["bb"].index(edge[1])
        edge_tensor = _build_edge_tensor(src_idx, dst_idx)
        rev_edge_tensor = _build_edge_tensor(dst_idx, src_idx)
        edge_dict[('bb', 'control', 'bb')].append(edge_tensor)
        edge_dict[('bb', 'control_rev', 'bb')].append(rev_edge_tensor)

    # Add self-loops for all nodes
    for k, v in indices.items():
        num_nodes = len(v)
        for i in range(num_nodes):
            edge_tensor = _build_edge_tensor(i, i)
            edge_dict[(k, 'self', k)].append(edge_tensor)

    for et, edges in edge_dict.items():
        if len(edges) > 0:
            graph[et].edge_index = torch.stack(edges).transpose(0, 1)
        else:
            graph[et].edge_index = torch.empty((2, 0), dtype=torch.int64)

    for et, edges in additional_edges.items():
        graph[et].edge_index = edges

    return graph

def _parse_md_file(
    metadata_path: Path
) -> Dict[str, Dict[str, Dict[str, str]]]:
    """
    The format of the metadata file is as follows:

    node_type_1:
      node_name_1:
        metadata_name_1: value
        metadata_name_2: value
        ...
      node_name_2:
      ...
    node_type_2:
    ...
    
    """
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
    output_folder: Optional[Path] = None,
) -> HeteroData:
    import programl

    with open(ir_path, 'r') as ir_file:
        ir_text = ir_file.read()

    programl_cdfg = programl.from_llvm_ir(ir_text)

    inst_dict = _map_instruction_ids(ir_text)
    metadata = _parse_md_file(metadata_path)
    cfg_edges = _parse_cfg_file(cfg_path)

    cdfg, indices, additional_edges = _build_nodes(programl_cdfg, metadata, inst_dict)
    cdfg = _build_edges(programl_cdfg, cdfg, indices, cfg_edges, additional_edges)

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

    cdfg_cp = cdfg.clone()

    n_insts = cdfg_cp['inst'].x.size(0)
    n_vars = cdfg_cp['var'].x.size(0)
    n_consts = cdfg_cp['const'].x.size(0)
    n_arrays = cdfg_cp['array'].x.size(0)
    n_bbs = cdfg_cp['bb'].x.size(0)

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
        return 'U'
        
    def get_label(type: NodeType, idx: int) -> str:
        if type == 'var':
            idx -= n_insts
        elif type == 'const':
            idx -= n_insts + n_vars
        elif type == 'array':
            idx -= n_insts + n_vars + n_consts
        elif type == 'bb':
            idx -= n_insts + n_vars + n_consts + n_arrays
        elif type == 'func':
            idx -= n_insts + n_vars + n_consts + n_arrays + n_bbs
        return f"{get_short_type(type)}{idx}"
    
    for et in cdfg_cp.edge_index_dict.keys():
        if "rev" in et[1] or et[1] == "self" or et[1] == "contains":
            cdfg_cp[et].edge_index = torch.empty((2, 0), dtype=torch.int64)

    nx_cdfg = to_networkx(
        cdfg_cp, remove_self_loops=True,
        to_undirected=False, node_attrs=['x']
    )

    # Define colors for the nodes
    node_type_colors = {
        "inst": "#f28522",
        "var": "#00cd6c",
        "const": "#009ade",
        "array": "#af58ba",
        "bb": "#ffc61e",
        "func": "#ff1f58"
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
        ('inst', 'control', 'inst'): "#CF2519", # Control-flow
        ('inst', 'call', 'inst'): "#8F19CF",    # Call-flow
        ('inst', 'data', 'var'): "#1F1F1F",     # Data-flow
        ('var', 'data', 'inst'): "#1F1F1F",     # Data-flow
        ('inst', 'data', 'array'): "#1F1F1F",   # Data-flow
        ('array', 'data', 'inst'): "#1F1F1F",   # Data-flow
        ('const', 'data', 'inst'): "#1F1F1F",   # Data-flow
        ('inst', 'member', 'bb'): "#197BCF",    # Membership relation
        ('inst', 'member', 'func'): "#197BCF",  # Membership relation
        ('bb', 'member', 'func'): "#197BCF",    # Membership relation
        ('bb', 'control', 'bb'): "#CF2519",     # Control-flow
    }

    edge_colors = []
    for from_node, to_node, attrs in nx_cdfg.edges(data=True):
        edge_type = attrs["type"]
        color = edge_type_colors[edge_type]
        nx_cdfg.edges[from_node, to_node]["color"] = color
        edge_colors.append(color)

    # Draw the graph
    pos = nx.spring_layout(nx_cdfg, seed=42)
    nx.draw_networkx(
        nx_cdfg,
        pos=pos,
        labels=labels,
        with_labels=True,
        node_color=node_colors,
        edge_color=edge_colors,
        node_size=70,
        font_size=8,
        width=0.7,
        arrowsize=7
    )

    edge_guide = {
        "Control": "#CF2519",
        "Call": "#8F19CF",
        "Data": "#1F1F1F",
        "Membership": "#197BCF"
    }
    for i, (edge_type, color) in enumerate(edge_guide.items()):
        plt.text(0.8, 1.2 - i * 0.1, f"{edge_type}: ", color=color, fontsize=9)
        plt.text(0.95, 1.2 - i * 0.1, f"{color}", color=color, fontsize=9)

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
    from sys import argv

    ir_path = Path(argv[1])
    metadata_path = Path(argv[2])
    cfg_path = Path(argv[3])
    output_path = Path(argv[4])

    build_cdfg(ir_path, metadata_path, cfg_path, output_path)