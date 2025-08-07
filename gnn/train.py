import os
import argparse
import random
import json
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
from gnn.data.dataset import HLSDataset, StatsDict
from gnn.data.graph import NODE_DIM, EDGE_DIM
from gnn.analysis.utils import (
    plot_prediction_bars,
    plot_prediction_scatter,
    plot_learning_curves,
    mape_loss,
    aggregate_qor_metrics
)
from gnn.utils import static_vars

DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')


class CheckpointManager:
    def __init__(self, output_dir: str):
        self.output_dir = output_dir
        if not os.path.exists(output_dir):
            os.makedirs(output_dir, exist_ok=True)

        self._mape_checkpoints = [float('inf')] * 4
        self._preds_checkpoints = [None] * 4

    def is_best_checkpoint(self, mape: float, epoch: int) -> bool:
        if epoch <= 15:
            return False
        elif 15 < epoch <= 50:
            if mape < self._mape_checkpoints[0]:
                self._mape_checkpoints[0] = mape
                return True
        elif 50 < epoch <= 100:
            if mape < self._mape_checkpoints[1]:
                self._mape_checkpoints[1] = mape
                return True
        elif 100 < epoch <= 200:
            if mape < self._mape_checkpoints[2]:
                self._mape_checkpoints[2] = mape
                return True
        else:
            if mape <= self._mape_checkpoints[3]:
                self._mape_checkpoints[3] = mape
                return True
        return False
    
    def get_min_mape(self) -> float:
        return min(self._mape_checkpoints)
    
    def get_best_predictions(self) -> Optional[Tensor]:
        best_index = self._mape_checkpoints.index(min(self._mape_checkpoints))
        return self._preds_checkpoints[best_index]

    def save(
        self, model: nn.Module, epoch: int, mape: float,
        preds: Tensor, targets: Tensor, indices: List[int]
    ):
        if epoch <= 50:
            epoch_index = 0
        elif 50 < epoch <= 100:
            epoch_index = 1
        elif 100 < epoch <= 200:
            epoch_index = 2
        else:
            epoch_index = 3

        self._preds_checkpoints[epoch_index] = preds
        self._mape_checkpoints[epoch_index] = mape

        model_path = f"{self.output_dir}/model_{epoch_index}.pt"
        preds_path = f"{self.output_dir}/predictions_{epoch_index}.csv"
        mape_path = f"{self.output_dir}/mape_{epoch_index}.txt"

        torch.save(obj=model.state_dict(), f=model_path)

        with open(preds_path, "w") as f:
            f.write(f"index,target,prediction\n")
            for index, target, pred in zip(indices, targets.tolist(), preds.tolist()):
                f.write(f"{index},{target},{pred}\n")
        
        with open(mape_path, "w") as f:
            f.write(f"Epoch {epoch + 1}: MAPE = {mape:.4f}%\n")


@static_vars(checkpoint_manager=None)
def evaluate(
    model: nn.Module,
    loader: DataLoader,
    epoch: int,
    output_dir: str,
    mean_target: Tensor,
    std_target: Tensor,
    available_resources: Optional[Tensor] = None
) -> float:
    if not evaluate.checkpoint_manager:
        evaluate.checkpoint_manager = CheckpointManager(output_dir)

    targets, preds = [], []
    for data in loader:
        data = data.to(DEVICE)
        pred = model(
            data.x, 
            data.edge_index,
            data.edge_attr,
            data.batch,
            data.y_base
        )
        targets.append(data.original_y)
        preds.append(torch.expm1(pred * std_target + mean_target))

    targets = aggregate_qor_metrics(
        torch.cat(targets, dim=0), 
        loader.dataset.target_metric,
        available_resources=available_resources
    )
    preds = aggregate_qor_metrics(
        torch.cat(preds, dim=0), 
        loader.dataset.target_metric,
        available_resources=available_resources
    )
    mape = mape_loss(preds, targets).item()

    print(f"\nMAPE at epoch {epoch + 1}: {mape:.4f}")

    if evaluate.checkpoint_manager.is_best_checkpoint(mape, epoch):
        indices = [data.solution_index for data in loader.dataset]
        evaluate.checkpoint_manager.save(
            model=model, 
            epoch=epoch, 
            mape=mape, 
            preds=preds, 
            targets=targets, 
            indices=indices
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
    output_dir: str,
    max_norm: float = 5.0,
    scheduler: Optional[LRScheduler] = None,
    available_resources: Optional[Tensor] = None
) -> Tuple[List[float], List[float]]:
    train_mapes, test_mapes = [], []

    mean_target = torch.tensor(
        [value['mean'] for value in target_scaling_stats.values()],
        dtype=torch.float32, device=DEVICE
    )
    std_target = torch.tensor(
        [value['std'] for value in target_scaling_stats.values()],
        dtype=torch.float32, device=DEVICE
    )

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
                data.y_base
            )
            loss = loss_fn(pred, data.y)
            loss.backward()
            clip_grad_norm_(model.parameters(), max_norm=max_norm)
            optimizer.step()
            if scheduler is not None:
                scheduler.step()

            targets.append(data.original_y)
            preds.append(torch.expm1(pred * std_target + mean_target))

        targets = aggregate_qor_metrics(
            torch.cat(targets, dim=0), 
            train_loader.dataset.target_metric,
            available_resources=available_resources
        )
        preds = aggregate_qor_metrics(
            torch.cat(preds, dim=0), 
            train_loader.dataset.target_metric,
            available_resources=available_resources
        )
        train_mape = mape_loss(preds, targets).item()
        train_mapes.append(train_mape)

        model.eval()
        with torch.no_grad():
            test_mape = evaluate(
                model=model, 
                loader=test_loader, 
                epoch=epoch,
                output_dir=output_dir,
                mean_target=mean_target,
                std_target=std_target,
                available_resources=available_resources
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
    output_dir = args['output_dir']
    
    if not dataset_dir.endswith("/full"):
        if not dataset_dir:
            raise ValueError(
                "Dataset directory must be specified with -d or --dataset-dir."
            )
        full_dataset_dir = f"{dataset_dir}/full"
    else:
        full_dataset_dir = dataset_dir

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
        'target_metric': target_metric,
        'in_channels': NODE_DIM,
        'hidden_channels': 160,
        'num_layers': 3,
        'edge_dim': EDGE_DIM,
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
        loss_fn = nn.HuberLoss(delta=float(args['huber_delta']))
    else:
        raise ValueError(f"Unsupported loss function: {loss}")
    
    if not output_dir:
        output_dir = os.path.dirname(os.path.abspath(__file__))
        output_dir = os.path.join(output_dir, f'{target_metric}_models')

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

    info_dir = os.path.join(output_dir, "info")
    os.makedirs(info_dir, exist_ok=True)

    with open(f"{info_dir}/pretraining_args.json", 'w') as f:
        json.dump(args, f, indent=2)

    with open(f"{info_dir}/model_args.json", 'w') as f:
        json.dump(model_args, f, indent=2)
    
    train_loader, test_loader, scaling_stats, \
        base_target_scaling_stats, target_scaling_stats = prepare_data_loaders(
        dataset_dir=dataset_dir, 
        target_metric=target_metric, 
        test_benches=test_bench, 
        train_benches=train_benches, 
        batch_size=batch_size
    )
    with open(f"{info_dir}/scaling_stats.json", 'w') as f:
        json.dump(scaling_stats, f, indent=2)
    with open(f"{info_dir}/base_target_scaling_stats.json", 'w') as f:
        json.dump(base_target_scaling_stats, f, indent=2)
    with open(f"{info_dir}/target_scaling_stats.json", 'w') as f:
        json.dump(target_scaling_stats, f, indent=2)

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

    if target_metric == 'area':
        from gnn.data.utils.parsers import AVAILABLE_RESOURCES
        from gnn.data.dataset import TARGET_AREA_METRICS

        available_resources = torch.tensor(
            [AVAILABLE_RESOURCES[key] for key in TARGET_AREA_METRICS],
            dtype=torch.float32,
            device=DEVICE
        )
    else:
        available_resources = None

    train_errors, test_errors = train_model(
        model, loss_fn, optimizer, 
        train_loader, test_loader, epochs, 
        target_scaling_stats,
        scheduler=scheduler, 
        max_norm=max_norm,
        output_dir=output_dir,
        available_resources=available_resources
    )

    indices = [data.solution_index for data in test_loader.dataset]
    preds = evaluate.checkpoint_manager.get_best_predictions().tolist()

    all_original_targets = []
    for data in test_loader:
        all_original_targets.append(data.original_y)

    targets = aggregate_qor_metrics(
        torch.cat(all_original_targets, dim=0).to(DEVICE),
        target_metric,
        available_resources=available_resources
    ).tolist()

    min_mape = evaluate.checkpoint_manager.get_min_mape()
        
    plot_prediction_bars(
        targets=targets,
        preds=preds,
        indices=indices, 
        benchmark=test_bench, 
        metric=target_metric, 
        output_path=f"{info_dir}/predictions.png", 
        mean_error=min_mape
    )
    save_training_artifacts(
        test_targets=targets,
        test_preds=preds,
        test_errors=test_errors,
        train_errors=train_errors,
        min_mape=min_mape,
        output_dir=info_dir
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
        mean_error=min_mape
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
            "weight_decay": 0.0, # No weight decay for this group
        },
    ]
    return optimizer_grouped_parameters


def prepare_data_loaders(
    dataset_dir: str,
    target_metric: str,
    test_benches: Union[List[str], str],
    train_benches: Union[List[str], str],
    batch_size: int = 32
) -> Tuple[DataLoader, DataLoader, StatsDict, StatsDict, StatsDict]:
    train_dataset = HLSDataset(
        root=dataset_dir, 
        target_metric=target_metric, 
        scaling_stats=None,  # Will be computed
        base_target_scaling_stats= None,  # Will be computed
        target_scaling_stats=None,  # Will be computed
        benchmarks=train_benches, 
        mode="train"
    )
    test_dataset = HLSDataset(
        root=dataset_dir, 
        target_metric=target_metric,
        scaling_stats=train_dataset.scaling_stats,
        base_target_scaling_stats=train_dataset.base_target_scaling_stats,
        target_scaling_stats=train_dataset.target_scaling_stats,
        benchmarks=test_benches,
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
    return (
        train_loader, test_loader, 
        train_dataset.scaling_stats,
        train_dataset.base_target_scaling_stats,
        train_dataset.target_scaling_stats
    )


def parse_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--dataset-dir', type=str, default='gnn/dataset', 
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
    parser.add_argument('-hd', '--huber-delta', type=float, default=1.0,
                        help='Delta parameter for Huber loss (default: 1.0). Only used if loss is set to "huber".')
    parser.add_argument('-o', '--output-dir', type=str, default='',
                        help='Directory to save the output files (default: the script directory).')
    return vars(parser.parse_args())

if __name__ == '__main__':
    args = parse_arguments()
    main(args)