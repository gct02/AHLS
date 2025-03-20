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
from torch_geometric.typing import NodeType

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
        mean_abs_error = torch.abs(preds - targets).mean().item()
        mean_rel_error = rpd(preds, targets).mean().item()
        print(f"\nMean Absolute Error on {mode} set: {mean_abs_error:.2f}")
        print(f"Mean Relative Error on {mode} set: {mean_rel_error:.2f}\n")

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
    test_preds = [[] for _ in range(len(test_loader))]
    train_rel_errs = []

    for epoch in range(epochs):
        if verbosity > 0:
            print(f"Epoch {epoch + 1}/{epochs}\n")

        preds, targets = [], []
        
        # Training
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
        train_rel_errs.append(rpd(preds, targets).mean().item())

        if collect_residuals and log_dir:
            residuals = (targets - preds).tolist()
            targets, preds = targets.tolist(), preds.tolist()
            with open(f"{log_dir}/train.log", 'a') as log_file:
                for t, p, r in zip(targets, preds, residuals):
                    log_file.write(f"{epoch},{t},{p},{r}\n")

        # Evaluation
        model.eval()
        with torch.no_grad():
            preds = evaluate(epoch, model, test_loader, verbosity, log_dir)
            for i, p in enumerate(preds):
                test_preds[i].append(p)

    if generate_plots:
        plot_prediction_bars(test_preds, test_bench, metric, graphs_dir)

    if save_artifacts:
        save_training_artifacts(train_rel_errs, test_preds, stats_dir, graphs_dir)


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
    base_aware = args['base_aware']
    filtered = args['filtered']
    raw_dataset_dir = args['raw_dataset']

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

    virtual_nodes = [f"virtual_{nt}" for nt in METADATA[0]]
    virtual_node_dims = {vt: NODE_FEATURE_DIMS[nt] 
                         for nt, vt in zip(METADATA[0], virtual_nodes)}

    virtual_edges = [(nt, 'virtual', vt) for nt, vt in zip(METADATA[0], virtual_nodes)]
    virtual_edges += [(vt, 'self', vt) for vt in virtual_nodes]

    metadata = (METADATA[0] + virtual_nodes, METADATA[1] + virtual_edges)
    node_feature_dims = {**NODE_FEATURE_DIMS, **virtual_node_dims}

    if base_aware:
        assert raw_dataset_dir is not None, \
            "Raw dataset directory must be provided for base-aware training"
        base_targets = get_base_solution_values(
            raw_dataset_dir, target_metric, filtered
        )
        base_edges = ([('base', 'base', nt) for nt in METADATA[0]]
                      + [('base', 'self', 'base')])
        metadata = (metadata[0] + ['base'], metadata[1] + base_edges)
        node_feature_dims['base'] = 1
    else:
        base_targets = None

    if selected_test_bench is None:
        test_benches = benchmarks
    else:
        test_benches = [selected_test_bench]

    num_virtual_nodes = {vt: 4 for vt in virtual_nodes}

    model_params = {
        'metadata': metadata,
        'in_channels': node_feature_dims,
        'out_channels': 1,
        'num_layers': 6,
        'hid_dim': 64,
        'heads': 8,
        'dropout': 0.1,
        'num_virtual_nodes': num_virtual_nodes,
        'device': DEVICE
    }

    for test_bench in test_benches:
        run_analysis_dir, stats_dir, graphs_dir, pretrained_dir = make_output_dirs(
            base_stats_dir, base_pretrained_dir, test_bench, target_metric
        )
        train_benches = [b for b in benchmarks if b != test_bench]

        train_loader, test_loader = prepare_data_loaders(
            dataset_path, target_metric, train_benches, test_bench, batch_size, 
            num_virtual_nodes=num_virtual_nodes, process_data=process_data,
            base_targets=base_targets
        )

        model = HGT(**model_params)

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
    train_errors: List[float], 
    test_errors: List[float], 
    save_path: str
):
    assert len(train_errors) == len(test_errors), \
        "Mismatch in number of training and test losses"

    plt.figure(figsize=(12, 6), dpi=150)
    sns.set_style("whitegrid")

    num_epochs = len(train_errors)

    df = pd.DataFrame({
        'Epoch': list(range(num_epochs)) * 2,
        'Loss': train_errors + test_errors,
        'Type': ['Train'] * num_epochs + ['Test'] * num_epochs
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

    # Highlight best epoch
    best_epoch = np.argmin(test_errors)
    ax.axvline(best_epoch, color='blue', linestyle='--', alpha=0.7)
    ax.text(
        best_epoch + 0.5, np.max(test_errors), f'Best Epoch: {best_epoch}', 
        color='blue', fontsize=10
    )

    # Set y-axis to log scale if necessary
    if np.max(test_errors) / np.min(test_errors) > 100:
        plt.yscale('log')

    plt.tight_layout()
    plt.savefig(save_path, bbox_inches='tight')
    plt.close()


def plot_prediction_scatter(
    test_preds: List[List[Tuple[float, float]]],
    save_path: str,
    epoch: int = -1
):
    targets = [inst[0][1] for inst in test_preds]
    preds = [inst[epoch][0] for inst in test_preds]

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
        x=targets, y=preds, scatter=False, color='blue', label='Trend Line'
    )
    
    # Scatter plot
    sns.scatterplot(x=targets, y=preds, alpha=0.6, edgecolor='w', label='Predictions')
    
    # Error metrics
    mean_rel_error = rpd(torch.tensor(preds), torch.tensor(targets)).mean().item()
    r2 = r2_score(targets, preds)
    plt.text(
        min_val*1.05, max_val*0.9, f'Mean Relative Error: {mean_rel_error:.2f}\nR²: {r2:.2f}', 
        bbox=dict(facecolor='white', alpha=0.8)
    )
    
    plt.title('Actual vs. Predicted Resource Usage', fontsize=14)
    plt.xlabel('Actual Values', fontsize=12)
    plt.ylabel('Predictions', fontsize=12)
    plt.legend()

    plt.tight_layout()
    plt.savefig(save_path)
    plt.close()


def get_mean_rel_error(
    test_preds: List[List[Tuple[float, float]]],
    epoch: int
) -> float:
    targets = torch.tensor([inst[0][1] for inst in test_preds])
    preds = torch.tensor([inst[epoch][0] for inst in test_preds])
    return rpd(preds, targets).mean().item()


def get_mean_rel_errors(
    test_preds: List[List[Tuple[float, float]]]
) -> List[float]:
    epochs = len(test_preds[0])
    return [get_mean_rel_error(test_preds, i) for i in range(epochs)]


def get_min_error_epoch(
    test_preds: List[List[Tuple[float, float]]]
) -> int:
    return np.argmin(get_mean_rel_errors(test_preds))


def plot_prediction_bars(
    test_preds: List[List[Tuple[float, float]]],
    testbench: str,
    metric: str,
    save_dir: str
):
    """Plot per-benchmark instance-level predictions and errors"""
    testbench = testbench.upper()
    metric = metric.upper()

    best_epoch = get_min_error_epoch(test_preds)

    indices = list(range(len(test_preds)))
    targets = [inst[0][1] for inst in test_preds]
    preds = [inst[best_epoch][0] for inst in test_preds]
    rel_errors = [rpd(p, t).item() for p, t in zip(preds, targets)]

    mean_rel_error = np.mean(rel_errors)

    rel_errors = [-r if t > p else r for r, t, p in zip(rel_errors, targets, preds)]

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
        0.12, 0.95, f"Mean Relative Error: {mean_rel_error:.2f}%", 
        transform=ax.transAxes, fontsize=11, ha='center'
    )

    ax.set_title(f"Predictions for {testbench} ({metric})", fontsize=14)
    ax.set_xlabel('Instance Index', fontsize=12)
    ax.set_ylabel(f'{metric}', fontsize=12)
    ax.legend()

    plt.tight_layout()
    plt.savefig(f"{save_dir}/test_prediction_bars.png")
    plt.close()


def save_training_artifacts(
    train_rel_errors: List[float],
    test_preds: List[List[Tuple[float, float]]],
    stats_dir: str,
    graphs_dir: str
):
    num_epochs = len(train_rel_errors)
    test_rel_errors = get_mean_rel_errors(test_preds)

    assert num_epochs == len(test_rel_errors), \
        "Mismatch in number of training and test epochs"
    
    # Save metrics
    metrics_df = pd.DataFrame({
        'epoch': list(range(num_epochs)),
        'train_rel_error': train_rel_errors,
        'test_rel_error': test_rel_errors
    })
    metrics_df.to_csv(f"{stats_dir}/metrics.csv", index=False)

    best_epoch = np.argmin(test_rel_errors)

    # Save predictions with metadata
    predictions_df = pd.DataFrame([
        {
            'instance': i,
            'target': inst[0][1],
            'preds': [p[0] for p in inst],
            'final_pred': inst[-1][0],
            'best_pred': inst[best_epoch][0],
            'final_rel_error': rpd(inst[-1][0], inst[0][1]),
            'min_rel_error': rpd(inst[best_epoch][0], inst[0][1])
        }
        for i, inst in enumerate(test_preds)
    ])
    predictions_df.to_csv(f"{stats_dir}/test_predictions.csv", index=False)

    plot_learning_curves(train_rel_errors, test_rel_errors, f"{graphs_dir}/learning_curve.png")
    plot_prediction_scatter(test_preds, f"{graphs_dir}/test_prediction_scatter.png", epoch=best_epoch)

    # Add error distribution plot
    plt.figure(figsize=(10, 6))
    sns.histplot(predictions_df['min_rel_error'], kde=True)
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


def get_base_solution_values(
    dataset_dir: str,
    target_metric: str,
    filtered: bool = False
) -> Dict[str, float]:
    base_values = {}

    for bench in os.listdir(dataset_dir):
        bench_dir = Path(dataset_dir) / bench
        if not bench_dir.is_dir():
            continue

        if (bench_dir / "solution0").exists():
            base_sol = "solution0"
        elif (bench_dir / "solution1").exists():
            base_sol = "solution1"
        else:
            continue
        
        metrics = extract_metrics(dataset_dir, bench, base_sol, filtered)
        assert target_metric in metrics, \
            f"Target metric {target_metric} not found in base solution metrics"

        base_values[bench] = metrics[target_metric]

    return base_values


def prepare_data_loaders(
    original_dataset_dir: str, 
    target_metric: str,
    train_benches: Union[List[str], str],
    test_benches: Union[List[str], str],
    batch_size: int,
    num_virtual_nodes: Optional[Union[int, Dict[NodeType, int]]] = None,
    process_data: bool = False,
    base_targets: Optional[Dict[str, float]] = None
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
    #   - 6: bitwidth  
    # 
    # - **const (constant)**  
    #   - 0-5: type  
    #   - 6: bitwidth  
    # 
    # - **array**  
    #   - 0: num_dims  
    #   - 1-4: dim_sizes  
    #   - 5-10: elem_type  
    #   - 11: elem_bitwidth  
    #   - 12-14: implementation (RTL port, BRAM/LUTRAM/URAM, shift register)  
    #   - 15: partitioned  
    #   - 16-18: partition_type (complete, cyclic, block)  
    #   - 19-23: partition_dim  
    #   - 24: partition_factor  
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

    if num_virtual_nodes is None:
        num_virtual_nodes = {nt: 1 for nt in METADATA[0]}

    if process_data:
        data_dirs = [
            f"{train_dir}/raw", f"{test_dir}/raw", 
            f"{train_dir}/processed", f"{test_dir}/processed"
        ]
        clean_up_dirs(data_dirs, recreate=True)

    train_data = HLSDataset(
        train_dir, target_metric, 
        metadata=METADATA, dataset_dir_path=original_dataset_dir, 
        benches=train_benches, copy_data=process_data, process_data=True, 
        stats=stats, num_virtual_nodes=num_virtual_nodes,
        base_targets=base_targets
    )
    test_data = HLSDataset(
        test_dir, target_metric, 
        metadata=METADATA, dataset_dir_path=original_dataset_dir, 
        benches=test_benches, copy_data=process_data, process_data=True, 
        stats=stats, num_virtual_nodes=num_virtual_nodes,
        base_targets=base_targets
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
    parser.add_argument('--base-aware', action='store_true',
                        help='Include the target value of the base solution as a feature.')
    parser.add_argument('--raw-dataset', default=None,
                        help='Path to the "raw" dataset folder (i.e., the dataset containing the original HLS solutions).')
    parser.add_argument('--filtered', action='store_true',
                        help='Signal that the (raw) dataset is filtered')
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
    import sys

    if __package__ is None:                  
        DIR = Path(__file__).resolve().parent
        sys.path.insert(0, str(DIR.parent))
        sys.path.insert(0, str(DIR.parent.parent))
        __package__ = DIR.name

    from utils.parsers import extract_metrics

    gc.collect()
    DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')
    args = parse_arguments()
    main(args)
