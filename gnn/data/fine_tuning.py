import os
import json

import numpy as np
import torch

from gnn.models import HGT
from gnn.data.graph import (
    DIRECTIVES,
    find_array_node,
    find_region_node
)
from gnn.data.kernel.vitis_kernel_info import (
    VitisKernelInfo,
    RegionNode,
    ArrayNode
)
from gnn.data.utils.parsers import parse_directive_cmd


PRIORITARY_DIRECTIVES = {"pipeline", "array_partition"}

DEFAULT_NUM_CONFIGS = 10


def select_directive_groups(
    dct_config_path: str,
    kernel_info: VitisKernelInfo,
    num_configs: int = DEFAULT_NUM_CONFIGS,
):
    if not os.path.exists(dct_config_path):
        raise ValueError(f"Directive configuration file not found: "
                         f"{dct_config_path}")
    
    with open(dct_config_path, "r") as f:
        dct_config = json.load(f)

    dct_dict = dct_config.get("directives")
    if dct_dict is None:
        raise ValueError(f"Directive configuration file does not contain "
                         f"directives: {dct_config_path}")
    
    region_nodes = kernel_info.nodes.get("region", [])
    array_nodes = kernel_info.nodes.get("array", [])

    region_sizes = [len(node.instrs) for node in region_nodes]
    array_sizes = [node.total_size for node in array_nodes]
    trip_counts = [node.attrs.get("max_tc", 1) for node in region_nodes]

    mean_region_size = np.mean(region_sizes) if region_sizes else 0
    mean_array_size = np.mean(array_sizes) if array_sizes else 0
    mean_trip_count = np.mean(trip_counts) if trip_counts else 0

    region_size_std = np.std(region_sizes) if region_sizes else 0
    array_size_std = np.std(array_sizes) if array_sizes else 0
    trip_count_std = np.std(trip_counts) if trip_counts else 0

    region_size_threshold = mean_region_size + region_size_std
    array_size_threshold = mean_array_size + array_size_std
    trip_count_threshold = mean_trip_count + trip_count_std

    selected_dct_groups = {dct: [] for dct in PRIORITARY_DIRECTIVES}

    for group in dct_dict.values():
        possible_dcts = group.get("possible_directives")
        if possible_dcts is None or len(possible_dcts) <= 1:
            continue
        dct_type = group.get("directive_type", "unknown")
        if dct_type not in PRIORITARY_DIRECTIVES:
            continue
        function = group.get("function")
        if dct_type == "array_partition":
            target = group.get("variable")
            if not target:
                continue
            node = find_array_node(kernel_info, target, function)
            if node is None:
                continue
            if (node.total_size >= array_size_threshold
                or node.is_top_level_port):
                selected_dct_groups[dct_type].append(group)
        else:
            target = group.get("label")
            if not target:
                target = function
            node = find_region_node(kernel_info, target, function)
            if node is None:
                continue
            if (node.attrs.get("max_tc", 1) >= trip_count_threshold
                or len(node.instrs) >= region_size_threshold
                or _has_variable_bounds(node)):
                selected_dct_groups[dct_type].append(group)
                
        return selected_dct_groups
    

def select_directive_configs(
    dct_config_path: str,
    kernel_info: VitisKernelInfo,
    num_configs: int = DEFAULT_NUM_CONFIGS,
):
    if not os.path.exists(dct_config_path):
        raise ValueError(f"Directive configuration file not found: "
                         f"{dct_config_path}")
    
    with open(dct_config_path, "r") as f:
        dct_config = json.load(f)

    dct_dict = dct_config.get("directives")
    if dct_dict is None:
        raise ValueError(f"Directive configuration file does not contain "
                         f"directives: {dct_config_path}")
    
    ...


def _has_variable_bounds(region_node: RegionNode):
    min_tc = region_node.attrs.get("min_tc")
    max_tc = region_node.attrs.get("max_tc")
    return min_tc != max_tc
