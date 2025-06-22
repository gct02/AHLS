import pickle
import json
import os
from typing import Optional, Union, List

import numpy as np
import torch
import torch.nn as nn
from torch import Tensor

from torch_geometric.loader import DataLoader

from gnn.models import HLSQoREstimator
from gnn.data.dataset import (
    HLSDataset,
    TARGET_METRICS
)
from gnn.analysis.utils import (
    plot_prediction_bars,
    percentage_diff,
    compute_snru,
    compute_time,
    compute_power
)
from gnn.data.utils.parsers import AVAILABLE_RESOURCES

DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

AVAILABLE_RESOURCES_TENSOR = torch.tensor(
    [AVAILABLE_RESOURCES[r] for r in TARGET_METRICS['area']],
    dtype=torch.float32,
    device=DEVICE
)


def evaluate(
    model: nn.Module,
    loader: DataLoader,
    target_metric: str,
    exp_adjust: bool = False
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
    preds = aggregate_qor_metrics(preds, target_metric)
    targets = aggregate_qor_metrics(targets, target_metric)

    mre = percentage_diff(preds, targets).mean().item()

    for p, t in zip(preds.tolist(), targets.tolist()):
        print(f"Target: {t}; Prediction: {p}")
    print(f"MAPE: {mre:.2f}%")
    
    return preds.tolist(), targets.tolist()


def load_model(model_path: str, model_args_path: str) -> nn.Module:
    with open(model_args_path, 'r') as f:
        model_args = json.load(f)

    metadata = model_args["metadata"]
    node_types = metadata[0]
    edge_types = metadata[1]
    edge_type_tuples = [(et[0], et[1], et[2]) for et in edge_types]
    model_args["metadata"] = (node_types, edge_type_tuples)

    model = HLSQoREstimator(**model_args)
    model.load_state_dict(torch.load(model_path, map_location=DEVICE))
    return model


def prepare_data_loader(
    dataset_dir: str,
    target_metric: str,
    benchmarks: Union[str, List[str]],
    log_scale: bool = False,
    feature_ranges_path: Optional[str] = ""
) -> DataLoader:
    if feature_ranges_path:
        with open(feature_ranges_path, 'rb') as f:
            feature_ranges = pickle.load(f)
    else:
        feature_ranges = None

    if isinstance(benchmarks, str):
        benchmarks = [benchmarks]

    dataset = HLSDataset(
        root=dataset_dir, 
        target_metric=target_metric, 
        mode="test", 
        standardize=True, 
        scaling_stats=feature_ranges,
        benchmarks=benchmarks, 
        apply_log_transform=log_scale
    )
    loader = DataLoader(dataset, batch_size=4, shuffle=False)

    return loader


def aggregate_qor_metrics(values: Tensor, target_metric: str) -> Tensor:
    if target_metric == 'area':
        return compute_snru(values, AVAILABLE_RESOURCES_TENSOR)
    elif target_metric == 'timing':
        return compute_time(values)
    elif target_metric == 'power':
        return compute_power(values)
    else:
        raise ValueError(f"Unsupported target metric: {target_metric}")


def main(args):
    dataset_dir = args.get("dataset_dir")
    model_path = args.get("model_path")
    model_args_path = args.get("model_args_path")
    benchmark = args.get("benchmark")
    target_metric = args.get("target", "snru")
    log_scale = args.get("log_scale", False)
    feature_ranges_path = args.get("feature_ranges", "")
    output_dir = args.get("output_dir", "")

    loader = prepare_data_loader(
        dataset_dir, 
        target_metric, 
        benchmark, 
        log_scale=log_scale,
        feature_ranges_path=feature_ranges_path
    )
    model = load_model(model_path, model_args_path).to(DEVICE)

    preds, targets = evaluate(model, loader, target_metric, exp_adjust=log_scale)

    indices = [data.solution_index for data in loader.dataset]

    if not output_dir:
        output_dir = os.path.dirname(os.path.abspath(__file__))
    output_csv = os.path.join(output_dir, f"predictions.csv")
    output_png = os.path.join(output_dir, f"predictions.png")

    with open(output_csv, 'w') as f:
        f.write("Index,Target,Prediction\n")
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
    parser.add_argument("-ma", "--model_args_path", type=str, required=True,
                        help="Path to model arguments")
    parser.add_argument("-b", "--benchmark", type=str, required=True, 
                        help="Benchmark name for evaluation")
    parser.add_argument("-t", "--target", type=str, default="area", 
                        help="Target metric for evaluation")
    parser.add_argument("-fr", "--feature_ranges", type=str, default="", 
                        help="Path to the file containing feature ranges for min-max scaling")
    parser.add_argument("-ls", "--log_scale", action='store_true', 
                        help="Apply log scale")
    parser.add_argument("-o", "--output_dir", type=str, default="",
                        help="Directory to save outputs")

    args = vars(parser.parse_args())
    main(args)