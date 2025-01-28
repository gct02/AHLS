import torch
import torch.nn as nn
import torch.nn.functional as F
from typing import Dict, Union, List, Tuple
from torch_geometric.typing import EdgeType, NodeType
from torch_geometric.nn.conv import HANConv, HGTConv
from torch_geometric.nn.aggr import SetTransformerAggregation
from torch import Tensor

class HGT(nn.Module):
    def __init__(
        self,
        metadata: Tuple[List[str], List[Tuple[str, str, str]]],
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        hid_channels: int,
        heads: int = 1,
        n_inducing_points: int = 16,
        dropout: float = 0.1,
        norm: bool = True
    ):
        super(HGT, self).__init__()

        self.normalize = norm

        self.conv1 = HGTConv(
            metadata=metadata,
            in_channels=in_channels, out_channels=hid_channels,
            heads=heads, dropout=dropout
        )
        self.conv2 = HGTConv(
            metadata=metadata,
            in_channels=hid_channels, out_channels=out_channels,
            heads=heads, dropout=dropout
        )

        if norm:
            self.norm = nn.ModuleDict()
            for node_type in metadata[0]:
                self.norm[node_type] = nn.LayerNorm(hid_channels)

        self.set_transformer = nn.ModuleDict()
        for node_type in metadata[0]:
            self.set_transformer[node_type] = SetTransformerAggregation(
                channels=out_channels,
                num_seed_points=n_inducing_points,
                concat=False,
                layer_norm=True
            )

        n_node_types = len(metadata[0])
        self.fc = nn.Linear(n_node_types*out_channels, out_channels)

    def forward(
        self,
        x_dict: Dict[NodeType, Tensor],
        edge_index_dict: Dict[EdgeType, Tensor]
    ) -> Tensor:
        h = self.conv1(x_dict, edge_index_dict)
        # h = {k: F.relu(v) for k, v in h.items()}

        if self.normalize:
            for k in h.keys():
                h[k] = self.norm[k](h[k])

        h = self.conv2(h, edge_index_dict)
        # h = {k: F.relu(v) for k, v in h.items()}

        # Transform the node embeddings to a graph embedding
        h_agg = []
        for node_type in h.keys():
            h_agg_node = self.set_transformer[node_type](h[node_type])
            h_agg.append(h_agg_node)

        h_agg = self.set_transformer(h)
        h_agg = F.relu(self.fc(h_agg))
        h_agg = h_agg.squeeze(0)

        return h_agg

class HAN(nn.Module):
    def __init__(
        self,
        metadata: Tuple[List[str], List[Tuple[str, str, str]]],
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        hid_channels_att: int,
        hid_channels_pool: Union[int, None] = None,
        heads_att: int = 1,
        heads_pool: int = 1,
        n_inducing_points: int = 16,
        dropout: float = 0.1,
        norm: bool = True
    ):
        super(HAN, self).__init__() 

        self.normalize = norm

        if hid_channels_pool is None:
            hid_channels_pool = out_channels

        self.conv1 = HANConv(
            metadata=metadata,
            in_channels=in_channels, out_channels=hid_channels_att, 
            heads=heads_att, 
            negative_slope=0.1, dropout=dropout
        )
        self.conv2 = HANConv(
            metadata=metadata,
            in_channels=hid_channels_att, out_channels=hid_channels_att, 
            heads=heads_att, 
            negative_slope=0.1, dropout=dropout
        )
        self.conv3 = HANConv(
            metadata=metadata,
            in_channels=hid_channels_att, out_channels=hid_channels_pool, 
            heads=heads_pool, 
            negative_slope=0.1, dropout=0.0
        )

        if norm:
            self.norm1 = nn.ModuleDict()
            self.norm2 = nn.ModuleDict()
            for node_type in metadata[0]:
                if node_type == 'const':
                    continue
                self.norm1[node_type] = nn.LayerNorm(hid_channels_att)
                self.norm2[node_type] = nn.LayerNorm(hid_channels_att)

        self.set_transformer = nn.ModuleDict()
        for node_type in metadata[0]:
            if node_type == 'const':
                continue
            self.set_transformer[node_type] = SetTransformerAggregation(
                channels=hid_channels_pool,
                num_seed_points=n_inducing_points,
                heads=heads_pool,
                layer_norm=True
            )

        self.node_fc1 = nn.ModuleDict()
        self.node_fc2 = nn.ModuleDict()
        for node_type in metadata[0]:
            if node_type == 'const':
                continue
            self.node_fc1[node_type] = nn.Linear(n_inducing_points*hid_channels_pool, hid_channels_pool)
            self.node_fc2[node_type] = nn.Linear(hid_channels_pool, out_channels)

        self.out_fc = nn.Linear(3*out_channels, out_channels)

    def forward(
        self, 
        x_dict:Dict[NodeType, Tensor],
        edge_index_dict:Dict[EdgeType, Tensor]
    ) -> Tensor:
        h = self.conv1(x_dict, edge_index_dict)

        # Remove 'const' nodes after first layer since
        # they are not targeted by any edge
        if 'const' in h:
            h.pop('const')

        if ('const', 'data', 'inst') in edge_index_dict:
            edge_index_dict.pop(('const', 'data', 'inst'))

        if self.normalize:
            for k in h.keys():
                h[k] = self.norm1[k](h[k])

        h = self.conv2(h, edge_index_dict)
        if self.normalize:
            for k in h.keys():
                h[k] = self.norm2[k](h[k])

        h = self.conv3(h, edge_index_dict)

        h_agg = []
        for node_type in h.keys():
            h_agg_node = self.set_transformer[node_type](h[node_type])
            h_agg_node = F.gelu(self.node_fc1[node_type](h_agg_node))
            h_agg_node = self.node_fc2[node_type](h_agg_node)
            h_agg.append(h_agg_node)

        h_agg = torch.cat(h_agg, dim=-1)
        h_agg = F.relu(self.out_fc(h_agg))
        h_agg = h_agg.squeeze(0)

        return h_agg