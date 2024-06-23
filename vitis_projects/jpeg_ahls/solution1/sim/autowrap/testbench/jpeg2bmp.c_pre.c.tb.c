// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg2bmp.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 349 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg2bmp.c" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg2bmp.h" 1



# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/constants.h" 1
# 5 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg2bmp.h" 2

void jpeg2bmp(
    unsigned char inputVector[6496],
    int jpegSize,
    unsigned char outputVector[3][(128 * 128)]);
# 2 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg2bmp.c" 2

# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg_decode.h" 1





void jpeg_decode(
    unsigned char* readBuf,
    unsigned char outputVector[3][(128 * 128)],
    int OutData_image_width,
    int OutData_image_height,
    int OutData_comp_vpos[3],
    int OutData_comp_hpos[3]);
# 4 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg2bmp.c" 2

void jpeg2bmp(
    unsigned char inputVector[6496],
    int jpegSize,
    unsigned char outputVector[3][(128 * 128)])
{

    unsigned char JpegFileBuf[(128 * 128)];

    int outImageWidth, outImageHeight;
    int outCompVpos[3], outCompHpos[3];

    int main_result;

    for (int i = 0; i < jpegSize; i++) {
        JpegFileBuf[i] = inputVector[i];
    }
    jpeg_decode(JpegFileBuf, outputVector, outImageWidth, outImageHeight, outCompVpos, outCompHpos);
}
#ifndef HLS_FASTSIM
#ifdef __cplusplus
extern "C"
#endif
void apatb_jpeg2bmp_ir(unsigned char *, int, unsigned char (*)[16384]);
#ifdef __cplusplus
extern "C"
#endif
void jpeg2bmp_hw_stub(unsigned char *inputVector, int jpegSize, unsigned char (*outputVector)[16384]){
jpeg2bmp(inputVector, jpegSize, outputVector);
return ;
}
#ifdef __cplusplus
extern "C"
#endif
void refine_signal_handler();
#ifdef __cplusplus
extern "C"
#endif
void apatb_jpeg2bmp_sw(unsigned char *inputVector, int jpegSize, unsigned char (*outputVector)[16384]){
refine_signal_handler();
apatb_jpeg2bmp_ir(inputVector, jpegSize, outputVector);
return ;
}
#endif
# 22 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/jpeg/src/jpeg2bmp.c"

