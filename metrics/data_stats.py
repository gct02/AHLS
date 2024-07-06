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

def parse_op_attrs_file(op_attrs_file):
    with open(op_attrs_file, 'r') as f:
        attrs = {}
        lines = f.readlines()
        for line in lines:
            attrs_str = line.strip().split(',')
            # attrs[opID] = (opCode, bitwidth)
            opid = int(attrs_str[0])
            attrs[opid] = [int(attrs_str[1]), int(attrs_str[2])]
    return attrs

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
        elif data_stats[opid] != transformed_data_stats[opid]:
            modified_ops.append(opid)

    for opid in transformed_data_stats.keys():
        if opid not in data_stats:
            added_ops.append(opid)
    
    return modified_ops, removed_ops, added_ops
