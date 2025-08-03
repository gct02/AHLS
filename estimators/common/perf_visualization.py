import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.metrics import r2_score
from typing import List, Optional, Union
from torch import Tensor

from estimators.common.losses import mape_loss


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
        errors = [mape_loss(p, t).item() for p, t in zip(preds, targets)]

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
        r = r * 100  # Convert to percentage
        ax.text(
        	i, max(p, t) + 0.005 * max_val, f"{r:.2f}%", 
        	rotation=90, ha='center', fontsize=4, alpha=0.9
        )

    ax.grid(axis='y', linestyle='--', alpha=0.7)
    ax.set_xticks(x)
    ax.set_xticklabels(
        df['index'], rotation=90, ha='center', va='top', fontsize=4, alpha=0.9
    )

    mean_error = mean_error * 100  # Convert to percentage
    ax.text(
        0.12, 0.95, f"MAPE: {mean_error:.2f}%", 
        transform=ax.transAxes, fontsize=11, ha='center'
    )
    ax.set_title(f"Predictions for {benchmark.upper()} ({metric.upper()})", fontsize=14)
    ax.set_xlabel('Instance Index', fontsize=12)
    ax.set_ylabel(f'{metric.upper()}', fontsize=12)
    ax.legend()

    plt.tight_layout()
    plt.savefig(output_path, bbox_inches='tight', dpi=180)
    plt.close()


def plot_learning_curves(
    train_errors: List[float], 
    test_errors: List[float], 
    output_path: str
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
    plt.ylabel('MAPE', fontsize=12)
    plt.legend()

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
            errors = mape_loss(preds, targets).tolist()
        else:
            errors = errors.tolist()
        mean_error = np.mean(errors)
            
    r2 = r2_score(targets, preds)
    plt.text(
        min_val*1.05, max_val*0.9, 
        f'MAPE: {mean_error:.4f}\nR²: {r2:.4f}', 
        bbox=dict(facecolor='white', alpha=0.8)
    )
    
    plt.title('Actual vs. Predicted Resource Usage', fontsize=14)
    plt.xlabel('Actual Values', fontsize=12)
    plt.ylabel('Predictions', fontsize=12)
    plt.legend()

    plt.tight_layout()
    plt.savefig(output_path, bbox_inches='tight', dpi=150)
    plt.close()