# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 349 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin.c" 2
# 37 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin.c"
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin.h" 1



# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/softfloat.h" 1
# 53 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/softfloat.h"
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/milieu.h" 1
# 53 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/milieu.h"
# 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/SPARC-GCC.h" 1
# 61 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/SPARC-GCC.h"
typedef int flag;
typedef int int8;
typedef int int16;
typedef unsigned int uint32;
typedef signed int int32;







typedef unsigned short int bits16;
typedef unsigned int bits32;
typedef unsigned long long int bits64;
typedef signed long long int sbits64;
# 53 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/milieu.h" 2
# 54 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/softfloat.h" 2




typedef unsigned int float32;
typedef unsigned long long float64;
# 84 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/softfloat.h"
float64
int32_to_float64 (int32 a);

float64
float64_add (float64 a, float64 b);

float64
float64_mul (float64 a, float64 b);

float64
float64_div (float64 a, float64 b);

flag
float64_le (float64 a, float64 b);

flag
float64_ge (float64 a, float64 b);

float64
float64_neg (float64 x);
# 5 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin.h" 2

float64
local_sin (float64 rad);

double
ullong_to_double (unsigned long long x);
# 38 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/benchmarks/chstone/dfsin/src/dfsin.c" 2

float64
float64_abs (float64 x)
{
  return (x & 0x7fffffffffffffffULL);
}

float64
local_sin (float64 rad)
{
  float64 app;
  float64 diff;
  float64 m_rad2;
  int inc;

  app = diff = rad;
  inc = 1;
  m_rad2 = float64_neg (float64_mul (rad, rad));
  do
    {
      diff = float64_div (float64_mul (diff, m_rad2),
     int32_to_float64 ((2 * inc) * (2 * inc + 1)));
      app = float64_add (app, diff);
      inc++;
    }
  while (float64_ge (float64_abs (diff), 0x3ee4f8b588e368f1ULL));
  return app;
}

double
ullong_to_double (unsigned long long x)
{
  union
  {
    double d;
    unsigned long long ll;
  } t;

  t.ll = x;
  return t.d;
}
