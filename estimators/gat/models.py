import torch
import torch.nn as nn
import torch.nn.functional as F

from estimators.gat.layers import GraphAttentionalLayer

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
torch.set_default_device(device)

# Gat model for area estimation (might be generalized to other estimations in the future)
# TODO: Apply an autoencoder to the node features before passing them to the GAT (in order to reduce the dimensionality)
class GAT(nn.Module):
    def __init__(self, in_features:int, out_size:int):
        super(GAT, self).__init__()
        self.gat0 = GraphAttentionalLayer(in_features, 12, 2, True, 0.2, 0.2)
        self.gat1 = GraphAttentionalLayer(12, 6, 2, True, 0.2, 0.2)
        self.gat2 = GraphAttentionalLayer(6, out_size, 1, False, 0.2, 0.2)
        self.to(device)

    def forward(self, node_features:torch.Tensor, adj_mat:torch.Tensor):
        x = F.elu(self.gat0(node_features, adj_mat))
        torch.cuda.empty_cache()
        x = F.elu(self.gat1(x, adj_mat))
        torch.cuda.empty_cache()
        x = F.relu(self.gat2(x, adj_mat))
        torch.cuda.empty_cache()
        return torch.sum(x, dim=0)




"""
Some code that I was working on to implement a more dynamic GAT model
It is not finished and it is not working properly yet
I will leave it here for future reference

class GAT(nn.Module):
    def __init__(self, in_features:int, out_size:int):
        super(GAT, self).__init__()
        self.gat0 = GraphAttentionalLayer(in_features, 8, 2, True, 0.2, 0.1)
        self.gat1 = GraphAttentionalLayer(8, 8, 2, True, 0.2, 0.2)
        self.gat2 = GraphAttentionalLayer(8, 8, 2, True, 0.2, 0.2)
        self.gat3 = GraphAttentionalLayer(8, 8, 2, True, 0.2, 0.2)
        self.gatn = GraphAttentionalLayer(8, 4, 2, False, 0.2, 0.1)
        self.fc = nn.Linear(4, out_size)
        self.t1 = 10
        self.t2 = 100
        self.reset_parameters()
        self.to(device)

    def reset_parameters(self):
        nn.init.xavier_normal_(self.fc.weight, gain=1.414)
        nn.init.zeros_(self.fc.bias)

    def forward(self, node_features:torch.Tensor, adj_mat:torch.Tensor):
        n_nodes = node_features.size(0)

        if n_nodes == 0:
            return torch.zeros(1)

        x = F.elu(self.gat0(node_features, adj_mat))
        torch.cuda.empty_cache()
        
        if n_nodes == 1:
            x = F.relu(self.gatn(x, adj_mat))
            torch.cuda.empty_cache()
            x = self.fc(x)
            return x
        
        while n_nodes > 1:
            degree = torch.sum(adj_mat, dim=0)
            nodes_sorted = torch.argsort(degree, descending=True).tolist()

            min_degree = degree[nodes_sorted[-1]]
            max_degree = degree[nodes_sorted[0]]

            if min_degree != max_degree:
                min_degree_nodes = []
                while min_degree == degree[nodes_sorted[-1]] and n_nodes > 1:
                    min_degree_nodes += [nodes_sorted.pop()]
                    n_nodes -= 1
            else:
                min_degree_nodes = [nodes_sorted.pop()]
                n_nodes -= 1

            if n_nodes <= 1:
                x = F.relu(self.gatn(x, adj_mat))
                torch.cuda.empty_cache()

            for node in min_degree_nodes:
                adj_mat[node, node] = 0
                pred = torch.argwhere(adj_mat[:, node]).tolist()
                succ = torch.argwhere(adj_mat[node]).tolist()
                adj_mat[node, :] = torch.zeros(adj_mat.size(0))
                adj_mat[:, node] = torch.zeros(adj_mat.size(0))
                x = torch.cat((x[:node], x[node + 1:]), dim=0)
                if len(pred) == 0 or len(succ) == 0:
                    continue
                for p in pred:
                    for s in succ:
                        adj_mat[p, s] = 1

            # Remove rows and columns with index in min_degree_nodes
            for node in min_degree_nodes:
                adj_mat = torch.cat((adj_mat[:, :node], adj_mat[:, node + 1:]), dim=1)
                adj_mat = torch.cat((adj_mat[:node], adj_mat[node + 1:]), dim=0)

            if n_nodes > 1:
                x = F.elu(self.gat1(x, adj_mat))
                torch.cuda.empty_cache()

                if n_nodes < self.t2:
                    x = F.elu(self.gat3(x, adj_mat))
                    torch.cuda.empty_cache()

                if n_nodes < self.t1:
                    x = F.elu(self.gat2(x, adj_mat))
                    torch.cuda.empty_cache()
        
        x = torch.sum(x, dim=0)
        x = self.fc(x)

        return x
"""