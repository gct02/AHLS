# 1 "benchmarks/chstone/dfsin/src/softfloat.c"
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
# 1 "benchmarks/chstone/dfsin/src/softfloat.c" 2
# 50 "benchmarks/chstone/dfsin/src/softfloat.c"
# 1 "benchmarks/chstone/dfsin/src/milieu.h" 1
# 53 "benchmarks/chstone/dfsin/src/milieu.h"
# 1 "benchmarks/chstone/dfsin/src/SPARC-GCC.h" 1
# 61 "benchmarks/chstone/dfsin/src/SPARC-GCC.h"
typedef int flag;
typedef int int8;
typedef int int16;
typedef unsigned int uint32;
typedef signed int int32;







typedef unsigned short int bits16;
typedef unsigned int bits32;
typedef unsigned long long int bits64;
typedef signed long long int sbits64;
# 53 "benchmarks/chstone/dfsin/src/milieu.h" 2
# 51 "benchmarks/chstone/dfsin/src/softfloat.c" 2
# 1 "benchmarks/chstone/dfsin/src/softfloat.h" 1
# 53 "benchmarks/chstone/dfsin/src/softfloat.h"
# 1 "benchmarks/chstone/dfsin/src/milieu.h" 1
# 54 "benchmarks/chstone/dfsin/src/softfloat.h" 2




typedef unsigned int float32;
typedef unsigned long long float64;
# 84 "benchmarks/chstone/dfsin/src/softfloat.h"
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
# 52 "benchmarks/chstone/dfsin/src/softfloat.c" 2





int8 float_rounding_mode = 0;
int8 float_exception_flags = 0;







# 1 "benchmarks/chstone/dfsin/src/softfloat-macros" 1
# 62 "benchmarks/chstone/dfsin/src/softfloat-macros"
       void
shift64RightJamming (bits64 a, int16 count, bits64 * zPtr)
{
  bits64 z;

  if (count == 0)
    {
      z = a;
    }
  else if (count < 64)
    {
      z = (a >> count) | ((a << ((-count) & 63)) != 0);
    }
  else
    {
      z = (a != 0);
    }
  *zPtr = z;

}
# 100 "benchmarks/chstone/dfsin/src/softfloat-macros"
       void
shift64ExtraRightJamming (bits64 a0, bits64 a1, int16 count, bits64 * z0Ptr,
     bits64 * z1Ptr)
{
  bits64 z0, z1;
  int8 negCount;
  negCount = (-count) & 63;

  if (count == 0)
    {
      z1 = a1;
      z0 = a0;
    }
  else if (count < 64)
    {
      z1 = (a0 << negCount) | (a1 != 0);
      z0 = a0 >> count;
    }
  else
    {
      if (count == 64)
 {
   z1 = a0 | (a1 != 0);
 }
      else
 {
   z1 = ((a0 | a1) != 0);
 }
      z0 = 0;
    }
  *z1Ptr = z1;
  *z0Ptr = z0;

}
# 142 "benchmarks/chstone/dfsin/src/softfloat-macros"
       void
add128 (bits64 a0, bits64 a1, bits64 b0, bits64 b1, bits64 * z0Ptr,
 bits64 * z1Ptr)
{
  bits64 z1;

  z1 = a1 + b1;
  *z1Ptr = z1;
  *z0Ptr = a0 + b0 + (z1 < a1);

}
# 162 "benchmarks/chstone/dfsin/src/softfloat-macros"
       void
sub128 (bits64 a0, bits64 a1, bits64 b0, bits64 b1, bits64 * z0Ptr,
 bits64 * z1Ptr)
{

  *z1Ptr = a1 - b1;
  *z0Ptr = a0 - b0 - (a1 < b1);

}







       void
mul64To128 (bits64 a, bits64 b, bits64 * z0Ptr, bits64 * z1Ptr)
{
  bits32 aHigh, aLow, bHigh, bLow;
  bits64 z0, zMiddleA, zMiddleB, z1;

  aLow = a;
  aHigh = a >> 32;
  bLow = b;
  bHigh = b >> 32;
  z1 = ((bits64) aLow) * bLow;
  zMiddleA = ((bits64) aLow) * bHigh;
  zMiddleB = ((bits64) aHigh) * bLow;
  z0 = ((bits64) aHigh) * bHigh;
  zMiddleA += zMiddleB;
  z0 += (((bits64) (zMiddleA < zMiddleB)) << 32) + (zMiddleA >> 32);
  zMiddleA <<= 32;
  z1 += zMiddleA;
  z0 += (z1 < zMiddleA);
  *z1Ptr = z1;
  *z0Ptr = z0;

}
# 211 "benchmarks/chstone/dfsin/src/softfloat-macros"
static bits64
estimateDiv128To64 (bits64 a0, bits64 a1, bits64 b)
{
  bits64 b0, b1;
  bits64 rem0, rem1, term0, term1;
  bits64 z;

  if (b <= a0)
    return 0xFFFFFFFFFFFFFFFFLL;
  b0 = b >> 32;
  z = (b0 << 32 <= a0) ? 0xFFFFFFFF00000000LL : (a0 / b0) << 32;
  mul64To128 (b, z, &term0, &term1);
  sub128 (a0, a1, term0, term1, &rem0, &rem1);
  VITIS_LOOP_224_1: while (((sbits64) rem0) < 0)
    {
      z -= 0x100000000LL;
      b1 = b << 32;
      add128 (rem0, rem1, b0, b1, &rem0, &rem1);
    }
  rem0 = (rem0 << 32) | (rem1 >> 32);
  z |= (b0 << 32 <= rem0) ? 0xFFFFFFFF : rem0 / b0;
  return z;

}






static int8
countLeadingZeros32 (bits32 a)
{
  static const int8 countLeadingZerosHigh[256] = {
    8, 7, 6, 6, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4,
    3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  int8 shiftCount;

  shiftCount = 0;
  if (a < 0x10000)
    {
      shiftCount += 16;
      a <<= 16;
    }
  if (a < 0x1000000)
    {
      shiftCount += 8;
      a <<= 8;
    }
  shiftCount += countLeadingZerosHigh[a >> 24];
  return shiftCount;

}






static int8
countLeadingZeros64 (bits64 a)
{
  int8 shiftCount;

  shiftCount = 0;
  if (a < ((bits64) 1) << 32)
    {
      shiftCount += 32;
    }
  else
    {
      a >>= 32;
    }
  shiftCount += countLeadingZeros32 (a);
  return shiftCount;

}
# 66 "benchmarks/chstone/dfsin/src/softfloat.c" 2
# 75 "benchmarks/chstone/dfsin/src/softfloat.c"
# 1 "benchmarks/chstone/dfsin/src/softfloat-specialize" 1
# 66 "benchmarks/chstone/dfsin/src/softfloat-specialize"
void
float_raise (int8 flags)
{
  float_exception_flags |= flags;

}
# 83 "benchmarks/chstone/dfsin/src/softfloat-specialize"
flag
float64_is_nan (float64 a)
{

  return (0xFFE0000000000000LL < (bits64) (a << 1));

}






flag
float64_is_signaling_nan (float64 a)
{

  return (((a >> 51) & 0xFFF) == 0xFFE) && (a & 0x0007FFFFFFFFFFFFLL);

}







static float64
propagateFloat64NaN (float64 a, float64 b)
{
  flag aIsNaN, aIsSignalingNaN, bIsNaN, bIsSignalingNaN;

  aIsNaN = float64_is_nan (a);
  aIsSignalingNaN = float64_is_signaling_nan (a);
  bIsNaN = float64_is_nan (b);
  bIsSignalingNaN = float64_is_signaling_nan (b);
  a |= 0x0008000000000000LL;
  b |= 0x0008000000000000LL;
  if (aIsSignalingNaN | bIsSignalingNaN)
    float_raise (16);
  return bIsSignalingNaN ? b : aIsSignalingNaN ? a : bIsNaN ? b : a;

}
# 76 "benchmarks/chstone/dfsin/src/softfloat.c" 2





       bits64
extractFloat64Frac (float64 a)
{

  return a & 0x000FFFFFFFFFFFFFLL;

}





       int16
extractFloat64Exp (float64 a)
{

  return (a >> 52) & 0x7FF;

}





       flag
extractFloat64Sign (float64 a)
{

  return a >> 63;

}
# 120 "benchmarks/chstone/dfsin/src/softfloat.c"
static void
normalizeFloat64Subnormal (bits64 aSig, int16 * zExpPtr, bits64 * zSigPtr)
{
  int8 shiftCount;

  shiftCount = countLeadingZeros64 (aSig) - 11;
  *zSigPtr = aSig << shiftCount;
  *zExpPtr = 1 - shiftCount;

}
# 142 "benchmarks/chstone/dfsin/src/softfloat.c"
       float64
packFloat64 (flag zSign, int16 zExp, bits64 zSig)
{

  return (((bits64) zSign) << 63) + (((bits64) zExp) << 52) + zSig;

}
# 172 "benchmarks/chstone/dfsin/src/softfloat.c"
static float64
roundAndPackFloat64 (flag zSign, int16 zExp, bits64 zSig)
{
  int8 roundingMode;
  flag roundNearestEven, isTiny;
  int16 roundIncrement, roundBits;

  roundingMode = float_rounding_mode;
  roundNearestEven = (roundingMode == 0);
  roundIncrement = 0x200;
  if (!roundNearestEven)
    {
      if (roundingMode == 1)
 {
   roundIncrement = 0;
 }
      else
 {
   roundIncrement = 0x3FF;
   if (zSign)
     {
       if (roundingMode == 2)
  roundIncrement = 0;
     }
   else
     {
       if (roundingMode == 3)
  roundIncrement = 0;
     }
 }
    }
  roundBits = zSig & 0x3FF;
  if (0x7FD <= (bits16) zExp)
    {
      if ((0x7FD < zExp)
   || ((zExp == 0x7FD) && ((sbits64) (zSig + roundIncrement) < 0)))
 {
   float_raise (8 | 1);
   return packFloat64 (zSign, 0x7FF, 0) - (roundIncrement == 0);
 }
      if (zExp < 0)
 {
   isTiny = (1 == 1)
     || (zExp < -1)
     || (zSig + roundIncrement < 0x8000000000000000LL);
   shift64RightJamming (zSig, -zExp, &zSig);
   zExp = 0;
   roundBits = zSig & 0x3FF;
   if (isTiny && roundBits)
     float_raise (4);
 }
    }
  if (roundBits)
    float_exception_flags |= 1;
  zSig = (zSig + roundIncrement) >> 10;
  zSig &= ~(((roundBits ^ 0x200) == 0) & roundNearestEven);
  if (zSig == 0)
    zExp = 0;
  return packFloat64 (zSign, zExp, zSig);

}
# 243 "benchmarks/chstone/dfsin/src/softfloat.c"
static float64
normalizeRoundAndPackFloat64 (flag zSign, int16 zExp, bits64 zSig)
{
  int8 shiftCount;

  shiftCount = countLeadingZeros64 (zSig) - 1;
  return roundAndPackFloat64 (zSign, zExp - shiftCount, zSig << shiftCount);

}







float64
int32_to_float64 (int32 a)
{
  flag zSign;
  uint32 absA;
  int8 shiftCount;
  bits64 zSig;

  if (a == 0)
    return 0;
  zSign = (a < 0);
  absA = zSign ? -a : a;
  shiftCount = countLeadingZeros32 (absA) + 21;
  zSig = absA;
  return packFloat64 (zSign, 0x432 - shiftCount, zSig << shiftCount);

}
# 285 "benchmarks/chstone/dfsin/src/softfloat.c"
static float64
addFloat64Sigs (float64 a, float64 b, flag zSign)
{
  int16 aExp, bExp, zExp;
  bits64 aSig, bSig, zSig;
  int16 expDiff;

  aSig = extractFloat64Frac (a);
  aExp = extractFloat64Exp (a);
  bSig = extractFloat64Frac (b);
  bExp = extractFloat64Exp (b);
  expDiff = aExp - bExp;
  aSig <<= 9;
  bSig <<= 9;
  if (0 < expDiff)
    {
      if (aExp == 0x7FF)
 {
   if (aSig)
     return propagateFloat64NaN (a, b);
   return a;
 }
      if (bExp == 0)
 --expDiff;
      else
 bSig |= 0x2000000000000000LL;
      shift64RightJamming (bSig, expDiff, &bSig);
      zExp = aExp;
    }
  else if (expDiff < 0)
    {
      if (bExp == 0x7FF)
 {
   if (bSig)
     return propagateFloat64NaN (a, b);
   return packFloat64 (zSign, 0x7FF, 0);
 }
      if (aExp == 0)
 ++expDiff;
      else
 {
   aSig |= 0x2000000000000000LL;
 }
      shift64RightJamming (aSig, -expDiff, &aSig);
      zExp = bExp;
    }
  else
    {
      if (aExp == 0x7FF)
 {
   if (aSig | bSig)
     return propagateFloat64NaN (a, b);
   return a;
 }
      if (aExp == 0)
 return packFloat64 (zSign, 0, (aSig + bSig) >> 9);
      zSig = 0x4000000000000000LL + aSig + bSig;
      zExp = aExp;
      goto roundAndPack;
    }
  aSig |= 0x2000000000000000LL;
  zSig = (aSig + bSig) << 1;
  --zExp;
  if ((sbits64) zSig < 0)
    {
      zSig = aSig + bSig;
      ++zExp;
    }
roundAndPack:
  return roundAndPackFloat64 (zSign, zExp, zSig);

}
# 366 "benchmarks/chstone/dfsin/src/softfloat.c"
static float64
subFloat64Sigs (float64 a, float64 b, flag zSign)
{
  int16 aExp, bExp, zExp;
  bits64 aSig, bSig, zSig;
  int16 expDiff;

  aSig = extractFloat64Frac (a);
  aExp = extractFloat64Exp (a);
  bSig = extractFloat64Frac (b);
  bExp = extractFloat64Exp (b);
  expDiff = aExp - bExp;
  aSig <<= 10;
  bSig <<= 10;
  if (0 < expDiff)
    goto aExpBigger;
  if (expDiff < 0)
    goto bExpBigger;
  if (aExp == 0x7FF)
    {
      if (aSig | bSig)
 return propagateFloat64NaN (a, b);
      float_raise (16);
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  if (aExp == 0)
    {
      aExp = 1;
      bExp = 1;
    }
  if (bSig < aSig)
    goto aBigger;
  if (aSig < bSig)
    goto bBigger;
  return packFloat64 (float_rounding_mode == 3, 0, 0);
bExpBigger:
  if (bExp == 0x7FF)
    {
      if (bSig)
 return propagateFloat64NaN (a, b);
      return packFloat64 (zSign ^ 1, 0x7FF, 0);
    }
  if (aExp == 0)
    ++expDiff;
  else
    aSig |= 0x4000000000000000LL;
  shift64RightJamming (aSig, -expDiff, &aSig);
  bSig |= 0x4000000000000000LL;
bBigger:
  zSig = bSig - aSig;
  zExp = bExp;
  zSign ^= 1;
  goto normalizeRoundAndPack;
aExpBigger:
  if (aExp == 0x7FF)
    {
      if (aSig)
 return propagateFloat64NaN (a, b);
      return a;
    }
  if (bExp == 0)
    --expDiff;
  else
    bSig |= 0x4000000000000000LL;
  shift64RightJamming (bSig, expDiff, &bSig);
  aSig |= 0x4000000000000000LL;
aBigger:
  zSig = aSig - bSig;
  zExp = aExp;
normalizeRoundAndPack:
  --zExp;
  return normalizeRoundAndPackFloat64 (zSign, zExp, zSig);

}







float64
float64_add (float64 a, float64 b)
{
  flag aSign, bSign;

  aSign = extractFloat64Sign (a);
  bSign = extractFloat64Sign (b);
  if (aSign == bSign)
    return addFloat64Sigs (a, b, aSign);
  else
    return subFloat64Sigs (a, b, aSign);

}







float64
float64_mul (float64 a, float64 b)
{
  flag aSign, bSign, zSign;
  int16 aExp, bExp, zExp;
  bits64 aSig, bSig, zSig0, zSig1;

  aSig = extractFloat64Frac (a);
  aExp = extractFloat64Exp (a);
  aSign = extractFloat64Sign (a);
  bSig = extractFloat64Frac (b);
  bExp = extractFloat64Exp (b);
  bSign = extractFloat64Sign (b);
  zSign = aSign ^ bSign;
  if (aExp == 0x7FF)
    {
      if (aSig || ((bExp == 0x7FF) && bSig))
 return propagateFloat64NaN (a, b);
      if ((bExp | bSig) == 0)
 {
   float_raise (16);
   return 0x7FFFFFFFFFFFFFFFLL;
 }
      return packFloat64 (zSign, 0x7FF, 0);
    }
  if (bExp == 0x7FF)
    {
      if (bSig)
 return propagateFloat64NaN (a, b);
      if ((aExp | aSig) == 0)
 {
   float_raise (16);
   return 0x7FFFFFFFFFFFFFFFLL;
 }
      return packFloat64 (zSign, 0x7FF, 0);
    }
  if (aExp == 0)
    {
      if (aSig == 0)
 return packFloat64 (zSign, 0, 0);
      normalizeFloat64Subnormal (aSig, &aExp, &aSig);
    }
  if (bExp == 0)
    {
      if (bSig == 0)
 return packFloat64 (zSign, 0, 0);
      normalizeFloat64Subnormal (bSig, &bExp, &bSig);
    }
  zExp = aExp + bExp - 0x3FF;
  aSig = (aSig | 0x0010000000000000LL) << 10;
  bSig = (bSig | 0x0010000000000000LL) << 11;
  mul64To128 (aSig, bSig, &zSig0, &zSig1);
  zSig0 |= (zSig1 != 0);
  if (0 <= (sbits64) (zSig0 << 1))
    {
      zSig0 <<= 1;
      --zExp;
    }
  return roundAndPackFloat64 (zSign, zExp, zSig0);

}







float64
float64_div (float64 a, float64 b)
{
  flag aSign, bSign, zSign;
  int16 aExp, bExp, zExp;
  bits64 aSig, bSig, zSig;
  bits64 rem0, rem1, term0, term1;

  aSig = extractFloat64Frac (a);
  aExp = extractFloat64Exp (a);
  aSign = extractFloat64Sign (a);
  bSig = extractFloat64Frac (b);
  bExp = extractFloat64Exp (b);
  bSign = extractFloat64Sign (b);
  zSign = aSign ^ bSign;
  if (aExp == 0x7FF)
    {
      if (aSig)
 return propagateFloat64NaN (a, b);
      if (bExp == 0x7FF)
 {
   if (bSig)
     return propagateFloat64NaN (a, b);
   float_raise (16);
   return 0x7FFFFFFFFFFFFFFFLL;
 }
      return packFloat64 (zSign, 0x7FF, 0);
    }
  if (bExp == 0x7FF)
    {
      if (bSig)
 return propagateFloat64NaN (a, b);
      return packFloat64 (zSign, 0, 0);
    }
  if (bExp == 0)
    {
      if (bSig == 0)
 {
   if ((aExp | aSig) == 0)
     {
       float_raise (16);
       return 0x7FFFFFFFFFFFFFFFLL;
     }
   float_raise (2);
   return packFloat64 (zSign, 0x7FF, 0);
 }
      normalizeFloat64Subnormal (bSig, &bExp, &bSig);
    }
  if (aExp == 0)
    {
      if (aSig == 0)
 return packFloat64 (zSign, 0, 0);
      normalizeFloat64Subnormal (aSig, &aExp, &aSig);
    }
  zExp = aExp - bExp + 0x3FD;
  aSig = (aSig | 0x0010000000000000LL) << 10;
  bSig = (bSig | 0x0010000000000000LL) << 11;
  if (bSig <= (aSig + aSig))
    {
      aSig >>= 1;
      ++zExp;
    }
  zSig = estimateDiv128To64 (aSig, 0, bSig);
  if ((zSig & 0x1FF) <= 2)
    {
      mul64To128 (bSig, zSig, &term0, &term1);
      sub128 (aSig, 0, term0, term1, &rem0, &rem1);
      VITIS_LOOP_602_1: while ((sbits64) rem0 < 0)
 {
   --zSig;
   add128 (rem0, rem1, 0, bSig, &rem0, &rem1);
 }
      zSig |= (rem1 != 0);
    }
  return roundAndPackFloat64 (zSign, zExp, zSig);

}
# 620 "benchmarks/chstone/dfsin/src/softfloat.c"
flag
float64_le (float64 a, float64 b)
{
  flag aSign, bSign;

  if (((extractFloat64Exp (a) == 0x7FF) && extractFloat64Frac (a))
      || ((extractFloat64Exp (b) == 0x7FF) && extractFloat64Frac (b)))
    {
      float_raise (16);
      return 0;
    }
  aSign = extractFloat64Sign (a);
  bSign = extractFloat64Sign (b);
  if (aSign != bSign)
    return aSign || ((bits64) ((a | b) << 1) == 0);
  return (a == b) || (aSign ^ (a < b));

}

flag
float64_ge (float64 a, float64 b)
{
  return float64_le (b, a);
}


float64
float64_neg (float64 x)
{
  return (((~x) & 0x8000000000000000ULL) | (x & 0x7fffffffffffffffULL));
}