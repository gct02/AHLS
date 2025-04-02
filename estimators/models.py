from typing import Dict, Union, Tuple

import torch
import torch.nn as nn
from torch.nn import functional as F
from torch import Tensor
from torch_geometric.nn import HeteroDictLinear, HGTConv, SAGPooling
from torch_geometric.data import HeteroData
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
        dropout_conv (float): Dropout rate for convolutional layers.
            (default: :obj:`0.0`)
        dropout_fc (float): Dropout rate for fully connected layers. 
            (default: :obj:`0.1`)
        device (torch.device): Device to use for computation. 
            (default: :obj:`"cpu"`)
    """
    def __init__(self, 
        metadata: Metadata,
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        dropout_conv: float = 0.0,
        dropout_fc: float = 0.1,
        device: Device = 'cpu'
    ):
        super().__init__()

        self.node_types = metadata[0]
        self.edge_types = metadata[1]
        self.device = device
        self.dropout_conv = dropout_conv
        self.dropout_fc = dropout_fc

        # Define projection layers
        self.proj = nn.ModuleList([
            HeteroDictLinear(in_channels, 128, self.node_types),
            HeteroDictLinear(128, 256, self.node_types),
            HeteroDictLinear(256, 512, self.node_types),
        ])

        updated_metadata = (
            [nt for nt in metadata[0] if nt != "base"],
            [et for et in metadata[1] if et[1] != "base"]
        )

        # Define convolutional layers
        self.conv = nn.ModuleList([
            HGTConv(512, 512, metadata, 8),
            HGTConv(512, 256, updated_metadata, 8),
            HGTConv(256, 128, updated_metadata, 8),
            HGTConv(128, 64, updated_metadata, 4),
            HGTConv(64, 32, updated_metadata, 4)
        ])
        self.n_conv_layers = len(self.conv)

        # Define pooling layer
        self.pool = SAGPooling(32, ratio=16)

        # Define graph-level fully connected layers
        hid_dims = [512, 256, 128, 64, 32, 16, 8, 4]
        self.mlp = nn.Sequential()
        for i in range(len(hid_dims) - 1):
            self.mlp.extend([
                nn.Linear(hid_dims[i], hid_dims[i + 1]),
                nn.GELU(),
                nn.Dropout(dropout_fc)
            ])
        self.mlp.extend([nn.Linear(hid_dims[-1], out_channels)])

        self.reset_parameters()
        self.to(device)

    def reset_parameters(self):
        """Reinitializes model parameters."""
        for m in self.modules():
            self._init_weights(m)

    def _init_weights(self, m):
        if isinstance(m, nn.Linear):
            nn.init.xavier_uniform_(m.weight)
            if m.bias is not None:
                nn.init.zeros_(m.bias)
        elif isinstance(m, nn.LayerNorm):
            nn.init.ones_(m.weight)
            nn.init.zeros_(m.bias)
        elif isinstance(m, HGTConv) or isinstance(m, SAGPooling):
            m.reset_parameters()

    def forward(self, data: HeteroData) -> Tensor:
        r"""Runs the forward pass of the module.

        Args:
            data (torch_geometric.data.HeteroData): A data object containing
                input node features and graph  connectivity information for 
                each individual edge type.
    
        :rtype: :obj:`torch.Tensor` - The output prediction tensor.
        """
        x_dict, edge_index_dict = data.x_dict, data.edge_index_dict

        # Projection layers
        for proj in self.proj:
            x_dict = proj(x_dict)
            for k, v in x_dict.items():
                x_dict[k] = F.gelu(v)
                if k != "base":
                    x_dict[k] = F.dropout(v, p=self.dropout_fc, training=self.training)

        # First convolutional layer
        x_dict = self.conv[0](x_dict, edge_index_dict)

        for k in list(x_dict.keys()):
            if k == "base":
                x_dict.pop(k)
        for k in list(edge_index_dict.keys()):
            if k[1] == "base":
                edge_index_dict.pop(k)

        # Subsequent convolutional layers
        for i in range(1, self.n_conv_layers):
            x_dict = {
                k: F.dropout(v, p=self.dropout_conv, training=self.training) 
                for k, v in x_dict.items()
            }
            x_dict = self.conv[i](x_dict, edge_index_dict)

        # Pooling layer
        instr_edge_index = torch.cat([
            v for k, v in edge_index_dict.items() if k[0] == "instr" and k[2] == "instr"
        ], dim=1)
        instr_batch = data.batch_dict["instr"]
        batch_size = instr_batch.max().item() + 1

        out = self.pool(
            x_dict["instr"], instr_edge_index, batch=instr_batch
        )[0].view(batch_size, -1)

        # Graph-level MLP
        out = self.mlp(out).squeeze(1)
        return out