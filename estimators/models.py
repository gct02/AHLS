from typing import Dict, Union, Optional
from torch.types import Device
from torch_geometric.typing import Metadata

import torch
import torch.nn as nn
from torch import Tensor
from torch_geometric.nn import HGTConv, GraphConv
from torch_geometric.data import HeteroData
from torch_geometric.nn.inits import reset
from torch_geometric.nn.models import JumpingKnowledge
from layers import CustomSAGPooling


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
        hid_dim (int): Hidden dimension for the convolutional layers.
        layers (int): Number of convolutional layers. (default: :obj:`6`)
        heads (int): Number of attention heads (default: :obj:`1`).
        dropout (float): Dropout rate for fully connected layers.
            (default: :obj:`0.0`)
        pool_size (int): Number of nodes to keep after pooling.
            (default: :obj:`16`)
        jk_mode (str): Mode for the Jumping Knowledge layer.
            (default: :obj:`"lstm"`)
        device (torch.device): Device to use for computation.
            (default: :obj:`"cpu"`)
    """
    def __init__(self, 
        metadata: Metadata,
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        hid_dim: int,
        layers: int = 6,
        heads: int = 1,
        dropout: float = 0.0,
        pool_size: int = 16,
        jk_mode: str = 'lstm',
        device: Optional[Device] = 'cpu'
    ):
        super().__init__()

        self.device = device
        self.layers = layers
        self.pool_size = pool_size

        # Define convolutional layers
        self.conv = nn.ModuleList([
            HGTConv(hid_dim if i > 0 else in_channels, hid_dim, metadata, heads)
            for i in range(layers)
        ])

        if layers == 1:
            self.jk_layers = [0]
        elif layers == 2:
            self.jk_layers = [0, 1]
        else:
            self.jk_layers = [0, layers // 2, layers - 1]

        # Define Jumping Knowledge layer
        self.jk = JumpingKnowledge(mode=jk_mode, channels=hid_dim, num_layers=len(self.jk_layers))

        # Define pooling layer
        self.pool = CustomSAGPooling(hid_dim, ratio=pool_size, GNN=GraphConv)

        # Define fully connected layers
        hid_dim_fc = [hid_dim * pool_size]
        hid_dim_fc.append(max(out_channels * 2, hid_dim_fc[-1] // 2))
        while hid_dim_fc[-1] // 2 > out_channels:
            hid_dim_fc.append(hid_dim_fc[-1] // 2)

        self.mlp = nn.Sequential()
        hid_layers_fc = len(hid_dim_fc) - 1
        for i in range(hid_layers_fc):
            self.mlp.extend([
                nn.Linear(hid_dim_fc[i], hid_dim_fc[i+1]),
                nn.GELU(),
                nn.Dropout(dropout)
            ])
        self.mlp.append(nn.Linear(hid_dim_fc[-1], out_channels))

        self.reset_parameters()
        self.to(self.device)

    def reset_parameters(self):
        r"""Reinitializes the model parameters."""
        self.conv.apply(self._init_weights)
        self.jk.apply(self._init_weights)
        self.pool.apply(self._init_weights)
        self.mlp.apply(self._init_weights)

    def _init_weights(self, m):
        if isinstance(m, nn.Linear):
            nn.init.kaiming_normal_(m.weight)
            if m.bias is not None:
                nn.init.zeros_(m.bias)
        else:
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
        outs = []

        # Convolutional layers
        for i in range(self.layers):
            x = self.conv[i](x, edge_index)
            if i in self.jk_layers:
                outs.append(torch.cat([v for v in x.values()], dim=0))

        # Jumping Knowledge layer
        out = self.jk(outs)

        hom = data.to_homogeneous()
        num_batches = hom.batch.max().item() + 1

        # Pooling layer
        out = self.pool(out, edge_index=hom.edge_index, batch=hom.batch)[0]
        out = out.view(num_batches, -1)

        # Fully connected layers
        out = self.mlp(out)

        # Avoid NaNs (edge case handling)
        out = torch.nan_to_num(out)

        return out.flatten()

