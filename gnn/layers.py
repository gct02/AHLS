
import math
from typing import Dict, Optional, Tuple, Union

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch.nn import Parameter
from torch_geometric.nn import MessagePassing, Linear, LayerNorm
from torch_geometric.nn.dense import HeteroDictLinear, HeteroLinear
from torch_geometric.nn.inits import ones
from torch_geometric.nn.parameter_dict import ParameterDict
from torch_geometric.nn.pool import global_add_pool, global_max_pool
from torch_geometric.utils import softmax
from torch_geometric.utils.hetero import construct_bipartite_edge_index
from torch_geometric.typing import Metadata, NodeType, EdgeType


class HGTConv(MessagePassing):
    r"""The Heterogeneous Graph Transformer (HGT) operator from the 
    `"Heterogeneous Graph Transformer" <https://arxiv.org/abs/2003.01332>`_
    paper.

    Args:
        in_channels (int or Dict[str, int]): Size of each input sample of every
            node type, or :obj:`-1` to derive the size from the first input(s)
            to the forward method.
        out_channels (int): Size of each output sample.
        metadata (Tuple[List[str], List[Tuple[str, str, str]]]): The metadata
            of the heterogeneous graph, *i.e.* its node and edge types given
            by a list of strings and a list of string triplets, respectively.
            See :meth:`torch_geometric.data.HeteroData.metadata` for more
            information.
        heads (int, optional): Number of multi-head-attentions.
            (default: :obj:`1`)
        dropout (float, optional): Dropout probability for the attention
            coefficients. (default: :obj:`0.0`)
        **kwargs (optional): Additional arguments of
            :class:`torch_geometric.nn.conv.MessagePassing`.
    """
    def __init__(
        self,
        in_channels: Union[int, Dict[NodeType, int]],
        out_channels: int,
        metadata: Metadata,
        heads: int = 1,
        dropout: float = 0.0,
        **kwargs,
    ):
        super().__init__(aggr='add', node_dim=0, **kwargs)

        if out_channels % heads != 0:
            raise ValueError(
                f"'out_channels' (got {out_channels}) must be "
                f"divisible by the number of heads (got {heads})"
            )

        self.in_channels = in_channels
        self.out_channels = out_channels
        self.heads = heads
        self.dropout = dropout
        self.node_types = metadata[0]
        self.edge_types = metadata[1]

        self.num_edge_types = len(self.edge_types)
        self.edge_type_map = {et: i for i, et in enumerate(metadata[1])}

        self.kqv_lin = HeteroDictLinear(
            in_channels, out_channels * 3,
            types=self.node_types, weight_initializer='kaiming_uniform'
        )
        self.out_lin = HeteroDictLinear(
            out_channels, out_channels, 
            types=self.node_types, weight_initializer='kaiming_uniform',
        )

        self.head_dim = out_channels // heads
        num_relation_types = heads * len(self.edge_types)

        self.k_rel = HeteroLinear(
            self.head_dim, self.head_dim, num_relation_types, 
            is_sorted=True, weight_initializer='kaiming_uniform'
        )
        self.v_rel = HeteroLinear(
            self.head_dim, self.head_dim, num_relation_types, 
            is_sorted=True, weight_initializer='kaiming_uniform'
        )

        self.skip = ParameterDict({
            nt: Parameter(torch.empty(1))
            for nt in self.node_types
        })

        self.p_rel = ParameterDict()
        for et in self.edge_types:
            et = '__'.join(et)
            self.p_rel[et] = Parameter(torch.empty(1, heads))

        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        super().reset_parameters()
        self.kqv_lin.reset_parameters()
        self.out_lin.reset_parameters()
        self.k_rel.reset_parameters()
        self.v_rel.reset_parameters()
        ones(self.skip)
        ones(self.p_rel)

    def forward(
        self,
        x_dict: Dict[NodeType, Tensor],
        edge_index_dict: Dict[EdgeType, Tensor]
    ) -> Dict[NodeType, Optional[Tensor]]:
        r"""Runs the forward pass of the module.

        Args:
            x_dict (Dict[str, torch.Tensor]): A dictionary holding input node
                features  for each individual node type.
            edge_index_dict (Dict[Tuple[str, str, str], torch.Tensor]): A
                dictionary holding graph connectivity information for each
                individual edge type.

        :rtype: :obj:`Dict[str, Optional[torch.Tensor]]` - The output node
            embeddings for each node type.
        """
        H, D = self.heads, self.head_dim

        # Compute K, Q, V over node types
        kqv_dict = self.kqv_lin(x_dict)
        k_dict, q_dict, v_dict = {}, {}, {}
        for nt, kqv in kqv_dict.items():
            k, q, v = torch.tensor_split(kqv, 3, dim=1)
            k_dict[nt] = k.view(-1, H, D)
            q_dict[nt] = q.view(-1, H, D)
            v_dict[nt] = v.view(-1, H, D)

        # Prepare for homogeneous message passing
        q, k, v, src_offset, dst_offset = self._prepare_inputs(
            k_dict, v_dict, q_dict, edge_index_dict
        )
        edge_index, edge_attr = construct_bipartite_edge_index(
            edge_index_dict, src_offset, dst_offset, 
            edge_attr_dict=self.p_rel, num_nodes=k.size(0)
        )

        # Message passing and aggregation
        aggr = self.propagate(edge_index, k=k, q=q, v=v, edge_attr=edge_attr)

        aggr_dict = {}
        for nt, start_offset in dst_offset.items():
            end_offset = start_offset + q_dict[nt].size(0)
            aggr_dict[nt] = aggr[start_offset:end_offset]
            
        # Output node embeddings transformation
        out_dict = self.out_lin(aggr_dict)

        # Skip connection
        out_dict_final = {}
        for nt, out in out_dict.items():
            out = F.gelu(out)
            if out.size(-1) == x_dict[nt].size(-1):
                alpha = self.skip[nt].sigmoid()
                out_dict_final[nt] = alpha * out + (1 - alpha) * x_dict[nt]
            else:
                out_dict_final[nt] = out

        return out_dict_final

    def message(
        self, k_j: Tensor, q_i: Tensor, v_j: Tensor, 
        edge_attr: Tensor, index: Tensor, 
        ptr: Optional[Tensor], size_i: Optional[int]
    ) -> Tensor:
        alpha = (q_i * k_j).sum(dim=-1) * edge_attr
        alpha = alpha / math.sqrt(q_i.size(-1))
        alpha = softmax(alpha, index, ptr, size_i)
        alpha = F.dropout(alpha, p=self.dropout, training=self.training)
        out = v_j * alpha.view(-1, self.heads, 1)
        return out.view(-1, self.out_channels)

    def _prepare_inputs(
        self, 
        k_dict: Dict[NodeType, Tensor], 
        q_dict: Dict[NodeType, Tensor],
        v_dict: Dict[NodeType, Tensor],
        edge_index_dict: Dict[EdgeType, Tensor]
    ) -> Tuple[Tensor, Tensor, Dict[EdgeType, int]]:
        """
        Concatenate all dictionaries of node features into single tensors
        for homogeneous message passing.
        """
        H, D = self.heads, self.head_dim

        # Flatten into a single tensor with shape [self.num_edge_types * H, D]:
        ks, vs = [], []
        type_indices = []
        src_offset = {}
        cumsum = 0
        for et in edge_index_dict.keys():
            src = et[0]
            N = k_dict[src].size(0)
            src_offset[et] = cumsum
            cumsum += N

            # Construct type_vec for current edge_type with shape [H, D]
            type_vec = torch.arange(H, dtype=torch.long).view(-1, 1) * self.num_edge_types
            type_vec = type_vec + self.edge_type_map[et]
            type_indices.append(type_vec.view(-1, 1).repeat(1, N))

            ks.append(k_dict[src])
            vs.append(v_dict[src])

        ks = torch.cat(ks, dim=0).transpose(0, 1).reshape(-1, D)
        vs = torch.cat(vs, dim=0).transpose(0, 1).reshape(-1, D)
        type_indices = torch.cat(type_indices, dim=1).flatten()

        k = self.k_rel(ks, type_indices).view(H, -1, D).transpose(0, 1)
        v = self.v_rel(vs, type_indices).view(H, -1, D).transpose(0, 1)

        qs = []
        dst_offset = {}
        cumsum = 0
        for nt, q in q_dict.items():
            qs.append(q)
            dst_offset[nt] = cumsum
            cumsum += q.size(0)

        q = torch.cat(qs, dim=0)
        return q, k, v, src_offset, dst_offset


class HetSAGPooling(nn.Module):
    r"""A type-wise attention-based pooling mechanism for heterogeneous graphs.
    It computes attention scores for each node type using a learnable
    mechanism and performs a weighted sum of node features based on these
    scores to obtain a graph-level representation for each node type.
    These representations are then concatenated.

    Args:
        in_channels (Union[Dict[str, int], int],): Number of input channels
            for each node type.
        metadata (Tuple[List[str], List[Tuple[str, str, str]]]):
            Metadata object containing node and edge types.
        dropout (float, optional): Dropout rate for the GNN.
            (default: :obj:`0.0`)
        **kwargs (optional): Additional arguments of :class:`HGTConv`.
    """
    def __init__(
        self,
        in_channels: Union[Dict[NodeType, int], int],
        metadata: Metadata,
        dropout: float = 0.0,
        **kwargs
    ):
        super().__init__()

        self.node_types = metadata[0]

        if not isinstance(in_channels, dict):
            self.in_channels = {nt: in_channels for nt in metadata[0]}
        else:
            self.in_channels = in_channels

        self.norm = nn.ModuleDict({
            nt: LayerNorm(d) for nt, d in self.in_channels.items()
        })
        self.gnn = HGTConv(self.in_channels, 1, metadata, dropout=dropout, **kwargs)

        self.mlp = nn.ModuleDict({
            nt: Linear(2*d, d, weight_initializer="kaiming_uniform")
            for nt, d in self.in_channels.items()
        })
        
        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        self.gnn.reset_parameters()
        for nt in self.node_types:
            self.mlp[nt].reset_parameters()
            self.norm[nt].reset_parameters()

    def forward(
        self,
        x_dict: Dict[NodeType, Tensor],
        edge_index_dict: Dict[EdgeType, Tensor],
        batch_dict: Dict[NodeType, Tensor]
    ) -> Tensor:
        r"""Runs the forward pass of the module.

        Args:
            x_dict (Dict[NodeType, Tensor]): Dictionary of node features 
                for each node type.
            edge_index_dict (Dict[EdgeType, Tensor]): Dictionary of edge 
                indices for each edge type.
            batch_dict (Dict[NodeType, Tensor]): Dictionary of batch indices 
                for each node type.

        :rtype: :obj:`torch.Tensor` - The pooled embeddings for the entire graph.
        """
        x_dict = {nt: self.norm[nt](x) for nt, x in x_dict.items()}
        score_dict = self.gnn(x_dict, edge_index_dict)

        batch_size = self._get_batch_size(batch_dict)
        outs = []
        for nt in self.node_types:
            batch = batch_dict[nt]
            score = softmax(score_dict[nt], batch)
            x = x_dict[nt] * score.view(-1, 1)
            x_add = global_add_pool(x, batch, size=batch_size)
            x_max = global_max_pool(x, batch, size=batch_size)
            x = torch.cat([x_add, x_max], dim=1)
            x = self.mlp[nt](x)
            outs.append(x)

        return torch.cat(outs, dim=1)
    
    def _get_batch_size(self, batch_dict: Dict[NodeType, Tensor]) -> int:
        """Returns the batch size of the input data."""
        batch_size = 0
        for nt in self.node_types:
            batch_size = max(batch_size, batch_dict[nt].max().item())
        return batch_size + 1