from typing import Dict, Union

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn import (
    HGTConv, LayerNorm, HeteroDictLinear, 
    JumpingKnowledge, global_add_pool
)
from torch_geometric.typing import Metadata, NodeType, EdgeType
from torch.types import Device


class HGT(nn.Module):
    r"""Module that uses the Heterogeneous Graph Transformer (HGT) operator from the
    `"Heterogeneous Graph Transformer" <https://arxiv.org/abs/2003.01332>`_ paper to
    perform graph-level regression.

    Args:
        metadata (Tuple[List[str], List[Tuple[str, str, str]]]):
            Metadata object containing node and edge types.
        in_channels (int or Dict[str, int]): Number of input channels 
            for each node type.
        out_channels (int): Number of output channels.
        dropout (float): Dropout rate for fully connected layers. 
            (default: :obj:`0.1`)
        device (torch.device): Device to use for computation. 
            (default: :obj:`"cpu"`)
    """
    def __init__(self, 
        metadata: Metadata,
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        dropout: float = 0.1,
        device: Device = 'cpu'
    ):
        super().__init__()

        self.node_types = metadata[0]
        self.edge_types = metadata[1]
        self.dropout = dropout
        self.device = device

        # Define projection layer
        proj_dim = 256
        self.proj = HeteroDictLinear(
            in_channels, proj_dim, 
            types=self.node_types,
            weight_initializer='kaiming_uniform',
            bias_initializer='zeros'
        )

        # Define convolutional layers
        hid_dims = [128, 96, 64, 48, 32]
        heads = [8, 8, 8, 4, 4]
        self.n_conv_layers = len(hid_dims)

        self.conv = nn.ModuleList()
        self.norm = nn.ModuleList()
        
        for i in range(self.n_conv_layers):
            self.conv.append(
                HGTConv(
                    proj_dim if i == 0 else hid_dims[i-1], 
                    hid_dims[i], metadata, heads=heads[i]
                )
            )
            self.norm.append(
                nn.ModuleDict({
                    nt: LayerNorm(hid_dims[i])
                    for nt in self.node_types
                })
            )

        # Define JK layer
        self.jk = nn.ModuleDict({
            nt: JumpingKnowledge(mode='cat')
            for nt in self.node_types
        })

        # Define node type-wise linear layers
        jk_dim = sum(hid_dims)
        self.node_lin = HeteroDictLinear(
            jk_dim, 128, 
            types=self.node_types,
            weight_initializer='kaiming_uniform',
            bias_initializer='zeros'
        )

        # Define graph-level MLP
        n_types = len(self.node_types)
        self.graph_mlp = nn.Sequential(
            nn.Linear(128 * n_types, 256), nn.BatchNorm1d(256), nn.GELU(), nn.Dropout(dropout),
            nn.Linear(256, 128), nn.BatchNorm1d(128), nn.GELU(), nn.Dropout(dropout),
            nn.Linear(128, 64), nn.BatchNorm1d(64), nn.GELU(), nn.Dropout(dropout),
            nn.Linear(64, out_channels)
        )

        self.reset_parameters()
        self.to(device)

    def reset_parameters(self):
        """Reinitializes model parameters."""
        self.proj.reset_parameters()
        
        for conv, norm in zip(self.conv, self.norm):
            conv.reset_parameters()
            for nt in self.node_types:
                norm[nt].reset_parameters()
        
        self.node_lin.reset_parameters()
        
        for m in self.graph_mlp.modules():
            if isinstance(m, nn.Linear):
                if m.out_features == self.out_channels:
                    nn.init.xavier_uniform_(m.weight)
                else:
                    nn.init.kaiming_normal_(m.weight, nonlinearity='relu')
                if m.bias is not None:
                    nn.init.zeros_(m.bias)
            elif isinstance(m, nn.BatchNorm1d):
                m.reset_parameters()

    def forward(
        self,
        x_dict: Dict[NodeType, Tensor],
        edge_index_dict: Dict[EdgeType, Tensor],
        batch_dict: Dict[NodeType, Tensor]
    ) -> Tensor:
        r"""Runs the forward pass of the module.

        Args:
            x_dict (Dict[NodeType, Tensor]): Dictionary of node features for each node type.
            edge_index_dict (Dict[EdgeType, Tensor]): Dictionary of edge indices for each edge type.
            batch_dict (Dict[NodeType, Tensor]): Dictionary of batch indices for each node type.
    
        :rtype: :obj:`torch.Tensor` - The output prediction tensor.
        """
        # Projection layer
        x_dict = self.proj(x_dict)
        x_dict = {
            nt: F.dropout(F.gelu(x), p=self.dropout, training=self.training)
            for nt, x in x_dict.items()
        }

        # Convolutional layers
        xs_dict = {nt: [] for nt in self.node_types}
        for i in range(self.n_conv_layers):
            x_dict = self.conv[i](x_dict, edge_index_dict)
            x_dict = {nt: self.norm[i][nt](x) for nt, x in x_dict.items()}
            for nt, x in x_dict.items():
                xs_dict[nt].append(x)

        # JK layer
        x_dict = {nt: self.jk[nt](xs) for nt, xs in xs_dict.items()}

        # Node type-wise linear layer
        x_dict = self.node_lin(x_dict)
        x_dict = {
            nt: F.dropout(F.gelu(x), p=self.dropout, training=self.training)
            for nt, x in x_dict.items()
        }

        # Pooling layer
        batch_size = self._get_batch_size(batch_dict)
        x_list = []
        for nt, x in x_dict.items():
            x = global_add_pool(x, batch_dict[nt], size=batch_size)
            x_list.append(x.view(batch_size, -1))

        # Graph-level MLP
        out = self.graph_mlp(torch.cat(x_list, dim=1)).squeeze(1)

        return out
    
    def _get_batch_size(self, batch_dict: Dict[NodeType, Tensor]) -> int:
        """Returns the batch size."""
        max_size = 0
        for batch in batch_dict.values():
            if batch.numel() > 0:
                max_size = max(max_size, batch.max().item())
        return max_size + 1