import torch
import torch.nn as nn
import torch.nn.functional as F

from estimators.gat.layers import GraphAttentionalLayer

# Change torch print options to print all elements
torch.set_printoptions(profile="full")


class GAT(nn.Module):
    def __init__(self, in_features:int, out_size:int):
        super(GAT, self).__init__()
        self.gat1 = GraphAttentionalLayer(in_features, 128, 8, True, 0.1, dropout=0.4)
        self.gat2 = GraphAttentionalLayer(128, 64, 8, True, 0.1, dropout=0.4)
        self.gat3 = GraphAttentionalLayer(64, 32, 4, True, 0.1, dropout=0.4)
        self.gat4 = GraphAttentionalLayer(32, 16, 1, True, 0.1, dropout=0.4)
        self.gat5 = GraphAttentionalLayer(16, 8, 1, False, 0.1, dropout=0.1)
        self.fc = nn.Linear(8, out_size)
        nn.init.xavier_normal(self.fc.weight, gain=1.414)
        nn.init.zeros_(self.fc.bias)

    def forward(self, node_features:torch.Tensor, adj_mat:torch.Tensor):
        x = node_features
        x = ((x.T - x.mean(dim=1)) / (x.std(dim=1) + 1e-6)).T
        x = self.gat1(node_features, adj_mat)
        x = F.elu(x)
        x = self.gat2(x, adj_mat)
        x = F.elu(x)
        x = self.gat3(x, adj_mat)
        x = F.elu(x)
        x = self.gat4(x, adj_mat)
        x = self.gat5(x, adj_mat)
        return self.fc(torch.mean(x, dim=0))
    