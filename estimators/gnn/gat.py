import numpy as np
import torch

import torch.nn as nn
import torch.nn.functional as F

dtype = torch.float
device = "cuda" if torch.cuda.is_available() else "cpu"
torch.set_default_device(device)

class GAT(nn.Module):
    def __init__(self, num_node_features, out_size, attn_heads=8):
        super(GAT, self).__init__()

        self.attn_heads = attn_heads

        # First graph attentional layer parameters
        self.W1 = nn.Parameter(torch.randn((attn_heads, 128, num_node_features), dtype=dtype), requires_grad=True)
        self.a1 = nn.Parameter(torch.randn((attn_heads, 256), dtype=dtype), requires_grad=True)

        # Second graph attentional layers parameters
        self.W2 = nn.Parameter(torch.randn((attn_heads, 128, 128), dtype=dtype), requires_grad=True)
        self.a2 = nn.Parameter(torch.randn((attn_heads, 256), dtype=dtype), requires_grad=True)

        # Third graph attentional layers parameters
        self.W3 = nn.Parameter(torch.randn((attn_heads, 128, 128), dtype=dtype), requires_grad=True)
        self.a3 = nn.Parameter(torch.randn((attn_heads, 256), dtype=dtype), requires_grad=True)

        # Multi-layer perceptron
        self.MLP = nn.Sequential(
            nn.LayerNorm(128),
            nn.Linear(128, 64, bias=False),
            nn.Dropout(.6),
            nn.GELU(),
            nn.LayerNorm(64),
            nn.Linear(64, 32),
            nn.Dropout(.4),
            nn.GELU(),
            nn.LayerNorm(32),
            nn.Linear(32, 8),
            nn.Dropout(.4),
            nn.GELU(),
            nn.Linear(8, out_size),
            nn.ReLU()
        )

        self._init_params()
        self.parameters = torch.nn.ParameterList([self.W1, self.a1, self.W2, self.a2, self.W3, self.a3, *self.MLP.parameters()])


    def _init_weights(self, m):
        if isinstance(m, nn.Linear):
            nn.init.xavier_uniform_(m.weight)
            if m.bias is not None:
                nn.init.zeros_(m.bias)


    def _init_params(self):
        W1 = nn.init.xavier_uniform_(self.W1)
        W2 = nn.init.xavier_uniform_(self.W2)
        W3 = nn.init.xavier_uniform_(self.W3)
        a1 = nn.init.xavier_uniform_(self.a1)
        a2 = nn.init.xavier_uniform_(self.a2)
        a3 = nn.init.xavier_uniform_(self.a3)
        self.MLP.apply(self._init_weights)

    
    def graph_attentional_layer(self, nodes, neighbours, W, a, attn_heads=8):
        n_nodes = nodes.size(0)
        embeddings = torch.zeros(n_nodes, 128, dtype=dtype, device=device)

        h = torch.bmm(W, nodes.T.unsqueeze(0).repeat(attn_heads, 1, 1)).transpose(1, 2) # (attn_heads, n_nodes, 128)

        for i in range(n_nodes):
            ngbs = neighbours[i]
            n_ngbs = len(ngbs)
            
            h_i = h[:, i, :].unsqueeze(1)  # (attn_heads, 1, 128)
            h_j = h[:, ngbs, :]  # (attn_heads, n_ngbs, 128)
            
            e_ij = torch.bmm(torch.cat((h_i.repeat(1, n_ngbs, 1), h_j), dim=2), a.unsqueeze(1).transpose(1, 2)).squeeze(2)  # (attn_heads, n_ngbs)]
            alpha_ij = torch.softmax(F.leaky_relu(e_ij), dim=-1)  # (attn_heads, n_ngbs)
            
            attn_sum = torch.sum(h_j * alpha_ij.unsqueeze(1).repeat(1, 128, 1).transpose(1, 2), dim=1)  # (attn_heads, 128)
            embeddings[i] = F.elu(attn_sum.mean(dim=0))
            
        return embeddings


    def forward(self, node_features, neighbours):
        embeddings = self.graph_attentional_layer(node_features, neighbours, self.W1, self.a1)
        embeddings = self.graph_attentional_layer(embeddings, neighbours, self.W2, self.a2)
        embeddings = self.graph_attentional_layer(embeddings, neighbours, self.W3, self.a3)
        graph_embedding = embeddings.mean(dim=0)
        return self.MLP(graph_embedding)