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
        self.W1 = nn.Parameter(torch.randn((attn_heads, 128, num_node_features), dtype=dtype) * 0.1, requires_grad=True)
        self.a1 = nn.Parameter(torch.randn((attn_heads, 256), dtype=dtype) * 0.1, requires_grad=True)

        # Second graph attentional layers parameters
        self.W2 = nn.Parameter(torch.randn((attn_heads, 128, 128), dtype=dtype) * 0.1, requires_grad=True)
        self.a2 = nn.Parameter(torch.randn((attn_heads, 256), dtype=dtype) * 0.1, requires_grad=True)

        self.test = True

        self.MLP = nn.Sequential(
            nn.LayerNorm(128),
            nn.Linear(128, 64),
            nn.Dropout(0.5),
            nn.LeakyReLU(),
            nn.Linear(64, 16),
            nn.Dropout(0.5),
            nn.LeakyReLU(),
            nn.Linear(16, out_size),
            nn.ReLU()
        )

    def graph_attentional_layer(self, nodes, neighbours, W, a, attn_heads=8):
        n_nodes = nodes.size(0)
        embeddings = torch.zeros(n_nodes, 128, dtype=dtype)

        for i in range(n_nodes):
            attn_sum = torch.zeros(128, dtype=dtype)
            for k in range(attn_heads):
                h_i = W[k] @ nodes[i] # 128x32 * 32x1 = 128x1
                attn_sum_i = torch.zeros(128, dtype=dtype)
                ngbs = neighbours[i]
                n_ngbs = len(ngbs)
                for j in range(n_ngbs):
                    h_j = W[k] @ nodes[ngbs[j]] # 128x32 * 32x1 = 128x1
                    e_ij = a[k] @ torch.cat((h_i, h_j), 0) # 1x256 * 256x1 = 1x1

                    ngbs_info = torch.FloatTensor([torch.exp(F.leaky_relu(a[k] @ torch.cat((h_i, W[k] @ nodes[ngb]), dim=0))).item() for ngb in ngbs])
                    ngbs_info_sum = torch.sum(ngbs_info, dim=0, dtype=dtype)

                    alpha_ij = torch.exp(F.leaky_relu(e_ij)) / ngbs_info_sum.item()
                    attn_sum_i +=  h_j * alpha_ij.item()
                attn_sum += attn_sum_i
            embeddings[i] = F.elu((1 / attn_heads) * attn_sum)
        return embeddings

    def forward(self, node_features, neighbours):
        embeddings1 = self.graph_attentional_layer(node_features, neighbours, self.W1, self.a1, self.attn_heads)
        embeddings2 = self.graph_attentional_layer(embeddings1, neighbours, self.W2, self.a2, self.attn_heads)

        graph_embedding = embeddings2.mean(dim=0, dtype=dtype)

        return self.MLP(graph_embedding)
