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
        self.inducing_points = nn.Parameter(torch.Tensor(num_inducing_points, input_dim))
        glorot(self.inducing_points)
        self.fc_out = nn.Linear(input_dim, output_dim)

    def forward(self, x):
        x, _ = self.multihead_attn(self.inducing_points, x, x)  # Shape: (num_inducing_points, input_dim)
        x = torch.mean(x, dim=0)  # Aggregate inducing points to a single vector
        return self.fc_out(x)

class HAN(nn.Module):
    def __init__(self, in_features:dict, hid_dim_l1, hid_dim_l2, n_heads_l1, n_heads_l2, out_dim):
        super(HAN, self).__init__()

        node_types = ['inst', 'var', 'const']
        edge_types = [('inst', 'control', 'inst'), ('inst', 'call', 'inst'), ('inst', 'data', 'var'), ('var', 'data', 'inst'), ('const', 'data', 'inst')]
        metadata = (node_types, edge_types)

        self.han_conv_1 = HANConv(in_channels=in_features, out_channels=hid_dim_l1, metadata=metadata, heads=n_heads_l1, negative_slope=0.1, dropout=0.4)
        self.han_conv_2 = HANConv(in_channels=hid_dim_l1, out_channels=hid_dim_l2, metadata=metadata, heads=n_heads_l2, negative_slope=0.1, dropout=0.2)
        self.han_conv_3 = HANConv(in_channels=hid_dim_l2, out_channels=8 * out_dim, metadata=metadata, heads=4, negative_slope=0.1)

        self.set_transformer_inst = SetTransformer(8 * out_dim, 4 * out_dim)
        self.set_transformer_var = SetTransformer(8 * out_dim, 4 * out_dim)

        self.fc_out = nn.Linear(4 * out_dim, out_dim, bias=True)

        self.reset_parameters()

    def reset_parameters(self):
        # Initialize bias with a small positive value to prevent propagation of negative values
        nn.init.constant_(self.fc_out.bias, 0.01)

    def forward(self, x_dict, edge_index_dict):
        x_dict = self.han_conv_1(x_dict, edge_index_dict)
        x_dict['inst'] = F.elu(x_dict['inst'])
        x_dict['var'] = F.elu(x_dict['var'])

        if 'const' in x_dict:
            x_dict.pop('const')

        if ('const', 'data', 'inst') in edge_index_dict:
            edge_index_dict.pop(('const', 'data', 'inst'))

        x_dict = self.han_conv_2(x_dict, edge_index_dict)
        x_dict['inst'] = F.elu(x_dict['inst'])
        x_dict['var'] = F.elu(x_dict['var'])

        x_dict = self.han_conv_3(x_dict, edge_index_dict)
        x_dict['inst'] = F.elu(x_dict['inst'])
        x_dict['var'] = F.elu(x_dict['var'])

        inst_agg = self.set_transformer_inst(x_dict['inst'])
        var_agg = self.set_transformer_var(x_dict['var'])

        agg = inst_agg + var_agg
        agg = self.fc_out(F.leaky_relu(agg, negative_slope=0.01))

        return agg