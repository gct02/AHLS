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
/* aes_function.c */
/*
 * Copyright (C) 2005
 * Akira Iwata & Masayuki Sato
 * Akira Iwata Laboratory,
 * Nagoya Institute of Technology in Japan.
 *
 * All rights reserved.
 *
 * This software is written by Masayuki Sato.
 * And if you want to contact us, send an email to Kimitake Wakayama
 * (wakayama@elcom.nitech.ac.jp)
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 * 
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * 3. All advertising materials mentioning features or use of this software must
 *    display the following acknowledgment:
 *    "This product includes software developed by Akira Iwata Laboratory,
 *    Nagoya Institute of Technology in Japan (http://mars.elcom.nitech.ac.jp/)."
 *
 * 4. Redistributions of any form whatsoever must retain the following
 *    acknowledgment:
 *    "This product includes software developed by Akira Iwata Laboratory,
 *     Nagoya Institute of Technology in Japan (http://mars.elcom.nitech.ac.jp/)."
 *
 *   THIS SOFTWARE IS PROVIDED "AS IS" WITHOUT EXPRESS OR IMPLIED WARRANTY.
 *   AKIRA IWATA LABORATORY DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS
 *   SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS,
 *   IN NO EVENT SHALL AKIRA IWATA LABORATORY BE LIABLE FOR ANY SPECIAL,
 *   INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING
 *   FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT,
 *   NEGLIGENCE OR OTHER TORTUOUS ACTION, ARISING OUT OF OR IN CONNECTION
 *   WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 */

#include <stdint.h> // For explicit integer types
#include "aes.h"

const int Sbox[16][16] = {
  {0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b,
   0xfe, 0xd7, 0xab, 0x76},
  {0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf,
   0x9c, 0xa4, 0x72, 0xc0},
  {0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1,
   0x71, 0xd8, 0x31, 0x15},
  {0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2,
   0xeb, 0x27, 0xb2, 0x75},
  {0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3,
   0x29, 0xe3, 0x2f, 0x84},
  {0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39,
   0x4a, 0x4c, 0x58, 0xcf},
  {0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f,
   0x50, 0x3c, 0x9f, 0xa8},
  {0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21,
   0x10, 0xff, 0xf3, 0xd2},
  {0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d,
   0x64, 0x5d, 0x19, 0x73},
  {0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14,
   0xde, 0x5e, 0x0b, 0xdb},
  {0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62,
   0x91, 0x95, 0xe4, 0x79},
  {0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea,
   0x65, 0x7a, 0xae, 0x08},
  {0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f,
   0x4b, 0xbd, 0x8b, 0x8a},
  {0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9,
   0x86, 0xc1, 0x1d, 0x9e},
  {0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9,
   0xce, 0x55, 0x28, 0xdf},
  {0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f,
   0xb0, 0x54, 0xbb, 0x16}
};
const int invSbox[16][16] = {
  {0x52, 0x09, 0x6a, 0xd5, 0x30, 0x36, 0xa5, 0x38, 0xbf, 0x40, 0xa3, 0x9e,
   0x81, 0xf3, 0xd7, 0xfb},
  {0x7c, 0xe3, 0x39, 0x82, 0x9b, 0x2f, 0xff, 0x87, 0x34, 0x8e, 0x43, 0x44,
   0xc4, 0xde, 0xe9, 0xcb},
  {0x54, 0x7b, 0x94, 0x32, 0xa6, 0xc2, 0x23, 0x3d, 0xee, 0x4c, 0x95, 0x0b,
   0x42, 0xfa, 0xc3, 0x4e},
  {0x08, 0x2e, 0xa1, 0x66, 0x28, 0xd9, 0x24, 0xb2, 0x76, 0x5b, 0xa2, 0x49,
   0x6d, 0x8b, 0xd1, 0x25},
  {0x72, 0xf8, 0xf6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xd4, 0xa4, 0x5c, 0xcc,
   0x5d, 0x65, 0xb6, 0x92},
  {0x6c, 0x70, 0x48, 0x50, 0xfd, 0xed, 0xb9, 0xda, 0x5e, 0x15, 0x46, 0x57,
   0xa7, 0x8d, 0x9d, 0x84},
  {0x90, 0xd8, 0xab, 0x00, 0x8c, 0xbc, 0xd3, 0x0a, 0xf7, 0xe4, 0x58, 0x05,
   0xb8, 0xb3, 0x45, 0x06},
  {0xd0, 0x2c, 0x1e, 0x8f, 0xca, 0x3f, 0x0f, 0x02, 0xc1, 0xaf, 0xbd, 0x03,
   0x01, 0x13, 0x8a, 0x6b},
  {0x3a, 0x91, 0x11, 0x41, 0x4f, 0x67, 0xdc, 0xea, 0x97, 0xf2, 0xcf, 0xce,
   0xf0, 0xb4, 0xe6, 0x73},
  {0x96, 0xac, 0x74, 0x22, 0xe7, 0xad, 0x35, 0x85, 0xe2, 0xf9, 0x37, 0xe8,
   0x1c, 0x75, 0xdf, 0x6e},
  {0x47, 0xf1, 0x1a, 0x71, 0x1d, 0x29, 0xc5, 0x89, 0x6f, 0xb7, 0x62, 0x0e,
   0xaa, 0x18, 0xbe, 0x1b},
  {0xfc, 0x56, 0x3e, 0x4b, 0xc6, 0xd2, 0x79, 0x20, 0x9a, 0xdb, 0xc0, 0xfe,
   0x78, 0xcd, 0x5a, 0xf4},
  {0x1f, 0xdd, 0xa8, 0x33, 0x88, 0x07, 0xc7, 0x31, 0xb1, 0x12, 0x10, 0x59,
   0x27, 0x80, 0xec, 0x5f},
  {0x60, 0x51, 0x7f, 0xa9, 0x19, 0xb5, 0x4a, 0x0d, 0x2d, 0xe5, 0x7a, 0x9f,
   0x93, 0xc9, 0x9c, 0xef},
  {0xa0, 0xe0, 0x3b, 0x4d, 0xae, 0x2a, 0xf5, 0xb0, 0xc8, 0xeb, 0xbb, 0x3c,
   0x83, 0x53, 0x99, 0x61},
  {0x17, 0x2b, 0x04, 0x7e, 0xba, 0x77, 0xd6, 0x26, 0xe1, 0x69, 0x14, 0x63,
   0x55, 0x21, 0x0c, 0x7d}
};

int substitute(int value, const int Sbox[16][16]) {
    return Sbox[value >> 4][value & 0xF];
}

void shift_and_substitute(int *statemt, int row_indices[], int row_size, const int Sbox[16][16]) {
    int temp = substitute(statemt[row_indices[row_size - 1]], Sbox);
    for (int i = row_size - 1; i > 0; i--) {
        statemt[row_indices[i]] = substitute(statemt[row_indices[i - 1]], Sbox);
    }
    statemt[row_indices[0]] = temp;
}

/* ********* ByteSub & ShiftRow ********* */
void ByteSub_ShiftRow(int statemt[32], int nb, const int Sbox[16][16]) {
    static int shift_indices[3][3][8] = {
        {{1, 5, 9, 13}, {2, 6, 10, 14}, {3, 7, 11, 15}}, // nb = 4
        {{1, 5, 9, 13, 17, 21}, {2, 6, 10, 14, 18, 22}, {3, 7, 11, 15, 19, 23}}, // nb = 6
        {{1, 5, 9, 13, 17, 21, 25, 29}, {2, 6, 10, 14, 18, 22, 26, 30}, {3, 7, 11, 15, 19, 23, 27, 31}} // nb = 8
    };

    int config = nb / 2 - 2;
    for (int i = 0; i < 3; i++) {
        shift_and_substitute(statemt, shift_indices[config][i], nb / 2, Sbox);
    }

    for (int i = 0; i < nb; i += 4) {
        statemt[i] = substitute(statemt[i], Sbox);
    }
}

int SubByte(int in) {
  return Sbox[(in / 16)][(in % 16)];
}

/* ********* InversShiftRow & ByteSub ********* */
void InversShiftRow_ByteSub(int statemt[32], int nb, const int invSbox[16][16]) {
    static int shift_indices[3][3][8] = {
        {{13, 9, 5, 1}, {14, 10, 6, 2}, {15, 11, 7, 3}}, // nb = 4
        {{21, 17, 13, 9, 5, 1}, {22, 18, 14, 10, 6, 2}, {23, 19, 15, 11, 7, 3}}, // nb = 6
        {{29, 25, 21, 17, 13, 9, 5, 1}, {30, 26, 22, 18, 14, 10, 6, 2}, {31, 27, 23, 19, 15, 11, 7, 3}} // nb = 8
    };

    int config = nb / 2 - 2;
    for (int i = 0; i < 3; i++) {
        shift_and_substitute(statemt, shift_indices[config][i], nb / 2, invSbox);
    }

    for (int i = 0; i < nb; i += 4) {
        statemt[i] = substitute(statemt[i], invSbox);
    }
}

/* ******** MixColumn ********** */
int MixColumn_AddRoundKey(int statemt[32], int nb, int n)
{
  int ret[8 * 4], j;
  register int x;

  for (j = 0; j < nb; ++j)
  {
    ret[j * 4] = (statemt[j * 4] << 1);
    if ((ret[j * 4] >> 8) == 1)
    ret[j * 4] ^= 283;
    x = statemt[1 + j * 4];
    x ^= (x << 1);
    if ((x >> 8) == 1)
    ret[j * 4] ^= (x ^ 283);
    else
    ret[j * 4] ^= x;
    ret[j * 4] ^=
    statemt[2 + j * 4] ^ statemt[3 + j * 4] ^ word[0][j + nb * n];

    ret[1 + j * 4] = (statemt[1 + j * 4] << 1);
    if ((ret[1 + j * 4] >> 8) == 1)
    ret[1 + j * 4] ^= 283;
    x = statemt[2 + j * 4];
    x ^= (x << 1);
    if ((x >> 8) == 1)
    ret[1 + j * 4] ^= (x ^ 283);
    else
    ret[1 + j * 4] ^= x;
    ret[1 + j * 4] ^=
    statemt[3 + j * 4] ^ statemt[j * 4] ^ word[1][j + nb * n];

    ret[2 + j * 4] = (statemt[2 + j * 4] << 1);
    if ((ret[2 + j * 4] >> 8) == 1)
    ret[2 + j * 4] ^= 283;
    x = statemt[3 + j * 4];
    x ^= (x << 1);
    if ((x >> 8) == 1)
    ret[2 + j * 4] ^= (x ^ 283);
    else
    ret[2 + j * 4] ^= x;
    ret[2 + j * 4] ^=
    statemt[j * 4] ^ statemt[1 + j * 4] ^ word[2][j + nb * n];

    ret[3 + j * 4] = (statemt[3 + j * 4] << 1);
    if ((ret[3 + j * 4] >> 8) == 1)
    ret[3 + j * 4] ^= 283;
    x = statemt[j * 4];
    x ^= (x << 1);
    if ((x >> 8) == 1)
    ret[3 + j * 4] ^= (x ^ 283);
    else
    ret[3 + j * 4] ^= x;
    ret[3 + j * 4] ^=
    statemt[1 + j * 4] ^ statemt[2 + j * 4] ^ word[3][j + nb * n];
  }
  for (j = 0; j < nb; ++j)
  {
    statemt[j * 4] = ret[j * 4];
    statemt[1 + j * 4] = ret[1 + j * 4];
    statemt[2 + j * 4] = ret[2 + j * 4];
    statemt[3 + j * 4] = ret[3 + j * 4];
  }
  return 0;
}

/* Perform Galois Field multiplication by 2 */
inline int gf_mul2(int value) {
    int result = value << 1;
    if (result & 0x100) {
        result ^= AES_POLY;
    }
    return result & 0xFF; // Ensure the result fits in one byte
}

/* Perform Galois Field multiplication by any scalar */
inline int gf_mul(int value, int scalar) {
    int result = 0;
    for (int i = 0; i < 8; ++i) {
        if (scalar & (1 << i)) {
            result ^= value;
        }
        value = gf_mul2(value); // Shift and multiply by 2
    }
    return result;
}

/* ******** MixColumn + AddRoundKey ********** */
int MixColumn_AddRoundKey(int statemt[32], int nb, int n) {
    int outputState[32]; // Temporary array to store the transformed state
    int j, temp;

    for (j = 0; j < nb; ++j) {
        outputState[j * 4] =
            gf_mul2(statemt[j * 4]) ^
            gf_mul(statemt[1 + j * 4], 3) ^
            statemt[2 + j * 4] ^
            statemt[3 + j * 4] ^
            word[0][j + nb * n];

        outputState[1 + j * 4] =
            gf_mul2(statemt[1 + j * 4]) ^
            gf_mul(statemt[2 + j * 4], 3) ^
            statemt[3 + j * 4] ^
            statemt[j * 4] ^
            word[1][j + nb * n];

        outputState[2 + j * 4] =
            gf_mul2(statemt[2 + j * 4]) ^
            gf_mul(statemt[3 + j * 4], 3) ^
            statemt[j * 4] ^
            statemt[1 + j * 4] ^
            word[2][j + nb * n];

        outputState[3 + j * 4] =
            gf_mul2(statemt[3 + j * 4]) ^
            gf_mul(statemt[j * 4], 3) ^
            statemt[1 + j * 4] ^
            statemt[2 + j * 4] ^
            word[3][j + nb * n];
    }

    // Copy results back to the state array
    for (j = 0; j < 4 * nb; ++j) {
        statemt[j] = outputState[j];
    }

    return 0;
}

/* ******** AddRoundKey + InverseMixColumn ********** */
int AddRoundKey_InversMixColumn(int statemt[32], int nb, int n) {
    int outputState[32]; // Temporary array to store the transformed state
    int i, j, temp;

    // Apply AddRoundKey
    for (j = 0; j < nb; ++j) {
        statemt[j * 4] ^= word[0][j + nb * n];
        statemt[1 + j * 4] ^= word[1][j + nb * n];
        statemt[2 + j * 4] ^= word[2][j + nb * n];
        statemt[3 + j * 4] ^= word[3][j + nb * n];
    }

    // Apply InverseMixColumn
    for (j = 0; j < nb; ++j) {
        for (i = 0; i < 4; ++i) {
            int current = statemt[i + j * 4];

            outputState[i + j * 4] =
                gf_mul(current, 14) ^
                gf_mul(statemt[(i + 1) % 4 + j * 4], 11) ^
                gf_mul(statemt[(i + 2) % 4 + j * 4], 13) ^
                gf_mul(statemt[(i + 3) % 4 + j * 4], 9);
        }
    }

    // Copy results back to the state array
    for (i = 0; i < 4 * nb; ++i) {
        statemt[i] = outputState[i];
    }

    return 0;
}
