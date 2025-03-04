from typing import Union, Optional, List
from torch.types import Device

import torch
import torch.nn as nn
from torch import Tensor
from torch_geometric.nn import PNAConv, ASAPooling
from torch_geometric.nn.inits import reset
from torch_geometric.nn.models import JumpingKnowledge
from torch_geometric.data import Data


class GNN(nn.Module):
    def __init__(self, 
        in_channels: int,
        out_channels: int,
        hid_dim: int,
        deg: Tensor,
        aggregators: Union[str, List[str]] = ['mean', 'std', 'max', 'min'],
        scalers: Union[str, List[str]] = ['identity', 'amplification'],  # 'attenuation' is numerically unstable
        edge_dim: Optional[int] = None,
        layers: int = 6,
        dropout: float = 0.0,
        pooling_size: int = 16,
        jk_mode: str = 'lstm',
        device: Optional[Device] = 'cpu'
    ):
        super().__init__()

        self.device = device
        self.layers = layers
        self.pooling_size = pooling_size

        if isinstance(aggregators, str):
            aggregators = [aggregators]
        if isinstance(scalers, str):
            scalers = [scalers]

        # Define convolutional layers
        self.conv = nn.ModuleList([
            PNAConv(in_channels if i == 0 else hid_dim, hid_dim, aggregators, scalers, deg, edge_dim, train_norm=True)
            for i in range(layers)
        ])

        # Define Jumping Knowledge layer
        self.jk = JumpingKnowledge(mode=jk_mode, channels=hid_dim, num_layers=layers)

        # Define pooling layer
        self.pool = ASAPooling(hid_dim, pooling_size)

        # Define fully connected layers
        hid_dim_fc = [hid_dim * pooling_size]
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

    def forward(self, data: Data) -> Tensor:
        x, edge_index, edge_attr, batch = data.x, data.edge_index, data.edge_attr, data.batch
        num_batches = batch.max().item() + 1
        outs = []

        # Convolutional layers
        for i in range(self.layers):
            x = self.conv[i](x, edge_index, edge_attr)
            outs.append(x)

        # Jumping Knowledge layer
        x = self.jk(outs)

        # Pooling layer
        x = self.pool(x, edge_index=edge_index, batch=batch)[0]
        x = x.view(num_batches, -1)

        # Avoid NaNs (edge case handling)
        x = torch.nan_to_num(x)

        # Fully connected layers
        x = self.mlp(x)

        return x.flatten()

