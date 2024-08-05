import torch
import torch.nn as nn
import torch.nn.functional as F

from estimators.gat.layers import GraphAttentionalLayer

class GAT(nn.Module):
    def __init__(self, in_features:int, n_hidden_1:int, n_hidden_2:int, n_heads_1:int, n_heads_2:int, out_size:int, concat:bool=False, dropout:float=0.4, leaky_relu_slope:float=0.2):
        super(GAT, self).__init__()

        self.gat1 = GraphAttentionalLayer(
            in_features=in_features, out_features=n_hidden_1, n_heads=n_heads_1,
            concat=concat, dropout=dropout, leaky_relu_slope=leaky_relu_slope)
        
        self.gat2 = GraphAttentionalLayer(
            in_features=n_hidden_1, out_features=n_hidden_2, n_heads=n_heads_2,
            concat=False, dropout=dropout, leaky_relu_slope=leaky_relu_slope)

        self.mlp = nn.Sequential(
            nn.Linear(n_hidden_2, 8, bias=False),
            nn.SELU(),
            nn.Linear(8, out_size),
            nn.ReLU()
        )
        self.mlp.apply(self._init_weights)

    def _init_weights(self, m):
        if isinstance(m, nn.Linear):
            nn.init.xavier_uniform_(m.weight)
            if m.bias is not None:
                nn.init.zeros_(m.bias)

    def forward(self, node_features:torch.Tensor, adj:torch.Tensor):
        x = self.gat1(node_features, adj)
        x = F.selu(x)
        x = self.gat2(x, adj)
        x = F.selu(x)
        x = x.mean(dim=0)
        return self.mlp(x)