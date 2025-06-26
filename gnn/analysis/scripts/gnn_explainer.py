import os

import numpy as np
import xgboost as xgb
import matplotlib.pyplot as plt
import shap

from gnn.analysis.utils import encode_directives


def extract_errors(predictions_path):
    with open(predictions_path, 'r') as f:
        lines = f.readlines()
    lines = lines[1:] # Skip header

    error_dict = {}
    for line in lines:
        idx, target, pred = line.strip().split(',')
        idx, target, pred = int(idx), float(target), float(pred)
        error_dict[idx] = abs(target - pred) / target

    return error_dict


def associate_directives_with_errors(error_dict, dataset_dir, dct_config_path):
    dct_error_pairs = []
    feat_names = None

    for idx, error in error_dict.items():
        dct_tcl_path = os.path.join(dataset_dir, f"solution{idx}/directives.tcl")
        if not os.path.exists(dct_tcl_path):
            continue

        if feat_names is None:
            dct, feat_names = encode_directives(
                dct_config_path, dct_tcl_path, 
                return_feat_names=True
            )
        else:
            dct = encode_directives(dct_config_path, dct_tcl_path)
        
        dct_error_pairs.append((idx, dct, error))

    return dct_error_pairs, feat_names


def sort_by_error(dct_error_pairs):
    """Return sorted list of tuples (solution_idx, directives, error), descending."""
    return sorted(
        dct_error_pairs,
        key=lambda x: x[2],
        reverse=True
    )


def process_errors_and_directives(
    predictions_path, dataset_dir, dct_config_path,
    sorted_by_error=True
):
    """Return (solution_idx, directives, mean_error) tuples."""
    error_dict = extract_errors(predictions_path)
    dct_error_pairs, feat_names = associate_directives_with_errors(
        error_dict, dataset_dir, dct_config_path
    )
    if sorted_by_error:
        return (
            sorted(dct_error_pairs, key=lambda x: x[2], reverse=True),
            feat_names
        )
    return dct_error_pairs, feat_names


def build_dataset(dct_error_pairs):
    dcts = [entry[1] for entry in dct_error_pairs]
    errors = [entry[2] for entry in dct_error_pairs]
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
        max_display=30, alpha=0.4,
        show_values_in_legend=True,
        color=X_dct
    )
    plt.tight_layout()


def plot_interaction_summary(shap_interaction_values, X_dct, feat_names=None):
    shap.summary_plot(
        shap_interaction_values, X_dct, 
        feature_names=feat_names, 
        max_display=30, alpha=0.4,
        show_values_in_legend=True,
        plot_type="compact_dot",
        color=X_dct
    )


if __name__ == "__main__":
    import sys

    dataset_dir = sys.argv[1]
    dct_config_path = sys.argv[2]
    predictions_path = sys.argv[3]

    dct_error_pairs, feat_names = process_errors_and_directives(
        predictions_path=predictions_path, 
        dataset_dir=dataset_dir, 
        dct_config_path=dct_config_path
    )

    X_dct, y_error = build_dataset(dct_error_pairs)
    model = train_model(X_dct, y_error)

    shap_values = explain_model(model, X_dct)
    plot_shap_values(X_dct, shap_values, feat_names)

    # shap_interaction_values = explain_model_with_interactions(model, X_dct)
    # plot_interaction_summary(shap_interaction_values, X_dct, feat_names)