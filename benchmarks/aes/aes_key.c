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
/* aes_key.c */
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

// Global variables for expanded keys (to be used elsewhere)
int word[4][MAX_WORDS]; // Each word is 4 bytes

// Function prototypes
inline int SubByte(int byte);
inline int RotByte(int word[4], int result[4]);
inline int Rcon(int index);

// KeySchedule function
int KeySchedule(int type, int key[32]) {
    int nk, nb, numRounds;
    int temp[4];

    // Configure nk, nb, and numRounds based on type
    switch (type) {
        case AES128:
            nk = 4;
            nb = AES_BLOCK_SIZE;
            numRounds = 10;
            break;
        case AES192:
            nk = 6;
            nb = AES_BLOCK_SIZE;
            numRounds = 12;
            break;
        case AES256:
            nk = 8;
            nb = AES_BLOCK_SIZE;
            numRounds = 14;
            break;
        default:
            return -1; // Invalid AES type
    }

    // Initialize the first nk words with the key
    for (int j = 0; j < nk; ++j) {
        for (int i = 0; i < 4; ++i) {
            word[i][j] = key[i + j * 4];
        }
    }

    // Generate the remaining words for the expanded key
    for (int j = nk; j < nb * (numRounds + 1); ++j) {
        if (j % nk == 0) {
            // Apply RotByte, SubByte, and Rcon for the first word in each group
            RotByte(&word[0][j - 1], temp);
            for (int i = 0; i < 4; ++i) {
                temp[i] = SubByte(temp[i]);
            }
            temp[0] ^= Rcon(j / nk - 1);
        } else if (nk > 6 && j % nk == 4) {
            // Apply SubByte to the word in the middle of each group (for AES-256)
            for (int i = 0; i < 4; ++i) {
                temp[i] = SubByte(word[i][j - 1]);
            }
        } else {
            // Copy the previous word directly
            for (int i = 0; i < 4; ++i) {
                temp[i] = word[i][j - 1];
            }
        }

        // XOR the current word with the word nk positions back
        for (int i = 0; i < 4; ++i) {
            word[i][j] = word[i][j - nk] ^ temp[i];
        }
    }

    return 0; // Success
}

// Helper Functions

/* Apply the SubByte transformation (S-Box substitution) */
inline int SubByte(int byte) {
    // Replace with the actual AES S-Box lookup table
    static const int sbox[256] = {
        /* S-Box values go here */
    };
    return sbox[byte];
}

/* Rotate a word (4 bytes) for the RotByte operation */
inline int RotByte(int input[4], int result[4]) {
    result[0] = input[1];
    result[1] = input[2];
    result[2] = input[3];
    result[3] = input[0];
    return 0; // Success
}

/* Get the Rcon value for the given index */
inline int Rcon(int index) {
    static const int rcon[] = {
        0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1B, 0x36
    };
    return rcon[index];
}