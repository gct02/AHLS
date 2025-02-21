from typing import Dict, Union, Optional, List
from torch.types import Device
from torch_geometric.typing import EdgeType, Metadata

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn import HGTConv, LayerNorm
from torch_geometric.data import HeteroData
from torch_geometric.nn.inits import reset
from torch_geometric.nn.models import JumpingKnowledge
from layers import HetSAGPooling


class HGT_HLS(nn.Module):
    r"""Module that uses the Heterogeneous Graph Transformer (HGT) operator from the
    `"Heterogeneous Graph Transformer" <https://arxiv.org/abs/2003.01332>`_ paper to
    perform graph-level regression.

    Args:
        metadata (Tuple[List[str], List[Tuple[str, str, str]]]):
            Metadata object containing node and edge types.
        in_channels (int or Dict[str, int]): Number of input channels 
            for each node type.
        out_channels (int): Number of output channels.
        hid_dim_conv (int or List[int]): Hidden dimension for each 
            convolutional layer.
        num_conv_layers (int): Number of convolutional layers.
            (default: :obj:`6`)
        hid_dim_fc (int or List[int], optional): Hidden dimension 
            for each fully connected layer. (default: :obj:`None`)
        num_fc_layers (int): Number of fully connected layers.
            (default: :obj:`3`)
        num_heads (int or List[int]): Number of attention heads for 
            each convolutional layer. (default: :obj:`1`)
        fc_dropout (float): Dropout rate for fully connected layers.
            (default: :obj:`0.1`)
        conv_dropout (float): Dropout rate for convolutional layers.
            (default: :obj:`0.0`)
        pool_size (int): Number of nodes to keep after pooling.
            (default: :obj:`8`)
        aggr_paths (List[List[EdgeType]], optional): List of edge type 
            combinations to aggregate over. (default: :obj:`None`)
        apply_ln (bool): Whether to use layer normalization.
            (default: :obj:`True`)
        sep_pragmas (bool): Whether to apply separate convolutions 
            for pragma and CDFG edges. (default: :obj:`False`)
        device (torch.device): Device to use for computation.
            (default: :obj:`"cpu"`)
    """
    def __init__(self, 
        metadata: Metadata,
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        hid_dim_conv: Union[int, List[int]],
        num_conv_layers: int = 6,
        hid_dim_fc: Optional[Union[int, List[int]]] = None,
        num_fc_layers: int = 3,
        num_heads: Union[int, List[int]] = 1,
        fc_dropout: float = 0.0,
        conv_dropout: float = 0.0,
        pool_size: int = 8,
        aggr_paths: Optional[List[List[EdgeType]]] = None,
        apply_ln: bool = True,
        sep_pragmas: bool = False,
        device: Optional[Device] = 'cpu'
    ):
        super().__init__()

        assert num_conv_layers >= 2, "Number of conv layers must be at least 2."

        if isinstance(hid_dim_conv, int):
            hid_dim_conv = [hid_dim_conv] * num_conv_layers

        if isinstance(num_heads, int):
            num_heads = [num_heads] * num_conv_layers

        if aggr_paths is None:
            aggr_paths = [metadata[1]]

        self.device = device
        self.node_types = metadata[0]
        self.edge_types = metadata[1]
        self.hid_dim = hid_dim_conv
        self.num_layers = num_conv_layers
        self.heads = num_heads
        self.use_norm = apply_ln
        self.sep_pragmas = sep_pragmas
        self.aggr_paths = aggr_paths
        self.num_aggr_paths = len(aggr_paths)

        if isinstance(in_channels, int):
            in_channels = {nt: in_channels for nt in self.node_types}

        # Define convolutional layers
        if sep_pragmas:
            pragma_nodes = ['loop_pragma', 'array_pragma']
            pragma_rels = ['transf', 'transf_by']
            self.pragma_edge_types = [
                et for et in self.edge_types if et[1] in pragma_rels or et[0] in pragma_nodes
            ]
            self.cdfg_edge_types = [
                et for et in self.edge_types if et not in self.pragma_edge_types
            ]
            pragma_metadata = (self.node_types, self.pragma_edge_types)
            cdfg_metadata = (self.node_types, self.cdfg_edge_types)

            self.proj_conv = nn.ModuleList([
                HGTConv(in_channels, hid_dim_conv[0], metadata, num_heads[0])
            ])
            self.pragma_conv = nn.ModuleList([
                HGTConv(hid_dim_conv[i-1], hid_dim_conv[i], pragma_metadata, num_heads[i])
                for i in range(1, num_conv_layers + 1)
            ])
            self.cdfg_conv = nn.ModuleList([
                HGTConv(hid_dim_conv[i-1], hid_dim_conv[i], cdfg_metadata, num_heads[i])
                for i in range(1, num_conv_layers + 1)
            ])
            self.merge_conv = nn.ModuleList([
                HGTConv(hid_dim_conv[i], hid_dim_conv[i], metadata, num_heads[i])
                for i in range(1, num_conv_layers + 1) 
            ])
        else:
            self.conv = nn.ModuleList([
                HGTConv(in_channels, hid_dim_conv[0], metadata, num_heads[0])
            ])
            self.conv.extend([
                HGTConv(hid_dim_conv[i-1], hid_dim_conv[i], metadata, num_heads[i])
                for i in range(1, num_conv_layers)
            ])

        # Define normalization layers (optional)
        if self.use_norm:
            self.norm = nn.ModuleDict({
                nt: nn.ModuleList([
                    LayerNorm((hid_dim_conv[i])) for i in range(num_conv_layers-1)
                ])
                for nt in self.node_types
            })

        # Define dropouts
        self.conv_dropout = nn.Dropout(conv_dropout)

        # Define Jumping Knowledge layer
        self.jkn = nn.ModuleDict({
            nt: JumpingKnowledge('lstm', channels=hid_dim_conv[-1], num_layers=num_conv_layers)
            for nt in self.node_types
        })

        # Define pooling layer
        pooling_dim = hid_dim_conv[-1]
        self.pool = HetSAGPooling(metadata, pooling_dim, aggr_paths, pool_size)

        # Define fully connected layers
        aggr_dim = pooling_dim * pool_size
        if hid_dim_fc is None:
            hid_dim_fc = [max(aggr_dim // 2, out_channels)]
            for _ in range(num_fc_layers-1):
                hid_dim_fc.append(max(hid_dim_fc[-1] // 2, out_channels))
        elif isinstance(hid_dim_fc, int):
            hid_dim_fc = [hid_dim_fc] * num_fc_layers

        self.mlp = nn.Sequential(
            nn.Linear(aggr_dim, hid_dim_fc[0]),
            nn.GELU(),
            nn.Dropout(fc_dropout)
        )
        for i in range(1, num_fc_layers):
            self.mlp.extend([
                nn.Linear(hid_dim_fc[i-1], hid_dim_fc[i]),
                nn.GELU(),
                nn.Dropout(fc_dropout)
            ])
        self.mlp.append(nn.Linear(hid_dim_fc[-1], out_channels))

        self.reset_parameters()
        self.to(self.device)

    def reset_parameters(self):
        r"""Reinitializes the model parameters."""
        self.proj_conv.apply(self._init_weights)
        self.pool.apply(self._init_weights)
        self.mlp.apply(self._init_weights)
        if self.use_norm:
            self.norm.apply(self._init_weights)

    def _init_weights(self, m):
        if isinstance(m, nn.Linear):
            nn.init.kaiming_normal_(m.weight, mode='fan_in', nonlinearity='leaky_relu')
            if m.bias is not None:
                nn.init.zeros_(m.bias)
            reset(m)

    def forward(self, data: HeteroData) -> Tensor:
        r"""Runs the forward pass of the module.

        Args:
            data (:class:`torch_geometric.data.HeteroData`):
                A data object containing input node features and graph 
                connectivity information for each individual edge type.
    
        Returns: :obj:`torch.Tensor` - The output prediction tensor.
        """
        x, edge_index = data.x_dict, data.edge_index_dict
        outs = {nt: [] for nt in self.node_types}

        if self.sep_pragmas:
            pragma_edge_index = {et: edge_index[et] for et in self.pragma_edge_types}
            cdfg_edge_index = {et: edge_index[et] for et in self.cdfg_edge_types}

            x = self.proj_conv[i](x, edge_index)
            if self.use_norm:
                x = {k: self.norm[k][i](v) for k, v in x.items()}

            x = {k: self.conv_dropout(F.gelu(v)) for k, v in x.items()}

            for k, v in x.items():
                outs[k].append(v)

        # Convolutional layers
        for i in range(self.num_layers):
            if self.sep_pragmas:
                x_pragma = self.pragma_conv[i](x, pragma_edge_index)
                x_cdfg = self.cdfg_conv[i](x, cdfg_edge_index)
                
                x_pragma = {k: x_pragma[k] if k in x_pragma else torch.zeros_like(x[k]) for k in x}
                x_cdfg = {k: x_cdfg[k] if k in x_cdfg else torch.zeros_like(x[k]) for k in x}

                x = {k: x_pragma[k] + x_cdfg[k] for k in x}
                x = self.merge_conv[i](x, edge_index)
            else:
                x = self.conv[i](x, edge_index)

            if i < self.num_layers - 1:
                if self.use_norm:
                    x = {k: self.norm[k][i](v) for k, v in x.items()}
                x = {k: self.conv_dropout(F.gelu(v)) for k, v in x.items()}

            for k, v in x.items():
                outs[k].append(v)

        # Jumping Knowledge layer
        x = {k: self.jkn[k](outs[k]) for k in x.keys()}

        # Edge-wise aggregation
        x_aggr = self.pool(x, edge_index)

        # Fully connected layers
        x_aggr = self.mlp(x_aggr)

        # Avoid NaNs (edge case handling)
        x_aggr = torch.nan_to_num(x_aggr)

        return x_aggr

