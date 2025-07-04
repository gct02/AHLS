from typing import List, Union, Optional
from pathlib import Path

import torch

from gnn.data.utils.parsers import (
    extract_utilization,
    extract_hls_area_estimates
)
from gnn.data.utils.parsers import (
    AVAILABLE_RESOURCES, 
    AREA_METRICS
)
from gnn.analysis.utils import (
    robust_mape, 
    compute_snru
)


def compute_baseline_error(
    dataset_dir: Union[str, Path],
    metrics: Optional[List[str]] = None,
    benchmarks: Optional[List[str]] = None,
    verbose: bool = False
) -> float:
    metrics = metrics or AREA_METRICS

    def validate_report(report) -> bool:
        if report is None or not isinstance(report, dict):
            return False
        for metric in metrics:
            if metric not in report or report[metric] < 0:
                return False
        return True
    
    avail_resources = torch.tensor(
        [AVAILABLE_RESOURCES[r] for r in metrics],
        dtype=torch.float32
    )
    mape_list = []

    for benchmark_dir in Path(dataset_dir).iterdir():
        if not benchmark_dir.is_dir():
            continue

        if (benchmarks is not None and 
            benchmark_dir.name not in benchmarks):
            continue
        
        for solution_dir in Path(benchmark_dir).iterdir():
            if (not solution_dir.is_dir() or 
                not solution_dir.name.startswith("solution")):
                continue

            filtered = solution_dir.name != "solution0"

            impl_util_rpt = extract_utilization(solution_dir, filtered)
            if not validate_report(impl_util_rpt):
                if verbose:
                    print(f"Invalid implementation report for {solution_dir.name}")
                continue

            hls_util_rpt = extract_hls_area_estimates(solution_dir, filtered)
            if not validate_report(hls_util_rpt):
                if verbose:
                    print(f"Invalid HLS area estimates for {solution_dir.name}")
                continue

            ground_truth = torch.tensor(
                [impl_util_rpt[key] for key in metrics],
                dtype=torch.float32
            )
            estimates = torch.tensor(
                [hls_util_rpt[key] for key in metrics],
                dtype=torch.float32
            )
            ground_truth = compute_snru(ground_truth, avail_resources)
            estimates = compute_snru(estimates, avail_resources)
            mape_list.append(robust_mape(estimates, ground_truth))

    if not mape_list:
        return -1.0  # No valid reports found
    
    return torch.stack(mape_list).mean().item()


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(
        description="Compute baseline (Vitis HLS) MAPE on area estimates for a dataset."
    )
    parser.add_argument("dataset_dir", type=str, help="Path to the dataset directory.")
    parser.add_argument("-m", "--metrics", nargs='*', default=["lut", "ff", "bram", "dsp"], 
                        help="Metrics to compute baseline error for.")
    parser.add_argument("-b", "--benchmarks", nargs='*', default=None,
                        help="List of benchmarks to compute baseline error for. "
                             "If not provided, all benchmarks will be considered.")
    parser.add_argument("-v", "--verbose", action="store_true",
                        help="Enable verbose output for debugging.")

    args = parser.parse_args()

    error = compute_baseline_error(
        dataset_dir=args.dataset_dir, 
        metrics=args.metrics, 
        benchmarks=args.benchmarks,
        verbose=args.verbose
    )
    if error < 0:
        print("No valid reports found.")
    else:
        print(f"Baseline MAPE: {error:.2f}%")