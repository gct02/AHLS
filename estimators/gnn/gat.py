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

        self.MLP = nn.Sequential(
            nn.LayerNorm(128),
            nn.Linear(128, 64),
            nn.Dropout(0.5),
            nn.LeakyReLU(),
            nn.Linear(64, 16),
            nn.dropout(0.25),
            nn.LeakyReLU(),
            nn.Linear(16, out_size),
            nn.ReLU()
        )

    def graph_attentional_layer(self, nodes, neighbours, W, a, attn_heads=8):
        n_nodes = nodes.size(0)
        embeddings = torch.zeros(n_nodes, 128, dtype=dtype)

        for i in range(n_nodes):
            attn_sum = 0
            for k in range(attn_heads):
                h_i = W[k] * nodes[i] # 128x32 * 32x1 = 128x1
                attn_sum_i = 0
                n_neighbours = neighbours[i].size(0)
                for j in range(n_neighbours):
                    h_j = W[k] * nodes[neighbours[i][j]] # 128x32 * 32x1 = 128x1
                    e_ij = torch.t(a[k]) * torch.cat((h_i, h_j), dim=0) # 1x256 * 256x1 = 1x1
                    alpha_ij = torch.exp(nn.LeakyReLU(e_ij))\
                        / torch.sum([torch.exp(nn.LeakyReLU(torch.t(a[k]) * torch.cat((h_i, W[k] * nodes[neighbours[i][n]]), dim=0))) for n in range(n_neighbours)])
                    attn_sum_i += alpha_ij * h_j
                attn_sum += attn_sum_i
            embeddings[i] = nn.ELU((1/attn_heads)*attn_sum)
        return embeddings

    def forward(self, node_features, neighbours):
        embeddings1 = self.graph_attentional_layer(node_features, neighbours, self.W1, self.a1, self.attn_heads)
        embeddings2 = self.graph_attentional_layer(embeddings1, neighbours, self.W2, self.a2, self.attn_heads)

        graph_embedding = embeddings2.mean(dim=0, dtype=dtype)

        return self.MLP(graph_embedding)
