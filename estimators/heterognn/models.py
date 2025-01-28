from typing import Dict, Union, List, Tuple, Optional

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn.pool import SAGPooling
from torch_geometric.nn.conv import HGTConv, GATConv
from torch_geometric.nn.dense import HeteroLinear, Linear
from torch_geometric.data import HeteroData

class HGT(nn.Module):
    def __init__(
        self,
        metadata: Tuple[List[str], List[Tuple[str, str, str]]],
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        hid_dim_1: int,
        heads_1: int,
        hid_dim_2: Optional[int] = None,
        heads_2: Optional[int] = None,
        k: int = 8,
        dropout: float = 0.1,
        norm: bool = True
    ):
        super(HGT, self).__init__()

        self.normalize = norm
        self.k = k

        if hid_dim_2 is None:
            hid_dim_2 = hid_dim_1
            
        if heads_2 is None:
            heads_2 = heads_1

        self.conv1 = HGTConv(
            metadata=metadata,
            in_channels=in_channels, out_channels=hid_dim_1,
            heads=heads_1
        )
        self.conv2 = HGTConv(
            metadata=metadata,
            in_channels=hid_dim_1, out_channels=hid_dim_1,
            heads=heads_1
        )
        self.conv3 = HGTConv(
            metadata=metadata,
            in_channels=hid_dim_1, out_channels=hid_dim_2,
            heads=heads_2
        )
        self.dropout = nn.Dropout(dropout)

        if norm:
            self.norm = nn.ModuleDict()
            for node_type in metadata[0]:
                self.norm[node_type] = nn.LayerNorm(hid_dim_1)
        
        if hid_dim_2 > 2*out_channels:
            hid_dim_3 = hid_dim_2 // 2
        else:
            hid_dim_3 = hid_dim_2

        self.pool = SAGPooling(hid_dim_2, ratio=k, GNN=GATConv)

        self.fc1 = Linear(k*hid_dim_2, hid_dim_2)
        self.fc2 = Linear(hid_dim_2, hid_dim_3)
        self.fc3 = Linear(hid_dim_3, out_channels)

    def forward(
        self,
        data: HeteroData,
    ) -> Tensor:
        x_dict, edge_index_dict = data.x_dict, data.edge_index_dict

        # 1st HGT layer
        h = self.conv1(x_dict, edge_index_dict)
        if self.normalize:
            for k in h.keys():
                h[k] = self.norm[k](h[k])
        h = {k: self.dropout(v) for k, v in h.items()}
        h = {k: F.gelu(v) for k, v in h.items()}

        # 2nd HGT layer
        h = self.conv2(h, edge_index_dict)
        h = {k: self.dropout(v) for k, v in h.items()}
        h = {k: F.gelu(v) for k, v in h.items()}

        # 3rd HGT layer
        h = self.conv3(h, edge_index_dict)
        h = {k: F.gelu(v) for k, v in h.items()}

        # Node embeddings aggregation
        # h_agg = torch.cat([v for _, v in h.items()], dim=0)
        # h_agg = global_mean_pool(h_agg, None).squeeze(0)

        # Create a homogeneous version of the input graph
        # (necessary for the SAGPooling layer)
        transformed_data = HeteroData()
        for k, v in h.items():
            transformed_data[k].x = v
        for k, v in edge_index_dict.items():
            transformed_data[k].edge_index = v

        homogeneous = transformed_data.to_homogeneous()
        # homogeneous = homogeneous.sort(sort_by_row=False)
        h_hom = homogeneous.x
        edge_index_hom = homogeneous.edge_index

        # Apply SAGPooling to aggregate node embeddings from all nodes
        # into self.k representative nodes (k=8 by default) using GATConv
        h_agg = self.pool(h_hom, edge_index_hom)[0]
        
        # Flatten the node embeddings into a one-dimensional tensor
        h_agg = h_agg.flatten()

        # Fully connected layers
        h_agg = F.gelu(self.fc1(h_agg))
        h_agg = F.gelu(self.fc2(h_agg))
        h_agg = F.gelu(self.fc3(h_agg))

        # Avoid NaNs (should not happen, but just in case)
        h_agg = h_agg.nan_to_num_()

        print(h_agg)

        return h_agg