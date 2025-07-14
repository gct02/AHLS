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
    bench_info_path = Path(args['benchmark_info_path'])
    filtered = args['filtered']
    max_instances = args.get('max_instances', 10000)

    if not dataset_dir.exists() or not dataset_dir.is_dir():
        raise FileNotFoundError(f"Dataset directory not found: {dataset_dir}")
    
    if not bench_info_path.exists() or not bench_info_path.is_file():
        raise FileNotFoundError(f"Benchmark info file not found: {bench_info_path}")

    if not output_dir.exists():
        output_dir.mkdir(parents=True, exist_ok=True)

    with open(bench_info_path, "r") as f:
        bench_info_dict = json.load(f)

    bench_info_list = []
    bench_directories = []
    for bench, bench_info in bench_info_dict.items():
        base_sol_dir = Path(bench_info['base_solution_dir'])
        if not base_sol_dir.exists():
            print(f"Base solution directory not found for {bench}")
            continue

        top_level_fn = bench_info.get('top_level')
        if not top_level_fn:
            print(f"Top-level function not specified for {bench}")
            continue

        bench_dir = dataset_dir / bench
        if not bench_dir.exists():
            print(f"Benchmark directory not found for {bench}")
            continue

        bench_info_list.append((base_sol_dir, bench, top_level_fn))
        bench_directories.append(bench_dir)

    kernel_info_dict = extract_base_kernel_info(bench_info_list)

    for bench_dir in bench_directories:
        bench_out_dir = output_dir / bench_dir.name
        bench_out_dir.mkdir(parents=True, exist_ok=True)

        kernel_info = kernel_info_dict.get(bench_dir.name)
        if not kernel_info:
            print(f"Could not parse kernel info for {bench_dir.name}")
            continue

        kernel_info.save_as_json(bench_out_dir / "base_vitis_kernel_info.json")
        with open(bench_out_dir / "base_vitis_kernel_info.pkl", "wb") as f:
            pickle.dump(kernel_info, f)

        base_metrics = kernel_info.qor_metrics
        with open(bench_out_dir / "base_metrics.json", "w") as f:
            json.dump(base_metrics, f, indent=2)

        instance_count = 0
        for sol in bench_dir.iterdir():
            if not sol.is_dir():
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
    parser.add_argument("-o", "--output-dir", required=False, 
                        default="gnn/dataset/full",
                        help="Path to the output directory")
    parser.add_argument("-b", "--benchmark-info-path", required=False, 
                        default="data/benchmarks/benchmark_info.json",
                        help="Path to the benchmark info JSON file")
    parser.add_argument("-f", "--filtered", action="store_true",
                        help="Signal that the dataset is filtered")
    parser.add_argument("-mi", "--max-instances", type=int, default=10000,
                        help="Maximum number of instances to process per benchmark")
    return vars(parser.parse_args())


if __name__ == "__main__":
    args = parse_args()
    main(args)

