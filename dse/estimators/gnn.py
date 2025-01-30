from typing import Dict, Union, Optional
from torch.types import Device
from torch_geometric.typing import NodeType, EdgeType, OptTensor, Metadata

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn import SAGPooling, HGTConv, GATConv, Linear, LayerNorm
from torch_geometric.data import HeteroData, Data

class HGT(nn.Module):
    def __init__(
        self,
        metadata: Metadata,
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        hid_dim_1: int,
        heads_1: int,
        hid_dim_2: Optional[int] = None,
        heads_2: Optional[int] = None,
        num_conv_layers: int = 5,
        dropout_fc: float = 0.1,
        dropout_conv: float = 0.0,
        pool_size: int = 8,
        use_norm: bool = True,
        use_residual: bool = True,
        device: Optional[Device] = None,
    ):
        super().__init__()

        # Set device
        self.device = device or torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

        assert num_conv_layers >= 2, "Number of convolutional layers must be at least 2."

        self.use_norm = use_norm
        self.use_residual = use_residual
        self.num_conv_layers = num_conv_layers

        # Define dimensions and attention heads
        hid_dim_2 = hid_dim_2 or hid_dim_1
        heads_2 = heads_2 or heads_1
        hid_dim_3 = hid_dim_2 // 2 if hid_dim_2 > 2 * out_channels else hid_dim_2

        # Define convolutional (transformer) layers
        self.conv = nn.ModuleList(
            [HGTConv(in_channels, hid_dim_1, metadata, heads_1)]
        )
        self.conv.extend(
            HGTConv(hid_dim_1, hid_dim_1, metadata, heads_1)
            for _ in range(num_conv_layers - 2)
        )
        self.conv.append(HGTConv(hid_dim_1, hid_dim_2, metadata, heads_2))

        # Define normalization layers (optional)
        if self.use_norm:
            self.norm = {
                node_type: nn.ModuleList(
                    [LayerNorm(hid_dim_1).to(self.device) 
                     for _ in range(num_conv_layers - 1)]
                )
                for node_type in metadata[0]
            }

        # Define dropouts
        self.dropout_fc = nn.Dropout(dropout_fc)
        self.dropout_conv = nn.Dropout(dropout_conv)

        # Define pooling layer
        self.pool = SAGPooling(hid_dim_2, ratio=pool_size, GNN=GATConv)

        # Define fully connected layers
        self.mlp = nn.ModuleList([
            Linear(pool_size*hid_dim_2, hid_dim_2), 
            Linear(hid_dim_2, hid_dim_3),
            Linear(hid_dim_3, hid_dim_3),
            Linear(hid_dim_3, out_channels)
        ])

        self.to(self.device)

    def forward(self, data: HeteroData) -> Tensor:
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

        # Convert heterogeneous data to homogeneous (for pooling)
        data_hom = self._to_homogeneous(x, edge_index)
        x_hom, edge_index_hom = data_hom.x, data_hom.edge_index

        # Aggregate all nodes into a fixed-size node set
        x_agg = self.pool(x_hom, edge_index_hom)[0].flatten()

        # Fully connected layers
        x_agg = self._process_fc_layers(x_agg)

        # Avoid NaNs (edge case handling)
        x_agg = x_agg.nan_to_num_()

        return x_agg

    def _to_homogeneous(self, 
        x: Dict[NodeType, OptTensor],
        edge_index: Dict[EdgeType, OptTensor]
    ) -> Data:
        transformed_data = HeteroData()
        for k, v in x.items():
            transformed_data[k].x = v
        for k, v in edge_index.items():
            transformed_data[k].edge_index = v
        return transformed_data.to_homogeneous()

    def _process_fc_layers(self, x: Tensor) -> Tensor:
        for fc in self.mlp[:-1]:
            x = F.gelu(fc(x))
            x = self.dropout_fc(x)
        return self.mlp[-1](x)
