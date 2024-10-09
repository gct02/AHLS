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
        adj_mat[src][dest] = 1

    return adj_mat

def get_directives_features(directives_md):
    if directives_md[2] == 0: # None
        return directives_md[0:2] + [0, 0, 0] + directives_md[3:8]
    elif directives_md[2] == 1: # Complete
        return directives_md[0:2] + [0, 0, 1] + directives_md[3:8]
    elif directives_md[2] == 2: # Block
        return directives_md[0:2] + [0, 1, 0] + directives_md[3:8]
    else: # Cyclic
        return directives_md[0:2] + [1, 0, 0] + directives_md[3:8]
    
def get_one_hot_opcode(opcode:int):
    one_hot_op_type = 5 * [0]
    one_hot_opcode = 6 * [0]

    if opcode <= 10: # Terminators
        one_hot_op_type[0] = 1
        one_hot_opcode[opcode - 1] = 1
    elif opcode <= 22: # Binary operations
        one_hot_op_type[1] = 1
        if opcode <= 12:
            one_hot_opcode[0] = 1
        elif opcode <= 14:
            one_hot_opcode[1] = 1
        elif opcode <= 16:
            one_hot_opcode[2] = 1
        elif opcode <= 19:
            one_hot_opcode[3] = 1
        else:
            one_hot_opcode[4] = 1
    elif opcode <= 28: # Logical operations
        one_hot_op_type[2] = 1
        one_hot_opcode[opcode - 23] = 1
    elif opcode <= 32: # Memory operations
        one_hot_op_type[3] = 1
        one_hot_opcode[opcode - 29] = 1
    else:
        one_hot_op_type[4] = 1
        one_hot_opcode[opcode - 52] = 1
    
    return one_hot_op_type + one_hot_opcode
    
def get_dfg_pre_directives_lut_ff(dfg_file:Path):
    nodes, edges = parse_dfg_file(dfg_file)
    opcodes_to_keep = [1, 2, 3] + list(range(11, 33)) + [53, 54, 55]
    nodes, edges = filter_nodes(nodes, edges, opcodes_to_keep)
    nodes, edges = rescale_node_ids(nodes, edges)
    adj_mat = get_adj_mat(nodes, edges)

    features = []

    for node in nodes:
        opcode = node[1]
        one_hot_opcode = get_one_hot_opcode(opcode)
        directives_features = get_directives_features(node[5:])
        node_features = one_hot_opcode + node[2:5] + directives_features
        features.append(torch.FloatTensor(node_features))

    features = torch.stack(features)
    return features, adj_mat

def get_dfg_post_directives_lut_ff(dfg_file:Path):
    nodes, edges = parse_dfg_file(dfg_file)
    opcodes_to_keep = [1, 2, 3] + list(range(11, 33)) + [53, 54, 55]
    nodes, edges = filter_nodes(nodes, edges, opcodes_to_keep)
    nodes, edges = rescale_node_ids(nodes, edges)
    adj_mat = get_adj_mat(nodes, edges)

    features = []

    for node in nodes:
        opcode = node[1]
        one_hot_opcode = get_one_hot_opcode(opcode)
        node_features = one_hot_opcode + node[2:5]
        features.append(torch.FloatTensor(node_features))

    features = torch.stack(features)
    return features, adj_mat

def get_dfg_pre_directives_dsp(dfg_file:Path):
    nodes, edges = parse_dfg_file(dfg_file)
    opcodes_to_keep = [1, 2, 3] + list(range(11, 23)) + [29, 30, 31, 32, 51, 52, 53, 54, 55]
    nodes, edges = filter_nodes(nodes, edges, opcodes_to_keep)
    nodes, edges = rescale_node_ids(nodes, edges)
    adj_mat = get_adj_mat(nodes, edges)

    features = []

    for node in nodes:
        opcode = node[1]
        one_hot_opcode = 5 * [0]
        if opcode in range(11, 23):
            optype = 1
            if opcode <= 12:
                one_hot_opcode[0] = 1
            elif opcode <= 14:
                one_hot_opcode[1] = 1
            elif opcode <= 16:
                one_hot_opcode[2] = 1
            elif opcode <= 19:
                one_hot_opcode[3] = 1
            else:
                one_hot_opcode[4] = 1
        else:
            optype = 0
            if opcode <= 3:
                one_hot_opcode[0] = 1
            elif opcode <= 32:
                one_hot_opcode[1] = 1
            elif opcode <= 52:
                one_hot_opcode[2] = 1
            else:
                one_hot_opcode[3] = 1
        
        directives_features = get_directives_features(node[5:])
        node_features = [optype] + one_hot_opcode + node[2:5] + directives_features
        features.append(torch.FloatTensor(node_features))

    features = torch.stack(features)
    return features, adj_mat

def get_dfg_post_directives_dsp(dfg_file:Path):
    nodes, edges = parse_dfg_file(dfg_file)
    opcodes_to_keep = [1, 2, 3] + list(range(11, 23)) + [29, 30, 31, 32, 51, 52, 53, 54, 55]
    nodes, edges = filter_nodes(nodes, edges, opcodes_to_keep)
    nodes, edges = rescale_node_ids(nodes, edges)
    adj_mat = get_adj_mat(nodes, edges)

    features = []

    for node in nodes:
        opcode = node[1]
        one_hot_opcode = 5 * [0]
        if opcode in range(11, 23):
            optype = 1
            if opcode <= 12:
                one_hot_opcode[0] = 1
            elif opcode <= 14:
                one_hot_opcode[1] = 1
            elif opcode <= 16:
                one_hot_opcode[2] = 1
            elif opcode <= 19:
                one_hot_opcode[3] = 1
            else:
                one_hot_opcode[4] = 1
        else:
            optype = 0
            if opcode <= 3:
                one_hot_opcode[0] = 1
            elif opcode <= 32:
                one_hot_opcode[1] = 1
            elif opcode <= 52:
                one_hot_opcode[2] = 1
            else:
                one_hot_opcode[3] = 1
        
        node_features = [optype] + one_hot_opcode + node[2:5]
        features.append(torch.FloatTensor(node_features))

    features = torch.stack(features)
    return features, adj_mat