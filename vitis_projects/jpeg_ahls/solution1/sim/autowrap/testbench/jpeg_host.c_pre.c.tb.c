// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg_host.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 349 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg_host.c" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/iolib/populate_io.h" 1



# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/iolib/../constants.h" 1
# 5 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/iolib/populate_io.h" 2

void populateInput(unsigned char* inputVector, int* jpegSize, const char* filename);
void populateOutput(unsigned char outputVector[3][(128 * 128)], const char* filename);
# 2 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg_host.c" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg2bmp.h" 1






#ifndef HLS_FASTSIM
#ifdef __cplusplus
extern "C"
#endif
void apatb_jpeg2bmp_sw(unsigned char *, int, unsigned char (*)[16384]);
#endif
# 6 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg2bmp.h"
void jpeg2bmp(
    unsigned char inputVector[6496],
    int jpegSize,
    unsigned char outputVector[3][(128 * 128)]);
# 3 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg_host.c" 2


#ifndef HLS_FASTSIM
# 4 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg_host.c"
int main(int argc, char** argv)
{
    int jpegSize = 0;
    unsigned char inputVector[6496];
    unsigned char outputVector[3][(128 * 128)];
    int main_result;



    populateInput(inputVector, &jpegSize, argv[1]);


    
#ifndef HLS_FASTSIM
#define jpeg2bmp apatb_jpeg2bmp_sw
#endif
# 16 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg_host.c"
jpeg2bmp(inputVector, jpegSize, outputVector);
#undef jpeg2bmp
# 16 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg_host.c"




    populateOutput(outputVector, argv[2]);

    return 0;
}
#endif
# 23 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg_host.c"

