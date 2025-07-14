# 1 "data/benchmarks/gsm/gsm_lpc.c"
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
# 1 "data/benchmarks/gsm/gsm_lpc.c" 2
# 27 "data/benchmarks/gsm/gsm_lpc.c"
# 1 "data/benchmarks/gsm/gsm_lpc.h" 1



# 1 "data/benchmarks/gsm/gsm_private.h" 1
# 30 "data/benchmarks/gsm/gsm_private.h"
typedef short word;
typedef long longword;
# 5 "data/benchmarks/gsm/gsm_lpc.h" 2
# 1 "data/benchmarks/gsm/gsm_add.h" 1





word gsm_add(word a, word b);
word gsm_mult(word a, word b);
word gsm_mult_r(word a, word b);
word gsm_abs(word a);
word gsm_norm(longword a);
word gsm_div(word num, word denum);
# 6 "data/benchmarks/gsm/gsm_lpc.h" 2
# 15 "data/benchmarks/gsm/gsm_lpc.h"
void Autocorrelation(word *s, longword *L_ACF);




void Reflection_coefficients(longword *L_ACF, register word *r);



void Transformation_to_Log_Area_Ratios(register word *r);



void Quantization_and_coding(register word *LAR);
# 28 "data/benchmarks/gsm/gsm_lpc.c" 2






void Autocorrelation(
    word *s ,
    longword *L_ACF
)
{
#line 22 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 38 "data/benchmarks/gsm/gsm_lpc.c"

#line 32 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 38 "data/benchmarks/gsm/gsm_lpc.c"

    register int k, i;
    word temp;
    word smax;
    word scalauto, n;
    word *sp;
    word sl;


    smax = 0;
    Autocorrelation_label0:
    for (k = 0; k <= 159; k++) {
#line 8 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 49 "data/benchmarks/gsm/gsm_lpc.c"

#pragma HLS LOOP_TRIPCOUNT min=160 max=160 avg=160
 temp = gsm_abs(s[k]);
        if (temp > smax)
            smax = temp;
    }


    if (smax == 0)
        scalauto = 0;
    else
        scalauto = 4 - gsm_norm((longword)smax << 16);

    if (scalauto > 0 && scalauto <= 4) {
        n = scalauto;
        Autocorrelation_label1:
        for (k = 0; k <= 159; k++) {
#line 9 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 65 "data/benchmarks/gsm/gsm_lpc.c"

#pragma HLS LOOP_TRIPCOUNT min=160 max=160 avg=160
 s[k] = gsm_mult_r(s[k], 16384 >> (n - 1));
        }
    }


    sp = s;
    sl = *sp;




    Autocorrelation_label2:
    for (k = 8; k >= 0; k--) {
#line 10 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 79 "data/benchmarks/gsm/gsm_lpc.c"

#pragma HLS LOOP_TRIPCOUNT min=9 max=9 avg=9
 L_ACF[k] = 0;
    }

    L_ACF[0] += ((longword)sl * sp[-(0)]);;
    sl = *++sp;
    L_ACF[0] += ((longword)sl * sp[-(0)]);;
    L_ACF[1] += ((longword)sl * sp[-(1)]);;
    sl = *++sp;
    L_ACF[0] += ((longword)sl * sp[-(0)]);;
    L_ACF[1] += ((longword)sl * sp[-(1)]);;
    L_ACF[2] += ((longword)sl * sp[-(2)]);;
    sl = *++sp;
    L_ACF[0] += ((longword)sl * sp[-(0)]);;
    L_ACF[1] += ((longword)sl * sp[-(1)]);;
    L_ACF[2] += ((longword)sl * sp[-(2)]);;
    L_ACF[3] += ((longword)sl * sp[-(3)]);;
    sl = *++sp;
    L_ACF[0] += ((longword)sl * sp[-(0)]);;
    L_ACF[1] += ((longword)sl * sp[-(1)]);;
    L_ACF[2] += ((longword)sl * sp[-(2)]);;
    L_ACF[3] += ((longword)sl * sp[-(3)]);;
    L_ACF[4] += ((longword)sl * sp[-(4)]);;
    sl = *++sp;
    L_ACF[0] += ((longword)sl * sp[-(0)]);;
    L_ACF[1] += ((longword)sl * sp[-(1)]);;
    L_ACF[2] += ((longword)sl * sp[-(2)]);;
    L_ACF[3] += ((longword)sl * sp[-(3)]);;
    L_ACF[4] += ((longword)sl * sp[-(4)]);;
    L_ACF[5] += ((longword)sl * sp[-(5)]);;
    sl = *++sp;
    L_ACF[0] += ((longword)sl * sp[-(0)]);;
    L_ACF[1] += ((longword)sl * sp[-(1)]);;
    L_ACF[2] += ((longword)sl * sp[-(2)]);;
    L_ACF[3] += ((longword)sl * sp[-(3)]);;
    L_ACF[4] += ((longword)sl * sp[-(4)]);;
    L_ACF[5] += ((longword)sl * sp[-(5)]);;
    L_ACF[6] += ((longword)sl * sp[-(6)]);;
    sl = *++sp;
    L_ACF[0] += ((longword)sl * sp[-(0)]);;
    L_ACF[1] += ((longword)sl * sp[-(1)]);;
    L_ACF[2] += ((longword)sl * sp[-(2)]);;
    L_ACF[3] += ((longword)sl * sp[-(3)]);;
    L_ACF[4] += ((longword)sl * sp[-(4)]);;
    L_ACF[5] += ((longword)sl * sp[-(5)]);;
    L_ACF[6] += ((longword)sl * sp[-(6)]);;
    L_ACF[7] += ((longword)sl * sp[-(7)]);;

    Autocorrelation_label3:
    for (i = 8; i <= 159; i++) {
#line 11 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 129 "data/benchmarks/gsm/gsm_lpc.c"

#pragma HLS LOOP_TRIPCOUNT min=152 max=152 avg=152
 sl = *++sp;
        L_ACF[0] += ((longword)sl * sp[-(0)]);;
        L_ACF[1] += ((longword)sl * sp[-(1)]);;
        L_ACF[2] += ((longword)sl * sp[-(2)]);;
        L_ACF[3] += ((longword)sl * sp[-(3)]);;
        L_ACF[4] += ((longword)sl * sp[-(4)]);;
        L_ACF[5] += ((longword)sl * sp[-(5)]);;
        L_ACF[6] += ((longword)sl * sp[-(6)]);;
        L_ACF[7] += ((longword)sl * sp[-(7)]);;
        L_ACF[8] += ((longword)sl * sp[-(8)]);;
    }

    Autocorrelation_label4:
    for (k = 8; k >= 0; k--) {
#line 12 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 144 "data/benchmarks/gsm/gsm_lpc.c"

#pragma HLS LOOP_TRIPCOUNT min=9 max=9 avg=9
 L_ACF[k] <<= 1;
    }


    if (scalauto > 0) {
        Autocorrelation_label5:
        for (k = 159; k >= 0; k--) {
#line 13 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 152 "data/benchmarks/gsm/gsm_lpc.c"

#pragma HLS LOOP_TRIPCOUNT min=160 max=160 avg=160
 *s++ <<= scalauto;
        }
    }
}


void Reflection_coefficients(
    longword *L_ACF ,
    register word *r
)
{
#line 23 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 164 "data/benchmarks/gsm/gsm_lpc.c"

#line 33 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 164 "data/benchmarks/gsm/gsm_lpc.c"

    register int i, m, n;
    register word temp;
    word ACF[9];
    word P[9];
    word K[9];


    if (L_ACF[0] == 0) {
        Reflection_coefficients_label0:
        for (i = 8; i > 0; i--) {
#line 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 174 "data/benchmarks/gsm/gsm_lpc.c"

#pragma HLS LOOP_TRIPCOUNT min=8 max=8 avg=8
 *r++ = 0;
        }
        return;
    }

    temp = gsm_norm(L_ACF[0]);

    Reflection_coefficients_label1:
    for (i = 0; i <= 8; i++) {
#line 2 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 184 "data/benchmarks/gsm/gsm_lpc.c"

#pragma HLS LOOP_TRIPCOUNT min=9 max=9 avg=9
 ACF[i] = ((L_ACF[i] << temp) >> (16));
    }


    Reflection_coefficients_label2:
    for (i = 1; i <= 7; i++) {
#line 3 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 191 "data/benchmarks/gsm/gsm_lpc.c"

#pragma HLS LOOP_TRIPCOUNT min=7 max=7 avg=7
 K[i] = ACF[i];
    }

    Reflection_coefficients_label3:
    for (i = 0; i <= 8; i++) {
#line 4 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 197 "data/benchmarks/gsm/gsm_lpc.c"

#pragma HLS LOOP_TRIPCOUNT min=9 max=9 avg=9
 P[i] = ACF[i];
    }


    Reflection_coefficients_label4:
    for (n = 1; n <= 8; n++, r++) {
#line 5 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 204 "data/benchmarks/gsm/gsm_lpc.c"

#pragma HLS LOOP_TRIPCOUNT min=1 max=8
 temp = P[1];
        temp = gsm_abs(temp);
        if (P[0] < temp) {
            Reflection_coefficients_label6:
            for (i = n; i <= 8; i++) {
#line 25 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 210 "data/benchmarks/gsm/gsm_lpc.c"

#line 7 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 210 "data/benchmarks/gsm/gsm_lpc.c"

#pragma HLS LOOP_TRIPCOUNT min=1 max=8
 *r++ = 0;
            }
            return;
        }

        *r = gsm_div(temp, P[0]);

        if (P[1] > 0)
            *r = -*r;
        if (n == 8)
            return;


        temp = gsm_mult_r(P[1], *r);
        P[0] = gsm_add(P[0], temp);

        Reflection_coefficients_label5:
        for (m = 1; m <= 8 - n; m++) {
#line 24 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 229 "data/benchmarks/gsm/gsm_lpc.c"

#line 6 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/gsm.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 229 "data/benchmarks/gsm/gsm_lpc.c"

#pragma HLS LOOP_TRIPCOUNT min=1 max=7
 temp = gsm_mult_r(K[m], *r);
            P[m] = gsm_add(P[m + 1], temp);

            temp = gsm_mult_r(P[m + 1], *r);
            K[m] = gsm_add(K[m], temp);
        }
    }
}


void Transformation_to_Log_Area_Ratios(register word *r )
{
    register word temp;
    register int i;


    Transformation_to_Log_Area_Ratios_label0:
    for (i = 1; i <= 8; i++, r++) {
#pragma HLS LOOP_TRIPCOUNT min=8 max=8 avg=8
 temp = *r;
        temp = gsm_abs(temp);

        if (temp < 22118) {
            temp >>= 1;
        } else if (temp < 31130) {
            temp -= 11059;
        } else {
            temp -= 26112;
            temp <<= 2;
        }

        *r = *r < 0 ? -temp : temp;
    }
}


void Quantization_and_coding(register word *LAR )
{
    register word temp;
# 289 "data/benchmarks/gsm/gsm_lpc.c"
    temp = gsm_mult(20480, *LAR); temp = gsm_add(temp, 0); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp > 31 ? 31 - -32 : (temp < -32 ? 0 : temp - -32); LAR++;;
    temp = gsm_mult(20480, *LAR); temp = gsm_add(temp, 0); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp > 31 ? 31 - -32 : (temp < -32 ? 0 : temp - -32); LAR++;;
    temp = gsm_mult(20480, *LAR); temp = gsm_add(temp, 2048); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp > 15 ? 15 - -16 : (temp < -16 ? 0 : temp - -16); LAR++;;
    temp = gsm_mult(20480, *LAR); temp = gsm_add(temp, -2560); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp > 15 ? 15 - -16 : (temp < -16 ? 0 : temp - -16); LAR++;;

    temp = gsm_mult(13964, *LAR); temp = gsm_add(temp, 94); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp > 7 ? 7 - -8 : (temp < -8 ? 0 : temp - -8); LAR++;;
    temp = gsm_mult(15360, *LAR); temp = gsm_add(temp, -1792); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp > 7 ? 7 - -8 : (temp < -8 ? 0 : temp - -8); LAR++;;
    temp = gsm_mult(8534, *LAR); temp = gsm_add(temp, -341); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp > 3 ? 3 - -4 : (temp < -4 ? 0 : temp - -4); LAR++;;
    temp = gsm_mult(9036, *LAR); temp = gsm_add(temp, -1144); temp = gsm_add(temp, 256); temp = ((temp) >> (9)); *LAR = temp > 3 ? 3 - -4 : (temp < -4 ? 0 : temp - -4); LAR++;;


}
