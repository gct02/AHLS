import os
import json
from typing import Union, Optional, Tuple, List

import numpy as np
import pandas as pd
from sklearn.cluster import (
    KMeans, 
    AgglomerativeClustering
)
from sklearn.metrics import (
    silhouette_score, 
    davies_bouldin_score, 
    calinski_harabasz_score
)
from sklearn.decomposition import PCA
from numpy.typing import NDArray

from gnn.data.utils.parsers import (
    extract_metrics,
    parse_tcl_directives_file,
    parse_directive_cmd
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
        metrics = np.log1p(metrics)
        directives = np.append(directives, metrics, axis=1)

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
    dct_config_path: Optional[str] = None,
    include_base_solution: bool = False
) -> Tuple[pd.DataFrame, Optional[NDArray[np.int_]]]:
    metrics = []
    directives = [] if dct_config_path else None

    bench_dir = f"{data_dir}/{benchmark}"
    solutions = os.listdir(bench_dir)
    solutions = sorted(solutions, key=lambda s: int(s.split("solution")[1]))

    for sol in solutions:
        if not include_base_solution and sol == 'solution0':
            continue

        sol_dir = os.path.join(bench_dir, sol)
        report = extract_metrics(sol_dir, filtered)
        if report is None:
            continue

        report['benchmark'] = benchmark
        report['solution'] = sol
        metrics.append(report)

        if dct_config_path is not None:
            tcl_path = f'{sol_dir}/directives.tcl'
            directives.append(
                encode_directives(dct_config_path, tcl_path)
            )

    if directives is not None:
        directives = np.stack(directives)

    return pd.DataFrame(metrics), directives
    

def encode_directives(
    dct_config_path, 
    solution_dct_tcl_path,
    return_feature_names: bool = False
) -> Union[NDArray[np.int_], Tuple[NDArray[np.int_], List[str]]]:
    MAX_ARRAY_SIZE = 2  # In our dataset
    DEFAULT_PARTITION_FACTOR = 64
    DEFAULT_UNROLL_FACTOR = 8
    DEFAULT_ARRAY_PARTITION = [0, 0, 0, 0, 0, 0, 0, 0]
    DEFAULT_UNROLL = [0, 0]

    def encode_ap_dct_info(ap_dct_args):
        ap_factor = int(ap_dct_args.get("factor", 0))
        if ap_factor == 0:
            ap_factor = DEFAULT_PARTITION_FACTOR

        ap_dim_idx = int(ap_dct_args.get("dim", 0))
        ap_dim = [0] * (MAX_ARRAY_SIZE + 1)
        ap_dim[ap_dim_idx] = 1

        ap_type = ap_dct_args.get("type", "complete")
        if ap_type == "complete":
            ap_type = [1, 0, 0]
        elif ap_type == "block":
            ap_type = [0, 1, 0]
        else:
            ap_type = [0, 0, 1]

        return [1, ap_factor] + ap_dim + ap_type
    
    def get_dct_feat_name(dct, label):
        dct_id = f"{dct}_{label}"
        if dct == "array_partition":
            return [
                dct_id, f"{dct_id}_factor",
                f"{dct_id}_d0", f"{dct_id}_d1", f"{dct_id}_d2",
                f"{dct_id}_cp", f"{dct_id}_bl", f"{dct_id}_cy"
            ]
        if dct == "unroll":
            return [dct_id, f"{dct_id}_factor"]
        return [dct_id]

    if not os.path.exists(solution_dct_tcl_path):
        raise ValueError(f"Directives file not found: {solution_dct_tcl_path}")
    if not os.path.exists(dct_config_path):
        raise ValueError(f"Directive configuration file not found: {dct_config_path}")
    
    with open(dct_config_path, "r") as f:
        dct_json = json.load(f)
    
    dct_dict = dct_json.get("directives")
    if dct_dict is None:
        raise ValueError(f"Directives not found in {dct_config_path}")

    available_dcts = {
        "pipeline", "unroll", "loop_merge", 
        "loop_flatten", "array_partition", 
        "dataflow", "inline"
    }

    dcts = []
    for group in dct_dict.values():
        possible_dcts = group.get("possible_directives")
        if possible_dcts is None or len(possible_dcts) == 0:
            continue
        group_dcts = []
        first_dct_cmd = possible_dcts[1]
        dct_type, dct_args = parse_directive_cmd(first_dct_cmd)
        if dct_type not in available_dcts:
            continue
        if dct_type == "array_partition":
            label = group.get("variable")
        else:
            label = group.get("label")
            if not label:
                label = group.get("function")
        group_dcts.append(dct_args)
        if len(possible_dcts) == 1:
            dcts.append((dct_type, label, group_dcts))
            continue
        for dct_cmd in possible_dcts[2:]:
            _, dct_args = parse_directive_cmd(dct_cmd)
            if dct_type in available_dcts:
                group_dcts.append(dct_args)
        dcts.append((dct_type, label, group_dcts))

    sol_dcts = parse_tcl_directives_file(solution_dct_tcl_path)
    sol_dcts = [dct for dct in sol_dcts if dct[0] in available_dcts]

    dct_feat_names = []
    encoded_dcts = []
    for dct_type, label, group_dcts in dcts:
        encoded_dct = None
        for dct_args in group_dcts:
            for sol_dct_type, sol_dct_args in sol_dcts:
                if sol_dct_type == dct_type and sol_dct_args == dct_args:
                    if dct_type == "array_partition":
                        encoded_dct = encode_ap_dct_info(dct_args)
                    elif dct_type == "unroll":
                        factor = int(dct_args.get("factor", 0))
                        if factor == 0:
                            factor = DEFAULT_UNROLL_FACTOR
                        encoded_dct = [1, factor]
                    elif "off" not in dct_args:
                        encoded_dct = [1]
                    break
            if encoded_dct is not None:
                break
        if encoded_dct is None:
            if dct_type == "array_partition":
                encoded_dct = DEFAULT_ARRAY_PARTITION
            elif dct_type == "unroll":
                encoded_dct = DEFAULT_UNROLL
            else:
                encoded_dct = [0]
        encoded_dcts.extend(encoded_dct)
        dct_feat_names.extend(get_dct_feat_name(dct_type, label))

    encoded_dcts = np.array(encoded_dcts, dtype=np.int_)
    if return_feature_names:
        return encoded_dcts, dct_feat_names
    return encoded_dcts