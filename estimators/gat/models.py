import torch
import torch.nn as nn
import torch.nn.functional as F
from estimators.gat.layers import GraphAttentionalLayer

class GAT(nn.Module):
    def __init__(self, in_features_1:int, in_features_2:int, out_size:int, 
                 hidden_size_1:int=12, hidden_size_2:int=6, n_layers:int=5):
        super(GAT, self).__init__()

        self.n_layers = n_layers

        self.layer_norm_1 = nn.LayerNorm(in_features_1)
        self.layer_norm_2 = nn.LayerNorm(in_features_2)

        self.in_size_1 = in_features_1
        self.in_size_2 = in_features_2
        self.hidden_size_1 = hidden_size_1
        self.hidden_size_2 = hidden_size_2
        self.out_size = out_size

        self.gat_jkn_pre_1 = GraphAttentionalLayer(in_features_1, hidden_size_1, 1, True, 0.01, 0.6)
        self.gat_jkn_1 = GraphAttentionalLayer(hidden_size_1, hidden_size_1, 3, True, 0.01, 0.5)
        self.gat_out_1 = GraphAttentionalLayer(hidden_size_1, out_size, 1, False, 0.001, 0.0)

        self.gat_jkn_pre_2 = GraphAttentionalLayer(in_features_2, hidden_size_2, 1, True, 0.01, 0.6)
        self.gat_jkn_2 = GraphAttentionalLayer(hidden_size_2, hidden_size_2, 3, True, 0.01, 0.5)
        self.gat_out_2 = GraphAttentionalLayer(hidden_size_2, out_size, 1, False, 0.001, 0.0)

        # LSTM for Jumping Knowledge aggregation
        self.lstm_1 = nn.LSTM(input_size=hidden_size_1, hidden_size=hidden_size_1, batch_first=True)
        self.lstm_2 = nn.LSTM(input_size=hidden_size_2, hidden_size=hidden_size_2, batch_first=True)

        self.fc = nn.Linear(2*out_size, out_size)

        self.reset_parameters()

    def reset_parameters(self):
        nn.init.xavier_normal_(self.fc.weight, gain=1.41)
        nn.init.zeros_(self.fc.bias)
        nn.init.xavier_normal_(self.lstm_1.weight_ih_l0, gain=1.41)
        nn.init.xavier_normal_(self.lstm_1.weight_hh_l0, gain=1.41)
        nn.init.zeros_(self.lstm_1.bias_ih_l0)
        nn.init.zeros_(self.lstm_1.bias_hh_l0)

    def forward(self, node_features_1:torch.Tensor, adj_mat_1:torch.Tensor, 
                node_features_2:torch.Tensor, adj_mat_2:torch.Tensor):
        x1 = self.layer_norm_1(node_features_1)
        x2 = self.layer_norm_2(node_features_2)

        x1 = F.elu(self.gat_jkn_pre_1(x1, adj_mat_1))
        x2 = F.elu(self.gat_jkn_pre_2(x2, adj_mat_2))

        x1k = []
        x2k = []

        for _ in range(self.n_layers):
            x1 = F.elu(self.gat_jkn_1(x1, adj_mat_1))
            x2 = F.elu(self.gat_jkn_2(x2, adj_mat_2))
            x1k.append(x1.unsqueeze(1))  # Add extra dimension for LSTM
            x2k.append(x2.unsqueeze(1))

        x1k = torch.cat(x1k, dim=1)  # Shape: (1, n_layers, hidden_size)
        x2k = torch.cat(x2k, dim=1)

        _, (hn1, _) = self.lstm_1(x1k)  # Only take the final hidden state from LSTM
        _, (hn2, _) = self.lstm_2(x2k)

        # Apply the final GAT layer
        x1 = F.elu(self.gat_out_1(hn1.squeeze(0), adj_mat_1))
        x2 = F.elu(self.gat_out_2(hn2.squeeze(0), adj_mat_2))

        # Sum the final hidden states
        x1 = torch.sum(x1, dim=0)
        x2 = torch.sum(x2, dim=0)

        x = torch.cat((x1, x2), dim=-1)
        x = F.relu(self.fc(x))
        return x