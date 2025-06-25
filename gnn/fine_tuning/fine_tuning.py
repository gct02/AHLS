import os
import pickle
import json
import random
from typing import Dict

import numpy as np
import torch
import torch.nn as nn
from torch.nn.utils import clip_grad_norm_

from torch_geometric.loader import DataLoader
from torch_geometric.nn import LayerNorm, Linear

from gnn.models import HLSQoREstimator
from gnn.fine_tuning.data.dataset import HLSFineTuningDataset

DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')


def fine_tune(
    model: nn.Module,
    loss_fn: nn.Module,
    optimizer: torch.optim.Optimizer,
    loader: DataLoader,
    epochs: int,
    max_norm: float = 5.0
):
    model.train()
    for _ in range(epochs):
        for data in loader:
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


def prepare_data_loader(
    dataset_dir: str, 
    target_metric: str,
    batch_size: int = 16,
    scaling_stats: Dict[str, Dict[str, float]] = None,
    log_transform: bool = False
) -> DataLoader:
    dataset = HLSFineTuningDataset(
        root=dataset_dir,
        target_metric=target_metric, 
        standardize=True,
        scaling_stats=scaling_stats,
        apply_log_transform=log_transform
    )
    loader = DataLoader(
        dataset, 
        batch_size=batch_size, 
        shuffle=True,
        num_workers=4,
        pin_memory=True
    )
    return loader


def load_model(
    model_path: str, 
    model_args_path: str
) -> nn.Module:
    with open(model_args_path, 'r') as f:
        model_args = json.load(f)

    metadata = model_args["metadata"]
    node_types = metadata[0]
    edge_types = metadata[1]
    edge_type_tuples = [(et[0], et[1], et[2]) for et in edge_types]
    model_args["metadata"] = (node_types, edge_type_tuples)
    model_args["dropout"] = 0.0
    
    model = HLSQoREstimator(**model_args)
    model.load_state_dict(torch.load(model_path, map_location=DEVICE))
    return model


def main(args: Dict[str, str]):
    dataset_dir = args.get("dataset_dir")
    model_path = args.get("model")
    model_args_path = args.get("model_args")
    pretraining_args_path = args.get("pretraining_args")
    scaling_stats_path = args.get("scaling_stats")
    batch_size = int(args.get("batch_size", 16))
    epochs = int(args.get("epochs", 15))
    output_dir = args.get("output_dir", "")

    if not dataset_dir or not model_path or not model_args_path:
        raise ValueError("Dataset directory, model path and model args path are required.")
    
    if not pretraining_args_path or not os.path.exists(pretraining_args_path):
        raise ValueError("Pretraining arguments file does not exist.")
    
    if scaling_stats_path:
        with open(scaling_stats_path, 'rb') as f:
            scaling_stats = pickle.load(f)
        if not isinstance(scaling_stats, dict):
            raise ValueError("Feature ranges must be a dictionary.")
    else:
        scaling_stats = None

    if not output_dir:
        output_dir = os.path.dirname(model_path)
    
    with open(pretraining_args_path, 'r') as f:
        pretraining_args = json.load(f)

    target_metric = pretraining_args.get('target')
    if not target_metric:
        raise ValueError("Target metric must be specified in pretraining arguments.")

    betas = pretraining_args.get('betas', (0.9, 0.999))
    weight_decay = pretraining_args.get('weight_decay', 1e-4)
    max_norm = pretraining_args.get('max_norm', 5.0)
    log_transform = pretraining_args.get('log_scale', False)
    lr = pretraining_args.get('learning_rate', 3e-4)
    lr /= 20  # Fine-tuning typically uses a lower learning rate

    seed = pretraining_args.get('seed', 42)
    set_random_seeds(seed)

    # Load the dataset
    loader = prepare_data_loader(
        dataset_dir, target_metric,
        batch_size=batch_size,
        scaling_stats=scaling_stats,
        log_transform=log_transform
    )
    
    # Load the model
    model = load_model(model_path, model_args_path).to(DEVICE)

    # Set model to training mode and enable gradients for fine-tuning
    model.train()
    for param in model.parameters():
        param.requires_grad = False

    for module in model.modules():
        if isinstance(module, (nn.LayerNorm, LayerNorm)):
            for param in module.parameters():
                param.requires_grad = True

    grouped_params = get_optimizer_param_groups(model, weight_decay)

    optimizer = torch.optim.AdamW(
        grouped_params, 
        lr=lr,
        betas=betas
    )
    loss_fn = nn.L1Loss()
    
    # Fine-tune the model
    fine_tune(
        model=model,
        loss_fn=loss_fn,
        optimizer=optimizer,
        loader=loader,
        epochs=epochs,
        max_norm=max_norm
    )

    model_name = os.path.basename(model_path).split('.')[0]
    new_model_path = os.path.join(output_dir, f"{model_name}_fine_tuned.pt")
    torch.save(model.state_dict(), new_model_path)
    print(f"Fine-tuned model saved to {new_model_path}")


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
    parser.add_argument("-ss", "--scaling_stats", type=str, required=True,
                        help="Path to the statistics for standardization.")
    parser.add_argument("-e", "--epochs", type=int, default=15, 
                        help="Number of epochs for fine-tuning.")
    parser.add_argument("-bs", "--batch_size", type=int, default=16,
                        help="Batch size for fine-tuning.")
    parser.add_argument("-o", "--output_dir", type=str, default="", 
                        help="Directory to save the fine-tuned model.")
    
    args = vars(parser.parse_args())
    main(args)
