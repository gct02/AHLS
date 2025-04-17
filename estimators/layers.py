import math
from typing import Dict, Optional, Tuple, Union

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch.nn import Parameter
from torch_geometric.nn import MessagePassing
from torch_geometric.nn.dense import HeteroDictLinear, HeteroLinear
from torch_geometric.nn.inits import ones
from torch_geometric.nn.parameter_dict import ParameterDict
from torch_geometric.nn.pool import global_max_pool
from torch_geometric.nn.pool.select import SelectTopK
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
            in_channels = {nt: in_channels for nt in metadata[0]}

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
        H = self.heads
        D = self.out_channels // H

        # Compute K, Q, V over node types
        kqv_dict = self.kqv_lin(x_dict)
        k_dict, q_dict, v_dict = {}, {}, {}
        for nt, kqv in kqv_dict.items():
            k, q, v = torch.tensor_split(kqv, 3, dim=1)
            k_dict[nt] = k.view(-1, H, D)
            q_dict[nt] = q.view(-1, H, D)
            v_dict[nt] = v.view(-1, H, D)

        # Preprocessing
        q, k, v, src_offset, dst_offset = self._cat_features(
            k_dict, v_dict, q_dict, edge_index_dict
        )
        edge_index, edge_attr = construct_bipartite_edge_index(
            edge_index_dict, src_offset, dst_offset, 
            edge_attr_dict=self.p_rel, num_nodes=k.size(0)
        )

        # Message passing and aggregation
        a = self.propagate(edge_index, k=k, q=q, v=v, edge_attr=edge_attr)

        # Heterogeneous node embeddings reconstruction
        a_dict = {}
        for nt, start_offset in dst_offset.items():
            end_offset = start_offset + q_dict[nt].size(0)
            a_dict[nt] = a[start_offset:end_offset]

        # Output node embeddings transformation
        a_dict = self.out_lin(a_dict)

        # Dropout and skip connection
        out_dict = {}
        for nt, a in a_dict.items():
            out = F.dropout(a, p=self.dropout, training=self.training)
            if a.size(-1) == x_dict[nt].size(-1):
                alpha = self.skip[nt].sigmoid()
                out = alpha * out + (1 - alpha) * x_dict[nt]
            out_dict[nt] = F.gelu(out)

        return out_dict

    def message(
        self, k_j: Tensor, q_i: Tensor, v_j: Tensor, 
        edge_attr: Tensor, index: Tensor, 
        ptr: Optional[Tensor], size_i: Optional[int]
    ) -> Tensor:
        alpha = (q_i * k_j).sum(dim=-1) * edge_attr
        alpha = alpha / math.sqrt(q_i.size(-1))
        alpha = softmax(alpha, index, ptr, size_i)
        out = v_j * alpha.view(-1, self.heads, 1)
        return out.view(-1, self.out_channels)

    def _cat_features(
        self, 
        k_dict: Dict[NodeType, Tensor], 
        q_dict: Dict[NodeType, Tensor],
        v_dict: Dict[NodeType, Tensor],
        edge_index_dict: Dict[EdgeType, Tensor]
    ) -> Tuple[Tensor, Tensor, Dict[EdgeType, int]]:
        """Concatenate all dictionaries of node features into single tensors
        before message passing and aggregation."""
        H, D = self.heads, self.dim

        # Flatten into a single tensor with shape [self.num_edge_types * H, D]:
        ks, vs, types = [], [], []
        src_offset = {}
        cumsum = 0
        for et in edge_index_dict.keys():
            src = et[0]
            N = k_dict[src].size(0)
            src_offset[et] = cumsum
            cumsum += N

            # Construct type_vec for current edge_type with shape [H, D]
            types.append(
                torch.arange(H, dtype=torch.long).view(-1, 1).repeat(1, N) 
                * self.num_edge_types + self.edge_type_map[et]
            )
            ks.append(k_dict[src])
            vs.append(v_dict[src])

        ks = torch.cat(ks, dim=0).transpose(0, 1).reshape(-1, D)
        vs = torch.cat(vs, dim=0).transpose(0, 1).reshape(-1, D)
        types = torch.cat(types, dim=1).flatten()

        k = self.k_rel(ks, types).view(H, -1, D).transpose(0, 1)
        v = self.v_rel(vs, types).view(H, -1, D).transpose(0, 1)

        qs = []
        dst_offset = {}
        cumsum = 0
        for nt, q in q_dict.items():
            qs.append(q)
            dst_offset[nt] = cumsum
            cumsum += q.size(0)

        q = torch.cat(qs, dim=0)

        return q, k, v, src_offset, dst_offset

    def __repr__(self) -> str:
        return (f'{self.__class__.__name__}(-1, {self.out_channels}, '
                f'heads={self.heads})')


class CDFGPooling(nn.Module):
    r"""A type-wise pooling layer for heterogeneous graphs. It uses the
    Heterogeneous Graph Transformer (HGT) operator to compute attention
    scores for each node type and then selects the top-k nodes based on
    these scores. The selected nodes are averaged if the number of nodes
    is not fixed, or concatenated otherwise.

    Args:
        in_channels (Union[Dict[str, int], int],): Number of input channels
            for each node type.
        ratio (Union[Union[int, float], Dict[str, Union[int, float]]): Graph 
            pooling ratio for each node type, which is used to compute
            :math:`k = \lceil \mathrm{ratio_{nt}} \cdot N \rceil`, or the value
            of :math:`k` itself, depending on whether the type of :obj:`ratio[nt]`
            is :obj:`float` or :obj:`int`.
        metadata (Tuple[List[str], List[Tuple[str, str, str]]]):
            Metadata object containing node and edge types.
        **kwargs (optional): Additional arguments of :class:`HGTConv`.
    """
    def __init__(
        self,
        in_channels: Union[Dict[NodeType, int], int],
        ratio: Union[Union[int, float], Dict[NodeType, Union[int, float]]],
        metadata: Metadata,
        **kwargs
    ):
        super().__init__()

        self.node_types = metadata[0]

        if not isinstance(in_channels, dict):
            in_channels = {nt: in_channels for nt in self.node_types}
        if not isinstance(ratio, dict):
            ratio = {nt: ratio for nt in self.node_types}

        self.in_channels = in_channels
        self.ratio = ratio

        self.conv = HGTConv(in_channels, 1, metadata, **kwargs)
        self.select = nn.ModuleDict({
            nt: SelectTopK(1, ratio[nt])
            for nt in self.node_types
        })

        self.reset_parameters()

    def reset_parameters(self):
        """Reinitializes model parameters."""
        self.conv.reset_parameters()
        for nt in self.node_types:
            self.select[nt].reset_parameters()

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

        :rtype: :obj:`torch.Tensor` - The pooled nodes.
        """
        attn_dict = self.conv(x_dict, edge_index_dict)

        # Assumption: all graphs have at least one region node
        batch_size = max(batch_dict["region"]).max().item() + 1

        outs = []
        for nt in self.node_types:
            sel = self.select[nt](attn_dict[nt], batch_dict[nt])
            perm = sel.node_index
            score = sel.weight

            x = x_dict[nt][perm] * score.view(-1, 1)
            if isinstance(self.ratio[nt], float):
                # In this case, the number of selected nodes is not fixed,
                # se we take the element-wise maximum across the nodes
                batch = batch_dict[nt][perm]
                x = global_max_pool(x, batch)

            x = x.view(batch_size, -1, self.in_channels[nt])
            outs.append(x)

        outs = torch.cat(outs, dim=1)
        return outs.view(batch_size, -1)