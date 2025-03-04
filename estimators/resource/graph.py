import json
import sys
import torch
import matplotlib.pyplot as plt
import networkx as nx
from torch_geometric.data import Data
from torch_geometric.utils import to_networkx

NODE_TYPE_ENCODING = {
    "VARIABLE": [1, 0, 0, 0, 0, 0],
    "CONSTANT": [0, 1, 0, 0, 0, 0],
    "INSTRUCTION": [0, 0, 1, 0, 0, 0],
    "ARRAY": [0, 0, 0, 1, 0, 0],
    "LOOP": [0, 0, 0, 0, 1, 0],
    "FUNCTION": [0, 0, 0, 0, 0, 1],
}

EDGE_TYPE_ENCODING = {
    "INPUT": [1, 0, 0, 0, 0],  # Data flow edges
    "OUTPUT": [1, 0, 0, 0, 0],
    "CAST": [0, 1, 0, 0, 0],   # Type conversion edges
    "LOAD": [0, 0, 1, 0, 0],   # Memory access edges
    "STORE": [0, 0, 1, 0, 0],
    "LOOP": [0, 0, 0, 1, 0],   # Membership and containment edges
    "FUNCTION": [0, 0, 0, 1, 0],
    "SELF": [0, 0, 0, 0, 1],   # Self-loop edges
}

NODE_FEATURE_DIM = 24
EDGE_FEATURE_DIM = 5

def load_dfg_from_json(filename):
    with open(filename, "r") as file:
        dfg_dict = json.load(file)
    return dfg_dict

def build_node_features(dfg_dict):
    LLVM_NUM_BIN_OPS = 18
    LLVM_FIRST_BIN_OP = 11
    LLVM_LAST_BIN_OP = 28

    MAX_ARRAY_DIMS = 4

    def get_encoded_type_id(type_id):
        if type_id == 11:
            return [1, 0, 0]  # Int
        elif type_id in range(1, 7):
            return [0, 1, 0]  # Float
        else:
            return [0, 0, 1]  # Other
        
    def get_encoded_partition_type(partition_type):
        if partition_type == "complete":
            return [1, 0, 0, 0]
        elif partition_type == "block":
            return [0, 1, 0, 0]
        elif partition_type == "cyclic":
            return [0, 0, 1, 0]
        else:
            return [0, 0, 0, 1]
        
    def get_complete_partitioning_factor(array_dims, partition_dim=0):
        if partition_dim == 0:
            return sum(array_dims)
        return array_dims[partition_dim - 1]

    num_nodes = dfg_dict["NumNodes"]
    node_dict = dfg_dict["Nodes"]
    variable_and_const_nodes = node_dict["VariablesAndConstants"]
    instruction_nodes = node_dict["Instructions"]
    array_nodes = node_dict["Arrays"]
    loop_nodes = node_dict["Loops"]
    function_nodes = node_dict["Functions"]

    node_features = [[0] * NODE_FEATURE_DIM for _ in range(num_nodes)]

    for node in variable_and_const_nodes:
        node_type = node["NodeType"]
        enc_node_type = NODE_TYPE_ENCODING[node_type]
        enc_type_id = get_encoded_type_id(node["TypeID"])
        bitwidth = node["Bitwidth"]
        features = enc_node_type + enc_type_id + [bitwidth]
        features += [0] * (NODE_FEATURE_DIM - len(features))
        node_index = node["ID"]
        node_features[node_index] = features
        
    for node in instruction_nodes:
        node_type = node["NodeType"]
        enc_node_type = NODE_TYPE_ENCODING[node_type]
        opcode = node["Opcode"]
        enc_opcode = [0] * LLVM_NUM_BIN_OPS
        if opcode >= LLVM_FIRST_BIN_OP and opcode <= LLVM_LAST_BIN_OP:
            enc_opcode[opcode - LLVM_FIRST_BIN_OP] = 1
        features = enc_node_type + enc_opcode
        features += [0] * (NODE_FEATURE_DIM - len(features))
        node_index = node["ID"]
        node_features[node_index] = features

    for node in array_nodes:
        node_type = node["NodeType"]
        enc_node_type = NODE_TYPE_ENCODING[node_type]
        enc_elem_type = get_encoded_type_id(node["ElementTypeID"])
        elem_bitwidth = node["ElementBitwidth"]

        num_dims = node["NumDims"]
        dims = node["NumElementsPerDim"]
        if num_dims > MAX_ARRAY_DIMS:
            max_dim = dims[MAX_ARRAY_DIMS - 1]
            for i in range(MAX_ARRAY_DIMS, num_dims):
                max_dim *= dims[i]
            dims = dims[:MAX_ARRAY_DIMS]
        elif num_dims < MAX_ARRAY_DIMS:
            dims += [0] * (MAX_ARRAY_DIMS - num_dims)

        partition_type = node["PartitionType"]
        partition_dim = node["PartitionDim"]
        if partition_type == "complete":
            partition_factor = get_complete_partitioning_factor(
                node["NumElementsPerDim"], partition_dim
            )
        else:
            partition_factor = node["PartitionFactor"]
        enc_partition_type = get_encoded_partition_type(partition_type)

        enc_partition_dim = [0] * MAX_ARRAY_DIMS
        enc_partition_dim[min(partition_dim, MAX_ARRAY_DIMS) - 1] = 1

        features = (enc_node_type + enc_elem_type + [elem_bitwidth] + dims
                    + enc_partition_type + [partition_factor] + enc_partition_dim)
        features += [0] * (NODE_FEATURE_DIM - len(features))
        node_index = node["ID"]
        node_features[node_index] = features

    for node in loop_nodes:
        node_type = node["NodeType"]
        enc_node_type = NODE_TYPE_ENCODING[node_type]
        depth = node["Depth"]
        trip_count = node["TripCount"]
        unrolled = 1 if node["Unrolled"] else 0
        pipelined = 1 if node["Pipelined"] else 0
        flattened = 1 if node["Flattened"] else 0
        merged = 1 if node["Merged"] else 0
        factor = node["UnrollFactor"]
        if factor == 0:
            factor = trip_count
        features = enc_node_type + [depth, trip_count, unrolled, factor, 
                                    pipelined, flattened, merged]
        features += [0] * (NODE_FEATURE_DIM - len(features))
        node_index = node["ID"]
        node_features[node_index] = features

    for node in function_nodes:
        node_type = node["NodeType"]
        enc_node_type = NODE_TYPE_ENCODING[node_type]
        pipelined = 1 if node["Pipelined"] else 0
        merged = 1 if node["Merged"] else 0
        features = enc_node_type + [pipelined, merged]
        features += [0] * (NODE_FEATURE_DIM - len(features))
        node_index = node["ID"]
        node_features[node_index] = features

    node_features = [torch.tensor(x, dtype=torch.float) for x in node_features]
    node_features = torch.stack(node_features, dim=0)
    return node_features

def build_edges(dfg_dict):
    edge_list = dfg_dict["Edges"]
    edge_features = []
    edge_index = []

    for edge in edge_list:
        src = edge["Source"]
        dst = edge["Target"]
        enc_edge_type = EDGE_TYPE_ENCODING[edge["EdgeType"]]
        edge_features.append(torch.tensor(enc_edge_type, dtype=torch.float))
        edge_index.append(torch.tensor([src, dst], dtype=torch.long))

    # Add self-loop edges
    num_nodes = dfg_dict["NumNodes"]
    for i in range(num_nodes):
        edge_features.append(torch.tensor(EDGE_TYPE_ENCODING["SELF"], dtype=torch.float))
        edge_index.append(torch.tensor([i, i], dtype=torch.long))
    
    edge_features = torch.stack(edge_features, dim=0)
    edge_index = torch.stack(edge_index, dim=0).transpose(0, 1)
    
    return edge_index, edge_features

def build_dfg_from_dict(dfg_dict):
    node_features = build_node_features(dfg_dict)
    edge_index, edge_features = build_edges(dfg_dict)
    graph = Data(x=node_features, edge_index=edge_index, edge_attr=edge_features)
    return graph

def build_dfg(dfg_file):
    dfg_dict = load_dfg_from_json(dfg_file)
    return build_dfg_from_dict(dfg_dict)

def plot_dfg(dfg, seed=42):
    if isinstance(dfg, dict):
        dfg = build_dfg_from_dict(dfg)
    G = to_networkx(dfg, remove_self_loops=True)
    pos = nx.spring_layout(G, seed=seed)
    nx.draw(
        G, pos=pos, with_labels=True, node_size=80, 
        font_size=9, width=0.8, arrowsize=7,
        node_color="skyblue", edge_color="gray",
        font_color="black", font_weight="bold",
        alpha=0.9
    )
    plt.show()

if __name__ == "__main__":
    dfg = build_dfg(sys.argv[1])
    plot_dfg(dfg)