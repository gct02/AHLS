import numpy as np
import torch
import programl
import re, gc
from sys import argv
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

    md_pattern = re.compile(r'^!\d+ = !\{(i[1-9]\d* [-+]?\d*\.?\d+,\s*)*i[1-9]\d* [-+]?\d*\.?\d+\}$')

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

        loop_merge_md = metadata[loop_merge_md_id][1:]
        loop_flatten_md = metadata[loop_flatten_md_id][1:]
        unroll_md = metadata[unroll_md_id][1:]
        pipeline_md = metadata[pipeline_md_id][1:]

        pipeline_on = pipeline_md[0]
        pipeline_ii_spec = pipeline_md[2]
        pipeline_ii = pipeline_md[3]
        if pipeline_ii_spec == 0 or pipeline_on == 0:
            pipeline_ii = 0
        pipeline_features = [pipeline_on, pipeline_ii]

        unroll_on = unroll_md[0]
        unroll_factor = unroll_md[2]
        if unroll_on == 0:
            unroll_factor = 1
        unroll_features = [unroll_factor]

        loop_flatten_features = loop_flatten_md
        loop_merge_features = loop_merge_md

        return unroll_features + pipeline_features + loop_flatten_features + loop_merge_features
    else: # Variable or Constant
        array_partition_md_id = int(node_full_text.split("!arrayPartition !")[1].strip().split(',')[0])
        array_partition_md = metadata[array_partition_md_id]

        array_partition_on = array_partition_md[0]
        array_partition_type = array_partition_md[3]
        array_partition_factor = array_partition_md[4]
        array_partition_dim = array_partition_md[5]

        array_partition_type = 0 if array_partition_type <= 2 else 1
        if array_partition_on == 0:
            array_partition_factor = 1
        
        array_partition_features = [array_partition_type, array_partition_dim, array_partition_factor]

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

def find_value_in_ir(ir_text_lines, value_text):
    for line in ir_text_lines:
        if value_text in line.split('=')[0]:
            return line
    return None

def get_type_bitwidth(text:str, full_text:str):
    if text[-1] == '*':
        return 32 # Placeholder for now
    if '[' in text: # Array type
        array_size = int(text.split('[')[1].split(' x ')[0])
        array_type = text.split(' x ')[1].split(']')[0]
        array_type_bitwidth = get_type_bitwidth(array_type, full_text)
        return array_size * array_type_bitwidth
    if 'void' in text:
        return 0
    if 'half' in text:
        return 16
    if 'float' in text:
        return 32
    if 'double' in text:
        return 64
    if text[0] == 'i':
        return int(text.strip('i'))
    if 'vector' in text or ('<' in full_text and '>' in full_text):
        vector_size = int(full_text.split('<')[1].split(' x ')[0])
        vector_type = full_text.split(' x ')[1].split('>')[0]
        vector_type_bitwidth = get_type_bitwidth(vector_type, vector_type)
        return vector_size * vector_type_bitwidth
    return 32 # Placeholder for now

def get_num_of_dims(text:str):
    num_dims = text.count('[')
    num_dims += text.count('<')
    return num_dims

def get_nodes(programl_graph, metadata, ir_op_texts, ir_global_texts, directives:bool=False):
    nodes = {'inst': [], 'var': [], 'const': []}
    inst_indices, var_indices, const_indices = [], [], []

    for i, node in enumerate(programl_graph.node):
        # function = node.function
        # block = node.block
        text = node.text

        full_text = node.features.feature["full_text"].bytes_list.value.__str__()[1:-1]

        if full_text != "":
            full_text = full_text[2:-1]

        if node.type == 0:  # Instruction
            if "ID." not in full_text:
                external = 1
                features = [external] + [0] * 22
                if directives:
                    features += 5 * [0]
            else:
                external = 0
                op_id = int(full_text.split('ID.')[1].split(' ')[0])
                full_text = ir_op_texts[op_id - 1]

                instruction = text.split(' ')[0]
                one_hot_opcode = get_one_hot_opcode(instruction)

                loop_depth_md_id = int(full_text.split("!loopDepth !")[1].strip().split(',')[0])
                loop_depth = metadata[loop_depth_md_id][0]

                trip_count_md_id = int(full_text.split("!tripCount !")[1].strip().split(',')[0])
                trip_count = metadata[trip_count_md_id][0]

                if directives:
                    directives_features = get_directives_features(full_text, metadata, node.type)
                    features = [external] + one_hot_opcode + [loop_depth, trip_count] + directives_features
                else:
                    features = [external] + one_hot_opcode + [loop_depth, trip_count]

            features = torch.tensor(features, dtype=torch.float32)
            nodes['inst'].append(features)
            inst_indices.append(i)
        elif node.type == 1 or node.type == 2: # Variable or Constant
            if directives:
                lines_to_search = ir_global_texts if node.type == 1 else ir_op_texts
                value_text = find_value_in_ir(lines_to_search, full_text)
                if value_text is not None:
                    directives_features = get_directives_features(value_text, metadata, node.type)
                else:
                    directives_features = 3 * [0]

            is_ptr, is_array, is_int, is_fp, is_void, is_vector, is_struct, is_label = 0, 0, 0, 0, 0, 0, 0, 0
                
            if text[-1] == '*':
                is_ptr = 1
            elif '[' in text:
                is_array = 1
            elif 'void' in text:
                is_void = 1
            elif 'float' in text or 'double' in text or 'half' in text:
                is_fp = 1
            elif text[0] == 'i':
                is_int = 1
            elif 'struct' in text:
                is_struct = 1
            elif 'vector' in text or ('<' in full_text and '>' in full_text):
                is_vector = 1
            elif 'label' in text:
                is_label = 1

            one_hot_type = [is_ptr, is_array, is_int, is_fp, is_void, is_vector, is_struct, is_label]
            bitwidth = get_type_bitwidth(text, full_text)
            num_dims = get_num_of_dims(text)

            if node.type == 1: # Variable
                features = one_hot_type + [num_dims, bitwidth]
                if directives:
                    features += directives_features
                features = torch.tensor(features, dtype=torch.float32)
                nodes['var'].append(features)
                var_indices.append(i)
            else: # Constant
                if is_int == 1:
                    value_text = full_text.split(' ')[-1]
                    if value_text == 'true':
                        const_value = 1
                    elif value_text == 'false':
                        const_value = 0
                    else:
                        # Check if string is convertible to int
                        try:
                            const_value = int(value_text)
                        except ValueError:
                            const_value = 0
                elif is_fp == 1:
                    const_value = float(full_text.split(' ')[-1])
                else:
                    const_value = 0 # Placeholder for now
                    
                features = one_hot_type + [num_dims, bitwidth, const_value]
                if directives:
                    features += directives_features
                features = torch.tensor(features, dtype=torch.float32)
                nodes['const'].append(features)
                const_indices.append(i)
        
    nodes['inst'] = torch.stack(nodes['inst'])
    nodes['var'] = torch.stack(nodes['var'])
    nodes['const'] = torch.stack(nodes['const'])
    
    return nodes, inst_indices, var_indices, const_indices

def get_edges(programl_graph, inst_indices, var_indices, const_indices):
    edges = {('inst', 'control', 'inst'): [], ('inst', 'call', 'inst'): [], ('inst', 'data', 'var'): [],
             ('var', 'data', 'inst'): [], ('const', 'data', 'inst'): [], ('inst', 'id', 'inst'): [], ('var', 'id', 'var'): []}
    
    for edge in programl_graph.edge:
        source = edge.source
        target = edge.target
        source_type = programl_graph.node[source].type
        target_type = programl_graph.node[target].type

        if source_type == 0:
            assert source in inst_indices
            source_idx = inst_indices.index(source)
            if target_type == 0:
                assert target in inst_indices
                target_idx = inst_indices.index(target)
                if edge.flow == 0:
                    edges[('inst', 'control', 'inst')].append(torch.tensor([source_idx, target_idx], dtype=torch.int64))
                else:
                    edges[('inst', 'call', 'inst')].append(torch.tensor([source_idx, target_idx], dtype=torch.int64))
            else:
                assert target in var_indices
                target_idx = var_indices.index(target)
                edges[('inst', 'data', 'var')].append(torch.tensor([source_idx, target_idx], dtype=torch.int64))
        elif source_type == 1:
            assert source in var_indices
            source_idx = var_indices.index(source)
            assert target in inst_indices
            target_idx = inst_indices.index(target)
            edges[('var', 'data', 'inst')].append(torch.tensor([source_idx, target_idx], dtype=torch.int64))
        else:
            assert source in const_indices
            source_idx = const_indices.index(source)
            assert target in inst_indices
            target_idx = inst_indices.index(target)
            edges[('const', 'data', 'inst')].append(torch.tensor([source_idx, target_idx], dtype=torch.int64))

    n_inst, n_var = len(inst_indices), len(var_indices)

    for i in range(n_inst):
        edges[('inst', 'id', 'inst')].append(torch.tensor([i, i], dtype=torch.int64))

    for i in range(n_var):
        edges[('var', 'id', 'var')].append(torch.tensor([i, i], dtype=torch.int64))

    edges[('inst', 'control', 'inst')] = torch.stack(edges[('inst', 'control', 'inst')]).transpose(0, 1)
    edges[('inst', 'call', 'inst')] = torch.stack(edges[('inst', 'call', 'inst')]).transpose(0, 1)
    edges[('inst', 'data', 'var')] = torch.stack(edges[('inst', 'data', 'var')]).transpose(0, 1)
    edges[('var', 'data', 'inst')] = torch.stack(edges[('var', 'data', 'inst')]).transpose(0, 1)
    edges[('const', 'data', 'inst')] = torch.stack(edges[('const', 'data', 'inst')]).transpose(0, 1)
    edges[('inst', 'id', 'inst')] = torch.stack(edges[('inst', 'id', 'inst')]).transpose(0, 1)
    edges[('var', 'id', 'var')] = torch.stack(edges[('var', 'id', 'var')]).transpose(0, 1)

    return edges

def build_cdfg(ir_path:Path, directives:bool=False):
    with open(ir_path, 'r') as ir_file:
        ir_text = ir_file.read()
        programl_graph = programl.from_llvm_ir(ir_text)
        ir_lines = ir_text.split('\n')
        ir_op_texts = [ir_op_text for ir_op_text in ir_lines if '!opID' in ir_op_text]
        ir_global_texts = [ir_global_text for ir_global_text in ir_lines if '!globalID' in ir_global_text]

    metadata = get_metadata(ir_path)

    nodes, inst_indices, var_indices, const_indices = get_nodes(programl_graph, metadata, ir_op_texts, ir_global_texts, directives)
    edges = get_edges(programl_graph, inst_indices, var_indices, const_indices)

    return nodes, edges

if __name__ == "__main__":
    ir_path = Path(argv[1])
    output_path = Path(argv[2])

    nodes, edges = build_cdfg(ir_path)

    with open(output_path, "w") as f:
        f.write(f"Nodes:\n")
        f.write(f"Instruction Nodes:\n{nodes['inst']}\n")
        f.write(f"Variable Nodes:\n{nodes['var']}\n")
        f.write(f"Constant Nodes:\n{nodes['const']}\n")
        f.write(f"\nEdges:\n")
        f.write(f"Control Edges:\n{edges[('inst', 'control', 'inst')]}\n")
        f.write(f"Call Edges:\n{edges[('inst', 'call', 'inst')]}\n")
        f.write(f"Data Edges (Var -> Inst):\n{edges[('var', 'data', 'inst')]}\n")
        f.write(f"Data Edges (Inst -> Var):\n{edges[('inst', 'data', 'var')]}\n")
        f.write(f"Data Edges (Const -> Inst):\n{edges[('const', 'data', 'inst')]}\n")
