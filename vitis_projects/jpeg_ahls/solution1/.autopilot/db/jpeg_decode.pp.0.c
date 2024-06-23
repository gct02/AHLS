# 1 "benchmarks/chstone/jpeg/src/jpeg_decode.c"
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
# 1 "benchmarks/chstone/jpeg/src/jpeg_decode.c" 2
# 1 "benchmarks/chstone/jpeg/src/jpeg_decode.h" 1



# 1 "benchmarks/chstone/jpeg/src/constants.h" 1
# 5 "benchmarks/chstone/jpeg/src/jpeg_decode.h" 2

void jpeg_decode(
    unsigned char* readBuf,
    unsigned char outputVector[3][(128 * 128)],
    int OutData_image_width,
    int OutData_image_height,
    int OutData_comp_vpos[3],
    int OutData_comp_hpos[3]);
# 2 "benchmarks/chstone/jpeg/src/jpeg_decode.c" 2

# 1 "/usr/include/stdlib.h" 1 3 4
# 26 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 33 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 392 "/usr/include/features.h" 3 4
# 1 "/usr/include/features-time64.h" 1 3 4
# 20 "/usr/include/features-time64.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 21 "/usr/include/features-time64.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 1 3 4
# 19 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 20 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 2 3 4
# 22 "/usr/include/features-time64.h" 2 3 4
# 393 "/usr/include/features.h" 2 3 4
# 464 "/usr/include/features.h" 3 4
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 465 "/usr/include/features.h" 2 3 4
# 486 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 559 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 560 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/long-double.h" 1 3 4
# 561 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 487 "/usr/include/features.h" 2 3 4
# 510 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 511 "/usr/include/features.h" 2 3 4
# 34 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 2 3 4
# 27 "/usr/include/stdlib.h" 2 3 4





# 1 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stddef.h" 1 3 4
# 62 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 90 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stddef.h" 3 4
typedef int wchar_t;
# 33 "/usr/include/stdlib.h" 2 3 4







# 1 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 1 3 4
# 41 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 1 3 4
# 42 "/usr/include/stdlib.h" 2 3 4
# 56 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/floatn.h" 1 3 4
# 119 "/usr/include/x86_64-linux-gnu/bits/floatn.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/long-double.h" 1 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 2 3 4
# 214 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 3 4
typedef float _Float32;
# 251 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 3 4
typedef double _Float64;
# 268 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 3 4
typedef double _Float32x;
# 285 "/usr/include/x86_64-linux-gnu/bits/floatn-common.h" 3 4
typedef long double _Float64x;
# 120 "/usr/include/x86_64-linux-gnu/bits/floatn.h" 2 3 4
# 57 "/usr/include/stdlib.h" 2 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;





__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;
# 98 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ )) ;



extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;



__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;



extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 177 "/usr/include/stdlib.h" 3 4
extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));




__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 386 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) __attribute__ ((__nothrow__ )) ;


extern long int a64l (const char *__s)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





# 1 "/usr/include/x86_64-linux-gnu/sys/types.h" 1 3 4
# 29 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 1 3 4
# 19 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 20 "/usr/include/x86_64-linux-gnu/bits/timesize.h" 2 3 4
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
typedef long int __suseconds64_t;

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
# 30 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;


typedef __loff_t loff_t;




typedef __ino_t ino_t;
# 59 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;
# 97 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __pid_t pid_t;





typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;





# 1 "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h" 1 3 4






typedef __clock_t clock_t;
# 127 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/types/clockid_t.h" 1 3 4






typedef __clockid_t clockid_t;
# 129 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/bits/types/time_t.h" 3 4
typedef __time_t time_t;
# 130 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/timer_t.h" 1 3 4






typedef __timer_t timer_t;
# 131 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4
# 144 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stddef.h" 1 3 4
# 145 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;





# 1 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h" 3 4
typedef __int8_t int8_t;
typedef __int16_t int16_t;
typedef __int32_t int32_t;
typedef __int64_t int64_t;
# 156 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


typedef __uint8_t u_int8_t;
typedef __uint16_t u_int16_t;
typedef __uint32_t u_int32_t;
typedef __uint64_t u_int64_t;


typedef int register_t __attribute__ ((__mode__ (__word__)));
# 176 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 24 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/endian.h" 1 3 4
# 35 "/usr/include/x86_64-linux-gnu/bits/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/endianness.h" 1 3 4
# 36 "/usr/include/x86_64-linux-gnu/bits/endian.h" 2 3 4
# 25 "/usr/include/endian.h" 2 3 4
# 35 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 1 3 4
# 33 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline __uint16_t
__bswap_16 (__uint16_t __bsx)
{



  return ((__uint16_t) ((((__bsx) >> 8) & 0xff) | (((__bsx) & 0xff) << 8)));

}






static __inline __uint32_t
__bswap_32 (__uint32_t __bsx)
{



  return ((((__bsx) & 0xff000000u) >> 24) | (((__bsx) & 0x00ff0000u) >> 8) | (((__bsx) & 0x0000ff00u) << 8) | (((__bsx) & 0x000000ffu) << 24));

}
# 69 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
__extension__ static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{



  return ((((__bsx) & 0xff00000000000000ull) >> 56) | (((__bsx) & 0x00ff000000000000ull) >> 40) | (((__bsx) & 0x0000ff0000000000ull) >> 24) | (((__bsx) & 0x000000ff00000000ull) >> 8) | (((__bsx) & 0x00000000ff000000ull) << 8) | (((__bsx) & 0x0000000000ff0000ull) << 24) | (((__bsx) & 0x000000000000ff00ull) << 40) | (((__bsx) & 0x00000000000000ffull) << 56));

}
# 36 "/usr/include/endian.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h" 1 3 4
# 32 "/usr/include/x86_64-linux-gnu/bits/uintn-identity.h" 3 4
static __inline __uint16_t
__uint16_identity (__uint16_t __x)
{
  return __x;
}

static __inline __uint32_t
__uint32_identity (__uint32_t __x)
{
  return __x;
}

static __inline __uint64_t
__uint64_identity (__uint64_t __x)
{
  return __x;
}
# 37 "/usr/include/endian.h" 2 3 4
# 177 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/sys/select.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/select.h" 1 3 4
# 31 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h" 1 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/types/__sigset_t.h" 1 3 4




typedef struct
{
  unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
} __sigset_t;
# 5 "/usr/include/x86_64-linux-gnu/bits/types/sigset_t.h" 2 3 4


typedef __sigset_t sigset_t;
# 34 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h" 1 3 4







struct timeval
{




  __time_t tv_sec;
  __suseconds_t tv_usec;

};
# 38 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h" 3 4
struct timespec
{



  __time_t tv_sec;




  __syscall_slong_t tv_nsec;
# 31 "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h" 3 4
};
# 40 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



typedef __suseconds_t suseconds_t;





typedef long int __fd_mask;
# 59 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef struct
  {






    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];


  } fd_set;






typedef __fd_mask fd_mask;
# 102 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 127 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
# 180 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 227 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 1 3 4
# 44 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes-arch.h" 2 3 4
# 45 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/atomic_wide_counter.h" 1 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/atomic_wide_counter.h" 3 4
typedef union
{
  __extension__ unsigned long long int __value64;
  struct
  {
    unsigned int __low;
    unsigned int __high;
  } __value32;
} __atomic_wide_counter;
# 47 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 2 3 4




typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;

typedef struct __pthread_internal_slist
{
  struct __pthread_internal_slist *__next;
} __pthread_slist_t;
# 76 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h" 3 4
struct __pthread_mutex_s
{
  int __lock;
  unsigned int __count;
  int __owner;

  unsigned int __nusers;



  int __kind;

  short __spins;
  short __elision;
  __pthread_list_t __list;
# 53 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h" 3 4
};
# 77 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 2 3 4
# 89 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h" 3 4
struct __pthread_rwlock_arch_t
{
  unsigned int __readers;
  unsigned int __writers;
  unsigned int __wrphase_futex;
  unsigned int __writers_futex;
  unsigned int __pad3;
  unsigned int __pad4;

  int __cur_writer;
  int __shared;
  signed char __rwelision;




  unsigned char __pad1[7];


  unsigned long int __pad2;


  unsigned int __flags;
# 55 "/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h" 3 4
};
# 90 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h" 2 3 4




struct __pthread_cond_s
{
  __atomic_wide_counter __wseq;
  __atomic_wide_counter __g1_start;
  unsigned int __g_refs[2] ;
  unsigned int __g_size[2];
  unsigned int __g1_orig_size;
  unsigned int __wrefs;
  unsigned int __g_signals[2];
};

typedef unsigned int __tss_t;
typedef unsigned long int __thrd_t;

typedef struct
{
  int __data ;
} __once_flag;
# 24 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 2 3 4



typedef unsigned long int pthread_t;




typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;


union pthread_attr_t
{
  char __size[56];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;




typedef union
{
  struct __pthread_mutex_s __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;


typedef union
{
  struct __pthread_cond_s __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;





typedef union
{
  struct __pthread_rwlock_arch_t __data;
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 228 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4
# 396 "/usr/include/stdlib.h" 2 3 4






extern long int random (void) __attribute__ ((__nothrow__ ));


extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ ));





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));





extern int rand (void) __attribute__ ((__nothrow__ ));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ ));



extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ ));







extern double drand48 (void) __attribute__ ((__nothrow__ ));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) __attribute__ ((__nothrow__ ));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) __attribute__ ((__nothrow__ ));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ ));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;

  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));




extern void *malloc (size_t __size) __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__))
                                         ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) ;






extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__warn_unused_result__)) ;


extern void free (void *__ptr) __attribute__ ((__nothrow__ ));







extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__warn_unused_result__))

                       ;


extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ )) ;




# 1 "/usr/include/alloca.h" 1 3 4
# 24 "/usr/include/alloca.h" 3 4
# 1 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stddef.h" 1 3 4
# 25 "/usr/include/alloca.h" 2 3 4







extern void *alloca (size_t __size) __attribute__ ((__nothrow__ ));
# 575 "/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__))
                                         ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1))) ;
# 598 "/usr/include/stdlib.h" 3 4
extern void abort (void) __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 617 "/usr/include/stdlib.h" 3 4
extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));





extern void exit (int __status) __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));
# 636 "/usr/include/stdlib.h" 3 4
extern void _Exit (int __status) __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));




extern char *getenv (const char *__name) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1))) ;
# 654 "/usr/include/stdlib.h" 3 4
extern int putenv (char *__string) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));





extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) __attribute__ ((__nothrow__ ));
# 682 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 695 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 717 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
# 738 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1))) ;
# 791 "/usr/include/stdlib.h" 3 4
extern int system (const char *__command) ;
# 808 "/usr/include/stdlib.h" 3 4
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__ )) ;






typedef int (*__compar_fn_t) (const void *, const void *);
# 828 "/usr/include/stdlib.h" 3 4
extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;







extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 848 "/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;


__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;






extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;


__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;
# 880 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4, 5)));





extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ ));


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ ));


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ ));



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ ))
                                      ;

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ ))

                                    ;






extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1))) ;
# 967 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2, 3))) ;
# 1013 "/usr/include/stdlib.h" 3 4
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 1023 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 1 3 4
# 1024 "/usr/include/stdlib.h" 2 3 4
# 4 "benchmarks/chstone/jpeg/src/jpeg_decode.c" 2

char p_jinfo_data_precision;
short p_jinfo_image_height;
short p_jinfo_image_width;
char p_jinfo_num_components;
int p_jinfo_smp_fact;

char p_jinfo_comps_info_index[3];
char p_jinfo_comps_info_id[3];
char p_jinfo_comps_info_h_samp_factor[3];
char p_jinfo_comps_info_v_samp_factor[3];
char p_jinfo_comps_info_quant_tbl_no[3];
char p_jinfo_comps_info_dc_tbl_no[3];
char p_jinfo_comps_info_ac_tbl_no[3];

unsigned int p_jinfo_quant_tbl_quantval[4][64];

int p_jinfo_dc_xhuff_tbl_bits[2][36];
int p_jinfo_dc_xhuff_tbl_huffval[2][257];

int p_jinfo_ac_xhuff_tbl_bits[2][36];
int p_jinfo_ac_xhuff_tbl_huffval[2][257];

int p_jinfo_dc_dhuff_tbl_ml[2];
int p_jinfo_dc_dhuff_tbl_maxcode[2][36];
int p_jinfo_dc_dhuff_tbl_mincode[2][36];
int p_jinfo_dc_dhuff_tbl_valptr[2][36];

int p_jinfo_ac_dhuff_tbl_ml[2];
int p_jinfo_ac_dhuff_tbl_maxcode[2][36];
int p_jinfo_ac_dhuff_tbl_mincode[2][36];
int p_jinfo_ac_dhuff_tbl_valptr[2][36];

int p_jinfo_MCUWidth;
int p_jinfo_MCUHeight;
int p_jinfo_NumMCU;

unsigned char p_jinfo_jpeg_data;
unsigned char CurHuffReadBuf;

int rgb_buf[4][3][64];

const int zigzag_index[64] = {
    0, 1, 5, 6, 14, 15, 27, 28,
    2, 4, 7, 13, 16, 26, 29, 42,
    3, 8, 12, 17, 25, 30, 41, 43,
    9, 11, 18, 24, 31, 40, 44, 53,
    10, 19, 23, 32, 39, 45, 52, 54,
    20, 22, 33, 38, 46, 51, 55, 60,
    21, 34, 37, 47, 50, 56, 59, 61,
    35, 36, 48, 49, 57, 58, 62, 63
};
# 68 "benchmarks/chstone/jpeg/src/jpeg_decode.c"
int i_marker = 0;
const int out_unread_marker[10] = {0xd8,0xe0,0xdb,0xdb,0xc0,0xc4,0xc4,0xc4,0xc4,0xda};
# 87 "benchmarks/chstone/jpeg/src/jpeg_decode.c"
int out_length_get_sof = 17;
int out_data_precision_get_sof = 8;
int out_p_jinfo_image_height_get_sof = 59;
int out_p_jinfo_image_width_get_sof = 90;
int out_p_jinfo_num_components_get_sof = 3;
const int out_index_get_sof[3] = {0,1,2};
const int out_id_get_sof[3] = {1,2,3};
const int out_h_samp_factor_get_sof[3] = {2,1,1};
const int out_v_samp_factor_get_sof[3] = {2,1,1};
const int out_quant_tbl_no_get_sof[3] = {0,1,1};
# 109 "benchmarks/chstone/jpeg/src/jpeg_decode.c"
int i_get_sos = 0;
int out_length_get_sos = 12;
int out_num_comp_get_sos = 3;
const int out_comp_id_get_sos[3] = {1,2,3};
const int out_dc_tbl_no_get_sos[3] = {0,1,1};
const int out_ac_tbl_no_get_sos[3] = {0,1,1};
# 125 "benchmarks/chstone/jpeg/src/jpeg_decode.c"
int i_get_dht = 0;
const int out_length_get_dht[4] = {29,179,29,179};
const int out_index_get_dht[4] = {0x0,0x10,0x1,0x11};
const int out_count_get_dht[4] = {12,162,12,162};
# 139 "benchmarks/chstone/jpeg/src/jpeg_decode.c"
int i_get_dqt = 0;
const int out_length_get_dqt[2] = {65,65};
const int out_prec_get_dht[2] = {0,0};
const int out_num_get_dht[2] = {0,1};




const int izigzag_index[64] =
{0, 1, 8, 16, 9, 2, 3, 10,
 17, 24, 32, 25, 18, 11, 4, 5,
 12, 19, 26, 33, 40, 48, 41, 34,
 27, 20, 13, 6, 7, 14, 21, 28,
 35, 42, 49, 56, 57, 50, 43, 36,
 29, 22, 15, 23, 30, 37, 44, 51,
 58, 59, 52, 45, 38, 31, 39, 46,
 53, 60, 61, 54, 47, 55, 62, 63
};




static unsigned char ReadBuf;







void ChenIDct(int *x, int *y)
{
    register int i;
    register int *aptr;
    register int a0,a1,a2,a3;
    register int b0,b1,b2,b3;
    register int c0,c1,c2,c3;


    VITIS_LOOP_178_1: for (i = 0; i < 8; i++) {
        aptr = x+i;
        b0 = ((*aptr) << (2));
        aptr += 8;
        a0 = ((*aptr) << (2));
        aptr += 8;
        b2 = ((*aptr) << (2));
        aptr += 8;
        a1 = ((*aptr) << (2));
        aptr += 8;
        b1 = ((*aptr) << (2));
        aptr += 8;
        a2 = ((*aptr) << (2));
        aptr += 8;
        b3 = ((*aptr) << (2));
        aptr += 8;
        a3 = ((*aptr) << (2));





        c0 = ((((100L*a0)-(502L*a3))) >> (9));
        c1 = ((((426L*a2)-(284L*a1))) >> (9));
        c2 = ((((426L*a1)+(284L*a2))) >> (9));
        c3 = ((((502L*a0)+(100L*a3))) >> (9));



        a0 = (((362L*(b0+b1))) >> (9));
        a1 = (((362L*(b0-b1))) >> (9));

        a2 = ((((196L*b2)-(473L*b3))) >> (9));
        a3 = ((((473L*b2)+(196L*b3))) >> (9));

        b0 = a0+a3;
        b1 = a1+a2;
        b2 = a1-a2;
        b3 = a0-a3;



        a0 = c0+c1;
        a1 = c0-c1;
        a2 = c3-c2;
        a3 = c3+c2;

        c0 = a0;
        c1 = (((362L*(a2-a1))) >> (9));
        c2 = (((362L*(a2+a1))) >> (9));
        c3 = a3;

        aptr = y+i;
        *aptr = b0+c3;
        aptr += 8;
        *aptr = b1+c2;
        aptr += 8;
        *aptr = b2+c1;
        aptr += 8;
        *aptr = b3+c0;
        aptr += 8;
        *aptr = b3-c0;
        aptr += 8;
        *aptr = b2-c1;
        aptr += 8;
        *aptr = b1-c2;
        aptr += 8;
        *aptr = b0-c3;
    }


    VITIS_LOOP_249_2: for (i = 0; i < 8; i++) {
        aptr = y+((i) << (3));
        b0 = *(aptr++);
        a0 = *(aptr++);
        b2 = *(aptr++);
        a1 = *(aptr++);
        b1 = *(aptr++);
        a2 = *(aptr++);
        b3 = *(aptr++);
        a3 = *(aptr);






        c0 = ((((100L*a0)-(502L*a3))) >> (9));
        c1 = ((((426L*a2)-(284L*a1))) >> (9));
        c2 = ((((426L*a1)+(284L*a2))) >> (9));
        c3 = ((((502L*a0)+(100L*a3))) >> (9));



        a0 = (((362L*(b0+b1))) >> (9));
        a1 = (((362L*(b0-b1))) >> (9));

        a2 = ((((196L*b2)-(473L*b3))) >> (9));
        a3 = ((((473L*b2)+(196L*b3))) >> (9));



        b0 = a0+a3;
        b1 = a1+a2;
        b2 = a1-a2;
        b3 = a0-a3;



        a0 = c0+c1;
        a1 = c0-c1;
        a2 = c3-c2;
        a3 = c3+c2;

        c0 = a0;
        c1 = (((362L*(a2-a1))) >> (9));
        c2 = (((362L*(a2+a1))) >> (9));
        c3 = a3;

        aptr = y+((i) << (3));
        *(aptr++) = b0+c3;
        *(aptr++) = b1+c2;
        *(aptr++) = b2+c1;
        *(aptr++) = b3+c0;
        *(aptr++) = b3-c0;
        *(aptr++) = b2-c1;
        *(aptr++) = b1-c2;
        *(aptr) = b0-c3;
    }





    VITIS_LOOP_312_3: for (i = 0, aptr = y; i < 64; i++, aptr++)
        *aptr = (((*aptr<0) ? (*aptr-8) : (*aptr+8))/16);
}





void IZigzagMatrix(int *imatrix, int *omatrix)
{
    VITIS_LOOP_322_1: for (int i = 0; i < 64; i++) {
        *(omatrix++) = imatrix[zigzag_index[i]];
    }
}





void IQuantize(int *matrix, int *qmatrix)
{
    int *mptr;
    VITIS_LOOP_334_1: for (mptr = matrix; mptr < matrix + 64; mptr++) {
        *mptr = *mptr*(*qmatrix);
        qmatrix++;
    }
}





void PostshiftIDctMatrix(int *matrix,int shift)
{
    int *mptr;
    VITIS_LOOP_347_1: for (mptr = matrix; mptr < matrix + 64; mptr++) {
        *mptr += shift;
    }
}






void BoundIDctMatrix(int *matrix, int Bound)
{
    int *mptr;
    VITIS_LOOP_360_1: for (mptr = matrix; mptr < matrix + 64; mptr++) {
        if (*mptr < 0) {
            *mptr = 0;
        } else if (*mptr > Bound) {
            *mptr = Bound;
        }
    }
}



void WriteOneBlock(
    int *store, unsigned char *out_buf,
    int width, int height,
    int voffs, int hoffs)
{
    int i, e;


    VITIS_LOOP_379_1: for (i = voffs; i < voffs + 8; i++) {
        if (i >= height) break;
        int diff;
        diff = width * i;
        VITIS_LOOP_383_2: for (e = hoffs; e < hoffs + 8; e++){
            if (e >= width) break;
            out_buf[diff + e] = (unsigned char)(*(store++));
        }
    }
}
# 397 "benchmarks/chstone/jpeg/src/jpeg_decode.c"
void WriteBlock(int *store, int *p_out_vpos, int *p_out_hpos, unsigned char *p_out_buf)
{
    int voffs, hoffs;


    voffs = *p_out_vpos * 8;
    hoffs = *p_out_hpos * 8;


    WriteOneBlock(store, p_out_buf, p_jinfo_image_width,
                  p_jinfo_image_height, voffs, hoffs);


    p_out_hpos++;
    p_out_vpos++;

    if (*p_out_hpos < p_jinfo_MCUWidth) {
        p_out_vpos--;
    } else {
        *p_out_hpos = 0;
    }
}




void Write4Blocks(
    int *store1, int *store2, int *store3, int *store4,
    int *p_out_vpos, int *p_out_hpos, unsigned char *p_out_buf)
{
    int voffs,hoffs;





    voffs = *p_out_vpos * 8;
    hoffs = *p_out_hpos * 8;
    WriteOneBlock(store1, p_out_buf, p_jinfo_image_width,
                  p_jinfo_image_height, voffs, hoffs);




    hoffs += 8;
    WriteOneBlock(store2, p_out_buf, p_jinfo_image_width,
                  p_jinfo_image_height, voffs ,hoffs);




    voffs += 8;
    hoffs -= 8;
    WriteOneBlock(store3, p_out_buf, p_jinfo_image_width,
                  p_jinfo_image_height, voffs, hoffs);




    hoffs += 8;
    WriteOneBlock(store4, p_out_buf,p_jinfo_image_width,
                  p_jinfo_image_height, voffs, hoffs);




    *p_out_hpos = *p_out_hpos + 2;
    *p_out_vpos = *p_out_vpos + 2;

    if (*p_out_hpos < p_jinfo_MCUWidth) {
        *p_out_vpos = *p_out_vpos - 2;
    } else {
        *p_out_hpos = 0;
    }
}




void YuvToRgb(int p, int* y_buf, int* u_buf, int* v_buf)
{
    int r, g, b;
    int y, u, v;
    int i;

    VITIS_LOOP_482_1: for (i = 0; i < 64; i++) {
        y = y_buf[i];
        u = u_buf[i] - 128;
        v = v_buf[i] - 128;

        r = (y * 256 + v * 359 + 128) >> 8;
        g = (y * 256 - u * 88 - v * 182 + 128) >> 8;
        b = (y * 256 + u * 454 + 128 ) >> 8;

        if(r < 0)
            r = 0;
        else if(r > 255)
            r = 255;

        if(g < 0)
            g = 0;
        else if(g > 255)
            g = 255;

        if(b < 0)
            b = 0;
        else if(b > 255)
            b = 255;

        rgb_buf[p][0][i] = r;
        rgb_buf[p][1][i] = g;
        rgb_buf[p][2][i] = b;
    }
}


const static int extend_mask[20]={
    0xFFFFFFFE,0xFFFFFFFC,0xFFFFFFF8,0xFFFFFFF0,0xFFFFFFE0,0xFFFFFFC0,
    0xFFFFFF80,0xFFFFFF00,0xFFFFFE00,0xFFFFFC00,0xFFFFF800,0xFFFFF000,
    0xFFFFE000,0xFFFFC000,0xFFFF8000,0xFFFF0000,0xFFFE0000,0xFFFC0000,
    0xFFF80000,0xFFF00000
};



const int bit_set_mask[32] = {
    0x00000001,0x00000002,0x00000004,0x00000008,
    0x00000010,0x00000020,0x00000040,0x00000080,
    0x00000100,0x00000200,0x00000400,0x00000800,
    0x00001000,0x00002000,0x00004000,0x00008000,
    0x00010000,0x00020000,0x00040000,0x00080000,
    0x00100000,0x00200000,0x00400000,0x00800000,
    0x01000000,0x02000000,0x04000000,0x08000000,
    0x10000000,0x20000000,0x40000000,0x80000000
};
const int lmask[32] = {
    0x00000001,0x00000003,0x00000007,0x0000000f,
    0x0000001f,0x0000003f,0x0000007f,0x000000ff,
    0x000001ff,0x000003ff,0x000007ff,0x00000fff,
    0x00001fff,0x00003fff,0x00007fff,0x0000ffff,
    0x0001ffff,0x0003ffff,0x0007ffff,0x000fffff,
    0x001fffff,0x003fffff,0x007fffff,0x00ffffff,
    0x01ffffff,0x03ffffff,0x07ffffff,0x0fffffff,
    0x1fffffff,0x3fffffff,0x7fffffff,0xffffffff
};

static unsigned int current_read_byte;
static int read_position = -1;





static int
pgetc()
{
    int temp;

    if ((temp = CurHuffReadBuf++)==0xff){
        if ((temp = CurHuffReadBuf++)){

        }else{
            return(0xff);
        }
    }
    return(temp);
}





int
buf_getb()
{
    if (read_position < 0){
        current_read_byte = pgetc();
        read_position=7;
    }

    if (current_read_byte & bit_set_mask[read_position--]){
        return(1);
    }
    return(0);
}






int
buf_getv(int n){
    int p,rv;

    n--;
    p = n - read_position;
    VITIS_LOOP_594_1: while(p > 0){
        if (read_position>23){
            rv = (current_read_byte << p);
            current_read_byte = pgetc();

            rv |= (current_read_byte >> (8 - p));
            read_position = 7 - p;
            return(rv & lmask[n]);

        }
        current_read_byte = (current_read_byte << 8) | pgetc();
        read_position += 8;
        p -= 8;
    }

    if (!p){
        read_position = -1;

        return(current_read_byte & lmask[n]);
    }

    p = -p;

    read_position = p-1;
    return((current_read_byte >> p) & lmask[n]);
}






int huff_make_dhuff_tb(int *p_xhtbl_bits, int *p_dhtbl_maxcode, int *p_dhtbl_mincode, int *p_dhtbl_valptr)
{
    int i,j,p,code,size,l;
    int huffsize[257];
    int huffcode[257];
    int lastp;
    int p_dhtbl_ml;




    VITIS_LOOP_637_1: for(p = 0, i = 1; i < 17; i++){
        VITIS_LOOP_638_2: for(j = 1; j <= p_xhtbl_bits[i]; j++){
            huffsize[p++] = i;
        }
    }

    huffsize[p] = 0;
    lastp = p;

    p=0;
    code=0;
    size = huffsize[0];
    VITIS_LOOP_649_3: while(1){
        VITIS_LOOP_650_4: do{
            huffcode[p++] = code++;
        }while((huffsize[p]==size)&&(p<257));

        if (!huffsize[p]){
            break;
        }
        VITIS_LOOP_657_5: do{

            code <<= 1;
            size++;
        }while(huffsize[p] != size);
    }

    VITIS_LOOP_664_6: for(p_dhtbl_ml=1,p=0,l=1;l<=16;l++){
        if (p_xhtbl_bits[l]==0){
            p_dhtbl_maxcode[l] = -1;
        }else{
            p_dhtbl_valptr[l]=p;
            p_dhtbl_mincode[l]=huffcode[p];
            p+=p_xhtbl_bits[l]-1;
            p_dhtbl_maxcode[l]=huffcode[p];
            p_dhtbl_ml = l;
            p++;
        }
    }
    p_dhtbl_maxcode[p_dhtbl_ml]++;
     return p_dhtbl_ml;
}

int DecodeHuffman(
    int *Xhuff_huffval, int Dhuff_ml,
    int *Dhuff_maxcode, int *Dhuff_mincode,
    int *Dhuff_valptr)
{
    int code,l,p;

    code = buf_getb();
    VITIS_LOOP_688_1: for(l = 1; code > Dhuff_maxcode[l]; l++){
        code = (code<<1) + buf_getb();
    }

    if(code < Dhuff_maxcode[Dhuff_ml]){
        p = Dhuff_valptr[l] + code - Dhuff_mincode[l];
        return(Xhuff_huffval[p]);
    }




   return 0;
}




void DecodeHuffMCU(int *out_buf, int num_cmp)
{
    int s,diff,tbl_no,*mptr,k,n,r;




    tbl_no = p_jinfo_comps_info_dc_tbl_no[num_cmp];
    s = DecodeHuffman(&p_jinfo_dc_xhuff_tbl_huffval[tbl_no][0],
                      p_jinfo_dc_dhuff_tbl_ml[tbl_no],
                      &p_jinfo_dc_dhuff_tbl_maxcode[tbl_no][0],
                      &p_jinfo_dc_dhuff_tbl_mincode[tbl_no][0],
                      &p_jinfo_dc_dhuff_tbl_valptr[tbl_no][0]);

    if(s){
        diff = buf_getv(s);
        s--;
        if ((diff & bit_set_mask[s]) == 0){
            diff |= extend_mask[s];
            diff++;
        }

        diff += *out_buf;
        *out_buf = diff;
    }





    VITIS_LOOP_736_1: for(mptr = out_buf + 1; mptr < out_buf + 64; mptr++){
        *mptr=0;
    }

    VITIS_LOOP_740_2: for(k=1; k< 64;){
        r = DecodeHuffman(&p_jinfo_ac_xhuff_tbl_huffval[tbl_no][0],
                          p_jinfo_ac_dhuff_tbl_ml[tbl_no],
                          &p_jinfo_ac_dhuff_tbl_maxcode[tbl_no][0],
                          &p_jinfo_ac_dhuff_tbl_mincode[tbl_no][0],
                          &p_jinfo_ac_dhuff_tbl_valptr[tbl_no][0]);

        s = r & 0xf;
        n = (r >> 4) & 0xf;

        if(s){
            if((k += n) >= 64)
                break;
            out_buf[k] = buf_getv(s);
            s--;
            if ((out_buf[k] & bit_set_mask[s]) == 0){
                out_buf[k] |= extend_mask[s];
                out_buf[k]++;
            }
            k++;
        }else if (n == 15)
            k += 16;
        else{
            break;
        }
    }
}


void decode_block(int comp_no, int *out_buf, int *HuffBuff)
{
    int QuantBuff[64];
    unsigned int* p_quant_tbl;

    DecodeHuffMCU(HuffBuff, comp_no);

    IZigzagMatrix(HuffBuff, QuantBuff);

    p_quant_tbl = &p_jinfo_quant_tbl_quantval[(int)p_jinfo_comps_info_quant_tbl_no[comp_no]][64];
    IQuantize(QuantBuff, (int *)p_quant_tbl);

    ChenIDct(QuantBuff, out_buf);

    PostshiftIDctMatrix(out_buf, 128);

    BoundIDctMatrix(out_buf, 255);

}

void decode(
    int* out_data_image_width,
    int* out_data_image_height,
    int* out_data_comp_vpos,
    int* out_data_comp_hpos,
    unsigned char outputVector[3][(128 * 128)])
{
    int i;
    int CurrentMCU = 0;
    int HuffBuff[3][64];
    int IDCTBuff[6][64];


    CurHuffReadBuf = p_jinfo_jpeg_data;


    VITIS_LOOP_805_1: for (i = 0; i < 3; i++) {
        HuffBuff[i][0] = 0;
    }


    *out_data_image_width = p_jinfo_image_width;
    *out_data_image_height = p_jinfo_image_height;


    VITIS_LOOP_814_2: for (i = 0; i < 3; i++) {
        out_data_comp_vpos[i] = 0;
        out_data_comp_hpos[i] = 0;
    }


    if (p_jinfo_smp_fact == 0) {



        VITIS_LOOP_824_3: while (CurrentMCU < p_jinfo_NumMCU) {
            VITIS_LOOP_825_4: for (i = 0; i < 3; i++) {
                decode_block(i, IDCTBuff[i], HuffBuff[i]);
            }

            YuvToRgb(0,IDCTBuff[0],IDCTBuff[1],IDCTBuff[2]);


            VITIS_LOOP_832_5: for (i = 0; i < 3; i++) {
                WriteBlock(&rgb_buf[0][i][0], &out_data_comp_vpos[i],
                           &out_data_comp_hpos[i], &outputVector[i][0]);
            }
            CurrentMCU++;
        }
    } else {


        VITIS_LOOP_841_6: while (CurrentMCU < p_jinfo_NumMCU) {




            VITIS_LOOP_846_7: for (i = 0; i < 4; i++) {
                decode_block(0, IDCTBuff[i], HuffBuff[0]);
            }


            decode_block(1, IDCTBuff[4], HuffBuff[1]);


            decode_block(2, IDCTBuff[5], HuffBuff[2]);


            VITIS_LOOP_857_8: for (i = 0; i < 4; i++) {
                YuvToRgb(i,IDCTBuff[i],IDCTBuff[4],IDCTBuff[5]);
            }

            VITIS_LOOP_861_9: for (i = 0; i < 3; i++) {
                Write4Blocks(&rgb_buf[0][i][0], &rgb_buf[1][i][0],
                             &rgb_buf[2][i][0], &rgb_buf[3][i][0],
                             &out_data_comp_vpos[i],
                             &out_data_comp_hpos[i],
                             &outputVector[i][0]);
            }
            CurrentMCU += 4;
        }
    }
}




int read_byte()
{
    return ReadBuf++;
}

short read_word()
{
    short c;

    c = ReadBuf++ << 8;
    c |= ReadBuf++;

    return c;
}

int read_dword()
{
    int c;

    c = ReadBuf++ << 24;
    c |= ReadBuf++ << 16;
    c |= ReadBuf++ << 8;
    c |= ReadBuf++;

    return c;
}

int first_marker()
{
    int c1,c2;
    c1 = read_byte();
    c2 = read_byte();
# 916 "benchmarks/chstone/jpeg/src/jpeg_decode.c"
    return c2;
}


int next_marker()
{
    int c;

    VITIS_LOOP_924_1: for(;;){
        c = read_byte();

        VITIS_LOOP_927_2: while(c != 0xff)
            c = read_byte();

        VITIS_LOOP_930_3: do{
            c = read_byte();
        }while( c == 0xff);
        if(c != 0)
            break;
    }
    return c;
}




void get_sof()
{
    int ci,c;
    int length;
    char p_comp_info_index;
    char p_comp_info_id;
    char p_comp_info_h_samp_factor;
    char p_comp_info_v_samp_factor;
    char p_comp_info_quant_tbl_no;
    char p_comp_info_dc_tbl_no;
    char p_comp_info_ac_tbl_no;

    length = read_word();
    p_jinfo_data_precision = read_byte();
    p_jinfo_image_height = read_word();
    p_jinfo_image_width = read_word();
    p_jinfo_num_components = read_byte();
# 967 "benchmarks/chstone/jpeg/src/jpeg_decode.c"
    length -= 8;




    VITIS_LOOP_972_1: for(ci = 0; ci < p_jinfo_num_components; ci++){
        p_comp_info_index = p_jinfo_comps_info_index[ci];
        p_comp_info_id = p_jinfo_comps_info_id[ci];
        p_comp_info_h_samp_factor = p_jinfo_comps_info_h_samp_factor[ci];
        p_comp_info_v_samp_factor = p_jinfo_comps_info_v_samp_factor[ci];
        p_comp_info_quant_tbl_no = p_jinfo_comps_info_quant_tbl_no[ci];

        p_comp_info_index = ci;
        p_comp_info_id = read_byte();
        c = read_byte();
        p_comp_info_h_samp_factor = (c >> 4) & 15;
        p_comp_info_v_samp_factor = (c ) & 15;
        p_comp_info_quant_tbl_no = read_byte();







    }





    if(p_jinfo_comps_info_h_samp_factor[0] == 2){
        p_jinfo_smp_fact = 2;

    }else{
        p_jinfo_smp_fact = 0;

    }
}

void get_sos()
{
    int length,num_comp;
    int i,c,cc,ci,j;
    char p_comp_info_index;
    char p_comp_info_id;
    char p_comp_info_h_samp_factor;
    char p_comp_info_v_samp_factor;
    char p_comp_info_quant_tbl_no;
    char p_comp_info_dc_tbl_no;
    char p_comp_info_ac_tbl_no;
    int id_found = 0;

    length = read_word();
    num_comp = read_byte();





    VITIS_LOOP_1027_1: for(i = 0; i < num_comp; i++){
        cc = read_byte();
        c = read_byte();

        VITIS_LOOP_1031_2: for(ci = 0; ci < p_jinfo_num_components; ci++){
            p_comp_info_id = p_jinfo_comps_info_id[ci];
         p_comp_info_dc_tbl_no = p_jinfo_comps_info_dc_tbl_no[ci];
         p_comp_info_ac_tbl_no = p_jinfo_comps_info_ac_tbl_no[ci];

            if(cc == p_comp_info_id) {
                id_found = 1;
                break;
            }
        }







        p_comp_info_dc_tbl_no = (c >> 4) & 15;
        p_comp_info_ac_tbl_no = (c ) & 15;





        i_get_sos++;
    }


    j = 3;
    VITIS_LOOP_1060_3: while (j--)
    {
      c = read_byte ();
    }




    p_jinfo_jpeg_data = ReadBuf;
}




void get_dht()
{
    int length;
    int index,i,count;
 int *p_xhtbl_bits;
 int *p_xhtbl_huffval;

    length = read_word();
    length -=2;



    VITIS_LOOP_1086_1: while(length > 16){
        index = read_byte();



        if(index & 0x10){

            index -= 0x10;
            p_xhtbl_bits = p_jinfo_ac_xhuff_tbl_bits[index];
            p_xhtbl_huffval = p_jinfo_ac_xhuff_tbl_huffval[index];
        }else{

            p_xhtbl_bits = p_jinfo_dc_xhuff_tbl_bits[index];
            p_xhtbl_huffval = p_jinfo_dc_xhuff_tbl_huffval[index];
        }

        count = 0;

        VITIS_LOOP_1104_2: for(i = 1; i <= 16; i++){
   p_xhtbl_bits[i] = read_byte();
   count += p_xhtbl_bits[i];
        }



        i_get_dht++;

        length -= 1 + 16;

        VITIS_LOOP_1115_3: for(i = 0; i < count; i++){
   p_xhtbl_huffval[i] = read_byte();
        }

        length -= count;
    }
}

void get_dqt()
{
    int length;
    int prec,num,i;
    unsigned int tmp;
    unsigned int *p_quant_tbl;

    length = read_word();
    length -=2;



    VITIS_LOOP_1135_1: while(length > 0){
        num = read_byte();

        prec = num >> 4;

        num &= 0x0f;




        i_get_dqt++;

        p_quant_tbl = &p_jinfo_quant_tbl_quantval[num][64];
        VITIS_LOOP_1148_2: for(i = 0; i < 64; i++){
            if(prec)
                tmp = read_word();
            else
                tmp = read_byte();
            p_quant_tbl[izigzag_index[i]] = (unsigned short)tmp;
        }

        length -= 64 +1;
        if (prec) length -= 64;
    }
}

void read_markers(unsigned char* buf)
{
    int unread_marker;
    int sow_SOI;

    ReadBuf = (unsigned char)buf;
    sow_SOI = 0;
    unread_marker = 0;


    VITIS_LOOP_1171_1: for(;;) {
        if (!sow_SOI){
            unread_marker = first_marker();
        } else {
            unread_marker = next_marker();
        }



        switch (unread_marker) {
            case 0xd8:
                sow_SOI = 1;
                break;
            case 0xc0:
                get_sof();
                break;
            case 0xda:
                get_sos();
                return;
            case 0xc4:
                get_dht();
                break;
            case 0xdb:
                get_dqt();
                break;
            case 0xd9:
                return;
        }
    }
}

void jpeg_init_decompress()
{
 int tmp;


    p_jinfo_MCUHeight = (p_jinfo_image_height - 1) / 8 + 1;
    p_jinfo_MCUWidth = (p_jinfo_image_width - 1) / 8 + 1;
    p_jinfo_NumMCU = p_jinfo_MCUHeight * p_jinfo_MCUWidth;


    tmp = huff_make_dhuff_tb(&p_jinfo_dc_xhuff_tbl_bits[0][0],
                             &p_jinfo_dc_dhuff_tbl_maxcode[0][0],
                             &p_jinfo_dc_dhuff_tbl_mincode[0][0],
                             &p_jinfo_dc_dhuff_tbl_valptr[0][0]);
    p_jinfo_dc_dhuff_tbl_ml[0] = tmp;
    tmp = huff_make_dhuff_tb(&p_jinfo_dc_xhuff_tbl_bits[1][0],
                             &p_jinfo_dc_dhuff_tbl_maxcode[1][0],
                             &p_jinfo_dc_dhuff_tbl_mincode[1][0],
                             &p_jinfo_dc_dhuff_tbl_valptr[1][0]);
    p_jinfo_dc_dhuff_tbl_ml[1] = tmp;
    tmp = huff_make_dhuff_tb(&p_jinfo_ac_xhuff_tbl_bits[0][0],
                             &p_jinfo_ac_dhuff_tbl_maxcode[0][0],
                             &p_jinfo_ac_dhuff_tbl_mincode[0][0],
                             &p_jinfo_ac_dhuff_tbl_valptr[0][0]);
    p_jinfo_ac_dhuff_tbl_ml[0] = tmp;
    tmp = huff_make_dhuff_tb(&p_jinfo_ac_xhuff_tbl_bits[1][0],
                             &p_jinfo_ac_dhuff_tbl_maxcode[1][0],
                             &p_jinfo_ac_dhuff_tbl_mincode[1][0],
                             &p_jinfo_ac_dhuff_tbl_valptr[1][0]);
    p_jinfo_ac_dhuff_tbl_ml[1] = tmp;
}

void jpeg_decode(
    unsigned char* readBuf,
    unsigned char outputVector[3][(128 * 128)],
    int OutData_image_width,
    int OutData_image_height,
    int OutData_comp_vpos[3],
    int OutData_comp_hpos[3])
{
    read_markers(readBuf);


    jpeg_init_decompress();


    decode(&OutData_image_width, &OutData_image_height,
           &OutData_comp_vpos[0], &OutData_comp_hpos[0],
           outputVector);
}
