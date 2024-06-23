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
/* Structure forward decls */
typedef struct l_struct_OC__IO_FILE l_struct_OC__IO_FILE;
typedef struct l_struct_OC__IO_marker l_struct_OC__IO_marker;
typedef struct l_struct_OC__IO_codecvt l_struct_OC__IO_codecvt;
typedef struct l_struct_OC__IO_wide_data l_struct_OC__IO_wide_data;

/* Structure contents */
struct l_struct_OC__IO_FILE {
  unsigned int field0;
   char *field1;
   char *field2;
   char *field3;
   char *field4;
   char *field5;
   char *field6;
   char *field7;
   char *field8;
   char *field9;
   char *field10;
   char *field11;
  l_struct_OC__IO_marker *field12;
  l_struct_OC__IO_FILE *field13;
  unsigned int field14;
  unsigned int field15;
  unsigned long long field16;
  unsigned short field17;
  unsigned char field18;
   char field19[1];
   char *field20;
  unsigned long long field21;
  l_struct_OC__IO_codecvt *field22;
  l_struct_OC__IO_wide_data *field23;
  l_struct_OC__IO_FILE *field24;
   char *field25;
  unsigned long long field26;
  unsigned int field27;
   char field28[20];
};

struct l_struct_OC__IO_marker {
};

struct l_struct_OC__IO_codecvt {
};

struct l_struct_OC__IO_wide_data {
};


/* External Global Variable Declarations */

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
 char *removeExt( char *llvm_cbe_filename);
void populateInput(signed int *llvm_cbe_inputVector, signed int llvm_cbe_numElts,  char *llvm_cbe_fileName);
void populateOutput(signed int *llvm_cbe_outputVector, signed int llvm_cbe_numElts,  char *llvm_cbe_fileName);


/* Global Variable Definitions and Initialization */
static  char aesl_internal__OC_str1[3] = "%x";
static  char aesl_internal__OC_str4[4] = "%d\n";
static  char aesl_internal__OC_str[2] = "r";
static  char aesl_internal__OC_str2[2] = "w";
static  char aesl_internal__OC_str3[5] = "_raw";


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

 char *removeExt( char *llvm_cbe_filename) {
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  static  unsigned long long aesl_llvm_cbe_4_count = 0;
  static  unsigned long long aesl_llvm_cbe_5_count = 0;
  static  unsigned long long aesl_llvm_cbe_6_count = 0;
  static  unsigned long long aesl_llvm_cbe_7_count = 0;
  unsigned long long llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_8_count = 0;
  unsigned long long llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_9_count = 0;
   char *llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_10_count = 0;
  static  unsigned long long aesl_llvm_cbe_11_count = 0;
  static  unsigned long long aesl_llvm_cbe_12_count = 0;
  static  unsigned long long aesl_llvm_cbe_13_count = 0;
  static  unsigned long long aesl_llvm_cbe_14_count = 0;
  static  unsigned long long aesl_llvm_cbe_15_count = 0;
  static  unsigned long long aesl_llvm_cbe_16_count = 0;
  static  unsigned long long aesl_llvm_cbe_17_count = 0;
   char *llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
   char *llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
   char *llvm_cbe_tmp__6;
   char *llvm_cbe_tmp__6__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @removeExt\n");
  if (((llvm_cbe_filename) == ((( char *)/*NULL*/0)))) {
    llvm_cbe_tmp__6__PHI_TEMPORARY = ( char *)(( char *)/*NULL*/0);   /* for PHI node */
    goto llvm_cbe_tmp__7;
  } else {
    goto llvm_cbe_tmp__8;
  }

llvm_cbe_tmp__8:
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = tail call i64 @strlen(i8* %%filename) nounwind readonly, !dbg !10 for 0x%llxth hint within @removeExt  --> \n", ++aesl_llvm_cbe_7_count);
  llvm_cbe_tmp__1 = (unsigned long long ) /*tail*/ strlen(( char *)llvm_cbe_filename);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__1);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = add i64 %%3, 1, !dbg !10 for 0x%llxth hint within @removeExt  --> \n", ++aesl_llvm_cbe_8_count);
  llvm_cbe_tmp__2 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__1&18446744073709551615ull)) + ((unsigned long long )(1ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__2&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = tail call noalias i8* @malloc(i64 %%4) nounwind, !dbg !10 for 0x%llxth hint within @removeExt  --> \n", ++aesl_llvm_cbe_9_count);
  llvm_cbe_tmp__3 = ( char *) /*tail*/ ( char *)malloc(llvm_cbe_tmp__2);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__2);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__3);
}
  if (((llvm_cbe_tmp__3) == ((( char *)/*NULL*/0)))) {
    llvm_cbe_tmp__6__PHI_TEMPORARY = ( char *)(( char *)/*NULL*/0);   /* for PHI node */
    goto llvm_cbe_tmp__7;
  } else {
    goto llvm_cbe_tmp__9;
  }

llvm_cbe_tmp__9:
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = tail call i8* @strcpy(i8* %%5, i8* %%filename) nounwind, !dbg !10 for 0x%llxth hint within @removeExt  --> \n", ++aesl_llvm_cbe_17_count);
   /*tail*/ ( char *)strcpy(( char *)llvm_cbe_tmp__3, ( char *)llvm_cbe_filename);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__4);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = tail call i8* @strrchr(i8* %%5, i32 46) nounwind readonly, !dbg !10 for 0x%llxth hint within @removeExt  --> \n", ++aesl_llvm_cbe_18_count);
  llvm_cbe_tmp__5 = ( char *) /*tail*/ ( char *)strrchr(( char *)llvm_cbe_tmp__3, 46u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",46u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__5);
}
  if (((llvm_cbe_tmp__5) == ((( char *)/*NULL*/0)))) {
    goto llvm_cbe_tmp__10;
  } else {
    goto llvm_cbe_tmp__11;
  }

llvm_cbe_tmp__11:
if (AESL_DEBUG_TRACE)
printf("\n  store i8 0, i8* %%9, align 1, !dbg !10 for 0x%llxth hint within @removeExt  --> \n", ++aesl_llvm_cbe_24_count);
  *llvm_cbe_tmp__5 = ((unsigned char )0);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )0));
  goto llvm_cbe_tmp__10;

llvm_cbe_tmp__10:
  llvm_cbe_tmp__6__PHI_TEMPORARY = ( char *)llvm_cbe_tmp__3;   /* for PHI node */
  goto llvm_cbe_tmp__7;

llvm_cbe_tmp__7:
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = phi i8* [ %%5, %%12 ], [ null, %%0 ], [ null, %%2  for 0x%llxth hint within @removeExt  --> \n", ++aesl_llvm_cbe_27_count);
  llvm_cbe_tmp__6 = ( char *)llvm_cbe_tmp__6__PHI_TEMPORARY;
  if (AESL_DEBUG_TRACE)
      printf("\nEND @removeExt}\n");
  return llvm_cbe_tmp__6;
}


void populateInput(signed int *llvm_cbe_inputVector, signed int llvm_cbe_numElts,  char *llvm_cbe_fileName) {
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
  static  unsigned long long aesl_llvm_cbe_35_count = 0;
  l_struct_OC__IO_FILE *llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_36_count = 0;
  static  unsigned long long aesl_llvm_cbe_37_count = 0;
  static  unsigned long long aesl_llvm_cbe_38_count = 0;
  static  unsigned long long aesl_llvm_cbe_39_count = 0;
  static  unsigned long long aesl_llvm_cbe_40_count = 0;
  static  unsigned long long aesl_llvm_cbe_41_count = 0;
  static  unsigned long long aesl_llvm_cbe_42_count = 0;
  static  unsigned long long aesl_llvm_cbe_43_count = 0;
  static  unsigned long long aesl_llvm_cbe_44_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  unsigned long long llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  signed int *llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_47_count = 0;
  unsigned int llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_48_count = 0;
  unsigned int llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_49_count = 0;
  static  unsigned long long aesl_llvm_cbe_50_count = 0;
  static  unsigned long long aesl_llvm_cbe_51_count = 0;
  static  unsigned long long aesl_llvm_cbe_52_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_53_count = 0;
  static  unsigned long long aesl_llvm_cbe_54_count = 0;
  unsigned int llvm_cbe_tmp__17;
  static  unsigned long long aesl_llvm_cbe_55_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @populateInput\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call noalias %%struct._IO_FILE* @fopen(i8* %%fileName, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str, i64 0, i64 0)) nounwind, !dbg !10 for 0x%llxth hint within @populateInput  --> \n", ++aesl_llvm_cbe_35_count);
  llvm_cbe_tmp__12 = (l_struct_OC__IO_FILE *) /*tail*/ aesl_fopen(( char *)llvm_cbe_fileName, ( char *)((&aesl_internal__OC_str[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__12);
}
  if ((((signed int )llvm_cbe_numElts) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%6, %%.lr.ph ], [ 0, %%0  for 0x%llxth hint within @populateInput  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__16);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = sext i32 %%storemerge1 to i64, !dbg !9 for 0x%llxth hint within @populateInput  --> \n", ++aesl_llvm_cbe_45_count);
  llvm_cbe_tmp__13 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__13);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = getelementptr inbounds i32* %%inputVector, i64 %%3, !dbg !9 for 0x%llxth hint within @populateInput  --> \n", ++aesl_llvm_cbe_46_count);
  llvm_cbe_tmp__14 = (signed int *)(&llvm_cbe_inputVector[(((signed long long )llvm_cbe_tmp__13))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__13));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = tail call i32 (%%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%%struct._IO_FILE* %%1, i8* getelementptr inbounds ([3 x i8]* @aesl_internal_.str1, i64 0, i64 0), i32* %%4) nounwind, !dbg !9 for 0x%llxth hint within @populateInput  --> \n", ++aesl_llvm_cbe_47_count);
   /*tail*/ __isoc99_fscanf((l_struct_OC__IO_FILE *)llvm_cbe_tmp__12, ( char *)((&aesl_internal__OC_str1[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 3
#endif
])), (signed int *)llvm_cbe_tmp__14);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__15);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = add nsw i32 %%storemerge1, 1, !dbg !11 for 0x%llxth hint within @populateInput  --> \n", ++aesl_llvm_cbe_48_count);
  llvm_cbe_tmp__16 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__16&4294967295ull)));
  if (((llvm_cbe_tmp__16&4294967295U) == (llvm_cbe_numElts&4294967295U))) {
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__16;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = tail call i32 @fclose(%%struct._IO_FILE* %%1) nounwind, !dbg !11 for 0x%llxth hint within @populateInput  --> \n", ++aesl_llvm_cbe_54_count);
   /*tail*/ fclose((l_struct_OC__IO_FILE *)llvm_cbe_tmp__12);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__17);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @populateInput}\n");
  return;
}


void populateOutput(signed int *llvm_cbe_outputVector, signed int llvm_cbe_numElts,  char *llvm_cbe_fileName) {
  static  unsigned long long aesl_llvm_cbe_56_count = 0;
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  l_struct_OC__IO_FILE *llvm_cbe_tmp__18;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
   char *llvm_cbe_tmp__19;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
   char *llvm_cbe_tmp__20;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  unsigned long long llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  unsigned int llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  unsigned int llvm_cbe_tmp__23;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  unsigned long long llvm_cbe_tmp__24;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
   char *llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
   char *llvm_cbe_tmp__26;
  static  unsigned long long aesl_llvm_cbe_strlen_count = 0;
  unsigned long long llvm_cbe_strlen;
  static  unsigned long long aesl_llvm_cbe_endptr_count = 0;
   char *llvm_cbe_endptr;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
   char *llvm_cbe_tmp__27;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;
   char *llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
  l_struct_OC__IO_FILE *llvm_cbe_tmp__29;
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
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_102_count = 0;
  unsigned long long llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_103_count = 0;
  signed int *llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  unsigned int llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  unsigned int llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  unsigned int llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
  unsigned int llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  unsigned int llvm_cbe_tmp__36;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
  unsigned int llvm_cbe_tmp__37;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
  unsigned int llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @populateOutput\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call noalias %%struct._IO_FILE* @fopen(i8* %%fileName, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str2, i64 0, i64 0)) nounwind, !dbg !10 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_66_count);
  llvm_cbe_tmp__18 = (l_struct_OC__IO_FILE *) /*tail*/ aesl_fopen(( char *)llvm_cbe_fileName, ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__18);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = tail call i8* @removeExt(i8* %%fileName), !dbg !11 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_70_count);
  llvm_cbe_tmp__19 = ( char *) /*tail*/ ( char *)removeExt(( char *)llvm_cbe_fileName);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__19);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = tail call i8* @strrchr(i8* %%fileName, i32 46) nounwind readonly, !dbg !11 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_73_count);
  llvm_cbe_tmp__20 = ( char *) /*tail*/ ( char *)strrchr(( char *)llvm_cbe_fileName, 46u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",46u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__20);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = tail call i64 @strlen(i8* %%fileName) nounwind readonly, !dbg !11 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_76_count);
  llvm_cbe_tmp__21 = (unsigned long long ) /*tail*/ strlen(( char *)llvm_cbe_fileName);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%llX",llvm_cbe_tmp__21);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = trunc i64 %%4 to i32, !dbg !11 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_77_count);
  llvm_cbe_tmp__22 = (unsigned int )((unsigned int )llvm_cbe_tmp__21&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__22);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = add nsw i32 %%5, 5, !dbg !12 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_80_count);
  llvm_cbe_tmp__23 = (unsigned int )((unsigned int )(llvm_cbe_tmp__22&4294967295ull)) + ((unsigned int )(5u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__23&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = sext i32 %%6 to i64, !dbg !12 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_81_count);
  llvm_cbe_tmp__24 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__23);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = tail call noalias i8* @malloc(i64 %%7) nounwind, !dbg !12 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_82_count);
  llvm_cbe_tmp__25 = ( char *) /*tail*/ ( char *)malloc(llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",llvm_cbe_tmp__24);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__25);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = tail call i8* @strcpy(i8* %%8, i8* %%2) nounwind, !dbg !11 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_88_count);
   /*tail*/ ( char *)strcpy(( char *)llvm_cbe_tmp__25, ( char *)llvm_cbe_tmp__19);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__26);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%strlen = tail call i64 @strlen(i8* %%8), !dbg !12 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_strlen_count);
  llvm_cbe_strlen = (unsigned long long ) /*tail*/ strlen(( char *)llvm_cbe_tmp__25);
if (AESL_DEBUG_TRACE) {
printf("\nReturn strlen = 0x%llX",llvm_cbe_strlen);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%endptr = getelementptr i8* %%8, i64 %%strlen, !dbg !12 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_endptr_count);
  llvm_cbe_endptr = ( char *)(&llvm_cbe_tmp__25[(((signed long long )llvm_cbe_strlen))]);
if (AESL_DEBUG_TRACE) {
printf("\nstrlen = 0x%llX",((signed long long )llvm_cbe_strlen));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = call i8* @memcpy(i8* %%endptr, i8* getelementptr inbounds ([5 x i8]* @aesl_internal_.str3, i64 0, i64 0), i64 5 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_89_count);
  ( char *)memcpy(( char *)llvm_cbe_endptr, ( char *)((&aesl_internal__OC_str3[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 5
#endif
])), 5ull);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%llX",5ull);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__27);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = tail call i8* @strcat(i8* %%8, i8* %%3) nounwind, !dbg !11 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_90_count);
   /*tail*/ ( char *)strcat(( char *)llvm_cbe_tmp__25, ( char *)llvm_cbe_tmp__20);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__28);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = tail call noalias %%struct._IO_FILE* @fopen(i8* %%8, i8* getelementptr inbounds ([2 x i8]* @aesl_internal_.str2, i64 0, i64 0)) nounwind, !dbg !12 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_91_count);
  llvm_cbe_tmp__29 = (l_struct_OC__IO_FILE *) /*tail*/ aesl_fopen(( char *)llvm_cbe_tmp__25, ( char *)((&aesl_internal__OC_str2[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__29);
}
  if ((((signed int )llvm_cbe_numElts) > ((signed int )0u))) {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%20, %%.lr.ph ], [ 0, %%0  for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__36);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = sext i32 %%storemerge1 to i64, !dbg !9 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_102_count);
  llvm_cbe_tmp__30 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__30);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = getelementptr inbounds i32* %%outputVector, i64 %%14, !dbg !9 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_103_count);
  llvm_cbe_tmp__31 = (signed int *)(&llvm_cbe_outputVector[(((signed long long )llvm_cbe_tmp__30))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__30));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = load i32* %%15, align 4, !dbg !9 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_104_count);
  llvm_cbe_tmp__32 = (unsigned int )*llvm_cbe_tmp__31;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__32);
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = tail call i32 (%%struct._IO_FILE*, i8*, ...)* @fprintf(%%struct._IO_FILE* %%1, i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str4, i64 0, i64 0), i32 %%16) nounwind, !dbg !9 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_105_count);
   /*tail*/ fprintf((l_struct_OC__IO_FILE *)llvm_cbe_tmp__18, ( char *)((&aesl_internal__OC_str4[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__32);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__32);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__33);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = load i32* %%15, align 4, !dbg !10 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_106_count);
  llvm_cbe_tmp__34 = (unsigned int )*llvm_cbe_tmp__31;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__34);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = tail call i32 (%%struct._IO_FILE*, i8*, ...)* @fprintf(%%struct._IO_FILE* %%12, i8* getelementptr inbounds ([4 x i8]* @aesl_internal_.str4, i64 0, i64 0), i32 %%18) nounwind, !dbg !10 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_107_count);
   /*tail*/ fprintf((l_struct_OC__IO_FILE *)llvm_cbe_tmp__29, ( char *)((&aesl_internal__OC_str4[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 4
#endif
])), llvm_cbe_tmp__34);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__34);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__35);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = add nsw i32 %%storemerge1, 1, !dbg !12 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_108_count);
  llvm_cbe_tmp__36 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__36&4294967295ull)));
  if (((llvm_cbe_tmp__36&4294967295U) == (llvm_cbe_numElts&4294967295U))) {
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__36;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = tail call i32 @fclose(%%struct._IO_FILE* %%1) nounwind, !dbg !11 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_115_count);
   /*tail*/ fclose((l_struct_OC__IO_FILE *)llvm_cbe_tmp__18);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__37);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = tail call i32 @fclose(%%struct._IO_FILE* %%12) nounwind, !dbg !12 for 0x%llxth hint within @populateOutput  --> \n", ++aesl_llvm_cbe_116_count);
   /*tail*/ fclose((l_struct_OC__IO_FILE *)llvm_cbe_tmp__29);
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__38);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @populateOutput}\n");
  return;
}

