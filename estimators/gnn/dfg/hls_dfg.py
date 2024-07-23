import numpy as np
import pandas as pd

import stellargraph as sg
from stellargraph import StellarGraph
from stellargraph import IndexedArray

from pathlib import Path
from metrics.data_stats import *
from sys import argv
from os import environ

from llvm.opt_utils import *
from llvm.clang_utils import *
from metrics.error_measure import *

import subprocess
import pickle

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
                output_file.write(line + "\n")

def build_dfg(dfg_nodes_file: Path, dfg_edges_file: Path, dtype='int32') -> StellarGraph:
    dfg_nodes = parse_dfg_nodes_file(dfg_nodes_file)
    dfg_edges = parse_dfg_edges_file(dfg_edges_file)

    index_array = []
    feature_array = []
    sources = []
    targets = []

    for opid, attrs in dfg_nodes.items():
        index_array.append(opid)
        # features: (opCode, bitwidth, unroll, unroll_factor, array_partition_type, 
        #            array_partition_factor, array_partition_dim, pipeline, pipeline_II, loop_merge)
        feature_array.append(np.array(attrs, dtype='int32'))

    for edge in dfg_edges:
        sources.append(edge[0])
        targets.append(edge[1])
    
    feature_array = np.array(feature_array, dtype='int32')
    index_array = np.array(index_array, dtype='int32')
    sources = np.array(sources, dtype='int32')
    targets = np.array(targets, dtype='int32')

    nodes = IndexedArray(feature_array, index=index_array)
    edges = pd.DataFrame({'source': sources, 'target': targets})
    return StellarGraph(nodes=nodes, edges=edges, is_directed=True, dtype=dtype)
        
if __name__ == '__main__':
    input_ir = Path(argv[1])

    temp_ir_with_md_path = input_ir.parent / (input_ir.stem + ".temp.md.bc")
    ir_with_md_path = input_ir.parent / (input_ir.stem + ".md.bc")
    preprocess_vitis_hls_ir(input_ir, temp_ir_with_md_path)
    update_md(temp_ir_with_md_path, ir_with_md_path)
    temp_ir_with_md_path.unlink()

    if len(argv) == 3:
        tcl_script_path = Path(argv[2])
        directives_tcl_file = input_ir.parent / (input_ir.stem + "_directives.tcl")
        create_directives_tcl_from_script(tcl_script_path, directives_tcl_file)
        ir_with_directives_md_path = input_ir.parent / (input_ir.stem + ".md.dir.bc")
        subprocess.run(f"{OPT} -load {AHLS_LLVM_LIB} -add-directives-md -tcl {directives_tcl_file} < {ir_with_md_path} > {ir_with_directives_md_path}", shell=True)
        ir_with_md_path = ir_with_directives_md_path

    dfg_nodes_file = input_ir.parent / (input_ir.stem + "_dfg_nodes.txt")
    dfg_edges_file = input_ir.parent / (input_ir.stem + "_dfg_edges.txt")
    dfg_file = input_ir.parent / (input_ir.stem + "_dfg.pickle")

    extract_dfg_info(ir_with_md_path, dfg_nodes_file, dfg_edges_file)

    dfg = build_dfg(dfg_nodes_file, dfg_edges_file)
    pickle.dump(dfg, open(dfg_file, 'wb'))