import os
from typing import List

import torch
import numpy as np
import matplotlib.pyplot as plt
import shap
import xgboost as xgb
from torch_geometric.data import HeteroData

from gnn.data.graph import NODE_TYPES, NODE_FEATURE_DIMS


def load_graphs(data_dir: str) -> List[HeteroData]:
    graphs = []
    for instance_file in os.listdir(data_dir):
        if not instance_file.endswith(".pt"):
            continue
        graph_path = os.path.join(data_dir, instance_file)
        graph = torch.load(graph_path)
        if graph is None or not isinstance(graph, HeteroData):
            print(f"Skipping {instance_file} (not a HeteroData object)")
            continue
        graphs.append(graph)
    return graphs


def parse_model_errors(log_file_path: str):
    """Extract per-epoch relative errors from the log file."""
    with open(log_file_path, 'r') as f:
        lines = f.readlines()

    n_epochs = int(lines[-1].split(',')[0])
    rel_errors = [[] for _ in range(n_epochs)]

    for line in lines:
        epoch, target, pred = map(float, line.strip().split(',')[:-1])
        rel_error = abs(target - pred) / target
        rel_errors[int(epoch) - 1].append(rel_error)

    # Return only the best epoch errors
    idx = np.argmin([np.mean(epoch_errors) for epoch_errors in rel_errors])
    return rel_errors[idx]


def extract_homo_features(graphs: List[HeteroData]):
    """Extract homogeneous nodes from the graphs."""
    if not graphs:
        return [], []
    X = []
    max_feature_dim = max(list(NODE_FEATURE_DIMS.values()))
    for graph in graphs:
        x_list = []
        for x in graph.x_dict.values():
            feature_dim = x.size(1)
            pad_size = max_feature_dim - feature_dim
            if pad_size > 0:
                pad = torch.zeros((x.size(0), pad_size), dtype=torch.float32)
                x = torch.cat([x, pad], dim=1)
            x_list.append(x)
        X.append(torch.cat(x_list, dim=0).flatten())

    X = torch.stack(X).numpy()

    feature_names = []
    for nt in NODE_TYPES:
        for label in graphs[0][nt].label:    
            feature_names.extend(
                [f"{label}.{i}" for i in range(max_feature_dim)]
            )

    return X, feature_names


def build_dataset(data_dir: str, log_file_path: str):
    graphs = load_graphs(data_dir)
    X, feature_names = extract_homo_features(graphs)
    y = parse_model_errors(log_file_path)
    return X, y, feature_names


def train_model(X, y):
    model = xgb.XGBRegressor(
        objective='reg:squarederror',
        n_estimators=500,
        learning_rate=0.01,
        max_depth=8,
        subsample=0.8,
        colsample_bytree=0.8,
        random_state=42,
        n_jobs=-1
    )
    model.fit(X, y)
    return model


def explain_model(model, X):
    explainer = shap.TreeExplainer(model)
    shap_values = explainer.shap_values(X)
    return shap_values


def plot_shap_values(X, shap_values, feature_names=None):
    shap.summary_plot(
        shap_values, X, 
        feature_names=feature_names, 
        max_display=30, alpha=0.6,
        show_values_in_legend=True,
        color=shap_values
    )
    plt.tight_layout()


if __name__ == "__main__":
    from sys import argv

    data_dir = argv[1]
    log_file_path = argv[2]

    X, y, feature_names = build_dataset(data_dir, log_file_path)
    model = train_model(X, y)
    shap_values = explain_model(model, X)
    plot_shap_values(X, shap_values, feature_names=feature_names)
