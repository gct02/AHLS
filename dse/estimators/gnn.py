from typing import Dict, Union, Optional, List
from torch.types import Device
from torch_geometric.typing import NodeType, EdgeType, OptTensor, Metadata

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn import SAGPooling, HGTConv, GATConv, Linear, LayerNorm
from torch_geometric.data import HeteroData

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
        hid_dim_conv (int):
            Hidden dimension of convolutional layers.
        heads_conv (int):
            Number of attention heads for convolutional layers.
        num_conv_layers (int):
            Number of convolutional layers.
            (default: :obj:`6`)
        hid_dim_agg (int, optional):
            Hidden dimension of aggregation layers.
            (default: :obj:`None`)
        heads_agg (int, optional):
            Number of attention heads for aggregation layers.
            (default: :obj:`None`)
        dropout_fc (float):
            Dropout rate for fully connected layers.
            (default: :obj:`0.1`)
        dropout_conv (float):
            Dropout rate for convolutional layers.
            (default: :obj:`0.0`)
        pool_size (int):
            Number of nodes to keep after pooling.
            (default: :obj:`8`)
        agg_edge_types (List[List[EdgeType]], optional):
            Lists of edge types to aggregate for each pooling layer.
            (default: :obj:`None`)
        use_norm (bool):
            Whether to use normalization layers.
            (default: :obj:`True`)
        use_residual (bool):
            Whether to use residual connections.
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
        hid_dim_conv: int,
        heads_conv: int,
        num_conv_layers: int = 6,
        hid_dim_agg: Optional[int] = None,
        heads_agg: Optional[int] = None,
        dropout_fc: float = 0.1,
        dropout_conv: float = 0.0,
        pool_size: int = 8,
        agg_edge_types: Optional[List[List[EdgeType]]] = None,
        use_norm: bool = True,
        use_residual: bool = True,
        device: Optional[Device] = 'cpu',
    ):
        super().__init__()

        assert num_conv_layers >= 2, \
            "Number of convolutional layers must be at least 2."
        
        # Set device
        self.device = device

        self.use_norm = use_norm
        self.use_residual = use_residual
        self.num_conv_layers = num_conv_layers

        self.agg_edge_types = agg_edge_types if agg_edge_types else [metadata[1]]
        self.num_agg = len(self.agg_edge_types)

        # Define dimensions and attention heads
        hid_dim_agg = hid_dim_agg or hid_dim_conv
        heads_agg = heads_agg or heads_conv
        hid_dim_fc_1 = hid_dim_agg // 2 if hid_dim_agg > 2*out_channels else hid_dim_agg
        hid_dim_fc_2 = hid_dim_fc_1 // 2 if hid_dim_fc_1 > 2*out_channels else hid_dim_fc_1

        # Define convolutional (transformer) layers
        self.conv = nn.ModuleList(
            [HGTConv(in_channels, hid_dim_conv, metadata, heads_conv)]
        )
        self.conv.extend(
            HGTConv(hid_dim_conv, hid_dim_conv, metadata, heads_conv)
            for _ in range(num_conv_layers - 2)
        )
        self.conv.append(HGTConv(hid_dim_conv, hid_dim_agg, metadata, heads_agg))

        # Define normalization layers (optional)
        if self.use_norm:
            self.norm = nn.ModuleDict({
                node_type: nn.ModuleList(
                    [LayerNorm(hid_dim_conv).to(self.device) 
                     for _ in range(num_conv_layers - 1)]
                )
                for node_type in metadata[0]
            })

        # Define dropouts
        self.dropout_fc = nn.Dropout(dropout_fc)
        self.dropout_conv = nn.Dropout(dropout_conv)

        # Define pooling and readout layers
        agg_out_dim = self._ceildiv(hid_dim_agg, self.num_agg)
        self.pool = nn.ModuleList(
            [SAGPooling(hid_dim_agg, ratio=pool_size, GNN=GATConv, nonlinearity='tanh')
             for _ in range(self.num_agg)]
        )
        self.readout = nn.ModuleList([
            nn.Sequential(
                Linear(hid_dim_agg*pool_size, hid_dim_agg),
                nn.GELU(),
                nn.Dropout(dropout_fc),
                Linear(hid_dim_agg, agg_out_dim)
            )
            for _ in range(self.num_agg)
        ])

        # Define fully connected layers
        self.mlp = nn.Sequential(
            Linear(agg_out_dim*self.num_agg, hid_dim_agg),
            nn.GELU(),
            nn.Dropout(dropout_fc),
            Linear(hid_dim_agg, hid_dim_fc_1),
            nn.GELU(),
            nn.Dropout(dropout_fc),
            Linear(hid_dim_fc_1, hid_dim_fc_2),
            nn.GELU(),
            nn.Dropout(dropout_fc),
            Linear(hid_dim_fc_2, out_channels)
        )

        self.to(self.device)

    def forward(self, data: HeteroData) -> Tensor:
        r"""Runs the forward pass of the module.

        Args:
            data (:class:`torch_geometric.data.HeteroData`):
                A data object containing input node features and graph connectivity
                information for each individual edge type.
    
        Returns: :obj:`torch.Tensor` - The output prediction tensor.
        """
        x, edge_index = data.x_dict, data.edge_index_dict

        # First layer
        x = self.conv[0](x, edge_index)

        if self.use_norm:
            x = {k: self.norm[k][0](v) for k, v in x.items()}

        x = {k: F.gelu(v) for k, v in x.items()}
        x = {k: self.dropout_conv(v) for k, v in x.items()}

        # Intermediate layers
        for i in range(1, self.num_conv_layers - 1):
            residual = x if self.use_residual else None
            x = self.conv[i](x, edge_index)

            if self.use_norm:
                x = {k: self.norm[k][i](v) for k, v in x.items()}

            if residual:
                x = {k: x[k] + 0.5 * residual[k] for k in x.keys()}

            x = {k: F.gelu(v) for k, v in x.items()}
            x = {k: self.dropout_conv(v) for k, v in x.items()}

        # Last layer
        x = self.conv[-1](x, edge_index)
        x = {k: F.gelu(v) for k, v in x.items()}

        # Aggregate nodes from different edge types
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
            x_agg.append(
                self.readout[i](
                    self.pool[i](subg_hom.x, subg_hom.edge_index)[0].flatten()
                )
            )

        # Concatenate all readout vectors
        x_agg = torch.cat(x_agg, dim=-1)
        return x_agg
    
    def _ceildiv(self, a: int, b: int):
        return -(a // -b)
    
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
