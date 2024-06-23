// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/adpcm_host.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 349 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/adpcm_host.c" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/adpcm.h" 1






#ifndef HLS_FASTSIM
#ifdef __cplusplus
extern "C"
#endif
void apatb_adpcm_main_sw(const int *, int *, int *);
#endif
# 6 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/adpcm.h"
void
adpcm_main (const int input_samples[8000], int compressed[8000/2], int result[8000]);
# 2 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/adpcm_host.c" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/iolib/populate_io.h" 1



void populateInput (int *inputVector, int numElts, const char *fileName);
void populateOutput (int *outputVector, int numElts, const char *fileName);
# 3 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/adpcm_host.c" 2

int test_data[8000];
int compressed[8000/2];
int result[8000];


#ifndef HLS_FASTSIM
# 8 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/adpcm_host.c"
int main(int argc, char **argv)
{
  populateInput(test_data, 8000, argv[1]);
  
#ifndef HLS_FASTSIM
#define adpcm_main apatb_adpcm_main_sw
#endif
# 11 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/adpcm_host.c"
adpcm_main (test_data, compressed, result);
#undef adpcm_main
# 11 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/adpcm_host.c"

  populateOutput(result, 8000/2, argv[2]);

  return 0;
}
#endif
# 15 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/adpcm/src/adpcm_host.c"

