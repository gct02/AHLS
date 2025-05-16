import os
import pickle
import json
from copy import deepcopy
from typing import Dict, Union, Optional, List, Tuple, Any

import torch
import matplotlib.pyplot as plt
from torch import Tensor
from torch_geometric.data import HeteroData
from torch_geometric.data.hetero_data import NodeOrEdgeStorage
from torch_geometric.data.storage import EdgeStorage
from torch_geometric.utils import is_sparse
from sklearn.preprocessing import OneHotEncoder

from gnn.data.hls_data_collector import HLSData, DirectiveNode
from gnn.data.utils.parsers import parse_tcl_directives_file


NODE_TYPES = [
    "instr", "port", "array", 
    "const", "block", "region",
    "array_partition", "loop_flatten",
    "loop_merge", "pipeline", "unroll"
]
EDGE_TYPES = [
    # Data flow edges
    ("const", "data", "instr"), 
    ("instr", "data", "instr"),
    ("port", "data", "instr"), 
    ("array", "data", "instr"),

    # Edges representing GEP instructions with globals
    ("instr", "data", "const"),
    ("array", "data", "const"),

    # Control flow edges
    ("block", "control", "instr"), 
    ("block", "control", "block"), 

    # Call flow edges
    ("instr", "call", "instr"),

    # Memory edges (load->store)
    ("instr", "mem", "instr"),

    # Array allocation edges
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

    # HLS directive edges
    ("array_partition", "transform", "array"),
    ("loop_flatten", "transform", "region"),
    ("loop_merge", "transform", "region"),
    ("pipeline", "transform", "region"),
    ("unroll", "transform", "region")
] + [
    # Self-loops
    (nt, "to", nt) for nt in NODE_TYPES
]
METADATA = (NODE_TYPES, EDGE_TYPES)

DIRECTIVES = [
    "array_partition", "loop_flatten",
    "loop_merge", "pipeline", "unroll"
]

# Feature dimensions for each node type
NODE_FEATURE_DIMS = {
    "instr": 62, 
    "port": 7, 
    "array": 21,
    "const": 5,
    "block": 5,
    "region": 8,
    "array_partition": 9,
    "loop_flatten": 1,
    "loop_merge": 1,
    "pipeline": 1,
    "unroll": 2
}

DIRECTIVE_SUBSET_NODE_TYPES = {
    "array_partition": [
        "array_partition", "array", "instr"
    ],
    "unroll": [
        "unroll", "region", "block", "instr"
    ],
    "pipeline": [
        "pipeline", "region", "block", "instr", "array"
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
        ("unroll", "transform", "region"),
        ("region", "hrchy", "region"),
        ("region", "hrchy", "block"),
        ("region", "hrchy", "instr"),
        ("block", "hrchy", "instr"),
        ("region", "hrchy_rev", "region"),
        ("block", "hrchy_rev", "region"),
        ("instr", "hrchy_rev", "region"),
        ("instr", "hrchy_rev", "block")
    ],
    "pipeline": [
        ("pipeline", "transform", "region"),
        ("region", "hrchy", "region"),
        ("region", "hrchy", "block"),
        ("region", "hrchy", "instr"),
        ("block", "hrchy", "instr"),
        ("region", "hrchy_rev", "region"),
        ("block", "hrchy_rev", "region"),
        ("instr", "hrchy_rev", "region"),
        ("instr", "hrchy_rev", "block"),
        ("array", "data", "instr"),
        ("instr", "alloca", "array"),
        ("instr", "data", "instr"),
        ("block", "control", "instr"),
        ("block", "control", "block")
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
                if "filtered_edges" in key:
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
                if "filtered_edges" in key:
                    return value.size(1)
                else: 
                    return 0
        if 'batch' in key and isinstance(value, Tensor):
            return int(value.max()) + 1
        elif isinstance(store, EdgeStorage) and 'index' in key:
            return torch.tensor(store.size()).view(2, 1)
        else:
            return 0


def build_base_graphs(
    base_solutions: List[Tuple[str, str, str]],
    directive_config_dir: str,
    filtered: bool = False,
    encoder_output_path: Optional[str] = None,
) -> Dict[str, HLSData]:
    from gnn.data.utils.transform import process_ir
    
    hls_data_dict = {}
    for solution_dir, benchmark, top_level_name in base_solutions:
        ir_dir = f"{solution_dir}/IRs" if filtered else f"{solution_dir}/.autopilot/db"
        ir_path = f"{ir_dir}/a.g.ld.5.gdce.bc"
        metadata_path = f"{ir_dir}/metadata.json"

        process_ir(ir_path, metadata_path)
        if not os.path.exists(metadata_path):
            print(f"Metadata file not found: {metadata_path}")
            continue

        hls_data = HLSData(
            solution_dir, top_level_name, metadata_path, benchmark,
            filtered=filtered
        )
        directive_config_path = os.path.join(
            directive_config_dir, f"{benchmark.lower()}.json"
        )
        include_directives(hls_data, directive_config_path)
        hls_data_dict[benchmark] = hls_data
            
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
    add_reversed_edges: bool = True,
    feature_names_dict: Optional[Dict[str, List[str]]] = None
) -> Union[HLSHeteroData, HLSData]:
    hls_data = deepcopy(base_hls_data)
    update_directive_features(hls_data, directives_tcl)
    if output_pyg:
        return to_pyg(
            hls_data, 
            add_self_loops=add_self_loops,
            add_reversed_edges=add_reversed_edges,
            feature_names_dict=feature_names_dict
        )
    return hls_data


def get_directive_subset(hls_data, dir_type):
    node_types = DIRECTIVE_SUBSET_NODE_TYPES[dir_type]
    edge_types = DIRECTIVE_SUBSET_EDGE_TYPES[dir_type]

    x_mask_dict = {
        nt: [False] * len(hls_data.nodes.get(nt, []))
        for nt in node_types
    }
    filtered_edge_index_dict = {et: set() for et in edge_types}

    target_nt = "array" if dir_type == "array_partition" else "region"
    
    for src, dst in hls_data.edges.get((dir_type, "transform", target_nt), []):
        x_mask_dict[dir_type][src] = True
        x_mask_dict[target_nt][dst] = True

        if dir_type == "array_partition":
            for src_array, dst_instr in hls_data.edges.get(("array", "data", "instr"), []):
                if src_array == dst:
                    x_mask_dict["instr"][dst_instr] = True
            for src_instr, dst_array in hls_data.edges.get(("instr", "alloca", "array"), []):
                if dst_array == dst:
                    x_mask_dict["instr"][src_instr] = True
        else:
            region_hrchy = hls_data.region_hrchy.get(dst)
            if not region_hrchy:
                continue

            if dir_type == "unroll":
                subtypes = ["block", "instr"]
            elif dir_type == "pipeline":
                subtypes = ["block", "instr", "array"]
            else:
                subtypes = []

            for subtype in subtypes:
                for node in region_hrchy[subtype]:
                    x_mask_dict[subtype][node] = True

            if dir_type in ["pipeline", "loop_merge"]:
                levels = ["below"]
            elif dir_type == "loop_flatten":
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
        src_nt, rel, dst_nt = et
        if rel == "hrchy_rev":
            continue

        src_node_subset = x_mask_dict[src_nt]
        dst_node_subset = x_mask_dict[dst_nt]
        src_index_map = index_map[src_nt]
        dst_index_map = index_map[dst_nt]

        for src, dst in hls_data.edges.get(et, []):
            src_in, dst_in = src_node_subset[src], dst_node_subset[dst]
            if not src_in or not dst_in:
                continue
            src = src_index_map.get(src)
            dst = dst_index_map.get(dst)
            if not src or not dst:
                continue
            filtered_edge_index_dict[et].add((src, dst))
            if rel == "hrchy":
                rev_et = (dst_nt, "hrchy_rev", src_nt)
                if rev_et in edge_types:
                    filtered_edge_index_dict[rev_et].add((dst, src))
    
    filtered_edge_index_dict = {
        et: list(edge_index) 
        for et, edge_index in filtered_edge_index_dict.items()
    }

    for et, edge_index in filtered_edge_index_dict.items():
        if len(edge_index) == 0:
            filtered_edge_index_dict[et] = torch.empty((2, 0), dtype=torch.long)
            continue
        src, dst = zip(*edge_index)
        src = torch.tensor(src, dtype=torch.long)
        dst = torch.tensor(dst, dtype=torch.long)
        edge_index_tensor = torch.stack([src, dst], dim=0)

        # Sort the edge index by destination node
        sorted_indices = edge_index_tensor[1].argsort()
        filtered_edge_index_dict[et] = edge_index_tensor[:, sorted_indices]

    for nt, mask in x_mask_dict.items():
        if len(mask) == 0:
            x_mask_dict[nt] = torch.empty(0, dtype=torch.bool)
        else:
            x_mask_dict[nt] = torch.tensor(mask, dtype=torch.bool)

    return x_mask_dict, filtered_edge_index_dict


def to_pyg(
    hls_data: HLSData, 
    add_self_loops: bool = True,
    add_reversed_edges: bool = True,
    feature_names_dict: Optional[Dict[str, List[str]]] = None
) -> HLSHeteroData:
    data = HLSHeteroData()
    
    for nt in NODE_TYPES:
        nodes = hls_data.nodes.get(nt)
        if not nodes:
            data[nt].x = torch.empty(
                (0, NODE_FEATURE_DIMS[nt]), dtype=torch.float32
            )
            data[nt].label = []
            continue

        if feature_names_dict is not None and nt not in feature_names_dict:
            feature_names = []
            for key, value in nodes[0].attrs.items():
                if isinstance(value, list):
                    value_size = len(value)
                    for i in range(value_size):
                        feature_names.append(f"{key}_{i}")
                else:
                    feature_names.append(key)
            feature_names_dict[nt] = feature_names

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
        edges = hls_data.edges.get(et)
        if edges:
            src, dst = zip(*edges)
            src = torch.tensor(src, dtype=torch.long)
            dst = torch.tensor(dst, dtype=torch.long)
            data[et].edge_index = torch.stack([src, dst], dim=0)
        else:
            data[et].edge_index = torch.empty((2, 0), dtype=torch.long)

    for dt in DIRECTIVES:
        x_mask_dict, filtered_edge_index_dict = get_directive_subset(hls_data, dt)
        data.set_value_dict(f"{dt}_x_mask", x_mask_dict)
        data.set_value_dict(f"{dt}_filtered_edges", filtered_edge_index_dict)
        for nt, mask in x_mask_dict.items():
            data[nt].__setattr__(f"{dt}_x_mask", mask)
            data[nt].__setitem__(f"{dt}_x_mask", mask)
        for et, edge_index in filtered_edge_index_dict.items():
            data[et].__setattr__(f"{dt}_filtered_edges", edge_index)
            data[et].__setitem__(f"{dt}_filtered_edges", edge_index)

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


def find_array(hls_data, array_name, function_name):
    for node in hls_data.nodes.get('array', []):
        if node.name == array_name:
            if (not node.function_name 
                or node.function_name == function_name):
                return node
    # If not found, search for array_name only
    for node in hls_data.nodes.get('array', []):
        if node.name == array_name:
            return node
    return None


def find_region(hls_data, region_name, function_name):
    for node in hls_data.nodes.get('region', []):
        if node.name == region_name:
            if node.function_name == function_name:
                return node
    # If not found, search for region_name only
    for node in hls_data.nodes.get('region', []):
        if node.name == region_name:
            return node
    return None


def include_directives(hls_data, directive_config_path):
    if not os.path.exists(directive_config_path):
        raise FileNotFoundError(
            f"Directive config file not found: {directive_config_path}"
        )
    
    with open(directive_config_path, "r") as f:
        directive_config = json.load(f)
    
    directive_group_dict = directive_config.get("directives")
    if directive_group_dict is None:
        raise ValueError(
            f"Invalid directive config file: {directive_config_path}"
        )
    
    dir_node_types = DIRECTIVES
    dir_edge_types = [et for et in EDGE_TYPES if et[0] in dir_node_types]

    for directive_nt in dir_node_types:
        if directive_nt not in hls_data.nodes:
            hls_data.nodes[directive_nt] = []

    for directive_et in dir_edge_types:
        if directive_et not in hls_data.edges:
            hls_data.edges[directive_et] = []

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
            node = find_array(hls_data, variable, function)
            if node is None:
                print(f"Warning: Variable '{variable}' (function '{function}') not found in nodes.")
                continue
            directive_id = indices[directive_type]
            indices[directive_type] += 1
            directive_attrs = {
                "array_partition": 0,
                "partition_factor": 0,
                "partition_dim": [0, 0, 0, 0],
                "partition_type": [0, 0, 0],
            }
            directive_node = DirectiveNode(
                directive_type, function, variable, 
                directive_id, directive_attrs
            )
            hls_data.nodes[directive_type].append(directive_node)
            hls_data.edges[(directive_type, "transform", "array")].append(
                (directive_node.id, node.id)
            )
        else:
            label = directive.get("label", "")
            if not label:
                label = function
            node = find_region(hls_data, label, function)
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
            hls_data.nodes[directive_type].append(directive_node)
            hls_data.edges[(directive_type, "transform", "region")].append(
                (directive_node.id, node.id)
            )


def update_directive_features(hls_data: HLSData, directives_tcl: str):
    def find_directive_node(hls_data, directive_type, function_name, target_name):
        for node in hls_data.nodes.get(directive_type, []):
            if node.function_name == function_name and node.target_name == target_name:
                return node

    directives = parse_tcl_directives_file(directives_tcl)
    directives = [
        (dtype, dargs) 
        for dtype, dargs in directives 
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
            
            region_node = find_region(hls_data, target_name, function_name)
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

            directive_node = find_directive_node(hls_data, directive_type, function_name, target_name)
            if directive_node is None:
                print(f"Warning: Directive '{directive_type}' targeting "
                      f"'{function_name}/{target_name} not found in nodes.")
                continue
            
            partition_factor = int(directive_args.get("factor", 0))
            if partition_factor <= 0:
                array_node = find_array(hls_data, target_name, function_name)
                if array_node is None:
                    print(f"Warning: Variable '{target_name}' "
                          f"(function '{function_name}') not found in nodes.")
                    continue
                array_size = array_node.attrs["total_size"]
                partition_factor = array_size

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

            directive_node = find_directive_node(hls_data, directive_type, function_name, target_name)
            if directive_node is None:
                print(f"Warning: Directive '{directive_type}' targeting "
                      f"'{function_name}/{target_name}' not found in nodes.")
                continue
        
            if directive_type == "unroll":
                unroll_factor = int(directive_args.get("factor", 0))
                if unroll_factor <= 0:
                    region_node = find_region(hls_data, target_name, function_name)
                    if region_node is None:
                        print(f"Warning: Region '{location}' not found in nodes.")
                        continue
                    unroll_factor = region_node.attrs.get("max_trip_count", 1)
                directive_node.attrs["unroll_factor"] = unroll_factor
  
        directive_node.attrs[directive_type] = 1


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
    
    def plot(plot_type="full"):
        if plot_type == "full":
            ntypes = node_colors.keys()
            etypes = edge_colors.keys()
        elif plot_type == "call":
            ntypes = ["instr"]
            etypes = [et for et in edge_colors.keys() if et[1] == "call"]
        elif plot_type == "control":
            ntypes = ["block", "instr"]
            etypes = [et for et in edge_colors.keys() if et[1] in ["control"] and et[2] == "block"]
        elif plot_type == "data":
            ntypes = ["instr", "const", "port", "array"]
            etypes = [et for et in edge_colors.keys() if et[1] in ["data", "mem", "alloca"]]
        elif plot_type == "mem":
            ntypes = ["instr", "array"]
            etypes = [et for et in edge_colors.keys() if et[1] in ["mem", "alloca"]]
        elif plot_type == "hrchy":
            ntypes = ["instr", "block", "region"]
            etypes = [et for et in edge_colors.keys() if et[1] == "hrchy"]
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
    parser.add_argument("-t", "--top-level")
    parser.add_argument("-b", "--benchmark", default="")
    parser.add_argument("-p", "--plot", default="full")
    parser.add_argument("-f", "--filtered", action="store_true")
    args = parser.parse_args()

    base_solution_dir = args.base_solution_dir[0]
    top_level_name = args.top_level
    benchmark = args.benchmark
    plot_type = args.plot
    filtered = args.filtered

    base_solutions = [(base_solution_dir, benchmark, top_level_name)]
    base_hls_data = build_base_graphs(base_solutions, filtered)[benchmark]

    base_data = to_pyg(base_hls_data)
    plot_data(base_data, plot_type, batched=False)

    
