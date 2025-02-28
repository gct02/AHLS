from typing import Optional

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch import Tensor
from torch.nn.modules.loss import _Loss


class BaseAwareMSELoss(_Loss):
    r"""Computes the mean squared error between each element in the input :math:`x` and target :math:`y`
    and adds a penalty term based on the base tensor :math:`b` error.

    Args:
        size_average (bool, optional): Deprecated (see :attr:`reduction`). By default,
            the losses are averaged over each loss element in the batch. Note that for
            some losses, there are multiple elements per sample. If the field :attr:`size_average`
            is set to ``False``, the losses are instead summed for each minibatch. Ignored
            when :attr:`reduce` is ``False``. Default: ``True``
        reduce (bool, optional): Deprecated (see :attr:`reduction`). By default, the
            losses are averaged or summed over observations for each minibatch depending
            on :attr:`size_average`. When :attr:`reduce` is ``False``, returns a loss per
            batch element instead and ignores :attr:`size_average`. Default: ``True``
        reduction (str, optional): Specifies the reduction to apply to the output:
            ``'none'`` | ``'mean'`` | ``'sum'``. ``'none'``: no reduction will be applied,
            ``'mean'``: the sum of the output will be divided by the number of
            elements in the output, ``'sum'``: the output will be summed. Note: :attr:`size_average`
            and :attr:`reduce` are in the process of being deprecated, and in the meantime,
            specifying either of those two args will override :attr:`reduction`. Default: ``'mean'``

    Shape:
        - Input: :math:`(*)`, where :math:`*` means any number of dimensions.
        - Target: :math:`(*)`, same shape as the input.

    Examples::

        >>> loss = nn.BaseAwareMSELoss()
        >>> input = torch.randn(3, 5, requires_grad=True)
        >>> target = torch.randn(3, 5)
        >>> base = torch.randn(3, 5)
        >>> output = loss(input, target, base)
        >>> output.backward()
    """
    __constants__ = ['reduction']

    def __init__(
        self,
        size_average=None,
        reduce=None,
        reduction: str = 'mean',
        base_penalty: float = 0.0,
        residual_std: float = 1.0
    ):
        super().__init__(size_average, reduce, reduction)
        self.base_penalty = base_penalty
        self.aux_loss = nn.HuberLoss(reduction, residual_std)

    def forward(
        self, 
        input: Tensor, 
        target: Tensor, 
        base_pred: Optional[Tensor] = None
    ) -> Tensor:
        loss = self.aux_loss(input, target)
        if base_pred is not None:
            loss += self.base_penalty * base_pred.abs().mean()
        return loss