import argparse
import json
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
    kernel_name = args['kernel_name']
    top_fn = args['top_fn']
    base_sol_dir = args.get('base_sol_dir')

    if not base_sol_dir:
        base_sol_dir = dataset_dir / "solution0"
    else:
        base_sol_dir = Path(base_sol_dir)

    if not base_sol_dir.exists():
        print(f"Base solution directory not found for {kernel_name}")
        return
        
    base_sol_info = (base_sol_dir, kernel_name, top_fn)
    kernel_info = extract_base_kernel_info([base_sol_info])[kernel_name]

    kernel_info.dump(dataset_dir / "kernel_info.json")

    base_metrics = kernel_info.metrics
    with open(output_dir / "base_metrics.json", "w") as f:
        json.dump(base_metrics, f, indent=2)

    raw_output_dir = output_dir / "raw"
    for sol in dataset_dir.iterdir():
        if not sol.is_dir():
            continue

        hls_data_json_path = sol / f"{sol.stem}_data.json"
        if not hls_data_json_path.exists():
            print(f"Directives JSON file not found for {sol}")
            continue
        
        dct_tcl_path = sol / f"directives.tcl"
        create_directives_tcl(hls_data_json_path, dct_tcl_path)

        sol_out_dir = raw_output_dir / sol.stem
        sol_out_dir.mkdir(parents=True, exist_ok=True)

        metrics = extract_metrics(sol, filtered=filtered)
        with open(sol_out_dir / "metrics.json", "w") as f:
            json.dump(metrics, f, indent=2)

        data = build_hls_graph_data(kernel_info, dct_tcl_path)
        torch.save(data, sol_out_dir / "graph.pt")


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
    parser.add_argument("-k", "--kernel-name", required=True,
                        help="Name of the kernel to process")
    parser.add_argument("-t", "--top-fn", required=True,
                        help="Name of the kernel top function")
    parser.add_argument("-b", "--base-sol-dir", type=str,
                        help="Path to the base solution directory")
    return vars(parser.parse_args())


if __name__ == "__main__":
    args = parse_args()
    main(args)

