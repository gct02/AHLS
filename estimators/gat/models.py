import torch
import torch.nn as nn
import torch.nn.functional as F

from estimators.gat.layers import GraphAttentionalLayer

# GAT model for area estimation (might be generalized to other estimations in the future)
# TODO: Apply an autoencoder to the node features before passing them to the GAT (in order to reduce the dimensionality)
class GAT(nn.Module):
    def __init__(self, in_features:int, out_size:int):
        super(GAT, self).__init__()
        self.gat1 = GraphAttentionalLayer(in_features, 12, 3, True, 0.2, 0.2)
        self.gat2 = GraphAttentionalLayer(12, 6, 2, True, 0.2, 0.2)
        self.gat3 = GraphAttentionalLayer(6, 6, 2, True, 0.2, 0.2)
        self.gat3 = GraphAttentionalLayer(6, out_size, 3, False, 0.2, 0.2)

    """
    def _prune_graph(self, node_features:torch.Tensor, adj_mat:torch.Tensor):
        degrees = torch.sum(adj_mat, dim=1)
        min_deg = torch.min(degrees)
        max_deg = torch.max(degrees)

        if min_deg == max_deg:
            del degrees, min_deg, max_deg
            return node_features, adj_mat

        min_deg_nodes = torch.argmin(degrees).tolist()

        if isinstance(min_deg_nodes, int):
            min_deg_nodes = [min_deg_nodes]

        for i in min_deg_nodes:
            adj_mat[i, i] = 0
            pred = torch.argwhere(adj_mat[:, i]).tolist()
            succ = torch.argwhere(adj_mat[i]).tolist()
            adj_mat[i, :] = torch.zeros(adj_mat.size(0))
            adj_mat[:, i] = torch.zeros(adj_mat.size(0))
            node_features = torch.cat((node_features[:i], node_features[i + 1:]), dim=0)
            if len(pred) == 0 or len(succ) == 0:
                continue
            for p in pred:
                for s in succ:
                    adj_mat[p, s] = 1
            del pred, succ
        
        del degrees, min_deg, max_deg

        for i in min_deg_nodes:
            adj_mat = torch.cat((adj_mat[:, :i], adj_mat[:, i + 1:]), dim=1)
            adj_mat = torch.cat((adj_mat[:i], adj_mat[i + 1:]), dim=0)

        return node_features, adj_mat
    """

    def forward(self, node_features:torch.Tensor, adj_mat:torch.Tensor):
        x = self.gat1(node_features, adj_mat)
        x = F.elu(x)
        #x, adj_mat = self._prune_graph(x, adj_mat)
        torch.cuda.empty_cache()

        x = self.gat2(x, adj_mat)
        x = F.elu(x)
        #x, adj_mat = self._prune_graph(x, adj_mat)
        torch.cuda.empty_cache()

        x = self.gat3(x, adj_mat)
        x = F.elu(x)
        #x, adj_mat = self._prune_graph(x, adj_mat)
        torch.cuda.empty_cache()

        x = self.gat4(x, adj_mat)
        x = F.relu(x)
        #x, adj_mat = self._prune_graph(x, adj_mat)
        torch.cuda.empty_cache()

        return torch.sum(x, dim=0)