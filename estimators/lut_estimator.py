import torch
import torch.nn as nn
import argparse, os, pickle, gc
import matplotlib
import matplotlib.pyplot as plt
from pathlib import Path
from torch.utils.data import Dataset, DataLoader
from estimators.hgat.models import SimpleHGAT
from estimators.hgat.dataset import HLSDatasetLUT

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

        model.train()
        train_loss_epoch = 0
        for batch_samples, batch_labels in train_loader:
            x_inst, x_var, x_const, x_inst_indexes, x_var_indexes, x_const_indexes, adj_mat_control, adj_mat_data, adj_mat_call = batch_samples[0]

            x_inst, x_var, x_const = x_inst.to(device), x_var.to(device), x_const.to(device)
            x_inst_indexes, x_var_indexes, x_const_indexes = x_inst_indexes.to(device), x_var_indexes.to(device), x_const_indexes.to(device)
            adj_mat_control, adj_mat_data, adj_mat_call = adj_mat_control.to(device), adj_mat_data.to(device), adj_mat_call.to(device)

            y_pred = model(x_inst, x_var, x_const, \
                           x_inst_indexes, x_var_indexes, x_const_indexes, \
                           adj_mat_control, adj_mat_data, adj_mat_call)

            y = batch_labels[0]
            y = y.to(device)

            loss = loss_func(y_pred, y)

            optimizer.zero_grad()
            loss.backward()
            optimizer.step()

            if scheduler is not None:
                scheduler.step()

            # Move the instances to the CPU
            x_inst, x_var, x_const = x_inst.to("cpu"), x_var.to("cpu"), x_const.to("cpu")
            x_inst_indexes, x_var_indexes, x_const_indexes = x_inst_indexes.to("cpu"), x_var_indexes.to("cpu"), x_const_indexes.to("cpu")
            adj_mat_control, adj_mat_data, adj_mat_call = adj_mat_control.to("cpu"), adj_mat_data.to("cpu"), adj_mat_call.to("cpu")

            train_loss_epoch += loss.item()

            torch.cuda.empty_cache()

        train_loss_epoch = train_loss_epoch / len(train_loader)
        train_losses.append(train_loss_epoch)
        
        model.eval()
        test_loss_epoch = 0
        with torch.no_grad():
            for i, (batch_samples, batch_labels) in enumerate(test_loader):
                x_inst, x_var, x_const, x_inst_indexes, x_var_indexes, x_const_indexes, adj_mat_control, adj_mat_data, adj_mat_call = batch_samples[0]

                x_inst, x_var, x_const = x_inst.to(device), x_var.to(device), x_const.to(device)
                x_inst_indexes, x_var_indexes, x_const_indexes = x_inst_indexes.to(device), x_var_indexes.to(device), x_const_indexes.to(device)
                adj_mat_control, adj_mat_data, adj_mat_call = adj_mat_control.to(device), adj_mat_data.to(device), adj_mat_call.to(device)

                y = batch_labels[0]
                y = y.to(device)

                loss = loss_func(y_pred, y)

                x_inst, x_var, x_const = x_inst.to("cpu"), x_var.to("cpu"), x_const.to("cpu")
                x_inst_indexes, x_var_indexes, x_const_indexes = x_inst_indexes.to("cpu"), x_var_indexes.to("cpu"), x_const_indexes.to("cpu")
                adj_mat_control, adj_mat_data, adj_mat_call = adj_mat_control.to("cpu"), adj_mat_data.to("cpu"), adj_mat_call.to("cpu")

                test_loss_epoch += loss.item()
                test_preds_inst[i].append([y_pred.item(), y.item()])
                
                print(f"Labels: {y}; Predictions: {y_pred}; Loss: {loss.item()}")

                torch.cuda.empty_cache()

        test_loss_epoch = test_loss_epoch / n_instances
        test_losses.append(test_loss_epoch)

    return train_losses, test_losses, test_preds_inst

def main(args):
    epochs = int(args['epoch'])
    batch_size = int(args['batch'])
    seed = int(args['seed'])
    dataset_path = args['dataset']
    
    torch.manual_seed(seed)
    
    n_benchs = len(os.listdir(dataset_path))

    for i in range(n_benchs):
        train_dataset = HLSDatasetLUT(dataset_path, i, False)
        test_dataset = HLSDatasetLUT(dataset_path, i, True)

        train_loader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True, collate_fn=lambda x: tuple(zip(*x)))
        test_loader = DataLoader(test_dataset, batch_size=1, shuffle=False, collate_fn=lambda x: tuple(zip(*x)))

        model = SimpleHGAT(20, 7, 7, 8, 4, 1, 1)
        model = model.to(device)

        loss_func = RMSELoss

        optimizer = torch.optim.AdamW(model.parameters(), lr=5e-3, betas=(0.8, 0.999))
        scheduler = torch.optim.lr_scheduler.CosineAnnealingWarmRestarts(optimizer, T_0=batch_size, T_mult=2, eta_min=0)

        train_losses, test_losses, test_preds_inst = train_model(model, loss_func, optimizer, train_loader, test_loader, epochs, scheduler)

        save_model(model, "estimators/hgat/models", f"hgat_lut_{i}.pth")

        with open(f"estimators/hgat/model_stats/test_preds_{i}.txt", "w") as f:
            for instance in test_preds_inst:
                target = float(instance[0][1])
                f.write(f"{target}")
                for target_pred_pair in instance:
                    pred = float(target_pred_pair[0])
                    f.write(f",{pred}")
                f.write("\n")

        with open(f"estimators/hgat/model_stats/train_losses_{i}.txt", "w") as f:
            f.write("\n".join(list(map(lambda x: str(float(x)), train_losses))))

        for j, instance in enumerate(test_preds_inst):
            target = float(instance[0][1])
            preds = [target_pred_pair[0] for target_pred_pair in instance]
            x_axis = range(epochs)
            target_line = epochs * [target]
            plt.figure(figsize=[30, 20], facecolor='skyblue', edgecolor='black', dpi=100, layout='constrained')
            plt.plot(x_axis, target_line, label='target', color='k')
            plt.plot(x_axis, preds, label='pred', color='b')
            plt.legend()
            plt.savefig(f"preds_bench_{i}_inst_{j}.png")
            plt.close()

        x_axis = range(epochs)
        plt.figure(figsize=[30, 20], facecolor='skyblue', edgecolor='black', dpi=100, layout='constrained')
        plt.plot(x_axis, train_losses, label='train loss', color='g')
        plt.plot(x_axis, test_losses, label='test loss', color='r')
        plt.legend()
        plt.savefig(f"losses_bench_{i}.png")
        plt.close()

        del model, train_dataset, test_dataset, train_loader, test_loader, optimizer
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Provide arguments for the GAT model for resource usage prediction')

    parser.add_argument('--epoch', help='The number of training epochs', default=100)
    parser.add_argument('--seed', help='Random seed for repeatability', default=42)
    parser.add_argument('--batch', help='Batch size', default=16)
    parser.add_argument('--dataset', help='Path to the dataset', required=True)

    args = vars(parser.parse_args())

    main(args)