from typing import Optional, Dict

import torch
import torch.nn as nn
from torch import Tensor
from torch_geometric.nn import HGTConv
from torch_geometric.utils import softmax, scatter
from torch_geometric.typing import Metadata, NodeType, EdgeType


class HetSAGPooling(torch.nn.Module):
    r"""Heterogeneous graph pooling inspired in the self-attention pooling 
    operator from the `"Self-Attention Graph Pooling" <https://arxiv.org/abs/1904.08082>`_ 
    and `"Understanding Attention and Generalization in Graph Neural Networks"
    <https://arxiv.org/abs/1905.02850>`_ papers.

    Args:
        in_channels (int): Size of each input sample.
        metadata (Tuple[List[str], List[Tuple[str, str, str]]]):
            Metadata object containing node and edge types.
    """
    def __init__(self, in_channels: int, metadata: Metadata):
        super().__init__()

        self.gnn = HGTConv(in_channels, 1, metadata)

        self.w = {nt: nn.Parameter(torch.empty(1, in_channels)) for nt in metadata[0]}
        self.b = {nt: nn.Parameter(torch.empty(1)) for nt in metadata[0]}

        self.reset_parameters()

    def reset_parameters(self):
        r"""Resets all learnable parameters of the module."""
        self.gnn.reset_parameters()
        for w in self.w.values():
            nn.init.kaiming_normal_(w)
        for b in self.b.values():
            torch.nn.init.zeros_(b)

    def forward(
        self,
        x: Dict[NodeType, Tensor],
        edge_index: Dict[EdgeType, Tensor],
        batch: Optional[Dict[NodeType, Tensor]] = None,
    ) -> Dict[NodeType, Tensor]:
        r"""Forward pass.

        Args:
            x (Dict[NodeType, Tensor]): The node feature matrix.
            edge_index (Dict[EdgeType, Tensor]): The edge indices.
            batch (Dict[NodeType, Tensor], optional): The batch vector
                :math:`\mathbf{b} \in {\{ 0, \ldots, B-1\}}^N`, which assigns
                each node to a specific example. (default: :obj:`None`)

        :rtype: Dict[NodeType, Tensor] - The pooled node embeddings.
        """
        if batch is None:
            batch = {k: edge_index[k].new_zeros(x[k].size(0)) for k in x.keys()}

        attn = self.gnn(x, edge_index)

        for k in attn.keys():
            self.w[k] = self.w[k].to(x[k].device)
            self.b[k] = self.b[k].to(x[k].device)
            attn[k] = softmax((attn[k] * self.w[k] + self.b[k]).sum(dim=-1), batch[k])
        
        # Multiply attention scores with node features and sum them up.
        x = {k: x[k] * attn[k].view(-1, 1) for k in x.keys()}
        for nt in x.keys():
            x[nt] = scatter(x[nt], batch[nt], dim=0, reduce='sum')
        
        return x

