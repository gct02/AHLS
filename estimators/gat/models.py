import torch
import torch.nn as nn
import torch.nn.functional as F
import gc
from estimators.gat.layers import GraphAttentionalLayer
from torch.utils.checkpoint import checkpoint

device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")

class GAT(nn.Module):
    def __init__(self, n_features:int, n_out:int, n_hid1:int, n_hid2:int, heads1:int, heads2:int, 
                 n_layers:int, norm:bool=False):
        super(GAT, self).__init__()

        self.n_layers = n_layers

        self.normalize = norm
        if norm:
            self.norm = nn.LayerNorm(n_hid1)

        self.n_in = n_features
        self.n_hid1 = n_hid1
        self.n_hid2 = n_hid2
        self.n_out = n_out

        self.gat_jkn_pre = GraphAttentionalLayer(n_features, n_hid1, heads1, True, 0.01, 0.5)
        self.gat_jkn = GraphAttentionalLayer(n_hid1, n_hid1, heads1, True, 0.01, 0.4)
        self.gat_out = GraphAttentionalLayer(n_hid1, n_hid2, heads2, False, 0.01, 0.0)

        # LSTM for Jumping Knowledge aggregation
        self.lstm = nn.LSTM(input_size=n_hid1, hidden_size=n_hid1, batch_first=True)

        self.fc = nn.Linear(n_hid2, n_out)

        self.reset_parameters()

    def reset_parameters(self):
        nn.init.constant_(self.fc.bias, 0.1)

    def _make_adj_mat(self, edges:torch.Tensor, num_nodes:int):
        adj_mat = torch.tensor([-9e15] * (num_nodes * num_nodes), dtype=torch.float32, device="cpu").view(num_nodes, num_nodes)
        adj_mat[edges[0, :] - 1, edges[1, :] - 1] = 0
        # adj_mat = adj_mat.to_sparse()
        return adj_mat

    def forward(self, node_features:torch.Tensor, edges:torch.Tensor):
        adj_mat = self._make_adj_mat(edges, node_features.shape[0])

        x = checkpoint(self.gat_jkn_pre, node_features, adj_mat, use_reentrant=False)
        x = F.elu(x)

        if self.normalize:
            x = self.norm(x)

        xk = []
        for _ in range(self.n_layers):
            x = checkpoint(self.gat_jkn, x, adj_mat, use_reentrant=False)
            x = F.elu(x)
            if self.normalize:
                x = self.norm(x)
            xk.append(x.unsqueeze(1))  # Add extra dimension for LSTM

        xk = torch.cat(xk, dim=1)  # Shape: (1, n_layers, n_nodes, n_hid1)

        _, (hn, _) = self.lstm(xk)  # Only take the final hidden state from LSTM

        # Apply the final GAT layer
        x = checkpoint(self.gat_out, hn.squeeze(0), adj_mat, use_reentrant=False)
        x = F.elu(x)

        del adj_mat
        gc.collect()

        # Sum the final hidden states
        x = torch.sum(x, dim=0)
        x = F.leaky_relu(x, negative_slope=0.01)
        
        return self.fc(x)