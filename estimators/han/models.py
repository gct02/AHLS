from typing import Dict, List, Optional, Tuple, Union
from torch_geometric.typing import Adj, EdgeType, Metadata, NodeType, OptTensor

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn.conv import HANConv
from torch_geometric.nn.inits import glorot
from torch.nn import MultiheadAttention

class SetTransformer(nn.Module):
    def __init__(
        self, 
        n_in:int,
        n_out:int,
        heads:int,
        n_inducing_points:int
    ):
        super(SetTransformer, self).__init__()
        self.multihead_attn = MultiheadAttention(n_in, heads)
        self.inducing_points = nn.Parameter(torch.randn(n_inducing_points, n_in))
        self.fc_out = nn.Linear(n_in, n_out)

    def forward(
        self,
        x:Tensor
    ) -> Tensor:
        x, _ = self.multihead_attn(self.inducing_points, x, x)  # Shape: (n_inducing_points, n_in)
        x = torch.mean(x, dim=0)  # Aggregate inducing points to a single vector
        return self.fc_out(x)

class HAN(nn.Module):
    def __init__(
        self,
        n_features:List[Union[int, Dict[str, int]]],
        n_out:int,
        n_hid_att:List[int],
        heads_att:List[int],
        n_hid_set:List[int]=None,
        heads_set:List[int]=None,
        norm:bool=True,
        n_inducing_points:int=16
    ):
        super(HAN, self).__init__()

        node_types = ['inst', 'var', 'const']
        edge_types = [('inst', 'control', 'inst'), ('inst', 'call', 'inst'), ('inst', 'data', 'var'), ('var', 'data', 'inst'), 
                      ('const', 'data', 'inst'), ('inst', 'id', 'inst'), ('var', 'id', 'var')]     
        metadata = (node_types, edge_types)     

        self.n_graphs = len(n_features)
        self.normalize = norm
        self.n_inducing_points = n_inducing_points

        if n_hid_set is None:
            n_hid_set = self.n_graphs * [n_out]

        if heads_set is None:
            heads_set = self.n_graphs * [1]

        self.han1 = nn.ModuleList()
        self.han2 = nn.ModuleList()
        self.han3 = nn.ModuleList()

        if norm:
            self.norm1 = nn.ModuleList()
            self.norm2 = nn.ModuleList()

        self.set_transformer_inst = nn.ModuleList()
        self.set_transformer_var = nn.ModuleList()

        self.fc_inst_agg = nn.ModuleList()
        self.fc_var_agg = nn.ModuleList()

        for i in range(self.n_graphs):
            self.han1.append(HANConv(in_channels=n_features[i], out_channels=n_hid_att[i], metadata=metadata, heads=heads_att[i], negative_slope=0.1, dropout=0.6))
            self.han2.append(HANConv(in_channels=n_hid_att[i], out_channels=n_hid_att[i], metadata=metadata, heads=heads_att[i], negative_slope=0.1, dropout=0.5))
            self.han3.append(HANConv(in_channels=n_hid_att[i], out_channels=n_hid_set[i], metadata=metadata, heads=heads_set[i], negative_slope=0.1))
            
            if norm:
                self.norm1.append(nn.LayerNorm(n_hid_att[i]))
                self.norm2.append(nn.LayerNorm(n_hid_att[i]))

            self.set_transformer_inst.append(SetTransformer(n_hid_set[i], n_hid_set[i], heads_set[i], n_inducing_points))
            self.set_transformer_var.append(SetTransformer(n_hid_set[i], n_hid_set[i], heads_set[i], n_inducing_points))

            self.fc_inst_agg.append(nn.Linear(n_hid_set[i], n_out))
            self.fc_var_agg.append(nn.Linear(n_hid_set[i], n_out))

        self.fc_graph_agg = nn.Linear(2 * n_out, n_out)
        self.fc_out = nn.Linear(self.n_graphs * n_out, n_out)

    def forward(
        self, 
        x_dict:List[Dict[NodeType, Tensor]],
        edge_index_dict:List[Dict[EdgeType, Adj]]
    ) -> Tensor:
        agg = []

        for i in range(self.n_graphs):
            h = self.han1[i](x_dict[i], edge_index_dict[i])
            h['inst'] = F.elu(h['inst'])
            h['var'] = F.elu(h['var'])

            if 'const' in h:
                h.pop('const')

            if ('const', 'data', 'inst') in edge_index_dict[i]:
                edge_index_dict[i].pop(('const', 'data', 'inst'))

            if self.normalize:
                h['inst'] = self.norm1[i](h['inst'])
                h['var'] = self.norm1[i](h['var'])

            h = self.han2[i](h, edge_index_dict[i])
            h['inst'] = F.elu(h['inst'])
            h['var'] = F.elu(h['var'])

            if self.normalize:
                h['inst'] = self.norm2[i](h['inst'])
                h['var'] = self.norm2[i](h['var'])

            h = self.han3[i](h, edge_index_dict[i])
            h['inst'] = F.elu(h['inst'])
            h['var'] = F.elu(h['var'])

            inst_agg = self.set_transformer_inst[i](h['inst'])
            var_agg = self.set_transformer_var[i](h['var'])

            inst_agg = F.gelu(self.fc_inst_agg[i](inst_agg))
            var_agg = F.gelu(self.fc_var_agg[i](var_agg))

            graph_agg = torch.cat([inst_agg, var_agg], dim=-1)
            graph_agg = F.leaky_relu(self.fc_graph_agg(graph_agg), negative_slope=0.01)

            agg.append(graph_agg)

        agg = torch.cat(agg, dim=0)
        agg = F.relu(self.fc_out(agg)).squeeze(0)

        return agg