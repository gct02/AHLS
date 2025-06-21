import os
import json
from typing import List, Union, Optional, Tuple

import torch
import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.metrics import r2_score
from torch import Tensor
from sklearn.cluster import KMeans, AgglomerativeClustering
from sklearn.metrics import silhouette_score, davies_bouldin_score, calinski_harabasz_score
from sklearn.decomposition import PCA
from numpy.typing import NDArray

from gnn.data.utils.parsers import (
    extract_metrics,
    parse_tcl_directives,
    parse_directive_cmd
)


def cluster_by_directive(
    directives: NDArray[np.int_],
    n_clusters: int = 8,
    max_iter: int = 1000,
    cluster_method: str = 'kmeans',
    n_components: Union[int, float] = 0.85,
    metrics: Optional[NDArray[np.float_]] = None,
    log_transform_metrics: bool = True
) -> NDArray[np.int_]:
    if directives.ndim > 2:
        directives = directives.reshape(directives.shape[0], -1)

    if metrics is not None:
        if log_transform_metrics:
            metrics = np.log1p(metrics)
        directives = np.append(directives, metrics, axis=1)

    pca = PCA(n_components=n_components)
    directives = pca.fit_transform(directives)

    if cluster_method == 'kmeans':
        model = KMeans(
            n_clusters=n_clusters, 
            max_iter=max_iter, 
            n_init=20, 
            tol=1e-8
        )
    elif cluster_method == 'aggl':
        model = AgglomerativeClustering(
            n_clusters=n_clusters, 
            linkage='complete', 
            compute_full_tree=True
        )
    else:
        raise ValueError(f"Unknown clustering method: "
                         f"{cluster_method}")
    
    clusters = model.fit_predict(directives)
    
    if len(np.unique(clusters)) > 1:
        sil_score = silhouette_score(directives, clusters)
        db_score = davies_bouldin_score(directives, clusters)
        ch_score = calinski_harabasz_score(directives, clusters)
        print(f'Silhouette score: {sil_score:.2f}')
        print(f'Davies-Bouldin score: {db_score:.2f}')
        print(f'Calinski-Harabasz score: {ch_score:.2f}')

    return clusters


def collate_data_for_analysis(
    data_dir: str, 
    benchmark: str, 
    filtered: bool = False,
    dct_config_path: Optional[str] = None,
    include_base_solution: bool = False
) -> Tuple[pd.DataFrame, Optional[NDArray[np.int_]]]:
    metrics = []
    directives = [] if dct_config_path else None

    bench_dir = f"{data_dir}/{benchmark}"
    solutions = os.listdir(bench_dir)
    solutions = sorted(
        solutions, key=lambda s: int(s.split("solution")[1])
    )

    for sol in solutions:
        if not include_base_solution and sol == 'solution0':
            continue
        sol_dir = os.path.join(bench_dir, sol)
        report = extract_metrics(sol_dir, filtered)
        if report is None:
            continue

        report['benchmark'] = benchmark
        report['solution'] = sol
        metrics.append(report)

        if dct_config_path is not None:
            tcl_path = f'{sol_dir}/directives.tcl'
            directives.append(
                encode_directives(dct_config_path, tcl_path)
            )
    if directives is not None:
        directives = np.stack(directives)

    return pd.DataFrame(metrics), directives
    

def encode_directives(
    dct_config_path, 
    solution_dct_tcl_path,
    return_feat_names: bool = False,
    default_partition_factor: int = 16,
    default_unroll_factor: int = 16,
    max_array_size: int = 2 # In our dataset, this is the max size
) -> Union[NDArray[np.int_], Tuple[NDArray[np.int_], List[str]]]:
    def encode_ap_dct_info(ap_dct_args):
        ap_factor = int(ap_dct_args.get("factor", 0))
        if ap_factor == 0:
            ap_factor = default_partition_factor

        ap_dim_idx = int(ap_dct_args.get("dim", 0))
        ap_dim = [0] * (max_array_size + 1)
        ap_dim[ap_dim_idx] = 1

        ap_type = ap_dct_args.get("type", "complete")
        if ap_type == "complete":
            ap_type = [1, 0, 0]
        elif ap_type == "block":
            ap_type = [0, 1, 0]
        else:
            ap_type = [0, 0, 1]

        return [1, ap_factor] + ap_dim + ap_type

    def get_dct_feat_name(dct, label):
        dct_id = f"{dct}_{label}"
        if dct == "array_partition":
            return [
                dct_id, f"{dct_id}_factor",
                f"{dct_id}_d0", f"{dct_id}_d1", f"{dct_id}_d2",
                f"{dct_id}_cp", f"{dct_id}_bl", f"{dct_id}_cy"
            ]
        if dct == "unroll":
            return [dct_id, f"{dct_id}_factor"]
        return [dct_id]

    if not os.path.exists(solution_dct_tcl_path):
        raise ValueError(f"Directives file not found: "
                         f"{solution_dct_tcl_path}")
    if not os.path.exists(dct_config_path):
        raise ValueError(f"Directive configuration file not found: "
                         f"{dct_config_path}")
    
    with open(dct_config_path, "r") as f:
        dct_json = json.load(f)
    
    dct_dict = dct_json.get("directives")
    if dct_dict is None:
        raise ValueError(f"Directives not found in "
                         f"{dct_config_path}")

    available_dcts = {
        "pipeline", "unroll", "loop_merge", 
        "loop_flatten", "array_partition", 
        "dataflow", "inline"
    }

    dcts = []
    for group in dct_dict.values():
        possible_dcts = group.get("possible_directives")
        if possible_dcts is None or len(possible_dcts) == 0:
            continue
        group_dcts = []
        first_dct_cmd = possible_dcts[1]
        dct_type, dct_args = parse_directive_cmd(first_dct_cmd)
        if dct_type not in available_dcts:
            continue
        if dct_type == "array_partition":
            label = group.get("variable")
        else:
            label = group.get("label")
            if not label:
                label = group.get("function")
        group_dcts.append(dct_args)
        if len(possible_dcts) == 1:
            dcts.append((dct_type, label, group_dcts))
            continue
        for dct_cmd in possible_dcts[2:]:
            _, dct_args = parse_directive_cmd(dct_cmd)
            if dct_type in available_dcts:
                group_dcts.append(dct_args)
        dcts.append((dct_type, label, group_dcts))

    sol_dcts = parse_tcl_directives(solution_dct_tcl_path)
    sol_dcts = [
        dct for dct in sol_dcts 
        if dct[0] in available_dcts
    ]

    feat_names = []
    encoded_dcts = []
    for dct_type, label, group_dcts in dcts:
        enc_dct = None
        for dct_args in group_dcts:
            for sol_dct_type, sol_dct_args in sol_dcts:
                if (sol_dct_type == dct_type 
                    and sol_dct_args == dct_args):
                    if dct_type == "array_partition":
                        enc_dct = encode_ap_dct_info(dct_args)
                    elif dct_type == "unroll":
                        factor = int(dct_args.get("factor", 0))
                        if factor == 0:
                            factor = default_unroll_factor
                        enc_dct = [1, factor]
                    elif "off" not in dct_args:
                        enc_dct = [1]
                    break
            if enc_dct is not None:
                break
        if enc_dct is None:
            if dct_type == "array_partition":
                enc_dct = [0] * 8
            elif dct_type == "unroll":
                enc_dct = [0, 0]
            else:
                enc_dct = [0]
        encoded_dcts.extend(enc_dct)
        feat_names.extend(get_dct_feat_name(dct_type, label))

    encoded_dcts = np.array(encoded_dcts, dtype=np.int_)
    if return_feat_names:
        return encoded_dcts, feat_names
    return encoded_dcts


def percentage_diff(pred, target):
    pred, target = map(torch.as_tensor, (pred, target))
    avg = (torch.abs(pred) + torch.abs(target)) / 2
    return torch.where(
        target == 0, 
        torch.abs(pred - target) / (avg + 1e-8),  # Avoid division by zero
        torch.abs(pred - target) / torch.abs(target)
    ) * 100


def plot_learning_curves(
    train_errors: List[float], 
    test_errors: List[float], 
    output_path: str,
    best_epoch: Optional[int] = None
):
    num_epochs = len(train_errors)
    if num_epochs != len(test_errors):
        raise ValueError("Mismatch in number of training and test epochs")
    
    train_errors = list(map(lambda x: x / 100, train_errors))
    test_errors = list(map(lambda x: x / 100, test_errors))

    plt.figure(figsize=(12, 6), dpi=150)
    sns.set_style("whitegrid")

    df = pd.DataFrame({
        'Epoch': list(range(num_epochs)) * 2,
        'Error': train_errors + test_errors,
        'Type': ['Train'] * num_epochs + ['Test'] * num_epochs
    })
    ax = sns.lineplot(
        x='Epoch', y='Error', hue='Type', data=df, 
        palette={'Train': 'green', 'Test': 'red'}, 
        linewidth=2.5, marker='o'
    )
    plt.title(
        f'Training Progress (Final Test Error: {test_errors[-1]:.4f})', 
        fontsize=14
    )
    plt.xlabel('Epoch', fontsize=12)
    plt.ylabel('Mean Relative Error', fontsize=12)
    plt.legend()

    if best_epoch is not None:
        ax.axvline(best_epoch, color='blue', linestyle='--', alpha=0.7)
        ax.text(
            best_epoch, np.max(test_errors), 
            f'Best Epoch: {best_epoch}', color='blue', fontsize=10
        )
    if np.max(test_errors) / np.min(test_errors) > 100:
        plt.yscale('log')

    plt.tight_layout()
    plt.savefig(output_path, bbox_inches='tight', dpi=150)
    plt.close()


def plot_prediction_scatter(
    targets: List[float], 
    preds: List[float], 
    output_path: str,
    errors: Optional[Union[Tensor, List[float]]] = None,
    mean_error: Optional[float] = None
):
    max_val = max(max(targets), max(preds)) * 1.1
    min_val = min(min(targets), min(preds)) * 0.9

    plt.figure(figsize=(10, 10), dpi=150)
    sns.set_style("whitegrid")

    # Reference line for perfect prediction
    plt.plot(
        [min_val, max_val], [min_val, max_val], 'r--', 
        label='Perfect Prediction', alpha=0.7
    )
    # Regression line
    sns.regplot(
        x=targets, y=preds, scatter=False, color='blue', 
        label='Trend Line'
    )
    # Scatter plot
    sns.scatterplot(
        x=targets, y=preds, alpha=0.6, edgecolor='w', 
        label='Predictions'
    )

    if mean_error is None:
        if errors is None:
            errors = percentage_diff(preds, targets)
        mean_error = np.mean(errors)
            
    r2 = r2_score(targets, preds)
    plt.text(
        min_val*1.05, max_val*0.9, 
        f'Mean Relative Error: {mean_error:.2f}\nR²: {r2:.2f}', 
        bbox=dict(facecolor='white', alpha=0.8)
    )
    
    plt.title('Actual vs. Predicted Resource Usage', fontsize=14)
    plt.xlabel('Actual Values', fontsize=12)
    plt.ylabel('Predictions', fontsize=12)
    plt.legend()

    plt.tight_layout()
    plt.savefig(output_path, bbox_inches='tight', dpi=150)
    plt.close()


def plot_prediction_bars(
    targets: List[float],
    preds: List[float],
    indices: List[int],
    benchmark: str, 
    metric: str, 
    output_path: str,
    errors: Optional[Union[Tensor, List[float]]] = None,
    mean_error: Optional[float] = None
):
    """Plot per-benchmark instance-level predictions and errors"""
    num_instances = len(targets)
    if num_instances != len(preds) or num_instances != len(indices):
        raise ValueError("Mismatch in number of targets, predictions and indices")
    
    if errors is None:
        errors = [percentage_diff(p, t).item() for p, t in zip(preds, targets)]

    if mean_error is None:
        mean_error = np.mean(errors)

    df = pd.DataFrame({
        'index': indices,
        'target': targets,
        'prediction': preds,
        'error': errors
    })
    df = df.sort_values(by=['error'], ascending=True, ignore_index=True)

    _, ax = plt.subplots(figsize=(16, 6), dpi=180)
    sns.set_style("whitegrid")

    x = np.arange(num_instances)
    ax.bar(x, df['target'], color='blue', alpha=0.5, label='Targets')
    ax.bar(x, df['prediction'], color='darkorange', alpha=0.5, label='Predictions')

    max_val = max(df['target'].max(), df['prediction'].max())
    ax.set_ylim(0, max_val * 1.2)
    ax.set_xlim(x[0] - 1, x[-1] + 1)

    for i, row in df.iterrows():
        p, t, r = row['prediction'], row['target'], row['error']
        ax.text(
        	i, max(p, t) + 0.005 * max_val, f"{r:.2f}%", 
        	rotation=90, ha='center', fontsize=4, alpha=0.9
        )

    ax.grid(axis='y', linestyle='--', alpha=0.7)
    ax.set_xticks(x)
    ax.set_xticklabels(
        df['index'], rotation=90, ha='center', va='top', fontsize=4, alpha=0.9
    )

    ax.text(
        0.12, 0.95, f"Mean Relative Error: {mean_error:.2f}%", 
        transform=ax.transAxes, fontsize=11, ha='center'
    )
    ax.set_title(f"Predictions for {benchmark.upper()} ({metric.upper()})", fontsize=14)
    ax.set_xlabel('Instance Index', fontsize=12)
    ax.set_ylabel(f'{metric.upper()}', fontsize=12)
    ax.legend()

    plt.tight_layout()
    plt.savefig(output_path, bbox_inches='tight', dpi=180)
    plt.close()


def compute_snru(util_resources: Tensor, avail_resources: Tensor) -> Tensor:
    if util_resources.dim() == 1:
        util_resources = util_resources.unsqueeze(0)
    if avail_resources.dim() == 1:
        avail_resources = avail_resources.unsqueeze(0)
    if util_resources.size(1) != avail_resources.size(1):
        raise ValueError(
            f"Expected util_resources and avail_resources with same number of columns, "
            f"got {util_resources.size(1)} and {avail_resources.size(1)}"
        )
    snru = (torch.sum(util_resources / avail_resources, dim=1)
            / avail_resources.size(1))
    return snru * 100  # Convert to percentage


def compute_time(timing_metrics: Tensor) -> Tensor:
    if timing_metrics.dim() == 1:
        timing_metrics = timing_metrics.unsqueeze(0)
    if timing_metrics.size(1) != 2:
        raise ValueError(
            f"Expected timing metrics with 2 values, got {timing_metrics.size(1)}"
        )
    achieved_clk, cc = timing_metrics[:, 0], timing_metrics[:, 1]
    return achieved_clk * cc


def compute_power(power_metrics: Tensor) -> Tensor:
    if power_metrics.dim() == 1:
        power_metrics = power_metrics.unsqueeze(0)
    if power_metrics.size(1) != 2:
        raise ValueError(
            f"Expected power metrics with 2 values, got {power_metrics.size(1)}"
        )
    return torch.sum(power_metrics, dim=1)