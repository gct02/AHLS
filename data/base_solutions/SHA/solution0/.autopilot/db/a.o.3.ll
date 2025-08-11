; ModuleID = 'data/base_solutions/SHA/solution0/.autopilot/db/a.o.3.bc'
source_filename = "data/base_solutions/SHA/solution0/.autopilot/db/a.o.3.bc"
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
  %idx = alloca i32, align 4, !bitwidth !17
  %count_addr_02 = alloca i32, align 4, !bitwidth !60
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_7), !fpga.pragma.source !202
  %count_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %count), !bitwidth !11
  %buffer_offset_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %buffer_offset), !bitwidth !9
  %sha_info_count_lo_load = load i32, i32* @sha_info_count_lo, align 512, !bitwidth !11, !dep_idx !203, !deps !204
  %shl_ln155 = shl i32 %count_read, 3, !bitwidth !11
  %add_ln155 = add i32 %sha_info_count_lo_load, %shl_ln155, !bitwidth !11
  %icmp_ln155 = icmp ult i32 %add_ln155, %sha_info_count_lo_load, !bitwidth !9
  %sha_info_count_hi_load = load i32, i32* @sha_info_count_hi, align 512, !bitwidth !11, !dep_idx !207, !deps !208
  %add_ln156 = add i32 %sha_info_count_hi_load, 1, !bitwidth !11
  %select_ln155 = select i1 %icmp_ln155, i32 %add_ln156, i32 %sha_info_count_hi_load, !bitwidth !11
  store i32 %add_ln155, i32* @sha_info_count_lo, align 512, !bitwidth !210, !dep_idx !211, !deps !212
  %lshr_ln = call i3 @_ssdm_op_PartSelect.i3.i32.i32.i32(i32 %count_read, i32 29, i32 31), !bitwidth !215
  %zext_ln159 = zext i3 %lshr_ln to i32, !bitwidth !216
  %add_ln159 = add i32 %select_ln155, %zext_ln159, !bitwidth !11
  %tmp = call i26 @_ssdm_op_PartSelect.i26.i32.i32.i32(i32 %count_read, i32 6, i32 31), !bitwidth !217
  %icmp_ln162 = icmp sgt i26 %tmp, 0, !bitwidth !9
  store i32 %add_ln159, i32* @sha_info_count_hi, align 512, !bitwidth !210, !dep_idx !218, !deps !219
  store i32 %count_read, i32* %count_addr_02, align 4, !bitwidth !210, !dep_idx !221, !deps !222
  store i32 0, i32* %idx, align 4, !bitwidth !210, !dep_idx !226, !deps !227
  br label %while.body, !bitwidth !210

while.body:                                       ; preds = %while.body.split, %entry
  %count_load = load i32, i32* %count_addr_02, align 4, !bitwidth !11, !dep_idx !230, !deps !231
  %tmp_2 = call i26 @_ssdm_op_PartSelect.i26.i32.i32.i32(i32 %count_load, i32 6, i32 31), !bitwidth !217
  %icmp_ln162_1 = icmp sgt i26 %tmp_2, 0, !bitwidth !9
  br i1 %icmp_ln162_1, label %while.body.split, label %while.end.loopexit, !llvm.loop !235, !bitwidth !210

while.body.split:                                 ; preds = %while.body
  %idx_load = load i32, i32* %idx, align 4, !bitwidth !11, !dep_idx !252, !deps !253
  %trunc_ln162 = trunc i32 %idx_load to i14, !bitwidth !196
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 0, i64 128, i64 64), !fpga.pragma.source !202
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @empty_11)
  call fastcc void @local_memcpy([16384 x i8]* %buffer, i1 %buffer_offset_read, i32 64, i14 %trunc_ln162), !bitwidth !210, !dep_idx !256, !deps !257
  call fastcc void @sha_transform(), !bitwidth !210, !dep_idx !261, !deps !262
  %add_ln167 = add nuw nsw i32 %count_load, -64, !bitwidth !11
  %add_ln162 = add nuw i32 %idx_load, 64, !bitwidth !11
  store i32 %add_ln167, i32* %count_addr_02, align 4, !bitwidth !210, !dep_idx !265, !deps !266
  store i32 %add_ln162, i32* %idx, align 4, !bitwidth !210, !dep_idx !269, !deps !270
  br label %while.body, !llvm.loop !235, !bitwidth !210

while.end.loopexit:                               ; preds = %while.body
  %trunc_ln162_1 = trunc i32 %count_read to i6, !bitwidth !273
  %tmp_1 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %count_read, i32 6, i32 13), !bitwidth !274
  %and_ln = call i14 @_ssdm_op_BitConcatenate.i14.i8.i6(i8 %tmp_1, i6 0), !bitwidth !196
  %zext_ln169 = zext i6 %trunc_ln162_1 to i32, !bitwidth !216
  %select_ln169 = select i1 %icmp_ln162, i32 %zext_ln169, i32 %count_read, !bitwidth !11
  %select_ln169_1 = select i1 %icmp_ln162, i14 %and_ln, i14 0, !bitwidth !196
  call fastcc void @local_memcpy([16384 x i8]* %buffer, i1 %buffer_offset_read, i32 %select_ln169, i14 %select_ln169_1), !bitwidth !210, !dep_idx !275, !deps !276
  ret void, !bitwidth !210
}

; Function Attrs: noinline nounwind
define internal fastcc void @sha_transform() unnamed_addr #1 {
entry:
  %i = alloca i5, align 1, !bitwidth !279
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_7), !fpga.pragma.source !202
  %W = alloca [80 x i32], i64 1, align 512, !bitwidth !60
  store i5 0, i5* %i, align 1, !bitwidth !210, !dep_idx !280, !deps !281
  br label %for.inc, !bitwidth !210

for.inc:                                          ; preds = %for.inc.split, %entry
  %i_6 = load i5, i5* %i, align 1, !bitwidth !284, !dep_idx !285, !deps !286
  %icmp_ln98 = icmp eq i5 %i_6, -16, !bitwidth !9
  %add_ln98 = add nuw i5 %i_6, 1, !bitwidth !284
  br i1 %icmp_ln98, label %for.inc21.preheader, label %for.inc.split, !llvm.loop !289, !bitwidth !210

for.inc21.preheader:                              ; preds = %for.inc
  %i_1 = alloca i7, align 1, !bitwidth !300
  store i7 16, i7* %i_1, align 1, !bitwidth !210, !dep_idx !301, !deps !302
  br label %for.inc21, !bitwidth !210

for.inc.split:                                    ; preds = %for.inc
  %zext_ln98 = zext i5 %i_6 to i64, !bitwidth !305
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 16, i64 16, i64 16), !fpga.pragma.source !202
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_4)
  %sha_info_data_addr = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext_ln98, !bitwidth !60
  %sha_info_data_load = load i32, i32* %sha_info_data_addr, align 4, !bitwidth !11
  %W_addr = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln98, !bitwidth !60
  store i32 %sha_info_data_load, i32* %W_addr, align 4, !bitwidth !210, !dep_idx !306, !deps !307
  store i5 %add_ln98, i5* %i, align 1, !bitwidth !210, !dep_idx !317, !deps !318
  br label %for.inc, !llvm.loop !289, !bitwidth !210

for.inc21:                                        ; preds = %for.inc21.split, %for.inc21.preheader
  %i_7 = load i7, i7* %i_1, align 1, !bitwidth !189, !dep_idx !321, !deps !322
  %icmp_ln104 = icmp eq i7 %i_7, -48, !bitwidth !9
  br i1 %icmp_ln104, label %for.end23, label %for.inc21.split, !llvm.loop !325, !bitwidth !210

for.inc21.split:                                  ; preds = %for.inc21
  %zext_ln104 = zext i7 %i_7 to i64, !bitwidth !305
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !202
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_0)
  %add_ln106 = add nuw i7 %i_7, -3, !bitwidth !189
  %zext_ln106 = zext i7 %add_ln106 to i64, !bitwidth !305
  %W_addr_1 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln106, !bitwidth !60
  %W_load = load i32, i32* %W_addr_1, align 4, !bitwidth !11, !dep_idx !332, !deps !333
  %add_ln106_1 = add nuw i7 %i_7, -8, !bitwidth !189
  %zext_ln106_1 = zext i7 %add_ln106_1 to i64, !bitwidth !305
  %W_addr_2 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln106_1, !bitwidth !60
  %W_load_1 = load i32, i32* %W_addr_2, align 4, !bitwidth !11, !dep_idx !337, !deps !338
  %add_ln106_2 = add nuw i7 %i_7, -14, !bitwidth !189
  %zext_ln106_2 = zext i7 %add_ln106_2 to i64, !bitwidth !305
  %W_addr_3 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln106_2, !bitwidth !60
  %W_load_2 = load i32, i32* %W_addr_3, align 4, !bitwidth !11, !dep_idx !341, !deps !342
  %add_ln106_3 = add nuw nsw i7 %i_7, -16, !bitwidth !189
  %zext_ln106_3 = zext i7 %add_ln106_3 to i64, !bitwidth !305
  %W_addr_4 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln106_3, !bitwidth !60
  %W_load_3 = load i32, i32* %W_addr_4, align 4, !bitwidth !11, !dep_idx !345, !deps !346
  %xor_ln106 = xor i32 %W_load_1, %W_load, !bitwidth !11
  %xor_ln106_1 = xor i32 %W_load_2, %W_load_3, !bitwidth !11
  %xor_ln106_2 = xor i32 %xor_ln106_1, %xor_ln106, !bitwidth !11
  %W_addr_5 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln104, !bitwidth !60
  store i32 %xor_ln106_2, i32* %W_addr_5, align 4, !bitwidth !210, !dep_idx !349, !deps !350
  %add_ln104 = add nuw i7 %i_7, 1, !bitwidth !189
  store i7 %add_ln104, i7* %i_1, align 1, !bitwidth !210, !dep_idx !360, !deps !361
  br label %for.inc21, !llvm.loop !325, !bitwidth !210

for.end23:                                        ; preds = %for.inc21
  %i_2 = alloca i5, align 1, !bitwidth !279
  %C_1 = alloca i32, align 4, !bitwidth !60
  %D_1 = alloca i32, align 4, !bitwidth !60
  %E_1 = alloca i32, align 4, !bitwidth !60
  %A = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512, !bitwidth !11, !dep_idx !364, !deps !365
  %B = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4, !bitwidth !11, !dep_idx !367, !deps !368
  %C = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8, !bitwidth !11, !dep_idx !370, !deps !371
  %D = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4, !bitwidth !11, !dep_idx !373, !deps !374
  %E = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16, !bitwidth !11, !dep_idx !376, !deps !377
  store i32 %E, i32* %E_1, align 4, !bitwidth !210, !dep_idx !379, !deps !380
  store i32 %D, i32* %D_1, align 4, !bitwidth !210, !dep_idx !383, !deps !384
  store i32 %C, i32* %C_1, align 4, !bitwidth !210, !dep_idx !387, !deps !388
  store i5 0, i5* %i_2, align 1, !bitwidth !210, !dep_idx !391, !deps !392
  br label %for.inc38, !bitwidth !210

for.inc38:                                        ; preds = %for.inc38.split, %for.end23
  %B_10 = phi i32 [ %A_9, %for.inc38.split ], [ %A, %for.end23 ], !bitwidth !11
  %B_2 = phi i32 [ %B_10, %for.inc38.split ], [ %B, %for.end23 ], !bitwidth !11
  %i_8 = load i5, i5* %i_2, align 1, !bitwidth !284, !dep_idx !395, !deps !396
  %D_13 = load i32, i32* %C_1, align 4, !bitwidth !11, !dep_idx !399, !deps !400
  %E_13 = load i32, i32* %D_1, align 4, !bitwidth !11, !dep_idx !403, !deps !404
  %E_4 = load i32, i32* %E_1, align 4, !bitwidth !11, !dep_idx !407, !deps !408
  %icmp_ln117 = icmp eq i5 %i_8, -12, !bitwidth !9
  %add_ln117 = add nuw i5 %i_8, 1, !bitwidth !284
  br i1 %icmp_ln117, label %for.inc60.preheader, label %for.inc38.split, !llvm.loop !411, !bitwidth !210

for.inc60.preheader:                              ; preds = %for.inc38
  %i_3 = alloca i6, align 1, !bitwidth !418
  %C_3 = alloca i32, align 4, !bitwidth !60
  %D_2 = alloca i32, align 4, !bitwidth !60
  %E_2 = alloca i32, align 4, !bitwidth !60
  store i32 %E_4, i32* %E_2, align 4, !bitwidth !210, !dep_idx !419, !deps !420
  store i32 %E_13, i32* %D_2, align 4, !bitwidth !210, !dep_idx !423, !deps !424
  store i32 %D_13, i32* %C_3, align 4, !bitwidth !210, !dep_idx !427, !deps !428
  store i6 20, i6* %i_3, align 1, !bitwidth !210, !dep_idx !431, !deps !432
  br label %for.inc60, !bitwidth !210

for.inc38.split:                                  ; preds = %for.inc38
  %zext_ln94 = zext i5 %i_8 to i64, !bitwidth !305
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !202
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_1)
  %trunc_ln119 = trunc i32 %B_10 to i27, !bitwidth !435
  %lshr_ln = call i5 @_ssdm_op_PartSelect.i5.i32.i32.i32(i32 %B_10, i32 27, i32 31), !bitwidth !284
  %W_addr_6 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln94, !bitwidth !60
  %W_load_4 = load i32, i32* %W_addr_6, align 4, !bitwidth !11, !dep_idx !436, !deps !437
  %xor_ln119 = xor i32 %B_2, -1, !bitwidth !11
  %and_ln119 = and i32 %D_13, %B_2, !bitwidth !11
  %and_ln119_1 = and i32 %E_13, %xor_ln119, !bitwidth !11
  %or_ln119 = or i32 %and_ln119_1, %and_ln119, !bitwidth !11
  %or_ln119_1 = call i32 @_ssdm_op_BitConcatenate.i32.i27.i5(i27 %trunc_ln119, i5 %lshr_ln), !bitwidth !11
  %add_ln119 = add i32 %W_load_4, %or_ln119_1, !bitwidth !11
  %add_ln119_1 = add i32 %or_ln119, 1518500249, !bitwidth !11
  %add_ln119_2 = add i32 %add_ln119_1, %E_4, !bitwidth !11
  %A_9 = add i32 %add_ln119_2, %add_ln119, !bitwidth !11
  %trunc_ln119_1 = trunc i32 %B_2 to i2, !bitwidth !439
  %lshr_ln119_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %B_2, i32 2, i32 31), !bitwidth !440
  %C_2 = call i32 @_ssdm_op_BitConcatenate.i32.i2.i30(i2 %trunc_ln119_1, i30 %lshr_ln119_1), !bitwidth !11
  store i32 %E_13, i32* %E_1, align 4, !bitwidth !210, !dep_idx !441, !deps !442
  store i32 %D_13, i32* %D_1, align 4, !bitwidth !210, !dep_idx !445, !deps !446
  store i32 %C_2, i32* %C_1, align 4, !bitwidth !210, !dep_idx !449, !deps !450
  store i5 %add_ln117, i5* %i_2, align 1, !bitwidth !210, !dep_idx !453, !deps !454
  br label %for.inc38, !llvm.loop !411, !bitwidth !210

for.inc60:                                        ; preds = %for.inc60.split, %for.inc60.preheader
  %B_11 = phi i32 [ %A_10, %for.inc60.split ], [ %B_10, %for.inc60.preheader ], !bitwidth !11
  %B_4 = phi i32 [ %B_11, %for.inc60.split ], [ %B_2, %for.inc60.preheader ], !bitwidth !11
  %i_9 = load i6, i6* %i_3, align 1, !bitwidth !273, !dep_idx !457, !deps !458
  %D_14 = load i32, i32* %C_3, align 4, !bitwidth !11, !dep_idx !461, !deps !462
  %E_14 = load i32, i32* %D_2, align 4, !bitwidth !11, !dep_idx !465, !deps !466
  %E_8 = load i32, i32* %E_2, align 4, !bitwidth !11, !dep_idx !469, !deps !470
  %icmp_ln121 = icmp eq i6 %i_9, -24, !bitwidth !9
  br i1 %icmp_ln121, label %for.inc85.preheader, label %for.inc60.split, !llvm.loop !473, !bitwidth !210

for.inc85.preheader:                              ; preds = %for.inc60
  %i_4 = alloca i6, align 1, !bitwidth !418
  %C_7 = alloca i32, align 4, !bitwidth !60
  %D_5 = alloca i32, align 4, !bitwidth !60
  %E_5 = alloca i32, align 4, !bitwidth !60
  store i32 %E_8, i32* %E_5, align 4, !bitwidth !210, !dep_idx !480, !deps !481
  store i32 %E_14, i32* %D_5, align 4, !bitwidth !210, !dep_idx !484, !deps !485
  store i32 %D_14, i32* %C_7, align 4, !bitwidth !210, !dep_idx !488, !deps !489
  store i6 -24, i6* %i_4, align 1, !bitwidth !210, !dep_idx !492, !deps !493
  br label %for.inc85, !bitwidth !210

for.inc60.split:                                  ; preds = %for.inc60
  %zext_ln94_1 = zext i6 %i_9 to i64, !bitwidth !305
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !202
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_2)
  %trunc_ln123 = trunc i32 %B_11 to i27, !bitwidth !435
  %lshr_ln1 = call i5 @_ssdm_op_PartSelect.i5.i32.i32.i32(i32 %B_11, i32 27, i32 31), !bitwidth !284
  %W_addr_7 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln94_1, !bitwidth !60
  %W_load_5 = load i32, i32* %W_addr_7, align 4, !bitwidth !11, !dep_idx !496, !deps !437
  %xor_ln123 = xor i32 %B_4, %E_14, !bitwidth !11
  %xor_ln123_1 = xor i32 %xor_ln123, %D_14, !bitwidth !11
  %or_ln = call i32 @_ssdm_op_BitConcatenate.i32.i27.i5(i27 %trunc_ln123, i5 %lshr_ln1), !bitwidth !11
  %add_ln123 = add i32 %W_load_5, %or_ln, !bitwidth !11
  %add_ln123_1 = add i32 %xor_ln123_1, 1859775393, !bitwidth !11
  %add_ln123_2 = add i32 %add_ln123_1, %E_8, !bitwidth !11
  %A_10 = add i32 %add_ln123_2, %add_ln123, !bitwidth !11
  %trunc_ln123_1 = trunc i32 %B_4 to i2, !bitwidth !439
  %lshr_ln123_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %B_4, i32 2, i32 31), !bitwidth !440
  %C_4 = call i32 @_ssdm_op_BitConcatenate.i32.i2.i30(i2 %trunc_ln123_1, i30 %lshr_ln123_1), !bitwidth !11
  %add_ln121 = add nuw i6 %i_9, 1, !bitwidth !273
  store i32 %E_14, i32* %E_2, align 4, !bitwidth !210, !dep_idx !497, !deps !498
  store i32 %D_14, i32* %D_2, align 4, !bitwidth !210, !dep_idx !501, !deps !502
  store i32 %C_4, i32* %C_3, align 4, !bitwidth !210, !dep_idx !505, !deps !506
  store i6 %add_ln121, i6* %i_3, align 1, !bitwidth !210, !dep_idx !509, !deps !510
  br label %for.inc60, !llvm.loop !473, !bitwidth !210

for.inc85:                                        ; preds = %for.inc85.split, %for.inc85.preheader
  %B_12 = phi i32 [ %A_11, %for.inc85.split ], [ %B_11, %for.inc85.preheader ], !bitwidth !11
  %B_6 = phi i32 [ %B_12, %for.inc85.split ], [ %B_4, %for.inc85.preheader ], !bitwidth !11
  %i_10 = load i6, i6* %i_4, align 1, !bitwidth !273, !dep_idx !513, !deps !514
  %D_15 = load i32, i32* %C_7, align 4, !bitwidth !11, !dep_idx !517, !deps !518
  %E_15 = load i32, i32* %D_5, align 4, !bitwidth !11, !dep_idx !521, !deps !522
  %E_11 = load i32, i32* %E_5, align 4, !bitwidth !11, !dep_idx !525, !deps !526
  %icmp_ln125 = icmp eq i6 %i_10, -4, !bitwidth !9
  br i1 %icmp_ln125, label %for.inc107.preheader, label %for.inc85.split, !llvm.loop !529, !bitwidth !210

for.inc107.preheader:                             ; preds = %for.inc85
  %E_7 = alloca i32, align 4, !bitwidth !60
  %B_5 = alloca i32, align 4, !bitwidth !60
  %i_5 = alloca i7, align 1, !bitwidth !300
  %E_9 = alloca i32, align 4, !bitwidth !60
  %D_8 = alloca i32, align 4, !bitwidth !60
  %B_7 = alloca i32, align 4, !bitwidth !60
  store i32 %B_12, i32* %B_7, align 4, !bitwidth !210, !dep_idx !536, !deps !537
  store i32 %D_15, i32* %D_8, align 4, !bitwidth !210, !dep_idx !540, !deps !541
  store i32 %E_15, i32* %E_9, align 4, !bitwidth !210, !dep_idx !544, !deps !545
  store i7 60, i7* %i_5, align 1, !bitwidth !210, !dep_idx !548, !deps !549
  store i32 %B_6, i32* %B_5, align 4, !bitwidth !210, !dep_idx !552, !deps !553
  store i32 %E_11, i32* %E_7, align 4, !bitwidth !210, !dep_idx !557, !deps !558
  br label %for.inc107, !bitwidth !210

for.inc85.split:                                  ; preds = %for.inc85
  %zext_ln94_2 = zext i6 %i_10 to i64, !bitwidth !305
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !202
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty)
  %trunc_ln127 = trunc i32 %B_12 to i27, !bitwidth !435
  %lshr_ln2 = call i5 @_ssdm_op_PartSelect.i5.i32.i32.i32(i32 %B_12, i32 27, i32 31), !bitwidth !284
  %W_addr_8 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln94_2, !bitwidth !60
  %W_load_6 = load i32, i32* %W_addr_8, align 4, !bitwidth !11, !dep_idx !562, !deps !437
  %or_ln127 = or i32 %E_15, %D_15, !bitwidth !11
  %and_ln127 = and i32 %or_ln127, %B_6, !bitwidth !11
  %and_ln127_1 = and i32 %E_15, %D_15, !bitwidth !11
  %or_ln127_1 = or i32 %and_ln127, %and_ln127_1, !bitwidth !11
  %or_ln127_2 = call i32 @_ssdm_op_BitConcatenate.i32.i27.i5(i27 %trunc_ln127, i5 %lshr_ln2), !bitwidth !11
  %add_ln127 = add i32 %W_load_6, %or_ln127_2, !bitwidth !11
  %add_ln127_1 = add i32 %E_11, %or_ln127_1, !bitwidth !11
  %add_ln127_2 = add i32 %add_ln127_1, -1894007588, !bitwidth !11
  %A_11 = add i32 %add_ln127_2, %add_ln127, !bitwidth !11
  %trunc_ln127_1 = trunc i32 %B_6 to i2, !bitwidth !439
  %lshr_ln127_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %B_6, i32 2, i32 31), !bitwidth !440
  %C_6 = call i32 @_ssdm_op_BitConcatenate.i32.i2.i30(i2 %trunc_ln127_1, i30 %lshr_ln127_1), !bitwidth !11
  %add_ln125 = add nuw i6 %i_10, 1, !bitwidth !273
  store i32 %E_15, i32* %E_5, align 4, !bitwidth !210, !dep_idx !563, !deps !564
  store i32 %D_15, i32* %D_5, align 4, !bitwidth !210, !dep_idx !567, !deps !568
  store i32 %C_6, i32* %C_7, align 4, !bitwidth !210, !dep_idx !571, !deps !572
  store i6 %add_ln125, i6* %i_4, align 1, !bitwidth !210, !dep_idx !575, !deps !576
  br label %for.inc85, !llvm.loop !529, !bitwidth !210

for.inc107:                                       ; preds = %for.inc107.split, %for.inc107.preheader
  %i_11 = load i7, i7* %i_5, align 1, !bitwidth !189, !dep_idx !579, !deps !580
  %D_16 = load i32, i32* %E_9, align 4, !bitwidth !11, !dep_idx !583, !deps !584
  %C_13 = load i32, i32* %D_8, align 4, !bitwidth !11, !dep_idx !587, !deps !588
  %A_12 = load i32, i32* %B_7, align 4, !bitwidth !11, !dep_idx !591, !deps !592
  %icmp_ln129 = icmp eq i7 %i_11, -48, !bitwidth !9
  br i1 %icmp_ln129, label %for.end109, label %for.inc107.split, !llvm.loop !595, !bitwidth !210

for.inc107.split:                                 ; preds = %for.inc107
  %E_7_load_1 = load i32, i32* %E_7, align 4, !bitwidth !11, !dep_idx !602, !deps !603
  %B_5_load_1 = load i32, i32* %B_5, align 4, !bitwidth !11, !dep_idx !606, !deps !607
  %zext_ln129 = zext i7 %i_11 to i64, !bitwidth !305
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !202
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_8)
  %trunc_ln131 = trunc i32 %A_12 to i27, !bitwidth !435
  %lshr_ln3 = call i5 @_ssdm_op_PartSelect.i5.i32.i32.i32(i32 %A_12, i32 27, i32 31), !bitwidth !284
  %W_addr_9 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln129, !bitwidth !60
  %W_load_7 = load i32, i32* %W_addr_9, align 4, !bitwidth !11, !dep_idx !610, !deps !437
  %xor_ln131 = xor i32 %B_5_load_1, %D_16, !bitwidth !11
  %xor_ln131_1 = xor i32 %xor_ln131, %C_13, !bitwidth !11
  %or_ln1 = call i32 @_ssdm_op_BitConcatenate.i32.i27.i5(i27 %trunc_ln131, i5 %lshr_ln3), !bitwidth !11
  %add_ln131 = add i32 %W_load_7, %or_ln1, !bitwidth !11
  %add_ln131_1 = add i32 %xor_ln131_1, -899497514, !bitwidth !11
  %add_ln131_2 = add i32 %add_ln131_1, %E_7_load_1, !bitwidth !11
  %temp = add i32 %add_ln131_2, %add_ln131, !bitwidth !11
  %trunc_ln131_1 = trunc i32 %B_5_load_1 to i2, !bitwidth !439
  %lshr_ln131_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %B_5_load_1, i32 2, i32 31), !bitwidth !440
  %C_8 = call i32 @_ssdm_op_BitConcatenate.i32.i2.i30(i2 %trunc_ln131_1, i30 %lshr_ln131_1), !bitwidth !11
  %add_ln129 = add nuw i7 %i_11, 1, !bitwidth !189
  store i32 %temp, i32* %B_7, align 4, !bitwidth !210, !dep_idx !611, !deps !612
  store i32 %C_8, i32* %D_8, align 4, !bitwidth !210, !dep_idx !615, !deps !616
  store i32 %C_13, i32* %E_9, align 4, !bitwidth !210, !dep_idx !619, !deps !620
  store i7 %add_ln129, i7* %i_5, align 1, !bitwidth !210, !dep_idx !623, !deps !624
  store i32 %A_12, i32* %B_5, align 4, !bitwidth !210, !dep_idx !627, !deps !628
  store i32 %D_16, i32* %E_7, align 4, !bitwidth !210, !dep_idx !631, !deps !632
  br label %for.inc107, !llvm.loop !595, !bitwidth !210

for.end109:                                       ; preds = %for.inc107
  %E_7_load = load i32, i32* %E_7, align 4, !bitwidth !11, !dep_idx !635, !deps !636
  %B_5_load = load i32, i32* %B_5, align 4, !bitwidth !11, !dep_idx !638, !deps !639
  %add_ln135 = add i32 %A, %A_12, !bitwidth !11
  store i32 %add_ln135, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512, !bitwidth !210, !dep_idx !641, !deps !642
  %add_ln136 = add i32 %B, %B_5_load, !bitwidth !11
  store i32 %add_ln136, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4, !bitwidth !210, !dep_idx !644, !deps !645
  %add_ln137 = add i32 %C, %C_13, !bitwidth !11
  store i32 %add_ln137, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8, !bitwidth !210, !dep_idx !647, !deps !648
  %add_ln138 = add i32 %D, %D_16, !bitwidth !11
  store i32 %add_ln138, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4, !bitwidth !210, !dep_idx !650, !deps !651
  %add_ln139 = add i32 %E, %E_7_load, !bitwidth !11
  store i32 %add_ln139, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16, !bitwidth !210, !dep_idx !653, !deps !654
  ret void, !bitwidth !210
}

; Function Attrs: nounwind
define internal void @sha_stream_Pipeline_sha_stream_label2([5 x i32]* %outdata) #2 {
newFuncRoot:
  %i_7 = alloca i3, align 1, !bitwidth !656
  call void (...) @_ssdm_op_SpecInterface([5 x i32]* %outdata, [10 x i8]* @empty_3, i32 0, i32 0, [1 x i8]* @empty_7, i32 -1, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 -1, i32 0)
  store i3 0, i3* %i_7, align 1, !bitwidth !210, !dep_idx !657, !deps !658
  br label %for.inc31, !bitwidth !210

for.end33.exitStub:                               ; preds = %for.inc31
  ret void, !bitwidth !210

for.inc31:                                        ; preds = %for.inc31.split, %newFuncRoot
  %i = load i3, i3* %i_7, align 1, !bitwidth !215, !dep_idx !661, !deps !662
  %icmp_ln225 = icmp eq i3 %i, -3, !bitwidth !9
  %add_ln225 = add nuw i3 %i, 1, !bitwidth !215
  br i1 %icmp_ln225, label %for.end33.exitStub, label %for.inc31.split, !llvm.loop !665, !bitwidth !210

for.inc31.split:                                  ; preds = %for.inc31
  %zext_ln225 = zext i3 %i to i64, !bitwidth !305
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_7)
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 5, i64 5, i64 5), !fpga.pragma.source !202
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @empty_6)
  %sha_info_digest_addr = getelementptr inbounds [5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 %zext_ln225, !bitwidth !60
  %sha_info_digest_load = load i32, i32* %sha_info_digest_addr, align 4, !bitwidth !11
  %outdata_addr = getelementptr [5 x i32], [5 x i32]* %outdata, i64 0, i64 %zext_ln225, !bitwidth !60
  store i32 %sha_info_digest_load, i32* %outdata_addr, align 4, !bitwidth !210
  store i3 %add_ln225, i3* %i_7, align 1, !bitwidth !210, !dep_idx !685, !deps !686
  br label %for.inc31, !llvm.loop !665, !bitwidth !210
}

; Function Attrs: nounwind
define internal void @sha_stream_Pipeline_sha_stream_label1_VITIS_LOOP_207_1([16384 x i8]* %indata) #2 {
newFuncRoot:
  %j = alloca i14, align 2, !bitwidth !689
  %i = alloca i2, align 1, !bitwidth !690
  %indvar_flatten = alloca i15, align 2, !bitwidth !691
  call void (...) @_ssdm_op_SpecInterface([16384 x i8]* %indata, [10 x i8]* @empty_3, i32 0, i32 0, [1 x i8]* @empty_7, i32 -1, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 -1, i32 0)
  store i15 0, i15* %indvar_flatten, align 2, !bitwidth !210, !dep_idx !692, !deps !693
  store i2 0, i2* %i, align 1, !bitwidth !210, !dep_idx !696, !deps !697
  store i14 0, i14* %j, align 2, !bitwidth !210, !dep_idx !700, !deps !701
  br label %for.inc, !bitwidth !210

for.end12.exitStub:                               ; preds = %for.inc
  ret void, !bitwidth !210

for.inc:                                          ; preds = %for.inc10, %newFuncRoot
  %indvar_flatten_load = load i15, i15* %indvar_flatten, align 2, !bitwidth !704, !dep_idx !705, !deps !706
  %icmp_ln205 = icmp eq i15 %indvar_flatten_load, -16384, !bitwidth !9
  %add_ln205_1 = add i15 %indvar_flatten_load, 1, !bitwidth !704
  br i1 %icmp_ln205, label %for.end12.exitStub, label %for.inc10, !bitwidth !210

for.inc10:                                        ; preds = %for.inc
  %j_load = load i14, i14* %j, align 2, !bitwidth !196, !dep_idx !709, !deps !710
  %i_load = load i2, i2* %i, align 1, !bitwidth !439, !dep_idx !713, !deps !714
  %add_ln205 = add nuw i2 %i_load, 1, !bitwidth !439
  call void (...) @_ssdm_op_SpecLoopName([35 x i8]* @sha_stream_label1_VITIS_LOOP_207_1_str)
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 16384, i64 16384, i64 16384)
  %icmp_ln207 = icmp eq i14 %j_load, -8192, !bitwidth !9
  %select_ln201 = select i1 %icmp_ln207, i14 0, i14 %j_load, !bitwidth !196
  %select_ln205 = select i1 %icmp_ln207, i2 %add_ln205, i2 %i_load, !bitwidth !439
  %trunc_ln209 = trunc i2 %select_ln205 to i1, !bitwidth !9
  %tmp = call i14 @_ssdm_op_BitConcatenate.i14.i1.i13(i1 %trunc_ln209, i13 0), !bitwidth !196
  %add_ln209 = add i14 %tmp, %select_ln201, !bitwidth !196
  %zext_ln209 = zext i14 %add_ln209 to i64, !bitwidth !305
  %local_indata_addr = getelementptr [16384 x i8], [16384 x i8]* @local_indata, i64 0, i64 %zext_ln209, !bitwidth !7
  %indata_addr = getelementptr [16384 x i8], [16384 x i8]* %indata, i64 0, i64 %zext_ln209, !bitwidth !7
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_7)
  %indata_load = load i8, i8* %indata_addr, align 1, !bitwidth !274
  store i8 %indata_load, i8* %local_indata_addr, align 1, !bitwidth !210
  %add_ln207 = add nuw i14 %select_ln201, 1, !bitwidth !196
  store i15 %add_ln205_1, i15* %indvar_flatten, align 2, !bitwidth !210, !dep_idx !717, !deps !718
  store i2 %select_ln205, i2* %i, align 1, !bitwidth !210, !dep_idx !721, !deps !722
  store i14 %add_ln207, i14* %j, align 2, !bitwidth !210, !dep_idx !725, !deps !726
  br label %for.inc, !llvm.loop !729, !bitwidth !210
}

; Function Attrs: nounwind
define void @sha_stream([16384 x i8]* noalias %indata, [2 x i32]* noalias %in_i, [5 x i32]* noalias %outdata) #2 {
entry:
  %j = alloca i2, align 1, !bitwidth !690
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_7), !fpga.pragma.source !202
  call void (...) @_ssdm_op_SpecTopModule([11 x i8]* @empty_5), !fpga.pragma.source !202
  call void (...) @_ssdm_op_SpecInterface([16384 x i8]* %indata, [10 x i8]* @empty_3, i32 0, i32 0, [1 x i8]* @empty_7, i32 -1, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([16384 x i8]* %indata), !map !739
  call void (...) @_ssdm_op_SpecInterface([2 x i32]* %in_i, [10 x i8]* @empty_3, i32 0, i32 0, [1 x i8]* @empty_7, i32 -1, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([2 x i32]* %in_i), !map !739
  call void (...) @_ssdm_op_SpecInterface([5 x i32]* %outdata, [10 x i8]* @empty_3, i32 0, i32 0, [1 x i8]* @empty_7, i32 -1, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([5 x i32]* %outdata), !map !739
  call void @sha_stream_Pipeline_sha_stream_label1_VITIS_LOOP_207_1([16384 x i8]* %indata), !bitwidth !210, !dep_idx !740, !deps !741
  store i32 1732584193, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512, !bitwidth !210, !dep_idx !743, !deps !744
  store i32 -271733879, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4, !bitwidth !210, !dep_idx !750, !deps !744
  store i32 -1732584194, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8, !bitwidth !210, !dep_idx !751, !deps !744
  store i32 271733878, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4, !bitwidth !210, !dep_idx !752, !deps !744
  store i32 -1009589776, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16, !bitwidth !210, !dep_idx !753, !deps !744
  store i32 0, i32* @sha_info_count_lo, align 512, !bitwidth !210, !dep_idx !754, !deps !755
  store i32 0, i32* @sha_info_count_hi, align 512, !bitwidth !210, !dep_idx !757, !deps !758
  store i2 0, i2* %j, align 1, !bitwidth !210, !dep_idx !760, !deps !761
  br label %for.inc21, !bitwidth !210

for.inc21:                                        ; preds = %for.inc21.split, %entry
  %j_1 = load i2, i2* %j, align 1, !bitwidth !439, !dep_idx !764, !deps !765
  %icmp_ln216 = icmp eq i2 %j_1, -2, !bitwidth !9
  %add_ln216 = add nuw i2 %j_1, 1, !bitwidth !439
  br i1 %icmp_ln216, label %for.end23, label %for.inc21.split, !llvm.loop !768, !bitwidth !210

for.inc21.split:                                  ; preds = %for.inc21
  %zext_ln216 = zext i2 %j_1 to i64, !bitwidth !305
  %trunc_ln216 = trunc i2 %j_1 to i1, !bitwidth !9
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 2, i64 2, i64 2), !fpga.pragma.source !202
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @empty_9)
  %in_i_addr = getelementptr [2 x i32], [2 x i32]* %in_i, i64 0, i64 %zext_ln216, !bitwidth !60
  %i = load i32, i32* %in_i_addr, align 4, !bitwidth !11
  call fastcc void @sha_update([16384 x i8]* @local_indata, i1 %trunc_ln216, i32 %i) #2, !bitwidth !210, !dep_idx !248, !deps !775
  store i2 %add_ln216, i2* %j, align 1, !bitwidth !210, !dep_idx !793, !deps !794
  br label %for.inc21, !llvm.loop !768, !bitwidth !210

for.end23:                                        ; preds = %for.inc21
  %lo_bit_count = load i32, i32* @sha_info_count_lo, align 512, !bitwidth !11, !dep_idx !797, !deps !798
  %hi_bit_count = load i32, i32* @sha_info_count_hi, align 512, !bitwidth !11, !dep_idx !800, !deps !801
  %count = call i6 @_ssdm_op_PartSelect.i6.i32.i32.i32(i32 %lo_bit_count, i32 3, i32 8), !bitwidth !273
  %zext_ln174 = zext i6 %count to i7, !bitwidth !803
  %count_1 = add nuw i7 %zext_ln174, 1, !bitwidth !803
  %trunc_ln174 = trunc i7 %count_1 to i4, !bitwidth !178
  %zext_ln179 = zext i6 %count to i64, !bitwidth !305
  %sha_info_data_addr = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext_ln179, !bitwidth !60
  store i32 128, i32* %sha_info_data_addr, align 4, !bitwidth !210, !dep_idx !804, !deps !805
  %icmp_ln181 = icmp ugt i7 %count_1, 56, !bitwidth !9
  br i1 %icmp_ln181, label %if.then.i, label %if.else.i, !bitwidth !210

if.then.i:                                        ; preds = %for.end23
  %xor_ln182 = xor i6 %count, -1, !bitwidth !273
  %zext_ln182 = zext i6 %xor_ln182 to i7, !bitwidth !803
  call fastcc void @local_memset(i7 %zext_ln182, i4 %trunc_ln174), !bitwidth !210, !dep_idx !813, !deps !814
  call fastcc void @sha_transform(), !bitwidth !210, !dep_idx !816, !deps !817
  call fastcc void @local_memset(i7 56, i4 0), !bitwidth !210, !dep_idx !824, !deps !825
  br label %sha_final.exit, !bitwidth !210

if.else.i:                                        ; preds = %for.end23
  %sub_ln186 = sub nsw i7 55, %zext_ln174, !bitwidth !62
  call fastcc void @local_memset(i7 %sub_ln186, i4 %trunc_ln174), !bitwidth !210, !dep_idx !826, !deps !827
  br label %sha_final.exit, !bitwidth !210

sha_final.exit:                                   ; preds = %if.else.i, %if.then.i
  store i32 %hi_bit_count, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 14), align 8, !bitwidth !210, !dep_idx !828, !deps !829
  store i32 %lo_bit_count, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 15), align 4, !bitwidth !210, !dep_idx !830, !deps !829
  call fastcc void @sha_transform(), !bitwidth !210, !dep_idx !831, !deps !832
  call void @sha_stream_Pipeline_sha_stream_label2([5 x i32]* %outdata), !bitwidth !210, !dep_idx !833, !deps !834
  ret void, !bitwidth !210
}

; Function Attrs: nounwind
define internal void @local_memset_Pipeline_local_memset_label1(i31 %m, i4 %empty) #2 {
newFuncRoot:
  %idx = alloca i30, align 4, !bitwidth !840
  %tmp = call i4 @_ssdm_op_Read.ap_auto.i4(i4 %empty) #2, !bitwidth !178
  %m_read = call i31 @_ssdm_op_Read.ap_auto.i31(i31 %m) #2, !bitwidth !176
  store i30 0, i30* %idx, align 4, !bitwidth !210, !dep_idx !841, !deps !842
  br label %while.body4, !bitwidth !210

while.end6.loopexit.exitStub:                     ; preds = %while.body4
  ret void, !bitwidth !210

while.body4:                                      ; preds = %while.body4.split, %newFuncRoot
  %idx_load = load i30, i30* %idx, align 4, !bitwidth !440, !dep_idx !845, !deps !846
  %zext_ln65 = zext i30 %idx_load to i31, !bitwidth !849
  %icmp_ln65 = icmp slt i31 %zext_ln65, %m_read, !bitwidth !9
  %add_ln65 = add nuw i30 %idx_load, 1, !bitwidth !440
  br i1 %icmp_ln65, label %while.body4.split, label %while.end6.loopexit.exitStub, !llvm.loop !850, !bitwidth !210

while.body4.split:                                ; preds = %while.body4
  %trunc_ln65 = trunc i30 %idx_load to i4, !bitwidth !178
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_7)
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 0, i64 16, i64 8), !fpga.pragma.source !202
  call void (...) @_ssdm_op_SpecLoopName([20 x i8]* @empty_12)
  %add_ln57 = add i4 %trunc_ln65, %tmp, !bitwidth !178
  %zext_ln57 = zext i4 %add_ln57 to i64, !bitwidth !305
  %p = getelementptr [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext_ln57, !bitwidth !60
  store i32 0, i32* %p, align 4, !bitwidth !210
  store i30 %add_ln65, i30* %idx, align 4, !bitwidth !210, !dep_idx !860, !deps !861
  br label %while.body4, !llvm.loop !850, !bitwidth !210
}

; Function Attrs: noinline nounwind
define internal fastcc void @local_memset(i7 %n, i4 %e) #1 {
entry_ifconv:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_7)
  %e_read = call i4 @_ssdm_op_Read.ap_auto.i4(i4 %e) #2, !bitwidth !178
  %n_read = call i7 @_ssdm_op_Read.ap_auto.i7(i7 %n) #2, !bitwidth !189
  %tmp = call i1 @_ssdm_op_BitSelect.i1.i7.i32(i7 %n_read, i32 6), !bitwidth !9
  %sub_ln58 = sub i7 0, %n_read, !bitwidth !189
  %trunc_ln58_1 = call i5 @_ssdm_op_PartSelect.i5.i7.i32.i32(i7 %sub_ln58, i32 2, i32 6), !bitwidth !284
  %sext_ln58 = sext i5 %trunc_ln58_1 to i30, !bitwidth !864
  %zext_ln58 = zext i30 %sext_ln58 to i31, !bitwidth !849
  %sub_ln58_1 = sub i31 0, %zext_ln58, !bitwidth !865
  %trunc_ln58_2 = call i5 @_ssdm_op_PartSelect.i5.i7.i32.i32(i7 %n_read, i32 2, i32 6), !bitwidth !284
  %sext_ln58_1 = sext i5 %trunc_ln58_2 to i30, !bitwidth !864
  %zext_ln58_1 = zext i30 %sext_ln58_1 to i31, !bitwidth !849
  %m = select i1 %tmp, i31 %sub_ln58_1, i31 %zext_ln58_1, !bitwidth !176
  call void @local_memset_Pipeline_local_memset_label1(i31 %m, i4 %e_read), !bitwidth !210
  ret void, !bitwidth !210
}

; Function Attrs: noinline
define internal fastcc void @local_memcpy([16384 x i8]* noalias nocapture align 512 %s2, i1 %s2_offset, i32 %n, i14 %idx1) #0 {
entry:
  %idx9 = alloca i5, align 1, !bitwidth !279
  %idx = alloca i32, align 4, !bitwidth !17
  %idx1_read = call i14 @_ssdm_op_Read.ap_auto.i14(i14 %idx1), !bitwidth !196
  %n_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %n), !bitwidth !11
  %s2_offset_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %s2_offset), !bitwidth !9
  %tmp_9 = call i14 @_ssdm_op_BitConcatenate.i14.i1.i13(i1 %s2_offset_read, i13 0), !bitwidth !196
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_7)
  %tmp_3 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %n_read, i32 31), !bitwidth !9
  %sub_ln76 = sub i32 0, %n_read, !bitwidth !11
  %tmp_s = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %sub_ln76, i32 2, i32 31), !bitwidth !440
  %zext_ln76 = zext i30 %tmp_s to i31, !bitwidth !849
  %sub_ln76_1 = sub i31 0, %zext_ln76, !bitwidth !865
  %tmp_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %n_read, i32 2, i32 31), !bitwidth !440
  %zext_ln76_1 = zext i30 %tmp_1 to i31, !bitwidth !849
  %m = select i1 %tmp_3, i31 %sub_ln76_1, i31 %zext_ln76_1, !bitwidth !176
  store i32 0, i32* %idx, align 4, !bitwidth !210, !dep_idx !866, !deps !867
  store i5 0, i5* %idx9, align 1, !bitwidth !210, !dep_idx !870, !deps !871
  br label %while.body, !bitwidth !210

while.body:                                       ; preds = %while.body.split, %entry
  %idx9_load = load i5, i5* %idx9, align 1, !bitwidth !284, !dep_idx !874, !deps !875
  %zext_ln79_1 = zext i5 %idx9_load to i31, !bitwidth !849
  %icmp_ln79 = icmp slt i31 %zext_ln79_1, %m, !bitwidth !9
  %add_ln79_1 = add nuw i5 %idx9_load, 1, !bitwidth !284
  br i1 %icmp_ln79, label %while.body.split, label %while.end.loopexit, !llvm.loop !878, !bitwidth !210

while.body.split:                                 ; preds = %while.body
  %idx_load = load i32, i32* %idx, align 4, !bitwidth !11, !dep_idx !887, !deps !888
  %zext_ln79 = zext i5 %idx9_load to i64, !bitwidth !305
  %trunc_ln79 = trunc i32 %idx_load to i14, !bitwidth !196
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 0, i64 16, i64 8), !fpga.pragma.source !202
  call void (...) @_ssdm_op_SpecLoopName([20 x i8]* @empty_10)
  %p1 = getelementptr [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext_ln79, !bitwidth !60
  %add_ln73 = add i14 %trunc_ln79, %idx1_read, !bitwidth !196
  %add_ln73_1 = add i14 %tmp_9, %add_ln73, !bitwidth !196
  %zext_ln73 = zext i14 %add_ln73_1 to i64, !bitwidth !305
  %p2 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %zext_ln73, !bitwidth !7
  %add_ln82 = add i14 %add_ln73, 1, !bitwidth !196
  %add_ln82_1 = add i14 %tmp_9, %add_ln82, !bitwidth !196
  %zext_ln82 = zext i14 %add_ln82_1 to i64, !bitwidth !305
  %p2_1 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %zext_ln82, !bitwidth !7
  %p2_load = load i8, i8* %p2, align 1, !bitwidth !274
  %add_ln83 = add i14 %add_ln73, 2, !bitwidth !196
  %add_ln83_1 = add i14 %tmp_9, %add_ln83, !bitwidth !196
  %zext_ln83 = zext i14 %add_ln83_1 to i64, !bitwidth !305
  %p2_2 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %zext_ln83, !bitwidth !7
  %p2_1_load = load i8, i8* %p2_1, align 1, !bitwidth !274
  %add_ln84 = add i14 %add_ln73, 3, !bitwidth !196
  %add_ln84_1 = add i14 %tmp_9, %add_ln84, !bitwidth !196
  %zext_ln84 = zext i14 %add_ln84_1 to i64, !bitwidth !305
  %p2_3 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %zext_ln84, !bitwidth !7
  %p2_2_load = load i8, i8* %p2_2, align 1, !bitwidth !274
  %p2_3_load = load i8, i8* %p2_3, align 1, !bitwidth !274
  %tmp = call i32 @_ssdm_op_BitConcatenate.i32.i8.i8.i8.i8(i8 %p2_3_load, i8 %p2_2_load, i8 %p2_1_load, i8 %p2_load), !bitwidth !11
  store i32 %tmp, i32* %p1, align 4, !bitwidth !210
  %add_ln79 = add nuw i32 %idx_load, 4, !bitwidth !11
  store i32 %add_ln79, i32* %idx, align 4, !bitwidth !210, !dep_idx !891, !deps !892
  store i5 %add_ln79_1, i5* %idx9, align 1, !bitwidth !210, !dep_idx !895, !deps !896
  br label %while.body, !llvm.loop !878, !bitwidth !210

while.end.loopexit:                               ; preds = %while.body
  ret void, !bitwidth !210
}

; Function Attrs: nounwind readnone
declare i7 @llvm.part.select.i7(i7, i32, i32) #3

; Function Attrs: nounwind readnone
declare i32 @llvm.part.select.i32(i32, i32, i32) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, i64, metadata) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
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
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!blackbox_cfg = !{!1}
!llvm.module.flags = !{!2, !3}
!llvm.map.gv = !{}
!bitwidth_g = !{!4, !45, !107, !119, !138, !173, !186, !193}

!0 = !{!"clang version 7.0.0 "}
!1 = !{}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"reflow.full.lowering", i32 1}
!4 = !{void ([16384 x i8]*, i1, i32)* @sha_update, !5}
!5 = !{!6, !8, !10, !12, !14, !15, !16, !18, !20, !21, !23, !24, !26, !28, !30, !32, !34, !35, !37, !39, !41, !43}
!6 = !{!"Arg", i32 0, !7}
!7 = !{i32 0, i32 0, i32 8, i32 2}
!8 = !{!"Arg", i32 1, !9}
!9 = !{i32 1, i32 1, i32 0, i32 2}
!10 = !{!"Arg", i32 2, !11}
!11 = !{i32 32, i32 32, i32 0, i32 2}
!12 = !{i32 1, !13}
!13 = !{i32 1, i32 32, i32 0, i32 0}
!14 = !{i32 0, !13}
!15 = !{[1 x i8]* @empty_7, !7}
!16 = !{i32* @sha_info_count_lo, !17}
!17 = !{i32 0, i32 0, i32 32, i32 1}
!18 = !{i32 3, !19}
!19 = !{i32 3, i32 32, i32 0, i32 1}
!20 = !{i32* @sha_info_count_hi, !17}
!21 = !{i32 29, !22}
!22 = !{i32 6, i32 32, i32 0, i32 1}
!23 = !{i32 31, !22}
!24 = !{i32 6, !25}
!25 = !{i32 4, i32 32, i32 0, i32 1}
!26 = !{i26 0, !27}
!27 = !{i32 1, i32 26, i32 0, i32 0}
!28 = !{i64 0, !29}
!29 = !{i32 1, i32 64, i32 0, i32 0}
!30 = !{i64 128, !31}
!31 = !{i32 9, i32 64, i32 0, i32 1}
!32 = !{i64 64, !33}
!33 = !{i32 8, i32 64, i32 0, i32 1}
!34 = !{[18 x i8]* @empty_11, !7}
!35 = !{i32 64, !36}
!36 = !{i32 8, i32 32, i32 0, i32 1}
!37 = !{i32 -64, !38}
!38 = !{i32 7, i32 32, i32 0, i32 1}
!39 = !{i32 13, !40}
!40 = !{i32 5, i32 32, i32 0, i32 1}
!41 = !{i6 0, !42}
!42 = !{i32 1, i32 6, i32 0, i32 0}
!43 = !{i14 0, !44}
!44 = !{i32 1, i32 14, i32 0, i32 0}
!45 = !{void ()* @sha_transform, !46}
!46 = !{!12, !14, !15, !47, !49, !51, !53, !54, !56, !58, !59, !28, !61, !32, !63, !64, !66, !68, !70, !71, !73, !74, !75, !76, !78, !79, !80, !81, !83, !84, !85, !87, !88, !89, !23, !90, !92, !94, !95, !96, !97, !98, !99, !101, !102, !103, !104, !105}
!47 = !{i64 1, !48}
!48 = !{i32 2, i32 64, i32 0, i32 0}
!49 = !{i5 0, !50}
!50 = !{i32 1, i32 5, i32 0, i32 0}
!51 = !{i5 -16, !52}
!52 = !{i32 5, i32 5, i32 0, i32 1}
!53 = !{i5 1, !50}
!54 = !{i7 16, !55}
!55 = !{i32 6, i32 7, i32 0, i32 1}
!56 = !{i64 16, !57}
!57 = !{i32 6, i32 64, i32 0, i32 1}
!58 = !{[21 x i8]* @empty_4, !7}
!59 = !{[16 x i32]* @sha_info_data, !60}
!60 = !{i32 0, i32 0, i32 32, i32 2}
!61 = !{i7 -48, !62}
!62 = !{i32 7, i32 7, i32 0, i32 1}
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
!73 = !{[5 x i32]* @sha_info_digest, !60}
!74 = !{i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), !60}
!75 = !{i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), !60}
!76 = !{i64 2, !77}
!77 = !{i32 3, i32 64, i32 0, i32 0}
!78 = !{i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), !60}
!79 = !{i64 3, !77}
!80 = !{i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), !60}
!81 = !{i64 4, !82}
!82 = !{i32 4, i32 64, i32 0, i32 0}
!83 = !{i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), !60}
!84 = !{i5 -12, !52}
!85 = !{i6 20, !86}
!86 = !{i32 6, i32 6, i32 0, i32 1}
!87 = !{i64 20, !57}
!88 = !{[21 x i8]* @empty_1, !7}
!89 = !{i32 27, !22}
!90 = !{i32 -1, !91}
!91 = !{i32 1, i32 32, i32 0, i32 1}
!92 = !{i32 1518500249, !93}
!93 = !{i32 32, i32 32, i32 0, i32 1}
!94 = !{i32 2, !19}
!95 = !{i6 -24, !86}
!96 = !{[21 x i8]* @empty_2, !7}
!97 = !{i32 1859775393, !93}
!98 = !{i6 1, !42}
!99 = !{i6 -4, !100}
!100 = !{i32 3, i32 6, i32 0, i32 1}
!101 = !{i7 60, !62}
!102 = !{[21 x i8]* @empty, !7}
!103 = !{i32 -1894007588, !93}
!104 = !{[21 x i8]* @empty_8, !7}
!105 = !{i32 -899497514, !106}
!106 = !{i32 31, i32 32, i32 0, i32 1}
!107 = !{void ([5 x i32]*)* @sha_stream_Pipeline_sha_stream_label2, !108}
!108 = !{!109, !12, !110, !14, !15, !90, !111, !113, !115, !116, !118, !73, !28}
!109 = !{!"Arg", i32 0, !60}
!110 = !{[10 x i8]* @empty_3, !7}
!111 = !{i3 0, !112}
!112 = !{i32 1, i32 3, i32 0, i32 0}
!113 = !{i3 -3, !114}
!114 = !{i32 3, i32 3, i32 0, i32 1}
!115 = !{i3 1, !112}
!116 = !{i64 5, !117}
!117 = !{i32 4, i32 64, i32 0, i32 1}
!118 = !{[18 x i8]* @empty_6, !7}
!119 = !{void ([16384 x i8]*)* @sha_stream_Pipeline_sha_stream_label1_VITIS_LOOP_207_1, !120}
!120 = !{!6, !12, !110, !14, !15, !90, !121, !123, !43, !125, !127, !128, !129, !130, !132, !134, !136, !28, !137, !6, !6}
!121 = !{i15 0, !122}
!122 = !{i32 1, i32 15, i32 0, i32 0}
!123 = !{i2 0, !124}
!124 = !{i32 1, i32 2, i32 0, i32 0}
!125 = !{i15 -16384, !126}
!126 = !{i32 15, i32 15, i32 0, i32 1}
!127 = !{i15 1, !122}
!128 = !{i2 1, !124}
!129 = !{[35 x i8]* @sha_stream_label1_VITIS_LOOP_207_1_str, !7}
!130 = !{i64 16384, !131}
!131 = !{i32 16, i32 64, i32 0, i32 1}
!132 = !{i14 -8192, !133}
!133 = !{i32 14, i32 14, i32 0, i32 1}
!134 = !{i13 0, !135}
!135 = !{i32 1, i32 13, i32 0, i32 0}
!136 = !{[16384 x i8]* @local_indata, !7}
!137 = !{i14 1, !44}
!138 = !{void ([16384 x i8]*, [2 x i32]*, [5 x i32]*)* @sha_stream, !139}
!139 = !{!6, !140, !141, !12, !14, !15, !142, !110, !90, !143, !144, !28, !74, !145, !47, !75, !147, !148, !78, !150, !79, !80, !151, !81, !83, !152, !154, !123, !155, !128, !157, !136, !18, !158, !71, !159, !160, !162, !163, !165, !167, !168, !170, !171, !172}
!140 = !{!"Arg", i32 1, !60}
!141 = !{!"Arg", i32 2, !60}
!142 = !{[11 x i8]* @empty_5, !7}
!143 = !{i32 1732584193, !93}
!144 = !{[5 x i32]* @sha_info_digest, !17}
!145 = !{i32 -271733879, !146}
!146 = !{i32 30, i32 32, i32 0, i32 1}
!147 = !{i32 -1732584194, !93}
!148 = !{i64 2, !149}
!149 = !{i32 3, i32 64, i32 0, i32 1}
!150 = !{i32 271733878, !146}
!151 = !{i32 -1009589776, !106}
!152 = !{i32* @sha_info_count_lo, !153}
!153 = !{i32 0, i32 0, i32 32, i32 0}
!154 = !{i32* @sha_info_count_hi, !153}
!155 = !{i2 -2, !156}
!156 = !{i32 2, i32 2, i32 0, i32 1}
!157 = !{[18 x i8]* @empty_9, !7}
!158 = !{i32 8, !40}
!159 = !{[16 x i32]* @sha_info_data, !17}
!160 = !{i32 128, !161}
!161 = !{i32 9, i32 32, i32 0, i32 1}
!162 = !{i7 56, !62}
!163 = !{i6 -1, !164}
!164 = !{i32 1, i32 6, i32 0, i32 1}
!165 = !{i4 0, !166}
!166 = !{i32 1, i32 4, i32 0, i32 0}
!167 = !{i7 55, !62}
!168 = !{i64 14, !169}
!169 = !{i32 5, i32 64, i32 0, i32 0}
!170 = !{i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 14), !60}
!171 = !{i64 15, !169}
!172 = !{i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 15), !60}
!173 = !{void (i31, i4)* @local_memset_Pipeline_local_memset_label1, !174}
!174 = !{!175, !177, !12, !179, !181, !90, !14, !15, !28, !56, !182, !184, !185}
!175 = !{!"Arg", i32 0, !176}
!176 = !{i32 31, i32 31, i32 0, i32 2}
!177 = !{!"Arg", i32 1, !178}
!178 = !{i32 4, i32 4, i32 0, i32 2}
!179 = !{i30 0, !180}
!180 = !{i32 1, i32 30, i32 0, i32 0}
!181 = !{i30 1, !180}
!182 = !{i64 8, !183}
!183 = !{i32 5, i32 64, i32 0, i32 1}
!184 = !{[20 x i8]* @empty_12, !7}
!185 = !{[16 x i32]* @sha_info_data, !153}
!186 = !{void (i7, i4)* @local_memset, !187}
!187 = !{!188, !177, !14, !12, !15, !24, !190, !94, !191}
!188 = !{!"Arg", i32 0, !189}
!189 = !{i32 7, i32 7, i32 0, i32 2}
!190 = !{i7 0, !72}
!191 = !{i31 0, !192}
!192 = !{i32 1, i32 31, i32 0, i32 0}
!193 = !{void ([16384 x i8]*, i1, i32, i14)* @local_memcpy, !194}
!194 = !{!6, !8, !10, !195, !12, !134, !14, !15, !23, !94, !191, !49, !53, !28, !56, !182, !197, !159, !137, !198, !200, !201}
!195 = !{!"Arg", i32 3, !196}
!196 = !{i32 14, i32 14, i32 0, i32 2}
!197 = !{[20 x i8]* @empty_10, !7}
!198 = !{i14 2, !199}
!199 = !{i32 3, i32 14, i32 0, i32 1}
!200 = !{i14 3, !199}
!201 = !{i32 4, !25}
!202 = !{!"user"}
!203 = !{i32 37}
!204 = !{!205}
!205 = !{i32 35, !206}
!206 = !{!"WAR", !"indep"}
!207 = !{i32 38}
!208 = !{!209}
!209 = !{i32 36, !206}
!210 = !{i32 0, i32 0, i32 0, i32 2}
!211 = !{i32 35}
!212 = !{!213}
!213 = !{i32 37, !214}
!214 = !{!"RAW", !"indep"}
!215 = !{i32 3, i32 3, i32 0, i32 2}
!216 = !{i32 32, i32 32, i32 0, i32 0}
!217 = !{i32 26, i32 26, i32 0, i32 2}
!218 = !{i32 36}
!219 = !{!220}
!220 = !{i32 38, !214}
!221 = !{i32 43}
!222 = !{!223, !224}
!223 = !{i32 39, !214}
!224 = !{i32 40, !225}
!225 = !{!"WAW", !"indep"}
!226 = !{i32 44}
!227 = !{!228, !229}
!228 = !{i32 41, !214}
!229 = !{i32 42, !225}
!230 = !{i32 39}
!231 = !{!232, !233}
!232 = !{i32 43, !206}
!233 = !{i32 40, !234}
!234 = !{!"WAR", !"indep", i32 1, !"*", i32 -1, i1 true}
!235 = distinct !{!235, !236, !249, !250}
!236 = !{i32 168, i32 5, !237, null}
!237 = !{i32 786443, !238, !239}
!238 = !{i32 786478, i32 0, !239, !"sha_update", !"sha_update", null, !239, i32 154, !240, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !247, i32 154}
!239 = !{i32 786473, !"data/benchmarks/sha/sha.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!240 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !241, i32 0, i32 0}
!241 = !{null, !242, !246}
!242 = !{i32 786447, null, !"", !243, i32 0, i64 64, i64 0, i32 0, i32 0, !244}
!243 = !{i32 786473, !"<unknown>", null, null}
!244 = !{i32 786470, null, !"", !243, i32 0, i64 0, i64 0, i32 0, i32 0, !245}
!245 = !{i32 786468, null, !"unsigned char", null, i32 0, i64 8, i64 0, i32 0, i32 0, i32 8}
!246 = !{i32 786468, null, !"int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 5}
!247 = !{!248}
!248 = !{i32 0}
!249 = !{!"llvm.loop.name", !"sha_update_label4"}
!250 = !{!"llvm.loop.tripcount", i32 0, i32 128, i32 64, !"user", !251}
!251 = !{i32 163, i32 9, !237, null}
!252 = !{i32 41}
!253 = !{!254, !255}
!254 = !{i32 44, !206}
!255 = !{i32 42, !234}
!256 = !{i32 47}
!257 = !{!258, !260}
!258 = !{i32 45, !259}
!259 = !{!"RAW", !"indep", i32 1, !"*", i32 -1, i1 true}
!260 = !{i32 46, !225}
!261 = !{i32 45}
!262 = !{!263, !264}
!263 = !{i32 47, !234}
!264 = !{i32 46, !206}
!265 = !{i32 40}
!266 = !{!267, !268}
!267 = !{i32 43, !225}
!268 = !{i32 39, !259}
!269 = !{i32 42}
!270 = !{!271, !272}
!271 = !{i32 44, !225}
!272 = !{i32 41, !259}
!273 = !{i32 6, i32 6, i32 0, i32 2}
!274 = !{i32 8, i32 8, i32 0, i32 2}
!275 = !{i32 46}
!276 = !{!277, !278}
!277 = !{i32 47, !225}
!278 = !{i32 45, !214}
!279 = !{i32 0, i32 0, i32 5, i32 1}
!280 = !{i32 59}
!281 = !{!282, !283}
!282 = !{i32 57, !214}
!283 = !{i32 58, !225}
!284 = !{i32 5, i32 5, i32 0, i32 2}
!285 = !{i32 57}
!286 = !{!287, !288}
!287 = !{i32 59, !206}
!288 = !{i32 58, !234}
!289 = distinct !{!289, !290, !296, !297}
!290 = !{i32 101, i32 5, !291, null}
!291 = !{i32 786443, !292, i32 98, i32 5, !239, i32 0}
!292 = !{i32 786443, !293, !239}
!293 = !{i32 786478, i32 0, !239, !"sha_transform", !"sha_transform", null, !239, i32 92, !294, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @sha_transform, null, null, !247, i32 92}
!294 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !295, i32 0, i32 0}
!295 = !{null}
!296 = !{!"llvm.loop.name", !"sha_transform_label1"}
!297 = !{!"llvm.loop.tripcount", i32 16, i32 16, i32 16, !"user", !298}
!298 = !{i32 99, i32 9, !299, null}
!299 = !{i32 786443, !291, !239}
!300 = !{i32 0, i32 0, i32 7, i32 1}
!301 = !{i32 71}
!302 = !{!303, !304}
!303 = !{i32 60, !214}
!304 = !{i32 61, !225}
!305 = !{i32 64, i32 64, i32 0, i32 0}
!306 = !{i32 85}
!307 = !{!308, !309, !310, !311, !312, !313, !314, !315, !316}
!308 = !{i32 62, !214}
!309 = !{i32 63, !214}
!310 = !{i32 64, !214}
!311 = !{i32 65, !214}
!312 = !{i32 66, !225}
!313 = !{i32 67, !214}
!314 = !{i32 68, !214}
!315 = !{i32 69, !214}
!316 = !{i32 70, !214}
!317 = !{i32 58}
!318 = !{!319, !320}
!319 = !{i32 59, !225}
!320 = !{i32 57, !259}
!321 = !{i32 60}
!322 = !{!323, !324}
!323 = !{i32 71, !206}
!324 = !{i32 61, !234}
!325 = distinct !{!325, !326, !328, !329}
!326 = !{i32 107, i32 5, !327, null}
!327 = !{i32 786443, !292, i32 104, i32 5, !239, i32 0}
!328 = !{!"llvm.loop.name", !"sha_transform_label2"}
!329 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !330}
!330 = !{i32 105, i32 9, !331, null}
!331 = !{i32 786443, !327, !239}
!332 = !{i32 62}
!333 = !{!334, !335}
!334 = !{i32 85, !206}
!335 = !{i32 66, !336}
!336 = !{!"WAR", i32 1, !">", i32 3, i1 true}
!337 = !{i32 63}
!338 = !{!334, !339}
!339 = !{i32 66, !340}
!340 = !{!"WAR", i32 1, !">", i32 8, i1 true}
!341 = !{i32 64}
!342 = !{!334, !343}
!343 = !{i32 66, !344}
!344 = !{!"WAR", i32 1, !">", i32 14, i1 true}
!345 = !{i32 65}
!346 = !{!334, !347}
!347 = !{i32 66, !348}
!348 = !{!"WAR", i32 1, !">", i32 16, i1 true}
!349 = !{i32 66}
!350 = !{!351, !352, !354, !356, !358, !313, !314, !315, !316}
!351 = !{i32 85, !225}
!352 = !{i32 62, !353}
!353 = !{!"RAW", i32 1, !"<", i32 3, i1 true}
!354 = !{i32 63, !355}
!355 = !{!"RAW", i32 1, !"<", i32 8, i1 true}
!356 = !{i32 64, !357}
!357 = !{!"RAW", i32 1, !"<", i32 14, i1 true}
!358 = !{i32 65, !359}
!359 = !{!"RAW", i32 1, !"<", i32 16, i1 true}
!360 = !{i32 61}
!361 = !{!362, !363}
!362 = !{i32 71, !225}
!363 = !{i32 60, !259}
!364 = !{i32 134}
!365 = !{!366}
!366 = !{i32 72, !206}
!367 = !{i32 135}
!368 = !{!369}
!369 = !{i32 73, !206}
!370 = !{i32 136}
!371 = !{!372}
!372 = !{i32 74, !206}
!373 = !{i32 137}
!374 = !{!375}
!375 = !{i32 75, !206}
!376 = !{i32 138}
!377 = !{!378}
!378 = !{i32 76, !206}
!379 = !{i32 89}
!380 = !{!381, !382}
!381 = !{i32 77, !214}
!382 = !{i32 78, !225}
!383 = !{i32 88}
!384 = !{!385, !386}
!385 = !{i32 79, !214}
!386 = !{i32 80, !225}
!387 = !{i32 87}
!388 = !{!389, !390}
!389 = !{i32 81, !214}
!390 = !{i32 82, !225}
!391 = !{i32 86}
!392 = !{!393, !394}
!393 = !{i32 83, !214}
!394 = !{i32 84, !225}
!395 = !{i32 83}
!396 = !{!397, !398}
!397 = !{i32 86, !206}
!398 = !{i32 84, !234}
!399 = !{i32 81}
!400 = !{!401, !402}
!401 = !{i32 87, !206}
!402 = !{i32 82, !234}
!403 = !{i32 79}
!404 = !{!405, !406}
!405 = !{i32 88, !206}
!406 = !{i32 80, !234}
!407 = !{i32 77}
!408 = !{!409, !410}
!409 = !{i32 89, !206}
!410 = !{i32 78, !234}
!411 = distinct !{!411, !412, !414, !415}
!412 = !{i32 120, i32 5, !413, null}
!413 = !{i32 786443, !292, i32 117, i32 27, !239, i32 0}
!414 = !{!"llvm.loop.name", !"sha_transform_label3"}
!415 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !416}
!416 = !{i32 118, i32 9, !417, null}
!417 = !{i32 786443, !413, !239}
!418 = !{i32 0, i32 0, i32 6, i32 1}
!419 = !{i32 101}
!420 = !{!421, !422}
!421 = !{i32 90, !214}
!422 = !{i32 91, !225}
!423 = !{i32 100}
!424 = !{!425, !426}
!425 = !{i32 92, !214}
!426 = !{i32 93, !225}
!427 = !{i32 99}
!428 = !{!429, !430}
!429 = !{i32 94, !214}
!430 = !{i32 95, !225}
!431 = !{i32 98}
!432 = !{!433, !434}
!433 = !{i32 96, !214}
!434 = !{i32 97, !225}
!435 = !{i32 27, i32 27, i32 0, i32 2}
!436 = !{i32 67}
!437 = !{!334, !438}
!438 = !{i32 66, !206}
!439 = !{i32 2, i32 2, i32 0, i32 2}
!440 = !{i32 30, i32 30, i32 0, i32 2}
!441 = !{i32 78}
!442 = !{!443, !444}
!443 = !{i32 89, !225}
!444 = !{i32 77, !259}
!445 = !{i32 80}
!446 = !{!447, !448}
!447 = !{i32 88, !225}
!448 = !{i32 79, !259}
!449 = !{i32 82}
!450 = !{!451, !452}
!451 = !{i32 87, !225}
!452 = !{i32 81, !259}
!453 = !{i32 84}
!454 = !{!455, !456}
!455 = !{i32 86, !225}
!456 = !{i32 83, !259}
!457 = !{i32 96}
!458 = !{!459, !460}
!459 = !{i32 98, !206}
!460 = !{i32 97, !234}
!461 = !{i32 94}
!462 = !{!463, !464}
!463 = !{i32 99, !206}
!464 = !{i32 95, !234}
!465 = !{i32 92}
!466 = !{!467, !468}
!467 = !{i32 100, !206}
!468 = !{i32 93, !234}
!469 = !{i32 90}
!470 = !{!471, !472}
!471 = !{i32 101, !206}
!472 = !{i32 91, !234}
!473 = distinct !{!473, !474, !476, !477}
!474 = !{i32 124, i32 5, !475, null}
!475 = !{i32 786443, !292, i32 121, i32 27, !239, i32 0}
!476 = !{!"llvm.loop.name", !"sha_transform_label4"}
!477 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !478}
!478 = !{i32 122, i32 9, !479, null}
!479 = !{i32 786443, !475, !239}
!480 = !{i32 113}
!481 = !{!482, !483}
!482 = !{i32 102, !214}
!483 = !{i32 103, !225}
!484 = !{i32 112}
!485 = !{!486, !487}
!486 = !{i32 104, !214}
!487 = !{i32 105, !225}
!488 = !{i32 111}
!489 = !{!490, !491}
!490 = !{i32 106, !214}
!491 = !{i32 107, !225}
!492 = !{i32 110}
!493 = !{!494, !495}
!494 = !{i32 108, !214}
!495 = !{i32 109, !225}
!496 = !{i32 68}
!497 = !{i32 91}
!498 = !{!499, !500}
!499 = !{i32 101, !225}
!500 = !{i32 90, !259}
!501 = !{i32 93}
!502 = !{!503, !504}
!503 = !{i32 100, !225}
!504 = !{i32 92, !259}
!505 = !{i32 95}
!506 = !{!507, !508}
!507 = !{i32 99, !225}
!508 = !{i32 94, !259}
!509 = !{i32 97}
!510 = !{!511, !512}
!511 = !{i32 98, !225}
!512 = !{i32 96, !259}
!513 = !{i32 108}
!514 = !{!515, !516}
!515 = !{i32 110, !206}
!516 = !{i32 109, !234}
!517 = !{i32 106}
!518 = !{!519, !520}
!519 = !{i32 111, !206}
!520 = !{i32 107, !234}
!521 = !{i32 104}
!522 = !{!523, !524}
!523 = !{i32 112, !206}
!524 = !{i32 105, !234}
!525 = !{i32 102}
!526 = !{!527, !528}
!527 = !{i32 113, !206}
!528 = !{i32 103, !234}
!529 = distinct !{!529, !530, !532, !533}
!530 = !{i32 128, i32 5, !531, null}
!531 = !{i32 786443, !292, i32 125, i32 27, !239, i32 0}
!532 = !{!"llvm.loop.name", !"sha_transform_label5"}
!533 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !534}
!534 = !{i32 126, i32 9, !535, null}
!535 = !{i32 786443, !531, !239}
!536 = !{i32 131}
!537 = !{!538, !539}
!538 = !{i32 114, !214}
!539 = !{i32 115, !225}
!540 = !{i32 130}
!541 = !{!542, !543}
!542 = !{i32 116, !214}
!543 = !{i32 117, !225}
!544 = !{i32 129}
!545 = !{!546, !547}
!546 = !{i32 118, !214}
!547 = !{i32 119, !225}
!548 = !{i32 128}
!549 = !{!550, !551}
!550 = !{i32 120, !214}
!551 = !{i32 121, !225}
!552 = !{i32 133}
!553 = !{!554, !555, !556}
!554 = !{i32 122, !214}
!555 = !{i32 123, !214}
!556 = !{i32 124, !225}
!557 = !{i32 132}
!558 = !{!559, !560, !561}
!559 = !{i32 125, !214}
!560 = !{i32 126, !214}
!561 = !{i32 127, !225}
!562 = !{i32 69}
!563 = !{i32 103}
!564 = !{!565, !566}
!565 = !{i32 113, !225}
!566 = !{i32 102, !259}
!567 = !{i32 105}
!568 = !{!569, !570}
!569 = !{i32 112, !225}
!570 = !{i32 104, !259}
!571 = !{i32 107}
!572 = !{!573, !574}
!573 = !{i32 111, !225}
!574 = !{i32 106, !259}
!575 = !{i32 109}
!576 = !{!577, !578}
!577 = !{i32 110, !225}
!578 = !{i32 108, !259}
!579 = !{i32 120}
!580 = !{!581, !582}
!581 = !{i32 128, !206}
!582 = !{i32 121, !234}
!583 = !{i32 118}
!584 = !{!585, !586}
!585 = !{i32 129, !206}
!586 = !{i32 119, !234}
!587 = !{i32 116}
!588 = !{!589, !590}
!589 = !{i32 130, !206}
!590 = !{i32 117, !234}
!591 = !{i32 114}
!592 = !{!593, !594}
!593 = !{i32 131, !206}
!594 = !{i32 115, !234}
!595 = distinct !{!595, !596, !598, !599}
!596 = !{i32 132, i32 5, !597, null}
!597 = !{i32 786443, !292, i32 129, i32 27, !239, i32 0}
!598 = !{!"llvm.loop.name", !"sha_transform_label6"}
!599 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !600}
!600 = !{i32 130, i32 9, !601, null}
!601 = !{i32 786443, !597, !239}
!602 = !{i32 126}
!603 = !{!604, !605}
!604 = !{i32 132, !206}
!605 = !{i32 127, !234}
!606 = !{i32 123}
!607 = !{!608, !609}
!608 = !{i32 133, !206}
!609 = !{i32 124, !234}
!610 = !{i32 70}
!611 = !{i32 115}
!612 = !{!613, !614}
!613 = !{i32 131, !225}
!614 = !{i32 114, !259}
!615 = !{i32 117}
!616 = !{!617, !618}
!617 = !{i32 130, !225}
!618 = !{i32 116, !259}
!619 = !{i32 119}
!620 = !{!621, !622}
!621 = !{i32 129, !225}
!622 = !{i32 118, !259}
!623 = !{i32 121}
!624 = !{!625, !626}
!625 = !{i32 128, !225}
!626 = !{i32 120, !259}
!627 = !{i32 124}
!628 = !{!629, !554, !630}
!629 = !{i32 133, !225}
!630 = !{i32 123, !259}
!631 = !{i32 127}
!632 = !{!633, !559, !634}
!633 = !{i32 132, !225}
!634 = !{i32 126, !259}
!635 = !{i32 125}
!636 = !{!604, !637}
!637 = !{i32 127, !206}
!638 = !{i32 122}
!639 = !{!608, !640}
!640 = !{i32 124, !206}
!641 = !{i32 72}
!642 = !{!643}
!643 = !{i32 134, !214}
!644 = !{i32 73}
!645 = !{!646}
!646 = !{i32 135, !214}
!647 = !{i32 74}
!648 = !{!649}
!649 = !{i32 136, !214}
!650 = !{i32 75}
!651 = !{!652}
!652 = !{i32 137, !214}
!653 = !{i32 76}
!654 = !{!655}
!655 = !{i32 138, !214}
!656 = !{i32 0, i32 0, i32 3, i32 1}
!657 = !{i32 34}
!658 = !{!659, !660}
!659 = !{i32 32, !214}
!660 = !{i32 33, !225}
!661 = !{i32 32}
!662 = !{!663, !664}
!663 = !{i32 34, !206}
!664 = !{i32 33, !234}
!665 = distinct !{!665, !666, !680, !681, !682, !684}
!666 = !{i32 225, i32 5, !667, null}
!667 = !{i32 786443, !668, i32 225, i32 5, !239, i32 0}
!668 = !{i32 786443, !669, !239}
!669 = !{i32 786478, i32 0, !239, !"sha_stream", !"sha_stream", null, !239, i32 196, !670, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !247, i32 200}
!670 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !671, i32 0, i32 0}
!671 = !{null, !672, !676, !678}
!672 = !{i32 786447, null, !"", !243, i32 0, i64 64, i64 0, i32 0, i32 0, !673}
!673 = !{i32 786433, null, !"", null, i32 0, i64 65536, i64 0, i32 0, i32 0, !244, !674, i32 0, null, null}
!674 = !{!675}
!675 = !{i32 786465, i64 0, i64 8191}
!676 = !{i32 786447, null, !"", !243, i32 0, i64 64, i64 0, i32 0, i32 0, !677}
!677 = !{i32 786470, null, !"", !243, i32 0, i64 0, i64 0, i32 0, i32 0, !246}
!678 = !{i32 786447, null, !"", !243, i32 0, i64 64, i64 0, i32 0, i32 0, !679}
!679 = !{i32 786468, null, !"unsigned int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 7}
!680 = !{i32 228, i32 5, !667, null}
!681 = !{!"llvm.loop.name", !"sha_stream_label2"}
!682 = !{!"llvm.loop.tripcount", i32 5, i32 5, i32 5, !"user", !683}
!683 = !{i32 226, i32 9, !667, null}
!684 = !{!"llvm.loop.pipeline.enable", i32 -1, i1 false, i8 -1, !"auto"}
!685 = !{i32 33}
!686 = !{!687, !688}
!687 = !{i32 34, !225}
!688 = !{i32 32, !259}
!689 = !{i32 0, i32 0, i32 14, i32 1}
!690 = !{i32 0, i32 0, i32 2, i32 1}
!691 = !{i32 0, i32 0, i32 15, i32 1}
!692 = !{i32 29}
!693 = !{!694, !695}
!694 = !{i32 23, !214}
!695 = !{i32 24, !225}
!696 = !{i32 31}
!697 = !{!698, !699}
!698 = !{i32 25, !214}
!699 = !{i32 26, !225}
!700 = !{i32 30}
!701 = !{!702, !703}
!702 = !{i32 27, !214}
!703 = !{i32 28, !225}
!704 = !{i32 15, i32 15, i32 0, i32 2}
!705 = !{i32 23}
!706 = !{!707, !708}
!707 = !{i32 29, !206}
!708 = !{i32 24, !234}
!709 = !{i32 27}
!710 = !{!711, !712}
!711 = !{i32 30, !206}
!712 = !{i32 28, !234}
!713 = !{i32 25}
!714 = !{!715, !716}
!715 = !{i32 31, !206}
!716 = !{i32 26, !234}
!717 = !{i32 24}
!718 = !{!719, !720}
!719 = !{i32 29, !225}
!720 = !{i32 23, !259}
!721 = !{i32 26}
!722 = !{!723, !724}
!723 = !{i32 31, !225}
!724 = !{i32 25, !259}
!725 = !{i32 28}
!726 = !{!727, !728}
!727 = !{i32 30, !225}
!728 = !{i32 27, !259}
!729 = distinct !{!729, !730, !735, !736, !737, !684}
!730 = !{i32 207, i32 20, !731, null}
!731 = !{i32 786443, !732, i32 207, i32 20, !239, i32 0}
!732 = !{i32 786443, !733, i32 205, i32 29, !239, i32 0}
!733 = !{i32 786443, !734, i32 205, i32 5, !239, i32 0}
!734 = !{i32 786443, !668, i32 205, i32 5, !239, i32 0}
!735 = !{i32 210, i32 9, !731, null}
!736 = !{!"llvm.loop.name", !"VITIS_LOOP_207_1"}
!737 = !{!"llvm.loop.tripcount", i32 8192, i32 8192, i32 8192, !"user", !738}
!738 = !{i32 208, i32 9, !731, null}
!739 = !{!1}
!740 = !{i32 16}
!741 = !{!742}
!742 = !{i32 0, !214}
!743 = !{i32 17}
!744 = !{!745, !747, !748, !749}
!745 = !{i32 0, !746}
!746 = !{!"Unknown", !"indep"}
!747 = !{i32 1, !746}
!748 = !{i32 2, !746}
!749 = !{i32 3, !214}
!750 = !{i32 18}
!751 = !{i32 19}
!752 = !{i32 20}
!753 = !{i32 21}
!754 = !{i32 9}
!755 = !{!756, !745}
!756 = !{i32 4, !214}
!757 = !{i32 10}
!758 = !{!759, !745}
!759 = !{i32 5, !214}
!760 = !{i32 8}
!761 = !{!762, !763}
!762 = !{i32 6, !214}
!763 = !{i32 7, !225}
!764 = !{i32 6}
!765 = !{!766, !767}
!766 = !{i32 8, !206}
!767 = !{i32 7, !234}
!768 = distinct !{!768, !769, !771, !772, !773}
!769 = !{i32 216, i32 5, !770, null}
!770 = !{i32 786443, !668, i32 216, i32 5, !239, i32 0}
!771 = !{i32 221, i32 5, !770, null}
!772 = !{!"llvm.loop.name", !"sha_stream_label0"}
!773 = !{!"llvm.loop.tripcount", i32 2, i32 2, i32 2, !"user", !774}
!774 = !{i32 217, i32 9, !770, null}
!775 = !{!776, !777, !778, !779, !780, !781, !782, !783, !784, !785, !786, !787, !747, !788, !789, !790, !791, !748, !792}
!776 = !{i32 16, !206}
!777 = !{i32 17, !746}
!778 = !{i32 18, !746}
!779 = !{i32 19, !746}
!780 = !{i32 20, !746}
!781 = !{i32 21, !746}
!782 = !{i32 9, !746}
!783 = !{i32 10, !746}
!784 = !{i32 4, !746}
!785 = !{i32 5, !746}
!786 = !{i32 22, !746}
!787 = !{i32 11, !746}
!788 = !{i32 12, !746}
!789 = !{i32 13, !746}
!790 = !{i32 14, !746}
!791 = !{i32 15, !746}
!792 = !{i32 3, !746}
!793 = !{i32 7}
!794 = !{!795, !796}
!795 = !{i32 8, !225}
!796 = !{i32 6, !259}
!797 = !{i32 4}
!798 = !{!799, !745}
!799 = !{i32 9, !206}
!800 = !{i32 5}
!801 = !{!802, !745}
!802 = !{i32 10, !206}
!803 = !{i32 7, i32 7, i32 0, i32 0}
!804 = !{i32 22}
!805 = !{!745, !806, !807, !808, !809, !810, !811, !812}
!806 = !{i32 11, !225}
!807 = !{i32 1, !214}
!808 = !{i32 12, !225}
!809 = !{i32 13, !225}
!810 = !{i32 14, !225}
!811 = !{i32 15, !225}
!812 = !{i32 2, !214}
!813 = !{i32 11}
!814 = !{!815, !745, !807, !808, !809, !810, !811, !812}
!815 = !{i32 22, !225}
!816 = !{i32 1}
!817 = !{!777, !778, !779, !780, !781, !818, !745, !819, !820, !821, !822, !823, !748, !792}
!818 = !{i32 22, !206}
!819 = !{i32 11, !206}
!820 = !{i32 12, !206}
!821 = !{i32 13, !206}
!822 = !{i32 14, !206}
!823 = !{i32 15, !206}
!824 = !{i32 12}
!825 = !{!815, !745, !806, !807, !809, !810, !811, !812}
!826 = !{i32 13}
!827 = !{!815, !745, !806, !807, !808, !810, !811, !812}
!828 = !{i32 14}
!829 = !{!815, !745, !806, !807, !808, !809, !812}
!830 = !{i32 15}
!831 = !{i32 2}
!832 = !{!777, !778, !779, !780, !781, !818, !745, !819, !747, !820, !821, !822, !823, !792}
!833 = !{i32 3}
!834 = !{!835, !836, !837, !838, !839, !745, !747, !748}
!835 = !{i32 17, !206}
!836 = !{i32 18, !206}
!837 = !{i32 19, !206}
!838 = !{i32 20, !206}
!839 = !{i32 21, !206}
!840 = !{i32 0, i32 0, i32 30, i32 1}
!841 = !{i32 56}
!842 = !{!843, !844}
!843 = !{i32 54, !214}
!844 = !{i32 55, !225}
!845 = !{i32 54}
!846 = !{!847, !848}
!847 = !{i32 56, !206}
!848 = !{i32 55, !234}
!849 = !{i32 31, i32 31, i32 0, i32 0}
!850 = distinct !{!850, !851, !856, !857, !858, !684}
!851 = !{i32 65, i32 5, !852, null}
!852 = !{i32 786443, !853, !239}
!853 = !{i32 786478, i32 0, !239, !"local_memset", !"local_memset", null, !239, i32 55, !854, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i7, i4)* @local_memset, null, null, !247, i32 55}
!854 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !855, i32 0, i32 0}
!855 = !{null, !678, !246, !246, !246}
!856 = !{i32 68, i32 5, !852, null}
!857 = !{!"llvm.loop.name", !"local_memset_label1"}
!858 = !{!"llvm.loop.tripcount", i32 0, i32 16, i32 8, !"user", !859}
!859 = !{i32 66, i32 9, !852, null}
!860 = !{i32 55}
!861 = !{!862, !863}
!862 = !{i32 56, !225}
!863 = !{i32 54, !259}
!864 = !{i32 30, i32 30, i32 0, i32 1}
!865 = !{i32 31, i32 31, i32 0, i32 1}
!866 = !{i32 53}
!867 = !{!868, !869}
!868 = !{i32 48, !214}
!869 = !{i32 49, !225}
!870 = !{i32 52}
!871 = !{!872, !873}
!872 = !{i32 50, !214}
!873 = !{i32 51, !225}
!874 = !{i32 50}
!875 = !{!876, !877}
!876 = !{i32 52, !206}
!877 = !{i32 51, !234}
!878 = distinct !{!878, !879, !884, !885}
!879 = !{i32 88, i32 5, !880, null}
!880 = !{i32 786443, !881, !239}
!881 = !{i32 786478, i32 0, !239, !"local_memcpy", !"local_memcpy", null, !239, i32 72, !882, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !247, i32 72}
!882 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !883, i32 0, i32 0}
!883 = !{null, !678, !242, !246}
!884 = !{!"llvm.loop.name", !"local_memcpy_label3"}
!885 = !{!"llvm.loop.tripcount", i32 0, i32 16, i32 8, !"user", !886}
!886 = !{i32 80, i32 9, !880, null}
!887 = !{i32 48}
!888 = !{!889, !890}
!889 = !{i32 53, !206}
!890 = !{i32 49, !234}
!891 = !{i32 49}
!892 = !{!893, !894}
!893 = !{i32 53, !225}
!894 = !{i32 48, !259}
!895 = !{i32 51}
!896 = !{!897, !898}
!897 = !{i32 52, !225}
!898 = !{i32 50, !259}
