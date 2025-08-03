import os
import random
from typing import List, Optional

import numpy as np
import torch
from torch import nn, Tensor

from torch_geometric.nn import LayerNorm


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