# 1 "data/benchmarks/sha/sha.c"
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
# 1 "data/benchmarks/sha/sha.c" 2
# 27 "data/benchmarks/sha/sha.c"
# 1 "data/benchmarks/sha/sha.h" 1
# 33 "data/benchmarks/sha/sha.h"
__attribute__((sdx_kernel("sha_stream", 0))) void sha_stream (
    const unsigned char indata[2][8192],
    const int in_i[2],
    unsigned int outdata[5]
);
# 28 "data/benchmarks/sha/sha.c" 2
# 48 "data/benchmarks/sha/sha.c"
unsigned int sha_info_count_lo, sha_info_count_hi;
unsigned int sha_info_data[16];
unsigned int sha_info_digest[5];

unsigned char local_indata[2][8192];


void local_memset(unsigned int *s, int c, int n, int e) {
#line 15 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 55 "data/benchmarks/sha/sha.c"

#line 21 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 55 "data/benchmarks/sha/sha.c"

#line 23 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 55 "data/benchmarks/sha/sha.c"

    unsigned int uc = c;
    unsigned int *p = (unsigned int *)s;
    int m = n / 4;

    local_memset_label0:
    while (e-- > 0) {
#line 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 61 "data/benchmarks/sha/sha.c"

        p++;
    }
    local_memset_label1:
    while (m-- > 0) {
#line 2 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 65 "data/benchmarks/sha/sha.c"

#pragma HLS LOOP_TRIPCOUNT max=14
 *p++ = uc;
    }
}


void local_memcpy(unsigned int *s1, const unsigned char *s2, int n) {
#line 16 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 72 "data/benchmarks/sha/sha.c"

#line 22 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 72 "data/benchmarks/sha/sha.c"

    unsigned int *p1 = (unsigned int *)s1;
    unsigned char *p2 = (unsigned char *)s2;
    unsigned int tmp;
    int m = n / 4;

    local_memcpy_label3:
    while (m-- > 0) {
#line 3 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 79 "data/benchmarks/sha/sha.c"

#pragma HLS LOOP_TRIPCOUNT max=16
 tmp = 0;
        tmp |= 0xFF & *p2++;
        tmp |= (0xFF & *p2++) << 8;
        tmp |= (0xFF & *p2++) << 16;
        tmp |= (0xFF & *p2++) << 24;
        *p1 = tmp;
        p1++;
    }
}


void sha_transform() {
#line 17 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 92 "data/benchmarks/sha/sha.c"

#line 24 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 92 "data/benchmarks/sha/sha.c"

    int i;
    unsigned int temp, A, B, C, D, E, W[80];


    sha_transform_label1:
    for (i = 0; i < 16; ++i) {
#line 5 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 98 "data/benchmarks/sha/sha.c"

#pragma HLS LOOP_TRIPCOUNT min=16 max=16 avg=16
 W[i] = sha_info_data[i];
    }

    sha_transform_label2:
    for (i = 16; i < 80; ++i) {
#line 6 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 104 "data/benchmarks/sha/sha.c"

#pragma HLS LOOP_TRIPCOUNT min=64 max=64 avg=64
 W[i] = W[i - 3] ^ W[i - 8] ^ W[i - 14] ^ W[i - 16];
    }


    A = sha_info_digest[0];
    B = sha_info_digest[1];
    C = sha_info_digest[2];
    D = sha_info_digest[3];
    E = sha_info_digest[4];


    sha_transform_label3: for (i = 0; i < 20; ++i) {
#line 7 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 117 "data/benchmarks/sha/sha.c"

#pragma HLS LOOP_TRIPCOUNT min=20 max=20 avg=20
 temp = ((A << 5) | (A >> (32 - 5))) + ((B & C) | (~B & D)) + E + W[i] + 0x5a827999L; E = D; D = C; C = ((B << 30) | (B >> (32 - 30))); B = A; A = temp;
    }
    sha_transform_label4: for (i = 20; i < 40; ++i) {
#line 8 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 121 "data/benchmarks/sha/sha.c"

#pragma HLS LOOP_TRIPCOUNT min=20 max=20 avg=20
 temp = ((A << 5) | (A >> (32 - 5))) + (B ^ C ^ D) + E + W[i] + 0x6ed9eba1L; E = D; D = C; C = ((B << 30) | (B >> (32 - 30))); B = A; A = temp;
    }
    sha_transform_label5: for (i = 40; i < 60; ++i) {
#line 9 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 125 "data/benchmarks/sha/sha.c"

#pragma HLS LOOP_TRIPCOUNT min=20 max=20 avg=20
 temp = ((A << 5) | (A >> (32 - 5))) + ((B & C) | (B & D) | (C & D)) + E + W[i] + 0x8f1bbcdcL; E = D; D = C; C = ((B << 30) | (B >> (32 - 30))); B = A; A = temp;
    }
    sha_transform_label6: for (i = 60; i < 80; ++i) {
#line 10 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 129 "data/benchmarks/sha/sha.c"

#pragma HLS LOOP_TRIPCOUNT min=20 max=20 avg=20
 temp = ((A << 5) | (A >> (32 - 5))) + (B ^ C ^ D) + E + W[i] + 0xca62c1d6L; E = D; D = C; C = ((B << 30) | (B >> (32 - 30))); B = A; A = temp;
    }


    sha_info_digest[0] += A;
    sha_info_digest[1] += B;
    sha_info_digest[2] += C;
    sha_info_digest[3] += D;
    sha_info_digest[4] += E;
}


void sha_init() {
#line 19 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 143 "data/benchmarks/sha/sha.c"

#line 26 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 143 "data/benchmarks/sha/sha.c"

    sha_info_digest[0] = 0x67452301L;
    sha_info_digest[1] = 0xefcdab89L;
    sha_info_digest[2] = 0x98badcfeL;
    sha_info_digest[3] = 0x10325476L;
    sha_info_digest[4] = 0xc3d2e1f0L;
    sha_info_count_lo = 0L;
    sha_info_count_hi = 0L;
}


void sha_update(const unsigned char *buffer, int count) {
#line 18 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 154 "data/benchmarks/sha/sha.c"

#line 25 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 154 "data/benchmarks/sha/sha.c"

    if ((sha_info_count_lo + ((unsigned int)count << 3)) < sha_info_count_lo) {
        ++sha_info_count_hi;
    }
    sha_info_count_lo += (unsigned int)count << 3;
    sha_info_count_hi += (unsigned int)count >> 29;

    sha_update_label4:
    while (count >= 64) {
#line 4 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 162 "data/benchmarks/sha/sha.c"

#pragma HLS LOOP_TRIPCOUNT min=127 max=128
 local_memcpy(sha_info_data, buffer, 64);
        sha_transform();
        buffer += 64;
        count -= 64;
    }
    local_memcpy(sha_info_data, buffer, count);
}


void sha_final() {
#line 20 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 173 "data/benchmarks/sha/sha.c"

#line 27 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 173 "data/benchmarks/sha/sha.c"

    int count;
    unsigned int lo_bit_count = sha_info_count_lo;
    unsigned int hi_bit_count = sha_info_count_hi;

    count = (int)((lo_bit_count >> 3) & 0x3f);
    sha_info_data[count++] = 0x80;

    if (count > 56) {
        local_memset(sha_info_data, 0, 64 - count, count);
        sha_transform();
        local_memset(sha_info_data, 0, 56, 0);
    } else {
        local_memset(sha_info_data, 0, 56 - count, count);
    }

    sha_info_data[14] = hi_bit_count;
    sha_info_data[15] = lo_bit_count;
    sha_transform();
}



__attribute__((sdx_kernel("sha_stream", 0))) void sha_stream(
    const unsigned char indata[2][8192],
    const int in_i[2],
    unsigned int outdata[5]
) {
#line 14 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 200 "data/benchmarks/sha/sha.c"

#line 9 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/hls/hls_config.tcl"
#pragma HLSDIRECTIVE TOP name=sha_stream
# 200 "data/benchmarks/sha/sha.c"

    int i, j;
    const unsigned char *p;

    sha_stream_label1:
    for (i = 0; i < 2; i++) {
#line 12 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 205 "data/benchmarks/sha/sha.c"

#pragma HLS LOOP_TRIPCOUNT min=2 max=2 avg=2
 VITIS_LOOP_207_1: for (j = 0; j < 8192; j++) {
#pragma HLS LOOP_TRIPCOUNT min=8192 max=8192 avg=8192
 local_indata[i][j] = indata[i][j];
        }
    }

    sha_init();

    sha_stream_label0:
    for (j = 0; j < 2; j++) {
#line 11 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 216 "data/benchmarks/sha/sha.c"

#pragma HLS LOOP_TRIPCOUNT min=2 max=2 avg=2
 i = in_i[j];
        p = &local_indata[j][0];
        sha_update(p, i);
    }

    sha_final();
    sha_stream_label2:
    for (i = 0; i < 5; i++) {
#line 13 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 225 "data/benchmarks/sha/sha.c"

#pragma HLS LOOP_TRIPCOUNT min=5 max=5 avg=5
 outdata[i] = sha_info_digest[i];
    }
}
