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
/*************************************************************************/
/*                                                                       */
/*   SNU-RT Benchmark Suite for Worst Case Timing Analysis               */
/*   =====================================================               */
/*                              Collected and Modified by S.-S. Lim      */
/*                                            sslim@archi.snu.ac.kr      */
/*                                         Real-Time Research Group      */
/*                                        Seoul National University      */
/*                                                                       */
/*                                                                       */
/*        < Features > - restrictions for our experimental environment   */
/*                                                                       */
/*          1. Completely structured.                                    */
/*               - There are no unconditional jumps.                     */
/*               - There are no exit from loop bodies.                   */
/*                 (There are no 'break' or 'return' in loop bodies)     */
/*          2. No 'switch' statements.                                   */
/*          3. No 'do..while' statements.                                */
/*          4. Expressions are restricted.                               */
/*               - There are no multiple expressions joined by 'or',     */
/*                'and' operations.                                      */
/*          5. No library calls.                                         */
/*               - All the functions needed are implemented in the       */
/*                 source file.                                          */
/*                                                                       */
/*                                                                       */
/*************************************************************************/
/*                                                                       */
/*  FILE: adpcm.c                                                        */
/*  SOURCE : C Algorithms for Real-Time DSP by P. M. Embree              */
/*                                                                       */
/*  DESCRIPTION :                                                        */
/*                                                                       */
/*     CCITT G.722 ADPCM (Adaptive Differential Pulse Code Modulation)   */
/*     algorithm.                                                        */
/*     16khz sample rate data is stored in the array test_data[SIZE].    */
/*     Results are stored in the array compressed[SIZE] and result[SIZE].*/
/*     Execution time is determined by the constant SIZE (default value  */
/*     is 2000).                                                         */
/*                                                                       */
/*  REMARK :                                                             */
/*                                                                       */
/*  EXECUTION TIME :                                                     */
/*                                                                       */
/*                                                                       */
/*************************************************************************/

#include "adpcm.h"

/* G722 C code */

/* variables for transimit quadrature mirror filter here */
int tqmf[24];

/* QMF filter coefficients:
scaled by a factor of 4 compared to G722 CCITT recomendation */
const int h[24] = {
    12, -44, -44, 212, 48, -624, 128, 1448,
    -840, -3220, 3804, 15504, 15504, 3804, -3220, -840,
    1448, 128, -624, 48, 212, -44, -44, 12
};

/* variables for receive quadrature mirror filter here */
int accumc[11], accumd[11];

const int qq4_code4_table[16] = {
    0, -20456, -12896, -8968, -6288, -4240, -2584, -1200,
    20456, 12896, 8968, 6288, 4240, 2584, 1200, 0
};

const int qq6_code6_table[64] = {
    -136, -136, -136, -136, -24808, -21904, -19008, -16704,
    -14984, -13512, -12280, -11192, -10232, -9360, -8576, -7856,
    -7192, -6576, -6000, -5456, -4944, -4464, -4008, -3576,
    -3168, -2776, -2400, -2032, -1688, -1360, -1040, -728,
    24808, 21904, 19008, 16704, 14984, 13512, 12280, 11192,
    10232, 9360, 8576, 7856, 7192, 6576, 6000, 5456,
    4944, 4464, 4008, 3576, 3168, 2776, 2400, 2032,
    1688, 1360, 1040, 728, 432, 136, -432, -136
};

const int wl_code_table[16] = {
    -60, 3042, 1198, 538, 334, 172, 58, -30,
    3042, 1198, 538, 334, 172, 58, -30, -60
};

const int ilb_table[32] = {
    2048, 2093, 2139, 2186, 2233, 2282, 2332, 2383,
    2435, 2489, 2543, 2599, 2656, 2714, 2774, 2834,
    2896, 2960, 3025, 3091, 3158, 3228, 3298, 3371,
    3444, 3520, 3597, 3676, 3756, 3838, 3922, 4008
};

/* decision levels - pre-multiplied by 8, 0 to indicate end */
const int decis_levl[30] = {
    280, 576, 880, 1200, 1520, 1864, 2208, 2584,
    2960, 3376, 3784, 4240, 4696, 5200, 5712, 6288,
    6864, 7520, 8184, 8968, 9752, 10712, 11664, 12896,
    14120, 15840, 17560, 20456, 23352, 32767
};

int detl;

/* quantization table 31 long to make quantl look-up easier,
last entry is for mil=30 case when wd is max */
const int quant26bt_pos[31] = {
    61, 60, 59, 58, 57, 56, 55, 54,
    53, 52, 51, 50, 49, 48, 47, 46,
    45, 44, 43, 42, 41, 40, 39, 38,
    37, 36, 35, 34, 33, 32, 32
};

/* quantization table 31 long to make quantl look-up easier,
last entry is for mil=30 case when wd is max */
const int quant26bt_neg[31] = {
    63, 62, 31, 30, 29, 28, 27, 26,
    25, 24, 23, 22, 21, 20, 19, 18,
    17, 16, 15, 14, 13, 12, 11, 10,
    9, 8, 7, 6, 5, 4, 4
};

const int qq2_code2_table[4] = { -7408, -1616, 7408, 1616 };
const int wh_code_table[4] = { 798, -214, 798, -214 };

/* variables used in filtez */
int dec_del_bph[6];
int dec_del_dhx[6];

/* variables used in filtep */
int dec_rh1, dec_rh2;
int dec_ah1, dec_ah2;
int dec_ph, dec_sph;

/* variables used in decode */
int dec_szh, dec_sh;
int dec_ph1, dec_ph2;
int dec_plt, dec_plt1, dec_plt2;
int dec_szl, dec_spl, dec_sl;
int dec_rlt1, dec_rlt2, dec_rlt;
int dec_al1, dec_al2;
int dl, dec_nbl, dec_dh, dec_nbh;
int ilr, rl;
int dec_deth, dec_detl, dec_dlt;
int dec_del_bpl[6];
int dec_del_dltx[6];
int xl, xh;
int xs, xd;

/* outputs of decode */
int xout1, xout2;

/* variables used in encode */
int delay_bpl[6];
int delay_dltx[6];
int nbl; /* delay line */
int al1, al2;
int plt, plt1, plt2;
int dlt;
int rlt, rlt1, rlt2;
int dh, ih;
int nbh, szh;
int sph, ph, yh, rh;
int delay_dhx[6];
int delay_bph[6];
int ah1, ah2;
int ph1, ph2;
int rh1, rh2;
int deth;
int sh;	/* this comes from adaptive predictor */
int eh;
int il, szl, spl, sl, el;

/* function prototypes */
int abs(int n);
int encode(int xin1, int xin2) ;
void decode(int input);
int filtez(int *bpl, int *dlt);
void upzero(int dlt, int *dlti, int *bli);
int filtep(int rlt1, int al1, int rlt2, int al2);
int quantl(int el, int detl);
int logscl(int il, int nbl);
int scalel(int nbl, int shift_constant);
int uppol2(int al1, int al2, int plt, int plt1, int plt2);
int uppol1(int al1, int apl2, int plt, int plt1);
int logsch(int ih, int nbh);
void reset();

/* top-level function */
void adpcm_main(
    const int in_data[SIZE], 
    int encoded[SIZE/2], 
    int decoded[SIZE]
) {
    int i;

    reset(); /* reset, initialize required memory */

    adpcm_main_label12: 
    for (i = 0; i < SIZE/2; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=50 max=50 avg=50
        encoded[i] = encode (in_data[2*i], in_data[2*i + 1]);
    }

    adpcm_main_label13:
    for (i = 0; i < SIZE/2; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=50 max=50 avg=50
        decode (encoded[i]);
        decoded[2*i] = xout1;
        decoded[2*i + 1] = xout2;
    }
}

int abs(int n) {
    int m;
    if (n >= 0)
        m = n;
    else
        m = -n;
    return m;
}

int encode(int xin1, int xin2) {
    int i;
    const int *h_ptr;
    int *tqmf_ptr, *tqmf_ptr1;
    long int xa, xb;
    int decis;

    /* Transmit quadrature mirror filters implemented here */
    h_ptr = h;
    tqmf_ptr = tqmf;
    xa = (long)(*tqmf_ptr++) * (*h_ptr++);
    xb = (long)(*tqmf_ptr++) * (*h_ptr++);

    /* Main multiply-accumulate loop for samples and coefficients */
    encode_label0:
    for (i = 0; i < 10; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=10 max=10 avg=10
        xa += (long)(*tqmf_ptr++) * (*h_ptr++);
        xb += (long)(*tqmf_ptr++) * (*h_ptr++);
    }

    /* Final multiply-accumulate */
    xa += (long)(*tqmf_ptr++) * (*h_ptr++);
    xb += (long)(*tqmf_ptr) * (*h_ptr++);

    /* Update delay line tqmf */
    tqmf_ptr1 = tqmf_ptr - 2;

    encode_label1:
    for (i = 0; i < 22; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=22 max=22 avg=22
        *tqmf_ptr-- = *tqmf_ptr1--;
    }

    *tqmf_ptr-- = xin1;
    *tqmf_ptr = xin2;

    /* Scale outputs */
    xl = (xa + xb) >> 15;
    xh = (xa - xb) >> 15;

    /* Lower sub-band encoder */
    szl = filtez(delay_bpl, delay_dltx);
    spl = filtep(rlt1, al1, rlt2, al2);
    sl = szl + spl;
    el = xl - sl;
    il = quantl(el, detl);
    dlt = ((long)detl * qq4_code4_table[il >> 2]) >> 15;
    nbl = logscl(il, nbl);
    detl = scalel(nbl, 8);
    plt = dlt + szl;
    upzero(dlt, delay_dltx, delay_bpl);
    al2 = uppol2(al1, al2, plt, plt1, plt2);
    al1 = uppol1(al1, al2, plt, plt1);
    rlt = sl + dlt;
    rlt2 = rlt1;
    rlt1 = rlt;
    plt2 = plt1;
    plt1 = plt;

    /* High-band encoder */
    szh = filtez(delay_bph, delay_dhx);
    sph = filtep(rh1, ah1, rh2, ah2);
    sh = sph + szh;
    eh = xh - sh;
    if (eh >= 0) {
        ih = 3;
    } else {
        ih = 1;
    }
    decis = (564L * (long)deth) >> 12L;
    if (abs(eh) > decis)
        ih--;

    dh = ((long)deth * qq2_code2_table[ih]) >> 15L;
    nbh = logsch(ih, nbh);
    deth = scalel(nbh, 10);
    ph = dh + szh;
    upzero(dh, delay_dhx, delay_bph);
    ah2 = uppol2(ah1, ah2, ph, ph1, ph2);
    ah1 = uppol1(ah1, ah2, ph, ph1);
    yh = sh + dh;
    rh2 = rh1;
    rh1 = yh;
    ph2 = ph1;
    ph1 = ph;

    /* Multiplex ih and il to get signals together */
    return (il | (ih << 6));
}

void decode(int input) {
    int i;
    long int xa1, xa2;
    const int *h_ptr;
    int *ac_ptr, *ac_ptr1, *ad_ptr, *ad_ptr1;

    /* Split transmitted word */
    ilr = input & 0x3f;
    ih = input >> 6;

    /* Lower sub-band decoder */
    dec_szl = filtez(dec_del_bpl, dec_del_dltx);
    dec_spl = filtep(dec_rlt1, dec_al1, dec_rlt2, dec_al2);
    dec_sl = dec_spl + dec_szl;
    dec_dlt = ((long)dec_detl * qq4_code4_table[ilr >> 2]) >> 15;
    dl = ((long)dec_detl * qq6_code6_table[il]) >> 15;
    rl = dl + dec_sl;
    dec_nbl = logscl(ilr, dec_nbl);
    dec_detl = scalel(dec_nbl, 8);
    dec_plt = dec_dlt + dec_szl;
    upzero(dec_dlt, dec_del_dltx, dec_del_bpl);
    dec_al2 = uppol2(dec_al1, dec_al2, dec_plt, dec_plt1, dec_plt2);
    dec_al1 = uppol1(dec_al1, dec_al2, dec_plt, dec_plt1);
    dec_rlt = dec_sl + dec_dlt;
    dec_rlt2 = dec_rlt1;
    dec_rlt1 = dec_rlt;
    dec_plt2 = dec_plt1;
    dec_plt1 = dec_plt;

    /* High sub-band decoder */
    dec_szh = filtez(dec_del_bph, dec_del_dhx);
    dec_sph = filtep(dec_rh1, dec_ah1, dec_rh2, dec_ah2);
    dec_sh = dec_sph + dec_szh;
    dec_dh = ((long)dec_deth * qq2_code2_table[ih]) >> 15L;
    dec_nbh = logsch(ih, dec_nbh);
    dec_deth = scalel(dec_nbh, 10);
    dec_ph = dec_dh + dec_szh;
    upzero(dec_dh, dec_del_dhx, dec_del_bph);
    dec_ah2 = uppol2(dec_ah1, dec_ah2, dec_ph, dec_ph1, dec_ph2);
    dec_ah1 = uppol1(dec_ah1, dec_ah2, dec_ph, dec_ph1);
    rh = dec_sh + dec_dh;
    dec_rh2 = dec_rh1;
    dec_rh1 = rh;
    dec_ph2 = dec_ph1;
    dec_ph1 = dec_ph;

    /* End of high sub-band decoder */
    xd = rl - rh;
    xs = rl + rh;

    /* Quadrature mirror filters */
    h_ptr = h;
    ac_ptr = accumc;
    ad_ptr = accumd;
    xa1 = (long)xd * (*h_ptr++);
    xa2 = (long)xs * (*h_ptr++);

    decode_label2:
    for (i = 0; i < 10; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=10 max=10 avg=10
        xa1 += (long)(*ac_ptr++) * (*h_ptr++);
        xa2 += (long)(*ad_ptr++) * (*h_ptr++);
    }

    xa1 += (long)(*ac_ptr) * (*h_ptr++);
    xa2 += (long)(*ad_ptr) * (*h_ptr++);
    xout1 = xa1 >> 14;
    xout2 = xa2 >> 14;

    /* Update delay lines */
    ac_ptr1 = ac_ptr - 1;
    ad_ptr1 = ad_ptr - 1;

    decode_label3:
    for (i = 0; i < 10; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=10 max=10 avg=10
        *ac_ptr-- = *ac_ptr1--;
        *ad_ptr-- = *ad_ptr1--;
    }

    *ac_ptr = xd;
    *ad_ptr = xs;
}

/* Reset function */
void reset() {
    int i;

    detl = dec_detl = 32;
    deth = dec_deth = 8;
    nbl = al1 = al2 = plt1 = plt2 = rlt1 = rlt2 = 0;
    nbh = ah1 = ah2 = ph1 = ph2 = rh1 = rh2 = 0;
    dec_nbl = dec_al1 = dec_al2 = dec_plt1 = dec_plt2 = dec_rlt1 = dec_rlt2 = 0;
    dec_nbh = dec_ah1 = dec_ah2 = dec_ph1 = dec_ph2 = dec_rh1 = dec_rh2 = 0;

    reset_label4:
    for (i = 0; i < 6; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=6 max=6 avg=6
        delay_dltx[i] = 0;
        delay_dhx[i] = 0;
        dec_del_dltx[i] = 0;
        dec_del_dhx[i] = 0;
    }

    reset_label5:
    for (i = 0; i < 6; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=6 max=6 avg=6
        delay_bpl[i] = 0;
        delay_bph[i] = 0;
        dec_del_bpl[i] = 0;
        dec_del_bph[i] = 0;
    }

    reset_label6:
    for (i = 0; i < 24; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=24 max=24 avg=24
        tqmf[i] = 0;
    }

    reset_label7:
    for (i = 0; i < 11; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=11 max=11 avg=11
        accumc[i] = 0;
        accumd[i] = 0;
    }
}

int filtez(int *bpl, int *dlt) {
    int i;
    long int zl;
    zl = (long)(*bpl++) * (*dlt++);

    filtez_label8:
    for (i = 1; i < 6; i++) {
        #pragma HLS LOOP_TRIPCOUNT min=5 max=5 avg=5
        zl += (long)(*bpl++) * (*dlt++);
    }

    return ((int)(zl >> 14)); // x2 here
}

/* filtep - compute predictor output signal (pole section) */
/* input rlt1-2 and al1-2, output spl */
int filtep(int rlt1, int al1, int rlt2, int al2) {
    long int pl, pl2;
    pl = 2 * rlt1;
    pl = (long)al1 * pl;
    pl2 = 2 * rlt2;
    pl += (long)al2 * pl2;
    return ((int)(pl >> 15));
}

/* quantl - quantize the difference signal in the lower sub-band */
int quantl(int el, int detl) {
    int ril, mil;
    long int wd, decis;

    // abs of difference signal
    wd = abs(el);

    // determine mil based on decision levels and detl gain
    quantl_label9:
    for (mil = 0; mil < 30; mil++) {
        #pragma HLS LOOP_TRIPCOUNT min=30 max=30 avg=30
        decis = (decis_levl[mil] * (long)detl) >> 15L;
        if (wd <= decis)
            break;
    }

    // if mil=30 then wd is less than all decision levels
    if (el >= 0)
        ril = quant26bt_pos[mil];
    else
        ril = quant26bt_neg[mil];
    return (ril);
}

/* logscl - update log quantizer scale factor in lower sub-band */
int logscl(int il, int nbl) {
    long int wd;
    wd = ((long)nbl * 127L) >> 7L; // leak factor 127/128
    nbl = (int)wd + wl_code_table[il >> 2];
    if (nbl < 0)
        nbl = 0;
    if (nbl > 18432)
        nbl = 18432;
    return (nbl);
}

/* scalel: compute quantizer scale factor in lower or upper sub-band */
int scalel(int nbl, int shift_constant) {
    int wd1, wd2, wd3;
    wd1 = (nbl >> 6) & 31;
    wd2 = nbl >> 11;
    wd3 = ilb_table[wd1] >> (shift_constant + 1 - wd2);
    return (wd3 << 3);
}

/* upzero - inputs: dlt, dlti[0-5], bli[0-5], outputs: updated bli[0-5] */
/* also implements delay of bli and update of dlti from dlt */
void upzero(int dlt, int *dlti, int *bli) {
    int i, wd2, wd3;

    // if dlt is zero, then no sum into bli
    if (dlt == 0) {
        upzero_label10:
        for (i = 0; i < 6; i++) {
            #pragma HLS LOOP_TRIPCOUNT min=6 max=6 avg=6
            bli[i] = (int)((255L * bli[i]) >> 8L); // leak factor of 255/256
        }
    } else {
        upzero_label11:
        for (i = 0; i < 6; i++) {
            #pragma HLS LOOP_TRIPCOUNT min=6 max=6 avg=6
            if ((long)dlt * dlti[i] >= 0)
                wd2 = 128;
            else
                wd2 = -128;
            wd3 = (int)((255L * bli[i]) >> 8L); // leak factor of 255/256
            bli[i] = wd2 + wd3;
        }
    }

    // implement delay line for dlt
    dlti[5] = dlti[4];
    dlti[4] = dlti[3];
    dlti[3] = dlti[2];
    dlti[2] = dlti[1];
    dlti[1] = dlti[0];
    dlti[0] = dlt;
}

/* uppol2 - update second predictor coefficient (pole section) */
/* inputs: al1, al2, plt, plt1, plt2. outputs: apl2 */
int uppol2(int al1, int al2, int plt, int plt1, int plt2) {
    long int wd2, wd4;
    int apl2;

    wd2 = 4L * (long)al1;
    if ((long)plt * plt1 >= 0L)
        wd2 = -wd2;  /* check same sign */
    wd2 = wd2 >> 7; /* gain of 1/128 */

    if ((long)plt * plt2 >= 0L) {
        wd4 = wd2 + 128; /* same sign case */
    } else {
        wd4 = wd2 - 128;
    }

    apl2 = wd4 + (127L * (long)al2 >> 7L); /* leak factor of 127/128 */

    /* apl2 is limited to +-.75 */
    if (apl2 > 12288)
        apl2 = 12288;
    if (apl2 < -12288)
        apl2 = -12288;

    return apl2;
}

/* uppol1 - update first predictor coefficient (pole section) */
/* inputs: al1, apl2, plt, plt1. outputs: apl1 */
int uppol1(int al1, int apl2, int plt, int plt1) {
    long int wd2;
    int wd3, apl1;

    wd2 = ((long)al1 * 255L) >> 8L; /* leak factor of 255/256 */

    if ((long)plt * plt1 >= 0L) {
        apl1 = (int)wd2 + 192; /* same sign case */
    } else {
        apl1 = (int)wd2 - 192;
    }

    /* note: wd3= .9375-.75 is always positive */
    wd3 = 15360 - apl2; /* limit value */
    if (apl1 > wd3)
        apl1 = wd3;
    if (apl1 < -wd3)
        apl1 = -wd3;

    return apl1;
}

/* logsch - update log quantizer scale factor in higher sub-band */
/* note that nbh is passed and returned */
int logsch(int ih, int nbh) {
    int wd;

    wd = ((long)nbh * 127L) >> 7L; /* leak factor 127/128 */
    nbh = wd + wh_code_table[ih];
    if (nbh < 0)
        nbh = 0;
    if (nbh > 22528)
        nbh = 22528;

    return nbh;
}