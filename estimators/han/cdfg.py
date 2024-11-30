import torch
import programl
import re
from typing import List
from sys import argv
from pathlib import Path


torch.set_printoptions(profile="full")


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


def parse_mdnode(mdnode_text:str):
    operands_text = mdnode_text.split('!{')[1].split('}')[0].split(',')
    operands = []
    for operand_text in operands_text:
        operand = ''.join(re.findall(r"[-+]?\d*", operand_text.split(' ')[-1]))
        operands.append(int(operand))
    return operands


def get_metadata(ir_path:Path):
    with open(ir_path, 'r') as ir_file:
        lines = ir_file.readlines()

    md_pattern = re.compile(
        r'^!\d+ = !\{(i[1-9]\d* [-+]?\d*\.?\d+,\s*)*i[1-9]\d* [-+]?\d*\.?\d+\}$'
    )

    metadata_lines = [line for line in lines if md_pattern.match(line)]
    metadata = {}

    for line in metadata_lines:
        index = int(line.split(' = ')[0].strip('!'))
        mdnode_text = line.split(' = ')[1]
        metadata[index] = parse_mdnode(mdnode_text)
    
    return metadata


def get_mdnode_id(op_line_text:str, mdnode_name:str):
    if f"!{mdnode_name}" not in op_line_text:
        return -1
    mdnode_id = op_line_text.split(f"!{mdnode_name} !")[1].strip()
    if ',' in mdnode_id:
        mdnode_id = mdnode_id.split(',')[0]
    return int(mdnode_id)


def get_loop_pipeline_features(op_line_text:str, metadata:dict):
    mdnode_id = get_mdnode_id(op_line_text, "loopPipeline")
    if mdnode_id == -1:
        return [0,0]
    return metadata[mdnode_id][:2]


def get_loop_depth(op_line_text:str, metadata:dict):
    mdnode_id = get_mdnode_id(op_line_text, "loopDepth")
    if mdnode_id == -1:
        return [0,0]
    return metadata[mdnode_id][0]


def get_trip_count(op_line_text:str, metadata:dict):
    mdnode_id = get_mdnode_id(op_line_text, "loopPipeline")
    if mdnode_id == -1:
        return [0,0]
    return metadata[mdnode_id][0]


def get_one_hot_opcode(op_type_text:str):
    if op_type_text in OPCODE_DICT:
        return OPCODE_DICT[op_type_text]
    return [0]*13 # Unknown instruction


def find_value_declaration(ir_lines:list, value_text:str):
    for line in ir_lines:
        if value_text in line.split('=')[0]:
            return line
    return None


def get_bitwidth(type_text:str, op_line_text:str):
    if type_text[-1] == '*': # Pointer type
        return 32 # Placeholder for now
    if '[' in type_text: # Array type
        n_elems = int(type_text.split('[')[1].split(' x')[0])
        elem_type = type_text.split('x ')[1].split(']')[0]
        elem_bitwidth = get_bitwidth(elem_type, op_line_text)
        return n_elems * elem_bitwidth
    if 'void' in type_text: # Void type
        return 0
    if 'half' in type_text: # 16-bit float type
        return 16
    if 'float' in type_text: # 32-bit float type
        return 32
    if 'double' in type_text: # 64-bit float type
        return 64
    if type_text[0] == 'i': # Int type
        return int(type_text[1:])
    if 'vector' in type_text or \
        ('<' in op_line_text and '>' in op_line_text): # Vector type
        n_elems = int(op_line_text.split('<')[1].split(' x')[0])
        elem_type = op_line_text.split('x ')[1].split('>')[0]
        elem_bitwidth = get_bitwidth(elem_type, elem_type)
        return n_elems * elem_bitwidth
    # Other types (e.g. struct, label, token, etc.)
    return 32 # Placeholder for now


def get_nodes(
    programl_graph, 
    metadata:dict, 
    op_lines_text:list
    ):
    nodes = {'inst': [], 'var': [], 'const': []}
    inst_indices, var_indices, const_indices = [], [], []

    for i, node in enumerate(programl_graph.node):
        text = node.text
        full_text = node.features.feature["full_text"]
        full_text = full_text.bytes_list.value.__str__()[1:-1]
        
        if full_text != "":
            full_text = full_text[2:-1]

        if node.type == 0: # Instruction
            if "ID." not in full_text:
                external = 1
                features = [external] + [0]*17
            else:
                external = 0
                op_id = int(full_text.split('ID.')[1].split(' ')[0])
                full_text = op_lines_text[op_id-1]

                instruction = text.split(' ')[0]

                one_hot_opcode = get_one_hot_opcode(instruction)
                loop_depth = get_loop_depth(full_text, metadata)
                trip_count = get_trip_count(full_text, metadata)
                pipeline_features = get_loop_pipeline_features(full_text, metadata)

                features = [external] + one_hot_opcode + \
                    [loop_depth, trip_count] + pipeline_features

            features = torch.tensor(features, dtype=torch.float32)
            nodes['inst'].append(features)
            inst_indices.append(i)
        elif node.type == 1 or node.type == 2: # Variable or Constant
            one_hot_type = [0]*8
            
            if text[-1] == '*': # Pointer type
                one_hot_type[0] = 1
            elif '[' in text: # Array type
                one_hot_type[1] = 1
            elif text[0] == 'i': # Int type
                one_hot_type[2] = 1
            elif 'float' in text or 'double' in text or 'half' in text: # Float type
                one_hot_type[3] = 1
            elif 'void' in text: # Void type
                one_hot_type[4] = 1
            elif 'struct' in text: # Struct type
                one_hot_type[5] = 1
            elif 'vector' in text or \
                ('<' in full_text and '>' in full_text): # Vector type
                one_hot_type[6] = 1
            else: # Other type (label, token, etc.)
                one_hot_type[7] = 1

            bitwidth = get_bitwidth(text, full_text)

            if node.type == 1: # Variable
                features = one_hot_type + [bitwidth]
                features = torch.tensor(features, dtype=torch.float32)
                nodes['var'].append(features)
                var_indices.append(i)
            else: # Constant
                if one_hot_type[0] == 1:
                    value_text = full_text.split(' ')[-1]
                    if value_text == 'true':
                        const_value = 1
                    elif value_text == 'false':
                        const_value = 0
                    else:
                        try:
                            const_value = int(value_text)
                        except ValueError:
                            const_value = 0
                elif one_hot_type[1] == 1:
                    const_value = float(full_text.split(' ')[-1])
                else:
                    const_value = 0 # Placeholder for now
                features = one_hot_type + [bitwidth, const_value]
                features = torch.tensor(features, dtype=torch.float32)
                nodes['const'].append(features)
                const_indices.append(i)
        
    nodes['inst'] = torch.stack(nodes['inst'])
    nodes['var'] = torch.stack(nodes['var'])
    nodes['const'] = torch.stack(nodes['const'])

    return nodes, inst_indices, var_indices, const_indices


def get_edges(
    programl_graph, 
    inst_indices:List[int], 
    var_indices:List[int], 
    const_indices:List[int]
    ):
    edges = {
        ('inst','control','inst'): [], 
        ('inst','call','inst'): [], 
        ('inst','data','var'): [],
        ('var','data','inst'): [], 
        ('const','data','inst'): [], 
        ('inst','id','inst'): [], 
        ('var','id','var'): []
    }
    
    for edge in programl_graph.edge:
        src = edge.source
        dst = edge.target
        src_type = programl_graph.node[src].type
        dst_type = programl_graph.node[dst].type

        if src_type == 0:
            assert src in inst_indices
            src_idx = inst_indices.index(src)
            if dst_type == 0:
                assert dst in inst_indices
                dst_idx = inst_indices.index(dst)
                edge_tensor = torch.tensor([src_idx, dst_idx], 
                                           dtype=torch.int64)
                if edge.flow == 0:
                    edges[('inst','control','inst')].append(edge_tensor)
                else:
                    edges[('inst','call','inst')].append(edge_tensor)
            else:
                assert dst in var_indices
                dst_idx = var_indices.index(dst)
                edge_tensor = torch.tensor([src_idx, dst_idx], 
                                           dtype=torch.int64)
                edges[('inst','data','var')].append(edge_tensor)
        elif src_type == 1:
            assert src in var_indices
            src_idx = var_indices.index(src)
            assert dst in inst_indices
            dst_idx = inst_indices.index(dst)
            edge_tensor = torch.tensor([src_idx, dst_idx], 
                                       dtype=torch.int64)
            edges[('var','data','inst')].append(edge_tensor)
        else:
            assert src in const_indices
            src_idx = const_indices.index(src)
            assert dst in inst_indices
            dst_idx = inst_indices.index(dst)
            edge_tensor = torch.tensor([src_idx, dst_idx], 
                                       dtype=torch.int64)
            edges[('const','data','inst')].append(edge_tensor)

    n_inst = len(inst_indices)
    n_var = len(var_indices)

    for i in range(n_inst):
        edge_tensor = torch.tensor([i, i], dtype=torch.int64)
        edges[('inst','id','inst')].append(edge_tensor)

    for i in range(n_var):
        edge_tensor = torch.tensor([i, i], dtype=torch.int64)
        edges[('var','id','var')].append(edge_tensor)

    for key in edges.keys():
        edges[key] = torch.stack(edges[key]).transpose(0, 1)

    return edges


def build_cdfg(ir_path:Path):
    with open(ir_path, 'r') as ir_file:
        ir_text = ir_file.read()

    programl_graph = programl.from_llvm_ir(ir_text)
    ir_lines = ir_text.split('\n')
    op_lines = [line for line in ir_lines if '!opID' in line]

    metadata = get_metadata(ir_path)

    nodes, inst_idx, var_idx, const_idx = \
        get_nodes(programl_graph, metadata, op_lines)
    edges = get_edges(programl_graph, inst_idx, var_idx, const_idx)

    return nodes, edges


if __name__ == "__main__":

    # *** For debugging *** #

    ir_path = Path(argv[1])
    output_path = Path(argv[2])

    nodes, edges = build_cdfg(ir_path)

    with open(output_path, "w") as f:
        f.write(f"Node dict = {nodes.__str__()}\n\n")
        f.write(f"Edge dict = {edges.__str__()}")
