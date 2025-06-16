import pickle
import os
from typing import Optional, Union, List

import numpy as np
import torch
import torch.nn as nn

from torch_geometric.loader import DataLoader

from gnn.models import HLSQoREstimator
from gnn.data.dataset import HLSDataset
from gnn.analysis import plot_prediction_bars, percentage_diff

DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')


def evaluate(
    model: nn.Module,
    loader: DataLoader,
    exp_adjust: bool = False
):
    preds, targets = [], []
    
    model.eval()
    with torch.no_grad():
        for batch in loader:
            batch = batch.to(DEVICE)
            pred = model(
                batch.x_dict,
                batch.edge_index_dict,
                batch.batch_dict,
                batch.y_base
            )
            preds.append(pred)
            targets.append(batch.y)

    preds = torch.cat(preds)
    targets = torch.cat(targets)

    if exp_adjust:
        preds = preds.expm1()
        targets = targets.expm1()

    mre = percentage_diff(preds, targets).mean().item()

    for p, t in zip(preds.tolist(), targets.tolist()):
        print(f"Target: {t}; Prediction: {p}")
    print(f"\nMRE: {mre:.2f}%")
    
    return preds.tolist()


def load_model(model_path: str, model_args_path: str) -> nn.Module:
    with open(model_args_path, 'rb') as f:
        model_args = pickle.load(f)

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
        metric=target_metric, 
        mode="test", 
        scale_features=True, 
        feature_ranges=feature_ranges,
        benchmarks=benchmarks, 
        log_scale=log_scale
    )
    loader = DataLoader(dataset, batch_size=16, shuffle=False)

    return loader


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

    preds = evaluate(model, loader, exp_adjust=log_scale)

    if not output_dir:
        output_dir = os.path.dirname(os.path.abspath(__file__))

    output_csv = os.path.join(output_dir, f"predictions.csv")
    output_png = os.path.join(output_dir, f"predictions.png")

    targets = [data.y.item() for data in loader.dataset]
    indices = [data.solution_index for data in loader.dataset]

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
    parser.add_argument("-t", "--target", type=str, default="snru", 
                        help="Target metric for evaluation")
    parser.add_argument("-fr", "--feature_ranges", type=str, default="", 
                        help="Path to the file containing feature ranges for min-max scaling")
    parser.add_argument("-ls", "--log_scale", action='store_true', 
                        help="Apply log scale")
    parser.add_argument("-o", "--output_dir", type=str, default="",
                        help="Directory to save outputs")

    args = vars(parser.parse_args())
    main(args)