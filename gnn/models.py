from typing import Union, Dict, List, Optional

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn import (
    HeteroDictLinear, Linear, HGTConv, LayerNorm,
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
            norm = nn.ModuleDict({
                nt: LayerNorm(in_dim) 
                for nt in self.node_types
            })
            conv = HGTConv(in_dim, out_dim, metadata, heads=num_heads)
            self.norm.append(norm)
            self.conv.append(conv)

        # Small MLP to process y_base
        self.y_base_mlp = nn.Sequential(
            Linear(1, 16, weight_initializer="kaiming_uniform"), 
            nn.LeakyReLU(negative_slope=0.2),
            Linear(16, 16, weight_initializer="kaiming_uniform")
        )

        # Graph-level MLP
        emb_dim = len(self.node_types) * 2 * hid_dim[-1] + 16
        self.graph_mlp = nn.Sequential(
            Linear(emb_dim, hid_dim[-1], weight_initializer="kaiming_uniform"), 
            nn.BatchNorm1d(hid_dim[-1]), nn.GELU(), nn.Dropout(dropout),
            Linear(hid_dim[-1], 64, weight_initializer="kaiming_uniform"),  
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
        x_dict = {
            nt: F.dropout(F.gelu(x), p=self.dropout, training=self.training)
            for nt, x in x_dict.items()
        }

        # Convolutional layers
        for i in range(self.num_layers):
            x_dict = {nt: self.norm[i][nt](x) for nt, x in x_dict.items()}
            x_dict = self.conv[i](x_dict, edge_index_dict)

        # Pooling layer
        batch_size = self._get_batch_size(batch_dict)
        x_list = []
        for nt, x in x_dict.items():
            batch = batch_dict[nt]
            x_add = global_add_pool(x, batch, size=batch_size)
            x_max = global_max_pool(x, batch, size=batch_size)
            x = torch.cat([x_add, x_max], dim=1).view(batch_size, -1)
            x_list.append(x)

        x = torch.cat(x_list, dim=1)

        y_base_processed = self.y_base_mlp(y_base)
        x = torch.cat([x, y_base_processed], dim=1)

        # Graph-level MLP
        out = self.graph_mlp(x)

        return out.squeeze(1)
    
    def _get_batch_size(self, batch_dict: Dict[NodeType, Tensor]) -> int:
        """Returns the batch size."""
        batch_size = 0
        for batch in batch_dict.values():
            if batch.numel() > 0:
                batch_size = max(batch_size, int(batch.max().item()))
        return batch_size + 1
    

class HLSGNN(nn.Module):
    def __init__(
        self, 
        metadata: Metadata, 
        in_channels: Union[int, Dict[NodeType]],
        out_channels: int,
        heads: Optional[int] = 1
    ):
        super().__init__()

        hrchy_edge_types = [
            et for et in metadata[1] 
            if et[1] in ['hrchy', 'hrchy_rev']
        ]
        data_edge_types = [
            et for et in metadata[1] 
            if et[1] in ['data', 'mem']
            and et[0] == 'instr' and et[2] == 'instr'
        ]
        array_edge_types = [
            et for et in metadata[1] 
            if et[0] == 'array' or et[2] == 'array'
        ]

        self.ap_node_types = ['array_partition', 'array', 'instr']
        self.ap_edge_types = (array_edge_types 
                              + [('array_partition', 'transform', 'array')])

        self.unroll_node_types = ['unroll', 'region', 'block', 'instr']
        self.unroll_edge_types = (hrchy_edge_types 
                                  + [('unroll', 'transform', 'region')])

        self.pipeline_node_types = ['pipeline', 'array', 'region', 'block', 'instr']
        self.pipeline_edge_types = (data_edge_types + hrchy_edge_types
                                    + array_edge_types + [('pipeline', 'transform', 'region')])

        self.merge_node_types = ['loop_merge', 'array', 'region', 'block', 'instr']
        self.merge_edge_types = (data_edge_types + hrchy_edge_types
                                 + array_edge_types + [('loop_merge', 'transform', 'region')])

        self.flatten_node_types = ['loop_flatten', 'region', 'block', 'instr']
        self.flatten_edge_types = (data_edge_types + hrchy_edge_types
                                   + array_edge_types + [('loop_flatten', 'transform', 'region')])

        self.ap_metadata = (self.ap_node_types, self.ap_edge_types)
        self.unroll_metadata = (self.unroll_node_types, self.unroll_edge_types)
        self.pipeline_metadata = (self.pipeline_node_types, self.pipeline_edge_types)
        self.merge_metadata = (self.merge_node_types, self.merge_edge_types)
        self.flatten_metadata = (self.flatten_node_types, self.flatten_edge_types)

        self.ap_in_channels = {nt: d for nt, d in in_channels.items() if nt in self.ap_node_types}
        self.unroll_in_channels = {nt: d for nt, d in in_channels.items() if nt in self.unroll_node_types}
        self.pipeline_in_channels = {nt: d for nt, d in in_channels.items() if nt in self.pipeline_node_types}
        self.merge_in_channels = {nt: d for nt, d in in_channels.items() if nt in self.merge_node_types}
        self.flatten_in_channels = {nt: d for nt, d in in_channels.items() if nt in self.flatten_node_types}

        self.ap_gnn = HGTConv(
            in_channels=self.ap_in_channels,
            out_channels=out_channels,
            metadata=self.ap_metadata,
            heads=heads,
        )
        self.unroll_gnn = HGTConv(
            in_channels=self.unroll_in_channels,
            out_channels=out_channels,
            metadata=self.unroll_metadata,
            heads=heads,
        )
        self.pipeline_gnn = HGTConv(
            in_channels=self.pipeline_in_channels,
            out_channels=out_channels,
            metadata=self.pipeline_metadata,
            heads=heads,
        )
        self.merge_gnn = HGTConv(
            in_channels=self.merge_in_channels,
            out_channels=out_channels,
            metadata=self.merge_metadata,
            heads=heads,
        )
        self.flatten_gnn = HGTConv(
            in_channels=self.flatten_in_channels,
            out_channels=out_channels,
            metadata=self.flatten_metadata,
            heads=heads,
        )