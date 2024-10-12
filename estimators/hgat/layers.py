import torch
import torch.nn as nn
import torch.nn.functional as F

class SimpleHGATLayer(nn.Module):
    def __init__(self, n_feats_inst, n_feats_var, n_feats_const, n_hidden, n_heads=1, 
                 leaky_relu_slope:float=0.1, dropout:float=0.5):
        super(SimpleHGATLayer, self).__init__()
        self.n_heads = n_heads
        self.dropout = dropout
        self.leaky_relu_slope = leaky_relu_slope
        self.leaky_relu = nn.LeakyReLU(leaky_relu_slope)
        self.n_hidden = n_hidden
        
        # Matrices to project features of different types of nodes into the same feature space
        self.M_inst = nn.Parameter(torch.empty(size=(n_feats_inst, self.n_hidden * n_heads)))
        self.M_var = nn.Parameter(torch.empty(size=(n_feats_var, self.n_hidden * n_heads)))
        self.M_const = nn.Parameter(torch.empty(size=(n_feats_const, self.n_hidden * n_heads)))

        # Attention vectors for different types of edges
        self.a_control = nn.Parameter(torch.empty(size=(n_heads, 2 * self.n_hidden, 1)))
        self.a_data = nn.Parameter(torch.empty(size=(n_heads, 2 * self.n_hidden, 1)))
        self.a_call = nn.Parameter(torch.empty(size=(n_heads, 2 * self.n_hidden, 1)))

        self.W = nn.Parameter(torch.empty(size=(self.n_hidden, self.n_hidden)))
        self.b = nn.Parameter(torch.empty(size=(self.n_hidden, 1)))
        self.q = nn.Parameter(torch.empty(size=(self.n_hidden, 1)))

        self.reset_parameters()

    def reset_parameters(self):
        nn.init.kaiming_normal_(self.M_inst, a=self.leaky_relu_slope, nonlinearity='leaky_relu')
        nn.init.kaiming_normal_(self.M_var, a=self.leaky_relu_slope, nonlinearity='leaky_relu')
        nn.init.kaiming_normal_(self.M_const, a=self.leaky_relu_slope, nonlinearity='leaky_relu')
        
        nn.init.kaiming_normal_(self.a_control, a=self.leaky_relu_slope, nonlinearity='leaky_relu')
        nn.init.kaiming_normal_(self.a_data, a=self.leaky_relu_slope, nonlinearity='leaky_relu')
        nn.init.kaiming_normal_(self.a_call, a=self.leaky_relu_slope, nonlinearity='leaky_relu')

        nn.init.kaiming_normal_(self.W, a=self.leaky_relu_slope, nonlinearity='leaky_relu')
        nn.init.kaiming_normal_(self.b, a=self.leaky_relu_slope, nonlinearity='leaky_relu')
        nn.init.kaiming_normal_(self.q, a=self.leaky_relu_slope, nonlinearity='leaky_relu')

    def _divide_by_type(self, x, node_types):
        x_inst= x[node_types == 0]
        x_var = x[node_types == 1]
        x_const = x[node_types == 2]
        return x_inst, x_var, x_const
    
    def _project_features(self, x_inst, x_var, x_const):
        x_inst = x_inst @ self.M_transf_inst
        x_var = x_var @ self.M_transf_var
        x_const = x_const @ self.M_transf_const
        return x_inst, x_var, x_const
    
    def _compute_semantic_att(self, z):
        z_transf = torch.mm(z, self.W).add(self.b)
        return torch.matmul(F.tanh(z_transf), self.q).mean(dim=0)

    def forward(self, x_inst, x_var, x_const, x_inst_indexes, x_var_indexes, x_const_indexes, 
                adj_mat_control, adj_mat_data, adj_mat_call):
        # Project features
        h_inst = x_inst @ self.M_inst
        h_var = x_var @ self.M_var
        h_const = x_const @ self.M_const

        h = torch.where(x_inst_indexes, h_inst, torch.zeros_like(h_inst))
        h = torch.where(x_var_indexes, h_var, h)
        h = torch.where(x_const_indexes, h_const, h)

        h = h.view(self.n_heads, h.shape[0], self.n_hidden)
        h = F.dropout(h, self.dropout, training=self.training)

        # Compute attention scores for each type of edge
        source_control = torch.matmul(h, self.a_control[:, :self.n_hidden, :])
        target_control = torch.matmul(h, self.a_control[:, self.n_hidden:, :])
        e_control = self.leaky_relu(source_control + target_control.mT)
        e_control[:, adj_mat_control == 0] = -9e15
        att_control = F.softmax(e_control, dim=-1)

        source_data = torch.matmul(h, self.a_data[:, :self.n_hidden, :])
        target_data = torch.matmul(h, self.a_data[:, self.n_hidden:, :])
        e_data = self.leaky_relu(source_data + target_data.mT)
        e_data[:, adj_mat_data == 0] = -9e15
        att_data = F.softmax(e_data, dim=-1)

        source_call = torch.matmul(h, self.a_call[:, :self.n_hidden, :])
        target_call = torch.matmul(h, self.a_call[:, self.n_hidden:, :])
        e_call = self.leaky_relu(source_call + target_call.mT)
        e_call[:, adj_mat_call == 0] = -9e15
        att_call = F.softmax(e_call, dim=-1)

        # Multiply by attention scores and take the mean between heads
        z_control = torch.matmul(att_control, h).mean(dim=0)
        z_data = torch.matmul(att_data, h).mean(dim=0)
        z_call = torch.matmul(att_call, h).mean(dim=0)

        # Calculate semantic attention scores
        w_control = self._compute_semantic_att(z_control)
        w_data = self._compute_semantic_att(z_data)
        w_call = self._compute_semantic_att(z_call)

        # Normalize semantic attention scores
        betas = torch.stack([w_control, w_data, w_call], dim=0)
        betas = F.softmax(betas, dim=0)

        # Combine the three types of semantic information
        z = betas[0] * z_control + betas[1] * z_data + betas[2] * z_call
        
        return z