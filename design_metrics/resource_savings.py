import torch

def parse_data_stats_file(data_stats_file):
    with open(data_stats_file, 'r') as f:
        data_stats = {}
        lines = f.readlines()
        for line in lines:
            data_stats_str = line.strip().split('|')
            data_stats[data_stats_str[0]] = [int(data_stats_str[1]), int(data_stats_str[2]), int(data_stats_str[3]),\
                                             int(data_stats_str[4]), int(data_stats_str[5]), int(data_stats_str[6]),\
                                             float(data_stats_str[7]), float(data_stats_str[8]),\
                                             float(data_stats_str[9]), float(data_stats_str[10])]
    return data_stats

def get_transformed_ops_stats(data_stats : dict, transformed_data_stats : dict):
    """
    Get the ID, opcode, signedness, bitwidth and number of occurences from
    each operation whose values have been modified. 
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
            or data_stats[opid][4] != transformed_data_stats[opid][4]:
            modified_ops.append(opid)

    for opid in transformed_data_stats.keys():
        if opid not in data_stats:
            added_ops.append(opid)
    
    return modified_ops, removed_ops, added_ops

def get_lut_savings(data_stats : dict, transformed_data_stats : dict, report_file=None):
    model = torch.load("models/resource_usage_model.sav")
    modified_ops, removed_ops, added_ops = get_transformed_ops_stats(data_stats, transformed_data_stats)

    lut_savings = 0

    for opid in modified_ops:
        original_op_stats = data_stats[opid]
        transformed_op_stats = transformed_data_stats[opid]
        original_op_stats = torch.tensor(original_op_stats[0:4]).unsqueeze(0)
        transformed_op_stats = torch.tensor(transformed_op_stats[0:4]).unsqueeze(0)

        original_luts = model(original_op_stats).item()
        transformed_luts = model(transformed_op_stats).item()

        lut_savings += original_luts - transformed_luts

    for opid in removed_ops:
        original_op_stats = data_stats[opid]
        original_op_stats = torch.tensor(original_op_stats[0:4]).unsqueeze(0)
        original_luts = model(original_op_stats).item()
        lut_savings += original_luts

    for opid in added_ops:
        transformed_op_stats = transformed_data_stats[opid]
        transformed_op_stats = torch.tensor(transformed_op_stats[0:4]).unsqueeze(0)
        transformed_luts = model(transformed_op_stats).item()
        lut_savings -= transformed_luts

    
    