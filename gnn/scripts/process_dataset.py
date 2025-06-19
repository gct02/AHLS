import subprocess
import argparse
import json
from pathlib import Path
from typing import Dict, List

from gnn.data.graph import (
    CDFG,
    generate_base_design_graph,
    generate_optimized_design_graph
)
from gnn.data.utils.parsers import (
    extract_metrics,
    export_directives_as_tcl
)
from gnn.data.utils.transforms import process_ir


def generate_base_design_graphs(
    dataset_dir: Path, 
    benchmarks: List[str], 
    top_level: Dict[str, str],
    output_dir: Path
) -> Dict[str, CDFG]:
    base_graphs = {}
    for benchmark in benchmarks:
        if not (dataset_dir / benchmark).is_dir():
            print(f"Benchmark {benchmark} not found in dataset")
            continue

        benchmark_dir = dataset_dir / benchmark
        base_solution_dir = benchmark_dir / "solution0"
        if not base_solution_dir.is_dir():
            print(f"Base solution not found for {benchmark}")
            continue

        ir_dir = base_solution_dir / ".autopilot/db"
        ir_path = ir_dir / "a.g.ld.0.bc"
        if not ir_path.exists():
            print(f"Intermediate representation not found for base solution on {benchmark}")
            continue

        if benchmark not in top_level:
            print(f"Top-level function not found for {benchmark}")
            continue
        top_level_function = top_level[benchmark]

        metrics = extract_metrics(base_solution_dir, filtered=False)
        if metrics is None:
            print(f"Metrics not found for base solution on {benchmark}")
            continue

        benchmark_out_dir = output_dir / benchmark
        benchmark_out_dir.mkdir(parents=True, exist_ok=True)
        with open(benchmark_out_dir / "base_metrics.json", "w") as f:
            json.dump(metrics, f, indent=2)

        ir_mod_path = ir_dir / ir_path.name.replace(".bc", ".mod.ll")
        md_path = ir_dir / "metadata.json"
        try:
            process_ir(ir_path, ir_mod_path, md_path, preserve_temp_files=True)
        except subprocess.CalledProcessError:
            print(f"Error processing {ir_path}")
            continue

        base_graph = generate_base_design_graph(
            ir_mod_path, md_path, top_level_function
        )
        base_graphs[benchmark] = base_graph

    return base_graphs


def main(args: Dict[str, str]):
    dataset_dir = Path(args['dataset_dir'])
    output_dir = Path(args['output_dir'])
    top_level_json_path = Path(args['top_level'])
    filtered = args['filtered']
    benchmarks = args['benchmarks']
    max_instances = args['max_instances']

    if not dataset_dir.is_dir():
        raise ValueError(f"Dataset directory {dataset_dir} "
                         f"does not exist or is not a directory")
    
    if not top_level_json_path.exists():
        raise ValueError(f"Top-level JSON file {top_level_json_path} "
                         f"does not exist")
    
    if max_instances <= 0:
        raise ValueError("Maximum instances must be a positive integer")
    
    if not output_dir.is_dir():
        output_dir.mkdir(parents=True, exist_ok=True)

    with open(top_level_json_path, 'r') as f:
        top_level = json.load(f)

    if benchmarks is None:
        benchmarks = [
            benchmark_dir.stem 
            for benchmark_dir in dataset_dir.iterdir() 
            if benchmark_dir.is_dir()
        ]
    base_graphs = generate_base_design_graphs(
        dataset_dir, benchmarks, top_level, output_dir
    )

    for benchmark, base_graph in base_graphs.items():
        benchmark_dir = dataset_dir / benchmark
        if not benchmark_dir.is_dir():
            print(f"Benchmark {benchmark} not found in dataset")
            continue

        benchmark_out_dir = output_dir / benchmark
        benchmark_out_dir.mkdir(parents=True, exist_ok=True)

        instance_count = 0
        for solution_dir in benchmark_dir.iterdir():
            if (not solution_dir.is_dir() or 
                not solution_dir.stem.startswith("solution")):
                continue

            solution_name = solution_dir.stem
            hls_data_json_path = solution_dir / f"{solution_name}_data.json"
            if not hls_data_json_path.exists():
                print(f"Directives JSON file not found "
                      f"for base solution on {benchmark}")
                continue

            dct_tcl_path = solution_dir / f"directives.tcl"
            if not dct_tcl_path.exists():
                export_directives_as_tcl(hls_data_json_path, dct_tcl_path)

            solution_out_dir = benchmark_out_dir / solution_name
            solution_out_dir.mkdir(parents=True, exist_ok=True)

            metrics = extract_metrics(
                solution_dir, 
                filtered=filtered and solution_name != "solution0"
            )
            with open(solution_out_dir / "metrics.json", "w") as f:
                json.dump(metrics, f, indent=2)

            graph = generate_optimized_design_graph(base_graph, dct_tcl_path)
            graph.to_json(solution_out_dir / "graph.json")

            instance_count += 1
            if instance_count >= max_instances:
                break


def parse_args():
    parser = argparse.ArgumentParser(
        description="Process a dataset of HLS solutions to extract metrics and build graphs."
    )
    parser.add_argument("-d", "--dataset-dir", required=True,
                        help="Path to the source dataset directory containing HLS solutions")
    parser.add_argument("-o", "--output-dir", required=True,
                        help="Path to the output directory")
    parser.add_argument("-tl", "--top-level", required=True,
                        help="Path to the JSON file containing the name of the top-level function for each benchmark")
    parser.add_argument("-f", "--filtered", action="store_true",
                        help="Signal that the dataset is filtered")
    parser.add_argument("-b", "--benchmarks", nargs="+", default=None,
                        help="List of benchmarks to process")
    parser.add_argument("-mi", "--max-instances", type=int, default=9999,
                        help="Maximum number of instances to consider for each benchmark (default: 9999)")
    return vars(parser.parse_args())


if __name__ == "__main__":
    args = parse_args()
    main(args)

