import torch
import torch.nn as nn
import torch.nn.functional as F

class GraphAttentionalLayer(nn.Module):
    def __init__(self, in_features:int, out_features:int, n_heads:int, 
                 concat:bool=False, leaky_relu_slope:float=0.1, dropout:float=0.4):
        super(GraphAttentionalLayer, self).__init__()
        self.n_heads = n_heads
        self.concat = concat
        self.dropout = dropout
        self.leaky_relu = nn.LeakyReLU(leaky_relu_slope)

        self.out_features = out_features
        if concat:
            assert out_features % n_heads == 0
            self.n_hidden = out_features // n_heads
        else:
            self.n_hidden = out_features
        
        self.W = nn.Parameter(torch.empty(size=(in_features, self.n_hidden * n_heads)))
        self.a = nn.Parameter(torch.empty(size=(n_heads, 2 * self.n_hidden, 1)))

        self.reset_parameters()

    def reset_parameters(self):
        nn.init.xavier_normal_(self.W, gain=1.41)
        nn.init.xavier_normal_(self.a, gain=1.41)

    def _get_att_scores(self, h_transformed:torch.Tensor, adj_mat:torch.Tensor):
        source = torch.matmul(h_transformed, self.a[:, :self.n_hidden, :])
        target = torch.matmul(h_transformed, self.a[:, self.n_hidden:, :])
        e = self.leaky_relu(source + target.mT)
        e[:, adj_mat == 0] = -9e15
        return e

    def forward(self, h:torch.Tensor, adj_mat:torch.Tensor):
        h_transformed = torch.mm(h, self.W).view(h.shape[0], self.n_heads, self.n_hidden).permute(1, 0, 2)
        h_transformed = F.dropout(h_transformed, self.dropout, training=self.training)

        e = self._get_att_scores(h_transformed, adj_mat)
        torch.cuda.empty_cache()
        att = F.softmax(e, dim=-1)
        att = F.dropout(att, self.dropout, training=self.training)
        
        h_prime = torch.matmul(att, h_transformed)

        # output shape (n_nodes, out_features)
        if self.concat:
            h_prime = h_prime.permute(1, 0, 2).contiguous().view(h.shape[0], self.out_features)
        else:
            h_prime = h_prime.mean(dim=0)

        return h_prime