import os
import json
from typing import Union, Optional, Tuple, List

import numpy as np
import pandas as pd
from sklearn.cluster import KMeans, AgglomerativeClustering
from sklearn.metrics import silhouette_score, davies_bouldin_score, calinski_harabasz_score
from sklearn.decomposition import PCA
from numpy.typing import NDArray

from gnn.data.utils.parsers import (
    extract_metrics,
    parse_tcl_directives_file,
    _parse_directive_cmd
)


def cluster_by_directive(
    directives: NDArray[np.int_],
    n_clusters: int = 8,
    max_iter: int = 1000,
    cluster_method: str = 'kmeans',
    n_components: Union[int, float] = 0.85,
    metrics: Optional[NDArray[np.float_]] = None
) -> NDArray[np.int_]:
    if directives.ndim > 2:
        directives = directives.reshape(directives.shape[0], -1)

    if metrics is not None:
        # metrics = np.log1p(metrics)
        directives = np.append(directives, metrics, axis=1)

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
    

def parse_and_encode_directives(
    directive_config_json, 
    solution_directives_tcl,
    return_feature_names: bool = False
) -> Union[NDArray[np.int_], Tuple[NDArray[np.int_], List[str]]]:
    def encode_array_partition_info(ap_dir_args=None):
        max_array_size = 2  # On our dataset
        if ap_dir_args is not None:
            factor = int(dir_args.get("factor", 0))
            if factor == 0:
                factor = 64
            dim_idx = int(dir_args.get("dim", 0))
            dim = [0] * (max_array_size + 1)
            dim[dim_idx] = 1
            ap_type = dir_args.get("type", "complete")
            if ap_type == "complete":
                ap_type = [1, 0, 0]
            elif ap_type == "block":
                ap_type = [0, 1, 0]
            else:
                ap_type = [0, 0, 1]
            ap_encoded = [1, factor] + dim + ap_type
        else:
            ap_encoded = [0] * 8
        return ap_encoded
    
    def get_directive_feature_name(dir_type, dir_index):
        if dir_type == "array_partition":
            dir_name = f"ap_{dir_index}"
            return [
                dir_name, f"{dir_name}.factor", 
                f"{dir_name}.d0", f"{dir_name}.d1", f"{dir_name}.d2",
                f"{dir_name}.cmp", f"{dir_name}.blk", f"{dir_name}.cyc"
            ]
        elif dir_type == "unroll":
            dir_name = f"unrl_{dir_index}"
            return [dir_name, f"{dir_name}.factor"]
        elif dir_type == "pipeline":
            return [f"pipe_{dir_index}"]
        elif dir_type == "loop_merge":
            return [f"lm_{dir_index}"]
        elif dir_type == "loop_flatten":
            return [f"lf_{dir_index}"]
        elif dir_type == "dataflow":
            return [f"df_{dir_index}"]
        elif dir_type == "inline":
            return [f"inl_{dir_index}"]
        else:
            return ["unk"]

    if not os.path.exists(solution_directives_tcl):
        raise ValueError(f"Directives file not found: {solution_directives_tcl}")
    if not os.path.exists(directive_config_json):
        raise ValueError(f"Directive configuration file not found: {directive_config_json}")
    
    with open(directive_config_json, "r") as f:
        directives_json = json.load(f)
    
    directives_dict = directives_json.get("directives")
    if directives_dict is None:
        raise ValueError(f"Directives not found in {directive_config_json}")

    available_directives = {
        "pipeline", "unroll", "loop_merge", 
        "loop_flatten", "array_partition", 
        "dataflow", "inline"
    }

    directives = []
    for gp in directives_dict.values():
        if len(gp["possible_directives"]) <= 1:
            continue
        gp_directives = []
        possible_directives = gp["possible_directives"]
        first_directive_cmd = possible_directives[1]
        dir_type, dir_args = _parse_directive_cmd(first_directive_cmd)
        if dir_type not in available_directives:
            continue
        gp_directives.append(dir_args)
        if len(possible_directives) == 1:
            directives.append((dir_type, gp_directives))
            continue
        for directive_cmd in possible_directives[2:]:
            _, dir_args = _parse_directive_cmd(directive_cmd)
            if dir_type in available_directives:
                gp_directives.append(dir_args)
        directives.append((dir_type, gp_directives))

    solution_directives = parse_tcl_directives_file(solution_directives_tcl)
    solution_directives = [
        directive for directive in solution_directives 
        if directive[0] in available_directives
    ]
    directive_indices = {dir_type: 0 for dir_type in available_directives}
    directive_feature_names = []

    encoded_directives = []
    for dir_type, gp_directives in directives:
        directive_encoded = None
        for dir_args in gp_directives:
            for sol_dir_type, sol_dir_args in solution_directives:
                if sol_dir_type == dir_type and sol_dir_args == dir_args:
                    if dir_type == "array_partition":
                        directive_encoded = encode_array_partition_info(dir_args)
                    elif dir_type == "unroll":
                        factor = int(dir_args.get("factor", 0))
                        if factor == 0:
                            factor = 64
                        directive_encoded = [1, factor]
                    elif "off" not in dir_args:
                        directive_encoded = [1]
                    break
            if directive_encoded is not None:
                break
        if directive_encoded is None:
            if dir_type == "array_partition":
                directive_encoded = encode_array_partition_info()
            elif dir_type == "unroll":
                directive_encoded = [0, 0]
            else:
                directive_encoded = [0]
        encoded_directives.extend(directive_encoded)
        directive_feature_names.extend(
            get_directive_feature_name(dir_type, directive_indices[dir_type])
        )
        directive_indices[dir_type] += 1

    if return_feature_names:
        return np.array(encoded_directives, dtype=np.int_), directive_feature_names
    else:
        return np.array(encoded_directives, dtype=np.int_)