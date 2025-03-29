import os
import sys
import argparse
import random
import shutil
import gc
from pathlib import Path
from typing import List, Dict, Tuple, Optional, Union

import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
import pandas as pd
import torch
import torch.nn as nn
from sklearn.metrics import r2_score
from torch_geometric.loader import DataLoader


def save_model(model, save_dir, model_name):
    os.makedirs(save_dir, exist_ok=True)
    torch.save(obj=model.state_dict(), f=f"{save_dir}/{model_name}")


def relative_percent_diff(pred, target):
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
    loss_fn: Optional[nn.Module] = None,
    mode: str = 'test'
) -> Union[float, List[Tuple[float, float]]]:
    if verbosity > 0:
        print(f"\nEvaluating on {mode} set\n")

    preds, targets = [], []
    
    # Assumption: Only one instance per batch
    for i, batch in enumerate(loader):
        torch.cuda.empty_cache()

        pred = model(batch.to(DEVICE))
        target = batch.y

        batch, pred, target = batch.cpu(), pred.cpu(), target.cpu()
        preds.append(pred)
        targets.append(target)

        if log_dir:
            with open(f"{log_dir}/{mode}.log", 'a') as log_file:
                log_file.write(f"{epoch},{i},{target.item()},{pred.item()}\n")

        if verbosity > 0:
            print(f"Instance {i}: Target: {target.item()}; Prediction: {pred.item()}")

    preds = torch.cat(preds)
    targets = torch.cat(targets)

    if verbosity > 0:
        mre = mre(preds, targets).mean().item()
        if mre < evaluate.min_mre:
            evaluate.min_mre = mre
            evaluate.best_epoch = epoch

        print(f"MRE on {mode} set: {mre:.2f}% (Min: "
              + f"{evaluate.min_mre:.2f}% at epoch {evaluate.best_epoch})")

    pred_target_pairs = list(zip(preds.tolist(), targets.tolist()))

    if loss_fn:
        loss = loss_fn(preds, targets).item()
        return loss, pred_target_pairs
    
    return pred_target_pairs


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
    collect_residuals: bool = False
):
    if collect_residuals and not log_dir:
        raise ValueError("log_dir must be provided to collect residuals")
    
    preds_per_epoch = [[] for _ in range(len(test_loader))]
    train_errors = []
    for epoch in range(epochs):
        preds, targets = [], []
        if verbosity > 0:
            print(f"Epoch {epoch + 1}/{epochs}\n")
        
        model.train()
        for batch in train_loader:
            torch.cuda.empty_cache()
            optimizer.zero_grad()
            pred = model(batch.to(DEVICE))
            target = batch.y

            loss_fn(pred, target).backward()
            optimizer.step()
            if scheduler:
                scheduler.step()

            batch, pred, target = batch.cpu(), pred.cpu(), target.cpu()
            targets.append(target)
            preds.append(pred)
            if verbosity > 1:
                print(f"Target: {target.tolist()}; Prediction: {pred.tolist()}")

        targets = torch.cat(targets)
        preds = torch.cat(preds)
        train_errors.append(relative_percent_diff(preds, targets).mean().item())

        if collect_residuals:
            residuals = (targets - preds).tolist()
            targets, preds = targets.tolist(), preds.tolist()
            with open(f"{log_dir}/train.log", 'a') as log_file:
                for t, p, r in zip(targets, preds, residuals):
                    log_file.write(f"{epoch},{t},{p},{r}\n")

        model.eval()
        with torch.no_grad():
            preds = evaluate(epoch, model, test_loader, verbosity, log_dir)
            for i, p in enumerate(preds):
                preds_per_epoch[i].append(p)

    return preds_per_epoch, train_errors


def main(args: Dict[str, str]):
    epochs = int(args['epoch'])
    batch_size = int(args['batch'])
    seed = int(args['seed'])
    loss = args['loss']
    residual = float(args['residual'])
    collect_residuals = args['collect_residuals']
    dataset_dir = args['dataset_dir']
    target_metric = args['target']
    test_bench = args['testbench']
    verbosity = int(args['verbose'])
    separate_data = args['separate_data']
    source_data_dir = args['source_data']

    matplotlib.use('Agg')

    # torch.backends.cudnn.benchmark = True
    torch.set_printoptions(
        precision=6, threshold=1000, edgeitems=20, linewidth=200, sci_mode=False
    )
    # Set random seeds for reproducibility
    set_random_seeds(seed)

    base_analysis_dir = f"{Path(sys.argv[0]).parent}/analysis/model"
    base_pretrained_dir = f"{Path(sys.argv[0]).parent}/pretrained"
    benchmarks = sorted(os.listdir(dataset_dir))

    train_benches = [b for b in benchmarks if b != test_bench]
    train_loader, test_loader = prepare_data_loaders(
        target_metric, test_bench, train_benches, batch_size,
        separate_data=separate_data, source_data_dir=source_data_dir
    )
    metadata = (NODE_TYPES + BASE_METRICS_NODE_TYPES,
                EDGE_TYPES + BASE_METRICS_EDGE_TYPES)
    
    model = HGT(
        metadata, NODE_FEATURE_DIMS, 1, 
        n_layers=6, hid_dim=128, n_heads=8,
        dropout=0.1, device=DEVICE
    )

    if loss == 'huber':
        loss_fn = nn.HuberLoss(delta=residual)
    elif loss == 'mse':
        loss_fn = nn.MSELoss()
    elif loss == 'mae':
        loss_fn = nn.L1Loss()
    else:
        raise ValueError(f"Unknown loss function: {loss}")

    optimizer = torch.optim.AdamW(
        model.parameters(), lr=3e-4, betas=(0.9, 0.999), weight_decay=5e-4
    )

    total_steps = epochs * len(train_loader)
    scheduler = torch.optim.lr_scheduler.CosineAnnealingWarmRestarts(
        optimizer, T_0=total_steps // 10, T_mult=2, eta_min=1e-6
    )

    analysis_dir, stats_dir, graphs_dir, save_dir = make_output_dirs(
        base_analysis_dir, base_pretrained_dir, test_bench, target_metric
    )

    preds_per_epoch, train_errors = train_model(
        model, loss_fn, optimizer, train_loader, test_loader, epochs, 
        scheduler=scheduler, verbosity=verbosity, log_dir=analysis_dir, 
        collect_residuals=collect_residuals
    )

    plot_prediction_bars(
        preds_per_epoch, test_bench, target_metric, graphs_dir
    )
    save_training_artifacts(
        train_errors, preds_per_epoch, stats_dir, graphs_dir
    )
    save_model(model, save_dir, f"{test_bench}_{target_metric}.pth")


def plot_learning_curves(
    train_errors: List[float], 
    test_errors: List[float], 
    save_path: str
):
    n_epochs = len(train_errors)
    if n_epochs != len(test_errors):
        raise ValueError("Mismatch in number of training and test epochs")

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
    plt.ylabel('Huber Loss', fontsize=12)
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
    plt.savefig(save_path, bbox_inches='tight')
    plt.close()


def plot_prediction_scatter(
    preds_per_epoch: List[List[Tuple[float, float]]],
    save_path: str, epoch: int = -1
):
    targets = [inst[0][1] for inst in preds_per_epoch]
    preds = [inst[epoch][0] for inst in preds_per_epoch]
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

    mre = mre(torch.tensor(preds), torch.tensor(targets)).mean().item()
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
    plt.savefig(save_path)
    plt.close()


def plot_prediction_bars(
    preds_per_epoch: List[List[Tuple[float, float]]],
    test_bench: str, metric: str, save_dir: str
):
    """Plot per-benchmark instance-level predictions and errors"""
    best_epoch = np.argmin(get_mre_over_epochs(preds_per_epoch))
    indices = list(range(len(preds_per_epoch)))
    targets = [inst[0][1] for inst in preds_per_epoch]
    preds = [inst[best_epoch][0] for inst in preds_per_epoch]
    rel_errors = [mre(p, t).item() for p, t in zip(preds, targets)]
    mre = np.mean(rel_errors)

    df = pd.DataFrame({
        'index': indices,
        'target': targets,
        'prediction': preds,
        'relative_error': rel_errors
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
    ax.set_title(f"Predictions for {test_bench.upper()} ({metric.title()})", fontsize=14)
    ax.set_xlabel('Instance Index', fontsize=12)
    ax.set_ylabel(f'{metric.title()}', fontsize=12)
    ax.legend()

    plt.tight_layout()
    plt.savefig(f"{save_dir}/test_results_bars.png")
    plt.close()


def save_training_artifacts(
    train_error: List[float], 
    preds_per_epoch: List[List[Tuple[float, float]]],
    stats_dir: str, graphs_dir: str
):
    n_epochs = len(train_error)
    errors = get_mre_over_epochs(preds_per_epoch)
    if n_epochs != len(errors):
        raise ValueError("Mismatch in number of training and test epochs")
    
    # Save metrics
    metrics_df = pd.DataFrame({
        'epoch': list(range(n_epochs)),
        'train_error': train_error,
        'test_error': errors
    })
    metrics_df.to_csv(f"{stats_dir}/metrics.csv", index=False)
    best_epoch = np.argmin(errors)

    # Save predictions with metadata
    predictions_df = pd.DataFrame([
        {
            'instance': i,
            'target': inst[0][1],
            'preds': [p[0] for p in inst],
            'final_pred': inst[-1][0],
            'best_pred': inst[best_epoch][0],
            'final_error': relative_percent_diff(inst[-1][0], inst[0][1]),
            'min_error': relative_percent_diff(inst[best_epoch][0], inst[0][1])
        }
        for i, inst in enumerate(preds_per_epoch)
    ])
    predictions_df.to_csv(f"{stats_dir}/test_results.csv", index=False)
    plot_learning_curves(train_error, errors, f"{graphs_dir}/learning_curve.png")
    plot_prediction_scatter(preds_per_epoch, f"{graphs_dir}/test_results_scatter.png", epoch=best_epoch)

    # Add error distribution plot
    plt.figure(figsize=(10, 6))
    sns.histplot(predictions_df['min_error'], kde=True)
    plt.title('Absolute Error Distribution')
    plt.savefig(f"{graphs_dir}/error_distribution.png")
    plt.close()


def get_mean_rel_error(
    test_preds: List[List[Tuple[float, float]]], epoch: int
) -> float:
    targets = torch.tensor([inst[0][1] for inst in test_preds])
    preds = torch.tensor([inst[epoch][0] for inst in test_preds])
    return relative_percent_diff(preds, targets).mean().item()


def get_mre_over_epochs(
    preds_per_epoch: List[List[Tuple[float, float]]]
) -> List[float]:
    mre_list = []
    for epoch in range(len(preds_per_epoch[0])):
        targets = torch.tensor([inst[0][1] for inst in preds_per_epoch])
        preds_per_epoch = torch.tensor([inst[epoch][0] for inst in preds_per_epoch])
        mre = mre(preds_per_epoch, targets).mean().item()
        mre_list.append(mre)
    return mre_list
    

def set_random_seeds(seed: int):
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    np.random.seed(seed)
    random.seed(seed)


def make_output_dirs(
    base_analysis_dir: str, base_pretrained_dir: str,
    test_bench: str, metric: str
) -> Tuple[str, str, str, str]:
    if not os.path.exists(base_analysis_dir):
        os.makedirs(base_analysis_dir)
    if not os.path.exists(base_pretrained_dir):
        os.makedirs(base_pretrained_dir)

    metric_dir = f"{base_analysis_dir}/{metric}"
    if not os.path.exists(metric_dir):
        os.makedirs(metric_dir)

    tb_dir = f"{metric_dir}/{test_bench}"
    if not os.path.exists(tb_dir):
        os.makedirs(tb_dir)
        run = 1
    else:
        run = get_current_run_number(tb_dir)

    analysis_dir = f"{tb_dir}/run_{run}"
    stats_dir = f"{analysis_dir}/stats"
    graphs_dir = f"{analysis_dir}/graphs"
    pretrained_dir = f"{base_pretrained_dir}/{metric}/{test_bench}"

    os.makedirs(stats_dir, exist_ok=True)
    os.makedirs(graphs_dir, exist_ok=True)
    os.makedirs(pretrained_dir, exist_ok=True)

    return analysis_dir, stats_dir, graphs_dir, pretrained_dir


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
    metric: str,
    test_bench: str,
    train_benches: Union[List[str], str],
    batch_size: int = 16,
    separate_data: bool = False,
    source_data_dir: Optional[str] = None
) -> Tuple[DataLoader, DataLoader, DataLoader]:
    dataset_dir = f"{Path(sys.argv[0]).parent}/dataset"
    train_dir = f"{dataset_dir}/train"
    test_dir = f"{dataset_dir}/test"
    if separate_data:
        data_dirs = [
            f"{train_dir}/raw", f"{test_dir}/raw", 
            f"{train_dir}/processed", f"{test_dir}/processed"
        ]
        cleanup_dirs(data_dirs, recreate=True)
    train_data = HLSDataset(
        train_dir, metric, separate_data=separate_data, 
        source_data_dir=source_data_dir, 
        benchmarks=train_benches
    )
    test_data = HLSDataset(
        test_dir, metric, separate_data=separate_data,  
        source_data_dir=source_data_dir, 
        benchmarks=test_bench,
    )
    train_loader = DataLoader(train_data, batch_size=batch_size, shuffle=True)
    test_loader = DataLoader(test_data, batch_size=1, shuffle=False)
    return train_loader, test_loader


def cleanup_dirs(dirs: List[str], recreate: bool = False):
    for dir in dirs:
        if os.path.exists(dir):
            shutil.rmtree(dir)
        if recreate:
            os.makedirs(dir)


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument('--dataset', required=True, 
                        help='Path to the dataset.')
    parser.add_argument('--epoch', default=300, 
                        help='The number of training epochs (default: 300).')
    parser.add_argument('--seed', default=42, 
                        help='Random seed for repeatability (default: 42).')
    parser.add_argument('--batch', default=16, 
                        help='The size of the training batch (default: 16).')
    parser.add_argument('--loss', default='huber', choices=['huber', 'mse', 'mae'],
                        help='The loss function to use for training (default: Huber loss).')
    parser.add_argument('--testbench', required=True, 
                        help='The name of the benchmark to use for test.')
    parser.add_argument('--source-data', default=None,
                        help='Path to the source dataset folder (i.e., the dataset containing the original HLS solutions).')
    parser.add_argument('--filtered', action='store_true',
                        help='Signal that the (raw) dataset is filtered')
    parser.add_argument('--collect-residuals', action='store_true',
                        help='Collect residuals for analysis.')
    parser.add_argument('--residual', default=1.0, 
                        help='The standard deviation of the residual from previous training (default: 1.0).')
    parser.add_argument('--target', required=True, choices=['lut', 'ff', 'dsp', 'bram', 'cp'],
                        help='The target resource metric.')
    parser.add_argument('--separate-data', action='store_true',
                        help='Separate the training and test data into raw and processed directories.')
    parser.add_argument('--verbose', nargs='?', const=1, type=int, default=0, 
                        help='Set verbosity level (default: 0). Use without value for level 1, or specify a level.')
    return vars(parser.parse_args())

if __name__ == '__main__':
    import sys

    if __package__ is None:                  
        DIR = Path(__file__).resolve().parent
        sys.path.insert(0, str(DIR.parent))
        sys.path.insert(0, str(DIR.parent.parent))
        __package__ = DIR.name 

    from estimators.models import HGT
    from estimators.dataset import HLSDataset
    from estimators.graph import (
        NODE_TYPES, EDGE_TYPES,
        BASE_METRICS_NODE_TYPES,
        BASE_METRICS_EDGE_TYPES, 
        NODE_FEATURE_DIMS
    )

    gc.collect()
    DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')
    args = parse_arguments()
    main(args)
