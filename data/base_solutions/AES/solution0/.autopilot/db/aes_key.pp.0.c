# 1 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"
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
# 1 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c" 2
# 63 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"
# 1 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stdint.h" 1 3
# 63 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stdint.h" 3
# 1 "/usr/include/stdint.h" 1 3 4
# 26 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 33 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 439 "/usr/include/features.h" 3 4
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 440 "/usr/include/features.h" 2 3 4
# 461 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 452 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 453 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/long-double.h" 1 3 4
# 454 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 462 "/usr/include/features.h" 2 3 4
# 485 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 486 "/usr/include/features.h" 2 3 4
# 34 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 2 3 4
# 27 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 1 3 4
# 29 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;






typedef __int8_t __int_least8_t;
typedef __uint8_t __uint_least8_t;
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
typedef __int64_t __int_least64_t;
typedef __uint64_t __uint_least64_t;



typedef long int __quad_t;
typedef unsigned long int __u_quad_t;







typedef long int __intmax_t;
typedef unsigned long int __uintmax_t;
# 141 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h" 1 3 4
# 142 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/time64.h" 1 3 4
# 143 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;




typedef int __sig_atomic_t;
# 28 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wchar.h" 1 3 4
# 29 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 30 "/usr/include/stdint.h" 2 3 4




# 1 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h" 3 4
typedef __int8_t int8_t;
typedef __int16_t int16_t;
typedef __int32_t int32_t;
typedef __int64_t int64_t;
# 35 "/usr/include/stdint.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h" 3 4
typedef __uint8_t uint8_t;
typedef __uint16_t uint16_t;
typedef __uint32_t uint32_t;
typedef __uint64_t uint64_t;
# 38 "/usr/include/stdint.h" 2 3 4





typedef __int_least8_t int_least8_t;
typedef __int_least16_t int_least16_t;
typedef __int_least32_t int_least32_t;
typedef __int_least64_t int_least64_t;


typedef __uint_least8_t uint_least8_t;
typedef __uint_least16_t uint_least16_t;
typedef __uint_least32_t uint_least32_t;
typedef __uint_least64_t uint_least64_t;





typedef signed char int_fast8_t;

typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
# 71 "/usr/include/stdint.h" 3 4
typedef unsigned char uint_fast8_t;

typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
# 87 "/usr/include/stdint.h" 3 4
typedef long int intptr_t;


typedef unsigned long int uintptr_t;
# 101 "/usr/include/stdint.h" 3 4
typedef __intmax_t intmax_t;
typedef __uintmax_t uintmax_t;
# 64 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stdint.h" 2 3
# 64 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c" 2
# 1 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes.h" 1
# 77 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes.h"
int KeySchedule (int type, int key[32]);

void ByteSub_ShiftRow (int statemt[32], int nb);

void InversShiftRow_ByteSub (int statemt[32], int nb);

int MixColumn_AddRoundKey (int statemt[32], int nb, int n);

int AddRoundKey_InversMixColumn (int statemt[32], int nb, int n);

int AddRoundKey (int statemt[32], int type, int n);


int encrypt(int statemt[32], int key[32], int type);
int decrypt(int statemt[32], int key[32], int type);


int aes_main (int statemt[32], int key[32]);
# 65 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c" 2


const int Rcon0[30] = {
    0x01, 0x02, 0x04, 0x08, 0x10,
    0x20, 0x40, 0x80, 0x1b, 0x36,
    0x6c, 0xd8, 0xab, 0x4d, 0x9a,
    0x2f, 0x5e, 0xbc, 0x63, 0xc6,
    0x97, 0x35, 0x6a, 0xd4, 0xb3,
    0x7d, 0xfa, 0xef, 0xc5, 0x91,
};

int word[4][120];


void ByteSub_ShiftRow (int statemt[32], int nb) {
#line 21 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 79 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 45 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 79 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

    const int Sbox[16][16] = {
        {0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76},
        {0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0},
        {0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15},
        {0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75},
        {0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84},
        {0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf},
        {0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8},
        {0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2},
        {0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73},
        {0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb},
        {0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79},
        {0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08},
        {0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a},
        {0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e},
        {0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf},
        {0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16}
    };
    int temp;

    switch (nb) {
        case 4:
            temp = Sbox[statemt[1] >> 4][statemt[1] & 0xf];
            statemt[1] = Sbox[statemt[5] >> 4][statemt[5] & 0xf];
            statemt[5] = Sbox[statemt[9] >> 4][statemt[9] & 0xf];
            statemt[9] = Sbox[statemt[13] >> 4][statemt[13] & 0xf];
            statemt[13] = temp;
            temp = Sbox[statemt[2] >> 4][statemt[2] & 0xf];
            statemt[2] = Sbox[statemt[10] >> 4][statemt[10] & 0xf];
            statemt[10] = temp;
            temp = Sbox[statemt[6] >> 4][statemt[6] & 0xf];
            statemt[6] = Sbox[statemt[14] >> 4][statemt[14] & 0xf];
            statemt[14] = temp;
            temp = Sbox[statemt[3] >> 4][statemt[3] & 0xf];
            statemt[3] = Sbox[statemt[15] >> 4][statemt[15] & 0xf];
            statemt[15] = Sbox[statemt[11] >> 4][statemt[11] & 0xf];
            statemt[11] = Sbox[statemt[7] >> 4][statemt[7] & 0xf];
            statemt[7] = temp;
            statemt[0] = Sbox[statemt[0] >> 4][statemt[0] & 0xf];
            statemt[4] = Sbox[statemt[4] >> 4][statemt[4] & 0xf];
            statemt[8] = Sbox[statemt[8] >> 4][statemt[8] & 0xf];
            statemt[12] = Sbox[statemt[12] >> 4][statemt[12] & 0xf];
            break;
        case 6:
            temp = Sbox[statemt[1] >> 4][statemt[1] & 0xf];
            statemt[1] = Sbox[statemt[5] >> 4][statemt[5] & 0xf];
            statemt[5] = Sbox[statemt[9] >> 4][statemt[9] & 0xf];
            statemt[9] = Sbox[statemt[13] >> 4][statemt[13] & 0xf];
            statemt[13] = Sbox[statemt[17] >> 4][statemt[17] & 0xf];
            statemt[17] = Sbox[statemt[21] >> 4][statemt[21] & 0xf];
            statemt[21] = temp;
            temp = Sbox[statemt[2] >> 4][statemt[2] & 0xf];
            statemt[2] = Sbox[statemt[10] >> 4][statemt[10] & 0xf];
            statemt[10] = Sbox[statemt[18] >> 4][statemt[18] & 0xf];
            statemt[18] = temp;
            temp = Sbox[statemt[6] >> 4][statemt[6] & 0xf];
            statemt[6] = Sbox[statemt[14] >> 4][statemt[14] & 0xf];
            statemt[14] = Sbox[statemt[22] >> 4][statemt[22] & 0xf];
            statemt[22] = temp;
            temp = Sbox[statemt[3] >> 4][statemt[3] & 0xf];
            statemt[3] = Sbox[statemt[15] >> 4][statemt[15] & 0xf];
            statemt[15] = temp;
            temp = Sbox[statemt[7] >> 4][statemt[7] & 0xf];
            statemt[7] = Sbox[statemt[19] >> 4][statemt[19] & 0xf];
            statemt[19] = temp;
            temp = Sbox[statemt[11] >> 4][statemt[11] & 0xf];
            statemt[11] = Sbox[statemt[23] >> 4][statemt[23] & 0xf];
            statemt[23] = temp;
            statemt[0] = Sbox[statemt[0] >> 4][statemt[0] & 0xf];
            statemt[4] = Sbox[statemt[4] >> 4][statemt[4] & 0xf];
            statemt[8] = Sbox[statemt[8] >> 4][statemt[8] & 0xf];
            statemt[12] = Sbox[statemt[12] >> 4][statemt[12] & 0xf];
            statemt[16] = Sbox[statemt[16] >> 4][statemt[16] & 0xf];
            statemt[20] = Sbox[statemt[20] >> 4][statemt[20] & 0xf];
            break;
        case 8:
            temp = Sbox[statemt[1] >> 4][statemt[1] & 0xf];
            statemt[1] = Sbox[statemt[5] >> 4][statemt[5] & 0xf];
            statemt[5] = Sbox[statemt[9] >> 4][statemt[9] & 0xf];
            statemt[9] = Sbox[statemt[13] >> 4][statemt[13] & 0xf];
            statemt[13] = Sbox[statemt[17] >> 4][statemt[17] & 0xf];
            statemt[17] = Sbox[statemt[21] >> 4][statemt[21] & 0xf];
            statemt[21] = Sbox[statemt[25] >> 4][statemt[25] & 0xf];
            statemt[25] = Sbox[statemt[29] >> 4][statemt[29] & 0xf];
            statemt[29] = temp;
            temp = Sbox[statemt[2] >> 4][statemt[2] & 0xf];
            statemt[2] = Sbox[statemt[14] >> 4][statemt[14] & 0xf];
            statemt[14] = Sbox[statemt[26] >> 4][statemt[26] & 0xf];
            statemt[26] = Sbox[statemt[6] >> 4][statemt[6] & 0xf];
            statemt[6] = Sbox[statemt[18] >> 4][statemt[18] & 0xf];
            statemt[18] = Sbox[statemt[30] >> 4][statemt[30] & 0xf];
            statemt[30] = Sbox[statemt[10] >> 4][statemt[10] & 0xf];
            statemt[10] = Sbox[statemt[22] >> 4][statemt[22] & 0xf];
            statemt[22] = temp;
            temp = Sbox[statemt[3] >> 4][statemt[3] & 0xf];
            statemt[3] = Sbox[statemt[19] >> 4][statemt[19] & 0xf];
            statemt[19] = temp;
            temp = Sbox[statemt[7] >> 4][statemt[7] & 0xf];
            statemt[7] = Sbox[statemt[23] >> 4][statemt[23] & 0xf];
            statemt[23] = temp;
            temp = Sbox[statemt[11] >> 4][statemt[11] & 0xf];
            statemt[11] = Sbox[statemt[27] >> 4][statemt[27] & 0xf];
            statemt[27] = temp;
            temp = Sbox[statemt[15] >> 4][statemt[15] & 0xf];
            statemt[15] = Sbox[statemt[31] >> 4][statemt[31] & 0xf];
            statemt[31] = temp;
            statemt[0] = Sbox[statemt[0] >> 4][statemt[0] & 0xf];
            statemt[4] = Sbox[statemt[4] >> 4][statemt[4] & 0xf];
            statemt[8] = Sbox[statemt[8] >> 4][statemt[8] & 0xf];
            statemt[12] = Sbox[statemt[12] >> 4][statemt[12] & 0xf];
            statemt[16] = Sbox[statemt[16] >> 4][statemt[16] & 0xf];
            statemt[20] = Sbox[statemt[20] >> 4][statemt[20] & 0xf];
            statemt[24] = Sbox[statemt[24] >> 4][statemt[24] & 0xf];
            statemt[28] = Sbox[statemt[28] >> 4][statemt[28] & 0xf];
            break;
    }
}


void InversShiftRow_ByteSub (int statemt[32], int nb) {
#line 22 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 199 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 46 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 199 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

    const int invSbox[16][16] = {
        {0x52, 0x09, 0x6a, 0xd5, 0x30, 0x36, 0xa5, 0x38, 0xbf, 0x40, 0xa3, 0x9e, 0x81, 0xf3, 0xd7, 0xfb},
        {0x7c, 0xe3, 0x39, 0x82, 0x9b, 0x2f, 0xff, 0x87, 0x34, 0x8e, 0x43, 0x44, 0xc4, 0xde, 0xe9, 0xcb},
        {0x54, 0x7b, 0x94, 0x32, 0xa6, 0xc2, 0x23, 0x3d, 0xee, 0x4c, 0x95, 0x0b, 0x42, 0xfa, 0xc3, 0x4e},
        {0x08, 0x2e, 0xa1, 0x66, 0x28, 0xd9, 0x24, 0xb2, 0x76, 0x5b, 0xa2, 0x49, 0x6d, 0x8b, 0xd1, 0x25},
        {0x72, 0xf8, 0xf6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xd4, 0xa4, 0x5c, 0xcc, 0x5d, 0x65, 0xb6, 0x92},
        {0x6c, 0x70, 0x48, 0x50, 0xfd, 0xed, 0xb9, 0xda, 0x5e, 0x15, 0x46, 0x57, 0xa7, 0x8d, 0x9d, 0x84},
        {0x90, 0xd8, 0xab, 0x00, 0x8c, 0xbc, 0xd3, 0x0a, 0xf7, 0xe4, 0x58, 0x05, 0xb8, 0xb3, 0x45, 0x06},
        {0xd0, 0x2c, 0x1e, 0x8f, 0xca, 0x3f, 0x0f, 0x02, 0xc1, 0xaf, 0xbd, 0x03, 0x01, 0x13, 0x8a, 0x6b},
        {0x3a, 0x91, 0x11, 0x41, 0x4f, 0x67, 0xdc, 0xea, 0x97, 0xf2, 0xcf, 0xce, 0xf0, 0xb4, 0xe6, 0x73},
        {0x96, 0xac, 0x74, 0x22, 0xe7, 0xad, 0x35, 0x85, 0xe2, 0xf9, 0x37, 0xe8, 0x1c, 0x75, 0xdf, 0x6e},
        {0x47, 0xf1, 0x1a, 0x71, 0x1d, 0x29, 0xc5, 0x89, 0x6f, 0xb7, 0x62, 0x0e, 0xaa, 0x18, 0xbe, 0x1b},
        {0xfc, 0x56, 0x3e, 0x4b, 0xc6, 0xd2, 0x79, 0x20, 0x9a, 0xdb, 0xc0, 0xfe, 0x78, 0xcd, 0x5a, 0xf4},
        {0x1f, 0xdd, 0xa8, 0x33, 0x88, 0x07, 0xc7, 0x31, 0xb1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xec, 0x5f},
        {0x60, 0x51, 0x7f, 0xa9, 0x19, 0xb5, 0x4a, 0x0d, 0x2d, 0xe5, 0x7a, 0x9f, 0x93, 0xc9, 0x9c, 0xef},
        {0xa0, 0xe0, 0x3b, 0x4d, 0xae, 0x2a, 0xf5, 0xb0, 0xc8, 0xeb, 0xbb, 0x3c, 0x83, 0x53, 0x99, 0x61},
        {0x17, 0x2b, 0x04, 0x7e, 0xba, 0x77, 0xd6, 0x26, 0xe1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0c, 0x7d}
    };
    int temp;

    switch (nb) {
        case 4:
            temp = invSbox[statemt[13] >> 4][statemt[13] & 0xf];
            statemt[13] = invSbox[statemt[9] >> 4][statemt[9] & 0xf];
            statemt[9] = invSbox[statemt[5] >> 4][statemt[5] & 0xf];
            statemt[5] = invSbox[statemt[1] >> 4][statemt[1] & 0xf];
            statemt[1] = temp;
            temp = invSbox[statemt[14] >> 4][statemt[14] & 0xf];
            statemt[14] = invSbox[statemt[6] >> 4][statemt[6] & 0xf];
            statemt[6] = temp;
            temp = invSbox[statemt[2] >> 4][statemt[2] & 0xf];
            statemt[2] = invSbox[statemt[10] >> 4][statemt[10] & 0xf];
            statemt[10] = temp;
            temp = invSbox[statemt[15] >> 4][statemt[15] & 0xf];
            statemt[15] = invSbox[statemt[3] >> 4][statemt[3] & 0xf];
            statemt[3] = invSbox[statemt[7] >> 4][statemt[7] & 0xf];
            statemt[7] = invSbox[statemt[11] >> 4][statemt[11] & 0xf];
            statemt[11] = temp;
            statemt[0] = invSbox[statemt[0] >> 4][statemt[0] & 0xf];
            statemt[4] = invSbox[statemt[4] >> 4][statemt[4] & 0xf];
            statemt[8] = invSbox[statemt[8] >> 4][statemt[8] & 0xf];
            statemt[12] = invSbox[statemt[12] >> 4][statemt[12] & 0xf];
            break;
        case 6:
            temp = invSbox[statemt[21] >> 4][statemt[21] & 0xf];
            statemt[21] = invSbox[statemt[17] >> 4][statemt[17] & 0xf];
            statemt[17] = invSbox[statemt[13] >> 4][statemt[13] & 0xf];
            statemt[13] = invSbox[statemt[9] >> 4][statemt[9] & 0xf];
            statemt[9] = invSbox[statemt[5] >> 4][statemt[5] & 0xf];
            statemt[5] = invSbox[statemt[1] >> 4][statemt[1] & 0xf];
            statemt[1] = temp;
            temp = invSbox[statemt[22] >> 4][statemt[22] & 0xf];
            statemt[22] = invSbox[statemt[14] >> 4][statemt[14] & 0xf];
            statemt[14] = invSbox[statemt[6] >> 4][statemt[6] & 0xf];
            statemt[6] = temp;
            temp = invSbox[statemt[18] >> 4][statemt[18] & 0xf];
            statemt[18] = invSbox[statemt[10] >> 4][statemt[10] & 0xf];
            statemt[10] = invSbox[statemt[2] >> 4][statemt[2] & 0xf];
            statemt[2] = temp;
            temp = invSbox[statemt[15] >> 4][statemt[15] & 0xf];
            statemt[15] = invSbox[statemt[3] >> 4][statemt[3] & 0xf];
            statemt[3] = temp;
            temp = invSbox[statemt[19] >> 4][statemt[19] & 0xf];
            statemt[19] = invSbox[statemt[7] >> 4][statemt[7] & 0xf];
            statemt[7] = temp;
            temp = invSbox[statemt[23] >> 4][statemt[23] & 0xf];
            statemt[23] = invSbox[statemt[11] >> 4][statemt[11] & 0xf];
            statemt[11] = temp;
            statemt[0] = invSbox[statemt[0] >> 4][statemt[0] & 0xf];
            statemt[4] = invSbox[statemt[4] >> 4][statemt[4] & 0xf];
            statemt[8] = invSbox[statemt[8] >> 4][statemt[8] & 0xf];
            statemt[12] = invSbox[statemt[12] >> 4][statemt[12] & 0xf];
            statemt[16] = invSbox[statemt[16] >> 4][statemt[16] & 0xf];
            statemt[20] = invSbox[statemt[20] >> 4][statemt[20] & 0xf];
            break;
        case 8:
            temp = invSbox[statemt[29] >> 4][statemt[29] & 0xf];
            statemt[29] = invSbox[statemt[25] >> 4][statemt[25] & 0xf];
            statemt[25] = invSbox[statemt[21] >> 4][statemt[21] & 0xf];
            statemt[21] = invSbox[statemt[17] >> 4][statemt[17] & 0xf];
            statemt[17] = invSbox[statemt[13] >> 4][statemt[13] & 0xf];
            statemt[13] = invSbox[statemt[9] >> 4][statemt[9] & 0xf];
            statemt[9] = invSbox[statemt[5] >> 4][statemt[5] & 0xf];
            statemt[5] = invSbox[statemt[1] >> 4][statemt[1] & 0xf];
            statemt[1] = temp;
            temp = invSbox[statemt[30] >> 4][statemt[30] & 0xf];
            statemt[30] = invSbox[statemt[18] >> 4][statemt[18] & 0xf];
            statemt[18] = invSbox[statemt[6] >> 4][statemt[6] & 0xf];
            statemt[6] = invSbox[statemt[26] >> 4][statemt[26] & 0xf];
            statemt[26] = invSbox[statemt[14] >> 4][statemt[14] & 0xf];
            statemt[14] = invSbox[statemt[2] >> 4][statemt[2] & 0xf];
            statemt[2] = invSbox[statemt[22] >> 4][statemt[22] & 0xf];
            statemt[22] = invSbox[statemt[10] >> 4][statemt[10] & 0xf];
            statemt[10] = temp;
            temp = invSbox[statemt[31] >> 4][statemt[31] & 0xf];
            statemt[31] = invSbox[statemt[15] >> 4][statemt[15] & 0xf];
            statemt[15] = temp;
            temp = invSbox[statemt[27] >> 4][statemt[27] & 0xf];
            statemt[27] = invSbox[statemt[11] >> 4][statemt[11] & 0xf];
            statemt[11] = temp;
            temp = invSbox[statemt[23] >> 4][statemt[23] & 0xf];
            statemt[23] = invSbox[statemt[7] >> 4][statemt[7] & 0xf];
            statemt[7] = temp;
            temp = invSbox[statemt[19] >> 4][statemt[19] & 0xf];
            statemt[19] = invSbox[statemt[3] >> 4][statemt[3] & 0xf];
            statemt[3] = temp;
            statemt[0] = invSbox[statemt[0] >> 4][statemt[0] & 0xf];
            statemt[4] = invSbox[statemt[4] >> 4][statemt[4] & 0xf];
            statemt[8] = invSbox[statemt[8] >> 4][statemt[8] & 0xf];
            statemt[12] = invSbox[statemt[12] >> 4][statemt[12] & 0xf];
            statemt[16] = invSbox[statemt[16] >> 4][statemt[16] & 0xf];
            statemt[20] = invSbox[statemt[20] >> 4][statemt[20] & 0xf];
            statemt[24] = invSbox[statemt[24] >> 4][statemt[24] & 0xf];
            statemt[28] = invSbox[statemt[28] >> 4][statemt[28] & 0xf];
            break;
    }
}


int MixColumn_AddRoundKey (int statemt[32], int nb, int n) {
#line 16 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 319 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 40 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 319 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

    int ret[8 * 4], j;
    register int x;

    MixColumn_AddRoundKey_label0:
    for (j = 0; j < nb; ++j) {
#line 32 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 324 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 8 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 324 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#pragma HLS LOOP_TRIPCOUNT min=4 max=8 avg=6
 ret[j * 4] = (statemt[j * 4] << 1);
        if ((ret[j * 4] >> 8) == 1) ret[j * 4] ^= 283;
        x = statemt[1 + j * 4];
        x ^= (x << 1);
        if ((x >> 8) == 1) ret[j * 4] ^= (x ^ 283);
        else ret[j * 4] ^= x;
        ret[j * 4] ^=
        statemt[2 + j * 4] ^ statemt[3 + j * 4] ^ word[0][j + nb * n];

        ret[1 + j * 4] = (statemt[1 + j * 4] << 1);
        if ((ret[1 + j * 4] >> 8) == 1) ret[1 + j * 4] ^= 283;
        x = statemt[2 + j * 4];
        x ^= (x << 1);
        if ((x >> 8) == 1) ret[1 + j * 4] ^= (x ^ 283);
        else ret[1 + j * 4] ^= x;
        ret[1 + j * 4] ^=
        statemt[3 + j * 4] ^ statemt[j * 4] ^ word[1][j + nb * n];

        ret[2 + j * 4] = (statemt[2 + j * 4] << 1);
        if ((ret[2 + j * 4] >> 8) == 1) ret[2 + j * 4] ^= 283;
        x = statemt[3 + j * 4];
        x ^= (x << 1);
        if ((x >> 8) == 1) ret[2 + j * 4] ^= (x ^ 283);
        else ret[2 + j * 4] ^= x;
        ret[2 + j * 4] ^=
        statemt[j * 4] ^ statemt[1 + j * 4] ^ word[2][j + nb * n];

        ret[3 + j * 4] = (statemt[3 + j * 4] << 1);
        if ((ret[3 + j * 4] >> 8) == 1) ret[3 + j * 4] ^= 283;
        x = statemt[j * 4];
        x ^= (x << 1);
        if ((x >> 8) == 1) ret[3 + j * 4] ^= (x ^ 283);
        else ret[3 + j * 4] ^= x;
        ret[3 + j * 4] ^=
        statemt[1 + j * 4] ^ statemt[2 + j * 4] ^ word[3][j + nb * n];
    }

    MixColumn_AddRoundKey_label1:
    for (j = 0; j < nb; ++j) {
#line 33 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 364 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 9 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 364 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#pragma HLS LOOP_TRIPCOUNT min=4 max=8 avg=6
 statemt[j * 4] = ret[j * 4];
        statemt[1 + j * 4] = ret[1 + j * 4];
        statemt[2 + j * 4] = ret[2 + j * 4];
        statemt[3 + j * 4] = ret[3 + j * 4];
    }
    return 0;
}


int AddRoundKey_InversMixColumn (int statemt[32], int nb, int n) {
#line 17 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 375 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 41 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 375 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

    int ret[8 * 4], i, j;
    register int x;

    AddRoundKey_InversMixColumn_label2:
    for (j = 0; j < nb; ++j) {
#line 27 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 380 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 3 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 380 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#pragma HLS LOOP_TRIPCOUNT min=4 max=8 avg=6
 statemt[j * 4] ^= word[0][j + nb * n];
        statemt[1 + j * 4] ^= word[1][j + nb * n];
        statemt[2 + j * 4] ^= word[2][j + nb * n];
        statemt[3 + j * 4] ^= word[3][j + nb * n];
    }

    AddRoundKey_InversMixColumn_label0:
    for (j = 0; j < nb; ++j) {
#line 1 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 389 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 25 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 389 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#pragma HLS LOOP_TRIPCOUNT min=4 max=8 avg=6
 AddRoundKey_InversMixColumn_label1:
        for (i = 0; i < 4; ++i) {
#line 2 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 392 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 26 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 392 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#pragma HLS LOOP_TRIPCOUNT min=4 max=4 avg=4
 x = (statemt[i + j * 4] << 1);
            if ((x >> 8) == 1) x ^= 283;
            x ^= statemt[i + j * 4];
            x = (x << 1);
            if ((x >> 8) == 1) x ^= 283;
            x ^= statemt[i + j * 4];
            x = (x << 1);
            if ((x >> 8) == 1) x ^= 283;
            ret[i + j * 4] = x;

            x = (statemt[(i + 1) % 4 + j * 4] << 1);
            if ((x >> 8) == 1) x ^= 283;
            x = (x << 1);
            if ((x >> 8) == 1) x ^= 283;
            x ^= statemt[(i + 1) % 4 + j * 4];
            x = (x << 1);
            if ((x >> 8) == 1) x ^= 283;
            x ^= statemt[(i + 1) % 4 + j * 4];
            ret[i + j * 4] ^= x;

            x = (statemt[(i + 2) % 4 + j * 4] << 1);
            if ((x >> 8) == 1) x ^= 283;
            x ^= statemt[(i + 2) % 4 + j * 4];
            x = (x << 1);
            if ((x >> 8) == 1) x ^= 283;
            x = (x << 1);
            if ((x >> 8) == 1) x ^= 283;
            x ^= statemt[(i + 2) % 4 + j * 4];
            ret[i + j * 4] ^= x;

            x = (statemt[(i + 3) % 4 + j * 4] << 1);
            if ((x >> 8) == 1) x ^= 283;
            x = (x << 1);
            if ((x >> 8) == 1) x ^= 283;
            x = (x << 1);
            if ((x >> 8) == 1) x ^= 283;
            x ^= statemt[(i + 3) % 4 + j * 4];
            ret[i + j * 4] ^= x;
        }
    }

    AddRoundKey_InversMixColumn_label3:
    for (i = 0; i < nb; ++i) {
#line 28 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 436 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 4 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 436 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#pragma HLS LOOP_TRIPCOUNT min=4 max=8 avg=6
 statemt[i * 4] = ret[i * 4];
        statemt[1 + i * 4] = ret[1 + i * 4];
        statemt[2 + i * 4] = ret[2 + i * 4];
        statemt[3 + i * 4] = ret[3 + i * 4];
    }
    return 0;
}


int AddRoundKey (int statemt[32], int type, int n) {
#line 23 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 447 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 47 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 447 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

    int j, nb;

    switch (type) {
        case 128128:
        case 192128:
        case 256128:
            nb = 4;
            break;
        case 128192:
        case 192192:
        case 256192:
            nb = 6;
            break;
        case 128256:
        case 192256:
        case 256256:
            nb = 8;
            break;
    }

    AddRoundKey_label0:
    for (j = 0; j < nb; ++j) {
#line 31 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 469 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 7 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 469 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#pragma HLS LOOP_TRIPCOUNT min=4 max=8 avg=6
 statemt[j * 4] ^= word[0][j + nb * n];
        statemt[1 + j * 4] ^= word[1][j + nb * n];
        statemt[2 + j * 4] ^= word[2][j + nb * n];
        statemt[3 + j * 4] ^= word[3][j + nb * n];
    }
    return 0;
}


int KeySchedule (int type, int key[32]) {
#line 20 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 480 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 44 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 480 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

    const int Sbox[16][16] = {
        {0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76},
        {0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0},
        {0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15},
        {0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75},
        {0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84},
        {0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf},
        {0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8},
        {0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2},
        {0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73},
        {0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb},
        {0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79},
        {0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08},
        {0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a},
        {0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e},
        {0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf},
        {0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16}
    };

    int nk, nb, round_val;
    int i, j, temp[4];

    switch (type) {
        case 128128:
            nk = 4;
            nb = 4;
            round_val = 10;
            break;
        case 128192:
            nk = 4;
            nb = 6;
            round_val = 12;
            break;
        case 128256:
            nk = 4;
            nb = 8;
            round_val = 14;
            break;
        case 192128:
            nk = 6;
            nb = 4;
            round_val = 12;
            break;
        case 192192:
            nk = 6;
            nb = 6;
            round_val = 12;
            break;
        case 192256:
            nk = 6;
            nb = 8;
            round_val = 14;
            break;
        case 256128:
            nk = 8;
            nb = 4;
            round_val = 14;
            break;
        case 256192:
            nk = 8;
            nb = 6;
            round_val = 14;
            break;
        case 256256:
            nk = 8;
            nb = 8;
            round_val = 14;
            break;
        default:
            return -1;
    }

    KeySchedule_label4:
    for (j = 0; j < nk; ++j) {
#line 10 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 554 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 34 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 554 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#pragma HLS LOOP_TRIPCOUNT min=4 max=8 avg=6
 KeySchedule_label5:
        for (i = 0; i < 4; ++i) {
#line 11 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 557 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 35 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 557 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#pragma HLS LOOP_TRIPCOUNT min=4 max=4 avg=4
 word[i][j] = key[i + j * 4];
        }
    }


    KeySchedule_label6:
    for (j = nk; j < nb * (round_val + 1); ++j) {
#line 12 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 565 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 36 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 565 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#pragma HLS LOOP_TRIPCOUNT min=32 max=116 avg=74
 KeySchedule_label7:


        if ((j % nk) == 0) {
            temp[0] = Sbox[(word[1][j - 1] / 16)][(word[1][j - 1] % 16)] ^ Rcon0[(j / nk) - 1];
            temp[1] = Sbox[(word[2][j - 1] / 16)][(word[2][j - 1] % 16)];
            temp[2] = Sbox[(word[3][j - 1] / 16)][(word[3][j - 1] % 16)];
            temp[3] = Sbox[(word[0][j - 1] / 16)][(word[0][j - 1] % 16)];
        }
        else {
            temp[0] = word[0][j - 1];
            temp[1] = word[1][j - 1];
            temp[2] = word[2][j - 1];
            temp[3] = word[3][j - 1];
        }
#line 13 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 581 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 37 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 581 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"


        if (nk > 6 && j % nk == 4) {
            KeySchedule_label8:
            for (i = 0; i < 4; ++i) {
#line 14 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 585 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 38 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 585 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#pragma HLS LOOP_TRIPCOUNT min=4 max=4 avg=4
 temp[i] = Sbox[(temp[i] / 16)][(temp[i] % 16)];
            }
        }

        KeySchedule_label9:
        for (i = 0; i < 4; ++i) {
#line 15 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 592 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#line 39 "/home/gabriel/Documents/RAISE/dataset_gen/base_solutions/AES/temp/directives.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 592 "/home/gabriel/Documents/RAISE/dataset_gen/benchmarks/aes/aes_key.c"

#pragma HLS LOOP_TRIPCOUNT min=4 max=4 avg=4
 word[i][j] = word[i][j - nk] ^ temp[i];
        }
    }
    return 0;
}
