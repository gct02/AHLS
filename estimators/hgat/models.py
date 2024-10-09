import torch
import torch.nn as nn
import torch.nn.functional as F
from estimators.hgat.layers import SimpleHGATLayer

class SimpleHGAT(nn.Module):
    def __init__(self, n_feats_inst, n_feats_var, n_feats_const, n_hidden_1, n_hidden_2, n_out, n_heads=1):
        super(SimpleHGAT, self).__init__()

        assert n_hidden_1 % n_heads == 0

        self.hgat = SimpleHGATLayer(n_feats_inst, n_feats_var, n_feats_const, n_hidden_1, n_heads, True, 0.01, 0.3)

        self.fc_1 = nn.Linear(n_hidden_1, n_hidden_2)
        self.fc_2 = nn.Linear(n_hidden_2, n_out)

        self.reset_parameters()

    def reset_parameters(self):
        nn.init.kaiming_normal_(self.fc_1.weight, a=0.1, nonlinearity='leaky_relu')
        nn.init.kaiming_normal_(self.fc_2.weight, a=0.1, nonlinearity='leaky_relu')

        nn.init.constant_(self.fc_1.bias, 0.1)
        nn.init.constant_(self.fc_2.bias, 0.1)

    def forward(self, x:torch.Tensor, node_types:torch.Tensor, 
                adj_mat_control:torch.Tensor, adj_mat_data:torch.Tensor, adj_mat_call:torch.Tensor):
        z = self.hgat(x, node_types, adj_mat_control, adj_mat_data, adj_mat_call)

        # Sum the final hidden states
        z = torch.sum(z, dim=0)

        z = F.leaky_relu(self.fc_1(z), negative_slope=0.1)
        z = F.leaky_relu(self.fc_2(z), negative_slope=0.1)

        return z