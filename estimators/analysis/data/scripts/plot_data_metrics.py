import os
import json
from argparse import ArgumentParser
from typing import Optional

import numpy as np
import pandas as pd
import sklearn
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans, AgglomerativeClustering, MeanShift, DBSCAN, OPTICS, AffinityPropagation
from sklearn.metrics import silhouette_score
from sklearn.decomposition import PCA
from numpy.typing import NDArray

try:
    from utils.parsers import collate_data_for_analysis
except ImportError:
    print("ImportError: Please make sure you have the required packages in your PYTHONPATH")
    pass


def cluster_by_directive(
    directives: NDArray[np.int_],
    n_clusters: int,
    max_iter: int = 1000,
    cluster_method: str = 'kmeans',
    n_components: int = 2
) -> NDArray[np.int_]:
    if directives.ndim > 2:
        directives = directives.reshape(directives.shape[0], -1)

    # Perform PCA for dimensionality reduction
    pca = PCA(n_components=n_components)
    directives = pca.fit_transform(directives)

    if cluster_method == 'kmeans':
        model = KMeans(n_clusters=n_clusters, max_iter=max_iter, n_init=20, tol=1e-8)
    elif cluster_method == 'aggl':
        model = AgglomerativeClustering(n_clusters=n_clusters, linkage='complete', compute_full_tree=True)
    elif cluster_method == 'mean_shift':
        model = MeanShift(bandwidth=0.5, bin_seeding=True, max_iter=max_iter)
    elif cluster_method == 'dbscan':
        model = DBSCAN(eps=0.5, min_samples=5)
    elif cluster_method == 'optics':
        model = OPTICS(min_samples=5, max_eps=0.5)
    else:
        raise ValueError(f"Unknown clustering method: {cluster_method}")
    
    clusters = model.fit_predict(directives)

    # Calculate silhouette score
    if len(np.unique(clusters)) > 1:
        sil_score = silhouette_score(directives, clusters)
        print(f'Silhouette score: {sil_score:.2f}')

    return clusters


def generate_metrics_plot(
    metrics: pd.DataFrame,
    benchmark: str,
    x_metric: str,
    y_metric: str, 
    directives: Optional[NDArray[np.int_]] = None,
    directive_config_path: Optional[str] = None,
    output_dir: Optional[str] = None,
    n_clusters: int = 5,
    cluster_method: str = 'kmeans',
    n_components: int = 2,
    plot_type: str = 'scatter'
):
    plt.figure(figsize=(10, 6), dpi=150)

    metrics = metrics.copy()
    metrics[x_metric] = metrics[x_metric].astype(float)
    metrics[y_metric] = metrics[y_metric].astype(float)
    metrics = metrics.dropna(subset=[x_metric, y_metric])
    metrics = metrics[(metrics[x_metric] > 0) & (metrics[y_metric] > 0)]

    if directive_config_path is not None:
        with open(directive_config_path, 'r') as f:
            directive_config = json.load(f)["directives"]
            directive_config = [
                (group_name, group["possible_directives"]) 
                for group_name, group in directive_config.items() 
                if group.get("possible_directives")
            ]

    if directives is not None:
        if len(directives) != len(metrics):
            raise ValueError("Number of directives must match number of metric entries.")
        
        clusters = cluster_by_directive(
            directives, n_clusters, cluster_method=cluster_method, n_components=n_components
        )
        output_file = f'{output_dir}/{benchmark}_{x_metric}_{y_metric}_clusters.json'
        output_data = {"clusters": []}

        n_clusters = len(np.unique(clusters))

        for i in range(n_clusters):
            cluster_directives = directives[clusters == i]
            if len(cluster_directives) == 0:
                continue
            mean_directive = np.mean(cluster_directives, axis=0)
            cluster_info = {"id": i, "groups": []}
            
            for j, directive in enumerate(mean_directive):
                group_name = directive_config[j][0]
                group_directives = directive_config[j][1]
                group_info = {group_name: []}
                for k in range(len(group_directives) - 1):
                    group_info[group_name].append({group_directives[k + 1]: directive[k]})

                cluster_info["groups"].append(group_info)
            
            output_data["clusters"].append(cluster_info)
            
        with open(output_file, 'w') as f:
            json.dump(output_data, f, indent=2)

        if plot_type == 'scatter':
            cmap = plt.get_cmap('viridis')
            colors = cmap(np.linspace(0, 1, n_clusters))
            for i in range(n_clusters):
                cluster_data = metrics.loc[clusters == i]
                # edge color is a more saturated version of the color
                plt.scatter(
                    cluster_data[x_metric], cluster_data[y_metric],
                    color=colors[i], label=f'Cluster {i}',
                    edgecolors="white", linewidth=0.7, alpha=0.6, s=60
                )
        elif plot_type == 'hexbin':
            plt.hexbin(
                metrics[x_metric], metrics[y_metric],
                gridsize=30, cmap='viridis', mincnt=1
            )
            plt.colorbar(label='Counts')
        else:
            raise ValueError(f"Unknown plot type: {plot_type}")
        
        plt.legend()
    else:
        plt.scatter(
            metrics[x_metric], metrics[y_metric], 
            c='blue', alpha=0.5, edgecolors='black', s=80
        )
        
    plt.xlabel(x_metric.replace('_', ' ').title(), fontsize=14)
    plt.ylabel(y_metric.replace('_', ' ').title(), fontsize=14)
    plt.title(f'{benchmark}: {x_metric} vs {y_metric}\n', fontsize=16, pad=20)
    plt.grid(True, linestyle="--", linewidth=0.5, alpha=0.5)
    plt.tight_layout()

    if output_dir:
        output_file = f'{output_dir}/{benchmark}_{x_metric}_{y_metric}.png'
        plt.savefig(output_file, bbox_inches='tight', dpi=150, transparent=True)
    else:
        plt.show()
    
    plt.close()


def parse_args():
    parser = ArgumentParser()
    parser.add_argument('-d', '--dataset-dir', required=True,
                        help='Path to the dataset directory')
    parser.add_argument('-b', '--benchmark-name', required=True,
                        help='The name of the benchmark to analyze')
    parser.add_argument('-o', '--output-dir', required=False, default=None, 
                        help='Path to the output directory')
    parser.add_argument('-dc', '--directive-config', required=False, default=None,
                        help='Path to the file containing the available directive configurations')
    parser.add_argument('-x', '--x-data', required=False, default='lut',
                        help='X axis data (default: "lut")')
    parser.add_argument('-y', '--y-data', required=False, default='time',
                        help='Y axis data (default: "time")')
    parser.add_argument('-s', '--seed', required=False, default=42,
                        help='Random seed for clustering (default: 42)')
    parser.add_argument('-c', '--num-clusters', required=False, default=5,
                        help='Number of clusters to group solutions (default: 5)')
    parser.add_argument('-cm', '--cluster-method', choices=['kmeans', 'aggl', 'mean_shift', 'dbscan', 'optics'], default='kmeans',
                        help='Clustering method (default: kmeans)')
    parser.add_argument('-f', '--filtered', required=False, action='store_true', default=False,
                        help='Sinalize if the dataset is filtered (default: False)')
    parser.add_argument('-p', '--plot-type', choices=['scatter', 'hexbin'], default='scatter',
                        help='Visualization type (default: scatter)')
    parser.add_argument('-pc', '--principal-components', required=False, default=2,
                        help='Number of principal components for PCA (default: 2)')
    return parser.parse_args()


def main(args):
    dataset_dir = args.dataset_dir
    benchmark = args.benchmark_name
    directive_config_path = args.directive_config
    x_data = args.x_data
    y_data = args.y_data
    output_dir = args.output_dir
    filtered = args.filtered
    plot_type = args.plot_type
    cluster_method = args.cluster_method
    n_clusters = int(args.num_clusters)
    seed = int(args.seed)
    principal_components = int(args.principal_components)

    benchmark_path = f'{dataset_dir}/{benchmark}'
    if not os.path.exists(benchmark_path):
        raise FileNotFoundError(f"Benchmark path {benchmark_path} does not exist.")

    np.random.seed(seed)
    sklearn.random.seed(seed)

    if directive_config_path is not None:
        if not os.path.exists(directive_config_path):
            raise FileNotFoundError(
                f"Directive config file {directive_config_path} does not exist."
            )

    if output_dir is not None:
        if not os.path.exists(output_dir):
            os.makedirs(output_dir)

    metrics, directives = collate_data_for_analysis(
        dataset_dir, benchmark, filtered=filtered,
        directive_config_path=directive_config_path
    )
    generate_metrics_plot(
        metrics, benchmark, x_data, y_data, directives=directives,
        output_dir=output_dir, n_clusters=n_clusters, 
        cluster_method=cluster_method, n_components=principal_components,
        plot_type=plot_type, directive_config_path=directive_config_path
    )


if __name__ == '__main__':
    import sys
    from pathlib import Path

    if __package__ is None:                  
        DIR = Path(__file__).resolve().parent
        sys.path.insert(0, str(DIR.parent))
        sys.path.insert(0, str(DIR.parent.parent))
        __package__ = DIR.name 

    from utils.parsers import collate_data_for_analysis
    
    args = parse_args()
    main(args)