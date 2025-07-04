; ModuleID = 'a.o.3.bc'
source_filename = "a.o.3.bc"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

$_ssdm_op_SpecTopModule = comdat any

$_ssdm_op_SpecPipeline = comdat any

$_ssdm_op_SpecLoopTripCount = comdat any

$_ssdm_op_SpecLoopName = comdat any

$_ssdm_op_SpecInterface = comdat any

$_ssdm_op_SpecBitsMap = comdat any

$_ssdm_op_Read.ap_auto.i7 = comdat any

$_ssdm_op_Read.ap_auto.i4 = comdat any

$_ssdm_op_Read.ap_auto.i32 = comdat any

$_ssdm_op_Read.ap_auto.i31 = comdat any

$_ssdm_op_Read.ap_auto.i14 = comdat any

$_ssdm_op_Read.ap_auto.i1 = comdat any

$_ssdm_op_PartSelect.i8.i32.i32.i32 = comdat any

$_ssdm_op_PartSelect.i6.i32.i32.i32 = comdat any

$_ssdm_op_PartSelect.i5.i7.i32.i32 = comdat any

$_ssdm_op_PartSelect.i5.i32.i32.i32 = comdat any

$_ssdm_op_PartSelect.i30.i32.i32.i32 = comdat any

$_ssdm_op_PartSelect.i3.i32.i32.i32 = comdat any

$_ssdm_op_PartSelect.i26.i32.i32.i32 = comdat any

$_ssdm_op_BitSelect.i1.i7.i32 = comdat any

$_ssdm_op_BitSelect.i1.i32.i32 = comdat any

$_ssdm_op_BitConcatenate.i32.i8.i8.i8.i8 = comdat any

$_ssdm_op_BitConcatenate.i32.i27.i5 = comdat any

$_ssdm_op_BitConcatenate.i32.i2.i30 = comdat any

$_ssdm_op_BitConcatenate.i14.i8.i6 = comdat any

$_ssdm_op_BitConcatenate.i14.i1.i13 = comdat any

@sha_stream_label1_VITIS_LOOP_207_1_str = internal unnamed_addr constant [35 x i8] c"sha_stream_label1_VITIS_LOOP_207_1\00"
@sha_info_digest = internal unnamed_addr global [5 x i32] zeroinitializer, align 512
@sha_info_data = internal unnamed_addr global [16 x i32] zeroinitializer, align 512
@sha_info_count_lo = internal unnamed_addr global i32 0, align 512
@sha_info_count_hi = internal unnamed_addr global i32 0, align 512
@local_indata = internal global [16384 x i8] zeroinitializer
@empty = internal unnamed_addr constant [21 x i8] c"sha_transform_label5\00"
@empty_0 = internal unnamed_addr constant [21 x i8] c"sha_transform_label2\00"
@empty_1 = internal unnamed_addr constant [21 x i8] c"sha_transform_label3\00"
@empty_2 = internal unnamed_addr constant [21 x i8] c"sha_transform_label4\00"
@empty_3 = internal unnamed_addr constant [10 x i8] c"ap_memory\00"
@empty_4 = internal unnamed_addr constant [21 x i8] c"sha_transform_label1\00"
@empty_5 = internal unnamed_addr constant [11 x i8] c"sha_stream\00"
@empty_6 = internal unnamed_addr constant [18 x i8] c"sha_stream_label2\00"
@empty_7 = internal unnamed_addr constant [1 x i8] zeroinitializer
@empty_8 = internal unnamed_addr constant [21 x i8] c"sha_transform_label6\00"
@empty_9 = internal unnamed_addr constant [18 x i8] c"sha_stream_label0\00"
@empty_10 = internal unnamed_addr constant [20 x i8] c"local_memcpy_label3\00"
@empty_11 = internal unnamed_addr constant [18 x i8] c"sha_update_label4\00"
@empty_12 = internal unnamed_addr constant [20 x i8] c"local_memset_label1\00"

; Function Attrs: noinline
define internal fastcc void @sha_update([16384 x i8]* noalias nocapture align 512 %buffer, i1 %buffer_offset, i32 %count) #0 {
entry:
  %idx = alloca i32, !bitwidth !15
  %count_addr_02 = alloca i32, !bitwidth !57
  %count_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %count), !bitwidth !11
  %buffer_offset_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %buffer_offset), !bitwidth !9
  %sha_info_count_lo_load = load i32, i32* @sha_info_count_lo, align 512, !bitwidth !11, !dep_idx !205, !deps !206
  %shl_ln155 = shl i32 %count_read, 3, !bitwidth !11
  %add_ln155 = add i32 %sha_info_count_lo_load, %shl_ln155, !bitwidth !11
  %icmp_ln155 = icmp ult i32 %add_ln155, %sha_info_count_lo_load, !bitwidth !9
  %sha_info_count_hi_load = load i32, i32* @sha_info_count_hi, align 512, !bitwidth !11, !dep_idx !209, !deps !210
  %add_ln156 = add i32 %sha_info_count_hi_load, 1, !bitwidth !11
  %select_ln155 = select i1 %icmp_ln155, i32 %add_ln156, i32 %sha_info_count_hi_load, !bitwidth !11
  store i32 %add_ln155, i32* @sha_info_count_lo, align 512, !bitwidth !212, !dep_idx !213, !deps !214
  %lshr_ln = call i3 @_ssdm_op_PartSelect.i3.i32.i32.i32(i32 %count_read, i32 29, i32 31), !bitwidth !217
  %zext_ln159 = zext i3 %lshr_ln to i32, !bitwidth !218
  %add_ln159 = add i32 %select_ln155, %zext_ln159, !bitwidth !11
  %tmp = call i26 @_ssdm_op_PartSelect.i26.i32.i32.i32(i32 %count_read, i32 6, i32 31), !bitwidth !219
  %icmp_ln162 = icmp sgt i26 %tmp, 0, !bitwidth !9
  store i32 %add_ln159, i32* @sha_info_count_hi, align 512, !bitwidth !212, !dep_idx !220, !deps !221
  store i32 %count_read, i32* %count_addr_02, !bitwidth !212, !dep_idx !223, !deps !224
  store i32 0, i32* %idx, !bitwidth !212, !dep_idx !228, !deps !229
  br label %while.body, !bitwidth !212

while.body:                                       ; preds = %while.body.split, %entry
  %count_load = load i32, i32* %count_addr_02, !bitwidth !11, !dep_idx !232, !deps !233
  %tmp_2 = call i26 @_ssdm_op_PartSelect.i26.i32.i32.i32(i32 %count_load, i32 6, i32 31), !bitwidth !219
  %icmp_ln162_1 = icmp sgt i26 %tmp_2, 0, !bitwidth !9
  br i1 %icmp_ln162_1, label %while.body.split, label %while.end.loopexit, !llvm.loop !237, !bitwidth !212

while.body.split:                                 ; preds = %while.body
  %idx_load = load i32, i32* %idx, !bitwidth !11, !dep_idx !254, !deps !255
  %trunc_ln162 = trunc i32 %idx_load to i14, !bitwidth !198
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 127, i64 128, i64 127), !fpga.pragma.source !258
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @empty_11)
  call fastcc void @local_memcpy([16384 x i8]* %buffer, i1 %buffer_offset_read, i32 64, i14 %trunc_ln162), !bitwidth !212, !dep_idx !259, !deps !260
  call fastcc void @sha_transform(), !bitwidth !212, !dep_idx !264, !deps !265
  %add_ln167 = add nuw nsw i32 %count_load, -64, !bitwidth !11
  %add_ln162 = add nuw i32 %idx_load, 64, !bitwidth !11
  store i32 %add_ln167, i32* %count_addr_02, !bitwidth !212, !dep_idx !268, !deps !269
  store i32 %add_ln162, i32* %idx, !bitwidth !212, !dep_idx !272, !deps !273
  br label %while.body, !llvm.loop !237, !bitwidth !212

while.end.loopexit:                               ; preds = %while.body
  %trunc_ln162_1 = trunc i32 %count_read to i6, !bitwidth !276
  %tmp_1 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %count_read, i32 6, i32 13), !bitwidth !277
  %and_ln = call i14 @_ssdm_op_BitConcatenate.i14.i8.i6(i8 %tmp_1, i6 0), !bitwidth !198
  %zext_ln169 = zext i6 %trunc_ln162_1 to i32, !bitwidth !218
  %select_ln169 = select i1 %icmp_ln162, i32 %zext_ln169, i32 %count_read, !bitwidth !11
  %select_ln169_1 = select i1 %icmp_ln162, i14 %and_ln, i14 0, !bitwidth !198
  call fastcc void @local_memcpy([16384 x i8]* %buffer, i1 %buffer_offset_read, i32 %select_ln169, i14 %select_ln169_1), !bitwidth !212, !dep_idx !278, !deps !279
  ret void, !bitwidth !212
}

; Function Attrs: noinline nounwind
define internal fastcc void @sha_transform() unnamed_addr #1 {
entry:
  %i = alloca i5, !bitwidth !282
  %W = alloca [80 x i32], i64 1, align 512, !bitwidth !57
  store i5 0, i5* %i, !bitwidth !212, !dep_idx !283, !deps !284
  br label %for.inc, !bitwidth !212

for.inc:                                          ; preds = %for.inc.split, %entry
  %i_6 = load i5, i5* %i, !bitwidth !287, !dep_idx !288, !deps !289
  %icmp_ln98 = icmp eq i5 %i_6, -16, !bitwidth !9
  %add_ln98 = add nuw i5 %i_6, 1, !bitwidth !287
  br i1 %icmp_ln98, label %for.inc21.preheader, label %for.inc.split, !llvm.loop !292, !bitwidth !212

for.inc21.preheader:                              ; preds = %for.inc
  %i_1 = alloca i7, !bitwidth !303
  store i7 16, i7* %i_1, !bitwidth !212, !dep_idx !304, !deps !305
  br label %for.inc21, !bitwidth !212

for.inc.split:                                    ; preds = %for.inc
  %zext_ln98 = zext i5 %i_6 to i64, !bitwidth !308
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 16, i64 16, i64 16), !fpga.pragma.source !258
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_4)
  %sha_info_data_addr = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext_ln98, !bitwidth !57
  %sha_info_data_load = load i32, i32* %sha_info_data_addr, align 4, !bitwidth !11
  %W_addr = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln98, !bitwidth !57
  store i32 %sha_info_data_load, i32* %W_addr, align 4, !bitwidth !212, !dep_idx !309, !deps !310
  store i5 %add_ln98, i5* %i, !bitwidth !212, !dep_idx !320, !deps !321
  br label %for.inc, !llvm.loop !292, !bitwidth !212

for.inc21:                                        ; preds = %for.inc21.split, %for.inc21.preheader
  %i_7 = load i7, i7* %i_1, !bitwidth !191, !dep_idx !324, !deps !325
  %icmp_ln104 = icmp eq i7 %i_7, -48, !bitwidth !9
  br i1 %icmp_ln104, label %for.end23, label %for.inc21.split, !llvm.loop !328, !bitwidth !212

for.inc21.split:                                  ; preds = %for.inc21
  %zext_ln104 = zext i7 %i_7 to i64, !bitwidth !308
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !258
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_0)
  %add_ln106 = add nuw i7 %i_7, -3, !bitwidth !191
  %zext_ln106 = zext i7 %add_ln106 to i64, !bitwidth !308
  %W_addr_1 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln106, !bitwidth !57
  %W_load = load i32, i32* %W_addr_1, align 4, !bitwidth !11, !dep_idx !335, !deps !336
  %add_ln106_1 = add nuw i7 %i_7, -8, !bitwidth !191
  %zext_ln106_1 = zext i7 %add_ln106_1 to i64, !bitwidth !308
  %W_addr_2 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln106_1, !bitwidth !57
  %W_load_1 = load i32, i32* %W_addr_2, align 4, !bitwidth !11, !dep_idx !340, !deps !341
  %add_ln106_2 = add nuw i7 %i_7, -14, !bitwidth !191
  %zext_ln106_2 = zext i7 %add_ln106_2 to i64, !bitwidth !308
  %W_addr_3 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln106_2, !bitwidth !57
  %W_load_2 = load i32, i32* %W_addr_3, align 4, !bitwidth !11, !dep_idx !344, !deps !345
  %add_ln106_3 = add nuw nsw i7 %i_7, -16, !bitwidth !191
  %zext_ln106_3 = zext i7 %add_ln106_3 to i64, !bitwidth !308
  %W_addr_4 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln106_3, !bitwidth !57
  %W_load_3 = load i32, i32* %W_addr_4, align 4, !bitwidth !11, !dep_idx !348, !deps !349
  %xor_ln106 = xor i32 %W_load_1, %W_load, !bitwidth !11
  %xor_ln106_1 = xor i32 %W_load_2, %W_load_3, !bitwidth !11
  %xor_ln106_2 = xor i32 %xor_ln106_1, %xor_ln106, !bitwidth !11
  %W_addr_5 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln104, !bitwidth !57
  store i32 %xor_ln106_2, i32* %W_addr_5, align 4, !bitwidth !212, !dep_idx !352, !deps !353
  %add_ln104 = add nuw i7 %i_7, 1, !bitwidth !191
  store i7 %add_ln104, i7* %i_1, !bitwidth !212, !dep_idx !363, !deps !364
  br label %for.inc21, !llvm.loop !328, !bitwidth !212

for.end23:                                        ; preds = %for.inc21
  %i_2 = alloca i5, !bitwidth !282
  %C_1 = alloca i32, !bitwidth !57
  %D_1 = alloca i32, !bitwidth !57
  %E_1 = alloca i32, !bitwidth !57
  %A = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512, !bitwidth !11, !dep_idx !367, !deps !368
  %B = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4, !bitwidth !11, !dep_idx !370, !deps !371
  %C = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8, !bitwidth !11, !dep_idx !373, !deps !374
  %D = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4, !bitwidth !11, !dep_idx !376, !deps !377
  %E = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16, !bitwidth !11, !dep_idx !379, !deps !380
  store i32 %E, i32* %E_1, !bitwidth !212, !dep_idx !382, !deps !383
  store i32 %D, i32* %D_1, !bitwidth !212, !dep_idx !386, !deps !387
  store i32 %C, i32* %C_1, !bitwidth !212, !dep_idx !390, !deps !391
  store i5 0, i5* %i_2, !bitwidth !212, !dep_idx !394, !deps !395
  br label %for.inc38, !bitwidth !212

for.inc38:                                        ; preds = %for.inc38.split, %for.end23
  %B_10 = phi i32 [ %A_9, %for.inc38.split ], [ %A, %for.end23 ], !bitwidth !11
  %B_2 = phi i32 [ %B_10, %for.inc38.split ], [ %B, %for.end23 ], !bitwidth !11
  %i_8 = load i5, i5* %i_2, !bitwidth !287, !dep_idx !398, !deps !399
  %D_13 = load i32, i32* %C_1, !bitwidth !11, !dep_idx !402, !deps !403
  %E_13 = load i32, i32* %D_1, !bitwidth !11, !dep_idx !406, !deps !407
  %E_4 = load i32, i32* %E_1, !bitwidth !11, !dep_idx !410, !deps !411
  %icmp_ln117 = icmp eq i5 %i_8, -12, !bitwidth !9
  %add_ln117 = add nuw i5 %i_8, 1, !bitwidth !287
  br i1 %icmp_ln117, label %for.inc60.preheader, label %for.inc38.split, !llvm.loop !414, !bitwidth !212

for.inc60.preheader:                              ; preds = %for.inc38
  %i_3 = alloca i6, !bitwidth !421
  %C_3 = alloca i32, !bitwidth !57
  %D_2 = alloca i32, !bitwidth !57
  %E_2 = alloca i32, !bitwidth !57
  store i32 %E_4, i32* %E_2, !bitwidth !212, !dep_idx !422, !deps !423
  store i32 %E_13, i32* %D_2, !bitwidth !212, !dep_idx !426, !deps !427
  store i32 %D_13, i32* %C_3, !bitwidth !212, !dep_idx !430, !deps !431
  store i6 20, i6* %i_3, !bitwidth !212, !dep_idx !434, !deps !435
  br label %for.inc60, !bitwidth !212

for.inc38.split:                                  ; preds = %for.inc38
  %zext_ln94 = zext i5 %i_8 to i64, !bitwidth !308
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !258
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_1)
  %trunc_ln119 = trunc i32 %B_10 to i27, !bitwidth !438
  %lshr_ln = call i5 @_ssdm_op_PartSelect.i5.i32.i32.i32(i32 %B_10, i32 27, i32 31), !bitwidth !287
  %W_addr_6 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln94, !bitwidth !57
  %W_load_4 = load i32, i32* %W_addr_6, align 4, !bitwidth !11, !dep_idx !439, !deps !440
  %xor_ln119 = xor i32 %B_2, -1, !bitwidth !11
  %and_ln119 = and i32 %D_13, %B_2, !bitwidth !11
  %and_ln119_1 = and i32 %E_13, %xor_ln119, !bitwidth !11
  %or_ln119 = or i32 %and_ln119_1, %and_ln119, !bitwidth !11
  %or_ln119_1 = call i32 @_ssdm_op_BitConcatenate.i32.i27.i5(i27 %trunc_ln119, i5 %lshr_ln), !bitwidth !11
  %add_ln119 = add i32 %W_load_4, %or_ln119_1, !bitwidth !11
  %add_ln119_1 = add i32 %or_ln119, 1518500249, !bitwidth !11
  %add_ln119_2 = add i32 %add_ln119_1, %E_4, !bitwidth !11
  %A_9 = add i32 %add_ln119_2, %add_ln119, !bitwidth !11
  %trunc_ln119_1 = trunc i32 %B_2 to i2, !bitwidth !442
  %lshr_ln119_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %B_2, i32 2, i32 31), !bitwidth !443
  %C_2 = call i32 @_ssdm_op_BitConcatenate.i32.i2.i30(i2 %trunc_ln119_1, i30 %lshr_ln119_1), !bitwidth !11
  store i32 %E_13, i32* %E_1, !bitwidth !212, !dep_idx !444, !deps !445
  store i32 %D_13, i32* %D_1, !bitwidth !212, !dep_idx !448, !deps !449
  store i32 %C_2, i32* %C_1, !bitwidth !212, !dep_idx !452, !deps !453
  store i5 %add_ln117, i5* %i_2, !bitwidth !212, !dep_idx !456, !deps !457
  br label %for.inc38, !llvm.loop !414, !bitwidth !212

for.inc60:                                        ; preds = %for.inc60.split, %for.inc60.preheader
  %B_11 = phi i32 [ %A_10, %for.inc60.split ], [ %B_10, %for.inc60.preheader ], !bitwidth !11
  %B_4 = phi i32 [ %B_11, %for.inc60.split ], [ %B_2, %for.inc60.preheader ], !bitwidth !11
  %i_9 = load i6, i6* %i_3, !bitwidth !276, !dep_idx !460, !deps !461
  %D_14 = load i32, i32* %C_3, !bitwidth !11, !dep_idx !464, !deps !465
  %E_14 = load i32, i32* %D_2, !bitwidth !11, !dep_idx !468, !deps !469
  %E_8 = load i32, i32* %E_2, !bitwidth !11, !dep_idx !472, !deps !473
  %icmp_ln121 = icmp eq i6 %i_9, -24, !bitwidth !9
  br i1 %icmp_ln121, label %for.inc85.preheader, label %for.inc60.split, !llvm.loop !476, !bitwidth !212

for.inc85.preheader:                              ; preds = %for.inc60
  %i_4 = alloca i6, !bitwidth !421
  %C_7 = alloca i32, !bitwidth !57
  %D_5 = alloca i32, !bitwidth !57
  %E_5 = alloca i32, !bitwidth !57
  store i32 %E_8, i32* %E_5, !bitwidth !212, !dep_idx !483, !deps !484
  store i32 %E_14, i32* %D_5, !bitwidth !212, !dep_idx !487, !deps !488
  store i32 %D_14, i32* %C_7, !bitwidth !212, !dep_idx !491, !deps !492
  store i6 -24, i6* %i_4, !bitwidth !212, !dep_idx !495, !deps !496
  br label %for.inc85, !bitwidth !212

for.inc60.split:                                  ; preds = %for.inc60
  %zext_ln94_1 = zext i6 %i_9 to i64, !bitwidth !308
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !258
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_2)
  %trunc_ln123 = trunc i32 %B_11 to i27, !bitwidth !438
  %lshr_ln1 = call i5 @_ssdm_op_PartSelect.i5.i32.i32.i32(i32 %B_11, i32 27, i32 31), !bitwidth !287
  %W_addr_7 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln94_1, !bitwidth !57
  %W_load_5 = load i32, i32* %W_addr_7, align 4, !bitwidth !11, !dep_idx !499, !deps !440
  %xor_ln123 = xor i32 %B_4, %E_14, !bitwidth !11
  %xor_ln123_1 = xor i32 %xor_ln123, %D_14, !bitwidth !11
  %or_ln = call i32 @_ssdm_op_BitConcatenate.i32.i27.i5(i27 %trunc_ln123, i5 %lshr_ln1), !bitwidth !11
  %add_ln123 = add i32 %W_load_5, %or_ln, !bitwidth !11
  %add_ln123_1 = add i32 %xor_ln123_1, 1859775393, !bitwidth !11
  %add_ln123_2 = add i32 %add_ln123_1, %E_8, !bitwidth !11
  %A_10 = add i32 %add_ln123_2, %add_ln123, !bitwidth !11
  %trunc_ln123_1 = trunc i32 %B_4 to i2, !bitwidth !442
  %lshr_ln123_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %B_4, i32 2, i32 31), !bitwidth !443
  %C_4 = call i32 @_ssdm_op_BitConcatenate.i32.i2.i30(i2 %trunc_ln123_1, i30 %lshr_ln123_1), !bitwidth !11
  %add_ln121 = add nuw i6 %i_9, 1, !bitwidth !276
  store i32 %E_14, i32* %E_2, !bitwidth !212, !dep_idx !500, !deps !501
  store i32 %D_14, i32* %D_2, !bitwidth !212, !dep_idx !504, !deps !505
  store i32 %C_4, i32* %C_3, !bitwidth !212, !dep_idx !508, !deps !509
  store i6 %add_ln121, i6* %i_3, !bitwidth !212, !dep_idx !512, !deps !513
  br label %for.inc60, !llvm.loop !476, !bitwidth !212

for.inc85:                                        ; preds = %for.inc85.split, %for.inc85.preheader
  %B_12 = phi i32 [ %A_11, %for.inc85.split ], [ %B_11, %for.inc85.preheader ], !bitwidth !11
  %B_6 = phi i32 [ %B_12, %for.inc85.split ], [ %B_4, %for.inc85.preheader ], !bitwidth !11
  %i_10 = load i6, i6* %i_4, !bitwidth !276, !dep_idx !516, !deps !517
  %D_15 = load i32, i32* %C_7, !bitwidth !11, !dep_idx !520, !deps !521
  %E_15 = load i32, i32* %D_5, !bitwidth !11, !dep_idx !524, !deps !525
  %E_11 = load i32, i32* %E_5, !bitwidth !11, !dep_idx !528, !deps !529
  %icmp_ln125 = icmp eq i6 %i_10, -4, !bitwidth !9
  br i1 %icmp_ln125, label %for.inc107.preheader, label %for.inc85.split, !llvm.loop !532, !bitwidth !212

for.inc107.preheader:                             ; preds = %for.inc85
  %E_7 = alloca i32, !bitwidth !57
  %B_5 = alloca i32, !bitwidth !57
  %i_5 = alloca i7, !bitwidth !303
  %E_9 = alloca i32, !bitwidth !57
  %D_8 = alloca i32, !bitwidth !57
  %B_7 = alloca i32, !bitwidth !57
  store i32 %B_12, i32* %B_7, !bitwidth !212, !dep_idx !539, !deps !540
  store i32 %D_15, i32* %D_8, !bitwidth !212, !dep_idx !543, !deps !544
  store i32 %E_15, i32* %E_9, !bitwidth !212, !dep_idx !547, !deps !548
  store i7 60, i7* %i_5, !bitwidth !212, !dep_idx !551, !deps !552
  store i32 %B_6, i32* %B_5, !bitwidth !212, !dep_idx !555, !deps !556
  store i32 %E_11, i32* %E_7, !bitwidth !212, !dep_idx !560, !deps !561
  br label %for.inc107, !bitwidth !212

for.inc85.split:                                  ; preds = %for.inc85
  %zext_ln94_2 = zext i6 %i_10 to i64, !bitwidth !308
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !258
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty)
  %trunc_ln127 = trunc i32 %B_12 to i27, !bitwidth !438
  %lshr_ln2 = call i5 @_ssdm_op_PartSelect.i5.i32.i32.i32(i32 %B_12, i32 27, i32 31), !bitwidth !287
  %W_addr_8 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln94_2, !bitwidth !57
  %W_load_6 = load i32, i32* %W_addr_8, align 4, !bitwidth !11, !dep_idx !565, !deps !440
  %or_ln127 = or i32 %E_15, %D_15, !bitwidth !11
  %and_ln127 = and i32 %or_ln127, %B_6, !bitwidth !11
  %and_ln127_1 = and i32 %E_15, %D_15, !bitwidth !11
  %or_ln127_1 = or i32 %and_ln127, %and_ln127_1, !bitwidth !11
  %or_ln127_2 = call i32 @_ssdm_op_BitConcatenate.i32.i27.i5(i27 %trunc_ln127, i5 %lshr_ln2), !bitwidth !11
  %add_ln127 = add i32 %W_load_6, %or_ln127_2, !bitwidth !11
  %add_ln127_1 = add i32 %E_11, %or_ln127_1, !bitwidth !11
  %add_ln127_2 = add i32 %add_ln127_1, -1894007588, !bitwidth !11
  %A_11 = add i32 %add_ln127_2, %add_ln127, !bitwidth !11
  %trunc_ln127_1 = trunc i32 %B_6 to i2, !bitwidth !442
  %lshr_ln127_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %B_6, i32 2, i32 31), !bitwidth !443
  %C_6 = call i32 @_ssdm_op_BitConcatenate.i32.i2.i30(i2 %trunc_ln127_1, i30 %lshr_ln127_1), !bitwidth !11
  %add_ln125 = add nuw i6 %i_10, 1, !bitwidth !276
  store i32 %E_15, i32* %E_5, !bitwidth !212, !dep_idx !566, !deps !567
  store i32 %D_15, i32* %D_5, !bitwidth !212, !dep_idx !570, !deps !571
  store i32 %C_6, i32* %C_7, !bitwidth !212, !dep_idx !574, !deps !575
  store i6 %add_ln125, i6* %i_4, !bitwidth !212, !dep_idx !578, !deps !579
  br label %for.inc85, !llvm.loop !532, !bitwidth !212

for.inc107:                                       ; preds = %for.inc107.split, %for.inc107.preheader
  %i_11 = load i7, i7* %i_5, !bitwidth !191, !dep_idx !582, !deps !583
  %D_16 = load i32, i32* %E_9, !bitwidth !11, !dep_idx !586, !deps !587
  %C_13 = load i32, i32* %D_8, !bitwidth !11, !dep_idx !590, !deps !591
  %A_12 = load i32, i32* %B_7, !bitwidth !11, !dep_idx !594, !deps !595
  %icmp_ln129 = icmp eq i7 %i_11, -48, !bitwidth !9
  br i1 %icmp_ln129, label %for.end109, label %for.inc107.split, !llvm.loop !598, !bitwidth !212

for.inc107.split:                                 ; preds = %for.inc107
  %E_7_load_1 = load i32, i32* %E_7, !bitwidth !11, !dep_idx !605, !deps !606
  %B_5_load_1 = load i32, i32* %B_5, !bitwidth !11, !dep_idx !609, !deps !610
  %zext_ln129 = zext i7 %i_11 to i64, !bitwidth !308
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !258
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_8)
  %trunc_ln131 = trunc i32 %A_12 to i27, !bitwidth !438
  %lshr_ln3 = call i5 @_ssdm_op_PartSelect.i5.i32.i32.i32(i32 %A_12, i32 27, i32 31), !bitwidth !287
  %W_addr_9 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln129, !bitwidth !57
  %W_load_7 = load i32, i32* %W_addr_9, align 4, !bitwidth !11, !dep_idx !613, !deps !440
  %xor_ln131 = xor i32 %B_5_load_1, %D_16, !bitwidth !11
  %xor_ln131_1 = xor i32 %xor_ln131, %C_13, !bitwidth !11
  %or_ln1 = call i32 @_ssdm_op_BitConcatenate.i32.i27.i5(i27 %trunc_ln131, i5 %lshr_ln3), !bitwidth !11
  %add_ln131 = add i32 %W_load_7, %or_ln1, !bitwidth !11
  %add_ln131_1 = add i32 %xor_ln131_1, -899497514, !bitwidth !11
  %add_ln131_2 = add i32 %add_ln131_1, %E_7_load_1, !bitwidth !11
  %temp = add i32 %add_ln131_2, %add_ln131, !bitwidth !11
  %trunc_ln131_1 = trunc i32 %B_5_load_1 to i2, !bitwidth !442
  %lshr_ln131_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %B_5_load_1, i32 2, i32 31), !bitwidth !443
  %C_8 = call i32 @_ssdm_op_BitConcatenate.i32.i2.i30(i2 %trunc_ln131_1, i30 %lshr_ln131_1), !bitwidth !11
  %add_ln129 = add nuw i7 %i_11, 1, !bitwidth !191
  store i32 %temp, i32* %B_7, !bitwidth !212, !dep_idx !614, !deps !615
  store i32 %C_8, i32* %D_8, !bitwidth !212, !dep_idx !618, !deps !619
  store i32 %C_13, i32* %E_9, !bitwidth !212, !dep_idx !622, !deps !623
  store i7 %add_ln129, i7* %i_5, !bitwidth !212, !dep_idx !626, !deps !627
  store i32 %A_12, i32* %B_5, !bitwidth !212, !dep_idx !630, !deps !631
  store i32 %D_16, i32* %E_7, !bitwidth !212, !dep_idx !634, !deps !635
  br label %for.inc107, !llvm.loop !598, !bitwidth !212

for.end109:                                       ; preds = %for.inc107
  %E_7_load = load i32, i32* %E_7, !bitwidth !11, !dep_idx !638, !deps !639
  %B_5_load = load i32, i32* %B_5, !bitwidth !11, !dep_idx !641, !deps !642
  %add_ln135 = add i32 %A, %A_12, !bitwidth !11
  store i32 %add_ln135, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512, !bitwidth !212, !dep_idx !644, !deps !645
  %add_ln136 = add i32 %B, %B_5_load, !bitwidth !11
  store i32 %add_ln136, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4, !bitwidth !212, !dep_idx !647, !deps !648
  %add_ln137 = add i32 %C, %C_13, !bitwidth !11
  store i32 %add_ln137, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8, !bitwidth !212, !dep_idx !650, !deps !651
  %add_ln138 = add i32 %D, %D_16, !bitwidth !11
  store i32 %add_ln138, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4, !bitwidth !212, !dep_idx !653, !deps !654
  %add_ln139 = add i32 %E, %E_7_load, !bitwidth !11
  store i32 %add_ln139, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16, !bitwidth !212, !dep_idx !656, !deps !657
  ret void, !bitwidth !212
}

; Function Attrs: nounwind
define internal void @sha_stream_Pipeline_sha_stream_label2([5 x i32]* %outdata) #2 {
newFuncRoot:
  %i_7 = alloca i3, !bitwidth !659
  call void (...) @_ssdm_op_SpecInterface([5 x i32]* %outdata, [10 x i8]* @empty_3, i32 0, i32 0, [1 x i8]* @empty_7, i32 -1, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 -1, i32 0)
  store i3 0, i3* %i_7, !bitwidth !212, !dep_idx !660, !deps !661
  br label %for.inc31, !bitwidth !212

for.end33.exitStub:                               ; preds = %for.inc31
  ret void, !bitwidth !212

for.inc31:                                        ; preds = %for.inc31.split, %newFuncRoot
  %i = load i3, i3* %i_7, !bitwidth !217, !dep_idx !664, !deps !665
  %icmp_ln225 = icmp eq i3 %i, -3, !bitwidth !9
  %add_ln225 = add nuw i3 %i, 1, !bitwidth !217
  br i1 %icmp_ln225, label %for.end33.exitStub, label %for.inc31.split, !llvm.loop !668, !bitwidth !212

for.inc31.split:                                  ; preds = %for.inc31
  %zext_ln225 = zext i3 %i to i64, !bitwidth !308
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_7)
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 5, i64 5, i64 5), !fpga.pragma.source !258
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @empty_6)
  %sha_info_digest_addr = getelementptr inbounds [5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 %zext_ln225, !bitwidth !57
  %sha_info_digest_load = load i32, i32* %sha_info_digest_addr, align 4, !bitwidth !11
  %outdata_addr = getelementptr [5 x i32], [5 x i32]* %outdata, i64 0, i64 %zext_ln225, !bitwidth !57
  store i32 %sha_info_digest_load, i32* %outdata_addr, align 4, !bitwidth !212
  store i3 %add_ln225, i3* %i_7, !bitwidth !212, !dep_idx !688, !deps !689
  br label %for.inc31, !llvm.loop !668, !bitwidth !212
}

; Function Attrs: nounwind
define internal void @sha_stream_Pipeline_sha_stream_label1_VITIS_LOOP_207_1([16384 x i8]* %indata) #2 {
newFuncRoot:
  %j = alloca i14, !bitwidth !692
  %i = alloca i2, !bitwidth !693
  %indvar_flatten = alloca i15, !bitwidth !694
  call void (...) @_ssdm_op_SpecInterface([16384 x i8]* %indata, [10 x i8]* @empty_3, i32 0, i32 0, [1 x i8]* @empty_7, i32 -1, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 -1, i32 0)
  store i15 0, i15* %indvar_flatten, !bitwidth !212, !dep_idx !695, !deps !696
  store i2 0, i2* %i, !bitwidth !212, !dep_idx !699, !deps !700
  store i14 0, i14* %j, !bitwidth !212, !dep_idx !703, !deps !704
  br label %for.inc, !bitwidth !212

for.end12.exitStub:                               ; preds = %for.inc
  ret void, !bitwidth !212

for.inc:                                          ; preds = %for.inc10, %newFuncRoot
  %indvar_flatten_load = load i15, i15* %indvar_flatten, !bitwidth !707, !dep_idx !708, !deps !709
  %icmp_ln205 = icmp eq i15 %indvar_flatten_load, -16384, !bitwidth !9
  %add_ln205_1 = add i15 %indvar_flatten_load, 1, !bitwidth !707
  br i1 %icmp_ln205, label %for.end12.exitStub, label %for.inc10, !bitwidth !212

for.inc10:                                        ; preds = %for.inc
  %j_load = load i14, i14* %j, !bitwidth !198, !dep_idx !712, !deps !713
  %i_load = load i2, i2* %i, !bitwidth !442, !dep_idx !716, !deps !717
  %add_ln205 = add nuw i2 %i_load, 1, !bitwidth !442
  call void (...) @_ssdm_op_SpecLoopName([35 x i8]* @sha_stream_label1_VITIS_LOOP_207_1_str)
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 16384, i64 16384, i64 16384)
  %icmp_ln207 = icmp eq i14 %j_load, -8192, !bitwidth !9
  %select_ln201 = select i1 %icmp_ln207, i14 0, i14 %j_load, !bitwidth !198
  %select_ln205 = select i1 %icmp_ln207, i2 %add_ln205, i2 %i_load, !bitwidth !442
  %trunc_ln209 = trunc i2 %select_ln205 to i1, !bitwidth !9
  %tmp = call i14 @_ssdm_op_BitConcatenate.i14.i1.i13(i1 %trunc_ln209, i13 0), !bitwidth !198
  %add_ln209 = add i14 %tmp, %select_ln201, !bitwidth !198
  %zext_ln209 = zext i14 %add_ln209 to i64, !bitwidth !308
  %local_indata_addr = getelementptr [16384 x i8], [16384 x i8]* @local_indata, i64 0, i64 %zext_ln209, !bitwidth !7
  %indata_addr = getelementptr [16384 x i8], [16384 x i8]* %indata, i64 0, i64 %zext_ln209, !bitwidth !7
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_7)
  %indata_load = load i8, i8* %indata_addr, align 1, !bitwidth !277
  store i8 %indata_load, i8* %local_indata_addr, align 1, !bitwidth !212
  %add_ln207 = add nuw i14 %select_ln201, 1, !bitwidth !198
  store i15 %add_ln205_1, i15* %indvar_flatten, !bitwidth !212, !dep_idx !720, !deps !721
  store i2 %select_ln205, i2* %i, !bitwidth !212, !dep_idx !724, !deps !725
  store i14 %add_ln207, i14* %j, !bitwidth !212, !dep_idx !728, !deps !729
  br label %for.inc, !llvm.loop !732, !bitwidth !212
}

; Function Attrs: noinline nounwind
define void @sha_stream([16384 x i8]* noalias %indata, [2 x i32]* noalias %in_i, [5 x i32]* noalias %outdata) #1 {
entry:
  %j = alloca i2, !bitwidth !693
  call void (...) @_ssdm_op_SpecTopModule([11 x i8]* @empty_5), !fpga.pragma.source !258
  call void (...) @_ssdm_op_SpecInterface([16384 x i8]* %indata, [10 x i8]* @empty_3, i32 0, i32 0, [1 x i8]* @empty_7, i32 -1, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([16384 x i8]* %indata), !map !742
  call void (...) @_ssdm_op_SpecInterface([2 x i32]* %in_i, [10 x i8]* @empty_3, i32 0, i32 0, [1 x i8]* @empty_7, i32 -1, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([2 x i32]* %in_i), !map !742
  call void (...) @_ssdm_op_SpecInterface([5 x i32]* %outdata, [10 x i8]* @empty_3, i32 0, i32 0, [1 x i8]* @empty_7, i32 -1, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([5 x i32]* %outdata), !map !742
  call void @sha_stream_Pipeline_sha_stream_label1_VITIS_LOOP_207_1([16384 x i8]* %indata), !bitwidth !212, !dep_idx !743, !deps !744
  store i32 1732584193, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512, !bitwidth !212, !dep_idx !746, !deps !747
  store i32 -271733879, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4, !bitwidth !212, !dep_idx !753, !deps !747
  store i32 -1732584194, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8, !bitwidth !212, !dep_idx !754, !deps !747
  store i32 271733878, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4, !bitwidth !212, !dep_idx !755, !deps !747
  store i32 -1009589776, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16, !bitwidth !212, !dep_idx !756, !deps !747
  store i32 0, i32* @sha_info_count_lo, align 512, !bitwidth !212, !dep_idx !757, !deps !758
  store i32 0, i32* @sha_info_count_hi, align 512, !bitwidth !212, !dep_idx !760, !deps !761
  store i2 0, i2* %j, !bitwidth !212, !dep_idx !763, !deps !764
  br label %for.inc21, !bitwidth !212

for.inc21:                                        ; preds = %for.inc21.split, %entry
  %j_1 = load i2, i2* %j, !bitwidth !442, !dep_idx !767, !deps !768
  %icmp_ln216 = icmp eq i2 %j_1, -2, !bitwidth !9
  %add_ln216 = add nuw i2 %j_1, 1, !bitwidth !442
  br i1 %icmp_ln216, label %for.end23, label %for.inc21.split, !llvm.loop !771, !bitwidth !212

for.inc21.split:                                  ; preds = %for.inc21
  %zext_ln216 = zext i2 %j_1 to i64, !bitwidth !308
  %trunc_ln216 = trunc i2 %j_1 to i1, !bitwidth !9
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 2, i64 2, i64 2), !fpga.pragma.source !258
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @empty_9)
  %in_i_addr = getelementptr [2 x i32], [2 x i32]* %in_i, i64 0, i64 %zext_ln216, !bitwidth !57
  %i = load i32, i32* %in_i_addr, align 4, !bitwidth !11
  call fastcc void @sha_update([16384 x i8]* @local_indata, i1 %trunc_ln216, i32 %i) #2, !bitwidth !212, !dep_idx !250, !deps !778
  store i2 %add_ln216, i2* %j, !bitwidth !212, !dep_idx !796, !deps !797
  br label %for.inc21, !llvm.loop !771, !bitwidth !212

for.end23:                                        ; preds = %for.inc21
  %lo_bit_count = load i32, i32* @sha_info_count_lo, align 512, !bitwidth !11, !dep_idx !800, !deps !801
  %hi_bit_count = load i32, i32* @sha_info_count_hi, align 512, !bitwidth !11, !dep_idx !803, !deps !804
  %count = call i6 @_ssdm_op_PartSelect.i6.i32.i32.i32(i32 %lo_bit_count, i32 3, i32 8), !bitwidth !276
  %zext_ln174 = zext i6 %count to i7, !bitwidth !806
  %count_1 = add nuw i7 %zext_ln174, 1, !bitwidth !806
  %trunc_ln174 = trunc i7 %count_1 to i4, !bitwidth !179
  %zext_ln179 = zext i6 %count to i64, !bitwidth !308
  %sha_info_data_addr = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext_ln179, !bitwidth !57
  store i32 128, i32* %sha_info_data_addr, align 4, !bitwidth !212, !dep_idx !807, !deps !808
  %icmp_ln181 = icmp ugt i7 %count_1, 56, !bitwidth !9
  br i1 %icmp_ln181, label %if.then.i, label %if.else.i, !bitwidth !212

if.then.i:                                        ; preds = %for.end23
  %xor_ln182 = xor i6 %count, -1, !bitwidth !276
  %zext_ln182 = zext i6 %xor_ln182 to i7, !bitwidth !806
  call fastcc void @local_memset(i7 %zext_ln182, i4 %trunc_ln174), !bitwidth !212, !dep_idx !816, !deps !817
  call fastcc void @sha_transform(), !bitwidth !212, !dep_idx !819, !deps !820
  call fastcc void @local_memset(i7 56, i4 0), !bitwidth !212, !dep_idx !827, !deps !828
  br label %sha_final.exit, !bitwidth !212

if.else.i:                                        ; preds = %for.end23
  %sub_ln186 = sub nsw i7 55, %zext_ln174, !bitwidth !61
  call fastcc void @local_memset(i7 %sub_ln186, i4 %trunc_ln174), !bitwidth !212, !dep_idx !829, !deps !830
  br label %sha_final.exit, !bitwidth !212

sha_final.exit:                                   ; preds = %if.else.i, %if.then.i
  store i32 %hi_bit_count, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 14), align 8, !bitwidth !212, !dep_idx !831, !deps !832
  store i32 %lo_bit_count, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 15), align 4, !bitwidth !212, !dep_idx !833, !deps !832
  call fastcc void @sha_transform(), !bitwidth !212, !dep_idx !834, !deps !835
  call void @sha_stream_Pipeline_sha_stream_label2([5 x i32]* %outdata), !bitwidth !212, !dep_idx !836, !deps !837
  ret void, !bitwidth !212
}

; Function Attrs: nounwind
define internal void @local_memset_Pipeline_local_memset_label1(i31 %m, i4 %empty) #2 {
newFuncRoot:
  %idx = alloca i30, !bitwidth !843
  %tmp = call i4 @_ssdm_op_Read.ap_auto.i4(i4 %empty) #2, !bitwidth !179
  %m_read = call i31 @_ssdm_op_Read.ap_auto.i31(i31 %m) #2, !bitwidth !177
  store i30 0, i30* %idx, !bitwidth !212, !dep_idx !844, !deps !845
  br label %while.body4, !bitwidth !212

while.end6.loopexit.exitStub:                     ; preds = %while.body4
  ret void, !bitwidth !212

while.body4:                                      ; preds = %while.body4.split, %newFuncRoot
  %idx_load = load i30, i30* %idx, !bitwidth !443, !dep_idx !848, !deps !849
  %zext_ln65 = zext i30 %idx_load to i31, !bitwidth !852
  %icmp_ln65 = icmp slt i31 %zext_ln65, %m_read, !bitwidth !9
  %add_ln65 = add nuw i30 %idx_load, 1, !bitwidth !443
  br i1 %icmp_ln65, label %while.body4.split, label %while.end6.loopexit.exitStub, !llvm.loop !853, !bitwidth !212

while.body4.split:                                ; preds = %while.body4
  %trunc_ln65 = trunc i30 %idx_load to i4, !bitwidth !179
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_7)
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 0, i64 14, i64 7), !fpga.pragma.source !258
  call void (...) @_ssdm_op_SpecLoopName([20 x i8]* @empty_12)
  %add_ln57 = add i4 %trunc_ln65, %tmp, !bitwidth !179
  %zext_ln57 = zext i4 %add_ln57 to i64, !bitwidth !308
  %p = getelementptr [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext_ln57, !bitwidth !57
  store i32 0, i32* %p, align 4, !bitwidth !212
  store i30 %add_ln65, i30* %idx, !bitwidth !212, !dep_idx !867, !deps !868
  br label %while.body4, !llvm.loop !853, !bitwidth !212
}

; Function Attrs: noinline nounwind
define internal fastcc void @local_memset(i7 %n, i4 %e) #1 {
entry_ifconv:
  %e_read = call i4 @_ssdm_op_Read.ap_auto.i4(i4 %e) #2, !bitwidth !179
  %n_read = call i7 @_ssdm_op_Read.ap_auto.i7(i7 %n) #2, !bitwidth !191
  %tmp = call i1 @_ssdm_op_BitSelect.i1.i7.i32(i7 %n_read, i32 6), !bitwidth !9
  %sub_ln58 = sub i7 0, %n_read, !bitwidth !191
  %trunc_ln58_1 = call i5 @_ssdm_op_PartSelect.i5.i7.i32.i32(i7 %sub_ln58, i32 2, i32 6), !bitwidth !287
  %sext_ln58 = sext i5 %trunc_ln58_1 to i30, !bitwidth !871
  %zext_ln58 = zext i30 %sext_ln58 to i31, !bitwidth !852
  %sub_ln58_1 = sub i31 0, %zext_ln58, !bitwidth !872
  %trunc_ln58_2 = call i5 @_ssdm_op_PartSelect.i5.i7.i32.i32(i7 %n_read, i32 2, i32 6), !bitwidth !287
  %sext_ln58_1 = sext i5 %trunc_ln58_2 to i30, !bitwidth !871
  %zext_ln58_1 = zext i30 %sext_ln58_1 to i31, !bitwidth !852
  %m = select i1 %tmp, i31 %sub_ln58_1, i31 %zext_ln58_1, !bitwidth !177
  call void @local_memset_Pipeline_local_memset_label1(i31 %m, i4 %e_read), !bitwidth !212
  ret void, !bitwidth !212
}

; Function Attrs: noinline
define internal fastcc void @local_memcpy([16384 x i8]* noalias nocapture align 512 %s2, i1 %s2_offset, i32 %n, i14 %idx1) #0 {
entry:
  %idx9 = alloca i5, !bitwidth !282
  %idx = alloca i32, !bitwidth !15
  %idx1_read = call i14 @_ssdm_op_Read.ap_auto.i14(i14 %idx1), !bitwidth !198
  %n_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %n), !bitwidth !11
  %s2_offset_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %s2_offset), !bitwidth !9
  %tmp_9 = call i14 @_ssdm_op_BitConcatenate.i14.i1.i13(i1 %s2_offset_read, i13 0), !bitwidth !198
  %tmp_3 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %n_read, i32 31), !bitwidth !9
  %sub_ln76 = sub i32 0, %n_read, !bitwidth !11
  %tmp_s = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %sub_ln76, i32 2, i32 31), !bitwidth !443
  %zext_ln76 = zext i30 %tmp_s to i31, !bitwidth !852
  %sub_ln76_1 = sub i31 0, %zext_ln76, !bitwidth !872
  %tmp_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %n_read, i32 2, i32 31), !bitwidth !443
  %zext_ln76_1 = zext i30 %tmp_1 to i31, !bitwidth !852
  %m = select i1 %tmp_3, i31 %sub_ln76_1, i31 %zext_ln76_1, !bitwidth !177
  store i32 0, i32* %idx, !bitwidth !212, !dep_idx !873, !deps !874
  store i5 0, i5* %idx9, !bitwidth !212, !dep_idx !877, !deps !878
  br label %while.body, !bitwidth !212

while.body:                                       ; preds = %while.body.split, %entry
  %idx9_load = load i5, i5* %idx9, !bitwidth !287, !dep_idx !881, !deps !882
  %zext_ln79_1 = zext i5 %idx9_load to i31, !bitwidth !852
  %icmp_ln79 = icmp slt i31 %zext_ln79_1, %m, !bitwidth !9
  %add_ln79_1 = add nuw i5 %idx9_load, 1, !bitwidth !287
  br i1 %icmp_ln79, label %while.body.split, label %while.end.loopexit, !llvm.loop !885, !bitwidth !212

while.body.split:                                 ; preds = %while.body
  %idx_load = load i32, i32* %idx, !bitwidth !11, !dep_idx !897, !deps !898
  %zext_ln79 = zext i5 %idx9_load to i64, !bitwidth !308
  %trunc_ln79 = trunc i32 %idx_load to i14, !bitwidth !198
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 0, i64 16, i64 8), !fpga.pragma.source !258
  call void (...) @_ssdm_op_SpecLoopName([20 x i8]* @empty_10)
  %p1 = getelementptr [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext_ln79, !bitwidth !57
  %add_ln73 = add i14 %trunc_ln79, %idx1_read, !bitwidth !198
  %add_ln73_1 = add i14 %tmp_9, %add_ln73, !bitwidth !198
  %zext_ln73 = zext i14 %add_ln73_1 to i64, !bitwidth !308
  %p2 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %zext_ln73, !bitwidth !7
  %add_ln82 = add i14 %add_ln73, 1, !bitwidth !198
  %add_ln82_1 = add i14 %tmp_9, %add_ln82, !bitwidth !198
  %zext_ln82 = zext i14 %add_ln82_1 to i64, !bitwidth !308
  %p2_1 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %zext_ln82, !bitwidth !7
  %p2_load = load i8, i8* %p2, align 1, !bitwidth !277
  %add_ln83 = add i14 %add_ln73, 2, !bitwidth !198
  %add_ln83_1 = add i14 %tmp_9, %add_ln83, !bitwidth !198
  %zext_ln83 = zext i14 %add_ln83_1 to i64, !bitwidth !308
  %p2_2 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %zext_ln83, !bitwidth !7
  %p2_1_load = load i8, i8* %p2_1, align 1, !bitwidth !277
  %add_ln84 = add i14 %add_ln73, 3, !bitwidth !198
  %add_ln84_1 = add i14 %tmp_9, %add_ln84, !bitwidth !198
  %zext_ln84 = zext i14 %add_ln84_1 to i64, !bitwidth !308
  %p2_3 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %zext_ln84, !bitwidth !7
  %p2_2_load = load i8, i8* %p2_2, align 1, !bitwidth !277
  %p2_3_load = load i8, i8* %p2_3, align 1, !bitwidth !277
  %tmp = call i32 @_ssdm_op_BitConcatenate.i32.i8.i8.i8.i8(i8 %p2_3_load, i8 %p2_2_load, i8 %p2_1_load, i8 %p2_load), !bitwidth !11
  store i32 %tmp, i32* %p1, align 4, !bitwidth !212
  %add_ln79 = add nuw i32 %idx_load, 4, !bitwidth !11
  store i32 %add_ln79, i32* %idx, !bitwidth !212, !dep_idx !901, !deps !902
  store i5 %add_ln79_1, i5* %idx9, !bitwidth !212, !dep_idx !905, !deps !906
  br label %while.body, !llvm.loop !885, !bitwidth !212

while.end.loopexit:                               ; preds = %while.body
  ret void, !bitwidth !212
}

; Function Attrs: nounwind readnone
declare i7 @llvm.part.select.i7(i7, i32, i32) #3

; Function Attrs: nounwind readnone
declare i32 @llvm.part.select.i32(i32, i32, i32) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, i64, metadata) #4

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata) #4

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecTopModule(...) #2 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecPipeline(...) #2 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecLoopTripCount(...) #2 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecLoopName(...) #2 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecInterface(...) #2 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecBitsMap(...) #2 comdat {
entry:
  ret void
}

define weak i7 @_ssdm_op_Read.ap_auto.i7(i7 %0) comdat {
entry:
  ret i7 %0
}

define weak i4 @_ssdm_op_Read.ap_auto.i4(i4 %0) comdat {
entry:
  ret i4 %0
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32 %0) comdat {
entry:
  ret i32 %0
}

define weak i31 @_ssdm_op_Read.ap_auto.i31(i31 %0) comdat {
entry:
  ret i31 %0
}

define weak i14 @_ssdm_op_Read.ap_auto.i14(i14 %0) comdat {
entry:
  ret i14 %0
}

define weak i1 @_ssdm_op_Read.ap_auto.i1(i1 %0) comdat {
entry:
  ret i1 %0
}

; Function Attrs: nounwind readnone
define weak i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %0, i32 %1, i32 %2) #3 comdat {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_20 = trunc i32 %empty to i8
  ret i8 %empty_20
}

; Function Attrs: nounwind readnone
define weak i6 @_ssdm_op_PartSelect.i6.i32.i32.i32(i32 %0, i32 %1, i32 %2) #3 comdat {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_21 = trunc i32 %empty to i6
  ret i6 %empty_21
}

; Function Attrs: nounwind readnone
define weak i5 @_ssdm_op_PartSelect.i5.i7.i32.i32(i7 %0, i32 %1, i32 %2) #3 comdat {
entry:
  %empty = call i7 @llvm.part.select.i7(i7 %0, i32 %1, i32 %2)
  %empty_22 = trunc i7 %empty to i5
  ret i5 %empty_22
}

; Function Attrs: nounwind readnone
define weak i5 @_ssdm_op_PartSelect.i5.i32.i32.i32(i32 %0, i32 %1, i32 %2) #3 comdat {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_23 = trunc i32 %empty to i5
  ret i5 %empty_23
}

; Function Attrs: nounwind readnone
define weak i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %0, i32 %1, i32 %2) #3 comdat {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_24 = trunc i32 %empty to i30
  ret i30 %empty_24
}

; Function Attrs: nounwind readnone
define weak i3 @_ssdm_op_PartSelect.i3.i32.i32.i32(i32 %0, i32 %1, i32 %2) #3 comdat {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_25 = trunc i32 %empty to i3
  ret i3 %empty_25
}

; Function Attrs: nounwind readnone
define weak i26 @_ssdm_op_PartSelect.i26.i32.i32.i32(i32 %0, i32 %1, i32 %2) #3 comdat {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_26 = trunc i32 %empty to i26
  ret i26 %empty_26
}

; Function Attrs: nounwind readnone
define weak i1 @_ssdm_op_BitSelect.i1.i7.i32(i7 %0, i32 %1) #3 comdat {
entry:
  %empty = trunc i32 %1 to i7
  %empty_27 = shl i7 1, %empty
  %empty_28 = and i7 %0, %empty_27
  %empty_29 = icmp ne i7 %empty_28, 0
  ret i1 %empty_29
}

; Function Attrs: nounwind readnone
define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %0, i32 %1) #3 comdat {
entry:
  %empty = shl i32 1, %1
  %empty_30 = and i32 %0, %empty
  %empty_31 = icmp ne i32 %empty_30, 0
  ret i1 %empty_31
}

; Function Attrs: nounwind readnone
define weak i32 @_ssdm_op_BitConcatenate.i32.i8.i8.i8.i8(i8 %0, i8 %1, i8 %2, i8 %3) #3 comdat {
entry:
  %empty = zext i8 %2 to i16
  %empty_32 = zext i8 %3 to i16
  %empty_33 = shl i16 %empty, 8
  %empty_34 = or i16 %empty_33, %empty_32
  %empty_35 = zext i8 %1 to i24
  %empty_36 = zext i16 %empty_34 to i24
  %empty_37 = shl i24 %empty_35, 16
  %empty_38 = or i24 %empty_37, %empty_36
  %empty_39 = zext i8 %0 to i32
  %empty_40 = zext i24 %empty_38 to i32
  %empty_41 = shl i32 %empty_39, 24
  %empty_42 = or i32 %empty_41, %empty_40
  ret i32 %empty_42
}

; Function Attrs: nounwind readnone
define weak i32 @_ssdm_op_BitConcatenate.i32.i27.i5(i27 %0, i5 %1) #3 comdat {
entry:
  %empty = zext i27 %0 to i32
  %empty_43 = zext i5 %1 to i32
  %empty_44 = shl i32 %empty, 5
  %empty_45 = or i32 %empty_44, %empty_43
  ret i32 %empty_45
}

; Function Attrs: nounwind readnone
define weak i32 @_ssdm_op_BitConcatenate.i32.i2.i30(i2 %0, i30 %1) #3 comdat {
entry:
  %empty = zext i2 %0 to i32
  %empty_46 = zext i30 %1 to i32
  %empty_47 = shl i32 %empty, 30
  %empty_48 = or i32 %empty_47, %empty_46
  ret i32 %empty_48
}

; Function Attrs: nounwind readnone
define weak i14 @_ssdm_op_BitConcatenate.i14.i8.i6(i8 %0, i6 %1) #3 comdat {
entry:
  %empty = zext i8 %0 to i14
  %empty_49 = zext i6 %1 to i14
  %empty_50 = shl i14 %empty, 6
  %empty_51 = or i14 %empty_50, %empty_49
  ret i14 %empty_51
}

; Function Attrs: nounwind readnone
define weak i14 @_ssdm_op_BitConcatenate.i14.i1.i13(i1 %0, i13 %1) #3 comdat {
entry:
  %empty = zext i1 %0 to i14
  %empty_52 = zext i13 %1 to i14
  %empty_53 = shl i14 %empty, 13
  %empty_54 = or i14 %empty_53, %empty_52
  ret i14 %empty_54
}

attributes #0 = { noinline }
attributes #1 = { noinline nounwind }
attributes #2 = { nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind readnone speculatable willreturn }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!blackbox_cfg = !{!1}
!llvm.module.flags = !{!2, !3}
!llvm.map.gv = !{}
!bitwidth_g = !{!4, !42, !107, !120, !139, !174, !188, !195}

!0 = !{!"clang version 7.0.0 "}
!1 = !{}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"reflow.full.lowering", i32 1}
!4 = !{void ([16384 x i8]*, i1, i32)* @sha_update, !5}
!5 = !{!6, !8, !10, !12, !14, !16, !18, !19, !21, !22, !24, !26, !27, !29, !31, !32, !34, !36, !38, !40}
!6 = !{!"Arg", i32 0, !7}
!7 = !{i32 0, i32 0, i32 8, i32 2}
!8 = !{!"Arg", i32 1, !9}
!9 = !{i32 1, i32 1, i32 0, i32 2}
!10 = !{!"Arg", i32 2, !11}
!11 = !{i32 32, i32 32, i32 0, i32 2}
!12 = !{i32 1, !13}
!13 = !{i32 1, i32 32, i32 0, i32 0}
!14 = !{i32* @sha_info_count_lo, !15}
!15 = !{i32 0, i32 0, i32 32, i32 1}
!16 = !{i32 3, !17}
!17 = !{i32 3, i32 32, i32 0, i32 1}
!18 = !{i32* @sha_info_count_hi, !15}
!19 = !{i32 29, !20}
!20 = !{i32 6, i32 32, i32 0, i32 1}
!21 = !{i32 31, !20}
!22 = !{i32 6, !23}
!23 = !{i32 4, i32 32, i32 0, i32 1}
!24 = !{i26 0, !25}
!25 = !{i32 1, i32 26, i32 0, i32 0}
!26 = !{i32 0, !13}
!27 = !{i64 127, !28}
!28 = !{i32 8, i32 64, i32 0, i32 1}
!29 = !{i64 128, !30}
!30 = !{i32 9, i32 64, i32 0, i32 1}
!31 = !{[18 x i8]* @empty_11, !7}
!32 = !{i32 64, !33}
!33 = !{i32 8, i32 32, i32 0, i32 1}
!34 = !{i32 -64, !35}
!35 = !{i32 7, i32 32, i32 0, i32 1}
!36 = !{i32 13, !37}
!37 = !{i32 5, i32 32, i32 0, i32 1}
!38 = !{i6 0, !39}
!39 = !{i32 1, i32 6, i32 0, i32 0}
!40 = !{i14 0, !41}
!41 = !{i32 1, i32 14, i32 0, i32 0}
!42 = !{void ()* @sha_transform, !43}
!43 = !{!12, !44, !46, !48, !50, !51, !53, !55, !56, !58, !60, !62, !63, !64, !66, !68, !70, !71, !73, !74, !75, !76, !78, !79, !80, !81, !83, !84, !85, !87, !88, !89, !21, !90, !92, !94, !95, !96, !97, !98, !99, !101, !102, !103, !104, !105}
!44 = !{i64 1, !45}
!45 = !{i32 2, i32 64, i32 0, i32 0}
!46 = !{i5 0, !47}
!47 = !{i32 1, i32 5, i32 0, i32 0}
!48 = !{i5 -16, !49}
!49 = !{i32 5, i32 5, i32 0, i32 1}
!50 = !{i5 1, !47}
!51 = !{i7 16, !52}
!52 = !{i32 6, i32 7, i32 0, i32 1}
!53 = !{i64 16, !54}
!54 = !{i32 6, i32 64, i32 0, i32 1}
!55 = !{[21 x i8]* @empty_4, !7}
!56 = !{[16 x i32]* @sha_info_data, !57}
!57 = !{i32 0, i32 0, i32 32, i32 2}
!58 = !{i64 0, !59}
!59 = !{i32 1, i32 64, i32 0, i32 0}
!60 = !{i7 -48, !61}
!61 = !{i32 7, i32 7, i32 0, i32 1}
!62 = !{i64 64, !28}
!63 = !{[21 x i8]* @empty_0, !7}
!64 = !{i7 -3, !65}
!65 = !{i32 3, i32 7, i32 0, i32 1}
!66 = !{i7 -8, !67}
!67 = !{i32 4, i32 7, i32 0, i32 1}
!68 = !{i7 -14, !69}
!69 = !{i32 5, i32 7, i32 0, i32 1}
!70 = !{i7 -16, !69}
!71 = !{i7 1, !72}
!72 = !{i32 1, i32 7, i32 0, i32 0}
!73 = !{[5 x i32]* @sha_info_digest, !57}
!74 = !{i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), !57}
!75 = !{i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), !57}
!76 = !{i64 2, !77}
!77 = !{i32 3, i32 64, i32 0, i32 0}
!78 = !{i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), !57}
!79 = !{i64 3, !77}
!80 = !{i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), !57}
!81 = !{i64 4, !82}
!82 = !{i32 4, i32 64, i32 0, i32 0}
!83 = !{i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), !57}
!84 = !{i5 -12, !49}
!85 = !{i6 20, !86}
!86 = !{i32 6, i32 6, i32 0, i32 1}
!87 = !{i64 20, !54}
!88 = !{[21 x i8]* @empty_1, !7}
!89 = !{i32 27, !20}
!90 = !{i32 -1, !91}
!91 = !{i32 1, i32 32, i32 0, i32 1}
!92 = !{i32 1518500249, !93}
!93 = !{i32 32, i32 32, i32 0, i32 1}
!94 = !{i32 2, !17}
!95 = !{i6 -24, !86}
!96 = !{[21 x i8]* @empty_2, !7}
!97 = !{i32 1859775393, !93}
!98 = !{i6 1, !39}
!99 = !{i6 -4, !100}
!100 = !{i32 3, i32 6, i32 0, i32 1}
!101 = !{i7 60, !61}
!102 = !{[21 x i8]* @empty, !7}
!103 = !{i32 -1894007588, !93}
!104 = !{[21 x i8]* @empty_8, !7}
!105 = !{i32 -899497514, !106}
!106 = !{i32 31, i32 32, i32 0, i32 1}
!107 = !{void ([5 x i32]*)* @sha_stream_Pipeline_sha_stream_label2, !108}
!108 = !{!109, !12, !110, !26, !111, !90, !112, !114, !116, !117, !119, !73, !58}
!109 = !{!"Arg", i32 0, !57}
!110 = !{[10 x i8]* @empty_3, !7}
!111 = !{[1 x i8]* @empty_7, !7}
!112 = !{i3 0, !113}
!113 = !{i32 1, i32 3, i32 0, i32 0}
!114 = !{i3 -3, !115}
!115 = !{i32 3, i32 3, i32 0, i32 1}
!116 = !{i3 1, !113}
!117 = !{i64 5, !118}
!118 = !{i32 4, i32 64, i32 0, i32 1}
!119 = !{[18 x i8]* @empty_6, !7}
!120 = !{void ([16384 x i8]*)* @sha_stream_Pipeline_sha_stream_label1_VITIS_LOOP_207_1, !121}
!121 = !{!6, !12, !110, !26, !111, !90, !122, !124, !40, !126, !128, !129, !130, !131, !133, !135, !137, !58, !138, !6, !6}
!122 = !{i15 0, !123}
!123 = !{i32 1, i32 15, i32 0, i32 0}
!124 = !{i2 0, !125}
!125 = !{i32 1, i32 2, i32 0, i32 0}
!126 = !{i15 -16384, !127}
!127 = !{i32 15, i32 15, i32 0, i32 1}
!128 = !{i15 1, !123}
!129 = !{i2 1, !125}
!130 = !{[35 x i8]* @sha_stream_label1_VITIS_LOOP_207_1_str, !7}
!131 = !{i64 16384, !132}
!132 = !{i32 16, i32 64, i32 0, i32 1}
!133 = !{i14 -8192, !134}
!134 = !{i32 14, i32 14, i32 0, i32 1}
!135 = !{i13 0, !136}
!136 = !{i32 1, i32 13, i32 0, i32 0}
!137 = !{[16384 x i8]* @local_indata, !7}
!138 = !{i14 1, !41}
!139 = !{void ([16384 x i8]*, [2 x i32]*, [5 x i32]*)* @sha_stream, !140}
!140 = !{!6, !141, !142, !12, !143, !110, !26, !111, !90, !144, !145, !58, !74, !146, !44, !75, !148, !149, !78, !151, !79, !80, !152, !81, !83, !153, !155, !124, !156, !129, !158, !137, !16, !159, !71, !160, !161, !163, !164, !166, !168, !169, !171, !172, !173}
!141 = !{!"Arg", i32 1, !57}
!142 = !{!"Arg", i32 2, !57}
!143 = !{[11 x i8]* @empty_5, !7}
!144 = !{i32 1732584193, !93}
!145 = !{[5 x i32]* @sha_info_digest, !15}
!146 = !{i32 -271733879, !147}
!147 = !{i32 30, i32 32, i32 0, i32 1}
!148 = !{i32 -1732584194, !93}
!149 = !{i64 2, !150}
!150 = !{i32 3, i32 64, i32 0, i32 1}
!151 = !{i32 271733878, !147}
!152 = !{i32 -1009589776, !106}
!153 = !{i32* @sha_info_count_lo, !154}
!154 = !{i32 0, i32 0, i32 32, i32 0}
!155 = !{i32* @sha_info_count_hi, !154}
!156 = !{i2 -2, !157}
!157 = !{i32 2, i32 2, i32 0, i32 1}
!158 = !{[18 x i8]* @empty_9, !7}
!159 = !{i32 8, !37}
!160 = !{[16 x i32]* @sha_info_data, !15}
!161 = !{i32 128, !162}
!162 = !{i32 9, i32 32, i32 0, i32 1}
!163 = !{i7 56, !61}
!164 = !{i6 -1, !165}
!165 = !{i32 1, i32 6, i32 0, i32 1}
!166 = !{i4 0, !167}
!167 = !{i32 1, i32 4, i32 0, i32 0}
!168 = !{i7 55, !61}
!169 = !{i64 14, !170}
!170 = !{i32 5, i32 64, i32 0, i32 0}
!171 = !{i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 14), !57}
!172 = !{i64 15, !170}
!173 = !{i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 15), !57}
!174 = !{void (i31, i4)* @local_memset_Pipeline_local_memset_label1, !175}
!175 = !{!176, !178, !12, !180, !182, !90, !26, !111, !58, !183, !185, !186, !187}
!176 = !{!"Arg", i32 0, !177}
!177 = !{i32 31, i32 31, i32 0, i32 2}
!178 = !{!"Arg", i32 1, !179}
!179 = !{i32 4, i32 4, i32 0, i32 2}
!180 = !{i30 0, !181}
!181 = !{i32 1, i32 30, i32 0, i32 0}
!182 = !{i30 1, !181}
!183 = !{i64 14, !184}
!184 = !{i32 5, i32 64, i32 0, i32 1}
!185 = !{i64 7, !118}
!186 = !{[20 x i8]* @empty_12, !7}
!187 = !{[16 x i32]* @sha_info_data, !154}
!188 = !{void (i7, i4)* @local_memset, !189}
!189 = !{!190, !178, !22, !192, !94, !193}
!190 = !{!"Arg", i32 0, !191}
!191 = !{i32 7, i32 7, i32 0, i32 2}
!192 = !{i7 0, !72}
!193 = !{i31 0, !194}
!194 = !{i32 1, i32 31, i32 0, i32 0}
!195 = !{void ([16384 x i8]*, i1, i32, i14)* @local_memcpy, !196}
!196 = !{!6, !8, !10, !197, !12, !135, !21, !26, !94, !193, !46, !50, !58, !53, !199, !200, !160, !138, !201, !203, !204}
!197 = !{!"Arg", i32 3, !198}
!198 = !{i32 14, i32 14, i32 0, i32 2}
!199 = !{i64 8, !184}
!200 = !{[20 x i8]* @empty_10, !7}
!201 = !{i14 2, !202}
!202 = !{i32 3, i32 14, i32 0, i32 1}
!203 = !{i14 3, !202}
!204 = !{i32 4, !23}
!205 = !{i32 37}
!206 = !{!207}
!207 = !{i32 35, !208}
!208 = !{!"WAR", !"indep"}
!209 = !{i32 38}
!210 = !{!211}
!211 = !{i32 36, !208}
!212 = !{i32 0, i32 0, i32 0, i32 2}
!213 = !{i32 35}
!214 = !{!215}
!215 = !{i32 37, !216}
!216 = !{!"RAW", !"indep"}
!217 = !{i32 3, i32 3, i32 0, i32 2}
!218 = !{i32 32, i32 32, i32 0, i32 0}
!219 = !{i32 26, i32 26, i32 0, i32 2}
!220 = !{i32 36}
!221 = !{!222}
!222 = !{i32 38, !216}
!223 = !{i32 43}
!224 = !{!225, !226}
!225 = !{i32 39, !216}
!226 = !{i32 40, !227}
!227 = !{!"WAW", !"indep"}
!228 = !{i32 44}
!229 = !{!230, !231}
!230 = !{i32 41, !216}
!231 = !{i32 42, !227}
!232 = !{i32 39}
!233 = !{!234, !235}
!234 = !{i32 43, !208}
!235 = !{i32 40, !236}
!236 = !{!"WAR", !"indep", i32 1, !"*", i32 -1, i1 true}
!237 = distinct !{!237, !238, !251, !252}
!238 = !{i32 168, i32 5, !239, null}
!239 = !{i32 786443, !240, !241}
!240 = !{i32 786478, i32 0, !241, !"sha_update", !"sha_update", null, !241, i32 154, !242, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !249, i32 154}
!241 = !{i32 786473, !"data/benchmarks/sha/sha.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!242 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !243, i32 0, i32 0}
!243 = !{null, !244, !248}
!244 = !{i32 786447, null, !"", !245, i32 0, i64 64, i64 0, i32 0, i32 0, !246}
!245 = !{i32 786473, !"<unknown>", null, null}
!246 = !{i32 786470, null, !"", !245, i32 0, i64 0, i64 0, i32 0, i32 0, !247}
!247 = !{i32 786468, null, !"unsigned char", null, i32 0, i64 8, i64 0, i32 0, i32 0, i32 8}
!248 = !{i32 786468, null, !"int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 5}
!249 = !{!250}
!250 = !{i32 0}
!251 = !{!"llvm.loop.name", !"sha_update_label4"}
!252 = !{!"llvm.loop.tripcount", i32 127, i32 128, i32 127, !"user", !253}
!253 = !{i32 163, i32 9, !239, null}
!254 = !{i32 41}
!255 = !{!256, !257}
!256 = !{i32 44, !208}
!257 = !{i32 42, !236}
!258 = !{!"user"}
!259 = !{i32 47}
!260 = !{!261, !263}
!261 = !{i32 45, !262}
!262 = !{!"RAW", !"indep", i32 1, !"*", i32 -1, i1 true}
!263 = !{i32 46, !227}
!264 = !{i32 45}
!265 = !{!266, !267}
!266 = !{i32 47, !236}
!267 = !{i32 46, !208}
!268 = !{i32 40}
!269 = !{!270, !271}
!270 = !{i32 43, !227}
!271 = !{i32 39, !262}
!272 = !{i32 42}
!273 = !{!274, !275}
!274 = !{i32 44, !227}
!275 = !{i32 41, !262}
!276 = !{i32 6, i32 6, i32 0, i32 2}
!277 = !{i32 8, i32 8, i32 0, i32 2}
!278 = !{i32 46}
!279 = !{!280, !281}
!280 = !{i32 47, !227}
!281 = !{i32 45, !216}
!282 = !{i32 0, i32 0, i32 5, i32 1}
!283 = !{i32 59}
!284 = !{!285, !286}
!285 = !{i32 57, !216}
!286 = !{i32 58, !227}
!287 = !{i32 5, i32 5, i32 0, i32 2}
!288 = !{i32 57}
!289 = !{!290, !291}
!290 = !{i32 59, !208}
!291 = !{i32 58, !236}
!292 = distinct !{!292, !293, !299, !300}
!293 = !{i32 101, i32 5, !294, null}
!294 = !{i32 786443, !295, i32 98, i32 5, !241, i32 0}
!295 = !{i32 786443, !296, !241}
!296 = !{i32 786478, i32 0, !241, !"sha_transform", !"sha_transform", null, !241, i32 92, !297, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @sha_transform, null, null, !249, i32 92}
!297 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !298, i32 0, i32 0}
!298 = !{null}
!299 = !{!"llvm.loop.name", !"sha_transform_label1"}
!300 = !{!"llvm.loop.tripcount", i32 16, i32 16, i32 16, !"user", !301}
!301 = !{i32 99, i32 9, !302, null}
!302 = !{i32 786443, !294, !241}
!303 = !{i32 0, i32 0, i32 7, i32 1}
!304 = !{i32 71}
!305 = !{!306, !307}
!306 = !{i32 60, !216}
!307 = !{i32 61, !227}
!308 = !{i32 64, i32 64, i32 0, i32 0}
!309 = !{i32 85}
!310 = !{!311, !312, !313, !314, !315, !316, !317, !318, !319}
!311 = !{i32 62, !216}
!312 = !{i32 63, !216}
!313 = !{i32 64, !216}
!314 = !{i32 65, !216}
!315 = !{i32 66, !227}
!316 = !{i32 67, !216}
!317 = !{i32 68, !216}
!318 = !{i32 69, !216}
!319 = !{i32 70, !216}
!320 = !{i32 58}
!321 = !{!322, !323}
!322 = !{i32 59, !227}
!323 = !{i32 57, !262}
!324 = !{i32 60}
!325 = !{!326, !327}
!326 = !{i32 71, !208}
!327 = !{i32 61, !236}
!328 = distinct !{!328, !329, !331, !332}
!329 = !{i32 107, i32 5, !330, null}
!330 = !{i32 786443, !295, i32 104, i32 5, !241, i32 0}
!331 = !{!"llvm.loop.name", !"sha_transform_label2"}
!332 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !333}
!333 = !{i32 105, i32 9, !334, null}
!334 = !{i32 786443, !330, !241}
!335 = !{i32 62}
!336 = !{!337, !338}
!337 = !{i32 85, !208}
!338 = !{i32 66, !339}
!339 = !{!"WAR", i32 1, !">", i32 3, i1 true}
!340 = !{i32 63}
!341 = !{!337, !342}
!342 = !{i32 66, !343}
!343 = !{!"WAR", i32 1, !">", i32 8, i1 true}
!344 = !{i32 64}
!345 = !{!337, !346}
!346 = !{i32 66, !347}
!347 = !{!"WAR", i32 1, !">", i32 14, i1 true}
!348 = !{i32 65}
!349 = !{!337, !350}
!350 = !{i32 66, !351}
!351 = !{!"WAR", i32 1, !">", i32 16, i1 true}
!352 = !{i32 66}
!353 = !{!354, !355, !357, !359, !361, !316, !317, !318, !319}
!354 = !{i32 85, !227}
!355 = !{i32 62, !356}
!356 = !{!"RAW", i32 1, !"<", i32 3, i1 true}
!357 = !{i32 63, !358}
!358 = !{!"RAW", i32 1, !"<", i32 8, i1 true}
!359 = !{i32 64, !360}
!360 = !{!"RAW", i32 1, !"<", i32 14, i1 true}
!361 = !{i32 65, !362}
!362 = !{!"RAW", i32 1, !"<", i32 16, i1 true}
!363 = !{i32 61}
!364 = !{!365, !366}
!365 = !{i32 71, !227}
!366 = !{i32 60, !262}
!367 = !{i32 134}
!368 = !{!369}
!369 = !{i32 72, !208}
!370 = !{i32 135}
!371 = !{!372}
!372 = !{i32 73, !208}
!373 = !{i32 136}
!374 = !{!375}
!375 = !{i32 74, !208}
!376 = !{i32 137}
!377 = !{!378}
!378 = !{i32 75, !208}
!379 = !{i32 138}
!380 = !{!381}
!381 = !{i32 76, !208}
!382 = !{i32 89}
!383 = !{!384, !385}
!384 = !{i32 77, !216}
!385 = !{i32 78, !227}
!386 = !{i32 88}
!387 = !{!388, !389}
!388 = !{i32 79, !216}
!389 = !{i32 80, !227}
!390 = !{i32 87}
!391 = !{!392, !393}
!392 = !{i32 81, !216}
!393 = !{i32 82, !227}
!394 = !{i32 86}
!395 = !{!396, !397}
!396 = !{i32 83, !216}
!397 = !{i32 84, !227}
!398 = !{i32 83}
!399 = !{!400, !401}
!400 = !{i32 86, !208}
!401 = !{i32 84, !236}
!402 = !{i32 81}
!403 = !{!404, !405}
!404 = !{i32 87, !208}
!405 = !{i32 82, !236}
!406 = !{i32 79}
!407 = !{!408, !409}
!408 = !{i32 88, !208}
!409 = !{i32 80, !236}
!410 = !{i32 77}
!411 = !{!412, !413}
!412 = !{i32 89, !208}
!413 = !{i32 78, !236}
!414 = distinct !{!414, !415, !417, !418}
!415 = !{i32 120, i32 5, !416, null}
!416 = !{i32 786443, !295, i32 117, i32 27, !241, i32 0}
!417 = !{!"llvm.loop.name", !"sha_transform_label3"}
!418 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !419}
!419 = !{i32 118, i32 9, !420, null}
!420 = !{i32 786443, !416, !241}
!421 = !{i32 0, i32 0, i32 6, i32 1}
!422 = !{i32 101}
!423 = !{!424, !425}
!424 = !{i32 90, !216}
!425 = !{i32 91, !227}
!426 = !{i32 100}
!427 = !{!428, !429}
!428 = !{i32 92, !216}
!429 = !{i32 93, !227}
!430 = !{i32 99}
!431 = !{!432, !433}
!432 = !{i32 94, !216}
!433 = !{i32 95, !227}
!434 = !{i32 98}
!435 = !{!436, !437}
!436 = !{i32 96, !216}
!437 = !{i32 97, !227}
!438 = !{i32 27, i32 27, i32 0, i32 2}
!439 = !{i32 67}
!440 = !{!337, !441}
!441 = !{i32 66, !208}
!442 = !{i32 2, i32 2, i32 0, i32 2}
!443 = !{i32 30, i32 30, i32 0, i32 2}
!444 = !{i32 78}
!445 = !{!446, !447}
!446 = !{i32 89, !227}
!447 = !{i32 77, !262}
!448 = !{i32 80}
!449 = !{!450, !451}
!450 = !{i32 88, !227}
!451 = !{i32 79, !262}
!452 = !{i32 82}
!453 = !{!454, !455}
!454 = !{i32 87, !227}
!455 = !{i32 81, !262}
!456 = !{i32 84}
!457 = !{!458, !459}
!458 = !{i32 86, !227}
!459 = !{i32 83, !262}
!460 = !{i32 96}
!461 = !{!462, !463}
!462 = !{i32 98, !208}
!463 = !{i32 97, !236}
!464 = !{i32 94}
!465 = !{!466, !467}
!466 = !{i32 99, !208}
!467 = !{i32 95, !236}
!468 = !{i32 92}
!469 = !{!470, !471}
!470 = !{i32 100, !208}
!471 = !{i32 93, !236}
!472 = !{i32 90}
!473 = !{!474, !475}
!474 = !{i32 101, !208}
!475 = !{i32 91, !236}
!476 = distinct !{!476, !477, !479, !480}
!477 = !{i32 124, i32 5, !478, null}
!478 = !{i32 786443, !295, i32 121, i32 27, !241, i32 0}
!479 = !{!"llvm.loop.name", !"sha_transform_label4"}
!480 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !481}
!481 = !{i32 122, i32 9, !482, null}
!482 = !{i32 786443, !478, !241}
!483 = !{i32 113}
!484 = !{!485, !486}
!485 = !{i32 102, !216}
!486 = !{i32 103, !227}
!487 = !{i32 112}
!488 = !{!489, !490}
!489 = !{i32 104, !216}
!490 = !{i32 105, !227}
!491 = !{i32 111}
!492 = !{!493, !494}
!493 = !{i32 106, !216}
!494 = !{i32 107, !227}
!495 = !{i32 110}
!496 = !{!497, !498}
!497 = !{i32 108, !216}
!498 = !{i32 109, !227}
!499 = !{i32 68}
!500 = !{i32 91}
!501 = !{!502, !503}
!502 = !{i32 101, !227}
!503 = !{i32 90, !262}
!504 = !{i32 93}
!505 = !{!506, !507}
!506 = !{i32 100, !227}
!507 = !{i32 92, !262}
!508 = !{i32 95}
!509 = !{!510, !511}
!510 = !{i32 99, !227}
!511 = !{i32 94, !262}
!512 = !{i32 97}
!513 = !{!514, !515}
!514 = !{i32 98, !227}
!515 = !{i32 96, !262}
!516 = !{i32 108}
!517 = !{!518, !519}
!518 = !{i32 110, !208}
!519 = !{i32 109, !236}
!520 = !{i32 106}
!521 = !{!522, !523}
!522 = !{i32 111, !208}
!523 = !{i32 107, !236}
!524 = !{i32 104}
!525 = !{!526, !527}
!526 = !{i32 112, !208}
!527 = !{i32 105, !236}
!528 = !{i32 102}
!529 = !{!530, !531}
!530 = !{i32 113, !208}
!531 = !{i32 103, !236}
!532 = distinct !{!532, !533, !535, !536}
!533 = !{i32 128, i32 5, !534, null}
!534 = !{i32 786443, !295, i32 125, i32 27, !241, i32 0}
!535 = !{!"llvm.loop.name", !"sha_transform_label5"}
!536 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !537}
!537 = !{i32 126, i32 9, !538, null}
!538 = !{i32 786443, !534, !241}
!539 = !{i32 131}
!540 = !{!541, !542}
!541 = !{i32 114, !216}
!542 = !{i32 115, !227}
!543 = !{i32 130}
!544 = !{!545, !546}
!545 = !{i32 116, !216}
!546 = !{i32 117, !227}
!547 = !{i32 129}
!548 = !{!549, !550}
!549 = !{i32 118, !216}
!550 = !{i32 119, !227}
!551 = !{i32 128}
!552 = !{!553, !554}
!553 = !{i32 120, !216}
!554 = !{i32 121, !227}
!555 = !{i32 133}
!556 = !{!557, !558, !559}
!557 = !{i32 122, !216}
!558 = !{i32 123, !216}
!559 = !{i32 124, !227}
!560 = !{i32 132}
!561 = !{!562, !563, !564}
!562 = !{i32 125, !216}
!563 = !{i32 126, !216}
!564 = !{i32 127, !227}
!565 = !{i32 69}
!566 = !{i32 103}
!567 = !{!568, !569}
!568 = !{i32 113, !227}
!569 = !{i32 102, !262}
!570 = !{i32 105}
!571 = !{!572, !573}
!572 = !{i32 112, !227}
!573 = !{i32 104, !262}
!574 = !{i32 107}
!575 = !{!576, !577}
!576 = !{i32 111, !227}
!577 = !{i32 106, !262}
!578 = !{i32 109}
!579 = !{!580, !581}
!580 = !{i32 110, !227}
!581 = !{i32 108, !262}
!582 = !{i32 120}
!583 = !{!584, !585}
!584 = !{i32 128, !208}
!585 = !{i32 121, !236}
!586 = !{i32 118}
!587 = !{!588, !589}
!588 = !{i32 129, !208}
!589 = !{i32 119, !236}
!590 = !{i32 116}
!591 = !{!592, !593}
!592 = !{i32 130, !208}
!593 = !{i32 117, !236}
!594 = !{i32 114}
!595 = !{!596, !597}
!596 = !{i32 131, !208}
!597 = !{i32 115, !236}
!598 = distinct !{!598, !599, !601, !602}
!599 = !{i32 132, i32 5, !600, null}
!600 = !{i32 786443, !295, i32 129, i32 27, !241, i32 0}
!601 = !{!"llvm.loop.name", !"sha_transform_label6"}
!602 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !603}
!603 = !{i32 130, i32 9, !604, null}
!604 = !{i32 786443, !600, !241}
!605 = !{i32 126}
!606 = !{!607, !608}
!607 = !{i32 132, !208}
!608 = !{i32 127, !236}
!609 = !{i32 123}
!610 = !{!611, !612}
!611 = !{i32 133, !208}
!612 = !{i32 124, !236}
!613 = !{i32 70}
!614 = !{i32 115}
!615 = !{!616, !617}
!616 = !{i32 131, !227}
!617 = !{i32 114, !262}
!618 = !{i32 117}
!619 = !{!620, !621}
!620 = !{i32 130, !227}
!621 = !{i32 116, !262}
!622 = !{i32 119}
!623 = !{!624, !625}
!624 = !{i32 129, !227}
!625 = !{i32 118, !262}
!626 = !{i32 121}
!627 = !{!628, !629}
!628 = !{i32 128, !227}
!629 = !{i32 120, !262}
!630 = !{i32 124}
!631 = !{!632, !557, !633}
!632 = !{i32 133, !227}
!633 = !{i32 123, !262}
!634 = !{i32 127}
!635 = !{!636, !562, !637}
!636 = !{i32 132, !227}
!637 = !{i32 126, !262}
!638 = !{i32 125}
!639 = !{!607, !640}
!640 = !{i32 127, !208}
!641 = !{i32 122}
!642 = !{!611, !643}
!643 = !{i32 124, !208}
!644 = !{i32 72}
!645 = !{!646}
!646 = !{i32 134, !216}
!647 = !{i32 73}
!648 = !{!649}
!649 = !{i32 135, !216}
!650 = !{i32 74}
!651 = !{!652}
!652 = !{i32 136, !216}
!653 = !{i32 75}
!654 = !{!655}
!655 = !{i32 137, !216}
!656 = !{i32 76}
!657 = !{!658}
!658 = !{i32 138, !216}
!659 = !{i32 0, i32 0, i32 3, i32 1}
!660 = !{i32 34}
!661 = !{!662, !663}
!662 = !{i32 32, !216}
!663 = !{i32 33, !227}
!664 = !{i32 32}
!665 = !{!666, !667}
!666 = !{i32 34, !208}
!667 = !{i32 33, !236}
!668 = distinct !{!668, !669, !683, !684, !685, !687}
!669 = !{i32 225, i32 5, !670, null}
!670 = !{i32 786443, !671, i32 225, i32 5, !241, i32 0}
!671 = !{i32 786443, !672, !241}
!672 = !{i32 786478, i32 0, !241, !"sha_stream", !"sha_stream", null, !241, i32 196, !673, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !249, i32 200}
!673 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !674, i32 0, i32 0}
!674 = !{null, !675, !679, !681}
!675 = !{i32 786447, null, !"", !245, i32 0, i64 64, i64 0, i32 0, i32 0, !676}
!676 = !{i32 786433, null, !"", null, i32 0, i64 65536, i64 0, i32 0, i32 0, !246, !677, i32 0, null, null}
!677 = !{!678}
!678 = !{i32 786465, i64 0, i64 8191}
!679 = !{i32 786447, null, !"", !245, i32 0, i64 64, i64 0, i32 0, i32 0, !680}
!680 = !{i32 786470, null, !"", !245, i32 0, i64 0, i64 0, i32 0, i32 0, !248}
!681 = !{i32 786447, null, !"", !245, i32 0, i64 64, i64 0, i32 0, i32 0, !682}
!682 = !{i32 786468, null, !"unsigned int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 7}
!683 = !{i32 228, i32 5, !670, null}
!684 = !{!"llvm.loop.name", !"sha_stream_label2"}
!685 = !{!"llvm.loop.tripcount", i32 5, i32 5, i32 5, !"user", !686}
!686 = !{i32 226, i32 9, !670, null}
!687 = !{!"llvm.loop.pipeline.enable", i32 -1, i1 false, i8 -1, !"auto"}
!688 = !{i32 33}
!689 = !{!690, !691}
!690 = !{i32 34, !227}
!691 = !{i32 32, !262}
!692 = !{i32 0, i32 0, i32 14, i32 1}
!693 = !{i32 0, i32 0, i32 2, i32 1}
!694 = !{i32 0, i32 0, i32 15, i32 1}
!695 = !{i32 29}
!696 = !{!697, !698}
!697 = !{i32 23, !216}
!698 = !{i32 24, !227}
!699 = !{i32 31}
!700 = !{!701, !702}
!701 = !{i32 25, !216}
!702 = !{i32 26, !227}
!703 = !{i32 30}
!704 = !{!705, !706}
!705 = !{i32 27, !216}
!706 = !{i32 28, !227}
!707 = !{i32 15, i32 15, i32 0, i32 2}
!708 = !{i32 23}
!709 = !{!710, !711}
!710 = !{i32 29, !208}
!711 = !{i32 24, !236}
!712 = !{i32 27}
!713 = !{!714, !715}
!714 = !{i32 30, !208}
!715 = !{i32 28, !236}
!716 = !{i32 25}
!717 = !{!718, !719}
!718 = !{i32 31, !208}
!719 = !{i32 26, !236}
!720 = !{i32 24}
!721 = !{!722, !723}
!722 = !{i32 29, !227}
!723 = !{i32 23, !262}
!724 = !{i32 26}
!725 = !{!726, !727}
!726 = !{i32 31, !227}
!727 = !{i32 25, !262}
!728 = !{i32 28}
!729 = !{!730, !731}
!730 = !{i32 30, !227}
!731 = !{i32 27, !262}
!732 = distinct !{!732, !733, !738, !739, !740, !687}
!733 = !{i32 207, i32 20, !734, null}
!734 = !{i32 786443, !735, i32 207, i32 20, !241, i32 0}
!735 = !{i32 786443, !736, i32 205, i32 29, !241, i32 0}
!736 = !{i32 786443, !737, i32 205, i32 5, !241, i32 0}
!737 = !{i32 786443, !671, i32 205, i32 5, !241, i32 0}
!738 = !{i32 210, i32 9, !734, null}
!739 = !{!"llvm.loop.name", !"VITIS_LOOP_207_1"}
!740 = !{!"llvm.loop.tripcount", i32 8192, i32 8192, i32 8192, !"user", !741}
!741 = !{i32 208, i32 9, !734, null}
!742 = !{!1}
!743 = !{i32 16}
!744 = !{!745}
!745 = !{i32 0, !216}
!746 = !{i32 17}
!747 = !{!748, !750, !751, !752}
!748 = !{i32 0, !749}
!749 = !{!"Unknown", !"indep"}
!750 = !{i32 1, !749}
!751 = !{i32 2, !749}
!752 = !{i32 3, !216}
!753 = !{i32 18}
!754 = !{i32 19}
!755 = !{i32 20}
!756 = !{i32 21}
!757 = !{i32 9}
!758 = !{!759, !748}
!759 = !{i32 4, !216}
!760 = !{i32 10}
!761 = !{!762, !748}
!762 = !{i32 5, !216}
!763 = !{i32 8}
!764 = !{!765, !766}
!765 = !{i32 6, !216}
!766 = !{i32 7, !227}
!767 = !{i32 6}
!768 = !{!769, !770}
!769 = !{i32 8, !208}
!770 = !{i32 7, !236}
!771 = distinct !{!771, !772, !774, !775, !776}
!772 = !{i32 216, i32 5, !773, null}
!773 = !{i32 786443, !671, i32 216, i32 5, !241, i32 0}
!774 = !{i32 221, i32 5, !773, null}
!775 = !{!"llvm.loop.name", !"sha_stream_label0"}
!776 = !{!"llvm.loop.tripcount", i32 2, i32 2, i32 2, !"user", !777}
!777 = !{i32 217, i32 9, !773, null}
!778 = !{!779, !780, !781, !782, !783, !784, !785, !786, !787, !788, !789, !790, !750, !791, !792, !793, !794, !751, !795}
!779 = !{i32 16, !208}
!780 = !{i32 17, !749}
!781 = !{i32 18, !749}
!782 = !{i32 19, !749}
!783 = !{i32 20, !749}
!784 = !{i32 21, !749}
!785 = !{i32 9, !749}
!786 = !{i32 10, !749}
!787 = !{i32 4, !749}
!788 = !{i32 5, !749}
!789 = !{i32 22, !749}
!790 = !{i32 11, !749}
!791 = !{i32 12, !749}
!792 = !{i32 13, !749}
!793 = !{i32 14, !749}
!794 = !{i32 15, !749}
!795 = !{i32 3, !749}
!796 = !{i32 7}
!797 = !{!798, !799}
!798 = !{i32 8, !227}
!799 = !{i32 6, !262}
!800 = !{i32 4}
!801 = !{!802, !748}
!802 = !{i32 9, !208}
!803 = !{i32 5}
!804 = !{!805, !748}
!805 = !{i32 10, !208}
!806 = !{i32 7, i32 7, i32 0, i32 0}
!807 = !{i32 22}
!808 = !{!748, !809, !810, !811, !812, !813, !814, !815}
!809 = !{i32 11, !227}
!810 = !{i32 1, !216}
!811 = !{i32 12, !227}
!812 = !{i32 13, !227}
!813 = !{i32 14, !227}
!814 = !{i32 15, !227}
!815 = !{i32 2, !216}
!816 = !{i32 11}
!817 = !{!818, !748, !810, !811, !812, !813, !814, !815}
!818 = !{i32 22, !227}
!819 = !{i32 1}
!820 = !{!780, !781, !782, !783, !784, !821, !748, !822, !823, !824, !825, !826, !751, !795}
!821 = !{i32 22, !208}
!822 = !{i32 11, !208}
!823 = !{i32 12, !208}
!824 = !{i32 13, !208}
!825 = !{i32 14, !208}
!826 = !{i32 15, !208}
!827 = !{i32 12}
!828 = !{!818, !748, !809, !810, !812, !813, !814, !815}
!829 = !{i32 13}
!830 = !{!818, !748, !809, !810, !811, !813, !814, !815}
!831 = !{i32 14}
!832 = !{!818, !748, !809, !810, !811, !812, !815}
!833 = !{i32 15}
!834 = !{i32 2}
!835 = !{!780, !781, !782, !783, !784, !821, !748, !822, !750, !823, !824, !825, !826, !795}
!836 = !{i32 3}
!837 = !{!838, !839, !840, !841, !842, !748, !750, !751}
!838 = !{i32 17, !208}
!839 = !{i32 18, !208}
!840 = !{i32 19, !208}
!841 = !{i32 20, !208}
!842 = !{i32 21, !208}
!843 = !{i32 0, i32 0, i32 30, i32 1}
!844 = !{i32 56}
!845 = !{!846, !847}
!846 = !{i32 54, !216}
!847 = !{i32 55, !227}
!848 = !{i32 54}
!849 = !{!850, !851}
!850 = !{i32 56, !208}
!851 = !{i32 55, !236}
!852 = !{i32 31, i32 31, i32 0, i32 0}
!853 = distinct !{!853, !854, !859, !860, !861, !865, !687}
!854 = !{i32 65, i32 5, !855, null}
!855 = !{i32 786443, !856, !241}
!856 = !{i32 786478, i32 0, !241, !"local_memset", !"local_memset", null, !241, i32 55, !857, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i7, i4)* @local_memset, null, null, !249, i32 55}
!857 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !858, i32 0, i32 0}
!858 = !{null, !681, !248, !248, !248}
!859 = !{i32 68, i32 5, !855, null}
!860 = !{!"llvm.loop.name", !"local_memset_label1"}
!861 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !862}
!862 = !{i32 11, i32 9, !863, null}
!863 = !{i32 786443, !856, !864}
!864 = !{i32 786473, !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!865 = !{!"llvm.loop.tripcount", i32 0, i32 14, i32 7, !"user", !866}
!866 = !{i32 66, i32 9, !855, null}
!867 = !{i32 55}
!868 = !{!869, !870}
!869 = !{i32 56, !227}
!870 = !{i32 54, !262}
!871 = !{i32 30, i32 30, i32 0, i32 1}
!872 = !{i32 31, i32 31, i32 0, i32 1}
!873 = !{i32 53}
!874 = !{!875, !876}
!875 = !{i32 48, !216}
!876 = !{i32 49, !227}
!877 = !{i32 52}
!878 = !{!879, !880}
!879 = !{i32 50, !216}
!880 = !{i32 51, !227}
!881 = !{i32 50}
!882 = !{!883, !884}
!883 = !{i32 52, !208}
!884 = !{i32 51, !236}
!885 = distinct !{!885, !886, !891, !892, !895}
!886 = !{i32 88, i32 5, !887, null}
!887 = !{i32 786443, !888, !241}
!888 = !{i32 786478, i32 0, !241, !"local_memcpy", !"local_memcpy", null, !241, i32 72, !889, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !249, i32 72}
!889 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !890, i32 0, i32 0}
!890 = !{null, !681, !244, !248}
!891 = !{!"llvm.loop.name", !"local_memcpy_label3"}
!892 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !893}
!893 = !{i32 12, i32 9, !894, null}
!894 = !{i32 786443, !888, !864}
!895 = !{!"llvm.loop.tripcount", i32 0, i32 16, i32 8, !"user", !896}
!896 = !{i32 80, i32 9, !887, null}
!897 = !{i32 48}
!898 = !{!899, !900}
!899 = !{i32 53, !208}
!900 = !{i32 49, !236}
!901 = !{i32 49}
!902 = !{!903, !904}
!903 = !{i32 53, !227}
!904 = !{i32 48, !262}
!905 = !{i32 51}
!906 = !{!907, !908}
!907 = !{i32 52, !227}
!908 = !{i32 50, !262}
