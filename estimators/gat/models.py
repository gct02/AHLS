import torch
import torch.nn as nn
import torch.nn.functional as F

from estimators.gat.layers import GraphAttentionalLayer

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
torch.set_default_device(device)

class GAT(nn.Module):
    def __init__(self, in_features:int, out_size:int):
        super(GAT, self).__init__()
        self.first_gat = GraphAttentionalLayer(in_features, 8, 4, True, 0.1)
        self.gat1 = GraphAttentionalLayer(8, 8, 4, True, 0.1)
        self.gat2 = GraphAttentionalLayer(8, 8, 4, True, 0.1)
        self.gat3 = GraphAttentionalLayer(8, 8, 4, True, 0.1)
        self.last_gat = GraphAttentionalLayer(8, 4, 2, False, 0.1)
        self.fc = nn.Linear(4, out_size)
        self.t1 = 500
        self.t2 = 1000
        self.reset_parameters()
        self.to(device)

    def reset_parameters(self):
        nn.init.xavier_normal_(self.fc.weight, gain=1.414)
        nn.init.zeros_(self.fc.bias)

    def forward(self, node_features:torch.Tensor, adj_mat:torch.Tensor):
        n_nodes = node_features.size(0)

        if n_nodes == 0:
            return torch.zeros(1)
        
        if n_nodes == 1:
            return self.fc(self.last_gat(self.first_gat(node_features, adj_mat), adj_mat))

        x = node_features
        x = self.first_gat(x, adj_mat)
        torch.cuda.empty_cache()

        while n_nodes > 1:
            x = self.gat1(x, adj_mat)
            torch.cuda.empty_cache()

            if n_nodes >= self.t1:
                x = self.gat2(x, adj_mat)
                torch.cuda.empty_cache()

            if n_nodes >= self.t2:
                x = self.gat3(x, adj_mat)
                torch.cuda.empty_cache()

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
                x = self.last_gat(x, adj_mat)
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

            # del degree, nodes_sorted, min_degree, max_degree, min_degree_nodes
        
        x = torch.sum(x, dim=0)
        x = self.fc(x)

        return x
    