from typing import Dict, Union, List, Tuple, Optional

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn.conv import HGTConv
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
        dropout: float = 0.1,
        norm: bool = True
    ):
        super(HGT, self).__init__()

        self.normalize = norm
        self.node_types = metadata[0]
        self.edge_types = metadata[1]
        self.num_node_types = len(self.node_types)
        self.num_edge_types = len(self.edge_types)
        self.type_to_num = {
            node_type: i for i, node_type in enumerate(self.node_types)
        }

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
        
        self.lin_agg_1 = HeteroLinear(
            hid_dim_2, hid_dim_2, 
            num_types=self.num_edge_types, 
            is_sorted=True
        )
        hid_dim_3 = hid_dim_2 // 2 if hid_dim_2 // 2 > out_channels else hid_dim_2
        self.lin_agg_2 = Linear(hid_dim_2, hid_dim_3)
        self.lin_out = Linear(hid_dim_3, out_channels)

    def forward(
        self,
        data: HeteroData,
        type_vec: Optional[Tensor] = None
    ) -> Tensor:
        x_dict, edge_index_dict = data.x_dict, data.edge_index_dict

        h = self.conv1(x_dict, edge_index_dict)
        if self.normalize:
            for k in h.keys():
                h[k] = self.norm[k](h[k])
        h = {k: self.dropout(v) for k, v in h.items()}
        h = {k: F.gelu(v) for k, v in h.items()}

        h = self.conv2(h, edge_index_dict)
        h = {k: self.dropout(v) for k, v in h.items()}
        h = {k: F.gelu(v) for k, v in h.items()}

        h = self.conv3(h, edge_index_dict)
        h = {k: F.gelu(v) for k, v in h.items()}

        if type_vec is None:
            type_vec = [
                torch.tensor([self.type_to_num[k]] * v.shape[0], device=v.device)
                for k, v in h.items()
            ]
            type_vec = torch.cat(type_vec, dim=0)

        # Concatenate all node embeddings 
        # TODO: try a more sophisticated aggregation method (e.g. attention)
        h_agg = torch.cat([v for _, v in h.items()], dim=0)

        h_agg = F.gelu(self.lin_agg_1(h_agg, type_vec))
        h_agg = h_agg.mean(dim=0)
        h_agg = F.gelu(self.lin_agg_2(h_agg))
        h_agg = self.lin_out(h_agg)

        # Avoid NaNs (should not happen, but just in case)
        h_agg = h_agg.nan_to_num_()

        print(h_agg)

        return h_agg