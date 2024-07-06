import numpy as np
import pandas as pd

import stellargraph as sg
from stellargraph import StellarGraph
from stellargraph import IndexedArray

from pathlib import Path
from metrics.data_stats import *
from sys import argv

import pickle

def create_ir_graph(op_attrs_file: Path, op_uses_file: Path, dtype='int32') -> StellarGraph:
    op_attrs = parse_op_attrs_file(op_attrs_file)
    op_uses = parse_op_uses_file(op_uses_file)

    index_array = []
    feature_array = []
    sources = []
    targets = []

    for opid, attrs in op_attrs.items():
        index_array.append(opid)
        feature_array.append(np.array(attrs, dtype='int32'))

        uses = op_uses[opid]
        for use in uses:
            sources.append(opid)
            targets.append(use)
    
    feature_array = np.array(feature_array, dtype='int32')
    index_array = np.array(index_array, dtype='int32')
    sources = np.array(sources, dtype='int32')
    targets = np.array(targets, dtype='int32')

    nodes = IndexedArray(feature_array, index=index_array)
    edges = pd.DataFrame({'source': sources, 'target': targets})
    return StellarGraph(nodes=nodes, edges=edges, is_directed=True, dtype=dtype)
        
if __name__ == '__main__':
    op_attrs_file = Path(argv[1])
    op_uses_file = Path(argv[2])
    output_file = Path(argv[3])
    ir_graph = create_ir_graph(op_attrs_file, op_uses_file)
    pickle.dump(ir_graph, open(output_file, 'wb'))