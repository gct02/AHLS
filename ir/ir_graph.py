import numpy as np
import pandas as pd

import stellargraph as sg
from stellargraph import StellarGraph
from stellargraph import IndexedArray

from pathlib import Path
from metrics.data_stats import *
from sys import argv

import pickle

def create_ir_graph(dfg_nodes_file: Path, dfg_edges_file: Path, dtype='int32') -> StellarGraph:
    dfg_nodes = parse_dfg_nodes_file(dfg_nodes_file)
    dfg_edges = parse_dfg_edges_file(dfg_edges_file)

    index_array = []
    feature_array = []
    sources = []
    targets = []

    for opid, attrs in dfg_nodes.items():
        index_array.append(opid)
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
    dfg_nodes_file = Path(argv[1])
    dfg_edges_file = Path(argv[2])
    output_file = Path(argv[3])
    ir_graph = create_ir_graph(dfg_nodes_file, dfg_edges_file)
    pickle.dump(ir_graph, open(output_file, 'wb'))