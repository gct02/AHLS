import argparse
import json
from pathlib import Path
from typing import Dict, Union

import torch


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

    base_solutions = {
        benchmark.name: dataset_dir / benchmark / "solution0"
        for benchmark in dataset_dir.iterdir() if benchmark.is_dir()
    }
    base_graphs = build_base_graphs(base_solutions, filtered=False)

    for benchmark in dataset_dir.iterdir():
        if not benchmark.is_dir():
            print(f"Skipping {benchmark} (not a directory)")
            continue

        benchmark_out = output_dir / benchmark.name
        benchmark_out.mkdir(parents=True, exist_ok=True)

        base_metrics = base_graphs[benchmark.name].metrics
        with open(benchmark_out / "base_metrics.json", "w") as f:
            json.dump(base_metrics, f, indent=2)

        for solution in benchmark.iterdir():
            if not solution.is_dir():
                continue

            hls_data_json = solution / f"{solution.stem}_data.json"
            if not hls_data_json.exists():
                print(f"Directives JSON file not found for {solution}")
                continue
            
            tcl_path = solution / f"directives.tcl"
            create_directives_tcl(hls_data_json, tcl_path)

            solution_out = benchmark_out / solution.stem
            solution_out.mkdir(parents=True, exist_ok=True)

            metrics = extract_metrics(solution, filtered=filtered)
            with open(solution_out / "metrics.json", "w") as f:
                json.dump(metrics, f, indent=2)

            data = build_opt_graph(base_graphs[benchmark.name], tcl_path)
            torch.save(data, solution_out / "graph.pt")


def parse_args():
    parser = argparse.ArgumentParser(
        description="Process the dataset, creating graphs and metrics to be used for training ML models."
    )
    parser.add_argument("-d", "--dataset-dir", required=True,
                        help="Path to the dataset directory")
    parser.add_argument("-o", "--output-dir", required=True,
                        help="Path to the output directory")
    parser.add_argument("-f", "--filtered", action="store_true",
                        help="Signal that the dataset is filtered")
    parser.add_argument("-b", "--benchmarks", nargs="+", default=None,
                        help="List of benchmarks to process")
    return vars(parser.parse_args())


if __name__ == "__main__":
    import sys

    if __package__ is None:                  
        DIR = Path(__file__).resolve().parent
        sys.path.insert(0, str(DIR.parent))
        sys.path.insert(0, str(DIR.parent.parent))
        __package__ = DIR.name

    from gnn.graph import build_base_graphs, build_opt_graph
    from utils.parsers import extract_metrics
    
    args = parse_args()
    main(args)

