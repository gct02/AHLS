import os
import pickle
from copy import deepcopy
from typing import Dict, Union, Optional, List, Tuple

import torch
import matplotlib.pyplot as plt
from torch_geometric.data import HeteroData
from sklearn.preprocessing import OneHotEncoder

from gnn.data.hls_data_collector import HLSData
from gnn.data.utils.parsers import parse_tcl_directives_file


NODE_TYPES = [
    "instr", "port", "array", 
    "const", "block", "region"
]

EDGE_TYPES = [
    # Data flow edges
    ("const", "data", "instr"), 
    ("instr", "data", "instr"),
    ("port", "data", "instr"), 
    ("array", "data", "instr"),

    # Control flow edges
    ("block", "control", "instr"), 
    ("block", "control", "block"), 

    # Call flow edges
    ("instr", "call", "instr"),

    # Memory edges (load->store)
    ("instr", "mem", "instr"),

    # Array memory allocation edges
    ("instr", "alloca", "array"),

    # Hierarchical edges (representing CDFG structure)
    ("region", "hrchy", "region"), 
    ("region", "hrchy", "block"),
    ("region", "hrchy", "instr"),
    ("block", "hrchy", "instr"),

    # Reversed hierarchical edges
    ("region", "hrchy_rev", "region"),
    ("block", "hrchy_rev", "region"),
    ("instr", "hrchy_rev", "region"),
    ("instr", "hrchy_rev", "block"),
] + [
    # Self-loops
    (nt, "to", nt) for nt in NODE_TYPES
]

# Feature dimensions for each node type
NODE_FEATURE_DIMS = {
    "instr": 75, 
    "port": 16, 
    "array": 26,
    "const": 5,
    "block": 7,
    "region": 12
}

DIRECTIVES = [
    "unroll", "pipeline", "loop_merge", 
    "loop_flatten", "array_partition",
    "dataflow", "inline"
]


def build_base_graphs(
    base_solutions: List[Tuple[str, str, str]],
    filtered: bool = False,
    encoder_output_path: Optional[str] = None,
) -> Dict[str, HLSData]:
    hls_data_dict = {}
    for solution_dir, benchmark, top_level_name in base_solutions:
        if filtered:
            metadata_path = f"{solution_dir}/IRs/metadata.json"
        else:
            metadata_path = f"{solution_dir}/.autopilot/db/metadata.json"
        if not os.path.exists(metadata_path):
            raise FileNotFoundError(f"Metadata file not found: {metadata_path}")

        hls_data_dict[benchmark] = HLSData(
            solution_dir, top_level_name, 
            metadata_path, benchmark,
            filtered=filtered
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
    output_pyg: bool = True,
    add_self_loops: bool = True,
    add_reversed_edges: bool = True
) -> Union[HeteroData, HLSData]:
    hls_data = deepcopy(base_hls_data)
    include_directives(hls_data, directives_tcl)
    if output_pyg:
        return to_pyg(
            hls_data, 
            add_self_loops=add_self_loops,
            add_reversed_edges=add_reversed_edges
        )
    return hls_data


def to_pyg(
    hls_data: HLSData, 
    add_self_loops: bool = True,
    add_reversed_edges: bool = True
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
            data[nt].x = torch.empty((0, NODE_FEATURE_DIMS[nt]), dtype=torch.float32)

        data[nt].label = [node.label for node in nodes]

    for et in EDGE_TYPES:
        edges = hls_data.edges.get(et)
        if edges:
            src, dst = zip(*edges)
            src = torch.tensor(src, dtype=torch.long)
            dst = torch.tensor(dst, dtype=torch.long)
            data[et].edge_index = torch.stack([src, dst], dim=0)
        else:
            data[et].edge_index = torch.empty((2, 0), dtype=torch.long)

    if add_reversed_edges:
        hrchy_edges = {k: v for k, v in data.edge_index_dict.items() if k[1] == "hrchy"}
        for et, edge_index in hrchy_edges.items():
            if edge_index.size(1) == 0:
                data[et[2], "hrchy_rev", et[0]].edge_index = torch.empty((2, 0), dtype=torch.long)
            else:
                src, dst = edge_index[0], edge_index[1]
                data[et[2], "hrchy_rev", et[0]].edge_index = torch.stack([dst, src], dim=0)

    if add_self_loops:
        for nt in NODE_TYPES:
            nodes = hls_data.nodes.get(nt)
            if nodes:
                src = torch.arange(len(nodes), dtype=torch.long)
                dst = src.clone()
                data[nt, "to", nt].edge_index = torch.stack([src, dst], dim=0)
            else:
                data[nt, "to", nt].edge_index = torch.empty((2, 0), dtype=torch.long)

    return data


def find_node(
    hls_data, types_to_search, 
    node_name, function_name,
    match_function_only: bool = False
):
    if not isinstance(types_to_search, list):
        types_to_search = [types_to_search]
    for node_type in types_to_search:
        for node in hls_data.nodes[node_type]:
            if node.function_name == function_name:
                if match_function_only:
                    return node
                if node.name == node_name:
                    return node
    return None


def include_directives(hls_data: HLSData, directives_tcl: str):
    def unroll_subloops(subregs):
        for subreg_id in subregs:
            subreg = hls_data.nodes["region"][subreg_id]
            max_tc = subreg.attrs["max_trip_count"]
            if subreg.is_loop:
                subreg.attrs["unroll"] = 1
                subreg.attrs["unroll_factor"] = max_tc
            unroll_subloops(subreg.sub_regions)

    directives = parse_tcl_directives_file(directives_tcl)
    directives = [d for d in directives if d[0] in DIRECTIVES]

    # Sort by directive type 
    # (array_partition -> loop_flatten -> loop_merge -> pipeline -> unroll)
    directives.sort(key=lambda x: (
        x[0] == "array_partition",
        x[0] == "loop_flatten",
        x[0] == "loop_merge",
        x[0] == "pipeline",
        x[0] == "unroll"
    ))

    for directive_type, directive_args in directives:
        if directive_type == "array_partition":
            node_name = directive_args.get("variable")
            function_name = directive_args.get("location")
            if node_name is None:
                print("Warning: No variable specified for array partition.")
                continue
            if function_name is None:
                print("Warning: No function name specified for array partition.")
                continue

            node = find_node(hls_data, "array", node_name, function_name)
            if node is None:
                print(f"Warning: Variable '{node_name}' not found in nodes.")
                continue
            
            total_array_size = node.attrs["total_size"]
            array_impl = node.attrs["array_impl"]

            factor = int(directive_args.get("factor", 0))
            if factor > total_array_size:
                print(f"Warning: Partition factor {factor} exceeds array size {total_array_size}.")
                continue
            elif factor <= 0:
                factor = total_array_size

            partition_size = total_array_size // factor
            if partition_size <= 1024 and array_impl[1] == 1: 
                # BRAM/LUTRAM/URAM -> shift register
                node.attrs["array_impl"] = [0, 0, 1]

            dim = [0] * 4
            dim[int(directive_args.get("dim", 0))] = 1
            partition_type = directive_args.get("type", "complete")

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
            location = directive_args["location"]
            if "/" in location:
                match_function_only = False
                function_name, node_name = location.split("/")
            else:
                match_function_only = True
                function_name = location
                node_name = location

            node = find_node(hls_data, "region", node_name, 
                             function_name, match_function_only)
            if node is None:
                print(f"Warning: Region '{location}' not found in nodes.")
                continue
        
            if directive_type == "unroll":
                factor = int(directive_args.get("factor", 0))
                factor = factor if factor > 0 else node.attrs.get("max_trip_count", 1)
                node.attrs['unroll'] = 1
                node.attrs["unroll_factor"] = factor
            elif directive_type == "pipeline":
                if "off" in directive_args:
                    node.attrs["pipeline_off"] = 1
                else:
                    ii = max(1, int(directive_args.get("ii", 1)))
                    if "ii" in node.attrs: # Check if it is a Region
                        node.attrs["ii"] = ii
                        node.attrs["min_latency"] = ii * node.attrs["min_trip_count"]
                        node.attrs["max_latency"] = ii * node.attrs["max_trip_count"]
                        node.attrs["pipeline"] = 1

                    # Pipeline in a loop induces a complete unroll in all of 
                    # its (bounded) subloops
                    unroll_subloops(node.sub_regions, node.blocks)
            elif directive_type == "loop_flatten" and "off" in directive_args:
                node.attrs["loop_flatten_off"] = 1
            else:
                node.attrs[directive_type] = 1


def fit_one_hot_encoders(hls_data_dict: Dict[str, HLSData]):
    categorical_attrs = {
        "impl": set(), "opcode": set(), "port_type": set(), 
        "const_type": set(), "base_type": set()
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
    from matplotlib.lines import Line2D
    from matplotlib.patches import Patch

    node_colors = {
        "instr": "#419ada",
        "port": "#1ecf89",
        "array": "#ec3c94",
        "const": "#aa6df0",
        "block": "#c9a24e",
        "region": "#d84c4c",
    }
    edge_colors = {
        ("const", "data", "instr"): "#5fdde0",
        ("instr", "data", "instr"): "#00bcd4",
        ("port", "data", "instr"): "#00a1b3",
        ("array", "data", "instr"): "#008c9e",
        ("region", "control", "instr"): "#ddb753",
        ("region", "control", "region"): "#ddb753",
        ("instr", "mem", "instr"): "#e73939",
        ("instr", "alloca", "array"): "#824ac2",
        ("region", "hrchy", "region"): "#aab2b9",
        ("region", "hrchy", "instr"): "#aab2b9",
        ("instr", "call", "instr"): "#ba68c8"
    }
    
    def plot(plot_type="full"):
        if plot_type == "full":
            ntypes = node_colors.keys()
            etypes = edge_colors.keys()
        elif plot_type == "call":
            ntypes = ["instr"]
            etypes = [et for et in EDGE_TYPES if et[1] == "call"]
        elif plot_type == "control":
            ntypes = ["block", "instr"]
            etypes = [et for et in EDGE_TYPES if et[1] in ["control"] and et[2] == "block"]
        elif plot_type == "data":
            ntypes = ["instr", "const", "port", "array"]
            etypes = [et for et in EDGE_TYPES if et[1] in ["data", "mem", "alloca"]]
        elif plot_type == "mem":
            ntypes = ["instr", "array"]
            etypes = [et for et in EDGE_TYPES if et[1] in ["mem", "alloca"]]
        elif plot_type == "hrchy":
            ntypes = ["instr", "block", "region"]
            etypes = [et for et in EDGE_TYPES if et[1] == "hrchy"]
        else:
            raise ValueError(f"Unknown plot_type: {plot_type}")

        data_trans = HeteroData()
        for nt, x in data.x_dict.items():
            if nt not in ntypes:
                data_trans[nt].x = torch.empty((0, NODE_FEATURE_DIMS[nt]), dtype=torch.float32)
            else:
                data_trans[nt].x = x
            data_trans[nt].label = data[nt].label

        for et, edge_index in data.edge_index_dict.items():
            if et not in etypes:
                data_trans[et].edge_index = torch.empty((2, 0), dtype=torch.long)
            else:
                data_trans[et].edge_index = edge_index

        G = to_networkx(data_trans, remove_self_loops=True, node_attrs=['x', 'label'])
        
        ncolors, nlabels = [], {}
        for node, attrs in G.nodes(data=True):
            nt = attrs.get("type")
            if nt is None:
                continue
            ncolors.append(node_colors[nt])
            nlabels[node] = attrs["label"]

        ecolors = []
        for src, dst, attrs in G.edges(data=True):
            et = attrs.get("type")
            if et is None:
                continue
            ecolor = edge_colors[et]
            ecolors.append(ecolor)
            G.edges[src, dst]["color"] = ecolor

        node_legend = [Patch(color=color, label=nt) for nt, color in node_colors.items()]
        edge_legend = [
            Line2D([0], [0], color=color, lw=2, label=f"{et[1]}: {et[0]}→{et[2]}")
            for et, color in edge_colors.items() if et in etypes
        ]

        if plot_type in ["full", "data", "hrchy"] and not batched:
            pos = nx.kamada_kawai_layout(G, scale=2)
        elif plot_type in ["mem", "call"]:
            pos = nx.planar_layout(G, scale=2)
        else:
            pos = nx.spring_layout(G, scale=2)

        plt.figure(figsize=(12, 8))
        nx.draw_networkx(
            G, pos, labels=nlabels, node_color=ncolors, 
            edge_color=ecolors, style="dashed", node_size=150, 
            font_size=8, arrowsize=9, width=.8, alpha=.8
        )
        plt.legend(
            handles=node_legend + edge_legend, loc='lower center', 
            bbox_to_anchor=(0.5, -0.1), ncol=3, fontsize=8, frameon=False
        )
        plt.show()

    if isinstance(plot_type, str):
        plot_type = [plot_type]

    for ptype in plot_type:
        plot(ptype)


if __name__ == "__main__":
    from argparse import ArgumentParser

    parser = ArgumentParser()
    parser.add_argument("base_solution_dir", nargs=1, type=str)
    parser.add_argument("-b", "--benchmark")
    parser.add_argument("-t", "--top-level")
    parser.add_argument("-d", "--directives", default=None)
    parser.add_argument("-p", "--plot", default="full")
    parser.add_argument("-f", "--filtered", action="store_true")
    args = parser.parse_args()

    base_solution_dir = args.base_solution_dir[0]
    benchmark = args.benchmark
    top_level_name = args.top_level
    plot_type = args.plot
    filtered = args.filtered

    base_solutions = [(base_solution_dir, benchmark, top_level_name)]
    base_hls_data = build_base_graphs(base_solutions, filtered)[benchmark]

    base_data = to_pyg(base_hls_data)
    plot_data(base_data, plot_type, batched=False)

    
