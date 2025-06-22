import subprocess
import argparse
import json
from pathlib import Path
from typing import Dict

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


def generate_base(
    dataset_dir: Path, 
    top_level_function: str,
    output_dir: Path
) -> CDFG:
    base_solution_dir = dataset_dir / "solution0"
    if not base_solution_dir.is_dir():
        raise ValueError(f"Base solution not found")

    ir_dir = base_solution_dir / ".autopilot/db"
    ir_path = ir_dir / "a.g.ld.0.bc"
    if not ir_path.exists():
        raise ValueError(f"Intermediate representation not found in {ir_dir}")

    metrics = extract_metrics(base_solution_dir, filtered=False)
    if metrics is None:
        raise ValueError(f"Metrics not found for base solution")

    with open(output_dir / "base_metrics.json", "w") as f:
        json.dump(metrics, f, indent=2)

    ir_mod_path = ir_dir / ir_path.name.replace(".bc", ".mod.ll")
    md_path = ir_dir / "metadata.json"
    try:
        process_ir(ir_path, ir_mod_path, md_path, preserve_temp_files=True)
    except subprocess.CalledProcessError:
        raise ValueError(f"Failed to process IR file {ir_path}")

    if not md_path.exists():
        raise ValueError(f"Metadata file not found: {md_path}")

    base_graph = generate_base_design_graph(
        ir_mod_path, md_path, top_level_function
    )
    return base_graph


def main(args: Dict[str, str]):
    dataset_dir = Path(args['dataset_dir'])
    output_dir = Path(args['output_dir'])
    top_level_function = Path(args['top_level'])
    filtered = args['filtered']

    if not dataset_dir.is_dir():
        raise ValueError(f"Dataset directory {dataset_dir} "
                         f"does not exist or is not a directory")
    
    output_dir = output_dir / "raw"
    if not output_dir.is_dir():
        output_dir.mkdir(parents=True, exist_ok=True)

    base_graph = generate_base(
        dataset_dir, 
        top_level_function, 
        output_dir
    )
    for solution_dir in dataset_dir.iterdir():
        if (not solution_dir.is_dir() or 
            not solution_dir.stem.startswith("solution")):
            continue

        solution_name = solution_dir.stem
        hls_data_json_path = solution_dir / f"{solution_name}_data.json"
        if not hls_data_json_path.exists():
            print(f"Directives JSON file not found for {solution_name}")
            continue

        dct_tcl_path = solution_dir / f"directives.tcl"
        if not dct_tcl_path.exists():
            export_directives_as_tcl(hls_data_json_path, dct_tcl_path)

        solution_out_dir = output_dir / solution_name
        solution_out_dir.mkdir(parents=True, exist_ok=True)

        metrics = extract_metrics(
            solution_dir, 
            filtered=filtered and solution_name != "solution0"
        )
        with open(solution_out_dir / "metrics.json", "w") as f:
            json.dump(metrics, f, indent=2)

        graph = generate_optimized_design_graph(base_graph, dct_tcl_path)
        graph.to_json(solution_out_dir / "graph.json")


def parse_args():
    parser = argparse.ArgumentParser(
        description="Process a dataset of HLS solutions to extract metrics and build graphs."
    )
    parser.add_argument("-d", "--dataset-dir", required=True,
                        help="Path to the source dataset directory containing HLS solutions")
    parser.add_argument("-o", "--output-dir", required=True,
                        help="Path to the output directory")
    parser.add_argument("-tl", "--top-level", required=True,
                        help="The name of the top-level function")
    parser.add_argument("-f", "--filtered", action="store_true",
                        help="Signal that the dataset is filtered")
    return vars(parser.parse_args())


if __name__ == "__main__":
    args = parse_args()
    main(args)

