from typing import Union, Dict

import torch
import torch.nn as nn
from torch import Tensor
from torch_geometric.nn import (
    HeteroDictLinear, Linear, 
    LayerNorm, JumpingKnowledge
)
from torch_geometric.typing import Metadata, NodeType, EdgeType

from gnn.layers import HGTConv, HetSAGPooling


class HGT(nn.Module):
    r"""Model that uses the Heterogeneous Graph Transformer (HGT) operator from the
    `"Heterogeneous Graph Transformer" <https://arxiv.org/abs/2003.01332>`_ paper to
    perform graph-level regression.

    Args:
        metadata (Tuple[List[str], List[Tuple[str, str, str]]]):
            Metadata object containing node and edge types.
        in_channels (int or Dict[str, int]): Number of input channels
            for each node type.
        out_channels (int): Number of output channels.
        hid_dims (int or List[int]): Hidden dimensions for each conv layer.
            (default: :obj:`128`)
        heads (int or List[int]): Number of attention heads for each conv layer.
            (default: :obj:`4`)
        num_layers (int, optional): Number of convolutional layers.
            If :obj:`None`, the number of layers is set to the length of
            :obj:`hid_dims` or the number of node types.
            (default: :obj:`None`)
        dropout (float): Dropout rate. (default: :obj:`0.0`)
    """
    def __init__(
        self,
        metadata: Metadata,
        in_channels: Union[int, Dict[NodeType, int]],
        out_channels: int,
        hid_dim: int = 256,
        heads: int = 4,
        num_layers: int = 4,
        dropout: float = 0.0
    ):
        super().__init__()

        self.node_types = metadata[0]
        self.edge_types = metadata[1]
        self.in_channels = in_channels
        self.out_channels = out_channels
        self.dropout = dropout
        self.num_layers = num_layers

        # Input projection layer
        self.proj_in = HeteroDictLinear(
            in_channels, hid_dim, types=self.node_types, 
            weight_initializer='kaiming_uniform'
        )

        # Convolutional layers
        self.conv = nn.ModuleList([
            HGTConv(hid_dim, hid_dim, metadata, heads=heads, dropout=dropout)
            for _ in range(num_layers)
        ])
        self.norm = nn.ModuleList([
            nn.ModuleDict({
                nt: LayerNorm(hid_dim)
                for nt in self.node_types
            })
            for _ in range(num_layers)
        ])

        self.jk = nn.ModuleDict({
            nt: JumpingKnowledge(mode='cat', num_layers=num_layers)
            for nt in self.node_types
        })
        jk_out_dim = hid_dim * num_layers

        # Output projection layer
        self.proj_out = HeteroDictLinear(
            jk_out_dim, hid_dim, types=self.node_types,
            weight_initializer='kaiming_uniform'
        )

        # Pooling layer
        self.pool = HetSAGPooling(hid_dim, metadata, dropout=dropout)

        # Small MLP to process y_base
        self.y_base_mlp = nn.Sequential(
            Linear(1, 16, weight_initializer="kaiming_uniform"), 
            nn.LeakyReLU(negative_slope=0.2),
            Linear(16, 16, weight_initializer="uniform")
        )

        # Graph-level MLP
        emb_dim = len(self.node_types) * hid_dim + 16
        self.graph_mlp = nn.Sequential(
            Linear(emb_dim, hid_dim, weight_initializer="kaiming_uniform"), 
            nn.BatchNorm1d(hid_dim), nn.GELU(), nn.Dropout(dropout),
            Linear(hid_dim, 128, weight_initializer="kaiming_uniform"),  
            nn.BatchNorm1d(128), nn.GELU(), nn.Dropout(dropout),
            Linear(128, out_channels, weight_initializer="uniform")
        )

        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        self.proj_in.reset_parameters()
        for conv in self.conv:
            conv.reset_parameters()
        for norm in self.norm:
            for nt in self.node_types:
                norm[nt].reset_parameters()
        for nt in self.node_types:
            self.jk[nt].reset_parameters()
        self.proj_out.reset_parameters()
        self.pool.reset_parameters()
        for m in self.y_base_mlp.modules():
            if isinstance(m, Linear):
                m.reset_parameters()
        for m in self.graph_mlp.modules():
            if isinstance(m, Linear):
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
            x_dict (Dict[NodeType, Tensor]): Dictionary of node features 
                for each node type.
            edge_index_dict (Dict[EdgeType, Tensor]): Dictionary of edge 
                indices for each edge type.
            batch_dict (Dict[NodeType, Tensor]): Dictionary of batch indices 
                for each node type.
            y_base (Tensor): The target values of the base solutions.

        :rtype: :obj:`torch.Tensor` - The output prediction tensor.
        """
        # Input projection layer
        x_dict = self.proj_in(x_dict)

        # Convolutional layers
        xs_dict = {nt: [] for nt in self.node_types}
        for i in range(self.num_layers):
            x_dict = {nt: self.norm[i][nt](x) for nt, x in x_dict.items()}
            x_dict = self.conv[i](x_dict, edge_index_dict)
            for nt, out in x_dict.items():
                xs_dict[nt].append(out)

        # Jumping knowledge
        x_dict = {nt: self.jk[nt](xs_dict[nt]) for nt in self.node_types}

        # Output projection layers
        x_dict = self.proj_out(x_dict)

        # Pooling layer
        out = self.pool(x_dict, edge_index_dict, batch_dict)
        out = torch.cat([out, self.y_base_mlp(y_base)], dim=1)

        # Graph-level MLP
        out = self.graph_mlp(out)
        return out.squeeze(1)
    
        