import argparse, os

import numpy as np
import pandas as pd
import torch

import torch.nn as nn
import torch.nn.functional as F

from sklearn import model_selection
from pathlib import Path

from estimators.gnn.gat import GAT
from dfg.hls_dfg import build_dfg

def train_step(model, loss_func, optimizer, graphs, labels):
    train_loss = 0

    model.train()

    for graph, label in zip(graphs, labels):
        node_features = graph[0]
        adj_lists = graph[1]
        label_pred = model(node_features, adj_lists)

        loss = loss_func(label_pred, label)
        train_loss += loss.item()

        optimizer.zero_grad()

        loss.backward()
        optimizer.step

    train_loss = train_loss / len(graphs)
    return train_loss


def test_step(model, loss_func, graphs, labels):
    test_loss = 0

    model.eval()

    with torch.inference_mode():
        for graph, label in zip(graphs, labels):
            node_features = graph[0]
            adj_lists = graph[1]
            label_pred = model(node_features, adj_lists)

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
    train_graphs, test_graphs = model_selection.train_test_split(graphs, train_size=0.9)
    train_labels, test_labels = model_selection.train_test_split(labels, train_size=0.9)

    for epoch in range(epochs):
        train_loss = train_step(model, loss_func, optimizer, train_graphs, train_labels)
        test_loss = test_step(model, loss_func, test_graphs, test_labels)

        print(f"Epoch {epoch+1}/{epochs}: Train loss: {train_loss}, Test loss: {test_loss}")
    
    return train_loss, test_loss


def main(args):
    epochs = int(args['epoch'])
    seed = int(args['seed'])

    np.random.seed(seed=seed)
    torch.manual_seed(seed)

    graphs_dir = os.fsencode(args['graphs'])
    target_dsp_file = args['dsp']

    graphs = []
    for graph_file in os.listdir(graphs_dir):
        graph_file_path = os.fsdecode(graph_file)
        node_features, adj_lists = build_dfg(graph_file_path)
        node_features = torch.FloatTensor(np.array(node_features, dtype=np.float32))
        graphs.append((node_features, adj_lists))

    graph_labels_dsp = pd.read_csv(target_dsp_file)

    model = GAT(32, 1, 8)

    loss_func = nn.MSELoss(reduction='sum')
    optimizer = torch.optim.Adam(model.parameters(), lr=1e-6)

    train_model(model, loss_func, optimizer, graphs, graph_labels_dsp, epochs)

    save_model(model, "models", "gat_dsp.pth")
    

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='provide arguments for the graph embedding model with DSP predictions')

    parser.add_argument('--epoch', help='The number of training epochs', default=50)
    parser.add_argument('--seed', help='Random seed for repeatability', default=42)
    parser.add_argument('--graphs', help='Path to the graphs dataset', required=True)
    parser.add_argument('--dsp', help='Path to the file containing the target DSPs', required=True)

    args = vars(parser.parse_args())

    main(args)