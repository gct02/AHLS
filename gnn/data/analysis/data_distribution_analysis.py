import os
import logging
from argparse import ArgumentParser
from collections import defaultdict
from typing import Optional, Union, List, Any, Set, Dict

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from numpy.typing import NDArray

from gnn.data.utils.parsers import extract_metrics
from gnn.data.analysis.analysis_utils import collate_data_for_analysis


# Configure logging
logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s')


def make_hashable_report(report: Any) -> Any:
    """
    Attempts to convert a report (represented as a dict)
    into a hashable representation.

    Handles dicts by converting items to a sorted tuple.
    Includes basic handling for nested structures.

    Returns a hashable representation or None if conversion fails.
    """
    if isinstance(report, dict):
        try:
            items = []
            for k, v in sorted(report.items()):
                 hashable_v = make_hashable_report(v)
                 if hashable_v is None:
                     raise TypeError(f"Unhashable value type {type(v)} found for key '{k}'")
                 items.append((k, hashable_v))
            return tuple(items)
        except TypeError as e:
            logging.warning(f"Could not convert dict to hashable tuple. Error: {e}.")
            return None
    elif isinstance(report, list):
        try:
            return tuple(make_hashable_report(item) for item in report)
        except TypeError as e:
            logging.warning(f"Could not convert list to hashable tuple: {report}. Error: {e}")
            return None
    elif isinstance(report, set):
        try:
            return tuple(sorted(make_hashable_report(item) for item in report))
        except TypeError as e:
            logging.warning(f"Could not convert set to hashable tuple: {report}. Error: {e}")
            return None
    try:
        hash(report)
        return report
    except TypeError:
        logging.warning(
            f"Report type {type(report)} is not inherently "
            f"hashable and couldn't be converted: {report}"
        )
        return None


def find_equivalent_designs(
    dataset_dir: str, 
    filtered: bool = False
) -> Dict[str, List[Set[int]]]:
    """
    Finds groups of equivalent designs within each benchmark.

    Args:
        dataset_dir: Path to the root directory containing benchmark subdirectories.
        filtered: Flag passed to extract_metrics.

    Returns:
        A dictionary where keys are benchmark names and values are lists of sets.
        Each set contains the indices of solutions that are equivalent to each other.
        Only groups with more than one equivalent design are included.
    """
    if not os.path.isdir(dataset_dir):
        logging.error(f"Dataset directory not found: {dataset_dir}")
        return {}

    grouped_equivalents: Dict[str, List[Set[int]]] = defaultdict(list)

    for benchmark in os.listdir(dataset_dir):
        benchmark_dir = os.path.join(dataset_dir, benchmark)
        if not os.path.isdir(benchmark_dir):
            continue

        report_to_indices: Dict[Any, List[int]] = defaultdict(list)
        logging.info(f"Processing benchmark: {benchmark}...")

        for solution in os.listdir(benchmark_dir):
            solution_dir = os.path.join(benchmark_dir, solution)
            if not os.path.isdir(solution_dir):
                continue
            try:
                solution_index_str = solution.split('solution')[-1]
                if not solution_index_str.isdigit():
                     logging.warning(f"Skipping non-standard directory name: {solution} in {benchmark}")
                     continue
                solution_index = int(solution_index_str)
            except (ValueError, IndexError):
                logging.warning(f"Could not parse solution index from: {solution} in {benchmark}")
                continue

            report = extract_metrics(solution_dir, filtered=filtered)
            if report is not None:
                report = make_hashable_report(report)
                try:
                    report_to_indices[report].append(solution_index)
                except TypeError:
                    logging.error(
                        f"Report type {type(report)} from {solution_dir} is not hashable. "
                        f"Cannot group by this report. Consider converting it to a hashable type (e.g., tuple)."
                    )
                    continue

        for _, indices in report_to_indices.items():
            if len(indices) > 1:
                grouped_equivalents[benchmark].append(set(sorted(indices)))

        if benchmark in grouped_equivalents:
             grouped_equivalents[benchmark].sort(key=lambda s: min(s))

    return dict(grouped_equivalents)


def print_equivalents(equivalent_designs: Dict[str, List[Set[int]]]):
    """Prints the equivalent design groups in a compact format."""
    if not equivalent_designs:
        print("\nNo equivalent designs found across any benchmarks.")
        return

    print("\n--- Equivalent Design Report ---")
    found_any = False
    for benchmark, groups in equivalent_designs.items():
        if groups: # Only print benchmarks that have equivalent designs
            found_any = True
            print(f"\nBenchmark: {benchmark}")
            print("-" * (len(benchmark) + 11))
            for group in groups:
                print(f"  - Equivalent Set: {group}")

    if not found_any:
         print("\nNo equivalent designs found across any benchmarks.")
    print("\n--- End of Report ---")


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

    equivalent_designs = find_equivalent_designs(dataset_dir, filtered)
    print_equivalents(equivalent_designs)