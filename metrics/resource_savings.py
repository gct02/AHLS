import torch
from metrics.data_stats import *

def get_resource_savings(data_stats: dict, transformed_data_stats: dict):
    """
    Get the reources (LUTs, DSPs, FFs) saved by the transformation.
    """

    model = torch.load("models/resource_usage_estimator.sav")
    modified_ops, removed_ops, added_ops = get_transformed_ops_stats(data_stats, transformed_data_stats)

    lut_savings = 0
    dsp_savings = 0
    ff_savings = 0

    for opid in modified_ops:
        original_op_stats = data_stats[opid]
        transformed_op_stats = transformed_data_stats[opid]
        original_op_stats = torch.tensor(original_op_stats[0:3]).unsqueeze(0)
        transformed_op_stats = torch.tensor(transformed_op_stats[0:3]).unsqueeze(0)

        original_luts, original_dsp, original_ff, _ = model(original_op_stats).item()
        transformed_luts, transformed_dsp, transformed_ff, _ = model(transformed_op_stats).item()

        original_num_occur = data_stats[opid][4]
        transformed_num_occur = transformed_data_stats[opid][4]
        
        # Differences are floored at zero because such approximations are unlikely to increase resource usage.
        # Furthermore, flooring at zero such difference guarantees that over-estimations provided by the model will
        # not jeopardize the total resource savings when the parent design has its actual resource usage available.
        lut_savings += max(0, original_num_occur * original_luts - transformed_num_occur * transformed_luts)
        dsp_savings += max(0, original_num_occur * original_dsp - transformed_num_occur * transformed_dsp)
        ff_savings += max(0, original_num_occur * original_ff - transformed_num_occur * transformed_ff)

    for opid in removed_ops:
        original_op_stats = data_stats[opid]
        original_op_stats = torch.tensor(original_op_stats[0:3]).unsqueeze(0)
        original_luts, original_dsp, original_ff, _  = model(original_op_stats).item()

        op_num_occur = data_stats[opid][4]

        lut_savings += op_num_occur * original_luts
        dsp_savings += op_num_occur * original_dsp
        ff_savings += op_num_occur * original_ff

    for opid in added_ops:
        transformed_op_stats = transformed_data_stats[opid]
        transformed_op_stats = torch.tensor(transformed_op_stats[0:3]).unsqueeze(0)
        transformed_luts, transformed_dsp, transformed_ff, _ = model(transformed_op_stats).item()

        op_num_occur = transformed_data_stats[opid][4]

        lut_savings -= op_num_occur * transformed_luts
        dsp_savings -= op_num_occur * transformed_dsp
        ff_savings -= op_num_occur * transformed_ff

    return lut_savings, dsp_savings, ff_savings
    