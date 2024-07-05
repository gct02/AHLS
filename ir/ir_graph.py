import numpy as np
import pandas as pd

import stellargraph as sg
from stellargraph import StellarGraph
from stellargraph import IndexedArray

from pathlib import Path
from metrics.data_stats import *
from sys import argv

# set numpy array size limit to infinite
np.set_printoptions(threshold=np.inf)

class IRGraph:
    def __init__(self, data_stats_file: Path, op_uses_file: Path, dtype='int32'):
        data_stats = parse_data_stats_file(data_stats_file)
        op_uses = parse_op_uses_file(op_uses_file)
        self._build_graph(data_stats, op_uses, dtype)

    def _build_graph(self, data_stats: dict, op_uses: dict, dtype):
        index_array = []
        feature_array = []
        sources = []
        targets = []

        for opid, stats in data_stats.items():
            index_array.append(opid)
            feature_array.append(np.array(stats[0:5], dtype='int32'))

            uses = op_uses[opid]
            for use in uses:
                sources.append(opid)
                targets.append(use)
        
        feature_array = np.array(feature_array, dtype='int32')
        index_array = np.array(index_array, dtype='int32')
        sources = np.array(sources, dtype='int32')
        targets = np.array(targets, dtype='int32')

        self.nodes = IndexedArray(feature_array, index=index_array)
        self.edges = pd.DataFrame({'source': sources, 'target': targets})
        self.graph = StellarGraph(nodes=self.nodes, edges=self.edges, is_directed=True, dtype=dtype)
    
    '''
    def assign_labels(self, labels: list):
        # Each label is a vector (#LUT, #FF, #DSP, #BRAM, latency)
        for i, label in enumerate(labels):
            self.graph['nodes'][i]['labels'].append(label)
    '''
        
if __name__ == '__main__':
    data_stats_file = Path(argv[1])
    op_uses_file = Path(argv[2])
    ir_graph = IRGraph(data_stats_file, op_uses_file)
    print(ir_graph.graph.node_features())