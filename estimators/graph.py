import pickle
from pathlib import Path
from copy import deepcopy
from collections import defaultdict
from typing import Dict, Union, Optional

import torch
import matplotlib.pyplot as plt
import torch_geometric.transforms as T
from torch_geometric.data import HeteroData
from sklearn.preprocessing import OneHotEncoder

try:
    from hlsdata import HLSData
    from utils.parsers import parse_tcl_directives_file
except ImportError:
    print("ImportError: Please make sure you have the required packages in your PYTHONPATH")
    pass


NODE_TYPES = ["instr", "port", "const", "block", "region"]

EDGE_TYPES = [
    # Data flow edges
    ("const", "data", "instr"), 
    ("instr", "data", "instr"),
    ("port", "data", "instr"), 

    # Control flow edges
    ("block", "succ", "instr"), 
    ("block", "succ", "block"), 

    # Call flow edges
    ("instr", "call", "instr"),

    # Memory access edges
    ("instr", "mem", "instr"),

    # Hierarchical edges (representing CDFG structure)
    ("region", "hrchy", "region"), 
    ("region", "hrchy", "block"),
    ("block", "hrchy", "instr"),
] + [
    # Self-loops for each node type
    (nt, "to", nt) for nt in NODE_TYPES
]

# Feature dimensions for each node type
NODE_FEATURE_DIMS = {
    "instr": 68, 
    "port": 14, 
    "const": 4, 
    "block": 8, 
    "region": 12
}

def build_base_graphs(
    base_solutions: Dict[str, str],
    filtered: bool = False,
    encoder_output_path: Optional[str] = None,
) -> Dict[str, HLSData]:
    hls_data_dict = {}
    for benchmark, solution_dir in base_solutions.items():
        hls_data_dict[benchmark] = HLSData(
            solution_dir, 
            filtered=filtered, 
            name=benchmark
        )

    encoders = fit_one_hot_encoders(hls_data_dict)
    if encoder_output_path:
        save_encoders(encoders, encoder_output_path)
    
    for benchmark in hls_data_dict:
        one_hot_encode(hls_data_dict[benchmark], encoders)

    return hls_data_dict


def build_opt_graph(
    base_hls_data: HLSData,
    directives_tcl: str, 
    add_self_loops: bool = True,
    output_pyg: bool = True
) -> Union[HeteroData, HLSData]:
    hls_data = deepcopy(base_hls_data)
    include_directives(hls_data, directives_tcl)
    return to_pyg(hls_data, add_self_loops) if output_pyg else hls_data


def to_pyg(
    hls_data: HLSData, 
    add_self_loops: bool = True
) -> HeteroData:
    data = HeteroData()
    
    for nt in NODE_TYPES:
        nodes = hls_data.nodes.get(nt, [])
        features = []
        for node in nodes:
            attrs = []
            for attr in node.attrs.values():
                if isinstance(attr, list):
                    attrs.extend(attr)
                else:
                    attrs.append(attr)

            features.append(torch.tensor(attrs, dtype=torch.float32))

        if features:
            data[nt].x = torch.stack(features, dim=0)
        else:
            data[nt].x = torch.empty((0, NODE_FEATURE_DIMS[nt]), 
                                     dtype=torch.float32)

    for et in EDGE_TYPES:
        edges = hls_data.edges.get(et)
        if edges:
            src, dst = zip(*edges)
            src = torch.tensor(src, dtype=torch.long)
            dst = torch.tensor(dst, dtype=torch.long)
            data[et].edge_index = torch.stack([src, dst], dim=0)
        else:
            data[et].edge_index = torch.empty((2, 0), dtype=torch.long)

    if add_self_loops:
        for nt, nodes in hls_data.nodes.items():
            src = torch.arange(len(nodes), dtype=torch.long)
            dst = src.clone()
            data[nt, "to", nt].edge_index = torch.stack([src, dst], dim=0)

    return data
            

def include_directives(hls_data: HLSData, directives_tcl: str):
    def get_node_by_name(node_type, name):
        for node in hls_data.nodes[node_type]:
            if node.name == name:
                return node
        return None
    
    DIRECTIVES = {
        "pipeline", "unroll", "loop_merge",
        "loop_flatten", "array_partition"
    }
    directives = parse_tcl_directives_file(directives_tcl)
    directives = [d for d in directives if d[0] in DIRECTIVES]

    for directive, args in directives:
        if "off" in args:
            continue

        if directive == "array_partition":
            var = args.get("variable")
            if var is None:
                print("Warning: No variable specified for array partition.")
                continue

            for nt in ["instr", "port"]:
                if (node := get_node_by_name(nt, var)) is not None:
                    break
            else:
                print(f"Warning: Variable '{var}' not found in nodes.")
                continue

            factor = args.get("factor")
            factor = int(factor) if factor else node.attrs["size"]
            dim = [0] * 4
            dim[int(args.get("dim", 0))] = 1
            partition_type = args.get("type", "complete")

            if partition_type == "complete":
                partition_type = [1, 0, 0]
            elif partition_type == "block":
                partition_type = [0, 1, 0]
            else:
                partition_type = [0, 0, 1]

            node.attrs["partition_type"] = partition_type
            node.attrs["partition_factor"] = factor
            node.attrs["partition_dim"] = dim
        else:
            loc = args["location"].split("/")[-1]
            node = get_node_by_name("region", loc)
            if node is None:
                print(f"Warning: Location '{loc}' not found in nodes.")
                continue
        
            if directive == "unroll":
                factor = args.get("factor")
                factor = int(factor) if factor else node.attrs["max_trip_count"]
                node.attrs["unroll_factor"] = factor
            elif directive == "pipeline":
                node.attrs["ii"] = int(args.get("ii", 1))
            
        node.attrs[directive] = 1


def fit_one_hot_encoders(hls_data_dict: Dict[str, HLSData]):
    categorical_attrs = {
        "impl": set(), "opcode": set(), 
        "port_type": set(), "const_type": set()
    }
    encoders = {
        key: OneHotEncoder(handle_unknown='ignore') 
        for key in categorical_attrs.keys()
    }
    for data in hls_data_dict.values():
        for node_groups in data.nodes.values():
            for node in node_groups:
                for key, value in node.attrs.items():
                    if key in categorical_attrs:
                        categorical_attrs[key].add(value)

    for key, values in categorical_attrs.items():
        if values:
            encoders[key].fit([[v] for v in values])

    return encoders


def one_hot_encode(hls_data: HLSData, encoders: Dict[str, OneHotEncoder]):
    for node_groups in hls_data.nodes.values():
        for node in node_groups:
            for key, value in node.attrs.items():
                if key in encoders:
                    encoded = encoders[key].transform([[value]]).toarray()
                    node.attrs[key] = encoded[0].flatten().tolist()
                elif not isinstance(value, list):
                    node.attrs[key] = [value]


def save_encoders(encoders: Dict[str, OneHotEncoder], path: str):
    with open(path, 'wb') as f:
        pickle.dump(encoders, f)


def load_encoders(path: str) -> Dict[str, OneHotEncoder]:
    with open(path, 'rb') as f:
        encoders = pickle.load(f)
    return encoders 
                    

def plot_data(
    data: HeteroData,
    plot_type: Union[str, list] = "full",
    batched: bool = False
):
    import networkx as nx
    from torch_geometric.utils import to_networkx

    node_colors = {
        "instr": "#167dc7",
        "port": "#ff7f0e",
        "const": "#1a9b1a",
        "block": "#d62728",
        "region": "#ac63ce",
    }
    edge_colors = {
        ("const", "data", "instr"): "#3ec08a",
        ("instr", "data", "instr"): "#3ec08a",
        ("port", "data", "instr"): "#3ec08a",
        ("block", "succ", "instr"): "#d4b55d",
        ("block", "succ", "block"): "#d4b55d",
        ("instr", "mem", "instr"): "#c43737",
        ("region", "hrchy", "region"): "#1cbcc7",
        ("region", "hrchy", "block"): "#1cbcc7",
        ("block", "hrchy", "instr"): "#1cbcc7",
        ("instr", "call", "instr"): "#c17add"
    }
    
    def plot(plot_type="full"):
        if plot_type == "full":
            ntypes = etypes = None
        elif plot_type == "call":
            ntypes = ["instr"]
            etypes = [e for e in EDGE_TYPES if e[1] == "call"]
        elif plot_type == "control":
            ntypes = ["instr"]
            etypes = [e for e in EDGE_TYPES if e[1] == "succ"]
        elif plot_type == "data":
            ntypes = ["instr", "const", "port"]
            etypes = [e for e in EDGE_TYPES if e[1] == "data"]
        elif plot_type == "hrchy":
            ntypes = ["region", "block", "instr"]
            etypes = [e for e in EDGE_TYPES if e[1] == "hrchy"]
        else:
            raise ValueError(f"Unknown plot_type: {plot_type}")

        data_cp = data.clone()
        if ntypes:
            if not isinstance(ntypes, list):
                ntypes = [ntypes]
            for nt in data_cp.x_dict.keys():
                if nt not in ntypes:
                    data_cp[nt].x = torch.empty(
                        (0, NODE_FEATURE_DIMS[nt]), dtype=torch.float32
                    )
        if etypes:
            if not isinstance(etypes, list):
                etypes = [etypes]
            for et in data_cp.edge_index_dict.keys():
                if et not in etypes:
                    data_cp[et].edge_index = torch.empty((2, 0), dtype=torch.long)

        data_cp = T.RemoveIsolatedNodes()(data_cp)
        G = to_networkx(data_cp, remove_self_loops=True, node_attrs=['x'])
        
        indices = defaultdict(int)
        ncolors, nlabels = [], {}
        for node, attrs in G.nodes(data=True):
            nt = attrs["type"]
            ncolors.append(node_colors[nt])
            nlabels[node] = f"{nt[0].upper()}{indices[nt]}"
            indices[nt] += 1

        ecolors = []
        for src, dst, attrs in G.edges(data=True):
            ecolor = edge_colors[attrs["type"]]
            ecolors.append(ecolor)
            G.edges[src, dst]["color"] = ecolor

        if plot_type in ["full", "data", "hrchy"] and not batched:
            pos = nx.kamada_kawai_layout(G, scale=2)
        else:
            pos = nx.spring_layout(G, iterations=100, threshold=1e-8, scale=2)

        plt.figure(figsize=(12, 8))
        nx.draw_networkx(
            G, pos, labels=nlabels, node_color=ncolors, 
            edge_color=ecolors, style="dashed", node_size=150, 
            font_size=9, arrowsize=9, width=.8, alpha=.8
        )
        plt.show()

    if isinstance(plot_type, str):
        plot_type = [plot_type]

    for ptype in plot_type:
        plot(ptype)


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
    hls_data_dict = build_base_graphs(base_solutions)

    print("Graphs built successfully.")
    # for benchmark, hls_data in hls_data_dict.items():
    #     print(f"{benchmark}:\n")
    #     for i, node in enumerate(hls_data.nodes['instr']):
    #         print(f"    Node {i}:")
    #         for key, value in node.items():
    #             print(f"      {key}: {value}")

    if args.benchmark and args.directives:
        benchmark = args.benchmark
        directives = args.directives
        if benchmark not in base_solutions:
            print(f"Benchmark '{benchmark}' not found in base solutions.")
            sys.exit(1)

        hls_data = build_opt_graph(
            hls_data_dict[benchmark], 
            directives_tcl=directives,
            output_pyg=False
        )

        # for node in hls_data.nodes["region"]:
        #     if node["is_loop"][0] == 1:
        #         print(node)

        data = to_pyg(hls_data)
        plot_data(data)

    
