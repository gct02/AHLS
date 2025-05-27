import torch


def percentage_diff(pred, target):
    pred, target = map(torch.as_tensor, (pred, target))
    avg = (torch.abs(pred) + torch.abs(target)) / 2
    return torch.where(
        target == 0, 
        torch.abs(pred - target) / avg, 
        torch.abs(pred - target) / torch.abs(target)
    ) * 100