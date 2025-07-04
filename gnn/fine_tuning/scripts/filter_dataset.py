import os
import json
import shutil
import sys
import pickle

import numpy as np

from gnn.data.graph import find_region_node
from gnn.data.kernel.kernel_info import VitisKernelInfo
from gnn.data.utils.parsers import parse_tcl_directives

DIRECTIVES = {
    "pipeline", "unroll", "array_partition", 
    "loop_merge", "loop_flatten"
}


def extract_critical_dct_groups(
    dct_config_path: str,
    kernel_info: VitisKernelInfo
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
    
    loop_nodes = [
        node for node in kernel_info.nodes.get("region", []) 
        if node.is_loop
    ]

    loop_lats = [node.attrs.get("max_lat", 0) for node in loop_nodes]
    if not loop_lats:
        mean_loop_lat = 0
    else:
        mean_loop_lat = np.mean(loop_lats)

    filtered_dct_groups = []

    for group in dct_dict.values():
        dct_type = group["directive_type"]

        if dct_type not in DIRECTIVES:
            continue

        label = group.get("label", "")
        function = group.get("function", "")
        variable = group.get("variable", "")

        if dct_type == "loop_merge":
            filtered_dct_groups.append((dct_type, label))
        elif dct_type == "array_partition":
            filtered_dct_groups.append((dct_type, variable))
        else:
            node = find_region_node(kernel_info, label, function)
            if node is not None:
                lat = node.attrs.get("max_lat", 0)
                if lat > mean_loop_lat:
                    filtered_dct_groups.append((dct_type, label))

    return filtered_dct_groups


def filter_solutions(
    benchmark_dir: str,
    dct_config_path: str,
    kernel_info: VitisKernelInfo,
    output_dir: str,
    num_solutions: int = 30
):
    if not os.path.exists(benchmark_dir):
        raise ValueError(f"Benchmark directory not found: {benchmark_dir}")

    if not os.path.exists(dct_config_path):
        raise ValueError(f"Directive configuration file not found: {dct_config_path}")
    
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    filtered_dct_groups = extract_critical_dct_groups(dct_config_path, kernel_info)
    critical_dct_count = {}

    for solution in os.listdir(benchmark_dir):
        solution_path = os.path.join(benchmark_dir, solution)
        if not os.path.isdir(solution_path) or not solution.startswith("solution"):
            continue

        dct_file = os.path.join(solution_path, "directives.tcl")
        if not os.path.exists(dct_file):
            continue

        dcts = parse_tcl_directives(dct_file)
        critical_dcts = 0

        for dct_type, dct in dcts:
            if dct_type == 'array_partition' and 'variable' in dct:
                target = dct['variable']
            else:
                target = dct.get('label', '')
                if '/' in target:
                    target = target.split('/')[1]

            if (dct_type, target) in filtered_dct_groups:
                critical_dcts += 1

        critical_dct_count[solution] = critical_dcts

    # Sort solutions by the number of critical directives
    sorted_solutions = sorted(
        critical_dct_count.items(), 
        key=lambda item: item[1], 
        reverse=True
    )
    selected_solutions = sorted_solutions[:num_solutions]

    for solution, _ in selected_solutions:
        solution_path = os.path.join(benchmark_dir, solution)
        if not os.path.exists(solution_path):
            continue

        output_solution_path = os.path.join(output_dir, solution)
        if not os.path.exists(output_solution_path):
            os.makedirs(output_solution_path)

        # Copy the solution directory to the output directory
        shutil.copytree(solution_path, output_solution_path, dirs_exist_ok=True)
        print(f"Copied {solution} to {output_solution_path}")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Filter GNN solutions based on directives.")
    parser.add_argument("-b", "--benchmark_dir", type=str, required=True, 
                        help="Path to the benchmark directory containing solutions.")
    parser.add_argument("-d", "--dct_config_path", type=str, required=True, 
                        help="Path to the directive configuration file.")
    parser.add_argument("-k", "--kernel_info_path", type=str, required=True, 
                        help="Path to the file containing the serialized kernel info.")
    parser.add_argument("-o", "--output_dir", type=str, required=True, 
                        help="Directory to save filtered solutions.")
    parser.add_argument("-n", "--num_solutions", type=int, default=30, 
                        help="Number of solutions to keep.")

    args = parser.parse_args()

    if not os.path.exists(args.benchmark_dir):
        print(f"Benchmark directory {args.benchmark_dir} does not exist.")
        sys.exit(1)

    if not os.path.exists(args.dct_config_path):
        print(f"Directive configuration file {args.dct_config_path} does not exist.")
        sys.exit(1)

    if not os.path.exists(args.kernel_info_path):
        print(f"Kernel info file {args.kernel_info_path} does not exist.")
        sys.exit(1)

    if not os.path.exists(args.output_dir):
        os.makedirs(args.output_dir)

    with open(args.kernel_info_path, "rb") as f:
        kernel_info = pickle.load(f)
        
    filter_solutions(
        args.benchmark_dir,
        args.dct_config_path,
        kernel_info,
        args.output_dir,
        args.num_solutions
    )