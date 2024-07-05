def parse_data_stats_file(data_stats_file):
    with open(data_stats_file, 'r') as f:
        stats = {}
        lines = f.readlines()
        for line in lines:
            stats_str = line.strip().split('|')
            opid = int(stats_str[0])
            stats[opid] = [int(stats_str[1]), int(stats_str[2]), int(stats_str[3]),\
                           int(stats_str[4]), int(stats_str[5]), int(stats_str[6]),\
                           float(stats_str[7]), float(stats_str[8]),\
                           float(stats_str[9]), float(stats_str[10])]
    return stats

def parse_op_uses_file(op_uses_file):
    with open(op_uses_file, 'r') as f:
        op_uses = {}
        lines = f.readlines()
        for line in lines:
            opid, uses = line.split(':')
            uses = uses.split()[1:]
            op_uses[int(opid)] = [int(use) for use in uses]
    return op_uses

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
        elif data_stats[opid][0] != transformed_data_stats[opid][0]\
            or data_stats[opid][1] != transformed_data_stats[opid][1]\
            or data_stats[opid][2] != transformed_data_stats[opid][2]\
            or data_stats[opid][3] != transformed_data_stats[opid][3]\
            or data_stats[opid][4] != transformed_data_stats[opid][4]\
            or data_stats[opid][9] != transformed_data_stats[opid][9]:
            modified_ops.append(opid)

    for opid in transformed_data_stats.keys():
        if opid not in data_stats:
            added_ops.append(opid)
    
    return modified_ops, removed_ops, added_ops
