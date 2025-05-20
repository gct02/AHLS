from typing import Union, Dict, List, Optional, Tuple

import torch
import torch.nn as nn
import torch.nn.functional as F
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
from torch_geometric.typing import Metadata, NodeType, EdgeType


class HGT(nn.Module):
    r"""Model that uses the Heterogeneous Graph Transformer (HGT) operator from the
    `"Heterogeneous Graph Transformer" <https://arxiv.org/abs/2003.01332>`_ paper to
    perform graph-level regression.

    Args:
        metadata (Metadata): Metadata object containing node and edge types.
        dct_metadata_dict (Dict[str, Metadata]): Dictionary holding Metadata 
            objects containing node and edge types for each HLS directive.
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
        dct_metadata_dict: Dict[str, Metadata],
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
        self.dct_node_types = dct_metadata_dict.keys()
        self.dct_edge_types = [
            et for et in self.edge_types
            if et[0] in self.dct_node_types
        ]
        self.cdfg_node_types = [
            nt for nt in self.node_types 
            if nt not in self.dct_node_types
        ]
        self.cdfg_edge_types = [
            et for et in self.edge_types
            if et not in self.dct_edge_types
        ]
        self.in_channels = in_channels
        self.out_channels = out_channels
        self.dropout = dropout

        if num_layers is None:
            if isinstance(hid_dim, list):
                num_layers  = len(hid_dim)
            else:
                num_layers  = 4  # Default number of layers

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
            in_channels, proj_in_dim, types=self.node_types
        )

        # GNN for HLS directives
        self.hls_gnn = HLSTransformGNN(
            dct_metadata_dict=dct_metadata_dict, 
            in_channels=proj_in_dim, 
            out_channels=proj_in_dim, 
            heads=heads[0]
        )

        # Convolutional layers
        self.conv = nn.ModuleList()
        self.norm = nn.ModuleList()

        cdfg_metadata = (
            self.cdfg_node_types,
            self.cdfg_edge_types
        )
        for i in range(self.num_layers):
            in_dim = proj_in_dim if i == 0 else hid_dim[i - 1]
            out_dim = hid_dim[i]
            num_heads = heads[i]
            conv = HGTConv(
                in_channels=in_dim, 
                out_channels=out_dim, 
                metadata=cdfg_metadata, 
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
        emb_dim = len(self.cdfg_node_types) * 2 * hid_dim[-1] + 16
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
        self.hls_gnn.reset_parameters()
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

        # GNN for HLS directives
        x_dict = self.hls_gnn(x_dict, data)
        
        # Filter out node and edge types related to HLS directives
        x_dict, edge_index_dict, batch_dict = self._filter_data(
            x_dict, edge_index_dict, batch_dict
        )

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
    
    def _filter_data(
        self,
        x_dict: Dict[NodeType, Tensor],
        edge_index_dict: Dict[EdgeType, Tensor],
        batch_dict: Dict[NodeType, Tensor]
    ) -> Tuple[Dict[NodeType, Tensor], Dict[EdgeType, Tensor], Dict[NodeType, Tensor]]:
        """Filters out node and edge types related to HLS directives."""
        x_dict = {
            nt: x for nt, x in x_dict.items()
            if nt in self.cdfg_node_types
        }
        edge_index_dict = {
            et: edge_index for et, edge_index in edge_index_dict.items()
            if et in self.cdfg_edge_types
        }
        batch_dict = {
            nt: batch for nt, batch in batch_dict.items()
            if nt in self.cdfg_node_types
        }
        return x_dict, edge_index_dict, batch_dict
    
    def _get_batch_size(self, batch_dict: Dict[NodeType, Tensor]) -> int:
        """Returns the batch size."""
        batch_size = 0
        for batch in batch_dict.values():
            if batch.numel() > 0:
                batch_size = max(batch_size, int(batch.max().item()))
        return batch_size + 1
    

class HLSTransformGNN(nn.Module):
    def __init__(
        self, 
        dct_metadata_dict: Dict[str, Metadata],
        in_channels: Union[int, Dict[NodeType, int]],
        out_channels: int,
        heads: int = 1
    ):
        super().__init__()

        self.directives = [
            "loop_flatten",
            "loop_merge",
            "array_partition",
            "unroll",
            "pipeline"
        ]

        self.gnn = nn.ModuleDict({
            dct: HGTConv(
                in_channels=in_channels, 
                out_channels=out_channels, 
                metadata=dct_metadata_dict[dct], 
                heads=heads
            )
            for dct in self.directives
        })

        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        for gnn in self.gnn.values():
            gnn.reset_parameters()

    def forward(self, x_dict: Dict[NodeType, Tensor], data: HeteroData):
        for dct in self.directives:
            try:
                x_mask_dict = data.__getattr__(f"{dct}_x_mask_dict")
                filtered_edge_dict = data.__getattr__(f"{dct}_filtered_edge_dict")
            except AttributeError:
                raise AttributeError(
                    f"Missing attributes for directive {dct} in data."
                )
            
            filtered_x_dict = {
                nt: x_dict[nt][mask, :]
                for nt, mask in x_mask_dict.items()
            }
            filtered_x_dict = self.gnn[dct](filtered_x_dict, filtered_edge_dict)

            for nt, x in filtered_x_dict.items():
                if x is not None and x.size(0) > 0:
                    x_dict[nt][x_mask_dict[nt], :] = x
            
        return x_dict