import os
import json
from typing import Dict

import torch
import torch.nn as nn

from torch_geometric.loader import DataLoader

from gnn.models import HGT
from gnn.fine_tuning.data.dataset import HLSFineTuningDataset


DEVICE = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')


def fine_tune(
    model: nn.Module,
    loss_fn: nn.Module,
    optimizer: torch.optim.Optimizer,
    loader: DataLoader,
    epochs: int
):
    """
    Fine-tune the model using the provided data loader.

    Args:
        model (nn.Module): The model to be fine-tuned.
        loss_fn (nn.Module): The loss function.
        optimizer (torch.optim.Optimizer): The optimizer.
        loader (DataLoader): The data loader.
        epochs (int): Number of epochs to train.

    Returns:
        None
    """
    for _ in range(epochs):
        model.train()
        for batch in loader:
            optimizer.zero_grad()
            out = model(batch)
            loss = loss_fn(out, batch.y)
            loss.backward()
            optimizer.step()


def prepare_data_loader(dataset_dir: str, metric: str) -> DataLoader:
    dataset = HLSFineTuningDataset(
        root=dataset_dir,
        metric=metric, 
        scale_features=True
    )
    loader = DataLoader(
        dataset, 
        batch_size=dataset.len(), 
        shuffle=True
    )
    return loader


def load_model(model_path: str, model_args_path: str) -> nn.Module:
    with open(model_args_path, 'r') as f:
        model_args = json.load(f)
    
    model = HGT(**model_args)
    model.load_state_dict(torch.load(model_path))
    return model.to(DEVICE)


def main(args: Dict[str, str]):
    dataset_dir = args.get("dataset_dir")
    model_path = args.get("model_path")
    model_args_path = args.get("model_args_path")
    metric = args.get("metric", "snru")
    epochs = int(args.get("epochs", 10))
    output_dir = args.get("output_dir", "")

    if not output_dir:
        output_dir = os.path.dirname(model_path)
    
    # Load the dataset
    loader = prepare_data_loader(dataset_dir, metric)
    
    # Load the model
    model = load_model(model_path, model_args_path)
    
    # Define loss function and optimizer
    loss_fn = nn.MSELoss()
    optimizer = torch.optim.Adam(model.parameters(), lr=1e-3)
    
    # Fine-tune the model
    fine_tune(
        model=model,
        loss_fn=loss_fn,
        optimizer=optimizer,
        loader=loader,
        epochs=epochs
    )

    model_name = os.path.basename(model_path).split('.')[0]
    new_model_path = os.path.join(output_dir, f"fine_tuned_{model_name}.pt")

    torch.save(model.state_dict(), new_model_path)
    print(f"Fine-tuned model saved to {new_model_path}")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Fine-tune GNN model.")
    parser.add_argument("-d", "--dataset_dir", type=str, required=True, help="Path to dataset directory.")
    parser.add_argument("-m", "--model_path", type=str, required=True, help="Path to the pre-trained model.")
    parser.add_argument("-a", "--model_args_path", type=str, required=True, help="Path to the model arguments JSON file.")
    parser.add_argument("-t", "--target", type=str, default="snru", help="Target metric for fine-tuning.")
    parser.add_argument("-e", "--epochs", type=int, default=10, help="Number of epochs for fine-tuning.")
    parser.add_argument("-o", "--output_dir", type=str, default="", help="Directory to save the fine-tuned model.")

    args = vars(parser.parse_args())
    main(args)
