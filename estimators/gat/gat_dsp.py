import torch
import torch.nn as nn

from sklearn import model_selection
from pathlib import Path
import argparse, os

import tkinter as tk
import matplotlib
import matplotlib.pyplot as plt

from estimators.gat.models import GAT
from dfg.hls_dfg import build_dfg_dsp

device = "cuda" if torch.cuda.is_available() else "cpu"
torch.set_default_device(device)

def RMSELoss(pred, target):
    return torch.sqrt(torch.mean((pred - target) ** 2))

def MSLELoss(pred, target):
    return torch.mean((torch.log(pred + torch.e) - torch.log(target + torch.e)) ** 2)

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

def train_model(model, loss_func, optimizer, graphs, labels, epochs):
    datasets = list(zip(graphs, labels))
    train_dataset, test_dataset = model_selection.train_test_split(datasets, train_size=29/34, shuffle=True)
    train_graphs, train_labels = zip(*train_dataset)
    test_graphs, test_labels = zip(*test_dataset)
    train_losses = []
    test_losses = []

    for epoch in range(epochs):
        train_loss = train_step(model, loss_func, optimizer, train_graphs, train_labels)
        test_loss = test_step(model, loss_func, test_graphs, test_labels)

        print(f"Epoch {epoch+1}/{epochs}: Train loss: {train_loss}, Test loss: {test_loss}")

        train_losses.append(train_loss)
        test_losses.append(test_loss)
    
    return train_losses, test_losses

def main(args):
    epochs = int(args['epoch'])
    seed = int(args['seed'])

    torch.manual_seed(seed)

    graphs_dir = os.fsencode(args['graphs'])
    target_dsp_file = args['dsp']

    graphs = []
    graph_files = sorted(os.listdir(graphs_dir))
    features = []
    adj_mats = []

    for graph_file in graph_files:
        graph_file_path = os.fsdecode(os.path.join(graphs_dir, graph_file))
        node_features, adj_mat = build_dfg_dsp(graph_file_path)
        features.append(node_features)
        adj_mats.append(adj_mat)

    graphs = list(zip(features, adj_mats))

    with open(target_dsp_file, 'r') as f:
        graph_labels_dsp = [[float(label)] for label in f.readlines()]

    graph_labels_dsp = torch.FloatTensor(graph_labels_dsp)

    model = GAT(18, 1)

    loss_func = MSLELoss
    optimizer = torch.optim.Adam(model.parameters(), lr=1e-4, betas=(0.9, 0.99999))

    train_losses, test_losses = train_model(model, loss_func, optimizer, graphs, graph_labels_dsp, epochs)

    plt.plot(train_losses, label="Train Loss", color="red")
    plt.plot(test_losses, label="Test Loss", color="blue")
    plt.legend()
    plt.show()
    # plt.savefig("estimators/gat/gat_dsp_learning.png")

    save_model(model, "estimators/gat/models", "gat_dsp.pth")
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Provide arguments for the graph embedding model with DSP predictions')

    parser.add_argument('--epoch', help='The number of training epochs', default=500)
    parser.add_argument('--seed', help='Random seed for repeatability', default=1234)
    parser.add_argument('--graphs', help='Path to the directory containing the DFGs', required=True)
    parser.add_argument('--dsp', help='Path to the file containing the target DSPs', required=True)

    args = vars(parser.parse_args())

    main(args)