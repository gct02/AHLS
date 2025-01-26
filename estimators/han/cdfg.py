import torch
import programl
import re
from typing import List, Dict, Tuple
from torch import Tensor
from sys import argv
from pathlib import Path

# Set torch to print full tensors
torch.set_printoptions(profile="full")

# "One-hot-like" encoding of the opcodes
OPCODE_DICT = {
    # Arithmetic
    'add':           [1,0,0,0,0, 0,0,0,0,0,1,0],
    'fadd':          [1,0,0,0,0, 0,0,0,0,0,1,0],
    'sub':           [1,0,0,0,0, 0,0,0,0,1,0,0],
    'fsub':          [1,0,0,0,0, 0,0,0,0,1,0,0],
    'mul':           [1,0,0,0,0, 0,0,0,1,0,0,0],
    'fmul':          [1,0,0,0,0, 0,0,0,1,0,0,0],
    'udiv':          [1,0,0,0,0, 0,0,1,0,0,0,1],
    'sdiv':          [1,0,0,0,0, 0,0,1,0,0,0,0],
    'fdiv':          [1,0,0,0,0, 0,0,1,0,0,0,0],
    'urem':          [1,0,0,0,0, 0,1,0,0,0,0,1],
    'srem':          [1,0,0,0,0, 0,1,0,0,0,0,0],
    'frem':          [1,0,0,0,0, 0,1,0,0,0,0,0],
    'sqrt':          [1,0,0,0,0, 1,0,0,0,0,0,0],
    'fsqrt':         [1,0,0,0,0, 1,0,0,0,0,0,0],

    # Logical
    'shl':           [0,1,0,0,0, 0,0,0,0,0,0,1],
    'lshr':          [0,1,0,0,0, 0,0,0,0,0,1,0],
    'ashr':          [0,1,0,0,0, 0,0,0,0,1,0,0],
    'and':           [0,1,0,0,0, 0,0,0,1,0,0,0],
    'or':            [0,1,0,0,0, 0,0,1,0,0,0,0],
    'xor':           [0,1,0,0,0, 0,1,0,0,0,0,0],
    'icmp':          [0,1,0,0,0, 1,0,0,0,0,0,0],
    'fcmp':          [0,1,0,0,0, 1,0,0,0,0,0,0],

    # Memory
    'alloca':        [0,0,1,0,0, 0,0,0,0,0,0,1],
    'load':          [0,0,1,0,0, 0,0,0,0,0,1,0],
    'store':         [0,0,1,0,0, 0,0,0,0,1,0,0],
    'getelementptr': [0,0,1,0,0, 0,0,0,1,0,0,0],
    'fence':         [0,0,1,0,0, 0,0,1,0,0,0,0],

    # Casts
    'trunc':         [0,0,0,1,0, 0,0,0,0,0,1,0],
    'fptrunc':       [0,0,0,1,0, 0,0,0,0,0,1,0],
    'zext':          [0,0,0,1,0, 0,0,0,0,1,0,1],
    'sext':          [0,0,0,1,0, 0,0,0,0,1,0,0],
    'fptoui':        [0,0,0,1,0, 0,0,0,1,0,0,1],
    'fptosi':        [0,0,0,1,0, 0,0,0,1,0,0,0],
    'uitofp':        [0,0,0,1,0, 0,0,0,1,0,0,1],
    'sitofp':        [0,0,0,1,0, 0,0,0,1,0,0,0],
    'bitcast':       [0,0,0,1,0, 0,0,1,0,0,0,0],
    'ptrtoint':      [0,0,0,1,0, 0,1,0,0,0,0,0],
    'inttoptr':      [0,0,0,1,0, 1,0,0,0,0,0,0],

    # Control flow
    'br':            [0,0,0,0,1, 0,0,0,0,0,0,1],
    'resume':        [0,0,0,0,1, 0,0,0,0,0,1,0],
    'ret':           [0,0,0,0,1, 0,0,0,0,1,0,0],
    'call':          [0,0,0,0,1, 0,0,0,1,0,0,0],
    'phi':           [0,0,0,0,1, 0,0,1,0,0,0,0],
    'select':        [0,0,0,0,1, 0,1,0,0,0,0,0],
}

def parse_mdnode(
    mdnode_text: str
) -> List[int]:
    operands_text = mdnode_text.split('!{')[1].split('}')[0].split(',')
    operands = []
    for operand_text in operands_text:
        operand = ''.join(re.findall(r"[-+]?\d*", operand_text.split(' ')[-1]))
        operands.append(int(operand))
    return operands

def get_metadata(
    ir_path: Path
) -> Dict[int, List[int]]:
    with open(ir_path, 'r') as ir_file:
        lines = ir_file.readlines()

    md_pattern = re.compile(
        r'^!\d+ = !\{(i[1-9]\d* [-+]?\d*\.?\d+,\s*)*i[1-9]\d* [-+]?\d*\.?\d+\}$'
    )
    metadata_lines = [line for line in lines if md_pattern.match(line)]
    metadata = {}

    for line in metadata_lines:
        index = int(line.split(' =')[0].strip('!'))
        mdnode_text = line.split('= ')[1]
        metadata[index] = parse_mdnode(mdnode_text)
    
    return metadata

def get_mdnode_id(
    op_line_text: str, 
    mdnode_name: str
) -> int:
    if f"!{mdnode_name}" not in op_line_text:
        return -1
    mdnode_id = op_line_text.split(f"!{mdnode_name} !")[1].strip()
    if ',' in mdnode_id:
        mdnode_id = mdnode_id.split(',')[0]
    return int(mdnode_id)

def get_loop_depth(
    op_line_text: str, 
    metadata: Dict[int, List[int]]
) -> int:
    mdnode_id = get_mdnode_id(op_line_text, "loopDepth")
    if mdnode_id == -1:
        return 0 # Use 0 for instructions outside loops
    return metadata[mdnode_id][0]

def get_trip_count(
    op_line_text: str, 
    metadata: Dict[int, List[int]]
) -> int:
    mdnode_id = get_mdnode_id(op_line_text, "tripCount")
    if mdnode_id == -1:
        return 1 # Use 1 for instructions outside loops
    return metadata[mdnode_id][0]

def get_pipeline_md(
    op_line_text: str, 
    metadata: Dict[int, List[int]]
) -> List[int]:
    mdnode_id = get_mdnode_id(op_line_text, "pipeline")
    if mdnode_id == -1:
        return [0, 0] # Not pipelined
    try:
        pipeline_md = metadata[mdnode_id]
    except KeyError:
        return [0, 0]
    ii = pipeline_md[0]
    return [1, ii]

def get_array_partition_md(
    op_line_text: str, 
    metadata: Dict[int, List[int]]
) -> List[int]:
    mdnode_id = get_mdnode_id(op_line_text, "arrayPartition")
    if mdnode_id == -1:
        return 8 * [0] # Not partitioned
    try:
        partition_md = metadata[mdnode_id]
    except KeyError:
        return 8 * [0] # Not partitioned (metadata not found)
    dim = partition_md[1]
    type_id = partition_md[2] # 1: complete, 2: cyclic, 3: block
    type_one_hot = [0, 0, 0]
    type_one_hot[type_id - 1] = 1
    factor = partition_md[3]
    dim_size = partition_md[4]
    num_partitions = partition_md[5]
    return [1] + type_one_hot + [dim, factor, dim_size, num_partitions]

def get_unroll_md(
    op_line_text: str, 
    metadata: Dict[int, List[int]]
) -> List[int]:
    mdnode_id = get_mdnode_id(op_line_text, "unroll")
    if mdnode_id == -1:
        return [0, 0, 0] # Not unrolled
    try:
        unroll_md = metadata[mdnode_id]
    except KeyError:
        return [0, 0, 0] # Not unrolled (metadata not found)
    complete = unroll_md[1]
    factor = unroll_md[2]
    return [1, complete, factor]

def get_loop_flatten_md(
    op_line_text: str, 
    metadata: Dict[int, List[int]]
) -> List[int]:
    mdnode_id = get_mdnode_id(op_line_text, "loopFlatten")
    if mdnode_id == -1 or mdnode_id not in metadata:
        return [0] # Not flattened
    return [1]

def get_loop_merge_md(
    op_line_text:str, 
    metadata:Dict[int, List[int]]
) -> List[int]:
    mdnode_id = get_mdnode_id(op_line_text, "loopMerge")
    if mdnode_id == -1 or mdnode_id not in metadata:
        return [0] # Not merged
    return [1]

def get_directives_md(
    op_line_text: str, 
    metadata: Dict[int, List[int]]
) -> List[int]:
    return get_pipeline_md(op_line_text, metadata) \
           + get_array_partition_md(op_line_text, metadata) \
           + get_unroll_md(op_line_text, metadata) \
           + get_loop_flatten_md(op_line_text, metadata) \
           + get_loop_merge_md(op_line_text, metadata)

def get_array_md(
    array_declaration_line: str, 
    metadata: Dict[int, List[int]]
) -> List[int]:
    num_dims_md_id = get_mdnode_id(array_declaration_line, "numDims")
    if num_dims_md_id == -1 or num_dims_md_id not in metadata:
        return None
    num_dims = metadata[num_dims_md_id][0]

    num_elems_md_id = get_mdnode_id(array_declaration_line, "numElements")
    if num_elems_md_id == -1 or num_elems_md_id not in metadata:
        return None
    num_elems = metadata[num_elems_md_id][0]

    elem_type_md_id = get_mdnode_id(array_declaration_line, "elementType")
    if elem_type_md_id == -1 or elem_type_md_id not in metadata:
        return None
    elem_type = metadata[elem_type_md_id][0]

    elem_bitwidth_md_id = get_mdnode_id(array_declaration_line, "elementBitwidth")
    if elem_bitwidth_md_id == -1 or elem_bitwidth_md_id not in metadata:
        return None
    elem_bitwidth = metadata[elem_bitwidth_md_id][0]

    return [num_dims, num_elems, elem_type, elem_bitwidth]

def get_bitwidth(
    line_text: str, 
    metadata: Dict[int, List[int]]
) -> int:
    bitwidth_md_id = get_mdnode_id(line_text, "bitwidth")
    if bitwidth_md_id == -1 or bitwidth_md_id not in metadata:
        return 32 # Placeholder for now
    return metadata[bitwidth_md_id][0]

def get_one_hot_opcode(
    inst_text: str
) -> List[int]:
    if inst_text in OPCODE_DICT:
        return OPCODE_DICT[inst_text]
    return [0] * 12 # Unknown instruction

def get_one_hot_type_from_id(
    type_id: int
) -> List[int]:
    # Note: Arrays are treated separately as another node type
    if type_id == 0: # VoidTyID
        return [1, 0, 0, 0, 0, 0, 0]
    elif type_id <= 6: # Floating point types
        return [0, 1, 0, 0, 0, 0, 0]
    elif type_id == 11: # IntegerTyID
        return [0, 0, 1, 0, 0, 0, 0]
    elif type_id == 9 or type_id == 16: # Vectors
        return [0, 0, 0, 1, 0, 0, 0]
    elif type_id == 15: # PointerTyID
        return [0, 0, 0, 0, 1, 0, 0]
    elif type_id == 7: # LabelTyID
        return [0, 0, 0, 0, 0, 1, 0]
    else: # Other types
        return [0, 0, 0, 0, 0, 0, 1]

def get_one_hot_type(
    line_text: str, 
    metadata: Dict[int, List[int]]
) -> List[int]:
    type_md_id = get_mdnode_id(line_text, "type")
    if type_md_id == -1 or type_md_id not in metadata:
        return 7 * [0] # Placeholder for now
    type_id = metadata[type_md_id][0]
    return get_one_hot_type_from_id(type_id)

def get_nodes(
    programl_graph,
    metadata: Dict[str, Dict[str, Dict[str, str]]],
    ir_instructions: Dict[int, str]
) -> Tuple[Dict[str, Tensor], List[int], List[int], List[int], List[int]]:
    INST_FEATURES_SIZE = 21
    VAR_FEATURES_SIZE = 8
    CONST_FEATURES_SIZE = 9
    ARRAY_FEATURES_SIZE = 13

    nodes = {'inst': [], 'var': [], 'const': [], 'array': []}
    indices = {'inst': [], 'var': [], 'const': [], 'array': []}

    for i, node in enumerate(programl_graph.node):
        node_type = node.type
        node_text = node.text

        if node_text == "" or node_text == "[external]":
            if node_type == 0:
                nodes['inst'].append(torch.zeros(INST_FEATURES_SIZE, dtype=torch.float32))
                indices["inst"].append(i)
            elif node_type == 1:
                nodes['var'].append(torch.zeros(VAR_FEATURES_SIZE, dtype=torch.float32))
                indices["var"].append(i)
            else:
                nodes['const'].append(torch.zeros(CONST_FEATURES_SIZE, dtype=torch.float32))
                indices["const"].append(i)
            continue

        node_full_text = node.features.feature["full_text"].bytes_list.value.__str__()[1:-1]
        if node_full_text != "":
            node_full_text = node_full_text[2:-1]

        if node.type == 0:
            # --- Instruction --- #
            if "!ID." not in node_full_text:
                nodes['inst'].append(torch.zeros(INST_FEATURES_SIZE, dtype=torch.float32))
                indices["inst"].append(i)
                continue

            id = int(node_full_text.split('!ID.')[1].split(' ')[0])
            node_full_text = ir_instructions[id]

            raw_md = metadata["instruction"][str(id)]

            one_hot_op = get_one_hot_opcode(raw_md)
            loop_depth = get_loop_depth(raw_md)
            trip_count = get_trip_count(raw_md)

            directives = get_pipeline_md(raw_md) \
                         + get_unroll_md(raw_md) \
                         + get_loop_flatten_md(raw_md) \
                         + get_loop_merge_md(raw_md)

            features = one_hot_op + [loop_depth, trip_count] + directives
            nodes['inst'].append(torch.tensor(features, dtype=torch.float32))
            indices["inst"].append(i)

        elif node.type == 1 or node.type == 2: 
            # --- Variable or Constant --- #
            name = node_text.split(' ')[1] if ' ' in node_text else node_text

            raw_md = metadata["value"][name]

            if "isArray" in raw_md:
                array_md = get_array_md(raw_md)
                one_hot_type = get_one_hot_type_from_id(array_md[2])
                array_partition_md = get_array_partition_md(raw_md)
                features = (array_md[:2] + one_hot_type + array_md[3:]
                            + array_partition_md)
                nodes['array'].append(torch.tensor(features, dtype=torch.float32))
                indices["array"].append(i)
                continue
            
            one_hot_type = get_one_hot_type(raw_md)
            bitwidth = get_bitwidth(raw_md)

            if node.type == 1: 
                # Variable
                features = one_hot_type + [bitwidth]
                nodes['var'].append(torch.tensor(features, dtype=torch.float32))
                indices["var"].append(i)
            else: 
                # Constant
                is_int = True if one_hot_type[2] == 1 else False
                is_float = True if one_hot_type[1] == 1 else False
                if is_int:
                    value_text = node_full_text.split(' ')[-1]
                    if value_text == 'true':
                        const_value = 1
                    elif value_text == 'false':
                        const_value = 0
                    else:
                        try:
                            const_value = int(value_text)
                        except ValueError:
                            const_value = 0
                elif is_float:
                    try:
                        const_value = float(node_full_text.split(' ')[-1])
                    except ValueError:
                        const_value = 0
                else:
                    const_value = 0
                features = one_hot_type + [bitwidth, const_value]
                nodes['const'].append(torch.tensor(features, dtype=torch.float32))
                indices["const"].append(i)

    for key in nodes.keys():
        if len(nodes[key]) > 0:
            nodes[key] = torch.stack(nodes[key])
        else:
            nodes[key] = None

    return nodes, indices

def get_edges(
    programl_graph, 
    indices: Dict[str, List[int]]
) -> Dict[Tuple[str, str, str], Tensor]:
    edges = {
        ('inst','control','inst'): [], 
        ('inst','call','inst'): [], 
        ('inst','data','var'): [],
        ('var','data','inst'): [], 
        ('const','data','inst'): [],
        ('array','data','inst'): [],
        ('inst', 'data', 'array'): [],
        ('inst','id','inst'): [], 
        ('var','id','var'): [],
        ('array','id','array'): []
    }
    # Note: there are no (const, id, const) edges because the constant nodes are 
    # only source nodes in the graph (they should be removed in the 1st layer)
    
    for edge in programl_graph.edge:
        src = edge.source
        dst = edge.target
        src_type = programl_graph.node[src].type
        dst_type = programl_graph.node[dst].type

        if src_type == 0:
            # src is 'inst'
            src_idx = indices["inst"].index(src)
            if dst_type == 0:
                # dst is 'inst'
                dst_idx = indices["inst"].index(dst)
                edge_tensor = torch.tensor([src_idx, dst_idx], 
                                           dtype=torch.int64)
                if edge.flow == 0:
                    edges[('inst','control','inst')].append(edge_tensor)
                else:
                    edges[('inst','call','inst')].append(edge_tensor)
            else:
                if dst in indices["array"]:
                    # dst is 'array'
                    dst_idx = indices["array"].index(dst)
                    edge_tensor = torch.tensor([src_idx, dst_idx], 
                                               dtype=torch.int64)
                    edges[('inst', 'data', 'array')].append(edge_tensor)
                    continue
                # dst is 'var'
                assert dst_type == 1
                dst_idx = indices["var"].index(dst)
                edge_tensor = torch.tensor([src_idx, dst_idx], 
                                           dtype=torch.int64)
                edges[('inst','data','var')].append(edge_tensor)
        elif src_type == 1:
            # src is 'var' or 'array'
            if src in indices["array"]:
                # src is 'array'
                src_idx = indices["array"].index(src)
                dst_idx = indices["inst"].index(dst)
                edge_tensor = torch.tensor([src_idx, dst_idx], 
                                           dtype=torch.int64)
                edges[('array','data','inst')].append(edge_tensor)
                continue
            # src is 'var'
            src_idx = indices["var"].index(src)
            dst_idx = indices["inst"].index(dst)
            edge_tensor = torch.tensor([src_idx, dst_idx], 
                                       dtype=torch.int64)
            edges[('var','data','inst')].append(edge_tensor)
        else:
            # src is 'const' or 'array'
            if src in indices["array"]:
                # src is 'array'
                src_idx = indices["array"].index(src)
                dst_idx = indices["inst"].index(dst)
                edge_tensor = torch.tensor([src_idx, dst_idx], 
                                           dtype=torch.int64)
                edges[('array','data','inst')].append(edge_tensor)
                continue
            # src is 'const'
            src_idx = indices["const"].index(src)
            dst_idx = indices["inst"].index(dst)
            edge_tensor = torch.tensor([src_idx, dst_idx], 
                                       dtype=torch.int64)
            edges[('const','data','inst')].append(edge_tensor)

    n_inst = len(indices["inst"])
    n_var = len(indices["var"])

    for i in range(n_inst):
        edge_tensor = torch.tensor([i, i], dtype=torch.int64)
        edges[('inst','id','inst')].append(edge_tensor)

    for i in range(n_var):
        edge_tensor = torch.tensor([i, i], dtype=torch.int64)
        edges[('var','id','var')].append(edge_tensor)

    for i in range(len(indices["array"])):
        edge_tensor = torch.tensor([i, i], dtype=torch.int64)
        edges[('array','id','array')].append(edge_tensor)

    for key in edges.keys():
        if len(edges[key]) == 0:
            continue
        edges[key] = torch.stack(edges[key]).transpose(0, 1)

    return edges

def parse_md_file(metadata_path: Path) -> Dict[str, Dict[str, Dict[str, str]]]:
    with open(metadata_path, 'r') as f:
        lines = f.readlines()

    # The format of the metadata file is as follows:
    # <node_type_1>:
    #   <node_name_1>:
    #     <metadata_name_1>: <metadata_value_1>
    #     <metadata_name_2>: <metadata_value_2>
    #     ...
    #   <node_name_2>:
    #   ...
    # <node_type_2>:
    # ...
    metadata = {}
    node_type = None
    node_name = None
    for line in lines:
        if line.startswith('  '):
            if node_name is None:
                continue
            if node_name not in metadata[node_type]:
                metadata[node_type][node_name] = {}
            metadata_name, metadata_value = line.strip().split(': ')
            metadata[node_type][node_name][metadata_name] = metadata_value
        elif line.startswith(' '):
            node_name = line.strip()
        else:
            node_type = line.strip()
            metadata[node_type] = {}

    return metadata


def build_cdfg(
    ir_path: Path,
    metadata_path: Path
) -> Tuple[Dict[str, Tensor], Dict[Tuple[str, str, str], Tensor]]:
    with open(ir_path, 'r') as ir_file:
        ir_text = ir_file.read()

    ir_graph = programl.from_llvm_ir(ir_text)

    ir_lines = ir_text.split('\n')

    ir_instructions = {}
    for line in ir_lines:
        if "!ID" not in line:
            continue
        id = int(line.split('!ID.')[1].split(' ')[0])
        ir_instructions[id] = line

    metadata = parse_md_file(metadata_path)

    nodes, indices = get_nodes(ir_graph, metadata, ir_instructions)
    edges = get_edges(ir_graph, indices)

    return nodes, edges

def print_cdfg(
    nodes: Dict[str, Tensor], 
    edges: Dict[Tuple[str, str, str], Tensor],
    output_path: Path = None,
    ir_path: Path = None
) -> None:
    if ir_path is not None:
        with open(ir_path, 'r') as ir_file:
            ir_text = ir_file.read()
        ir_graph = programl.from_llvm_ir(ir_text)

    if output_path is not None:
        with open(output_path, 'w') as f:
            f.write(f"Nodes = {nodes.__str__()}\n\n")
            f.write(f"Edges = {edges.__str__()}\n\n")
            if ir_path is not None:
                f.write(f"ProGraML Graph = {ir_graph.__str__()}")
    else:
        print(f"Nodes = {nodes.__str__()}\n\n")
        print(f"Edges = {edges.__str__()}\n\n")
        if ir_path is not None:
            print(f"ProGraML Graph = {ir_graph.__str__()}")

if __name__ == "__main__":
    # *** For debugging *** #
    ir_path = Path(argv[1])
    output_path = Path(argv[2])

    with open(ir_path, 'r') as ir_file:
        ir_text = ir_file.read()

    ir_graph = programl.from_llvm_ir(ir_text)

    nodes, edges = build_cdfg(ir_path)

    with open(output_path, "w") as f:
        f.write(f"Nodes = {nodes.__str__()}\n\n")
        f.write(f"Edges = {edges.__str__()}")
        f.write(f"ProGraML Graph = {ir_graph.__str__()}")
