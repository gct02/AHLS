from typing import Union, Dict, Optional

import torch
import torch.nn as nn
from torch import Tensor
from torch_geometric.nn import HeteroDictLinear, JumpingKnowledge, LayerNorm
from torch_geometric.typing import Metadata, NodeType, EdgeType

from layers import CDFGPooling, HGTConv


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
        num_layers_jk (int, optional): Number of layers to use for
            Jumping Knowledge. If :obj:`None`, the number of layers is set
            to the number of layers in the model.
            (default: :obj:`None`)
        dropout (float): Dropout rate for fully connected layers.
            (default: :obj:`0.0`)
    """
    def __init__(
        self,
        metadata: Metadata,
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        hid_dim: int = 256,
        heads: int = 4,
        num_layers: int = 6,
        num_layers_jk: Optional[int] = None,
        dropout: float = 0.0
    ):
        super().__init__()

        self.node_types = metadata[0]
        self.edge_types = metadata[1]
        self.in_channels = in_channels
        self.out_channels = out_channels
        self.dropout = dropout
        self.num_layers = num_layers

        # Projection layer
        self.proj = HeteroDictLinear(
            in_channels, hid_dim,
            types=self.node_types,
            weight_initializer='kaiming_uniform',
            bias_initializer='zeros'
        )

        self.norm = nn.ModuleDict({
            nt: LayerNorm(hid_dim)
            for nt in self.node_types
        })

        # Convolutional layers
        self.conv = nn.ModuleList([
            HGTConv(hid_dim, hid_dim, metadata, heads=heads, dropout=dropout)
            for _ in range(num_layers)
        ])

        # Jumping knowledge layer
        if num_layers_jk is None:
            num_layers_jk = num_layers

        if num_layers_jk > num_layers:
            raise ValueError(
                "num_layers_jk must be less than or equal to num_layers."
            )
        if num_layers_jk < 1:
            raise ValueError(
                "num_layers_jk must be greater than or equal to 1."
            )
        self.first_jk = num_layers - num_layers_jk
        self.jk = nn.ModuleDict({
            nt: JumpingKnowledge(mode='max')
            for nt in self.node_types
        })

        # Pooling layer
        instrs_to_keep = 32
        ratio = {
            nt: instrs_to_keep if nt == 'instr' else 0.25
            for nt in self.node_types
        }
        self.pool = CDFGPooling(hid_dim, ratio, metadata)

        # Small MLP to process y_base
        self.y_base_mlp = nn.Sequential(
            nn.Linear(1, 32), 
            nn.LeakyReLU(negative_slope=0.2),
            nn.Linear(32, 32)
        )

        pool_size = len(self.node_types) - 1 + instrs_to_keep
        in_features = pool_size * hid_dim + 32

        # Graph-level MLP
        self.graph_mlp = nn.Sequential(
            nn.Linear(in_features, 512), nn.GELU(), nn.Dropout(dropout),
            nn.Linear(512, 256), nn.GELU(), nn.Dropout(dropout),
            nn.Linear(256, 128), nn.GELU(), nn.Dropout(dropout),
            nn.Linear(128, 64), nn.GELU(), nn.Dropout(dropout),
            nn.Linear(64, out_channels)
        )

        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        self.proj.reset_parameters()
        for conv in self.conv:
            conv.reset_parameters()
        for nt in self.node_types:
            self.norm[nt].reset_parameters()
            self.jk[nt].reset_parameters()
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
            x_dict (Dict[NodeType, Tensor]): Dictionary of node features 
                for each node type.
            edge_index_dict (Dict[EdgeType, Tensor]): Dictionary of edge 
                indices for each edge type.
            batch_dict (Dict[NodeType, Tensor]): Dictionary of batch indices 
                for each node type.
            y_base (Tensor): The target values of the base solutions.

        :rtype: :obj:`torch.Tensor` - The output prediction tensor.
        """
        # Projection layer
        x_dict = self.proj(x_dict)

        # Convolutional layers
        xs_dict = {nt: [] for nt in self.node_types}
        for i in range(self.num_layers):
            x_dict = {nt: self.norm[nt](x) for nt, x in x_dict.items()}
            x_dict = self.conv[i](x_dict, edge_index_dict)
            if i >= self.first_jk:
                for nt, x in x_dict.items():
                    xs_dict[nt].append(x)

        x_dict = {nt: self.jk[nt](xs_dict[nt]) for nt in self.node_types}

        x = self.pool(x_dict, edge_index_dict, batch_dict)
        x = torch.cat([x, self.y_base_mlp(y_base.unsqueeze(1))], dim=1)

        return self.graph_mlp(x).squeeze(1)
    
        