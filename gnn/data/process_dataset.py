import argparse
import subprocess
import json
from os import environ
from pathlib import Path
from typing import Dict, Union

import torch

from gnn.data.graph import build_base_graphs, build_opt_graph
from gnn.data.utils.parsers import extract_metrics


try:
    DSE_LIB = environ['DSE_LIB']
    OPT = environ['OPT']
    CLANG = environ['CLANG']
    LLVM_LINK = environ['LLVM_LINK']
except KeyError as error:
    print(f"Error: environment variable {error.args[0]} not defined.")
    raise


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
    config_path = args.get('config_path')

    with open(config_path, "r") as f:
        config = json.load(f)

    base_solutions = []
    benchmarks = []
    for benchmark in dataset_dir.iterdir():
        if not benchmark.is_dir():
            continue

        benchmark_config = config.get(benchmark.name)
        if not benchmark_config:
            print(f"Configuration not found for {benchmark.name}")
            continue

        base_solution_dir = dataset_dir / benchmark / "solution0"
        if not base_solution_dir.exists():
            print(f"Base solution directory not found for {benchmark}")
            continue

        ir_path = base_solution_dir / ".autopilot/db/a.o.3.bc"
        if not ir_path.exists():
            print(f"IR file not found for {benchmark}")
            continue

        ir_mod_path = base_solution_dir / ".autopilot/db/a.o.3.mod.bc"
        metadata_path = base_solution_dir / ".autopilot/db/metadata.json"
        try:
            subprocess.check_output(
                f"{OPT} -mem2reg -indvars -loop-simplify -scalar-evolution -instnamer < {ir_path.as_posix()} > {ir_mod_path.as_posix()};", 
                shell=True, stderr=subprocess.STDOUT
            )
            subprocess.check_output(
                f"{OPT} -load {DSE_LIB} -extract-md -out {metadata_path.as_posix()} < {ir_mod_path.as_posix()};", 
                shell=True, stderr=subprocess.STDOUT
            )
        except subprocess.CalledProcessError as e:
            ir_mod_path.unlink(missing_ok=True)
            metadata_path.unlink(missing_ok=True)
            print(f"Error extracting metadata for {benchmark}: {e.output.decode()}")
            continue

        top_level_function = benchmark_config["top_level"]
        base_solutions.append(
            (base_solution_dir, benchmark.name, top_level_function)
        )
        benchmarks.append(benchmark)

    base_graphs = build_base_graphs(base_solutions, filtered=False)

    for benchmark in benchmarks:
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
    parser.add_argument("-c", "--config-path", default=None,
                        help="Path to the configuration file for kernel information")
    return vars(parser.parse_args())


if __name__ == "__main__":
    args = parse_args()
    main(args)

