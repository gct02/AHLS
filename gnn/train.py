import os
import argparse
import random
from collections import defaultdict
from typing import List, Dict, Tuple, Optional, Union

import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
import pandas as pd
import torch
import torch.nn as nn
from torch.nn.utils import clip_grad_norm_
from sklearn.metrics import r2_score
from torch_geometric.loader import DataLoader

from gnn.models import HGT
from gnn.dataset import HLSDataset
from gnn.data.graph import (
    METADATA, DIRECTIVE_SUBSET_METADATA,
    NODE_FEATURE_DIMS
)


DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')
# DEVICE = torch.device('cpu')


PredTargetPair = Tuple[
    Union[float, torch.Tensor], 
    Union[float, torch.Tensor]
]


def save_model(model, output_dir, model_name):
    os.makedirs(output_dir, exist_ok=True)
    torch.save(obj=model.state_dict(), f=f"{output_dir}/{model_name}")


def mape(pred, target):
    pred, target = map(torch.as_tensor, (pred, target))
    avg = (torch.abs(pred) + torch.abs(target)) / 2
    return torch.where(
        target == 0, 
        torch.abs(pred - target) / avg, 
        torch.abs(pred - target) / torch.abs(target)
    ) * 100


def static_vars(**kwargs):
    def decorate(func):
        for k in kwargs:
            setattr(func, k, kwargs[k])
        return func
    return decorate


@static_vars(min_mre=1e10, best_epoch=0)
def evaluate(
    epoch: int,
    model: nn.Module,
    loader: DataLoader,
    verbosity: int = 1,
    log_dir: Optional[str] = None,
    mode: str = 'test',
    log_transformed: bool = False
) -> List[Tuple[float, float]]:
    if verbosity > 1:
        print(f"\nEvaluating on {mode} set\n")

    preds, targets = [], []
    
    # Assumption: Only one instance per batch
    for batch in loader:
        batch = batch.to(DEVICE)
        pred = model(batch)
        preds.append(pred.item())
        targets.append(batch.y.item())

    if log_dir:
        with open(f"{log_dir}/{mode}.log", 'a') as f:
            for p, t in zip(preds, targets):
                f.write(f"{epoch},{t},{p},{t-p}\n")

    if log_transformed:
        preds, targets = np.expm1(preds), np.expm1(targets)

    mre = mape(torch.tensor(preds), torch.tensor(targets)).mean().item()
    if mre < evaluate.min_mre:
        evaluate.min_mre = mre
        evaluate.best_epoch = epoch

    results = list(zip(preds, targets))

    if verbosity > 0:
        for p, t in results:
            print(f"Target: {t}; Prediction: {p}")
            
        print(f"\nMRE on {mode} set: {mre:.2f}%")
        print(f"Best MRE so far: {evaluate.min_mre:.2f}% at epoch {evaluate.best_epoch}\n")
    
    return results


def train_model(
    model: nn.Module,
    loss_fn: nn.Module,
    optimizer: torch.optim.Optimizer,
    train_loader: DataLoader,
    test_loader: DataLoader,
    epochs: int,
    scheduler: Optional[torch.optim.lr_scheduler.LRScheduler] = None,
    verbosity: int = 1,
    log_dir: Optional[str] = None,
    log_transformed: bool = False,
) -> Dict[str, List[List[Tuple[float, float]]]]:
    results = defaultdict(list)

    for epoch in range(1, epochs + 1):
        torch.cuda.empty_cache()
        if verbosity > 0:
            print(f"Epoch {epoch}/{epochs}\n")

        preds, targets = [], []
                
        model.train()
        for batch in train_loader:
            optimizer.zero_grad()
            batch = batch.to(DEVICE)
            pred = model(batch)
            target = batch.y
            loss = loss_fn(pred, target)
            loss.backward()
            clip_grad_norm_(model.parameters(), max_norm=10.0)

            optimizer.step()

            if scheduler is not None:
                scheduler.step()

            pred, target = pred.tolist(), target.tolist()
            preds.extend(pred)
            targets.extend(target)

            if verbosity > 1:
                if log_transformed:
                    pred, target = np.expm1(pred), np.expm1(target)
                for p, t in zip(pred, target):
                    print(f"Target: {t}; Prediction: {p}")

        if log_dir:
            with open(f"{log_dir}/train.log", 'a') as f:
                for p, t in zip(preds, targets):
                    f.write(f"{epoch},{t},{p},{t-p}\n")

        if log_transformed:
            preds, targets = np.expm1(preds), np.expm1(targets)

        results['train'].append(list(zip(preds, targets)))

        model.eval()
        with torch.no_grad():
            test_results = evaluate(
                epoch, model, test_loader, 
                verbosity=verbosity, log_dir=log_dir, 
                log_transformed=log_transformed
            )
            results['test'].append(test_results)

    return results


def main(args: Dict[str, str]):
    dataset_dir = args['dataset_dir']
    target_metric = args['target']
    test_bench = args['testbench']
    epochs = int(args['epoch'])
    batch_size = int(args['batch'])
    seed = int(args['seed'])
    output_dir = args['output_dir']
    verbosity = int(args['verbose'])
    loss = args['loss']
    log_transform = args['log_transform']
    residual = float(args['residual'])

    matplotlib.use('Agg')

    # torch.backends.cudnn.benchmark = True
    torch.set_printoptions(
        precision=6, threshold=1000, edgeitems=20, linewidth=200, sci_mode=False
    )
    set_random_seeds(seed)

    full_data_dir = f"{dataset_dir}/full"
    benchmarks = sorted(os.listdir(full_data_dir))
    train_benches = [b for b in benchmarks if b != test_bench]

    analysis_dir, pretrained_dir = make_output_dirs(output_dir, test_bench, target_metric)

    train_loader, test_loader = prepare_data_loaders(
        dataset_dir, target_metric, test_bench, train_benches, 
        batch_size=batch_size, log_transform=log_transform
    )

    hid_dim = [512, 512]
    heads = [8, 8]
    num_layers = len(hid_dim)
    proj_in_dim = 512
    
    model = HGT(
        METADATA, DIRECTIVE_SUBSET_METADATA, NODE_FEATURE_DIMS, 1,
        hid_dim=hid_dim, heads=heads, 
        num_layers=num_layers, proj_in_dim=proj_in_dim
    ).to(DEVICE)

    if loss == 'mse':
        loss_fn = nn.MSELoss()
    elif loss == 'huber':
        loss_fn = nn.HuberLoss(delta=1.5*residual)
    elif loss == 'l1':
        loss_fn = nn.L1Loss()
    else:
        raise ValueError(f"Unknown loss function: {loss}")

    optimizer = torch.optim.AdamW(
        model.parameters(), lr=3e-4, betas=(0.9, 0.95), weight_decay=5e-4
    )

    total_steps = epochs * len(train_loader)
    scheduler = torch.optim.lr_scheduler.CosineAnnealingWarmRestarts(
        optimizer, T_0=total_steps // 10, T_mult=2, eta_min=1e-5
    )

    results = train_model(
        model, loss_fn, optimizer, train_loader, test_loader, epochs, 
        scheduler=scheduler, verbosity=verbosity, log_dir=analysis_dir,
        log_transformed=log_transform
    )
    plot_prediction_bars(results["test"], test_bench, target_metric, analysis_dir)
    save_training_artifacts(results, analysis_dir)
    save_model(model, pretrained_dir, f"{test_bench}_{target_metric}.pth")


def plot_learning_curves(
    train_errors: List[float], 
    test_errors: List[float], 
    output_path: str
):
    n_epochs = len(train_errors)
    if n_epochs != len(test_errors):
        raise ValueError("Mismatch in number of training and test epochs")
    
    train_errors = list(map(lambda x: x / 100, train_errors))
    test_errors = list(map(lambda x: x / 100, test_errors))

    plt.figure(figsize=(12, 6), dpi=150)
    sns.set_style("whitegrid")

    df = pd.DataFrame({
        'Epoch': list(range(n_epochs)) * 2,
        'Loss': train_errors + test_errors,
        'Type': ['Train'] * n_epochs + ['Test'] * n_epochs
    })
    ax = sns.lineplot(
        x='Epoch', y='Loss', hue='Type', data=df, 
        palette={'Train': 'green', 'Test': 'red'}, 
        linewidth=2.5, marker='o'
    )
    plt.title(f'Training Progress (Final Test Loss: {test_errors[-1]:.4f})', fontsize=14)
    plt.xlabel('Epoch', fontsize=12)
    plt.ylabel('MRE', fontsize=12)
    plt.legend()

    best_epoch = np.argmin(test_errors)
    ax.axvline(best_epoch, color='blue', linestyle='--', alpha=0.7)
    ax.text(
        best_epoch + 0.5, np.max(test_errors), f'Best Epoch: {best_epoch}', 
        color='blue', fontsize=10
    )
    if np.max(test_errors) / np.min(test_errors) > 100:
        plt.yscale('log')

    plt.tight_layout()
    plt.savefig(output_path, bbox_inches='tight', dpi=150)
    plt.close()


def plot_prediction_scatter(
    targets: List[float], preds: List[float], output_path: str,
    errors: Optional[Union[List[float], torch.Tensor]] = None,
    mre: Optional[float] = None
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
        x=targets, y=preds, scatter=False, color='blue', label='Trend Line'
    )
    # Scatter plot
    sns.scatterplot(x=targets, y=preds, alpha=0.6, edgecolor='w', label='Predictions')

    if mre is None:
        if errors is None:
            errors = mape(preds, targets)
        mre = np.mean(errors)
            
    r2 = r2_score(targets, preds)
    plt.text(
        min_val*1.05, max_val*0.9, f'Mean Relative Error: {mre:.2f}\nR²: {r2:.2f}', 
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
    test_results: List[List[PredTargetPair]],
    benchmark: str, metric: str, output_dir: str
):
    """Plot per-benchmark instance-level predictions and errors"""
    best_epoch = evaluate.best_epoch

    targets = [r[1] for r in test_results[best_epoch]]
    preds = [r[0] for r in test_results[best_epoch]]
    errors = [mape(p, t).item() for p, t in zip(preds, targets)]

    indices = list(range(len(targets)))
    mre = evaluate.min_mre

    df = pd.DataFrame({
        'index': indices,
        'target': targets,
        'prediction': preds,
        'relative_error': errors
    })
    df = df.sort_values(by=['relative_error'], ascending=True, ignore_index=True)

    _, ax = plt.subplots(figsize=(16, 6), dpi=180)
    sns.set_style("whitegrid")

    ax.bar(indices, df['target'], color='blue', alpha=0.5, label='Targets')
    ax.bar(indices, df['prediction'], color='darkorange', alpha=0.5, label='Predictions')

    max_val = max(df['target'].max(), df['prediction'].max())
    ax.set_ylim(0, max_val * 1.2)
    ax.set_xlim(indices[0] - 1, indices[-1] + 1)

    for i, row in df.iterrows():
        p, t, r = row['prediction'], row['target'], row['relative_error']
        ax.text(
        	i, max(p, t) + 0.005 * max_val, f"{r:.2f}%", 
        	rotation=90, ha='center', fontsize=4, alpha=0.9
        )

    ax.grid(axis='y', linestyle='--', alpha=0.7)
    ax.set_xticks(indices)
    ax.set_xticklabels(
        df['index'], rotation=90, ha='center', va='top', fontsize=4, alpha=0.9
    )
    ax.text(
        0.12, 0.95, f"Mean Relative Error: {mre:.2f}%", 
        transform=ax.transAxes, fontsize=11, ha='center'
    )
    ax.set_title(f"Predictions for {benchmark.upper()} ({metric.title()})", fontsize=14)
    ax.set_xlabel('Instance Index', fontsize=12)
    ax.set_ylabel(f'{metric.title()}', fontsize=12)
    ax.legend()

    plt.tight_layout()
    plt.savefig(f"{output_dir}/test_results_bars.png")
    plt.close()


def save_training_artifacts(
    results: Dict[str, List[List[PredTargetPair]]],
    output_dir: str,
):
    train_errors, test_errors = [], []

    for train_results, test_results in zip(results['train'], results['test']):
        train_errors.append(np.mean([mape(p, t) for p, t in train_results]))
        test_errors.append(np.mean([mape(p, t) for p, t in test_results]))

    best_epoch = evaluate.best_epoch
    test_results = results['test']

    targets = [r[1] for r in test_results[0]]
    preds = [r[0] for r in test_results[best_epoch]]
    errors = [mape(p, t).item() for p, t in zip(preds, targets)]

    plot_learning_curves(train_errors, test_errors, f"{output_dir}/learning_curve.png")
    plot_prediction_scatter(targets, preds, f"{output_dir}/test_results_scatter.png", errors=errors)
    

def set_random_seeds(seed: int):
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    np.random.seed(seed)
    random.seed(seed)


def make_output_dirs(root_dir, test_bench, metric) -> Tuple[str, str]:
    base_run_info_dir = f"{root_dir}/run_info"
    base_pretrained_dir = f"{root_dir}/pretrained"

    if not os.path.exists(base_run_info_dir):
        os.makedirs(base_run_info_dir)
    if not os.path.exists(base_pretrained_dir):
        os.makedirs(base_pretrained_dir)

    metric_dir = f"{base_run_info_dir}/{metric}"
    if not os.path.exists(metric_dir):
        os.makedirs(metric_dir)

    tb_dir = f"{metric_dir}/{test_bench}"
    if not os.path.exists(tb_dir):
        os.makedirs(tb_dir)
        run = 1
    else:
        run = get_current_run_number(tb_dir)

    run_info_dir = f"{tb_dir}/run_{run}"
    pretrained_dir = f"{base_pretrained_dir}/{metric}/{test_bench}"

    os.makedirs(run_info_dir, exist_ok=True)
    os.makedirs(pretrained_dir, exist_ok=True)

    return run_info_dir, pretrained_dir


def get_current_run_number(results_directory: str) -> int:
    if not os.path.exists(results_directory):
        return 1
    files = os.listdir(results_directory)
    runs = [
        int(f.split('_')[-1])
        for f in files if f.startswith('run_') and f.split('_')[-1].isdigit()
    ]
    return max(runs) + 1 if runs else 1


def prepare_data_loaders(
    dataset_dir: str,
    metric: str,
    test_benchmarks: Union[List[str], str],
    train_benchmarks: Union[List[str], str],
    batch_size: int = 16,
    log_transform: bool = False
) -> Tuple[DataLoader, DataLoader]:
    train_data = HLSDataset(
        dataset_dir, metric, mode="train", scale_features=True, 
        benchmarks=train_benchmarks, log_transform=log_transform
    )
    test_data = HLSDataset(
        dataset_dir, metric, mode="test", scale_features=True,
        feature_ranges=train_data.feature_ranges,
        benchmarks=test_benchmarks,log_transform=log_transform
    )
    train_loader = DataLoader(train_data, batch_size=batch_size, shuffle=True)
    test_loader = DataLoader(test_data, batch_size=1, shuffle=False)

    return train_loader, test_loader


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--dataset-dir', required=True, 
                        help='The root directory of the dataset.')
    parser.add_argument('-e', '--epoch', default=300, 
                        help='The number of training epochs (default: 300).')
    parser.add_argument('-s', '--seed', default=42, 
                        help='Random seed for repeatability (default: 42).')
    parser.add_argument('-b', '--batch', default=16, 
                        help='The size of the training batch (default: 16).')
    parser.add_argument('-l', '--loss', default='mse', choices=['mse', 'l1', 'huber'],
                        help='The loss function to use for training (default: mse).')
    parser.add_argument('-lt', '--log-transform', action='store_true',
                        help='Apply log transformation to the target variable.')
    parser.add_argument('-tb', '--testbench', required=True, 
                        help='The name of the benchmark to use for test.')
    parser.add_argument('-t', '--target', required=True, choices=['lut', 'ff', 'dsp', 'bram', 'cp', 'power', 'snru'],
                        help='The target metric.')
    parser.add_argument('-v', '--verbose', nargs='?', const=1, type=int, default=0, 
                        help='Set verbosity level (default: 0). Use without value for level 1, or specify a level.')
    parser.add_argument('-r', '--residual', default=1.0, type=float,
                        help='A measure of variability (e.g., standard deviation or MAD) of the residuals for Huber loss (default: 1.0).')
    parser.add_argument('-o', '--output-dir', default='.',
                        help='Directory to save the output files (default: current directory).')
    return vars(parser.parse_args())

if __name__ == '__main__':
    args = parse_arguments()
    main(args)