import pickle
from pathlib import Path
from collections import defaultdict
from typing import Dict, Optional

import torch
import matplotlib.pyplot as plt
from torch_geometric.data import HeteroData
from sklearn.preprocessing import OneHotEncoder

try:
    from hlsdata import HLSData
    from utils.parsers import parse_tcl_directives_file
except ImportError:
    print("ImportError: Please make sure you have the required packages in your PYTHONPATH")
    pass


NODE_TYPES = [
    "instr", "port", "const", "block", 
    "region", "ap_pragma", "base"
]
EDGE_TYPES = [
    # Edges from the Vitis HLS CDFG
    ("const", "data", "instr"), ("instr", "data", "instr"),
    ("port", "data", "instr"), ("block", "succ", "instr"), 
    ("block", "succ", "block"), ("instr", "mem", "instr"),

    # Edges representing the hierarchy of the CDFG constructs
    ("region", "hrchy", "region"), ("region", "hrchy", "block"),
    ("block", "hrchy", "instr"), 
    
    # Edges representing the call flow of the CDFG
    ("instr", "call", "instr"),

    # Edges representing the array partition directives applied to the CDFG
    ("ap_pragma", "opt", "instr"), ("ap_pragma", "opt", "port"),

    # Edges connecting metrics of the base solution to the nodes
    ("base", "base", "region"), ("base", "base", "block"),
    ("base", "base", "instr"), ("base", "base", "const"),
    ("base", "base", "port"),

    # Self edges
    ("instr", "self", "instr"), ("port", "self", "port"),
    ("const", "self", "const"), ("block", "self", "block"),
    ("region", "self", "region"), ("ap_pragma", "self", "ap_pragma"),
]
NODE_FEATURE_DIMS = {
    "instr": 55, "port": 7, "const": 4, "block": 4, 
    "region": 12, "ap_pragma": 8, "base": 8
}


def build_base_graphs(
    base_solutions: Dict[str, str],
    encoder_save_path: Optional[str] = None,
    filtered: bool = False,
):
    metrics_to_include = {
        "lut", "bram", "ff", "dsp", "achieved_clk", 
        "cc", "dynamic_power", "static_power"
    }
    nodes, edges, features, metrics = {}, {}, {}, {}

    for bench_name, sol_dir in base_solutions.items():
        data = HLSData(sol_dir, filtered=filtered, name=bench_name)
        data.dump(f"{bench_name}_data.json")
        nodes[bench_name] = data.nodes
        edges[bench_name] = data.edges
        metrics[bench_name] = {
            k: v for k, v in data.metrics.items() 
            if k in metrics_to_include
        }
        features[bench_name] = {
            nt: [node.attributes for node in nodes]
            for nt, nodes in data.nodes.items()
        }

    encoders = fit_one_hot_encoders(features)
    if encoder_save_path:
        save_encoders(encoders, encoder_save_path)

    one_hot_encode(features, encoders)
    return nodes, edges, features, metrics


def build_opt_graph(
    base_node_dict, base_edge_dict, base_feature_dict, 
    base_metrics=None, directives_tcl=None, 
    output_hetero_data=True
):
    nodes = base_node_dict.copy()
    edges = base_edge_dict.copy()
    feats = base_feature_dict.copy()

    if base_metrics is not None:
        feats["base"] = [{k: [v] for k, v in base_metrics.items()}]
        for nt, node_list in nodes.items():
            edges[("base", "base", nt)] = [(0, i) for i in range(len(node_list))]

    if directives_tcl is not None:
        feats, edges = include_directive_info(nodes, edges, feats, directives_tcl)
    
    if output_hetero_data:
        return to_hetero_data(feats, edges)
    else:
        return feats, edges


def to_hetero_data(feature_dict, edge_dict, add_self_edges=True):
    data = HeteroData()
    for nt in NODE_TYPES:
        node_list = feature_dict.get(nt, [])
        tensor_list = []
        for node_features in node_list:
            features = []
            for value in node_features.values():
                if isinstance(value, list):
                    features.extend(value)
                else:
                    features.append(value)
            tensor_list.append(torch.tensor(features, dtype=torch.float32))

        if tensor_list:
            data[nt].x = torch.stack(tensor_list, dim=0)
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

    if add_self_edges:
        for nt, nodes in feature_dict.items():
            if nt == "base":
                continue
            src = torch.arange(len(nodes), dtype=torch.long)
            dst = src.clone()
            data[nt, "self", nt].edge_index = torch.stack([src, dst], dim=0)

    return data
            

def include_directive_info(node_dict, edge_dict, feature_dict, directives_tcl):
    def get_node_by_name(nodes, name):
        for node in nodes:
            if node.name == name:
                return node
        return None
    
    available_directives = {
        "pipeline", "unroll", "loop_merge",
        "loop_flatten", "array_partition"
    }
    ap_pragma_count = 0
    feature_dict["ap_pragma"] = []
    edge_dict.update({
        ("ap_pragma", "opt", "instr"): [],
        ("ap_pragma", "opt", "port"): []
    })

    directives = parse_tcl_directives_file(directives_tcl)
    directives = [d for d in directives if d[0] in available_directives]

    for dtype, dargs in directives:
        if dtype == "array_partition":
            var = dargs["variable"]
            node = get_node_by_name(node_dict["instr"], var)
            if node is not None:
                etype = ("ap_pragma", "opt", "instr")
                array_size = node.attributes["storage_depth"]
            elif (node := get_node_by_name(node_dict["port"], var)) is not None:
                etype = ("ap_pragma", "opt", "port")
                array_size = node.attributes["array_size"]
            else:
                print(f"Warning: Variable '{var}' not found in nodes.")
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

            ap_factor = dargs.get("factor")
            if ap_factor is not None:
                ap_factor = [int(ap_factor)]
            else:
                ap_factor = array_size

            feature_dict["ap_pragma"].append({
                "ap_type": ap_type_enc, 
                "ap_dim": dim_enc, 
                "ap_factor": ap_factor
            })
            edge_dict[etype].append((ap_pragma_count, node.id))
            ap_pragma_count += 1
        elif "off" not in dargs:
            loc = dargs["location"].split("/")[-1]
            node = get_node_by_name(node_dict["region"], loc)
            if node is None:
                continue

            node_features = feature_dict["region"][node.id]
        
            if dtype == "unroll":
                node_features["unroll"] = [1]
                factor = int(dargs.get("factor", 0))
                if factor == 0:
                    max_trip_count = node.attributes["max_trip_count"][0]
                    factor = max(max_trip_count, 1)
                node_features["unroll_factor"] = [factor]
            elif dtype == "pipeline":
                ii = int(dargs.get("ii", 1))
                node_features["pipeline"] = [1]
                node_features["ii"] = [ii]
            elif dtype == "loop_flatten":
                node_features["loop_flatten"] = [1]
            else:
                node_features["loop_merge"] = [1]

    return feature_dict, edge_dict


def save_encoders(encoders, path):
    with open(path, 'wb') as f:
        pickle.dump(encoders, f)


def load_encoders(path):
    with open(path, 'rb') as f:
        encoders = pickle.load(f)
    return encoders 


def fit_one_hot_encoders(bench_feature_dict):
    categorical_feats = {
        "core_name": set(), "opcode": set(), "port_type": set(), 
        "direction": set(), "const_type": set()
    }
    encoders = {
        key: OneHotEncoder(handle_unknown='ignore') 
        for key in categorical_feats.keys()
    }
    for feature_dict in bench_feature_dict.values():
        for node_features in feature_dict.values():
            for features in node_features:
                for key in categorical_feats.keys():
                    if key in features:
                        categorical_feats[key].add(features[key])

    for key, values in categorical_feats.items():
        if values:
            encoders[key].fit([[v] for v in values])

    return encoders


def one_hot_encode(bench_feature_dict, encoders):
    for feature_dict in bench_feature_dict.values():
        for node_features in feature_dict.values():
            for features in node_features:
                for key, value in features.items():
                    if key in encoders:
                        encoded = encoders[key].transform([[value]]).toarray()
                        features[key] = encoded[0].flatten().tolist()
                    else:
                        features[key] = [value]


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
        ("const", "data", "instr"): "#2ca02c",
        ("instr", "data", "instr"): "#2ca02c",
        ("port", "data", "instr"): "#2ca02c",

        ("block", "succ", "instr"): "#ff7f0e",
        ("block", "succ", "block"): "#ff7f0e",

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
    
    def plot_subgraph(data, node_types=None, edge_types=None, 
                      use_kamada_kawai=False):
        data_sub = data.clone()
        if node_types:
            for ntype in data_sub.x_dict.keys():
                if ntype not in node_types:
                    data_sub[ntype].x = torch.empty(
                        (0, NODE_FEATURE_DIMS[ntype]), dtype=torch.float32
                    )
        if edge_types:
            for etype in data_sub.edge_index_dict.keys():
                if etype not in edge_types:
                    data_sub[etype].edge_index = torch.empty((2, 0), dtype=torch.long)

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

    # Plot the entire graph
    plot_subgraph(
        data, use_kamada_kawai=True,
        node_types=[nt for nt in NODE_TYPES if nt != "base"],
        edge_types=[e for e in EDGE_TYPES if e[1] != "base" and e[1] != "self"]
    )
    # Plot call flow graph
    plot_subgraph(
        data, node_types=["instr"], 
        edge_types=[e for e in EDGE_TYPES if e[1] == "call"]
    )
    # Plot control flow graph
    plot_subgraph(
        data, node_types=["block"], 
        edge_types=[e for e in EDGE_TYPES if e[1] == "succ"]
    )
    # Plot pragma flow graph
    plot_subgraph(
        data, node_types=["ap_pragma", "instr", "port"], 
        edge_types=[e for e in EDGE_TYPES if e[1] == "opt"]
    )


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
    parser.add_argument("-b", "--benchmark", default=None)
    parser.add_argument("-d", "--directives", default=None)
    args = parser.parse_args()

    base_solutions = {
        Path(sol_dir).parent.name: sol_dir
        for sol_dir in args.solution_dirs
    }
    nodes, edges, feats, metrics = build_base_graphs(base_solutions)

    print("Graphs built successfully.")
    for bench_name, feature_dict in feats.items():
        # print(f"{bench_name}:\n")
        # for i, node_features in enumerate(feature_dict['instr']):
        #     print(f"    Node {i}:")
        #     for key, value in node_features.items():
        #         print(f"      {key}: {value}")
        
        data = to_hetero_data(feature_dict, edges[bench_name])
        print(f"\n{data}")
        # plot_graph(data)

    if args.benchmark and args.directives:
        bench = args.benchmark
        directives = args.directives
        if bench not in base_solutions:
            print(f"Benchmark '{bench}' not found in base solutions.")
            sys.exit(1)

        opt_feats, opt_edges = build_opt_graph(
            nodes[bench], edges[bench], feats[bench],
            base_metrics=metrics[bench], directives_tcl=directives,
            output_hetero_data=False
        )

        for node_features in opt_feats["region"]:
            if node_features["is_loop"][0] == 1:
                print(node_features)

        data = to_hetero_data(opt_feats, opt_edges)
        # plot_graph(data)

    
