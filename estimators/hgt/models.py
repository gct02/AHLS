import torch
import torch.nn as nn
import torch.nn.functional as F
from estimators.hgt.layers import HGTLayer

class HGT(nn.Module):
    def __init__(self, inst_features_dim, var_features_dim, const_features_dim, hid_dim_l1, hid_dim_l2, n_heads_l1, n_heads_l2, out_dim):
        super(HGT, self).__init__()

        self.proj_inst = nn.Linear(inst_features_dim, hid_dim_l1, bias=True)
        self.proj_var = nn.Linear(var_features_dim, hid_dim_l1, bias=True)
        self.proj_const = nn.Linear(const_features_dim, hid_dim_l1, bias=True)

        self.hgt1 = HGTLayer(in_dim=hid_dim_l1, out_dim=hid_dim_l2, n_heads=n_heads_l1, use_norm=True, dropout=0.6)
        self.hgt2 = HGTLayer(in_dim=hid_dim_l2, out_dim=out_dim, n_heads=n_heads_l2, use_norm=True, dropout=0.4)

        self.linear_out = nn.Linear(3 * out_dim, out_dim, bias=True)

        self.reset_parameters()

    def reset_parameters(self):
        # Initialize biases with a small positive value to prevent propagation of negative values
        nn.init.constant_(self.proj_inst.bias, 0.1)
        nn.init.constant_(self.proj_var.bias, 0.1)
        nn.init.constant_(self.proj_const.bias, 0.1)
        nn.init.constant_(self.linear_out.bias, 0.1)

    def forward(self, inst_nodes, var_nodes, const_nodes,
                adj_mat_control, adj_mat_data, adj_mat_call):
        h_inst = F.leaky_relu(self.proj_inst(inst_nodes), negative_slope=0.1)
        h_var = F.leaky_relu(self.proj_var(var_nodes), negative_slope=0.1)
        h_const = F.leaky_relu(self.proj_const(const_nodes), negative_slope=0.1)

        h_inst, h_var, h_const = self.hgt1(h_inst, h_var, h_const, adj_mat_control, adj_mat_data, adj_mat_call)
        h_inst, h_var, h_const = self.hgt2(h_inst, h_var, h_const, adj_mat_control, adj_mat_data, adj_mat_call)

        h = torch.sum(torch.stack([h_inst, h_var, h_const]), dim=0)
        return F.leaky_relu(self.linear_out(h), negative_slope=0.1)
