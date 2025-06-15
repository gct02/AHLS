from typing import Union, Dict, List, Optional

import torch
import torch.nn as nn
from torch import Tensor
from torch_geometric.nn import (
    Linear,
    HeteroDictLinear,
    LayerNorm,
    HGTConv,
    JumpingKnowledge,
    global_add_pool,
    global_mean_pool,
    global_max_pool
)
from torch_geometric.typing import Metadata, NodeType, EdgeType

from gnn.data.dataset import TARGET_SIZE_PER_TYPE


class HGTJK(nn.Module):
    def __init__(
        self,
        in_channels: int,
        hidden_channels: Union[int, List[int]],
        num_layers: int,
        out_channels: int,
        metadata: Metadata,
        heads: Union[int, List[int]]
    ):
        super().__init__()

        self.node_types = metadata[0]
        self.edge_types = metadata[1]
        self.num_layers = num_layers

        if isinstance(hidden_channels, int):
            hidden_channels = [hidden_channels] * num_layers

        if isinstance(heads, int):
            heads = [heads] * num_layers

        self.convs = nn.ModuleList()
        self.norm_dicts = nn.ModuleList()

        for i in range(num_layers):
            conv = HGTConv(
                in_channels if i == 0 else hidden_channels[i-1],
                hidden_channels[i],
                metadata=metadata,
                heads=heads[i]
            )
            norm_dict = nn.ModuleDict({
                nt: LayerNorm(hidden_channels[i])
                for nt in metadata[0]
            })
            self.convs.append(conv)
            self.norm_dicts.append(norm_dict)

        self.jk_dict = nn.ModuleDict({
            nt: JumpingKnowledge(mode='cat')
            for nt in metadata[0]
        })

        self.out_lin = HeteroDictLinear(
            sum(hidden_channels),
            out_channels,
            types=metadata[0]
        )

        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        for conv in self.convs:
            conv.reset_parameters()

        for norm_dict in self.norm_dicts:
            for nt in self.node_types:
                norm_dict[nt].reset_parameters()

        self.out_lin.reset_parameters()

    def forward(
        self,
        x_dict: Dict[NodeType, Tensor],
        edge_index_dict: Dict[EdgeType, Tensor],
        batch_dict: Dict[NodeType, Tensor],
        batch_size: Optional[int] = None
    ) -> Dict[NodeType, Tensor]:
        xs_dict = {nt: [] for nt in self.node_types}

        for i in range(self.num_layers):
            x_dict = self.convs[i](x_dict, edge_index_dict)
            x_dict = {
                nt: self.norm_dicts[i][nt](
                    x, batch_dict[nt], 
                    batch_size=batch_size
                )
                for nt, x in x_dict.items()
            }
            for nt, x in x_dict.items():
                xs_dict[nt].append(x)

        x_dict = {
            nt: self.jk_dict[nt](xs)
            for nt, xs in xs_dict.items()
        }
        x_dict = self.out_lin(x_dict)

        return x_dict



class HLSQoREstimator(nn.Module):
    r"""Model for estimating HLS QoR using a heterogeneous graph neural network.

    Args:
        target_metric (str): The target metric to learn. Should be one of the metrics
            defined in the dataset ("area", "timing" or "power").
        in_channels (Union[int, Dict[NodeType, int]]): Input feature dimension or 
            a dictionary mapping node types to their input feature dimensions.
        hidden_channels (Union[int, List[int]]): Hidden feature dimension for the 
            GNN layers.
        num_layers (int): Number of GNN layers.
        metadata (Metadata): Metadata containing node and edge types.
        heads (Union[int, List[int]]): Number of attention heads for GNN (HGTConv) 
            layers. Default is 1.
        dropout (float, optional): Dropout rate for MLP layers. Default is 0.0.
    """
    def __init__(
        self,
        target_metric: str,
        in_channels: Union[int, Dict[NodeType, int]],
        hidden_channels: Union[int, List[int]],
        num_layers: int,
        metadata: Metadata,
        heads: Union[int, List[int]] = 1,
        dropout: float = 0.0
    ):
        super().__init__()

        self.node_types = metadata[0]
        self.edge_types = metadata[1]

        if isinstance(in_channels, int):
            in_channels = {nt: in_channels for nt in self.node_types}

        if isinstance(hidden_channels, int):
            hidden_channels = [hidden_channels] * num_layers

        if isinstance(heads, int):
            heads = [heads] * num_layers

        self.proj_lin_dict = HeteroDictLinear(
            in_channels,
            hidden_channels[0],
            types=self.node_types
        )
        self.proj_ln_dict = nn.ModuleDict({
            nt: LayerNorm(hidden_channels[0])
            for nt in self.node_types
        })

        self.gnn = HGTJK(
            in_channels=hidden_channels[0],
            hidden_channels=hidden_channels,
            num_layers=num_layers,
            out_channels=hidden_channels[-1],
            metadata=metadata,
            heads=heads
        )

        # Small MLP to process y_base
        self.y_base_mlp = nn.Sequential(
            Linear(TARGET_SIZE_PER_TYPE[target_metric], 16), 
            nn.PReLU(16),
            Linear(16, 16)
        )

        self.node_type_mlp = nn.ModuleDict({
            nt: nn.Sequential(
                Linear(hidden_channels[-1] * 3, hidden_channels[-1]),
                nn.LayerNorm(hidden_channels[-1]), nn.GELU(), nn.Dropout(dropout),
                Linear(hidden_channels[-1], 32)
            ) for nt in self.node_types
        })

        self.graph_mlp = nn.Sequential(
            Linear(len(self.node_types) * 32 + 16, 64), 
            nn.LayerNorm(64), nn.GELU(), nn.Dropout(dropout),
            Linear(64, TARGET_SIZE_PER_TYPE[target_metric])
        )
        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        self.proj_lin_dict.reset_parameters()
        for proj_ln in self.proj_ln_dict.values():
            proj_ln.reset_parameters()

        self.gnn.reset_parameters()

        for m in self.y_base_mlp.modules():
            if hasattr(m, 'reset_parameters'):
                m.reset_parameters()

        for nt in self.node_types:
            for m in self.node_type_mlp[nt].modules():
                if hasattr(m, 'reset_parameters'):
                    m.reset_parameters()

        for m in self.graph_mlp.modules():
            if hasattr(m, 'reset_parameters'):
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
            x_dict (Dict[NodeType, Tensor]): Input node feature dictionary.
                Each key is a node type and the value is a tensor of shape
                :obj:`(num_nodes, in_channels)`.
            edge_index_dict (Dict[EdgeType, Tensor]): Edge index dictionary.
                Each key is an edge type and the value is a tensor of shape
                :obj:`(2, num_edges)`.
            batch_dict (Dict[NodeType, Tensor]): Batch dictionary.
                Each key is a node type and the value is a tensor of shape
                :obj:`(num_nodes,)` containing the batch indices.
            y_base (Tensor): Base target tensor of shape :obj:`(num_samples, 1)`.

        :rtype: :obj:`torch.Tensor` - The output prediction tensor.
        """
        batch_size = self._compute_batch_size(batch_dict)

        x_dict = self.proj_lin_dict(x_dict)
        x_dict = {
            nt: self.proj_ln_dict[nt](
                x, batch_dict[nt],
                batch_size=batch_size
            ) 
            if x is not None else None
            for nt, x in x_dict.items()
        }

        x_dict = self.gnn(
            x_dict, edge_index_dict, batch_dict,
            batch_size=batch_size
        )
    
        x_pooled_list = []
        for nt, x in x_dict.items():
            batch = batch_dict[nt]
            x_pooled = torch.cat([
                global_add_pool(x, batch, size=batch_size),
                global_mean_pool(x, batch, size=batch_size),
                global_max_pool(x, batch, size=batch_size)
            ], dim=-1)
            x_pooled_list.append(self.node_type_mlp[nt](x_pooled))

        x_aggr = torch.cat(x_pooled_list, dim=1)

        y_base_processed = self.y_base_mlp(y_base)
        x_out = torch.cat([x_aggr, y_base_processed], dim=1)

        return self.graph_mlp(x_out)
    

    def _compute_batch_size(self, batch_dict: Dict[NodeType, Tensor]) -> int:
        batch_size = 0
        for batch in batch_dict.values():
            if batch.numel() > 0:
                batch_size = max(batch_size, int(batch.max().item()))
        return batch_size + 1