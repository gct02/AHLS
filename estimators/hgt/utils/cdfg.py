import numpy as np
import torch
import programl
import re
from pathlib import Path

torch.set_printoptions(profile="full")

LLVM_OPCODES = {
    'ret': 1, 'br': 2, 'switch': 3, 'indirectbr': 4, 'invoke': 5, 'resume': 6, 'unreachable': 7, 'cleanupret': 8, 'catchret': 9, 'catchswitch': 10, # Terminators
    'add': 11, 'fadd': 12, 'sub': 13, 'fsub': 14, 'mul': 15, 'fmul': 16, 'udiv': 17, 'sdiv': 18, 'fdiv': 19, 'urem': 20, 'srem': 21, 'frem': 22, # Binary operations
    'shl': 23, 'lshr': 24, 'ashr': 25, 'and': 26, 'or': 27, 'xor': 28, # Logical operations
    'alloca': 29, 'load': 30, 'store': 31, 'getelementptr': 32, 'fence': 33, 'atomiccmpxchg': 34, 'atomicrmw': 35, # Memory operations
    'trunc': 36, 'zext': 37, 'sext': 38, 'fptoui': 39, 'fptosi': 40, 'uitofp': 41, 'sitofp': 42, 'fptrunc': 43, 'fpext': 44, 'ptrtoint': 45, 'inttoptr': 46, 'bitcast': 47, 'addrspacecast': 48, # Cast operations
    'cleanuppad': 49, 'catchpad': 50, # Exception handling operations
    'icmp': 51, 'fcmp': 52, 'phi': 53, 'call': 54, 'select': 55, 'va_arg': 56, 'extractelement': 57, 'insertelement': 58, 'shufflevector': 59, 'extractvalue': 60, 'insertvalue': 61, 'landingpad': 62 # Other operations
}

def parse_mdnode(mdnode_text:str):
    mdnode_operands_text = mdnode_text.split('!{')[1].split('}')[0].split(',')
    mdnode_operands = []
    for mdnode_operand in mdnode_operands_text:
        mdnode_operand = ''.join(re.findall(r"[-+]?\d*", mdnode_operand.split(' ')[-1]))
        mdnode_operands.append(int(mdnode_operand))
    return mdnode_operands

def get_metadata(ir_path:Path):
    with open(ir_path, 'r') as ir_file:
        lines = ir_file.readlines()

    md_pattern = re.compile(r'^!\d+ = !\{(i32 [-+]?\d*\.?\d+,\s*)*i32 [-+]?\d*\.?\d+\}$')

    metadata_lines = [line for line in lines if md_pattern.match(line)]
    metadata = {}

    for line in metadata_lines:
        index = int(line.split(' = ')[0].strip('!'))
        mdnode_text = line.split(' = ')[1]
        metadata[index] = parse_mdnode(mdnode_text)
    
    return metadata

def get_directives_features(node_full_text:str, metadata, node_type:int):
    if node_type == 0: # Instruction
        loop_merge_md_id = int(node_full_text.split("!loopMerge !")[1].strip().split(',')[0])
        loop_flatten_md_id = int(node_full_text.split("!loopFlatten !")[1].strip().split(',')[0])
        unroll_md_id = int(node_full_text.split("!unroll !")[1].strip().split(',')[0])
        pipeline_md_id = int(node_full_text.split("!pipeline !")[1].strip().split(',')[0])

        loop_merge_features = metadata[loop_merge_md_id][1:]
        loop_flatten_features = metadata[loop_flatten_md_id][1:]
        unroll_features = metadata[unroll_md_id][1:]
        pipeline_features = metadata[pipeline_md_id][1:]

        return unroll_features + pipeline_features + loop_flatten_features + loop_merge_features
    else: # Variable or Constant
        array_partition_md_id = int(node_full_text.split("!arrayPartition !")[1].strip().split(',')[0])
        array_partition_md = metadata[array_partition_md_id]

        array_partition_type = array_partition_md[3]
        one_hot_array_partition_type = 3 * [0]
        one_hot_array_partition_type[array_partition_type - 1] = 1
        
        array_partition_features = array_partition_md[1:3] + one_hot_array_partition_type + array_partition_md[3:]

        return array_partition_features

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

def find_global_value(ir_global_texts, node_full_text):
    for global_text in ir_global_texts:
        if node_full_text in global_text.split('=')[0]:
            return global_text
    return None

def find_instruction(ir_op_texts, node_full_text):
    for op_text in ir_op_texts:
        if node_full_text in op_text.split('=')[0]:
            return op_text
    return None

def get_type_bitwidth(text:str):
    if text[-1] == '*':
        return 32 # Placeholder for now
    if '[' in text: # Array type
        array_size = int(text.split('[')[1].split(' x ')[0])
        array_type = text.split(' x ')[1].split(']')[0]
        array_type_bitwidth = get_type_bitwidth(array_type)
        return array_size * array_type_bitwidth
    if 'void' in text:
        return 0
    if 'struct' in text or 'label' in text or 'token' in text or 'vector' in text:
        return 32 # Placeholder for now
    if 'half' in text:
        return 16
    if 'float' in text:
        return 32
    if 'double' in text:
        return 64
    return int(text.strip('i'))

def get_node_features(programl_graph, metadata, ir_op_texts, ir_global_texts):
    inst_node_features, var_node_features, const_node_features = [], [], []
    inst_node_indices, var_node_indices, const_node_indices = [], [], []

    for i, node in enumerate(programl_graph.node):
        function = node.function + 1
        block = node.block + 1
        text = node.text
        full_text = node.features.feature["full_text"].bytes_list.value.__str__()[1:-1]
        if full_text != "":
            full_text = full_text[2:-1]

        if node.type == 0:  # Instruction
            if "ID." not in full_text:
                features = [function, block] + 30 * [0]
                inst_node_features.append(torch.tensor(features, dtype=torch.float32))
                inst_node_indices.append(i)
                continue

            op_id = int(full_text.split('ID.')[1].split(' ')[0])
            full_text = ir_op_texts[op_id - 1]

            instruction = text.split(' ')[0]
            one_hot_opcode = get_one_hot_opcode(instruction)

            directives_features = get_directives_features(full_text, metadata, 0)

            loop_depth = metadata[int(full_text.split('!loopDepth !')[1].strip().split(',')[0])][0]

            features = [function, block, loop_depth] + one_hot_opcode + directives_features
            inst_node_features.append(torch.tensor(features, dtype=torch.float32))
            inst_node_indices.append(i)

        elif node.type == 1 or node.type == 2: # Variable or Constant
            if (operation_text := find_instruction(ir_op_texts, full_text)) is not None:
                directives_features = get_directives_features(operation_text, metadata, node.type)
            elif (global_text := find_global_value(ir_global_texts, full_text)) is not None:
                directives_features = get_directives_features(global_text, metadata, node.type)
            else:
                directives_features = [0] * 8

            is_ptr, is_array, is_fp, is_int, is_void, is_struct, is_vector, is_label, is_token = 0, 0, 0, 0, 0, 0, 0, 0, 0
                
            if text[-1] == '*':
                is_ptr = 1
            elif '[' in text:
                is_array = 1
            else:
                is_void = 1 if 'void' in text else 0
                is_fp = 1 if 'float' in text or 'double' in text or 'half' in text else 0
                is_label = 1 if 'label' in text else 0
                is_token = 1 if 'token' in text else 0
                is_int = 1 if text[0] == 'i' else 0
                is_struct = 1 if 'struct' in text else 0
                is_vector = 1 if 'vector' in text else 0

            bitwidth = get_type_bitwidth(text)

            if node.type == 1: # Variable
                features = [function, block, bitwidth, is_void, is_int, is_fp, is_ptr, is_array, is_label, is_token, is_struct, is_vector] + directives_features
                var_node_features.append(torch.tensor(features, dtype=torch.float32))
                var_node_indices.append(i)
            else: # Constant
                if is_int == 1:
                    const_value = int(full_text.split(' ')[-1])
                elif is_fp == 1:
                    const_value = float(full_text.split(' ')[-1])
                else:
                    const_value = 0 # Placeholder for now
                features = [function, block, bitwidth, is_void, is_int, is_fp, is_ptr, is_array, is_label, is_token, is_struct, is_vector, const_value] + directives_features
                const_node_features.append(torch.tensor(features, dtype=torch.float32))
                const_node_indices.append(i)
        
    inst_node_features = torch.stack(inst_node_features)
    var_node_features = torch.stack(var_node_features)
    const_node_features = torch.stack(const_node_features)
        
    return inst_node_features, var_node_features, const_node_features,\
           inst_node_indices, var_node_indices, const_node_indices

def make_adj_mat(edges, inst_node_indices:list, var_node_indices:list, const_node_indices:list):
    node_indices = inst_node_indices + var_node_indices + const_node_indices
    n_inst_nodes = len(inst_node_indices)
    n_nodes = len(node_indices)

    adj_mat_control = torch.zeros(n_inst_nodes, n_inst_nodes)
    adj_mat_call = torch.zeros(n_inst_nodes, n_inst_nodes)
    adj_mat_data = torch.zeros(n_nodes, n_nodes)

    for edge in edges:
        source = node_indices.index(edge.source)
        target = node_indices.index(edge.target)
        if edge.flow == 0:
            adj_mat_control[source, target] = 1
        elif edge.flow == 1:
            adj_mat_data[source, target] = 1
        elif edge.flow == 2:
            adj_mat_call[source, target] = 1

    return adj_mat_control, adj_mat_data, adj_mat_call

def build_cdfg(ir_path:Path):
    with open(ir_path, 'r') as ir_file:
        ir_text = ir_file.read()
        programl_graph = programl.from_llvm_ir(ir_text)

        # with open("estimators/hgt/utils/test_pgml.txt", 'w') as f:
        #    f.write(str(programl_graph))

        ir_lines = ir_text.split('\n')
        ir_op_texts = [ir_op_text for ir_op_text in ir_lines if '!opID' in ir_op_text]
        ir_global_texts = [ir_global_text for ir_global_text in ir_lines if '!globalID' in ir_global_text]

    metadata = get_metadata(ir_path)
    inst_nodes, var_nodes, const_nodes, inst_indices, var_indices, const_indices = get_node_features(programl_graph, metadata, ir_op_texts, ir_global_texts)

    control_adj, data_adj, call_adj = make_adj_mat(programl_graph.edge, inst_indices, var_indices, const_indices)

    return inst_nodes, var_nodes, const_nodes, control_adj, data_adj, call_adj

if __name__ == "__main__":
    ir_path = Path("estimators/hgt/utils/test.ll")
    output_path = Path("estimators/hgt/utils/test_cdfg.txt")
    inst_nodes, var_nodes, const_nodes, adj_mat_control, adj_mat_data, adj_mat_call = build_cdfg(ir_path)

    with open(output_path, "w") as f:
        f.write("inst_nodes\n")
        f.write(str(inst_nodes) + "\n")
        f.write("var_nodes\n")
        f.write(str(var_nodes) + "\n")
        f.write("const_nodes\n")
        f.write(str(const_nodes) + "\n")
        f.write("adj_mat_control\n")
        f.write(str(adj_mat_control) + "\n")
        f.write("adj_mat_data\n")
        f.write(str(adj_mat_data) + "\n")
        f.write("adj_mat_call\n")
        f.write(str(adj_mat_call) + "\n")
