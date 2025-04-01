from typing import Dict, Union, List, Optional

import torch
import torch.nn as nn
from torch import Tensor
from torch_geometric.nn import HGTConv, SAGPooling
from torch_geometric.data import HeteroData
from torch_geometric.nn.inits import reset
from torch_geometric.typing import Metadata
from torch.types import Device


class HGT(nn.Module):
    r"""Module that uses the Heterogeneous Graph Transformer (HGT) operator from the
    `"Heterogeneous Graph Transformer" <https://arxiv.org/abs/2003.01332>`_ paper to
    perform graph-level regression.

    Args:
        metadata (Tuple[List[str], List[Tuple[str, str, str]]]):
            Metadata object containing node and edge types.
        in_channels (int or Dict[str, int]): Number of input channels 
            for each node type.
        out_channels (int): Number of output channels.
        n_layers (int): Number of convolutional layers.
            (default: :obj:`6`)
        hid_dim (int): Hidden dimension of the convolutional 
            layers. (default: :obj:`64`)
        n_heads (int): Number of attention heads for the 
            convolutional layers. (default: :obj:`8`)
        dropout (float): Dropout rate for fully connected layers. 
            (default: :obj:`0.0`)
        types_to_aggregate (str or List[str], optional): Node types to 
            aggregate for the jumping knowledge layer. If :obj:`None`, 
            all node types are aggregated. (default: :obj:`None`)
        pool_size (int): Number of nodes to keep after pooling.
            (default: :obj:`16`)
        device (torch.device): Device to use for computation. 
            (default: :obj:`"cpu"`)
    """
    def __init__(self, 
        metadata: Metadata,
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        n_layers: int = 5,
        hid_dim: int = 64,
        n_heads: int = 4,
        dropout: float = 0.0,
        pool_size: int = 16,
        device: Device = 'cpu'
    ):
        super().__init__()

        self.device = device
        self.n_layers = n_layers

        # Define convolutional layers
        self.conv = nn.ModuleList([HGTConv(in_channels, hid_dim, metadata, n_heads)])
        
        updated_metadata = (
            [nt for nt in metadata[0] if nt != "base"],
            [et for et in metadata[1] if et[1] != "base"]
        )
        self.conv.extend([
            HGTConv(hid_dim, hid_dim, updated_metadata, n_heads)
            for _ in range(n_layers - 1)
        ])

        self.dropout = nn.Dropout(dropout)

        # Define jumping knowledge layer
        self.attn_jk = nn.MultiheadAttention(hid_dim, n_heads, dropout=dropout)

        # Define pooling layer
        self.pool = SAGPooling(hid_dim, ratio=pool_size)

        # Define graph-level fully connected layers
        self.mlp = nn.Sequential()
        
        hid_dim *= pool_size
        while (next_dim := hid_dim // 2) > out_channels:
            self.mlp.extend([
                nn.Linear(hid_dim, next_dim),
                nn.GELU(),
                nn.Dropout(dropout)
            ])
            hid_dim = next_dim

        self.mlp.append(nn.Linear(hid_dim, out_channels))

        self.reset_parameters()
        self.to(device)

    def reset_parameters(self):
        """Reinitializes model parameters."""
        for m in self.modules():
            self._init_weights(m)

    def _init_weights(self, m):
        if isinstance(m, nn.Linear):
            nn.init.xavier_uniform_(m.weight)
            if m.bias is not None:
                nn.init.zeros_(m.bias)
        elif isinstance(m, nn.MultiheadAttention):
            for param in [m.in_proj_weight, m.out_proj.weight]:
                if param is not None:
                    nn.init.xavier_uniform_(param)
            if m.in_proj_bias is not None:
                nn.init.zeros_(m.in_proj_bias)
            if m.out_proj.bias is not None:
                nn.init.zeros_(m.out_proj.bias)
        elif isinstance(m, nn.LayerNorm):
            nn.init.ones_(m.weight)
            nn.init.zeros_(m.bias)
        elif isinstance(m, HGTConv) or isinstance(m, SAGPooling):
            m.reset_parameters()

    def forward(self, data: HeteroData) -> Tensor:
        r"""Runs the forward pass of the module.

        Args:
            data (torch_geometric.data.HeteroData): A data object containing
                input node features and graph  connectivity information for 
                each individual edge type.
    
        :rtype: :obj:`torch.Tensor` - The output prediction tensor.
        """
        x_dict, edge_index_dict = data.x_dict, data.edge_index_dict
        outs = []

        x_dict = self.conv[0](x_dict, edge_index_dict)
        x_dict = {k: self.dropout(v) for k, v in x_dict.items() if k != "base"}
        edge_index_dict = {k: v for k, v in edge_index_dict.items() if k[1] != "base"}
        outs.append(x_dict["instr"])

        # Convolutional layers
        for i in range(1, self.n_layers):
            x_dict = self.conv[i](x_dict, edge_index_dict)
            x_dict = {k: self.dropout(v) for k, v in x_dict.items()}
            outs.append(x_dict["instr"])

        # Jumping knowledge layer
        out = torch.stack(outs, dim=0)
        out, _ = self.attn_jk(out, out, out)
        out = out.mean(dim=0)

        # Pooling layer
        batch = data.batch_dict["instr"]
        edge_index = torch.cat(
            [v for k, v in edge_index_dict.items() if k[0] == "instr" and k[2] == "instr"], 
            dim=1
        )
        out = self.pool(out, edge_index, batch=batch)[0]

        batch_size = batch.max().item() + 1
        out = out.view(batch_size, -1)

        # Graph-level MLP
        out = self.mlp(out).squeeze(1)
        return out