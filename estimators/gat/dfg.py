import torch
from pathlib import Path

OPCODE_DICT = {
    'add': [1,0,0,0,0,0, 0,0,0,0,0,1,0],
    'fadd': [1,0,0,0,0,0, 0,0,0,0,0,1,0],
    'sub': [1,0,0,0,0,0, 0,0,0,0,1,0,0],
    'fsub': [1,0,0,0,0,0, 0,0,0,0,1,0,0],
    'mul': [1,0,0,0,0,0, 0,0,0,1,0,0,0],
    'fmul': [1,0,0,0,0,0, 0,0,0,1,0,0,0],
    'udiv': [1,0,0,0,0,0, 0,0,1,0,0,0,1],
    'sdiv': [1,0,0,0,0,0, 0,0,1,0,0,0,0],
    'fdiv': [1,0,0,0,0,0, 0,0,1,0,0,0,0],
    'urem': [1,0,0,0,0,0, 0,1,0,0,0,0,1],
    'srem': [1,0,0,0,0,0, 0,1,0,0,0,0,0],
    'frem': [1,0,0,0,0,0, 0,1,0,0,0,0,0],
    'sqrt': [1,0,0,0,0,0, 1,0,0,0,0,0,0],
    'fsqrt': [1,0,0,0,0,0, 1,0,0,0,0,0,0],

    'shl': [0,1,0,0,0,0, 0,0,0,0,0,0,1],
    'lshr': [0,1,0,0,0,0, 0,0,0,0,0,1,0],
    'ashr': [0,1,0,0,0,0, 0,0,0,0,1,0,0],
    'and': [0,1,0,0,0,0, 0,0,0,1,0,0,0],
    'or': [0,1,0,0,0,0, 0,0,1,0,0,0,0],
    'xor': [0,1,0,0,0,0, 0,1,0,0,0,0,0],
    'icmp': [0,1,0,0,0,0, 1,0,0,0,0,0,0],
    'fcmp': [0,1,0,0,0,0, 1,0,0,0,0,0,0],

    'alloca': [0,0,1,0,0,0, 0,0,0,0,0,0,1],
    'load': [0,0,1,0,0,0, 0,0,0,0,0,1,0],
    'store': [0,0,1,0,0,0, 0,0,0,0,1,0,0],
    'getelementptr': [0,0,1,0,0,0, 0,0,0,1,0,0,0],
    'fence': [0,0,1,0,0,0, 0,0,1,0,0,0,0],
    'atomiccmpxchg': [0,0,1,0,0,0, 0,1,0,0,0,0,0],
    'atomicrmw': [0,0,1,0,0,0, 1,0,0,0,0,0,0],

    'trunc': [0,0,0,1,0,0, 0,0,0,0,0,1,0],
    'fptrunc': [0,0,0,1,0,0, 0,0,0,0,0,1,0],
    'zext': [0,0,0,1,0,0, 0,0,0,0,1,0,1],
    'sext': [0,0,0,1,0,0, 0,0,0,0,1,0,0],
    'fptoui': [0,0,0,1,0,0, 0,0,0,1,0,0,1],
    'fptosi': [0,0,0,1,0,0, 0,0,0,1,0,0,0],
    'uitofp': [0,0,0,1,0,0, 0,0,0,1,0,0,1],
    'sitofp': [0,0,0,1,0,0, 0,0,0,1,0,0,0],
    'bitcast': [0,0,0,1,0,0, 0,0,1,0,0,0,0],
    'ptrtoint': [0,0,0,1,0,0, 0,1,0,0,0,0,0],
    'inttoptr': [0,0,0,1,0,0, 0,1,0,0,0,0,0],
    'addrspacecast': [0,0,0,1,0,0, 1,0,0,0,0,0,0],

    'br': [0,0,0,0,1,0, 0,0,0,0,0,0,1],
    'switch': [0,0,0,0,1,0, 0,0,0,0,0,1,0],
    'indirectbr': [0,0,0,0,1,0, 0,0,0,0,1,0,0],
    'invoke': [0,0,0,0,1,0, 0,0,0,1,0,0,0],
    'resume': [0,0,0,0,1,0, 0,0,1,0,0,0,0],
    'ret': [0,0,0,0,1,0, 0,1,0,0,0,0,0],
    'call': [0,0,0,0,1,0, 1,0,0,0,0,0,0],

    'phi': [0,0,0,0,0,1, 0,0,0,0,0,0,1],
    'select': [0,0,0,0,0,1, 0,0,0,0,0,1,0],
    'extractelement': [0,0,0,0,0,1, 0,0,0,0,1,0,0],
    'extractvalue': [0,0,0,0,0,1, 0,0,0,0,1,0,0],
    'insertelement': [0,0,0,0,0,1, 0,0,0,1,0,0,0],
    'insertvalue': [0,0,0,0,0,1, 0,0,0,1,0,0,0],
    'shufflevector': [0,0,0,0,0,1, 0,0,1,0,0,0,0],
    'va_arg': [0,0,0,0,0,1, 0,1,0,0,0,0,0],
    'landingpad': [0,0,0,0,0,1, 1,0,0,0,0,0,0],
    'cleanuppad': [0,0,0,0,0,1, 1,0,0,0,0,0,0],
    'catchpad': [0,0,0,0,0,1, 1,0,0,0,0,0,0],
    'catchswitch': [0,0,0,0,0,1, 1,0,0,0,0,0,0],
    'catchret': [0,0,0,0,0,1, 1,0,0,0,0,0,0],
    'cleanupret': [0,0,0,0,0,1, 1,0,0,0,0,0,0],
    'unreachable': [0,0,0,0,0,1, 1,0,0,0,0,0,0]
}

def filter_nodes(nodes, edges, ops_to_keep):
    stripped_nodes = nodes.copy()
    stripped_edges = edges.copy()
    
    for node in nodes:
        if node[1] in ops_to_keep:
            continue
        node_id = node[0]
        stripped_nodes.remove(node)
        predecessors = [edge[0] for edge in stripped_edges if edge[1] == node_id]
        successors = [edge[1] for edge in stripped_edges if edge[0] == node_id]
        stripped_edges = [edge for edge in stripped_edges if edge[0] != node_id and edge[1] != node_id]
        for pred in predecessors:
            if pred == node_id:
                continue
            for succ in successors:
                if succ == node_id:
                    continue
                stripped_edges.append((pred, succ))
    
    return stripped_nodes, stripped_edges


def rescale_node_ids(nodes, edges):
    node_id_map = {}
    new_nodes = []
    new_edges = []

    for i, node in enumerate(nodes):
        node_id_map[node[0]] = i
        node[0] = i
        new_nodes.append(node)
    
    for edge in edges:
        src, dest = edge
        new_edges.append((node_id_map[src], node_id_map[dest]))
    
    return new_nodes, new_edges


def parse_dfg_file(dfg_file:Path, add_self_loops:bool=False):
    with open(dfg_file, 'r') as f:
        lines = f.readlines()

    num_nodes = int(lines[0])
    nodes = []
    for i in range(1, num_nodes + 1):
        nodes.append([int(feature) for feature in lines[i].strip().split(',')])
    
    num_edges = int(lines[num_nodes + 1])
    edges = []
    for i in range(num_nodes + 2, num_nodes + num_edges + 2):
        edge = lines[i].strip().split(',')
        edges.append((int(edge[0]), int(edge[1])))

    if add_self_loops:
        for node in nodes:
            edges.append((node[0], node[0]))

    return nodes, edges


def get_one_hot_opcode(op_type_text:str):
    if op_type_text in OPCODE_DICT:
        return OPCODE_DICT[op_type_text]
    return [0] * 13 # Unknown instruction


def build_module_dfg(dfg_file:Path, reduce_size:bool=False):
    nodes, edges = parse_dfg_file(dfg_file, add_self_loops=True)

    if reduce_size:
        opcodes_to_keep = [1, 2, 3] + list(range(11, 33)) + [53, 54, 55]
        nodes, edges = filter_nodes(nodes, edges, opcodes_to_keep)
        nodes, edges = rescale_node_ids(nodes, edges)

    features = []
    for node in nodes:
        opcode = node[3]
        one_hot_opcode = get_one_hot_opcode(opcode)
        node_features = one_hot_opcode + node[4:]
        features.append(torch.FloatTensor(node_features))

    features = torch.stack(features)
    edges = torch.LongTensor(edges).transpose(0, 1)

    return features, edges