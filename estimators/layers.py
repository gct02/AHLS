import math
from typing import Dict, Optional, Tuple, Union

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch.nn import Parameter
from torch_geometric.nn import MessagePassing, LayerNorm
from torch_geometric.nn.dense import HeteroDictLinear, HeteroLinear
from torch_geometric.nn.inits import ones
from torch_geometric.nn.parameter_dict import ParameterDict
from torch_geometric.nn.pool.connect import FilterEdges
from torch_geometric.nn.pool.select import SelectTopK
from torch_geometric.utils import softmax
from torch_geometric.utils.hetero import construct_bipartite_edge_index
from torch_geometric.typing import Metadata, NodeType, EdgeType


class HGTConv(MessagePassing):
    r"""A slightly modified version of the Heterogeneous Graph Transformer (HGT) 
    operator from the `"Heterogeneous Graph Transformer" <https://arxiv.org/abs/2003.01332>`_
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
        norm (bool, optional): If set to :obj:`True`, applies layer normalization
            after convolution. (default: :obj:`True`)
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
        norm: bool = True,
        dropout: float = 0.0,
        **kwargs,
    ):
        super().__init__(aggr='add', node_dim=0, **kwargs)

        if out_channels % heads != 0:
            raise ValueError(
                f"'out_channels' (got {out_channels}) must be "
                f"divisible by the number of heads (got {heads})"
            )
        if not isinstance(in_channels, dict):
            in_channels = {node_type: in_channels for node_type in metadata[0]}

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
            types=self.node_types,
            weight_initializer='kaiming_uniform',
            bias_initializer='zeros'
        )
        self.out_lin = HeteroDictLinear(
            out_channels, out_channels, 
            types=self.node_types,
            weight_initializer='kaiming_uniform',
            bias_initializer='zeros'
        )

        self.dim = out_channels // heads
        num_types = heads * len(self.edge_types)

        self.k_rel = HeteroLinear(
            self.dim, self.dim, num_types, 
            is_sorted=True, bias=True,
            weight_initializer='kaiming_uniform',
            bias_initializer='zeros'
        )
        self.v_rel = HeteroLinear(
            self.dim, self.dim, num_types, 
            is_sorted=True, bias=True,
            weight_initializer='kaiming_uniform',
            bias_initializer='zeros'
        )

        if norm:
            self.norm = nn.ModuleDict({
                nt: LayerNorm(out_channels)
                for nt in self.node_types
            })
        else:
            self.norm = None

        self.skip = ParameterDict({
            node_type: Parameter(torch.empty(1))
            for node_type in self.node_types
        })

        self.p_rel = ParameterDict()
        for et in self.edge_types:
            et = '__'.join(et)
            self.p_rel[et] = Parameter(torch.empty(1, heads))

        self.reset_parameters()

    def reset_parameters(self):
        super().reset_parameters()
        self.kqv_lin.reset_parameters()
        self.out_lin.reset_parameters()
        self.k_rel.reset_parameters()
        self.v_rel.reset_parameters()
        if self.norm is not None:
            for nt in self.node_types:
                self.norm[nt].reset_parameters()
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
        H = self.heads
        D = self.out_channels // H

        k_dict, q_dict, v_dict, out_dict = {}, {}, {}, {}

        # Compute K, Q, V over node types
        kqv_dict = self.kqv_lin(x_dict)
        for nt, kqv in kqv_dict.items():
            k, q, v = torch.tensor_split(kqv, 3, dim=1)
            k_dict[nt] = k.view(-1, H, D)
            q_dict[nt] = q.view(-1, H, D)
            v_dict[nt] = v.view(-1, H, D)

        q, dst_offset = self._cat_feats(q_dict)
        k, v, src_offset = self._construct_src_node_repr(k_dict, v_dict, edge_index_dict)

        edge_index, edge_attr = construct_bipartite_edge_index(
            edge_index_dict, src_offset, dst_offset, 
            edge_attr_dict=self.p_rel, num_nodes=k.size(0)
        )

        out = self.propagate(edge_index, k=k, q=q, v=v, edge_attr=edge_attr)

        # Reconstruct output node embeddings dict
        for nt, start_offset in dst_offset.items():
            end_offset = start_offset + q_dict[nt].size(0)
            out_dict[nt] = out[start_offset:end_offset]

        # Transform output node embeddings
        a_dict = self.out_lin(out_dict)

        # Skip connection
        for nt, out in out_dict.items():
            out = a_dict[nt]
            if out.size(-1) == x_dict[nt].size(-1):
                alpha = self.skip[nt].sigmoid()
                out = alpha * out + (1 - alpha) * x_dict[nt]
            out_dict[nt] = out

        if self.norm is not None:
            out_dict = {nt: self.norm[nt](out) for nt, out in out_dict.items()}

        out_dict = {
            nt: F.gelu(F.dropout(out, p=self.dropout, training=self.training))
            for nt, out in out_dict.items()
        }

        return out_dict

    def message(
        self, 
        k_j: Tensor, q_i: Tensor, v_j: Tensor, 
        edge_attr: Tensor, index: Tensor, 
        ptr: Optional[Tensor], size_i: Optional[int]
    ) -> Tensor:
        alpha = (q_i * k_j).sum(dim=-1) * edge_attr
        alpha = alpha / math.sqrt(q_i.size(-1))
        alpha = softmax(alpha, index, ptr, size_i)
        out = v_j * alpha.view(-1, self.heads, 1)
        return out.view(-1, self.out_channels)
    
    def _cat_feats(
        self, 
        x_dict: Dict[NodeType, Tensor]
    ) -> Tuple[Tensor, Dict[NodeType, int]]:
        """Concatenates a dictionary of node features."""
        outs = []
        offset = {}
        cumsum = 0
        for nt, x in x_dict.items():
            outs.append(x)
            offset[nt] = cumsum
            cumsum += x.size(0)
        return torch.cat(outs, dim=0), offset

    def _construct_src_node_repr(
        self, 
        k_dict: Dict[NodeType, Tensor], 
        v_dict: Dict[NodeType, Tensor],
        edge_index_dict: Dict[EdgeType, Tensor]
    ) -> Tuple[Tensor, Tensor, Dict[EdgeType, int]]:
        """Constructs the source node representations."""
        H, D = self.heads, self.dim

        # Flatten into a single tensor with shape [self.num_edge_types * H, D]:
        ks, vs = [], []
        type_list = []
        offset = {}
        cumsum = 0
        for et in edge_index_dict.keys():
            src = et[0]
            N = k_dict[src].size(0)
            offset[et] = cumsum
            cumsum += N

            # Construct type_vec for current edge_type with shape [H, D]
            type_list.append(
                torch.arange(H, dtype=torch.long).view(-1, 1).repeat(1, N) 
                * self.num_edge_types + self.edge_type_map[et]
            )
            ks.append(k_dict[src])
            vs.append(v_dict[src])

        ks = torch.cat(ks, dim=0).transpose(0, 1).reshape(-1, D)
        vs = torch.cat(vs, dim=0).transpose(0, 1).reshape(-1, D)
        type_vec = torch.cat(type_list, dim=1).flatten()

        k = self.k_rel(ks, type_vec).view(H, -1, D).transpose(0, 1)
        v = self.v_rel(vs, type_vec).view(H, -1, D).transpose(0, 1)

        return k, v, offset

    def __repr__(self) -> str:
        return (f'{self.__class__.__name__}(-1, {self.out_channels}, '
                f'heads={self.heads})')


class HetSAGPooling(nn.Module):
    r"""A heterogeneous version of the self-attention pooling operator from the 
    `"Self-Attention Graph Pooling" <https://arxiv.org/abs/1904.08082>`_ and 
    `"Understanding Attention and Generalization in Graph Neural Networks"
    <https://arxiv.org/abs/1905.02850>`_ papers.

    Args:
        in_channels (int): Size of each input sample.
        pool_size (int): The number of nodes to keep after pooling.
        **kwargs (optional): Additional parameters for initializing the GNN.
    """
    def __init__(
        self,
        in_channels: int,
        pool_size: int,
        metadata: Metadata,
        **kwargs
    ):
        super().__init__()

        self.in_channels = in_channels
        self.pool_size = pool_size

        self.gnn = HGTConv(in_channels, 1, metadata, **kwargs)
        self.select = SelectTopK(1, pool_size)
        self.connect = FilterEdges()

        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        self.gnn.reset_parameters()
        self.select.reset_parameters()

    def forward(
        self,
        x_dict: Dict[NodeType, Tensor],
        edge_index_dict: Dict[EdgeType, Tensor],
        batch_dict: Dict[NodeType, Tensor]
    ) -> Tensor:
        r"""Runs the forward pass of the module.

        Args:
            x_dict (Dict[NodeType, Tensor]): Dictionary of node features for each node type.
            edge_index_dict (Dict[EdgeType, Tensor]): Dictionary of edge indices for each edge type.
            batch_dict (Dict[NodeType, Tensor]): Dictionary of batch indices for each node type.
            y_base (Tensor): The target values of the base solutions.

        :rtype: :obj:`torch.Tensor` - The pooled nodes.
        """
        attn_dict = self.gnn(x_dict, edge_index_dict)

        x = torch.cat(list(x_dict.values()), dim=0)
        attn = torch.cat(list(attn_dict.values()), dim=0)
        batch = torch.cat(list(batch_dict.values()), dim=0)

        sel = self.select(attn, batch)
        perm = sel.node_index
        score = sel.weight

        x = x[perm] * score.view(-1, 1)

        return x
