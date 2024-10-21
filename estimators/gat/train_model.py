import torch
import torch.nn as nn
import argparse, os, pickle, gc
import matplotlib
import matplotlib.pyplot as plt
from pathlib import Path
from torch.utils.data import Dataset, DataLoader
from estimators.gat.models import GAT
from estimators.gat.dataset import HLSDataset

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

    n_instances = len(test_loader)
    test_preds_inst = [[] for _ in range(n_instances)]

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
        test_loss_epoch = 0
        with torch.no_grad():
            for i, (batch_samples, batch_labels) in enumerate(test_loader):
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
                
                test_preds_inst[i].append([y_pred.item(), y.item()])

                print(f"Labels: {y}; Predictions: {y_pred}; Loss: {loss.item()}")

                test_loss_epoch += loss.item()
        
        test_loss_epoch = test_loss_epoch / n_instances
        test_losses.append(test_loss_epoch)
        print(f"Test Loss: {test_loss_epoch}")
        
    return train_losses, test_losses, test_preds_inst

def main(args):
    epochs = int(args['epoch'])
    batch_size = int(args['batch'])
    seed = int(args['seed'])
    dataset_path = args['dataset']
    target = args['target']

    torch.manual_seed(seed)
    
    n_benchs = len(os.listdir(dataset_path))

    for i in range(n_benchs):
        bench_name = os.listdir(dataset_path)[i]

        train_dataset = HLSDataset(dataset_path, target, test_set_index=i, get_test=False)
        test_dataset = HLSDataset(dataset_path, target, test_set_index=i, get_test=True)

        train_loader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True, collate_fn=lambda x: tuple(zip(*x)))
        test_loader = DataLoader(test_dataset, batch_size=1, shuffle=False, collate_fn=lambda x: tuple(zip(*x)))

        model = GAT(38, 25, 1)
        model = model.to(device)

        loss_func = RMSELoss

        optimizer = torch.optim.AdamW(model.parameters(), lr=5e-3, betas=(0.8, 0.999))
        scheduler = torch.optim.lr_scheduler.CosineAnnealingWarmRestarts(optimizer, T_0=batch_size, T_mult=2, eta_min=0)

        train_losses, test_losses, test_preds_inst = train_model(model, loss_func, optimizer, train_loader, test_loader, epochs, scheduler)

        save_model(model, "estimators/gat/models", f"gat_{target}_{bench_name}.pth")

        model_stats_folder = f"estimators/gat/model_analysis/stats/data_{target}"
        model_graphs_folder = f"estimators/gat/model_analysis/graphs/data_{target}"

        os.makedirs(model_stats_folder, exist_ok=True)
        os.makedirs(model_graphs_folder, exist_ok=True)

        with open(f"{model_stats_folder}/test_predictions_{bench_name}.txt", "w") as f:
            for instance in test_preds_inst:
                target = float(instance[0][1])
                f.write(f"{target}")
                for target_pred_pair in instance:
                    pred = float(target_pred_pair[0])
                    f.write(f",{pred}")
                f.write("\n")

        with open(f"{model_stats_folder}/train_losses_{bench_name}.txt", "w") as f:
            f.write("\n".join(list(map(lambda x: str(float(x)), train_losses))))

        with open(f"{model_stats_folder}/test_losses_{bench_name}.txt", "w") as f:
            f.write("\n".join(list(map(lambda x: str(float(x)), test_losses))))

        for j, instance in enumerate(test_preds_inst):
            target = float(instance[0][1])
            preds = [target_pred_pair[0] for target_pred_pair in instance]
            x_axis = range(epochs)
            target_line = epochs * [target]
            plt.figure(figsize=[30, 20], facecolor='skyblue', edgecolor='black', dpi=100, layout='constrained')
            plt.plot(x_axis, target_line, label='target', color='k')
            plt.plot(x_axis, preds, label='pred', color='b')
            plt.legend()
            plt.savefig(f"{model_graphs_folder}/predictions_{bench_name}_solution{j + 1}.png")
            plt.close()

        x_axis = range(epochs)
        plt.figure(figsize=[30, 20], facecolor='skyblue', edgecolor='black', dpi=100, layout='constrained')
        plt.plot(x_axis, train_losses, label='train loss', color='g')
        plt.plot(x_axis, test_losses, label='test loss', color='r')
        plt.legend()
        plt.savefig(f"{model_graphs_folder}/learning_curve_{bench_name}.png")
        plt.close()

        del model, train_dataset, test_dataset, train_loader, test_loader, optimizer
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Provide arguments for the GAT model for resource usage prediction')

    parser.add_argument('--epoch', help='The number of training epochs', default=100)
    parser.add_argument('--seed', help='Random seed for repeatability', default=42)
    parser.add_argument('--batch', help='Batch size', default=16)
    parser.add_argument('--dataset', help='Path to the dataset', required=True)
    parser.add_argument('--target', help='The target resource metric', required=True, choices=['lut', 'ff', 'dsp', 'bram', 'cp'])

    args = vars(parser.parse_args())

    main(args)
