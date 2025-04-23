import pickle
from pathlib import Path
from copy import deepcopy
from typing import Dict, Union, Optional

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


NODE_TYPES = ["instr", "port", "const", "region"]

EDGE_TYPES = [
    # Data flow edges
    ("const", "data", "instr"), 
    ("instr", "data", "instr"),
    ("port", "data", "instr"), 

    # Control flow edges
    ("region", "control", "instr"), 
    ("region", "control", "region"), 

    # Call flow edges
    ("instr", "call", "instr"),

    # Memory access edges
    ("instr", "mem", "instr"),

    # Hierarchical edges (representing CDFG structure)
    ("region", "hrchy", "region"), 
    ("region", "hrchy", "instr"),

    # Reversed hierarchical edges
    ("region", "hrchy_rev", "region"),
    ("instr", "hrchy_rev", "region"),
] + [
    # Self-loops for each node type
    (nt, "to", nt) for nt in NODE_TYPES
]

# Feature dimensions for each node type
NODE_FEATURE_DIMS = {
    "instr": 76, 
    "port": 14, 
    "const": 4, 
    "region": 11
}

DIRECTIVES = {
    "unroll", "pipeline", "loop_merge", 
    "loop_flatten", "array_partition"
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

            print(attrs)
            features.append(torch.tensor(attrs, dtype=torch.float32))

        if features:
            data[nt].x = torch.stack(features, dim=0)
        else:
            data[nt].x = torch.empty((0, NODE_FEATURE_DIMS[nt]), dtype=torch.float32)

        data[nt].node_name = [node.name for node in nodes]

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


def get_node_by_name(hls_data, node_type, name):
    for node in hls_data.nodes[node_type]:
        if node.name == name:
            return node
    return None


def partition_array(hls_data, array, partition_type, factor, dim):
    if partition_type == "complete":
        partition_type = [1, 0, 0]
    elif partition_type == "block":
        partition_type = [0, 1, 0]
    else:
        partition_type = [0, 0, 1]

    node = get_node_by_name(hls_data, "instr", array)
    if node is None:
        print(f"Warning: Array '{array}' not found in nodes.")
        return

    node.attrs["partition_type"] = partition_type
    node.attrs["partition_factor"] = factor
    node.attrs["partition_dim"] = dim
    node.attrs["size"] = [factor] + node.attrs["size"][1:]


def update_unrolled_loop_attrs(node, new_tc, new_lat):
    node.attrs["max_trip_count"] = [new_tc]
    node.attrs["min_trip_count"] = [new_tc]
    node.attrs["min_latency"] = [new_lat]
    node.attrs["max_latency"] = [new_lat]


def create_loop_replica(
    hls_data, loop_node, 
    new_tc=None, new_lat=None, 
    replica_id=None,
    replica_name=None
):
    if replica_id is None:
        replica_id = len(hls_data.nodes["region"])
    if new_tc is None:
        new_tc = loop_node.attrs["max_trip_count"][0]
    if new_lat is None:
        new_lat = loop_node.attrs["max_latency"][0]

    replica = deepcopy(loop_node)
    if new_tc is not None and new_lat is not None:
        update_unrolled_loop_attrs(replica, new_tc, new_lat)
    if replica_name is None:
        replica_name = f"{loop_node.name}.{replica_id}"
    replica.name = replica_name
    replica.id = replica_id
    replica.instrs = []
    replica.sub_regions = []
    hls_data.nodes["region"].append(replica)

    instr_id_map = {}
    region_id_map = {}

    n_instrs = len(hls_data.nodes["instr"])
    for i, instr_id in enumerate(loop_node.instrs):
        instr_node = hls_data.nodes["instr"][instr_id]
        new_instr_node = deepcopy(instr_node)
        new_instr_node.name = f"{instr_node.name}.{replica_id}"
        new_instr_id = n_instrs + i
        new_instr_node.id = new_instr_id
        hls_data.nodes["instr"].append(new_instr_node)
        replica.instrs.append(new_instr_id)
        instr_id_map[instr_id] = new_instr_id
        hls_data.edges["region", "hrchy", "instr"].append((replica_id, new_instr_id))

    for i, region_id in enumerate(loop_node.sub_regions):
        region_node = hls_data.nodes["region"][region_id]
        new_region_id = replica_id + i
        new_region_name = f"{region_node.name}.{replica_id}"
        create_loop_replica(
            hls_data, region_node, 
            replica_id=new_region_id, 
            replica_name=new_region_name
        )
        region_id_map[region_id] = new_region_id
        replica.sub_regions.append(new_region_id)
        hls_data.edges["region", "hrchy", "region"].append((replica_id, new_region_id))
    
    for instr_id, new_instr_id in instr_id_map.items():
        for et, edge_index in hls_data.edges.items():
            if et[1] == "hrchy":
                continue
            if et[0] == "instr":
                for src, dst in edge_index:
                    if src == instr_id:
                        if et[2] == "instr" and dst in loop_node.instrs:
                            dst = instr_id_map[dst]
                        elif et[2] == "region" and dst in loop_node.sub_regions:
                            dst = region_id_map[dst]
                        hls_data.edges[et].append((new_instr_id, dst))
            if et[2] == "instr":
                for src, dst in edge_index:
                    if dst == instr_id:
                        if et[0] == "instr" and src in loop_node.instrs:
                            src = instr_id_map[src]
                        elif et[0] == "region" and src in loop_node.sub_regions:
                            src = region_id_map[src]
                        hls_data.edges[et].append((src, new_instr_id))

    for et, edge_index in hls_data.edges.items():
        if et[1] == "hrchy":
                continue
        if et[0] == "region":
            for src, dst in edge_index:
                if src == loop_node.id:
                    if dst not in loop_node.sub_regions and dst not in loop_node.instrs:
                        hls_data.edges[et].append((replica_id, dst))
        if et[2] == "region":
            for src, dst in edge_index:
                if dst == loop_node.id:
                    if src not in loop_node.sub_regions and src not in loop_node.instrs:
                        hls_data.edges[et].append((src, replica_id))


def unroll_loop(hls_data, loop_label, factor=0):
    loop_node = get_node_by_name(hls_data, "region", loop_label)
    if loop_node is None:
        print(f"Warning: Loop '{loop_label}' not found in nodes.")
        return
    if not loop_node.is_loop:
        print(f"Warning: Node '{loop_label}' is not a loop.")
        return

    tc = loop_node.attrs["max_trip_count"][0]
    if factor <= 0:
        if tc <= 1:
            print("Warning: Trying to completely unroll loop "
                  f"{loop_node.name} with unknown trip count.")
            return
        factor = tc
    elif factor > tc or factor <= 1:
        print("Warning: Invalid unroll factor for loop "
              f"{loop_node.name}: {factor}.")
        return
    
    ii = loop_node.attrs["ii"][0]
    new_tc = max(1, tc // factor)
    new_lat = ii * new_tc

    rem_loops = tc % factor
    rem_tc = tc - new_tc * factor
    rem_lat = ii * rem_tc

    update_unrolled_loop_attrs(loop_node, new_tc, new_lat)
    loop_node.name = f"{loop_label}.{loop_node.id}"

    outer_regions = []
    for src, dst in hls_data.edges["region", "hrchy", "region"]:
        if dst == loop_node.id:
            outer_regions.append(src)

    n_replicas = factor + rem_loops - 1
    for i in range(n_replicas):
        tc = new_tc if i < factor else rem_tc
        lat = new_lat if i < factor else rem_lat
        replica_id = len(hls_data.nodes["region"])
        replica_name = f"{loop_label}.{replica_id}"
        create_loop_replica(hls_data, loop_node, tc, lat, 
                            replica_id, replica_name)
        for region_id in outer_regions:
            hls_data.edges["region", "hrchy", "region"].append((region_id, replica_id))


def include_directives(hls_data: HLSData, directives_tcl: str):
    def unroll_subloops(subregs):
        for subreg_id in subregs:
            subreg = hls_data.nodes["region"][subreg_id]
            # Start unrolling the inner-most loops
            unroll_subloops(subreg.sub_regions)
            if subreg.is_loop:
                unroll_loop(hls_data, subreg.name)

    directives = parse_tcl_directives_file(directives_tcl)

    # Sort by directive type (array_partition -> loop_flatten -> loop_merge -> pipeline -> unroll)
    directives.sort(key=lambda x: (
        x[0] == "array_partition",
        x[0] == "loop_flatten",
        x[0] == "loop_merge",
        x[0] == "pipeline",
        x[0] == "unroll"
    ))

    for directive, args in directives:
        if directive not in DIRECTIVES:
            continue

        if directive == "array_partition":
            var = args.get("variable")
            if var is None:
                print("Warning: No variable specified for array partition.")
                continue

            for nt in ["instr", "port"]:
                if (node := get_node_by_name(hls_data, nt, var)) is not None:
                    break
            else:
                print(f"Warning: Variable '{var}' not found in nodes.")
                continue

            factor = int(args.get("factor", 0))
            factor = [factor] if factor != 0 else node.attrs["size"]
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
            node = get_node_by_name(hls_data, "region", loc)
            if node is None:
                print(f"Warning: Location '{loc}' not found in nodes.")
                continue
        
            if directive == "unroll":
                factor = int(args.get("factor", 0))
                unroll_loop(hls_data, loc, factor)
            elif directive == "pipeline":
                if "off" in args:
                    node.attrs["pipeline_off"] = [1]
                    continue

                ii = max(1, int(args.get("ii", 0)))
                node.attrs["ii"] = [ii]
                node.attrs["min_latency"] = [ii * node.attrs["min_trip_count"][0]]
                node.attrs["max_latency"] = [ii * node.attrs["max_trip_count"][0]]
                node.attrs["pipeline"] = [1]

                # Pipeline in a loop induces a complete 
                # unroll in all of its subloops
                unroll_subloops(node.sub_regions)
            elif directive == "loop_flatten" and "off" in args:
                node.attrs["loop_flatten_off"] = [1]
                continue
            else:
                node.attrs[directive] = [1]


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
    from matplotlib.lines import Line2D
    from matplotlib.patches import Patch

    node_colors = {
        "instr": "#419ada",
        "port": "#1ecf89",
        "const": "#aa6df0",
        "region": "#e07765"
    }
    edge_colors = {
        ("const", "data", "instr"): "#5fdde0",
        ("instr", "data", "instr"): "#00bcd4",
        ("port", "data", "instr"): "#00a1b3",
        ("region", "control", "instr"): "#c7a141",
        ("region", "control", "region"): "#c7a141",
        ("instr", "mem", "instr"): "#e73939",
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
            ntypes = ["instr", "region"]
            etypes = [et for et in EDGE_TYPES if et[1] in ["control", "call"]]
        elif plot_type == "data":
            ntypes = ["instr", "const", "port"]
            etypes = [et for et in EDGE_TYPES if et[1] in ["data", "mem"]]
        elif plot_type == "hrchy":
            ntypes = ["instr", "region"]
            etypes = [et for et in EDGE_TYPES if et[1] == "hrchy"]
        else:
            raise ValueError(f"Unknown plot_type: {plot_type}")

        data_trans = HeteroData()

        for nt, x in data.x_dict.items():
            if nt not in ntypes:
                data_trans[nt].x = torch.empty((0, NODE_FEATURE_DIMS[nt]), dtype=torch.float32)
            else:
                data_trans[nt].x = x

            data_trans[nt].node_name = data[nt].node_name

        for et, edge_index in data.edge_index_dict.items():
            if et not in etypes:
                data_trans[et].edge_index = torch.empty((2, 0), dtype=torch.long)
            else:
                data_trans[et].edge_index = edge_index

        # data_trans = T.RemoveIsolatedNodes()(data_trans)
        G = to_networkx(data_trans, remove_self_loops=True, node_attrs=['x', 'node_name'])
        
        ncolors, nlabels = [], {}
        for node, attrs in G.nodes(data=True):
            nt = attrs.get("type")
            if nt is None or nt not in ntypes:
                continue
            ncolors.append(node_colors[nt])
            nlabels[node] = attrs["node_name"]

        ecolors = []
        for src, dst, attrs in G.edges(data=True):
            et = attrs.get("type")
            if et is None or et not in etypes:
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
        else:
            pos = nx.spring_layout(G)

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
    parser.add_argument("base_solution_dir", nargs=1, type=str)
    parser.add_argument("-b", "--benchmark", default=None)
    parser.add_argument("-d", "--directives", default=None)
    args = parser.parse_args()

    base_solution_dir = args.base_solution_dir[0]
    if (benchmark := args.benchmark) is None:
        benchmark = base_solution_dir

    base_solutions = {benchmark: base_solution_dir}
    base_hls_data = build_base_graphs(base_solutions)[benchmark]

    base_data = to_pyg(base_hls_data)
    plot_data(base_data, ["hrchy"], batched=False)

    if (directives := args.directives) is not None:
        data = build_opt_graph(base_hls_data, directives)
        plot_data(data, ["hrchy"], batched=False)

    
