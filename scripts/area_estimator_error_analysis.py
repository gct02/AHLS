import os
import sys
import pickle

import torch
import shap
import numpy as np
import xgboost as xgb
import matplotlib.pyplot as plt
from sklearn.neural_network import MLPRegressor
from sklearn.linear_model import ElasticNet
from interpret.glassbox import ExplainableBoostingRegressor
from interpret import set_visualize_provider
from interpret.provider import DashProvider

from estimators.common.parsers import (
    AREA_METRICS,
    AVAILABLE_RESOURCES,
    extract_area_metrics,
    extract_hls_area_estimates
)
from estimators.common.losses import mape_loss
from estimators.area.graph import GRAPH_ATTRS
from estimators.area.data_utils import compute_snru

set_visualize_provider(DashProvider.from_address(('127.0.0.1', 7001)))

available_resources = torch.tensor(
    [AVAILABLE_RESOURCES[key] for key in AREA_METRICS],
    dtype=torch.float32,
)


def extract_errors(predictions_path):
    with open(predictions_path, 'r') as f:
        lines = f.readlines()
    lines = lines[1:] # Skip header

    error_dict = {}
    for line in lines:
        idx, target, pred = line.strip().split(',')
        idx, target, pred = int(idx), float(target), float(pred)
        error_dict[idx] = abs(target - pred) / (abs(target) + 1e-6)

    return error_dict


def extract_errors_hls(dataset_dir):
    error_dict = {}

    for solution in os.listdir(dataset_dir):
        solution_dir = os.path.join(dataset_dir, solution)
        if (not os.path.isdir(solution_dir) or 
            not solution.startswith('solution') or
            solution == 'solution0'):
            continue

        ground_truth_area = extract_area_metrics(solution_dir)
        hls_area_estimates = extract_hls_area_estimates(solution_dir)

        if any(metric < 0 for metric in hls_area_estimates.values()):
            print(f"Warning: HLS area estimates contain negative values for {solution}. Skipping this solution.")
            continue
        
        if any(metric < 0 for metric in ground_truth_area.values()):
            print(f"Warning: Ground truth area contains negative values for {solution}. Skipping this solution.")
            continue
        
        target = torch.tensor(
            [ground_truth_area[key] for key in AREA_METRICS],
            dtype=torch.float32
        )
        pred = torch.tensor(
            [hls_area_estimates[key] for key in AREA_METRICS],
            dtype=torch.float32
        )
        target_snru = compute_snru(target, available_resources)
        pred_snru = compute_snru(pred, available_resources)

        mape = mape_loss(pred_snru, target_snru).item()
        
        solution_idx = int(solution.split('solution')[1])
        error_dict[solution_idx] = mape
        
    return error_dict


def associate_feats_with_errors(error_dict, dataset_dir):
    feat_error_pairs = []

    for idx, error in error_dict.items():
        graph_path = os.path.join(dataset_dir, f"solution{idx}/graph.pkl")
        if not os.path.exists(graph_path):
            print(f"Graph file does not exist for solution {idx}: {graph_path}")
            continue
        
        with open(graph_path, 'rb') as f:
            graph = pickle.load(f)

        graph_attr = [graph.graph_attr[key] for key in GRAPH_ATTRS]
        graph_attr = np.array(graph_attr, dtype=np.float32)
        feat_error_pairs.append((idx, graph_attr, error))

    return feat_error_pairs


def sort_by_error(feat_error_pairs):
    """Return sorted list of tuples (solution_idx, feats, error), descending."""
    return sorted(feat_error_pairs, key=lambda x: x[2], reverse=True)


def process_data(error_dict, dataset_dir):
    """Return (solution_idx, feats, error) tuples."""
    feat_error_pairs = associate_feats_with_errors(error_dict, dataset_dir)
    return sorted(feat_error_pairs, key=lambda x: x[2], reverse=True)


def build_dataset(feat_error_pairs):
    feats = [entry[1] for entry in feat_error_pairs]
    errors = [entry[2] for entry in feat_error_pairs]
    feats, errors = np.array(feats), np.array(errors)
    return feats.reshape(feats.shape[0], -1), errors


def train_model(X_dct, y_error, surrogate='xgb'):
    if surrogate == 'xgb':
        model = xgb.XGBRegressor(
            objective='reg:squarederror',
            n_estimators=1000,
            learning_rate=1e-2,
            max_depth=10,
            random_state=42
        )
    elif surrogate == 'mlp':
        model = MLPRegressor(
            hidden_layer_sizes=(100, 50),
            activation='relu',
            solver='adam',
            max_iter=1000,
            random_state=42
        )
    elif surrogate == 'lin':
        # Using ElasticNet as a linear surrogate model
        model = ElasticNet(
            alpha=0.1,
            l1_ratio=0.5,
            max_iter=1000,
            random_state=42
        )
    else:
        raise ValueError("Invalid surrogate model type. Choose 'xgb', 'mlp', or 'lin'.")
    
    model.fit(X_dct, y_error)
    return model


def make_callable(mlpregressor):
    return lambda x: mlpregressor.predict(x)


def explain_model(model, X_dct, surrogate='xgb'):
    if surrogate == 'xgb':
        explainer = shap.TreeExplainer(model, X_dct)
    elif surrogate == 'mlp':
        explainer = shap.KernelExplainer(make_callable(model), shap.kmeans(X_dct, 100))
    elif surrogate == 'lin':
        explainer = shap.LinearExplainer(model, X_dct)

    shap_values = explainer.shap_values(X_dct)
    return shap_values


def explain_model_with_interactions(model, X_dct):
    explainer = shap.TreeExplainer(model)
    shap_interaction_values = explainer.shap_interaction_values(X_dct)
    return shap_interaction_values


def plot_shap_values(X_dct, shap_values, output_path):
    shap.summary_plot(
        shap_values, X_dct, 
        feature_names=GRAPH_ATTRS, 
        max_display=30, alpha=0.4,
        show_values_in_legend=True,
        color=X_dct, show=False
    )
    plt.savefig(output_path, bbox_inches='tight')
    plt.close()


def plot_shap_interaction(shap_interaction_values, X_dct, output_path):
    shap.summary_plot(
        shap_interaction_values, X_dct, 
        feature_names=GRAPH_ATTRS, 
        max_display=40, alpha=0.4,
        show_values_in_legend=True,
        plot_type="compact_dot",
        color=X_dct, show=False
    )
    plt.savefig(output_path.replace('.png', '_interaction.png'), bbox_inches='tight')
    plt.close()


def explain_model_ebm(X_dct, y_error):
    ebm_explainer = ExplainableBoostingRegressor(feature_names=GRAPH_ATTRS)
    ebm_explainer.fit(X_dct, y_error)
    ebm_results = ebm_explainer.explain_global()
    go_fig = ebm_results.visualize()
    go_fig.update_layout(
        title="Explainable Boosting Machine Global Explanation",
        width=1000,
        height=600
    )
    go_fig.show(renderer='browser')
    # with open('ebm_global.png', 'wb') as f:
    #     f.write(go_fig.to_image(format='png'))


def parse_args():
    import argparse
    parser = argparse.ArgumentParser(description="GNN Explainer Script")
    parser.add_argument('-b', '--benchmark', type=str, required=True, help='Benchmark name')
    parser.add_argument('-d', '--dataset_dir', type=str, default=None, help='Path to dataset directory')
    parser.add_argument('-p', '--predictions', type=str, default=None, help='Path to predictions file')
    parser.add_argument('-o', '--output', type=str, default=None, help='Output file for SHAP values plot')
    parser.add_argument('-ft', '--fine-tuned', action='store_true', help='Analyze fine-tuned model predictions')
    parser.add_argument('-s', '--surrogate', default='xgb', choices=['xgb', 'mlp', 'lin'], help='Surrogate model type')
    parser.add_argument('-i', '--interactions', action='store_true', help='Show interaction SHAP values')
    parser.add_argument('-hls', '--hls', action='store_true', help='Use HLS area estimates instead of predictions')
    return parser.parse_args()


if __name__ == "__main__":
    import sys

    args = parse_args()

    benchmark = args.benchmark.upper()
    dataset_dir = args.dataset_dir
    predictions_path = args.predictions
    fine_tuned = args.fine_tuned
    surrogate = args.surrogate
    interactions = args.interactions
    output_path = args.output

    if not dataset_dir:
        dataset_dir = f"../dataset-filtered/{benchmark}"

    if not os.path.exists(dataset_dir):
        print(f"Dataset directory does not exist: {dataset_dir}")
        sys.exit(1)

    if args.hls:
        error_dict = extract_errors_hls(dataset_dir)
    else:
        if not os.path.exists(predictions_path):
            print(f"Predictions file does not exist: {predictions_path}")
            sys.exit(1)

        error_dict = extract_errors(predictions_path)

    feat_error_pairs = process_data(error_dict, dataset_dir)

    X_dct, y_error = build_dataset(feat_error_pairs)
    model = train_model(X_dct, y_error, surrogate=surrogate)

    if not output_path:
        output_dir = "visualization/area_estimator_shap_values"
        os.makedirs(output_dir, exist_ok=True)

        output_path = f"{output_dir}/{benchmark}_"
        if args.hls:
            output_path += "hls_"
        elif fine_tuned:
            output_path += "fine_tuned_"
        else:
            output_path += "pretrained_"

        output_path += f"{surrogate}_shap"
        if interactions:
            output_path += "_interactions.png"
        else:
            output_path += ".png"

    if interactions:
        if surrogate != 'xgb':
            print("Interaction SHAP values are only available for XGBoost surrogate models.")
            sys.exit(1)
        shap_interaction_values = explain_model_with_interactions(model, X_dct)
        plot_shap_interaction(shap_interaction_values, X_dct, output_path)
    else:
        shap_values = explain_model(model, X_dct, surrogate=surrogate)
        plot_shap_values(X_dct, shap_values, output_path)
        explain_model_ebm(X_dct, y_error)
