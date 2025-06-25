import os
import argparse
import random
import json
import shutil
from typing import List, Dict, Tuple, Optional, Union, Any

import matplotlib
import numpy as np
import torch
import torch.nn as nn
from torch import Tensor
from torch.nn.utils import clip_grad_norm_
from torch.optim import Optimizer
from torch.optim.lr_scheduler import LRScheduler

from torch_geometric.loader import DataLoader
from torch_geometric.nn import LayerNorm

from gnn.models import HLSQoREstimator
from gnn.data.dataset import (
    HLSDataset,
    TARGET_METRICS
)
from gnn.data.graph import (
    METADATA,
    FEATURE_SIZE_BY_TYPE
)
from gnn.analysis.utils import (
    plot_prediction_bars,
    plot_prediction_scatter,
    plot_learning_curves,
    percentage_diff,
    compute_snru,
    compute_time,
    compute_power
)
from gnn.data.utils.parsers import AVAILABLE_RESOURCES
from gnn.utils import static_vars

DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

AVAILABLE_RESOURCES_TENSOR = torch.tensor(
    [AVAILABLE_RESOURCES[r] for r in TARGET_METRICS['area']],
    dtype=torch.float32,
    device=DEVICE
)


@static_vars(
    min_mape=float('inf'), 
    best_epoch=-1, 
    best_preds=None
)
def evaluate(
    model: nn.Module,
    loader: DataLoader,
    epoch: int,
    exp_adjust: bool = False,
    output_dir: Optional[str] = None
) -> float:
    targets, preds = [], []
    for data in loader:
        data = data.to(DEVICE)
        pred = model(
            data.x_dict, 
            data.edge_index_dict, 
            data.batch_dict,
            data.y_base
        )
        targets.append(data.y)
        preds.append(pred)
        
    targets = torch.cat(targets, dim=0)
    preds = torch.cat(preds, dim=0)
    if exp_adjust:
        targets = torch.expm1(targets)
        preds = torch.expm1(preds)
    targets = aggregate_qor_metrics(targets, loader.dataset.target_metric)
    preds = aggregate_qor_metrics(preds, loader.dataset.target_metric)

    mape = percentage_diff(preds, targets).mean().item()
    
    if mape < evaluate.min_mape:
        if output_dir and epoch > 20: # Avoid saving model at the first few epochs
            model_path = f"{output_dir}/model.pt"
            preds_path = f"{output_dir}/predictions.csv"
            torch.save(obj=model.state_dict(), f=model_path)
            indices = [
                data.solution_index 
                for data in loader.dataset
            ]
            with open(preds_path, "w") as f:
                f.write(f"index,target,prediction\n")
                for index, target, pred in zip(
                    indices, 
                    targets.tolist(), 
                    preds.tolist()
                ):
                    f.write(f"{index},{target},{pred}\n")
        evaluate.min_mape = mape
        evaluate.best_epoch = epoch
        evaluate.best_preds = preds

    print(f"\nMAPE at epoch {epoch + 1}: {mape:.2f}%")
    print(f"Best MAPE so far: {evaluate.min_mape:.2f}%"
          f" at epoch {evaluate.best_epoch + 1}\n")
    
    return mape


def train_model(
    model: nn.Module,
    loss_fn: nn.Module,
    optimizer: Optimizer,
    train_loader: DataLoader,
    test_loader: DataLoader,
    epochs: int,
    max_norm: float = 5.0,
    scheduler: Optional[LRScheduler] = None,
    exp_adjust: bool = False,
    output_dir: Optional[str] = None
) -> Tuple[List[float], List[float]]:
    train_mapes, test_mapes = [], []

    for epoch in range(epochs):
        targets, preds = [], []
                
        model.train()
        for data in train_loader:
            optimizer.zero_grad()
            data = data.to(DEVICE)
            pred = model(
                data.x_dict, 
                data.edge_index_dict, 
                data.batch_dict,
                data.y_base
            )
            loss = loss_fn(pred, data.y)
            loss.backward()

            clip_grad_norm_(
                model.parameters(), 
                max_norm=max_norm
            )
            optimizer.step()
            if scheduler is not None:
                scheduler.step()

            targets.append(data.y)
            preds.append(pred)

        targets = torch.cat(targets, dim=0)
        preds = torch.cat(preds, dim=0)
        if exp_adjust:
            targets = torch.expm1(targets)
            preds = torch.expm1(preds)
        targets = aggregate_qor_metrics(targets, train_loader.dataset.target_metric)
        preds = aggregate_qor_metrics(preds, train_loader.dataset.target_metric)

        train_mape = percentage_diff(preds, targets).mean().item()
        train_mapes.append(train_mape)

        model.eval()
        with torch.no_grad():
            test_mape = evaluate(
                model=model, 
                loader=test_loader, 
                epoch=epoch,
                exp_adjust=exp_adjust,
                output_dir=output_dir
            )
            test_mapes.append(test_mape)

    return train_mapes, test_mapes


def main(args: Dict[str, Any]):
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
    loss = args['loss']
    log_transform = args['log_transform']
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

    model_args = {
        'target_metric': target_metric,
        'in_channels': FEATURE_SIZE_BY_TYPE,
        'hidden_channels': [128, 128, 128, 128],
        'num_layers': 4,
        'metadata': METADATA,
        'heads': [4, 4, 4, 4],
        'dropout': 0.1
    }
    model = HLSQoREstimator(**model_args).to(DEVICE)

    if loss == 'mse':
        loss_fn = nn.MSELoss()
    elif loss == 'l1':
        loss_fn = nn.L1Loss()
    elif loss == 'huber':
        loss_fn = nn.HuberLoss(delta=float(args['huber_delta']))
    else:
        raise ValueError(f"Unsupported loss function: {loss}")
    
    model_dir = f"{output_dir}/models/{target_metric}/{test_bench}"
    run_number = 1
    while os.path.exists(f"{model_dir}/run_{run_number}"):
        run_number += 1
    model_dir = f"{model_dir}/run_{run_number}"
    os.makedirs(model_dir, exist_ok=True)

    pretrained_dir = f"{model_dir}/pretrained"
    model_info_dir = f"{model_dir}/model_info"
    checkpoint_dir = f"{model_dir}/checkpoint"
    plots_dir = f"{model_info_dir}/plots"

    os.makedirs(model_info_dir, exist_ok=True)
    os.makedirs(pretrained_dir, exist_ok=True)
    os.makedirs(checkpoint_dir, exist_ok=True)
    os.makedirs(plots_dir, exist_ok=True)

    with open(f"{model_info_dir}/training_args.json", 'w') as f:
        json.dump(args, f, indent=2)

    with open(f"{model_info_dir}/model_args.json", 'w') as f:
        json.dump(model_args, f, indent=2)
    
    train_loader, test_loader, scaling_stats = prepare_data_loaders(
        dataset_dir=dataset_dir, 
        target_metric=target_metric, 
        test_benches=test_bench, 
        train_benches=train_benches, 
        batch_size=batch_size, 
        log_transform=log_transform
    )
    with open(f"{model_info_dir}/scaling_stats.json", 'w') as f:
        json.dump(scaling_stats, f, indent=2)

    grouped_params = get_optimizer_param_groups(
        model=model,
        weight_decay_val=weight_decay
    )
    optimizer = torch.optim.AdamW(
        grouped_params,
        lr=learning_rate, 
        betas=betas,
    )

    steps_per_epoch = len(train_loader)
    warmup_steps = 10 * steps_per_epoch
    annealing_steps = 100 * steps_per_epoch

    warmup = torch.optim.lr_scheduler.LinearLR(
        optimizer, start_factor=0.1, end_factor=1.0, total_iters=warmup_steps
    )
    cosine = torch.optim.lr_scheduler.CosineAnnealingWarmRestarts(
        optimizer, T_0=annealing_steps, T_mult=1, eta_min=1e-6
    )
    scheduler = torch.optim.lr_scheduler.SequentialLR(
        optimizer, schedulers=[warmup, cosine], milestones=[warmup_steps]
    )

    train_errors, test_errors = train_model(
        model, loss_fn, optimizer, 
        train_loader, test_loader, epochs, 
        scheduler=scheduler, 
        max_norm=max_norm,
        exp_adjust=log_transform,
        output_dir=checkpoint_dir
    )

    indices = [
        data.solution_index 
        for data in test_loader.dataset
    ]
    preds = evaluate.best_preds.tolist()
    targets = []
    for data in test_loader:
        data = data.to(DEVICE)
        if log_transform:
            target = torch.expm1(data.y)
        else:
            target = data.y
        target = aggregate_qor_metrics(target, target_metric)
        targets.extend(target.tolist())

    with open(f"{model_info_dir}/predictions.csv", 'w') as f:
        f.write("index,target,prediction\n")
        for index, target, pred in zip(indices, targets, preds):
            f.write(f"{index},{target},{pred}\n")

    plot_prediction_bars(
        targets=targets,
        preds=preds,
        indices=indices, 
        benchmark=test_bench, 
        metric=target_metric, 
        output_path=f"{plots_dir}/predictions.png", 
        mean_error=evaluate.min_mape
    )
    save_training_artifacts(
        test_targets=targets,
        test_preds=preds,
        test_errors=test_errors,
        train_errors=train_errors,
        output_dir=plots_dir
    )

    checkpoint_model_path = f"{checkpoint_dir}/model.pt"
    model_path = f"{pretrained_dir}/{target_metric}_estimator.pt"
    if os.path.exists(checkpoint_model_path):
        shutil.copyfile(checkpoint_model_path, model_path)
    else:
        torch.save(obj=model.state_dict(), f=model_path)


def save_training_artifacts(
    test_targets: List[float],
    test_preds: List[float],
    test_errors: List[float],
    train_errors: List[float],
    output_dir: str
):
    plot_learning_curves(
        train_errors=train_errors, 
        test_errors=test_errors, 
        output_path=f"{output_dir}/learning_curve.png",
        best_epoch=evaluate.best_epoch
    )
    plot_prediction_scatter(
        targets=test_targets, 
        preds=test_preds, 
        output_path=f"{output_dir}/predictions_scatter.png", 
        mean_error=evaluate.min_mape
    )
    

def set_random_seeds(seed: int):
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    np.random.seed(seed)
    random.seed(seed)


def get_optimizer_param_groups(model, weight_decay_val):
    """
    Separates model parameters into two groups: one with weight decay and one without.
    Excludes PReLU parameters, LayerNorm parameters, and all bias terms from weight decay.
    """
    decay_params = []
    no_decay_params = []
    
    no_decay_param_names = set()

    # Find all modules that are PReLU or LayerNorm and add 
    # their parameters to the exclusion set
    for module_name, module in model.named_modules():
        if isinstance(module, (nn.PReLU, nn.LayerNorm, LayerNorm)):
            for param_name, _ in module.named_parameters():
                # Add the full parameter name like 
                # "gnn.convs.0.norm_dict.instr.weight"
                no_decay_param_names.add(f"{module_name}.{param_name}")

    # Also add all bias terms to the exclusion set
    for param_name, param in model.named_parameters():
        if param_name.endswith(".bias"):
            no_decay_param_names.add(param_name)

    # Create the two lists of parameters based on the exclusion set
    for name, param in model.named_parameters():
        if not param.requires_grad:
            continue
        
        if name in no_decay_param_names:
            no_decay_params.append(param)
        else:
            decay_params.append(param)
            
    optimizer_grouped_parameters = [
        {
            "params": decay_params,
            "weight_decay": weight_decay_val,
        },
        {
            "params": no_decay_params,
            "weight_decay": 0.0, # NO weight decay for this group
        },
    ]
    return optimizer_grouped_parameters


def prepare_data_loaders(
    dataset_dir: str,
    target_metric: str,
    test_benches: Union[List[str], str],
    train_benches: Union[List[str], str],
    batch_size: int = 32,
    log_transform: bool = False
) -> Tuple[DataLoader, DataLoader, Dict[str, Dict[str, float]]]:
    train_dataset = HLSDataset(
        root=dataset_dir, 
        target_metric=target_metric, 
        standardize=True, 
        benchmarks=train_benches, 
        log_transform=log_transform,
        mode="train"
    )
    test_dataset = HLSDataset(
        root=dataset_dir, 
        target_metric=target_metric,
        standardize=True,
        scaling_stats=train_dataset.scaling_stats,
        benchmarks=test_benches,
        log_transform=log_transform,
        mode="test"
    )
    train_loader = DataLoader(
        train_dataset, 
        batch_size=batch_size, 
        shuffle=True,
        num_workers=4,
        pin_memory=True
    )
    test_loader = DataLoader(
        test_dataset, 
        batch_size=batch_size, 
        shuffle=False,
        num_workers=4,
        pin_memory=True
    )
    return train_loader, test_loader, train_dataset.scaling_stats


def aggregate_qor_metrics(values: Tensor, target_metric: str) -> Tensor:
    if target_metric == 'area':
        return compute_snru(values, AVAILABLE_RESOURCES_TENSOR)
    elif target_metric == 'timing':
        return compute_time(values)
    elif target_metric == 'power':
        return compute_power(values)
    else:
        raise ValueError(f"Unsupported target metric: {target_metric}")


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--dataset-dir', type=str, required=True, 
                        help='The root directory of the dataset.')
    parser.add_argument('-tb', '--test-bench', type=str, required=True, 
                        help='The name of the benchmark to use for testing.')
    parser.add_argument('-t', '--target', type=str, default='area', choices=['area', 'timing', 'power'],
                        help='The target metric to predict (default: area).')
    parser.add_argument('-e', '--epoch', type=int, default=300, 
                        help='The number of training epochs (default: 300).')
    parser.add_argument('-s', '--seed', type=int, default=42, 
                        help='Random seed for repeatability (default: 42).')
    parser.add_argument('-b', '--batch', type=int, default=32, 
                        help='The size of the training batch (default: 32).')
    parser.add_argument('-l', '--loss', type=str, default='mse', choices=['mse', 'l1', 'huber'],
                        help='The loss function to use for training (default: mse).')
    parser.add_argument('-lr', '--learning-rate', type=float, default=5e-4,
                        help='The learning rate for the optimizer (default: 5e-4).')
    parser.add_argument('-bs', '--betas', type=float, nargs=2, default=(0.9, 0.999),
                        help='The betas for the Adam optimizer (default: 0.9, 0.999).')
    parser.add_argument('-wd', '--weight-decay', type=float, default=1e-4,
                        help='Weight decay for the optimizer (default: 1e-4).')
    parser.add_argument('-mn', '--max-norm', type=float, default=5.0,
                        help='Maximum norm for gradient clipping (default: 5.0).')
    parser.add_argument('-lt', '--log-transform', action='store_true',
                        help='Apply log transformation to the target variable.')
    parser.add_argument('-hd', '--huber-delta', type=float, default=1.0,
                        help='Delta parameter for Huber loss (default: 1.0). Only used if loss is set to "huber".')
    parser.add_argument('-o', '--output-dir', type=str, default='',
                        help='Directory to save the output files (default: the script directory).')
    return vars(parser.parse_args())

if __name__ == '__main__':
    args = parse_arguments()
    main(args)