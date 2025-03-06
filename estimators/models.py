from typing import Dict, Union, Optional, List

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn import HGTConv, ASAPooling, GraphConv
from torch_geometric.data import HeteroData
from torch_geometric.nn.inits import reset
from torch_geometric.nn.models import JumpingKnowledge
from torch.types import Device
from torch_geometric.typing import Metadata


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
        batch_size: int,
        layers: int = 6,
        heads: int = 1,
        dropout: float = 0.0,
        pool_size: int = 16,
        mlp_layers: Optional[List[int]] = None,
        jk_mode: str = 'lstm',
        device: Optional[Device] = 'cpu'
    ):
        super().__init__()

        self.device = device
        self.layers = layers
        self.batch_size = batch_size
        self.pool_size = pool_size

        # Define convolutional layers
        self.conv = nn.ModuleList([
            HGTConv(hid_dim if i > 0 else in_channels, hid_dim, metadata, heads)
            for i in range(layers)
        ])

        # Define pooling layers
        self.pool = nn.ModuleList([
            ASAPooling(hid_dim, ratio=pool_size, GNN=GraphConv, dropout=dropout)
            for _ in range(layers)
        ])

        # Define Jumping Knowledge layer
        self.jk = JumpingKnowledge(mode=jk_mode, channels=hid_dim, num_layers=layers)

        # Define fully connected layers
        if mlp_layers is None:
            mlp_layers = [hid_dim * pool_size]
            mlp_layers.append(max(out_channels * 2, mlp_layers[-1] // 2))
            while mlp_layers[-1] // 2 > out_channels:
                mlp_layers.append(mlp_layers[-1] // 2)
        else:
            mlp_layers = [hid_dim * pool_size] + mlp_layers

        self.mlp = nn.Sequential()
        n_mlp_layers = len(mlp_layers) - 1
        for i in range(n_mlp_layers):
            self.mlp.extend([
                nn.Linear(mlp_layers[i], mlp_layers[i+1]),
                nn.GELU(),
                nn.Dropout(dropout)
            ])
        self.mlp.append(nn.Linear(mlp_layers[-1], out_channels))

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

        edge_index_hom = torch.cat([edge_index[et] for et in edge_index.keys()], dim=1)
        batch_hom = torch.cat([data.batch_dict[nt] for nt in data.batch_dict.keys()], dim=0)

        # Convolutional layers
        for i in range(self.layers):
            x = self.conv[i](x, edge_index)
            out = torch.cat([v for v in x.values()], dim=0)
            out = self.pool[i](out, edge_index=edge_index_hom, batch=batch_hom)[0]
            outs.append(out)

        # Jumping Knowledge layer
        out = self.jk(outs)
        out = out.view(self.batch_size, -1)

        # Avoid NaNs (edge case handling)
        out = torch.nan_to_num(out)

        # Fully connected layers
        out = self.mlp(out)

        return out.flatten()

