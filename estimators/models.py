from typing import Dict, Union, Optional, List
from torch.types import Device
from torch_geometric.typing import EdgeType, Metadata

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn import HGTConv, LayerNorm
from torch_geometric.data import HeteroData
from torch_geometric.nn.inits import reset
from torch_geometric.nn.models import JumpingKnowledge
from layers import HetSAGPooling


class HGT_HLS(nn.Module):
    r"""Module that uses the Heterogeneous Graph Transformer (HGT) operator from the
    `"Heterogeneous Graph Transformer" <https://arxiv.org/abs/2003.01332>`_ paper to
    perform graph-level regression.

    Args:
        metadata (Tuple[List[str], List[Tuple[str, str, str]]]):
            Metadata object containing node and edge types.
        in_channels (int or Dict[str, int]): Number of input channels 
            for each node type.
        out_channels (int): Number of output channels.
        hid_dim (int): Hidden dimension for the convolutional layers.
        layers (int): Number of convolutional layers (default: :obj:`6`).
        heads (int): Number of attention heads (default: :obj:`1`).
        fc_dropout (float): Dropout rate for fully connected layers
            (default: :obj:`0.0`).
        conv_dropout (float): Dropout rate for convolutional layers
            (default: :obj:`0.0`).
        pool_size (int): Number of nodes to keep after pooling.
            (default: :obj:`8`).
        aggr_paths (List[List[EdgeType]], optional): List of edge type 
            combinations to aggregate over (default: :obj:`None`).
        apply_ln (bool): Whether to use layer normalization
            (default: :obj:`True`).
        device (torch.device): Device to use for computation
            (default: :obj:`"cpu"`).
    """
    def __init__(self, 
        metadata: Metadata,
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        hid_dim: int,
        layers: int = 6,
        heads: int = 1,
        conv_dropout: float = 0.0,
        fc_dropout: float = 0.0,
        pool_size: int = 8,
        aggr_paths: Optional[List[List[EdgeType]]] = None,
        apply_ln: bool = True,
        device: Optional[Device] = 'cpu'
    ):
        super().__init__()

        if aggr_paths is None:
            aggr_paths = [metadata[1]]

        self.device = device
        self.node_types = metadata[0]
        self.edge_types = metadata[1]
        self.layers = layers
        self.apply_ln = apply_ln

        # Define convolutional layers
        self.conv = nn.ModuleList([
            HGTConv(in_channels, hid_dim, metadata, heads)
        ])
        self.conv.extend([
            HGTConv(hid_dim, hid_dim, metadata, heads)
            for _ in range(1, layers)
        ])

        # Define normalization layers (optional)
        if self.apply_ln:
            self.norm = nn.ModuleDict({
                nt: nn.ModuleList([
                    LayerNorm(hid_dim) for _ in range(layers-1)
                ])
                for nt in self.node_types
            })

        # Define dropouts
        self.conv_dropout = nn.Dropout(conv_dropout)

        # Define Jumping Knowledge layer
        self.jkn = nn.ModuleDict({
            nt: JumpingKnowledge('lstm', channels=hid_dim, num_layers=layers)
            for nt in self.node_types
        })

        # Define pooling layer
        self.pool = HetSAGPooling(metadata, hid_dim, aggr_paths, pool_size)

        # Define fully connected layers
        hid_dim_fc = [hid_dim * pool_size]

        while hid_dim_fc[-1] // 2 > out_channels:
            hid_dim_fc.append(hid_dim_fc[-1] // 2)

        self.mlp = nn.Sequential()
        hid_layers_fc = len(hid_dim_fc) - 1
        for i in range(hid_layers_fc):
            self.mlp.extend([
                nn.Linear(hid_dim_fc[i], hid_dim_fc[i+1]),
                nn.GELU(),
                nn.Dropout(fc_dropout)
            ])
        self.mlp.append(nn.Linear(hid_dim_fc[-1], out_channels))

        self.reset_parameters()
        self.to(self.device)

    def reset_parameters(self):
        r"""Reinitializes the model parameters."""
        self.conv.apply(self._init_weights)
        self.pool.apply(self._init_weights)
        self.mlp.apply(self._init_weights)
        if self.apply_ln:
            self.norm.apply(self._init_weights)

    def _init_weights(self, m):
        if isinstance(m, nn.Linear):
            nn.init.kaiming_normal_(m.weight)
            if m.bias is not None:
                nn.init.zeros_(m.bias)
            reset(m)

    def forward(self, data: HeteroData) -> Tensor:
        r"""Runs the forward pass of the module.

        Args:
            data (:class:`torch_geometric.data.HeteroData`):
                A data object containing input node features and graph 
                connectivity information for each individual edge type.
    
        Returns: :obj:`torch.Tensor` - The output prediction tensor.
        """
        x, edge_index = data.x_dict, data.edge_index_dict
        outs = {nt: [] for nt in self.node_types}

        # Convolutional layers
        for i in range(self.layers-1):
            x = self.conv[i](x, edge_index)

            if self.apply_ln:
                x = {k: self.norm[k][i](v) if v.numel() > 0 else v for k, v in x.items()}

            x = {k: self.conv_dropout(F.gelu(v)) for k, v in x.items()}
            for k, v in x.items():
                outs[k].append(v)
        
        x = self.conv[-1](x, edge_index)
        for k, v in x.items():
            outs[k].append(v)

        # Jumping Knowledge layer
        x = {k: self.jkn[k](outs[k]) for k in x.keys()}

        # Edge-wise aggregation
        x_out = self.pool(x, edge_index)

        # Fully connected layers
        x_out = self.mlp(x_out)

        # Avoid NaNs (edge case handling)
        x_out = torch.nan_to_num(x_out)

        return x_out

