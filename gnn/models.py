from typing import Union, Dict, List, Optional

import torch
import torch.nn as nn
from torch import Tensor
from torch_geometric.nn import (
    Linear,
    HeteroDictLinear, 
    LayerNorm,
    HGTConv,
    global_add_pool, 
    global_max_pool
)
from torch_geometric.data import HeteroData
from torch_geometric.typing import Metadata, NodeType


class HGT(nn.Module):
    r"""Model that uses the Heterogeneous Graph Transformer (HGT) operator from the
    `"Heterogeneous Graph Transformer" <https://arxiv.org/abs/2003.01332>`_ paper to
    perform graph-level regression.

    Args:
        metadata (Metadata): Metadata object containing node and edge types.
        in_channels (int or Dict[str, int]): Number of input channels
            for each node type.
        out_channels (int): Number of output channels.
        hid_dim (int or List[int]): Hidden dimensions for each conv layer.
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
                num_layers = len(hid_dim)
            else:
                num_layers = 2  # Default to 2 layers
                
        self.num_layers = num_layers

        if not isinstance(hid_dim, list):
            hid_dim = [hid_dim] * num_layers
        if not isinstance(heads, list):
            heads = [heads] * num_layers

        if len(hid_dim) != num_layers or len(heads) != num_layers:
            raise ValueError(
                "The length of hid_dim and heads must match num_layers."
            )

        # Input projection layer
        if proj_in_dim is None:
            proj_in_dim = hid_dim[0]

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
            conv = HGTConv(
                in_channels=in_dim, 
                out_channels=out_dim, 
                metadata=metadata, 
                heads=num_heads
            )
            norm = nn.ModuleDict({
                nt: LayerNorm(in_dim) 
                for nt in self.node_types
            })
            self.conv.append(conv)
            self.norm.append(norm)

        # Small MLP to process y_base
        self.y_base_mlp = nn.Sequential(
            Linear(1, 16), 
            nn.LeakyReLU(negative_slope=0.1),
            Linear(16, 16)
        )

        # Graph-level MLP
        emb_dim = len(self.node_types) * 2 * hid_dim[-1] + 16
        self.graph_mlp = nn.Sequential(
            Linear(emb_dim, hid_dim[-1]), 
            nn.LayerNorm(hid_dim[-1]), nn.GELU(), nn.Dropout(dropout),
            Linear(hid_dim[-1], 64),  
            nn.LayerNorm(64), nn.GELU(), nn.Dropout(dropout),
            Linear(64, out_channels)
        )

        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        self.proj_in.reset_parameters()
        for conv, norm in zip(self.conv, self.norm):
            conv.reset_parameters()
            for nt in self.node_types:
                norm[nt].reset_parameters()
        for m in self.y_base_mlp.modules():
            if isinstance(m, Linear):
                m.reset_parameters()
        for m in self.graph_mlp.modules():
            if isinstance(m, Linear):
                m.reset_parameters()

    def forward(self, data: HeteroData) -> Tensor:
        r"""Runs the forward pass of the module.

        Args:
            data (HeteroData): HeteroData object containing the graph data.

        :rtype: :obj:`torch.Tensor` - The output prediction tensor.
        """
        x_dict, edge_index_dict, batch_dict = data.x_dict, data.edge_index_dict, data.batch_dict
        batch_size = self._get_batch_size(batch_dict)
        
        # Input projection layer
        x_dict = self.proj_in(x_dict)

        # Convolutional layers
        for conv, norm in zip(self.conv, self.norm):
            x_dict = {
                nt: norm[nt](x, batch_dict[nt], batch_size=batch_size) 
                for nt, x in x_dict.items()
            }
            x_dict = conv(x_dict, edge_index_dict)
    
        # Pooling layer
        x_list = []
        for nt, x in x_dict.items():
            batch = batch_dict[nt]
            x_add = global_add_pool(x, batch, size=batch_size)
            x_max = global_max_pool(x, batch, size=batch_size)
            x = torch.cat([x_add, x_max], dim=1).view(batch_size, -1)
            x_list.append(x)

        x = torch.cat(x_list, dim=1)

        y_base_processed = self.y_base_mlp(data.y_base)
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
    
