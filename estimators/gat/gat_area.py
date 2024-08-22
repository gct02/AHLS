import torch
import torch.cuda.nccl
import torch.nn as nn

from sklearn import model_selection
from pathlib import Path
from random import shuffle
import argparse, os, pickle

import tkinter as tk
import matplotlib
import matplotlib.pyplot as plt

from estimators.gat.models import GAT

import gc

gc.collect()

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
torch.cuda.empty_cache()

torch.set_printoptions(precision=6, threshold=1000, edgeitems=10, linewidth=200, profile="short", sci_mode=False)

def RMSELoss(pred, target):
    return torch.sqrt(torch.mean((pred - target) ** 2))

def train_step(model, loss_func, optimizer, graphs, labels):
    print("Training...")
    train_loss = 0
    model.train()

    for graph, label in zip(graphs, labels):
        node_features = graph[0]
        adj_mat = graph[1]

        node_features = node_features.to(device)
        adj_mat = adj_mat.to(device)

        label_pred = model(node_features, adj_mat)

        label = label.to(device)

        print(f"Label: {label}, Prediction: {label_pred}")

        loss = loss_func(label_pred, label)
        train_loss += loss.item()

        optimizer.zero_grad()
        loss.backward()
        optimizer.step()

        del loss, label_pred

        # Move the instances to the CPU
        node_features = node_features.to("cpu")
        adj_mat = adj_mat.to("cpu")
        label = label.to("cpu")

    train_loss = train_loss / len(graphs)
    return train_loss

def test_step(model, loss_func, graphs, labels):
    print("Testing...")

    test_loss = 0
    model.eval()

    with torch.inference_mode():
        for graph, label in zip(graphs, labels):
            node_features = graph[0]
            adj_mat = graph[1]

            node_features = node_features.to(device)
            adj_mat = adj_mat.to(device)

            label_pred = model(node_features, adj_mat)

            label = label.to(device)

            print(f"Label: {label}, Prediction: {label_pred}")

            loss = loss_func(label_pred, label)
            test_loss += loss.item()
            del loss, label_pred

            # Move the instances to the CPU
            node_features = node_features.to("cpu")
            adj_mat = adj_mat.to("cpu")
            label = label.to("cpu")

    test_loss = test_loss / len(graphs)
    return test_loss

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

def split_instances(instances_per_benchmark):
    # This function is provisory and will be removed once the dataset is properly structured
    test_instances = []
    train_instances = []
    for benchmark in instances_per_benchmark:
        test_instances += benchmark[4:6]
        train_instances += benchmark[:4] + benchmark[6:]
    return train_instances, test_instances

def train_model(model, loss_func, optimizer, dataset, epochs, scheduler=None):
    BATCH_SIZE = 16 # This is provisory and will be removed once the dataset is properly structured

    train_dataset, test_dataset = split_instances(dataset)
    test_graphs = [instance[0] for instance in test_dataset]
    test_labels = [instance[1] for instance in test_dataset]
    batches = [train_dataset[i:i+BATCH_SIZE] for i in range(0, len(train_dataset), BATCH_SIZE)]

    n_train = len(train_dataset)
    n_valid = int(n_train * 0.25)
    n_instances_out = n_train - n_valid

    train_losses = []
    test_losses = []

    for batch in batches:
        train_dataset, valid_dataset = model_selection.train_test_split(batch, test_size=0.25, shuffle=True)
        train_graphs = [instance[0] for instance in train_dataset]
        train_labels = [instance[1] for instance in train_dataset]
        
        for epoch in range(epochs):
            torch.cuda.empty_cache()

            train_loss = train_step(model, loss_func, optimizer, train_graphs, train_labels)
            test_loss = test_step(model, loss_func, test_graphs, test_labels)

            print(f"Epoch {epoch+1}/{epochs}: Train loss: {train_loss}, Test loss: {test_loss}")

            if scheduler is not None:
                scheduler.step()

            train_losses.append(train_loss)
            test_losses.append(test_loss)

            shuffle(train_dataset)
            next_valid_dataset = train_dataset[:n_instances_out]
            train_dataset = train_dataset[n_instances_out:] + valid_dataset
            valid_dataset = next_valid_dataset
    
    return train_losses, test_losses

def main(args):
    epochs = int(args['epoch'])
    seed = int(args['seed'])

    torch.manual_seed(seed)

    dataset_path = os.fsencode(args['dataset'])

    benchmarks = sorted(os.listdir(dataset_path))
    instances_per_benchmark = []

    for benchmark in benchmarks:
        benchmark_folder = os.fsdecode(os.path.join(dataset_path, benchmark))
        instances = sorted(os.listdir(benchmark_folder))
        instances_per_benchmark.append([])
        for instance in instances:
            instance_folder = os.fsdecode(os.path.join(benchmark_folder, instance))
            
            dfg_path = os.path.join(instance_folder, "dfg.pkl")
            dfg = pickle.load(open(dfg_path, 'rb'))

            with open(os.path.join(instance_folder, "resource_labels.txt"), 'r') as f:
                resources = torch.FloatTensor(list(map(float, f.readlines()[0].strip().split(','))))

            instances_per_benchmark[-1].append((dfg, resources))

    model = GAT(11, 3)
    model = model.to(device)

    loss_func = RMSELoss

    optimizer = torch.optim.Adam(model.parameters(), lr=1e-1, betas=(0.8, 0.9999))
    scheduler = torch.optim.lr_scheduler.CosineAnnealingWarmRestarts(optimizer, T_0=16, T_mult=1, eta_min=1e-6)

    train_losses, test_losses = train_model(model, loss_func, optimizer, instances_per_benchmark, epochs, scheduler)

    plt.plot(train_losses, label="Train Loss", color="red")
    plt.plot(test_losses, label="Test Loss", color="blue")
    plt.legend()
    plt.show()
    # plt.savefig("estimators/gat/gat_area_training.png")

    save_model(model, "estimators/gat/models", "gat_area.pth")
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Provide arguments for the GAT model for resource usage prediction')

    parser.add_argument('--epoch', help='The number of training epochs', default=500)
    parser.add_argument('--seed', help='Random seed for repeatability', default=42)
    parser.add_argument('--dataset', help='Path to the dataset', required=True)

    args = vars(parser.parse_args())

    main(args)