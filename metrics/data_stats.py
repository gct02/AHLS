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
