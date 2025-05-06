from typing import Union, Dict, List, Optional

import torch
import torch.nn as nn
from torch import Tensor
from torch_geometric.nn import (
    HeteroDictLinear, Linear, HGTConv,
    LayerNorm, JumpingKnowledge,
    global_add_pool, global_max_pool
)
from torch_geometric.typing import Metadata, NodeType, EdgeType


class HGT(nn.Module):
    r"""Model that uses the Heterogeneous Graph Transformer (HGT) operator from the
    `"Heterogeneous Graph Transformer" <https://arxiv.org/abs/2003.01332>`_ paper to
    perform graph-level regression.

    Args:
        metadata (Tuple[List[str], List[Tuple[str, str, str]]]):
            Metadata object containing node and edge types.
        in_channels (int or Dict[str, int]): Number of input channels
            for each node type.
        out_channels (int): Number of output channels.
        hid_dims (int or List[int]): Hidden dimensions for each conv layer.
            (default: :obj:`256`)
        heads (int or List[int]): Number of attention heads for each conv layer.
            (default: :obj:`4`)
        num_layers (int, optional): Number of convolutional layers.
            If :obj:`None`, the number of layers is set to the length of
            :obj:`hid_dims` or the number of node types.
            (default: :obj:`None`)
        proj_in_dim (int, optional): Input projection dimension.
            If :obj:`None`, it is set to the first hidden dimension. 
            (default: :obj:`None`)
        proj_out_dim (int, optional): Output projection dimension.
            If :obj:`None`, it is set to the last hidden dimension.
            (default: :obj:`None`)
        jk_layers (List[int], optional): List of layers to use for Jumping
            Knowledge. If :obj:`None`, all layers are used.
            (default: :obj:`None`)
        dropout (float): Dropout rate. (default: :obj:`0.0`)
    """
    def __init__(
        self,
        metadata: Metadata,
        in_channels: Union[int, Dict[NodeType, int]],
        out_channels: int,
        hid_dim: Union[int, List[int]] = 256,
        heads: Union[int, List[int]] = 4,
        num_layers: Optional[int] = None,
        proj_in_dim: Optional[int] = None,
        proj_out_dim: Optional[int] = None,
        jk_layers: Optional[List[int]] = None,
        dropout: float = 0.0
    ):
        super().__init__()

        self.node_types = metadata[0]
        self.edge_types = metadata[1]
        self.in_channels = in_channels
        self.out_channels = out_channels
        self.dropout = dropout

        if num_layers is None:
            if isinstance(hid_dim, list):
                self.num_layers  = len(hid_dim)
            else:
                self.num_layers  = 4  # Default number of layers
        else:
            self.num_layers = num_layers

        if not isinstance(hid_dim, list):
            hid_dim = [hid_dim] * num_layers
        if not isinstance(heads, list):
            heads = [heads] * num_layers

        if len(hid_dim) != num_layers or len(heads) != num_layers:
            raise ValueError(
                "The length of hid_dim and heads must match num_layers."
            )
        
        if proj_in_dim is None:
            proj_in_dim = hid_dim[0]

        # Input projection layer
        self.proj_in = HeteroDictLinear(
            in_channels, proj_in_dim, types=self.node_types, 
            weight_initializer='kaiming_uniform'
        )

        # Convolutional layers
        self.conv = nn.ModuleList()
        self.norm = nn.ModuleList()
        
        for i in range(self.num_layers):
            in_dim = proj_in_dim if i == 0 else hid_dim[i - 1]
            out_dim = hid_dim[i]
            num_heads = heads[i]
            conv = HGTConv(in_dim, out_dim, metadata, heads=num_heads)
            norm = nn.ModuleDict({
                nt: LayerNorm(out_dim) for nt in self.node_types
            })
            self.conv.append(conv)
            self.norm.append(norm)

        if jk_layers is None:
            self.jk_layers = list(range(self.num_layers))
        elif isinstance(jk_layers, int):
            if jk_layers < 0:
                self.jk_layers = [self.num_layers + jk_layers]
            else:
                self.jk_layers = [jk_layers]
        else:
            self.jk_layers = jk_layers

        num_jk_layers = len(self.jk_layers)

        self.jk = nn.ModuleDict({
            nt: JumpingKnowledge(mode='cat', num_layers=num_jk_layers)
            for nt in self.node_types
        })
        jk_out_dim = sum(hid_dim[i] for i in self.jk_layers)

        # Output projection layer
        if proj_out_dim is None:
            proj_out_dim = hid_dim[-1]

        self.proj_out = HeteroDictLinear(
            jk_out_dim, proj_out_dim, types=self.node_types,
            weight_initializer='kaiming_uniform'
        )

        # Small MLP to process y_base
        self.y_base_mlp = nn.Sequential(
            Linear(1, 16, weight_initializer="kaiming_uniform"), 
            nn.LeakyReLU(negative_slope=0.2),
            Linear(16, 16, weight_initializer="kaiming_uniform")
        )

        # Graph-level MLP
        emb_dim = len(self.node_types) * proj_out_dim * 2 + 16
        self.graph_mlp = nn.Sequential(
            Linear(emb_dim, proj_out_dim, weight_initializer="kaiming_uniform"), 
            nn.BatchNorm1d(proj_out_dim), nn.GELU(), nn.Dropout(dropout),
            Linear(proj_out_dim, 128, weight_initializer="kaiming_uniform"),  
            nn.BatchNorm1d(128), nn.GELU(), nn.Dropout(dropout),
            Linear(128, 64, weight_initializer="kaiming_uniform"),
            nn.BatchNorm1d(64), nn.GELU(), nn.Dropout(dropout),
            Linear(64, out_channels, weight_initializer="kaiming_uniform")
        )

        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        self.proj_in.reset_parameters()
        for conv in self.conv:
            conv.reset_parameters()
        for norm in self.norm:
            for nt in self.node_types:
                norm[nt].reset_parameters()
        for nt in self.node_types:
            self.jk[nt].reset_parameters()
        self.proj_out.reset_parameters()
        # self.pool.reset_parameters()
        for m in self.y_base_mlp.modules():
            if isinstance(m, Linear):
                m.reset_parameters()
        for m in self.graph_mlp.modules():
            if isinstance(m, Linear):
                m.reset_parameters()

    def forward(
        self,
        x_dict: Dict[NodeType, Tensor],
        edge_index_dict: Dict[EdgeType, Tensor],
        batch_dict: Dict[NodeType, Tensor],
        y_base: Tensor
    ) -> Tensor:
        r"""Runs the forward pass of the module.

        Args:
            x_dict (Dict[NodeType, Tensor]): Dictionary of node features 
                for each node type.
            edge_index_dict (Dict[EdgeType, Tensor]): Dictionary of edge 
                indices for each edge type.
            batch_dict (Dict[NodeType, Tensor]): Dictionary of batch indices 
                for each node type.
            y_base (Tensor): The target values of the base solutions.

        :rtype: :obj:`torch.Tensor` - The output prediction tensor.
        """
        # Input projection layer
        x_dict = self.proj_in(x_dict)

        # Convolutional layers
        xs_dict = {nt: [] for nt in self.node_types}
        for i in range(self.num_layers):
            x_dict = {nt: self.norm[i][nt](x) for nt, x in x_dict.items()}
            x_dict = self.conv[i](x_dict, edge_index_dict)
            if i in self.jk_layers:
                for nt, out in x_dict.items():
                    xs_dict[nt].append(out)

        # Jumping knowledge
        x_dict = {nt: self.jk[nt](xs_dict[nt]) for nt in self.node_types}

        # Output projection layers
        x_dict = self.proj_out(x_dict)

        # Pooling layer
        batch_size = self._get_batch_size(batch_dict)
        x_list = []
        for nt, x in x_dict.items():
            batch = batch_dict[nt]
            x_add = global_add_pool(x, batch, size=batch_size)
            x_max = global_max_pool(x, batch, size=batch_size)
            x = torch.cat([x_add, x_max], dim=1).view(batch_size, -1)
            x_list.append(x)

        y_base_processed = self.y_base_mlp(y_base)
        x = torch.cat(x_list, dim=1)
        x = torch.cat([x, y_base_processed], dim=1)

        # Graph-level MLP
        out = self.graph_mlp(x)

        return out.squeeze(1)
    
    def _get_batch_size(self, batch_dict: Dict[NodeType, Tensor]) -> int:
        """Returns the batch size of the input data."""
        batch_size = 0
        for batch in batch_dict.values():
            if batch is None or batch.numel() == 0:
                continue
            batch_size = max(batch_size, int(batch.max().item()))
        return batch_size + 1