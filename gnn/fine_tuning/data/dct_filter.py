import os
import json
import copy
from typing import List, Dict, Union

import numpy as np

from gnn.data.graph import (
    find_array_node,
    find_region_node
)
from gnn.data.kernel.kernel_info import (
    VitisKernelInfo,
    RegionNode
)
from gnn.data.utils.parsers import parse_directive_cmd


DirectiveGroup = Dict[str, Union[str, List[str]]]


# Including only directives whose features in the GNN were 
# recurrently pointed as important by Shapley values
DIRECTIVES = {"pipeline", "unroll", "array_partition", "loop_merge"}


def filter_directives(
    input_dct_config_path: str, 
    filtered_dct_config_path: str,
    kernel_info: VitisKernelInfo
):
    if not os.path.exists(input_dct_config_path):
        raise ValueError(f"Directive configuration file not found: "
                         f"{input_dct_config_path}")
    
    with open(input_dct_config_path, "r") as f:
        dct_config = json.load(f)

    dct_dict = dct_config.get("directives")
    if dct_dict is None:
        raise ValueError(f"Directive configuration file does not contain "
                         f"directives: {input_dct_config_path}")
    
    loop_nodes = [
        node for node in kernel_info.nodes.get("region", []) 
        if node.is_loop
    ]
    mean_loop_lat, loop_lat_std = _get_loop_latency_stats(loop_nodes)
    loop_lat_threshold = mean_loop_lat - loop_lat_std

    filtered_dct_dict = {}

    for group_name, group in dct_dict.items():
        dct_type = group["directive_type"]
        if dct_type not in DIRECTIVES:
            continue

        if dct_type == "loop_merge":
            filtered_dct_dict[group_name] = group
            continue

        if dct_type == "array_partition":
            node = find_array_node(
                kernel_info, group["variable"], group["function"]
            )
            if node is None:
                continue

            dcts = group.get("possible_directives", [])
            max_factor = 0
            for dct in dcts:
                if dct == "":
                    continue

                _, options = parse_directive_cmd(dct)
                factor = int(options.get("factor", 0))
                if factor > max_factor:
                    max_factor = factor
            
            filtered_dcts = []
            for dct in dcts:
                if dct == "":
                    filtered_dcts.append(dct)
                    continue
                
                _, options = parse_directive_cmd(dct)
                factor = int(options.get("factor", 0))
                if factor == 0 or factor == max_factor:
                    filtered_dcts.append(dct)

            filtered_group = copy.deepcopy(group)
            filtered_group["possible_directives"] = filtered_dcts
            filtered_dct_dict[group_name] = filtered_group
        else:
            node = find_region_node(kernel_info, group["label"], group["function"])
            if node is None:
                continue

            loop_lat = node.attrs.get("max_lat", 0)
            if loop_lat > 0 and loop_lat < loop_lat_threshold:
                continue

            if dct_type == "pipeline":
                filtered_dct_dict[group_name] = group
                continue

            dcts = group.get("possible_directives", [])
            max_factor = 0
            empty_idx, complete_idx, max_factor_idx = -1, -1, -1
            for i, dct in enumerate(dcts):
                if dct == "":
                    empty_idx = i
                    continue

                _, options = parse_directive_cmd(dct)
                factor = int(options.get("factor", 0))
                if factor == 0:
                    complete_idx = i
                elif factor > max_factor:
                    max_factor = factor
                    max_factor_idx = i

            filtered_dcts = [dcts[empty_idx] if empty_idx >= 0 else ""]
            if complete_idx >= 0:
                filtered_dcts.append(dcts[complete_idx])
            if max_factor > 0 and max_factor_idx >= 0:
                filtered_dcts.append(dcts[max_factor_idx])

            filtered_group = copy.deepcopy(group)
            filtered_group["possible_directives"] = filtered_dcts
            filtered_dct_dict[group_name] = filtered_group

    filtered_dct_config = {}
    filtered_dct_config["directives"] = filtered_dct_dict
    if "nested_loops" in dct_config:
        filtered_dct_config["nested_loops"] = dct_config["nested_loops"]
    
    with open(filtered_dct_config_path, "w") as f:
        json.dump(filtered_dct_config, f, indent=2)


def _get_loop_latency_stats(loop_nodes: List[RegionNode]):
    loop_lats = [node.attrs.get("max_lat", 0) for node in loop_nodes]
    if not loop_lats:
        return 0, 0
    return np.mean(loop_lats), np.std(loop_lats)
