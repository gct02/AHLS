from typing import Dict, Union, Optional, List

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn import HGTConv, ASAPooling, GraphConv, global_max_pool
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
        num_conv_layers (int): Number of convolutional layers. 
            (default: :obj:`6`)
        num_pooling_layers (int, optional): Number of pooling layers. 
            (default: :obj:`None`)
        heads (int): Number of attention heads. (default: :obj:`1`)
        dropout (float): Dropout rate for fully connected layers. 
            (default: :obj:`0.0`)
        jk_mode (str): Mode for the Jumping Knowledge layer. 
            (default: :obj:`"lstm"`)
        mlp_layers (List[int], optional): List of hidden layer sizes for the MLP.
            (default: :obj:`None`)
        device (torch.device): Device to use for computation. 
            (default: :obj:`"cpu"`)
    """
    def __init__(self, 
        metadata: Metadata,
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        hid_dim: int,
        num_conv_layers: int = 6,
        num_pooling_layers: Optional[int] = None,
        heads: int = 1,
        dropout: float = 0.0,
        mlp_layers: Optional[List[int]] = None,
        jk_mode: str = 'lstm',
        device: Device = 'cpu'
    ):
        super().__init__()

        self.device = device

        if num_pooling_layers is None:
            num_pooling_layers = num_conv_layers

        # Define convolutional layers
        self.conv_layers = nn.ModuleList([
            HGTConv(hid_dim if i > 0 else in_channels, hid_dim, metadata, heads)
            for i in range(num_conv_layers)
        ])

        # Define Jumping Knowledge layer
        self.jk = JumpingKnowledge(
            mode=jk_mode, channels=hid_dim, num_layers=num_conv_layers
        )

        # Define pooling layers
        self.pooling_layers = nn.ModuleList([
            ASAPooling(hid_dim, ratio=0.5, GNN=GraphConv, dropout=dropout)
            for _ in range(num_pooling_layers)
        ])

        # Define fully connected layers
        if mlp_layers is None:
            mlp_layers = [hid_dim]
            mlp_layers.append(max(out_channels * 2, mlp_layers[-1] // 2))
            while mlp_layers[-1] // 2 > out_channels:
                mlp_layers.append(mlp_layers[-1] // 2)
        else:
            mlp_layers = [hid_dim] + mlp_layers

        self.mlp = nn.Sequential()
        num_mlp_layers = len(mlp_layers) - 1
        for i in range(num_mlp_layers):
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
        self.conv_layers.apply(self._init_weights)
        self.jk.apply(self._init_weights)
        self.pooling_layers.apply(self._init_weights)
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
            data (torch_geometric.data.HeteroData): A data object containing
                input node features and graph  connectivity information for 
                each individual edge type.
    
        :rtype: :obj:`torch.Tensor` - The output prediction tensor.
        """
        x_dict = data.x_dict
        outs = []

        # Convolutional layers
        for conv in self.conv_layers:
            x_dict = conv(x_dict, data.edge_index_dict)
            outs.append(torch.cat([v for v in x_dict.values()]))

        # Jumping Knowledge layer
        x = self.jk(outs)

        # Pooling layers
        edge_index = torch.cat([v for v in data.edge_index_dict.values()], dim=1)
        batch = torch.cat([v for v in data.batch_dict.values()])
        if 'edge_attr' in data.keys():
            edge_attr = torch.cat([v for v in data.edge_attr_dict.values()])
        else:
            edge_attr = None

        for pool in self.pooling_layers:
            x, edge_index, edge_attr, batch, _ = pool(x, edge_index, edge_attr, batch)
            x = F.gelu(x)

        # Aggregating nodes
        x = global_max_pool(x, batch)

        # Fully connected layers
        x = self.mlp(x).squeeze(1)
        return x

