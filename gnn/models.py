import torch
import torch.nn as nn
from torch import Tensor
from torch_geometric.nn import (
    Linear,
    LayerNorm,
    GATv2Conv,
    JumpingKnowledge,
    GraphMultisetTransformer
)

from gnn.data.dataset import METRIC_SIZES_BY_CATEGORY


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
        gmt_k: int = 16,
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
        jk_out_dim = hidden_channels * (num_layers if jk_mode == 'cat' else 1)

        self.gmt = GraphMultisetTransformer(
            channels=jk_out_dim,
            k=gmt_k,
            num_encoder_blocks=1,
            heads=heads,
            layer_norm=True,
            dropout=dropout
        )
        self.out_lin = Linear(jk_out_dim, out_channels)

    def reset_parameters(self):
        """Reinitializes model parameters."""
        self.proj_lin.reset_parameters()

        for i in range(self.num_layers):
            self.convs[i].reset_parameters()
            self.norms[i].reset_parameters()

        self.jk.reset_parameters()
        self.gmt.reset_parameters()
        self.out_lin.reset_parameters()

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

        x = self.jk(xs)
        x = self.gmt(x, batch).flatten(start_dim=1)
        x = self.out_lin(x)
        return x

class HLSQoREstimator(nn.Module):
    r"""Model for estimating HLS QoR using a heterogeneous graph neural network."""
    def __init__(
        self,
        target_metric: str,
        in_channels: int,
        hidden_channels,
        num_layers: int,
        edge_dim: int,
        heads: int = 1,
        negative_slope: float = 0.2,
        dropout_gnn: float = 0.0,
        dropout_mlp: float = 0.0,
        gmt_k: int = 16,
        jk_mode: str = 'cat'
    ):
        super().__init__()

        self.target_metric = target_metric
        self.num_outputs = METRIC_SIZES_BY_CATEGORY[target_metric]

        self.gnn = GATv2JK(
            in_channels=in_channels,
            hidden_channels=hidden_channels,
            out_channels=hidden_channels,
            num_layers=num_layers,
            edge_dim=edge_dim,
            heads=heads,
            negative_slope=negative_slope,
            dropout=dropout_gnn,
            gmt_k=gmt_k,
            jk_mode=jk_mode
        )

        # Small MLP to process y_base
        self.y_base_mlp = nn.Sequential(
            Linear(self.num_outputs, 16), 
            nn.PReLU(16),
            Linear(16, 16)
        )

        self.mlps = nn.ModuleList(
            [
                nn.Sequential(
                    Linear(hidden_channels + 16, hidden_channels // 2), 
                    nn.LayerNorm(hidden_channels // 2), nn.GELU(), nn.Dropout(dropout_mlp),
                    Linear(hidden_channels // 2, hidden_channels // 4),
                    nn.LayerNorm(hidden_channels // 4), nn.GELU(), nn.Dropout(dropout_mlp),
                    Linear(hidden_channels // 4, 1)
                )
                for _ in range(self.num_outputs)
            ]
        )

        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        self.gnn.reset_parameters()

        for m in self.y_base_mlp.modules():
            if hasattr(m, 'reset_parameters'):
                m.reset_parameters()

        for mlp in self.mlps:
            for m in mlp.modules():
                if hasattr(m, 'reset_parameters'):
                    m.reset_parameters()

    def forward(
        self, 
        x: Tensor,
        edge_index: Tensor,
        edge_attr: Tensor,
        batch: Tensor,
        y_base: Tensor
    ) -> Tensor:
        x = self.gnn(x, edge_index, edge_attr, batch)
        y_base = self.y_base_mlp(y_base)

        x = torch.cat([x, y_base], dim=1)

        outs = []
        for mlp in self.mlps:
            outs.append(mlp(x))

        out = torch.cat(outs, dim=1)
        return out
