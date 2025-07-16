import random
import json
from typing import Dict, List, Union, Any, Optional, Tuple

import numpy as np
import torch
import torch.nn as nn
from torch import Tensor
from torch.nn import LayerNorm, Module
from torch_geometric.loader import DataLoader

from gnn.models import HLSQoREstimator
from gnn.fine_tuning.data.dataset import HLSFineTuningDataset
from gnn.data.dataset import HLSDataset
from gnn.analysis.utils import (
    robust_mape,
    aggregate_qor_metrics
)


def group_params_for_weight_decay(model, weight_decay_val):
    """
    Separates model parameters into two groups: one with weight decay and one without.
    Excludes PReLU parameters, LayerNorm parameters, and all bias terms from weight decay.
    """
    decay_params = []
    no_decay_params = []
    
    no_decay_param_names = get_no_decay_param_names(model)

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


def get_no_decay_param_names(model):
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
    for param_name, _ in model.named_parameters():
        if param_name.endswith(".bias"):
            no_decay_param_names.add(param_name)

    return no_decay_param_names



def set_random_seeds(seed: int):
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    np.random.seed(seed)
    random.seed(seed)


def prepare_fine_tuning_data_loader(
    dataset_dir: str, 
    target_metric: str,
    scaling_stats: Dict[str, Dict[str, float]],
    batch_size: int = 16,
) -> DataLoader:
    dataset = HLSFineTuningDataset(
        root=dataset_dir,
        target_metric=target_metric, 
        scaling_stats=scaling_stats,
    )
    loader = DataLoader(
        dataset, 
        batch_size=batch_size, 
        shuffle=True,
        num_workers=4,
        pin_memory=True
    )
    return loader


def prepare_evaluation_data_loader(
    dataset_dir: str,
    target_metric: str,
    benchmarks: Union[str, List[str]],
    batch_size: int = 16,
    scaling_stats: Dict[str, Any] = None,
    mode: str = "evaluate"
) -> DataLoader:
    if isinstance(benchmarks, str):
        benchmarks = [benchmarks]
    dataset = HLSDataset(
        root=dataset_dir, 
        target_metric=target_metric, 
        scaling_stats=scaling_stats,
        benchmarks=benchmarks, 
        mode=mode
    )
    loader = DataLoader(
        dataset, 
        batch_size=batch_size, 
        shuffle=False,
        num_workers=4,
        pin_memory=True
    )
    return loader


def evaluate_fine_tuning(
    model: nn.Module,
    loader: DataLoader,
    available_resources: Optional[Tensor] = None,
    device: Optional[torch.device] = None
):
    if device is None:
        device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

    preds, targets = [], []
    model.eval()
    with torch.no_grad():
        for data in loader:
            data = data.to(device)
            pred = model(
                data.x_dict,
                data.edge_index_dict,
                data.batch_dict,
                data.y_base
            )
            preds.append(pred)
            targets.append(data.y)

    preds = torch.cat(preds).exp1m()
    targets = torch.cat(targets).expm1()

    preds = aggregate_qor_metrics(
        preds, loader.dataset.target_metric,
        available_resources=available_resources
    )
    targets = aggregate_qor_metrics(
        targets, loader.dataset.target_metric,
        available_resources=available_resources
    )
    mape = robust_mape(preds, targets).mean().item()
    
    return preds.tolist(), targets.tolist(), mape


def load_pretrained_model(
    model_path: str, 
    model_args_path: str,
    return_args: bool = False,
    device: Optional[torch.device] = None
) -> Union[Module, Tuple[Module, Dict[str, Any]]]:
    if device is None:
        device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

    model_args = load_model_args(model_args_path)
    model = HLSQoREstimator(**model_args)

    model.load_state_dict(torch.load(model_path, map_location=device))
    model.to(device)

    if return_args:
        return model, model_args
    return model


def load_model_args(model_args_path: str) -> Dict[str, Any]:
    with open(model_args_path, 'r') as f:
        model_args = json.load(f)

    metadata = model_args["metadata"]
    model_args["metadata"] = (
        metadata[0], 
        [(et[0], et[1], et[2]) for et in metadata[1]]
    )
    return model_args