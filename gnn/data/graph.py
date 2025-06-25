import os
import pickle
from copy import deepcopy
from typing import Dict, Optional, List, Tuple

import matplotlib.pyplot as plt
import torch
from sklearn.preprocessing import OneHotEncoder

from torch_geometric.data import HeteroData

from gnn.data.kernel.kernel_info import (
    VitisKernelInfo,
    CDFG_NODE_TYPES,
    CDFG_EDGE_TYPES
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

NODE_TYPES = CDFG_NODE_TYPES
EDGE_TYPES = CDFG_EDGE_TYPES + [
    # Reverse edges for hierarchical relationships
    (dst_nt, "hrchy_rev", src_nt) 
    for src_nt, rel, dst_nt in CDFG_EDGE_TYPES 
    if rel == "hrchy"
] + [
    # Self-loops
    (nt, "to", nt) for nt in CDFG_NODE_TYPES
]
METADATA = (NODE_TYPES, EDGE_TYPES)

# Feature dimensions for each node type
FEATURE_SIZE_BY_TYPE = {
    "instr": 85, 
    "port": 25,
    "const": 5,
    "region": 18,
    "block": 1
}


def extract_base_kernel_info(
    solution_info_list: List[Tuple[str, str, str]], # (Directory, Benchmark Name, Top Level Name)
    filtered: bool = False,
    encoder_output_path: Optional[str] = None,
) -> Dict[str, VitisKernelInfo]:
    from gnn.data.kernel.llvm_utils import extract_llvm_ir_array_info
    
    kernel_info_dict = {}
    for sol_dir, bench_name, top_level_name in solution_info_list:
        ir_dir = f"{sol_dir}/IRs" if filtered else f"{sol_dir}/.autopilot/db"
        array_md_path = f"{ir_dir}/array_md.json"
        array_access_info_path = f"{ir_dir}/array_access_info.json"
        try:
            extract_llvm_ir_array_info(
                hls_ir_dir=ir_dir, 
                array_md_out_path=array_md_path,
                array_access_info_out_path=array_access_info_path
            )
        except Exception as e:
            print(f"Error extracting array info for {bench_name} in {sol_dir}: {e}")
            continue

        if not os.path.exists(array_md_path) or not os.path.exists(array_access_info_path):
            print(f"Error extracting array info for {bench_name} in {sol_dir}: "
                  f"Files were not created.")
            continue

        kernel_info_dict[bench_name] = VitisKernelInfo(
            solution_dir=sol_dir, 
            top_level_name=top_level_name, 
            array_md_path=array_md_path, 
            array_access_info_path=array_access_info_path,
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
    kernel_info: VitisKernelInfo, 
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
            attrs = []
            for attr in node.attrs.values():
                if isinstance(attr, list):
                    attrs.extend(attr)
                else:
                    attrs.append(attr)
            features.append(
                torch.tensor(attrs, dtype=torch.float32)
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
        hrchy_edges = {k: v for k, v in data.edge_index_dict.items() if k[1] == "hrchy"}
        for et, edge_index in hrchy_edges.items():
            if edge_index.size(1) == 0:
                data[et[2], "hrchy_rev", et[0]].edge_index = torch.empty((2, 0), dtype=torch.long)
            else:
                src, dst = edge_index[0], edge_index[1]
                data[et[2], "hrchy_rev", et[0]].edge_index = torch.stack([dst, src], dim=0)

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
        for node in kernel_info.nodes.get('port', []):
            if (node.name == array_name 
                and node.attrs.get('array_partition', 0) == 0
                and node.function_name == function_name):
                return (node, 'port') if ret_node_type else node
            
    for node in kernel_info.nodes.get('instr', []):
        if (node.opcode in ['alloca', 'GlobalMem']
            and node.name == array_name 
            and node.attrs.get('array_partition', 0) == 0
            and node.function_name == function_name):
            return (node, 'instr') if ret_node_type else node
        
    # If not found, search for array_name only
    for node in kernel_info.nodes.get('port', []):
        if (node.name == array_name 
            and node.attrs.get('array_partition', 0) == 0):
            return (node, 'port') if ret_node_type else node
        
    for node in kernel_info.nodes.get('instr', []):
        if (node.opcode in ['alloca', 'GlobalMem']
            and node.name == array_name 
            and node.attrs.get('array_partition', 0) == 0):
            return (node, 'instr') if ret_node_type else node

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
    base_kernel_info: VitisKernelInfo, 
    solution_dct_tcl_path: str,
    vitis_log_path: Optional[str] = None
) -> VitisKernelInfo:
    # def unroll_pipelined_subloops(loop_node):
    #     """Completely unroll all subloops of a pipelined loop."""
    #     for sub_region in loop_node.sub_regions:
    #         node = kernel_info.nodes['region'][sub_region]
    #         if node.is_loop:
    #             trip_count = max(1, node.attrs.get("max_trip_count", 0))
    #             node.attrs["unroll_factor"] = trip_count
    #             node.attrs["unroll"] = 1
    #         unroll_pipelined_subloops(node)

    kernel_info = deepcopy(base_kernel_info)
    directives = parse_tcl_directives(solution_dct_tcl_path)

    for dct, args in directives:
        if dct not in DIRECTIVES:
            continue

        if dct == "array_partition":
            function_name = args.get("location", "")
            target_name = args.get("variable")
            if target_name is None:
                print("Warning: No variable specified for array partition.")
                continue

            array_node = find_array_node(kernel_info, target_name, function_name)
            if array_node is None:
                print(f"Warning: Variable '{target_name}' "
                      f"(function '{function_name}') not found in nodes.")
                continue
            
            array_node.attrs["array_partition"] = 1

            partition_factor = int(args.get("factor", 0))
            if partition_factor <= 0:
                partition_factor = array_node.total_size
            array_node.attrs["partition_factor"] = partition_factor

            partition_dim = int(args.get("dim", 0))
            array_node.attrs["partition_dim"][partition_dim] = 1

            partition_type = args.get("type", "complete")
            if partition_type == "complete":
                partition_type = [1, 0, 0]
            elif partition_type == "block":
                partition_type = [0, 1, 0]
            else:
                partition_type = [0, 0, 1]
            array_node.attrs["partition_type"] = partition_type

        elif "off" not in args:
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

            # if dct == "pipeline" and region_node.is_loop:
            #     # Pipeline pragma in a loop implies the complete
            #     # unrolling of all its subloops (if any)
            #     unroll_pipelined_subloops(region_node)

            if dct == "unroll" and region_node.attrs.get("unroll", 0) == 0:
                unroll_factor = int(args.get("factor", 0))
                if unroll_factor <= 0:
                    unroll_factor = region_node.attrs.get("max_trip_count", 1)
                region_node.attrs["unroll_factor"] = unroll_factor

            region_node.attrs[dct] = 1

    if not vitis_log_path:
        return kernel_info
    
    if not os.path.exists(vitis_log_path):
        print(f"Warning: Vitis log file '{vitis_log_path}' does not exist.")
        return kernel_info
    
    auto_dcts = extract_auto_dcts_from_log(vitis_log_path)

    for dct, dct_info_set in auto_dcts.items():
        for dct_info in dct_info_set:
            if dct == "loop_flatten":
                loop_name, function_name = dct_info
                for node in kernel_info.nodes.get('region', []):
                    if (node.name == loop_name 
                        and node.function_name == function_name):
                        node.attrs["loop_flatten"] = 1
                        break
            elif dct == "inline":
                function_name = dct_info
                for node in kernel_info.nodes.get('region', []):
                    if node.name == function_name:
                        node.attrs["inline"] = 1
                        break
            elif dct == "pipeline":
                loop_name = dct_info
                for node in kernel_info.nodes.get('region', []):
                    if node.name == loop_name:
                        node.attrs["pipeline"] = 1
                        # if node.is_loop:
                        #     unroll_pipelined_subloops(node)
                        break

    return kernel_info


def fit_one_hot_encoders(hls_data_dict: Dict[str, VitisKernelInfo]):
    categorical_attrs = {
        "impl": set(), "opcode": set(), "if_type": set(), 
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


def one_hot_encode(hls_data: VitisKernelInfo, encoders: Dict[str, OneHotEncoder]):
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
    plt_type: str = "full",
    batched: bool = False
):
    import networkx as nx
    from torch_geometric.utils import to_networkx
    from matplotlib.lines import Line2D
    from matplotlib.patches import Patch

    node_color_dict = {
        "instr": "#419ada",
        "port": "#1ecf89",
        "const": "#aa6df0",
        "block": "#c9a24e",
        "region": "#d84c4c",
    }
    edge_color_dict = {
        ("const", "data", "instr"): "#5fdde0",
        ("instr", "data", "instr"): "#00bcd4",
        ("port", "data", "instr"): "#00a1b3",
        ("instr", "data", "const"): "#249741",
        ("port", "data", "const"): "#249741",
        ("block", "control", "instr"): "#ddb753",
        ("block", "control", "block"): "#ddb753",
        ("instr", "mem", "instr"): "#e73939",
        ("instr", "call", "instr"): "#8040c9",
        ("region", "hrchy", "region"): "#aab2b9",
        ("region", "hrchy", "block"): "#aab2b9",
        ("block", "hrchy", "instr"): "#aab2b9"
    }
    
    if plt_type == "full":
        edge_types = node_color_dict.keys()
        node_types = edge_color_dict.keys()
    else:
        edge_types = [
            et for et in edge_color_dict.keys() 
            if et[1] == plt_type
        ]
        node_types = set()
        for et in edge_types:
            node_types.add(et[0])
            node_types.add(et[2])
        node_types = list(node_types)

    filtered_data = HeteroData()
    for nt, x in data.x_dict.items():
        if nt not in node_types:
            x = torch.empty((0, FEATURE_SIZE_BY_TYPE[nt]), 
                            dtype=torch.float32)
        filtered_data[nt].x = x
        filtered_data[nt].label = data[nt].label

    for et, edge_index in data.edge_index_dict.items():
        if et not in edge_types:
            edge_index = torch.empty((2, 0), dtype=torch.long)
        filtered_data[et].edge_index = edge_index

    G = to_networkx(
        data=filtered_data, 
        node_attrs=['x', 'label'], 
        remove_self_loops=True
    )
    
    ncolors, nlabels = [], {}
    for node, attrs in G.nodes(data=True):
        nt = attrs.get("type")
        if nt is None:
            continue
        ncolor = node_color_dict.get(nt)
        if ncolor is None:
            print(f"Warning: No color defined for node type '{nt}'")
            ncolor = "#FFFFFF"
        ncolors.append(ncolor)
        nlabels[node] = attrs["label"]

    ecolors = []
    for src, dst, attrs in G.edges(data=True):
        et = attrs.get("type")
        if et is None:
            continue
        ecolor = edge_color_dict.get(et)
        if ecolor is None:
            print(f"Warning: No color defined for edge type '{et}'")
            ecolor = "#FFFFFF"
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

    if plt_type in ["full", "data", "hrchy"] and not batched:
        # Non-batched large graphs
        pos = nx.kamada_kawai_layout(G, scale=2)
    elif plt_type in ["mem", "call", "alloca"]:
        # Small graphs (batched or not)
        pos = nx.planar_layout(G, scale=2)
    else:
        # Batched large graphs
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
    

if __name__ == "__main__":
    from argparse import ArgumentParser

    parser = ArgumentParser()
    parser.add_argument("solution_dir", nargs=1, type=str)
    parser.add_argument("-t", "--top-fn")
    parser.add_argument("-d", "--directive-config-dir")
    parser.add_argument("-k", "--kernel", default="")
    parser.add_argument("-p", "--plot-type", default="full")
    parser.add_argument("-f", "--filtered", action="store_true")
    args = parser.parse_args()

    sol_dir = args.solution_dir[0]
    top_fn_name = args.top_fn
    dct_config_dir = args.directive_config_dir
    kernel_name = args.kernel
    plt_type = args.plot_type
    filtered = args.filtered

    sol_info_list = [(sol_dir, kernel_name, top_fn_name)]

    kernel_info = extract_base_kernel_info(
        solution_info_list=sol_info_list, 
        hls_dct_config_dir=dct_config_dir,
        filtered=filtered
    )[kernel_name]

    data = to_hetero_data(kernel_info)

    plot_data(data, plt_type, batched=False)

    
