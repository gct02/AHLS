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
extern signed int h[24];
extern signed int qq4_code4_table[16];
extern signed int qq6_code6_table[64];
extern signed int wl_code_table[16];
extern signed int ilb_table[32];
extern signed int decis_levl[30];
extern signed int quant26bt_pos[31];
extern signed int quant26bt_neg[31];
extern signed int qq2_code2_table[4];
extern signed int wh_code_table[4];
extern signed int tqmf[24];
extern unsigned int xl;
extern unsigned int xh;
extern signed int delay_bpl[6];
extern signed int delay_dltx[6];
extern unsigned int szl;
extern unsigned int rlt1;
extern unsigned int al1;
extern unsigned int rlt2;
extern unsigned int al2;
extern unsigned int spl;
extern unsigned int sl;
extern unsigned int el;
extern unsigned int detl;
extern unsigned int il;
extern unsigned int dlt;
extern unsigned int nbl;
extern unsigned int plt;
extern unsigned int plt1;
extern unsigned int plt2;
extern unsigned int rlt;
extern signed int delay_bph[6];
extern signed int delay_dhx[6];
extern unsigned int szh;
extern unsigned int rh1;
extern unsigned int ah1;
extern unsigned int rh2;
extern unsigned int ah2;
extern unsigned int sph;
extern unsigned int sh;
extern unsigned int eh;
extern unsigned int ih;
extern unsigned int deth;
extern unsigned int dh;
extern unsigned int nbh;
extern unsigned int ph;
extern unsigned int ph1;
extern unsigned int ph2;
extern unsigned int yh;
extern unsigned int ilr;
extern signed int dec_del_bpl[6];
extern signed int dec_del_dltx[6];
extern unsigned int dec_szl;
extern unsigned int dec_rlt1;
extern unsigned int dec_al1;
extern unsigned int dec_rlt2;
extern unsigned int dec_al2;
extern unsigned int dec_spl;
extern unsigned int dec_sl;
extern unsigned int dec_detl;
extern unsigned int dec_dlt;
extern unsigned int dl;
extern unsigned int rl;
extern unsigned int dec_nbl;
extern unsigned int dec_plt;
extern unsigned int dec_plt1;
extern unsigned int dec_plt2;
extern unsigned int dec_rlt;
extern signed int dec_del_bph[6];
extern signed int dec_del_dhx[6];
extern unsigned int dec_szh;
extern unsigned int dec_rh1;
extern unsigned int dec_ah1;
extern unsigned int dec_rh2;
extern unsigned int dec_ah2;
extern unsigned int dec_sph;
extern unsigned int dec_sh;
extern unsigned int dec_deth;
extern unsigned int dec_dh;
extern unsigned int dec_nbh;
extern unsigned int dec_ph;
extern unsigned int dec_ph1;
extern unsigned int dec_ph2;
extern unsigned int rh;
extern unsigned int xd;
extern unsigned int xs;
extern signed int accumc[11];
extern signed int accumd[11];
extern unsigned int xout1;
extern unsigned int xout2;

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
signed int abs(signed int llvm_cbe_n);
signed int encode(signed int llvm_cbe_xin1, signed int llvm_cbe_xin2);
signed int filtez(signed int *llvm_cbe_bpl, signed int *llvm_cbe_dlt);
signed int filtep(signed int llvm_cbe_rlt1, signed int llvm_cbe_al1, signed int llvm_cbe_rlt2, signed int llvm_cbe_al2);
signed int quantl(signed int llvm_cbe_el, signed int llvm_cbe_detl);
signed int logscl(signed int llvm_cbe_il, signed int llvm_cbe_nbl);
signed int scalel(signed int llvm_cbe_nbl, signed int llvm_cbe_shift_constant);
void upzero(signed int llvm_cbe_dlt, signed int *llvm_cbe_dlti, signed int *llvm_cbe_bli);
signed int uppol2(signed int llvm_cbe_al1, signed int llvm_cbe_al2, signed int llvm_cbe_plt, signed int llvm_cbe_plt1, signed int llvm_cbe_plt2);
signed int uppol1(signed int llvm_cbe_al1, signed int llvm_cbe_apl2, signed int llvm_cbe_plt, signed int llvm_cbe_plt1);
signed int logsch(signed int llvm_cbe_ih, signed int llvm_cbe_nbh);
void decode(signed int llvm_cbe_input);
void reset(void);
void adpcm_main(signed int *llvm_cbe_input_samples, signed int *llvm_cbe_compressed, signed int *llvm_cbe_result);
void adpcm_main_hw_stub(signed int *llvm_cbe_input_samples, signed int *llvm_cbe_compressed, signed int *llvm_cbe_result);
void apatb_adpcm_main_sw(signed int *llvm_cbe_input_samples, signed int *llvm_cbe_compressed, signed int *llvm_cbe_result);
void refine_signal_handler();
void apatb_adpcm_main_ir(signed int *, signed int *, signed int *);


/* Global Variable Definitions and Initialization */
signed int qq2_code2_table[4] = { 4294959888u, 4294965680u, 7408u, 1616u };
unsigned int ph __ATTRIBUTE_WEAK__;
unsigned int ph1 __ATTRIBUTE_WEAK__;
unsigned int ph2 __ATTRIBUTE_WEAK__;
unsigned int sph __ATTRIBUTE_WEAK__;
unsigned int sh __ATTRIBUTE_WEAK__;
unsigned int rlt1 __ATTRIBUTE_WEAK__;
unsigned int szh __ATTRIBUTE_WEAK__;
signed int qq4_code4_table[16] = { 0u, 4294946840u, 4294954400u, 4294958328u, 4294961008u, 4294963056u, 4294964712u, 4294966096u, 20456u, 12896u, 8968u, 6288u, 4240u, 2584u, 1200u, 0u };
unsigned int rh2 __ATTRIBUTE_WEAK__;
unsigned int ah2 __ATTRIBUTE_WEAK__;
unsigned int dec_dh __ATTRIBUTE_WEAK__;
unsigned int dec_nbh __ATTRIBUTE_WEAK__;
unsigned int dec_ph __ATTRIBUTE_WEAK__;
unsigned int dec_ph1 __ATTRIBUTE_WEAK__;
unsigned int dec_ph2 __ATTRIBUTE_WEAK__;
unsigned int rh __ATTRIBUTE_WEAK__;
unsigned int xd __ATTRIBUTE_WEAK__;
unsigned int xs __ATTRIBUTE_WEAK__;
signed int accumc[11] __ATTRIBUTE_WEAK__;
signed int accumd[11] __ATTRIBUTE_WEAK__;
unsigned int xout1 __ATTRIBUTE_WEAK__;
unsigned int xout2 __ATTRIBUTE_WEAK__;
signed int tqmf[24] __ATTRIBUTE_WEAK__;
signed int quant26bt_neg[31] = { 63u, 62u, 31u, 30u, 29u, 28u, 27u, 26u, 25u, 24u, 23u, 22u, 21u, 20u, 19u, 18u, 17u, 16u, 15u, 14u, 13u, 12u, 11u, 10u, 9u, 8u, 7u, 6u, 5u, 4u, 4u };
unsigned int deth __ATTRIBUTE_WEAK__;
unsigned int dh __ATTRIBUTE_WEAK__;
unsigned int nbh __ATTRIBUTE_WEAK__;
signed int quant26bt_pos[31] = { 61u, 60u, 59u, 58u, 57u, 56u, 55u, 54u, 53u, 52u, 51u, 50u, 49u, 48u, 47u, 46u, 45u, 44u, 43u, 42u, 41u, 40u, 39u, 38u, 37u, 36u, 35u, 34u, 33u, 32u, 32u };
signed int h[24] = { 12u, 4294967252u, 4294967252u, 212u, 48u, 4294966672u, 128u, 1448u, 4294966456u, 4294964076u, 3804u, 15504u, 15504u, 3804u, 4294964076u, 4294966456u, 1448u, 128u, 4294966672u, 48u, 212u, 4294967252u, 4294967252u, 12u };
unsigned int al1 __ATTRIBUTE_WEAK__;
unsigned int rlt2 __ATTRIBUTE_WEAK__;
unsigned int al2 __ATTRIBUTE_WEAK__;
unsigned int spl __ATTRIBUTE_WEAK__;
unsigned int sl __ATTRIBUTE_WEAK__;
unsigned int el __ATTRIBUTE_WEAK__;
unsigned int detl __ATTRIBUTE_WEAK__;
unsigned int il __ATTRIBUTE_WEAK__;
unsigned int dlt __ATTRIBUTE_WEAK__;
unsigned int nbl __ATTRIBUTE_WEAK__;
unsigned int plt __ATTRIBUTE_WEAK__;
unsigned int plt1 __ATTRIBUTE_WEAK__;
unsigned int plt2 __ATTRIBUTE_WEAK__;
unsigned int rlt __ATTRIBUTE_WEAK__;
signed int delay_bph[6] __ATTRIBUTE_WEAK__;
signed int delay_dhx[6] __ATTRIBUTE_WEAK__;
signed int dec_del_dhx[6] __ATTRIBUTE_WEAK__;
unsigned int dec_szh __ATTRIBUTE_WEAK__;
unsigned int dec_rh1 __ATTRIBUTE_WEAK__;
unsigned int dec_ah1 __ATTRIBUTE_WEAK__;
unsigned int dec_rh2 __ATTRIBUTE_WEAK__;
unsigned int dec_ah2 __ATTRIBUTE_WEAK__;
unsigned int dec_sph __ATTRIBUTE_WEAK__;
unsigned int dec_sh __ATTRIBUTE_WEAK__;
unsigned int dec_deth __ATTRIBUTE_WEAK__;
unsigned int yh __ATTRIBUTE_WEAK__;
unsigned int ilr __ATTRIBUTE_WEAK__;
signed int dec_del_bpl[6] __ATTRIBUTE_WEAK__;
signed int dec_del_dltx[6] __ATTRIBUTE_WEAK__;
unsigned int dec_szl __ATTRIBUTE_WEAK__;
unsigned int dec_rlt1 __ATTRIBUTE_WEAK__;
unsigned int dec_al1 __ATTRIBUTE_WEAK__;
unsigned int dec_rlt2 __ATTRIBUTE_WEAK__;
unsigned int dec_al2 __ATTRIBUTE_WEAK__;
unsigned int dec_spl __ATTRIBUTE_WEAK__;
unsigned int dec_sl __ATTRIBUTE_WEAK__;
unsigned int dec_detl __ATTRIBUTE_WEAK__;
unsigned int dec_dlt __ATTRIBUTE_WEAK__;
unsigned int dl __ATTRIBUTE_WEAK__;
unsigned int rl __ATTRIBUTE_WEAK__;
unsigned int dec_nbl __ATTRIBUTE_WEAK__;
unsigned int dec_plt __ATTRIBUTE_WEAK__;
unsigned int dec_plt1 __ATTRIBUTE_WEAK__;
unsigned int dec_plt2 __ATTRIBUTE_WEAK__;
unsigned int dec_rlt __ATTRIBUTE_WEAK__;
signed int dec_del_bph[6] __ATTRIBUTE_WEAK__;
unsigned int eh __ATTRIBUTE_WEAK__;
unsigned int ih __ATTRIBUTE_WEAK__;
signed int decis_levl[30] = { 280u, 576u, 880u, 1200u, 1520u, 1864u, 2208u, 2584u, 2960u, 3376u, 3784u, 4240u, 4696u, 5200u, 5712u, 6288u, 6864u, 7520u, 8184u, 8968u, 9752u, 10712u, 11664u, 12896u, 14120u, 15840u, 17560u, 20456u, 23352u, 32767u };
signed int qq6_code6_table[64] = { 4294967160u, 4294967160u, 4294967160u, 4294967160u, 4294942488u, 4294945392u, 4294948288u, 4294950592u, 4294952312u, 4294953784u, 4294955016u, 4294956104u, 4294957064u, 4294957936u, 4294958720u, 4294959440u, 4294960104u, 4294960720u, 4294961296u, 4294961840u, 4294962352u, 4294962832u, 4294963288u, 4294963720u, 4294964128u, 4294964520u, 4294964896u, 4294965264u, 4294965608u, 4294965936u, 4294966256u, 4294966568u, 24808u, 21904u, 19008u, 16704u, 14984u, 13512u, 12280u, 11192u, 10232u, 9360u, 8576u, 7856u, 7192u, 6576u, 6000u, 5456u, 4944u, 4464u, 4008u, 3576u, 3168u, 2776u, 2400u, 2032u, 1688u, 1360u, 1040u, 728u, 432u, 136u, 4294966864u, 4294967160u };
signed int wh_code_table[4] = { 798u, 4294967082u, 798u, 4294967082u };
signed int delay_dltx[6] __ATTRIBUTE_WEAK__;
unsigned int szl __ATTRIBUTE_WEAK__;
unsigned int xh __ATTRIBUTE_WEAK__;
signed int delay_bpl[6] __ATTRIBUTE_WEAK__;
unsigned int xl __ATTRIBUTE_WEAK__;
signed int ilb_table[32] = { 2048u, 2093u, 2139u, 2186u, 2233u, 2282u, 2332u, 2383u, 2435u, 2489u, 2543u, 2599u, 2656u, 2714u, 2774u, 2834u, 2896u, 2960u, 3025u, 3091u, 3158u, 3228u, 3298u, 3371u, 3444u, 3520u, 3597u, 3676u, 3756u, 3838u, 3922u, 4008u };
signed int wl_code_table[16] = { 4294967236u, 3042u, 1198u, 538u, 334u, 172u, 58u, 4294967266u, 3042u, 1198u, 538u, 334u, 172u, 58u, 4294967266u, 4294967236u };
unsigned int rh1 __ATTRIBUTE_WEAK__;
unsigned int ah1 __ATTRIBUTE_WEAK__;


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

signed int abs(signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_1_count = 0;
  static  unsigned long long aesl_llvm_cbe_2_count = 0;
  static  unsigned long long aesl_llvm_cbe_3_count = 0;
  static  unsigned long long aesl_llvm_cbe_4_count = 0;
  static  unsigned long long aesl_llvm_cbe_5_count = 0;
  static  unsigned long long aesl_llvm_cbe_6_count = 0;
  unsigned int llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_7_count = 0;
  static  unsigned long long aesl_llvm_cbe_n_2e__count = 0;
  unsigned int llvm_cbe_n_2e_;
  static  unsigned long long aesl_llvm_cbe_8_count = 0;
  static  unsigned long long aesl_llvm_cbe_9_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @abs\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sub nsw i32 0, %%n, !dbg !23 for 0x%llxth hint within @abs  --> \n", ++aesl_llvm_cbe_6_count);
  llvm_cbe_tmp__1 = (unsigned int )-(llvm_cbe_n);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__1&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%n. = select i1 %%1, i32 %%n, i32 %%2, !dbg !22 for 0x%llxth hint within @abs  --> \n", ++aesl_llvm_cbe_n_2e__count);
  llvm_cbe_n_2e_ = (unsigned int )(((((signed int )llvm_cbe_n) > ((signed int )4294967295u))) ? ((unsigned int )llvm_cbe_n) : ((unsigned int )llvm_cbe_tmp__1));
if (AESL_DEBUG_TRACE)
printf("\nn. = 0x%X\n", llvm_cbe_n_2e_);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @abs}\n");
  return llvm_cbe_n_2e_;
}


signed int encode(signed int llvm_cbe_xin1, signed int llvm_cbe_xin2) {
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
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  unsigned int llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  unsigned long long llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
  unsigned long long llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_28_count = 0;
  static  unsigned long long aesl_llvm_cbe_29_count = 0;
  static  unsigned long long aesl_llvm_cbe_30_count = 0;
  static  unsigned long long aesl_llvm_cbe_31_count = 0;
  static  unsigned long long aesl_llvm_cbe_32_count = 0;
  static  unsigned long long aesl_llvm_cbe_33_count = 0;
  static  unsigned long long aesl_llvm_cbe_34_count = 0;
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
  unsigned int llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_45_count = 0;
  unsigned long long llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_46_count = 0;
  unsigned long long llvm_cbe_tmp__7;
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
  static  unsigned long long aesl_llvm_cbe_57_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge8_count = 0;
  unsigned int llvm_cbe_storemerge8;
  unsigned int llvm_cbe_storemerge8__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe__2e_rec19_count = 0;
  unsigned long long llvm_cbe__2e_rec19;
  unsigned long long llvm_cbe__2e_rec19__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_58_count = 0;
  unsigned long long llvm_cbe_tmp__8;
  unsigned long long llvm_cbe_tmp__8__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_59_count = 0;
  unsigned long long llvm_cbe_tmp__9;
  unsigned long long llvm_cbe_tmp__9__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe__2e_sum_count = 0;
  unsigned long long llvm_cbe__2e_sum;
  static  unsigned long long aesl_llvm_cbe_60_count = 0;
  signed int *llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe__2e_sum24_count = 0;
  unsigned long long llvm_cbe__2e_sum24;
  static  unsigned long long aesl_llvm_cbe_61_count = 0;
  signed int *llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe__2e_sum25_count = 0;
  unsigned long long llvm_cbe__2e_sum25;
  static  unsigned long long aesl_llvm_cbe_62_count = 0;
  signed int *llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_63_count = 0;
  static  unsigned long long aesl_llvm_cbe_64_count = 0;
  static  unsigned long long aesl_llvm_cbe_65_count = 0;
  static  unsigned long long aesl_llvm_cbe_66_count = 0;
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  unsigned int llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  unsigned long long llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe__2e_sum26_count = 0;
  unsigned long long llvm_cbe__2e_sum26;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  signed int *llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  unsigned int llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  unsigned long long llvm_cbe_tmp__17;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  unsigned long long llvm_cbe_tmp__18;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
  unsigned long long llvm_cbe_tmp__19;
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;
  static  unsigned long long aesl_llvm_cbe_91_count = 0;
  static  unsigned long long aesl_llvm_cbe_92_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_rec20_count = 0;
  unsigned long long llvm_cbe__2e_rec20;
  static  unsigned long long aesl_llvm_cbe__2e_sum27_count = 0;
  unsigned long long llvm_cbe__2e_sum27;
  static  unsigned long long aesl_llvm_cbe_93_count = 0;
  signed int *llvm_cbe_tmp__20;
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
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  unsigned int llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  unsigned long long llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe__2e_sum28_count = 0;
  unsigned long long llvm_cbe__2e_sum28;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
  signed int *llvm_cbe_tmp__23;
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
  static  unsigned long long aesl_llvm_cbe_115_count = 0;
  unsigned int llvm_cbe_tmp__24;
  static  unsigned long long aesl_llvm_cbe_116_count = 0;
  unsigned long long llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_117_count = 0;
  unsigned long long llvm_cbe_tmp__26;
  static  unsigned long long aesl_llvm_cbe_118_count = 0;
  unsigned long long llvm_cbe_tmp__27;
  static  unsigned long long aesl_llvm_cbe_119_count = 0;
  static  unsigned long long aesl_llvm_cbe_120_count = 0;
  static  unsigned long long aesl_llvm_cbe_121_count = 0;
  static  unsigned long long aesl_llvm_cbe_122_count = 0;
  static  unsigned long long aesl_llvm_cbe_123_count = 0;
  static  unsigned long long aesl_llvm_cbe_124_count = 0;
  unsigned int llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_125_count = 0;
  static  unsigned long long aesl_llvm_cbe_126_count = 0;
  static  unsigned long long aesl_llvm_cbe_127_count = 0;
  static  unsigned long long aesl_llvm_cbe_128_count = 0;
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond23_count = 0;
  static  unsigned long long aesl_llvm_cbe_130_count = 0;
  static  unsigned long long aesl_llvm_cbe_131_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum29_count = 0;
  unsigned long long llvm_cbe__2e_sum29;
  static  unsigned long long aesl_llvm_cbe_132_count = 0;
  signed int *llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_133_count = 0;
  static  unsigned long long aesl_llvm_cbe_134_count = 0;
  static  unsigned long long aesl_llvm_cbe_135_count = 0;
  static  unsigned long long aesl_llvm_cbe_136_count = 0;
  static  unsigned long long aesl_llvm_cbe_137_count = 0;
  static  unsigned long long aesl_llvm_cbe_138_count = 0;
  static  unsigned long long aesl_llvm_cbe_139_count = 0;
  static  unsigned long long aesl_llvm_cbe_140_count = 0;
  static  unsigned long long aesl_llvm_cbe_141_count = 0;
  static  unsigned long long aesl_llvm_cbe_142_count = 0;
  static  unsigned long long aesl_llvm_cbe_143_count = 0;
  static  unsigned long long aesl_llvm_cbe_144_count = 0;
  unsigned int llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_145_count = 0;
  unsigned long long llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe__2e_sum30_count = 0;
  unsigned long long llvm_cbe__2e_sum30;
  static  unsigned long long aesl_llvm_cbe_146_count = 0;
  signed int *llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_147_count = 0;
  static  unsigned long long aesl_llvm_cbe_148_count = 0;
  static  unsigned long long aesl_llvm_cbe_149_count = 0;
  static  unsigned long long aesl_llvm_cbe_150_count = 0;
  static  unsigned long long aesl_llvm_cbe_151_count = 0;
  static  unsigned long long aesl_llvm_cbe_152_count = 0;
  static  unsigned long long aesl_llvm_cbe_153_count = 0;
  static  unsigned long long aesl_llvm_cbe_154_count = 0;
  unsigned int llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_155_count = 0;
  unsigned long long llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_156_count = 0;
  unsigned long long llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_157_count = 0;
  unsigned long long llvm_cbe_tmp__36;
  static  unsigned long long aesl_llvm_cbe_158_count = 0;
  static  unsigned long long aesl_llvm_cbe_159_count = 0;
  static  unsigned long long aesl_llvm_cbe_160_count = 0;
  static  unsigned long long aesl_llvm_cbe_161_count = 0;
  static  unsigned long long aesl_llvm_cbe_162_count = 0;
  static  unsigned long long aesl_llvm_cbe_163_count = 0;
  unsigned int llvm_cbe_tmp__37;
  static  unsigned long long aesl_llvm_cbe_164_count = 0;
  unsigned long long llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_165_count = 0;
  unsigned int llvm_cbe_tmp__39;
  static  unsigned long long aesl_llvm_cbe_166_count = 0;
  unsigned long long llvm_cbe_tmp__40;
  static  unsigned long long aesl_llvm_cbe_167_count = 0;
  unsigned long long llvm_cbe_tmp__41;
  static  unsigned long long aesl_llvm_cbe_168_count = 0;
  unsigned long long llvm_cbe_tmp__42;
  static  unsigned long long aesl_llvm_cbe_169_count = 0;
  static  unsigned long long aesl_llvm_cbe_170_count = 0;
  static  unsigned long long aesl_llvm_cbe_171_count = 0;
  static  unsigned long long aesl_llvm_cbe_172_count = 0;
  static  unsigned long long aesl_llvm_cbe_173_count = 0;
  static  unsigned long long aesl_llvm_cbe_174_count = 0;
  static  unsigned long long aesl_llvm_cbe_175_count = 0;
  static  unsigned long long aesl_llvm_cbe_176_count = 0;
  static  unsigned long long aesl_llvm_cbe_177_count = 0;
  static  unsigned long long aesl_llvm_cbe_178_count = 0;
  static  unsigned long long aesl_llvm_cbe_179_count = 0;
  static  unsigned long long aesl_llvm_cbe_180_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_rec_count = 0;
  unsigned long long llvm_cbe__2e_rec;
  unsigned long long llvm_cbe__2e_rec__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge13_count = 0;
  unsigned int llvm_cbe_storemerge13;
  unsigned int llvm_cbe_storemerge13__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe__2e_sum31_count = 0;
  unsigned long long llvm_cbe__2e_sum31;
  static  unsigned long long aesl_llvm_cbe_181_count = 0;
  signed int *llvm_cbe_tmp__43;
  static  unsigned long long aesl_llvm_cbe__2e_sum32_count = 0;
  unsigned long long llvm_cbe__2e_sum32;
  static  unsigned long long aesl_llvm_cbe_182_count = 0;
  signed int *llvm_cbe_tmp__44;
  static  unsigned long long aesl_llvm_cbe_183_count = 0;
  unsigned int llvm_cbe_tmp__45;
  static  unsigned long long aesl_llvm_cbe__2e_rec10_count = 0;
  unsigned long long llvm_cbe__2e_rec10;
  static  unsigned long long aesl_llvm_cbe__2e_sum33_count = 0;
  unsigned long long llvm_cbe__2e_sum33;
  static  unsigned long long aesl_llvm_cbe_184_count = 0;
  signed int *llvm_cbe_tmp__46;
  static  unsigned long long aesl_llvm_cbe_185_count = 0;
  static  unsigned long long aesl_llvm_cbe_186_count = 0;
  static  unsigned long long aesl_llvm_cbe_187_count = 0;
  static  unsigned long long aesl_llvm_cbe_188_count = 0;
  static  unsigned long long aesl_llvm_cbe_189_count = 0;
  static  unsigned long long aesl_llvm_cbe_190_count = 0;
  static  unsigned long long aesl_llvm_cbe_191_count = 0;
  static  unsigned long long aesl_llvm_cbe_192_count = 0;
  static  unsigned long long aesl_llvm_cbe_193_count = 0;
  static  unsigned long long aesl_llvm_cbe_194_count = 0;
  static  unsigned long long aesl_llvm_cbe_195_count = 0;
  static  unsigned long long aesl_llvm_cbe_196_count = 0;
  static  unsigned long long aesl_llvm_cbe_197_count = 0;
  unsigned int llvm_cbe_tmp__47;
  static  unsigned long long aesl_llvm_cbe_198_count = 0;
  static  unsigned long long aesl_llvm_cbe_199_count = 0;
  static  unsigned long long aesl_llvm_cbe_200_count = 0;
  static  unsigned long long aesl_llvm_cbe_201_count = 0;
  static  unsigned long long aesl_llvm_cbe_202_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_203_count = 0;
  static  unsigned long long aesl_llvm_cbe_204_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum34_count = 0;
  unsigned long long llvm_cbe__2e_sum34;
  static  unsigned long long aesl_llvm_cbe_205_count = 0;
  signed int *llvm_cbe_tmp__48;
  static  unsigned long long aesl_llvm_cbe_206_count = 0;
  static  unsigned long long aesl_llvm_cbe_207_count = 0;
  static  unsigned long long aesl_llvm_cbe_208_count = 0;
  static  unsigned long long aesl_llvm_cbe_209_count = 0;
  static  unsigned long long aesl_llvm_cbe_210_count = 0;
  static  unsigned long long aesl_llvm_cbe_211_count = 0;
  static  unsigned long long aesl_llvm_cbe_212_count = 0;
  static  unsigned long long aesl_llvm_cbe_213_count = 0;
  static  unsigned long long aesl_llvm_cbe_214_count = 0;
  static  unsigned long long aesl_llvm_cbe_215_count = 0;
  static  unsigned long long aesl_llvm_cbe_216_count = 0;
  static  unsigned long long aesl_llvm_cbe_217_count = 0;
  static  unsigned long long aesl_llvm_cbe_218_count = 0;
  static  unsigned long long aesl_llvm_cbe_219_count = 0;
  unsigned long long llvm_cbe_tmp__49;
  static  unsigned long long aesl_llvm_cbe_220_count = 0;
  unsigned long long llvm_cbe_tmp__50;
  static  unsigned long long aesl_llvm_cbe_221_count = 0;
  unsigned int llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_222_count = 0;
  static  unsigned long long aesl_llvm_cbe_223_count = 0;
  unsigned long long llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_224_count = 0;
  unsigned long long llvm_cbe_tmp__53;
  static  unsigned long long aesl_llvm_cbe_225_count = 0;
  unsigned int llvm_cbe_tmp__54;
  static  unsigned long long aesl_llvm_cbe_226_count = 0;
  static  unsigned long long aesl_llvm_cbe_227_count = 0;
  unsigned int llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_228_count = 0;
  static  unsigned long long aesl_llvm_cbe_229_count = 0;
  unsigned int llvm_cbe_tmp__56;
  static  unsigned long long aesl_llvm_cbe_230_count = 0;
  unsigned int llvm_cbe_tmp__57;
  static  unsigned long long aesl_llvm_cbe_231_count = 0;
  unsigned int llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_232_count = 0;
  unsigned int llvm_cbe_tmp__59;
  static  unsigned long long aesl_llvm_cbe_233_count = 0;
  unsigned int llvm_cbe_tmp__60;
  static  unsigned long long aesl_llvm_cbe_234_count = 0;
  static  unsigned long long aesl_llvm_cbe_235_count = 0;
  unsigned int llvm_cbe_tmp__61;
  static  unsigned long long aesl_llvm_cbe_236_count = 0;
  static  unsigned long long aesl_llvm_cbe_237_count = 0;
  unsigned int llvm_cbe_tmp__62;
  static  unsigned long long aesl_llvm_cbe_238_count = 0;
  static  unsigned long long aesl_llvm_cbe_239_count = 0;
  unsigned int llvm_cbe_tmp__63;
  static  unsigned long long aesl_llvm_cbe_240_count = 0;
  unsigned int llvm_cbe_tmp__64;
  static  unsigned long long aesl_llvm_cbe_241_count = 0;
  static  unsigned long long aesl_llvm_cbe_242_count = 0;
  unsigned long long llvm_cbe_tmp__65;
  static  unsigned long long aesl_llvm_cbe_243_count = 0;
  unsigned int llvm_cbe_tmp__66;
  static  unsigned long long aesl_llvm_cbe_244_count = 0;
  unsigned long long llvm_cbe_tmp__67;
  static  unsigned long long aesl_llvm_cbe_245_count = 0;
  signed int *llvm_cbe_tmp__68;
  static  unsigned long long aesl_llvm_cbe_246_count = 0;
  unsigned int llvm_cbe_tmp__69;
  static  unsigned long long aesl_llvm_cbe_247_count = 0;
  unsigned long long llvm_cbe_tmp__70;
  static  unsigned long long aesl_llvm_cbe_248_count = 0;
  unsigned long long llvm_cbe_tmp__71;
  static  unsigned long long aesl_llvm_cbe_249_count = 0;
  unsigned long long llvm_cbe_tmp__72;
  static  unsigned long long aesl_llvm_cbe_250_count = 0;
  unsigned int llvm_cbe_tmp__73;
  static  unsigned long long aesl_llvm_cbe_251_count = 0;
  static  unsigned long long aesl_llvm_cbe_252_count = 0;
  unsigned int llvm_cbe_tmp__74;
  static  unsigned long long aesl_llvm_cbe_253_count = 0;
  unsigned int llvm_cbe_tmp__75;
  static  unsigned long long aesl_llvm_cbe_254_count = 0;
  static  unsigned long long aesl_llvm_cbe_255_count = 0;
  unsigned int llvm_cbe_tmp__76;
  static  unsigned long long aesl_llvm_cbe_256_count = 0;
  static  unsigned long long aesl_llvm_cbe_257_count = 0;
  unsigned int llvm_cbe_tmp__77;
  static  unsigned long long aesl_llvm_cbe_258_count = 0;
  static  unsigned long long aesl_llvm_cbe_259_count = 0;
  static  unsigned long long aesl_llvm_cbe_260_count = 0;
  unsigned int llvm_cbe_tmp__78;
  static  unsigned long long aesl_llvm_cbe_261_count = 0;
  unsigned int llvm_cbe_tmp__79;
  static  unsigned long long aesl_llvm_cbe_262_count = 0;
  unsigned int llvm_cbe_tmp__80;
  static  unsigned long long aesl_llvm_cbe_263_count = 0;
  unsigned int llvm_cbe_tmp__81;
  static  unsigned long long aesl_llvm_cbe_264_count = 0;
  unsigned int llvm_cbe_tmp__82;
  static  unsigned long long aesl_llvm_cbe_265_count = 0;
  unsigned int llvm_cbe_tmp__83;
  static  unsigned long long aesl_llvm_cbe_266_count = 0;
  static  unsigned long long aesl_llvm_cbe_267_count = 0;
  unsigned int llvm_cbe_tmp__84;
  static  unsigned long long aesl_llvm_cbe_268_count = 0;
  static  unsigned long long aesl_llvm_cbe_269_count = 0;
  unsigned int llvm_cbe_tmp__85;
  static  unsigned long long aesl_llvm_cbe_270_count = 0;
  unsigned int llvm_cbe_tmp__86;
  static  unsigned long long aesl_llvm_cbe_271_count = 0;
  unsigned int llvm_cbe_tmp__87;
  static  unsigned long long aesl_llvm_cbe_272_count = 0;
  static  unsigned long long aesl_llvm_cbe_273_count = 0;
  unsigned int llvm_cbe_tmp__88;
  static  unsigned long long aesl_llvm_cbe_274_count = 0;
  static  unsigned long long aesl_llvm_cbe_275_count = 0;
  static  unsigned long long aesl_llvm_cbe_276_count = 0;
  static  unsigned long long aesl_llvm_cbe_277_count = 0;
  static  unsigned long long aesl_llvm_cbe_278_count = 0;
  unsigned int llvm_cbe_tmp__89;
  static  unsigned long long aesl_llvm_cbe_279_count = 0;
  static  unsigned long long aesl_llvm_cbe_280_count = 0;
  unsigned int llvm_cbe_tmp__90;
  static  unsigned long long aesl_llvm_cbe_281_count = 0;
  unsigned int llvm_cbe_tmp__91;
  static  unsigned long long aesl_llvm_cbe_282_count = 0;
  unsigned int llvm_cbe_tmp__92;
  static  unsigned long long aesl_llvm_cbe_283_count = 0;
  unsigned int llvm_cbe_tmp__93;
  static  unsigned long long aesl_llvm_cbe_284_count = 0;
  unsigned int llvm_cbe_tmp__94;
  static  unsigned long long aesl_llvm_cbe_285_count = 0;
  static  unsigned long long aesl_llvm_cbe_286_count = 0;
  unsigned int llvm_cbe_tmp__95;
  static  unsigned long long aesl_llvm_cbe_287_count = 0;
  static  unsigned long long aesl_llvm_cbe_288_count = 0;
  unsigned int llvm_cbe_tmp__96;
  static  unsigned long long aesl_llvm_cbe_289_count = 0;
  unsigned int llvm_cbe_tmp__97;
  static  unsigned long long aesl_llvm_cbe_290_count = 0;
  static  unsigned long long aesl_llvm_cbe_291_count = 0;
  unsigned int llvm_cbe_tmp__98;
  static  unsigned long long aesl_llvm_cbe_292_count = 0;
  unsigned int llvm_cbe_tmp__99;
  static  unsigned long long aesl_llvm_cbe_293_count = 0;
  unsigned int llvm_cbe_tmp__100;
  static  unsigned long long aesl_llvm_cbe_294_count = 0;
  static  unsigned long long aesl_llvm_cbe_295_count = 0;
  unsigned int llvm_cbe_tmp__101;
  static  unsigned long long aesl_llvm_cbe_296_count = 0;
  unsigned long long llvm_cbe_tmp__102;
  static  unsigned long long aesl_llvm_cbe_297_count = 0;
  unsigned long long llvm_cbe_tmp__103;
  static  unsigned long long aesl_llvm_cbe_298_count = 0;
  unsigned long long llvm_cbe_tmp__104;
  static  unsigned long long aesl_llvm_cbe_299_count = 0;
  unsigned int llvm_cbe_tmp__105;
  static  unsigned long long aesl_llvm_cbe_300_count = 0;
  static  unsigned long long aesl_llvm_cbe_301_count = 0;
  unsigned int llvm_cbe_tmp__106;
  static  unsigned long long aesl_llvm_cbe_302_count = 0;
  static  unsigned long long aesl_llvm_cbe_303_count = 0;
  static  unsigned long long aesl_llvm_cbe_304_count = 0;
  static  unsigned long long aesl_llvm_cbe_305_count = 0;
  unsigned int llvm_cbe_tmp__107;
  static  unsigned long long aesl_llvm_cbe_306_count = 0;
  static  unsigned long long aesl_llvm_cbe_307_count = 0;
  static  unsigned long long aesl_llvm_cbe_308_count = 0;
  unsigned int llvm_cbe_tmp__108;
  unsigned int llvm_cbe_tmp__108__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_309_count = 0;
  unsigned long long llvm_cbe_tmp__109;
  static  unsigned long long aesl_llvm_cbe_310_count = 0;
  signed int *llvm_cbe_tmp__110;
  static  unsigned long long aesl_llvm_cbe_311_count = 0;
  unsigned int llvm_cbe_tmp__111;
  static  unsigned long long aesl_llvm_cbe_312_count = 0;
  unsigned long long llvm_cbe_tmp__112;
  static  unsigned long long aesl_llvm_cbe_313_count = 0;
  unsigned long long llvm_cbe_tmp__113;
  static  unsigned long long aesl_llvm_cbe_314_count = 0;
  unsigned long long llvm_cbe_tmp__114;
  static  unsigned long long aesl_llvm_cbe_315_count = 0;
  unsigned int llvm_cbe_tmp__115;
  static  unsigned long long aesl_llvm_cbe_316_count = 0;
  static  unsigned long long aesl_llvm_cbe_317_count = 0;
  unsigned int llvm_cbe_tmp__116;
  static  unsigned long long aesl_llvm_cbe_318_count = 0;
  unsigned int llvm_cbe_tmp__117;
  static  unsigned long long aesl_llvm_cbe_319_count = 0;
  static  unsigned long long aesl_llvm_cbe_320_count = 0;
  unsigned int llvm_cbe_tmp__118;
  static  unsigned long long aesl_llvm_cbe_321_count = 0;
  static  unsigned long long aesl_llvm_cbe_322_count = 0;
  unsigned int llvm_cbe_tmp__119;
  static  unsigned long long aesl_llvm_cbe_323_count = 0;
  static  unsigned long long aesl_llvm_cbe_324_count = 0;
  static  unsigned long long aesl_llvm_cbe_325_count = 0;
  unsigned int llvm_cbe_tmp__120;
  static  unsigned long long aesl_llvm_cbe_326_count = 0;
  unsigned int llvm_cbe_tmp__121;
  static  unsigned long long aesl_llvm_cbe_327_count = 0;
  unsigned int llvm_cbe_tmp__122;
  static  unsigned long long aesl_llvm_cbe_328_count = 0;
  unsigned int llvm_cbe_tmp__123;
  static  unsigned long long aesl_llvm_cbe_329_count = 0;
  unsigned int llvm_cbe_tmp__124;
  static  unsigned long long aesl_llvm_cbe_330_count = 0;
  unsigned int llvm_cbe_tmp__125;
  static  unsigned long long aesl_llvm_cbe_331_count = 0;
  static  unsigned long long aesl_llvm_cbe_332_count = 0;
  unsigned int llvm_cbe_tmp__126;
  static  unsigned long long aesl_llvm_cbe_333_count = 0;
  static  unsigned long long aesl_llvm_cbe_334_count = 0;
  unsigned int llvm_cbe_tmp__127;
  static  unsigned long long aesl_llvm_cbe_335_count = 0;
  unsigned int llvm_cbe_tmp__128;
  static  unsigned long long aesl_llvm_cbe_336_count = 0;
  unsigned int llvm_cbe_tmp__129;
  static  unsigned long long aesl_llvm_cbe_337_count = 0;
  static  unsigned long long aesl_llvm_cbe_338_count = 0;
  unsigned int llvm_cbe_tmp__130;
  static  unsigned long long aesl_llvm_cbe_339_count = 0;
  static  unsigned long long aesl_llvm_cbe_340_count = 0;
  static  unsigned long long aesl_llvm_cbe_341_count = 0;
  static  unsigned long long aesl_llvm_cbe_342_count = 0;
  static  unsigned long long aesl_llvm_cbe_343_count = 0;
  unsigned int llvm_cbe_tmp__131;
  static  unsigned long long aesl_llvm_cbe_344_count = 0;
  unsigned int llvm_cbe_tmp__132;
  static  unsigned long long aesl_llvm_cbe_345_count = 0;
  unsigned int llvm_cbe_tmp__133;
  static  unsigned long long aesl_llvm_cbe_346_count = 0;
  unsigned int llvm_cbe_tmp__134;
  static  unsigned long long aesl_llvm_cbe_347_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @encode\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 0), align 16, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_25_count);
  llvm_cbe_tmp__2 = (unsigned int )*((&tqmf[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 24
#endif
]));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__2);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i32 %%1 to i64, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_26_count);
  llvm_cbe_tmp__3 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__3);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = mul nsw i64 %%2, 12, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_27_count);
  llvm_cbe_tmp__4 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__3&18446744073709551615ull)) * ((unsigned long long )(12ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__4&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 1), align 4, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_44_count);
  llvm_cbe_tmp__5 = (unsigned int )*((&tqmf[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 24
#endif
]));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__5);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i32 %%4 to i64, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_45_count);
  llvm_cbe_tmp__6 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__5);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__6);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = mul nsw i64 %%5, -44, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_46_count);
  llvm_cbe_tmp__7 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__6&18446744073709551615ull)) * ((unsigned long long )(18446744073709551572ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__7&18446744073709551615ull)));
  llvm_cbe_storemerge8__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  llvm_cbe__2e_rec19__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
  llvm_cbe_tmp__8__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__4;   /* for PHI node */
  llvm_cbe_tmp__9__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__7;   /* for PHI node */
  goto llvm_cbe_tmp__135;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__135:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge8 = phi i32 [ 0, %%0 ], [ %%28, %%7  for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_storemerge8_count);
  llvm_cbe_storemerge8 = (unsigned int )llvm_cbe_storemerge8__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge8 = 0x%X",llvm_cbe_storemerge8);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__28);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec19 = phi i64 [ 0, %%0 ], [ %%.rec20, %%7  for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_rec19_count);
  llvm_cbe__2e_rec19 = (unsigned long long )llvm_cbe__2e_rec19__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.rec19 = 0x%llX",llvm_cbe__2e_rec19);
printf("\n = 0x%llX",0ull);
printf("\n.rec20 = 0x%llX",llvm_cbe__2e_rec20);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = phi i64 [ %%3, %%0 ], [ %%19, %%7  for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_58_count);
  llvm_cbe_tmp__8 = (unsigned long long )llvm_cbe_tmp__8__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__8);
printf("\n = 0x%llX",llvm_cbe_tmp__4);
printf("\n = 0x%llX",llvm_cbe_tmp__19);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = phi i64 [ %%6, %%0 ], [ %%27, %%7  for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_59_count);
  llvm_cbe_tmp__9 = (unsigned long long )llvm_cbe_tmp__9__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__9);
printf("\n = 0x%llX",llvm_cbe_tmp__7);
printf("\n = 0x%llX",llvm_cbe_tmp__27);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum = add i64 %%.rec19,  for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_sum_count);
  llvm_cbe__2e_sum = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec19&18446744073709551615ull)) + ((unsigned long long )(2ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = getelementptr [24 x i32]* @tqmf, i64 0, i64 %%.su for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_60_count);
  llvm_cbe_tmp__10 = (signed int *)(&tqmf[(((signed long long )llvm_cbe__2e_sum))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum = 0x%llX",((signed long long )llvm_cbe__2e_sum));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum24 = add i64 %%.rec19,  for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_sum24_count);
  llvm_cbe__2e_sum24 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec19&18446744073709551615ull)) + ((unsigned long long )(2ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum24 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum24&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = getelementptr [24 x i32]* @h, i64 0, i64 %%.sum2 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_61_count);
  llvm_cbe_tmp__11 = (signed int *)(&h[(((signed long long )llvm_cbe__2e_sum24))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum24 = 0x%llX",((signed long long )llvm_cbe__2e_sum24));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum25 = add i64 %%.rec19, 3, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_sum25_count);
  llvm_cbe__2e_sum25 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec19&18446744073709551615ull)) + ((unsigned long long )(3ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum25 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum25&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = getelementptr [24 x i32]* @tqmf, i64 0, i64 %%.sum25, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_62_count);
  llvm_cbe_tmp__12 = (signed int *)(&tqmf[(((signed long long )llvm_cbe__2e_sum25))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum25 = 0x%llX",((signed long long )llvm_cbe__2e_sum25));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum) < 24)) fprintf(stderr, "%s:%d: warning: Read access out of array 'tqmf' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i32* %%10, align 8, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_74_count);
  llvm_cbe_tmp__13 = (unsigned int )*llvm_cbe_tmp__10;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__13);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = sext i32 %%13 to i64, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_75_count);
  llvm_cbe_tmp__14 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__13);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__14);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum26 = add i64 %%.rec19, 3, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_sum26_count);
  llvm_cbe__2e_sum26 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec19&18446744073709551615ull)) + ((unsigned long long )(3ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum26 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum26&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = getelementptr [24 x i32]* @h, i64 0, i64 %%.sum26, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_76_count);
  llvm_cbe_tmp__15 = (signed int *)(&h[(((signed long long )llvm_cbe__2e_sum26))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum26 = 0x%llX",((signed long long )llvm_cbe__2e_sum26));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum24) < 24)) fprintf(stderr, "%s:%d: warning: Read access out of array 'h' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = load i32* %%11, align 8, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_84_count);
  llvm_cbe_tmp__16 = (unsigned int )*llvm_cbe_tmp__11;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__16);
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = sext i32 %%16 to i64, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_85_count);
  llvm_cbe_tmp__17 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__16);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__17);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = mul nsw i64 %%17, %%14, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_86_count);
  llvm_cbe_tmp__18 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__17&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__14&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__18&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = add nsw i64 %%18, %%8, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_87_count);
  llvm_cbe_tmp__19 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__18&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__8&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__19&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec20 = add i64 %%.rec19, 2, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_rec20_count);
  llvm_cbe__2e_rec20 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec19&18446744073709551615ull)) + ((unsigned long long )(2ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.rec20 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_rec20&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum27 = add i64 %%.rec19, 4, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_sum27_count);
  llvm_cbe__2e_sum27 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec19&18446744073709551615ull)) + ((unsigned long long )(4ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum27 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum27&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = getelementptr inbounds [24 x i32]* @tqmf, i64 0, i64 %%.sum27, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_93_count);
  llvm_cbe_tmp__20 = (signed int *)(&tqmf[(((signed long long )llvm_cbe__2e_sum27))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum27 = 0x%llX",((signed long long )llvm_cbe__2e_sum27));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum25) < 24)) fprintf(stderr, "%s:%d: warning: Read access out of array 'tqmf' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = load i32* %%12, align 4, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_105_count);
  llvm_cbe_tmp__21 = (unsigned int )*llvm_cbe_tmp__12;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__21);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = sext i32 %%21 to i64, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_106_count);
  llvm_cbe_tmp__22 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__21);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__22);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum28 = add i64 %%.rec19, 4, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_sum28_count);
  llvm_cbe__2e_sum28 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec19&18446744073709551615ull)) + ((unsigned long long )(4ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum28 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum28&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = getelementptr inbounds [24 x i32]* @h, i64 0, i64 %%.sum28, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_107_count);
  llvm_cbe_tmp__23 = (signed int *)(&h[(((signed long long )llvm_cbe__2e_sum28))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum28 = 0x%llX",((signed long long )llvm_cbe__2e_sum28));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum26) < 24)) fprintf(stderr, "%s:%d: warning: Read access out of array 'h' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = load i32* %%15, align 4, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_115_count);
  llvm_cbe_tmp__24 = (unsigned int )*llvm_cbe_tmp__15;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = sext i32 %%24 to i64, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_116_count);
  llvm_cbe_tmp__25 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__25);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = mul nsw i64 %%25, %%22, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_117_count);
  llvm_cbe_tmp__26 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__25&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__22&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__26&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = add nsw i64 %%26, %%9, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_118_count);
  llvm_cbe_tmp__27 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__26&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__9&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__27&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = add nsw i32 %%storemerge8, 1, !dbg !25 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_124_count);
  llvm_cbe_tmp__28 = (unsigned int )((unsigned int )(llvm_cbe_storemerge8&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__28&4294967295ull)));
  if (((llvm_cbe_tmp__28&4294967295U) == (10u&4294967295U))) {
    goto llvm_cbe_tmp__136;
  } else {
    llvm_cbe_storemerge8__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__28;   /* for PHI node */
    llvm_cbe__2e_rec19__PHI_TEMPORARY = (unsigned long long )llvm_cbe__2e_rec20;   /* for PHI node */
    llvm_cbe_tmp__8__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__19;   /* for PHI node */
    llvm_cbe_tmp__9__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__27;   /* for PHI node */
    goto llvm_cbe_tmp__135;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__136:
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum29 = add i64 %%.rec19, 5, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_sum29_count);
  llvm_cbe__2e_sum29 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec19&18446744073709551615ull)) + ((unsigned long long )(5ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum29 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum29&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = getelementptr [24 x i32]* @tqmf, i64 0, i64 %%.sum29, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_132_count);
  llvm_cbe_tmp__29 = (signed int *)(&tqmf[(((signed long long )llvm_cbe__2e_sum29))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum29 = 0x%llX",((signed long long )llvm_cbe__2e_sum29));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum27) < 24)) fprintf(stderr, "%s:%d: warning: Read access out of array 'tqmf' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = load i32* %%20, align 8, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_144_count);
  llvm_cbe_tmp__30 = (unsigned int )*llvm_cbe_tmp__20;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__30);
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = sext i32 %%31 to i64, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_145_count);
  llvm_cbe_tmp__31 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__30);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__31);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum30 = add i64 %%.rec19, 5, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_sum30_count);
  llvm_cbe__2e_sum30 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec19&18446744073709551615ull)) + ((unsigned long long )(5ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum30 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum30&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = getelementptr [24 x i32]* @h, i64 0, i64 %%.sum30, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_146_count);
  llvm_cbe_tmp__32 = (signed int *)(&h[(((signed long long )llvm_cbe__2e_sum30))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum30 = 0x%llX",((signed long long )llvm_cbe__2e_sum30));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum28) < 24)) fprintf(stderr, "%s:%d: warning: Read access out of array 'h' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = load i32* %%23, align 8, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_154_count);
  llvm_cbe_tmp__33 = (unsigned int )*llvm_cbe_tmp__23;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__33);
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = sext i32 %%34 to i64, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_155_count);
  llvm_cbe_tmp__34 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__33);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__34);
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = mul nsw i64 %%35, %%32, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_156_count);
  llvm_cbe_tmp__35 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__34&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__31&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__35&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = add nsw i64 %%36, %%19, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_157_count);
  llvm_cbe_tmp__36 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__35&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__19&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__36&18446744073709551615ull)));

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum29) < 24)) fprintf(stderr, "%s:%d: warning: Read access out of array 'tqmf' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = load i32* %%30, align 4, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_163_count);
  llvm_cbe_tmp__37 = (unsigned int )*llvm_cbe_tmp__29;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__37);
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = sext i32 %%38 to i64, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_164_count);
  llvm_cbe_tmp__38 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__37);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__38);

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum30) < 24)) fprintf(stderr, "%s:%d: warning: Read access out of array 'h' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = load i32* %%33, align 4, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_165_count);
  llvm_cbe_tmp__39 = (unsigned int )*llvm_cbe_tmp__32;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__39);
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = sext i32 %%40 to i64, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_166_count);
  llvm_cbe_tmp__40 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__39);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__40);
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = mul nsw i64 %%41, %%39, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_167_count);
  llvm_cbe_tmp__41 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__40&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__38&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__41&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = add nsw i64 %%42, %%27, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_168_count);
  llvm_cbe_tmp__42 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__41&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__27&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__42&18446744073709551615ull)));
  llvm_cbe__2e_rec__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
  llvm_cbe_storemerge13__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__137;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__137:
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec = phi i64 [ 0, %%29 ], [ %%.rec10, %%44  for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_rec_count);
  llvm_cbe__2e_rec = (unsigned long long )llvm_cbe__2e_rec__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.rec = 0x%llX",llvm_cbe__2e_rec);
printf("\n = 0x%llX",0ull);
printf("\n.rec10 = 0x%llX",llvm_cbe__2e_rec10);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge13 = phi i32 [ 0, %%29 ], [ %%49, %%44  for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_storemerge13_count);
  llvm_cbe_storemerge13 = (unsigned int )llvm_cbe_storemerge13__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge13 = 0x%X",llvm_cbe_storemerge13);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__47);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum31 = add i64 %%.sum29, %%.re for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_sum31_count);
  llvm_cbe__2e_sum31 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_sum29&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe__2e_rec&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum31 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum31&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = getelementptr [24 x i32]* @tqmf, i64 0, i64 %%.sum3 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_181_count);
  llvm_cbe_tmp__43 = (signed int *)(&tqmf[(((signed long long )llvm_cbe__2e_sum31))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum31 = 0x%llX",((signed long long )llvm_cbe__2e_sum31));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum32 = add i64 %%.sum25, %%.re for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_sum32_count);
  llvm_cbe__2e_sum32 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_sum25&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe__2e_rec&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum32 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum32&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = getelementptr [24 x i32]* @tqmf, i64 0, i64 %%.sum3 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_182_count);
  llvm_cbe_tmp__44 = (signed int *)(&tqmf[(((signed long long )llvm_cbe__2e_sum32))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum32 = 0x%llX",((signed long long )llvm_cbe__2e_sum32));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum32) < 24)) fprintf(stderr, "%s:%d: warning: Read access out of array 'tqmf' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = load i32* %%46, align 4, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_183_count);
  llvm_cbe_tmp__45 = (unsigned int )*llvm_cbe_tmp__44;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__45);
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec10 = add i64 %%.rec, -1, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_rec10_count);
  llvm_cbe__2e_rec10 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec&18446744073709551615ull)) + ((unsigned long long )(18446744073709551615ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.rec10 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_rec10&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum33 = add i64 %%.sum29, %%.rec10, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_sum33_count);
  llvm_cbe__2e_sum33 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_sum29&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe__2e_rec10&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum33 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum33&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = getelementptr [24 x i32]* @tqmf, i64 0, i64 %%.sum33, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_184_count);
  llvm_cbe_tmp__46 = (signed int *)(&tqmf[(((signed long long )llvm_cbe__2e_sum33))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum33 = 0x%llX",((signed long long )llvm_cbe__2e_sum33));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe__2e_sum31) < 24 && "Write access out of array 'tqmf' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%47, i32* %%45, align 4, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_196_count);
  *llvm_cbe_tmp__43 = llvm_cbe_tmp__45;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__45);
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = add nsw i32 %%storemerge13, 1, !dbg !25 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_197_count);
  llvm_cbe_tmp__47 = (unsigned int )((unsigned int )(llvm_cbe_storemerge13&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__47&4294967295ull)));
  if (((llvm_cbe_tmp__47&4294967295U) == (22u&4294967295U))) {
    goto llvm_cbe_tmp__138;
  } else {
    llvm_cbe__2e_rec__PHI_TEMPORARY = (unsigned long long )llvm_cbe__2e_rec10;   /* for PHI node */
    llvm_cbe_storemerge13__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__47;   /* for PHI node */
    goto llvm_cbe_tmp__137;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__138:
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum34 = add i64 %%.sum31, -2, !dbg !22 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe__2e_sum34_count);
  llvm_cbe__2e_sum34 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_sum31&18446744073709551615ull)) + ((unsigned long long )(18446744073709551614ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum34 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum34&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = getelementptr [24 x i32]* @tqmf, i64 0, i64 %%.sum34, !dbg !22 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_205_count);
  llvm_cbe_tmp__48 = (signed int *)(&tqmf[(((signed long long )llvm_cbe__2e_sum34))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum34 = 0x%llX",((signed long long )llvm_cbe__2e_sum34));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe__2e_sum33) < 24 && "Write access out of array 'tqmf' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%xin1, i32* %%48, align 4, !dbg !22 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_217_count);
  *llvm_cbe_tmp__46 = llvm_cbe_xin1;
if (AESL_DEBUG_TRACE)
printf("\nxin1 = 0x%X\n", llvm_cbe_xin1);

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe__2e_sum34) < 24 && "Write access out of array 'tqmf' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%xin2, i32* %%51, align 4, !dbg !23 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_218_count);
  *llvm_cbe_tmp__48 = llvm_cbe_xin2;
if (AESL_DEBUG_TRACE)
printf("\nxin2 = 0x%X\n", llvm_cbe_xin2);
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = add nsw i64 %%43, %%37, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_219_count);
  llvm_cbe_tmp__49 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__42&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__36&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__49&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = lshr i64 %%52, 15, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_220_count);
  llvm_cbe_tmp__50 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__49&18446744073709551615ull)) >> ((unsigned long long )(15ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__50&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = trunc i64 %%53 to i32, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_221_count);
  llvm_cbe_tmp__51 = (unsigned int )((unsigned int )llvm_cbe_tmp__50&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__51);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%54, i32* @xl, align 4, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_222_count);
  *(&xl) = llvm_cbe_tmp__51;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__51);
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = sub nsw i64 %%37, %%43, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_223_count);
  llvm_cbe_tmp__52 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__36&18446744073709551615ull)) - ((unsigned long long )(llvm_cbe_tmp__42&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__52&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = lshr i64 %%55, 15, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_224_count);
  llvm_cbe_tmp__53 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__52&18446744073709551615ull)) >> ((unsigned long long )(15ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__53&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = trunc i64 %%56 to i32, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_225_count);
  llvm_cbe_tmp__54 = (unsigned int )((unsigned int )llvm_cbe_tmp__53&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__54);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%57, i32* @xh, align 4, !dbg !24 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_226_count);
  *(&xh) = llvm_cbe_tmp__54;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__54);
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = tail call i32 @filtez(i32* getelementptr inbounds ([6 x i32]* @delay_bpl, i64 0, i64 0), i32* getelementptr inbounds ([6 x i32]* @delay_dltx, i64 0, i64 0)), !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_227_count);
  llvm_cbe_tmp__55 = (unsigned int ) /*tail*/ filtez((signed int *)((&delay_bpl[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])), (signed int *)((&delay_dltx[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__55);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%58, i32* @szl, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_228_count);
  *(&szl) = llvm_cbe_tmp__55;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__55);
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = load i32* @rlt1, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_229_count);
  llvm_cbe_tmp__56 = (unsigned int )*(&rlt1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__56);
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = load i32* @al1, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_230_count);
  llvm_cbe_tmp__57 = (unsigned int )*(&al1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__57);
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = load i32* @rlt2, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_231_count);
  llvm_cbe_tmp__58 = (unsigned int )*(&rlt2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__58);
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = load i32* @al2, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_232_count);
  llvm_cbe_tmp__59 = (unsigned int )*(&al2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__59);
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = tail call i32 @filtep(i32 %%59, i32 %%60, i32 %%61, i32 %%62), !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_233_count);
  llvm_cbe_tmp__60 = (unsigned int ) /*tail*/ filtep(llvm_cbe_tmp__56, llvm_cbe_tmp__57, llvm_cbe_tmp__58, llvm_cbe_tmp__59);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__56);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__57);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__58);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__59);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__60);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%63, i32* @spl, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_234_count);
  *(&spl) = llvm_cbe_tmp__60;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__60);
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = add nsw i32 %%58, %%63, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_235_count);
  llvm_cbe_tmp__61 = (unsigned int )((unsigned int )(llvm_cbe_tmp__55&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__60&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__61&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%64, i32* @sl, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_236_count);
  *(&sl) = llvm_cbe_tmp__61;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__61);
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = sub nsw i32 %%54, %%64, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_237_count);
  llvm_cbe_tmp__62 = (unsigned int )((unsigned int )(llvm_cbe_tmp__51&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__61&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__62&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%65, i32* @el, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_238_count);
  *(&el) = llvm_cbe_tmp__62;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__62);
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = load i32* @detl, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_239_count);
  llvm_cbe_tmp__63 = (unsigned int )*(&detl);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__63);
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = tail call i32 @quantl(i32 %%65, i32 %%66), !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_240_count);
  llvm_cbe_tmp__64 = (unsigned int ) /*tail*/ quantl(llvm_cbe_tmp__62, llvm_cbe_tmp__63);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__62);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__63);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__64);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%67, i32* @il, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_241_count);
  *(&il) = llvm_cbe_tmp__64;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__64);
if (AESL_DEBUG_TRACE)
printf("\n  %%68 = sext i32 %%66 to i64, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_242_count);
  llvm_cbe_tmp__65 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__63);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__65);
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = ashr i32 %%67, 2, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_243_count);
  llvm_cbe_tmp__66 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__64) >> ((signed int )2u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__66));
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = sext i32 %%69 to i64, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_244_count);
  llvm_cbe_tmp__67 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__66);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__67);
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = getelementptr inbounds [16 x i32]* @qq4_code4_table, i64 0, i64 %%70, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_245_count);
  llvm_cbe_tmp__68 = (signed int *)(&qq4_code4_table[(((signed long long )llvm_cbe_tmp__67))
#ifdef AESL_BC_SIM
 % 16
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__67));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__67) < 16)) fprintf(stderr, "%s:%d: warning: Read access out of array 'qq4_code4_table' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%72 = load i32* %%71, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_246_count);
  llvm_cbe_tmp__69 = (unsigned int )*llvm_cbe_tmp__68;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__69);
if (AESL_DEBUG_TRACE)
printf("\n  %%73 = sext i32 %%72 to i64, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_247_count);
  llvm_cbe_tmp__70 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__69);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__70);
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = mul nsw i64 %%73, %%68, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_248_count);
  llvm_cbe_tmp__71 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__70&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__65&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__71&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%75 = lshr i64 %%74, 15, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_249_count);
  llvm_cbe_tmp__72 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__71&18446744073709551615ull)) >> ((unsigned long long )(15ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__72&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%76 = trunc i64 %%75 to i32, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_250_count);
  llvm_cbe_tmp__73 = (unsigned int )((unsigned int )llvm_cbe_tmp__72&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__73);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%76, i32* @dlt, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_251_count);
  *(&dlt) = llvm_cbe_tmp__73;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__73);
if (AESL_DEBUG_TRACE)
printf("\n  %%77 = load i32* @nbl, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_252_count);
  llvm_cbe_tmp__74 = (unsigned int )*(&nbl);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__74);
if (AESL_DEBUG_TRACE)
printf("\n  %%78 = tail call i32 @logscl(i32 %%67, i32 %%77), !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_253_count);
  llvm_cbe_tmp__75 = (unsigned int ) /*tail*/ logscl(llvm_cbe_tmp__64, llvm_cbe_tmp__74);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__64);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__74);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__75);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%78, i32* @nbl, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_254_count);
  *(&nbl) = llvm_cbe_tmp__75;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__75);
if (AESL_DEBUG_TRACE)
printf("\n  %%79 = tail call i32 @scalel(i32 %%78, i32 8), !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_255_count);
  llvm_cbe_tmp__76 = (unsigned int ) /*tail*/ scalel(llvm_cbe_tmp__75, 8u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__75);
printf("\nArgument  = 0x%X",8u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__76);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%79, i32* @detl, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_256_count);
  *(&detl) = llvm_cbe_tmp__76;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__76);
if (AESL_DEBUG_TRACE)
printf("\n  %%80 = add nsw i32 %%58, %%76, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_257_count);
  llvm_cbe_tmp__77 = (unsigned int )((unsigned int )(llvm_cbe_tmp__55&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__73&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__77&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%80, i32* @plt, align 4, !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_258_count);
  *(&plt) = llvm_cbe_tmp__77;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__77);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @upzero(i32 %%76, i32* getelementptr inbounds ([6 x i32]* @delay_dltx, i64 0, i64 0), i32* getelementptr inbounds ([6 x i32]* @delay_bpl, i64 0, i64 0)), !dbg !26 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_259_count);
   /*tail*/ upzero(llvm_cbe_tmp__73, (signed int *)((&delay_dltx[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])), (signed int *)((&delay_bpl[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__73);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%81 = load i32* @al1, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_260_count);
  llvm_cbe_tmp__78 = (unsigned int )*(&al1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__78);
if (AESL_DEBUG_TRACE)
printf("\n  %%82 = load i32* @al2, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_261_count);
  llvm_cbe_tmp__79 = (unsigned int )*(&al2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__79);
if (AESL_DEBUG_TRACE)
printf("\n  %%83 = load i32* @plt, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_262_count);
  llvm_cbe_tmp__80 = (unsigned int )*(&plt);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__80);
if (AESL_DEBUG_TRACE)
printf("\n  %%84 = load i32* @plt1, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_263_count);
  llvm_cbe_tmp__81 = (unsigned int )*(&plt1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__81);
if (AESL_DEBUG_TRACE)
printf("\n  %%85 = load i32* @plt2, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_264_count);
  llvm_cbe_tmp__82 = (unsigned int )*(&plt2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__82);
if (AESL_DEBUG_TRACE)
printf("\n  %%86 = tail call i32 @uppol2(i32 %%81, i32 %%82, i32 %%83, i32 %%84, i32 %%85), !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_265_count);
  llvm_cbe_tmp__83 = (unsigned int ) /*tail*/ uppol2(llvm_cbe_tmp__78, llvm_cbe_tmp__79, llvm_cbe_tmp__80, llvm_cbe_tmp__81, llvm_cbe_tmp__82);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__78);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__79);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__80);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__81);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__82);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__83);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%86, i32* @al2, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_266_count);
  *(&al2) = llvm_cbe_tmp__83;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__83);
if (AESL_DEBUG_TRACE)
printf("\n  %%87 = tail call i32 @uppol1(i32 %%81, i32 %%86, i32 %%83, i32 %%84), !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_267_count);
  llvm_cbe_tmp__84 = (unsigned int ) /*tail*/ uppol1(llvm_cbe_tmp__78, llvm_cbe_tmp__83, llvm_cbe_tmp__80, llvm_cbe_tmp__81);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__78);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__83);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__80);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__81);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__84);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%87, i32* @al1, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_268_count);
  *(&al1) = llvm_cbe_tmp__84;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__84);
if (AESL_DEBUG_TRACE)
printf("\n  %%88 = load i32* @sl, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_269_count);
  llvm_cbe_tmp__85 = (unsigned int )*(&sl);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__85);
if (AESL_DEBUG_TRACE)
printf("\n  %%89 = load i32* @dlt, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_270_count);
  llvm_cbe_tmp__86 = (unsigned int )*(&dlt);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__86);
if (AESL_DEBUG_TRACE)
printf("\n  %%90 = add nsw i32 %%89, %%88, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_271_count);
  llvm_cbe_tmp__87 = (unsigned int )((unsigned int )(llvm_cbe_tmp__86&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__85&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__87&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%90, i32* @rlt, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_272_count);
  *(&rlt) = llvm_cbe_tmp__87;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__87);
if (AESL_DEBUG_TRACE)
printf("\n  %%91 = load i32* @rlt1, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_273_count);
  llvm_cbe_tmp__88 = (unsigned int )*(&rlt1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__88);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%91, i32* @rlt2, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_274_count);
  *(&rlt2) = llvm_cbe_tmp__88;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__88);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%90, i32* @rlt1, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_275_count);
  *(&rlt1) = llvm_cbe_tmp__87;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__87);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%84, i32* @plt2, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_276_count);
  *(&plt2) = llvm_cbe_tmp__81;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__81);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%83, i32* @plt1, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_277_count);
  *(&plt1) = llvm_cbe_tmp__80;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__80);
if (AESL_DEBUG_TRACE)
printf("\n  %%92 = tail call i32 @filtez(i32* getelementptr inbounds ([6 x i32]* @delay_bph, i64 0, i64 0), i32* getelementptr inbounds ([6 x i32]* @delay_dhx, i64 0, i64 0)), !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_278_count);
  llvm_cbe_tmp__89 = (unsigned int ) /*tail*/ filtez((signed int *)((&delay_bph[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])), (signed int *)((&delay_dhx[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__89);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%92, i32* @szh, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_279_count);
  *(&szh) = llvm_cbe_tmp__89;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__89);
if (AESL_DEBUG_TRACE)
printf("\n  %%93 = load i32* @rh1, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_280_count);
  llvm_cbe_tmp__90 = (unsigned int )*(&rh1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__90);
if (AESL_DEBUG_TRACE)
printf("\n  %%94 = load i32* @ah1, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_281_count);
  llvm_cbe_tmp__91 = (unsigned int )*(&ah1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__91);
if (AESL_DEBUG_TRACE)
printf("\n  %%95 = load i32* @rh2, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_282_count);
  llvm_cbe_tmp__92 = (unsigned int )*(&rh2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__92);
if (AESL_DEBUG_TRACE)
printf("\n  %%96 = load i32* @ah2, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_283_count);
  llvm_cbe_tmp__93 = (unsigned int )*(&ah2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__93);
if (AESL_DEBUG_TRACE)
printf("\n  %%97 = tail call i32 @filtep(i32 %%93, i32 %%94, i32 %%95, i32 %%96), !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_284_count);
  llvm_cbe_tmp__94 = (unsigned int ) /*tail*/ filtep(llvm_cbe_tmp__90, llvm_cbe_tmp__91, llvm_cbe_tmp__92, llvm_cbe_tmp__93);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__90);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__91);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__92);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__93);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__94);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%97, i32* @sph, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_285_count);
  *(&sph) = llvm_cbe_tmp__94;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__94);
if (AESL_DEBUG_TRACE)
printf("\n  %%98 = add nsw i32 %%92, %%97, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_286_count);
  llvm_cbe_tmp__95 = (unsigned int )((unsigned int )(llvm_cbe_tmp__89&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__94&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__95&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%98, i32* @sh, align 4, !dbg !27 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_287_count);
  *(&sh) = llvm_cbe_tmp__95;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__95);
if (AESL_DEBUG_TRACE)
printf("\n  %%99 = load i32* @xh, align 4, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_288_count);
  llvm_cbe_tmp__96 = (unsigned int )*(&xh);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__96);
if (AESL_DEBUG_TRACE)
printf("\n  %%100 = sub nsw i32 %%99, %%98, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_289_count);
  llvm_cbe_tmp__97 = (unsigned int )((unsigned int )(llvm_cbe_tmp__96&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__95&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__97&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%100, i32* @eh, align 4, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_290_count);
  *(&eh) = llvm_cbe_tmp__97;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__97);
if (AESL_DEBUG_TRACE)
printf("\n  %%101 = ashr i32 %%100, 31, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_291_count);
  llvm_cbe_tmp__98 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__97) >> ((signed int )31u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__98));
if (AESL_DEBUG_TRACE)
printf("\n  %%102 = and i32 %%101, -2, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_292_count);
  llvm_cbe_tmp__99 = (unsigned int )llvm_cbe_tmp__98 & 4294967294u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__99);
if (AESL_DEBUG_TRACE)
printf("\n  %%103 = add i32 %%102, 3, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_293_count);
  llvm_cbe_tmp__100 = (unsigned int )((unsigned int )(llvm_cbe_tmp__99&4294967295ull)) + ((unsigned int )(3u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__100&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%103, i32* @ih, align 4, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_294_count);
  *(&ih) = llvm_cbe_tmp__100;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__100);
if (AESL_DEBUG_TRACE)
printf("\n  %%104 = load i32* @deth, align 4, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_295_count);
  llvm_cbe_tmp__101 = (unsigned int )*(&deth);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__101);
if (AESL_DEBUG_TRACE)
printf("\n  %%105 = sext i32 %%104 to i64, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_296_count);
  llvm_cbe_tmp__102 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__101);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__102);
if (AESL_DEBUG_TRACE)
printf("\n  %%106 = mul nsw i64 %%105, 564, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_297_count);
  llvm_cbe_tmp__103 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__102&18446744073709551615ull)) * ((unsigned long long )(564ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__103&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%107 = lshr i64 %%106, 12, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_298_count);
  llvm_cbe_tmp__104 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__103&18446744073709551615ull)) >> ((unsigned long long )(12ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__104&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%108 = trunc i64 %%107 to i32, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_299_count);
  llvm_cbe_tmp__105 = (unsigned int )((unsigned int )llvm_cbe_tmp__104&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__105);
if (AESL_DEBUG_TRACE)
printf("\n  %%109 = tail call i32 @abs(i32 %%100) nounwind readnone, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_301_count);
  llvm_cbe_tmp__106 = (unsigned int ) /*tail*/ abs(llvm_cbe_tmp__97);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__97);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__106);
}
  if ((((signed int )llvm_cbe_tmp__106) > ((signed int )llvm_cbe_tmp__105))) {
    goto llvm_cbe_tmp__139;
  } else {
    llvm_cbe_tmp__108__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__100;   /* for PHI node */
    goto llvm_cbe_tmp__140;
  }

llvm_cbe_tmp__139:
if (AESL_DEBUG_TRACE)
printf("\n  %%112 = add i32 %%102, 2, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_305_count);
  llvm_cbe_tmp__107 = (unsigned int )((unsigned int )(llvm_cbe_tmp__99&4294967295ull)) + ((unsigned int )(2u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__107&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%112, i32* @ih, align 4, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_306_count);
  *(&ih) = llvm_cbe_tmp__107;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__107);
  llvm_cbe_tmp__108__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__107;   /* for PHI node */
  goto llvm_cbe_tmp__140;

llvm_cbe_tmp__140:
if (AESL_DEBUG_TRACE)
printf("\n  %%114 = phi i32 [ %%112, %%111 ], [ %%103, %%50  for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_308_count);
  llvm_cbe_tmp__108 = (unsigned int )llvm_cbe_tmp__108__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__108);
printf("\n = 0x%X",llvm_cbe_tmp__107);
printf("\n = 0x%X",llvm_cbe_tmp__100);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%115 = sext i32 %%114 to i64, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_309_count);
  llvm_cbe_tmp__109 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__108);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__109);
if (AESL_DEBUG_TRACE)
printf("\n  %%116 = getelementptr inbounds [4 x i32]* @qq2_code2_table, i64 0, i64 %%115, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_310_count);
  llvm_cbe_tmp__110 = (signed int *)(&qq2_code2_table[(((signed long long )llvm_cbe_tmp__109))
#ifdef AESL_BC_SIM
 % 4
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__109));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__109) < 4)) fprintf(stderr, "%s:%d: warning: Read access out of array 'qq2_code2_table' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%117 = load i32* %%116, align 4, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_311_count);
  llvm_cbe_tmp__111 = (unsigned int )*llvm_cbe_tmp__110;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__111);
if (AESL_DEBUG_TRACE)
printf("\n  %%118 = sext i32 %%117 to i64, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_312_count);
  llvm_cbe_tmp__112 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__111);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__112);
if (AESL_DEBUG_TRACE)
printf("\n  %%119 = mul nsw i64 %%118, %%105, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_313_count);
  llvm_cbe_tmp__113 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__112&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__102&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__113&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%120 = lshr i64 %%119, 15, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_314_count);
  llvm_cbe_tmp__114 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__113&18446744073709551615ull)) >> ((unsigned long long )(15ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__114&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%121 = trunc i64 %%120 to i32, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_315_count);
  llvm_cbe_tmp__115 = (unsigned int )((unsigned int )llvm_cbe_tmp__114&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__115);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%121, i32* @dh, align 4, !dbg !28 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_316_count);
  *(&dh) = llvm_cbe_tmp__115;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__115);
if (AESL_DEBUG_TRACE)
printf("\n  %%122 = load i32* @nbh, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_317_count);
  llvm_cbe_tmp__116 = (unsigned int )*(&nbh);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__116);
if (AESL_DEBUG_TRACE)
printf("\n  %%123 = tail call i32 @logsch(i32 %%114, i32 %%122), !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_318_count);
  llvm_cbe_tmp__117 = (unsigned int ) /*tail*/ logsch(llvm_cbe_tmp__108, llvm_cbe_tmp__116);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__108);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__116);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__117);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%123, i32* @nbh, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_319_count);
  *(&nbh) = llvm_cbe_tmp__117;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__117);
if (AESL_DEBUG_TRACE)
printf("\n  %%124 = tail call i32 @scalel(i32 %%123, i32 10), !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_320_count);
  llvm_cbe_tmp__118 = (unsigned int ) /*tail*/ scalel(llvm_cbe_tmp__117, 10u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__117);
printf("\nArgument  = 0x%X",10u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__118);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%124, i32* @deth, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_321_count);
  *(&deth) = llvm_cbe_tmp__118;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__118);
if (AESL_DEBUG_TRACE)
printf("\n  %%125 = add nsw i32 %%92, %%121, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_322_count);
  llvm_cbe_tmp__119 = (unsigned int )((unsigned int )(llvm_cbe_tmp__89&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__115&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__119&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%125, i32* @ph, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_323_count);
  *(&ph) = llvm_cbe_tmp__119;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__119);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @upzero(i32 %%121, i32* getelementptr inbounds ([6 x i32]* @delay_dhx, i64 0, i64 0), i32* getelementptr inbounds ([6 x i32]* @delay_bph, i64 0, i64 0)), !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_324_count);
   /*tail*/ upzero(llvm_cbe_tmp__115, (signed int *)((&delay_dhx[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])), (signed int *)((&delay_bph[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__115);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%126 = load i32* @ah1, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_325_count);
  llvm_cbe_tmp__120 = (unsigned int )*(&ah1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__120);
if (AESL_DEBUG_TRACE)
printf("\n  %%127 = load i32* @ah2, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_326_count);
  llvm_cbe_tmp__121 = (unsigned int )*(&ah2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__121);
if (AESL_DEBUG_TRACE)
printf("\n  %%128 = load i32* @ph, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_327_count);
  llvm_cbe_tmp__122 = (unsigned int )*(&ph);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__122);
if (AESL_DEBUG_TRACE)
printf("\n  %%129 = load i32* @ph1, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_328_count);
  llvm_cbe_tmp__123 = (unsigned int )*(&ph1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__123);
if (AESL_DEBUG_TRACE)
printf("\n  %%130 = load i32* @ph2, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_329_count);
  llvm_cbe_tmp__124 = (unsigned int )*(&ph2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__124);
if (AESL_DEBUG_TRACE)
printf("\n  %%131 = tail call i32 @uppol2(i32 %%126, i32 %%127, i32 %%128, i32 %%129, i32 %%130), !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_330_count);
  llvm_cbe_tmp__125 = (unsigned int ) /*tail*/ uppol2(llvm_cbe_tmp__120, llvm_cbe_tmp__121, llvm_cbe_tmp__122, llvm_cbe_tmp__123, llvm_cbe_tmp__124);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__120);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__121);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__122);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__123);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__124);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__125);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%131, i32* @ah2, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_331_count);
  *(&ah2) = llvm_cbe_tmp__125;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__125);
if (AESL_DEBUG_TRACE)
printf("\n  %%132 = tail call i32 @uppol1(i32 %%126, i32 %%131, i32 %%128, i32 %%129), !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_332_count);
  llvm_cbe_tmp__126 = (unsigned int ) /*tail*/ uppol1(llvm_cbe_tmp__120, llvm_cbe_tmp__125, llvm_cbe_tmp__122, llvm_cbe_tmp__123);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__120);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__125);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__122);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__123);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__126);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%132, i32* @ah1, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_333_count);
  *(&ah1) = llvm_cbe_tmp__126;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__126);
if (AESL_DEBUG_TRACE)
printf("\n  %%133 = load i32* @sh, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_334_count);
  llvm_cbe_tmp__127 = (unsigned int )*(&sh);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__127);
if (AESL_DEBUG_TRACE)
printf("\n  %%134 = load i32* @dh, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_335_count);
  llvm_cbe_tmp__128 = (unsigned int )*(&dh);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__128);
if (AESL_DEBUG_TRACE)
printf("\n  %%135 = add nsw i32 %%134, %%133, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_336_count);
  llvm_cbe_tmp__129 = (unsigned int )((unsigned int )(llvm_cbe_tmp__128&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__127&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__129&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%135, i32* @yh, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_337_count);
  *(&yh) = llvm_cbe_tmp__129;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__129);
if (AESL_DEBUG_TRACE)
printf("\n  %%136 = load i32* @rh1, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_338_count);
  llvm_cbe_tmp__130 = (unsigned int )*(&rh1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__130);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%136, i32* @rh2, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_339_count);
  *(&rh2) = llvm_cbe_tmp__130;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__130);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%135, i32* @rh1, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_340_count);
  *(&rh1) = llvm_cbe_tmp__129;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__129);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%129, i32* @ph2, align 4, !dbg !29 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_341_count);
  *(&ph2) = llvm_cbe_tmp__123;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__123);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%128, i32* @ph1, align 4, !dbg !30 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_342_count);
  *(&ph1) = llvm_cbe_tmp__122;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__122);
if (AESL_DEBUG_TRACE)
printf("\n  %%137 = load i32* @il, align 4, !dbg !30 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_343_count);
  llvm_cbe_tmp__131 = (unsigned int )*(&il);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__131);
if (AESL_DEBUG_TRACE)
printf("\n  %%138 = load i32* @ih, align 4, !dbg !30 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_344_count);
  llvm_cbe_tmp__132 = (unsigned int )*(&ih);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__132);
if (AESL_DEBUG_TRACE)
printf("\n  %%139 = shl i32 %%138, 6, !dbg !30 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_345_count);
  llvm_cbe_tmp__133 = (unsigned int )llvm_cbe_tmp__132 << 6u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__133);
if (AESL_DEBUG_TRACE)
printf("\n  %%140 = or i32 %%139, %%137, !dbg !30 for 0x%llxth hint within @encode  --> \n", ++aesl_llvm_cbe_346_count);
  llvm_cbe_tmp__134 = (unsigned int )llvm_cbe_tmp__133 | llvm_cbe_tmp__131;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__134);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @encode}\n");
  return llvm_cbe_tmp__134;
}


signed int filtez(signed int *llvm_cbe_bpl, signed int *llvm_cbe_dlt) {
  static  unsigned long long aesl_llvm_cbe_348_count = 0;
  static  unsigned long long aesl_llvm_cbe_349_count = 0;
  static  unsigned long long aesl_llvm_cbe_350_count = 0;
  static  unsigned long long aesl_llvm_cbe_351_count = 0;
  static  unsigned long long aesl_llvm_cbe_352_count = 0;
  static  unsigned long long aesl_llvm_cbe_353_count = 0;
  static  unsigned long long aesl_llvm_cbe_354_count = 0;
  unsigned int llvm_cbe_tmp__141;
  static  unsigned long long aesl_llvm_cbe_355_count = 0;
  unsigned long long llvm_cbe_tmp__142;
  static  unsigned long long aesl_llvm_cbe_356_count = 0;
  unsigned int llvm_cbe_tmp__143;
  static  unsigned long long aesl_llvm_cbe_357_count = 0;
  unsigned long long llvm_cbe_tmp__144;
  static  unsigned long long aesl_llvm_cbe_358_count = 0;
  unsigned long long llvm_cbe_tmp__145;
  static  unsigned long long aesl_llvm_cbe_359_count = 0;
  static  unsigned long long aesl_llvm_cbe_360_count = 0;
  static  unsigned long long aesl_llvm_cbe_361_count = 0;
  static  unsigned long long aesl_llvm_cbe_362_count = 0;
  static  unsigned long long aesl_llvm_cbe_363_count = 0;
  static  unsigned long long aesl_llvm_cbe_364_count = 0;
  static  unsigned long long aesl_llvm_cbe_365_count = 0;
  signed int *llvm_cbe_tmp__146;
  static  unsigned long long aesl_llvm_cbe_366_count = 0;
  static  unsigned long long aesl_llvm_cbe_367_count = 0;
  signed int *llvm_cbe_tmp__147;
  static  unsigned long long aesl_llvm_cbe_368_count = 0;
  static  unsigned long long aesl_llvm_cbe_369_count = 0;
  unsigned int llvm_cbe_tmp__148;
  static  unsigned long long aesl_llvm_cbe_370_count = 0;
  unsigned long long llvm_cbe_tmp__149;
  static  unsigned long long aesl_llvm_cbe_371_count = 0;
  unsigned int llvm_cbe_tmp__150;
  static  unsigned long long aesl_llvm_cbe_372_count = 0;
  unsigned long long llvm_cbe_tmp__151;
  static  unsigned long long aesl_llvm_cbe_373_count = 0;
  unsigned long long llvm_cbe_tmp__152;
  static  unsigned long long aesl_llvm_cbe_374_count = 0;
  unsigned long long llvm_cbe_tmp__153;
  static  unsigned long long aesl_llvm_cbe_375_count = 0;
  static  unsigned long long aesl_llvm_cbe_376_count = 0;
  static  unsigned long long aesl_llvm_cbe_377_count = 0;
  static  unsigned long long aesl_llvm_cbe_378_count = 0;
  signed int *llvm_cbe_tmp__154;
  static  unsigned long long aesl_llvm_cbe_379_count = 0;
  static  unsigned long long aesl_llvm_cbe_380_count = 0;
  signed int *llvm_cbe_tmp__155;
  static  unsigned long long aesl_llvm_cbe_381_count = 0;
  static  unsigned long long aesl_llvm_cbe_382_count = 0;
  unsigned int llvm_cbe_tmp__156;
  static  unsigned long long aesl_llvm_cbe_383_count = 0;
  unsigned long long llvm_cbe_tmp__157;
  static  unsigned long long aesl_llvm_cbe_384_count = 0;
  unsigned int llvm_cbe_tmp__158;
  static  unsigned long long aesl_llvm_cbe_385_count = 0;
  unsigned long long llvm_cbe_tmp__159;
  static  unsigned long long aesl_llvm_cbe_386_count = 0;
  unsigned long long llvm_cbe_tmp__160;
  static  unsigned long long aesl_llvm_cbe_387_count = 0;
  unsigned long long llvm_cbe_tmp__161;
  static  unsigned long long aesl_llvm_cbe_388_count = 0;
  static  unsigned long long aesl_llvm_cbe_389_count = 0;
  static  unsigned long long aesl_llvm_cbe_390_count = 0;
  static  unsigned long long aesl_llvm_cbe_391_count = 0;
  signed int *llvm_cbe_tmp__162;
  static  unsigned long long aesl_llvm_cbe_392_count = 0;
  static  unsigned long long aesl_llvm_cbe_393_count = 0;
  signed int *llvm_cbe_tmp__163;
  static  unsigned long long aesl_llvm_cbe_394_count = 0;
  static  unsigned long long aesl_llvm_cbe_395_count = 0;
  unsigned int llvm_cbe_tmp__164;
  static  unsigned long long aesl_llvm_cbe_396_count = 0;
  unsigned long long llvm_cbe_tmp__165;
  static  unsigned long long aesl_llvm_cbe_397_count = 0;
  unsigned int llvm_cbe_tmp__166;
  static  unsigned long long aesl_llvm_cbe_398_count = 0;
  unsigned long long llvm_cbe_tmp__167;
  static  unsigned long long aesl_llvm_cbe_399_count = 0;
  unsigned long long llvm_cbe_tmp__168;
  static  unsigned long long aesl_llvm_cbe_400_count = 0;
  unsigned long long llvm_cbe_tmp__169;
  static  unsigned long long aesl_llvm_cbe_401_count = 0;
  static  unsigned long long aesl_llvm_cbe_402_count = 0;
  static  unsigned long long aesl_llvm_cbe_403_count = 0;
  static  unsigned long long aesl_llvm_cbe_404_count = 0;
  signed int *llvm_cbe_tmp__170;
  static  unsigned long long aesl_llvm_cbe_405_count = 0;
  static  unsigned long long aesl_llvm_cbe_406_count = 0;
  signed int *llvm_cbe_tmp__171;
  static  unsigned long long aesl_llvm_cbe_407_count = 0;
  static  unsigned long long aesl_llvm_cbe_408_count = 0;
  unsigned int llvm_cbe_tmp__172;
  static  unsigned long long aesl_llvm_cbe_409_count = 0;
  unsigned long long llvm_cbe_tmp__173;
  static  unsigned long long aesl_llvm_cbe_410_count = 0;
  unsigned int llvm_cbe_tmp__174;
  static  unsigned long long aesl_llvm_cbe_411_count = 0;
  unsigned long long llvm_cbe_tmp__175;
  static  unsigned long long aesl_llvm_cbe_412_count = 0;
  unsigned long long llvm_cbe_tmp__176;
  static  unsigned long long aesl_llvm_cbe_413_count = 0;
  unsigned long long llvm_cbe_tmp__177;
  static  unsigned long long aesl_llvm_cbe_414_count = 0;
  static  unsigned long long aesl_llvm_cbe_415_count = 0;
  static  unsigned long long aesl_llvm_cbe_416_count = 0;
  static  unsigned long long aesl_llvm_cbe_417_count = 0;
  signed int *llvm_cbe_tmp__178;
  static  unsigned long long aesl_llvm_cbe_418_count = 0;
  static  unsigned long long aesl_llvm_cbe_419_count = 0;
  signed int *llvm_cbe_tmp__179;
  static  unsigned long long aesl_llvm_cbe_420_count = 0;
  static  unsigned long long aesl_llvm_cbe_421_count = 0;
  unsigned int llvm_cbe_tmp__180;
  static  unsigned long long aesl_llvm_cbe_422_count = 0;
  unsigned long long llvm_cbe_tmp__181;
  static  unsigned long long aesl_llvm_cbe_423_count = 0;
  unsigned int llvm_cbe_tmp__182;
  static  unsigned long long aesl_llvm_cbe_424_count = 0;
  unsigned long long llvm_cbe_tmp__183;
  static  unsigned long long aesl_llvm_cbe_425_count = 0;
  unsigned long long llvm_cbe_tmp__184;
  static  unsigned long long aesl_llvm_cbe_426_count = 0;
  unsigned long long llvm_cbe_tmp__185;
  static  unsigned long long aesl_llvm_cbe_427_count = 0;
  static  unsigned long long aesl_llvm_cbe_428_count = 0;
  static  unsigned long long aesl_llvm_cbe_429_count = 0;
  static  unsigned long long aesl_llvm_cbe_430_count = 0;
  unsigned long long llvm_cbe_tmp__186;
  static  unsigned long long aesl_llvm_cbe_431_count = 0;
  unsigned int llvm_cbe_tmp__187;
  static  unsigned long long aesl_llvm_cbe_432_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @filtez\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i32* %%bpl, align 4, !dbg !22 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_354_count);
  llvm_cbe_tmp__141 = (unsigned int )*llvm_cbe_bpl;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__141);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i32 %%1 to i64, !dbg !22 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_355_count);
  llvm_cbe_tmp__142 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__141);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__142);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = load i32* %%dlt, align 4, !dbg !22 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_356_count);
  llvm_cbe_tmp__143 = (unsigned int )*llvm_cbe_dlt;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__143);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = sext i32 %%3 to i64, !dbg !22 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_357_count);
  llvm_cbe_tmp__144 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__143);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__144);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = mul nsw i64 %%4, %%2, !dbg !22 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_358_count);
  llvm_cbe_tmp__145 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__144&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__142&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__145&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i32* %%bpl, i64 1, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_365_count);
  llvm_cbe_tmp__146 = (signed int *)(&llvm_cbe_bpl[(((signed long long )1ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = getelementptr inbounds i32* %%dlt, i64 1, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_367_count);
  llvm_cbe_tmp__147 = (signed int *)(&llvm_cbe_dlt[(((signed long long )1ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = load i32* %%6, align 4, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_369_count);
  llvm_cbe_tmp__148 = (unsigned int )*llvm_cbe_tmp__146;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__148);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = sext i32 %%8 to i64, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_370_count);
  llvm_cbe_tmp__149 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__148);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__149);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = load i32* %%7, align 4, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_371_count);
  llvm_cbe_tmp__150 = (unsigned int )*llvm_cbe_tmp__147;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__150);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = sext i32 %%10 to i64, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_372_count);
  llvm_cbe_tmp__151 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__150);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__151);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = mul nsw i64 %%11, %%9, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_373_count);
  llvm_cbe_tmp__152 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__151&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__149&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__152&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = add nsw i64 %%12, %%5, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_374_count);
  llvm_cbe_tmp__153 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__152&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__145&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__153&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = getelementptr inbounds i32* %%bpl, i64 2, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_378_count);
  llvm_cbe_tmp__154 = (signed int *)(&llvm_cbe_bpl[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = getelementptr inbounds i32* %%dlt, i64 2, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_380_count);
  llvm_cbe_tmp__155 = (signed int *)(&llvm_cbe_dlt[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = load i32* %%14, align 4, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_382_count);
  llvm_cbe_tmp__156 = (unsigned int )*llvm_cbe_tmp__154;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__156);
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = sext i32 %%16 to i64, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_383_count);
  llvm_cbe_tmp__157 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__156);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__157);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = load i32* %%15, align 4, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_384_count);
  llvm_cbe_tmp__158 = (unsigned int )*llvm_cbe_tmp__155;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__158);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = sext i32 %%18 to i64, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_385_count);
  llvm_cbe_tmp__159 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__158);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__159);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = mul nsw i64 %%19, %%17, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_386_count);
  llvm_cbe_tmp__160 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__159&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__157&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__160&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = add nsw i64 %%20, %%13, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_387_count);
  llvm_cbe_tmp__161 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__160&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__153&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__161&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = getelementptr inbounds i32* %%bpl, i64 3, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_391_count);
  llvm_cbe_tmp__162 = (signed int *)(&llvm_cbe_bpl[(((signed long long )3ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = getelementptr inbounds i32* %%dlt, i64 3, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_393_count);
  llvm_cbe_tmp__163 = (signed int *)(&llvm_cbe_dlt[(((signed long long )3ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = load i32* %%22, align 4, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_395_count);
  llvm_cbe_tmp__164 = (unsigned int )*llvm_cbe_tmp__162;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__164);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = sext i32 %%24 to i64, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_396_count);
  llvm_cbe_tmp__165 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__164);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__165);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = load i32* %%23, align 4, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_397_count);
  llvm_cbe_tmp__166 = (unsigned int )*llvm_cbe_tmp__163;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__166);
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = sext i32 %%26 to i64, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_398_count);
  llvm_cbe_tmp__167 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__166);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__167);
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = mul nsw i64 %%27, %%25, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_399_count);
  llvm_cbe_tmp__168 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__167&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__165&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__168&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = add nsw i64 %%28, %%21, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_400_count);
  llvm_cbe_tmp__169 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__168&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__161&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__169&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = getelementptr inbounds i32* %%bpl, i64 4, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_404_count);
  llvm_cbe_tmp__170 = (signed int *)(&llvm_cbe_bpl[(((signed long long )4ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = getelementptr inbounds i32* %%dlt, i64 4, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_406_count);
  llvm_cbe_tmp__171 = (signed int *)(&llvm_cbe_dlt[(((signed long long )4ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = load i32* %%30, align 4, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_408_count);
  llvm_cbe_tmp__172 = (unsigned int )*llvm_cbe_tmp__170;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__172);
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = sext i32 %%32 to i64, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_409_count);
  llvm_cbe_tmp__173 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__172);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__173);
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = load i32* %%31, align 4, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_410_count);
  llvm_cbe_tmp__174 = (unsigned int )*llvm_cbe_tmp__171;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__174);
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = sext i32 %%34 to i64, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_411_count);
  llvm_cbe_tmp__175 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__174);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__175);
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = mul nsw i64 %%35, %%33, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_412_count);
  llvm_cbe_tmp__176 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__175&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__173&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__176&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = add nsw i64 %%36, %%29, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_413_count);
  llvm_cbe_tmp__177 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__176&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__169&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__177&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = getelementptr inbounds i32* %%bpl, i64 5, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_417_count);
  llvm_cbe_tmp__178 = (signed int *)(&llvm_cbe_bpl[(((signed long long )5ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = getelementptr inbounds i32* %%dlt, i64 5, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_419_count);
  llvm_cbe_tmp__179 = (signed int *)(&llvm_cbe_dlt[(((signed long long )5ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = load i32* %%38, align 4, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_421_count);
  llvm_cbe_tmp__180 = (unsigned int )*llvm_cbe_tmp__178;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__180);
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = sext i32 %%40 to i64, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_422_count);
  llvm_cbe_tmp__181 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__180);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__181);
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = load i32* %%39, align 4, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_423_count);
  llvm_cbe_tmp__182 = (unsigned int )*llvm_cbe_tmp__179;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__182);
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = sext i32 %%42 to i64, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_424_count);
  llvm_cbe_tmp__183 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__182);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__183);
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = mul nsw i64 %%43, %%41, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_425_count);
  llvm_cbe_tmp__184 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__183&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__181&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__184&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = add nsw i64 %%44, %%37, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_426_count);
  llvm_cbe_tmp__185 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__184&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__177&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__185&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = lshr i64 %%45, 14, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_430_count);
  llvm_cbe_tmp__186 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__185&18446744073709551615ull)) >> ((unsigned long long )(14ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__186&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = trunc i64 %%46 to i32, !dbg !23 for 0x%llxth hint within @filtez  --> \n", ++aesl_llvm_cbe_431_count);
  llvm_cbe_tmp__187 = (unsigned int )((unsigned int )llvm_cbe_tmp__186&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__187);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @filtez}\n");
  return llvm_cbe_tmp__187;
}


signed int filtep(signed int llvm_cbe_rlt1, signed int llvm_cbe_al1, signed int llvm_cbe_rlt2, signed int llvm_cbe_al2) {
  static  unsigned long long aesl_llvm_cbe_433_count = 0;
  static  unsigned long long aesl_llvm_cbe_434_count = 0;
  static  unsigned long long aesl_llvm_cbe_435_count = 0;
  static  unsigned long long aesl_llvm_cbe_436_count = 0;
  static  unsigned long long aesl_llvm_cbe_437_count = 0;
  static  unsigned long long aesl_llvm_cbe_438_count = 0;
  static  unsigned long long aesl_llvm_cbe_439_count = 0;
  static  unsigned long long aesl_llvm_cbe_440_count = 0;
  unsigned int llvm_cbe_tmp__188;
  static  unsigned long long aesl_llvm_cbe_441_count = 0;
  unsigned long long llvm_cbe_tmp__189;
  static  unsigned long long aesl_llvm_cbe_442_count = 0;
  static  unsigned long long aesl_llvm_cbe_443_count = 0;
  static  unsigned long long aesl_llvm_cbe_444_count = 0;
  unsigned long long llvm_cbe_tmp__190;
  static  unsigned long long aesl_llvm_cbe_445_count = 0;
  unsigned long long llvm_cbe_tmp__191;
  static  unsigned long long aesl_llvm_cbe_446_count = 0;
  static  unsigned long long aesl_llvm_cbe_447_count = 0;
  static  unsigned long long aesl_llvm_cbe_448_count = 0;
  static  unsigned long long aesl_llvm_cbe_449_count = 0;
  static  unsigned long long aesl_llvm_cbe_450_count = 0;
  unsigned int llvm_cbe_tmp__192;
  static  unsigned long long aesl_llvm_cbe_451_count = 0;
  unsigned long long llvm_cbe_tmp__193;
  static  unsigned long long aesl_llvm_cbe_452_count = 0;
  static  unsigned long long aesl_llvm_cbe_453_count = 0;
  unsigned long long llvm_cbe_tmp__194;
  static  unsigned long long aesl_llvm_cbe_454_count = 0;
  static  unsigned long long aesl_llvm_cbe_455_count = 0;
  unsigned long long llvm_cbe_tmp__195;
  static  unsigned long long aesl_llvm_cbe_456_count = 0;
  unsigned long long llvm_cbe_tmp__196;
  static  unsigned long long aesl_llvm_cbe_457_count = 0;
  static  unsigned long long aesl_llvm_cbe_458_count = 0;
  static  unsigned long long aesl_llvm_cbe_459_count = 0;
  static  unsigned long long aesl_llvm_cbe_460_count = 0;
  static  unsigned long long aesl_llvm_cbe_461_count = 0;
  unsigned long long llvm_cbe_tmp__197;
  static  unsigned long long aesl_llvm_cbe_462_count = 0;
  unsigned int llvm_cbe_tmp__198;
  static  unsigned long long aesl_llvm_cbe_463_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @filtep\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = shl nsw i32 %%rlt1, 1, !dbg !23 for 0x%llxth hint within @filtep  --> \n", ++aesl_llvm_cbe_440_count);
  llvm_cbe_tmp__188 = (unsigned int )llvm_cbe_rlt1 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__188);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i32 %%1 to i64, !dbg !23 for 0x%llxth hint within @filtep  --> \n", ++aesl_llvm_cbe_441_count);
  llvm_cbe_tmp__189 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__188);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__189);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = sext i32 %%al1 to i64, !dbg !24 for 0x%llxth hint within @filtep  --> \n", ++aesl_llvm_cbe_444_count);
  llvm_cbe_tmp__190 = (unsigned long long )((signed long long )(signed int )llvm_cbe_al1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__190);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = mul nsw i64 %%3, %%2, !dbg !24 for 0x%llxth hint within @filtep  --> \n", ++aesl_llvm_cbe_445_count);
  llvm_cbe_tmp__191 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__190&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__189&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__191&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = shl nsw i32 %%rlt2, 1, !dbg !23 for 0x%llxth hint within @filtep  --> \n", ++aesl_llvm_cbe_450_count);
  llvm_cbe_tmp__192 = (unsigned int )llvm_cbe_rlt2 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__192);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = sext i32 %%5 to i64, !dbg !23 for 0x%llxth hint within @filtep  --> \n", ++aesl_llvm_cbe_451_count);
  llvm_cbe_tmp__193 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__192);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__193);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = sext i32 %%al2 to i64, !dbg !23 for 0x%llxth hint within @filtep  --> \n", ++aesl_llvm_cbe_453_count);
  llvm_cbe_tmp__194 = (unsigned long long )((signed long long )(signed int )llvm_cbe_al2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__194);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = mul nsw i64 %%7, %%6, !dbg !23 for 0x%llxth hint within @filtep  --> \n", ++aesl_llvm_cbe_455_count);
  llvm_cbe_tmp__195 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__194&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__193&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__195&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add nsw i64 %%8, %%4, !dbg !23 for 0x%llxth hint within @filtep  --> \n", ++aesl_llvm_cbe_456_count);
  llvm_cbe_tmp__196 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__195&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__191&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__196&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = lshr i64 %%9, 15, !dbg !24 for 0x%llxth hint within @filtep  --> \n", ++aesl_llvm_cbe_461_count);
  llvm_cbe_tmp__197 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__196&18446744073709551615ull)) >> ((unsigned long long )(15ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__197&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = trunc i64 %%10 to i32, !dbg !24 for 0x%llxth hint within @filtep  --> \n", ++aesl_llvm_cbe_462_count);
  llvm_cbe_tmp__198 = (unsigned int )((unsigned int )llvm_cbe_tmp__197&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__198);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @filtep}\n");
  return llvm_cbe_tmp__198;
}


signed int quantl(signed int llvm_cbe_el, signed int llvm_cbe_detl) {
  static  unsigned long long aesl_llvm_cbe_464_count = 0;
  static  unsigned long long aesl_llvm_cbe_465_count = 0;
  static  unsigned long long aesl_llvm_cbe_466_count = 0;
  static  unsigned long long aesl_llvm_cbe_467_count = 0;
  static  unsigned long long aesl_llvm_cbe_468_count = 0;
  static  unsigned long long aesl_llvm_cbe_469_count = 0;
  unsigned int llvm_cbe_tmp__199;
  static  unsigned long long aesl_llvm_cbe_470_count = 0;
  unsigned long long llvm_cbe_tmp__200;
  static  unsigned long long aesl_llvm_cbe_471_count = 0;
  static  unsigned long long aesl_llvm_cbe_472_count = 0;
  static  unsigned long long aesl_llvm_cbe_473_count = 0;
  static  unsigned long long aesl_llvm_cbe_474_count = 0;
  unsigned long long llvm_cbe_tmp__201;
  static  unsigned long long aesl_llvm_cbe_475_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
  unsigned int llvm_cbe_storemerge;
  unsigned int llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_476_count = 0;
  static  unsigned long long aesl_llvm_cbe_477_count = 0;
  static  unsigned long long aesl_llvm_cbe_478_count = 0;
  static  unsigned long long aesl_llvm_cbe_479_count = 0;
  static  unsigned long long aesl_llvm_cbe_480_count = 0;
  static  unsigned long long aesl_llvm_cbe_481_count = 0;
  static  unsigned long long aesl_llvm_cbe_482_count = 0;
  static  unsigned long long aesl_llvm_cbe_483_count = 0;
  unsigned long long llvm_cbe_tmp__202;
  static  unsigned long long aesl_llvm_cbe_484_count = 0;
  signed int *llvm_cbe_tmp__203;
  static  unsigned long long aesl_llvm_cbe_485_count = 0;
  unsigned int llvm_cbe_tmp__204;
  static  unsigned long long aesl_llvm_cbe_486_count = 0;
  unsigned long long llvm_cbe_tmp__205;
  static  unsigned long long aesl_llvm_cbe_487_count = 0;
  unsigned long long llvm_cbe_tmp__206;
  static  unsigned long long aesl_llvm_cbe_488_count = 0;
  unsigned long long llvm_cbe_tmp__207;
  static  unsigned long long aesl_llvm_cbe_489_count = 0;
  static  unsigned long long aesl_llvm_cbe_490_count = 0;
  static  unsigned long long aesl_llvm_cbe_491_count = 0;
  static  unsigned long long aesl_llvm_cbe_492_count = 0;
  unsigned int llvm_cbe_tmp__208;
  static  unsigned long long aesl_llvm_cbe_493_count = 0;
  static  unsigned long long aesl_llvm_cbe_494_count = 0;
  static  unsigned long long aesl_llvm_cbe_495_count = 0;
  static  unsigned long long aesl_llvm_cbe_496_count = 0;
  static  unsigned long long aesl_llvm_cbe_497_count = 0;
  unsigned long long llvm_cbe_tmp__209;
  static  unsigned long long aesl_llvm_cbe_498_count = 0;
  signed int *llvm_cbe_tmp__210;
  static  unsigned long long aesl_llvm_cbe_499_count = 0;
  unsigned int llvm_cbe_tmp__211;
  static  unsigned long long aesl_llvm_cbe_500_count = 0;
  static  unsigned long long aesl_llvm_cbe_501_count = 0;
  static  unsigned long long aesl_llvm_cbe_502_count = 0;
  unsigned long long llvm_cbe_tmp__212;
  static  unsigned long long aesl_llvm_cbe_503_count = 0;
  signed int *llvm_cbe_tmp__213;
  static  unsigned long long aesl_llvm_cbe_504_count = 0;
  unsigned int llvm_cbe_tmp__214;
  static  unsigned long long aesl_llvm_cbe_505_count = 0;
  static  unsigned long long aesl_llvm_cbe_506_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_507_count = 0;
  static  unsigned long long aesl_llvm_cbe_508_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @quantl\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call i32 @abs(i32 %%el) nounwind readnone, !dbg !22 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_469_count);
  llvm_cbe_tmp__199 = (unsigned int ) /*tail*/ abs(llvm_cbe_el);
if (AESL_DEBUG_TRACE) {
printf("\nArgument el = 0x%X",llvm_cbe_el);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__199);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i32 %%1 to i64, !dbg !22 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_470_count);
  llvm_cbe_tmp__200 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__199);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__200);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = sext i32 %%detl to i64, !dbg !23 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_474_count);
  llvm_cbe_tmp__201 = (unsigned long long )((signed long long )(signed int )llvm_cbe_detl);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__201);
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__215;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__215:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i32 [ 0, %%0 ], [ %%14, %%6  for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = (unsigned int )llvm_cbe_storemerge__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge = 0x%X",llvm_cbe_storemerge);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__208);
}
  if ((((signed int )llvm_cbe_storemerge) < ((signed int )30u))) {
    goto llvm_cbe_tmp__216;
  } else {
    goto llvm_cbe_tmp__217;
  }

llvm_cbe_tmp__216:
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = sext i32 %%storemerge to i64, !dbg !23 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_483_count);
  llvm_cbe_tmp__202 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__202);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = getelementptr inbounds [30 x i32]* @decis_levl, i64 0, i64 %%7, !dbg !23 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_484_count);
  llvm_cbe_tmp__203 = (signed int *)(&decis_levl[(((signed long long )llvm_cbe_tmp__202))
#ifdef AESL_BC_SIM
 % 30
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__202));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__202) < 30)) fprintf(stderr, "%s:%d: warning: Read access out of array 'decis_levl' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = load i32* %%8, align 4, !dbg !23 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_485_count);
  llvm_cbe_tmp__204 = (unsigned int )*llvm_cbe_tmp__203;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__204);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = sext i32 %%9 to i64, !dbg !23 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_486_count);
  llvm_cbe_tmp__205 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__204);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__205);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = mul nsw i64 %%10, %%3, !dbg !23 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_487_count);
  llvm_cbe_tmp__206 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__205&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__201&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__206&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = ashr i64 %%11, 15, !dbg !23 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_488_count);
  llvm_cbe_tmp__207 = (unsigned long long )((signed long long )(((signed long long )llvm_cbe_tmp__206) >> ((signed long long )15ull)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((signed long long )llvm_cbe_tmp__207));
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = add nsw i32 %%storemerge, 1, !dbg !24 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_492_count);
  llvm_cbe_tmp__208 = (unsigned int )((unsigned int )(llvm_cbe_storemerge&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__208&4294967295ull)));
  if ((((signed long long )llvm_cbe_tmp__200) > ((signed long long )llvm_cbe_tmp__207))) {
    llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__208;   /* for PHI node */
    goto llvm_cbe_tmp__215;
  } else {
    goto llvm_cbe_tmp__217;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__217:
  if ((((signed int )llvm_cbe_el) > ((signed int )4294967295u))) {
    goto llvm_cbe_tmp__218;
  } else {
    goto llvm_cbe_tmp__219;
  }

llvm_cbe_tmp__218:
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = sext i32 %%storemerge to i64, !dbg !24 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_497_count);
  llvm_cbe_tmp__209 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__209);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = getelementptr inbounds [31 x i32]* @quant26bt_pos, i64 0, i64 %%18, !dbg !24 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_498_count);
  llvm_cbe_tmp__210 = (signed int *)(&quant26bt_pos[(((signed long long )llvm_cbe_tmp__209))
#ifdef AESL_BC_SIM
 % 31
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__209));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__209) < 31)) fprintf(stderr, "%s:%d: warning: Read access out of array 'quant26bt_pos' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = load i32* %%19, align 4, !dbg !24 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_499_count);
  llvm_cbe_tmp__211 = (unsigned int )*llvm_cbe_tmp__210;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__211);
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__211;   /* for PHI node */
  goto llvm_cbe_tmp__220;

llvm_cbe_tmp__219:
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = sext i32 %%storemerge to i64, !dbg !24 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_502_count);
  llvm_cbe_tmp__212 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__212);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = getelementptr inbounds [31 x i32]* @quant26bt_neg, i64 0, i64 %%22, !dbg !24 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_503_count);
  llvm_cbe_tmp__213 = (signed int *)(&quant26bt_neg[(((signed long long )llvm_cbe_tmp__212))
#ifdef AESL_BC_SIM
 % 31
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__212));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__212) < 31)) fprintf(stderr, "%s:%d: warning: Read access out of array 'quant26bt_neg' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = load i32* %%23, align 4, !dbg !24 for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_504_count);
  llvm_cbe_tmp__214 = (unsigned int )*llvm_cbe_tmp__213;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__214);
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__214;   /* for PHI node */
  goto llvm_cbe_tmp__220;

llvm_cbe_tmp__220:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%24, %%21 ], [ %%20, %%17  for 0x%llxth hint within @quantl  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__214);
printf("\n = 0x%X",llvm_cbe_tmp__211);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @quantl}\n");
  return llvm_cbe_storemerge1;
}


signed int logscl(signed int llvm_cbe_il, signed int llvm_cbe_nbl) {
  static  unsigned long long aesl_llvm_cbe_509_count = 0;
  static  unsigned long long aesl_llvm_cbe_510_count = 0;
  static  unsigned long long aesl_llvm_cbe_511_count = 0;
  static  unsigned long long aesl_llvm_cbe_512_count = 0;
  unsigned long long llvm_cbe_tmp__221;
  static  unsigned long long aesl_llvm_cbe_513_count = 0;
  unsigned long long llvm_cbe_tmp__222;
  static  unsigned long long aesl_llvm_cbe_514_count = 0;
  unsigned long long llvm_cbe_tmp__223;
  static  unsigned long long aesl_llvm_cbe_515_count = 0;
  static  unsigned long long aesl_llvm_cbe_516_count = 0;
  unsigned int llvm_cbe_tmp__224;
  static  unsigned long long aesl_llvm_cbe_517_count = 0;
  static  unsigned long long aesl_llvm_cbe_518_count = 0;
  unsigned int llvm_cbe_tmp__225;
  static  unsigned long long aesl_llvm_cbe_519_count = 0;
  unsigned long long llvm_cbe_tmp__226;
  static  unsigned long long aesl_llvm_cbe_520_count = 0;
  signed int *llvm_cbe_tmp__227;
  static  unsigned long long aesl_llvm_cbe_521_count = 0;
  unsigned int llvm_cbe_tmp__228;
  static  unsigned long long aesl_llvm_cbe_522_count = 0;
  unsigned int llvm_cbe_tmp__229;
  static  unsigned long long aesl_llvm_cbe_523_count = 0;
  static  unsigned long long aesl_llvm_cbe_524_count = 0;
  static  unsigned long long aesl_llvm_cbe_525_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned int llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe_526_count = 0;
  static  unsigned long long aesl_llvm_cbe_527_count = 0;
  static  unsigned long long aesl_llvm_cbe_528_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  static  unsigned long long aesl_llvm_cbe_529_count = 0;
  static  unsigned long long aesl_llvm_cbe_530_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @logscl\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = sext i32 %%nbl to i64, !dbg !23 for 0x%llxth hint within @logscl  --> \n", ++aesl_llvm_cbe_512_count);
  llvm_cbe_tmp__221 = (unsigned long long )((signed long long )(signed int )llvm_cbe_nbl);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__221);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = mul nsw i64 %%1, 127, !dbg !23 for 0x%llxth hint within @logscl  --> \n", ++aesl_llvm_cbe_513_count);
  llvm_cbe_tmp__222 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__221&18446744073709551615ull)) * ((unsigned long long )(127ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__222&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = lshr i64 %%2, 7, !dbg !23 for 0x%llxth hint within @logscl  --> \n", ++aesl_llvm_cbe_514_count);
  llvm_cbe_tmp__223 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__222&18446744073709551615ull)) >> ((unsigned long long )(7ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__223&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = trunc i64 %%3 to i32, !dbg !23 for 0x%llxth hint within @logscl  --> \n", ++aesl_llvm_cbe_516_count);
  llvm_cbe_tmp__224 = (unsigned int )((unsigned int )llvm_cbe_tmp__223&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__224);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = ashr i32 %%il, 2, !dbg !23 for 0x%llxth hint within @logscl  --> \n", ++aesl_llvm_cbe_518_count);
  llvm_cbe_tmp__225 = (unsigned int )((signed int )(((signed int )llvm_cbe_il) >> ((signed int )2u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__225));
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = sext i32 %%5 to i64, !dbg !23 for 0x%llxth hint within @logscl  --> \n", ++aesl_llvm_cbe_519_count);
  llvm_cbe_tmp__226 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__225);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__226);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = getelementptr inbounds [16 x i32]* @wl_code_table, i64 0, i64 %%6, !dbg !23 for 0x%llxth hint within @logscl  --> \n", ++aesl_llvm_cbe_520_count);
  llvm_cbe_tmp__227 = (signed int *)(&wl_code_table[(((signed long long )llvm_cbe_tmp__226))
#ifdef AESL_BC_SIM
 % 16
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__226));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__226) < 16)) fprintf(stderr, "%s:%d: warning: Read access out of array 'wl_code_table' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = load i32* %%7, align 4, !dbg !23 for 0x%llxth hint within @logscl  --> \n", ++aesl_llvm_cbe_521_count);
  llvm_cbe_tmp__228 = (unsigned int )*llvm_cbe_tmp__227;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__228);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add nsw i32 %%8, %%4, !dbg !23 for 0x%llxth hint within @logscl  --> \n", ++aesl_llvm_cbe_522_count);
  llvm_cbe_tmp__229 = (unsigned int )((unsigned int )(llvm_cbe_tmp__228&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__224&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__229&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%. = select i1 %%10, i32 0, i32 %%9, !dbg !23 for 0x%llxth hint within @logscl  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned int )(((((signed int )llvm_cbe_tmp__229) < ((signed int )0u))) ? ((unsigned int )0u) : ((unsigned int )llvm_cbe_tmp__229));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", llvm_cbe__2e_);
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = select i1 %%11, i32 18432, i32 %%., !dbg !23 for 0x%llxth hint within @logscl  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )(((((signed int )llvm_cbe__2e_) > ((signed int )18432u))) ? ((unsigned int )18432u) : ((unsigned int )llvm_cbe__2e_));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge1 = 0x%X\n", llvm_cbe_storemerge1);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @logscl}\n");
  return llvm_cbe_storemerge1;
}


signed int scalel(signed int llvm_cbe_nbl, signed int llvm_cbe_shift_constant) {
  static  unsigned long long aesl_llvm_cbe_531_count = 0;
  static  unsigned long long aesl_llvm_cbe_532_count = 0;
  static  unsigned long long aesl_llvm_cbe_533_count = 0;
  static  unsigned long long aesl_llvm_cbe_534_count = 0;
  static  unsigned long long aesl_llvm_cbe_535_count = 0;
  unsigned int llvm_cbe_tmp__230;
  static  unsigned long long aesl_llvm_cbe_536_count = 0;
  unsigned int llvm_cbe_tmp__231;
  static  unsigned long long aesl_llvm_cbe_537_count = 0;
  static  unsigned long long aesl_llvm_cbe_538_count = 0;
  static  unsigned long long aesl_llvm_cbe_539_count = 0;
  unsigned int llvm_cbe_tmp__232;
  static  unsigned long long aesl_llvm_cbe_540_count = 0;
  static  unsigned long long aesl_llvm_cbe_541_count = 0;
  static  unsigned long long aesl_llvm_cbe_542_count = 0;
  unsigned long long llvm_cbe_tmp__233;
  static  unsigned long long aesl_llvm_cbe_543_count = 0;
  signed int *llvm_cbe_tmp__234;
  static  unsigned long long aesl_llvm_cbe_544_count = 0;
  unsigned int llvm_cbe_tmp__235;
  static  unsigned long long aesl_llvm_cbe_545_count = 0;
  unsigned int llvm_cbe_tmp__236;
  static  unsigned long long aesl_llvm_cbe_546_count = 0;
  static  unsigned long long aesl_llvm_cbe_547_count = 0;
  unsigned int llvm_cbe_tmp__237;
  static  unsigned long long aesl_llvm_cbe_548_count = 0;
  unsigned int llvm_cbe_tmp__238;
  static  unsigned long long aesl_llvm_cbe_549_count = 0;
  static  unsigned long long aesl_llvm_cbe_550_count = 0;
  static  unsigned long long aesl_llvm_cbe_551_count = 0;
  unsigned int llvm_cbe_tmp__239;
  static  unsigned long long aesl_llvm_cbe_552_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @scalel\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = lshr i32 %%nbl, 6, !dbg !23 for 0x%llxth hint within @scalel  --> \n", ++aesl_llvm_cbe_535_count);
  llvm_cbe_tmp__230 = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_nbl&4294967295ull)) >> ((unsigned int )(6u&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__230&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = and i32 %%1, 31, !dbg !23 for 0x%llxth hint within @scalel  --> \n", ++aesl_llvm_cbe_536_count);
  llvm_cbe_tmp__231 = (unsigned int )llvm_cbe_tmp__230 & 31u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__231);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = ashr i32 %%nbl, 11, !dbg !23 for 0x%llxth hint within @scalel  --> \n", ++aesl_llvm_cbe_539_count);
  llvm_cbe_tmp__232 = (unsigned int )((signed int )(((signed int )llvm_cbe_nbl) >> ((signed int )11u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__232));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = zext i32 %%2 to i64, !dbg !23 for 0x%llxth hint within @scalel  --> \n", ++aesl_llvm_cbe_542_count);
  llvm_cbe_tmp__233 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__231&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__233);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = getelementptr inbounds [32 x i32]* @ilb_table, i64 0, i64 %%4, !dbg !23 for 0x%llxth hint within @scalel  --> \n", ++aesl_llvm_cbe_543_count);
  llvm_cbe_tmp__234 = (signed int *)(&ilb_table[(((signed long long )llvm_cbe_tmp__233))
#ifdef AESL_BC_SIM
 % 32
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__233));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__233) < 32)) fprintf(stderr, "%s:%d: warning: Read access out of array 'ilb_table' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = load i32* %%5, align 4, !dbg !23 for 0x%llxth hint within @scalel  --> \n", ++aesl_llvm_cbe_544_count);
  llvm_cbe_tmp__235 = (unsigned int )*llvm_cbe_tmp__234;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__235);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = add nsw i32 %%shift_constant, 1, !dbg !23 for 0x%llxth hint within @scalel  --> \n", ++aesl_llvm_cbe_545_count);
  llvm_cbe_tmp__236 = (unsigned int )((unsigned int )(llvm_cbe_shift_constant&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__236&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = sub i32 %%7, %%3, !dbg !23 for 0x%llxth hint within @scalel  --> \n", ++aesl_llvm_cbe_547_count);
  llvm_cbe_tmp__237 = (unsigned int )((unsigned int )(llvm_cbe_tmp__236&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__232&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__237&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = ashr i32 %%6, %%8, !dbg !23 for 0x%llxth hint within @scalel  --> \n", ++aesl_llvm_cbe_548_count);
  llvm_cbe_tmp__238 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__235) >> ((signed int )llvm_cbe_tmp__237)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__238));
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = shl i32 %%9, 3, !dbg !23 for 0x%llxth hint within @scalel  --> \n", ++aesl_llvm_cbe_551_count);
  llvm_cbe_tmp__239 = (unsigned int )llvm_cbe_tmp__238 << 3u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__239);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @scalel}\n");
  return llvm_cbe_tmp__239;
}


void upzero(signed int llvm_cbe_dlt, signed int *llvm_cbe_dlti, signed int *llvm_cbe_bli) {
  static  unsigned long long aesl_llvm_cbe_553_count = 0;
  static  unsigned long long aesl_llvm_cbe_554_count = 0;
  static  unsigned long long aesl_llvm_cbe_555_count = 0;
  static  unsigned long long aesl_llvm_cbe_556_count = 0;
  static  unsigned long long aesl_llvm_cbe_557_count = 0;
  static  unsigned long long aesl_llvm_cbe_558_count = 0;
  static  unsigned long long aesl_llvm_cbe_559_count = 0;
  static  unsigned long long aesl_llvm_cbe_560_count = 0;
  static  unsigned long long aesl_llvm_cbe_561_count = 0;
  static  unsigned long long aesl_llvm_cbe_562_count = 0;
  static  unsigned long long aesl_llvm_cbe_563_count = 0;
  static  unsigned long long aesl_llvm_cbe_564_count = 0;
  static  unsigned long long aesl_llvm_cbe_565_count = 0;
  static  unsigned long long aesl_llvm_cbe_566_count = 0;
  static  unsigned long long aesl_llvm_cbe_567_count = 0;
  static  unsigned long long aesl_llvm_cbe_568_count = 0;
  static  unsigned long long aesl_llvm_cbe_569_count = 0;
  static  unsigned long long aesl_llvm_cbe_570_count = 0;
  static  unsigned long long aesl_llvm_cbe_571_count = 0;
  static  unsigned long long aesl_llvm_cbe_572_count = 0;
  static  unsigned long long aesl_llvm_cbe_573_count = 0;
  static  unsigned long long aesl_llvm_cbe_574_count = 0;
  static  unsigned long long aesl_llvm_cbe_575_count = 0;
  static  unsigned long long aesl_llvm_cbe_576_count = 0;
  static  unsigned long long aesl_llvm_cbe_577_count = 0;
  static  unsigned long long aesl_llvm_cbe_578_count = 0;
  static  unsigned long long aesl_llvm_cbe_579_count = 0;
  static  unsigned long long aesl_llvm_cbe_580_count = 0;
  static  unsigned long long aesl_llvm_cbe_581_count = 0;
  static  unsigned long long aesl_llvm_cbe_582_count = 0;
  static  unsigned long long aesl_llvm_cbe_583_count = 0;
  static  unsigned long long aesl_llvm_cbe_584_count = 0;
  static  unsigned long long aesl_llvm_cbe_585_count = 0;
  static  unsigned long long aesl_llvm_cbe_586_count = 0;
  unsigned int llvm_cbe_tmp__240;
  static  unsigned long long aesl_llvm_cbe_587_count = 0;
  unsigned long long llvm_cbe_tmp__241;
  static  unsigned long long aesl_llvm_cbe_588_count = 0;
  unsigned long long llvm_cbe_tmp__242;
  static  unsigned long long aesl_llvm_cbe_589_count = 0;
  unsigned long long llvm_cbe_tmp__243;
  static  unsigned long long aesl_llvm_cbe_590_count = 0;
  unsigned int llvm_cbe_tmp__244;
  static  unsigned long long aesl_llvm_cbe_591_count = 0;
  static  unsigned long long aesl_llvm_cbe_592_count = 0;
  static  unsigned long long aesl_llvm_cbe_593_count = 0;
  static  unsigned long long aesl_llvm_cbe_594_count = 0;
  static  unsigned long long aesl_llvm_cbe_595_count = 0;
  static  unsigned long long aesl_llvm_cbe_596_count = 0;
  static  unsigned long long aesl_llvm_cbe_597_count = 0;
  static  unsigned long long aesl_llvm_cbe_598_count = 0;
  static  unsigned long long aesl_llvm_cbe_599_count = 0;
  static  unsigned long long aesl_llvm_cbe_600_count = 0;
  static  unsigned long long aesl_llvm_cbe_601_count = 0;
  static  unsigned long long aesl_llvm_cbe_602_count = 0;
  signed int *llvm_cbe_tmp__245;
  static  unsigned long long aesl_llvm_cbe_603_count = 0;
  unsigned int llvm_cbe_tmp__246;
  static  unsigned long long aesl_llvm_cbe_604_count = 0;
  unsigned long long llvm_cbe_tmp__247;
  static  unsigned long long aesl_llvm_cbe_605_count = 0;
  unsigned long long llvm_cbe_tmp__248;
  static  unsigned long long aesl_llvm_cbe_606_count = 0;
  unsigned long long llvm_cbe_tmp__249;
  static  unsigned long long aesl_llvm_cbe_607_count = 0;
  unsigned int llvm_cbe_tmp__250;
  static  unsigned long long aesl_llvm_cbe_608_count = 0;
  static  unsigned long long aesl_llvm_cbe_609_count = 0;
  static  unsigned long long aesl_llvm_cbe_610_count = 0;
  static  unsigned long long aesl_llvm_cbe_611_count = 0;
  static  unsigned long long aesl_llvm_cbe_612_count = 0;
  static  unsigned long long aesl_llvm_cbe_613_count = 0;
  static  unsigned long long aesl_llvm_cbe_614_count = 0;
  static  unsigned long long aesl_llvm_cbe_615_count = 0;
  static  unsigned long long aesl_llvm_cbe_616_count = 0;
  static  unsigned long long aesl_llvm_cbe_617_count = 0;
  static  unsigned long long aesl_llvm_cbe_618_count = 0;
  static  unsigned long long aesl_llvm_cbe_619_count = 0;
  signed int *llvm_cbe_tmp__251;
  static  unsigned long long aesl_llvm_cbe_620_count = 0;
  unsigned int llvm_cbe_tmp__252;
  static  unsigned long long aesl_llvm_cbe_621_count = 0;
  unsigned long long llvm_cbe_tmp__253;
  static  unsigned long long aesl_llvm_cbe_622_count = 0;
  unsigned long long llvm_cbe_tmp__254;
  static  unsigned long long aesl_llvm_cbe_623_count = 0;
  unsigned long long llvm_cbe_tmp__255;
  static  unsigned long long aesl_llvm_cbe_624_count = 0;
  unsigned int llvm_cbe_tmp__256;
  static  unsigned long long aesl_llvm_cbe_625_count = 0;
  static  unsigned long long aesl_llvm_cbe_626_count = 0;
  static  unsigned long long aesl_llvm_cbe_627_count = 0;
  static  unsigned long long aesl_llvm_cbe_628_count = 0;
  static  unsigned long long aesl_llvm_cbe_629_count = 0;
  static  unsigned long long aesl_llvm_cbe_630_count = 0;
  static  unsigned long long aesl_llvm_cbe_631_count = 0;
  static  unsigned long long aesl_llvm_cbe_632_count = 0;
  static  unsigned long long aesl_llvm_cbe_633_count = 0;
  static  unsigned long long aesl_llvm_cbe_634_count = 0;
  static  unsigned long long aesl_llvm_cbe_635_count = 0;
  static  unsigned long long aesl_llvm_cbe_636_count = 0;
  signed int *llvm_cbe_tmp__257;
  static  unsigned long long aesl_llvm_cbe_637_count = 0;
  unsigned int llvm_cbe_tmp__258;
  static  unsigned long long aesl_llvm_cbe_638_count = 0;
  unsigned long long llvm_cbe_tmp__259;
  static  unsigned long long aesl_llvm_cbe_639_count = 0;
  unsigned long long llvm_cbe_tmp__260;
  static  unsigned long long aesl_llvm_cbe_640_count = 0;
  unsigned long long llvm_cbe_tmp__261;
  static  unsigned long long aesl_llvm_cbe_641_count = 0;
  unsigned int llvm_cbe_tmp__262;
  static  unsigned long long aesl_llvm_cbe_642_count = 0;
  static  unsigned long long aesl_llvm_cbe_643_count = 0;
  static  unsigned long long aesl_llvm_cbe_644_count = 0;
  static  unsigned long long aesl_llvm_cbe_645_count = 0;
  static  unsigned long long aesl_llvm_cbe_646_count = 0;
  static  unsigned long long aesl_llvm_cbe_647_count = 0;
  static  unsigned long long aesl_llvm_cbe_648_count = 0;
  static  unsigned long long aesl_llvm_cbe_649_count = 0;
  static  unsigned long long aesl_llvm_cbe_650_count = 0;
  static  unsigned long long aesl_llvm_cbe_651_count = 0;
  static  unsigned long long aesl_llvm_cbe_652_count = 0;
  static  unsigned long long aesl_llvm_cbe_653_count = 0;
  signed int *llvm_cbe_tmp__263;
  static  unsigned long long aesl_llvm_cbe_654_count = 0;
  unsigned int llvm_cbe_tmp__264;
  static  unsigned long long aesl_llvm_cbe_655_count = 0;
  unsigned long long llvm_cbe_tmp__265;
  static  unsigned long long aesl_llvm_cbe_656_count = 0;
  unsigned long long llvm_cbe_tmp__266;
  static  unsigned long long aesl_llvm_cbe_657_count = 0;
  unsigned long long llvm_cbe_tmp__267;
  static  unsigned long long aesl_llvm_cbe_658_count = 0;
  unsigned int llvm_cbe_tmp__268;
  static  unsigned long long aesl_llvm_cbe_659_count = 0;
  static  unsigned long long aesl_llvm_cbe_660_count = 0;
  static  unsigned long long aesl_llvm_cbe_661_count = 0;
  static  unsigned long long aesl_llvm_cbe_662_count = 0;
  static  unsigned long long aesl_llvm_cbe_663_count = 0;
  static  unsigned long long aesl_llvm_cbe_664_count = 0;
  static  unsigned long long aesl_llvm_cbe_665_count = 0;
  static  unsigned long long aesl_llvm_cbe_666_count = 0;
  static  unsigned long long aesl_llvm_cbe_667_count = 0;
  static  unsigned long long aesl_llvm_cbe_668_count = 0;
  static  unsigned long long aesl_llvm_cbe_669_count = 0;
  static  unsigned long long aesl_llvm_cbe_670_count = 0;
  signed int *llvm_cbe_tmp__269;
  static  unsigned long long aesl_llvm_cbe_671_count = 0;
  unsigned int llvm_cbe_tmp__270;
  static  unsigned long long aesl_llvm_cbe_672_count = 0;
  unsigned long long llvm_cbe_tmp__271;
  static  unsigned long long aesl_llvm_cbe_673_count = 0;
  unsigned long long llvm_cbe_tmp__272;
  static  unsigned long long aesl_llvm_cbe_674_count = 0;
  unsigned long long llvm_cbe_tmp__273;
  static  unsigned long long aesl_llvm_cbe_675_count = 0;
  unsigned int llvm_cbe_tmp__274;
  static  unsigned long long aesl_llvm_cbe_676_count = 0;
  static  unsigned long long aesl_llvm_cbe_677_count = 0;
  static  unsigned long long aesl_llvm_cbe_678_count = 0;
  static  unsigned long long aesl_llvm_cbe_679_count = 0;
  static  unsigned long long aesl_llvm_cbe_680_count = 0;
  static  unsigned long long aesl_llvm_cbe_681_count = 0;
  static  unsigned long long aesl_llvm_cbe_682_count = 0;
  static  unsigned long long aesl_llvm_cbe_683_count = 0;
  static  unsigned long long aesl_llvm_cbe_684_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_695_count = 0;
  static  unsigned long long aesl_llvm_cbe_696_count = 0;
  static  unsigned long long aesl_llvm_cbe_697_count = 0;
  unsigned long long llvm_cbe_tmp__275;
  static  unsigned long long aesl_llvm_cbe_698_count = 0;
  unsigned int llvm_cbe_tmp__276;
  static  unsigned long long aesl_llvm_cbe_699_count = 0;
  unsigned long long llvm_cbe_tmp__277;
  static  unsigned long long aesl_llvm_cbe_700_count = 0;
  unsigned long long llvm_cbe_tmp__278;
  static  unsigned long long aesl_llvm_cbe_701_count = 0;
  static  unsigned long long aesl_llvm_cbe_702_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  static  unsigned long long aesl_llvm_cbe_703_count = 0;
  static  unsigned long long aesl_llvm_cbe_704_count = 0;
  unsigned int llvm_cbe_tmp__279;
  static  unsigned long long aesl_llvm_cbe_705_count = 0;
  unsigned long long llvm_cbe_tmp__280;
  static  unsigned long long aesl_llvm_cbe_706_count = 0;
  unsigned long long llvm_cbe_tmp__281;
  static  unsigned long long aesl_llvm_cbe_707_count = 0;
  unsigned long long llvm_cbe_tmp__282;
  static  unsigned long long aesl_llvm_cbe_708_count = 0;
  unsigned int llvm_cbe_tmp__283;
  static  unsigned long long aesl_llvm_cbe_709_count = 0;
  static  unsigned long long aesl_llvm_cbe_710_count = 0;
  static  unsigned long long aesl_llvm_cbe_711_count = 0;
  unsigned int llvm_cbe_tmp__284;
  static  unsigned long long aesl_llvm_cbe_712_count = 0;
  static  unsigned long long aesl_llvm_cbe_713_count = 0;
  static  unsigned long long aesl_llvm_cbe_714_count = 0;
  static  unsigned long long aesl_llvm_cbe_715_count = 0;
  static  unsigned long long aesl_llvm_cbe_716_count = 0;
  static  unsigned long long aesl_llvm_cbe_717_count = 0;
  static  unsigned long long aesl_llvm_cbe_718_count = 0;
  static  unsigned long long aesl_llvm_cbe_719_count = 0;
  static  unsigned long long aesl_llvm_cbe_720_count = 0;
  static  unsigned long long aesl_llvm_cbe_721_count = 0;
  static  unsigned long long aesl_llvm_cbe_722_count = 0;
  static  unsigned long long aesl_llvm_cbe_723_count = 0;
  signed int *llvm_cbe_tmp__285;
  static  unsigned long long aesl_llvm_cbe_724_count = 0;
  unsigned int llvm_cbe_tmp__286;
  static  unsigned long long aesl_llvm_cbe_725_count = 0;
  unsigned long long llvm_cbe_tmp__287;
  static  unsigned long long aesl_llvm_cbe_726_count = 0;
  unsigned long long llvm_cbe_tmp__288;
  static  unsigned long long aesl_llvm_cbe_727_count = 0;
  static  unsigned long long aesl_llvm_cbe_728_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_2e_1_count = 0;
  unsigned int llvm_cbe_storemerge1_2e_1;
  static  unsigned long long aesl_llvm_cbe_729_count = 0;
  static  unsigned long long aesl_llvm_cbe_730_count = 0;
  signed int *llvm_cbe_tmp__289;
  static  unsigned long long aesl_llvm_cbe_731_count = 0;
  unsigned int llvm_cbe_tmp__290;
  static  unsigned long long aesl_llvm_cbe_732_count = 0;
  unsigned long long llvm_cbe_tmp__291;
  static  unsigned long long aesl_llvm_cbe_733_count = 0;
  unsigned long long llvm_cbe_tmp__292;
  static  unsigned long long aesl_llvm_cbe_734_count = 0;
  unsigned long long llvm_cbe_tmp__293;
  static  unsigned long long aesl_llvm_cbe_735_count = 0;
  unsigned int llvm_cbe_tmp__294;
  static  unsigned long long aesl_llvm_cbe_736_count = 0;
  static  unsigned long long aesl_llvm_cbe_737_count = 0;
  static  unsigned long long aesl_llvm_cbe_738_count = 0;
  unsigned int llvm_cbe_tmp__295;
  static  unsigned long long aesl_llvm_cbe_739_count = 0;
  static  unsigned long long aesl_llvm_cbe_740_count = 0;
  static  unsigned long long aesl_llvm_cbe_741_count = 0;
  static  unsigned long long aesl_llvm_cbe_742_count = 0;
  static  unsigned long long aesl_llvm_cbe_743_count = 0;
  static  unsigned long long aesl_llvm_cbe_744_count = 0;
  static  unsigned long long aesl_llvm_cbe_745_count = 0;
  static  unsigned long long aesl_llvm_cbe_746_count = 0;
  static  unsigned long long aesl_llvm_cbe_747_count = 0;
  static  unsigned long long aesl_llvm_cbe_748_count = 0;
  static  unsigned long long aesl_llvm_cbe_749_count = 0;
  static  unsigned long long aesl_llvm_cbe_750_count = 0;
  signed int *llvm_cbe_tmp__296;
  static  unsigned long long aesl_llvm_cbe_751_count = 0;
  unsigned int llvm_cbe_tmp__297;
  static  unsigned long long aesl_llvm_cbe_752_count = 0;
  unsigned long long llvm_cbe_tmp__298;
  static  unsigned long long aesl_llvm_cbe_753_count = 0;
  unsigned long long llvm_cbe_tmp__299;
  static  unsigned long long aesl_llvm_cbe_754_count = 0;
  static  unsigned long long aesl_llvm_cbe_755_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_2e_2_count = 0;
  unsigned int llvm_cbe_storemerge1_2e_2;
  static  unsigned long long aesl_llvm_cbe_756_count = 0;
  static  unsigned long long aesl_llvm_cbe_757_count = 0;
  signed int *llvm_cbe_tmp__300;
  static  unsigned long long aesl_llvm_cbe_758_count = 0;
  unsigned int llvm_cbe_tmp__301;
  static  unsigned long long aesl_llvm_cbe_759_count = 0;
  unsigned long long llvm_cbe_tmp__302;
  static  unsigned long long aesl_llvm_cbe_760_count = 0;
  unsigned long long llvm_cbe_tmp__303;
  static  unsigned long long aesl_llvm_cbe_761_count = 0;
  unsigned long long llvm_cbe_tmp__304;
  static  unsigned long long aesl_llvm_cbe_762_count = 0;
  unsigned int llvm_cbe_tmp__305;
  static  unsigned long long aesl_llvm_cbe_763_count = 0;
  static  unsigned long long aesl_llvm_cbe_764_count = 0;
  static  unsigned long long aesl_llvm_cbe_765_count = 0;
  unsigned int llvm_cbe_tmp__306;
  static  unsigned long long aesl_llvm_cbe_766_count = 0;
  static  unsigned long long aesl_llvm_cbe_767_count = 0;
  static  unsigned long long aesl_llvm_cbe_768_count = 0;
  static  unsigned long long aesl_llvm_cbe_769_count = 0;
  static  unsigned long long aesl_llvm_cbe_770_count = 0;
  static  unsigned long long aesl_llvm_cbe_771_count = 0;
  static  unsigned long long aesl_llvm_cbe_772_count = 0;
  static  unsigned long long aesl_llvm_cbe_773_count = 0;
  static  unsigned long long aesl_llvm_cbe_774_count = 0;
  static  unsigned long long aesl_llvm_cbe_775_count = 0;
  static  unsigned long long aesl_llvm_cbe_776_count = 0;
  static  unsigned long long aesl_llvm_cbe_777_count = 0;
  signed int *llvm_cbe_tmp__307;
  static  unsigned long long aesl_llvm_cbe_778_count = 0;
  unsigned int llvm_cbe_tmp__308;
  static  unsigned long long aesl_llvm_cbe_779_count = 0;
  unsigned long long llvm_cbe_tmp__309;
  static  unsigned long long aesl_llvm_cbe_780_count = 0;
  unsigned long long llvm_cbe_tmp__310;
  static  unsigned long long aesl_llvm_cbe_781_count = 0;
  static  unsigned long long aesl_llvm_cbe_782_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_2e_3_count = 0;
  unsigned int llvm_cbe_storemerge1_2e_3;
  static  unsigned long long aesl_llvm_cbe_783_count = 0;
  static  unsigned long long aesl_llvm_cbe_784_count = 0;
  signed int *llvm_cbe_tmp__311;
  static  unsigned long long aesl_llvm_cbe_785_count = 0;
  unsigned int llvm_cbe_tmp__312;
  static  unsigned long long aesl_llvm_cbe_786_count = 0;
  unsigned long long llvm_cbe_tmp__313;
  static  unsigned long long aesl_llvm_cbe_787_count = 0;
  unsigned long long llvm_cbe_tmp__314;
  static  unsigned long long aesl_llvm_cbe_788_count = 0;
  unsigned long long llvm_cbe_tmp__315;
  static  unsigned long long aesl_llvm_cbe_789_count = 0;
  unsigned int llvm_cbe_tmp__316;
  static  unsigned long long aesl_llvm_cbe_790_count = 0;
  static  unsigned long long aesl_llvm_cbe_791_count = 0;
  static  unsigned long long aesl_llvm_cbe_792_count = 0;
  unsigned int llvm_cbe_tmp__317;
  static  unsigned long long aesl_llvm_cbe_793_count = 0;
  static  unsigned long long aesl_llvm_cbe_794_count = 0;
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
  signed int *llvm_cbe_tmp__318;
  static  unsigned long long aesl_llvm_cbe_805_count = 0;
  unsigned int llvm_cbe_tmp__319;
  static  unsigned long long aesl_llvm_cbe_806_count = 0;
  unsigned long long llvm_cbe_tmp__320;
  static  unsigned long long aesl_llvm_cbe_807_count = 0;
  unsigned long long llvm_cbe_tmp__321;
  static  unsigned long long aesl_llvm_cbe_808_count = 0;
  static  unsigned long long aesl_llvm_cbe_809_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_2e_4_count = 0;
  unsigned int llvm_cbe_storemerge1_2e_4;
  static  unsigned long long aesl_llvm_cbe_810_count = 0;
  static  unsigned long long aesl_llvm_cbe_811_count = 0;
  signed int *llvm_cbe_tmp__322;
  static  unsigned long long aesl_llvm_cbe_812_count = 0;
  unsigned int llvm_cbe_tmp__323;
  static  unsigned long long aesl_llvm_cbe_813_count = 0;
  unsigned long long llvm_cbe_tmp__324;
  static  unsigned long long aesl_llvm_cbe_814_count = 0;
  unsigned long long llvm_cbe_tmp__325;
  static  unsigned long long aesl_llvm_cbe_815_count = 0;
  unsigned long long llvm_cbe_tmp__326;
  static  unsigned long long aesl_llvm_cbe_816_count = 0;
  unsigned int llvm_cbe_tmp__327;
  static  unsigned long long aesl_llvm_cbe_817_count = 0;
  static  unsigned long long aesl_llvm_cbe_818_count = 0;
  static  unsigned long long aesl_llvm_cbe_819_count = 0;
  unsigned int llvm_cbe_tmp__328;
  static  unsigned long long aesl_llvm_cbe_820_count = 0;
  static  unsigned long long aesl_llvm_cbe_821_count = 0;
  static  unsigned long long aesl_llvm_cbe_822_count = 0;
  static  unsigned long long aesl_llvm_cbe_823_count = 0;
  static  unsigned long long aesl_llvm_cbe_824_count = 0;
  static  unsigned long long aesl_llvm_cbe_825_count = 0;
  static  unsigned long long aesl_llvm_cbe_826_count = 0;
  static  unsigned long long aesl_llvm_cbe_827_count = 0;
  static  unsigned long long aesl_llvm_cbe_828_count = 0;
  static  unsigned long long aesl_llvm_cbe_829_count = 0;
  static  unsigned long long aesl_llvm_cbe_830_count = 0;
  static  unsigned long long aesl_llvm_cbe_831_count = 0;
  signed int *llvm_cbe_tmp__329;
  static  unsigned long long aesl_llvm_cbe_832_count = 0;
  unsigned int llvm_cbe_tmp__330;
  static  unsigned long long aesl_llvm_cbe_833_count = 0;
  unsigned long long llvm_cbe_tmp__331;
  static  unsigned long long aesl_llvm_cbe_834_count = 0;
  unsigned long long llvm_cbe_tmp__332;
  static  unsigned long long aesl_llvm_cbe_835_count = 0;
  static  unsigned long long aesl_llvm_cbe_836_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_2e_5_count = 0;
  unsigned int llvm_cbe_storemerge1_2e_5;
  static  unsigned long long aesl_llvm_cbe_837_count = 0;
  static  unsigned long long aesl_llvm_cbe_838_count = 0;
  signed int *llvm_cbe_tmp__333;
  static  unsigned long long aesl_llvm_cbe_839_count = 0;
  unsigned int llvm_cbe_tmp__334;
  static  unsigned long long aesl_llvm_cbe_840_count = 0;
  unsigned long long llvm_cbe_tmp__335;
  static  unsigned long long aesl_llvm_cbe_841_count = 0;
  unsigned long long llvm_cbe_tmp__336;
  static  unsigned long long aesl_llvm_cbe_842_count = 0;
  unsigned long long llvm_cbe_tmp__337;
  static  unsigned long long aesl_llvm_cbe_843_count = 0;
  unsigned int llvm_cbe_tmp__338;
  static  unsigned long long aesl_llvm_cbe_844_count = 0;
  static  unsigned long long aesl_llvm_cbe_845_count = 0;
  static  unsigned long long aesl_llvm_cbe_846_count = 0;
  unsigned int llvm_cbe_tmp__339;
  static  unsigned long long aesl_llvm_cbe_847_count = 0;
  static  unsigned long long aesl_llvm_cbe_848_count = 0;
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
  signed int *llvm_cbe_tmp__340;
  static  unsigned long long aesl_llvm_cbe_860_count = 0;
  unsigned int llvm_cbe_tmp__341;
  static  unsigned long long aesl_llvm_cbe_861_count = 0;
  signed int *llvm_cbe_tmp__342;
  static  unsigned long long aesl_llvm_cbe_862_count = 0;
  static  unsigned long long aesl_llvm_cbe_863_count = 0;
  signed int *llvm_cbe_tmp__343;
  static  unsigned long long aesl_llvm_cbe_864_count = 0;
  unsigned int llvm_cbe_tmp__344;
  static  unsigned long long aesl_llvm_cbe_865_count = 0;
  static  unsigned long long aesl_llvm_cbe_866_count = 0;
  signed int *llvm_cbe_tmp__345;
  static  unsigned long long aesl_llvm_cbe_867_count = 0;
  unsigned int llvm_cbe_tmp__346;
  static  unsigned long long aesl_llvm_cbe_868_count = 0;
  static  unsigned long long aesl_llvm_cbe_869_count = 0;
  signed int *llvm_cbe_tmp__347;
  static  unsigned long long aesl_llvm_cbe_870_count = 0;
  unsigned int llvm_cbe_tmp__348;
  static  unsigned long long aesl_llvm_cbe_871_count = 0;
  static  unsigned long long aesl_llvm_cbe_872_count = 0;
  unsigned int llvm_cbe_tmp__349;
  static  unsigned long long aesl_llvm_cbe_873_count = 0;
  static  unsigned long long aesl_llvm_cbe_874_count = 0;
  static  unsigned long long aesl_llvm_cbe_875_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @upzero\n");
  if (((llvm_cbe_dlt&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe__2e_preheader4;
  } else {
    goto llvm_cbe__2e_preheader;
  }

llvm_cbe__2e_preheader4:
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = load i32* %%bli, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_586_count);
  llvm_cbe_tmp__240 = (unsigned int )*llvm_cbe_bli;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__240);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = sext i32 %%2 to i64, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_587_count);
  llvm_cbe_tmp__241 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__240);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__241);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = mul nsw i64 %%3, 255, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_588_count);
  llvm_cbe_tmp__242 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__241&18446744073709551615ull)) * ((unsigned long long )(255ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__242&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = lshr i64 %%4, 8, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_589_count);
  llvm_cbe_tmp__243 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__242&18446744073709551615ull)) >> ((unsigned long long )(8ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__243&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = trunc i64 %%5 to i32, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_590_count);
  llvm_cbe_tmp__244 = (unsigned int )((unsigned int )llvm_cbe_tmp__243&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__244);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%6, i32* %%bli, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_591_count);
  *llvm_cbe_bli = llvm_cbe_tmp__244;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__244);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = getelementptr inbounds i32* %%bli, i64 1, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_602_count);
  llvm_cbe_tmp__245 = (signed int *)(&llvm_cbe_bli[(((signed long long )1ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = load i32* %%7, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_603_count);
  llvm_cbe_tmp__246 = (unsigned int )*llvm_cbe_tmp__245;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__246);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = sext i32 %%8 to i64, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_604_count);
  llvm_cbe_tmp__247 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__246);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__247);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = mul nsw i64 %%9, 255, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_605_count);
  llvm_cbe_tmp__248 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__247&18446744073709551615ull)) * ((unsigned long long )(255ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__248&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = lshr i64 %%10, 8, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_606_count);
  llvm_cbe_tmp__249 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__248&18446744073709551615ull)) >> ((unsigned long long )(8ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__249&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = trunc i64 %%11 to i32, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_607_count);
  llvm_cbe_tmp__250 = (unsigned int )((unsigned int )llvm_cbe_tmp__249&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__250);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%12, i32* %%7, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_608_count);
  *llvm_cbe_tmp__245 = llvm_cbe_tmp__250;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__250);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = getelementptr inbounds i32* %%bli, i64 2, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_619_count);
  llvm_cbe_tmp__251 = (signed int *)(&llvm_cbe_bli[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = load i32* %%13, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_620_count);
  llvm_cbe_tmp__252 = (unsigned int )*llvm_cbe_tmp__251;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__252);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = sext i32 %%14 to i64, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_621_count);
  llvm_cbe_tmp__253 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__252);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__253);
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = mul nsw i64 %%15, 255, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_622_count);
  llvm_cbe_tmp__254 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__253&18446744073709551615ull)) * ((unsigned long long )(255ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__254&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = lshr i64 %%16, 8, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_623_count);
  llvm_cbe_tmp__255 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__254&18446744073709551615ull)) >> ((unsigned long long )(8ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__255&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = trunc i64 %%17 to i32, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_624_count);
  llvm_cbe_tmp__256 = (unsigned int )((unsigned int )llvm_cbe_tmp__255&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__256);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%18, i32* %%13, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_625_count);
  *llvm_cbe_tmp__251 = llvm_cbe_tmp__256;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__256);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = getelementptr inbounds i32* %%bli, i64 3, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_636_count);
  llvm_cbe_tmp__257 = (signed int *)(&llvm_cbe_bli[(((signed long long )3ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = load i32* %%19, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_637_count);
  llvm_cbe_tmp__258 = (unsigned int )*llvm_cbe_tmp__257;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__258);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = sext i32 %%20 to i64, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_638_count);
  llvm_cbe_tmp__259 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__258);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__259);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = mul nsw i64 %%21, 255, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_639_count);
  llvm_cbe_tmp__260 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__259&18446744073709551615ull)) * ((unsigned long long )(255ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__260&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = lshr i64 %%22, 8, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_640_count);
  llvm_cbe_tmp__261 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__260&18446744073709551615ull)) >> ((unsigned long long )(8ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__261&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = trunc i64 %%23 to i32, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_641_count);
  llvm_cbe_tmp__262 = (unsigned int )((unsigned int )llvm_cbe_tmp__261&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__262);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%24, i32* %%19, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_642_count);
  *llvm_cbe_tmp__257 = llvm_cbe_tmp__262;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__262);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds i32* %%bli, i64 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_653_count);
  llvm_cbe_tmp__263 = (signed int *)(&llvm_cbe_bli[(((signed long long )4ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = load i32* %%25, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_654_count);
  llvm_cbe_tmp__264 = (unsigned int )*llvm_cbe_tmp__263;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__264);
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = sext i32 %%26 to i64, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_655_count);
  llvm_cbe_tmp__265 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__264);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__265);
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = mul nsw i64 %%27, 255, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_656_count);
  llvm_cbe_tmp__266 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__265&18446744073709551615ull)) * ((unsigned long long )(255ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__266&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = lshr i64 %%28, 8, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_657_count);
  llvm_cbe_tmp__267 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__266&18446744073709551615ull)) >> ((unsigned long long )(8ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__267&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = trunc i64 %%29 to i32, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_658_count);
  llvm_cbe_tmp__268 = (unsigned int )((unsigned int )llvm_cbe_tmp__267&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__268);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%30, i32* %%25, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_659_count);
  *llvm_cbe_tmp__263 = llvm_cbe_tmp__268;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__268);
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = getelementptr inbounds i32* %%bli, i64 5, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_670_count);
  llvm_cbe_tmp__269 = (signed int *)(&llvm_cbe_bli[(((signed long long )5ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = load i32* %%31, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_671_count);
  llvm_cbe_tmp__270 = (unsigned int )*llvm_cbe_tmp__269;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__270);
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = sext i32 %%32 to i64, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_672_count);
  llvm_cbe_tmp__271 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__270);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__271);
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = mul nsw i64 %%33, 255, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_673_count);
  llvm_cbe_tmp__272 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__271&18446744073709551615ull)) * ((unsigned long long )(255ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__272&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = lshr i64 %%34, 8, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_674_count);
  llvm_cbe_tmp__273 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__272&18446744073709551615ull)) >> ((unsigned long long )(8ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__273&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = trunc i64 %%35 to i32, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_675_count);
  llvm_cbe_tmp__274 = (unsigned int )((unsigned int )llvm_cbe_tmp__273&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__274);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%36, i32* %%31, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_676_count);
  *llvm_cbe_tmp__269 = llvm_cbe_tmp__274;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__274);
  goto llvm_cbe_tmp__350;

llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = sext i32 %%dlt to i64, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_697_count);
  llvm_cbe_tmp__275 = (unsigned long long )((signed long long )(signed int )llvm_cbe_dlt);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__275);
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = load i32* %%dlti, align 4, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_698_count);
  llvm_cbe_tmp__276 = (unsigned int )*llvm_cbe_dlti;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__276);
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = sext i32 %%38 to i64, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_699_count);
  llvm_cbe_tmp__277 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__276);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__277);
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = mul nsw i64 %%39, %%37, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_700_count);
  llvm_cbe_tmp__278 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__277&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__275&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__278&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = select i1 %%41, i32 128, i32 -128, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )(((((signed long long )llvm_cbe_tmp__278) > ((signed long long )18446744073709551615ull))) ? ((unsigned int )128u) : ((unsigned int )4294967168u));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge1 = 0x%X\n", llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = load i32* %%bli, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_704_count);
  llvm_cbe_tmp__279 = (unsigned int )*llvm_cbe_bli;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__279);
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = sext i32 %%42 to i64, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_705_count);
  llvm_cbe_tmp__280 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__279);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__280);
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = mul nsw i64 %%43, 255, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_706_count);
  llvm_cbe_tmp__281 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__280&18446744073709551615ull)) * ((unsigned long long )(255ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__281&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = lshr i64 %%44, 8, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_707_count);
  llvm_cbe_tmp__282 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__281&18446744073709551615ull)) >> ((unsigned long long )(8ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__282&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = trunc i64 %%45 to i32, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_708_count);
  llvm_cbe_tmp__283 = (unsigned int )((unsigned int )llvm_cbe_tmp__282&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__283);
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = add nsw i32 %%46, %%storemerge1, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_711_count);
  llvm_cbe_tmp__284 = (unsigned int )((unsigned int )(llvm_cbe_tmp__283&4294967295ull)) + ((unsigned int )(llvm_cbe_storemerge1&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__284&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%47, i32* %%bli, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_712_count);
  *llvm_cbe_bli = llvm_cbe_tmp__284;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__284);
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = getelementptr inbounds i32* %%dlti, i64 1, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_723_count);
  llvm_cbe_tmp__285 = (signed int *)(&llvm_cbe_dlti[(((signed long long )1ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = load i32* %%48, align 4, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_724_count);
  llvm_cbe_tmp__286 = (unsigned int )*llvm_cbe_tmp__285;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__286);
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = sext i32 %%49 to i64, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_725_count);
  llvm_cbe_tmp__287 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__286);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__287);
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = mul nsw i64 %%50, %%37, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_726_count);
  llvm_cbe_tmp__288 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__287&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__275&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__288&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1.1 = select i1 %%52, i32 128, i32 -128, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_storemerge1_2e_1_count);
  llvm_cbe_storemerge1_2e_1 = (unsigned int )(((((signed long long )llvm_cbe_tmp__288) > ((signed long long )18446744073709551615ull))) ? ((unsigned int )128u) : ((unsigned int )4294967168u));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge1.1 = 0x%X\n", llvm_cbe_storemerge1_2e_1);
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = getelementptr inbounds i32* %%bli, i64 1, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_730_count);
  llvm_cbe_tmp__289 = (signed int *)(&llvm_cbe_bli[(((signed long long )1ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = load i32* %%53, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_731_count);
  llvm_cbe_tmp__290 = (unsigned int )*llvm_cbe_tmp__289;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__290);
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = sext i32 %%54 to i64, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_732_count);
  llvm_cbe_tmp__291 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__290);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__291);
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = mul nsw i64 %%55, 255, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_733_count);
  llvm_cbe_tmp__292 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__291&18446744073709551615ull)) * ((unsigned long long )(255ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__292&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = lshr i64 %%56, 8, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_734_count);
  llvm_cbe_tmp__293 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__292&18446744073709551615ull)) >> ((unsigned long long )(8ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__293&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = trunc i64 %%57 to i32, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_735_count);
  llvm_cbe_tmp__294 = (unsigned int )((unsigned int )llvm_cbe_tmp__293&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__294);
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = add nsw i32 %%58, %%storemerge1.1, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_738_count);
  llvm_cbe_tmp__295 = (unsigned int )((unsigned int )(llvm_cbe_tmp__294&4294967295ull)) + ((unsigned int )(llvm_cbe_storemerge1_2e_1&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__295&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%59, i32* %%53, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_739_count);
  *llvm_cbe_tmp__289 = llvm_cbe_tmp__295;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__295);
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = getelementptr inbounds i32* %%dlti, i64 2, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_750_count);
  llvm_cbe_tmp__296 = (signed int *)(&llvm_cbe_dlti[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = load i32* %%60, align 4, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_751_count);
  llvm_cbe_tmp__297 = (unsigned int )*llvm_cbe_tmp__296;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__297);
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = sext i32 %%61 to i64, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_752_count);
  llvm_cbe_tmp__298 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__297);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__298);
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = mul nsw i64 %%62, %%37, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_753_count);
  llvm_cbe_tmp__299 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__298&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__275&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__299&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1.2 = select i1 %%64, i32 128, i32 -128, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_storemerge1_2e_2_count);
  llvm_cbe_storemerge1_2e_2 = (unsigned int )(((((signed long long )llvm_cbe_tmp__299) > ((signed long long )18446744073709551615ull))) ? ((unsigned int )128u) : ((unsigned int )4294967168u));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge1.2 = 0x%X\n", llvm_cbe_storemerge1_2e_2);
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = getelementptr inbounds i32* %%bli, i64 2, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_757_count);
  llvm_cbe_tmp__300 = (signed int *)(&llvm_cbe_bli[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = load i32* %%65, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_758_count);
  llvm_cbe_tmp__301 = (unsigned int )*llvm_cbe_tmp__300;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__301);
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = sext i32 %%66 to i64, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_759_count);
  llvm_cbe_tmp__302 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__301);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__302);
if (AESL_DEBUG_TRACE)
printf("\n  %%68 = mul nsw i64 %%67, 255, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_760_count);
  llvm_cbe_tmp__303 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__302&18446744073709551615ull)) * ((unsigned long long )(255ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__303&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = lshr i64 %%68, 8, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_761_count);
  llvm_cbe_tmp__304 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__303&18446744073709551615ull)) >> ((unsigned long long )(8ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__304&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = trunc i64 %%69 to i32, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_762_count);
  llvm_cbe_tmp__305 = (unsigned int )((unsigned int )llvm_cbe_tmp__304&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__305);
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = add nsw i32 %%70, %%storemerge1.2, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_765_count);
  llvm_cbe_tmp__306 = (unsigned int )((unsigned int )(llvm_cbe_tmp__305&4294967295ull)) + ((unsigned int )(llvm_cbe_storemerge1_2e_2&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__306&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%71, i32* %%65, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_766_count);
  *llvm_cbe_tmp__300 = llvm_cbe_tmp__306;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__306);
if (AESL_DEBUG_TRACE)
printf("\n  %%72 = getelementptr inbounds i32* %%dlti, i64 3, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_777_count);
  llvm_cbe_tmp__307 = (signed int *)(&llvm_cbe_dlti[(((signed long long )3ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%73 = load i32* %%72, align 4, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_778_count);
  llvm_cbe_tmp__308 = (unsigned int )*llvm_cbe_tmp__307;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__308);
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = sext i32 %%73 to i64, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_779_count);
  llvm_cbe_tmp__309 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__308);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__309);
if (AESL_DEBUG_TRACE)
printf("\n  %%75 = mul nsw i64 %%74, %%37, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_780_count);
  llvm_cbe_tmp__310 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__309&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__275&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__310&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1.3 = select i1 %%76, i32 128, i32 -128, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_storemerge1_2e_3_count);
  llvm_cbe_storemerge1_2e_3 = (unsigned int )(((((signed long long )llvm_cbe_tmp__310) > ((signed long long )18446744073709551615ull))) ? ((unsigned int )128u) : ((unsigned int )4294967168u));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge1.3 = 0x%X\n", llvm_cbe_storemerge1_2e_3);
if (AESL_DEBUG_TRACE)
printf("\n  %%77 = getelementptr inbounds i32* %%bli, i64 3, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_784_count);
  llvm_cbe_tmp__311 = (signed int *)(&llvm_cbe_bli[(((signed long long )3ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%78 = load i32* %%77, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_785_count);
  llvm_cbe_tmp__312 = (unsigned int )*llvm_cbe_tmp__311;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__312);
if (AESL_DEBUG_TRACE)
printf("\n  %%79 = sext i32 %%78 to i64, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_786_count);
  llvm_cbe_tmp__313 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__312);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__313);
if (AESL_DEBUG_TRACE)
printf("\n  %%80 = mul nsw i64 %%79, 255, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_787_count);
  llvm_cbe_tmp__314 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__313&18446744073709551615ull)) * ((unsigned long long )(255ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__314&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%81 = lshr i64 %%80, 8, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_788_count);
  llvm_cbe_tmp__315 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__314&18446744073709551615ull)) >> ((unsigned long long )(8ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__315&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%82 = trunc i64 %%81 to i32, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_789_count);
  llvm_cbe_tmp__316 = (unsigned int )((unsigned int )llvm_cbe_tmp__315&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__316);
if (AESL_DEBUG_TRACE)
printf("\n  %%83 = add nsw i32 %%82, %%storemerge1.3, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_792_count);
  llvm_cbe_tmp__317 = (unsigned int )((unsigned int )(llvm_cbe_tmp__316&4294967295ull)) + ((unsigned int )(llvm_cbe_storemerge1_2e_3&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__317&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%83, i32* %%77, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_793_count);
  *llvm_cbe_tmp__311 = llvm_cbe_tmp__317;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__317);
if (AESL_DEBUG_TRACE)
printf("\n  %%84 = getelementptr inbounds i32* %%dlti, i64 4, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_804_count);
  llvm_cbe_tmp__318 = (signed int *)(&llvm_cbe_dlti[(((signed long long )4ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%85 = load i32* %%84, align 4, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_805_count);
  llvm_cbe_tmp__319 = (unsigned int )*llvm_cbe_tmp__318;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__319);
if (AESL_DEBUG_TRACE)
printf("\n  %%86 = sext i32 %%85 to i64, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_806_count);
  llvm_cbe_tmp__320 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__319);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__320);
if (AESL_DEBUG_TRACE)
printf("\n  %%87 = mul nsw i64 %%86, %%37, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_807_count);
  llvm_cbe_tmp__321 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__320&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__275&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__321&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1.4 = select i1 %%88, i32 128, i32 -128, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_storemerge1_2e_4_count);
  llvm_cbe_storemerge1_2e_4 = (unsigned int )(((((signed long long )llvm_cbe_tmp__321) > ((signed long long )18446744073709551615ull))) ? ((unsigned int )128u) : ((unsigned int )4294967168u));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge1.4 = 0x%X\n", llvm_cbe_storemerge1_2e_4);
if (AESL_DEBUG_TRACE)
printf("\n  %%89 = getelementptr inbounds i32* %%bli, i64 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_811_count);
  llvm_cbe_tmp__322 = (signed int *)(&llvm_cbe_bli[(((signed long long )4ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%90 = load i32* %%89, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_812_count);
  llvm_cbe_tmp__323 = (unsigned int )*llvm_cbe_tmp__322;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__323);
if (AESL_DEBUG_TRACE)
printf("\n  %%91 = sext i32 %%90 to i64, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_813_count);
  llvm_cbe_tmp__324 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__323);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__324);
if (AESL_DEBUG_TRACE)
printf("\n  %%92 = mul nsw i64 %%91, 255, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_814_count);
  llvm_cbe_tmp__325 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__324&18446744073709551615ull)) * ((unsigned long long )(255ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__325&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%93 = lshr i64 %%92, 8, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_815_count);
  llvm_cbe_tmp__326 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__325&18446744073709551615ull)) >> ((unsigned long long )(8ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__326&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%94 = trunc i64 %%93 to i32, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_816_count);
  llvm_cbe_tmp__327 = (unsigned int )((unsigned int )llvm_cbe_tmp__326&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__327);
if (AESL_DEBUG_TRACE)
printf("\n  %%95 = add nsw i32 %%94, %%storemerge1.4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_819_count);
  llvm_cbe_tmp__328 = (unsigned int )((unsigned int )(llvm_cbe_tmp__327&4294967295ull)) + ((unsigned int )(llvm_cbe_storemerge1_2e_4&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__328&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%95, i32* %%89, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_820_count);
  *llvm_cbe_tmp__322 = llvm_cbe_tmp__328;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__328);
if (AESL_DEBUG_TRACE)
printf("\n  %%96 = getelementptr inbounds i32* %%dlti, i64 5, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_831_count);
  llvm_cbe_tmp__329 = (signed int *)(&llvm_cbe_dlti[(((signed long long )5ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%97 = load i32* %%96, align 4, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_832_count);
  llvm_cbe_tmp__330 = (unsigned int )*llvm_cbe_tmp__329;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__330);
if (AESL_DEBUG_TRACE)
printf("\n  %%98 = sext i32 %%97 to i64, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_833_count);
  llvm_cbe_tmp__331 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__330);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__331);
if (AESL_DEBUG_TRACE)
printf("\n  %%99 = mul nsw i64 %%98, %%37, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_834_count);
  llvm_cbe_tmp__332 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__331&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__275&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__332&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1.5 = select i1 %%100, i32 128, i32 -128, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_storemerge1_2e_5_count);
  llvm_cbe_storemerge1_2e_5 = (unsigned int )(((((signed long long )llvm_cbe_tmp__332) > ((signed long long )18446744073709551615ull))) ? ((unsigned int )128u) : ((unsigned int )4294967168u));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge1.5 = 0x%X\n", llvm_cbe_storemerge1_2e_5);
if (AESL_DEBUG_TRACE)
printf("\n  %%101 = getelementptr inbounds i32* %%bli, i64 5, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_838_count);
  llvm_cbe_tmp__333 = (signed int *)(&llvm_cbe_bli[(((signed long long )5ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%102 = load i32* %%101, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_839_count);
  llvm_cbe_tmp__334 = (unsigned int )*llvm_cbe_tmp__333;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__334);
if (AESL_DEBUG_TRACE)
printf("\n  %%103 = sext i32 %%102 to i64, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_840_count);
  llvm_cbe_tmp__335 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__334);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__335);
if (AESL_DEBUG_TRACE)
printf("\n  %%104 = mul nsw i64 %%103, 255, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_841_count);
  llvm_cbe_tmp__336 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__335&18446744073709551615ull)) * ((unsigned long long )(255ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__336&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%105 = lshr i64 %%104, 8, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_842_count);
  llvm_cbe_tmp__337 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__336&18446744073709551615ull)) >> ((unsigned long long )(8ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__337&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%106 = trunc i64 %%105 to i32, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_843_count);
  llvm_cbe_tmp__338 = (unsigned int )((unsigned int )llvm_cbe_tmp__337&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__338);
if (AESL_DEBUG_TRACE)
printf("\n  %%107 = add nsw i32 %%106, %%storemerge1.5, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_846_count);
  llvm_cbe_tmp__339 = (unsigned int )((unsigned int )(llvm_cbe_tmp__338&4294967295ull)) + ((unsigned int )(llvm_cbe_storemerge1_2e_5&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__339&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%107, i32* %%101, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_847_count);
  *llvm_cbe_tmp__333 = llvm_cbe_tmp__339;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__339);
  goto llvm_cbe_tmp__350;

llvm_cbe_tmp__350:
if (AESL_DEBUG_TRACE)
printf("\n  %%109 = getelementptr inbounds i32* %%dlti, i64 4, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_859_count);
  llvm_cbe_tmp__340 = (signed int *)(&llvm_cbe_dlti[(((signed long long )4ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%110 = load i32* %%109, align 4, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_860_count);
  llvm_cbe_tmp__341 = (unsigned int )*llvm_cbe_tmp__340;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__341);
if (AESL_DEBUG_TRACE)
printf("\n  %%111 = getelementptr inbounds i32* %%dlti, i64 5, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_861_count);
  llvm_cbe_tmp__342 = (signed int *)(&llvm_cbe_dlti[(((signed long long )5ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%110, i32* %%111, align 4, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_862_count);
  *llvm_cbe_tmp__342 = llvm_cbe_tmp__341;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__341);
if (AESL_DEBUG_TRACE)
printf("\n  %%112 = getelementptr inbounds i32* %%dlti, i64 3, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_863_count);
  llvm_cbe_tmp__343 = (signed int *)(&llvm_cbe_dlti[(((signed long long )3ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%113 = load i32* %%112, align 4, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_864_count);
  llvm_cbe_tmp__344 = (unsigned int )*llvm_cbe_tmp__343;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__344);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%113, i32* %%109, align 4, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_865_count);
  *llvm_cbe_tmp__340 = llvm_cbe_tmp__344;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__344);
if (AESL_DEBUG_TRACE)
printf("\n  %%114 = getelementptr inbounds i32* %%dlti, i64 2, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_866_count);
  llvm_cbe_tmp__345 = (signed int *)(&llvm_cbe_dlti[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%115 = load i32* %%114, align 4, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_867_count);
  llvm_cbe_tmp__346 = (unsigned int )*llvm_cbe_tmp__345;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__346);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%115, i32* %%112, align 4, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_868_count);
  *llvm_cbe_tmp__343 = llvm_cbe_tmp__346;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__346);
if (AESL_DEBUG_TRACE)
printf("\n  %%116 = getelementptr inbounds i32* %%dlti, i64 1, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_869_count);
  llvm_cbe_tmp__347 = (signed int *)(&llvm_cbe_dlti[(((signed long long )1ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%117 = load i32* %%116, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_870_count);
  llvm_cbe_tmp__348 = (unsigned int )*llvm_cbe_tmp__347;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__348);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%117, i32* %%114, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_871_count);
  *llvm_cbe_tmp__345 = llvm_cbe_tmp__348;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__348);
if (AESL_DEBUG_TRACE)
printf("\n  %%118 = load i32* %%dlti, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_872_count);
  llvm_cbe_tmp__349 = (unsigned int )*llvm_cbe_dlti;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__349);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%118, i32* %%116, align 4, !dbg !24 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_873_count);
  *llvm_cbe_tmp__347 = llvm_cbe_tmp__349;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__349);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%dlt, i32* %%dlti, align 4, !dbg !23 for 0x%llxth hint within @upzero  --> \n", ++aesl_llvm_cbe_874_count);
  *llvm_cbe_dlti = llvm_cbe_dlt;
if (AESL_DEBUG_TRACE)
printf("\ndlt = 0x%X\n", llvm_cbe_dlt);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @upzero}\n");
  return;
}


signed int uppol2(signed int llvm_cbe_al1, signed int llvm_cbe_al2, signed int llvm_cbe_plt, signed int llvm_cbe_plt1, signed int llvm_cbe_plt2) {
  static  unsigned long long aesl_llvm_cbe_876_count = 0;
  static  unsigned long long aesl_llvm_cbe_877_count = 0;
  static  unsigned long long aesl_llvm_cbe_878_count = 0;
  static  unsigned long long aesl_llvm_cbe_879_count = 0;
  static  unsigned long long aesl_llvm_cbe_880_count = 0;
  static  unsigned long long aesl_llvm_cbe_881_count = 0;
  static  unsigned long long aesl_llvm_cbe_882_count = 0;
  static  unsigned long long aesl_llvm_cbe_883_count = 0;
  static  unsigned long long aesl_llvm_cbe_884_count = 0;
  static  unsigned long long aesl_llvm_cbe_885_count = 0;
  static  unsigned long long aesl_llvm_cbe_886_count = 0;
  unsigned long long llvm_cbe_tmp__351;
  static  unsigned long long aesl_llvm_cbe_887_count = 0;
  unsigned long long llvm_cbe_tmp__352;
  static  unsigned long long aesl_llvm_cbe_888_count = 0;
  static  unsigned long long aesl_llvm_cbe_889_count = 0;
  static  unsigned long long aesl_llvm_cbe_890_count = 0;
  static  unsigned long long aesl_llvm_cbe_891_count = 0;
  static  unsigned long long aesl_llvm_cbe_892_count = 0;
  static  unsigned long long aesl_llvm_cbe_893_count = 0;
  unsigned long long llvm_cbe_tmp__353;
  static  unsigned long long aesl_llvm_cbe_894_count = 0;
  static  unsigned long long aesl_llvm_cbe_895_count = 0;
  unsigned long long llvm_cbe_tmp__354;
  static  unsigned long long aesl_llvm_cbe_896_count = 0;
  unsigned long long llvm_cbe_tmp__355;
  static  unsigned long long aesl_llvm_cbe_897_count = 0;
  static  unsigned long long aesl_llvm_cbe_898_count = 0;
  unsigned long long llvm_cbe_tmp__356;
  static  unsigned long long aesl_llvm_cbe_899_count = 0;
  static  unsigned long long aesl_llvm_cbe_900_count = 0;
  static  unsigned long long aesl_llvm_cbe_901_count = 0;
  static  unsigned long long aesl_llvm_cbe_902_count = 0;
  static  unsigned long long aesl_llvm_cbe_903_count = 0;
  static  unsigned long long aesl_llvm_cbe_904_count = 0;
  unsigned long long llvm_cbe_tmp__357;
  static  unsigned long long aesl_llvm_cbe_905_count = 0;
  static  unsigned long long aesl_llvm_cbe_906_count = 0;
  unsigned long long llvm_cbe_tmp__358;
  static  unsigned long long aesl_llvm_cbe_907_count = 0;
  unsigned long long llvm_cbe_tmp__359;
  static  unsigned long long aesl_llvm_cbe_908_count = 0;
  unsigned long long llvm_cbe_tmp__360;
  static  unsigned long long aesl_llvm_cbe_909_count = 0;
  unsigned long long llvm_cbe_tmp__361;
  static  unsigned long long aesl_llvm_cbe_910_count = 0;
  unsigned long long llvm_cbe_tmp__362;
  static  unsigned long long aesl_llvm_cbe_911_count = 0;
  unsigned long long llvm_cbe_tmp__363;
  static  unsigned long long aesl_llvm_cbe_912_count = 0;
  static  unsigned long long aesl_llvm_cbe_913_count = 0;
  unsigned long long llvm_cbe_tmp__364;
  static  unsigned long long aesl_llvm_cbe_914_count = 0;
  unsigned long long llvm_cbe_tmp__365;
  static  unsigned long long aesl_llvm_cbe_915_count = 0;
  unsigned long long llvm_cbe_tmp__366;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
  unsigned long long llvm_cbe_storemerge;
  static  unsigned long long aesl_llvm_cbe_916_count = 0;
  unsigned long long llvm_cbe_tmp__367;
  static  unsigned long long aesl_llvm_cbe_917_count = 0;
  unsigned int llvm_cbe_tmp__368;
  static  unsigned long long aesl_llvm_cbe_918_count = 0;
  static  unsigned long long aesl_llvm_cbe_919_count = 0;
  static  unsigned long long aesl_llvm_cbe_920_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned int llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe_921_count = 0;
  static  unsigned long long aesl_llvm_cbe_922_count = 0;
  static  unsigned long long aesl_llvm_cbe_923_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge2_count = 0;
  unsigned int llvm_cbe_storemerge2;
  static  unsigned long long aesl_llvm_cbe_924_count = 0;
  static  unsigned long long aesl_llvm_cbe_925_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @uppol2\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = sext i32 %%al1 to i64, !dbg !24 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_886_count);
  llvm_cbe_tmp__351 = (unsigned long long )((signed long long )(signed int )llvm_cbe_al1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__351);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = shl nsw i64 %%1, 2, !dbg !24 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_887_count);
  llvm_cbe_tmp__352 = (unsigned long long )llvm_cbe_tmp__351 << 2ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__352);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = sext i32 %%plt to i64, !dbg !23 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_893_count);
  llvm_cbe_tmp__353 = (unsigned long long )((signed long long )(signed int )llvm_cbe_plt);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__353);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = sext i32 %%plt1 to i64, !dbg !23 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_895_count);
  llvm_cbe_tmp__354 = (unsigned long long )((signed long long )(signed int )llvm_cbe_plt1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__354);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = mul nsw i64 %%4, %%3, !dbg !23 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_896_count);
  llvm_cbe_tmp__355 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__354&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__353&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__355&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = sub nsw i64 0, %%2, !dbg !24 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_898_count);
  llvm_cbe_tmp__356 = (unsigned long long )-(llvm_cbe_tmp__352);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__356&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = select i1 %%6, i64 %%7, i64 %%2, !dbg !23 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_904_count);
  llvm_cbe_tmp__357 = (unsigned long long )(((((signed long long )llvm_cbe_tmp__355) > ((signed long long )18446744073709551615ull))) ? ((unsigned long long )llvm_cbe_tmp__356) : ((unsigned long long )llvm_cbe_tmp__352));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__357);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = lshr i64 %%8, 7, !dbg !24 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_906_count);
  llvm_cbe_tmp__358 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__357&18446744073709551615ull)) >> ((unsigned long long )(7ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__358&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = sext i32 %%plt2 to i64, !dbg !23 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_907_count);
  llvm_cbe_tmp__359 = (unsigned long long )((signed long long )(signed int )llvm_cbe_plt2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__359);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = mul nsw i64 %%10, %%3, !dbg !23 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_908_count);
  llvm_cbe_tmp__360 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__359&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__353&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__360&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = ashr i64 %%11, 63, !dbg !23 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_909_count);
  llvm_cbe_tmp__361 = (unsigned long long )((signed long long )(((signed long long )llvm_cbe_tmp__360) >> ((signed long long )63ull)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((signed long long )llvm_cbe_tmp__361));
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = and i64 %%12, 4294967040, !dbg !23 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_910_count);
  llvm_cbe_tmp__362 = (unsigned long long )llvm_cbe_tmp__361 & 4294967040ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__362);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = or i64 %%13, 128, !dbg !23 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_911_count);
  llvm_cbe_tmp__363 = (unsigned long long )llvm_cbe_tmp__362 | 128ull;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__363);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = sext i32 %%al2 to i64, !dbg !23 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_913_count);
  llvm_cbe_tmp__364 = (unsigned long long )((signed long long )(signed int )llvm_cbe_al2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__364);
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = mul nsw i64 %%15, 127, !dbg !23 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_914_count);
  llvm_cbe_tmp__365 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__364&18446744073709551615ull)) * ((unsigned long long )(127ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__365&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = lshr i64 %%16, 7, !dbg !23 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_915_count);
  llvm_cbe_tmp__366 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__365&18446744073709551615ull)) >> ((unsigned long long )(7ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__366&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = add i64 %%9, %%17, !dbg !23 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__358&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__366&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge = 0x%llX\n", ((unsigned long long )(llvm_cbe_storemerge&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = add i64 %%storemerge, %%14, !dbg !23 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_916_count);
  llvm_cbe_tmp__367 = (unsigned long long )((unsigned long long )(llvm_cbe_storemerge&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__363&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__367&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = trunc i64 %%18 to i32, !dbg !23 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_917_count);
  llvm_cbe_tmp__368 = (unsigned int )((unsigned int )llvm_cbe_tmp__367&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__368);
if (AESL_DEBUG_TRACE)
printf("\n  %%. = select i1 %%20, i32 12288, i32 %%19, !dbg !25 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned int )(((((signed int )llvm_cbe_tmp__368) > ((signed int )12288u))) ? ((unsigned int )12288u) : ((unsigned int )llvm_cbe_tmp__368));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", llvm_cbe__2e_);
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge2 = select i1 %%21, i32 -12288, i32 %%., !dbg !25 for 0x%llxth hint within @uppol2  --> \n", ++aesl_llvm_cbe_storemerge2_count);
  llvm_cbe_storemerge2 = (unsigned int )(((((signed int )llvm_cbe__2e_) < ((signed int )4294955008u))) ? ((unsigned int )4294955008u) : ((unsigned int )llvm_cbe__2e_));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge2 = 0x%X\n", llvm_cbe_storemerge2);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @uppol2}\n");
  return llvm_cbe_storemerge2;
}


signed int uppol1(signed int llvm_cbe_al1, signed int llvm_cbe_apl2, signed int llvm_cbe_plt, signed int llvm_cbe_plt1) {
  static  unsigned long long aesl_llvm_cbe_926_count = 0;
  static  unsigned long long aesl_llvm_cbe_927_count = 0;
  static  unsigned long long aesl_llvm_cbe_928_count = 0;
  static  unsigned long long aesl_llvm_cbe_929_count = 0;
  static  unsigned long long aesl_llvm_cbe_930_count = 0;
  static  unsigned long long aesl_llvm_cbe_931_count = 0;
  static  unsigned long long aesl_llvm_cbe_932_count = 0;
  unsigned long long llvm_cbe_tmp__369;
  static  unsigned long long aesl_llvm_cbe_933_count = 0;
  unsigned long long llvm_cbe_tmp__370;
  static  unsigned long long aesl_llvm_cbe_934_count = 0;
  unsigned long long llvm_cbe_tmp__371;
  static  unsigned long long aesl_llvm_cbe_935_count = 0;
  static  unsigned long long aesl_llvm_cbe_936_count = 0;
  static  unsigned long long aesl_llvm_cbe_937_count = 0;
  static  unsigned long long aesl_llvm_cbe_938_count = 0;
  static  unsigned long long aesl_llvm_cbe_939_count = 0;
  unsigned long long llvm_cbe_tmp__372;
  static  unsigned long long aesl_llvm_cbe_940_count = 0;
  static  unsigned long long aesl_llvm_cbe_941_count = 0;
  unsigned long long llvm_cbe_tmp__373;
  static  unsigned long long aesl_llvm_cbe_942_count = 0;
  unsigned long long llvm_cbe_tmp__374;
  static  unsigned long long aesl_llvm_cbe_943_count = 0;
  static  unsigned long long aesl_llvm_cbe_944_count = 0;
  static  unsigned long long aesl_llvm_cbe_945_count = 0;
  unsigned int llvm_cbe_tmp__375;
  static  unsigned long long aesl_llvm_cbe_946_count = 0;
  unsigned int llvm_cbe_tmp__376;
  static  unsigned long long aesl_llvm_cbe_947_count = 0;
  static  unsigned long long aesl_llvm_cbe_948_count = 0;
  static  unsigned long long aesl_llvm_cbe_949_count = 0;
  unsigned int llvm_cbe_tmp__377;
  static  unsigned long long aesl_llvm_cbe_950_count = 0;
  unsigned int llvm_cbe_tmp__378;
  static  unsigned long long aesl_llvm_cbe_951_count = 0;
  static  unsigned long long aesl_llvm_cbe_952_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
  unsigned int llvm_cbe_storemerge;
  unsigned int llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_953_count = 0;
  static  unsigned long long aesl_llvm_cbe_954_count = 0;
  static  unsigned long long aesl_llvm_cbe_955_count = 0;
  static  unsigned long long aesl_llvm_cbe_956_count = 0;
  unsigned int llvm_cbe_tmp__379;
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
  static  unsigned long long aesl_llvm_cbe__2e_storemerge_count = 0;
  unsigned int llvm_cbe__2e_storemerge;
  static  unsigned long long aesl_llvm_cbe_967_count = 0;
  unsigned int llvm_cbe_tmp__380;
  static  unsigned long long aesl_llvm_cbe_968_count = 0;
  static  unsigned long long aesl_llvm_cbe_969_count = 0;
  static  unsigned long long aesl_llvm_cbe_970_count = 0;
  static  unsigned long long aesl_llvm_cbe_971_count = 0;
  static  unsigned long long aesl_llvm_cbe_972_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  static  unsigned long long aesl_llvm_cbe_973_count = 0;
  static  unsigned long long aesl_llvm_cbe_974_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @uppol1\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = sext i32 %%al1 to i64, !dbg !23 for 0x%llxth hint within @uppol1  --> \n", ++aesl_llvm_cbe_932_count);
  llvm_cbe_tmp__369 = (unsigned long long )((signed long long )(signed int )llvm_cbe_al1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__369);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = mul nsw i64 %%1, 255, !dbg !23 for 0x%llxth hint within @uppol1  --> \n", ++aesl_llvm_cbe_933_count);
  llvm_cbe_tmp__370 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__369&18446744073709551615ull)) * ((unsigned long long )(255ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__370&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = ashr i64 %%2, 8, !dbg !23 for 0x%llxth hint within @uppol1  --> \n", ++aesl_llvm_cbe_934_count);
  llvm_cbe_tmp__371 = (unsigned long long )((signed long long )(((signed long long )llvm_cbe_tmp__370) >> ((signed long long )8ull)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((signed long long )llvm_cbe_tmp__371));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = sext i32 %%plt to i64, !dbg !24 for 0x%llxth hint within @uppol1  --> \n", ++aesl_llvm_cbe_939_count);
  llvm_cbe_tmp__372 = (unsigned long long )((signed long long )(signed int )llvm_cbe_plt);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__372);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i32 %%plt1 to i64, !dbg !24 for 0x%llxth hint within @uppol1  --> \n", ++aesl_llvm_cbe_941_count);
  llvm_cbe_tmp__373 = (unsigned long long )((signed long long )(signed int )llvm_cbe_plt1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__373);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = mul nsw i64 %%5, %%4, !dbg !24 for 0x%llxth hint within @uppol1  --> \n", ++aesl_llvm_cbe_942_count);
  llvm_cbe_tmp__374 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__373&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__372&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__374&18446744073709551615ull)));
  if ((((signed long long )llvm_cbe_tmp__374) > ((signed long long )18446744073709551615ull))) {
    goto llvm_cbe_tmp__381;
  } else {
    goto llvm_cbe_tmp__382;
  }

llvm_cbe_tmp__381:
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = trunc i64 %%3 to i32, !dbg !24 for 0x%llxth hint within @uppol1  --> \n", ++aesl_llvm_cbe_945_count);
  llvm_cbe_tmp__375 = (unsigned int )((unsigned int )llvm_cbe_tmp__371&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__375);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = add nsw i32 %%9, 192, !dbg !24 for 0x%llxth hint within @uppol1  --> \n", ++aesl_llvm_cbe_946_count);
  llvm_cbe_tmp__376 = (unsigned int )((unsigned int )(llvm_cbe_tmp__375&4294967295ull)) + ((unsigned int )(192u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__376&4294967295ull)));
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__376;   /* for PHI node */
  goto llvm_cbe_tmp__383;

llvm_cbe_tmp__382:
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = trunc i64 %%3 to i32, !dbg !24 for 0x%llxth hint within @uppol1  --> \n", ++aesl_llvm_cbe_949_count);
  llvm_cbe_tmp__377 = (unsigned int )((unsigned int )llvm_cbe_tmp__371&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__377);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = add nsw i32 %%12, -192, !dbg !24 for 0x%llxth hint within @uppol1  --> \n", ++aesl_llvm_cbe_950_count);
  llvm_cbe_tmp__378 = (unsigned int )((unsigned int )(llvm_cbe_tmp__377&4294967295ull)) + ((unsigned int )(4294967104u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__378&4294967295ull)));
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__378;   /* for PHI node */
  goto llvm_cbe_tmp__383;

llvm_cbe_tmp__383:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i32 [ %%13, %%11 ], [ %%10, %%8  for 0x%llxth hint within @uppol1  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = (unsigned int )llvm_cbe_storemerge__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge = 0x%X",llvm_cbe_storemerge);
printf("\n = 0x%X",llvm_cbe_tmp__378);
printf("\n = 0x%X",llvm_cbe_tmp__376);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = sub nsw i32 15360, %%apl2, !dbg !23 for 0x%llxth hint within @uppol1  --> \n", ++aesl_llvm_cbe_956_count);
  llvm_cbe_tmp__379 = (unsigned int )((unsigned int )(15360u&4294967295ull)) - ((unsigned int )(llvm_cbe_apl2&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__379&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%.storemerge = select i1 %%16, i32 %%15, i32 %%storemerge, !dbg !24 for 0x%llxth hint within @uppol1  --> \n", ++aesl_llvm_cbe__2e_storemerge_count);
  llvm_cbe__2e_storemerge = (unsigned int )(((((signed int )llvm_cbe_storemerge) > ((signed int )llvm_cbe_tmp__379))) ? ((unsigned int )llvm_cbe_tmp__379) : ((unsigned int )llvm_cbe_storemerge));
if (AESL_DEBUG_TRACE)
printf("\n.storemerge = 0x%X\n", llvm_cbe__2e_storemerge);
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = sub nsw i32 0, %%15, !dbg !24 for 0x%llxth hint within @uppol1  --> \n", ++aesl_llvm_cbe_967_count);
  llvm_cbe_tmp__380 = (unsigned int )-(llvm_cbe_tmp__379);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__380&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = select i1 %%18, i32 %%17, i32 %%.storemerge, !dbg !24 for 0x%llxth hint within @uppol1  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )(((((signed int )llvm_cbe__2e_storemerge) < ((signed int )llvm_cbe_tmp__380))) ? ((unsigned int )llvm_cbe_tmp__380) : ((unsigned int )llvm_cbe__2e_storemerge));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge1 = 0x%X\n", llvm_cbe_storemerge1);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @uppol1}\n");
  return llvm_cbe_storemerge1;
}


signed int logsch(signed int llvm_cbe_ih, signed int llvm_cbe_nbh) {
  static  unsigned long long aesl_llvm_cbe_975_count = 0;
  static  unsigned long long aesl_llvm_cbe_976_count = 0;
  static  unsigned long long aesl_llvm_cbe_977_count = 0;
  static  unsigned long long aesl_llvm_cbe_978_count = 0;
  unsigned long long llvm_cbe_tmp__384;
  static  unsigned long long aesl_llvm_cbe_979_count = 0;
  unsigned long long llvm_cbe_tmp__385;
  static  unsigned long long aesl_llvm_cbe_980_count = 0;
  unsigned long long llvm_cbe_tmp__386;
  static  unsigned long long aesl_llvm_cbe_981_count = 0;
  unsigned int llvm_cbe_tmp__387;
  static  unsigned long long aesl_llvm_cbe_982_count = 0;
  static  unsigned long long aesl_llvm_cbe_983_count = 0;
  static  unsigned long long aesl_llvm_cbe_984_count = 0;
  static  unsigned long long aesl_llvm_cbe_985_count = 0;
  unsigned long long llvm_cbe_tmp__388;
  static  unsigned long long aesl_llvm_cbe_986_count = 0;
  signed int *llvm_cbe_tmp__389;
  static  unsigned long long aesl_llvm_cbe_987_count = 0;
  unsigned int llvm_cbe_tmp__390;
  static  unsigned long long aesl_llvm_cbe_988_count = 0;
  unsigned int llvm_cbe_tmp__391;
  static  unsigned long long aesl_llvm_cbe_989_count = 0;
  static  unsigned long long aesl_llvm_cbe_990_count = 0;
  static  unsigned long long aesl_llvm_cbe_991_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned int llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe_992_count = 0;
  static  unsigned long long aesl_llvm_cbe_993_count = 0;
  static  unsigned long long aesl_llvm_cbe_994_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  static  unsigned long long aesl_llvm_cbe_995_count = 0;
  static  unsigned long long aesl_llvm_cbe_996_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @logsch\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = sext i32 %%nbh to i64, !dbg !23 for 0x%llxth hint within @logsch  --> \n", ++aesl_llvm_cbe_978_count);
  llvm_cbe_tmp__384 = (unsigned long long )((signed long long )(signed int )llvm_cbe_nbh);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__384);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = mul nsw i64 %%1, 127, !dbg !23 for 0x%llxth hint within @logsch  --> \n", ++aesl_llvm_cbe_979_count);
  llvm_cbe_tmp__385 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__384&18446744073709551615ull)) * ((unsigned long long )(127ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__385&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = lshr i64 %%2, 7, !dbg !23 for 0x%llxth hint within @logsch  --> \n", ++aesl_llvm_cbe_980_count);
  llvm_cbe_tmp__386 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__385&18446744073709551615ull)) >> ((unsigned long long )(7ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__386&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = trunc i64 %%3 to i32, !dbg !23 for 0x%llxth hint within @logsch  --> \n", ++aesl_llvm_cbe_981_count);
  llvm_cbe_tmp__387 = (unsigned int )((unsigned int )llvm_cbe_tmp__386&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__387);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i32 %%ih to i64, !dbg !23 for 0x%llxth hint within @logsch  --> \n", ++aesl_llvm_cbe_985_count);
  llvm_cbe_tmp__388 = (unsigned long long )((signed long long )(signed int )llvm_cbe_ih);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__388);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds [4 x i32]* @wh_code_table, i64 0, i64 %%5, !dbg !23 for 0x%llxth hint within @logsch  --> \n", ++aesl_llvm_cbe_986_count);
  llvm_cbe_tmp__389 = (signed int *)(&wh_code_table[(((signed long long )llvm_cbe_tmp__388))
#ifdef AESL_BC_SIM
 % 4
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__388));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__388) < 4)) fprintf(stderr, "%s:%d: warning: Read access out of array 'wh_code_table' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i32* %%6, align 4, !dbg !23 for 0x%llxth hint within @logsch  --> \n", ++aesl_llvm_cbe_987_count);
  llvm_cbe_tmp__390 = (unsigned int )*llvm_cbe_tmp__389;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__390);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%7, %%4, !dbg !23 for 0x%llxth hint within @logsch  --> \n", ++aesl_llvm_cbe_988_count);
  llvm_cbe_tmp__391 = (unsigned int )((unsigned int )(llvm_cbe_tmp__390&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__387&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__391&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%. = select i1 %%9, i32 0, i32 %%8, !dbg !23 for 0x%llxth hint within @logsch  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned int )(((((signed int )llvm_cbe_tmp__391) < ((signed int )0u))) ? ((unsigned int )0u) : ((unsigned int )llvm_cbe_tmp__391));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", llvm_cbe__2e_);
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = select i1 %%10, i32 22528, i32 %%., !dbg !23 for 0x%llxth hint within @logsch  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )(((((signed int )llvm_cbe__2e_) > ((signed int )22528u))) ? ((unsigned int )22528u) : ((unsigned int )llvm_cbe__2e_));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge1 = 0x%X\n", llvm_cbe_storemerge1);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @logsch}\n");
  return llvm_cbe_storemerge1;
}


void decode(signed int llvm_cbe_input) {
  static  unsigned long long aesl_llvm_cbe_997_count = 0;
  static  unsigned long long aesl_llvm_cbe_998_count = 0;
  static  unsigned long long aesl_llvm_cbe_999_count = 0;
  unsigned int llvm_cbe_tmp__392;
  static  unsigned long long aesl_llvm_cbe_1000_count = 0;
  static  unsigned long long aesl_llvm_cbe_1001_count = 0;
  static  unsigned long long aesl_llvm_cbe_1002_count = 0;
  unsigned int llvm_cbe_tmp__393;
  static  unsigned long long aesl_llvm_cbe_1003_count = 0;
  static  unsigned long long aesl_llvm_cbe_1004_count = 0;
  unsigned int llvm_cbe_tmp__394;
  static  unsigned long long aesl_llvm_cbe_1005_count = 0;
  static  unsigned long long aesl_llvm_cbe_1006_count = 0;
  unsigned int llvm_cbe_tmp__395;
  static  unsigned long long aesl_llvm_cbe_1007_count = 0;
  unsigned int llvm_cbe_tmp__396;
  static  unsigned long long aesl_llvm_cbe_1008_count = 0;
  unsigned int llvm_cbe_tmp__397;
  static  unsigned long long aesl_llvm_cbe_1009_count = 0;
  unsigned int llvm_cbe_tmp__398;
  static  unsigned long long aesl_llvm_cbe_1010_count = 0;
  unsigned int llvm_cbe_tmp__399;
  static  unsigned long long aesl_llvm_cbe_1011_count = 0;
  static  unsigned long long aesl_llvm_cbe_1012_count = 0;
  unsigned int llvm_cbe_tmp__400;
  static  unsigned long long aesl_llvm_cbe_1013_count = 0;
  static  unsigned long long aesl_llvm_cbe_1014_count = 0;
  unsigned int llvm_cbe_tmp__401;
  static  unsigned long long aesl_llvm_cbe_1015_count = 0;
  unsigned long long llvm_cbe_tmp__402;
  static  unsigned long long aesl_llvm_cbe_1016_count = 0;
  unsigned int llvm_cbe_tmp__403;
  static  unsigned long long aesl_llvm_cbe_1017_count = 0;
  unsigned long long llvm_cbe_tmp__404;
  static  unsigned long long aesl_llvm_cbe_1018_count = 0;
  signed int *llvm_cbe_tmp__405;
  static  unsigned long long aesl_llvm_cbe_1019_count = 0;
  unsigned int llvm_cbe_tmp__406;
  static  unsigned long long aesl_llvm_cbe_1020_count = 0;
  unsigned long long llvm_cbe_tmp__407;
  static  unsigned long long aesl_llvm_cbe_1021_count = 0;
  unsigned long long llvm_cbe_tmp__408;
  static  unsigned long long aesl_llvm_cbe_1022_count = 0;
  unsigned long long llvm_cbe_tmp__409;
  static  unsigned long long aesl_llvm_cbe_1023_count = 0;
  unsigned int llvm_cbe_tmp__410;
  static  unsigned long long aesl_llvm_cbe_1024_count = 0;
  static  unsigned long long aesl_llvm_cbe_1025_count = 0;
  unsigned int llvm_cbe_tmp__411;
  static  unsigned long long aesl_llvm_cbe_1026_count = 0;
  unsigned long long llvm_cbe_tmp__412;
  static  unsigned long long aesl_llvm_cbe_1027_count = 0;
  signed int *llvm_cbe_tmp__413;
  static  unsigned long long aesl_llvm_cbe_1028_count = 0;
  unsigned int llvm_cbe_tmp__414;
  static  unsigned long long aesl_llvm_cbe_1029_count = 0;
  unsigned long long llvm_cbe_tmp__415;
  static  unsigned long long aesl_llvm_cbe_1030_count = 0;
  unsigned long long llvm_cbe_tmp__416;
  static  unsigned long long aesl_llvm_cbe_1031_count = 0;
  unsigned long long llvm_cbe_tmp__417;
  static  unsigned long long aesl_llvm_cbe_1032_count = 0;
  unsigned int llvm_cbe_tmp__418;
  static  unsigned long long aesl_llvm_cbe_1033_count = 0;
  static  unsigned long long aesl_llvm_cbe_1034_count = 0;
  unsigned int llvm_cbe_tmp__419;
  static  unsigned long long aesl_llvm_cbe_1035_count = 0;
  static  unsigned long long aesl_llvm_cbe_1036_count = 0;
  unsigned int llvm_cbe_tmp__420;
  static  unsigned long long aesl_llvm_cbe_1037_count = 0;
  unsigned int llvm_cbe_tmp__421;
  static  unsigned long long aesl_llvm_cbe_1038_count = 0;
  static  unsigned long long aesl_llvm_cbe_1039_count = 0;
  unsigned int llvm_cbe_tmp__422;
  static  unsigned long long aesl_llvm_cbe_1040_count = 0;
  static  unsigned long long aesl_llvm_cbe_1041_count = 0;
  unsigned int llvm_cbe_tmp__423;
  static  unsigned long long aesl_llvm_cbe_1042_count = 0;
  static  unsigned long long aesl_llvm_cbe_1043_count = 0;
  static  unsigned long long aesl_llvm_cbe_1044_count = 0;
  unsigned int llvm_cbe_tmp__424;
  static  unsigned long long aesl_llvm_cbe_1045_count = 0;
  unsigned int llvm_cbe_tmp__425;
  static  unsigned long long aesl_llvm_cbe_1046_count = 0;
  unsigned int llvm_cbe_tmp__426;
  static  unsigned long long aesl_llvm_cbe_1047_count = 0;
  unsigned int llvm_cbe_tmp__427;
  static  unsigned long long aesl_llvm_cbe_1048_count = 0;
  unsigned int llvm_cbe_tmp__428;
  static  unsigned long long aesl_llvm_cbe_1049_count = 0;
  unsigned int llvm_cbe_tmp__429;
  static  unsigned long long aesl_llvm_cbe_1050_count = 0;
  static  unsigned long long aesl_llvm_cbe_1051_count = 0;
  unsigned int llvm_cbe_tmp__430;
  static  unsigned long long aesl_llvm_cbe_1052_count = 0;
  static  unsigned long long aesl_llvm_cbe_1053_count = 0;
  unsigned int llvm_cbe_tmp__431;
  static  unsigned long long aesl_llvm_cbe_1054_count = 0;
  unsigned int llvm_cbe_tmp__432;
  static  unsigned long long aesl_llvm_cbe_1055_count = 0;
  unsigned int llvm_cbe_tmp__433;
  static  unsigned long long aesl_llvm_cbe_1056_count = 0;
  static  unsigned long long aesl_llvm_cbe_1057_count = 0;
  unsigned int llvm_cbe_tmp__434;
  static  unsigned long long aesl_llvm_cbe_1058_count = 0;
  static  unsigned long long aesl_llvm_cbe_1059_count = 0;
  static  unsigned long long aesl_llvm_cbe_1060_count = 0;
  static  unsigned long long aesl_llvm_cbe_1061_count = 0;
  static  unsigned long long aesl_llvm_cbe_1062_count = 0;
  unsigned int llvm_cbe_tmp__435;
  static  unsigned long long aesl_llvm_cbe_1063_count = 0;
  static  unsigned long long aesl_llvm_cbe_1064_count = 0;
  unsigned int llvm_cbe_tmp__436;
  static  unsigned long long aesl_llvm_cbe_1065_count = 0;
  unsigned int llvm_cbe_tmp__437;
  static  unsigned long long aesl_llvm_cbe_1066_count = 0;
  unsigned int llvm_cbe_tmp__438;
  static  unsigned long long aesl_llvm_cbe_1067_count = 0;
  unsigned int llvm_cbe_tmp__439;
  static  unsigned long long aesl_llvm_cbe_1068_count = 0;
  unsigned int llvm_cbe_tmp__440;
  static  unsigned long long aesl_llvm_cbe_1069_count = 0;
  static  unsigned long long aesl_llvm_cbe_1070_count = 0;
  unsigned int llvm_cbe_tmp__441;
  static  unsigned long long aesl_llvm_cbe_1071_count = 0;
  static  unsigned long long aesl_llvm_cbe_1072_count = 0;
  unsigned int llvm_cbe_tmp__442;
  static  unsigned long long aesl_llvm_cbe_1073_count = 0;
  unsigned long long llvm_cbe_tmp__443;
  static  unsigned long long aesl_llvm_cbe_1074_count = 0;
  unsigned int llvm_cbe_tmp__444;
  static  unsigned long long aesl_llvm_cbe_1075_count = 0;
  unsigned long long llvm_cbe_tmp__445;
  static  unsigned long long aesl_llvm_cbe_1076_count = 0;
  signed int *llvm_cbe_tmp__446;
  static  unsigned long long aesl_llvm_cbe_1077_count = 0;
  unsigned int llvm_cbe_tmp__447;
  static  unsigned long long aesl_llvm_cbe_1078_count = 0;
  unsigned long long llvm_cbe_tmp__448;
  static  unsigned long long aesl_llvm_cbe_1079_count = 0;
  unsigned long long llvm_cbe_tmp__449;
  static  unsigned long long aesl_llvm_cbe_1080_count = 0;
  unsigned long long llvm_cbe_tmp__450;
  static  unsigned long long aesl_llvm_cbe_1081_count = 0;
  unsigned int llvm_cbe_tmp__451;
  static  unsigned long long aesl_llvm_cbe_1082_count = 0;
  static  unsigned long long aesl_llvm_cbe_1083_count = 0;
  unsigned int llvm_cbe_tmp__452;
  static  unsigned long long aesl_llvm_cbe_1084_count = 0;
  unsigned int llvm_cbe_tmp__453;
  static  unsigned long long aesl_llvm_cbe_1085_count = 0;
  static  unsigned long long aesl_llvm_cbe_1086_count = 0;
  unsigned int llvm_cbe_tmp__454;
  static  unsigned long long aesl_llvm_cbe_1087_count = 0;
  static  unsigned long long aesl_llvm_cbe_1088_count = 0;
  unsigned int llvm_cbe_tmp__455;
  static  unsigned long long aesl_llvm_cbe_1089_count = 0;
  static  unsigned long long aesl_llvm_cbe_1090_count = 0;
  static  unsigned long long aesl_llvm_cbe_1091_count = 0;
  unsigned int llvm_cbe_tmp__456;
  static  unsigned long long aesl_llvm_cbe_1092_count = 0;
  unsigned int llvm_cbe_tmp__457;
  static  unsigned long long aesl_llvm_cbe_1093_count = 0;
  unsigned int llvm_cbe_tmp__458;
  static  unsigned long long aesl_llvm_cbe_1094_count = 0;
  unsigned int llvm_cbe_tmp__459;
  static  unsigned long long aesl_llvm_cbe_1095_count = 0;
  unsigned int llvm_cbe_tmp__460;
  static  unsigned long long aesl_llvm_cbe_1096_count = 0;
  unsigned int llvm_cbe_tmp__461;
  static  unsigned long long aesl_llvm_cbe_1097_count = 0;
  static  unsigned long long aesl_llvm_cbe_1098_count = 0;
  unsigned int llvm_cbe_tmp__462;
  static  unsigned long long aesl_llvm_cbe_1099_count = 0;
  static  unsigned long long aesl_llvm_cbe_1100_count = 0;
  unsigned int llvm_cbe_tmp__463;
  static  unsigned long long aesl_llvm_cbe_1101_count = 0;
  unsigned int llvm_cbe_tmp__464;
  static  unsigned long long aesl_llvm_cbe_1102_count = 0;
  unsigned int llvm_cbe_tmp__465;
  static  unsigned long long aesl_llvm_cbe_1103_count = 0;
  static  unsigned long long aesl_llvm_cbe_1104_count = 0;
  unsigned int llvm_cbe_tmp__466;
  static  unsigned long long aesl_llvm_cbe_1105_count = 0;
  static  unsigned long long aesl_llvm_cbe_1106_count = 0;
  static  unsigned long long aesl_llvm_cbe_1107_count = 0;
  static  unsigned long long aesl_llvm_cbe_1108_count = 0;
  static  unsigned long long aesl_llvm_cbe_1109_count = 0;
  unsigned int llvm_cbe_tmp__467;
  static  unsigned long long aesl_llvm_cbe_1110_count = 0;
  unsigned int llvm_cbe_tmp__468;
  static  unsigned long long aesl_llvm_cbe_1111_count = 0;
  static  unsigned long long aesl_llvm_cbe_1112_count = 0;
  unsigned int llvm_cbe_tmp__469;
  static  unsigned long long aesl_llvm_cbe_1113_count = 0;
  static  unsigned long long aesl_llvm_cbe_1114_count = 0;
  static  unsigned long long aesl_llvm_cbe_1115_count = 0;
  static  unsigned long long aesl_llvm_cbe_1116_count = 0;
  static  unsigned long long aesl_llvm_cbe_1117_count = 0;
  static  unsigned long long aesl_llvm_cbe_1118_count = 0;
  static  unsigned long long aesl_llvm_cbe_1119_count = 0;
  static  unsigned long long aesl_llvm_cbe_1120_count = 0;
  static  unsigned long long aesl_llvm_cbe_1121_count = 0;
  static  unsigned long long aesl_llvm_cbe_1122_count = 0;
  static  unsigned long long aesl_llvm_cbe_1123_count = 0;
  static  unsigned long long aesl_llvm_cbe_1124_count = 0;
  unsigned long long llvm_cbe_tmp__470;
  static  unsigned long long aesl_llvm_cbe_1125_count = 0;
  unsigned long long llvm_cbe_tmp__471;
  static  unsigned long long aesl_llvm_cbe_1126_count = 0;
  static  unsigned long long aesl_llvm_cbe_1127_count = 0;
  static  unsigned long long aesl_llvm_cbe_1128_count = 0;
  static  unsigned long long aesl_llvm_cbe_1129_count = 0;
  static  unsigned long long aesl_llvm_cbe_1130_count = 0;
  unsigned long long llvm_cbe_tmp__472;
  static  unsigned long long aesl_llvm_cbe_1131_count = 0;
  unsigned long long llvm_cbe_tmp__473;
  static  unsigned long long aesl_llvm_cbe_1132_count = 0;
  static  unsigned long long aesl_llvm_cbe_1133_count = 0;
  static  unsigned long long aesl_llvm_cbe_1134_count = 0;
  static  unsigned long long aesl_llvm_cbe_1135_count = 0;
  static  unsigned long long aesl_llvm_cbe_1136_count = 0;
  static  unsigned long long aesl_llvm_cbe_1137_count = 0;
  static  unsigned long long aesl_llvm_cbe_1138_count = 0;
  static  unsigned long long aesl_llvm_cbe_1139_count = 0;
  static  unsigned long long aesl_llvm_cbe_1140_count = 0;
  static  unsigned long long aesl_llvm_cbe_1141_count = 0;
  static  unsigned long long aesl_llvm_cbe_1142_count = 0;
  unsigned long long llvm_cbe_tmp__474;
  unsigned long long llvm_cbe_tmp__474__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1143_count = 0;
  unsigned long long llvm_cbe_tmp__475;
  unsigned long long llvm_cbe_tmp__475__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe__2e_rec27_count = 0;
  unsigned long long llvm_cbe__2e_rec27;
  unsigned long long llvm_cbe__2e_rec27__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe__2e_rec29_count = 0;
  unsigned long long llvm_cbe__2e_rec29;
  unsigned long long llvm_cbe__2e_rec29__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1144_count = 0;
  signed int *llvm_cbe_tmp__476;
  static  unsigned long long aesl_llvm_cbe_1145_count = 0;
  signed int *llvm_cbe_tmp__477;
  static  unsigned long long aesl_llvm_cbe__2e_sum_count = 0;
  unsigned long long llvm_cbe__2e_sum;
  static  unsigned long long aesl_llvm_cbe_1146_count = 0;
  signed int *llvm_cbe_tmp__478;
  static  unsigned long long aesl_llvm_cbe__2e_rec30_count = 0;
  unsigned long long llvm_cbe__2e_rec30;
  static  unsigned long long aesl_llvm_cbe_1147_count = 0;
  unsigned int llvm_cbe_tmp__479;
  static  unsigned long long aesl_llvm_cbe_1148_count = 0;
  unsigned long long llvm_cbe_tmp__480;
  static  unsigned long long aesl_llvm_cbe__2e_sum34_count = 0;
  unsigned long long llvm_cbe__2e_sum34;
  static  unsigned long long aesl_llvm_cbe_1149_count = 0;
  signed int *llvm_cbe_tmp__481;
  static  unsigned long long aesl_llvm_cbe_1150_count = 0;
  static  unsigned long long aesl_llvm_cbe_1151_count = 0;
  static  unsigned long long aesl_llvm_cbe_1152_count = 0;
  static  unsigned long long aesl_llvm_cbe_1153_count = 0;
  static  unsigned long long aesl_llvm_cbe_1154_count = 0;
  static  unsigned long long aesl_llvm_cbe_1155_count = 0;
  static  unsigned long long aesl_llvm_cbe_1156_count = 0;
  static  unsigned long long aesl_llvm_cbe_1157_count = 0;
  unsigned int llvm_cbe_tmp__482;
  static  unsigned long long aesl_llvm_cbe_1158_count = 0;
  unsigned long long llvm_cbe_tmp__483;
  static  unsigned long long aesl_llvm_cbe_1159_count = 0;
  unsigned long long llvm_cbe_tmp__484;
  static  unsigned long long aesl_llvm_cbe_1160_count = 0;
  unsigned long long llvm_cbe_tmp__485;
  static  unsigned long long aesl_llvm_cbe_1161_count = 0;
  static  unsigned long long aesl_llvm_cbe_1162_count = 0;
  static  unsigned long long aesl_llvm_cbe_1163_count = 0;
  static  unsigned long long aesl_llvm_cbe_1164_count = 0;
  static  unsigned long long aesl_llvm_cbe_1165_count = 0;
  unsigned int llvm_cbe_tmp__486;
  static  unsigned long long aesl_llvm_cbe_1166_count = 0;
  unsigned long long llvm_cbe_tmp__487;
  static  unsigned long long aesl_llvm_cbe__2e_rec28_count = 0;
  unsigned long long llvm_cbe__2e_rec28;
  static  unsigned long long aesl_llvm_cbe__2e_sum35_count = 0;
  unsigned long long llvm_cbe__2e_sum35;
  static  unsigned long long aesl_llvm_cbe_1167_count = 0;
  signed int *llvm_cbe_tmp__488;
  static  unsigned long long aesl_llvm_cbe_1168_count = 0;
  static  unsigned long long aesl_llvm_cbe_1169_count = 0;
  static  unsigned long long aesl_llvm_cbe_1170_count = 0;
  static  unsigned long long aesl_llvm_cbe_1171_count = 0;
  static  unsigned long long aesl_llvm_cbe_1172_count = 0;
  static  unsigned long long aesl_llvm_cbe_1173_count = 0;
  static  unsigned long long aesl_llvm_cbe_1174_count = 0;
  static  unsigned long long aesl_llvm_cbe_1175_count = 0;
  unsigned int llvm_cbe_tmp__489;
  static  unsigned long long aesl_llvm_cbe_1176_count = 0;
  unsigned long long llvm_cbe_tmp__490;
  static  unsigned long long aesl_llvm_cbe_1177_count = 0;
  unsigned long long llvm_cbe_tmp__491;
  static  unsigned long long aesl_llvm_cbe_1178_count = 0;
  unsigned long long llvm_cbe_tmp__492;
  static  unsigned long long aesl_llvm_cbe_1179_count = 0;
  static  unsigned long long aesl_llvm_cbe_1180_count = 0;
  static  unsigned long long aesl_llvm_cbe_1181_count = 0;
  static  unsigned long long aesl_llvm_cbe_1182_count = 0;
  static  unsigned long long aesl_llvm_cbe_lftr_2e_wideiv_count = 0;
  unsigned int llvm_cbe_lftr_2e_wideiv;
  static  unsigned long long aesl_llvm_cbe_exitcond33_count = 0;
  static  unsigned long long aesl_llvm_cbe_1183_count = 0;
  static  unsigned long long aesl_llvm_cbe_1184_count = 0;
  static  unsigned long long aesl_llvm_cbe_1185_count = 0;
  static  unsigned long long aesl_llvm_cbe_1186_count = 0;
  static  unsigned long long aesl_llvm_cbe_1187_count = 0;
  static  unsigned long long aesl_llvm_cbe_1188_count = 0;
  unsigned int llvm_cbe_tmp__493;
  static  unsigned long long aesl_llvm_cbe_1189_count = 0;
  unsigned long long llvm_cbe_tmp__494;
  static  unsigned long long aesl_llvm_cbe__2e_sum36_count = 0;
  unsigned long long llvm_cbe__2e_sum36;
  static  unsigned long long aesl_llvm_cbe_1190_count = 0;
  signed int *llvm_cbe_tmp__495;
  static  unsigned long long aesl_llvm_cbe_1191_count = 0;
  static  unsigned long long aesl_llvm_cbe_1192_count = 0;
  static  unsigned long long aesl_llvm_cbe_1193_count = 0;
  static  unsigned long long aesl_llvm_cbe_1194_count = 0;
  static  unsigned long long aesl_llvm_cbe_1195_count = 0;
  static  unsigned long long aesl_llvm_cbe_1196_count = 0;
  static  unsigned long long aesl_llvm_cbe_1197_count = 0;
  static  unsigned long long aesl_llvm_cbe_1198_count = 0;
  unsigned int llvm_cbe_tmp__496;
  static  unsigned long long aesl_llvm_cbe_1199_count = 0;
  unsigned long long llvm_cbe_tmp__497;
  static  unsigned long long aesl_llvm_cbe_1200_count = 0;
  unsigned long long llvm_cbe_tmp__498;
  static  unsigned long long aesl_llvm_cbe_1201_count = 0;
  unsigned long long llvm_cbe_tmp__499;
  static  unsigned long long aesl_llvm_cbe_1202_count = 0;
  static  unsigned long long aesl_llvm_cbe_1203_count = 0;
  static  unsigned long long aesl_llvm_cbe_1204_count = 0;
  static  unsigned long long aesl_llvm_cbe_1205_count = 0;
  static  unsigned long long aesl_llvm_cbe_1206_count = 0;
  unsigned int llvm_cbe_tmp__500;
  static  unsigned long long aesl_llvm_cbe_1207_count = 0;
  unsigned long long llvm_cbe_tmp__501;
  static  unsigned long long aesl_llvm_cbe_1208_count = 0;
  unsigned int llvm_cbe_tmp__502;
  static  unsigned long long aesl_llvm_cbe_1209_count = 0;
  unsigned long long llvm_cbe_tmp__503;
  static  unsigned long long aesl_llvm_cbe_1210_count = 0;
  unsigned long long llvm_cbe_tmp__504;
  static  unsigned long long aesl_llvm_cbe_1211_count = 0;
  unsigned long long llvm_cbe_tmp__505;
  static  unsigned long long aesl_llvm_cbe_1212_count = 0;
  static  unsigned long long aesl_llvm_cbe_1213_count = 0;
  static  unsigned long long aesl_llvm_cbe_1214_count = 0;
  static  unsigned long long aesl_llvm_cbe_1215_count = 0;
  static  unsigned long long aesl_llvm_cbe_1216_count = 0;
  unsigned long long llvm_cbe_tmp__506;
  static  unsigned long long aesl_llvm_cbe_1217_count = 0;
  unsigned int llvm_cbe_tmp__507;
  static  unsigned long long aesl_llvm_cbe_1218_count = 0;
  static  unsigned long long aesl_llvm_cbe_1219_count = 0;
  unsigned long long llvm_cbe_tmp__508;
  static  unsigned long long aesl_llvm_cbe_1220_count = 0;
  unsigned int llvm_cbe_tmp__509;
  static  unsigned long long aesl_llvm_cbe_1221_count = 0;
  static  unsigned long long aesl_llvm_cbe_1222_count = 0;
  static  unsigned long long aesl_llvm_cbe_1223_count = 0;
  static  unsigned long long aesl_llvm_cbe_1224_count = 0;
  static  unsigned long long aesl_llvm_cbe_1225_count = 0;
  static  unsigned long long aesl_llvm_cbe_1226_count = 0;
  static  unsigned long long aesl_llvm_cbe_1227_count = 0;
  static  unsigned long long aesl_llvm_cbe_1228_count = 0;
  static  unsigned long long aesl_llvm_cbe_1229_count = 0;
  static  unsigned long long aesl_llvm_cbe_1230_count = 0;
  static  unsigned long long aesl_llvm_cbe_1231_count = 0;
  static  unsigned long long aesl_llvm_cbe_1232_count = 0;
  static  unsigned long long aesl_llvm_cbe_1233_count = 0;
  static  unsigned long long aesl_llvm_cbe_1234_count = 0;
  static  unsigned long long aesl_llvm_cbe_1235_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum37_count = 0;
  unsigned long long llvm_cbe__2e_sum37;
  static  unsigned long long aesl_llvm_cbe_1236_count = 0;
  signed int *llvm_cbe_tmp__510;
  static  unsigned long long aesl_llvm_cbe__2e_sum38_count = 0;
  unsigned long long llvm_cbe__2e_sum38;
  static  unsigned long long aesl_llvm_cbe_1237_count = 0;
  signed int *llvm_cbe_tmp__511;
  static  unsigned long long aesl_llvm_cbe_1238_count = 0;
  unsigned int llvm_cbe_tmp__512;
  static  unsigned long long aesl_llvm_cbe_1239_count = 0;
  static  unsigned long long aesl_llvm_cbe_1240_count = 0;
  unsigned int llvm_cbe_tmp__513;
  static  unsigned long long aesl_llvm_cbe_1241_count = 0;
  static  unsigned long long aesl_llvm_cbe_1242_count = 0;
  static  unsigned long long aesl_llvm_cbe_1243_count = 0;
  static  unsigned long long aesl_llvm_cbe_1244_count = 0;
  static  unsigned long long aesl_llvm_cbe_1245_count = 0;
  static  unsigned long long aesl_llvm_cbe_1246_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum39_count = 0;
  unsigned long long llvm_cbe__2e_sum39;
  static  unsigned long long aesl_llvm_cbe_1247_count = 0;
  signed int *llvm_cbe_tmp__514;
  static  unsigned long long aesl_llvm_cbe__2e_sum40_count = 0;
  unsigned long long llvm_cbe__2e_sum40;
  static  unsigned long long aesl_llvm_cbe_1248_count = 0;
  signed int *llvm_cbe_tmp__515;
  static  unsigned long long aesl_llvm_cbe_1249_count = 0;
  unsigned int llvm_cbe_tmp__516;
  static  unsigned long long aesl_llvm_cbe_1250_count = 0;
  static  unsigned long long aesl_llvm_cbe_1251_count = 0;
  unsigned int llvm_cbe_tmp__517;
  static  unsigned long long aesl_llvm_cbe_1252_count = 0;
  static  unsigned long long aesl_llvm_cbe_1253_count = 0;
  static  unsigned long long aesl_llvm_cbe_1254_count = 0;
  static  unsigned long long aesl_llvm_cbe_1255_count = 0;
  static  unsigned long long aesl_llvm_cbe_1256_count = 0;
  static  unsigned long long aesl_llvm_cbe_1257_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum41_count = 0;
  unsigned long long llvm_cbe__2e_sum41;
  static  unsigned long long aesl_llvm_cbe_1258_count = 0;
  signed int *llvm_cbe_tmp__518;
  static  unsigned long long aesl_llvm_cbe__2e_sum42_count = 0;
  unsigned long long llvm_cbe__2e_sum42;
  static  unsigned long long aesl_llvm_cbe_1259_count = 0;
  signed int *llvm_cbe_tmp__519;
  static  unsigned long long aesl_llvm_cbe_1260_count = 0;
  unsigned int llvm_cbe_tmp__520;
  static  unsigned long long aesl_llvm_cbe_1261_count = 0;
  static  unsigned long long aesl_llvm_cbe_1262_count = 0;
  unsigned int llvm_cbe_tmp__521;
  static  unsigned long long aesl_llvm_cbe_1263_count = 0;
  static  unsigned long long aesl_llvm_cbe_1264_count = 0;
  static  unsigned long long aesl_llvm_cbe_1265_count = 0;
  static  unsigned long long aesl_llvm_cbe_1266_count = 0;
  static  unsigned long long aesl_llvm_cbe_1267_count = 0;
  static  unsigned long long aesl_llvm_cbe_1268_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum43_count = 0;
  unsigned long long llvm_cbe__2e_sum43;
  static  unsigned long long aesl_llvm_cbe_1269_count = 0;
  signed int *llvm_cbe_tmp__522;
  static  unsigned long long aesl_llvm_cbe__2e_sum44_count = 0;
  unsigned long long llvm_cbe__2e_sum44;
  static  unsigned long long aesl_llvm_cbe_1270_count = 0;
  signed int *llvm_cbe_tmp__523;
  static  unsigned long long aesl_llvm_cbe_1271_count = 0;
  unsigned int llvm_cbe_tmp__524;
  static  unsigned long long aesl_llvm_cbe_1272_count = 0;
  static  unsigned long long aesl_llvm_cbe_1273_count = 0;
  unsigned int llvm_cbe_tmp__525;
  static  unsigned long long aesl_llvm_cbe_1274_count = 0;
  static  unsigned long long aesl_llvm_cbe_1275_count = 0;
  static  unsigned long long aesl_llvm_cbe_1276_count = 0;
  static  unsigned long long aesl_llvm_cbe_1277_count = 0;
  static  unsigned long long aesl_llvm_cbe_1278_count = 0;
  static  unsigned long long aesl_llvm_cbe_1279_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum45_count = 0;
  unsigned long long llvm_cbe__2e_sum45;
  static  unsigned long long aesl_llvm_cbe_1280_count = 0;
  signed int *llvm_cbe_tmp__526;
  static  unsigned long long aesl_llvm_cbe__2e_sum46_count = 0;
  unsigned long long llvm_cbe__2e_sum46;
  static  unsigned long long aesl_llvm_cbe_1281_count = 0;
  signed int *llvm_cbe_tmp__527;
  static  unsigned long long aesl_llvm_cbe_1282_count = 0;
  unsigned int llvm_cbe_tmp__528;
  static  unsigned long long aesl_llvm_cbe_1283_count = 0;
  static  unsigned long long aesl_llvm_cbe_1284_count = 0;
  unsigned int llvm_cbe_tmp__529;
  static  unsigned long long aesl_llvm_cbe_1285_count = 0;
  static  unsigned long long aesl_llvm_cbe_1286_count = 0;
  static  unsigned long long aesl_llvm_cbe_1287_count = 0;
  static  unsigned long long aesl_llvm_cbe_1288_count = 0;
  static  unsigned long long aesl_llvm_cbe_1289_count = 0;
  static  unsigned long long aesl_llvm_cbe_1290_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum47_count = 0;
  unsigned long long llvm_cbe__2e_sum47;
  static  unsigned long long aesl_llvm_cbe_1291_count = 0;
  signed int *llvm_cbe_tmp__530;
  static  unsigned long long aesl_llvm_cbe__2e_sum48_count = 0;
  unsigned long long llvm_cbe__2e_sum48;
  static  unsigned long long aesl_llvm_cbe_1292_count = 0;
  signed int *llvm_cbe_tmp__531;
  static  unsigned long long aesl_llvm_cbe_1293_count = 0;
  unsigned int llvm_cbe_tmp__532;
  static  unsigned long long aesl_llvm_cbe_1294_count = 0;
  static  unsigned long long aesl_llvm_cbe_1295_count = 0;
  unsigned int llvm_cbe_tmp__533;
  static  unsigned long long aesl_llvm_cbe_1296_count = 0;
  static  unsigned long long aesl_llvm_cbe_1297_count = 0;
  static  unsigned long long aesl_llvm_cbe_1298_count = 0;
  static  unsigned long long aesl_llvm_cbe_1299_count = 0;
  static  unsigned long long aesl_llvm_cbe_1300_count = 0;
  static  unsigned long long aesl_llvm_cbe_1301_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum49_count = 0;
  unsigned long long llvm_cbe__2e_sum49;
  static  unsigned long long aesl_llvm_cbe_1302_count = 0;
  signed int *llvm_cbe_tmp__534;
  static  unsigned long long aesl_llvm_cbe__2e_sum50_count = 0;
  unsigned long long llvm_cbe__2e_sum50;
  static  unsigned long long aesl_llvm_cbe_1303_count = 0;
  signed int *llvm_cbe_tmp__535;
  static  unsigned long long aesl_llvm_cbe_1304_count = 0;
  unsigned int llvm_cbe_tmp__536;
  static  unsigned long long aesl_llvm_cbe_1305_count = 0;
  static  unsigned long long aesl_llvm_cbe_1306_count = 0;
  unsigned int llvm_cbe_tmp__537;
  static  unsigned long long aesl_llvm_cbe_1307_count = 0;
  static  unsigned long long aesl_llvm_cbe_1308_count = 0;
  static  unsigned long long aesl_llvm_cbe_1309_count = 0;
  static  unsigned long long aesl_llvm_cbe_1310_count = 0;
  static  unsigned long long aesl_llvm_cbe_1311_count = 0;
  static  unsigned long long aesl_llvm_cbe_1312_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum51_count = 0;
  unsigned long long llvm_cbe__2e_sum51;
  static  unsigned long long aesl_llvm_cbe_1313_count = 0;
  signed int *llvm_cbe_tmp__538;
  static  unsigned long long aesl_llvm_cbe__2e_sum52_count = 0;
  unsigned long long llvm_cbe__2e_sum52;
  static  unsigned long long aesl_llvm_cbe_1314_count = 0;
  signed int *llvm_cbe_tmp__539;
  static  unsigned long long aesl_llvm_cbe_1315_count = 0;
  unsigned int llvm_cbe_tmp__540;
  static  unsigned long long aesl_llvm_cbe_1316_count = 0;
  static  unsigned long long aesl_llvm_cbe_1317_count = 0;
  unsigned int llvm_cbe_tmp__541;
  static  unsigned long long aesl_llvm_cbe_1318_count = 0;
  static  unsigned long long aesl_llvm_cbe_1319_count = 0;
  static  unsigned long long aesl_llvm_cbe_1320_count = 0;
  static  unsigned long long aesl_llvm_cbe_1321_count = 0;
  static  unsigned long long aesl_llvm_cbe_1322_count = 0;
  static  unsigned long long aesl_llvm_cbe_1323_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum53_count = 0;
  unsigned long long llvm_cbe__2e_sum53;
  static  unsigned long long aesl_llvm_cbe_1324_count = 0;
  signed int *llvm_cbe_tmp__542;
  static  unsigned long long aesl_llvm_cbe__2e_sum54_count = 0;
  unsigned long long llvm_cbe__2e_sum54;
  static  unsigned long long aesl_llvm_cbe_1325_count = 0;
  signed int *llvm_cbe_tmp__543;
  static  unsigned long long aesl_llvm_cbe_1326_count = 0;
  unsigned int llvm_cbe_tmp__544;
  static  unsigned long long aesl_llvm_cbe_1327_count = 0;
  static  unsigned long long aesl_llvm_cbe_1328_count = 0;
  unsigned int llvm_cbe_tmp__545;
  static  unsigned long long aesl_llvm_cbe_1329_count = 0;
  static  unsigned long long aesl_llvm_cbe_1330_count = 0;
  static  unsigned long long aesl_llvm_cbe_1331_count = 0;
  static  unsigned long long aesl_llvm_cbe_1332_count = 0;
  static  unsigned long long aesl_llvm_cbe_1333_count = 0;
  static  unsigned long long aesl_llvm_cbe_1334_count = 0;
  static  unsigned long long aesl_llvm_cbe_1335_count = 0;
  static  unsigned long long aesl_llvm_cbe_1336_count = 0;
  static  unsigned long long aesl_llvm_cbe_1337_count = 0;
  static  unsigned long long aesl_llvm_cbe_1338_count = 0;
  static  unsigned long long aesl_llvm_cbe_1339_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @decode\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = and i32 %%input, 63, !dbg !22 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_999_count);
  llvm_cbe_tmp__392 = (unsigned int )llvm_cbe_input & 63u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__392);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%1, i32* @ilr, align 4, !dbg !22 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1000_count);
  *(&ilr) = llvm_cbe_tmp__392;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__392);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = ashr i32 %%input, 6, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1002_count);
  llvm_cbe_tmp__393 = (unsigned int )((signed int )(((signed int )llvm_cbe_input) >> ((signed int )6u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__393));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%2, i32* @ih, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1003_count);
  *(&ih) = llvm_cbe_tmp__393;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__393);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = tail call i32 @filtez(i32* getelementptr inbounds ([6 x i32]* @dec_del_bpl, i64 0, i64 0), i32* getelementptr inbounds ([6 x i32]* @dec_del_dltx, i64 0, i64 0)), !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1004_count);
  llvm_cbe_tmp__394 = (unsigned int ) /*tail*/ filtez((signed int *)((&dec_del_bpl[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])), (signed int *)((&dec_del_dltx[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__394);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%3, i32* @dec_szl, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1005_count);
  *(&dec_szl) = llvm_cbe_tmp__394;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__394);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load i32* @dec_rlt1, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1006_count);
  llvm_cbe_tmp__395 = (unsigned int )*(&dec_rlt1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__395);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = load i32* @dec_al1, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1007_count);
  llvm_cbe_tmp__396 = (unsigned int )*(&dec_al1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__396);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = load i32* @dec_rlt2, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1008_count);
  llvm_cbe_tmp__397 = (unsigned int )*(&dec_rlt2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__397);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i32* @dec_al2, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1009_count);
  llvm_cbe_tmp__398 = (unsigned int )*(&dec_al2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__398);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = tail call i32 @filtep(i32 %%4, i32 %%5, i32 %%6, i32 %%7), !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1010_count);
  llvm_cbe_tmp__399 = (unsigned int ) /*tail*/ filtep(llvm_cbe_tmp__395, llvm_cbe_tmp__396, llvm_cbe_tmp__397, llvm_cbe_tmp__398);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__395);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__396);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__397);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__398);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__399);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%8, i32* @dec_spl, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1011_count);
  *(&dec_spl) = llvm_cbe_tmp__399;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__399);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add nsw i32 %%3, %%8, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1012_count);
  llvm_cbe_tmp__400 = (unsigned int )((unsigned int )(llvm_cbe_tmp__394&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__399&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__400&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%9, i32* @dec_sl, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1013_count);
  *(&dec_sl) = llvm_cbe_tmp__400;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__400);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = load i32* @dec_detl, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1014_count);
  llvm_cbe_tmp__401 = (unsigned int )*(&dec_detl);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__401);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = sext i32 %%10 to i64, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1015_count);
  llvm_cbe_tmp__402 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__401);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__402);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = lshr i32 %%1, 2, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1016_count);
  llvm_cbe_tmp__403 = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_tmp__392&4294967295ull)) >> ((unsigned int )(2u&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__403&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = zext i32 %%12 to i64, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1017_count);
  llvm_cbe_tmp__404 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__403&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__404);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = getelementptr inbounds [16 x i32]* @qq4_code4_table, i64 0, i64 %%13, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1018_count);
  llvm_cbe_tmp__405 = (signed int *)(&qq4_code4_table[(((signed long long )llvm_cbe_tmp__404))
#ifdef AESL_BC_SIM
 % 16
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__404));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__404) < 16)) fprintf(stderr, "%s:%d: warning: Read access out of array 'qq4_code4_table' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = load i32* %%14, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1019_count);
  llvm_cbe_tmp__406 = (unsigned int )*llvm_cbe_tmp__405;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__406);
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = sext i32 %%15 to i64, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1020_count);
  llvm_cbe_tmp__407 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__406);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__407);
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = mul nsw i64 %%16, %%11, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1021_count);
  llvm_cbe_tmp__408 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__407&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__402&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__408&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = lshr i64 %%17, 15, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1022_count);
  llvm_cbe_tmp__409 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__408&18446744073709551615ull)) >> ((unsigned long long )(15ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__409&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = trunc i64 %%18 to i32, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1023_count);
  llvm_cbe_tmp__410 = (unsigned int )((unsigned int )llvm_cbe_tmp__409&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__410);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%19, i32* @dec_dlt, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1024_count);
  *(&dec_dlt) = llvm_cbe_tmp__410;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__410);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = load i32* @il, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1025_count);
  llvm_cbe_tmp__411 = (unsigned int )*(&il);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__411);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = sext i32 %%20 to i64, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1026_count);
  llvm_cbe_tmp__412 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__411);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__412);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = getelementptr inbounds [64 x i32]* @qq6_code6_table, i64 0, i64 %%21, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1027_count);
  llvm_cbe_tmp__413 = (signed int *)(&qq6_code6_table[(((signed long long )llvm_cbe_tmp__412))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__412));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__412) < 64)) fprintf(stderr, "%s:%d: warning: Read access out of array 'qq6_code6_table' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = load i32* %%22, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1028_count);
  llvm_cbe_tmp__414 = (unsigned int )*llvm_cbe_tmp__413;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__414);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = sext i32 %%23 to i64, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1029_count);
  llvm_cbe_tmp__415 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__414);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__415);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = mul nsw i64 %%24, %%11, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1030_count);
  llvm_cbe_tmp__416 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__415&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__402&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__416&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = lshr i64 %%25, 15, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1031_count);
  llvm_cbe_tmp__417 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__416&18446744073709551615ull)) >> ((unsigned long long )(15ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__417&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = trunc i64 %%26 to i32, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1032_count);
  llvm_cbe_tmp__418 = (unsigned int )((unsigned int )llvm_cbe_tmp__417&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__418);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%27, i32* @dl, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1033_count);
  *(&dl) = llvm_cbe_tmp__418;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__418);
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = add nsw i32 %%27, %%9, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1034_count);
  llvm_cbe_tmp__419 = (unsigned int )((unsigned int )(llvm_cbe_tmp__418&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__400&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__419&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%28, i32* @rl, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1035_count);
  *(&rl) = llvm_cbe_tmp__419;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__419);
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = load i32* @dec_nbl, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1036_count);
  llvm_cbe_tmp__420 = (unsigned int )*(&dec_nbl);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__420);
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = tail call i32 @logscl(i32 %%1, i32 %%29), !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1037_count);
  llvm_cbe_tmp__421 = (unsigned int ) /*tail*/ logscl(llvm_cbe_tmp__392, llvm_cbe_tmp__420);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__392);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__420);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__421);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%30, i32* @dec_nbl, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1038_count);
  *(&dec_nbl) = llvm_cbe_tmp__421;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__421);
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = tail call i32 @scalel(i32 %%30, i32 8), !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1039_count);
  llvm_cbe_tmp__422 = (unsigned int ) /*tail*/ scalel(llvm_cbe_tmp__421, 8u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__421);
printf("\nArgument  = 0x%X",8u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__422);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%31, i32* @dec_detl, align 4, !dbg !23 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1040_count);
  *(&dec_detl) = llvm_cbe_tmp__422;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__422);
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = add nsw i32 %%3, %%19, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1041_count);
  llvm_cbe_tmp__423 = (unsigned int )((unsigned int )(llvm_cbe_tmp__394&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__410&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__423&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%32, i32* @dec_plt, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1042_count);
  *(&dec_plt) = llvm_cbe_tmp__423;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__423);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @upzero(i32 %%19, i32* getelementptr inbounds ([6 x i32]* @dec_del_dltx, i64 0, i64 0), i32* getelementptr inbounds ([6 x i32]* @dec_del_bpl, i64 0, i64 0)), !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1043_count);
   /*tail*/ upzero(llvm_cbe_tmp__410, (signed int *)((&dec_del_dltx[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])), (signed int *)((&dec_del_bpl[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__410);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = load i32* @dec_al1, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1044_count);
  llvm_cbe_tmp__424 = (unsigned int )*(&dec_al1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__424);
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = load i32* @dec_al2, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1045_count);
  llvm_cbe_tmp__425 = (unsigned int )*(&dec_al2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__425);
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = load i32* @dec_plt, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1046_count);
  llvm_cbe_tmp__426 = (unsigned int )*(&dec_plt);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__426);
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = load i32* @dec_plt1, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1047_count);
  llvm_cbe_tmp__427 = (unsigned int )*(&dec_plt1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__427);
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = load i32* @dec_plt2, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1048_count);
  llvm_cbe_tmp__428 = (unsigned int )*(&dec_plt2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__428);
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = tail call i32 @uppol2(i32 %%33, i32 %%34, i32 %%35, i32 %%36, i32 %%37), !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1049_count);
  llvm_cbe_tmp__429 = (unsigned int ) /*tail*/ uppol2(llvm_cbe_tmp__424, llvm_cbe_tmp__425, llvm_cbe_tmp__426, llvm_cbe_tmp__427, llvm_cbe_tmp__428);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__424);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__425);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__426);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__427);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__428);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__429);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%38, i32* @dec_al2, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1050_count);
  *(&dec_al2) = llvm_cbe_tmp__429;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__429);
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = tail call i32 @uppol1(i32 %%33, i32 %%38, i32 %%35, i32 %%36), !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1051_count);
  llvm_cbe_tmp__430 = (unsigned int ) /*tail*/ uppol1(llvm_cbe_tmp__424, llvm_cbe_tmp__429, llvm_cbe_tmp__426, llvm_cbe_tmp__427);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__424);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__429);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__426);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__427);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__430);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%39, i32* @dec_al1, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1052_count);
  *(&dec_al1) = llvm_cbe_tmp__430;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__430);
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = load i32* @dec_sl, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1053_count);
  llvm_cbe_tmp__431 = (unsigned int )*(&dec_sl);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__431);
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = load i32* @dec_dlt, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1054_count);
  llvm_cbe_tmp__432 = (unsigned int )*(&dec_dlt);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__432);
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = add nsw i32 %%41, %%40, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1055_count);
  llvm_cbe_tmp__433 = (unsigned int )((unsigned int )(llvm_cbe_tmp__432&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__431&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__433&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%42, i32* @dec_rlt, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1056_count);
  *(&dec_rlt) = llvm_cbe_tmp__433;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__433);
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = load i32* @dec_rlt1, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1057_count);
  llvm_cbe_tmp__434 = (unsigned int )*(&dec_rlt1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__434);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%43, i32* @dec_rlt2, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1058_count);
  *(&dec_rlt2) = llvm_cbe_tmp__434;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__434);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%42, i32* @dec_rlt1, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1059_count);
  *(&dec_rlt1) = llvm_cbe_tmp__433;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__433);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%36, i32* @dec_plt2, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1060_count);
  *(&dec_plt2) = llvm_cbe_tmp__427;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__427);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%35, i32* @dec_plt1, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1061_count);
  *(&dec_plt1) = llvm_cbe_tmp__426;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__426);
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = tail call i32 @filtez(i32* getelementptr inbounds ([6 x i32]* @dec_del_bph, i64 0, i64 0), i32* getelementptr inbounds ([6 x i32]* @dec_del_dhx, i64 0, i64 0)), !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1062_count);
  llvm_cbe_tmp__435 = (unsigned int ) /*tail*/ filtez((signed int *)((&dec_del_bph[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])), (signed int *)((&dec_del_dhx[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__435);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%44, i32* @dec_szh, align 4, !dbg !24 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1063_count);
  *(&dec_szh) = llvm_cbe_tmp__435;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__435);
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = load i32* @dec_rh1, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1064_count);
  llvm_cbe_tmp__436 = (unsigned int )*(&dec_rh1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__436);
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = load i32* @dec_ah1, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1065_count);
  llvm_cbe_tmp__437 = (unsigned int )*(&dec_ah1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__437);
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = load i32* @dec_rh2, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1066_count);
  llvm_cbe_tmp__438 = (unsigned int )*(&dec_rh2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__438);
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = load i32* @dec_ah2, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1067_count);
  llvm_cbe_tmp__439 = (unsigned int )*(&dec_ah2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__439);
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = tail call i32 @filtep(i32 %%45, i32 %%46, i32 %%47, i32 %%48), !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1068_count);
  llvm_cbe_tmp__440 = (unsigned int ) /*tail*/ filtep(llvm_cbe_tmp__436, llvm_cbe_tmp__437, llvm_cbe_tmp__438, llvm_cbe_tmp__439);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__436);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__437);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__438);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__439);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__440);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%49, i32* @dec_sph, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1069_count);
  *(&dec_sph) = llvm_cbe_tmp__440;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__440);
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = add nsw i32 %%44, %%49, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1070_count);
  llvm_cbe_tmp__441 = (unsigned int )((unsigned int )(llvm_cbe_tmp__435&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__440&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__441&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%50, i32* @dec_sh, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1071_count);
  *(&dec_sh) = llvm_cbe_tmp__441;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__441);
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = load i32* @dec_deth, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1072_count);
  llvm_cbe_tmp__442 = (unsigned int )*(&dec_deth);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__442);
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = sext i32 %%51 to i64, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1073_count);
  llvm_cbe_tmp__443 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__442);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__443);
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = load i32* @ih, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1074_count);
  llvm_cbe_tmp__444 = (unsigned int )*(&ih);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__444);
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = sext i32 %%53 to i64, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1075_count);
  llvm_cbe_tmp__445 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__444);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__445);
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = getelementptr inbounds [4 x i32]* @qq2_code2_table, i64 0, i64 %%54, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1076_count);
  llvm_cbe_tmp__446 = (signed int *)(&qq2_code2_table[(((signed long long )llvm_cbe_tmp__445))
#ifdef AESL_BC_SIM
 % 4
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__445));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__445) < 4)) fprintf(stderr, "%s:%d: warning: Read access out of array 'qq2_code2_table' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = load i32* %%55, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1077_count);
  llvm_cbe_tmp__447 = (unsigned int )*llvm_cbe_tmp__446;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__447);
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = sext i32 %%56 to i64, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1078_count);
  llvm_cbe_tmp__448 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__447);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__448);
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = mul nsw i64 %%57, %%52, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1079_count);
  llvm_cbe_tmp__449 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__448&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__443&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__449&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = lshr i64 %%58, 15, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1080_count);
  llvm_cbe_tmp__450 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__449&18446744073709551615ull)) >> ((unsigned long long )(15ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__450&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = trunc i64 %%59 to i32, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1081_count);
  llvm_cbe_tmp__451 = (unsigned int )((unsigned int )llvm_cbe_tmp__450&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__451);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%60, i32* @dec_dh, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1082_count);
  *(&dec_dh) = llvm_cbe_tmp__451;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__451);
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = load i32* @dec_nbh, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1083_count);
  llvm_cbe_tmp__452 = (unsigned int )*(&dec_nbh);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__452);
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = tail call i32 @logsch(i32 %%53, i32 %%61), !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1084_count);
  llvm_cbe_tmp__453 = (unsigned int ) /*tail*/ logsch(llvm_cbe_tmp__444, llvm_cbe_tmp__452);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__444);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__452);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__453);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%62, i32* @dec_nbh, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1085_count);
  *(&dec_nbh) = llvm_cbe_tmp__453;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__453);
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = tail call i32 @scalel(i32 %%62, i32 10), !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1086_count);
  llvm_cbe_tmp__454 = (unsigned int ) /*tail*/ scalel(llvm_cbe_tmp__453, 10u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__453);
printf("\nArgument  = 0x%X",10u);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__454);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%63, i32* @dec_deth, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1087_count);
  *(&dec_deth) = llvm_cbe_tmp__454;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__454);
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = add nsw i32 %%44, %%60, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1088_count);
  llvm_cbe_tmp__455 = (unsigned int )((unsigned int )(llvm_cbe_tmp__435&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__451&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__455&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%64, i32* @dec_ph, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1089_count);
  *(&dec_ph) = llvm_cbe_tmp__455;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__455);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @upzero(i32 %%60, i32* getelementptr inbounds ([6 x i32]* @dec_del_dhx, i64 0, i64 0), i32* getelementptr inbounds ([6 x i32]* @dec_del_bph, i64 0, i64 0)), !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1090_count);
   /*tail*/ upzero(llvm_cbe_tmp__451, (signed int *)((&dec_del_dhx[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])), (signed int *)((&dec_del_bph[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__451);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = load i32* @dec_ah1, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1091_count);
  llvm_cbe_tmp__456 = (unsigned int )*(&dec_ah1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__456);
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = load i32* @dec_ah2, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1092_count);
  llvm_cbe_tmp__457 = (unsigned int )*(&dec_ah2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__457);
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = load i32* @dec_ph, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1093_count);
  llvm_cbe_tmp__458 = (unsigned int )*(&dec_ph);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__458);
if (AESL_DEBUG_TRACE)
printf("\n  %%68 = load i32* @dec_ph1, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1094_count);
  llvm_cbe_tmp__459 = (unsigned int )*(&dec_ph1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__459);
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = load i32* @dec_ph2, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1095_count);
  llvm_cbe_tmp__460 = (unsigned int )*(&dec_ph2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__460);
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = tail call i32 @uppol2(i32 %%65, i32 %%66, i32 %%67, i32 %%68, i32 %%69), !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1096_count);
  llvm_cbe_tmp__461 = (unsigned int ) /*tail*/ uppol2(llvm_cbe_tmp__456, llvm_cbe_tmp__457, llvm_cbe_tmp__458, llvm_cbe_tmp__459, llvm_cbe_tmp__460);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__456);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__457);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__458);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__459);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__460);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__461);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%70, i32* @dec_ah2, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1097_count);
  *(&dec_ah2) = llvm_cbe_tmp__461;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__461);
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = tail call i32 @uppol1(i32 %%65, i32 %%70, i32 %%67, i32 %%68), !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1098_count);
  llvm_cbe_tmp__462 = (unsigned int ) /*tail*/ uppol1(llvm_cbe_tmp__456, llvm_cbe_tmp__461, llvm_cbe_tmp__458, llvm_cbe_tmp__459);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__456);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__461);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__458);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__459);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__462);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%71, i32* @dec_ah1, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1099_count);
  *(&dec_ah1) = llvm_cbe_tmp__462;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__462);
if (AESL_DEBUG_TRACE)
printf("\n  %%72 = load i32* @dec_sh, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1100_count);
  llvm_cbe_tmp__463 = (unsigned int )*(&dec_sh);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__463);
if (AESL_DEBUG_TRACE)
printf("\n  %%73 = load i32* @dec_dh, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1101_count);
  llvm_cbe_tmp__464 = (unsigned int )*(&dec_dh);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__464);
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = add nsw i32 %%73, %%72, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1102_count);
  llvm_cbe_tmp__465 = (unsigned int )((unsigned int )(llvm_cbe_tmp__464&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__463&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__465&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%74, i32* @rh, align 4, !dbg !25 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1103_count);
  *(&rh) = llvm_cbe_tmp__465;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__465);
if (AESL_DEBUG_TRACE)
printf("\n  %%75 = load i32* @dec_rh1, align 4, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1104_count);
  llvm_cbe_tmp__466 = (unsigned int )*(&dec_rh1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__466);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%75, i32* @dec_rh2, align 4, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1105_count);
  *(&dec_rh2) = llvm_cbe_tmp__466;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__466);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%74, i32* @dec_rh1, align 4, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1106_count);
  *(&dec_rh1) = llvm_cbe_tmp__465;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__465);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%68, i32* @dec_ph2, align 4, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1107_count);
  *(&dec_ph2) = llvm_cbe_tmp__459;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__459);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%67, i32* @dec_ph1, align 4, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1108_count);
  *(&dec_ph1) = llvm_cbe_tmp__458;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__458);
if (AESL_DEBUG_TRACE)
printf("\n  %%76 = load i32* @rl, align 4, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1109_count);
  llvm_cbe_tmp__467 = (unsigned int )*(&rl);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__467);
if (AESL_DEBUG_TRACE)
printf("\n  %%77 = sub nsw i32 %%76, %%74, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1110_count);
  llvm_cbe_tmp__468 = (unsigned int )((unsigned int )(llvm_cbe_tmp__467&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__465&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__468&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%77, i32* @xd, align 4, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1111_count);
  *(&xd) = llvm_cbe_tmp__468;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__468);
if (AESL_DEBUG_TRACE)
printf("\n  %%78 = add nsw i32 %%74, %%76, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1112_count);
  llvm_cbe_tmp__469 = (unsigned int )((unsigned int )(llvm_cbe_tmp__465&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__467&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__469&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%78, i32* @xs, align 4, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1113_count);
  *(&xs) = llvm_cbe_tmp__469;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__469);
if (AESL_DEBUG_TRACE)
printf("\n  %%79 = sext i32 %%77 to i64, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1124_count);
  llvm_cbe_tmp__470 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__468);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__470);
if (AESL_DEBUG_TRACE)
printf("\n  %%80 = mul nsw i64 %%79, 12, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1125_count);
  llvm_cbe_tmp__471 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__470&18446744073709551615ull)) * ((unsigned long long )(12ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__471&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%81 = sext i32 %%78 to i64, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1130_count);
  llvm_cbe_tmp__472 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__469);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__472);
if (AESL_DEBUG_TRACE)
printf("\n  %%82 = mul nsw i64 %%81, -44, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1131_count);
  llvm_cbe_tmp__473 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__472&18446744073709551615ull)) * ((unsigned long long )(18446744073709551572ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__473&18446744073709551615ull)));
  llvm_cbe_tmp__474__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__471;   /* for PHI node */
  llvm_cbe_tmp__475__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__473;   /* for PHI node */
  llvm_cbe__2e_rec27__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
  llvm_cbe__2e_rec29__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
  goto llvm_cbe_tmp__546;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__546:
if (AESL_DEBUG_TRACE)
printf("\n  %%84 = phi i64 [ %%80, %%0 ], [ %%95, %%83  for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1142_count);
  llvm_cbe_tmp__474 = (unsigned long long )llvm_cbe_tmp__474__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__474);
printf("\n = 0x%llX",llvm_cbe_tmp__471);
printf("\n = 0x%llX",llvm_cbe_tmp__485);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%85 = phi i64 [ %%82, %%0 ], [ %%102, %%83  for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1143_count);
  llvm_cbe_tmp__475 = (unsigned long long )llvm_cbe_tmp__475__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",llvm_cbe_tmp__475);
printf("\n = 0x%llX",llvm_cbe_tmp__473);
printf("\n = 0x%llX",llvm_cbe_tmp__492);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec27 = phi i64 [ 0, %%0 ], [ %%.rec28, %%83  for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_rec27_count);
  llvm_cbe__2e_rec27 = (unsigned long long )llvm_cbe__2e_rec27__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.rec27 = 0x%llX",llvm_cbe__2e_rec27);
printf("\n = 0x%llX",0ull);
printf("\n.rec28 = 0x%llX",llvm_cbe__2e_rec28);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec29 = phi i64 [ 0, %%0 ], [ %%.rec30, %%83  for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_rec29_count);
  llvm_cbe__2e_rec29 = (unsigned long long )llvm_cbe__2e_rec29__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.rec29 = 0x%llX",llvm_cbe__2e_rec29);
printf("\n = 0x%llX",0ull);
printf("\n.rec30 = 0x%llX",llvm_cbe__2e_rec30);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%86 = getelementptr [11 x i32]* @accumd, i64 0, i64 %%.rec2 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1144_count);
  llvm_cbe_tmp__476 = (signed int *)(&accumd[(((signed long long )llvm_cbe__2e_rec29))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.rec29 = 0x%llX",((signed long long )llvm_cbe__2e_rec29));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%87 = getelementptr [11 x i32]* @accumc, i64 0, i64 %%.rec2 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1145_count);
  llvm_cbe_tmp__477 = (signed int *)(&accumc[(((signed long long )llvm_cbe__2e_rec29))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.rec29 = 0x%llX",((signed long long )llvm_cbe__2e_rec29));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum = add i64 %%.rec27,  for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum_count);
  llvm_cbe__2e_sum = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec27&18446744073709551615ull)) + ((unsigned long long )(2ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%88 = getelementptr [24 x i32]* @h, i64 0, i64 %%.su for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1146_count);
  llvm_cbe_tmp__478 = (signed int *)(&h[(((signed long long )llvm_cbe__2e_sum))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum = 0x%llX",((signed long long )llvm_cbe__2e_sum));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec30 = add i64 %%.rec29, 1, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_rec30_count);
  llvm_cbe__2e_rec30 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(1ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.rec30 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_rec30&18446744073709551615ull)));

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_rec29) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumc' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%89 = load i32* %%87, align 4, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1147_count);
  llvm_cbe_tmp__479 = (unsigned int )*llvm_cbe_tmp__477;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__479);
if (AESL_DEBUG_TRACE)
printf("\n  %%90 = sext i32 %%89 to i64, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1148_count);
  llvm_cbe_tmp__480 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__479);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__480);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum34 = add i64 %%.rec27, 3, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum34_count);
  llvm_cbe__2e_sum34 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec27&18446744073709551615ull)) + ((unsigned long long )(3ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum34 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum34&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%91 = getelementptr [24 x i32]* @h, i64 0, i64 %%.sum34, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1149_count);
  llvm_cbe_tmp__481 = (signed int *)(&h[(((signed long long )llvm_cbe__2e_sum34))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum34 = 0x%llX",((signed long long )llvm_cbe__2e_sum34));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum) < 24)) fprintf(stderr, "%s:%d: warning: Read access out of array 'h' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%92 = load i32* %%88, align 8, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1157_count);
  llvm_cbe_tmp__482 = (unsigned int )*llvm_cbe_tmp__478;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__482);
if (AESL_DEBUG_TRACE)
printf("\n  %%93 = sext i32 %%92 to i64, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1158_count);
  llvm_cbe_tmp__483 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__482);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__483);
if (AESL_DEBUG_TRACE)
printf("\n  %%94 = mul nsw i64 %%93, %%90, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1159_count);
  llvm_cbe_tmp__484 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__483&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__480&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__484&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%95 = add nsw i64 %%94, %%84, !dbg !26 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1160_count);
  llvm_cbe_tmp__485 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__484&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__474&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__485&18446744073709551615ull)));

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_rec29) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumd' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%96 = load i32* %%86, align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1165_count);
  llvm_cbe_tmp__486 = (unsigned int )*llvm_cbe_tmp__476;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__486);
if (AESL_DEBUG_TRACE)
printf("\n  %%97 = sext i32 %%96 to i64, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1166_count);
  llvm_cbe_tmp__487 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__486);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__487);
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec28 = add i64 %%.rec27, 2, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_rec28_count);
  llvm_cbe__2e_rec28 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec27&18446744073709551615ull)) + ((unsigned long long )(2ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.rec28 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_rec28&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum35 = add i64 %%.rec27, 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum35_count);
  llvm_cbe__2e_sum35 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec27&18446744073709551615ull)) + ((unsigned long long )(4ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum35 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum35&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%98 = getelementptr inbounds [24 x i32]* @h, i64 0, i64 %%.sum35, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1167_count);
  llvm_cbe_tmp__488 = (signed int *)(&h[(((signed long long )llvm_cbe__2e_sum35))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum35 = 0x%llX",((signed long long )llvm_cbe__2e_sum35));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum34) < 24)) fprintf(stderr, "%s:%d: warning: Read access out of array 'h' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%99 = load i32* %%91, align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1175_count);
  llvm_cbe_tmp__489 = (unsigned int )*llvm_cbe_tmp__481;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__489);
if (AESL_DEBUG_TRACE)
printf("\n  %%100 = sext i32 %%99 to i64, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1176_count);
  llvm_cbe_tmp__490 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__489);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__490);
if (AESL_DEBUG_TRACE)
printf("\n  %%101 = mul nsw i64 %%100, %%97, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1177_count);
  llvm_cbe_tmp__491 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__490&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__487&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__491&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%102 = add nsw i64 %%101, %%85, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1178_count);
  llvm_cbe_tmp__492 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__491&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__475&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__492&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%lftr.wideiv = trunc i64 %%.rec30 to i32, !dbg !29 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_lftr_2e_wideiv_count);
  llvm_cbe_lftr_2e_wideiv = (unsigned int )((unsigned int )llvm_cbe__2e_rec30&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\nlftr.wideiv = 0x%X\n", llvm_cbe_lftr_2e_wideiv);
  if (((llvm_cbe_lftr_2e_wideiv&4294967295U) == (10u&4294967295U))) {
    goto llvm_cbe_tmp__547;
  } else {
    llvm_cbe_tmp__474__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__485;   /* for PHI node */
    llvm_cbe_tmp__475__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__492;   /* for PHI node */
    llvm_cbe__2e_rec27__PHI_TEMPORARY = (unsigned long long )llvm_cbe__2e_rec28;   /* for PHI node */
    llvm_cbe__2e_rec29__PHI_TEMPORARY = (unsigned long long )llvm_cbe__2e_rec30;   /* for PHI node */
    goto llvm_cbe_tmp__546;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__547:
if (AESL_DEBUG_TRACE)
printf("\n  %%104 = load i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 10), align 8, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1188_count);
  llvm_cbe_tmp__493 = (unsigned int )*((&accumc[(((signed long long )10ull))
#ifdef AESL_BC_SIM
 % 11
#endif
]));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__493);
if (AESL_DEBUG_TRACE)
printf("\n  %%105 = sext i32 %%104 to i64, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1189_count);
  llvm_cbe_tmp__494 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__493);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__494);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum36 = add i64 %%.rec27, 5, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum36_count);
  llvm_cbe__2e_sum36 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec27&18446744073709551615ull)) + ((unsigned long long )(5ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum36 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum36&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%106 = getelementptr [24 x i32]* @h, i64 0, i64 %%.sum36, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1190_count);
  llvm_cbe_tmp__495 = (signed int *)(&h[(((signed long long )llvm_cbe__2e_sum36))
#ifdef AESL_BC_SIM
 % 24
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum36 = 0x%llX",((signed long long )llvm_cbe__2e_sum36));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum35) < 24)) fprintf(stderr, "%s:%d: warning: Read access out of array 'h' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%107 = load i32* %%98, align 8, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1198_count);
  llvm_cbe_tmp__496 = (unsigned int )*llvm_cbe_tmp__488;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__496);
if (AESL_DEBUG_TRACE)
printf("\n  %%108 = sext i32 %%107 to i64, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1199_count);
  llvm_cbe_tmp__497 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__496);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__497);
if (AESL_DEBUG_TRACE)
printf("\n  %%109 = mul nsw i64 %%108, %%105, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1200_count);
  llvm_cbe_tmp__498 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__497&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__494&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__498&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%110 = add nsw i64 %%109, %%95, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1201_count);
  llvm_cbe_tmp__499 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__498&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__485&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__499&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%111 = load i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 10), align 8, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1206_count);
  llvm_cbe_tmp__500 = (unsigned int )*((&accumd[(((signed long long )10ull))
#ifdef AESL_BC_SIM
 % 11
#endif
]));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__500);
if (AESL_DEBUG_TRACE)
printf("\n  %%112 = sext i32 %%111 to i64, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1207_count);
  llvm_cbe_tmp__501 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__500);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__501);

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum36) < 24)) fprintf(stderr, "%s:%d: warning: Read access out of array 'h' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%113 = load i32* %%106, align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1208_count);
  llvm_cbe_tmp__502 = (unsigned int )*llvm_cbe_tmp__495;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__502);
if (AESL_DEBUG_TRACE)
printf("\n  %%114 = sext i32 %%113 to i64, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1209_count);
  llvm_cbe_tmp__503 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__502);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__503);
if (AESL_DEBUG_TRACE)
printf("\n  %%115 = mul nsw i64 %%114, %%112, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1210_count);
  llvm_cbe_tmp__504 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__503&18446744073709551615ull)) * ((unsigned long long )(llvm_cbe_tmp__501&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__504&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%116 = add nsw i64 %%115, %%102, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1211_count);
  llvm_cbe_tmp__505 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__504&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__492&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__505&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%117 = lshr i64 %%110, 14, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1216_count);
  llvm_cbe_tmp__506 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__499&18446744073709551615ull)) >> ((unsigned long long )(14ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__506&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%118 = trunc i64 %%117 to i32, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1217_count);
  llvm_cbe_tmp__507 = (unsigned int )((unsigned int )llvm_cbe_tmp__506&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__507);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%118, i32* @xout1, align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1218_count);
  *(&xout1) = llvm_cbe_tmp__507;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__507);
if (AESL_DEBUG_TRACE)
printf("\n  %%119 = lshr i64 %%116, 14, !dbg !29 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1219_count);
  llvm_cbe_tmp__508 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__505&18446744073709551615ull)) >> ((unsigned long long )(14ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__508&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%120 = trunc i64 %%119 to i32, !dbg !29 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1220_count);
  llvm_cbe_tmp__509 = (unsigned int )((unsigned int )llvm_cbe_tmp__508&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__509);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%120, i32* @xout2, align 4, !dbg !29 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1221_count);
  *(&xout2) = llvm_cbe_tmp__509;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__509);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%89, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 10), align 8, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1229_count);
  *((&accumc[(((signed long long )10ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__479;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__479);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%96, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 10), align 8, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1230_count);
  *((&accumd[(((signed long long )10ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__486;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__486);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum37 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum37_count);
  llvm_cbe__2e_sum37 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551615ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum37 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum37&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%121 = getelementptr [11 x i32]* @accumc, i64 0, i64 %%.sum3 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1236_count);
  llvm_cbe_tmp__510 = (signed int *)(&accumc[(((signed long long )llvm_cbe__2e_sum37))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum37 = 0x%llX",((signed long long )llvm_cbe__2e_sum37));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum38 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum38_count);
  llvm_cbe__2e_sum38 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551615ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum38 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum38&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%122 = getelementptr [11 x i32]* @accumd, i64 0, i64 %%.sum3 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1237_count);
  llvm_cbe_tmp__511 = (signed int *)(&accumd[(((signed long long )llvm_cbe__2e_sum38))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum38 = 0x%llX",((signed long long )llvm_cbe__2e_sum38));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum37) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumc' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%123 = load i32* %%121, align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1238_count);
  llvm_cbe_tmp__512 = (unsigned int )*llvm_cbe_tmp__510;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__512);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%123, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 9), align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1239_count);
  *((&accumc[(((signed long long )9ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__512;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__512);

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum38) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumd' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%124 = load i32* %%122, align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1240_count);
  llvm_cbe_tmp__513 = (unsigned int )*llvm_cbe_tmp__511;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__513);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%124, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 9), align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1241_count);
  *((&accumd[(((signed long long )9ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__513;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__513);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum39 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum39_count);
  llvm_cbe__2e_sum39 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551614ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum39 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum39&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%125 = getelementptr [11 x i32]* @accumc, i64 0, i64 %%.sum3 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1247_count);
  llvm_cbe_tmp__514 = (signed int *)(&accumc[(((signed long long )llvm_cbe__2e_sum39))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum39 = 0x%llX",((signed long long )llvm_cbe__2e_sum39));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum40 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum40_count);
  llvm_cbe__2e_sum40 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551614ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum40 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum40&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%126 = getelementptr [11 x i32]* @accumd, i64 0, i64 %%.sum4 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1248_count);
  llvm_cbe_tmp__515 = (signed int *)(&accumd[(((signed long long )llvm_cbe__2e_sum40))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum40 = 0x%llX",((signed long long )llvm_cbe__2e_sum40));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum39) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumc' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%127 = load i32* %%125, align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1249_count);
  llvm_cbe_tmp__516 = (unsigned int )*llvm_cbe_tmp__514;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__516);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%127, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 8), align 16, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1250_count);
  *((&accumc[(((signed long long )8ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__516;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__516);

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum40) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumd' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%128 = load i32* %%126, align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1251_count);
  llvm_cbe_tmp__517 = (unsigned int )*llvm_cbe_tmp__515;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__517);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%128, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 8), align 16, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1252_count);
  *((&accumd[(((signed long long )8ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__517;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__517);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum41 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum41_count);
  llvm_cbe__2e_sum41 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551613ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum41 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum41&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%129 = getelementptr [11 x i32]* @accumc, i64 0, i64 %%.sum4 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1258_count);
  llvm_cbe_tmp__518 = (signed int *)(&accumc[(((signed long long )llvm_cbe__2e_sum41))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum41 = 0x%llX",((signed long long )llvm_cbe__2e_sum41));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum42 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum42_count);
  llvm_cbe__2e_sum42 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551613ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum42 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum42&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%130 = getelementptr [11 x i32]* @accumd, i64 0, i64 %%.sum4 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1259_count);
  llvm_cbe_tmp__519 = (signed int *)(&accumd[(((signed long long )llvm_cbe__2e_sum42))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum42 = 0x%llX",((signed long long )llvm_cbe__2e_sum42));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum41) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumc' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%131 = load i32* %%129, align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1260_count);
  llvm_cbe_tmp__520 = (unsigned int )*llvm_cbe_tmp__518;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__520);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%131, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 7), align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1261_count);
  *((&accumc[(((signed long long )7ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__520;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__520);

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum42) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumd' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%132 = load i32* %%130, align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1262_count);
  llvm_cbe_tmp__521 = (unsigned int )*llvm_cbe_tmp__519;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__521);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%132, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 7), align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1263_count);
  *((&accumd[(((signed long long )7ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__521;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__521);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum43 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum43_count);
  llvm_cbe__2e_sum43 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551612ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum43 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum43&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%133 = getelementptr [11 x i32]* @accumc, i64 0, i64 %%.sum4 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1269_count);
  llvm_cbe_tmp__522 = (signed int *)(&accumc[(((signed long long )llvm_cbe__2e_sum43))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum43 = 0x%llX",((signed long long )llvm_cbe__2e_sum43));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum44 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum44_count);
  llvm_cbe__2e_sum44 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551612ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum44 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum44&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%134 = getelementptr [11 x i32]* @accumd, i64 0, i64 %%.sum4 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1270_count);
  llvm_cbe_tmp__523 = (signed int *)(&accumd[(((signed long long )llvm_cbe__2e_sum44))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum44 = 0x%llX",((signed long long )llvm_cbe__2e_sum44));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum43) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumc' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%135 = load i32* %%133, align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1271_count);
  llvm_cbe_tmp__524 = (unsigned int )*llvm_cbe_tmp__522;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__524);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%135, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 6), align 8, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1272_count);
  *((&accumc[(((signed long long )6ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__524;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__524);

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum44) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumd' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%136 = load i32* %%134, align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1273_count);
  llvm_cbe_tmp__525 = (unsigned int )*llvm_cbe_tmp__523;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__525);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%136, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 6), align 8, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1274_count);
  *((&accumd[(((signed long long )6ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__525;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__525);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum45 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum45_count);
  llvm_cbe__2e_sum45 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551611ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum45 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum45&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%137 = getelementptr [11 x i32]* @accumc, i64 0, i64 %%.sum4 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1280_count);
  llvm_cbe_tmp__526 = (signed int *)(&accumc[(((signed long long )llvm_cbe__2e_sum45))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum45 = 0x%llX",((signed long long )llvm_cbe__2e_sum45));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum46 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum46_count);
  llvm_cbe__2e_sum46 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551611ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum46 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum46&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%138 = getelementptr [11 x i32]* @accumd, i64 0, i64 %%.sum4 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1281_count);
  llvm_cbe_tmp__527 = (signed int *)(&accumd[(((signed long long )llvm_cbe__2e_sum46))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum46 = 0x%llX",((signed long long )llvm_cbe__2e_sum46));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum45) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumc' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%139 = load i32* %%137, align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1282_count);
  llvm_cbe_tmp__528 = (unsigned int )*llvm_cbe_tmp__526;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__528);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%139, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 5), align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1283_count);
  *((&accumc[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__528;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__528);

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum46) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumd' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%140 = load i32* %%138, align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1284_count);
  llvm_cbe_tmp__529 = (unsigned int )*llvm_cbe_tmp__527;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__529);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%140, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 5), align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1285_count);
  *((&accumd[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__529;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__529);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum47 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum47_count);
  llvm_cbe__2e_sum47 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551610ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum47 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum47&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%141 = getelementptr [11 x i32]* @accumc, i64 0, i64 %%.sum4 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1291_count);
  llvm_cbe_tmp__530 = (signed int *)(&accumc[(((signed long long )llvm_cbe__2e_sum47))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum47 = 0x%llX",((signed long long )llvm_cbe__2e_sum47));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum48 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum48_count);
  llvm_cbe__2e_sum48 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551610ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum48 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum48&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%142 = getelementptr [11 x i32]* @accumd, i64 0, i64 %%.sum4 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1292_count);
  llvm_cbe_tmp__531 = (signed int *)(&accumd[(((signed long long )llvm_cbe__2e_sum48))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum48 = 0x%llX",((signed long long )llvm_cbe__2e_sum48));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum47) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumc' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%143 = load i32* %%141, align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1293_count);
  llvm_cbe_tmp__532 = (unsigned int )*llvm_cbe_tmp__530;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__532);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%143, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 4), align 16, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1294_count);
  *((&accumc[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__532;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__532);

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum48) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumd' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%144 = load i32* %%142, align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1295_count);
  llvm_cbe_tmp__533 = (unsigned int )*llvm_cbe_tmp__531;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__533);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%144, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 4), align 16, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1296_count);
  *((&accumd[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__533;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__533);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum49 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum49_count);
  llvm_cbe__2e_sum49 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551609ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum49 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum49&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%145 = getelementptr [11 x i32]* @accumc, i64 0, i64 %%.sum4 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1302_count);
  llvm_cbe_tmp__534 = (signed int *)(&accumc[(((signed long long )llvm_cbe__2e_sum49))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum49 = 0x%llX",((signed long long )llvm_cbe__2e_sum49));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum50 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum50_count);
  llvm_cbe__2e_sum50 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551609ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum50 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum50&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%146 = getelementptr [11 x i32]* @accumd, i64 0, i64 %%.sum5 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1303_count);
  llvm_cbe_tmp__535 = (signed int *)(&accumd[(((signed long long )llvm_cbe__2e_sum50))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum50 = 0x%llX",((signed long long )llvm_cbe__2e_sum50));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum49) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumc' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%147 = load i32* %%145, align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1304_count);
  llvm_cbe_tmp__536 = (unsigned int )*llvm_cbe_tmp__534;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__536);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%147, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 3), align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1305_count);
  *((&accumc[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__536;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__536);

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum50) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumd' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%148 = load i32* %%146, align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1306_count);
  llvm_cbe_tmp__537 = (unsigned int )*llvm_cbe_tmp__535;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__537);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%148, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 3), align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1307_count);
  *((&accumd[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__537;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__537);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum51 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum51_count);
  llvm_cbe__2e_sum51 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551608ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum51 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum51&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%149 = getelementptr [11 x i32]* @accumc, i64 0, i64 %%.sum5 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1313_count);
  llvm_cbe_tmp__538 = (signed int *)(&accumc[(((signed long long )llvm_cbe__2e_sum51))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum51 = 0x%llX",((signed long long )llvm_cbe__2e_sum51));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum52 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum52_count);
  llvm_cbe__2e_sum52 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551608ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum52 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum52&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%150 = getelementptr [11 x i32]* @accumd, i64 0, i64 %%.sum5 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1314_count);
  llvm_cbe_tmp__539 = (signed int *)(&accumd[(((signed long long )llvm_cbe__2e_sum52))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum52 = 0x%llX",((signed long long )llvm_cbe__2e_sum52));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum51) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumc' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%151 = load i32* %%149, align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1315_count);
  llvm_cbe_tmp__540 = (unsigned int )*llvm_cbe_tmp__538;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__540);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%151, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 2), align 8, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1316_count);
  *((&accumc[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__540;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__540);

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum52) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumd' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%152 = load i32* %%150, align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1317_count);
  llvm_cbe_tmp__541 = (unsigned int )*llvm_cbe_tmp__539;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__541);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%152, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 2), align 8, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1318_count);
  *((&accumd[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__541;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__541);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum53 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum53_count);
  llvm_cbe__2e_sum53 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551607ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum53 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum53&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%153 = getelementptr [11 x i32]* @accumc, i64 0, i64 %%.sum5 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1324_count);
  llvm_cbe_tmp__542 = (signed int *)(&accumc[(((signed long long )llvm_cbe__2e_sum53))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum53 = 0x%llX",((signed long long )llvm_cbe__2e_sum53));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum54 = add i64 %%.rec29, - for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe__2e_sum54_count);
  llvm_cbe__2e_sum54 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec29&18446744073709551615ull)) + ((unsigned long long )(18446744073709551607ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum54 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum54&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%154 = getelementptr [11 x i32]* @accumd, i64 0, i64 %%.sum5 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1325_count);
  llvm_cbe_tmp__543 = (signed int *)(&accumd[(((signed long long )llvm_cbe__2e_sum54))
#ifdef AESL_BC_SIM
 % 11
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum54 = 0x%llX",((signed long long )llvm_cbe__2e_sum54));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum53) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumc' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%155 = load i32* %%153, align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1326_count);
  llvm_cbe_tmp__544 = (unsigned int )*llvm_cbe_tmp__542;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__544);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%155, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 1), align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1327_count);
  *((&accumc[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__544;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__544);

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe__2e_sum54) < 11)) fprintf(stderr, "%s:%d: warning: Read access out of array 'accumd' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%156 = load i32* %%154, align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1328_count);
  llvm_cbe_tmp__545 = (unsigned int )*llvm_cbe_tmp__543;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__545);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%156, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 1), align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1329_count);
  *((&accumd[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__545;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__545);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%77, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 0), align 16, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1337_count);
  *((&accumc[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__468;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__468);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%78, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 0), align 16, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_1338_count);
  *((&accumd[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = llvm_cbe_tmp__469;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__469);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @decode}\n");
  return;
}


void reset(void) {
  static  unsigned long long aesl_llvm_cbe_1340_count = 0;
  static  unsigned long long aesl_llvm_cbe_1341_count = 0;
  static  unsigned long long aesl_llvm_cbe_1342_count = 0;
  static  unsigned long long aesl_llvm_cbe_1343_count = 0;
  static  unsigned long long aesl_llvm_cbe_1344_count = 0;
  static  unsigned long long aesl_llvm_cbe_1345_count = 0;
  static  unsigned long long aesl_llvm_cbe_1346_count = 0;
  static  unsigned long long aesl_llvm_cbe_1347_count = 0;
  static  unsigned long long aesl_llvm_cbe_1348_count = 0;
  static  unsigned long long aesl_llvm_cbe_1349_count = 0;
  static  unsigned long long aesl_llvm_cbe_1350_count = 0;
  static  unsigned long long aesl_llvm_cbe_1351_count = 0;
  static  unsigned long long aesl_llvm_cbe_1352_count = 0;
  static  unsigned long long aesl_llvm_cbe_1353_count = 0;
  static  unsigned long long aesl_llvm_cbe_1354_count = 0;
  static  unsigned long long aesl_llvm_cbe_1355_count = 0;
  static  unsigned long long aesl_llvm_cbe_1356_count = 0;
  static  unsigned long long aesl_llvm_cbe_1357_count = 0;
  static  unsigned long long aesl_llvm_cbe_1358_count = 0;
  static  unsigned long long aesl_llvm_cbe_1359_count = 0;
  static  unsigned long long aesl_llvm_cbe_1360_count = 0;
  static  unsigned long long aesl_llvm_cbe_1361_count = 0;
  static  unsigned long long aesl_llvm_cbe_1362_count = 0;
  static  unsigned long long aesl_llvm_cbe_1363_count = 0;
  static  unsigned long long aesl_llvm_cbe_1364_count = 0;
  static  unsigned long long aesl_llvm_cbe_1365_count = 0;
  static  unsigned long long aesl_llvm_cbe_1366_count = 0;
  static  unsigned long long aesl_llvm_cbe_1367_count = 0;
  static  unsigned long long aesl_llvm_cbe_1368_count = 0;
  static  unsigned long long aesl_llvm_cbe_1369_count = 0;
  static  unsigned long long aesl_llvm_cbe_1370_count = 0;
  static  unsigned long long aesl_llvm_cbe_1371_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1395_count = 0;
  static  unsigned long long aesl_llvm_cbe_1396_count = 0;
  static  unsigned long long aesl_llvm_cbe_1397_count = 0;
  static  unsigned long long aesl_llvm_cbe_1398_count = 0;
  static  unsigned long long aesl_llvm_cbe_1399_count = 0;
  static  unsigned long long aesl_llvm_cbe_1400_count = 0;
  static  unsigned long long aesl_llvm_cbe_1401_count = 0;
  static  unsigned long long aesl_llvm_cbe_1402_count = 0;
  static  unsigned long long aesl_llvm_cbe_1403_count = 0;
  static  unsigned long long aesl_llvm_cbe_1404_count = 0;
  static  unsigned long long aesl_llvm_cbe_1405_count = 0;
  static  unsigned long long aesl_llvm_cbe_1406_count = 0;
  static  unsigned long long aesl_llvm_cbe_1407_count = 0;
  static  unsigned long long aesl_llvm_cbe_1408_count = 0;
  static  unsigned long long aesl_llvm_cbe_1409_count = 0;
  static  unsigned long long aesl_llvm_cbe_1410_count = 0;
  static  unsigned long long aesl_llvm_cbe_1411_count = 0;
  static  unsigned long long aesl_llvm_cbe_1412_count = 0;
  static  unsigned long long aesl_llvm_cbe_1413_count = 0;
  static  unsigned long long aesl_llvm_cbe_1414_count = 0;
  static  unsigned long long aesl_llvm_cbe_1415_count = 0;
  static  unsigned long long aesl_llvm_cbe_1416_count = 0;
  static  unsigned long long aesl_llvm_cbe_1417_count = 0;
  static  unsigned long long aesl_llvm_cbe_1418_count = 0;
  static  unsigned long long aesl_llvm_cbe_1419_count = 0;
  static  unsigned long long aesl_llvm_cbe_1420_count = 0;
  static  unsigned long long aesl_llvm_cbe_1421_count = 0;
  static  unsigned long long aesl_llvm_cbe_1422_count = 0;
  static  unsigned long long aesl_llvm_cbe_1423_count = 0;
  static  unsigned long long aesl_llvm_cbe_1424_count = 0;
  static  unsigned long long aesl_llvm_cbe_1425_count = 0;
  static  unsigned long long aesl_llvm_cbe_1426_count = 0;
  static  unsigned long long aesl_llvm_cbe_1427_count = 0;
  static  unsigned long long aesl_llvm_cbe_1428_count = 0;
  static  unsigned long long aesl_llvm_cbe_1429_count = 0;
  static  unsigned long long aesl_llvm_cbe_1430_count = 0;
  static  unsigned long long aesl_llvm_cbe_1431_count = 0;
  static  unsigned long long aesl_llvm_cbe_1432_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1460_count = 0;
  static  unsigned long long aesl_llvm_cbe_1461_count = 0;
  static  unsigned long long aesl_llvm_cbe_1462_count = 0;
  static  unsigned long long aesl_llvm_cbe_1463_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1474_count = 0;
  static  unsigned long long aesl_llvm_cbe_1475_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1487_count = 0;
  static  unsigned long long aesl_llvm_cbe_1488_count = 0;
  static  unsigned long long aesl_llvm_cbe_1489_count = 0;
  static  unsigned long long aesl_llvm_cbe_1490_count = 0;
  static  unsigned long long aesl_llvm_cbe_1491_count = 0;
  static  unsigned long long aesl_llvm_cbe_1492_count = 0;
  static  unsigned long long aesl_llvm_cbe_1493_count = 0;
  static  unsigned long long aesl_llvm_cbe_1494_count = 0;
  static  unsigned long long aesl_llvm_cbe_1495_count = 0;
  static  unsigned long long aesl_llvm_cbe_1496_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1508_count = 0;
  static  unsigned long long aesl_llvm_cbe_1509_count = 0;
  static  unsigned long long aesl_llvm_cbe_1510_count = 0;
  static  unsigned long long aesl_llvm_cbe_1511_count = 0;
  static  unsigned long long aesl_llvm_cbe_1512_count = 0;
  static  unsigned long long aesl_llvm_cbe_1513_count = 0;
  static  unsigned long long aesl_llvm_cbe_1514_count = 0;
  static  unsigned long long aesl_llvm_cbe_1515_count = 0;
  static  unsigned long long aesl_llvm_cbe_1516_count = 0;
  static  unsigned long long aesl_llvm_cbe_1517_count = 0;
  static  unsigned long long aesl_llvm_cbe_1518_count = 0;
  static  unsigned long long aesl_llvm_cbe_1519_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1531_count = 0;
  static  unsigned long long aesl_llvm_cbe_1532_count = 0;
  static  unsigned long long aesl_llvm_cbe_1533_count = 0;
  static  unsigned long long aesl_llvm_cbe_1534_count = 0;
  static  unsigned long long aesl_llvm_cbe_1535_count = 0;
  static  unsigned long long aesl_llvm_cbe_1536_count = 0;
  static  unsigned long long aesl_llvm_cbe_1537_count = 0;
  static  unsigned long long aesl_llvm_cbe_1538_count = 0;
  static  unsigned long long aesl_llvm_cbe_1539_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1550_count = 0;
  static  unsigned long long aesl_llvm_cbe_1551_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1566_count = 0;
  static  unsigned long long aesl_llvm_cbe_1567_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1579_count = 0;
  static  unsigned long long aesl_llvm_cbe_1580_count = 0;
  static  unsigned long long aesl_llvm_cbe_1581_count = 0;
  static  unsigned long long aesl_llvm_cbe_1582_count = 0;
  static  unsigned long long aesl_llvm_cbe_1583_count = 0;
  static  unsigned long long aesl_llvm_cbe_1584_count = 0;
  static  unsigned long long aesl_llvm_cbe_1585_count = 0;
  static  unsigned long long aesl_llvm_cbe_1586_count = 0;
  static  unsigned long long aesl_llvm_cbe_1587_count = 0;
  static  unsigned long long aesl_llvm_cbe_1588_count = 0;
  static  unsigned long long aesl_llvm_cbe_1589_count = 0;
  static  unsigned long long aesl_llvm_cbe_1590_count = 0;
  static  unsigned long long aesl_llvm_cbe_1591_count = 0;
  static  unsigned long long aesl_llvm_cbe_1592_count = 0;
  static  unsigned long long aesl_llvm_cbe_1593_count = 0;
  static  unsigned long long aesl_llvm_cbe_1594_count = 0;
  static  unsigned long long aesl_llvm_cbe_1595_count = 0;
  static  unsigned long long aesl_llvm_cbe_1596_count = 0;
  static  unsigned long long aesl_llvm_cbe_1597_count = 0;
  static  unsigned long long aesl_llvm_cbe_1598_count = 0;
  static  unsigned long long aesl_llvm_cbe_1599_count = 0;
  static  unsigned long long aesl_llvm_cbe_1600_count = 0;
  static  unsigned long long aesl_llvm_cbe_1601_count = 0;
  static  unsigned long long aesl_llvm_cbe_1602_count = 0;
  static  unsigned long long aesl_llvm_cbe_1603_count = 0;
  static  unsigned long long aesl_llvm_cbe_1604_count = 0;
  static  unsigned long long aesl_llvm_cbe_1605_count = 0;
  static  unsigned long long aesl_llvm_cbe_1606_count = 0;
  static  unsigned long long aesl_llvm_cbe_1607_count = 0;
  static  unsigned long long aesl_llvm_cbe_1608_count = 0;
  static  unsigned long long aesl_llvm_cbe_1609_count = 0;
  static  unsigned long long aesl_llvm_cbe_1610_count = 0;
  static  unsigned long long aesl_llvm_cbe_1611_count = 0;
  static  unsigned long long aesl_llvm_cbe_1612_count = 0;
  static  unsigned long long aesl_llvm_cbe_1613_count = 0;
  static  unsigned long long aesl_llvm_cbe_1614_count = 0;
  static  unsigned long long aesl_llvm_cbe_1615_count = 0;
  static  unsigned long long aesl_llvm_cbe_1616_count = 0;
  static  unsigned long long aesl_llvm_cbe_1617_count = 0;
  static  unsigned long long aesl_llvm_cbe_1618_count = 0;
  static  unsigned long long aesl_llvm_cbe_1619_count = 0;
  static  unsigned long long aesl_llvm_cbe_1620_count = 0;
  static  unsigned long long aesl_llvm_cbe_1621_count = 0;
  static  unsigned long long aesl_llvm_cbe_1622_count = 0;
  static  unsigned long long aesl_llvm_cbe_1623_count = 0;
  static  unsigned long long aesl_llvm_cbe_1624_count = 0;
  static  unsigned long long aesl_llvm_cbe_1625_count = 0;
  static  unsigned long long aesl_llvm_cbe_1626_count = 0;
  static  unsigned long long aesl_llvm_cbe_1627_count = 0;
  static  unsigned long long aesl_llvm_cbe_1628_count = 0;
  static  unsigned long long aesl_llvm_cbe_1629_count = 0;
  static  unsigned long long aesl_llvm_cbe_1630_count = 0;
  static  unsigned long long aesl_llvm_cbe_1631_count = 0;
  static  unsigned long long aesl_llvm_cbe_1632_count = 0;
  static  unsigned long long aesl_llvm_cbe_1633_count = 0;
  static  unsigned long long aesl_llvm_cbe_1634_count = 0;
  static  unsigned long long aesl_llvm_cbe_1635_count = 0;
  static  unsigned long long aesl_llvm_cbe_1636_count = 0;
  static  unsigned long long aesl_llvm_cbe_1637_count = 0;
  static  unsigned long long aesl_llvm_cbe_1638_count = 0;
  static  unsigned long long aesl_llvm_cbe_1639_count = 0;
  static  unsigned long long aesl_llvm_cbe_1640_count = 0;
  static  unsigned long long aesl_llvm_cbe_1641_count = 0;
  static  unsigned long long aesl_llvm_cbe_1642_count = 0;
  static  unsigned long long aesl_llvm_cbe_1643_count = 0;
  static  unsigned long long aesl_llvm_cbe_1644_count = 0;
  static  unsigned long long aesl_llvm_cbe_1645_count = 0;
  static  unsigned long long aesl_llvm_cbe_1646_count = 0;
  static  unsigned long long aesl_llvm_cbe_1647_count = 0;
  static  unsigned long long aesl_llvm_cbe_1648_count = 0;
  static  unsigned long long aesl_llvm_cbe_1649_count = 0;
  static  unsigned long long aesl_llvm_cbe_1650_count = 0;
  static  unsigned long long aesl_llvm_cbe_1651_count = 0;
  static  unsigned long long aesl_llvm_cbe_1652_count = 0;
  static  unsigned long long aesl_llvm_cbe_1653_count = 0;
  static  unsigned long long aesl_llvm_cbe_1654_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1669_count = 0;
  static  unsigned long long aesl_llvm_cbe_1670_count = 0;
  static  unsigned long long aesl_llvm_cbe_1671_count = 0;
  static  unsigned long long aesl_llvm_cbe_1672_count = 0;
  static  unsigned long long aesl_llvm_cbe_1673_count = 0;
  static  unsigned long long aesl_llvm_cbe_1674_count = 0;
  static  unsigned long long aesl_llvm_cbe_1675_count = 0;
  static  unsigned long long aesl_llvm_cbe_1676_count = 0;
  static  unsigned long long aesl_llvm_cbe_1677_count = 0;
  static  unsigned long long aesl_llvm_cbe_1678_count = 0;
  static  unsigned long long aesl_llvm_cbe_1679_count = 0;
  static  unsigned long long aesl_llvm_cbe_1680_count = 0;
  static  unsigned long long aesl_llvm_cbe_1681_count = 0;
  static  unsigned long long aesl_llvm_cbe_1682_count = 0;
  static  unsigned long long aesl_llvm_cbe_1683_count = 0;
  static  unsigned long long aesl_llvm_cbe_1684_count = 0;
  static  unsigned long long aesl_llvm_cbe_1685_count = 0;
  static  unsigned long long aesl_llvm_cbe_1686_count = 0;
  static  unsigned long long aesl_llvm_cbe_1687_count = 0;
  static  unsigned long long aesl_llvm_cbe_1688_count = 0;
  static  unsigned long long aesl_llvm_cbe_1689_count = 0;
  static  unsigned long long aesl_llvm_cbe_1690_count = 0;
  static  unsigned long long aesl_llvm_cbe_1691_count = 0;
  static  unsigned long long aesl_llvm_cbe_1692_count = 0;
  static  unsigned long long aesl_llvm_cbe_1693_count = 0;
  static  unsigned long long aesl_llvm_cbe_1694_count = 0;
  static  unsigned long long aesl_llvm_cbe_1695_count = 0;
  static  unsigned long long aesl_llvm_cbe_1696_count = 0;
  static  unsigned long long aesl_llvm_cbe_1697_count = 0;
  static  unsigned long long aesl_llvm_cbe_1698_count = 0;
  static  unsigned long long aesl_llvm_cbe_1699_count = 0;
  static  unsigned long long aesl_llvm_cbe_1700_count = 0;
  static  unsigned long long aesl_llvm_cbe_1701_count = 0;
  static  unsigned long long aesl_llvm_cbe_1702_count = 0;
  static  unsigned long long aesl_llvm_cbe_1703_count = 0;
  static  unsigned long long aesl_llvm_cbe_1704_count = 0;
  static  unsigned long long aesl_llvm_cbe_1705_count = 0;
  static  unsigned long long aesl_llvm_cbe_1706_count = 0;
  static  unsigned long long aesl_llvm_cbe_1707_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1727_count = 0;
  static  unsigned long long aesl_llvm_cbe_1728_count = 0;
  static  unsigned long long aesl_llvm_cbe_1729_count = 0;
  static  unsigned long long aesl_llvm_cbe_1730_count = 0;
  static  unsigned long long aesl_llvm_cbe_1731_count = 0;
  static  unsigned long long aesl_llvm_cbe_1732_count = 0;
  static  unsigned long long aesl_llvm_cbe_1733_count = 0;
  static  unsigned long long aesl_llvm_cbe_1734_count = 0;
  static  unsigned long long aesl_llvm_cbe_1735_count = 0;
  static  unsigned long long aesl_llvm_cbe_1736_count = 0;
  static  unsigned long long aesl_llvm_cbe_1737_count = 0;
  static  unsigned long long aesl_llvm_cbe_1738_count = 0;
  static  unsigned long long aesl_llvm_cbe_1739_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1753_count = 0;
  static  unsigned long long aesl_llvm_cbe_1754_count = 0;
  static  unsigned long long aesl_llvm_cbe_1755_count = 0;
  static  unsigned long long aesl_llvm_cbe_1756_count = 0;
  static  unsigned long long aesl_llvm_cbe_1757_count = 0;
  static  unsigned long long aesl_llvm_cbe_1758_count = 0;
  static  unsigned long long aesl_llvm_cbe_1759_count = 0;
  static  unsigned long long aesl_llvm_cbe_1760_count = 0;
  static  unsigned long long aesl_llvm_cbe_1761_count = 0;
  static  unsigned long long aesl_llvm_cbe_1762_count = 0;
  static  unsigned long long aesl_llvm_cbe_1763_count = 0;
  static  unsigned long long aesl_llvm_cbe_1764_count = 0;
  static  unsigned long long aesl_llvm_cbe_1765_count = 0;
  static  unsigned long long aesl_llvm_cbe_1766_count = 0;
  static  unsigned long long aesl_llvm_cbe_1767_count = 0;
  static  unsigned long long aesl_llvm_cbe_1768_count = 0;
  static  unsigned long long aesl_llvm_cbe_1769_count = 0;
  static  unsigned long long aesl_llvm_cbe_1770_count = 0;
  static  unsigned long long aesl_llvm_cbe_1771_count = 0;
  static  unsigned long long aesl_llvm_cbe_1772_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1787_count = 0;
  static  unsigned long long aesl_llvm_cbe_1788_count = 0;
  static  unsigned long long aesl_llvm_cbe_1789_count = 0;
  static  unsigned long long aesl_llvm_cbe_1790_count = 0;
  static  unsigned long long aesl_llvm_cbe_1791_count = 0;
  static  unsigned long long aesl_llvm_cbe_1792_count = 0;
  static  unsigned long long aesl_llvm_cbe_1793_count = 0;
  static  unsigned long long aesl_llvm_cbe_1794_count = 0;
  static  unsigned long long aesl_llvm_cbe_1795_count = 0;
  static  unsigned long long aesl_llvm_cbe_1796_count = 0;
  static  unsigned long long aesl_llvm_cbe_1797_count = 0;
  static  unsigned long long aesl_llvm_cbe_1798_count = 0;
  static  unsigned long long aesl_llvm_cbe_1799_count = 0;
  static  unsigned long long aesl_llvm_cbe_1800_count = 0;
  static  unsigned long long aesl_llvm_cbe_1801_count = 0;
  static  unsigned long long aesl_llvm_cbe_1802_count = 0;
  static  unsigned long long aesl_llvm_cbe_1803_count = 0;
  static  unsigned long long aesl_llvm_cbe_1804_count = 0;
  static  unsigned long long aesl_llvm_cbe_1805_count = 0;
  static  unsigned long long aesl_llvm_cbe_1806_count = 0;
  static  unsigned long long aesl_llvm_cbe_1807_count = 0;
  static  unsigned long long aesl_llvm_cbe_1808_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1821_count = 0;
  static  unsigned long long aesl_llvm_cbe_1822_count = 0;
  static  unsigned long long aesl_llvm_cbe_1823_count = 0;
  static  unsigned long long aesl_llvm_cbe_1824_count = 0;
  static  unsigned long long aesl_llvm_cbe_1825_count = 0;
  static  unsigned long long aesl_llvm_cbe_1826_count = 0;
  static  unsigned long long aesl_llvm_cbe_1827_count = 0;
  static  unsigned long long aesl_llvm_cbe_1828_count = 0;
  static  unsigned long long aesl_llvm_cbe_1829_count = 0;
  static  unsigned long long aesl_llvm_cbe_1830_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1846_count = 0;
  static  unsigned long long aesl_llvm_cbe_1847_count = 0;
  static  unsigned long long aesl_llvm_cbe_1848_count = 0;
  static  unsigned long long aesl_llvm_cbe_1849_count = 0;
  static  unsigned long long aesl_llvm_cbe_1850_count = 0;
  static  unsigned long long aesl_llvm_cbe_1851_count = 0;
  static  unsigned long long aesl_llvm_cbe_1852_count = 0;
  static  unsigned long long aesl_llvm_cbe_1853_count = 0;
  static  unsigned long long aesl_llvm_cbe_1854_count = 0;
  static  unsigned long long aesl_llvm_cbe_1855_count = 0;
  static  unsigned long long aesl_llvm_cbe_1856_count = 0;
  static  unsigned long long aesl_llvm_cbe_1857_count = 0;
  static  unsigned long long aesl_llvm_cbe_1858_count = 0;
  static  unsigned long long aesl_llvm_cbe_1859_count = 0;
  static  unsigned long long aesl_llvm_cbe_1860_count = 0;
  static  unsigned long long aesl_llvm_cbe_1861_count = 0;
  static  unsigned long long aesl_llvm_cbe_1862_count = 0;
  static  unsigned long long aesl_llvm_cbe_1863_count = 0;
  static  unsigned long long aesl_llvm_cbe_1864_count = 0;
  static  unsigned long long aesl_llvm_cbe_1865_count = 0;
  static  unsigned long long aesl_llvm_cbe_1866_count = 0;
  static  unsigned long long aesl_llvm_cbe_1867_count = 0;
  static  unsigned long long aesl_llvm_cbe_1868_count = 0;
  static  unsigned long long aesl_llvm_cbe_1869_count = 0;
  static  unsigned long long aesl_llvm_cbe_1870_count = 0;
  static  unsigned long long aesl_llvm_cbe_1871_count = 0;
  static  unsigned long long aesl_llvm_cbe_1872_count = 0;
  static  unsigned long long aesl_llvm_cbe_1873_count = 0;
  static  unsigned long long aesl_llvm_cbe_1874_count = 0;
  static  unsigned long long aesl_llvm_cbe_1875_count = 0;
  static  unsigned long long aesl_llvm_cbe_1876_count = 0;
  static  unsigned long long aesl_llvm_cbe_1877_count = 0;
  static  unsigned long long aesl_llvm_cbe_1878_count = 0;
  static  unsigned long long aesl_llvm_cbe_1879_count = 0;
  static  unsigned long long aesl_llvm_cbe_1880_count = 0;
  static  unsigned long long aesl_llvm_cbe_1881_count = 0;
  static  unsigned long long aesl_llvm_cbe_1882_count = 0;
  static  unsigned long long aesl_llvm_cbe_1883_count = 0;
  static  unsigned long long aesl_llvm_cbe_1884_count = 0;
  static  unsigned long long aesl_llvm_cbe_1885_count = 0;
  static  unsigned long long aesl_llvm_cbe_1886_count = 0;
  static  unsigned long long aesl_llvm_cbe_1887_count = 0;
  static  unsigned long long aesl_llvm_cbe_1888_count = 0;
  static  unsigned long long aesl_llvm_cbe_1889_count = 0;
  static  unsigned long long aesl_llvm_cbe_1890_count = 0;
  static  unsigned long long aesl_llvm_cbe_1891_count = 0;
  static  unsigned long long aesl_llvm_cbe_1892_count = 0;
  static  unsigned long long aesl_llvm_cbe_1893_count = 0;
  static  unsigned long long aesl_llvm_cbe_1894_count = 0;
  static  unsigned long long aesl_llvm_cbe_1895_count = 0;
  static  unsigned long long aesl_llvm_cbe_1896_count = 0;
  static  unsigned long long aesl_llvm_cbe_1897_count = 0;
  static  unsigned long long aesl_llvm_cbe_1898_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1909_count = 0;
  static  unsigned long long aesl_llvm_cbe_1910_count = 0;
  static  unsigned long long aesl_llvm_cbe_1911_count = 0;
  static  unsigned long long aesl_llvm_cbe_1912_count = 0;
  static  unsigned long long aesl_llvm_cbe_1913_count = 0;
  static  unsigned long long aesl_llvm_cbe_1914_count = 0;
  static  unsigned long long aesl_llvm_cbe_1915_count = 0;
  static  unsigned long long aesl_llvm_cbe_1916_count = 0;
  static  unsigned long long aesl_llvm_cbe_1917_count = 0;
  static  unsigned long long aesl_llvm_cbe_1918_count = 0;
  static  unsigned long long aesl_llvm_cbe_1919_count = 0;
  static  unsigned long long aesl_llvm_cbe_1920_count = 0;
  static  unsigned long long aesl_llvm_cbe_1921_count = 0;
  static  unsigned long long aesl_llvm_cbe_1922_count = 0;
  static  unsigned long long aesl_llvm_cbe_1923_count = 0;
  static  unsigned long long aesl_llvm_cbe_1924_count = 0;
  static  unsigned long long aesl_llvm_cbe_1925_count = 0;
  static  unsigned long long aesl_llvm_cbe_1926_count = 0;
  static  unsigned long long aesl_llvm_cbe_1927_count = 0;
  static  unsigned long long aesl_llvm_cbe_1928_count = 0;
  static  unsigned long long aesl_llvm_cbe_1929_count = 0;
  static  unsigned long long aesl_llvm_cbe_1930_count = 0;
  static  unsigned long long aesl_llvm_cbe_1931_count = 0;
  static  unsigned long long aesl_llvm_cbe_1932_count = 0;
  static  unsigned long long aesl_llvm_cbe_1933_count = 0;
  static  unsigned long long aesl_llvm_cbe_1934_count = 0;
  static  unsigned long long aesl_llvm_cbe_1935_count = 0;
  static  unsigned long long aesl_llvm_cbe_1936_count = 0;
  static  unsigned long long aesl_llvm_cbe_1937_count = 0;
  static  unsigned long long aesl_llvm_cbe_1938_count = 0;
  static  unsigned long long aesl_llvm_cbe_1939_count = 0;
  static  unsigned long long aesl_llvm_cbe_1940_count = 0;
  static  unsigned long long aesl_llvm_cbe_1941_count = 0;
  static  unsigned long long aesl_llvm_cbe_1942_count = 0;
  static  unsigned long long aesl_llvm_cbe_1943_count = 0;
  static  unsigned long long aesl_llvm_cbe_1944_count = 0;
  static  unsigned long long aesl_llvm_cbe_1945_count = 0;
  static  unsigned long long aesl_llvm_cbe_1946_count = 0;
  static  unsigned long long aesl_llvm_cbe_1947_count = 0;
  static  unsigned long long aesl_llvm_cbe_1948_count = 0;
  static  unsigned long long aesl_llvm_cbe_1949_count = 0;
  static  unsigned long long aesl_llvm_cbe_1950_count = 0;
  static  unsigned long long aesl_llvm_cbe_1951_count = 0;
  static  unsigned long long aesl_llvm_cbe_1952_count = 0;
  static  unsigned long long aesl_llvm_cbe_1953_count = 0;
  static  unsigned long long aesl_llvm_cbe_1954_count = 0;
  static  unsigned long long aesl_llvm_cbe_1955_count = 0;
  static  unsigned long long aesl_llvm_cbe_1956_count = 0;
  static  unsigned long long aesl_llvm_cbe_1957_count = 0;
  static  unsigned long long aesl_llvm_cbe_1958_count = 0;
  static  unsigned long long aesl_llvm_cbe_1959_count = 0;
  static  unsigned long long aesl_llvm_cbe_1960_count = 0;
  static  unsigned long long aesl_llvm_cbe_1961_count = 0;
  static  unsigned long long aesl_llvm_cbe_1962_count = 0;
  static  unsigned long long aesl_llvm_cbe_1963_count = 0;
  static  unsigned long long aesl_llvm_cbe_1964_count = 0;
  static  unsigned long long aesl_llvm_cbe_1965_count = 0;
  static  unsigned long long aesl_llvm_cbe_1966_count = 0;
  static  unsigned long long aesl_llvm_cbe_1967_count = 0;
  static  unsigned long long aesl_llvm_cbe_1968_count = 0;
  static  unsigned long long aesl_llvm_cbe_1969_count = 0;
  static  unsigned long long aesl_llvm_cbe_1970_count = 0;
  static  unsigned long long aesl_llvm_cbe_1971_count = 0;
  static  unsigned long long aesl_llvm_cbe_1972_count = 0;
  static  unsigned long long aesl_llvm_cbe_1973_count = 0;
  static  unsigned long long aesl_llvm_cbe_1974_count = 0;
  static  unsigned long long aesl_llvm_cbe_1975_count = 0;
  static  unsigned long long aesl_llvm_cbe_1976_count = 0;
  static  unsigned long long aesl_llvm_cbe_1977_count = 0;
  static  unsigned long long aesl_llvm_cbe_1978_count = 0;
  static  unsigned long long aesl_llvm_cbe_1979_count = 0;
  static  unsigned long long aesl_llvm_cbe_1980_count = 0;
  static  unsigned long long aesl_llvm_cbe_1981_count = 0;
  static  unsigned long long aesl_llvm_cbe_1982_count = 0;
  static  unsigned long long aesl_llvm_cbe_1983_count = 0;
  static  unsigned long long aesl_llvm_cbe_1984_count = 0;
  static  unsigned long long aesl_llvm_cbe_1985_count = 0;
  static  unsigned long long aesl_llvm_cbe_1986_count = 0;
  static  unsigned long long aesl_llvm_cbe_1987_count = 0;
  static  unsigned long long aesl_llvm_cbe_1988_count = 0;
  static  unsigned long long aesl_llvm_cbe_1989_count = 0;
  static  unsigned long long aesl_llvm_cbe_1990_count = 0;
  static  unsigned long long aesl_llvm_cbe_1991_count = 0;
  static  unsigned long long aesl_llvm_cbe_1992_count = 0;
  static  unsigned long long aesl_llvm_cbe_1993_count = 0;
  static  unsigned long long aesl_llvm_cbe_1994_count = 0;
  static  unsigned long long aesl_llvm_cbe_1995_count = 0;
  static  unsigned long long aesl_llvm_cbe_1996_count = 0;
  static  unsigned long long aesl_llvm_cbe_1997_count = 0;
  static  unsigned long long aesl_llvm_cbe_1998_count = 0;
  static  unsigned long long aesl_llvm_cbe_1999_count = 0;
  static  unsigned long long aesl_llvm_cbe_2000_count = 0;
  static  unsigned long long aesl_llvm_cbe_2001_count = 0;
  static  unsigned long long aesl_llvm_cbe_2002_count = 0;
  static  unsigned long long aesl_llvm_cbe_2003_count = 0;
  static  unsigned long long aesl_llvm_cbe_2004_count = 0;
  static  unsigned long long aesl_llvm_cbe_2005_count = 0;
  static  unsigned long long aesl_llvm_cbe_2006_count = 0;
  static  unsigned long long aesl_llvm_cbe_2007_count = 0;
  static  unsigned long long aesl_llvm_cbe_2008_count = 0;
  static  unsigned long long aesl_llvm_cbe_2009_count = 0;
  static  unsigned long long aesl_llvm_cbe_2010_count = 0;
  static  unsigned long long aesl_llvm_cbe_2011_count = 0;
  static  unsigned long long aesl_llvm_cbe_2012_count = 0;
  static  unsigned long long aesl_llvm_cbe_2013_count = 0;
  static  unsigned long long aesl_llvm_cbe_2014_count = 0;
  static  unsigned long long aesl_llvm_cbe_2015_count = 0;
  static  unsigned long long aesl_llvm_cbe_2016_count = 0;
  static  unsigned long long aesl_llvm_cbe_2017_count = 0;
  static  unsigned long long aesl_llvm_cbe_2018_count = 0;
  static  unsigned long long aesl_llvm_cbe_2019_count = 0;
  static  unsigned long long aesl_llvm_cbe_2020_count = 0;
  static  unsigned long long aesl_llvm_cbe_2021_count = 0;
  static  unsigned long long aesl_llvm_cbe_2022_count = 0;
  static  unsigned long long aesl_llvm_cbe_2023_count = 0;
  static  unsigned long long aesl_llvm_cbe_2024_count = 0;
  static  unsigned long long aesl_llvm_cbe_2025_count = 0;
  static  unsigned long long aesl_llvm_cbe_2026_count = 0;
  static  unsigned long long aesl_llvm_cbe_2027_count = 0;
  static  unsigned long long aesl_llvm_cbe_2028_count = 0;
  static  unsigned long long aesl_llvm_cbe_2029_count = 0;
  static  unsigned long long aesl_llvm_cbe_2030_count = 0;
  static  unsigned long long aesl_llvm_cbe_2031_count = 0;
  static  unsigned long long aesl_llvm_cbe_2032_count = 0;
  static  unsigned long long aesl_llvm_cbe_2033_count = 0;
  static  unsigned long long aesl_llvm_cbe_2034_count = 0;
  static  unsigned long long aesl_llvm_cbe_2035_count = 0;
  static  unsigned long long aesl_llvm_cbe_2036_count = 0;
  static  unsigned long long aesl_llvm_cbe_2037_count = 0;
  static  unsigned long long aesl_llvm_cbe_2038_count = 0;
  static  unsigned long long aesl_llvm_cbe_2039_count = 0;
  static  unsigned long long aesl_llvm_cbe_2040_count = 0;
  static  unsigned long long aesl_llvm_cbe_2041_count = 0;
  static  unsigned long long aesl_llvm_cbe_2042_count = 0;
  static  unsigned long long aesl_llvm_cbe_2043_count = 0;
  static  unsigned long long aesl_llvm_cbe_2044_count = 0;
  static  unsigned long long aesl_llvm_cbe_2045_count = 0;
  static  unsigned long long aesl_llvm_cbe_2046_count = 0;
  static  unsigned long long aesl_llvm_cbe_2047_count = 0;
  static  unsigned long long aesl_llvm_cbe_2048_count = 0;
  static  unsigned long long aesl_llvm_cbe_2049_count = 0;
  static  unsigned long long aesl_llvm_cbe_2050_count = 0;
  static  unsigned long long aesl_llvm_cbe_2051_count = 0;
  static  unsigned long long aesl_llvm_cbe_2052_count = 0;
  static  unsigned long long aesl_llvm_cbe_2053_count = 0;
  static  unsigned long long aesl_llvm_cbe_2054_count = 0;
  static  unsigned long long aesl_llvm_cbe_2055_count = 0;
  static  unsigned long long aesl_llvm_cbe_2056_count = 0;
  static  unsigned long long aesl_llvm_cbe_2057_count = 0;
  static  unsigned long long aesl_llvm_cbe_2058_count = 0;
  static  unsigned long long aesl_llvm_cbe_2059_count = 0;
  static  unsigned long long aesl_llvm_cbe_2060_count = 0;
  static  unsigned long long aesl_llvm_cbe_2061_count = 0;
  static  unsigned long long aesl_llvm_cbe_2062_count = 0;
  static  unsigned long long aesl_llvm_cbe_2063_count = 0;
  static  unsigned long long aesl_llvm_cbe_2064_count = 0;
  static  unsigned long long aesl_llvm_cbe_2065_count = 0;
  static  unsigned long long aesl_llvm_cbe_2066_count = 0;
  static  unsigned long long aesl_llvm_cbe_2067_count = 0;
  static  unsigned long long aesl_llvm_cbe_2068_count = 0;
  static  unsigned long long aesl_llvm_cbe_2069_count = 0;
  static  unsigned long long aesl_llvm_cbe_2070_count = 0;
  static  unsigned long long aesl_llvm_cbe_2071_count = 0;
  static  unsigned long long aesl_llvm_cbe_2072_count = 0;
  static  unsigned long long aesl_llvm_cbe_2073_count = 0;
  static  unsigned long long aesl_llvm_cbe_2074_count = 0;
  static  unsigned long long aesl_llvm_cbe_2075_count = 0;
  static  unsigned long long aesl_llvm_cbe_2076_count = 0;
  static  unsigned long long aesl_llvm_cbe_2077_count = 0;
  static  unsigned long long aesl_llvm_cbe_2078_count = 0;
  static  unsigned long long aesl_llvm_cbe_2079_count = 0;
  static  unsigned long long aesl_llvm_cbe_2080_count = 0;
  static  unsigned long long aesl_llvm_cbe_2081_count = 0;
  static  unsigned long long aesl_llvm_cbe_2082_count = 0;
  static  unsigned long long aesl_llvm_cbe_2083_count = 0;
  static  unsigned long long aesl_llvm_cbe_2084_count = 0;
  static  unsigned long long aesl_llvm_cbe_2085_count = 0;
  static  unsigned long long aesl_llvm_cbe_2086_count = 0;
  static  unsigned long long aesl_llvm_cbe_2087_count = 0;
  static  unsigned long long aesl_llvm_cbe_2088_count = 0;
  static  unsigned long long aesl_llvm_cbe_2089_count = 0;
  static  unsigned long long aesl_llvm_cbe_2090_count = 0;
  static  unsigned long long aesl_llvm_cbe_2091_count = 0;
  static  unsigned long long aesl_llvm_cbe_2092_count = 0;
  static  unsigned long long aesl_llvm_cbe_2093_count = 0;
  static  unsigned long long aesl_llvm_cbe_2094_count = 0;
  static  unsigned long long aesl_llvm_cbe_2095_count = 0;
  static  unsigned long long aesl_llvm_cbe_2096_count = 0;
  static  unsigned long long aesl_llvm_cbe_2097_count = 0;
  static  unsigned long long aesl_llvm_cbe_2098_count = 0;
  static  unsigned long long aesl_llvm_cbe_2099_count = 0;
  static  unsigned long long aesl_llvm_cbe_2100_count = 0;
  static  unsigned long long aesl_llvm_cbe_2101_count = 0;
  static  unsigned long long aesl_llvm_cbe_2102_count = 0;
  static  unsigned long long aesl_llvm_cbe_2103_count = 0;
  static  unsigned long long aesl_llvm_cbe_2104_count = 0;
  static  unsigned long long aesl_llvm_cbe_2105_count = 0;
  static  unsigned long long aesl_llvm_cbe_2106_count = 0;
  static  unsigned long long aesl_llvm_cbe_2107_count = 0;
  static  unsigned long long aesl_llvm_cbe_2108_count = 0;
  static  unsigned long long aesl_llvm_cbe_2109_count = 0;
  static  unsigned long long aesl_llvm_cbe_2110_count = 0;
  static  unsigned long long aesl_llvm_cbe_2111_count = 0;
  static  unsigned long long aesl_llvm_cbe_2112_count = 0;
  static  unsigned long long aesl_llvm_cbe_2113_count = 0;
  static  unsigned long long aesl_llvm_cbe_2114_count = 0;
  static  unsigned long long aesl_llvm_cbe_2115_count = 0;
  static  unsigned long long aesl_llvm_cbe_2116_count = 0;
  static  unsigned long long aesl_llvm_cbe_2117_count = 0;
  static  unsigned long long aesl_llvm_cbe_2118_count = 0;
  static  unsigned long long aesl_llvm_cbe_2119_count = 0;
  static  unsigned long long aesl_llvm_cbe_2120_count = 0;
  static  unsigned long long aesl_llvm_cbe_2121_count = 0;
  static  unsigned long long aesl_llvm_cbe_2122_count = 0;
  static  unsigned long long aesl_llvm_cbe_2123_count = 0;
  static  unsigned long long aesl_llvm_cbe_2124_count = 0;
  static  unsigned long long aesl_llvm_cbe_2125_count = 0;
  static  unsigned long long aesl_llvm_cbe_2126_count = 0;
  static  unsigned long long aesl_llvm_cbe_2127_count = 0;
  static  unsigned long long aesl_llvm_cbe_2128_count = 0;
  static  unsigned long long aesl_llvm_cbe_2129_count = 0;
  static  unsigned long long aesl_llvm_cbe_2130_count = 0;
  static  unsigned long long aesl_llvm_cbe_2131_count = 0;
  static  unsigned long long aesl_llvm_cbe_2132_count = 0;
  static  unsigned long long aesl_llvm_cbe_2133_count = 0;
  static  unsigned long long aesl_llvm_cbe_2134_count = 0;
  static  unsigned long long aesl_llvm_cbe_2135_count = 0;
  static  unsigned long long aesl_llvm_cbe_2136_count = 0;
  static  unsigned long long aesl_llvm_cbe_2137_count = 0;
  static  unsigned long long aesl_llvm_cbe_2138_count = 0;
  static  unsigned long long aesl_llvm_cbe_2139_count = 0;
  static  unsigned long long aesl_llvm_cbe_2140_count = 0;
  static  unsigned long long aesl_llvm_cbe_2141_count = 0;
  static  unsigned long long aesl_llvm_cbe_2142_count = 0;
  static  unsigned long long aesl_llvm_cbe_2143_count = 0;
  static  unsigned long long aesl_llvm_cbe_2144_count = 0;
  static  unsigned long long aesl_llvm_cbe_2145_count = 0;
  static  unsigned long long aesl_llvm_cbe_2146_count = 0;
  static  unsigned long long aesl_llvm_cbe_2147_count = 0;
  static  unsigned long long aesl_llvm_cbe_2148_count = 0;
  static  unsigned long long aesl_llvm_cbe_2149_count = 0;
  static  unsigned long long aesl_llvm_cbe_2150_count = 0;
  static  unsigned long long aesl_llvm_cbe_2151_count = 0;
  static  unsigned long long aesl_llvm_cbe_2152_count = 0;
  static  unsigned long long aesl_llvm_cbe_2153_count = 0;
  static  unsigned long long aesl_llvm_cbe_2154_count = 0;
  static  unsigned long long aesl_llvm_cbe_2155_count = 0;
  static  unsigned long long aesl_llvm_cbe_2156_count = 0;
  static  unsigned long long aesl_llvm_cbe_2157_count = 0;
  static  unsigned long long aesl_llvm_cbe_2158_count = 0;
  static  unsigned long long aesl_llvm_cbe_2159_count = 0;
  static  unsigned long long aesl_llvm_cbe_2160_count = 0;
  static  unsigned long long aesl_llvm_cbe_2161_count = 0;
  static  unsigned long long aesl_llvm_cbe_2162_count = 0;
  static  unsigned long long aesl_llvm_cbe_2163_count = 0;
  static  unsigned long long aesl_llvm_cbe_2164_count = 0;
  static  unsigned long long aesl_llvm_cbe_2165_count = 0;
  static  unsigned long long aesl_llvm_cbe_2166_count = 0;
  static  unsigned long long aesl_llvm_cbe_2167_count = 0;
  static  unsigned long long aesl_llvm_cbe_2168_count = 0;
  static  unsigned long long aesl_llvm_cbe_2169_count = 0;
  static  unsigned long long aesl_llvm_cbe_2170_count = 0;
  static  unsigned long long aesl_llvm_cbe_2171_count = 0;
  static  unsigned long long aesl_llvm_cbe_2172_count = 0;
  static  unsigned long long aesl_llvm_cbe_2173_count = 0;
  static  unsigned long long aesl_llvm_cbe_2174_count = 0;
  static  unsigned long long aesl_llvm_cbe_2175_count = 0;
  static  unsigned long long aesl_llvm_cbe_2176_count = 0;
  static  unsigned long long aesl_llvm_cbe_2177_count = 0;
  static  unsigned long long aesl_llvm_cbe_2178_count = 0;
  static  unsigned long long aesl_llvm_cbe_2179_count = 0;
  static  unsigned long long aesl_llvm_cbe_2180_count = 0;
  static  unsigned long long aesl_llvm_cbe_2181_count = 0;
  static  unsigned long long aesl_llvm_cbe_2182_count = 0;
  static  unsigned long long aesl_llvm_cbe_2183_count = 0;
  static  unsigned long long aesl_llvm_cbe_2184_count = 0;
  static  unsigned long long aesl_llvm_cbe_2185_count = 0;
  static  unsigned long long aesl_llvm_cbe_2186_count = 0;
  static  unsigned long long aesl_llvm_cbe_2187_count = 0;
  static  unsigned long long aesl_llvm_cbe_2188_count = 0;
  static  unsigned long long aesl_llvm_cbe_2189_count = 0;
  static  unsigned long long aesl_llvm_cbe_2190_count = 0;
  static  unsigned long long aesl_llvm_cbe_2191_count = 0;
  static  unsigned long long aesl_llvm_cbe_2192_count = 0;
  static  unsigned long long aesl_llvm_cbe_2193_count = 0;
  static  unsigned long long aesl_llvm_cbe_2194_count = 0;
  static  unsigned long long aesl_llvm_cbe_2195_count = 0;
  static  unsigned long long aesl_llvm_cbe_2196_count = 0;
  static  unsigned long long aesl_llvm_cbe_2197_count = 0;
  static  unsigned long long aesl_llvm_cbe_2198_count = 0;
  static  unsigned long long aesl_llvm_cbe_2199_count = 0;
  static  unsigned long long aesl_llvm_cbe_2200_count = 0;
  static  unsigned long long aesl_llvm_cbe_2201_count = 0;
  static  unsigned long long aesl_llvm_cbe_2202_count = 0;
  static  unsigned long long aesl_llvm_cbe_2203_count = 0;
  static  unsigned long long aesl_llvm_cbe_2204_count = 0;
  static  unsigned long long aesl_llvm_cbe_2205_count = 0;
  static  unsigned long long aesl_llvm_cbe_2206_count = 0;
  static  unsigned long long aesl_llvm_cbe_2207_count = 0;
  static  unsigned long long aesl_llvm_cbe_2208_count = 0;
  static  unsigned long long aesl_llvm_cbe_2209_count = 0;
  static  unsigned long long aesl_llvm_cbe_2210_count = 0;
  static  unsigned long long aesl_llvm_cbe_2211_count = 0;
  static  unsigned long long aesl_llvm_cbe_2212_count = 0;
  static  unsigned long long aesl_llvm_cbe_2213_count = 0;
  static  unsigned long long aesl_llvm_cbe_2214_count = 0;
  static  unsigned long long aesl_llvm_cbe_2215_count = 0;
  static  unsigned long long aesl_llvm_cbe_2216_count = 0;
  static  unsigned long long aesl_llvm_cbe_2217_count = 0;
  static  unsigned long long aesl_llvm_cbe_2218_count = 0;
  static  unsigned long long aesl_llvm_cbe_2219_count = 0;
  static  unsigned long long aesl_llvm_cbe_2220_count = 0;
  static  unsigned long long aesl_llvm_cbe_2221_count = 0;
  static  unsigned long long aesl_llvm_cbe_2222_count = 0;
  static  unsigned long long aesl_llvm_cbe_2223_count = 0;
  static  unsigned long long aesl_llvm_cbe_2224_count = 0;
  static  unsigned long long aesl_llvm_cbe_2225_count = 0;
  static  unsigned long long aesl_llvm_cbe_2226_count = 0;
  static  unsigned long long aesl_llvm_cbe_2227_count = 0;
  static  unsigned long long aesl_llvm_cbe_2228_count = 0;
  static  unsigned long long aesl_llvm_cbe_2229_count = 0;
  static  unsigned long long aesl_llvm_cbe_2230_count = 0;
  static  unsigned long long aesl_llvm_cbe_2231_count = 0;
  static  unsigned long long aesl_llvm_cbe_2232_count = 0;
  static  unsigned long long aesl_llvm_cbe_2233_count = 0;
  static  unsigned long long aesl_llvm_cbe_2234_count = 0;
  static  unsigned long long aesl_llvm_cbe_2235_count = 0;
  static  unsigned long long aesl_llvm_cbe_2236_count = 0;
  static  unsigned long long aesl_llvm_cbe_2237_count = 0;
  static  unsigned long long aesl_llvm_cbe_2238_count = 0;
  static  unsigned long long aesl_llvm_cbe_2239_count = 0;
  static  unsigned long long aesl_llvm_cbe_2240_count = 0;
  static  unsigned long long aesl_llvm_cbe_2241_count = 0;
  static  unsigned long long aesl_llvm_cbe_2242_count = 0;
  static  unsigned long long aesl_llvm_cbe_2243_count = 0;
  static  unsigned long long aesl_llvm_cbe_2244_count = 0;
  static  unsigned long long aesl_llvm_cbe_2245_count = 0;
  static  unsigned long long aesl_llvm_cbe_2246_count = 0;
  static  unsigned long long aesl_llvm_cbe_2247_count = 0;
  static  unsigned long long aesl_llvm_cbe_2248_count = 0;
  static  unsigned long long aesl_llvm_cbe_2249_count = 0;
  static  unsigned long long aesl_llvm_cbe_2250_count = 0;
  static  unsigned long long aesl_llvm_cbe_2251_count = 0;
  static  unsigned long long aesl_llvm_cbe_2252_count = 0;
  static  unsigned long long aesl_llvm_cbe_2253_count = 0;
  static  unsigned long long aesl_llvm_cbe_2254_count = 0;
  static  unsigned long long aesl_llvm_cbe_2255_count = 0;
  static  unsigned long long aesl_llvm_cbe_2256_count = 0;
  static  unsigned long long aesl_llvm_cbe_2257_count = 0;
  static  unsigned long long aesl_llvm_cbe_2258_count = 0;
  static  unsigned long long aesl_llvm_cbe_2259_count = 0;
  static  unsigned long long aesl_llvm_cbe_2260_count = 0;
  static  unsigned long long aesl_llvm_cbe_2261_count = 0;
  static  unsigned long long aesl_llvm_cbe_2262_count = 0;
  static  unsigned long long aesl_llvm_cbe_2263_count = 0;
  static  unsigned long long aesl_llvm_cbe_2264_count = 0;
  static  unsigned long long aesl_llvm_cbe_2265_count = 0;
  static  unsigned long long aesl_llvm_cbe_2266_count = 0;
  static  unsigned long long aesl_llvm_cbe_2267_count = 0;
  static  unsigned long long aesl_llvm_cbe_2268_count = 0;
  static  unsigned long long aesl_llvm_cbe_2269_count = 0;
  static  unsigned long long aesl_llvm_cbe_2270_count = 0;
  static  unsigned long long aesl_llvm_cbe_2271_count = 0;
  static  unsigned long long aesl_llvm_cbe_2272_count = 0;
  static  unsigned long long aesl_llvm_cbe_2273_count = 0;
  static  unsigned long long aesl_llvm_cbe_2274_count = 0;
  static  unsigned long long aesl_llvm_cbe_2275_count = 0;
  static  unsigned long long aesl_llvm_cbe_2276_count = 0;
  static  unsigned long long aesl_llvm_cbe_2277_count = 0;
  static  unsigned long long aesl_llvm_cbe_2278_count = 0;
  static  unsigned long long aesl_llvm_cbe_2279_count = 0;
  static  unsigned long long aesl_llvm_cbe_2280_count = 0;
  static  unsigned long long aesl_llvm_cbe_2281_count = 0;
  static  unsigned long long aesl_llvm_cbe_2282_count = 0;
  static  unsigned long long aesl_llvm_cbe_2283_count = 0;
  static  unsigned long long aesl_llvm_cbe_2284_count = 0;
  static  unsigned long long aesl_llvm_cbe_2285_count = 0;
  static  unsigned long long aesl_llvm_cbe_2286_count = 0;
  static  unsigned long long aesl_llvm_cbe_2287_count = 0;
  static  unsigned long long aesl_llvm_cbe_2288_count = 0;
  static  unsigned long long aesl_llvm_cbe_2289_count = 0;
  static  unsigned long long aesl_llvm_cbe_2290_count = 0;
  static  unsigned long long aesl_llvm_cbe_2291_count = 0;
  static  unsigned long long aesl_llvm_cbe_2292_count = 0;
  static  unsigned long long aesl_llvm_cbe_2293_count = 0;
  static  unsigned long long aesl_llvm_cbe_2294_count = 0;
  static  unsigned long long aesl_llvm_cbe_2295_count = 0;
  static  unsigned long long aesl_llvm_cbe_2296_count = 0;
  static  unsigned long long aesl_llvm_cbe_2297_count = 0;
  static  unsigned long long aesl_llvm_cbe_2298_count = 0;
  static  unsigned long long aesl_llvm_cbe_2299_count = 0;
  static  unsigned long long aesl_llvm_cbe_2300_count = 0;
  static  unsigned long long aesl_llvm_cbe_2301_count = 0;
  static  unsigned long long aesl_llvm_cbe_2302_count = 0;
  static  unsigned long long aesl_llvm_cbe_2303_count = 0;
  static  unsigned long long aesl_llvm_cbe_2304_count = 0;
  static  unsigned long long aesl_llvm_cbe_2305_count = 0;
  static  unsigned long long aesl_llvm_cbe_2306_count = 0;
  static  unsigned long long aesl_llvm_cbe_2307_count = 0;
  static  unsigned long long aesl_llvm_cbe_2308_count = 0;
  static  unsigned long long aesl_llvm_cbe_2309_count = 0;
  static  unsigned long long aesl_llvm_cbe_2310_count = 0;
  static  unsigned long long aesl_llvm_cbe_2311_count = 0;
  static  unsigned long long aesl_llvm_cbe_2312_count = 0;
  static  unsigned long long aesl_llvm_cbe_2313_count = 0;
  static  unsigned long long aesl_llvm_cbe_2314_count = 0;
  static  unsigned long long aesl_llvm_cbe_2315_count = 0;
  static  unsigned long long aesl_llvm_cbe_2316_count = 0;
  static  unsigned long long aesl_llvm_cbe_2317_count = 0;
  static  unsigned long long aesl_llvm_cbe_2318_count = 0;
  static  unsigned long long aesl_llvm_cbe_2319_count = 0;
  static  unsigned long long aesl_llvm_cbe_2320_count = 0;
  static  unsigned long long aesl_llvm_cbe_2321_count = 0;
  static  unsigned long long aesl_llvm_cbe_2322_count = 0;
  static  unsigned long long aesl_llvm_cbe_2323_count = 0;
  static  unsigned long long aesl_llvm_cbe_2324_count = 0;
  static  unsigned long long aesl_llvm_cbe_2325_count = 0;
  static  unsigned long long aesl_llvm_cbe_2326_count = 0;
  static  unsigned long long aesl_llvm_cbe_2327_count = 0;
  static  unsigned long long aesl_llvm_cbe_2328_count = 0;
  static  unsigned long long aesl_llvm_cbe_2329_count = 0;
  static  unsigned long long aesl_llvm_cbe_2330_count = 0;
  static  unsigned long long aesl_llvm_cbe_2331_count = 0;
  static  unsigned long long aesl_llvm_cbe_2332_count = 0;
  static  unsigned long long aesl_llvm_cbe_2333_count = 0;
  static  unsigned long long aesl_llvm_cbe_2334_count = 0;
  static  unsigned long long aesl_llvm_cbe_2335_count = 0;
  static  unsigned long long aesl_llvm_cbe_2336_count = 0;
  static  unsigned long long aesl_llvm_cbe_2337_count = 0;
  static  unsigned long long aesl_llvm_cbe_2338_count = 0;
  static  unsigned long long aesl_llvm_cbe_2339_count = 0;
  static  unsigned long long aesl_llvm_cbe_2340_count = 0;
  static  unsigned long long aesl_llvm_cbe_2341_count = 0;
  static  unsigned long long aesl_llvm_cbe_2342_count = 0;
  static  unsigned long long aesl_llvm_cbe_2343_count = 0;
  static  unsigned long long aesl_llvm_cbe_2344_count = 0;
  static  unsigned long long aesl_llvm_cbe_2345_count = 0;
  static  unsigned long long aesl_llvm_cbe_2346_count = 0;
  static  unsigned long long aesl_llvm_cbe_2347_count = 0;
  static  unsigned long long aesl_llvm_cbe_2348_count = 0;
  static  unsigned long long aesl_llvm_cbe_2349_count = 0;
  static  unsigned long long aesl_llvm_cbe_2350_count = 0;
  static  unsigned long long aesl_llvm_cbe_2351_count = 0;
  static  unsigned long long aesl_llvm_cbe_2352_count = 0;
  static  unsigned long long aesl_llvm_cbe_2353_count = 0;
  static  unsigned long long aesl_llvm_cbe_2354_count = 0;
  static  unsigned long long aesl_llvm_cbe_2355_count = 0;
  static  unsigned long long aesl_llvm_cbe_2356_count = 0;
  static  unsigned long long aesl_llvm_cbe_2357_count = 0;
  static  unsigned long long aesl_llvm_cbe_2358_count = 0;
  static  unsigned long long aesl_llvm_cbe_2359_count = 0;
  static  unsigned long long aesl_llvm_cbe_2360_count = 0;
  static  unsigned long long aesl_llvm_cbe_2361_count = 0;
  static  unsigned long long aesl_llvm_cbe_2362_count = 0;
  static  unsigned long long aesl_llvm_cbe_2363_count = 0;
  static  unsigned long long aesl_llvm_cbe_2364_count = 0;
  static  unsigned long long aesl_llvm_cbe_2365_count = 0;
  static  unsigned long long aesl_llvm_cbe_2366_count = 0;
  static  unsigned long long aesl_llvm_cbe_2367_count = 0;
  static  unsigned long long aesl_llvm_cbe_2368_count = 0;
  static  unsigned long long aesl_llvm_cbe_2369_count = 0;
  static  unsigned long long aesl_llvm_cbe_2370_count = 0;
  static  unsigned long long aesl_llvm_cbe_2371_count = 0;
  static  unsigned long long aesl_llvm_cbe_2372_count = 0;
  static  unsigned long long aesl_llvm_cbe_2373_count = 0;
  static  unsigned long long aesl_llvm_cbe_2374_count = 0;
  static  unsigned long long aesl_llvm_cbe_2375_count = 0;
  static  unsigned long long aesl_llvm_cbe_2376_count = 0;
  static  unsigned long long aesl_llvm_cbe_2377_count = 0;
  static  unsigned long long aesl_llvm_cbe_2378_count = 0;
  static  unsigned long long aesl_llvm_cbe_2379_count = 0;
  static  unsigned long long aesl_llvm_cbe_2380_count = 0;
  static  unsigned long long aesl_llvm_cbe_2381_count = 0;
  static  unsigned long long aesl_llvm_cbe_2382_count = 0;
  static  unsigned long long aesl_llvm_cbe_2383_count = 0;
  static  unsigned long long aesl_llvm_cbe_2384_count = 0;
  static  unsigned long long aesl_llvm_cbe_2385_count = 0;
  static  unsigned long long aesl_llvm_cbe_2386_count = 0;
  static  unsigned long long aesl_llvm_cbe_2387_count = 0;
  static  unsigned long long aesl_llvm_cbe_2388_count = 0;
  static  unsigned long long aesl_llvm_cbe_2389_count = 0;
  static  unsigned long long aesl_llvm_cbe_2390_count = 0;
  static  unsigned long long aesl_llvm_cbe_2391_count = 0;
  static  unsigned long long aesl_llvm_cbe_2392_count = 0;
  static  unsigned long long aesl_llvm_cbe_2393_count = 0;
  static  unsigned long long aesl_llvm_cbe_2394_count = 0;
  static  unsigned long long aesl_llvm_cbe_2395_count = 0;
  static  unsigned long long aesl_llvm_cbe_2396_count = 0;
  static  unsigned long long aesl_llvm_cbe_2397_count = 0;
  static  unsigned long long aesl_llvm_cbe_2398_count = 0;
  static  unsigned long long aesl_llvm_cbe_2399_count = 0;
  static  unsigned long long aesl_llvm_cbe_2400_count = 0;
  static  unsigned long long aesl_llvm_cbe_2401_count = 0;
  static  unsigned long long aesl_llvm_cbe_2402_count = 0;
  static  unsigned long long aesl_llvm_cbe_2403_count = 0;
  static  unsigned long long aesl_llvm_cbe_2404_count = 0;
  static  unsigned long long aesl_llvm_cbe_2405_count = 0;
  static  unsigned long long aesl_llvm_cbe_2406_count = 0;
  static  unsigned long long aesl_llvm_cbe_2407_count = 0;
  static  unsigned long long aesl_llvm_cbe_2408_count = 0;
  static  unsigned long long aesl_llvm_cbe_2409_count = 0;
  static  unsigned long long aesl_llvm_cbe_2410_count = 0;
  static  unsigned long long aesl_llvm_cbe_2411_count = 0;
  static  unsigned long long aesl_llvm_cbe_2412_count = 0;
  static  unsigned long long aesl_llvm_cbe_2413_count = 0;
  static  unsigned long long aesl_llvm_cbe_2414_count = 0;
  static  unsigned long long aesl_llvm_cbe_2415_count = 0;
  static  unsigned long long aesl_llvm_cbe_2416_count = 0;
  static  unsigned long long aesl_llvm_cbe_2417_count = 0;
  static  unsigned long long aesl_llvm_cbe_2418_count = 0;
  static  unsigned long long aesl_llvm_cbe_2419_count = 0;
  static  unsigned long long aesl_llvm_cbe_2420_count = 0;
  static  unsigned long long aesl_llvm_cbe_2421_count = 0;
  static  unsigned long long aesl_llvm_cbe_2422_count = 0;
  static  unsigned long long aesl_llvm_cbe_2423_count = 0;
  static  unsigned long long aesl_llvm_cbe_2424_count = 0;
  static  unsigned long long aesl_llvm_cbe_2425_count = 0;
  static  unsigned long long aesl_llvm_cbe_2426_count = 0;
  static  unsigned long long aesl_llvm_cbe_2427_count = 0;
  static  unsigned long long aesl_llvm_cbe_2428_count = 0;
  static  unsigned long long aesl_llvm_cbe_2429_count = 0;
  static  unsigned long long aesl_llvm_cbe_2430_count = 0;
  static  unsigned long long aesl_llvm_cbe_2431_count = 0;
  static  unsigned long long aesl_llvm_cbe_2432_count = 0;
  static  unsigned long long aesl_llvm_cbe_2433_count = 0;
  static  unsigned long long aesl_llvm_cbe_2434_count = 0;
  static  unsigned long long aesl_llvm_cbe_2435_count = 0;
  static  unsigned long long aesl_llvm_cbe_2436_count = 0;
  static  unsigned long long aesl_llvm_cbe_2437_count = 0;
  static  unsigned long long aesl_llvm_cbe_2438_count = 0;
  static  unsigned long long aesl_llvm_cbe_2439_count = 0;
  static  unsigned long long aesl_llvm_cbe_2440_count = 0;
  static  unsigned long long aesl_llvm_cbe_2441_count = 0;
  static  unsigned long long aesl_llvm_cbe_2442_count = 0;
  static  unsigned long long aesl_llvm_cbe_2443_count = 0;
  static  unsigned long long aesl_llvm_cbe_2444_count = 0;
  static  unsigned long long aesl_llvm_cbe_2445_count = 0;
  static  unsigned long long aesl_llvm_cbe_2446_count = 0;
  static  unsigned long long aesl_llvm_cbe_2447_count = 0;
  static  unsigned long long aesl_llvm_cbe_2448_count = 0;
  static  unsigned long long aesl_llvm_cbe_2449_count = 0;
  static  unsigned long long aesl_llvm_cbe_2450_count = 0;
  static  unsigned long long aesl_llvm_cbe_2451_count = 0;
  static  unsigned long long aesl_llvm_cbe_2452_count = 0;
  static  unsigned long long aesl_llvm_cbe_2453_count = 0;
  static  unsigned long long aesl_llvm_cbe_2454_count = 0;
  static  unsigned long long aesl_llvm_cbe_2455_count = 0;
  static  unsigned long long aesl_llvm_cbe_2456_count = 0;
  static  unsigned long long aesl_llvm_cbe_2457_count = 0;
  static  unsigned long long aesl_llvm_cbe_2458_count = 0;
  static  unsigned long long aesl_llvm_cbe_2459_count = 0;
  static  unsigned long long aesl_llvm_cbe_2460_count = 0;
  static  unsigned long long aesl_llvm_cbe_2461_count = 0;
  static  unsigned long long aesl_llvm_cbe_2462_count = 0;
  static  unsigned long long aesl_llvm_cbe_2463_count = 0;
  static  unsigned long long aesl_llvm_cbe_2464_count = 0;
  static  unsigned long long aesl_llvm_cbe_2465_count = 0;
  static  unsigned long long aesl_llvm_cbe_2466_count = 0;
  static  unsigned long long aesl_llvm_cbe_2467_count = 0;
  static  unsigned long long aesl_llvm_cbe_2468_count = 0;
  static  unsigned long long aesl_llvm_cbe_2469_count = 0;
  static  unsigned long long aesl_llvm_cbe_2470_count = 0;
  static  unsigned long long aesl_llvm_cbe_2471_count = 0;
  static  unsigned long long aesl_llvm_cbe_2472_count = 0;
  static  unsigned long long aesl_llvm_cbe_2473_count = 0;
  static  unsigned long long aesl_llvm_cbe_2474_count = 0;
  static  unsigned long long aesl_llvm_cbe_2475_count = 0;
  static  unsigned long long aesl_llvm_cbe_2476_count = 0;
  static  unsigned long long aesl_llvm_cbe_2477_count = 0;
  static  unsigned long long aesl_llvm_cbe_2478_count = 0;
  static  unsigned long long aesl_llvm_cbe_2479_count = 0;
  static  unsigned long long aesl_llvm_cbe_2480_count = 0;
  static  unsigned long long aesl_llvm_cbe_2481_count = 0;
  static  unsigned long long aesl_llvm_cbe_2482_count = 0;
  static  unsigned long long aesl_llvm_cbe_2483_count = 0;
const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @reset\n");
if (AESL_DEBUG_TRACE)
printf("\n  store i32 32, i32* @dec_detl, align 4, !dbg !22 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1340_count);
  *(&dec_detl) = 32u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 32u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 32, i32* @detl, align 4, !dbg !22 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1341_count);
  *(&detl) = 32u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 32u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 8, i32* @dec_deth, align 4, !dbg !22 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1342_count);
  *(&dec_deth) = 8u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 8u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 8, i32* @deth, align 4, !dbg !22 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1343_count);
  *(&deth) = 8u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 8u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @rlt2, align 4, !dbg !22 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1344_count);
  *(&rlt2) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @rlt1, align 4, !dbg !22 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1345_count);
  *(&rlt1) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @plt2, align 4, !dbg !22 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1346_count);
  *(&plt2) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @plt1, align 4, !dbg !22 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1347_count);
  *(&plt1) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @al2, align 4, !dbg !22 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1348_count);
  *(&al2) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @al1, align 4, !dbg !22 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1349_count);
  *(&al1) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @nbl, align 4, !dbg !22 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1350_count);
  *(&nbl) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @rh2, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1351_count);
  *(&rh2) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @rh1, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1352_count);
  *(&rh1) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @ph2, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1353_count);
  *(&ph2) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @ph1, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1354_count);
  *(&ph1) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @ah2, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1355_count);
  *(&ah2) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @ah1, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1356_count);
  *(&ah1) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @nbh, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1357_count);
  *(&nbh) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @dec_rlt2, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1358_count);
  *(&dec_rlt2) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @dec_rlt1, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1359_count);
  *(&dec_rlt1) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @dec_plt2, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1360_count);
  *(&dec_plt2) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @dec_plt1, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1361_count);
  *(&dec_plt1) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @dec_al2, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1362_count);
  *(&dec_al2) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @dec_al1, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1363_count);
  *(&dec_al1) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @dec_nbl, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1364_count);
  *(&dec_nbl) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @dec_rh2, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1365_count);
  *(&dec_rh2) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @dec_rh1, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1366_count);
  *(&dec_rh1) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @dec_ph2, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1367_count);
  *(&dec_ph2) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @dec_ph1, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1368_count);
  *(&dec_ph1) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @dec_ah2, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1369_count);
  *(&dec_ah2) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @dec_ah1, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1370_count);
  *(&dec_ah1) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* @dec_nbh, align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1371_count);
  *(&dec_nbh) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_dltx, i64 0, i64 0), align 16, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1392_count);
  *((&delay_dltx[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_dhx, i64 0, i64 0), align 16, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1393_count);
  *((&delay_dhx[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_dltx, i64 0, i64 0), align 16, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1394_count);
  *((&dec_del_dltx[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_dhx, i64 0, i64 0), align 16, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1395_count);
  *((&dec_del_dhx[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_dltx, i64 0, i64 1), align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1416_count);
  *((&delay_dltx[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_dhx, i64 0, i64 1), align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1417_count);
  *((&delay_dhx[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_dltx, i64 0, i64 1), align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1418_count);
  *((&dec_del_dltx[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_dhx, i64 0, i64 1), align 4, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1419_count);
  *((&dec_del_dhx[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_dltx, i64 0, i64 2), align 8, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1440_count);
  *((&delay_dltx[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_dhx, i64 0, i64 2), align 8, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1441_count);
  *((&delay_dhx[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_dltx, i64 0, i64 2), align 8, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1442_count);
  *((&dec_del_dltx[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_dhx, i64 0, i64 2), align 8, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1443_count);
  *((&dec_del_dhx[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_dltx, i64 0, i64 3), align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1464_count);
  *((&delay_dltx[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_dhx, i64 0, i64 3), align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1465_count);
  *((&delay_dhx[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_dltx, i64 0, i64 3), align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1466_count);
  *((&dec_del_dltx[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_dhx, i64 0, i64 3), align 4, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1467_count);
  *((&dec_del_dhx[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_dltx, i64 0, i64 4), align 16, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1488_count);
  *((&delay_dltx[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_dhx, i64 0, i64 4), align 16, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1489_count);
  *((&delay_dhx[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_dltx, i64 0, i64 4), align 16, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1490_count);
  *((&dec_del_dltx[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_dhx, i64 0, i64 4), align 16, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1491_count);
  *((&dec_del_dhx[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_dltx, i64 0, i64 5), align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1512_count);
  *((&delay_dltx[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_dhx, i64 0, i64 5), align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1513_count);
  *((&delay_dhx[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_dltx, i64 0, i64 5), align 4, !dbg !23 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1514_count);
  *((&dec_del_dltx[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_dhx, i64 0, i64 5), align 4, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1515_count);
  *((&dec_del_dhx[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_bpl, i64 0, i64 0), align 16, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1555_count);
  *((&delay_bpl[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_bph, i64 0, i64 0), align 16, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1556_count);
  *((&delay_bph[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_bpl, i64 0, i64 0), align 16, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1557_count);
  *((&dec_del_bpl[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_bph, i64 0, i64 0), align 16, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1558_count);
  *((&dec_del_bph[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_bpl, i64 0, i64 1), align 4, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1579_count);
  *((&delay_bpl[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_bph, i64 0, i64 1), align 4, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1580_count);
  *((&delay_bph[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_bpl, i64 0, i64 1), align 4, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1581_count);
  *((&dec_del_bpl[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_bph, i64 0, i64 1), align 4, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1582_count);
  *((&dec_del_bph[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_bpl, i64 0, i64 2), align 8, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1603_count);
  *((&delay_bpl[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_bph, i64 0, i64 2), align 8, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1604_count);
  *((&delay_bph[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_bpl, i64 0, i64 2), align 8, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1605_count);
  *((&dec_del_bpl[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_bph, i64 0, i64 2), align 8, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1606_count);
  *((&dec_del_bph[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_bpl, i64 0, i64 3), align 4, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1627_count);
  *((&delay_bpl[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_bph, i64 0, i64 3), align 4, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1628_count);
  *((&delay_bph[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_bpl, i64 0, i64 3), align 4, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1629_count);
  *((&dec_del_bpl[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_bph, i64 0, i64 3), align 4, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1630_count);
  *((&dec_del_bph[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_bpl, i64 0, i64 4), align 16, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1651_count);
  *((&delay_bpl[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_bph, i64 0, i64 4), align 16, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1652_count);
  *((&delay_bph[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_bpl, i64 0, i64 4), align 16, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1653_count);
  *((&dec_del_bpl[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_bph, i64 0, i64 4), align 16, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1654_count);
  *((&dec_del_bph[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_bpl, i64 0, i64 5), align 4, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1675_count);
  *((&delay_bpl[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @delay_bph, i64 0, i64 5), align 4, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1676_count);
  *((&delay_bph[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_bpl, i64 0, i64 5), align 4, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1677_count);
  *((&dec_del_bpl[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([6 x i32]* @dec_del_bph, i64 0, i64 5), align 4, !dbg !24 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1678_count);
  *((&dec_del_bph[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 6
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 0), align 16, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1718_count);
  *((&tqmf[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 1), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1739_count);
  *((&tqmf[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 2), align 8, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1760_count);
  *((&tqmf[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 3), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1781_count);
  *((&tqmf[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 4), align 16, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1802_count);
  *((&tqmf[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 5), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1823_count);
  *((&tqmf[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 6), align 8, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1844_count);
  *((&tqmf[(((signed long long )6ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 7), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1865_count);
  *((&tqmf[(((signed long long )7ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 8), align 16, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1886_count);
  *((&tqmf[(((signed long long )8ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 9), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1907_count);
  *((&tqmf[(((signed long long )9ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 10), align 8, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1928_count);
  *((&tqmf[(((signed long long )10ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 11), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1949_count);
  *((&tqmf[(((signed long long )11ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 12), align 16, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1970_count);
  *((&tqmf[(((signed long long )12ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 13), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_1991_count);
  *((&tqmf[(((signed long long )13ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 14), align 8, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2012_count);
  *((&tqmf[(((signed long long )14ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 15), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2033_count);
  *((&tqmf[(((signed long long )15ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 16), align 16, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2054_count);
  *((&tqmf[(((signed long long )16ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 17), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2075_count);
  *((&tqmf[(((signed long long )17ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 18), align 8, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2096_count);
  *((&tqmf[(((signed long long )18ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 19), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2117_count);
  *((&tqmf[(((signed long long )19ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 20), align 16, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2138_count);
  *((&tqmf[(((signed long long )20ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 21), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2159_count);
  *((&tqmf[(((signed long long )21ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 22), align 8, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2180_count);
  *((&tqmf[(((signed long long )22ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([24 x i32]* @tqmf, i64 0, i64 23), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2201_count);
  *((&tqmf[(((signed long long )23ull))
#ifdef AESL_BC_SIM
 % 24
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 0), align 16, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2241_count);
  *((&accumc[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 0), align 16, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2242_count);
  *((&accumd[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 1), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2263_count);
  *((&accumc[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 1), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2264_count);
  *((&accumd[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 2), align 8, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2285_count);
  *((&accumc[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 2), align 8, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2286_count);
  *((&accumd[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 3), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2307_count);
  *((&accumc[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 3), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2308_count);
  *((&accumd[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 4), align 16, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2329_count);
  *((&accumc[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 4), align 16, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2330_count);
  *((&accumd[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 5), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2351_count);
  *((&accumc[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 5), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2352_count);
  *((&accumd[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 6), align 8, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2373_count);
  *((&accumc[(((signed long long )6ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 6), align 8, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2374_count);
  *((&accumd[(((signed long long )6ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 7), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2395_count);
  *((&accumc[(((signed long long )7ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 7), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2396_count);
  *((&accumd[(((signed long long )7ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 8), align 16, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2417_count);
  *((&accumc[(((signed long long )8ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 8), align 16, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2418_count);
  *((&accumd[(((signed long long )8ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 9), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2439_count);
  *((&accumc[(((signed long long )9ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 9), align 4, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2440_count);
  *((&accumd[(((signed long long )9ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumc, i64 0, i64 10), align 8, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2461_count);
  *((&accumc[(((signed long long )10ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* getelementptr inbounds ([11 x i32]* @accumd, i64 0, i64 10), align 8, !dbg !25 for 0x%llxth hint within @reset  --> \n", ++aesl_llvm_cbe_2462_count);
  *((&accumd[(((signed long long )10ull))
#ifdef AESL_BC_SIM
 % 11
#endif
])) = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @reset}\n");
  return;
}


void adpcm_main(signed int *llvm_cbe_input_samples, signed int *llvm_cbe_compressed, signed int *llvm_cbe_result) {
  static  unsigned long long aesl_llvm_cbe_2484_count = 0;
  static  unsigned long long aesl_llvm_cbe_2485_count = 0;
  static  unsigned long long aesl_llvm_cbe_2486_count = 0;
  static  unsigned long long aesl_llvm_cbe_2487_count = 0;
  static  unsigned long long aesl_llvm_cbe_2488_count = 0;
  static  unsigned long long aesl_llvm_cbe_2489_count = 0;
  static  unsigned long long aesl_llvm_cbe_2490_count = 0;
  static  unsigned long long aesl_llvm_cbe_2491_count = 0;
  static  unsigned long long aesl_llvm_cbe_2492_count = 0;
  static  unsigned long long aesl_llvm_cbe_2493_count = 0;
  static  unsigned long long aesl_llvm_cbe_2494_count = 0;
  static  unsigned long long aesl_llvm_cbe_2495_count = 0;
  static  unsigned long long aesl_llvm_cbe_2496_count = 0;
  static  unsigned long long aesl_llvm_cbe_2497_count = 0;
  static  unsigned long long aesl_llvm_cbe_2498_count = 0;
  static  unsigned long long aesl_llvm_cbe_2499_count = 0;
  static  unsigned long long aesl_llvm_cbe_2500_count = 0;
  static  unsigned long long aesl_llvm_cbe_2501_count = 0;
  static  unsigned long long aesl_llvm_cbe_2502_count = 0;
  static  unsigned long long aesl_llvm_cbe_2503_count = 0;
  static  unsigned long long aesl_llvm_cbe_2504_count = 0;
  static  unsigned long long aesl_llvm_cbe_2505_count = 0;
  static  unsigned long long aesl_llvm_cbe_2506_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge3_count = 0;
  unsigned int llvm_cbe_storemerge3;
  unsigned int llvm_cbe_storemerge3__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2507_count = 0;
  unsigned long long llvm_cbe_tmp__548;
  static  unsigned long long aesl_llvm_cbe_2508_count = 0;
  signed int *llvm_cbe_tmp__549;
  static  unsigned long long aesl_llvm_cbe_2509_count = 0;
  unsigned int llvm_cbe_tmp__550;
  static  unsigned long long aesl_llvm_cbe_2510_count = 0;
  unsigned int llvm_cbe_tmp__551;
  static  unsigned long long aesl_llvm_cbe_2511_count = 0;
  unsigned long long llvm_cbe_tmp__552;
  static  unsigned long long aesl_llvm_cbe_2512_count = 0;
  signed int *llvm_cbe_tmp__553;
  static  unsigned long long aesl_llvm_cbe_2513_count = 0;
  unsigned int llvm_cbe_tmp__554;
  static  unsigned long long aesl_llvm_cbe_2514_count = 0;
  unsigned int llvm_cbe_tmp__555;
  static  unsigned long long aesl_llvm_cbe_2515_count = 0;
  unsigned int llvm_cbe_tmp__556;
  static  unsigned long long aesl_llvm_cbe_2516_count = 0;
  unsigned long long llvm_cbe_tmp__557;
  static  unsigned long long aesl_llvm_cbe_2517_count = 0;
  signed int *llvm_cbe_tmp__558;
  static  unsigned long long aesl_llvm_cbe_2518_count = 0;
  static  unsigned long long aesl_llvm_cbe_2519_count = 0;
  unsigned int llvm_cbe_tmp__559;
  static  unsigned long long aesl_llvm_cbe_2520_count = 0;
  static  unsigned long long aesl_llvm_cbe_2521_count = 0;
  static  unsigned long long aesl_llvm_cbe_2522_count = 0;
  static  unsigned long long aesl_llvm_cbe_2523_count = 0;
  static  unsigned long long aesl_llvm_cbe_2524_count = 0;
  static  unsigned long long aesl_llvm_cbe_2525_count = 0;
  static  unsigned long long aesl_llvm_cbe_2526_count = 0;
  static  unsigned long long aesl_llvm_cbe_2527_count = 0;
  static  unsigned long long aesl_llvm_cbe_2528_count = 0;
  static  unsigned long long aesl_llvm_cbe_2529_count = 0;
  static  unsigned long long aesl_llvm_cbe_2530_count = 0;
  static  unsigned long long aesl_llvm_cbe_2531_count = 0;
  static  unsigned long long aesl_llvm_cbe_2532_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge12_count = 0;
  unsigned int llvm_cbe_storemerge12;
  unsigned int llvm_cbe_storemerge12__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2533_count = 0;
  unsigned int llvm_cbe_tmp__560;
  static  unsigned long long aesl_llvm_cbe_2534_count = 0;
  unsigned long long llvm_cbe_tmp__561;
  static  unsigned long long aesl_llvm_cbe_2535_count = 0;
  signed int *llvm_cbe_tmp__562;
  static  unsigned long long aesl_llvm_cbe_2536_count = 0;
  unsigned int llvm_cbe_tmp__563;
  static  unsigned long long aesl_llvm_cbe_2537_count = 0;
  static  unsigned long long aesl_llvm_cbe_2538_count = 0;
  unsigned int llvm_cbe_tmp__564;
  static  unsigned long long aesl_llvm_cbe_2539_count = 0;
  unsigned long long llvm_cbe_tmp__565;
  static  unsigned long long aesl_llvm_cbe_2540_count = 0;
  signed int *llvm_cbe_tmp__566;
  static  unsigned long long aesl_llvm_cbe_2541_count = 0;
  static  unsigned long long aesl_llvm_cbe_2542_count = 0;
  unsigned int llvm_cbe_tmp__567;
  static  unsigned long long aesl_llvm_cbe_2543_count = 0;
  unsigned int llvm_cbe_tmp__568;
  static  unsigned long long aesl_llvm_cbe_2544_count = 0;
  unsigned long long llvm_cbe_tmp__569;
  static  unsigned long long aesl_llvm_cbe_2545_count = 0;
  signed int *llvm_cbe_tmp__570;
  static  unsigned long long aesl_llvm_cbe_2546_count = 0;
  static  unsigned long long aesl_llvm_cbe_2547_count = 0;
  unsigned int llvm_cbe_tmp__571;
  static  unsigned long long aesl_llvm_cbe_2548_count = 0;
  static  unsigned long long aesl_llvm_cbe_2549_count = 0;
  static  unsigned long long aesl_llvm_cbe_2550_count = 0;
  static  unsigned long long aesl_llvm_cbe_2551_count = 0;
  static  unsigned long long aesl_llvm_cbe_2552_count = 0;
  static  unsigned long long aesl_llvm_cbe_2553_count = 0;
  static  unsigned long long aesl_llvm_cbe_2554_count = 0;
  static  unsigned long long aesl_llvm_cbe_2555_count = 0;
  static  unsigned long long aesl_llvm_cbe_2556_count = 0;
  static  unsigned long long aesl_llvm_cbe_2557_count = 0;
  static  unsigned long long aesl_llvm_cbe_2558_count = 0;
  static  unsigned long long aesl_llvm_cbe_2559_count = 0;
  static  unsigned long long aesl_llvm_cbe_2560_count = 0;
  static  unsigned long long aesl_llvm_cbe_2561_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @adpcm_main\n");
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @reset(), !dbg !24 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2493_count);
   /*tail*/ reset();
if (AESL_DEBUG_TRACE) {
}
  llvm_cbe_storemerge3__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__572;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__572:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge3 = phi i32 [ 0, %%0 ], [ %%13, %%1  for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_storemerge3_count);
  llvm_cbe_storemerge3 = (unsigned int )llvm_cbe_storemerge3__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge3 = 0x%X",llvm_cbe_storemerge3);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__559);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i32 %%storemerge3 to i64, !dbg !22 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2507_count);
  llvm_cbe_tmp__548 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge3);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__548);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds i32* %%input_samples, i64 %%2, !dbg !22 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2508_count);
  llvm_cbe_tmp__549 = (signed int *)(&llvm_cbe_input_samples[(((signed long long )llvm_cbe_tmp__548))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__548));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load i32* %%3, align 4, !dbg !22 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2509_count);
  llvm_cbe_tmp__550 = (unsigned int )*llvm_cbe_tmp__549;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__550);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = or i32 %%storemerge3, 1, !dbg !22 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2510_count);
  llvm_cbe_tmp__551 = (unsigned int )llvm_cbe_storemerge3 | 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__551);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = sext i32 %%5 to i64, !dbg !22 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2511_count);
  llvm_cbe_tmp__552 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__551);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__552);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = getelementptr inbounds i32* %%input_samples, i64 %%6, !dbg !22 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2512_count);
  llvm_cbe_tmp__553 = (signed int *)(&llvm_cbe_input_samples[(((signed long long )llvm_cbe_tmp__552))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__552));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = load i32* %%7, align 4, !dbg !22 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2513_count);
  llvm_cbe_tmp__554 = (unsigned int )*llvm_cbe_tmp__553;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__554);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = tail call i32 @encode(i32 %%4, i32 %%8), !dbg !22 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2514_count);
  llvm_cbe_tmp__555 = (unsigned int ) /*tail*/ encode(llvm_cbe_tmp__550, llvm_cbe_tmp__554);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__550);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__554);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__555);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = sdiv i32 %%storemerge3, 2, !dbg !22 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2515_count);
  llvm_cbe_tmp__556 = (unsigned int )((signed int )(((signed int )llvm_cbe_storemerge3) / ((signed int )2u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__556));
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = sext i32 %%10 to i64, !dbg !22 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2516_count);
  llvm_cbe_tmp__557 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__556);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__557);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = getelementptr inbounds i32* %%compressed, i64 %%11, !dbg !22 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2517_count);
  llvm_cbe_tmp__558 = (signed int *)(&llvm_cbe_compressed[(((signed long long )llvm_cbe_tmp__557))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__557));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%9, i32* %%12, align 4, !dbg !22 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2518_count);
  *llvm_cbe_tmp__558 = llvm_cbe_tmp__555;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__555);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = add nsw i32 %%storemerge3, 2, !dbg !24 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2519_count);
  llvm_cbe_tmp__559 = (unsigned int )((unsigned int )(llvm_cbe_storemerge3&4294967295ull)) + ((unsigned int )(2u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__559&4294967295ull)));
  if ((((signed int )llvm_cbe_tmp__559) < ((signed int )8000u))) {
    llvm_cbe_storemerge3__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__559;   /* for PHI node */
    goto llvm_cbe_tmp__572;
  } else {
    llvm_cbe_storemerge12__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  }

  } while (1); /* end of syntactic loop '' */
  do {     /* Syntactic loop '.preheader' to make GCC happy */
llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge12 = phi i32 [ %%26, %%.preheader ], [ 0, %%1  for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_storemerge12_count);
  llvm_cbe_storemerge12 = (unsigned int )llvm_cbe_storemerge12__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge12 = 0x%X",llvm_cbe_storemerge12);
printf("\n = 0x%X",llvm_cbe_tmp__571);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = sdiv i32 %%storemerge12, 2, !dbg !23 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2533_count);
  llvm_cbe_tmp__560 = (unsigned int )((signed int )(((signed int )llvm_cbe_storemerge12) / ((signed int )2u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__560));
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = sext i32 %%15 to i64, !dbg !23 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2534_count);
  llvm_cbe_tmp__561 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__560);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__561);
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = getelementptr inbounds i32* %%compressed, i64 %%16, !dbg !23 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2535_count);
  llvm_cbe_tmp__562 = (signed int *)(&llvm_cbe_compressed[(((signed long long )llvm_cbe_tmp__561))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__561));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = load i32* %%17, align 4, !dbg !23 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2536_count);
  llvm_cbe_tmp__563 = (unsigned int )*llvm_cbe_tmp__562;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__563);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @decode(i32 %%18), !dbg !23 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2537_count);
   /*tail*/ decode(llvm_cbe_tmp__563);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__563);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = load i32* @xout1, align 4, !dbg !23 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2538_count);
  llvm_cbe_tmp__564 = (unsigned int )*(&xout1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__564);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = sext i32 %%storemerge12 to i64, !dbg !23 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2539_count);
  llvm_cbe_tmp__565 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge12);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__565);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = getelementptr inbounds i32* %%result, i64 %%20, !dbg !23 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2540_count);
  llvm_cbe_tmp__566 = (signed int *)(&llvm_cbe_result[(((signed long long )llvm_cbe_tmp__565))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__565));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%19, i32* %%21, align 4, !dbg !23 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2541_count);
  *llvm_cbe_tmp__566 = llvm_cbe_tmp__564;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__564);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = load i32* @xout2, align 4, !dbg !24 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2542_count);
  llvm_cbe_tmp__567 = (unsigned int )*(&xout2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__567);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = or i32 %%storemerge12, 1, !dbg !24 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2543_count);
  llvm_cbe_tmp__568 = (unsigned int )llvm_cbe_storemerge12 | 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__568);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = sext i32 %%23 to i64, !dbg !24 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2544_count);
  llvm_cbe_tmp__569 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__568);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__569);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds i32* %%result, i64 %%24, !dbg !24 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2545_count);
  llvm_cbe_tmp__570 = (signed int *)(&llvm_cbe_result[(((signed long long )llvm_cbe_tmp__569))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__569));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%22, i32* %%25, align 4, !dbg !24 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2546_count);
  *llvm_cbe_tmp__570 = llvm_cbe_tmp__567;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__567);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = add nsw i32 %%storemerge12, 2, !dbg !24 for 0x%llxth hint within @adpcm_main  --> \n", ++aesl_llvm_cbe_2547_count);
  llvm_cbe_tmp__571 = (unsigned int )((unsigned int )(llvm_cbe_storemerge12&4294967295ull)) + ((unsigned int )(2u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__571&4294967295ull)));
  if ((((signed int )llvm_cbe_tmp__571) < ((signed int )8000u))) {
    llvm_cbe_storemerge12__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__571;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  } else {
    goto llvm_cbe_tmp__573;
  }

  } while (1); /* end of syntactic loop '.preheader' */
llvm_cbe_tmp__573:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @adpcm_main}\n");
  return;
}


void adpcm_main_hw_stub(signed int *llvm_cbe_input_samples, signed int *llvm_cbe_compressed, signed int *llvm_cbe_result) {
  static  unsigned long long aesl_llvm_cbe_2562_count = 0;
  static  unsigned long long aesl_llvm_cbe_2563_count = 0;
  static  unsigned long long aesl_llvm_cbe_2564_count = 0;
  static  unsigned long long aesl_llvm_cbe_2565_count = 0;
  static  unsigned long long aesl_llvm_cbe_2566_count = 0;
  static  unsigned long long aesl_llvm_cbe_2567_count = 0;
  static  unsigned long long aesl_llvm_cbe_2568_count = 0;
  static  unsigned long long aesl_llvm_cbe_2569_count = 0;
const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @adpcm_main_hw_stub\n");
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @adpcm_main(i32* %%input_samples, i32* %%compressed, i32* %%result), !dbg !23 for 0x%llxth hint within @adpcm_main_hw_stub  --> \n", ++aesl_llvm_cbe_2568_count);
   /*tail*/ adpcm_main((signed int *)llvm_cbe_input_samples, (signed int *)llvm_cbe_compressed, (signed int *)llvm_cbe_result);
if (AESL_DEBUG_TRACE) {
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @adpcm_main_hw_stub}\n");
  return;
}


void apatb_adpcm_main_sw(signed int *llvm_cbe_input_samples, signed int *llvm_cbe_compressed, signed int *llvm_cbe_result) {
  static  unsigned long long aesl_llvm_cbe_2570_count = 0;
  static  unsigned long long aesl_llvm_cbe_2571_count = 0;
  static  unsigned long long aesl_llvm_cbe_2572_count = 0;
  static  unsigned long long aesl_llvm_cbe_2573_count = 0;
  static  unsigned long long aesl_llvm_cbe_2574_count = 0;
  static  unsigned long long aesl_llvm_cbe_2575_count = 0;
  static  unsigned long long aesl_llvm_cbe_2576_count = 0;
  static  unsigned long long aesl_llvm_cbe_2577_count = 0;
  static  unsigned long long aesl_llvm_cbe_2578_count = 0;
const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @apatb_adpcm_main_sw\n");
if (AESL_DEBUG_TRACE)
printf("\n  tail call void (...)* @refine_signal_handler() nounwind, !dbg !23 for 0x%llxth hint within @apatb_adpcm_main_sw  --> \n", ++aesl_llvm_cbe_2576_count);
   /*tail*/ refine_signal_handler();
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @apatb_adpcm_main_ir(i32* %%input_samples, i32* %%compressed, i32* %%result) nounwind, !dbg !22 for 0x%llxth hint within @apatb_adpcm_main_sw  --> \n", ++aesl_llvm_cbe_2577_count);
   /*tail*/ apatb_adpcm_main_ir((signed int *)llvm_cbe_input_samples, (signed int *)llvm_cbe_compressed, (signed int *)llvm_cbe_result);
if (AESL_DEBUG_TRACE) {
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @apatb_adpcm_main_sw}\n");
  return;
}

