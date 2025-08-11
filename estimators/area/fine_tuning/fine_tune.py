import os
import json
from typing import Dict

import torch
import torch.nn as nn
from torch.nn.utils import clip_grad_norm_

from estimators.common.perf_visualization import plot_prediction_bars
from estimators.area.fine_tuning.utils import (
    load_pretrained_model, 
    load_model_args,
    prepare_data_loader,
    get_layerwise_decay_params,
    mape_loss,
    evaluate
)
from estimators.common.training_utils import set_random_seeds
from estimators.common.parsers import AVAILABLE_RESOURCES, AREA_METRICS

DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')


def main(args: Dict[str, str]):
    dataset_dir = args.get("dataset_dir")
    model_dir = args.get("model_dir")
    batch_size = int(args.get("batch_size", 6))
    epochs = int(args.get("epochs", 15))
    output_dir = args.get("output_dir", "")
    lr = float(args.get("learning_rate", 1e-5))
    decay_rate = float(args.get("decay_rate", 0.9))
    skip_eval = args.get("skip_eval", False)
    pretraining_dataset_dir = args.get("pretraining_dataset_dir", "estimators/area/dataset")

    if not os.path.exists(dataset_dir):
        raise FileNotFoundError(f"Dataset directory {dataset_dir} does not exist.")
    
    if not os.path.exists(model_dir):
        raise FileNotFoundError(f"Model directory {model_dir} does not exist.")

    model_path = os.path.join(model_dir, 'model.pt')
    model_args_path = os.path.join(model_dir, 'model_args.json')
    pretraining_args_path = os.path.join(model_dir, 'pretraining_args.json')
    scaling_stats_path = os.path.join(model_dir, 'scaling_stats.json')
    target_scaling_stats_path = os.path.join(model_dir, 'target_scaling_stats.json')
    graph_attr_scaling_stats_path = os.path.join(model_dir, 'graph_attr_scaling_stats.json')

    required_paths = [
        dataset_dir, model_path, model_args_path, 
        pretraining_args_path, scaling_stats_path,
        target_scaling_stats_path, graph_attr_scaling_stats_path
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

    with open(graph_attr_scaling_stats_path, 'r') as f:
        graph_attr_scaling_stats = json.load(f)

    model_args = load_model_args(model_args_path)
    model = load_pretrained_model(
        model_path=model_path, 
        model_args=model_args, 
        device=DEVICE
    )
    benchmark = pretraining_args.get("test_bench")
    betas = pretraining_args.get('betas', (0.9, 0.999))
    weight_decay = pretraining_args.get('weight_decay', 1e-4)
    max_norm = pretraining_args.get('max_norm', None)
    seed = pretraining_args.get('seed', 42)
    loss = pretraining_args.get('loss', 'mse')

    if loss == 'l1':
        loss_fn = nn.L1Loss()
    elif loss == 'mse':
        loss_fn = nn.MSELoss()
    elif loss == 'huber':
        delta = pretraining_args.get('huber_delta', 1.0)
        loss_fn = nn.HuberLoss(delta=delta)
    else:
        raise ValueError(f"Unsupported loss function: {loss}")

    set_random_seeds(seed)

    ft_loader = prepare_data_loader(
        dataset_dir, benchmark, scaling_stats,
        target_scaling_stats, graph_attr_scaling_stats,
        batch_size=batch_size, mode=f"fine_tune_{benchmark}"
    )
    
    for param in model.parameters():
        param.requires_grad = True

    # Prepare the optimizer
    grouped_params = get_layerwise_decay_params(
        model,
        initial_lr=lr,
        weight_decay=weight_decay,
        decay_rate=decay_rate
    )
    optimizer = torch.optim.AdamW(grouped_params, betas=betas)

    run_number = 1
    while os.path.exists(f"{output_dir}/run_{run_number}"):
        run_number += 1
    output_dir = f"{output_dir}/run_{run_number}"
    os.makedirs(output_dir, exist_ok=True)

    # with open(os.path.join(output_dir, 'grouped_params.json'), 'w') as f:
    #     json.dump(grouped_params, f, indent=2)

    with open(os.path.join(output_dir, 'model_args.json'), 'w') as f:
        json.dump(model_args, f, indent=2)

    fine_tuning_args = pretraining_args.copy()
    fine_tuning_args.update({
        "batch_size": batch_size,
        "epochs": epochs,
        "learning_rate": lr,
        "decay_rate": decay_rate
    })
    with open(os.path.join(output_dir, 'fine_tuning_args.json'), 'w') as f:
        json.dump(fine_tuning_args, f, indent=2)

    with open(os.path.join(output_dir, 'solutions.txt'), 'w') as f:
        f.write("\n".join(map(str, [data.solution_index for data in ft_loader.dataset])))

    for _ in range(epochs):
        model.train()
        for data in ft_loader:
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
            if max_norm is not None:
                clip_grad_norm_(model.parameters(), max_norm=max_norm)
            optimizer.step()

    torch.save(model.state_dict(), os.path.join(output_dir, 'model.pt'))

    if skip_eval:
        print("Skipping evaluation as per request.")
        return

    model.eval()
    print("Evaluating the fine-tuned model...")

    if not os.path.exists(pretraining_dataset_dir):
        raise FileNotFoundError(f"Pretraining dataset directory {pretraining_dataset_dir} does not exist.")

    eval_loader = prepare_data_loader(
        pretraining_dataset_dir, benchmark, scaling_stats,
        target_scaling_stats, graph_attr_scaling_stats,
        batch_size=batch_size, mode=f"eval_{benchmark}"
    )

    mean_target = torch.tensor(
        [value['mean'] for value in target_scaling_stats.values()],
        dtype=torch.float32, device=DEVICE
    )
    std_target = torch.tensor(
        [value['std'] for value in target_scaling_stats.values()],
        dtype=torch.float32, device=DEVICE
    )
    available_resources = torch.tensor(
        [AVAILABLE_RESOURCES[key] for key in AREA_METRICS],
        dtype=torch.float32,
        device=DEVICE
    )
    preds, targets, _ = evaluate(
        model, eval_loader, mean_target, std_target, 
        available_resources=available_resources, device=DEVICE
    )
    indices = [data.solution_index for data in eval_loader.dataset]

    fine_tuning_indices = [data.solution_index for data in ft_loader.dataset]
    eval_results = [
        (idx, target, pred) for idx, target, pred in zip(indices, targets, preds)
        if idx not in fine_tuning_indices
    ]

    preds = [pred for _, _, pred in eval_results]
    targets = [target for _, target, _ in eval_results]
    indices = [idx for idx, _, _ in eval_results]

    with open(os.path.join(output_dir, f"predictions.csv"), 'w') as f:
        f.write("index,target,prediction\n")
        for idx, target, pred in zip(indices, targets, preds):
            f.write(f"{idx},{target},{pred}\n")

    mape = mape_loss(
        torch.tensor(preds, dtype=torch.float32, device=DEVICE),
        torch.tensor(targets, dtype=torch.float32, device=DEVICE)
    ).item()

    plot_prediction_bars(
        targets=targets,
        preds=preds,
        indices=indices,
        benchmark=benchmark,
        metric="area",
        output_path=os.path.join(output_dir, f"predictions.png"),
        mape=mape
    )
    print(f"Evaluation MAPE: {mape:.4f}")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Fine-tune GNN model.")

    parser.add_argument("-m", "--model_dir", type=str, required=True, 
                        help="Path to the pre-trained model directory.")
    parser.add_argument("-d", "--dataset_dir", type=str, default="estimators/area/fine_tuning/dataset", 
                        help="Path to dataset directory.")
    parser.add_argument("-e", "--epochs", type=int, default=15, 
                        help="Number of epochs for fine-tuning.")
    parser.add_argument("-b", "--batch_size", type=int, default=6,
                        help="Batch size for fine-tuning.")
    parser.add_argument("-o", "--output_dir", type=str, default="", 
                        help="Directory to save the fine-tuned model.")
    parser.add_argument("-lr", "--learning_rate", type=float, default=1e-5,
                        help="Learning rate for the optimizer.")
    parser.add_argument("-dr", "--decay_rate", type=float, default=0.9,
                        help="Decay rate for the learning rate.")
    parser.add_argument("--skip_eval", action='store_true', 
                        help="Skip evaluation after fine-tuning.")
    parser.add_argument("-p", "--pretraining_dataset_dir", type=str, default="estimators/area/dataset",
                        help="Path to the pretraining dataset directory.")
    
    main(vars(parser.parse_args()))