#ifndef __JPEG_CONSTANTS_H__
#define __JPEG_CONSTANTS_H__

#define JPEG_MAX_SIZE 6496

// Size of JPEG file
#define JPEG_FILE_SIZE (128 * 128)

// Size of output buffer
#define BMP_OUT_SIZE (128 * 128)

#define NUM_COMPONENT 3
#define RGB_NUM 3

#define NUM_HUFF_TBLS 2

#define DCTSIZE 8 
#define DCTSIZE2 64

// Define the sample precision as 8
#define IDCT_SHIFT 128
#define IDCT_BOUNT 255
#define MARKER_MARKER 0xff

// Sampling factors
#define SF1_1_1  0
#define SF4_1_1  2

#define NUM_QUANT_TBLS 4

/* Only for the marker needed at the baseline */
/* JPEG marker codes */
#define    M_SOI   0xd8  /* Start of Image */
#define    M_SOF0  0xc0  /* Baseline DCT ( Huffman ) */
#define    M_SOS   0xda  /* Start of Scan ( Head of Compressed Data ) */
#define    M_DHT   0xc4  /* Huffman Table */
#define    M_DQT   0xdb  /* Quantization Table */
#define    M_EOI   0xd9  /* End of Image */

/* Cos constants */
#define c1d4 362L
#define c1d8 473L
#define c3d8 196L
#define c1d16 502L
#define c3d16 426L
#define c5d16 284L
#define c7d16 100L

#endif // __JPEG_CONSTANTS_H__