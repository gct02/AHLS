from typing import Dict, Union, Optional, List
from torch.types import Device
from torch_geometric.typing import NodeType, EdgeType, OptTensor, Metadata

import math
import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn import SAGPooling, HGTConv, GATConv, Linear, LayerNorm
from torch_geometric.data import HeteroData
from torch_geometric.nn.inits import reset

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
        hid_dim (int):
            Hidden dimension.
        heads (int):
            Number of attention heads.
            (default: :obj:`1`)
        n_layers (int):
            Number of convolutional layers.
            (default: :obj:`6`)
        fc_dropout (float):
            Dropout rate for fully connected layers.
            (default: :obj:`0.1`)
        conv_dropout (float):
            Dropout rate for convolutional layers.
            (default: :obj:`0.0`)
        pool_size (int):
            Number of nodes to keep after pooling.
            (default: :obj:`16`)
        agg_edge_types (List[List[EdgeType]], optional):
            Lists of edge types to aggregate for each pooling layer.
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
        hid_dim: int,
        heads: int = 1,
        n_layers: int = 6,
        fc_dropout: float = 0.1,
        conv_dropout: float = 0.0,
        pool_size: int = 16,
        agg_edge_types: Optional[List[List[EdgeType]]] = None,
        use_norm: bool = True,
        device: Optional[Device] = 'cpu'
    ):
        super().__init__()

        assert n_layers >= 2, \
            "Number of convolutional layers must be at least 2."

        self.device = device
        self.node_types = metadata[0]
        self.edge_types = metadata[1]
        self.hid_dim = hid_dim
        self.n_layers = n_layers
        self.use_norm = use_norm
        self.agg_edge_types = agg_edge_types if agg_edge_types else [self.edge_types]
        self.num_agg = len(self.agg_edge_types)

        if isinstance(in_channels, int):
            in_channels = {nt: in_channels for nt in self.node_types}

        # Define input projection layers for each node type
        self.proj = nn.ModuleDict({
            nt: Linear(in_channels[nt], hid_dim)
            for nt in self.node_types
        })

        # Define convolutional layers
        self.conv = nn.ModuleList(
            [HGTConv(hid_dim, hid_dim, metadata, heads)
             for _ in range(n_layers)]
        )

        # Define normalization layers (optional)
        if self.use_norm:
            self.norm = nn.ModuleDict({
                nt: nn.ModuleList(
                    [LayerNorm(hid_dim) for _ in range(n_layers)]
                )
                for nt in self.node_types
            })

        # Define fully connected layer to be applied for each node type
        # after the convolutional layers
        in_agg_dim = max(hid_dim // 2, out_channels)
        self.fc = nn.ModuleDict({
            nt: Linear(hid_dim, in_agg_dim)
            for nt in self.node_types
        })

        # Define dropouts
        self.dropout_fc = nn.Dropout(fc_dropout)
        self.dropout_conv = nn.Dropout(conv_dropout)

        # Define pooling and readout layers
        out_agg_dim = math.ceil(in_agg_dim / self.num_agg)
        self.pool = nn.ModuleList(
            [SAGPooling(in_agg_dim, ratio=pool_size, GNN=GATConv)
             for _ in range(self.num_agg)]
        )
        self.readout = nn.ModuleList([
            nn.Sequential(
                Linear(in_agg_dim*pool_size, in_agg_dim),
                nn.GELU(), 
                nn.Dropout(fc_dropout),
                Linear(in_agg_dim, out_agg_dim),
                nn.GELU(), 
                nn.Dropout(fc_dropout)
            )
            for _ in range(self.num_agg)
        ])

        # Define fully connected layers
        fc1_dim = max(in_agg_dim // 2, out_channels)
        fc2_dim = max(fc1_dim // 2, out_channels)
        
        self.mlp = nn.Sequential(
            Linear(out_agg_dim * self.num_agg, in_agg_dim),
            nn.GELU(), 
            nn.Dropout(fc_dropout),
            Linear(in_agg_dim, fc1_dim),
            nn.GELU(), 
            nn.Dropout(fc_dropout),
            Linear(fc1_dim, fc2_dim),
            nn.GELU(),
            nn.Dropout(fc_dropout),
            Linear(fc2_dim, out_channels)
        )

        self.reset_parameters()
        self.to(self.device)

    def reset_parameters(self):
        r"""Reinitializes the model parameters."""
        self.proj.apply(self._init_weights)
        self.conv.apply(self._init_weights)
        self.fc.apply(self._init_weights)
        self.pool.apply(self._init_weights)
        self.readout.apply(self._init_weights)
        self.mlp.apply(self._init_weights)
        if self.use_norm:
            self.norm.apply(self._init_weights)

    def _init_weights(self, m):
        if isinstance(m, Linear):
            nn.init.kaiming_normal_(m.weight, mode='fan_in', nonlinearity='leaky_relu')
            if m.bias is not None:
                nn.init.zeros_(m.bias)
        elif isinstance(m, LayerNorm):
            nn.init.constant_(m.weight, math.sqrt(2 / m.in_channels))
            nn.init.normal_(m.bias, mean=0, std=0.01)
        elif isinstance(m, HGTConv) or isinstance(m, SAGPooling):
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

        # Node-wise projection layers
        x = {k: self.proj[k](v) for k, v in x.items()}

        # Convolutional layers
        for i in range(self.n_layers):
            x = self.conv[i](x, edge_index)

            if self.use_norm:
                x = {k: self.norm[k][i](v) for k, v in x.items()}

            x = {k: F.gelu(v) for k, v in x.items()}
            if i < self.n_layers - 1:
                x = {k: self.dropout_conv(v) for k, v in x.items()}

        # Node-wise fully connected layers
        x = {k: F.gelu(self.fc[k](v)) for k, v in x.items()}

        # Edge-wise aggregation
        x_agg = self._aggregate(x, edge_index)

        # Fully connected layers
        x_agg = self.mlp(x_agg)

        # Avoid NaNs (edge case handling)
        x_agg = x_agg.nan_to_num_()

        return x_agg
    
    def _aggregate(
        self,
        x: Dict[NodeType, OptTensor],
        edge_index: Dict[EdgeType, OptTensor]
    ) -> Tensor:
        # Create a new HeteroData object with the transformed data
        transformed_data = self._get_transformed_data(x, edge_index)

        # Aggregate nodes based on edge types
        x_agg = []
        for i in range(self.num_agg):
            subg = transformed_data.edge_type_subgraph(self.agg_edge_types[i])
            subg_hom = subg.to_homogeneous()
            x_pool = self.pool[i](subg_hom.x, subg_hom.edge_index)[0]
            x_agg.append(self.readout[i](x_pool.flatten()))

        # Concatenate all readout vectors
        x_agg = torch.cat(x_agg, dim=-1)
        return x_agg
    
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
