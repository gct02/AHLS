f"""
-- VNS Meta-heuristic for GNN Fine-Tuning Hyperparameter Optimization --

This script implements a Variable Neighborhood Search (VNS) meta-heuristic to automate the search 
for optimal fine-tuning hyperparameters for a pre-trained Graph Neural Network (GNN).

The primary goal is to find a configuration that minimizes the prediction error (e.g., MAPE)
when adapting the GNN to new, specific FPGA kernels. The search space consists of different 
learning rates applied to distinct parameter groups within the model (e.g., GNN backbone, MLP heads).

By systematically exploring this hyperparameter space, the VNS algorithm aims to discover a 
fine-tuning strategy that yields the highest possible model accuracy.

"""
import json
import copy
from pathlib import Path

import numpy as np
import torch
from torch.nn.utils import clip_grad_norm_

from estimators.common.parsers import (
    AVAILABLE_RESOURCES, 
    AREA_METRICS
)
from estimators.common.training_utils import (
    set_random_seeds,
    get_no_decay_param_names
)
from estimators.area.fine_tuning.domain import (
    PARAM_GROUPS,
    PARAM_GROUP_DICT,
    LEARNING_RATES,
    NUM_LR_CONFIGS,
    NUM_PARAM_GROUPS
)
from estimators.area.fine_tuning.utils import (
    prepare_data_loader,
    load_pretrained_model,
    evaluate
)

BENCHMARKS = [
    "ADPCM", "AES", "BACKPROP", "GEMM", "GRAMSCHMIDT",
    "GSM", "KNN", "SHA", "STENCIL3D", "TRANS_FFT"
]

DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

AVAILABLE_RESOURCES_TENSOR = torch.tensor(
    [AVAILABLE_RESOURCES[key] for key in AREA_METRICS],
    dtype=torch.float32,
    device=DEVICE
)

model_dict = {}
ft_loader_dict = {}
eval_loader_dict = {}
pretraining_args_dict = {}

mean_target_dict = {}
std_target_dict = {}

evaluated_configs = {}


def sample_kopt_points(config, k, n_points):
    """
    Generate multiple points in the k-opt neighborhood by applying perturbations to k parameter groups.
    Returns a list of new configurations.
    """
    new_configs = []
    selected_param_groups = [
        np.random.choice(NUM_PARAM_GROUPS, size=k, replace=False)
        for _ in range(n_points)
    ]
    for param_group_indices in selected_param_groups:
        new_config = copy.deepcopy(config)
        for idx in param_group_indices:
            lr = new_config[idx]
            if lr == 0:
                offset = 1
            elif lr == NUM_LR_CONFIGS - 1:
                offset = -1
            else:
                offset = np.random.choice([-1, 1])
            new_config[idx] = lr + offset
        new_configs.append(new_config)
    return new_configs


def evaluate_fine_tuning_config(config, epochs=10):
    mapes = []

    for bench in BENCHMARKS:
        model = model_dict[bench]
        ft_loader = ft_loader_dict[bench]
        pretraining_args = pretraining_args_dict[bench]
        
        betas = pretraining_args.get('betas', (0.9, 0.999))
        max_norm = pretraining_args.get('max_norm', 5.0)
        seed = pretraining_args.get('seed', 42)
        loss = pretraining_args.get('loss', 'l1')
        weight_decay = pretraining_args.get('weight_decay', 1e-4)
        huber_delta = pretraining_args.get('huber_delta', 1.0)

        set_random_seeds(seed)

        if loss == 'l1':
            loss_fn = torch.nn.L1Loss()
        elif loss == 'mse':
            loss_fn = torch.nn.MSELoss()
        elif loss == 'huber':
            loss_fn = torch.nn.HuberLoss(delta=huber_delta)
        else:
            raise ValueError(f"Unsupported loss function: {loss}")

        state_dict = copy.deepcopy(model.state_dict())
        model.to(DEVICE)
        model.train()

        decay_param_groups = [
            {
                'params': [],
                'lr': LEARNING_RATES[idx],
                'weight_decay': weight_decay
            }
            for idx in config
        ]
        no_decay_param_groups = [
            {
                'params': [],
                'lr': LEARNING_RATES[idx],
                'weight_decay': 0.0
            }
            for idx in config
        ]
        no_decay_param_names = get_no_decay_param_names(model)

        for param_name, param in model.named_parameters():
            group_index = PARAM_GROUP_DICT.get(param_name, 0)
            lr = LEARNING_RATES[config[group_index]]
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
        optimizer = torch.optim.AdamW(param_groups, betas=betas)

        for _ in range(epochs):
            for data in ft_loader:
                optimizer.zero_grad()
                data = data.to(DEVICE)
                pred = model(
                    data.x_dict,
                    data.edge_index_dict,
                    data.batch_dict,
                    data.y_base
                )
                loss_value = loss_fn(pred, data.y)
                loss_value.backward()
                clip_grad_norm_(model.parameters(), max_norm=max_norm)
                optimizer.step()

        eval_loader = eval_loader_dict[bench]
        model.eval()
        with torch.no_grad():
            _, _, mape = evaluate(
                model, eval_loader, 
                mean_target_dict[bench], std_target_dict[bench],
                available_resources=AVAILABLE_RESOURCES_TENSOR, 
                device=DEVICE
            )
        mapes.append(mape)
        model.load_state_dict(state_dict)

    return np.mean(mapes)


def get_best_kopt(config, k, epochs=10, n_points=5):
    """
    Find the best k-opt configuration by evaluating all k-opt neighbors of the given config.
    Returns the best configuration and its MAPE.
    """
    global evaluated_configs
    
    best_config = None
    best_mape = float('inf')
  
    for new_config in sample_kopt_points(config, k, n_points):
        new_config_tuple = tuple(new_config)
        mape = evaluated_configs.get(new_config_tuple, None)
        if mape is None:
            mape = evaluate_fine_tuning_config(new_config, epochs)
            evaluated_configs[new_config_tuple] = mape
        if mape < best_mape:
            best_mape = mape
            best_config = new_config
            
    return best_config, best_mape


def parse_config(file_path):
    """
    Parse a configuration file to extract the hyperparameter settings.
    The file should contain a JSON object with the hyperparameters.
    """
    with open(file_path, 'r') as f:
        groups = json.load(f)
    
    config = []
    for group in groups:
        lr = group.get('lr', 0.0)
        lr_gaps = [np.abs(ref_lr - lr) for ref_lr in LEARNING_RATES]
        min_gap_index = np.argmin(lr_gaps)
        config.append(min_gap_index)

    return config


def create_param_groups(config):
    groups = []
    for params, lr_idx in zip(PARAM_GROUPS, config):
        lr = LEARNING_RATES[lr_idx]
        groups.append({
            'params': params,
            'lr': lr
        })
    return groups


def save_config(config, file_path):
    """
    Save the hyperparameter configuration to a file.
    The configuration is saved as a JSON object.
    """
    groups = create_param_groups(config)
    with open(file_path, 'w') as f:
        json.dump(groups, f, indent=4)


def vns(
    initial_config, 
    dataset_dir, 
    max_iter=50, 
    k_max=3, 
    n_points=5,
    epochs=10,
    batch_size=8,
    bench_info_path='data/benchmarks_info.json',
    output_path='gnn/fine_tuning/heuristic/best_config.json'
):
    """
    Perform Variable Neighborhood Search (VNS) to find the best hyperparameter configuration.
    """
    global model_dict, ft_loader_dict, eval_loader_dict, pretraining_args_dict, \
        mean_target, std_target, evaluated_configs
    
    with open(bench_info_path, 'r') as f:
        bench_info_dict = json.load(f)

    for bench_name, bench_info in bench_info_dict.items():
        pretrained_model_path = bench_info.get('pretrained_model')
        if not pretrained_model_path or not Path(pretrained_model_path).exists():
            print(f"Pretrained model not found for {bench_name}. Skipping.")
            continue

        scaling_stats_path = bench_info.get('scaling_stats')
        if not scaling_stats_path or not Path(scaling_stats_path).exists():
            print(f"Scaling stats not found for {bench_name}. Skipping.")
            continue

        target_scaling_stats_path = bench_info.get('target_scaling_stats')
        if not target_scaling_stats_path or not Path(target_scaling_stats_path).exists():
            print(f"Target scaling stats not found for {bench_name}. Skipping.")
            continue

        base_target_scaling_stats_path = bench_info.get('base_target_scaling_stats')
        if not base_target_scaling_stats_path or not Path(base_target_scaling_stats_path).exists():
            print(f"Base target scaling stats not found for {bench_name}. Skipping.")
            continue

        pretraining_args_path = bench_info.get('pretraining_args')
        if not pretraining_args_path or not Path(pretraining_args_path).exists():
            print(f"Pretraining args not found for {bench_name}. Skipping.")
            continue

        model_args_path = bench_info.get('model_args')
        if not model_args_path or not Path(model_args_path).exists():
            print(f"Model args not found for {bench_name}. Skipping.")
            continue

        with open(scaling_stats_path, 'r') as f:
            scaling_stats = json.load(f)

        with open(target_scaling_stats_path, 'r') as f:
            target_scaling_stats = json.load(f)

        with open(base_target_scaling_stats_path, 'r') as f:
            base_target_scaling_stats = json.load(f)

        with open(pretraining_args_path, 'r') as f:
            pretraining_args = json.load(f)

        mean_target = torch.tensor(
            [value['mean'] for value in target_scaling_stats.values()],
            dtype=torch.float32, device=DEVICE
        )
        std_target = torch.tensor(
            [value['std'] for value in target_scaling_stats.values()],
            dtype=torch.float32, device=DEVICE
        )

        model = load_pretrained_model(
            pretrained_model_path,
            model_args_path=model_args_path,
            device=DEVICE
        )
        ft_loader = prepare_data_loader(
            dataset_dir, 
            mode=f"fine_tune_{bench_name}",
            benchmark=bench_name,
            scaling_stats=scaling_stats,
            target_scaling_stats=target_scaling_stats,
            base_target_scaling_stats=base_target_scaling_stats,
            batch_size=batch_size
        )
        eval_loader = prepare_data_loader(
            'estimators/area/dataset',
            mode=f"evaluate_{bench_name}",
            benchmark=bench_name,
            scaling_stats=scaling_stats,
            target_scaling_stats=target_scaling_stats,
            base_target_scaling_stats=base_target_scaling_stats,
            batch_size=batch_size
        )

        mean_target_dict[bench_name] = mean_target
        std_target_dict[bench_name] = std_target
        ft_loader_dict[bench_name] = ft_loader
        eval_loader_dict[bench_name] = eval_loader
        model_dict[bench_name] = model
        pretraining_args_dict[bench_name] = pretraining_args

    config = initial_config
    mape = evaluate_fine_tuning_config(config, epochs=epochs)
    evaluated_configs[tuple(config)] = mape
    
    for i in range(max_iter):
        k = 1
        while k <= k_max:
            new_config, new_mape = get_best_kopt(config, k, epochs=epochs, n_points=n_points)  
            if new_mape < mape:
                print(f"Iteration {i}, k={k}: Found better config with MAPE {new_mape}")
                config = new_config
                mape = new_mape
                save_config(config, output_path)
                k = 1
            else:
                print(f"Iteration {i}, k={k}: No improvement found with MAPE {new_mape}")
                k += 1
        
        print(f"Iteration {i}: Best configuration so far: {config} with MAPE {mape}")

    print(f"Best configuration found: {config} with MAPE {mape}")
    save_config(config, output_path)
        
    return config, mape


def main(args):
    initial_config_path = args.initial_config
    dataset_dir = args.dataset_dir
    output_path = args.output
    batch_size = args.batch_size
    max_iter = args.max_iter
    epochs = args.epochs
    k_max = args.k_max
    n_points = args.n_points

    initial_config = parse_config(initial_config_path)

    vns(
        initial_config, dataset_dir,  
        max_iter=max_iter, k_max=k_max, 
        n_points=n_points, epochs=epochs, 
        batch_size=batch_size, output_path=output_path
    )


def parse_args():
    import argparse

    parser = argparse.ArgumentParser(
        description="VNS for GNN Fine-Tuning Hyperparameter Optimization"
    )
    parser.add_argument('-c', '--initial_config', type=str, default='gnn/fine_tuning/heuristic/initial_config.json', 
                        help='Path to initial configuration file')
    parser.add_argument('-d', '--dataset_dir', type=str, default='gnn/fine_tuning/heuristic/dataset', 
                        help='Path to the fine-tuning dataset directory')
    parser.add_argument('-o', '--output', type=str, default='gnn/fine_tuning/heuristic/best_config.json', 
                        help='Path to save the best configuration')
    parser.add_argument('-b', '--batch_size', type=int, default=10, 
                        help='Batch size for data loaders')
    parser.add_argument('-m', '--max_iter', type=int, default=50, 
                        help='Maximum number of iterations for VNS')
    parser.add_argument('-e', '--epochs', type=int, default=10, 
                        help='Number of epochs for fine-tuning')
    parser.add_argument('-k', '--k_max', type=int, default=3, 
                        help='Maximum k for k-opt neighborhood search')
    parser.add_argument('-n', '--n_points', type=int, default=5, 
                        help='Number of points to sample in k-opt neighborhood')

    return parser.parse_args()


if __name__ == "__main__":
    main(parse_args())