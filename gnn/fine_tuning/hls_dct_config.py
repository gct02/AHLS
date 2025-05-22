import os
import json
from typing import List, Dict, Union

import numpy as np

from gnn.data.graph import (
    find_array_node,
    find_region_node
)
from gnn.data.kernel.vitis_kernel_info import (
    VitisKernelInfo,
    RegionNode,
    ArrayNode
)


DirectiveGroup = Dict[str, Union[str, List[str]]]

CRITICAL_DIRECTIVES = {"array_partition", "pipeline", "unroll"}


def filter_directive_groups(
    input_dct_config_path: str, 
    filtered_dct_config_path: str,
    kernel_info: VitisKernelInfo,
    num_pipelines: int = 2,
    num_unrolls: int = 1
):
    def insert_array_dct(dct_node_tuples, group_name, group, node):
        if not dct_node_tuples:
            dct_node_tuples.append((group_name, group, node))
            return

        for i, (_, existing_node) in enumerate(dct_node_tuples):
            if node.total_size >= existing_node.total_size:
                dct_node_tuples.insert(i, (group_name, group, node))
                return
            
        dct_node_tuples.append((group_name, group, node))

    def insert_loop_dct(dct_node_tuples, group_name, group, node):
        if not dct_node_tuples:
            dct_node_tuples.append((group_name, group, node))
            return
        
        unbounded = _has_variable_bounds(node)
        lat = node.attrs.get("max_lat", 0)
        for i, (_, existing_node) in enumerate(dct_node_tuples):
            existing_lat = existing_node.attrs.get("max_lat", 0)
            if lat == existing_lat:
                # prioritize unbounded loops when latency is equal
                if unbounded:
                    dct_node_tuples.insert(i, (group_name, group, node))
                    return
                else:
                    existing_unbounded = _has_variable_bounds(existing_node)
                    if not existing_unbounded:
                        dct_node_tuples.insert(i, (group_name, group, node))
                        return
            elif lat > existing_lat:
                dct_node_tuples.insert(i, (group_name, group, node))
                return

        dct_node_tuples.append((group_name, group, node))

    if not os.path.exists(input_dct_config_path):
        raise ValueError(f"Directive configuration file not found: "
                         f"{input_dct_config_path}")
    
    with open(input_dct_config_path, "r") as f:
        dct_config = json.load(f)

    dct_dict = dct_config.get("directives")
    if dct_dict is None:
        raise ValueError(f"Directive configuration file does not contain "
                         f"directives: {input_dct_config_path}")
    
    region_nodes = kernel_info.nodes.get("region", [])
    array_nodes = kernel_info.nodes.get("array", [])

    mean_loop_lat, loop_lat_std = _get_loop_latency_stats(region_nodes)
    mean_array_size, array_size_std = _get_array_size_stats(array_nodes)

    loop_lat_threshold = mean_loop_lat + loop_lat_std
    array_size_threshold = mean_array_size + array_size_std

    ap_top_level_ports = []
    ap_large_arrays = []
    pipeline_high_lat = []
    unroll_high_lat = []

    for gp_name, gp in dct_dict.items():
        possible_dcts = gp.get("possible_directives")
        if possible_dcts is None or len(possible_dcts) <= 1:
            continue

        dct_type = gp.get("directive_type", "unknown")
        if dct_type not in CRITICAL_DIRECTIVES:
            continue

        function = gp.get("function")

        if dct_type == "array_partition":
            target = gp.get("variable")
            node = find_array_node(kernel_info, target, function)
            if node is None:
                continue

            if node.is_top_level_port:
                insert_array_dct(ap_top_level_ports, gp_name, gp, node)
            elif node.total_size >= array_size_threshold:
                insert_array_dct(ap_large_arrays, gp_name, gp, node)
        else:
            target = gp.get("label")
            node = find_region_node(kernel_info, target, function)
            if (node is None 
                or node.attrs.get("max_lat", 0) < loop_lat_threshold):
                continue

            if dct_type == "unroll":
                insert_loop_dct(unroll_high_lat, gp_name, gp, node)
            else:
                insert_loop_dct(pipeline_high_lat, gp_name, gp, node)

    # Include all array partition directives on top-level ports 
    # and the largest array partition directive
    selected_dct_groups = ap_top_level_ports
    if ap_large_arrays:
        selected_dct_groups.append(ap_large_arrays[0])

    # Include the `num_pipelines` pipeline directives with the highest latencies
    # and the `num_unrolls` unroll directives with the highest latencies
    selected_dct_groups += pipeline_high_lat[:min(num_pipelines, len(pipeline_high_lat))]
    selected_dct_groups += unroll_high_lat[:min(num_unrolls, len(unroll_high_lat))]
    
    filtered_dct_dict = {
        group_name: group
        for group_name, group, _ in selected_dct_groups
    }
        
    with open(filtered_dct_config_path, "w") as f:
        dct_config["directives"] = filtered_dct_dict
        json.dump(dct_config, f, indent=2)
        

def _get_loop_latency_stats(region_nodes: List[RegionNode]):
    loop_lats = [
        node.attrs.get("max_lat", 0)
        for node in region_nodes if node.is_loop 
    ]
    if not loop_lats:
        return 0, 0
    return np.mean(loop_lats), np.std(loop_lats)


def _get_array_size_stats(array_nodes: List[ArrayNode]):
    array_sizes = [node.total_size for node in array_nodes]
    if not array_sizes:
        return 0, 0
    return np.mean(array_sizes), np.std(array_sizes)


def _has_variable_bounds(region_node: RegionNode) -> bool:
    """Check if the region node has variable bounds."""
    min_tc = region_node.attrs.get("min_tc", 0)
    max_tc = region_node.attrs.get("max_tc", 0)
    return min_tc != max_tc


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Filter directive groups.")
    parser.add_argument("-i", "--input_dct_config", type=str, required=True, help="Path to input directive configuration file.")
    parser.add_argument("-o", "--filtered_dct_config", type=str, required=True, help="Path to output filtered directive configuration file.")
    parser.add_argument("-k", "--kernel_info_path", type=str, required=True, help="Path to kernel info JSON file.")
    parser.add_argument("-p", "--num_pipelines", type=int, default=2, help="Number of pipeline directives to include.")
    parser.add_argument("-u", "--num_unrolls", type=int, default=1, help="Number of unroll directives to include.")

    args = parser.parse_args()

    with open(args.kernel_info_path, "r") as f:
        kernel_info = VitisKernelInfo.from_json(f)

    filter_directive_groups(
        args.input_dct_config,
        args.filtered_dct_config,
        kernel_info,
        args.num_pipelines,
        args.num_unrolls
    )