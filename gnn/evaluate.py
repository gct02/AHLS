import json
import os
from typing import Optional, Union, List

import torch
import torch.nn as nn
from torch import Tensor

from torch_geometric.loader import DataLoader

from gnn.models import HLSQoREstimator
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
    exp_adjust: bool = False,
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

    preds = torch.cat(preds)
    targets = torch.cat(targets)
    if exp_adjust:
        preds = preds.expm1()
        targets = targets.expm1()

    preds = aggregate_qor_metrics(
        preds, loader.dataset.target_metric,
        available_resources=available_resources
    )
    targets = aggregate_qor_metrics(
        targets, loader.dataset.target_metric,
        available_resources=available_resources
    )
    mape = robust_mape(preds, targets).mean().item()

    for p, t in zip(preds.tolist(), targets.tolist()):
        print(f"Target: {t}; Prediction: {p}")
    print(f"MAPE: {mape:.2f}%")
    
    return preds.tolist(), targets.tolist()


def load_model(model_path: str, model_args_path: str) -> nn.Module:
    with open(model_args_path, 'r') as f:
        model_args = json.load(f)

    metadata = model_args["metadata"]
    model_args["metadata"] = (
        metadata[0], 
        [(et[0], et[1], et[2]) for et in metadata[1]]
    )
    model = HLSQoREstimator(**model_args)
    model.load_state_dict(
        torch.load(model_path, map_location=DEVICE)
    )
    return model


def prepare_data_loader(
    dataset_dir: str,
    target_metric: str,
    benchmarks: Union[str, List[str]],
    log_transform: bool = False,
    batch_size: int = 16,
    scaling_stats_path: Optional[str] = None
) -> DataLoader:
    if scaling_stats_path:
        with open(scaling_stats_path, 'r') as f:
            scaling_stats = json.load(f)
    else:
        scaling_stats = None

    if isinstance(benchmarks, str):
        benchmarks = [benchmarks]

    dataset = HLSDataset(
        root=dataset_dir, 
        target_metric=target_metric, 
        standardize=True, 
        scaling_stats=scaling_stats,
        benchmarks=benchmarks, 
        log_transform=log_transform,
        mode="test"
    )
    loader = DataLoader(
        dataset, 
        batch_size=batch_size, 
        shuffle=False,
        num_workers=4,
        pin_memory=True
    )
    return loader


def main(args):
    dataset_dir = args.get("dataset_dir")
    model_path = args.get("model_path")
    model_args_path = args.get("model_args")
    benchmark = args.get("benchmark")
    target_metric = args.get("target", "snru")
    log_transform = args.get("log_transform", False)
    scaling_stats_path = args.get("scaling_stats")
    batch_size = args.get("batch_size", 16)
    output_dir = args.get("output_dir", "")

    loader = prepare_data_loader(
        dataset_dir, 
        target_metric, 
        benchmark, 
        log_transform=log_transform,
        batch_size=batch_size,
        scaling_stats_path=scaling_stats_path
    )
    model = load_model(model_path, model_args_path).to(DEVICE)

    if target_metric == "area":
        available_resources = torch.tensor(
            [AVAILABLE_RESOURCES[r] for r in TARGET_METRICS['area']],
            dtype=torch.float32,
            device=DEVICE
        )
    else:
        available_resources = None

    preds, targets = evaluate(
        model, loader, 
        exp_adjust=log_transform,
        available_resources=available_resources
    )

    indices = [data.solution_index for data in loader.dataset]

    if not output_dir:
        output_dir = os.path.dirname(os.path.abspath(__file__))
    output_csv = os.path.join(output_dir, f"predictions.csv")
    output_png = os.path.join(output_dir, f"predictions.png")

    with open(output_csv, 'w') as f:
        f.write("index,target,prediction\n")
        for idx, target, pred in zip(indices, targets, preds):
            f.write(f"{idx},{target},{pred}\n")

    plot_prediction_bars(
        targets=targets,
        preds=preds,
        indices=indices,
        benchmark=benchmark,
        metric=target_metric,
        output_path=output_png
    )


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Evaluate HLS model")
    parser.add_argument("-d", "--dataset_dir", type=str, required=True, 
                        help="Path to dataset directory")
    parser.add_argument("-m", "--model_path", type=str, required=True, 
                        help="Path to the trained model")
    parser.add_argument("-ma", "--model_args", type=str, required=True,
                        help="Path to model arguments")
    parser.add_argument("-b", "--benchmark", type=str, required=True, 
                        help="Benchmark name for evaluation")
    parser.add_argument("-t", "--target", type=str, default="area", 
                        help="Target metric for evaluation")
    parser.add_argument("-ss", "--scaling_stats", type=str, required=True, 
                        help="Path to the file containing statistics for standardization")
    parser.add_argument("-lt", "--log_transform", action='store_true', 
                        help="Apply log transform to the targets")
    parser.add_argument("-bs", "--batch_size", type=int, default=16,
                        help="Batch size for evaluation")
    parser.add_argument("-o", "--output_dir", type=str, default="",
                        help="Directory to save outputs")

    args = vars(parser.parse_args())
    main(args)