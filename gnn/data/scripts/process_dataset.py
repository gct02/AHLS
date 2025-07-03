import argparse
import json
import pickle
from pathlib import Path
from typing import Dict, Any

from gnn.data.graph import (
    extract_base_kernel_info, 
    update_with_directives
)
from gnn.data.utils.parsers import (
    extract_metrics,
    export_directives_as_tcl
)


def main(args: Dict[str, Any]):
    dataset_dir = Path(args['dataset_dir'])
    output_dir = Path(args['output_dir'])
    top_level_path = Path(args['top_level_path'])
    filtered = args['filtered']
    max_instances = args.get('max_instances', 10000)
    base_solutions_dir = Path(args.get('base_solutions_dir', 'data/base_solutions'))

    if not dataset_dir.exists() or not dataset_dir.is_dir():
        raise FileNotFoundError(f"Dataset directory not found: {dataset_dir}")
    
    if not base_solutions_dir.exists() or not base_solutions_dir.is_dir():
        raise FileNotFoundError(f"Base solutions directory not found: {base_solutions_dir}")
    
    if not top_level_path.exists() or not top_level_path.is_file():
        raise FileNotFoundError(f"Top level function config file not found: {top_level_path}")

    if not output_dir.exists():
        output_dir.mkdir(parents=True, exist_ok=True)

    with open(top_level_path, "r") as f:
        top_level_fn_dict = json.load(f)

    bench_info_list = []
    bench_directories = []
    for bench in base_solutions_dir.iterdir():
        if not bench.is_dir():
            continue

        top_level_fn = top_level_fn_dict.get(bench.name)
        if not top_level_fn:
            print(f"Top-level function not found for {bench.name}")
            continue

        base_sol_dir = base_solutions_dir / bench.name / "solution0"
        if not base_sol_dir.exists():
            print(f"Base solution directory not found for {bench.name}")
            continue

        bench_dir = dataset_dir / bench.name
        if not bench_dir.exists():
            print(f"Benchmark directory not found for {bench.name}")
            continue

        bench_info_list.append((base_sol_dir, bench.name, top_level_fn))
        bench_directories.append(bench_dir)

    kernel_info_dict = extract_base_kernel_info(bench_info_list)

    for bench_dir in bench_directories:
        bench_name = bench_dir.name
        bench_out_dir = output_dir / bench_name
        bench_out_dir.mkdir(parents=True, exist_ok=True)

        kernel_info = kernel_info_dict.get(bench_name)
        if not kernel_info:
            print(f"Could not parse kernel info for {bench_name}")
            continue

        kernel_info.save_as_json(bench_out_dir / "base_vitis_kernel_info.json")

        with open(bench_out_dir / "base_vitis_kernel_info.pkl", "wb") as f:
            pickle.dump(kernel_info, f)

        base_metrics = kernel_info.qor_metrics
        with open(bench_out_dir / "base_metrics.json", "w") as f:
            json.dump(base_metrics, f, indent=2)

        base_dct_tcl_path = base_solutions_dir / f"{bench_name}/solution0/directives.tcl"
        if not base_dct_tcl_path.exists():
            hls_data_json_path = base_solutions_dir / f"{bench_name}/solution0/solution0_data.json"
            if not hls_data_json_path.exists():
                print(f"Directives JSON file not found for base solution of {bench_name}")
                continue
            export_directives_as_tcl(hls_data_json_path, base_dct_tcl_path)

        base_log_path = base_solutions_dir / f"{bench_name}/solution0/solution0.log"
        if not base_log_path.exists():
            print(f"Solution log file not found for base solution of {bench_name}")
            continue

        solution_out_dir = bench_out_dir / "solution0"
        solution_out_dir.mkdir(parents=True, exist_ok=True)

        updated_kernel_info = update_with_directives(
            kernel_info, base_dct_tcl_path, base_log_path
        )
        with open(solution_out_dir / "vitis_kernel_info.pkl", "wb") as f:
            pickle.dump(updated_kernel_info, f)

        with open(solution_out_dir / "metrics.json", "w") as f:
            json.dump(base_metrics, f, indent=2)

        instance_count = 0
        for sol in bench_dir.iterdir():
            if (not sol.is_dir() 
                or not sol.name.startswith("solution")
                or sol.name == "solution0"):
                continue

            hls_data_json_path = sol / f"{sol.stem}_data.json"
            if not hls_data_json_path.exists():
                print(f"Directives JSON file not found for {sol}")
                continue

            hls_log_path = sol / f"{sol.stem}.log"
            if not hls_log_path.exists():
                print(f"Solution log file not found for {sol}")
                continue
            
            dct_tcl_path = sol / f"directives.tcl"
            if not dct_tcl_path.exists():
                export_directives_as_tcl(hls_data_json_path, dct_tcl_path)

            sol_out_dir = bench_out_dir / sol.stem
            sol_out_dir.mkdir(parents=True, exist_ok=True)

            metrics = extract_metrics(
                sol, filtered=filtered and sol.stem != "solution0"
            )
            with open(sol_out_dir / "metrics.json", "w") as f:
                json.dump(metrics, f, indent=2)

            updated_kernel_info = update_with_directives(
                kernel_info, dct_tcl_path, hls_log_path
            )
            with open(sol_out_dir / "vitis_kernel_info.pkl", "wb") as f:
                pickle.dump(updated_kernel_info, f)

            instance_count += 1
            if instance_count >= max_instances:
                break

        print(f"Processed {bench_dir.name}: {instance_count} instances")

def parse_args():
    parser = argparse.ArgumentParser(
        description="Process dataset to extract metrics and build graphs"
    )
    parser.add_argument("-d", "--dataset-dir", required=True,
                        help="Path to the dataset directory")
    parser.add_argument("-o", "--output-dir", required=True,
                        help="Path to the output directory")
    parser.add_argument("-f", "--filtered", action="store_true",
                        help="Signal that the dataset is filtered")
    parser.add_argument("-tl", "--top-level-path", required=True,
                        help="Path to the file containing top-level function configurations")
    parser.add_argument("-bs", "--base-solutions-dir", required=False, default='data/base_solutions',
                        help="Path to the directory containing the base solutions for the benchmarks")
    parser.add_argument("-b", "--benchmarks", nargs="+", default=None,
                        help="List of benchmarks to process")
    parser.add_argument("-mi", "--max-instances", type=int, default=10000,
                        help="Maximum number of instances to process per benchmark")
    return vars(parser.parse_args())


if __name__ == "__main__":
    args = parse_args()
    main(args)

