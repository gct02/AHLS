// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin_host.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 349 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin_host.c" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin.h" 1



# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/softfloat.h" 1
# 53 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/softfloat.h"
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/milieu.h" 1
# 53 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/milieu.h"
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/SPARC-GCC.h" 1
# 61 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/SPARC-GCC.h"
typedef int flag;
typedef int int8;
typedef int int16;
typedef unsigned int uint32;
typedef signed int int32;







typedef unsigned short int bits16;
typedef unsigned int bits32;
typedef unsigned long long int bits64;
typedef signed long long int sbits64;
# 53 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/milieu.h" 2
# 54 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/softfloat.h" 2




typedef unsigned int float32;
typedef unsigned long long float64;
# 84 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/softfloat.h"
float64
int32_to_float64 (int32 a);

float64
float64_add (float64 a, float64 b);

float64
float64_mul (float64 a, float64 b);

float64
float64_div (float64 a, float64 b);

flag
float64_le (float64 a, float64 b);

flag
float64_ge (float64 a, float64 b);

float64
float64_neg (float64 x);
# 5 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin.h" 2


#ifndef HLS_FASTSIM
#ifdef __cplusplus
extern "C"
#endif
unsigned long long apatb_local_sin_sw(unsigned long long);
#endif
# 6 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin.h"
float64
local_sin (float64 rad);

double
ullong_to_double (unsigned long long x);
# 2 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin_host.c" 2

# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/iolib/populate_io.h" 1







void populateInput(float64 inputVector[36], const char* filename);
void populateOutput(float64 outputVector[36], const char* filename);
# 4 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin_host.c" 2


#ifndef HLS_FASTSIM
# 5 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin_host.c"
int main (int argc, char *argv[])
{
    float64 inputVector[36];
    float64 outputVector[36];

    populateInput(inputVector, argv[1]);

    for (int i = 0; i < 36; i++)
 {
        outputVector[i] = 
#ifndef HLS_FASTSIM
#define local_sin apatb_local_sin_sw
#endif
# 14 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin_host.c"
local_sin(inputVector[i]);
#undef local_sin
# 14 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin_host.c"

 }

    populateOutput(outputVector, argv[2]);

    return 0;
}
#endif
# 20 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin_host.c"

