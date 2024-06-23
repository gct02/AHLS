/* Provide Declarations */
#include <stdarg.h>
#include <setjmp.h>
#include <limits.h>
#ifdef NEED_CBEAPINT
#include <autopilot_cbe.h>
#else
#define aesl_fopen fopen
#define aesl_freopen freopen
#define aesl_tmpfile tmpfile
#endif
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#ifdef __STRICT_ANSI__
#define inline __inline__
#define typeof __typeof__ 
#endif
#define __isoc99_fscanf fscanf
#define __isoc99_sscanf sscanf
#undef ferror
#undef feof
/* get a declaration for alloca */
#if defined(__CYGWIN__) || defined(__MINGW32__)
#define  alloca(x) __builtin_alloca((x))
#define _alloca(x) __builtin_alloca((x))
#elif defined(__APPLE__)
extern void *__builtin_alloca(unsigned long);
#define alloca(x) __builtin_alloca(x)
#define longjmp _longjmp
#define setjmp _setjmp
#elif defined(__sun__)
#if defined(__sparcv9)
extern void *__builtin_alloca(unsigned long);
#else
extern void *__builtin_alloca(unsigned int);
#endif
#define alloca(x) __builtin_alloca(x)
#elif defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(__arm__)
#define alloca(x) __builtin_alloca(x)
#elif defined(_MSC_VER)
#define inline _inline
#define alloca(x) _alloca(x)
#else
#include <alloca.h>
#endif

#ifndef __GNUC__  /* Can only support "linkonce" vars with GCC */
#define __attribute__(X)
#endif

#if defined(__GNUC__) && defined(__APPLE_CC__)
#define __EXTERNAL_WEAK__ __attribute__((weak_import))
#elif defined(__GNUC__)
#define __EXTERNAL_WEAK__ __attribute__((weak))
#else
#define __EXTERNAL_WEAK__
#endif

#if defined(__GNUC__) && (defined(__APPLE_CC__) || defined(__CYGWIN__) || defined(__MINGW32__))
#define __ATTRIBUTE_WEAK__
#elif defined(__GNUC__)
#define __ATTRIBUTE_WEAK__ __attribute__((weak))
#else
#define __ATTRIBUTE_WEAK__
#endif

#if defined(__GNUC__)
#define __HIDDEN__ __attribute__((visibility("hidden")))
#endif

#ifdef __GNUC__
#define LLVM_NAN(NanStr)   __builtin_nan(NanStr)   /* Double */
#define LLVM_NANF(NanStr)  __builtin_nanf(NanStr)  /* Float */
#define LLVM_NANS(NanStr)  __builtin_nans(NanStr)  /* Double */
#define LLVM_NANSF(NanStr) __builtin_nansf(NanStr) /* Float */
#define LLVM_INF           __builtin_inf()         /* Double */
#define LLVM_INFF          __builtin_inff()        /* Float */
#define LLVM_PREFETCH(addr,rw,locality) __builtin_prefetch(addr,rw,locality)
#define __ATTRIBUTE_CTOR__ __attribute__((constructor))
#define __ATTRIBUTE_DTOR__ __attribute__((destructor))
#define LLVM_ASM           __asm__
#else
#define LLVM_NAN(NanStr)   ((double)0.0)           /* Double */
#define LLVM_NANF(NanStr)  0.0F                    /* Float */
#define LLVM_NANS(NanStr)  ((double)0.0)           /* Double */
#define LLVM_NANSF(NanStr) 0.0F                    /* Float */
#define LLVM_INF           ((double)0.0)           /* Double */
#define LLVM_INFF          0.0F                    /* Float */
#define LLVM_PREFETCH(addr,rw,locality)            /* PREFETCH */
#define __ATTRIBUTE_CTOR__
#define __ATTRIBUTE_DTOR__
#define LLVM_ASM(X)
#endif

#if __GNUC__ < 4 /* Old GCC's, or compilers not GCC */ 
#define __builtin_stack_save() 0   /* not implemented */
#define __builtin_stack_restore(X) /* noop */
#endif

#if __GNUC__ && __LP64__ /* 128-bit integer types */
typedef int __attribute__((mode(TI))) llvmInt128;
typedef unsigned __attribute__((mode(TI))) llvmUInt128;
#endif

#define CODE_FOR_MAIN() /* Any target-specific code for main()*/

#ifndef __cplusplus
typedef unsigned char bool;
#endif


/* Support for floating point constants */
typedef unsigned long long ConstantDoubleTy;
typedef unsigned int        ConstantFloatTy;
typedef struct { unsigned long long f1; unsigned short f2; unsigned short pad[3]; } ConstantFP80Ty;
typedef struct { unsigned long long f1; unsigned long long f2; } ConstantFP128Ty;


/* Global Declarations */
/* Helper union for bitcasts */
typedef union {
  unsigned int Int32;
  unsigned long long Int64;
  float Float;
  double Double;
} llvmBitCastUnion;

/* External Global Variable Declarations */
extern unsigned int float_rounding_mode;
extern unsigned int float_exception_flags;

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
void shift64RightJamming(signed long long llvm_cbe_a, signed int llvm_cbe_count, signed long long *llvm_cbe_zPtr);
void shift64ExtraRightJamming(signed long long llvm_cbe_a0, signed long long llvm_cbe_a1, signed int llvm_cbe_count, signed long long *llvm_cbe_z0Ptr, signed long long *llvm_cbe_z1Ptr);
void add128(signed long long llvm_cbe_a0, signed long long llvm_cbe_a1, signed long long llvm_cbe_b0, signed long long llvm_cbe_b1, signed long long *llvm_cbe_z0Ptr, signed long long *llvm_cbe_z1Ptr);
void sub128(signed long long llvm_cbe_a0, signed long long llvm_cbe_a1, signed long long llvm_cbe_b0, signed long long llvm_cbe_b1, signed long long *llvm_cbe_z0Ptr, signed long long *llvm_cbe_z1Ptr);
void mul64To128(signed long long llvm_cbe_a, signed long long llvm_cbe_b, signed long long *llvm_cbe_z0Ptr, signed long long *llvm_cbe_z1Ptr);
void float_raise(signed int llvm_cbe_flags);
signed int float64_is_nan(signed long long llvm_cbe_a);
signed int float64_is_signaling_nan(signed long long llvm_cbe_a);
signed long long extractFloat64Frac(signed long long llvm_cbe_a);
signed int extractFloat64Exp(signed long long llvm_cbe_a);
signed int extractFloat64Sign(signed long long llvm_cbe_a);
signed long long packFloat64(signed int llvm_cbe_zSign, signed int llvm_cbe_zExp, signed long long llvm_cbe_zSig);
signed long long int32_to_float64(signed int llvm_cbe_a);
static signed int aesl_internal_countLeadingZeros32(signed int llvm_cbe_a);
signed long long float64_add(signed long long llvm_cbe_a, signed long long llvm_cbe_b);
static signed long long aesl_internal_addFloat64Sigs(signed long long llvm_cbe_a, signed long long llvm_cbe_b, signed int llvm_cbe_zSign);
static signed long long aesl_internal_subFloat64Sigs(signed long long llvm_cbe_a, signed long long llvm_cbe_b, signed int llvm_cbe_zSign);
signed long long float64_mul(signed long long llvm_cbe_a, signed long long llvm_cbe_b);
static signed long long aesl_internal_propagateFloat64NaN(signed long long llvm_cbe_a, signed long long llvm_cbe_b);
static void aesl_internal_normalizeFloat64Subnormal(signed long long llvm_cbe_aSig, signed int *llvm_cbe_zExpPtr, signed long long *llvm_cbe_zSigPtr);
static signed long long aesl_internal_roundAndPackFloat64(signed int llvm_cbe_zSign, signed int llvm_cbe_zExp, signed long long llvm_cbe_zSig);
signed long long float64_div(signed long long llvm_cbe_a, signed long long llvm_cbe_b);
static signed long long aesl_internal_estimateDiv128To64(signed long long llvm_cbe_a0, signed long long llvm_cbe_b);
signed int float64_le(signed long long llvm_cbe_a, signed long long llvm_cbe_b);
signed int float64_ge(signed long long llvm_cbe_a, signed long long llvm_cbe_b);
signed long long float64_neg(signed long long llvm_cbe_x);
static signed int aesl_internal_countLeadingZeros64(signed long long llvm_cbe_a);
static signed long long aesl_internal_normalizeRoundAndPackFloat64(signed int llvm_cbe_zSign, signed int llvm_cbe_zExp, signed long long llvm_cbe_zSig);


/* Global Variable Definitions and Initialization */
unsigned int float_exception_flags;
unsigned int float_rounding_mode;
static signed int aesl_internal_countLeadingZeros32_OC_countLeadingZerosHigh[256] = { 8u, 7u, 6u, 6u, 5u, 5u, 5u, 5u, 4u, 4u, 4u, 4u, 4u, 4u, 4u, 4u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 3u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 2u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 1u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u, 0u };


/* Function Bodies */
static inline int llvm_fcmp_ord(double X, double Y) { return X == X && Y == Y; }
static inline int llvm_fcmp_uno(double X, double Y) { return X != X || Y != Y; }
static inline int llvm_fcmp_ueq(double X, double Y) { return X == Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_une(double X, double Y) { return X != Y; }
static inline int llvm_fcmp_ult(double X, double Y) { return X <  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ugt(double X, double Y) { return X >  Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_ule(double X, double Y) { return X <= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_uge(double X, double Y) { return X >= Y || llvm_fcmp_uno(X, Y); }
static inline int llvm_fcmp_oeq(double X, double Y) { return X == Y ; }
static inline int llvm_fcmp_one(double X, double Y) { return X != Y && llvm_fcmp_ord(X, Y); }
static inline int llvm_fcmp_olt(double X, double Y) { return X <  Y ; }
static inline int llvm_fcmp_ogt(double X, double Y) { return X >  Y ; }
static inline int llvm_fcmp_ole(double X, double Y) { return X <= Y ; }
static inline int llvm_fcmp_oge(double X, double Y) { return X >= Y ; }

void shift64RightJamming(signed long long llvm_cbe_a, signed int llvm_cbe_count, signed long long *llvm_cbe_zPtr) {
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  static  unsigned long long aesl_llvm_cbe_4_count = 0;
  static  unsigned long long aesl_llvm_cbe_5_count = 0;
  static  unsigned long long aesl_llvm_cbe_6_count = 0;
  static  unsigned long long aesl_llvm_cbe_7_count = 0;
  static  unsigned long long aesl_llvm_cbe_8_count = 0;
  static  unsigned long long aesl_llvm_cbe_9_count = 0;
  static  unsigned long long aesl_llvm_cbe_10_count = 0;
  static  unsigned long long aesl_llvm_cbe_11_count = 0;
  static  unsigned long long aesl_llvm_cbe_12_count = 0;
  static  unsigned long long aesl_llvm_cbe_13_count = 0;
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
  unsigned long long llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  unsigned long long llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  unsigned int llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  unsigned int llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  unsigned long long llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  unsigned long long llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  unsigned long long llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  unsigned long long llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  unsigned long long llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned long long llvm_cbe_storemerge1;
  unsigned long long llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @shift64RightJamming\n");
  if (((llvm_cbe_count&4294967295U) == (0u&4294967295U))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned long long )llvm_cbe_a;   /* for PHI node */
    goto llvm_cbe_tmp__10;
  } else {
    goto llvm_cbe_tmp__11;
  }

llvm_cbe_tmp__11:
  if ((((signed int )llvm_cbe_count) < ((signed int )64u))) {
    goto llvm_cbe_tmp__12;
  } else {
    goto llvm_cbe_tmp__13;
  }

llvm_cbe_tmp__12:
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = zext i32 %%count to i64, !dbg !17 for 0x%llxth hint within @shift64RightJamming  --> \n", ++aesl_llvm_cbe_17_count);
  llvm_cbe_tmp__1 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_count&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__1);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = lshr i64 %%a, %%5, !dbg !17 for 0x%llxth hint within @shift64RightJamming  --> \n", ++aesl_llvm_cbe_18_count);
  llvm_cbe_tmp__2 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_a&18446744073709551615ull)) >> ((unsigned long long )(llvm_cbe_tmp__1&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__2&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = sub nsw i32 0, %%count, !dbg !17 for 0x%llxth hint within @shift64RightJamming  --> \n", ++aesl_llvm_cbe_19_count);
  llvm_cbe_tmp__3 = (unsigned int )-(llvm_cbe_count);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__3&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = and i32 %%7, 63, !dbg !17 for 0x%llxth hint within @shift64RightJamming  --> \n", ++aesl_llvm_cbe_20_count);
  llvm_cbe_tmp__4 = (unsigned int )llvm_cbe_tmp__3 & 63u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__4);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = zext i32 %%8 to i64, !dbg !17 for 0x%llxth hint within @shift64RightJamming  --> \n", ++aesl_llvm_cbe_21_count);
  llvm_cbe_tmp__5 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__4&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__5);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = shl i64 %%a, %%9, !dbg !17 for 0x%llxth hint within @shift64RightJamming  --> \n", ++aesl_llvm_cbe_22_count);
  llvm_cbe_tmp__6 = (unsigned long long )llvm_cbe_a << llvm_cbe_tmp__5;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__6);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = zext i1 %%11 to i64, !dbg !17 for 0x%llxth hint within @shift64RightJamming  --> \n", ++aesl_llvm_cbe_24_count);
  llvm_cbe_tmp__7 = (unsigned long long )((unsigned long long )(bool )((llvm_cbe_tmp__6&18446744073709551615ULL) != (0ull&18446744073709551615ULL))&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__7);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = or i64 %%12, %%6, !dbg !17 for 0x%llxth hint within @shift64RightJamming  --> \n", ++aesl_llvm_cbe_25_count);
  llvm_cbe_tmp__8 = (unsigned long long )llvm_cbe_tmp__7 | llvm_cbe_tmp__2;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__8);
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__8;   /* for PHI node */
  goto llvm_cbe_tmp__10;

llvm_cbe_tmp__13:
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = zext i1 %%15 to i64, !dbg !17 for 0x%llxth hint within @shift64RightJamming  --> \n", ++aesl_llvm_cbe_29_count);
  llvm_cbe_tmp__9 = (unsigned long long )((unsigned long long )(bool )((llvm_cbe_a&18446744073709551615ULL) != (0ull&18446744073709551615ULL))&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__9);
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__9;   /* for PHI node */
  goto llvm_cbe_tmp__10;

llvm_cbe_tmp__10:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i64 [ %%16, %%14 ], [ %%13, %%4 ], [ %%a, %%0  for 0x%llxth hint within @shift64RightJamming  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned long long )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%llX",llvm_cbe_storemerge1);
printf("\n = 0x%llX",llvm_cbe_tmp__9);
printf("\n = 0x%llX",llvm_cbe_tmp__8);
printf("\na = 0x%llX",llvm_cbe_a);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%storemerge1, i64* %%zPtr, align 8, !dbg !18 for 0x%llxth hint within @shift64RightJamming  --> \n", ++aesl_llvm_cbe_33_count);
  *llvm_cbe_zPtr = llvm_cbe_storemerge1;
if (AESL_DEBUG_TRACE)
printf("\nstoremerge1 = 0x%llX\n", llvm_cbe_storemerge1);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @shift64RightJamming}\n");
  return;
}


void shift64ExtraRightJamming(signed long long llvm_cbe_a0, signed long long llvm_cbe_a1, signed int llvm_cbe_count, signed long long *llvm_cbe_z0Ptr, signed long long *llvm_cbe_z1Ptr) {
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  unsigned int llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  unsigned int llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  unsigned long long llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  unsigned long long llvm_cbe_tmp__17;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  unsigned long long llvm_cbe_tmp__18;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  unsigned long long llvm_cbe_tmp__19;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  unsigned long long llvm_cbe_tmp__20;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  unsigned long long llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  unsigned long long llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  unsigned long long llvm_cbe_tmp__23;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  unsigned long long llvm_cbe_tmp__24;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  unsigned long long llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge3_count = 0;
  unsigned long long llvm_cbe_storemerge3;
  unsigned long long llvm_cbe_storemerge3__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge2_count = 0;
  unsigned long long llvm_cbe_storemerge2;
  unsigned long long llvm_cbe_storemerge2__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @shift64ExtraRightJamming\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = sub nsw i32 0, %%count, !dbg !18 for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_56_count);
  llvm_cbe_tmp__14 = (unsigned int )-(llvm_cbe_count);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__14&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = and i32 %%1, 63, !dbg !18 for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_57_count);
  llvm_cbe_tmp__15 = (unsigned int )llvm_cbe_tmp__14 & 63u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__15);
  if (((llvm_cbe_count&4294967295U) == (0u&4294967295U))) {
    llvm_cbe_storemerge3__PHI_TEMPORARY = (unsigned long long )llvm_cbe_a1;   /* for PHI node */
    llvm_cbe_storemerge2__PHI_TEMPORARY = (unsigned long long )llvm_cbe_a0;   /* for PHI node */
    goto llvm_cbe_tmp__26;
  } else {
    goto llvm_cbe_tmp__27;
  }

llvm_cbe_tmp__27:
  if ((((signed int )llvm_cbe_count) < ((signed int )64u))) {
    goto llvm_cbe_tmp__28;
  } else {
    goto llvm_cbe_tmp__29;
  }

llvm_cbe_tmp__28:
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = zext i32 %%2 to i64, !dbg !17 for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_64_count);
  llvm_cbe_tmp__16 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__15&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__16);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = shl i64 %%a0, %%7, !dbg !17 for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_65_count);
  llvm_cbe_tmp__17 = (unsigned long long )llvm_cbe_a0 << llvm_cbe_tmp__16;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__17);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = zext i1 %%9 to i64, !dbg !17 for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_67_count);
  llvm_cbe_tmp__18 = (unsigned long long )((unsigned long long )(bool )((llvm_cbe_a1&18446744073709551615ULL) != (0ull&18446744073709551615ULL))&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__18);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = or i64 %%8, %%10, !dbg !17 for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_68_count);
  llvm_cbe_tmp__19 = (unsigned long long )llvm_cbe_tmp__17 | llvm_cbe_tmp__18;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__19);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = zext i32 %%count to i64, !dbg !17 for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_71_count);
  llvm_cbe_tmp__20 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_count&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__20);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = lshr i64 %%a0, %%12, !dbg !17 for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_72_count);
  llvm_cbe_tmp__21 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_a0&18446744073709551615ull)) >> ((unsigned long long )(llvm_cbe_tmp__20&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__21&18446744073709551615ull)));
  llvm_cbe_storemerge3__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__19;   /* for PHI node */
  llvm_cbe_storemerge2__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__21;   /* for PHI node */
  goto llvm_cbe_tmp__26;

llvm_cbe_tmp__29:
  if (((llvm_cbe_count&4294967295U) == (64u&4294967295U))) {
    goto llvm_cbe_tmp__30;
  } else {
    goto llvm_cbe_tmp__31;
  }

llvm_cbe_tmp__30:
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = zext i1 %%17 to i64, !dbg !17 for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_78_count);
  llvm_cbe_tmp__22 = (unsigned long long )((unsigned long long )(bool )((llvm_cbe_a1&18446744073709551615ULL) != (0ull&18446744073709551615ULL))&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__22);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = or i64 %%18, %%a0, !dbg !17 for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_79_count);
  llvm_cbe_tmp__23 = (unsigned long long )llvm_cbe_tmp__22 | llvm_cbe_a0;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__23);
  llvm_cbe_storemerge3__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__23;   /* for PHI node */
  llvm_cbe_storemerge2__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
  goto llvm_cbe_tmp__26;

llvm_cbe_tmp__31:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = or i64 %%a1, %%a0, !dbg !18 for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_82_count);
  llvm_cbe_tmp__24 = (unsigned long long )llvm_cbe_a1 | llvm_cbe_a0;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = zext i1 %%22 to i64, !dbg !18 for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_84_count);
  llvm_cbe_tmp__25 = (unsigned long long )((unsigned long long )(bool )((llvm_cbe_tmp__24&18446744073709551615ULL) != (0ull&18446744073709551615ULL))&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__25);
  llvm_cbe_storemerge3__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__25;   /* for PHI node */
  llvm_cbe_storemerge2__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
  goto llvm_cbe_tmp__26;

llvm_cbe_tmp__26:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge3 = phi i64 [ %%11, %%6 ], [ %%a1, %%0 ], [ %%23, %%20 ], [ %%19, %%16  for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_storemerge3_count);
  llvm_cbe_storemerge3 = (unsigned long long )llvm_cbe_storemerge3__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge3 = 0x%llX",llvm_cbe_storemerge3);
printf("\n = 0x%llX",llvm_cbe_tmp__19);
printf("\na1 = 0x%llX",llvm_cbe_a1);
printf("\n = 0x%llX",llvm_cbe_tmp__25);
printf("\n = 0x%llX",llvm_cbe_tmp__23);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge2 = phi i64 [ %%13, %%6 ], [ %%a0, %%0 ], [ 0, %%20 ], [ 0, %%16  for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_storemerge2_count);
  llvm_cbe_storemerge2 = (unsigned long long )llvm_cbe_storemerge2__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge2 = 0x%llX",llvm_cbe_storemerge2);
printf("\n = 0x%llX",llvm_cbe_tmp__21);
printf("\na0 = 0x%llX",llvm_cbe_a0);
printf("\n = 0x%llX",0ull);
printf("\n = 0x%llX",0ull);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%storemerge3, i64* %%z1Ptr, align 8, !dbg !19 for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_88_count);
  *llvm_cbe_z1Ptr = llvm_cbe_storemerge3;
if (AESL_DEBUG_TRACE)
printf("\nstoremerge3 = 0x%llX\n", llvm_cbe_storemerge3);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%storemerge2, i64* %%z0Ptr, align 8, !dbg !19 for 0x%llxth hint within @shift64ExtraRightJamming  --> \n", ++aesl_llvm_cbe_89_count);
  *llvm_cbe_z0Ptr = llvm_cbe_storemerge2;
if (AESL_DEBUG_TRACE)
printf("\nstoremerge2 = 0x%llX\n", llvm_cbe_storemerge2);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @shift64ExtraRightJamming}\n");
  return;
}


void add128(signed long long llvm_cbe_a0, signed long long llvm_cbe_a1, signed long long llvm_cbe_b0, signed long long llvm_cbe_b1, signed long long *llvm_cbe_z0Ptr, signed long long *llvm_cbe_z1Ptr) {
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;
  static  unsigned long long aesl_llvm_cbe_93_count = 0;
  static  unsigned long long aesl_llvm_cbe_94_count = 0;
  static  unsigned long long aesl_llvm_cbe_95_count = 0;
  static  unsigned long long aesl_llvm_cbe_96_count = 0;
  static  unsigned long long aesl_llvm_cbe_97_count = 0;
  static  unsigned long long aesl_llvm_cbe_98_count = 0;
  static  unsigned long long aesl_llvm_cbe_99_count = 0;
  static  unsigned long long aesl_llvm_cbe_100_count = 0;
  static  unsigned long long aesl_llvm_cbe_101_count = 0;
  static  unsigned long long aesl_llvm_cbe_102_count = 0;
  static  unsigned long long aesl_llvm_cbe_103_count = 0;
  unsigned long long llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  unsigned long long llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  unsigned long long llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  unsigned long long llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @add128\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = add i64 %%b1, %%a1, !dbg !17 for 0x%llxth hint within @add128  --> \n", ++aesl_llvm_cbe_103_count);
  llvm_cbe_tmp__32 = (unsigned long long )((unsigned long long )(llvm_cbe_b1&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_a1&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__32&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%1, i64* %%z1Ptr, align 8, !dbg !18 for 0x%llxth hint within @add128  --> \n", ++aesl_llvm_cbe_108_count);
  *llvm_cbe_z1Ptr = llvm_cbe_tmp__32;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__32);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = add i64 %%b0, %%a0, !dbg !17 for 0x%llxth hint within @add128  --> \n", ++aesl_llvm_cbe_109_count);
  llvm_cbe_tmp__33 = (unsigned long long )((unsigned long long )(llvm_cbe_b0&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_a0&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__33&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = zext i1 %%3 to i64, !dbg !17 for 0x%llxth hint within @add128  --> \n", ++aesl_llvm_cbe_111_count);
  llvm_cbe_tmp__34 = (unsigned long long )((unsigned long long )(bool )(((unsigned long long )llvm_cbe_tmp__32&18446744073709551615ULL) < ((unsigned long long )llvm_cbe_a1&18446744073709551615ULL))&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__34);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = add i64 %%2, %%4, !dbg !17 for 0x%llxth hint within @add128  --> \n", ++aesl_llvm_cbe_112_count);
  llvm_cbe_tmp__35 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__33&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__34&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__35&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%5, i64* %%z0Ptr, align 8, !dbg !17 for 0x%llxth hint within @add128  --> \n", ++aesl_llvm_cbe_113_count);
  *llvm_cbe_z0Ptr = llvm_cbe_tmp__35;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__35);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @add128}\n");
  return;
}


void sub128(signed long long llvm_cbe_a0, signed long long llvm_cbe_a1, signed long long llvm_cbe_b0, signed long long llvm_cbe_b1, signed long long *llvm_cbe_z0Ptr, signed long long *llvm_cbe_z1Ptr) {
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;
  static  unsigned long long aesl_llvm_cbe_118_count = 0;
  static  unsigned long long aesl_llvm_cbe_119_count = 0;
  static  unsigned long long aesl_llvm_cbe_120_count = 0;
  static  unsigned long long aesl_llvm_cbe_121_count = 0;
  static  unsigned long long aesl_llvm_cbe_122_count = 0;
  static  unsigned long long aesl_llvm_cbe_123_count = 0;
  static  unsigned long long aesl_llvm_cbe_124_count = 0;
  static  unsigned long long aesl_llvm_cbe_125_count = 0;
  static  unsigned long long aesl_llvm_cbe_126_count = 0;
  static  unsigned long long aesl_llvm_cbe_127_count = 0;
  static  unsigned long long aesl_llvm_cbe_128_count = 0;
  unsigned long long llvm_cbe_tmp__36;
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  static  unsigned long long aesl_llvm_cbe_130_count = 0;
  static  unsigned long long aesl_llvm_cbe_131_count = 0;
  unsigned long long llvm_cbe_tmp__37;
  static  unsigned long long aesl_llvm_cbe_132_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_neg_count = 0;
  unsigned long long llvm_cbe__2e_neg;
  static  unsigned long long aesl_llvm_cbe_133_count = 0;
  unsigned long long llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_134_count = 0;
  static  unsigned long long aesl_llvm_cbe_135_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @sub128\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = sub i64 %%a1, %%b1, !dbg !17 for 0x%llxth hint within @sub128  --> \n", ++aesl_llvm_cbe_128_count);
  llvm_cbe_tmp__36 = (unsigned long long )((unsigned long long )(llvm_cbe_a1&18446744073709551615ull)) - ((unsigned long long )(llvm_cbe_b1&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__36&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%1, i64* %%z1Ptr, align 8, !dbg !17 for 0x%llxth hint within @sub128  --> \n", ++aesl_llvm_cbe_130_count);
  *llvm_cbe_z1Ptr = llvm_cbe_tmp__36;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__36);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sub i64 %%a0, %%b0, !dbg !17 for 0x%llxth hint within @sub128  --> \n", ++aesl_llvm_cbe_131_count);
  llvm_cbe_tmp__37 = (unsigned long long )((unsigned long long )(llvm_cbe_a0&18446744073709551615ull)) - ((unsigned long long )(llvm_cbe_b0&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__37&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%.neg = sext i1 %%3 to i6 for 0x%llxth hint within @sub128  --> \n", ++aesl_llvm_cbe__2e_neg_count);
  llvm_cbe__2e_neg = (unsigned long long )((signed long long )(0-(((unsigned long long )llvm_cbe_a1&18446744073709551615ULL) < ((unsigned long long )llvm_cbe_b1&18446744073709551615ULL))));
if (AESL_DEBUG_TRACE)
printf("\n.neg = 0x%llX\n", llvm_cbe__2e_neg);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = add i64 %%2, %%.neg, !dbg !17 for 0x%llxth hint within @sub128  --> \n", ++aesl_llvm_cbe_133_count);
  llvm_cbe_tmp__38 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__37&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe__2e_neg&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__38&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%4, i64* %%z0Ptr, align 8, !dbg !17 for 0x%llxth hint within @sub128  --> \n", ++aesl_llvm_cbe_134_count);
  *llvm_cbe_z0Ptr = llvm_cbe_tmp__38;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__38);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @sub128}\n");
  return;
}


void mul64To128(signed long long llvm_cbe_a, signed long long llvm_cbe_b, signed long long *llvm_cbe_z0Ptr, signed long long *llvm_cbe_z1Ptr) {
  static  unsigned long long aesl_llvm_cbe_136_count = 0;
  static  unsigned long long aesl_llvm_cbe_137_count = 0;
  static  unsigned long long aesl_llvm_cbe_138_count = 0;
  static  unsigned long long aesl_llvm_cbe_139_count = 0;
  static  unsigned long long aesl_llvm_cbe_140_count = 0;
  static  unsigned long long aesl_llvm_cbe_141_count = 0;
  static  unsigned long long aesl_llvm_cbe_142_count = 0;
  static  unsigned long long aesl_llvm_cbe_143_count = 0;
  static  unsigned long long aesl_llvm_cbe_144_count = 0;
  static  unsigned long long aesl_llvm_cbe_145_count = 0;
  unsigned int llvm_cbe_tmp__39;
  static  unsigned long long aesl_llvm_cbe_146_count = 0;
  static  unsigned long long aesl_llvm_cbe_147_count = 0;
  static  unsigned long long aesl_llvm_cbe_148_count = 0;
  static  unsigned long long aesl_llvm_cbe_149_count = 0;
  static  unsigned long long aesl_llvm_cbe_150_count = 0;
  unsigned long long llvm_cbe_tmp__40;
  static  unsigned long long aesl_llvm_cbe_151_count = 0;
  unsigned int llvm_cbe_tmp__41;
  static  unsigned long long aesl_llvm_cbe_152_count = 0;
  static  unsigned long long aesl_llvm_cbe_153_count = 0;
  static  unsigned long long aesl_llvm_cbe_154_count = 0;
  static  unsigned long long aesl_llvm_cbe_155_count = 0;
  unsigned int llvm_cbe_tmp__42;
  static  unsigned long long aesl_llvm_cbe_156_count = 0;
  static  unsigned long long aesl_llvm_cbe_157_count = 0;
  static  unsigned long long aesl_llvm_cbe_158_count = 0;
  static  unsigned long long aesl_llvm_cbe_159_count = 0;
  unsigned long long llvm_cbe_tmp__43;
  static  unsigned long long aesl_llvm_cbe_160_count = 0;
  unsigned int llvm_cbe_tmp__44;
  static  unsigned long long aesl_llvm_cbe_161_count = 0;
  static  unsigned long long aesl_llvm_cbe_162_count = 0;
  static  unsigned long long aesl_llvm_cbe_163_count = 0;
  static  unsigned long long aesl_llvm_cbe_164_count = 0;
  unsigned long long llvm_cbe_tmp__45;
  static  unsigned long long aesl_llvm_cbe_165_count = 0;
  unsigned long long llvm_cbe_tmp__46;
  static  unsigned long long aesl_llvm_cbe_166_count = 0;
  unsigned long long llvm_cbe_tmp__47;
  static  unsigned long long aesl_llvm_cbe_167_count = 0;
  static  unsigned long long aesl_llvm_cbe_168_count = 0;
  static  unsigned long long aesl_llvm_cbe_169_count = 0;
  static  unsigned long long aesl_llvm_cbe_170_count = 0;
  static  unsigned long long aesl_llvm_cbe_171_count = 0;
  unsigned long long llvm_cbe_tmp__48;
  static  unsigned long long aesl_llvm_cbe_172_count = 0;
  unsigned long long llvm_cbe_tmp__49;
  static  unsigned long long aesl_llvm_cbe_173_count = 0;
  static  unsigned long long aesl_llvm_cbe_174_count = 0;
  static  unsigned long long aesl_llvm_cbe_175_count = 0;
  static  unsigned long long aesl_llvm_cbe_176_count = 0;
  static  unsigned long long aesl_llvm_cbe_177_count = 0;
  static  unsigned long long aesl_llvm_cbe_178_count = 0;
  static  unsigned long long aesl_llvm_cbe_179_count = 0;
  static  unsigned long long aesl_llvm_cbe_180_count = 0;
  unsigned long long llvm_cbe_tmp__50;
  static  unsigned long long aesl_llvm_cbe_181_count = 0;
  unsigned long long llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_182_count = 0;
  static  unsigned long long aesl_llvm_cbe_183_count = 0;
  static  unsigned long long aesl_llvm_cbe_184_count = 0;
  static  unsigned long long aesl_llvm_cbe_185_count = 0;
  unsigned long long llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_186_count = 0;
  static  unsigned long long aesl_llvm_cbe_187_count = 0;
  static  unsigned long long aesl_llvm_cbe_188_count = 0;
  static  unsigned long long aesl_llvm_cbe_189_count = 0;
  static  unsigned long long aesl_llvm_cbe_190_count = 0;
  unsigned long long llvm_cbe_tmp__53;
  static  unsigned long long aesl_llvm_cbe_191_count = 0;
  static  unsigned long long aesl_llvm_cbe_192_count = 0;
  static  unsigned long long aesl_llvm_cbe_193_count = 0;
  static  unsigned long long aesl_llvm_cbe_194_count = 0;
  static  unsigned long long aesl_llvm_cbe_195_count = 0;
  static  unsigned long long aesl_llvm_cbe_196_count = 0;
  static  unsigned long long aesl_llvm_cbe_197_count = 0;
  static  unsigned long long aesl_llvm_cbe_198_count = 0;
  static  unsigned long long aesl_llvm_cbe_199_count = 0;
  unsigned long long llvm_cbe_tmp__54;
  static  unsigned long long aesl_llvm_cbe_200_count = 0;
  unsigned long long llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_201_count = 0;
  unsigned long long llvm_cbe_tmp__56;
  static  unsigned long long aesl_llvm_cbe_202_count = 0;
  unsigned long long llvm_cbe_tmp__57;
  static  unsigned long long aesl_llvm_cbe_203_count = 0;
  unsigned long long llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_204_count = 0;
  static  unsigned long long aesl_llvm_cbe_205_count = 0;
  static  unsigned long long aesl_llvm_cbe_206_count = 0;
  static  unsigned long long aesl_llvm_cbe_207_count = 0;
  static  unsigned long long aesl_llvm_cbe_208_count = 0;
  unsigned long long llvm_cbe_tmp__59;
  static  unsigned long long aesl_llvm_cbe_209_count = 0;
  static  unsigned long long aesl_llvm_cbe_210_count = 0;
  static  unsigned long long aesl_llvm_cbe_211_count = 0;
  static  unsigned long long aesl_llvm_cbe_212_count = 0;
  static  unsigned long long aesl_llvm_cbe_213_count = 0;
  static  unsigned long long aesl_llvm_cbe_214_count = 0;
  static  unsigned long long aesl_llvm_cbe_215_count = 0;
  static  unsigned long long aesl_llvm_cbe_216_count = 0;
  unsigned long long llvm_cbe_tmp__60;
  static  unsigned long long aesl_llvm_cbe_217_count = 0;
  static  unsigned long long aesl_llvm_cbe_218_count = 0;
  static  unsigned long long aesl_llvm_cbe_219_count = 0;
  static  unsigned long long aesl_llvm_cbe_220_count = 0;
  static  unsigned long long aesl_llvm_cbe_221_count = 0;
  static  unsigned long long aesl_llvm_cbe_222_count = 0;
  unsigned long long llvm_cbe_tmp__61;
  static  unsigned long long aesl_llvm_cbe_223_count = 0;
  unsigned long long llvm_cbe_tmp__62;
  static  unsigned long long aesl_llvm_cbe_224_count = 0;
  static  unsigned long long aesl_llvm_cbe_225_count = 0;
  static  unsigned long long aesl_llvm_cbe_226_count = 0;
  static  unsigned long long aesl_llvm_cbe_227_count = 0;
  static  unsigned long long aesl_llvm_cbe_228_count = 0;
  static  unsigned long long aesl_llvm_cbe_229_count = 0;
  static  unsigned long long aesl_llvm_cbe_230_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @mul64To128\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = trunc i64 %%a to i32, !dbg !18 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_145_count);
  llvm_cbe_tmp__39 = (unsigned int )((unsigned int )llvm_cbe_a&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__39);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = lshr i64 %%a, 32, !dbg !18 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_150_count);
  llvm_cbe_tmp__40 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_a&18446744073709551615ull)) >> ((unsigned long long )(32ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__40&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = trunc i64 %%2 to i32, !dbg !18 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_151_count);
  llvm_cbe_tmp__41 = (unsigned int )((unsigned int )llvm_cbe_tmp__40&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__41);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = trunc i64 %%b to i32, !dbg !17 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_155_count);
  llvm_cbe_tmp__42 = (unsigned int )((unsigned int )llvm_cbe_b&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__42);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = lshr i64 %%b, 32, !dbg !17 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_159_count);
  llvm_cbe_tmp__43 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_b&18446744073709551615ull)) >> ((unsigned long long )(32ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__43&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = trunc i64 %%5 to i32, !dbg !17 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_160_count);
  llvm_cbe_tmp__44 = (unsigned int )((unsigned int )llvm_cbe_tmp__43&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__44);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = zext i32 %%1 to i64, !dbg !18 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_164_count);
  llvm_cbe_tmp__45 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__39&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__45);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = zext i32 %%4 to i64, !dbg !18 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_165_count);
  llvm_cbe_tmp__46 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__42&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__46);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = mul i64 %%8, %%7, !dbg !18 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_166_count);
  llvm_cbe_tmp__47 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__46&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__45&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__47&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = zext i32 %%6 to i64, !dbg !18 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_171_count);
  llvm_cbe_tmp__48 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__44&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__48);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = mul i64 %%10, %%7, !dbg !18 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_172_count);
  llvm_cbe_tmp__49 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__48&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__45&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__49&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = zext i32 %%3 to i64, !dbg !19 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_180_count);
  llvm_cbe_tmp__50 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__41&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__50);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = mul i64 %%12, %%8, !dbg !19 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_181_count);
  llvm_cbe_tmp__51 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__50&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__46&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__51&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = mul i64 %%10, %%12, !dbg !19 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_185_count);
  llvm_cbe_tmp__52 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__48&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__50&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__52&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = add i64 %%11, %%13, !dbg !19 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_190_count);
  llvm_cbe_tmp__53 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__49&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__51&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__53&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = zext i1 %%16 to i64, !dbg !19 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_199_count);
  llvm_cbe_tmp__54 = (unsigned long long )((unsigned long long )(bool )(((unsigned long long )llvm_cbe_tmp__53&18446744073709551615ULL) < ((unsigned long long )llvm_cbe_tmp__51&18446744073709551615ULL))&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__54);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = shl nuw nsw i64 %%17, 32, !dbg !19 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_200_count);
  llvm_cbe_tmp__55 = (unsigned long long )llvm_cbe_tmp__54 << 32ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__55);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = lshr i64 %%15, 32, !dbg !19 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_201_count);
  llvm_cbe_tmp__56 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__53&18446744073709551615ull)) >> ((unsigned long long )(32ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__56&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = or i64 %%18, %%19, !dbg !19 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_202_count);
  llvm_cbe_tmp__57 = (unsigned long long )llvm_cbe_tmp__55 | llvm_cbe_tmp__56;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__57);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = add i64 %%20, %%14, !dbg !19 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_203_count);
  llvm_cbe_tmp__58 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__57&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__52&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__58&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = shl i64 %%15, 32, !dbg !20 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_208_count);
  llvm_cbe_tmp__59 = (unsigned long long )llvm_cbe_tmp__53 << 32ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__59);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = add i64 %%22, %%9, !dbg !19 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_216_count);
  llvm_cbe_tmp__60 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__59&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__47&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__60&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = zext i1 %%24 to i64, !dbg !19 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_222_count);
  llvm_cbe_tmp__61 = (unsigned long long )((unsigned long long )(bool )(((unsigned long long )llvm_cbe_tmp__60&18446744073709551615ULL) < ((unsigned long long )llvm_cbe_tmp__59&18446744073709551615ULL))&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__61);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = add i64 %%21, %%25, !dbg !19 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_223_count);
  llvm_cbe_tmp__62 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__58&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__61&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__62&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%23, i64* %%z1Ptr, align 8, !dbg !18 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_228_count);
  *llvm_cbe_z1Ptr = llvm_cbe_tmp__60;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__60);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%26, i64* %%z0Ptr, align 8, !dbg !17 for 0x%llxth hint within @mul64To128  --> \n", ++aesl_llvm_cbe_229_count);
  *llvm_cbe_z0Ptr = llvm_cbe_tmp__62;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__62);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @mul64To128}\n");
  return;
}


void float_raise(signed int llvm_cbe_flags) {
  static  unsigned long long aesl_llvm_cbe_231_count = 0;
  static  unsigned long long aesl_llvm_cbe_232_count = 0;
  static  unsigned long long aesl_llvm_cbe_233_count = 0;
  unsigned int llvm_cbe_tmp__63;
  static  unsigned long long aesl_llvm_cbe_234_count = 0;
  unsigned int llvm_cbe_tmp__64;
  static  unsigned long long aesl_llvm_cbe_235_count = 0;
  static  unsigned long long aesl_llvm_cbe_236_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @float_raise\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i32* @float_exception_flags, align 4, !dbg !17 for 0x%llxth hint within @float_raise  --> \n", ++aesl_llvm_cbe_233_count);
  llvm_cbe_tmp__63 = (unsigned int )*(&float_exception_flags);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__63);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = or i32 %%1, %%flags, !dbg !17 for 0x%llxth hint within @float_raise  --> \n", ++aesl_llvm_cbe_234_count);
  llvm_cbe_tmp__64 = (unsigned int )llvm_cbe_tmp__63 | llvm_cbe_flags;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__64);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%2, i32* @float_exception_flags, align 4, !dbg !17 for 0x%llxth hint within @float_raise  --> \n", ++aesl_llvm_cbe_235_count);
  *(&float_exception_flags) = llvm_cbe_tmp__64;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__64);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @float_raise}\n");
  return;
}


signed int float64_is_nan(signed long long llvm_cbe_a) {
  static  unsigned long long aesl_llvm_cbe_237_count = 0;
  static  unsigned long long aesl_llvm_cbe_238_count = 0;
  static  unsigned long long aesl_llvm_cbe_239_count = 0;
  unsigned long long llvm_cbe_tmp__65;
  static  unsigned long long aesl_llvm_cbe_240_count = 0;
  static  unsigned long long aesl_llvm_cbe_241_count = 0;
  unsigned int llvm_cbe_tmp__66;
  static  unsigned long long aesl_llvm_cbe_242_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @float64_is_nan\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = shl i64 %%a, 1, !dbg !17 for 0x%llxth hint within @float64_is_nan  --> \n", ++aesl_llvm_cbe_239_count);
  llvm_cbe_tmp__65 = (unsigned long long )llvm_cbe_a << 1ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__65);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = zext i1 %%2 to i32, !dbg !17 for 0x%llxth hint within @float64_is_nan  --> \n", ++aesl_llvm_cbe_241_count);
  llvm_cbe_tmp__66 = (unsigned int )((unsigned int )(bool )(((unsigned long long )llvm_cbe_tmp__65&18446744073709551615ULL) > ((unsigned long long )18437736874454810624ull&18446744073709551615ULL))&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__66);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @float64_is_nan}\n");
  return llvm_cbe_tmp__66;
}


signed int float64_is_signaling_nan(signed long long llvm_cbe_a) {
  static  unsigned long long aesl_llvm_cbe_243_count = 0;
  static  unsigned long long aesl_llvm_cbe_244_count = 0;
  static  unsigned long long aesl_llvm_cbe_245_count = 0;
  static  unsigned long long aesl_llvm_cbe_246_count = 0;
  unsigned long long llvm_cbe_tmp__67;
  static  unsigned long long aesl_llvm_cbe_247_count = 0;
  static  unsigned long long aesl_llvm_cbe_248_count = 0;
  static  unsigned long long aesl_llvm_cbe_249_count = 0;
  unsigned long long llvm_cbe_tmp__68;
  static  unsigned long long aesl_llvm_cbe_250_count = 0;
  static  unsigned long long aesl_llvm_cbe_251_count = 0;
  static  unsigned long long aesl_llvm_cbe_252_count = 0;
  bool llvm_cbe_tmp__69;
  bool llvm_cbe_tmp__69__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_253_count = 0;
  unsigned int llvm_cbe_tmp__70;
  static  unsigned long long aesl_llvm_cbe_254_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @float64_is_signaling_nan\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = and i64 %%a, 9221120237041090560, !dbg !17 for 0x%llxth hint within @float64_is_signaling_nan  --> \n", ++aesl_llvm_cbe_246_count);
  llvm_cbe_tmp__67 = (unsigned long long )llvm_cbe_a & 9221120237041090560ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__67);
  if (((llvm_cbe_tmp__67&18446744073709551615ULL) == (9218868437227405312ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__71;
  } else {
    llvm_cbe_tmp__69__PHI_TEMPORARY = (bool )0;   /* for PHI node */
    goto llvm_cbe_tmp__72;
  }

llvm_cbe_tmp__71:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = and i64 %%a, 2251799813685247, !dbg !17 for 0x%llxth hint within @float64_is_signaling_nan  --> \n", ++aesl_llvm_cbe_249_count);
  llvm_cbe_tmp__68 = (unsigned long long )llvm_cbe_a & 2251799813685247ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__68);
  llvm_cbe_tmp__69__PHI_TEMPORARY = (bool )((llvm_cbe_tmp__68&18446744073709551615ULL) != (0ull&18446744073709551615ULL));   /* for PHI node */
  goto llvm_cbe_tmp__72;

llvm_cbe_tmp__72:
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = phi i1 [ false, %%0 ], [ %%5, %%3  for 0x%llxth hint within @float64_is_signaling_nan  --> \n", ++aesl_llvm_cbe_252_count);
  llvm_cbe_tmp__69 = (bool )((llvm_cbe_tmp__69__PHI_TEMPORARY)&1);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__69);
printf("\n = 0x%X",0);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = zext i1 %%7 to i3 for 0x%llxth hint within @float64_is_signaling_nan  --> \n", ++aesl_llvm_cbe_253_count);
  llvm_cbe_tmp__70 = (unsigned int )((unsigned int )(bool )llvm_cbe_tmp__69&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__70);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @float64_is_signaling_nan}\n");
  return llvm_cbe_tmp__70;
}


signed long long extractFloat64Frac(signed long long llvm_cbe_a) {
  static  unsigned long long aesl_llvm_cbe_255_count = 0;
  static  unsigned long long aesl_llvm_cbe_256_count = 0;
  static  unsigned long long aesl_llvm_cbe_257_count = 0;
  unsigned long long llvm_cbe_tmp__73;
  static  unsigned long long aesl_llvm_cbe_258_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @extractFloat64Frac\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = and i64 %%a, 4503599627370495, !dbg !17 for 0x%llxth hint within @extractFloat64Frac  --> \n", ++aesl_llvm_cbe_257_count);
  llvm_cbe_tmp__73 = (unsigned long long )llvm_cbe_a & 4503599627370495ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__73);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @extractFloat64Frac}\n");
  return llvm_cbe_tmp__73;
}


signed int extractFloat64Exp(signed long long llvm_cbe_a) {
  static  unsigned long long aesl_llvm_cbe_259_count = 0;
  static  unsigned long long aesl_llvm_cbe_260_count = 0;
  static  unsigned long long aesl_llvm_cbe_261_count = 0;
  unsigned long long llvm_cbe_tmp__74;
  static  unsigned long long aesl_llvm_cbe_262_count = 0;
  unsigned int llvm_cbe_tmp__75;
  static  unsigned long long aesl_llvm_cbe_263_count = 0;
  unsigned int llvm_cbe_tmp__76;
  static  unsigned long long aesl_llvm_cbe_264_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @extractFloat64Exp\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = lshr i64 %%a, 52, !dbg !17 for 0x%llxth hint within @extractFloat64Exp  --> \n", ++aesl_llvm_cbe_261_count);
  llvm_cbe_tmp__74 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_a&18446744073709551615ull)) >> ((unsigned long long )(52ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__74&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = trunc i64 %%1 to i32, !dbg !17 for 0x%llxth hint within @extractFloat64Exp  --> \n", ++aesl_llvm_cbe_262_count);
  llvm_cbe_tmp__75 = (unsigned int )((unsigned int )llvm_cbe_tmp__74&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__75);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = and i32 %%2, 2047, !dbg !17 for 0x%llxth hint within @extractFloat64Exp  --> \n", ++aesl_llvm_cbe_263_count);
  llvm_cbe_tmp__76 = (unsigned int )llvm_cbe_tmp__75 & 2047u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__76);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @extractFloat64Exp}\n");
  return llvm_cbe_tmp__76;
}


signed int extractFloat64Sign(signed long long llvm_cbe_a) {
  static  unsigned long long aesl_llvm_cbe_265_count = 0;
  static  unsigned long long aesl_llvm_cbe_266_count = 0;
  static  unsigned long long aesl_llvm_cbe_267_count = 0;
  unsigned long long llvm_cbe_tmp__77;
  static  unsigned long long aesl_llvm_cbe_268_count = 0;
  unsigned int llvm_cbe_tmp__78;
  static  unsigned long long aesl_llvm_cbe_269_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @extractFloat64Sign\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = lshr i64 %%a, 63, !dbg !17 for 0x%llxth hint within @extractFloat64Sign  --> \n", ++aesl_llvm_cbe_267_count);
  llvm_cbe_tmp__77 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_a&18446744073709551615ull)) >> ((unsigned long long )(63ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__77&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = trunc i64 %%1 to i32, !dbg !17 for 0x%llxth hint within @extractFloat64Sign  --> \n", ++aesl_llvm_cbe_268_count);
  llvm_cbe_tmp__78 = (unsigned int )((unsigned int )llvm_cbe_tmp__77&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__78);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @extractFloat64Sign}\n");
  return llvm_cbe_tmp__78;
}


signed long long packFloat64(signed int llvm_cbe_zSign, signed int llvm_cbe_zExp, signed long long llvm_cbe_zSig) {
  static  unsigned long long aesl_llvm_cbe_270_count = 0;
  static  unsigned long long aesl_llvm_cbe_271_count = 0;
  static  unsigned long long aesl_llvm_cbe_272_count = 0;
  static  unsigned long long aesl_llvm_cbe_273_count = 0;
  static  unsigned long long aesl_llvm_cbe_274_count = 0;
  unsigned long long llvm_cbe_tmp__79;
  static  unsigned long long aesl_llvm_cbe_275_count = 0;
  unsigned long long llvm_cbe_tmp__80;
  static  unsigned long long aesl_llvm_cbe_276_count = 0;
  static  unsigned long long aesl_llvm_cbe_277_count = 0;
  unsigned long long llvm_cbe_tmp__81;
  static  unsigned long long aesl_llvm_cbe_278_count = 0;
  unsigned long long llvm_cbe_tmp__82;
  static  unsigned long long aesl_llvm_cbe_279_count = 0;
  static  unsigned long long aesl_llvm_cbe_280_count = 0;
  unsigned long long llvm_cbe_tmp__83;
  static  unsigned long long aesl_llvm_cbe_281_count = 0;
  unsigned long long llvm_cbe_tmp__84;
  static  unsigned long long aesl_llvm_cbe_282_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @packFloat64\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = zext i32 %%zSign to i64, !dbg !17 for 0x%llxth hint within @packFloat64  --> \n", ++aesl_llvm_cbe_274_count);
  llvm_cbe_tmp__79 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_zSign&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__79);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = shl i64 %%1, 63, !dbg !17 for 0x%llxth hint within @packFloat64  --> \n", ++aesl_llvm_cbe_275_count);
  llvm_cbe_tmp__80 = (unsigned long long )llvm_cbe_tmp__79 << 63ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__80);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = zext i32 %%zExp to i64, !dbg !17 for 0x%llxth hint within @packFloat64  --> \n", ++aesl_llvm_cbe_277_count);
  llvm_cbe_tmp__81 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_zExp&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__81);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = shl i64 %%3, 52, !dbg !17 for 0x%llxth hint within @packFloat64  --> \n", ++aesl_llvm_cbe_278_count);
  llvm_cbe_tmp__82 = (unsigned long long )llvm_cbe_tmp__81 << 52ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__82);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = add i64 %%2, %%zSig, !dbg !17 for 0x%llxth hint within @packFloat64  --> \n", ++aesl_llvm_cbe_280_count);
  llvm_cbe_tmp__83 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__80&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_zSig&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__83&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = add i64 %%5, %%4, !dbg !17 for 0x%llxth hint within @packFloat64  --> \n", ++aesl_llvm_cbe_281_count);
  llvm_cbe_tmp__84 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__83&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__82&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__84&18446744073709551615ull)));
  if (AESL_DEBUG_TRACE)
      printf("\nEND @packFloat64}\n");
  return llvm_cbe_tmp__84;
}


signed long long int32_to_float64(signed int llvm_cbe_a) {
  static  unsigned long long aesl_llvm_cbe_283_count = 0;
  static  unsigned long long aesl_llvm_cbe_284_count = 0;
  static  unsigned long long aesl_llvm_cbe_285_count = 0;
  static  unsigned long long aesl_llvm_cbe_286_count = 0;
  static  unsigned long long aesl_llvm_cbe_287_count = 0;
  static  unsigned long long aesl_llvm_cbe_288_count = 0;
  static  unsigned long long aesl_llvm_cbe_289_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_lobit_count = 0;
  unsigned int llvm_cbe__2e_lobit;
  static  unsigned long long aesl_llvm_cbe_290_count = 0;
  static  unsigned long long aesl_llvm_cbe_291_count = 0;
  static  unsigned long long aesl_llvm_cbe_292_count = 0;
  static  unsigned long long aesl_llvm_cbe_293_count = 0;
  static  unsigned long long aesl_llvm_cbe_294_count = 0;
  unsigned int llvm_cbe_tmp__85;
  static  unsigned long long aesl_llvm_cbe_a_2e__count = 0;
  unsigned int llvm_cbe_a_2e_;
  static  unsigned long long aesl_llvm_cbe_295_count = 0;
  static  unsigned long long aesl_llvm_cbe_296_count = 0;
  static  unsigned long long aesl_llvm_cbe_297_count = 0;
  static  unsigned long long aesl_llvm_cbe_298_count = 0;
  unsigned int llvm_cbe_tmp__86;
  static  unsigned long long aesl_llvm_cbe_299_count = 0;
  unsigned int llvm_cbe_tmp__87;
  static  unsigned long long aesl_llvm_cbe_300_count = 0;
  static  unsigned long long aesl_llvm_cbe_301_count = 0;
  unsigned long long llvm_cbe_tmp__88;
  static  unsigned long long aesl_llvm_cbe_302_count = 0;
  static  unsigned long long aesl_llvm_cbe_303_count = 0;
  static  unsigned long long aesl_llvm_cbe_304_count = 0;
  unsigned int llvm_cbe_tmp__89;
  static  unsigned long long aesl_llvm_cbe_305_count = 0;
  static  unsigned long long aesl_llvm_cbe_306_count = 0;
  static  unsigned long long aesl_llvm_cbe_307_count = 0;
  unsigned long long llvm_cbe_tmp__90;
  static  unsigned long long aesl_llvm_cbe_308_count = 0;
  unsigned long long llvm_cbe_tmp__91;
  static  unsigned long long aesl_llvm_cbe_309_count = 0;
  unsigned long long llvm_cbe_tmp__92;
  static  unsigned long long aesl_llvm_cbe_310_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
  unsigned long long llvm_cbe_storemerge;
  unsigned long long llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_311_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @int32_to_float64\n");
  if (((llvm_cbe_a&4294967295U) == (0u&4294967295U))) {
    llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
    goto llvm_cbe_tmp__93;
  } else {
    goto llvm_cbe_tmp__94;
  }

llvm_cbe_tmp__94:
if (AESL_DEBUG_TRACE)
printf("\n  %%.lobit = lshr i32 %%a, 31, !dbg !17 for 0x%llxth hint within @int32_to_float64  --> \n", ++aesl_llvm_cbe__2e_lobit_count);
  llvm_cbe__2e_lobit = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_a&4294967295ull)) >> ((unsigned int )(31u&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n.lobit = 0x%X\n", ((unsigned int )(llvm_cbe__2e_lobit&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = sub nsw i32 0, %%a, !dbg !17 for 0x%llxth hint within @int32_to_float64  --> \n", ++aesl_llvm_cbe_294_count);
  llvm_cbe_tmp__85 = (unsigned int )-(llvm_cbe_a);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__85&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%a. = select i1 %%3, i32 %%a, i32 %%4, !dbg !17 for 0x%llxth hint within @int32_to_float64  --> \n", ++aesl_llvm_cbe_a_2e__count);
  llvm_cbe_a_2e_ = (unsigned int )((((llvm_cbe__2e_lobit&4294967295U) == (0u&4294967295U))) ? ((unsigned int )llvm_cbe_a) : ((unsigned int )llvm_cbe_tmp__85));
if (AESL_DEBUG_TRACE)
printf("\na. = 0x%X\n", llvm_cbe_a_2e_);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = tail call fastcc i32 @aesl_internal_countLeadingZeros32(i32 %%a.), !dbg !18 for 0x%llxth hint within @int32_to_float64  --> \n", ++aesl_llvm_cbe_298_count);
  llvm_cbe_tmp__86 = (unsigned int ) /*tail*/ aesl_internal_countLeadingZeros32(llvm_cbe_a_2e_);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a. = 0x%X",llvm_cbe_a_2e_);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__86);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = add nsw i32 %%5, 21, !dbg !18 for 0x%llxth hint within @int32_to_float64  --> \n", ++aesl_llvm_cbe_299_count);
  llvm_cbe_tmp__87 = (unsigned int )((unsigned int )(llvm_cbe_tmp__86&4294967295ull)) + ((unsigned int )(21u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__87&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = zext i32 %%a. to i64, !dbg !18 for 0x%llxth hint within @int32_to_float64  --> \n", ++aesl_llvm_cbe_301_count);
  llvm_cbe_tmp__88 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_a_2e_&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__88);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = sub i32 1053, %%5, !dbg !17 for 0x%llxth hint within @int32_to_float64  --> \n", ++aesl_llvm_cbe_304_count);
  llvm_cbe_tmp__89 = (unsigned int )((unsigned int )(1053u&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__86&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__89&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = zext i32 %%6 to i64, !dbg !17 for 0x%llxth hint within @int32_to_float64  --> \n", ++aesl_llvm_cbe_307_count);
  llvm_cbe_tmp__90 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__87&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__90);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = shl i64 %%7, %%9, !dbg !17 for 0x%llxth hint within @int32_to_float64  --> \n", ++aesl_llvm_cbe_308_count);
  llvm_cbe_tmp__91 = (unsigned long long )llvm_cbe_tmp__88 << llvm_cbe_tmp__90;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__91);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = tail call i64 @packFloat64(i32 %%.lobit, i32 %%8, i64 %%10), !dbg !17 for 0x%llxth hint within @int32_to_float64  --> \n", ++aesl_llvm_cbe_309_count);
  llvm_cbe_tmp__92 = (unsigned long long ) /*tail*/ packFloat64(llvm_cbe__2e_lobit, llvm_cbe_tmp__89, llvm_cbe_tmp__91);
if (AESL_DEBUG_TRACE) {
printf("\nArgument .lobit = 0x%X",llvm_cbe__2e_lobit);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__89);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__91);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__92);
}
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__92;   /* for PHI node */
  goto llvm_cbe_tmp__93;

llvm_cbe_tmp__93:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i64 [ %%11, %%2 ], [ 0, %%0  for 0x%llxth hint within @int32_to_float64  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = (unsigned long long )llvm_cbe_storemerge__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge = 0x%llX",llvm_cbe_storemerge);
printf("\n = 0x%llX",llvm_cbe_tmp__92);
printf("\n = 0x%llX",0ull);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @int32_to_float64}\n");
  return llvm_cbe_storemerge;
}


static signed int aesl_internal_countLeadingZeros32(signed int llvm_cbe_a) {
  static  unsigned long long aesl_llvm_cbe_312_count = 0;
  static  unsigned long long aesl_llvm_cbe_313_count = 0;
  static  unsigned long long aesl_llvm_cbe_314_count = 0;
  static  unsigned long long aesl_llvm_cbe_315_count = 0;
  static  unsigned long long aesl_llvm_cbe_316_count = 0;
  static  unsigned long long aesl_llvm_cbe_317_count = 0;
  static  unsigned long long aesl_llvm_cbe_318_count = 0;
  static  unsigned long long aesl_llvm_cbe_319_count = 0;
  static  unsigned long long aesl_llvm_cbe_320_count = 0;
  static  unsigned long long aesl_llvm_cbe_321_count = 0;
  static  unsigned long long aesl_llvm_cbe_322_count = 0;
  static  unsigned long long aesl_llvm_cbe_323_count = 0;
  static  unsigned long long aesl_llvm_cbe_324_count = 0;
  unsigned int llvm_cbe_tmp__95;
  static  unsigned long long aesl_llvm_cbe_325_count = 0;
  static  unsigned long long aesl_llvm_cbe_326_count = 0;
  static  unsigned long long aesl_llvm_cbe_327_count = 0;
  static  unsigned long long aesl_llvm_cbe_328_count = 0;
  static  unsigned long long aesl_llvm_cbe_329_count = 0;
  static  unsigned long long aesl_llvm_cbe_330_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned int llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe__2e_a_count = 0;
  unsigned int llvm_cbe__2e_a;
  static  unsigned long long aesl_llvm_cbe_331_count = 0;
  static  unsigned long long aesl_llvm_cbe_332_count = 0;
  static  unsigned long long aesl_llvm_cbe_333_count = 0;
  unsigned int llvm_cbe_tmp__96;
  static  unsigned long long aesl_llvm_cbe_334_count = 0;
  static  unsigned long long aesl_llvm_cbe_335_count = 0;
  static  unsigned long long aesl_llvm_cbe_336_count = 0;
  static  unsigned long long aesl_llvm_cbe_337_count = 0;
  static  unsigned long long aesl_llvm_cbe_338_count = 0;
  static  unsigned long long aesl_llvm_cbe_339_count = 0;
  unsigned int llvm_cbe_tmp__97;
  static  unsigned long long aesl_llvm_cbe_340_count = 0;
  static  unsigned long long aesl_llvm_cbe_341_count = 0;
  static  unsigned long long aesl_llvm_cbe_342_count = 0;
  static  unsigned long long aesl_llvm_cbe_343_count = 0;
  static  unsigned long long aesl_llvm_cbe_344_count = 0;
  static  unsigned long long aesl_llvm_cbe_345_count = 0;
  static  unsigned long long aesl_llvm_cbe_346_count = 0;
  static  unsigned long long aesl_llvm_cbe_347_count = 0;
  unsigned int llvm_cbe_tmp__98;
  unsigned int llvm_cbe_tmp__98__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_348_count = 0;
  unsigned int llvm_cbe_tmp__99;
  unsigned int llvm_cbe_tmp__99__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_349_count = 0;
  unsigned int llvm_cbe_tmp__100;
  static  unsigned long long aesl_llvm_cbe_350_count = 0;
  unsigned long long llvm_cbe_tmp__101;
  static  unsigned long long aesl_llvm_cbe_351_count = 0;
  signed int *llvm_cbe_tmp__102;
  static  unsigned long long aesl_llvm_cbe_352_count = 0;
  unsigned int llvm_cbe_tmp__103;
  static  unsigned long long aesl_llvm_cbe_353_count = 0;
  unsigned int llvm_cbe_tmp__104;
  static  unsigned long long aesl_llvm_cbe_354_count = 0;
  static  unsigned long long aesl_llvm_cbe_355_count = 0;
  static  unsigned long long aesl_llvm_cbe_356_count = 0;
  static  unsigned long long aesl_llvm_cbe_357_count = 0;
  static  unsigned long long aesl_llvm_cbe_358_count = 0;
  static  unsigned long long aesl_llvm_cbe_359_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aesl_internal_countLeadingZeros32\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = shl i32 %%a, 16, !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros32  --> \n", ++aesl_llvm_cbe_324_count);
  llvm_cbe_tmp__95 = (unsigned int )llvm_cbe_a << 16u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__95);
if (AESL_DEBUG_TRACE)
printf("\n  %%. = select i1 %%1, i32 16, i32 0, !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros32  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned int )(((((unsigned int )llvm_cbe_a&4294967295U) < ((unsigned int )65536u&4294967295U))) ? ((unsigned int )16u) : ((unsigned int )0u));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", llvm_cbe__2e_);
if (AESL_DEBUG_TRACE)
printf("\n  %%.a = select i1 %%1, i32 %%2, i32 %%a, !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros32  --> \n", ++aesl_llvm_cbe__2e_a_count);
  llvm_cbe__2e_a = (unsigned int )(((((unsigned int )llvm_cbe_a&4294967295U) < ((unsigned int )65536u&4294967295U))) ? ((unsigned int )llvm_cbe_tmp__95) : ((unsigned int )llvm_cbe_a));
if (AESL_DEBUG_TRACE)
printf("\n.a = 0x%X\n", llvm_cbe__2e_a);
  if ((((unsigned int )llvm_cbe__2e_a&4294967295U) < ((unsigned int )16777216u&4294967295U))) {
    goto llvm_cbe_tmp__105;
  } else {
    llvm_cbe_tmp__98__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_;   /* for PHI node */
    llvm_cbe_tmp__99__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_a;   /* for PHI node */
    goto llvm_cbe_tmp__106;
  }

llvm_cbe_tmp__105:
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = or i32 %%., 8, !dbg !18 for 0x%llxth hint within @aesl_internal_countLeadingZeros32  --> \n", ++aesl_llvm_cbe_333_count);
  llvm_cbe_tmp__96 = (unsigned int )llvm_cbe__2e_ | 8u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__96);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = shl i32 %%.a, 8, !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros32  --> \n", ++aesl_llvm_cbe_339_count);
  llvm_cbe_tmp__97 = (unsigned int )llvm_cbe__2e_a << 8u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__97);
  llvm_cbe_tmp__98__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__96;   /* for PHI node */
  llvm_cbe_tmp__99__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__97;   /* for PHI node */
  goto llvm_cbe_tmp__106;

llvm_cbe_tmp__106:
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = phi i32 [ %%5, %%4 ], [ %%., %%0 ], !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros32  --> \n", ++aesl_llvm_cbe_347_count);
  llvm_cbe_tmp__98 = (unsigned int )llvm_cbe_tmp__98__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__98);
printf("\n = 0x%X",llvm_cbe_tmp__96);
printf("\n. = 0x%X",llvm_cbe__2e_);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = phi i32 [ %%6, %%4 ], [ %%.a, %%0  for 0x%llxth hint within @aesl_internal_countLeadingZeros32  --> \n", ++aesl_llvm_cbe_348_count);
  llvm_cbe_tmp__99 = (unsigned int )llvm_cbe_tmp__99__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__99);
printf("\n = 0x%X",llvm_cbe_tmp__97);
printf("\n.a = 0x%X",llvm_cbe__2e_a);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = lshr i32 %%9, 24, !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros32  --> \n", ++aesl_llvm_cbe_349_count);
  llvm_cbe_tmp__100 = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_tmp__99&4294967295ull)) >> ((unsigned int )(24u&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__100&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = zext i32 %%10 to i64, !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros32  --> \n", ++aesl_llvm_cbe_350_count);
  llvm_cbe_tmp__101 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__100&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__101);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = getelementptr inbounds [256 x i32]* @aesl_internal_countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %%11, !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros32  --> \n", ++aesl_llvm_cbe_351_count);
  llvm_cbe_tmp__102 = (signed int *)(&aesl_internal_countLeadingZeros32_OC_countLeadingZerosHigh[(((signed long long )llvm_cbe_tmp__101))
#ifdef AESL_BC_SIM
 % 256
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__101));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__101) < 256)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_countLeadingZeros32.countLeadingZerosHigh' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i32* %%12, align 4, !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros32  --> \n", ++aesl_llvm_cbe_352_count);
  llvm_cbe_tmp__103 = (unsigned int )*llvm_cbe_tmp__102;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__103);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = add nsw i32 %%13, %%8, !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros32  --> \n", ++aesl_llvm_cbe_353_count);
  llvm_cbe_tmp__104 = (unsigned int )((unsigned int )(llvm_cbe_tmp__103&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__98&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__104&4294967295ull)));
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aesl_internal_countLeadingZeros32}\n");
  return llvm_cbe_tmp__104;
}


signed long long float64_add(signed long long llvm_cbe_a, signed long long llvm_cbe_b) {
  static  unsigned long long aesl_llvm_cbe_360_count = 0;
  static  unsigned long long aesl_llvm_cbe_361_count = 0;
  static  unsigned long long aesl_llvm_cbe_362_count = 0;
  static  unsigned long long aesl_llvm_cbe_363_count = 0;
  static  unsigned long long aesl_llvm_cbe_364_count = 0;
  static  unsigned long long aesl_llvm_cbe_365_count = 0;
  static  unsigned long long aesl_llvm_cbe_366_count = 0;
  static  unsigned long long aesl_llvm_cbe_367_count = 0;
  static  unsigned long long aesl_llvm_cbe_368_count = 0;
  unsigned int llvm_cbe_tmp__107;
  static  unsigned long long aesl_llvm_cbe_369_count = 0;
  static  unsigned long long aesl_llvm_cbe_370_count = 0;
  static  unsigned long long aesl_llvm_cbe_371_count = 0;
  static  unsigned long long aesl_llvm_cbe_372_count = 0;
  static  unsigned long long aesl_llvm_cbe_373_count = 0;
  unsigned int llvm_cbe_tmp__108;
  static  unsigned long long aesl_llvm_cbe_374_count = 0;
  static  unsigned long long aesl_llvm_cbe_375_count = 0;
  static  unsigned long long aesl_llvm_cbe_376_count = 0;
  static  unsigned long long aesl_llvm_cbe_377_count = 0;
  static  unsigned long long aesl_llvm_cbe_378_count = 0;
  unsigned long long llvm_cbe_tmp__109;
  static  unsigned long long aesl_llvm_cbe_379_count = 0;
  static  unsigned long long aesl_llvm_cbe_380_count = 0;
  unsigned long long llvm_cbe_tmp__110;
  static  unsigned long long aesl_llvm_cbe_381_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
  unsigned long long llvm_cbe_storemerge;
  unsigned long long llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_382_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @float64_add\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call i32 @extractFloat64Sign(i64 %%a), !dbg !17 for 0x%llxth hint within @float64_add  --> \n", ++aesl_llvm_cbe_368_count);
  llvm_cbe_tmp__107 = (unsigned int ) /*tail*/ extractFloat64Sign(llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__107);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = tail call i32 @extractFloat64Sign(i64 %%b), !dbg !17 for 0x%llxth hint within @float64_add  --> \n", ++aesl_llvm_cbe_373_count);
  llvm_cbe_tmp__108 = (unsigned int ) /*tail*/ extractFloat64Sign(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__108);
}
  if (((llvm_cbe_tmp__107&4294967295U) == (llvm_cbe_tmp__108&4294967295U))) {
    goto llvm_cbe_tmp__111;
  } else {
    goto llvm_cbe_tmp__112;
  }

llvm_cbe_tmp__111:
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = tail call fastcc i64 @aesl_internal_addFloat64Sigs(i64 %%a, i64 %%b, i32 %%1), !dbg !17 for 0x%llxth hint within @float64_add  --> \n", ++aesl_llvm_cbe_378_count);
  llvm_cbe_tmp__109 = (unsigned long long ) /*tail*/ aesl_internal_addFloat64Sigs(llvm_cbe_a, llvm_cbe_b, llvm_cbe_tmp__107);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__107);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__109);
}
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__109;   /* for PHI node */
  goto llvm_cbe_tmp__113;

llvm_cbe_tmp__112:
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = tail call fastcc i64 @aesl_internal_subFloat64Sigs(i64 %%a, i64 %%b, i32 %%1), !dbg !17 for 0x%llxth hint within @float64_add  --> \n", ++aesl_llvm_cbe_380_count);
  llvm_cbe_tmp__110 = (unsigned long long ) /*tail*/ aesl_internal_subFloat64Sigs(llvm_cbe_a, llvm_cbe_b, llvm_cbe_tmp__107);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__107);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__110);
}
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__110;   /* for PHI node */
  goto llvm_cbe_tmp__113;

llvm_cbe_tmp__113:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i64 [ %%5, %%4 ], [ %%7, %%6  for 0x%llxth hint within @float64_add  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = (unsigned long long )llvm_cbe_storemerge__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge = 0x%llX",llvm_cbe_storemerge);
printf("\n = 0x%llX",llvm_cbe_tmp__109);
printf("\n = 0x%llX",llvm_cbe_tmp__110);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @float64_add}\n");
  return llvm_cbe_storemerge;
}


static signed long long aesl_internal_addFloat64Sigs(signed long long llvm_cbe_a, signed long long llvm_cbe_b, signed int llvm_cbe_zSign) {
  static  unsigned long long aesl_llvm_cbe_aSig_count = 0;
  signed long long llvm_cbe_aSig;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_383_count = 0;
  static  unsigned long long aesl_llvm_cbe_bSig_count = 0;
  signed long long llvm_cbe_bSig;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_384_count = 0;
  static  unsigned long long aesl_llvm_cbe_385_count = 0;
  static  unsigned long long aesl_llvm_cbe_386_count = 0;
  static  unsigned long long aesl_llvm_cbe_387_count = 0;
  static  unsigned long long aesl_llvm_cbe_388_count = 0;
  static  unsigned long long aesl_llvm_cbe_389_count = 0;
  static  unsigned long long aesl_llvm_cbe_390_count = 0;
  static  unsigned long long aesl_llvm_cbe_391_count = 0;
  static  unsigned long long aesl_llvm_cbe_392_count = 0;
  static  unsigned long long aesl_llvm_cbe_393_count = 0;
  static  unsigned long long aesl_llvm_cbe_394_count = 0;
  static  unsigned long long aesl_llvm_cbe_395_count = 0;
  static  unsigned long long aesl_llvm_cbe_396_count = 0;
  static  unsigned long long aesl_llvm_cbe_397_count = 0;
  static  unsigned long long aesl_llvm_cbe_398_count = 0;
  static  unsigned long long aesl_llvm_cbe_399_count = 0;
  static  unsigned long long aesl_llvm_cbe_400_count = 0;
  static  unsigned long long aesl_llvm_cbe_401_count = 0;
  static  unsigned long long aesl_llvm_cbe_402_count = 0;
  static  unsigned long long aesl_llvm_cbe_403_count = 0;
  static  unsigned long long aesl_llvm_cbe_404_count = 0;
  static  unsigned long long aesl_llvm_cbe_405_count = 0;
  unsigned long long llvm_cbe_tmp__114;
  static  unsigned long long aesl_llvm_cbe_406_count = 0;
  static  unsigned long long aesl_llvm_cbe_407_count = 0;
  static  unsigned long long aesl_llvm_cbe_408_count = 0;
  static  unsigned long long aesl_llvm_cbe_409_count = 0;
  static  unsigned long long aesl_llvm_cbe_410_count = 0;
  unsigned int llvm_cbe_tmp__115;
  static  unsigned long long aesl_llvm_cbe_411_count = 0;
  static  unsigned long long aesl_llvm_cbe_412_count = 0;
  static  unsigned long long aesl_llvm_cbe_413_count = 0;
  static  unsigned long long aesl_llvm_cbe_414_count = 0;
  static  unsigned long long aesl_llvm_cbe_415_count = 0;
  static  unsigned long long aesl_llvm_cbe_416_count = 0;
  static  unsigned long long aesl_llvm_cbe_417_count = 0;
  static  unsigned long long aesl_llvm_cbe_418_count = 0;
  static  unsigned long long aesl_llvm_cbe_419_count = 0;
  unsigned long long llvm_cbe_tmp__116;
  static  unsigned long long aesl_llvm_cbe_420_count = 0;
  static  unsigned long long aesl_llvm_cbe_421_count = 0;
  static  unsigned long long aesl_llvm_cbe_422_count = 0;
  static  unsigned long long aesl_llvm_cbe_423_count = 0;
  static  unsigned long long aesl_llvm_cbe_424_count = 0;
  unsigned int llvm_cbe_tmp__117;
  static  unsigned long long aesl_llvm_cbe_425_count = 0;
  static  unsigned long long aesl_llvm_cbe_426_count = 0;
  static  unsigned long long aesl_llvm_cbe_427_count = 0;
  static  unsigned long long aesl_llvm_cbe_428_count = 0;
  static  unsigned long long aesl_llvm_cbe_429_count = 0;
  static  unsigned long long aesl_llvm_cbe_430_count = 0;
  unsigned int llvm_cbe_tmp__118;
  static  unsigned long long aesl_llvm_cbe_431_count = 0;
  static  unsigned long long aesl_llvm_cbe_432_count = 0;
  static  unsigned long long aesl_llvm_cbe_433_count = 0;
  static  unsigned long long aesl_llvm_cbe_434_count = 0;
  static  unsigned long long aesl_llvm_cbe_435_count = 0;
  static  unsigned long long aesl_llvm_cbe_436_count = 0;
  static  unsigned long long aesl_llvm_cbe_437_count = 0;
  static  unsigned long long aesl_llvm_cbe_438_count = 0;
  static  unsigned long long aesl_llvm_cbe_439_count = 0;
  static  unsigned long long aesl_llvm_cbe_440_count = 0;
  unsigned long long llvm_cbe_tmp__119;
  static  unsigned long long aesl_llvm_cbe_441_count = 0;
  static  unsigned long long aesl_llvm_cbe_442_count = 0;
  static  unsigned long long aesl_llvm_cbe_443_count = 0;
  static  unsigned long long aesl_llvm_cbe_444_count = 0;
  static  unsigned long long aesl_llvm_cbe_445_count = 0;
  static  unsigned long long aesl_llvm_cbe_446_count = 0;
  static  unsigned long long aesl_llvm_cbe_447_count = 0;
  static  unsigned long long aesl_llvm_cbe_448_count = 0;
  static  unsigned long long aesl_llvm_cbe_449_count = 0;
  static  unsigned long long aesl_llvm_cbe_450_count = 0;
  unsigned long long llvm_cbe_tmp__120;
  static  unsigned long long aesl_llvm_cbe_451_count = 0;
  static  unsigned long long aesl_llvm_cbe_452_count = 0;
  static  unsigned long long aesl_llvm_cbe_453_count = 0;
  static  unsigned long long aesl_llvm_cbe_454_count = 0;
  static  unsigned long long aesl_llvm_cbe_455_count = 0;
  static  unsigned long long aesl_llvm_cbe_456_count = 0;
  static  unsigned long long aesl_llvm_cbe_457_count = 0;
  static  unsigned long long aesl_llvm_cbe_458_count = 0;
  static  unsigned long long aesl_llvm_cbe_459_count = 0;
  static  unsigned long long aesl_llvm_cbe_460_count = 0;
  static  unsigned long long aesl_llvm_cbe_461_count = 0;
  static  unsigned long long aesl_llvm_cbe_462_count = 0;
  static  unsigned long long aesl_llvm_cbe_463_count = 0;
  static  unsigned long long aesl_llvm_cbe_464_count = 0;
  static  unsigned long long aesl_llvm_cbe_465_count = 0;
  static  unsigned long long aesl_llvm_cbe_466_count = 0;
  static  unsigned long long aesl_llvm_cbe_467_count = 0;
  unsigned long long llvm_cbe_tmp__121;
  static  unsigned long long aesl_llvm_cbe_468_count = 0;
  static  unsigned long long aesl_llvm_cbe_469_count = 0;
  static  unsigned long long aesl_llvm_cbe_470_count = 0;
  static  unsigned long long aesl_llvm_cbe_471_count = 0;
  unsigned int llvm_cbe_tmp__122;
  static  unsigned long long aesl_llvm_cbe_472_count = 0;
  static  unsigned long long aesl_llvm_cbe_473_count = 0;
  static  unsigned long long aesl_llvm_cbe_474_count = 0;
  static  unsigned long long aesl_llvm_cbe_475_count = 0;
  static  unsigned long long aesl_llvm_cbe_476_count = 0;
  static  unsigned long long aesl_llvm_cbe_477_count = 0;
  static  unsigned long long aesl_llvm_cbe_478_count = 0;
  static  unsigned long long aesl_llvm_cbe_479_count = 0;
  static  unsigned long long aesl_llvm_cbe_480_count = 0;
  static  unsigned long long aesl_llvm_cbe_481_count = 0;
  unsigned long long llvm_cbe_tmp__123;
  static  unsigned long long aesl_llvm_cbe_482_count = 0;
  static  unsigned long long aesl_llvm_cbe_483_count = 0;
  static  unsigned long long aesl_llvm_cbe_484_count = 0;
  static  unsigned long long aesl_llvm_cbe_485_count = 0;
  static  unsigned long long aesl_llvm_cbe_486_count = 0;
  static  unsigned long long aesl_llvm_cbe_487_count = 0;
  static  unsigned long long aesl_llvm_cbe_488_count = 0;
  static  unsigned long long aesl_llvm_cbe_489_count = 0;
  static  unsigned long long aesl_llvm_cbe_490_count = 0;
  unsigned long long llvm_cbe_tmp__124;
  unsigned long long llvm_cbe_tmp__124__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_491_count = 0;
  unsigned int llvm_cbe_tmp__125;
  unsigned int llvm_cbe_tmp__125__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_492_count = 0;
  static  unsigned long long aesl_llvm_cbe_493_count = 0;
  static  unsigned long long aesl_llvm_cbe_494_count = 0;
  static  unsigned long long aesl_llvm_cbe_495_count = 0;
  static  unsigned long long aesl_llvm_cbe_496_count = 0;
  static  unsigned long long aesl_llvm_cbe_497_count = 0;
  static  unsigned long long aesl_llvm_cbe_498_count = 0;
  static  unsigned long long aesl_llvm_cbe_499_count = 0;
  static  unsigned long long aesl_llvm_cbe_500_count = 0;
  static  unsigned long long aesl_llvm_cbe_501_count = 0;
  static  unsigned long long aesl_llvm_cbe_502_count = 0;
  static  unsigned long long aesl_llvm_cbe_503_count = 0;
  static  unsigned long long aesl_llvm_cbe_504_count = 0;
  static  unsigned long long aesl_llvm_cbe_505_count = 0;
  static  unsigned long long aesl_llvm_cbe_506_count = 0;
  static  unsigned long long aesl_llvm_cbe_507_count = 0;
  static  unsigned long long aesl_llvm_cbe_508_count = 0;
  unsigned long long llvm_cbe_tmp__126;
  static  unsigned long long aesl_llvm_cbe_509_count = 0;
  static  unsigned long long aesl_llvm_cbe_510_count = 0;
  unsigned long long llvm_cbe_tmp__127;
  static  unsigned long long aesl_llvm_cbe_511_count = 0;
  static  unsigned long long aesl_llvm_cbe_512_count = 0;
  static  unsigned long long aesl_llvm_cbe_513_count = 0;
  static  unsigned long long aesl_llvm_cbe_514_count = 0;
  unsigned int llvm_cbe_tmp__128;
  static  unsigned long long aesl_llvm_cbe_515_count = 0;
  static  unsigned long long aesl_llvm_cbe_516_count = 0;
  static  unsigned long long aesl_llvm_cbe_517_count = 0;
  static  unsigned long long aesl_llvm_cbe_518_count = 0;
  static  unsigned long long aesl_llvm_cbe_519_count = 0;
  static  unsigned long long aesl_llvm_cbe_520_count = 0;
  static  unsigned long long aesl_llvm_cbe_521_count = 0;
  static  unsigned long long aesl_llvm_cbe_522_count = 0;
  static  unsigned long long aesl_llvm_cbe_523_count = 0;
  static  unsigned long long aesl_llvm_cbe_524_count = 0;
  static  unsigned long long aesl_llvm_cbe_525_count = 0;
  static  unsigned long long aesl_llvm_cbe_526_count = 0;
  unsigned long long llvm_cbe_tmp__129;
  static  unsigned long long aesl_llvm_cbe_527_count = 0;
  static  unsigned long long aesl_llvm_cbe_528_count = 0;
  static  unsigned long long aesl_llvm_cbe_529_count = 0;
  static  unsigned long long aesl_llvm_cbe_530_count = 0;
  static  unsigned long long aesl_llvm_cbe_531_count = 0;
  static  unsigned long long aesl_llvm_cbe_532_count = 0;
  static  unsigned long long aesl_llvm_cbe_533_count = 0;
  static  unsigned long long aesl_llvm_cbe_534_count = 0;
  static  unsigned long long aesl_llvm_cbe_535_count = 0;
  unsigned long long llvm_cbe_tmp__130;
  unsigned long long llvm_cbe_tmp__130__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_536_count = 0;
  unsigned int llvm_cbe_tmp__131;
  unsigned int llvm_cbe_tmp__131__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_537_count = 0;
  static  unsigned long long aesl_llvm_cbe_538_count = 0;
  static  unsigned long long aesl_llvm_cbe_539_count = 0;
  static  unsigned long long aesl_llvm_cbe_540_count = 0;
  unsigned int llvm_cbe_tmp__132;
  static  unsigned long long aesl_llvm_cbe_541_count = 0;
  static  unsigned long long aesl_llvm_cbe_542_count = 0;
  static  unsigned long long aesl_llvm_cbe_543_count = 0;
  static  unsigned long long aesl_llvm_cbe_544_count = 0;
  static  unsigned long long aesl_llvm_cbe_545_count = 0;
  static  unsigned long long aesl_llvm_cbe_546_count = 0;
  static  unsigned long long aesl_llvm_cbe_547_count = 0;
  static  unsigned long long aesl_llvm_cbe_548_count = 0;
  static  unsigned long long aesl_llvm_cbe_549_count = 0;
  static  unsigned long long aesl_llvm_cbe_550_count = 0;
  static  unsigned long long aesl_llvm_cbe_551_count = 0;
  static  unsigned long long aesl_llvm_cbe_552_count = 0;
  static  unsigned long long aesl_llvm_cbe_553_count = 0;
  unsigned long long llvm_cbe_tmp__133;
  static  unsigned long long aesl_llvm_cbe_554_count = 0;
  static  unsigned long long aesl_llvm_cbe_555_count = 0;
  static  unsigned long long aesl_llvm_cbe_556_count = 0;
  unsigned long long llvm_cbe_tmp__134;
  static  unsigned long long aesl_llvm_cbe_557_count = 0;
  static  unsigned long long aesl_llvm_cbe_558_count = 0;
  static  unsigned long long aesl_llvm_cbe_559_count = 0;
  static  unsigned long long aesl_llvm_cbe_560_count = 0;
  static  unsigned long long aesl_llvm_cbe_561_count = 0;
  static  unsigned long long aesl_llvm_cbe_562_count = 0;
  static  unsigned long long aesl_llvm_cbe_563_count = 0;
  static  unsigned long long aesl_llvm_cbe_564_count = 0;
  unsigned long long llvm_cbe_tmp__135;
  static  unsigned long long aesl_llvm_cbe_565_count = 0;
  unsigned long long llvm_cbe_tmp__136;
  static  unsigned long long aesl_llvm_cbe_566_count = 0;
  unsigned long long llvm_cbe_tmp__137;
  static  unsigned long long aesl_llvm_cbe_567_count = 0;
  static  unsigned long long aesl_llvm_cbe_568_count = 0;
  static  unsigned long long aesl_llvm_cbe_569_count = 0;
  static  unsigned long long aesl_llvm_cbe_570_count = 0;
  static  unsigned long long aesl_llvm_cbe_571_count = 0;
  static  unsigned long long aesl_llvm_cbe_572_count = 0;
  unsigned long long llvm_cbe_tmp__138;
  static  unsigned long long aesl_llvm_cbe_573_count = 0;
  unsigned long long llvm_cbe_tmp__139;
  static  unsigned long long aesl_llvm_cbe_574_count = 0;
  static  unsigned long long aesl_llvm_cbe_575_count = 0;
  static  unsigned long long aesl_llvm_cbe_576_count = 0;
  static  unsigned long long aesl_llvm_cbe_577_count = 0;
  static  unsigned long long aesl_llvm_cbe_578_count = 0;
  static  unsigned long long aesl_llvm_cbe_579_count = 0;
  static  unsigned long long aesl_llvm_cbe_580_count = 0;
  static  unsigned long long aesl_llvm_cbe_581_count = 0;
  static  unsigned long long aesl_llvm_cbe_582_count = 0;
  unsigned int llvm_cbe_tmp__140;
  unsigned int llvm_cbe_tmp__140__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_583_count = 0;
  static  unsigned long long aesl_llvm_cbe_584_count = 0;
  static  unsigned long long aesl_llvm_cbe_585_count = 0;
  static  unsigned long long aesl_llvm_cbe_586_count = 0;
  static  unsigned long long aesl_llvm_cbe_587_count = 0;
  static  unsigned long long aesl_llvm_cbe_588_count = 0;
  static  unsigned long long aesl_llvm_cbe_589_count = 0;
  static  unsigned long long aesl_llvm_cbe_590_count = 0;
  static  unsigned long long aesl_llvm_cbe_591_count = 0;
  static  unsigned long long aesl_llvm_cbe_592_count = 0;
  static  unsigned long long aesl_llvm_cbe_593_count = 0;
  unsigned long long llvm_cbe_tmp__141;
  static  unsigned long long aesl_llvm_cbe_594_count = 0;
  unsigned long long llvm_cbe_tmp__142;
  static  unsigned long long aesl_llvm_cbe_595_count = 0;
  static  unsigned long long aesl_llvm_cbe_596_count = 0;
  static  unsigned long long aesl_llvm_cbe_597_count = 0;
  static  unsigned long long aesl_llvm_cbe_598_count = 0;
  static  unsigned long long aesl_llvm_cbe_599_count = 0;
  static  unsigned long long aesl_llvm_cbe_600_count = 0;
  static  unsigned long long aesl_llvm_cbe_601_count = 0;
  static  unsigned long long aesl_llvm_cbe_602_count = 0;
  static  unsigned long long aesl_llvm_cbe_603_count = 0;
  static  unsigned long long aesl_llvm_cbe_604_count = 0;
  static  unsigned long long aesl_llvm_cbe_605_count = 0;
  static  unsigned long long aesl_llvm_cbe_606_count = 0;
  static  unsigned long long aesl_llvm_cbe_607_count = 0;
  static  unsigned long long aesl_llvm_cbe_608_count = 0;
  static  unsigned long long aesl_llvm_cbe_609_count = 0;
  unsigned long long llvm_cbe_tmp__143;
  static  unsigned long long aesl_llvm_cbe_610_count = 0;
  unsigned long long llvm_cbe_tmp__144;
  static  unsigned long long aesl_llvm_cbe_611_count = 0;
  static  unsigned long long aesl_llvm_cbe_612_count = 0;
  static  unsigned long long aesl_llvm_cbe_613_count = 0;
  static  unsigned long long aesl_llvm_cbe_614_count = 0;
  unsigned long long llvm_cbe_tmp__145;
  static  unsigned long long aesl_llvm_cbe_615_count = 0;
  static  unsigned long long aesl_llvm_cbe_616_count = 0;
  static  unsigned long long aesl_llvm_cbe_617_count = 0;
  static  unsigned long long aesl_llvm_cbe_618_count = 0;
  unsigned int llvm_cbe_tmp__146;
  static  unsigned long long aesl_llvm_cbe_619_count = 0;
  static  unsigned long long aesl_llvm_cbe_620_count = 0;
  static  unsigned long long aesl_llvm_cbe_621_count = 0;
  static  unsigned long long aesl_llvm_cbe_622_count = 0;
  static  unsigned long long aesl_llvm_cbe_623_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned long long llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe__2e_1_count = 0;
  unsigned int llvm_cbe__2e_1;
  static  unsigned long long aesl_llvm_cbe_624_count = 0;
  static  unsigned long long aesl_llvm_cbe_625_count = 0;
  unsigned long long llvm_cbe_tmp__147;
  unsigned long long llvm_cbe_tmp__147__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_626_count = 0;
  unsigned int llvm_cbe_tmp__148;
  unsigned int llvm_cbe_tmp__148__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_627_count = 0;
  unsigned long long llvm_cbe_tmp__149;
  static  unsigned long long aesl_llvm_cbe_628_count = 0;
  static  unsigned long long aesl_llvm_cbe_629_count = 0;
  unsigned long long llvm_cbe_tmp__150;
  unsigned long long llvm_cbe_tmp__150__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_630_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aesl_internal_addFloat64Sigs\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = call i64 @extractFloat64Frac(i64 %%a), !dbg !17 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_405_count);
  llvm_cbe_tmp__114 = (unsigned long long )extractFloat64Frac(llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__114);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = call i32 @extractFloat64Exp(i64 %%a), !dbg !17 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_410_count);
  llvm_cbe_tmp__115 = (unsigned int )extractFloat64Exp(llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__115);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = call i64 @extractFloat64Frac(i64 %%b), !dbg !19 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_419_count);
  llvm_cbe_tmp__116 = (unsigned long long )extractFloat64Frac(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__116);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i32 @extractFloat64Exp(i64 %%b), !dbg !19 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_424_count);
  llvm_cbe_tmp__117 = (unsigned int )extractFloat64Exp(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__117);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sub nsw i32 %%2, %%4, !dbg !20 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_430_count);
  llvm_cbe_tmp__118 = (unsigned int )((unsigned int )(llvm_cbe_tmp__115&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__117&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__118&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = shl i64 %%1, 9, !dbg !22 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_440_count);
  llvm_cbe_tmp__119 = (unsigned long long )llvm_cbe_tmp__114 << 9ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__119);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%6, i64* %%aSig, align 8, !dbg !22 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_447_count);
  *(&llvm_cbe_aSig) = llvm_cbe_tmp__119;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__119);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = shl i64 %%3, 9, !dbg !22 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_450_count);
  llvm_cbe_tmp__120 = (unsigned long long )llvm_cbe_tmp__116 << 9ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__120);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%7, i64* %%bSig, align 8, !dbg !22 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_457_count);
  *(&llvm_cbe_bSig) = llvm_cbe_tmp__120;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__120);
  if ((((signed int )llvm_cbe_tmp__118) > ((signed int )0u))) {
    goto llvm_cbe_tmp__151;
  } else {
    goto llvm_cbe_tmp__152;
  }

llvm_cbe_tmp__151:
  if (((llvm_cbe_tmp__115&4294967295U) == (2047u&4294967295U))) {
    goto llvm_cbe_tmp__153;
  } else {
    goto llvm_cbe_tmp__154;
  }

llvm_cbe_tmp__153:
  if (((llvm_cbe_tmp__119&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    llvm_cbe_tmp__150__PHI_TEMPORARY = (unsigned long long )llvm_cbe_a;   /* for PHI node */
    goto llvm_cbe_tmp__155;
  } else {
    goto llvm_cbe_tmp__156;
  }

llvm_cbe_tmp__156:
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = call fastcc i64 @aesl_internal_propagateFloat64NaN(i64 %%a, i64 %%b), !dbg !17 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_467_count);
  llvm_cbe_tmp__121 = (unsigned long long )aesl_internal_propagateFloat64NaN(llvm_cbe_a, llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__121);
}
  llvm_cbe_tmp__150__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__121;   /* for PHI node */
  goto llvm_cbe_tmp__155;

llvm_cbe_tmp__154:
  if (((llvm_cbe_tmp__117&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__157;
  } else {
    goto llvm_cbe_tmp__158;
  }

llvm_cbe_tmp__157:
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = add nsw i32 %%5, -1, !dbg !21 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_471_count);
  llvm_cbe_tmp__122 = (unsigned int )((unsigned int )(llvm_cbe_tmp__118&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__122&4294967295ull)));
  llvm_cbe_tmp__124__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__120;   /* for PHI node */
  llvm_cbe_tmp__125__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__122;   /* for PHI node */
  goto llvm_cbe_tmp__159;

llvm_cbe_tmp__158:
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = or i64 %%7, 2305843009213693952, !dbg !22 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_481_count);
  llvm_cbe_tmp__123 = (unsigned long long )llvm_cbe_tmp__120 | 2305843009213693952ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__123);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%20, i64* %%bSig, align 8, !dbg !22 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_488_count);
  *(&llvm_cbe_bSig) = llvm_cbe_tmp__123;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__123);
  llvm_cbe_tmp__124__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__123;   /* for PHI node */
  llvm_cbe_tmp__125__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__118;   /* for PHI node */
  goto llvm_cbe_tmp__159;

llvm_cbe_tmp__159:
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = phi i64 [ %%20, %%19 ], [ %%7, %%17  for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_490_count);
  llvm_cbe_tmp__124 = (unsigned long long )llvm_cbe_tmp__124__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__124);
printf("\n = 0x%llX",llvm_cbe_tmp__123);
printf("\n = 0x%llX",llvm_cbe_tmp__120);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = phi i32 [ %%5, %%19 ], [ %%18, %%17  for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_491_count);
  llvm_cbe_tmp__125 = (unsigned int )llvm_cbe_tmp__125__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__125);
printf("\n = 0x%X",llvm_cbe_tmp__118);
printf("\n = 0x%X",llvm_cbe_tmp__122);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @shift64RightJamming(i64 %%22, i32 %%23, i64* %%bSig), !dbg !21 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_495_count);
  shift64RightJamming(llvm_cbe_tmp__124, llvm_cbe_tmp__125, (signed long long *)(&llvm_cbe_bSig));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__124);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__125);
}
  llvm_cbe_tmp__140__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__115;   /* for PHI node */
  goto llvm_cbe_tmp__160;

llvm_cbe_tmp__152:
  if ((((signed int )llvm_cbe_tmp__118) < ((signed int )0u))) {
    goto llvm_cbe_tmp__161;
  } else {
    goto llvm_cbe_tmp__162;
  }

llvm_cbe_tmp__161:
  if (((llvm_cbe_tmp__117&4294967295U) == (2047u&4294967295U))) {
    goto llvm_cbe_tmp__163;
  } else {
    goto llvm_cbe_tmp__164;
  }

llvm_cbe_tmp__163:
  if (((llvm_cbe_tmp__120&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__165;
  } else {
    goto llvm_cbe_tmp__166;
  }

llvm_cbe_tmp__166:
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = call fastcc i64 @aesl_internal_propagateFloat64NaN(i64 %%a, i64 %%b), !dbg !18 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_508_count);
  llvm_cbe_tmp__126 = (unsigned long long )aesl_internal_propagateFloat64NaN(llvm_cbe_a, llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__126);
}
  llvm_cbe_tmp__150__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__126;   /* for PHI node */
  goto llvm_cbe_tmp__155;

llvm_cbe_tmp__165:
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = call i64 @packFloat64(i32 %%zSign, i32 2047, i64 0), !dbg !19 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_510_count);
  llvm_cbe_tmp__127 = (unsigned long long )packFloat64(llvm_cbe_zSign, 2047u, 0ull);
if (AESL_DEBUG_TRACE) {
printf("\nArgument zSign = 0x%X",llvm_cbe_zSign);
printf("\nArgument  = 0x%X",2047u);
printf("\nArgument  = 0x%llX",0ull);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__127);
}
  llvm_cbe_tmp__150__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__127;   /* for PHI node */
  goto llvm_cbe_tmp__155;

llvm_cbe_tmp__164:
  if (((llvm_cbe_tmp__115&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__167;
  } else {
    goto llvm_cbe_tmp__168;
  }

llvm_cbe_tmp__167:
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = add nsw i32 %%5, 1, !dbg !21 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_514_count);
  llvm_cbe_tmp__128 = (unsigned int )((unsigned int )(llvm_cbe_tmp__118&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__128&4294967295ull)));
  llvm_cbe_tmp__130__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__119;   /* for PHI node */
  llvm_cbe_tmp__131__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__128;   /* for PHI node */
  goto llvm_cbe_tmp__169;

llvm_cbe_tmp__168:
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = or i64 %%6, 2305843009213693952, !dbg !22 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_526_count);
  llvm_cbe_tmp__129 = (unsigned long long )llvm_cbe_tmp__119 | 2305843009213693952ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__129);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%39, i64* %%aSig, align 8, !dbg !22 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_533_count);
  *(&llvm_cbe_aSig) = llvm_cbe_tmp__129;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__129);
  llvm_cbe_tmp__130__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__129;   /* for PHI node */
  llvm_cbe_tmp__131__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__118;   /* for PHI node */
  goto llvm_cbe_tmp__169;

llvm_cbe_tmp__169:
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = phi i64 [ %%39, %%38 ], [ %%6, %%36  for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_535_count);
  llvm_cbe_tmp__130 = (unsigned long long )llvm_cbe_tmp__130__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__130);
printf("\n = 0x%llX",llvm_cbe_tmp__129);
printf("\n = 0x%llX",llvm_cbe_tmp__119);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = phi i32 [ %%5, %%38 ], [ %%37, %%36  for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_536_count);
  llvm_cbe_tmp__131 = (unsigned int )llvm_cbe_tmp__131__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__131);
printf("\n = 0x%X",llvm_cbe_tmp__118);
printf("\n = 0x%X",llvm_cbe_tmp__128);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = sub nsw i32 0, %%42, !dbg !21 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_540_count);
  llvm_cbe_tmp__132 = (unsigned int )-(llvm_cbe_tmp__131);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__132&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  call void @shift64RightJamming(i64 %%41, i32 %%43, i64* %%aSig), !dbg !21 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_541_count);
  shift64RightJamming(llvm_cbe_tmp__130, llvm_cbe_tmp__132, (signed long long *)(&llvm_cbe_aSig));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__130);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__132);
}
  llvm_cbe_tmp__140__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__117;   /* for PHI node */
  goto llvm_cbe_tmp__160;

llvm_cbe_tmp__162:
  if (((llvm_cbe_tmp__115&4294967295U) == (2047u&4294967295U))) {
    goto llvm_cbe_tmp__170;
  } else {
    goto llvm_cbe_tmp__171;
  }

llvm_cbe_tmp__170:
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = or i64 %%6, %%7, !dbg !23 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_553_count);
  llvm_cbe_tmp__133 = (unsigned long long )llvm_cbe_tmp__119 | llvm_cbe_tmp__120;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__133);
  if (((llvm_cbe_tmp__133&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    llvm_cbe_tmp__150__PHI_TEMPORARY = (unsigned long long )llvm_cbe_a;   /* for PHI node */
    goto llvm_cbe_tmp__155;
  } else {
    goto llvm_cbe_tmp__172;
  }

llvm_cbe_tmp__172:
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = call fastcc i64 @aesl_internal_propagateFloat64NaN(i64 %%a, i64 %%b), !dbg !18 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_556_count);
  llvm_cbe_tmp__134 = (unsigned long long )aesl_internal_propagateFloat64NaN(llvm_cbe_a, llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__134);
}
  llvm_cbe_tmp__150__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__134;   /* for PHI node */
  goto llvm_cbe_tmp__155;

llvm_cbe_tmp__171:
  if (((llvm_cbe_tmp__115&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__173;
  } else {
    goto llvm_cbe_tmp__174;
  }

llvm_cbe_tmp__173:
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = add i64 %%6, %%7, !dbg !19 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_564_count);
  llvm_cbe_tmp__135 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__119&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__120&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__135&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = lshr exact i64 %%54, 9, !dbg !19 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_565_count);
  llvm_cbe_tmp__136 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__135&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__136&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = call i64 @packFloat64(i32 %%zSign, i32 0, i64 %%55), !dbg !19 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_566_count);
  llvm_cbe_tmp__137 = (unsigned long long )packFloat64(llvm_cbe_zSign, 0u, llvm_cbe_tmp__136);
if (AESL_DEBUG_TRACE) {
printf("\nArgument zSign = 0x%X",llvm_cbe_zSign);
printf("\nArgument  = 0x%X",0u);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__136);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__137);
}
  llvm_cbe_tmp__150__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__137;   /* for PHI node */
  goto llvm_cbe_tmp__155;

llvm_cbe_tmp__174:
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = add i64 %%7, 4611686018427387904, !dbg !23 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_572_count);
  llvm_cbe_tmp__138 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__120&18446744073709551615ull)) + ((unsigned long long )(4611686018427387904ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__138&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = add i64 %%58, %%6, !dbg !23 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_573_count);
  llvm_cbe_tmp__139 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__138&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__119&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__139&18446744073709551615ull)));
  llvm_cbe_tmp__147__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__139;   /* for PHI node */
  llvm_cbe_tmp__148__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__115;   /* for PHI node */
  goto llvm_cbe_tmp__175;

llvm_cbe_tmp__160:
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = phi i32 [ %%4, %%40 ], [ %%2, %%21 ], !dbg !23 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_582_count);
  llvm_cbe_tmp__140 = (unsigned int )llvm_cbe_tmp__140__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__140);
printf("\n = 0x%X",llvm_cbe_tmp__117);
printf("\n = 0x%X",llvm_cbe_tmp__115);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = load i64* %%aSig, align 8, !dbg !23 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_593_count);
  llvm_cbe_tmp__141 = (unsigned long long )*(&llvm_cbe_aSig);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__141);
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = or i64 %%62, 2305843009213693952, !dbg !23 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_594_count);
  llvm_cbe_tmp__142 = (unsigned long long )llvm_cbe_tmp__141 | 2305843009213693952ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__142);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%63, i64* %%aSig, align 8, !dbg !23 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_601_count);
  *(&llvm_cbe_aSig) = llvm_cbe_tmp__142;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__142);
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = load i64* %%bSig, align 8, !dbg !23 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_609_count);
  llvm_cbe_tmp__143 = (unsigned long long )*(&llvm_cbe_bSig);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__143);
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = add i64 %%63, %%64, !dbg !23 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_610_count);
  llvm_cbe_tmp__144 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__142&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__143&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__144&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = shl i64 %%65, 1, !dbg !23 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_614_count);
  llvm_cbe_tmp__145 = (unsigned long long )llvm_cbe_tmp__144 << 1ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__145);
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = add nsw i32 %%61, -1, !dbg !22 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_618_count);
  llvm_cbe_tmp__146 = (unsigned int )((unsigned int )(llvm_cbe_tmp__140&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__146&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%. = select i1 %%68, i64 %%65, i64 %%66, !dbg !23 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned long long )(((((signed long long )llvm_cbe_tmp__145) < ((signed long long )0ull))) ? ((unsigned long long )llvm_cbe_tmp__144) : ((unsigned long long )llvm_cbe_tmp__145));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%llX\n", llvm_cbe__2e_);
if (AESL_DEBUG_TRACE)
printf("\n  %%.1 = select i1 %%68, i32 %%61, i32 %%67, !dbg !23 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe__2e_1_count);
  llvm_cbe__2e_1 = (unsigned int )(((((signed long long )llvm_cbe_tmp__145) < ((signed long long )0ull))) ? ((unsigned int )llvm_cbe_tmp__140) : ((unsigned int )llvm_cbe_tmp__146));
if (AESL_DEBUG_TRACE)
printf("\n.1 = 0x%X\n", llvm_cbe__2e_1);
  llvm_cbe_tmp__147__PHI_TEMPORARY = (unsigned long long )llvm_cbe__2e_;   /* for PHI node */
  llvm_cbe_tmp__148__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_1;   /* for PHI node */
  goto llvm_cbe_tmp__175;

llvm_cbe_tmp__175:
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = phi i64 [ %%59, %%57 ], [ %%., %%60  for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_625_count);
  llvm_cbe_tmp__147 = (unsigned long long )llvm_cbe_tmp__147__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__147);
printf("\n = 0x%llX",llvm_cbe_tmp__139);
printf("\n. = 0x%llX",llvm_cbe__2e_);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = phi i32 [ %%2, %%57 ], [ %%.1, %%60  for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_626_count);
  llvm_cbe_tmp__148 = (unsigned int )llvm_cbe_tmp__148__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__148);
printf("\n = 0x%X",llvm_cbe_tmp__115);
printf("\n.1 = 0x%X",llvm_cbe__2e_1);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%72 = call fastcc i64 @aesl_internal_roundAndPackFloat64(i32 %%zSign, i32 %%71, i64 %%70), !dbg !19 for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_627_count);
  llvm_cbe_tmp__149 = (unsigned long long )aesl_internal_roundAndPackFloat64(llvm_cbe_zSign, llvm_cbe_tmp__148, llvm_cbe_tmp__147);
if (AESL_DEBUG_TRACE) {
printf("\nArgument zSign = 0x%X",llvm_cbe_zSign);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__148);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__147);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__149);
}
  llvm_cbe_tmp__150__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__149;   /* for PHI node */
  goto llvm_cbe_tmp__155;

llvm_cbe_tmp__155:
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = phi i64 [ %%72, %%69 ], [ %%56, %%53 ], [ %%50, %%49 ], [ %%33, %%32 ], [ %%31, %%30 ], [ %%14, %%13 ], [ %%a, %%11 ], [ %%a, %%46  for 0x%llxth hint within @aesl_internal_addFloat64Sigs  --> \n", ++aesl_llvm_cbe_629_count);
  llvm_cbe_tmp__150 = (unsigned long long )llvm_cbe_tmp__150__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__150);
printf("\n = 0x%llX",llvm_cbe_tmp__149);
printf("\n = 0x%llX",llvm_cbe_tmp__137);
printf("\n = 0x%llX",llvm_cbe_tmp__134);
printf("\n = 0x%llX",llvm_cbe_tmp__127);
printf("\n = 0x%llX",llvm_cbe_tmp__126);
printf("\n = 0x%llX",llvm_cbe_tmp__121);
printf("\na = 0x%llX",llvm_cbe_a);
printf("\na = 0x%llX",llvm_cbe_a);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aesl_internal_addFloat64Sigs}\n");
  return llvm_cbe_tmp__150;
}


static signed long long aesl_internal_subFloat64Sigs(signed long long llvm_cbe_a, signed long long llvm_cbe_b, signed int llvm_cbe_zSign) {
  static  unsigned long long aesl_llvm_cbe_aSig_count = 0;
  signed long long llvm_cbe_aSig;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_bSig_count = 0;
  signed long long llvm_cbe_bSig;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_631_count = 0;
  static  unsigned long long aesl_llvm_cbe_632_count = 0;
  static  unsigned long long aesl_llvm_cbe_633_count = 0;
  static  unsigned long long aesl_llvm_cbe_634_count = 0;
  static  unsigned long long aesl_llvm_cbe_635_count = 0;
  static  unsigned long long aesl_llvm_cbe_636_count = 0;
  static  unsigned long long aesl_llvm_cbe_637_count = 0;
  static  unsigned long long aesl_llvm_cbe_638_count = 0;
  static  unsigned long long aesl_llvm_cbe_639_count = 0;
  static  unsigned long long aesl_llvm_cbe_640_count = 0;
  static  unsigned long long aesl_llvm_cbe_641_count = 0;
  static  unsigned long long aesl_llvm_cbe_642_count = 0;
  static  unsigned long long aesl_llvm_cbe_643_count = 0;
  static  unsigned long long aesl_llvm_cbe_644_count = 0;
  static  unsigned long long aesl_llvm_cbe_645_count = 0;
  static  unsigned long long aesl_llvm_cbe_646_count = 0;
  static  unsigned long long aesl_llvm_cbe_647_count = 0;
  static  unsigned long long aesl_llvm_cbe_648_count = 0;
  static  unsigned long long aesl_llvm_cbe_649_count = 0;
  static  unsigned long long aesl_llvm_cbe_650_count = 0;
  unsigned long long llvm_cbe_tmp__176;
  static  unsigned long long aesl_llvm_cbe_651_count = 0;
  static  unsigned long long aesl_llvm_cbe_652_count = 0;
  static  unsigned long long aesl_llvm_cbe_653_count = 0;
  static  unsigned long long aesl_llvm_cbe_654_count = 0;
  static  unsigned long long aesl_llvm_cbe_655_count = 0;
  unsigned int llvm_cbe_tmp__177;
  static  unsigned long long aesl_llvm_cbe_656_count = 0;
  static  unsigned long long aesl_llvm_cbe_657_count = 0;
  static  unsigned long long aesl_llvm_cbe_658_count = 0;
  static  unsigned long long aesl_llvm_cbe_659_count = 0;
  static  unsigned long long aesl_llvm_cbe_660_count = 0;
  static  unsigned long long aesl_llvm_cbe_661_count = 0;
  static  unsigned long long aesl_llvm_cbe_662_count = 0;
  static  unsigned long long aesl_llvm_cbe_663_count = 0;
  unsigned long long llvm_cbe_tmp__178;
  static  unsigned long long aesl_llvm_cbe_664_count = 0;
  static  unsigned long long aesl_llvm_cbe_665_count = 0;
  static  unsigned long long aesl_llvm_cbe_666_count = 0;
  static  unsigned long long aesl_llvm_cbe_667_count = 0;
  static  unsigned long long aesl_llvm_cbe_668_count = 0;
  unsigned int llvm_cbe_tmp__179;
  static  unsigned long long aesl_llvm_cbe_669_count = 0;
  static  unsigned long long aesl_llvm_cbe_670_count = 0;
  static  unsigned long long aesl_llvm_cbe_671_count = 0;
  static  unsigned long long aesl_llvm_cbe_672_count = 0;
  static  unsigned long long aesl_llvm_cbe_673_count = 0;
  static  unsigned long long aesl_llvm_cbe_674_count = 0;
  unsigned int llvm_cbe_tmp__180;
  static  unsigned long long aesl_llvm_cbe_675_count = 0;
  static  unsigned long long aesl_llvm_cbe_676_count = 0;
  static  unsigned long long aesl_llvm_cbe_677_count = 0;
  static  unsigned long long aesl_llvm_cbe_678_count = 0;
  static  unsigned long long aesl_llvm_cbe_679_count = 0;
  static  unsigned long long aesl_llvm_cbe_680_count = 0;
  static  unsigned long long aesl_llvm_cbe_681_count = 0;
  static  unsigned long long aesl_llvm_cbe_682_count = 0;
  static  unsigned long long aesl_llvm_cbe_683_count = 0;
  static  unsigned long long aesl_llvm_cbe_684_count = 0;
  unsigned long long llvm_cbe_tmp__181;
  static  unsigned long long aesl_llvm_cbe_685_count = 0;
  static  unsigned long long aesl_llvm_cbe_686_count = 0;
  static  unsigned long long aesl_llvm_cbe_687_count = 0;
  static  unsigned long long aesl_llvm_cbe_688_count = 0;
  static  unsigned long long aesl_llvm_cbe_689_count = 0;
  static  unsigned long long aesl_llvm_cbe_690_count = 0;
  static  unsigned long long aesl_llvm_cbe_691_count = 0;
  static  unsigned long long aesl_llvm_cbe_692_count = 0;
  static  unsigned long long aesl_llvm_cbe_693_count = 0;
  static  unsigned long long aesl_llvm_cbe_694_count = 0;
  unsigned long long llvm_cbe_tmp__182;
  static  unsigned long long aesl_llvm_cbe_695_count = 0;
  static  unsigned long long aesl_llvm_cbe_696_count = 0;
  static  unsigned long long aesl_llvm_cbe_697_count = 0;
  static  unsigned long long aesl_llvm_cbe_698_count = 0;
  static  unsigned long long aesl_llvm_cbe_699_count = 0;
  static  unsigned long long aesl_llvm_cbe_700_count = 0;
  static  unsigned long long aesl_llvm_cbe_701_count = 0;
  static  unsigned long long aesl_llvm_cbe_702_count = 0;
  static  unsigned long long aesl_llvm_cbe_703_count = 0;
  static  unsigned long long aesl_llvm_cbe_704_count = 0;
  static  unsigned long long aesl_llvm_cbe_705_count = 0;
  static  unsigned long long aesl_llvm_cbe_706_count = 0;
  static  unsigned long long aesl_llvm_cbe_707_count = 0;
  static  unsigned long long aesl_llvm_cbe_708_count = 0;
  static  unsigned long long aesl_llvm_cbe_709_count = 0;
  static  unsigned long long aesl_llvm_cbe_710_count = 0;
  static  unsigned long long aesl_llvm_cbe_711_count = 0;
  static  unsigned long long aesl_llvm_cbe_712_count = 0;
  unsigned long long llvm_cbe_tmp__183;
  static  unsigned long long aesl_llvm_cbe_713_count = 0;
  static  unsigned long long aesl_llvm_cbe_714_count = 0;
  static  unsigned long long aesl_llvm_cbe_715_count = 0;
  unsigned long long llvm_cbe_tmp__184;
  static  unsigned long long aesl_llvm_cbe_716_count = 0;
  static  unsigned long long aesl_llvm_cbe_717_count = 0;
  static  unsigned long long aesl_llvm_cbe_718_count = 0;
  static  unsigned long long aesl_llvm_cbe_719_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned int llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe__2e_1_count = 0;
  unsigned int llvm_cbe__2e_1;
  static  unsigned long long aesl_llvm_cbe_720_count = 0;
  static  unsigned long long aesl_llvm_cbe_721_count = 0;
  static  unsigned long long aesl_llvm_cbe_722_count = 0;
  static  unsigned long long aesl_llvm_cbe_723_count = 0;
  static  unsigned long long aesl_llvm_cbe_724_count = 0;
  static  unsigned long long aesl_llvm_cbe_725_count = 0;
  static  unsigned long long aesl_llvm_cbe_726_count = 0;
  static  unsigned long long aesl_llvm_cbe_727_count = 0;
  static  unsigned long long aesl_llvm_cbe_728_count = 0;
  static  unsigned long long aesl_llvm_cbe_729_count = 0;
  static  unsigned long long aesl_llvm_cbe_730_count = 0;
  static  unsigned long long aesl_llvm_cbe_731_count = 0;
  static  unsigned long long aesl_llvm_cbe_732_count = 0;
  unsigned int llvm_cbe_tmp__185;
  static  unsigned long long aesl_llvm_cbe_733_count = 0;
  static  unsigned long long aesl_llvm_cbe_734_count = 0;
  unsigned int llvm_cbe_tmp__186;
  static  unsigned long long aesl_llvm_cbe_735_count = 0;
  unsigned long long llvm_cbe_tmp__187;
  static  unsigned long long aesl_llvm_cbe_736_count = 0;
  static  unsigned long long aesl_llvm_cbe_737_count = 0;
  static  unsigned long long aesl_llvm_cbe_738_count = 0;
  static  unsigned long long aesl_llvm_cbe_739_count = 0;
  static  unsigned long long aesl_llvm_cbe_740_count = 0;
  static  unsigned long long aesl_llvm_cbe_741_count = 0;
  static  unsigned long long aesl_llvm_cbe_742_count = 0;
  unsigned long long llvm_cbe_tmp__188;
  static  unsigned long long aesl_llvm_cbe_743_count = 0;
  static  unsigned long long aesl_llvm_cbe_744_count = 0;
  unsigned int llvm_cbe_tmp__189;
  static  unsigned long long aesl_llvm_cbe_745_count = 0;
  unsigned long long llvm_cbe_tmp__190;
  static  unsigned long long aesl_llvm_cbe_746_count = 0;
  static  unsigned long long aesl_llvm_cbe_747_count = 0;
  static  unsigned long long aesl_llvm_cbe_748_count = 0;
  static  unsigned long long aesl_llvm_cbe_749_count = 0;
  unsigned int llvm_cbe_tmp__191;
  static  unsigned long long aesl_llvm_cbe_750_count = 0;
  static  unsigned long long aesl_llvm_cbe_751_count = 0;
  static  unsigned long long aesl_llvm_cbe_752_count = 0;
  static  unsigned long long aesl_llvm_cbe_753_count = 0;
  static  unsigned long long aesl_llvm_cbe_754_count = 0;
  static  unsigned long long aesl_llvm_cbe_755_count = 0;
  static  unsigned long long aesl_llvm_cbe_756_count = 0;
  static  unsigned long long aesl_llvm_cbe_757_count = 0;
  static  unsigned long long aesl_llvm_cbe_758_count = 0;
  static  unsigned long long aesl_llvm_cbe_759_count = 0;
  static  unsigned long long aesl_llvm_cbe_760_count = 0;
  static  unsigned long long aesl_llvm_cbe_761_count = 0;
  unsigned long long llvm_cbe_tmp__192;
  static  unsigned long long aesl_llvm_cbe_762_count = 0;
  static  unsigned long long aesl_llvm_cbe_763_count = 0;
  static  unsigned long long aesl_llvm_cbe_764_count = 0;
  static  unsigned long long aesl_llvm_cbe_765_count = 0;
  static  unsigned long long aesl_llvm_cbe_766_count = 0;
  static  unsigned long long aesl_llvm_cbe_767_count = 0;
  static  unsigned long long aesl_llvm_cbe_768_count = 0;
  static  unsigned long long aesl_llvm_cbe_769_count = 0;
  static  unsigned long long aesl_llvm_cbe_770_count = 0;
  unsigned long long llvm_cbe_tmp__193;
  unsigned long long llvm_cbe_tmp__193__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_771_count = 0;
  unsigned int llvm_cbe_tmp__194;
  unsigned int llvm_cbe_tmp__194__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_772_count = 0;
  static  unsigned long long aesl_llvm_cbe_773_count = 0;
  static  unsigned long long aesl_llvm_cbe_774_count = 0;
  static  unsigned long long aesl_llvm_cbe_775_count = 0;
  unsigned int llvm_cbe_tmp__195;
  static  unsigned long long aesl_llvm_cbe_776_count = 0;
  static  unsigned long long aesl_llvm_cbe_777_count = 0;
  static  unsigned long long aesl_llvm_cbe_778_count = 0;
  static  unsigned long long aesl_llvm_cbe_779_count = 0;
  static  unsigned long long aesl_llvm_cbe_780_count = 0;
  static  unsigned long long aesl_llvm_cbe_781_count = 0;
  static  unsigned long long aesl_llvm_cbe_782_count = 0;
  static  unsigned long long aesl_llvm_cbe_783_count = 0;
  unsigned long long llvm_cbe_tmp__196;
  static  unsigned long long aesl_llvm_cbe_784_count = 0;
  unsigned long long llvm_cbe_tmp__197;
  static  unsigned long long aesl_llvm_cbe_785_count = 0;
  static  unsigned long long aesl_llvm_cbe_786_count = 0;
  static  unsigned long long aesl_llvm_cbe_787_count = 0;
  static  unsigned long long aesl_llvm_cbe_788_count = 0;
  static  unsigned long long aesl_llvm_cbe_789_count = 0;
  static  unsigned long long aesl_llvm_cbe_790_count = 0;
  static  unsigned long long aesl_llvm_cbe_791_count = 0;
  static  unsigned long long aesl_llvm_cbe_792_count = 0;
  static  unsigned long long aesl_llvm_cbe_793_count = 0;
  unsigned long long llvm_cbe_tmp__198;
  unsigned long long llvm_cbe_tmp__198__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_794_count = 0;
  unsigned int llvm_cbe_tmp__199;
  unsigned int llvm_cbe_tmp__199__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_795_count = 0;
  static  unsigned long long aesl_llvm_cbe_796_count = 0;
  static  unsigned long long aesl_llvm_cbe_797_count = 0;
  static  unsigned long long aesl_llvm_cbe_798_count = 0;
  static  unsigned long long aesl_llvm_cbe_799_count = 0;
  static  unsigned long long aesl_llvm_cbe_800_count = 0;
  static  unsigned long long aesl_llvm_cbe_801_count = 0;
  static  unsigned long long aesl_llvm_cbe_802_count = 0;
  static  unsigned long long aesl_llvm_cbe_803_count = 0;
  static  unsigned long long aesl_llvm_cbe_804_count = 0;
  unsigned long long llvm_cbe_tmp__200;
  static  unsigned long long aesl_llvm_cbe_805_count = 0;
  unsigned long long llvm_cbe_tmp__201;
  static  unsigned long long aesl_llvm_cbe_806_count = 0;
  static  unsigned long long aesl_llvm_cbe_807_count = 0;
  static  unsigned long long aesl_llvm_cbe_808_count = 0;
  static  unsigned long long aesl_llvm_cbe_809_count = 0;
  static  unsigned long long aesl_llvm_cbe_810_count = 0;
  static  unsigned long long aesl_llvm_cbe_811_count = 0;
  unsigned int llvm_cbe_tmp__202;
  static  unsigned long long aesl_llvm_cbe_812_count = 0;
  static  unsigned long long aesl_llvm_cbe_813_count = 0;
  static  unsigned long long aesl_llvm_cbe_814_count = 0;
  static  unsigned long long aesl_llvm_cbe_815_count = 0;
  static  unsigned long long aesl_llvm_cbe_816_count = 0;
  static  unsigned long long aesl_llvm_cbe_817_count = 0;
  static  unsigned long long aesl_llvm_cbe_818_count = 0;
  static  unsigned long long aesl_llvm_cbe_819_count = 0;
  static  unsigned long long aesl_llvm_cbe_820_count = 0;
  static  unsigned long long aesl_llvm_cbe_821_count = 0;
  static  unsigned long long aesl_llvm_cbe_822_count = 0;
  static  unsigned long long aesl_llvm_cbe_823_count = 0;
  static  unsigned long long aesl_llvm_cbe_824_count = 0;
  unsigned long long llvm_cbe_tmp__203;
  static  unsigned long long aesl_llvm_cbe_825_count = 0;
  static  unsigned long long aesl_llvm_cbe_826_count = 0;
  static  unsigned long long aesl_llvm_cbe_827_count = 0;
  static  unsigned long long aesl_llvm_cbe_828_count = 0;
  unsigned int llvm_cbe_tmp__204;
  static  unsigned long long aesl_llvm_cbe_829_count = 0;
  static  unsigned long long aesl_llvm_cbe_830_count = 0;
  static  unsigned long long aesl_llvm_cbe_831_count = 0;
  static  unsigned long long aesl_llvm_cbe_832_count = 0;
  static  unsigned long long aesl_llvm_cbe_833_count = 0;
  static  unsigned long long aesl_llvm_cbe_834_count = 0;
  static  unsigned long long aesl_llvm_cbe_835_count = 0;
  static  unsigned long long aesl_llvm_cbe_836_count = 0;
  static  unsigned long long aesl_llvm_cbe_837_count = 0;
  static  unsigned long long aesl_llvm_cbe_838_count = 0;
  unsigned long long llvm_cbe_tmp__205;
  static  unsigned long long aesl_llvm_cbe_839_count = 0;
  static  unsigned long long aesl_llvm_cbe_840_count = 0;
  static  unsigned long long aesl_llvm_cbe_841_count = 0;
  static  unsigned long long aesl_llvm_cbe_842_count = 0;
  static  unsigned long long aesl_llvm_cbe_843_count = 0;
  static  unsigned long long aesl_llvm_cbe_844_count = 0;
  static  unsigned long long aesl_llvm_cbe_845_count = 0;
  static  unsigned long long aesl_llvm_cbe_846_count = 0;
  static  unsigned long long aesl_llvm_cbe_847_count = 0;
  unsigned long long llvm_cbe_tmp__206;
  unsigned long long llvm_cbe_tmp__206__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_848_count = 0;
  unsigned int llvm_cbe_tmp__207;
  unsigned int llvm_cbe_tmp__207__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_849_count = 0;
  static  unsigned long long aesl_llvm_cbe_850_count = 0;
  static  unsigned long long aesl_llvm_cbe_851_count = 0;
  static  unsigned long long aesl_llvm_cbe_852_count = 0;
  static  unsigned long long aesl_llvm_cbe_853_count = 0;
  static  unsigned long long aesl_llvm_cbe_854_count = 0;
  static  unsigned long long aesl_llvm_cbe_855_count = 0;
  static  unsigned long long aesl_llvm_cbe_856_count = 0;
  static  unsigned long long aesl_llvm_cbe_857_count = 0;
  static  unsigned long long aesl_llvm_cbe_858_count = 0;
  static  unsigned long long aesl_llvm_cbe_859_count = 0;
  unsigned long long llvm_cbe_tmp__208;
  static  unsigned long long aesl_llvm_cbe_860_count = 0;
  unsigned long long llvm_cbe_tmp__209;
  static  unsigned long long aesl_llvm_cbe_861_count = 0;
  static  unsigned long long aesl_llvm_cbe_862_count = 0;
  static  unsigned long long aesl_llvm_cbe_863_count = 0;
  static  unsigned long long aesl_llvm_cbe_864_count = 0;
  static  unsigned long long aesl_llvm_cbe_865_count = 0;
  static  unsigned long long aesl_llvm_cbe_866_count = 0;
  static  unsigned long long aesl_llvm_cbe_867_count = 0;
  static  unsigned long long aesl_llvm_cbe_868_count = 0;
  static  unsigned long long aesl_llvm_cbe_869_count = 0;
  unsigned long long llvm_cbe_tmp__210;
  unsigned long long llvm_cbe_tmp__210__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_870_count = 0;
  unsigned int llvm_cbe_tmp__211;
  unsigned int llvm_cbe_tmp__211__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_871_count = 0;
  static  unsigned long long aesl_llvm_cbe_872_count = 0;
  static  unsigned long long aesl_llvm_cbe_873_count = 0;
  static  unsigned long long aesl_llvm_cbe_874_count = 0;
  static  unsigned long long aesl_llvm_cbe_875_count = 0;
  static  unsigned long long aesl_llvm_cbe_876_count = 0;
  static  unsigned long long aesl_llvm_cbe_877_count = 0;
  static  unsigned long long aesl_llvm_cbe_878_count = 0;
  static  unsigned long long aesl_llvm_cbe_879_count = 0;
  static  unsigned long long aesl_llvm_cbe_880_count = 0;
  unsigned long long llvm_cbe_tmp__212;
  static  unsigned long long aesl_llvm_cbe_881_count = 0;
  unsigned long long llvm_cbe_tmp__213;
  static  unsigned long long aesl_llvm_cbe_882_count = 0;
  static  unsigned long long aesl_llvm_cbe_883_count = 0;
  static  unsigned long long aesl_llvm_cbe_884_count = 0;
  static  unsigned long long aesl_llvm_cbe_885_count = 0;
  static  unsigned long long aesl_llvm_cbe_886_count = 0;
  static  unsigned long long aesl_llvm_cbe_887_count = 0;
  static  unsigned long long aesl_llvm_cbe_888_count = 0;
  unsigned long long llvm_cbe_tmp__214;
  unsigned long long llvm_cbe_tmp__214__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_889_count = 0;
  unsigned int llvm_cbe_tmp__215;
  unsigned int llvm_cbe_tmp__215__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_890_count = 0;
  unsigned int llvm_cbe_tmp__216;
  unsigned int llvm_cbe_tmp__216__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_891_count = 0;
  unsigned int llvm_cbe_tmp__217;
  static  unsigned long long aesl_llvm_cbe_892_count = 0;
  static  unsigned long long aesl_llvm_cbe_893_count = 0;
  static  unsigned long long aesl_llvm_cbe_894_count = 0;
  static  unsigned long long aesl_llvm_cbe_895_count = 0;
  unsigned long long llvm_cbe_tmp__218;
  static  unsigned long long aesl_llvm_cbe_896_count = 0;
  static  unsigned long long aesl_llvm_cbe_897_count = 0;
  unsigned long long llvm_cbe_tmp__219;
  unsigned long long llvm_cbe_tmp__219__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_898_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aesl_internal_subFloat64Sigs\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = call i64 @extractFloat64Frac(i64 %%a), !dbg !17 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_650_count);
  llvm_cbe_tmp__176 = (unsigned long long )extractFloat64Frac(llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__176);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = call i32 @extractFloat64Exp(i64 %%a), !dbg !17 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_655_count);
  llvm_cbe_tmp__177 = (unsigned int )extractFloat64Exp(llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__177);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = call i64 @extractFloat64Frac(i64 %%b), !dbg !18 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_663_count);
  llvm_cbe_tmp__178 = (unsigned long long )extractFloat64Frac(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__178);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i32 @extractFloat64Exp(i64 %%b), !dbg !18 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_668_count);
  llvm_cbe_tmp__179 = (unsigned int )extractFloat64Exp(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__179);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sub nsw i32 %%2, %%4, !dbg !19 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_674_count);
  llvm_cbe_tmp__180 = (unsigned int )((unsigned int )(llvm_cbe_tmp__177&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__179&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__180&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = shl i64 %%1, 10, !dbg !21 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_684_count);
  llvm_cbe_tmp__181 = (unsigned long long )llvm_cbe_tmp__176 << 10ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__181);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%6, i64* %%aSig, align 8, !dbg !21 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_691_count);
  *(&llvm_cbe_aSig) = llvm_cbe_tmp__181;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__181);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = shl i64 %%3, 10, !dbg !21 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_694_count);
  llvm_cbe_tmp__182 = (unsigned long long )llvm_cbe_tmp__178 << 10ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__182);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%7, i64* %%bSig, align 8, !dbg !21 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_701_count);
  *(&llvm_cbe_bSig) = llvm_cbe_tmp__182;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__182);
  if ((((signed int )llvm_cbe_tmp__180) > ((signed int )0u))) {
    goto llvm_cbe_tmp__220;
  } else {
    goto llvm_cbe_tmp__221;
  }

llvm_cbe_tmp__221:
  if ((((signed int )llvm_cbe_tmp__180) < ((signed int )0u))) {
    goto llvm_cbe_tmp__222;
  } else {
    goto llvm_cbe_tmp__223;
  }

llvm_cbe_tmp__223:
  if (((llvm_cbe_tmp__177&4294967295U) == (2047u&4294967295U))) {
    goto llvm_cbe_tmp__224;
  } else {
    goto llvm_cbe_tmp__225;
  }

llvm_cbe_tmp__224:
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = or i64 %%6, %%7, !dbg !21 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_712_count);
  llvm_cbe_tmp__183 = (unsigned long long )llvm_cbe_tmp__181 | llvm_cbe_tmp__182;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__183);
  if (((llvm_cbe_tmp__183&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__226;
  } else {
    goto llvm_cbe_tmp__227;
  }

llvm_cbe_tmp__227:
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = call fastcc i64 @aesl_internal_propagateFloat64NaN(i64 %%a, i64 %%b), !dbg !17 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_715_count);
  llvm_cbe_tmp__184 = (unsigned long long )aesl_internal_propagateFloat64NaN(llvm_cbe_a, llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__184);
}
  llvm_cbe_tmp__219__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__184;   /* for PHI node */
  goto llvm_cbe_tmp__228;

llvm_cbe_tmp__226:
if (AESL_DEBUG_TRACE)
printf("\n  call void @float_raise(i32 16), !dbg !21 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_717_count);
  float_raise(16u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",16u);
}
  llvm_cbe_tmp__219__PHI_TEMPORARY = (unsigned long long )9223372036854775807ull;   /* for PHI node */
  goto llvm_cbe_tmp__228;

llvm_cbe_tmp__225:
if (AESL_DEBUG_TRACE)
printf("\n  %%. = select i1 %%20, i32 1, i32 %%4, !dbg !19 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned int )((((llvm_cbe_tmp__177&4294967295U) == (0u&4294967295U))) ? ((unsigned int )1u) : ((unsigned int )llvm_cbe_tmp__179));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", llvm_cbe__2e_);
if (AESL_DEBUG_TRACE)
printf("\n  %%.1 = select i1 %%20, i32 1, i32 %%2, !dbg !19 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe__2e_1_count);
  llvm_cbe__2e_1 = (unsigned int )((((llvm_cbe_tmp__177&4294967295U) == (0u&4294967295U))) ? ((unsigned int )1u) : ((unsigned int )llvm_cbe_tmp__177));
if (AESL_DEBUG_TRACE)
printf("\n.1 = 0x%X\n", llvm_cbe__2e_1);
  if ((((unsigned long long )llvm_cbe_tmp__182&18446744073709551615ULL) < ((unsigned long long )llvm_cbe_tmp__181&18446744073709551615ULL))) {
    llvm_cbe_tmp__210__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__181;   /* for PHI node */
    llvm_cbe_tmp__211__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_1;   /* for PHI node */
    goto llvm_cbe_tmp__229;
  } else {
    goto llvm_cbe_tmp__230;
  }

llvm_cbe_tmp__230:
  if ((((unsigned long long )llvm_cbe_tmp__181&18446744073709551615ULL) < ((unsigned long long )llvm_cbe_tmp__182&18446744073709551615ULL))) {
    llvm_cbe_tmp__198__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__182;   /* for PHI node */
    llvm_cbe_tmp__199__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_;   /* for PHI node */
    goto llvm_cbe_tmp__231;
  } else {
    goto llvm_cbe_tmp__232;
  }

llvm_cbe_tmp__232:
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = load i32* @float_rounding_mode, align 4, !dbg !22 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_732_count);
  llvm_cbe_tmp__185 = (unsigned int )*(&float_rounding_mode);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__185);
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = zext i1 %%26 to i32, !dbg !22 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_734_count);
  llvm_cbe_tmp__186 = (unsigned int )((unsigned int )(bool )((llvm_cbe_tmp__185&4294967295U) == (3u&4294967295U))&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__186);
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = call i64 @packFloat64(i32 %%27, i32 0, i64 0), !dbg !22 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_735_count);
  llvm_cbe_tmp__187 = (unsigned long long )packFloat64(llvm_cbe_tmp__186, 0u, 0ull);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__186);
printf("\nArgument  = 0x%X",0u);
printf("\nArgument  = 0x%llX",0ull);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__187);
}
  llvm_cbe_tmp__219__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__187;   /* for PHI node */
  goto llvm_cbe_tmp__228;

llvm_cbe_tmp__222:
  if (((llvm_cbe_tmp__179&4294967295U) == (2047u&4294967295U))) {
    goto llvm_cbe_tmp__233;
  } else {
    goto llvm_cbe_tmp__234;
  }

llvm_cbe_tmp__233:
  if (((llvm_cbe_tmp__182&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__235;
  } else {
    goto llvm_cbe_tmp__236;
  }

llvm_cbe_tmp__236:
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = call fastcc i64 @aesl_internal_propagateFloat64NaN(i64 %%a, i64 %%b), !dbg !17 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_742_count);
  llvm_cbe_tmp__188 = (unsigned long long )aesl_internal_propagateFloat64NaN(llvm_cbe_a, llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__188);
}
  llvm_cbe_tmp__219__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__188;   /* for PHI node */
  goto llvm_cbe_tmp__228;

llvm_cbe_tmp__235:
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = xor i32 %%zSign, 1, !dbg !18 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_744_count);
  llvm_cbe_tmp__189 = (unsigned int )llvm_cbe_zSign ^ 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__189);
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = call i64 @packFloat64(i32 %%36, i32 2047, i64 0), !dbg !18 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_745_count);
  llvm_cbe_tmp__190 = (unsigned long long )packFloat64(llvm_cbe_tmp__189, 2047u, 0ull);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__189);
printf("\nArgument  = 0x%X",2047u);
printf("\nArgument  = 0x%llX",0ull);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__190);
}
  llvm_cbe_tmp__219__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__190;   /* for PHI node */
  goto llvm_cbe_tmp__228;

llvm_cbe_tmp__234:
  if (((llvm_cbe_tmp__177&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__237;
  } else {
    goto llvm_cbe_tmp__238;
  }

llvm_cbe_tmp__237:
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = add nsw i32 %%5, 1, !dbg !20 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_749_count);
  llvm_cbe_tmp__191 = (unsigned int )((unsigned int )(llvm_cbe_tmp__180&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__191&4294967295ull)));
  llvm_cbe_tmp__193__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__181;   /* for PHI node */
  llvm_cbe_tmp__194__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__191;   /* for PHI node */
  goto llvm_cbe_tmp__239;

llvm_cbe_tmp__238:
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = or i64 %%6, 4611686018427387904, !dbg !22 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_761_count);
  llvm_cbe_tmp__192 = (unsigned long long )llvm_cbe_tmp__181 | 4611686018427387904ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__192);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%43, i64* %%aSig, align 8, !dbg !22 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_768_count);
  *(&llvm_cbe_aSig) = llvm_cbe_tmp__192;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__192);
  llvm_cbe_tmp__193__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__192;   /* for PHI node */
  llvm_cbe_tmp__194__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__180;   /* for PHI node */
  goto llvm_cbe_tmp__239;

llvm_cbe_tmp__239:
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = phi i64 [ %%43, %%42 ], [ %%6, %%40  for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_770_count);
  llvm_cbe_tmp__193 = (unsigned long long )llvm_cbe_tmp__193__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__193);
printf("\n = 0x%llX",llvm_cbe_tmp__192);
printf("\n = 0x%llX",llvm_cbe_tmp__181);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = phi i32 [ %%5, %%42 ], [ %%41, %%40  for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_771_count);
  llvm_cbe_tmp__194 = (unsigned int )llvm_cbe_tmp__194__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__194);
printf("\n = 0x%X",llvm_cbe_tmp__180);
printf("\n = 0x%X",llvm_cbe_tmp__191);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = sub nsw i32 0, %%46, !dbg !21 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_775_count);
  llvm_cbe_tmp__195 = (unsigned int )-(llvm_cbe_tmp__194);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__195&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  call void @shift64RightJamming(i64 %%45, i32 %%47, i64* %%aSig), !dbg !21 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_776_count);
  shift64RightJamming(llvm_cbe_tmp__193, llvm_cbe_tmp__195, (signed long long *)(&llvm_cbe_aSig));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__193);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__195);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = load i64* %%bSig, align 8, !dbg !22 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_783_count);
  llvm_cbe_tmp__196 = (unsigned long long )*(&llvm_cbe_bSig);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__196);
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = or i64 %%48, 4611686018427387904, !dbg !22 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_784_count);
  llvm_cbe_tmp__197 = (unsigned long long )llvm_cbe_tmp__196 | 4611686018427387904ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__197);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%49, i64* %%bSig, align 8, !dbg !22 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_791_count);
  *(&llvm_cbe_bSig) = llvm_cbe_tmp__197;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__197);
  llvm_cbe_tmp__198__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__197;   /* for PHI node */
  llvm_cbe_tmp__199__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__179;   /* for PHI node */
  goto llvm_cbe_tmp__231;

llvm_cbe_tmp__231:
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = phi i64 [ %%7, %%22 ], [ %%49, %%44  for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_793_count);
  llvm_cbe_tmp__198 = (unsigned long long )llvm_cbe_tmp__198__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__198);
printf("\n = 0x%llX",llvm_cbe_tmp__182);
printf("\n = 0x%llX",llvm_cbe_tmp__197);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = phi i32 [ %%., %%22 ], [ %%4, %%44  for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_794_count);
  llvm_cbe_tmp__199 = (unsigned int )llvm_cbe_tmp__199__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__199);
printf("\n. = 0x%X",llvm_cbe__2e_);
printf("\n = 0x%X",llvm_cbe_tmp__179);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = load i64* %%aSig, align 8, !dbg !22 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_804_count);
  llvm_cbe_tmp__200 = (unsigned long long )*(&llvm_cbe_aSig);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__200);
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = sub i64 %%51, %%53, !dbg !22 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_805_count);
  llvm_cbe_tmp__201 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__198&18446744073709551615ull)) - ((unsigned long long )(llvm_cbe_tmp__200&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__201&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = xor i32 %%zSign, 1, !dbg !18 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_811_count);
  llvm_cbe_tmp__202 = (unsigned int )llvm_cbe_zSign ^ 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__202);
  llvm_cbe_tmp__214__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__201;   /* for PHI node */
  llvm_cbe_tmp__215__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__199;   /* for PHI node */
  llvm_cbe_tmp__216__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__202;   /* for PHI node */
  goto llvm_cbe_tmp__240;

llvm_cbe_tmp__220:
  if (((llvm_cbe_tmp__177&4294967295U) == (2047u&4294967295U))) {
    goto llvm_cbe_tmp__241;
  } else {
    goto llvm_cbe_tmp__242;
  }

llvm_cbe_tmp__241:
  if (((llvm_cbe_tmp__181&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    llvm_cbe_tmp__219__PHI_TEMPORARY = (unsigned long long )llvm_cbe_a;   /* for PHI node */
    goto llvm_cbe_tmp__228;
  } else {
    goto llvm_cbe_tmp__243;
  }

llvm_cbe_tmp__243:
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = call fastcc i64 @aesl_internal_propagateFloat64NaN(i64 %%a, i64 %%b), !dbg !17 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_824_count);
  llvm_cbe_tmp__203 = (unsigned long long )aesl_internal_propagateFloat64NaN(llvm_cbe_a, llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__203);
}
  llvm_cbe_tmp__219__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__203;   /* for PHI node */
  goto llvm_cbe_tmp__228;

llvm_cbe_tmp__242:
  if (((llvm_cbe_tmp__179&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__244;
  } else {
    goto llvm_cbe_tmp__245;
  }

llvm_cbe_tmp__244:
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = add nsw i32 %%5, -1, !dbg !21 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_828_count);
  llvm_cbe_tmp__204 = (unsigned int )((unsigned int )(llvm_cbe_tmp__180&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__204&4294967295ull)));
  llvm_cbe_tmp__206__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__182;   /* for PHI node */
  llvm_cbe_tmp__207__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__204;   /* for PHI node */
  goto llvm_cbe_tmp__246;

llvm_cbe_tmp__245:
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = or i64 %%7, 4611686018427387904, !dbg !23 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_838_count);
  llvm_cbe_tmp__205 = (unsigned long long )llvm_cbe_tmp__182 | 4611686018427387904ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__205);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%67, i64* %%bSig, align 8, !dbg !23 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_845_count);
  *(&llvm_cbe_bSig) = llvm_cbe_tmp__205;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__205);
  llvm_cbe_tmp__206__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__205;   /* for PHI node */
  llvm_cbe_tmp__207__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__180;   /* for PHI node */
  goto llvm_cbe_tmp__246;

llvm_cbe_tmp__246:
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = phi i64 [ %%67, %%66 ], [ %%7, %%64  for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_847_count);
  llvm_cbe_tmp__206 = (unsigned long long )llvm_cbe_tmp__206__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__206);
printf("\n = 0x%llX",llvm_cbe_tmp__205);
printf("\n = 0x%llX",llvm_cbe_tmp__182);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = phi i32 [ %%5, %%66 ], [ %%65, %%64  for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_848_count);
  llvm_cbe_tmp__207 = (unsigned int )llvm_cbe_tmp__207__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__207);
printf("\n = 0x%X",llvm_cbe_tmp__180);
printf("\n = 0x%X",llvm_cbe_tmp__204);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @shift64RightJamming(i64 %%69, i32 %%70, i64* %%bSig), !dbg !21 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_852_count);
  shift64RightJamming(llvm_cbe_tmp__206, llvm_cbe_tmp__207, (signed long long *)(&llvm_cbe_bSig));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__206);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__207);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = load i64* %%aSig, align 8, !dbg !23 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_859_count);
  llvm_cbe_tmp__208 = (unsigned long long )*(&llvm_cbe_aSig);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__208);
if (AESL_DEBUG_TRACE)
printf("\n  %%72 = or i64 %%71, 4611686018427387904, !dbg !23 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_860_count);
  llvm_cbe_tmp__209 = (unsigned long long )llvm_cbe_tmp__208 | 4611686018427387904ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__209);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%72, i64* %%aSig, align 8, !dbg !23 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_867_count);
  *(&llvm_cbe_aSig) = llvm_cbe_tmp__209;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__209);
  llvm_cbe_tmp__210__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__209;   /* for PHI node */
  llvm_cbe_tmp__211__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__177;   /* for PHI node */
  goto llvm_cbe_tmp__229;

llvm_cbe_tmp__229:
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = phi i64 [ %%6, %%19 ], [ %%72, %%68  for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_869_count);
  llvm_cbe_tmp__210 = (unsigned long long )llvm_cbe_tmp__210__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__210);
printf("\n = 0x%llX",llvm_cbe_tmp__181);
printf("\n = 0x%llX",llvm_cbe_tmp__209);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%75 = phi i32 [ %%.1, %%19 ], [ %%2, %%68  for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_870_count);
  llvm_cbe_tmp__211 = (unsigned int )llvm_cbe_tmp__211__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__211);
printf("\n.1 = 0x%X",llvm_cbe__2e_1);
printf("\n = 0x%X",llvm_cbe_tmp__177);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%76 = load i64* %%bSig, align 8, !dbg !23 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_880_count);
  llvm_cbe_tmp__212 = (unsigned long long )*(&llvm_cbe_bSig);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__212);
if (AESL_DEBUG_TRACE)
printf("\n  %%77 = sub i64 %%74, %%76, !dbg !23 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_881_count);
  llvm_cbe_tmp__213 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__210&18446744073709551615ull)) - ((unsigned long long )(llvm_cbe_tmp__212&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__213&18446744073709551615ull)));
  llvm_cbe_tmp__214__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__213;   /* for PHI node */
  llvm_cbe_tmp__215__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__211;   /* for PHI node */
  llvm_cbe_tmp__216__PHI_TEMPORARY = (unsigned int )llvm_cbe_zSign;   /* for PHI node */
  goto llvm_cbe_tmp__240;

llvm_cbe_tmp__240:
if (AESL_DEBUG_TRACE)
printf("\n  %%79 = phi i64 [ %%77, %%73 ], [ %%54, %%50  for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_888_count);
  llvm_cbe_tmp__214 = (unsigned long long )llvm_cbe_tmp__214__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__214);
printf("\n = 0x%llX",llvm_cbe_tmp__213);
printf("\n = 0x%llX",llvm_cbe_tmp__201);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%80 = phi i32 [ %%75, %%73 ], [ %%52, %%50 ], !dbg !22 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_889_count);
  llvm_cbe_tmp__215 = (unsigned int )llvm_cbe_tmp__215__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__215);
printf("\n = 0x%X",llvm_cbe_tmp__211);
printf("\n = 0x%X",llvm_cbe_tmp__199);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%81 = phi i32 [ %%zSign, %%73 ], [ %%55, %%50  for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_890_count);
  llvm_cbe_tmp__216 = (unsigned int )llvm_cbe_tmp__216__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__216);
printf("\nzSign = 0x%X",llvm_cbe_zSign);
printf("\n = 0x%X",llvm_cbe_tmp__202);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%82 = add nsw i32 %%80, -1, !dbg !22 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_891_count);
  llvm_cbe_tmp__217 = (unsigned int )((unsigned int )(llvm_cbe_tmp__215&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__217&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%83 = call fastcc i64 @aesl_internal_normalizeRoundAndPackFloat64(i32 %%81, i32 %%82, i64 %%79), !dbg !19 for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_895_count);
  llvm_cbe_tmp__218 = (unsigned long long )aesl_internal_normalizeRoundAndPackFloat64(llvm_cbe_tmp__216, llvm_cbe_tmp__217, llvm_cbe_tmp__214);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__216);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__217);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__214);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__218);
}
  llvm_cbe_tmp__219__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__218;   /* for PHI node */
  goto llvm_cbe_tmp__228;

llvm_cbe_tmp__228:
if (AESL_DEBUG_TRACE)
printf("\n  %%85 = phi i64 [ %%83, %%78 ], [ %%61, %%60 ], [ %%37, %%35 ], [ %%34, %%33 ], [ %%28, %%24 ], [ 9223372036854775807, %%18 ], [ %%17, %%16 ], [ %%a, %%58  for 0x%llxth hint within @aesl_internal_subFloat64Sigs  --> \n", ++aesl_llvm_cbe_897_count);
  llvm_cbe_tmp__219 = (unsigned long long )llvm_cbe_tmp__219__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__219);
printf("\n = 0x%llX",llvm_cbe_tmp__218);
printf("\n = 0x%llX",llvm_cbe_tmp__203);
printf("\n = 0x%llX",llvm_cbe_tmp__190);
printf("\n = 0x%llX",llvm_cbe_tmp__188);
printf("\n = 0x%llX",llvm_cbe_tmp__187);
printf("\n = 0x%llX",9223372036854775807ull);
printf("\n = 0x%llX",llvm_cbe_tmp__184);
printf("\na = 0x%llX",llvm_cbe_a);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aesl_internal_subFloat64Sigs}\n");
  return llvm_cbe_tmp__219;
}


signed long long float64_mul(signed long long llvm_cbe_a, signed long long llvm_cbe_b) {
  static  unsigned long long aesl_llvm_cbe_aExp_count = 0;
  signed int llvm_cbe_aExp;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_bExp_count = 0;
  signed int llvm_cbe_bExp;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_aSig_count = 0;
  signed long long llvm_cbe_aSig;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_bSig_count = 0;
  signed long long llvm_cbe_bSig;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_zSig0_count = 0;
  signed long long llvm_cbe_zSig0;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_zSig1_count = 0;
  signed long long llvm_cbe_zSig1;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_899_count = 0;
  static  unsigned long long aesl_llvm_cbe_900_count = 0;
  static  unsigned long long aesl_llvm_cbe_901_count = 0;
  static  unsigned long long aesl_llvm_cbe_902_count = 0;
  static  unsigned long long aesl_llvm_cbe_903_count = 0;
  static  unsigned long long aesl_llvm_cbe_904_count = 0;
  static  unsigned long long aesl_llvm_cbe_905_count = 0;
  static  unsigned long long aesl_llvm_cbe_906_count = 0;
  static  unsigned long long aesl_llvm_cbe_907_count = 0;
  static  unsigned long long aesl_llvm_cbe_908_count = 0;
  static  unsigned long long aesl_llvm_cbe_909_count = 0;
  static  unsigned long long aesl_llvm_cbe_910_count = 0;
  static  unsigned long long aesl_llvm_cbe_911_count = 0;
  static  unsigned long long aesl_llvm_cbe_912_count = 0;
  static  unsigned long long aesl_llvm_cbe_913_count = 0;
  static  unsigned long long aesl_llvm_cbe_914_count = 0;
  static  unsigned long long aesl_llvm_cbe_915_count = 0;
  static  unsigned long long aesl_llvm_cbe_916_count = 0;
  static  unsigned long long aesl_llvm_cbe_917_count = 0;
  unsigned long long llvm_cbe_tmp__247;
  static  unsigned long long aesl_llvm_cbe_918_count = 0;
  static  unsigned long long aesl_llvm_cbe_919_count = 0;
  static  unsigned long long aesl_llvm_cbe_920_count = 0;
  static  unsigned long long aesl_llvm_cbe_921_count = 0;
  static  unsigned long long aesl_llvm_cbe_922_count = 0;
  static  unsigned long long aesl_llvm_cbe_923_count = 0;
  static  unsigned long long aesl_llvm_cbe_924_count = 0;
  static  unsigned long long aesl_llvm_cbe_925_count = 0;
  unsigned int llvm_cbe_tmp__248;
  static  unsigned long long aesl_llvm_cbe_926_count = 0;
  static  unsigned long long aesl_llvm_cbe_927_count = 0;
  static  unsigned long long aesl_llvm_cbe_928_count = 0;
  static  unsigned long long aesl_llvm_cbe_929_count = 0;
  static  unsigned long long aesl_llvm_cbe_930_count = 0;
  static  unsigned long long aesl_llvm_cbe_931_count = 0;
  static  unsigned long long aesl_llvm_cbe_932_count = 0;
  static  unsigned long long aesl_llvm_cbe_933_count = 0;
  unsigned int llvm_cbe_tmp__249;
  static  unsigned long long aesl_llvm_cbe_934_count = 0;
  static  unsigned long long aesl_llvm_cbe_935_count = 0;
  static  unsigned long long aesl_llvm_cbe_936_count = 0;
  unsigned long long llvm_cbe_tmp__250;
  static  unsigned long long aesl_llvm_cbe_937_count = 0;
  static  unsigned long long aesl_llvm_cbe_938_count = 0;
  static  unsigned long long aesl_llvm_cbe_939_count = 0;
  static  unsigned long long aesl_llvm_cbe_940_count = 0;
  static  unsigned long long aesl_llvm_cbe_941_count = 0;
  static  unsigned long long aesl_llvm_cbe_942_count = 0;
  static  unsigned long long aesl_llvm_cbe_943_count = 0;
  static  unsigned long long aesl_llvm_cbe_944_count = 0;
  unsigned int llvm_cbe_tmp__251;
  static  unsigned long long aesl_llvm_cbe_945_count = 0;
  static  unsigned long long aesl_llvm_cbe_946_count = 0;
  static  unsigned long long aesl_llvm_cbe_947_count = 0;
  static  unsigned long long aesl_llvm_cbe_948_count = 0;
  static  unsigned long long aesl_llvm_cbe_949_count = 0;
  static  unsigned long long aesl_llvm_cbe_950_count = 0;
  static  unsigned long long aesl_llvm_cbe_951_count = 0;
  static  unsigned long long aesl_llvm_cbe_952_count = 0;
  unsigned int llvm_cbe_tmp__252;
  static  unsigned long long aesl_llvm_cbe_953_count = 0;
  static  unsigned long long aesl_llvm_cbe_954_count = 0;
  static  unsigned long long aesl_llvm_cbe_955_count = 0;
  unsigned int llvm_cbe_tmp__253;
  static  unsigned long long aesl_llvm_cbe_956_count = 0;
  static  unsigned long long aesl_llvm_cbe_957_count = 0;
  static  unsigned long long aesl_llvm_cbe_958_count = 0;
  static  unsigned long long aesl_llvm_cbe_959_count = 0;
  static  unsigned long long aesl_llvm_cbe_960_count = 0;
  static  unsigned long long aesl_llvm_cbe_961_count = 0;
  static  unsigned long long aesl_llvm_cbe_962_count = 0;
  static  unsigned long long aesl_llvm_cbe_963_count = 0;
  static  unsigned long long aesl_llvm_cbe_964_count = 0;
  static  unsigned long long aesl_llvm_cbe_965_count = 0;
  static  unsigned long long aesl_llvm_cbe_966_count = 0;
  static  unsigned long long aesl_llvm_cbe_967_count = 0;
  static  unsigned long long aesl_llvm_cbe_968_count = 0;
  static  unsigned long long aesl_llvm_cbe_969_count = 0;
  static  unsigned long long aesl_llvm_cbe_970_count = 0;
  static  unsigned long long aesl_llvm_cbe_971_count = 0;
  static  unsigned long long aesl_llvm_cbe_972_count = 0;
  static  unsigned long long aesl_llvm_cbe_973_count = 0;
  static  unsigned long long aesl_llvm_cbe_974_count = 0;
  static  unsigned long long aesl_llvm_cbe_or_2e_cond_count = 0;
  bool llvm_cbe_or_2e_cond;
  static  unsigned long long aesl_llvm_cbe_975_count = 0;
  static  unsigned long long aesl_llvm_cbe_976_count = 0;
  static  unsigned long long aesl_llvm_cbe_977_count = 0;
  static  unsigned long long aesl_llvm_cbe_978_count = 0;
  static  unsigned long long aesl_llvm_cbe_979_count = 0;
  unsigned long long llvm_cbe_tmp__254;
  static  unsigned long long aesl_llvm_cbe_980_count = 0;
  static  unsigned long long aesl_llvm_cbe_981_count = 0;
  static  unsigned long long aesl_llvm_cbe_982_count = 0;
  static  unsigned long long aesl_llvm_cbe_983_count = 0;
  static  unsigned long long aesl_llvm_cbe_984_count = 0;
  unsigned long long llvm_cbe_tmp__255;
  static  unsigned long long aesl_llvm_cbe_985_count = 0;
  static  unsigned long long aesl_llvm_cbe_986_count = 0;
  static  unsigned long long aesl_llvm_cbe_987_count = 0;
  static  unsigned long long aesl_llvm_cbe_988_count = 0;
  unsigned long long llvm_cbe_tmp__256;
  static  unsigned long long aesl_llvm_cbe_989_count = 0;
  static  unsigned long long aesl_llvm_cbe_990_count = 0;
  static  unsigned long long aesl_llvm_cbe_991_count = 0;
  static  unsigned long long aesl_llvm_cbe_992_count = 0;
  static  unsigned long long aesl_llvm_cbe_993_count = 0;
  unsigned long long llvm_cbe_tmp__257;
  static  unsigned long long aesl_llvm_cbe_994_count = 0;
  static  unsigned long long aesl_llvm_cbe_995_count = 0;
  static  unsigned long long aesl_llvm_cbe_996_count = 0;
  static  unsigned long long aesl_llvm_cbe_997_count = 0;
  static  unsigned long long aesl_llvm_cbe_998_count = 0;
  static  unsigned long long aesl_llvm_cbe_999_count = 0;
  static  unsigned long long aesl_llvm_cbe_1000_count = 0;
  static  unsigned long long aesl_llvm_cbe_1001_count = 0;
  static  unsigned long long aesl_llvm_cbe_1002_count = 0;
  static  unsigned long long aesl_llvm_cbe_1003_count = 0;
  unsigned long long llvm_cbe_tmp__258;
  static  unsigned long long aesl_llvm_cbe_1004_count = 0;
  static  unsigned long long aesl_llvm_cbe_1005_count = 0;
  static  unsigned long long aesl_llvm_cbe_1006_count = 0;
  unsigned long long llvm_cbe_tmp__259;
  static  unsigned long long aesl_llvm_cbe_1007_count = 0;
  static  unsigned long long aesl_llvm_cbe_1008_count = 0;
  static  unsigned long long aesl_llvm_cbe_1009_count = 0;
  static  unsigned long long aesl_llvm_cbe_1010_count = 0;
  unsigned long long llvm_cbe_tmp__260;
  static  unsigned long long aesl_llvm_cbe_1011_count = 0;
  static  unsigned long long aesl_llvm_cbe_1012_count = 0;
  static  unsigned long long aesl_llvm_cbe_1013_count = 0;
  static  unsigned long long aesl_llvm_cbe_1014_count = 0;
  static  unsigned long long aesl_llvm_cbe_1015_count = 0;
  unsigned long long llvm_cbe_tmp__261;
  static  unsigned long long aesl_llvm_cbe_1016_count = 0;
  static  unsigned long long aesl_llvm_cbe_1017_count = 0;
  static  unsigned long long aesl_llvm_cbe_1018_count = 0;
  static  unsigned long long aesl_llvm_cbe_1019_count = 0;
  static  unsigned long long aesl_llvm_cbe_1020_count = 0;
  static  unsigned long long aesl_llvm_cbe_1021_count = 0;
  static  unsigned long long aesl_llvm_cbe_1022_count = 0;
  static  unsigned long long aesl_llvm_cbe_1023_count = 0;
  static  unsigned long long aesl_llvm_cbe_1024_count = 0;
  static  unsigned long long aesl_llvm_cbe_1025_count = 0;
  unsigned long long llvm_cbe_tmp__262;
  static  unsigned long long aesl_llvm_cbe_1026_count = 0;
  static  unsigned long long aesl_llvm_cbe_1027_count = 0;
  static  unsigned long long aesl_llvm_cbe_1028_count = 0;
  static  unsigned long long aesl_llvm_cbe_1029_count = 0;
  static  unsigned long long aesl_llvm_cbe_1030_count = 0;
  static  unsigned long long aesl_llvm_cbe_1031_count = 0;
  static  unsigned long long aesl_llvm_cbe_1032_count = 0;
  static  unsigned long long aesl_llvm_cbe_1033_count = 0;
  static  unsigned long long aesl_llvm_cbe_1034_count = 0;
  static  unsigned long long aesl_llvm_cbe_1035_count = 0;
  static  unsigned long long aesl_llvm_cbe_1036_count = 0;
  unsigned int llvm_cbe_tmp__263;
  static  unsigned long long aesl_llvm_cbe_1037_count = 0;
  static  unsigned long long aesl_llvm_cbe_1038_count = 0;
  static  unsigned long long aesl_llvm_cbe_1039_count = 0;
  static  unsigned long long aesl_llvm_cbe_1040_count = 0;
  static  unsigned long long aesl_llvm_cbe_1041_count = 0;
  static  unsigned long long aesl_llvm_cbe_1042_count = 0;
  static  unsigned long long aesl_llvm_cbe_1043_count = 0;
  static  unsigned long long aesl_llvm_cbe_1044_count = 0;
  static  unsigned long long aesl_llvm_cbe_1045_count = 0;
  unsigned long long llvm_cbe_tmp__264;
  static  unsigned long long aesl_llvm_cbe_1046_count = 0;
  static  unsigned long long aesl_llvm_cbe_1047_count = 0;
  static  unsigned long long aesl_llvm_cbe_1048_count = 0;
  unsigned long long llvm_cbe_tmp__265;
  static  unsigned long long aesl_llvm_cbe_1049_count = 0;
  static  unsigned long long aesl_llvm_cbe_1050_count = 0;
  static  unsigned long long aesl_llvm_cbe_1051_count = 0;
  static  unsigned long long aesl_llvm_cbe_1052_count = 0;
  static  unsigned long long aesl_llvm_cbe_1053_count = 0;
  static  unsigned long long aesl_llvm_cbe_1054_count = 0;
  static  unsigned long long aesl_llvm_cbe_1055_count = 0;
  static  unsigned long long aesl_llvm_cbe_1056_count = 0;
  static  unsigned long long aesl_llvm_cbe_1057_count = 0;
  static  unsigned long long aesl_llvm_cbe_1058_count = 0;
  static  unsigned long long aesl_llvm_cbe_1059_count = 0;
  unsigned int llvm_cbe_tmp__266;
  static  unsigned long long aesl_llvm_cbe_1060_count = 0;
  static  unsigned long long aesl_llvm_cbe_1061_count = 0;
  static  unsigned long long aesl_llvm_cbe_1062_count = 0;
  static  unsigned long long aesl_llvm_cbe_1063_count = 0;
  static  unsigned long long aesl_llvm_cbe_1064_count = 0;
  static  unsigned long long aesl_llvm_cbe_1065_count = 0;
  static  unsigned long long aesl_llvm_cbe_1066_count = 0;
  unsigned int llvm_cbe_tmp__267;
  static  unsigned long long aesl_llvm_cbe_1067_count = 0;
  unsigned int llvm_cbe_tmp__268;
  static  unsigned long long aesl_llvm_cbe_1068_count = 0;
  unsigned int llvm_cbe_tmp__269;
  static  unsigned long long aesl_llvm_cbe_1069_count = 0;
  static  unsigned long long aesl_llvm_cbe_1070_count = 0;
  static  unsigned long long aesl_llvm_cbe_1071_count = 0;
  static  unsigned long long aesl_llvm_cbe_1072_count = 0;
  static  unsigned long long aesl_llvm_cbe_1073_count = 0;
  static  unsigned long long aesl_llvm_cbe_1074_count = 0;
  static  unsigned long long aesl_llvm_cbe_1075_count = 0;
  static  unsigned long long aesl_llvm_cbe_1076_count = 0;
  static  unsigned long long aesl_llvm_cbe_1077_count = 0;
  static  unsigned long long aesl_llvm_cbe_1078_count = 0;
  unsigned long long llvm_cbe_tmp__270;
  static  unsigned long long aesl_llvm_cbe_1079_count = 0;
  unsigned long long llvm_cbe_tmp__271;
  static  unsigned long long aesl_llvm_cbe_1080_count = 0;
  unsigned long long llvm_cbe_tmp__272;
  static  unsigned long long aesl_llvm_cbe_1081_count = 0;
  static  unsigned long long aesl_llvm_cbe_1082_count = 0;
  static  unsigned long long aesl_llvm_cbe_1083_count = 0;
  static  unsigned long long aesl_llvm_cbe_1084_count = 0;
  static  unsigned long long aesl_llvm_cbe_1085_count = 0;
  static  unsigned long long aesl_llvm_cbe_1086_count = 0;
  static  unsigned long long aesl_llvm_cbe_1087_count = 0;
  static  unsigned long long aesl_llvm_cbe_1088_count = 0;
  static  unsigned long long aesl_llvm_cbe_1089_count = 0;
  static  unsigned long long aesl_llvm_cbe_1090_count = 0;
  static  unsigned long long aesl_llvm_cbe_1091_count = 0;
  static  unsigned long long aesl_llvm_cbe_1092_count = 0;
  static  unsigned long long aesl_llvm_cbe_1093_count = 0;
  static  unsigned long long aesl_llvm_cbe_1094_count = 0;
  unsigned long long llvm_cbe_tmp__273;
  static  unsigned long long aesl_llvm_cbe_1095_count = 0;
  unsigned long long llvm_cbe_tmp__274;
  static  unsigned long long aesl_llvm_cbe_1096_count = 0;
  unsigned long long llvm_cbe_tmp__275;
  static  unsigned long long aesl_llvm_cbe_1097_count = 0;
  static  unsigned long long aesl_llvm_cbe_1098_count = 0;
  static  unsigned long long aesl_llvm_cbe_1099_count = 0;
  static  unsigned long long aesl_llvm_cbe_1100_count = 0;
  static  unsigned long long aesl_llvm_cbe_1101_count = 0;
  static  unsigned long long aesl_llvm_cbe_1102_count = 0;
  static  unsigned long long aesl_llvm_cbe_1103_count = 0;
  static  unsigned long long aesl_llvm_cbe_1104_count = 0;
  static  unsigned long long aesl_llvm_cbe_1105_count = 0;
  static  unsigned long long aesl_llvm_cbe_1106_count = 0;
  static  unsigned long long aesl_llvm_cbe_1107_count = 0;
  static  unsigned long long aesl_llvm_cbe_1108_count = 0;
  static  unsigned long long aesl_llvm_cbe_1109_count = 0;
  static  unsigned long long aesl_llvm_cbe_1110_count = 0;
  static  unsigned long long aesl_llvm_cbe_1111_count = 0;
  static  unsigned long long aesl_llvm_cbe_1112_count = 0;
  static  unsigned long long aesl_llvm_cbe_1113_count = 0;
  unsigned long long llvm_cbe_tmp__276;
  static  unsigned long long aesl_llvm_cbe_1114_count = 0;
  static  unsigned long long aesl_llvm_cbe_1115_count = 0;
  unsigned long long llvm_cbe_tmp__277;
  static  unsigned long long aesl_llvm_cbe_1116_count = 0;
  static  unsigned long long aesl_llvm_cbe_1117_count = 0;
  static  unsigned long long aesl_llvm_cbe_1118_count = 0;
  static  unsigned long long aesl_llvm_cbe_1119_count = 0;
  static  unsigned long long aesl_llvm_cbe_1120_count = 0;
  static  unsigned long long aesl_llvm_cbe_1121_count = 0;
  static  unsigned long long aesl_llvm_cbe_1122_count = 0;
  unsigned long long llvm_cbe_tmp__278;
  static  unsigned long long aesl_llvm_cbe_1123_count = 0;
  unsigned long long llvm_cbe_tmp__279;
  static  unsigned long long aesl_llvm_cbe_1124_count = 0;
  static  unsigned long long aesl_llvm_cbe_1125_count = 0;
  static  unsigned long long aesl_llvm_cbe_1126_count = 0;
  static  unsigned long long aesl_llvm_cbe_1127_count = 0;
  static  unsigned long long aesl_llvm_cbe_1128_count = 0;
  static  unsigned long long aesl_llvm_cbe_1129_count = 0;
  static  unsigned long long aesl_llvm_cbe_1130_count = 0;
  static  unsigned long long aesl_llvm_cbe_1131_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_mask_count = 0;
  unsigned long long llvm_cbe__2e_mask;
  static  unsigned long long aesl_llvm_cbe_1132_count = 0;
  static  unsigned long long aesl_llvm_cbe_1133_count = 0;
  static  unsigned long long aesl_llvm_cbe_1134_count = 0;
  static  unsigned long long aesl_llvm_cbe_1135_count = 0;
  unsigned long long llvm_cbe_tmp__280;
  static  unsigned long long aesl_llvm_cbe_1136_count = 0;
  static  unsigned long long aesl_llvm_cbe_1137_count = 0;
  static  unsigned long long aesl_llvm_cbe_1138_count = 0;
  static  unsigned long long aesl_llvm_cbe_1139_count = 0;
  static  unsigned long long aesl_llvm_cbe_1140_count = 0;
  static  unsigned long long aesl_llvm_cbe_1141_count = 0;
  static  unsigned long long aesl_llvm_cbe_1142_count = 0;
  static  unsigned long long aesl_llvm_cbe_1143_count = 0;
  unsigned int llvm_cbe_tmp__281;
  static  unsigned long long aesl_llvm_cbe_1144_count = 0;
  static  unsigned long long aesl_llvm_cbe_1145_count = 0;
  static  unsigned long long aesl_llvm_cbe_1146_count = 0;
  static  unsigned long long aesl_llvm_cbe_1147_count = 0;
  static  unsigned long long aesl_llvm_cbe_1148_count = 0;
  unsigned long long llvm_cbe_tmp__282;
  unsigned long long llvm_cbe_tmp__282__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1149_count = 0;
  unsigned int llvm_cbe_tmp__283;
  unsigned int llvm_cbe_tmp__283__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1150_count = 0;
  static  unsigned long long aesl_llvm_cbe_1151_count = 0;
  static  unsigned long long aesl_llvm_cbe_1152_count = 0;
  static  unsigned long long aesl_llvm_cbe_1153_count = 0;
  unsigned long long llvm_cbe_tmp__284;
  static  unsigned long long aesl_llvm_cbe_1154_count = 0;
  static  unsigned long long aesl_llvm_cbe_1155_count = 0;
  unsigned long long llvm_cbe_tmp__285;
  unsigned long long llvm_cbe_tmp__285__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1156_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @float64_mul\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = call i64 @extractFloat64Frac(i64 %%a), !dbg !17 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_917_count);
  llvm_cbe_tmp__247 = (unsigned long long )extractFloat64Frac(llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__247);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%1, i64* %%aSig, align 8, !dbg !17 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_924_count);
  *(&llvm_cbe_aSig) = llvm_cbe_tmp__247;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__247);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = call i32 @extractFloat64Exp(i64 %%a), !dbg !17 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_925_count);
  llvm_cbe_tmp__248 = (unsigned int )extractFloat64Exp(llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__248);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%2, i32* %%aExp, align 4, !dbg !17 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_932_count);
  *(&llvm_cbe_aExp) = llvm_cbe_tmp__248;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__248);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = call i32 @extractFloat64Sign(i64 %%a), !dbg !17 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_933_count);
  llvm_cbe_tmp__249 = (unsigned int )extractFloat64Sign(llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__249);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i64 @extractFloat64Frac(i64 %%b), !dbg !18 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_936_count);
  llvm_cbe_tmp__250 = (unsigned long long )extractFloat64Frac(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__250);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%4, i64* %%bSig, align 8, !dbg !18 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_943_count);
  *(&llvm_cbe_bSig) = llvm_cbe_tmp__250;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__250);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = call i32 @extractFloat64Exp(i64 %%b), !dbg !18 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_944_count);
  llvm_cbe_tmp__251 = (unsigned int )extractFloat64Exp(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__251);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%5, i32* %%bExp, align 4, !dbg !18 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_951_count);
  *(&llvm_cbe_bExp) = llvm_cbe_tmp__251;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__251);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = call i32 @extractFloat64Sign(i64 %%b), !dbg !18 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_952_count);
  llvm_cbe_tmp__252 = (unsigned int )extractFloat64Sign(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__252);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = xor i32 %%6, %%3, !dbg !19 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_955_count);
  llvm_cbe_tmp__253 = (unsigned int )llvm_cbe_tmp__252 ^ llvm_cbe_tmp__249;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__253);
  if (((llvm_cbe_tmp__248&4294967295U) == (2047u&4294967295U))) {
    goto llvm_cbe_tmp__286;
  } else {
    goto llvm_cbe_tmp__287;
  }

llvm_cbe_tmp__286:
  if (((llvm_cbe_tmp__247&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__288;
  } else {
    goto llvm_cbe_tmp__289;
  }

llvm_cbe_tmp__288:
if (AESL_DEBUG_TRACE)
printf("\n  %%or.cond = or i1 %%12, %%13, !dbg !21 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_or_2e_cond_count);
  llvm_cbe_or_2e_cond = (bool )((((llvm_cbe_tmp__251&4294967295U) != (2047u&4294967295U)) | ((llvm_cbe_tmp__250&18446744073709551615ULL) == (0ull&18446744073709551615ULL)))&1);
if (AESL_DEBUG_TRACE)
printf("\nor.cond = 0x%X\n", llvm_cbe_or_2e_cond);
  if (llvm_cbe_or_2e_cond) {
    goto llvm_cbe_tmp__290;
  } else {
    goto llvm_cbe_tmp__289;
  }

llvm_cbe_tmp__289:
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = call fastcc i64 @aesl_internal_propagateFloat64NaN(i64 %%a, i64 %%b), !dbg !17 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_979_count);
  llvm_cbe_tmp__254 = (unsigned long long )aesl_internal_propagateFloat64NaN(llvm_cbe_a, llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__254);
}
  llvm_cbe_tmp__285__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__254;   /* for PHI node */
  goto llvm_cbe_tmp__291;

llvm_cbe_tmp__290:
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = sext i32 %%5 to i64, !dbg !21 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_984_count);
  llvm_cbe_tmp__255 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__251);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__255);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = or i64 %%17, %%4, !dbg !21 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_988_count);
  llvm_cbe_tmp__256 = (unsigned long long )llvm_cbe_tmp__255 | llvm_cbe_tmp__250;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__256);
  if (((llvm_cbe_tmp__256&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__292;
  } else {
    goto llvm_cbe_tmp__293;
  }

llvm_cbe_tmp__292:
if (AESL_DEBUG_TRACE)
printf("\n  call void @float_raise(i32 16), !dbg !21 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_991_count);
  float_raise(16u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",16u);
}
  llvm_cbe_tmp__285__PHI_TEMPORARY = (unsigned long long )9223372036854775807ull;   /* for PHI node */
  goto llvm_cbe_tmp__291;

llvm_cbe_tmp__293:
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = call i64 @packFloat64(i32 %%7, i32 2047, i64 0), !dbg !20 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_993_count);
  llvm_cbe_tmp__257 = (unsigned long long )packFloat64(llvm_cbe_tmp__253, 2047u, 0ull);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__253);
printf("\nArgument  = 0x%X",2047u);
printf("\nArgument  = 0x%llX",0ull);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__257);
}
  llvm_cbe_tmp__285__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__257;   /* for PHI node */
  goto llvm_cbe_tmp__291;

llvm_cbe_tmp__287:
  if (((llvm_cbe_tmp__251&4294967295U) == (2047u&4294967295U))) {
    goto llvm_cbe_tmp__294;
  } else {
    goto llvm_cbe_tmp__295;
  }

llvm_cbe_tmp__294:
  if (((llvm_cbe_tmp__250&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__296;
  } else {
    goto llvm_cbe_tmp__297;
  }

llvm_cbe_tmp__297:
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = call fastcc i64 @aesl_internal_propagateFloat64NaN(i64 %%a, i64 %%b), !dbg !17 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1003_count);
  llvm_cbe_tmp__258 = (unsigned long long )aesl_internal_propagateFloat64NaN(llvm_cbe_a, llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__258);
}
  llvm_cbe_tmp__285__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__258;   /* for PHI node */
  goto llvm_cbe_tmp__291;

llvm_cbe_tmp__296:
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = sext i32 %%2 to i64, !dbg !21 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1006_count);
  llvm_cbe_tmp__259 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__248);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__259);
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = or i64 %%1, %%30, !dbg !21 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1010_count);
  llvm_cbe_tmp__260 = (unsigned long long )llvm_cbe_tmp__247 | llvm_cbe_tmp__259;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__260);
  if (((llvm_cbe_tmp__260&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__298;
  } else {
    goto llvm_cbe_tmp__299;
  }

llvm_cbe_tmp__298:
if (AESL_DEBUG_TRACE)
printf("\n  call void @float_raise(i32 16), !dbg !21 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1013_count);
  float_raise(16u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",16u);
}
  llvm_cbe_tmp__285__PHI_TEMPORARY = (unsigned long long )9223372036854775807ull;   /* for PHI node */
  goto llvm_cbe_tmp__291;

llvm_cbe_tmp__299:
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = call i64 @packFloat64(i32 %%7, i32 2047, i64 0), !dbg !20 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1015_count);
  llvm_cbe_tmp__261 = (unsigned long long )packFloat64(llvm_cbe_tmp__253, 2047u, 0ull);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__253);
printf("\nArgument  = 0x%X",2047u);
printf("\nArgument  = 0x%llX",0ull);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__261);
}
  llvm_cbe_tmp__285__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__261;   /* for PHI node */
  goto llvm_cbe_tmp__291;

llvm_cbe_tmp__295:
  if (((llvm_cbe_tmp__248&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__300;
  } else {
    goto llvm_cbe_tmp__301;
  }

llvm_cbe_tmp__300:
  if (((llvm_cbe_tmp__247&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__302;
  } else {
    goto llvm_cbe_tmp__303;
  }

llvm_cbe_tmp__302:
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = call i64 @packFloat64(i32 %%7, i32 0, i64 0), !dbg !20 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1025_count);
  llvm_cbe_tmp__262 = (unsigned long long )packFloat64(llvm_cbe_tmp__253, 0u, 0ull);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__253);
printf("\nArgument  = 0x%X",0u);
printf("\nArgument  = 0x%llX",0ull);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__262);
}
  llvm_cbe_tmp__285__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__262;   /* for PHI node */
  goto llvm_cbe_tmp__291;

llvm_cbe_tmp__303:
if (AESL_DEBUG_TRACE)
printf("\n  call fastcc void @aesl_internal_normalizeFloat64Subnormal(i64 %%1, i32* %%aExp, i64* %%aSig), !dbg !22 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1028_count);
  aesl_internal_normalizeFloat64Subnormal(llvm_cbe_tmp__247, (signed int *)(&llvm_cbe_aExp), (signed long long *)(&llvm_cbe_aSig));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__247);
}
  goto llvm_cbe_tmp__301;

llvm_cbe_tmp__301:
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = load i32* %%bExp, align 4, !dbg !22 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1036_count);
  llvm_cbe_tmp__263 = (unsigned int )*(&llvm_cbe_bExp);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__263);
  if (((llvm_cbe_tmp__263&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__304;
  } else {
    goto llvm_cbe_tmp__305;
  }

llvm_cbe_tmp__304:
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = load i64* %%bSig, align 8, !dbg !22 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1045_count);
  llvm_cbe_tmp__264 = (unsigned long long )*(&llvm_cbe_bSig);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__264);
  if (((llvm_cbe_tmp__264&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__306;
  } else {
    goto llvm_cbe_tmp__307;
  }

llvm_cbe_tmp__306:
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = call i64 @packFloat64(i32 %%7, i32 0, i64 0), !dbg !20 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1048_count);
  llvm_cbe_tmp__265 = (unsigned long long )packFloat64(llvm_cbe_tmp__253, 0u, 0ull);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__253);
printf("\nArgument  = 0x%X",0u);
printf("\nArgument  = 0x%llX",0ull);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__265);
}
  llvm_cbe_tmp__285__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__265;   /* for PHI node */
  goto llvm_cbe_tmp__291;

llvm_cbe_tmp__307:
if (AESL_DEBUG_TRACE)
printf("\n  call fastcc void @aesl_internal_normalizeFloat64Subnormal(i64 %%47, i32* %%bExp, i64* %%bSig), !dbg !22 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1051_count);
  aesl_internal_normalizeFloat64Subnormal(llvm_cbe_tmp__264, (signed int *)(&llvm_cbe_bExp), (signed long long *)(&llvm_cbe_bSig));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__264);
}
  goto llvm_cbe_tmp__305;

llvm_cbe_tmp__305:
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = load i32* %%aExp, align 4, !dbg !22 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1059_count);
  llvm_cbe_tmp__266 = (unsigned int )*(&llvm_cbe_aExp);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__266);
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = load i32* %%bExp, align 4, !dbg !22 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1066_count);
  llvm_cbe_tmp__267 = (unsigned int )*(&llvm_cbe_bExp);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__267);
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = add nsw i32 %%54, %%53, !dbg !22 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1067_count);
  llvm_cbe_tmp__268 = (unsigned int )((unsigned int )(llvm_cbe_tmp__267&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__266&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__268&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = add nsw i32 %%55, -1023, !dbg !22 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1068_count);
  llvm_cbe_tmp__269 = (unsigned int )((unsigned int )(llvm_cbe_tmp__268&4294967295ull)) + ((unsigned int )(4294966273u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__269&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = load i64* %%aSig, align 8, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1078_count);
  llvm_cbe_tmp__270 = (unsigned long long )*(&llvm_cbe_aSig);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__270);
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = shl i64 %%57, 10, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1079_count);
  llvm_cbe_tmp__271 = (unsigned long long )llvm_cbe_tmp__270 << 10ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__271);
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = or i64 %%58, 4611686018427387904, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1080_count);
  llvm_cbe_tmp__272 = (unsigned long long )llvm_cbe_tmp__271 | 4611686018427387904ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__272);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%59, i64* %%aSig, align 8, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1087_count);
  *(&llvm_cbe_aSig) = llvm_cbe_tmp__272;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__272);
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = load i64* %%bSig, align 8, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1094_count);
  llvm_cbe_tmp__273 = (unsigned long long )*(&llvm_cbe_bSig);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__273);
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = shl i64 %%60, 11, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1095_count);
  llvm_cbe_tmp__274 = (unsigned long long )llvm_cbe_tmp__273 << 11ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__274);
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = or i64 %%61, -9223372036854775808, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1096_count);
  llvm_cbe_tmp__275 = (unsigned long long )llvm_cbe_tmp__274 | 9223372036854775808ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__275);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%62, i64* %%bSig, align 8, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1103_count);
  *(&llvm_cbe_bSig) = llvm_cbe_tmp__275;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__275);
if (AESL_DEBUG_TRACE)
printf("\n  call void @mul64To128(i64 %%59, i64 %%62, i64* %%zSig0, i64* %%zSig1), !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1106_count);
  mul64To128(llvm_cbe_tmp__272, llvm_cbe_tmp__275, (signed long long *)(&llvm_cbe_zSig0), (signed long long *)(&llvm_cbe_zSig1));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__272);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__275);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = load i64* %%zSig1, align 8, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1113_count);
  llvm_cbe_tmp__276 = (unsigned long long )*(&llvm_cbe_zSig1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__276);
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = zext i1 %%64 to i64, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1115_count);
  llvm_cbe_tmp__277 = (unsigned long long )((unsigned long long )(bool )((llvm_cbe_tmp__276&18446744073709551615ULL) != (0ull&18446744073709551615ULL))&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__277);
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = load i64* %%zSig0, align 8, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1122_count);
  llvm_cbe_tmp__278 = (unsigned long long )*(&llvm_cbe_zSig0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__278);
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = or i64 %%65, %%66, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1123_count);
  llvm_cbe_tmp__279 = (unsigned long long )llvm_cbe_tmp__277 | llvm_cbe_tmp__278;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__279);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%67, i64* %%zSig0, align 8, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1130_count);
  *(&llvm_cbe_zSig0) = llvm_cbe_tmp__279;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__279);
if (AESL_DEBUG_TRACE)
printf("\n  %%.mask = and i64 %%66, 4611686018427387904, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe__2e_mask_count);
  llvm_cbe__2e_mask = (unsigned long long )llvm_cbe_tmp__278 & 4611686018427387904ull;
if (AESL_DEBUG_TRACE)
printf("\n.mask = 0x%llX\n", llvm_cbe__2e_mask);
  if (((llvm_cbe__2e_mask&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__308;
  } else {
    llvm_cbe_tmp__282__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__279;   /* for PHI node */
    llvm_cbe_tmp__283__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__269;   /* for PHI node */
    goto llvm_cbe_tmp__309;
  }

llvm_cbe_tmp__308:
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = shl i64 %%67, 1, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1135_count);
  llvm_cbe_tmp__280 = (unsigned long long )llvm_cbe_tmp__279 << 1ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__280);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%70, i64* %%zSig0, align 8, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1142_count);
  *(&llvm_cbe_zSig0) = llvm_cbe_tmp__280;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__280);
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = add nsw i32 %%55, -1024, !dbg !23 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1143_count);
  llvm_cbe_tmp__281 = (unsigned int )((unsigned int )(llvm_cbe_tmp__268&4294967295ull)) + ((unsigned int )(4294966272u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__281&4294967295ull)));
  llvm_cbe_tmp__282__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__280;   /* for PHI node */
  llvm_cbe_tmp__283__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__281;   /* for PHI node */
  goto llvm_cbe_tmp__309;

llvm_cbe_tmp__309:
if (AESL_DEBUG_TRACE)
printf("\n  %%73 = phi i64 [ %%70, %%69 ], [ %%67, %%52  for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1148_count);
  llvm_cbe_tmp__282 = (unsigned long long )llvm_cbe_tmp__282__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__282);
printf("\n = 0x%llX",llvm_cbe_tmp__280);
printf("\n = 0x%llX",llvm_cbe_tmp__279);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = phi i32 [ %%71, %%69 ], [ %%56, %%52  for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1149_count);
  llvm_cbe_tmp__283 = (unsigned int )llvm_cbe_tmp__283__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__283);
printf("\n = 0x%X",llvm_cbe_tmp__281);
printf("\n = 0x%X",llvm_cbe_tmp__269);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%75 = call fastcc i64 @aesl_internal_roundAndPackFloat64(i32 %%7, i32 %%74, i64 %%73), !dbg !20 for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1153_count);
  llvm_cbe_tmp__284 = (unsigned long long )aesl_internal_roundAndPackFloat64(llvm_cbe_tmp__253, llvm_cbe_tmp__283, llvm_cbe_tmp__282);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__253);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__283);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__282);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__284);
}
  llvm_cbe_tmp__285__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__284;   /* for PHI node */
  goto llvm_cbe_tmp__291;

llvm_cbe_tmp__291:
if (AESL_DEBUG_TRACE)
printf("\n  %%77 = phi i64 [ %%75, %%72 ], [ %%50, %%49 ], [ %%41, %%40 ], [ %%35, %%34 ], [ 9223372036854775807, %%33 ], [ %%28, %%27 ], [ %%22, %%21 ], [ 9223372036854775807, %%20 ], [ %%15, %%14  for 0x%llxth hint within @float64_mul  --> \n", ++aesl_llvm_cbe_1155_count);
  llvm_cbe_tmp__285 = (unsigned long long )llvm_cbe_tmp__285__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__285);
printf("\n = 0x%llX",llvm_cbe_tmp__284);
printf("\n = 0x%llX",llvm_cbe_tmp__265);
printf("\n = 0x%llX",llvm_cbe_tmp__262);
printf("\n = 0x%llX",llvm_cbe_tmp__261);
printf("\n = 0x%llX",9223372036854775807ull);
printf("\n = 0x%llX",llvm_cbe_tmp__258);
printf("\n = 0x%llX",llvm_cbe_tmp__257);
printf("\n = 0x%llX",9223372036854775807ull);
printf("\n = 0x%llX",llvm_cbe_tmp__254);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @float64_mul}\n");
  return llvm_cbe_tmp__285;
}


static signed long long aesl_internal_propagateFloat64NaN(signed long long llvm_cbe_a, signed long long llvm_cbe_b) {
  static  unsigned long long aesl_llvm_cbe_1157_count = 0;
  static  unsigned long long aesl_llvm_cbe_1158_count = 0;
  static  unsigned long long aesl_llvm_cbe_1159_count = 0;
  static  unsigned long long aesl_llvm_cbe_1160_count = 0;
  static  unsigned long long aesl_llvm_cbe_1161_count = 0;
  static  unsigned long long aesl_llvm_cbe_1162_count = 0;
  static  unsigned long long aesl_llvm_cbe_1163_count = 0;
  static  unsigned long long aesl_llvm_cbe_1164_count = 0;
  static  unsigned long long aesl_llvm_cbe_1165_count = 0;
  static  unsigned long long aesl_llvm_cbe_1166_count = 0;
  static  unsigned long long aesl_llvm_cbe_1167_count = 0;
  static  unsigned long long aesl_llvm_cbe_1168_count = 0;
  static  unsigned long long aesl_llvm_cbe_1169_count = 0;
  unsigned int llvm_cbe_tmp__310;
  static  unsigned long long aesl_llvm_cbe_1170_count = 0;
  static  unsigned long long aesl_llvm_cbe_1171_count = 0;
  static  unsigned long long aesl_llvm_cbe_1172_count = 0;
  static  unsigned long long aesl_llvm_cbe_1173_count = 0;
  unsigned int llvm_cbe_tmp__311;
  static  unsigned long long aesl_llvm_cbe_1174_count = 0;
  static  unsigned long long aesl_llvm_cbe_1175_count = 0;
  static  unsigned long long aesl_llvm_cbe_1176_count = 0;
  unsigned int llvm_cbe_tmp__312;
  static  unsigned long long aesl_llvm_cbe_1177_count = 0;
  static  unsigned long long aesl_llvm_cbe_1178_count = 0;
  static  unsigned long long aesl_llvm_cbe_1179_count = 0;
  static  unsigned long long aesl_llvm_cbe_1180_count = 0;
  unsigned long long llvm_cbe_tmp__313;
  static  unsigned long long aesl_llvm_cbe_1181_count = 0;
  static  unsigned long long aesl_llvm_cbe_1182_count = 0;
  static  unsigned long long aesl_llvm_cbe_1183_count = 0;
  static  unsigned long long aesl_llvm_cbe_1184_count = 0;
  static  unsigned long long aesl_llvm_cbe_1185_count = 0;
  static  unsigned long long aesl_llvm_cbe_1186_count = 0;
  static  unsigned long long aesl_llvm_cbe_1187_count = 0;
  unsigned long long llvm_cbe_tmp__314;
  static  unsigned long long aesl_llvm_cbe_1188_count = 0;
  static  unsigned long long aesl_llvm_cbe_1189_count = 0;
  static  unsigned long long aesl_llvm_cbe_1190_count = 0;
  static  unsigned long long aesl_llvm_cbe_1191_count = 0;
  static  unsigned long long aesl_llvm_cbe_1192_count = 0;
  static  unsigned long long aesl_llvm_cbe_1193_count = 0;
  static  unsigned long long aesl_llvm_cbe_1194_count = 0;
  unsigned int llvm_cbe_tmp__315;
  static  unsigned long long aesl_llvm_cbe_1195_count = 0;
  static  unsigned long long aesl_llvm_cbe_1196_count = 0;
  static  unsigned long long aesl_llvm_cbe_1197_count = 0;
  static  unsigned long long aesl_llvm_cbe_1198_count = 0;
  static  unsigned long long aesl_llvm_cbe_1199_count = 0;
  static  unsigned long long aesl_llvm_cbe_1200_count = 0;
  static  unsigned long long aesl_llvm_cbe_1201_count = 0;
  static  unsigned long long aesl_llvm_cbe_1202_count = 0;
  static  unsigned long long aesl_llvm_cbe_1203_count = 0;
  static  unsigned long long aesl_llvm_cbe_1204_count = 0;
  unsigned long long llvm_cbe_tmp__316;
  static  unsigned long long aesl_llvm_cbe_1205_count = 0;
  static  unsigned long long aesl_llvm_cbe_1206_count = 0;
  unsigned long long llvm_cbe_tmp__317;
  unsigned long long llvm_cbe_tmp__317__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1207_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aesl_internal_propagateFloat64NaN\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call i32 @float64_is_signaling_nan(i64 %%a), !dbg !17 for 0x%llxth hint within @aesl_internal_propagateFloat64NaN  --> \n", ++aesl_llvm_cbe_1169_count);
  llvm_cbe_tmp__310 = (unsigned int ) /*tail*/ float64_is_signaling_nan(llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__310);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = tail call i32 @float64_is_nan(i64 %%b), !dbg !17 for 0x%llxth hint within @aesl_internal_propagateFloat64NaN  --> \n", ++aesl_llvm_cbe_1173_count);
  llvm_cbe_tmp__311 = (unsigned int ) /*tail*/ float64_is_nan(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__311);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = tail call i32 @float64_is_signaling_nan(i64 %%b), !dbg !18 for 0x%llxth hint within @aesl_internal_propagateFloat64NaN  --> \n", ++aesl_llvm_cbe_1176_count);
  llvm_cbe_tmp__312 = (unsigned int ) /*tail*/ float64_is_signaling_nan(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__312);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = or i64 %%a, 2251799813685248, !dbg !17 for 0x%llxth hint within @aesl_internal_propagateFloat64NaN  --> \n", ++aesl_llvm_cbe_1180_count);
  llvm_cbe_tmp__313 = (unsigned long long )llvm_cbe_a | 2251799813685248ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__313);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = or i64 %%b, 2251799813685248, !dbg !18 for 0x%llxth hint within @aesl_internal_propagateFloat64NaN  --> \n", ++aesl_llvm_cbe_1187_count);
  llvm_cbe_tmp__314 = (unsigned long long )llvm_cbe_b | 2251799813685248ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__314);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = or i32 %%3, %%1, !dbg !18 for 0x%llxth hint within @aesl_internal_propagateFloat64NaN  --> \n", ++aesl_llvm_cbe_1194_count);
  llvm_cbe_tmp__315 = (unsigned int )llvm_cbe_tmp__312 | llvm_cbe_tmp__310;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__315);
  if (((llvm_cbe_tmp__315&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__318;
  } else {
    goto llvm_cbe_tmp__319;
  }

llvm_cbe_tmp__319:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @float_raise(i32 16), !dbg !18 for 0x%llxth hint within @aesl_internal_propagateFloat64NaN  --> \n", ++aesl_llvm_cbe_1197_count);
   /*tail*/ float_raise(16u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",16u);
}
  goto llvm_cbe_tmp__318;

llvm_cbe_tmp__318:
  if (((llvm_cbe_tmp__312&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__320;
  } else {
    llvm_cbe_tmp__317__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__314;   /* for PHI node */
    goto llvm_cbe_tmp__321;
  }

llvm_cbe_tmp__320:
  if (((llvm_cbe_tmp__310&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__322;
  } else {
    llvm_cbe_tmp__317__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__313;   /* for PHI node */
    goto llvm_cbe_tmp__321;
  }

llvm_cbe_tmp__322:
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = select i1 %%14, i64 %%4, i64 %%5, !dbg !17 for 0x%llxth hint within @aesl_internal_propagateFloat64NaN  --> \n", ++aesl_llvm_cbe_1204_count);
  llvm_cbe_tmp__316 = (unsigned long long )((((llvm_cbe_tmp__311&4294967295U) == (0u&4294967295U))) ? ((unsigned long long )llvm_cbe_tmp__313) : ((unsigned long long )llvm_cbe_tmp__314));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__316);
  llvm_cbe_tmp__317__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__316;   /* for PHI node */
  goto llvm_cbe_tmp__321;

llvm_cbe_tmp__321:
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = phi i64 [ %%15, %%13 ], [ %%5, %%9 ], [ %%4, %%11 ], !dbg !17 for 0x%llxth hint within @aesl_internal_propagateFloat64NaN  --> \n", ++aesl_llvm_cbe_1206_count);
  llvm_cbe_tmp__317 = (unsigned long long )llvm_cbe_tmp__317__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__317);
printf("\n = 0x%llX",llvm_cbe_tmp__316);
printf("\n = 0x%llX",llvm_cbe_tmp__314);
printf("\n = 0x%llX",llvm_cbe_tmp__313);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aesl_internal_propagateFloat64NaN}\n");
  return llvm_cbe_tmp__317;
}


static void aesl_internal_normalizeFloat64Subnormal(signed long long llvm_cbe_aSig, signed int *llvm_cbe_zExpPtr, signed long long *llvm_cbe_zSigPtr) {
  static  unsigned long long aesl_llvm_cbe_1208_count = 0;
  static  unsigned long long aesl_llvm_cbe_1209_count = 0;
  static  unsigned long long aesl_llvm_cbe_1210_count = 0;
  static  unsigned long long aesl_llvm_cbe_1211_count = 0;
  static  unsigned long long aesl_llvm_cbe_1212_count = 0;
  static  unsigned long long aesl_llvm_cbe_1213_count = 0;
  static  unsigned long long aesl_llvm_cbe_1214_count = 0;
  static  unsigned long long aesl_llvm_cbe_1215_count = 0;
  unsigned int llvm_cbe_tmp__323;
  static  unsigned long long aesl_llvm_cbe_1216_count = 0;
  unsigned int llvm_cbe_tmp__324;
  static  unsigned long long aesl_llvm_cbe_1217_count = 0;
  static  unsigned long long aesl_llvm_cbe_1218_count = 0;
  static  unsigned long long aesl_llvm_cbe_1219_count = 0;
  static  unsigned long long aesl_llvm_cbe_1220_count = 0;
  unsigned long long llvm_cbe_tmp__325;
  static  unsigned long long aesl_llvm_cbe_1221_count = 0;
  unsigned long long llvm_cbe_tmp__326;
  static  unsigned long long aesl_llvm_cbe_1222_count = 0;
  static  unsigned long long aesl_llvm_cbe_1223_count = 0;
  unsigned int llvm_cbe_tmp__327;
  static  unsigned long long aesl_llvm_cbe_1224_count = 0;
  static  unsigned long long aesl_llvm_cbe_1225_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aesl_internal_normalizeFloat64Subnormal\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call fastcc i32 @aesl_internal_countLeadingZeros64(i64 %%aSig), !dbg !17 for 0x%llxth hint within @aesl_internal_normalizeFloat64Subnormal  --> \n", ++aesl_llvm_cbe_1215_count);
  llvm_cbe_tmp__323 = (unsigned int ) /*tail*/ aesl_internal_countLeadingZeros64(llvm_cbe_aSig);
if (AESL_DEBUG_TRACE) {
printf("\nArgument aSig = 0x%llX",llvm_cbe_aSig);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__323);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = add nsw i32 %%1, -11, !dbg !17 for 0x%llxth hint within @aesl_internal_normalizeFloat64Subnormal  --> \n", ++aesl_llvm_cbe_1216_count);
  llvm_cbe_tmp__324 = (unsigned int )((unsigned int )(llvm_cbe_tmp__323&4294967295ull)) + ((unsigned int )(4294967285u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__324&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = zext i32 %%2 to i64, !dbg !17 for 0x%llxth hint within @aesl_internal_normalizeFloat64Subnormal  --> \n", ++aesl_llvm_cbe_1220_count);
  llvm_cbe_tmp__325 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__324&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__325);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = shl i64 %%aSig, %%3, !dbg !17 for 0x%llxth hint within @aesl_internal_normalizeFloat64Subnormal  --> \n", ++aesl_llvm_cbe_1221_count);
  llvm_cbe_tmp__326 = (unsigned long long )llvm_cbe_aSig << llvm_cbe_tmp__325;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__326);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%4, i64* %%zSigPtr, align 8, !dbg !17 for 0x%llxth hint within @aesl_internal_normalizeFloat64Subnormal  --> \n", ++aesl_llvm_cbe_1222_count);
  *llvm_cbe_zSigPtr = llvm_cbe_tmp__326;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__326);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sub i32 12, %%1, !dbg !17 for 0x%llxth hint within @aesl_internal_normalizeFloat64Subnormal  --> \n", ++aesl_llvm_cbe_1223_count);
  llvm_cbe_tmp__327 = (unsigned int )((unsigned int )(12u&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__323&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__327&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%5, i32* %%zExpPtr, align 4, !dbg !17 for 0x%llxth hint within @aesl_internal_normalizeFloat64Subnormal  --> \n", ++aesl_llvm_cbe_1224_count);
  *llvm_cbe_zExpPtr = llvm_cbe_tmp__327;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__327);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aesl_internal_normalizeFloat64Subnormal}\n");
  return;
}


static signed long long aesl_internal_roundAndPackFloat64(signed int llvm_cbe_zSign, signed int llvm_cbe_zExp, signed long long llvm_cbe_zSig) {
  static  unsigned long long aesl_llvm_cbe_1226_count = 0;
  signed long long llvm_cbe_tmp__328;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_1227_count = 0;
  static  unsigned long long aesl_llvm_cbe_1228_count = 0;
  static  unsigned long long aesl_llvm_cbe_1229_count = 0;
  static  unsigned long long aesl_llvm_cbe_1230_count = 0;
  static  unsigned long long aesl_llvm_cbe_1231_count = 0;
  static  unsigned long long aesl_llvm_cbe_1232_count = 0;
  static  unsigned long long aesl_llvm_cbe_1233_count = 0;
  static  unsigned long long aesl_llvm_cbe_1234_count = 0;
  static  unsigned long long aesl_llvm_cbe_1235_count = 0;
  static  unsigned long long aesl_llvm_cbe_1236_count = 0;
  static  unsigned long long aesl_llvm_cbe_1237_count = 0;
  static  unsigned long long aesl_llvm_cbe_1238_count = 0;
  static  unsigned long long aesl_llvm_cbe_1239_count = 0;
  static  unsigned long long aesl_llvm_cbe_1240_count = 0;
  static  unsigned long long aesl_llvm_cbe_1241_count = 0;
  static  unsigned long long aesl_llvm_cbe_1242_count = 0;
  static  unsigned long long aesl_llvm_cbe_1243_count = 0;
  static  unsigned long long aesl_llvm_cbe_1244_count = 0;
  static  unsigned long long aesl_llvm_cbe_1245_count = 0;
  static  unsigned long long aesl_llvm_cbe_1246_count = 0;
  unsigned int llvm_cbe_tmp__329;
  static  unsigned long long aesl_llvm_cbe_1247_count = 0;
  static  unsigned long long aesl_llvm_cbe_1248_count = 0;
  static  unsigned long long aesl_llvm_cbe_1249_count = 0;
  static  unsigned long long aesl_llvm_cbe_1250_count = 0;
  static  unsigned long long aesl_llvm_cbe_1251_count = 0;
  static  unsigned long long aesl_llvm_cbe_1252_count = 0;
  static  unsigned long long aesl_llvm_cbe_1253_count = 0;
  static  unsigned long long aesl_llvm_cbe_1254_count = 0;
  static  unsigned long long aesl_llvm_cbe_1255_count = 0;
  static  unsigned long long aesl_llvm_cbe_1256_count = 0;
  static  unsigned long long aesl_llvm_cbe_1257_count = 0;
  static  unsigned long long aesl_llvm_cbe_1258_count = 0;
  static  unsigned long long aesl_llvm_cbe_1259_count = 0;
  static  unsigned long long aesl_llvm_cbe_1260_count = 0;
  static  unsigned long long aesl_llvm_cbe_1261_count = 0;
  static  unsigned long long aesl_llvm_cbe_1262_count = 0;
  static  unsigned long long aesl_llvm_cbe_1263_count = 0;
  static  unsigned long long aesl_llvm_cbe_1264_count = 0;
  static  unsigned long long aesl_llvm_cbe_1265_count = 0;
  static  unsigned long long aesl_llvm_cbe_1266_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned int llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe_1267_count = 0;
  static  unsigned long long aesl_llvm_cbe_1268_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_1_count = 0;
  unsigned int llvm_cbe__2e_1;
  static  unsigned long long aesl_llvm_cbe_1269_count = 0;
  static  unsigned long long aesl_llvm_cbe_1270_count = 0;
  unsigned int llvm_cbe_tmp__330;
  unsigned int llvm_cbe_tmp__330__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1271_count = 0;
  static  unsigned long long aesl_llvm_cbe_1272_count = 0;
  static  unsigned long long aesl_llvm_cbe_1273_count = 0;
  static  unsigned long long aesl_llvm_cbe_1274_count = 0;
  unsigned int llvm_cbe_tmp__331;
  static  unsigned long long aesl_llvm_cbe_1275_count = 0;
  unsigned int llvm_cbe_tmp__332;
  static  unsigned long long aesl_llvm_cbe_1276_count = 0;
  static  unsigned long long aesl_llvm_cbe_1277_count = 0;
  static  unsigned long long aesl_llvm_cbe_1278_count = 0;
  static  unsigned long long aesl_llvm_cbe_1279_count = 0;
  static  unsigned long long aesl_llvm_cbe_1280_count = 0;
  unsigned short llvm_cbe_tmp__333;
  static  unsigned long long aesl_llvm_cbe_1281_count = 0;
  static  unsigned long long aesl_llvm_cbe_1282_count = 0;
  static  unsigned long long aesl_llvm_cbe_1283_count = 0;
  static  unsigned long long aesl_llvm_cbe_1284_count = 0;
  static  unsigned long long aesl_llvm_cbe_1285_count = 0;
  static  unsigned long long aesl_llvm_cbe_1286_count = 0;
  static  unsigned long long aesl_llvm_cbe_1287_count = 0;
  static  unsigned long long aesl_llvm_cbe_1288_count = 0;
  unsigned long long llvm_cbe_tmp__334;
  static  unsigned long long aesl_llvm_cbe_1289_count = 0;
  unsigned long long llvm_cbe_tmp__335;
  static  unsigned long long aesl_llvm_cbe_1290_count = 0;
  static  unsigned long long aesl_llvm_cbe_1291_count = 0;
  static  unsigned long long aesl_llvm_cbe_1292_count = 0;
  static  unsigned long long aesl_llvm_cbe_1293_count = 0;
  unsigned long long llvm_cbe_tmp__336;
  static  unsigned long long aesl_llvm_cbe_1294_count = 0;
  static  unsigned long long aesl_llvm_cbe_1295_count = 0;
  unsigned long long llvm_cbe_tmp__337;
  static  unsigned long long aesl_llvm_cbe_1296_count = 0;
  unsigned long long llvm_cbe_tmp__338;
  static  unsigned long long aesl_llvm_cbe_1297_count = 0;
  static  unsigned long long aesl_llvm_cbe_1298_count = 0;
  static  unsigned long long aesl_llvm_cbe_1299_count = 0;
  static  unsigned long long aesl_llvm_cbe_1300_count = 0;
  static  unsigned long long aesl_llvm_cbe_1301_count = 0;
  static  unsigned long long aesl_llvm_cbe_1302_count = 0;
  static  unsigned long long aesl_llvm_cbe_1303_count = 0;
  static  unsigned long long aesl_llvm_cbe_1304_count = 0;
  static  unsigned long long aesl_llvm_cbe_1305_count = 0;
  unsigned int llvm_cbe_tmp__339;
  static  unsigned long long aesl_llvm_cbe_1306_count = 0;
  static  unsigned long long aesl_llvm_cbe_1307_count = 0;
  static  unsigned long long aesl_llvm_cbe_1308_count = 0;
  static  unsigned long long aesl_llvm_cbe_1309_count = 0;
  static  unsigned long long aesl_llvm_cbe_1310_count = 0;
  static  unsigned long long aesl_llvm_cbe_1311_count = 0;
  static  unsigned long long aesl_llvm_cbe_1312_count = 0;
  static  unsigned long long aesl_llvm_cbe_1313_count = 0;
  static  unsigned long long aesl_llvm_cbe_1314_count = 0;
  static  unsigned long long aesl_llvm_cbe_1315_count = 0;
  static  unsigned long long aesl_llvm_cbe_1316_count = 0;
  static  unsigned long long aesl_llvm_cbe_1317_count = 0;
  static  unsigned long long aesl_llvm_cbe_1318_count = 0;
  static  unsigned long long aesl_llvm_cbe_1319_count = 0;
  static  unsigned long long aesl_llvm_cbe_1320_count = 0;
  unsigned long long llvm_cbe_tmp__340;
  static  unsigned long long aesl_llvm_cbe_1321_count = 0;
  unsigned int llvm_cbe_tmp__341;
  static  unsigned long long aesl_llvm_cbe_1322_count = 0;
  unsigned int llvm_cbe_tmp__342;
  static  unsigned long long aesl_llvm_cbe_1323_count = 0;
  static  unsigned long long aesl_llvm_cbe_1324_count = 0;
  static  unsigned long long aesl_llvm_cbe_1325_count = 0;
  static  unsigned long long aesl_llvm_cbe_1326_count = 0;
  static  unsigned long long aesl_llvm_cbe_1327_count = 0;
  static  unsigned long long aesl_llvm_cbe_1328_count = 0;
  static  unsigned long long aesl_llvm_cbe_1329_count = 0;
  static  unsigned long long aesl_llvm_cbe_1330_count = 0;
  static  unsigned long long aesl_llvm_cbe_1331_count = 0;
  static  unsigned long long aesl_llvm_cbe_1332_count = 0;
  unsigned int llvm_cbe_tmp__343;
  unsigned int llvm_cbe_tmp__343__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1333_count = 0;
  unsigned int llvm_cbe_tmp__344;
  unsigned int llvm_cbe_tmp__344__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1334_count = 0;
  static  unsigned long long aesl_llvm_cbe_1335_count = 0;
  static  unsigned long long aesl_llvm_cbe_1336_count = 0;
  unsigned int llvm_cbe_tmp__345;
  static  unsigned long long aesl_llvm_cbe_1337_count = 0;
  unsigned int llvm_cbe_tmp__346;
  static  unsigned long long aesl_llvm_cbe_1338_count = 0;
  static  unsigned long long aesl_llvm_cbe_1339_count = 0;
  static  unsigned long long aesl_llvm_cbe_1340_count = 0;
  static  unsigned long long aesl_llvm_cbe_1341_count = 0;
  static  unsigned long long aesl_llvm_cbe_1342_count = 0;
  static  unsigned long long aesl_llvm_cbe_1343_count = 0;
  static  unsigned long long aesl_llvm_cbe_1344_count = 0;
  static  unsigned long long aesl_llvm_cbe_1345_count = 0;
  static  unsigned long long aesl_llvm_cbe_1346_count = 0;
  unsigned long long llvm_cbe_tmp__347;
  static  unsigned long long aesl_llvm_cbe_1347_count = 0;
  unsigned long long llvm_cbe_tmp__348;
  static  unsigned long long aesl_llvm_cbe_1348_count = 0;
  unsigned long long llvm_cbe_tmp__349;
  static  unsigned long long aesl_llvm_cbe_1349_count = 0;
  unsigned long long llvm_cbe_tmp__350;
  static  unsigned long long aesl_llvm_cbe_1350_count = 0;
  static  unsigned long long aesl_llvm_cbe_1351_count = 0;
  static  unsigned long long aesl_llvm_cbe_1352_count = 0;
  bool llvm_cbe_tmp__351;
  static  unsigned long long aesl_llvm_cbe_1353_count = 0;
  unsigned int llvm_cbe_tmp__352;
  static  unsigned long long aesl_llvm_cbe_1354_count = 0;
  unsigned int llvm_cbe_tmp__353;
  static  unsigned long long aesl_llvm_cbe_1355_count = 0;
  unsigned long long llvm_cbe_tmp__354;
  static  unsigned long long aesl_llvm_cbe_1356_count = 0;
  static  unsigned long long aesl_llvm_cbe_1357_count = 0;
  unsigned long long llvm_cbe_tmp__355;
  static  unsigned long long aesl_llvm_cbe_1358_count = 0;
  static  unsigned long long aesl_llvm_cbe_1359_count = 0;
  static  unsigned long long aesl_llvm_cbe_1360_count = 0;
  static  unsigned long long aesl_llvm_cbe_1361_count = 0;
  static  unsigned long long aesl_llvm_cbe_1362_count = 0;
  static  unsigned long long aesl_llvm_cbe_1363_count = 0;
  static  unsigned long long aesl_llvm_cbe_1364_count = 0;
  static  unsigned long long aesl_llvm_cbe_1365_count = 0;
  static  unsigned long long aesl_llvm_cbe_1366_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_2_count = 0;
  unsigned int llvm_cbe__2e_2;
  static  unsigned long long aesl_llvm_cbe_1367_count = 0;
  static  unsigned long long aesl_llvm_cbe_1368_count = 0;
  static  unsigned long long aesl_llvm_cbe_1369_count = 0;
  unsigned long long llvm_cbe_tmp__356;
  static  unsigned long long aesl_llvm_cbe_1370_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
  unsigned long long llvm_cbe_storemerge;
  unsigned long long llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1371_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aesl_internal_roundAndPackFloat64\n");
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%zSig, i64* %%1, align  for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1244_count);
  *(&llvm_cbe_tmp__328) = llvm_cbe_zSig;
if (AESL_DEBUG_TRACE)
printf("\nzSig = 0x%llX\n", llvm_cbe_zSig);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = load i32* @float_rounding_mode, align 4, !dbg !18 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1246_count);
  llvm_cbe_tmp__329 = (unsigned int )*(&float_rounding_mode);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__329);
  if (((llvm_cbe_tmp__329&4294967295U) == (0u&4294967295U))) {
    llvm_cbe_tmp__330__PHI_TEMPORARY = (unsigned int )512u;   /* for PHI node */
    goto llvm_cbe_tmp__357;
  } else {
    goto llvm_cbe_tmp__358;
  }

llvm_cbe_tmp__358:
  if (((llvm_cbe_tmp__329&4294967295U) == (1u&4294967295U))) {
    llvm_cbe_tmp__330__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe_tmp__357;
  } else {
    goto llvm_cbe_tmp__359;
  }

llvm_cbe_tmp__359:
  if (((llvm_cbe_zSign&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__360;
  } else {
    goto llvm_cbe_tmp__361;
  }

llvm_cbe_tmp__361:
if (AESL_DEBUG_TRACE)
printf("\n  %%. = select i1 %%9, i32 0, i32 1023, !dbg !19 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned int )((((llvm_cbe_tmp__329&4294967295U) == (2u&4294967295U))) ? ((unsigned int )0u) : ((unsigned int )1023u));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", llvm_cbe__2e_);
  llvm_cbe_tmp__330__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_;   /* for PHI node */
  goto llvm_cbe_tmp__357;

llvm_cbe_tmp__360:
if (AESL_DEBUG_TRACE)
printf("\n  %%.1 = select i1 %%11, i32 0, i32 1023, !dbg !19 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe__2e_1_count);
  llvm_cbe__2e_1 = (unsigned int )((((llvm_cbe_tmp__329&4294967295U) == (3u&4294967295U))) ? ((unsigned int )0u) : ((unsigned int )1023u));
if (AESL_DEBUG_TRACE)
printf("\n.1 = 0x%X\n", llvm_cbe__2e_1);
  llvm_cbe_tmp__330__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_1;   /* for PHI node */
  goto llvm_cbe_tmp__357;

llvm_cbe_tmp__357:
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = phi i32 [ 512, %%0 ], [ 0, %%4 ], [ %%., %%8 ], [ %%.1, %%10  for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1270_count);
  llvm_cbe_tmp__330 = (unsigned int )llvm_cbe_tmp__330__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__330);
printf("\n = 0x%X",512u);
printf("\n = 0x%X",0u);
printf("\n. = 0x%X",llvm_cbe__2e_);
printf("\n.1 = 0x%X",llvm_cbe__2e_1);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = trunc i64 %%zSig to i32, !dbg !20 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1274_count);
  llvm_cbe_tmp__331 = (unsigned int )((unsigned int )llvm_cbe_zSig&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__331);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = and i32 %%14, 1023, !dbg !20 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1275_count);
  llvm_cbe_tmp__332 = (unsigned int )llvm_cbe_tmp__331 & 1023u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__332);
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = trunc i32 %%zExp to i16, !dbg !18 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1280_count);
  llvm_cbe_tmp__333 = (unsigned short )((unsigned short )llvm_cbe_zExp&65535U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__333);
  if ((((unsigned short )llvm_cbe_tmp__333&65535U) > ((unsigned short )((unsigned short )2044)&65535U))) {
    goto llvm_cbe_tmp__362;
  } else {
    llvm_cbe_tmp__343__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__332;   /* for PHI node */
    llvm_cbe_tmp__344__PHI_TEMPORARY = (unsigned int )llvm_cbe_zExp;   /* for PHI node */
    goto llvm_cbe__2e_thread;
  }

llvm_cbe_tmp__362:
  if ((((signed int )llvm_cbe_zExp) > ((signed int )2045u))) {
    goto llvm_cbe_tmp__363;
  } else {
    goto llvm_cbe_tmp__364;
  }

llvm_cbe_tmp__364:
  if (((llvm_cbe_zExp&4294967295U) == (2045u&4294967295U))) {
    goto llvm_cbe_tmp__365;
  } else {
    goto llvm_cbe_tmp__366;
  }

llvm_cbe_tmp__365:
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = zext i32 %%13 to i64, !dbg !18 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1288_count);
  llvm_cbe_tmp__334 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__330&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__334);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = add i64 %%23, %%zSig, !dbg !18 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1289_count);
  llvm_cbe_tmp__335 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__334&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_zSig&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__335&18446744073709551615ull)));
  if ((((signed long long )llvm_cbe_tmp__335) < ((signed long long )0ull))) {
    goto llvm_cbe_tmp__363;
  } else {
    llvm_cbe_tmp__343__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__332;   /* for PHI node */
    llvm_cbe_tmp__344__PHI_TEMPORARY = (unsigned int )2045u;   /* for PHI node */
    goto llvm_cbe__2e_thread;
  }

llvm_cbe_tmp__363:
if (AESL_DEBUG_TRACE)
printf("\n  call void @float_raise(i32 9), !dbg !20 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1292_count);
  float_raise(9u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",9u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = call i64 @packFloat64(i32 %%zSign, i32 2047, i64 0), !dbg !17 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1293_count);
  llvm_cbe_tmp__336 = (unsigned long long )packFloat64(llvm_cbe_zSign, 2047u, 0ull);
if (AESL_DEBUG_TRACE) {
printf("\nArgument zSign = 0x%X",llvm_cbe_zSign);
printf("\nArgument  = 0x%X",2047u);
printf("\nArgument  = 0x%llX",0ull);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__336);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = zext i1 %%28 to i64, !dbg !17 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1295_count);
  llvm_cbe_tmp__337 = (unsigned long long )((unsigned long long )(bool )((llvm_cbe_tmp__330&4294967295U) == (0u&4294967295U))&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__337);
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = sub i64 %%27, %%29, !dbg !17 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1296_count);
  llvm_cbe_tmp__338 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__336&18446744073709551615ull)) - ((unsigned long long )(llvm_cbe_tmp__337&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__338&18446744073709551615ull)));
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__338;   /* for PHI node */
  goto llvm_cbe_tmp__367;

llvm_cbe_tmp__366:
  if ((((signed int )llvm_cbe_zExp) < ((signed int )0u))) {
    goto llvm_cbe_tmp__368;
  } else {
    llvm_cbe_tmp__343__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__332;   /* for PHI node */
    llvm_cbe_tmp__344__PHI_TEMPORARY = (unsigned int )llvm_cbe_zExp;   /* for PHI node */
    goto llvm_cbe__2e_thread;
  }

llvm_cbe_tmp__368:
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = sub nsw i32 0, %%zExp, !dbg !18 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1305_count);
  llvm_cbe_tmp__339 = (unsigned int )-(llvm_cbe_zExp);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__339&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  call void @shift64RightJamming(i64 %%zSig, i32 %%34, i64* %%1), !dbg !18 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1306_count);
  shift64RightJamming(llvm_cbe_zSig, llvm_cbe_tmp__339, (signed long long *)(&llvm_cbe_tmp__328));
if (AESL_DEBUG_TRACE) {
printf("\nArgument zSig = 0x%llX",llvm_cbe_zSig);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__339);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = load i64* %%1, align 8, !dbg !21 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1320_count);
  llvm_cbe_tmp__340 = (unsigned long long )*(&llvm_cbe_tmp__328);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__340);
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = trunc i64 %%35 to i32, !dbg !21 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1321_count);
  llvm_cbe_tmp__341 = (unsigned int )((unsigned int )llvm_cbe_tmp__340&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__341);
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = and i32 %%36, 1023, !dbg !21 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1322_count);
  llvm_cbe_tmp__342 = (unsigned int )llvm_cbe_tmp__341 & 1023u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__342);
  if (((llvm_cbe_tmp__342&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__369;
  } else {
    goto llvm_cbe_tmp__370;
  }

llvm_cbe_tmp__370:
if (AESL_DEBUG_TRACE)
printf("\n  call void @float_raise(i32 4), !dbg !21 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1329_count);
  float_raise(4u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",4u);
}
  goto llvm_cbe_tmp__369;

llvm_cbe_tmp__369:
  llvm_cbe_tmp__343__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__342;   /* for PHI node */
  llvm_cbe_tmp__344__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe__2e_thread;

llvm_cbe__2e_thread:
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = phi i32 [ %%15, %%12 ], [ %%37, %%40 ], [ %%15, %%31 ], [ %%15, %%22  for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1332_count);
  llvm_cbe_tmp__343 = (unsigned int )llvm_cbe_tmp__343__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__343);
printf("\n = 0x%X",llvm_cbe_tmp__332);
printf("\n = 0x%X",llvm_cbe_tmp__342);
printf("\n = 0x%X",llvm_cbe_tmp__332);
printf("\n = 0x%X",llvm_cbe_tmp__332);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = phi i32 [ %%zExp, %%12 ], [ 0, %%40 ], [ %%zExp, %%31 ], [ 2045, %%22  for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1333_count);
  llvm_cbe_tmp__344 = (unsigned int )llvm_cbe_tmp__344__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__344);
printf("\nzExp = 0x%X",llvm_cbe_zExp);
printf("\n = 0x%X",0u);
printf("\nzExp = 0x%X",llvm_cbe_zExp);
printf("\n = 0x%X",2045u);
}
  if (((llvm_cbe_tmp__343&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__371;
  } else {
    goto llvm_cbe_tmp__372;
  }

llvm_cbe_tmp__372:
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = load i32* @float_exception_flags, align 4, !dbg !21 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1336_count);
  llvm_cbe_tmp__345 = (unsigned int )*(&float_exception_flags);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__345);
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = or i32 %%45, 1, !dbg !21 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1337_count);
  llvm_cbe_tmp__346 = (unsigned int )llvm_cbe_tmp__345 | 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__346);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%46, i32* @float_exception_flags, align 4, !dbg !21 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1338_count);
  *(&float_exception_flags) = llvm_cbe_tmp__346;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__346);
  goto llvm_cbe_tmp__371;

llvm_cbe_tmp__371:
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = load i64* %%1, align 8, !dbg !20 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1346_count);
  llvm_cbe_tmp__347 = (unsigned long long )*(&llvm_cbe_tmp__328);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__347);
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = zext i32 %%13 to i64, !dbg !20 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1347_count);
  llvm_cbe_tmp__348 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__330&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__348);
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = add i64 %%48, %%49, !dbg !20 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1348_count);
  llvm_cbe_tmp__349 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__347&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__348&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__349&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = lshr i64 %%50, 10, !dbg !20 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1349_count);
  llvm_cbe_tmp__350 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__349&18446744073709551615ull)) >> ((unsigned long long )(10ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__350&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = and i1 %%52, %%3, !dbg !20 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1352_count);
  llvm_cbe_tmp__351 = (bool )((((llvm_cbe_tmp__343&4294967295U) == (512u&4294967295U)) & ((llvm_cbe_tmp__329&4294967295U) == (0u&4294967295U)))&1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__351);
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = zext i1 %%53 to i32, !dbg !20 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1353_count);
  llvm_cbe_tmp__352 = (unsigned int )((unsigned int )(bool )llvm_cbe_tmp__351&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__352);
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = xor i32 %%54, -1, !dbg !20 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1354_count);
  llvm_cbe_tmp__353 = (unsigned int )llvm_cbe_tmp__352 ^ 4294967295u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__353);
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = sext i32 %%55 to i64, !dbg !20 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1355_count);
  llvm_cbe_tmp__354 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__353);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__354);
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = and i64 %%51, %%56, !dbg !20 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1357_count);
  llvm_cbe_tmp__355 = (unsigned long long )llvm_cbe_tmp__350 & llvm_cbe_tmp__354;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__355);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%57, i64* %%1, align 8, !dbg !20 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1364_count);
  *(&llvm_cbe_tmp__328) = llvm_cbe_tmp__355;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__355);
if (AESL_DEBUG_TRACE)
printf("\n  %%.2 = select i1 %%58, i32 0, i32 %%42, !dbg !21 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe__2e_2_count);
  llvm_cbe__2e_2 = (unsigned int )((((llvm_cbe_tmp__355&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) ? ((unsigned int )0u) : ((unsigned int )llvm_cbe_tmp__344));
if (AESL_DEBUG_TRACE)
printf("\n.2 = 0x%X\n", llvm_cbe__2e_2);
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = call i64 @packFloat64(i32 %%zSign, i32 %%.2, i64 %%57), !dbg !17 for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1369_count);
  llvm_cbe_tmp__356 = (unsigned long long )packFloat64(llvm_cbe_zSign, llvm_cbe__2e_2, llvm_cbe_tmp__355);
if (AESL_DEBUG_TRACE) {
printf("\nArgument zSign = 0x%X",llvm_cbe_zSign);
printf("\nArgument .2 = 0x%X",llvm_cbe__2e_2);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__355);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__356);
}
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__356;   /* for PHI node */
  goto llvm_cbe_tmp__367;

llvm_cbe_tmp__367:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i64 [ %%30, %%26 ], [ %%59, %%47  for 0x%llxth hint within @aesl_internal_roundAndPackFloat64  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = (unsigned long long )llvm_cbe_storemerge__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge = 0x%llX",llvm_cbe_storemerge);
printf("\n = 0x%llX",llvm_cbe_tmp__338);
printf("\n = 0x%llX",llvm_cbe_tmp__356);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aesl_internal_roundAndPackFloat64}\n");
  return llvm_cbe_storemerge;
}


signed long long float64_div(signed long long llvm_cbe_a, signed long long llvm_cbe_b) {
  static  unsigned long long aesl_llvm_cbe_aExp_count = 0;
  signed int llvm_cbe_aExp;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_bExp_count = 0;
  signed int llvm_cbe_bExp;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_aSig_count = 0;
  signed long long llvm_cbe_aSig;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_bSig_count = 0;
  signed long long llvm_cbe_bSig;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_rem0_count = 0;
  signed long long llvm_cbe_rem0;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_rem1_count = 0;
  signed long long llvm_cbe_rem1;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_term0_count = 0;
  signed long long llvm_cbe_term0;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_term1_count = 0;
  signed long long llvm_cbe_term1;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_1372_count = 0;
  static  unsigned long long aesl_llvm_cbe_1373_count = 0;
  static  unsigned long long aesl_llvm_cbe_1374_count = 0;
  static  unsigned long long aesl_llvm_cbe_1375_count = 0;
  static  unsigned long long aesl_llvm_cbe_1376_count = 0;
  static  unsigned long long aesl_llvm_cbe_1377_count = 0;
  static  unsigned long long aesl_llvm_cbe_1378_count = 0;
  static  unsigned long long aesl_llvm_cbe_1379_count = 0;
  static  unsigned long long aesl_llvm_cbe_1380_count = 0;
  static  unsigned long long aesl_llvm_cbe_1381_count = 0;
  static  unsigned long long aesl_llvm_cbe_1382_count = 0;
  static  unsigned long long aesl_llvm_cbe_1383_count = 0;
  static  unsigned long long aesl_llvm_cbe_1384_count = 0;
  static  unsigned long long aesl_llvm_cbe_1385_count = 0;
  static  unsigned long long aesl_llvm_cbe_1386_count = 0;
  static  unsigned long long aesl_llvm_cbe_1387_count = 0;
  static  unsigned long long aesl_llvm_cbe_1388_count = 0;
  static  unsigned long long aesl_llvm_cbe_1389_count = 0;
  static  unsigned long long aesl_llvm_cbe_1390_count = 0;
  static  unsigned long long aesl_llvm_cbe_1391_count = 0;
  static  unsigned long long aesl_llvm_cbe_1392_count = 0;
  static  unsigned long long aesl_llvm_cbe_1393_count = 0;
  static  unsigned long long aesl_llvm_cbe_1394_count = 0;
  unsigned long long llvm_cbe_tmp__373;
  static  unsigned long long aesl_llvm_cbe_1395_count = 0;
  static  unsigned long long aesl_llvm_cbe_1396_count = 0;
  static  unsigned long long aesl_llvm_cbe_1397_count = 0;
  static  unsigned long long aesl_llvm_cbe_1398_count = 0;
  static  unsigned long long aesl_llvm_cbe_1399_count = 0;
  static  unsigned long long aesl_llvm_cbe_1400_count = 0;
  static  unsigned long long aesl_llvm_cbe_1401_count = 0;
  static  unsigned long long aesl_llvm_cbe_1402_count = 0;
  unsigned int llvm_cbe_tmp__374;
  static  unsigned long long aesl_llvm_cbe_1403_count = 0;
  static  unsigned long long aesl_llvm_cbe_1404_count = 0;
  static  unsigned long long aesl_llvm_cbe_1405_count = 0;
  static  unsigned long long aesl_llvm_cbe_1406_count = 0;
  static  unsigned long long aesl_llvm_cbe_1407_count = 0;
  static  unsigned long long aesl_llvm_cbe_1408_count = 0;
  static  unsigned long long aesl_llvm_cbe_1409_count = 0;
  static  unsigned long long aesl_llvm_cbe_1410_count = 0;
  unsigned int llvm_cbe_tmp__375;
  static  unsigned long long aesl_llvm_cbe_1411_count = 0;
  static  unsigned long long aesl_llvm_cbe_1412_count = 0;
  static  unsigned long long aesl_llvm_cbe_1413_count = 0;
  unsigned long long llvm_cbe_tmp__376;
  static  unsigned long long aesl_llvm_cbe_1414_count = 0;
  static  unsigned long long aesl_llvm_cbe_1415_count = 0;
  static  unsigned long long aesl_llvm_cbe_1416_count = 0;
  static  unsigned long long aesl_llvm_cbe_1417_count = 0;
  static  unsigned long long aesl_llvm_cbe_1418_count = 0;
  static  unsigned long long aesl_llvm_cbe_1419_count = 0;
  static  unsigned long long aesl_llvm_cbe_1420_count = 0;
  static  unsigned long long aesl_llvm_cbe_1421_count = 0;
  unsigned int llvm_cbe_tmp__377;
  static  unsigned long long aesl_llvm_cbe_1422_count = 0;
  static  unsigned long long aesl_llvm_cbe_1423_count = 0;
  static  unsigned long long aesl_llvm_cbe_1424_count = 0;
  static  unsigned long long aesl_llvm_cbe_1425_count = 0;
  static  unsigned long long aesl_llvm_cbe_1426_count = 0;
  static  unsigned long long aesl_llvm_cbe_1427_count = 0;
  static  unsigned long long aesl_llvm_cbe_1428_count = 0;
  static  unsigned long long aesl_llvm_cbe_1429_count = 0;
  unsigned int llvm_cbe_tmp__378;
  static  unsigned long long aesl_llvm_cbe_1430_count = 0;
  static  unsigned long long aesl_llvm_cbe_1431_count = 0;
  static  unsigned long long aesl_llvm_cbe_1432_count = 0;
  unsigned int llvm_cbe_tmp__379;
  static  unsigned long long aesl_llvm_cbe_1433_count = 0;
  static  unsigned long long aesl_llvm_cbe_1434_count = 0;
  static  unsigned long long aesl_llvm_cbe_1435_count = 0;
  static  unsigned long long aesl_llvm_cbe_1436_count = 0;
  static  unsigned long long aesl_llvm_cbe_1437_count = 0;
  static  unsigned long long aesl_llvm_cbe_1438_count = 0;
  static  unsigned long long aesl_llvm_cbe_1439_count = 0;
  static  unsigned long long aesl_llvm_cbe_1440_count = 0;
  static  unsigned long long aesl_llvm_cbe_1441_count = 0;
  static  unsigned long long aesl_llvm_cbe_1442_count = 0;
  static  unsigned long long aesl_llvm_cbe_1443_count = 0;
  static  unsigned long long aesl_llvm_cbe_1444_count = 0;
  static  unsigned long long aesl_llvm_cbe_1445_count = 0;
  static  unsigned long long aesl_llvm_cbe_1446_count = 0;
  static  unsigned long long aesl_llvm_cbe_1447_count = 0;
  static  unsigned long long aesl_llvm_cbe_1448_count = 0;
  static  unsigned long long aesl_llvm_cbe_1449_count = 0;
  unsigned long long llvm_cbe_tmp__380;
  static  unsigned long long aesl_llvm_cbe_1450_count = 0;
  static  unsigned long long aesl_llvm_cbe_1451_count = 0;
  static  unsigned long long aesl_llvm_cbe_1452_count = 0;
  static  unsigned long long aesl_llvm_cbe_1453_count = 0;
  static  unsigned long long aesl_llvm_cbe_1454_count = 0;
  static  unsigned long long aesl_llvm_cbe_1455_count = 0;
  static  unsigned long long aesl_llvm_cbe_1456_count = 0;
  static  unsigned long long aesl_llvm_cbe_1457_count = 0;
  static  unsigned long long aesl_llvm_cbe_1458_count = 0;
  static  unsigned long long aesl_llvm_cbe_1459_count = 0;
  unsigned long long llvm_cbe_tmp__381;
  static  unsigned long long aesl_llvm_cbe_1460_count = 0;
  static  unsigned long long aesl_llvm_cbe_1461_count = 0;
  static  unsigned long long aesl_llvm_cbe_1462_count = 0;
  static  unsigned long long aesl_llvm_cbe_1463_count = 0;
  unsigned long long llvm_cbe_tmp__382;
  static  unsigned long long aesl_llvm_cbe_1464_count = 0;
  static  unsigned long long aesl_llvm_cbe_1465_count = 0;
  static  unsigned long long aesl_llvm_cbe_1466_count = 0;
  static  unsigned long long aesl_llvm_cbe_1467_count = 0;
  static  unsigned long long aesl_llvm_cbe_1468_count = 0;
  static  unsigned long long aesl_llvm_cbe_1469_count = 0;
  static  unsigned long long aesl_llvm_cbe_1470_count = 0;
  static  unsigned long long aesl_llvm_cbe_1471_count = 0;
  static  unsigned long long aesl_llvm_cbe_1472_count = 0;
  static  unsigned long long aesl_llvm_cbe_1473_count = 0;
  unsigned long long llvm_cbe_tmp__383;
  static  unsigned long long aesl_llvm_cbe_1474_count = 0;
  static  unsigned long long aesl_llvm_cbe_1475_count = 0;
  unsigned long long llvm_cbe_tmp__384;
  static  unsigned long long aesl_llvm_cbe_1476_count = 0;
  static  unsigned long long aesl_llvm_cbe_1477_count = 0;
  static  unsigned long long aesl_llvm_cbe_1478_count = 0;
  static  unsigned long long aesl_llvm_cbe_1479_count = 0;
  static  unsigned long long aesl_llvm_cbe_1480_count = 0;
  static  unsigned long long aesl_llvm_cbe_1481_count = 0;
  static  unsigned long long aesl_llvm_cbe_1482_count = 0;
  static  unsigned long long aesl_llvm_cbe_1483_count = 0;
  static  unsigned long long aesl_llvm_cbe_1484_count = 0;
  static  unsigned long long aesl_llvm_cbe_1485_count = 0;
  static  unsigned long long aesl_llvm_cbe_1486_count = 0;
  unsigned long long llvm_cbe_tmp__385;
  static  unsigned long long aesl_llvm_cbe_1487_count = 0;
  static  unsigned long long aesl_llvm_cbe_1488_count = 0;
  static  unsigned long long aesl_llvm_cbe_1489_count = 0;
  static  unsigned long long aesl_llvm_cbe_1490_count = 0;
  unsigned long long llvm_cbe_tmp__386;
  static  unsigned long long aesl_llvm_cbe_1491_count = 0;
  static  unsigned long long aesl_llvm_cbe_1492_count = 0;
  static  unsigned long long aesl_llvm_cbe_1493_count = 0;
  static  unsigned long long aesl_llvm_cbe_1494_count = 0;
  static  unsigned long long aesl_llvm_cbe_1495_count = 0;
  static  unsigned long long aesl_llvm_cbe_1496_count = 0;
  unsigned long long llvm_cbe_tmp__387;
  static  unsigned long long aesl_llvm_cbe_1497_count = 0;
  static  unsigned long long aesl_llvm_cbe_1498_count = 0;
  static  unsigned long long aesl_llvm_cbe_1499_count = 0;
  static  unsigned long long aesl_llvm_cbe_1500_count = 0;
  static  unsigned long long aesl_llvm_cbe_1501_count = 0;
  static  unsigned long long aesl_llvm_cbe_1502_count = 0;
  static  unsigned long long aesl_llvm_cbe_1503_count = 0;
  static  unsigned long long aesl_llvm_cbe_1504_count = 0;
  static  unsigned long long aesl_llvm_cbe_1505_count = 0;
  static  unsigned long long aesl_llvm_cbe_1506_count = 0;
  static  unsigned long long aesl_llvm_cbe_1507_count = 0;
  unsigned int llvm_cbe_tmp__388;
  static  unsigned long long aesl_llvm_cbe_1508_count = 0;
  static  unsigned long long aesl_llvm_cbe_1509_count = 0;
  static  unsigned long long aesl_llvm_cbe_1510_count = 0;
  static  unsigned long long aesl_llvm_cbe_1511_count = 0;
  static  unsigned long long aesl_llvm_cbe_1512_count = 0;
  static  unsigned long long aesl_llvm_cbe_1513_count = 0;
  static  unsigned long long aesl_llvm_cbe_1514_count = 0;
  static  unsigned long long aesl_llvm_cbe_1515_count = 0;
  static  unsigned long long aesl_llvm_cbe_1516_count = 0;
  unsigned long long llvm_cbe_tmp__389;
  static  unsigned long long aesl_llvm_cbe_1517_count = 0;
  static  unsigned long long aesl_llvm_cbe_1518_count = 0;
  static  unsigned long long aesl_llvm_cbe_1519_count = 0;
  unsigned long long llvm_cbe_tmp__390;
  static  unsigned long long aesl_llvm_cbe_1520_count = 0;
  static  unsigned long long aesl_llvm_cbe_1521_count = 0;
  static  unsigned long long aesl_llvm_cbe_1522_count = 0;
  static  unsigned long long aesl_llvm_cbe_1523_count = 0;
  static  unsigned long long aesl_llvm_cbe_1524_count = 0;
  static  unsigned long long aesl_llvm_cbe_1525_count = 0;
  static  unsigned long long aesl_llvm_cbe_1526_count = 0;
  static  unsigned long long aesl_llvm_cbe_1527_count = 0;
  static  unsigned long long aesl_llvm_cbe_1528_count = 0;
  static  unsigned long long aesl_llvm_cbe_1529_count = 0;
  static  unsigned long long aesl_llvm_cbe_1530_count = 0;
  unsigned int llvm_cbe_tmp__391;
  static  unsigned long long aesl_llvm_cbe_1531_count = 0;
  static  unsigned long long aesl_llvm_cbe_1532_count = 0;
  static  unsigned long long aesl_llvm_cbe_1533_count = 0;
  static  unsigned long long aesl_llvm_cbe_1534_count = 0;
  static  unsigned long long aesl_llvm_cbe_1535_count = 0;
  static  unsigned long long aesl_llvm_cbe_1536_count = 0;
  static  unsigned long long aesl_llvm_cbe_1537_count = 0;
  unsigned int llvm_cbe_tmp__392;
  static  unsigned long long aesl_llvm_cbe_1538_count = 0;
  unsigned int llvm_cbe_tmp__393;
  static  unsigned long long aesl_llvm_cbe_1539_count = 0;
  unsigned int llvm_cbe_tmp__394;
  static  unsigned long long aesl_llvm_cbe_1540_count = 0;
  static  unsigned long long aesl_llvm_cbe_1541_count = 0;
  static  unsigned long long aesl_llvm_cbe_1542_count = 0;
  static  unsigned long long aesl_llvm_cbe_1543_count = 0;
  static  unsigned long long aesl_llvm_cbe_1544_count = 0;
  static  unsigned long long aesl_llvm_cbe_1545_count = 0;
  static  unsigned long long aesl_llvm_cbe_1546_count = 0;
  static  unsigned long long aesl_llvm_cbe_1547_count = 0;
  static  unsigned long long aesl_llvm_cbe_1548_count = 0;
  static  unsigned long long aesl_llvm_cbe_1549_count = 0;
  unsigned long long llvm_cbe_tmp__395;
  static  unsigned long long aesl_llvm_cbe_1550_count = 0;
  unsigned long long llvm_cbe_tmp__396;
  static  unsigned long long aesl_llvm_cbe_1551_count = 0;
  unsigned long long llvm_cbe_tmp__397;
  static  unsigned long long aesl_llvm_cbe_1552_count = 0;
  static  unsigned long long aesl_llvm_cbe_1553_count = 0;
  static  unsigned long long aesl_llvm_cbe_1554_count = 0;
  static  unsigned long long aesl_llvm_cbe_1555_count = 0;
  static  unsigned long long aesl_llvm_cbe_1556_count = 0;
  static  unsigned long long aesl_llvm_cbe_1557_count = 0;
  static  unsigned long long aesl_llvm_cbe_1558_count = 0;
  static  unsigned long long aesl_llvm_cbe_1559_count = 0;
  static  unsigned long long aesl_llvm_cbe_1560_count = 0;
  static  unsigned long long aesl_llvm_cbe_1561_count = 0;
  static  unsigned long long aesl_llvm_cbe_1562_count = 0;
  static  unsigned long long aesl_llvm_cbe_1563_count = 0;
  static  unsigned long long aesl_llvm_cbe_1564_count = 0;
  static  unsigned long long aesl_llvm_cbe_1565_count = 0;
  unsigned long long llvm_cbe_tmp__398;
  static  unsigned long long aesl_llvm_cbe_1566_count = 0;
  unsigned long long llvm_cbe_tmp__399;
  static  unsigned long long aesl_llvm_cbe_1567_count = 0;
  unsigned long long llvm_cbe_tmp__400;
  static  unsigned long long aesl_llvm_cbe_1568_count = 0;
  static  unsigned long long aesl_llvm_cbe_1569_count = 0;
  static  unsigned long long aesl_llvm_cbe_1570_count = 0;
  static  unsigned long long aesl_llvm_cbe_1571_count = 0;
  static  unsigned long long aesl_llvm_cbe_1572_count = 0;
  static  unsigned long long aesl_llvm_cbe_1573_count = 0;
  static  unsigned long long aesl_llvm_cbe_1574_count = 0;
  static  unsigned long long aesl_llvm_cbe_1575_count = 0;
  static  unsigned long long aesl_llvm_cbe_1576_count = 0;
  static  unsigned long long aesl_llvm_cbe_1577_count = 0;
  static  unsigned long long aesl_llvm_cbe_1578_count = 0;
  unsigned long long llvm_cbe_tmp__401;
  static  unsigned long long aesl_llvm_cbe_1579_count = 0;
  static  unsigned long long aesl_llvm_cbe_1580_count = 0;
  static  unsigned long long aesl_llvm_cbe_1581_count = 0;
  static  unsigned long long aesl_llvm_cbe_1582_count = 0;
  static  unsigned long long aesl_llvm_cbe_1583_count = 0;
  static  unsigned long long aesl_llvm_cbe_1584_count = 0;
  unsigned long long llvm_cbe_tmp__402;
  static  unsigned long long aesl_llvm_cbe_1585_count = 0;
  static  unsigned long long aesl_llvm_cbe_1586_count = 0;
  static  unsigned long long aesl_llvm_cbe_1587_count = 0;
  static  unsigned long long aesl_llvm_cbe_1588_count = 0;
  static  unsigned long long aesl_llvm_cbe_1589_count = 0;
  static  unsigned long long aesl_llvm_cbe_1590_count = 0;
  static  unsigned long long aesl_llvm_cbe_1591_count = 0;
  static  unsigned long long aesl_llvm_cbe_1592_count = 0;
  unsigned int llvm_cbe_tmp__403;
  static  unsigned long long aesl_llvm_cbe_1593_count = 0;
  static  unsigned long long aesl_llvm_cbe_1594_count = 0;
  static  unsigned long long aesl_llvm_cbe_1595_count = 0;
  static  unsigned long long aesl_llvm_cbe_1596_count = 0;
  static  unsigned long long aesl_llvm_cbe_1597_count = 0;
  unsigned long long llvm_cbe_tmp__404;
  unsigned long long llvm_cbe_tmp__404__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1598_count = 0;
  unsigned int llvm_cbe_tmp__405;
  unsigned int llvm_cbe_tmp__405__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1599_count = 0;
  static  unsigned long long aesl_llvm_cbe_1600_count = 0;
  static  unsigned long long aesl_llvm_cbe_1601_count = 0;
  static  unsigned long long aesl_llvm_cbe_1602_count = 0;
  static  unsigned long long aesl_llvm_cbe_1603_count = 0;
  static  unsigned long long aesl_llvm_cbe_1604_count = 0;
  static  unsigned long long aesl_llvm_cbe_1605_count = 0;
  unsigned long long llvm_cbe_tmp__406;
  static  unsigned long long aesl_llvm_cbe_1606_count = 0;
  static  unsigned long long aesl_llvm_cbe_1607_count = 0;
  static  unsigned long long aesl_llvm_cbe_1608_count = 0;
  static  unsigned long long aesl_llvm_cbe_1609_count = 0;
  static  unsigned long long aesl_llvm_cbe_1610_count = 0;
  static  unsigned long long aesl_llvm_cbe_1611_count = 0;
  static  unsigned long long aesl_llvm_cbe_1612_count = 0;
  unsigned long long llvm_cbe_tmp__407;
  static  unsigned long long aesl_llvm_cbe_1613_count = 0;
  static  unsigned long long aesl_llvm_cbe_1614_count = 0;
  static  unsigned long long aesl_llvm_cbe_1615_count = 0;
  static  unsigned long long aesl_llvm_cbe_1616_count = 0;
  static  unsigned long long aesl_llvm_cbe_1617_count = 0;
  static  unsigned long long aesl_llvm_cbe_1618_count = 0;
  static  unsigned long long aesl_llvm_cbe_1619_count = 0;
  static  unsigned long long aesl_llvm_cbe_1620_count = 0;
  static  unsigned long long aesl_llvm_cbe_1621_count = 0;
  unsigned long long llvm_cbe_tmp__408;
  static  unsigned long long aesl_llvm_cbe_1622_count = 0;
  static  unsigned long long aesl_llvm_cbe_1623_count = 0;
  static  unsigned long long aesl_llvm_cbe_1624_count = 0;
  static  unsigned long long aesl_llvm_cbe_1625_count = 0;
  static  unsigned long long aesl_llvm_cbe_1626_count = 0;
  static  unsigned long long aesl_llvm_cbe_1627_count = 0;
  static  unsigned long long aesl_llvm_cbe_1628_count = 0;
  static  unsigned long long aesl_llvm_cbe_1629_count = 0;
  unsigned long long llvm_cbe_tmp__409;
  static  unsigned long long aesl_llvm_cbe_1630_count = 0;
  static  unsigned long long aesl_llvm_cbe_1631_count = 0;
  static  unsigned long long aesl_llvm_cbe_1632_count = 0;
  static  unsigned long long aesl_llvm_cbe_1633_count = 0;
  static  unsigned long long aesl_llvm_cbe_1634_count = 0;
  static  unsigned long long aesl_llvm_cbe_1635_count = 0;
  static  unsigned long long aesl_llvm_cbe_1636_count = 0;
  unsigned long long llvm_cbe_tmp__410;
  static  unsigned long long aesl_llvm_cbe_1637_count = 0;
  static  unsigned long long aesl_llvm_cbe_1638_count = 0;
  static  unsigned long long aesl_llvm_cbe_1639_count = 0;
  static  unsigned long long aesl_llvm_cbe_1640_count = 0;
  static  unsigned long long aesl_llvm_cbe_1641_count = 0;
  static  unsigned long long aesl_llvm_cbe_1642_count = 0;
  static  unsigned long long aesl_llvm_cbe_1643_count = 0;
  unsigned long long llvm_cbe_tmp__411;
  static  unsigned long long aesl_llvm_cbe_1644_count = 0;
  static  unsigned long long aesl_llvm_cbe_1645_count = 0;
  static  unsigned long long aesl_llvm_cbe_1646_count = 0;
  static  unsigned long long aesl_llvm_cbe_1647_count = 0;
  static  unsigned long long aesl_llvm_cbe_1648_count = 0;
  static  unsigned long long aesl_llvm_cbe_1649_count = 0;
  unsigned long long llvm_cbe_tmp__412;
  static  unsigned long long aesl_llvm_cbe_1650_count = 0;
  static  unsigned long long aesl_llvm_cbe_1651_count = 0;
  static  unsigned long long aesl_llvm_cbe_1652_count = 0;
  unsigned long long llvm_cbe_tmp__413;
  unsigned long long llvm_cbe_tmp__413__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1653_count = 0;
  unsigned long long llvm_cbe_tmp__414;
  unsigned long long llvm_cbe_tmp__414__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1654_count = 0;
  unsigned long long llvm_cbe_tmp__415;
  static  unsigned long long aesl_llvm_cbe_1655_count = 0;
  static  unsigned long long aesl_llvm_cbe_1656_count = 0;
  static  unsigned long long aesl_llvm_cbe_1657_count = 0;
  static  unsigned long long aesl_llvm_cbe_1658_count = 0;
  static  unsigned long long aesl_llvm_cbe_1659_count = 0;
  static  unsigned long long aesl_llvm_cbe_1660_count = 0;
  static  unsigned long long aesl_llvm_cbe_1661_count = 0;
  static  unsigned long long aesl_llvm_cbe_1662_count = 0;
  static  unsigned long long aesl_llvm_cbe_1663_count = 0;
  static  unsigned long long aesl_llvm_cbe_1664_count = 0;
  static  unsigned long long aesl_llvm_cbe_1665_count = 0;
  static  unsigned long long aesl_llvm_cbe_1666_count = 0;
  static  unsigned long long aesl_llvm_cbe_1667_count = 0;
  static  unsigned long long aesl_llvm_cbe_1668_count = 0;
  unsigned long long llvm_cbe_tmp__416;
  static  unsigned long long aesl_llvm_cbe_1669_count = 0;
  static  unsigned long long aesl_llvm_cbe_1670_count = 0;
  static  unsigned long long aesl_llvm_cbe_1671_count = 0;
  static  unsigned long long aesl_llvm_cbe_1672_count = 0;
  static  unsigned long long aesl_llvm_cbe_1673_count = 0;
  static  unsigned long long aesl_llvm_cbe_1674_count = 0;
  static  unsigned long long aesl_llvm_cbe_1675_count = 0;
  unsigned long long llvm_cbe_tmp__417;
  static  unsigned long long aesl_llvm_cbe_1676_count = 0;
  static  unsigned long long aesl_llvm_cbe_1677_count = 0;
  static  unsigned long long aesl_llvm_cbe_1678_count = 0;
  static  unsigned long long aesl_llvm_cbe_1679_count = 0;
  static  unsigned long long aesl_llvm_cbe_1680_count = 0;
  static  unsigned long long aesl_llvm_cbe_1681_count = 0;
  static  unsigned long long aesl_llvm_cbe_1682_count = 0;
  static  unsigned long long aesl_llvm_cbe_1683_count = 0;
  unsigned long long llvm_cbe_tmp__418;
  static  unsigned long long aesl_llvm_cbe_1684_count = 0;
  static  unsigned long long aesl_llvm_cbe_1685_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_lcssa_count = 0;
  unsigned long long llvm_cbe__2e_lcssa;
  unsigned long long llvm_cbe__2e_lcssa__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1686_count = 0;
  static  unsigned long long aesl_llvm_cbe_1687_count = 0;
  static  unsigned long long aesl_llvm_cbe_1688_count = 0;
  static  unsigned long long aesl_llvm_cbe_1689_count = 0;
  static  unsigned long long aesl_llvm_cbe_1690_count = 0;
  static  unsigned long long aesl_llvm_cbe_1691_count = 0;
  static  unsigned long long aesl_llvm_cbe_1692_count = 0;
  unsigned long long llvm_cbe_tmp__419;
  static  unsigned long long aesl_llvm_cbe_1693_count = 0;
  static  unsigned long long aesl_llvm_cbe_1694_count = 0;
  unsigned long long llvm_cbe_tmp__420;
  static  unsigned long long aesl_llvm_cbe_1695_count = 0;
  unsigned long long llvm_cbe_tmp__421;
  static  unsigned long long aesl_llvm_cbe_1696_count = 0;
  static  unsigned long long aesl_llvm_cbe_1697_count = 0;
  static  unsigned long long aesl_llvm_cbe_1698_count = 0;
  static  unsigned long long aesl_llvm_cbe_1699_count = 0;
  static  unsigned long long aesl_llvm_cbe_1700_count = 0;
  static  unsigned long long aesl_llvm_cbe_1701_count = 0;
  static  unsigned long long aesl_llvm_cbe_1702_count = 0;
  static  unsigned long long aesl_llvm_cbe_1703_count = 0;
  unsigned long long llvm_cbe_tmp__422;
  unsigned long long llvm_cbe_tmp__422__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1704_count = 0;
  unsigned long long llvm_cbe_tmp__423;
  static  unsigned long long aesl_llvm_cbe_1705_count = 0;
  static  unsigned long long aesl_llvm_cbe_1706_count = 0;
  unsigned long long llvm_cbe_tmp__424;
  unsigned long long llvm_cbe_tmp__424__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1707_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @float64_div\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = call i64 @extractFloat64Frac(i64 %%a), !dbg !17 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1394_count);
  llvm_cbe_tmp__373 = (unsigned long long )extractFloat64Frac(llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__373);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%1, i64* %%aSig, align 8, !dbg !17 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1401_count);
  *(&llvm_cbe_aSig) = llvm_cbe_tmp__373;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__373);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = call i32 @extractFloat64Exp(i64 %%a), !dbg !17 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1402_count);
  llvm_cbe_tmp__374 = (unsigned int )extractFloat64Exp(llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__374);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%2, i32* %%aExp, align 4, !dbg !17 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1409_count);
  *(&llvm_cbe_aExp) = llvm_cbe_tmp__374;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__374);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = call i32 @extractFloat64Sign(i64 %%a), !dbg !17 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1410_count);
  llvm_cbe_tmp__375 = (unsigned int )extractFloat64Sign(llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__375);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = call i64 @extractFloat64Frac(i64 %%b), !dbg !18 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1413_count);
  llvm_cbe_tmp__376 = (unsigned long long )extractFloat64Frac(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__376);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%4, i64* %%bSig, align 8, !dbg !18 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1420_count);
  *(&llvm_cbe_bSig) = llvm_cbe_tmp__376;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__376);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = call i32 @extractFloat64Exp(i64 %%b), !dbg !18 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1421_count);
  llvm_cbe_tmp__377 = (unsigned int )extractFloat64Exp(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__377);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%5, i32* %%bExp, align 4, !dbg !18 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1428_count);
  *(&llvm_cbe_bExp) = llvm_cbe_tmp__377;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__377);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = call i32 @extractFloat64Sign(i64 %%b), !dbg !18 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1429_count);
  llvm_cbe_tmp__378 = (unsigned int )extractFloat64Sign(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__378);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = xor i32 %%6, %%3, !dbg !20 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1432_count);
  llvm_cbe_tmp__379 = (unsigned int )llvm_cbe_tmp__378 ^ llvm_cbe_tmp__375;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__379);
  if (((llvm_cbe_tmp__374&4294967295U) == (2047u&4294967295U))) {
    goto llvm_cbe_tmp__425;
  } else {
    goto llvm_cbe_tmp__426;
  }

llvm_cbe_tmp__425:
  if (((llvm_cbe_tmp__373&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__427;
  } else {
    goto llvm_cbe_tmp__428;
  }

llvm_cbe_tmp__428:
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = call fastcc i64 @aesl_internal_propagateFloat64NaN(i64 %%a, i64 %%b), !dbg !17 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1449_count);
  llvm_cbe_tmp__380 = (unsigned long long )aesl_internal_propagateFloat64NaN(llvm_cbe_a, llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__380);
}
  llvm_cbe_tmp__424__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__380;   /* for PHI node */
  goto llvm_cbe_tmp__429;

llvm_cbe_tmp__427:
  if (((llvm_cbe_tmp__377&4294967295U) == (2047u&4294967295U))) {
    goto llvm_cbe_tmp__430;
  } else {
    goto llvm_cbe_tmp__431;
  }

llvm_cbe_tmp__430:
  if (((llvm_cbe_tmp__376&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__432;
  } else {
    goto llvm_cbe_tmp__433;
  }

llvm_cbe_tmp__433:
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = call fastcc i64 @aesl_internal_propagateFloat64NaN(i64 %%a, i64 %%b), !dbg !17 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1459_count);
  llvm_cbe_tmp__381 = (unsigned long long )aesl_internal_propagateFloat64NaN(llvm_cbe_a, llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__381);
}
  llvm_cbe_tmp__424__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__381;   /* for PHI node */
  goto llvm_cbe_tmp__429;

llvm_cbe_tmp__432:
if (AESL_DEBUG_TRACE)
printf("\n  call void @float_raise(i32 16), !dbg !22 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1461_count);
  float_raise(16u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",16u);
}
  llvm_cbe_tmp__424__PHI_TEMPORARY = (unsigned long long )9223372036854775807ull;   /* for PHI node */
  goto llvm_cbe_tmp__429;

llvm_cbe_tmp__431:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = call i64 @packFloat64(i32 %%7, i32 2047, i64 0), !dbg !20 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1463_count);
  llvm_cbe_tmp__382 = (unsigned long long )packFloat64(llvm_cbe_tmp__379, 2047u, 0ull);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__379);
printf("\nArgument  = 0x%X",2047u);
printf("\nArgument  = 0x%llX",0ull);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__382);
}
  llvm_cbe_tmp__424__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__382;   /* for PHI node */
  goto llvm_cbe_tmp__429;

llvm_cbe_tmp__426:
  if (((llvm_cbe_tmp__377&4294967295U) == (2047u&4294967295U))) {
    goto llvm_cbe_tmp__434;
  } else {
    goto llvm_cbe_tmp__435;
  }

llvm_cbe_tmp__434:
  if (((llvm_cbe_tmp__376&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__436;
  } else {
    goto llvm_cbe_tmp__437;
  }

llvm_cbe_tmp__437:
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = call fastcc i64 @aesl_internal_propagateFloat64NaN(i64 %%a, i64 %%b), !dbg !18 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1473_count);
  llvm_cbe_tmp__383 = (unsigned long long )aesl_internal_propagateFloat64NaN(llvm_cbe_a, llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__383);
}
  llvm_cbe_tmp__424__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__383;   /* for PHI node */
  goto llvm_cbe_tmp__429;

llvm_cbe_tmp__436:
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = call i64 @packFloat64(i32 %%7, i32 0, i64 0), !dbg !20 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1475_count);
  llvm_cbe_tmp__384 = (unsigned long long )packFloat64(llvm_cbe_tmp__379, 0u, 0ull);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__379);
printf("\nArgument  = 0x%X",0u);
printf("\nArgument  = 0x%llX",0ull);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__384);
}
  llvm_cbe_tmp__424__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__384;   /* for PHI node */
  goto llvm_cbe_tmp__429;

llvm_cbe_tmp__435:
  if (((llvm_cbe_tmp__377&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__438;
  } else {
    goto llvm_cbe_tmp__439;
  }

llvm_cbe_tmp__438:
  if (((llvm_cbe_tmp__376&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__440;
  } else {
    goto llvm_cbe_tmp__441;
  }

llvm_cbe_tmp__440:
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = sext i32 %%2 to i64, !dbg !22 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1486_count);
  llvm_cbe_tmp__385 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__374);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__385);
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = or i64 %%1, %%35, !dbg !22 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1490_count);
  llvm_cbe_tmp__386 = (unsigned long long )llvm_cbe_tmp__373 | llvm_cbe_tmp__385;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__386);
  if (((llvm_cbe_tmp__386&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__442;
  } else {
    goto llvm_cbe_tmp__443;
  }

llvm_cbe_tmp__442:
if (AESL_DEBUG_TRACE)
printf("\n  call void @float_raise(i32 16), !dbg !22 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1493_count);
  float_raise(16u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",16u);
}
  llvm_cbe_tmp__424__PHI_TEMPORARY = (unsigned long long )9223372036854775807ull;   /* for PHI node */
  goto llvm_cbe_tmp__429;

llvm_cbe_tmp__443:
if (AESL_DEBUG_TRACE)
printf("\n  call void @float_raise(i32 2), !dbg !23 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1495_count);
  float_raise(2u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",2u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = call i64 @packFloat64(i32 %%7, i32 2047, i64 0), !dbg !21 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1496_count);
  llvm_cbe_tmp__387 = (unsigned long long )packFloat64(llvm_cbe_tmp__379, 2047u, 0ull);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__379);
printf("\nArgument  = 0x%X",2047u);
printf("\nArgument  = 0x%llX",0ull);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__387);
}
  llvm_cbe_tmp__424__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__387;   /* for PHI node */
  goto llvm_cbe_tmp__429;

llvm_cbe_tmp__441:
if (AESL_DEBUG_TRACE)
printf("\n  call fastcc void @aesl_internal_normalizeFloat64Subnormal(i64 %%4, i32* %%bExp, i64* %%bSig), !dbg !23 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1499_count);
  aesl_internal_normalizeFloat64Subnormal(llvm_cbe_tmp__376, (signed int *)(&llvm_cbe_bExp), (signed long long *)(&llvm_cbe_bSig));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__376);
}
  goto llvm_cbe_tmp__439;

llvm_cbe_tmp__439:
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = load i32* %%aExp, align 4, !dbg !23 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1507_count);
  llvm_cbe_tmp__388 = (unsigned int )*(&llvm_cbe_aExp);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__388);
  if (((llvm_cbe_tmp__388&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__444;
  } else {
    goto llvm_cbe_tmp__445;
  }

llvm_cbe_tmp__444:
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = load i64* %%aSig, align 8, !dbg !23 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1516_count);
  llvm_cbe_tmp__389 = (unsigned long long )*(&llvm_cbe_aSig);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__389);
  if (((llvm_cbe_tmp__389&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__446;
  } else {
    goto llvm_cbe_tmp__447;
  }

llvm_cbe_tmp__446:
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = call i64 @packFloat64(i32 %%7, i32 0, i64 0), !dbg !21 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1519_count);
  llvm_cbe_tmp__390 = (unsigned long long )packFloat64(llvm_cbe_tmp__379, 0u, 0ull);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__379);
printf("\nArgument  = 0x%X",0u);
printf("\nArgument  = 0x%llX",0ull);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__390);
}
  llvm_cbe_tmp__424__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__390;   /* for PHI node */
  goto llvm_cbe_tmp__429;

llvm_cbe_tmp__447:
if (AESL_DEBUG_TRACE)
printf("\n  call fastcc void @aesl_internal_normalizeFloat64Subnormal(i64 %%46, i32* %%aExp, i64* %%aSig), !dbg !23 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1522_count);
  aesl_internal_normalizeFloat64Subnormal(llvm_cbe_tmp__389, (signed int *)(&llvm_cbe_aExp), (signed long long *)(&llvm_cbe_aSig));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__389);
}
  goto llvm_cbe_tmp__445;

llvm_cbe_tmp__445:
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = load i32* %%aExp, align 4, !dbg !23 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1530_count);
  llvm_cbe_tmp__391 = (unsigned int )*(&llvm_cbe_aExp);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__391);
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = load i32* %%bExp, align 4, !dbg !23 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1537_count);
  llvm_cbe_tmp__392 = (unsigned int )*(&llvm_cbe_bExp);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__392);
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = sub nsw i32 %%52, %%53, !dbg !23 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1538_count);
  llvm_cbe_tmp__393 = (unsigned int )((unsigned int )(llvm_cbe_tmp__391&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__392&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__393&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = add nsw i32 %%54, 1021, !dbg !23 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1539_count);
  llvm_cbe_tmp__394 = (unsigned int )((unsigned int )(llvm_cbe_tmp__393&4294967295ull)) + ((unsigned int )(1021u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__394&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = load i64* %%aSig, align 8, !dbg !24 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1549_count);
  llvm_cbe_tmp__395 = (unsigned long long )*(&llvm_cbe_aSig);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__395);
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = shl i64 %%56, 10, !dbg !24 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1550_count);
  llvm_cbe_tmp__396 = (unsigned long long )llvm_cbe_tmp__395 << 10ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__396);
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = or i64 %%57, 4611686018427387904, !dbg !24 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1551_count);
  llvm_cbe_tmp__397 = (unsigned long long )llvm_cbe_tmp__396 | 4611686018427387904ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__397);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%58, i64* %%aSig, align 8, !dbg !24 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1558_count);
  *(&llvm_cbe_aSig) = llvm_cbe_tmp__397;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__397);
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = load i64* %%bSig, align 8, !dbg !24 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1565_count);
  llvm_cbe_tmp__398 = (unsigned long long )*(&llvm_cbe_bSig);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__398);
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = shl i64 %%59, 11, !dbg !24 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1566_count);
  llvm_cbe_tmp__399 = (unsigned long long )llvm_cbe_tmp__398 << 11ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__399);
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = or i64 %%60, -9223372036854775808, !dbg !24 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1567_count);
  llvm_cbe_tmp__400 = (unsigned long long )llvm_cbe_tmp__399 | 9223372036854775808ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__400);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%61, i64* %%bSig, align 8, !dbg !24 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1574_count);
  *(&llvm_cbe_bSig) = llvm_cbe_tmp__400;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__400);
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = shl i64 %%58, 1, !dbg !24 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1578_count);
  llvm_cbe_tmp__401 = (unsigned long long )llvm_cbe_tmp__397 << 1ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__401);
  if ((((unsigned long long )llvm_cbe_tmp__400&18446744073709551615ULL) > ((unsigned long long )llvm_cbe_tmp__401&18446744073709551615ULL))) {
    llvm_cbe_tmp__404__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__397;   /* for PHI node */
    llvm_cbe_tmp__405__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__394;   /* for PHI node */
    goto llvm_cbe_tmp__448;
  } else {
    goto llvm_cbe_tmp__449;
  }

llvm_cbe_tmp__449:
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = lshr exact i64 %%58, 1, !dbg !24 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1584_count);
  llvm_cbe_tmp__402 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__397&18446744073709551615ull)) >> ((unsigned long long )(1ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__402&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%65, i64* %%aSig, align 8, !dbg !24 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1591_count);
  *(&llvm_cbe_aSig) = llvm_cbe_tmp__402;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__402);
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = add nsw i32 %%54, 1022, !dbg !23 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1592_count);
  llvm_cbe_tmp__403 = (unsigned int )((unsigned int )(llvm_cbe_tmp__393&4294967295ull)) + ((unsigned int )(1022u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__403&4294967295ull)));
  llvm_cbe_tmp__404__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__402;   /* for PHI node */
  llvm_cbe_tmp__405__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__403;   /* for PHI node */
  goto llvm_cbe_tmp__448;

llvm_cbe_tmp__448:
if (AESL_DEBUG_TRACE)
printf("\n  %%68 = phi i64 [ %%58, %%51 ], [ %%65, %%64  for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1597_count);
  llvm_cbe_tmp__404 = (unsigned long long )llvm_cbe_tmp__404__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__404);
printf("\n = 0x%llX",llvm_cbe_tmp__397);
printf("\n = 0x%llX",llvm_cbe_tmp__402);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = phi i32 [ %%55, %%51 ], [ %%66, %%64  for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1598_count);
  llvm_cbe_tmp__405 = (unsigned int )llvm_cbe_tmp__405__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__405);
printf("\n = 0x%X",llvm_cbe_tmp__394);
printf("\n = 0x%X",llvm_cbe_tmp__403);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = call fastcc i64 @aesl_internal_estimateDiv128To64(i64 %%68, i64 %%61), !dbg !24 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1605_count);
  llvm_cbe_tmp__406 = (unsigned long long )aesl_internal_estimateDiv128To64(llvm_cbe_tmp__404, llvm_cbe_tmp__400);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__404);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__400);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__406);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = and i64 %%70, 511, !dbg !24 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1612_count);
  llvm_cbe_tmp__407 = (unsigned long long )llvm_cbe_tmp__406 & 511ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__407);
  if ((((unsigned long long )llvm_cbe_tmp__407&18446744073709551615ULL) < ((unsigned long long )3ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__450;
  } else {
    llvm_cbe_tmp__422__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__406;   /* for PHI node */
    goto llvm_cbe_tmp__451;
  }

llvm_cbe_tmp__450:
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = load i64* %%bSig, align 8, !dbg !24 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1621_count);
  llvm_cbe_tmp__408 = (unsigned long long )*(&llvm_cbe_bSig);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__408);
if (AESL_DEBUG_TRACE)
printf("\n  call void @mul64To128(i64 %%74, i64 %%70, i64* %%term0, i64* %%term1), !dbg !24 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1622_count);
  mul64To128(llvm_cbe_tmp__408, llvm_cbe_tmp__406, (signed long long *)(&llvm_cbe_term0), (signed long long *)(&llvm_cbe_term1));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__408);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__406);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%75 = load i64* %%aSig, align 8, !dbg !25 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1629_count);
  llvm_cbe_tmp__409 = (unsigned long long )*(&llvm_cbe_aSig);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__409);
if (AESL_DEBUG_TRACE)
printf("\n  %%76 = load i64* %%term0, align 8, !dbg !25 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1636_count);
  llvm_cbe_tmp__410 = (unsigned long long )*(&llvm_cbe_term0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__410);
if (AESL_DEBUG_TRACE)
printf("\n  %%77 = load i64* %%term1, align 8, !dbg !25 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1643_count);
  llvm_cbe_tmp__411 = (unsigned long long )*(&llvm_cbe_term1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__411);
if (AESL_DEBUG_TRACE)
printf("\n  call void @sub128(i64 %%75, i64 0, i64 %%76, i64 %%77, i64* %%rem0, i64* %%rem1), !dbg !25 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1644_count);
  sub128(llvm_cbe_tmp__409, 0ull, llvm_cbe_tmp__410, llvm_cbe_tmp__411, (signed long long *)(&llvm_cbe_rem0), (signed long long *)(&llvm_cbe_rem1));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__409);
printf("\nArgument  = 0x%llX",0ull);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__410);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__411);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%78 = load i64* %%rem0, align 8, !dbg !25 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1649_count);
  llvm_cbe_tmp__412 = (unsigned long long )*(&llvm_cbe_rem0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__412);
  if ((((signed long long )llvm_cbe_tmp__412) < ((signed long long )0ull))) {
    llvm_cbe_tmp__413__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__412;   /* for PHI node */
    llvm_cbe_tmp__414__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__406;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    llvm_cbe__2e_lcssa__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__406;   /* for PHI node */
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%80 = phi i64 [ %%85, %%.lr.ph ], [ %%78, %%73  for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1652_count);
  llvm_cbe_tmp__413 = (unsigned long long )llvm_cbe_tmp__413__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__413);
printf("\n = 0x%llX",llvm_cbe_tmp__418);
printf("\n = 0x%llX",llvm_cbe_tmp__412);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%81 = phi i64 [ %%82, %%.lr.ph ], [ %%70, %%73  for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1653_count);
  llvm_cbe_tmp__414 = (unsigned long long )llvm_cbe_tmp__414__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__414);
printf("\n = 0x%llX",llvm_cbe_tmp__415);
printf("\n = 0x%llX",llvm_cbe_tmp__406);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%82 = add i64 %%81, -1, !dbg !25 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1654_count);
  llvm_cbe_tmp__415 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__414&18446744073709551615ull)) + ((unsigned long long )(18446744073709551615ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__415&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%83 = load i64* %%rem1, align 8, !dbg !25 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1668_count);
  llvm_cbe_tmp__416 = (unsigned long long )*(&llvm_cbe_rem1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__416);
if (AESL_DEBUG_TRACE)
printf("\n  %%84 = load i64* %%bSig, align 8, !dbg !25 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1675_count);
  llvm_cbe_tmp__417 = (unsigned long long )*(&llvm_cbe_bSig);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__417);
if (AESL_DEBUG_TRACE)
printf("\n  call void @add128(i64 %%80, i64 %%83, i64 0, i64 %%84, i64* %%rem0, i64* %%rem1), !dbg !25 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1676_count);
  add128(llvm_cbe_tmp__413, llvm_cbe_tmp__416, 0ull, llvm_cbe_tmp__417, (signed long long *)(&llvm_cbe_rem0), (signed long long *)(&llvm_cbe_rem1));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__413);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__416);
printf("\nArgument  = 0x%llX",0ull);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__417);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%85 = load i64* %%rem0, align 8, !dbg !25 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1683_count);
  llvm_cbe_tmp__418 = (unsigned long long )*(&llvm_cbe_rem0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__418);
  if ((((signed long long )llvm_cbe_tmp__418) < ((signed long long )0ull))) {
    llvm_cbe_tmp__413__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__418;   /* for PHI node */
    llvm_cbe_tmp__414__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__415;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    llvm_cbe__2e_lcssa__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__415;   /* for PHI node */
    goto llvm_cbe__2e__crit_edge;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
if (AESL_DEBUG_TRACE)
printf("\n  %%.lcssa = phi i64 [ %%70, %%73 ], [ %%82, %%.lr.ph  for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe__2e_lcssa_count);
  llvm_cbe__2e_lcssa = (unsigned long long )llvm_cbe__2e_lcssa__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.lcssa = 0x%llX",llvm_cbe__2e_lcssa);
printf("\n = 0x%llX",llvm_cbe_tmp__406);
printf("\n = 0x%llX",llvm_cbe_tmp__415);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%87 = load i64* %%rem1, align 8, !dbg !25 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1692_count);
  llvm_cbe_tmp__419 = (unsigned long long )*(&llvm_cbe_rem1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__419);
if (AESL_DEBUG_TRACE)
printf("\n  %%89 = zext i1 %%88 to i64, !dbg !25 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1694_count);
  llvm_cbe_tmp__420 = (unsigned long long )((unsigned long long )(bool )((llvm_cbe_tmp__419&18446744073709551615ULL) != (0ull&18446744073709551615ULL))&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__420);
if (AESL_DEBUG_TRACE)
printf("\n  %%90 = or i64 %%89, %%.lcssa, !dbg !25 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1695_count);
  llvm_cbe_tmp__421 = (unsigned long long )llvm_cbe_tmp__420 | llvm_cbe__2e_lcssa;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__421);
  llvm_cbe_tmp__422__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__421;   /* for PHI node */
  goto llvm_cbe_tmp__451;

llvm_cbe_tmp__451:
if (AESL_DEBUG_TRACE)
printf("\n  %%92 = phi i64 [ %%90, %%._crit_edge ], [ %%70, %%67  for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1703_count);
  llvm_cbe_tmp__422 = (unsigned long long )llvm_cbe_tmp__422__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__422);
printf("\n = 0x%llX",llvm_cbe_tmp__421);
printf("\n = 0x%llX",llvm_cbe_tmp__406);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%93 = call fastcc i64 @aesl_internal_roundAndPackFloat64(i32 %%7, i32 %%69, i64 %%92), !dbg !21 for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1704_count);
  llvm_cbe_tmp__423 = (unsigned long long )aesl_internal_roundAndPackFloat64(llvm_cbe_tmp__379, llvm_cbe_tmp__405, llvm_cbe_tmp__422);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__379);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__405);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__422);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__423);
}
  llvm_cbe_tmp__424__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__423;   /* for PHI node */
  goto llvm_cbe_tmp__429;

llvm_cbe_tmp__429:
if (AESL_DEBUG_TRACE)
printf("\n  %%95 = phi i64 [ %%93, %%91 ], [ %%49, %%48 ], [ %%40, %%39 ], [ 9223372036854775807, %%38 ], [ %%29, %%28 ], [ %%27, %%26 ], [ %%21, %%20 ], [ 9223372036854775807, %%19 ], [ %%18, %%17 ], [ %%12, %%11  for 0x%llxth hint within @float64_div  --> \n", ++aesl_llvm_cbe_1706_count);
  llvm_cbe_tmp__424 = (unsigned long long )llvm_cbe_tmp__424__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__424);
printf("\n = 0x%llX",llvm_cbe_tmp__423);
printf("\n = 0x%llX",llvm_cbe_tmp__390);
printf("\n = 0x%llX",llvm_cbe_tmp__387);
printf("\n = 0x%llX",9223372036854775807ull);
printf("\n = 0x%llX",llvm_cbe_tmp__384);
printf("\n = 0x%llX",llvm_cbe_tmp__383);
printf("\n = 0x%llX",llvm_cbe_tmp__382);
printf("\n = 0x%llX",9223372036854775807ull);
printf("\n = 0x%llX",llvm_cbe_tmp__381);
printf("\n = 0x%llX",llvm_cbe_tmp__380);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @float64_div}\n");
  return llvm_cbe_tmp__424;
}


static signed long long aesl_internal_estimateDiv128To64(signed long long llvm_cbe_a0, signed long long llvm_cbe_b) {
  static  unsigned long long aesl_llvm_cbe_rem0_count = 0;
  signed long long llvm_cbe_rem0;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_rem1_count = 0;
  signed long long llvm_cbe_rem1;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_term0_count = 0;
  signed long long llvm_cbe_term0;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_term1_count = 0;
  signed long long llvm_cbe_term1;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_1708_count = 0;
  static  unsigned long long aesl_llvm_cbe_1709_count = 0;
  static  unsigned long long aesl_llvm_cbe_1710_count = 0;
  static  unsigned long long aesl_llvm_cbe_1711_count = 0;
  static  unsigned long long aesl_llvm_cbe_1712_count = 0;
  static  unsigned long long aesl_llvm_cbe_1713_count = 0;
  static  unsigned long long aesl_llvm_cbe_1714_count = 0;
  static  unsigned long long aesl_llvm_cbe_1715_count = 0;
  static  unsigned long long aesl_llvm_cbe_1716_count = 0;
  static  unsigned long long aesl_llvm_cbe_1717_count = 0;
  static  unsigned long long aesl_llvm_cbe_1718_count = 0;
  static  unsigned long long aesl_llvm_cbe_1719_count = 0;
  static  unsigned long long aesl_llvm_cbe_1720_count = 0;
  static  unsigned long long aesl_llvm_cbe_1721_count = 0;
  static  unsigned long long aesl_llvm_cbe_1722_count = 0;
  static  unsigned long long aesl_llvm_cbe_1723_count = 0;
  static  unsigned long long aesl_llvm_cbe_1724_count = 0;
  static  unsigned long long aesl_llvm_cbe_1725_count = 0;
  static  unsigned long long aesl_llvm_cbe_1726_count = 0;
  unsigned long long llvm_cbe_tmp__452;
  static  unsigned long long aesl_llvm_cbe_1727_count = 0;
  static  unsigned long long aesl_llvm_cbe_1728_count = 0;
  static  unsigned long long aesl_llvm_cbe_1729_count = 0;
  static  unsigned long long aesl_llvm_cbe_1730_count = 0;
  static  unsigned long long aesl_llvm_cbe_1731_count = 0;
  static  unsigned long long aesl_llvm_cbe_1732_count = 0;
  static  unsigned long long aesl_llvm_cbe_1733_count = 0;
  unsigned long long llvm_cbe_tmp__453;
  static  unsigned long long aesl_llvm_cbe_1734_count = 0;
  static  unsigned long long aesl_llvm_cbe_1735_count = 0;
  static  unsigned long long aesl_llvm_cbe_1736_count = 0;
  unsigned long long llvm_cbe_tmp__454;
  static  unsigned long long aesl_llvm_cbe_1737_count = 0;
  unsigned long long llvm_cbe_tmp__455;
  static  unsigned long long aesl_llvm_cbe_1738_count = 0;
  static  unsigned long long aesl_llvm_cbe_1739_count = 0;
  unsigned long long llvm_cbe_tmp__456;
  unsigned long long llvm_cbe_tmp__456__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1740_count = 0;
  static  unsigned long long aesl_llvm_cbe_1741_count = 0;
  static  unsigned long long aesl_llvm_cbe_1742_count = 0;
  static  unsigned long long aesl_llvm_cbe_1743_count = 0;
  static  unsigned long long aesl_llvm_cbe_1744_count = 0;
  static  unsigned long long aesl_llvm_cbe_1745_count = 0;
  static  unsigned long long aesl_llvm_cbe_1746_count = 0;
  static  unsigned long long aesl_llvm_cbe_1747_count = 0;
  static  unsigned long long aesl_llvm_cbe_1748_count = 0;
  static  unsigned long long aesl_llvm_cbe_1749_count = 0;
  static  unsigned long long aesl_llvm_cbe_1750_count = 0;
  static  unsigned long long aesl_llvm_cbe_1751_count = 0;
  static  unsigned long long aesl_llvm_cbe_1752_count = 0;
  unsigned long long llvm_cbe_tmp__457;
  static  unsigned long long aesl_llvm_cbe_1753_count = 0;
  static  unsigned long long aesl_llvm_cbe_1754_count = 0;
  static  unsigned long long aesl_llvm_cbe_1755_count = 0;
  static  unsigned long long aesl_llvm_cbe_1756_count = 0;
  static  unsigned long long aesl_llvm_cbe_1757_count = 0;
  static  unsigned long long aesl_llvm_cbe_1758_count = 0;
  static  unsigned long long aesl_llvm_cbe_1759_count = 0;
  unsigned long long llvm_cbe_tmp__458;
  static  unsigned long long aesl_llvm_cbe_1760_count = 0;
  static  unsigned long long aesl_llvm_cbe_1761_count = 0;
  static  unsigned long long aesl_llvm_cbe_1762_count = 0;
  static  unsigned long long aesl_llvm_cbe_1763_count = 0;
  static  unsigned long long aesl_llvm_cbe_1764_count = 0;
  static  unsigned long long aesl_llvm_cbe_1765_count = 0;
  unsigned long long llvm_cbe_tmp__459;
  static  unsigned long long aesl_llvm_cbe_1766_count = 0;
  static  unsigned long long aesl_llvm_cbe_1767_count = 0;
  static  unsigned long long aesl_llvm_cbe_1768_count = 0;
  unsigned long long llvm_cbe_tmp__460;
  static  unsigned long long aesl_llvm_cbe_1769_count = 0;
  static  unsigned long long aesl_llvm_cbe_1770_count = 0;
  unsigned long long llvm_cbe_tmp__461;
  unsigned long long llvm_cbe_tmp__461__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1771_count = 0;
  unsigned long long llvm_cbe_tmp__462;
  unsigned long long llvm_cbe_tmp__462__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1772_count = 0;
  unsigned long long llvm_cbe_tmp__463;
  static  unsigned long long aesl_llvm_cbe_1773_count = 0;
  static  unsigned long long aesl_llvm_cbe_1774_count = 0;
  static  unsigned long long aesl_llvm_cbe_1775_count = 0;
  static  unsigned long long aesl_llvm_cbe_1776_count = 0;
  static  unsigned long long aesl_llvm_cbe_1777_count = 0;
  static  unsigned long long aesl_llvm_cbe_1778_count = 0;
  static  unsigned long long aesl_llvm_cbe_1779_count = 0;
  static  unsigned long long aesl_llvm_cbe_1780_count = 0;
  static  unsigned long long aesl_llvm_cbe_1781_count = 0;
  static  unsigned long long aesl_llvm_cbe_1782_count = 0;
  static  unsigned long long aesl_llvm_cbe_1783_count = 0;
  static  unsigned long long aesl_llvm_cbe_1784_count = 0;
  static  unsigned long long aesl_llvm_cbe_1785_count = 0;
  static  unsigned long long aesl_llvm_cbe_1786_count = 0;
  unsigned long long llvm_cbe_tmp__464;
  static  unsigned long long aesl_llvm_cbe_1787_count = 0;
  static  unsigned long long aesl_llvm_cbe_1788_count = 0;
  static  unsigned long long aesl_llvm_cbe_1789_count = 0;
  static  unsigned long long aesl_llvm_cbe_1790_count = 0;
  static  unsigned long long aesl_llvm_cbe_1791_count = 0;
  static  unsigned long long aesl_llvm_cbe_1792_count = 0;
  static  unsigned long long aesl_llvm_cbe_1793_count = 0;
  static  unsigned long long aesl_llvm_cbe_1794_count = 0;
  static  unsigned long long aesl_llvm_cbe_1795_count = 0;
  unsigned long long llvm_cbe_tmp__465;
  static  unsigned long long aesl_llvm_cbe_1796_count = 0;
  static  unsigned long long aesl_llvm_cbe_1797_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_lcssa1_count = 0;
  unsigned long long llvm_cbe__2e_lcssa1;
  unsigned long long llvm_cbe__2e_lcssa1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe__2e_lcssa_count = 0;
  unsigned long long llvm_cbe__2e_lcssa;
  unsigned long long llvm_cbe__2e_lcssa__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1798_count = 0;
  static  unsigned long long aesl_llvm_cbe_1799_count = 0;
  unsigned long long llvm_cbe_tmp__466;
  static  unsigned long long aesl_llvm_cbe_1800_count = 0;
  static  unsigned long long aesl_llvm_cbe_1801_count = 0;
  static  unsigned long long aesl_llvm_cbe_1802_count = 0;
  static  unsigned long long aesl_llvm_cbe_1803_count = 0;
  static  unsigned long long aesl_llvm_cbe_1804_count = 0;
  static  unsigned long long aesl_llvm_cbe_1805_count = 0;
  static  unsigned long long aesl_llvm_cbe_1806_count = 0;
  unsigned long long llvm_cbe_tmp__467;
  static  unsigned long long aesl_llvm_cbe_1807_count = 0;
  unsigned long long llvm_cbe_tmp__468;
  static  unsigned long long aesl_llvm_cbe_1808_count = 0;
  unsigned long long llvm_cbe_tmp__469;
  static  unsigned long long aesl_llvm_cbe_1809_count = 0;
  static  unsigned long long aesl_llvm_cbe_1810_count = 0;
  static  unsigned long long aesl_llvm_cbe_1811_count = 0;
  static  unsigned long long aesl_llvm_cbe_1812_count = 0;
  static  unsigned long long aesl_llvm_cbe_1813_count = 0;
  static  unsigned long long aesl_llvm_cbe_1814_count = 0;
  static  unsigned long long aesl_llvm_cbe_1815_count = 0;
  static  unsigned long long aesl_llvm_cbe_1816_count = 0;
  static  unsigned long long aesl_llvm_cbe_1817_count = 0;
  static  unsigned long long aesl_llvm_cbe_1818_count = 0;
  static  unsigned long long aesl_llvm_cbe_1819_count = 0;
  static  unsigned long long aesl_llvm_cbe_1820_count = 0;
  unsigned long long llvm_cbe_tmp__470;
  static  unsigned long long aesl_llvm_cbe_1821_count = 0;
  static  unsigned long long aesl_llvm_cbe_1822_count = 0;
  unsigned long long llvm_cbe_tmp__471;
  unsigned long long llvm_cbe_tmp__471__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1823_count = 0;
  unsigned long long llvm_cbe_tmp__472;
  static  unsigned long long aesl_llvm_cbe_1824_count = 0;
  static  unsigned long long aesl_llvm_cbe_1825_count = 0;
  static  unsigned long long aesl_llvm_cbe_1826_count = 0;
  static  unsigned long long aesl_llvm_cbe_1827_count = 0;
  static  unsigned long long aesl_llvm_cbe_1828_count = 0;
  static  unsigned long long aesl_llvm_cbe_1829_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
  unsigned long long llvm_cbe_storemerge;
  unsigned long long llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1830_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aesl_internal_estimateDiv128To64\n");
  if ((((unsigned long long )llvm_cbe_b&18446744073709551615ULL) > ((unsigned long long )llvm_cbe_a0&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__473;
  } else {
    llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned long long )18446744073709551615ull;   /* for PHI node */
    goto llvm_cbe_tmp__474;
  }

llvm_cbe_tmp__473:
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = lshr i64 %%b, 32, !dbg !18 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1726_count);
  llvm_cbe_tmp__452 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_b&18446744073709551615ull)) >> ((unsigned long long )(32ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__452&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = and i64 %%b, -4294967296, !dbg !17 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1733_count);
  llvm_cbe_tmp__453 = (unsigned long long )llvm_cbe_b & 18446744069414584320ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__453);
  if ((((unsigned long long )llvm_cbe_tmp__453&18446744073709551615ULL) > ((unsigned long long )llvm_cbe_a0&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__475;
  } else {
    llvm_cbe_tmp__456__PHI_TEMPORARY = (unsigned long long )18446744069414584320ull;   /* for PHI node */
    goto llvm_cbe_tmp__476;
  }

llvm_cbe_tmp__475:
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = udiv i64 %%a0, %%3, !dbg !17 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1736_count);
  llvm_cbe_tmp__454 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_a0&18446744073709551615ull)) / ((unsigned long long )(llvm_cbe_tmp__452&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__454&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = shl i64 %%7, 32, !dbg !17 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1737_count);
  llvm_cbe_tmp__455 = (unsigned long long )llvm_cbe_tmp__454 << 32ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__455);
  llvm_cbe_tmp__456__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__455;   /* for PHI node */
  goto llvm_cbe_tmp__476;

llvm_cbe_tmp__476:
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = phi i64 [ %%8, %%6 ], [ -4294967296, %%2 ], !dbg !17 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1739_count);
  llvm_cbe_tmp__456 = (unsigned long long )llvm_cbe_tmp__456__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__456);
printf("\n = 0x%llX",llvm_cbe_tmp__455);
printf("\n = 0x%llX",18446744069414584320ull);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @mul64To128(i64 %%b, i64 %%10, i64* %%term0, i64* %%term1), !dbg !18 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1745_count);
  mul64To128(llvm_cbe_b, llvm_cbe_tmp__456, (signed long long *)(&llvm_cbe_term0), (signed long long *)(&llvm_cbe_term1));
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__456);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = load i64* %%term0, align 8, !dbg !17 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1752_count);
  llvm_cbe_tmp__457 = (unsigned long long )*(&llvm_cbe_term0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__457);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = load i64* %%term1, align 8, !dbg !17 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1759_count);
  llvm_cbe_tmp__458 = (unsigned long long )*(&llvm_cbe_term1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__458);
if (AESL_DEBUG_TRACE)
printf("\n  call void @sub128(i64 %%a0, i64 0, i64 %%11, i64 %%12, i64* %%rem0, i64* %%rem1), !dbg !17 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1760_count);
  sub128(llvm_cbe_a0, 0ull, llvm_cbe_tmp__457, llvm_cbe_tmp__458, (signed long long *)(&llvm_cbe_rem0), (signed long long *)(&llvm_cbe_rem1));
if (AESL_DEBUG_TRACE) {
printf("\nArgument a0 = 0x%llX",llvm_cbe_a0);
printf("\nArgument  = 0x%llX",0ull);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__457);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__458);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i64* %%rem0, align 8, !dbg !19 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1765_count);
  llvm_cbe_tmp__459 = (unsigned long long )*(&llvm_cbe_rem0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__459);
  if ((((signed long long )llvm_cbe_tmp__459) < ((signed long long )0ull))) {
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    llvm_cbe__2e_lcssa1__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__459;   /* for PHI node */
    llvm_cbe__2e_lcssa__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__456;   /* for PHI node */
    goto llvm_cbe__2e__crit_edge;
  }

llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = shl i64 %%b, 32, !dbg !18 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1768_count);
  llvm_cbe_tmp__460 = (unsigned long long )llvm_cbe_b << 32ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__460);
  llvm_cbe_tmp__461__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__459;   /* for PHI node */
  llvm_cbe_tmp__462__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__456;   /* for PHI node */
  goto llvm_cbe_tmp__477;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__477:
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = phi i64 [ %%13, %%.lr.ph ], [ %%21, %%16  for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1770_count);
  llvm_cbe_tmp__461 = (unsigned long long )llvm_cbe_tmp__461__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__461);
printf("\n = 0x%llX",llvm_cbe_tmp__459);
printf("\n = 0x%llX",llvm_cbe_tmp__465);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = phi i64 [ %%10, %%.lr.ph ], [ %%19, %%16  for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1771_count);
  llvm_cbe_tmp__462 = (unsigned long long )llvm_cbe_tmp__462__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__462);
printf("\n = 0x%llX",llvm_cbe_tmp__456);
printf("\n = 0x%llX",llvm_cbe_tmp__463);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = add i64 %%18, -4294967296, !dbg !19 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1772_count);
  llvm_cbe_tmp__463 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__462&18446744073709551615ull)) + ((unsigned long long )(18446744069414584320ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__463&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = load i64* %%rem1, align 8, !dbg !19 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1786_count);
  llvm_cbe_tmp__464 = (unsigned long long )*(&llvm_cbe_rem1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__464);
if (AESL_DEBUG_TRACE)
printf("\n  call void @add128(i64 %%17, i64 %%20, i64 %%3, i64 %%15, i64* %%rem0, i64* %%rem1), !dbg !19 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1788_count);
  add128(llvm_cbe_tmp__461, llvm_cbe_tmp__464, llvm_cbe_tmp__452, llvm_cbe_tmp__460, (signed long long *)(&llvm_cbe_rem0), (signed long long *)(&llvm_cbe_rem1));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__461);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__464);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__452);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__460);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = load i64* %%rem0, align 8, !dbg !19 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1795_count);
  llvm_cbe_tmp__465 = (unsigned long long )*(&llvm_cbe_rem0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__465);
  if ((((signed long long )llvm_cbe_tmp__465) < ((signed long long )0ull))) {
    llvm_cbe_tmp__461__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__465;   /* for PHI node */
    llvm_cbe_tmp__462__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__463;   /* for PHI node */
    goto llvm_cbe_tmp__477;
  } else {
    llvm_cbe__2e_lcssa1__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__465;   /* for PHI node */
    llvm_cbe__2e_lcssa__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__463;   /* for PHI node */
    goto llvm_cbe__2e__crit_edge;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e__crit_edge:
if (AESL_DEBUG_TRACE)
printf("\n  %%.lcssa1 = phi i64 [ %%13, %%9 ], [ %%21, %%16  for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe__2e_lcssa1_count);
  llvm_cbe__2e_lcssa1 = (unsigned long long )llvm_cbe__2e_lcssa1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.lcssa1 = 0x%llX",llvm_cbe__2e_lcssa1);
printf("\n = 0x%llX",llvm_cbe_tmp__459);
printf("\n = 0x%llX",llvm_cbe_tmp__465);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.lcssa = phi i64 [ %%10, %%9 ], [ %%19, %%16  for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe__2e_lcssa_count);
  llvm_cbe__2e_lcssa = (unsigned long long )llvm_cbe__2e_lcssa__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.lcssa = 0x%llX",llvm_cbe__2e_lcssa);
printf("\n = 0x%llX",llvm_cbe_tmp__456);
printf("\n = 0x%llX",llvm_cbe_tmp__463);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = shl i64 %%.lcssa1, 32, !dbg !20 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1799_count);
  llvm_cbe_tmp__466 = (unsigned long long )llvm_cbe__2e_lcssa1 << 32ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__466);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = load i64* %%rem1, align 8, !dbg !20 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1806_count);
  llvm_cbe_tmp__467 = (unsigned long long )*(&llvm_cbe_rem1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__467);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = lshr i64 %%24, 32, !dbg !20 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1807_count);
  llvm_cbe_tmp__468 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__467&18446744073709551615ull)) >> ((unsigned long long )(32ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__468&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = or i64 %%25, %%23, !dbg !20 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1808_count);
  llvm_cbe_tmp__469 = (unsigned long long )llvm_cbe_tmp__468 | llvm_cbe_tmp__466;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__469);
if (AESL_DEBUG_TRACE)
printf("\n  store i64 %%26, i64* %%rem0, align 8, !dbg !20 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1815_count);
  *(&llvm_cbe_rem0) = llvm_cbe_tmp__469;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__469);
  if ((((unsigned long long )llvm_cbe_tmp__453&18446744073709551615ULL) > ((unsigned long long )llvm_cbe_tmp__469&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__478;
  } else {
    llvm_cbe_tmp__471__PHI_TEMPORARY = (unsigned long long )4294967295ull;   /* for PHI node */
    goto llvm_cbe_tmp__479;
  }

llvm_cbe_tmp__478:
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = udiv i64 %%26, %%3, !dbg !19 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1820_count);
  llvm_cbe_tmp__470 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__469&18446744073709551615ull)) / ((unsigned long long )(llvm_cbe_tmp__452&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__470&18446744073709551615ull)));
  llvm_cbe_tmp__471__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__470;   /* for PHI node */
  goto llvm_cbe_tmp__479;

llvm_cbe_tmp__479:
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = phi i64 [ %%29, %%28 ], [ 4294967295, %%._crit_edge ], !dbg !19 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1822_count);
  llvm_cbe_tmp__471 = (unsigned long long )llvm_cbe_tmp__471__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__471);
printf("\n = 0x%llX",llvm_cbe_tmp__470);
printf("\n = 0x%llX",4294967295ull);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = or i64 %%31, %%.lcssa, !dbg !19 for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_1823_count);
  llvm_cbe_tmp__472 = (unsigned long long )llvm_cbe_tmp__471 | llvm_cbe__2e_lcssa;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__472);
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__472;   /* for PHI node */
  goto llvm_cbe_tmp__474;

llvm_cbe_tmp__474:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i64 [ %%32, %%30 ], [ -1, %%0  for 0x%llxth hint within @aesl_internal_estimateDiv128To64  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = (unsigned long long )llvm_cbe_storemerge__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge = 0x%llX",llvm_cbe_storemerge);
printf("\n = 0x%llX",llvm_cbe_tmp__472);
printf("\n = 0x%llX",18446744073709551615ull);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aesl_internal_estimateDiv128To64}\n");
  return llvm_cbe_storemerge;
}


signed int float64_le(signed long long llvm_cbe_a, signed long long llvm_cbe_b) {
  static  unsigned long long aesl_llvm_cbe_1831_count = 0;
  static  unsigned long long aesl_llvm_cbe_1832_count = 0;
  static  unsigned long long aesl_llvm_cbe_1833_count = 0;
  static  unsigned long long aesl_llvm_cbe_1834_count = 0;
  static  unsigned long long aesl_llvm_cbe_1835_count = 0;
  static  unsigned long long aesl_llvm_cbe_1836_count = 0;
  static  unsigned long long aesl_llvm_cbe_1837_count = 0;
  static  unsigned long long aesl_llvm_cbe_1838_count = 0;
  static  unsigned long long aesl_llvm_cbe_1839_count = 0;
  static  unsigned long long aesl_llvm_cbe_1840_count = 0;
  static  unsigned long long aesl_llvm_cbe_1841_count = 0;
  static  unsigned long long aesl_llvm_cbe_1842_count = 0;
  static  unsigned long long aesl_llvm_cbe_1843_count = 0;
  static  unsigned long long aesl_llvm_cbe_1844_count = 0;
  static  unsigned long long aesl_llvm_cbe_1845_count = 0;
  unsigned int llvm_cbe_tmp__480;
  static  unsigned long long aesl_llvm_cbe_1846_count = 0;
  static  unsigned long long aesl_llvm_cbe_1847_count = 0;
  static  unsigned long long aesl_llvm_cbe_1848_count = 0;
  unsigned long long llvm_cbe_tmp__481;
  static  unsigned long long aesl_llvm_cbe_1849_count = 0;
  static  unsigned long long aesl_llvm_cbe_1850_count = 0;
  static  unsigned long long aesl_llvm_cbe_1851_count = 0;
  unsigned int llvm_cbe_tmp__482;
  static  unsigned long long aesl_llvm_cbe_1852_count = 0;
  static  unsigned long long aesl_llvm_cbe_1853_count = 0;
  static  unsigned long long aesl_llvm_cbe_1854_count = 0;
  unsigned long long llvm_cbe_tmp__483;
  static  unsigned long long aesl_llvm_cbe_1855_count = 0;
  static  unsigned long long aesl_llvm_cbe_1856_count = 0;
  static  unsigned long long aesl_llvm_cbe_1857_count = 0;
  static  unsigned long long aesl_llvm_cbe_1858_count = 0;
  static  unsigned long long aesl_llvm_cbe_1859_count = 0;
  unsigned int llvm_cbe_tmp__484;
  static  unsigned long long aesl_llvm_cbe_1860_count = 0;
  static  unsigned long long aesl_llvm_cbe_1861_count = 0;
  static  unsigned long long aesl_llvm_cbe_1862_count = 0;
  static  unsigned long long aesl_llvm_cbe_1863_count = 0;
  static  unsigned long long aesl_llvm_cbe_1864_count = 0;
  unsigned int llvm_cbe_tmp__485;
  static  unsigned long long aesl_llvm_cbe_1865_count = 0;
  static  unsigned long long aesl_llvm_cbe_1866_count = 0;
  static  unsigned long long aesl_llvm_cbe_1867_count = 0;
  static  unsigned long long aesl_llvm_cbe_1868_count = 0;
  static  unsigned long long aesl_llvm_cbe_1869_count = 0;
  static  unsigned long long aesl_llvm_cbe_1870_count = 0;
  static  unsigned long long aesl_llvm_cbe_1871_count = 0;
  unsigned long long llvm_cbe_tmp__486;
  static  unsigned long long aesl_llvm_cbe__2e_mask_count = 0;
  unsigned long long llvm_cbe__2e_mask;
  static  unsigned long long aesl_llvm_cbe_1872_count = 0;
  static  unsigned long long aesl_llvm_cbe_1873_count = 0;
  static  unsigned long long aesl_llvm_cbe_1874_count = 0;
  bool llvm_cbe_tmp__487;
  bool llvm_cbe_tmp__487__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1875_count = 0;
  unsigned int llvm_cbe_tmp__488;
  static  unsigned long long aesl_llvm_cbe_1876_count = 0;
  static  unsigned long long aesl_llvm_cbe_1877_count = 0;
  static  unsigned long long aesl_llvm_cbe_1878_count = 0;
  static  unsigned long long aesl_llvm_cbe_1879_count = 0;
  static  unsigned long long aesl_llvm_cbe_1880_count = 0;
  unsigned int llvm_cbe_tmp__489;
  static  unsigned long long aesl_llvm_cbe_1881_count = 0;
  static  unsigned long long aesl_llvm_cbe_1882_count = 0;
  static  unsigned long long aesl_llvm_cbe_1883_count = 0;
  bool llvm_cbe_tmp__490;
  bool llvm_cbe_tmp__490__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1884_count = 0;
  unsigned int llvm_cbe_tmp__491;
  static  unsigned long long aesl_llvm_cbe_1885_count = 0;
  static  unsigned long long aesl_llvm_cbe_1886_count = 0;
  unsigned int llvm_cbe_tmp__492;
  unsigned int llvm_cbe_tmp__492__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1887_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @float64_le\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call i32 @extractFloat64Exp(i64 %%a), !dbg !17 for 0x%llxth hint within @float64_le  --> \n", ++aesl_llvm_cbe_1845_count);
  llvm_cbe_tmp__480 = (unsigned int ) /*tail*/ extractFloat64Exp(llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__480);
}
  if (((llvm_cbe_tmp__480&4294967295U) == (2047u&4294967295U))) {
    goto llvm_cbe_tmp__493;
  } else {
    goto llvm_cbe_tmp__494;
  }

llvm_cbe_tmp__493:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = tail call i64 @extractFloat64Frac(i64 %%a), !dbg !17 for 0x%llxth hint within @float64_le  --> \n", ++aesl_llvm_cbe_1848_count);
  llvm_cbe_tmp__481 = (unsigned long long ) /*tail*/ extractFloat64Frac(llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__481);
}
  if (((llvm_cbe_tmp__481&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__494;
  } else {
    goto llvm_cbe_tmp__495;
  }

llvm_cbe_tmp__494:
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = tail call i32 @extractFloat64Exp(i64 %%b), !dbg !18 for 0x%llxth hint within @float64_le  --> \n", ++aesl_llvm_cbe_1851_count);
  llvm_cbe_tmp__482 = (unsigned int ) /*tail*/ extractFloat64Exp(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__482);
}
  if (((llvm_cbe_tmp__482&4294967295U) == (2047u&4294967295U))) {
    goto llvm_cbe_tmp__496;
  } else {
    goto llvm_cbe_tmp__497;
  }

llvm_cbe_tmp__496:
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = tail call i64 @extractFloat64Frac(i64 %%b), !dbg !18 for 0x%llxth hint within @float64_le  --> \n", ++aesl_llvm_cbe_1854_count);
  llvm_cbe_tmp__483 = (unsigned long long ) /*tail*/ extractFloat64Frac(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__483);
}
  if (((llvm_cbe_tmp__483&18446744073709551615ULL) == (0ull&18446744073709551615ULL))) {
    goto llvm_cbe_tmp__497;
  } else {
    goto llvm_cbe_tmp__495;
  }

llvm_cbe_tmp__495:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @float_raise(i32 16), !dbg !18 for 0x%llxth hint within @float64_le  --> \n", ++aesl_llvm_cbe_1857_count);
   /*tail*/ float_raise(16u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",16u);
}
  llvm_cbe_tmp__492__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__498;

llvm_cbe_tmp__497:
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = tail call i32 @extractFloat64Sign(i64 %%a), !dbg !17 for 0x%llxth hint within @float64_le  --> \n", ++aesl_llvm_cbe_1859_count);
  llvm_cbe_tmp__484 = (unsigned int ) /*tail*/ extractFloat64Sign(llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__484);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = tail call i32 @extractFloat64Sign(i64 %%b), !dbg !18 for 0x%llxth hint within @float64_le  --> \n", ++aesl_llvm_cbe_1864_count);
  llvm_cbe_tmp__485 = (unsigned int ) /*tail*/ extractFloat64Sign(llvm_cbe_b);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__485);
}
  if (((llvm_cbe_tmp__484&4294967295U) == (llvm_cbe_tmp__485&4294967295U))) {
    goto llvm_cbe_tmp__499;
  } else {
    goto llvm_cbe_tmp__500;
  }

llvm_cbe_tmp__500:
  if (((llvm_cbe_tmp__484&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__501;
  } else {
    llvm_cbe_tmp__487__PHI_TEMPORARY = (bool )1;   /* for PHI node */
    goto llvm_cbe_tmp__502;
  }

llvm_cbe_tmp__501:
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = or i64 %%b, %%a, !dbg !17 for 0x%llxth hint within @float64_le  --> \n", ++aesl_llvm_cbe_1871_count);
  llvm_cbe_tmp__486 = (unsigned long long )llvm_cbe_b | llvm_cbe_a;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__486);
if (AESL_DEBUG_TRACE)
printf("\n  %%.mask = and i64 %%20, 9223372036854775807, !dbg !17 for 0x%llxth hint within @float64_le  --> \n", ++aesl_llvm_cbe__2e_mask_count);
  llvm_cbe__2e_mask = (unsigned long long )llvm_cbe_tmp__486 & 9223372036854775807ull;
if (AESL_DEBUG_TRACE)
printf("\n.mask = 0x%llX\n", llvm_cbe__2e_mask);
  llvm_cbe_tmp__487__PHI_TEMPORARY = (bool )((llvm_cbe__2e_mask&18446744073709551615ULL) == (0ull&18446744073709551615ULL));   /* for PHI node */
  goto llvm_cbe_tmp__502;

llvm_cbe_tmp__502:
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = phi i1 [ true, %%17 ], [ %%21, %%19  for 0x%llxth hint within @float64_le  --> \n", ++aesl_llvm_cbe_1874_count);
  llvm_cbe_tmp__487 = (bool )((llvm_cbe_tmp__487__PHI_TEMPORARY)&1);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__487);
printf("\n = 0x%X",1);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = zext i1 %%23 to i32, !dbg !17 for 0x%llxth hint within @float64_le  --> \n", ++aesl_llvm_cbe_1875_count);
  llvm_cbe_tmp__488 = (unsigned int )((unsigned int )(bool )llvm_cbe_tmp__487&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__488);
  llvm_cbe_tmp__492__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__488;   /* for PHI node */
  goto llvm_cbe_tmp__498;

llvm_cbe_tmp__499:
  if (((llvm_cbe_a&18446744073709551615ULL) == (llvm_cbe_b&18446744073709551615ULL))) {
    llvm_cbe_tmp__490__PHI_TEMPORARY = (bool )1;   /* for PHI node */
    goto llvm_cbe_tmp__503;
  } else {
    goto llvm_cbe_tmp__504;
  }

llvm_cbe_tmp__504:
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = zext i1 %%28 to i32, !dbg !17 for 0x%llxth hint within @float64_le  --> \n", ++aesl_llvm_cbe_1880_count);
  llvm_cbe_tmp__489 = (unsigned int )((unsigned int )(bool )(((unsigned long long )llvm_cbe_a&18446744073709551615ULL) < ((unsigned long long )llvm_cbe_b&18446744073709551615ULL))&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__489);
  llvm_cbe_tmp__490__PHI_TEMPORARY = (bool )((llvm_cbe_tmp__484&4294967295U) != (llvm_cbe_tmp__489&4294967295U));   /* for PHI node */
  goto llvm_cbe_tmp__503;

llvm_cbe_tmp__503:
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = phi i1 [ true, %%25 ], [ %%30, %%27  for 0x%llxth hint within @float64_le  --> \n", ++aesl_llvm_cbe_1883_count);
  llvm_cbe_tmp__490 = (bool )((llvm_cbe_tmp__490__PHI_TEMPORARY)&1);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__490);
printf("\n = 0x%X",1);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = zext i1 %%32 to i32, !dbg !17 for 0x%llxth hint within @float64_le  --> \n", ++aesl_llvm_cbe_1884_count);
  llvm_cbe_tmp__491 = (unsigned int )((unsigned int )(bool )llvm_cbe_tmp__490&1U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__491);
  llvm_cbe_tmp__492__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__491;   /* for PHI node */
  goto llvm_cbe_tmp__498;

llvm_cbe_tmp__498:
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = phi i32 [ %%33, %%31 ], [ %%24, %%22 ], [ 0, %%12  for 0x%llxth hint within @float64_le  --> \n", ++aesl_llvm_cbe_1886_count);
  llvm_cbe_tmp__492 = (unsigned int )llvm_cbe_tmp__492__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__492);
printf("\n = 0x%X",llvm_cbe_tmp__491);
printf("\n = 0x%X",llvm_cbe_tmp__488);
printf("\n = 0x%X",0u);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @float64_le}\n");
  return llvm_cbe_tmp__492;
}


signed int float64_ge(signed long long llvm_cbe_a, signed long long llvm_cbe_b) {
  static  unsigned long long aesl_llvm_cbe_1888_count = 0;
  static  unsigned long long aesl_llvm_cbe_1889_count = 0;
  static  unsigned long long aesl_llvm_cbe_1890_count = 0;
  static  unsigned long long aesl_llvm_cbe_1891_count = 0;
  static  unsigned long long aesl_llvm_cbe_1892_count = 0;
  unsigned int llvm_cbe_tmp__505;
  static  unsigned long long aesl_llvm_cbe_1893_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @float64_ge\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call i32 @float64_le(i64 %%b, i64 %%a), !dbg !17 for 0x%llxth hint within @float64_ge  --> \n", ++aesl_llvm_cbe_1892_count);
  llvm_cbe_tmp__505 = (unsigned int ) /*tail*/ float64_le(llvm_cbe_b, llvm_cbe_a);
if (AESL_DEBUG_TRACE) {
printf("\nArgument b = 0x%llX",llvm_cbe_b);
printf("\nArgument a = 0x%llX",llvm_cbe_a);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__505);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @float64_ge}\n");
  return llvm_cbe_tmp__505;
}


signed long long float64_neg(signed long long llvm_cbe_x) {
  static  unsigned long long aesl_llvm_cbe_1894_count = 0;
  static  unsigned long long aesl_llvm_cbe_1895_count = 0;
  static  unsigned long long aesl_llvm_cbe_1896_count = 0;
  static  unsigned long long aesl_llvm_cbe_1897_count = 0;
  unsigned long long llvm_cbe_tmp__506;
  static  unsigned long long aesl_llvm_cbe_1898_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @float64_neg\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = xor i64 %%x, -9223372036854775808, !dbg !17 for 0x%llxth hint within @float64_neg  --> \n", ++aesl_llvm_cbe_1897_count);
  llvm_cbe_tmp__506 = (unsigned long long )llvm_cbe_x ^ 9223372036854775808ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__506);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @float64_neg}\n");
  return llvm_cbe_tmp__506;
}


static signed int aesl_internal_countLeadingZeros64(signed long long llvm_cbe_a) {
  static  unsigned long long aesl_llvm_cbe_1899_count = 0;
  static  unsigned long long aesl_llvm_cbe_1900_count = 0;
  static  unsigned long long aesl_llvm_cbe_1901_count = 0;
  static  unsigned long long aesl_llvm_cbe_1902_count = 0;
  static  unsigned long long aesl_llvm_cbe_1903_count = 0;
  static  unsigned long long aesl_llvm_cbe_1904_count = 0;
  static  unsigned long long aesl_llvm_cbe_1905_count = 0;
  static  unsigned long long aesl_llvm_cbe_1906_count = 0;
  static  unsigned long long aesl_llvm_cbe_1907_count = 0;
  static  unsigned long long aesl_llvm_cbe_1908_count = 0;
  unsigned long long llvm_cbe_tmp__507;
  static  unsigned long long aesl_llvm_cbe_1909_count = 0;
  static  unsigned long long aesl_llvm_cbe_1910_count = 0;
  static  unsigned long long aesl_llvm_cbe_1911_count = 0;
  static  unsigned long long aesl_llvm_cbe_1912_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned int llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe_a_2e__count = 0;
  unsigned long long llvm_cbe_a_2e_;
  static  unsigned long long aesl_llvm_cbe_1913_count = 0;
  unsigned int llvm_cbe_tmp__508;
  static  unsigned long long aesl_llvm_cbe_1914_count = 0;
  unsigned int llvm_cbe_tmp__509;
  static  unsigned long long aesl_llvm_cbe_1915_count = 0;
  unsigned int llvm_cbe_tmp__510;
  static  unsigned long long aesl_llvm_cbe_1916_count = 0;
  static  unsigned long long aesl_llvm_cbe_1917_count = 0;
  static  unsigned long long aesl_llvm_cbe_1918_count = 0;
  static  unsigned long long aesl_llvm_cbe_1919_count = 0;
  static  unsigned long long aesl_llvm_cbe_1920_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aesl_internal_countLeadingZeros64\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = lshr i64 %%a, 32, !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros64  --> \n", ++aesl_llvm_cbe_1908_count);
  llvm_cbe_tmp__507 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_a&18446744073709551615ull)) >> ((unsigned long long )(32ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__507&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%. = select i1 %%1, i32 32, i32 0, !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros64  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned int )(((((unsigned long long )llvm_cbe_a&18446744073709551615ULL) < ((unsigned long long )4294967296ull&18446744073709551615ULL))) ? ((unsigned int )32u) : ((unsigned int )0u));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", llvm_cbe__2e_);
if (AESL_DEBUG_TRACE)
printf("\n  %%a. = select i1 %%1, i64 %%a, i64 %%2, !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros64  --> \n", ++aesl_llvm_cbe_a_2e__count);
  llvm_cbe_a_2e_ = (unsigned long long )(((((unsigned long long )llvm_cbe_a&18446744073709551615ULL) < ((unsigned long long )4294967296ull&18446744073709551615ULL))) ? ((unsigned long long )llvm_cbe_a) : ((unsigned long long )llvm_cbe_tmp__507));
if (AESL_DEBUG_TRACE)
printf("\na. = 0x%llX\n", llvm_cbe_a_2e_);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = trunc i64 %%a. to i32, !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros64  --> \n", ++aesl_llvm_cbe_1913_count);
  llvm_cbe_tmp__508 = (unsigned int )((unsigned int )llvm_cbe_a_2e_&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__508);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = tail call fastcc i32 @aesl_internal_countLeadingZeros32(i32 %%3), !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros64  --> \n", ++aesl_llvm_cbe_1914_count);
  llvm_cbe_tmp__509 = (unsigned int ) /*tail*/ aesl_internal_countLeadingZeros32(llvm_cbe_tmp__508);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__508);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__509);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = add nsw i32 %%4, %%., !dbg !17 for 0x%llxth hint within @aesl_internal_countLeadingZeros64  --> \n", ++aesl_llvm_cbe_1915_count);
  llvm_cbe_tmp__510 = (unsigned int )((unsigned int )(llvm_cbe_tmp__509&4294967295ull)) + ((unsigned int )(llvm_cbe__2e_&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__510&4294967295ull)));
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aesl_internal_countLeadingZeros64}\n");
  return llvm_cbe_tmp__510;
}


static signed long long aesl_internal_normalizeRoundAndPackFloat64(signed int llvm_cbe_zSign, signed int llvm_cbe_zExp, signed long long llvm_cbe_zSig) {
  static  unsigned long long aesl_llvm_cbe_1921_count = 0;
  static  unsigned long long aesl_llvm_cbe_1922_count = 0;
  static  unsigned long long aesl_llvm_cbe_1923_count = 0;
  static  unsigned long long aesl_llvm_cbe_1924_count = 0;
  static  unsigned long long aesl_llvm_cbe_1925_count = 0;
  static  unsigned long long aesl_llvm_cbe_1926_count = 0;
  static  unsigned long long aesl_llvm_cbe_1927_count = 0;
  static  unsigned long long aesl_llvm_cbe_1928_count = 0;
  unsigned int llvm_cbe_tmp__511;
  static  unsigned long long aesl_llvm_cbe_1929_count = 0;
  unsigned int llvm_cbe_tmp__512;
  static  unsigned long long aesl_llvm_cbe_1930_count = 0;
  static  unsigned long long aesl_llvm_cbe_1931_count = 0;
  static  unsigned long long aesl_llvm_cbe_1932_count = 0;
  unsigned int llvm_cbe_tmp__513;
  static  unsigned long long aesl_llvm_cbe_1933_count = 0;
  static  unsigned long long aesl_llvm_cbe_1934_count = 0;
  unsigned long long llvm_cbe_tmp__514;
  static  unsigned long long aesl_llvm_cbe_1935_count = 0;
  unsigned long long llvm_cbe_tmp__515;
  static  unsigned long long aesl_llvm_cbe_1936_count = 0;
  unsigned long long llvm_cbe_tmp__516;
  static  unsigned long long aesl_llvm_cbe_1937_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aesl_internal_normalizeRoundAndPackFloat64\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call fastcc i32 @aesl_internal_countLeadingZeros64(i64 %%zSig), !dbg !17 for 0x%llxth hint within @aesl_internal_normalizeRoundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1928_count);
  llvm_cbe_tmp__511 = (unsigned int ) /*tail*/ aesl_internal_countLeadingZeros64(llvm_cbe_zSig);
if (AESL_DEBUG_TRACE) {
printf("\nArgument zSig = 0x%llX",llvm_cbe_zSig);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__511);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = add nsw i32 %%1, -1, !dbg !17 for 0x%llxth hint within @aesl_internal_normalizeRoundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1929_count);
  llvm_cbe_tmp__512 = (unsigned int )((unsigned int )(llvm_cbe_tmp__511&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__512&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = sub nsw i32 %%zExp, %%2, !dbg !17 for 0x%llxth hint within @aesl_internal_normalizeRoundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1932_count);
  llvm_cbe_tmp__513 = (unsigned int )((unsigned int )(llvm_cbe_zExp&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__512&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__513&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = zext i32 %%2 to i64, !dbg !17 for 0x%llxth hint within @aesl_internal_normalizeRoundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1934_count);
  llvm_cbe_tmp__514 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__512&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__514);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = shl i64 %%zSig, %%4, !dbg !17 for 0x%llxth hint within @aesl_internal_normalizeRoundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1935_count);
  llvm_cbe_tmp__515 = (unsigned long long )llvm_cbe_zSig << llvm_cbe_tmp__514;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__515);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = tail call fastcc i64 @aesl_internal_roundAndPackFloat64(i32 %%zSign, i32 %%3, i64 %%5), !dbg !17 for 0x%llxth hint within @aesl_internal_normalizeRoundAndPackFloat64  --> \n", ++aesl_llvm_cbe_1936_count);
  llvm_cbe_tmp__516 = (unsigned long long ) /*tail*/ aesl_internal_roundAndPackFloat64(llvm_cbe_zSign, llvm_cbe_tmp__513, llvm_cbe_tmp__515);
if (AESL_DEBUG_TRACE) {
printf("\nArgument zSign = 0x%X",llvm_cbe_zSign);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__513);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__515);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__516);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aesl_internal_normalizeRoundAndPackFloat64}\n");
  return llvm_cbe_tmp__516;
}

