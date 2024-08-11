# 1 "benchmarks/chstone/gsm/src/gsm.c"
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
# 1 "benchmarks/chstone/gsm/src/gsm.c" 2
# 19 "benchmarks/chstone/gsm/src/gsm.c"
# 1 "/usr/include/stdio.h" 1 3 4
# 27 "/usr/include/stdio.h" 3 4
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
# 28 "/usr/include/stdio.h" 2 3 4





# 1 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stddef.h" 1 3 4
# 62 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 34 "/usr/include/stdio.h" 2 3 4


# 1 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stdarg.h" 1 3 4
# 30 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stdarg.h" 3 4
typedef __builtin_va_list va_list;
# 48 "/tools/Xilinx/Vitis_HLS/2023.2/lnx64/tools/clang-3.9-csynth/lib/clang/7.0.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 37 "/usr/include/stdio.h" 2 3 4

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
# 39 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h" 1 3 4




# 1 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h" 1 3 4
# 13 "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h" 3 4
typedef struct
{
  int __count;
  union
  {
    unsigned int __wch;
    char __wchb[4];
  } __value;
} __mbstate_t;
# 6 "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h" 2 3 4




typedef struct _G_fpos_t
{
  __off_t __pos;
  __mbstate_t __state;
} __fpos_t;
# 40 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/bits/types/__fpos64_t.h" 3 4
typedef struct _G_fpos64_t
{
  __off64_t __pos;
  __mbstate_t __state;
} __fpos64_t;
# 41 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h" 1 3 4



struct _IO_FILE;
typedef struct _IO_FILE __FILE;
# 42 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h" 1 3 4



struct _IO_FILE;


typedef struct _IO_FILE FILE;
# 43 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h" 1 3 4
# 35 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h" 3 4
struct _IO_FILE;
struct _IO_marker;
struct _IO_codecvt;
struct _IO_wide_data;




typedef void _IO_lock_t;





struct _IO_FILE
{
  int _flags;


  char *_IO_read_ptr;
  char *_IO_read_end;
  char *_IO_read_base;
  char *_IO_write_base;
  char *_IO_write_ptr;
  char *_IO_write_end;
  char *_IO_buf_base;
  char *_IO_buf_end;


  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;
  int _flags2;
  __off_t _old_offset;


  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];

  _IO_lock_t *_lock;







  __off64_t _offset;

  struct _IO_codecvt *_codecvt;
  struct _IO_wide_data *_wide_data;
  struct _IO_FILE *_freeres_list;
  void *_freeres_buf;
  size_t __pad5;
  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];
};
# 44 "/usr/include/stdio.h" 2 3 4








typedef __gnuc_va_list va_list;
# 63 "/usr/include/stdio.h" 3 4
typedef __off_t off_t;
# 77 "/usr/include/stdio.h" 3 4
typedef __ssize_t ssize_t;






typedef __fpos_t fpos_t;
# 133 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 134 "/usr/include/stdio.h" 2 3 4
# 143 "/usr/include/stdio.h" 3 4
extern FILE *stdin;
extern FILE *stdout;
extern FILE *stderr;






extern int remove (const char *__filename) __attribute__ ((__nothrow__ ));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ ));



extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ ));
# 178 "/usr/include/stdio.h" 3 4
extern int fclose (FILE *__stream);
# 188 "/usr/include/stdio.h" 3 4
extern FILE *tmpfile (void)
  __attribute__ ((__malloc__)) ;
# 205 "/usr/include/stdio.h" 3 4
extern char *tmpnam (char[20]) __attribute__ ((__nothrow__ )) ;




extern char *tmpnam_r (char __s[20]) __attribute__ ((__nothrow__ )) ;
# 222 "/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
   __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) ;






extern int fflush (FILE *__stream);
# 239 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 258 "/usr/include/stdio.h" 3 4
extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes)
  __attribute__ ((__malloc__)) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 293 "/usr/include/stdio.h" 3 4
extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ ))
  __attribute__ ((__malloc__)) ;
# 308 "/usr/include/stdio.h" 3 4
extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ ))
  __attribute__ ((__malloc__)) ;
# 328 "/usr/include/stdio.h" 3 4
extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ ));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ ));




extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ ));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ ));







extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));



extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));
# 403 "/usr/include/stdio.h" 3 4
extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));







extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ ));






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
# 431 "/usr/include/stdio.h" 2 3 4



extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf") ;


extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf") ;

extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__ ));
# 459 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format__ (__scanf__, 2, 0)));





extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf") __attribute__ ((__nothrow__ ))



     __attribute__ ((__format__ (__scanf__, 2, 0)));
# 513 "/usr/include/stdio.h" 3 4
extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);






extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 538 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);
# 549 "/usr/include/stdio.h" 3 4
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);
# 565 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);







extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
                                                         ;
# 605 "/usr/include/stdio.h" 3 4
extern char *gets (char *__s) __attribute__ ((__deprecated__));
# 632 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
                             size_t *__restrict __n, int __delimiter,
                             FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
                           size_t *__restrict __n, int __delimiter,
                           FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
                          size_t *__restrict __n,
                          FILE *__restrict __stream) ;







extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);
# 702 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);







extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);
# 736 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;
# 760 "/usr/include/stdio.h" 3 4
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 786 "/usr/include/stdio.h" 3 4
extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ ));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ )) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ )) ;



extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ ));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) ;







extern void perror (const char *__s);




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ )) ;




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) ;
# 823 "/usr/include/stdio.h" 3 4
extern int pclose (FILE *__stream);





extern FILE *popen (const char *__command, const char *__modes)
  __attribute__ ((__malloc__)) ;






extern char *ctermid (char *__s) __attribute__ ((__nothrow__ ))
                                     ;
# 867 "/usr/include/stdio.h" 3 4
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ ));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ )) ;


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ ));
# 885 "/usr/include/stdio.h" 3 4
extern int __uflow (FILE *);
extern int __overflow (FILE *, int);
# 20 "benchmarks/chstone/gsm/src/gsm.c" 2
# 1 "benchmarks/chstone/gsm/src/lpc.c" 1
# 27 "benchmarks/chstone/gsm/src/lpc.c"
# 1 "benchmarks/chstone/gsm/src/private.h" 1
# 30 "benchmarks/chstone/gsm/src/private.h"
typedef short word;
typedef long longword;
# 28 "benchmarks/chstone/gsm/src/lpc.c" 2
# 1 "benchmarks/chstone/gsm/src/add.h" 1





word gsm_add (word a, word b);
word gsm_mult (word a, word b);
word gsm_mult_r (word a, word b);
word gsm_abs (word a);
word gsm_norm (longword a);
word gsm_div (word num, word denum);
# 29 "benchmarks/chstone/gsm/src/lpc.c" 2
# 1 "benchmarks/chstone/gsm/src/lpc.h" 1
# 30 "benchmarks/chstone/gsm/src/lpc.c" 2
# 39 "benchmarks/chstone/gsm/src/lpc.c"
void
Autocorrelation (word * s ,
   longword * L_ACF )




{
  register int k, i;

  word temp;
  word smax;
  word scalauto, n;
  word *sp;
  word sl;



  smax = 0;
Autocorrelation_label0: for (k = 0; k <= 159; k++)
    {
      temp = gsm_abs(s[k]);
      if (temp > smax)
       smax = temp;
    }



    if (smax == 0)
      scalauto = 0;
    else
      scalauto = 4 - gsm_norm ((longword) smax << 16);

    if (scalauto > 0 && scalauto <= 4)
      {
        n = scalauto;
        VITIS_LOOP_75_1: for (k = 0; k <= 159; k++)
           s[k] = gsm_mult_r(s[k], 16384 >> (n - 1));
      }



  {
    sp = s;
    sl = *sp;




    VITIS_LOOP_88_2: for (k = 8; k >= 0; k--)
      L_ACF[k] = 0;

    L_ACF[0] += ((longword)sl * sp[ -(0) ]);;
    sl = *++sp;
    L_ACF[0] += ((longword)sl * sp[ -(0) ]);;
    L_ACF[1] += ((longword)sl * sp[ -(1) ]);;
    sl = *++sp;
    L_ACF[0] += ((longword)sl * sp[ -(0) ]);;
    L_ACF[1] += ((longword)sl * sp[ -(1) ]);;
    L_ACF[2] += ((longword)sl * sp[ -(2) ]);;
    sl = *++sp;
    L_ACF[0] += ((longword)sl * sp[ -(0) ]);;
    L_ACF[1] += ((longword)sl * sp[ -(1) ]);;
    L_ACF[2] += ((longword)sl * sp[ -(2) ]);;
    L_ACF[3] += ((longword)sl * sp[ -(3) ]);;
    sl = *++sp;
    L_ACF[0] += ((longword)sl * sp[ -(0) ]);;
    L_ACF[1] += ((longword)sl * sp[ -(1) ]);;
    L_ACF[2] += ((longword)sl * sp[ -(2) ]);;
    L_ACF[3] += ((longword)sl * sp[ -(3) ]);;
    L_ACF[4] += ((longword)sl * sp[ -(4) ]);;
    sl = *++sp;
    L_ACF[0] += ((longword)sl * sp[ -(0) ]);;
    L_ACF[1] += ((longword)sl * sp[ -(1) ]);;
    L_ACF[2] += ((longword)sl * sp[ -(2) ]);;
    L_ACF[3] += ((longword)sl * sp[ -(3) ]);;
    L_ACF[4] += ((longword)sl * sp[ -(4) ]);;
    L_ACF[5] += ((longword)sl * sp[ -(5) ]);;
    sl = *++sp;
    L_ACF[0] += ((longword)sl * sp[ -(0) ]);;
    L_ACF[1] += ((longword)sl * sp[ -(1) ]);;
    L_ACF[2] += ((longword)sl * sp[ -(2) ]);;
    L_ACF[3] += ((longword)sl * sp[ -(3) ]);;
    L_ACF[4] += ((longword)sl * sp[ -(4) ]);;
    L_ACF[5] += ((longword)sl * sp[ -(5) ]);;
    L_ACF[6] += ((longword)sl * sp[ -(6) ]);;
    sl = *++sp;
    L_ACF[0] += ((longword)sl * sp[ -(0) ]);;
    L_ACF[1] += ((longword)sl * sp[ -(1) ]);;
    L_ACF[2] += ((longword)sl * sp[ -(2) ]);;
    L_ACF[3] += ((longword)sl * sp[ -(3) ]);;
    L_ACF[4] += ((longword)sl * sp[ -(4) ]);;
    L_ACF[5] += ((longword)sl * sp[ -(5) ]);;
    L_ACF[6] += ((longword)sl * sp[ -(6) ]);;
    L_ACF[7] += ((longword)sl * sp[ -(7) ]);;

    VITIS_LOOP_135_3: for (i = 8; i <= 159; i++)
      {

 sl = *++sp;

 L_ACF[0] += ((longword)sl * sp[ -(0) ]);;
 L_ACF[1] += ((longword)sl * sp[ -(1) ]);;
 L_ACF[2] += ((longword)sl * sp[ -(2) ]);;
 L_ACF[3] += ((longword)sl * sp[ -(3) ]);;
 L_ACF[4] += ((longword)sl * sp[ -(4) ]);;
 L_ACF[5] += ((longword)sl * sp[ -(5) ]);;
 L_ACF[6] += ((longword)sl * sp[ -(6) ]);;
 L_ACF[7] += ((longword)sl * sp[ -(7) ]);;
 L_ACF[8] += ((longword)sl * sp[ -(8) ]);;
      }

    VITIS_LOOP_151_4: for (k = 8; k >= 0; k--)
      L_ACF[k] <<= 1;

  }


  if (scalauto > 0)
    VITIS_LOOP_158_5: for (k = 159; k >= 0; k--)
      *s++ <<= scalauto;
}



void
Reflection_coefficients (longword * L_ACF ,
    register word * r )
{
  register int i, m, n;
  register word temp;
  word ACF[9];
  word P[9];
  word K[9];




  if (L_ACF[0] == 0)
    {
      Reflection_coefficients_label0:for (i = 8; i > 0; i--)
       *r++ = 0;
      return;
    }

  temp = gsm_norm (L_ACF[0]);
  Reflection_coefficients_label1:for (i = 0; i <= 8; i++)
    ACF[i] = ((L_ACF[i] << temp) >> (16));




  Reflection_coefficients_label2:for (i = 1; i <= 7; i++)
    K[i] = ACF[i];
  Reflection_coefficients_label3:for (i = 0; i <= 8; i++)
    P[i] = ACF[i];



  Reflection_coefficients_label4:for (n = 1; n <= 8; n++, r++)
    {
#pragma HLS LOOP_TRIPCOUNT min=1 max=8

 temp = P[1];
      temp = gsm_abs(temp);
      if (P[0] < temp)
        {
          Reflection_coefficients_label6:for (i = n; i <= 8; i++)
#pragma HLS LOOP_TRIPCOUNT min=1 max=8
 *r++ = 0;
          return;
        }

      *r = gsm_div (temp, P[0]);

      if (P[1] > 0)
     *r = -*r;
      if (n == 8)
     return;



      temp = gsm_mult_r(P[1], *r);
      P[0] = gsm_add(P[0], temp);

      Reflection_coefficients_label5:for (m = 1; m <= 8 - n; m++)
        {
#pragma HLS LOOP_TRIPCOUNT min=1 max=7
 temp = gsm_mult_r(K[m], *r);
          P[m] = gsm_add(P[m + 1], temp);

          temp = gsm_mult_r(P[m + 1], *r);
          K[m] = gsm_add(K[m], temp);
        }
; }
}



void
Transformation_to_Log_Area_Ratios (register word * r )







{
  register word temp;
  register int i;




  VITIS_LOOP_254_1: for (i = 1; i <= 8; i++, r++)
    {

      temp = *r;
      temp = gsm_abs(temp);

      if (temp < 22118)
 {
   temp >>= 1;
 }
      else if (temp < 31130)
 {
   temp -= 11059;
 }
      else
 {
   temp -= 26112;
   temp <<= 2;
 }

      *r = *r < 0 ? -temp : temp;
    }
}



void
Quantization_and_coding (register word * LAR )
{
  register word temp;
# 304 "benchmarks/chstone/gsm/src/lpc.c"
  temp = gsm_mult(20480, *LAR); temp = gsm_add(temp, 0); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp>31 ? 31 - -32 : (temp<-32 ? 0 : temp - -32); LAR++;;
  temp = gsm_mult(20480, *LAR); temp = gsm_add(temp, 0); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp>31 ? 31 - -32 : (temp<-32 ? 0 : temp - -32); LAR++;;
  temp = gsm_mult(20480, *LAR); temp = gsm_add(temp, 2048); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp>15 ? 15 - -16 : (temp<-16 ? 0 : temp - -16); LAR++;;
  temp = gsm_mult(20480, *LAR); temp = gsm_add(temp, -2560); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp>15 ? 15 - -16 : (temp<-16 ? 0 : temp - -16); LAR++;;

  temp = gsm_mult(13964, *LAR); temp = gsm_add(temp, 94); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp>7 ? 7 - -8 : (temp<-8 ? 0 : temp - -8); LAR++;;
  temp = gsm_mult(15360, *LAR); temp = gsm_add(temp, -1792); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp>7 ? 7 - -8 : (temp<-8 ? 0 : temp - -8); LAR++;;
  temp = gsm_mult(8534, *LAR); temp = gsm_add(temp, -341); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp>3 ? 3 - -4 : (temp<-4 ? 0 : temp - -4); LAR++;;
  temp = gsm_mult(9036, *LAR); temp = gsm_add(temp, -1144); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp>3 ? 3 - -4 : (temp<-4 ? 0 : temp - -4); LAR++;;


}





void
Gsm_LPC_Analysis ()
{
  word inData[160] =
  { 81, 10854, 1893, -10291, 7614, 29718, 20475, -29215, -18949, -29806,
  -32017, 1596, 15744, -3088, -17413, -22123, 6798, -13276, 3819, -16273,
    -1573, -12523, -27103,
  -193, -25588, 4698, -30436, 15264, -1393, 11418, 11370, 4986, 7869, -1903,
    9123, -31726,
  -25237, -14155, 17982, 32427, -12439, -15931, -21622, 7896, 1689, 28113,
    3615, 22131, -5572,
  -20110, 12387, 9177, -24544, 12480, 21546, -17842, -13645, 20277, 9987,
    17652, -11464, -17326,
  -10552, -27100, 207, 27612, 2517, 7167, -29734, -22441, 30039, -2368, 12813,
    300, -25555, 9087,
  29022, -6559, -20311, -14347, -7555, -21709, -3676, -30082, -3190, -30979,
    8580, 27126, 3414,
  -4603, -22303, -17143, 13788, -1096, -14617, 22071, -13552, 32646, 16689,
    -8473, -12733, 10503,
  20745, 6696, -26842, -31015, 3792, -19864, -20431, -30307, 32421, -13237,
    9006, 18249, 2403,
  -7996, -14827, -5860, 7122, 29817, -31894, 17955, 28836, -31297, 31821,
    -27502, 12276, -5587,
  -22105, 9192, -22549, 15675, -12265, 7212, -23749, -12856, -5857, 7521,
    17349, 13773, -3091,
  -17812, -9655, 26667, 7902, 2487, 3177, 29412, -20224, -2776, 24084, -7963,
    -10438, -11938,
  -14833, -6658, 32058, 4020, 10461, 15159
};
  word LARc[8];
  longword L_ACF[9];

  Autocorrelation (inData, L_ACF);
  Reflection_coefficients (L_ACF, LARc);
  Transformation_to_Log_Area_Ratios (LARc);
  Quantization_and_coding (LARc);
}
# 21 "benchmarks/chstone/gsm/src/gsm.c" 2
# 33 "benchmarks/chstone/gsm/src/gsm.c"
const word inData[160] =
  { 81, 10854, 1893, -10291, 7614, 29718, 20475, -29215, -18949, -29806,
  -32017, 1596, 15744, -3088, -17413, -22123, 6798, -13276, 3819, -16273,
    -1573, -12523, -27103,
  -193, -25588, 4698, -30436, 15264, -1393, 11418, 11370, 4986, 7869, -1903,
    9123, -31726,
  -25237, -14155, 17982, 32427, -12439, -15931, -21622, 7896, 1689, 28113,
    3615, 22131, -5572,
  -20110, 12387, 9177, -24544, 12480, 21546, -17842, -13645, 20277, 9987,
    17652, -11464, -17326,
  -10552, -27100, 207, 27612, 2517, 7167, -29734, -22441, 30039, -2368, 12813,
    300, -25555, 9087,
  29022, -6559, -20311, -14347, -7555, -21709, -3676, -30082, -3190, -30979,
    8580, 27126, 3414,
  -4603, -22303, -17143, 13788, -1096, -14617, 22071, -13552, 32646, 16689,
    -8473, -12733, 10503,
  20745, 6696, -26842, -31015, 3792, -19864, -20431, -30307, 32421, -13237,
    9006, 18249, 2403,
  -7996, -14827, -5860, 7122, 29817, -31894, 17955, 28836, -31297, 31821,
    -27502, 12276, -5587,
  -22105, 9192, -22549, 15675, -12265, 7212, -23749, -12856, -5857, 7521,
    17349, 13773, -3091,
  -17812, -9655, 26667, 7902, 2487, 3177, 29412, -20224, -2776, 24084, -7963,
    -10438, -11938,
  -14833, -6658, 32058, 4020, 10461, 15159
};

const word outData[160] =
  { 80, 10848, 1888, -10288, 7616, 29712, 20480, -29216, -18944, -29808,
  -32016, 1600, 15744, -3088, -17408, -22128, 6800, -13280, 3824, -16272,
    -1568, -12528, -27104,
  -192, -25584, 4704, -30432, 15264, -1392, 11424, 11376, 4992, 7872, -1904,
    9120, -31728, -25232,
  -14160, 17984, 32432, -12432, -15936, -21616, 7904, 1696, 28112, 3616,
    22128, -5568, -20112,
  12384, 9184, -24544, 12480, 21552, -17840, -13648, 20272, 9984, 17648,
    -11456, -17328, -10544,
  -27104, 208, 27616, 2512, 7168, -29728, -22448, 30032, -2368, 12816, 304,
    -25552, 9088, 29024,
  -6560, -20304, -14352, -7552, -21712, -3680, -30080, -3184, -30976, 8576,
    27120, 3408, -4608,
  -22304, -17136, 13792, -1088, -14624, 22064, -13552, 32640, 16688, -8480,
    -12736, 10496, 20752,
  6704, -26848, -31008, 3792, -19856, -20432, -30304, 32416, -13232, 9008,
    18256, 2400, -8000,
  -14832, -5856, 7120, 29824, -31888, 17952, 28832, -31296, 31824, -27504,
    12272, -5584, -22112,
  9200, -22544, 15680, -12272, 7216, -23744, -12848, -5856, 7520, 17344,
    13776, -3088, -17808,
  -9648, 26672, 7904, 2480, 3184, 29408, -20224, -2768, 24080, -7968, -10432,
    -11936, -14832,
  -6656, 32064, 4016, 10464, 15152
};

const word outLARc[8] = { 32, 33, 22, 13, 7, 5, 3, 2 };

__attribute__((sdx_kernel("main", 0))) int
main ()
{
#line 112 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/hls/run_hls.tcl"
#pragma HLSDIRECTIVE TOP name=main
# 91 "benchmarks/chstone/gsm/src/gsm.c"

  int i;
  int main_result;
  word so[160];
  word LARc[8];
      main_result = 0;

main_label0: for (i = 0; i < 160; i++)
 so[i] = inData[i];

      Gsm_LPC_Analysis (so, LARc);

main_label1: for (i = 0; i < 160; i++)
 main_result += (so[i] != outData[i]);
main_label2: for (i = 0; i < 8; i++)
 main_result += (LARc[i] != outLARc[i]);

      printf ("%d\n", main_result);
      return main_result;
    }
