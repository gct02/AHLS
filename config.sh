#!/bin/bash

# Source the Vitis HLS settings
source /tools/Xilinx/Vitis_HLS/2023.2/settings64.sh

# Set the HLS LLVM environment variables
export AHLS_LLVM_LIB=/home/gabriel/Documents/hls-llvm-project/hls-build/lib/LLVMAHLS.so
export HLS_LLVM_ROOT=/home/gabriel/Documents/hls-llvm-project/
export OPT=/home/gabriel/Documents/hls-llvm-project/hls-build/bin/opt
export LLI=/home/gabriel/Documents/hls-llvm-project/hls-build/bin/lli
export LLC=/home/gabriel/Documents/hls-llvm-project/hls-build/bin/llc
export LLVM_LINK=/home/gabriel/Documents/hls-llvm-project/hls-build/bin/llvm-link
export LLVM_DIS=/home/gabriel/Documents/hls-llvm-project/hls-build/bin/llvm-dis
export LLVM_AS=/home/gabriel/Documents/hls-llvm-project/hls-build/bin/llvm-as
export CLANG=/home/gabriel/Documents/hls-llvm-project/hls-build/bin/clang
export CLANGXX=/home/gabriel/Documents/hls-llvm-project/hls-build/bin/clang++

# Set PYTHONPATH to main code directory
export PYTHONPATH=.