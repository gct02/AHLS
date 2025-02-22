from typing import Callable, Optional, Union, List, Dict
from torch_geometric.typing import Metadata, EdgeType, NodeType, OptTensor

import torch
import torch.nn as nn
from torch import Tensor
from torch.nn import MultiheadAttention
from torch_geometric.nn import GraphConv, LayerNorm, HGTConv
from torch_geometric.nn.pool.topk_pool import SelectTopK
from torch_geometric.nn.inits import reset


class MAB(nn.Module):
    r"""
    The Graph Multi-head Attention block from the 
    `"Accurate Learning of Graph Representations with Graph Multiset Pooling" 
    <https://arxiv.org/pdf/2102.11533>`_ paper.
    """
    def __init__(
        self,
        kdim: int,
        vdim: int,
        num_heads: int = 1,
        dropout: float = 0.0,
        GNN: nn.Module = GraphConv
    ):
        super(MAB, self).__init__()

        assert vdim % num_heads == 0, 'vdim must be divisible by num_heads'

        self.vdim = vdim
        self.num_heads = num_heads

        self.q_proj = nn.Linear(kdim, vdim)
        self.k_proj = GNN(kdim, vdim)
        self.v_proj = GNN(vdim, vdim)

        self.attn = MultiheadAttention(vdim, num_heads, dropout=dropout)

    def reset_parameters(self):
        nn.init.xavier_normal_(self.q_proj.weight)
        nn.init.zeros_(self.q_proj.bias)
        self.k_proj.reset_parameters()
        self.v_proj.reset_parameters()

    def forward(
        self, 
        Q: Tensor,
        X: Tensor,
        edge_index: Tensor
    ) -> Tensor:
        Q = self.q_proj(Q)
        K = self.k_proj(X, edge_index)
        V = self.v_proj(X, edge_index)
        O, _ = self.attn(Q, K, V)
        return O


class PMA(nn.Module):
    r"""
    The Graph Multi-set Pooling block from the 
    `"Accurate Learning of Graph Representations with Graph Multiset Pooling"
    <https://arxiv.org/pdf/2102.11533>`_ paper.
    """
    def __init__(
        self, 
        dim: int,
        num_seeds: int,
        num_heads: int = 1,
        layer_norm: bool = True,
        dropout: float = 0.0,
        GNN: nn.Module = GraphConv
    ):
        super(PMA, self).__init__()

        self.S = nn.Parameter(torch.empty(num_seeds, dim))

        self.mab = MAB(dim, dim, num_heads, dropout, GNN)
        self.rff = nn.Linear(dim, dim)
        self.ln = LayerNorm(dim) if layer_norm else None

    def reset_parameters(self):
        torch.nn.init.xavier_uniform_(self.S)
        self.mab.reset_parameters()
        nn.init.xavier_normal_(self.rff.weight)
        nn.init.zeros_(self.rff.bias)
        if self.ln is not None:
            self.ln.reset_parameters()
        
    def forward(self, X: Tensor, edge_index: Tensor) -> Tensor:
        Z = self.S + self.mab(self.S, X, edge_index)
        if self.ln is not None:
            Z = self.ln(Z)
        return Z + self.rff(Z)


class HetSAGPooling(torch.nn.Module):
    r"""A heterogeneous graph aggregator that uses the self-attention pooling operator 
    from the `"Self-Attention Graph Pooling" <https://arxiv.org/abs/1904.08082>`_ and `"Understanding
    Attention and Generalization in Graph Neural Networks" <https://arxiv.org/abs/1905.02850>`_ papers 
    to pool nodes based on their scores in a path-wise manner.

    If :obj:`min_score` :math:`\tilde{\alpha}` is :obj:`None`, computes:

        .. math::
            \mathbf{y} &= \textrm{GNN}(\mathbf{X}, \mathbf{A})

            \mathbf{i} &= \mathrm{top}_k(\mathbf{y})

            \mathbf{X}^{\prime} &= (\mathbf{X} \odot
            \mathrm{tanh}(\mathbf{y}))_{\mathbf{i}}

            \mathbf{A}^{\prime} &= \mathbf{A}_{\mathbf{i},\mathbf{i}}

    If :obj:`min_score` :math:`\tilde{\alpha}` is a value in :obj:`[0, 1]`,
    computes:

        .. math::
            \mathbf{y} &= \mathrm{softmax}(\textrm{GNN}(\mathbf{X},\mathbf{A}))

            \mathbf{i} &= \mathbf{y}_i > \tilde{\alpha}

            \mathbf{X}^{\prime} &= (\mathbf{X} \odot \mathbf{y})_{\mathbf{i}}

            \mathbf{A}^{\prime} &= \mathbf{A}_{\mathbf{i},\mathbf{i}}.

    Projections scores are learned based on a graph neural network layer.

    Args:
        metadata (Tuple[List[str], List[Tuple[str, str, str]]]):
            Metadata object containing node and edge types.
        in_channels (int): 
            Size of each input sample.
        aggr_paths (List[List[EdgeType]], optional):
            List of edge type combinations to aggregate over.
            (default: :obj:`None`)
        ratio (float or int): 
            Graph pooling ratio, which is used to compute
            :math:`k = \lceil \mathrm{ratio} \cdot N \rceil`, or the value
            of :math:`k` itself, depending on whether the type of :obj:`ratio`
            is :obj:`float` or :obj:`int`.
            This value is ignored if :obj:`min_score` is not :obj:`None`.
            (default: :obj:`0.5`)
        min_score (float, optional): 
            Minimal node score :math:`\tilde{\alpha}`
            which is used to compute indices of pooled nodes
            :math:`\mathbf{i} = \mathbf{y}_i > \tilde{\alpha}`.
            When this value is not :obj:`None`, the :obj:`ratio` argument is
            ignored. 
            (default: :obj:`None`)
        multiplier (float, optional): 
            Coefficient by which features gets
            multiplied after pooling. This can be useful for large graphs and
            when :obj:`min_score` is used. 
            (default: :obj:`1`)
        nonlinearity (str or callable, optional): 
            The non-linearity to use.
            (default: :obj:`"tanh"`)
        **kwargs (optional): 
            Additional parameters for initializing the GNN layer.
    """
    def __init__(
        self,
        metadata: Metadata,
        in_channels: int,
        aggr_paths: Optional[List[List[EdgeType]]] = None,
        ratio: Union[float, int] = 0.5,
        min_score: Optional[float] = None,
        multiplier: float = 1.0,
        nonlinearity: Union[str, Callable] = 'tanh',
        **kwargs,
    ):
        super(HetSAGPooling, self).__init__()

        node_types, edge_types = metadata
        
        if aggr_paths:
            path_metadata = [(node_types, path) for path in aggr_paths]
        else:
            aggr_paths = [edge_types]
            path_metadata = [metadata]

        self.aggr_paths = aggr_paths
        self.num_aggr_paths = len(aggr_paths)
        self.in_channels = in_channels
        self.multiplier = multiplier

        self.gnn = nn.ModuleList([
            HGTConv(in_channels, 1, path_metadata[i], **kwargs)
            for i in range(self.num_aggr_paths)
        ])
        self.select = SelectTopK(1, ratio, min_score, nonlinearity)
        self.fc = nn.Linear(self.num_aggr_paths, 1)

        self.reset_parameters()

    def reset_parameters(self):
        r"""Resets all learnable parameters of the module."""
        self.gnn.apply(reset)
        self.select.apply(reset)
        self.fc.apply(self._init_fc_weights)

    def _init_fc_weights(self, m):
        if isinstance(m, nn.Linear):
            nn.init.xavier_normal_(m.weight)
            nn.init.zeros_(m.bias)
        else:
            reset(m)

    def forward(
        self,
        x: Dict[NodeType, OptTensor],
        edge_index: Dict[EdgeType, OptTensor]
    ) -> Tensor:
        r"""Forward pass.

        Args:
            x (torch.Tensor): The node feature matrix.
            edge_index (torch.Tensor): The edge indices.
        """
        attn = []

        for i, path in enumerate(self.aggr_paths):
            path_edges = {k: edge_index[k] for k in path if k in edge_index}
            path_attn = self.gnn[i](x, path_edges)
            path_attn = torch.cat([path_attn[k] for k in path_attn.keys()])
            attn.append(path_attn.flatten())

        attn = self.fc(torch.stack(attn, dim=1))
        sel = self.select(attn)
        perm = sel.node_index
        score = sel.weight

        x_out = torch.cat([x[k] for k in x.keys()], dim=0)
        x_out = x_out[perm] * score.view(-1, 1) * self.multiplier

        return x_out
