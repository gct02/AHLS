import torch
import torch.nn as nn
from torch import Tensor
from torch.nn import Sequential, PReLU

from torch_geometric.nn import (
    Linear,
    LayerNorm,
    GATv2Conv,
    JumpingKnowledge
)
from torch_geometric.data import Data
from torch_geometric.utils import subgraph

from estimators.area.dataset import NUM_TARGETS
from estimators.area.layers import GlobalSoftAttention


class GATv2JK(nn.Module):
    def __init__(
        self,
        in_channels: int,
        hidden_channels: int,
        out_channels: int,
        num_layers: int,
        edge_dim: int,
        heads: int = 1,
        negative_slope: float = 0.2,
        dropout: float = 0.0,
        jk_mode: str = 'cat'
    ):
        super().__init__()

        self.num_layers = num_layers
        self.jk_mode = jk_mode

        self.proj_lin = Linear(in_channels, hidden_channels)

        self.norms = nn.ModuleList()
        self.convs = nn.ModuleList()
        for i in range(num_layers):
            norm = LayerNorm(hidden_channels)
            conv = GATv2Conv(
                hidden_channels,
                hidden_channels // heads if i < num_layers - 1 else hidden_channels,
                heads=heads,
                concat=i < num_layers - 1,
                negative_slope=negative_slope,
                dropout=dropout,
                edge_dim=edge_dim,
                residual=True
            )
            self.norms.append(norm)
            self.convs.append(conv)

        self.jk = JumpingKnowledge(
            mode=jk_mode, 
            channels=hidden_channels, 
            num_layers=num_layers
        )
        jk_out_dim = hidden_channels
        if jk_mode == 'cat':
            jk_out_dim *= num_layers

        self.node_lin = Linear(jk_out_dim, out_channels)

    def reset_parameters(self):
        """Reinitializes model parameters."""
        self.proj_lin.reset_parameters()

        for i in range(self.num_layers):
            self.convs[i].reset_parameters()
            self.norms[i].reset_parameters()

        self.jk.reset_parameters()
        self.node_lin.reset_parameters()

    def forward(
        self,
        x: Tensor,
        edge_index: Tensor,
        edge_attr: Tensor,
        batch: Tensor
    ) -> Tensor:
        x = self.proj_lin(x)

        xs = []
        for i in range(self.num_layers):
            x = self.norms[i](x, batch)
            x = self.convs[i](x, edge_index, edge_attr)
            xs.append(x)

        x_out = self.jk(xs)
        x_out = self.node_lin(x_out)
        return x_out

class HLSQoREstimator(nn.Module):
    r"""Model for estimating HLS QoR using a heterogeneous graph neural network."""
    def __init__(
        self,
        in_channels: int,
        hidden_channels,
        edge_dim: int,
        graph_attr_dim: int,
        num_layers_fg: int = 2,
        num_layers_cg: int = 0,
        heads: int = 1,
        negative_slope: float = 0.2,
        dropout_gnn: float = 0.0,
        dropout_mlp: float = 0.0,
        jk_mode: str = 'cat'
    ):
        super().__init__()

        self.apply_cg = num_layers_cg > 0

        self.gnn_fg = GATv2JK(
            in_channels=in_channels,
            hidden_channels=hidden_channels,
            out_channels=hidden_channels,
            num_layers=num_layers_fg,
            edge_dim=edge_dim,
            heads=heads,
            negative_slope=negative_slope,
            dropout=dropout_gnn,
            jk_mode=jk_mode
        )

        self.gate_nn_fg = Sequential(
            Linear(hidden_channels, hidden_channels), 
            PReLU(hidden_channels), 
            Linear(hidden_channels, 1),
        )
        self.glob_att_fg = GlobalSoftAttention(gate_nn=self.gate_nn_fg)

        if self.apply_cg:
            self.gnn_cg = GATv2JK(
                in_channels=hidden_channels,
                hidden_channels=hidden_channels,
                out_channels=hidden_channels,
                num_layers=num_layers_cg,
                edge_dim=edge_dim,
                heads=heads,
                negative_slope=negative_slope,
                dropout=dropout_gnn,
                jk_mode=jk_mode
            )
            self.gate_nn_cg = Sequential(
                Linear(hidden_channels, hidden_channels), 
                PReLU(hidden_channels), 
                Linear(hidden_channels, 1),
            )
            self.glob_att_cg = GlobalSoftAttention(gate_nn=self.gate_nn_cg)
        else:
            self.gnn_cg = None
            self.gate_nn_cg = None
            self.glob_att_cg = None

        # Small MLP to process graph attributes
        self.graph_attr_mlp = nn.Sequential(
            Linear(graph_attr_dim, 64), 
            nn.PReLU(64),
            Linear(64, 64)
        )

        mlp_input_dim = hidden_channels + 64
        if self.apply_cg:
            mlp_input_dim += hidden_channels

        self.mlps = nn.ModuleList(
            [
                nn.Sequential(
                    Linear(mlp_input_dim, hidden_channels), 
                    nn.LayerNorm(hidden_channels), nn.GELU(), nn.Dropout(dropout_mlp),
                    Linear(hidden_channels, hidden_channels // 2),
                    nn.LayerNorm(hidden_channels // 2), nn.GELU(), nn.Dropout(dropout_mlp),
                    Linear(hidden_channels // 2, 1)
                )
                for _ in range(NUM_TARGETS)
            ]
        )
        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        self.gnn_fg.reset_parameters()
        self.glob_att_fg.reset_parameters()

        if self.apply_cg:
            self.gnn_cg.reset_parameters()
            self.glob_att_cg.reset_parameters()

        for m in self.graph_attr_mlp.modules():
            if hasattr(m, 'reset_parameters'):
                m.reset_parameters()

        for mlp in self.mlps:
            for m in mlp.modules():
                if hasattr(m, 'reset_parameters'):
                    m.reset_parameters()

    def forward(self, data: Data) -> Tensor:
        x, edge_index, edge_attr, batch, graph_attr = (
            data.x, 
            data.edge_index, 
            data.edge_attr, 
            data.batch, 
            data.graph_attr
        )
        if self.apply_cg:
            if not hasattr(data, 'coarse_x_index'):
                raise ValueError(
                    "Data object must contain 'coarse_x_index' for coarse-grained GNN."
                )
            coarse_x_index = data.coarse_x_index
        else:
            coarse_x_index = None

        # Process graph attributes
        graph_attr = self.graph_attr_mlp(graph_attr)

        # Fine-grained GNN
        x = self.gnn_fg(x, edge_index, edge_attr, batch)
        out_fg, _ = self.glob_att_fg(x, batch)
        
        if self.apply_cg:
            # Coarse-grained GNN
            edge_index_cg, edge_attr_cg = subgraph(
                subset=coarse_x_index,
                edge_index=edge_index,
                edge_attr=edge_attr,
                relabel_nodes=True
            )
            x_cg = x[coarse_x_index]
            batch_cg = batch[coarse_x_index]
            x_cg = self.gnn_cg(x_cg, edge_index_cg, edge_attr_cg, batch_cg)
            out_cg, _ = self.glob_att_cg(x_cg, batch_cg)
            out = torch.cat([out_fg, out_cg, graph_attr], dim=1)
        else:
            out = torch.cat([out_fg, graph_attr], dim=1)

        outs = []
        for mlp in self.mlps:
            outs.append(mlp(out))

        return torch.cat(outs, dim=1)
