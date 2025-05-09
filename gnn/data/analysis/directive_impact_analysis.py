import os
import json
from collections import defaultdict

import numpy as np
import xgboost as xgb
import matplotlib.pyplot as plt
import shap

from gnn.data.analysis.analysis_utils import parse_and_encode_directives


DIRECTIVES = {
    "pipeline", "unroll", "loop_merge", 
    "loop_flatten", "array_partition",
    "dataflow", "inline"
}


def parse_errors_from_log(log_file):
    """Extract per-epoch relative errors from the log file."""
    with open(log_file, 'r') as f:
        lines = f.readlines()

    n_epochs = int(lines[-1].split(',')[0])
    rel_errors = [[] for _ in range(n_epochs)]

    for line in lines:
        epoch, target, pred = map(float, line.strip().split(',')[:-1])
        # epoch, _, target, pred = map(float, line.strip().split(','))
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

    feature_names = None
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

        if feature_names is None:
            directive_dict[solution_idx], feature_names = parse_and_encode_directives(
                config_path, tcl_path, return_feature_names=True
            )
        else:
            directive_dict[solution_idx] = parse_and_encode_directives(config_path, tcl_path)

    return directive_dict, feature_names


def associate_directives_with_results(directive_dict, result_dict):
    """Return dict {solution_idx: (directive_indices, rel_errors)}."""
    return {
        i: (directives, rel_errors)
        for i, rel_errors in result_dict.items()
        if (directives := directive_dict.get(i)) is not None
    }


def sort_by_error(directive_result_dict):
    """Return sorted list of tuples (solution_idx, directives, error), descending."""
    return sorted(
        [(i, d, np.mean(re)) for i, (d, re) in directive_result_dict.items()],
        key=lambda x: x[2],
        reverse=True
    )


def process_results_and_directives(
    log_file, raw_test_dataset_dir, 
    source_dataset_dir, config_path,
    sorted_by_error=True
):
    """Return (solution_idx, directives, mean_error) tuples."""
    result_dict = process_results(log_file, raw_test_dataset_dir)
    directive_dict, feature_names = process_directives(
        raw_test_dataset_dir, source_dataset_dir, config_path
    )
    directive_result_dict = associate_directives_with_results(directive_dict, result_dict)
    if sorted_by_error:
        return sort_by_error(directive_result_dict), feature_names
    return directive_result_dict, feature_names


def build_dataset(directive_result_dict):
    directives = [entry[1] for entry in directive_result_dict]
    errors = [entry[2] for entry in directive_result_dict]
    directives, errors = np.array(directives), np.array(errors)
    directives = directives.reshape(directives.shape[0], -1)
    return directives, errors


def train_model(X_directives, y_errors):
    model = xgb.XGBRegressor(
        objective='reg:squarederror',
        n_estimators=1000,
        learning_rate=0.01,
        max_depth=8,
        subsample=0.8,
        colsample_bytree=0.8,
        random_state=42,
        n_jobs=-1
    )
    model.fit(X_directives, y_errors)
    return model


def explain_model(model, X_directives):
    explainer = shap.TreeExplainer(model)
    shap_values = explainer.shap_values(X_directives)
    return shap_values


def plot_shap_values(X_directives, shap_values, feature_names=None):
    shap.summary_plot(
        shap_values, X_directives, 
        feature_names=feature_names, 
        max_display=30, alpha=0.6,
        show_values_in_legend=True,
        color=shap_values
    )
    plt.tight_layout()


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
    directive_config_path = sys.argv[3]
    log_file = sys.argv[4]

    directive_result_dict, feature_names = process_results_and_directives(
        log_file, raw_test_dataset_dir, source_dataset_dir, directive_config_path
    )

    X_directives, y_errors = build_dataset(directive_result_dict)
    model = train_model(X_directives, y_errors)
    shap_values = explain_model(model, X_directives)
    plot_shap_values(X_directives, shap_values, feature_names)

