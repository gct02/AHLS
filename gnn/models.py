from typing import Union, Dict, List, Optional

import torch
import torch.nn as nn
from torch import Tensor
from torch_geometric.nn import (
    Linear,
    global_add_pool, 
    global_max_pool,
    global_mean_pool
)
from torch_geometric.typing import Metadata, NodeType, EdgeType

from gnn.layers import HeteroSAGEConv


class HeteroGraphSAGE(nn.Module):
    def __init__(
        self, 
        in_channels: int, 
        hidden_channels: int, 
        num_layers: int, 
        out_channels: int,
        node_types: List[NodeType], 
        edge_types: List[EdgeType],
        dropout: float = 0.0
    ):
        super().__init__()

        self.num_layers = num_layers

        self.convs = nn.ModuleList()
        for i in range(num_layers):
            # Since blocks do not come with features (we learn them 
            # via the GNN), we need to exclude it as source type in
            # the first iteration:
            if i == 0:
                layer_edge_types = [
                    et for et in edge_types 
                    if et[0] != 'block'
                ]
            else:
                layer_edge_types = edge_types

            conv = HeteroSAGEConv(
                in_channels if i == 0 else hidden_channels,
                out_channels if i == num_layers - 1 else hidden_channels,
                node_types=node_types,
                edge_types=layer_edge_types,
                dropout=dropout,
                is_output_layer=i == num_layers - 1,
            )
            self.convs.append(conv)
        
        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        for conv in self.convs:
            conv.reset_parameters()

    def forward(
        self, 
        x_dict: Dict[NodeType, Tensor],
        edge_index_dict: Dict[EdgeType, Tensor],
        batch_dict: Dict[NodeType, Tensor],
        batch_size: Optional[int] = None
    ) -> Dict[NodeType, Tensor]:
        # For the first layer, we don't use residual connections
        # for the 'block' node type, as its features are not defined.
        out_dict = self.convs[0](
            x_dict, edge_index_dict, batch_dict, 
            batch_size=batch_size
        )
        for nt, out in out_dict.items():
            if out.size(-1) == x_dict[nt].size(-1) and nt != 'block':
                x_dict[nt] = out + x_dict[nt]
            else:
                x_dict[nt] = out

        for i in range(1, self.num_layers):
            out_dict = self.convs[i](
                x_dict, edge_index_dict, batch_dict, 
                batch_size=batch_size
            )
            for nt, out in out_dict.items():
                if out.size(-1) == x_dict[nt].size(-1):
                    x_dict[nt] = out + x_dict[nt]
                else:
                    x_dict[nt] = out
                
        return x_dict


class HLSQoREstimator(nn.Module):
    r"""Model for estimating HLS QoR using a heterogeneous graph neural network.

    Args:
        in_channels (Union[int, Dict[NodeType, int]]): Input feature dimension or 
            a dictionary mapping node types to their input feature dimensions.
        hidden_channels (int): Hidden feature dimension for the GNN layers.
        num_layers (int): Number of GNN layers.
        out_channels (int): Output feature dimension.
        metadata (Metadata): Metadata containing node and edge types.
        dropout_gnn (float, optional): Dropout rate for GNN layers. Default is 0.0.
        dropout_mlp (float, optional): Dropout rate for MLP layers. Default is 0.0.
    """
    def __init__(
        self,
        in_channels: Union[int, Dict[NodeType, int]],
        hidden_channels: int,
        num_layers: int,
        out_channels: int,
        metadata: Metadata,
        dropout_gnn: float = 0.0,
        dropout_mlp: float = 0.0
    ):
        super().__init__()

        self.node_types = metadata[0]
        self.edge_types = metadata[1]

        if isinstance(in_channels, int):
            in_channels = {nt: in_channels for nt in self.node_types}

        self.proj_lin = nn.ModuleDict({
            nt: Linear(
                in_channels=in_channels[nt], 
                out_channels=hidden_channels
            ) 
            for nt in self.node_types
            if nt != 'block'
        })

        self.gnn = HeteroGraphSAGE(
            in_channels=hidden_channels,
            hidden_channels=hidden_channels,
            num_layers=num_layers,
            out_channels=hidden_channels,
            node_types=self.node_types,
            edge_types=self.edge_types,
            dropout=dropout_gnn
        )

        self.aggr_lin = nn.ModuleDict({
            nt: Linear(
                in_channels=3*hidden_channels, 
                out_channels=hidden_channels
            ) 
            for nt in self.node_types
        })

        # Small MLP to process y_base
        self.y_base_mlp = nn.Sequential(
            Linear(1, 16), nn.PReLU(),
            Linear(16, 16)
        )

        mlp_in_channels = len(self.node_types) * hidden_channels + 16
        self.mlp = nn.Sequential(
            Linear(mlp_in_channels, 512), 
            nn.LayerNorm(512), nn.PReLU(), nn.Dropout(dropout_mlp),
            Linear(512, 256),  
            nn.LayerNorm(256), nn.PReLU(), nn.Dropout(dropout_mlp),
            Linear(256, 128),
            nn.LayerNorm(128), nn.PReLU(), nn.Dropout(dropout_mlp),
            Linear(128, out_channels)
        )
        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        for lin in self.proj_lin.values():
            lin.reset_parameters()

        self.gnn.reset_parameters()

        for lin in self.aggr_lin.values():
            lin.reset_parameters()

        for m in self.y_base_mlp.modules():
            if hasattr(m, 'reset_parameters'):
                m.reset_parameters()

        for m in self.mlp.modules():
            if hasattr(m, 'reset_parameters'):
                m.reset_parameters()

    def forward(
        self, 
        x_dict: Dict[NodeType, Tensor],
        edge_index_dict: Dict[EdgeType, Tensor],
        batch_dict: Dict[NodeType, Tensor],
        y_base: Tensor
    ) -> Tensor:
        r"""Runs the forward pass of the module.

        Args:
            x_dict (Dict[NodeType, Tensor]): Input node feature dictionary.
                Each key is a node type and the value is a tensor of shape
                :obj:`(num_nodes, in_channels)`.
            edge_index_dict (Dict[EdgeType, Tensor]): Edge index dictionary.
                Each key is an edge type and the value is a tensor of shape
                :obj:`(2, num_edges)`.
            batch_dict (Dict[NodeType, Tensor]): Batch dictionary.
                Each key is a node type and the value is a tensor of shape
                :obj:`(num_nodes,)` containing the batch indices.
            y_base (Tensor): Base target tensor of shape :obj:`(num_samples, 1)`.

        :rtype: :obj:`torch.Tensor` - The output prediction tensor.
        """
        
        batch_size = _compute_batch_size(batch_dict)

        x_dict = {
            nt: self.proj_lin[nt](x) if nt in self.proj_lin else x
            for nt, x in x_dict.items()
        }
        x_dict = self.gnn(
            x_dict, edge_index_dict, batch_dict,
            batch_size=batch_size
        )
    
        x_pooled_list = []
        for nt, x in x_dict.items():
            batch = batch_dict[nt]

            x_mean = global_mean_pool(x, batch, size=batch_size)
            x_add = global_add_pool(x, batch, size=batch_size)
            x_max = global_max_pool(x, batch, size=batch_size)

            x_pooled = torch.cat([x_mean, x_add, x_max], dim=1)
            x_pooled = self.aggr_lin[nt](x_pooled)
            x_pooled_list.append(x_pooled.view(batch_size, -1))

        x_aggr = torch.cat(x_pooled_list, dim=1)

        y_base_processed = self.y_base_mlp(y_base)
        x_out = torch.cat([x_aggr, y_base_processed], dim=1)

        out = self.mlp(x_out)
        return out.squeeze(1)
    

def _compute_batch_size(batch_dict: Dict[NodeType, Tensor]) -> int:
    batch_size = 0
    for batch in batch_dict.values():
        if batch.numel() > 0:
            batch_size = max(batch_size, int(batch.max().item()))
    return batch_size + 1