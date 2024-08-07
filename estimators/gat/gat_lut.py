import torch
import torch.nn as nn

from sklearn import model_selection
from pathlib import Path
import argparse, os

from estimators.gat.models import GAT
from dfg.hls_dfg import build_dfg

device = "cuda" if torch.cuda.is_available() else "cpu"
torch.set_default_device(device)

def train_step(model, loss_func, optimizer, graphs, labels):
    train_loss = 0
    
    model.train()

    for graph, label in zip(graphs, labels):
        node_features = graph[0]
        adj_mat = graph[1]
        label_pred = model(node_features, adj_mat)

        print(f"Label: {label.item()}, Prediction: {label_pred.item()}")

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

def train_model(model, loss_func, optimizer, graphs, labels, epochs, scheduler=None):
    train_graphs, test_graphs = model_selection.train_test_split(graphs, train_size=14/17)
    train_labels, test_labels = model_selection.train_test_split(labels, train_size=14/17)

    for epoch in range(epochs):
        train_loss = train_step(model, loss_func, optimizer, train_graphs, train_labels)
        test_loss = test_step(model, loss_func, test_graphs, test_labels)
        
        if scheduler is not None:
            scheduler.step()

        print(f"Epoch {epoch+1}/{epochs}: Train loss: {train_loss}, Test loss: {test_loss}")
    
    return train_loss, test_loss

def main(args):
    epochs = int(args['epoch'])
    seed = int(args['seed'])

    torch.manual_seed(seed)

    graphs_dir = os.fsencode(args['graphs'])
    target_lut_file = args['lut']

    graphs = []
    for graph_file in os.listdir(graphs_dir):
        graph_file_path = os.fsdecode(os.path.join(graphs_dir, graph_file))
        node_features, adj = build_dfg(graph_file_path)
        graphs.append((node_features, adj))

    with open(target_lut_file, 'r') as f:
        graph_labels_lut = [[float(label)] for label in f.readlines()]

    graph_labels_lut = torch.FloatTensor(graph_labels_lut)

    model = GAT(32, 1)

    loss_func = nn.MSELoss()
    optimizer = torch.optim.AdamW(model.parameters(), lr=1e-2, eps = 1e-6, weight_decay=4e-3, amsgrad=True, betas=(0.63, 0.999999))
    scheduler = torch.optim.lr_scheduler.StepLR(optimizer, step_size=epochs/5, gamma=0.1, verbose=True)

    train_model(model, loss_func, optimizer, graphs, graph_labels_lut, epochs, scheduler)

    save_model(model, "estimators/gat/models", "gat_lut.pth")
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Provide arguments for the graph embedding model with LUT predictions')

    parser.add_argument('--epoch', help='The number of training epochs', default=500)
    parser.add_argument('--seed', help='Random seed for repeatability', default=42)
    parser.add_argument('--graphs', help='Path to the directory containing the DFGs', required=True)
    parser.add_argument('--lut', help='Path to the file containing the target LUTs', required=True)

    args = vars(parser.parse_args())

    main(args)