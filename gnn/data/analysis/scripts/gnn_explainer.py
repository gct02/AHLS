import os
import json

import numpy as np
import xgboost as xgb
import matplotlib.pyplot as plt
import shap

from gnn.data.analysis.analysis_utils import encode_directives


DIRECTIVES = {
    "pipeline", "unroll", "loop_merge", 
    "loop_flatten", "array_partition",
    "dataflow", "inline"
}


def extract_errors_from_log(log_file_path):
    """Extract per-epoch relative errors from the log file."""
    with open(log_file_path, 'r') as f:
        lines = f.readlines()

    n_epochs = int(lines[-1].split(',')[0])
    rel_errors = [[] for _ in range(n_epochs)]

    for line in lines:
        epoch, target, pred = line.strip().split(',')[:-1]
        epoch, target, pred = int(epoch), float(target), float(pred)
        rel_error = abs(target - pred) / target
        rel_errors[epoch - 1].append(rel_error)

    return rel_errors


def get_best_epoch_results(rel_errors):
    """Return best epoch index and corresponding errors."""
    idx = np.argmin([np.mean(epoch_errors) for epoch_errors in rel_errors])
    return idx, rel_errors[idx]


def create_index_map(raw_test_dataset_dir):
    """Map internal indices to solution IDs with valid data."""
    index_map, idx = {}, 0

    for sol in _sorted_solutions(raw_test_dataset_dir):
        sol_idx = int(sol.split("solution")[1])
        sol_dir = os.path.join(raw_test_dataset_dir, sol)
        if not _valid_solution_dir(sol_dir):
            continue

        metrics = _load_metrics(os.path.join(sol_dir, "metrics.json"))
        if not metrics or metrics.get("lut", -1.0) < 0:
            continue

        index_map[idx] = sol_idx
        idx += 1

    return index_map


def create_solution_result_dict(rel_errors, index_map):
    """Link each result with its corresponding solution ID."""
    return {
        index_map[i]: re
        for i, re in enumerate(rel_errors) 
        if i in index_map
    }


def process_results(log_file_path, raw_test_dataset_dir):
    """Return result dict {solution_idx: rel_errors} for best epoch."""
    rel_errors_all = extract_errors_from_log(log_file_path)
    _, best_epoch_errors = get_best_epoch_results(rel_errors_all)
    index_map = create_index_map(raw_test_dataset_dir)
    return create_solution_result_dict(best_epoch_errors, index_map)


def process_directives(raw_test_dataset_dir, source_dataset_dir, dct_config_path):
    """Return directive dict {solution_idx: directive_indices}."""
    dct_dict = {}

    feat_names = None
    for sol in _sorted_solutions(raw_test_dataset_dir):
        sol_idx = int(sol.split("solution")[1])
        raw_sol_dir = os.path.join(raw_test_dataset_dir, sol)
        source_sol_dir = os.path.join(source_dataset_dir, sol)
        if not _valid_solution_dir(raw_sol_dir) or not os.path.isdir(source_sol_dir):
            continue

        metrics = _load_metrics(os.path.join(raw_sol_dir, "metrics.json"))
        if not metrics or metrics.get("lut", -1.0) < 0:
            continue

        dct_tcl_path = os.path.join(source_sol_dir, "directives.tcl")
        if not os.path.exists(dct_tcl_path):
            continue

        if feat_names is None:
            dct_dict[sol_idx], feat_names = encode_directives(
                dct_config_path, dct_tcl_path, 
                return_feat_names=True
            )
        else:
            dct_dict[sol_idx] = encode_directives(dct_config_path, dct_tcl_path)

    return dct_dict, feat_names


def associate_directives_with_results(dct_dict, result_dict):
    """Return dict {solution_idx: (directive_indices, rel_errors)}."""
    return {
        i: (dcts, re)
        for i, re in result_dict.items()
        if (dcts := dct_dict.get(i)) is not None
    }


def sort_by_error(dct_result_dict):
    """Return sorted list of tuples (solution_idx, directives, error), descending."""
    return sorted(
        [(i, d, re) for i, (d, re) in dct_result_dict.items()],
        key=lambda x: x[2],
        reverse=True
    )


def process_results_and_directives(
    log_file, raw_test_dataset_dir, 
    source_dataset_dir, dct_config_path,
    sorted_by_error=True
):
    """Return (solution_idx, directives, mean_error) tuples."""
    result_dict = process_results(log_file, raw_test_dataset_dir)
    dct_dict, feat_names = process_directives(
        raw_test_dataset_dir, source_dataset_dir, dct_config_path
    )
    dct_result_dict = associate_directives_with_results(dct_dict, result_dict)
    if sorted_by_error:
        return sort_by_error(dct_result_dict), feat_names
    return dct_result_dict, feat_names


def build_dataset(dct_result_dict):
    dcts = [entry[1] for entry in dct_result_dict]
    errors = [entry[2] for entry in dct_result_dict]
    dcts, errors = np.array(dcts), np.array(errors)
    return dcts.reshape(dcts.shape[0], -1), errors


def train_model(X_dct, y_error):
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
    model.fit(X_dct, y_error)
    return model


def explain_model(model, X_dct):
    explainer = shap.TreeExplainer(model)
    shap_values = explainer.shap_values(X_dct)
    return shap_values


def explain_model_with_interactions(model, X_dct):
    explainer = shap.TreeExplainer(model)
    shap_interaction_values = explainer.shap_interaction_values(X_dct)
    return shap_interaction_values


def plot_shap_values(X_dct, shap_values, feat_names=None):
    shap.summary_plot(
        shap_values, X_dct, 
        feature_names=feat_names, 
        max_display=20, alpha=0.4,
        show_values_in_legend=True,
        color=X_dct
    )
    plt.tight_layout()


def plot_interaction_summary(shap_interaction_values, X_dct, feat_names=None):
    shap.summary_plot(
        shap_interaction_values, X_dct, 
        feature_names=feat_names, 
        max_display=20, alpha=0.4,
        show_values_in_legend=True,
        plot_type="compact_dot",
        color=X_dct
    )


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
    dct_config_path = sys.argv[3]
    log_file = sys.argv[4]
    if len(sys.argv) > 5:
        num_sols_to_print = int(sys.argv[5])
    else:
        num_sols_to_print = 25

    dct_result_list, feat_names = process_results_and_directives(
        log_file=log_file, 
        raw_test_dataset_dir=raw_test_dataset_dir, 
        source_dataset_dir=source_dataset_dir, 
        dct_config_path=dct_config_path
    )

    for i in range(num_sols_to_print):
        i, dcts, error = dct_result_list[i]
        print(f"Solution {i} - Error: {error:.4f}")
        print(f"Feature values:")
        for j, dct in enumerate(dcts):
            feat_name = feat_names[j]
            if "factor" in feat_name and dct == 0:
                continue
            if "array_partition" in feat_name:
                if "d0" in feat_name or "d1" in feat_name or "d2" in feat_name:
                    if dct == 0:
                        continue
                    dct = feat_name[-1]
                    feat_name = feat_name[:-2] + "dim"
                elif "cp" in feat_name or "bl" in feat_name or "cy" in feat_name:
                    if dct == 0:
                        continue
                    dct = feat_name[-2:]
                    feat_name = feat_name[:-2] + "type"
            print(f"  {feat_name}: {dct}")

    X_dct, y_error = build_dataset(dct_result_list)
    model = train_model(X_dct, y_error)

    shap_values = explain_model(model, X_dct)
    plot_shap_values(X_dct, shap_values, feat_names)

    # shap_interaction_values = explain_model_with_interactions(model, X_dct)
    # plot_interaction_summary(shap_interaction_values, X_dct, feat_names)

