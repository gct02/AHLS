from typing import List, Union
from pathlib import Path

import torch

from gnn.data.utils.parsers import (
    extract_utilization,
    extract_hls_area_estimates
)
from gnn.data.utils.parsers import AVAILABLE_RESOURCES
from gnn.data.dataset import TARGET_METRICS
from gnn.analysis.utils import percentage_diff, compute_snru

AVAILABLE_RESOURCES_TENSOR = torch.tensor(
    [AVAILABLE_RESOURCES[r] for r in TARGET_METRICS['area']],
    dtype=torch.float32
)


def compute_baseline_error(
    dataset_dir: Union[str, Path],
    metrics: List[str] = ["lut", "ff", "bram", "dsp"]
):
    error_list = []

    for benchmark_dir in Path(dataset_dir).iterdir():
        if not benchmark_dir.is_dir():
            continue
        
        for solution_dir in Path(benchmark_dir).iterdir():
            if (not solution_dir.is_dir() 
                or not solution_dir.name.startswith("solution")):
                continue

            filtered = solution_dir.name != "solution0"

            # Extract utilization and area estimates
            utilization = extract_utilization(solution_dir, filtered=filtered)
            area_estimates = extract_hls_area_estimates(solution_dir, filtered=filtered)
            if utilization is None or area_estimates is None:
                continue

            print("Ground Truth Utilization:", utilization)
            print("Area Estimates:", area_estimates)

            # Calculate error
            ground_truth = torch.tensor([utilization[key] for key in metrics])
            estimates = torch.tensor([area_estimates[key] for key in metrics])
            ground_truth = compute_snru(ground_truth, AVAILABLE_RESOURCES_TENSOR)
            estimates = compute_snru(estimates, AVAILABLE_RESOURCES_TENSOR)
            error = percentage_diff(estimates, ground_truth)
            error_list.append(error)

    if not error_list:
        return 0
    
    return torch.stack(error_list).mean().item()


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Compute baseline error for GNN analysis.")
    parser.add_argument("dataset_dir", type=str, help="Path to the dataset directory.")
    parser.add_argument("-m", "--metrics", nargs='*', default=["lut", "ff", "bram", "dsp"], 
                        help="Metrics to compute baseline error for.")

    args = parser.parse_args()

    error = compute_baseline_error(args.dataset_dir, args.metrics)
    print(f"Average Baseline Error: {error:.2f}%")

