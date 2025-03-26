import pickle
from pathlib import Path
from collections import defaultdict
from typing import List, Dict, Optional, Union

import torch
import matplotlib.pyplot as plt
from torch_geometric.data import HeteroData
from sklearn.preprocessing import OneHotEncoder

from hlsdata import (
    HLSData, HLSFunctionData,
    RESOURCES_CONSIDERED
)
try:
    from utils.parsers import parse_directive_tcl
except ImportError:
    print("ImportError: Please make sure you have the required packages in your PYTHONPATH")
    pass


NODE_TYPES = ["instr", "port", "const", "block", "region", "ap_pragma"]

EDGE_TYPES = [
    # Edge types in the Vitis HLS CDFG
    ("const" "1", "instr"), ("instr", "1", "instr"), 
    ("port", "1", "instr"), ('port', '1', 'const'),
    ("block", "2", "instr"), ("block", "2", "block"),
    ("instr", "3", "instr"), ("instr", "4", "instr"),

    # Hierarchy edges
    ("region", "hierarchy", "region"), ("region", "hierarchy", "block"),
    ("region", "hierarchy", "instr"), ("block", "hierarchy", "instr"),

    # Call edges
    ("instr", "call", "instr"),

    # Array partition pragma edges
    ("ap_pragma", "opt", "instr"), ("ap_pragma", "opt", "port")
]

NODE_FEATURE_DIMS = {
    "instr": 39,
    "port": 7,
    "const": 3,
    "block": 3,
    "region": 13,
    "ap_pragma": 7
}


def extract_solution_data(solution_dir, filtered=False, bench_name=''):
    data = HLSData(solution_dir, filtered=filtered, name=bench_name)
    nodes = defaultdict({nt: [] for nt in NODE_TYPES})
    edges = defaultdict({et: [] for et in EDGE_TYPES})

    for func in data.function_data.values():
        func_nodes, func_edges = get_function_graph(func)
        for ntype, nlist in func_nodes.items():
            nodes[ntype].extend(nlist)
        for etype, elist in func_edges.items():
            edges[etype].extend(elist)

    edges[('instr', 'call', 'instr')].extend(data.call_edges)

    nodes, edges = reindex(nodes, edges)
    return nodes, edges


def build_opt_graph(
    base_graph, stats, encoders, 
    directives_tcl: Optional[str] = None
):
    ...


def build_base_graphs(
    base_solutions: Dict[str, str],
    encoder_save_path: Optional[str] = None,
    filtered: bool = False
):
    node_dict, edge_dict = {}, {}

    for bench_name, sol_dir in base_solutions.items():
        nodes, edges = extract_solution_data(sol_dir, filtered, bench_name)
        node_dict[bench_name] = nodes
        edge_dict[bench_name] = edges

    feat_dict, stats = get_node_features(node_dict, normalize=True)

    graphs = {}
    for bench_name, (feats, edges) in zip(feat_dict.items(), edge_dict.items()):
        graphs[bench_name] = (feats, edges)

    encoders = fit_one_hot_encoders(graphs)
    for _, _, feats in graphs.values():
        encode_one_hot(feats, encoders)

    if encoder_save_path is not None:
        save_encoders(encoders, encoder_save_path)

    return graphs, stats, encoders

    # graphs = []
    # for node_features, edges in zip(node_feature_lists, edge_lists):
    #     data = HeteroData()
    #     encode_one_hot(node_features, encoders)

    #     for node_type, features in node_features.items():
    #         feature_tensor_list = []
    #         for feature in features:
    #             feature_tensor = []
    #             for value in feature.values():
    #                 feature_tensor.extend(value)
    #             feature_tensor = torch.tensor(feature_tensor, dtype=torch.float32)
    #             feature_tensor_list.append(feature_tensor)

    #         if len(feature_tensor_list) > 0:
    #             data[node_type].x = torch.stack(feature_tensor_list)
    #         else:
    #             data[node_type].x = torch.empty((0, NODE_FEATURE_DIMS[node_type]),
    #                                             dtype=torch.float32)

    #     for edge_type, edge_list in edges.items():
    #         if len(edge_list) > 0:
    #             src, dst = zip(*edge_list)
    #             src = torch.tensor(src, dtype=torch.long)
    #             dst = torch.tensor(dst, dtype=torch.long)
    #             data[edge_type].edge_index = torch.stack([src, dst], dim=0)
    #         else:
    #             data[edge_type].edge_index = torch.empty((2, 0), dtype=torch.long)

    #     graphs.append(data)


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
        ("const", "1", "instr"): "#2ca02c",
        ("instr", "1", "instr"): "#2ca02c",
        ("port", "1", "instr"): "#2ca02c",
        ('port', '1', 'const'): "#2ca02c",
        ("block", "2", "instr"): "#ff7f0e",
        ("block", "2", "block"): "#ff7f0e",
        ("instr", "3", "instr"): "#535353",
        ("instr", "4", "instr"): "#9467bd",
        ("region", "hierarchy", "region"): "#1f77b4",
        ("region", "hierarchy", "block"): "#1f77b4",
        ("region", "hierarchy", "instr"): "#1f77b4",
        ("block", "hierarchy", "instr"): "#1f77b4",
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
        indices = {nt: 0 for nt in data_sub.x_dict.keys()}
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


def _get_node_by_name(nodes, name):
    for node in nodes:
        if node.name == name:
            return node
    return None


def include_directive_info(nodes, edges, directives_tcl):
    import os
    
    ap_node_features = []    
    edges.update({
        ("ap_pragma", "opt", "instr"): [],
        ("ap_pragma", "opt", "port"): [],
    })

    if directives_tcl is None \
        or not os.path.exists(directives_tcl):
        return nodes, edges, ap_node_features
    
    supported_directives = [
        "pipeline", "unroll", "loop_merge", 
        "loop_flatten", "array_partition"
    ]
    directives = parse_directive_tcl(directives_tcl)
    directives = [d for d in directives if d[0] in supported_directives]

    for dtype, dargs in directives:
        loc = dargs["location"]

        if dtype == "array_partition":
            node = _get_node_by_name(nodes["instr"], loc)
            if node is not None:
                etype = ("ap_pragma", "opt", "instr")
            elif (node := _get_node_by_name(nodes["port"], loc)) is not None:
                etype = ("ap_pragma", "opt", "port")
            else:
                continue

            if "factor" not in dargs:
                ap_factor = node.resources.get("(0Words)", 0)
            else:
                ap_factor = int(dargs["factor"])

            ap_node_features.append({
                "ap_type": dargs.get("type", "complete"),
                "ap_dim": dargs.get("dim", "0"),
                "ap_factor": ap_factor
            })
            edges[etype].append((len(ap_node_features) - 1, node.id))
        elif "off" not in dargs:
            node = _get_node_by_name(nodes["region"], loc)
            if node is None:
                continue
            
            if dtype == "pipeline":
                node.pipeline = 1
                if "ii" in dargs:
                    node.ii = int(dargs["ii"])
            elif dtype == "unroll":
                node.unroll = 1
                if "factor" in dargs:
                    node.unroll_factor = int(dargs["factor"])
                elif node.max_trip_count > 0:
                    node.unroll_factor = node.max_trip_count
                else:
                    node.unroll_factor = 0
            elif dtype == "loop_flatten":
                node.loop_flatten = 1
            else:
                node.loop_merge = 1

    return nodes, edges, ap_node_features
            
            
def save_encoders(encoders, path):
    with open(path, 'wb') as f:
        pickle.dump(encoders, f)


def load_encoders(path):
    with open(path, 'rb') as f:
        encoders = pickle.load(f)
    return encoders 


def fit_one_hot_encoders(graphs):
    categorical_feats = {
        "impl": set(), "core": set(), "opcode": set(),
        "port_type": set(), "direction": set(),
        "const_type": set(), "region_type": set()
    }
    one_hot_encoders = {
        key: OneHotEncoder(handle_unknown='ignore') 
        for key in categorical_feats.keys()
    }

    for _, _, feat_dict in graphs.values():
        for feat_list in feat_dict.values():
            for feats in feat_list:
                for key in categorical_feats.keys():
                    if key in feats:
                        categorical_feats[key].add(feats[key])

    for key, values in categorical_feats.items():
        if not values:
            continue
        values = [[v] for v in values]
        one_hot_encoders[key].fit(values)

    return one_hot_encoders


def get_function_graph(hls_function_data: HLSFunctionData):    
    def get_node(nodes, id):
        for ndict in nodes.values():
            for node in ndict.values():
                if node.id == id:
                    return node
        return None
        
    cdfg = hls_function_data.cdfg
    nodes = {
        "instr": cdfg.instr_nodes,
        "port": cdfg.port_nodes,
        "const": cdfg.const_nodes,
        "block": cdfg.block_nodes,
        "region": cdfg.region_nodes
    }
    edges = defaultdict(list)

    type_map = {
        0: "instr", 1: "port", 2: "const", 3: "block"
    }
    
    for edge in cdfg.edges.values():
        src_node = get_node(nodes, edge.src)
        if src_node is None:
            continue
        src_type = type_map[src_node.type]

        dst_node = get_node(nodes, edge.dst)
        if dst_node is None:
            continue
        dst_type = type_map[dst_node.type]

        edge_type = (src_type, str(edge.type), dst_type)
        edges[edge_type].append((src_node.id, dst_node.id))

    edges.update(cdfg.region_edges)
    nodes = {nt: list(ndict.values()) 
             for nt, ndict in nodes.items()}

    # Remove consts that represents called functions
    func_consts = _collect_consts_with_type(cdfg, 6)
    if len(func_consts) > 0:
        nodes, edges = trim_nodes(
            nodes, edges, func_consts, 
            reconnect_edges=False
        )

    ops_to_trim = ["trunc", "sext", "zext"]
    for op in ops_to_trim:
        instrs = _collect_instrs_with_opcode(cdfg, op)
        if len(instrs) > 0:
            nodes, edges = trim_nodes(nodes, edges, instrs)

    return nodes, edges


def trim_nodes(nodes, edges, nodes_to_trim, reconnect_edges=True):
    for ntype, nlist in nodes.items():
        nodes[ntype] = [n for n in nlist if n.id not in nodes_to_trim]

    if reconnect_edges:
        for trimmed_id in nodes_to_trim:
            in_edges, out_edges = [], []  # Edges to and from the pruned node
            for etype, elist in edges.items():
                for src, dst in elist:
                    if src == trimmed_id:
                        out_edges.append((etype, src, dst))
                    if dst == trimmed_id:
                        in_edges.append((etype, src, dst))

            for in_etype, src, _ in in_edges:
                for out_etype, _, dst in out_edges:
                    if in_etype[0] == "block" or in_etype[0] == "region":
                        rel = in_etype[1]
                    else:
                        rel = out_etype[1]
                    edges[(in_etype[0], rel, out_etype[2])].append((src, dst))

    for etype, elist in edges.items():
        edges[etype] = [e for e in elist if e[0] not in nodes_to_trim 
                        and e[1] not in nodes_to_trim]

    return nodes, edges


def get_node_features(nodes, normalize=True, pre_computed_stats=None):
    from decimal import Decimal, getcontext
    from math import sqrt

    node_features = defaultdict(list)

    if normalize:
        getcontext().prec = 100

        continuous_feats = {
            "ii", "depth", "delay", "min_trip_count", "max_trip_count",
            "min_latency", "max_latency", "bitwidth", "array_size", 
            "storage_depth"
        } | RESOURCES_CONSIDERED

        # Features that are not always available
        inconsistent_feats = [
            "ii", "min_trip_count", "max_trip_count", 
            "min_latency", "max_latency", "unroll_factor"
        ]
        if pre_computed_stats is not None:
            stats = pre_computed_stats
        else:
            stats = defaultdict(
                lambda: {"mean": Decimal(0), "M2": Decimal(0), "count": 0}
            )

    for ntype, nlist in nodes.items():
        for node in nlist:
            if ntype == "region":
                features = {
                    "region_type": node.region_type,
                    "ii": max(node.ii, 0),
                    "depth": max(node.depth, 0),
                    "min_trip_count": max(node.min_trip_count, 0),
                    "max_trip_count": max(node.max_trip_count, 0),
                    "min_latency": max(node.min_latency, 0),
                    "max_latency": max(node.max_latency, 0),
                    "pipeline": node.pipeline,
                    "unroll": node.unroll,
                    "loop_flatten": node.loop_flatten,
                    "loop_merge": node.loop_merge,
                    "unroll_factor": node.unroll_factor
                }
            else:
                if ntype == "instr":
                    features = {
                        "bitwidth": node.bitwidth,
                        "opcode": node.opcode,
                        "critical": node.is_on_critical_path,
                        "core": node.core if node.core is not None else "",
                        "delay": node.delay,
                        "array_size": node.storage_depth,
                        "ff": node.resources.get("FF", 0),
                        "lut": node.resources.get("LUT", 0),
                        "bram": node.resources.get("BRAM", 0),
                        "dsp": node.resources.get("DSP", 0),
                    }
                elif ntype == "port":
                    features = {
                        "bitwidth": node.bitwidth,
                        "port_type": node.port_type,
                        "direction": node.direction,
                        "array_size": node.array_size
                    }
                elif ntype == "const":
                    features = {
                        "bitwidth": node.bitwidth,
                        "const_type": node.const_type,
                    }
                elif ntype == "block":
                    features = {
                        "ff": node.resources.get("FF", 0),
                        "lut": node.resources.get("LUT", 0),
                        "dsp": node.resources.get("DSP", 0),
                    }

            if normalize and pre_computed_stats is None:
                for key, value in features.items():
                    if key in continuous_feats and isinstance(value, (int, float)):
                        if key in inconsistent_feats and value < 1:
                            # Zero values in these features can indicate two things:
                            # 1. The actual value is zero
                            # 2. The value is not available (i.e., it could not be computed)
                            # Since we cannot distinguish between these two cases, we will
                            # not include zero values in the normalization process.
                            continue

                        value = Decimal(value)
                        s = stats[key]

                        # Welford’s algorithm for numerical stability
                        s["count"] += 1
                        delta = value - s["mean"]
                        s["mean"] += delta / s["count"]
                        s["M2"] += delta * (value - s["mean"])

            node_features[ntype].append(features)

    if normalize:
        for key, stat in stats.items():
            count = stat["count"]
            if count > 1:
                mean = stat["mean"]
                variance = stat["M2"] / (count - 1)

                # Ensure no division by zero
                std = Decimal(max(sqrt(variance), Decimal("1e-8")))

                # Normalize the features
                for features in node_features.values():
                    for feature in features:
                        if key in feature:
                            feature[key] = float((Decimal(feature[key]) - mean) / std)

    if pre_computed_stats is not None or not normalize:
        return node_features
    
    return node_features, stats


def reindex(nodes, edges):
    id_map_dict = {nt: {} for nt in nodes.keys()}

    for ntype, nlist in nodes.items():
        id_map = {}
        for i in range(len(nlist)):
            id_map[nlist[i].id] = i
            nlist[i].id = i
        id_map_dict[ntype] = id_map

    for etype, elist in edges.items():
        for i in range(len(elist)):
            src = id_map_dict[etype[0]][src]
            dst = id_map_dict[etype[2]][dst]
            elist[i] = (src, dst)

    return nodes, edges


def encode_one_hot(node_features_dict, one_hot_encoders):
    for feat_list in node_features_dict.values():
        for feats in feat_list:
            for key, value in feats.items():
                if key in one_hot_encoders:
                    encoded = one_hot_encoders[key].transform([[value]]).toarray()
                    feats[key] = encoded[0].flatten().tolist()
                else:
                    feats[key] = [value]


def _collect_instrs_with_opcode(cdfg, opcode):
    instrs = []
    for node in cdfg.instr_nodes.values():
        if node.opcode == opcode:
            instrs.append(node.id)
    return instrs


def _collect_consts_with_type(cdfg, const_type):
    consts = []
    for node in cdfg.const_nodes.values():
        if node.const_type == const_type:
            consts.append(node.id)
    return consts


if __name__ == "__main__":
    import sys

    if __package__ is None:                  
        DIR = Path(__file__).resolve().parent
        sys.path.insert(0, str(DIR.parent))
        sys.path.insert(0, str(DIR.parent.parent))
        __package__ = DIR.name

    from argparse import ArgumentParser

    parser = ArgumentParser()
    parser.add_argument("solution_dirs", nargs="+")
    args = parser.parse_args()

    graphs = build_base_graphs(args.solution_dirs)

    for i, graph in enumerate(graphs):
        plot_graph(graph)
        print(f"Graph {i}")
        print(graph)
        print()
