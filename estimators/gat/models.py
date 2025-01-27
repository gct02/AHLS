import torch
import torch.nn as nn
import torch.nn.functional as F
import gc
from torch import Tensor
from gat.layers import GraphAttentionalLayer
from torch.utils.checkpoint import checkpoint

class GAT(nn.Module):
    def __init__(
        self, 
        n_features: int, 
        n_out: int, 
        n_hid1: int, 
        n_hid2: int, 
        heads1: int, 
        heads2: int = 1, 
        n_layers: int = 5, 
        norm: bool = False,
        dropout: float = 0.1,
        leaky_relu_slope: float = 0.01
    ):
        super(GAT, self).__init__()

        self.dropout = dropout
        self.leaky_relu_slope = leaky_relu_slope

        self.n_layers = n_layers

        self.normalize = norm
        if norm:
            self.norm = nn.LayerNorm(n_hid1)

        self.n_in = n_features
        self.n_hid1 = n_hid1
        self.n_hid2 = n_hid2
        self.n_out = n_out

        self.gat_jkn_pre = GraphAttentionalLayer(
            in_features=n_features, 
            out_features=n_hid1, 
            n_heads=heads1, 
            concat=True, 
            leaky_relu_slope=leaky_relu_slope,
            dropout=dropout
        )
        self.gat_jkn = GraphAttentionalLayer(
            in_features=n_hid1, 
            out_features=n_hid1, 
            n_heads=heads1, 
            concat=True, 
            leaky_relu_slope=leaky_relu_slope,
            dropout=dropout
        )
        self.gat_out = GraphAttentionalLayer(
            in_features=n_hid1, 
            out_features=n_hid2, 
            n_heads=heads2, 
            concat=False, 
            leaky_relu_slope=leaky_relu_slope,
            dropout=dropout
        )

        # LSTM for Jumping Knowledge aggregation
        self.lstm = nn.LSTM(input_size=n_hid1, hidden_size=n_hid1, 
                            batch_first=True)
        
        self.fc = nn.Linear(n_hid2, n_out)

        self._reset_parameters()

    def _reset_parameters(self):
        # Initialize the final linear layer bias with a small positive value
        # to prevent negative predictions without using a ReLU activation
        nn.init.constant_(self.fc.bias, 0.1)

    def get_adj_and_node_degrees(
        self, 
        edges: Tensor,
        n_nodes: int,
        sparse: bool = False
    ) -> Tensor:
        adj_mat = torch.tensor(
            [0] * (n_nodes * n_nodes), 
            dtype=torch.float32, 
            device="cpu"
        ).view(n_nodes, n_nodes)

        adj_mat[edges[0,:]-1, edges[1,:]-1] = 0

        node_degrees = torch.sum(adj_mat, dim=1)
        node_degrees[node_degrees == 0] = 1

        adj_mat[adj_mat == 0] = -9e15

        if sparse:
            adj_mat = adj_mat.to_sparse()

        return adj_mat, node_degrees

    def forward(self, node_features: Tensor, edges: Tensor) -> Tensor:
        n_nodes = node_features.shape[0]
        adj_mat, node_degrees = self.get_adj_and_node_degrees(edges, n_nodes)

        x = checkpoint(self.gat_jkn_pre, node_features, adj_mat, node_degrees,
                       use_reentrant=False)
        x = F.elu(x)

        if self.normalize:
            x = self.norm(x)

        xk = []
        for _ in range(self.n_layers):
            x = checkpoint(self.gat_jkn, x, adj_mat, node_degrees,
                           use_reentrant=False)
            x = F.elu(x)
            if self.normalize:
                x = self.norm(x)
            xk.append(x.unsqueeze(1)) # Add extra dimension for LSTM

        xk = torch.cat(xk, dim=1) # Shape: (1, n_layers, n_nodes, n_hid1)

        _, (hn, _) = self.lstm(xk) # Only take the final hidden state from LSTM

        # Apply the final GAT layer
        x = checkpoint(self.gat_out, hn.squeeze(0), adj_mat, node_degrees,
                       use_reentrant=False)
        x = F.elu(x)

        del adj_mat
        gc.collect()

        # Sum the final hidden states
        x = torch.sum(x, dim=0)
        x = F.leaky_relu(x, negative_slope=self.leaky_relu_slope)
        
        return self.fc(x)