# 1 "HLS-benchmarks/Inter-Block/fft/fft.cpp"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 376 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/tools/Xilinx/Vitis_HLS/2023.2/common/technology/autopilot/etc/autopilot_ssdm_op.h" 1
# 105 "/tools/Xilinx/Vitis_HLS/2023.2/common/technology/autopilot/etc/autopilot_ssdm_op.h"
extern "C" {






    void _ssdm_op_IfRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_IfWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));


    void _ssdm_StreamRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_StreamWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanWrite(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned _ssdm_StreamSize(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_ReadReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_Read(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_WriteReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_Write(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbReadReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_CanReadReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbWriteReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_CanWriteReq(...) __attribute__ ((nothrow)) __attribute__((overloadable));




    void _ssdm_op_MemShiftRead(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_PrintNone(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_PrintInt(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_PrintDouble(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_Wait(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_Poll(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_Return(...) __attribute__ ((nothrow)) __attribute__((overloadable));


    void _ssdm_op_SpecSynModule(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecTopModule(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecProcessDecl(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecProcessDef(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecPort(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecConnection(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecChannel(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecSensitive(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecModuleInst(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecPortMap(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecReset(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecPlatform(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecClockDomain(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecPowerDomain(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    int _ssdm_op_SpecRegionBegin(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    int _ssdm_op_SpecRegionEnd(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecLoopName(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecLoopTripCount(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    int _ssdm_op_SpecStateBegin(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    int _ssdm_op_SpecStateEnd(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecInterface(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecPipeline(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecDataflowPipeline(...) __attribute__ ((nothrow)) __attribute__((overloadable));


    void _ssdm_op_SpecLatency(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecParallel(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecProtocol(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecOccurrence(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecResource(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecResourceLimit(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecCHCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecFUCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecIFCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecIPCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecMemCore(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecExt(...) __attribute__ ((nothrow)) __attribute__((overloadable));




    void _ssdm_SpecArrayDimSize(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_RegionBegin(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_RegionEnd(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_Unroll(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_UnrollRegion(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_InlineAll(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_InlineLoop(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_Inline(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_InlineSelf(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_InlineRegion(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecArrayMap(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecArrayPartition(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecArrayReshape(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecStream(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecStable(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecStableContent(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecBindPort(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecPipoDepth(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecExpr(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecExprBalance(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecDependence(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecLoopMerge(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecLoopFlatten(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecLoopRewind(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_SpecFuncInstantiation(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecFuncBuffer(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecFuncExtract(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecConstant(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_DataPack(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_SpecDataPack(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void _ssdm_op_SpecBitsMap(...) __attribute__ ((nothrow)) __attribute__((overloadable));
    void _ssdm_op_SpecLicense(...) __attribute__ ((nothrow)) __attribute__((overloadable));

    void __xilinx_ip_top(...) __attribute__ ((nothrow)) __attribute__((overloadable));


}
# 2 "<built-in>" 2
# 1 "HLS-benchmarks/Inter-Block/fft/fft.cpp" 2
# 1 "HLS-benchmarks/Inter-Block/fft/fft.h" 1
typedef float in_float_t;
typedef float out_float_t;
typedef float inout_float_t;

__attribute__((sdx_kernel("fft", 0))) void fft(inout_float_t X_R_0[1024], inout_float_t X_R_1[1024],
         inout_float_t X_R_2[1024], inout_float_t X_R_3[1024],
         inout_float_t X_R_4[1024], inout_float_t X_R_5[1024],
         inout_float_t X_R_6[1024], inout_float_t X_R_7[1024],
         inout_float_t X_I_0[1024], inout_float_t X_I_1[1024],
         inout_float_t X_I_2[1024], inout_float_t X_I_3[1024],
         inout_float_t X_I_4[1024], inout_float_t X_I_5[1024],
         inout_float_t X_I_6[1024], inout_float_t X_I_7[1024],
         in_float_t cos_coefficients_table[512],
         in_float_t sin_coefficients_table[512]);
# 2 "HLS-benchmarks/Inter-Block/fft/fft.cpp" 2







# 1 "HLS-benchmarks/Inter-Block/fft/fft.h" 1
typedef float in_float_t;
typedef float out_float_t;
typedef float inout_float_t;

__attribute__((sdx_kernel("fft", 0))) void fft(inout_float_t X_R_0[1024], inout_float_t X_R_1[1024],
         inout_float_t X_R_2[1024], inout_float_t X_R_3[1024],
         inout_float_t X_R_4[1024], inout_float_t X_R_5[1024],
         inout_float_t X_R_6[1024], inout_float_t X_R_7[1024],
         inout_float_t X_I_0[1024], inout_float_t X_I_1[1024],
         inout_float_t X_I_2[1024], inout_float_t X_I_3[1024],
         inout_float_t X_I_4[1024], inout_float_t X_I_5[1024],
         inout_float_t X_I_6[1024], inout_float_t X_I_7[1024],
         in_float_t cos_coefficients_table[512],
         in_float_t sin_coefficients_table[512]);
# 10 "HLS-benchmarks/Inter-Block/fft/fft.cpp" 2
# 1 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/stdlib.h" 1 3
# 36 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/stdlib.h" 3
# 1 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/cstdlib" 1 3
# 40 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/cstdlib" 3

# 1 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/x86_64-pc-linux-gnu/bits/c++config.h" 1 3
# 236 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/x86_64-pc-linux-gnu/bits/c++config.h" 3
namespace std
{
  typedef long unsigned int size_t;
  typedef long int ptrdiff_t;


  typedef decltype(nullptr) nullptr_t;

}
# 258 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/x86_64-pc-linux-gnu/bits/c++config.h" 3
namespace std
{
  inline namespace __cxx11 __attribute__((__abi_tag__ ("cxx11"))) { }
}
namespace __gnu_cxx
{
  inline namespace __cxx11 __attribute__((__abi_tag__ ("cxx11"))) { }
}
# 508 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/x86_64-pc-linux-gnu/bits/c++config.h" 3
# 1 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/x86_64-pc-linux-gnu/bits/os_defines.h" 1 3
# 39 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/x86_64-pc-linux-gnu/bits/os_defines.h" 3
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
# 40 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/x86_64-pc-linux-gnu/bits/os_defines.h" 2 3
# 509 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/x86_64-pc-linux-gnu/bits/c++config.h" 2 3


# 1 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/x86_64-pc-linux-gnu/bits/cpu_defines.h" 1 3
# 512 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/x86_64-pc-linux-gnu/bits/c++config.h" 2 3
# 42 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/cstdlib" 2 3
# 75 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/cstdlib" 3
# 1 "/usr/include/stdlib.h" 1 3 4
# 26 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libc-header-start.h" 1 3 4
# 27 "/usr/include/stdlib.h" 2 3 4





# 1 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stddef.h" 1 3 4
# 62 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 33 "/usr/include/stdlib.h" 2 3 4

extern "C" {






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
extern size_t __ctype_get_mb_cur_max (void) noexcept (true) ;



extern double atof (const char *__nptr)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;



__extension__ extern long long int atoll (const char *__nptr)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;



extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     noexcept (true) __attribute__ ((__nonnull__ (1)));



extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) noexcept (true) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
# 141 "/usr/include/stdlib.h" 3 4
extern _Float32 strtof32 (const char *__restrict __nptr,
     char **__restrict __endptr)
     noexcept (true) __attribute__ ((__nonnull__ (1)));



extern _Float64 strtof64 (const char *__restrict __nptr,
     char **__restrict __endptr)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
# 159 "/usr/include/stdlib.h" 3 4
extern _Float32x strtof32x (const char *__restrict __nptr,
       char **__restrict __endptr)
     noexcept (true) __attribute__ ((__nonnull__ (1)));



extern _Float64x strtof64x (const char *__restrict __nptr,
       char **__restrict __endptr)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
# 177 "/usr/include/stdlib.h" 3 4
extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     noexcept (true) __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     noexcept (true) __attribute__ ((__nonnull__ (1)));



__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     noexcept (true) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     noexcept (true) __attribute__ ((__nonnull__ (1)));




__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     noexcept (true) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     noexcept (true) __attribute__ ((__nonnull__ (1)));




extern int strfromd (char *__dest, size_t __size, const char *__format,
       double __f)
     noexcept (true) __attribute__ ((__nonnull__ (3)));

extern int strfromf (char *__dest, size_t __size, const char *__format,
       float __f)
     noexcept (true) __attribute__ ((__nonnull__ (3)));

extern int strfroml (char *__dest, size_t __size, const char *__format,
       long double __f)
     noexcept (true) __attribute__ ((__nonnull__ (3)));
# 233 "/usr/include/stdlib.h" 3 4
extern int strfromf32 (char *__dest, size_t __size, const char * __format,
         _Float32 __f)
     noexcept (true) __attribute__ ((__nonnull__ (3)));



extern int strfromf64 (char *__dest, size_t __size, const char * __format,
         _Float64 __f)
     noexcept (true) __attribute__ ((__nonnull__ (3)));
# 251 "/usr/include/stdlib.h" 3 4
extern int strfromf32x (char *__dest, size_t __size, const char * __format,
   _Float32x __f)
     noexcept (true) __attribute__ ((__nonnull__ (3)));



extern int strfromf64x (char *__dest, size_t __size, const char * __format,
   _Float64x __f)
     noexcept (true) __attribute__ ((__nonnull__ (3)));
# 273 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/__locale_t.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types/__locale_t.h" 3 4
struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
};

typedef struct __locale_struct *__locale_t;
# 23 "/usr/include/x86_64-linux-gnu/bits/types/locale_t.h" 2 3 4

typedef __locale_t locale_t;
# 274 "/usr/include/stdlib.h" 2 3 4

extern long int strtol_l (const char *__restrict __nptr,
     char **__restrict __endptr, int __base,
     locale_t __loc) noexcept (true) __attribute__ ((__nonnull__ (1, 4)));

extern unsigned long int strtoul_l (const char *__restrict __nptr,
        char **__restrict __endptr,
        int __base, locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 4)));

__extension__
extern long long int strtoll_l (const char *__restrict __nptr,
    char **__restrict __endptr, int __base,
    locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 4)));

__extension__
extern unsigned long long int strtoull_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       int __base, locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 4)));

extern double strtod_l (const char *__restrict __nptr,
   char **__restrict __endptr, locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 3)));

extern float strtof_l (const char *__restrict __nptr,
         char **__restrict __endptr, locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 3)));

extern long double strtold_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 3)));
# 317 "/usr/include/stdlib.h" 3 4
extern _Float32 strtof32_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 3)));



extern _Float64 strtof64_l (const char *__restrict __nptr,
       char **__restrict __endptr,
       locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 3)));
# 338 "/usr/include/stdlib.h" 3 4
extern _Float32x strtof32x_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 3)));



extern _Float64x strtof64x_l (const char *__restrict __nptr,
         char **__restrict __endptr,
         locale_t __loc)
     noexcept (true) __attribute__ ((__nonnull__ (1, 3)));
# 386 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) noexcept (true) ;


extern long int a64l (const char *__s)
     noexcept (true) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





# 1 "/usr/include/x86_64-linux-gnu/sys/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
extern "C" {


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






typedef __ino64_t ino64_t;




typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;






typedef __off64_t off64_t;




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



typedef __useconds_t useconds_t;



typedef __suseconds_t suseconds_t;






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
# 49 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef long int __fd_mask;
# 59 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef struct
  {



    __fd_mask fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];





  } fd_set;






typedef __fd_mask fd_mask;
# 91 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern "C" {
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
# 153 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
}
# 180 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 219 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __blkcnt64_t blkcnt64_t;
typedef __fsblkcnt64_t fsblkcnt64_t;
typedef __fsfilcnt64_t fsfilcnt64_t;






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


}
# 396 "/usr/include/stdlib.h" 2 3 4






extern long int random (void) noexcept (true);


extern void srandom (unsigned int __seed) noexcept (true);





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) noexcept (true) __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) noexcept (true) __attribute__ ((__nonnull__ (1)));







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
       int32_t *__restrict __result) noexcept (true) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     noexcept (true) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     noexcept (true) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));





extern int rand (void) noexcept (true);

extern void srand (unsigned int __seed) noexcept (true);



extern int rand_r (unsigned int *__seed) noexcept (true);







extern double drand48 (void) noexcept (true);
extern double erand48 (unsigned short int __xsubi[3]) noexcept (true) __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) noexcept (true);
extern long int nrand48 (unsigned short int __xsubi[3])
     noexcept (true) __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) noexcept (true);
extern long int jrand48 (unsigned short int __xsubi[3])
     noexcept (true) __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) noexcept (true);
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     noexcept (true) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) noexcept (true) __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;

  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) noexcept (true) __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     noexcept (true) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) noexcept (true) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2)));




extern void *malloc (size_t __size) noexcept (true) __attribute__ ((__malloc__))
                                         ;

extern void *calloc (size_t __nmemb, size_t __size)
     noexcept (true) __attribute__ ((__malloc__)) ;






extern void *realloc (void *__ptr, size_t __size)
     noexcept (true) __attribute__ ((__warn_unused_result__)) ;


extern void free (void *__ptr) noexcept (true);







extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     noexcept (true) __attribute__ ((__warn_unused_result__))

                       ;


extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     noexcept (true) ;




# 1 "/usr/include/alloca.h" 1 3 4
# 24 "/usr/include/alloca.h" 3 4
# 1 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stddef.h" 1 3 4
# 25 "/usr/include/alloca.h" 2 3 4

extern "C" {





extern void *alloca (size_t __size) noexcept (true);





}
# 575 "/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) noexcept (true) __attribute__ ((__malloc__))
                                         ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     noexcept (true) __attribute__ ((__nonnull__ (1))) ;




extern void *aligned_alloc (size_t __alignment, size_t __size)
     noexcept (true) __attribute__ ((__malloc__)) __attribute__ ((__alloc_align__ (1)))
                                         ;



extern void abort (void) noexcept (true) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) noexcept (true) __attribute__ ((__nonnull__ (1)));




extern "C++" int at_quick_exit (void (*__func) (void))
     noexcept (true) __asm ("at_quick_exit") __attribute__ ((__nonnull__ (1)));
# 617 "/usr/include/stdlib.h" 3 4
extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     noexcept (true) __attribute__ ((__nonnull__ (1)));





extern void exit (int __status) noexcept (true) __attribute__ ((__noreturn__));





extern void quick_exit (int __status) noexcept (true) __attribute__ ((__noreturn__));





extern void _Exit (int __status) noexcept (true) __attribute__ ((__noreturn__));




extern char *getenv (const char *__name) noexcept (true) __attribute__ ((__nonnull__ (1))) ;




extern char *secure_getenv (const char *__name)
     noexcept (true) __attribute__ ((__nonnull__ (1))) ;






extern int putenv (char *__string) noexcept (true) __attribute__ ((__nonnull__ (1)));





extern int setenv (const char *__name, const char *__value, int __replace)
     noexcept (true) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (const char *__name) noexcept (true) __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) noexcept (true);
# 682 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) noexcept (true) __attribute__ ((__nonnull__ (1)));
# 695 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 705 "/usr/include/stdlib.h" 3 4
extern int mkstemp64 (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 717 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
# 727 "/usr/include/stdlib.h" 3 4
extern int mkstemps64 (char *__template, int __suffixlen)
     __attribute__ ((__nonnull__ (1))) ;
# 738 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) noexcept (true) __attribute__ ((__nonnull__ (1))) ;
# 749 "/usr/include/stdlib.h" 3 4
extern int mkostemp (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
# 759 "/usr/include/stdlib.h" 3 4
extern int mkostemp64 (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
# 769 "/usr/include/stdlib.h" 3 4
extern int mkostemps (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;
# 781 "/usr/include/stdlib.h" 3 4
extern int mkostemps64 (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;
# 791 "/usr/include/stdlib.h" 3 4
extern int system (const char *__command) ;





extern char *canonicalize_file_name (const char *__name)
     noexcept (true) __attribute__ ((__nonnull__ (1))) __attribute__ ((__malloc__))
                              ;
# 808 "/usr/include/stdlib.h" 3 4
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) noexcept (true) ;






typedef int (*__compar_fn_t) (const void *, const void *);


typedef __compar_fn_t comparison_fn_t;



typedef int (*__compar_d_fn_t) (const void *, const void *, void *);




extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;







extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));

extern void qsort_r (void *__base, size_t __nmemb, size_t __size,
       __compar_d_fn_t __compar, void *__arg)
  __attribute__ ((__nonnull__ (1, 4)));




extern int abs (int __x) noexcept (true) __attribute__ ((__const__)) ;
extern long int labs (long int __x) noexcept (true) __attribute__ ((__const__)) ;


__extension__ extern long long int llabs (long long int __x)
     noexcept (true) __attribute__ ((__const__)) ;






extern div_t div (int __numer, int __denom)
     noexcept (true) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     noexcept (true) __attribute__ ((__const__)) ;


__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     noexcept (true) __attribute__ ((__const__)) ;
# 880 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) noexcept (true) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) noexcept (true) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     noexcept (true) __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     noexcept (true) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     noexcept (true) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     noexcept (true) __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) noexcept (true) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) noexcept (true) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     noexcept (true) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     noexcept (true) __attribute__ ((__nonnull__ (3, 4, 5)));





extern int mblen (const char *__s, size_t __n) noexcept (true);


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) noexcept (true);


extern int wctomb (char *__s, wchar_t __wchar) noexcept (true);



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) noexcept (true)
                                      ;

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     noexcept (true)

                                    ;






extern int rpmatch (const char *__response) noexcept (true) __attribute__ ((__nonnull__ (1))) ;
# 967 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     noexcept (true) __attribute__ ((__nonnull__ (1, 2, 3))) ;







extern int posix_openpt (int __oflag) ;







extern int grantpt (int __fd) noexcept (true);



extern int unlockpt (int __fd) noexcept (true);




extern char *ptsname (int __fd) noexcept (true) ;






extern int ptsname_r (int __fd, char *__buf, size_t __buflen)
     noexcept (true) __attribute__ ((__nonnull__ (2))) ;


extern int getpt (void);






extern int getloadavg (double __loadavg[], int __nelem)
     noexcept (true) __attribute__ ((__nonnull__ (1)));
# 1023 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 1 3 4
# 1024 "/usr/include/stdlib.h" 2 3 4
# 1035 "/usr/include/stdlib.h" 3 4
}
# 76 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/cstdlib" 2 3

# 1 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/bits/std_abs.h" 1 3
# 34 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/bits/std_abs.h" 3
# 46 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/bits/std_abs.h" 3
extern "C++"
{
namespace std __attribute__ ((__visibility__ ("default")))
{


  using ::abs;


  inline long
  abs(long __i) { return __builtin_labs(__i); }



  inline long long
  abs(long long __x) { return __builtin_llabs (__x); }







  inline constexpr double
  abs(double __x)
  { return __builtin_fabs(__x); }

  inline constexpr float
  abs(float __x)
  { return __builtin_fabsf(__x); }

  inline constexpr long double
  abs(long double __x)
  { return __builtin_fabsl(__x); }



  inline constexpr __int128
  abs(__int128 __x) { return __x >= 0 ? __x : -__x; }
# 100 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/bits/std_abs.h" 3
  inline constexpr
  __float128
  abs(__float128 __x)
  { return __x < 0 ? -__x : __x; }



}
}
# 78 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/cstdlib" 2 3
# 121 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/cstdlib" 3
extern "C++"
{
namespace std __attribute__ ((__visibility__ ("default")))
{


  using ::div_t;
  using ::ldiv_t;

  using ::abort;



  using ::atexit;


  using ::at_quick_exit;


  using ::atof;
  using ::atoi;
  using ::atol;
  using ::bsearch;
  using ::calloc;
  using ::div;
  using ::exit;
  using ::free;
  using ::getenv;
  using ::labs;
  using ::ldiv;
  using ::malloc;

  using ::mblen;
  using ::mbstowcs;
  using ::mbtowc;

  using ::qsort;


  using ::quick_exit;


  using ::rand;
  using ::realloc;
  using ::srand;
  using ::strtod;
  using ::strtol;
  using ::strtoul;
  using ::system;

  using ::wcstombs;
  using ::wctomb;



  inline ldiv_t
  div(long __i, long __j) { return ldiv(__i, __j); }




}
# 195 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/cstdlib" 3
namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{



  using ::lldiv_t;





  using ::_Exit;



  using ::llabs;

  inline lldiv_t
  div(long long __n, long long __d)
  { lldiv_t __q; __q.quot = __n / __d; __q.rem = __n % __d; return __q; }

  using ::lldiv;
# 227 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/cstdlib" 3
  using ::atoll;
  using ::strtoll;
  using ::strtoull;

  using ::strtof;
  using ::strtold;


}

namespace std
{

  using ::__gnu_cxx::lldiv_t;

  using ::__gnu_cxx::_Exit;

  using ::__gnu_cxx::llabs;
  using ::__gnu_cxx::div;
  using ::__gnu_cxx::lldiv;

  using ::__gnu_cxx::atoll;
  using ::__gnu_cxx::strtof;
  using ::__gnu_cxx::strtoll;
  using ::__gnu_cxx::strtoull;
  using ::__gnu_cxx::strtold;
}



}
# 37 "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/stdlib.h" 2 3

using std::abort;
using std::atexit;
using std::exit;


  using std::at_quick_exit;


  using std::quick_exit;




using std::div_t;
using std::ldiv_t;

using std::abs;
using std::atof;
using std::atoi;
using std::atol;
using std::bsearch;
using std::calloc;
using std::div;
using std::free;
using std::getenv;
using std::labs;
using std::ldiv;
using std::malloc;

using std::mblen;
using std::mbstowcs;
using std::mbtowc;

using std::qsort;
using std::rand;
using std::realloc;
using std::srand;
using std::strtod;
using std::strtol;
using std::strtoul;
using std::system;

using std::wcstombs;
using std::wctomb;
# 11 "HLS-benchmarks/Inter-Block/fft/fft.cpp" 2




__attribute__((sdx_kernel("fft", 0))) void fft(inout_float_t X_R_0[1024], inout_float_t X_R_1[1024],
         inout_float_t X_R_2[1024], inout_float_t X_R_3[1024],
         inout_float_t X_R_4[1024], inout_float_t X_R_5[1024],
         inout_float_t X_R_6[1024], inout_float_t X_R_7[1024],
         inout_float_t X_I_0[1024], inout_float_t X_I_1[1024],
         inout_float_t X_I_2[1024], inout_float_t X_I_3[1024],
         inout_float_t X_I_4[1024], inout_float_t X_I_5[1024],
         inout_float_t X_I_6[1024], inout_float_t X_I_7[1024],
         in_float_t cos_coefficients_table[512],
         in_float_t sin_coefficients_table[512]) {
#line 18 "/home/gabriel/Documents/UFRGS/RAISE/ahls_resource_estimation/run_hls.tcl"
#pragma HLSDIRECTIVE TOP name=fft
# 24 "HLS-benchmarks/Inter-Block/fft/fft.cpp"


loop_0:
  for (int i = 0; i < 2; i++)
    VITIS_LOOP_28_1: for (int stage = 1; stage <= 8; stage++) {
      int numBF = (1 << (stage - 1));
      VITIS_LOOP_30_2: for (int j = 0; j < numBF; j++) {
        float c = cos_coefficients_table[j << (8 - stage)];
        float s = sin_coefficients_table[j << (8 - stage)];
        int i_lower = j + numBF;
        float temp_R =
            X_R_0[i * 512 + i_lower] * c - X_I_0[i * 512 + i_lower] * s;
        float temp_I =
            X_I_0[i * 512 + i_lower] * c + X_R_0[i * 512 + i_lower] * s;
        X_R_0[i * 512 + i_lower] = X_R_0[i * 512 + j] - temp_R;
        X_I_0[i * 512 + i_lower] = X_I_0[i * 512 + j] - temp_I;
        X_R_0[i * 512 + j] = X_R_0[i * 512 + j] + temp_R;
        X_I_0[i * 512 + j] = X_I_0[i * 512 + j] + temp_I;
      }
    }

loop_1:
  for (int i = 0; i < 2; i++)
    VITIS_LOOP_47_3: for (int stage = 1; stage <= 8; stage++) {
      int numBF = (1 << (stage - 1));
      VITIS_LOOP_49_4: for (int j = 0; j < numBF; j++) {
        float c = cos_coefficients_table[j << (8 - stage)];
        float s = sin_coefficients_table[j << (8 - stage)];
        int i_lower = j + numBF;
        float temp_R =
            X_R_1[i * 512 + i_lower] * c - X_I_1[i * 512 + i_lower] * s;
        float temp_I =
            X_I_1[i * 512 + i_lower] * c + X_R_1[i * 512 + i_lower] * s;
        X_R_1[i * 512 + i_lower] = X_R_1[i * 512 + j] - temp_R;
        X_I_1[i * 512 + i_lower] = X_I_1[i * 512 + j] - temp_I;
        X_R_1[i * 512 + j] = X_R_1[i * 512 + j] + temp_R;
        X_I_1[i * 512 + j] = X_I_1[i * 512 + j] + temp_I;
      }
    }

loop_2:
  for (int i = 0; i < 2; i++)
    VITIS_LOOP_66_5: for (int stage = 1; stage <= 8; stage++) {
      int numBF = (1 << (stage - 1));
      VITIS_LOOP_68_6: for (int j = 0; j < numBF; j++) {
        float c = cos_coefficients_table[j << (8 - stage)];
        float s = sin_coefficients_table[j << (8 - stage)];
        int i_lower = j + numBF;
        float temp_R =
            X_R_2[i * 512 + i_lower] * c - X_I_2[i * 512 + i_lower] * s;
        float temp_I =
            X_I_2[i * 512 + i_lower] * c + X_R_2[i * 512 + i_lower] * s;
        X_R_2[i * 512 + i_lower] = X_R_2[i * 512 + j] - temp_R;
        X_I_2[i * 512 + i_lower] = X_I_2[i * 512 + j] - temp_I;
        X_R_2[i * 512 + j] = X_R_2[i * 512 + j] + temp_R;
        X_I_2[i * 512 + j] = X_I_2[i * 512 + j] + temp_I;
      }
    }

loop_3:
  for (int i = 0; i < 2; i++)
    VITIS_LOOP_85_7: for (int stage = 1; stage <= 8; stage++) {
      int numBF = (1 << (stage - 1));
      VITIS_LOOP_87_8: for (int j = 0; j < numBF; j++) {
        float c = cos_coefficients_table[j << (8 - stage)];
        float s = sin_coefficients_table[j << (8 - stage)];
        int i_lower = j + numBF;
        float temp_R =
            X_R_3[i * 512 + i_lower] * c - X_I_3[i * 512 + i_lower] * s;
        float temp_I =
            X_I_3[i * 512 + i_lower] * c + X_R_3[i * 512 + i_lower] * s;
        X_R_3[i * 512 + i_lower] = X_R_3[i * 512 + j] - temp_R;
        X_I_3[i * 512 + i_lower] = X_I_3[i * 512 + j] - temp_I;
        X_R_3[i * 512 + j] = X_R_3[i * 512 + j] + temp_R;
        X_I_3[i * 512 + j] = X_I_3[i * 512 + j] + temp_I;
      }
    }

loop_4:
  for (int i = 0; i < 2; i++)
    VITIS_LOOP_104_9: for (int stage = 1; stage <= 8; stage++) {
      int numBF = (1 << (stage - 1));
      VITIS_LOOP_106_10: for (int j = 0; j < numBF; j++) {
        float c = cos_coefficients_table[j << (8 - stage)];
        float s = sin_coefficients_table[j << (8 - stage)];
        int i_lower = j + numBF;
        float temp_R =
            X_R_4[i * 512 + i_lower] * c - X_I_4[i * 512 + i_lower] * s;
        float temp_I =
            X_I_4[i * 512 + i_lower] * c + X_R_4[i * 512 + i_lower] * s;
        X_R_4[i * 512 + i_lower] = X_R_4[i * 512 + j] - temp_R;
        X_I_4[i * 512 + i_lower] = X_I_4[i * 512 + j] - temp_I;
        X_R_4[i * 512 + j] = X_R_4[i * 512 + j] + temp_R;
        X_I_4[i * 512 + j] = X_I_4[i * 512 + j] + temp_I;
      }
    }

loop_5:
  for (int i = 0; i < 2; i++)
    VITIS_LOOP_123_11: for (int stage = 1; stage <= 8; stage++) {
      int numBF = (1 << (stage - 1));
      VITIS_LOOP_125_12: for (int j = 0; j < numBF; j++) {
        float c = cos_coefficients_table[j << (8 - stage)];
        float s = sin_coefficients_table[j << (8 - stage)];
        int i_lower = j + numBF;
        float temp_R =
            X_R_5[i * 512 + i_lower] * c - X_I_5[i * 512 + i_lower] * s;
        float temp_I =
            X_I_5[i * 512 + i_lower] * c + X_R_5[i * 512 + i_lower] * s;
        X_R_5[i * 512 + i_lower] = X_R_5[i * 512 + j] - temp_R;
        X_I_5[i * 512 + i_lower] = X_I_5[i * 512 + j] - temp_I;
        X_R_5[i * 512 + j] = X_R_5[i * 512 + j] + temp_R;
        X_I_5[i * 512 + j] = X_I_5[i * 512 + j] + temp_I;
      }
    }

loop_6:
  for (int i = 0; i < 2; i++)
    VITIS_LOOP_142_13: for (int stage = 1; stage <= 8; stage++) {
      int numBF = (1 << (stage - 1));
      VITIS_LOOP_144_14: for (int j = 0; j < numBF; j++) {
        float c = cos_coefficients_table[j << (8 - stage)];
        float s = sin_coefficients_table[j << (8 - stage)];
        int i_lower = j + numBF;
        float temp_R =
            X_R_6[i * 512 + i_lower] * c - X_I_6[i * 512 + i_lower] * s;
        float temp_I =
            X_I_6[i * 512 + i_lower] * c + X_R_6[i * 512 + i_lower] * s;
        X_R_6[i * 512 + i_lower] = X_R_6[i * 512 + j] - temp_R;
        X_I_6[i * 512 + i_lower] = X_I_6[i * 512 + j] - temp_I;
        X_R_6[i * 512 + j] = X_R_6[i * 512 + j] + temp_R;
        X_I_6[i * 512 + j] = X_I_6[i * 512 + j] + temp_I;
      }
    }

loop_7:
  for (int i = 0; i < 2; i++)
    VITIS_LOOP_161_15: for (int stage = 1; stage <= 8; stage++) {
      int numBF = (1 << (stage - 1));
      VITIS_LOOP_163_16: for (int j = 0; j < numBF; j++) {
        float c = cos_coefficients_table[j << (8 - stage)];
        float s = sin_coefficients_table[j << (8 - stage)];
        int i_lower = j + numBF;
        float temp_R =
            X_R_7[i * 512 + i_lower] * c - X_I_7[i * 512 + i_lower] * s;
        float temp_I =
            X_I_7[i * 512 + i_lower] * c + X_R_7[i * 512 + i_lower] * s;
        X_R_7[i * 512 + i_lower] = X_R_7[i * 512 + j] - temp_R;
        X_I_7[i * 512 + i_lower] = X_I_7[i * 512 + j] - temp_I;
        X_R_7[i * 512 + j] = X_R_7[i * 512 + j] + temp_R;
        X_I_7[i * 512 + j] = X_I_7[i * 512 + j] + temp_I;
      }
    }
}

int main() {
  float X_R_0[1024], X_R_1[1024], X_R_2[1024], X_R_3[1024], X_R_4[1024],
      X_R_5[1024], X_R_6[1024], X_R_7[1024];
  float X_I_0[1024], X_I_1[1024], X_I_2[1024], X_I_3[1024], X_I_4[1024],
      X_I_5[1024], X_I_6[1024], X_I_7[1024];

  float cos_coefficients_table[512] = {
      1.000000, 0.999981, 0.999925, 0.999831, 0.999699, 0.999529,
      0.999322, 0.999078, 0.998795, 0.998476, 0.998118, 0.997723,
      0.997290, 0.996820, 0.996313, 0.995767, 0.995185, 0.994565,
      0.993907, 0.993212, 0.992480, 0.991710, 0.990903, 0.990058,
      0.989177, 0.988258, 0.987301, 0.986308, 0.985278, 0.984210,
      0.983105, 0.981964, 0.980785, 0.979570, 0.978317, 0.977028,
      0.975702, 0.974339, 0.972940, 0.971504, 0.970031, 0.968522,
      0.966976, 0.965394, 0.963776, 0.962121, 0.960431, 0.958703,
      0.956940, 0.955141, 0.953306, 0.951435, 0.949528, 0.947586,
      0.945607, 0.943593, 0.941544, 0.939459, 0.937339, 0.935184,
      0.932993, 0.930767, 0.928506, 0.926210, 0.923880, 0.921514,
      0.919114, 0.916679, 0.914210, 0.911706, 0.909168, 0.906596,
      0.903989, 0.901349, 0.898674, 0.895966, 0.893224, 0.890449,
      0.887640, 0.884797, 0.881921, 0.879012, 0.876070, 0.873095,
      0.870087, 0.867046, 0.863973, 0.860867, 0.857729, 0.854558,
      0.851355, 0.848120, 0.844854, 0.841555, 0.838225, 0.834863,
      0.831470, 0.828045, 0.824589, 0.821103, 0.817585, 0.814036,
      0.810457, 0.806848, 0.803208, 0.799537, 0.795837, 0.792107,
      0.788346, 0.784557, 0.780737, 0.776888, 0.773010, 0.769103,
      0.765167, 0.761202, 0.757209, 0.753187, 0.749136, 0.745058,
      0.740951, 0.736817, 0.732654, 0.728464, 0.724247, 0.720003,
      0.715731, 0.711432, 0.707107, 0.702755, 0.698376, 0.693971,
      0.689541, 0.685084, 0.680601, 0.676093, 0.671559, 0.667000,
      0.662416, 0.657807, 0.653173, 0.648514, 0.643832, 0.639124,
      0.634393, 0.629638, 0.624859, 0.620057, 0.615232, 0.610383,
      0.605511, 0.600616, 0.595699, 0.590760, 0.585798, 0.580814,
      0.575808, 0.570781, 0.565732, 0.560662, 0.555570, 0.550458,
      0.545325, 0.540171, 0.534998, 0.529804, 0.524590, 0.519356,
      0.514103, 0.508830, 0.503538, 0.498228, 0.492898, 0.487550,
      0.482184, 0.476799, 0.471397, 0.465976, 0.460539, 0.455084,
      0.449611, 0.444122, 0.438616, 0.433094, 0.427555, 0.422000,
      0.416430, 0.410843, 0.405241, 0.399624, 0.393992, 0.388345,
      0.382683, 0.377007, 0.371317, 0.365613, 0.359895, 0.354164,
      0.348419, 0.342661, 0.336890, 0.331106, 0.325310, 0.319502,
      0.313682, 0.307850, 0.302006, 0.296151, 0.290285, 0.284408,
      0.278520, 0.272621, 0.266713, 0.260794, 0.254866, 0.248928,
      0.242980, 0.237024, 0.231058, 0.225084, 0.219101, 0.213110,
      0.207111, 0.201105, 0.195090, 0.189069, 0.183040, 0.177004,
      0.170962, 0.164913, 0.158858, 0.152797, 0.146730, 0.140658,
      0.134581, 0.128498, 0.122411, 0.116319, 0.110222, 0.104122,
      0.098017, 0.091909, 0.085797, 0.079682, 0.073565, 0.067444,
      0.061321, 0.055195, 0.049068, 0.042938, 0.036807, 0.030675,
      0.024541, 0.018407, 0.012272, 0.006136, 0.000000, -0.006136,
      -0.012272, -0.018407, -0.024541, -0.030675, -0.036807, -0.042938,
      -0.049068, -0.055195, -0.061321, -0.067444, -0.073565, -0.079682,
      -0.085797, -0.091909, -0.098017, -0.104122, -0.110222, -0.116319,
      -0.122411, -0.128498, -0.134581, -0.140658, -0.146730, -0.152797,
      -0.158858, -0.164913, -0.170962, -0.177004, -0.183040, -0.189069,
      -0.195090, -0.201105, -0.207111, -0.213110, -0.219101, -0.225084,
      -0.231058, -0.237024, -0.242980, -0.248928, -0.254866, -0.260794,
      -0.266713, -0.272621, -0.278520, -0.284408, -0.290285, -0.296151,
      -0.302006, -0.307850, -0.313682, -0.319502, -0.325310, -0.331106,
      -0.336890, -0.342661, -0.348419, -0.354164, -0.359895, -0.365613,
      -0.371317, -0.377007, -0.382683, -0.388345, -0.393992, -0.399624,
      -0.405241, -0.410843, -0.416430, -0.422000, -0.427555, -0.433094,
      -0.438616, -0.444122, -0.449611, -0.455084, -0.460539, -0.465976,
      -0.471397, -0.476799, -0.482184, -0.487550, -0.492898, -0.498228,
      -0.503538, -0.508830, -0.514103, -0.519356, -0.524590, -0.529804,
      -0.534998, -0.540171, -0.545325, -0.550458, -0.555570, -0.560662,
      -0.565732, -0.570781, -0.575808, -0.580814, -0.585798, -0.590760,
      -0.595699, -0.600616, -0.605511, -0.610383, -0.615232, -0.620057,
      -0.624859, -0.629638, -0.634393, -0.639124, -0.643832, -0.648514,
      -0.653173, -0.657807, -0.662416, -0.667000, -0.671559, -0.676093,
      -0.680601, -0.685084, -0.689541, -0.693971, -0.698376, -0.702755,
      -0.707107, -0.711432, -0.715731, -0.720003, -0.724247, -0.728464,
      -0.732654, -0.736817, -0.740951, -0.745058, -0.749136, -0.753187,
      -0.757209, -0.761202, -0.765167, -0.769103, -0.773010, -0.776888,
      -0.780737, -0.784557, -0.788346, -0.792107, -0.795837, -0.799537,
      -0.803208, -0.806848, -0.810457, -0.814036, -0.817585, -0.821103,
      -0.824589, -0.828045, -0.831470, -0.834863, -0.838225, -0.841555,
      -0.844854, -0.848120, -0.851355, -0.854558, -0.857729, -0.860867,
      -0.863973, -0.867046, -0.870087, -0.873095, -0.876070, -0.879012,
      -0.881921, -0.884797, -0.887640, -0.890449, -0.893224, -0.895966,
      -0.898674, -0.901349, -0.903989, -0.906596, -0.909168, -0.911706,
      -0.914210, -0.916679, -0.919114, -0.921514, -0.923880, -0.926210,
      -0.928506, -0.930767, -0.932993, -0.935184, -0.937339, -0.939459,
      -0.941544, -0.943593, -0.945607, -0.947586, -0.949528, -0.951435,
      -0.953306, -0.955141, -0.956940, -0.958703, -0.960431, -0.962121,
      -0.963776, -0.965394, -0.966976, -0.968522, -0.970031, -0.971504,
      -0.972940, -0.974339, -0.975702, -0.977028, -0.978317, -0.979570,
      -0.980785, -0.981964, -0.983105, -0.984210, -0.985278, -0.986308,
      -0.987301, -0.988258, -0.989177, -0.990058, -0.990903, -0.991710,
      -0.992480, -0.993212, -0.993907, -0.994565, -0.995185, -0.995767,
      -0.996313, -0.996820, -0.997290, -0.997723, -0.998118, -0.998476,
      -0.998795, -0.999078, -0.999322, -0.999529, -0.999699, -0.999831,
      -0.999925, -0.999981};

  float sin_coefficients_table[512] = {
      0.000000, -0.006136, -0.012272, -0.018407, -0.024541, -0.030675,
      -0.036807, -0.042938, -0.049068, -0.055195, -0.061321, -0.067444,
      -0.073565, -0.079682, -0.085797, -0.091909, -0.098017, -0.104122,
      -0.110222, -0.116319, -0.122411, -0.128498, -0.134581, -0.140658,
      -0.146730, -0.152797, -0.158858, -0.164913, -0.170962, -0.177004,
      -0.183040, -0.189069, -0.195090, -0.201105, -0.207111, -0.213110,
      -0.219101, -0.225084, -0.231058, -0.237024, -0.242980, -0.248928,
      -0.254866, -0.260794, -0.266713, -0.272621, -0.278520, -0.284408,
      -0.290285, -0.296151, -0.302006, -0.307850, -0.313682, -0.319502,
      -0.325310, -0.331106, -0.336890, -0.342661, -0.348419, -0.354164,
      -0.359895, -0.365613, -0.371317, -0.377007, -0.382683, -0.388345,
      -0.393992, -0.399624, -0.405241, -0.410843, -0.416430, -0.422000,
      -0.427555, -0.433094, -0.438616, -0.444122, -0.449611, -0.455084,
      -0.460539, -0.465976, -0.471397, -0.476799, -0.482184, -0.487550,
      -0.492898, -0.498228, -0.503538, -0.508830, -0.514103, -0.519356,
      -0.524590, -0.529804, -0.534998, -0.540171, -0.545325, -0.550458,
      -0.555570, -0.560662, -0.565732, -0.570781, -0.575808, -0.580814,
      -0.585798, -0.590760, -0.595699, -0.600616, -0.605511, -0.610383,
      -0.615232, -0.620057, -0.624859, -0.629638, -0.634393, -0.639124,
      -0.643832, -0.648514, -0.653173, -0.657807, -0.662416, -0.667000,
      -0.671559, -0.676093, -0.680601, -0.685084, -0.689541, -0.693971,
      -0.698376, -0.702755, -0.707107, -0.711432, -0.715731, -0.720003,
      -0.724247, -0.728464, -0.732654, -0.736817, -0.740951, -0.745058,
      -0.749136, -0.753187, -0.757209, -0.761202, -0.765167, -0.769103,
      -0.773010, -0.776888, -0.780737, -0.784557, -0.788346, -0.792107,
      -0.795837, -0.799537, -0.803208, -0.806848, -0.810457, -0.814036,
      -0.817585, -0.821103, -0.824589, -0.828045, -0.831470, -0.834863,
      -0.838225, -0.841555, -0.844854, -0.848120, -0.851355, -0.854558,
      -0.857729, -0.860867, -0.863973, -0.867046, -0.870087, -0.873095,
      -0.876070, -0.879012, -0.881921, -0.884797, -0.887640, -0.890449,
      -0.893224, -0.895966, -0.898674, -0.901349, -0.903989, -0.906596,
      -0.909168, -0.911706, -0.914210, -0.916679, -0.919114, -0.921514,
      -0.923880, -0.926210, -0.928506, -0.930767, -0.932993, -0.935184,
      -0.937339, -0.939459, -0.941544, -0.943593, -0.945607, -0.947586,
      -0.949528, -0.951435, -0.953306, -0.955141, -0.956940, -0.958703,
      -0.960431, -0.962121, -0.963776, -0.965394, -0.966976, -0.968522,
      -0.970031, -0.971504, -0.972940, -0.974339, -0.975702, -0.977028,
      -0.978317, -0.979570, -0.980785, -0.981964, -0.983105, -0.984210,
      -0.985278, -0.986308, -0.987301, -0.988258, -0.989177, -0.990058,
      -0.990903, -0.991710, -0.992480, -0.993212, -0.993907, -0.994565,
      -0.995185, -0.995767, -0.996313, -0.996820, -0.997290, -0.997723,
      -0.998118, -0.998476, -0.998795, -0.999078, -0.999322, -0.999529,
      -0.999699, -0.999831, -0.999925, -0.999981, -1.000000, -0.999981,
      -0.999925, -0.999831, -0.999699, -0.999529, -0.999322, -0.999078,
      -0.998795, -0.998476, -0.998118, -0.997723, -0.997290, -0.996820,
      -0.996313, -0.995767, -0.995185, -0.994565, -0.993907, -0.993212,
      -0.992480, -0.991710, -0.990903, -0.990058, -0.989177, -0.988258,
      -0.987301, -0.986308, -0.985278, -0.984210, -0.983105, -0.981964,
      -0.980785, -0.979570, -0.978317, -0.977028, -0.975702, -0.974339,
      -0.972940, -0.971504, -0.970031, -0.968522, -0.966976, -0.965394,
      -0.963776, -0.962121, -0.960431, -0.958703, -0.956940, -0.955141,
      -0.953306, -0.951435, -0.949528, -0.947586, -0.945607, -0.943593,
      -0.941544, -0.939459, -0.937339, -0.935184, -0.932993, -0.930767,
      -0.928506, -0.926210, -0.923880, -0.921514, -0.919114, -0.916679,
      -0.914210, -0.911706, -0.909168, -0.906596, -0.903989, -0.901349,
      -0.898674, -0.895966, -0.893224, -0.890449, -0.887640, -0.884797,
      -0.881921, -0.879012, -0.876070, -0.873095, -0.870087, -0.867046,
      -0.863973, -0.860867, -0.857729, -0.854558, -0.851355, -0.848120,
      -0.844854, -0.841555, -0.838225, -0.834863, -0.831470, -0.828045,
      -0.824589, -0.821103, -0.817585, -0.814036, -0.810457, -0.806848,
      -0.803208, -0.799537, -0.795837, -0.792107, -0.788346, -0.784557,
      -0.780737, -0.776888, -0.773010, -0.769103, -0.765167, -0.761202,
      -0.757209, -0.753187, -0.749136, -0.745058, -0.740951, -0.736817,
      -0.732654, -0.728464, -0.724247, -0.720003, -0.715731, -0.711432,
      -0.707107, -0.702755, -0.698376, -0.693971, -0.689541, -0.685084,
      -0.680601, -0.676093, -0.671559, -0.667000, -0.662416, -0.657807,
      -0.653173, -0.648514, -0.643832, -0.639124, -0.634393, -0.629638,
      -0.624859, -0.620057, -0.615232, -0.610383, -0.605511, -0.600616,
      -0.595699, -0.590760, -0.585798, -0.580814, -0.575808, -0.570781,
      -0.565732, -0.560662, -0.555570, -0.550458, -0.545325, -0.540171,
      -0.534998, -0.529804, -0.524590, -0.519356, -0.514103, -0.508830,
      -0.503538, -0.498228, -0.492898, -0.487550, -0.482184, -0.476799,
      -0.471397, -0.465976, -0.460539, -0.455084, -0.449611, -0.444122,
      -0.438616, -0.433094, -0.427555, -0.422000, -0.416430, -0.410843,
      -0.405241, -0.399624, -0.393992, -0.388345, -0.382683, -0.377007,
      -0.371317, -0.365613, -0.359895, -0.354164, -0.348419, -0.342661,
      -0.336890, -0.331106, -0.325310, -0.319502, -0.313682, -0.307850,
      -0.302006, -0.296151, -0.290285, -0.284408, -0.278520, -0.272621,
      -0.266713, -0.260794, -0.254866, -0.248928, -0.242980, -0.237024,
      -0.231058, -0.225084, -0.219101, -0.213110, -0.207111, -0.201105,
      -0.195090, -0.189069, -0.183040, -0.177004, -0.170962, -0.164913,
      -0.158858, -0.152797, -0.146730, -0.140658, -0.134581, -0.128498,
      -0.122411, -0.116319, -0.110222, -0.104122, -0.098017, -0.091909,
      -0.085797, -0.079682, -0.073565, -0.067444, -0.061321, -0.055195,
      -0.049068, -0.042938, -0.036807, -0.030675, -0.024541, -0.018407,
      -0.012272, -0.006136};

  srand(9);
  VITIS_LOOP_362_1: for (int i = 0; i < 1024; i++) {
    X_R_0[i] = rand();
    X_R_1[i] = rand();
    X_R_2[i] = rand();
    X_R_3[i] = rand();
    X_R_4[i] = rand();
    X_R_5[i] = rand();
    X_R_6[i] = rand();
    X_R_7[i] = rand();
    X_I_0[i] = rand();
    X_I_1[i] = rand();
    X_I_2[i] = rand();
    X_I_3[i] = rand();
    X_I_4[i] = rand();
    X_I_5[i] = rand();
    X_I_6[i] = rand();
    X_I_7[i] = rand();
  }

  fft(X_R_0, X_R_1, X_R_2, X_R_3, X_R_4, X_R_5, X_R_6, X_R_7, X_I_0, X_I_1,
      X_I_2, X_I_3, X_I_4, X_I_5, X_I_6, X_I_7, cos_coefficients_table,
      sin_coefficients_table);

  return 0;
}
