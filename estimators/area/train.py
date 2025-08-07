import os
import argparse
import json
from typing import List, Dict, Tuple, Optional, Union, Any

import matplotlib
import torch
import torch.nn as nn
from torch import Tensor
from torch.nn.utils import clip_grad_norm_
from torch.optim import Optimizer
from torch.optim.lr_scheduler import LRScheduler

from torch_geometric.loader import DataLoader

from estimators.area.models import HLSQoREstimator
from estimators.area.dataset import HLSDataset, StatsDict
from estimators.area.graph import NODE_DIM, EDGE_DIM, GRAPH_ATTR_DIM
from estimators.area.data_utils import compute_snru

from estimators.common.perf_visualization import (
    plot_prediction_bars,
    plot_prediction_scatter,
    plot_learning_curves
)
from estimators.common.losses import mape_loss
from estimators.common.parsers import AVAILABLE_RESOURCES, AREA_METRICS
from estimators.common.training_utils import (
    CheckpointManager, 
    group_params_for_weight_decay,
    set_random_seeds
)

DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

checkpoint_manager = None


def evaluate(
    model: nn.Module,
    loader: DataLoader,
    epoch: int,
    mean_target: Tensor,
    std_target: Tensor,
    available_resources: Optional[Tensor] = None
) -> float:
    global checkpoint_manager

    targets, preds = [], []
    for data in loader:
        data = data.to(DEVICE)
        pred = model(
            data.x, 
            data.edge_index,
            data.edge_attr,
            data.batch,
            data.graph_attr
        )
        targets.append(data.original_y)
        preds.append(torch.expm1(pred * std_target + mean_target))

    targets = compute_snru(torch.cat(targets, dim=0), available_resources)
    preds = compute_snru(torch.cat(preds, dim=0), available_resources)
    mape = mape_loss(preds, targets).item()

    print(f"\nMAPE at epoch {epoch + 1}: {mape:.4f}")

    if checkpoint_manager.check_improvement(mape, epoch + 1, update=True):
        indices = [data.solution_index for data in loader.dataset]
        checkpoint_manager.save_checkpoint(
            model=model, epoch=epoch + 1, mape=mape, 
            preds=preds, targets=targets, indices=indices,
            check_for_improvement=False
        )
        print(f"Saving model at epoch {epoch + 1} with MAPE = {mape:.4f}")

    return mape


def train_model(
    model: nn.Module,
    loss_fn: nn.Module,
    optimizer: Optimizer,
    train_loader: DataLoader,
    test_loader: DataLoader,
    epochs: int,
    target_scaling_stats: StatsDict,
    max_norm: float = 5.0,
    scheduler: Optional[LRScheduler] = None,
    available_resources: Optional[Tensor] = None
) -> Tuple[List[float], List[float]]:
    mean_target = torch.tensor(
        [value['mean'] for value in target_scaling_stats.values()],
        dtype=torch.float32, device=DEVICE
    )
    std_target = torch.tensor(
        [value['std'] for value in target_scaling_stats.values()],
        dtype=torch.float32, device=DEVICE
    )
    train_mapes, test_mapes = [], []

    for epoch in range(epochs):
        targets, preds = [], []  
        model.train()
        for data in train_loader:
            optimizer.zero_grad()
            data = data.to(DEVICE)
            pred = model(
                data.x, 
                data.edge_index,
                data.edge_attr,
                data.batch,
                data.graph_attr
            )
            loss = loss_fn(pred, data.y)
            loss.backward()
            clip_grad_norm_(model.parameters(), max_norm=max_norm)
            optimizer.step()
            if scheduler is not None:
                scheduler.step()

            targets.append(data.original_y)
            preds.append(torch.expm1(pred * std_target + mean_target))

        targets = compute_snru(torch.cat(targets, dim=0), available_resources)
        preds = compute_snru(torch.cat(preds, dim=0), available_resources)
        train_mape = mape_loss(preds, targets).item()
        train_mapes.append(train_mape)

        model.eval()
        with torch.no_grad():
            test_mape = evaluate(
                model=model, 
                loader=test_loader, 
                epoch=epoch,
                mean_target=mean_target,
                std_target=std_target,
                available_resources=available_resources
            )
            test_mapes.append(test_mape)

    return train_mapes, test_mapes


def main(args: Dict[str, Any]):
    global checkpoint_manager

    dataset_dir = args['dataset_dir']
    test_bench = args['test_bench']
    epochs = int(args['epoch'])
    batch_size = int(args['batch'])
    seed = int(args['seed'])
    learning_rate = float(args['learning_rate'])
    betas = tuple(map(float, args['betas']))
    weight_decay = float(args['weight_decay'])
    max_norm = float(args['max_norm'])
    loss = args['loss']
    output_dir = args['output_dir']
    burn_in = int(args.get('burn_in', 15))
    
    if not os.path.exists(dataset_dir):
        raise FileNotFoundError(f"Dataset directory not found: {dataset_dir}")

    full_dataset_dir = f"{dataset_dir}/full"

    if not os.path.exists(full_dataset_dir):
        raise FileNotFoundError(
            f"Dataset directory {full_dataset_dir} does not exist."
        )
    
    matplotlib.use('Agg')
    torch.autograd.set_detect_anomaly(True)
    torch.set_printoptions(edgeitems=20, linewidth=200, sci_mode=False)

    set_random_seeds(seed)

    test_bench = test_bench.upper()
    benches = sorted(os.listdir(full_dataset_dir))
    train_benches = [b for b in benches if b != test_bench]

    model_args = {
        'in_channels': NODE_DIM,
        'hidden_channels': 160,
        'num_layers': 3,
        'edge_dim': EDGE_DIM,
        'graph_attr_dim': GRAPH_ATTR_DIM,
        'heads': 4,
        'negative_slope': 0.2,
        'dropout_gnn': 0.1,
        'dropout_mlp': 0.1,
        'gmt_k': 16,
        'jk_mode': 'lstm'
    }
    model = HLSQoREstimator(**model_args).to(DEVICE)

    if loss == 'mse':
        loss_fn = nn.MSELoss()
    elif loss == 'l1':
        loss_fn = nn.L1Loss()
    elif loss == 'huber':
        delta = float(args.get('huber_delta', 1.0))
        if delta <= 0:
            raise ValueError("Huber delta must be a positive number.")
        loss_fn = nn.HuberLoss(delta=delta)
    else:
        raise ValueError(f"Unsupported loss function: {loss}")
    
    if not output_dir:
        output_dir = os.path.dirname(os.path.abspath(__file__))
        output_dir = os.path.join(output_dir, 'models')

    if not os.path.exists(output_dir):
        os.makedirs(output_dir, exist_ok=True)

    output_dir = os.path.join(output_dir, test_bench)
    if not os.path.exists(output_dir):
        output_dir = os.path.join(output_dir, "run_1")
    else:
        run_number = 1
        while os.path.exists(f"{output_dir}/run_{run_number}"):
            run_number += 1
        output_dir = f"{output_dir}/run_{run_number}"
    os.makedirs(output_dir, exist_ok=True)

    with open(f"{output_dir}/pretraining_args.json", 'w') as f:
        json.dump(args, f, indent=2)

    with open(f"{output_dir}/model_args.json", 'w') as f:
        json.dump(model_args, f, indent=2)
    
    train_loader, test_loader, scaling_stats, \
        graph_attr_scaling_stats, target_scaling_stats = prepare_data_loaders(
        dataset_dir=dataset_dir, 
        test_benches=test_bench, 
        train_benches=train_benches, 
        batch_size=batch_size
    )
    with open(f"{output_dir}/scaling_stats.json", 'w') as f:
        json.dump(scaling_stats, f, indent=2)
    with open(f"{output_dir}/graph_attr_scaling_stats.json", 'w') as f:
        json.dump(graph_attr_scaling_stats, f, indent=2)
    with open(f"{output_dir}/target_scaling_stats.json", 'w') as f:
        json.dump(target_scaling_stats, f, indent=2)

    grouped_params = group_params_for_weight_decay(
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

    available_resources = torch.tensor(
        [AVAILABLE_RESOURCES[key] for key in AREA_METRICS],
        dtype=torch.float32,
        device=DEVICE
    )
    checkpoint_manager = CheckpointManager(output_dir, burn_in_epochs=burn_in)

    train_errors, test_errors = train_model(
        model, loss_fn, optimizer, 
        train_loader, test_loader, epochs, 
        target_scaling_stats,
        scheduler=scheduler, 
        max_norm=max_norm,
        available_resources=available_resources
    )
    indices = [data.solution_index for data in test_loader.dataset]
    preds = checkpoint_manager.get_best_outputs().tolist()

    all_original_targets = []
    for data in test_loader:
        all_original_targets.append(data.original_y)

    targets = compute_snru(
        torch.cat(all_original_targets, dim=0).to(DEVICE),
        available_resources
    ).tolist()

    min_mape = checkpoint_manager.get_minimum_mape()
    
    plot_prediction_bars(
        targets=targets,
        preds=preds,
        indices=indices, 
        benchmark=test_bench, 
        metric='area', 
        output_path=f"{output_dir}/predictions.png", 
        mape=min_mape
    )
    save_training_artifacts(
        test_targets=targets,
        test_preds=preds,
        test_errors=test_errors,
        train_errors=train_errors,
        min_mape=min_mape,
        output_dir=output_dir
    )


def save_training_artifacts(
    test_targets: List[float],
    test_preds: List[float],
    test_errors: List[float],
    train_errors: List[float],
    min_mape: float,
    output_dir: str
):
    plot_learning_curves(
        train_errors=train_errors, 
        test_errors=test_errors, 
        output_path=f"{output_dir}/learning_curve.png"
    )
    plot_prediction_scatter(
        targets=test_targets, 
        preds=test_preds, 
        output_path=f"{output_dir}/predictions_scatter.png", 
        mape=min_mape
    )
    

def prepare_data_loaders(
    dataset_dir: str,
    test_benches: Union[List[str], str],
    train_benches: Union[List[str], str],
    batch_size: int = 32
) -> Tuple[DataLoader, DataLoader, StatsDict, StatsDict, StatsDict]:
    train_dataset = HLSDataset(
        root=dataset_dir, 
        mode="train",
        benchmarks=train_benches,

        # Will be computed
        scaling_stats=None,
        graph_attr_scaling_stats=None,
        target_scaling_stats=None
    )
    test_dataset = HLSDataset(
        root=dataset_dir, 
        mode="test",
        benchmarks=test_benches,
        scaling_stats=train_dataset.scaling_stats,
        graph_attr_scaling_stats=train_dataset.graph_attr_scaling_stats,
        target_scaling_stats=train_dataset.target_scaling_stats
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
    return (
        train_loader, test_loader, 
        train_dataset.scaling_stats,
        train_dataset.graph_attr_scaling_stats,
        train_dataset.target_scaling_stats
    )


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--dataset-dir', type=str, default='estimators/area/dataset', 
                        help='The root directory of the dataset.')
    parser.add_argument('-tb', '--test-bench', type=str, required=True, 
                        help='The name of the benchmark to use for testing.')
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
    parser.add_argument('-hd', '--huber-delta', type=float, default=1.0,
                        help='Delta parameter for Huber loss (default: 1.0). Only used if loss is set to "huber".')
    parser.add_argument('-bi', '--burn-in', type=int, default=15,
                        help='Number of burn-in epochs before saving the first checkpoint (default: 15).')
    parser.add_argument('-o', '--output-dir', type=str, default='',
                        help='Directory to save the output files (default: the script directory).')
    return vars(parser.parse_args())


if __name__ == '__main__':
    args = parse_arguments()
    main(args)