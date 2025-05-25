import os
import argparse
import random
import copy
import pickle
from collections import defaultdict
from typing import List, Dict, Tuple, Optional, Union

import matplotlib
import numpy as np
import torch
import torch.nn as nn
from torch.nn.utils import clip_grad_norm_
from torch.optim import Optimizer
from torch.optim.lr_scheduler import LRScheduler

from torch_geometric.loader import DataLoader

from gnn.models import HGT
from gnn.data.graph import (
    METADATA,
    NODE_FEATURE_DIMS
)
from gnn.data.dataset import HLSDataset
from gnn.utils import mape
from gnn.analysis import (
    plot_prediction_bars,
    plot_prediction_scatter,
    plot_learning_curves
)


DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')


def static_vars(**kwargs):
    def decorate(func):
        for k in kwargs:
            setattr(func, k, kwargs[k])
        return func
    return decorate


@static_vars(min_mre=1e10, best_epoch=0, best_model=None)
def evaluate(
    epoch: int,
    model: nn.Module,
    loader: DataLoader,
    verbosity: int = 1,
    log_dir: Optional[str] = None,
    mode: str = 'test',
    exp_adjust: bool = False
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

    if exp_adjust:
        preds, targets = np.expm1(preds), np.expm1(targets)

    mre = mape(
        torch.tensor(preds), 
        torch.tensor(targets)
    ).mean().item()

    if mre < evaluate.min_mre:
        evaluate.min_mre = mre
        evaluate.best_epoch = epoch
        evaluate.best_model = copy.deepcopy(model.state_dict())

    results = list(zip(preds, targets))

    if verbosity > 0:
        for p, t in results:
            print(f"Target: {t}; Prediction: {p}")
            
        print(f"\nMRE on {mode} set: {mre:.2f}%")
        print(f"Best MRE so far: {evaluate.min_mre:.2f}%"
              f" at epoch {evaluate.best_epoch + 1}\n")
    
    return results


def train_model(
    model: nn.Module,
    loss_fn: nn.Module,
    optimizer: Optimizer,
    train_loader: DataLoader,
    test_loader: DataLoader,
    epochs: int,
    scheduler: Optional[LRScheduler] = None,
    verbosity: int = 1,
    log_dir: Optional[str] = None,
    exp_adjust: bool = False,
) -> Dict[str, List[List[Tuple[float, float]]]]:
    results = defaultdict(list)

    for epoch in range(epochs):
        torch.cuda.empty_cache()
        if verbosity > 0:
            print(f"Epoch {epoch + 1}/{epochs}\n")

        preds, targets = [], []
                
        model.train()
        for batch in train_loader:
            optimizer.zero_grad()
            batch = batch.to(DEVICE)
            pred = model(batch)
            target = batch.y
            loss = loss_fn(pred, target)
            loss.backward()
            clip_grad_norm_(model.parameters(), max_norm=1.0)

            optimizer.step()

            if scheduler is not None:
                scheduler.step()

            pred, target = pred.tolist(), target.tolist()
            preds.extend(pred)
            targets.extend(target)

            if verbosity > 1:
                if exp_adjust:
                    pred, target = np.expm1(pred), np.expm1(target)
                for p, t in zip(pred, target):
                    print(f"Target: {t}; Prediction: {p}")

        if log_dir:
            with open(f"{log_dir}/train.log", 'a') as f:
                for p, t in zip(preds, targets):
                    f.write(f"{epoch},{t},{p},{t-p}\n")

        if exp_adjust:
            preds, targets = np.expm1(preds), np.expm1(targets)

        results['train'].append(list(zip(preds, targets)))

        model.eval()
        with torch.no_grad():
            test_results = evaluate(
                epoch, model, test_loader, 
                verbosity=verbosity, 
                log_dir=log_dir, 
                exp_adjust=exp_adjust
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
    log_scale = args['log_scale']
    residual = float(args['residual'])

    matplotlib.use('Agg')

    torch.autograd.set_detect_anomaly(True)
    torch.set_printoptions(
        precision=6, threshold=1000, edgeitems=20, linewidth=200, sci_mode=False
    )
    set_random_seeds(seed)

    full_data_dir = f"{dataset_dir}/full"
    benchmarks = sorted(os.listdir(full_data_dir))
    train_benches = [b for b in benchmarks if b != test_bench]

    analysis_dir, pretrained_dir = make_output_dirs(output_dir, test_bench, target_metric)

    train_loader, test_loader = prepare_data_loaders(
        dataset_dir=dataset_dir, 
        metric=target_metric, 
        test_benchmarks=test_bench, 
        train_benchmarks=train_benches, 
        batch_size=batch_size, 
        log_scale=log_scale
    )

    model_args = {
        'metadata': METADATA,
        'in_channels': NODE_FEATURE_DIMS,
        'out_channels': 1,
        'proj_in_dim': 256,
        'hid_dim': [256, 256],
        'heads': [4, 4],
        'num_layers': 2,
        'dropout': 0.0
    }
    
    model = HGT(**model_args).to(DEVICE)

    if loss == 'mse':
        loss_fn = nn.MSELoss()
    elif loss == 'l1':
        loss_fn = nn.L1Loss()
    elif loss == 'huber':
        loss_fn = nn.HuberLoss(delta=1.5*residual)
    else:
        raise ValueError(f"Unknown loss function: {loss}")

    optimizer = torch.optim.AdamW(
        model.parameters(), 
        lr=5e-4, 
        betas=(0.9, 0.999), 
        weight_decay=1e-4
    )

    total_steps = epochs * len(train_loader)
    scheduler = torch.optim.lr_scheduler.OneCycleLR(
        optimizer,
        max_lr=5e-4,
        total_steps=total_steps,
        pct_start=0.35,
        anneal_strategy='cos'
    )

    results = train_model(
        model, loss_fn, optimizer, 
        train_loader, test_loader, epochs, 
        scheduler=scheduler, 
        verbosity=verbosity, 
        log_dir=analysis_dir,
        exp_adjust=log_scale
    )

    torch.save(
        obj=evaluate.best_model, 
        f=f"{pretrained_dir}/{target_metric}_estimator.pt"
    )
    with open(f"{pretrained_dir}/{target_metric}_estimator_args.pkl", 'wb') as f:
        pickle.dump(model_args, f)

    indices = [data.solution_index for data in test_loader.dataset]
    plot_prediction_bars(
        test_results=results["test"], 
        solution_indices=indices,
        benchmark=test_bench, 
        metric=target_metric, 
        output_path=f"{analysis_dir}/preds_bar_plot.png", 
        epoch=evaluate.best_epoch, 
        mre=evaluate.min_mre
    )
    save_training_artifacts(results, analysis_dir)


def save_training_artifacts(
    results: Dict[str, List[List[Tuple[float, float]]]],
    output_dir: str,
):
    train_errors, test_errors = [], []
    for train_results, test_results in zip(results['train'], results['test']):
        train_errors.append(np.mean([mape(p, t) for p, t in train_results]))
        test_errors.append(np.mean([mape(p, t) for p, t in test_results]))

    test_results = results['test']
    targets = [r[1] for r in test_results[evaluate.best_epoch]]
    preds = [r[0] for r in test_results[evaluate.best_epoch]]
    errors = [mape(p, t).item() for p, t in zip(preds, targets)]

    plot_learning_curves(
        train_errors=train_errors, 
        test_errors=test_errors, 
        output_path=f"{output_dir}/learning_curve.png",
        epoch=evaluate.best_epoch
    )
    plot_prediction_scatter(
        targets=targets, 
        preds=preds, 
        output_path=f"{output_dir}/preds_scatter_plot.png", 
        errors=errors
    )
    

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
    pretrained_dir = f"{base_pretrained_dir}/{test_bench}"

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
    log_scale: bool = False
) -> Tuple[DataLoader, DataLoader]:
    train_data = HLSDataset(
        dataset_dir, metric, mode="train", scale_features=True, 
        benchmarks=train_benchmarks, log_scale=log_scale
    )
    test_data = HLSDataset(
        dataset_dir, metric, mode="test", scale_features=True,
        feature_ranges=train_data.feature_ranges,
        benchmarks=test_benchmarks,log_scale=log_scale
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
    parser.add_argument('-b', '--batch', default=32, 
                        help='The size of the training batch (default: 32).')
    parser.add_argument('-l', '--loss', default='mse', choices=['mse', 'l1', 'huber'],
                        help='The loss function to use for training (default: mse).')
    parser.add_argument('-lt', '--log-scale', action='store_true',
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