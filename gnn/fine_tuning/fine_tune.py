import os
import json
import random
from typing import Dict, Optional

import numpy as np
import torch
import torch.nn as nn
from torch.nn.utils import clip_grad_norm_
from torch import Tensor

from torch_geometric.loader import DataLoader
from torch_geometric.nn import LayerNorm

from gnn.models import HLSQoREstimator
from gnn.fine_tuning.data.dataset import HLSFineTuningDataset
from gnn.fine_tuning.utils import get_no_decay_param_names
from gnn.fine_tuning.heuristic.domain import PARAM_GROUPS
from gnn.data.dataset import HLSDataset, StatsDict, TARGET_METRICS
from gnn.data.utils.parsers import AVAILABLE_RESOURCES
from gnn.analysis.utils import (
    plot_prediction_bars,
    mape_loss,
    aggregate_qor_metrics
)

DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')


def evaluate(
    model: nn.Module,
    loader: DataLoader,
    mean_target: Tensor,
    std_target: Tensor,
    available_resources: Optional[Tensor] = None
):
    preds, targets = [], []
    model.eval()
    with torch.no_grad():
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

    preds = aggregate_qor_metrics(
        torch.cat(preds, dim=0), 
        loader.dataset.target_metric,
        available_resources=available_resources
    )
    targets = aggregate_qor_metrics(
        torch.cat(targets, dim=0), 
        loader.dataset.target_metric,
        available_resources=available_resources
    )
    mape = mape_loss(preds, targets).item()

    return preds.tolist(), targets.tolist(), mape


def prepare_data_loader_ft(
    dataset_dir: str, 
    target_metric: str,
    scaling_stats: StatsDict,
    base_target_scaling_stats: StatsDict, 
    target_scaling_stats: StatsDict,
    benchmark: str = "",
    batch_size: int = 8,
) -> DataLoader:
    dataset = HLSFineTuningDataset(
        root=dataset_dir,
        scaling_stats=scaling_stats,
        base_target_scaling_stats=base_target_scaling_stats,
        target_scaling_stats=target_scaling_stats,
        target_metric=target_metric,
        benchmark=benchmark
    )
    loader = DataLoader(
        dataset, 
        batch_size=batch_size, 
        shuffle=True,
        num_workers=4,
        pin_memory=True
    )
    return loader


def prepare_data_loader_eval(
    dataset_dir: str,
    target_metric: str,
    benchmark: str,
    scaling_stats: StatsDict,
    base_target_scaling_stats: StatsDict, 
    target_scaling_stats: StatsDict,
    batch_size: int = 16
) -> DataLoader:
    dataset = HLSDataset(
        root=dataset_dir, 
        target_metric=target_metric, 
        scaling_stats=scaling_stats,
        base_target_scaling_stats=base_target_scaling_stats,
        target_scaling_stats=target_scaling_stats,
        benchmarks=[benchmark], 
        mode=f"evaluate_{benchmark}"
    )
    loader = DataLoader(
        dataset, 
        batch_size=batch_size, 
        shuffle=False,
        num_workers=4,
        pin_memory=True
    )
    return loader


def load_model(model_path: str, model_args_path: str) -> nn.Module:
    with open(model_args_path, 'r') as f:
        model_args = json.load(f)
    model = HLSQoREstimator(**model_args)
    model.load_state_dict(torch.load(model_path, map_location=DEVICE))
    return model, model_args


def load_lr_config(model: nn.Module, weight_decay_val: float):
    lr_config_path = "gnn/fine_tuning/heuristic/best_config.json"
    if not os.path.exists(lr_config_path):
        lr_config_path = "gnn/fine_tuning/heuristic/initial_config.json"

    with open(lr_config_path, 'r') as f:
        lr_config_list = json.load(f)

    param_group_dict = {}
    for i, group in enumerate(PARAM_GROUPS):
        for param in group:
            param_group_dict[param] = i

    decay_param_groups = [
        {
            'params': [],
            'lr': lr_config["lr"],
            'weight_decay': weight_decay_val
        }
        for lr_config in lr_config_list
    ]
    no_decay_param_groups = [
        {
            'params': [],
            'lr': lr_config["lr"],
            'weight_decay': 0.0
        }
        for lr_config in lr_config_list
    ]
    no_decay_param_names = get_no_decay_param_names(model)

    for param_name, param in model.named_parameters():
        group_index = param_group_dict.get(param_name, 0)
        lr = lr_config_list[group_index]["lr"]
        if lr < 1e-6:
            param.requires_grad = False
            continue
        param.requires_grad = True
        if param_name in no_decay_param_names:
            no_decay_param_groups[group_index]['params'].append(param)
        else:
            decay_param_groups[group_index]['params'].append(param)

    param_groups = [
        group for group in decay_param_groups + no_decay_param_groups
        if group['params']
    ]
    return param_groups


def main(args: Dict[str, str]):
    dataset_dir = args.get("dataset_dir")
    model_dir = args.get("model_dir")
    batch_size = int(args.get("batch_size", 8))
    epochs = int(args.get("epochs", 15))
    output_dir = args.get("output_dir", "")
    lr = float(args.get("learning_rate", 1e-5))

    if not dataset_dir or not model_dir:
        raise ValueError("Dataset directory, model path and model args path are required.")
    
    model_path = os.path.join(model_dir, 'model.pt')
    model_args_path = os.path.join(model_dir, 'model_args.json')
    pretraining_args_path = os.path.join(model_dir, 'pretraining_args.json')
    scaling_stats_path = os.path.join(model_dir, 'scaling_stats.json')
    target_scaling_stats_path = os.path.join(model_dir, 'target_scaling_stats.json')
    base_target_scaling_stats_path = os.path.join(model_dir, 'base_target_scaling_stats.json')

    required_paths = [
        dataset_dir, model_path, model_args_path, 
        pretraining_args_path, scaling_stats_path,
        target_scaling_stats_path, base_target_scaling_stats_path
    ]
    if not all(os.path.exists(path) for path in required_paths):
        raise FileNotFoundError("One or more required paths do not exist.")
    
    output_dir = output_dir or os.path.join(model_dir, 'fine_tuning')
    os.makedirs(output_dir, exist_ok=True)
    
    with open(pretraining_args_path, 'r') as f:
        pretraining_args = json.load(f)

    with open(scaling_stats_path, 'r') as f:
        scaling_stats = json.load(f)

    with open(target_scaling_stats_path, 'r') as f:
        target_scaling_stats = json.load(f)

    with open(base_target_scaling_stats_path, 'r') as f:
        base_target_scaling_stats = json.load(f)

    target_metric = pretraining_args.get('target')
    if not target_metric:
        raise ValueError("Target metric must be specified in pretraining arguments.")

    benchmark = pretraining_args.get("test_bench")
    betas = pretraining_args.get('betas', (0.9, 0.999))
    weight_decay = pretraining_args.get('weight_decay', 1e-4)
    max_norm = pretraining_args.get('max_norm', None)
    seed = pretraining_args.get('seed', 42)
    loss = pretraining_args.get('loss', 'mse')
    huber_delta = pretraining_args.get('huber_delta', 1.0)

    set_random_seeds(seed)

    # Load the dataset
    ft_loader = prepare_data_loader_ft(
        dataset_dir, target_metric, scaling_stats,
        base_target_scaling_stats, target_scaling_stats,
        benchmark=benchmark,
        batch_size=batch_size,
    )
    
    # Load the model
    model, model_args = load_model(model_path, model_args_path)
    model = model.to(DEVICE)

    # Prepare the optimizer
    grouped_params = get_layerwise_decay_params(
        model,
        initial_lr=lr,
        weight_decay=weight_decay,
        decay_rate=0.9
    )
    # grouped_params = load_lr_config(model, weight_decay)
    optimizer = torch.optim.AdamW(
        grouped_params, 
        betas=betas
    )

    if loss == 'l1':
        loss_fn = nn.L1Loss()
    elif loss == 'mse':
        loss_fn = nn.MSELoss()
    elif loss == 'huber':
        loss_fn = nn.HuberLoss(delta=huber_delta)
    else:
        raise ValueError(f"Unsupported loss function: {loss}")
    
    benchmark = pretraining_args.get('test_bench').upper()

    loader = prepare_data_loader_eval(
        "gnn/dataset", target_metric, benchmark, 
        scaling_stats, base_target_scaling_stats,
        target_scaling_stats,
        batch_size=8
    )

    if target_metric == "area":
        available_resources = torch.tensor(
            [AVAILABLE_RESOURCES[r] for r in TARGET_METRICS['area']],
            dtype=torch.float32,
            device=DEVICE
        )
    else:
        available_resources = None

    run_number = 1
    while os.path.exists(f"{output_dir}/run_{run_number}"):
        run_number += 1
    output_dir = f"{output_dir}/run_{run_number}"
    os.makedirs(output_dir, exist_ok=True)

    with open(os.path.join(output_dir, 'fine_tuned_model_params.txt'), 'w') as f:
        for name, param in model.named_parameters():
            if param.requires_grad:
                f.write(f"{name}: {param.data.shape}\n")

    with open(os.path.join(output_dir, 'model_args.json'), 'w') as f:
        json.dump(model_args, f, indent=4)

    with open(os.path.join(output_dir, 'grouped_params.json'), 'w') as f:
        json.dump(grouped_params, f, indent=2)

    fine_tuning_args = pretraining_args.copy()
    fine_tuning_args.update({
        "batch_size": batch_size,
        "epochs": epochs,
        "learning_rate": lr
    })
    with open(os.path.join(output_dir, 'fine_tuning_args.json'), 'w') as f:
        json.dump(fine_tuning_args, f, indent=4)

    with open(os.path.join(output_dir, 'solutions.txt'), 'w') as f:
        for data in ft_loader.dataset:
            f.write(f"{data.solution_index}\n")

    for _ in range(epochs):
        model.train()
        for data in ft_loader:
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
            clip_grad_norm_(model.parameters(), max_norm=max_norm)
            optimizer.step()
        
    preds, targets, mape = evaluate(model, loader, available_resources=available_resources)
    print(f"Fine-tuning completed. MAPE: {mape:.4f}")

    indices = [data.solution_index for data in loader.dataset]

    with open(os.path.join(output_dir, f"predictions.csv"), 'w') as f:
        f.write("index,target,prediction\n")
        for idx, target, pred in zip(indices, targets, preds):
            f.write(f"{idx},{target},{pred}\n")

    plot_prediction_bars(
        targets=targets,
        preds=preds,
        indices=indices,
        benchmark=benchmark,
        metric=target_metric,
        output_path=os.path.join(output_dir, f"predictions.png")
    )

    new_model_path = os.path.join(output_dir, os.path.basename(model_path))
    torch.save(model.state_dict(), new_model_path)


def get_layerwise_decay_params(model, initial_lr, weight_decay, decay_rate=0.9):
    """Creates parameter groups with a decaying learning rate for each GNN layer."""
    params = []

    # Add the head MLPs with the highest learning rate
    head_prefixes = ['mlps.', 'y_base_mlp.']
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
                # Add the full parameter name
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


def set_random_seeds(seed: int):
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    np.random.seed(seed)
    random.seed(seed)


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Fine-tune GNN model.")
    parser.add_argument("-d", "--dataset_dir", type=str, required=True, 
                        help="Path to dataset directory.")
    parser.add_argument("-m", "--model_dir", type=str, required=True, 
                        help="Path to the pre-trained model directory with training metadata.")
    parser.add_argument("-e", "--epochs", type=int, default=15, 
                        help="Number of epochs for fine-tuning.")
    parser.add_argument("-b", "--batch_size", type=int, default=8,
                        help="Batch size for fine-tuning.")
    parser.add_argument("-o", "--output_dir", type=str, default="", 
                        help="Directory to save the fine-tuned model.")
    parser.add_argument("-lr", "--learning_rate", type=float, default=1e-5,
                        help="Learning rate for the optimizer.")
    
    args = vars(parser.parse_args())
    main(args)