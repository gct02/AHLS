from typing import List, Dict, Optional

import torch.nn as nn
from torch import Tensor

from torch_geometric.nn import (
    HeteroConv, 
    SAGEConv, 
    LayerNorm
)
from torch_geometric.typing import NodeType, EdgeType


class HeteroSAGEConv(nn.Module):
    def __init__(
        self, 
        in_channels: int, 
        out_channels: int, 
        node_types: List[NodeType],
        edge_types: List[EdgeType], 
        dropout: float = 0.0, 
        is_output_layer: bool = False
    ):
        super().__init__()
        self.conv = HeteroConv({
            et: SAGEConv(in_channels, out_channels)
            for et in edge_types
        })
        if not is_output_layer:
            self.prelu = nn.PReLU()
            self.dropout = nn.Dropout(dropout)
            self.norm_dict = nn.ModuleDict({
                nt: LayerNorm(out_channels)
                for nt in node_types
            })

        self.is_output_layer = is_output_layer
        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        self.conv.reset_parameters()
        if not self.is_output_layer:
            self.prelu.reset_parameters()
            for norm in self.norm_dict.values():
                norm.reset_parameters()

    def forward(
        self, 
        x_dict: Dict[NodeType, Tensor], 
        edge_index_dict: Dict[EdgeType, Tensor],
        batch_dict: Dict[NodeType, Tensor],
        batch_size: Optional[int] = None
    ) -> Dict[NodeType, Tensor]:
        x_dict = self.conv(x_dict, edge_index_dict)
        if not self.is_output_layer:
            for nt, x in x_dict.items():
                x = self.dropout(self.prelu(x))
                x = self.norm_dict[nt](
                    x, batch_dict[nt], 
                    batch_size=batch_size
                )
                x_dict[nt] = x
        return x_dict
    
