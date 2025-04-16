from typing import Union, Dict, List, Optional

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn import HeteroDictLinear, JumpingKnowledge
from torch_geometric.typing import Metadata, NodeType, EdgeType

from layers import HetSAGPooling, HGTConv


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
        dropout (float): Dropout rate for fully connected layers.
            (default: :obj:`0.0`)
        pool_size (int): Number of nodes to keep after pooling.
            (default: :obj:`16`)
    """
    def __init__(
        self,
        metadata: Metadata,
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        proj_dim: int = 256,
        hid_dims: Union[List[int], int] = 128,
        heads: Union[List[int], int] = 4,
        num_layers: Optional[int] = None,
        dropout: float = 0.0,
        pool_size: int = 16
    ):
        super().__init__()

        self.node_types = metadata[0]
        self.edge_types = metadata[1]
        self.in_channels = in_channels
        self.out_channels = out_channels
        self.dropout = dropout

        if num_layers is None:
            if isinstance(hid_dims, list):
                num_layers = len(hid_dims)
            else:
                num_layers = len(self.node_types)

        if isinstance(hid_dims, int):
            hid_dims = [hid_dims] * num_layers

        if isinstance(heads, int):
            heads = [heads] * num_layers

        if len(hid_dims) != len(heads):
            raise ValueError(
                f"Expected `hid_dims` and `heads` to have the same length, "
                f"but got {len(hid_dims)} and {len(heads)}."
            )
        self.num_layers = num_layers
        self.hid_dims = hid_dims
        self.heads = heads

        # Projection layer
        self.proj = HeteroDictLinear(
            in_channels, proj_dim,
            types=self.node_types,
            weight_initializer='kaiming_uniform',
            bias_initializer='zeros'
        )

        # Convolutional layers
        self.conv = nn.ModuleList([
            HGTConv(
                proj_dim if i == 0 else hid_dims[i-1], hid_dims[i], metadata,
                heads=heads[i], norm=True, dropout=dropout
            )
            for i in range(num_layers)
        ])

        # Jumping knowledge layer
        num_layers_jk = min(3, num_layers)
        self.first_jk = num_layers - num_layers_jk
        self.jk = JumpingKnowledge(
            mode='lstm', 
            channels=hid_dims[-1], 
            num_layers=num_layers_jk
        )

        # Pooling layer
        self.pool = HetSAGPooling(hid_dims[-1], pool_size, metadata)

        # Small MLP to process y_base
        self.y_base_mlp = nn.Sequential(
            nn.Linear(1, 32), 
            nn.LeakyReLU(negative_slope=0.2),
            nn.Linear(32, 32)
        )

        # Graph-level MLP
        self.graph_mlp = nn.Sequential(
            nn.Linear(hid_dims[-1] * pool_size + 32, 512), nn.BatchNorm1d(512), nn.GELU(), nn.Dropout(dropout),
            nn.Linear(512, 256), nn.BatchNorm1d(256), nn.GELU(), nn.Dropout(dropout),
            nn.Linear(256, 128), nn.BatchNorm1d(128), nn.GELU(), nn.Dropout(dropout),
            nn.Linear(128, 64), nn.BatchNorm1d(64), nn.GELU(), nn.Dropout(dropout),
            nn.Linear(64, out_channels)
        )

        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        self.proj.reset_parameters()
        
        for i in range(len(self.conv)):
            self.conv[i].reset_parameters()

        self.jk.reset_parameters()
        self.pool.reset_parameters()

        for m in self.y_base_mlp.modules():
            if isinstance(m, nn.Linear):
                nn.init.kaiming_normal_(m.weight, nonlinearity='relu')
                if m.bias is not None:
                    nn.init.zeros_(m.bias)

        for m in self.graph_mlp.modules():
            if isinstance(m, nn.Linear):
                nn.init.kaiming_normal_(m.weight, nonlinearity='relu')
                if m.bias is not None:
                    nn.init.zeros_(m.bias)

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

        offset = {}
        cumsum = 0
        for nt, x in x_dict.items():
            offset[nt] = cumsum
            cumsum += x.size(0)

        # Convolutional layers
        xs = []
        for i in range(self.num_layers):
            x_dict = self.conv[i](x_dict, edge_index_dict)
            if i >= self.first_jk:
                xs.append(torch.cat(list(x_dict.values()), dim=0))

        x = self.jk(xs)

        cumsum = 0
        for nt in self.node_types:
            N = x_dict[nt].size(0)
            x_dict[nt] = x[cumsum:cumsum + N]
            cumsum += N

        # Pooling layer
        x = self.pool(x_dict, edge_index_dict, batch_dict)

        batch_size = self._get_batch_size(batch_dict)
        x = x.view(batch_size, -1)

        # Process y_base
        y_base_processed = self.y_base_mlp(y_base.unsqueeze(1))
        x = torch.cat([x, y_base_processed], dim=1)

        # Graph-level MLP
        out = self.graph_mlp(x).squeeze(1)

        return out
    
    def _get_batch_size(self, batch_dict: Dict[NodeType, Tensor]) -> int:
        r"""Returns the batch size of the input batch_dict.

        Args:
            batch_dict (Dict[NodeType, Tensor]): Dictionary of batch indices for each node type.

        :rtype: :obj:`int` - The batch size.
        """
        max_size = 0
        for batch in batch_dict.values():
            max_size = max(max_size, batch.max().item() + 1)
        return max_size
        