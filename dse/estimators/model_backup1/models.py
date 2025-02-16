from typing import Dict, Union, Optional, List
from torch.types import Device
from torch_geometric.typing import NodeType, EdgeType, OptTensor, Metadata

import math
import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn import HGTConv, LayerNorm
from torch_geometric.data import HeteroData
from torch_geometric.nn.inits import reset
from dse.estimators.layers import HetSAGPooling

class HGT(nn.Module):
    r"""Module that uses the Heterogeneous Graph Transformer (HGT) operator from the
    `"Heterogeneous Graph Transformer" <https://arxiv.org/abs/2003.01332>`_ paper to
    perform graph-level regression.

    Args:
        metadata (Tuple[List[str], List[Tuple[str, str, str]]]):
            Metadata object containing node and edge types.
        in_channels (int or Dict[str, int]):
            Number of input channels for each node type.
        out_channels (int):
            Number of output channels.
        hid_dim_conv (int or List[int]):
            Hidden dimension for each convolutional layer.
        num_conv_layers (int):
            Number of convolutional layers.
            (default: :obj:`6`)
        hid_dim_fc (int or List[int], optional):
            Hidden dimension for each fully connected layer.
            (default: :obj:`None`)
        num_fc_layers (int):
            Number of fully connected layers.
            (default: :obj:`3`)
        num_heads (int or List[int]):
            Number of attention heads for each convolutional layer.
            (default: :obj:`1`)
        fc_dropout (float):
            Dropout rate for fully connected layers.
            (default: :obj:`0.1`)
        conv_dropout (float):
            Dropout rate for convolutional layers.
            (default: :obj:`0.0`)
        pool_size (int):
            Number of nodes to keep after pooling.
            (default: :obj:`8`)
        aggr_paths (List[List[EdgeType]], optional):
            List of edge type combinations to aggregate over.
            (default: :obj:`None`)
        use_norm (bool):
            Whether to use normalization layers.
            (default: :obj:`True`)
        device (torch.device):
            Device to use for computation.
            (default: :obj:`"cpu"`)
    """
    def __init__(
        self, 
        metadata: Metadata,
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        hid_dim_conv: Union[int, List[int]],
        num_conv_layers: int = 6,
        hid_dim_fc: Optional[Union[int, List[int]]] = None,
        num_fc_layers: int = 3,
        num_heads: Union[int, List[int]] = 1,
        fc_dropout: float = 0.0,
        conv_dropout: float = 0.0,
        pool_size: int = 8,
        aggr_paths: Optional[List[List[EdgeType]]] = None,
        layer_norm: bool = True,
        device: Optional[Device] = 'cpu'
    ):
        super().__init__()

        assert num_conv_layers >= 2, "Number of conv layers must be at least 2."

        hid_dim_conv = [hid_dim_conv] * num_conv_layers if isinstance(hid_dim_conv, int) else hid_dim_conv
        num_heads = [num_heads] * num_conv_layers if isinstance(num_heads, int) else num_heads
        aggr_paths = aggr_paths if aggr_paths else [metadata[1]]

        self.device = device
        self.node_types = metadata[0]
        self.edge_types = metadata[1]
        self.hid_dim = hid_dim_conv
        self.num_layers = num_conv_layers
        self.heads = num_heads
        self.use_norm = layer_norm
        self.aggr_paths = aggr_paths
        self.num_aggr_paths = len(aggr_paths)

        if isinstance(in_channels, int):
            in_channels = {nt: in_channels for nt in self.node_types}

        # Define convolutional layers
        self.conv = nn.ModuleList([
            HGTConv(in_channels if i == 0 else hid_dim_conv[i-1], hid_dim_conv[i], metadata, num_heads[i])
            for i in range(num_conv_layers)
        ])

        # Define normalization layers (optional)
        if self.use_norm:
            self.norm = nn.ModuleDict({
                nt: nn.ModuleList(LayerNorm(hid_dim_conv[i]) for i in range(num_conv_layers))
                for nt in self.node_types
            })

        # Define dropouts
        self.conv_dropout = nn.Dropout(conv_dropout)

        # Define node-wise fully connected layers to be applied after
        # the convolutional layers
        pooling_dim = max(hid_dim_conv[-1] // 2, out_channels)
        self.node_fc = nn.ModuleDict({
            nt: nn.Sequential(
                nn.Linear(hid_dim_conv[-1], pooling_dim),
                nn.GELU()
            )
            for nt in self.node_types
        })

        # Define pooling layer
        self.pool = HetSAGPooling(metadata, pooling_dim, aggr_paths, pool_size)
        
        aggr_dim = pooling_dim * pool_size

        # Define fully connected layers
        if hid_dim_fc is None:
            hid_dim_fc = [max(aggr_dim // 2, out_channels)]
            for _ in range(num_fc_layers-1):
                hid_dim_fc.append(max(hid_dim_fc[-1] // 2, out_channels))
        elif isinstance(hid_dim_fc, int):
            hid_dim_fc = [hid_dim_fc] * num_fc_layers

        self.mlp = nn.Sequential(
            nn.Linear(aggr_dim, hid_dim_fc[0]),
            nn.GELU(),
            nn.Dropout(fc_dropout)
        )
        for i in range(1, num_fc_layers):
            self.mlp.extend([
                nn.Linear(hid_dim_fc[i-1], hid_dim_fc[i]),
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
        self.node_fc.apply(self._init_weights)
        self.mlp.apply(self._init_weights)
        if self.use_norm:
            self.norm.apply(self._init_weights)

    def _init_weights(self, m):
        if isinstance(m, nn.Linear):
            nn.init.kaiming_normal_(m.weight, mode='fan_in', nonlinearity='leaky_relu')
            if m.bias is not None:
                nn.init.zeros_(m.bias)
        elif isinstance(m, LayerNorm):
            nn.init.constant_(m.weight, math.sqrt(2 / m.in_channels))
            nn.init.normal_(m.bias, mean=0, std=0.01)
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

        # Convolutional layers
        for i in range(self.num_layers):
            x = self.conv[i](x, edge_index)

            if self.use_norm:
                x = {k: self.norm[k][i](v) for k, v in x.items()}

            x = {k: self.conv_dropout(F.gelu(v)) for k, v in x.items()}

        # Node-wise fully connected layers
        x = {k: self.node_fc[k](v) for k, v in x.items()}

        # Edge-wise aggregation
        transformed_data = self._get_transformed_data(x, edge_index)
        x_aggr = self.pool(transformed_data)

        # Fully connected layers
        x_aggr = self.mlp(x_aggr)

        # Avoid NaNs (edge case handling)
        x_aggr = torch.nan_to_num(x_aggr)

        return x_aggr
    
    def _get_transformed_data(
        self,
        x: Dict[NodeType, OptTensor],
        edge_index: Dict[EdgeType, OptTensor]
    ) -> HeteroData:
        transformed_data = HeteroData()
        for k, v in x.items():
            transformed_data[k].x = v
        for k, v in edge_index.items():
            transformed_data[k].edge_index = v
        return transformed_data
