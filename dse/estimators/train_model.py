from typing import List, Dict, Tuple, Optional, Union

import os
import argparse
import random
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
import pandas as pd
import torch
import torch.nn as nn
from pathlib import Path
from torch.utils.data import DataLoader
from sklearn.metrics import r2_score
from matplotlib.cm import RdYlGn

from dse.estimators.gnn import HGT
from dse.estimators.data.dataset import HLSDataset
from dse.estimators.data.cdfg import (
    INST_FEATURE_SIZE, VAR_FEATURE_SIZE, 
    CONST_FEATURE_SIZE, ARRAY_FEATURE_SIZE
)

DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

def save_model(model, target_dir, model_name):
    target_dir_path = Path(target_dir)
    target_dir_path.mkdir(parents=True, exist_ok=True)
    assert model_name.endswith(".pth") or model_name.endswith(".pt"), \
        "model_name should end with '.pt' or '.pth'"
    model_save_path = target_dir_path / model_name
    print(f"[INFO] Saving model to: {model_save_path}")
    torch.save(obj=model.state_dict(), f=model_save_path)
    

def evaluate(
    model: nn.Module,
    loader: DataLoader,
    loss_func: nn.Module,
    verbosity: int,
    mode: str,
    return_preds: bool = False
) -> Tuple[float, Optional[List[List[Tuple[float, float]]]]]:
    loss_epoch = 0
    preds_all = []

    if verbosity > 0:
        print(f"\nEvaluating on {mode} set\n")

    # Assumption: Only one instance per batch
    for input_batch, target_batch in loader:
        preds_batch = []

        cdfg = input_batch[0].to(DEVICE)
        pred = model(cdfg)
        target = target_batch[0].to(DEVICE)
        loss = loss_func(pred, target)

        loss_epoch += loss.item()
        if return_preds:
            preds_batch.append((pred.item(), target.item()))

        if verbosity > 0:
            print(f"Target: {target.item()}; Prediction: {pred.item()}; Loss: {loss.item()}")

        cdfg, target, pred = cdfg.cpu(), target.cpu(), pred.cpu()
        preds_all.append(preds_batch) if return_preds else None

    loss_epoch /= len(loader)
    if verbosity > 0:
        print(f"Loss on {mode} set: {loss_epoch}\n")

    return (loss_epoch, preds_all) if return_preds else (loss_epoch, None)


def train_model(
    model: nn.Module,
    loss_func: nn.Module,
    optimizer: torch.optim.Optimizer,
    train_loader: DataLoader,
    test_loader: DataLoader,
    val_loader: DataLoader,
    epochs: int,
    scheduler: Optional[torch.optim.lr_scheduler._LRScheduler] = None,
    verbosity: int = 1
) -> Tuple[List[float], List[float], List[List[Tuple[float, float]]]]:
    train_losses, test_losses = [], []
    num_batches = len(train_loader)
    num_instances = len(test_loader)
    test_preds_inst = [[] for _ in range(num_instances)]

    for epoch in range(epochs):
        train_loss_epoch = 0
        if verbosity > 0:
            print(f"Epoch {epoch + 1}/{epochs}\n")

        # ********** Training ********** #
        model.train()
        for i, (input_batch, target_batch) in enumerate(train_loader):
            batch_loss = 0
            optimizer.zero_grad()

            for cdfg, target in zip(input_batch, target_batch):
                cdfg, target = cdfg.to(DEVICE), target.to(DEVICE)

                pred = model(cdfg)
                loss = loss_func(pred, target)
                loss.backward()

                # Move tensors back to CPU to free GPU memory
                cdfg, target, pred = cdfg.cpu(), target.cpu(), pred.cpu()

                if verbosity > 0:
                    batch_loss += loss.item()
                    if verbosity > 1:
                        print(f"Target: {target.item()}; Prediction: {pred.item()}; Loss: {loss.item()}")

            optimizer.step()

            batch_loss /= len(input_batch)
            train_loss_epoch += batch_loss

            if verbosity > 0:
                print(f"Loss on train batch {i}: {batch_loss}")

        train_loss_epoch /= num_batches
        train_losses.append(train_loss_epoch)

        # ********** Evaluation ********** #
        model.eval()
        with torch.no_grad():
            # ********** Validation ********** #
            val_loss_epoch = evaluate(
                model, val_loader, loss_func, verbosity, "validation"
            )
            if scheduler:
                scheduler.step(val_loss_epoch[0])
              
            # ********** Test ********** #
            test_loss_epoch, test_preds = evaluate(
                model, test_loader, loss_func, verbosity, "test", return_preds=True
            )
            test_losses.append(test_loss_epoch)
            for i, preds in enumerate(test_preds):
                test_preds_inst[i].extend(preds)
        
    return train_losses, test_losses, test_preds_inst


def main(args: Dict[str, str]):
    epochs = int(args['epoch'])
    batch_size = int(args['batch'])
    seed = int(args['seed'])
    dataset_path = args['dataset']
    target_metric = args['target']
    selected_test_bench = args['testbench']
    verbosity = int(args['verbose'])

    matplotlib.use('Agg')

    torch.backends.cudnn.benchmark = True
    torch.set_printoptions(
        precision=6, threshold=1000, edgeitems=20, linewidth=200,
        profile="short", sci_mode=False
    )

    # Set random seeds for reproducibility
    set_random_seeds(seed)

    base_stats_dir = f"dse/estimators/model_analysis/{target_metric}"
    base_pretrained_dir = f"dse/estimators/pretrained/{target_metric}"

    benchmarks = sorted(os.listdir(dataset_path))

    if selected_test_bench is None:
        test_benches = benchmarks
    else:
        test_benches = [selected_test_bench]

    for test_bench in test_benches:
        stats_dir, graphs_dir, pretrained_dir = make_output_dirs(
            base_stats_dir, base_pretrained_dir, test_bench
        )

        train_benches = [b for b in benchmarks if b != test_bench]

        train_loader, val_loader, test_loader = prepare_data_loaders(
            dataset_path, target_metric, train_benches, test_bench, 
            batch_size, val_split=0.1
        )

        model = initialize_model()
        loss_func = nn.HuberLoss(delta=1.35)
        optimizer = torch.optim.AdamW(
            model.parameters(), lr=1e-3, betas=(0.8, 0.999), eps=1e-8, weight_decay=1e-4
        )
        scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(
            optimizer, mode='min', factor=0.5, patience=5, min_lr=1e-6, eps=1e-8
        )

        train_losses, test_losses, test_preds_sorted = train_model(
            model, loss_func, optimizer, train_loader, test_loader, 
            val_loader, epochs, scheduler, verbosity
        )
        
        save_model(model, pretrained_dir, f"hgt_{target_metric}.pt")
        save_training_artifacts(
            train_losses, test_losses, test_preds_sorted, 
            stats_dir, graphs_dir
        )
        plot_benchmark_analysis(test_preds_sorted, test_bench, graphs_dir)


def plot_learning_curves(
    train_losses: List[float], 
    test_losses: List[float], 
    save_path: Optional[str] = None
):
    assert len(train_losses) == len(test_losses), \
        "Mismatch in number of training and test losses"

    plt.figure(figsize=(12, 6), dpi=150)
    sns.set_style("whitegrid")

    num_epochs = len(train_losses)

    df = pd.DataFrame({
        'Epoch': list(range(num_epochs)) * 2,
        'Loss': train_losses + test_losses,
        'Type': ['Train'] * num_epochs + ['Test'] * num_epochs
    })

    ax = sns.lineplot(
        x='Epoch', y='Loss', hue='Type', data=df, 
        palette={'Train': 'green', 'Test': 'red'}, 
        linewidth=2.5, marker='o'
    )

    plt.title(f'Training Progress (Final Test Loss: {test_losses[-1]:.4f})', fontsize=14)
    plt.xlabel('Epoch', fontsize=12)
    plt.ylabel('Huber Loss', fontsize=12)
    plt.legend()

    # Highlight best epoch
    best_epoch = np.argmin(test_losses)
    ax.axvline(best_epoch, color='blue', linestyle='--', alpha=0.7)
    ax.text(
        best_epoch+0.5, np.max(test_losses), f'Best Epoch: {best_epoch}', 
        color='blue', fontsize=10
    )

    # Set y-axis to log scale if necessary
    if np.max(test_losses) / np.min(test_losses) > 100:
        plt.yscale('log')

    plt.tight_layout()
    if save_path:
        plt.savefig(save_path, bbox_inches='tight')
    else:
        plt.show()
    plt.close()


def plot_predictions(
    test_preds_sorted: List[List[Tuple[float, float]]],
    save_path: str
):
    targets = [inst[0][1] for inst in test_preds_sorted]
    preds = [inst[-1][0] for inst in test_preds_sorted]  # Get final epoch predictions

    plt.figure(figsize=(10, 10), dpi=150)
    sns.set_style("whitegrid")

    max_val = max(max(targets), max(preds)) * 1.1
    min_val = min(min(targets), min(preds)) * 0.9

    # Reference line for perfect prediction
    plt.plot(
        [min_val, max_val], [min_val, max_val], 'r--', 
        label='Perfect Prediction', alpha=0.7
    )

    # Regression line
    sns.regplot(
        x=targets, y=preds, scatter=False, 
        color='blue', label='Trend Line'
    )
    
    # Scatter plot
    sns.scatterplot(x=targets, y=preds, alpha=0.6, edgecolor='w', label='Predictions')
    
    # Error metrics
    mae = np.mean(np.abs(np.array(targets) - np.array(preds)))
    r2 = r2_score(targets, preds)
    plt.text(
        min_val*1.05, max_val*0.9, f'MAE: {mae:.2f}\nR²: {r2:.2f}', 
        bbox=dict(facecolor='white', alpha=0.8)
    )
    
    plt.title('Actual vs. Predicted Resource Usage', fontsize=14)
    plt.xlabel('Actual Values', fontsize=12)
    plt.ylabel('Predictions', fontsize=12)
    plt.legend()
    plt.tight_layout()
    plt.savefig(save_path)
    plt.close()


def plot_benchmark_analysis(
    test_preds_sorted: List[List[Tuple[float, float]]],
    bench_name: str,
    save_dir: str
):
    """Plot per-benchmark instance-level predictions and errors"""
    instances = list(range(len(test_preds_sorted)))
    targets = [inst[0][1] for inst in test_preds_sorted]
    preds = [inst[-1][0] for inst in test_preds_sorted]
    rel_errors = [(p - t) / t * 100 for p, t in zip(preds, targets)]
        
    # Sort by target value for better visualization
    sorted_idx = np.argsort(targets)
    targets = np.array(targets)[sorted_idx]
    preds = np.array(preds)[sorted_idx]
    rel_errors = np.array(rel_errors)[sorted_idx]
    instances = np.array(instances)[sorted_idx]

    plt.figure(figsize=(16, 10), dpi=120)
    sns.set_style("whitegrid")
    cmap = RdYlGn.reversed()

    # Top subplot: Actual vs Predicted values
    plt.subplot(2, 1, 1)
    bar_width = 0.4
    x = np.arange(len(targets))
    
    # Actual values
    plt.bar(
        x - bar_width/2, targets, width=bar_width, 
        color='#2ecc71', alpha=0.8, label='Actual'
    )
    # Predicted values
    plt.bar(
        x + bar_width/2, preds, width=bar_width, 
        color='#e74c3c', alpha=0.8, label='Predicted'
    )
    
    # Add data labels
    for i, (t, p) in enumerate(zip(targets, preds)):
        plt.text(
            i - bar_width/2, t + 0.05*max(targets), f'{t:.1f}', 
            ha='center', va='bottom', fontsize=8
        )
        plt.text(
            i + bar_width/2, p + 0.05*max(targets), f'{p:.1f}', 
            ha='center', va='bottom', fontsize=8
        )
    
    plt.title(
        f'Benchmark: {bench_name}\nMAE: {np.mean(np.abs(preds - targets)):.2f} | '
        f'RMSE: {np.sqrt(np.mean((preds - targets)**2)):.2f}', fontsize=14
    )
    plt.ylabel('Resource Usage', fontsize=12)
    # plt.xticks(x, instances, rotation=45, ha='right')
    plt.legend()
    
    # Bottom subplot: Relative errors
    plt.subplot(2, 1, 2)
    colors = cmap(np.clip(rel_errors/100, -1, 1))  # Normalize errors to [-1, 1]
    
    bars = plt.bar(x, rel_errors, color=colors, alpha=0.8)
    plt.axhline(0, color='black', linewidth=0.8)
    
    # Add error labels
    for bar, err in zip(bars, rel_errors):
        plt.text(
            bar.get_x() + bar.get_width()/2, bar.get_height() + (1 if err >=0 else -3), 
            f'{err:.1f}%', ha='center', va='bottom' if err >=0 else 'top', fontsize=8
        )
    
    plt.title('Relative Prediction Errors (%)', fontsize=14)
    plt.ylabel('Error Percentage', fontsize=12)
    plt.xlabel('Instance ID', fontsize=12)
    # plt.xticks(x, instances, rotation=45, ha='right')
    plt.ylim(-100, 100)

    plt.tight_layout()
    plt.savefig(f"{save_dir}/{bench_name}_analysis.png", bbox_inches='tight')
    plt.close()


def save_training_artifacts(
    train_losses: List[float],
    test_losses: List[float],
    test_preds_sorted: List[List[Tuple[float, float]]],
    stats_dir: str,
    graphs_dir: str
):
    assert len(train_losses) == len(test_losses), \
        "Mismatch in number of training and test losses"
    
    # Save metrics
    metrics_df = pd.DataFrame({
        'epoch': list(range(len(test_losses))),
        'train_loss': train_losses,
        'test_loss': test_losses
    })
    metrics_df.to_csv(f"{stats_dir}/metrics.csv", index=False)

    # Save predictions with metadata
    predictions_df = pd.DataFrame([
        {
            'target': instance[0][1],
            'predictions': [p[0] for p in instance],
            'final_prediction': instance[-1][0],
            'absolute_error': abs(instance[-1][0] - instance[0][1]),
            'relative_error': abs(instance[-1][0] - instance[0][1]) / instance[0][1]
        }
        for instance in test_preds_sorted
    ])
    predictions_df.to_csv(f"{stats_dir}/test_predictions.csv", index=False)

    plot_learning_curves(train_losses, test_losses, f"{graphs_dir}/learning_curve.png")
    plot_predictions(test_preds_sorted, f"{graphs_dir}/test_predictions.png")

    # Add error distribution plot
    plt.figure(figsize=(10, 6))
    sns.histplot(predictions_df['absolute_error'], bins=20, kde=True)
    plt.title('Absolute Error Distribution')
    plt.savefig(f"{graphs_dir}/error_distribution.png")
    plt.close()
    

def set_random_seeds(seed: int):
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    np.random.seed(seed)
    random.seed(seed)


def make_output_dirs(
    base_stats_dir: str,
    base_pretrained_dir: str,
    test_bench: str
) -> Tuple[str, str, str]:
    stats_dir = f"{base_stats_dir}/{test_bench}/stats"
    graphs_dir = f"{base_stats_dir}/{test_bench}/graphs"
    pretrained_dir = f"{base_pretrained_dir}/{test_bench}"

    os.makedirs(base_stats_dir, exist_ok=True)
    os.makedirs(stats_dir, exist_ok=True)
    os.makedirs(graphs_dir, exist_ok=True)
    os.makedirs(base_pretrained_dir, exist_ok=True)
    os.makedirs(pretrained_dir, exist_ok=True)

    return stats_dir, graphs_dir, pretrained_dir


def prepare_data_loaders(
    dataset_dir: str, 
    target_metric: str,
    train_benches: Union[List[str], str],
    test_benches: Union[List[str], str],
    batch_size: int,
    val_split: float = 0.1
) -> Tuple[DataLoader, DataLoader, DataLoader]:
    train_dataset = HLSDataset(
        dataset_dir, target_metric, normalize=True, benchmarks=train_benches
    )
    test_dataset = HLSDataset(
        dataset_dir, target_metric, normalize=True, benchmarks=test_benches,
        feature_stats=train_dataset.feature_stats
    )

    n_train = int((1 - val_split) * len(train_dataset))
    n_val = len(train_dataset) - n_train
    train_dataset, val_dataset = torch.utils.data.random_split(train_dataset, [n_train, n_val])

    train_loader = DataLoader(
        train_dataset, batch_size=batch_size, shuffle=True, 
        collate_fn=lambda x: tuple(zip(*x))
    )
    val_loader = DataLoader(val_dataset, shuffle=False, collate_fn=lambda x: tuple(zip(*x)))
    test_loader = DataLoader(test_dataset, shuffle=False, collate_fn=lambda x: tuple(zip(*x)))

    return train_loader, val_loader, test_loader


def initialize_model() -> nn.Module:
    node_types = ['inst', 'var', 'const', 'array']
    edge_types = [
        ('inst', 'control', 'inst'), ('inst', 'call', 'inst'), ('inst', 'data', 'var'),
        ('var', 'data', 'inst'), ('const', 'data', 'inst'), ('array', 'data', 'inst'),
        ('inst', 'data', 'array'), ('inst', 'id', 'inst'), ('var', 'id', 'var'),
        ('const', 'id', 'const'), ('array', 'id', 'array')
    ]
    metadata = (node_types, edge_types)
    in_channels = {
        'inst': INST_FEATURE_SIZE, 'var': VAR_FEATURE_SIZE, 
        'const': CONST_FEATURE_SIZE, 'array': ARRAY_FEATURE_SIZE
    }
    agg_edge_types = [
        [t for t in edge_types if t[1] == 'data'],
        [t for t in edge_types if t[1] == 'call'],
        [t for t in edge_types if t[1] == 'control'],
        [t for t in edge_types if t[1] == 'id']
    ]

    return HGT(
        metadata=metadata, in_channels=in_channels, out_channels=1, hid_dim=64, 
        heads=8, n_layers=6, pool_size=16, fc_dropout=0.2, conv_dropout=0.0, 
        use_norm=True, agg_edge_types=agg_edge_types, device=DEVICE
    )


def parse_arguments():
    parser = argparse.ArgumentParser()

    parser.add_argument('--dataset', required=True, help='Path to the dataset.')
    parser.add_argument('--epoch', default=300, help='The number of training epochs (default: 300).')
    parser.add_argument('--seed', default=42, help='Random seed for repeatability (default: 42).')
    parser.add_argument('--batch', default=16, help='The size of the training batch (default: 16).')
    parser.add_argument(
        '--testbench', default=None, 
        help='The name of the benchmark to use for test. If not specified, a cross-validation is performed.'
    )
    parser.add_argument(
        '--target', required=True, choices=['lut', 'ff', 'dsp', 'bram', 'cp'],
        help='The target resource metric.'
    )
    parser.add_argument(
        '--verbose', nargs='?', const=1, type=int, default=0, 
        help='Set verbosity level (default: 0). Use without value for level 1, or specify a level.'
    )

    return vars(parser.parse_args())

if __name__ == '__main__':
    args = parse_arguments()
    main(args)
