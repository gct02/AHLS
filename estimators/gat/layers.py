import torch
import torch.nn as nn
import torch.nn.functional as F

class GraphAttentionalLayer(nn.Module):
    def __init__(self, in_features:int, out_features:int, n_heads:int, 
                 concat:bool=False, leaky_relu_slope:float=0.1, dropout:float=0.1):
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

    def forward(self, h:torch.Tensor, adj_mat:torch.Tensor):
        h_transformed = torch.mm(h, self.W).view(h.shape[0], self.n_heads, self.n_hidden).permute(1, 0, 2)
        h_transformed = self.dropout(h_transformed)

        torch.cuda.empty_cache()

        h_transformed = self.leaky_relu(h_transformed)
        e = torch.matmul(h_transformed, self.a[:, :self.n_hidden, :])\
            + torch.matmul(h_transformed, self.a[:, self.n_hidden:, :]).mT
        e = torch.where(adj_mat > 0, e, -float('inf'))
        attn = F.softmax(e, dim=-1)
        
        torch.cuda.empty_cache()

        if self.concat:
            return torch.matmul(attn, h_transformed).permute(1, 0, 2).contiguous().view(h.shape[0], self.out_features)
        else:
            return torch.matmul(attn, h_transformed).mean(dim=0)

"""
class GraphAttentionalLayer(nn.Module):
    def __init__(self, in_features:int, out_features:int, n_heads:int, 
                 concat:bool=False, leaky_relu_slope:float=0.1, dropout:float=0.1):
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

        # Linear transformation after concatenating source and target features
        self.W = nn.Parameter(torch.empty(size=(in_features, self.n_hidden * n_heads)))
        self.a = nn.Parameter(torch.empty(size=(n_heads, 2 * self.n_hidden)))

        self.reset_parameters()

    def reset_parameters(self):
        nn.init.xavier_normal_(self.W, gain=1.414)
        nn.init.xavier_normal_(self.a, gain=1.414)

    def forward(self, h: torch.Tensor, adj_mat: torch.Tensor):
        # Number of nodes
        N = h.size(0)

        torch.cuda.empty_cache()

        # Apply linear transformation to input features
        h_transformed = torch.mm(h, self.W)  # (N, in_features) * (in_features, n_hidden * n_heads) -> (N, n_hidden * n_heads)
        h_transformed = h_transformed.view(N, self.n_heads, self.n_hidden)  # Reshape to (N, n_heads, n_hidden)

        # Prepare for attention mechanism
        h_i_expanded = h_transformed.unsqueeze(1).repeat(1, N, 1, 1)  # (N, N, n_heads, n_hidden)
        h_j_expanded = h_transformed.unsqueeze(0).repeat(N, 1, 1, 1)  # (N, N, n_heads, n_hidden)

        # Concatenate node features for each edge (i, j)
        h_concat = torch.cat([h_i_expanded, h_j_expanded], dim=-1)  # Shape: (N, N, n_heads, 2 * n_hidden)

        # Compute attention scores e_ij
        e = self.leaky_relu(torch.einsum('ijhd,hd->ijh', h_concat, self.a))  # Shape: (N, N, n_heads)

        # Expand adj_mat to match the shape of e
        adj_mat_expanded = adj_mat.unsqueeze(-1).expand(-1, -1, self.n_heads)  # Shape: (N, N, n_heads)

        # Mask out edges that do not exist in the adjacency matrix
        e = torch.where(adj_mat_expanded > 0, e, -float('inf'))  # Apply masking to non-existent edges

        # Compute attention coefficients
        attn = F.softmax(e, dim=1)  # Normalize attention scores across all nodes
        attn = self.dropout(attn)  # Apply dropout to attention coefficients

        # Aggregate node features using attention coefficients
        h_prime = torch.einsum('ijh,jhf->ihf', attn, h_transformed)  # Shape: (N, n_heads, n_hidden)

        torch.cuda.empty_cache()

        # Concatenate or average the heads
        if self.concat:
            output = h_prime.contiguous().view(N, -1)  # Concatenate heads
        else:
            output = h_prime.mean(dim=1)  # Average heads

        return output
"""