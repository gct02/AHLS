import torch
import torch.nn as nn
import torch.nn.functional as F

from estimators.gat.layers import GraphAttentionalLayer

# Change torch print options to print all elements
torch.set_printoptions(profile="full")

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
torch.set_default_device(device)
torch.set_default_dtype(torch.float32)

torch.cuda.set_per_process_memory_fraction(0.8, 0)
torch.cuda.empty_cache()

class GAT(nn.Module):
    def __init__(self, in_features:int, out_size:int):
        super(GAT, self).__init__()
        self.gat1 = GraphAttentionalLayer(in_features, 16, 4, True, 0.2, 0.2)
        self.gat2 = GraphAttentionalLayer(16, 16, 2, True, 0.2)
        self.gat3 = GraphAttentionalLayer(16, 16, 2, True, 0.2)
        self.gat4 = GraphAttentionalLayer(16, 16, 2, False, 0.2)
        self.fc0 = nn.Linear(16, 16)
        self.fc1 = nn.Linear(16, 8)
        self.fc2 = nn.Linear(8, out_size)
        nn.init.xavier_normal_(self.fc0.weight, gain=1.414)
        nn.init.xavier_normal_(self.fc1.weight, gain=1.414)
        nn.init.xavier_normal_(self.fc2.weight, gain=1.414)
        nn.init.zeros_(self.fc0.bias)
        nn.init.zeros_(self.fc1.bias)
        nn.init.zeros_(self.fc2.bias)
        self.t1 = nn.Parameter(torch.FloatTensor(1))
        self.t2 = nn.Parameter(torch.FloatTensor(1))
        nn.init.uniform_(self.t1, 0, 0.05)
        nn.init.uniform_(self.t2, 0.05, 0.1)
        # Move model to device
        self.to(device)

    def forward(self, node_features:torch.Tensor, adj_mat:torch.Tensor, max_gat_iter:int=70):
        # Normalize node features
        # x = node_features / (torch.norm(node_features, p=2, dim=1).view(-1, 1) + 1e-6)
        x = node_features

        x = F.elu(self.gat1(x, adj_mat))
        torch.cuda.empty_cache()

        connectivity_mask = -9e15 * torch.ones_like(adj_mat[:, 0].view(1, -1))
        
        degree = torch.sum(adj_mat, dim=0)
        nodes_sorted = torch.argsort(degree, descending=True).tolist()

        n_nodes = len(nodes_sorted)

        if n_nodes == 0:
            return torch.zeros(1)

        i = 0
        while n_nodes > 1 and i <= max_gat_iter:
            min_degree = degree[nodes_sorted[-1]]
            max_degree = degree[nodes_sorted[0]]

            min_degree_nodes = [nodes_sorted.pop()]

            n_nodes -= 1

            if n_nodes == 0:
                nodes_sorted = min_degree_nodes
                break

            if min_degree != max_degree:
                while min_degree == degree[nodes_sorted[-1]] and n_nodes > 0:
                    min_degree_nodes += [nodes_sorted.pop()]
                    n_nodes -= 1

            # Remove minimal degree nodes from the graph
            adj_mat[min_degree_nodes, :] = connectivity_mask
            adj_mat[:, min_degree_nodes] = connectivity_mask.T
            degree = torch.sum(adj_mat, dim=0)

            t1 = torch.round(self.t1 * max_gat_iter)
            t2 = torch.round(self.t2 * max_gat_iter)

            if i <= t1.item():
                x = F.elu(self.gat2(x, adj_mat))
                torch.cuda.empty_cache()

            if i <= t2.item():
                x = F.elu(self.gat3(x, adj_mat))
                torch.cuda.empty_cache()

            x = F.elu(self.gat4(x, adj_mat))
            torch.cuda.empty_cache()

            i += 1
        
        x = x[nodes_sorted]
        x = torch.mean(x, dim=0)

        if len(nodes_sorted) > 1:
            x = F.elu(self.fc0(x))

        x = F.elu(self.fc1(x))
        x = F.elu(self.fc2(x))

        return x
    