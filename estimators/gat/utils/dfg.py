import numpy as np
import torch
from pathlib import Path

def filter_nodes(nodes, edges, opcodes_to_keep):
    stripped_nodes = nodes.copy()
    stripped_edges = edges.copy()
    
    for node in nodes:
        if node[1] not in opcodes_to_keep:
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

def parse_dfg_file(dfg_file:Path):
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

    return nodes, edges

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

def get_adj_mat(nodes, edges):
    n_nodes = len(nodes)
    adj_mat = torch.zeros(n_nodes, n_nodes)
    adj_mat.fill_diagonal_(1)

    for edge in edges:
        src, dest = edge
        adj_mat[src - 1][dest - 1] = 1

    return adj_mat

def get_directives_features(directives_md):
    array_partition_type = directives_md[1]
    one_hot_array_partition_type = 3 * [0]
    if array_partition_type != 0:
        one_hot_array_partition_type[array_partition_type - 1] = 1
    return directives_md[0:1] + one_hot_array_partition_type + directives_md[2:]
    
def get_one_hot_opcode(opcode:int):
    one_hot_op_type = 7 * [0]
    one_hot_opcode = 13 * [0]

    if opcode <= 10: # Terminators
        one_hot_op_type[0] = 1
        one_hot_opcode[opcode - 1] = 1
    elif opcode <= 22: # Binary operations
        one_hot_op_type[1] = 1
        one_hot_opcode[opcode - 11] = 1
    elif opcode <= 28: # Logical operations
        one_hot_op_type[2] = 1
        one_hot_opcode[opcode - 23] = 1
    elif opcode <= 35: # Memory operations
        one_hot_op_type[3] = 1
        one_hot_opcode[opcode - 29] = 1
    elif opcode <= 48: # Cast operations
        one_hot_op_type[4] = 1
        one_hot_opcode[opcode - 36] = 1
    elif opcode <= 50: # Exception handling operations
        one_hot_op_type[5] = 1
        one_hot_opcode[opcode - 49] = 1
    else: # Other operations (comparison, phi, call, select, etc.)
        if opcode >= 58: 
            opcode -= 2 # Ignoring UserOp1 and UserOp2
        one_hot_op_type[6] = 1
        one_hot_opcode[opcode - 51] = 1

    return one_hot_op_type + one_hot_opcode

def build_dfg(dfg_file:Path, has_directives:bool, reduce_size:bool=False):
    nodes, edges = parse_dfg_file(dfg_file)

    if reduce_size:
        opcodes_to_keep = [1, 2, 3] + list(range(11, 33)) + [53, 54, 55]
        nodes, edges = filter_nodes(nodes, edges, opcodes_to_keep)
        nodes, edges = rescale_node_ids(nodes, edges)

    adj_mat = get_adj_mat(nodes, edges)

    features = []

    for node in nodes:
        opcode = node[3]
        one_hot_opcode = get_one_hot_opcode(opcode)
        node_features = node[0:3] + one_hot_opcode + node[4:7]
        if has_directives:
            directives_md = node[7:len(node)-1]
            directives_features = get_directives_features(directives_md)
            node_features += directives_features
        features.append(torch.FloatTensor(node_features))

    features = torch.stack(features)

    return features, adj_mat