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
    mdnode_ops_text = mdnode_text.split('!{')[1].split('}')[0].split(',')
    mdnode_ops = []
    for op in mdnode_ops_text:
        if op.startswith('i1'):
            if op == 'i1 true':
                mdnode_ops.append(1)
            else:
                mdnode_ops.append(0)
        else:
            mdnode_ops.append(int(op.split(' ')[-1]))
    return mdnode_ops

def get_metadata(ir_path:Path):
    with open(ir_path, 'r') as ir_file:
        lines = ir_file.readlines()

    md_pattern = re.compile(r'^!\d+ = !\{(i\d+ (true|false|[-+]?\d*\.?\d+),\s*)*i\d+ (true|false|[-+]?\d*\.?\d+)\}$')

    metadata_lines = [line for line in lines if md_pattern.match(line)]
    metadata = {}

    for line in metadata_lines:
        index = int(line.split(' = ')[0].strip('!'))
        mdnode_text = line.split(' = ')[1]
        metadata[index] = parse_mdnode(mdnode_text)
    
    return metadata

def get_directives_features(nodes, metadata, ir_ops_full_text):
    unroll_nodes = {}
    pipeline_nodes = {}
    array_partition_nodes = {}

    unroll_nodes_indexes = []
    pipeline_nodes_indexes = []
    array_partition_nodes_indexes = []

    directive_edges = []

    print(metadata)

    for i, node in enumerate(nodes):
        node_full_text = node.features.feature["full_text"].__str__()
        
        if "!dummyOpID" in node_full_text:  
            # Instruction node
            dummy_op_id = int(node_full_text.split('.')[-1].split(' ')[0])
            node_full_text = ir_ops_full_text[dummy_op_id - 1]

            node_tokens = node_full_text.strip().split(',')

            while len(node_tokens) > 0 and "!unroll" not in node_tokens[-1]:
                node_tokens.pop()

            if len(node_tokens) == 0:
                continue

            unroll_id = int(node_tokens[-1].split('!')[-1])
            pipeline_id = int(node_tokens[-2].split('!')[-1])

            unroll_md = metadata[unroll_id]
            pipeline_md = metadata[pipeline_id]

            unroll_index = unroll_md[0]
            pipeline_index = pipeline_md[0]

            if unroll_index != 0:
                directive_edges.append((unroll_index, i))
                if unroll_index not in unroll_nodes:
                    function = node.function
                    block = node.block
                    unroll_nodes[unroll_index] = [function, block, unroll_md[1], unroll_md[2]]
            
            if pipeline_index != 0:
                directive_edges.append((pipeline_index, i))
                if pipeline_index not in pipeline_nodes:
                    function = node.function
                    if pipeline_md[1] == 0:
                        block = node.block
                    else:
                        block = 0
                    pipeline_nodes[pipeline_index] = [function, block, pipeline_md[2], pipeline_md[3]]
        else:   
            # Variable or Constant node
            if '!array_partition' not in node_full_text:
                continue

            node_tokens = node_full_text.strip().split(',')

            while len(node_tokens) > 0 and "!array_partition" not in node_tokens[-1]:
                node_tokens.pop()

            if len(node_tokens) == 0:
                continue

            array_partition_id = int(node_tokens[-1].split('!')[-1].strip('"\n}'))
            array_partition_md = metadata[array_partition_id]

            array_partition_index = array_partition_md[0]

            if array_partition_index != 0:
                directive_edges.append((array_partition_index, i))
                if array_partition_index not in array_partition_nodes:
                    array_partition_type = array_partition_md[2]
                    one_hot_array_partition_type = 3 * [0]
                    one_hot_array_partition_type[array_partition_type - 1] = 1
                    array_partition_nodes[array_partition_index] = [array_partition_md[1]] + one_hot_array_partition_type + [array_partition_md[3], array_partition_md[4]]

    n_directives = len(unroll_nodes) + len(pipeline_nodes) + len(array_partition_nodes)
    n_nodes = len(nodes)
    current_directive_index = n_nodes

    adj_mat = torch.zeros(n_nodes + n_directives + 3, n_nodes + n_directives + 3)

    # Transforming dictionaries into tensors
    unroll_nodes_features = []
    pipeline_nodes_features = []
    array_partition_nodes_features = []

    for index, features in unroll_nodes.items():
        unroll_nodes_features.append(torch.tensor(features, dtype=torch.float32))
        unroll_nodes_indexes.append(current_directive_index)
        for edge in directive_edges:
            if edge[0] == index:
                adj_mat[current_directive_index, edge[1]] = 1
        current_directive_index += 1

    for index, features in pipeline_nodes.items():
        pipeline_nodes_features.append(torch.tensor(features, dtype=torch.float32))
        pipeline_nodes_indexes.append(current_directive_index)
        for edge in directive_edges:
            if edge[0] == index:
                adj_mat[current_directive_index, edge[1]] = 1
        current_directive_index += 1

    for index, features in array_partition_nodes.items():
        array_partition_nodes_features.append(torch.tensor(features, dtype=torch.float32))
        array_partition_nodes_indexes.append(current_directive_index)
        for edge in directive_edges:
            if edge[0] == index:
                adj_mat[current_directive_index, edge[1]] = 1
        current_directive_index += 1

    # Node representing the absence of the 'unroll' directive
    # It should be connected to all nodes that do not have an 'unroll' directive node
    # connected to them
    unroll_nodes_features.append(torch.tensor([0, 0, 0, 0], dtype=torch.float32))
    unroll_nodes_indexes.append(current_directive_index)

    for i in range(n_nodes):
        if nodes[i].type != 0:
            continue
        if any([i == edge[1] for edge in directive_edges if edge[0] in unroll_nodes]):
            continue
        adj_mat[current_directive_index, i] = 1

    # Node representing the absence of the 'pipeline' directive
    # It should be connected to all nodes that do not have a 'pipeline' directive node
    # connected to them
    pipeline_nodes_features.append(torch.tensor([0, 0, 0, 0], dtype=torch.float32))
    pipeline_nodes_indexes.append(current_directive_index + 1)

    for i in range(n_nodes):
        if nodes[i].type != 0:
            continue
        if any([i == edge[1] for edge in directive_edges if edge[0] in pipeline_nodes]):
            continue
        adj_mat[current_directive_index + 1, i] = 1
    
    # Node representing the absence of the 'array_partition' directive
    # It should be connected to all nodes that do not have an 'array_partition' directive node
    # connected to them
    array_partition_nodes_features.append(torch.tensor([0, 0, 0, 0, 0, 0], dtype=torch.float32))
    array_partition_nodes_indexes.append(current_directive_index + 2)

    for i in range(n_nodes):
        if nodes[i].type == 0:
            continue
        if any([i == edge[1] for edge in directive_edges if edge[0] in array_partition_nodes]):
            continue
        adj_mat[current_directive_index + 2, i] = 1

    unroll_nodes_features = torch.stack(unroll_nodes_features)
    unroll_nodes_indexes = torch.tensor(unroll_nodes_indexes, dtype=torch.long)
    
    pipeline_nodes_features = torch.stack(pipeline_nodes_features)
    pipeline_nodes_indexes = torch.tensor(pipeline_nodes_indexes, dtype=torch.long)

    array_partition_nodes_features = torch.stack(array_partition_nodes_features)
    array_partition_nodes_indexes = torch.tensor(array_partition_nodes_indexes, dtype=torch.long)

    return unroll_nodes_features, pipeline_nodes_features, array_partition_nodes_features,\
           unroll_nodes_indexes, pipeline_nodes_indexes, array_partition_nodes_indexes, adj_mat

def build_cdfg(ir_path:Path, has_directives=False):
    with open(ir_path, 'r') as ir_file:
        ir_text = ir_file.read()
        programl_graph = programl.from_llvm_ir(ir_text)

        ir_lines = ir_text.split('\n')
        ir_ops_full_text = [ir_op_text for ir_op_text in ir_lines if '!dummyOpID' in ir_op_text]

    metadata = get_metadata(ir_path)
    inst_nodes, var_nodes, const_nodes, inst_indexes, var_indexes, const_indexes = get_node_features(programl_graph, metadata, ir_ops_full_text)

    n_nodes = len(programl_graph.node)

    if has_directives:
        unroll_nodes, pipeline_nodes, array_partition_nodes,\
        unroll_indexes, pipeline_indexes, array_partition_indexes, adj_mat_directives = get_directives_features(programl_graph.node, metadata, ir_ops_full_text)
        n_nodes += adj_mat_directives.shape[0]
        adj_mat_control, adj_mat_data, adj_mat_call = make_adj_mat(programl_graph.edge, n_nodes)
        return inst_nodes, var_nodes, const_nodes, inst_indexes, var_indexes, const_indexes, \
               unroll_nodes, pipeline_nodes, array_partition_nodes, unroll_indexes, pipeline_indexes, array_partition_indexes, \
               adj_mat_control, adj_mat_data, adj_mat_call, adj_mat_directives
    else:
        adj_mat_control, adj_mat_data, adj_mat_call = make_adj_mat(programl_graph.edge, n_nodes)
        return inst_nodes, var_nodes, const_nodes, inst_indexes, var_indexes, const_indexes, \
               adj_mat_control, adj_mat_data, adj_mat_call

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

def get_node_features(programl_graph, metadata, ir_ops_full_text):
    inst_nodes_features = []
    var_nodes_features = []
    const_nodes_features = []

    inst_nodes_indexes = []
    var_nodes_indexes = []
    const_nodes_indexes = []

    for i, node in enumerate(programl_graph.node):
        function = node.function
        block = node.block
        text = node.text
        full_text = node.features.feature["full_text"].__str__()

        if node.type == 0:  # Instruction
            if "!dummyOpID" in full_text:
                dummy_op_id = int(full_text.split('.')[-1].split(' ')[0])
                full_text = ir_ops_full_text[dummy_op_id - 1]

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

            inst_nodes_features.append(torch.tensor(features, dtype=torch.float32))
            inst_nodes_indexes.append(i)
        elif node.type == 1 or node.type == 2:  # Variable or Constant
            is_ptr = 1 if '*' in text else 0
            is_array = 1 if '[' in text else 0
            is_fp = 1 if 'float' in text or 'double' in text else 0
            is_struct = 1 if 'struct' in text else 0
            if 'token' in text or is_struct == 1:
                bitwidth = 32   # Placeholder for now
            else:
                bitwidth = get_type_bitwidth(text)
            features = [function, block, is_fp, is_ptr, is_array, is_struct, bitwidth]
            if node.type == 1:    # Variable
                var_nodes_features.append(torch.tensor(features, dtype=torch.float32))
                var_nodes_indexes.append(i)
            else:   # Constant
                const_nodes_features.append(torch.tensor(features, dtype=torch.float32))
                const_nodes_indexes.append(i)
        
    inst_nodes_features = torch.stack(inst_nodes_features)
    var_nodes_features = torch.stack(var_nodes_features)
    const_nodes_features = torch.stack(const_nodes_features)

    inst_node_indexes = torch.tensor(inst_nodes_indexes, dtype=torch.long)
    var_node_indexes = torch.tensor(var_nodes_indexes, dtype=torch.long)
    const_node_indexes = torch.tensor(const_nodes_indexes, dtype=torch.long)
        
    return inst_nodes_features, var_nodes_features, const_nodes_features, \
           inst_node_indexes, var_node_indexes, const_node_indexes

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
    inst_nodes, var_nodes, const_nodes, inst_indexes, var_indexes, const_indexes, \
    unroll_nodes, pipeline_nodes, array_partition_nodes, unroll_indexes, pipeline_indexes, array_partition_indexes, \
    adj_mat_control, adj_mat_data, adj_mat_call, adj_mat_directives = build_cdfg(ir_path, has_directives=True)

    with open(output_path, "w") as f:
        f.write("inst_nodes\n")
        f.write(str(inst_nodes) + "\n")
        f.write("var_nodes\n")
        f.write(str(var_nodes) + "\n")
        f.write("const_nodes\n")
        f.write(str(const_nodes) + "\n")
        f.write("inst_indexes\n")
        f.write(str(inst_indexes) + "\n")
        f.write("var_indexes\n")
        f.write(str(var_indexes) + "\n")
        f.write("const_indexes\n")
        f.write(str(const_indexes) + "\n")
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
        f.write("unroll_indexes\n")
        f.write(str(unroll_indexes) + "\n")
        f.write("pipeline_indexes\n")
        f.write(str(pipeline_indexes) + "\n")
        f.write("array_partition_indexes\n")
        f.write(str(array_partition_indexes) + "\n")

