import numpy as np
import torch

from pathlib import Path
from os import environ

from llvm.opt_utils import *
from metrics.data_stats import parse_data_stats_file

try:
    AHLS_LLVM_LIB = environ['AHLS_LLVM_LIB']
    OPT = environ['OPT']
    CLANG = environ['CLANG']
    LLVM_LINK = environ['LLVM_LINK']
except KeyError as ahls_error:
    print(f"Error: environment variable {ahls_error.args[0]} not defined.")
    raise

def create_directives_tcl_from_script(tcl_script_path: Path, output_path: Path):
    with open(tcl_script_path, "r") as tcl_script, open(output_path, "w") as output_file:
        script = tcl_script.readlines()
        for line in script:
            if line.startswith("set_directive"):
                line = line.split("#")[0] # Remove comments
                output_file.write(line)

def strip_nodes(nodes, edges, opcodes_to_keep):
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
                for succ in successors:
                    stripped_edges.append((pred, succ))
    
    return stripped_nodes, stripped_edges

def parse_dfg_file(dfg_file:Path) -> tuple:
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

def rescale_node_ids(nodes, edges) -> tuple:
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
    partition_type = directives_md[2]

    if partition_type == 0: # None
        partition = [0, 0, 0]
    elif partition_type == 1: # Complete
        partition = [0, 0, 1]
    elif partition_type == 2: # Block
        partition = [0, 1, 0]
    else: # Cyclic
        partition = [1, 0, 0]

    return directives_md[0:2] + partition + directives_md[3:8]

def build_dfg(dfg_file:Path):
    nodes, edges = parse_dfg_file(dfg_file)
    nodes, edges = rescale_node_ids(nodes, edges)
    adj_mat = get_adj_mat(nodes, edges)
    features = []

    for node in nodes:
        node_features = node[1:5] + get_directives_features(node[5:])
        features.append(torch.FloatTensor(node_features))

    features = torch.stack(features)
    return features, adj_mat

def build_dfg_dsp(dfg_file:Path, data_stats_folder:Path=None):
    nodes, edges = parse_dfg_file(dfg_file)
    opcodes_to_keep = list(range(1, 29)) + [53, 54, 55]
    nodes, edges = strip_nodes(nodes, edges, opcodes_to_keep)
    nodes, edges = rescale_node_ids(nodes, edges)
    adj_mat = get_adj_mat(nodes, edges)
    '''
    data_stats = []
    for data_stats_file in data_stats_folder.iterdir():
        data_stats.append(parse_data_stats_file(data_stats_file))
    '''
    features = []

    for node in nodes:
        opcode = node[1]

        if opcode <= 10 or opcode >= 53: # ret, br, switch, phi, call, select
            one_hot_opcode = [0, 0, 0, 0, 1]
        elif opcode <= 14: # add, sub
            one_hot_opcode = [0, 0, 0, 1, 0]
        elif opcode <= 16: # mul
            one_hot_opcode = [0, 0, 1, 0, 0]
        elif opcode <= 22: # div, rem
            one_hot_opcode = [0, 1, 0, 0, 0]
        else: # logical
            one_hot_opcode = [1, 0, 0, 0, 0]

        #avg_num_occurs = np.mean([data_stats[i][node[0]][2] for i in range(len(data_stats))])

        node_features = one_hot_opcode + node[2:5] + get_directives_features(node[5:])
        features.append(torch.FloatTensor(node_features))

    features = torch.stack(features)
    return features, adj_mat

def build_dfg_lut(dfg_file:Path):
    nodes, edges = parse_dfg_file(dfg_file)
    opcodes_to_keep = list(range(1, 29)) + list(range(36, 45)) + [47, 51, 52, 53, 54, 55]
    nodes, edges = strip_nodes(nodes, edges, opcodes_to_keep)
    nodes, edges = rescale_node_ids(nodes, edges)
    adj_mat = get_adj_mat(nodes, edges)

    features = []

    for node in nodes:
        opcode = node[1]

        if opcode <= 10 or opcode >= 53: # ret, br, switch, phi, call, select
            one_hot_opcode = [0, 0, 0, 0, 0, 0, 1]
        elif opcode <= 14: # add, sub
            one_hot_opcode = [0, 0, 0, 0, 0, 1, 0]
        elif opcode <= 16: # mul
            one_hot_opcode = [0, 0, 0, 0, 1, 0, 0]
        elif opcode <= 22: # div, rem
            one_hot_opcode = [0, 0, 0, 1, 0, 0, 0]
        elif opcode <= 28: # logical
            one_hot_opcode = [0, 0, 1, 0, 0, 0, 0]
        elif opcode <= 47: # cast
            one_hot_opcode = [0, 1, 0, 0, 0, 0, 0]
        else: # cmp
            one_hot_opcode = [1, 0, 0, 0, 0, 0, 0]

        node_features = one_hot_opcode + node[2:5] + get_directives_features(node[5:])
        features.append(torch.FloatTensor(node_features))

    features = torch.stack(features)
    return features, adj_mat

def build_dfg_ff(dfg_file:Path):
    return build_dfg(dfg_file)

def build_dfg_cp(dfg_file:Path):
    return build_dfg(dfg_file)
