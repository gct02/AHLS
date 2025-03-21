from typing import Dict, Union, Optional, List

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn import HGTConv
from torch_geometric.data import HeteroData
from torch_geometric.nn.inits import reset
from torch.types import Device
from torch_geometric.typing import Metadata, NodeType


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
        num_layers (int, optional): Number of convolutional layers.
            (default: :obj:`6`)
        hid_dim (int or List[int], optional): Hidden dimension of the convolutional
            layers. (default: :obj:`64`)
        heads (int or List[int], optional): Number of attention heads for the
            convolutional layers. (default: :obj:`8`)
        dropout (float): Dropout rate for fully connected layers. 
            (default: :obj:`0.0`)
        num_virtual_nodes (int, optional): Number of virtual nodes to use.
            (default: :obj:`1`)
        mlp_hid_dim (List[int], optional): List of hidden layer sizes for the MLP.
            (default: :obj:`None`)
        device (torch.device): Device to use for computation. 
            (default: :obj:`"cpu"`)
    """
    def __init__(self, 
        metadata: Metadata,
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        num_layers: int = 6,
        hid_dim: Union[int, List[int]] = 64,
        heads: Union[int, List[int]] = 8,
        dropout: float = 0.0,
        num_virtual_nodes: int = 1,
        device: Device = 'cpu'
    ):
        super().__init__()

        self.device = device
        self.dropout = dropout
        self.num_layers = num_layers

        if isinstance(hid_dim, int):
            hid_dim = [hid_dim] * num_layers

        if isinstance(heads, int):
            heads = [heads] * num_layers

        # Define convolutional layers
        self.conv = nn.ModuleList([
            HGTConv(hid_dim[i-1] if i > 0 else in_channels, hid_dim[i], metadata, heads[i])
            for i in range(num_layers)
        ])

        # Define jumping knowledge layer
        self.attn_jk = nn.MultiheadAttention(hid_dim[-1], heads[-1], dropout=dropout)

        # Define graph-level fully connected layers
        self.mlp = nn.Sequential()

        mlp_hid_dim = self._get_mlp_layer_dims(hid_dim[-1] * num_virtual_nodes, out_channels)
        depth = len(mlp_hid_dim) - 1
        for i in range(depth):
            self.mlp.extend([
                nn.Linear(mlp_hid_dim[i], mlp_hid_dim[i+1]),
                nn.GELU(),
                nn.Dropout(dropout)
            ])

        self.mlp.append(nn.Linear(mlp_hid_dim[-1], out_channels))

        self.reset_parameters()
        self.to(device)

    def reset_parameters(self):
        r"""Reinitializes the model parameters."""
        self.conv.apply(self._init_weights)
        self.attn_jk.apply(self._init_weights)
        self.mlp.apply(self._init_weights)

    def _init_weights(self, m):
        if isinstance(m, nn.Linear):
            nn.init.kaiming_normal_(m.weight)
            if m.bias is not None:
                nn.init.zeros_(m.bias)
        else:
            reset(m)

    def _get_mlp_layer_dims(self, in_channels: int, out_channels: int) -> List[int]:
        r"""Computes the sizes of the hidden layers for the MLP."""
        mlp_hid_dim = [in_channels]
        mlp_hid_dim.append(max(out_channels * 2, mlp_hid_dim[-1] // 2))
        while mlp_hid_dim[-1] // 2 > out_channels:
            mlp_hid_dim.append(mlp_hid_dim[-1] // 2)
        return mlp_hid_dim

    def _get_batch_size(self, batch_dict: Dict[NodeType, Tensor]) -> int:
        r"""Computes the batch size from the batch dictionary."""
        return torch.cat([v for v in batch_dict.values()], dim=0).max().item() + 1

    def forward(self, data: HeteroData) -> Tensor:
        r"""Runs the forward pass of the module.

        Args:
            data (torch_geometric.data.HeteroData): A data object containing
                input node features and graph  connectivity information for 
                each individual edge type.
    
        :rtype: :obj:`torch.Tensor` - The output prediction tensor.
        """
        x_dict, edge_index_dict = data.x_dict, data.edge_index_dict
        batch_size = self._get_batch_size(data.batch_dict)
        outs = []

        # Convolutional layers
        for i in range(self.num_layers):
            x_dict = self.conv[i](x_dict, edge_index_dict)
            outs.append(
                F.dropout(x_dict["virtual"], p=self.dropout, training=self.training)
            )

        # Jumping knowledge layer
        out = torch.stack(outs)
        out = self.attn_jk(out, out, out)[0]
        out = out.mean(dim=0).view(batch_size, -1)

        # Graph-level MLP
        out = self.mlp(out)
    
        return out.squeeze(1)