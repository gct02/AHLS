import torch
import torch.nn as nn
import argparse, os, pickle, gc
import matplotlib
import matplotlib.pyplot as plt
from pathlib import Path
from torch.utils.data import Dataset, DataLoader
from estimators.gat.models import GAT
from estimators.gat.dataset import HLSDatasetLUT

matplotlib.use('Agg')

gc.collect()

device = torch.device("cuda:0")
torch.backends.cudnn.benchmark = True

torch.set_printoptions(precision=6, threshold=1000, edgeitems=10, linewidth=200, profile="short", sci_mode=False)

def RMSELoss(pred, target):
    return torch.sqrt(torch.mean((pred - target) ** 2))

def save_model(model, target_dir, model_name):
    # Create target directory
    target_dir_path = Path(target_dir)
    target_dir_path.mkdir(parents=True, exist_ok=True)
    # Create model save path
    assert model_name.endswith(".pth") or model_name.endswith(".pt"), "model_name should end with '.pt' or '.pth'"
    model_save_path = target_dir_path / model_name
    # Save the model state_dict()
    print(f"[INFO] Saving model to: {model_save_path}")
    torch.save(obj=model.state_dict(), f=model_save_path)

def train_model(model, loss_func, optimizer, train_loader, test_loader, epochs, scheduler=None):
    train_losses = []
    test_losses = []

    for epoch in range(epochs):
        print(f"Epoch {epoch + 1}/{epochs}")

        train_loss_epoch = 0
        model.train()

        for batch_samples, batch_labels in train_loader:
            G_0, G_1 = batch_samples[0]
            x_0, x_1 = G_0[0], G_1[0]
            adj_0, adj_1 = G_0[1], G_1[1]
            
            x_0, x_1 = x_0.to(device), x_1.to(device)
            adj_0, adj_1 = adj_0.to(device), adj_1.to(device)

            y_pred = model(x_0, adj_0, x_1, adj_1) 

            y = batch_labels[0]
            y = y.to(device)
            loss = loss_func(y_pred, y)

            optimizer.zero_grad()
            loss.backward()
            optimizer.step()

            train_loss_epoch += loss.item()

            if scheduler is not None:
               scheduler.step()

            # Move the instances to the CPU
            x_0, x_1 = x_0.to("cpu"), x_1.to("cpu")
            adj_0, adj_1 = adj_0.to("cpu"), adj_1.to("cpu")
            y = y.to("cpu")

            torch.cuda.empty_cache()

        train_loss_epoch = train_loss_epoch / len(train_loader)
        train_losses.append(train_loss_epoch)
        
        model.eval()
        test_loss = 0
        with torch.no_grad():
            for batch_samples, batch_labels in test_loader:
                G_0, G_1 = batch_samples[0]
                x_0, x_1 = G_0[0], G_1[0]
                adj_0, adj_1 = G_0[1], G_1[1]

                x_0, x_1 = x_0.to(device), x_1.to(device)
                adj_0, adj_1 = adj_0.to(device), adj_1.to(device)
                y_pred = model(x_0, adj_0, x_1, adj_1)

                y = batch_labels[0]
                y = y.to(device)
                loss = loss_func(y_pred, y)

                x_0, x_1 = x_0.to("cpu"), x_1.to("cpu")
                adj_0, adj_1 = adj_0.to("cpu"), adj_1.to("cpu")
                y = y.to("cpu")

                torch.cuda.empty_cache()

                print(f"Labels: {y}; Predictions: {y_pred}; Loss: {loss.item()}")

                test_loss += loss.item()
        
        test_loss = test_loss / len(test_loader)
        test_losses.append(test_loss)
        print(f"Test Loss: {test_loss}")
    
    return train_losses, test_losses

def main(args):
    epochs = int(args['epoch'])
    batch_size = int(args['batch'])
    seed = int(args['seed'])
    dataset_path = args['dataset']

    torch.manual_seed(seed)

    train_dataset_path = Path(dataset_path) / "train"
    test_dataset_path = Path(dataset_path) / "test"

    train_dataset = HLSDatasetLUT(train_dataset_path)
    test_dataset = HLSDatasetLUT(test_dataset_path)

    train_loader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True, collate_fn=lambda x: tuple(zip(*x)))
    test_loader = DataLoader(test_dataset, shuffle=False, collate_fn=lambda x: tuple(zip(*x)))

    model = GAT(23, 14, 1)
    model = model.to(device)

    loss_func = RMSELoss

    optimizer = torch.optim.Adam(model.parameters(), lr=1e-2, betas=(0.6, 0.9999))
    scheduler = torch.optim.lr_scheduler.CosineAnnealingWarmRestarts(optimizer, T_0=int(batch_size/2), T_mult=2, eta_min=0)

    train_losses, test_losses = train_model(model, loss_func, optimizer, train_loader, test_loader, epochs, scheduler)

    save_model(model, "estimators/gat/models", "gat_lut_0.pth")

    plt.plot(train_losses, label="Train Loss", color="red")
    plt.plot(test_losses, label="Test Loss", color="blue")
    plt.savefig("estimators/gat/gat_lut_training_0.png")
    plt.legend()
    plt.show()
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Provide arguments for the GAT model for resource usage prediction')

    parser.add_argument('--epoch', help='The number of training epochs', default=100)
    parser.add_argument('--seed', help='Random seed for repeatability', default=42)
    parser.add_argument('--batch', help='Batch size', default=16)
    parser.add_argument('--dataset', help='Path to the dataset', required=True)

    args = vars(parser.parse_args())

    main(args)