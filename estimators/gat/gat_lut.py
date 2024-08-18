import torch
import torch.cuda.nccl
import torch.nn as nn

from sklearn import model_selection
from pathlib import Path
from random import shuffle
import argparse, os

import tkinter as tk
import matplotlib
import matplotlib.pyplot as plt

from estimators.gat.models import GAT
from dfg.hls_dfg import build_dfg_lut

import gc

gc.collect()

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
torch.set_default_device(device)

def RMSELoss(pred, target):
    return torch.sqrt(torch.mean((pred - target) ** 2))

def MSLELoss(pred, target):
    return torch.mean((torch.log(pred + 1) - torch.log(target + 1)) ** 2)

def RMSLELoss(pred, target):
    return torch.sqrt(torch.mean((torch.log(pred + 1) - torch.log(target + 1)) ** 2))

def log_cosh_loss(pred, target):
    return torch.mean(torch.log(torch.cosh(pred - target)))

def train_step(model, loss_func, optimizer, graphs, labels):
    train_loss = 0
    model.train()

    for graph, label in zip(graphs, labels):
        node_features = graph[0]
        adj_mat = graph[1]
        label_pred = model(node_features, adj_mat)

        print(f"Train -> Label: {label.item()}, Prediction: {label_pred.item()}")

        loss = loss_func(label_pred, label)
        train_loss += loss.item()

        optimizer.zero_grad()
        loss.backward()
        optimizer.step()
        
        del loss, label_pred

    train_loss = train_loss / len(graphs)
    return train_loss

def test_step(model, loss_func, graphs, labels):
    test_loss = 0

    model.eval()

    with torch.inference_mode():
        for graph, label in zip(graphs, labels):
            node_features = graph[0]
            adj_mat = graph[1]

            label_pred = model(node_features, adj_mat)

            print(f"Test -> Label: {label.item()}, Prediction: {label_pred.item()}")

            loss = loss_func(label_pred, label)
            test_loss += loss.item()

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

def train_model(model, loss_func, optimizer, graphs, labels, epochs, batch_size=10, scheduler=None):
    datasets = list(zip(graphs, labels))

    train_losses = []
    test_losses = []

    n_batches = len(datasets) // batch_size
    batches = [datasets[i*batch_size:(i+1)*batch_size] for i in range(n_batches)]

    for batch in batches:
        train_dataset, test_dataset = model_selection.train_test_split(batch, train_size=0.6, shuffle=True)
        valid_dataset, test_dataset = model_selection.train_test_split(test_dataset, train_size=0.5, shuffle=True)
        test_graphs, test_labels = zip(*test_dataset)
        train_graphs, train_labels = zip(*train_dataset)
        
        for epoch in range(epochs):
            torch.cuda.empty_cache()
            
            train_graphs, train_labels = zip(*train_dataset)

            train_loss = train_step(model, loss_func, optimizer, train_graphs, train_labels)
            test_loss = test_step(model, loss_func, test_graphs, test_labels)

            print(f"Epoch {epoch+1}/{epochs}: Train loss: {train_loss}, Test loss: {test_loss}")

            train_losses.append(train_loss)
            test_losses.append(test_loss)

            if scheduler is not None:
                scheduler.step()

            train_dataset = list(zip(train_graphs, train_labels))
            shuffle(train_dataset)
            next_valid_dataset = train_dataset[len(train_dataset) - len(valid_dataset):]
            train_dataset = train_dataset[:len(train_dataset) - len(valid_dataset)] + valid_dataset
            valid_dataset = next_valid_dataset
    
    return train_losses, test_losses

def main(args):
    epochs = int(args['epoch'])
    seed = int(args['seed'])

    torch.manual_seed(seed)

    graphs_dir = os.fsencode(args['graphs'])
    target_lut_file = args['lut']

    graphs = []
    graph_files = sorted(os.listdir(graphs_dir))
    features = []
    adj_mats = []

    for graph_file in graph_files:
        graph_file_path = os.fsdecode(os.path.join(graphs_dir, graph_file))
        node_features, adj_mat = build_dfg_lut(graph_file_path)
        node_features = node_features.to(device)
        adj_mat = adj_mat.to(device)
        features.append(node_features)
        adj_mats.append(adj_mat)

    graphs = list(zip(features, adj_mats))

    with open(target_lut_file, 'r') as f:
        graph_labels_lut = [[float(label)] for label in f.readlines()]

    graph_labels_lut = torch.FloatTensor(graph_labels_lut)
    graph_labels_lut = graph_labels_lut.to(device)

    model = GAT(11, 1)

    loss_func = RMSELoss

    optimizer = torch.optim.Adam(model.parameters(), lr=1e-1, betas=(0.64, 0.9999))
    scheduler = torch.optim.lr_scheduler.CosineAnnealingWarmRestarts(optimizer, T_0=10, T_mult=2, eta_min=1e-6)

    train_losses, test_losses = train_model(model, loss_func, optimizer, graphs, graph_labels_lut, epochs, 10, scheduler)

    plt.plot(train_losses, label="Train Loss", color="red")
    plt.plot(test_losses, label="Test Loss", color="blue")
    plt.legend()
    plt.show()
    # plt.savefig("estimators/gat/gat_lut_learning.png")

    save_model(model, "estimators/gat/models", "gat_lut.pth")
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Provide arguments for the graph embedding model with LUT predictions')

    parser.add_argument('--epoch', help='The number of training epochs', default=500)
    parser.add_argument('--seed', help='Random seed for repeatability', default=42)
    parser.add_argument('--graphs', help='Path to the directory containing the DFGs', required=True)
    parser.add_argument('--lut', help='Path to the file containing the target LUTs', required=True)

    args = vars(parser.parse_args())

    main(args)