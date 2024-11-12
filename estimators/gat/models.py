import torch
import torch.nn as nn
import torch.nn.functional as F
import gc
from estimators.gat.layers import GraphAttentionalLayer
from torch.utils.checkpoint import checkpoint

device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")

class GAT(nn.Module):
    def __init__(self, in_features_1:int, in_features_2:int, out_size:int, 
                 hidden_size_1:int=12, hidden_size_2:int=6, n_heads_1:int=3, n_heads_2:int=3, 
                 n_layers:int=6, norm:bool=False):
        super(GAT, self).__init__()

        self.n_layers = n_layers

        self.normalize = norm
        if norm:
            self.norm1 = nn.LayerNorm(hidden_size_1)
            self.norm2 = nn.LayerNorm(hidden_size_2)

        self.in_size_1 = in_features_1
        self.in_size_2 = in_features_2
        self.hidden_size_1 = hidden_size_1
        self.hidden_size_2 = hidden_size_2
        self.out_size = out_size

        self.gat_jkn_pre_1 = GraphAttentionalLayer(in_features_1, hidden_size_1, n_heads_1, True, 0.01, 0.6)
        self.gat_jkn_1 = GraphAttentionalLayer(hidden_size_1, hidden_size_1, n_heads_1, True, 0.01, 0.5)
        self.gat_out_1 = GraphAttentionalLayer(hidden_size_1, out_size, 1, False, 0.01, 0.0)

        self.gat_jkn_pre_2 = GraphAttentionalLayer(in_features_2, hidden_size_2, n_heads_2, True, 0.01, 0.5)
        self.gat_jkn_2 = GraphAttentionalLayer(hidden_size_2, hidden_size_2, n_heads_2, True, 0.01, 0.4)
        self.gat_out_2 = GraphAttentionalLayer(hidden_size_2, out_size, 1, False, 0.01, 0.0)

        # LSTM for Jumping Knowledge aggregation
        self.lstm_1 = nn.LSTM(input_size=hidden_size_1, hidden_size=hidden_size_1, batch_first=True)
        self.lstm_2 = nn.LSTM(input_size=hidden_size_2, hidden_size=hidden_size_2, batch_first=True)

        self.fc = nn.Linear(2*out_size, out_size)

        self.reset_parameters()

    def reset_parameters(self):
        nn.init.constant_(self.fc.bias, 0.1)

    def _make_adj_mat(self, edges:torch.Tensor, num_nodes:int):
        adj_mat = torch.tensor([-9e15] * (num_nodes * num_nodes), dtype=torch.float32, device="cpu").view(num_nodes, num_nodes)
        adj_mat[edges[0, :] - 1, edges[1, :] - 1] = 0
        # adj_mat = adj_mat.to_sparse()
        return adj_mat

    def forward(self, node_features_1:torch.Tensor, edges_1:torch.Tensor, 
                node_features_2:torch.Tensor, edges_2:torch.Tensor):
        adj_mat_1 = self._make_adj_mat(edges_1, node_features_1.shape[0])
        adj_mat_2 = self._make_adj_mat(edges_2, node_features_2.shape[0])

        x1 = checkpoint(self.gat_jkn_pre_1, node_features_1, adj_mat_1, use_reentrant=False)
        x1 = F.elu(x1)

        x2 = checkpoint(self.gat_jkn_pre_2, node_features_2, adj_mat_2, use_reentrant=False)
        x2 = F.elu(x2)

        if self.normalize:
            x1 = self.norm1(x1)
            x2 = self.norm2(x2)

        x1k = []
        x2k = []

        for _ in range(self.n_layers):
            x1 = checkpoint(self.gat_jkn_1, x1, adj_mat_1, use_reentrant=False)
            x1 = F.elu(x1)

            x2 = checkpoint(self.gat_jkn_2, x2, adj_mat_2, use_reentrant=False)
            x2 = F.elu(x2)

            if self.normalize:
                x1 = self.norm1(x1)
                x2 = self.norm2(x2)
            x1k.append(x1.unsqueeze(1))  # Add extra dimension for LSTM
            x2k.append(x2.unsqueeze(1))

        x1k = torch.cat(x1k, dim=1)  # Shape: (1, n_layers, hidden_size)
        x2k = torch.cat(x2k, dim=1)

        _, (hn1, _) = self.lstm_1(x1k)  # Only take the final hidden state from LSTM
        _, (hn2, _) = self.lstm_2(x2k)

        # Apply the final GAT layer
        x1 = checkpoint(self.gat_out_1, hn1.squeeze(0), adj_mat_1, use_reentrant=False)
        x1 = F.elu(x1)

        x2 = checkpoint(self.gat_out_2, hn2.squeeze(0), adj_mat_2, use_reentrant=False)
        x2 = F.elu(x2)

        del adj_mat_1, adj_mat_2
        gc.collect()

        # Sum the final hidden states
        x1 = torch.sum(x1, dim=0)
        x2 = torch.sum(x2, dim=0)

        x = torch.cat((x1, x2), dim=-1)
        x = F.leaky_relu(x, negative_slope=0.01)
        return self.fc(x)