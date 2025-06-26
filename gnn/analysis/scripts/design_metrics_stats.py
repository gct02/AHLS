import os
from argparse import ArgumentParser
from typing import Optional, Union, List

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from numpy.typing import NDArray

from gnn.analysis.utils import collate_data_for_analysis


def extract_metric_from_data(
    dataset_dir: str, 
    metric: str, 
    filtered: bool = False, 
    benchmarks: Optional[Union[List[str], str]] = None
) -> NDArray[np.float32]:
    if benchmarks is None:
        benchmarks = os.listdir(dataset_dir)
    elif isinstance(benchmarks, str):
        benchmarks = [benchmarks]

    reports = []
    for bench in benchmarks:
        rpt, _ = collate_data_for_analysis(dataset_dir, bench, filtered=filtered)
        for v in rpt[metric].values:
            if v >= 0:
                reports.append(float(v))

    return np.array(reports, dtype=np.float32)


def plot_distribution(
    dataset_dir: str, 
    metric: str, 
    filtered: bool = False, 
    benchmarks: Optional[Union[List[str], str]] = None
):
    reports = extract_metric_from_data(dataset_dir, metric, filtered, benchmarks)
    # reports = np.float_power(reports, 0.2)
    stats = {
        'mean': np.mean(reports),
        'std': np.std(reports),
        'skew': pd.Series(reports).skew(),
        'kurtosis': pd.Series(reports).kurtosis(),
        'min': np.min(reports),
        'max': np.max(reports),
        'median': np.median(reports),
        'q1': np.percentile(reports, 25),
        'q3': np.percentile(reports, 75)
    }

    metric = metric.upper()
    print(f'{metric} mean: {stats["mean"]:.2f}')
    print(f'{metric} std: {stats["std"]:.2f}')
    print(f'{metric} kurtosis: {stats["kurtosis"]:.2f}')
    print(f'{metric} skewness: {stats["skew"]:.2f}')
    print(f'{metric} min: {stats["min"]:.2f}')
    print(f'{metric} max: {stats["max"]:.2f}')
    print(f'{metric} median: {stats["median"]:.2f}')
    print(f'{metric} Q1: {stats["q1"]:.2f}')
    print(f'{metric} Q3: {stats["q3"]:.2f}')

    plt.figure(figsize=(12, 8), dpi=150)
    
    # Plot histogram with KDE
    sns.histplot(reports, bins='auto', kde=True, color='blue', edgecolor='black', alpha=0.7)

    # Plot mean and std deviation
    plt.axvline(stats["mean"], color='red', linestyle='dashed', linewidth=2, 
                label=f'Mean: {stats["mean"]:.2f}')
    plt.axvline(stats["mean"] + stats["std"], color='green', linestyle='dashed', linewidth=1, 
                label=f'+1 Std Dev: {stats["mean"] + stats["std"]:.2f}')
    plt.axvline(stats["mean"] - stats["std"], color='green', linestyle='dashed', linewidth=1, 
                label=f'-1 Std Dev: {stats["mean"] - stats["std"]:.2f}')

    plt.title(f'{metric} Distribution', fontsize=14)
    plt.xlabel(metric, fontsize=12)
    plt.ylabel('Frequency', fontsize=12)
    plt.legend()
    plt.grid(axis='y', linestyle='--', alpha=0.7)

    plt.show()
    plt.close()


def parse_args():
    parser = ArgumentParser()
    parser.add_argument('-d', '--dataset', required=True, 
                        help='Dataset directory path')
    parser.add_argument('-m', '--metric', required=True, 
                        help='Metric to analyze')
    parser.add_argument('-f', '--filtered', action='store_true',
                        help='Sinalize if the dataset is filtered')
    parser.add_argument('-b', '--benchmarks', nargs='+',
                        help='List of benchmarks to analyze')
    return parser.parse_args()


if __name__ == '__main__':
    args = parse_args()
    dataset_dir = args.dataset
    metric = args.metric
    filtered = args.filtered
    benchmarks = args.benchmarks

    plot_distribution(dataset_dir, metric, filtered, benchmarks)