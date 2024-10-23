import torch
import torch.nn as nn
import torch.nn.functional as F
import math
from estimators.hgt.layers import HGTLayer

class HGT(nn.Module):
    def __init__(self, inst_features_dim, var_features_dim, const_features_dim, hid_dim_l1, hid_dim_l2, n_heads_l1, n_heads_l2, out_dim):
        super(HGT, self).__init__()

        in_dim = math.ceil((inst_features_dim + var_features_dim + const_features_dim) / 3)

        self.proj_inst = nn.Linear(inst_features_dim, in_dim, bias=True)
        self.proj_var = nn.Linear(var_features_dim, in_dim, bias=True)
        self.proj_const = nn.Linear(const_features_dim, in_dim, bias=True)

        self.hgt1 = HGTLayer(in_dim=in_dim, out_dim=hid_dim_l1, n_heads=n_heads_l1, use_norm=True, dropout=0.4)
        self.linear1 = nn.Linear(in_dim, hid_dim_l1, bias=True)

        self.hgt2 = HGTLayer(in_dim=hid_dim_l1, out_dim=hid_dim_l2, n_heads=n_heads_l2, use_norm=True, dropout=0.2)
        self.linear2 = nn.Linear(hid_dim_l1, hid_dim_l2, bias=True)

        self.hgt3 = HGTLayer(in_dim=hid_dim_l2, out_dim=3 * out_dim, n_heads=3, use_norm=False, dropout=0.0)
        self.linear3 = nn.Linear(hid_dim_l2, 3 * out_dim, bias=True)

        self.linear_out = nn.Linear(3 * out_dim, out_dim, bias=True)

        self.reset_parameters()

    def reset_parameters(self):
        # Initialize bias with a small positive value to prevent propagation of negative values
        nn.init.constant_(self.proj_inst.bias, 0.1)
        nn.init.constant_(self.proj_var.bias, 0.1)
        nn.init.constant_(self.proj_const.bias, 0.1)
        nn.init.constant_(self.linear_out.bias, 0.1)

    def forward(self, inst_nodes, var_nodes, const_nodes,
                adj_mat_control, adj_mat_data, adj_mat_call):
        h_inst = self.proj_inst(inst_nodes)
        h_var = self.proj_var(var_nodes)
        h_const = self.proj_const(const_nodes)

        h_inst, h_var, h_const = self.hgt1(h_inst, h_var, h_const, adj_mat_control, adj_mat_data, adj_mat_call)
        h_inst = F.elu(self.linear1(h_inst))
        h_var = F.elu(self.linear1(h_var))
        h_const = F.elu(self.linear1(h_const))

        h_inst, h_var, h_const = self.hgt2(h_inst, h_var, h_const, adj_mat_control, adj_mat_data, adj_mat_call)
        h_inst = F.elu(self.linear2(h_inst))
        h_var = F.elu(self.linear2(h_var))
        h_const = F.elu(self.linear2(h_const))

        h_inst, h_var, h_const = self.hgt3(h_inst, h_var, h_const, adj_mat_control, adj_mat_data, adj_mat_call)
        h_inst = F.elu(self.linear3(h_inst))
        h_var = F.elu(self.linear3(h_var))
        h_const = F.elu(self.linear3(h_const))

        h = torch.sum(torch.cat([h_inst, h_var, h_const], dim=0), dim=0)
        h = F.leaky_relu(self.linear_out(h), negative_slope=0.01)
        return h
