#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <dct_tcl> [<vitis_hls_settings> <vivado_settings>]"
    exit 1
fi

dct_tcl=$1

# Check if the directive config file exists
if [ ! -f "$dct_tcl" ]; then
    echo "File not found: $dct_tcl"
    exit 1
fi

if [ $# -gt 1 ]; then
    vitis_hls_settings=$2
    vivado_settings=$3
else
    vitis_hls_settings="/tools/Xilinx/Vitis_HLS/2023.2/settings64.sh"
    vivado_settings="/tools/Xilinx/Vivado/2023.2/settings64.sh"
fi

# Source the settings files
if [ -f "$vitis_hls_settings" ] && [ -f "$vivado_settings" ]; then
    source "$vitis_hls_settings"
    source "$vivado_settings"
else
    echo "Vitis HLS or Vivado settings file not found."
    exit 1
fi

vitis_hls -f "$dct_tcl"