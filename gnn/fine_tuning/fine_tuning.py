import os
import pickle
from typing import Dict

import torch
import torch.nn as nn
from torch.nn.utils import clip_grad_norm_

from torch_geometric.loader import DataLoader

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
    for _ in range(epochs):
        model.train()
        for batch in loader:
            optimizer.zero_grad()
            pred = model(batch)
            loss = loss_fn(pred, batch.y)
            loss.backward()
            clip_grad_norm_(model.parameters(), max_norm=max_norm)
            optimizer.step()


def prepare_data_loader(
    dataset_dir: str, 
    target_metric: str,
    base_metrics_path: str,
    scale_features: bool = True,
    feature_ranges: Dict[str, tuple] = None
) -> DataLoader:
    dataset = HLSFineTuningDataset(
        root=dataset_dir,
        metric=target_metric, 
        base_metrics_path=base_metrics_path,
        scale_features=scale_features,
        feature_ranges=feature_ranges
    )
    loader = DataLoader(
        dataset, 
        batch_size=dataset.len(), 
        shuffle=True
    )
    return loader


def load_model(
    model_path: str, 
    model_args_path: str,
    dropout: float = 0.3
) -> nn.Module:
    with open(model_args_path, 'rb') as f:
        model_args = pickle.load(f)

    if not isinstance(model_args, dict):
        raise ValueError("Model arguments must be a dictionary.")
    
    model_args['dropout'] = dropout
    model = HLSQoREstimator(**model_args)
    model.load_state_dict(torch.load(model_path, map_location=DEVICE))
    return model.to(DEVICE)


def main(args: Dict[str, str]):
    dataset_dir = args.get("dataset_dir")
    model_path = args.get("model")
    model_args_path = args.get("model_args")
    base_metrics_path = args.get("base_metrics")
    pretraining_args_path = args.get("pretraining_args", "")
    feature_ranges_path = args.get("feature_ranges", "")
    target_metric = args.get("target", "snru")
    epochs = int(args.get("epochs", 10))
    lr = float(args.get("learning_rate", 1e-4))
    dropout = float(args.get("dropout", 0.3))
    output_dir = args.get("output_dir", "")

    if not dataset_dir or not model_path or not model_args_path:
        raise ValueError("Dataset directory, model path and model args path are required.")

    if not output_dir:
        output_dir = os.path.dirname(model_path)

    if feature_ranges_path:
        scale_features = True
        with open(feature_ranges_path, 'rb') as f:
            feature_ranges = pickle.load(f)
        if not isinstance(feature_ranges, dict):
            raise ValueError("Feature ranges must be a dictionary.")
    else:
        scale_features = False
    
    # Load the dataset
    loader = prepare_data_loader(
        dataset_dir, target_metric, base_metrics_path,
        scale_features=scale_features,
        feature_ranges=feature_ranges
    )
    
    # Load the model
    model = load_model(model_path, model_args_path, dropout=dropout)

    if pretraining_args_path:
        with open(pretraining_args_path, 'rb') as f:
            pretraining_args = pickle.load(f)

        betas = pretraining_args.get('betas', (0.9, 0.999))
        weight_decay = pretraining_args.get('weight_decay', 1e-4)
    
        loss = pretraining_args.get('loss', 'mse')
        if loss == 'mse':
            loss_fn = nn.MSELoss()
        elif loss == 'l1':
            loss_fn = nn.L1Loss()
        elif loss == 'huber':
            delta = pretraining_args.get('delta', 1.0)
            loss_fn = nn.SmoothL1Loss(beta=delta)
        else:
            raise ValueError(f"Unsupported loss function: {loss}")
        
        max_norm = pretraining_args.get('max_norm', 5.0)
    else:
        betas = (0.9, 0.999)
        weight_decay = 1e-4
        loss_fn = nn.MSELoss()
        max_norm = 5.0

    optimizer = torch.optim.AdamW(
        model.parameters(), 
        lr=lr,
        betas=betas,
        weight_decay=weight_decay
    )
    
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


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Fine-tune GNN model.")
    parser.add_argument("-d", "--dataset_dir", type=str, required=True, 
                        help="Path to dataset directory.")
    parser.add_argument("-m", "--model", type=str, required=True, 
                        help="Path to the pre-trained model.")
    parser.add_argument("-ma", "--model_args", type=str, required=True, 
                        help="Path to the serialized model arguments.")
    parser.add_argument("-bm", "--base_metrics", type=str, required=True,
                        help="Path to the reported metrics of the base solution.")
    parser.add_argument("-pa", "--pretraining_args", type=str, required=True,
                        help="Path to the arguments used for pre-training the model.")
    parser.add_argument("-fr", "--feature_ranges", type=str, default="",
                        help="Path to the serialized feature ranges for min-max scaling.")
    parser.add_argument("-t", "--target", type=str, default="snru", 
                        help="Target metric for fine-tuning.")
    parser.add_argument("-e", "--epochs", type=int, default=10, 
                        help="Number of epochs for fine-tuning.")
    parser.add_argument("-lr", "--learning_rate", type=float, default=1e-5,
                        help="Learning rate for the optimizer.")
    parser.add_argument("-dr", "--dropout", type=float, default=0.3,
                        help="Dropout rate for the model.")
    parser.add_argument("-o", "--output_dir", type=str, default="", 
                        help="Directory to save the fine-tuned model.")

    args = vars(parser.parse_args())
    main(args)
