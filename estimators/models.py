from typing import Dict, Union, Optional, List

import torch
import torch.nn as nn
from torch import Tensor
from torch_geometric.nn import HGTConv
from torch_geometric.data import HeteroData
from torch_geometric.nn.inits import reset
from torch_geometric.nn.models import JumpingKnowledge
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
        hid_dim (int or List[int]): Hidden dimension for the convolutional layers.
        num_layers (int): Number of convolutional layers. (default: :obj:`6`)
        heads (int or List[int]): Number of attention heads for each convolutional
            layer. (default: :obj:`1`)
        dropout (float): Dropout rate for fully connected layers. 
            (default: :obj:`0.0`)
        jk_mode (str): Mode for the Jumping Knowledge layer. 
            (default: :obj:`"lstm"`)
        mlp_layers (List[int], optional): List of hidden layer sizes for the MLP.
            (default: :obj:`None`)
        num_virtual_nodes (int or Dict[int], optional): Number of virtual nodes to
            use for each node type. (default: :obj:`None`)
        device (torch.device): Device to use for computation. 
            (default: :obj:`"cpu"`)
    """
    def __init__(self, 
        metadata: Metadata,
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        hid_dim: Union[int, List[int]],
        num_layers: int = 6,
        heads: Union[int, List[int]] = 1,
        dropout: float = 0.0,
        num_virtual_nodes: Optional[Union[int, Dict[NodeType, int]]] = None,
        mlp_layers: Optional[List[int]] = None,
        jk_mode: str = 'lstm',
        device: Device = 'cpu'
    ):
        super().__init__()

        self.device = device

        if isinstance(hid_dim, int):
            hid_dim = [hid_dim] * num_layers

        if isinstance(heads, int):
            heads = [heads] * num_layers

        if num_virtual_nodes is None:
            num_virtual_nodes = {nt: 1 for nt in metadata[0]}
        elif isinstance(num_virtual_nodes, int):
            num_virtual_nodes = {nt: num_virtual_nodes for nt in metadata[0]}

        self.virtual_types = [f'virtual_{k}' for k in num_virtual_nodes.keys()]

        # Define convolutional layers
        self.in_conv_layers = nn.ModuleList([
            HGTConv(hid_dim[i-1] if i > 0 else in_channels, hid_dim[i], metadata, heads[i])
            for i in range(num_layers)
        ])
        self.out_conv_layers = nn.ModuleList([
            HGTConv(hid_dim[i], 1, metadata, 1)
            for i in range(num_layers)
        ])

        # Define Jumping Knowledge layer
        self.jk = nn.ModuleDict({
            nt: JumpingKnowledge(jk_mode, 1, num_layers)
            for nt in self.virtual_types
        })

        # Define type-specific fully connected layer
        self.node_fc = nn.ModuleDict({
            f'virtual_{k}': nn.Sequential(
                nn.Linear(v * hid_dim[-1], out_channels),
                nn.GELU()
            )
            for k, v in num_virtual_nodes.items()
        })

        # Define fully connected layers
        num_virtual_types = len(num_virtual_nodes)
        if mlp_layers is None:
            mlp_layers = [num_virtual_types]
            mlp_layers.append(max(out_channels * 2, mlp_layers[-1] // 2))
            while mlp_layers[-1] // 2 > out_channels:
                mlp_layers.append(mlp_layers[-1] // 2)
        else:
            mlp_layers = [num_virtual_types] + mlp_layers

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
        self.to(device)

    def reset_parameters(self):
        r"""Reinitializes the model parameters."""
        self.in_conv_layers.apply(self._init_weights)
        self.out_conv_layers.apply(self._init_weights)
        self.jk.apply(self._init_weights)
        self.node_fc.apply(self._init_weights)
        self.mlp.apply(self._init_weights)

    def _init_weights(self, m):
        if isinstance(m, nn.Linear):
            nn.init.kaiming_normal_(m.weight)
            if m.bias is not None:
                nn.init.zeros_(m.bias)
        else:
            reset(m)

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
        outs = {nt: [] for nt in self.virtual_types}

        virtual_edge_index_dict = {
            k: v for k, v in edge_index_dict.items() if k[2].startswith('virtual')
        }

        # Convolutional layers
        for in_conv, out_conv in zip(self.in_conv_layers, self.out_conv_layers):
            x_dict = in_conv(x_dict, edge_index_dict)
            out_dict = out_conv(x_dict, virtual_edge_index_dict)
            for nt in self.virtual_types:
                outs[nt].append(out_dict[nt])

        # Jumping Knowledge layer
        batch_size = self._get_batch_size(data.batch_dict)
        out_dict = {nt: self.jk[nt](outs[nt]).view(batch_size, -1) 
                    for nt in self.virtual_types}

        # Type-specific fully connected layer
        out = torch.cat([self.node_fc[nt](out_dict[nt]) 
                         for nt in self.virtual_types], dim=-1)

        # Fully connected layers
        return self.mlp(out).squeeze(1)

