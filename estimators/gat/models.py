import torch
import torch.nn as nn
import torch.nn.functional as F

from estimators.gat.layers import GraphAttentionalLayer

# GAT model for area estimation (might be generalized to other estimations in the future)
class GAT(nn.Module):
    def __init__(self, in_features_1:int, in_features_2:int, out_size:int):
        super(GAT, self).__init__()
        self.gat11 = GraphAttentionalLayer(in_features_1, 16, 4, True, 0.1, 0.1)
        self.gat12 = GraphAttentionalLayer(16, 12, 4, True, 0.1, 0.1)
        self.gat13 = GraphAttentionalLayer(12, 6, 3, True, 0.1, 0.1)
        self.gat14 = GraphAttentionalLayer(6, out_size, 3, False, 0.1, 0.1)

        self.gat21 = GraphAttentionalLayer(in_features_2, 20, 4, True, 0.1, 0.1)
        self.gat22 = GraphAttentionalLayer(20, 16, 4, True, 0.1, 0.1)
        self.gat23 = GraphAttentionalLayer(16, 8, 4, True, 0.1, 0.1)
        self.gat24 = GraphAttentionalLayer(8, out_size, 3, False, 0.1, 0.1)

        self.fc = nn.Linear(2*out_size, out_size)
        nn.init.xavier_normal_(self.fc.weight, gain=1.41)
        nn.init.zeros_(self.fc.bias)

    def forward(self, node_features_1:torch.Tensor, adj_mat_1:torch.Tensor, node_features_2:torch.Tensor, adj_mat_2:torch.Tensor):
        x1 = node_features_1
        x2 = node_features_2
        
        x1 = F.elu(self.gat11(x1, adj_mat_1))
        torch.cuda.empty_cache()
        x1 = F.elu(self.gat12(x1, adj_mat_1))
        torch.cuda.empty_cache()
        x1 = F.elu(self.gat13(x1, adj_mat_1))
        torch.cuda.empty_cache()
        x1 = F.relu(self.gat14(x1, adj_mat_1))
        torch.cuda.empty_cache()

        x2 = F.elu(self.gat21(x2, adj_mat_2))
        torch.cuda.empty_cache()
        x2 = F.elu(self.gat22(x2, adj_mat_2))
        torch.cuda.empty_cache()
        x2 = F.elu(self.gat23(x2, adj_mat_2))
        torch.cuda.empty_cache()
        x2 = F.relu(self.gat24(x2, adj_mat_2))
        torch.cuda.empty_cache()

        x1 = torch.sum(x1, dim=0)
        x2 = torch.sum(x2, dim=0)

        x = torch.cat((x1, x2))
        x = self.fc(x)
        return x
    
    """
    Test: Graph pruning function for GAT model to reduce memory usage
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

"""
# Test: GAT model using LSTM for Jumping Knowledge aggregation
class GAT(nn.Module):
    def __init__(self, in_features_1:int, in_features_2:int, out_size:int, n_layers:int=8):
        super(GAT, self).__init__()

        self.n_layers = n_layers
        self.hidden_size = out_size

        self.gat_pre11 = GraphAttentionalLayer(in_features_1, 9, 3, True, 0.2, 0.0)
        self.gat_pre12 = GraphAttentionalLayer(9, 3, 3, True, 0.1, 0.0)
        self.gat1 = GraphAttentionalLayer(3, 3, 3, False, 0.1, 0.0)

        self.gat_pre21 = GraphAttentionalLayer(in_features_2, 9, 3, True, 0.2, 0.0)
        self.gat_pre22 = GraphAttentionalLayer(9, 3, 3, True, 0.1, 0.0)
        self.gat2 = GraphAttentionalLayer(3, 3, 3, False, 0.1, 0.0)

        # LSTM for Jumping Knowledge aggregation
        self.lstm_1 = nn.LSTM(input_size=3, hidden_size=self.hidden_size, batch_first=True)
        self.lstm_2 = nn.LSTM(input_size=3, hidden_size=self.hidden_size, batch_first=True)

        self.fc = nn.Linear(2*self.hidden_size, out_size)

        # Initialize parameters
        nn.init.xavier_normal_(self.fc.weight, gain=1.41)
        nn.init.zeros_(self.fc.bias)

    def forward(self, node_features_1:torch.Tensor, adj_mat_1:torch.Tensor, node_features_2:torch.Tensor, adj_mat_2:torch.Tensor):
        x1 = node_features_1
        x2 = node_features_2

        x1 = self.gat_pre12(F.elu(self.gat_pre11(x1, adj_mat_1)), adj_mat_1)
        x2 = self.gat_pre22(F.elu(self.gat_pre21(x2, adj_mat_2)), adj_mat_2)

        x1k = []
        x2k = []

        for _ in range(self.n_layers):
            x1 = F.elu(self.gat1(x1, adj_mat_1))
            x2 = F.elu(self.gat2(x2, adj_mat_2))
            x1k.append(x1.unsqueeze(1))  # Add extra dimension for LSTM (sequence length)
            x2k.append(x2.unsqueeze(1))

        x1k = torch.cat(x1k, dim=1)  # Shape: (batch_size, sequence_length, feature_dim)
        x2k = torch.cat(x2k, dim=1)

        _, (hn1, _) = self.lstm_1(x1k)  # Only take the final hidden state from LSTM
        _, (hn2, _) = self.lstm_2(x2k)

        hn1 = torch.sum(hn1.squeeze(0), dim=0)  # Remove the num_layers dimension and sum the final hidden states
        hn2 = torch.sum(hn2.squeeze(0), dim=0)

        x = torch.cat((hn1, hn2), dim=-1)
        x = self.fc(x)

        return x
"""