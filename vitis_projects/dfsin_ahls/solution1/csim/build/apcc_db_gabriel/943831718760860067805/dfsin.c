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

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
signed long long float64_abs(signed long long llvm_cbe_x);
signed long long local_sin(signed long long llvm_cbe_rad);
signed long long float64_neg(signed long long );
signed long long float64_mul(signed long long , signed long long );
signed long long float64_div(signed long long , signed long long );
signed long long int32_to_float64(signed int );
signed long long float64_add(signed long long , signed long long );
signed int float64_ge(signed long long , signed long long );
double ullong_to_double(signed long long llvm_cbe_x);


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

signed long long float64_abs(signed long long llvm_cbe_x) {
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  unsigned long long llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_4_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @float64_abs\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = and i64 %%x, 9223372036854775807, !dbg !3 for 0x%llxth hint within @float64_abs  --> \n", ++aesl_llvm_cbe_3_count);
  llvm_cbe_tmp__1 = (unsigned long long )llvm_cbe_x & 9223372036854775807ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__1);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @float64_abs}\n");
  return llvm_cbe_tmp__1;
}


signed long long local_sin(signed long long llvm_cbe_rad) {
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
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  unsigned long long llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  unsigned long long llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  unsigned int llvm_cbe_tmp__4;
  unsigned int llvm_cbe_tmp__4__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  unsigned long long llvm_cbe_tmp__5;
  unsigned long long llvm_cbe_tmp__5__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  unsigned long long llvm_cbe_tmp__6;
  unsigned long long llvm_cbe_tmp__6__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  unsigned long long llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  unsigned int llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  unsigned int llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  unsigned int llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  unsigned long long llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  unsigned long long llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  unsigned long long llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  unsigned int llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  unsigned long long llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  unsigned int llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @local_sin\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call i64 @float64_mul(i64 %%rad, i64 %%rad) nounwind, !dbg !4 for 0x%llxth hint within @local_sin  --> \n", ++aesl_llvm_cbe_20_count);
  llvm_cbe_tmp__2 = (unsigned long long ) /*tail*/ float64_mul(llvm_cbe_rad, llvm_cbe_rad);
if (AESL_DEBUG_TRACE) {
printf("\nArgument rad = 0x%llX",llvm_cbe_rad);
printf("\nArgument rad = 0x%llX",llvm_cbe_rad);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__2);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = tail call i64 @float64_neg(i64 %%1) nounwind, !dbg !4 for 0x%llxth hint within @local_sin  --> \n", ++aesl_llvm_cbe_21_count);
  llvm_cbe_tmp__3 = (unsigned long long ) /*tail*/ float64_neg(llvm_cbe_tmp__2);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__2);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__3);
}
  llvm_cbe_tmp__4__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
  llvm_cbe_tmp__5__PHI_TEMPORARY = (unsigned long long )llvm_cbe_rad;   /* for PHI node */
  llvm_cbe_tmp__6__PHI_TEMPORARY = (unsigned long long )llvm_cbe_rad;   /* for PHI node */
  goto llvm_cbe_tmp__17;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__17:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = phi i32 [ %%14, %%3 ], [ 1, %%0 ], !dbg !3 for 0x%llxth hint within @local_sin  --> \n", ++aesl_llvm_cbe_25_count);
  llvm_cbe_tmp__4 = (unsigned int )llvm_cbe_tmp__4__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__4);
printf("\n = 0x%X",llvm_cbe_tmp__14);
printf("\n = 0x%X",1u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = phi i64 [ %%12, %%3 ], [ %%rad, %%0 ], !dbg !3 for 0x%llxth hint within @local_sin  --> \n", ++aesl_llvm_cbe_26_count);
  llvm_cbe_tmp__5 = (unsigned long long )llvm_cbe_tmp__5__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__5);
printf("\n = 0x%llX",llvm_cbe_tmp__12);
printf("\nrad = 0x%llX",llvm_cbe_rad);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = phi i64 [ %%13, %%3 ], [ %%rad, %%0 ], !dbg !3 for 0x%llxth hint within @local_sin  --> \n", ++aesl_llvm_cbe_27_count);
  llvm_cbe_tmp__6 = (unsigned long long )llvm_cbe_tmp__6__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__6);
printf("\n = 0x%llX",llvm_cbe_tmp__13);
printf("\nrad = 0x%llX",llvm_cbe_rad);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = tail call i64 @float64_mul(i64 %%5, i64 %%2) nounwind, !dbg !3 for 0x%llxth hint within @local_sin  --> \n", ++aesl_llvm_cbe_28_count);
  llvm_cbe_tmp__7 = (unsigned long long ) /*tail*/ float64_mul(llvm_cbe_tmp__5, llvm_cbe_tmp__3);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__5);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__3);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__7);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = shl nsw i32 %%4, 1, !dbg !4 for 0x%llxth hint within @local_sin  --> \n", ++aesl_llvm_cbe_29_count);
  llvm_cbe_tmp__8 = (unsigned int )llvm_cbe_tmp__4 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__8);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = or i32 %%8, 1, !dbg !4 for 0x%llxth hint within @local_sin  --> \n", ++aesl_llvm_cbe_30_count);
  llvm_cbe_tmp__9 = (unsigned int )llvm_cbe_tmp__8 | 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__9);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = mul nsw i32 %%9, %%8, !dbg !4 for 0x%llxth hint within @local_sin  --> \n", ++aesl_llvm_cbe_31_count);
  llvm_cbe_tmp__10 = (unsigned int )((unsigned int )(llvm_cbe_tmp__9&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__8&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__10&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = tail call i64 @int32_to_float64(i32 %%10) nounwind, !dbg !4 for 0x%llxth hint within @local_sin  --> \n", ++aesl_llvm_cbe_32_count);
  llvm_cbe_tmp__11 = (unsigned long long ) /*tail*/ int32_to_float64(llvm_cbe_tmp__10);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__10);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__11);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = tail call i64 @float64_div(i64 %%7, i64 %%11) nounwind, !dbg !4 for 0x%llxth hint within @local_sin  --> \n", ++aesl_llvm_cbe_33_count);
  llvm_cbe_tmp__12 = (unsigned long long ) /*tail*/ float64_div(llvm_cbe_tmp__7, llvm_cbe_tmp__11);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__7);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__11);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__12);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = tail call i64 @float64_add(i64 %%6, i64 %%12) nounwind, !dbg !3 for 0x%llxth hint within @local_sin  --> \n", ++aesl_llvm_cbe_38_count);
  llvm_cbe_tmp__13 = (unsigned long long ) /*tail*/ float64_add(llvm_cbe_tmp__6, llvm_cbe_tmp__12);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__6);
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__12);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__13);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = add nsw i32 %%4, 1, !dbg !4 for 0x%llxth hint within @local_sin  --> \n", ++aesl_llvm_cbe_42_count);
  llvm_cbe_tmp__14 = (unsigned int )((unsigned int )(llvm_cbe_tmp__4&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__14&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = tail call i64 @float64_abs(i64 %%12), !dbg !3 for 0x%llxth hint within @local_sin  --> \n", ++aesl_llvm_cbe_47_count);
  llvm_cbe_tmp__15 = (unsigned long long ) /*tail*/ float64_abs(llvm_cbe_tmp__12);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__12);
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__15);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = tail call i32 @float64_ge(i64 %%15, i64 4532020583610935537) nounwind, !dbg !3 for 0x%llxth hint within @local_sin  --> \n", ++aesl_llvm_cbe_48_count);
  llvm_cbe_tmp__16 = (unsigned int ) /*tail*/ float64_ge(llvm_cbe_tmp__15, 4532020583610935537ull);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__15);
printf("\nArgument  = 0x%llX",4532020583610935537ull);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__16);
}
  if (((llvm_cbe_tmp__16&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__18;
  } else {
    llvm_cbe_tmp__4__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__14;   /* for PHI node */
    llvm_cbe_tmp__5__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__12;   /* for PHI node */
    llvm_cbe_tmp__6__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__13;   /* for PHI node */
    goto llvm_cbe_tmp__17;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__18:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @local_sin}\n");
  return llvm_cbe_tmp__13;
}


double ullong_to_double(signed long long llvm_cbe_x) {
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  double llvm_cbe_tmp__19;
  llvmBitCastUnion llvm_cbe_tmp__19__BITCAST_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @ullong_to_double\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = bitcast i64 %%x to double, !dbg !3 for 0x%llxth hint within @ullong_to_double  --> \n", ++aesl_llvm_cbe_54_count);
  llvm_cbe_tmp__19 = (double )(llvm_cbe_tmp__19__BITCAST_TEMPORARY.Int64 = llvm_cbe_x, llvm_cbe_tmp__19__BITCAST_TEMPORARY.Double);
if (AESL_DEBUG_TRACE)
printf("\n = %lf,  0x%llx\n", llvm_cbe_tmp__19, *(long long*)(&llvm_cbe_tmp__19));
  if (AESL_DEBUG_TRACE)
      printf("\nEND @ullong_to_double}\n");
  return llvm_cbe_tmp__19;
}

