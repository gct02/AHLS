import argparse
import json
import pickle
from pathlib import Path
from typing import Dict, Union

import torch

from gnn.data.graph import (
    extract_base_kernel_info, 
    build_hls_graph_data
)
from gnn.data.utils.parsers import extract_metrics


def create_directives_tcl(
    hls_data_json_path: Union[str, Path],
    output_path: Union[str, Path]
):
    with open(hls_data_json_path, "r") as f:
        data = json.load(f)
    directives = data["HlsSolution"]["DirectiveTcl"]
    with open(output_path, "w") as f:
        directives = "\n".join(directives)
        f.write(directives)


def main(args: Dict[str, str]):
    dataset_dir = Path(args['dataset_dir'])
    output_dir = Path(args['output_dir'])
    filtered = args['filtered']
    top_fn_path = args['top_fn_path']
    debug = args.get('debug', False)

    if not dataset_dir.exists():
        raise FileNotFoundError(f"Dataset directory not found: {dataset_dir}")
    
    if not dataset_dir.is_dir():
        raise NotADirectoryError(f"Dataset path is not a directory: {dataset_dir}")
    
    if not Path(top_fn_path).exists():
        raise FileNotFoundError(f"Top level function config file not found: {top_fn_path}")

    if not output_dir.exists():
        output_dir.mkdir(parents=True, exist_ok=True)

    with open(top_fn_path, "r") as f:
        top_fn_dict = json.load(f)

    bench_info_list, benches = [], []
    for bench in dataset_dir.iterdir():
        if not bench.is_dir():
            continue

        top_fn = top_fn_dict.get(bench.name)
        if not top_fn:
            print(f"Top-level function not found for {bench.name}")
            continue

        base_sol_dir = dataset_dir / bench / "solution0"
        if not base_sol_dir.exists():
            print(f"Base solution directory not found for {bench}")
            continue

        bench_info_list.append((base_sol_dir, bench.name, top_fn))
        benches.append(bench)

    kernel_info_dict = extract_base_kernel_info(bench_info_list)

    for bench in benches:
        bench_out_dir = output_dir / bench.name
        bench_out_dir.mkdir(parents=True, exist_ok=True)

        kernel_info = kernel_info_dict.get(bench.name)
        if not kernel_info:
            print(f"Could not parse kernel info for {bench.name}")
            continue

        with open(bench_out_dir / "kernel_info.pkl", "wb") as f:
            pickle.dump(kernel_info, f)

        kernel_info.save_as_json(bench_out_dir / "kernel_info.json")

        base_metrics = kernel_info.metrics
        with open(bench_out_dir / "base_metrics.json", "w") as f:
            json.dump(base_metrics, f, indent=2)

        sol_count = 0
        for sol in bench.iterdir():
            if not sol.is_dir():
                continue

            hls_data_json_path = sol / f"{sol.stem}_data.json"
            if not hls_data_json_path.exists():
                print(f"Directives JSON file not found for {sol}")
                continue
            
            dct_tcl_path = sol / f"directives.tcl"
            create_directives_tcl(hls_data_json_path, dct_tcl_path)

            sol_out_dir = bench_out_dir / sol.stem
            sol_out_dir.mkdir(parents=True, exist_ok=True)

            metrics = extract_metrics(sol, filtered=filtered)
            with open(sol_out_dir / "metrics.json", "w") as f:
                json.dump(metrics, f, indent=2)

            data = build_hls_graph_data(kernel_info, dct_tcl_path)
            torch.save(data, sol_out_dir / "graph.pt")

            if sol.stem == "solution0":
                torch.save(data, bench_out_dir / "base_graph.pt")

            if debug:
                sol_count += 1
                if sol_count >= 10:
                    break 


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
    parser.add_argument("-tf", "--top-fn-path", default=None,
                        help="Path to the file containing top-level function configurations")
    parser.add_argument("-dbg", "--debug", action="store_true",
                        help="Enable debug mode")
    return vars(parser.parse_args())


if __name__ == "__main__":
    args = parse_args()
    main(args)

