import os
import math
import pickle
from copy import deepcopy
from typing import Dict, Optional, List, Tuple

import matplotlib.pyplot as plt
import torch
from sklearn.preprocessing import OneHotEncoder

from torch_geometric.data import HeteroData

from gnn.data.kernel_graph import (
    KernelGraph,
    NODE_TYPES,
    EDGE_TYPES as CDFG_EDGE_TYPES,
    MAX_ARRAY_DIM
)
from gnn.data.utils.parsers import (
    parse_tcl_directives,
    extract_auto_dcts_from_log
)

DIRECTIVES = [
    "array_partition", "loop_flatten",
    "loop_merge", "pipeline", "unroll",
    "dataflow", "inline"
]

EDGE_TYPES = CDFG_EDGE_TYPES + [
    # Reverse edges for hierarchical relationships
    (dst_nt, "reversed_hier", src_nt) 
    for src_nt, rel, dst_nt in CDFG_EDGE_TYPES 
    if rel == "hier"
] + [
    # Self-loops
    (nt, "to", nt) for nt in NODE_TYPES
]
METADATA = (NODE_TYPES, EDGE_TYPES)

# Feature dimensions for each node type
FEATURE_SIZE_BY_TYPE = {
    "op": 47, 
    "port": 33,
    "internal_mem": 33,
    "const": 4,
    "region": 42,
    "block": 14
}


def extract_base_kernel_info(
    solution_info_list: List[Tuple[str, str, str]], # (Directory, Benchmark Name, Top Level Name)
    filtered: bool = False,
    encoder_output_path: Optional[str] = None,
) -> Dict[str, KernelGraph]:
    from gnn.data.utils.llvm_ir import extract_array_and_loop_md
    
    kernel_info_dict = {}
    for sol_dir, bench_name, top_level_name in solution_info_list:
        ir_dir = f"{sol_dir}/IRs" if filtered else f"{sol_dir}/.autopilot/db"
        try:
            array_md_dict, loop_md_dict = extract_array_and_loop_md(ir_dir)
        except Exception as e:
            print(f"Error extracting array info for {bench_name} in {sol_dir}: {e}")
            continue

        kernel_info_dict[bench_name] = KernelGraph(
            solution_dir=sol_dir, 
            top_level_name=top_level_name, 
            global_array_md_dict=array_md_dict['Global'],
            local_array_md_dict=array_md_dict['Local'],
            loop_md_dict=loop_md_dict,
            benchmark_name=bench_name,
            filtered=filtered
        )
        
    encoders = fit_one_hot_encoders(kernel_info_dict)
    if encoder_output_path:
        save_encoders(encoders, encoder_output_path)
    
    for bench_name in kernel_info_dict:
        one_hot_encode(kernel_info_dict[bench_name], encoders)

    return kernel_info_dict


def to_hetero_data(
    kernel_info: KernelGraph, 
    add_self_loops: bool = True,
    add_reversed_edges: bool = True,
) -> HeteroData:
    data = HeteroData()
    for nt in NODE_TYPES:
        nodes = kernel_info.nodes.get(nt)
        if not nodes:
            data[nt].x = torch.empty(
                (0, FEATURE_SIZE_BY_TYPE[nt]), dtype=torch.float32
            )
            data[nt].label = []
            continue

        features = []
        for node in nodes:
            feature_dict = []
            for attr in node.feature_dict.values():
                if isinstance(attr, list):
                    feature_dict.extend([float(v) for v in attr])
                else:
                    feature_dict.append(float(attr))
            features.append(
                torch.tensor(feature_dict, dtype=torch.float32)
            )
        data[nt].x = torch.stack(features, dim=0)
            
        data[nt].label = [node.label for node in nodes]

    for et in EDGE_TYPES:
        edges = kernel_info.edges.get(et)
        if edges:
            src, dst = zip(*edges)
            src = torch.tensor(src, dtype=torch.long)
            dst = torch.tensor(dst, dtype=torch.long)
            data[et].edge_index = torch.stack([src, dst], dim=0)
        else:
            data[et].edge_index = torch.empty((2, 0), dtype=torch.long)

    if add_reversed_edges:
        hrchy_edges = {k: v for k, v in data.edge_index_dict.items() if k[1] == "hier"}
        for et, edge_index in hrchy_edges.items():
            if edge_index.size(1) == 0:
                data[et[2], "reversed_hier", et[0]].edge_index = torch.empty((2, 0), dtype=torch.long)
            else:
                src, dst = edge_index[0], edge_index[1]
                data[et[2], "reversed_hier", et[0]].edge_index = torch.stack([dst, src], dim=0)

    if add_self_loops:
        for nt in NODE_TYPES:
            nodes = kernel_info.nodes.get(nt)
            if nodes:
                src = torch.arange(len(nodes), dtype=torch.long)
                dst = src.clone()
                data[nt, "to", nt].edge_index = torch.stack([src, dst], dim=0)
            else:
                data[nt, "to", nt].edge_index = torch.empty((2, 0), dtype=torch.long)

    return data


def find_array_node(kernel_info, array_name, function_name, ret_node_type=False):
    if function_name:
        for nt in ['port', 'internal_mem']:
            for node in kernel_info.nodes.get(nt, []):
                if (node.is_array 
                    and node.name == array_name 
                    and node.function_name == function_name):
                    return (node, nt) if ret_node_type else node
                
    # If not found, search for array_name only
    for node in kernel_info.nodes.get('internal_mem', []):
        if node.is_array and node.is_global_mem and node.name == array_name:
            return (node, nt) if ret_node_type else node

    return (None, None) if ret_node_type else None


def find_region_node(kernel_info, region_name, function_name):
    for node in kernel_info.nodes.get('region', []):
        if (node.name == region_name
            and node.function_name == function_name):
            return node
        
    # If not found, search for region_name only
    for node in kernel_info.nodes.get('region', []):
        if node.name == region_name:
            return node
    
    return None


def update_with_directives(
    base_kernel_info: KernelGraph, 
    solution_dct_tcl_path: str,
    vitis_log_path: Optional[str] = None
) -> KernelGraph:
    kernel_info = deepcopy(base_kernel_info)
    directives = parse_tcl_directives(solution_dct_tcl_path)

    for dct, args in directives:
        if dct not in DIRECTIVES or "off" in args:
            continue

        if dct == "array_partition":
            function_name = args.get("location", "")
            target_name = args.get("variable")
            if target_name is None:
                print("Warning: No variable specified for array partition.")
                continue

            array_node, nt = find_array_node(
                kernel_info, target_name, function_name, ret_node_type=True
            )
            if array_node is None:
                print(f"Warning: Variable '{target_name}' "
                      f"(function '{function_name}') not found in nodes.")
                continue

            partition_type = args.get("type", "complete")

            if partition_type == "cyclic":
                array_node.feature_dict["array_partition"] = [0, 1, 0, 0]
            elif partition_type == "block":
                array_node.feature_dict["array_partition"] = [0, 0, 1, 0]
            else:
                array_node.feature_dict["array_partition"] = [0, 0, 0, 1]

            partition_dim = min(int(args.get("dim", 0)), MAX_ARRAY_DIM)
            if partition_dim > array_node.num_dims:
                partition_dim = 0

            if partition_type == "complete":
                if partition_dim == 0:
                    partition_factor = array_node.array_size
                else:
                    partition_factor = array_node.feature_dict['original_dims'][partition_dim - 1]

                partitioned_array_size = array_node.array_size // partition_factor
                if partitioned_array_size < 1024:
                    array_node.feature_dict["is_large_array"] = 0
            else:
                if partition_dim == 0:
                    partition_dim = array_node.num_dims

                target_dim_size = array_node.feature_dict['original_dims'][partition_dim - 1]
                product_of_non_target_dims = 1
                for i in range(array_node.num_dims):
                    if i != partition_dim - 1:
                        product_of_non_target_dims *= array_node.feature_dict['original_dims'][i]

                partition_factor = int(args.get("factor", 0))

                ceiled_partitioned_dim_size = math.ceil(target_dim_size / float(partition_factor))
                ceiled_partitioned_array_size = ceiled_partitioned_dim_size * product_of_non_target_dims

                last_partitioned_dim_size = target_dim_size % partition_factor

                is_unevenly_partitioned = last_partitioned_dim_size != 0
                array_node.feature_dict["is_unevenly_partitioned"] = int(is_unevenly_partitioned)

                if ceiled_partitioned_array_size < 1024:
                    array_node.feature_dict["is_large_array"] = 0
                elif is_unevenly_partitioned:
                    last_partitioned_array_size = last_partitioned_dim_size * product_of_non_target_dims
                    if last_partitioned_array_size < 1024:
                        if nt == "internal_mem" or (nt == "port" and not array_node.is_top_level):
                            array_node.feature_dict["has_hybrid_impl"] = 1

            array_node.feature_dict["partition_factor"] = partition_factor
            array_node.feature_dict["partition_dim"][partition_dim] = 1

            matching_ports = array_node.matching_ports
            while matching_ports:
                port_id = matching_ports.pop()
                port_node = kernel_info.nodes['port'][port_id]

                port_node.feature_dict["array_partition"] = array_node.feature_dict["array_partition"]
                port_node.feature_dict["partition_dim"] = array_node.feature_dict["partition_dim"]
                port_node.feature_dict["partition_factor"] = partition_factor
                port_node.feature_dict["is_large_array"] = array_node.feature_dict["is_large_array"]
                port_node.feature_dict["is_unevenly_partitioned"] = array_node.feature_dict["is_unevenly_partitioned"]
                port_node.feature_dict["has_hybrid_impl"] = array_node.feature_dict["has_hybrid_impl"]

                matching_ports.extend(port_node.matching_ports)
        else:
            location = args["location"]
            if "/" in location:
                function_name, target_name = location.split("/")
            else:
                function_name = location
                target_name = location

            region_node = find_region_node(kernel_info, target_name, function_name)
            if region_node is None:
                print(f"Warning: Region '{target_name}' "
                      f"(function '{function_name}') not found in nodes.")
                continue

            if dct == "pipeline":
                ii = max(1, int(args.get("ii", 1)))
                region_node.feature_dict["target_ii"] = ii
                region_node.feature_dict["achieved_ii_base"] = 0
                region_node.feature_dict["pipeline"] = [0, 1, 0] # Pipelined by user directive
                _unroll_pipelined_subloops(kernel_info, region_node)
            elif dct == "unroll":
                if region_node.feature_dict["unroll"][-1] != 1:
                    trip_count = region_node.feature_dict.get("max_trip_count", 0)
                    unroll_factor = int(args.get("factor", 0))
                    if unroll_factor <= 0 or (trip_count > 0 and unroll_factor > trip_count):
                        unroll_factor = trip_count
                    region_node.feature_dict["unroll_factor"] = unroll_factor
                    region_node.feature_dict["unroll"] = [0, 1, 0] # Unrolled by user directive
            else:
                region_node.feature_dict[dct] = 1

    if not vitis_log_path:
        return kernel_info
    
    if not os.path.exists(vitis_log_path):
        print(f"Warning: Vitis log file '{vitis_log_path}' does not exist.")
        return kernel_info
    
    auto_dcts = extract_auto_dcts_from_log(vitis_log_path)
    auto_inline = auto_dcts.get("inline", set())
    auto_pipeline = auto_dcts.get("pipeline", set())

    for function_name in auto_inline:
        for node in kernel_info.nodes.get('region', []):
            if node.name == function_name:
                node.feature_dict["inline"] = 1
                break

    for loop_name in auto_pipeline:
        for node in kernel_info.nodes.get('region', []):
            if node.name == loop_name and node.feature_dict["pipeline"][-1] == 0:
                node.feature_dict["pipeline"] = [0, 0, 1] # Pipelined automatically by HLS
                if node.feature_dict["achieved_ii_base"] == 0:
                    node.feature_dict["target_ii"] = 1
                if node.is_loop:
                    _unroll_pipelined_subloops(kernel_info, node)

    return kernel_info


def fit_one_hot_encoders(hls_data_dict: Dict[str, KernelGraph]):
    categorical_feature_dict = {
        "core_name": set(), "const_type": set(), 
        "base_type": set(), "original_base_type": set()
    }
    encoders = {
        key: OneHotEncoder(handle_unknown='ignore') 
        for key in categorical_feature_dict.keys()
    }
    for data in hls_data_dict.values():
        for node_groups in data.nodes.values():
            for node in node_groups:
                for key, value in node.feature_dict.items():
                    if key in categorical_feature_dict:
                        categorical_feature_dict[key].add(value)

    for key, values in categorical_feature_dict.items():
        if values:
            encoders[key].fit([[v] for v in values])

    return encoders


def one_hot_encode(hls_data: KernelGraph, encoders: Dict[str, OneHotEncoder]):
    for node_groups in hls_data.nodes.values():
        for node in node_groups:
            for key, value in node.feature_dict.items():
                if key in encoders:
                    encoded = encoders[key].transform([[value]]).toarray()
                    node.feature_dict[key] = encoded[0].flatten().tolist()


def save_encoders(encoders: Dict[str, OneHotEncoder], path: str):
    with open(path, 'wb') as f:
        pickle.dump(encoders, f)


def load_encoders(path: str) -> Dict[str, OneHotEncoder]:
    with open(path, 'rb') as f:
        encoders = pickle.load(f)
    return encoders 


def _unroll_pipelined_subloops(kernel_info, loop_node):
    """Completely unroll all subloops of a pipelined loop."""
    for sub_region in loop_node.sub_regions:
        node = kernel_info.nodes['region'][sub_region]
        if node.is_loop:
            trip_count = node.feature_dict.get("max_trip_count", 0)
            node.feature_dict["unroll_factor"] = trip_count
            node.feature_dict["unroll"] = [0, 0, 1] # Unroll implied by pipeline
        _unroll_pipelined_subloops(kernel_info, node)


def plot_data(
    data: HeteroData,
    plt_type: str = "full",
    batched: bool = False
):
    import networkx as nx
    from torch_geometric.utils import to_networkx
    from matplotlib.lines import Line2D
    from matplotlib.patches import Patch

    node_color_dict = {
        "op": "#3791d1",
        "internal_mem": "#80e2d5",
        "port": "#a8df83",
        "const": "#bc6df0",
        "block": "#d8b61e",
        "region": "#e26363"
    }
    edge_color_dict = {
        ("const", "data", "op"): "#4b91b9",
        ("op", "data", "op"): "#4b91b9",
        ("port", "data", "op"): "#4b91b9",
        ("internal_mem", "data", "op"): "#4b91b9",
        ("internal_mem", "data", "port"): "#14387a",
        ("port", "data", "port"): "#14387a",
        ("op", "alloca", "internal_mem"): "#946eee",
        ("block", "control", "op"): "#22833F",
        ("block", "control", "block"): "#22833F",
        ("op", "control", "region"): "#cf5ecf",
        ("region", "hier", "region"): "#9C9C9C",
        ("region", "hier", "block"): "#9C9C9C",
        ("block", "hier", "op"): "#9C9C9C"
    }
    if "full" in plt_type:
        edge_types = list(edge_color_dict.keys())
        node_types = list(node_color_dict.keys())
    else:
        plt_types = plt_type.split("_")
        edge_types = []
        node_types = set()
        for et in edge_color_dict.keys():
            if et[1] in plt_types:
                edge_types.append(et)
                node_types.add(et[0])
                node_types.add(et[2])

    filtered_data = HeteroData()
    
    node_indices = {nt: set() for nt in node_types}
    for et, edge_index in data.edge_index_dict.items():
        if et in edge_types:
            filtered_data[et].edge_index = edge_index
            node_indices[et[0]].update(edge_index[0].tolist())
            node_indices[et[2]].update(edge_index[1].tolist())

    node_indices = {
        nt: list(indices) 
        for nt, indices in node_indices.items()
    }
    for nt, x in data.x_dict.items():
        if nt in node_indices and node_indices[nt]:
            filtered_data[nt].x = x[node_indices[nt]]
            filtered_data[nt].label = [
                data[nt].label[i] for i in node_indices[nt]
            ]

    G = to_networkx(
        data=filtered_data, 
        node_attrs=['x', 'label']
    )

    nodes_to_remove = []
    for node, attrs in G.nodes(data=True):
        nt = attrs.get("type")
        if nt is None or nt not in node_types:
            nodes_to_remove.append(node)

    edges_to_remove = []
    for src, dst, attrs in G.edges(data=True):
        et = attrs.get("type")
        if et is None or et not in edge_types:
            edges_to_remove.append((src, dst))

    G.remove_edges_from(edges_to_remove)
    G.remove_nodes_from(nodes_to_remove)

    ncolors, nlabels = [], {}
    for node, attrs in G.nodes(data=True):
        nt = attrs.get("type")
        label = attrs.get("label", "")
        ncolor = node_color_dict.get(nt, '#ffffff')
        ncolors.append(ncolor)
        nlabels[node] = label
        G.nodes[node]["color"] = ncolor
        G.nodes[node]["type"] = nt
        G.nodes[node]["label"] = label

    ecolors = []
    for src, dst, attrs in G.edges(data=True):
        et = attrs.get("type")
        ecolor = edge_color_dict.get(et, '#ffffff')
        ecolors.append(ecolor)
        G.edges[src, dst]["color"] = ecolor

    node_legend = [
        Patch(color=color, label=nt) 
        for nt, color in node_color_dict.items() 
        if nt in node_types
    ]
    edge_legend = [
        Line2D([0], [0], color=color, lw=2, label=f"{et[1]}: {et[0]}→{et[2]}")
        for et, color in edge_color_dict.items() 
        if et in edge_types
    ]

    if batched:
        pos = nx.spring_layout(G, scale=2)
    else:
        pos = nx.kamada_kawai_layout(G, scale=2)

    plt.figure(figsize=(12, 8))
    nx.draw_networkx(
        G, pos, labels=nlabels, node_color=ncolors, 
        edge_color=ecolors, style="dashed", node_size=150, 
        font_size=8, arrowsize=9, width=.9, alpha=.7
    )
    plt.legend(
        handles=node_legend + edge_legend, loc='lower center', 
        bbox_to_anchor=(0.5, -0.13), ncol=3, fontsize=8, frameon=False
    )
    plt.show()
    

if __name__ == "__main__":
    from argparse import ArgumentParser

    parser = ArgumentParser()
    parser.add_argument("solution_dir", nargs=1, type=str)
    parser.add_argument("-t", "--top-level")
    parser.add_argument("-b", "--benchmark", default="")
    parser.add_argument("-p", "--plot-type", default="full")
    parser.add_argument("-f", "--filtered", action="store_true")
    parser.add_argument("-o", "--output-path", type=str, default=None)
    args = parser.parse_args()

    sol_dir = args.solution_dir[0]
    top_fn_name = args.top_level
    kernel_name = args.benchmark
    plt_type = args.plot_type
    filtered = args.filtered

    kernel_info = extract_base_kernel_info(
        solution_info_list=[(sol_dir, kernel_name, top_fn_name)], 
        filtered=filtered
    )[kernel_name]

    if args.output_path:
        kernel_info.save_as_json(args.output_path)

    data = to_hetero_data(kernel_info)

    plot_data(data, plt_type, batched=False)

    