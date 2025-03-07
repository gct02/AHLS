from pathlib import Path
from enum import IntEnum
from typing import List, Dict, Tuple, Union, Optional

import torch
import matplotlib.pyplot as plt
from torch import Tensor
from torch_geometric.data import HeteroData, Data
from torch_geometric.utils import to_networkx
from torch_geometric.typing import NodeType, EdgeType


NODE_TYPES = [
    'inst', 'var', 'const', 'array', 'loop', 
    'partition', 'unroll', 'pipeline', 'loop-opt'
]

EDGE_TYPES = [
    # Data flow
    ('inst', 'data', 'var'),
    ('var', 'data', 'inst'),
    ('inst', 'data', 'array'),
    ('array', 'data', 'inst'),
    ('const', 'data', 'inst'),

    # Control flow
    ('inst', 'control', 'inst'),

    # Call flow
    ('inst', 'call', 'inst'),

    # Loop hierarchy
    ('loop', 'hierarchy', 'loop'),
    ('loop', 'hierarchy', 'inst'),

    # Pragmas
    ('partition', 'transform', 'array'),
    ('unroll', 'transform', 'loop'),
    ('pipeline', 'transform', 'loop'),
    ('loop-opt', 'transform', 'loop'),

    # Self-loops
    ('inst', 'self', 'inst'),
    ('var', 'self', 'var'),
    ('const', 'self', 'const'),
    ('array', 'self', 'array'),
    ('loop', 'self', 'loop'),
    ('partition', 'self', 'partition'),
    ('unroll', 'self', 'unroll'),
    ('pipeline', 'self', 'pipeline'),
    ('loop-opt', 'self', 'loop-opt')
]

METADATA = (NODE_TYPES, EDGE_TYPES)

INST_FEATURES = 12
VAR_FEATURES = 7
CONST_FEATURES = 7
ARRAY_FEATURES = 7
LOOP_FEATURES = 2
PARTITION_FEATURES = 9
UNROLL_FEATURES = 2
PIPELINE_FEATURES = 1
LOOP_OPT_FEATURES = 2

NODE_FEATURE_DIMS = {
    'inst': INST_FEATURES,
    'var': VAR_FEATURES,
    'const': CONST_FEATURES,
    'array': ARRAY_FEATURES,
    'loop': LOOP_FEATURES,
    'partition': PARTITION_FEATURES,
    'unroll': UNROLL_FEATURES,
    'pipeline': PIPELINE_FEATURES,
    'loop-opt': LOOP_OPT_FEATURES
}


def build_cdfg(
    ir_path: Path,
    metadata_path: Path,
    loop_hierarchy_path: Path,
    output_folder: Optional[Path] = None
) -> HeteroData:
    import programl

    with open(ir_path, 'r') as ir_file:
        programl_graph = programl.from_llvm_ir(ir_file.read())

    metadata = _parse_md_file(metadata_path)
    loop_hierarchy, top_level_loops = _parse_loop_hierarchy(loop_hierarchy_path)

    cdfg, indices, additional_edges = _build_nodes(
        programl_graph, metadata, loop_hierarchy, top_level_loops
    )
    cdfg = _build_edges(programl_graph, cdfg, indices, additional_edges)

    # print(f"Plotting the CDFG for {ir_path}")
    # plot_cdfg(cdfg)

    if output_folder:
        cdfg_pt_out_path = output_folder / f"cdfg.pt"
        cdfg_txt_out_path = output_folder / f"cdfg.txt"
        programl_out_path = output_folder / f"pgml_cdfg.pbtxt"

        torch.save(cdfg, cdfg_pt_out_path)
        print_cdfg(cdfg, cdfg_txt_out_path)
        with open(programl_out_path, 'w') as f:
            f.write(str(programl_graph))

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
    n_loops = cdfg_cp['loop'].x.size(0)
    n_partitions = cdfg_cp['partition'].x.size(0)
    n_loop_opts = cdfg_cp['loop-opt'].x.size(0)
    n_unrolls = cdfg_cp['unroll'].x.size(0)

    def get_short_type(node_type: _PGMLNodeType) -> str:
        if node_type == 'inst':
            return 'I'
        elif node_type == 'var':
            return 'V'
        elif node_type == 'const':
            return 'C'
        elif node_type == 'array':
            return 'A'
        elif node_type == 'loop':
            return 'L'
        elif node_type == 'loop-opt':
            return 'LP'
        elif node_type == 'partition':
            return 'AP'
        return 'U'
        
    def get_label(type: _PGMLNodeType, idx: int) -> str:
        if type == 'var':
            idx -= n_insts
        elif type == 'const':
            idx -= n_insts + n_vars
        elif type == 'array':
            idx -= n_insts + n_vars + n_consts
        elif type == 'loop':
            idx -= n_insts + n_vars + n_consts + n_arrays
        elif type == 'loop-opt':
            idx -= n_insts + n_vars + n_consts + n_arrays + n_loops
        elif type == 'partition':
            idx -= (n_insts + n_vars + n_consts + n_arrays + n_loops 
                    + n_loop_opts)
        elif type == 'unroll':
            idx -= (n_insts + n_vars + n_consts + n_arrays + n_loops 
                    + n_loop_opts + n_partitions)
        elif type == 'pipeline':
            idx -= (n_insts + n_vars + n_consts + n_arrays + n_loops 
                    + n_loop_opts + n_partitions + n_unrolls)
        return f"{get_short_type(type)}{idx}"
    
    for et in cdfg_cp.edge_index_dict.keys():
        if et[1] == "self":
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
        "loop": "#fa5252",
        "loop-opt": "#b8b8b8",
        "partition": "#b8b8b8",
        "unroll": "#b8b8b8",
        "pipeline": "#b8b8b8"
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
        ('inst', 'control', 'inst'): "#009ade", 
        ('inst', 'call', 'inst'): "#2044f7", 
        ('inst', 'data', 'var'): "#1f1f1f", 
        ('var', 'data', 'inst'): "#1f1f1f", 
        ('inst', 'data', 'array'): "#1f1f1f", 
        ('array', 'data', 'inst'): "#1f1f1f", 
        ('const', 'data', 'inst'): "#1f1f1f", 
        ('loop', 'hierarchy', 'loop'): "#14a60f",
        ('loop', 'hierarchy', 'inst'): "#14a60f",
        ('loop-opt', 'transform', 'loop'): "#f216a5",
        ('unroll', 'transform', 'loop'): "#f216a5",
        ('pipeline', 'transform', 'loop'): "#f216a5",
        ('partition', 'transform', 'array'): "#f216a5"
    }

    edge_colors = []
    for from_node, to_node, attrs in nx_cdfg.edges(data=True):
        edge_type = attrs["type"]
        color = edge_type_colors[edge_type]
        nx_cdfg.edges[from_node, to_node]["color"] = color
        edge_colors.append(color)

    # Draw the graph
    pos = nx.kamada_kawai_layout(nx_cdfg)
    plt.figure(figsize=(12, 8))
    nx.draw_networkx(
        nx_cdfg,
        pos=pos,
        labels=labels,
        with_labels=True,
        node_color=node_colors,
        edge_color=edge_colors,
        node_size=80,
        font_size=9,
        width=0.8,
        arrowsize=8
    )

    edge_guide = {
        "Control": "#009ade",
        "Call": "#2044f7",
        "Data": "#1f1f1f",
        "Loop Hierarchy": "#14a60f",
        "Pragma": "#f216a5"
    }
    for i, (edge_type, color) in enumerate(edge_guide.items()):
        plt.text(0.8, 1 - i * 0.1, f"{edge_type}: ", color=color, fontsize=9)
        plt.text(0.95, 1 - i * 0.1, f"{color}", color=color, fontsize=9)

    plt.axis("off")
    if output_path is not None:
        plt.savefig(output_path)
    else:
        plt.show()
    plt.close()


def print_cdfg(cdfg: HeteroData, output_path: Optional[Path] = None):
    # Set print options to display the full tensor
    torch.set_printoptions(profile="full", threshold=1e9, linewidth=200)
    cdfg_dict = cdfg.to_dict()
    if output_path is not None:
        with open(output_path, "w") as f:
            f.write(str(cdfg_dict))
    else:
        print(cdfg_dict)


class _PGMLNodeType(IntEnum):
    INST = 0
    VAR = 1
    CONST = 2

class _PGMLEdgeType(IntEnum):
    CONTROL = 0
    DATA = 1
    CALL = 2

# Type IDs from LLVM 7.0
class _LLVMTypeID(IntEnum):
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
class _LLVMOpcode(IntEnum):
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
    GEP = 32
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
_INSTRUCTION_ENC = {
    # Arithmetic
    _LLVMOpcode.ADD:     [1,0,0,0,0, 1,0,0,0,0, 0,1],
    _LLVMOpcode.FADD:    [1,0,0,0,0, 1,0,0,0,0, 1,0],
    _LLVMOpcode.SUB:     [1,0,0,0,0, 0,1,0,0,0, 0,1],
    _LLVMOpcode.FSUB:    [1,0,0,0,0, 0,1,0,0,0, 1,0],
    _LLVMOpcode.MUL:     [1,0,0,0,0, 0,0,1,0,0, 0,1],
    _LLVMOpcode.FMUL:    [1,0,0,0,0, 0,0,1,0,0, 1,0],
    _LLVMOpcode.SDIV:    [1,0,0,0,0, 0,0,0,1,0, 0,1],
    _LLVMOpcode.UDIV:    [1,0,0,0,0, 0,0,0,1,0, 0,0],
    _LLVMOpcode.FDIV:    [1,0,0,0,0, 0,0,0,1,0, 1,0],
    _LLVMOpcode.SREM:    [1,0,0,0,0, 0,0,0,0,1, 0,1],
    _LLVMOpcode.UREM:    [1,0,0,0,0, 0,0,0,0,1, 0,0],
    _LLVMOpcode.FREM:    [1,0,0,0,0, 0,0,0,0,1, 1,0],

    # Logical
    _LLVMOpcode.SHL:     [0,1,0,0,0, 1,0,0,0,0, 0,0],
    _LLVMOpcode.LSHR:    [0,1,0,0,0, 0,1,0,0,0, 0,0],
    _LLVMOpcode.ASHR:    [0,1,0,0,0, 0,1,0,0,0, 0,1],
    _LLVMOpcode.AND:     [0,1,0,0,0, 0,0,1,0,0, 0,0],
    _LLVMOpcode.OR:      [0,1,0,0,0, 0,0,0,1,0, 0,0],
    _LLVMOpcode.XOR:     [0,1,0,0,0, 0,0,0,0,1, 0,0],

    # Memory
    _LLVMOpcode.ALLOCA:  [0,0,1,0,0, 1,0,0,0,0, 0,0],
    _LLVMOpcode.LOAD:    [0,0,1,0,0, 0,1,0,0,0, 0,0],
    _LLVMOpcode.STORE:   [0,0,1,0,0, 0,0,1,0,0, 0,0],
    _LLVMOpcode.GEP:     [0,0,1,0,0, 0,0,0,1,0, 0,0],

    # Casts
    _LLVMOpcode.TRUNC:   [0,0,0,1,0, 1,0,0,0,0, 0,0],
    _LLVMOpcode.FPTRUNC: [0,0,0,1,0, 1,0,0,0,0, 1,0],
    _LLVMOpcode.ZEXT:    [0,0,0,1,0, 0,1,0,0,0, 0,0],
    _LLVMOpcode.SEXT:    [0,0,0,1,0, 0,1,0,0,0, 0,1],
    _LLVMOpcode.FPEXT:   [0,0,0,1,0, 0,1,0,0,0, 1,0],
    _LLVMOpcode.BITCAST: [0,0,0,1,0, 0,0,1,0,0, 0,0],

    # Control flow
    _LLVMOpcode.BR:      [0,0,0,0,1, 1,0,0,0,0, 0,0],
    _LLVMOpcode.RET:     [0,0,0,0,1, 0,1,0,0,0, 0,0],
    _LLVMOpcode.CALL:    [0,0,0,0,1, 0,0,1,0,0, 0,0],
    _LLVMOpcode.PHI:     [0,0,0,0,1, 0,0,0,1,0, 0,0],
    _LLVMOpcode.ICMP:    [0,0,0,0,1, 0,0,0,0,1, 0,0],
    _LLVMOpcode.FCMP:    [0,0,0,0,1, 0,0,0,0,1, 1,0]
}

_TYPE_ENC = {
    _LLVMTypeID.INT:       [1,0,0,0,0,0],
    _LLVMTypeID.HALF:      [0,1,0,0,0,0],
    _LLVMTypeID.FLOAT:     [0,1,0,0,0,0],
    _LLVMTypeID.DOUBLE:    [0,1,0,0,0,0],
    _LLVMTypeID.X86_FP80:  [0,1,0,0,0,0],
    _LLVMTypeID.FP128:     [0,1,0,0,0,0],
    _LLVMTypeID.PPC_FP128: [0,1,0,0,0,0],
    _LLVMTypeID.POINTER:   [0,0,1,0,0,0],
    _LLVMTypeID.STRUCT:    [0,0,0,1,0,0],
    _LLVMTypeID.VOID:      [0,0,0,0,1,0],
    _LLVMTypeID.VECTOR:    [0,0,0,0,0,1],

    _LLVMTypeID.ARRAY:     [0,0,0,0,0,1],
    _LLVMTypeID.LABEL:     [0,0,0,0,0,1],
    _LLVMTypeID.METADATA:  [0,0,0,0,0,1],
    _LLVMTypeID.X86_MMX:   [0,0,0,0,0,1],
    _LLVMTypeID.TOKEN:     [0,0,0,0,0,1],
    _LLVMTypeID.FUNCTION:  [0,0,0,0,0,1]
}

def _build_nodes(
    programl_graph,
    metadata: Dict[str, Dict[str, Dict[str, str]]],
    loop_hierarchy: Dict[int, List[int]],
    top_level_loops: Dict[int, List[int]]
) -> Tuple[HeteroData, Dict[NodeType, List[int]], Dict[EdgeType, Tensor]]:
    nodes = {nt: [] for nt in NODE_TYPES}
    indices = {nt: [] for nt in NODE_TYPES}

    additional_edges = {
        ('loop', 'hierarchy', 'loop'): [],
        ('loop', 'hierarchy', 'inst'): [],
        ('partition', 'transform', 'array'): [],
        ('unroll', 'transform', 'loop'): [],
        ('pipeline', 'transform', 'loop'): [],
        ('loop-opt', 'transform', 'loop'): []
    }

    for i, node in enumerate(programl_graph.node):
        node_type, node_text = node.type, node.text
        if len(node_text) == 0 or node_text == "[external]":
            continue

        node_full_text = (node.features.feature["full_text"]
                          .bytes_list.value.__str__()[1:-1])
        if node_full_text[0] == 'b':
            node_full_text = node_full_text[2:-1]

        if node_type == _PGMLNodeType.INST:
            if "!ID." not in node_full_text:
                continue

            op_id = node_full_text.split('!ID.')[1].split(' ')[0]
            md = _to_numeric_md(metadata["instruction"][op_id])
            opcode = md["opcode"]
            if opcode not in _INSTRUCTION_ENC:
                one_hot_inst = [0] * 12
            else:
                one_hot_inst = _INSTRUCTION_ENC[opcode]

            nodes['inst'].append(torch.tensor(one_hot_inst, dtype=torch.float32))
            indices["inst"].append(i)

            if "loopID" in md:
                loop_id = md["loopID"]
                additional_edges[('loop', 'hierarchy', 'inst')].append((loop_id, i))
        elif node_type == _PGMLNodeType.VAR or node_type == _PGMLNodeType.CONST:
            if '@' in node_full_text:
                name = node_full_text[node_full_text.find('@') + 1:].split(' ')[0]
            elif '%' in node_full_text:
                name = node_full_text[node_full_text.find('%') + 1:].split(' ')[0]
            else:
                # Value does not have a name (e.g. literal constant)
                if '*' in node_full_text: # Value is a pointer
                    features = _TYPE_ENC[_LLVMTypeID.POINTER] + [0]
                else: # Value is a literal constant
                    features = _parse_literal_const_info(node_text)
                nt = 'var' if node_type == _PGMLNodeType.VAR else 'const'
                nodes[nt].append(torch.tensor(features, dtype=torch.float32))
                indices[nt].append(i)
                continue

            if ',' in name:
                name = name.split(',')[0]
            if ')' in name:
                name = name.split(')')[0]

            if name in metadata["value"]:
                md = _to_numeric_md(metadata["value"][name])
            else:
                function_id = node.function + 1
                name = f"{name}.{function_id}"
                if name in metadata["param"]:
                    md = _to_numeric_md(metadata["param"][name])
                else:
                    continue

            if "isArray" in md and md["isArray"] == 1:
                array_md = _get_array_info(md)
                elem_type_id = array_md[5]
                elem_bw = array_md[6]
                features = array_md[:5] + _TYPE_ENC[elem_type_id] + [elem_bw]

                nodes['array'].append(torch.tensor(features, dtype=torch.float32))
                indices['array'].append(i)

                if "partition" in md:
                    pragma_id = md["partitionID"]
                    additional_edges[('partition', 'transform', 'array')].append(
                        (pragma_id, i)
                    )
                    if pragma_id in indices['partition']:
                        continue
                    partition_feats = _get_partition_features(md)
                    nodes['partition'].append(
                        torch.tensor(partition_feats, dtype=torch.float32)
                    )
                    indices['partition'].append(pragma_id)
            else:
                type_id = md["type"]
                bw = md["bitwidth"]
                features = _TYPE_ENC[type_id] + [bw]
                if node_type == _PGMLNodeType.VAR:
                    nodes['var'].append(torch.tensor(features, dtype=torch.float32))
                    indices['var'].append(i)
                else:
                    nodes['const'].append(torch.tensor(features, dtype=torch.float32))
                    indices['const'].append(i)

    for loop_md in metadata["loop"].values():
        loop_md = _to_numeric_md(loop_md)
        loop_id = loop_md["ID"]
        loop_depth = loop_md["depth"]
        trip_count = loop_md["tripCount"]
        features = [loop_depth, trip_count]
        nodes['loop'].append(torch.tensor(features, dtype=torch.float32))
        indices['loop'].append(loop_id)

        if "unroll" in loop_md:
            pragma_id = loop_md["unrollID"]
            additional_edges[('unroll', 'transform', 'loop')].append(
                (pragma_id, loop_id)
            )
            if pragma_id in indices['unroll']:
                continue
            complete_unroll = loop_md["unrollComplete"]
            factor = loop_md["unrollFactor"]
            unroll_features = [complete_unroll, factor]
            nodes['unroll'].append(
                torch.tensor(unroll_features, dtype=torch.float32)
            )
            indices['unroll'].append(pragma_id)
        if "flatten" in loop_md:
            pragma_id = loop_md["flattenID"]
            additional_edges[('loop-opt', 'transform', 'loop')].append(
                (pragma_id, loop_id)
            )
            if pragma_id in indices['loop-opt']:
                continue
            flatten_features = [0, 1]
            nodes['loop-opt'].append(
                torch.tensor(flatten_features, dtype=torch.float32)
            )
            indices['loop-opt'].append(pragma_id)
        if "merge" in loop_md:
            pragma_id = loop_md["mergeID"]
            for subloop_id in loop_hierarchy[loop_id]:
                additional_edges[('loop-opt', 'transform', 'loop')].append(
                    (pragma_id, subloop_id)
                )
            if pragma_id in indices['loop-opt']:
                continue
            merge_features = [1, 0]
            nodes['loop-opt'].append(
                torch.tensor(merge_features, dtype=torch.float32)
            )
            indices['loop-opt'].append(pragma_id)
        if "pipeline" in loop_md:
            pragma_id = loop_md["pipelineID"]
            additional_edges[('pipeline', 'transform', 'loop')].append(
                (pragma_id, loop_id)
            )
            if pragma_id in indices['pipeline']:
                continue
            pipeline_features = [1]
            nodes['pipeline'].append(
                torch.tensor(pipeline_features, dtype=torch.float32)
            )
            indices['pipeline'].append(pragma_id)

    for function_md in metadata["function"].values():
        function_md = _to_numeric_md(function_md)
        function_id = function_md["ID"]
        if "merge" in function_md:
            pragma_id = function_md["mergeID"]
            for loop_id in top_level_loops[function_id]:
                additional_edges[('loop-opt', 'transform', 'loop')].append(
                    (pragma_id, loop_id)
                )
            if pragma_id in indices['loop-opt']:
                continue
            merge_features = [1, 0]
            nodes['loop-opt'].append(
                torch.tensor(merge_features, dtype=torch.float32)
            )
            indices['loop-opt'].append(pragma_id)

    for loop_id, children in loop_hierarchy.items():
        for child_id in children:
            if loop_id not in indices['loop'] or child_id not in indices['loop']:
                continue
            additional_edges[('loop', 'hierarchy', 'loop')].append((loop_id, child_id))

    graph = HeteroData()
    for nt in nodes.keys():
        if len(nodes[nt]) > 0:
            graph[nt].x = torch.stack(nodes[nt])
        else:
            feature_dim = NODE_FEATURE_DIMS[nt]
            graph[nt].x = torch.empty((0, feature_dim), dtype=torch.float32)

    reindexed_edges = {}
    for et, edges in additional_edges.items():
        reindexed_edges[et] = []
        for edge in edges:
            src, dst = edge
            if src not in indices[et[0]] or dst not in indices[et[2]]:
                continue
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
    indices: Dict[NodeType, List[int]],
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
                if edge.flow == _PGMLEdgeType.CONTROL:
                    edge_dict[('inst', 'control', 'inst')].append(edge_tensor)
                else:
                    edge_dict[('inst', 'call', 'inst')].append(edge_tensor)
            else:
                if dst in indices["array"]:
                    dst_type_name = 'array'
                elif dst in indices["var"]:
                    dst_type_name = 'var'
                else:
                    continue
                dst_idx = indices[dst_type_name].index(dst)
                edge_tensor = _build_edge_tensor(src_idx, dst_idx)
                edge_dict[('inst', 'data', dst_type_name)].append(edge_tensor)
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
            edge_dict[(src_type_name, 'data', 'inst')].append(edge_tensor)

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


def _get_partition_features(md: Dict[str, int]) -> List[int]:
    dim = md["partitionDim"]
    if dim > 4:
        # Use the last dimension for higher-dimensional arrays
        dim = 4
    enc_dim = [0] * 5
    enc_dim[dim] = 1

    partition_type = md["partitionType"]
    enc_partition_type = [0, 0, 0]
    enc_partition_type[partition_type - 1] = 1

    factor = md["partitionFactor"]
    return enc_partition_type + enc_dim + [factor]


def _get_array_info(md: Dict[str, int]) -> List[int]:
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


def _to_numeric_md(md: Dict[str, str]) -> Dict[str, Union[int, float]]:
    num_md = {}
    for key, value in md.items():
        if key == "functionName":
            continue
        try:
            num_md[key] = int(value)
        except ValueError:
            try:
                num_md[key] = float(value)
            except ValueError:
                # Boolean (possibly represented as a string) 
                # or unexpected non-numeric value 
                num_md[key] = 1 if value == "true" else 0
    return num_md


def _get_type_id_from_text(node_text: str) -> int:
    if node_text[-1] == '*':
        return _LLVMTypeID.POINTER
    if '[' in node_text and ']' in node_text:
        return _LLVMTypeID.ARRAY
    if 'half' in node_text:
        return _LLVMTypeID.HALF
    if 'float' in node_text:
        return _LLVMTypeID.FLOAT
    if 'double' in node_text:
        return _LLVMTypeID.DOUBLE
    if node_text[0] == 'i':
        return _LLVMTypeID.INT
    if 'struct' in node_text:
        return _LLVMTypeID.STRUCT
    return _LLVMTypeID.VOID


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
    return _TYPE_ENC[type_id] + [bitwidth]


def _build_edge_tensor(src: int, dst: int) -> Tensor:
    return torch.tensor([src, dst], dtype=torch.int64)


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


def _parse_loop_hierarchy(
    loop_hierarchy_path: Path
) -> Tuple[Dict[int, List[int]], Dict[int, List[int]]]:
    # File format: 
    #
    # Loop hierarchy:
    # parent_id1: child_id11, child_id12, ...
    # ...
    # parent_idN: child_idN1, child_idN2, ...
    #
    # Top-level loops:
    # function_id1: loop_id11, loop_id12, ...
    # ...
    # function_idN: loop_idN1, loop_idN2, ...
    with open(loop_hierarchy_path, 'r') as f:
        lines = f.readlines()

    lines = lines[1:]
    empty_line_idx = lines.index('\n')
    loop_hierarchy_lines = lines[:empty_line_idx]
    top_level_loops_lines = lines[empty_line_idx + 2:]

    loop_hierarchy = {}
    for line in loop_hierarchy_lines:
        parent_id, children = line.strip().split(':')
        parent_id = int(parent_id)
        if parent_id == 0 or children == '':
            continue
        children = [int(c) for c in children.split(',')]
        loop_hierarchy[parent_id] = children

    top_level_loops = {}
    for line in top_level_loops_lines:
        function_id, loops = line.strip().split(':')
        function_id = int(function_id)
        loops = [int(l) for l in loops.split(',')]
        top_level_loops[function_id] = loops

    return loop_hierarchy, top_level_loops


if __name__ == "__main__":
    # *** For debugging *** #
    from sys import argv

    ir_path = Path(argv[1])
    metadata_path = Path(argv[2])
    cfg_path = Path(argv[3])
    output_path = Path(argv[4])

    build_cdfg(ir_path, metadata_path, cfg_path, output_path)