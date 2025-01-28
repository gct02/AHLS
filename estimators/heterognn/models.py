from typing import Dict, Union, List, Tuple, Optional, Any

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn.pool import SAGPooling
from torch_geometric.nn.conv import HGTConv, GATConv
from torch_geometric.nn.dense import HeteroLinear, Linear
from torch_geometric.nn.norm import LayerNorm
from torch_geometric.data import HeteroData

class HGT(nn.Module):
    def __init__(
        self,
        metadata: Tuple[List[str], List[Tuple[str, str, str]]],
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        hid_dim_1: int,
        heads_1: int,
        hid_dim_2: Optional[int] = None,
        heads_2: Optional[int] = None,
        num_layers: int = 3,
        k: int = 8,
        dropout_fc: float = 0.1,
        dropout_conv: float = 0.0,
        use_residual: bool = True,
        use_norm: bool = True,
        device: Optional[torch.device] = None,
    ):
        super(HGT, self).__init__()

        if device is None:
            device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')

        assert num_layers >= 2

        self.use_norm = use_norm
        self.use_residual = use_residual
        self.num_layers = num_layers
        self.k = k

        if hid_dim_2 is None:
            hid_dim_2 = hid_dim_1
            
        if heads_2 is None:
            heads_2 = heads_1

        self.conv = nn.ModuleList()
        self.conv.append(HGTConv(
            metadata=metadata,
            in_channels=in_channels, out_channels=hid_dim_1,
            heads=heads_1
        ))
        for _ in range(num_layers - 2):
            self.conv.append(HGTConv(
                metadata=metadata,
                in_channels=hid_dim_1, out_channels=hid_dim_1,
                heads=heads_1
            ))
        self.conv.append(HGTConv(
            metadata=metadata,
            in_channels=hid_dim_1, out_channels=hid_dim_2,
            heads=heads_2
        ))

        if use_norm:
            self.norm = {
                node_type: nn.ModuleList() for node_type in metadata[0]
            }
            for node_type in metadata[0]:
                self.norm[node_type].append(LayerNorm(hid_dim_1).to(device))
                for _ in range(num_layers - 2):
                    self.norm[node_type].append(LayerNorm(hid_dim_1).to(device))

        self.dropout_fc = nn.Dropout(dropout_fc)
        self.dropout_conv = nn.Dropout(dropout_conv)
        
        if hid_dim_2 > 2*out_channels:
            hid_dim_3 = hid_dim_2 // 2
        else:
            hid_dim_3 = hid_dim_2

        self.pool = SAGPooling(hid_dim_2, ratio=k, GNN=GATConv)

        self.fc1 = Linear(k*hid_dim_2, hid_dim_2)
        self.fc2 = Linear(hid_dim_2, hid_dim_3)
        self.fc3 = Linear(hid_dim_3, out_channels)

        self.to(device)

    def forward(
        self,
        data: HeteroData,
    ) -> Tensor:
        x, edge_index = data.x_dict, data.edge_index_dict

        for i in range(self.num_layers):
            residual = x
            x = self.conv[i](x, edge_index)

            for k in x.keys():
                if i < self.num_layers - 1:
                    if self.use_norm:
                        x[k] = self.norm[k][i](x[k])

                    if self.use_residual and i > 0:
                        x[k] += residual[k]

                x[k] = F.gelu(x[k])
                if i < self.num_layers - 1:
                    x[k] = self.dropout_conv(x[k])

        # Create a homogeneous version of the input graph
        # (necessary for the SAGPooling layer)
        transformed_data = HeteroData()
        for k, v in x.items():
            transformed_data[k].x = v
        for k, v in edge_index.items():
            transformed_data[k].edge_index = v

        data_hom = transformed_data.to_homogeneous()
        # homogeneous = homogeneous.sort(sort_by_row=False)
        x_hom = data_hom.x
        edge_index_hom = data_hom.edge_index

        # Apply SAGPooling to aggregate node embeddings from all nodes
        # into self.k representative nodes (k=8 by default) using GATConv
        x_agg = self.pool(x_hom, edge_index_hom)[0]
        
        # Flatten the node embeddings into a one-dimensional tensor
        x_agg = x_agg.flatten()

        # Fully connected layers
        x_agg = self.dropout_fc(F.gelu(self.fc1(x_agg)))
        x_agg = self.dropout_fc(F.gelu(self.fc2(x_agg)))
        x_agg = F.gelu(self.fc3(x_agg))

        # Avoid NaNs (should not happen, but just in case)
        x_agg = x_agg.nan_to_num_()

        print(x_agg)

        return x_agg