import json
import os
from typing import Dict, Optional, List, Any, Tuple

import torch
import torch.nn as nn
from torch import Tensor

from torch_geometric.loader import DataLoader

from estimators.common.parsers import AREA_METRICS, AVAILABLE_RESOURCES
from estimators.area.models import HLSQoREstimator
from estimators.area.dataset import HLSDataset, StatsDict
from estimators.area.data_utils import compute_snru
from estimators.common.losses import mape_loss


def get_layerwise_decay_params(model, initial_lr, weight_decay, decay_rate=0.9):
    """Creates parameter groups with a decaying learning rate for each GNN layer."""
    params = []

    # Add the head MLPs with the highest learning rate
    head_prefixes = ['mlps.', 'graph_attr_mlp.']
    params.append({
        'params': [p for n, p in model.named_parameters() if any(n.startswith(prefix) for prefix in head_prefixes)],
        'lr': initial_lr,
        'weight_decay': weight_decay
    })

    # Add each GNN layer with a successively smaller LR
    num_gnn_layers = model.gnn.num_layers
    for i in range(num_gnn_layers):
        layer_lr = initial_lr * (decay_rate ** (num_gnn_layers - i))
        layer_prefixes = [f'gnn.convs.{i}.', f'gnn.norms.{i}.']
        params.append({
            'params': [p for n, p in model.named_parameters() if any(n.startswith(prefix) for prefix in layer_prefixes)],
            'lr': layer_lr,
            'weight_decay': weight_decay
        })

    # Add the remaining parameters (e.g., projection, GNN out_lin) with a small LR
    remaining_params = [
        p for n, p in model.named_parameters() 
        if not any(n.startswith(pfx) for pfx in head_prefixes) and 
           not any(n.startswith(f'gnn.convs.{i}.') or n.startswith(f'gnn.norms.{i}.') for i in range(num_gnn_layers))
    ]
    params.append({
        'params': remaining_params,
        'lr': initial_lr * (decay_rate ** (num_gnn_layers + 1)),
        'weight_decay': weight_decay
    })
    return params


def prepare_data_loader(
    dataset_dir: str, 
    benchmark: str,
    scaling_stats: StatsDict,
    target_scaling_stats: StatsDict,
    base_target_scaling_stats: StatsDict,
    batch_size: int = 10,
    mode: str = "fine_tune"
) -> DataLoader:
    if not isinstance(benchmark, list):
        benchmark = [benchmark]
    dataset = HLSDataset(
        root=dataset_dir,
        mode=mode,
        benchmarks=benchmark,
        scaling_stats=scaling_stats,
        target_scaling_stats=target_scaling_stats,
        base_target_scaling_stats=base_target_scaling_stats
    )
    loader = DataLoader(
        dataset, 
        batch_size=batch_size, 
        shuffle=True,
        num_workers=4,
        pin_memory=True
    )
    return loader


def evaluate(
    model: nn.Module,
    loader: DataLoader,
    mean_target: Tensor,
    std_target: Tensor,
    available_resources: Tensor,
    device: Optional[torch.device] = None
) -> Tuple[List[float], List[float], float]:
    if device is None:
        device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

    if available_resources is None:
        available_resources = torch.tensor(
            [AVAILABLE_RESOURCES[key] for key in AREA_METRICS],
            dtype=torch.float32,
            device=device
        )

    preds, targets = [], []
    model.eval()
    with torch.no_grad():
        for data in loader:
            data = data.to(device)
            pred = model(
                data.x, 
                data.edge_index,
                data.edge_attr,
                data.batch,
                data.y_base
            )
            targets.append(data.original_y)
            preds.append(torch.expm1(pred * std_target + mean_target))

    targets = compute_snru(torch.cat(targets, dim=0), available_resources)
    preds = compute_snru(torch.cat(preds, dim=0), available_resources)
    mape = mape_loss(preds, targets).item()

    return preds.tolist(), targets.tolist(), mape


def load_pretrained_model(
    model_path: str, 
    model_args: Optional[Dict[str, Any]] = None,
    model_args_path: Optional[str] = None,
    device: Optional[torch.device] = None,
    **kwargs: Any
) -> Tuple[HLSQoREstimator, Dict[str, Any]]:
    if device is None:
        device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

    if model_args is None:
        if model_args_path is None or not os.path.exists(model_args_path):
            raise FileNotFoundError(f"Model args file {model_args_path} does not exist.")
        model_args = load_model_args(model_args_path, **kwargs)

    model = HLSQoREstimator(**model_args)
    model.load_state_dict(torch.load(model_path, map_location=device))
    model.to(device)
    return model


def load_model_args(model_args_path: str, **kwargs: Any) -> Dict[str, Any]:
    with open(model_args_path, 'r') as f:
        model_args = json.load(f)
    model_args.update(kwargs)
    return model_args