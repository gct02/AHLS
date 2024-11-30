import torch
import torch.nn as nn
import argparse, os
import matplotlib
import matplotlib.pyplot as plt
from pathlib import Path
from torch.utils.data import Dataset, DataLoader
from estimators.han.models import HAN
from estimators.han.dataset import HLSDataset


matplotlib.use('Agg')

device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')
torch.backends.cudnn.benchmark = True

torch.set_printoptions(
    precision=6,
    threshold=1000,
    edgeitems=10,
    linewidth=200,
    profile="short",
    sci_mode=False
)


def save_model(model, target_dir, model_name):
    target_dir_path = Path(target_dir)
    target_dir_path.mkdir(parents=True, exist_ok=True)
    assert model_name.endswith(".pth") or model_name.endswith(".pt"), \
        "model_name should end with '.pt' or '.pth'"
    model_save_path = target_dir_path / model_name
    print(f"[INFO] Saving model to: {model_save_path}")
    torch.save(obj=model.state_dict(), f=model_save_path)


def move_to_device(data, device):
    if isinstance(data, torch.Tensor):
        return data.to(device)
    elif isinstance(data, dict):
        return {key: move_to_device(value, device) for key, value in data.items()}
    elif isinstance(data, list):
        return [move_to_device(item, device) for item in data]
    else:
        return data


def train_model(
    model,
    loss_func,
    optimizer,
    train_loader,
    test_loader,
    val_loader,
    epochs,
    scheduler=None,
    verbose=False
    ):
    train_losses = []
    test_losses = []

    n_instances = len(test_loader)
    test_preds_inst = [[] for _ in range(n_instances)]

    for epoch in range(epochs):
        if verbose:
            print(f"Epoch {epoch + 1}/{epochs}\n")

        # ********** Training ********** #
        model.train()
        train_loss_epoch = 0
        for i, (input_batch, target_batch) in enumerate(train_loader):
            batch_loss = 0
            optimizer.zero_grad()

            for (cdfg, target) in zip(input_batch, target_batch):
                x_dict, edge_index_dict = cdfg

                x_dict = move_to_device(x_dict, device)
                edge_index_dict = move_to_device(edge_index_dict, device)
                target = target.to(device)

                pred = model(x_dict, edge_index_dict)

                instance_loss = loss_func(pred, target)
                batch_loss += instance_loss.item()
                instance_loss.backward()

                x_dict = move_to_device(x_dict, "cpu")
                edge_index_dict = move_to_device(edge_index_dict, "cpu")
                target, pred = target.to("cpu"), pred.to("cpu")
                torch.cuda.empty_cache()

            optimizer.step()

            batch_loss = batch_loss / len(input_batch)
            train_loss_epoch += batch_loss

            if verbose:
                print(f"Average MSE on train batch {i}: {batch_loss}")

        train_loss_epoch = train_loss_epoch / len(train_loader)
        train_losses.append(train_loss_epoch)

        # ********** Evaluation ********** #
        model.eval()
        with torch.no_grad():
            # ********** Validation ********** #
            if verbose:
                print("\nEvaluating on validation set\n")

            val_loss_epoch = 0
            for input_batch, target_batch in val_loader:
                cdfg = input_batch[0] # Only one instance per batch in val_loader
                x_dict, edge_index_dict = cdfg
                x_dict = move_to_device(x_dict, device)
                edge_index_dict = move_to_device(edge_index_dict, device)

                pred = model(x_dict, edge_index_dict)

                target = target_batch[0].squeeze().to(device)
                pred = pred.to(device)

                loss = loss_func(pred, target)

                val_loss_epoch += loss.item()

                if verbose:
                    print(f"Target: {target.item()}; Prediction: {pred.item()}; Loss: {loss.item()}")

                x_dict = move_to_device(x_dict, "cpu")
                edge_index_dict = move_to_device(edge_index_dict, "cpu")
                target, pred = target.to("cpu"), pred.to("cpu")
                torch.cuda.empty_cache()

            val_loss_epoch = val_loss_epoch / len(val_loader)

            if verbose:
                print(f"\nAverage MSE on validation set: {val_loss_epoch}\n")

            if scheduler is not None:
                scheduler.step(val_loss_epoch)

            # ********** Test ********** #
            if verbose:
                print("\nEvaluating on test set\n")

            test_loss_epoch = 0
            for i, (input_batch, target_batch) in enumerate(test_loader):
                cdfg = input_batch[0] # Only one instance per batch in test_loader
                x_dict, edge_index_dict = cdfg
                x_dict = move_to_device(x_dict, device)
                edge_index_dict = move_to_device(edge_index_dict, device)

                pred = model(x_dict, edge_index_dict)

                target = target_batch[0].squeeze().to(device)
                pred = pred.to(device)

                loss = loss_func(pred, target)

                test_loss_epoch += loss.item()
                test_preds_inst[i].append([pred.item(), target.item()])

                if verbose:
                    print(f"Target: {target.item()}; Prediction: {pred.item()}; Loss: {loss.item()}")

                x_dict = move_to_device(x_dict, "cpu")
                edge_index_dict = move_to_device(edge_index_dict, "cpu")
                target, pred = target.to("cpu"), pred.to("cpu")
                torch.cuda.empty_cache()
        
            test_loss_epoch = test_loss_epoch / len(test_loader)
            test_losses.append(test_loss_epoch)

            if verbose:
                print(f"\nAverage MSE on test set: {test_loss_epoch}\n")
        
    return train_losses, test_losses, test_preds_inst


def main(args):
    epochs = int(args['epoch'])
    batch_size = int(args['batch'])
    seed = int(args['seed'])
    dataset_path = args['dataset']
    target_metric = args['target']
    verbose = args['verbose']

    torch.manual_seed(seed)
    
    n_benchs = len(os.listdir(dataset_path))

    model_analysis_folder = "estimators/han/model_analysis"
    os.makedirs(model_analysis_folder, exist_ok=True)

    for i in range(n_benchs):
        bench_name = os.listdir(dataset_path)[i]

        model_analysis_bench_folder = f"{model_analysis_folder}/{bench_name}"
        os.makedirs(model_analysis_bench_folder, exist_ok=True)

        model_stats_folder = f"{model_analysis_bench_folder}/stats"
        os.makedirs(model_stats_folder, exist_ok=True)
        model_graphs_folder = f"{model_analysis_bench_folder}/graphs"
        os.makedirs(model_graphs_folder, exist_ok=True)

        train_dataset = HLSDataset(dataset_path, target_metric, test_set_index=i, get_test=False)
        test_dataset = HLSDataset(dataset_path, target_metric, test_set_index=i, get_test=True)

        validation_split = 0.1
        n_train = int((1 - validation_split) * len(train_dataset))
        n_val = len(train_dataset) - n_train
        train_dataset, val_dataset = torch.utils.data.random_split(
            train_dataset, [n_train, n_val]
        )

        train_loader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True, \
                                  collate_fn=lambda x: tuple(zip(*x)))
        val_loader = DataLoader(val_dataset, shuffle=False, collate_fn=lambda x: tuple(zip(*x)))
        test_loader = DataLoader(test_dataset, shuffle=False, collate_fn=lambda x: tuple(zip(*x)))

        n_features = {'inst': 18, 'var': 9, 'const': 10}

        model = HAN(
            n_features=n_features, 
            n_out=1, 
            n_hid_att=16, 
            heads_att=4, 
            n_hid_set=6, 
            heads_set=3, 
            norm=True
        )
        model = model.to(device)

        loss_func = nn.MSELoss()

        optimizer = torch.optim.RAdam(
            model.parameters(), 
            lr=1e-3, 
            betas=(0.8, 0.999)
        )
        scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(
            optimizer, 
            mode='min', 
            factor=0.1, 
            patience=10, 
            min_lr=1e-6, 
            verbose=verbose
        )

        train_losses, test_losses, test_preds_inst = train_model(
            model, loss_func, optimizer, train_loader, test_loader, val_loader, epochs,
            scheduler=scheduler, verbose=verbose
        )
        save_model(model, "estimators/han/models", f"han_{target_metric}_{bench_name}.pth")

        model_metric_stats_folder = f"{model_stats_folder}/{target_metric}"
        model_metric_graphs_folder = f"{model_graphs_folder}/{target_metric}"
        os.makedirs(model_metric_stats_folder, exist_ok=True)
        os.makedirs(model_metric_graphs_folder, exist_ok=True)

        with open(f"{model_metric_stats_folder}/test_preds_per_inst.txt", "w") as f:
            for instance in test_preds_inst:
                target = float(instance[0][1])
                f.write(f"{target}")
                for target_pred_pair in instance:
                    pred = float(target_pred_pair[0])
                    f.write(f",{pred}")
                f.write("\n")

        with open(f"{model_stats_folder}/train_mse_per_epoch.txt", "w") as f:
            f.write("\n".join(list(map(lambda x: str(float(x)), train_losses))))

        with open(f"{model_stats_folder}/test_mse_per_epoch.txt", "w") as f:
            f.write("\n".join(list(map(lambda x: str(float(x)), test_losses))))

        x_axis = range(epochs)
        plt.figure(
            figsize=[40, 20], 
            facecolor='skyblue', 
            edgecolor='black', 
            dpi=100,
            layout='constrained'
        )
        plt.plot(x_axis, train_losses, label='train loss', color='g')
        plt.plot(x_axis, test_losses, label='test loss', color='r')
        plt.legend()
        plt.savefig(f"{model_metric_graphs_folder}/learning_curve.png")
        plt.close()

        del model, train_dataset, test_dataset, train_loader, test_loader, \
            optimizer, scheduler, train_losses, test_losses, test_preds_inst


if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument('--epoch', help='The number of training epochs', default=1000)
    parser.add_argument('--seed', help='Random seed for repeatability', default=42)
    parser.add_argument('--batch', help='Batch size', default=16)
    parser.add_argument('--dataset', help='Path to the dataset', required=True)
    parser.add_argument('--verbose', help='Print debug information', action='store_true')
    parser.add_argument('--target', help='The target resource metric', required=True, \
                        choices=['lut', 'ff', 'dsp', 'bram', 'cp'])

    args = vars(parser.parse_args())

    main(args)
