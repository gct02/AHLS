import numpy as np
import torch
import programl
import re
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

def parse_mdnode(mdnode_text:str):
    mdnode_operands_text = mdnode_text.split('!{')[1].split('}')[0].split(',')
    mdnode_operands = []
    for mdnode_operand in mdnode_operands_text:
        if mdnode_operand.startswith('i1'):
            if mdnode_operand == 'i1 true':
                mdnode_operands.append(1)
            else:
                mdnode_operands.append(0)
        else:
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

def get_directives_features(nodes, metadata, ir_operation_texts):
    unroll_nodes = {}
    pipeline_nodes = {}
    array_partition_nodes = {}
    directive_edges = []

    for i, node in enumerate(nodes):
        node_full_text = node.features.feature["full_text"].__str__()
        
        if "!dummyOpID" in node_full_text:  
            # Instruction node
            dummy_op_id = int(node_full_text.split('.')[-1].split(' ')[0])
            node_full_text = ir_operation_texts[dummy_op_id - 1]

            node_tokens = node_full_text.strip().split(',')

            while len(node_tokens) > 0 and "!unroll" not in node_tokens[-1]:
                node_tokens.pop()

            if len(node_tokens) == 0:
                continue

            unroll_md_index = int(node_tokens[-1].split('!')[-1])
            pipeline_md_index = int(node_tokens[-2].split('!')[-1])

            unroll_md = metadata[unroll_md_index]
            pipeline_md = metadata[pipeline_md_index]

            unroll_index = unroll_md[0]
            pipeline_index = pipeline_md[0]

            if unroll_index != 0:
                directive_edges.append((unroll_index, i))
                if unroll_index not in unroll_nodes:
                    unroll_nodes[unroll_index] = unroll_md[1:3]
            
            if pipeline_index != 0:
                directive_edges.append((pipeline_index, i))
                if pipeline_index not in pipeline_nodes:
                    pipeline_nodes[pipeline_index] = pipeline_md[2:4]
        else:   
            # Variable or Constant node
            if '!array_partition' not in node_full_text:
                continue

            node_tokens = node_full_text.strip().split(',')

            while len(node_tokens) > 0 and "!array_partition" not in node_tokens[-1]:
                node_tokens.pop()

            if len(node_tokens) == 0:
                continue

            array_partition_md_index = int(node_tokens[-1].split('!')[-1].strip('"\n}'))
            array_partition_md = metadata[array_partition_md_index]

            array_partition_index = array_partition_md[0]

            if array_partition_index != 0:
                directive_edges.append((array_partition_index, i))
                if array_partition_index not in array_partition_nodes:
                    array_partition_type = array_partition_md[2]
                    one_hot_array_partition_type = 3 * [0]
                    one_hot_array_partition_type[array_partition_type - 1] = 1
                    array_partition_nodes[array_partition_index] = one_hot_array_partition_type + array_partition_md[3:5]

    n_directives = len(unroll_nodes) + len(pipeline_nodes) + len(array_partition_nodes)
    n_nodes = len(nodes)
    current_node_index = n_nodes

    adj_mat = torch.zeros(n_nodes + n_directives, n_nodes + n_directives)

    # Transforming dictionaries into tensors
    unroll_node_features = []
    pipeline_node_features = []
    array_partition_node_features = []

    unroll_node_indices = []
    pipeline_node_indices = []
    array_partition_node_indices = []

    for index, features in unroll_nodes.items():
        unroll_node_features.append(torch.tensor(features, dtype=torch.float32))
        unroll_node_indices.append(current_node_index)
        for edge in directive_edges:
            if edge[0] == index:
                adj_mat[current_node_index, edge[1]] = 1
        current_node_index += 1

    for index, features in pipeline_nodes.items():
        pipeline_node_features.append(torch.tensor(features, dtype=torch.float32))
        pipeline_node_indices.append(current_node_index)
        for edge in directive_edges:
            if edge[0] == index:
                adj_mat[current_node_index, edge[1]] = 1
        current_node_index += 1

    for index, features in array_partition_nodes.items():
        array_partition_node_features.append(torch.tensor(features, dtype=torch.float32))
        array_partition_node_indices.append(current_node_index)
        for edge in directive_edges:
            if edge[0] == index:
                adj_mat[current_node_index, edge[1]] = 1
        current_node_index += 1

    if len(unroll_node_features) == 0:
        unroll_node_features = torch.empty(0, 2)
        unroll_node_indices = torch.empty(0, dtype=torch.long)
    else:
        unroll_node_features = torch.stack(unroll_node_features)
        unroll_node_indices = torch.tensor(unroll_node_indices, dtype=torch.long)
    
    if len(pipeline_node_features) == 0:
        pipeline_node_features = torch.empty(0, 2)
        pipeline_node_indices = torch.empty(0, dtype=torch.long)
    else:
        pipeline_node_features = torch.stack(pipeline_node_features)
        pipeline_node_indices = torch.tensor(pipeline_node_indices, dtype=torch.long)

    if len(array_partition_node_features) == 0:
        array_partition_node_features = torch.empty(0, 5)
        array_partition_node_indices = torch.empty(0, dtype=torch.long)
    else:
        array_partition_node_features = torch.stack(array_partition_node_features)
        array_partition_node_indices = torch.tensor(array_partition_node_indices, dtype=torch.long)

    return unroll_node_features, pipeline_node_features, array_partition_node_features,\
           unroll_node_indices, pipeline_node_indices, array_partition_node_indices,\
           adj_mat

def build_cdfg(ir_path:Path):
    with open(ir_path, 'r') as ir_file:
        ir_text = ir_file.read()
        programl_graph = programl.from_llvm_ir(ir_text)
        ir_lines = ir_text.split('\n')
        ir_operations_text = [ir_op_text for ir_op_text in ir_lines if '!dummyOpID' in ir_op_text]

    metadata = get_metadata(ir_path)
    inst_nodes, var_nodes, const_nodes, inst_indices, var_indices, const_indices = get_node_features(programl_graph, metadata, ir_operations_text)

    unroll_nodes, pipeline_nodes, arr_partition_nodes,\
    unroll_indices, pipeline_indices, arr_partition_indices, directive_adj = get_directives_features(programl_graph.node, metadata, ir_operations_text)

    n_nodes = directive_adj.shape[0]

    control_adj, data_adj, call_adj = make_adj_mat(programl_graph.edge, n_nodes)

    return inst_nodes, var_nodes, const_nodes, unroll_nodes, pipeline_nodes, arr_partition_nodes,\
           inst_indices, var_indices, const_indices, unroll_indices, pipeline_indices, arr_partition_indices,\
           control_adj, data_adj, call_adj, directive_adj

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
    if '*' in text or 'struct' in text or 'token' in text or 'label' in text:
        return 32 # Placeholder for now
    if '[' in text: # Array type
        array_size = int(text.split('[')[1].split(' x ')[0])
        array_type = text.split(' x ')[1].split(']')[0]
        array_type_bitwidth = get_type_bitwidth(array_type)
        return array_size * array_type_bitwidth
    if 'float' in text:
        return 32
    if 'double' in text:
        return 64
    return int(text.strip('i'))

def get_node_features(programl_graph, metadata, ir_operations_text):
    inst_node_features = []
    var_node_features = []
    const_node_features = []

    inst_node_indices = []
    var_node_indices = []
    const_node_indices = []

    for i, node in enumerate(programl_graph.node):
        function = node.function
        block = node.block
        text = node.text
        full_text = node.features.feature["full_text"].__str__()

        if node.type == 0:  # Instruction
            if "!dummyOpID" in full_text:
                dummy_op_id = int(full_text.split('.')[-1].split(' ')[0])
                full_text = ir_operations_text[dummy_op_id - 1]

            instruction = text.split(' ')[0]
            one_hot_opcode = get_one_hot_opcode(instruction)

            if '!' not in full_text:
                loop_depth = 0
            else:
                full_text_tokens = full_text.split(',')

                while "!loopDepth" not in full_text_tokens[-1]:
                    full_text_tokens.pop()

                loop_depth = metadata[int(full_text_tokens[-1].split('!')[2])][0]
            
            features = [function, block, loop_depth] + one_hot_opcode

            inst_node_features.append(torch.tensor(features, dtype=torch.float32))
            inst_node_indices.append(i)
        elif node.type == 1 or node.type == 2:  # Variable or Constant
            is_ptr = 1 if '*' in text else 0
            is_array = 1 if '[' in text else 0
            is_struct = 1 if 'struct' in text else 0
            is_fp = 1 if 'float' in text or 'double' in text else 0

            bitwidth = get_type_bitwidth(text)

            features = [function, block, bitwidth, is_fp, is_ptr, is_array, is_struct]

            if node.type == 1:    # Variable
                var_node_features.append(torch.tensor(features, dtype=torch.float32))
                var_node_indices.append(i)
            else:   # Constant
                const_node_features.append(torch.tensor(features, dtype=torch.float32))
                const_node_indices.append(i)
        
    inst_node_features = torch.stack(inst_node_features)
    var_node_features = torch.stack(var_node_features)
    const_node_features = torch.stack(const_node_features)

    inst_node_indices = torch.tensor(inst_node_indices, dtype=torch.long)
    var_node_indices = torch.tensor(var_node_indices, dtype=torch.long)
    const_node_indices = torch.tensor(const_node_indices, dtype=torch.long)
        
    return inst_node_features, var_node_features, const_node_features,\
           inst_node_indices, var_node_indices, const_node_indices

def make_adj_mat(edges, n_nodes):
    adj_mat_control = torch.zeros(n_nodes, n_nodes)
    adj_mat_data = torch.zeros(n_nodes, n_nodes)
    adj_mat_call = torch.zeros(n_nodes, n_nodes)

    adj_mat_control.fill_diagonal_(1)
    adj_mat_data.fill_diagonal_(1)

    for edge in edges:
        source = edge.source - 1
        target = edge.target - 1
        if edge.flow == 0:
            adj_mat_control[source, target] = 1
        elif edge.flow == 1:
            adj_mat_data[source, target] = 1
        elif edge.flow == 2:
            adj_mat_call[source, target] = 1

    return adj_mat_control, adj_mat_data, adj_mat_call

if __name__ == "__main__":
    ir_path = Path("estimators/utils/test1.5.ll")
    output_path = Path("estimators/utils/test1.5_cdfg.txt")
    inst_nodes, var_nodes, const_nodes, unroll_nodes, pipeline_nodes, array_partition_nodes,\
    inst_indices, var_indices, const_indices, unroll_indices, pipeline_indices,array_partition_indices,\
    adj_mat_control, adj_mat_data, adj_mat_call, adj_mat_directives = build_cdfg(ir_path)

    with open(output_path, "w") as f:
        f.write("inst_nodes\n")
        f.write(str(inst_nodes) + "\n")
        f.write("var_nodes\n")
        f.write(str(var_nodes) + "\n")
        f.write("const_nodes\n")
        f.write(str(const_nodes) + "\n")
        f.write("inst_indices\n")
        f.write(str(inst_indices) + "\n")
        f.write("var_indices\n")
        f.write(str(var_indices) + "\n")
        f.write("const_indices\n")
        f.write(str(const_indices) + "\n")
        f.write("adj_mat_control\n")
        f.write(str(adj_mat_control) + "\n")
        f.write("adj_mat_data\n")
        f.write(str(adj_mat_data) + "\n")
        f.write("adj_mat_call\n")
        f.write(str(adj_mat_call) + "\n")
        f.write("unroll_nodes\n")
        f.write(str(unroll_nodes) + "\n")
        f.write("pipeline_nodes\n")
        f.write(str(pipeline_nodes) + "\n")
        f.write("array_partition_nodes\n")
        f.write(str(array_partition_nodes) + "\n")
        f.write("unroll_indices\n")
        f.write(str(unroll_indices) + "\n")
        f.write("pipeline_indices\n")
        f.write(str(pipeline_indices) + "\n")
        f.write("array_partition_indices\n")
        f.write(str(array_partition_indices) + "\n")

