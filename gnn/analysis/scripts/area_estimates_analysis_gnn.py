import torch

from gnn.analysis.utils import robust_mape


def extract_errors(predictions_path):
    with open(predictions_path, 'r') as f:
        lines = f.readlines()
    lines = lines[1:] # Skip header
    targets = []
    preds = []

    for line in lines:
        _, target, pred = line.strip().split(',')
        targets.append(float(target))
        preds.append(float(pred))

    targets = torch.tensor(targets, dtype=torch.float32).expm1()
    preds = torch.tensor(preds, dtype=torch.float32).expm1()

    mape = robust_mape(preds, targets).mean().item()
    return mape


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Compute model error from predictions.")
    parser.add_argument("predictions_path", type=str, help="Path to the predictions file.")
    args = parser.parse_args()

    mape = extract_errors(args.predictions_path)
    print(f"Mean Absolute Percentage Error (MAPE): {mape:.4f}")