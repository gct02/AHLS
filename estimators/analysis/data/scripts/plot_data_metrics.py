import numpy as np
import pandas as pd
import sklearn
import matplotlib.pyplot as plt
from typing import List, Union, Optional, Any
from numpy.typing import NDArray
from pathlib import Path
from argparse import ArgumentParser
from sklearn.cluster import KMeans, AgglomerativeClustering
from sklearn.metrics import silhouette_score
from sklearn.decomposition import PCA

def cluster_solutions_by_directives(
    directive_groups: List[NDArray[Any]],
    n_clusters: int,
    max_iter: int = 100,
    method: str = 'kmeans'
) -> NDArray[Any]:
    
    x = np.array(directive_groups)

    samples, nx, ny = x.shape
    x = x.reshape(samples, nx*ny)

    # scaler = StandardScaler()
    # x_scaled = scaler.fit_transform(x)
    x_scaled = x

    # Choose clustering method
    if method == 'kmeans':
        model = KMeans(n_clusters=n_clusters, max_iter=max_iter, n_init=10)
    elif method == 'agglomerative':
        model = AgglomerativeClustering(n_clusters=n_clusters)
    else:
        raise ValueError(f'Unknown clustering method: {method}')
    
    clusters = model.fit_predict(x_scaled)

    # Calculate silhouette score
    if len(np.unique(clusters)) > 1:
        sil_score = silhouette_score(x_scaled, clusters)
        print(f'Silhouette score: {sil_score:.2f}')

    return clusters

def build_graphs(
    resources_data: pd.DataFrame, 
    bench_name: str, 
    x_data: str, 
    y_data: str, 
    directive_groups: Optional[List[NDArray[Any]]] = None,
    output_dir: Union[Path, str] = None,
    analyse_directives: bool = False,
    n_clusters: int = 4,
    cluster_method: str = 'kmeans',
    dim_reduction: bool = False,
    plot_type: str = 'scatter'
):
    plt.figure(figsize=(12, 8), dpi=150)

    resources_data = resources_data[[x_data, y_data]].copy()
    if analyse_directives and directive_groups is not None:
        if dim_reduction:
            pca = PCA(n_components=2)
            reduced = pca.fit_transform(resources_data)
            resources_data[x_data] = reduced[:, 0]
            resources_data[y_data] = reduced[:, 1]

        clusters = cluster_solutions_by_directives(
            directive_groups, n_clusters, method=cluster_method
        )
        resources_data['cluster'] = clusters

        cmap = plt.get_cmap('viridis')
        colors = [cmap(i / n_clusters) for i in range(n_clusters)]
        
        # Create plot based on type
        if plot_type == 'scatter':
            for i in range(n_clusters):
                cluster_data = resources_data[resources_data['cluster'] == i]
                plt.scatter(
                    cluster_data[x_data], cluster_data[y_data],
                    color=colors[i], label=f'Cluster {i}',
                    edgecolor='w', alpha=0.7, s=100
                )
        elif plot_type == 'hexbin':
            plt.hexbin(
                resources_data[x_data], resources_data[y_data],
                gridsize=20, cmap='viridis', mincnt=1
            )
            plt.colorbar(label='Counts')
        else:
            raise ValueError(f"Unknown plot type: {plot_type}")

        save_cluster_stats(resources_data, output_dir, bench_name)
        
        plt.legend()
    else:
        plt.scatter(
            resources_data[x_data], resources_data[y_data],
            c='blue', alpha=0.5, edgecolor='w'
        )
        
    # Enhanced formatting
    plt.xlabel(x_data.replace('_', ' ').title(), fontsize=12)
    plt.ylabel(y_data.replace('_', ' ').title(), fontsize=12)
    plt.title(
        f'{bench_name}: {x_data} vs {y_data}\n', fontsize=14, pad=20
    )
    plt.grid(alpha=0.3)
    plt.tight_layout()

    # Save output with metadata
    if output_dir:
        output_file = output_dir / f'{bench_name}_{x_data}_{y_data}.png'
        plt.savefig(output_file, bbox_inches='tight', dpi=150)
    else:
        plt.show()
    
    plt.close()


def save_cluster_stats(data: pd.DataFrame, output_dir: Path, bench_name: str):
    """Save cluster statistics and directive profiles"""
    stats = data.groupby('cluster').agg({
        'lut': ['mean', 'std'],
        'time': ['mean', 'std'],
        'cluster': 'size'
    }).rename(columns={'size': 'count'})
    
    stats_file = output_dir / f'{bench_name}_cluster_stats.csv'
    stats.to_csv(stats_file)
    
    # Save directive profiles for each cluster
    if 'directives' in data.columns:
        directive_profiles = (
            data.groupby('cluster')['directives']
            .apply(lambda x: x.value_counts().index[0])
            .reset_index()
        )
        directives_file = output_dir / f'{bench_name}_directive_profiles.csv'
        directive_profiles.to_csv(directives_file, index=False)

if __name__ == '__main__':
    def parse_args():
        parser = ArgumentParser()
        parser.add_argument(
            '-d', '--dataset', required=True,
            help='Dataset directory path'
        )
        parser.add_argument(
            '-b', '--benchmark', required=True,
            help='benchmark name (if not provided, use all benchmarks available)',
        )
        parser.add_argument(
            '-o', '--output', required=False, default=None, 
            help='Output file path', 
        )
        parser.add_argument(
            '-a', '--available', required=False, default=None,
            help='Available directives file path'
        )
        parser.add_argument(
            '-x', '--xdata', required=False, default='lut',
            help='X axis data (default: "lut")'
        )
        parser.add_argument(
            '-y', '--ydata', required=False, default='time',
            help='Y axis data (default: "time")'
        )
        parser.add_argument(
            '-s', '--seed', required=False, default=42,
            help='Random seed for clustering (default: 42)'
        )
        parser.add_argument(
            '-c', '--clusters', required=False, default=4,
            help='Number of clusters to group solutions (default: 4)'
        )
        parser.add_argument(
            '-cm', '--cluster-method', choices=['kmeans', 'agglomerative'], default='kmeans',
            help='Clustering method (default: kmeans)'
        )
        parser.add_argument(
            '-f', '--filtered', required=False, action='store_true', default=False,
            help='Sinalize if the dataset is filtered (default: False)'
        )
        parser.add_argument(
            '-dr', '--directives', required=False, action='store_true', default=False,
            help='Sinalize to plot information about directives (default: False)'
        )
        parser.add_argument(
            '-p', '--plot-type', choices=['scatter', 'hexbin'], default='scatter',
            help='Visualization type (default: scatter)'
        )
        parser.add_argument(
            '-r', '--dim-reduction', action='store_true',
            help='Use PCA for dimensionality reduction'
        )
        return parser.parse_args()

    def main(args):
        import sys

        if __package__ is None:                  
            DIR = Path(__file__).resolve().parent
            sys.path.insert(0, str(DIR.parent))
            sys.path.insert(0, str(DIR.parent.parent))
            __package__ = DIR.name
            
        from utils.parsers import organize_data

        dataset_path = args.dataset
        bench_name = args.benchmark
        directives_file = args.available
        x_data = args.xdata
        y_data = args.ydata
        output = args.output
        is_filtered = args.filtered
        analyse_directives = args.directives
        dim_reduction = args.dim_reduction
        plot_type = args.plot_type
        cluster_method = args.cluster_method
        clusters = int(args.clusters)
        seed = int(args.seed)

        assert Path(f'{dataset_path}/{bench_name}').is_dir()

        np.random.seed(seed)
        sklearn.random.seed(seed)

        if directives_file is not None:
            directives_file = Path(directives_file)
            assert directives_file.exists()

        if output is not None:
            output = Path(output)
            if not output.exists():
                output.mkdir(parents=True)

        if directives_file is not None and analyse_directives:
            data, directive_groups = organize_data(
                dataset_path, bench_name, directives_file, 
                is_filtered, analyse_directives
            )
            build_graphs(
                data, bench_name, x_data, y_data, directive_groups, 
                output, analyse_directives, clusters, cluster_method,
                dim_reduction, plot_type
            )
        else:   
            data = organize_data(
                dataset_path, bench_name, filtered=is_filtered
            )
            build_graphs(
                data, bench_name, x_data, y_data, output_dir=output,
                dim_reduction=dim_reduction, plot_type=plot_type
            )

    args = parse_args()
    main(args)