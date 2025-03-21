from numpy.typing import ArrayLike

import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from pathlib import Path
from argparse import ArgumentParser


def extract_metric_from_data(
    dataset_path: str, metric: str, 
    filtered: bool = False, benches: str = None
) -> ArrayLike:
    reports = []
    if isinstance(benches, str):
        benches = [benches]
    elif benches is None:
        benches = os.listdir(dataset_path)
    for bench in benches:
        reports_df = organize_data(dataset_path, bench, filtered=filtered)
        bench_reports = reports_df[metric].values
        bench_reports = [x for x in bench_reports if x >= 0]
        reports.extend(bench_reports)
    return np.array(reports)


def plot_distribution(dataset_path: str, metric: str, filtered=False):
    reports = extract_metric_from_data(dataset_path, metric, filtered)
    stats = {
        'mean': np.mean(reports),
        'std': np.std(reports),
        'skew': pd.Series(reports).skew(),
        'kurtosis': pd.Series(reports).kurtosis(),
        'min': np.min(reports),
        'max': np.max(reports)
    }

    metric = metric.upper()
    print(f'{metric} mean: {stats["mean"]:.2f}')
    print(f'{metric} std: {stats["std"]:.2f}')
    print(f'{metric} kurtosis: {stats["kurtosis"]:.2f}')
    print(f'{metric} skewness: {stats["skew"]:.2f}')
    print(f'{metric} min: {stats["min"]:.2f}')
    print(f'{metric} max: {stats["max"]:.2f}')

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
    return parser.parse_args()


if __name__ == '__main__':
    import sys

    if __package__ is None:                  
        DIR = Path(__file__).resolve().parent
        sys.path.insert(0, str(DIR.parent))
        sys.path.insert(0, str(DIR.parent.parent))
        sys.path.insert(0, str(DIR.parent.parent.parent))
        sys.path.insert(0, str(DIR.parent.parent.parent.parent))
        __package__ = DIR.name

    from utils.parsers import organize_data

    args = parse_args()
    dataset_path = args.dataset
    metric = args.metric
    filtered = args.filtered

    assert Path(dataset_path).is_dir()

    plot_distribution(dataset_path, metric, filtered)

