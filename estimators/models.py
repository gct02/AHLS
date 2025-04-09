from typing import Union, Dict, List, Optional

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn import (
    HGTConv, LayerNorm, HeteroDictLinear, 
    JumpingKnowledge, GraphMultisetTransformer
)
from torch_geometric.typing import Metadata, NodeType, EdgeType
from torch.types import Device


class HGTRModel(nn.Module):
    r"""Model that uses the Heterogeneous Graph Transformer (HGT) operator from the
    `"Heterogeneous Graph Transformer" <https://arxiv.org/abs/2003.01332>`_ paper to
    perform graph-level regression.

    Args:
        metadata (Tuple[List[str], List[Tuple[str, str, str]]]):
            Metadata object containing node and edge types.
        in_channels (int or Dict[str, int]): Number of input channels 
            for each node type.
        out_channels (int): Number of output channels.
        proj_dim (int): Dimension of the projection layer.
            (default: :obj:`256`)
        hid_dims (int or List[int]): Hidden dimensions for each conv layer.
            (default: :obj:`128`)
        heads (int or List[int]): Number of attention heads for each conv layer.
            (default: :obj:`4`)
        num_layers (int, optional): Number of convolutional layers.
            If :obj:`None`, the number of layers is set to the length of
            :obj:`hid_dims` or the number of node types.
            (default: :obj:`None`)
        gmt_k (int or Dict[str, int]): Number of representative nodes to keep after 
            pooling for each node type on the GMT. (default: :obj:`1`)
        gmt_encoder_blocks (int or Dict[str, int]): Number of encoder blocks for each 
            node type on the GMT. (default: :obj:`1`)
        gmt_heads (int or Dict[str, int]): Number of attention heads for each node type
            on the GMT. (default: :obj:`1`)
        dropout (float): Dropout rate for fully connected layers. 
            (default: :obj:`0.0`)
        device (torch.device): Device to use for computation. 
            (default: :obj:`"cpu"`)
    """
    def __init__(self, 
        metadata: Metadata,
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        proj_dim: int = 256,
        hid_dims: Union[List[int], int] = 128,
        heads: Union[List[int], int] = 4,
        num_layers: Optional[int] = None,
        dropout: float = 0.0,
        gmt_k: Union[Dict[str, int], int] = 1,
        gmt_encoder_blocks: Union[Dict[str, int], int] = 1,
        gmt_heads: Union[Dict[str, int], int] = 1,
        device: Device = 'cpu'
    ):
        super().__init__()

        self.node_types = metadata[0]
        self.edge_types = metadata[1]
        self.in_channels = in_channels
        self.out_channels = out_channels
        self.num_layers = num_layers
        self.dropout = dropout
        self.device = device

        if num_layers is None:
            num_layers = len(hid_dims) if isinstance(hid_dims, list) \
                else len(self.node_types)

        if isinstance(hid_dims, int):
            hid_dims = [hid_dims] * num_layers

        if isinstance(heads, int):
            heads = [heads] * num_layers

        if len(hid_dims) != len(heads):
            raise ValueError(
                f"Expected `hid_dims` and `heads` to have the same length, "
                f"but got {len(hid_dims)} and {len(heads)}."
            )

        # Projection layer
        self.proj = HeteroDictLinear(
            in_channels, proj_dim, 
            types=self.node_types,
            weight_initializer='kaiming_uniform',
            bias_initializer='zeros'
        )

        # Convolutional layers
        self.conv = nn.ModuleList()
        self.norm = nn.ModuleList()
        for i in range(num_layers):
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

        # JK layer
        self.jk = nn.ModuleDict({
            nt: JumpingKnowledge(mode='cat')
            for nt in self.node_types
        })

        aggr_dim = sum(hid_dims)

        # Type-wise linear layer
        self.node_lin = HeteroDictLinear(
            aggr_dim, hid_dims[-1], 
            types=self.node_types,
            weight_initializer='kaiming_uniform',
            bias_initializer='zeros'
        )

        if isinstance(gmt_k, int):
            gmt_k = {nt: gmt_k for nt in self.node_types}
        if isinstance(gmt_encoder_blocks, int):
            gmt_encoder_blocks = {nt: gmt_encoder_blocks for nt in self.node_types}
        if isinstance(gmt_heads, int):
            gmt_heads = {nt: gmt_heads for nt in self.node_types}

        # Pooling layer 
        self.pool = nn.ModuleDict({
            nt: GraphMultisetTransformer(
                hid_dims[-1], gmt_k[nt], 
                num_encoder_blocks=gmt_encoder_blocks[nt],
                heads=gmt_heads[nt]
            )
            for nt in self.node_types
        })

        # Small MLP to process y_base
        self.y_base_mlp = nn.Sequential(
            nn.Linear(1, 16),
            nn.ReLU(),
            nn.Linear(16, 16),
            nn.ReLU()
        )

        # Graph-level MLP
        num_types = len(self.node_types)
        self.graph_mlp = nn.Sequential(
            nn.Linear(hid_dims[-1] * num_types + 16, 256), nn.BatchNorm1d(256), nn.GELU(), nn.Dropout(dropout),
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

        for nt in self.node_types:
            self.pool[nt].reset_parameters()
        
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
        batch_dict: Dict[NodeType, Tensor],
        y_base: Tensor
    ) -> Tensor:
        r"""Runs the forward pass of the module.

        Args:
            x_dict (Dict[NodeType, Tensor]): Dictionary of node features for each node type.
            edge_index_dict (Dict[EdgeType, Tensor]): Dictionary of edge indices for each edge type.
            batch_dict (Dict[NodeType, Tensor]): Dictionary of batch indices for each node type.
            y_base (Tensor): The target values of the base solutions.
    
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
        for i in range(self.num_layers):
            x_dict = self.conv[i](x_dict, edge_index_dict)
            x_dict = {nt: self.norm[i][nt](x) for nt, x in x_dict.items()}
            for nt, x in x_dict.items():
                xs_dict[nt].append(x)

        # JK layer
        x_dict = {nt: self.jk[nt](xs) for nt, xs in xs_dict.items()}

        # Type-wise linear layer
        x_dict = self.node_lin(x_dict)
        x_dict = {
            nt: F.dropout(F.gelu(x), p=self.dropout, training=self.training)
            for nt, x in x_dict.items()
        }

        # Pooling layer
        batch_size = self._get_batch_size(batch_dict)
        x_list = []
        for nt, x in x_dict.items():
            x = self.pool[nt](x, index=batch_dict[nt])
            x_list.append(x.view(batch_size, -1))

        x = torch.cat(x_list, dim=1)

        # Process y_base
        y_base_processed = self.y_base_mlp(y_base.unsqueeze(1))
        x = torch.cat([x, y_base_processed], dim=1)

        # Graph-level MLP
        out = self.graph_mlp(x).squeeze(1)
        
        return out
    
    def _get_batch_size(self, batch_dict: Dict[NodeType, Tensor]) -> int:
        """Returns the batch size."""
        max_size = 0
        for batch in batch_dict.values():
            if batch.numel() > 0:
                max_size = max(max_size, batch.max().item())
        return max_size + 1