import os
import json
from typing import Union, Optional, Tuple

import numpy as np
import pandas as pd
from sklearn.cluster import KMeans, AgglomerativeClustering
from sklearn.metrics import silhouette_score, davies_bouldin_score, calinski_harabasz_score
from sklearn.decomposition import PCA
from numpy.typing import NDArray

from utils.parsers import (
    extract_metrics,
    parse_tcl_directives_file,
    _parse_directive_cmd
)

def cluster_by_directive(
    directives: NDArray[np.int_],
    n_clusters: int = 8,
    max_iter: int = 1000,
    cluster_method: str = 'kmeans',
    n_components: Union[int, float] = 0.85
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
    else:
        raise ValueError(f"Unknown clustering method: {cluster_method}")
    
    clusters = model.fit_predict(directives)

    if len(np.unique(clusters)) > 1:
        sil_score = silhouette_score(directives, clusters)
        print(f'Silhouette score: {sil_score:.2f}')

        db_score = davies_bouldin_score(directives, clusters)
        print(f'Davies-Bouldin score: {db_score:.2f}')

        ch_score = calinski_harabasz_score(directives, clusters)
        print(f'Calinski-Harabasz score: {ch_score:.2f}')

    return clusters


def collate_data_for_analysis(
    data_dir: str, 
    benchmark: str, 
    filtered: bool = False,
    directive_config_path: Optional[str] = None,
    process_base_solution: bool = False
) -> Tuple[pd.DataFrame, Optional[NDArray[np.int_]]]:
    metrics = []
    directives = [] if directive_config_path else None
    bench_dir = f"{data_dir}/{benchmark}"

    solutions = os.listdir(bench_dir)
    solutions = sorted(solutions, key=lambda s: int(s.split("solution")[1]))

    for solution in solutions:
        if not process_base_solution and solution == 'solution0':
            continue
        solution_dir = os.path.join(bench_dir, solution)
        report = extract_metrics(solution_dir, filtered)
        if report is None:
            continue
        report['benchmark'] = benchmark
        report['solution'] = solution
        metrics.append(report)
        if directive_config_path is not None:
            tcl_path = f'{solution_dir}/directives.tcl'
            directives.append(
                parse_and_encode_directives(directive_config_path, tcl_path)
            )
    if directives is not None:
        directives = np.stack(directives)
    metrics = pd.DataFrame(metrics)
    return metrics, directives
    

def parse_and_encode_directives(directive_config_path, tcl_path) -> NDArray[np.int_]:
    if not os.path.exists(tcl_path):
        raise ValueError(f"Directives file not found: {tcl_path}")
    if not os.path.exists(directive_config_path):
        raise ValueError(f"Directive configuration file not found: {directive_config_path}")
    
    with open(directive_config_path, "r") as f:
        directive_groups = json.load(f)

    available_directives = {
        "pipeline", "unroll", "loop_merge", "loop_flatten", "array_partition"
    }
    directives = parse_tcl_directives_file(tcl_path)
    directives = [d for d in directives if d[0] in available_directives]

    directive_configs = []
    for group in directive_groups["directives"].values():
        if len(group["possible_directives"]) <= 1:
            continue
        group_directives = []
        for directive_cmd in group["possible_directives"][1:]:
            dir_type, dir_args = _parse_directive_cmd(directive_cmd)
            if dir_type in available_directives:
                group_directives.append((dir_type, dir_args))
        directive_configs.append(group_directives)

    max_group_size = max(len(group) for group in directive_configs)
    directive_indices = [[0] * max_group_size for _ in range(len(directive_configs))]

    for dir_type, dir_args in directives:
        for i, group in enumerate(directive_configs):
            found = False
            for j, (group_dir_type, group_dir_args) in enumerate(group):
                if group_dir_type == dir_type and group_dir_args == dir_args:
                    directive_indices[i][j] = 1
                    found = True
            if found:
                break

    return np.array(directive_indices, dtype=np.int_)