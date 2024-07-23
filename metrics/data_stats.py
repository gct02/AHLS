def parse_data_stats_file(data_stats_file):
    with open(data_stats_file, 'r') as f:
        stats = {}
        lines = f.readlines()
        for line in lines:
            stats_str = line.strip().split('|')
            opid = int(stats_str[0])
            stats[opid] = [int(stats_str[1]), int(stats_str[2]), int(stats_str[3]),\
                           float(stats_str[4]), float(stats_str[5]), float(stats_str[6]), float(stats_str[7])]
    return stats

def parse_dfg_nodes_file(dfg_nodes_file):
    with open(dfg_nodes_file, 'r') as f:
        dfg_nodes = {}
        lines = f.readlines()
        for line in lines:
            node_str = line.strip().split(',')
            # node[opID]: (opCode, bitwidth, unroll, unroll_factor, array_partition_type, 
            #            array_partition_factor, array_partition_dim, pipeline, pipeline_II, loop_merge)
            opid = int(node_str[0])
            dfg_nodes[opid] = [int(node_str[i]) for i in range(1, len(node_str))]
    return dfg_nodes

def parse_dfg_edges_file(dfg_edges_file):
    with open(dfg_edges_file, 'r') as f:
        dfg_edges = []
        lines = f.readlines()
        for line in lines:
            edge_str = line.strip().split(',')
            dfg_edges.append([int(edge_str[0]), int(edge_str[1])])
    return dfg_edges

def get_transformed_ops_stats(data_stats: dict, transformed_data_stats: dict):
    """
    Get the ID from each operation that has been modified.
    """
    modified_ops = []
    removed_ops = []
    added_ops = []

    for opid in data_stats.keys():
        if opid not in transformed_data_stats:
            removed_ops.append(opid)
        elif data_stats[opid] != transformed_data_stats[opid]:
            modified_ops.append(opid)

    for opid in transformed_data_stats.keys():
        if opid not in data_stats:
            added_ops.append(opid)
    
    return modified_ops, removed_ops, added_ops
