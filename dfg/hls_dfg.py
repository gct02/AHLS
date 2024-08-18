import numpy as np
import torch
import subprocess
import json

from pathlib import Path
from os import environ
from sys import argv

from llvm.opt_utils import *
from llvm.clang_utils import *

try:
    AHLS_LLVM_LIB = environ['AHLS_LLVM_LIB']
    OPT = environ['OPT']
    CLANG = environ['CLANG']
    LLVM_LINK = environ['LLVM_LINK']
except KeyError as ahls_error:
    print(f"Error: environment variable {ahls_error.args[0]} not defined.")
    raise

def create_directives_tcl(solution_data_json:Path, output_path:Path):
    with open(solution_data_json, "r") as f:
        data = json.load(f)
    directives_tcl = data["HlsSolution"]["DirectiveTcl"]
    with open(output_path, "w") as f:
        directives_tcl = "\n".join(directives_tcl)
        f.write(directives_tcl)

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

def build_dfg_lut(dfg_file:Path):
    nodes, edges = parse_dfg_file(dfg_file)
    nodes, edges = strip_nodes(nodes, edges, list(range(1, 29)) + [51, 52, 53, 54, 55])
    nodes, edges = rescale_node_ids(nodes, edges)
    adj_mat = get_adj_mat(nodes, edges)

    features = []

    for node in nodes:
        opcode = node[1]

        if opcode >= 53 or opcode <= 13:
            one_hot_opcode = [0, 0, 0, 0, 0, 0]
        elif opcode <= 14:
            one_hot_opcode = [0, 0, 0, 0, 0, 1]
        elif opcode in [51, 52]:
            one_hot_opcode = [0, 0, 0, 0, 1, 0]
        elif opcode <= 16:
            one_hot_opcode = [0, 0, 0, 1, 0, 0]
        elif opcode <= 22:
            one_hot_opcode = [0, 0, 1, 0, 0, 0]
        elif opcode <= 25:
            one_hot_opcode = [0, 1, 0, 0, 0, 0]
        else:
            one_hot_opcode = [1, 0, 0, 0, 0, 0]

        # node_features = one_hot_opcode + node[2:5] + get_directives_features(node[5:12])
        node_features = one_hot_opcode + node[2:5] + node[9:11]
        features.append(torch.FloatTensor(node_features))

    features = torch.stack(features)
    return features, adj_mat

def build_dfg_ff(dfg_file:Path):
    nodes, edges = parse_dfg_file(dfg_file)
    nodes, edges = strip_nodes(nodes, edges, list(range(11, 29)) + [51, 52, 53])
    nodes, edges = rescale_node_ids(nodes, edges)
    adj_mat = get_adj_mat(nodes, edges)

    features = []

    for node in nodes:
        opcode = node[1]

        if opcode == 53:
            one_hot_opcode = [0, 0, 0, 0]
        elif opcode <= 14 or opcode in [51, 52]:
            one_hot_opcode = [0, 0, 0, 1]
        elif opcode <= 16:
            one_hot_opcode = [0, 0, 1, 0]
        elif opcode <= 22:
            one_hot_opcode = [0, 1, 0, 0]
        else:
            one_hot_opcode = [1, 0, 0, 0]

        node_features = one_hot_opcode + node[2:5] + get_directives_features(node[5:])
        features.append(torch.FloatTensor(node_features))

    features = torch.stack(features)
    return features, adj_mat

def build_dfg_cp(dfg_file:Path):
    nodes, edges = parse_dfg_file(dfg_file)
    nodes, edges = strip_nodes(nodes, edges, list(range(11, 29)) + [51, 52, 53])
    nodes, edges = rescale_node_ids(nodes, edges)
    adj_mat = get_adj_mat(nodes, edges)

    features = []

    for node in nodes:
        opcode = node[1]

        if opcode == 53:
            one_hot_opcode = [0, 0, 0, 0]
        elif opcode <= 14 or opcode in [51, 52]:
            one_hot_opcode = [0, 0, 0, 1]
        elif opcode <= 16:
            one_hot_opcode = [0, 0, 1, 0]
        elif opcode <= 22:
            one_hot_opcode = [0, 1, 0, 0]
        else:
            one_hot_opcode = [1, 0, 0, 0]

        node_features = one_hot_opcode + node[2:5] + get_directives_features(node[5:])
        features.append(torch.FloatTensor(node_features))

    features = torch.stack(features)
    return features, adj_mat

if __name__ == "__main__":
    dataset_path = Path(argv[1])
    dfg_folder_path = Path(argv[2])

    projects = sorted(list(dataset_path.iterdir()))

    for i, project in enumerate(projects):
        solutions = sorted(list(project.iterdir()))
        for j, solution in enumerate(solutions):
            if not solution.is_dir():
                continue
            ir = solution / ".autopilot/db/a.o.3.bc"
            if not ir.exists():
                continue
            ir_mod_temp = solution / ".autopilot/db/a.o.4.temp.bc"
            ir_mod = solution / ".autopilot/db/a.o.4.bc"

            subprocess.check_output(f"{OPT} -strip-debug -mem2reg -instcombine -loop-simplify -indvars < {ir.as_posix()} > {ir_mod_temp.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -update-md < {ir_mod_temp.as_posix()} > {ir_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            
            solution_data_json = solution / f"{solution.stem}_data.json"
            directives_tcl_path = solution / f"directives.tcl"
            create_directives_tcl(solution_data_json, directives_tcl_path)

            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -add-directives-md -tcl {directives_tcl_path.as_posix()} < {ir_mod.as_posix()} > {ir_mod_temp.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
            
            ir_mod.unlink()
            ir_mod_temp.rename(ir_mod)

            # Name it in a way that the creation order is the same as the lexicographical order
            name = ""
            if i < 100:
                name += "0"
            if i < 10:
                name += "0"
            name += str(i) + "_"
            if j < 100:
                name += "0"
            if j < 10:
                name += "0"
            name += str(j) + ".txt"
            dfg_file = dfg_folder_path / name

            subprocess.check_output(f"{OPT} -load {AHLS_LLVM_LIB} -get-dfg -dfg-file {dfg_file.as_posix()} < {ir_mod.as_posix()};",\
                                    stderr=subprocess.STDOUT, shell=True)
    