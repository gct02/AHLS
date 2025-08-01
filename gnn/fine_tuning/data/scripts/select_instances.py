import os
import json
import shutil
import sys
import pickle
import random
import math
from typing import Dict

import numpy as np

from gnn.data.graph import find_region_node, find_array_node
from gnn.data.graph import VitisKernelInfo
from gnn.data.utils.parsers import parse_tcl_directives

DIRECTIVES = {"pipeline", "unroll", "array_partition", "loop_merge"}


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
        node for node in kernel_info.nodes.get("region", []) if node.is_loop
    ]
    array_ports = [
        node for node in kernel_info.nodes.get("port", []) if node.is_array
    ]

    loop_lats = [node.attrs.get("max_latency", 0) for node in loop_nodes]
    mean_loop_lat = np.mean(loop_lats) if loop_lats else 0
    
    array_sizes = [node.total_size for node in array_ports]
    mean_array_size = np.mean(array_sizes) if array_sizes else 0

    filtered_dct_groups = []

    for group in dct_dict.values():
        dct_type = group["directive_type"]
        if dct_type not in DIRECTIVES:
            continue
        label = group.get("label", "")
        function = group.get("function", "")
        variable = group.get("variable", "")

        if dct_type == "array_partition":
            node, nt = find_array_node(kernel_info, variable, function, ret_node_type=True)
            if node is not None and nt == "port" and node.total_size >= mean_array_size:
                filtered_dct_groups.append((dct_type, variable))
        else:
            node = find_region_node(kernel_info, label, function)
            if node is not None and node.attrs.get("max_latency", 0) >= mean_loop_lat:
                filtered_dct_groups.append((dct_type, label))

    return filtered_dct_groups


def filter_solutions(
    benchmark_dir: str,
    dct_config_path: str,
    kernel_info: VitisKernelInfo,
    output_dir: str,
    num_solutions: int = 15
):
    if not os.path.exists(benchmark_dir):
        raise ValueError(f"Benchmark directory not found: {benchmark_dir}")

    if not os.path.exists(dct_config_path):
        raise ValueError(f"Directive configuration file not found: {dct_config_path}")
    
    if not os.path.exists(output_dir):
        os.makedirs(output_dir, exist_ok=True)

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
            os.makedirs(output_solution_path, exist_ok=True)

        # Copy the solution directory to the output directory
        shutil.copytree(solution_path, output_solution_path, dirs_exist_ok=True)
        print(f"Copied {solution} to {output_solution_path}")


def filter_processed_instances(
    benchmark_dir: str,
    processed_benchmark_dir: str,
    benchmark_info: Dict[str, str],
    dct_config_path: str,
    kernel_info: VitisKernelInfo,
    output_dir: str,
    num_solutions: int = 15
):
    if not os.path.exists(benchmark_dir):
        raise ValueError(f"Benchmark directory not found: {benchmark_dir}")

    if not os.path.exists(dct_config_path):
        raise ValueError(f"Directive configuration file not found: {dct_config_path}")
    
    if not os.path.exists(output_dir):
        os.makedirs(output_dir, exist_ok=True)

    last_base_index = benchmark_info.get("last_base_index", 0)
    if last_base_index <= 0:
        raise ValueError(f"Invalid last base index: {last_base_index}. "
                         f"Ensure that the benchmark info is correctly set.")

    filtered_dct_groups = extract_critical_dct_groups(dct_config_path, kernel_info)
    critical_dct_count = {}

    for solution in os.listdir(benchmark_dir):
        solution_path = os.path.join(benchmark_dir, solution)
        if not os.path.isdir(solution_path) or not solution.startswith("solution"):
            continue

        sol_idx = solution.split("solution")[-1]
        if not sol_idx.isdigit() or int(sol_idx) <= last_base_index:
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
        solution_path = os.path.join(processed_benchmark_dir, solution)
        if not os.path.exists(solution_path):
            continue

        output_solution_path = os.path.join(output_dir, solution)
        if not os.path.exists(output_solution_path):
            os.makedirs(output_solution_path)

        # Copy the solution directory to the output directory
        shutil.copytree(solution_path, output_solution_path, dirs_exist_ok=True)
        print(f"Copied {solution} to {output_solution_path}")


def random_filter(
    benchmark_dir: str,
    benchmark_info: Dict[str, str],
    output_dir: str,
    num_solutions: int = 15,
    base_only: bool = False,
    non_base_only: bool = False,
    include_solution0: bool = True,
    copy_files: bool = True
):
    if not os.path.exists(benchmark_dir):
        raise ValueError(f"Benchmark directory not found: {benchmark_dir}")

    if not os.path.exists(output_dir):
        os.makedirs(output_dir, exist_ok=True)

    if base_only or non_base_only:
        last_base_index = benchmark_info.get("last_base_index", 0)
        if last_base_index <= 0:
            raise ValueError(f"Invalid last base index: {last_base_index}. "
                             f"Ensure that the benchmark info is correctly set.")

    solutions = []
    for sol in os.listdir(benchmark_dir):
        if not sol.startswith("solution") or sol == "solution0":
            continue

        solution_path = os.path.join(benchmark_dir, sol)
        if not os.path.isdir(solution_path):
            continue

        sol_idx = int(sol.split("solution")[-1])
        if ((base_only and sol_idx > last_base_index) or
            (non_base_only and sol_idx <= last_base_index)):
            continue

        solutions.append(sol)

    if len(solutions) < num_solutions:
        print(f"Not enough solutions to filter. Found {len(solutions)}, "
              f"but requested {num_solutions}. Using all available solutions.")
        selected_solutions = solutions
    else:
        selected_solutions = random.sample(solutions, num_solutions)

    if include_solution0 and "solution0" not in selected_solutions:
        selected_solutions.append("solution0")

    for solution in selected_solutions:
        solution_path = os.path.join(benchmark_dir, solution)
        output_solution_path = os.path.join(output_dir, solution)
        shutil.copytree(solution_path, output_solution_path, dirs_exist_ok=True)
        print(f"Copied {solution} to {output_solution_path}")

    if copy_files:
        for item in os.listdir(benchmark_dir):
            item_path = os.path.join(benchmark_dir, item)
            if os.path.isfile(item_path):
                shutil.copy(item_path, output_dir)
                print(f"Copied file {item} to {output_dir}")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Filter GNN solutions based on directives.")
    
    parser.add_argument("-bd", "--benchmark_dir", type=str, default=None, 
                        help="Path to the benchmark directory containing solutions.")
    parser.add_argument("-pd", "--processed_benchmark_dir", type=str, default=None, 
                        help="Path to the processed benchmark directory containing solutions.")
    parser.add_argument("-b", "--benchmark", type=str, required=True,
                        help="Name of the benchmark to filter solutions for.")
    parser.add_argument("-d", "--dct_config_path", type=str, default=None, 
                        help="Path to the directive configuration file.")
    parser.add_argument("-k", "--kernel_info_path", type=str, default=None,
                        help="Path to the file containing the serialized kernel info.")
    parser.add_argument("-o", "--output_dir", type=str, required=True, 
                        help="Directory to save filtered solutions.")
    parser.add_argument("-n", "--num_solutions", type=int, default=15, 
                        help="Number of solutions to keep.")
    parser.add_argument("-r", "--random_filter", action='store_true',
                        help="If set, randomly filter solutions instead of using critical directives.")
    parser.add_argument("-bi", "--benchmark_info", type=str, default='data/benchmarks/benchmark_info.json',
                        help="Path to the benchmark info JSON file.")
    parser.add_argument("-s", "--seed", type=int, default=42,
                        help="Random seed for reproducibility.")

    args = parser.parse_args()

    if not args.processed_benchmark_dir:
        print("Processed benchmark directory must be provided.")
        sys.exit(1)

    if not args.benchmark_info:
        print("Benchmark info file must be provided.")
        sys.exit(1)

    with open(args.benchmark_info, "r") as f:
        benchmark_info = json.load(f)

    if args.benchmark not in benchmark_info:
        print(f"Benchmark {args.benchmark} not found in benchmark info.")
        sys.exit(1)

    os.makedirs(args.output_dir, exist_ok=True)
    benchmark_info = benchmark_info[args.benchmark]

    random.seed(args.seed)

    random_filter(
        args.processed_benchmark_dir,
        benchmark_info,
        args.output_dir,
        num_solutions=3,
        base_only=True,
        non_base_only=False,
        include_solution0=True,
        copy_files=True
    )
    random_filter(
        args.processed_benchmark_dir,
        benchmark_info,
        args.output_dir,
        num_solutions=3,
        base_only=False,
        non_base_only=True,
        include_solution0=False,
        copy_files=False
    )

    # if args.random_filter:
    #     random_filter(
    #         args.benchmark_dir,
    #         benchmark_info,
    #         args.output_dir,
    #         args.num_solutions
    #     )
    #     sys.exit(0)

    # if not args.benchmark_dir:
    #     print("Benchmark directory must be provided.")
    #     sys.exit(1)

    # if not args.dct_config_path:
    #     print("Directive configuration file must be provided.")
    #     sys.exit(1)

    # if not args.kernel_info_path:
    #     print("Kernel info file must be provided.")
    #     sys.exit(1)

    # with open(args.kernel_info_path, "rb") as f:
    #     kernel_info = pickle.load(f)

    # num_solutions = args.num_solutions
    # # num_solutions_random = max(1, math.ceil(num_solutions * 0.75))
    # # num_solutions_critical = max(1, num_solutions - num_solutions_random)
    # num_solutions_critical = 3
    # num_solutions_random = num_solutions - num_solutions_critical

    # filter_processed_instances(
    #     args.benchmark_dir,
    #     args.processed_benchmark_dir,
    #     benchmark_info,
    #     args.dct_config_path,
    #     kernel_info,
    #     args.output_dir,
    #     num_solutions_critical
    # )
    # random_filter(
    #     args.processed_benchmark_dir,
    #     benchmark_info,
    #     args.output_dir,
    #     num_solutions_random
    # )