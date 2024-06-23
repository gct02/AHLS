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
extern signed int zigzag_index[64];
extern unsigned int i_marker;
extern signed int out_unread_marker[10];
extern unsigned int out_length_get_sof;
extern unsigned int out_data_precision_get_sof;
extern unsigned int out_p_jinfo_image_height_get_sof;
extern unsigned int out_p_jinfo_image_width_get_sof;
extern unsigned int out_p_jinfo_num_components_get_sof;
extern signed int out_index_get_sof[3];
extern signed int out_id_get_sof[3];
extern signed int out_h_samp_factor_get_sof[3];
extern signed int out_v_samp_factor_get_sof[3];
extern signed int out_quant_tbl_no_get_sof[3];
extern unsigned int i_get_sos;
extern unsigned int out_length_get_sos;
extern unsigned int out_num_comp_get_sos;
extern signed int out_comp_id_get_sos[3];
extern signed int out_dc_tbl_no_get_sos[3];
extern signed int out_ac_tbl_no_get_sos[3];
extern unsigned int i_get_dht;
extern signed int out_length_get_dht[4];
extern signed int out_index_get_dht[4];
extern signed int out_count_get_dht[4];
extern unsigned int i_get_dqt;
extern signed int out_length_get_dqt[2];
extern signed int out_prec_get_dht[2];
extern signed int out_num_get_dht[2];
extern signed int izigzag_index[64];
extern unsigned short p_jinfo_image_width;
extern unsigned short p_jinfo_image_height;
extern unsigned int p_jinfo_MCUWidth;
extern signed int rgb_buf[4][3][64];
extern signed int bit_set_mask[32];
extern signed int lmask[32];
extern  char p_jinfo_comps_info_dc_tbl_no[3];
extern signed int p_jinfo_dc_xhuff_tbl_huffval[2][257];
extern signed int p_jinfo_dc_dhuff_tbl_ml[2];
extern signed int p_jinfo_dc_dhuff_tbl_maxcode[2][36];
extern signed int p_jinfo_dc_dhuff_tbl_mincode[2][36];
extern signed int p_jinfo_dc_dhuff_tbl_valptr[2][36];
extern signed int p_jinfo_ac_xhuff_tbl_huffval[2][257];
extern signed int p_jinfo_ac_dhuff_tbl_ml[2];
extern signed int p_jinfo_ac_dhuff_tbl_maxcode[2][36];
extern signed int p_jinfo_ac_dhuff_tbl_mincode[2][36];
extern signed int p_jinfo_ac_dhuff_tbl_valptr[2][36];
extern  char p_jinfo_comps_info_quant_tbl_no[3];
extern signed int p_jinfo_quant_tbl_quantval[4][64];
extern unsigned char p_jinfo_jpeg_data;
extern unsigned char CurHuffReadBuf;
extern unsigned int p_jinfo_smp_fact;
extern unsigned int p_jinfo_NumMCU;
extern unsigned char p_jinfo_data_precision;
extern unsigned char p_jinfo_num_components;
extern  char p_jinfo_comps_info_index[3];
extern  char p_jinfo_comps_info_id[3];
extern  char p_jinfo_comps_info_h_samp_factor[3];
extern  char p_jinfo_comps_info_v_samp_factor[3];
extern  char p_jinfo_comps_info_ac_tbl_no[3];
extern signed int p_jinfo_ac_xhuff_tbl_bits[2][36];
extern signed int p_jinfo_dc_xhuff_tbl_bits[2][36];
extern unsigned int p_jinfo_MCUHeight;

/* Function Declarations */
double fmod(double, double);
float fmodf(float, float);
long double fmodl(long double, long double);
void ChenIDct(signed int *llvm_cbe_x, signed int *llvm_cbe_y);
void IZigzagMatrix(signed int *llvm_cbe_imatrix, signed int *llvm_cbe_omatrix);
void IQuantize(signed int *llvm_cbe_matrix, signed int *llvm_cbe_qmatrix);
void PostshiftIDctMatrix(signed int *llvm_cbe_matrix, signed int llvm_cbe_shift);
void BoundIDctMatrix(signed int *llvm_cbe_matrix, signed int llvm_cbe_Bound);
void WriteOneBlock(signed int *llvm_cbe_store,  char *llvm_cbe_out_buf, signed int llvm_cbe_width, signed int llvm_cbe_height, signed int llvm_cbe_voffs, signed int llvm_cbe_hoffs);
void WriteBlock(signed int *llvm_cbe_store, signed int *llvm_cbe_p_out_vpos, signed int *llvm_cbe_p_out_hpos,  char *llvm_cbe_p_out_buf);
void Write4Blocks(signed int *llvm_cbe_store1, signed int *llvm_cbe_store2, signed int *llvm_cbe_store3, signed int *llvm_cbe_store4, signed int *llvm_cbe_p_out_vpos, signed int *llvm_cbe_p_out_hpos,  char *llvm_cbe_p_out_buf);
void YuvToRgb(signed int llvm_cbe_p, signed int *llvm_cbe_y_buf, signed int *llvm_cbe_u_buf, signed int *llvm_cbe_v_buf);
signed int buf_getb(void);
signed int buf_getv(signed int llvm_cbe_n);
signed int huff_make_dhuff_tb(signed int *llvm_cbe_p_xhtbl_bits, signed int *llvm_cbe_p_dhtbl_maxcode, signed int *llvm_cbe_p_dhtbl_mincode, signed int *llvm_cbe_p_dhtbl_valptr);
signed int DecodeHuffman(signed int *llvm_cbe_Xhuff_huffval, signed int llvm_cbe_Dhuff_ml, signed int *llvm_cbe_Dhuff_maxcode, signed int *llvm_cbe_Dhuff_mincode, signed int *llvm_cbe_Dhuff_valptr);
void DecodeHuffMCU(signed int *llvm_cbe_out_buf, signed int llvm_cbe_num_cmp);
void decode_block(signed int llvm_cbe_comp_no, signed int *llvm_cbe_out_buf, signed int *llvm_cbe_HuffBuff);
void decode(signed int *llvm_cbe_out_data_image_width, signed int *llvm_cbe_out_data_image_height, signed int *llvm_cbe_out_data_comp_vpos, signed int *llvm_cbe_out_data_comp_hpos,  char (*llvm_cbe_outputVector)[16384]);
signed int read_byte(void);
signed short read_word(void);
signed int read_dword(void);
signed int first_marker(void);
signed int next_marker(void);
void get_sof(void);
void get_sos(void);
void get_dht(void);
void get_dqt(void);
void read_markers( char *llvm_cbe_buf);
void jpeg_init_decompress(void);
void jpeg_decode( char *llvm_cbe_readBuf,  char (*llvm_cbe_outputVector)[16384], signed int llvm_cbe_OutData_image_width, signed int llvm_cbe_OutData_image_height, signed int *llvm_cbe_OutData_comp_vpos, signed int *llvm_cbe_OutData_comp_hpos);
static signed int aesl_internal_pgetc(void);


/* Global Variable Definitions and Initialization */
signed int out_index_get_sof[3] = { 0u, 1u, 2u };
signed int p_jinfo_ac_dhuff_tbl_valptr[2][36] __ATTRIBUTE_WEAK__;
 char p_jinfo_comps_info_quant_tbl_no[3] __ATTRIBUTE_WEAK__;
signed int p_jinfo_quant_tbl_quantval[4][64] __ATTRIBUTE_WEAK__;
signed int p_jinfo_dc_dhuff_tbl_mincode[2][36] __ATTRIBUTE_WEAK__;
signed int p_jinfo_dc_dhuff_tbl_valptr[2][36] __ATTRIBUTE_WEAK__;
signed int p_jinfo_dc_dhuff_tbl_ml[2] __ATTRIBUTE_WEAK__;
signed int p_jinfo_dc_dhuff_tbl_maxcode[2][36] __ATTRIBUTE_WEAK__;
signed int out_comp_id_get_sos[3] = { 1u, 2u, 3u };
signed int lmask[32] = { 1u, 3u, 7u, 15u, 31u, 63u, 127u, 255u, 511u, 1023u, 2047u, 4095u, 8191u, 16383u, 32767u, 65535u, 131071u, 262143u, 524287u, 1048575u, 2097151u, 4194303u, 8388607u, 16777215u, 33554431u, 67108863u, 134217727u, 268435455u, 536870911u, 1073741823u, 2147483647u, 4294967295u };
signed int out_unread_marker[10] = { 216u, 224u, 219u, 219u, 192u, 196u, 196u, 196u, 196u, 218u };
 char p_jinfo_comps_info_dc_tbl_no[3] __ATTRIBUTE_WEAK__;
signed int p_jinfo_dc_xhuff_tbl_huffval[2][257] __ATTRIBUTE_WEAK__;
signed int out_h_samp_factor_get_sof[3] = { 2u, 1u, 1u };
unsigned int out_p_jinfo_num_components_get_sof = 3u;
signed int p_jinfo_ac_dhuff_tbl_ml[2] __ATTRIBUTE_WEAK__;
signed int p_jinfo_ac_dhuff_tbl_maxcode[2][36] __ATTRIBUTE_WEAK__;
signed int p_jinfo_ac_dhuff_tbl_mincode[2][36] __ATTRIBUTE_WEAK__;
unsigned int out_p_jinfo_image_width_get_sof = 90u;
unsigned int i_marker;
signed int out_dc_tbl_no_get_sos[3] = { 0u, 1u, 1u };
signed int out_ac_tbl_no_get_sos[3] = { 0u, 1u, 1u };
unsigned int i_get_dht;
signed int out_length_get_dht[4] = { 29u, 179u, 29u, 179u };
signed int out_index_get_dht[4] = { 0u, 16u, 1u, 17u };
signed int out_count_get_dht[4] = { 12u, 162u, 12u, 162u };
unsigned int i_get_dqt;
signed int out_length_get_dqt[2] = { 65u, 65u };
signed int out_prec_get_dht[2];
signed int out_num_get_dht[2] = { 0u, 1u };
signed int izigzag_index[64] = { 0u, 1u, 8u, 16u, 9u, 2u, 3u, 10u, 17u, 24u, 32u, 25u, 18u, 11u, 4u, 5u, 12u, 19u, 26u, 33u, 40u, 48u, 41u, 34u, 27u, 20u, 13u, 6u, 7u, 14u, 21u, 28u, 35u, 42u, 49u, 56u, 57u, 50u, 43u, 36u, 29u, 22u, 15u, 23u, 30u, 37u, 44u, 51u, 58u, 59u, 52u, 45u, 38u, 31u, 39u, 46u, 53u, 60u, 61u, 54u, 47u, 55u, 62u, 63u };
unsigned short p_jinfo_image_width __ATTRIBUTE_WEAK__;
unsigned short p_jinfo_image_height __ATTRIBUTE_WEAK__;
unsigned int p_jinfo_MCUWidth __ATTRIBUTE_WEAK__;
signed int rgb_buf[4][3][64] __ATTRIBUTE_WEAK__;
signed int bit_set_mask[32] = { 1u, 2u, 4u, 8u, 16u, 32u, 64u, 128u, 256u, 512u, 1024u, 2048u, 4096u, 8192u, 16384u, 32768u, 65536u, 131072u, 262144u, 524288u, 1048576u, 2097152u, 4194304u, 8388608u, 16777216u, 33554432u, 67108864u, 134217728u, 268435456u, 536870912u, 1073741824u, 2147483648u };
unsigned char p_jinfo_jpeg_data __ATTRIBUTE_WEAK__;
unsigned char CurHuffReadBuf __ATTRIBUTE_WEAK__;
unsigned int p_jinfo_smp_fact __ATTRIBUTE_WEAK__;
unsigned int p_jinfo_NumMCU __ATTRIBUTE_WEAK__;
static unsigned char aesl_internal_ReadBuf;
unsigned char p_jinfo_data_precision __ATTRIBUTE_WEAK__;
unsigned char p_jinfo_num_components __ATTRIBUTE_WEAK__;
 char p_jinfo_comps_info_index[3] __ATTRIBUTE_WEAK__;
 char p_jinfo_comps_info_id[3] __ATTRIBUTE_WEAK__;
 char p_jinfo_comps_info_h_samp_factor[3] __ATTRIBUTE_WEAK__;
 char p_jinfo_comps_info_v_samp_factor[3] __ATTRIBUTE_WEAK__;
 char p_jinfo_comps_info_ac_tbl_no[3] __ATTRIBUTE_WEAK__;
signed int p_jinfo_ac_xhuff_tbl_bits[2][36] __ATTRIBUTE_WEAK__;
signed int p_jinfo_dc_xhuff_tbl_bits[2][36] __ATTRIBUTE_WEAK__;
unsigned int p_jinfo_MCUHeight __ATTRIBUTE_WEAK__;
static signed int aesl_internal_extend_mask[20] = { 4294967294u, 4294967292u, 4294967288u, 4294967280u, 4294967264u, 4294967232u, 4294967168u, 4294967040u, 4294966784u, 4294966272u, 4294965248u, 4294963200u, 4294959104u, 4294950912u, 4294934528u, 4294901760u, 4294836224u, 4294705152u, 4294443008u, 4293918720u };
signed int p_jinfo_ac_xhuff_tbl_huffval[2][257] __ATTRIBUTE_WEAK__;
unsigned int out_p_jinfo_image_height_get_sof = 59u;
unsigned int out_length_get_sof = 17u;
signed int zigzag_index[64] = { 0u, 1u, 5u, 6u, 14u, 15u, 27u, 28u, 2u, 4u, 7u, 13u, 16u, 26u, 29u, 42u, 3u, 8u, 12u, 17u, 25u, 30u, 41u, 43u, 9u, 11u, 18u, 24u, 31u, 40u, 44u, 53u, 10u, 19u, 23u, 32u, 39u, 45u, 52u, 54u, 20u, 22u, 33u, 38u, 46u, 51u, 55u, 60u, 21u, 34u, 37u, 47u, 50u, 56u, 59u, 61u, 35u, 36u, 48u, 49u, 57u, 58u, 62u, 63u };
signed int out_id_get_sof[3] = { 1u, 2u, 3u };
unsigned int out_length_get_sos = 12u;
unsigned int out_num_comp_get_sos = 3u;
signed int out_quant_tbl_no_get_sof[3] = { 0u, 1u, 1u };
unsigned int i_get_sos;
signed int out_v_samp_factor_get_sof[3] = { 2u, 1u, 1u };
unsigned int out_data_precision_get_sof = 8u;
static unsigned int aesl_internal_read_position = 4294967295u;
static unsigned int aesl_internal_current_read_byte;


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

void ChenIDct(signed int *llvm_cbe_x, signed int *llvm_cbe_y) {
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
  static  unsigned long long aesl_llvm_cbe_18_count = 0;
  static  unsigned long long aesl_llvm_cbe_19_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge40_count = 0;
  unsigned int llvm_cbe_storemerge40;
  unsigned int llvm_cbe_storemerge40__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_20_count = 0;
  unsigned long long llvm_cbe_tmp__1;
  static  unsigned long long aesl_llvm_cbe_21_count = 0;
  signed int *llvm_cbe_tmp__2;
  static  unsigned long long aesl_llvm_cbe_22_count = 0;
  static  unsigned long long aesl_llvm_cbe_23_count = 0;
  static  unsigned long long aesl_llvm_cbe_24_count = 0;
  static  unsigned long long aesl_llvm_cbe_25_count = 0;
  static  unsigned long long aesl_llvm_cbe_26_count = 0;
  static  unsigned long long aesl_llvm_cbe_27_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_67_count = 0;
  static  unsigned long long aesl_llvm_cbe_68_count = 0;
  static  unsigned long long aesl_llvm_cbe_69_count = 0;
  static  unsigned long long aesl_llvm_cbe_70_count = 0;
  static  unsigned long long aesl_llvm_cbe_71_count = 0;
  static  unsigned long long aesl_llvm_cbe_72_count = 0;
  static  unsigned long long aesl_llvm_cbe_73_count = 0;
  static  unsigned long long aesl_llvm_cbe_74_count = 0;
  unsigned int llvm_cbe_tmp__3;
  static  unsigned long long aesl_llvm_cbe_75_count = 0;
  unsigned int llvm_cbe_tmp__4;
  static  unsigned long long aesl_llvm_cbe_76_count = 0;
  static  unsigned long long aesl_llvm_cbe_77_count = 0;
  static  unsigned long long aesl_llvm_cbe_78_count = 0;
  static  unsigned long long aesl_llvm_cbe_79_count = 0;
  static  unsigned long long aesl_llvm_cbe_80_count = 0;
  static  unsigned long long aesl_llvm_cbe_81_count = 0;
  static  unsigned long long aesl_llvm_cbe_82_count = 0;
  static  unsigned long long aesl_llvm_cbe_83_count = 0;
  static  unsigned long long aesl_llvm_cbe_84_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum13_count = 0;
  unsigned long long llvm_cbe__2e_sum13;
  static  unsigned long long aesl_llvm_cbe_85_count = 0;
  signed int *llvm_cbe_tmp__5;
  static  unsigned long long aesl_llvm_cbe_86_count = 0;
  static  unsigned long long aesl_llvm_cbe_87_count = 0;
  static  unsigned long long aesl_llvm_cbe_88_count = 0;
  static  unsigned long long aesl_llvm_cbe_89_count = 0;
  static  unsigned long long aesl_llvm_cbe_90_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_104_count = 0;
  static  unsigned long long aesl_llvm_cbe_105_count = 0;
  static  unsigned long long aesl_llvm_cbe_106_count = 0;
  static  unsigned long long aesl_llvm_cbe_107_count = 0;
  static  unsigned long long aesl_llvm_cbe_108_count = 0;
  static  unsigned long long aesl_llvm_cbe_109_count = 0;
  static  unsigned long long aesl_llvm_cbe_110_count = 0;
  static  unsigned long long aesl_llvm_cbe_111_count = 0;
  static  unsigned long long aesl_llvm_cbe_112_count = 0;
  static  unsigned long long aesl_llvm_cbe_113_count = 0;
  static  unsigned long long aesl_llvm_cbe_114_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_129_count = 0;
  static  unsigned long long aesl_llvm_cbe_130_count = 0;
  static  unsigned long long aesl_llvm_cbe_131_count = 0;
  static  unsigned long long aesl_llvm_cbe_132_count = 0;
  static  unsigned long long aesl_llvm_cbe_133_count = 0;
  static  unsigned long long aesl_llvm_cbe_134_count = 0;
  static  unsigned long long aesl_llvm_cbe_135_count = 0;
  static  unsigned long long aesl_llvm_cbe_136_count = 0;
  static  unsigned long long aesl_llvm_cbe_137_count = 0;
  static  unsigned long long aesl_llvm_cbe_138_count = 0;
  unsigned int llvm_cbe_tmp__6;
  static  unsigned long long aesl_llvm_cbe_139_count = 0;
  unsigned int llvm_cbe_tmp__7;
  static  unsigned long long aesl_llvm_cbe_140_count = 0;
  static  unsigned long long aesl_llvm_cbe_141_count = 0;
  static  unsigned long long aesl_llvm_cbe_142_count = 0;
  static  unsigned long long aesl_llvm_cbe_143_count = 0;
  static  unsigned long long aesl_llvm_cbe_144_count = 0;
  static  unsigned long long aesl_llvm_cbe_145_count = 0;
  static  unsigned long long aesl_llvm_cbe_146_count = 0;
  static  unsigned long long aesl_llvm_cbe_147_count = 0;
  static  unsigned long long aesl_llvm_cbe_148_count = 0;
  static  unsigned long long aesl_llvm_cbe_149_count = 0;
  static  unsigned long long aesl_llvm_cbe_150_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum14_count = 0;
  unsigned long long llvm_cbe__2e_sum14;
  static  unsigned long long aesl_llvm_cbe_151_count = 0;
  signed int *llvm_cbe_tmp__8;
  static  unsigned long long aesl_llvm_cbe_152_count = 0;
  static  unsigned long long aesl_llvm_cbe_153_count = 0;
  static  unsigned long long aesl_llvm_cbe_154_count = 0;
  static  unsigned long long aesl_llvm_cbe_155_count = 0;
  static  unsigned long long aesl_llvm_cbe_156_count = 0;
  static  unsigned long long aesl_llvm_cbe_157_count = 0;
  static  unsigned long long aesl_llvm_cbe_158_count = 0;
  static  unsigned long long aesl_llvm_cbe_159_count = 0;
  static  unsigned long long aesl_llvm_cbe_160_count = 0;
  static  unsigned long long aesl_llvm_cbe_161_count = 0;
  static  unsigned long long aesl_llvm_cbe_162_count = 0;
  static  unsigned long long aesl_llvm_cbe_163_count = 0;
  static  unsigned long long aesl_llvm_cbe_164_count = 0;
  static  unsigned long long aesl_llvm_cbe_165_count = 0;
  static  unsigned long long aesl_llvm_cbe_166_count = 0;
  static  unsigned long long aesl_llvm_cbe_167_count = 0;
  static  unsigned long long aesl_llvm_cbe_168_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_181_count = 0;
  static  unsigned long long aesl_llvm_cbe_182_count = 0;
  static  unsigned long long aesl_llvm_cbe_183_count = 0;
  static  unsigned long long aesl_llvm_cbe_184_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_198_count = 0;
  static  unsigned long long aesl_llvm_cbe_199_count = 0;
  static  unsigned long long aesl_llvm_cbe_200_count = 0;
  static  unsigned long long aesl_llvm_cbe_201_count = 0;
  static  unsigned long long aesl_llvm_cbe_202_count = 0;
  static  unsigned long long aesl_llvm_cbe_203_count = 0;
  static  unsigned long long aesl_llvm_cbe_204_count = 0;
  unsigned int llvm_cbe_tmp__9;
  static  unsigned long long aesl_llvm_cbe_205_count = 0;
  unsigned int llvm_cbe_tmp__10;
  static  unsigned long long aesl_llvm_cbe_206_count = 0;
  static  unsigned long long aesl_llvm_cbe_207_count = 0;
  static  unsigned long long aesl_llvm_cbe_208_count = 0;
  static  unsigned long long aesl_llvm_cbe_209_count = 0;
  static  unsigned long long aesl_llvm_cbe_210_count = 0;
  static  unsigned long long aesl_llvm_cbe_211_count = 0;
  static  unsigned long long aesl_llvm_cbe_212_count = 0;
  static  unsigned long long aesl_llvm_cbe_213_count = 0;
  static  unsigned long long aesl_llvm_cbe_214_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum15_count = 0;
  unsigned long long llvm_cbe__2e_sum15;
  static  unsigned long long aesl_llvm_cbe_215_count = 0;
  signed int *llvm_cbe_tmp__11;
  static  unsigned long long aesl_llvm_cbe_216_count = 0;
  static  unsigned long long aesl_llvm_cbe_217_count = 0;
  static  unsigned long long aesl_llvm_cbe_218_count = 0;
  static  unsigned long long aesl_llvm_cbe_219_count = 0;
  static  unsigned long long aesl_llvm_cbe_220_count = 0;
  static  unsigned long long aesl_llvm_cbe_221_count = 0;
  static  unsigned long long aesl_llvm_cbe_222_count = 0;
  static  unsigned long long aesl_llvm_cbe_223_count = 0;
  static  unsigned long long aesl_llvm_cbe_224_count = 0;
  static  unsigned long long aesl_llvm_cbe_225_count = 0;
  static  unsigned long long aesl_llvm_cbe_226_count = 0;
  static  unsigned long long aesl_llvm_cbe_227_count = 0;
  static  unsigned long long aesl_llvm_cbe_228_count = 0;
  static  unsigned long long aesl_llvm_cbe_229_count = 0;
  static  unsigned long long aesl_llvm_cbe_230_count = 0;
  static  unsigned long long aesl_llvm_cbe_231_count = 0;
  static  unsigned long long aesl_llvm_cbe_232_count = 0;
  static  unsigned long long aesl_llvm_cbe_233_count = 0;
  static  unsigned long long aesl_llvm_cbe_234_count = 0;
  static  unsigned long long aesl_llvm_cbe_235_count = 0;
  static  unsigned long long aesl_llvm_cbe_236_count = 0;
  static  unsigned long long aesl_llvm_cbe_237_count = 0;
  static  unsigned long long aesl_llvm_cbe_238_count = 0;
  static  unsigned long long aesl_llvm_cbe_239_count = 0;
  static  unsigned long long aesl_llvm_cbe_240_count = 0;
  static  unsigned long long aesl_llvm_cbe_241_count = 0;
  static  unsigned long long aesl_llvm_cbe_242_count = 0;
  static  unsigned long long aesl_llvm_cbe_243_count = 0;
  static  unsigned long long aesl_llvm_cbe_244_count = 0;
  static  unsigned long long aesl_llvm_cbe_245_count = 0;
  static  unsigned long long aesl_llvm_cbe_246_count = 0;
  static  unsigned long long aesl_llvm_cbe_247_count = 0;
  static  unsigned long long aesl_llvm_cbe_248_count = 0;
  static  unsigned long long aesl_llvm_cbe_249_count = 0;
  static  unsigned long long aesl_llvm_cbe_250_count = 0;
  static  unsigned long long aesl_llvm_cbe_251_count = 0;
  static  unsigned long long aesl_llvm_cbe_252_count = 0;
  static  unsigned long long aesl_llvm_cbe_253_count = 0;
  static  unsigned long long aesl_llvm_cbe_254_count = 0;
  static  unsigned long long aesl_llvm_cbe_255_count = 0;
  static  unsigned long long aesl_llvm_cbe_256_count = 0;
  static  unsigned long long aesl_llvm_cbe_257_count = 0;
  static  unsigned long long aesl_llvm_cbe_258_count = 0;
  static  unsigned long long aesl_llvm_cbe_259_count = 0;
  static  unsigned long long aesl_llvm_cbe_260_count = 0;
  static  unsigned long long aesl_llvm_cbe_261_count = 0;
  static  unsigned long long aesl_llvm_cbe_262_count = 0;
  static  unsigned long long aesl_llvm_cbe_263_count = 0;
  static  unsigned long long aesl_llvm_cbe_264_count = 0;
  static  unsigned long long aesl_llvm_cbe_265_count = 0;
  static  unsigned long long aesl_llvm_cbe_266_count = 0;
  static  unsigned long long aesl_llvm_cbe_267_count = 0;
  static  unsigned long long aesl_llvm_cbe_268_count = 0;
  unsigned int llvm_cbe_tmp__12;
  static  unsigned long long aesl_llvm_cbe_269_count = 0;
  unsigned int llvm_cbe_tmp__13;
  static  unsigned long long aesl_llvm_cbe_270_count = 0;
  static  unsigned long long aesl_llvm_cbe_271_count = 0;
  static  unsigned long long aesl_llvm_cbe_272_count = 0;
  static  unsigned long long aesl_llvm_cbe_273_count = 0;
  static  unsigned long long aesl_llvm_cbe_274_count = 0;
  static  unsigned long long aesl_llvm_cbe_275_count = 0;
  static  unsigned long long aesl_llvm_cbe_276_count = 0;
  static  unsigned long long aesl_llvm_cbe_277_count = 0;
  static  unsigned long long aesl_llvm_cbe_278_count = 0;
  static  unsigned long long aesl_llvm_cbe_279_count = 0;
  static  unsigned long long aesl_llvm_cbe_280_count = 0;
  static  unsigned long long aesl_llvm_cbe_281_count = 0;
  static  unsigned long long aesl_llvm_cbe_282_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum16_count = 0;
  unsigned long long llvm_cbe__2e_sum16;
  static  unsigned long long aesl_llvm_cbe_283_count = 0;
  signed int *llvm_cbe_tmp__14;
  static  unsigned long long aesl_llvm_cbe_284_count = 0;
  static  unsigned long long aesl_llvm_cbe_285_count = 0;
  static  unsigned long long aesl_llvm_cbe_286_count = 0;
  static  unsigned long long aesl_llvm_cbe_287_count = 0;
  static  unsigned long long aesl_llvm_cbe_288_count = 0;
  static  unsigned long long aesl_llvm_cbe_289_count = 0;
  static  unsigned long long aesl_llvm_cbe_290_count = 0;
  static  unsigned long long aesl_llvm_cbe_291_count = 0;
  static  unsigned long long aesl_llvm_cbe_292_count = 0;
  static  unsigned long long aesl_llvm_cbe_293_count = 0;
  static  unsigned long long aesl_llvm_cbe_294_count = 0;
  static  unsigned long long aesl_llvm_cbe_295_count = 0;
  static  unsigned long long aesl_llvm_cbe_296_count = 0;
  static  unsigned long long aesl_llvm_cbe_297_count = 0;
  static  unsigned long long aesl_llvm_cbe_298_count = 0;
  static  unsigned long long aesl_llvm_cbe_299_count = 0;
  static  unsigned long long aesl_llvm_cbe_300_count = 0;
  static  unsigned long long aesl_llvm_cbe_301_count = 0;
  static  unsigned long long aesl_llvm_cbe_302_count = 0;
  static  unsigned long long aesl_llvm_cbe_303_count = 0;
  static  unsigned long long aesl_llvm_cbe_304_count = 0;
  static  unsigned long long aesl_llvm_cbe_305_count = 0;
  static  unsigned long long aesl_llvm_cbe_306_count = 0;
  static  unsigned long long aesl_llvm_cbe_307_count = 0;
  static  unsigned long long aesl_llvm_cbe_308_count = 0;
  static  unsigned long long aesl_llvm_cbe_309_count = 0;
  static  unsigned long long aesl_llvm_cbe_310_count = 0;
  static  unsigned long long aesl_llvm_cbe_311_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_325_count = 0;
  static  unsigned long long aesl_llvm_cbe_326_count = 0;
  static  unsigned long long aesl_llvm_cbe_327_count = 0;
  static  unsigned long long aesl_llvm_cbe_328_count = 0;
  static  unsigned long long aesl_llvm_cbe_329_count = 0;
  static  unsigned long long aesl_llvm_cbe_330_count = 0;
  static  unsigned long long aesl_llvm_cbe_331_count = 0;
  static  unsigned long long aesl_llvm_cbe_332_count = 0;
  static  unsigned long long aesl_llvm_cbe_333_count = 0;
  static  unsigned long long aesl_llvm_cbe_334_count = 0;
  static  unsigned long long aesl_llvm_cbe_335_count = 0;
  static  unsigned long long aesl_llvm_cbe_336_count = 0;
  unsigned int llvm_cbe_tmp__15;
  static  unsigned long long aesl_llvm_cbe_337_count = 0;
  unsigned int llvm_cbe_tmp__16;
  static  unsigned long long aesl_llvm_cbe_338_count = 0;
  static  unsigned long long aesl_llvm_cbe_339_count = 0;
  static  unsigned long long aesl_llvm_cbe_340_count = 0;
  static  unsigned long long aesl_llvm_cbe_341_count = 0;
  static  unsigned long long aesl_llvm_cbe_342_count = 0;
  static  unsigned long long aesl_llvm_cbe_343_count = 0;
  static  unsigned long long aesl_llvm_cbe_344_count = 0;
  static  unsigned long long aesl_llvm_cbe_345_count = 0;
  static  unsigned long long aesl_llvm_cbe_346_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum17_count = 0;
  unsigned long long llvm_cbe__2e_sum17;
  static  unsigned long long aesl_llvm_cbe_347_count = 0;
  signed int *llvm_cbe_tmp__17;
  static  unsigned long long aesl_llvm_cbe_348_count = 0;
  static  unsigned long long aesl_llvm_cbe_349_count = 0;
  static  unsigned long long aesl_llvm_cbe_350_count = 0;
  static  unsigned long long aesl_llvm_cbe_351_count = 0;
  static  unsigned long long aesl_llvm_cbe_352_count = 0;
  static  unsigned long long aesl_llvm_cbe_353_count = 0;
  static  unsigned long long aesl_llvm_cbe_354_count = 0;
  static  unsigned long long aesl_llvm_cbe_355_count = 0;
  static  unsigned long long aesl_llvm_cbe_356_count = 0;
  static  unsigned long long aesl_llvm_cbe_357_count = 0;
  static  unsigned long long aesl_llvm_cbe_358_count = 0;
  static  unsigned long long aesl_llvm_cbe_359_count = 0;
  static  unsigned long long aesl_llvm_cbe_360_count = 0;
  static  unsigned long long aesl_llvm_cbe_361_count = 0;
  static  unsigned long long aesl_llvm_cbe_362_count = 0;
  static  unsigned long long aesl_llvm_cbe_363_count = 0;
  static  unsigned long long aesl_llvm_cbe_364_count = 0;
  static  unsigned long long aesl_llvm_cbe_365_count = 0;
  static  unsigned long long aesl_llvm_cbe_366_count = 0;
  static  unsigned long long aesl_llvm_cbe_367_count = 0;
  static  unsigned long long aesl_llvm_cbe_368_count = 0;
  static  unsigned long long aesl_llvm_cbe_369_count = 0;
  static  unsigned long long aesl_llvm_cbe_370_count = 0;
  static  unsigned long long aesl_llvm_cbe_371_count = 0;
  static  unsigned long long aesl_llvm_cbe_372_count = 0;
  static  unsigned long long aesl_llvm_cbe_373_count = 0;
  static  unsigned long long aesl_llvm_cbe_374_count = 0;
  static  unsigned long long aesl_llvm_cbe_375_count = 0;
  static  unsigned long long aesl_llvm_cbe_376_count = 0;
  static  unsigned long long aesl_llvm_cbe_377_count = 0;
  static  unsigned long long aesl_llvm_cbe_378_count = 0;
  static  unsigned long long aesl_llvm_cbe_379_count = 0;
  static  unsigned long long aesl_llvm_cbe_380_count = 0;
  static  unsigned long long aesl_llvm_cbe_381_count = 0;
  static  unsigned long long aesl_llvm_cbe_382_count = 0;
  static  unsigned long long aesl_llvm_cbe_383_count = 0;
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
  unsigned int llvm_cbe_tmp__18;
  static  unsigned long long aesl_llvm_cbe_401_count = 0;
  unsigned int llvm_cbe_tmp__19;
  static  unsigned long long aesl_llvm_cbe_402_count = 0;
  static  unsigned long long aesl_llvm_cbe_403_count = 0;
  static  unsigned long long aesl_llvm_cbe_404_count = 0;
  static  unsigned long long aesl_llvm_cbe_405_count = 0;
  static  unsigned long long aesl_llvm_cbe_406_count = 0;
  static  unsigned long long aesl_llvm_cbe_407_count = 0;
  static  unsigned long long aesl_llvm_cbe_408_count = 0;
  static  unsigned long long aesl_llvm_cbe_409_count = 0;
  static  unsigned long long aesl_llvm_cbe_410_count = 0;
  static  unsigned long long aesl_llvm_cbe_411_count = 0;
  static  unsigned long long aesl_llvm_cbe_412_count = 0;
  static  unsigned long long aesl_llvm_cbe_413_count = 0;
  static  unsigned long long aesl_llvm_cbe_414_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum18_count = 0;
  unsigned long long llvm_cbe__2e_sum18;
  static  unsigned long long aesl_llvm_cbe_415_count = 0;
  signed int *llvm_cbe_tmp__20;
  static  unsigned long long aesl_llvm_cbe_416_count = 0;
  static  unsigned long long aesl_llvm_cbe_417_count = 0;
  static  unsigned long long aesl_llvm_cbe_418_count = 0;
  static  unsigned long long aesl_llvm_cbe_419_count = 0;
  static  unsigned long long aesl_llvm_cbe_420_count = 0;
  static  unsigned long long aesl_llvm_cbe_421_count = 0;
  static  unsigned long long aesl_llvm_cbe_422_count = 0;
  static  unsigned long long aesl_llvm_cbe_423_count = 0;
  static  unsigned long long aesl_llvm_cbe_424_count = 0;
  static  unsigned long long aesl_llvm_cbe_425_count = 0;
  static  unsigned long long aesl_llvm_cbe_426_count = 0;
  static  unsigned long long aesl_llvm_cbe_427_count = 0;
  static  unsigned long long aesl_llvm_cbe_428_count = 0;
  static  unsigned long long aesl_llvm_cbe_429_count = 0;
  static  unsigned long long aesl_llvm_cbe_430_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_468_count = 0;
  unsigned int llvm_cbe_tmp__21;
  static  unsigned long long aesl_llvm_cbe_469_count = 0;
  unsigned int llvm_cbe_tmp__22;
  static  unsigned long long aesl_llvm_cbe_470_count = 0;
  static  unsigned long long aesl_llvm_cbe_471_count = 0;
  static  unsigned long long aesl_llvm_cbe_472_count = 0;
  static  unsigned long long aesl_llvm_cbe_473_count = 0;
  static  unsigned long long aesl_llvm_cbe_474_count = 0;
  static  unsigned long long aesl_llvm_cbe_475_count = 0;
  static  unsigned long long aesl_llvm_cbe_476_count = 0;
  static  unsigned long long aesl_llvm_cbe_477_count = 0;
  static  unsigned long long aesl_llvm_cbe_478_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum19_count = 0;
  unsigned long long llvm_cbe__2e_sum19;
  static  unsigned long long aesl_llvm_cbe_479_count = 0;
  signed int *llvm_cbe_tmp__23;
  static  unsigned long long aesl_llvm_cbe_480_count = 0;
  static  unsigned long long aesl_llvm_cbe_481_count = 0;
  static  unsigned long long aesl_llvm_cbe_482_count = 0;
  static  unsigned long long aesl_llvm_cbe_483_count = 0;
  static  unsigned long long aesl_llvm_cbe_484_count = 0;
  static  unsigned long long aesl_llvm_cbe_485_count = 0;
  static  unsigned long long aesl_llvm_cbe_486_count = 0;
  static  unsigned long long aesl_llvm_cbe_487_count = 0;
  static  unsigned long long aesl_llvm_cbe_488_count = 0;
  static  unsigned long long aesl_llvm_cbe_489_count = 0;
  static  unsigned long long aesl_llvm_cbe_490_count = 0;
  static  unsigned long long aesl_llvm_cbe_491_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_509_count = 0;
  static  unsigned long long aesl_llvm_cbe_510_count = 0;
  static  unsigned long long aesl_llvm_cbe_511_count = 0;
  static  unsigned long long aesl_llvm_cbe_512_count = 0;
  static  unsigned long long aesl_llvm_cbe_513_count = 0;
  static  unsigned long long aesl_llvm_cbe_514_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_527_count = 0;
  static  unsigned long long aesl_llvm_cbe_528_count = 0;
  static  unsigned long long aesl_llvm_cbe_529_count = 0;
  static  unsigned long long aesl_llvm_cbe_530_count = 0;
  static  unsigned long long aesl_llvm_cbe_531_count = 0;
  static  unsigned long long aesl_llvm_cbe_532_count = 0;
  unsigned int llvm_cbe_tmp__24;
  static  unsigned long long aesl_llvm_cbe_533_count = 0;
  unsigned int llvm_cbe_tmp__25;
  static  unsigned long long aesl_llvm_cbe_534_count = 0;
  static  unsigned long long aesl_llvm_cbe_535_count = 0;
  static  unsigned long long aesl_llvm_cbe_536_count = 0;
  static  unsigned long long aesl_llvm_cbe_537_count = 0;
  static  unsigned long long aesl_llvm_cbe_538_count = 0;
  static  unsigned long long aesl_llvm_cbe_539_count = 0;
  static  unsigned long long aesl_llvm_cbe_540_count = 0;
  static  unsigned long long aesl_llvm_cbe_541_count = 0;
  static  unsigned long long aesl_llvm_cbe_542_count = 0;
  static  unsigned long long aesl_llvm_cbe_543_count = 0;
  static  unsigned long long aesl_llvm_cbe_544_count = 0;
  static  unsigned long long aesl_llvm_cbe_545_count = 0;
  unsigned long long llvm_cbe_tmp__26;
  static  unsigned long long aesl_llvm_cbe_546_count = 0;
  unsigned long long llvm_cbe_tmp__27;
  static  unsigned long long aesl_llvm_cbe_547_count = 0;
  unsigned long long llvm_cbe_tmp__28;
  static  unsigned long long aesl_llvm_cbe_548_count = 0;
  unsigned long long llvm_cbe_tmp__29;
  static  unsigned long long aesl_llvm_cbe_549_count = 0;
  unsigned long long llvm_cbe_tmp__30;
  static  unsigned long long aesl_llvm_cbe_550_count = 0;
  unsigned long long llvm_cbe_tmp__31;
  static  unsigned long long aesl_llvm_cbe_551_count = 0;
  unsigned int llvm_cbe_tmp__32;
  static  unsigned long long aesl_llvm_cbe_552_count = 0;
  static  unsigned long long aesl_llvm_cbe_553_count = 0;
  static  unsigned long long aesl_llvm_cbe_554_count = 0;
  static  unsigned long long aesl_llvm_cbe_555_count = 0;
  static  unsigned long long aesl_llvm_cbe_556_count = 0;
  static  unsigned long long aesl_llvm_cbe_557_count = 0;
  static  unsigned long long aesl_llvm_cbe_558_count = 0;
  static  unsigned long long aesl_llvm_cbe_559_count = 0;
  static  unsigned long long aesl_llvm_cbe_560_count = 0;
  static  unsigned long long aesl_llvm_cbe_561_count = 0;
  unsigned long long llvm_cbe_tmp__33;
  static  unsigned long long aesl_llvm_cbe_562_count = 0;
  unsigned long long llvm_cbe_tmp__34;
  static  unsigned long long aesl_llvm_cbe_563_count = 0;
  unsigned long long llvm_cbe_tmp__35;
  static  unsigned long long aesl_llvm_cbe_564_count = 0;
  unsigned long long llvm_cbe_tmp__36;
  static  unsigned long long aesl_llvm_cbe_565_count = 0;
  unsigned long long llvm_cbe_tmp__37;
  static  unsigned long long aesl_llvm_cbe_566_count = 0;
  unsigned long long llvm_cbe_tmp__38;
  static  unsigned long long aesl_llvm_cbe_567_count = 0;
  unsigned int llvm_cbe_tmp__39;
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
  unsigned long long llvm_cbe_tmp__40;
  static  unsigned long long aesl_llvm_cbe_578_count = 0;
  unsigned long long llvm_cbe_tmp__41;
  static  unsigned long long aesl_llvm_cbe_579_count = 0;
  unsigned long long llvm_cbe_tmp__42;
  static  unsigned long long aesl_llvm_cbe_580_count = 0;
  unsigned long long llvm_cbe_tmp__43;
  static  unsigned long long aesl_llvm_cbe_581_count = 0;
  unsigned int llvm_cbe_tmp__44;
  static  unsigned long long aesl_llvm_cbe_582_count = 0;
  static  unsigned long long aesl_llvm_cbe_583_count = 0;
  static  unsigned long long aesl_llvm_cbe_584_count = 0;
  static  unsigned long long aesl_llvm_cbe_585_count = 0;
  static  unsigned long long aesl_llvm_cbe_586_count = 0;
  static  unsigned long long aesl_llvm_cbe_587_count = 0;
  static  unsigned long long aesl_llvm_cbe_588_count = 0;
  static  unsigned long long aesl_llvm_cbe_589_count = 0;
  static  unsigned long long aesl_llvm_cbe_590_count = 0;
  static  unsigned long long aesl_llvm_cbe_591_count = 0;
  unsigned long long llvm_cbe_tmp__45;
  static  unsigned long long aesl_llvm_cbe_592_count = 0;
  unsigned long long llvm_cbe_tmp__46;
  static  unsigned long long aesl_llvm_cbe_593_count = 0;
  unsigned long long llvm_cbe_tmp__47;
  static  unsigned long long aesl_llvm_cbe_594_count = 0;
  unsigned long long llvm_cbe_tmp__48;
  static  unsigned long long aesl_llvm_cbe_595_count = 0;
  unsigned int llvm_cbe_tmp__49;
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
  unsigned int llvm_cbe_tmp__50;
  static  unsigned long long aesl_llvm_cbe_606_count = 0;
  unsigned long long llvm_cbe_tmp__51;
  static  unsigned long long aesl_llvm_cbe_607_count = 0;
  unsigned long long llvm_cbe_tmp__52;
  static  unsigned long long aesl_llvm_cbe_608_count = 0;
  unsigned long long llvm_cbe_tmp__53;
  static  unsigned long long aesl_llvm_cbe_609_count = 0;
  unsigned int llvm_cbe_tmp__54;
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
  static  unsigned long long aesl_llvm_cbe_620_count = 0;
  static  unsigned long long aesl_llvm_cbe_621_count = 0;
  unsigned int llvm_cbe_tmp__55;
  static  unsigned long long aesl_llvm_cbe_622_count = 0;
  unsigned long long llvm_cbe_tmp__56;
  static  unsigned long long aesl_llvm_cbe_623_count = 0;
  unsigned long long llvm_cbe_tmp__57;
  static  unsigned long long aesl_llvm_cbe_624_count = 0;
  unsigned long long llvm_cbe_tmp__58;
  static  unsigned long long aesl_llvm_cbe_625_count = 0;
  unsigned int llvm_cbe_tmp__59;
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
  static  unsigned long long aesl_llvm_cbe_637_count = 0;
  static  unsigned long long aesl_llvm_cbe_638_count = 0;
  static  unsigned long long aesl_llvm_cbe_639_count = 0;
  unsigned long long llvm_cbe_tmp__60;
  static  unsigned long long aesl_llvm_cbe_640_count = 0;
  unsigned long long llvm_cbe_tmp__61;
  static  unsigned long long aesl_llvm_cbe_641_count = 0;
  unsigned long long llvm_cbe_tmp__62;
  static  unsigned long long aesl_llvm_cbe_642_count = 0;
  unsigned long long llvm_cbe_tmp__63;
  static  unsigned long long aesl_llvm_cbe_643_count = 0;
  unsigned long long llvm_cbe_tmp__64;
  static  unsigned long long aesl_llvm_cbe_644_count = 0;
  unsigned long long llvm_cbe_tmp__65;
  static  unsigned long long aesl_llvm_cbe_645_count = 0;
  unsigned int llvm_cbe_tmp__66;
  static  unsigned long long aesl_llvm_cbe_646_count = 0;
  static  unsigned long long aesl_llvm_cbe_647_count = 0;
  static  unsigned long long aesl_llvm_cbe_648_count = 0;
  static  unsigned long long aesl_llvm_cbe_649_count = 0;
  static  unsigned long long aesl_llvm_cbe_650_count = 0;
  static  unsigned long long aesl_llvm_cbe_651_count = 0;
  static  unsigned long long aesl_llvm_cbe_652_count = 0;
  static  unsigned long long aesl_llvm_cbe_653_count = 0;
  static  unsigned long long aesl_llvm_cbe_654_count = 0;
  static  unsigned long long aesl_llvm_cbe_655_count = 0;
  static  unsigned long long aesl_llvm_cbe_656_count = 0;
  static  unsigned long long aesl_llvm_cbe_657_count = 0;
  static  unsigned long long aesl_llvm_cbe_658_count = 0;
  static  unsigned long long aesl_llvm_cbe_659_count = 0;
  unsigned long long llvm_cbe_tmp__67;
  static  unsigned long long aesl_llvm_cbe_660_count = 0;
  unsigned long long llvm_cbe_tmp__68;
  static  unsigned long long aesl_llvm_cbe_661_count = 0;
  unsigned long long llvm_cbe_tmp__69;
  static  unsigned long long aesl_llvm_cbe_662_count = 0;
  unsigned long long llvm_cbe_tmp__70;
  static  unsigned long long aesl_llvm_cbe_663_count = 0;
  unsigned int llvm_cbe_tmp__71;
  static  unsigned long long aesl_llvm_cbe_664_count = 0;
  static  unsigned long long aesl_llvm_cbe_665_count = 0;
  static  unsigned long long aesl_llvm_cbe_666_count = 0;
  static  unsigned long long aesl_llvm_cbe_667_count = 0;
  static  unsigned long long aesl_llvm_cbe_668_count = 0;
  static  unsigned long long aesl_llvm_cbe_669_count = 0;
  static  unsigned long long aesl_llvm_cbe_670_count = 0;
  static  unsigned long long aesl_llvm_cbe_671_count = 0;
  static  unsigned long long aesl_llvm_cbe_672_count = 0;
  static  unsigned long long aesl_llvm_cbe_673_count = 0;
  static  unsigned long long aesl_llvm_cbe_674_count = 0;
  static  unsigned long long aesl_llvm_cbe_675_count = 0;
  unsigned int llvm_cbe_tmp__72;
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
  unsigned int llvm_cbe_tmp__73;
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
  unsigned int llvm_cbe_tmp__74;
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
  unsigned int llvm_cbe_tmp__75;
  static  unsigned long long aesl_llvm_cbe_706_count = 0;
  static  unsigned long long aesl_llvm_cbe_707_count = 0;
  static  unsigned long long aesl_llvm_cbe_708_count = 0;
  static  unsigned long long aesl_llvm_cbe_709_count = 0;
  static  unsigned long long aesl_llvm_cbe_710_count = 0;
  static  unsigned long long aesl_llvm_cbe_711_count = 0;
  static  unsigned long long aesl_llvm_cbe_712_count = 0;
  static  unsigned long long aesl_llvm_cbe_713_count = 0;
  static  unsigned long long aesl_llvm_cbe_714_count = 0;
  static  unsigned long long aesl_llvm_cbe_715_count = 0;
  unsigned int llvm_cbe_tmp__76;
  static  unsigned long long aesl_llvm_cbe_716_count = 0;
  static  unsigned long long aesl_llvm_cbe_717_count = 0;
  static  unsigned long long aesl_llvm_cbe_718_count = 0;
  static  unsigned long long aesl_llvm_cbe_719_count = 0;
  static  unsigned long long aesl_llvm_cbe_720_count = 0;
  static  unsigned long long aesl_llvm_cbe_721_count = 0;
  static  unsigned long long aesl_llvm_cbe_722_count = 0;
  static  unsigned long long aesl_llvm_cbe_723_count = 0;
  static  unsigned long long aesl_llvm_cbe_724_count = 0;
  static  unsigned long long aesl_llvm_cbe_725_count = 0;
  static  unsigned long long aesl_llvm_cbe_726_count = 0;
  static  unsigned long long aesl_llvm_cbe_727_count = 0;
  unsigned int llvm_cbe_tmp__77;
  static  unsigned long long aesl_llvm_cbe_728_count = 0;
  static  unsigned long long aesl_llvm_cbe_729_count = 0;
  static  unsigned long long aesl_llvm_cbe_730_count = 0;
  static  unsigned long long aesl_llvm_cbe_731_count = 0;
  static  unsigned long long aesl_llvm_cbe_732_count = 0;
  static  unsigned long long aesl_llvm_cbe_733_count = 0;
  static  unsigned long long aesl_llvm_cbe_734_count = 0;
  static  unsigned long long aesl_llvm_cbe_735_count = 0;
  static  unsigned long long aesl_llvm_cbe_736_count = 0;
  static  unsigned long long aesl_llvm_cbe_737_count = 0;
  static  unsigned long long aesl_llvm_cbe_738_count = 0;
  static  unsigned long long aesl_llvm_cbe_739_count = 0;
  static  unsigned long long aesl_llvm_cbe_740_count = 0;
  static  unsigned long long aesl_llvm_cbe_741_count = 0;
  unsigned int llvm_cbe_tmp__78;
  static  unsigned long long aesl_llvm_cbe_742_count = 0;
  static  unsigned long long aesl_llvm_cbe_743_count = 0;
  static  unsigned long long aesl_llvm_cbe_744_count = 0;
  static  unsigned long long aesl_llvm_cbe_745_count = 0;
  static  unsigned long long aesl_llvm_cbe_746_count = 0;
  static  unsigned long long aesl_llvm_cbe_747_count = 0;
  static  unsigned long long aesl_llvm_cbe_748_count = 0;
  static  unsigned long long aesl_llvm_cbe_749_count = 0;
  static  unsigned long long aesl_llvm_cbe_750_count = 0;
  static  unsigned long long aesl_llvm_cbe_751_count = 0;
  static  unsigned long long aesl_llvm_cbe_752_count = 0;
  static  unsigned long long aesl_llvm_cbe_753_count = 0;
  static  unsigned long long aesl_llvm_cbe_754_count = 0;
  static  unsigned long long aesl_llvm_cbe_755_count = 0;
  unsigned int llvm_cbe_tmp__79;
  static  unsigned long long aesl_llvm_cbe_756_count = 0;
  static  unsigned long long aesl_llvm_cbe_757_count = 0;
  static  unsigned long long aesl_llvm_cbe_758_count = 0;
  static  unsigned long long aesl_llvm_cbe_759_count = 0;
  static  unsigned long long aesl_llvm_cbe_760_count = 0;
  static  unsigned long long aesl_llvm_cbe_761_count = 0;
  static  unsigned long long aesl_llvm_cbe_762_count = 0;
  static  unsigned long long aesl_llvm_cbe_763_count = 0;
  static  unsigned long long aesl_llvm_cbe_764_count = 0;
  static  unsigned long long aesl_llvm_cbe_765_count = 0;
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
  unsigned int llvm_cbe_tmp__80;
  static  unsigned long long aesl_llvm_cbe_777_count = 0;
  unsigned long long llvm_cbe_tmp__81;
  static  unsigned long long aesl_llvm_cbe_778_count = 0;
  unsigned long long llvm_cbe_tmp__82;
  static  unsigned long long aesl_llvm_cbe_779_count = 0;
  unsigned long long llvm_cbe_tmp__83;
  static  unsigned long long aesl_llvm_cbe_780_count = 0;
  unsigned int llvm_cbe_tmp__84;
  static  unsigned long long aesl_llvm_cbe_781_count = 0;
  static  unsigned long long aesl_llvm_cbe_782_count = 0;
  static  unsigned long long aesl_llvm_cbe_783_count = 0;
  static  unsigned long long aesl_llvm_cbe_784_count = 0;
  static  unsigned long long aesl_llvm_cbe_785_count = 0;
  static  unsigned long long aesl_llvm_cbe_786_count = 0;
  static  unsigned long long aesl_llvm_cbe_787_count = 0;
  static  unsigned long long aesl_llvm_cbe_788_count = 0;
  static  unsigned long long aesl_llvm_cbe_789_count = 0;
  static  unsigned long long aesl_llvm_cbe_790_count = 0;
  unsigned int llvm_cbe_tmp__85;
  static  unsigned long long aesl_llvm_cbe_791_count = 0;
  unsigned long long llvm_cbe_tmp__86;
  static  unsigned long long aesl_llvm_cbe_792_count = 0;
  unsigned long long llvm_cbe_tmp__87;
  static  unsigned long long aesl_llvm_cbe_793_count = 0;
  unsigned long long llvm_cbe_tmp__88;
  static  unsigned long long aesl_llvm_cbe_794_count = 0;
  unsigned int llvm_cbe_tmp__89;
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
  static  unsigned long long aesl_llvm_cbe_805_count = 0;
  static  unsigned long long aesl_llvm_cbe_806_count = 0;
  static  unsigned long long aesl_llvm_cbe_807_count = 0;
  static  unsigned long long aesl_llvm_cbe_808_count = 0;
  static  unsigned long long aesl_llvm_cbe_809_count = 0;
  static  unsigned long long aesl_llvm_cbe_810_count = 0;
  static  unsigned long long aesl_llvm_cbe_811_count = 0;
  static  unsigned long long aesl_llvm_cbe_812_count = 0;
  static  unsigned long long aesl_llvm_cbe_813_count = 0;
  signed int *llvm_cbe_tmp__90;
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
  static  unsigned long long aesl_llvm_cbe_825_count = 0;
  static  unsigned long long aesl_llvm_cbe_826_count = 0;
  static  unsigned long long aesl_llvm_cbe_827_count = 0;
  static  unsigned long long aesl_llvm_cbe_828_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_839_count = 0;
  static  unsigned long long aesl_llvm_cbe_840_count = 0;
  static  unsigned long long aesl_llvm_cbe_841_count = 0;
  static  unsigned long long aesl_llvm_cbe_842_count = 0;
  static  unsigned long long aesl_llvm_cbe_843_count = 0;
  static  unsigned long long aesl_llvm_cbe_844_count = 0;
  static  unsigned long long aesl_llvm_cbe_845_count = 0;
  static  unsigned long long aesl_llvm_cbe_846_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_860_count = 0;
  static  unsigned long long aesl_llvm_cbe_861_count = 0;
  static  unsigned long long aesl_llvm_cbe_862_count = 0;
  static  unsigned long long aesl_llvm_cbe_863_count = 0;
  static  unsigned long long aesl_llvm_cbe_864_count = 0;
  static  unsigned long long aesl_llvm_cbe_865_count = 0;
  static  unsigned long long aesl_llvm_cbe_866_count = 0;
  unsigned int llvm_cbe_tmp__91;
  static  unsigned long long aesl_llvm_cbe_867_count = 0;
  static  unsigned long long aesl_llvm_cbe_868_count = 0;
  signed int *llvm_cbe_tmp__92;
  static  unsigned long long aesl_llvm_cbe_869_count = 0;
  static  unsigned long long aesl_llvm_cbe_870_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_881_count = 0;
  static  unsigned long long aesl_llvm_cbe_882_count = 0;
  static  unsigned long long aesl_llvm_cbe_883_count = 0;
  static  unsigned long long aesl_llvm_cbe_884_count = 0;
  static  unsigned long long aesl_llvm_cbe_885_count = 0;
  static  unsigned long long aesl_llvm_cbe_886_count = 0;
  static  unsigned long long aesl_llvm_cbe_887_count = 0;
  static  unsigned long long aesl_llvm_cbe_888_count = 0;
  static  unsigned long long aesl_llvm_cbe_889_count = 0;
  static  unsigned long long aesl_llvm_cbe_890_count = 0;
  static  unsigned long long aesl_llvm_cbe_891_count = 0;
  static  unsigned long long aesl_llvm_cbe_892_count = 0;
  static  unsigned long long aesl_llvm_cbe_893_count = 0;
  static  unsigned long long aesl_llvm_cbe_894_count = 0;
  static  unsigned long long aesl_llvm_cbe_895_count = 0;
  static  unsigned long long aesl_llvm_cbe_896_count = 0;
  static  unsigned long long aesl_llvm_cbe_897_count = 0;
  static  unsigned long long aesl_llvm_cbe_898_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_918_count = 0;
  static  unsigned long long aesl_llvm_cbe_919_count = 0;
  static  unsigned long long aesl_llvm_cbe_920_count = 0;
  static  unsigned long long aesl_llvm_cbe_921_count = 0;
  unsigned int llvm_cbe_tmp__93;
  static  unsigned long long aesl_llvm_cbe_922_count = 0;
  static  unsigned long long aesl_llvm_cbe_923_count = 0;
  signed int *llvm_cbe_tmp__94;
  static  unsigned long long aesl_llvm_cbe_924_count = 0;
  static  unsigned long long aesl_llvm_cbe_925_count = 0;
  static  unsigned long long aesl_llvm_cbe_926_count = 0;
  static  unsigned long long aesl_llvm_cbe_927_count = 0;
  static  unsigned long long aesl_llvm_cbe_928_count = 0;
  static  unsigned long long aesl_llvm_cbe_929_count = 0;
  static  unsigned long long aesl_llvm_cbe_930_count = 0;
  static  unsigned long long aesl_llvm_cbe_931_count = 0;
  static  unsigned long long aesl_llvm_cbe_932_count = 0;
  static  unsigned long long aesl_llvm_cbe_933_count = 0;
  static  unsigned long long aesl_llvm_cbe_934_count = 0;
  static  unsigned long long aesl_llvm_cbe_935_count = 0;
  static  unsigned long long aesl_llvm_cbe_936_count = 0;
  static  unsigned long long aesl_llvm_cbe_937_count = 0;
  static  unsigned long long aesl_llvm_cbe_938_count = 0;
  static  unsigned long long aesl_llvm_cbe_939_count = 0;
  static  unsigned long long aesl_llvm_cbe_940_count = 0;
  static  unsigned long long aesl_llvm_cbe_941_count = 0;
  static  unsigned long long aesl_llvm_cbe_942_count = 0;
  static  unsigned long long aesl_llvm_cbe_943_count = 0;
  static  unsigned long long aesl_llvm_cbe_944_count = 0;
  static  unsigned long long aesl_llvm_cbe_945_count = 0;
  static  unsigned long long aesl_llvm_cbe_946_count = 0;
  static  unsigned long long aesl_llvm_cbe_947_count = 0;
  static  unsigned long long aesl_llvm_cbe_948_count = 0;
  static  unsigned long long aesl_llvm_cbe_949_count = 0;
  static  unsigned long long aesl_llvm_cbe_950_count = 0;
  static  unsigned long long aesl_llvm_cbe_951_count = 0;
  static  unsigned long long aesl_llvm_cbe_952_count = 0;
  static  unsigned long long aesl_llvm_cbe_953_count = 0;
  static  unsigned long long aesl_llvm_cbe_954_count = 0;
  static  unsigned long long aesl_llvm_cbe_955_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_975_count = 0;
  static  unsigned long long aesl_llvm_cbe_976_count = 0;
  unsigned int llvm_cbe_tmp__95;
  static  unsigned long long aesl_llvm_cbe_977_count = 0;
  static  unsigned long long aesl_llvm_cbe_978_count = 0;
  signed int *llvm_cbe_tmp__96;
  static  unsigned long long aesl_llvm_cbe_979_count = 0;
  static  unsigned long long aesl_llvm_cbe_980_count = 0;
  static  unsigned long long aesl_llvm_cbe_981_count = 0;
  static  unsigned long long aesl_llvm_cbe_982_count = 0;
  static  unsigned long long aesl_llvm_cbe_983_count = 0;
  static  unsigned long long aesl_llvm_cbe_984_count = 0;
  static  unsigned long long aesl_llvm_cbe_985_count = 0;
  static  unsigned long long aesl_llvm_cbe_986_count = 0;
  static  unsigned long long aesl_llvm_cbe_987_count = 0;
  static  unsigned long long aesl_llvm_cbe_988_count = 0;
  static  unsigned long long aesl_llvm_cbe_989_count = 0;
  static  unsigned long long aesl_llvm_cbe_990_count = 0;
  static  unsigned long long aesl_llvm_cbe_991_count = 0;
  static  unsigned long long aesl_llvm_cbe_992_count = 0;
  static  unsigned long long aesl_llvm_cbe_993_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1004_count = 0;
  static  unsigned long long aesl_llvm_cbe_1005_count = 0;
  static  unsigned long long aesl_llvm_cbe_1006_count = 0;
  static  unsigned long long aesl_llvm_cbe_1007_count = 0;
  static  unsigned long long aesl_llvm_cbe_1008_count = 0;
  static  unsigned long long aesl_llvm_cbe_1009_count = 0;
  static  unsigned long long aesl_llvm_cbe_1010_count = 0;
  static  unsigned long long aesl_llvm_cbe_1011_count = 0;
  static  unsigned long long aesl_llvm_cbe_1012_count = 0;
  static  unsigned long long aesl_llvm_cbe_1013_count = 0;
  static  unsigned long long aesl_llvm_cbe_1014_count = 0;
  static  unsigned long long aesl_llvm_cbe_1015_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1026_count = 0;
  static  unsigned long long aesl_llvm_cbe_1027_count = 0;
  static  unsigned long long aesl_llvm_cbe_1028_count = 0;
  static  unsigned long long aesl_llvm_cbe_1029_count = 0;
  static  unsigned long long aesl_llvm_cbe_1030_count = 0;
  static  unsigned long long aesl_llvm_cbe_1031_count = 0;
  unsigned int llvm_cbe_tmp__97;
  static  unsigned long long aesl_llvm_cbe_1032_count = 0;
  static  unsigned long long aesl_llvm_cbe_1033_count = 0;
  signed int *llvm_cbe_tmp__98;
  static  unsigned long long aesl_llvm_cbe_1034_count = 0;
  static  unsigned long long aesl_llvm_cbe_1035_count = 0;
  static  unsigned long long aesl_llvm_cbe_1036_count = 0;
  static  unsigned long long aesl_llvm_cbe_1037_count = 0;
  static  unsigned long long aesl_llvm_cbe_1038_count = 0;
  static  unsigned long long aesl_llvm_cbe_1039_count = 0;
  static  unsigned long long aesl_llvm_cbe_1040_count = 0;
  static  unsigned long long aesl_llvm_cbe_1041_count = 0;
  static  unsigned long long aesl_llvm_cbe_1042_count = 0;
  static  unsigned long long aesl_llvm_cbe_1043_count = 0;
  static  unsigned long long aesl_llvm_cbe_1044_count = 0;
  static  unsigned long long aesl_llvm_cbe_1045_count = 0;
  static  unsigned long long aesl_llvm_cbe_1046_count = 0;
  static  unsigned long long aesl_llvm_cbe_1047_count = 0;
  static  unsigned long long aesl_llvm_cbe_1048_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1060_count = 0;
  static  unsigned long long aesl_llvm_cbe_1061_count = 0;
  static  unsigned long long aesl_llvm_cbe_1062_count = 0;
  static  unsigned long long aesl_llvm_cbe_1063_count = 0;
  static  unsigned long long aesl_llvm_cbe_1064_count = 0;
  static  unsigned long long aesl_llvm_cbe_1065_count = 0;
  static  unsigned long long aesl_llvm_cbe_1066_count = 0;
  static  unsigned long long aesl_llvm_cbe_1067_count = 0;
  static  unsigned long long aesl_llvm_cbe_1068_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1079_count = 0;
  static  unsigned long long aesl_llvm_cbe_1080_count = 0;
  static  unsigned long long aesl_llvm_cbe_1081_count = 0;
  static  unsigned long long aesl_llvm_cbe_1082_count = 0;
  static  unsigned long long aesl_llvm_cbe_1083_count = 0;
  static  unsigned long long aesl_llvm_cbe_1084_count = 0;
  static  unsigned long long aesl_llvm_cbe_1085_count = 0;
  static  unsigned long long aesl_llvm_cbe_1086_count = 0;
  unsigned int llvm_cbe_tmp__99;
  static  unsigned long long aesl_llvm_cbe_1087_count = 0;
  static  unsigned long long aesl_llvm_cbe_1088_count = 0;
  signed int *llvm_cbe_tmp__100;
  static  unsigned long long aesl_llvm_cbe_1089_count = 0;
  static  unsigned long long aesl_llvm_cbe_1090_count = 0;
  static  unsigned long long aesl_llvm_cbe_1091_count = 0;
  static  unsigned long long aesl_llvm_cbe_1092_count = 0;
  static  unsigned long long aesl_llvm_cbe_1093_count = 0;
  static  unsigned long long aesl_llvm_cbe_1094_count = 0;
  static  unsigned long long aesl_llvm_cbe_1095_count = 0;
  static  unsigned long long aesl_llvm_cbe_1096_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1125_count = 0;
  static  unsigned long long aesl_llvm_cbe_1126_count = 0;
  static  unsigned long long aesl_llvm_cbe_1127_count = 0;
  static  unsigned long long aesl_llvm_cbe_1128_count = 0;
  static  unsigned long long aesl_llvm_cbe_1129_count = 0;
  static  unsigned long long aesl_llvm_cbe_1130_count = 0;
  static  unsigned long long aesl_llvm_cbe_1131_count = 0;
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
  unsigned int llvm_cbe_tmp__101;
  static  unsigned long long aesl_llvm_cbe_1142_count = 0;
  static  unsigned long long aesl_llvm_cbe_1143_count = 0;
  signed int *llvm_cbe_tmp__102;
  static  unsigned long long aesl_llvm_cbe_1144_count = 0;
  static  unsigned long long aesl_llvm_cbe_1145_count = 0;
  static  unsigned long long aesl_llvm_cbe_1146_count = 0;
  static  unsigned long long aesl_llvm_cbe_1147_count = 0;
  static  unsigned long long aesl_llvm_cbe_1148_count = 0;
  static  unsigned long long aesl_llvm_cbe_1149_count = 0;
  static  unsigned long long aesl_llvm_cbe_1150_count = 0;
  static  unsigned long long aesl_llvm_cbe_1151_count = 0;
  static  unsigned long long aesl_llvm_cbe_1152_count = 0;
  static  unsigned long long aesl_llvm_cbe_1153_count = 0;
  static  unsigned long long aesl_llvm_cbe_1154_count = 0;
  static  unsigned long long aesl_llvm_cbe_1155_count = 0;
  static  unsigned long long aesl_llvm_cbe_1156_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1170_count = 0;
  static  unsigned long long aesl_llvm_cbe_1171_count = 0;
  static  unsigned long long aesl_llvm_cbe_1172_count = 0;
  static  unsigned long long aesl_llvm_cbe_1173_count = 0;
  static  unsigned long long aesl_llvm_cbe_1174_count = 0;
  static  unsigned long long aesl_llvm_cbe_1175_count = 0;
  static  unsigned long long aesl_llvm_cbe_1176_count = 0;
  static  unsigned long long aesl_llvm_cbe_1177_count = 0;
  static  unsigned long long aesl_llvm_cbe_1178_count = 0;
  static  unsigned long long aesl_llvm_cbe_1179_count = 0;
  static  unsigned long long aesl_llvm_cbe_1180_count = 0;
  static  unsigned long long aesl_llvm_cbe_1181_count = 0;
  static  unsigned long long aesl_llvm_cbe_1182_count = 0;
  static  unsigned long long aesl_llvm_cbe_1183_count = 0;
  static  unsigned long long aesl_llvm_cbe_1184_count = 0;
  static  unsigned long long aesl_llvm_cbe_1185_count = 0;
  static  unsigned long long aesl_llvm_cbe_1186_count = 0;
  static  unsigned long long aesl_llvm_cbe_1187_count = 0;
  static  unsigned long long aesl_llvm_cbe_1188_count = 0;
  static  unsigned long long aesl_llvm_cbe_1189_count = 0;
  static  unsigned long long aesl_llvm_cbe_1190_count = 0;
  static  unsigned long long aesl_llvm_cbe_1191_count = 0;
  static  unsigned long long aesl_llvm_cbe_1192_count = 0;
  static  unsigned long long aesl_llvm_cbe_1193_count = 0;
  static  unsigned long long aesl_llvm_cbe_1194_count = 0;
  static  unsigned long long aesl_llvm_cbe_1195_count = 0;
  static  unsigned long long aesl_llvm_cbe_1196_count = 0;
  unsigned int llvm_cbe_tmp__103;
  static  unsigned long long aesl_llvm_cbe_1197_count = 0;
  static  unsigned long long aesl_llvm_cbe_1198_count = 0;
  signed int *llvm_cbe_tmp__104;
  static  unsigned long long aesl_llvm_cbe_1199_count = 0;
  static  unsigned long long aesl_llvm_cbe_1200_count = 0;
  static  unsigned long long aesl_llvm_cbe_1201_count = 0;
  static  unsigned long long aesl_llvm_cbe_1202_count = 0;
  static  unsigned long long aesl_llvm_cbe_1203_count = 0;
  static  unsigned long long aesl_llvm_cbe_1204_count = 0;
  static  unsigned long long aesl_llvm_cbe_1205_count = 0;
  static  unsigned long long aesl_llvm_cbe_1206_count = 0;
  static  unsigned long long aesl_llvm_cbe_1207_count = 0;
  static  unsigned long long aesl_llvm_cbe_1208_count = 0;
  static  unsigned long long aesl_llvm_cbe_1209_count = 0;
  static  unsigned long long aesl_llvm_cbe_1210_count = 0;
  static  unsigned long long aesl_llvm_cbe_1211_count = 0;
  static  unsigned long long aesl_llvm_cbe_1212_count = 0;
  static  unsigned long long aesl_llvm_cbe_1213_count = 0;
  static  unsigned long long aesl_llvm_cbe_1214_count = 0;
  static  unsigned long long aesl_llvm_cbe_1215_count = 0;
  static  unsigned long long aesl_llvm_cbe_1216_count = 0;
  static  unsigned long long aesl_llvm_cbe_1217_count = 0;
  static  unsigned long long aesl_llvm_cbe_1218_count = 0;
  static  unsigned long long aesl_llvm_cbe_1219_count = 0;
  static  unsigned long long aesl_llvm_cbe_1220_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1247_count = 0;
  static  unsigned long long aesl_llvm_cbe_1248_count = 0;
  static  unsigned long long aesl_llvm_cbe_1249_count = 0;
  static  unsigned long long aesl_llvm_cbe_1250_count = 0;
  static  unsigned long long aesl_llvm_cbe_1251_count = 0;
  unsigned int llvm_cbe_tmp__105;
  static  unsigned long long aesl_llvm_cbe_1252_count = 0;
  static  unsigned long long aesl_llvm_cbe_1253_count = 0;
  unsigned int llvm_cbe_tmp__106;
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
  static  unsigned long long aesl_llvm_cbe_exitcond42_count = 0;
  static  unsigned long long aesl_llvm_cbe_1265_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge139_count = 0;
  unsigned int llvm_cbe_storemerge139;
  unsigned int llvm_cbe_storemerge139__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_1266_count = 0;
  unsigned int llvm_cbe_tmp__107;
  static  unsigned long long aesl_llvm_cbe_1267_count = 0;
  unsigned long long llvm_cbe_tmp__108;
  static  unsigned long long aesl_llvm_cbe_1268_count = 0;
  signed int *llvm_cbe_tmp__109;
  static  unsigned long long aesl_llvm_cbe_1269_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum3_count = 0;
  unsigned long long llvm_cbe__2e_sum3;
  static  unsigned long long aesl_llvm_cbe_1270_count = 0;
  signed int *llvm_cbe_tmp__110;
  static  unsigned long long aesl_llvm_cbe_1271_count = 0;
  static  unsigned long long aesl_llvm_cbe_1272_count = 0;
  static  unsigned long long aesl_llvm_cbe_1273_count = 0;
  static  unsigned long long aesl_llvm_cbe_1274_count = 0;
  static  unsigned long long aesl_llvm_cbe_1275_count = 0;
  static  unsigned long long aesl_llvm_cbe_1276_count = 0;
  static  unsigned long long aesl_llvm_cbe_1277_count = 0;
  static  unsigned long long aesl_llvm_cbe_1278_count = 0;
  static  unsigned long long aesl_llvm_cbe_1279_count = 0;
  static  unsigned long long aesl_llvm_cbe_1280_count = 0;
  static  unsigned long long aesl_llvm_cbe_1281_count = 0;
  static  unsigned long long aesl_llvm_cbe_1282_count = 0;
  static  unsigned long long aesl_llvm_cbe_1283_count = 0;
  static  unsigned long long aesl_llvm_cbe_1284_count = 0;
  static  unsigned long long aesl_llvm_cbe_1285_count = 0;
  static  unsigned long long aesl_llvm_cbe_1286_count = 0;
  static  unsigned long long aesl_llvm_cbe_1287_count = 0;
  static  unsigned long long aesl_llvm_cbe_1288_count = 0;
  static  unsigned long long aesl_llvm_cbe_1289_count = 0;
  static  unsigned long long aesl_llvm_cbe_1290_count = 0;
  static  unsigned long long aesl_llvm_cbe_1291_count = 0;
  static  unsigned long long aesl_llvm_cbe_1292_count = 0;
  static  unsigned long long aesl_llvm_cbe_1293_count = 0;
  static  unsigned long long aesl_llvm_cbe_1294_count = 0;
  static  unsigned long long aesl_llvm_cbe_1295_count = 0;
  static  unsigned long long aesl_llvm_cbe_1296_count = 0;
  static  unsigned long long aesl_llvm_cbe_1297_count = 0;
  static  unsigned long long aesl_llvm_cbe_1298_count = 0;
  static  unsigned long long aesl_llvm_cbe_1299_count = 0;
  static  unsigned long long aesl_llvm_cbe_1300_count = 0;
  static  unsigned long long aesl_llvm_cbe_1301_count = 0;
  static  unsigned long long aesl_llvm_cbe_1302_count = 0;
  static  unsigned long long aesl_llvm_cbe_1303_count = 0;
  static  unsigned long long aesl_llvm_cbe_1304_count = 0;
  static  unsigned long long aesl_llvm_cbe_1305_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_1321_count = 0;
  static  unsigned long long aesl_llvm_cbe_1322_count = 0;
  static  unsigned long long aesl_llvm_cbe_1323_count = 0;
  unsigned int llvm_cbe_tmp__111;
  static  unsigned long long aesl_llvm_cbe_1324_count = 0;
  static  unsigned long long aesl_llvm_cbe_1325_count = 0;
  static  unsigned long long aesl_llvm_cbe_1326_count = 0;
  static  unsigned long long aesl_llvm_cbe_1327_count = 0;
  static  unsigned long long aesl_llvm_cbe_1328_count = 0;
  static  unsigned long long aesl_llvm_cbe_1329_count = 0;
  static  unsigned long long aesl_llvm_cbe_1330_count = 0;
  static  unsigned long long aesl_llvm_cbe_1331_count = 0;
  static  unsigned long long aesl_llvm_cbe_1332_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum_count = 0;
  unsigned long long llvm_cbe__2e_sum;
  static  unsigned long long aesl_llvm_cbe_1333_count = 0;
  signed int *llvm_cbe_tmp__112;
  static  unsigned long long aesl_llvm_cbe_1334_count = 0;
  static  unsigned long long aesl_llvm_cbe_1335_count = 0;
  static  unsigned long long aesl_llvm_cbe_1336_count = 0;
  static  unsigned long long aesl_llvm_cbe_1337_count = 0;
  static  unsigned long long aesl_llvm_cbe_1338_count = 0;
  static  unsigned long long aesl_llvm_cbe_1339_count = 0;
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
  unsigned int llvm_cbe_tmp__113;
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
  static  unsigned long long aesl_llvm_cbe__2e_sum45_count = 0;
  unsigned long long llvm_cbe__2e_sum45;
  static  unsigned long long aesl_llvm_cbe_1398_count = 0;
  signed int *llvm_cbe_tmp__114;
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
  unsigned int llvm_cbe_tmp__115;
  static  unsigned long long aesl_llvm_cbe_1452_count = 0;
  static  unsigned long long aesl_llvm_cbe_1453_count = 0;
  static  unsigned long long aesl_llvm_cbe_1454_count = 0;
  static  unsigned long long aesl_llvm_cbe_1455_count = 0;
  static  unsigned long long aesl_llvm_cbe_1456_count = 0;
  static  unsigned long long aesl_llvm_cbe_1457_count = 0;
  static  unsigned long long aesl_llvm_cbe_1458_count = 0;
  static  unsigned long long aesl_llvm_cbe_1459_count = 0;
  static  unsigned long long aesl_llvm_cbe_1460_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum6_count = 0;
  unsigned long long llvm_cbe__2e_sum6;
  static  unsigned long long aesl_llvm_cbe_1461_count = 0;
  signed int *llvm_cbe_tmp__116;
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
  unsigned int llvm_cbe_tmp__117;
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
  static  unsigned long long aesl_llvm_cbe__2e_sum7_count = 0;
  unsigned long long llvm_cbe__2e_sum7;
  static  unsigned long long aesl_llvm_cbe_1528_count = 0;
  signed int *llvm_cbe_tmp__118;
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
  unsigned int llvm_cbe_tmp__119;
  static  unsigned long long aesl_llvm_cbe_1582_count = 0;
  static  unsigned long long aesl_llvm_cbe_1583_count = 0;
  static  unsigned long long aesl_llvm_cbe_1584_count = 0;
  static  unsigned long long aesl_llvm_cbe_1585_count = 0;
  static  unsigned long long aesl_llvm_cbe_1586_count = 0;
  static  unsigned long long aesl_llvm_cbe_1587_count = 0;
  static  unsigned long long aesl_llvm_cbe_1588_count = 0;
  static  unsigned long long aesl_llvm_cbe_1589_count = 0;
  static  unsigned long long aesl_llvm_cbe_1590_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_sum8_count = 0;
  unsigned long long llvm_cbe__2e_sum8;
  static  unsigned long long aesl_llvm_cbe_1591_count = 0;
  signed int *llvm_cbe_tmp__120;
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
  unsigned int llvm_cbe_tmp__121;
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
  static  unsigned long long aesl_llvm_cbe__2e_sum910_count = 0;
  unsigned long long llvm_cbe__2e_sum910;
  static  unsigned long long aesl_llvm_cbe_1658_count = 0;
  signed int *llvm_cbe_tmp__122;
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
  unsigned int llvm_cbe_tmp__123;
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
  unsigned int llvm_cbe_tmp__124;
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
  unsigned long long llvm_cbe_tmp__125;
  static  unsigned long long aesl_llvm_cbe_1734_count = 0;
  unsigned long long llvm_cbe_tmp__126;
  static  unsigned long long aesl_llvm_cbe_1735_count = 0;
  unsigned long long llvm_cbe_tmp__127;
  static  unsigned long long aesl_llvm_cbe_1736_count = 0;
  unsigned long long llvm_cbe_tmp__128;
  static  unsigned long long aesl_llvm_cbe_1737_count = 0;
  unsigned long long llvm_cbe_tmp__129;
  static  unsigned long long aesl_llvm_cbe_1738_count = 0;
  unsigned long long llvm_cbe_tmp__130;
  static  unsigned long long aesl_llvm_cbe_1739_count = 0;
  unsigned int llvm_cbe_tmp__131;
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
  unsigned long long llvm_cbe_tmp__132;
  static  unsigned long long aesl_llvm_cbe_1750_count = 0;
  unsigned long long llvm_cbe_tmp__133;
  static  unsigned long long aesl_llvm_cbe_1751_count = 0;
  unsigned long long llvm_cbe_tmp__134;
  static  unsigned long long aesl_llvm_cbe_1752_count = 0;
  unsigned long long llvm_cbe_tmp__135;
  static  unsigned long long aesl_llvm_cbe_1753_count = 0;
  unsigned long long llvm_cbe_tmp__136;
  static  unsigned long long aesl_llvm_cbe_1754_count = 0;
  unsigned long long llvm_cbe_tmp__137;
  static  unsigned long long aesl_llvm_cbe_1755_count = 0;
  unsigned int llvm_cbe_tmp__138;
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
  unsigned long long llvm_cbe_tmp__139;
  static  unsigned long long aesl_llvm_cbe_1766_count = 0;
  unsigned long long llvm_cbe_tmp__140;
  static  unsigned long long aesl_llvm_cbe_1767_count = 0;
  unsigned long long llvm_cbe_tmp__141;
  static  unsigned long long aesl_llvm_cbe_1768_count = 0;
  unsigned long long llvm_cbe_tmp__142;
  static  unsigned long long aesl_llvm_cbe_1769_count = 0;
  unsigned int llvm_cbe_tmp__143;
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
  unsigned long long llvm_cbe_tmp__144;
  static  unsigned long long aesl_llvm_cbe_1780_count = 0;
  unsigned long long llvm_cbe_tmp__145;
  static  unsigned long long aesl_llvm_cbe_1781_count = 0;
  unsigned long long llvm_cbe_tmp__146;
  static  unsigned long long aesl_llvm_cbe_1782_count = 0;
  unsigned long long llvm_cbe_tmp__147;
  static  unsigned long long aesl_llvm_cbe_1783_count = 0;
  unsigned int llvm_cbe_tmp__148;
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
  unsigned int llvm_cbe_tmp__149;
  static  unsigned long long aesl_llvm_cbe_1794_count = 0;
  unsigned long long llvm_cbe_tmp__150;
  static  unsigned long long aesl_llvm_cbe_1795_count = 0;
  unsigned long long llvm_cbe_tmp__151;
  static  unsigned long long aesl_llvm_cbe_1796_count = 0;
  unsigned long long llvm_cbe_tmp__152;
  static  unsigned long long aesl_llvm_cbe_1797_count = 0;
  unsigned int llvm_cbe_tmp__153;
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
  unsigned int llvm_cbe_tmp__154;
  static  unsigned long long aesl_llvm_cbe_1810_count = 0;
  unsigned long long llvm_cbe_tmp__155;
  static  unsigned long long aesl_llvm_cbe_1811_count = 0;
  unsigned long long llvm_cbe_tmp__156;
  static  unsigned long long aesl_llvm_cbe_1812_count = 0;
  unsigned long long llvm_cbe_tmp__157;
  static  unsigned long long aesl_llvm_cbe_1813_count = 0;
  unsigned int llvm_cbe_tmp__158;
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
  unsigned long long llvm_cbe_tmp__159;
  static  unsigned long long aesl_llvm_cbe_1828_count = 0;
  unsigned long long llvm_cbe_tmp__160;
  static  unsigned long long aesl_llvm_cbe_1829_count = 0;
  unsigned long long llvm_cbe_tmp__161;
  static  unsigned long long aesl_llvm_cbe_1830_count = 0;
  unsigned long long llvm_cbe_tmp__162;
  static  unsigned long long aesl_llvm_cbe_1831_count = 0;
  unsigned long long llvm_cbe_tmp__163;
  static  unsigned long long aesl_llvm_cbe_1832_count = 0;
  unsigned long long llvm_cbe_tmp__164;
  static  unsigned long long aesl_llvm_cbe_1833_count = 0;
  unsigned int llvm_cbe_tmp__165;
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
  unsigned long long llvm_cbe_tmp__166;
  static  unsigned long long aesl_llvm_cbe_1848_count = 0;
  unsigned long long llvm_cbe_tmp__167;
  static  unsigned long long aesl_llvm_cbe_1849_count = 0;
  unsigned long long llvm_cbe_tmp__168;
  static  unsigned long long aesl_llvm_cbe_1850_count = 0;
  unsigned long long llvm_cbe_tmp__169;
  static  unsigned long long aesl_llvm_cbe_1851_count = 0;
  unsigned int llvm_cbe_tmp__170;
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
  unsigned int llvm_cbe_tmp__171;
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
  unsigned int llvm_cbe_tmp__172;
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
  unsigned int llvm_cbe_tmp__173;
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
  unsigned int llvm_cbe_tmp__174;
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
  unsigned int llvm_cbe_tmp__175;
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
  unsigned int llvm_cbe_tmp__176;
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
  unsigned int llvm_cbe_tmp__177;
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
  unsigned int llvm_cbe_tmp__178;
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
  unsigned int llvm_cbe_tmp__179;
  static  unsigned long long aesl_llvm_cbe_1965_count = 0;
  unsigned long long llvm_cbe_tmp__180;
  static  unsigned long long aesl_llvm_cbe_1966_count = 0;
  unsigned long long llvm_cbe_tmp__181;
  static  unsigned long long aesl_llvm_cbe_1967_count = 0;
  unsigned long long llvm_cbe_tmp__182;
  static  unsigned long long aesl_llvm_cbe_1968_count = 0;
  unsigned int llvm_cbe_tmp__183;
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
  unsigned int llvm_cbe_tmp__184;
  static  unsigned long long aesl_llvm_cbe_1979_count = 0;
  unsigned long long llvm_cbe_tmp__185;
  static  unsigned long long aesl_llvm_cbe_1980_count = 0;
  unsigned long long llvm_cbe_tmp__186;
  static  unsigned long long aesl_llvm_cbe_1981_count = 0;
  unsigned long long llvm_cbe_tmp__187;
  static  unsigned long long aesl_llvm_cbe_1982_count = 0;
  unsigned int llvm_cbe_tmp__188;
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
  unsigned int llvm_cbe_tmp__189;
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
  unsigned int llvm_cbe_tmp__190;
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
  unsigned int llvm_cbe_tmp__191;
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
  unsigned int llvm_cbe_tmp__192;
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
  unsigned int llvm_cbe_tmp__193;
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
  unsigned int llvm_cbe_tmp__194;
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
  unsigned int llvm_cbe_tmp__195;
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
  unsigned int llvm_cbe_tmp__196;
  static  unsigned long long aesl_llvm_cbe_2432_count = 0;
  static  unsigned long long aesl_llvm_cbe_2433_count = 0;
  unsigned int llvm_cbe_tmp__197;
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
  static  unsigned long long aesl_llvm_cbe_exitcond41_count = 0;
  static  unsigned long long aesl_llvm_cbe_2445_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge237_2e_rec_count = 0;
  unsigned long long llvm_cbe_storemerge237_2e_rec;
  unsigned long long llvm_cbe_storemerge237_2e_rec__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge237_count = 0;
  signed int *llvm_cbe_storemerge237;
  static  unsigned long long aesl_llvm_cbe_2446_count = 0;
  unsigned int llvm_cbe_tmp__198;
  static  unsigned long long aesl_llvm_cbe_2447_count = 0;
  unsigned int llvm_cbe_tmp__199;
  static  unsigned long long aesl_llvm_cbe_2448_count = 0;
  unsigned int llvm_cbe_tmp__200;
  static  unsigned long long aesl_llvm_cbe_2449_count = 0;
  unsigned int llvm_cbe_tmp__201;
  static  unsigned long long aesl_llvm_cbe_2450_count = 0;
  unsigned int llvm_cbe_tmp__202;
  static  unsigned long long aesl_llvm_cbe_2451_count = 0;
  unsigned int llvm_cbe_tmp__203;
  static  unsigned long long aesl_llvm_cbe_2452_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_rec_count = 0;
  unsigned long long llvm_cbe__2e_rec;
  static  unsigned long long aesl_llvm_cbe_lftr_2e_wideiv_count = 0;
  unsigned int llvm_cbe_lftr_2e_wideiv;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_2453_count = 0;
  static  unsigned long long aesl_llvm_cbe_2454_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @ChenIDct\n");
  llvm_cbe_storemerge40__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__204;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__204:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge40 = phi i32 [ 0, %%0 ], [ %%107, %%1  for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_storemerge40_count);
  llvm_cbe_storemerge40 = (unsigned int )llvm_cbe_storemerge40__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge40 = 0x%X",llvm_cbe_storemerge40);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__106);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i32 %%storemerge40 to i64, !dbg !27 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_20_count);
  llvm_cbe_tmp__1 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge40);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__1);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds i32* %%x, i64 %%2, !dbg !27 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_21_count);
  llvm_cbe_tmp__2 = (signed int *)(&llvm_cbe_x[(((signed long long )llvm_cbe_tmp__1))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__1));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load i32* %%3, align 4, !dbg !29 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_74_count);
  llvm_cbe_tmp__3 = (unsigned int )*llvm_cbe_tmp__2;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__3);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = shl i32 %%4, 2, !dbg !29 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_75_count);
  llvm_cbe_tmp__4 = (unsigned int )llvm_cbe_tmp__3 << 2u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__4);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum13 = add i64 %%2, 8, !dbg !29 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe__2e_sum13_count);
  llvm_cbe__2e_sum13 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__1&18446744073709551615ull)) + ((unsigned long long )(8ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum13 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum13&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i32* %%x, i64 %%.sum13, !dbg !29 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_85_count);
  llvm_cbe_tmp__5 = (signed int *)(&llvm_cbe_x[(((signed long long )llvm_cbe__2e_sum13))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum13 = 0x%llX",((signed long long )llvm_cbe__2e_sum13));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i32* %%6, align 4, !dbg !29 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_138_count);
  llvm_cbe_tmp__6 = (unsigned int )*llvm_cbe_tmp__5;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__6);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = shl i32 %%7, 2, !dbg !29 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_139_count);
  llvm_cbe_tmp__7 = (unsigned int )llvm_cbe_tmp__6 << 2u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__7);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum14 = add i64 %%2, 16, !dbg !29 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe__2e_sum14_count);
  llvm_cbe__2e_sum14 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__1&18446744073709551615ull)) + ((unsigned long long )(16ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum14 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum14&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = getelementptr inbounds i32* %%x, i64 %%.sum14, !dbg !29 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_151_count);
  llvm_cbe_tmp__8 = (signed int *)(&llvm_cbe_x[(((signed long long )llvm_cbe__2e_sum14))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum14 = 0x%llX",((signed long long )llvm_cbe__2e_sum14));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = load i32* %%9, align 4, !dbg !29 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_204_count);
  llvm_cbe_tmp__9 = (unsigned int )*llvm_cbe_tmp__8;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__9);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = shl i32 %%10, 2, !dbg !29 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_205_count);
  llvm_cbe_tmp__10 = (unsigned int )llvm_cbe_tmp__9 << 2u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__10);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum15 = add i64 %%2, 24, !dbg !29 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe__2e_sum15_count);
  llvm_cbe__2e_sum15 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__1&18446744073709551615ull)) + ((unsigned long long )(24ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum15 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum15&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = getelementptr inbounds i32* %%x, i64 %%.sum15, !dbg !29 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_215_count);
  llvm_cbe_tmp__11 = (signed int *)(&llvm_cbe_x[(((signed long long )llvm_cbe__2e_sum15))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum15 = 0x%llX",((signed long long )llvm_cbe__2e_sum15));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i32* %%12, align 4, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_268_count);
  llvm_cbe_tmp__12 = (unsigned int )*llvm_cbe_tmp__11;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__12);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = shl i32 %%13, 2, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_269_count);
  llvm_cbe_tmp__13 = (unsigned int )llvm_cbe_tmp__12 << 2u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__13);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum16 = add i64 %%2, 32, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe__2e_sum16_count);
  llvm_cbe__2e_sum16 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__1&18446744073709551615ull)) + ((unsigned long long )(32ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum16 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum16&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = getelementptr inbounds i32* %%x, i64 %%.sum16, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_283_count);
  llvm_cbe_tmp__14 = (signed int *)(&llvm_cbe_x[(((signed long long )llvm_cbe__2e_sum16))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum16 = 0x%llX",((signed long long )llvm_cbe__2e_sum16));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = load i32* %%15, align 4, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_336_count);
  llvm_cbe_tmp__15 = (unsigned int )*llvm_cbe_tmp__14;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__15);
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = shl i32 %%16, 2, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_337_count);
  llvm_cbe_tmp__16 = (unsigned int )llvm_cbe_tmp__15 << 2u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__16);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum17 = add i64 %%2, 40, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe__2e_sum17_count);
  llvm_cbe__2e_sum17 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__1&18446744073709551615ull)) + ((unsigned long long )(40ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum17 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum17&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds i32* %%x, i64 %%.sum17, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_347_count);
  llvm_cbe_tmp__17 = (signed int *)(&llvm_cbe_x[(((signed long long )llvm_cbe__2e_sum17))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum17 = 0x%llX",((signed long long )llvm_cbe__2e_sum17));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = load i32* %%18, align 4, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_400_count);
  llvm_cbe_tmp__18 = (unsigned int )*llvm_cbe_tmp__17;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__18);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = shl i32 %%19, 2, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_401_count);
  llvm_cbe_tmp__19 = (unsigned int )llvm_cbe_tmp__18 << 2u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__19);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum18 = add i64 %%2, 48, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe__2e_sum18_count);
  llvm_cbe__2e_sum18 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__1&18446744073709551615ull)) + ((unsigned long long )(48ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum18 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum18&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = getelementptr inbounds i32* %%x, i64 %%.sum18, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_415_count);
  llvm_cbe_tmp__20 = (signed int *)(&llvm_cbe_x[(((signed long long )llvm_cbe__2e_sum18))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum18 = 0x%llX",((signed long long )llvm_cbe__2e_sum18));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = load i32* %%21, align 4, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_468_count);
  llvm_cbe_tmp__21 = (unsigned int )*llvm_cbe_tmp__20;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__21);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = shl i32 %%22, 2, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_469_count);
  llvm_cbe_tmp__22 = (unsigned int )llvm_cbe_tmp__21 << 2u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__22);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum19 = add i64 %%2, 56, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe__2e_sum19_count);
  llvm_cbe__2e_sum19 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__1&18446744073709551615ull)) + ((unsigned long long )(56ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum19 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum19&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = getelementptr inbounds i32* %%x, i64 %%.sum19, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_479_count);
  llvm_cbe_tmp__23 = (signed int *)(&llvm_cbe_x[(((signed long long )llvm_cbe__2e_sum19))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum19 = 0x%llX",((signed long long )llvm_cbe__2e_sum19));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = load i32* %%24, align 4, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_532_count);
  llvm_cbe_tmp__24 = (unsigned int )*llvm_cbe_tmp__23;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__24);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = shl i32 %%25, 2, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_533_count);
  llvm_cbe_tmp__25 = (unsigned int )llvm_cbe_tmp__24 << 2u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__25);
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = sext i32 %%8 to i64, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_545_count);
  llvm_cbe_tmp__26 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__7);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__26);
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = mul nsw i64 %%27, 100, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_546_count);
  llvm_cbe_tmp__27 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__26&18446744073709551615ull)) * ((unsigned long long )(100ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__27&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = sext i32 %%26 to i64, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_547_count);
  llvm_cbe_tmp__28 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__25);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__28);
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = mul i64 %%29, -502, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_548_count);
  llvm_cbe_tmp__29 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__28&18446744073709551615ull)) * ((unsigned long long )(18446744073709551114ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__29&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = add i64 %%30, %%28, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_549_count);
  llvm_cbe_tmp__30 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__29&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__27&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__30&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = lshr i64 %%31, 9, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_550_count);
  llvm_cbe_tmp__31 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__30&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__31&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = trunc i64 %%32 to i32, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_551_count);
  llvm_cbe_tmp__32 = (unsigned int )((unsigned int )llvm_cbe_tmp__31&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__32);
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = sext i32 %%20 to i64, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_561_count);
  llvm_cbe_tmp__33 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__19);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__33);
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = mul nsw i64 %%34, 426, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_562_count);
  llvm_cbe_tmp__34 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__33&18446744073709551615ull)) * ((unsigned long long )(426ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__34&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = sext i32 %%14 to i64, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_563_count);
  llvm_cbe_tmp__35 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__13);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__35);
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = mul i64 %%36, -284, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_564_count);
  llvm_cbe_tmp__36 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__35&18446744073709551615ull)) * ((unsigned long long )(18446744073709551332ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__36&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = add i64 %%35, %%37, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_565_count);
  llvm_cbe_tmp__37 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__34&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__36&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__37&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = lshr i64 %%38, 9, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_566_count);
  llvm_cbe_tmp__38 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__37&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__38&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = trunc i64 %%39 to i32, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_567_count);
  llvm_cbe_tmp__39 = (unsigned int )((unsigned int )llvm_cbe_tmp__38&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__39);
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = mul nsw i64 %%36, 426, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_577_count);
  llvm_cbe_tmp__40 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__35&18446744073709551615ull)) * ((unsigned long long )(426ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__40&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = mul nsw i64 %%34, 284, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_578_count);
  llvm_cbe_tmp__41 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__33&18446744073709551615ull)) * ((unsigned long long )(284ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__41&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = add nsw i64 %%42, %%41, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_579_count);
  llvm_cbe_tmp__42 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__41&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__40&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__42&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = lshr i64 %%43, 9, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_580_count);
  llvm_cbe_tmp__43 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__42&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__43&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = trunc i64 %%44 to i32, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_581_count);
  llvm_cbe_tmp__44 = (unsigned int )((unsigned int )llvm_cbe_tmp__43&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__44);
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = mul nsw i64 %%27, 502, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_591_count);
  llvm_cbe_tmp__45 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__26&18446744073709551615ull)) * ((unsigned long long )(502ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__45&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = mul nsw i64 %%29, 100, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_592_count);
  llvm_cbe_tmp__46 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__28&18446744073709551615ull)) * ((unsigned long long )(100ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__46&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = add nsw i64 %%47, %%46, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_593_count);
  llvm_cbe_tmp__47 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__46&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__45&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__47&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = lshr i64 %%48, 9, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_594_count);
  llvm_cbe_tmp__48 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__47&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__48&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = trunc i64 %%49 to i32, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_595_count);
  llvm_cbe_tmp__49 = (unsigned int )((unsigned int )llvm_cbe_tmp__48&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__49);
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = add nsw i32 %%17, %%5, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_605_count);
  llvm_cbe_tmp__50 = (unsigned int )((unsigned int )(llvm_cbe_tmp__16&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__4&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__50&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = sext i32 %%51 to i64, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_606_count);
  llvm_cbe_tmp__51 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__50);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__51);
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = mul nsw i64 %%52, 362, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_607_count);
  llvm_cbe_tmp__52 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__51&18446744073709551615ull)) * ((unsigned long long )(362ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__52&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = lshr i64 %%53, 9, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_608_count);
  llvm_cbe_tmp__53 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__52&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__53&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = trunc i64 %%54 to i32, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_609_count);
  llvm_cbe_tmp__54 = (unsigned int )((unsigned int )llvm_cbe_tmp__53&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__54);
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = sub nsw i32 %%5, %%17, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_621_count);
  llvm_cbe_tmp__55 = (unsigned int )((unsigned int )(llvm_cbe_tmp__4&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__16&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__55&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = sext i32 %%56 to i64, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_622_count);
  llvm_cbe_tmp__56 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__55);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__56);
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = mul nsw i64 %%57, 362, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_623_count);
  llvm_cbe_tmp__57 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__56&18446744073709551615ull)) * ((unsigned long long )(362ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__57&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = lshr i64 %%58, 9, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_624_count);
  llvm_cbe_tmp__58 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__57&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__58&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = trunc i64 %%59 to i32, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_625_count);
  llvm_cbe_tmp__59 = (unsigned int )((unsigned int )llvm_cbe_tmp__58&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__59);
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = sext i32 %%11 to i64, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_639_count);
  llvm_cbe_tmp__60 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__10);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__60);
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = mul nsw i64 %%61, 196, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_640_count);
  llvm_cbe_tmp__61 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__60&18446744073709551615ull)) * ((unsigned long long )(196ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__61&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = sext i32 %%23 to i64, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_641_count);
  llvm_cbe_tmp__62 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__22);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__62);
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = mul i64 %%63, -473, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_642_count);
  llvm_cbe_tmp__63 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__62&18446744073709551615ull)) * ((unsigned long long )(18446744073709551143ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__63&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = add i64 %%64, %%62, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_643_count);
  llvm_cbe_tmp__64 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__63&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__61&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__64&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = lshr i64 %%65, 9, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_644_count);
  llvm_cbe_tmp__65 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__64&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__65&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = trunc i64 %%66 to i32, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_645_count);
  llvm_cbe_tmp__66 = (unsigned int )((unsigned int )llvm_cbe_tmp__65&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__66);
if (AESL_DEBUG_TRACE)
printf("\n  %%68 = mul nsw i64 %%61, 473, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_659_count);
  llvm_cbe_tmp__67 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__60&18446744073709551615ull)) * ((unsigned long long )(473ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__67&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = mul nsw i64 %%63, 196, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_660_count);
  llvm_cbe_tmp__68 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__62&18446744073709551615ull)) * ((unsigned long long )(196ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__68&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = add nsw i64 %%69, %%68, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_661_count);
  llvm_cbe_tmp__69 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__68&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__67&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__69&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = lshr i64 %%70, 9, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_662_count);
  llvm_cbe_tmp__70 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__69&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__70&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%72 = trunc i64 %%71 to i32, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_663_count);
  llvm_cbe_tmp__71 = (unsigned int )((unsigned int )llvm_cbe_tmp__70&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__71);
if (AESL_DEBUG_TRACE)
printf("\n  %%73 = add nsw i32 %%72, %%55, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_675_count);
  llvm_cbe_tmp__72 = (unsigned int )((unsigned int )(llvm_cbe_tmp__71&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__54&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__72&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = add nsw i32 %%67, %%60, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_685_count);
  llvm_cbe_tmp__73 = (unsigned int )((unsigned int )(llvm_cbe_tmp__66&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__59&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__73&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%75 = sub nsw i32 %%60, %%67, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_695_count);
  llvm_cbe_tmp__74 = (unsigned int )((unsigned int )(llvm_cbe_tmp__59&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__66&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__74&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%76 = sub nsw i32 %%55, %%72, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_705_count);
  llvm_cbe_tmp__75 = (unsigned int )((unsigned int )(llvm_cbe_tmp__54&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__71&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__75&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%77 = add nsw i32 %%33, %%40, !dbg !38 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_715_count);
  llvm_cbe_tmp__76 = (unsigned int )((unsigned int )(llvm_cbe_tmp__32&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__39&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__76&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%78 = sub nsw i32 %%33, %%40, !dbg !38 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_727_count);
  llvm_cbe_tmp__77 = (unsigned int )((unsigned int )(llvm_cbe_tmp__32&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__39&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__77&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%79 = sub nsw i32 %%50, %%45, !dbg !38 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_741_count);
  llvm_cbe_tmp__78 = (unsigned int )((unsigned int )(llvm_cbe_tmp__49&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__44&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__78&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%80 = add nsw i32 %%50, %%45, !dbg !38 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_755_count);
  llvm_cbe_tmp__79 = (unsigned int )((unsigned int )(llvm_cbe_tmp__49&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__44&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__79&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%81 = sub nsw i32 %%79, %%78, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_776_count);
  llvm_cbe_tmp__80 = (unsigned int )((unsigned int )(llvm_cbe_tmp__78&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__77&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__80&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%82 = sext i32 %%81 to i64, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_777_count);
  llvm_cbe_tmp__81 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__80);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__81);
if (AESL_DEBUG_TRACE)
printf("\n  %%83 = mul nsw i64 %%82, 362, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_778_count);
  llvm_cbe_tmp__82 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__81&18446744073709551615ull)) * ((unsigned long long )(362ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__82&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%84 = lshr i64 %%83, 9, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_779_count);
  llvm_cbe_tmp__83 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__82&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__83&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%85 = trunc i64 %%84 to i32, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_780_count);
  llvm_cbe_tmp__84 = (unsigned int )((unsigned int )llvm_cbe_tmp__83&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__84);
if (AESL_DEBUG_TRACE)
printf("\n  %%86 = add nsw i32 %%79, %%78, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_790_count);
  llvm_cbe_tmp__85 = (unsigned int )((unsigned int )(llvm_cbe_tmp__78&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__77&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__85&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%87 = sext i32 %%86 to i64, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_791_count);
  llvm_cbe_tmp__86 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__85);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__86);
if (AESL_DEBUG_TRACE)
printf("\n  %%88 = mul nsw i64 %%87, 362, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_792_count);
  llvm_cbe_tmp__87 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__86&18446744073709551615ull)) * ((unsigned long long )(362ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__87&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%89 = lshr i64 %%88, 9, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_793_count);
  llvm_cbe_tmp__88 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__87&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__88&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%90 = trunc i64 %%89 to i32, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_794_count);
  llvm_cbe_tmp__89 = (unsigned int )((unsigned int )llvm_cbe_tmp__88&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__89);
if (AESL_DEBUG_TRACE)
printf("\n  %%91 = getelementptr inbounds i32* %%y, i64 %%2, !dbg !28 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_813_count);
  llvm_cbe_tmp__90 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe_tmp__1))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__1));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%92 = add nsw i32 %%80, %%73, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_866_count);
  llvm_cbe_tmp__91 = (unsigned int )((unsigned int )(llvm_cbe_tmp__79&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__72&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__91&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%92, i32* %%91, align 4, !dbg !30 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_867_count);
  *llvm_cbe_tmp__90 = llvm_cbe_tmp__91;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__91);
if (AESL_DEBUG_TRACE)
printf("\n  %%93 = getelementptr inbounds i32* %%y, i64 %%.sum13, !dbg !31 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_868_count);
  llvm_cbe_tmp__92 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe__2e_sum13))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum13 = 0x%llX",((signed long long )llvm_cbe__2e_sum13));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%94 = add nsw i32 %%90, %%74, !dbg !31 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_921_count);
  llvm_cbe_tmp__93 = (unsigned int )((unsigned int )(llvm_cbe_tmp__89&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__73&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__93&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%94, i32* %%93, align 4, !dbg !31 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_922_count);
  *llvm_cbe_tmp__92 = llvm_cbe_tmp__93;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__93);
if (AESL_DEBUG_TRACE)
printf("\n  %%95 = getelementptr inbounds i32* %%y, i64 %%.sum14, !dbg !31 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_923_count);
  llvm_cbe_tmp__94 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe__2e_sum14))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum14 = 0x%llX",((signed long long )llvm_cbe__2e_sum14));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%96 = add nsw i32 %%85, %%75, !dbg !31 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_976_count);
  llvm_cbe_tmp__95 = (unsigned int )((unsigned int )(llvm_cbe_tmp__84&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__74&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__95&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%96, i32* %%95, align 4, !dbg !31 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_977_count);
  *llvm_cbe_tmp__94 = llvm_cbe_tmp__95;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__95);
if (AESL_DEBUG_TRACE)
printf("\n  %%97 = getelementptr inbounds i32* %%y, i64 %%.sum15, !dbg !31 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_978_count);
  llvm_cbe_tmp__96 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe__2e_sum15))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum15 = 0x%llX",((signed long long )llvm_cbe__2e_sum15));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%98 = add nsw i32 %%77, %%76, !dbg !31 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1031_count);
  llvm_cbe_tmp__97 = (unsigned int )((unsigned int )(llvm_cbe_tmp__76&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__75&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__97&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%98, i32* %%97, align 4, !dbg !31 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1032_count);
  *llvm_cbe_tmp__96 = llvm_cbe_tmp__97;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__97);
if (AESL_DEBUG_TRACE)
printf("\n  %%99 = getelementptr inbounds i32* %%y, i64 %%.sum16, !dbg !31 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1033_count);
  llvm_cbe_tmp__98 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe__2e_sum16))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum16 = 0x%llX",((signed long long )llvm_cbe__2e_sum16));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%100 = sub nsw i32 %%76, %%77, !dbg !31 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1086_count);
  llvm_cbe_tmp__99 = (unsigned int )((unsigned int )(llvm_cbe_tmp__75&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__76&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__99&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%100, i32* %%99, align 4, !dbg !31 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1087_count);
  *llvm_cbe_tmp__98 = llvm_cbe_tmp__99;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__99);
if (AESL_DEBUG_TRACE)
printf("\n  %%101 = getelementptr inbounds i32* %%y, i64 %%.sum17, !dbg !31 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1088_count);
  llvm_cbe_tmp__100 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe__2e_sum17))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum17 = 0x%llX",((signed long long )llvm_cbe__2e_sum17));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%102 = sub nsw i32 %%75, %%85, !dbg !31 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1141_count);
  llvm_cbe_tmp__101 = (unsigned int )((unsigned int )(llvm_cbe_tmp__74&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__84&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__101&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%102, i32* %%101, align 4, !dbg !31 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1142_count);
  *llvm_cbe_tmp__100 = llvm_cbe_tmp__101;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__101);
if (AESL_DEBUG_TRACE)
printf("\n  %%103 = getelementptr inbounds i32* %%y, i64 %%.sum18, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1143_count);
  llvm_cbe_tmp__102 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe__2e_sum18))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum18 = 0x%llX",((signed long long )llvm_cbe__2e_sum18));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%104 = sub nsw i32 %%74, %%90, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1196_count);
  llvm_cbe_tmp__103 = (unsigned int )((unsigned int )(llvm_cbe_tmp__73&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__89&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__103&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%104, i32* %%103, align 4, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1197_count);
  *llvm_cbe_tmp__102 = llvm_cbe_tmp__103;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__103);
if (AESL_DEBUG_TRACE)
printf("\n  %%105 = getelementptr inbounds i32* %%y, i64 %%.sum19, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1198_count);
  llvm_cbe_tmp__104 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe__2e_sum19))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum19 = 0x%llX",((signed long long )llvm_cbe__2e_sum19));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%106 = sub nsw i32 %%73, %%80, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1251_count);
  llvm_cbe_tmp__105 = (unsigned int )((unsigned int )(llvm_cbe_tmp__72&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__79&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__105&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%106, i32* %%105, align 4, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1252_count);
  *llvm_cbe_tmp__104 = llvm_cbe_tmp__105;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__105);
if (AESL_DEBUG_TRACE)
printf("\n  %%107 = add nsw i32 %%storemerge40, 1, !dbg !28 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1253_count);
  llvm_cbe_tmp__106 = (unsigned int )((unsigned int )(llvm_cbe_storemerge40&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__106&4294967295ull)));
  if (((llvm_cbe_tmp__106&4294967295U) == (8u&4294967295U))) {
    llvm_cbe_storemerge139__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_preheader38;
  } else {
    llvm_cbe_storemerge40__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__106;   /* for PHI node */
    goto llvm_cbe_tmp__204;
  }

  } while (1); /* end of syntactic loop '' */
  do {     /* Syntactic loop '.preheader38' to make GCC happy */
llvm_cbe__2e_preheader38:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge139 = phi i32 [ %%198, %%.preheader38 ], [ 0, %%1  for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_storemerge139_count);
  llvm_cbe_storemerge139 = (unsigned int )llvm_cbe_storemerge139__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge139 = 0x%X",llvm_cbe_storemerge139);
printf("\n = 0x%X",llvm_cbe_tmp__197);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%108 = shl i32 %%storemerge139, 3, !dbg !28 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1266_count);
  llvm_cbe_tmp__107 = (unsigned int )llvm_cbe_storemerge139 << 3u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__107);
if (AESL_DEBUG_TRACE)
printf("\n  %%109 = sext i32 %%108 to i64, !dbg !28 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1267_count);
  llvm_cbe_tmp__108 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__107);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__108);
if (AESL_DEBUG_TRACE)
printf("\n  %%110 = getelementptr inbounds i32* %%y, i64 %%109, !dbg !28 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1268_count);
  llvm_cbe_tmp__109 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe_tmp__108))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__108));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum3 = or i64 %%109, 1, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe__2e_sum3_count);
  llvm_cbe__2e_sum3 = (unsigned long long )llvm_cbe_tmp__108 | 1ull;
if (AESL_DEBUG_TRACE)
printf("\n.sum3 = 0x%llX\n", llvm_cbe__2e_sum3);
if (AESL_DEBUG_TRACE)
printf("\n  %%111 = getelementptr inbounds i32* %%y, i64 %%.sum3, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1270_count);
  llvm_cbe_tmp__110 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe__2e_sum3))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum3 = 0x%llX",((signed long long )llvm_cbe__2e_sum3));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%112 = load i32* %%110, align 4, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1323_count);
  llvm_cbe_tmp__111 = (unsigned int )*llvm_cbe_tmp__109;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__111);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum = add i64 %%.sum3, 1, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe__2e_sum_count);
  llvm_cbe__2e_sum = (unsigned long long )((unsigned long long )(llvm_cbe__2e_sum3&18446744073709551615ull)) + ((unsigned long long )(1ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%113 = getelementptr inbounds i32* %%y, i64 %%.sum, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1333_count);
  llvm_cbe_tmp__112 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe__2e_sum))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum = 0x%llX",((signed long long )llvm_cbe__2e_sum));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%114 = load i32* %%111, align 4, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1386_count);
  llvm_cbe_tmp__113 = (unsigned int )*llvm_cbe_tmp__110;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__113);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum45 = or i64 %%109, 3, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe__2e_sum45_count);
  llvm_cbe__2e_sum45 = (unsigned long long )llvm_cbe_tmp__108 | 3ull;
if (AESL_DEBUG_TRACE)
printf("\n.sum45 = 0x%llX\n", llvm_cbe__2e_sum45);
if (AESL_DEBUG_TRACE)
printf("\n  %%115 = getelementptr inbounds i32* %%y, i64 %%.sum45, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1398_count);
  llvm_cbe_tmp__114 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe__2e_sum45))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum45 = 0x%llX",((signed long long )llvm_cbe__2e_sum45));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%116 = load i32* %%113, align 4, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1451_count);
  llvm_cbe_tmp__115 = (unsigned int )*llvm_cbe_tmp__112;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__115);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum6 = add i64 %%.sum45, 1, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe__2e_sum6_count);
  llvm_cbe__2e_sum6 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_sum45&18446744073709551615ull)) + ((unsigned long long )(1ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum6 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum6&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%117 = getelementptr inbounds i32* %%y, i64 %%.sum6, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1461_count);
  llvm_cbe_tmp__116 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe__2e_sum6))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum6 = 0x%llX",((signed long long )llvm_cbe__2e_sum6));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%118 = load i32* %%115, align 4, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1514_count);
  llvm_cbe_tmp__117 = (unsigned int )*llvm_cbe_tmp__114;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__117);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum7 = add i64 %%.sum45, 2, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe__2e_sum7_count);
  llvm_cbe__2e_sum7 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_sum45&18446744073709551615ull)) + ((unsigned long long )(2ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum7 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum7&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%119 = getelementptr inbounds i32* %%y, i64 %%.sum7, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1528_count);
  llvm_cbe_tmp__118 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe__2e_sum7))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum7 = 0x%llX",((signed long long )llvm_cbe__2e_sum7));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%120 = load i32* %%117, align 4, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1581_count);
  llvm_cbe_tmp__119 = (unsigned int )*llvm_cbe_tmp__116;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__119);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum8 = add i64 %%.sum45, 3, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe__2e_sum8_count);
  llvm_cbe__2e_sum8 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_sum45&18446744073709551615ull)) + ((unsigned long long )(3ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum8 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum8&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%121 = getelementptr inbounds i32* %%y, i64 %%.sum8, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1591_count);
  llvm_cbe_tmp__120 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe__2e_sum8))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum8 = 0x%llX",((signed long long )llvm_cbe__2e_sum8));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%122 = load i32* %%119, align 4, !dbg !32 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1644_count);
  llvm_cbe_tmp__121 = (unsigned int )*llvm_cbe_tmp__118;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__121);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum910 = or i64 %%109, 7, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe__2e_sum910_count);
  llvm_cbe__2e_sum910 = (unsigned long long )llvm_cbe_tmp__108 | 7ull;
if (AESL_DEBUG_TRACE)
printf("\n.sum910 = 0x%llX\n", llvm_cbe__2e_sum910);
if (AESL_DEBUG_TRACE)
printf("\n  %%123 = getelementptr inbounds i32* %%y, i64 %%.sum910, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1658_count);
  llvm_cbe_tmp__122 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe__2e_sum910))]);
if (AESL_DEBUG_TRACE) {
printf("\n.sum910 = 0x%llX",((signed long long )llvm_cbe__2e_sum910));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%124 = load i32* %%121, align 4, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1711_count);
  llvm_cbe_tmp__123 = (unsigned int )*llvm_cbe_tmp__120;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__123);
if (AESL_DEBUG_TRACE)
printf("\n  %%125 = load i32* %%123, align 4, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1721_count);
  llvm_cbe_tmp__124 = (unsigned int )*llvm_cbe_tmp__122;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__124);
if (AESL_DEBUG_TRACE)
printf("\n  %%126 = sext i32 %%114 to i64, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1733_count);
  llvm_cbe_tmp__125 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__113);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__125);
if (AESL_DEBUG_TRACE)
printf("\n  %%127 = mul nsw i64 %%126, 100, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1734_count);
  llvm_cbe_tmp__126 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__125&18446744073709551615ull)) * ((unsigned long long )(100ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__126&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%128 = sext i32 %%125 to i64, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1735_count);
  llvm_cbe_tmp__127 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__124);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__127);
if (AESL_DEBUG_TRACE)
printf("\n  %%129 = mul i64 %%128, -502, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1736_count);
  llvm_cbe_tmp__128 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__127&18446744073709551615ull)) * ((unsigned long long )(18446744073709551114ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__128&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%130 = add i64 %%129, %%127, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1737_count);
  llvm_cbe_tmp__129 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__128&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__126&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__129&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%131 = lshr i64 %%130, 9, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1738_count);
  llvm_cbe_tmp__130 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__129&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__130&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%132 = trunc i64 %%131 to i32, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1739_count);
  llvm_cbe_tmp__131 = (unsigned int )((unsigned int )llvm_cbe_tmp__130&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__131);
if (AESL_DEBUG_TRACE)
printf("\n  %%133 = sext i32 %%122 to i64, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1749_count);
  llvm_cbe_tmp__132 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__121);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__132);
if (AESL_DEBUG_TRACE)
printf("\n  %%134 = mul nsw i64 %%133, 426, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1750_count);
  llvm_cbe_tmp__133 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__132&18446744073709551615ull)) * ((unsigned long long )(426ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__133&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%135 = sext i32 %%118 to i64, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1751_count);
  llvm_cbe_tmp__134 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__117);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__134);
if (AESL_DEBUG_TRACE)
printf("\n  %%136 = mul i64 %%135, -284, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1752_count);
  llvm_cbe_tmp__135 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__134&18446744073709551615ull)) * ((unsigned long long )(18446744073709551332ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__135&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%137 = add i64 %%134, %%136, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1753_count);
  llvm_cbe_tmp__136 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__133&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__135&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__136&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%138 = lshr i64 %%137, 9, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1754_count);
  llvm_cbe_tmp__137 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__136&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__137&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%139 = trunc i64 %%138 to i32, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1755_count);
  llvm_cbe_tmp__138 = (unsigned int )((unsigned int )llvm_cbe_tmp__137&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__138);
if (AESL_DEBUG_TRACE)
printf("\n  %%140 = mul nsw i64 %%135, 426, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1765_count);
  llvm_cbe_tmp__139 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__134&18446744073709551615ull)) * ((unsigned long long )(426ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__139&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%141 = mul nsw i64 %%133, 284, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1766_count);
  llvm_cbe_tmp__140 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__132&18446744073709551615ull)) * ((unsigned long long )(284ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__140&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%142 = add nsw i64 %%141, %%140, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1767_count);
  llvm_cbe_tmp__141 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__140&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__139&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__141&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%143 = lshr i64 %%142, 9, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1768_count);
  llvm_cbe_tmp__142 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__141&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__142&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%144 = trunc i64 %%143 to i32, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1769_count);
  llvm_cbe_tmp__143 = (unsigned int )((unsigned int )llvm_cbe_tmp__142&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__143);
if (AESL_DEBUG_TRACE)
printf("\n  %%145 = mul nsw i64 %%126, 502, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1779_count);
  llvm_cbe_tmp__144 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__125&18446744073709551615ull)) * ((unsigned long long )(502ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__144&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%146 = mul nsw i64 %%128, 100, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1780_count);
  llvm_cbe_tmp__145 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__127&18446744073709551615ull)) * ((unsigned long long )(100ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__145&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%147 = add nsw i64 %%146, %%145, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1781_count);
  llvm_cbe_tmp__146 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__145&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__144&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__146&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%148 = lshr i64 %%147, 9, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1782_count);
  llvm_cbe_tmp__147 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__146&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__147&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%149 = trunc i64 %%148 to i32, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1783_count);
  llvm_cbe_tmp__148 = (unsigned int )((unsigned int )llvm_cbe_tmp__147&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__148);
if (AESL_DEBUG_TRACE)
printf("\n  %%150 = add nsw i32 %%120, %%112, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1793_count);
  llvm_cbe_tmp__149 = (unsigned int )((unsigned int )(llvm_cbe_tmp__119&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__111&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__149&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%151 = sext i32 %%150 to i64, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1794_count);
  llvm_cbe_tmp__150 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__149);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__150);
if (AESL_DEBUG_TRACE)
printf("\n  %%152 = mul nsw i64 %%151, 362, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1795_count);
  llvm_cbe_tmp__151 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__150&18446744073709551615ull)) * ((unsigned long long )(362ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__151&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%153 = lshr i64 %%152, 9, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1796_count);
  llvm_cbe_tmp__152 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__151&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__152&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%154 = trunc i64 %%153 to i32, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1797_count);
  llvm_cbe_tmp__153 = (unsigned int )((unsigned int )llvm_cbe_tmp__152&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__153);
if (AESL_DEBUG_TRACE)
printf("\n  %%155 = sub nsw i32 %%112, %%120, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1809_count);
  llvm_cbe_tmp__154 = (unsigned int )((unsigned int )(llvm_cbe_tmp__111&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__119&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__154&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%156 = sext i32 %%155 to i64, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1810_count);
  llvm_cbe_tmp__155 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__154);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__155);
if (AESL_DEBUG_TRACE)
printf("\n  %%157 = mul nsw i64 %%156, 362, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1811_count);
  llvm_cbe_tmp__156 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__155&18446744073709551615ull)) * ((unsigned long long )(362ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__156&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%158 = lshr i64 %%157, 9, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1812_count);
  llvm_cbe_tmp__157 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__156&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__157&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%159 = trunc i64 %%158 to i32, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1813_count);
  llvm_cbe_tmp__158 = (unsigned int )((unsigned int )llvm_cbe_tmp__157&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__158);
if (AESL_DEBUG_TRACE)
printf("\n  %%160 = sext i32 %%116 to i64, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1827_count);
  llvm_cbe_tmp__159 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__115);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__159);
if (AESL_DEBUG_TRACE)
printf("\n  %%161 = mul nsw i64 %%160, 196, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1828_count);
  llvm_cbe_tmp__160 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__159&18446744073709551615ull)) * ((unsigned long long )(196ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__160&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%162 = sext i32 %%124 to i64, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1829_count);
  llvm_cbe_tmp__161 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__123);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__161);
if (AESL_DEBUG_TRACE)
printf("\n  %%163 = mul i64 %%162, -473, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1830_count);
  llvm_cbe_tmp__162 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__161&18446744073709551615ull)) * ((unsigned long long )(18446744073709551143ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__162&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%164 = add i64 %%163, %%161, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1831_count);
  llvm_cbe_tmp__163 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__162&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__160&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__163&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%165 = lshr i64 %%164, 9, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1832_count);
  llvm_cbe_tmp__164 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__163&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__164&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%166 = trunc i64 %%165 to i32, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1833_count);
  llvm_cbe_tmp__165 = (unsigned int )((unsigned int )llvm_cbe_tmp__164&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__165);
if (AESL_DEBUG_TRACE)
printf("\n  %%167 = mul nsw i64 %%160, 473, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1847_count);
  llvm_cbe_tmp__166 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__159&18446744073709551615ull)) * ((unsigned long long )(473ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__166&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%168 = mul nsw i64 %%162, 196, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1848_count);
  llvm_cbe_tmp__167 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__161&18446744073709551615ull)) * ((unsigned long long )(196ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__167&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%169 = add nsw i64 %%168, %%167, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1849_count);
  llvm_cbe_tmp__168 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__167&18446744073709551615ull)) + ((unsigned long long )(llvm_cbe_tmp__166&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__168&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%170 = lshr i64 %%169, 9, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1850_count);
  llvm_cbe_tmp__169 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__168&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__169&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%171 = trunc i64 %%170 to i32, !dbg !36 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1851_count);
  llvm_cbe_tmp__170 = (unsigned int )((unsigned int )llvm_cbe_tmp__169&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__170);
if (AESL_DEBUG_TRACE)
printf("\n  %%172 = add nsw i32 %%171, %%154, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1863_count);
  llvm_cbe_tmp__171 = (unsigned int )((unsigned int )(llvm_cbe_tmp__170&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__153&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__171&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%173 = add nsw i32 %%166, %%159, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1873_count);
  llvm_cbe_tmp__172 = (unsigned int )((unsigned int )(llvm_cbe_tmp__165&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__158&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__172&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%174 = sub nsw i32 %%159, %%166, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1883_count);
  llvm_cbe_tmp__173 = (unsigned int )((unsigned int )(llvm_cbe_tmp__158&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__165&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__173&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%175 = sub nsw i32 %%154, %%171, !dbg !35 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1893_count);
  llvm_cbe_tmp__174 = (unsigned int )((unsigned int )(llvm_cbe_tmp__153&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__170&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__174&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%176 = add nsw i32 %%132, %%139, !dbg !38 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1903_count);
  llvm_cbe_tmp__175 = (unsigned int )((unsigned int )(llvm_cbe_tmp__131&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__138&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__175&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%177 = sub nsw i32 %%132, %%139, !dbg !38 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1915_count);
  llvm_cbe_tmp__176 = (unsigned int )((unsigned int )(llvm_cbe_tmp__131&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__138&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__176&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%178 = sub nsw i32 %%149, %%144, !dbg !39 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1929_count);
  llvm_cbe_tmp__177 = (unsigned int )((unsigned int )(llvm_cbe_tmp__148&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__143&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__177&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%179 = add nsw i32 %%149, %%144, !dbg !39 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1943_count);
  llvm_cbe_tmp__178 = (unsigned int )((unsigned int )(llvm_cbe_tmp__148&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__143&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__178&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%180 = sub nsw i32 %%178, %%177, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1964_count);
  llvm_cbe_tmp__179 = (unsigned int )((unsigned int )(llvm_cbe_tmp__177&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__176&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__179&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%181 = sext i32 %%180 to i64, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1965_count);
  llvm_cbe_tmp__180 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__179);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__180);
if (AESL_DEBUG_TRACE)
printf("\n  %%182 = mul nsw i64 %%181, 362, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1966_count);
  llvm_cbe_tmp__181 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__180&18446744073709551615ull)) * ((unsigned long long )(362ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__181&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%183 = lshr i64 %%182, 9, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1967_count);
  llvm_cbe_tmp__182 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__181&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__182&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%184 = trunc i64 %%183 to i32, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1968_count);
  llvm_cbe_tmp__183 = (unsigned int )((unsigned int )llvm_cbe_tmp__182&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__183);
if (AESL_DEBUG_TRACE)
printf("\n  %%185 = add nsw i32 %%178, %%177, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1978_count);
  llvm_cbe_tmp__184 = (unsigned int )((unsigned int )(llvm_cbe_tmp__177&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__176&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__184&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%186 = sext i32 %%185 to i64, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1979_count);
  llvm_cbe_tmp__185 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__184);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__185);
if (AESL_DEBUG_TRACE)
printf("\n  %%187 = mul nsw i64 %%186, 362, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1980_count);
  llvm_cbe_tmp__186 = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__185&18446744073709551615ull)) * ((unsigned long long )(362ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__186&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%188 = lshr i64 %%187, 9, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1981_count);
  llvm_cbe_tmp__187 = (unsigned long long )((unsigned long long )(((unsigned long long )(llvm_cbe_tmp__186&18446744073709551615ull)) >> ((unsigned long long )(9ull&18446744073709551615ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", ((unsigned long long )(llvm_cbe_tmp__187&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%189 = trunc i64 %%188 to i32, !dbg !37 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_1982_count);
  llvm_cbe_tmp__188 = (unsigned int )((unsigned int )llvm_cbe_tmp__187&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__188);
if (AESL_DEBUG_TRACE)
printf("\n  %%190 = add nsw i32 %%179, %%172, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2053_count);
  llvm_cbe_tmp__189 = (unsigned int )((unsigned int )(llvm_cbe_tmp__178&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__171&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__189&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%190, i32* %%110, align 4, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2106_count);
  *llvm_cbe_tmp__109 = llvm_cbe_tmp__189;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__189);
if (AESL_DEBUG_TRACE)
printf("\n  %%191 = add nsw i32 %%189, %%173, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2107_count);
  llvm_cbe_tmp__190 = (unsigned int )((unsigned int )(llvm_cbe_tmp__188&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__172&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__190&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%191, i32* %%111, align 4, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2160_count);
  *llvm_cbe_tmp__110 = llvm_cbe_tmp__190;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__190);
if (AESL_DEBUG_TRACE)
printf("\n  %%192 = add nsw i32 %%184, %%174, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2161_count);
  llvm_cbe_tmp__191 = (unsigned int )((unsigned int )(llvm_cbe_tmp__183&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__173&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__191&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%192, i32* %%113, align 4, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2214_count);
  *llvm_cbe_tmp__112 = llvm_cbe_tmp__191;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__191);
if (AESL_DEBUG_TRACE)
printf("\n  %%193 = add nsw i32 %%176, %%175, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2215_count);
  llvm_cbe_tmp__192 = (unsigned int )((unsigned int )(llvm_cbe_tmp__175&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__174&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__192&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%193, i32* %%115, align 4, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2268_count);
  *llvm_cbe_tmp__114 = llvm_cbe_tmp__192;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__192);
if (AESL_DEBUG_TRACE)
printf("\n  %%194 = sub nsw i32 %%175, %%176, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2269_count);
  llvm_cbe_tmp__193 = (unsigned int )((unsigned int )(llvm_cbe_tmp__174&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__175&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__193&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%194, i32* %%117, align 4, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2322_count);
  *llvm_cbe_tmp__116 = llvm_cbe_tmp__193;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__193);
if (AESL_DEBUG_TRACE)
printf("\n  %%195 = sub nsw i32 %%174, %%184, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2323_count);
  llvm_cbe_tmp__194 = (unsigned int )((unsigned int )(llvm_cbe_tmp__173&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__183&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__194&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%195, i32* %%119, align 4, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2376_count);
  *llvm_cbe_tmp__118 = llvm_cbe_tmp__194;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__194);
if (AESL_DEBUG_TRACE)
printf("\n  %%196 = sub nsw i32 %%173, %%189, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2377_count);
  llvm_cbe_tmp__195 = (unsigned int )((unsigned int )(llvm_cbe_tmp__172&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__188&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__195&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%196, i32* %%121, align 4, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2430_count);
  *llvm_cbe_tmp__120 = llvm_cbe_tmp__195;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__195);
if (AESL_DEBUG_TRACE)
printf("\n  %%197 = sub nsw i32 %%172, %%179, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2431_count);
  llvm_cbe_tmp__196 = (unsigned int )((unsigned int )(llvm_cbe_tmp__171&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__178&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__196&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%197, i32* %%123, align 4, !dbg !33 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2432_count);
  *llvm_cbe_tmp__122 = llvm_cbe_tmp__196;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__196);
if (AESL_DEBUG_TRACE)
printf("\n  %%198 = add nsw i32 %%storemerge139, 1, !dbg !29 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2433_count);
  llvm_cbe_tmp__197 = (unsigned int )((unsigned int )(llvm_cbe_storemerge139&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__197&4294967295ull)));
  if (((llvm_cbe_tmp__197&4294967295U) == (8u&4294967295U))) {
    llvm_cbe_storemerge237_2e_rec__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  } else {
    llvm_cbe_storemerge139__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__197;   /* for PHI node */
    goto llvm_cbe__2e_preheader38;
  }

  } while (1); /* end of syntactic loop '.preheader38' */
  do {     /* Syntactic loop '.preheader' to make GCC happy */
llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge237.rec = phi i64 [ %%.rec, %%.preheader ], [ 0, %%.preheader38  for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_storemerge237_2e_rec_count);
  llvm_cbe_storemerge237_2e_rec = (unsigned long long )llvm_cbe_storemerge237_2e_rec__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge237.rec = 0x%llX",llvm_cbe_storemerge237_2e_rec);
printf("\n.rec = 0x%llX",llvm_cbe__2e_rec);
printf("\n = 0x%llX",0ull);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge237 = getelementptr i32* %%y, i64 %%storemerge237.re for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_storemerge237_count);
  llvm_cbe_storemerge237 = (signed int *)(&llvm_cbe_y[(((signed long long )llvm_cbe_storemerge237_2e_rec))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge237.rec = 0x%llX",((signed long long )llvm_cbe_storemerge237_2e_rec));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%199 = load i32* %%storemerge237, align 4, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2446_count);
  llvm_cbe_tmp__198 = (unsigned int )*llvm_cbe_storemerge237;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__198);
if (AESL_DEBUG_TRACE)
printf("\n  %%200 = ashr i32 %%199, 31, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2447_count);
  llvm_cbe_tmp__199 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__198) >> ((signed int )31u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__199));
if (AESL_DEBUG_TRACE)
printf("\n  %%201 = and i32 %%200, -16, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2448_count);
  llvm_cbe_tmp__200 = (unsigned int )llvm_cbe_tmp__199 & 4294967280u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__200);
if (AESL_DEBUG_TRACE)
printf("\n  %%202 = or i32 %%201, 8, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2449_count);
  llvm_cbe_tmp__201 = (unsigned int )llvm_cbe_tmp__200 | 8u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__201);
if (AESL_DEBUG_TRACE)
printf("\n  %%203 = add i32 %%202, %%199, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2450_count);
  llvm_cbe_tmp__202 = (unsigned int )((unsigned int )(llvm_cbe_tmp__201&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__198&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__202&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%204 = sdiv i32 %%203, 16, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2451_count);
  llvm_cbe_tmp__203 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__202) / ((signed int )16u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__203));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%204, i32* %%storemerge237, align 4, !dbg !34 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_2452_count);
  *llvm_cbe_storemerge237 = llvm_cbe_tmp__203;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__203);
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec = add i64 %%storemerge237.rec, 1, !dbg !29 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe__2e_rec_count);
  llvm_cbe__2e_rec = (unsigned long long )((unsigned long long )(llvm_cbe_storemerge237_2e_rec&18446744073709551615ull)) + ((unsigned long long )(1ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.rec = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_rec&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%lftr.wideiv = trunc i64 %%.rec to i32, !dbg !28 for 0x%llxth hint within @ChenIDct  --> \n", ++aesl_llvm_cbe_lftr_2e_wideiv_count);
  llvm_cbe_lftr_2e_wideiv = (unsigned int )((unsigned int )llvm_cbe__2e_rec&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\nlftr.wideiv = 0x%X\n", llvm_cbe_lftr_2e_wideiv);
  if (((llvm_cbe_lftr_2e_wideiv&4294967295U) == (64u&4294967295U))) {
    goto llvm_cbe_tmp__205;
  } else {
    llvm_cbe_storemerge237_2e_rec__PHI_TEMPORARY = (unsigned long long )llvm_cbe__2e_rec;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  }

  } while (1); /* end of syntactic loop '.preheader' */
llvm_cbe_tmp__205:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @ChenIDct}\n");
  return;
}


void IZigzagMatrix(signed int *llvm_cbe_imatrix, signed int *llvm_cbe_omatrix) {
  static  unsigned long long aesl_llvm_cbe_2455_count = 0;
  static  unsigned long long aesl_llvm_cbe_2456_count = 0;
  static  unsigned long long aesl_llvm_cbe_2457_count = 0;
  static  unsigned long long aesl_llvm_cbe_2458_count = 0;
  static  unsigned long long aesl_llvm_cbe_2459_count = 0;
  static  unsigned long long aesl_llvm_cbe_2460_count = 0;
  static  unsigned long long aesl_llvm_cbe_2461_count = 0;
  static  unsigned long long aesl_llvm_cbe_2462_count = 0;
  static  unsigned long long aesl_llvm_cbe_2463_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe__2e_rec_count = 0;
  unsigned long long llvm_cbe__2e_rec;
  unsigned long long llvm_cbe__2e_rec__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2464_count = 0;
  signed int *llvm_cbe_tmp__206;
  static  unsigned long long aesl_llvm_cbe_2465_count = 0;
  unsigned long long llvm_cbe_tmp__207;
  static  unsigned long long aesl_llvm_cbe_2466_count = 0;
  signed int *llvm_cbe_tmp__208;
  static  unsigned long long aesl_llvm_cbe_2467_count = 0;
  unsigned int llvm_cbe_tmp__209;
  static  unsigned long long aesl_llvm_cbe_2468_count = 0;
  unsigned long long llvm_cbe_tmp__210;
  static  unsigned long long aesl_llvm_cbe_2469_count = 0;
  signed int *llvm_cbe_tmp__211;
  static  unsigned long long aesl_llvm_cbe_2470_count = 0;
  unsigned int llvm_cbe_tmp__212;
  static  unsigned long long aesl_llvm_cbe__2e_rec2_count = 0;
  unsigned long long llvm_cbe__2e_rec2;
  static  unsigned long long aesl_llvm_cbe_2471_count = 0;
  static  unsigned long long aesl_llvm_cbe_2472_count = 0;
  unsigned int llvm_cbe_tmp__213;
  static  unsigned long long aesl_llvm_cbe_2473_count = 0;
  static  unsigned long long aesl_llvm_cbe_2474_count = 0;
  static  unsigned long long aesl_llvm_cbe_2475_count = 0;
  static  unsigned long long aesl_llvm_cbe_2476_count = 0;
  static  unsigned long long aesl_llvm_cbe_lftr_2e_wideiv_count = 0;
  unsigned int llvm_cbe_lftr_2e_wideiv;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_2477_count = 0;
  static  unsigned long long aesl_llvm_cbe_2478_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @IZigzagMatrix\n");
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  llvm_cbe__2e_rec__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
  goto llvm_cbe_tmp__214;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__214:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ 0, %%0 ], [ %%9, %%1  for 0x%llxth hint within @IZigzagMatrix  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__213);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec = phi i64 [ 0, %%0 ], [ %%.rec2, %%1  for 0x%llxth hint within @IZigzagMatrix  --> \n", ++aesl_llvm_cbe__2e_rec_count);
  llvm_cbe__2e_rec = (unsigned long long )llvm_cbe__2e_rec__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.rec = 0x%llX",llvm_cbe__2e_rec);
printf("\n = 0x%llX",0ull);
printf("\n.rec2 = 0x%llX",llvm_cbe__2e_rec2);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = getelementptr i32* %%omatrix, i64 %%.re for 0x%llxth hint within @IZigzagMatrix  --> \n", ++aesl_llvm_cbe_2464_count);
  llvm_cbe_tmp__206 = (signed int *)(&llvm_cbe_omatrix[(((signed long long )llvm_cbe__2e_rec))]);
if (AESL_DEBUG_TRACE) {
printf("\n.rec = 0x%llX",((signed long long )llvm_cbe__2e_rec));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = sext i32 %%storemerge1 to i64, !dbg !27 for 0x%llxth hint within @IZigzagMatrix  --> \n", ++aesl_llvm_cbe_2465_count);
  llvm_cbe_tmp__207 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__207);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = getelementptr inbounds [64 x i32]* @zigzag_index, i64 0, i64 %%3, !dbg !27 for 0x%llxth hint within @IZigzagMatrix  --> \n", ++aesl_llvm_cbe_2466_count);
  llvm_cbe_tmp__208 = (signed int *)(&zigzag_index[(((signed long long )llvm_cbe_tmp__207))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__207));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__207) < 64)) fprintf(stderr, "%s:%d: warning: Read access out of array 'zigzag_index' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = load i32* %%4, align 4, !dbg !27 for 0x%llxth hint within @IZigzagMatrix  --> \n", ++aesl_llvm_cbe_2467_count);
  llvm_cbe_tmp__209 = (unsigned int )*llvm_cbe_tmp__208;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__209);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = sext i32 %%5 to i64, !dbg !27 for 0x%llxth hint within @IZigzagMatrix  --> \n", ++aesl_llvm_cbe_2468_count);
  llvm_cbe_tmp__210 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__209);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__210);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = getelementptr inbounds i32* %%imatrix, i64 %%6, !dbg !27 for 0x%llxth hint within @IZigzagMatrix  --> \n", ++aesl_llvm_cbe_2469_count);
  llvm_cbe_tmp__211 = (signed int *)(&llvm_cbe_imatrix[(((signed long long )llvm_cbe_tmp__210))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__210));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = load i32* %%7, align 4, !dbg !27 for 0x%llxth hint within @IZigzagMatrix  --> \n", ++aesl_llvm_cbe_2470_count);
  llvm_cbe_tmp__212 = (unsigned int )*llvm_cbe_tmp__211;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__212);
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec2 = add i64 %%.rec, 1, !dbg !27 for 0x%llxth hint within @IZigzagMatrix  --> \n", ++aesl_llvm_cbe__2e_rec2_count);
  llvm_cbe__2e_rec2 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec&18446744073709551615ull)) + ((unsigned long long )(1ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.rec2 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_rec2&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%8, i32* %%2, align 4, !dbg !27 for 0x%llxth hint within @IZigzagMatrix  --> \n", ++aesl_llvm_cbe_2471_count);
  *llvm_cbe_tmp__206 = llvm_cbe_tmp__212;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__212);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add nsw i32 %%storemerge1, 1, !dbg !28 for 0x%llxth hint within @IZigzagMatrix  --> \n", ++aesl_llvm_cbe_2472_count);
  llvm_cbe_tmp__213 = (unsigned int )((unsigned int )(llvm_cbe_storemerge1&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__213&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%lftr.wideiv = trunc i64 %%.rec2 to i32, !dbg !28 for 0x%llxth hint within @IZigzagMatrix  --> \n", ++aesl_llvm_cbe_lftr_2e_wideiv_count);
  llvm_cbe_lftr_2e_wideiv = (unsigned int )((unsigned int )llvm_cbe__2e_rec2&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\nlftr.wideiv = 0x%X\n", llvm_cbe_lftr_2e_wideiv);
  if (((llvm_cbe_lftr_2e_wideiv&4294967295U) == (64u&4294967295U))) {
    goto llvm_cbe_tmp__215;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__213;   /* for PHI node */
    llvm_cbe__2e_rec__PHI_TEMPORARY = (unsigned long long )llvm_cbe__2e_rec2;   /* for PHI node */
    goto llvm_cbe_tmp__214;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__215:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @IZigzagMatrix}\n");
  return;
}


void IQuantize(signed int *llvm_cbe_matrix, signed int *llvm_cbe_qmatrix) {
  static  unsigned long long aesl_llvm_cbe_2479_count = 0;
  static  unsigned long long aesl_llvm_cbe_2480_count = 0;
  static  unsigned long long aesl_llvm_cbe_2481_count = 0;
  static  unsigned long long aesl_llvm_cbe_2482_count = 0;
  static  unsigned long long aesl_llvm_cbe_2483_count = 0;
  static  unsigned long long aesl_llvm_cbe_2484_count = 0;
  static  unsigned long long aesl_llvm_cbe_2485_count = 0;
  static  unsigned long long aesl_llvm_cbe_2486_count = 0;
  static  unsigned long long aesl_llvm_cbe_2487_count = 0;
  static  unsigned long long aesl_llvm_cbe_2488_count = 0;
  static  unsigned long long aesl_llvm_cbe_2489_count = 0;
  static  unsigned long long aesl_llvm_cbe_2490_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_2e_rec_count = 0;
  unsigned long long llvm_cbe_storemerge1_2e_rec;
  unsigned long long llvm_cbe_storemerge1_2e_rec__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2491_count = 0;
  signed int *llvm_cbe_tmp__216;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  signed int *llvm_cbe_storemerge1;
  static  unsigned long long aesl_llvm_cbe_2492_count = 0;
  unsigned int llvm_cbe_tmp__217;
  static  unsigned long long aesl_llvm_cbe_2493_count = 0;
  unsigned int llvm_cbe_tmp__218;
  static  unsigned long long aesl_llvm_cbe_2494_count = 0;
  unsigned int llvm_cbe_tmp__219;
  static  unsigned long long aesl_llvm_cbe_2495_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_rec_count = 0;
  unsigned long long llvm_cbe__2e_rec;
  static  unsigned long long aesl_llvm_cbe_2496_count = 0;
  static  unsigned long long aesl_llvm_cbe_2497_count = 0;
  static  unsigned long long aesl_llvm_cbe_2498_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @IQuantize\n");
  llvm_cbe_storemerge1_2e_rec__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
  goto llvm_cbe_tmp__220;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__220:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1.rec = phi i64 [ 0, %%.lr.ph ], [ %%.rec, %%0  for 0x%llxth hint within @IQuantize  --> \n", ++aesl_llvm_cbe_storemerge1_2e_rec_count);
  llvm_cbe_storemerge1_2e_rec = (unsigned long long )llvm_cbe_storemerge1_2e_rec__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1.rec = 0x%llX",llvm_cbe_storemerge1_2e_rec);
printf("\n = 0x%llX",0ull);
printf("\n.rec = 0x%llX",llvm_cbe__2e_rec);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = getelementptr i32* %%qmatrix, i64 %%storemerge1.re for 0x%llxth hint within @IQuantize  --> \n", ++aesl_llvm_cbe_2491_count);
  llvm_cbe_tmp__216 = (signed int *)(&llvm_cbe_qmatrix[(((signed long long )llvm_cbe_storemerge1_2e_rec))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1.rec = 0x%llX",((signed long long )llvm_cbe_storemerge1_2e_rec));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = getelementptr i32* %%matrix, i64 %%storemerge1.re for 0x%llxth hint within @IQuantize  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (signed int *)(&llvm_cbe_matrix[(((signed long long )llvm_cbe_storemerge1_2e_rec))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1.rec = 0x%llX",((signed long long )llvm_cbe_storemerge1_2e_rec));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = load i32* %%storemerge1, align 4, !dbg !27 for 0x%llxth hint within @IQuantize  --> \n", ++aesl_llvm_cbe_2492_count);
  llvm_cbe_tmp__217 = (unsigned int )*llvm_cbe_storemerge1;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__217);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = load i32* %%1, align 4, !dbg !27 for 0x%llxth hint within @IQuantize  --> \n", ++aesl_llvm_cbe_2493_count);
  llvm_cbe_tmp__218 = (unsigned int )*llvm_cbe_tmp__216;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__218);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = mul nsw i32 %%3, %%2, !dbg !27 for 0x%llxth hint within @IQuantize  --> \n", ++aesl_llvm_cbe_2494_count);
  llvm_cbe_tmp__219 = (unsigned int )((unsigned int )(llvm_cbe_tmp__218&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__217&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__219&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%4, i32* %%storemerge1, align 4, !dbg !27 for 0x%llxth hint within @IQuantize  --> \n", ++aesl_llvm_cbe_2495_count);
  *llvm_cbe_storemerge1 = llvm_cbe_tmp__219;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__219);
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec = add i64 %%storemerge1.rec, 1, !dbg !28 for 0x%llxth hint within @IQuantize  --> \n", ++aesl_llvm_cbe__2e_rec_count);
  llvm_cbe__2e_rec = (unsigned long long )((unsigned long long )(llvm_cbe_storemerge1_2e_rec&18446744073709551615ull)) + ((unsigned long long )(1ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.rec = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_rec&18446744073709551615ull)));
  if ((((signed long long )llvm_cbe__2e_rec) < ((signed long long )64ull))) {
    llvm_cbe_storemerge1_2e_rec__PHI_TEMPORARY = (unsigned long long )llvm_cbe__2e_rec;   /* for PHI node */
    goto llvm_cbe_tmp__220;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @IQuantize}\n");
  return;
}


void PostshiftIDctMatrix(signed int *llvm_cbe_matrix, signed int llvm_cbe_shift) {
  static  unsigned long long aesl_llvm_cbe_2499_count = 0;
  static  unsigned long long aesl_llvm_cbe_2500_count = 0;
  static  unsigned long long aesl_llvm_cbe_2501_count = 0;
  static  unsigned long long aesl_llvm_cbe_2502_count = 0;
  static  unsigned long long aesl_llvm_cbe_2503_count = 0;
  static  unsigned long long aesl_llvm_cbe_2504_count = 0;
  static  unsigned long long aesl_llvm_cbe_2505_count = 0;
  static  unsigned long long aesl_llvm_cbe_2506_count = 0;
  static  unsigned long long aesl_llvm_cbe_2507_count = 0;
  static  unsigned long long aesl_llvm_cbe_2508_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_2e_rec_count = 0;
  unsigned long long llvm_cbe_storemerge1_2e_rec;
  unsigned long long llvm_cbe_storemerge1_2e_rec__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  signed int *llvm_cbe_storemerge1;
  static  unsigned long long aesl_llvm_cbe_2509_count = 0;
  unsigned int llvm_cbe_tmp__221;
  static  unsigned long long aesl_llvm_cbe_2510_count = 0;
  unsigned int llvm_cbe_tmp__222;
  static  unsigned long long aesl_llvm_cbe_2511_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_rec_count = 0;
  unsigned long long llvm_cbe__2e_rec;
  static  unsigned long long aesl_llvm_cbe_2512_count = 0;
  static  unsigned long long aesl_llvm_cbe_2513_count = 0;
  static  unsigned long long aesl_llvm_cbe_2514_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @PostshiftIDctMatrix\n");
  llvm_cbe_storemerge1_2e_rec__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
  goto llvm_cbe_tmp__223;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__223:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1.rec = phi i64 [ 0, %%.lr.ph ], [ %%.rec, %%0  for 0x%llxth hint within @PostshiftIDctMatrix  --> \n", ++aesl_llvm_cbe_storemerge1_2e_rec_count);
  llvm_cbe_storemerge1_2e_rec = (unsigned long long )llvm_cbe_storemerge1_2e_rec__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1.rec = 0x%llX",llvm_cbe_storemerge1_2e_rec);
printf("\n = 0x%llX",0ull);
printf("\n.rec = 0x%llX",llvm_cbe__2e_rec);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = getelementptr i32* %%matrix, i64 %%storemerge1.re for 0x%llxth hint within @PostshiftIDctMatrix  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (signed int *)(&llvm_cbe_matrix[(((signed long long )llvm_cbe_storemerge1_2e_rec))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1.rec = 0x%llX",((signed long long )llvm_cbe_storemerge1_2e_rec));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i32* %%storemerge1, align 4, !dbg !27 for 0x%llxth hint within @PostshiftIDctMatrix  --> \n", ++aesl_llvm_cbe_2509_count);
  llvm_cbe_tmp__221 = (unsigned int )*llvm_cbe_storemerge1;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__221);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = add nsw i32 %%1, %%shift, !dbg !27 for 0x%llxth hint within @PostshiftIDctMatrix  --> \n", ++aesl_llvm_cbe_2510_count);
  llvm_cbe_tmp__222 = (unsigned int )((unsigned int )(llvm_cbe_tmp__221&4294967295ull)) + ((unsigned int )(llvm_cbe_shift&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__222&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%2, i32* %%storemerge1, align 4, !dbg !27 for 0x%llxth hint within @PostshiftIDctMatrix  --> \n", ++aesl_llvm_cbe_2511_count);
  *llvm_cbe_storemerge1 = llvm_cbe_tmp__222;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__222);
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec = add i64 %%storemerge1.rec, 1, !dbg !28 for 0x%llxth hint within @PostshiftIDctMatrix  --> \n", ++aesl_llvm_cbe__2e_rec_count);
  llvm_cbe__2e_rec = (unsigned long long )((unsigned long long )(llvm_cbe_storemerge1_2e_rec&18446744073709551615ull)) + ((unsigned long long )(1ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.rec = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_rec&18446744073709551615ull)));
  if ((((signed long long )llvm_cbe__2e_rec) < ((signed long long )64ull))) {
    llvm_cbe_storemerge1_2e_rec__PHI_TEMPORARY = (unsigned long long )llvm_cbe__2e_rec;   /* for PHI node */
    goto llvm_cbe_tmp__223;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @PostshiftIDctMatrix}\n");
  return;
}


void BoundIDctMatrix(signed int *llvm_cbe_matrix, signed int llvm_cbe_Bound) {
  static  unsigned long long aesl_llvm_cbe_2515_count = 0;
  static  unsigned long long aesl_llvm_cbe_2516_count = 0;
  static  unsigned long long aesl_llvm_cbe_2517_count = 0;
  static  unsigned long long aesl_llvm_cbe_2518_count = 0;
  static  unsigned long long aesl_llvm_cbe_2519_count = 0;
  static  unsigned long long aesl_llvm_cbe_2520_count = 0;
  static  unsigned long long aesl_llvm_cbe_2521_count = 0;
  static  unsigned long long aesl_llvm_cbe_2522_count = 0;
  static  unsigned long long aesl_llvm_cbe_2523_count = 0;
  static  unsigned long long aesl_llvm_cbe_2524_count = 0;
  static  unsigned long long aesl_llvm_cbe_2525_count = 0;
  static  unsigned long long aesl_llvm_cbe_2526_count = 0;
  static  unsigned long long aesl_llvm_cbe_2527_count = 0;
  static  unsigned long long aesl_llvm_cbe_2528_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_2e_rec_count = 0;
  unsigned long long llvm_cbe_storemerge1_2e_rec;
  unsigned long long llvm_cbe_storemerge1_2e_rec__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  signed int *llvm_cbe_storemerge1;
  static  unsigned long long aesl_llvm_cbe_2529_count = 0;
  unsigned int llvm_cbe_tmp__224;
  static  unsigned long long aesl_llvm_cbe_2530_count = 0;
  static  unsigned long long aesl_llvm_cbe_2531_count = 0;
  static  unsigned long long aesl_llvm_cbe_2532_count = 0;
  static  unsigned long long aesl_llvm_cbe_2533_count = 0;
  static  unsigned long long aesl_llvm_cbe_2534_count = 0;
  static  unsigned long long aesl_llvm_cbe_2535_count = 0;
  static  unsigned long long aesl_llvm_cbe_2536_count = 0;
  static  unsigned long long aesl_llvm_cbe_2537_count = 0;
  static  unsigned long long aesl_llvm_cbe_2538_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_rec_count = 0;
  unsigned long long llvm_cbe__2e_rec;
  static  unsigned long long aesl_llvm_cbe_2539_count = 0;
  static  unsigned long long aesl_llvm_cbe_2540_count = 0;
  static  unsigned long long aesl_llvm_cbe_2541_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @BoundIDctMatrix\n");
  llvm_cbe_storemerge1_2e_rec__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
  goto llvm_cbe_tmp__225;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__225:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1.rec = phi i64 [ 0, %%.lr.ph ], [ %%.rec, %%8  for 0x%llxth hint within @BoundIDctMatrix  --> \n", ++aesl_llvm_cbe_storemerge1_2e_rec_count);
  llvm_cbe_storemerge1_2e_rec = (unsigned long long )llvm_cbe_storemerge1_2e_rec__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1.rec = 0x%llX",llvm_cbe_storemerge1_2e_rec);
printf("\n = 0x%llX",0ull);
printf("\n.rec = 0x%llX",llvm_cbe__2e_rec);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = getelementptr i32* %%matrix, i64 %%storemerge1.re for 0x%llxth hint within @BoundIDctMatrix  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (signed int *)(&llvm_cbe_matrix[(((signed long long )llvm_cbe_storemerge1_2e_rec))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1.rec = 0x%llX",((signed long long )llvm_cbe_storemerge1_2e_rec));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i32* %%storemerge1, align 4, !dbg !28 for 0x%llxth hint within @BoundIDctMatrix  --> \n", ++aesl_llvm_cbe_2529_count);
  llvm_cbe_tmp__224 = (unsigned int )*llvm_cbe_storemerge1;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__224);
  if ((((signed int )llvm_cbe_tmp__224) < ((signed int )0u))) {
    goto llvm_cbe_tmp__226;
  } else {
    goto llvm_cbe_tmp__227;
  }

llvm_cbe_tmp__228:
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec = add i64 %%storemerge1.rec, 1, !dbg !28 for 0x%llxth hint within @BoundIDctMatrix  --> \n", ++aesl_llvm_cbe__2e_rec_count);
  llvm_cbe__2e_rec = (unsigned long long )((unsigned long long )(llvm_cbe_storemerge1_2e_rec&18446744073709551615ull)) + ((unsigned long long )(1ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.rec = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_rec&18446744073709551615ull)));
  if ((((signed long long )llvm_cbe__2e_rec) < ((signed long long )64ull))) {
    llvm_cbe_storemerge1_2e_rec__PHI_TEMPORARY = (unsigned long long )llvm_cbe__2e_rec;   /* for PHI node */
    goto llvm_cbe_tmp__225;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

llvm_cbe_tmp__226:
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%storemerge1, align 4, !dbg !28 for 0x%llxth hint within @BoundIDctMatrix  --> \n", ++aesl_llvm_cbe_2532_count);
  *llvm_cbe_storemerge1 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
  goto llvm_cbe_tmp__228;

llvm_cbe_tmp__229:
  goto llvm_cbe_tmp__228;

llvm_cbe_tmp__227:
  if ((((signed int )llvm_cbe_tmp__224) > ((signed int )llvm_cbe_Bound))) {
    goto llvm_cbe_tmp__230;
  } else {
    goto llvm_cbe_tmp__229;
  }

llvm_cbe_tmp__230:
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%Bound, i32* %%storemerge1, align 4, !dbg !28 for 0x%llxth hint within @BoundIDctMatrix  --> \n", ++aesl_llvm_cbe_2536_count);
  *llvm_cbe_storemerge1 = llvm_cbe_Bound;
if (AESL_DEBUG_TRACE)
printf("\nBound = 0x%X\n", llvm_cbe_Bound);
  goto llvm_cbe_tmp__229;

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @BoundIDctMatrix}\n");
  return;
}


void WriteOneBlock(signed int *llvm_cbe_store,  char *llvm_cbe_out_buf, signed int llvm_cbe_width, signed int llvm_cbe_height, signed int llvm_cbe_voffs, signed int llvm_cbe_hoffs) {
  static  unsigned long long aesl_llvm_cbe_2542_count = 0;
  static  unsigned long long aesl_llvm_cbe_2543_count = 0;
  static  unsigned long long aesl_llvm_cbe_2544_count = 0;
  static  unsigned long long aesl_llvm_cbe_2545_count = 0;
  static  unsigned long long aesl_llvm_cbe_2546_count = 0;
  static  unsigned long long aesl_llvm_cbe_2547_count = 0;
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
  static  unsigned long long aesl_llvm_cbe_2562_count = 0;
  static  unsigned long long aesl_llvm_cbe_2563_count = 0;
  static  unsigned long long aesl_llvm_cbe_2564_count = 0;
  static  unsigned long long aesl_llvm_cbe_2565_count = 0;
  static  unsigned long long aesl_llvm_cbe_2566_count = 0;
  unsigned int llvm_cbe_tmp__231;
  static  unsigned long long aesl_llvm_cbe_2567_count = 0;
  unsigned int llvm_cbe_tmp__232;
  static  unsigned long long aesl_llvm_cbe_2568_count = 0;
  unsigned int llvm_cbe_tmp__233;
  static  unsigned long long aesl_llvm_cbe_2569_count = 0;
  static  unsigned long long aesl_llvm_cbe_smax_count = 0;
  unsigned int llvm_cbe_smax;
  static  unsigned long long aesl_llvm_cbe_2570_count = 0;
  unsigned int llvm_cbe_tmp__234;
  static  unsigned long long aesl_llvm_cbe_2571_count = 0;
  static  unsigned long long aesl_llvm_cbe_umax_count = 0;
  unsigned int llvm_cbe_umax;
  static  unsigned long long aesl_llvm_cbe_2572_count = 0;
  unsigned int llvm_cbe_tmp__235;
  static  unsigned long long aesl_llvm_cbe_2573_count = 0;
  unsigned int llvm_cbe_tmp__236;
  static  unsigned long long aesl_llvm_cbe_2574_count = 0;
  unsigned int llvm_cbe_tmp__237;
  static  unsigned long long aesl_llvm_cbe_2575_count = 0;
  unsigned int llvm_cbe_tmp__238;
  static  unsigned long long aesl_llvm_cbe_2576_count = 0;
  static  unsigned long long aesl_llvm_cbe_smax10_count = 0;
  unsigned int llvm_cbe_smax10;
  static  unsigned long long aesl_llvm_cbe_2577_count = 0;
  unsigned int llvm_cbe_tmp__239;
  static  unsigned long long aesl_llvm_cbe_2578_count = 0;
  static  unsigned long long aesl_llvm_cbe_umax11_count = 0;
  unsigned int llvm_cbe_umax11;
  static  unsigned long long aesl_llvm_cbe_2579_count = 0;
  unsigned int llvm_cbe_tmp__240;
  static  unsigned long long aesl_llvm_cbe_2580_count = 0;
  static  unsigned long long aesl_llvm_cbe_2581_count = 0;
  unsigned int llvm_cbe_tmp__241;
  static  unsigned long long aesl_llvm_cbe_2582_count = 0;
  static  unsigned long long aesl_llvm_cbe_2583_count = 0;
  static  unsigned long long aesl_llvm_cbe_2584_count = 0;
  static  unsigned long long aesl_llvm_cbe_2585_count = 0;
  static  unsigned long long aesl_llvm_cbe_2586_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond12_count = 0;
  static  unsigned long long aesl_llvm_cbe_2587_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge14_2e_us_count = 0;
  unsigned int llvm_cbe_storemerge14_2e_us;
  unsigned int llvm_cbe_storemerge14_2e_us__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe__2e_rec_count = 0;
  unsigned long long llvm_cbe__2e_rec;
  unsigned long long llvm_cbe__2e_rec__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2588_count = 0;
  signed int *llvm_cbe_tmp__242;
  static  unsigned long long aesl_llvm_cbe__2e_rec9_count = 0;
  unsigned long long llvm_cbe__2e_rec9;
  static  unsigned long long aesl_llvm_cbe_2589_count = 0;
  signed int *llvm_cbe_tmp__243;
  static  unsigned long long aesl_llvm_cbe_2590_count = 0;
  static  unsigned long long aesl_llvm_cbe_2591_count = 0;
  static  unsigned long long aesl_llvm_cbe_2592_count = 0;
  unsigned int llvm_cbe_tmp__244;
  static  unsigned long long aesl_llvm_cbe_2593_count = 0;
  unsigned char llvm_cbe_tmp__245;
  static  unsigned long long aesl_llvm_cbe_2594_count = 0;
  unsigned int llvm_cbe_tmp__246;
  static  unsigned long long aesl_llvm_cbe_2595_count = 0;
  unsigned long long llvm_cbe_tmp__247;
  static  unsigned long long aesl_llvm_cbe_2596_count = 0;
   char *llvm_cbe_tmp__248;
  static  unsigned long long aesl_llvm_cbe_2597_count = 0;
  static  unsigned long long aesl_llvm_cbe_2598_count = 0;
  unsigned int llvm_cbe_tmp__249;
  static  unsigned long long aesl_llvm_cbe_2599_count = 0;
  static  unsigned long long aesl_llvm_cbe_2600_count = 0;
  static  unsigned long long aesl_llvm_cbe_2601_count = 0;
  static  unsigned long long aesl_llvm_cbe_2602_count = 0;
  static  unsigned long long aesl_llvm_cbe_2603_count = 0;
  static  unsigned long long aesl_llvm_cbe_lftr_2e_wideiv_count = 0;
  unsigned int llvm_cbe_lftr_2e_wideiv;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_2604_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge5_2e_us_count = 0;
  unsigned int llvm_cbe_storemerge5_2e_us;
  unsigned int llvm_cbe_storemerge5_2e_us__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2605_count = 0;
  signed int *llvm_cbe_tmp__250;
  signed int *llvm_cbe_tmp__250__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2606_count = 0;
  unsigned int llvm_cbe_tmp__251;
  static  unsigned long long aesl_llvm_cbe_2607_count = 0;
  static  unsigned long long aesl_llvm_cbe_2608_count = 0;
  static  unsigned long long aesl_llvm_cbe_2609_count = 0;
  static  unsigned long long aesl_llvm_cbe_2610_count = 0;
  static  unsigned long long aesl_llvm_cbe_2611_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @WriteOneBlock\n");
  if ((((signed int )llvm_cbe_voffs) < ((signed int )llvm_cbe_height))) {
    goto llvm_cbe__2e_lr_2e_ph7;
  } else {
    goto llvm_cbe_tmp__252;
  }

llvm_cbe__2e_lr_2e_ph7:
  if ((((signed int )llvm_cbe_hoffs) < ((signed int )llvm_cbe_width))) {
    goto llvm_cbe__2e_lr_2e_ph7_2e_split_2e_us;
  } else {
    goto llvm_cbe__2e__crit_edge8;
  }

llvm_cbe__2e_lr_2e_ph7_2e_split_2e_us:
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = sub i32 %%hoffs, %%width, !dbg !29 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2566_count);
  llvm_cbe_tmp__231 = (unsigned int )((unsigned int )(llvm_cbe_hoffs&4294967295ull)) - ((unsigned int )(llvm_cbe_width&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__231&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = add i32 %%hoffs, 8, !dbg !29 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2567_count);
  llvm_cbe_tmp__232 = (unsigned int )((unsigned int )(llvm_cbe_hoffs&4294967295ull)) + ((unsigned int )(8u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__232&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = add i32 %%hoffs, 1, !dbg !29 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2568_count);
  llvm_cbe_tmp__233 = (unsigned int )((unsigned int )(llvm_cbe_hoffs&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__233&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%smax = select i1 %%6, i32 %%4, i32 %% for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_smax_count);
  llvm_cbe_smax = (unsigned int )(((((signed int )llvm_cbe_tmp__232) > ((signed int )llvm_cbe_tmp__233))) ? ((unsigned int )llvm_cbe_tmp__232) : ((unsigned int )llvm_cbe_tmp__233));
if (AESL_DEBUG_TRACE)
printf("\nsmax = 0x%X\n", llvm_cbe_smax);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = sub i32 %%hoffs, %%smax, !dbg !29 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2570_count);
  llvm_cbe_tmp__234 = (unsigned int )((unsigned int )(llvm_cbe_hoffs&4294967295ull)) - ((unsigned int )(llvm_cbe_smax&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__234&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%umax = select i1 %%8, i32 %%3, i32 %% for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_umax_count);
  llvm_cbe_umax = (unsigned int )(((((unsigned int )llvm_cbe_tmp__231&4294967295U) > ((unsigned int )llvm_cbe_tmp__234&4294967295U))) ? ((unsigned int )llvm_cbe_tmp__231) : ((unsigned int )llvm_cbe_tmp__234));
if (AESL_DEBUG_TRACE)
printf("\numax = 0x%X\n", llvm_cbe_umax);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = sub i32 0, %%umax, !dbg !29 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2572_count);
  llvm_cbe_tmp__235 = (unsigned int )-(llvm_cbe_umax);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__235&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = sub i32 %%voffs, %%height, !dbg !29 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2573_count);
  llvm_cbe_tmp__236 = (unsigned int )((unsigned int )(llvm_cbe_voffs&4294967295ull)) - ((unsigned int )(llvm_cbe_height&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__236&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = add i32 %%voffs, 8, !dbg !29 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2574_count);
  llvm_cbe_tmp__237 = (unsigned int )((unsigned int )(llvm_cbe_voffs&4294967295ull)) + ((unsigned int )(8u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__237&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = add i32 %%voffs, 1, !dbg !29 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2575_count);
  llvm_cbe_tmp__238 = (unsigned int )((unsigned int )(llvm_cbe_voffs&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__238&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%smax10 = select i1 %%13, i32 %%11, i32 %%1 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_smax10_count);
  llvm_cbe_smax10 = (unsigned int )(((((signed int )llvm_cbe_tmp__237) > ((signed int )llvm_cbe_tmp__238))) ? ((unsigned int )llvm_cbe_tmp__237) : ((unsigned int )llvm_cbe_tmp__238));
if (AESL_DEBUG_TRACE)
printf("\nsmax10 = 0x%X\n", llvm_cbe_smax10);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = sub i32 %%voffs, %%smax10, !dbg !29 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2577_count);
  llvm_cbe_tmp__239 = (unsigned int )((unsigned int )(llvm_cbe_voffs&4294967295ull)) - ((unsigned int )(llvm_cbe_smax10&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__239&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%umax11 = select i1 %%15, i32 %%10, i32 %%1 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_umax11_count);
  llvm_cbe_umax11 = (unsigned int )(((((unsigned int )llvm_cbe_tmp__236&4294967295U) > ((unsigned int )llvm_cbe_tmp__239&4294967295U))) ? ((unsigned int )llvm_cbe_tmp__236) : ((unsigned int )llvm_cbe_tmp__239));
if (AESL_DEBUG_TRACE)
printf("\numax11 = 0x%X\n", llvm_cbe_umax11);
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = sub i32 %%voffs, %%umax11, !dbg !29 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2579_count);
  llvm_cbe_tmp__240 = (unsigned int )((unsigned int )(llvm_cbe_voffs&4294967295ull)) - ((unsigned int )(llvm_cbe_umax11&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__240&4294967295ull)));
  llvm_cbe_storemerge5_2e_us__PHI_TEMPORARY = (unsigned int )llvm_cbe_voffs;   /* for PHI node */
  llvm_cbe_tmp__250__PHI_TEMPORARY = (signed int *)llvm_cbe_store;   /* for PHI node */
  goto llvm_cbe__2e_lr_2e_ph_2e_us;

  do {     /* Syntactic loop '.lr.ph.us' to make GCC happy */
llvm_cbe__2e_lr_2e_ph_2e_us:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge5.us = phi i32 [ %%voffs, %%.lr.ph7.split.us ], [ %%18, %%17  for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_storemerge5_2e_us_count);
  llvm_cbe_storemerge5_2e_us = (unsigned int )llvm_cbe_storemerge5_2e_us__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge5.us = 0x%X",llvm_cbe_storemerge5_2e_us);
printf("\nvoffs = 0x%X",llvm_cbe_voffs);
printf("\n = 0x%X",llvm_cbe_tmp__241);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = phi i32* [ %%store, %%.lr.ph7.split.us ], [ %%21, %%17  for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2605_count);
  llvm_cbe_tmp__250 = (signed int *)llvm_cbe_tmp__250__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = mul nsw i32 %%storemerge5.us, %%width, !dbg !28 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2606_count);
  llvm_cbe_tmp__251 = (unsigned int )((unsigned int )(llvm_cbe_storemerge5_2e_us&4294967295ull)) * ((unsigned int )(llvm_cbe_width&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__251&4294967295ull)));
  llvm_cbe_storemerge14_2e_us__PHI_TEMPORARY = (unsigned int )llvm_cbe_hoffs;   /* for PHI node */
  llvm_cbe__2e_rec__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
  goto llvm_cbe_tmp__253;

llvm_cbe_tmp__254:
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = add nsw i32 %%storemerge5.us, 1, !dbg !29 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2581_count);
  llvm_cbe_tmp__241 = (unsigned int )((unsigned int )(llvm_cbe_storemerge5_2e_us&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__241&4294967295ull)));
  if (((llvm_cbe_tmp__241&4294967295U) == (llvm_cbe_tmp__240&4294967295U))) {
    goto llvm_cbe__2e__crit_edge8;
  } else {
    llvm_cbe_storemerge5_2e_us__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__241;   /* for PHI node */
    llvm_cbe_tmp__250__PHI_TEMPORARY = (signed int *)llvm_cbe_tmp__243;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph_2e_us;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__253:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge14.us = phi i32 [ %%hoffs, %%.lr.ph.us ], [ %%27, %%19  for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_storemerge14_2e_us_count);
  llvm_cbe_storemerge14_2e_us = (unsigned int )llvm_cbe_storemerge14_2e_us__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge14.us = 0x%X",llvm_cbe_storemerge14_2e_us);
printf("\nhoffs = 0x%X",llvm_cbe_hoffs);
printf("\n = 0x%X",llvm_cbe_tmp__249);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec = phi i64 [ 0, %%.lr.ph.us ], [ %%.rec9, %%19  for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe__2e_rec_count);
  llvm_cbe__2e_rec = (unsigned long long )llvm_cbe__2e_rec__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.rec = 0x%llX",llvm_cbe__2e_rec);
printf("\n = 0x%llX",0ull);
printf("\n.rec9 = 0x%llX",llvm_cbe__2e_rec9);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = getelementptr i32* %%28, i64 %%.re for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2588_count);
  llvm_cbe_tmp__242 = (signed int *)(&llvm_cbe_tmp__250[(((signed long long )llvm_cbe__2e_rec))]);
if (AESL_DEBUG_TRACE) {
printf("\n.rec = 0x%llX",((signed long long )llvm_cbe__2e_rec));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.rec9 = add i64 %%.rec, 1, !dbg !27 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe__2e_rec9_count);
  llvm_cbe__2e_rec9 = (unsigned long long )((unsigned long long )(llvm_cbe__2e_rec&18446744073709551615ull)) + ((unsigned long long )(1ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.rec9 = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_rec9&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = getelementptr inbounds i32* %%28, i64 %%.rec9, !dbg !27 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2589_count);
  llvm_cbe_tmp__243 = (signed int *)(&llvm_cbe_tmp__250[(((signed long long )llvm_cbe__2e_rec9))]);
if (AESL_DEBUG_TRACE) {
printf("\n.rec9 = 0x%llX",((signed long long )llvm_cbe__2e_rec9));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = load i32* %%20, align 4, !dbg !27 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2592_count);
  llvm_cbe_tmp__244 = (unsigned int )*llvm_cbe_tmp__242;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__244);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = trunc i32 %%22 to i8, !dbg !27 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2593_count);
  llvm_cbe_tmp__245 = (unsigned char )((unsigned char )llvm_cbe_tmp__244&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__245);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = add nsw i32 %%storemerge14.us, %%29, !dbg !27 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2594_count);
  llvm_cbe_tmp__246 = (unsigned int )((unsigned int )(llvm_cbe_storemerge14_2e_us&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__251&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__246&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = sext i32 %%24 to i64, !dbg !27 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2595_count);
  llvm_cbe_tmp__247 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__246);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__247);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = getelementptr inbounds i8* %%out_buf, i64 %%25, !dbg !27 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2596_count);
  llvm_cbe_tmp__248 = ( char *)(&llvm_cbe_out_buf[(((signed long long )llvm_cbe_tmp__247))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__247));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%23, i8* %%26, align 1, !dbg !27 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2597_count);
  *llvm_cbe_tmp__248 = llvm_cbe_tmp__245;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__245);
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = add nsw i32 %%storemerge14.us, 1, !dbg !29 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_2598_count);
  llvm_cbe_tmp__249 = (unsigned int )((unsigned int )(llvm_cbe_storemerge14_2e_us&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__249&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%lftr.wideiv = trunc i64 %%.rec9 to i32, !dbg !29 for 0x%llxth hint within @WriteOneBlock  --> \n", ++aesl_llvm_cbe_lftr_2e_wideiv_count);
  llvm_cbe_lftr_2e_wideiv = (unsigned int )((unsigned int )llvm_cbe__2e_rec9&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\nlftr.wideiv = 0x%X\n", llvm_cbe_lftr_2e_wideiv);
  if (((llvm_cbe_lftr_2e_wideiv&4294967295U) == (llvm_cbe_tmp__235&4294967295U))) {
    goto llvm_cbe_tmp__254;
  } else {
    llvm_cbe_storemerge14_2e_us__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__249;   /* for PHI node */
    llvm_cbe__2e_rec__PHI_TEMPORARY = (unsigned long long )llvm_cbe__2e_rec9;   /* for PHI node */
    goto llvm_cbe_tmp__253;
  }

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.lr.ph.us' */
llvm_cbe__2e__crit_edge8:
  goto llvm_cbe_tmp__252;

llvm_cbe_tmp__252:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @WriteOneBlock}\n");
  return;
}


void WriteBlock(signed int *llvm_cbe_store, signed int *llvm_cbe_p_out_vpos, signed int *llvm_cbe_p_out_hpos,  char *llvm_cbe_p_out_buf) {
  static  unsigned long long aesl_llvm_cbe_2612_count = 0;
  static  unsigned long long aesl_llvm_cbe_2613_count = 0;
  static  unsigned long long aesl_llvm_cbe_2614_count = 0;
  static  unsigned long long aesl_llvm_cbe_2615_count = 0;
  static  unsigned long long aesl_llvm_cbe_2616_count = 0;
  static  unsigned long long aesl_llvm_cbe_2617_count = 0;
  static  unsigned long long aesl_llvm_cbe_2618_count = 0;
  static  unsigned long long aesl_llvm_cbe_2619_count = 0;
  static  unsigned long long aesl_llvm_cbe_2620_count = 0;
  static  unsigned long long aesl_llvm_cbe_2621_count = 0;
  static  unsigned long long aesl_llvm_cbe_2622_count = 0;
  static  unsigned long long aesl_llvm_cbe_2623_count = 0;
  static  unsigned long long aesl_llvm_cbe_2624_count = 0;
  static  unsigned long long aesl_llvm_cbe_2625_count = 0;
  unsigned int llvm_cbe_tmp__255;
  static  unsigned long long aesl_llvm_cbe_2626_count = 0;
  unsigned int llvm_cbe_tmp__256;
  static  unsigned long long aesl_llvm_cbe_2627_count = 0;
  static  unsigned long long aesl_llvm_cbe_2628_count = 0;
  static  unsigned long long aesl_llvm_cbe_2629_count = 0;
  unsigned int llvm_cbe_tmp__257;
  static  unsigned long long aesl_llvm_cbe_2630_count = 0;
  unsigned int llvm_cbe_tmp__258;
  static  unsigned long long aesl_llvm_cbe_2631_count = 0;
  static  unsigned long long aesl_llvm_cbe_2632_count = 0;
  static  unsigned long long aesl_llvm_cbe_2633_count = 0;
  unsigned short llvm_cbe_tmp__259;
  static  unsigned long long aesl_llvm_cbe_2634_count = 0;
  unsigned int llvm_cbe_tmp__260;
  static  unsigned long long aesl_llvm_cbe_2635_count = 0;
  unsigned short llvm_cbe_tmp__261;
  static  unsigned long long aesl_llvm_cbe_2636_count = 0;
  unsigned int llvm_cbe_tmp__262;
  static  unsigned long long aesl_llvm_cbe_2637_count = 0;
  static  unsigned long long aesl_llvm_cbe_2638_count = 0;
  signed int *llvm_cbe_tmp__263;
  static  unsigned long long aesl_llvm_cbe_2639_count = 0;
  static  unsigned long long aesl_llvm_cbe_2640_count = 0;
  static  unsigned long long aesl_llvm_cbe_2641_count = 0;
  static  unsigned long long aesl_llvm_cbe_2642_count = 0;
  static  unsigned long long aesl_llvm_cbe_2643_count = 0;
  static  unsigned long long aesl_llvm_cbe_2644_count = 0;
  unsigned int llvm_cbe_tmp__264;
  static  unsigned long long aesl_llvm_cbe_2645_count = 0;
  unsigned int llvm_cbe_tmp__265;
  static  unsigned long long aesl_llvm_cbe_2646_count = 0;
  static  unsigned long long aesl_llvm_cbe_2647_count = 0;
  static  unsigned long long aesl_llvm_cbe_2648_count = 0;
  static  unsigned long long aesl_llvm_cbe_2649_count = 0;
  static  unsigned long long aesl_llvm_cbe_2650_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @WriteBlock\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i32* %%p_out_vpos, align 4, !dbg !27 for 0x%llxth hint within @WriteBlock  --> \n", ++aesl_llvm_cbe_2625_count);
  llvm_cbe_tmp__255 = (unsigned int )*llvm_cbe_p_out_vpos;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__255);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = shl nsw i32 %%1, 3, !dbg !27 for 0x%llxth hint within @WriteBlock  --> \n", ++aesl_llvm_cbe_2626_count);
  llvm_cbe_tmp__256 = (unsigned int )llvm_cbe_tmp__255 << 3u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__256);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = load i32* %%p_out_hpos, align 4, !dbg !28 for 0x%llxth hint within @WriteBlock  --> \n", ++aesl_llvm_cbe_2629_count);
  llvm_cbe_tmp__257 = (unsigned int )*llvm_cbe_p_out_hpos;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__257);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = shl nsw i32 %%3, 3, !dbg !28 for 0x%llxth hint within @WriteBlock  --> \n", ++aesl_llvm_cbe_2630_count);
  llvm_cbe_tmp__258 = (unsigned int )llvm_cbe_tmp__257 << 3u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__258);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = load i16* @p_jinfo_image_width, align 2, !dbg !27 for 0x%llxth hint within @WriteBlock  --> \n", ++aesl_llvm_cbe_2633_count);
  llvm_cbe_tmp__259 = (unsigned short )*(&p_jinfo_image_width);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__259);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = sext i16 %%5 to i32, !dbg !27 for 0x%llxth hint within @WriteBlock  --> \n", ++aesl_llvm_cbe_2634_count);
  llvm_cbe_tmp__260 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__259);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__260);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i16* @p_jinfo_image_height, align 2, !dbg !27 for 0x%llxth hint within @WriteBlock  --> \n", ++aesl_llvm_cbe_2635_count);
  llvm_cbe_tmp__261 = (unsigned short )*(&p_jinfo_image_height);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__261);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = sext i16 %%7 to i32, !dbg !27 for 0x%llxth hint within @WriteBlock  --> \n", ++aesl_llvm_cbe_2636_count);
  llvm_cbe_tmp__262 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__261);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__262);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @WriteOneBlock(i32* %%store, i8* %%p_out_buf, i32 %%6, i32 %%8, i32 %%2, i32 %%4), !dbg !27 for 0x%llxth hint within @WriteBlock  --> \n", ++aesl_llvm_cbe_2637_count);
   /*tail*/ WriteOneBlock((signed int *)llvm_cbe_store, ( char *)llvm_cbe_p_out_buf, llvm_cbe_tmp__260, llvm_cbe_tmp__262, llvm_cbe_tmp__256, llvm_cbe_tmp__258);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__260);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__262);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__256);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__258);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = getelementptr inbounds i32* %%p_out_hpos, i64 1, !dbg !28 for 0x%llxth hint within @WriteBlock  --> \n", ++aesl_llvm_cbe_2638_count);
  llvm_cbe_tmp__263 = (signed int *)(&llvm_cbe_p_out_hpos[(((signed long long )1ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = load i32* %%9, align 4, !dbg !28 for 0x%llxth hint within @WriteBlock  --> \n", ++aesl_llvm_cbe_2644_count);
  llvm_cbe_tmp__264 = (unsigned int )*llvm_cbe_tmp__263;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__264);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = load i32* @p_jinfo_MCUWidth, align 4, !dbg !28 for 0x%llxth hint within @WriteBlock  --> \n", ++aesl_llvm_cbe_2645_count);
  llvm_cbe_tmp__265 = (unsigned int )*(&p_jinfo_MCUWidth);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__265);
  if ((((signed int )llvm_cbe_tmp__264) < ((signed int )llvm_cbe_tmp__265))) {
    goto llvm_cbe_tmp__266;
  } else {
    goto llvm_cbe_tmp__267;
  }

llvm_cbe_tmp__267:
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%9, align 4, !dbg !28 for 0x%llxth hint within @WriteBlock  --> \n", ++aesl_llvm_cbe_2648_count);
  *llvm_cbe_tmp__263 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
  goto llvm_cbe_tmp__266;

llvm_cbe_tmp__266:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @WriteBlock}\n");
  return;
}


void Write4Blocks(signed int *llvm_cbe_store1, signed int *llvm_cbe_store2, signed int *llvm_cbe_store3, signed int *llvm_cbe_store4, signed int *llvm_cbe_p_out_vpos, signed int *llvm_cbe_p_out_hpos,  char *llvm_cbe_p_out_buf) {
  static  unsigned long long aesl_llvm_cbe_2651_count = 0;
  static  unsigned long long aesl_llvm_cbe_2652_count = 0;
  static  unsigned long long aesl_llvm_cbe_2653_count = 0;
  static  unsigned long long aesl_llvm_cbe_2654_count = 0;
  static  unsigned long long aesl_llvm_cbe_2655_count = 0;
  static  unsigned long long aesl_llvm_cbe_2656_count = 0;
  static  unsigned long long aesl_llvm_cbe_2657_count = 0;
  static  unsigned long long aesl_llvm_cbe_2658_count = 0;
  static  unsigned long long aesl_llvm_cbe_2659_count = 0;
  static  unsigned long long aesl_llvm_cbe_2660_count = 0;
  static  unsigned long long aesl_llvm_cbe_2661_count = 0;
  static  unsigned long long aesl_llvm_cbe_2662_count = 0;
  static  unsigned long long aesl_llvm_cbe_2663_count = 0;
  static  unsigned long long aesl_llvm_cbe_2664_count = 0;
  static  unsigned long long aesl_llvm_cbe_2665_count = 0;
  static  unsigned long long aesl_llvm_cbe_2666_count = 0;
  static  unsigned long long aesl_llvm_cbe_2667_count = 0;
  static  unsigned long long aesl_llvm_cbe_2668_count = 0;
  static  unsigned long long aesl_llvm_cbe_2669_count = 0;
  static  unsigned long long aesl_llvm_cbe_2670_count = 0;
  static  unsigned long long aesl_llvm_cbe_2671_count = 0;
  static  unsigned long long aesl_llvm_cbe_2672_count = 0;
  static  unsigned long long aesl_llvm_cbe_2673_count = 0;
  static  unsigned long long aesl_llvm_cbe_2674_count = 0;
  static  unsigned long long aesl_llvm_cbe_2675_count = 0;
  static  unsigned long long aesl_llvm_cbe_2676_count = 0;
  unsigned int llvm_cbe_tmp__268;
  static  unsigned long long aesl_llvm_cbe_2677_count = 0;
  unsigned int llvm_cbe_tmp__269;
  static  unsigned long long aesl_llvm_cbe_2678_count = 0;
  static  unsigned long long aesl_llvm_cbe_2679_count = 0;
  static  unsigned long long aesl_llvm_cbe_2680_count = 0;
  static  unsigned long long aesl_llvm_cbe_2681_count = 0;
  static  unsigned long long aesl_llvm_cbe_2682_count = 0;
  static  unsigned long long aesl_llvm_cbe_2683_count = 0;
  static  unsigned long long aesl_llvm_cbe_2684_count = 0;
  unsigned int llvm_cbe_tmp__270;
  static  unsigned long long aesl_llvm_cbe_2685_count = 0;
  unsigned int llvm_cbe_tmp__271;
  static  unsigned long long aesl_llvm_cbe_2686_count = 0;
  static  unsigned long long aesl_llvm_cbe_2687_count = 0;
  static  unsigned long long aesl_llvm_cbe_2688_count = 0;
  static  unsigned long long aesl_llvm_cbe_2689_count = 0;
  static  unsigned long long aesl_llvm_cbe_2690_count = 0;
  static  unsigned long long aesl_llvm_cbe_2691_count = 0;
  static  unsigned long long aesl_llvm_cbe_2692_count = 0;
  static  unsigned long long aesl_llvm_cbe_2693_count = 0;
  static  unsigned long long aesl_llvm_cbe_2694_count = 0;
  unsigned short llvm_cbe_tmp__272;
  static  unsigned long long aesl_llvm_cbe_2695_count = 0;
  unsigned int llvm_cbe_tmp__273;
  static  unsigned long long aesl_llvm_cbe_2696_count = 0;
  unsigned short llvm_cbe_tmp__274;
  static  unsigned long long aesl_llvm_cbe_2697_count = 0;
  unsigned int llvm_cbe_tmp__275;
  static  unsigned long long aesl_llvm_cbe_2698_count = 0;
  static  unsigned long long aesl_llvm_cbe_2699_count = 0;
  unsigned int llvm_cbe_tmp__276;
  static  unsigned long long aesl_llvm_cbe_2700_count = 0;
  static  unsigned long long aesl_llvm_cbe_2701_count = 0;
  static  unsigned long long aesl_llvm_cbe_2702_count = 0;
  static  unsigned long long aesl_llvm_cbe_2703_count = 0;
  static  unsigned long long aesl_llvm_cbe_2704_count = 0;
  static  unsigned long long aesl_llvm_cbe_2705_count = 0;
  static  unsigned long long aesl_llvm_cbe_2706_count = 0;
  static  unsigned long long aesl_llvm_cbe_2707_count = 0;
  static  unsigned long long aesl_llvm_cbe_2708_count = 0;
  unsigned short llvm_cbe_tmp__277;
  static  unsigned long long aesl_llvm_cbe_2709_count = 0;
  unsigned int llvm_cbe_tmp__278;
  static  unsigned long long aesl_llvm_cbe_2710_count = 0;
  unsigned short llvm_cbe_tmp__279;
  static  unsigned long long aesl_llvm_cbe_2711_count = 0;
  unsigned int llvm_cbe_tmp__280;
  static  unsigned long long aesl_llvm_cbe_2712_count = 0;
  static  unsigned long long aesl_llvm_cbe_2713_count = 0;
  unsigned int llvm_cbe_tmp__281;
  static  unsigned long long aesl_llvm_cbe_2714_count = 0;
  static  unsigned long long aesl_llvm_cbe_2715_count = 0;
  static  unsigned long long aesl_llvm_cbe_2716_count = 0;
  static  unsigned long long aesl_llvm_cbe_2717_count = 0;
  static  unsigned long long aesl_llvm_cbe_2718_count = 0;
  static  unsigned long long aesl_llvm_cbe_2719_count = 0;
  static  unsigned long long aesl_llvm_cbe_2720_count = 0;
  static  unsigned long long aesl_llvm_cbe_2721_count = 0;
  static  unsigned long long aesl_llvm_cbe_2722_count = 0;
  static  unsigned long long aesl_llvm_cbe_2723_count = 0;
  static  unsigned long long aesl_llvm_cbe_2724_count = 0;
  static  unsigned long long aesl_llvm_cbe_2725_count = 0;
  static  unsigned long long aesl_llvm_cbe_2726_count = 0;
  static  unsigned long long aesl_llvm_cbe_2727_count = 0;
  static  unsigned long long aesl_llvm_cbe_2728_count = 0;
  unsigned short llvm_cbe_tmp__282;
  static  unsigned long long aesl_llvm_cbe_2729_count = 0;
  unsigned int llvm_cbe_tmp__283;
  static  unsigned long long aesl_llvm_cbe_2730_count = 0;
  unsigned short llvm_cbe_tmp__284;
  static  unsigned long long aesl_llvm_cbe_2731_count = 0;
  unsigned int llvm_cbe_tmp__285;
  static  unsigned long long aesl_llvm_cbe_2732_count = 0;
  static  unsigned long long aesl_llvm_cbe_2733_count = 0;
  static  unsigned long long aesl_llvm_cbe_2734_count = 0;
  static  unsigned long long aesl_llvm_cbe_2735_count = 0;
  static  unsigned long long aesl_llvm_cbe_2736_count = 0;
  static  unsigned long long aesl_llvm_cbe_2737_count = 0;
  static  unsigned long long aesl_llvm_cbe_2738_count = 0;
  static  unsigned long long aesl_llvm_cbe_2739_count = 0;
  static  unsigned long long aesl_llvm_cbe_2740_count = 0;
  static  unsigned long long aesl_llvm_cbe_2741_count = 0;
  unsigned short llvm_cbe_tmp__286;
  static  unsigned long long aesl_llvm_cbe_2742_count = 0;
  unsigned int llvm_cbe_tmp__287;
  static  unsigned long long aesl_llvm_cbe_2743_count = 0;
  unsigned short llvm_cbe_tmp__288;
  static  unsigned long long aesl_llvm_cbe_2744_count = 0;
  unsigned int llvm_cbe_tmp__289;
  static  unsigned long long aesl_llvm_cbe_2745_count = 0;
  static  unsigned long long aesl_llvm_cbe_2746_count = 0;
  unsigned int llvm_cbe_tmp__290;
  static  unsigned long long aesl_llvm_cbe_2747_count = 0;
  unsigned int llvm_cbe_tmp__291;
  static  unsigned long long aesl_llvm_cbe_2748_count = 0;
  static  unsigned long long aesl_llvm_cbe_2749_count = 0;
  unsigned int llvm_cbe_tmp__292;
  static  unsigned long long aesl_llvm_cbe_2750_count = 0;
  unsigned int llvm_cbe_tmp__293;
  static  unsigned long long aesl_llvm_cbe_2751_count = 0;
  static  unsigned long long aesl_llvm_cbe_2752_count = 0;
  unsigned int llvm_cbe_tmp__294;
  static  unsigned long long aesl_llvm_cbe_2753_count = 0;
  unsigned int llvm_cbe_tmp__295;
  static  unsigned long long aesl_llvm_cbe_2754_count = 0;
  static  unsigned long long aesl_llvm_cbe_2755_count = 0;
  static  unsigned long long aesl_llvm_cbe_2756_count = 0;
  static  unsigned long long aesl_llvm_cbe_2757_count = 0;
  static  unsigned long long aesl_llvm_cbe_2758_count = 0;
  static  unsigned long long aesl_llvm_cbe_2759_count = 0;
  static  unsigned long long aesl_llvm_cbe_2760_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @Write4Blocks\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i32* %%p_out_vpos, align 4, !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2676_count);
  llvm_cbe_tmp__268 = (unsigned int )*llvm_cbe_p_out_vpos;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__268);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = shl nsw i32 %%1, 3, !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2677_count);
  llvm_cbe_tmp__269 = (unsigned int )llvm_cbe_tmp__268 << 3u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__269);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = load i32* %%p_out_hpos, align 4, !dbg !29 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2684_count);
  llvm_cbe_tmp__270 = (unsigned int )*llvm_cbe_p_out_hpos;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__270);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = shl nsw i32 %%3, 3, !dbg !29 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2685_count);
  llvm_cbe_tmp__271 = (unsigned int )llvm_cbe_tmp__270 << 3u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__271);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = load i16* @p_jinfo_image_width, align 2, !dbg !27 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2694_count);
  llvm_cbe_tmp__272 = (unsigned short )*(&p_jinfo_image_width);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__272);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = sext i16 %%5 to i32, !dbg !27 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2695_count);
  llvm_cbe_tmp__273 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__272);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__273);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i16* @p_jinfo_image_height, align 2, !dbg !27 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2696_count);
  llvm_cbe_tmp__274 = (unsigned short )*(&p_jinfo_image_height);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__274);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = sext i16 %%7 to i32, !dbg !27 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2697_count);
  llvm_cbe_tmp__275 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__274);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__275);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @WriteOneBlock(i32* %%store1, i8* %%p_out_buf, i32 %%6, i32 %%8, i32 %%2, i32 %%4), !dbg !27 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2698_count);
   /*tail*/ WriteOneBlock((signed int *)llvm_cbe_store1, ( char *)llvm_cbe_p_out_buf, llvm_cbe_tmp__273, llvm_cbe_tmp__275, llvm_cbe_tmp__269, llvm_cbe_tmp__271);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__273);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__275);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__269);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__271);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add nsw i32 %%4, 8, !dbg !30 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2699_count);
  llvm_cbe_tmp__276 = (unsigned int )((unsigned int )(llvm_cbe_tmp__271&4294967295ull)) + ((unsigned int )(8u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__276&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = load i16* @p_jinfo_image_width, align 2, !dbg !27 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2708_count);
  llvm_cbe_tmp__277 = (unsigned short )*(&p_jinfo_image_width);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__277);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = sext i16 %%10 to i32, !dbg !27 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2709_count);
  llvm_cbe_tmp__278 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__277);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__278);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = load i16* @p_jinfo_image_height, align 2, !dbg !27 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2710_count);
  llvm_cbe_tmp__279 = (unsigned short )*(&p_jinfo_image_height);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__279);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = sext i16 %%12 to i32, !dbg !27 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2711_count);
  llvm_cbe_tmp__280 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__279);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__280);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @WriteOneBlock(i32* %%store2, i8* %%p_out_buf, i32 %%11, i32 %%13, i32 %%2, i32 %%9), !dbg !27 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2712_count);
   /*tail*/ WriteOneBlock((signed int *)llvm_cbe_store2, ( char *)llvm_cbe_p_out_buf, llvm_cbe_tmp__278, llvm_cbe_tmp__280, llvm_cbe_tmp__269, llvm_cbe_tmp__276);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__278);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__280);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__269);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__276);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = add nsw i32 %%2, 8, !dbg !30 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2713_count);
  llvm_cbe_tmp__281 = (unsigned int )((unsigned int )(llvm_cbe_tmp__269&4294967295ull)) + ((unsigned int )(8u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__281&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = load i16* @p_jinfo_image_width, align 2, !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2728_count);
  llvm_cbe_tmp__282 = (unsigned short )*(&p_jinfo_image_width);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__282);
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = sext i16 %%15 to i32, !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2729_count);
  llvm_cbe_tmp__283 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__282);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__283);
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = load i16* @p_jinfo_image_height, align 2, !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2730_count);
  llvm_cbe_tmp__284 = (unsigned short )*(&p_jinfo_image_height);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__284);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = sext i16 %%17 to i32, !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2731_count);
  llvm_cbe_tmp__285 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__284);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__285);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @WriteOneBlock(i32* %%store3, i8* %%p_out_buf, i32 %%16, i32 %%18, i32 %%14, i32 %%4), !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2732_count);
   /*tail*/ WriteOneBlock((signed int *)llvm_cbe_store3, ( char *)llvm_cbe_p_out_buf, llvm_cbe_tmp__283, llvm_cbe_tmp__285, llvm_cbe_tmp__281, llvm_cbe_tmp__271);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__283);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__285);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__281);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__271);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = load i16* @p_jinfo_image_width, align 2, !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2741_count);
  llvm_cbe_tmp__286 = (unsigned short )*(&p_jinfo_image_width);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__286);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = sext i16 %%19 to i32, !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2742_count);
  llvm_cbe_tmp__287 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__286);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__287);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = load i16* @p_jinfo_image_height, align 2, !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2743_count);
  llvm_cbe_tmp__288 = (unsigned short )*(&p_jinfo_image_height);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__288);
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = sext i16 %%21 to i32, !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2744_count);
  llvm_cbe_tmp__289 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__288);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__289);
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @WriteOneBlock(i32* %%store4, i8* %%p_out_buf, i32 %%20, i32 %%22, i32 %%14, i32 %%9), !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2745_count);
   /*tail*/ WriteOneBlock((signed int *)llvm_cbe_store4, ( char *)llvm_cbe_p_out_buf, llvm_cbe_tmp__287, llvm_cbe_tmp__289, llvm_cbe_tmp__281, llvm_cbe_tmp__276);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__287);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__289);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__281);
printf("\nArgument  = 0x%X",llvm_cbe_tmp__276);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = load i32* %%p_out_hpos, align 4, !dbg !29 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2746_count);
  llvm_cbe_tmp__290 = (unsigned int )*llvm_cbe_p_out_hpos;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__290);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = add nsw i32 %%23, 2, !dbg !29 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2747_count);
  llvm_cbe_tmp__291 = (unsigned int )((unsigned int )(llvm_cbe_tmp__290&4294967295ull)) + ((unsigned int )(2u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__291&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%24, i32* %%p_out_hpos, align 4, !dbg !29 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2748_count);
  *llvm_cbe_p_out_hpos = llvm_cbe_tmp__291;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__291);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = load i32* %%p_out_vpos, align 4, !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2749_count);
  llvm_cbe_tmp__292 = (unsigned int )*llvm_cbe_p_out_vpos;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__292);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = add nsw i32 %%25, 2, !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2750_count);
  llvm_cbe_tmp__293 = (unsigned int )((unsigned int )(llvm_cbe_tmp__292&4294967295ull)) + ((unsigned int )(2u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__293&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%26, i32* %%p_out_vpos, align 4, !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2751_count);
  *llvm_cbe_p_out_vpos = llvm_cbe_tmp__293;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__293);
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = load i32* %%p_out_hpos, align 4, !dbg !29 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2752_count);
  llvm_cbe_tmp__294 = (unsigned int )*llvm_cbe_p_out_hpos;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__294);
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = load i32* @p_jinfo_MCUWidth, align 4, !dbg !29 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2753_count);
  llvm_cbe_tmp__295 = (unsigned int )*(&p_jinfo_MCUWidth);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__295);
  if ((((signed int )llvm_cbe_tmp__294) < ((signed int )llvm_cbe_tmp__295))) {
    goto llvm_cbe_tmp__296;
  } else {
    goto llvm_cbe_tmp__297;
  }

llvm_cbe_tmp__296:
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%25, i32* %%p_out_vpos, align 4, !dbg !28 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2756_count);
  *llvm_cbe_p_out_vpos = llvm_cbe_tmp__292;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__292);
  goto llvm_cbe_tmp__298;

llvm_cbe_tmp__297:
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%p_out_hpos, align 4, !dbg !29 for 0x%llxth hint within @Write4Blocks  --> \n", ++aesl_llvm_cbe_2758_count);
  *llvm_cbe_p_out_hpos = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
  goto llvm_cbe_tmp__298;

llvm_cbe_tmp__298:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @Write4Blocks}\n");
  return;
}


void YuvToRgb(signed int llvm_cbe_p, signed int *llvm_cbe_y_buf, signed int *llvm_cbe_u_buf, signed int *llvm_cbe_v_buf) {
  static  unsigned long long aesl_llvm_cbe_2761_count = 0;
  static  unsigned long long aesl_llvm_cbe_2762_count = 0;
  static  unsigned long long aesl_llvm_cbe_2763_count = 0;
  static  unsigned long long aesl_llvm_cbe_2764_count = 0;
  static  unsigned long long aesl_llvm_cbe_2765_count = 0;
  static  unsigned long long aesl_llvm_cbe_2766_count = 0;
  static  unsigned long long aesl_llvm_cbe_2767_count = 0;
  static  unsigned long long aesl_llvm_cbe_2768_count = 0;
  static  unsigned long long aesl_llvm_cbe_2769_count = 0;
  static  unsigned long long aesl_llvm_cbe_2770_count = 0;
  static  unsigned long long aesl_llvm_cbe_2771_count = 0;
  static  unsigned long long aesl_llvm_cbe_2772_count = 0;
  static  unsigned long long aesl_llvm_cbe_2773_count = 0;
  static  unsigned long long aesl_llvm_cbe_2774_count = 0;
  static  unsigned long long aesl_llvm_cbe_2775_count = 0;
  static  unsigned long long aesl_llvm_cbe_2776_count = 0;
  static  unsigned long long aesl_llvm_cbe_2777_count = 0;
  static  unsigned long long aesl_llvm_cbe_2778_count = 0;
  static  unsigned long long aesl_llvm_cbe_2779_count = 0;
  static  unsigned long long aesl_llvm_cbe_2780_count = 0;
  unsigned long long llvm_cbe_tmp__299;
  static  unsigned long long aesl_llvm_cbe_2781_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge3_count = 0;
  unsigned int llvm_cbe_storemerge3;
  unsigned int llvm_cbe_storemerge3__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2782_count = 0;
  unsigned long long llvm_cbe_tmp__300;
  static  unsigned long long aesl_llvm_cbe_2783_count = 0;
  signed int *llvm_cbe_tmp__301;
  static  unsigned long long aesl_llvm_cbe_2784_count = 0;
  unsigned int llvm_cbe_tmp__302;
  static  unsigned long long aesl_llvm_cbe_2785_count = 0;
  static  unsigned long long aesl_llvm_cbe_2786_count = 0;
  static  unsigned long long aesl_llvm_cbe_2787_count = 0;
  static  unsigned long long aesl_llvm_cbe_2788_count = 0;
  static  unsigned long long aesl_llvm_cbe_2789_count = 0;
  signed int *llvm_cbe_tmp__303;
  static  unsigned long long aesl_llvm_cbe_2790_count = 0;
  unsigned int llvm_cbe_tmp__304;
  static  unsigned long long aesl_llvm_cbe_2791_count = 0;
  unsigned int llvm_cbe_tmp__305;
  static  unsigned long long aesl_llvm_cbe_2792_count = 0;
  static  unsigned long long aesl_llvm_cbe_2793_count = 0;
  static  unsigned long long aesl_llvm_cbe_2794_count = 0;
  static  unsigned long long aesl_llvm_cbe_2795_count = 0;
  signed int *llvm_cbe_tmp__306;
  static  unsigned long long aesl_llvm_cbe_2796_count = 0;
  unsigned int llvm_cbe_tmp__307;
  static  unsigned long long aesl_llvm_cbe_2797_count = 0;
  unsigned int llvm_cbe_tmp__308;
  static  unsigned long long aesl_llvm_cbe_2798_count = 0;
  static  unsigned long long aesl_llvm_cbe_2799_count = 0;
  static  unsigned long long aesl_llvm_cbe_2800_count = 0;
  static  unsigned long long aesl_llvm_cbe_2801_count = 0;
  unsigned int llvm_cbe_tmp__309;
  static  unsigned long long aesl_llvm_cbe_2802_count = 0;
  unsigned int llvm_cbe_tmp__310;
  static  unsigned long long aesl_llvm_cbe_2803_count = 0;
  unsigned int llvm_cbe_tmp__311;
  static  unsigned long long aesl_llvm_cbe_2804_count = 0;
  unsigned int llvm_cbe_tmp__312;
  static  unsigned long long aesl_llvm_cbe_2805_count = 0;
  unsigned int llvm_cbe_tmp__313;
  static  unsigned long long aesl_llvm_cbe_2806_count = 0;
  static  unsigned long long aesl_llvm_cbe_2807_count = 0;
  static  unsigned long long aesl_llvm_cbe_2808_count = 0;
  static  unsigned long long aesl_llvm_cbe_2809_count = 0;
  static  unsigned long long aesl_llvm_cbe_2810_count = 0;
  unsigned int llvm_cbe_tmp__314;
  static  unsigned long long aesl_llvm_cbe_2811_count = 0;
  unsigned int llvm_cbe_tmp__315;
  static  unsigned long long aesl_llvm_cbe_2812_count = 0;
  unsigned int llvm_cbe_tmp__316;
  static  unsigned long long aesl_llvm_cbe_2813_count = 0;
  unsigned int llvm_cbe_tmp__317;
  static  unsigned long long aesl_llvm_cbe_2814_count = 0;
  unsigned int llvm_cbe_tmp__318;
  static  unsigned long long aesl_llvm_cbe_2815_count = 0;
  static  unsigned long long aesl_llvm_cbe_2816_count = 0;
  static  unsigned long long aesl_llvm_cbe_2817_count = 0;
  static  unsigned long long aesl_llvm_cbe_2818_count = 0;
  static  unsigned long long aesl_llvm_cbe_2819_count = 0;
  unsigned int llvm_cbe_tmp__319;
  static  unsigned long long aesl_llvm_cbe_2820_count = 0;
  unsigned int llvm_cbe_tmp__320;
  static  unsigned long long aesl_llvm_cbe_2821_count = 0;
  unsigned int llvm_cbe_tmp__321;
  static  unsigned long long aesl_llvm_cbe_2822_count = 0;
  static  unsigned long long aesl_llvm_cbe_2823_count = 0;
  static  unsigned long long aesl_llvm_cbe_2824_count = 0;
  static  unsigned long long aesl_llvm_cbe_2825_count = 0;
  static  unsigned long long aesl_llvm_cbe_2826_count = 0;
  static  unsigned long long aesl_llvm_cbe_2827_count = 0;
  static  unsigned long long aesl_llvm_cbe_2828_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned int llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe_2829_count = 0;
  static  unsigned long long aesl_llvm_cbe_2830_count = 0;
  unsigned int llvm_cbe_tmp__322;
  unsigned int llvm_cbe_tmp__322__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2831_count = 0;
  static  unsigned long long aesl_llvm_cbe_2832_count = 0;
  static  unsigned long long aesl_llvm_cbe_2833_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_1_count = 0;
  unsigned int llvm_cbe__2e_1;
  static  unsigned long long aesl_llvm_cbe_2834_count = 0;
  static  unsigned long long aesl_llvm_cbe_2835_count = 0;
  unsigned int llvm_cbe_tmp__323;
  unsigned int llvm_cbe_tmp__323__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2836_count = 0;
  static  unsigned long long aesl_llvm_cbe_2837_count = 0;
  static  unsigned long long aesl_llvm_cbe_2838_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_2_count = 0;
  unsigned int llvm_cbe__2e_2;
  static  unsigned long long aesl_llvm_cbe_2839_count = 0;
  static  unsigned long long aesl_llvm_cbe_2840_count = 0;
  unsigned int llvm_cbe_tmp__324;
  unsigned int llvm_cbe_tmp__324__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2841_count = 0;
  signed int *llvm_cbe_tmp__325;
  static  unsigned long long aesl_llvm_cbe_2842_count = 0;
  static  unsigned long long aesl_llvm_cbe_2843_count = 0;
  signed int *llvm_cbe_tmp__326;
  static  unsigned long long aesl_llvm_cbe_2844_count = 0;
  static  unsigned long long aesl_llvm_cbe_2845_count = 0;
  signed int *llvm_cbe_tmp__327;
  static  unsigned long long aesl_llvm_cbe_2846_count = 0;
  static  unsigned long long aesl_llvm_cbe_2847_count = 0;
  unsigned int llvm_cbe_tmp__328;
  static  unsigned long long aesl_llvm_cbe_2848_count = 0;
  static  unsigned long long aesl_llvm_cbe_2849_count = 0;
  static  unsigned long long aesl_llvm_cbe_2850_count = 0;
  static  unsigned long long aesl_llvm_cbe_2851_count = 0;
  static  unsigned long long aesl_llvm_cbe_2852_count = 0;
  static  unsigned long long aesl_llvm_cbe_2853_count = 0;
  static  unsigned long long aesl_llvm_cbe_2854_count = 0;
  static  unsigned long long aesl_llvm_cbe_2855_count = 0;
  static  unsigned long long aesl_llvm_cbe_2856_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_2857_count = 0;
  static  unsigned long long aesl_llvm_cbe_2858_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @YuvToRgb\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = sext i32 %%p to i64, !dbg !27 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2780_count);
  llvm_cbe_tmp__299 = (unsigned long long )((signed long long )(signed int )llvm_cbe_p);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__299);
  llvm_cbe_storemerge3__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe_tmp__329;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__329:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge3 = phi i32 [ 0, %%0 ], [ %%43, %%38  for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_storemerge3_count);
  llvm_cbe_storemerge3 = (unsigned int )llvm_cbe_storemerge3__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge3 = 0x%X",llvm_cbe_storemerge3);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__328);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = sext i32 %%storemerge3 to i64, !dbg !28 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2782_count);
  llvm_cbe_tmp__300 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge3);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__300);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = getelementptr inbounds i32* %%y_buf, i64 %%3, !dbg !28 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2783_count);
  llvm_cbe_tmp__301 = (signed int *)(&llvm_cbe_y_buf[(((signed long long )llvm_cbe_tmp__300))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__300));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = load i32* %%4, align 4, !dbg !28 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2784_count);
  llvm_cbe_tmp__302 = (unsigned int )*llvm_cbe_tmp__301;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__302);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds i32* %%u_buf, i64 %%3, !dbg !28 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2789_count);
  llvm_cbe_tmp__303 = (signed int *)(&llvm_cbe_u_buf[(((signed long long )llvm_cbe_tmp__300))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__300));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i32* %%6, align 4, !dbg !28 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2790_count);
  llvm_cbe_tmp__304 = (unsigned int )*llvm_cbe_tmp__303;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__304);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%7, -128, !dbg !28 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2791_count);
  llvm_cbe_tmp__305 = (unsigned int )((unsigned int )(llvm_cbe_tmp__304&4294967295ull)) + ((unsigned int )(4294967168u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__305&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = getelementptr inbounds i32* %%v_buf, i64 %%3, !dbg !28 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2795_count);
  llvm_cbe_tmp__306 = (signed int *)(&llvm_cbe_v_buf[(((signed long long )llvm_cbe_tmp__300))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__300));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = load i32* %%9, align 4, !dbg !28 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2796_count);
  llvm_cbe_tmp__307 = (unsigned int )*llvm_cbe_tmp__306;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__307);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = add nsw i32 %%10, -128, !dbg !28 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2797_count);
  llvm_cbe_tmp__308 = (unsigned int )((unsigned int )(llvm_cbe_tmp__307&4294967295ull)) + ((unsigned int )(4294967168u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__308&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = shl nsw i32 %%5, 8, !dbg !29 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2801_count);
  llvm_cbe_tmp__309 = (unsigned int )llvm_cbe_tmp__302 << 8u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__309);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = mul nsw i32 %%11, 359, !dbg !29 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2802_count);
  llvm_cbe_tmp__310 = (unsigned int )((unsigned int )(llvm_cbe_tmp__308&4294967295ull)) * ((unsigned int )(359u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__310&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = or i32 %%12, 128, !dbg !29 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2803_count);
  llvm_cbe_tmp__311 = (unsigned int )llvm_cbe_tmp__309 | 128u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__311);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = add i32 %%14, %%13, !dbg !29 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2804_count);
  llvm_cbe_tmp__312 = (unsigned int )((unsigned int )(llvm_cbe_tmp__311&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__310&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__312&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = ashr i32 %%15, 8, !dbg !29 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2805_count);
  llvm_cbe_tmp__313 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__312) >> ((signed int )8u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__313));
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = mul i32 %%8, -88, !dbg !29 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2810_count);
  llvm_cbe_tmp__314 = (unsigned int )((unsigned int )(llvm_cbe_tmp__305&4294967295ull)) * ((unsigned int )(4294967208u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__314&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = mul i32 %%11, -182, !dbg !29 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2811_count);
  llvm_cbe_tmp__315 = (unsigned int )((unsigned int )(llvm_cbe_tmp__308&4294967295ull)) * ((unsigned int )(4294967114u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__315&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = add i32 %%14, %%17, !dbg !29 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2812_count);
  llvm_cbe_tmp__316 = (unsigned int )((unsigned int )(llvm_cbe_tmp__311&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__314&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__316&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = add i32 %%19, %%18, !dbg !29 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2813_count);
  llvm_cbe_tmp__317 = (unsigned int )((unsigned int )(llvm_cbe_tmp__316&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__315&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__317&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = ashr i32 %%20, 8, !dbg !29 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2814_count);
  llvm_cbe_tmp__318 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__317) >> ((signed int )8u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__318));
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = mul nsw i32 %%8, 454, !dbg !29 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2819_count);
  llvm_cbe_tmp__319 = (unsigned int )((unsigned int )(llvm_cbe_tmp__305&4294967295ull)) * ((unsigned int )(454u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__319&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = add i32 %%14, %%22, !dbg !29 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2820_count);
  llvm_cbe_tmp__320 = (unsigned int )((unsigned int )(llvm_cbe_tmp__311&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__319&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__320&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = ashr i32 %%23, 8, !dbg !29 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2821_count);
  llvm_cbe_tmp__321 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__320) >> ((signed int )8u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__321));
  if ((((signed int )llvm_cbe_tmp__313) < ((signed int )0u))) {
    llvm_cbe_tmp__322__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe_tmp__330;
  } else {
    goto llvm_cbe_tmp__331;
  }

llvm_cbe_tmp__332:
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = phi i32 [ 0, %%33 ], [ %%.2, %%36  for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2840_count);
  llvm_cbe_tmp__324 = (unsigned int )llvm_cbe_tmp__324__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__324);
printf("\n = 0x%X",0u);
printf("\n.2 = 0x%X",llvm_cbe__2e_2);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = getelementptr inbounds [4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 %%1, i64 0, i64 %%3, !dbg !27 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2841_count);
  llvm_cbe_tmp__325 = (signed int *)(&rgb_buf[(((signed long long )llvm_cbe_tmp__299))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )llvm_cbe_tmp__300))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__299));
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__300));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__299) < 4 && "Write access out of array 'rgb_buf' bound?");
  assert(((signed long long )0ull) < 3 && "Write access out of array 'rgb_buf' bound?");
  assert(((signed long long )llvm_cbe_tmp__300) < 64 && "Write access out of array 'rgb_buf' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%29, i32* %%40, align 4, !dbg !27 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2842_count);
  *llvm_cbe_tmp__325 = llvm_cbe_tmp__322;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__322);
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = getelementptr inbounds [4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 %%1, i64 1, i64 %%3, !dbg !27 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2843_count);
  llvm_cbe_tmp__326 = (signed int *)(&rgb_buf[(((signed long long )llvm_cbe_tmp__299))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )llvm_cbe_tmp__300))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__299));
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__300));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__299) < 4 && "Write access out of array 'rgb_buf' bound?");
  assert(((signed long long )1ull) < 3 && "Write access out of array 'rgb_buf' bound?");
  assert(((signed long long )llvm_cbe_tmp__300) < 64 && "Write access out of array 'rgb_buf' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%34, i32* %%41, align 4, !dbg !27 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2844_count);
  *llvm_cbe_tmp__326 = llvm_cbe_tmp__323;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__323);
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = getelementptr inbounds [4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 %%1, i64 2, i64 %%3, !dbg !27 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2845_count);
  llvm_cbe_tmp__327 = (signed int *)(&rgb_buf[(((signed long long )llvm_cbe_tmp__299))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )llvm_cbe_tmp__300))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__299));
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__300));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__299) < 4 && "Write access out of array 'rgb_buf' bound?");
  assert(((signed long long )2ull) < 3 && "Write access out of array 'rgb_buf' bound?");
  assert(((signed long long )llvm_cbe_tmp__300) < 64 && "Write access out of array 'rgb_buf' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%39, i32* %%42, align 4, !dbg !27 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2846_count);
  *llvm_cbe_tmp__327 = llvm_cbe_tmp__324;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__324);
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = add nsw i32 %%storemerge3, 1, !dbg !29 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2847_count);
  llvm_cbe_tmp__328 = (unsigned int )((unsigned int )(llvm_cbe_storemerge3&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__328&4294967295ull)));
  if (((llvm_cbe_tmp__328&4294967295U) == (64u&4294967295U))) {
    goto llvm_cbe_tmp__333;
  } else {
    llvm_cbe_storemerge3__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__328;   /* for PHI node */
    goto llvm_cbe_tmp__329;
  }

llvm_cbe_tmp__334:
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = phi i32 [ 0, %%28 ], [ %%.1, %%31  for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2835_count);
  llvm_cbe_tmp__323 = (unsigned int )llvm_cbe_tmp__323__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__323);
printf("\n = 0x%X",0u);
printf("\n.1 = 0x%X",llvm_cbe__2e_1);
}
  if ((((signed int )llvm_cbe_tmp__321) < ((signed int )0u))) {
    llvm_cbe_tmp__324__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe_tmp__332;
  } else {
    goto llvm_cbe_tmp__335;
  }

llvm_cbe_tmp__330:
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = phi i32 [ 0, %%2 ], [ %%., %%26  for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe_2830_count);
  llvm_cbe_tmp__322 = (unsigned int )llvm_cbe_tmp__322__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__322);
printf("\n = 0x%X",0u);
printf("\n. = 0x%X",llvm_cbe__2e_);
}
  if ((((signed int )llvm_cbe_tmp__318) < ((signed int )0u))) {
    llvm_cbe_tmp__323__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe_tmp__334;
  } else {
    goto llvm_cbe_tmp__336;
  }

llvm_cbe_tmp__331:
if (AESL_DEBUG_TRACE)
printf("\n  %%. = select i1 %%27, i32 255, i32 %%16, !dbg !30 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned int )(((((signed int )llvm_cbe_tmp__313) > ((signed int )255u))) ? ((unsigned int )255u) : ((unsigned int )llvm_cbe_tmp__313));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", llvm_cbe__2e_);
  llvm_cbe_tmp__322__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_;   /* for PHI node */
  goto llvm_cbe_tmp__330;

llvm_cbe_tmp__336:
if (AESL_DEBUG_TRACE)
printf("\n  %%.1 = select i1 %%32, i32 255, i32 %%21, !dbg !30 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe__2e_1_count);
  llvm_cbe__2e_1 = (unsigned int )(((((signed int )llvm_cbe_tmp__318) > ((signed int )255u))) ? ((unsigned int )255u) : ((unsigned int )llvm_cbe_tmp__318));
if (AESL_DEBUG_TRACE)
printf("\n.1 = 0x%X\n", llvm_cbe__2e_1);
  llvm_cbe_tmp__323__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_1;   /* for PHI node */
  goto llvm_cbe_tmp__334;

llvm_cbe_tmp__335:
if (AESL_DEBUG_TRACE)
printf("\n  %%.2 = select i1 %%37, i32 255, i32 %%24, !dbg !30 for 0x%llxth hint within @YuvToRgb  --> \n", ++aesl_llvm_cbe__2e_2_count);
  llvm_cbe__2e_2 = (unsigned int )(((((signed int )llvm_cbe_tmp__321) > ((signed int )255u))) ? ((unsigned int )255u) : ((unsigned int )llvm_cbe_tmp__321));
if (AESL_DEBUG_TRACE)
printf("\n.2 = 0x%X\n", llvm_cbe__2e_2);
  llvm_cbe_tmp__324__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_2;   /* for PHI node */
  goto llvm_cbe_tmp__332;

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__333:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @YuvToRgb}\n");
  return;
}


signed int buf_getb(void) {
  static  unsigned long long aesl_llvm_cbe_2859_count = 0;
  unsigned int llvm_cbe_tmp__337;
  static  unsigned long long aesl_llvm_cbe_2860_count = 0;
  static  unsigned long long aesl_llvm_cbe_2861_count = 0;
  static  unsigned long long aesl_llvm_cbe_2862_count = 0;
  unsigned int llvm_cbe_tmp__338;
  static  unsigned long long aesl_llvm_cbe_2863_count = 0;
  static  unsigned long long aesl_llvm_cbe_2864_count = 0;
  static  unsigned long long aesl_llvm_cbe_2865_count = 0;
  static  unsigned long long aesl_llvm_cbe_2866_count = 0;
  unsigned int llvm_cbe_tmp__339;
  unsigned int llvm_cbe_tmp__339__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2867_count = 0;
  unsigned int llvm_cbe_tmp__340;
  static  unsigned long long aesl_llvm_cbe_2868_count = 0;
  unsigned int llvm_cbe_tmp__341;
  static  unsigned long long aesl_llvm_cbe_2869_count = 0;
  static  unsigned long long aesl_llvm_cbe_2870_count = 0;
  unsigned long long llvm_cbe_tmp__342;
  static  unsigned long long aesl_llvm_cbe_2871_count = 0;
  signed int *llvm_cbe_tmp__343;
  static  unsigned long long aesl_llvm_cbe_2872_count = 0;
  unsigned int llvm_cbe_tmp__344;
  static  unsigned long long aesl_llvm_cbe_2873_count = 0;
  unsigned int llvm_cbe_tmp__345;
  static  unsigned long long aesl_llvm_cbe_2874_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
  unsigned int llvm_cbe_storemerge;
  static  unsigned long long aesl_llvm_cbe_2875_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @buf_getb\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i32* @aesl_internal_read_position, align 4, !dbg !27 for 0x%llxth hint within @buf_getb  --> \n", ++aesl_llvm_cbe_2859_count);
  llvm_cbe_tmp__337 = (unsigned int )*(&aesl_internal_read_position);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__337);
  if ((((signed int )llvm_cbe_tmp__337) < ((signed int )0u))) {
    goto llvm_cbe_tmp__346;
  } else {
    llvm_cbe_tmp__339__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__337;   /* for PHI node */
    goto llvm_cbe_tmp__347;
  }

llvm_cbe_tmp__346:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = tail call fastcc i32 @aesl_internal_pgetc(), !dbg !27 for 0x%llxth hint within @buf_getb  --> \n", ++aesl_llvm_cbe_2862_count);
  llvm_cbe_tmp__338 = (unsigned int ) /*tail*/ aesl_internal_pgetc();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__338);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%4, i32* @aesl_internal_current_read_byte, align 4, !dbg !27 for 0x%llxth hint within @buf_getb  --> \n", ++aesl_llvm_cbe_2863_count);
  *(&aesl_internal_current_read_byte) = llvm_cbe_tmp__338;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__338);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 7, i32* @aesl_internal_read_position, align 4, !dbg !27 for 0x%llxth hint within @buf_getb  --> \n", ++aesl_llvm_cbe_2864_count);
  *(&aesl_internal_read_position) = 7u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 7u);
  llvm_cbe_tmp__339__PHI_TEMPORARY = (unsigned int )7u;   /* for PHI node */
  goto llvm_cbe_tmp__347;

llvm_cbe_tmp__347:
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = phi i32 [ 7, %%3 ], [ %%1, %%0  for 0x%llxth hint within @buf_getb  --> \n", ++aesl_llvm_cbe_2866_count);
  llvm_cbe_tmp__339 = (unsigned int )llvm_cbe_tmp__339__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__339);
printf("\n = 0x%X",7u);
printf("\n = 0x%X",llvm_cbe_tmp__337);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i32* @aesl_internal_current_read_byte, align 4, !dbg !27 for 0x%llxth hint within @buf_getb  --> \n", ++aesl_llvm_cbe_2867_count);
  llvm_cbe_tmp__340 = (unsigned int )*(&aesl_internal_current_read_byte);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__340);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%6, -1, !dbg !27 for 0x%llxth hint within @buf_getb  --> \n", ++aesl_llvm_cbe_2868_count);
  llvm_cbe_tmp__341 = (unsigned int )((unsigned int )(llvm_cbe_tmp__339&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__341&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%8, i32* @aesl_internal_read_position, align 4, !dbg !27 for 0x%llxth hint within @buf_getb  --> \n", ++aesl_llvm_cbe_2869_count);
  *(&aesl_internal_read_position) = llvm_cbe_tmp__341;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__341);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = sext i32 %%6 to i64, !dbg !27 for 0x%llxth hint within @buf_getb  --> \n", ++aesl_llvm_cbe_2870_count);
  llvm_cbe_tmp__342 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__339);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__342);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = getelementptr inbounds [32 x i32]* @bit_set_mask, i64 0, i64 %%9, !dbg !27 for 0x%llxth hint within @buf_getb  --> \n", ++aesl_llvm_cbe_2871_count);
  llvm_cbe_tmp__343 = (signed int *)(&bit_set_mask[(((signed long long )llvm_cbe_tmp__342))
#ifdef AESL_BC_SIM
 % 32
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__342));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__342) < 32)) fprintf(stderr, "%s:%d: warning: Read access out of array 'bit_set_mask' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = load i32* %%10, align 4, !dbg !27 for 0x%llxth hint within @buf_getb  --> \n", ++aesl_llvm_cbe_2872_count);
  llvm_cbe_tmp__344 = (unsigned int )*llvm_cbe_tmp__343;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__344);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = and i32 %%11, %%7, !dbg !27 for 0x%llxth hint within @buf_getb  --> \n", ++aesl_llvm_cbe_2873_count);
  llvm_cbe_tmp__345 = (unsigned int )llvm_cbe_tmp__344 & llvm_cbe_tmp__340;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__345);
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = select i1 %%13, i32 0, i32 1, !dbg !27 for 0x%llxth hint within @buf_getb  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = (unsigned int )((((llvm_cbe_tmp__345&4294967295U) == (0u&4294967295U))) ? ((unsigned int )0u) : ((unsigned int )1u));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge = 0x%X\n", llvm_cbe_storemerge);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @buf_getb}\n");
  return llvm_cbe_storemerge;
}


signed int buf_getv(signed int llvm_cbe_n) {
  static  unsigned long long aesl_llvm_cbe_2876_count = 0;
  static  unsigned long long aesl_llvm_cbe_2877_count = 0;
  unsigned int llvm_cbe_tmp__348;
  static  unsigned long long aesl_llvm_cbe_2878_count = 0;
  static  unsigned long long aesl_llvm_cbe_2879_count = 0;
  static  unsigned long long aesl_llvm_cbe_2880_count = 0;
  static  unsigned long long aesl_llvm_cbe_2881_count = 0;
  static  unsigned long long aesl_llvm_cbe_2882_count = 0;
  static  unsigned long long aesl_llvm_cbe_2883_count = 0;
  static  unsigned long long aesl_llvm_cbe_2884_count = 0;
  unsigned int llvm_cbe_tmp__349;
  static  unsigned long long aesl_llvm_cbe_2885_count = 0;
  unsigned int llvm_cbe_tmp__350;
  static  unsigned long long aesl_llvm_cbe_2886_count = 0;
  static  unsigned long long aesl_llvm_cbe_2887_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
  unsigned int llvm_cbe_storemerge;
  unsigned int llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2888_count = 0;
  static  unsigned long long aesl_llvm_cbe_2889_count = 0;
  static  unsigned long long aesl_llvm_cbe_2890_count = 0;
  static  unsigned long long aesl_llvm_cbe_2891_count = 0;
  static  unsigned long long aesl_llvm_cbe_2892_count = 0;
  static  unsigned long long aesl_llvm_cbe_2893_count = 0;
  static  unsigned long long aesl_llvm_cbe_2894_count = 0;
  static  unsigned long long aesl_llvm_cbe_2895_count = 0;
  static  unsigned long long aesl_llvm_cbe_2896_count = 0;
  static  unsigned long long aesl_llvm_cbe_2897_count = 0;
  static  unsigned long long aesl_llvm_cbe_2898_count = 0;
  static  unsigned long long aesl_llvm_cbe_2899_count = 0;
  unsigned int llvm_cbe_tmp__351;
  static  unsigned long long aesl_llvm_cbe_2900_count = 0;
  static  unsigned long long aesl_llvm_cbe_2901_count = 0;
  static  unsigned long long aesl_llvm_cbe_2902_count = 0;
  unsigned int llvm_cbe_tmp__352;
  static  unsigned long long aesl_llvm_cbe_2903_count = 0;
  unsigned int llvm_cbe_tmp__353;
  static  unsigned long long aesl_llvm_cbe_2904_count = 0;
  static  unsigned long long aesl_llvm_cbe_2905_count = 0;
  static  unsigned long long aesl_llvm_cbe_2906_count = 0;
  static  unsigned long long aesl_llvm_cbe_2907_count = 0;
  unsigned int llvm_cbe_tmp__354;
  static  unsigned long long aesl_llvm_cbe_2908_count = 0;
  static  unsigned long long aesl_llvm_cbe_2909_count = 0;
  unsigned int llvm_cbe_tmp__355;
  static  unsigned long long aesl_llvm_cbe_2910_count = 0;
  unsigned int llvm_cbe_tmp__356;
  static  unsigned long long aesl_llvm_cbe_2911_count = 0;
  unsigned int llvm_cbe_tmp__357;
  static  unsigned long long aesl_llvm_cbe_2912_count = 0;
  static  unsigned long long aesl_llvm_cbe_2913_count = 0;
  static  unsigned long long aesl_llvm_cbe_2914_count = 0;
  static  unsigned long long aesl_llvm_cbe_2915_count = 0;
  unsigned int llvm_cbe_tmp__358;
  static  unsigned long long aesl_llvm_cbe_2916_count = 0;
  static  unsigned long long aesl_llvm_cbe_2917_count = 0;
  unsigned long long llvm_cbe_tmp__359;
  static  unsigned long long aesl_llvm_cbe_2918_count = 0;
  signed int *llvm_cbe_tmp__360;
  static  unsigned long long aesl_llvm_cbe_2919_count = 0;
  unsigned int llvm_cbe_tmp__361;
  static  unsigned long long aesl_llvm_cbe_2920_count = 0;
  unsigned int llvm_cbe_tmp__362;
  static  unsigned long long aesl_llvm_cbe_2921_count = 0;
  static  unsigned long long aesl_llvm_cbe_2922_count = 0;
  unsigned int llvm_cbe_tmp__363;
  static  unsigned long long aesl_llvm_cbe_2923_count = 0;
  unsigned int llvm_cbe_tmp__364;
  static  unsigned long long aesl_llvm_cbe_2924_count = 0;
  unsigned int llvm_cbe_tmp__365;
  static  unsigned long long aesl_llvm_cbe_2925_count = 0;
  unsigned int llvm_cbe_tmp__366;
  static  unsigned long long aesl_llvm_cbe_2926_count = 0;
  static  unsigned long long aesl_llvm_cbe_2927_count = 0;
  unsigned int llvm_cbe_tmp__367;
  static  unsigned long long aesl_llvm_cbe_2928_count = 0;
  unsigned int llvm_cbe_tmp__368;
  static  unsigned long long aesl_llvm_cbe_2929_count = 0;
  static  unsigned long long aesl_llvm_cbe_2930_count = 0;
  unsigned int llvm_cbe_tmp__369;
  static  unsigned long long aesl_llvm_cbe_2931_count = 0;
  static  unsigned long long aesl_llvm_cbe_2932_count = 0;
  static  unsigned long long aesl_llvm_cbe_2933_count = 0;
  static  unsigned long long aesl_llvm_cbe_2934_count = 0;
  static  unsigned long long aesl_llvm_cbe_2935_count = 0;
  static  unsigned long long aesl_llvm_cbe_2936_count = 0;
  unsigned int llvm_cbe_tmp__370;
  static  unsigned long long aesl_llvm_cbe_2937_count = 0;
  unsigned long long llvm_cbe_tmp__371;
  static  unsigned long long aesl_llvm_cbe_2938_count = 0;
  signed int *llvm_cbe_tmp__372;
  static  unsigned long long aesl_llvm_cbe_2939_count = 0;
  unsigned int llvm_cbe_tmp__373;
  static  unsigned long long aesl_llvm_cbe_2940_count = 0;
  unsigned int llvm_cbe_tmp__374;
  static  unsigned long long aesl_llvm_cbe_2941_count = 0;
  static  unsigned long long aesl_llvm_cbe_2942_count = 0;
  unsigned int llvm_cbe_tmp__375;
  static  unsigned long long aesl_llvm_cbe_2943_count = 0;
  static  unsigned long long aesl_llvm_cbe_2944_count = 0;
  static  unsigned long long aesl_llvm_cbe_2945_count = 0;
  static  unsigned long long aesl_llvm_cbe_2946_count = 0;
  static  unsigned long long aesl_llvm_cbe_2947_count = 0;
  static  unsigned long long aesl_llvm_cbe_2948_count = 0;
  static  unsigned long long aesl_llvm_cbe_2949_count = 0;
  static  unsigned long long aesl_llvm_cbe_2950_count = 0;
  static  unsigned long long aesl_llvm_cbe_2951_count = 0;
  static  unsigned long long aesl_llvm_cbe_2952_count = 0;
  static  unsigned long long aesl_llvm_cbe_2953_count = 0;
  unsigned int llvm_cbe_tmp__376;
  static  unsigned long long aesl_llvm_cbe_2954_count = 0;
  static  unsigned long long aesl_llvm_cbe_2955_count = 0;
  unsigned int llvm_cbe_tmp__377;
  static  unsigned long long aesl_llvm_cbe_2956_count = 0;
  unsigned int llvm_cbe_tmp__378;
  static  unsigned long long aesl_llvm_cbe_2957_count = 0;
  unsigned long long llvm_cbe_tmp__379;
  static  unsigned long long aesl_llvm_cbe_2958_count = 0;
  signed int *llvm_cbe_tmp__380;
  static  unsigned long long aesl_llvm_cbe_2959_count = 0;
  unsigned int llvm_cbe_tmp__381;
  static  unsigned long long aesl_llvm_cbe_2960_count = 0;
  unsigned int llvm_cbe_tmp__382;
  static  unsigned long long aesl_llvm_cbe_2961_count = 0;
  static  unsigned long long aesl_llvm_cbe_2962_count = 0;
  unsigned int llvm_cbe_tmp__383;
  unsigned int llvm_cbe_tmp__383__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2963_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @buf_getv\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = add nsw i32 %%n, -1, !dbg !27 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2877_count);
  llvm_cbe_tmp__348 = (unsigned int )((unsigned int )(llvm_cbe_n&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__348&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = load i32* @aesl_internal_read_position, align 4, !dbg !27 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2884_count);
  llvm_cbe_tmp__349 = (unsigned int )*(&aesl_internal_read_position);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__349);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = sub nsw i32 %%1, %%2, !dbg !27 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2885_count);
  llvm_cbe_tmp__350 = (unsigned int )((unsigned int )(llvm_cbe_tmp__348&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__349&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__350&4294967295ull)));
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__350;   /* for PHI node */
  goto llvm_cbe_tmp__384;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__384:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i32 [ %%3, %%0 ], [ %%28, %%21  for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = (unsigned int )llvm_cbe_storemerge__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge = 0x%X",llvm_cbe_storemerge);
printf("\n = 0x%X",llvm_cbe_tmp__350);
printf("\n = 0x%X",llvm_cbe_tmp__369);
}
  if ((((signed int )llvm_cbe_storemerge) > ((signed int )0u))) {
    goto llvm_cbe_tmp__385;
  } else {
    goto llvm_cbe_tmp__386;
  }

llvm_cbe_tmp__387:
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = load i32* @aesl_internal_current_read_byte, align 4, !dbg !29 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2922_count);
  llvm_cbe_tmp__363 = (unsigned int )*(&aesl_internal_current_read_byte);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__363);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = shl i32 %%22, 8, !dbg !29 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2923_count);
  llvm_cbe_tmp__364 = (unsigned int )llvm_cbe_tmp__363 << 8u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__364);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = tail call fastcc i32 @aesl_internal_pgetc(), !dbg !29 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2924_count);
  llvm_cbe_tmp__365 = (unsigned int ) /*tail*/ aesl_internal_pgetc();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__365);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = or i32 %%23, %%24, !dbg !29 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2925_count);
  llvm_cbe_tmp__366 = (unsigned int )llvm_cbe_tmp__364 | llvm_cbe_tmp__365;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__366);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%25, i32* @aesl_internal_current_read_byte, align 4, !dbg !29 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2926_count);
  *(&aesl_internal_current_read_byte) = llvm_cbe_tmp__366;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__366);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = load i32* @aesl_internal_read_position, align 4, !dbg !29 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2927_count);
  llvm_cbe_tmp__367 = (unsigned int )*(&aesl_internal_read_position);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__367);
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = add nsw i32 %%26, 8, !dbg !29 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2928_count);
  llvm_cbe_tmp__368 = (unsigned int )((unsigned int )(llvm_cbe_tmp__367&4294967295ull)) + ((unsigned int )(8u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__368&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%27, i32* @aesl_internal_read_position, align 4, !dbg !29 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2929_count);
  *(&aesl_internal_read_position) = llvm_cbe_tmp__368;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__368);
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = add nsw i32 %%storemerge, -8, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2930_count);
  llvm_cbe_tmp__369 = (unsigned int )((unsigned int )(llvm_cbe_storemerge&4294967295ull)) + ((unsigned int )(4294967288u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__369&4294967295ull)));
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__369;   /* for PHI node */
  goto llvm_cbe_tmp__384;

llvm_cbe_tmp__385:
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i32* @aesl_internal_read_position, align 4, !dbg !29 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2899_count);
  llvm_cbe_tmp__351 = (unsigned int )*(&aesl_internal_read_position);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__351);
  if ((((signed int )llvm_cbe_tmp__351) > ((signed int )23u))) {
    goto llvm_cbe_tmp__388;
  } else {
    goto llvm_cbe_tmp__387;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__388:
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = load i32* @aesl_internal_current_read_byte, align 4, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2902_count);
  llvm_cbe_tmp__352 = (unsigned int )*(&aesl_internal_current_read_byte);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__352);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = shl i32 %%10, %%storemerge, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2903_count);
  llvm_cbe_tmp__353 = (unsigned int )llvm_cbe_tmp__352 << llvm_cbe_storemerge;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__353);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = tail call fastcc i32 @aesl_internal_pgetc(), !dbg !29 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2907_count);
  llvm_cbe_tmp__354 = (unsigned int ) /*tail*/ aesl_internal_pgetc();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__354);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%12, i32* @aesl_internal_current_read_byte, align 4, !dbg !29 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2908_count);
  *(&aesl_internal_current_read_byte) = llvm_cbe_tmp__354;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__354);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = sub nsw i32 8, %%storemerge, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2909_count);
  llvm_cbe_tmp__355 = (unsigned int )((unsigned int )(8u&4294967295ull)) - ((unsigned int )(llvm_cbe_storemerge&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__355&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = lshr i32 %%12, %%13, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2910_count);
  llvm_cbe_tmp__356 = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_tmp__354&4294967295ull)) >> ((unsigned int )(llvm_cbe_tmp__355&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__356&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = or i32 %%14, %%11, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2911_count);
  llvm_cbe_tmp__357 = (unsigned int )llvm_cbe_tmp__356 | llvm_cbe_tmp__353;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__357);
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = sub nsw i32 7, %%storemerge, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2915_count);
  llvm_cbe_tmp__358 = (unsigned int )((unsigned int )(7u&4294967295ull)) - ((unsigned int )(llvm_cbe_storemerge&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__358&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%16, i32* @aesl_internal_read_position, align 4, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2916_count);
  *(&aesl_internal_read_position) = llvm_cbe_tmp__358;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__358);
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = sext i32 %%1 to i64, !dbg !27 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2917_count);
  llvm_cbe_tmp__359 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__348);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__359);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds [32 x i32]* @lmask, i64 0, i64 %%17, !dbg !27 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2918_count);
  llvm_cbe_tmp__360 = (signed int *)(&lmask[(((signed long long )llvm_cbe_tmp__359))
#ifdef AESL_BC_SIM
 % 32
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__359));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__359) < 32)) fprintf(stderr, "%s:%d: warning: Read access out of array 'lmask' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = load i32* %%18, align 4, !dbg !27 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2919_count);
  llvm_cbe_tmp__361 = (unsigned int )*llvm_cbe_tmp__360;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__361);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = and i32 %%15, %%19, !dbg !27 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2920_count);
  llvm_cbe_tmp__362 = (unsigned int )llvm_cbe_tmp__357 & llvm_cbe_tmp__361;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__362);
  llvm_cbe_tmp__383__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__362;   /* for PHI node */
  goto llvm_cbe_tmp__389;

llvm_cbe_tmp__386:
  if (((llvm_cbe_storemerge&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__390;
  } else {
    goto llvm_cbe_tmp__391;
  }

llvm_cbe_tmp__390:
if (AESL_DEBUG_TRACE)
printf("\n  store i32 -1, i32* @aesl_internal_read_position, align 4, !dbg !29 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2935_count);
  *(&aesl_internal_read_position) = 4294967295u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 4294967295u);
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = load i32* @aesl_internal_current_read_byte, align 4, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2936_count);
  llvm_cbe_tmp__370 = (unsigned int )*(&aesl_internal_current_read_byte);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__370);
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = sext i32 %%1 to i64, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2937_count);
  llvm_cbe_tmp__371 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__348);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__371);
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = getelementptr inbounds [32 x i32]* @lmask, i64 0, i64 %%33, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2938_count);
  llvm_cbe_tmp__372 = (signed int *)(&lmask[(((signed long long )llvm_cbe_tmp__371))
#ifdef AESL_BC_SIM
 % 32
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__371));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__371) < 32)) fprintf(stderr, "%s:%d: warning: Read access out of array 'lmask' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = load i32* %%34, align 4, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2939_count);
  llvm_cbe_tmp__373 = (unsigned int )*llvm_cbe_tmp__372;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__373);
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = and i32 %%35, %%32, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2940_count);
  llvm_cbe_tmp__374 = (unsigned int )llvm_cbe_tmp__373 & llvm_cbe_tmp__370;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__374);
  llvm_cbe_tmp__383__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__374;   /* for PHI node */
  goto llvm_cbe_tmp__389;

llvm_cbe_tmp__391:
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = sub nsw i32 0, %%storemerge, !dbg !29 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2942_count);
  llvm_cbe_tmp__375 = (unsigned int )-(llvm_cbe_storemerge);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__375&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = xor i32 %%storemerge, -1, !dbg !29 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2953_count);
  llvm_cbe_tmp__376 = (unsigned int )llvm_cbe_storemerge ^ 4294967295u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__376);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%39, i32* @aesl_internal_read_position, align 4, !dbg !29 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2954_count);
  *(&aesl_internal_read_position) = llvm_cbe_tmp__376;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__376);
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = load i32* @aesl_internal_current_read_byte, align 4, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2955_count);
  llvm_cbe_tmp__377 = (unsigned int )*(&aesl_internal_current_read_byte);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__377);
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = lshr i32 %%40, %%38, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2956_count);
  llvm_cbe_tmp__378 = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_tmp__377&4294967295ull)) >> ((unsigned int )(llvm_cbe_tmp__375&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__378&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = sext i32 %%1 to i64, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2957_count);
  llvm_cbe_tmp__379 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__348);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__379);
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = getelementptr inbounds [32 x i32]* @lmask, i64 0, i64 %%42, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2958_count);
  llvm_cbe_tmp__380 = (signed int *)(&lmask[(((signed long long )llvm_cbe_tmp__379))
#ifdef AESL_BC_SIM
 % 32
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__379));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__379) < 32)) fprintf(stderr, "%s:%d: warning: Read access out of array 'lmask' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = load i32* %%43, align 4, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2959_count);
  llvm_cbe_tmp__381 = (unsigned int )*llvm_cbe_tmp__380;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__381);
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = and i32 %%41, %%44, !dbg !28 for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2960_count);
  llvm_cbe_tmp__382 = (unsigned int )llvm_cbe_tmp__378 & llvm_cbe_tmp__381;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__382);
  llvm_cbe_tmp__383__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__382;   /* for PHI node */
  goto llvm_cbe_tmp__389;

llvm_cbe_tmp__389:
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = phi i32 [ %%45, %%37 ], [ %%36, %%31 ], [ %%20, %%9  for 0x%llxth hint within @buf_getv  --> \n", ++aesl_llvm_cbe_2962_count);
  llvm_cbe_tmp__383 = (unsigned int )llvm_cbe_tmp__383__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__383);
printf("\n = 0x%X",llvm_cbe_tmp__382);
printf("\n = 0x%X",llvm_cbe_tmp__374);
printf("\n = 0x%X",llvm_cbe_tmp__362);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @buf_getv}\n");
  return llvm_cbe_tmp__383;
}


signed int huff_make_dhuff_tb(signed int *llvm_cbe_p_xhtbl_bits, signed int *llvm_cbe_p_dhtbl_maxcode, signed int *llvm_cbe_p_dhtbl_mincode, signed int *llvm_cbe_p_dhtbl_valptr) {
  static  unsigned long long aesl_llvm_cbe_huffsize_count = 0;
  signed int llvm_cbe_huffsize[257];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_huffcode_count = 0;
  signed int llvm_cbe_huffcode[257];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_2964_count = 0;
  static  unsigned long long aesl_llvm_cbe_2965_count = 0;
  static  unsigned long long aesl_llvm_cbe_2966_count = 0;
  static  unsigned long long aesl_llvm_cbe_2967_count = 0;
  static  unsigned long long aesl_llvm_cbe_2968_count = 0;
  static  unsigned long long aesl_llvm_cbe_2969_count = 0;
  static  unsigned long long aesl_llvm_cbe_2970_count = 0;
  static  unsigned long long aesl_llvm_cbe_2971_count = 0;
  static  unsigned long long aesl_llvm_cbe_2972_count = 0;
  static  unsigned long long aesl_llvm_cbe_2973_count = 0;
  static  unsigned long long aesl_llvm_cbe_2974_count = 0;
  static  unsigned long long aesl_llvm_cbe_2975_count = 0;
  static  unsigned long long aesl_llvm_cbe_2976_count = 0;
  static  unsigned long long aesl_llvm_cbe_2977_count = 0;
  static  unsigned long long aesl_llvm_cbe_2978_count = 0;
  static  unsigned long long aesl_llvm_cbe_2979_count = 0;
  static  unsigned long long aesl_llvm_cbe_2980_count = 0;
  static  unsigned long long aesl_llvm_cbe_2981_count = 0;
  static  unsigned long long aesl_llvm_cbe_2982_count = 0;
  static  unsigned long long aesl_llvm_cbe_2983_count = 0;
  static  unsigned long long aesl_llvm_cbe_2984_count = 0;
  static  unsigned long long aesl_llvm_cbe_2985_count = 0;
  static  unsigned long long aesl_llvm_cbe_2986_count = 0;
  static  unsigned long long aesl_llvm_cbe_2987_count = 0;
  static  unsigned long long aesl_llvm_cbe_2988_count = 0;
  static  unsigned long long aesl_llvm_cbe_2989_count = 0;
  static  unsigned long long aesl_llvm_cbe_2990_count = 0;
  static  unsigned long long aesl_llvm_cbe_2991_count = 0;
  static  unsigned long long aesl_llvm_cbe_2992_count = 0;
  static  unsigned long long aesl_llvm_cbe_2993_count = 0;
  static  unsigned long long aesl_llvm_cbe_2994_count = 0;
  static  unsigned long long aesl_llvm_cbe_2995_count = 0;
  static  unsigned long long aesl_llvm_cbe_2996_count = 0;
  static  unsigned long long aesl_llvm_cbe_2997_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge19_count = 0;
  unsigned int llvm_cbe_storemerge19;
  unsigned int llvm_cbe_storemerge19__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2998_count = 0;
  unsigned int llvm_cbe_tmp__392;
  unsigned int llvm_cbe_tmp__392__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_2999_count = 0;
  static  unsigned long long aesl_llvm_cbe_3000_count = 0;
  static  unsigned long long aesl_llvm_cbe_3001_count = 0;
  unsigned long long llvm_cbe_tmp__393;
  static  unsigned long long aesl_llvm_cbe_3002_count = 0;
  signed int *llvm_cbe_tmp__394;
  static  unsigned long long aesl_llvm_cbe_3003_count = 0;
  unsigned int llvm_cbe_tmp__395;
  static  unsigned long long aesl_llvm_cbe_3004_count = 0;
  static  unsigned long long aesl_llvm_cbe_3005_count = 0;
  static  unsigned long long aesl_llvm_cbe_3006_count = 0;
  static  unsigned long long aesl_llvm_cbe_smax_count = 0;
  unsigned int llvm_cbe_smax;
  static  unsigned long long aesl_llvm_cbe_3007_count = 0;
  unsigned int llvm_cbe_tmp__396;
  static  unsigned long long aesl_llvm_cbe_3008_count = 0;
  static  unsigned long long aesl_llvm_cbe_3009_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge217_count = 0;
  unsigned int llvm_cbe_storemerge217;
  unsigned int llvm_cbe_storemerge217__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3010_count = 0;
  unsigned int llvm_cbe_tmp__397;
  unsigned int llvm_cbe_tmp__397__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3011_count = 0;
  unsigned int llvm_cbe_tmp__398;
  static  unsigned long long aesl_llvm_cbe_3012_count = 0;
  static  unsigned long long aesl_llvm_cbe_3013_count = 0;
  static  unsigned long long aesl_llvm_cbe_3014_count = 0;
  static  unsigned long long aesl_llvm_cbe_3015_count = 0;
  static  unsigned long long aesl_llvm_cbe_3016_count = 0;
  static  unsigned long long aesl_llvm_cbe_3017_count = 0;
  static  unsigned long long aesl_llvm_cbe_3018_count = 0;
  static  unsigned long long aesl_llvm_cbe_3019_count = 0;
  static  unsigned long long aesl_llvm_cbe_3020_count = 0;
  static  unsigned long long aesl_llvm_cbe_3021_count = 0;
  static  unsigned long long aesl_llvm_cbe_3022_count = 0;
  static  unsigned long long aesl_llvm_cbe_3023_count = 0;
  static  unsigned long long aesl_llvm_cbe_3024_count = 0;
  static  unsigned long long aesl_llvm_cbe_3025_count = 0;
  static  unsigned long long aesl_llvm_cbe_3026_count = 0;
  unsigned long long llvm_cbe_tmp__399;
  static  unsigned long long aesl_llvm_cbe_3027_count = 0;
  signed int *llvm_cbe_tmp__400;
  static  unsigned long long aesl_llvm_cbe_3028_count = 0;
  static  unsigned long long aesl_llvm_cbe_3029_count = 0;
  unsigned int llvm_cbe_tmp__401;
  static  unsigned long long aesl_llvm_cbe_3030_count = 0;
  static  unsigned long long aesl_llvm_cbe_3031_count = 0;
  static  unsigned long long aesl_llvm_cbe_3032_count = 0;
  static  unsigned long long aesl_llvm_cbe_3033_count = 0;
  static  unsigned long long aesl_llvm_cbe_3034_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_lcssa16_count = 0;
  unsigned int llvm_cbe__2e_lcssa16;
  unsigned int llvm_cbe__2e_lcssa16__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3035_count = 0;
  unsigned int llvm_cbe_tmp__402;
  static  unsigned long long aesl_llvm_cbe_3036_count = 0;
  static  unsigned long long aesl_llvm_cbe_3037_count = 0;
  static  unsigned long long aesl_llvm_cbe_3038_count = 0;
  static  unsigned long long aesl_llvm_cbe_3039_count = 0;
  static  unsigned long long aesl_llvm_cbe_3040_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond32_count = 0;
  static  unsigned long long aesl_llvm_cbe_3041_count = 0;
  static  unsigned long long aesl_llvm_cbe_3042_count = 0;
  unsigned long long llvm_cbe_tmp__403;
  static  unsigned long long aesl_llvm_cbe_3043_count = 0;
  signed int *llvm_cbe_tmp__404;
  static  unsigned long long aesl_llvm_cbe_3044_count = 0;
  static  unsigned long long aesl_llvm_cbe_3045_count = 0;
  static  unsigned long long aesl_llvm_cbe_3046_count = 0;
  static  unsigned long long aesl_llvm_cbe_3047_count = 0;
  static  unsigned long long aesl_llvm_cbe_3048_count = 0;
  static  unsigned long long aesl_llvm_cbe_3049_count = 0;
  static  unsigned long long aesl_llvm_cbe_3050_count = 0;
  static  unsigned long long aesl_llvm_cbe_3051_count = 0;
  static  unsigned long long aesl_llvm_cbe_3052_count = 0;
  static  unsigned long long aesl_llvm_cbe_3053_count = 0;
  static  unsigned long long aesl_llvm_cbe_3054_count = 0;
  static  unsigned long long aesl_llvm_cbe_3055_count = 0;
  static  unsigned long long aesl_llvm_cbe_3056_count = 0;
  static  unsigned long long aesl_llvm_cbe_3057_count = 0;
  static  unsigned long long aesl_llvm_cbe_3058_count = 0;
  static  unsigned long long aesl_llvm_cbe_3059_count = 0;
  static  unsigned long long aesl_llvm_cbe_3060_count = 0;
  static  unsigned long long aesl_llvm_cbe_3061_count = 0;
  static  unsigned long long aesl_llvm_cbe_3062_count = 0;
  signed int *llvm_cbe_tmp__405;
  static  unsigned long long aesl_llvm_cbe_3063_count = 0;
  unsigned int llvm_cbe_tmp__406;
  static  unsigned long long aesl_llvm_cbe_3064_count = 0;
  static  unsigned long long aesl_llvm_cbe_3065_count = 0;
  static  unsigned long long aesl_llvm_cbe_3066_count = 0;
  static  unsigned long long aesl_llvm_cbe_3067_count = 0;
  static  unsigned long long aesl_llvm_cbe_3068_count = 0;
  static  unsigned long long aesl_llvm_cbe_3069_count = 0;
  unsigned int llvm_cbe_tmp__407;
  unsigned int llvm_cbe_tmp__407__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3070_count = 0;
  unsigned int llvm_cbe_tmp__408;
  unsigned int llvm_cbe_tmp__408__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3071_count = 0;
  unsigned int llvm_cbe_tmp__409;
  unsigned int llvm_cbe_tmp__409__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3072_count = 0;
  static  unsigned long long aesl_llvm_cbe_3073_count = 0;
  unsigned int llvm_cbe_tmp__410;
  unsigned int llvm_cbe_tmp__410__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3074_count = 0;
  unsigned int llvm_cbe_tmp__411;
  unsigned int llvm_cbe_tmp__411__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3075_count = 0;
  unsigned int llvm_cbe_tmp__412;
  static  unsigned long long aesl_llvm_cbe_3076_count = 0;
  static  unsigned long long aesl_llvm_cbe_3077_count = 0;
  static  unsigned long long aesl_llvm_cbe_3078_count = 0;
  static  unsigned long long aesl_llvm_cbe_3079_count = 0;
  unsigned int llvm_cbe_tmp__413;
  static  unsigned long long aesl_llvm_cbe_3080_count = 0;
  static  unsigned long long aesl_llvm_cbe_3081_count = 0;
  static  unsigned long long aesl_llvm_cbe_3082_count = 0;
  static  unsigned long long aesl_llvm_cbe_3083_count = 0;
  static  unsigned long long aesl_llvm_cbe_3084_count = 0;
  static  unsigned long long aesl_llvm_cbe_3085_count = 0;
  static  unsigned long long aesl_llvm_cbe_3086_count = 0;
  static  unsigned long long aesl_llvm_cbe_3087_count = 0;
  static  unsigned long long aesl_llvm_cbe_3088_count = 0;
  static  unsigned long long aesl_llvm_cbe_3089_count = 0;
  static  unsigned long long aesl_llvm_cbe_3090_count = 0;
  static  unsigned long long aesl_llvm_cbe_3091_count = 0;
  static  unsigned long long aesl_llvm_cbe_3092_count = 0;
  static  unsigned long long aesl_llvm_cbe_3093_count = 0;
  static  unsigned long long aesl_llvm_cbe_3094_count = 0;
  unsigned long long llvm_cbe_tmp__414;
  static  unsigned long long aesl_llvm_cbe_3095_count = 0;
  signed int *llvm_cbe_tmp__415;
  static  unsigned long long aesl_llvm_cbe_3096_count = 0;
  static  unsigned long long aesl_llvm_cbe_3097_count = 0;
  unsigned long long llvm_cbe_tmp__416;
  static  unsigned long long aesl_llvm_cbe_3098_count = 0;
  signed int *llvm_cbe_tmp__417;
  static  unsigned long long aesl_llvm_cbe_3099_count = 0;
  unsigned int llvm_cbe_tmp__418;
  static  unsigned long long aesl_llvm_cbe_3100_count = 0;
  static  unsigned long long aesl_llvm_cbe_3101_count = 0;
  static  unsigned long long aesl_llvm_cbe_3102_count = 0;
  static  unsigned long long aesl_llvm_cbe_3103_count = 0;
  static  unsigned long long aesl_llvm_cbe_3104_count = 0;
  static  unsigned long long aesl_llvm_cbe_3105_count = 0;
  unsigned int llvm_cbe_tmp__419;
  unsigned int llvm_cbe_tmp__419__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3106_count = 0;
  static  unsigned long long aesl_llvm_cbe_3107_count = 0;
  static  unsigned long long aesl_llvm_cbe_3108_count = 0;
  unsigned int llvm_cbe_tmp__420;
  unsigned int llvm_cbe_tmp__420__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3109_count = 0;
  unsigned int llvm_cbe_tmp__421;
  unsigned int llvm_cbe_tmp__421__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3110_count = 0;
  unsigned int llvm_cbe_tmp__422;
  static  unsigned long long aesl_llvm_cbe_3111_count = 0;
  static  unsigned long long aesl_llvm_cbe_3112_count = 0;
  static  unsigned long long aesl_llvm_cbe_3113_count = 0;
  static  unsigned long long aesl_llvm_cbe_3114_count = 0;
  unsigned int llvm_cbe_tmp__423;
  static  unsigned long long aesl_llvm_cbe_3115_count = 0;
  static  unsigned long long aesl_llvm_cbe_3116_count = 0;
  static  unsigned long long aesl_llvm_cbe_3117_count = 0;
  static  unsigned long long aesl_llvm_cbe_3118_count = 0;
  static  unsigned long long aesl_llvm_cbe_3119_count = 0;
  static  unsigned long long aesl_llvm_cbe_3120_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge13_count = 0;
  unsigned int llvm_cbe_storemerge13;
  unsigned int llvm_cbe_storemerge13__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3121_count = 0;
  unsigned int llvm_cbe_tmp__424;
  unsigned int llvm_cbe_tmp__424__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3122_count = 0;
  unsigned int llvm_cbe_tmp__425;
  unsigned int llvm_cbe_tmp__425__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3123_count = 0;
  unsigned long long llvm_cbe_tmp__426;
  static  unsigned long long aesl_llvm_cbe_3124_count = 0;
  signed int *llvm_cbe_tmp__427;
  static  unsigned long long aesl_llvm_cbe_3125_count = 0;
  unsigned int llvm_cbe_tmp__428;
  static  unsigned long long aesl_llvm_cbe_3126_count = 0;
  static  unsigned long long aesl_llvm_cbe_3127_count = 0;
  static  unsigned long long aesl_llvm_cbe_3128_count = 0;
  signed int *llvm_cbe_tmp__429;
  static  unsigned long long aesl_llvm_cbe_3129_count = 0;
  static  unsigned long long aesl_llvm_cbe_3130_count = 0;
  static  unsigned long long aesl_llvm_cbe_3131_count = 0;
  signed int *llvm_cbe_tmp__430;
  static  unsigned long long aesl_llvm_cbe_3132_count = 0;
  static  unsigned long long aesl_llvm_cbe_3133_count = 0;
  unsigned long long llvm_cbe_tmp__431;
  static  unsigned long long aesl_llvm_cbe_3134_count = 0;
  signed int *llvm_cbe_tmp__432;
  static  unsigned long long aesl_llvm_cbe_3135_count = 0;
  unsigned int llvm_cbe_tmp__433;
  static  unsigned long long aesl_llvm_cbe_3136_count = 0;
  signed int *llvm_cbe_tmp__434;
  static  unsigned long long aesl_llvm_cbe_3137_count = 0;
  static  unsigned long long aesl_llvm_cbe_3138_count = 0;
  unsigned int llvm_cbe_tmp__435;
  static  unsigned long long aesl_llvm_cbe_3139_count = 0;
  unsigned int llvm_cbe_tmp__436;
  static  unsigned long long aesl_llvm_cbe_3140_count = 0;
  unsigned int llvm_cbe_tmp__437;
  static  unsigned long long aesl_llvm_cbe_3141_count = 0;
  static  unsigned long long aesl_llvm_cbe_3142_count = 0;
  static  unsigned long long aesl_llvm_cbe_3143_count = 0;
  static  unsigned long long aesl_llvm_cbe_3144_count = 0;
  static  unsigned long long aesl_llvm_cbe_3145_count = 0;
  static  unsigned long long aesl_llvm_cbe_3146_count = 0;
  static  unsigned long long aesl_llvm_cbe_3147_count = 0;
  static  unsigned long long aesl_llvm_cbe_3148_count = 0;
  static  unsigned long long aesl_llvm_cbe_3149_count = 0;
  static  unsigned long long aesl_llvm_cbe_3150_count = 0;
  static  unsigned long long aesl_llvm_cbe_3151_count = 0;
  static  unsigned long long aesl_llvm_cbe_3152_count = 0;
  static  unsigned long long aesl_llvm_cbe_3153_count = 0;
  static  unsigned long long aesl_llvm_cbe_3154_count = 0;
  static  unsigned long long aesl_llvm_cbe_3155_count = 0;
  unsigned long long llvm_cbe_tmp__438;
  static  unsigned long long aesl_llvm_cbe_3156_count = 0;
  signed int *llvm_cbe_tmp__439;
  static  unsigned long long aesl_llvm_cbe_3157_count = 0;
  unsigned int llvm_cbe_tmp__440;
  static  unsigned long long aesl_llvm_cbe_3158_count = 0;
  signed int *llvm_cbe_tmp__441;
  static  unsigned long long aesl_llvm_cbe_3159_count = 0;
  static  unsigned long long aesl_llvm_cbe_3160_count = 0;
  unsigned int llvm_cbe_tmp__442;
  static  unsigned long long aesl_llvm_cbe_3161_count = 0;
  static  unsigned long long aesl_llvm_cbe_3162_count = 0;
  static  unsigned long long aesl_llvm_cbe_3163_count = 0;
  static  unsigned long long aesl_llvm_cbe_3164_count = 0;
  static  unsigned long long aesl_llvm_cbe_3165_count = 0;
  static  unsigned long long aesl_llvm_cbe_3166_count = 0;
  static  unsigned long long aesl_llvm_cbe_3167_count = 0;
  static  unsigned long long aesl_llvm_cbe_3168_count = 0;
  static  unsigned long long aesl_llvm_cbe_3169_count = 0;
  static  unsigned long long aesl_llvm_cbe_3170_count = 0;
  static  unsigned long long aesl_llvm_cbe_3171_count = 0;
  static  unsigned long long aesl_llvm_cbe_3172_count = 0;
  static  unsigned long long aesl_llvm_cbe_3173_count = 0;
  static  unsigned long long aesl_llvm_cbe_3174_count = 0;
  static  unsigned long long aesl_llvm_cbe_3175_count = 0;
  static  unsigned long long aesl_llvm_cbe_3176_count = 0;
  unsigned int llvm_cbe_tmp__443;
  unsigned int llvm_cbe_tmp__443__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3177_count = 0;
  unsigned int llvm_cbe_tmp__444;
  unsigned int llvm_cbe_tmp__444__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3178_count = 0;
  unsigned int llvm_cbe_tmp__445;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_3179_count = 0;
  static  unsigned long long aesl_llvm_cbe_3180_count = 0;
  unsigned long long llvm_cbe_tmp__446;
  static  unsigned long long aesl_llvm_cbe_3181_count = 0;
  signed int *llvm_cbe_tmp__447;
  static  unsigned long long aesl_llvm_cbe_3182_count = 0;
  unsigned int llvm_cbe_tmp__448;
  static  unsigned long long aesl_llvm_cbe_3183_count = 0;
  unsigned int llvm_cbe_tmp__449;
  static  unsigned long long aesl_llvm_cbe_3184_count = 0;
  static  unsigned long long aesl_llvm_cbe_3185_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @huff_make_dhuff_tb\n");
  llvm_cbe_storemerge19__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
  llvm_cbe_tmp__392__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe__2e_preheader15;

  do {     /* Syntactic loop '.preheader15' to make GCC happy */
llvm_cbe__2e_preheader15:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge19 = phi i32 [ 1, %%0 ], [ %%15, %%._crit_edge  for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_storemerge19_count);
  llvm_cbe_storemerge19 = (unsigned int )llvm_cbe_storemerge19__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge19 = 0x%X",llvm_cbe_storemerge19);
printf("\n = 0x%X",1u);
printf("\n = 0x%X",llvm_cbe_tmp__402);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = phi i32 [ 0, %%0 ], [ %%.lcssa16, %%._crit_edge  for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_2998_count);
  llvm_cbe_tmp__392 = (unsigned int )llvm_cbe_tmp__392__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__392);
printf("\n = 0x%X",0u);
printf("\n.lcssa16 = 0x%X",llvm_cbe__2e_lcssa16);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i32 %%storemerge19 to i64, !dbg !27 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3001_count);
  llvm_cbe_tmp__393 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge19);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__393);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds i32* %%p_xhtbl_bits, i64 %%2, !dbg !27 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3002_count);
  llvm_cbe_tmp__394 = (signed int *)(&llvm_cbe_p_xhtbl_bits[(((signed long long )llvm_cbe_tmp__393))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__393));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load i32* %%3, align 4, !dbg !27 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3003_count);
  llvm_cbe_tmp__395 = (unsigned int )*llvm_cbe_tmp__394;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__395);
  if ((((signed int )llvm_cbe_tmp__395) < ((signed int )1u))) {
    llvm_cbe__2e_lcssa16__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__392;   /* for PHI node */
    goto llvm_cbe__2e__crit_edge;
  } else {
    goto llvm_cbe__2e_lr_2e_ph;
  }

llvm_cbe__2e__crit_edge:
if (AESL_DEBUG_TRACE)
printf("\n  %%.lcssa16 = phi i32 [ %%1, %%.preheader15 ], [ %%7, %%8  for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe__2e_lcssa16_count);
  llvm_cbe__2e_lcssa16 = (unsigned int )llvm_cbe__2e_lcssa16__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.lcssa16 = 0x%X",llvm_cbe__2e_lcssa16);
printf("\n = 0x%X",llvm_cbe_tmp__392);
printf("\n = 0x%X",llvm_cbe_tmp__396);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = add nsw i32 %%storemerge19, 1, !dbg !31 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3035_count);
  llvm_cbe_tmp__402 = (unsigned int )((unsigned int )(llvm_cbe_storemerge19&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__402&4294967295ull)));
  if (((llvm_cbe_tmp__402&4294967295U) == (17u&4294967295U))) {
    goto llvm_cbe_tmp__450;
  } else {
    llvm_cbe_storemerge19__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__402;   /* for PHI node */
    llvm_cbe_tmp__392__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_lcssa16;   /* for PHI node */
    goto llvm_cbe__2e_preheader15;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__451:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge217 = phi i32 [ 1, %%.lr.ph ], [ %%13, %%8  for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_storemerge217_count);
  llvm_cbe_storemerge217 = (unsigned int )llvm_cbe_storemerge217__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge217 = 0x%X",llvm_cbe_storemerge217);
printf("\n = 0x%X",1u);
printf("\n = 0x%X",llvm_cbe_tmp__401);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = phi i32 [ %%1, %%.lr.ph ], [ %%10, %%8  for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3010_count);
  llvm_cbe_tmp__397 = (unsigned int )llvm_cbe_tmp__397__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__397);
printf("\n = 0x%X",llvm_cbe_tmp__392);
printf("\n = 0x%X",llvm_cbe_tmp__398);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = add nsw i32 %%9, 1, !dbg !30 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3011_count);
  llvm_cbe_tmp__398 = (unsigned int )((unsigned int )(llvm_cbe_tmp__397&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__398&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = sext i32 %%9 to i64, !dbg !30 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3026_count);
  llvm_cbe_tmp__399 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__397);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__399);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = getelementptr inbounds [257 x i32]* %%huffsize, i64 0, i64 %%11, !dbg !30 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3027_count);
  llvm_cbe_tmp__400 = (signed int *)(&llvm_cbe_huffsize[(((signed long long )llvm_cbe_tmp__399))
#ifdef AESL_BC_SIM
 % 257
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__399));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__399) < 257 && "Write access out of array 'huffsize' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%storemerge19, i32* %%12, align 4, !dbg !30 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3028_count);
  *llvm_cbe_tmp__400 = llvm_cbe_storemerge19;
if (AESL_DEBUG_TRACE)
printf("\nstoremerge19 = 0x%X\n", llvm_cbe_storemerge19);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = add nsw i32 %%storemerge217, 1, !dbg !32 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3029_count);
  llvm_cbe_tmp__401 = (unsigned int )((unsigned int )(llvm_cbe_storemerge217&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__401&4294967295ull)));
  if ((((signed int )llvm_cbe_tmp__401) > ((signed int )llvm_cbe_tmp__395))) {
    llvm_cbe__2e_lcssa16__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__396;   /* for PHI node */
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge217__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__401;   /* for PHI node */
    llvm_cbe_tmp__397__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__398;   /* for PHI node */
    goto llvm_cbe_tmp__451;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%smax = select i1 %%6, i32 %%4, i32  for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_smax_count);
  llvm_cbe_smax = (unsigned int )(((((signed int )llvm_cbe_tmp__395) > ((signed int )1u))) ? ((unsigned int )llvm_cbe_tmp__395) : ((unsigned int )1u));
if (AESL_DEBUG_TRACE)
printf("\nsmax = 0x%X\n", llvm_cbe_smax);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = add i32 %%1, %%smax, !dbg !31 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3007_count);
  llvm_cbe_tmp__396 = (unsigned int )((unsigned int )(llvm_cbe_tmp__392&4294967295ull)) + ((unsigned int )(llvm_cbe_smax&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__396&4294967295ull)));
  llvm_cbe_storemerge217__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
  llvm_cbe_tmp__397__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__392;   /* for PHI node */
  goto llvm_cbe_tmp__451;

  } while (1); /* end of syntactic loop '.preheader15' */
llvm_cbe_tmp__450:
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = sext i32 %%.lcssa16 to i64, !dbg !30 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3042_count);
  llvm_cbe_tmp__403 = (unsigned long long )((signed long long )(signed int )llvm_cbe__2e_lcssa16);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__403);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds [257 x i32]* %%huffsize, i64 0, i64 %%17, !dbg !30 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3043_count);
  llvm_cbe_tmp__404 = (signed int *)(&llvm_cbe_huffsize[(((signed long long )llvm_cbe_tmp__403))
#ifdef AESL_BC_SIM
 % 257
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__403));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__403) < 257 && "Write access out of array 'huffsize' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%18, align 4, !dbg !30 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3044_count);
  *llvm_cbe_tmp__404 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = getelementptr inbounds [257 x i32]* %%huffsize, i64 0, i64 0, !dbg !32 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3062_count);
  llvm_cbe_tmp__405 = (signed int *)(&llvm_cbe_huffsize[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 257
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )0ull) < 257)) fprintf(stderr, "%s:%d: warning: Read access out of array 'huffsize' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = load i32* %%19, align 16, !dbg !32 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3063_count);
  llvm_cbe_tmp__406 = (unsigned int )*llvm_cbe_tmp__405;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__406);
  llvm_cbe_tmp__407__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__406;   /* for PHI node */
  llvm_cbe_tmp__408__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  llvm_cbe_tmp__409__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe__2e_loopexit;

  do {     /* Syntactic loop '.loopexit' to make GCC happy */
llvm_cbe__2e_loopexit:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = phi i32 [ %%20, %%16 ], [ %%33, %%.preheader4  for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3069_count);
  llvm_cbe_tmp__407 = (unsigned int )llvm_cbe_tmp__407__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__407);
printf("\n = 0x%X",llvm_cbe_tmp__406);
printf("\n = 0x%X",llvm_cbe_tmp__418);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = phi i32 [ 0, %%16 ], [ %%41, %%.preheader4  for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3070_count);
  llvm_cbe_tmp__408 = (unsigned int )llvm_cbe_tmp__408__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__408);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__422);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = phi i32 [ 0, %%16 ], [ %%28, %%.preheader4  for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3071_count);
  llvm_cbe_tmp__409 = (unsigned int )llvm_cbe_tmp__409__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__409);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__413);
}
  llvm_cbe_tmp__410__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__408;   /* for PHI node */
  llvm_cbe_tmp__411__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__409;   /* for PHI node */
  goto llvm_cbe_tmp__452;

  do {     /* Syntactic loop '.preheader4' to make GCC happy */
llvm_cbe__2e_preheader4:
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = phi i32 [ %%42, %%.preheader4 ], [ %%21, %%.critedge ], !dbg !32 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3108_count);
  llvm_cbe_tmp__420 = (unsigned int )llvm_cbe_tmp__420__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__420);
printf("\n = 0x%X",llvm_cbe_tmp__423);
printf("\n = 0x%X",llvm_cbe_tmp__407);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = phi i32 [ %%41, %%.preheader4 ], [ %%27, %%.critedge ], !dbg !32 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3109_count);
  llvm_cbe_tmp__421 = (unsigned int )llvm_cbe_tmp__421__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__421);
printf("\n = 0x%X",llvm_cbe_tmp__422);
printf("\n = 0x%X",llvm_cbe_tmp__412);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = shl i32 %%40, 1, !dbg !32 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3110_count);
  llvm_cbe_tmp__422 = (unsigned int )llvm_cbe_tmp__421 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__422);
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = add nsw i32 %%39, 1, !dbg !32 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3114_count);
  llvm_cbe_tmp__423 = (unsigned int )((unsigned int )(llvm_cbe_tmp__420&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__423&4294967295ull)));
  if (((llvm_cbe_tmp__418&4294967295U) == (llvm_cbe_tmp__423&4294967295U))) {
    llvm_cbe_tmp__407__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__418;   /* for PHI node */
    llvm_cbe_tmp__408__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__422;   /* for PHI node */
    llvm_cbe_tmp__409__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__413;   /* for PHI node */
    goto llvm_cbe__2e_loopexit;
  } else {
    llvm_cbe_tmp__420__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__423;   /* for PHI node */
    llvm_cbe_tmp__421__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__422;   /* for PHI node */
    goto llvm_cbe__2e_preheader4;
  }

  } while (1); /* end of syntactic loop '.preheader4' */
llvm_cbe__2e_critedge:
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = phi i32 [ %%21, %%35 ], [ %%33, %%24 ], !dbg !31 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3105_count);
  llvm_cbe_tmp__419 = (unsigned int )llvm_cbe_tmp__419__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__419);
printf("\n = 0x%X",llvm_cbe_tmp__407);
printf("\n = 0x%X",llvm_cbe_tmp__418);
}
  if (((llvm_cbe_tmp__419&4294967295U) == (0u&4294967295U))) {
    llvm_cbe_storemerge13__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
    llvm_cbe_tmp__424__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    llvm_cbe_tmp__425__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  } else {
    llvm_cbe_tmp__420__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__407;   /* for PHI node */
    llvm_cbe_tmp__421__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__412;   /* for PHI node */
    goto llvm_cbe__2e_preheader4;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__452:
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = phi i32 [ %%27, %%35 ], [ %%22, %%.loopexit ], !dbg !30 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3073_count);
  llvm_cbe_tmp__410 = (unsigned int )llvm_cbe_tmp__410__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__410);
printf("\n = 0x%X",llvm_cbe_tmp__412);
printf("\n = 0x%X",llvm_cbe_tmp__408);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = phi i32 [ %%28, %%35 ], [ %%23, %%.loopexit ], !dbg !30 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3074_count);
  llvm_cbe_tmp__411 = (unsigned int )llvm_cbe_tmp__411__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__411);
printf("\n = 0x%X",llvm_cbe_tmp__413);
printf("\n = 0x%X",llvm_cbe_tmp__409);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = add nsw i32 %%25, 1, !dbg !30 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3075_count);
  llvm_cbe_tmp__412 = (unsigned int )((unsigned int )(llvm_cbe_tmp__410&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__412&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = add nsw i32 %%26, 1, !dbg !30 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3079_count);
  llvm_cbe_tmp__413 = (unsigned int )((unsigned int )(llvm_cbe_tmp__411&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__413&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = sext i32 %%26 to i64, !dbg !30 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3094_count);
  llvm_cbe_tmp__414 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__411);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__414);
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = getelementptr inbounds [257 x i32]* %%huffcode, i64 0, i64 %%29, !dbg !30 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3095_count);
  llvm_cbe_tmp__415 = (signed int *)(&llvm_cbe_huffcode[(((signed long long )llvm_cbe_tmp__414))
#ifdef AESL_BC_SIM
 % 257
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__414));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__414) < 257 && "Write access out of array 'huffcode' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%25, i32* %%30, align 4, !dbg !30 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3096_count);
  *llvm_cbe_tmp__415 = llvm_cbe_tmp__410;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__410);
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = sext i32 %%28 to i64, !dbg !31 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3097_count);
  llvm_cbe_tmp__416 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__413);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__416);
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = getelementptr inbounds [257 x i32]* %%huffsize, i64 0, i64 %%31, !dbg !31 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3098_count);
  llvm_cbe_tmp__417 = (signed int *)(&llvm_cbe_huffsize[(((signed long long )llvm_cbe_tmp__416))
#ifdef AESL_BC_SIM
 % 257
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__416));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__416) < 257)) fprintf(stderr, "%s:%d: warning: Read access out of array 'huffsize' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = load i32* %%32, align 4, !dbg !31 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3099_count);
  llvm_cbe_tmp__418 = (unsigned int )*llvm_cbe_tmp__417;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__418);
  if (((llvm_cbe_tmp__418&4294967295U) == (llvm_cbe_tmp__407&4294967295U))) {
    goto llvm_cbe_tmp__453;
  } else {
    llvm_cbe_tmp__419__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__418;   /* for PHI node */
    goto llvm_cbe__2e_critedge;
  }

llvm_cbe_tmp__453:
  if ((((signed int )llvm_cbe_tmp__413) < ((signed int )257u))) {
    llvm_cbe_tmp__410__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__412;   /* for PHI node */
    llvm_cbe_tmp__411__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__413;   /* for PHI node */
    goto llvm_cbe_tmp__452;
  } else {
    llvm_cbe_tmp__419__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__407;   /* for PHI node */
    goto llvm_cbe__2e_critedge;
  }

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.loopexit' */
  do {     /* Syntactic loop '.preheader' to make GCC happy */
llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge13 = phi i32 [ %%69, %%66 ], [ 1, %%.critedge  for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_storemerge13_count);
  llvm_cbe_storemerge13 = (unsigned int )llvm_cbe_storemerge13__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge13 = 0x%X",llvm_cbe_storemerge13);
printf("\n = 0x%X",llvm_cbe_tmp__445);
printf("\n = 0x%X",1u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = phi i32 [ %%68, %%66 ], [ 0, %%.critedge  for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3121_count);
  llvm_cbe_tmp__424 = (unsigned int )llvm_cbe_tmp__424__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__424);
printf("\n = 0x%X",llvm_cbe_tmp__444);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = phi i32 [ %%67, %%66 ], [ 1, %%.critedge  for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3122_count);
  llvm_cbe_tmp__425 = (unsigned int )llvm_cbe_tmp__425__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__425);
printf("\n = 0x%X",llvm_cbe_tmp__443);
printf("\n = 0x%X",1u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = sext i32 %%storemerge13 to i64, !dbg !27 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3123_count);
  llvm_cbe_tmp__426 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge13);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__426);
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = getelementptr inbounds i32* %%p_xhtbl_bits, i64 %%46, !dbg !27 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3124_count);
  llvm_cbe_tmp__427 = (signed int *)(&llvm_cbe_p_xhtbl_bits[(((signed long long )llvm_cbe_tmp__426))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__426));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = load i32* %%47, align 4, !dbg !27 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3125_count);
  llvm_cbe_tmp__428 = (unsigned int )*llvm_cbe_tmp__427;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__428);
  if (((llvm_cbe_tmp__428&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__454;
  } else {
    goto llvm_cbe_tmp__455;
  }

llvm_cbe_tmp__456:
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = phi i32 [ %%45, %%50 ], [ %%storemerge13, %%52  for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3176_count);
  llvm_cbe_tmp__443 = (unsigned int )llvm_cbe_tmp__443__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__443);
printf("\n = 0x%X",llvm_cbe_tmp__425);
printf("\nstoremerge13 = 0x%X",llvm_cbe_storemerge13);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%68 = phi i32 [ %%44, %%50 ], [ %%65, %%52  for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3177_count);
  llvm_cbe_tmp__444 = (unsigned int )llvm_cbe_tmp__444__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__444);
printf("\n = 0x%X",llvm_cbe_tmp__424);
printf("\n = 0x%X",llvm_cbe_tmp__442);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = add nsw i32 %%storemerge13, 1, !dbg !33 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3178_count);
  llvm_cbe_tmp__445 = (unsigned int )((unsigned int )(llvm_cbe_storemerge13&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__445&4294967295ull)));
  if (((llvm_cbe_tmp__445&4294967295U) == (17u&4294967295U))) {
    goto llvm_cbe_tmp__457;
  } else {
    llvm_cbe_storemerge13__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__445;   /* for PHI node */
    llvm_cbe_tmp__424__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__444;   /* for PHI node */
    llvm_cbe_tmp__425__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__443;   /* for PHI node */
    goto llvm_cbe__2e_preheader;
  }

llvm_cbe_tmp__454:
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = getelementptr inbounds i32* %%p_dhtbl_maxcode, i64 %%46, !dbg !28 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3128_count);
  llvm_cbe_tmp__429 = (signed int *)(&llvm_cbe_p_dhtbl_maxcode[(((signed long long )llvm_cbe_tmp__426))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__426));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 -1, i32* %%51, align 4, !dbg !28 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3129_count);
  *llvm_cbe_tmp__429 = 4294967295u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 4294967295u);
  llvm_cbe_tmp__443__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__425;   /* for PHI node */
  llvm_cbe_tmp__444__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__424;   /* for PHI node */
  goto llvm_cbe_tmp__456;

llvm_cbe_tmp__455:
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = getelementptr inbounds i32* %%p_dhtbl_valptr, i64 %%46, !dbg !29 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3131_count);
  llvm_cbe_tmp__430 = (signed int *)(&llvm_cbe_p_dhtbl_valptr[(((signed long long )llvm_cbe_tmp__426))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__426));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%44, i32* %%53, align 4, !dbg !29 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3132_count);
  *llvm_cbe_tmp__430 = llvm_cbe_tmp__424;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__424);
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = sext i32 %%44 to i64, !dbg !29 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3133_count);
  llvm_cbe_tmp__431 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__424);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__431);
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = getelementptr inbounds [257 x i32]* %%huffcode, i64 0, i64 %%54, !dbg !29 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3134_count);
  llvm_cbe_tmp__432 = (signed int *)(&llvm_cbe_huffcode[(((signed long long )llvm_cbe_tmp__431))
#ifdef AESL_BC_SIM
 % 257
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__431));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__431) < 257)) fprintf(stderr, "%s:%d: warning: Read access out of array 'huffcode' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = load i32* %%55, align 4, !dbg !29 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3135_count);
  llvm_cbe_tmp__433 = (unsigned int )*llvm_cbe_tmp__432;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__433);
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = getelementptr inbounds i32* %%p_dhtbl_mincode, i64 %%46, !dbg !29 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3136_count);
  llvm_cbe_tmp__434 = (signed int *)(&llvm_cbe_p_dhtbl_mincode[(((signed long long )llvm_cbe_tmp__426))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__426));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%56, i32* %%57, align 4, !dbg !29 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3137_count);
  *llvm_cbe_tmp__434 = llvm_cbe_tmp__433;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__433);
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = load i32* %%47, align 4, !dbg !28 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3138_count);
  llvm_cbe_tmp__435 = (unsigned int )*llvm_cbe_tmp__427;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__435);
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = add i32 %%44, -1, !dbg !28 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3139_count);
  llvm_cbe_tmp__436 = (unsigned int )((unsigned int )(llvm_cbe_tmp__424&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__436&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = add i32 %%59, %%58, !dbg !28 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3140_count);
  llvm_cbe_tmp__437 = (unsigned int )((unsigned int )(llvm_cbe_tmp__436&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__435&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__437&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = sext i32 %%60 to i64, !dbg !28 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3155_count);
  llvm_cbe_tmp__438 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__437);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__438);
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = getelementptr inbounds [257 x i32]* %%huffcode, i64 0, i64 %%61, !dbg !28 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3156_count);
  llvm_cbe_tmp__439 = (signed int *)(&llvm_cbe_huffcode[(((signed long long )llvm_cbe_tmp__438))
#ifdef AESL_BC_SIM
 % 257
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__438));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__438) < 257)) fprintf(stderr, "%s:%d: warning: Read access out of array 'huffcode' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = load i32* %%62, align 4, !dbg !28 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3157_count);
  llvm_cbe_tmp__440 = (unsigned int )*llvm_cbe_tmp__439;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__440);
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = getelementptr inbounds i32* %%p_dhtbl_maxcode, i64 %%46, !dbg !28 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3158_count);
  llvm_cbe_tmp__441 = (signed int *)(&llvm_cbe_p_dhtbl_maxcode[(((signed long long )llvm_cbe_tmp__426))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__426));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%63, i32* %%64, align 4, !dbg !28 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3159_count);
  *llvm_cbe_tmp__441 = llvm_cbe_tmp__440;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__440);
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = add i32 %%58, %%44, !dbg !31 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3160_count);
  llvm_cbe_tmp__442 = (unsigned int )((unsigned int )(llvm_cbe_tmp__435&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__424&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__442&4294967295ull)));
  llvm_cbe_tmp__443__PHI_TEMPORARY = (unsigned int )llvm_cbe_storemerge13;   /* for PHI node */
  llvm_cbe_tmp__444__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__442;   /* for PHI node */
  goto llvm_cbe_tmp__456;

  } while (1); /* end of syntactic loop '.preheader' */
llvm_cbe_tmp__457:
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = sext i32 %%67 to i64, !dbg !28 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3180_count);
  llvm_cbe_tmp__446 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__443);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__446);
if (AESL_DEBUG_TRACE)
printf("\n  %%72 = getelementptr inbounds i32* %%p_dhtbl_maxcode, i64 %%71, !dbg !28 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3181_count);
  llvm_cbe_tmp__447 = (signed int *)(&llvm_cbe_p_dhtbl_maxcode[(((signed long long )llvm_cbe_tmp__446))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__446));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%73 = load i32* %%72, align 4, !dbg !28 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3182_count);
  llvm_cbe_tmp__448 = (unsigned int )*llvm_cbe_tmp__447;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__448);
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = add nsw i32 %%73, 1, !dbg !28 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3183_count);
  llvm_cbe_tmp__449 = (unsigned int )((unsigned int )(llvm_cbe_tmp__448&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__449&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%74, i32* %%72, align 4, !dbg !28 for 0x%llxth hint within @huff_make_dhuff_tb  --> \n", ++aesl_llvm_cbe_3184_count);
  *llvm_cbe_tmp__447 = llvm_cbe_tmp__449;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__449);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @huff_make_dhuff_tb}\n");
  return llvm_cbe_tmp__443;
}


signed int DecodeHuffman(signed int *llvm_cbe_Xhuff_huffval, signed int llvm_cbe_Dhuff_ml, signed int *llvm_cbe_Dhuff_maxcode, signed int *llvm_cbe_Dhuff_mincode, signed int *llvm_cbe_Dhuff_valptr) {
  static  unsigned long long aesl_llvm_cbe_3186_count = 0;
  static  unsigned long long aesl_llvm_cbe_3187_count = 0;
  static  unsigned long long aesl_llvm_cbe_3188_count = 0;
  static  unsigned long long aesl_llvm_cbe_3189_count = 0;
  static  unsigned long long aesl_llvm_cbe_3190_count = 0;
  static  unsigned long long aesl_llvm_cbe_3191_count = 0;
  static  unsigned long long aesl_llvm_cbe_3192_count = 0;
  static  unsigned long long aesl_llvm_cbe_3193_count = 0;
  static  unsigned long long aesl_llvm_cbe_3194_count = 0;
  static  unsigned long long aesl_llvm_cbe_3195_count = 0;
  static  unsigned long long aesl_llvm_cbe_3196_count = 0;
  static  unsigned long long aesl_llvm_cbe_3197_count = 0;
  unsigned int llvm_cbe_tmp__458;
  static  unsigned long long aesl_llvm_cbe_3198_count = 0;
  static  unsigned long long aesl_llvm_cbe_3199_count = 0;
  static  unsigned long long aesl_llvm_cbe_3200_count = 0;
  static  unsigned long long aesl_llvm_cbe_3201_count = 0;
  static  unsigned long long aesl_llvm_cbe_3202_count = 0;
  static  unsigned long long aesl_llvm_cbe_3203_count = 0;
  static  unsigned long long aesl_llvm_cbe_3204_count = 0;
  static  unsigned long long aesl_llvm_cbe_3205_count = 0;
  static  unsigned long long aesl_llvm_cbe_3206_count = 0;
  static  unsigned long long aesl_llvm_cbe_3207_count = 0;
  static  unsigned long long aesl_llvm_cbe_3208_count = 0;
  signed int *llvm_cbe_tmp__459;
  static  unsigned long long aesl_llvm_cbe_3209_count = 0;
  unsigned int llvm_cbe_tmp__460;
  static  unsigned long long aesl_llvm_cbe_3210_count = 0;
  static  unsigned long long aesl_llvm_cbe_3211_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge3_count = 0;
  unsigned int llvm_cbe_storemerge3;
  unsigned int llvm_cbe_storemerge3__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3212_count = 0;
  unsigned int llvm_cbe_tmp__461;
  unsigned int llvm_cbe_tmp__461__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3213_count = 0;
  unsigned int llvm_cbe_tmp__462;
  static  unsigned long long aesl_llvm_cbe_3214_count = 0;
  unsigned int llvm_cbe_tmp__463;
  static  unsigned long long aesl_llvm_cbe_3215_count = 0;
  unsigned int llvm_cbe_tmp__464;
  static  unsigned long long aesl_llvm_cbe_3216_count = 0;
  static  unsigned long long aesl_llvm_cbe_3217_count = 0;
  static  unsigned long long aesl_llvm_cbe_3218_count = 0;
  static  unsigned long long aesl_llvm_cbe_3219_count = 0;
  static  unsigned long long aesl_llvm_cbe_3220_count = 0;
  static  unsigned long long aesl_llvm_cbe_3221_count = 0;
  unsigned int llvm_cbe_tmp__465;
  static  unsigned long long aesl_llvm_cbe_3222_count = 0;
  static  unsigned long long aesl_llvm_cbe_3223_count = 0;
  static  unsigned long long aesl_llvm_cbe_3224_count = 0;
  static  unsigned long long aesl_llvm_cbe_3225_count = 0;
  static  unsigned long long aesl_llvm_cbe_3226_count = 0;
  static  unsigned long long aesl_llvm_cbe_3227_count = 0;
  unsigned long long llvm_cbe_tmp__466;
  static  unsigned long long aesl_llvm_cbe_3228_count = 0;
  signed int *llvm_cbe_tmp__467;
  static  unsigned long long aesl_llvm_cbe_3229_count = 0;
  unsigned int llvm_cbe_tmp__468;
  static  unsigned long long aesl_llvm_cbe_3230_count = 0;
  static  unsigned long long aesl_llvm_cbe_3231_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_lcssa2_count = 0;
  unsigned long long llvm_cbe__2e_lcssa2;
  unsigned long long llvm_cbe__2e_lcssa2__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe__2e_lcssa_count = 0;
  unsigned int llvm_cbe__2e_lcssa;
  unsigned int llvm_cbe__2e_lcssa__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3232_count = 0;
  unsigned long long llvm_cbe_tmp__469;
  static  unsigned long long aesl_llvm_cbe_3233_count = 0;
  signed int *llvm_cbe_tmp__470;
  static  unsigned long long aesl_llvm_cbe_3234_count = 0;
  unsigned int llvm_cbe_tmp__471;
  static  unsigned long long aesl_llvm_cbe_3235_count = 0;
  static  unsigned long long aesl_llvm_cbe_3236_count = 0;
  static  unsigned long long aesl_llvm_cbe_3237_count = 0;
  signed int *llvm_cbe_tmp__472;
  static  unsigned long long aesl_llvm_cbe_3238_count = 0;
  unsigned int llvm_cbe_tmp__473;
  static  unsigned long long aesl_llvm_cbe_3239_count = 0;
  unsigned int llvm_cbe_tmp__474;
  static  unsigned long long aesl_llvm_cbe_3240_count = 0;
  signed int *llvm_cbe_tmp__475;
  static  unsigned long long aesl_llvm_cbe_3241_count = 0;
  unsigned int llvm_cbe_tmp__476;
  static  unsigned long long aesl_llvm_cbe_3242_count = 0;
  unsigned int llvm_cbe_tmp__477;
  static  unsigned long long aesl_llvm_cbe_3243_count = 0;
  static  unsigned long long aesl_llvm_cbe_3244_count = 0;
  static  unsigned long long aesl_llvm_cbe_3245_count = 0;
  unsigned long long llvm_cbe_tmp__478;
  static  unsigned long long aesl_llvm_cbe_3246_count = 0;
  signed int *llvm_cbe_tmp__479;
  static  unsigned long long aesl_llvm_cbe_3247_count = 0;
  unsigned int llvm_cbe_tmp__480;
  static  unsigned long long aesl_llvm_cbe_3248_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  unsigned int llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3249_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @DecodeHuffman\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call i32 @buf_getb(), !dbg !28 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3197_count);
  llvm_cbe_tmp__458 = (unsigned int ) /*tail*/ buf_getb();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__458);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = getelementptr inbounds i32* %%Dhuff_maxcode, i64 1, !dbg !28 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3208_count);
  llvm_cbe_tmp__459 = (signed int *)(&llvm_cbe_Dhuff_maxcode[(((signed long long )1ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = load i32* %%2, align 4, !dbg !28 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3209_count);
  llvm_cbe_tmp__460 = (unsigned int )*llvm_cbe_tmp__459;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__460);
  if ((((signed int )llvm_cbe_tmp__458) > ((signed int )llvm_cbe_tmp__460))) {
    llvm_cbe_storemerge3__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
    llvm_cbe_tmp__461__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__458;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    llvm_cbe__2e_lcssa2__PHI_TEMPORARY = (unsigned long long )1ull;   /* for PHI node */
    llvm_cbe__2e_lcssa__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__458;   /* for PHI node */
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge3 = phi i32 [ %%9, %%.lr.ph ], [ 1, %%0  for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_storemerge3_count);
  llvm_cbe_storemerge3 = (unsigned int )llvm_cbe_storemerge3__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge3 = 0x%X",llvm_cbe_storemerge3);
printf("\n = 0x%X",llvm_cbe_tmp__465);
printf("\n = 0x%X",1u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = phi i32 [ %%8, %%.lr.ph ], [ %%1, %%0  for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3212_count);
  llvm_cbe_tmp__461 = (unsigned int )llvm_cbe_tmp__461__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__461);
printf("\n = 0x%X",llvm_cbe_tmp__464);
printf("\n = 0x%X",llvm_cbe_tmp__458);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = shl i32 %%5, 1, !dbg !29 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3213_count);
  llvm_cbe_tmp__462 = (unsigned int )llvm_cbe_tmp__461 << 1u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__462);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = tail call i32 @buf_getb(), !dbg !29 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3214_count);
  llvm_cbe_tmp__463 = (unsigned int ) /*tail*/ buf_getb();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__463);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%7, %%6, !dbg !29 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3215_count);
  llvm_cbe_tmp__464 = (unsigned int )((unsigned int )(llvm_cbe_tmp__463&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__462&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__464&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add nsw i32 %%storemerge3, 1, !dbg !29 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3221_count);
  llvm_cbe_tmp__465 = (unsigned int )((unsigned int )(llvm_cbe_storemerge3&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__465&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = sext i32 %%9 to i64, !dbg !28 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3227_count);
  llvm_cbe_tmp__466 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__465);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__466);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = getelementptr inbounds i32* %%Dhuff_maxcode, i64 %%10, !dbg !28 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3228_count);
  llvm_cbe_tmp__467 = (signed int *)(&llvm_cbe_Dhuff_maxcode[(((signed long long )llvm_cbe_tmp__466))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__466));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = load i32* %%11, align 4, !dbg !28 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3229_count);
  llvm_cbe_tmp__468 = (unsigned int )*llvm_cbe_tmp__467;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__468);
  if ((((signed int )llvm_cbe_tmp__464) > ((signed int )llvm_cbe_tmp__468))) {
    llvm_cbe_storemerge3__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__465;   /* for PHI node */
    llvm_cbe_tmp__461__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__464;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    llvm_cbe__2e_lcssa2__PHI_TEMPORARY = (unsigned long long )llvm_cbe_tmp__466;   /* for PHI node */
    llvm_cbe__2e_lcssa__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__464;   /* for PHI node */
    goto llvm_cbe__2e__crit_edge;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
if (AESL_DEBUG_TRACE)
printf("\n  %%.lcssa2 = phi i64 [ 1, %%0 ], [ %%10, %%.lr.ph  for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe__2e_lcssa2_count);
  llvm_cbe__2e_lcssa2 = (unsigned long long )llvm_cbe__2e_lcssa2__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.lcssa2 = 0x%llX",llvm_cbe__2e_lcssa2);
printf("\n = 0x%llX",1ull);
printf("\n = 0x%llX",llvm_cbe_tmp__466);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%.lcssa = phi i32 [ %%1, %%0 ], [ %%8, %%.lr.ph  for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe__2e_lcssa_count);
  llvm_cbe__2e_lcssa = (unsigned int )llvm_cbe__2e_lcssa__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.lcssa = 0x%X",llvm_cbe__2e_lcssa);
printf("\n = 0x%X",llvm_cbe_tmp__458);
printf("\n = 0x%X",llvm_cbe_tmp__464);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = sext i32 %%Dhuff_ml to i64, !dbg !27 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3232_count);
  llvm_cbe_tmp__469 = (unsigned long long )((signed long long )(signed int )llvm_cbe_Dhuff_ml);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__469);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = getelementptr inbounds i32* %%Dhuff_maxcode, i64 %%14, !dbg !27 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3233_count);
  llvm_cbe_tmp__470 = (signed int *)(&llvm_cbe_Dhuff_maxcode[(((signed long long )llvm_cbe_tmp__469))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__469));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = load i32* %%15, align 4, !dbg !27 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3234_count);
  llvm_cbe_tmp__471 = (unsigned int )*llvm_cbe_tmp__470;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__471);
  if ((((signed int )llvm_cbe__2e_lcssa) < ((signed int )llvm_cbe_tmp__471))) {
    goto llvm_cbe_tmp__481;
  } else {
    llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe_tmp__482;
  }

llvm_cbe_tmp__481:
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = getelementptr inbounds i32* %%Dhuff_valptr, i64 %%.lcssa2, !dbg !28 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3237_count);
  llvm_cbe_tmp__472 = (signed int *)(&llvm_cbe_Dhuff_valptr[(((signed long long )llvm_cbe__2e_lcssa2))]);
if (AESL_DEBUG_TRACE) {
printf("\n.lcssa2 = 0x%llX",((signed long long )llvm_cbe__2e_lcssa2));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = load i32* %%19, align 4, !dbg !28 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3238_count);
  llvm_cbe_tmp__473 = (unsigned int )*llvm_cbe_tmp__472;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__473);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = add nsw i32 %%20, %%.lcssa, !dbg !28 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3239_count);
  llvm_cbe_tmp__474 = (unsigned int )((unsigned int )(llvm_cbe_tmp__473&4294967295ull)) + ((unsigned int )(llvm_cbe__2e_lcssa&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__474&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = getelementptr inbounds i32* %%Dhuff_mincode, i64 %%.lcssa2, !dbg !28 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3240_count);
  llvm_cbe_tmp__475 = (signed int *)(&llvm_cbe_Dhuff_mincode[(((signed long long )llvm_cbe__2e_lcssa2))]);
if (AESL_DEBUG_TRACE) {
printf("\n.lcssa2 = 0x%llX",((signed long long )llvm_cbe__2e_lcssa2));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = load i32* %%22, align 4, !dbg !28 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3241_count);
  llvm_cbe_tmp__476 = (unsigned int )*llvm_cbe_tmp__475;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__476);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = sub i32 %%21, %%23, !dbg !28 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3242_count);
  llvm_cbe_tmp__477 = (unsigned int )((unsigned int )(llvm_cbe_tmp__474&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__476&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__477&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = sext i32 %%24 to i64, !dbg !27 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3245_count);
  llvm_cbe_tmp__478 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__477);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__478);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = getelementptr inbounds i32* %%Xhuff_huffval, i64 %%25, !dbg !27 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3246_count);
  llvm_cbe_tmp__479 = (signed int *)(&llvm_cbe_Xhuff_huffval[(((signed long long )llvm_cbe_tmp__478))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__478));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = load i32* %%26, align 4, !dbg !27 for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_3247_count);
  llvm_cbe_tmp__480 = (unsigned int )*llvm_cbe_tmp__479;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__480);
  llvm_cbe_storemerge1__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__480;   /* for PHI node */
  goto llvm_cbe_tmp__482;

llvm_cbe_tmp__482:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32 [ %%27, %%18 ], [ 0, %%._crit_edge  for 0x%llxth hint within @DecodeHuffman  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1 = 0x%X",llvm_cbe_storemerge1);
printf("\n = 0x%X",llvm_cbe_tmp__480);
printf("\n = 0x%X",0u);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @DecodeHuffman}\n");
  return llvm_cbe_storemerge1;
}


void DecodeHuffMCU(signed int *llvm_cbe_out_buf, signed int llvm_cbe_num_cmp) {
  static  unsigned long long aesl_llvm_cbe_3250_count = 0;
  static  unsigned long long aesl_llvm_cbe_3251_count = 0;
  static  unsigned long long aesl_llvm_cbe_3252_count = 0;
  static  unsigned long long aesl_llvm_cbe_3253_count = 0;
  static  unsigned long long aesl_llvm_cbe_3254_count = 0;
  static  unsigned long long aesl_llvm_cbe_3255_count = 0;
  static  unsigned long long aesl_llvm_cbe_3256_count = 0;
  static  unsigned long long aesl_llvm_cbe_3257_count = 0;
  static  unsigned long long aesl_llvm_cbe_3258_count = 0;
  static  unsigned long long aesl_llvm_cbe_3259_count = 0;
  static  unsigned long long aesl_llvm_cbe_3260_count = 0;
  static  unsigned long long aesl_llvm_cbe_3261_count = 0;
  unsigned long long llvm_cbe_tmp__483;
  static  unsigned long long aesl_llvm_cbe_3262_count = 0;
   char *llvm_cbe_tmp__484;
  static  unsigned long long aesl_llvm_cbe_3263_count = 0;
  unsigned char llvm_cbe_tmp__485;
  static  unsigned long long aesl_llvm_cbe_3264_count = 0;
  unsigned long long llvm_cbe_tmp__486;
  static  unsigned long long aesl_llvm_cbe_3265_count = 0;
  signed int *llvm_cbe_tmp__487;
  static  unsigned long long aesl_llvm_cbe_3266_count = 0;
  signed int *llvm_cbe_tmp__488;
  static  unsigned long long aesl_llvm_cbe_3267_count = 0;
  unsigned int llvm_cbe_tmp__489;
  static  unsigned long long aesl_llvm_cbe_3268_count = 0;
  signed int *llvm_cbe_tmp__490;
  static  unsigned long long aesl_llvm_cbe_3269_count = 0;
  signed int *llvm_cbe_tmp__491;
  static  unsigned long long aesl_llvm_cbe_3270_count = 0;
  signed int *llvm_cbe_tmp__492;
  static  unsigned long long aesl_llvm_cbe_3271_count = 0;
  unsigned int llvm_cbe_tmp__493;
  static  unsigned long long aesl_llvm_cbe_3272_count = 0;
  static  unsigned long long aesl_llvm_cbe_3273_count = 0;
  static  unsigned long long aesl_llvm_cbe_3274_count = 0;
  static  unsigned long long aesl_llvm_cbe_3275_count = 0;
  static  unsigned long long aesl_llvm_cbe_3276_count = 0;
  static  unsigned long long aesl_llvm_cbe_3277_count = 0;
  static  unsigned long long aesl_llvm_cbe_3278_count = 0;
  static  unsigned long long aesl_llvm_cbe_3279_count = 0;
  static  unsigned long long aesl_llvm_cbe_3280_count = 0;
  static  unsigned long long aesl_llvm_cbe_3281_count = 0;
  static  unsigned long long aesl_llvm_cbe_3282_count = 0;
  static  unsigned long long aesl_llvm_cbe_3283_count = 0;
  static  unsigned long long aesl_llvm_cbe_3284_count = 0;
  static  unsigned long long aesl_llvm_cbe_3285_count = 0;
  unsigned int llvm_cbe_tmp__494;
  static  unsigned long long aesl_llvm_cbe_3286_count = 0;
  static  unsigned long long aesl_llvm_cbe_3287_count = 0;
  static  unsigned long long aesl_llvm_cbe_3288_count = 0;
  static  unsigned long long aesl_llvm_cbe_3289_count = 0;
  static  unsigned long long aesl_llvm_cbe_3290_count = 0;
  static  unsigned long long aesl_llvm_cbe_3291_count = 0;
  static  unsigned long long aesl_llvm_cbe_3292_count = 0;
  unsigned int llvm_cbe_tmp__495;
  static  unsigned long long aesl_llvm_cbe_3293_count = 0;
  static  unsigned long long aesl_llvm_cbe_3294_count = 0;
  static  unsigned long long aesl_llvm_cbe_3295_count = 0;
  static  unsigned long long aesl_llvm_cbe_3296_count = 0;
  static  unsigned long long aesl_llvm_cbe_3297_count = 0;
  static  unsigned long long aesl_llvm_cbe_3298_count = 0;
  static  unsigned long long aesl_llvm_cbe_3299_count = 0;
  static  unsigned long long aesl_llvm_cbe_3300_count = 0;
  static  unsigned long long aesl_llvm_cbe_3301_count = 0;
  static  unsigned long long aesl_llvm_cbe_3302_count = 0;
  static  unsigned long long aesl_llvm_cbe_3303_count = 0;
  static  unsigned long long aesl_llvm_cbe_3304_count = 0;
  unsigned long long llvm_cbe_tmp__496;
  static  unsigned long long aesl_llvm_cbe_3305_count = 0;
  signed int *llvm_cbe_tmp__497;
  static  unsigned long long aesl_llvm_cbe_3306_count = 0;
  unsigned int llvm_cbe_tmp__498;
  static  unsigned long long aesl_llvm_cbe_3307_count = 0;
  unsigned int llvm_cbe_tmp__499;
  static  unsigned long long aesl_llvm_cbe_3308_count = 0;
  static  unsigned long long aesl_llvm_cbe_3309_count = 0;
  static  unsigned long long aesl_llvm_cbe_3310_count = 0;
  signed int *llvm_cbe_tmp__500;
  static  unsigned long long aesl_llvm_cbe_3311_count = 0;
  unsigned int llvm_cbe_tmp__501;
  static  unsigned long long aesl_llvm_cbe_3312_count = 0;
  unsigned int llvm_cbe_tmp__502;
  static  unsigned long long aesl_llvm_cbe_3313_count = 0;
  static  unsigned long long aesl_llvm_cbe_3314_count = 0;
  unsigned int llvm_cbe_tmp__503;
  static  unsigned long long aesl_llvm_cbe_3315_count = 0;
  static  unsigned long long aesl_llvm_cbe_3316_count = 0;
  static  unsigned long long aesl_llvm_cbe_3317_count = 0;
  static  unsigned long long aesl_llvm_cbe_3318_count = 0;
  static  unsigned long long aesl_llvm_cbe_3319_count = 0;
  static  unsigned long long aesl_llvm_cbe_3320_count = 0;
  static  unsigned long long aesl_llvm_cbe_3321_count = 0;
  static  unsigned long long aesl_llvm_cbe_3322_count = 0;
  unsigned int llvm_cbe_tmp__504;
  unsigned int llvm_cbe_tmp__504__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3323_count = 0;
  unsigned int llvm_cbe_tmp__505;
  static  unsigned long long aesl_llvm_cbe_3324_count = 0;
  unsigned int llvm_cbe_tmp__506;
  static  unsigned long long aesl_llvm_cbe_3325_count = 0;
  static  unsigned long long aesl_llvm_cbe_3326_count = 0;
  static  unsigned long long aesl_llvm_cbe_3327_count = 0;
  static  unsigned long long aesl_llvm_cbe_3328_count = 0;
  static  unsigned long long aesl_llvm_cbe_3329_count = 0;
  static  unsigned long long aesl_llvm_cbe_3330_count = 0;
  static  unsigned long long aesl_llvm_cbe_3331_count = 0;
  static  unsigned long long aesl_llvm_cbe_3332_count = 0;
  static  unsigned long long aesl_llvm_cbe_3333_count = 0;
  static  unsigned long long aesl_llvm_cbe_3334_count = 0;
  signed int *llvm_cbe_tmp__507;
  static  unsigned long long aesl_llvm_cbe_3335_count = 0;
  signed int *llvm_cbe_tmp__508;
  static  unsigned long long aesl_llvm_cbe_3336_count = 0;
  signed int *llvm_cbe_tmp__509;
  static  unsigned long long aesl_llvm_cbe_3337_count = 0;
  signed int *llvm_cbe_tmp__510;
  static  unsigned long long aesl_llvm_cbe_3338_count = 0;
  signed int *llvm_cbe_tmp__511;
  static  unsigned long long aesl_llvm_cbe_3339_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge2_2e_rec_count = 0;
  unsigned long long llvm_cbe_storemerge2_2e_rec;
  unsigned long long llvm_cbe_storemerge2_2e_rec__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge1_2e_sum_count = 0;
  unsigned long long llvm_cbe_storemerge1_2e_sum;
  static  unsigned long long aesl_llvm_cbe_storemerge2_count = 0;
  signed int *llvm_cbe_storemerge2;
  static  unsigned long long aesl_llvm_cbe_3340_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge_2e_rec_count = 0;
  unsigned long long llvm_cbe_storemerge_2e_rec;
  static  unsigned long long aesl_llvm_cbe_storemerge1_2e_sum3_count = 0;
  unsigned long long llvm_cbe_storemerge1_2e_sum3;
  static  unsigned long long aesl_llvm_cbe_3341_count = 0;
  static  unsigned long long aesl_llvm_cbe_3342_count = 0;
  static  unsigned long long aesl_llvm_cbe_3343_count = 0;
  unsigned int llvm_cbe_tmp__512;
  unsigned int llvm_cbe_tmp__512__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3344_count = 0;
  static  unsigned long long aesl_llvm_cbe_3345_count = 0;
  static  unsigned long long aesl_llvm_cbe_3346_count = 0;
  unsigned int llvm_cbe_tmp__513;
  static  unsigned long long aesl_llvm_cbe_3347_count = 0;
  unsigned int llvm_cbe_tmp__514;
  static  unsigned long long aesl_llvm_cbe_3348_count = 0;
  static  unsigned long long aesl_llvm_cbe_3349_count = 0;
  static  unsigned long long aesl_llvm_cbe_3350_count = 0;
  unsigned int llvm_cbe_tmp__515;
  static  unsigned long long aesl_llvm_cbe_3351_count = 0;
  static  unsigned long long aesl_llvm_cbe_3352_count = 0;
  static  unsigned long long aesl_llvm_cbe_3353_count = 0;
  static  unsigned long long aesl_llvm_cbe_3354_count = 0;
  static  unsigned long long aesl_llvm_cbe_3355_count = 0;
  static  unsigned long long aesl_llvm_cbe_3356_count = 0;
  static  unsigned long long aesl_llvm_cbe_3357_count = 0;
  static  unsigned long long aesl_llvm_cbe_3358_count = 0;
  static  unsigned long long aesl_llvm_cbe_3359_count = 0;
  static  unsigned long long aesl_llvm_cbe_3360_count = 0;
  static  unsigned long long aesl_llvm_cbe_3361_count = 0;
  static  unsigned long long aesl_llvm_cbe_3362_count = 0;
  static  unsigned long long aesl_llvm_cbe_3363_count = 0;
  unsigned int llvm_cbe_tmp__516;
  static  unsigned long long aesl_llvm_cbe_3364_count = 0;
  unsigned int llvm_cbe_tmp__517;
  static  unsigned long long aesl_llvm_cbe_3365_count = 0;
  static  unsigned long long aesl_llvm_cbe_3366_count = 0;
  static  unsigned long long aesl_llvm_cbe_3367_count = 0;
  static  unsigned long long aesl_llvm_cbe_3368_count = 0;
  static  unsigned long long aesl_llvm_cbe_3369_count = 0;
  static  unsigned long long aesl_llvm_cbe_3370_count = 0;
  unsigned int llvm_cbe_tmp__518;
  static  unsigned long long aesl_llvm_cbe_3371_count = 0;
  static  unsigned long long aesl_llvm_cbe_3372_count = 0;
  static  unsigned long long aesl_llvm_cbe_3373_count = 0;
  static  unsigned long long aesl_llvm_cbe_3374_count = 0;
  static  unsigned long long aesl_llvm_cbe_3375_count = 0;
  static  unsigned long long aesl_llvm_cbe_3376_count = 0;
  static  unsigned long long aesl_llvm_cbe_3377_count = 0;
  static  unsigned long long aesl_llvm_cbe_3378_count = 0;
  static  unsigned long long aesl_llvm_cbe_3379_count = 0;
  static  unsigned long long aesl_llvm_cbe_3380_count = 0;
  static  unsigned long long aesl_llvm_cbe_3381_count = 0;
  static  unsigned long long aesl_llvm_cbe_3382_count = 0;
  unsigned int llvm_cbe_tmp__519;
  static  unsigned long long aesl_llvm_cbe_3383_count = 0;
  unsigned long long llvm_cbe_tmp__520;
  static  unsigned long long aesl_llvm_cbe_3384_count = 0;
  signed int *llvm_cbe_tmp__521;
  static  unsigned long long aesl_llvm_cbe_3385_count = 0;
  static  unsigned long long aesl_llvm_cbe_3386_count = 0;
  unsigned int llvm_cbe_tmp__522;
  static  unsigned long long aesl_llvm_cbe_3387_count = 0;
  static  unsigned long long aesl_llvm_cbe_3388_count = 0;
  static  unsigned long long aesl_llvm_cbe_3389_count = 0;
  static  unsigned long long aesl_llvm_cbe_3390_count = 0;
  static  unsigned long long aesl_llvm_cbe_3391_count = 0;
  static  unsigned long long aesl_llvm_cbe_3392_count = 0;
  static  unsigned long long aesl_llvm_cbe_3393_count = 0;
  static  unsigned long long aesl_llvm_cbe_3394_count = 0;
  static  unsigned long long aesl_llvm_cbe_3395_count = 0;
  static  unsigned long long aesl_llvm_cbe_3396_count = 0;
  static  unsigned long long aesl_llvm_cbe_3397_count = 0;
  static  unsigned long long aesl_llvm_cbe_3398_count = 0;
  unsigned long long llvm_cbe_tmp__523;
  static  unsigned long long aesl_llvm_cbe_3399_count = 0;
  signed int *llvm_cbe_tmp__524;
  static  unsigned long long aesl_llvm_cbe_3400_count = 0;
  unsigned int llvm_cbe_tmp__525;
  static  unsigned long long aesl_llvm_cbe_3401_count = 0;
  unsigned int llvm_cbe_tmp__526;
  static  unsigned long long aesl_llvm_cbe_3402_count = 0;
  static  unsigned long long aesl_llvm_cbe_3403_count = 0;
  static  unsigned long long aesl_llvm_cbe_3404_count = 0;
  signed int *llvm_cbe_tmp__527;
  static  unsigned long long aesl_llvm_cbe_3405_count = 0;
  unsigned int llvm_cbe_tmp__528;
  static  unsigned long long aesl_llvm_cbe_3406_count = 0;
  unsigned int llvm_cbe_tmp__529;
  static  unsigned long long aesl_llvm_cbe_3407_count = 0;
  unsigned int llvm_cbe_tmp__530;
  static  unsigned long long aesl_llvm_cbe_3408_count = 0;
  static  unsigned long long aesl_llvm_cbe_3409_count = 0;
  static  unsigned long long aesl_llvm_cbe_3410_count = 0;
  unsigned int llvm_cbe_tmp__531;
  static  unsigned long long aesl_llvm_cbe_3411_count = 0;
  static  unsigned long long aesl_llvm_cbe_3412_count = 0;
  static  unsigned long long aesl_llvm_cbe_3413_count = 0;
  static  unsigned long long aesl_llvm_cbe_3414_count = 0;
  static  unsigned long long aesl_llvm_cbe_3415_count = 0;
  static  unsigned long long aesl_llvm_cbe_3416_count = 0;
  static  unsigned long long aesl_llvm_cbe_3417_count = 0;
  static  unsigned long long aesl_llvm_cbe_3418_count = 0;
  static  unsigned long long aesl_llvm_cbe_3419_count = 0;
  static  unsigned long long aesl_llvm_cbe_3420_count = 0;
  static  unsigned long long aesl_llvm_cbe_3421_count = 0;
  static  unsigned long long aesl_llvm_cbe_3422_count = 0;
  static  unsigned long long aesl_llvm_cbe_3423_count = 0;
  unsigned int llvm_cbe_tmp__532;
  static  unsigned long long aesl_llvm_cbe_3424_count = 0;
  static  unsigned long long aesl_llvm_cbe_3425_count = 0;
  static  unsigned long long aesl_llvm_cbe_3426_count = 0;
  static  unsigned long long aesl_llvm_cbe_3427_count = 0;
  static  unsigned long long aesl_llvm_cbe_3428_count = 0;
  static  unsigned long long aesl_llvm_cbe_3429_count = 0;
  static  unsigned long long aesl_llvm_cbe_3430_count = 0;
  static  unsigned long long aesl_llvm_cbe_3431_count = 0;
  static  unsigned long long aesl_llvm_cbe_3432_count = 0;
  static  unsigned long long aesl_llvm_cbe_3433_count = 0;
  static  unsigned long long aesl_llvm_cbe_3434_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @DecodeHuffMCU\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = sext i32 %%num_cmp to i64, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3261_count);
  llvm_cbe_tmp__483 = (unsigned long long )((signed long long )(signed int )llvm_cbe_num_cmp);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__483);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = getelementptr inbounds [3 x i8]* @p_jinfo_comps_info_dc_tbl_no, i64 0, i64 %%1, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3262_count);
  llvm_cbe_tmp__484 = ( char *)(&p_jinfo_comps_info_dc_tbl_no[(((signed long long )llvm_cbe_tmp__483))
#ifdef AESL_BC_SIM
 % 3
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__483));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__483) < 3)) fprintf(stderr, "%s:%d: warning: Read access out of array 'p_jinfo_comps_info_dc_tbl_no' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = load i8* %%2, align 1, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3263_count);
  llvm_cbe_tmp__485 = (unsigned char )*llvm_cbe_tmp__484;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__485);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = sext i8 %%3 to i64, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3264_count);
  llvm_cbe_tmp__486 = (unsigned long long )((signed long long )( char )llvm_cbe_tmp__485);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__486);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = getelementptr inbounds [2 x [257 x i32]]* @p_jinfo_dc_xhuff_tbl_huffval, i64 0, i64 %%4, i64 0, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3265_count);
  llvm_cbe_tmp__487 = (signed int *)(&p_jinfo_dc_xhuff_tbl_huffval[(((signed long long )llvm_cbe_tmp__486))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 257
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__486));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds [2 x i32]* @p_jinfo_dc_dhuff_tbl_ml, i64 0, i64 %%4, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3266_count);
  llvm_cbe_tmp__488 = (signed int *)(&p_jinfo_dc_dhuff_tbl_ml[(((signed long long )llvm_cbe_tmp__486))
#ifdef AESL_BC_SIM
 % 2
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__486));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__486) < 2)) fprintf(stderr, "%s:%d: warning: Read access out of array 'p_jinfo_dc_dhuff_tbl_ml' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i32* %%6, align 4, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3267_count);
  llvm_cbe_tmp__489 = (unsigned int )*llvm_cbe_tmp__488;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__489);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = getelementptr inbounds [2 x [36 x i32]]* @p_jinfo_dc_dhuff_tbl_maxcode, i64 0, i64 %%4, i64 0, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3268_count);
  llvm_cbe_tmp__490 = (signed int *)(&p_jinfo_dc_dhuff_tbl_maxcode[(((signed long long )llvm_cbe_tmp__486))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__486));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = getelementptr inbounds [2 x [36 x i32]]* @p_jinfo_dc_dhuff_tbl_mincode, i64 0, i64 %%4, i64 0, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3269_count);
  llvm_cbe_tmp__491 = (signed int *)(&p_jinfo_dc_dhuff_tbl_mincode[(((signed long long )llvm_cbe_tmp__486))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__486));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = getelementptr inbounds [2 x [36 x i32]]* @p_jinfo_dc_dhuff_tbl_valptr, i64 0, i64 %%4, i64 0, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3270_count);
  llvm_cbe_tmp__492 = (signed int *)(&p_jinfo_dc_dhuff_tbl_valptr[(((signed long long )llvm_cbe_tmp__486))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__486));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = tail call i32 @DecodeHuffman(i32* %%5, i32 %%7, i32* %%8, i32* %%9, i32* %%10), !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3271_count);
  llvm_cbe_tmp__493 = (unsigned int ) /*tail*/ DecodeHuffman((signed int *)llvm_cbe_tmp__487, llvm_cbe_tmp__489, (signed int *)llvm_cbe_tmp__490, (signed int *)llvm_cbe_tmp__491, (signed int *)llvm_cbe_tmp__492);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__489);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__493);
}
  if (((llvm_cbe_tmp__493&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe_tmp__533;
  }

llvm_cbe_tmp__533:
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = tail call i32 @buf_getv(i32 %%11), !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3285_count);
  llvm_cbe_tmp__494 = (unsigned int ) /*tail*/ buf_getv(llvm_cbe_tmp__493);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__493);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__494);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = add nsw i32 %%11, -1, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3292_count);
  llvm_cbe_tmp__495 = (unsigned int )((unsigned int )(llvm_cbe_tmp__493&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__495&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = sext i32 %%15 to i64, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3304_count);
  llvm_cbe_tmp__496 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__495);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__496);
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = getelementptr inbounds [32 x i32]* @bit_set_mask, i64 0, i64 %%16, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3305_count);
  llvm_cbe_tmp__497 = (signed int *)(&bit_set_mask[(((signed long long )llvm_cbe_tmp__496))
#ifdef AESL_BC_SIM
 % 32
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__496));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__496) < 32)) fprintf(stderr, "%s:%d: warning: Read access out of array 'bit_set_mask' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = load i32* %%17, align 4, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3306_count);
  llvm_cbe_tmp__498 = (unsigned int )*llvm_cbe_tmp__497;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__498);
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = and i32 %%18, %%14, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3307_count);
  llvm_cbe_tmp__499 = (unsigned int )llvm_cbe_tmp__498 & llvm_cbe_tmp__494;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__499);
  if (((llvm_cbe_tmp__499&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__534;
  } else {
    llvm_cbe_tmp__504__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__494;   /* for PHI node */
    goto llvm_cbe_tmp__535;
  }

llvm_cbe_tmp__534:
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = getelementptr inbounds [20 x i32]* @aesl_internal_extend_mask, i64 0, i64 %%16, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3310_count);
  llvm_cbe_tmp__500 = (signed int *)(&aesl_internal_extend_mask[(((signed long long )llvm_cbe_tmp__496))
#ifdef AESL_BC_SIM
 % 20
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__496));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__496) < 20)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_extend_mask' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = load i32* %%22, align 4, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3311_count);
  llvm_cbe_tmp__501 = (unsigned int )*llvm_cbe_tmp__500;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__501);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = or i32 %%23, %%14, !dbg !29 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3312_count);
  llvm_cbe_tmp__502 = (unsigned int )llvm_cbe_tmp__501 | llvm_cbe_tmp__494;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__502);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = add nsw i32 %%24, 1, !dbg !30 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3314_count);
  llvm_cbe_tmp__503 = (unsigned int )((unsigned int )(llvm_cbe_tmp__502&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__503&4294967295ull)));
  llvm_cbe_tmp__504__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__503;   /* for PHI node */
  goto llvm_cbe_tmp__535;

llvm_cbe_tmp__535:
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = phi i32 [ %%25, %%21 ], [ %%14, %%13 ], !dbg !27 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3322_count);
  llvm_cbe_tmp__504 = (unsigned int )llvm_cbe_tmp__504__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__504);
printf("\n = 0x%X",llvm_cbe_tmp__503);
printf("\n = 0x%X",llvm_cbe_tmp__494);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = load i32* %%out_buf, align 4, !dbg !27 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3323_count);
  llvm_cbe_tmp__505 = (unsigned int )*llvm_cbe_out_buf;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__505);
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = add nsw i32 %%28, %%27, !dbg !27 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3324_count);
  llvm_cbe_tmp__506 = (unsigned int )((unsigned int )(llvm_cbe_tmp__505&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__504&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__506&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%29, i32* %%out_buf, align 4, !dbg !27 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3331_count);
  *llvm_cbe_out_buf = llvm_cbe_tmp__506;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__506);
  goto llvm_cbe__2e_lr_2e_ph;

llvm_cbe__2e_lr_2e_ph:
  llvm_cbe_storemerge2_2e_rec__PHI_TEMPORARY = (unsigned long long )0ull;   /* for PHI node */
  goto llvm_cbe_tmp__536;

llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = getelementptr inbounds [2 x [257 x i32]]* @p_jinfo_ac_xhuff_tbl_huffval, i64 0, i64 %%4, i64 0, !dbg !30 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3334_count);
  llvm_cbe_tmp__507 = (signed int *)(&p_jinfo_ac_xhuff_tbl_huffval[(((signed long long )llvm_cbe_tmp__486))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 257
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__486));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = getelementptr inbounds [2 x i32]* @p_jinfo_ac_dhuff_tbl_ml, i64 0, i64 %%4, !dbg !30 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3335_count);
  llvm_cbe_tmp__508 = (signed int *)(&p_jinfo_ac_dhuff_tbl_ml[(((signed long long )llvm_cbe_tmp__486))
#ifdef AESL_BC_SIM
 % 2
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__486));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = getelementptr inbounds [2 x [36 x i32]]* @p_jinfo_ac_dhuff_tbl_maxcode, i64 0, i64 %%4, i64 0, !dbg !30 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3336_count);
  llvm_cbe_tmp__509 = (signed int *)(&p_jinfo_ac_dhuff_tbl_maxcode[(((signed long long )llvm_cbe_tmp__486))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__486));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = getelementptr inbounds [2 x [36 x i32]]* @p_jinfo_ac_dhuff_tbl_mincode, i64 0, i64 %%4, i64 0, !dbg !30 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3337_count);
  llvm_cbe_tmp__510 = (signed int *)(&p_jinfo_ac_dhuff_tbl_mincode[(((signed long long )llvm_cbe_tmp__486))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__486));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = getelementptr inbounds [2 x [36 x i32]]* @p_jinfo_ac_dhuff_tbl_valptr, i64 0, i64 %%4, i64 0, !dbg !30 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3338_count);
  llvm_cbe_tmp__511 = (signed int *)(&p_jinfo_ac_dhuff_tbl_valptr[(((signed long long )llvm_cbe_tmp__486))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__486));
}
  llvm_cbe_tmp__512__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
  goto llvm_cbe__2e_backedge;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__536:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge2.rec = phi i64 [ 0, %%.lr.ph ], [ %%storemerge.rec, %%35  for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_storemerge2_2e_rec_count);
  llvm_cbe_storemerge2_2e_rec = (unsigned long long )llvm_cbe_storemerge2_2e_rec__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge2.rec = 0x%llX",llvm_cbe_storemerge2_2e_rec);
printf("\n = 0x%llX",0ull);
printf("\nstoremerge.rec = 0x%llX",llvm_cbe_storemerge_2e_rec);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1.sum = add i64 %%storemerge2.rec,  for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_storemerge1_2e_sum_count);
  llvm_cbe_storemerge1_2e_sum = (unsigned long long )((unsigned long long )(llvm_cbe_storemerge2_2e_rec&18446744073709551615ull)) + ((unsigned long long )(1ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge1.sum = 0x%llX\n", ((unsigned long long )(llvm_cbe_storemerge1_2e_sum&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge2 = getelementptr i32* %%out_buf, i64 %%storemerge1.su for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_storemerge2_count);
  llvm_cbe_storemerge2 = (signed int *)(&llvm_cbe_out_buf[(((signed long long )llvm_cbe_storemerge1_2e_sum))]);
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge1.sum = 0x%llX",((signed long long )llvm_cbe_storemerge1_2e_sum));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%storemerge2, align 4, !dbg !30 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3340_count);
  *llvm_cbe_storemerge2 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge.rec = add i64 %%storemerge2.rec, 1, !dbg !27 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_storemerge_2e_rec_count);
  llvm_cbe_storemerge_2e_rec = (unsigned long long )((unsigned long long )(llvm_cbe_storemerge2_2e_rec&18446744073709551615ull)) + ((unsigned long long )(1ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge.rec = 0x%llX\n", ((unsigned long long )(llvm_cbe_storemerge_2e_rec&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1.sum3 = add i64 %%storemerge2.rec, 2, !dbg !27 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_storemerge1_2e_sum3_count);
  llvm_cbe_storemerge1_2e_sum3 = (unsigned long long )((unsigned long long )(llvm_cbe_storemerge2_2e_rec&18446744073709551615ull)) + ((unsigned long long )(2ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge1.sum3 = 0x%llX\n", ((unsigned long long )(llvm_cbe_storemerge1_2e_sum3&18446744073709551615ull)));
  if ((((signed long long )llvm_cbe_storemerge1_2e_sum3) < ((signed long long )64ull))) {
    llvm_cbe_storemerge2_2e_rec__PHI_TEMPORARY = (unsigned long long )llvm_cbe_storemerge_2e_rec;   /* for PHI node */
    goto llvm_cbe_tmp__536;
  } else {
    goto llvm_cbe__2e_preheader;
  }

  } while (1); /* end of syntactic loop '' */
  do {     /* Syntactic loop '.backedge' to make GCC happy */
llvm_cbe__2e_backedge:
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = phi i32 [ 1, %%.preheader ], [ %%69, %%68 ], [ %%65, %%64  for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3343_count);
  llvm_cbe_tmp__512 = (unsigned int )llvm_cbe_tmp__512__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__512);
printf("\n = 0x%X",1u);
printf("\n = 0x%X",llvm_cbe_tmp__532);
printf("\n = 0x%X",llvm_cbe_tmp__531);
}
  if ((((signed int )llvm_cbe_tmp__512) < ((signed int )64u))) {
    goto llvm_cbe_tmp__537;
  } else {
    goto llvm_cbe_tmp__538;
  }

llvm_cbe_tmp__539:
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = add nsw i32 %%47, 1, !dbg !31 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3410_count);
  llvm_cbe_tmp__531 = (unsigned int )((unsigned int )(llvm_cbe_tmp__518&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__531&4294967295ull)));
  llvm_cbe_tmp__512__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__531;   /* for PHI node */
  goto llvm_cbe__2e_backedge;

llvm_cbe_tmp__540:
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = tail call i32 @buf_getv(i32 %%42), !dbg !28 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3382_count);
  llvm_cbe_tmp__519 = (unsigned int ) /*tail*/ buf_getv(llvm_cbe_tmp__515);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__515);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__519);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = sext i32 %%47 to i64, !dbg !28 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3383_count);
  llvm_cbe_tmp__520 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__518);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__520);
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = getelementptr inbounds i32* %%out_buf, i64 %%51, !dbg !28 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3384_count);
  llvm_cbe_tmp__521 = (signed int *)(&llvm_cbe_out_buf[(((signed long long )llvm_cbe_tmp__520))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__520));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%50, i32* %%52, align 4, !dbg !28 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3385_count);
  *llvm_cbe_tmp__521 = llvm_cbe_tmp__519;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__519);
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = add nsw i32 %%42, -1, !dbg !30 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3386_count);
  llvm_cbe_tmp__522 = (unsigned int )((unsigned int )(llvm_cbe_tmp__515&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__522&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = sext i32 %%53 to i64, !dbg !28 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3398_count);
  llvm_cbe_tmp__523 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__522);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__523);
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = getelementptr inbounds [32 x i32]* @bit_set_mask, i64 0, i64 %%54, !dbg !28 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3399_count);
  llvm_cbe_tmp__524 = (signed int *)(&bit_set_mask[(((signed long long )llvm_cbe_tmp__523))
#ifdef AESL_BC_SIM
 % 32
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__523));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__523) < 32)) fprintf(stderr, "%s:%d: warning: Read access out of array 'bit_set_mask' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = load i32* %%55, align 4, !dbg !28 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3400_count);
  llvm_cbe_tmp__525 = (unsigned int )*llvm_cbe_tmp__524;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__525);
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = and i32 %%56, %%50, !dbg !28 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3401_count);
  llvm_cbe_tmp__526 = (unsigned int )llvm_cbe_tmp__525 & llvm_cbe_tmp__519;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__526);
  if (((llvm_cbe_tmp__526&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__541;
  } else {
    goto llvm_cbe_tmp__539;
  }

llvm_cbe_tmp__542:
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = add nsw i32 %%44, %%37, !dbg !31 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3370_count);
  llvm_cbe_tmp__518 = (unsigned int )((unsigned int )(llvm_cbe_tmp__517&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__512&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__518&4294967295ull)));
  if ((((signed int )llvm_cbe_tmp__518) > ((signed int )63u))) {
    goto llvm_cbe_tmp__538;
  } else {
    goto llvm_cbe_tmp__540;
  }

llvm_cbe_tmp__537:

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__486) < 2)) fprintf(stderr, "%s:%d: warning: Read access out of array 'p_jinfo_ac_dhuff_tbl_ml' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = load i32* %%31, align 4, !dbg !30 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3346_count);
  llvm_cbe_tmp__513 = (unsigned int )*llvm_cbe_tmp__508;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__513);
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = tail call i32 @DecodeHuffman(i32* %%30, i32 %%40, i32* %%32, i32* %%33, i32* %%34), !dbg !30 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3347_count);
  llvm_cbe_tmp__514 = (unsigned int ) /*tail*/ DecodeHuffman((signed int *)llvm_cbe_tmp__507, llvm_cbe_tmp__513, (signed int *)llvm_cbe_tmp__509, (signed int *)llvm_cbe_tmp__510, (signed int *)llvm_cbe_tmp__511);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",llvm_cbe_tmp__513);
printf("\nReturn  = 0x%X",llvm_cbe_tmp__514);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = and i32 %%41, 15, !dbg !31 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3350_count);
  llvm_cbe_tmp__515 = (unsigned int )llvm_cbe_tmp__514 & 15u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__515);
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = lshr i32 %%41, 4, !dbg !31 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3363_count);
  llvm_cbe_tmp__516 = (unsigned int )((unsigned int )(((unsigned int )(llvm_cbe_tmp__514&4294967295ull)) >> ((unsigned int )(4u&4294967295ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__516&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = and i32 %%43, 15, !dbg !31 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3364_count);
  llvm_cbe_tmp__517 = (unsigned int )llvm_cbe_tmp__516 & 15u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__517);
  if (((llvm_cbe_tmp__515&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__543;
  } else {
    goto llvm_cbe_tmp__542;
  }

llvm_cbe_tmp__541:
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = getelementptr inbounds [20 x i32]* @aesl_internal_extend_mask, i64 0, i64 %%54, !dbg !28 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3404_count);
  llvm_cbe_tmp__527 = (signed int *)(&aesl_internal_extend_mask[(((signed long long )llvm_cbe_tmp__523))
#ifdef AESL_BC_SIM
 % 20
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__523));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__523) < 20)) fprintf(stderr, "%s:%d: warning: Read access out of array 'aesl_internal_extend_mask' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = load i32* %%60, align 4, !dbg !28 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3405_count);
  llvm_cbe_tmp__528 = (unsigned int )*llvm_cbe_tmp__527;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__528);
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = or i32 %%61, %%50, !dbg !28 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3406_count);
  llvm_cbe_tmp__529 = (unsigned int )llvm_cbe_tmp__528 | llvm_cbe_tmp__519;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__529);
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = add nsw i32 %%62, 1, !dbg !28 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3407_count);
  llvm_cbe_tmp__530 = (unsigned int )((unsigned int )(llvm_cbe_tmp__529&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__530&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%63, i32* %%52, align 4, !dbg !28 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3408_count);
  *llvm_cbe_tmp__521 = llvm_cbe_tmp__530;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__530);
  goto llvm_cbe_tmp__539;

llvm_cbe_tmp__544:
if (AESL_DEBUG_TRACE)
printf("\n  %%69 = add nsw i32 %%37, 16, !dbg !31 for 0x%llxth hint within @DecodeHuffMCU  --> \n", ++aesl_llvm_cbe_3423_count);
  llvm_cbe_tmp__532 = (unsigned int )((unsigned int )(llvm_cbe_tmp__512&4294967295ull)) + ((unsigned int )(16u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__532&4294967295ull)));
  llvm_cbe_tmp__512__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__532;   /* for PHI node */
  goto llvm_cbe__2e_backedge;

llvm_cbe_tmp__543:
  if (((llvm_cbe_tmp__517&4294967295U) == (15u&4294967295U))) {
    goto llvm_cbe_tmp__544;
  } else {
    goto llvm_cbe_tmp__538;
  }

  } while (1); /* end of syntactic loop '.backedge' */
llvm_cbe_tmp__538:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @DecodeHuffMCU}\n");
  return;
}


void decode_block(signed int llvm_cbe_comp_no, signed int *llvm_cbe_out_buf, signed int *llvm_cbe_HuffBuff) {
  static  unsigned long long aesl_llvm_cbe_QuantBuff_count = 0;
  signed int llvm_cbe_QuantBuff[64];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_3435_count = 0;
  static  unsigned long long aesl_llvm_cbe_3436_count = 0;
  static  unsigned long long aesl_llvm_cbe_3437_count = 0;
  static  unsigned long long aesl_llvm_cbe_3438_count = 0;
  static  unsigned long long aesl_llvm_cbe_3439_count = 0;
  static  unsigned long long aesl_llvm_cbe_3440_count = 0;
  static  unsigned long long aesl_llvm_cbe_3441_count = 0;
  static  unsigned long long aesl_llvm_cbe_3442_count = 0;
  static  unsigned long long aesl_llvm_cbe_3443_count = 0;
  static  unsigned long long aesl_llvm_cbe_3444_count = 0;
  static  unsigned long long aesl_llvm_cbe_3445_count = 0;
  static  unsigned long long aesl_llvm_cbe_3446_count = 0;
  static  unsigned long long aesl_llvm_cbe_3447_count = 0;
  signed int *llvm_cbe_tmp__545;
  static  unsigned long long aesl_llvm_cbe_3448_count = 0;
  static  unsigned long long aesl_llvm_cbe_3449_count = 0;
  unsigned long long llvm_cbe_tmp__546;
  static  unsigned long long aesl_llvm_cbe_3450_count = 0;
   char *llvm_cbe_tmp__547;
  static  unsigned long long aesl_llvm_cbe_3451_count = 0;
  unsigned char llvm_cbe_tmp__548;
  static  unsigned long long aesl_llvm_cbe_3452_count = 0;
  unsigned long long llvm_cbe_tmp__549;
  static  unsigned long long aesl_llvm_cbe_3453_count = 0;
  signed int *llvm_cbe_tmp__550;
  static  unsigned long long aesl_llvm_cbe_3454_count = 0;
  static  unsigned long long aesl_llvm_cbe_3455_count = 0;
  static  unsigned long long aesl_llvm_cbe_3456_count = 0;
  static  unsigned long long aesl_llvm_cbe_3457_count = 0;
  static  unsigned long long aesl_llvm_cbe_3458_count = 0;
  static  unsigned long long aesl_llvm_cbe_3459_count = 0;
  static  unsigned long long aesl_llvm_cbe_3460_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @decode_block\n");
if (AESL_DEBUG_TRACE)
printf("\n  call void @DecodeHuffMCU(i32* %%HuffBuff, i32 %%comp_no), !dbg !27 for 0x%llxth hint within @decode_block  --> \n", ++aesl_llvm_cbe_3446_count);
  DecodeHuffMCU((signed int *)llvm_cbe_HuffBuff, llvm_cbe_comp_no);
if (AESL_DEBUG_TRACE) {
printf("\nArgument comp_no = 0x%X",llvm_cbe_comp_no);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = getelementptr inbounds [64 x i32]* %%QuantBuff, i64 0, i64 0, !dbg !28 for 0x%llxth hint within @decode_block  --> \n", ++aesl_llvm_cbe_3447_count);
  llvm_cbe_tmp__545 = (signed int *)(&llvm_cbe_QuantBuff[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @IZigzagMatrix(i32* %%HuffBuff, i32* %%1), !dbg !28 for 0x%llxth hint within @decode_block  --> \n", ++aesl_llvm_cbe_3448_count);
  IZigzagMatrix((signed int *)llvm_cbe_HuffBuff, (signed int *)llvm_cbe_tmp__545);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i32 %%comp_no to i64, !dbg !27 for 0x%llxth hint within @decode_block  --> \n", ++aesl_llvm_cbe_3449_count);
  llvm_cbe_tmp__546 = (unsigned long long )((signed long long )(signed int )llvm_cbe_comp_no);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__546);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds [3 x i8]* @p_jinfo_comps_info_quant_tbl_no, i64 0, i64 %%2, !dbg !27 for 0x%llxth hint within @decode_block  --> \n", ++aesl_llvm_cbe_3450_count);
  llvm_cbe_tmp__547 = ( char *)(&p_jinfo_comps_info_quant_tbl_no[(((signed long long )llvm_cbe_tmp__546))
#ifdef AESL_BC_SIM
 % 3
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__546));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__546) < 3)) fprintf(stderr, "%s:%d: warning: Read access out of array 'p_jinfo_comps_info_quant_tbl_no' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = load i8* %%3, align 1, !dbg !27 for 0x%llxth hint within @decode_block  --> \n", ++aesl_llvm_cbe_3451_count);
  llvm_cbe_tmp__548 = (unsigned char )*llvm_cbe_tmp__547;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__548);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = sext i8 %%4 to i64, !dbg !27 for 0x%llxth hint within @decode_block  --> \n", ++aesl_llvm_cbe_3452_count);
  llvm_cbe_tmp__549 = (unsigned long long )((signed long long )( char )llvm_cbe_tmp__548);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__549);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = getelementptr inbounds [4 x [64 x i32]]* @p_jinfo_quant_tbl_quantval, i64 0, i64 %%5, i64 64, !dbg !27 for 0x%llxth hint within @decode_block  --> \n", ++aesl_llvm_cbe_3453_count);
  llvm_cbe_tmp__550 = (signed int *)(&p_jinfo_quant_tbl_quantval[(((signed long long )llvm_cbe_tmp__549))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )64ull))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__549));
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @IQuantize(i32* %%1, i32* %%6), !dbg !29 for 0x%llxth hint within @decode_block  --> \n", ++aesl_llvm_cbe_3456_count);
  IQuantize((signed int *)llvm_cbe_tmp__545, (signed int *)llvm_cbe_tmp__550);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @ChenIDct(i32* %%1, i32* %%out_buf), !dbg !27 for 0x%llxth hint within @decode_block  --> \n", ++aesl_llvm_cbe_3457_count);
  ChenIDct((signed int *)llvm_cbe_tmp__545, (signed int *)llvm_cbe_out_buf);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @PostshiftIDctMatrix(i32* %%out_buf, i32 128), !dbg !28 for 0x%llxth hint within @decode_block  --> \n", ++aesl_llvm_cbe_3458_count);
  PostshiftIDctMatrix((signed int *)llvm_cbe_out_buf, 128u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",128u);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @BoundIDctMatrix(i32* %%out_buf, i32 255), !dbg !28 for 0x%llxth hint within @decode_block  --> \n", ++aesl_llvm_cbe_3459_count);
  BoundIDctMatrix((signed int *)llvm_cbe_out_buf, 255u);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",255u);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @decode_block}\n");
  return;
}


void decode(signed int *llvm_cbe_out_data_image_width, signed int *llvm_cbe_out_data_image_height, signed int *llvm_cbe_out_data_comp_vpos, signed int *llvm_cbe_out_data_comp_hpos,  char (*llvm_cbe_outputVector)[16384]) {
  static  unsigned long long aesl_llvm_cbe_HuffBuff_count = 0;
  signed int llvm_cbe_HuffBuff[3][64];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_IDCTBuff_count = 0;
  signed int llvm_cbe_IDCTBuff[6][64];    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_3461_count = 0;
  static  unsigned long long aesl_llvm_cbe_3462_count = 0;
  static  unsigned long long aesl_llvm_cbe_3463_count = 0;
  static  unsigned long long aesl_llvm_cbe_3464_count = 0;
  static  unsigned long long aesl_llvm_cbe_3465_count = 0;
  static  unsigned long long aesl_llvm_cbe_3466_count = 0;
  static  unsigned long long aesl_llvm_cbe_3467_count = 0;
  static  unsigned long long aesl_llvm_cbe_3468_count = 0;
  static  unsigned long long aesl_llvm_cbe_3469_count = 0;
  static  unsigned long long aesl_llvm_cbe_3470_count = 0;
  static  unsigned long long aesl_llvm_cbe_3471_count = 0;
  static  unsigned long long aesl_llvm_cbe_3472_count = 0;
  static  unsigned long long aesl_llvm_cbe_3473_count = 0;
  static  unsigned long long aesl_llvm_cbe_3474_count = 0;
  static  unsigned long long aesl_llvm_cbe_3475_count = 0;
  static  unsigned long long aesl_llvm_cbe_3476_count = 0;
  static  unsigned long long aesl_llvm_cbe_3477_count = 0;
  static  unsigned long long aesl_llvm_cbe_3478_count = 0;
  static  unsigned long long aesl_llvm_cbe_3479_count = 0;
  static  unsigned long long aesl_llvm_cbe_3480_count = 0;
  static  unsigned long long aesl_llvm_cbe_3481_count = 0;
  static  unsigned long long aesl_llvm_cbe_3482_count = 0;
  static  unsigned long long aesl_llvm_cbe_3483_count = 0;
  unsigned char llvm_cbe_tmp__551;
  static  unsigned long long aesl_llvm_cbe_3484_count = 0;
  static  unsigned long long aesl_llvm_cbe_3485_count = 0;
  static  unsigned long long aesl_llvm_cbe_3486_count = 0;
  static  unsigned long long aesl_llvm_cbe_3487_count = 0;
  static  unsigned long long aesl_llvm_cbe_3488_count = 0;
  static  unsigned long long aesl_llvm_cbe_3489_count = 0;
  static  unsigned long long aesl_llvm_cbe_3490_count = 0;
  static  unsigned long long aesl_llvm_cbe_3491_count = 0;
  static  unsigned long long aesl_llvm_cbe_3492_count = 0;
  static  unsigned long long aesl_llvm_cbe_3493_count = 0;
  static  unsigned long long aesl_llvm_cbe_3494_count = 0;
  static  unsigned long long aesl_llvm_cbe_3495_count = 0;
  static  unsigned long long aesl_llvm_cbe_3496_count = 0;
  static  unsigned long long aesl_llvm_cbe_3497_count = 0;
  static  unsigned long long aesl_llvm_cbe_3498_count = 0;
  static  unsigned long long aesl_llvm_cbe_3499_count = 0;
  static  unsigned long long aesl_llvm_cbe_3500_count = 0;
  static  unsigned long long aesl_llvm_cbe_3501_count = 0;
  static  unsigned long long aesl_llvm_cbe_3502_count = 0;
  static  unsigned long long aesl_llvm_cbe_3503_count = 0;
  static  unsigned long long aesl_llvm_cbe_3504_count = 0;
  static  unsigned long long aesl_llvm_cbe_3505_count = 0;
  static  unsigned long long aesl_llvm_cbe_3506_count = 0;
  static  unsigned long long aesl_llvm_cbe_3507_count = 0;
  static  unsigned long long aesl_llvm_cbe_3508_count = 0;
  static  unsigned long long aesl_llvm_cbe_3509_count = 0;
  static  unsigned long long aesl_llvm_cbe_3510_count = 0;
  static  unsigned long long aesl_llvm_cbe_3511_count = 0;
  static  unsigned long long aesl_llvm_cbe_3512_count = 0;
  static  unsigned long long aesl_llvm_cbe_3513_count = 0;
  static  unsigned long long aesl_llvm_cbe_3514_count = 0;
  static  unsigned long long aesl_llvm_cbe_3515_count = 0;
  static  unsigned long long aesl_llvm_cbe_3516_count = 0;
  static  unsigned long long aesl_llvm_cbe_3517_count = 0;
  static  unsigned long long aesl_llvm_cbe_3518_count = 0;
  static  unsigned long long aesl_llvm_cbe_3519_count = 0;
  static  unsigned long long aesl_llvm_cbe_3520_count = 0;
  signed int *llvm_cbe_tmp__552;
  static  unsigned long long aesl_llvm_cbe_3521_count = 0;
  static  unsigned long long aesl_llvm_cbe_3522_count = 0;
  static  unsigned long long aesl_llvm_cbe_3523_count = 0;
  static  unsigned long long aesl_llvm_cbe_3524_count = 0;
  static  unsigned long long aesl_llvm_cbe_3525_count = 0;
  static  unsigned long long aesl_llvm_cbe_3526_count = 0;
  static  unsigned long long aesl_llvm_cbe_3527_count = 0;
  static  unsigned long long aesl_llvm_cbe_3528_count = 0;
  static  unsigned long long aesl_llvm_cbe_3529_count = 0;
  static  unsigned long long aesl_llvm_cbe_3530_count = 0;
  static  unsigned long long aesl_llvm_cbe_3531_count = 0;
  static  unsigned long long aesl_llvm_cbe_3532_count = 0;
  static  unsigned long long aesl_llvm_cbe_3533_count = 0;
  static  unsigned long long aesl_llvm_cbe_3534_count = 0;
  static  unsigned long long aesl_llvm_cbe_3535_count = 0;
  static  unsigned long long aesl_llvm_cbe_3536_count = 0;
  static  unsigned long long aesl_llvm_cbe_3537_count = 0;
  static  unsigned long long aesl_llvm_cbe_3538_count = 0;
  static  unsigned long long aesl_llvm_cbe_3539_count = 0;
  static  unsigned long long aesl_llvm_cbe_3540_count = 0;
  static  unsigned long long aesl_llvm_cbe_3541_count = 0;
  static  unsigned long long aesl_llvm_cbe_3542_count = 0;
  static  unsigned long long aesl_llvm_cbe_3543_count = 0;
  static  unsigned long long aesl_llvm_cbe_3544_count = 0;
  static  unsigned long long aesl_llvm_cbe_3545_count = 0;
  static  unsigned long long aesl_llvm_cbe_3546_count = 0;
  static  unsigned long long aesl_llvm_cbe_3547_count = 0;
  static  unsigned long long aesl_llvm_cbe_3548_count = 0;
  static  unsigned long long aesl_llvm_cbe_3549_count = 0;
  static  unsigned long long aesl_llvm_cbe_3550_count = 0;
  static  unsigned long long aesl_llvm_cbe_3551_count = 0;
  static  unsigned long long aesl_llvm_cbe_3552_count = 0;
  static  unsigned long long aesl_llvm_cbe_3553_count = 0;
  static  unsigned long long aesl_llvm_cbe_3554_count = 0;
  static  unsigned long long aesl_llvm_cbe_3555_count = 0;
  static  unsigned long long aesl_llvm_cbe_3556_count = 0;
  static  unsigned long long aesl_llvm_cbe_3557_count = 0;
  signed int *llvm_cbe_tmp__553;
  static  unsigned long long aesl_llvm_cbe_3558_count = 0;
  static  unsigned long long aesl_llvm_cbe_3559_count = 0;
  static  unsigned long long aesl_llvm_cbe_3560_count = 0;
  static  unsigned long long aesl_llvm_cbe_3561_count = 0;
  static  unsigned long long aesl_llvm_cbe_3562_count = 0;
  static  unsigned long long aesl_llvm_cbe_3563_count = 0;
  static  unsigned long long aesl_llvm_cbe_3564_count = 0;
  static  unsigned long long aesl_llvm_cbe_3565_count = 0;
  static  unsigned long long aesl_llvm_cbe_3566_count = 0;
  static  unsigned long long aesl_llvm_cbe_3567_count = 0;
  static  unsigned long long aesl_llvm_cbe_3568_count = 0;
  static  unsigned long long aesl_llvm_cbe_3569_count = 0;
  static  unsigned long long aesl_llvm_cbe_3570_count = 0;
  static  unsigned long long aesl_llvm_cbe_3571_count = 0;
  static  unsigned long long aesl_llvm_cbe_3572_count = 0;
  static  unsigned long long aesl_llvm_cbe_3573_count = 0;
  static  unsigned long long aesl_llvm_cbe_3574_count = 0;
  static  unsigned long long aesl_llvm_cbe_3575_count = 0;
  static  unsigned long long aesl_llvm_cbe_3576_count = 0;
  static  unsigned long long aesl_llvm_cbe_3577_count = 0;
  static  unsigned long long aesl_llvm_cbe_3578_count = 0;
  static  unsigned long long aesl_llvm_cbe_3579_count = 0;
  static  unsigned long long aesl_llvm_cbe_3580_count = 0;
  static  unsigned long long aesl_llvm_cbe_3581_count = 0;
  static  unsigned long long aesl_llvm_cbe_3582_count = 0;
  static  unsigned long long aesl_llvm_cbe_3583_count = 0;
  static  unsigned long long aesl_llvm_cbe_3584_count = 0;
  static  unsigned long long aesl_llvm_cbe_3585_count = 0;
  static  unsigned long long aesl_llvm_cbe_3586_count = 0;
  static  unsigned long long aesl_llvm_cbe_3587_count = 0;
  static  unsigned long long aesl_llvm_cbe_3588_count = 0;
  static  unsigned long long aesl_llvm_cbe_3589_count = 0;
  static  unsigned long long aesl_llvm_cbe_3590_count = 0;
  static  unsigned long long aesl_llvm_cbe_3591_count = 0;
  static  unsigned long long aesl_llvm_cbe_3592_count = 0;
  static  unsigned long long aesl_llvm_cbe_3593_count = 0;
  static  unsigned long long aesl_llvm_cbe_3594_count = 0;
  signed int *llvm_cbe_tmp__554;
  static  unsigned long long aesl_llvm_cbe_3595_count = 0;
  static  unsigned long long aesl_llvm_cbe_3596_count = 0;
  static  unsigned long long aesl_llvm_cbe_3597_count = 0;
  static  unsigned long long aesl_llvm_cbe_3598_count = 0;
  static  unsigned long long aesl_llvm_cbe_3599_count = 0;
  static  unsigned long long aesl_llvm_cbe_3600_count = 0;
  static  unsigned long long aesl_llvm_cbe_3601_count = 0;
  static  unsigned long long aesl_llvm_cbe_3602_count = 0;
  static  unsigned long long aesl_llvm_cbe_3603_count = 0;
  static  unsigned long long aesl_llvm_cbe_3604_count = 0;
  static  unsigned long long aesl_llvm_cbe_3605_count = 0;
  static  unsigned long long aesl_llvm_cbe_3606_count = 0;
  static  unsigned long long aesl_llvm_cbe_3607_count = 0;
  static  unsigned long long aesl_llvm_cbe_3608_count = 0;
  static  unsigned long long aesl_llvm_cbe_3609_count = 0;
  static  unsigned long long aesl_llvm_cbe_3610_count = 0;
  static  unsigned long long aesl_llvm_cbe_3611_count = 0;
  static  unsigned long long aesl_llvm_cbe_3612_count = 0;
  static  unsigned long long aesl_llvm_cbe_3613_count = 0;
  static  unsigned long long aesl_llvm_cbe_3614_count = 0;
  static  unsigned long long aesl_llvm_cbe_3615_count = 0;
  static  unsigned long long aesl_llvm_cbe_3616_count = 0;
  static  unsigned long long aesl_llvm_cbe_3617_count = 0;
  static  unsigned long long aesl_llvm_cbe_3618_count = 0;
  static  unsigned long long aesl_llvm_cbe_3619_count = 0;
  static  unsigned long long aesl_llvm_cbe_3620_count = 0;
  static  unsigned long long aesl_llvm_cbe_3621_count = 0;
  static  unsigned long long aesl_llvm_cbe_3622_count = 0;
  static  unsigned long long aesl_llvm_cbe_3623_count = 0;
  static  unsigned long long aesl_llvm_cbe_3624_count = 0;
  static  unsigned long long aesl_llvm_cbe_3625_count = 0;
  static  unsigned long long aesl_llvm_cbe_3626_count = 0;
  static  unsigned long long aesl_llvm_cbe_3627_count = 0;
  static  unsigned long long aesl_llvm_cbe_3628_count = 0;
  static  unsigned long long aesl_llvm_cbe_3629_count = 0;
  static  unsigned long long aesl_llvm_cbe_3630_count = 0;
  static  unsigned long long aesl_llvm_cbe_3631_count = 0;
  unsigned short llvm_cbe_tmp__555;
  static  unsigned long long aesl_llvm_cbe_3632_count = 0;
  unsigned int llvm_cbe_tmp__556;
  static  unsigned long long aesl_llvm_cbe_3633_count = 0;
  static  unsigned long long aesl_llvm_cbe_3634_count = 0;
  unsigned short llvm_cbe_tmp__557;
  static  unsigned long long aesl_llvm_cbe_3635_count = 0;
  unsigned int llvm_cbe_tmp__558;
  static  unsigned long long aesl_llvm_cbe_3636_count = 0;
  static  unsigned long long aesl_llvm_cbe_3637_count = 0;
  static  unsigned long long aesl_llvm_cbe_3638_count = 0;
  static  unsigned long long aesl_llvm_cbe_3639_count = 0;
  static  unsigned long long aesl_llvm_cbe_3640_count = 0;
  static  unsigned long long aesl_llvm_cbe_3641_count = 0;
  static  unsigned long long aesl_llvm_cbe_3642_count = 0;
  static  unsigned long long aesl_llvm_cbe_3643_count = 0;
  static  unsigned long long aesl_llvm_cbe_3644_count = 0;
  static  unsigned long long aesl_llvm_cbe_3645_count = 0;
  static  unsigned long long aesl_llvm_cbe_3646_count = 0;
  static  unsigned long long aesl_llvm_cbe_3647_count = 0;
  static  unsigned long long aesl_llvm_cbe_3648_count = 0;
  static  unsigned long long aesl_llvm_cbe_3649_count = 0;
  static  unsigned long long aesl_llvm_cbe_3650_count = 0;
  static  unsigned long long aesl_llvm_cbe_3651_count = 0;
  static  unsigned long long aesl_llvm_cbe_3652_count = 0;
  static  unsigned long long aesl_llvm_cbe_3653_count = 0;
  static  unsigned long long aesl_llvm_cbe_3654_count = 0;
  static  unsigned long long aesl_llvm_cbe_3655_count = 0;
  static  unsigned long long aesl_llvm_cbe_3656_count = 0;
  static  unsigned long long aesl_llvm_cbe_3657_count = 0;
  static  unsigned long long aesl_llvm_cbe_3658_count = 0;
  static  unsigned long long aesl_llvm_cbe_3659_count = 0;
  static  unsigned long long aesl_llvm_cbe_3660_count = 0;
  static  unsigned long long aesl_llvm_cbe_3661_count = 0;
  static  unsigned long long aesl_llvm_cbe_3662_count = 0;
  static  unsigned long long aesl_llvm_cbe_3663_count = 0;
  static  unsigned long long aesl_llvm_cbe_3664_count = 0;
  static  unsigned long long aesl_llvm_cbe_3665_count = 0;
  static  unsigned long long aesl_llvm_cbe_3666_count = 0;
  static  unsigned long long aesl_llvm_cbe_3667_count = 0;
  static  unsigned long long aesl_llvm_cbe_3668_count = 0;
  static  unsigned long long aesl_llvm_cbe_3669_count = 0;
  static  unsigned long long aesl_llvm_cbe_3670_count = 0;
  static  unsigned long long aesl_llvm_cbe_3671_count = 0;
  static  unsigned long long aesl_llvm_cbe_3672_count = 0;
  static  unsigned long long aesl_llvm_cbe_3673_count = 0;
  static  unsigned long long aesl_llvm_cbe_3674_count = 0;
  static  unsigned long long aesl_llvm_cbe_3675_count = 0;
  static  unsigned long long aesl_llvm_cbe_3676_count = 0;
  static  unsigned long long aesl_llvm_cbe_3677_count = 0;
  static  unsigned long long aesl_llvm_cbe_3678_count = 0;
  static  unsigned long long aesl_llvm_cbe_3679_count = 0;
  static  unsigned long long aesl_llvm_cbe_3680_count = 0;
  static  unsigned long long aesl_llvm_cbe_3681_count = 0;
  static  unsigned long long aesl_llvm_cbe_3682_count = 0;
  static  unsigned long long aesl_llvm_cbe_3683_count = 0;
  static  unsigned long long aesl_llvm_cbe_3684_count = 0;
  static  unsigned long long aesl_llvm_cbe_3685_count = 0;
  static  unsigned long long aesl_llvm_cbe_3686_count = 0;
  static  unsigned long long aesl_llvm_cbe_3687_count = 0;
  static  unsigned long long aesl_llvm_cbe_3688_count = 0;
  static  unsigned long long aesl_llvm_cbe_3689_count = 0;
  static  unsigned long long aesl_llvm_cbe_3690_count = 0;
  static  unsigned long long aesl_llvm_cbe_3691_count = 0;
  static  unsigned long long aesl_llvm_cbe_3692_count = 0;
  static  unsigned long long aesl_llvm_cbe_3693_count = 0;
  static  unsigned long long aesl_llvm_cbe_3694_count = 0;
  static  unsigned long long aesl_llvm_cbe_3695_count = 0;
  static  unsigned long long aesl_llvm_cbe_3696_count = 0;
  static  unsigned long long aesl_llvm_cbe_3697_count = 0;
  static  unsigned long long aesl_llvm_cbe_3698_count = 0;
  static  unsigned long long aesl_llvm_cbe_3699_count = 0;
  static  unsigned long long aesl_llvm_cbe_3700_count = 0;
  static  unsigned long long aesl_llvm_cbe_3701_count = 0;
  static  unsigned long long aesl_llvm_cbe_3702_count = 0;
  static  unsigned long long aesl_llvm_cbe_3703_count = 0;
  static  unsigned long long aesl_llvm_cbe_3704_count = 0;
  static  unsigned long long aesl_llvm_cbe_3705_count = 0;
  static  unsigned long long aesl_llvm_cbe_3706_count = 0;
  static  unsigned long long aesl_llvm_cbe_3707_count = 0;
  static  unsigned long long aesl_llvm_cbe_3708_count = 0;
  static  unsigned long long aesl_llvm_cbe_3709_count = 0;
  signed int *llvm_cbe_tmp__559;
  static  unsigned long long aesl_llvm_cbe_3710_count = 0;
  static  unsigned long long aesl_llvm_cbe_3711_count = 0;
  signed int *llvm_cbe_tmp__560;
  static  unsigned long long aesl_llvm_cbe_3712_count = 0;
  static  unsigned long long aesl_llvm_cbe_3713_count = 0;
  static  unsigned long long aesl_llvm_cbe_3714_count = 0;
  static  unsigned long long aesl_llvm_cbe_3715_count = 0;
  static  unsigned long long aesl_llvm_cbe_3716_count = 0;
  static  unsigned long long aesl_llvm_cbe_3717_count = 0;
  static  unsigned long long aesl_llvm_cbe_3718_count = 0;
  static  unsigned long long aesl_llvm_cbe_3719_count = 0;
  static  unsigned long long aesl_llvm_cbe_3720_count = 0;
  static  unsigned long long aesl_llvm_cbe_3721_count = 0;
  static  unsigned long long aesl_llvm_cbe_3722_count = 0;
  static  unsigned long long aesl_llvm_cbe_3723_count = 0;
  static  unsigned long long aesl_llvm_cbe_3724_count = 0;
  static  unsigned long long aesl_llvm_cbe_3725_count = 0;
  static  unsigned long long aesl_llvm_cbe_3726_count = 0;
  static  unsigned long long aesl_llvm_cbe_3727_count = 0;
  static  unsigned long long aesl_llvm_cbe_3728_count = 0;
  static  unsigned long long aesl_llvm_cbe_3729_count = 0;
  static  unsigned long long aesl_llvm_cbe_3730_count = 0;
  static  unsigned long long aesl_llvm_cbe_3731_count = 0;
  static  unsigned long long aesl_llvm_cbe_3732_count = 0;
  static  unsigned long long aesl_llvm_cbe_3733_count = 0;
  static  unsigned long long aesl_llvm_cbe_3734_count = 0;
  static  unsigned long long aesl_llvm_cbe_3735_count = 0;
  static  unsigned long long aesl_llvm_cbe_3736_count = 0;
  static  unsigned long long aesl_llvm_cbe_3737_count = 0;
  static  unsigned long long aesl_llvm_cbe_3738_count = 0;
  static  unsigned long long aesl_llvm_cbe_3739_count = 0;
  static  unsigned long long aesl_llvm_cbe_3740_count = 0;
  static  unsigned long long aesl_llvm_cbe_3741_count = 0;
  static  unsigned long long aesl_llvm_cbe_3742_count = 0;
  static  unsigned long long aesl_llvm_cbe_3743_count = 0;
  static  unsigned long long aesl_llvm_cbe_3744_count = 0;
  static  unsigned long long aesl_llvm_cbe_3745_count = 0;
  static  unsigned long long aesl_llvm_cbe_3746_count = 0;
  static  unsigned long long aesl_llvm_cbe_3747_count = 0;
  static  unsigned long long aesl_llvm_cbe_3748_count = 0;
  signed int *llvm_cbe_tmp__561;
  static  unsigned long long aesl_llvm_cbe_3749_count = 0;
  static  unsigned long long aesl_llvm_cbe_3750_count = 0;
  signed int *llvm_cbe_tmp__562;
  static  unsigned long long aesl_llvm_cbe_3751_count = 0;
  static  unsigned long long aesl_llvm_cbe_3752_count = 0;
  static  unsigned long long aesl_llvm_cbe_3753_count = 0;
  static  unsigned long long aesl_llvm_cbe_3754_count = 0;
  static  unsigned long long aesl_llvm_cbe_3755_count = 0;
  static  unsigned long long aesl_llvm_cbe_3756_count = 0;
  static  unsigned long long aesl_llvm_cbe_3757_count = 0;
  static  unsigned long long aesl_llvm_cbe_3758_count = 0;
  static  unsigned long long aesl_llvm_cbe_3759_count = 0;
  static  unsigned long long aesl_llvm_cbe_3760_count = 0;
  static  unsigned long long aesl_llvm_cbe_3761_count = 0;
  static  unsigned long long aesl_llvm_cbe_3762_count = 0;
  static  unsigned long long aesl_llvm_cbe_3763_count = 0;
  static  unsigned long long aesl_llvm_cbe_3764_count = 0;
  static  unsigned long long aesl_llvm_cbe_3765_count = 0;
  static  unsigned long long aesl_llvm_cbe_3766_count = 0;
  static  unsigned long long aesl_llvm_cbe_3767_count = 0;
  static  unsigned long long aesl_llvm_cbe_3768_count = 0;
  static  unsigned long long aesl_llvm_cbe_3769_count = 0;
  static  unsigned long long aesl_llvm_cbe_3770_count = 0;
  static  unsigned long long aesl_llvm_cbe_3771_count = 0;
  static  unsigned long long aesl_llvm_cbe_3772_count = 0;
  static  unsigned long long aesl_llvm_cbe_3773_count = 0;
  static  unsigned long long aesl_llvm_cbe_3774_count = 0;
  static  unsigned long long aesl_llvm_cbe_3775_count = 0;
  static  unsigned long long aesl_llvm_cbe_3776_count = 0;
  static  unsigned long long aesl_llvm_cbe_3777_count = 0;
  static  unsigned long long aesl_llvm_cbe_3778_count = 0;
  static  unsigned long long aesl_llvm_cbe_3779_count = 0;
  static  unsigned long long aesl_llvm_cbe_3780_count = 0;
  static  unsigned long long aesl_llvm_cbe_3781_count = 0;
  static  unsigned long long aesl_llvm_cbe_3782_count = 0;
  static  unsigned long long aesl_llvm_cbe_3783_count = 0;
  static  unsigned long long aesl_llvm_cbe_3784_count = 0;
  static  unsigned long long aesl_llvm_cbe_3785_count = 0;
  static  unsigned long long aesl_llvm_cbe_3786_count = 0;
  static  unsigned long long aesl_llvm_cbe_3787_count = 0;
  unsigned int llvm_cbe_tmp__563;
  static  unsigned long long aesl_llvm_cbe_3788_count = 0;
  static  unsigned long long aesl_llvm_cbe_3789_count = 0;
  static  unsigned long long aesl_llvm_cbe_3790_count = 0;
  unsigned int llvm_cbe_tmp__564;
  static  unsigned long long aesl_llvm_cbe_3791_count = 0;
  static  unsigned long long aesl_llvm_cbe_3792_count = 0;
  static  unsigned long long aesl_llvm_cbe_3793_count = 0;
  signed int *llvm_cbe_tmp__565;
  static  unsigned long long aesl_llvm_cbe_3794_count = 0;
  signed int *llvm_cbe_tmp__566;
  static  unsigned long long aesl_llvm_cbe_3795_count = 0;
  signed int *llvm_cbe_tmp__567;
  static  unsigned long long aesl_llvm_cbe_3796_count = 0;
   char *llvm_cbe_tmp__568;
  static  unsigned long long aesl_llvm_cbe_3797_count = 0;
  static  unsigned long long aesl_llvm_cbe_3798_count = 0;
  unsigned int llvm_cbe_tmp__569;
  static  unsigned long long aesl_llvm_cbe_3799_count = 0;
  static  unsigned long long aesl_llvm_cbe_3800_count = 0;
  static  unsigned long long aesl_llvm_cbe_3801_count = 0;
  signed int *llvm_cbe_tmp__570;
  static  unsigned long long aesl_llvm_cbe_3802_count = 0;
  signed int *llvm_cbe_tmp__571;
  static  unsigned long long aesl_llvm_cbe_3803_count = 0;
   char *llvm_cbe_tmp__572;
  static  unsigned long long aesl_llvm_cbe_3804_count = 0;
  static  unsigned long long aesl_llvm_cbe_3805_count = 0;
  unsigned int llvm_cbe_tmp__573;
  unsigned int llvm_cbe_tmp__573__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_3806_count = 0;
  static  unsigned long long aesl_llvm_cbe_3807_count = 0;
  static  unsigned long long aesl_llvm_cbe_3808_count = 0;
  static  unsigned long long aesl_llvm_cbe_3809_count = 0;
  static  unsigned long long aesl_llvm_cbe_3810_count = 0;
  static  unsigned long long aesl_llvm_cbe_3811_count = 0;
  static  unsigned long long aesl_llvm_cbe_3812_count = 0;
  static  unsigned long long aesl_llvm_cbe_3813_count = 0;
  static  unsigned long long aesl_llvm_cbe_3814_count = 0;
  static  unsigned long long aesl_llvm_cbe_3815_count = 0;
  static  unsigned long long aesl_llvm_cbe_3816_count = 0;
  static  unsigned long long aesl_llvm_cbe_3817_count = 0;
  static  unsigned long long aesl_llvm_cbe_3818_count = 0;
  static  unsigned long long aesl_llvm_cbe_3819_count = 0;
  static  unsigned long long aesl_llvm_cbe_3820_count = 0;
  static  unsigned long long aesl_llvm_cbe_3821_count = 0;
  static  unsigned long long aesl_llvm_cbe_3822_count = 0;
  static  unsigned long long aesl_llvm_cbe_3823_count = 0;
  static  unsigned long long aesl_llvm_cbe_3824_count = 0;
  static  unsigned long long aesl_llvm_cbe_3825_count = 0;
  static  unsigned long long aesl_llvm_cbe_3826_count = 0;
  static  unsigned long long aesl_llvm_cbe_3827_count = 0;
  static  unsigned long long aesl_llvm_cbe_3828_count = 0;
  static  unsigned long long aesl_llvm_cbe_3829_count = 0;
  static  unsigned long long aesl_llvm_cbe_3830_count = 0;
  static  unsigned long long aesl_llvm_cbe_3831_count = 0;
  static  unsigned long long aesl_llvm_cbe_3832_count = 0;
  static  unsigned long long aesl_llvm_cbe_3833_count = 0;
  static  unsigned long long aesl_llvm_cbe_3834_count = 0;
  static  unsigned long long aesl_llvm_cbe_3835_count = 0;
  static  unsigned long long aesl_llvm_cbe_3836_count = 0;
  static  unsigned long long aesl_llvm_cbe_3837_count = 0;
  static  unsigned long long aesl_llvm_cbe_3838_count = 0;
  static  unsigned long long aesl_llvm_cbe_3839_count = 0;
  static  unsigned long long aesl_llvm_cbe_3840_count = 0;
  static  unsigned long long aesl_llvm_cbe_3841_count = 0;
  static  unsigned long long aesl_llvm_cbe_3842_count = 0;
  static  unsigned long long aesl_llvm_cbe_3843_count = 0;
  static  unsigned long long aesl_llvm_cbe_3844_count = 0;
  static  unsigned long long aesl_llvm_cbe_3845_count = 0;
  static  unsigned long long aesl_llvm_cbe_3846_count = 0;
  static  unsigned long long aesl_llvm_cbe_3847_count = 0;
  static  unsigned long long aesl_llvm_cbe_3848_count = 0;
  static  unsigned long long aesl_llvm_cbe_3849_count = 0;
  static  unsigned long long aesl_llvm_cbe_3850_count = 0;
  static  unsigned long long aesl_llvm_cbe_3851_count = 0;
  static  unsigned long long aesl_llvm_cbe_3852_count = 0;
  static  unsigned long long aesl_llvm_cbe_3853_count = 0;
  static  unsigned long long aesl_llvm_cbe_3854_count = 0;
  static  unsigned long long aesl_llvm_cbe_3855_count = 0;
  static  unsigned long long aesl_llvm_cbe_3856_count = 0;
  static  unsigned long long aesl_llvm_cbe_3857_count = 0;
  static  unsigned long long aesl_llvm_cbe_3858_count = 0;
  static  unsigned long long aesl_llvm_cbe_3859_count = 0;
  static  unsigned long long aesl_llvm_cbe_3860_count = 0;
  static  unsigned long long aesl_llvm_cbe_3861_count = 0;
  static  unsigned long long aesl_llvm_cbe_3862_count = 0;
  static  unsigned long long aesl_llvm_cbe_3863_count = 0;
  static  unsigned long long aesl_llvm_cbe_3864_count = 0;
  static  unsigned long long aesl_llvm_cbe_3865_count = 0;
  static  unsigned long long aesl_llvm_cbe_3866_count = 0;
  static  unsigned long long aesl_llvm_cbe_3867_count = 0;
  static  unsigned long long aesl_llvm_cbe_3868_count = 0;
  static  unsigned long long aesl_llvm_cbe_3869_count = 0;
  static  unsigned long long aesl_llvm_cbe_3870_count = 0;
  static  unsigned long long aesl_llvm_cbe_3871_count = 0;
  static  unsigned long long aesl_llvm_cbe_3872_count = 0;
  static  unsigned long long aesl_llvm_cbe_3873_count = 0;
  static  unsigned long long aesl_llvm_cbe_3874_count = 0;
  static  unsigned long long aesl_llvm_cbe_3875_count = 0;
  static  unsigned long long aesl_llvm_cbe_3876_count = 0;
  static  unsigned long long aesl_llvm_cbe_3877_count = 0;
  static  unsigned long long aesl_llvm_cbe_3878_count = 0;
  static  unsigned long long aesl_llvm_cbe_3879_count = 0;
  static  unsigned long long aesl_llvm_cbe_3880_count = 0;
  static  unsigned long long aesl_llvm_cbe_3881_count = 0;
  static  unsigned long long aesl_llvm_cbe_3882_count = 0;
  static  unsigned long long aesl_llvm_cbe_3883_count = 0;
  static  unsigned long long aesl_llvm_cbe_3884_count = 0;
  static  unsigned long long aesl_llvm_cbe_3885_count = 0;
  static  unsigned long long aesl_llvm_cbe_3886_count = 0;
  static  unsigned long long aesl_llvm_cbe_3887_count = 0;
  static  unsigned long long aesl_llvm_cbe_3888_count = 0;
  static  unsigned long long aesl_llvm_cbe_3889_count = 0;
  static  unsigned long long aesl_llvm_cbe_3890_count = 0;
  static  unsigned long long aesl_llvm_cbe_3891_count = 0;
  static  unsigned long long aesl_llvm_cbe_3892_count = 0;
  static  unsigned long long aesl_llvm_cbe_3893_count = 0;
  static  unsigned long long aesl_llvm_cbe_3894_count = 0;
  static  unsigned long long aesl_llvm_cbe_3895_count = 0;
  static  unsigned long long aesl_llvm_cbe_3896_count = 0;
  static  unsigned long long aesl_llvm_cbe_3897_count = 0;
  static  unsigned long long aesl_llvm_cbe_3898_count = 0;
  static  unsigned long long aesl_llvm_cbe_3899_count = 0;
  static  unsigned long long aesl_llvm_cbe_3900_count = 0;
  static  unsigned long long aesl_llvm_cbe_3901_count = 0;
  static  unsigned long long aesl_llvm_cbe_3902_count = 0;
  static  unsigned long long aesl_llvm_cbe_3903_count = 0;
  static  unsigned long long aesl_llvm_cbe_3904_count = 0;
  static  unsigned long long aesl_llvm_cbe_3905_count = 0;
  static  unsigned long long aesl_llvm_cbe_3906_count = 0;
  static  unsigned long long aesl_llvm_cbe_3907_count = 0;
  static  unsigned long long aesl_llvm_cbe_3908_count = 0;
  static  unsigned long long aesl_llvm_cbe_3909_count = 0;
  static  unsigned long long aesl_llvm_cbe_3910_count = 0;
  static  unsigned long long aesl_llvm_cbe_3911_count = 0;
  static  unsigned long long aesl_llvm_cbe_3912_count = 0;
  static  unsigned long long aesl_llvm_cbe_3913_count = 0;
  static  unsigned long long aesl_llvm_cbe_3914_count = 0;
  static  unsigned long long aesl_llvm_cbe_3915_count = 0;
  static  unsigned long long aesl_llvm_cbe_3916_count = 0;
  static  unsigned long long aesl_llvm_cbe_3917_count = 0;
  static  unsigned long long aesl_llvm_cbe_3918_count = 0;
  static  unsigned long long aesl_llvm_cbe_3919_count = 0;
  static  unsigned long long aesl_llvm_cbe_3920_count = 0;
  static  unsigned long long aesl_llvm_cbe_3921_count = 0;
  static  unsigned long long aesl_llvm_cbe_3922_count = 0;
  static  unsigned long long aesl_llvm_cbe_3923_count = 0;
  static  unsigned long long aesl_llvm_cbe_3924_count = 0;
  static  unsigned long long aesl_llvm_cbe_3925_count = 0;
  static  unsigned long long aesl_llvm_cbe_3926_count = 0;
  static  unsigned long long aesl_llvm_cbe_3927_count = 0;
  static  unsigned long long aesl_llvm_cbe_3928_count = 0;
  static  unsigned long long aesl_llvm_cbe_3929_count = 0;
  static  unsigned long long aesl_llvm_cbe_3930_count = 0;
  static  unsigned long long aesl_llvm_cbe_3931_count = 0;
  static  unsigned long long aesl_llvm_cbe_3932_count = 0;
  static  unsigned long long aesl_llvm_cbe_3933_count = 0;
  static  unsigned long long aesl_llvm_cbe_3934_count = 0;
  static  unsigned long long aesl_llvm_cbe_3935_count = 0;
  static  unsigned long long aesl_llvm_cbe_3936_count = 0;
  static  unsigned long long aesl_llvm_cbe_3937_count = 0;
  static  unsigned long long aesl_llvm_cbe_3938_count = 0;
  static  unsigned long long aesl_llvm_cbe_3939_count = 0;
  static  unsigned long long aesl_llvm_cbe_3940_count = 0;
  static  unsigned long long aesl_llvm_cbe_3941_count = 0;
  static  unsigned long long aesl_llvm_cbe_3942_count = 0;
  static  unsigned long long aesl_llvm_cbe_3943_count = 0;
  static  unsigned long long aesl_llvm_cbe_3944_count = 0;
  static  unsigned long long aesl_llvm_cbe_3945_count = 0;
  static  unsigned long long aesl_llvm_cbe_3946_count = 0;
  static  unsigned long long aesl_llvm_cbe_3947_count = 0;
  static  unsigned long long aesl_llvm_cbe_3948_count = 0;
  static  unsigned long long aesl_llvm_cbe_3949_count = 0;
  static  unsigned long long aesl_llvm_cbe_3950_count = 0;
  static  unsigned long long aesl_llvm_cbe_3951_count = 0;
  static  unsigned long long aesl_llvm_cbe_3952_count = 0;
  static  unsigned long long aesl_llvm_cbe_3953_count = 0;
  static  unsigned long long aesl_llvm_cbe_3954_count = 0;
  static  unsigned long long aesl_llvm_cbe_3955_count = 0;
  static  unsigned long long aesl_llvm_cbe_3956_count = 0;
  static  unsigned long long aesl_llvm_cbe_3957_count = 0;
  static  unsigned long long aesl_llvm_cbe_3958_count = 0;
  static  unsigned long long aesl_llvm_cbe_3959_count = 0;
  static  unsigned long long aesl_llvm_cbe_3960_count = 0;
  static  unsigned long long aesl_llvm_cbe_3961_count = 0;
  static  unsigned long long aesl_llvm_cbe_3962_count = 0;
  static  unsigned long long aesl_llvm_cbe_3963_count = 0;
  static  unsigned long long aesl_llvm_cbe_3964_count = 0;
  static  unsigned long long aesl_llvm_cbe_3965_count = 0;
  static  unsigned long long aesl_llvm_cbe_3966_count = 0;
  static  unsigned long long aesl_llvm_cbe_3967_count = 0;
  static  unsigned long long aesl_llvm_cbe_3968_count = 0;
  static  unsigned long long aesl_llvm_cbe_3969_count = 0;
  static  unsigned long long aesl_llvm_cbe_3970_count = 0;
  static  unsigned long long aesl_llvm_cbe_3971_count = 0;
  static  unsigned long long aesl_llvm_cbe_3972_count = 0;
  static  unsigned long long aesl_llvm_cbe_3973_count = 0;
  static  unsigned long long aesl_llvm_cbe_3974_count = 0;
  static  unsigned long long aesl_llvm_cbe_3975_count = 0;
  static  unsigned long long aesl_llvm_cbe_3976_count = 0;
  static  unsigned long long aesl_llvm_cbe_3977_count = 0;
  static  unsigned long long aesl_llvm_cbe_3978_count = 0;
  static  unsigned long long aesl_llvm_cbe_3979_count = 0;
  static  unsigned long long aesl_llvm_cbe_3980_count = 0;
  static  unsigned long long aesl_llvm_cbe_3981_count = 0;
  static  unsigned long long aesl_llvm_cbe_3982_count = 0;
  static  unsigned long long aesl_llvm_cbe_3983_count = 0;
  static  unsigned long long aesl_llvm_cbe_3984_count = 0;
  static  unsigned long long aesl_llvm_cbe_3985_count = 0;
  static  unsigned long long aesl_llvm_cbe_3986_count = 0;
  static  unsigned long long aesl_llvm_cbe_3987_count = 0;
  static  unsigned long long aesl_llvm_cbe_3988_count = 0;
  static  unsigned long long aesl_llvm_cbe_3989_count = 0;
  static  unsigned long long aesl_llvm_cbe_3990_count = 0;
  static  unsigned long long aesl_llvm_cbe_3991_count = 0;
  static  unsigned long long aesl_llvm_cbe_3992_count = 0;
  static  unsigned long long aesl_llvm_cbe_3993_count = 0;
  static  unsigned long long aesl_llvm_cbe_3994_count = 0;
  static  unsigned long long aesl_llvm_cbe_3995_count = 0;
  static  unsigned long long aesl_llvm_cbe_3996_count = 0;
  static  unsigned long long aesl_llvm_cbe_3997_count = 0;
  static  unsigned long long aesl_llvm_cbe_3998_count = 0;
  static  unsigned long long aesl_llvm_cbe_3999_count = 0;
  static  unsigned long long aesl_llvm_cbe_4000_count = 0;
  static  unsigned long long aesl_llvm_cbe_4001_count = 0;
  static  unsigned long long aesl_llvm_cbe_4002_count = 0;
  static  unsigned long long aesl_llvm_cbe_4003_count = 0;
  static  unsigned long long aesl_llvm_cbe_4004_count = 0;
  static  unsigned long long aesl_llvm_cbe_4005_count = 0;
  static  unsigned long long aesl_llvm_cbe_4006_count = 0;
  static  unsigned long long aesl_llvm_cbe_4007_count = 0;
  static  unsigned long long aesl_llvm_cbe_4008_count = 0;
  static  unsigned long long aesl_llvm_cbe_4009_count = 0;
  static  unsigned long long aesl_llvm_cbe_4010_count = 0;
  static  unsigned long long aesl_llvm_cbe_4011_count = 0;
  static  unsigned long long aesl_llvm_cbe_4012_count = 0;
  static  unsigned long long aesl_llvm_cbe_4013_count = 0;
  static  unsigned long long aesl_llvm_cbe_4014_count = 0;
  static  unsigned long long aesl_llvm_cbe_4015_count = 0;
  static  unsigned long long aesl_llvm_cbe_4016_count = 0;
  static  unsigned long long aesl_llvm_cbe_4017_count = 0;
  static  unsigned long long aesl_llvm_cbe_4018_count = 0;
  static  unsigned long long aesl_llvm_cbe_4019_count = 0;
  static  unsigned long long aesl_llvm_cbe_4020_count = 0;
   char *llvm_cbe_tmp__574;
  static  unsigned long long aesl_llvm_cbe_4021_count = 0;
  static  unsigned long long aesl_llvm_cbe_4022_count = 0;
  static  unsigned long long aesl_llvm_cbe_4023_count = 0;
  static  unsigned long long aesl_llvm_cbe_4024_count = 0;
  static  unsigned long long aesl_llvm_cbe_4025_count = 0;
  static  unsigned long long aesl_llvm_cbe_4026_count = 0;
  static  unsigned long long aesl_llvm_cbe_4027_count = 0;
  static  unsigned long long aesl_llvm_cbe_4028_count = 0;
  static  unsigned long long aesl_llvm_cbe_4029_count = 0;
  static  unsigned long long aesl_llvm_cbe_4030_count = 0;
  static  unsigned long long aesl_llvm_cbe_4031_count = 0;
  static  unsigned long long aesl_llvm_cbe_4032_count = 0;
  static  unsigned long long aesl_llvm_cbe_4033_count = 0;
  static  unsigned long long aesl_llvm_cbe_4034_count = 0;
  static  unsigned long long aesl_llvm_cbe_4035_count = 0;
  static  unsigned long long aesl_llvm_cbe_4036_count = 0;
  static  unsigned long long aesl_llvm_cbe_4037_count = 0;
  static  unsigned long long aesl_llvm_cbe_4038_count = 0;
  static  unsigned long long aesl_llvm_cbe_4039_count = 0;
  static  unsigned long long aesl_llvm_cbe_4040_count = 0;
  static  unsigned long long aesl_llvm_cbe_4041_count = 0;
  static  unsigned long long aesl_llvm_cbe_4042_count = 0;
  static  unsigned long long aesl_llvm_cbe_4043_count = 0;
  static  unsigned long long aesl_llvm_cbe_4044_count = 0;
  static  unsigned long long aesl_llvm_cbe_4045_count = 0;
  static  unsigned long long aesl_llvm_cbe_4046_count = 0;
  static  unsigned long long aesl_llvm_cbe_4047_count = 0;
  static  unsigned long long aesl_llvm_cbe_4048_count = 0;
  static  unsigned long long aesl_llvm_cbe_4049_count = 0;
  static  unsigned long long aesl_llvm_cbe_4050_count = 0;
  static  unsigned long long aesl_llvm_cbe_4051_count = 0;
  static  unsigned long long aesl_llvm_cbe_4052_count = 0;
  static  unsigned long long aesl_llvm_cbe_4053_count = 0;
  static  unsigned long long aesl_llvm_cbe_4054_count = 0;
  static  unsigned long long aesl_llvm_cbe_4055_count = 0;
  static  unsigned long long aesl_llvm_cbe_4056_count = 0;
  static  unsigned long long aesl_llvm_cbe_4057_count = 0;
   char *llvm_cbe_tmp__575;
  static  unsigned long long aesl_llvm_cbe_4058_count = 0;
  static  unsigned long long aesl_llvm_cbe_4059_count = 0;
  static  unsigned long long aesl_llvm_cbe_4060_count = 0;
  static  unsigned long long aesl_llvm_cbe_4061_count = 0;
  static  unsigned long long aesl_llvm_cbe_4062_count = 0;
  static  unsigned long long aesl_llvm_cbe_4063_count = 0;
  static  unsigned long long aesl_llvm_cbe_4064_count = 0;
  static  unsigned long long aesl_llvm_cbe_4065_count = 0;
  static  unsigned long long aesl_llvm_cbe_4066_count = 0;
  static  unsigned long long aesl_llvm_cbe_4067_count = 0;
  static  unsigned long long aesl_llvm_cbe_4068_count = 0;
  static  unsigned long long aesl_llvm_cbe_4069_count = 0;
  static  unsigned long long aesl_llvm_cbe_4070_count = 0;
  static  unsigned long long aesl_llvm_cbe_4071_count = 0;
  static  unsigned long long aesl_llvm_cbe_4072_count = 0;
  static  unsigned long long aesl_llvm_cbe_4073_count = 0;
  static  unsigned long long aesl_llvm_cbe_4074_count = 0;
  static  unsigned long long aesl_llvm_cbe_4075_count = 0;
  static  unsigned long long aesl_llvm_cbe_4076_count = 0;
  static  unsigned long long aesl_llvm_cbe_4077_count = 0;
  static  unsigned long long aesl_llvm_cbe_4078_count = 0;
  static  unsigned long long aesl_llvm_cbe_4079_count = 0;
  static  unsigned long long aesl_llvm_cbe_4080_count = 0;
  static  unsigned long long aesl_llvm_cbe_4081_count = 0;
  static  unsigned long long aesl_llvm_cbe_4082_count = 0;
  static  unsigned long long aesl_llvm_cbe_4083_count = 0;
  static  unsigned long long aesl_llvm_cbe_4084_count = 0;
  static  unsigned long long aesl_llvm_cbe_4085_count = 0;
  static  unsigned long long aesl_llvm_cbe_4086_count = 0;
  static  unsigned long long aesl_llvm_cbe_4087_count = 0;
  static  unsigned long long aesl_llvm_cbe_4088_count = 0;
  static  unsigned long long aesl_llvm_cbe_4089_count = 0;
  static  unsigned long long aesl_llvm_cbe_4090_count = 0;
  static  unsigned long long aesl_llvm_cbe_4091_count = 0;
  static  unsigned long long aesl_llvm_cbe_4092_count = 0;
  static  unsigned long long aesl_llvm_cbe_4093_count = 0;
  static  unsigned long long aesl_llvm_cbe_4094_count = 0;
  unsigned int llvm_cbe_tmp__576;
  static  unsigned long long aesl_llvm_cbe_4095_count = 0;
  static  unsigned long long aesl_llvm_cbe_4096_count = 0;
  static  unsigned long long aesl_llvm_cbe_4097_count = 0;
  static  unsigned long long aesl_llvm_cbe_4098_count = 0;
  static  unsigned long long aesl_llvm_cbe_4099_count = 0;
  static  unsigned long long aesl_llvm_cbe_4100_count = 0;
  unsigned int llvm_cbe_tmp__577;
  static  unsigned long long aesl_llvm_cbe_4101_count = 0;
  static  unsigned long long aesl_llvm_cbe_4102_count = 0;
  static  unsigned long long aesl_llvm_cbe_4103_count = 0;
  unsigned int llvm_cbe_tmp__578;
  unsigned int llvm_cbe_tmp__578__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_4104_count = 0;
  static  unsigned long long aesl_llvm_cbe_4105_count = 0;
  static  unsigned long long aesl_llvm_cbe_4106_count = 0;
  static  unsigned long long aesl_llvm_cbe_4107_count = 0;
  static  unsigned long long aesl_llvm_cbe_4108_count = 0;
  static  unsigned long long aesl_llvm_cbe_4109_count = 0;
  static  unsigned long long aesl_llvm_cbe_4110_count = 0;
  static  unsigned long long aesl_llvm_cbe_4111_count = 0;
  static  unsigned long long aesl_llvm_cbe_4112_count = 0;
  static  unsigned long long aesl_llvm_cbe_4113_count = 0;
  static  unsigned long long aesl_llvm_cbe_4114_count = 0;
  static  unsigned long long aesl_llvm_cbe_4115_count = 0;
  static  unsigned long long aesl_llvm_cbe_4116_count = 0;
  static  unsigned long long aesl_llvm_cbe_4117_count = 0;
  static  unsigned long long aesl_llvm_cbe_4118_count = 0;
  static  unsigned long long aesl_llvm_cbe_4119_count = 0;
  static  unsigned long long aesl_llvm_cbe_4120_count = 0;
  static  unsigned long long aesl_llvm_cbe_4121_count = 0;
  static  unsigned long long aesl_llvm_cbe_4122_count = 0;
  static  unsigned long long aesl_llvm_cbe_4123_count = 0;
  static  unsigned long long aesl_llvm_cbe_4124_count = 0;
  static  unsigned long long aesl_llvm_cbe_4125_count = 0;
  static  unsigned long long aesl_llvm_cbe_4126_count = 0;
  static  unsigned long long aesl_llvm_cbe_4127_count = 0;
  static  unsigned long long aesl_llvm_cbe_4128_count = 0;
  static  unsigned long long aesl_llvm_cbe_4129_count = 0;
  static  unsigned long long aesl_llvm_cbe_4130_count = 0;
  static  unsigned long long aesl_llvm_cbe_4131_count = 0;
  static  unsigned long long aesl_llvm_cbe_4132_count = 0;
  static  unsigned long long aesl_llvm_cbe_4133_count = 0;
  static  unsigned long long aesl_llvm_cbe_4134_count = 0;
  static  unsigned long long aesl_llvm_cbe_4135_count = 0;
  static  unsigned long long aesl_llvm_cbe_4136_count = 0;
  static  unsigned long long aesl_llvm_cbe_4137_count = 0;
  static  unsigned long long aesl_llvm_cbe_4138_count = 0;
  signed int *llvm_cbe_tmp__579;
  static  unsigned long long aesl_llvm_cbe_4139_count = 0;
  static  unsigned long long aesl_llvm_cbe_4140_count = 0;
  static  unsigned long long aesl_llvm_cbe_4141_count = 0;
  static  unsigned long long aesl_llvm_cbe_4142_count = 0;
  static  unsigned long long aesl_llvm_cbe_4143_count = 0;
  static  unsigned long long aesl_llvm_cbe_4144_count = 0;
  static  unsigned long long aesl_llvm_cbe_4145_count = 0;
  static  unsigned long long aesl_llvm_cbe_4146_count = 0;
  static  unsigned long long aesl_llvm_cbe_4147_count = 0;
  static  unsigned long long aesl_llvm_cbe_4148_count = 0;
  static  unsigned long long aesl_llvm_cbe_4149_count = 0;
  static  unsigned long long aesl_llvm_cbe_4150_count = 0;
  static  unsigned long long aesl_llvm_cbe_4151_count = 0;
  static  unsigned long long aesl_llvm_cbe_4152_count = 0;
  static  unsigned long long aesl_llvm_cbe_4153_count = 0;
  static  unsigned long long aesl_llvm_cbe_4154_count = 0;
  static  unsigned long long aesl_llvm_cbe_4155_count = 0;
  static  unsigned long long aesl_llvm_cbe_4156_count = 0;
  static  unsigned long long aesl_llvm_cbe_4157_count = 0;
  static  unsigned long long aesl_llvm_cbe_4158_count = 0;
  static  unsigned long long aesl_llvm_cbe_4159_count = 0;
  static  unsigned long long aesl_llvm_cbe_4160_count = 0;
  static  unsigned long long aesl_llvm_cbe_4161_count = 0;
  static  unsigned long long aesl_llvm_cbe_4162_count = 0;
  static  unsigned long long aesl_llvm_cbe_4163_count = 0;
  static  unsigned long long aesl_llvm_cbe_4164_count = 0;
  static  unsigned long long aesl_llvm_cbe_4165_count = 0;
  static  unsigned long long aesl_llvm_cbe_4166_count = 0;
  static  unsigned long long aesl_llvm_cbe_4167_count = 0;
  static  unsigned long long aesl_llvm_cbe_4168_count = 0;
  static  unsigned long long aesl_llvm_cbe_4169_count = 0;
  static  unsigned long long aesl_llvm_cbe_4170_count = 0;
  static  unsigned long long aesl_llvm_cbe_4171_count = 0;
  static  unsigned long long aesl_llvm_cbe_4172_count = 0;
  static  unsigned long long aesl_llvm_cbe_4173_count = 0;
  static  unsigned long long aesl_llvm_cbe_4174_count = 0;
  static  unsigned long long aesl_llvm_cbe_4175_count = 0;
  signed int *llvm_cbe_tmp__580;
  static  unsigned long long aesl_llvm_cbe_4176_count = 0;
  static  unsigned long long aesl_llvm_cbe_4177_count = 0;
  static  unsigned long long aesl_llvm_cbe_4178_count = 0;
  static  unsigned long long aesl_llvm_cbe_4179_count = 0;
  static  unsigned long long aesl_llvm_cbe_4180_count = 0;
  static  unsigned long long aesl_llvm_cbe_4181_count = 0;
  static  unsigned long long aesl_llvm_cbe_4182_count = 0;
  static  unsigned long long aesl_llvm_cbe_4183_count = 0;
  static  unsigned long long aesl_llvm_cbe_4184_count = 0;
  static  unsigned long long aesl_llvm_cbe_4185_count = 0;
  static  unsigned long long aesl_llvm_cbe_4186_count = 0;
  static  unsigned long long aesl_llvm_cbe_4187_count = 0;
  static  unsigned long long aesl_llvm_cbe_4188_count = 0;
  static  unsigned long long aesl_llvm_cbe_4189_count = 0;
  static  unsigned long long aesl_llvm_cbe_4190_count = 0;
  static  unsigned long long aesl_llvm_cbe_4191_count = 0;
  static  unsigned long long aesl_llvm_cbe_4192_count = 0;
  static  unsigned long long aesl_llvm_cbe_4193_count = 0;
  static  unsigned long long aesl_llvm_cbe_4194_count = 0;
  static  unsigned long long aesl_llvm_cbe_4195_count = 0;
  static  unsigned long long aesl_llvm_cbe_4196_count = 0;
  static  unsigned long long aesl_llvm_cbe_4197_count = 0;
  static  unsigned long long aesl_llvm_cbe_4198_count = 0;
  static  unsigned long long aesl_llvm_cbe_4199_count = 0;
  static  unsigned long long aesl_llvm_cbe_4200_count = 0;
  static  unsigned long long aesl_llvm_cbe_4201_count = 0;
  static  unsigned long long aesl_llvm_cbe_4202_count = 0;
  static  unsigned long long aesl_llvm_cbe_4203_count = 0;
  static  unsigned long long aesl_llvm_cbe_4204_count = 0;
  static  unsigned long long aesl_llvm_cbe_4205_count = 0;
  static  unsigned long long aesl_llvm_cbe_4206_count = 0;
  static  unsigned long long aesl_llvm_cbe_4207_count = 0;
  static  unsigned long long aesl_llvm_cbe_4208_count = 0;
  static  unsigned long long aesl_llvm_cbe_4209_count = 0;
  static  unsigned long long aesl_llvm_cbe_4210_count = 0;
  static  unsigned long long aesl_llvm_cbe_4211_count = 0;
  static  unsigned long long aesl_llvm_cbe_4212_count = 0;
  signed int *llvm_cbe_tmp__581;
  static  unsigned long long aesl_llvm_cbe_4213_count = 0;
  static  unsigned long long aesl_llvm_cbe_4214_count = 0;
  static  unsigned long long aesl_llvm_cbe_4215_count = 0;
  static  unsigned long long aesl_llvm_cbe_4216_count = 0;
  static  unsigned long long aesl_llvm_cbe_4217_count = 0;
  static  unsigned long long aesl_llvm_cbe_4218_count = 0;
  static  unsigned long long aesl_llvm_cbe_4219_count = 0;
  static  unsigned long long aesl_llvm_cbe_4220_count = 0;
  static  unsigned long long aesl_llvm_cbe_4221_count = 0;
  static  unsigned long long aesl_llvm_cbe_4222_count = 0;
  static  unsigned long long aesl_llvm_cbe_4223_count = 0;
  static  unsigned long long aesl_llvm_cbe_4224_count = 0;
  static  unsigned long long aesl_llvm_cbe_4225_count = 0;
  static  unsigned long long aesl_llvm_cbe_4226_count = 0;
  static  unsigned long long aesl_llvm_cbe_4227_count = 0;
  static  unsigned long long aesl_llvm_cbe_4228_count = 0;
  static  unsigned long long aesl_llvm_cbe_4229_count = 0;
  static  unsigned long long aesl_llvm_cbe_4230_count = 0;
  static  unsigned long long aesl_llvm_cbe_4231_count = 0;
  static  unsigned long long aesl_llvm_cbe_4232_count = 0;
  static  unsigned long long aesl_llvm_cbe_4233_count = 0;
  static  unsigned long long aesl_llvm_cbe_4234_count = 0;
  static  unsigned long long aesl_llvm_cbe_4235_count = 0;
  static  unsigned long long aesl_llvm_cbe_4236_count = 0;
  static  unsigned long long aesl_llvm_cbe_4237_count = 0;
  static  unsigned long long aesl_llvm_cbe_4238_count = 0;
  static  unsigned long long aesl_llvm_cbe_4239_count = 0;
  static  unsigned long long aesl_llvm_cbe_4240_count = 0;
  static  unsigned long long aesl_llvm_cbe_4241_count = 0;
  static  unsigned long long aesl_llvm_cbe_4242_count = 0;
  static  unsigned long long aesl_llvm_cbe_4243_count = 0;
  static  unsigned long long aesl_llvm_cbe_4244_count = 0;
  static  unsigned long long aesl_llvm_cbe_4245_count = 0;
  static  unsigned long long aesl_llvm_cbe_4246_count = 0;
  static  unsigned long long aesl_llvm_cbe_4247_count = 0;
  static  unsigned long long aesl_llvm_cbe_4248_count = 0;
  static  unsigned long long aesl_llvm_cbe_4249_count = 0;
  signed int *llvm_cbe_tmp__582;
  static  unsigned long long aesl_llvm_cbe_4250_count = 0;
  static  unsigned long long aesl_llvm_cbe_4251_count = 0;
  static  unsigned long long aesl_llvm_cbe_4252_count = 0;
  static  unsigned long long aesl_llvm_cbe_4253_count = 0;
  static  unsigned long long aesl_llvm_cbe_4254_count = 0;
  static  unsigned long long aesl_llvm_cbe_4255_count = 0;
  static  unsigned long long aesl_llvm_cbe_4256_count = 0;
  static  unsigned long long aesl_llvm_cbe_4257_count = 0;
  static  unsigned long long aesl_llvm_cbe_4258_count = 0;
  static  unsigned long long aesl_llvm_cbe_4259_count = 0;
  static  unsigned long long aesl_llvm_cbe_4260_count = 0;
  static  unsigned long long aesl_llvm_cbe_4261_count = 0;
  static  unsigned long long aesl_llvm_cbe_4262_count = 0;
  static  unsigned long long aesl_llvm_cbe_4263_count = 0;
  static  unsigned long long aesl_llvm_cbe_4264_count = 0;
  static  unsigned long long aesl_llvm_cbe_4265_count = 0;
  static  unsigned long long aesl_llvm_cbe_4266_count = 0;
  static  unsigned long long aesl_llvm_cbe_4267_count = 0;
  static  unsigned long long aesl_llvm_cbe_4268_count = 0;
  static  unsigned long long aesl_llvm_cbe_4269_count = 0;
  static  unsigned long long aesl_llvm_cbe_4270_count = 0;
  static  unsigned long long aesl_llvm_cbe_4271_count = 0;
  static  unsigned long long aesl_llvm_cbe_4272_count = 0;
  static  unsigned long long aesl_llvm_cbe_4273_count = 0;
  static  unsigned long long aesl_llvm_cbe_4274_count = 0;
  static  unsigned long long aesl_llvm_cbe_4275_count = 0;
  static  unsigned long long aesl_llvm_cbe_4276_count = 0;
  static  unsigned long long aesl_llvm_cbe_4277_count = 0;
  static  unsigned long long aesl_llvm_cbe_4278_count = 0;
  static  unsigned long long aesl_llvm_cbe_4279_count = 0;
  static  unsigned long long aesl_llvm_cbe_4280_count = 0;
  static  unsigned long long aesl_llvm_cbe_4281_count = 0;
  static  unsigned long long aesl_llvm_cbe_4282_count = 0;
  static  unsigned long long aesl_llvm_cbe_4283_count = 0;
  static  unsigned long long aesl_llvm_cbe_4284_count = 0;
  static  unsigned long long aesl_llvm_cbe_4285_count = 0;
  static  unsigned long long aesl_llvm_cbe_4286_count = 0;
  static  unsigned long long aesl_llvm_cbe_4287_count = 0;
  static  unsigned long long aesl_llvm_cbe_4288_count = 0;
  static  unsigned long long aesl_llvm_cbe_4289_count = 0;
  static  unsigned long long aesl_llvm_cbe_4290_count = 0;
  static  unsigned long long aesl_llvm_cbe_4291_count = 0;
  static  unsigned long long aesl_llvm_cbe_4292_count = 0;
  static  unsigned long long aesl_llvm_cbe_4293_count = 0;
  static  unsigned long long aesl_llvm_cbe_4294_count = 0;
  static  unsigned long long aesl_llvm_cbe_4295_count = 0;
  static  unsigned long long aesl_llvm_cbe_4296_count = 0;
  static  unsigned long long aesl_llvm_cbe_4297_count = 0;
  static  unsigned long long aesl_llvm_cbe_4298_count = 0;
  static  unsigned long long aesl_llvm_cbe_4299_count = 0;
  static  unsigned long long aesl_llvm_cbe_4300_count = 0;
  static  unsigned long long aesl_llvm_cbe_4301_count = 0;
  static  unsigned long long aesl_llvm_cbe_4302_count = 0;
  static  unsigned long long aesl_llvm_cbe_4303_count = 0;
  static  unsigned long long aesl_llvm_cbe_4304_count = 0;
  static  unsigned long long aesl_llvm_cbe_4305_count = 0;
  static  unsigned long long aesl_llvm_cbe_4306_count = 0;
  static  unsigned long long aesl_llvm_cbe_4307_count = 0;
  static  unsigned long long aesl_llvm_cbe_4308_count = 0;
  static  unsigned long long aesl_llvm_cbe_4309_count = 0;
  static  unsigned long long aesl_llvm_cbe_4310_count = 0;
  static  unsigned long long aesl_llvm_cbe_4311_count = 0;
  static  unsigned long long aesl_llvm_cbe_4312_count = 0;
  static  unsigned long long aesl_llvm_cbe_4313_count = 0;
  static  unsigned long long aesl_llvm_cbe_4314_count = 0;
  static  unsigned long long aesl_llvm_cbe_4315_count = 0;
  static  unsigned long long aesl_llvm_cbe_4316_count = 0;
  static  unsigned long long aesl_llvm_cbe_4317_count = 0;
  static  unsigned long long aesl_llvm_cbe_4318_count = 0;
  static  unsigned long long aesl_llvm_cbe_4319_count = 0;
  static  unsigned long long aesl_llvm_cbe_4320_count = 0;
  static  unsigned long long aesl_llvm_cbe_4321_count = 0;
  static  unsigned long long aesl_llvm_cbe_4322_count = 0;
  static  unsigned long long aesl_llvm_cbe_4323_count = 0;
  static  unsigned long long aesl_llvm_cbe_4324_count = 0;
  static  unsigned long long aesl_llvm_cbe_4325_count = 0;
  static  unsigned long long aesl_llvm_cbe_4326_count = 0;
  static  unsigned long long aesl_llvm_cbe_4327_count = 0;
  static  unsigned long long aesl_llvm_cbe_4328_count = 0;
  static  unsigned long long aesl_llvm_cbe_4329_count = 0;
  static  unsigned long long aesl_llvm_cbe_4330_count = 0;
  static  unsigned long long aesl_llvm_cbe_4331_count = 0;
  static  unsigned long long aesl_llvm_cbe_4332_count = 0;
  static  unsigned long long aesl_llvm_cbe_4333_count = 0;
  static  unsigned long long aesl_llvm_cbe_4334_count = 0;
  static  unsigned long long aesl_llvm_cbe_4335_count = 0;
  static  unsigned long long aesl_llvm_cbe_4336_count = 0;
  static  unsigned long long aesl_llvm_cbe_4337_count = 0;
  static  unsigned long long aesl_llvm_cbe_4338_count = 0;
  static  unsigned long long aesl_llvm_cbe_4339_count = 0;
  static  unsigned long long aesl_llvm_cbe_4340_count = 0;
  static  unsigned long long aesl_llvm_cbe_4341_count = 0;
  static  unsigned long long aesl_llvm_cbe_4342_count = 0;
  static  unsigned long long aesl_llvm_cbe_4343_count = 0;
  static  unsigned long long aesl_llvm_cbe_4344_count = 0;
  static  unsigned long long aesl_llvm_cbe_4345_count = 0;
  static  unsigned long long aesl_llvm_cbe_4346_count = 0;
  static  unsigned long long aesl_llvm_cbe_4347_count = 0;
  static  unsigned long long aesl_llvm_cbe_4348_count = 0;
  static  unsigned long long aesl_llvm_cbe_4349_count = 0;
  static  unsigned long long aesl_llvm_cbe_4350_count = 0;
  static  unsigned long long aesl_llvm_cbe_4351_count = 0;
  static  unsigned long long aesl_llvm_cbe_4352_count = 0;
  static  unsigned long long aesl_llvm_cbe_4353_count = 0;
  static  unsigned long long aesl_llvm_cbe_4354_count = 0;
  static  unsigned long long aesl_llvm_cbe_4355_count = 0;
  static  unsigned long long aesl_llvm_cbe_4356_count = 0;
  static  unsigned long long aesl_llvm_cbe_4357_count = 0;
  static  unsigned long long aesl_llvm_cbe_4358_count = 0;
  static  unsigned long long aesl_llvm_cbe_4359_count = 0;
  static  unsigned long long aesl_llvm_cbe_4360_count = 0;
  static  unsigned long long aesl_llvm_cbe_4361_count = 0;
  static  unsigned long long aesl_llvm_cbe_4362_count = 0;
  static  unsigned long long aesl_llvm_cbe_4363_count = 0;
  static  unsigned long long aesl_llvm_cbe_4364_count = 0;
  static  unsigned long long aesl_llvm_cbe_4365_count = 0;
  static  unsigned long long aesl_llvm_cbe_4366_count = 0;
  static  unsigned long long aesl_llvm_cbe_4367_count = 0;
  static  unsigned long long aesl_llvm_cbe_4368_count = 0;
  static  unsigned long long aesl_llvm_cbe_4369_count = 0;
  static  unsigned long long aesl_llvm_cbe_4370_count = 0;
  static  unsigned long long aesl_llvm_cbe_4371_count = 0;
  static  unsigned long long aesl_llvm_cbe_4372_count = 0;
  static  unsigned long long aesl_llvm_cbe_4373_count = 0;
  static  unsigned long long aesl_llvm_cbe_4374_count = 0;
  static  unsigned long long aesl_llvm_cbe_4375_count = 0;
  static  unsigned long long aesl_llvm_cbe_4376_count = 0;
  static  unsigned long long aesl_llvm_cbe_4377_count = 0;
  static  unsigned long long aesl_llvm_cbe_4378_count = 0;
  static  unsigned long long aesl_llvm_cbe_4379_count = 0;
  static  unsigned long long aesl_llvm_cbe_4380_count = 0;
  static  unsigned long long aesl_llvm_cbe_4381_count = 0;
  static  unsigned long long aesl_llvm_cbe_4382_count = 0;
  static  unsigned long long aesl_llvm_cbe_4383_count = 0;
  static  unsigned long long aesl_llvm_cbe_4384_count = 0;
  static  unsigned long long aesl_llvm_cbe_4385_count = 0;
  static  unsigned long long aesl_llvm_cbe_4386_count = 0;
  static  unsigned long long aesl_llvm_cbe_4387_count = 0;
  static  unsigned long long aesl_llvm_cbe_4388_count = 0;
  static  unsigned long long aesl_llvm_cbe_4389_count = 0;
  static  unsigned long long aesl_llvm_cbe_4390_count = 0;
  static  unsigned long long aesl_llvm_cbe_4391_count = 0;
  static  unsigned long long aesl_llvm_cbe_4392_count = 0;
  static  unsigned long long aesl_llvm_cbe_4393_count = 0;
  static  unsigned long long aesl_llvm_cbe_4394_count = 0;
  static  unsigned long long aesl_llvm_cbe_4395_count = 0;
  static  unsigned long long aesl_llvm_cbe_4396_count = 0;
  static  unsigned long long aesl_llvm_cbe_4397_count = 0;
  static  unsigned long long aesl_llvm_cbe_4398_count = 0;
  static  unsigned long long aesl_llvm_cbe_4399_count = 0;
  static  unsigned long long aesl_llvm_cbe_4400_count = 0;
  static  unsigned long long aesl_llvm_cbe_4401_count = 0;
  static  unsigned long long aesl_llvm_cbe_4402_count = 0;
  static  unsigned long long aesl_llvm_cbe_4403_count = 0;
  static  unsigned long long aesl_llvm_cbe_4404_count = 0;
  static  unsigned long long aesl_llvm_cbe_4405_count = 0;
  static  unsigned long long aesl_llvm_cbe_4406_count = 0;
  static  unsigned long long aesl_llvm_cbe_4407_count = 0;
  static  unsigned long long aesl_llvm_cbe_4408_count = 0;
  static  unsigned long long aesl_llvm_cbe_4409_count = 0;
  static  unsigned long long aesl_llvm_cbe_4410_count = 0;
  static  unsigned long long aesl_llvm_cbe_4411_count = 0;
  static  unsigned long long aesl_llvm_cbe_4412_count = 0;
  static  unsigned long long aesl_llvm_cbe_4413_count = 0;
  static  unsigned long long aesl_llvm_cbe_4414_count = 0;
  static  unsigned long long aesl_llvm_cbe_4415_count = 0;
  static  unsigned long long aesl_llvm_cbe_4416_count = 0;
  static  unsigned long long aesl_llvm_cbe_4417_count = 0;
  static  unsigned long long aesl_llvm_cbe_4418_count = 0;
  static  unsigned long long aesl_llvm_cbe_4419_count = 0;
  static  unsigned long long aesl_llvm_cbe_4420_count = 0;
  static  unsigned long long aesl_llvm_cbe_4421_count = 0;
  static  unsigned long long aesl_llvm_cbe_4422_count = 0;
  static  unsigned long long aesl_llvm_cbe_4423_count = 0;
  static  unsigned long long aesl_llvm_cbe_4424_count = 0;
  static  unsigned long long aesl_llvm_cbe_4425_count = 0;
  static  unsigned long long aesl_llvm_cbe_4426_count = 0;
  static  unsigned long long aesl_llvm_cbe_4427_count = 0;
  static  unsigned long long aesl_llvm_cbe_4428_count = 0;
  static  unsigned long long aesl_llvm_cbe_4429_count = 0;
  static  unsigned long long aesl_llvm_cbe_4430_count = 0;
  static  unsigned long long aesl_llvm_cbe_4431_count = 0;
  static  unsigned long long aesl_llvm_cbe_4432_count = 0;
  static  unsigned long long aesl_llvm_cbe_4433_count = 0;
  static  unsigned long long aesl_llvm_cbe_4434_count = 0;
  static  unsigned long long aesl_llvm_cbe_4435_count = 0;
  static  unsigned long long aesl_llvm_cbe_4436_count = 0;
  static  unsigned long long aesl_llvm_cbe_4437_count = 0;
  static  unsigned long long aesl_llvm_cbe_4438_count = 0;
  static  unsigned long long aesl_llvm_cbe_4439_count = 0;
  static  unsigned long long aesl_llvm_cbe_4440_count = 0;
  static  unsigned long long aesl_llvm_cbe_4441_count = 0;
  static  unsigned long long aesl_llvm_cbe_4442_count = 0;
  static  unsigned long long aesl_llvm_cbe_4443_count = 0;
  static  unsigned long long aesl_llvm_cbe_4444_count = 0;
  static  unsigned long long aesl_llvm_cbe_4445_count = 0;
  static  unsigned long long aesl_llvm_cbe_4446_count = 0;
  static  unsigned long long aesl_llvm_cbe_4447_count = 0;
  static  unsigned long long aesl_llvm_cbe_4448_count = 0;
  static  unsigned long long aesl_llvm_cbe_4449_count = 0;
  static  unsigned long long aesl_llvm_cbe_4450_count = 0;
  static  unsigned long long aesl_llvm_cbe_4451_count = 0;
  static  unsigned long long aesl_llvm_cbe_4452_count = 0;
  static  unsigned long long aesl_llvm_cbe_4453_count = 0;
  static  unsigned long long aesl_llvm_cbe_4454_count = 0;
  static  unsigned long long aesl_llvm_cbe_4455_count = 0;
  static  unsigned long long aesl_llvm_cbe_4456_count = 0;
  static  unsigned long long aesl_llvm_cbe_4457_count = 0;
  static  unsigned long long aesl_llvm_cbe_4458_count = 0;
  static  unsigned long long aesl_llvm_cbe_4459_count = 0;
  static  unsigned long long aesl_llvm_cbe_4460_count = 0;
  static  unsigned long long aesl_llvm_cbe_4461_count = 0;
  static  unsigned long long aesl_llvm_cbe_4462_count = 0;
  static  unsigned long long aesl_llvm_cbe_4463_count = 0;
  static  unsigned long long aesl_llvm_cbe_4464_count = 0;
  static  unsigned long long aesl_llvm_cbe_4465_count = 0;
  static  unsigned long long aesl_llvm_cbe_4466_count = 0;
  static  unsigned long long aesl_llvm_cbe_4467_count = 0;
  static  unsigned long long aesl_llvm_cbe_4468_count = 0;
  static  unsigned long long aesl_llvm_cbe_4469_count = 0;
  static  unsigned long long aesl_llvm_cbe_4470_count = 0;
  static  unsigned long long aesl_llvm_cbe_4471_count = 0;
  static  unsigned long long aesl_llvm_cbe_4472_count = 0;
  static  unsigned long long aesl_llvm_cbe_4473_count = 0;
  static  unsigned long long aesl_llvm_cbe_4474_count = 0;
  static  unsigned long long aesl_llvm_cbe_4475_count = 0;
  static  unsigned long long aesl_llvm_cbe_4476_count = 0;
  static  unsigned long long aesl_llvm_cbe_4477_count = 0;
  static  unsigned long long aesl_llvm_cbe_4478_count = 0;
  static  unsigned long long aesl_llvm_cbe_4479_count = 0;
  static  unsigned long long aesl_llvm_cbe_4480_count = 0;
  static  unsigned long long aesl_llvm_cbe_4481_count = 0;
  static  unsigned long long aesl_llvm_cbe_4482_count = 0;
  static  unsigned long long aesl_llvm_cbe_4483_count = 0;
  static  unsigned long long aesl_llvm_cbe_4484_count = 0;
  static  unsigned long long aesl_llvm_cbe_4485_count = 0;
  static  unsigned long long aesl_llvm_cbe_4486_count = 0;
  static  unsigned long long aesl_llvm_cbe_4487_count = 0;
  static  unsigned long long aesl_llvm_cbe_4488_count = 0;
  static  unsigned long long aesl_llvm_cbe_4489_count = 0;
  static  unsigned long long aesl_llvm_cbe_4490_count = 0;
  static  unsigned long long aesl_llvm_cbe_4491_count = 0;
  static  unsigned long long aesl_llvm_cbe_4492_count = 0;
  static  unsigned long long aesl_llvm_cbe_4493_count = 0;
  static  unsigned long long aesl_llvm_cbe_4494_count = 0;
  static  unsigned long long aesl_llvm_cbe_4495_count = 0;
  static  unsigned long long aesl_llvm_cbe_4496_count = 0;
  static  unsigned long long aesl_llvm_cbe_4497_count = 0;
  static  unsigned long long aesl_llvm_cbe_4498_count = 0;
  static  unsigned long long aesl_llvm_cbe_4499_count = 0;
  static  unsigned long long aesl_llvm_cbe_4500_count = 0;
  static  unsigned long long aesl_llvm_cbe_4501_count = 0;
  static  unsigned long long aesl_llvm_cbe_4502_count = 0;
  static  unsigned long long aesl_llvm_cbe_4503_count = 0;
  static  unsigned long long aesl_llvm_cbe_4504_count = 0;
  static  unsigned long long aesl_llvm_cbe_4505_count = 0;
  static  unsigned long long aesl_llvm_cbe_4506_count = 0;
  static  unsigned long long aesl_llvm_cbe_4507_count = 0;
  static  unsigned long long aesl_llvm_cbe_4508_count = 0;
  static  unsigned long long aesl_llvm_cbe_4509_count = 0;
  static  unsigned long long aesl_llvm_cbe_4510_count = 0;
  static  unsigned long long aesl_llvm_cbe_4511_count = 0;
  static  unsigned long long aesl_llvm_cbe_4512_count = 0;
  static  unsigned long long aesl_llvm_cbe_4513_count = 0;
  static  unsigned long long aesl_llvm_cbe_4514_count = 0;
  static  unsigned long long aesl_llvm_cbe_4515_count = 0;
  static  unsigned long long aesl_llvm_cbe_4516_count = 0;
  static  unsigned long long aesl_llvm_cbe_4517_count = 0;
  static  unsigned long long aesl_llvm_cbe_4518_count = 0;
  static  unsigned long long aesl_llvm_cbe_4519_count = 0;
  static  unsigned long long aesl_llvm_cbe_4520_count = 0;
  static  unsigned long long aesl_llvm_cbe_4521_count = 0;
  static  unsigned long long aesl_llvm_cbe_4522_count = 0;
  static  unsigned long long aesl_llvm_cbe_4523_count = 0;
  static  unsigned long long aesl_llvm_cbe_4524_count = 0;
  static  unsigned long long aesl_llvm_cbe_4525_count = 0;
  static  unsigned long long aesl_llvm_cbe_4526_count = 0;
  static  unsigned long long aesl_llvm_cbe_4527_count = 0;
  static  unsigned long long aesl_llvm_cbe_4528_count = 0;
  static  unsigned long long aesl_llvm_cbe_4529_count = 0;
  static  unsigned long long aesl_llvm_cbe_4530_count = 0;
  static  unsigned long long aesl_llvm_cbe_4531_count = 0;
  static  unsigned long long aesl_llvm_cbe_4532_count = 0;
  static  unsigned long long aesl_llvm_cbe_4533_count = 0;
  static  unsigned long long aesl_llvm_cbe_4534_count = 0;
  static  unsigned long long aesl_llvm_cbe_4535_count = 0;
  static  unsigned long long aesl_llvm_cbe_4536_count = 0;
  static  unsigned long long aesl_llvm_cbe_4537_count = 0;
   char *llvm_cbe_tmp__583;
  static  unsigned long long aesl_llvm_cbe_4538_count = 0;
  static  unsigned long long aesl_llvm_cbe_4539_count = 0;
  static  unsigned long long aesl_llvm_cbe_4540_count = 0;
  static  unsigned long long aesl_llvm_cbe_4541_count = 0;
  static  unsigned long long aesl_llvm_cbe_4542_count = 0;
  static  unsigned long long aesl_llvm_cbe_4543_count = 0;
  static  unsigned long long aesl_llvm_cbe_4544_count = 0;
  static  unsigned long long aesl_llvm_cbe_4545_count = 0;
  static  unsigned long long aesl_llvm_cbe_4546_count = 0;
  static  unsigned long long aesl_llvm_cbe_4547_count = 0;
  static  unsigned long long aesl_llvm_cbe_4548_count = 0;
  static  unsigned long long aesl_llvm_cbe_4549_count = 0;
  static  unsigned long long aesl_llvm_cbe_4550_count = 0;
  static  unsigned long long aesl_llvm_cbe_4551_count = 0;
  static  unsigned long long aesl_llvm_cbe_4552_count = 0;
  static  unsigned long long aesl_llvm_cbe_4553_count = 0;
  static  unsigned long long aesl_llvm_cbe_4554_count = 0;
  static  unsigned long long aesl_llvm_cbe_4555_count = 0;
  static  unsigned long long aesl_llvm_cbe_4556_count = 0;
  static  unsigned long long aesl_llvm_cbe_4557_count = 0;
  static  unsigned long long aesl_llvm_cbe_4558_count = 0;
  static  unsigned long long aesl_llvm_cbe_4559_count = 0;
  static  unsigned long long aesl_llvm_cbe_4560_count = 0;
  static  unsigned long long aesl_llvm_cbe_4561_count = 0;
  static  unsigned long long aesl_llvm_cbe_4562_count = 0;
  static  unsigned long long aesl_llvm_cbe_4563_count = 0;
  static  unsigned long long aesl_llvm_cbe_4564_count = 0;
  static  unsigned long long aesl_llvm_cbe_4565_count = 0;
  static  unsigned long long aesl_llvm_cbe_4566_count = 0;
  static  unsigned long long aesl_llvm_cbe_4567_count = 0;
  static  unsigned long long aesl_llvm_cbe_4568_count = 0;
  static  unsigned long long aesl_llvm_cbe_4569_count = 0;
  static  unsigned long long aesl_llvm_cbe_4570_count = 0;
  static  unsigned long long aesl_llvm_cbe_4571_count = 0;
  static  unsigned long long aesl_llvm_cbe_4572_count = 0;
  static  unsigned long long aesl_llvm_cbe_4573_count = 0;
  static  unsigned long long aesl_llvm_cbe_4574_count = 0;
   char *llvm_cbe_tmp__584;
  static  unsigned long long aesl_llvm_cbe_4575_count = 0;
  static  unsigned long long aesl_llvm_cbe_4576_count = 0;
  static  unsigned long long aesl_llvm_cbe_4577_count = 0;
  static  unsigned long long aesl_llvm_cbe_4578_count = 0;
  static  unsigned long long aesl_llvm_cbe_4579_count = 0;
  static  unsigned long long aesl_llvm_cbe_4580_count = 0;
  static  unsigned long long aesl_llvm_cbe_4581_count = 0;
  static  unsigned long long aesl_llvm_cbe_4582_count = 0;
  static  unsigned long long aesl_llvm_cbe_4583_count = 0;
  static  unsigned long long aesl_llvm_cbe_4584_count = 0;
  static  unsigned long long aesl_llvm_cbe_4585_count = 0;
  static  unsigned long long aesl_llvm_cbe_4586_count = 0;
  static  unsigned long long aesl_llvm_cbe_4587_count = 0;
  static  unsigned long long aesl_llvm_cbe_4588_count = 0;
  static  unsigned long long aesl_llvm_cbe_4589_count = 0;
  static  unsigned long long aesl_llvm_cbe_4590_count = 0;
  static  unsigned long long aesl_llvm_cbe_4591_count = 0;
  static  unsigned long long aesl_llvm_cbe_4592_count = 0;
  static  unsigned long long aesl_llvm_cbe_4593_count = 0;
  static  unsigned long long aesl_llvm_cbe_4594_count = 0;
  static  unsigned long long aesl_llvm_cbe_4595_count = 0;
  static  unsigned long long aesl_llvm_cbe_4596_count = 0;
  static  unsigned long long aesl_llvm_cbe_4597_count = 0;
  static  unsigned long long aesl_llvm_cbe_4598_count = 0;
  static  unsigned long long aesl_llvm_cbe_4599_count = 0;
  static  unsigned long long aesl_llvm_cbe_4600_count = 0;
  static  unsigned long long aesl_llvm_cbe_4601_count = 0;
  static  unsigned long long aesl_llvm_cbe_4602_count = 0;
  static  unsigned long long aesl_llvm_cbe_4603_count = 0;
  static  unsigned long long aesl_llvm_cbe_4604_count = 0;
  static  unsigned long long aesl_llvm_cbe_4605_count = 0;
  static  unsigned long long aesl_llvm_cbe_4606_count = 0;
  static  unsigned long long aesl_llvm_cbe_4607_count = 0;
  static  unsigned long long aesl_llvm_cbe_4608_count = 0;
  static  unsigned long long aesl_llvm_cbe_4609_count = 0;
  static  unsigned long long aesl_llvm_cbe_4610_count = 0;
  static  unsigned long long aesl_llvm_cbe_4611_count = 0;
  unsigned int llvm_cbe_tmp__585;
  static  unsigned long long aesl_llvm_cbe_4612_count = 0;
  static  unsigned long long aesl_llvm_cbe_4613_count = 0;
  static  unsigned long long aesl_llvm_cbe_4614_count = 0;
  static  unsigned long long aesl_llvm_cbe_4615_count = 0;
  static  unsigned long long aesl_llvm_cbe_4616_count = 0;
  static  unsigned long long aesl_llvm_cbe_4617_count = 0;
  unsigned int llvm_cbe_tmp__586;
  static  unsigned long long aesl_llvm_cbe_4618_count = 0;
  static  unsigned long long aesl_llvm_cbe_4619_count = 0;
  static  unsigned long long aesl_llvm_cbe_4620_count = 0;
  static  unsigned long long aesl_llvm_cbe_4621_count = 0;
  static  unsigned long long aesl_llvm_cbe_4622_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @decode\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i8* @p_jinfo_jpeg_data, align 1, !dbg !31 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3483_count);
  llvm_cbe_tmp__551 = (unsigned char )*(&p_jinfo_jpeg_data);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__551);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%1, i8* @CurHuffReadBuf, align 1, !dbg !31 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3484_count);
  *(&CurHuffReadBuf) = llvm_cbe_tmp__551;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__551);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = getelementptr inbounds [3 x [64 x i32]]* %%HuffBuff, i64 0, i64 0, i64 0, !dbg !31 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3520_count);
  llvm_cbe_tmp__552 = (signed int *)(&llvm_cbe_HuffBuff[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed long long )0ull) < 3 && "Write access out of array 'HuffBuff' bound?");
  assert(((signed long long )0ull) < 64 && "Write access out of array 'HuffBuff' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%2, align 16, !dbg !31 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3521_count);
  *llvm_cbe_tmp__552 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = getelementptr inbounds [3 x [64 x i32]]* %%HuffBuff, i64 0, i64 1, i64 0, !dbg !31 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3557_count);
  llvm_cbe_tmp__553 = (signed int *)(&llvm_cbe_HuffBuff[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed long long )1ull) < 3 && "Write access out of array 'HuffBuff' bound?");
  assert(((signed long long )0ull) < 64 && "Write access out of array 'HuffBuff' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%3, align 16, !dbg !31 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3558_count);
  *llvm_cbe_tmp__553 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = getelementptr inbounds [3 x [64 x i32]]* %%HuffBuff, i64 0, i64 2, i64 0, !dbg !31 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3594_count);
  llvm_cbe_tmp__554 = (signed int *)(&llvm_cbe_HuffBuff[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
}

#ifdef AESL_BC_SIM
  assert(((signed long long )2ull) < 3 && "Write access out of array 'HuffBuff' bound?");
  assert(((signed long long )0ull) < 64 && "Write access out of array 'HuffBuff' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%4, align 16, !dbg !31 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3595_count);
  *llvm_cbe_tmp__554 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = load i16* @p_jinfo_image_width, align 2, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3631_count);
  llvm_cbe_tmp__555 = (unsigned short )*(&p_jinfo_image_width);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__555);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = sext i16 %%5 to i32, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3632_count);
  llvm_cbe_tmp__556 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__555);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__556);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%6, i32* %%out_data_image_width, align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3633_count);
  *llvm_cbe_out_data_image_width = llvm_cbe_tmp__556;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__556);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i16* @p_jinfo_image_height, align 2, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3634_count);
  llvm_cbe_tmp__557 = (unsigned short )*(&p_jinfo_image_height);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__557);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = sext i16 %%7 to i32, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3635_count);
  llvm_cbe_tmp__558 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__557);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__558);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%8, i32* %%out_data_image_height, align 4, !dbg !27 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3636_count);
  *llvm_cbe_out_data_image_height = llvm_cbe_tmp__558;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__558);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%out_data_comp_vpos, align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3672_count);
  *llvm_cbe_out_data_comp_vpos = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%out_data_comp_hpos, align 4, !dbg !29 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3673_count);
  *llvm_cbe_out_data_comp_hpos = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = getelementptr inbounds i32* %%out_data_comp_vpos, i64 1, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3709_count);
  llvm_cbe_tmp__559 = (signed int *)(&llvm_cbe_out_data_comp_vpos[(((signed long long )1ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%9, align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3710_count);
  *llvm_cbe_tmp__559 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = getelementptr inbounds i32* %%out_data_comp_hpos, i64 1, !dbg !29 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3711_count);
  llvm_cbe_tmp__560 = (signed int *)(&llvm_cbe_out_data_comp_hpos[(((signed long long )1ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%10, align 4, !dbg !29 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3712_count);
  *llvm_cbe_tmp__560 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = getelementptr inbounds i32* %%out_data_comp_vpos, i64 2, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3748_count);
  llvm_cbe_tmp__561 = (signed int *)(&llvm_cbe_out_data_comp_vpos[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%11, align 4, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3749_count);
  *llvm_cbe_tmp__561 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = getelementptr inbounds i32* %%out_data_comp_hpos, i64 2, !dbg !29 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3750_count);
  llvm_cbe_tmp__562 = (signed int *)(&llvm_cbe_out_data_comp_hpos[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 0, i32* %%12, align 4, !dbg !29 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3751_count);
  *llvm_cbe_tmp__562 = 0u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", 0u);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i32* @p_jinfo_smp_fact, align 4, !dbg !34 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3787_count);
  llvm_cbe_tmp__563 = (unsigned int )*(&p_jinfo_smp_fact);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__563);
  if (((llvm_cbe_tmp__563&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe__2e_preheader15;
  } else {
    goto llvm_cbe__2e_preheader11;
  }

llvm_cbe__2e_preheader15:
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = load i32* @p_jinfo_NumMCU, align 4, !dbg !30 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3790_count);
  llvm_cbe_tmp__564 = (unsigned int )*(&p_jinfo_NumMCU);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__564);
  if ((((signed int )llvm_cbe_tmp__564) > ((signed int )0u))) {
    goto llvm_cbe__2e_preheader13_2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e_loopexit16;
  }

llvm_cbe__2e_preheader13_2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = getelementptr inbounds [6 x [64 x i32]]* %%IDCTBuff, i64 0, i64 0, i64 0, !dbg !34 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3793_count);
  llvm_cbe_tmp__565 = (signed int *)(&llvm_cbe_IDCTBuff[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = getelementptr inbounds [6 x [64 x i32]]* %%IDCTBuff, i64 0, i64 1, i64 0, !dbg !34 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3794_count);
  llvm_cbe_tmp__566 = (signed int *)(&llvm_cbe_IDCTBuff[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 6
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = getelementptr inbounds [6 x [64 x i32]]* %%IDCTBuff, i64 0, i64 2, i64 0, !dbg !34 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3795_count);
  llvm_cbe_tmp__567 = (signed int *)(&llvm_cbe_IDCTBuff[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 6
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = getelementptr inbounds [16384 x i8]* %%outputVector, i64 0, i64 0, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3796_count);
  llvm_cbe_tmp__568 = ( char *)(&(*llvm_cbe_outputVector)[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 16384
#endif
]);
if (AESL_DEBUG_TRACE) {
}
  llvm_cbe_tmp__573__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe__2e_preheader13;

llvm_cbe__2e_preheader11:
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = load i32* @p_jinfo_NumMCU, align 4, !dbg !30 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3798_count);
  llvm_cbe_tmp__569 = (unsigned int )*(&p_jinfo_NumMCU);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__569);
  if ((((signed int )llvm_cbe_tmp__569) > ((signed int )0u))) {
    goto llvm_cbe__2e_preheader9_2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e_loopexit;
  }

llvm_cbe__2e_preheader9_2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = getelementptr inbounds [6 x [64 x i32]]* %%IDCTBuff, i64 0, i64 4, i64 0, !dbg !34 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3801_count);
  llvm_cbe_tmp__570 = (signed int *)(&llvm_cbe_IDCTBuff[(((signed long long )4ull))
#ifdef AESL_BC_SIM
 % 6
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = getelementptr inbounds [6 x [64 x i32]]* %%IDCTBuff, i64 0, i64 5, i64 0, !dbg !34 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3802_count);
  llvm_cbe_tmp__571 = (signed int *)(&llvm_cbe_IDCTBuff[(((signed long long )5ull))
#ifdef AESL_BC_SIM
 % 6
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds [16384 x i8]* %%outputVector, i64 0, i64 0, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3803_count);
  llvm_cbe_tmp__572 = ( char *)(&(*llvm_cbe_outputVector)[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 16384
#endif
]);
if (AESL_DEBUG_TRACE) {
}
  llvm_cbe_tmp__578__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe__2e_preheader9;

  do {     /* Syntactic loop '.preheader13' to make GCC happy */
llvm_cbe__2e_preheader13:
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = phi i32 [ 0, %%.preheader13.lr.ph ], [ %%29, %%.preheader13  for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3805_count);
  llvm_cbe_tmp__573 = (unsigned int )llvm_cbe_tmp__573__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__573);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__576);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @decode_block(i32 0, i32* %%17, i32* %%2), !dbg !32 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3840_count);
  decode_block(0u, (signed int *)llvm_cbe_tmp__565, (signed int *)llvm_cbe_tmp__552);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @decode_block(i32 1, i32* %%18, i32* %%3), !dbg !32 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3876_count);
  decode_block(1u, (signed int *)llvm_cbe_tmp__566, (signed int *)llvm_cbe_tmp__553);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",1u);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @decode_block(i32 2, i32* %%19, i32* %%4), !dbg !32 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3912_count);
  decode_block(2u, (signed int *)llvm_cbe_tmp__567, (signed int *)llvm_cbe_tmp__554);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",2u);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @YuvToRgb(i32 0, i32* %%17, i32* %%18, i32* %%19), !dbg !34 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3948_count);
  YuvToRgb(0u, (signed int *)llvm_cbe_tmp__565, (signed int *)llvm_cbe_tmp__566, (signed int *)llvm_cbe_tmp__567);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @WriteBlock(i32* getelementptr inbounds ([4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 0, i64 0, i64 0), i32* %%out_data_comp_vpos, i32* %%out_data_comp_hpos, i8* %%20), !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_3984_count);
  WriteBlock((signed int *)((&rgb_buf[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
])), (signed int *)llvm_cbe_out_data_comp_vpos, (signed int *)llvm_cbe_out_data_comp_hpos, ( char *)llvm_cbe_tmp__568);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = getelementptr inbounds [16384 x i8]* %%outputVector, i64 1, i64 0, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4020_count);
  llvm_cbe_tmp__574 = ( char *)(&llvm_cbe_outputVector[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 16384
#endif
][(((signed long long )0ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @WriteBlock(i32* getelementptr inbounds ([4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 0, i64 1, i64 0), i32* %%9, i32* %%10, i8* %%27), !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4021_count);
  WriteBlock((signed int *)((&rgb_buf[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
])), (signed int *)llvm_cbe_tmp__559, (signed int *)llvm_cbe_tmp__560, ( char *)llvm_cbe_tmp__574);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = getelementptr inbounds [16384 x i8]* %%outputVector, i64 2, i64 0, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4057_count);
  llvm_cbe_tmp__575 = ( char *)(&llvm_cbe_outputVector[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 16384
#endif
][(((signed long long )0ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @WriteBlock(i32* getelementptr inbounds ([4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 0, i64 2, i64 0), i32* %%11, i32* %%12, i8* %%28), !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4058_count);
  WriteBlock((signed int *)((&rgb_buf[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
])), (signed int *)llvm_cbe_tmp__561, (signed int *)llvm_cbe_tmp__562, ( char *)llvm_cbe_tmp__575);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = add nsw i32 %%26, 1, !dbg !30 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4094_count);
  llvm_cbe_tmp__576 = (unsigned int )((unsigned int )(llvm_cbe_tmp__573&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__576&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = load i32* @p_jinfo_NumMCU, align 4, !dbg !30 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4100_count);
  llvm_cbe_tmp__577 = (unsigned int )*(&p_jinfo_NumMCU);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__577);
  if ((((signed int )llvm_cbe_tmp__576) < ((signed int )llvm_cbe_tmp__577))) {
    llvm_cbe_tmp__573__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__576;   /* for PHI node */
    goto llvm_cbe__2e_preheader13;
  } else {
    goto llvm_cbe__2e_loopexit16;
  }

  } while (1); /* end of syntactic loop '.preheader13' */
  do {     /* Syntactic loop '.preheader9' to make GCC happy */
llvm_cbe__2e_preheader9:
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = phi i32 [ 0, %%.preheader9.lr.ph ], [ %%39, %%.preheader9  for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4103_count);
  llvm_cbe_tmp__578 = (unsigned int )llvm_cbe_tmp__578__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__578);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__585);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = getelementptr inbounds [6 x [64 x i32]]* %%IDCTBuff, i64 0, i64 0, i64 0, !dbg !33 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4138_count);
  llvm_cbe_tmp__579 = (signed int *)(&llvm_cbe_IDCTBuff[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 6
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @decode_block(i32 0, i32* %%33, i32* %%2), !dbg !33 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4139_count);
  decode_block(0u, (signed int *)llvm_cbe_tmp__579, (signed int *)llvm_cbe_tmp__552);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = getelementptr inbounds [6 x [64 x i32]]* %%IDCTBuff, i64 0, i64 1, i64 0, !dbg !33 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4175_count);
  llvm_cbe_tmp__580 = (signed int *)(&llvm_cbe_IDCTBuff[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 6
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @decode_block(i32 0, i32* %%34, i32* %%2), !dbg !33 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4176_count);
  decode_block(0u, (signed int *)llvm_cbe_tmp__580, (signed int *)llvm_cbe_tmp__552);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = getelementptr inbounds [6 x [64 x i32]]* %%IDCTBuff, i64 0, i64 2, i64 0, !dbg !33 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4212_count);
  llvm_cbe_tmp__581 = (signed int *)(&llvm_cbe_IDCTBuff[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 6
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @decode_block(i32 0, i32* %%35, i32* %%2), !dbg !33 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4213_count);
  decode_block(0u, (signed int *)llvm_cbe_tmp__581, (signed int *)llvm_cbe_tmp__552);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = getelementptr inbounds [6 x [64 x i32]]* %%IDCTBuff, i64 0, i64 3, i64 0, !dbg !33 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4249_count);
  llvm_cbe_tmp__582 = (signed int *)(&llvm_cbe_IDCTBuff[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 6
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @decode_block(i32 0, i32* %%36, i32* %%2), !dbg !33 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4250_count);
  decode_block(0u, (signed int *)llvm_cbe_tmp__582, (signed int *)llvm_cbe_tmp__552);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @decode_block(i32 1, i32* %%23, i32* %%3), !dbg !34 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4286_count);
  decode_block(1u, (signed int *)llvm_cbe_tmp__570, (signed int *)llvm_cbe_tmp__553);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",1u);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @decode_block(i32 2, i32* %%24, i32* %%4), !dbg !34 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4287_count);
  decode_block(2u, (signed int *)llvm_cbe_tmp__571, (signed int *)llvm_cbe_tmp__554);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",2u);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @YuvToRgb(i32 0, i32* %%33, i32* %%23, i32* %%24), !dbg !33 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4323_count);
  YuvToRgb(0u, (signed int *)llvm_cbe_tmp__579, (signed int *)llvm_cbe_tmp__570, (signed int *)llvm_cbe_tmp__571);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @YuvToRgb(i32 1, i32* %%34, i32* %%23, i32* %%24), !dbg !33 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4359_count);
  YuvToRgb(1u, (signed int *)llvm_cbe_tmp__580, (signed int *)llvm_cbe_tmp__570, (signed int *)llvm_cbe_tmp__571);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",1u);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @YuvToRgb(i32 2, i32* %%35, i32* %%23, i32* %%24), !dbg !33 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4395_count);
  YuvToRgb(2u, (signed int *)llvm_cbe_tmp__581, (signed int *)llvm_cbe_tmp__570, (signed int *)llvm_cbe_tmp__571);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",2u);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @YuvToRgb(i32 3, i32* %%36, i32* %%23, i32* %%24), !dbg !33 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4431_count);
  YuvToRgb(3u, (signed int *)llvm_cbe_tmp__582, (signed int *)llvm_cbe_tmp__570, (signed int *)llvm_cbe_tmp__571);
if (AESL_DEBUG_TRACE) {
printf("\nArgument  = 0x%X",3u);
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @Write4Blocks(i32* getelementptr inbounds ([4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 1, i64 0, i64 0), i32* getelementptr inbounds ([4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 2, i64 0, i64 0), i32* getelementptr inbounds ([4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 3, i64 0, i64 0), i32* %%out_data_comp_vpos, i32* %%out_data_comp_hpos, i8* %%25), !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4501_count);
  Write4Blocks((signed int *)((&rgb_buf[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
])), (signed int *)((&rgb_buf[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
])), (signed int *)((&rgb_buf[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
])), (signed int *)((&rgb_buf[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
])), (signed int *)llvm_cbe_out_data_comp_vpos, (signed int *)llvm_cbe_out_data_comp_hpos, ( char *)llvm_cbe_tmp__572);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = getelementptr inbounds [16384 x i8]* %%outputVector, i64 1, i64 0, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4537_count);
  llvm_cbe_tmp__583 = ( char *)(&llvm_cbe_outputVector[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 16384
#endif
][(((signed long long )0ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @Write4Blocks(i32* getelementptr inbounds ([4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 0, i64 1, i64 0), i32* getelementptr inbounds ([4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 1, i64 1, i64 0), i32* getelementptr inbounds ([4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 2, i64 1, i64 0), i32* getelementptr inbounds ([4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 3, i64 1, i64 0), i32* %%9, i32* %%10, i8* %%37), !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4538_count);
  Write4Blocks((signed int *)((&rgb_buf[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
])), (signed int *)((&rgb_buf[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
])), (signed int *)((&rgb_buf[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
])), (signed int *)((&rgb_buf[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
])), (signed int *)llvm_cbe_tmp__559, (signed int *)llvm_cbe_tmp__560, ( char *)llvm_cbe_tmp__583);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = getelementptr inbounds [16384 x i8]* %%outputVector, i64 2, i64 0, !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4574_count);
  llvm_cbe_tmp__584 = ( char *)(&llvm_cbe_outputVector[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 16384
#endif
][(((signed long long )0ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @Write4Blocks(i32* getelementptr inbounds ([4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 0, i64 2, i64 0), i32* getelementptr inbounds ([4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 1, i64 2, i64 0), i32* getelementptr inbounds ([4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 2, i64 2, i64 0), i32* getelementptr inbounds ([4 x [3 x [64 x i32]]]* @rgb_buf, i64 0, i64 3, i64 2, i64 0), i32* %%11, i32* %%12, i8* %%38), !dbg !28 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4575_count);
  Write4Blocks((signed int *)((&rgb_buf[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
])), (signed int *)((&rgb_buf[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
])), (signed int *)((&rgb_buf[(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
])), (signed int *)((&rgb_buf[(((signed long long )3ull))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )2ull))
#ifdef AESL_BC_SIM
 % 3
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 64
#endif
])), (signed int *)llvm_cbe_tmp__561, (signed int *)llvm_cbe_tmp__562, ( char *)llvm_cbe_tmp__584);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = add nsw i32 %%32, 4, !dbg !30 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4611_count);
  llvm_cbe_tmp__585 = (unsigned int )((unsigned int )(llvm_cbe_tmp__578&4294967295ull)) + ((unsigned int )(4u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__585&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = load i32* @p_jinfo_NumMCU, align 4, !dbg !30 for 0x%llxth hint within @decode  --> \n", ++aesl_llvm_cbe_4617_count);
  llvm_cbe_tmp__586 = (unsigned int )*(&p_jinfo_NumMCU);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__586);
  if ((((signed int )llvm_cbe_tmp__585) < ((signed int )llvm_cbe_tmp__586))) {
    llvm_cbe_tmp__578__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__585;   /* for PHI node */
    goto llvm_cbe__2e_preheader9;
  } else {
    goto llvm_cbe__2e_loopexit;
  }

  } while (1); /* end of syntactic loop '.preheader9' */
llvm_cbe__2e_loopexit:
  goto llvm_cbe_tmp__587;

llvm_cbe__2e_loopexit16:
  goto llvm_cbe_tmp__587;

llvm_cbe_tmp__587:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @decode}\n");
  return;
}


signed int read_byte(void) {
  static  unsigned long long aesl_llvm_cbe_4623_count = 0;
  unsigned char llvm_cbe_tmp__588;
  static  unsigned long long aesl_llvm_cbe_4624_count = 0;
  unsigned char llvm_cbe_tmp__589;
  static  unsigned long long aesl_llvm_cbe_4625_count = 0;
  static  unsigned long long aesl_llvm_cbe_4626_count = 0;
  unsigned int llvm_cbe_tmp__590;
  static  unsigned long long aesl_llvm_cbe_4627_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @read_byte\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i8* @aesl_internal_ReadBuf, align 1, !dbg !27 for 0x%llxth hint within @read_byte  --> \n", ++aesl_llvm_cbe_4623_count);
  llvm_cbe_tmp__588 = (unsigned char )*(&aesl_internal_ReadBuf);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__588);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = add i8 %%1, 1, !dbg !27 for 0x%llxth hint within @read_byte  --> \n", ++aesl_llvm_cbe_4624_count);
  llvm_cbe_tmp__589 = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_tmp__588&255ull)) + ((unsigned char )(((unsigned char )1)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__589&255ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%2, i8* @aesl_internal_ReadBuf, align 1, !dbg !27 for 0x%llxth hint within @read_byte  --> \n", ++aesl_llvm_cbe_4625_count);
  *(&aesl_internal_ReadBuf) = llvm_cbe_tmp__589;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__589);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = zext i8 %%1 to i32, !dbg !27 for 0x%llxth hint within @read_byte  --> \n", ++aesl_llvm_cbe_4626_count);
  llvm_cbe_tmp__590 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__588&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__590);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @read_byte}\n");
  return llvm_cbe_tmp__590;
}


signed short read_word(void) {
  static  unsigned long long aesl_llvm_cbe_4628_count = 0;
  unsigned char llvm_cbe_tmp__591;
  static  unsigned long long aesl_llvm_cbe_4629_count = 0;
  unsigned char llvm_cbe_tmp__592;
  static  unsigned long long aesl_llvm_cbe_4630_count = 0;
  unsigned short llvm_cbe_tmp__593;
  static  unsigned long long aesl_llvm_cbe_4631_count = 0;
  unsigned short llvm_cbe_tmp__594;
  static  unsigned long long aesl_llvm_cbe_4632_count = 0;
  static  unsigned long long aesl_llvm_cbe_4633_count = 0;
  unsigned char llvm_cbe_tmp__595;
  static  unsigned long long aesl_llvm_cbe_4634_count = 0;
  static  unsigned long long aesl_llvm_cbe_4635_count = 0;
  unsigned short llvm_cbe_tmp__596;
  static  unsigned long long aesl_llvm_cbe_4636_count = 0;
  static  unsigned long long aesl_llvm_cbe_4637_count = 0;
  unsigned short llvm_cbe_tmp__597;
  static  unsigned long long aesl_llvm_cbe_4638_count = 0;
  static  unsigned long long aesl_llvm_cbe_4639_count = 0;
  static  unsigned long long aesl_llvm_cbe_4640_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @read_word\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i8* @aesl_internal_ReadBuf, align 1, !dbg !27 for 0x%llxth hint within @read_word  --> \n", ++aesl_llvm_cbe_4628_count);
  llvm_cbe_tmp__591 = (unsigned char )*(&aesl_internal_ReadBuf);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__591);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = add i8 %%1, 1, !dbg !27 for 0x%llxth hint within @read_word  --> \n", ++aesl_llvm_cbe_4629_count);
  llvm_cbe_tmp__592 = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_tmp__591&255ull)) + ((unsigned char )(((unsigned char )1)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__592&255ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = zext i8 %%1 to i16, !dbg !27 for 0x%llxth hint within @read_word  --> \n", ++aesl_llvm_cbe_4630_count);
  llvm_cbe_tmp__593 = (unsigned short )((unsigned short )(unsigned char )llvm_cbe_tmp__591&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__593);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = shl nuw i16 %%3, 8, !dbg !27 for 0x%llxth hint within @read_word  --> \n", ++aesl_llvm_cbe_4631_count);
  llvm_cbe_tmp__594 = (unsigned short )((unsigned short )(llvm_cbe_tmp__593 << ((unsigned short )8)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__594);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = add i8 %%1, 2, !dbg !27 for 0x%llxth hint within @read_word  --> \n", ++aesl_llvm_cbe_4633_count);
  llvm_cbe_tmp__595 = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_tmp__591&255ull)) + ((unsigned char )(((unsigned char )2)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__595&255ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%5, i8* @aesl_internal_ReadBuf, align 1, !dbg !27 for 0x%llxth hint within @read_word  --> \n", ++aesl_llvm_cbe_4634_count);
  *(&aesl_internal_ReadBuf) = llvm_cbe_tmp__595;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__595);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = zext i8 %%2 to i16, !dbg !27 for 0x%llxth hint within @read_word  --> \n", ++aesl_llvm_cbe_4635_count);
  llvm_cbe_tmp__596 = (unsigned short )((unsigned short )(unsigned char )llvm_cbe_tmp__592&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__596);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = or i16 %%4, %%6, !dbg !27 for 0x%llxth hint within @read_word  --> \n", ++aesl_llvm_cbe_4637_count);
  llvm_cbe_tmp__597 = (unsigned short )((unsigned short )(llvm_cbe_tmp__594 | llvm_cbe_tmp__596));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__597);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @read_word}\n");
  return llvm_cbe_tmp__597;
}


signed int read_dword(void) {
  static  unsigned long long aesl_llvm_cbe_4641_count = 0;
  unsigned char llvm_cbe_tmp__598;
  static  unsigned long long aesl_llvm_cbe_4642_count = 0;
  unsigned char llvm_cbe_tmp__599;
  static  unsigned long long aesl_llvm_cbe_4643_count = 0;
  unsigned int llvm_cbe_tmp__600;
  static  unsigned long long aesl_llvm_cbe_4644_count = 0;
  unsigned int llvm_cbe_tmp__601;
  static  unsigned long long aesl_llvm_cbe_4645_count = 0;
  static  unsigned long long aesl_llvm_cbe_4646_count = 0;
  unsigned char llvm_cbe_tmp__602;
  static  unsigned long long aesl_llvm_cbe_4647_count = 0;
  unsigned int llvm_cbe_tmp__603;
  static  unsigned long long aesl_llvm_cbe_4648_count = 0;
  unsigned int llvm_cbe_tmp__604;
  static  unsigned long long aesl_llvm_cbe_4649_count = 0;
  static  unsigned long long aesl_llvm_cbe_4650_count = 0;
  unsigned char llvm_cbe_tmp__605;
  static  unsigned long long aesl_llvm_cbe_4651_count = 0;
  unsigned int llvm_cbe_tmp__606;
  static  unsigned long long aesl_llvm_cbe_4652_count = 0;
  unsigned int llvm_cbe_tmp__607;
  static  unsigned long long aesl_llvm_cbe_4653_count = 0;
  static  unsigned long long aesl_llvm_cbe_4654_count = 0;
  unsigned char llvm_cbe_tmp__608;
  static  unsigned long long aesl_llvm_cbe_4655_count = 0;
  static  unsigned long long aesl_llvm_cbe_4656_count = 0;
  unsigned int llvm_cbe_tmp__609;
  static  unsigned long long aesl_llvm_cbe_4657_count = 0;
  static  unsigned long long aesl_llvm_cbe_4658_count = 0;
  unsigned int llvm_cbe_tmp__610;
  static  unsigned long long aesl_llvm_cbe_4659_count = 0;
  unsigned int llvm_cbe_tmp__611;
  static  unsigned long long aesl_llvm_cbe_4660_count = 0;
  unsigned int llvm_cbe_tmp__612;
  static  unsigned long long aesl_llvm_cbe_4661_count = 0;
  static  unsigned long long aesl_llvm_cbe_4662_count = 0;
  static  unsigned long long aesl_llvm_cbe_4663_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @read_dword\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i8* @aesl_internal_ReadBuf, align 1, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4641_count);
  llvm_cbe_tmp__598 = (unsigned char )*(&aesl_internal_ReadBuf);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__598);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = add i8 %%1, 1, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4642_count);
  llvm_cbe_tmp__599 = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_tmp__598&255ull)) + ((unsigned char )(((unsigned char )1)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__599&255ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = zext i8 %%1 to i32, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4643_count);
  llvm_cbe_tmp__600 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__598&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__600);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = shl nuw i32 %%3, 24, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4644_count);
  llvm_cbe_tmp__601 = (unsigned int )llvm_cbe_tmp__600 << 24u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__601);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = add i8 %%1, 2, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4646_count);
  llvm_cbe_tmp__602 = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_tmp__598&255ull)) + ((unsigned char )(((unsigned char )2)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__602&255ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = zext i8 %%2 to i32, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4647_count);
  llvm_cbe_tmp__603 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__599&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__603);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = shl nuw nsw i32 %%6, 16, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4648_count);
  llvm_cbe_tmp__604 = (unsigned int )llvm_cbe_tmp__603 << 16u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__604);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add i8 %%1, 3, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4650_count);
  llvm_cbe_tmp__605 = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_tmp__598&255ull)) + ((unsigned char )(((unsigned char )3)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__605&255ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = zext i8 %%5 to i32, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4651_count);
  llvm_cbe_tmp__606 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__602&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__606);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = shl nuw nsw i32 %%9, 8, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4652_count);
  llvm_cbe_tmp__607 = (unsigned int )llvm_cbe_tmp__606 << 8u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__607);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = add i8 %%1, 4, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4654_count);
  llvm_cbe_tmp__608 = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_tmp__598&255ull)) + ((unsigned char )(((unsigned char )4)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__608&255ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%11, i8* @aesl_internal_ReadBuf, align 1, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4655_count);
  *(&aesl_internal_ReadBuf) = llvm_cbe_tmp__608;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__608);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = zext i8 %%8 to i32, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4656_count);
  llvm_cbe_tmp__609 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe_tmp__605&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__609);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = or i32 %%12, %%4, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4658_count);
  llvm_cbe_tmp__610 = (unsigned int )llvm_cbe_tmp__609 | llvm_cbe_tmp__601;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__610);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = or i32 %%13, %%7, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4659_count);
  llvm_cbe_tmp__611 = (unsigned int )llvm_cbe_tmp__610 | llvm_cbe_tmp__604;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__611);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = or i32 %%14, %%10, !dbg !27 for 0x%llxth hint within @read_dword  --> \n", ++aesl_llvm_cbe_4660_count);
  llvm_cbe_tmp__612 = (unsigned int )llvm_cbe_tmp__611 | llvm_cbe_tmp__607;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__612);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @read_dword}\n");
  return llvm_cbe_tmp__612;
}


signed int first_marker(void) {
  static  unsigned long long aesl_llvm_cbe_4664_count = 0;
  unsigned int llvm_cbe_tmp__613;
  static  unsigned long long aesl_llvm_cbe_4665_count = 0;
  static  unsigned long long aesl_llvm_cbe_4666_count = 0;
  unsigned int llvm_cbe_tmp__614;
  static  unsigned long long aesl_llvm_cbe_4667_count = 0;
  static  unsigned long long aesl_llvm_cbe_4668_count = 0;
  static  unsigned long long aesl_llvm_cbe_4669_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @first_marker\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call i32 @read_byte(), !dbg !27 for 0x%llxth hint within @first_marker  --> \n", ++aesl_llvm_cbe_4664_count);
   /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__613);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = tail call i32 @read_byte(), !dbg !27 for 0x%llxth hint within @first_marker  --> \n", ++aesl_llvm_cbe_4666_count);
  llvm_cbe_tmp__614 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__614);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @first_marker}\n");
  return llvm_cbe_tmp__614;
}


signed int next_marker(void) {
  static  unsigned long long aesl_llvm_cbe_4670_count = 0;
  static  unsigned long long aesl_llvm_cbe_4671_count = 0;
  unsigned int llvm_cbe_tmp__615;
  static  unsigned long long aesl_llvm_cbe_4672_count = 0;
  static  unsigned long long aesl_llvm_cbe_4673_count = 0;
  static  unsigned long long aesl_llvm_cbe_4674_count = 0;
  static  unsigned long long aesl_llvm_cbe_4675_count = 0;
  static  unsigned long long aesl_llvm_cbe_4676_count = 0;
  static  unsigned long long aesl_llvm_cbe_4677_count = 0;
  static  unsigned long long aesl_llvm_cbe_4678_count = 0;
  static  unsigned long long aesl_llvm_cbe_4679_count = 0;
  static  unsigned long long aesl_llvm_cbe_4680_count = 0;
  unsigned int llvm_cbe_tmp__616;
  static  unsigned long long aesl_llvm_cbe_4681_count = 0;
  static  unsigned long long aesl_llvm_cbe_4682_count = 0;
  static  unsigned long long aesl_llvm_cbe_4683_count = 0;
  static  unsigned long long aesl_llvm_cbe_4684_count = 0;
  static  unsigned long long aesl_llvm_cbe_4685_count = 0;
  static  unsigned long long aesl_llvm_cbe_4686_count = 0;
  static  unsigned long long aesl_llvm_cbe_4687_count = 0;
  static  unsigned long long aesl_llvm_cbe_4688_count = 0;
  unsigned int llvm_cbe_tmp__617;
  static  unsigned long long aesl_llvm_cbe_4689_count = 0;
  static  unsigned long long aesl_llvm_cbe_4690_count = 0;
  static  unsigned long long aesl_llvm_cbe_4691_count = 0;
  static  unsigned long long aesl_llvm_cbe_4692_count = 0;
  static  unsigned long long aesl_llvm_cbe_4693_count = 0;
  static  unsigned long long aesl_llvm_cbe_4694_count = 0;
  static  unsigned long long aesl_llvm_cbe_4695_count = 0;
  static  unsigned long long aesl_llvm_cbe_4696_count = 0;
  static  unsigned long long aesl_llvm_cbe_4697_count = 0;
  static  unsigned long long aesl_llvm_cbe_4698_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @next_marker\n");
  goto llvm_cbe_tmp__618;

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__618:
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = tail call i32 @read_byte(), !dbg !27 for 0x%llxth hint within @next_marker  --> \n", ++aesl_llvm_cbe_4671_count);
  llvm_cbe_tmp__615 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__615);
}
  if (((llvm_cbe_tmp__615&4294967295U) == (255u&4294967295U))) {
    goto llvm_cbe__2e_preheader;
  } else {
    goto llvm_cbe__2e_lr_2e_ph;
  }

llvm_cbe_tmp__619:
  if (((llvm_cbe_tmp__617&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__618;
  } else {
    goto llvm_cbe_tmp__620;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__621:
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = tail call i32 @read_byte(), !dbg !28 for 0x%llxth hint within @next_marker  --> \n", ++aesl_llvm_cbe_4688_count);
  llvm_cbe_tmp__617 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__617);
}
  if (((llvm_cbe_tmp__617&4294967295U) == (255u&4294967295U))) {
    goto llvm_cbe_tmp__621;
  } else {
    goto llvm_cbe_tmp__619;
  }

  } while (1); /* end of syntactic loop '' */
llvm_cbe__2e_preheader:
  goto llvm_cbe_tmp__621;

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = tail call i32 @read_byte(), !dbg !28 for 0x%llxth hint within @next_marker  --> \n", ++aesl_llvm_cbe_4680_count);
  llvm_cbe_tmp__616 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__616);
}
  if (((llvm_cbe_tmp__616&4294967295U) == (255u&4294967295U))) {
    goto llvm_cbe__2e_preheader;
  } else {
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
  } while (1); /* end of syntactic loop '' */
llvm_cbe_tmp__620:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @next_marker}\n");
  return llvm_cbe_tmp__617;
}


void get_sof(void) {
  static  unsigned long long aesl_llvm_cbe_4699_count = 0;
  unsigned short llvm_cbe_tmp__622;
  static  unsigned long long aesl_llvm_cbe_4700_count = 0;
  unsigned int llvm_cbe_tmp__623;
  static  unsigned long long aesl_llvm_cbe_4701_count = 0;
  unsigned char llvm_cbe_tmp__624;
  static  unsigned long long aesl_llvm_cbe_4702_count = 0;
  static  unsigned long long aesl_llvm_cbe_4703_count = 0;
  unsigned short llvm_cbe_tmp__625;
  static  unsigned long long aesl_llvm_cbe_4704_count = 0;
  static  unsigned long long aesl_llvm_cbe_4705_count = 0;
  unsigned short llvm_cbe_tmp__626;
  static  unsigned long long aesl_llvm_cbe_4706_count = 0;
  static  unsigned long long aesl_llvm_cbe_4707_count = 0;
  unsigned int llvm_cbe_tmp__627;
  static  unsigned long long aesl_llvm_cbe_4708_count = 0;
  unsigned char llvm_cbe_tmp__628;
  static  unsigned long long aesl_llvm_cbe_4709_count = 0;
  static  unsigned long long aesl_llvm_cbe_4710_count = 0;
  static  unsigned long long aesl_llvm_cbe_4711_count = 0;
  static  unsigned long long aesl_llvm_cbe_4712_count = 0;
  static  unsigned long long aesl_llvm_cbe_4713_count = 0;
  static  unsigned long long aesl_llvm_cbe_4714_count = 0;
  static  unsigned long long aesl_llvm_cbe_4715_count = 0;
  static  unsigned long long aesl_llvm_cbe_4716_count = 0;
  static  unsigned long long aesl_llvm_cbe_4717_count = 0;
  static  unsigned long long aesl_llvm_cbe_4718_count = 0;
  static  unsigned long long aesl_llvm_cbe_4719_count = 0;
  static  unsigned long long aesl_llvm_cbe_4720_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge2_count = 0;
  unsigned int llvm_cbe_storemerge2;
  unsigned int llvm_cbe_storemerge2__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_4721_count = 0;
  unsigned int llvm_cbe_tmp__629;
  static  unsigned long long aesl_llvm_cbe_4722_count = 0;
  unsigned int llvm_cbe_tmp__630;
  static  unsigned long long aesl_llvm_cbe_4723_count = 0;
  static  unsigned long long aesl_llvm_cbe_4724_count = 0;
  static  unsigned long long aesl_llvm_cbe_4725_count = 0;
  static  unsigned long long aesl_llvm_cbe_4726_count = 0;
  unsigned int llvm_cbe_tmp__631;
  static  unsigned long long aesl_llvm_cbe_4727_count = 0;
  unsigned int llvm_cbe_tmp__632;
  static  unsigned long long aesl_llvm_cbe_4728_count = 0;
  static  unsigned long long aesl_llvm_cbe_4729_count = 0;
  static  unsigned long long aesl_llvm_cbe_4730_count = 0;
  static  unsigned long long aesl_llvm_cbe_4731_count = 0;
  static  unsigned long long aesl_llvm_cbe_4732_count = 0;
  static  unsigned long long aesl_llvm_cbe_4733_count = 0;
  static  unsigned long long aesl_llvm_cbe_4734_count = 0;
  static  unsigned long long aesl_llvm_cbe_4735_count = 0;
  static  unsigned long long aesl_llvm_cbe_4736_count = 0;
  static  unsigned long long aesl_llvm_cbe_4737_count = 0;
  unsigned char llvm_cbe_tmp__633;
  static  unsigned long long aesl_llvm_cbe_4738_count = 0;
  unsigned int llvm_cbe_tmp__634;
  static  unsigned long long aesl_llvm_cbe_4739_count = 0;
  static  unsigned long long aesl_llvm_cbe_4740_count = 0;
  static  unsigned long long aesl_llvm_cbe_4741_count = 0;
  unsigned char llvm_cbe_tmp__635;
  static  unsigned long long aesl_llvm_cbe_4742_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  unsigned int llvm_cbe_storemerge1;
  static  unsigned long long aesl_llvm_cbe_4743_count = 0;
  static  unsigned long long aesl_llvm_cbe_4744_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @get_sof\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call signext i16 @read_word(), !dbg !27 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4699_count);
   /*tail*/ read_word();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__622);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = tail call i32 @read_byte(), !dbg !27 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4700_count);
  llvm_cbe_tmp__623 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__623);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = trunc i32 %%2 to i8, !dbg !27 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4701_count);
  llvm_cbe_tmp__624 = (unsigned char )((unsigned char )llvm_cbe_tmp__623&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__624);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%3, i8* @p_jinfo_data_precision, align 1, !dbg !27 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4702_count);
  *(&p_jinfo_data_precision) = llvm_cbe_tmp__624;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__624);
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = tail call signext i16 @read_word(), !dbg !27 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4703_count);
  llvm_cbe_tmp__625 = (unsigned short ) /*tail*/ read_word();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__625);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i16 %%4, i16* @p_jinfo_image_height, align 2, !dbg !27 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4704_count);
  *(&p_jinfo_image_height) = llvm_cbe_tmp__625;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__625);
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = tail call signext i16 @read_word(), !dbg !27 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4705_count);
  llvm_cbe_tmp__626 = (unsigned short ) /*tail*/ read_word();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__626);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i16 %%5, i16* @p_jinfo_image_width, align 2, !dbg !27 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4706_count);
  *(&p_jinfo_image_width) = llvm_cbe_tmp__626;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__626);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = tail call i32 @read_byte(), !dbg !27 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4707_count);
  llvm_cbe_tmp__627 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__627);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = trunc i32 %%6 to i8, !dbg !27 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4708_count);
  llvm_cbe_tmp__628 = (unsigned char )((unsigned char )llvm_cbe_tmp__627&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__628);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%7, i8* @p_jinfo_num_components, align 1, !dbg !27 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4709_count);
  *(&p_jinfo_num_components) = llvm_cbe_tmp__628;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__628);
  if (((( char )llvm_cbe_tmp__628) > (( char )((unsigned char )0)))) {
    llvm_cbe_storemerge2__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge2 = phi i32 [ %%12, %%.lr.ph ], [ 0, %%0  for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_storemerge2_count);
  llvm_cbe_storemerge2 = (unsigned int )llvm_cbe_storemerge2__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge2 = 0x%X",llvm_cbe_storemerge2);
printf("\n = 0x%X",llvm_cbe_tmp__632);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = tail call i32 @read_byte(), !dbg !28 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4721_count);
   /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__629);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4722_count);
   /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__630);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4726_count);
   /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__631);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = add nsw i32 %%storemerge2, 1, !dbg !28 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4727_count);
  llvm_cbe_tmp__632 = (unsigned int )((unsigned int )(llvm_cbe_storemerge2&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__632&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = load i8* @p_jinfo_num_components, align 1, !dbg !27 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4737_count);
  llvm_cbe_tmp__633 = (unsigned char )*(&p_jinfo_num_components);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__633);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = sext i8 %%13 to i32, !dbg !27 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4738_count);
  llvm_cbe_tmp__634 = (unsigned int )((signed int )( char )llvm_cbe_tmp__633);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__634);
  if ((((signed int )llvm_cbe_tmp__632) < ((signed int )llvm_cbe_tmp__634))) {
    llvm_cbe_storemerge2__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__632;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = load i8* getelementptr inbounds ([3 x i8]* @p_jinfo_comps_info_h_samp_factor, i64 0, i64 0), align 1, !dbg !29 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4741_count);
  llvm_cbe_tmp__635 = (unsigned char )*((&p_jinfo_comps_info_h_samp_factor[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 3
#endif
]));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__635);
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = select i1 %%17, i32 2, i32 0, !dbg !29 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (unsigned int )((((llvm_cbe_tmp__635&255U) == (((unsigned char )2)&255U))) ? ((unsigned int )2u) : ((unsigned int )0u));
if (AESL_DEBUG_TRACE)
printf("\nstoremerge1 = 0x%X\n", llvm_cbe_storemerge1);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%storemerge1, i32* @p_jinfo_smp_fact, align 4, !dbg !29 for 0x%llxth hint within @get_sof  --> \n", ++aesl_llvm_cbe_4743_count);
  *(&p_jinfo_smp_fact) = llvm_cbe_storemerge1;
if (AESL_DEBUG_TRACE)
printf("\nstoremerge1 = 0x%X\n", llvm_cbe_storemerge1);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @get_sof}\n");
  return;
}


void get_sos(void) {
  static  unsigned long long aesl_llvm_cbe_4745_count = 0;
  static  unsigned long long aesl_llvm_cbe_4746_count = 0;
  unsigned short llvm_cbe_tmp__636;
  static  unsigned long long aesl_llvm_cbe_4747_count = 0;
  unsigned int llvm_cbe_tmp__637;
  static  unsigned long long aesl_llvm_cbe_4748_count = 0;
  static  unsigned long long aesl_llvm_cbe_4749_count = 0;
  static  unsigned long long aesl_llvm_cbe_4750_count = 0;
  static  unsigned long long aesl_llvm_cbe_4751_count = 0;
  static  unsigned long long aesl_llvm_cbe_4752_count = 0;
  static  unsigned long long aesl_llvm_cbe_4753_count = 0;
  static  unsigned long long aesl_llvm_cbe_4754_count = 0;
  static  unsigned long long aesl_llvm_cbe_4755_count = 0;
  static  unsigned long long aesl_llvm_cbe_4756_count = 0;
  static  unsigned long long aesl_llvm_cbe_4757_count = 0;
  unsigned int llvm_cbe_tmp__638;
  static  unsigned long long aesl_llvm_cbe_4758_count = 0;
  static  unsigned long long aesl_llvm_cbe_4759_count = 0;
  static  unsigned long long aesl_llvm_cbe_4760_count = 0;
  static  unsigned long long aesl_llvm_cbe_4761_count = 0;
  unsigned int llvm_cbe_tmp__639;
  static  unsigned long long aesl_llvm_cbe_4762_count = 0;
  static  unsigned long long aesl_llvm_cbe_4763_count = 0;
  static  unsigned long long aesl_llvm_cbe_4764_count = 0;
  static  unsigned long long aesl_llvm_cbe_4765_count = 0;
  unsigned int llvm_cbe_tmp__640;
  static  unsigned long long aesl_llvm_cbe_4766_count = 0;
  static  unsigned long long aesl_llvm_cbe_4767_count = 0;
  static  unsigned long long aesl_llvm_cbe_4768_count = 0;
  static  unsigned long long aesl_llvm_cbe_4769_count = 0;
  unsigned char llvm_cbe_tmp__641;
  static  unsigned long long aesl_llvm_cbe_4770_count = 0;
  static  unsigned long long aesl_llvm_cbe_4771_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge2_count = 0;
  unsigned int llvm_cbe_storemerge2;
  unsigned int llvm_cbe_storemerge2__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_4772_count = 0;
  unsigned int llvm_cbe_tmp__642;
  static  unsigned long long aesl_llvm_cbe_4773_count = 0;
  static  unsigned long long aesl_llvm_cbe_4774_count = 0;
  static  unsigned long long aesl_llvm_cbe_4775_count = 0;
  unsigned int llvm_cbe_tmp__643;
  static  unsigned long long aesl_llvm_cbe_4776_count = 0;
  static  unsigned long long aesl_llvm_cbe_4777_count = 0;
  static  unsigned long long aesl_llvm_cbe_4778_count = 0;
  static  unsigned long long aesl_llvm_cbe_4779_count = 0;
  static  unsigned long long aesl_llvm_cbe_4780_count = 0;
  unsigned int llvm_cbe_tmp__644;
  static  unsigned long long aesl_llvm_cbe_4781_count = 0;
  unsigned int llvm_cbe_tmp__645;
  static  unsigned long long aesl_llvm_cbe_4782_count = 0;
  static  unsigned long long aesl_llvm_cbe_4783_count = 0;
  unsigned int llvm_cbe_tmp__646;
  static  unsigned long long aesl_llvm_cbe_4784_count = 0;
  static  unsigned long long aesl_llvm_cbe_4785_count = 0;
  static  unsigned long long aesl_llvm_cbe_4786_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_4787_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @get_sos\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call signext i16 @read_word(), !dbg !27 for 0x%llxth hint within @get_sos  --> \n", ++aesl_llvm_cbe_4746_count);
   /*tail*/ read_word();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__636);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = tail call i32 @read_byte(), !dbg !27 for 0x%llxth hint within @get_sos  --> \n", ++aesl_llvm_cbe_4747_count);
  llvm_cbe_tmp__637 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__637);
}
  if ((((signed int )llvm_cbe_tmp__637) > ((signed int )0u))) {
    llvm_cbe_storemerge2__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e_preheader;
  }

llvm_cbe__2e_preheader:
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = tail call i32 @read_byte(), !dbg !28 for 0x%llxth hint within @get_sos  --> \n", ++aesl_llvm_cbe_4757_count);
   /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__638);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = tail call i32 @read_byte(), !dbg !28 for 0x%llxth hint within @get_sos  --> \n", ++aesl_llvm_cbe_4761_count);
   /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__639);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = tail call i32 @read_byte(), !dbg !28 for 0x%llxth hint within @get_sos  --> \n", ++aesl_llvm_cbe_4765_count);
   /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__640);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = load i8* @aesl_internal_ReadBuf, align 1, !dbg !28 for 0x%llxth hint within @get_sos  --> \n", ++aesl_llvm_cbe_4769_count);
  llvm_cbe_tmp__641 = (unsigned char )*(&aesl_internal_ReadBuf);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__641);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%7, i8* @p_jinfo_jpeg_data, align 1, !dbg !28 for 0x%llxth hint within @get_sos  --> \n", ++aesl_llvm_cbe_4770_count);
  *(&p_jinfo_jpeg_data) = llvm_cbe_tmp__641;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__641);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @get_sos}\n");
  return;
  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge2 = phi i32 [ %%12, %%.lr.ph ], [ 0, %%0  for 0x%llxth hint within @get_sos  --> \n", ++aesl_llvm_cbe_storemerge2_count);
  llvm_cbe_storemerge2 = (unsigned int )llvm_cbe_storemerge2__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge2 = 0x%X",llvm_cbe_storemerge2);
printf("\n = 0x%X",llvm_cbe_tmp__646);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_sos  --> \n", ++aesl_llvm_cbe_4772_count);
   /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__642);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_sos  --> \n", ++aesl_llvm_cbe_4775_count);
   /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__643);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = load i32* @i_get_sos, align 4, !dbg !30 for 0x%llxth hint within @get_sos  --> \n", ++aesl_llvm_cbe_4780_count);
  llvm_cbe_tmp__644 = (unsigned int )*(&i_get_sos);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__644);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = add nsw i32 %%10, 1, !dbg !30 for 0x%llxth hint within @get_sos  --> \n", ++aesl_llvm_cbe_4781_count);
  llvm_cbe_tmp__645 = (unsigned int )((unsigned int )(llvm_cbe_tmp__644&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__645&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%11, i32* @i_get_sos, align 4, !dbg !30 for 0x%llxth hint within @get_sos  --> \n", ++aesl_llvm_cbe_4782_count);
  *(&i_get_sos) = llvm_cbe_tmp__645;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__645);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = add nsw i32 %%storemerge2, 1, !dbg !28 for 0x%llxth hint within @get_sos  --> \n", ++aesl_llvm_cbe_4783_count);
  llvm_cbe_tmp__646 = (unsigned int )((unsigned int )(llvm_cbe_storemerge2&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__646&4294967295ull)));
  if (((llvm_cbe_tmp__646&4294967295U) == (llvm_cbe_tmp__637&4294967295U))) {
    goto llvm_cbe__2e_preheader;
  } else {
    llvm_cbe_storemerge2__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__646;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
}


void get_dht(void) {
  static  unsigned long long aesl_llvm_cbe_4788_count = 0;
  unsigned short llvm_cbe_tmp__647;
  static  unsigned long long aesl_llvm_cbe_4789_count = 0;
  unsigned int llvm_cbe_tmp__648;
  static  unsigned long long aesl_llvm_cbe_4790_count = 0;
  static  unsigned long long aesl_llvm_cbe_4791_count = 0;
  unsigned int llvm_cbe_tmp__649;
  static  unsigned long long aesl_llvm_cbe_4792_count = 0;
  static  unsigned long long aesl_llvm_cbe_4793_count = 0;
  static  unsigned long long aesl_llvm_cbe_4794_count = 0;
  static  unsigned long long aesl_llvm_cbe_4795_count = 0;
  static  unsigned long long aesl_llvm_cbe_4796_count = 0;
  static  unsigned long long aesl_llvm_cbe_4797_count = 0;
  static  unsigned long long aesl_llvm_cbe_4798_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge6_count = 0;
  unsigned int llvm_cbe_storemerge6;
  unsigned int llvm_cbe_storemerge6__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_4799_count = 0;
  unsigned int llvm_cbe_tmp__650;
  static  unsigned long long aesl_llvm_cbe_4800_count = 0;
  static  unsigned long long aesl_llvm_cbe_4801_count = 0;
  static  unsigned long long aesl_llvm_cbe_4802_count = 0;
  static  unsigned long long aesl_llvm_cbe_4803_count = 0;
  static  unsigned long long aesl_llvm_cbe_4804_count = 0;
  static  unsigned long long aesl_llvm_cbe_4805_count = 0;
  static  unsigned long long aesl_llvm_cbe_4806_count = 0;
  static  unsigned long long aesl_llvm_cbe_4807_count = 0;
  unsigned int llvm_cbe_tmp__651;
  static  unsigned long long aesl_llvm_cbe_4808_count = 0;
  static  unsigned long long aesl_llvm_cbe_4809_count = 0;
  static  unsigned long long aesl_llvm_cbe_4810_count = 0;
  unsigned int llvm_cbe_tmp__652;
  static  unsigned long long aesl_llvm_cbe_4811_count = 0;
  static  unsigned long long aesl_llvm_cbe_4812_count = 0;
  static  unsigned long long aesl_llvm_cbe_4813_count = 0;
  static  unsigned long long aesl_llvm_cbe_4814_count = 0;
  static  unsigned long long aesl_llvm_cbe_4815_count = 0;
  static  unsigned long long aesl_llvm_cbe_4816_count = 0;
  static  unsigned long long aesl_llvm_cbe_4817_count = 0;
  static  unsigned long long aesl_llvm_cbe_4818_count = 0;
  unsigned long long llvm_cbe_tmp__653;
  static  unsigned long long aesl_llvm_cbe_4819_count = 0;
  signed int *llvm_cbe_tmp__654;
  static  unsigned long long aesl_llvm_cbe_4820_count = 0;
  static  unsigned long long aesl_llvm_cbe_4821_count = 0;
  static  unsigned long long aesl_llvm_cbe_4822_count = 0;
  static  unsigned long long aesl_llvm_cbe_4823_count = 0;
  signed int *llvm_cbe_tmp__655;
  static  unsigned long long aesl_llvm_cbe_4824_count = 0;
  static  unsigned long long aesl_llvm_cbe_4825_count = 0;
  static  unsigned long long aesl_llvm_cbe_4826_count = 0;
  unsigned long long llvm_cbe_tmp__656;
  static  unsigned long long aesl_llvm_cbe_4827_count = 0;
  signed int *llvm_cbe_tmp__657;
  static  unsigned long long aesl_llvm_cbe_4828_count = 0;
  static  unsigned long long aesl_llvm_cbe_4829_count = 0;
  static  unsigned long long aesl_llvm_cbe_4830_count = 0;
  static  unsigned long long aesl_llvm_cbe_4831_count = 0;
  signed int *llvm_cbe_tmp__658;
  static  unsigned long long aesl_llvm_cbe_4832_count = 0;
  static  unsigned long long aesl_llvm_cbe_4833_count = 0;
  static  unsigned long long aesl_llvm_cbe_4834_count = 0;
  signed int *llvm_cbe_tmp__659;
  signed int *llvm_cbe_tmp__659__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_storemerge1_count = 0;
  signed int *llvm_cbe_storemerge1;
  signed int *llvm_cbe_storemerge1__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_4835_count = 0;
  static  unsigned long long aesl_llvm_cbe_4836_count = 0;
  static  unsigned long long aesl_llvm_cbe_4837_count = 0;
  static  unsigned long long aesl_llvm_cbe_4838_count = 0;
  static  unsigned long long aesl_llvm_cbe_4839_count = 0;
  static  unsigned long long aesl_llvm_cbe_4840_count = 0;
  static  unsigned long long aesl_llvm_cbe_4841_count = 0;
  static  unsigned long long aesl_llvm_cbe_4842_count = 0;
  static  unsigned long long aesl_llvm_cbe_4843_count = 0;
  static  unsigned long long aesl_llvm_cbe_4844_count = 0;
  static  unsigned long long aesl_llvm_cbe_4845_count = 0;
  static  unsigned long long aesl_llvm_cbe_4846_count = 0;
  static  unsigned long long aesl_llvm_cbe_4847_count = 0;
  static  unsigned long long aesl_llvm_cbe_4848_count = 0;
  unsigned int llvm_cbe_tmp__660;
  static  unsigned long long aesl_llvm_cbe_4849_count = 0;
  signed int *llvm_cbe_tmp__661;
  static  unsigned long long aesl_llvm_cbe_4850_count = 0;
  static  unsigned long long aesl_llvm_cbe_4851_count = 0;
  static  unsigned long long aesl_llvm_cbe_4852_count = 0;
  static  unsigned long long aesl_llvm_cbe_4853_count = 0;
  static  unsigned long long aesl_llvm_cbe_4854_count = 0;
  static  unsigned long long aesl_llvm_cbe_4855_count = 0;
  static  unsigned long long aesl_llvm_cbe_4856_count = 0;
  static  unsigned long long aesl_llvm_cbe_4857_count = 0;
  static  unsigned long long aesl_llvm_cbe_4858_count = 0;
  static  unsigned long long aesl_llvm_cbe_4859_count = 0;
  static  unsigned long long aesl_llvm_cbe_4860_count = 0;
  static  unsigned long long aesl_llvm_cbe_4861_count = 0;
  static  unsigned long long aesl_llvm_cbe_4862_count = 0;
  static  unsigned long long aesl_llvm_cbe_4863_count = 0;
  unsigned int llvm_cbe_tmp__662;
  static  unsigned long long aesl_llvm_cbe_4864_count = 0;
  signed int *llvm_cbe_tmp__663;
  static  unsigned long long aesl_llvm_cbe_4865_count = 0;
  static  unsigned long long aesl_llvm_cbe_4866_count = 0;
  unsigned int llvm_cbe_tmp__664;
  static  unsigned long long aesl_llvm_cbe_4867_count = 0;
  static  unsigned long long aesl_llvm_cbe_4868_count = 0;
  static  unsigned long long aesl_llvm_cbe_4869_count = 0;
  static  unsigned long long aesl_llvm_cbe_4870_count = 0;
  static  unsigned long long aesl_llvm_cbe_4871_count = 0;
  static  unsigned long long aesl_llvm_cbe_4872_count = 0;
  static  unsigned long long aesl_llvm_cbe_4873_count = 0;
  static  unsigned long long aesl_llvm_cbe_4874_count = 0;
  static  unsigned long long aesl_llvm_cbe_4875_count = 0;
  static  unsigned long long aesl_llvm_cbe_4876_count = 0;
  static  unsigned long long aesl_llvm_cbe_4877_count = 0;
  static  unsigned long long aesl_llvm_cbe_4878_count = 0;
  static  unsigned long long aesl_llvm_cbe_4879_count = 0;
  unsigned int llvm_cbe_tmp__665;
  static  unsigned long long aesl_llvm_cbe_4880_count = 0;
  signed int *llvm_cbe_tmp__666;
  static  unsigned long long aesl_llvm_cbe_4881_count = 0;
  static  unsigned long long aesl_llvm_cbe_4882_count = 0;
  unsigned int llvm_cbe_tmp__667;
  static  unsigned long long aesl_llvm_cbe_4883_count = 0;
  static  unsigned long long aesl_llvm_cbe_4884_count = 0;
  static  unsigned long long aesl_llvm_cbe_4885_count = 0;
  static  unsigned long long aesl_llvm_cbe_4886_count = 0;
  static  unsigned long long aesl_llvm_cbe_4887_count = 0;
  static  unsigned long long aesl_llvm_cbe_4888_count = 0;
  static  unsigned long long aesl_llvm_cbe_4889_count = 0;
  static  unsigned long long aesl_llvm_cbe_4890_count = 0;
  static  unsigned long long aesl_llvm_cbe_4891_count = 0;
  static  unsigned long long aesl_llvm_cbe_4892_count = 0;
  static  unsigned long long aesl_llvm_cbe_4893_count = 0;
  static  unsigned long long aesl_llvm_cbe_4894_count = 0;
  static  unsigned long long aesl_llvm_cbe_4895_count = 0;
  unsigned int llvm_cbe_tmp__668;
  static  unsigned long long aesl_llvm_cbe_4896_count = 0;
  signed int *llvm_cbe_tmp__669;
  static  unsigned long long aesl_llvm_cbe_4897_count = 0;
  static  unsigned long long aesl_llvm_cbe_4898_count = 0;
  unsigned int llvm_cbe_tmp__670;
  static  unsigned long long aesl_llvm_cbe_4899_count = 0;
  static  unsigned long long aesl_llvm_cbe_4900_count = 0;
  static  unsigned long long aesl_llvm_cbe_4901_count = 0;
  static  unsigned long long aesl_llvm_cbe_4902_count = 0;
  static  unsigned long long aesl_llvm_cbe_4903_count = 0;
  static  unsigned long long aesl_llvm_cbe_4904_count = 0;
  static  unsigned long long aesl_llvm_cbe_4905_count = 0;
  static  unsigned long long aesl_llvm_cbe_4906_count = 0;
  static  unsigned long long aesl_llvm_cbe_4907_count = 0;
  static  unsigned long long aesl_llvm_cbe_4908_count = 0;
  static  unsigned long long aesl_llvm_cbe_4909_count = 0;
  static  unsigned long long aesl_llvm_cbe_4910_count = 0;
  static  unsigned long long aesl_llvm_cbe_4911_count = 0;
  unsigned int llvm_cbe_tmp__671;
  static  unsigned long long aesl_llvm_cbe_4912_count = 0;
  signed int *llvm_cbe_tmp__672;
  static  unsigned long long aesl_llvm_cbe_4913_count = 0;
  static  unsigned long long aesl_llvm_cbe_4914_count = 0;
  unsigned int llvm_cbe_tmp__673;
  static  unsigned long long aesl_llvm_cbe_4915_count = 0;
  static  unsigned long long aesl_llvm_cbe_4916_count = 0;
  static  unsigned long long aesl_llvm_cbe_4917_count = 0;
  static  unsigned long long aesl_llvm_cbe_4918_count = 0;
  static  unsigned long long aesl_llvm_cbe_4919_count = 0;
  static  unsigned long long aesl_llvm_cbe_4920_count = 0;
  static  unsigned long long aesl_llvm_cbe_4921_count = 0;
  static  unsigned long long aesl_llvm_cbe_4922_count = 0;
  static  unsigned long long aesl_llvm_cbe_4923_count = 0;
  static  unsigned long long aesl_llvm_cbe_4924_count = 0;
  static  unsigned long long aesl_llvm_cbe_4925_count = 0;
  static  unsigned long long aesl_llvm_cbe_4926_count = 0;
  static  unsigned long long aesl_llvm_cbe_4927_count = 0;
  unsigned int llvm_cbe_tmp__674;
  static  unsigned long long aesl_llvm_cbe_4928_count = 0;
  signed int *llvm_cbe_tmp__675;
  static  unsigned long long aesl_llvm_cbe_4929_count = 0;
  static  unsigned long long aesl_llvm_cbe_4930_count = 0;
  unsigned int llvm_cbe_tmp__676;
  static  unsigned long long aesl_llvm_cbe_4931_count = 0;
  static  unsigned long long aesl_llvm_cbe_4932_count = 0;
  static  unsigned long long aesl_llvm_cbe_4933_count = 0;
  static  unsigned long long aesl_llvm_cbe_4934_count = 0;
  static  unsigned long long aesl_llvm_cbe_4935_count = 0;
  static  unsigned long long aesl_llvm_cbe_4936_count = 0;
  static  unsigned long long aesl_llvm_cbe_4937_count = 0;
  static  unsigned long long aesl_llvm_cbe_4938_count = 0;
  static  unsigned long long aesl_llvm_cbe_4939_count = 0;
  static  unsigned long long aesl_llvm_cbe_4940_count = 0;
  static  unsigned long long aesl_llvm_cbe_4941_count = 0;
  static  unsigned long long aesl_llvm_cbe_4942_count = 0;
  static  unsigned long long aesl_llvm_cbe_4943_count = 0;
  unsigned int llvm_cbe_tmp__677;
  static  unsigned long long aesl_llvm_cbe_4944_count = 0;
  signed int *llvm_cbe_tmp__678;
  static  unsigned long long aesl_llvm_cbe_4945_count = 0;
  static  unsigned long long aesl_llvm_cbe_4946_count = 0;
  unsigned int llvm_cbe_tmp__679;
  static  unsigned long long aesl_llvm_cbe_4947_count = 0;
  static  unsigned long long aesl_llvm_cbe_4948_count = 0;
  static  unsigned long long aesl_llvm_cbe_4949_count = 0;
  static  unsigned long long aesl_llvm_cbe_4950_count = 0;
  static  unsigned long long aesl_llvm_cbe_4951_count = 0;
  static  unsigned long long aesl_llvm_cbe_4952_count = 0;
  static  unsigned long long aesl_llvm_cbe_4953_count = 0;
  static  unsigned long long aesl_llvm_cbe_4954_count = 0;
  static  unsigned long long aesl_llvm_cbe_4955_count = 0;
  static  unsigned long long aesl_llvm_cbe_4956_count = 0;
  static  unsigned long long aesl_llvm_cbe_4957_count = 0;
  static  unsigned long long aesl_llvm_cbe_4958_count = 0;
  static  unsigned long long aesl_llvm_cbe_4959_count = 0;
  unsigned int llvm_cbe_tmp__680;
  static  unsigned long long aesl_llvm_cbe_4960_count = 0;
  signed int *llvm_cbe_tmp__681;
  static  unsigned long long aesl_llvm_cbe_4961_count = 0;
  static  unsigned long long aesl_llvm_cbe_4962_count = 0;
  unsigned int llvm_cbe_tmp__682;
  static  unsigned long long aesl_llvm_cbe_4963_count = 0;
  static  unsigned long long aesl_llvm_cbe_4964_count = 0;
  static  unsigned long long aesl_llvm_cbe_4965_count = 0;
  static  unsigned long long aesl_llvm_cbe_4966_count = 0;
  static  unsigned long long aesl_llvm_cbe_4967_count = 0;
  static  unsigned long long aesl_llvm_cbe_4968_count = 0;
  static  unsigned long long aesl_llvm_cbe_4969_count = 0;
  static  unsigned long long aesl_llvm_cbe_4970_count = 0;
  static  unsigned long long aesl_llvm_cbe_4971_count = 0;
  static  unsigned long long aesl_llvm_cbe_4972_count = 0;
  static  unsigned long long aesl_llvm_cbe_4973_count = 0;
  static  unsigned long long aesl_llvm_cbe_4974_count = 0;
  static  unsigned long long aesl_llvm_cbe_4975_count = 0;
  unsigned int llvm_cbe_tmp__683;
  static  unsigned long long aesl_llvm_cbe_4976_count = 0;
  signed int *llvm_cbe_tmp__684;
  static  unsigned long long aesl_llvm_cbe_4977_count = 0;
  static  unsigned long long aesl_llvm_cbe_4978_count = 0;
  unsigned int llvm_cbe_tmp__685;
  static  unsigned long long aesl_llvm_cbe_4979_count = 0;
  static  unsigned long long aesl_llvm_cbe_4980_count = 0;
  static  unsigned long long aesl_llvm_cbe_4981_count = 0;
  static  unsigned long long aesl_llvm_cbe_4982_count = 0;
  static  unsigned long long aesl_llvm_cbe_4983_count = 0;
  static  unsigned long long aesl_llvm_cbe_4984_count = 0;
  static  unsigned long long aesl_llvm_cbe_4985_count = 0;
  static  unsigned long long aesl_llvm_cbe_4986_count = 0;
  static  unsigned long long aesl_llvm_cbe_4987_count = 0;
  static  unsigned long long aesl_llvm_cbe_4988_count = 0;
  static  unsigned long long aesl_llvm_cbe_4989_count = 0;
  static  unsigned long long aesl_llvm_cbe_4990_count = 0;
  static  unsigned long long aesl_llvm_cbe_4991_count = 0;
  unsigned int llvm_cbe_tmp__686;
  static  unsigned long long aesl_llvm_cbe_4992_count = 0;
  signed int *llvm_cbe_tmp__687;
  static  unsigned long long aesl_llvm_cbe_4993_count = 0;
  static  unsigned long long aesl_llvm_cbe_4994_count = 0;
  unsigned int llvm_cbe_tmp__688;
  static  unsigned long long aesl_llvm_cbe_4995_count = 0;
  static  unsigned long long aesl_llvm_cbe_4996_count = 0;
  static  unsigned long long aesl_llvm_cbe_4997_count = 0;
  static  unsigned long long aesl_llvm_cbe_4998_count = 0;
  static  unsigned long long aesl_llvm_cbe_4999_count = 0;
  static  unsigned long long aesl_llvm_cbe_5000_count = 0;
  static  unsigned long long aesl_llvm_cbe_5001_count = 0;
  static  unsigned long long aesl_llvm_cbe_5002_count = 0;
  static  unsigned long long aesl_llvm_cbe_5003_count = 0;
  static  unsigned long long aesl_llvm_cbe_5004_count = 0;
  static  unsigned long long aesl_llvm_cbe_5005_count = 0;
  static  unsigned long long aesl_llvm_cbe_5006_count = 0;
  static  unsigned long long aesl_llvm_cbe_5007_count = 0;
  unsigned int llvm_cbe_tmp__689;
  static  unsigned long long aesl_llvm_cbe_5008_count = 0;
  signed int *llvm_cbe_tmp__690;
  static  unsigned long long aesl_llvm_cbe_5009_count = 0;
  static  unsigned long long aesl_llvm_cbe_5010_count = 0;
  unsigned int llvm_cbe_tmp__691;
  static  unsigned long long aesl_llvm_cbe_5011_count = 0;
  static  unsigned long long aesl_llvm_cbe_5012_count = 0;
  static  unsigned long long aesl_llvm_cbe_5013_count = 0;
  static  unsigned long long aesl_llvm_cbe_5014_count = 0;
  static  unsigned long long aesl_llvm_cbe_5015_count = 0;
  static  unsigned long long aesl_llvm_cbe_5016_count = 0;
  static  unsigned long long aesl_llvm_cbe_5017_count = 0;
  static  unsigned long long aesl_llvm_cbe_5018_count = 0;
  static  unsigned long long aesl_llvm_cbe_5019_count = 0;
  static  unsigned long long aesl_llvm_cbe_5020_count = 0;
  static  unsigned long long aesl_llvm_cbe_5021_count = 0;
  static  unsigned long long aesl_llvm_cbe_5022_count = 0;
  static  unsigned long long aesl_llvm_cbe_5023_count = 0;
  unsigned int llvm_cbe_tmp__692;
  static  unsigned long long aesl_llvm_cbe_5024_count = 0;
  signed int *llvm_cbe_tmp__693;
  static  unsigned long long aesl_llvm_cbe_5025_count = 0;
  static  unsigned long long aesl_llvm_cbe_5026_count = 0;
  unsigned int llvm_cbe_tmp__694;
  static  unsigned long long aesl_llvm_cbe_5027_count = 0;
  static  unsigned long long aesl_llvm_cbe_5028_count = 0;
  static  unsigned long long aesl_llvm_cbe_5029_count = 0;
  static  unsigned long long aesl_llvm_cbe_5030_count = 0;
  static  unsigned long long aesl_llvm_cbe_5031_count = 0;
  static  unsigned long long aesl_llvm_cbe_5032_count = 0;
  static  unsigned long long aesl_llvm_cbe_5033_count = 0;
  static  unsigned long long aesl_llvm_cbe_5034_count = 0;
  static  unsigned long long aesl_llvm_cbe_5035_count = 0;
  static  unsigned long long aesl_llvm_cbe_5036_count = 0;
  static  unsigned long long aesl_llvm_cbe_5037_count = 0;
  static  unsigned long long aesl_llvm_cbe_5038_count = 0;
  static  unsigned long long aesl_llvm_cbe_5039_count = 0;
  unsigned int llvm_cbe_tmp__695;
  static  unsigned long long aesl_llvm_cbe_5040_count = 0;
  signed int *llvm_cbe_tmp__696;
  static  unsigned long long aesl_llvm_cbe_5041_count = 0;
  static  unsigned long long aesl_llvm_cbe_5042_count = 0;
  unsigned int llvm_cbe_tmp__697;
  static  unsigned long long aesl_llvm_cbe_5043_count = 0;
  static  unsigned long long aesl_llvm_cbe_5044_count = 0;
  static  unsigned long long aesl_llvm_cbe_5045_count = 0;
  static  unsigned long long aesl_llvm_cbe_5046_count = 0;
  static  unsigned long long aesl_llvm_cbe_5047_count = 0;
  static  unsigned long long aesl_llvm_cbe_5048_count = 0;
  static  unsigned long long aesl_llvm_cbe_5049_count = 0;
  static  unsigned long long aesl_llvm_cbe_5050_count = 0;
  static  unsigned long long aesl_llvm_cbe_5051_count = 0;
  static  unsigned long long aesl_llvm_cbe_5052_count = 0;
  static  unsigned long long aesl_llvm_cbe_5053_count = 0;
  static  unsigned long long aesl_llvm_cbe_5054_count = 0;
  static  unsigned long long aesl_llvm_cbe_5055_count = 0;
  unsigned int llvm_cbe_tmp__698;
  static  unsigned long long aesl_llvm_cbe_5056_count = 0;
  signed int *llvm_cbe_tmp__699;
  static  unsigned long long aesl_llvm_cbe_5057_count = 0;
  static  unsigned long long aesl_llvm_cbe_5058_count = 0;
  unsigned int llvm_cbe_tmp__700;
  static  unsigned long long aesl_llvm_cbe_5059_count = 0;
  static  unsigned long long aesl_llvm_cbe_5060_count = 0;
  static  unsigned long long aesl_llvm_cbe_5061_count = 0;
  static  unsigned long long aesl_llvm_cbe_5062_count = 0;
  static  unsigned long long aesl_llvm_cbe_5063_count = 0;
  static  unsigned long long aesl_llvm_cbe_5064_count = 0;
  static  unsigned long long aesl_llvm_cbe_5065_count = 0;
  static  unsigned long long aesl_llvm_cbe_5066_count = 0;
  static  unsigned long long aesl_llvm_cbe_5067_count = 0;
  static  unsigned long long aesl_llvm_cbe_5068_count = 0;
  static  unsigned long long aesl_llvm_cbe_5069_count = 0;
  static  unsigned long long aesl_llvm_cbe_5070_count = 0;
  static  unsigned long long aesl_llvm_cbe_5071_count = 0;
  unsigned int llvm_cbe_tmp__701;
  static  unsigned long long aesl_llvm_cbe_5072_count = 0;
  signed int *llvm_cbe_tmp__702;
  static  unsigned long long aesl_llvm_cbe_5073_count = 0;
  static  unsigned long long aesl_llvm_cbe_5074_count = 0;
  unsigned int llvm_cbe_tmp__703;
  static  unsigned long long aesl_llvm_cbe_5075_count = 0;
  static  unsigned long long aesl_llvm_cbe_5076_count = 0;
  static  unsigned long long aesl_llvm_cbe_5077_count = 0;
  static  unsigned long long aesl_llvm_cbe_5078_count = 0;
  static  unsigned long long aesl_llvm_cbe_5079_count = 0;
  static  unsigned long long aesl_llvm_cbe_5080_count = 0;
  static  unsigned long long aesl_llvm_cbe_5081_count = 0;
  static  unsigned long long aesl_llvm_cbe_5082_count = 0;
  static  unsigned long long aesl_llvm_cbe_5083_count = 0;
  static  unsigned long long aesl_llvm_cbe_5084_count = 0;
  static  unsigned long long aesl_llvm_cbe_5085_count = 0;
  static  unsigned long long aesl_llvm_cbe_5086_count = 0;
  static  unsigned long long aesl_llvm_cbe_5087_count = 0;
  unsigned int llvm_cbe_tmp__704;
  static  unsigned long long aesl_llvm_cbe_5088_count = 0;
  signed int *llvm_cbe_tmp__705;
  static  unsigned long long aesl_llvm_cbe_5089_count = 0;
  static  unsigned long long aesl_llvm_cbe_5090_count = 0;
  unsigned int llvm_cbe_tmp__706;
  static  unsigned long long aesl_llvm_cbe_5091_count = 0;
  static  unsigned long long aesl_llvm_cbe_5092_count = 0;
  static  unsigned long long aesl_llvm_cbe_5093_count = 0;
  static  unsigned long long aesl_llvm_cbe_5094_count = 0;
  static  unsigned long long aesl_llvm_cbe_5095_count = 0;
  static  unsigned long long aesl_llvm_cbe_5096_count = 0;
  static  unsigned long long aesl_llvm_cbe_5097_count = 0;
  static  unsigned long long aesl_llvm_cbe_5098_count = 0;
  static  unsigned long long aesl_llvm_cbe_5099_count = 0;
  static  unsigned long long aesl_llvm_cbe_5100_count = 0;
  static  unsigned long long aesl_llvm_cbe_5101_count = 0;
  static  unsigned long long aesl_llvm_cbe_5102_count = 0;
  static  unsigned long long aesl_llvm_cbe_5103_count = 0;
  unsigned int llvm_cbe_tmp__707;
  static  unsigned long long aesl_llvm_cbe_5104_count = 0;
  unsigned int llvm_cbe_tmp__708;
  static  unsigned long long aesl_llvm_cbe_5105_count = 0;
  static  unsigned long long aesl_llvm_cbe_5106_count = 0;
  unsigned int llvm_cbe_tmp__709;
  static  unsigned long long aesl_llvm_cbe_5107_count = 0;
  static  unsigned long long aesl_llvm_cbe_5108_count = 0;
  static  unsigned long long aesl_llvm_cbe_5109_count = 0;
  static  unsigned long long aesl_llvm_cbe_5110_count = 0;
  static  unsigned long long aesl_llvm_cbe_5111_count = 0;
  static  unsigned long long aesl_llvm_cbe_5112_count = 0;
  static  unsigned long long aesl_llvm_cbe_5113_count = 0;
  static  unsigned long long aesl_llvm_cbe_5114_count = 0;
  static  unsigned long long aesl_llvm_cbe_5115_count = 0;
  static  unsigned long long aesl_llvm_cbe_5116_count = 0;
  static  unsigned long long aesl_llvm_cbe_5117_count = 0;
  static  unsigned long long aesl_llvm_cbe_5118_count = 0;
  static  unsigned long long aesl_llvm_cbe_5119_count = 0;
  static  unsigned long long aesl_llvm_cbe_5120_count = 0;
  static  unsigned long long aesl_llvm_cbe_5121_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge34_count = 0;
  unsigned int llvm_cbe_storemerge34;
  unsigned int llvm_cbe_storemerge34__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_5122_count = 0;
  unsigned int llvm_cbe_tmp__710;
  static  unsigned long long aesl_llvm_cbe_5123_count = 0;
  unsigned long long llvm_cbe_tmp__711;
  static  unsigned long long aesl_llvm_cbe_5124_count = 0;
  signed int *llvm_cbe_tmp__712;
  static  unsigned long long aesl_llvm_cbe_5125_count = 0;
  static  unsigned long long aesl_llvm_cbe_5126_count = 0;
  unsigned int llvm_cbe_tmp__713;
  static  unsigned long long aesl_llvm_cbe_5127_count = 0;
  static  unsigned long long aesl_llvm_cbe_5128_count = 0;
  static  unsigned long long aesl_llvm_cbe_5129_count = 0;
  static  unsigned long long aesl_llvm_cbe_5130_count = 0;
  static  unsigned long long aesl_llvm_cbe_5131_count = 0;
  static  unsigned long long aesl_llvm_cbe_5132_count = 0;
  static  unsigned long long aesl_llvm_cbe_5133_count = 0;
  static  unsigned long long aesl_llvm_cbe_5134_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_5135_count = 0;
  static  unsigned long long aesl_llvm_cbe_5136_count = 0;
  unsigned int llvm_cbe_tmp__714;
  static  unsigned long long aesl_llvm_cbe_5137_count = 0;
  static  unsigned long long aesl_llvm_cbe_5138_count = 0;
  static  unsigned long long aesl_llvm_cbe_5139_count = 0;
  static  unsigned long long aesl_llvm_cbe_5140_count = 0;
  static  unsigned long long aesl_llvm_cbe_5141_count = 0;
  static  unsigned long long aesl_llvm_cbe_5142_count = 0;
  static  unsigned long long aesl_llvm_cbe_5143_count = 0;
  static  unsigned long long aesl_llvm_cbe_5144_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @get_dht\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call signext i16 @read_word(), !dbg !27 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4788_count);
  llvm_cbe_tmp__647 = (unsigned short ) /*tail*/ read_word();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__647);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i16 %%1 to i32, !dbg !27 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4789_count);
  llvm_cbe_tmp__648 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__647);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__648);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = add nsw i32 %%2, -2, !dbg !27 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4791_count);
  llvm_cbe_tmp__649 = (unsigned int )((unsigned int )(llvm_cbe_tmp__648&4294967295ull)) + ((unsigned int )(4294967294u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__649&4294967295ull)));
  if ((((signed int )llvm_cbe_tmp__649) > ((signed int )16u))) {
    llvm_cbe_storemerge6__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__649;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph8;
  } else {
    goto llvm_cbe__2e__crit_edge9;
  }

  do {     /* Syntactic loop '.lr.ph8' to make GCC happy */
llvm_cbe__2e_lr_2e_ph8:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge6 = phi i32 [ %%74, %%._crit_edge ], [ %%3, %%0  for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_storemerge6_count);
  llvm_cbe_storemerge6 = (unsigned int )llvm_cbe_storemerge6__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge6 = 0x%X",llvm_cbe_storemerge6);
printf("\n = 0x%X",llvm_cbe_tmp__714);
printf("\n = 0x%X",llvm_cbe_tmp__649);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = tail call i32 @read_byte(), !dbg !28 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4799_count);
  llvm_cbe_tmp__650 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__650);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = and i32 %%5, 16, !dbg !28 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4807_count);
  llvm_cbe_tmp__651 = (unsigned int )llvm_cbe_tmp__650 & 16u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__651);
  if (((llvm_cbe_tmp__651&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__715;
  } else {
    goto llvm_cbe_tmp__716;
  }

llvm_cbe__2e__crit_edge:
if (AESL_DEBUG_TRACE)
printf("\n  %%74 = sub i32 %%68, %%65, !dbg !27 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5136_count);
  llvm_cbe_tmp__714 = (unsigned int )((unsigned int )(llvm_cbe_tmp__709&4294967295ull)) - ((unsigned int )(llvm_cbe_tmp__706&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__714&4294967295ull)));
  if ((((signed int )llvm_cbe_tmp__714) > ((signed int )16u))) {
    llvm_cbe_storemerge6__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__714;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph8;
  } else {
    goto llvm_cbe__2e__crit_edge9;
  }

llvm_cbe_tmp__717:
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = phi i32* [ %%15, %%13 ], [ %%11, %%8  for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4834_count);
  llvm_cbe_tmp__659 = (signed int *)llvm_cbe_tmp__659__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge1 = phi i32* [ %%16, %%13 ], [ %%12, %%8  for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_storemerge1_count);
  llvm_cbe_storemerge1 = (signed int *)llvm_cbe_storemerge1__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4848_count);
  llvm_cbe_tmp__660 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__660);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = getelementptr inbounds i32* %%18, i64 1, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4849_count);
  llvm_cbe_tmp__661 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )1ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%19, i32* %%20, align 4, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4850_count);
  *llvm_cbe_tmp__661 = llvm_cbe_tmp__660;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__660);
if (AESL_DEBUG_TRACE)
printf("\n  %%21 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4863_count);
  llvm_cbe_tmp__662 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__662);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = getelementptr inbounds i32* %%18, i64 2, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4864_count);
  llvm_cbe_tmp__663 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )2ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%21, i32* %%22, align 8, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4865_count);
  *llvm_cbe_tmp__663 = llvm_cbe_tmp__662;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__662);
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = add nsw i32 %%21, %%19, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4866_count);
  llvm_cbe_tmp__664 = (unsigned int )((unsigned int )(llvm_cbe_tmp__662&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__660&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__664&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4879_count);
  llvm_cbe_tmp__665 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__665);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds i32* %%18, i64 3, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4880_count);
  llvm_cbe_tmp__666 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )3ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%24, i32* %%25, align 4, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4881_count);
  *llvm_cbe_tmp__666 = llvm_cbe_tmp__665;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__665);
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = add nsw i32 %%24, %%23, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4882_count);
  llvm_cbe_tmp__667 = (unsigned int )((unsigned int )(llvm_cbe_tmp__665&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__664&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__667&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4895_count);
  llvm_cbe_tmp__668 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__668);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = getelementptr inbounds i32* %%18, i64 4, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4896_count);
  llvm_cbe_tmp__669 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )4ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%27, i32* %%28, align 16, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4897_count);
  *llvm_cbe_tmp__669 = llvm_cbe_tmp__668;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__668);
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = add nsw i32 %%27, %%26, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4898_count);
  llvm_cbe_tmp__670 = (unsigned int )((unsigned int )(llvm_cbe_tmp__668&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__667&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__670&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%30 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4911_count);
  llvm_cbe_tmp__671 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__671);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%31 = getelementptr inbounds i32* %%18, i64 5, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4912_count);
  llvm_cbe_tmp__672 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )5ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%30, i32* %%31, align 4, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4913_count);
  *llvm_cbe_tmp__672 = llvm_cbe_tmp__671;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__671);
if (AESL_DEBUG_TRACE)
printf("\n  %%32 = add nsw i32 %%30, %%29, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4914_count);
  llvm_cbe_tmp__673 = (unsigned int )((unsigned int )(llvm_cbe_tmp__671&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__670&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__673&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%33 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4927_count);
  llvm_cbe_tmp__674 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__674);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%34 = getelementptr inbounds i32* %%18, i64 6, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4928_count);
  llvm_cbe_tmp__675 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )6ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%33, i32* %%34, align 8, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4929_count);
  *llvm_cbe_tmp__675 = llvm_cbe_tmp__674;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__674);
if (AESL_DEBUG_TRACE)
printf("\n  %%35 = add nsw i32 %%33, %%32, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4930_count);
  llvm_cbe_tmp__676 = (unsigned int )((unsigned int )(llvm_cbe_tmp__674&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__673&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__676&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%36 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4943_count);
  llvm_cbe_tmp__677 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__677);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%37 = getelementptr inbounds i32* %%18, i64 7, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4944_count);
  llvm_cbe_tmp__678 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )7ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%36, i32* %%37, align 4, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4945_count);
  *llvm_cbe_tmp__678 = llvm_cbe_tmp__677;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__677);
if (AESL_DEBUG_TRACE)
printf("\n  %%38 = add nsw i32 %%36, %%35, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4946_count);
  llvm_cbe_tmp__679 = (unsigned int )((unsigned int )(llvm_cbe_tmp__677&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__676&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__679&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%39 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4959_count);
  llvm_cbe_tmp__680 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__680);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%40 = getelementptr inbounds i32* %%18, i64 8, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4960_count);
  llvm_cbe_tmp__681 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )8ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%39, i32* %%40, align 16, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4961_count);
  *llvm_cbe_tmp__681 = llvm_cbe_tmp__680;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__680);
if (AESL_DEBUG_TRACE)
printf("\n  %%41 = add nsw i32 %%39, %%38, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4962_count);
  llvm_cbe_tmp__682 = (unsigned int )((unsigned int )(llvm_cbe_tmp__680&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__679&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__682&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%42 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4975_count);
  llvm_cbe_tmp__683 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__683);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%43 = getelementptr inbounds i32* %%18, i64 9, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4976_count);
  llvm_cbe_tmp__684 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )9ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%42, i32* %%43, align 4, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4977_count);
  *llvm_cbe_tmp__684 = llvm_cbe_tmp__683;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__683);
if (AESL_DEBUG_TRACE)
printf("\n  %%44 = add nsw i32 %%42, %%41, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4978_count);
  llvm_cbe_tmp__685 = (unsigned int )((unsigned int )(llvm_cbe_tmp__683&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__682&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__685&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%45 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4991_count);
  llvm_cbe_tmp__686 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__686);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%46 = getelementptr inbounds i32* %%18, i64 10, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4992_count);
  llvm_cbe_tmp__687 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )10ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%45, i32* %%46, align 8, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4993_count);
  *llvm_cbe_tmp__687 = llvm_cbe_tmp__686;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__686);
if (AESL_DEBUG_TRACE)
printf("\n  %%47 = add nsw i32 %%45, %%44, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4994_count);
  llvm_cbe_tmp__688 = (unsigned int )((unsigned int )(llvm_cbe_tmp__686&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__685&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__688&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%48 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5007_count);
  llvm_cbe_tmp__689 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__689);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%49 = getelementptr inbounds i32* %%18, i64 11, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5008_count);
  llvm_cbe_tmp__690 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )11ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%48, i32* %%49, align 4, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5009_count);
  *llvm_cbe_tmp__690 = llvm_cbe_tmp__689;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__689);
if (AESL_DEBUG_TRACE)
printf("\n  %%50 = add nsw i32 %%48, %%47, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5010_count);
  llvm_cbe_tmp__691 = (unsigned int )((unsigned int )(llvm_cbe_tmp__689&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__688&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__691&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%51 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5023_count);
  llvm_cbe_tmp__692 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__692);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%52 = getelementptr inbounds i32* %%18, i64 12, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5024_count);
  llvm_cbe_tmp__693 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )12ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%51, i32* %%52, align 16, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5025_count);
  *llvm_cbe_tmp__693 = llvm_cbe_tmp__692;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__692);
if (AESL_DEBUG_TRACE)
printf("\n  %%53 = add nsw i32 %%51, %%50, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5026_count);
  llvm_cbe_tmp__694 = (unsigned int )((unsigned int )(llvm_cbe_tmp__692&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__691&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__694&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%54 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5039_count);
  llvm_cbe_tmp__695 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__695);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%55 = getelementptr inbounds i32* %%18, i64 13, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5040_count);
  llvm_cbe_tmp__696 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )13ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%54, i32* %%55, align 4, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5041_count);
  *llvm_cbe_tmp__696 = llvm_cbe_tmp__695;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__695);
if (AESL_DEBUG_TRACE)
printf("\n  %%56 = add nsw i32 %%54, %%53, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5042_count);
  llvm_cbe_tmp__697 = (unsigned int )((unsigned int )(llvm_cbe_tmp__695&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__694&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__697&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%57 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5055_count);
  llvm_cbe_tmp__698 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__698);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%58 = getelementptr inbounds i32* %%18, i64 14, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5056_count);
  llvm_cbe_tmp__699 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )14ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%57, i32* %%58, align 8, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5057_count);
  *llvm_cbe_tmp__699 = llvm_cbe_tmp__698;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__698);
if (AESL_DEBUG_TRACE)
printf("\n  %%59 = add nsw i32 %%57, %%56, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5058_count);
  llvm_cbe_tmp__700 = (unsigned int )((unsigned int )(llvm_cbe_tmp__698&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__697&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__700&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%60 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5071_count);
  llvm_cbe_tmp__701 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__701);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%61 = getelementptr inbounds i32* %%18, i64 15, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5072_count);
  llvm_cbe_tmp__702 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )15ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%60, i32* %%61, align 4, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5073_count);
  *llvm_cbe_tmp__702 = llvm_cbe_tmp__701;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__701);
if (AESL_DEBUG_TRACE)
printf("\n  %%62 = add nsw i32 %%60, %%59, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5074_count);
  llvm_cbe_tmp__703 = (unsigned int )((unsigned int )(llvm_cbe_tmp__701&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__700&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__703&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%63 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5087_count);
  llvm_cbe_tmp__704 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__704);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%64 = getelementptr inbounds i32* %%18, i64 16, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5088_count);
  llvm_cbe_tmp__705 = (signed int *)(&llvm_cbe_tmp__659[(((signed long long )16ull))]);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%63, i32* %%64, align 16, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5089_count);
  *llvm_cbe_tmp__705 = llvm_cbe_tmp__704;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__704);
if (AESL_DEBUG_TRACE)
printf("\n  %%65 = add nsw i32 %%63, %%62, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5090_count);
  llvm_cbe_tmp__706 = (unsigned int )((unsigned int )(llvm_cbe_tmp__704&4294967295ull)) + ((unsigned int )(llvm_cbe_tmp__703&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__706&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%66 = load i32* @i_get_dht, align 4, !dbg !30 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5103_count);
  llvm_cbe_tmp__707 = (unsigned int )*(&i_get_dht);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__707);
if (AESL_DEBUG_TRACE)
printf("\n  %%67 = add nsw i32 %%66, 1, !dbg !30 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5104_count);
  llvm_cbe_tmp__708 = (unsigned int )((unsigned int )(llvm_cbe_tmp__707&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__708&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%67, i32* @i_get_dht, align 4, !dbg !30 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5105_count);
  *(&i_get_dht) = llvm_cbe_tmp__708;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__708);
if (AESL_DEBUG_TRACE)
printf("\n  %%68 = add nsw i32 %%storemerge6, -17, !dbg !27 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5106_count);
  llvm_cbe_tmp__709 = (unsigned int )((unsigned int )(llvm_cbe_storemerge6&4294967295ull)) + ((unsigned int )(4294967279u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__709&4294967295ull)));
  if ((((signed int )llvm_cbe_tmp__706) > ((signed int )0u))) {
    llvm_cbe_storemerge34__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

llvm_cbe_tmp__716:
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add nsw i32 %%5, -16, !dbg !28 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4810_count);
  llvm_cbe_tmp__652 = (unsigned int )((unsigned int )(llvm_cbe_tmp__650&4294967295ull)) + ((unsigned int )(4294967280u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__652&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = sext i32 %%9 to i64, !dbg !28 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4818_count);
  llvm_cbe_tmp__653 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__652);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__653);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = getelementptr inbounds [2 x [36 x i32]]* @p_jinfo_ac_xhuff_tbl_bits, i64 0, i64 %%10, i64 0, !dbg !28 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4819_count);
  llvm_cbe_tmp__654 = (signed int *)(&p_jinfo_ac_xhuff_tbl_bits[(((signed long long )llvm_cbe_tmp__653))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__653));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = getelementptr inbounds [2 x [257 x i32]]* @p_jinfo_ac_xhuff_tbl_huffval, i64 0, i64 %%10, i64 0, !dbg !28 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4823_count);
  llvm_cbe_tmp__655 = (signed int *)(&p_jinfo_ac_xhuff_tbl_huffval[(((signed long long )llvm_cbe_tmp__653))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 257
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__653));
}
  llvm_cbe_tmp__659__PHI_TEMPORARY = (signed int *)llvm_cbe_tmp__654;   /* for PHI node */
  llvm_cbe_storemerge1__PHI_TEMPORARY = (signed int *)llvm_cbe_tmp__655;   /* for PHI node */
  goto llvm_cbe_tmp__717;

llvm_cbe_tmp__715:
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = sext i32 %%5 to i64, !dbg !28 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4826_count);
  llvm_cbe_tmp__656 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__650);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__656);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = getelementptr inbounds [2 x [36 x i32]]* @p_jinfo_dc_xhuff_tbl_bits, i64 0, i64 %%14, i64 0, !dbg !28 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4827_count);
  llvm_cbe_tmp__657 = (signed int *)(&p_jinfo_dc_xhuff_tbl_bits[(((signed long long )llvm_cbe_tmp__656))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__656));
}
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = getelementptr inbounds [2 x [257 x i32]]* @p_jinfo_dc_xhuff_tbl_huffval, i64 0, i64 %%14, i64 0, !dbg !28 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_4831_count);
  llvm_cbe_tmp__658 = (signed int *)(&p_jinfo_dc_xhuff_tbl_huffval[(((signed long long )llvm_cbe_tmp__656))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 257
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__656));
}
  llvm_cbe_tmp__659__PHI_TEMPORARY = (signed int *)llvm_cbe_tmp__657;   /* for PHI node */
  llvm_cbe_storemerge1__PHI_TEMPORARY = (signed int *)llvm_cbe_tmp__658;   /* for PHI node */
  goto llvm_cbe_tmp__717;

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge34 = phi i32 [ %%73, %%.lr.ph ], [ 0, %%17  for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_storemerge34_count);
  llvm_cbe_storemerge34 = (unsigned int )llvm_cbe_storemerge34__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge34 = 0x%X",llvm_cbe_storemerge34);
printf("\n = 0x%X",llvm_cbe_tmp__713);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%70 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5122_count);
  llvm_cbe_tmp__710 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__710);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%71 = sext i32 %%storemerge34 to i64, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5123_count);
  llvm_cbe_tmp__711 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge34);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__711);
if (AESL_DEBUG_TRACE)
printf("\n  %%72 = getelementptr inbounds i32* %%storemerge1, i64 %%71, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5124_count);
  llvm_cbe_tmp__712 = (signed int *)(&llvm_cbe_storemerge1[(((signed long long )llvm_cbe_tmp__711))]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__711));
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%70, i32* %%72, align 4, !dbg !29 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5125_count);
  *llvm_cbe_tmp__712 = llvm_cbe_tmp__710;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__710);
if (AESL_DEBUG_TRACE)
printf("\n  %%73 = add nsw i32 %%storemerge34, 1, !dbg !30 for 0x%llxth hint within @get_dht  --> \n", ++aesl_llvm_cbe_5126_count);
  llvm_cbe_tmp__713 = (unsigned int )((unsigned int )(llvm_cbe_storemerge34&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__713&4294967295ull)));
  if (((llvm_cbe_tmp__713&4294967295U) == (llvm_cbe_tmp__706&4294967295U))) {
    goto llvm_cbe__2e__crit_edge;
  } else {
    llvm_cbe_storemerge34__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__713;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  }

  } while (1); /* end of syntactic loop '.lr.ph' */
  } while (1); /* end of syntactic loop '.lr.ph8' */
llvm_cbe__2e__crit_edge9:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @get_dht}\n");
  return;
}


void get_dqt(void) {
  static  unsigned long long aesl_llvm_cbe_5145_count = 0;
  unsigned short llvm_cbe_tmp__718;
  static  unsigned long long aesl_llvm_cbe_5146_count = 0;
  unsigned int llvm_cbe_tmp__719;
  static  unsigned long long aesl_llvm_cbe_5147_count = 0;
  static  unsigned long long aesl_llvm_cbe_5148_count = 0;
  unsigned int llvm_cbe_tmp__720;
  static  unsigned long long aesl_llvm_cbe_5149_count = 0;
  static  unsigned long long aesl_llvm_cbe_5150_count = 0;
  static  unsigned long long aesl_llvm_cbe_5151_count = 0;
  static  unsigned long long aesl_llvm_cbe_5152_count = 0;
  static  unsigned long long aesl_llvm_cbe_5153_count = 0;
  static  unsigned long long aesl_llvm_cbe_5154_count = 0;
  static  unsigned long long aesl_llvm_cbe_5155_count = 0;
  static  unsigned long long aesl_llvm_cbe_5156_count = 0;
  unsigned int llvm_cbe_tmp__721;
  unsigned int llvm_cbe_tmp__721__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_5157_count = 0;
  unsigned int llvm_cbe_tmp__722;
  static  unsigned long long aesl_llvm_cbe_5158_count = 0;
  static  unsigned long long aesl_llvm_cbe_5159_count = 0;
  static  unsigned long long aesl_llvm_cbe_5160_count = 0;
  static  unsigned long long aesl_llvm_cbe_5161_count = 0;
  unsigned int llvm_cbe_tmp__723;
  static  unsigned long long aesl_llvm_cbe_5162_count = 0;
  static  unsigned long long aesl_llvm_cbe_5163_count = 0;
  unsigned int llvm_cbe_tmp__724;
  static  unsigned long long aesl_llvm_cbe_5164_count = 0;
  unsigned int llvm_cbe_tmp__725;
  static  unsigned long long aesl_llvm_cbe_5165_count = 0;
  static  unsigned long long aesl_llvm_cbe_5166_count = 0;
  static  unsigned long long aesl_llvm_cbe_5167_count = 0;
  unsigned long long llvm_cbe_tmp__726;
  static  unsigned long long aesl_llvm_cbe_5168_count = 0;
  static  unsigned long long aesl_llvm_cbe_5169_count = 0;
  static  unsigned long long aesl_llvm_cbe_5170_count = 0;
  static  unsigned long long aesl_llvm_cbe_5171_count = 0;
  static  unsigned long long aesl_llvm_cbe_5172_count = 0;
  static  unsigned long long aesl_llvm_cbe_5173_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge2_2e_us_count = 0;
  unsigned int llvm_cbe_storemerge2_2e_us;
  unsigned int llvm_cbe_storemerge2_2e_us__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_5174_count = 0;
  unsigned int llvm_cbe_tmp__727;
  static  unsigned long long aesl_llvm_cbe_5175_count = 0;
  static  unsigned long long aesl_llvm_cbe_phitmp_count = 0;
  unsigned short llvm_cbe_phitmp;
  static  unsigned long long aesl_llvm_cbe_5176_count = 0;
  static  unsigned long long aesl_llvm_cbe_5177_count = 0;
  unsigned int llvm_cbe_tmp__728;
  static  unsigned long long aesl_llvm_cbe_5178_count = 0;
  unsigned long long llvm_cbe_tmp__729;
  static  unsigned long long aesl_llvm_cbe_5179_count = 0;
  signed int *llvm_cbe_tmp__730;
  static  unsigned long long aesl_llvm_cbe_5180_count = 0;
  unsigned int llvm_cbe_tmp__731;
  static  unsigned long long aesl_llvm_cbe_5181_count = 0;
  unsigned long long llvm_cbe_tmp__732;
  static  unsigned long long aesl_llvm_cbe__2e_sum_2e_us_count = 0;
  unsigned long long llvm_cbe__2e_sum_2e_us;
  static  unsigned long long aesl_llvm_cbe_5182_count = 0;
  signed int *llvm_cbe_tmp__733;
  static  unsigned long long aesl_llvm_cbe_5183_count = 0;
  static  unsigned long long aesl_llvm_cbe_5184_count = 0;
  unsigned int llvm_cbe_tmp__734;
  static  unsigned long long aesl_llvm_cbe_5185_count = 0;
  static  unsigned long long aesl_llvm_cbe_5186_count = 0;
  static  unsigned long long aesl_llvm_cbe_5187_count = 0;
  static  unsigned long long aesl_llvm_cbe_5188_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond_count = 0;
  static  unsigned long long aesl_llvm_cbe_5189_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge2_count = 0;
  unsigned int llvm_cbe_storemerge2;
  unsigned int llvm_cbe_storemerge2__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_5190_count = 0;
  unsigned short llvm_cbe_tmp__735;
  static  unsigned long long aesl_llvm_cbe_5191_count = 0;
  static  unsigned long long aesl_llvm_cbe_5192_count = 0;
  unsigned int llvm_cbe_tmp__736;
  static  unsigned long long aesl_llvm_cbe_5193_count = 0;
  unsigned long long llvm_cbe_tmp__737;
  static  unsigned long long aesl_llvm_cbe_5194_count = 0;
  signed int *llvm_cbe_tmp__738;
  static  unsigned long long aesl_llvm_cbe_5195_count = 0;
  unsigned int llvm_cbe_tmp__739;
  static  unsigned long long aesl_llvm_cbe_5196_count = 0;
  unsigned long long llvm_cbe_tmp__740;
  static  unsigned long long aesl_llvm_cbe__2e_sum_count = 0;
  unsigned long long llvm_cbe__2e_sum;
  static  unsigned long long aesl_llvm_cbe_5197_count = 0;
  signed int *llvm_cbe_tmp__741;
  static  unsigned long long aesl_llvm_cbe_5198_count = 0;
  static  unsigned long long aesl_llvm_cbe_5199_count = 0;
  unsigned int llvm_cbe_tmp__742;
  static  unsigned long long aesl_llvm_cbe_5200_count = 0;
  static  unsigned long long aesl_llvm_cbe_5201_count = 0;
  static  unsigned long long aesl_llvm_cbe_5202_count = 0;
  static  unsigned long long aesl_llvm_cbe_5203_count = 0;
  static  unsigned long long aesl_llvm_cbe_exitcond3_count = 0;
  static  unsigned long long aesl_llvm_cbe_5204_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e__2e_v_count = 0;
  unsigned int llvm_cbe__2e__2e_v;
  static  unsigned long long aesl_llvm_cbe__2e__count = 0;
  unsigned int llvm_cbe__2e_;
  static  unsigned long long aesl_llvm_cbe_5205_count = 0;
  static  unsigned long long aesl_llvm_cbe_5206_count = 0;
  static  unsigned long long aesl_llvm_cbe_5207_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @get_dqt\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = tail call signext i16 @read_word(), !dbg !27 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5145_count);
  llvm_cbe_tmp__718 = (unsigned short ) /*tail*/ read_word();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__718);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i16 %%1 to i32, !dbg !27 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5146_count);
  llvm_cbe_tmp__719 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__718);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__719);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = add nsw i32 %%2, -2, !dbg !27 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5148_count);
  llvm_cbe_tmp__720 = (unsigned int )((unsigned int )(llvm_cbe_tmp__719&4294967295ull)) + ((unsigned int )(4294967294u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__720&4294967295ull)));
  if ((((signed int )llvm_cbe_tmp__720) > ((signed int )0u))) {
    llvm_cbe_tmp__721__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__720;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '.lr.ph' to make GCC happy */
llvm_cbe__2e_lr_2e_ph:
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = phi i32 [ %%., %%.us-lcssa.us ], [ %%3, %%0  for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5156_count);
  llvm_cbe_tmp__721 = (unsigned int )llvm_cbe_tmp__721__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__721);
printf("\n. = 0x%X",llvm_cbe__2e_);
printf("\n = 0x%X",llvm_cbe_tmp__720);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = tail call i32 @read_byte(), !dbg !28 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5157_count);
  llvm_cbe_tmp__722 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__722);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = and i32 %%6, 15, !dbg !28 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5161_count);
  llvm_cbe_tmp__723 = (unsigned int )llvm_cbe_tmp__722 & 15u;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__723);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = load i32* @i_get_dqt, align 4, !dbg !28 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5163_count);
  llvm_cbe_tmp__724 = (unsigned int )*(&i_get_dqt);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__724);
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = add nsw i32 %%8, 1, !dbg !28 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5164_count);
  llvm_cbe_tmp__725 = (unsigned int )((unsigned int )(llvm_cbe_tmp__724&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__725&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%9, i32* @i_get_dqt, align 4, !dbg !28 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5165_count);
  *(&i_get_dqt) = llvm_cbe_tmp__725;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__725);
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = zext i32 %%7 to i64, !dbg !28 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5167_count);
  llvm_cbe_tmp__726 = (unsigned long long )((unsigned long long )(unsigned int )llvm_cbe_tmp__723&4294967295U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__726);
  if ((((unsigned int )llvm_cbe_tmp__722&4294967295U) < ((unsigned int )16u&4294967295U))) {
    llvm_cbe_storemerge2_2e_us__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe_tmp__743;
  } else {
    llvm_cbe_storemerge2__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
    goto llvm_cbe_tmp__744;
  }

llvm_cbe__2e_us_2d_lcssa_2e_us:
if (AESL_DEBUG_TRACE)
printf("\n  %%..v = select i1 %%11, i32 -65, i32 -129, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe__2e__2e_v_count);
  llvm_cbe__2e__2e_v = (unsigned int )(((((unsigned int )llvm_cbe_tmp__722&4294967295U) < ((unsigned int )16u&4294967295U))) ? ((unsigned int )4294967231u) : ((unsigned int )4294967167u));
if (AESL_DEBUG_TRACE)
printf("\n..v = 0x%X\n", llvm_cbe__2e__2e_v);
if (AESL_DEBUG_TRACE)
printf("\n  %%. = add i32 %%5, %%..v, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe__2e__count);
  llvm_cbe__2e_ = (unsigned int )((unsigned int )(llvm_cbe_tmp__721&4294967295ull)) + ((unsigned int )(llvm_cbe__2e__2e_v&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n. = 0x%X\n", ((unsigned int )(llvm_cbe__2e_&4294967295ull)));
  if ((((signed int )llvm_cbe__2e_) > ((signed int )0u))) {
    llvm_cbe_tmp__721__PHI_TEMPORARY = (unsigned int )llvm_cbe__2e_;   /* for PHI node */
    goto llvm_cbe__2e_lr_2e_ph;
  } else {
    goto llvm_cbe__2e__crit_edge;
  }

  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__743:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge2.us = phi i32 [ %%20, %%12 ], [ 0, %%.lr.ph  for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_storemerge2_2e_us_count);
  llvm_cbe_storemerge2_2e_us = (unsigned int )llvm_cbe_storemerge2_2e_us__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge2.us = 0x%X",llvm_cbe_storemerge2_2e_us);
printf("\n = 0x%X",llvm_cbe_tmp__734);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = tail call i32 @read_byte(), !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5174_count);
  llvm_cbe_tmp__727 = (unsigned int ) /*tail*/ read_byte();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__727);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%phitmp = trunc i32 %%13 to i1 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_phitmp_count);
  llvm_cbe_phitmp = (unsigned short )((unsigned short )llvm_cbe_tmp__727&65535U);
if (AESL_DEBUG_TRACE)
printf("\nphitmp = 0x%X\n", llvm_cbe_phitmp);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = zext i16 %%phitmp to i32, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5177_count);
  llvm_cbe_tmp__728 = (unsigned int )((unsigned int )(unsigned short )llvm_cbe_phitmp&65535U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__728);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = sext i32 %%storemerge2.us to i64, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5178_count);
  llvm_cbe_tmp__729 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge2_2e_us);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__729);
if (AESL_DEBUG_TRACE)
printf("\n  %%16 = getelementptr inbounds [64 x i32]* @izigzag_index, i64 0, i64 %%15, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5179_count);
  llvm_cbe_tmp__730 = (signed int *)(&izigzag_index[(((signed long long )llvm_cbe_tmp__729))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__729));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__729) < 64)) fprintf(stderr, "%s:%d: warning: Read access out of array 'izigzag_index' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%17 = load i32* %%16, align 4, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5180_count);
  llvm_cbe_tmp__731 = (unsigned int )*llvm_cbe_tmp__730;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__731);
if (AESL_DEBUG_TRACE)
printf("\n  %%18 = sext i32 %%17 to i64, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5181_count);
  llvm_cbe_tmp__732 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__731);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__732);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum.us = add i64 %%18, 64, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe__2e_sum_2e_us_count);
  llvm_cbe__2e_sum_2e_us = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__732&18446744073709551615ull)) + ((unsigned long long )(64ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum.us = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum_2e_us&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%19 = getelementptr inbounds [4 x [64 x i32]]* @p_jinfo_quant_tbl_quantval, i64 0, i64 %%10, i64 %%.sum.us, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5182_count);
  llvm_cbe_tmp__733 = (signed int *)(&p_jinfo_quant_tbl_quantval[(((signed long long )llvm_cbe_tmp__726))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )llvm_cbe__2e_sum_2e_us))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__726));
printf("\n.sum.us = 0x%llX",((signed long long )llvm_cbe__2e_sum_2e_us));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__726) < 4 && "Write access out of array 'p_jinfo_quant_tbl_quantval' bound?");
  assert(((signed long long )llvm_cbe__2e_sum_2e_us) < 64 && "Write access out of array 'p_jinfo_quant_tbl_quantval' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%14, i32* %%19, align 4, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5183_count);
  *llvm_cbe_tmp__733 = llvm_cbe_tmp__728;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__728);
if (AESL_DEBUG_TRACE)
printf("\n  %%20 = add nsw i32 %%storemerge2.us, 1, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5184_count);
  llvm_cbe_tmp__734 = (unsigned int )((unsigned int )(llvm_cbe_storemerge2_2e_us&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__734&4294967295ull)));
  if (((llvm_cbe_tmp__734&4294967295U) == (64u&4294967295U))) {
    goto llvm_cbe__2e_us_2d_lcssa_2e_us;
  } else {
    llvm_cbe_storemerge2_2e_us__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__734;   /* for PHI node */
    goto llvm_cbe_tmp__743;
  }

  } while (1); /* end of syntactic loop '' */
  do {     /* Syntactic loop '' to make GCC happy */
llvm_cbe_tmp__744:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge2 = phi i32 [ %%29, %%21 ], [ 0, %%.lr.ph  for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_storemerge2_count);
  llvm_cbe_storemerge2 = (unsigned int )llvm_cbe_storemerge2__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge2 = 0x%X",llvm_cbe_storemerge2);
printf("\n = 0x%X",llvm_cbe_tmp__742);
printf("\n = 0x%X",0u);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%22 = tail call signext i16 @read_word(), !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5190_count);
  llvm_cbe_tmp__735 = (unsigned short ) /*tail*/ read_word();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__735);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%23 = zext i16 %%22 to i32, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5192_count);
  llvm_cbe_tmp__736 = (unsigned int )((unsigned int )(unsigned short )llvm_cbe_tmp__735&65535U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__736);
if (AESL_DEBUG_TRACE)
printf("\n  %%24 = sext i32 %%storemerge2 to i64, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5193_count);
  llvm_cbe_tmp__737 = (unsigned long long )((signed long long )(signed int )llvm_cbe_storemerge2);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__737);
if (AESL_DEBUG_TRACE)
printf("\n  %%25 = getelementptr inbounds [64 x i32]* @izigzag_index, i64 0, i64 %%24, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5194_count);
  llvm_cbe_tmp__738 = (signed int *)(&izigzag_index[(((signed long long )llvm_cbe_tmp__737))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__737));
}

#ifdef AESL_BC_SIM
  if (!(((signed long long )llvm_cbe_tmp__737) < 64)) fprintf(stderr, "%s:%d: warning: Read access out of array 'izigzag_index' bound?\n", __FILE__, __LINE__);

#endif
if (AESL_DEBUG_TRACE)
printf("\n  %%26 = load i32* %%25, align 4, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5195_count);
  llvm_cbe_tmp__739 = (unsigned int )*llvm_cbe_tmp__738;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__739);
if (AESL_DEBUG_TRACE)
printf("\n  %%27 = sext i32 %%26 to i64, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5196_count);
  llvm_cbe_tmp__740 = (unsigned long long )((signed long long )(signed int )llvm_cbe_tmp__739);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__740);
if (AESL_DEBUG_TRACE)
printf("\n  %%.sum = add i64 %%27, 64, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe__2e_sum_count);
  llvm_cbe__2e_sum = (unsigned long long )((unsigned long long )(llvm_cbe_tmp__740&18446744073709551615ull)) + ((unsigned long long )(64ull&18446744073709551615ull));
if (AESL_DEBUG_TRACE)
printf("\n.sum = 0x%llX\n", ((unsigned long long )(llvm_cbe__2e_sum&18446744073709551615ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%28 = getelementptr inbounds [4 x [64 x i32]]* @p_jinfo_quant_tbl_quantval, i64 0, i64 %%10, i64 %%.sum, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5197_count);
  llvm_cbe_tmp__741 = (signed int *)(&p_jinfo_quant_tbl_quantval[(((signed long long )llvm_cbe_tmp__726))
#ifdef AESL_BC_SIM
 % 4
#endif
][(((signed long long )llvm_cbe__2e_sum))
#ifdef AESL_BC_SIM
 % 64
#endif
]);
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%llX",((signed long long )llvm_cbe_tmp__726));
printf("\n.sum = 0x%llX",((signed long long )llvm_cbe__2e_sum));
}

#ifdef AESL_BC_SIM
  assert(((signed long long )llvm_cbe_tmp__726) < 4 && "Write access out of array 'p_jinfo_quant_tbl_quantval' bound?");
  assert(((signed long long )llvm_cbe__2e_sum) < 64 && "Write access out of array 'p_jinfo_quant_tbl_quantval' bound?");

#endif
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%23, i32* %%28, align 4, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5198_count);
  *llvm_cbe_tmp__741 = llvm_cbe_tmp__736;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__736);
if (AESL_DEBUG_TRACE)
printf("\n  %%29 = add nsw i32 %%storemerge2, 1, !dbg !29 for 0x%llxth hint within @get_dqt  --> \n", ++aesl_llvm_cbe_5199_count);
  llvm_cbe_tmp__742 = (unsigned int )((unsigned int )(llvm_cbe_storemerge2&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__742&4294967295ull)));
  if (((llvm_cbe_tmp__742&4294967295U) == (64u&4294967295U))) {
    goto llvm_cbe__2e_us_2d_lcssa_2e_us;
  } else {
    llvm_cbe_storemerge2__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__742;   /* for PHI node */
    goto llvm_cbe_tmp__744;
  }

  } while (1); /* end of syntactic loop '' */
  } while (1); /* end of syntactic loop '.lr.ph' */
llvm_cbe__2e__crit_edge:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @get_dqt}\n");
  return;
}


void read_markers( char *llvm_cbe_buf) {
  static  unsigned long long aesl_llvm_cbe_5208_count = 0;
  static  unsigned long long aesl_llvm_cbe_5209_count = 0;
  static  unsigned long long aesl_llvm_cbe_5210_count = 0;
  unsigned long long llvm_cbe_tmp__745;
  static  unsigned long long aesl_llvm_cbe_5211_count = 0;
  unsigned char llvm_cbe_tmp__746;
  static  unsigned long long aesl_llvm_cbe_5212_count = 0;
  static  unsigned long long aesl_llvm_cbe_5213_count = 0;
  static  unsigned long long aesl_llvm_cbe_5214_count = 0;
  static  unsigned long long aesl_llvm_cbe_5215_count = 0;
  static  unsigned long long aesl_llvm_cbe_5216_count = 0;
  static  unsigned long long aesl_llvm_cbe_5217_count = 0;
  unsigned int llvm_cbe_tmp__747;
  unsigned int llvm_cbe_tmp__747__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_5218_count = 0;
  static  unsigned long long aesl_llvm_cbe_5219_count = 0;
  static  unsigned long long aesl_llvm_cbe_5220_count = 0;
  unsigned int llvm_cbe_tmp__748;
  static  unsigned long long aesl_llvm_cbe_5221_count = 0;
  static  unsigned long long aesl_llvm_cbe_5222_count = 0;
  static  unsigned long long aesl_llvm_cbe_5223_count = 0;
  unsigned int llvm_cbe_tmp__749;
  static  unsigned long long aesl_llvm_cbe_5224_count = 0;
  static  unsigned long long aesl_llvm_cbe_5225_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
  unsigned int llvm_cbe_storemerge;
  unsigned int llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_5226_count = 0;
  static  unsigned long long aesl_llvm_cbe_5227_count = 0;
  static  unsigned long long aesl_llvm_cbe_5228_count = 0;
  static  unsigned long long aesl_llvm_cbe_5229_count = 0;
  static  unsigned long long aesl_llvm_cbe_5230_count = 0;
  static  unsigned long long aesl_llvm_cbe_5231_count = 0;
  static  unsigned long long aesl_llvm_cbe_5232_count = 0;
  static  unsigned long long aesl_llvm_cbe_5233_count = 0;
  static  unsigned long long aesl_llvm_cbe_5234_count = 0;
  static  unsigned long long aesl_llvm_cbe_5235_count = 0;
  static  unsigned long long aesl_llvm_cbe_5236_count = 0;
  static  unsigned long long aesl_llvm_cbe_5237_count = 0;
  static  unsigned long long aesl_llvm_cbe_5238_count = 0;
  static  unsigned long long aesl_llvm_cbe_5239_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @read_markers\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = ptrtoint i8* %%buf to i64, !dbg !27 for 0x%llxth hint within @read_markers  --> \n", ++aesl_llvm_cbe_5210_count);
  llvm_cbe_tmp__745 = (unsigned long long )((unsigned long long )(unsigned long)llvm_cbe_buf&18446744073709551615ULL);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%llX\n", llvm_cbe_tmp__745);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = trunc i64 %%1 to i8, !dbg !27 for 0x%llxth hint within @read_markers  --> \n", ++aesl_llvm_cbe_5211_count);
  llvm_cbe_tmp__746 = (unsigned char )((unsigned char )llvm_cbe_tmp__745&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__746);
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%2, i8* @aesl_internal_ReadBuf, align 1, !dbg !27 for 0x%llxth hint within @read_markers  --> \n", ++aesl_llvm_cbe_5212_count);
  *(&aesl_internal_ReadBuf) = llvm_cbe_tmp__746;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__746);
  llvm_cbe_tmp__747__PHI_TEMPORARY = (unsigned int )0u;   /* for PHI node */
  goto llvm_cbe__2e_backedge;

  do {     /* Syntactic loop '.backedge' to make GCC happy */
llvm_cbe__2e_backedge:
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = phi i32 [ 0, %%0 ], [ %%3, %%14 ], [ %%3, %%13 ], [ %%3, %%11 ], [ 1, %%10 ], [ %%3, %%9  for 0x%llxth hint within @read_markers  --> \n", ++aesl_llvm_cbe_5217_count);
  llvm_cbe_tmp__747 = (unsigned int )llvm_cbe_tmp__747__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n = 0x%X",llvm_cbe_tmp__747);
printf("\n = 0x%X",0u);
printf("\n = 0x%X",llvm_cbe_tmp__747);
printf("\n = 0x%X",llvm_cbe_tmp__747);
printf("\n = 0x%X",llvm_cbe_tmp__747);
printf("\n = 0x%X",1u);
printf("\n = 0x%X",llvm_cbe_tmp__747);
}
  if (((llvm_cbe_tmp__747&4294967295U) == (0u&4294967295U))) {
    goto llvm_cbe_tmp__750;
  } else {
    goto llvm_cbe_tmp__751;
  }

llvm_cbe_tmp__752:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i32 [ %%6, %%5 ], [ %%8, %%7  for 0x%llxth hint within @read_markers  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = (unsigned int )llvm_cbe_storemerge__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge = 0x%X",llvm_cbe_storemerge);
printf("\n = 0x%X",llvm_cbe_tmp__748);
printf("\n = 0x%X",llvm_cbe_tmp__749);
}
  switch (((unsigned int )(llvm_cbe_storemerge&4294967295ull))) {
  default:
    llvm_cbe_tmp__747__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__747;   /* for PHI node */
    goto llvm_cbe__2e_backedge;
;
  case ((unsigned int )(216u&4294967295ull)):
    goto llvm_cbe_tmp__753;
    break;
  case ((unsigned int )(192u&4294967295ull)):
    goto llvm_cbe_tmp__754;
  case ((unsigned int )(218u&4294967295ull)):
    goto llvm_cbe_tmp__755;
  case ((unsigned int )(196u&4294967295ull)):
    goto llvm_cbe_tmp__756;
  case ((unsigned int )(219u&4294967295ull)):
    goto llvm_cbe_tmp__757;
  case ((unsigned int )(217u&4294967295ull)):
    goto llvm_cbe__2e_loopexit;
  }
llvm_cbe_tmp__750:
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = tail call i32 @first_marker(), !dbg !28 for 0x%llxth hint within @read_markers  --> \n", ++aesl_llvm_cbe_5220_count);
  llvm_cbe_tmp__748 = (unsigned int ) /*tail*/ first_marker();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__748);
}
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__748;   /* for PHI node */
  goto llvm_cbe_tmp__752;

llvm_cbe_tmp__751:
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = tail call i32 @next_marker(), !dbg !28 for 0x%llxth hint within @read_markers  --> \n", ++aesl_llvm_cbe_5223_count);
  llvm_cbe_tmp__749 = (unsigned int ) /*tail*/ next_marker();
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__749);
}
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__749;   /* for PHI node */
  goto llvm_cbe_tmp__752;

llvm_cbe_tmp__753:
  llvm_cbe_tmp__747__PHI_TEMPORARY = (unsigned int )1u;   /* for PHI node */
  goto llvm_cbe__2e_backedge;

llvm_cbe_tmp__754:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @get_sof(), !dbg !29 for 0x%llxth hint within @read_markers  --> \n", ++aesl_llvm_cbe_5231_count);
   /*tail*/ get_sof();
if (AESL_DEBUG_TRACE) {
}
  llvm_cbe_tmp__747__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__747;   /* for PHI node */
  goto llvm_cbe__2e_backedge;

llvm_cbe_tmp__756:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @get_dht(), !dbg !30 for 0x%llxth hint within @read_markers  --> \n", ++aesl_llvm_cbe_5235_count);
   /*tail*/ get_dht();
if (AESL_DEBUG_TRACE) {
}
  llvm_cbe_tmp__747__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__747;   /* for PHI node */
  goto llvm_cbe__2e_backedge;

llvm_cbe_tmp__757:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @get_dqt(), !dbg !30 for 0x%llxth hint within @read_markers  --> \n", ++aesl_llvm_cbe_5237_count);
   /*tail*/ get_dqt();
if (AESL_DEBUG_TRACE) {
}
  llvm_cbe_tmp__747__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__747;   /* for PHI node */
  goto llvm_cbe__2e_backedge;

  } while (1); /* end of syntactic loop '.backedge' */
llvm_cbe_tmp__755:
if (AESL_DEBUG_TRACE)
printf("\n  tail call void @get_sos(), !dbg !29 for 0x%llxth hint within @read_markers  --> \n", ++aesl_llvm_cbe_5233_count);
   /*tail*/ get_sos();
if (AESL_DEBUG_TRACE) {
}
  goto llvm_cbe__2e_loopexit;

llvm_cbe__2e_loopexit:
  if (AESL_DEBUG_TRACE)
      printf("\nEND @read_markers}\n");
  return;
}


void jpeg_init_decompress(void) {
  static  unsigned long long aesl_llvm_cbe_5240_count = 0;
  unsigned short llvm_cbe_tmp__758;
  static  unsigned long long aesl_llvm_cbe_5241_count = 0;
  unsigned int llvm_cbe_tmp__759;
  static  unsigned long long aesl_llvm_cbe_5242_count = 0;
  unsigned int llvm_cbe_tmp__760;
  static  unsigned long long aesl_llvm_cbe_5243_count = 0;
  unsigned int llvm_cbe_tmp__761;
  static  unsigned long long aesl_llvm_cbe_5244_count = 0;
  unsigned int llvm_cbe_tmp__762;
  static  unsigned long long aesl_llvm_cbe_5245_count = 0;
  static  unsigned long long aesl_llvm_cbe_5246_count = 0;
  unsigned short llvm_cbe_tmp__763;
  static  unsigned long long aesl_llvm_cbe_5247_count = 0;
  unsigned int llvm_cbe_tmp__764;
  static  unsigned long long aesl_llvm_cbe_5248_count = 0;
  unsigned int llvm_cbe_tmp__765;
  static  unsigned long long aesl_llvm_cbe_5249_count = 0;
  unsigned int llvm_cbe_tmp__766;
  static  unsigned long long aesl_llvm_cbe_5250_count = 0;
  unsigned int llvm_cbe_tmp__767;
  static  unsigned long long aesl_llvm_cbe_5251_count = 0;
  static  unsigned long long aesl_llvm_cbe_5252_count = 0;
  unsigned int llvm_cbe_tmp__768;
  static  unsigned long long aesl_llvm_cbe_5253_count = 0;
  static  unsigned long long aesl_llvm_cbe_5254_count = 0;
  unsigned int llvm_cbe_tmp__769;
  static  unsigned long long aesl_llvm_cbe_5255_count = 0;
  static  unsigned long long aesl_llvm_cbe_5256_count = 0;
  static  unsigned long long aesl_llvm_cbe_5257_count = 0;
  static  unsigned long long aesl_llvm_cbe_5258_count = 0;
  unsigned int llvm_cbe_tmp__770;
  static  unsigned long long aesl_llvm_cbe_5259_count = 0;
  static  unsigned long long aesl_llvm_cbe_5260_count = 0;
  static  unsigned long long aesl_llvm_cbe_5261_count = 0;
  static  unsigned long long aesl_llvm_cbe_5262_count = 0;
  unsigned int llvm_cbe_tmp__771;
  static  unsigned long long aesl_llvm_cbe_5263_count = 0;
  static  unsigned long long aesl_llvm_cbe_5264_count = 0;
  static  unsigned long long aesl_llvm_cbe_5265_count = 0;
  static  unsigned long long aesl_llvm_cbe_5266_count = 0;
  unsigned int llvm_cbe_tmp__772;
  static  unsigned long long aesl_llvm_cbe_5267_count = 0;
  static  unsigned long long aesl_llvm_cbe_5268_count = 0;
  static  unsigned long long aesl_llvm_cbe_5269_count = 0;
  static  unsigned long long aesl_llvm_cbe_5270_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @jpeg_init_decompress\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i16* @p_jinfo_image_height, align 2, !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5240_count);
  llvm_cbe_tmp__758 = (unsigned short )*(&p_jinfo_image_height);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__758);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = sext i16 %%1 to i32, !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5241_count);
  llvm_cbe_tmp__759 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__758);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__759);
if (AESL_DEBUG_TRACE)
printf("\n  %%3 = add nsw i32 %%2, -1, !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5242_count);
  llvm_cbe_tmp__760 = (unsigned int )((unsigned int )(llvm_cbe_tmp__759&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__760&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%4 = sdiv i32 %%3, 8, !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5243_count);
  llvm_cbe_tmp__761 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__760) / ((signed int )8u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__761));
if (AESL_DEBUG_TRACE)
printf("\n  %%5 = add nsw i32 %%4, 1, !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5244_count);
  llvm_cbe_tmp__762 = (unsigned int )((unsigned int )(llvm_cbe_tmp__761&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__762&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%5, i32* @p_jinfo_MCUHeight, align 4, !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5245_count);
  *(&p_jinfo_MCUHeight) = llvm_cbe_tmp__762;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__762);
if (AESL_DEBUG_TRACE)
printf("\n  %%6 = load i16* @p_jinfo_image_width, align 2, !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5246_count);
  llvm_cbe_tmp__763 = (unsigned short )*(&p_jinfo_image_width);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__763);
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = sext i16 %%6 to i32, !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5247_count);
  llvm_cbe_tmp__764 = (unsigned int )((signed int )(signed short )llvm_cbe_tmp__763);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__764);
if (AESL_DEBUG_TRACE)
printf("\n  %%8 = add nsw i32 %%7, -1, !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5248_count);
  llvm_cbe_tmp__765 = (unsigned int )((unsigned int )(llvm_cbe_tmp__764&4294967295ull)) + ((unsigned int )(4294967295u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__765&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  %%9 = sdiv i32 %%8, 8, !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5249_count);
  llvm_cbe_tmp__766 = (unsigned int )((signed int )(((signed int )llvm_cbe_tmp__765) / ((signed int )8u)));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((signed int )llvm_cbe_tmp__766));
if (AESL_DEBUG_TRACE)
printf("\n  %%10 = add nsw i32 %%9, 1, !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5250_count);
  llvm_cbe_tmp__767 = (unsigned int )((unsigned int )(llvm_cbe_tmp__766&4294967295ull)) + ((unsigned int )(1u&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__767&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%10, i32* @p_jinfo_MCUWidth, align 4, !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5251_count);
  *(&p_jinfo_MCUWidth) = llvm_cbe_tmp__767;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__767);
if (AESL_DEBUG_TRACE)
printf("\n  %%11 = mul nsw i32 %%5, %%10, !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5252_count);
  llvm_cbe_tmp__768 = (unsigned int )((unsigned int )(llvm_cbe_tmp__762&4294967295ull)) * ((unsigned int )(llvm_cbe_tmp__767&4294967295ull));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned int )(llvm_cbe_tmp__768&4294967295ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%11, i32* @p_jinfo_NumMCU, align 4, !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5253_count);
  *(&p_jinfo_NumMCU) = llvm_cbe_tmp__768;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__768);
if (AESL_DEBUG_TRACE)
printf("\n  %%12 = tail call i32 @huff_make_dhuff_tb(i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_dc_xhuff_tbl_bits, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_dc_dhuff_tbl_maxcode, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_dc_dhuff_tbl_mincode, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_dc_dhuff_tbl_valptr, i64 0, i64 0, i64 0)), !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5254_count);
  llvm_cbe_tmp__769 = (unsigned int ) /*tail*/ huff_make_dhuff_tb((signed int *)((&p_jinfo_dc_xhuff_tbl_bits[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])), (signed int *)((&p_jinfo_dc_dhuff_tbl_maxcode[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])), (signed int *)((&p_jinfo_dc_dhuff_tbl_mincode[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])), (signed int *)((&p_jinfo_dc_dhuff_tbl_valptr[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__769);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%12, i32* getelementptr inbounds ([2 x i32]* @p_jinfo_dc_dhuff_tbl_ml, i64 0, i64 0), align 4, !dbg !27 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5257_count);
  *((&p_jinfo_dc_dhuff_tbl_ml[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])) = llvm_cbe_tmp__769;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__769);
if (AESL_DEBUG_TRACE)
printf("\n  %%13 = tail call i32 @huff_make_dhuff_tb(i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_dc_xhuff_tbl_bits, i64 0, i64 1, i64 0), i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_dc_dhuff_tbl_maxcode, i64 0, i64 1, i64 0), i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_dc_dhuff_tbl_mincode, i64 0, i64 1, i64 0), i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_dc_dhuff_tbl_valptr, i64 0, i64 1, i64 0)), !dbg !28 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5258_count);
  llvm_cbe_tmp__770 = (unsigned int ) /*tail*/ huff_make_dhuff_tb((signed int *)((&p_jinfo_dc_xhuff_tbl_bits[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])), (signed int *)((&p_jinfo_dc_dhuff_tbl_maxcode[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])), (signed int *)((&p_jinfo_dc_dhuff_tbl_mincode[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])), (signed int *)((&p_jinfo_dc_dhuff_tbl_valptr[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__770);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%13, i32* getelementptr inbounds ([2 x i32]* @p_jinfo_dc_dhuff_tbl_ml, i64 0, i64 1), align 4, !dbg !28 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5261_count);
  *((&p_jinfo_dc_dhuff_tbl_ml[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])) = llvm_cbe_tmp__770;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__770);
if (AESL_DEBUG_TRACE)
printf("\n  %%14 = tail call i32 @huff_make_dhuff_tb(i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_ac_xhuff_tbl_bits, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_ac_dhuff_tbl_maxcode, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_ac_dhuff_tbl_mincode, i64 0, i64 0, i64 0), i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_ac_dhuff_tbl_valptr, i64 0, i64 0, i64 0)), !dbg !28 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5262_count);
  llvm_cbe_tmp__771 = (unsigned int ) /*tail*/ huff_make_dhuff_tb((signed int *)((&p_jinfo_ac_xhuff_tbl_bits[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])), (signed int *)((&p_jinfo_ac_dhuff_tbl_maxcode[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])), (signed int *)((&p_jinfo_ac_dhuff_tbl_mincode[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])), (signed int *)((&p_jinfo_ac_dhuff_tbl_valptr[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__771);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%14, i32* getelementptr inbounds ([2 x i32]* @p_jinfo_ac_dhuff_tbl_ml, i64 0, i64 0), align 4, !dbg !28 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5265_count);
  *((&p_jinfo_ac_dhuff_tbl_ml[(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])) = llvm_cbe_tmp__771;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__771);
if (AESL_DEBUG_TRACE)
printf("\n  %%15 = tail call i32 @huff_make_dhuff_tb(i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_ac_xhuff_tbl_bits, i64 0, i64 1, i64 0), i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_ac_dhuff_tbl_maxcode, i64 0, i64 1, i64 0), i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_ac_dhuff_tbl_mincode, i64 0, i64 1, i64 0), i32* getelementptr inbounds ([2 x [36 x i32]]* @p_jinfo_ac_dhuff_tbl_valptr, i64 0, i64 1, i64 0)), !dbg !28 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5266_count);
  llvm_cbe_tmp__772 = (unsigned int ) /*tail*/ huff_make_dhuff_tb((signed int *)((&p_jinfo_ac_xhuff_tbl_bits[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])), (signed int *)((&p_jinfo_ac_dhuff_tbl_maxcode[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])), (signed int *)((&p_jinfo_ac_dhuff_tbl_mincode[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])), (signed int *)((&p_jinfo_ac_dhuff_tbl_valptr[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 2
#endif
][(((signed long long )0ull))
#ifdef AESL_BC_SIM
 % 36
#endif
])));
if (AESL_DEBUG_TRACE) {
printf("\nReturn  = 0x%X",llvm_cbe_tmp__772);
}
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%15, i32* getelementptr inbounds ([2 x i32]* @p_jinfo_ac_dhuff_tbl_ml, i64 0, i64 1), align 4, !dbg !28 for 0x%llxth hint within @jpeg_init_decompress  --> \n", ++aesl_llvm_cbe_5269_count);
  *((&p_jinfo_ac_dhuff_tbl_ml[(((signed long long )1ull))
#ifdef AESL_BC_SIM
 % 2
#endif
])) = llvm_cbe_tmp__772;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__772);
  if (AESL_DEBUG_TRACE)
      printf("\nEND @jpeg_init_decompress}\n");
  return;
}


void jpeg_decode( char *llvm_cbe_readBuf,  char (*llvm_cbe_outputVector)[16384], signed int llvm_cbe_OutData_image_width, signed int llvm_cbe_OutData_image_height, signed int *llvm_cbe_OutData_comp_vpos, signed int *llvm_cbe_OutData_comp_hpos) {
  static  unsigned long long aesl_llvm_cbe_5271_count = 0;
  signed int llvm_cbe_tmp__773;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_5272_count = 0;
  signed int llvm_cbe_tmp__774;    /* Address-exposed local */
  static  unsigned long long aesl_llvm_cbe_5273_count = 0;
  static  unsigned long long aesl_llvm_cbe_5274_count = 0;
  static  unsigned long long aesl_llvm_cbe_5275_count = 0;
  static  unsigned long long aesl_llvm_cbe_5276_count = 0;
  static  unsigned long long aesl_llvm_cbe_5277_count = 0;
  static  unsigned long long aesl_llvm_cbe_5278_count = 0;
  static  unsigned long long aesl_llvm_cbe_5279_count = 0;
  static  unsigned long long aesl_llvm_cbe_5280_count = 0;
  static  unsigned long long aesl_llvm_cbe_5281_count = 0;
  static  unsigned long long aesl_llvm_cbe_5282_count = 0;
  static  unsigned long long aesl_llvm_cbe_5283_count = 0;
  static  unsigned long long aesl_llvm_cbe_5284_count = 0;
  static  unsigned long long aesl_llvm_cbe_5285_count = 0;
  static  unsigned long long aesl_llvm_cbe_5286_count = 0;
  static  unsigned long long aesl_llvm_cbe_5287_count = 0;
  static  unsigned long long aesl_llvm_cbe_5288_count = 0;
  static  unsigned long long aesl_llvm_cbe_5289_count = 0;
  static  unsigned long long aesl_llvm_cbe_5290_count = 0;
  static  unsigned long long aesl_llvm_cbe_5291_count = 0;
  static  unsigned long long aesl_llvm_cbe_5292_count = 0;
  static  unsigned long long aesl_llvm_cbe_5293_count = 0;
  static  unsigned long long aesl_llvm_cbe_5294_count = 0;
  static  unsigned long long aesl_llvm_cbe_5295_count = 0;
  static  unsigned long long aesl_llvm_cbe_5296_count = 0;
  static  unsigned long long aesl_llvm_cbe_5297_count = 0;
  static  unsigned long long aesl_llvm_cbe_5298_count = 0;
  static  unsigned long long aesl_llvm_cbe_5299_count = 0;
  static  unsigned long long aesl_llvm_cbe_5300_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @jpeg_decode\n");
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%OutData_image_width, i32* %%1, align  for 0x%llxth hint within @jpeg_decode  --> \n", ++aesl_llvm_cbe_5282_count);
  *(&llvm_cbe_tmp__773) = llvm_cbe_OutData_image_width;
if (AESL_DEBUG_TRACE)
printf("\nOutData_image_width = 0x%X\n", llvm_cbe_OutData_image_width);
if (AESL_DEBUG_TRACE)
printf("\n  store i32 %%OutData_image_height, i32* %%2, align  for 0x%llxth hint within @jpeg_decode  --> \n", ++aesl_llvm_cbe_5290_count);
  *(&llvm_cbe_tmp__774) = llvm_cbe_OutData_image_height;
if (AESL_DEBUG_TRACE)
printf("\nOutData_image_height = 0x%X\n", llvm_cbe_OutData_image_height);
if (AESL_DEBUG_TRACE)
printf("\n  call void @read_markers(i8* %%readBuf), !dbg !28 for 0x%llxth hint within @jpeg_decode  --> \n", ++aesl_llvm_cbe_5297_count);
  read_markers(( char *)llvm_cbe_readBuf);
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @jpeg_init_decompress(), !dbg !28 for 0x%llxth hint within @jpeg_decode  --> \n", ++aesl_llvm_cbe_5298_count);
  jpeg_init_decompress();
if (AESL_DEBUG_TRACE) {
}
if (AESL_DEBUG_TRACE)
printf("\n  call void @decode(i32* %%1, i32* %%2, i32* %%OutData_comp_vpos, i32* %%OutData_comp_hpos, [16384 x i8]* %%outputVector), !dbg !27 for 0x%llxth hint within @jpeg_decode  --> \n", ++aesl_llvm_cbe_5299_count);
  decode((signed int *)(&llvm_cbe_tmp__773), (signed int *)(&llvm_cbe_tmp__774), (signed int *)llvm_cbe_OutData_comp_vpos, (signed int *)llvm_cbe_OutData_comp_hpos, llvm_cbe_outputVector);
if (AESL_DEBUG_TRACE) {
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @jpeg_decode}\n");
  return;
}


static signed int aesl_internal_pgetc(void) {
  static  unsigned long long aesl_llvm_cbe_5301_count = 0;
  unsigned char llvm_cbe_tmp__775;
  static  unsigned long long aesl_llvm_cbe_5302_count = 0;
  unsigned char llvm_cbe_tmp__776;
  static  unsigned long long aesl_llvm_cbe_5303_count = 0;
  static  unsigned long long aesl_llvm_cbe_5304_count = 0;
  static  unsigned long long aesl_llvm_cbe_5305_count = 0;
  static  unsigned long long aesl_llvm_cbe_5306_count = 0;
  static  unsigned long long aesl_llvm_cbe_5307_count = 0;
  static  unsigned long long aesl_llvm_cbe_5308_count = 0;
  static  unsigned long long aesl_llvm_cbe__2e_in_count = 0;
  unsigned char llvm_cbe__2e_in;
  unsigned char llvm_cbe__2e_in__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_5309_count = 0;
  unsigned int llvm_cbe_tmp__777;
  static  unsigned long long aesl_llvm_cbe_5310_count = 0;
  static  unsigned long long aesl_llvm_cbe_5311_count = 0;
  static  unsigned long long aesl_llvm_cbe_storemerge_count = 0;
  unsigned int llvm_cbe_storemerge;
  unsigned int llvm_cbe_storemerge__PHI_TEMPORARY;
  static  unsigned long long aesl_llvm_cbe_5312_count = 0;

const char* AESL_DEBUG_TRACE = getenv("DEBUG_TRACE");
if (AESL_DEBUG_TRACE)
printf("\n\{ BEGIN @aesl_internal_pgetc\n");
if (AESL_DEBUG_TRACE)
printf("\n  %%1 = load i8* @CurHuffReadBuf, align 1, !dbg !27 for 0x%llxth hint within @aesl_internal_pgetc  --> \n", ++aesl_llvm_cbe_5301_count);
  llvm_cbe_tmp__775 = (unsigned char )*(&CurHuffReadBuf);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__775);
if (AESL_DEBUG_TRACE)
printf("\n  %%2 = add i8 %%1, 1, !dbg !27 for 0x%llxth hint within @aesl_internal_pgetc  --> \n", ++aesl_llvm_cbe_5302_count);
  llvm_cbe_tmp__776 = (unsigned char )((unsigned char )(((unsigned char )(llvm_cbe_tmp__775&255ull)) + ((unsigned char )(((unsigned char )1)&255ull))));
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )(llvm_cbe_tmp__776&255ull)));
if (AESL_DEBUG_TRACE)
printf("\n  store i8 %%2, i8* @CurHuffReadBuf, align 1, !dbg !27 for 0x%llxth hint within @aesl_internal_pgetc  --> \n", ++aesl_llvm_cbe_5303_count);
  *(&CurHuffReadBuf) = llvm_cbe_tmp__776;
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__776);
  if (((llvm_cbe_tmp__775&255U) == (((unsigned char )-1)&255U))) {
    goto llvm_cbe_tmp__778;
  } else {
    llvm_cbe__2e_in__PHI_TEMPORARY = (unsigned char )llvm_cbe_tmp__775;   /* for PHI node */
    goto llvm_cbe_tmp__779;
  }

llvm_cbe_tmp__778:
if (AESL_DEBUG_TRACE)
printf("\n  store i8 1, i8* @CurHuffReadBuf, align 1, !dbg !27 for 0x%llxth hint within @aesl_internal_pgetc  --> \n", ++aesl_llvm_cbe_5306_count);
  *(&CurHuffReadBuf) = ((unsigned char )1);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", ((unsigned char )1));
  if (((llvm_cbe_tmp__776&255U) == (((unsigned char )0)&255U))) {
    llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned int )255u;   /* for PHI node */
    goto llvm_cbe_tmp__780;
  } else {
    llvm_cbe__2e_in__PHI_TEMPORARY = (unsigned char )llvm_cbe_tmp__776;   /* for PHI node */
    goto llvm_cbe_tmp__779;
  }

llvm_cbe_tmp__779:
if (AESL_DEBUG_TRACE)
printf("\n  %%.in = phi i8 [ %%2, %%4 ], [ %%1, %%0  for 0x%llxth hint within @aesl_internal_pgetc  --> \n", ++aesl_llvm_cbe__2e_in_count);
  llvm_cbe__2e_in = (unsigned char )llvm_cbe__2e_in__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\n.in = 0x%X",llvm_cbe__2e_in);
printf("\n = 0x%X",llvm_cbe_tmp__776);
printf("\n = 0x%X",llvm_cbe_tmp__775);
}
if (AESL_DEBUG_TRACE)
printf("\n  %%7 = zext i8 %%.in to i32, !dbg !27 for 0x%llxth hint within @aesl_internal_pgetc  --> \n", ++aesl_llvm_cbe_5309_count);
  llvm_cbe_tmp__777 = (unsigned int )((unsigned int )(unsigned char )llvm_cbe__2e_in&255U);
if (AESL_DEBUG_TRACE)
printf("\n = 0x%X\n", llvm_cbe_tmp__777);
  llvm_cbe_storemerge__PHI_TEMPORARY = (unsigned int )llvm_cbe_tmp__777;   /* for PHI node */
  goto llvm_cbe_tmp__780;

llvm_cbe_tmp__780:
if (AESL_DEBUG_TRACE)
printf("\n  %%storemerge = phi i32 [ %%7, %%6 ], [ 255, %%4  for 0x%llxth hint within @aesl_internal_pgetc  --> \n", ++aesl_llvm_cbe_storemerge_count);
  llvm_cbe_storemerge = (unsigned int )llvm_cbe_storemerge__PHI_TEMPORARY;
if (AESL_DEBUG_TRACE) {
printf("\nstoremerge = 0x%X",llvm_cbe_storemerge);
printf("\n = 0x%X",llvm_cbe_tmp__777);
printf("\n = 0x%X",255u);
}
  if (AESL_DEBUG_TRACE)
      printf("\nEND @aesl_internal_pgetc}\n");
  return llvm_cbe_storemerge;
}

