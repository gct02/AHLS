from typing import List, Tuple, Dict, Union
from pathlib import Path

def parse_data_stats_file(
    data_stats_file: Union[str, Path]
) -> Dict[int, List[int]]:
    with open(data_stats_file, 'r') as f:
        stats_dict = {}
        lines = f.readlines()
        for line in lines:
            stats = line.strip().split('|')
            opid = int(stats[0])
            stats_dict[opid] = [
                int(stats[1]), int(stats[2]), int(stats[3]),
                float(stats[4]), float(stats[5]), 
                float(stats[6]), float(stats[7])
            ]
    return stats_dict

def get_transformed_ops_stats(
    data_stats: Dict[int, List[int]], 
    transformed_data_stats: Dict[int, List[int]]
) -> Tuple[List[int], List[int], List[int]]:
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
