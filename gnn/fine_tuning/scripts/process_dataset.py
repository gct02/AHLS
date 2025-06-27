import argparse
import json
import pickle
import sys
from pathlib import Path
from typing import Dict

from gnn.data.graph import update_with_directives
from gnn.data.utils.parsers import (
    extract_metrics,
    export_directives_as_tcl
)


def main(args: Dict[str, str]):
    dataset_dir = Path(args['dataset_dir'])
    output_dir = Path(args['output_dir'])
    filtered = args['filtered']
    vitis_kernel_info_path = Path(args['vitis_kernel_info'])

    if not dataset_dir.exists() or not dataset_dir.is_dir():
        print(f"Dataset directory {dataset_dir} does not exist or is not a directory.")
        sys.exit(1)

    if not vitis_kernel_info_path.exists():
        print(f"Vitis kernel info file {vitis_kernel_info_path} does not exist.")
        sys.exit(1)

    if not output_dir.exists():
        output_dir.mkdir(parents=True, exist_ok=True)

    with open(vitis_kernel_info_path, "rb") as f:
        kernel_info = pickle.load(f)

    raw_output_dir = output_dir / "raw"
    if not raw_output_dir.exists():
        raw_output_dir.mkdir(parents=True, exist_ok=True)
        
    for sol in dataset_dir.iterdir():
        if not sol.is_dir() or not sol.name.startswith("solution"):
            continue

        hls_log_path = sol / f"{sol.name}.log"
        if not hls_log_path.exists():
            print(f"Log file {hls_log_path} does not exist for {sol.name}")
            continue
        
        dct_tcl_path = sol / "directives.tcl"
        if not dct_tcl_path.exists():
            hls_data_json_path = sol / f"{sol.name}.json"
            if not hls_data_json_path.exists():
                print(f"Neither directives.tcl nor {sol.name}.json found in {sol}")
                continue
            export_directives_as_tcl(hls_data_json_path, dct_tcl_path)

        sol_out_dir = raw_output_dir / sol.stem
        sol_out_dir.mkdir(parents=True, exist_ok=True)

        metrics = extract_metrics(sol, filtered=filtered and sol.name != "solution0")
        with open(sol_out_dir / "metrics.json", "w") as f:
            json.dump(metrics, f, indent=2)

        data = update_with_directives(
            kernel_info, dct_tcl_path,
            vitis_log_path=hls_log_path
        )
        with open(sol_out_dir / "vitis_kernel_info.pkl", "wb") as f:
            pickle.dump(data, f)


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
    parser.add_argument("-k", "--vitis-kernel-info", required=True,
                        help="Path to the serialized VitisKernelInfo object of the base solution")
    return vars(parser.parse_args())


if __name__ == "__main__":
    args = parse_args()
    main(args)