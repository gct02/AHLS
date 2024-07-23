#!/bin/bash

# Source the Vitis HLS settings
source /tools/Xilinx/Vitis_HLS/2023.2/settings64.sh

# Set the HLS LLVM environment variables
export AHLS_LLVM_LIB="${HOME}/Documents/hls-llvm-project/hls-build/lib/LLVMAHLS.so"
export HLS_LLVM_ROOT="${HOME}Documents/hls-llvm-project/"
export OPT="${HOME}/Documents/hls-llvm-project/hls-build/bin/opt"
export LLI="${HOME}/Documents/hls-llvm-project/hls-build/bin/lli"
export LLC="${HOME}/Documents/hls-llvm-project/hls-build/bin/llc"
export LLVM_LINK="${HOME}/Documents/hls-llvm-project/hls-build/bin/llvm-link"
export LLVM_DIS="${HOME}/Documents/hls-llvm-project/hls-build/bin/llvm-dis"
export LLVM_AS="${HOME}/Documents/hls-llvm-project/hls-build/bin/llvm-as"
export CLANG="${HOME}/Documents/hls-llvm-project/hls-build/bin/clang"
export CLANGXX="${HOME}/Documents/hls-llvm-project/hls-build/bin/clang++"

# Set PYTHONPATH to main code directory
export PYTHONPATH=.