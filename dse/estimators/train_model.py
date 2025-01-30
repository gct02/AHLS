from typing import List, Dict, Tuple, Optional

import os
import argparse
import random
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import torch
import torch.nn as nn
from pathlib import Path
from torch.utils.data import DataLoader

from dse.estimators.gnn import HGT
from dse.estimators.data.dataset import HLSDataset

_DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

def _save_model(model, target_dir, model_name):
    target_dir_path = Path(target_dir)
    target_dir_path.mkdir(parents=True, exist_ok=True)
    assert model_name.endswith(".pth") or model_name.endswith(".pt"), \
        "model_name should end with '.pt' or '.pth'"
    model_save_path = target_dir_path / model_name
    print(f"[INFO] Saving model to: {model_save_path}")
    torch.save(obj=model.state_dict(), f=model_save_path)
    

def _evaluate(
    model: nn.Module,
    loader: DataLoader,
    loss_func: nn.Module,
    verbosity: int,
    mode: str,
    return_preds: bool = False
) -> Tuple[float, Optional[List[List[Tuple[float, float]]]]]:
    loss_epoch = 0
    preds_all = []

    if verbosity > 0:
        print(f"\nEvaluating on {mode} set\n")

    # Assumption: Only one instance per batch
    for input_batch, target_batch in loader:
        preds_batch = []

        cdfg = input_batch[0].to(_DEVICE)
        pred = model(cdfg)
        target = target_batch[0].squeeze().to(_DEVICE)
        loss = loss_func(pred, target)

        loss_epoch += loss.item()
        if return_preds:
            preds_batch.append((pred.item(), target.item()))

        if verbosity > 0:
            print(f"Target: {target.item()}; Prediction: {pred.item()}; Loss: {loss.item()}")

        cdfg, target, pred = cdfg.cpu(), target.cpu(), pred.cpu()
        preds_all.append(preds_batch) if return_preds else None

    loss_epoch /= len(loader)
    if verbosity > 0:
        print(f"\nAverage MSE on {mode} set: {loss_epoch}\n")

    return (loss_epoch, preds_all) if return_preds else (loss_epoch, None)


def train_model(
    model: nn.Module,
    loss_func: nn.Module,
    optimizer: torch.optim.Optimizer,
    train_loader: DataLoader,
    test_loader: DataLoader,
    val_loader: DataLoader,
    epochs: int,
    scheduler: Optional[torch.optim.lr_scheduler._LRScheduler] = None,
    verbosity: int = 1
) -> Tuple[List[float], List[float], List[List[Tuple[float, float]]]]:
    train_losses, test_losses = [], []
    n_instances = len(test_loader)
    test_preds_inst = [[] for _ in range(n_instances)]

    for epoch in range(epochs):
        if verbosity > 0:
            print(f"Epoch {epoch + 1}/{epochs}\n")

        # ********** Training ********** #
        model.train()
        train_loss_epoch = 0

        for i, (input_batch, target_batch) in enumerate(train_loader):
            batch_loss = 0
            optimizer.zero_grad()

            for cdfg, target in zip(input_batch, target_batch):
                cdfg, target = cdfg.to(_DEVICE), target.squeeze().to(_DEVICE)

                pred = model(cdfg)
                instance_loss = loss_func(pred, target)
                batch_loss += instance_loss.item()
                instance_loss.backward()

                # Move tensors back to CPU to free GPU memory
                cdfg, target, pred = cdfg.cpu(), target.cpu(), pred.cpu()

                if verbosity > 1:
                    print(f"Target: {target.item()}; Prediction: {pred.item()}; Loss: {instance_loss.item()}")

            optimizer.step()
            batch_loss /= len(input_batch)
            train_loss_epoch += batch_loss

            if verbosity > 0:
                print(f"Average MSE on train batch {i}: {batch_loss}")

        # ********** Evaluation ********** #
        model.eval()
        with torch.no_grad():
            # ********** Validation ********** #
            if verbosity > 0:
                print("\nEvaluating on validation set\n")

            val_loss_epoch = _evaluate(
                model, val_loader, loss_func, verbosity, "validation"
            )
            if scheduler:
                scheduler.step(val_loss_epoch[0])
              
            # ********** Test ********** #
            test_loss_epoch, test_preds = _evaluate(
                model, test_loader, loss_func, verbosity, "test", return_preds=True
            )
            test_losses.append(test_loss_epoch)
            for i, preds in enumerate(test_preds):
                test_preds_inst[i].extend(preds)
        
    return train_losses, test_losses, test_preds_inst


def main(args: Dict[str, str]):
    epochs = int(args['epoch'])
    batch_size = int(args['batch'])
    seed = int(args['seed'])
    dataset_path = args['dataset']
    target_metric = args['target']
    test_benchmark = args['testbench']
    verbosity = int(args['verbose'])

    matplotlib.use('Agg')

    torch.backends.cudnn.benchmark = True
    torch.set_printoptions(
        precision=6, threshold=1000, edgeitems=20, linewidth=200,
        profile="short", sci_mode=False
    )

    # Set random seeds for reproducibility
    _set_random_seeds(seed)

    model_analysis_folder = "dse/estimators/model_analysis"
    os.makedirs(model_analysis_folder, exist_ok=True)

    if test_benchmark == "*":
        test_benchmarks = os.listdir(dataset_path)[0]
    else:
        test_benchmarks = [test_benchmark]

    for benchmark_name in test_benchmarks:
        model_analysis_bench_folder = f"{model_analysis_folder}/{benchmark_name}"
        model_stats_folder, model_graphs_folder = _create_output_dirs(model_analysis_bench_folder)

        train_loader, val_loader, test_loader = _prepare_data_loaders(dataset_path, target_metric, benchmark_name, batch_size)

        model = _initialize_model()
        loss_func = nn.HuberLoss(delta=1.35)
        optimizer = torch.optim.AdamW(
            model.parameters(), lr=1e-2, betas=(0.9, 0.999), eps=1e-8
        )
        scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(
            optimizer, mode='min', factor=0.1, patience=10, min_lr=1e-6, eps=1e-8, verbose=verbosity > 0
        )

        train_losses, test_losses, test_preds_inst = train_model(
            model, loss_func, optimizer, train_loader, test_loader, val_loader, epochs, scheduler, verbosity
        )
        _save_model(model, "dse/estimators/pretrained", f"hgt_{target_metric}_{benchmark_name}.pth")

        model_metric_stats_folder = f"{model_stats_folder}/{target_metric}"
        model_metric_graphs_folder = f"{model_graphs_folder}/{target_metric}"
        os.makedirs(model_metric_stats_folder, exist_ok=True)
        os.makedirs(model_metric_graphs_folder, exist_ok=True)

        with open(f"{model_metric_stats_folder}/test_preds_per_inst.txt", "w") as f:
            for instance in test_preds_inst:
                target = float(instance[0][1])
                f.write(f"{target}")
                for target_pred_pair in instance:
                    pred = float(target_pred_pair[0])
                    f.write(f",{pred}")
                f.write("\n")

        with open(f"{model_stats_folder}/train_mse_per_epoch.txt", "w") as f:
            f.write("\n".join(list(map(lambda x: str(float(x)), train_losses))))

        with open(f"{model_stats_folder}/test_mse_per_epoch.txt", "w") as f:
            f.write("\n".join(list(map(lambda x: str(float(x)), test_losses))))

        x_axis = range(epochs)
        plt.figure(
            figsize=[40, 20], 
            facecolor='skyblue', 
            edgecolor='black', 
            dpi=100,
            layout='constrained'
        )
        plt.plot(x_axis, train_losses, label='train loss', color='g')
        plt.plot(x_axis, test_losses, label='test loss', color='r')
        plt.legend()
        plt.savefig(f"{model_metric_graphs_folder}/learning_curve.png")
        plt.close()
        

def _set_random_seeds(seed: int):
    torch.manual_seed(seed)
    torch.cuda.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    np.random.seed(seed)
    random.seed(seed)


def _create_output_dirs(base_folder: str) -> Tuple[str, str]:
    model_stats_folder = f"{base_folder}/stats"
    model_graphs_folder = f"{base_folder}/graphs"
    os.makedirs(base_folder, exist_ok=True)
    os.makedirs(model_stats_folder, exist_ok=True)
    os.makedirs(model_graphs_folder, exist_ok=True)
    return model_stats_folder, model_graphs_folder


def _prepare_data_loaders(
    dataset_path: str, 
    target_metric: str, 
    bench_name: str, 
    batch_size: int
) -> Tuple[DataLoader, DataLoader, DataLoader]:
    train_dataset = HLSDataset(dataset_path, target_metric, test_benchmark=bench_name, load_test_data=False)
    test_dataset = HLSDataset(dataset_path, target_metric, test_benchmark=bench_name, load_test_data=True)

    validation_split = 0.1
    n_train = int((1 - validation_split) * len(train_dataset))
    n_val = len(train_dataset) - n_train
    train_dataset, val_dataset = torch.utils.data.random_split(train_dataset, [n_train, n_val])

    train_loader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True, collate_fn=lambda x: tuple(zip(*x)))
    val_loader = DataLoader(val_dataset, shuffle=False, collate_fn=lambda x: tuple(zip(*x)))
    test_loader = DataLoader(test_dataset, shuffle=False, collate_fn=lambda x: tuple(zip(*x)))

    return train_loader, val_loader, test_loader


def _initialize_model() -> nn.Module:
    node_types = ['inst', 'var', 'const', 'array']
    edge_types = [
        ('inst', 'control', 'inst'), ('inst', 'call', 'inst'), ('inst', 'data', 'var'),
        ('var', 'data', 'inst'), ('const', 'data', 'inst'), ('array', 'data', 'inst'),
        ('inst', 'data', 'array'), ('inst', 'id', 'inst'), ('var', 'id', 'var'),
        ('const', 'id', 'const'), ('array', 'id', 'array')
    ]
    agg_edge_types = [
        [t for t in edge_types if t[1] == 'data'],
        [t for t in edge_types if t[1] == 'call' or t[1] == 'control']
    ]
    metadata = (node_types, edge_types)
    in_channels = {'inst': 21, 'var': 8, 'const': 8, 'array': 17}

    return HGT(
        metadata=metadata, in_channels=in_channels, out_channels=1,
        hid_dim_1=16, heads_1=4, hid_dim_2=12, heads_2=3,
        num_conv_layers=5, pool_size=8, dropout_fc=0.1, dropout_conv=0.0,
        use_norm=True, use_residual=True, device=_DEVICE, agg_edge_types=agg_edge_types
    )


def _parse_arguments():
    parser = argparse.ArgumentParser()

    parser.add_argument('--dataset', help='Path to the dataset', required=True)
    parser.add_argument('--epoch', help='The number of training epochs', default=1000)
    parser.add_argument('--seed', help='Random seed for repeatability', default=42)
    parser.add_argument('--batch', help='Batch size', default=16)
    parser.add_argument('--testbench', help='The test benchmark to use', default="*")
    parser.add_argument(
        '--target', help='The target resource metric', required=True,
        choices=['lut', 'ff', 'dsp', 'bram', 'cp']
    )
    parser.add_argument(
        '--verbose', nargs='?', const=1, type=int, default=0, 
        help='Set verbosity level (default: 0). Use without value for level 1, or specify a level.'
    )

    return vars(parser.parse_args())

if __name__ == '__main__':
    args = _parse_arguments()
    main(args)
