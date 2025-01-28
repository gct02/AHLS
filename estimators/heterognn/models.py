from typing import Dict, Union, List, Tuple, Optional
from torch_geometric.typing import EdgeType, NodeType

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn.conv import HGTConv
from torch_geometric.data import HeteroData

class HGT(nn.Module):
    def __init__(
        self,
        metadata: Tuple[List[str], List[Tuple[str, str, str]]],
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        hid_dim1: int,
        hid_dim2: Optional[int] = None,
        heads: int = 1,
        dropout: float = 0.1,
        norm: bool = True
    ):
        super(HGT, self).__init__()

        self.metadata = metadata
        self.node_types = metadata[0]
        self.edge_types = metadata[1]
        self.normalize = norm

        if hid_dim2 is None:
            hid_dim2 = hid_dim1

        self.conv1 = HGTConv(
            metadata=metadata,
            in_channels=in_channels, out_channels=hid_dim1,
            heads=heads
        )
        self.conv2 = HGTConv(
            metadata=metadata,
            in_channels=hid_dim1, out_channels=hid_dim1,
            heads=heads
        )
        self.conv3 = HGTConv(
            metadata=metadata,
            in_channels=hid_dim1, out_channels=hid_dim2,
            heads=heads
        )
        self.dropout = nn.Dropout(dropout)

        if norm:
            self.norm = nn.ModuleDict()
            for node_type in metadata[0]:
                self.norm[node_type] = nn.LayerNorm(hid_dim1)
        
        self.fc1 = nn.Linear(hid_dim2, hid_dim2)
        self.fc2 = nn.Linear(hid_dim2, out_channels)

    def forward(
        self,
        data: HeteroData
    ) -> Tensor:
        x_dict, edge_index_dict = data.x_dict, data.edge_index_dict

        h = self.conv1(x_dict, edge_index_dict)
        if self.normalize:
            for k in h.keys():
                h[k] = self.norm[k](h[k])
        h = {k: self.dropout(v) for k, v in h.items()}

        h = self.conv2(h, edge_index_dict)
        h = {k: self.dropout(v) for k, v in h.items()}

        h = self.conv3(h, edge_index_dict)

        # Concatenate all node embeddings 
        # TODO: use a more sophisticated aggregation method (e.g. attention)
        h_agg = torch.cat([v for _, v in h.items()], dim=0)

        # Avoid NaNs (should not happen, but just in case)
        h_agg = h_agg.nan_to_num()

        h_agg = h_agg.mean(dim=0)
        h_agg = F.gelu(self.fc1(h_agg))
        h_agg = self.fc2(h_agg)

        print(h_agg)

        return h_agg