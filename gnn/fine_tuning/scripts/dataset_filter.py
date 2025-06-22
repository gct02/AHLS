import os
import json
import shutil
from typing import List, Tuple

import numpy as np

from gnn.data.kernel.kernel_info import KernelInfo
from gnn.data.utils.parsers import parse_tcl_directives

DIRECTIVES = {
    "pipeline", "unroll", "array_partition", 
    "loop_merge", "loop_flatten"
}


def extract_critical_dct_groups(
    dct_config_path: str, 
    kernel_info: KernelInfo
) -> List[Tuple[str, str]]:
    if not os.path.exists(dct_config_path):
        raise ValueError(f"Directive configuration file not found: "
                         f"{dct_config_path}")
    
    with open(dct_config_path, "r") as f:
        dct_config = json.load(f)

    dct_dict = dct_config.get("directives")
    if dct_dict is None:
        raise ValueError(f"Directive configuration file does not contain "
                         f"directives: {dct_config_path}")
    
    kernel_regions = {}
    for module in kernel_info.modules:
        for region_name, region_info in module.regions.items():
            if f"{module.name}/{region_name}" not in kernel_regions:
                kernel_regions[f"{module.name}/{region_name}"] = region_info

    loop_lats = [
        region_info.get("latency", 0) 
        for region_info in kernel_regions.values()
    ]
    mean_loop_lat = np.mean(loop_lats) if loop_lats else 0

    filtered_dct_groups = []
    for group in dct_dict.values():
        dct_type = group["directive_type"]
        if dct_type not in DIRECTIVES:
            continue

        label = group.get("label", "")
        variable = group.get("variable", "")

        if dct_type == "loop_merge":
            filtered_dct_groups.append((dct_type, label))
        elif dct_type == "array_partition":
            filtered_dct_groups.append((dct_type, variable))
        else:
            function = group.get("function", "")
            location = f"{function}/{label}" if function else label
            region_info = kernel_regions.get(location, None)
            if region_info is None:
                continue
            if region_info.get('latency', 0) > mean_loop_lat:
                filtered_dct_groups.append((dct_type, label))

    return filtered_dct_groups


def filter_solutions(
    benchmark_dir: str,
    dct_config_path: str,
    output_dir: str,
    num_solutions: int = 30
):
    if not os.path.exists(benchmark_dir):
        raise ValueError(f"Benchmark directory not found: {benchmark_dir}")

    if not os.path.exists(dct_config_path):
        raise ValueError(f"Directive configuration file not found: {dct_config_path}")
    
    benchmark_name = os.path.basename(benchmark_dir)
    solution0_dir = os.path.join(benchmark_dir, "solution0")
    if not os.path.exists(solution0_dir):
        raise ValueError(f"Solution0 directory not found in benchmark: {benchmark_name}")
    
    kernel_info = KernelInfo(solution0_dir, benchmark_name) 

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
    parser.add_argument("-o", "--output_dir", type=str, required=True, 
                        help="Directory to save filtered solutions.")
    parser.add_argument("-n", "--num_solutions", type=int, default=30, 
                        help="Number of solutions to keep.")
    args = parser.parse_args()
        
    filter_solutions(
        args.benchmark_dir,
        args.dct_config_path,
        args.output_dir,
        args.num_solutions
    )