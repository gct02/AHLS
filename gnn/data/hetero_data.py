import os
import pickle
import json
from copy import deepcopy
from typing import Dict, Union, Optional, List, Tuple, Any

import matplotlib.pyplot as plt
import torch
from torch import Tensor
from sklearn.preprocessing import OneHotEncoder

from torch_geometric.data import HeteroData
from torch_geometric.data.hetero_data import NodeOrEdgeStorage
from torch_geometric.data.storage import EdgeStorage
from torch_geometric.utils import is_sparse

from gnn.data.kernel.vitis_kernel_info import (
    CDFG_NODE_TYPES,
    CDFG_EDGE_TYPES,
    VitisKernelInfo, 
    DirectiveNode
)
from gnn.data.utils.parsers import parse_tcl_directives_file


DIRECTIVES = [
    "array_partition", "loop_flatten",
    "loop_merge", "pipeline", "unroll"
]

NODE_TYPES = CDFG_NODE_TYPES + DIRECTIVES

EDGE_TYPES = CDFG_EDGE_TYPES + [
    (dst_nt, "hrchy_rev", src_nt) 
    for src_nt, rel, dst_nt in CDFG_EDGE_TYPES 
    if rel == "hrchy"
] + [
    ("array_partition", "transform", "array"),
    ("loop_flatten", "transform", "region"),
    ("loop_merge", "transform", "region"),
    ("pipeline", "transform", "region"),
    ("unroll", "transform", "region")
] + [
    (nt, "to", nt) for nt in CDFG_NODE_TYPES
]

METADATA = (NODE_TYPES, EDGE_TYPES)

# Feature dimensions for each node type
NODE_FEATURE_DIMS = {
    "instr": 62, "port": 7, "array": 19,
    "const": 5, "block": 5, "region": 8,

    "array_partition": 8, "loop_flatten": 1,
    "loop_merge": 1, "pipeline": 1, "unroll": 2
}

DIRECTIVE_SUBSET_NODE_TYPES = {
    "array_partition": [
        "array_partition", "array", "instr"
    ],
    "unroll": [
        "unroll", "region", "block", "instr"
    ],
    "pipeline": [
        "pipeline", "region", "block", "instr"
    ],
    "loop_flatten": [
        "loop_flatten", "region"
    ],
    "loop_merge": [
        "loop_merge", "region"
    ]
}

DIRECTIVE_SUBSET_EDGE_TYPES = {
    "array_partition": [
        ("array_partition", "transform", "array"),
        ("array", "data", "instr"),
        ("instr", "alloca", "array")
    ],
    "unroll": [
        ("unroll", "transform", "region")
    ] + [
        et for et in EDGE_TYPES if "hrchy" in et[1]
    ],
    "pipeline": [
        ("pipeline", "transform", "region"),
        ("instr", "data", "instr"),
        ("block", "control", "instr"),
        ("block", "control", "block")
    ] + [
        et for et in EDGE_TYPES if "hrchy" in et[1]
    ],
    "loop_flatten": [
        ("loop_flatten", "transform", "region"),
        ("region", "hrchy", "region"),
        ("region", "hrchy_rev", "region")
    ],
    "loop_merge": [
        ("loop_merge", "transform", "region"),
        ("region", "hrchy", "region"),
        ("region", "hrchy_rev", "region")
    ]
}

DIRECTIVE_SUBSET_METADATA = {
    dt: (DIRECTIVE_SUBSET_NODE_TYPES[dt], DIRECTIVE_SUBSET_EDGE_TYPES[dt])
    for dt in DIRECTIVES
}


class HLSHeteroData(HeteroData):
    def __init__(self):
        super(HLSHeteroData, self).__init__()

    def __cat_dim__(
        self, key: str, value: Any,
        store: Optional[NodeOrEdgeStorage] = None, 
        *args, **kwargs
    ) -> Any:
        for dt in DIRECTIVES:
            if key.startswith(dt):
                if "filtered_edge" in key:
                    return 1
                else: 
                    return 0
        if is_sparse(value) and 'adj' in key:
            return (0, 1)
        elif isinstance(store, EdgeStorage) and 'index' in key:
            return -1
        return 0
    
    def __inc__(
        self, key: str, value: Any,
        store: Optional[NodeOrEdgeStorage] = None, 
        *args, **kwargs
    ) -> Any:
        for dt in DIRECTIVES:
            if key.startswith(dt):
                if "filtered_edge" in key:
                    return value.size(1)
                else: 
                    return 0
        if 'batch' in key and isinstance(value, Tensor):
            return int(value.max()) + 1
        elif isinstance(store, EdgeStorage) and 'index' in key:
            return torch.tensor(store.size()).view(2, 1)
        else:
            return 0


def extract_base_kernel_info(
    solution_info_list: List[Tuple[str, str, str]],
    hls_dct_config_dir: str,
    filtered: bool = False,
    encoder_output_path: Optional[str] = None,
) -> Dict[str, VitisKernelInfo]:
    from gnn.data.kernel.llvm_utils import extract_llvm_ir_array_info
    
    kernel_info_dict = {}
    for sol_dir, kernel_name, top_function in solution_info_list:
        ir_dir = f"{sol_dir}/IRs" if filtered else f"{sol_dir}/.autopilot/db"
        ir_path = f"{ir_dir}/a.g.ld.5.gdce.bc"
        ir_array_info_path = f"{ir_dir}/array_info.json"

        extract_llvm_ir_array_info(ir_path, ir_array_info_path)
        if not os.path.exists(ir_array_info_path):
            print(f"IR Array info file not found: {ir_array_info_path}")
            continue

        kernel_info = VitisKernelInfo(
            solution_dir=sol_dir, 
            top_function_name=top_function, 
            array_info_path=ir_array_info_path, 
            kernel_name=kernel_name,
            filtered=filtered
        )
        dct_config_path = os.path.join(
            hls_dct_config_dir, f"{kernel_name.lower()}.json"
        )
        include_directive_info(kernel_info, dct_config_path)
        kernel_info_dict[kernel_name] = kernel_info
            
    encoders = fit_one_hot_encoders(kernel_info_dict)
    if encoder_output_path:
        save_encoders(encoders, encoder_output_path)
    
    for kernel_name in kernel_info_dict:
        one_hot_encode(kernel_info_dict[kernel_name], encoders)

    return kernel_info_dict


def create_hls_hetero_data(
    base_kernel_info: VitisKernelInfo,
    solution_dct_tcl_path: str, 
    add_self_loops: bool = True,
    add_reversed_edges: bool = True,
) -> HLSHeteroData:
    kernel_info = deepcopy(base_kernel_info)
    update_directive_info(kernel_info, solution_dct_tcl_path)
    return to_hls_hetero_data(
        kernel_info, 
        add_self_loops=add_self_loops,
        add_reversed_edges=add_reversed_edges,
    )


def extract_dct_subset(kernel_info, dct):
    node_types = DIRECTIVE_SUBSET_NODE_TYPES[dct]
    edge_types = DIRECTIVE_SUBSET_EDGE_TYPES[dct]

    x_mask_dict = {
        nt: [False] * len(kernel_info.nodes.get(nt, []))
        for nt in node_types
    }
    filtered_edge_dict = {et: set() for et in edge_types}

    target_nt = "array" if dct == "array_partition" else "region"
    
    for src, dst in kernel_info.edges.get((dct, "transform", target_nt), []):
        x_mask_dict[dct][src] = True
        x_mask_dict[target_nt][dst] = True

        if dct == "array_partition":
            array_alloca_edges = kernel_info.edges.get(("array", "alloca", "array"), [])
            for src_array, dst_instr in array_alloca_edges:
                if src_array == dst:
                    x_mask_dict["instr"][dst_instr] = True
            
            array_data_edges = kernel_info.edges.get(("array", "data", "instr"), [])
            for src_instr, dst_array in array_data_edges:
                if dst_array == dst:
                    x_mask_dict["instr"][src_instr] = True
        else:
            region_hrchy = kernel_info.region_hrchy.get(dst)
            if not region_hrchy:
                continue

            if dct in ["pipeline", "unroll"]:
                for nt in ["block", "instr"]:
                    for node in region_hrchy[nt]:
                        x_mask_dict[nt][node] = True

            if dct in ["pipeline", "loop_merge"]:
                levels = ["below"]
            elif dct == "loop_flatten":
                levels = ["above"]
            else:
                levels = ["above", "below"]

            for level in levels:
                for region in region_hrchy[level]:
                    x_mask_dict["region"][region] = True

    index_map = {}
    for nt, mask in x_mask_dict.items():
        index_map[nt] = {}
        idx = 0
        for i, m in enumerate(mask):
            if m:
                index_map[nt][i] = idx
                idx += 1
    
    for et in edge_types:
        st, rt, dt = et
        if rt == "hrchy_rev":
            continue

        src_node_subset = x_mask_dict[st]
        dst_node_subset = x_mask_dict[dt]
        src_index_map = index_map[st]
        dst_index_map = index_map[dt]

        for src, dst in kernel_info.edges.get(et, []):
            src_in, dst_in = src_node_subset[src], dst_node_subset[dst]
            if not src_in or not dst_in:
                continue
            src = src_index_map.get(src)
            dst = dst_index_map.get(dst)
            if not src or not dst:
                continue
            filtered_edge_dict[et].add((src, dst))
            if rt == "hrchy":
                rev_et = (dt, "hrchy_rev", st)
                if rev_et in edge_types:
                    filtered_edge_dict[rev_et].add((dst, src))
    
    filtered_edge_dict = {
        et: list(edge_index) 
        for et, edge_index in filtered_edge_dict.items()
    }

    for et, edge_index in filtered_edge_dict.items():
        if len(edge_index) == 0:
            filtered_edge_dict[et] = torch.empty((2, 0), dtype=torch.long)
            continue
        src, dst = zip(*edge_index)
        src = torch.tensor(src, dtype=torch.long)
        dst = torch.tensor(dst, dtype=torch.long)
        filtered_edge_dict[et] = torch.stack([src, dst], dim=0)

    for nt, mask in x_mask_dict.items():
        if len(mask) == 0:
            x_mask_dict[nt] = torch.empty(0, dtype=torch.bool)
        else:
            x_mask_dict[nt] = torch.tensor(mask, dtype=torch.bool)

    return x_mask_dict, filtered_edge_dict


def to_hls_hetero_data(
    kernel_info: VitisKernelInfo, 
    add_self_loops: bool = True,
    add_reversed_edges: bool = True,
) -> HLSHeteroData:
    data = HLSHeteroData()
    
    for nt in NODE_TYPES:
        nodes = kernel_info.nodes.get(nt)
        if not nodes:
            data[nt].x = torch.empty(
                (0, NODE_FEATURE_DIMS[nt]), dtype=torch.float32
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
            features.append(torch.tensor(attrs, dtype=torch.float32))

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

    for dt in DIRECTIVES:
        x_mask_dict, filtered_edge_dict = extract_dct_subset(kernel_info, dt)
        data.set_value_dict(f"{dt}_x_mask", x_mask_dict)
        data.set_value_dict(f"{dt}_filtered_edge", filtered_edge_dict)
        for nt, mask in x_mask_dict.items():
            data[nt].__setattr__(f"{dt}_x_mask", mask)
        for et, edge_index in filtered_edge_dict.items():
            data[et].__setattr__(f"{dt}_filtered_edge", edge_index)

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


def find_array_node(kernel_info, array_name, function_name):
    for node in kernel_info.nodes.get('array', []):
        if node.name == array_name:
            if (not node.function_name 
                or node.function_name == function_name):
                return node
    # If not found, search for array_name only
    for node in kernel_info.nodes.get('array', []):
        if node.name == array_name:
            return node
    return None


def find_region_node(kernel_info, region_name, function_name):
    for node in kernel_info.nodes.get('region', []):
        if node.name == region_name:
            if node.function_name == function_name:
                return node
    # If not found, search for region_name only
    for node in kernel_info.nodes.get('region', []):
        if node.name == region_name:
            return node
    return None


def include_directive_info(kernel_info, dct_config_path):
    if not os.path.exists(dct_config_path):
        raise FileNotFoundError(
            f"Directive config file not found: {dct_config_path}"
        )
    
    with open(dct_config_path, "r") as f:
        directive_config = json.load(f)
    
    directive_group_dict = directive_config.get("directives")
    if directive_group_dict is None:
        raise ValueError(
            f"Invalid directive config file: {dct_config_path}"
        )
    
    dir_node_types = DIRECTIVES
    dir_edge_types = [et for et in EDGE_TYPES if et[0] in dir_node_types]

    for directive_nt in dir_node_types:
        if directive_nt not in kernel_info.nodes:
            kernel_info.nodes[directive_nt] = []

    for directive_et in dir_edge_types:
        if directive_et not in kernel_info.edges:
            kernel_info.edges[directive_et] = []

    indices = {nt: 0 for nt in dir_node_types}

    for directive in directive_group_dict.values():
        directive_options = directive.get("possible_directives", [])
        if len(directive_options) <= 1:
            continue
        directive_type = directive.get("directive_type")
        if directive_type is None or directive_type not in dir_node_types:
            print(f"Warning: Skipping directive with type '{directive_type}'")
            continue
        function = directive.get("function", "")
        if directive_type == "array_partition":
            variable = directive.get("variable")
            if variable is None:
                print("Warning: No variable specified for array partition.")
                continue
            node = find_array_node(kernel_info, variable, function)
            if node is None:
                print(f"Warning: Variable '{variable}' (function '{function}') not found in nodes.")
                continue
            directive_id = indices[directive_type]
            indices[directive_type] += 1
            directive_attrs = {
                "partition_factor": 0,
                "partition_dim": [0, 0, 0, 0],
                "partition_type": [0, 0, 0],
            }
            directive_node = DirectiveNode(
                directive_type, function, variable, 
                directive_id, directive_attrs
            )
            kernel_info.nodes[directive_type].append(directive_node)
            kernel_info.edges[(directive_type, "transform", "array")].append(
                (directive_node.id, node.id)
            )
        else:
            label = directive.get("label", "")
            if not label:
                label = function
            node = find_region_node(kernel_info, label, function)
            if node is None:
                print(f"Warning: Region '{label}' (function '{function}') not found in nodes.")
                continue

            directive_id = indices[directive_type]
            indices[directive_type] += 1
            directive_attrs = {directive_type: 0}
            if directive_type == "unroll":
                directive_attrs["unroll_factor"] = 0
            directive_node = DirectiveNode(
                directive_type, function, label, 
                directive_id, directive_attrs
            )
            kernel_info.nodes[directive_type].append(directive_node)
            kernel_info.edges[(directive_type, "transform", "region")].append(
                (directive_node.id, node.id)
            )


def update_directive_info(
    kernel_info: VitisKernelInfo, 
    solution_dct_tcl_path: str
):
    def find_dct_node(hls_data, directive_type, function_name, target_name):
        for node in hls_data.nodes.get(directive_type, []):
            if node.function_name == function_name and node.target_name == target_name:
                return node

    directives = parse_tcl_directives_file(solution_dct_tcl_path)
    directives = [
        (dtype, dargs) for dtype, dargs in directives 
        if dtype in DIRECTIVES or dtype in ["inline", "dataflow"]
    ]

    for directive_type, directive_args in directives:
        if directive_type in ['inline', 'dataflow']:
            location = directive_args["location"]
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
            region_node.attrs[directive_type] = 1
            continue
        elif directive_type == "array_partition":
            function_name = directive_args.get("location", "")
            target_name = directive_args.get("variable")
            if target_name is None:
                print("Warning: No variable specified for array partition.")
                continue

            directive_node = find_dct_node(kernel_info, directive_type, function_name, target_name)
            if directive_node is None:
                print(f"Warning: Directive '{directive_type}' targeting "
                      f"'{function_name}/{target_name} not found in nodes.")
                continue
            
            partition_factor = int(directive_args.get("factor", 0))
            if partition_factor <= 0:
                array_node = find_array_node(kernel_info, target_name, function_name)
                if array_node is None:
                    print(f"Warning: Variable '{target_name}' "
                          f"(function '{function_name}') not found in nodes.")
                    continue
                partition_factor = array_node.total_size

            partition_dim = [0] * 4
            partition_dim[int(directive_args.get("dim", 0))] = 1

            partition_type = directive_args.get("type", "complete")
            if partition_type == "complete":
                partition_type = [1, 0, 0]
            elif partition_type == "block":
                partition_type = [0, 1, 0]
            else:
                partition_type = [0, 0, 1]

            directive_node.attrs["partition_type"] = partition_type
            directive_node.attrs["partition_factor"] = partition_factor
            directive_node.attrs["partition_dim"] = partition_dim
        else:
            directive_off = directive_args.get("off")
            if directive_off and directive_off.lower() == "true":
                continue

            location = directive_args["location"]
            if "/" in location:
                function_name, target_name = location.split("/")
            else:
                function_name = location
                target_name = location

            directive_node = find_dct_node(kernel_info, directive_type, function_name, target_name)
            if directive_node is None:
                print(f"Warning: Directive '{directive_type}' targeting "
                      f"'{function_name}/{target_name}' not found in nodes.")
                continue
        
            if directive_type == "unroll":
                unroll_factor = int(directive_args.get("factor", 0))
                if unroll_factor <= 0:
                    region_node = find_region_node(kernel_info, target_name, function_name)
                    if region_node is None:
                        print(f"Warning: Region '{location}' not found in nodes.")
                        continue
                    unroll_factor = region_node.attrs.get("max_trip_count", 1)
                directive_node.attrs["unroll_factor"] = unroll_factor
  
            directive_node.attrs[directive_type] = 1


def fit_one_hot_encoders(hls_data_dict: Dict[str, VitisKernelInfo]):
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
    data: HLSHeteroData,
    plt_type: Union[str, list] = "full",
    batched: bool = False
):
    import networkx as nx
    from torch_geometric.utils import to_networkx
    from matplotlib.lines import Line2D
    from matplotlib.patches import Patch

    node_color_dict = {
        "instr": "#419ada",
        "port": "#1ecf89",
        "array": "#ec3c94",
        "const": "#aa6df0",
        "block": "#c9a24e",
        "region": "#d84c4c",
    }
    edge_color_dict = {
        ("const", "data", "instr"): "#5fdde0",
        ("instr", "data", "instr"): "#00bcd4",
        ("port", "data", "instr"): "#00a1b3",
        ("array", "data", "instr"): "#008c9e",
        ("instr", "data", "const"): "#38bd59",
        ("array", "data", "const"): "#38bd59",
        ("block", "control", "instr"): "#ddb753",
        ("block", "control", "block"): "#ddb753",
        ("instr", "mem", "instr"): "#e73939",
        ("instr", "alloca", "array"): "#824ac2",
        ("region", "hrchy", "region"): "#aab2b9",
        ("region", "hrchy", "block"): "#aab2b9",
        ("block", "hrchy", "instr"): "#aab2b9",
        ("instr", "call", "instr"): "#ba68c8"
    }
    
    def plot(plt_type="full"):
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

        filtered_data = HLSHeteroData()
        for nt, x in data.x_dict.items():
            if nt not in node_types:
                x = torch.empty((0, NODE_FEATURE_DIMS[nt]), 
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
            ncolors.append(node_color_dict[nt])
            nlabels[node] = attrs["label"]

        ecolors = []
        for src, dst, attrs in G.edges(data=True):
            et = attrs.get("type")
            if et is None:
                continue
            ecolor = edge_color_dict.get(et)
            if ecolor is None:
                ecolor = "#000000"
            ecolors.append(ecolor)
            G.edges[src, dst]["color"] = ecolor

        node_legend = [
            Patch(color=color, label=nt) 
            for nt, color in node_color_dict.items() if nt in node_types
        ]
        edge_legend = [
            Line2D([0], [0], color=color, lw=2, label=f"{rt}: {st}→{dt}")
            for (st, rt, dt), color in edge_color_dict.items() 
            if (st, rt, dt) in edge_types
        ]

        if plt_type in ["full", "data", "hrchy"] and not batched:
            # Not batched large graphs
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

    if isinstance(plt_type, str):
        plt_type = [plt_type]

    for pt in plt_type:
        plot(pt)


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

    data = to_hls_hetero_data(kernel_info)

    plot_data(data, plt_type, batched=False)

    
