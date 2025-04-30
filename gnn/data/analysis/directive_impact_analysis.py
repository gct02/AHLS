import os
import json

import torch
import numpy as np

from gnn.data.analysis.analysis_utils import parse_and_encode_directives
from gnn.data.utils.parsers import parse_tcl_directives_file

DIRECTIVES = {
    "pipeline", "unroll", "loop_merge", 
    "loop_flatten", "array_partition"
}


def parse_errors_from_log(log_file):
    """Extract per-epoch relative errors from the log file."""
    with open(log_file, 'r') as f:
        lines = f.readlines()

    n_epochs = int(lines[-1].split(',')[0])
    rel_errors = [[] for _ in range(n_epochs)]

    for line in lines:
        epoch, target, pred = map(float, line.strip().split(',')[:-1])
        rel_error = abs(target - pred) / target
        rel_errors[int(epoch) - 1].append(rel_error)

    return rel_errors


def get_best_epoch_results(rel_errors):
    """Return best epoch index and corresponding errors."""
    idx = np.argmin([np.mean(epoch_errors) for epoch_errors in rel_errors])
    return idx, rel_errors[idx]


def create_index_map(raw_test_dataset_dir):
    """Map internal indices to solution IDs with valid data."""
    index_map, idx = {}, 0

    for solution in _sorted_solutions(raw_test_dataset_dir):
        solution_idx = int(solution.split("solution")[1])
        solution_dir = os.path.join(raw_test_dataset_dir, solution)
        if not _valid_solution_dir(solution_dir):
            continue

        metrics = _load_metrics(os.path.join(solution_dir, "metrics.json"))
        if not metrics or metrics.get("lut", -1.0) < 0:
            continue

        index_map[idx] = solution_idx
        idx += 1

    return index_map


def create_solution_result_dict(rel_errors, index_map):
    """Link each result with its corresponding solution ID."""
    return {
        index_map[i]: error
        for i, error in enumerate(rel_errors)
        if i in index_map
    }


def process_results(log_file, raw_test_dataset_dir):
    """Return result dict {solution_idx: rel_errors} for best epoch."""
    rel_errors_all = parse_errors_from_log(log_file)
    _, best_epoch_errors = get_best_epoch_results(rel_errors_all)
    index_map = create_index_map(raw_test_dataset_dir)
    return create_solution_result_dict(best_epoch_errors, index_map)


def process_directives(raw_test_dataset_dir, source_dataset_dir, config_path):
    """Return directive dict {solution_idx: directive_indices}."""
    directive_dict = {}

    for solution in _sorted_solutions(raw_test_dataset_dir):
        solution_idx = int(solution.split("solution")[1])
        raw_solution_dir = os.path.join(raw_test_dataset_dir, solution)
        source_solution_dir = os.path.join(source_dataset_dir, solution)

        if not _valid_solution_dir(raw_solution_dir) or not os.path.isdir(source_solution_dir):
            continue

        metrics = _load_metrics(os.path.join(raw_solution_dir, "metrics.json"))
        if not metrics or metrics.get("lut", -1.0) < 0:
            continue

        tcl_path = os.path.join(source_solution_dir, "directives.tcl")
        if not os.path.exists(tcl_path):
            continue

        directive_dict[solution_idx] = parse_and_encode_directives(config_path, tcl_path)

    return directive_dict


def associate_directives_with_results(directive_dict, result_dict):
    """Return dict {solution_idx: (directive_indices, rel_errors)}."""
    return {
        i: (directives, rel_errors)
        for i, rel_errors in result_dict.items()
        if (directives := directive_dict.get(i)) is not None
    }


def sort_by_error(result_directive_dict):
    """Return sorted list of tuples (solution_idx, directives, error), descending."""
    return sorted(
        [(i, d, np.mean(re)) for i, (d, re) in result_directive_dict.items()],
        key=lambda x: x[2],
        reverse=True
    )


def process_results_and_directives(log_file, raw_test_dataset_dir, source_dataset_dir, config_path):
    """Return sorted (solution_idx, directives, mean_error) tuples."""
    result_dict = process_results(log_file, raw_test_dataset_dir)
    directive_dict = process_directives(raw_test_dataset_dir, source_dataset_dir, config_path)
    result_directive_dict = associate_directives_with_results(directive_dict, result_dict)
    return sort_by_error(result_directive_dict)


def print_top_k_results(sorted_results, directive_config_path, k=15):
    with open(directive_config_path, "r") as f:
        directive_group_dict = json.load(f)["directives"]

    directive_groups = []
    for gp_name, gp in directive_group_dict.items():
        gp_directives = gp.get("possible_directives")
        if gp_directives is not None:
            gp_directives = [d for d in gp_directives if d and "-off" not in d]
            directive_groups.append((gp_name, gp_directives))

    directives = [entry[1] for entry in sorted_results]
    directives = directives[:k]

    for i, directive_groups_enc in enumerate(directives):
        print(f"{i}:")
        for gp, gp_enc_dirs in zip(directive_groups, directive_groups_enc):
            gp_name, gp_dirs = gp
            # group_directives = [gp_dirs[j] for j in range(len(gp_enc_dirs)) if gp_enc_dirs[j] == 1]
            # print(f"  {gp_name}: {group_directives}")
            for j, directive in enumerate(gp_dirs):
                if gp_enc_dirs[j] == 1:
                    print(directive)
        print(f"Mean Error: {sorted_results[i][2]}\n")
    

def _load_metrics(path):
    if os.path.exists(path):
        with open(path, "r") as f:
            return json.load(f)
    return {}


def _valid_solution_dir(path):
    return os.path.isdir(path) and \
           os.path.exists(os.path.join(path, "graph.pt")) and \
           os.path.exists(os.path.join(path, "metrics.json"))


def _sorted_solutions(base_dir):
    return sorted(
        [s for s in os.listdir(base_dir) if "solution" in s],
        key=lambda s: int(s.split("solution")[1])
    )


if __name__ == "__main__":
    import sys

    source_dataset_dir = sys.argv[1]
    raw_test_dataset_dir = sys.argv[2]
    directives_config_path = sys.argv[3]
    log_file = sys.argv[4]
    k = int(sys.argv[5]) if len(sys.argv) > 5 else 15

    sorted_results = process_results_and_directives(
        log_file, raw_test_dataset_dir, source_dataset_dir, directives_config_path
    )

    # directives = [entry[1] for entry in sorted_results]
    # topk = directives[:k]
    # print(topk)
    print_top_k_results(sorted_results, directives_config_path, k)
