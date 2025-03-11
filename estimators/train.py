import os
import sys
import argparse
import random
import shutil
from pathlib import Path
from typing import List, Dict, Tuple, Optional, Union

import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
import pandas as pd
import torch
import torch.nn as nn
from torch_geometric.loader import DataLoader
from sklearn.metrics import r2_score

from models import HGT
from dataset import HLSDataset, compute_stats
from graph import METADATA, NODE_FEATURE_DIMS


def save_model(model, target_dir, model_name):
    target_dir_path = Path(target_dir)
    target_dir_path.mkdir(parents=True, exist_ok=True)
    assert model_name.endswith(".pth") or model_name.endswith(".pt"), \
        "model_name should end with '.pt' or '.pth'"
    model_save_path = target_dir_path / model_name
    print(f"[INFO] Saving model to: {model_save_path}")
    torch.save(obj=model.state_dict(), f=model_save_path)


def rpd(pred, target):
    if isinstance(pred, float):
        pred = torch.tensor(pred)
    if isinstance(target, float):
        target = torch.tensor(target)
    if (target == 0).any():
        return (torch.abs(pred - target) 
                / ((torch.abs(pred) + torch.abs(target)) / 2) * 100)
    return (torch.abs(pred - target) / torch.abs(target)) * 100


def evaluate(
    epoch: int,
    model: nn.Module,
    loader: DataLoader,
    loss_fn: nn.Module,
    verbosity: int,
    mode: str = 'test',
    log_dir: Optional[str] = None
) -> Tuple[float, float, float, List[Tuple[float, float]]]:
    if verbosity > 0:
        print(f"\nEvaluating on {mode} set\n")

    preds, targets = [], []
    abs_errors, rel_errors = [], []
    
    # Assumption: Only one instance per batch
    for i, batch in enumerate(loader):
        pred = model(batch.to(DEVICE))
        target = batch.y.to(DEVICE)

        pred_val = pred.item()
        target_val = target.item()
        abs_error = torch.abs(pred - target).item()
        rel_error = rpd(pred, target).item()

        if log_dir:
            with open(f"{log_dir}/{mode}.log", 'a') as log_file:
                log_file.write(f"{epoch},{i},{target_val},{pred_val}\n")

        if verbosity > 0:
            print(f"Instance {i}: Target: {target_val}; Prediction: {pred_val}; "
                  + f"Abs. Error: {abs_error:.3f}; Rel. Error: {rel_error:.3f}")

        preds.append(pred_val)
        targets.append(target_val)
        abs_errors.append(abs_error)
        rel_errors.append(rel_error)

    mean_abs_error = np.mean(abs_errors)
    mean_rel_error = np.mean(rel_errors)

    if verbosity > 0:
        print(f"\nMean Absolute Error on {mode} set: {mean_abs_error:.3f}")
        print(f"Mean Relative Error on {mode} set: {mean_rel_error:.3f}\n")

    pred_tensor = torch.tensor(preds)
    target_tensor = torch.tensor(targets)
    loss = loss_fn(pred_tensor, target_tensor).item()

    return loss, mean_abs_error, mean_rel_error, list(zip(preds, targets))


def train_model(
    model: nn.Module,
    loss_fn: nn.Module,
    optimizer: torch.optim.Optimizer,
    train_loader: DataLoader,
    test_loader: DataLoader,
    epochs: int,
    scheduler: Optional[torch.optim.lr_scheduler._LRScheduler] = None,
    verbosity: int = 1,
    log_dir: Optional[str] = None,
    collect_residuals: bool = False,
    save_artifacts: bool = False,
    stats_dir: Optional[str] = None,
    graphs_dir: Optional[str] = None,
    generate_plots: bool = False,
    test_bench: Optional[str] = None,
    metric: Optional[str] = None
) -> None:
    train_abs_errs, test_abs_errs, test_rel_errs = [], [], []
    test_instance_preds = [[] for _ in range(len(test_loader))]

    for epoch in range(epochs):
        if verbosity > 0:
            print(f"Epoch {epoch + 1}/{epochs}\n")
        
        # Training
        model.train()
        preds, targets = [], []
        for batch in train_loader:
            optimizer.zero_grad()

            pred = model(batch.to(DEVICE))
            target = batch.y.to(DEVICE)

            loss_fn(pred, target).backward()
            optimizer.step()
            if scheduler:
                scheduler.step()

            targets.append(target)
            preds.append(pred)

            if verbosity > 1:
                print(f"Target: {target.tolist()}; Prediction: {pred.tolist()}")

        targets = torch.cat(targets)
        preds = torch.cat(preds)
        train_error = torch.abs(targets - preds).mean().item()
        train_abs_errs.append(train_error)

        if collect_residuals and log_dir:
            residuals = targets - preds
            targets, preds = targets.tolist(), preds.tolist()
            residuals = residuals.tolist()
            with open(f"{log_dir}/training.log", 'a') as log_file:
                for i, (t, p, r) in enumerate(zip(targets, preds, residuals)):
                    log_file.write(f"{epoch},{i},{t},{p},{r}\n")

        # Evaluation
        model.eval()
        with torch.no_grad():
            _, test_abs_error, test_rel_error, test_preds = evaluate(
                epoch, model, test_loader, loss_fn, verbosity, "test", log_dir
            )
            test_abs_errs.append(test_abs_error)
            test_rel_errs.append(test_rel_error)
            for i, instance_pred in enumerate(test_preds):
                test_instance_preds[i].append(instance_pred)

    if save_artifacts:
        save_training_artifacts(
            train_abs_errs, test_abs_errs, test_rel_errs, test_instance_preds, 
            stats_dir, graphs_dir
        )

    if generate_plots:
        plot_benchmark_analysis(
            test_instance_preds, test_rel_errs, test_bench, metric, graphs_dir
        )


def get_current_run_number(stats_dir: str) -> int:
    if not os.path.exists(stats_dir):
        return 1
    files = os.listdir(stats_dir)
    run_numbers = [
        int(f.split('_')[-1]) 
        for f in files if f.startswith('run_') and f.split('_')[-1].isdigit()
    ]
    if len(run_numbers) == 0:
        return 1
    return max(run_numbers) + 1


def main(args: Dict[str, str]):
    epochs = int(args['epoch'])
    batch_size = int(args['batch'])
    seed = int(args['seed'])
    loss = args['loss']
    residual = float(args['residual'])
    collect_residuals = args['collect_residuals']
    dataset_path = args['dataset']
    target_metric = args['target']
    selected_test_bench = args['testbench']
    verbosity = int(args['verbose'])
    process_data = args['process_data']

    matplotlib.use('Agg')

    # torch.backends.cudnn.benchmark = True
    torch.set_printoptions(
        precision=6, threshold=1000, edgeitems=20, linewidth=200, sci_mode=False
    )

    # Set random seeds for reproducibility
    set_random_seeds(seed)

    base_stats_dir = f"{Path(sys.argv[0]).parent}/analysis/model"
    base_pretrained_dir = f"{Path(sys.argv[0]).parent}/pretrained"
    benchmarks = sorted(os.listdir(dataset_path))

    if selected_test_bench is None:
        test_benches = benchmarks
    else:
        test_benches = [selected_test_bench]

    for test_bench in test_benches:
        run_analysis_dir, stats_dir, graphs_dir, pretrained_dir = make_output_dirs(
            base_stats_dir, base_pretrained_dir, test_bench, target_metric
        )
        train_benches = [b for b in benchmarks if b != test_bench]
        train_loader, test_loader = prepare_data_loaders(
            dataset_path, target_metric, train_benches, 
            test_bench, batch_size, process_data
        )

        model = HGT(
            METADATA, NODE_FEATURE_DIMS, 1, hid_dim=64, 
            num_conv_layers=5, num_pooling_layers=5,
            heads=8, dropout=0.2, jk_mode='max', 
            device=DEVICE   
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
            model.parameters(), lr=1e-3, betas=(0.9, 0.999), weight_decay=5e-4
        )

        total_steps = epochs * len(train_loader)
        scheduler = torch.optim.lr_scheduler.CosineAnnealingWarmRestarts(
            optimizer, T_0=total_steps // 10, T_mult=2, eta_min=1e-6
        )

        train_model(
            model, loss_fn, optimizer, train_loader, test_loader, epochs, 
            scheduler=scheduler, verbosity=verbosity, log_dir=run_analysis_dir, 
            collect_residuals=collect_residuals, save_artifacts=True, 
            stats_dir=stats_dir, graphs_dir=graphs_dir, generate_plots=True,
            test_bench=test_bench, metric=target_metric
        )
        run_number = run_analysis_dir.split('_')[-1]
        model_name = f"hgt_{run_number}.pt"
        save_model(model, pretrained_dir, model_name)


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
    epoch_preds: List[List[Tuple[float, float]]],
    save_path: str,
    epoch: int = -1
):
    targets = [inst[0][1] for inst in epoch_preds]
    preds = [inst[epoch][0] for inst in epoch_preds]

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
    test_epoch_preds: List[List[Tuple[float, float]]],
    test_epoch_rel_err: List[float],
    testbench: str,
    metric: str,
    save_dir: str
):
    """Plot per-benchmark instance-level predictions and errors"""
    testbench = testbench.upper()
    metric = metric.upper()

    best_epoch = np.argmin([np.mean(err) for err in test_epoch_rel_err])

    indices = list(range(len(test_epoch_preds)))
    targets = [inst[0][1] for inst in test_epoch_preds]
    preds = [inst[best_epoch][0] for inst in test_epoch_preds]

    rel_errors_per_inst = []
    for inst in test_epoch_preds:
        best_epoch_pred = inst[best_epoch][0]
        target = inst[0][1]
        rpd_val = rpd(best_epoch_pred, target)
        rel_errors_per_inst.append(rpd_val)

    bar_width = 0.35
    _, ax = plt.subplots(figsize=(20, 8), dpi=150)

    # Plot bars
    ax.bar([i - bar_width/2 for i in indices], targets, bar_width, 
           label='Target', color='blue', alpha=0.7)
    ax.bar([i + bar_width/2 for i in indices], preds, bar_width,
           label='Prediction', color='orange', alpha=0.7)

    # Add relative error on top of each pair of bars
    for i, (t, p, err) in enumerate(zip(targets, preds, rel_errors_per_inst)):
        ax.text(i, max(t, p) + 0.02 * max(targets), f'{err:.2f}%', 
                ha='center', fontsize=6, rotation=90)

    # Add gridlines for better readability
    ax.grid(axis='y', linestyle='--', alpha=0.7)
    
    # Rotate x-axis labels to prevent overlap
    ax.set_xticks(indices)
    ax.set_xticklabels(indices, rotation=90, fontsize=6)

    ax.set_title(f'Instance-Level {metric} Predictions for {testbench}', fontsize=16)
    ax.set_xlabel('Instance', fontsize=12)
    ax.set_ylabel(metric, fontsize=12)
    ax.legend()

    plt.tight_layout()
    plt.savefig(f"{save_dir}/{testbench}_predictions.png", bbox_inches='tight')
    plt.close()


def save_training_artifacts(
    train_epoch_err: List[float],
    test_epoch_abs_err: List[float],
    test_epoch_rel_err: List[float],
    test_epoch_preds: List[List[Tuple[float, float]]],
    stats_dir: str,
    graphs_dir: str
):
    assert len(train_epoch_err) == len(test_epoch_abs_err), \
        "Mismatch in number of training and test epochs"
    
    # Save metrics
    metrics_df = pd.DataFrame({
        'epoch': list(range(len(test_epoch_abs_err))),
        'train_error': train_epoch_err,
        'test_abs_error': test_epoch_abs_err,
        'test_rel_error': test_epoch_rel_err
    })
    metrics_df.to_csv(f"{stats_dir}/metrics.csv", index=False)

    best_epoch = np.argmin(test_epoch_rel_err)

    # Save predictions with metadata
    predictions_df = pd.DataFrame([
        {
            'instance': i,
            'target': inst[0][1],
            'preds': [p[0] for p in inst],
            'final_pred': inst[-1][0],
            'best_pred': inst[best_epoch][0],
            'abs_error_final': abs(inst[-1][0] - inst[0][1]),
            'rel_error_final': rpd(inst[-1][0], inst[0][1]),
            'abs_error_best': abs(inst[best_epoch][0] - inst[0][1]),
            'rel_error_best': rpd(inst[best_epoch][0], inst[0][1])
        }
        for i, inst in enumerate(test_epoch_preds)
    ])
    predictions_df.to_csv(f"{stats_dir}/test_predictions.csv", index=False)

    plot_learning_curves(train_epoch_err, test_epoch_abs_err, f"{graphs_dir}/learning_curve.png")
    plot_predictions(test_epoch_preds, f"{graphs_dir}/test_predictions.png", epoch=best_epoch)

    # Add error distribution plot
    plt.figure(figsize=(10, 6))
    sns.histplot(predictions_df['abs_error_best'], kde=True)
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
    base_analysis_dir: str,
    base_pretrained_dir: str,
    test_bench: str,
    metric: str
) -> Tuple[str, str, str, str]:
    if not os.path.exists(base_analysis_dir):
        os.makedirs(base_analysis_dir)
    if not os.path.exists(base_pretrained_dir):
        os.makedirs(base_pretrained_dir)

    test_bench = test_bench.upper()
    metric = metric.upper()

    metric_dir = f"{base_analysis_dir}/{metric}"
    if not os.path.exists(metric_dir):
        os.makedirs(metric_dir)

    tb_dir = f"{metric_dir}/{test_bench}"
    if not os.path.exists(tb_dir):
        os.makedirs(tb_dir)
        run_number = 1
    else:
        run_number = get_current_run_number(tb_dir)

    run_analysis_dir = f"{tb_dir}/run_{run_number}"
    stats_dir = f"{run_analysis_dir}/stats"
    graphs_dir = f"{run_analysis_dir}/graphs"
    pretrained_dir = f"{base_pretrained_dir}/{metric}/{test_bench}"

    os.makedirs(stats_dir, exist_ok=True)
    os.makedirs(graphs_dir, exist_ok=True)
    os.makedirs(pretrained_dir, exist_ok=True)

    return run_analysis_dir, stats_dir, graphs_dir, pretrained_dir


def prepare_data_loaders(
    original_dataset_dir: str, 
    target_metric: str,
    train_benches: Union[List[str], str],
    test_benches: Union[List[str], str],
    batch_size: int,
    process_data: bool = False
) -> Tuple[DataLoader, DataLoader, DataLoader]:
    
    # Do not normalize columns representing one-hot encoded 
    # categorical or boolean features.
    # 
    # Feature indices for each node type:
    # 
    # - **inst (instruction)**  
    #   - 0-11: type  
    # 
    # - **var (variable)**  
    #   - 0-5: type  
    #   - 6: bw (bitwidth)  
    # 
    # - **const (constant)**  
    #   - 0-5: type  
    #   - 6: bw (bitwidth)  
    # 
    # - **array**  
    #   - 0: n_dims (number of dimensions)  
    #   - 1-4: dim_sizes (dimension sizes)  
    #   - 5-10: elem_type (element type)  
    #   - 11: elem_bw (element bitwidth)  
    #   - 12-14: impl (RTL port, BRAM/LUTRAM/URAM, shift register)
    #   - 15: partitioned
    #   - 16-18: type (complete, cyclic, block)
    #   - 19-23: one_hot_dim (one-hot encoded dimension)  
    #   - 24: factor  
    #
    # - **loop**  
    #   - 0: depth  
    #   - 1: trip_count  
    #   - 2: unrolled
    #   - 3: unroll_factor
    #   - 4: pipelined
    #   - 5: merged
    #   - 6: flattened
    #   
    # - **func (function)**
    #   - 0: top_level
    #   - 1: pipelined
    #   - 2: merged

    filter_cols = {
        'inst': list(range(12)),
        'var': list(range(6)),
        'const': list(range(6)),
        'array': list(range(5, 11)) + list(range(12, 24)),
        'partition': list(range(8)),
        'loop': [2, 4, 5, 6],
        'func': [0, 1, 2]
    }
    stats = compute_stats(original_dataset_dir, target_metric, train_benches, filter_cols)

    dataset_dir = f"{Path(sys.argv[0]).parent}/dataset"
    train_dir = f"{dataset_dir}/train"
    test_dir = f"{dataset_dir}/test"

    if process_data:
        data_dirs = [
            f"{train_dir}/raw", f"{test_dir}/raw", 
            f"{train_dir}/processed", f"{test_dir}/processed"
        ]
        clean_up_dirs(data_dirs, recreate=True)
    
    train_data = HLSDataset(
        train_dir, target_metric, original_dataset_dir, 
        copy_data=process_data, process_data=True, 
        benches=train_benches, stats=stats
    )
    test_data = HLSDataset(
        test_dir, target_metric, original_dataset_dir, 
        copy_data=process_data, process_data=True, 
        benches=test_benches, stats=stats
    )
    train_loader = DataLoader(train_data, batch_size=batch_size, shuffle=True)
    test_loader = DataLoader(test_data, batch_size=1, shuffle=False)

    return train_loader, test_loader


def clean_up_dirs(dirs: List[str], recreate: bool = False):
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
    parser.add_argument('--residual', default=1.0, 
                        help='The standard deviation of the residual from previous training (default: 1.0).')
    parser.add_argument('--loss', default='huber', choices=['huber', 'mse', 'mae'],
                        help='The loss function to use for training (default: Huber loss).')
    parser.add_argument('--testbench', default=None, 
                        help='The name of the benchmark to use for test. If not specified, a cross-validation is performed.')
    parser.add_argument('--collect-residuals', action='store_true',
                        help='Collect residuals for analysis.')
    parser.add_argument('--target', required=True, choices=['lut', 'ff', 'dsp', 'bram', 'cp'],
                        help='The target resource metric.')
    parser.add_argument('--process-data', action='store_true',
                        help='Process the dataset for training.')
    parser.add_argument('--verbose', nargs='?', const=1, type=int, default=0, 
                        help='Set verbosity level (default: 0). Use without value for level 1, or specify a level.')

    return vars(parser.parse_args())

if __name__ == '__main__':
    DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')
    args = parse_arguments()
    main(args)