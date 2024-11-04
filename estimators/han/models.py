import torch
import torch.nn as nn
import torch.nn.functional as F
from torch_geometric.nn.conv import HANConv
from torch_geometric.nn.inits import glorot
from torch.nn import MultiheadAttention

class SetTransformer(nn.Module):
    def __init__(self, input_dim, output_dim, num_heads=4, num_inducing_points=8):
        super(SetTransformer, self).__init__()
        self.multihead_attn = MultiheadAttention(input_dim, num_heads)
        self.inducing_points = nn.Parameter(torch.randn(num_inducing_points, input_dim))
        self.fc_out = nn.Linear(input_dim, output_dim)

    def forward(self, x):
        x, _ = self.multihead_attn(self.inducing_points, x, x)  # Shape: (num_inducing_points, input_dim)
        x = torch.mean(x, dim=0)  # Aggregate inducing points to a single vector
        return self.fc_out(x)

class HAN(nn.Module):
    def __init__(self, in_features:dict, hid_dim_l1, hid_dim_l2, hid_dim_l3, n_heads_l1, n_heads_l2, n_heads_l3, out_dim):
        super(HAN, self).__init__()

        node_types = ['inst', 'var', 'const']
        edge_types = [('inst', 'control', 'inst'), ('inst', 'call', 'inst'), ('inst', 'data', 'var'), ('var', 'data', 'inst'), 
                      ('const', 'data', 'inst'), ('inst', 'id', 'inst'), ('var', 'id', 'var')]
        metadata = (node_types, edge_types)

        self.han_conv_1 = HANConv(in_channels=in_features, out_channels=hid_dim_l1, metadata=metadata, heads=n_heads_l1, negative_slope=0.1, dropout=0.6)
        self.han_conv_2 = HANConv(in_channels=hid_dim_l1, out_channels=hid_dim_l2, metadata=metadata, heads=n_heads_l2, negative_slope=0.1, dropout=0.5)
        self.han_conv_3 = HANConv(in_channels=hid_dim_l2, out_channels=hid_dim_l3, metadata=metadata, heads=n_heads_l3, negative_slope=0.1)

        self.norm_1 = nn.LayerNorm(hid_dim_l1)
        self.norm_2 = nn.LayerNorm(hid_dim_l2)

        self.set_transformer_inst = SetTransformer(hid_dim_l3, hid_dim_l3)
        self.set_transformer_var = SetTransformer(hid_dim_l3, hid_dim_l3)

        self.fc_out = nn.Linear(hid_dim_l3, out_dim)

    def forward(self, x_dict, edge_index_dict):

        x_dict = self.han_conv_1(x_dict, edge_index_dict)
        x_dict['inst'] = F.elu(x_dict['inst'])
        x_dict['var'] = F.elu(x_dict['var'])

        if 'const' in x_dict:
            x_dict.pop('const')

        if ('const', 'data', 'inst') in edge_index_dict:
            edge_index_dict.pop(('const', 'data', 'inst'))

        x_dict['inst'] = self.norm_1(x_dict['inst'])
        x_dict['var'] = self.norm_1(x_dict['var'])

        x_dict = self.han_conv_2(x_dict, edge_index_dict)
        x_dict['inst'] = F.elu(x_dict['inst'])
        x_dict['var'] = F.elu(x_dict['var'])
        x_dict['inst'] = self.norm_2(x_dict['inst'])
        x_dict['var'] = self.norm_2(x_dict['var'])

        x_dict = self.han_conv_3(x_dict, edge_index_dict)
        x_dict['inst'] = F.elu(x_dict['inst'])
        x_dict['var'] = F.elu(x_dict['var'])

        inst_agg = self.set_transformer_inst(x_dict['inst'])
        var_agg = self.set_transformer_var(x_dict['var'])

        agg = inst_agg + var_agg

        return F.relu(self.fc_out(agg))