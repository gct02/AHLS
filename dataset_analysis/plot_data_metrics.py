import numpy as np
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
import xml.etree.ElementTree as ET
from typing import List, Tuple, Union, Any
from numpy.typing import NDArray
from pathlib import Path
from argparse import ArgumentParser
from utils.parsers import *

def matrix_hamming_distance(
    matrix1: NDArray[Any], 
    matrix2: NDArray[Any]
) -> Union[int, float]:
    return np.sum(matrix1 != matrix2)

def matrix_euclidean_distance(
    matrix1: NDArray[Any], 
    matrix2: NDArray[Any]
) -> float:
    return np.linalg.norm(matrix1 - matrix2)

def group_solutions_by_directives(
    one_hot_directives_list: List[NDArray[Any]],
    num_clusters: int,
    num_iter: int = 100
) -> NDArray[Any]:
    num_solutions = len(one_hot_directives_list)
    centroid_indices = np.random.choice(num_solutions, num_clusters, replace=False)
    centroids = np.array([one_hot_directives_list[i] for i in centroid_indices])

    for k in range(num_iter):
        new_centroids = np.zeros(shape=centroids.shape)
        group_sizes = np.zeros(num_clusters)
        for i in range(num_solutions):
            min_distance = matrix_euclidean_distance(one_hot_directives_list[i], centroids[0])
            group = 0
            for j in range(1, num_clusters):
                distance = matrix_euclidean_distance(one_hot_directives_list[i], centroids[j])
                if distance <= min_distance:
                    min_distance = distance
                    group = j
            new_centroids[group] += one_hot_directives_list[i]
            group_sizes[group] += 1
        for i in range(num_clusters):
            if group_sizes[i] == 0:
                continue
            new_centroids[i] /= group_sizes[i]
        if np.array_equal(centroids, new_centroids):
            print(f'Converged after {k} iterations')
            break
        centroids = new_centroids

    distances = np.array(
        [[matrix_euclidean_distance(one_hot_directives_list[i], centroids[j]) for j in range(num_clusters)] for i in range(num_solutions)]
    )

    return np.argmin(distances, axis=1)

def build_graphs(
    resources_data: pd.DataFrame, 
    bench_name: str, 
    x_data: str, 
    y_data: str, 
    one_hot_directives_list: Union[List[NDArray[Any]], None] = None,
    num_clusters: int = 4,
    output_folder: Union[Path, str] = None,
    directives: bool = False
):
    if directives:
        solution_groups = group_solutions_by_directives(
            one_hot_directives_list,
            num_clusters=num_clusters,
            num_iter=100
        )
        print(solution_groups)
        resources_data['group'] = solution_groups

        colors = ['red', 'blue', 'purple', 'green', 'orange']

        for i in range(num_clusters):
            group_data = resources_data[resources_data['group'] == i]
            plt.scatter(
                group_data[x_data], 
                group_data[y_data], 
                color=colors[i],
            )
    else:
        plt.scatter(resources_data[x_data], resources_data[y_data])
    
    plt.xlabel(x_data)
    plt.ylabel(y_data)
    plt.title(f'{bench_name}: {x_data} x {y_data}')
    plt.grid()

    if output_folder is not None:
        if directives:
            plt.savefig(f'{output_folder}/{bench_name}_{x_data}_{y_data}_{num_clusters}.png')
        else:
            plt.savefig(f'{output_folder}/{bench_name}_{x_data}_{y_data}.png')

    plt.show()

def parse_args():
    parser = ArgumentParser()

    parser.add_argument(
        '-d', '--dataset', 
        help='dataset path', 
        required=True
    )
    parser.add_argument(
        '-b', '--benchmark', 
        help='benchmark name (if not provided, use all benchmarks available)', 
        required=True
    )
    parser.add_argument(
        '-o', '--output', 
        help='Output folder', 
        required=False, default=None
    )
    parser.add_argument(
        '-a', '--available', 
        help='Available directives file', 
        required=False, default=None
    )
    parser.add_argument(
        '-x', '--xdata', 
        help='X axis data', 
        required=False, default='lut'
    )
    parser.add_argument(
        '-y', '--ydata', 
        help='Y axis data',
        required=False, default='estimated_time'
    )
    parser.add_argument(
        '-s', '--seed', 
        help='Random seed for clustering', 
        required=False, default=42
    )
    parser.add_argument(
        '-c', '--clusters', 
        help='Number of clusters', 
        required=False, default=4
    )
    parser.add_argument(
        '-f', '--filtered', 
        help='Sinalize if the dataset is filtered', 
        required=False, action='store_true', default=False
    )
    parser.add_argument(
        '-dr', '--directives', 
        help='Sinalize to plot information about directives', 
        required=False, action='store_true', default=False
    )
    return parser.parse_args()

def main():
    args = parse_args()

    dataset_path = args.dataset
    bench_name = args.benchmark
    available_directives = args.available
    x_data = args.xdata
    y_data = args.ydata
    output = args.output
    clusters = int(args.clusters)
    seed = int(args.seed)
    filtered = args.filtered
    directives = args.directives

    np.random.seed(seed)

    assert Path(f'{dataset_path}/{bench_name}').is_dir()

    if available_directives is not None:
        available_directives = Path(available_directives)
        assert available_directives.exists()

    if output is not None:
        output = Path(output)
        if not output.exists():
            output.mkdir(parents=True)

    if available_directives is not None and directives:
        data, one_hot_directives = organize_data(
            dataset_path, 
            bench_name, 
            available_directives, 
            filtered, directives
        )
        build_graphs(
            data, bench_name, 
            x_data, y_data, 
            one_hot_directives, 
            clusters, 
            output, directives
        )
    else:   
        data = organize_data(
            dataset_path, 
            bench_name, 
            filtered=filtered
        )
        build_graphs(
            data, bench_name, 
            x_data, y_data, 
            output_folder=output
        )

if __name__ == '__main__':
    main()
