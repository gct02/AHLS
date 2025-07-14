# 1 "data/benchmarks/adpcm/adpcm.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 339 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/tools/Xilinx/Vitis_HLS/2023.2/common/technology/autopilot/etc/autopilot_ssdm_op.h" 1
# 266 "/tools/Xilinx/Vitis_HLS/2023.2/common/technology/autopilot/etc/autopilot_ssdm_op.h"
    void _ssdm_op_IfRead() __attribute__ ((nothrow));
    void _ssdm_op_IfWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanWrite() __attribute__ ((nothrow));


    void _ssdm_StreamRead() __attribute__ ((nothrow));
    void _ssdm_StreamWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanWrite() __attribute__ ((nothrow));
    void _ssdm_op_ReadReq() __attribute__ ((nothrow));
    void _ssdm_op_Read() __attribute__ ((nothrow));
    void _ssdm_op_WriteReq() __attribute__ ((nothrow));
    void _ssdm_op_Write() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbReadReq() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_CanReadReq() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbWriteReq() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_CanWriteReq() __attribute__ ((nothrow));




    void _ssdm_op_MemShiftRead() __attribute__ ((nothrow));

    void _ssdm_op_PrintNone() __attribute__ ((nothrow));
    void _ssdm_op_PrintInt() __attribute__ ((nothrow));
    void _ssdm_op_PrintDouble() __attribute__ ((nothrow));

    void _ssdm_op_Wait(int) __attribute__ ((nothrow));
    void _ssdm_op_Poll() __attribute__ ((nothrow));

    void _ssdm_op_Return() __attribute__ ((nothrow));


    void _ssdm_op_SpecSynModule() __attribute__ ((nothrow));
    void _ssdm_op_SpecTopModule() __attribute__ ((nothrow));
    void _ssdm_op_SpecProcessDecl() __attribute__ ((nothrow));
    void _ssdm_op_SpecProcessDef() __attribute__ ((nothrow));
    void _ssdm_op_SpecPort() __attribute__ ((nothrow));
    void _ssdm_op_SpecConnection() __attribute__ ((nothrow));
    void _ssdm_op_SpecChannel() __attribute__ ((nothrow));
    void _ssdm_op_SpecSensitive() __attribute__ ((nothrow));
    void _ssdm_op_SpecModuleInst() __attribute__ ((nothrow));
    void _ssdm_op_SpecPortMap() __attribute__ ((nothrow));

    void _ssdm_op_SpecReset() __attribute__ ((nothrow));

    void _ssdm_op_SpecPlatform() __attribute__ ((nothrow));
    void _ssdm_op_SpecClockDomain() __attribute__ ((nothrow));
    void _ssdm_op_SpecPowerDomain() __attribute__ ((nothrow));

    int _ssdm_op_SpecRegionBegin() __attribute__ ((nothrow));
    int _ssdm_op_SpecRegionEnd() __attribute__ ((nothrow));

    void _ssdm_op_SpecLoopName() __attribute__ ((nothrow));

    void _ssdm_op_SpecLoopTripCount() __attribute__ ((nothrow));

    int _ssdm_op_SpecStateBegin() __attribute__ ((nothrow));
    int _ssdm_op_SpecStateEnd() __attribute__ ((nothrow));

    void _ssdm_op_SpecInterface() __attribute__ ((nothrow));

    void _ssdm_op_SpecPipeline() __attribute__ ((nothrow));
    void _ssdm_op_SpecDataflowPipeline() __attribute__ ((nothrow));


    void _ssdm_op_SpecLatency() __attribute__ ((nothrow));
    void _ssdm_op_SpecParallel() __attribute__ ((nothrow));
    void _ssdm_op_SpecProtocol() __attribute__ ((nothrow));
    void _ssdm_op_SpecOccurrence() __attribute__ ((nothrow));

    void _ssdm_op_SpecResource() __attribute__ ((nothrow));
    void _ssdm_op_SpecResourceLimit() __attribute__ ((nothrow));
    void _ssdm_op_SpecCHCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecFUCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecIFCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecIPCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecMemCore() __attribute__ ((nothrow));

    void _ssdm_op_SpecExt() __attribute__ ((nothrow));




    void _ssdm_SpecArrayDimSize() __attribute__ ((nothrow));

    void _ssdm_RegionBegin() __attribute__ ((nothrow));
    void _ssdm_RegionEnd() __attribute__ ((nothrow));

    void _ssdm_Unroll() __attribute__ ((nothrow));
    void _ssdm_UnrollRegion() __attribute__ ((nothrow));

    void _ssdm_InlineAll() __attribute__ ((nothrow));
    void _ssdm_InlineLoop() __attribute__ ((nothrow));
    void _ssdm_Inline() __attribute__ ((nothrow));
    void _ssdm_InlineSelf() __attribute__ ((nothrow));
    void _ssdm_InlineRegion() __attribute__ ((nothrow));

    void _ssdm_SpecArrayMap() __attribute__ ((nothrow));
    void _ssdm_SpecArrayPartition() __attribute__ ((nothrow));
    void _ssdm_SpecArrayReshape() __attribute__ ((nothrow));

    void _ssdm_SpecStream() __attribute__ ((nothrow));

    void _ssdm_op_SpecStable() __attribute__ ((nothrow));
    void _ssdm_op_SpecStableContent() __attribute__ ((nothrow));

    void _ssdm_op_SpecBindPort() __attribute__ ((nothrow));

    void _ssdm_op_SpecPipoDepth() __attribute__ ((nothrow));

    void _ssdm_SpecExpr() __attribute__ ((nothrow));
    void _ssdm_SpecExprBalance() __attribute__ ((nothrow));

    void _ssdm_SpecDependence() __attribute__ ((nothrow));

    void _ssdm_SpecLoopMerge() __attribute__ ((nothrow));
    void _ssdm_SpecLoopFlatten() __attribute__ ((nothrow));
    void _ssdm_SpecLoopRewind() __attribute__ ((nothrow));

    void _ssdm_SpecFuncInstantiation() __attribute__ ((nothrow));
    void _ssdm_SpecFuncBuffer() __attribute__ ((nothrow));
    void _ssdm_SpecFuncExtract() __attribute__ ((nothrow));
    void _ssdm_SpecConstant() __attribute__ ((nothrow));

    void _ssdm_DataPack() __attribute__ ((nothrow));
    void _ssdm_SpecDataPack() __attribute__ ((nothrow));

    void _ssdm_op_SpecBitsMap() __attribute__ ((nothrow));
    void _ssdm_op_SpecLicense() __attribute__ ((nothrow));
# 2 "<built-in>" 2
# 1 "data/benchmarks/adpcm/adpcm.c" 2
# 66 "data/benchmarks/adpcm/adpcm.c"
# 1 "data/benchmarks/adpcm/adpcm.h" 1





__attribute__((sdx_kernel("adpcm_main", 0))) void adpcm_main(
    const int in_data[100],
    int encoded[100/2],
    int decoded[100]
);
# 67 "data/benchmarks/adpcm/adpcm.c" 2




int tqmf[24];



const int h[24] = {
    12, -44, -44, 212, 48, -624, 128, 1448,
    -840, -3220, 3804, 15504, 15504, 3804, -3220, -840,
    1448, 128, -624, 48, 212, -44, -44, 12
};


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


const int decis_levl[30] = {
    280, 576, 880, 1200, 1520, 1864, 2208, 2584,
    2960, 3376, 3784, 4240, 4696, 5200, 5712, 6288,
    6864, 7520, 8184, 8968, 9752, 10712, 11664, 12896,
    14120, 15840, 17560, 20456, 23352, 32767
};

int detl;



const int quant26bt_pos[31] = {
    61, 60, 59, 58, 57, 56, 55, 54,
    53, 52, 51, 50, 49, 48, 47, 46,
    45, 44, 43, 42, 41, 40, 39, 38,
    37, 36, 35, 34, 33, 32, 32
};



const int quant26bt_neg[31] = {
    63, 62, 31, 30, 29, 28, 27, 26,
    25, 24, 23, 22, 21, 20, 19, 18,
    17, 16, 15, 14, 13, 12, 11, 10,
    9, 8, 7, 6, 5, 4, 4
};

const int qq2_code2_table[4] = { -7408, -1616, 7408, 1616 };
const int wh_code_table[4] = { 798, -214, 798, -214 };


int dec_del_bph[6];
int dec_del_dhx[6];


int dec_rh1, dec_rh2;
int dec_ah1, dec_ah2;
int dec_ph, dec_sph;


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


int xout1, xout2;


int delay_bpl[6];
int delay_dltx[6];
int nbl;
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
int sh;
int eh;
int il, szl, spl, sl, el;


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


__attribute__((sdx_kernel("adpcm_main", 0))) void adpcm_main(
    const int in_data[100],
    int encoded[100/2],
    int decoded[100]
) {
#line 15 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 211 "data/benchmarks/adpcm/adpcm.c"

#line 9 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/hls/hls_config.tcl"
#pragma HLSDIRECTIVE TOP name=adpcm_main
# 211 "data/benchmarks/adpcm/adpcm.c"

    int i;

    reset();

    adpcm_main_label12:
    for (i = 0; i < 100/2; i++) {
#line 13 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 217 "data/benchmarks/adpcm/adpcm.c"

#pragma HLS LOOP_TRIPCOUNT min=50 max=50 avg=50
 encoded[i] = encode (in_data[2*i], in_data[2*i + 1]);
    }

    adpcm_main_label13:
    for (i = 0; i < 100/2; i++) {
#line 14 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 223 "data/benchmarks/adpcm/adpcm.c"

#pragma HLS LOOP_TRIPCOUNT min=50 max=50 avg=50
 decode (encoded[i]);
        decoded[2*i] = xout1;
        decoded[2*i + 1] = xout2;
    }
}

int abs(int n) {
#line 16 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 231 "data/benchmarks/adpcm/adpcm.c"

#line 29 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 231 "data/benchmarks/adpcm/adpcm.c"

    int m;
    if (n >= 0)
        m = n;
    else
        m = -n;
    return m;
}

int encode(int xin1, int xin2) {
#line 22 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 240 "data/benchmarks/adpcm/adpcm.c"

#line 35 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 240 "data/benchmarks/adpcm/adpcm.c"

    int i;
    const int *h_ptr;
    int *tqmf_ptr, *tqmf_ptr1;
    long int xa, xb;
    int decis;


    h_ptr = h;
    tqmf_ptr = tqmf;
    xa = (long)(*tqmf_ptr++) * (*h_ptr++);
    xb = (long)(*tqmf_ptr++) * (*h_ptr++);


    encode_label0:
    for (i = 0; i < 10; i++) {
#line 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 255 "data/benchmarks/adpcm/adpcm.c"

#pragma HLS LOOP_TRIPCOUNT min=10 max=10 avg=10
 xa += (long)(*tqmf_ptr++) * (*h_ptr++);
        xb += (long)(*tqmf_ptr++) * (*h_ptr++);
    }


    xa += (long)(*tqmf_ptr++) * (*h_ptr++);
    xb += (long)(*tqmf_ptr) * (*h_ptr++);


    tqmf_ptr1 = tqmf_ptr - 2;

    encode_label1:
    for (i = 0; i < 22; i++) {
#line 2 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 269 "data/benchmarks/adpcm/adpcm.c"

#pragma HLS LOOP_TRIPCOUNT min=22 max=22 avg=22
 *tqmf_ptr-- = *tqmf_ptr1--;
    }

    *tqmf_ptr-- = xin1;
    *tqmf_ptr = xin2;


    xl = (xa + xb) >> 15;
    xh = (xa - xb) >> 15;


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


    return (il | (ih << 6));
}

void decode(int input) {
#line 23 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 331 "data/benchmarks/adpcm/adpcm.c"

#line 36 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 331 "data/benchmarks/adpcm/adpcm.c"

    int i;
    long int xa1, xa2;
    const int *h_ptr;
    int *ac_ptr, *ac_ptr1, *ad_ptr, *ad_ptr1;


    ilr = input & 0x3f;
    ih = input >> 6;


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


    xd = rl - rh;
    xs = rl + rh;


    h_ptr = h;
    ac_ptr = accumc;
    ad_ptr = accumd;
    xa1 = (long)xd * (*h_ptr++);
    xa2 = (long)xs * (*h_ptr++);

    decode_label2:
    for (i = 0; i < 10; i++) {
#line 3 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 389 "data/benchmarks/adpcm/adpcm.c"

#pragma HLS LOOP_TRIPCOUNT min=10 max=10 avg=10
 xa1 += (long)(*ac_ptr++) * (*h_ptr++);
        xa2 += (long)(*ad_ptr++) * (*h_ptr++);
    }

    xa1 += (long)(*ac_ptr) * (*h_ptr++);
    xa2 += (long)(*ad_ptr) * (*h_ptr++);
    xout1 = xa1 >> 14;
    xout2 = xa2 >> 14;


    ac_ptr1 = ac_ptr - 1;
    ad_ptr1 = ad_ptr - 1;

    decode_label3:
    for (i = 0; i < 10; i++) {
#line 4 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 405 "data/benchmarks/adpcm/adpcm.c"

#pragma HLS LOOP_TRIPCOUNT min=10 max=10 avg=10
 *ac_ptr-- = *ac_ptr1--;
        *ad_ptr-- = *ad_ptr1--;
    }

    *ac_ptr = xd;
    *ad_ptr = xs;
}


void reset() {
#line 24 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 416 "data/benchmarks/adpcm/adpcm.c"

#line 37 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 416 "data/benchmarks/adpcm/adpcm.c"

    int i;

    detl = dec_detl = 32;
    deth = dec_deth = 8;
    nbl = al1 = al2 = plt1 = plt2 = rlt1 = rlt2 = 0;
    nbh = ah1 = ah2 = ph1 = ph2 = rh1 = rh2 = 0;
    dec_nbl = dec_al1 = dec_al2 = dec_plt1 = dec_plt2 = dec_rlt1 = dec_rlt2 = 0;
    dec_nbh = dec_ah1 = dec_ah2 = dec_ph1 = dec_ph2 = dec_rh1 = dec_rh2 = 0;

    reset_label4:
    for (i = 0; i < 6; i++) {
#line 5 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 427 "data/benchmarks/adpcm/adpcm.c"

#pragma HLS LOOP_TRIPCOUNT min=6 max=6 avg=6
 delay_dltx[i] = 0;
        delay_dhx[i] = 0;
        dec_del_dltx[i] = 0;
        dec_del_dhx[i] = 0;
    }

    reset_label5:
    for (i = 0; i < 6; i++) {
#line 6 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 436 "data/benchmarks/adpcm/adpcm.c"

#pragma HLS LOOP_TRIPCOUNT min=6 max=6 avg=6
 delay_bpl[i] = 0;
        delay_bph[i] = 0;
        dec_del_bpl[i] = 0;
        dec_del_bph[i] = 0;
    }

    reset_label6:
    for (i = 0; i < 24; i++) {
#line 7 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 445 "data/benchmarks/adpcm/adpcm.c"

#pragma HLS LOOP_TRIPCOUNT min=24 max=24 avg=24
 tqmf[i] = 0;
    }

    reset_label7:
    for (i = 0; i < 11; i++) {
#line 8 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 451 "data/benchmarks/adpcm/adpcm.c"

#pragma HLS LOOP_TRIPCOUNT min=11 max=11 avg=11
 accumc[i] = 0;
        accumd[i] = 0;
    }
}

int filtez(int *bpl, int *dlt) {
#line 25 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 458 "data/benchmarks/adpcm/adpcm.c"

#line 38 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 458 "data/benchmarks/adpcm/adpcm.c"

    int i;
    long int zl;
    zl = (long)(*bpl++) * (*dlt++);

    filtez_label8:
    for (i = 1; i < 6; i++) {
#line 9 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 464 "data/benchmarks/adpcm/adpcm.c"

#pragma HLS LOOP_TRIPCOUNT min=5 max=5 avg=5
 zl += (long)(*bpl++) * (*dlt++);
    }

    return ((int)(zl >> 14));
}



int filtep(int rlt1, int al1, int rlt2, int al2) {
#line 26 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 474 "data/benchmarks/adpcm/adpcm.c"

#line 39 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 474 "data/benchmarks/adpcm/adpcm.c"

    long int pl, pl2;
    pl = 2 * rlt1;
    pl = (long)al1 * pl;
    pl2 = 2 * rlt2;
    pl += (long)al2 * pl2;
    return ((int)(pl >> 15));
}


int quantl(int el, int detl) {
#line 27 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 484 "data/benchmarks/adpcm/adpcm.c"

#line 40 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 484 "data/benchmarks/adpcm/adpcm.c"

    int ril, mil;
    long int wd, decis;


    wd = abs(el);


    quantl_label9:
    for (mil = 0; mil < 30; mil++) {
#line 10 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 493 "data/benchmarks/adpcm/adpcm.c"

#pragma HLS LOOP_TRIPCOUNT min=30 max=30 avg=30
 decis = (decis_levl[mil] * (long)detl) >> 15L;
        if (wd <= decis)
            break;
    }


    if (el >= 0)
        ril = quant26bt_pos[mil];
    else
        ril = quant26bt_neg[mil];
    return (ril);
}


int logscl(int il, int nbl) {
#line 17 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 509 "data/benchmarks/adpcm/adpcm.c"

#line 30 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 509 "data/benchmarks/adpcm/adpcm.c"

    long int wd;
    wd = ((long)nbl * 127L) >> 7L;
    nbl = (int)wd + wl_code_table[il >> 2];
    if (nbl < 0)
        nbl = 0;
    if (nbl > 18432)
        nbl = 18432;
    return (nbl);
}


int scalel(int nbl, int shift_constant) {
#line 18 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 521 "data/benchmarks/adpcm/adpcm.c"

#line 31 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 521 "data/benchmarks/adpcm/adpcm.c"

    int wd1, wd2, wd3;
    wd1 = (nbl >> 6) & 31;
    wd2 = nbl >> 11;
    wd3 = ilb_table[wd1] >> (shift_constant + 1 - wd2);
    return (wd3 << 3);
}



void upzero(int dlt, int *dlti, int *bli) {
#line 28 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 531 "data/benchmarks/adpcm/adpcm.c"

#line 41 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 531 "data/benchmarks/adpcm/adpcm.c"

    int i, wd2, wd3;


    if (dlt == 0) {
        upzero_label10:
        for (i = 0; i < 6; i++) {
#line 11 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 537 "data/benchmarks/adpcm/adpcm.c"

#pragma HLS LOOP_TRIPCOUNT min=6 max=6 avg=6
 bli[i] = (int)((255L * bli[i]) >> 8L);
        }
    } else {
        upzero_label11:
        for (i = 0; i < 6; i++) {
#line 12 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 543 "data/benchmarks/adpcm/adpcm.c"

#pragma HLS LOOP_TRIPCOUNT min=6 max=6 avg=6
 if ((long)dlt * dlti[i] >= 0)
                wd2 = 128;
            else
                wd2 = -128;
            wd3 = (int)((255L * bli[i]) >> 8L);
            bli[i] = wd2 + wd3;
        }
    }


    dlti[5] = dlti[4];
    dlti[4] = dlti[3];
    dlti[3] = dlti[2];
    dlti[2] = dlti[1];
    dlti[1] = dlti[0];
    dlti[0] = dlt;
}



int uppol2(int al1, int al2, int plt, int plt1, int plt2) {
#line 19 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 565 "data/benchmarks/adpcm/adpcm.c"

#line 32 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 565 "data/benchmarks/adpcm/adpcm.c"

    long int wd2, wd4;
    int apl2;

    wd2 = 4L * (long)al1;
    if ((long)plt * plt1 >= 0L)
        wd2 = -wd2;
    wd2 = wd2 >> 7;

    if ((long)plt * plt2 >= 0L) {
        wd4 = wd2 + 128;
    } else {
        wd4 = wd2 - 128;
    }

    apl2 = wd4 + (127L * (long)al2 >> 7L);


    if (apl2 > 12288)
        apl2 = 12288;
    if (apl2 < -12288)
        apl2 = -12288;

    return apl2;
}



int uppol1(int al1, int apl2, int plt, int plt1) {
#line 20 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 593 "data/benchmarks/adpcm/adpcm.c"

#line 33 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 593 "data/benchmarks/adpcm/adpcm.c"

    long int wd2;
    int wd3, apl1;

    wd2 = ((long)al1 * 255L) >> 8L;

    if ((long)plt * plt1 >= 0L) {
        apl1 = (int)wd2 + 192;
    } else {
        apl1 = (int)wd2 - 192;
    }


    wd3 = 15360 - apl2;
    if (apl1 > wd3)
        apl1 = wd3;
    if (apl1 < -wd3)
        apl1 = -wd3;

    return apl1;
}



int logsch(int ih, int nbh) {
#line 21 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 617 "data/benchmarks/adpcm/adpcm.c"

#line 34 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 617 "data/benchmarks/adpcm/adpcm.c"

    int wd;

    wd = ((long)nbh * 127L) >> 7L;
    nbh = wd + wh_code_table[ih];
    if (nbh < 0)
        nbh = 0;
    if (nbh > 22528)
        nbh = 22528;

    return nbh;
}
