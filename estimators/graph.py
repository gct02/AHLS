import pickle
from pathlib import Path
from collections import defaultdict
from typing import Dict, Optional
from math import sqrt

import torch
import matplotlib.pyplot as plt
from torch_geometric.data import HeteroData
from sklearn.preprocessing import OneHotEncoder

try:
    from hlsdata import HLSData, AVAILABLE_METRICS
    from utils.parsers import parse_tcl_directives_file
except ImportError:
    print("ImportError: Please make sure you have the required packages in your PYTHONPATH")
    pass


NODE_TYPES = ["instr", "port", "const", "block", "region", "ap_pragma"]
EDGE_TYPES = [
    ("const" "operand", "instr"), ("instr", "operand", "instr"),
    ("port", "operand", "instr"), ("block", "pred", "instr"), 
    ("block", "pred", "block"), ("instr", "mem", "instr"),
    ("region", "hrchy", "region"), ("region", "hrchy", "block"),
    ("block", "hrchy", "instr"), ("instr", "call", "instr"),
    ("ap_pragma", "opt", "instr"), ("ap_pragma", "opt", "port")
]
NODE_FEATURE_DIMS = {
    "instr": 42, "port": 7, "const": 3,
    "block": 4, "region": 13, "ap_pragma": 8
}

BASE_METRICS_NODE_TYPES = {"base"}
BASE_METRICS_EDGE_TYPES = {
    ("base", "base", "region"), ("base", "base", "block"),
    ("base", "base", "instr"), ("base", "base", "const"),
    ("base", "base", "port"), ("base", "base", "ap_pragma")
}


def build_base_graphs(
    base_solutions: Dict[str, str],
    encoder_save_path: Optional[str] = None,
    filtered: bool = False
):
    nodes, edges, metrics = {}, {}, {}
    for bench_name, sol_dir in base_solutions.items():
        data = HLSData(sol_dir, filtered=filtered, name=bench_name)
        nodes[bench_name] = data.nodes
        edges[bench_name] = data.edges
        metrics[bench_name] = data.metrics

    feats = get_base_features(nodes, normalize=True)

    encoders = fit_one_hot_encoders(feats)
    if encoder_save_path:
        save_encoders(encoders, encoder_save_path)

    one_hot_encode(feats, encoders)
    return nodes, edges, feats, metrics


def build_opt_graph(
    base_nodes, base_edges, base_features, 
    base_metrics=None, directives_tcl=None, 
    target_metric=None, output_hetero_data=False
):
    nodes = base_nodes.copy()
    edges = base_edges.copy()
    feats = base_features.copy()

    if directives_tcl is not None:
        include_directive_info(nodes, edges, feats, directives_tcl)

    if base_metrics is not None:
        if target_metric is None:
            feats["base"] = [[v] for v in base_metrics.values()]
        else:
            feats["base"] = [base_metrics[target_metric]]

        for nt, node_list in nodes.items():
            edges[("base", "base", nt)] = [
                (0, i) for i in range(len(node_list))
            ]
    
    if output_hetero_data:
        return to_hetero_data(feats, edges)
    else:
        return feats, edges


def to_hetero_data(feat_dict, edge_dict):
    data = HeteroData()
    for nt in NODE_TYPES:
        if nt in feat_dict and feat_dict[nt]:
            feat_tensors = []
            for feats in feat_dict[nt]:
                feat_vector = []
                for value in feats.values():
                    if isinstance(value, list):
                        feat_vector.extend(value)
                    else:
                        feat_vector.append(value)
                feat_tensors.append(torch.tensor(feat_vector, dtype=torch.float32))
            data[nt].x = torch.stack(feat_tensors, dim=0)
        else:
            data[nt].x = torch.empty((0, NODE_FEATURE_DIMS[nt]), dtype=torch.float32)

    for et in EDGE_TYPES:
        if et in edge_dict and edge_dict[et]:
            src, dst = zip(*edge_dict[et])
            src = torch.tensor(src, dtype=torch.long)
            dst = torch.tensor(dst, dtype=torch.long)
            data[et].edge_index = torch.stack([src, dst], dim=0)
        else:
            data[et].edge_index = torch.empty((2, 0), dtype=torch.long)

    return data
            

def include_directive_info(nodes, edges, features, directives_tcl):
    def get_node_by_name(nodes, name):
        for node in nodes:
            if node.name == name:
                return node
        return None

    features["ap_pragma"] = []
    edges.update({
        ("ap_pragma", "opt", "instr"): [], 
        ("ap_pragma", "opt", "port"): []
    })
    available_directives = {
        "pipeline", "unroll", "loop_merge",
        "loop_flatten", "array_partition"
    }
    directives = parse_tcl_directives_file(directives_tcl)
    directives = [d for d in directives if d[0] in available_directives]

    for dtype, dargs in directives:
        if dtype == "array_partition":
            var = dargs["variable"]

            node = get_node_by_name(nodes["instr"], var)
            if node is not None:
                etype = ("ap_pragma", "opt", "instr")
                array_size = node.attributes["storage_depth"]
            elif (node := get_node_by_name(nodes["port"], var)) is not None:
                etype = ("ap_pragma", "opt", "port")
                array_size = node.attributes["array_size"]
            else:
                continue

            ap_type = dargs.get("type", "complete")
            if ap_type == "complete":
                ap_type_enc = [1, 0, 0]
            elif ap_type == "block":
                ap_type_enc = [0, 1, 0]
            else:
                ap_type_enc = [0, 0, 1]

            ap_dim = int(dargs.get("dim", "0"))
            dim_enc = [0] * 4
            dim_enc[ap_dim] = 1

            ap_factor = int(dargs.get("factor", array_size))

            features["ap_pragma"].append({
                "ap_type": ap_type_enc, 
                "ap_dim": dim_enc, 
                "ap_factor": [ap_factor]
            })
            edges[etype].append((len(features["ap_pragma"]) - 1, node.id))
        elif "off" not in dargs:
            loc = dargs["location"]

            node = get_node_by_name(nodes["region"], loc)
            if node is None:
                continue
            node_feats = features["region"][node.id]
        
            if dtype == "unroll":
                node_feats["unroll"] = 1
                if "factor" in dargs:
                    node_feats["unroll_factor"] = int(dargs["factor"])
                else:
                    node_feats["unroll_factor"] = node.attributes["max_trip_count"]
            elif dtype == "pipeline":
                node_feats["pipeline"] = 1
            elif dtype == "loop_flatten":
                node_feats["loop_flatten"] = 1
            else:
                node_feats["loop_merge"] = 1


def save_encoders(encoders, path):
    with open(path, 'wb') as f:
        pickle.dump(encoders, f)


def load_encoders(path):
    with open(path, 'rb') as f:
        encoders = pickle.load(f)
    return encoders 


def fit_one_hot_encoders(bench_features_map):
    categorical_feats = {
        "core_name": set(), "opcode": set(),
        "port_type": set(), "direction": set(),
        "const_type": set(), "region_type": set()
    }
    encoders = {
        key: OneHotEncoder(handle_unknown='ignore') 
        for key in categorical_feats.keys()
    }
    for feat_dict in bench_features_map.values():
        for feat_list in feat_dict.values():
            for feats in feat_list:
                for key in categorical_feats.keys():
                    if key in feats:
                        categorical_feats[key].add(feats[key])

    for key, values in categorical_feats.items():
        if values:
            encoders[key].fit([[v] for v in values])

    return encoders


def one_hot_encode(bench_features_map, encoders):
    for feat_dict in bench_features_map.values():
        for feat_list in feat_dict.values():
            for feats in feat_list:
                for key, value in feats.items():
                    if key in encoders:
                        encoded = encoders[key].transform([[value]]).toarray()
                        feats[key] = encoded[0].flatten().tolist()
                    else:
                        feats[key] = [value]


def get_base_features(base_solutions_nodes, normalize=True):
    bench_features_map = {
        bench_name: {
            nt: [node.attributes for node in nodes]
            for nt, nodes in node_dict.items()
        }
        for bench_name, node_dict in base_solutions_nodes.items()
    }
    if normalize:
        feats_to_normalize = {
            "ii", "depth", "delay", "min_trip_count", 
            "max_trip_count", "min_latency", "max_latency", 
            "bitwidth", "array_size", "storage_depth"
        } | AVAILABLE_METRICS
        normalize_features(bench_features_map, feats_to_normalize)
    return bench_features_map


def normalize_features(bench_features_map, feats_to_normalize, eps=1e-6):
    stats = collect_stats(bench_features_map, feats_to_normalize)
    for key, stat in stats.items():
        count = stat["count"]
        if count > 1:
            mean = stat["mean"]
            variance = stat["M2"] / (count - 1)
            std = max(sqrt(variance), eps)
            for node_dict in bench_features_map.values():
                for node_list in node_dict.values():
                    for feats in node_list:
                        if key in feats:
                            feats[key] = (feats[key] - mean) / std


def collect_stats(bench_features_map, stats_filter=None):
    stats = defaultdict(lambda: {"mean": 0.0, "M2": 0.0, "count": 0})
    for node_dict in bench_features_map.values():
        for node_list in node_dict.values():
            for feats in node_list:
                for key, value in feats.items():
                    if stats_filter and key not in stats_filter:
                        continue
                    s = stats[key]
                    s["count"] += 1
                    delta = value - s["mean"]
                    s["mean"] += delta / s["count"]
                    s["M2"] += delta * (value - s["mean"])
    return stats


def plot_graph(data: HeteroData):
    import networkx as nx
    from torch_geometric.utils import to_networkx

    nt_colors = {
        "instr": "#1f77b4",
        "port": "#ff7f0e",
        "const": "#2ca02c",
        "block": "#d62728",
        "region": "#9467bd",
        "ap_pragma": "#8c564b"
    }
    et_colors = {
        ("const", "operand", "instr"): "#2ca02c",
        ("instr", "operand", "instr"): "#2ca02c",
        ("port", "operand", "instr"): "#2ca02c",
        ("block", "pred", "instr"): "#ff7f0e",
        ("block", "pred", "block"): "#ff7f0e",
        ("instr", "mem", "instr"): "#8c564b",
        ("region", "hrchy", "region"): "#1f77b4",
        ("region", "hrchy", "block"): "#1f77b4",
        ("block", "hrchy", "instr"): "#1f77b4",
        ("instr", "call", "instr"): "#b41fa8",
        ("ap_pragma", "opt", "instr"): "#d62728",
        ("ap_pragma", "opt", "port"): "#d62728"
    }
    
    def get_label(nt, index):
        short_nt = nt[0] if nt != "ap_pragma" else "ap"
        return f"{short_nt}{index}"
    
    def plot_subgraph(data_sub, use_kamada_kawai=False):
        G = to_networkx(
            data_sub, remove_self_loops=False,
            to_undirected=False, node_attrs=['x']
        )
        ncolors, nlabels = [], {}
        indices = defaultdict(int)
        for node, attrs in G.nodes(data=True):
            nt = attrs["type"]
            ncolors.append(nt_colors[nt])
            index = indices[nt]
            nlabels[node] = get_label(nt, index)
            indices[nt] += 1

        ecolors = []
        for src, dst, attrs in G.edges(data=True):
            et = attrs["type"]
            ecolor = et_colors[et]
            ecolors.append(ecolor)
            G.edges[src, dst]["color"] = ecolor

        if use_kamada_kawai:
            pos = nx.kamada_kawai_layout(G)
        else:
            pos = nx.spring_layout(G)

        plt.figure(figsize=(12, 8))
        nx.draw_networkx(
            G, pos, with_labels=True, labels=nlabels,
            node_color=ncolors, edge_color=ecolors,
            style="dashed", node_size=150, font_size=8,
            width=0.8, arrowsize=8
        )
        plt.show()

    plot_subgraph(data, use_kamada_kawai=True)

    call_flow = data.clone()

    for etype in call_flow.edge_index_dict.keys():
        if etype[1] != "call":
            call_flow[etype].edge_index = torch.empty((2, 0), dtype=torch.long)

    for ntype in call_flow.x_dict.keys():
        if ntype != "instr":
            call_flow[ntype].x = torch.empty((0, NODE_FEATURE_DIMS[ntype]), dtype=torch.float32)

    plot_subgraph(call_flow, use_kamada_kawai=True)


if __name__ == "__main__":
    import sys

    if __package__ is None:                  
        DIR = Path(__file__).resolve().parent
        sys.path.insert(0, str(DIR.parent))
        sys.path.insert(0, str(DIR.parent.parent))
        __package__ = DIR.name

    from argparse import ArgumentParser
    from utils.parsers import parse_tcl_directives_file
    from estimators.hlsdata import HLSData

    parser = ArgumentParser()
    parser.add_argument("solution_dirs", nargs="+")
    args = parser.parse_args()

    base_solutions = {
        Path(sol_dir).parent.name: sol_dir
        for sol_dir in args.solution_dirs
    }
    nodes, edges, feats = build_base_graphs(base_solutions)
    graphs = {}

    print("Graphs built successfully.")
    for bench_name, feat_dict in feats.items():
        print(f"{bench_name}:\n")
        for i, feats in enumerate(feat_dict['instr']):
            print(f"    Node {i}:")
            for key, value in feats.items():
                print(f"      {key}: {value}")
        
        graphs[bench_name] = to_hetero_data(feat_dict, edges[bench_name])
        print(graphs[bench_name])

    
