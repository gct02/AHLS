import torch
import torch.nn as nn
import torch.nn.functional as F

class GraphAttentionalLayer(nn.Module):
    def __init__(self, in_features:int, out_features:int, n_heads:int, concat:bool=False, leaky_relu_slope:float=0.1, dropout:float=0.1):
        super(GraphAttentionalLayer, self).__init__()
        self.n_heads = n_heads
        self.concat = concat
        self.dropout = nn.Dropout(dropout)
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
        nn.init.xavier_normal_(self.W, gain=1.414)
        nn.init.xavier_normal_(self.a, gain=1.414)

    def _get_attn_scores(self, h_transformed:torch.Tensor):
        source_scores = torch.matmul(h_transformed, self.a[:, :self.n_hidden, :])
        target_scores = torch.matmul(h_transformed, self.a[:, self.n_hidden:, :])
        return self.leaky_relu(source_scores + target_scores.mT)

    def forward(self, h:torch.Tensor, adj_mat:torch.Tensor):
        n_nodes = h.shape[0]

        h_transformed = torch.mm(h, self.W)
        h_transformed = h_transformed.view(n_nodes, self.n_heads, self.n_hidden).permute(1, 0, 2)
        h_transformed = self.dropout(h_transformed)

        torch.cuda.empty_cache()

        e = self._get_attn_scores(h_transformed)
        connectivity_mask = -9e15 * torch.ones_like(e)
        e = torch.where(adj_mat > 0, e, connectivity_mask)

        del connectivity_mask
        torch.cuda.empty_cache()

        attn = F.softmax(e, dim=-1)
        attn = self.dropout(attn)

        h_prime = torch.matmul(attn, h_transformed)

        if self.concat:
            h_prime = F.elu(h_prime)
            h_prime = h_prime.permute(1, 0, 2).contiguous().view(n_nodes, self.out_features)
        else:
            h_prime = h_prime.mean(dim=0)

        return h_prime

