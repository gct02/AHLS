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
    model: nn.Module,
    loader: DataLoader,
    epoch: int,
    verbosity: int = 1,
    output_dir: Optional[str] = None,
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
        
    if output_dir:
        with open(f"{output_dir}/{mode}.log", 'a') as f:
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
    output_dir: Optional[str] = None,
    max_norm: Optional[float] = None,
    exp_adjust: bool = False,
) -> Dict[str, List[List[Tuple[float, float]]]]:
    results = defaultdict(list)

    for epoch in range(epochs):
        if verbosity > 0:
            print(f"Epoch {epoch + 1}/{epochs}\n")

        preds, targets = [], []
                
        model.train()
        for batch in train_loader:
            torch.cuda.empty_cache()
            
            optimizer.zero_grad()
            batch = batch.to(DEVICE)
            pred = model(batch)
            target = batch.y
            loss = loss_fn(pred, target)
            loss.backward()

            if max_norm is not None:
                clip_grad_norm_(model.parameters(), max_norm=max_norm)

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

        if output_dir:
            with open(f"{output_dir}/train.log", 'a') as f:
                for p, t in zip(preds, targets):
                    f.write(f"{epoch},{t},{p},{t-p}\n")

        if exp_adjust:
            preds, targets = np.expm1(preds), np.expm1(targets)

        results['train'].append(list(zip(preds, targets)))

        model.eval()
        with torch.no_grad():
            test_results = evaluate(
                model, test_loader, epoch,
                verbosity=verbosity, 
                output_dir=output_dir, 
                exp_adjust=exp_adjust
            )
            results['test'].append(test_results)

    return results


def main(args: Dict[str, str]):
    dataset_dir = args['dataset_dir']
    test_bench = args['test_bench']
    target_metric = args['target']
    epochs = int(args['epoch'])
    batch_size = int(args['batch'])
    seed = int(args['seed'])
    learning_rate = float(args['learning_rate'])
    betas = tuple(map(float, args['betas']))
    weight_decay = float(args['weight_decay'])
    max_norm = float(args['max_norm'])
    pct_start = float(args['pct_start'])
    anneal_strategy = args['anneal_strategy']
    loss = args['loss']
    verbosity = int(args['verbose'])
    log_scale = args['log_scale']
    huber_delta = float(args['huber_delta'])
    output_dir = args['output_dir']

    if not dataset_dir:
        raise ValueError("Dataset directory must be specified with -d or --dataset-dir.")
    
    full_dataset_dir = f"{dataset_dir}/full"
    if not os.path.exists(full_dataset_dir):
        raise FileNotFoundError(f"Dataset directory {full_dataset_dir} does not exist.")
    
    if not output_dir:
        output_dir = os.path.dirname(os.path.abspath(__file__))

    matplotlib.use('Agg')
    torch.autograd.set_detect_anomaly(True)
    torch.set_printoptions(edgeitems=20, linewidth=200, sci_mode=False)

    set_random_seeds(seed)

    benches = sorted(os.listdir(full_dataset_dir))
    train_benches = [b for b in benches if b != test_bench]

    model_dir = f"{output_dir}/models/{target_metric}_{test_bench}"
    pretrained_dir = f"{model_dir}/pretrained"
    model_info_dir = f"{model_dir}/model_info"
    training_info_dir = f"{model_dir}/training_info"
    graphs_dir = f"{training_info_dir}/graphs"

    os.makedirs(model_dir, exist_ok=True)
    os.makedirs(model_info_dir, exist_ok=True)
    os.makedirs(pretrained_dir, exist_ok=True)
    os.makedirs(training_info_dir, exist_ok=True)
    os.makedirs(graphs_dir, exist_ok=True)

    with open(f"{training_info_dir}/training_args.pkl", 'wb') as f:
        pickle.dump(args, f)

    model_args = {
        'metadata': METADATA,
        'in_channels': NODE_FEATURE_DIMS,
        'out_channels': 1,
        'proj_in_dim': 256,
        'hid_dim': [256, 256, 256],
        'heads': [4, 4, 4],
        'num_layers': 3,
        'dropout': 0.1
    }
    model = HGT(**model_args).to(DEVICE)

    model_args_path = f"{model_info_dir}/{target_metric}_estimator_args.pkl"
    with open(model_args_path, 'wb') as f:
        pickle.dump(model_args, f)

    if loss == 'mse':
        loss_fn = nn.MSELoss()
    elif loss == 'l1':
        loss_fn = nn.L1Loss()
    elif loss == 'huber':
        loss_fn = nn.HuberLoss(delta=huber_delta)
    else:
        raise ValueError(f"Unsupported loss function: {loss}")

    # optimizer = torch.optim.AdamW(
    #     model.parameters(), 
    #     lr=learning_rate, 
    #     betas=betas, 
    #     weight_decay=weight_decay
    # )
    optimizer = torch.optim.Adam(
        model.parameters(),
        lr=learning_rate,
        betas=betas
    )

    train_loader, test_loader, feat_ranges = prepare_data_loaders(
        dataset_dir=dataset_dir, 
        target_metric=target_metric, 
        test_benches=test_bench, 
        train_benches=train_benches, 
        batch_size=batch_size, 
        log_scale=log_scale,
        return_feature_ranges=True
    )

    with open(f"{model_info_dir}/feature_ranges.pkl", 'wb') as f:
        pickle.dump(feat_ranges, f)

    total_steps = epochs * len(train_loader)
    scheduler = torch.optim.lr_scheduler.OneCycleLR(
        optimizer,
        max_lr=learning_rate,
        total_steps=total_steps,
        pct_start=pct_start,
        anneal_strategy=anneal_strategy
    )

    results = train_model(
        model, loss_fn, optimizer, 
        train_loader, test_loader, epochs, 
        scheduler=scheduler, 
        verbosity=verbosity, 
        output_dir=training_info_dir,
        max_norm=max_norm,
        exp_adjust=log_scale
    )

    model_path = f"{pretrained_dir}/{target_metric}_estimator_{test_bench}.pt"
    torch.save(obj=evaluate.best_model, f=model_path)

    indices = [data.solution_index for data in test_loader.dataset]
    plot_prediction_bars(
        test_results=results["test"], 
        solution_indices=indices, 
        benchmark=test_bench, 
        metric=target_metric, 
        output_path=f"{graphs_dir}/predictions.png", 
        epoch=evaluate.best_epoch, 
        mre=evaluate.min_mre
    )
    save_training_artifacts(results, graphs_dir)


def save_training_artifacts(
    results: Dict[str, List[List[Tuple[float, float]]]],
    output_dir: str
):
    train_errors, test_errors = [], []
    for train_results, test_results in zip(results['train'], results['test']):
        train_errors.append(np.mean([mape(p, t) for p, t in train_results]))
        test_errors.append(np.mean([mape(p, t) for p, t in test_results]))

    best_test_results = results['test'][evaluate.best_epoch]
    targets = [r[1] for r in best_test_results]
    preds = [r[0] for r in best_test_results]
    errors = [mape(p, t).item() for p, t in zip(preds, targets)]

    learning_curve_path = f"{output_dir}/learning_curve.png"
    scatter_path = f"{output_dir}/predictions_scatter.png"

    plot_learning_curves(
        train_errors=train_errors, 
        test_errors=test_errors, 
        output_path=learning_curve_path,
        best_epoch=evaluate.best_epoch
    )
    plot_prediction_scatter(
        targets=targets, 
        preds=preds, 
        output_path=scatter_path, 
        errors=errors
    )
    

def set_random_seeds(seed: int):
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    np.random.seed(seed)
    random.seed(seed)


def prepare_data_loaders(
    dataset_dir: str,
    target_metric: str,
    test_benches: Union[List[str], str],
    train_benches: Union[List[str], str],
    batch_size: int = 32,
    log_scale: bool = False,
    return_feature_ranges: bool = False
) -> Tuple[DataLoader, DataLoader]:
    train_dataset = HLSDataset(
        root=dataset_dir, 
        metric=target_metric, 
        mode="train", 
        scale_features=True, 
        benchmarks=train_benches, 
        log_scale=log_scale
    )
    test_dataset = HLSDataset(
        root=dataset_dir, 
        metric=target_metric, 
        mode="test", 
        scale_features=True,
        feature_ranges=train_dataset.feature_ranges,
        benchmarks=test_benches,
        log_scale=log_scale
    )
    train_loader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True)
    test_loader = DataLoader(test_dataset, batch_size=1, shuffle=False)
    if return_feature_ranges:
        return train_loader, test_loader, train_dataset.feature_ranges
    else:
        return train_loader, test_loader


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--dataset-dir', type=str, required=True, 
                        help='The root directory of the dataset.')
    parser.add_argument('-tb', '--test-bench', type=str, required=True, 
                        help='The name of the benchmark to use for test.')
    parser.add_argument('-e', '--epoch', type=int, default=300, 
                        help='The number of training epochs (default: 300).')
    parser.add_argument('-s', '--seed', type=int, default=42, 
                        help='Random seed for repeatability (default: 42).')
    parser.add_argument('-b', '--batch', type=int, default=32, 
                        help='The size of the training batch (default: 32).')
    parser.add_argument('-l', '--loss', type=str, default='mse', choices=['mse', 'l1', 'huber'],
                        help='The loss function to use for training (default: mse).')
    parser.add_argument('-lr', '--learning-rate', type=float, default=5e-4,
                        help='The learning rate for the AdamW optimizer (default: 5e-4).')
    parser.add_argument('-bs', '--betas', type=float, nargs=2, default=(0.9, 0.999),
                        help='The betas for the AdamW optimizer (default: 0.9, 0.999).')
    parser.add_argument('-wd', '--weight-decay', type=float, default=1e-4,
                        help='Weight decay for the AdamW optimizer (default: 1e-4).')
    parser.add_argument('-mn', '--max-norm', type=float, default=5.0,
                        help='Maximum norm for gradient clipping (default: 5.0).')
    parser.add_argument('-ps', '--pct-start', type=float, default=0.35,
                        help='The percentage of the cycle to increase the learning rate (default: 0.35).')
    parser.add_argument('-as', '--anneal-strategy', type=str, default='cos', choices=['cos', 'linear'], 
                        help='The annealing strategy for the learning rate scheduler (default: cos).')
    parser.add_argument('-lt', '--log-scale', action='store_true',
                        help='Apply log transformation to the target variable.')
    parser.add_argument('-t', '--target', type=str, default='snru', choices=['snru', 'time', 'power', 'lut', 'ff', 'dsp', 'bram'],
                        help='The target metric to predict (default: snru).')
    parser.add_argument('-v', '--verbose', type=int, nargs='?', const=1, default=0, 
                        help='Set verbosity level (default: 0). Use without value for level 1, or specify a level.')
    parser.add_argument('-hd', '--huber-delta', type=float, default=1.0,
                        help='Delta parameter for Huber loss (default: 1.0). Only used if loss is set to "huber".')
    parser.add_argument('-o', '--output-dir', type=str, default='',
                        help='Directory to save the output files (default: the script directory).')
    return vars(parser.parse_args())

if __name__ == '__main__':
    args = parse_arguments()
    main(args)