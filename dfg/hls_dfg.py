import numpy as np
import torch

import subprocess
from pathlib import Path
from sys import argv
from os import environ

from llvm.opt_utils import *


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


def get_one_hot_opcode(opcode: int) -> list:
    '''
    The first 7 bits are a one-hot encoding of the instruction type
    (terminator, arithmetic, logical, memory, conversion, vector, other),
    while the next 13 bits are a one-hot encoding of the specific instruction.
    '''
    one_hot_optype = [0] * 7
    one_hot_opcode = [0] * 13

    if opcode <= 10: # Terminator
        one_hot_optype[0] = 1
        one_hot_opcode[opcode - 1] = 1
    elif opcode <= 22: # Arithmetic
        one_hot_optype[1] = 1
        one_hot_opcode[opcode - 11] = 1
    elif opcode <= 28: # Logical
        one_hot_optype[2] = 1
        one_hot_opcode[opcode - 23] = 1
    elif opcode <= 35: # Memory
        one_hot_optype[3] = 1
        one_hot_opcode[opcode - 29] = 1
    elif opcode <= 48: # Conversion
        one_hot_optype[4] = 1
        one_hot_opcode[opcode - 36] = 1
    elif opcode >= 59 and opcode != 64: # Vector
        one_hot_optype[5] = 1
        one_hot_opcode[opcode - 59] = 1
    else:
        one_hot_optype[6] = 1
        if opcode == 64: # LandingPad
            one_hot_opcode[9] = 1
        else: # Other
            one_hot_opcode[opcode - 49] = 1
    
    return one_hot_optype + one_hot_opcode


def parse_dfg_file(dfg_file: Path) -> tuple:
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


def rescale_node_ids(nodes: list, edges: list) -> tuple:
    node_id_map = {}
    new_nodes = []
    new_edges = []

    for i, node in enumerate(nodes):
        node_id_map[node[0]] = i
        node[0] = i
        new_nodes.append(node)
    
    for edge in edges:
        src, dest = edge
        new_edges.append([node_id_map[src], node_id_map[dest]])
    
    return new_nodes, new_edges


def make_adjacency_lists(nodes: list, edges: list):
    adj_lists = [[i] for i in range(len(nodes))]

    for edge in edges:
        src, dest = edge
        adj_lists[src].append(dest)
    
    return adj_lists


def build_dfg(dfg_file: Path):
    nodes, edges = parse_dfg_file(dfg_file)
    nodes, edges = rescale_node_ids(nodes, edges)
    adj_lists = make_adjacency_lists(nodes, edges)

    node_features_array = []

    for node_features in nodes:
        opcode = node_features[1]
        one_hot_opcode = get_one_hot_opcode(opcode)

        array_partition_type = node_features[6]
        
        if array_partition_type == 0: # None
            one_hot_partition_type = [0, 0, 0]
        elif array_partition_type == 1: # Complete 
            one_hot_partition_type = [0, 0, 1]
        elif array_partition_type == 2: # Block
            one_hot_partition_type = [0, 1, 0]
        else: # Cyclic
            one_hot_partition_type = [1, 0, 0]
        '''
        features = (one_hot_opcode, bitwidth, unroll, unroll_factor, array_partition, 
                    one_hot_partition_type, partition_factor, partition_dim, pipeline, 
                    pipeline_II, loop_merge)
        '''
        features = one_hot_opcode + [node_features[2], node_features[3], node_features[4], node_features[5]] \
                   + one_hot_partition_type \
                   + [node_features[7], node_features[8], node_features[9], node_features[10], node_features[11]]
        
        node_features_array.append(torch.FloatTensor(features))

    node_features_array = torch.stack(node_features_array)
    return node_features_array, adj_lists

        
if __name__ == '__main__':
    input_ir_dfg_path = Path(argv[1])
    node_features_array, adj_lists = build_dfg(input_ir_dfg_path)
    print(node_features_array)
    print(adj_lists)