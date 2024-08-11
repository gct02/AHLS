import torch
import torch.nn as nn
import torch.nn.functional as F

from estimators.gat.layers import GraphAttentionalLayer

# Change torch print options to print all elements
torch.set_printoptions(profile="full")

class GAT(nn.Module):
    def __init__(self, in_features:int, out_size:int):
        super(GAT, self).__init__()
        self.gat1 = GraphAttentionalLayer(in_features, 48, 8, True, 0.2, dropout=0.4)
        self.gat2 = GraphAttentionalLayer(48, 80, 8, True, 0.2, dropout=0.4)
        self.gat3 = GraphAttentionalLayer(80, 44, 4, True, 0.2, dropout=0.4)
        self.gat4 = GraphAttentionalLayer(44, 20, 4, True, 0.2, dropout=0.4)
        self.gat5 = GraphAttentionalLayer(20, 10, 2, False, 0.2, dropout=0.2)
        self.fc1 = nn.Linear(10, 5)
        self.fc2 = nn.Linear(5, out_size)
        nn.init.xavier_normal_(self.fc1.weight, gain=1.414)
        nn.init.zeros_(self.fc1.bias)
        nn.init.xavier_normal_(self.fc2.weight, gain=1.414)
        nn.init.zeros_(self.fc2.bias)

    def forward(self, node_features:torch.Tensor, adj_mat:torch.Tensor):
        x = node_features / torch.norm(node_features, p=2, dim=1).view(-1, 1)
        x = self.gat1(x, adj_mat)
        x = F.elu(x)
        x = self.gat2(x, adj_mat)
        x = F.elu(x)
        x = self.gat3(x, adj_mat)
        x = F.elu(x)
        x = self.gat4(x, adj_mat)
        x = F.elu(x)
        x = self.gat5(x, adj_mat)
        x = F.relu(self.fc1(torch.sum(x, dim=0)))
        x = F.relu(self.fc2(x))
        return x
    