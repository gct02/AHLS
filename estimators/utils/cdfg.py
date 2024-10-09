import numpy as np
import torch
import programl
from pathlib import Path

torch.set_printoptions(profile="full")

LLVM_OPCODES = {
    'ret': 1, 'br': 2, 'switch': 3, 'indirectbr': 4, 'invoke': 5, 'resume': 6, 'unreachable': 7, 'cleanupret': 8, 'catchret': 9, 'catchswitch': 10,
    'add': 11, 'fadd': 12, 'sub': 13, 'fsub': 14, 'mul': 15, 'fmul': 16, 'udiv': 17, 'sdiv': 18, 'fdiv': 19, 'urem': 20, 'srem': 21, 'frem': 22,
    'shl': 23, 'lshr': 24, 'ashr': 25, 'and': 26, 'or': 27, 'xor': 28,
    'alloca': 29, 'load': 30, 'store': 31, 'getelementptr': 32, 'fence': 33, 'atomiccmpxchg': 34, 'atomicrmw': 35, 
    'trunc': 36, 'zext': 37, 'sext': 38, 'fptoui': 39, 'fptosi': 40, 'uitofp': 41, 'sitofp': 42, 'fptrunc': 43, 'fpext': 44, 'ptrtoint': 45, 'inttoptr': 46, 'bitcast': 47, 'addrspacecast': 48,
    'cleanuppad': 49, 'catchpad': 50,
    'icmp': 51, 'fcmp': 52, 'phi': 53, 'call': 54, 'select': 55, 'va_arg': 56, 'extractelement': 57, 'insertelement': 58, 'shufflevector': 59, 'extractvalue': 60, 'insertvalue': 61, 'landingpad': 62
}

def build_cdfg(ir_path:Path):
    with open(ir_path, 'r') as ir_file:
        programl_graph = programl.from_llvm_ir(ir_file.read())
        node_types = [node.type for node in programl_graph.node]
        edge_types = [edge.flow for edge in programl_graph.edge]
        node_features = get_node_features(programl_graph)
        adj_mat_control, adj_mat_data, adj_mat_call = make_adj_mat(node_features, programl_graph.edge)
    return node_features, adj_mat_control, adj_mat_data, adj_mat_call, node_types, edge_types

def get_one_hot_opcode(instruction):
    if instruction not in LLVM_OPCODES:
        return 20 * [0]
    
    opcode = LLVM_OPCODES[instruction]
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

def get_type_bitwidth(text:str):
    if '*' in text:
        # Not a relevant information for now, just a placeholder
        # The boolean feature "is_ptr" will be used instead
        return 32
    if '[' in text: # Array type
        array_size = int(text.split('[')[1].split(' x')[0])
        array_type = text.split('x ')[1].split(']')[0]
        array_type_bitwidth = get_type_bitwidth(array_type)
        return array_size * array_type_bitwidth
    if 'float' in text:
        return 32
    if 'double' in text:
        return 64
    return int(text.strip('i'))

def get_node_features(programl_graph):
    node_features = []

    for node in programl_graph.node:
        function = node.function
        block = node.block
        text = node.text

        if node.type == 0: # Instruction
            instruction = text.split(' ')[0]
            one_hot_opcode = get_one_hot_opcode(instruction)
            node_features.append([function, block] + one_hot_opcode)
        else: # Variable or Constant
            is_ptr = 1 if '*' in text else 0
            is_array = 1 if '[' in text else 0
            is_fp = 1 if 'float' in text or 'double' in text else 0
            bitwidth = get_type_bitwidth(text)
            node_features.append([function, block, is_ptr, is_array, is_fp, bitwidth])
        
    return node_features

# def get_edge_features(programl_graph):
#     edge_features = [[edge.source, edge.target, edge.flow, edge.position] for edge in programl_graph.edge]
#     return edge_features
            
def make_adj_mat(node_features, edges):
    n_nodes = len(node_features)
    adj_mat_control = torch.zeros(n_nodes, n_nodes)
    adj_mat_data = torch.zeros(n_nodes, n_nodes)
    adj_mat_call = torch.zeros(n_nodes, n_nodes)

    adj_mat_control.fill_diagonal_(1)
    adj_mat_data.fill_diagonal_(1)
    adj_mat_call.fill_diagonal_(1)

    for edge in edges:
        if edge.flow == 0:
            adj_mat_control[edge.source, edge.target] = 1
        elif edge.flow == 1:
            adj_mat_data[edge.source, edge.target] = 1
        else:
            adj_mat_call[edge.source, edge.target] = 1

    return adj_mat_control, adj_mat_data, adj_mat_call