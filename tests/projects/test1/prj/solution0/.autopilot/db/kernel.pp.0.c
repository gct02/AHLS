# 1 "gnn/test/test1/kernel.c"
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
# 1 "gnn/test/test1/kernel.c" 2



void init_arr(int arr[100]) {
#line 10 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/gnn/test/test1/dct0.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 4 "gnn/test/test1/kernel.c"

#line 7 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/gnn/test/test1/dct0.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 4 "gnn/test/test1/kernel.c"

    int i;

    init_arr_loop1:
    for (i = 0; i < 100; i++) {
#line 4 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/gnn/test/test1/dct0.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 8 "gnn/test/test1/kernel.c"

#pragma HLS LOOP_TRIPCOUNT min=100 max=100 avg=100
 arr[i] = 0;
    }
}

int fn1(int arr[100]) {
#line 6 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/gnn/test/test1/dct0.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 14 "gnn/test/test1/kernel.c"

#line 9 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/gnn/test/test1/dct0.tcl"
#pragma HLSDIRECTIVE INLINE off=true
# 14 "gnn/test/test1/kernel.c"

    int i, num = 0;

    fn1_loop1:
    for (i = 0; i < 100; i++) {
#line 3 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/gnn/test/test1/dct0.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 18 "gnn/test/test1/kernel.c"

#pragma HLS LOOP_TRIPCOUNT min=100 max=100 avg=100
 if (arr[i] > 0) {
            num += arr[i];
        }
    }
    return num;
}

__attribute__((sdx_kernel("top_fn", 0))) void top_fn(int in_arr[100], int out_arr[100]) {
#line 5 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/gnn/test/test1/dct0.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 27 "gnn/test/test1/kernel.c"

#line 9 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/gnn/test/hls_config.tcl"
#pragma HLSDIRECTIVE TOP name=top_fn
# 27 "gnn/test/test1/kernel.c"

    int i, j, num;

    init_arr(out_arr);

    num = fn1(in_arr);

    top_fn_loop1:
    for (i = 0; i < 100; i++) {
#line 1 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/gnn/test/test1/dct0.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 35 "gnn/test/test1/kernel.c"

#pragma HLS LOOP_TRIPCOUNT min=100 max=100 avg=100

 top_fn_loop1_1:
        for (j = 0; j < 100; j++) {
#line 2 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/gnn/test/test1/dct0.tcl"
#pragma HLSDIRECTIVE PIPELINE off=true
# 39 "gnn/test/test1/kernel.c"

#line 8 "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/gnn/test/test1/dct0.tcl"
#pragma HLSDIRECTIVE LOOP_FLATTEN off=true
# 39 "gnn/test/test1/kernel.c"

#pragma HLS LOOP_TRIPCOUNT min=100 max=100 avg=100
 if (in_arr[j] > 0) {
                out_arr[i] = out_arr[i] + in_arr[j] + num;
            } else {
                out_arr[i] = out_arr[i] + in_arr[j];
            }
        }
    }
}
