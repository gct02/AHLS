import os
import json
import random
from typing import Dict, Optional, Union, List, Any

import numpy as np
import torch
import torch.nn as nn
from torch.nn.utils import clip_grad_norm_
from torch import Tensor

from torch_geometric.loader import DataLoader
from torch_geometric.nn import LayerNorm

from gnn.models import HLSQoREstimator
from gnn.fine_tuning.data.dataset import HLSFineTuningDataset
from gnn.data.dataset import HLSDataset, TARGET_METRICS
from gnn.data.utils.parsers import AVAILABLE_RESOURCES
from gnn.analysis.utils import (
    plot_prediction_bars,
    robust_mape,
    aggregate_qor_metrics
)

DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')


def evaluate(
    model: nn.Module,
    loader: DataLoader,
    available_resources: Optional[Tensor] = None
):
    preds, targets = [], []
    model.eval()
    with torch.no_grad():
        for data in loader:
            data = data.to(DEVICE)
            pred = model(
                data.x_dict,
                data.edge_index_dict,
                data.batch_dict,
                data.y_base
            )
            preds.append(pred)
            targets.append(data.y)

    preds = aggregate_qor_metrics(
        torch.cat(preds).expm1(), 
        loader.dataset.target_metric,
        available_resources=available_resources
    )
    targets = aggregate_qor_metrics(
        torch.cat(targets).expm1(), 
        loader.dataset.target_metric,
        available_resources=available_resources
    )
    mape = robust_mape(preds, targets).mean().item()

    return preds.tolist(), targets.tolist(), mape


def prepare_data_loader_ft(
    dataset_dir: str, 
    target_metric: str,
    scaling_stats: Dict[str, Dict[str, float]],
    batch_size: int = 16,
) -> DataLoader:
    dataset = HLSFineTuningDataset(
        root=dataset_dir,
        scaling_stats=scaling_stats,
        target_metric=target_metric
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
    scaling_stats: Dict[str, Any],
    batch_size: int = 16
) -> DataLoader:
    dataset = HLSDataset(
        root=dataset_dir, 
        target_metric=target_metric, 
        scaling_stats=scaling_stats,
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


def load_model_args(model_args_path: str) -> Dict[str, Any]:
    with open(model_args_path, 'r') as f:
        model_args = json.load(f)

    metadata = model_args["metadata"]
    model_args["metadata"] = (
        metadata[0], 
        [(et[0], et[1], et[2]) for et in metadata[1]]
    )
    model_args["dropout"] = 0.0
    return model_args


def load_model(model_path: str, model_args_path: str) -> nn.Module:
    model_args = load_model_args(model_args_path)
    model = HLSQoREstimator(**model_args)
    model.load_state_dict(torch.load(model_path, map_location=DEVICE))
    return model, model_args


def main(args: Dict[str, str]):
    dataset_dir = args.get("dataset_dir")
    model_path = args.get("model")
    model_args_path = args.get("model_args")
    pretraining_args_path = args.get("pretraining_args")
    scaling_stats_path = args.get("scaling_stats")
    batch_size = int(args.get("batch_size", 16))
    epochs = int(args.get("epochs", 15))
    output_dir = args.get("output_dir", "")
    lr = float(args.get("learning_rate", 1e-5))

    if not dataset_dir or not model_path or not model_args_path:
        raise ValueError("Dataset directory, model path and model args path are required.")
    
    if not pretraining_args_path or not os.path.exists(pretraining_args_path):
        raise ValueError("Pretraining arguments file does not exist.")
    
    if not scaling_stats_path or not os.path.exists(scaling_stats_path):
        raise ValueError("Scaling statistics file does not exist.")
    
    with open(scaling_stats_path, 'r') as f:
        scaling_stats = json.load(f)

    if not output_dir:
        output_dir = os.path.dirname(model_path)
        output_dir = os.path.join(output_dir, 'fine_tuning')
    if not os.path.exists(output_dir):
        os.makedirs(output_dir, exist_ok=True)
    
    with open(pretraining_args_path, 'r') as f:
        pretraining_args = json.load(f)

    target_metric = pretraining_args.get('target')
    if not target_metric:
        raise ValueError("Target metric must be specified in pretraining arguments.")

    betas = pretraining_args.get('betas', (0.9, 0.999))
    weight_decay = pretraining_args.get('weight_decay', 1e-4)
    max_norm = pretraining_args.get('max_norm', 5.0)
    seed = pretraining_args.get('seed', 42)
    loss = pretraining_args.get('loss', 'l1')
    huber_delta = pretraining_args.get('huber_delta', 1.0)

    set_random_seeds(seed)

    # Load the dataset
    ft_loader = prepare_data_loader_ft(
        dataset_dir, target_metric,
        batch_size=batch_size,
        scaling_stats=scaling_stats
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
        "gnn/dataset", 
        target_metric,
        benchmark, 
        scaling_stats=scaling_stats,
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

    new_model_path = os.path.join(output_dir, os.path.basename(model_path))

    with open(os.path.join(output_dir, 'fine_tuned_model_params.txt'), 'w') as f:
        for name, param in model.named_parameters():
            if param.requires_grad:
                f.write(f"{name}: {param.data.shape}\n")

    with open(os.path.join(output_dir, 'model_args.json'), 'w') as f:
        json.dump(model_args, f, indent=4)

    fine_tuning_args = {
        "batch_size": batch_size,
        "epochs": epochs,
        "learning_rate": lr,
        "betas": betas,
        "weight_decay": weight_decay,
        "max_norm": max_norm,
        "loss": loss,
        "huber_delta": huber_delta,
        "seed": seed
    }
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
        
    model.eval()
    preds, targets, _ = evaluate(
        model, loader, available_resources=available_resources
    )
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


def get_layerwise_decay_params(model, initial_lr, weight_decay, decay_rate=0.9):
    """Creates parameter groups with a decaying learning rate for each GNN layer."""
    params = []

    # Add the head MLPs with the highest learning rate
    head_prefixes = ['node_type_mlp.', 'graph_mlp.', 'y_base_mlp.']
    params.append({
        'params': [p for n, p in model.named_parameters() if any(n.startswith(prefix) for prefix in head_prefixes)],
        'lr': initial_lr,
        'weight_decay': weight_decay
    })

    # Add each GNN layer with a successively smaller LR
    num_gnn_layers = model.gnn.num_layers
    for i in range(num_gnn_layers):
        layer_lr = initial_lr * (decay_rate ** (num_gnn_layers - i))
        layer_prefixes = [f'gnn.convs.{i}.', f'gnn.norm_dicts.{i}.']
        params.append({
            'params': [p for n, p in model.named_parameters() if any(n.startswith(prefix) for prefix in layer_prefixes)],
            'lr': layer_lr,
            'weight_decay': weight_decay
        })

    # Add the remaining parameters (e.g., projection, GNN out_lin) with a small LR
    remaining_params = [
        p for n, p in model.named_parameters() 
        if not any(n.startswith(pfx) for pfx in head_prefixes) and 
           not any(n.startswith(f'gnn.convs.{i}.') or n.startswith(f'gnn.norm_dicts.{i}.') for i in range(num_gnn_layers))
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
    parser.add_argument("-m", "--model", type=str, required=True, 
                        help="Path to the pre-trained model.")
    parser.add_argument("-ma", "--model_args", type=str, required=True, 
                        help="Path to the serialized model arguments.")
    parser.add_argument("-pa", "--pretraining_args", type=str, required=True,
                        help="Path to the arguments used for pre-training the model.")
    parser.add_argument("-s", "--scaling_stats", type=str, required=True,
                        help="Path to the statistics for standardization.")
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