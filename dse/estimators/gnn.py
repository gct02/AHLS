from typing import Dict, Union, Optional, List
from torch.types import Device
from torch_geometric.typing import NodeType, EdgeType, OptTensor, Metadata

import math
import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch_geometric.nn import SAGPooling, HGTConv, GATConv, Linear, LayerNorm
from torch_geometric.data import HeteroData
from torch_geometric.nn.inits import reset

class HGT(nn.Module):
    r"""Module that uses the Heterogeneous Graph Transformer (HGT) operator from the
    `"Heterogeneous Graph Transformer" <https://arxiv.org/abs/2003.01332>`_ paper to
    perform graph-level regression.

    Args:
        metadata (Tuple[List[str], List[Tuple[str, str, str]]]):
            Metadata object containing node and edge types.
        in_channels (int or Dict[str, int]):
            Number of input channels for each node type.
        out_channels (int):
            Number of output channels.
        hid_dim (int or List[int]):
            Hidden dimension for each convolutional layer.
        n_layers (int):
            Number of convolutional layers.
            (default: :obj:`6`)
        heads (int or List[int]):
            Number of attention heads for each convolutional layer.
            (default: :obj:`1`)
        fc_dropout (float):
            Dropout rate for fully connected layers.
            (default: :obj:`0.1`)
        conv_dropout (float):
            Dropout rate for convolutional layers.
            (default: :obj:`0.0`)
        pool_size (int):
            Number of nodes to keep after pooling.
            (default: :obj:`16`)
        agg_paths (List[List[EdgeType]], optional):
            List of edge type combinations to aggregate over.
            (default: :obj:`None`)
        use_norm (bool):
            Whether to use normalization layers.
            (default: :obj:`True`)
        device (torch.device):
            Device to use for computation.
            (default: :obj:`"cpu"`)
    """
    def __init__(
        self, 
        metadata: Metadata,
        in_channels: Union[int, Dict[str, int]],
        out_channels: int,
        hid_dim: Union[int, List[int]],
        num_layers: int = 6,
        heads: Union[int, List[int]] = 1,
        fc_dropout: float = 0.1,
        conv_dropout: float = 0.0,
        pool_size: int = 16,
        agg_paths: Optional[List[List[EdgeType]]] = None,
        use_norm: bool = True,
        device: Optional[Device] = 'cpu'
    ):
        super().__init__()

        assert num_layers >= 2, "Number of conv layers must be at least 2."

        hid_dim = [hid_dim] * num_layers if isinstance(hid_dim, int) else hid_dim
        heads = [heads] * num_layers if isinstance(heads, int) else heads
        agg_paths = agg_paths if agg_paths else [[metadata[1]]]

        self.device = device
        self.node_types = metadata[0]
        self.edge_types = metadata[1]
        self.hid_dim = hid_dim
        self.num_layers = num_layers
        self.heads = heads
        self.use_norm = use_norm
        self.agg_paths = agg_paths
        self.num_agg_paths = len(self.agg_paths)

        if isinstance(in_channels, int):
            in_channels = {nt: in_channels for nt in self.node_types}

        # Define convolutional layers
        self.conv = nn.ModuleList(
            [HGTConv(in_channels, hid_dim[0], metadata, heads[0])]
        )
        self.conv.extend(
            [HGTConv(hid_dim[i], hid_dim[i+1], metadata, heads[i+1])
             for i in range(num_layers-1)]
        )

        # Define normalization layers (optional)
        if self.use_norm:
            self.norm = nn.ModuleDict({
                nt: nn.ModuleList(
                    [LayerNorm(hid_dim[i]) for i in range(num_layers-1)]
                )
                for nt in self.node_types
            })

        # Define dropouts
        self.conv_dropout = nn.Dropout(conv_dropout)

        # Define pooling and readout layers
        agg_dim = -(hid_dim[-1] // -self.num_agg_paths) # ceil division
        self.pool = nn.ModuleList(
            [SAGPooling(hid_dim[-1], ratio=pool_size, GNN=GATConv)
             for _ in range(self.num_agg_paths)]
        )
        self.readout = nn.ModuleList([
            nn.Sequential(
                Linear(hid_dim[-1] * pool_size, hid_dim[-1]),
                nn.GELU(), 
                nn.Dropout(fc_dropout),
                Linear(hid_dim[-1], agg_dim)
            )
            for _ in range(self.num_agg_paths)
        ])

        # Define fully connected layers
        fc1_dim = max(hid_dim[-1] // 2, out_channels)
        fc2_dim = max(fc1_dim // 2, out_channels)
        
        self.mlp = nn.Sequential(
            Linear(agg_dim * self.num_agg_paths, hid_dim[-1]),
            nn.GELU(), 
            nn.Dropout(fc_dropout),
            Linear(hid_dim[-1], fc1_dim),
            nn.GELU(), 
            nn.Dropout(fc_dropout),
            Linear(fc1_dim, fc2_dim),
            nn.GELU(),
            nn.Dropout(fc_dropout),
            Linear(fc2_dim, out_channels)
        )

        self.reset_parameters()
        self.to(self.device)

    def reset_parameters(self):
        r"""Reinitializes the model parameters."""
        self.conv.apply(self._init_weights)
        self.pool.apply(self._init_weights)
        self.readout.apply(self._init_weights)
        self.mlp.apply(self._init_weights)
        if self.use_norm:
            self.norm.apply(self._init_weights)

    def _init_weights(self, m):
        if isinstance(m, Linear):
            nn.init.kaiming_normal_(m.weight, mode='fan_in', nonlinearity='leaky_relu')
            if m.bias is not None:
                nn.init.zeros_(m.bias)
        elif isinstance(m, LayerNorm):
            nn.init.constant_(m.weight, math.sqrt(2 / m.in_channels))
            nn.init.normal_(m.bias, mean=0, std=0.01)
        elif isinstance(m, HGTConv) or isinstance(m, SAGPooling):
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

        # Initial convolutional layer
        x = self.conv[0](x, edge_index)

        if self.use_norm:
            x = {k: self.norm[k][0](v) for k, v in x.items()}

        x = {k: F.gelu(v) for k, v in x.items()}
        x = {k: self.conv_dropout(v) for k, v in x.items()}

        # Intermediate convolutional layers
        for i in range(1, self.num_layers-1):
            x = self.conv[i](x, edge_index)

            if self.use_norm:
                x = {k: self.norm[k][i](v) for k, v in x.items()}

            x = {k: F.gelu(v) for k, v in x.items()}
            x = {k: self.conv_dropout(v) for k, v in x.items()}

        # Final convolutional layer
        x = self.conv[-1](x, edge_index)
        x = {k: F.gelu(v) for k, v in x.items()}

        # Edge-wise aggregation
        x_agg = self._aggregate(x, edge_index)

        # Fully connected layers
        x_agg = self.mlp(x_agg)

        # Avoid NaNs (edge case handling)
        x_agg = x_agg.nan_to_num_()

        return x_agg
    
    def _aggregate(
        self,
        x: Dict[NodeType, OptTensor],
        edge_index: Dict[EdgeType, OptTensor]
    ) -> Tensor:
        # Create a new HeteroData object with the transformed data
        transformed_data = self._get_transformed_data(x, edge_index)

        # Aggregate nodes based on edge types
        x_agg = []
        for i in range(self.num_agg_paths):
            subg = transformed_data.edge_type_subgraph(self.agg_paths[i])
            subg_hom = subg.to_homogeneous()
            x_pool = self.pool[i](subg_hom.x, subg_hom.edge_index)[0]
            x_agg.append(self.readout[i](x_pool.flatten()))

        # Concatenate all readout vectors
        x_agg = torch.cat(x_agg, dim=-1)
        return x_agg
    
    def _get_transformed_data(
        self,
        x: Dict[NodeType, OptTensor],
        edge_index: Dict[EdgeType, OptTensor]
    ) -> HeteroData:
        transformed_data = HeteroData()
        for k, v in x.items():
            transformed_data[k].x = v
        for k, v in edge_index.items():
            transformed_data[k].edge_index = v
        return transformed_data
