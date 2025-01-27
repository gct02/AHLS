import torch
import torch.nn as nn
import torch.nn.functional as F
from typing import Dict, Union
from torch_geometric.typing import Adj, EdgeType, NodeType
from torch_geometric.nn.conv import HANConv
from torch import Tensor
from torch.nn import MultiheadAttention

class SetTransformer(nn.Module):
    def __init__(
        self, 
        n_in: int,
        n_out: int,
        heads: int,
        n_inducing_points: int
    ):
        super(SetTransformer, self).__init__()
        self.multihead_attn = MultiheadAttention(n_in, heads)
        self.inducing_points = nn.Parameter(torch.randn(n_inducing_points, n_in))
        self.fc_out = nn.Linear(n_in, n_out)

    def forward(
        self,
        x: Tensor
    ) -> Tensor:
        x, _ = self.multihead_attn(self.inducing_points, x, x)
        x = torch.mean(x, dim=0)  # Aggregate inducing points to a single vector
        return self.fc_out(x)

class HAN(nn.Module):
    def __init__(
        self,
        n_features: Union[int, Dict[str, int]],
        n_out: int,
        n_hid_att: int,
        heads_att: int,
        n_hid_set: Union[int, None] = None,
        heads_set: int = 1,
        norm: bool = True,
        n_inducing_points: int = 16,
        dropout: float = 0.2
    ):
        super(HAN, self).__init__()

        node_types = ['inst', 'var', 'const', 'array']
        edge_types = [
            ('inst', 'control', 'inst'), 
            ('inst', 'call', 'inst'), 
            ('inst', 'data', 'var'), 
            ('var', 'data', 'inst'), 
            ('const', 'data', 'inst'), 
            ('array', 'data', 'inst'),
            ('inst', 'data', 'array'),
            ('inst', 'id', 'inst'), 
            ('var', 'id', 'var'),
            ('array', 'id', 'array')
        ]     
        metadata = (node_types, edge_types)     

        self.normalize = norm
        self.n_inducing_points = n_inducing_points

        if n_hid_set is None:
            n_hid_set = n_out

        self.han1 = HANConv(
            metadata=metadata,
            in_channels=n_features, out_channels=n_hid_att, 
            heads=heads_att, 
            negative_slope=0.1, dropout=dropout
        )
        self.han2 = HANConv(
            metadata=metadata,
            in_channels=n_hid_att, out_channels=n_hid_att, 
            heads=heads_att, 
            negative_slope=0.1, dropout=dropout
        )
        self.han3 = HANConv(
            metadata=metadata,
            in_channels=n_hid_att, out_channels=n_hid_set, 
            heads=heads_set, 
            negative_slope=0.1
        )

        if norm:
            self.norm1 = nn.LayerNorm(n_hid_att)
            self.norm2 = nn.LayerNorm(n_hid_att)

        self.set_transformer_inst = SetTransformer(
            n_in=n_hid_set, 
            n_out=n_hid_set, 
            heads=heads_set, 
            n_inducing_points=n_inducing_points
        )
        self.set_transformer_var = SetTransformer(
            n_in=n_hid_set, 
            n_out=n_hid_set, 
            heads=heads_set, 
            n_inducing_points=n_inducing_points
        )
        self.set_transformer_array = SetTransformer(
            n_in=n_hid_set, 
            n_out=n_hid_set, 
            heads=heads_set, 
            n_inducing_points=n_inducing_points
        )

        self.fc_inst_agg = nn.Linear(n_hid_set, n_out)
        self.fc_var_agg = nn.Linear(n_hid_set, n_out)
        self.fc_array_agg = nn.Linear(n_hid_set, n_out)
        self.fc_graph_agg = nn.Linear(3 * n_out, n_out)

    def forward(
        self, 
        x_dict:Dict[NodeType, Tensor],
        edge_index_dict:Dict[EdgeType, Adj]
    ) -> Tensor:
        h = self.han1(x_dict, edge_index_dict)
        h['inst'] = F.elu(h['inst'])
        h['var'] = F.elu(h['var'])
        h['array'] = F.elu(h['array'])

        if 'const' in h:
            h.pop('const')

        if ('const', 'data', 'inst') in edge_index_dict:
            edge_index_dict.pop(('const', 'data', 'inst'))

        if self.normalize:
            h['inst'] = self.norm1(h['inst'])
            h['var'] = self.norm1(h['var'])
            h['array'] = self.norm1(h['array'])

        h = self.han2(h, edge_index_dict)
        h['inst'] = F.elu(h['inst'])
        h['var'] = F.elu(h['var'])
        h['array'] = F.elu(h['array'])

        if self.normalize:
            h['inst'] = self.norm2(h['inst'])
            h['var'] = self.norm2(h['var'])
            h['array'] = self.norm2(h['array'])

        h = self.han3(h, edge_index_dict)
        h['inst'] = F.elu(h['inst'])
        h['var'] = F.elu(h['var'])
        h['array'] = F.elu(h['array'])

        inst_agg = self.set_transformer_inst(h['inst'])
        var_agg = self.set_transformer_var(h['var'])
        array_agg = self.set_transformer_array(h['array'])

        inst_agg = F.gelu(self.fc_inst_agg(inst_agg))
        var_agg = F.gelu(self.fc_var_agg(var_agg))
        array_agg = F.gelu(self.fc_array_agg(array_agg))

        graph_agg = torch.cat([inst_agg, var_agg, array_agg], dim=-1)
        graph_agg = self.fc_graph_agg(F.relu(graph_agg))
        graph_agg = graph_agg.squeeze(0)

        return graph_agg