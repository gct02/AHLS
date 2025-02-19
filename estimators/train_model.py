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
from torch.utils.data import random_split
from sklearn.metrics import r2_score
from models import HGT

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
    loss_fn: nn.Module,
    verbosity: int,
    mode: str,
    return_preds: bool = False
) -> Tuple[float, float, Optional[List[Tuple[float, float]]]]:
    if verbosity > 0:
        print(f"\nEvaluating on {mode} set\n")

    eval_epoch_error = 0
    preds, targets = [], []
    
    # Assumption: Only one instance per batch
    for input_batch, target_batch in loader:
        cdfg = input_batch[0].to(DEVICE)
        target = target_batch[0].to(DEVICE)
        pred = model(cdfg)
        cdfg = cdfg.cpu()
        
        preds.append(pred)
        targets.append(target)

        pred_val = pred.item()
        target_val = target.item()
        abs_error = abs(pred_val - target_val)
        eval_epoch_error += abs_error

        if verbosity > 0:
            if target_val != 0:
                rel_error = abs_error / target_val * 100
            else:
                rel_error = 0 if abs_error <= 1e-2 else float('inf')
            print(f"Target: {target_val}; Prediction: {pred_val}; "
                  + f"Abs. Error: {abs_error:.4f}; Rel. Error: {rel_error:.4f}%")

    eval_epoch_error /= len(loader)
    if verbosity > 0:
        print(f"Mean Absolute Error on {mode} set: {eval_epoch_error}\n")

    preds_tensor = torch.stack(preds)
    targets_tensor = torch.stack(targets)
    loss = loss_fn(preds_tensor, targets_tensor).item()

    preds_and_targets = list(zip(preds, targets))

    return ((loss, eval_epoch_error, preds_and_targets) 
            if return_preds else (loss, eval_epoch_error))


def train_model(
    model: nn.Module,
    loss_fn: nn.Module,
    optimizer: torch.optim.Optimizer,
    train_loader: DataLoader,
    test_loader: DataLoader,
    val_loader: DataLoader,
    epochs: int,
    scheduler: Optional[torch.optim.lr_scheduler._LRScheduler] = None,
    verbosity: int = 1
) -> Tuple[List[float], List[float], List[List[Tuple[float, float]]]]:
    train_error_per_epoch, test_error_per_epoch = [], []
    num_batches = len(train_loader)
    num_instances = len(test_loader)
    test_preds_per_instance = [[] for _ in range(num_instances)]

    for epoch in range(epochs):
        if verbosity > 0:
            print(f"Epoch {epoch + 1}/{epochs}\n")
        
        # Training
        model.train()
        train_epoch_error = 0
        for i, (input_batch, target_batch) in enumerate(train_loader):
            preds, targets = [], []
            optimizer.zero_grad()
            train_batch_error = 0
            for cdfg, target in zip(input_batch, target_batch):
                cdfg, target = cdfg.to(DEVICE), target.to(DEVICE)
                pred = model(cdfg)
                cdfg = cdfg.cpu()

                preds.append(pred)
                targets.append(target)

                pred_val = pred.item()
                target_val = target.item()
                abs_error = abs(pred_val - target_val)
                train_batch_error += abs_error

                if verbosity > 1:
                    if target_val != 0:
                        rel_error = abs_error / target_val * 100
                    else:
                        rel_error = 0 if abs_error <= 1e-2 else float('inf')
                    print(f"Target: {target_val}; Prediction: {pred_val}; "
                          + f"Abs. Error: {abs_error:.4f}; Rel. Error: {rel_error:.4f}%")

            batch_size = len(input_batch)

            preds = torch.stack(preds).view(batch_size, 1)
            targets = torch.stack(targets).view(batch_size, 1)
            loss_fn(preds, targets).backward()
            optimizer.step()
            if scheduler:
                scheduler.step()

            train_batch_error /= batch_size
            train_epoch_error += train_batch_error

        train_epoch_error /= num_batches
        train_error_per_epoch.append(train_epoch_error)

        # Evaluation
        model.eval()
        with torch.no_grad():
            # Validation
            evaluate(model, val_loader, loss_fn, verbosity, "validation")
            # Testing
            _, test_error, test_preds = evaluate(
                model, test_loader, loss_fn, verbosity, "test", return_preds=True
            )
            test_error_per_epoch.append(test_error)
            for i, instance_pred in enumerate(test_preds):
                test_preds_per_instance[i].extend(instance_pred)
        
    return train_error_per_epoch, test_error_per_epoch, test_preds_per_instance


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
        precision=6, threshold=1000, edgeitems=20, linewidth=200, sci_mode=False
    )

    # Set random seeds for reproducibility
    set_random_seeds(seed)

    base_stats_dir = f"estimators/model_analysis/{target_metric}"
    base_pretrained_dir = f"estimators/pretrained/{target_metric}"

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
        loss_func = nn.HuberLoss(delta=1.345)
        optimizer = torch.optim.AdamW(model.parameters(), lr=3e-4, betas=(0.9, 0.999), weight_decay=1e-4)

        total_steps = epochs * len(train_loader)
        scheduler = torch.optim.lr_scheduler.OneCycleLR(optimizer, max_lr=1e-2, total_steps=total_steps)

        train_losses, test_losses, test_preds_sorted = train_model(
            model, loss_func, optimizer, train_loader, test_loader, 
            val_loader, epochs, scheduler, verbosity
        )
        
        save_model(model, pretrained_dir, f"hgt_{target_metric}.pt")
        save_training_artifacts(
            train_losses, test_losses, test_preds_sorted, 
            stats_dir, graphs_dir
        )
        plot_benchmark_analysis(test_preds_sorted, test_bench, target_metric, graphs_dir)


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
    metric: str,
    save_dir: str
):
    """Plot per-benchmark instance-level predictions and errors"""
    indices = list(range(len(test_preds_sorted)))
    targets = [inst[0][1] for inst in test_preds_sorted]
    preds = [inst[-1][0] + 1000 for inst in test_preds_sorted]
    rel_errors = [(p - t) / t * 100 for p, t in zip(preds, targets)]

    bench_name = bench_name.upper()
    metric = metric.upper()
        
    bar_width = 0.45
    fig, ax = plt.subplots(figsize=(20, 8), dpi=150)

    # Plot bars
    bars_target = ax.bar(
        [i - bar_width/2 for i in indices], targets, bar_width, 
        label='Target', color='#1a80bb', alpha=0.8
    )
    bars_pred = ax.bar(
        [i + bar_width/2 for i in indices], preds, bar_width,
        label='Prediction', color='#ea801c', alpha=0.8
    )

    # Add relative error on top of each pair of bars
    for i, (t, p, err) in enumerate(zip(targets, preds, rel_errors)):
        ax.text(i, max(t, p) + 0.02 * max(targets), f'{err:.2f}%', ha='center', fontsize=6, rotation=90)

    # Add gridlines for better readability
    ax.grid(axis='y', linestyle='--', alpha=0.7)
    
    # Rotate x-axis labels to prevent overlap
    ax.set_xticks(indices)
    ax.set_xticklabels(indices, rotation=90, fontsize=6)

    ax.set_title(f'Instance-Level {metric} Predictions for {bench_name}', fontsize=16)
    ax.set_xlabel('Instance', fontsize=12)
    ax.set_ylabel('Value', fontsize=12)
    ax.legend()

    plt.tight_layout()
    plt.savefig(f"{save_dir}/{bench_name}_predictions.png", bbox_inches='tight')
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
    train_data = HLSDataset(dataset_dir, target_metric, benchmarks=train_benches)
    n_instances = len(train_data)
    n_train = int((1 - val_split) * n_instances)
    n_val = n_instances - n_train
    train_data_split, val_data_split = random_split(train_data, [n_train, n_val])

    train_indices = train_data_split.indices
    filter_instances = [i in train_indices for i in range(n_instances)]
    train_data.compute_feature_stats(filter_instances)

    test_data = HLSDataset(
        dataset_dir, target_metric, normalize=True, benchmarks=test_benches,
        feature_stats=train_data.feature_stats
    )

    train_loader = DataLoader(
        train_data_split, batch_size=batch_size, shuffle=True, 
        collate_fn=lambda x: tuple(zip(*x))
    )
    val_loader = DataLoader(
        val_data_split, batch_size=1, shuffle=False, 
        collate_fn=lambda x: tuple(zip(*x))
    )
    test_loader = DataLoader(
        test_data, batch_size=1, shuffle=False, 
        collate_fn=lambda x: tuple(zip(*x))
    )

    return train_loader, val_loader, test_loader


def initialize_model() -> nn.Module:
    hid_dim_conv = [4, 2]
    heads = [1, 1]
    hid_dim_fc = [4, 2]
    out_channels = 1

    agg_paths = [
        [t for t in EDGE_TYPES if (t[0] == 'inst' and t[2] == 'inst') or t[1] == 'id'],
        [t for t in EDGE_TYPES if t[1] == 'prod' or t[1] == 'uses' or t[1] == 'used_by' or t[1] == 'prod_by' or t[1] == 'id'],
        [t for t in EDGE_TYPES if t[0] == 'bb' or t[1] == 'bb' or t[1] == 'id'],
        [t for t in EDGE_TYPES if t[0] == 'func' or t[1] == 'func' or t[1] == 'id']
    ]

    return HGT(
        METADATA, FEATURE_SIZE_PER_NODE_TYPE, out_channels, hid_dim_conv, num_conv_layers=len(hid_dim_conv),
        hid_dim_fc=hid_dim_fc, num_fc_layers=len(hid_dim_fc), num_heads=heads, fc_dropout=0.1, 
        conv_dropout=0.0, layer_norm=True, pool_size=4, aggr_paths=agg_paths, device=DEVICE
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
    from data.dataset import HLSDataset
    from data.cdfg import METADATA, FEATURE_SIZE_PER_NODE_TYPE, EDGE_TYPES

    DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

    args = parse_arguments()
    main(args)