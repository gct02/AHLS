/*
+--------------------------------------------------------------------------+
| CHStone : a suite of benchmark programs for C-based High-Level Synthesis |
| ======================================================================== |
|                                                                          |
| * Collected and Modified : Y. Hara, H. Tomiyama, S. Honda,               |
|                            H. Takada and K. Ishii                        |
|                            Nagoya University, Japan                      |
|                                                                          |
| * Remark :                                                               |
|    1. This source code is modified to unify the formats of the benchmark |
|       programs in CHStone.                                               |
|    2. Test vectors are added for CHStone.                                |
|    3. If "main_result" is 0 at the end of the program, the program is    |
|       correctly executed.                                                |
|    4. Please follow the copyright of each benchmark program.             |
+--------------------------------------------------------------------------+
*/
#ifndef SHA_H
#define SHA_H

#include <stdint.h>

/* NIST Secure Hash Algorithm */
/* heavily modified from Peter C. Gutmann's implementation */

/* Useful defines & typedefs */
#define SHA_BUFFER_SIZE 64
#define DIGEST_SIZE 5
#define BLOCK_SIZE 8192
#define NUM_BLOCKS 2

uint32_t sha_info_count_lo, sha_info_count_hi;	/* 64-bit bit count */
uint32_t sha_info_data[16];

void sha_init (
    uint32_t sha_info_digest[DIGEST_SIZE]
);
void sha_update (
    uint32_t sha_info_digest[DIGEST_SIZE], 
    const uint8_t* buffer, int count
);
void sha_final (
    uint32_t sha_info_digest[DIGEST_SIZE]
);

/* top-level function */
void sha_stream (
    uint8_t indata[NUM_BLOCKS][BLOCK_SIZE], 
    int in_i[NUM_BLOCKS], 
    uint32_t sha_info_digest[DIGEST_SIZE]
);

#endif /* SHA_H */