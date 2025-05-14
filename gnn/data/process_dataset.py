import argparse
import json
import os
from pathlib import Path
from typing import Dict, Union

import torch

from gnn.data.graph import build_base_graphs, build_opt_graph
from gnn.data.utils.parsers import extract_metrics


def create_directives_tcl(
    hls_data_json: Union[str, Path],
    output_file_path: Union[str, Path]
):
    with open(hls_data_json, "r") as f:
        data = json.load(f)
    directives = data["HlsSolution"]["DirectiveTcl"]
    with open(output_file_path, "w") as f:
        directives = "\n".join(directives)
        f.write(directives)


def main(args: Dict[str, str]):
    dataset_dir = Path(args['dataset_dir'])
    output_dir = Path(args['output_dir'])
    filtered = args['filtered']
    kernel_config_path = args.get('kernel_config_path')
    directives_config_dir = args.get('directive_config_dir')
    debug = args.get('debug', False)

    with open(kernel_config_path, "r") as f:
        kernel_config = json.load(f)

    if not os.path.exists(directives_config_dir):
        print(f"Directives config directory not found: {directives_config_dir}")
        return

    base_solutions = []
    benchmarks = []
    for bench in dataset_dir.iterdir():
        if not bench.is_dir():
            continue

        bench_kernel_config = kernel_config.get(bench.name)
        if not bench_kernel_config:
            print(f"Configuration not found for {bench.name}")
            continue

        base_sol_dir = dataset_dir / bench / "solution0"
        if not base_sol_dir.exists():
            print(f"Base solution directory not found for {bench}")
            continue
        
        top_fn = bench_kernel_config["top_level"]
        base_solutions.append((base_sol_dir, bench.name, top_fn))
        benchmarks.append(bench)

    base_graphs = build_base_graphs(
        base_solutions, directives_config_dir, 
        filtered=False
    )

    max_instances = 10 if debug else 1e10
    for bench in benchmarks:
        benchmark_out = output_dir / bench.name
        benchmark_out.mkdir(parents=True, exist_ok=True)

        base_metrics = base_graphs[bench.name].metrics
        with open(benchmark_out / "base_metrics.json", "w") as f:
            json.dump(base_metrics, f, indent=2)

        count = 0
        for solution in bench.iterdir():
            if not solution.is_dir():
                continue

            hls_data_json = solution / f"{solution.stem}_data.json"
            if not hls_data_json.exists():
                print(f"Directives JSON file not found for {solution}")
                continue

            count += 1
            if count > max_instances:
                break 
            
            tcl_path = solution / f"directives.tcl"
            create_directives_tcl(hls_data_json, tcl_path)

            solution_out = benchmark_out / solution.stem
            solution_out.mkdir(parents=True, exist_ok=True)

            metrics = extract_metrics(solution, filtered=filtered)
            with open(solution_out / "metrics.json", "w") as f:
                json.dump(metrics, f, indent=2)

            data = build_opt_graph(base_graphs[bench.name], tcl_path)
            torch.save(data, solution_out / "graph.pt")


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
    parser.add_argument("-b", "--benchmarks", nargs="+", default=None,
                        help="List of benchmarks to process")
    parser.add_argument("-ck", "--kernel-config-path", default=None,
                        help="Path to the configuration file for kernel information")
    parser.add_argument("-cd", "--directive-config-dir", default=None,
                        help="Path to the directory containing the directives config files")
    parser.add_argument("-dbg", "--debug", action="store_true",
                        help="Enable debug mode")
    return vars(parser.parse_args())


if __name__ == "__main__":
    args = parse_args()
    main(args)

