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
  %count_addr_02 = alloca i32, align 4, !bitwidth !58
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_7), !fpga.pragma.source !204
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
  store i32 %count_read, i32* %count_addr_02, align 4, !bitwidth !212, !dep_idx !223, !deps !224
  store i32 0, i32* %idx, align 4, !bitwidth !212, !dep_idx !228, !deps !229
  br label %while.body, !bitwidth !212

while.body:                                       ; preds = %while.body.split, %entry
  %count_load = load i32, i32* %count_addr_02, align 4, !bitwidth !11, !dep_idx !232, !deps !233
  %tmp_2 = call i26 @_ssdm_op_PartSelect.i26.i32.i32.i32(i32 %count_load, i32 6, i32 31), !bitwidth !219
  %icmp_ln162_1 = icmp sgt i26 %tmp_2, 0, !bitwidth !9
  br i1 %icmp_ln162_1, label %while.body.split, label %while.end.loopexit, !llvm.loop !237, !bitwidth !212

while.body.split:                                 ; preds = %while.body
  %idx_load = load i32, i32* %idx, align 4, !bitwidth !11, !dep_idx !254, !deps !255
  %trunc_ln162 = trunc i32 %idx_load to i14, !bitwidth !197
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 127, i64 128, i64 127), !fpga.pragma.source !204
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @empty_11)
  call fastcc void @local_memcpy([16384 x i8]* %buffer, i1 %buffer_offset_read, i32 64, i14 %trunc_ln162), !bitwidth !212, !dep_idx !258, !deps !259
  call fastcc void @sha_transform(), !bitwidth !212, !dep_idx !263, !deps !264
  %add_ln167 = add nuw nsw i32 %count_load, -64, !bitwidth !11
  %add_ln162 = add nuw i32 %idx_load, 64, !bitwidth !11
  store i32 %add_ln167, i32* %count_addr_02, align 4, !bitwidth !212, !dep_idx !267, !deps !268
  store i32 %add_ln162, i32* %idx, align 4, !bitwidth !212, !dep_idx !271, !deps !272
  br label %while.body, !llvm.loop !237, !bitwidth !212

while.end.loopexit:                               ; preds = %while.body
  %trunc_ln162_1 = trunc i32 %count_read to i6, !bitwidth !275
  %tmp_1 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %count_read, i32 6, i32 13), !bitwidth !276
  %and_ln = call i14 @_ssdm_op_BitConcatenate.i14.i8.i6(i8 %tmp_1, i6 0), !bitwidth !197
  %zext_ln169 = zext i6 %trunc_ln162_1 to i32, !bitwidth !218
  %select_ln169 = select i1 %icmp_ln162, i32 %zext_ln169, i32 %count_read, !bitwidth !11
  %select_ln169_1 = select i1 %icmp_ln162, i14 %and_ln, i14 0, !bitwidth !197
  call fastcc void @local_memcpy([16384 x i8]* %buffer, i1 %buffer_offset_read, i32 %select_ln169, i14 %select_ln169_1), !bitwidth !212, !dep_idx !277, !deps !278
  ret void, !bitwidth !212
}

; Function Attrs: noinline nounwind
define internal fastcc void @sha_transform() unnamed_addr #1 {
entry:
  %i = alloca i5, align 1, !bitwidth !281
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_7), !fpga.pragma.source !204
  %W = alloca [80 x i32], i64 1, align 512, !bitwidth !58
  store i5 0, i5* %i, align 1, !bitwidth !212, !dep_idx !282, !deps !283
  br label %for.inc, !bitwidth !212

for.inc:                                          ; preds = %for.inc.split, %entry
  %i_6 = load i5, i5* %i, align 1, !bitwidth !286, !dep_idx !287, !deps !288
  %icmp_ln98 = icmp eq i5 %i_6, -16, !bitwidth !9
  %add_ln98 = add nuw i5 %i_6, 1, !bitwidth !286
  br i1 %icmp_ln98, label %for.inc21.preheader, label %for.inc.split, !llvm.loop !291, !bitwidth !212

for.inc21.preheader:                              ; preds = %for.inc
  %i_1 = alloca i7, align 1, !bitwidth !302
  store i7 16, i7* %i_1, align 1, !bitwidth !212, !dep_idx !303, !deps !304
  br label %for.inc21, !bitwidth !212

for.inc.split:                                    ; preds = %for.inc
  %zext_ln98 = zext i5 %i_6 to i64, !bitwidth !307
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 16, i64 16, i64 16), !fpga.pragma.source !204
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_4)
  %sha_info_data_addr = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext_ln98, !bitwidth !58
  %sha_info_data_load = load i32, i32* %sha_info_data_addr, align 4, !bitwidth !11
  %W_addr = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln98, !bitwidth !58
  store i32 %sha_info_data_load, i32* %W_addr, align 4, !bitwidth !212, !dep_idx !308, !deps !309
  store i5 %add_ln98, i5* %i, align 1, !bitwidth !212, !dep_idx !319, !deps !320
  br label %for.inc, !llvm.loop !291, !bitwidth !212

for.inc21:                                        ; preds = %for.inc21.split, %for.inc21.preheader
  %i_7 = load i7, i7* %i_1, align 1, !bitwidth !180, !dep_idx !323, !deps !324
  %icmp_ln104 = icmp eq i7 %i_7, -48, !bitwidth !9
  br i1 %icmp_ln104, label %for.end23, label %for.inc21.split, !llvm.loop !327, !bitwidth !212

for.inc21.split:                                  ; preds = %for.inc21
  %zext_ln104 = zext i7 %i_7 to i64, !bitwidth !307
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !204
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_0)
  %add_ln106 = add nuw i7 %i_7, -3, !bitwidth !180
  %zext_ln106 = zext i7 %add_ln106 to i64, !bitwidth !307
  %W_addr_1 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln106, !bitwidth !58
  %W_load = load i32, i32* %W_addr_1, align 4, !bitwidth !11, !dep_idx !334, !deps !335
  %add_ln106_1 = add nuw i7 %i_7, -8, !bitwidth !180
  %zext_ln106_1 = zext i7 %add_ln106_1 to i64, !bitwidth !307
  %W_addr_2 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln106_1, !bitwidth !58
  %W_load_1 = load i32, i32* %W_addr_2, align 4, !bitwidth !11, !dep_idx !339, !deps !340
  %add_ln106_2 = add nuw i7 %i_7, -14, !bitwidth !180
  %zext_ln106_2 = zext i7 %add_ln106_2 to i64, !bitwidth !307
  %W_addr_3 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln106_2, !bitwidth !58
  %W_load_2 = load i32, i32* %W_addr_3, align 4, !bitwidth !11, !dep_idx !343, !deps !344
  %add_ln106_3 = add nuw nsw i7 %i_7, -16, !bitwidth !180
  %zext_ln106_3 = zext i7 %add_ln106_3 to i64, !bitwidth !307
  %W_addr_4 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln106_3, !bitwidth !58
  %W_load_3 = load i32, i32* %W_addr_4, align 4, !bitwidth !11, !dep_idx !347, !deps !348
  %xor_ln106 = xor i32 %W_load_1, %W_load, !bitwidth !11
  %xor_ln106_1 = xor i32 %W_load_2, %W_load_3, !bitwidth !11
  %xor_ln106_2 = xor i32 %xor_ln106_1, %xor_ln106, !bitwidth !11
  %W_addr_5 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln104, !bitwidth !58
  store i32 %xor_ln106_2, i32* %W_addr_5, align 4, !bitwidth !212, !dep_idx !351, !deps !352
  %add_ln104 = add nuw i7 %i_7, 1, !bitwidth !180
  store i7 %add_ln104, i7* %i_1, align 1, !bitwidth !212, !dep_idx !362, !deps !363
  br label %for.inc21, !llvm.loop !327, !bitwidth !212

for.end23:                                        ; preds = %for.inc21
  %i_2 = alloca i5, align 1, !bitwidth !281
  %C_1 = alloca i32, align 4, !bitwidth !58
  %D_1 = alloca i32, align 4, !bitwidth !58
  %E_1 = alloca i32, align 4, !bitwidth !58
  %A = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512, !bitwidth !11, !dep_idx !366, !deps !367
  %B = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4, !bitwidth !11, !dep_idx !369, !deps !370
  %C = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8, !bitwidth !11, !dep_idx !372, !deps !373
  %D = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4, !bitwidth !11, !dep_idx !375, !deps !376
  %E = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16, !bitwidth !11, !dep_idx !378, !deps !379
  store i32 %E, i32* %E_1, align 4, !bitwidth !212, !dep_idx !381, !deps !382
  store i32 %D, i32* %D_1, align 4, !bitwidth !212, !dep_idx !385, !deps !386
  store i32 %C, i32* %C_1, align 4, !bitwidth !212, !dep_idx !389, !deps !390
  store i5 0, i5* %i_2, align 1, !bitwidth !212, !dep_idx !393, !deps !394
  br label %for.inc38, !bitwidth !212

for.inc38:                                        ; preds = %for.inc38.split, %for.end23
  %B_10 = phi i32 [ %A_9, %for.inc38.split ], [ %A, %for.end23 ], !bitwidth !11
  %B_2 = phi i32 [ %B_10, %for.inc38.split ], [ %B, %for.end23 ], !bitwidth !11
  %i_8 = load i5, i5* %i_2, align 1, !bitwidth !286, !dep_idx !397, !deps !398
  %D_13 = load i32, i32* %C_1, align 4, !bitwidth !11, !dep_idx !401, !deps !402
  %E_13 = load i32, i32* %D_1, align 4, !bitwidth !11, !dep_idx !405, !deps !406
  %E_4 = load i32, i32* %E_1, align 4, !bitwidth !11, !dep_idx !409, !deps !410
  %icmp_ln117 = icmp eq i5 %i_8, -12, !bitwidth !9
  %add_ln117 = add nuw i5 %i_8, 1, !bitwidth !286
  br i1 %icmp_ln117, label %for.inc60.preheader, label %for.inc38.split, !llvm.loop !413, !bitwidth !212

for.inc60.preheader:                              ; preds = %for.inc38
  %i_3 = alloca i6, align 1, !bitwidth !420
  %C_3 = alloca i32, align 4, !bitwidth !58
  %D_2 = alloca i32, align 4, !bitwidth !58
  %E_2 = alloca i32, align 4, !bitwidth !58
  store i32 %E_4, i32* %E_2, align 4, !bitwidth !212, !dep_idx !421, !deps !422
  store i32 %E_13, i32* %D_2, align 4, !bitwidth !212, !dep_idx !425, !deps !426
  store i32 %D_13, i32* %C_3, align 4, !bitwidth !212, !dep_idx !429, !deps !430
  store i6 20, i6* %i_3, align 1, !bitwidth !212, !dep_idx !433, !deps !434
  br label %for.inc60, !bitwidth !212

for.inc38.split:                                  ; preds = %for.inc38
  %zext_ln94 = zext i5 %i_8 to i64, !bitwidth !307
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !204
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_1)
  %trunc_ln119 = trunc i32 %B_10 to i27, !bitwidth !437
  %lshr_ln = call i5 @_ssdm_op_PartSelect.i5.i32.i32.i32(i32 %B_10, i32 27, i32 31), !bitwidth !286
  %W_addr_6 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln94, !bitwidth !58
  %W_load_4 = load i32, i32* %W_addr_6, align 4, !bitwidth !11, !dep_idx !438, !deps !439
  %xor_ln119 = xor i32 %B_2, -1, !bitwidth !11
  %and_ln119 = and i32 %D_13, %B_2, !bitwidth !11
  %and_ln119_1 = and i32 %E_13, %xor_ln119, !bitwidth !11
  %or_ln119 = or i32 %and_ln119_1, %and_ln119, !bitwidth !11
  %or_ln119_1 = call i32 @_ssdm_op_BitConcatenate.i32.i27.i5(i27 %trunc_ln119, i5 %lshr_ln), !bitwidth !11
  %add_ln119 = add i32 %W_load_4, %or_ln119_1, !bitwidth !11
  %add_ln119_1 = add i32 %or_ln119, 1518500249, !bitwidth !11
  %add_ln119_2 = add i32 %add_ln119_1, %E_4, !bitwidth !11
  %A_9 = add i32 %add_ln119_2, %add_ln119, !bitwidth !11
  %trunc_ln119_1 = trunc i32 %B_2 to i2, !bitwidth !441
  %lshr_ln119_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %B_2, i32 2, i32 31), !bitwidth !442
  %C_2 = call i32 @_ssdm_op_BitConcatenate.i32.i2.i30(i2 %trunc_ln119_1, i30 %lshr_ln119_1), !bitwidth !11
  store i32 %E_13, i32* %E_1, align 4, !bitwidth !212, !dep_idx !443, !deps !444
  store i32 %D_13, i32* %D_1, align 4, !bitwidth !212, !dep_idx !447, !deps !448
  store i32 %C_2, i32* %C_1, align 4, !bitwidth !212, !dep_idx !451, !deps !452
  store i5 %add_ln117, i5* %i_2, align 1, !bitwidth !212, !dep_idx !455, !deps !456
  br label %for.inc38, !llvm.loop !413, !bitwidth !212

for.inc60:                                        ; preds = %for.inc60.split, %for.inc60.preheader
  %B_11 = phi i32 [ %A_10, %for.inc60.split ], [ %B_10, %for.inc60.preheader ], !bitwidth !11
  %B_4 = phi i32 [ %B_11, %for.inc60.split ], [ %B_2, %for.inc60.preheader ], !bitwidth !11
  %i_9 = load i6, i6* %i_3, align 1, !bitwidth !275, !dep_idx !459, !deps !460
  %D_14 = load i32, i32* %C_3, align 4, !bitwidth !11, !dep_idx !463, !deps !464
  %E_14 = load i32, i32* %D_2, align 4, !bitwidth !11, !dep_idx !467, !deps !468
  %E_8 = load i32, i32* %E_2, align 4, !bitwidth !11, !dep_idx !471, !deps !472
  %icmp_ln121 = icmp eq i6 %i_9, -24, !bitwidth !9
  br i1 %icmp_ln121, label %for.inc85.preheader, label %for.inc60.split, !llvm.loop !475, !bitwidth !212

for.inc85.preheader:                              ; preds = %for.inc60
  %i_4 = alloca i6, align 1, !bitwidth !420
  %C_7 = alloca i32, align 4, !bitwidth !58
  %D_5 = alloca i32, align 4, !bitwidth !58
  %E_5 = alloca i32, align 4, !bitwidth !58
  store i32 %E_8, i32* %E_5, align 4, !bitwidth !212, !dep_idx !482, !deps !483
  store i32 %E_14, i32* %D_5, align 4, !bitwidth !212, !dep_idx !486, !deps !487
  store i32 %D_14, i32* %C_7, align 4, !bitwidth !212, !dep_idx !490, !deps !491
  store i6 -24, i6* %i_4, align 1, !bitwidth !212, !dep_idx !494, !deps !495
  br label %for.inc85, !bitwidth !212

for.inc60.split:                                  ; preds = %for.inc60
  %zext_ln94_1 = zext i6 %i_9 to i64, !bitwidth !307
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !204
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_2)
  %trunc_ln123 = trunc i32 %B_11 to i27, !bitwidth !437
  %lshr_ln1 = call i5 @_ssdm_op_PartSelect.i5.i32.i32.i32(i32 %B_11, i32 27, i32 31), !bitwidth !286
  %W_addr_7 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln94_1, !bitwidth !58
  %W_load_5 = load i32, i32* %W_addr_7, align 4, !bitwidth !11, !dep_idx !498, !deps !439
  %xor_ln123 = xor i32 %B_4, %E_14, !bitwidth !11
  %xor_ln123_1 = xor i32 %xor_ln123, %D_14, !bitwidth !11
  %or_ln = call i32 @_ssdm_op_BitConcatenate.i32.i27.i5(i27 %trunc_ln123, i5 %lshr_ln1), !bitwidth !11
  %add_ln123 = add i32 %W_load_5, %or_ln, !bitwidth !11
  %add_ln123_1 = add i32 %xor_ln123_1, 1859775393, !bitwidth !11
  %add_ln123_2 = add i32 %add_ln123_1, %E_8, !bitwidth !11
  %A_10 = add i32 %add_ln123_2, %add_ln123, !bitwidth !11
  %trunc_ln123_1 = trunc i32 %B_4 to i2, !bitwidth !441
  %lshr_ln123_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %B_4, i32 2, i32 31), !bitwidth !442
  %C_4 = call i32 @_ssdm_op_BitConcatenate.i32.i2.i30(i2 %trunc_ln123_1, i30 %lshr_ln123_1), !bitwidth !11
  %add_ln121 = add nuw i6 %i_9, 1, !bitwidth !275
  store i32 %E_14, i32* %E_2, align 4, !bitwidth !212, !dep_idx !499, !deps !500
  store i32 %D_14, i32* %D_2, align 4, !bitwidth !212, !dep_idx !503, !deps !504
  store i32 %C_4, i32* %C_3, align 4, !bitwidth !212, !dep_idx !507, !deps !508
  store i6 %add_ln121, i6* %i_3, align 1, !bitwidth !212, !dep_idx !511, !deps !512
  br label %for.inc60, !llvm.loop !475, !bitwidth !212

for.inc85:                                        ; preds = %for.inc85.split, %for.inc85.preheader
  %B_12 = phi i32 [ %A_11, %for.inc85.split ], [ %B_11, %for.inc85.preheader ], !bitwidth !11
  %B_6 = phi i32 [ %B_12, %for.inc85.split ], [ %B_4, %for.inc85.preheader ], !bitwidth !11
  %i_10 = load i6, i6* %i_4, align 1, !bitwidth !275, !dep_idx !515, !deps !516
  %D_15 = load i32, i32* %C_7, align 4, !bitwidth !11, !dep_idx !519, !deps !520
  %E_15 = load i32, i32* %D_5, align 4, !bitwidth !11, !dep_idx !523, !deps !524
  %E_11 = load i32, i32* %E_5, align 4, !bitwidth !11, !dep_idx !527, !deps !528
  %icmp_ln125 = icmp eq i6 %i_10, -4, !bitwidth !9
  br i1 %icmp_ln125, label %for.inc107.preheader, label %for.inc85.split, !llvm.loop !531, !bitwidth !212

for.inc107.preheader:                             ; preds = %for.inc85
  %E_7 = alloca i32, align 4, !bitwidth !58
  %B_5 = alloca i32, align 4, !bitwidth !58
  %i_5 = alloca i7, align 1, !bitwidth !302
  %E_9 = alloca i32, align 4, !bitwidth !58
  %D_8 = alloca i32, align 4, !bitwidth !58
  %B_7 = alloca i32, align 4, !bitwidth !58
  store i32 %B_12, i32* %B_7, align 4, !bitwidth !212, !dep_idx !538, !deps !539
  store i32 %D_15, i32* %D_8, align 4, !bitwidth !212, !dep_idx !542, !deps !543
  store i32 %E_15, i32* %E_9, align 4, !bitwidth !212, !dep_idx !546, !deps !547
  store i7 60, i7* %i_5, align 1, !bitwidth !212, !dep_idx !550, !deps !551
  store i32 %B_6, i32* %B_5, align 4, !bitwidth !212, !dep_idx !554, !deps !555
  store i32 %E_11, i32* %E_7, align 4, !bitwidth !212, !dep_idx !559, !deps !560
  br label %for.inc107, !bitwidth !212

for.inc85.split:                                  ; preds = %for.inc85
  %zext_ln94_2 = zext i6 %i_10 to i64, !bitwidth !307
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !204
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty)
  %trunc_ln127 = trunc i32 %B_12 to i27, !bitwidth !437
  %lshr_ln2 = call i5 @_ssdm_op_PartSelect.i5.i32.i32.i32(i32 %B_12, i32 27, i32 31), !bitwidth !286
  %W_addr_8 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln94_2, !bitwidth !58
  %W_load_6 = load i32, i32* %W_addr_8, align 4, !bitwidth !11, !dep_idx !564, !deps !439
  %or_ln127 = or i32 %E_15, %D_15, !bitwidth !11
  %and_ln127 = and i32 %or_ln127, %B_6, !bitwidth !11
  %and_ln127_1 = and i32 %E_15, %D_15, !bitwidth !11
  %or_ln127_1 = or i32 %and_ln127, %and_ln127_1, !bitwidth !11
  %or_ln127_2 = call i32 @_ssdm_op_BitConcatenate.i32.i27.i5(i27 %trunc_ln127, i5 %lshr_ln2), !bitwidth !11
  %add_ln127 = add i32 %W_load_6, %or_ln127_2, !bitwidth !11
  %add_ln127_1 = add i32 %E_11, %or_ln127_1, !bitwidth !11
  %add_ln127_2 = add i32 %add_ln127_1, -1894007588, !bitwidth !11
  %A_11 = add i32 %add_ln127_2, %add_ln127, !bitwidth !11
  %trunc_ln127_1 = trunc i32 %B_6 to i2, !bitwidth !441
  %lshr_ln127_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %B_6, i32 2, i32 31), !bitwidth !442
  %C_6 = call i32 @_ssdm_op_BitConcatenate.i32.i2.i30(i2 %trunc_ln127_1, i30 %lshr_ln127_1), !bitwidth !11
  %add_ln125 = add nuw i6 %i_10, 1, !bitwidth !275
  store i32 %E_15, i32* %E_5, align 4, !bitwidth !212, !dep_idx !565, !deps !566
  store i32 %D_15, i32* %D_5, align 4, !bitwidth !212, !dep_idx !569, !deps !570
  store i32 %C_6, i32* %C_7, align 4, !bitwidth !212, !dep_idx !573, !deps !574
  store i6 %add_ln125, i6* %i_4, align 1, !bitwidth !212, !dep_idx !577, !deps !578
  br label %for.inc85, !llvm.loop !531, !bitwidth !212

for.inc107:                                       ; preds = %for.inc107.split, %for.inc107.preheader
  %i_11 = load i7, i7* %i_5, align 1, !bitwidth !180, !dep_idx !581, !deps !582
  %D_16 = load i32, i32* %E_9, align 4, !bitwidth !11, !dep_idx !585, !deps !586
  %C_13 = load i32, i32* %D_8, align 4, !bitwidth !11, !dep_idx !589, !deps !590
  %A_12 = load i32, i32* %B_7, align 4, !bitwidth !11, !dep_idx !593, !deps !594
  %icmp_ln129 = icmp eq i7 %i_11, -48, !bitwidth !9
  br i1 %icmp_ln129, label %for.end109, label %for.inc107.split, !llvm.loop !597, !bitwidth !212

for.inc107.split:                                 ; preds = %for.inc107
  %E_7_load_1 = load i32, i32* %E_7, align 4, !bitwidth !11, !dep_idx !604, !deps !605
  %B_5_load_1 = load i32, i32* %B_5, align 4, !bitwidth !11, !dep_idx !608, !deps !609
  %zext_ln129 = zext i7 %i_11 to i64, !bitwidth !307
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !204
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_8)
  %trunc_ln131 = trunc i32 %A_12 to i27, !bitwidth !437
  %lshr_ln3 = call i5 @_ssdm_op_PartSelect.i5.i32.i32.i32(i32 %A_12, i32 27, i32 31), !bitwidth !286
  %W_addr_9 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext_ln129, !bitwidth !58
  %W_load_7 = load i32, i32* %W_addr_9, align 4, !bitwidth !11, !dep_idx !612, !deps !439
  %xor_ln131 = xor i32 %B_5_load_1, %D_16, !bitwidth !11
  %xor_ln131_1 = xor i32 %xor_ln131, %C_13, !bitwidth !11
  %or_ln1 = call i32 @_ssdm_op_BitConcatenate.i32.i27.i5(i27 %trunc_ln131, i5 %lshr_ln3), !bitwidth !11
  %add_ln131 = add i32 %W_load_7, %or_ln1, !bitwidth !11
  %add_ln131_1 = add i32 %xor_ln131_1, -899497514, !bitwidth !11
  %add_ln131_2 = add i32 %add_ln131_1, %E_7_load_1, !bitwidth !11
  %temp = add i32 %add_ln131_2, %add_ln131, !bitwidth !11
  %trunc_ln131_1 = trunc i32 %B_5_load_1 to i2, !bitwidth !441
  %lshr_ln131_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %B_5_load_1, i32 2, i32 31), !bitwidth !442
  %C_8 = call i32 @_ssdm_op_BitConcatenate.i32.i2.i30(i2 %trunc_ln131_1, i30 %lshr_ln131_1), !bitwidth !11
  %add_ln129 = add nuw i7 %i_11, 1, !bitwidth !180
  store i32 %temp, i32* %B_7, align 4, !bitwidth !212, !dep_idx !613, !deps !614
  store i32 %C_8, i32* %D_8, align 4, !bitwidth !212, !dep_idx !617, !deps !618
  store i32 %C_13, i32* %E_9, align 4, !bitwidth !212, !dep_idx !621, !deps !622
  store i7 %add_ln129, i7* %i_5, align 1, !bitwidth !212, !dep_idx !625, !deps !626
  store i32 %A_12, i32* %B_5, align 4, !bitwidth !212, !dep_idx !629, !deps !630
  store i32 %D_16, i32* %E_7, align 4, !bitwidth !212, !dep_idx !633, !deps !634
  br label %for.inc107, !llvm.loop !597, !bitwidth !212

for.end109:                                       ; preds = %for.inc107
  %E_7_load = load i32, i32* %E_7, align 4, !bitwidth !11, !dep_idx !637, !deps !638
  %B_5_load = load i32, i32* %B_5, align 4, !bitwidth !11, !dep_idx !640, !deps !641
  %add_ln135 = add i32 %A, %A_12, !bitwidth !11
  store i32 %add_ln135, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512, !bitwidth !212, !dep_idx !643, !deps !644
  %add_ln136 = add i32 %B, %B_5_load, !bitwidth !11
  store i32 %add_ln136, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4, !bitwidth !212, !dep_idx !646, !deps !647
  %add_ln137 = add i32 %C, %C_13, !bitwidth !11
  store i32 %add_ln137, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8, !bitwidth !212, !dep_idx !649, !deps !650
  %add_ln138 = add i32 %D, %D_16, !bitwidth !11
  store i32 %add_ln138, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4, !bitwidth !212, !dep_idx !652, !deps !653
  %add_ln139 = add i32 %E, %E_7_load, !bitwidth !11
  store i32 %add_ln139, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16, !bitwidth !212, !dep_idx !655, !deps !656
  ret void, !bitwidth !212
}

; Function Attrs: nounwind
define internal void @sha_stream_Pipeline_sha_stream_label1_VITIS_LOOP_207_1([16384 x i8]* %indata) #2 {
newFuncRoot:
  %j = alloca i14, align 2, !bitwidth !658
  %i = alloca i2, align 1, !bitwidth !659
  %indvar_flatten = alloca i15, align 2, !bitwidth !660
  call void (...) @_ssdm_op_SpecInterface([16384 x i8]* %indata, [10 x i8]* @empty_3, i32 0, i32 0, [1 x i8]* @empty_7, i32 -1, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 -1, i32 0)
  store i15 0, i15* %indvar_flatten, align 2, !bitwidth !212, !dep_idx !661, !deps !662
  store i2 0, i2* %i, align 1, !bitwidth !212, !dep_idx !665, !deps !666
  store i14 0, i14* %j, align 2, !bitwidth !212, !dep_idx !669, !deps !670
  br label %for.inc, !bitwidth !212

for.end12.exitStub:                               ; preds = %for.inc
  ret void, !bitwidth !212

for.inc:                                          ; preds = %for.inc10, %newFuncRoot
  %indvar_flatten_load = load i15, i15* %indvar_flatten, align 2, !bitwidth !673, !dep_idx !674, !deps !675
  %icmp_ln205 = icmp eq i15 %indvar_flatten_load, -16384, !bitwidth !9
  %add_ln205_1 = add i15 %indvar_flatten_load, 1, !bitwidth !673
  br i1 %icmp_ln205, label %for.end12.exitStub, label %for.inc10, !bitwidth !212

for.inc10:                                        ; preds = %for.inc
  %j_load = load i14, i14* %j, align 2, !bitwidth !197, !dep_idx !678, !deps !679
  %i_load = load i2, i2* %i, align 1, !bitwidth !441, !dep_idx !682, !deps !683
  %add_ln205 = add nuw i2 %i_load, 1, !bitwidth !441
  call void (...) @_ssdm_op_SpecLoopName([35 x i8]* @sha_stream_label1_VITIS_LOOP_207_1_str)
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 16384, i64 16384, i64 16384)
  %icmp_ln207 = icmp eq i14 %j_load, -8192, !bitwidth !9
  %select_ln201 = select i1 %icmp_ln207, i14 0, i14 %j_load, !bitwidth !197
  %select_ln205 = select i1 %icmp_ln207, i2 %add_ln205, i2 %i_load, !bitwidth !441
  %trunc_ln209 = trunc i2 %select_ln205 to i1, !bitwidth !9
  %tmp = call i14 @_ssdm_op_BitConcatenate.i14.i1.i13(i1 %trunc_ln209, i13 0), !bitwidth !197
  %add_ln209 = add i14 %tmp, %select_ln201, !bitwidth !197
  %zext_ln209 = zext i14 %add_ln209 to i64, !bitwidth !307
  %local_indata_addr = getelementptr [16384 x i8], [16384 x i8]* @local_indata, i64 0, i64 %zext_ln209, !bitwidth !7
  %indata_addr = getelementptr [16384 x i8], [16384 x i8]* %indata, i64 0, i64 %zext_ln209, !bitwidth !7
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_7)
  %indata_load = load i8, i8* %indata_addr, align 1, !bitwidth !276
  store i8 %indata_load, i8* %local_indata_addr, align 1, !bitwidth !212
  %add_ln207 = add nuw i14 %select_ln201, 1, !bitwidth !197
  store i15 %add_ln205_1, i15* %indvar_flatten, align 2, !bitwidth !212, !dep_idx !686, !deps !687
  store i2 %select_ln205, i2* %i, align 1, !bitwidth !212, !dep_idx !690, !deps !691
  store i14 %add_ln207, i14* %j, align 2, !bitwidth !212, !dep_idx !694, !deps !695
  br label %for.inc, !llvm.loop !698, !bitwidth !212
}

; Function Attrs: nounwind
define void @sha_stream([16384 x i8]* noalias %indata, [2 x i32]* noalias %in_i, [5 x i32]* noalias %outdata) #2 {
entry:
  %j = alloca i2, align 1, !bitwidth !659
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_7), !fpga.pragma.source !204
  call void (...) @_ssdm_op_SpecTopModule([11 x i8]* @empty_5), !fpga.pragma.source !204
  call void (...) @_ssdm_op_SpecInterface([16384 x i8]* %indata, [10 x i8]* @empty_3, i32 0, i32 0, [1 x i8]* @empty_7, i32 -1, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([16384 x i8]* %indata), !map !722
  call void (...) @_ssdm_op_SpecInterface([2 x i32]* %in_i, [10 x i8]* @empty_3, i32 0, i32 0, [1 x i8]* @empty_7, i32 -1, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([2 x i32]* %in_i), !map !722
  call void (...) @_ssdm_op_SpecInterface([5 x i32]* %outdata, [10 x i8]* @empty_3, i32 0, i32 0, [1 x i8]* @empty_7, i32 -1, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_7, [1 x i8]* @empty_7, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([5 x i32]* %outdata), !map !722
  call void @sha_stream_Pipeline_sha_stream_label1_VITIS_LOOP_207_1([16384 x i8]* %indata), !bitwidth !212, !dep_idx !723, !deps !724
  call fastcc void @sha_init(), !bitwidth !212, !dep_idx !726, !deps !727
  store i2 0, i2* %j, align 1, !bitwidth !212, !dep_idx !732, !deps !733
  br label %for.inc21, !bitwidth !212

for.inc21:                                        ; preds = %for.inc21.split, %entry
  %j_1 = load i2, i2* %j, align 1, !bitwidth !441, !dep_idx !736, !deps !737
  %icmp_ln216 = icmp eq i2 %j_1, -2, !bitwidth !9
  %add_ln216 = add nuw i2 %j_1, 1, !bitwidth !441
  br i1 %icmp_ln216, label %for.end23, label %for.inc21.split, !llvm.loop !740, !bitwidth !212

for.inc21.split:                                  ; preds = %for.inc21
  %zext_ln216 = zext i2 %j_1 to i64, !bitwidth !307
  %trunc_ln216 = trunc i2 %j_1 to i1, !bitwidth !9
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 2, i64 2, i64 2), !fpga.pragma.source !204
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @empty_9)
  %in_i_addr = getelementptr [2 x i32], [2 x i32]* %in_i, i64 0, i64 %zext_ln216, !bitwidth !58
  %i = load i32, i32* %in_i_addr, align 4, !bitwidth !11
  call fastcc void @sha_update([16384 x i8]* @local_indata, i1 %trunc_ln216, i32 %i) #2, !bitwidth !212, !dep_idx !250, !deps !747
  store i2 %add_ln216, i2* %j, align 1, !bitwidth !212, !dep_idx !751, !deps !752
  br label %for.inc21, !llvm.loop !740, !bitwidth !212

for.end23:                                        ; preds = %for.inc21
  %i_7 = alloca i3, align 1, !bitwidth !755
  call fastcc void @sha_final(), !bitwidth !212, !dep_idx !756, !deps !757
  store i3 0, i3* %i_7, align 1, !bitwidth !212, !dep_idx !758, !deps !759
  br label %for.inc31, !bitwidth !212

for.inc31:                                        ; preds = %for.inc31.split, %for.end23
  %i_12 = load i3, i3* %i_7, align 1, !bitwidth !217, !dep_idx !762, !deps !763
  %icmp_ln225 = icmp eq i3 %i_12, -3, !bitwidth !9
  %add_ln225 = add nuw i3 %i_12, 1, !bitwidth !217
  br i1 %icmp_ln225, label %for.end33, label %for.inc31.split, !llvm.loop !766, !bitwidth !212

for.inc31.split:                                  ; preds = %for.inc31
  %zext_ln225 = zext i3 %i_12 to i64, !bitwidth !307
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 5, i64 5, i64 5), !fpga.pragma.source !204
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @empty_6)
  %sha_info_digest_addr = getelementptr inbounds [5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 %zext_ln225, !bitwidth !58
  %sha_info_digest_load = load i32, i32* %sha_info_digest_addr, align 4, !bitwidth !11, !dep_idx !773, !deps !774
  %outdata_addr = getelementptr [5 x i32], [5 x i32]* %outdata, i64 0, i64 %zext_ln225, !bitwidth !58
  store i32 %sha_info_digest_load, i32* %outdata_addr, align 4, !bitwidth !212
  store i3 %add_ln225, i3* %i_7, align 1, !bitwidth !212, !dep_idx !776, !deps !777
  br label %for.inc31, !llvm.loop !766, !bitwidth !212

for.end33:                                        ; preds = %for.inc31
  ret void, !bitwidth !212
}

; Function Attrs: noinline nounwind
define internal fastcc void @sha_init() unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_7), !fpga.pragma.source !204
  store i32 1732584193, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512, !bitwidth !212
  store i32 -271733879, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4, !bitwidth !212
  store i32 -1732584194, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8, !bitwidth !212
  store i32 271733878, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4, !bitwidth !212
  store i32 -1009589776, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16, !bitwidth !212
  store i32 0, i32* @sha_info_count_lo, align 512, !bitwidth !212
  store i32 0, i32* @sha_info_count_hi, align 512, !bitwidth !212
  ret void, !bitwidth !212
}

; Function Attrs: noinline nounwind
define internal fastcc void @sha_final() unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_7), !fpga.pragma.source !204
  %lo_bit_count = load i32, i32* @sha_info_count_lo, align 512, !bitwidth !11
  %hi_bit_count = load i32, i32* @sha_info_count_hi, align 512, !bitwidth !11
  %count = call i6 @_ssdm_op_PartSelect.i6.i32.i32.i32(i32 %lo_bit_count, i32 3, i32 8), !bitwidth !275
  %zext_ln174 = zext i6 %count to i7, !bitwidth !780
  %count_1 = add nuw i7 %zext_ln174, 1, !bitwidth !780
  %trunc_ln174 = trunc i7 %count_1 to i4, !bitwidth !182
  %zext_ln179 = zext i6 %count to i64, !bitwidth !307
  %sha_info_data_addr = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext_ln179, !bitwidth !58
  store i32 128, i32* %sha_info_data_addr, align 4, !bitwidth !212, !dep_idx !781, !deps !782
  %icmp_ln181 = icmp ugt i7 %count_1, 56, !bitwidth !9
  br i1 %icmp_ln181, label %if.then, label %if.else, !bitwidth !212

if.then:                                          ; preds = %entry
  %xor_ln182 = xor i6 %count, -1, !bitwidth !275
  %zext_ln182 = zext i6 %xor_ln182 to i7, !bitwidth !780
  call fastcc void @local_memset(i7 %zext_ln182, i4 %trunc_ln174), !bitwidth !212, !dep_idx !790, !deps !791
  call fastcc void @sha_transform(), !bitwidth !212, !dep_idx !793, !deps !794
  call fastcc void @local_memset(i7 56, i4 0), !bitwidth !212, !dep_idx !802, !deps !803
  br label %if.end, !bitwidth !212

if.else:                                          ; preds = %entry
  %sub_ln186 = sub nsw i7 55, %zext_ln174, !bitwidth !62
  call fastcc void @local_memset(i7 %sub_ln186, i4 %trunc_ln174), !bitwidth !212, !dep_idx !804, !deps !805
  br label %if.end, !bitwidth !212

if.end:                                           ; preds = %if.else, %if.then
  store i32 %hi_bit_count, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 14), align 8, !bitwidth !212, !dep_idx !806, !deps !807
  store i32 %lo_bit_count, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 15), align 4, !bitwidth !212, !dep_idx !808, !deps !807
  call fastcc void @sha_transform(), !bitwidth !212, !dep_idx !809, !deps !810
  ret void, !bitwidth !212
}

; Function Attrs: noinline nounwind
define internal fastcc void @local_memset(i7 %n, i4 %e) #1 {
entry_ifconv:
  %idx = alloca i30, align 4, !bitwidth !812
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_7)
  %e_read = call i4 @_ssdm_op_Read.ap_auto.i4(i4 %e) #2, !bitwidth !182
  %n_read = call i7 @_ssdm_op_Read.ap_auto.i7(i7 %n) #2, !bitwidth !180
  %tmp = call i1 @_ssdm_op_BitSelect.i1.i7.i32(i7 %n_read, i32 6), !bitwidth !9
  %sub_ln58 = sub i7 0, %n_read, !bitwidth !180
  %trunc_ln58_1 = call i5 @_ssdm_op_PartSelect.i5.i7.i32.i32(i7 %sub_ln58, i32 2, i32 6), !bitwidth !286
  %sext_ln58 = sext i5 %trunc_ln58_1 to i30, !bitwidth !813
  %zext_ln58 = zext i30 %sext_ln58 to i31, !bitwidth !814
  %sub_ln58_1 = sub i31 0, %zext_ln58, !bitwidth !815
  %trunc_ln58_2 = call i5 @_ssdm_op_PartSelect.i5.i7.i32.i32(i7 %n_read, i32 2, i32 6), !bitwidth !286
  %sext_ln58_1 = sext i5 %trunc_ln58_2 to i30, !bitwidth !813
  %zext_ln58_1 = zext i30 %sext_ln58_1 to i31, !bitwidth !814
  %m = select i1 %tmp, i31 %sub_ln58_1, i31 %zext_ln58_1, !bitwidth !816
  store i30 0, i30* %idx, align 4, !bitwidth !212, !dep_idx !817, !deps !818
  br label %while.body4, !bitwidth !212

while.body4:                                      ; preds = %while.body4.split, %entry_ifconv
  %idx_load = load i30, i30* %idx, align 4, !bitwidth !442, !dep_idx !821, !deps !822
  %zext_ln65 = zext i30 %idx_load to i31, !bitwidth !814
  %icmp_ln65 = icmp slt i31 %zext_ln65, %m, !bitwidth !9
  %add_ln65 = add nuw i30 %idx_load, 1, !bitwidth !442
  br i1 %icmp_ln65, label %while.body4.split, label %while.end6.loopexit, !llvm.loop !825, !bitwidth !212

while.body4.split:                                ; preds = %while.body4
  %trunc_ln65 = trunc i30 %idx_load to i4, !bitwidth !182
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 0, i64 14, i64 7), !fpga.pragma.source !204
  call void (...) @_ssdm_op_SpecLoopName([20 x i8]* @empty_12)
  %add_ln57 = add i4 %trunc_ln65, %e_read, !bitwidth !182
  %zext_ln57 = zext i4 %add_ln57 to i64, !bitwidth !307
  %p = getelementptr [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext_ln57, !bitwidth !58
  store i32 0, i32* %p, align 4, !bitwidth !212
  store i30 %add_ln65, i30* %idx, align 4, !bitwidth !212, !dep_idx !834, !deps !835
  br label %while.body4, !llvm.loop !825, !bitwidth !212

while.end6.loopexit:                              ; preds = %while.body4
  ret void, !bitwidth !212
}

; Function Attrs: noinline
define internal fastcc void @local_memcpy([16384 x i8]* noalias nocapture align 512 %s2, i1 %s2_offset, i32 %n, i14 %idx1) #0 {
entry:
  %idx9 = alloca i5, align 1, !bitwidth !281
  %idx = alloca i32, align 4, !bitwidth !17
  %idx1_read = call i14 @_ssdm_op_Read.ap_auto.i14(i14 %idx1), !bitwidth !197
  %n_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %n), !bitwidth !11
  %s2_offset_read = call i1 @_ssdm_op_Read.ap_auto.i1(i1 %s2_offset), !bitwidth !9
  %tmp_9 = call i14 @_ssdm_op_BitConcatenate.i14.i1.i13(i1 %s2_offset_read, i13 0), !bitwidth !197
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_7)
  %tmp_3 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %n_read, i32 31), !bitwidth !9
  %sub_ln76 = sub i32 0, %n_read, !bitwidth !11
  %tmp_s = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %sub_ln76, i32 2, i32 31), !bitwidth !442
  %zext_ln76 = zext i30 %tmp_s to i31, !bitwidth !814
  %sub_ln76_1 = sub i31 0, %zext_ln76, !bitwidth !815
  %tmp_1 = call i30 @_ssdm_op_PartSelect.i30.i32.i32.i32(i32 %n_read, i32 2, i32 31), !bitwidth !442
  %zext_ln76_1 = zext i30 %tmp_1 to i31, !bitwidth !814
  %m = select i1 %tmp_3, i31 %sub_ln76_1, i31 %zext_ln76_1, !bitwidth !816
  store i32 0, i32* %idx, align 4, !bitwidth !212, !dep_idx !838, !deps !839
  store i5 0, i5* %idx9, align 1, !bitwidth !212, !dep_idx !842, !deps !843
  br label %while.body, !bitwidth !212

while.body:                                       ; preds = %while.body.split, %entry
  %idx9_load = load i5, i5* %idx9, align 1, !bitwidth !286, !dep_idx !846, !deps !847
  %zext_ln79_1 = zext i5 %idx9_load to i31, !bitwidth !814
  %icmp_ln79 = icmp slt i31 %zext_ln79_1, %m, !bitwidth !9
  %add_ln79_1 = add nuw i5 %idx9_load, 1, !bitwidth !286
  br i1 %icmp_ln79, label %while.body.split, label %while.end.loopexit, !llvm.loop !850, !bitwidth !212

while.body.split:                                 ; preds = %while.body
  %idx_load = load i32, i32* %idx, align 4, !bitwidth !11, !dep_idx !859, !deps !860
  %zext_ln79 = zext i5 %idx9_load to i64, !bitwidth !307
  %trunc_ln79 = trunc i32 %idx_load to i14, !bitwidth !197
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 0, i64 16, i64 8), !fpga.pragma.source !204
  call void (...) @_ssdm_op_SpecLoopName([20 x i8]* @empty_10)
  %p1 = getelementptr [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext_ln79, !bitwidth !58
  %add_ln73 = add i14 %trunc_ln79, %idx1_read, !bitwidth !197
  %add_ln73_1 = add i14 %tmp_9, %add_ln73, !bitwidth !197
  %zext_ln73 = zext i14 %add_ln73_1 to i64, !bitwidth !307
  %p2 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %zext_ln73, !bitwidth !7
  %add_ln82 = add i14 %add_ln73, 1, !bitwidth !197
  %add_ln82_1 = add i14 %tmp_9, %add_ln82, !bitwidth !197
  %zext_ln82 = zext i14 %add_ln82_1 to i64, !bitwidth !307
  %p2_1 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %zext_ln82, !bitwidth !7
  %p2_load = load i8, i8* %p2, align 1, !bitwidth !276
  %add_ln83 = add i14 %add_ln73, 2, !bitwidth !197
  %add_ln83_1 = add i14 %tmp_9, %add_ln83, !bitwidth !197
  %zext_ln83 = zext i14 %add_ln83_1 to i64, !bitwidth !307
  %p2_2 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %zext_ln83, !bitwidth !7
  %p2_1_load = load i8, i8* %p2_1, align 1, !bitwidth !276
  %add_ln84 = add i14 %add_ln73, 3, !bitwidth !197
  %add_ln84_1 = add i14 %tmp_9, %add_ln84, !bitwidth !197
  %zext_ln84 = zext i14 %add_ln84_1 to i64, !bitwidth !307
  %p2_3 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %zext_ln84, !bitwidth !7
  %p2_2_load = load i8, i8* %p2_2, align 1, !bitwidth !276
  %p2_3_load = load i8, i8* %p2_3, align 1, !bitwidth !276
  %tmp = call i32 @_ssdm_op_BitConcatenate.i32.i8.i8.i8.i8(i8 %p2_3_load, i8 %p2_2_load, i8 %p2_1_load, i8 %p2_load), !bitwidth !11
  store i32 %tmp, i32* %p1, align 4, !bitwidth !212
  %add_ln79 = add nuw i32 %idx_load, 4, !bitwidth !11
  store i32 %add_ln79, i32* %idx, align 4, !bitwidth !212, !dep_idx !863, !deps !864
  store i5 %add_ln79_1, i5* %idx9, align 1, !bitwidth !212, !dep_idx !867, !deps !868
  br label %while.body, !llvm.loop !850, !bitwidth !212

while.end.loopexit:                               ; preds = %while.body
  ret void, !bitwidth !212
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
!bitwidth_g = !{!4, !43, !108, !128, !146, !158, !177, !194}

!0 = !{!"clang version 7.0.0 "}
!1 = !{}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"reflow.full.lowering", i32 1}
!4 = !{void ([16384 x i8]*, i1, i32)* @sha_update, !5}
!5 = !{!6, !8, !10, !12, !14, !15, !16, !18, !20, !21, !23, !24, !26, !28, !30, !32, !33, !35, !37, !39, !41}
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
!28 = !{i64 127, !29}
!29 = !{i32 8, i32 64, i32 0, i32 1}
!30 = !{i64 128, !31}
!31 = !{i32 9, i32 64, i32 0, i32 1}
!32 = !{[18 x i8]* @empty_11, !7}
!33 = !{i32 64, !34}
!34 = !{i32 8, i32 32, i32 0, i32 1}
!35 = !{i32 -64, !36}
!36 = !{i32 7, i32 32, i32 0, i32 1}
!37 = !{i32 13, !38}
!38 = !{i32 5, i32 32, i32 0, i32 1}
!39 = !{i6 0, !40}
!40 = !{i32 1, i32 6, i32 0, i32 0}
!41 = !{i14 0, !42}
!42 = !{i32 1, i32 14, i32 0, i32 0}
!43 = !{void ()* @sha_transform, !44}
!44 = !{!12, !14, !15, !45, !47, !49, !51, !52, !54, !56, !57, !59, !61, !63, !64, !65, !67, !69, !71, !72, !74, !75, !76, !77, !79, !80, !81, !82, !84, !85, !86, !88, !89, !90, !23, !91, !93, !95, !96, !97, !98, !99, !100, !102, !103, !104, !105, !106}
!45 = !{i64 1, !46}
!46 = !{i32 2, i32 64, i32 0, i32 0}
!47 = !{i5 0, !48}
!48 = !{i32 1, i32 5, i32 0, i32 0}
!49 = !{i5 -16, !50}
!50 = !{i32 5, i32 5, i32 0, i32 1}
!51 = !{i5 1, !48}
!52 = !{i7 16, !53}
!53 = !{i32 6, i32 7, i32 0, i32 1}
!54 = !{i64 16, !55}
!55 = !{i32 6, i32 64, i32 0, i32 1}
!56 = !{[21 x i8]* @empty_4, !7}
!57 = !{[16 x i32]* @sha_info_data, !58}
!58 = !{i32 0, i32 0, i32 32, i32 2}
!59 = !{i64 0, !60}
!60 = !{i32 1, i32 64, i32 0, i32 0}
!61 = !{i7 -48, !62}
!62 = !{i32 7, i32 7, i32 0, i32 1}
!63 = !{i64 64, !29}
!64 = !{[21 x i8]* @empty_0, !7}
!65 = !{i7 -3, !66}
!66 = !{i32 3, i32 7, i32 0, i32 1}
!67 = !{i7 -8, !68}
!68 = !{i32 4, i32 7, i32 0, i32 1}
!69 = !{i7 -14, !70}
!70 = !{i32 5, i32 7, i32 0, i32 1}
!71 = !{i7 -16, !70}
!72 = !{i7 1, !73}
!73 = !{i32 1, i32 7, i32 0, i32 0}
!74 = !{[5 x i32]* @sha_info_digest, !58}
!75 = !{i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), !58}
!76 = !{i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), !58}
!77 = !{i64 2, !78}
!78 = !{i32 3, i32 64, i32 0, i32 0}
!79 = !{i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), !58}
!80 = !{i64 3, !78}
!81 = !{i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), !58}
!82 = !{i64 4, !83}
!83 = !{i32 4, i32 64, i32 0, i32 0}
!84 = !{i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), !58}
!85 = !{i5 -12, !50}
!86 = !{i6 20, !87}
!87 = !{i32 6, i32 6, i32 0, i32 1}
!88 = !{i64 20, !55}
!89 = !{[21 x i8]* @empty_1, !7}
!90 = !{i32 27, !22}
!91 = !{i32 -1, !92}
!92 = !{i32 1, i32 32, i32 0, i32 1}
!93 = !{i32 1518500249, !94}
!94 = !{i32 32, i32 32, i32 0, i32 1}
!95 = !{i32 2, !19}
!96 = !{i6 -24, !87}
!97 = !{[21 x i8]* @empty_2, !7}
!98 = !{i32 1859775393, !94}
!99 = !{i6 1, !40}
!100 = !{i6 -4, !101}
!101 = !{i32 3, i32 6, i32 0, i32 1}
!102 = !{i7 60, !62}
!103 = !{[21 x i8]* @empty, !7}
!104 = !{i32 -1894007588, !94}
!105 = !{[21 x i8]* @empty_8, !7}
!106 = !{i32 -899497514, !107}
!107 = !{i32 31, i32 32, i32 0, i32 1}
!108 = !{void ([16384 x i8]*)* @sha_stream_Pipeline_sha_stream_label1_VITIS_LOOP_207_1, !109}
!109 = !{!6, !12, !110, !14, !15, !91, !111, !113, !41, !115, !117, !118, !119, !120, !122, !124, !126, !59, !127, !6, !6}
!110 = !{[10 x i8]* @empty_3, !7}
!111 = !{i15 0, !112}
!112 = !{i32 1, i32 15, i32 0, i32 0}
!113 = !{i2 0, !114}
!114 = !{i32 1, i32 2, i32 0, i32 0}
!115 = !{i15 -16384, !116}
!116 = !{i32 15, i32 15, i32 0, i32 1}
!117 = !{i15 1, !112}
!118 = !{i2 1, !114}
!119 = !{[35 x i8]* @sha_stream_label1_VITIS_LOOP_207_1_str, !7}
!120 = !{i64 16384, !121}
!121 = !{i32 16, i32 64, i32 0, i32 1}
!122 = !{i14 -8192, !123}
!123 = !{i32 14, i32 14, i32 0, i32 1}
!124 = !{i13 0, !125}
!125 = !{i32 1, i32 13, i32 0, i32 0}
!126 = !{[16384 x i8]* @local_indata, !7}
!127 = !{i14 1, !42}
!128 = !{void ([16384 x i8]*, [2 x i32]*, [5 x i32]*)* @sha_stream, !129}
!129 = !{!6, !130, !131, !12, !14, !15, !132, !110, !91, !113, !133, !118, !135, !137, !59, !126, !138, !140, !142, !143, !145, !74}
!130 = !{!"Arg", i32 1, !58}
!131 = !{!"Arg", i32 2, !58}
!132 = !{[11 x i8]* @empty_5, !7}
!133 = !{i2 -2, !134}
!134 = !{i32 2, i32 2, i32 0, i32 1}
!135 = !{i64 2, !136}
!136 = !{i32 3, i32 64, i32 0, i32 1}
!137 = !{[18 x i8]* @empty_9, !7}
!138 = !{i3 0, !139}
!139 = !{i32 1, i32 3, i32 0, i32 0}
!140 = !{i3 -3, !141}
!141 = !{i32 3, i32 3, i32 0, i32 1}
!142 = !{i3 1, !139}
!143 = !{i64 5, !144}
!144 = !{i32 4, i32 64, i32 0, i32 1}
!145 = !{[18 x i8]* @empty_6, !7}
!146 = !{void ()* @sha_init, !147}
!147 = !{!14, !12, !15, !148, !149, !59, !75, !150, !45, !76, !152, !77, !79, !153, !80, !81, !154, !82, !84, !155, !157}
!148 = !{i32 1732584193, !94}
!149 = !{[5 x i32]* @sha_info_digest, !17}
!150 = !{i32 -271733879, !151}
!151 = !{i32 30, i32 32, i32 0, i32 1}
!152 = !{i32 -1732584194, !94}
!153 = !{i32 271733878, !151}
!154 = !{i32 -1009589776, !107}
!155 = !{i32* @sha_info_count_lo, !156}
!156 = !{i32 0, i32 0, i32 32, i32 0}
!157 = !{i32* @sha_info_count_hi, !156}
!158 = !{void ()* @sha_final, !159}
!159 = !{!14, !12, !15, !160, !161, !18, !162, !72, !163, !59, !164, !166, !167, !169, !171, !172, !174, !175, !176}
!160 = !{i32* @sha_info_count_lo, !58}
!161 = !{i32* @sha_info_count_hi, !58}
!162 = !{i32 8, !38}
!163 = !{[16 x i32]* @sha_info_data, !17}
!164 = !{i32 128, !165}
!165 = !{i32 9, i32 32, i32 0, i32 1}
!166 = !{i7 56, !62}
!167 = !{i6 -1, !168}
!168 = !{i32 1, i32 6, i32 0, i32 1}
!169 = !{i4 0, !170}
!170 = !{i32 1, i32 4, i32 0, i32 0}
!171 = !{i7 55, !62}
!172 = !{i64 14, !173}
!173 = !{i32 5, i32 64, i32 0, i32 0}
!174 = !{i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 14), !58}
!175 = !{i64 15, !173}
!176 = !{i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 15), !58}
!177 = !{void (i7, i4)* @local_memset, !178}
!178 = !{!179, !181, !12, !14, !15, !24, !183, !95, !184, !186, !188, !59, !189, !191, !192, !193}
!179 = !{!"Arg", i32 0, !180}
!180 = !{i32 7, i32 7, i32 0, i32 2}
!181 = !{!"Arg", i32 1, !182}
!182 = !{i32 4, i32 4, i32 0, i32 2}
!183 = !{i7 0, !73}
!184 = !{i31 0, !185}
!185 = !{i32 1, i32 31, i32 0, i32 0}
!186 = !{i30 0, !187}
!187 = !{i32 1, i32 30, i32 0, i32 0}
!188 = !{i30 1, !187}
!189 = !{i64 14, !190}
!190 = !{i32 5, i32 64, i32 0, i32 1}
!191 = !{i64 7, !144}
!192 = !{[20 x i8]* @empty_12, !7}
!193 = !{[16 x i32]* @sha_info_data, !156}
!194 = !{void ([16384 x i8]*, i1, i32, i14)* @local_memcpy, !195}
!195 = !{!6, !8, !10, !196, !12, !124, !14, !15, !23, !95, !184, !47, !51, !59, !54, !198, !199, !163, !127, !200, !202, !203}
!196 = !{!"Arg", i32 3, !197}
!197 = !{i32 14, i32 14, i32 0, i32 2}
!198 = !{i64 8, !190}
!199 = !{[20 x i8]* @empty_10, !7}
!200 = !{i14 2, !201}
!201 = !{i32 3, i32 14, i32 0, i32 1}
!202 = !{i14 3, !201}
!203 = !{i32 4, !25}
!204 = !{!"user"}
!205 = !{i32 30}
!206 = !{!207}
!207 = !{i32 28, !208}
!208 = !{!"WAR", !"indep"}
!209 = !{i32 31}
!210 = !{!211}
!211 = !{i32 29, !208}
!212 = !{i32 0, i32 0, i32 0, i32 2}
!213 = !{i32 28}
!214 = !{!215}
!215 = !{i32 30, !216}
!216 = !{!"RAW", !"indep"}
!217 = !{i32 3, i32 3, i32 0, i32 2}
!218 = !{i32 32, i32 32, i32 0, i32 0}
!219 = !{i32 26, i32 26, i32 0, i32 2}
!220 = !{i32 29}
!221 = !{!222}
!222 = !{i32 31, !216}
!223 = !{i32 36}
!224 = !{!225, !226}
!225 = !{i32 32, !216}
!226 = !{i32 33, !227}
!227 = !{!"WAW", !"indep"}
!228 = !{i32 37}
!229 = !{!230, !231}
!230 = !{i32 34, !216}
!231 = !{i32 35, !227}
!232 = !{i32 32}
!233 = !{!234, !235}
!234 = !{i32 36, !208}
!235 = !{i32 33, !236}
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
!254 = !{i32 34}
!255 = !{!256, !257}
!256 = !{i32 37, !208}
!257 = !{i32 35, !236}
!258 = !{i32 40}
!259 = !{!260, !262}
!260 = !{i32 38, !261}
!261 = !{!"RAW", !"indep", i32 1, !"*", i32 -1, i1 true}
!262 = !{i32 39, !227}
!263 = !{i32 38}
!264 = !{!265, !266}
!265 = !{i32 40, !236}
!266 = !{i32 39, !208}
!267 = !{i32 33}
!268 = !{!269, !270}
!269 = !{i32 36, !227}
!270 = !{i32 32, !261}
!271 = !{i32 35}
!272 = !{!273, !274}
!273 = !{i32 37, !227}
!274 = !{i32 34, !261}
!275 = !{i32 6, i32 6, i32 0, i32 2}
!276 = !{i32 8, i32 8, i32 0, i32 2}
!277 = !{i32 39}
!278 = !{!279, !280}
!279 = !{i32 40, !227}
!280 = !{i32 38, !216}
!281 = !{i32 0, i32 0, i32 5, i32 1}
!282 = !{i32 52}
!283 = !{!284, !285}
!284 = !{i32 50, !216}
!285 = !{i32 51, !227}
!286 = !{i32 5, i32 5, i32 0, i32 2}
!287 = !{i32 50}
!288 = !{!289, !290}
!289 = !{i32 52, !208}
!290 = !{i32 51, !236}
!291 = distinct !{!291, !292, !298, !299}
!292 = !{i32 101, i32 5, !293, null}
!293 = !{i32 786443, !294, i32 98, i32 5, !241, i32 0}
!294 = !{i32 786443, !295, !241}
!295 = !{i32 786478, i32 0, !241, !"sha_transform", !"sha_transform", null, !241, i32 92, !296, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @sha_transform, null, null, !249, i32 92}
!296 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !297, i32 0, i32 0}
!297 = !{null}
!298 = !{!"llvm.loop.name", !"sha_transform_label1"}
!299 = !{!"llvm.loop.tripcount", i32 16, i32 16, i32 16, !"user", !300}
!300 = !{i32 99, i32 9, !301, null}
!301 = !{i32 786443, !293, !241}
!302 = !{i32 0, i32 0, i32 7, i32 1}
!303 = !{i32 64}
!304 = !{!305, !306}
!305 = !{i32 53, !216}
!306 = !{i32 54, !227}
!307 = !{i32 64, i32 64, i32 0, i32 0}
!308 = !{i32 78}
!309 = !{!310, !311, !312, !313, !314, !315, !316, !317, !318}
!310 = !{i32 55, !216}
!311 = !{i32 56, !216}
!312 = !{i32 57, !216}
!313 = !{i32 58, !216}
!314 = !{i32 59, !227}
!315 = !{i32 60, !216}
!316 = !{i32 61, !216}
!317 = !{i32 62, !216}
!318 = !{i32 63, !216}
!319 = !{i32 51}
!320 = !{!321, !322}
!321 = !{i32 52, !227}
!322 = !{i32 50, !261}
!323 = !{i32 53}
!324 = !{!325, !326}
!325 = !{i32 64, !208}
!326 = !{i32 54, !236}
!327 = distinct !{!327, !328, !330, !331}
!328 = !{i32 107, i32 5, !329, null}
!329 = !{i32 786443, !294, i32 104, i32 5, !241, i32 0}
!330 = !{!"llvm.loop.name", !"sha_transform_label2"}
!331 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !332}
!332 = !{i32 105, i32 9, !333, null}
!333 = !{i32 786443, !329, !241}
!334 = !{i32 55}
!335 = !{!336, !337}
!336 = !{i32 78, !208}
!337 = !{i32 59, !338}
!338 = !{!"WAR", i32 1, !">", i32 3, i1 true}
!339 = !{i32 56}
!340 = !{!336, !341}
!341 = !{i32 59, !342}
!342 = !{!"WAR", i32 1, !">", i32 8, i1 true}
!343 = !{i32 57}
!344 = !{!336, !345}
!345 = !{i32 59, !346}
!346 = !{!"WAR", i32 1, !">", i32 14, i1 true}
!347 = !{i32 58}
!348 = !{!336, !349}
!349 = !{i32 59, !350}
!350 = !{!"WAR", i32 1, !">", i32 16, i1 true}
!351 = !{i32 59}
!352 = !{!353, !354, !356, !358, !360, !315, !316, !317, !318}
!353 = !{i32 78, !227}
!354 = !{i32 55, !355}
!355 = !{!"RAW", i32 1, !"<", i32 3, i1 true}
!356 = !{i32 56, !357}
!357 = !{!"RAW", i32 1, !"<", i32 8, i1 true}
!358 = !{i32 57, !359}
!359 = !{!"RAW", i32 1, !"<", i32 14, i1 true}
!360 = !{i32 58, !361}
!361 = !{!"RAW", i32 1, !"<", i32 16, i1 true}
!362 = !{i32 54}
!363 = !{!364, !365}
!364 = !{i32 64, !227}
!365 = !{i32 53, !261}
!366 = !{i32 127}
!367 = !{!368}
!368 = !{i32 65, !208}
!369 = !{i32 128}
!370 = !{!371}
!371 = !{i32 66, !208}
!372 = !{i32 129}
!373 = !{!374}
!374 = !{i32 67, !208}
!375 = !{i32 130}
!376 = !{!377}
!377 = !{i32 68, !208}
!378 = !{i32 131}
!379 = !{!380}
!380 = !{i32 69, !208}
!381 = !{i32 82}
!382 = !{!383, !384}
!383 = !{i32 70, !216}
!384 = !{i32 71, !227}
!385 = !{i32 81}
!386 = !{!387, !388}
!387 = !{i32 72, !216}
!388 = !{i32 73, !227}
!389 = !{i32 80}
!390 = !{!391, !392}
!391 = !{i32 74, !216}
!392 = !{i32 75, !227}
!393 = !{i32 79}
!394 = !{!395, !396}
!395 = !{i32 76, !216}
!396 = !{i32 77, !227}
!397 = !{i32 76}
!398 = !{!399, !400}
!399 = !{i32 79, !208}
!400 = !{i32 77, !236}
!401 = !{i32 74}
!402 = !{!403, !404}
!403 = !{i32 80, !208}
!404 = !{i32 75, !236}
!405 = !{i32 72}
!406 = !{!407, !408}
!407 = !{i32 81, !208}
!408 = !{i32 73, !236}
!409 = !{i32 70}
!410 = !{!411, !412}
!411 = !{i32 82, !208}
!412 = !{i32 71, !236}
!413 = distinct !{!413, !414, !416, !417}
!414 = !{i32 120, i32 5, !415, null}
!415 = !{i32 786443, !294, i32 117, i32 27, !241, i32 0}
!416 = !{!"llvm.loop.name", !"sha_transform_label3"}
!417 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !418}
!418 = !{i32 118, i32 9, !419, null}
!419 = !{i32 786443, !415, !241}
!420 = !{i32 0, i32 0, i32 6, i32 1}
!421 = !{i32 94}
!422 = !{!423, !424}
!423 = !{i32 83, !216}
!424 = !{i32 84, !227}
!425 = !{i32 93}
!426 = !{!427, !428}
!427 = !{i32 85, !216}
!428 = !{i32 86, !227}
!429 = !{i32 92}
!430 = !{!431, !432}
!431 = !{i32 87, !216}
!432 = !{i32 88, !227}
!433 = !{i32 91}
!434 = !{!435, !436}
!435 = !{i32 89, !216}
!436 = !{i32 90, !227}
!437 = !{i32 27, i32 27, i32 0, i32 2}
!438 = !{i32 60}
!439 = !{!336, !440}
!440 = !{i32 59, !208}
!441 = !{i32 2, i32 2, i32 0, i32 2}
!442 = !{i32 30, i32 30, i32 0, i32 2}
!443 = !{i32 71}
!444 = !{!445, !446}
!445 = !{i32 82, !227}
!446 = !{i32 70, !261}
!447 = !{i32 73}
!448 = !{!449, !450}
!449 = !{i32 81, !227}
!450 = !{i32 72, !261}
!451 = !{i32 75}
!452 = !{!453, !454}
!453 = !{i32 80, !227}
!454 = !{i32 74, !261}
!455 = !{i32 77}
!456 = !{!457, !458}
!457 = !{i32 79, !227}
!458 = !{i32 76, !261}
!459 = !{i32 89}
!460 = !{!461, !462}
!461 = !{i32 91, !208}
!462 = !{i32 90, !236}
!463 = !{i32 87}
!464 = !{!465, !466}
!465 = !{i32 92, !208}
!466 = !{i32 88, !236}
!467 = !{i32 85}
!468 = !{!469, !470}
!469 = !{i32 93, !208}
!470 = !{i32 86, !236}
!471 = !{i32 83}
!472 = !{!473, !474}
!473 = !{i32 94, !208}
!474 = !{i32 84, !236}
!475 = distinct !{!475, !476, !478, !479}
!476 = !{i32 124, i32 5, !477, null}
!477 = !{i32 786443, !294, i32 121, i32 27, !241, i32 0}
!478 = !{!"llvm.loop.name", !"sha_transform_label4"}
!479 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !480}
!480 = !{i32 122, i32 9, !481, null}
!481 = !{i32 786443, !477, !241}
!482 = !{i32 106}
!483 = !{!484, !485}
!484 = !{i32 95, !216}
!485 = !{i32 96, !227}
!486 = !{i32 105}
!487 = !{!488, !489}
!488 = !{i32 97, !216}
!489 = !{i32 98, !227}
!490 = !{i32 104}
!491 = !{!492, !493}
!492 = !{i32 99, !216}
!493 = !{i32 100, !227}
!494 = !{i32 103}
!495 = !{!496, !497}
!496 = !{i32 101, !216}
!497 = !{i32 102, !227}
!498 = !{i32 61}
!499 = !{i32 84}
!500 = !{!501, !502}
!501 = !{i32 94, !227}
!502 = !{i32 83, !261}
!503 = !{i32 86}
!504 = !{!505, !506}
!505 = !{i32 93, !227}
!506 = !{i32 85, !261}
!507 = !{i32 88}
!508 = !{!509, !510}
!509 = !{i32 92, !227}
!510 = !{i32 87, !261}
!511 = !{i32 90}
!512 = !{!513, !514}
!513 = !{i32 91, !227}
!514 = !{i32 89, !261}
!515 = !{i32 101}
!516 = !{!517, !518}
!517 = !{i32 103, !208}
!518 = !{i32 102, !236}
!519 = !{i32 99}
!520 = !{!521, !522}
!521 = !{i32 104, !208}
!522 = !{i32 100, !236}
!523 = !{i32 97}
!524 = !{!525, !526}
!525 = !{i32 105, !208}
!526 = !{i32 98, !236}
!527 = !{i32 95}
!528 = !{!529, !530}
!529 = !{i32 106, !208}
!530 = !{i32 96, !236}
!531 = distinct !{!531, !532, !534, !535}
!532 = !{i32 128, i32 5, !533, null}
!533 = !{i32 786443, !294, i32 125, i32 27, !241, i32 0}
!534 = !{!"llvm.loop.name", !"sha_transform_label5"}
!535 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !536}
!536 = !{i32 126, i32 9, !537, null}
!537 = !{i32 786443, !533, !241}
!538 = !{i32 124}
!539 = !{!540, !541}
!540 = !{i32 107, !216}
!541 = !{i32 108, !227}
!542 = !{i32 123}
!543 = !{!544, !545}
!544 = !{i32 109, !216}
!545 = !{i32 110, !227}
!546 = !{i32 122}
!547 = !{!548, !549}
!548 = !{i32 111, !216}
!549 = !{i32 112, !227}
!550 = !{i32 121}
!551 = !{!552, !553}
!552 = !{i32 113, !216}
!553 = !{i32 114, !227}
!554 = !{i32 126}
!555 = !{!556, !557, !558}
!556 = !{i32 115, !216}
!557 = !{i32 116, !216}
!558 = !{i32 117, !227}
!559 = !{i32 125}
!560 = !{!561, !562, !563}
!561 = !{i32 118, !216}
!562 = !{i32 119, !216}
!563 = !{i32 120, !227}
!564 = !{i32 62}
!565 = !{i32 96}
!566 = !{!567, !568}
!567 = !{i32 106, !227}
!568 = !{i32 95, !261}
!569 = !{i32 98}
!570 = !{!571, !572}
!571 = !{i32 105, !227}
!572 = !{i32 97, !261}
!573 = !{i32 100}
!574 = !{!575, !576}
!575 = !{i32 104, !227}
!576 = !{i32 99, !261}
!577 = !{i32 102}
!578 = !{!579, !580}
!579 = !{i32 103, !227}
!580 = !{i32 101, !261}
!581 = !{i32 113}
!582 = !{!583, !584}
!583 = !{i32 121, !208}
!584 = !{i32 114, !236}
!585 = !{i32 111}
!586 = !{!587, !588}
!587 = !{i32 122, !208}
!588 = !{i32 112, !236}
!589 = !{i32 109}
!590 = !{!591, !592}
!591 = !{i32 123, !208}
!592 = !{i32 110, !236}
!593 = !{i32 107}
!594 = !{!595, !596}
!595 = !{i32 124, !208}
!596 = !{i32 108, !236}
!597 = distinct !{!597, !598, !600, !601}
!598 = !{i32 132, i32 5, !599, null}
!599 = !{i32 786443, !294, i32 129, i32 27, !241, i32 0}
!600 = !{!"llvm.loop.name", !"sha_transform_label6"}
!601 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !602}
!602 = !{i32 130, i32 9, !603, null}
!603 = !{i32 786443, !599, !241}
!604 = !{i32 119}
!605 = !{!606, !607}
!606 = !{i32 125, !208}
!607 = !{i32 120, !236}
!608 = !{i32 116}
!609 = !{!610, !611}
!610 = !{i32 126, !208}
!611 = !{i32 117, !236}
!612 = !{i32 63}
!613 = !{i32 108}
!614 = !{!615, !616}
!615 = !{i32 124, !227}
!616 = !{i32 107, !261}
!617 = !{i32 110}
!618 = !{!619, !620}
!619 = !{i32 123, !227}
!620 = !{i32 109, !261}
!621 = !{i32 112}
!622 = !{!623, !624}
!623 = !{i32 122, !227}
!624 = !{i32 111, !261}
!625 = !{i32 114}
!626 = !{!627, !628}
!627 = !{i32 121, !227}
!628 = !{i32 113, !261}
!629 = !{i32 117}
!630 = !{!631, !556, !632}
!631 = !{i32 126, !227}
!632 = !{i32 116, !261}
!633 = !{i32 120}
!634 = !{!635, !561, !636}
!635 = !{i32 125, !227}
!636 = !{i32 119, !261}
!637 = !{i32 118}
!638 = !{!606, !639}
!639 = !{i32 120, !208}
!640 = !{i32 115}
!641 = !{!610, !642}
!642 = !{i32 117, !208}
!643 = !{i32 65}
!644 = !{!645}
!645 = !{i32 127, !216}
!646 = !{i32 66}
!647 = !{!648}
!648 = !{i32 128, !216}
!649 = !{i32 67}
!650 = !{!651}
!651 = !{i32 129, !216}
!652 = !{i32 68}
!653 = !{!654}
!654 = !{i32 130, !216}
!655 = !{i32 69}
!656 = !{!657}
!657 = !{i32 131, !216}
!658 = !{i32 0, i32 0, i32 14, i32 1}
!659 = !{i32 0, i32 0, i32 2, i32 1}
!660 = !{i32 0, i32 0, i32 15, i32 1}
!661 = !{i32 25}
!662 = !{!663, !664}
!663 = !{i32 19, !216}
!664 = !{i32 20, !227}
!665 = !{i32 27}
!666 = !{!667, !668}
!667 = !{i32 21, !216}
!668 = !{i32 22, !227}
!669 = !{i32 26}
!670 = !{!671, !672}
!671 = !{i32 23, !216}
!672 = !{i32 24, !227}
!673 = !{i32 15, i32 15, i32 0, i32 2}
!674 = !{i32 19}
!675 = !{!676, !677}
!676 = !{i32 25, !208}
!677 = !{i32 20, !236}
!678 = !{i32 23}
!679 = !{!680, !681}
!680 = !{i32 26, !208}
!681 = !{i32 24, !236}
!682 = !{i32 21}
!683 = !{!684, !685}
!684 = !{i32 27, !208}
!685 = !{i32 22, !236}
!686 = !{i32 20}
!687 = !{!688, !689}
!688 = !{i32 25, !227}
!689 = !{i32 19, !261}
!690 = !{i32 22}
!691 = !{!692, !693}
!692 = !{i32 27, !227}
!693 = !{i32 21, !261}
!694 = !{i32 24}
!695 = !{!696, !697}
!696 = !{i32 26, !227}
!697 = !{i32 23, !261}
!698 = distinct !{!698, !699, !717, !718, !719, !721}
!699 = !{i32 207, i32 20, !700, null}
!700 = !{i32 786443, !701, i32 207, i32 20, !241, i32 0}
!701 = !{i32 786443, !702, i32 205, i32 29, !241, i32 0}
!702 = !{i32 786443, !703, i32 205, i32 5, !241, i32 0}
!703 = !{i32 786443, !704, !241}
!704 = !{i32 786443, !705, i32 205, i32 5, !241, i32 0}
!705 = !{i32 786443, !706, !241}
!706 = !{i32 786478, i32 0, !241, !"sha_stream", !"sha_stream", null, !241, i32 196, !707, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !249, i32 200}
!707 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !708, i32 0, i32 0}
!708 = !{null, !709, !713, !715}
!709 = !{i32 786447, null, !"", !245, i32 0, i64 64, i64 0, i32 0, i32 0, !710}
!710 = !{i32 786433, null, !"", null, i32 0, i64 65536, i64 0, i32 0, i32 0, !246, !711, i32 0, null, null}
!711 = !{!712}
!712 = !{i32 786465, i64 0, i64 8191}
!713 = !{i32 786447, null, !"", !245, i32 0, i64 64, i64 0, i32 0, i32 0, !714}
!714 = !{i32 786470, null, !"", !245, i32 0, i64 0, i64 0, i32 0, i32 0, !248}
!715 = !{i32 786447, null, !"", !245, i32 0, i64 64, i64 0, i32 0, i32 0, !716}
!716 = !{i32 786468, null, !"unsigned int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 7}
!717 = !{i32 210, i32 9, !700, null}
!718 = !{!"llvm.loop.name", !"VITIS_LOOP_207_1"}
!719 = !{!"llvm.loop.tripcount", i32 8192, i32 8192, i32 8192, !"user", !720}
!720 = !{i32 208, i32 9, !700, null}
!721 = !{!"llvm.loop.pipeline.enable", i32 -1, i1 false, i8 -1, !"auto"}
!722 = !{!1}
!723 = !{i32 9}
!724 = !{!725}
!725 = !{i32 0, !216}
!726 = !{i32 6}
!727 = !{!728, !730, !731}
!728 = !{i32 1, !729}
!729 = !{!"Unknown", !"indep"}
!730 = !{i32 0, !729}
!731 = !{i32 2, !216}
!732 = !{i32 5}
!733 = !{!734, !735}
!734 = !{i32 3, !216}
!735 = !{i32 4, !227}
!736 = !{i32 3}
!737 = !{!738, !739}
!738 = !{i32 5, !208}
!739 = !{i32 4, !236}
!740 = distinct !{!740, !741, !743, !744}
!741 = !{i32 221, i32 5, !742, null}
!742 = !{i32 786443, !705, i32 216, i32 5, !241, i32 0}
!743 = !{!"llvm.loop.name", !"sha_stream_label0"}
!744 = !{!"llvm.loop.tripcount", i32 2, i32 2, i32 2, !"user", !745}
!745 = !{i32 217, i32 9, !746, null}
!746 = !{i32 786443, !742, !241}
!747 = !{!748, !749, !728, !750}
!748 = !{i32 9, !208}
!749 = !{i32 6, !729}
!750 = !{i32 2, !729}
!751 = !{i32 4}
!752 = !{!753, !754}
!753 = !{i32 5, !227}
!754 = !{i32 3, !261}
!755 = !{i32 0, i32 0, i32 3, i32 1}
!756 = !{i32 1}
!757 = !{!749, !730, !750}
!758 = !{i32 10}
!759 = !{!760, !761}
!760 = !{i32 7, !216}
!761 = !{i32 8, !227}
!762 = !{i32 7}
!763 = !{!764, !765}
!764 = !{i32 10, !208}
!765 = !{i32 8, !236}
!766 = distinct !{!766, !767, !769, !770}
!767 = !{i32 228, i32 5, !768, null}
!768 = !{i32 786443, !705, i32 225, i32 5, !241, i32 0}
!769 = !{!"llvm.loop.name", !"sha_stream_label2"}
!770 = !{!"llvm.loop.tripcount", i32 5, i32 5, i32 5, !"user", !771}
!771 = !{i32 226, i32 9, !772, null}
!772 = !{i32 786443, !768, !241}
!773 = !{i32 2}
!774 = !{!775, !728, !730}
!775 = !{i32 6, !208}
!776 = !{i32 8}
!777 = !{!778, !779}
!778 = !{i32 10, !227}
!779 = !{i32 7, !261}
!780 = !{i32 7, i32 7, i32 0, i32 0}
!781 = !{i32 18}
!782 = !{!783, !784, !785, !786, !787, !788, !789}
!783 = !{i32 11, !227}
!784 = !{i32 12, !216}
!785 = !{i32 13, !227}
!786 = !{i32 14, !227}
!787 = !{i32 15, !227}
!788 = !{i32 16, !227}
!789 = !{i32 17, !216}
!790 = !{i32 11}
!791 = !{!792, !784, !785, !786, !787, !788, !789}
!792 = !{i32 18, !227}
!793 = !{i32 12}
!794 = !{!795, !796, !797, !798, !799, !800, !801}
!795 = !{i32 18, !208}
!796 = !{i32 11, !208}
!797 = !{i32 13, !208}
!798 = !{i32 14, !208}
!799 = !{i32 15, !208}
!800 = !{i32 16, !208}
!801 = !{i32 17, !729}
!802 = !{i32 13}
!803 = !{!792, !783, !784, !786, !787, !788, !789}
!804 = !{i32 14}
!805 = !{!792, !783, !784, !785, !787, !788, !789}
!806 = !{i32 15}
!807 = !{!792, !783, !784, !785, !786, !789}
!808 = !{i32 16}
!809 = !{i32 17}
!810 = !{!795, !796, !811, !797, !798, !799, !800}
!811 = !{i32 12, !729}
!812 = !{i32 0, i32 0, i32 30, i32 1}
!813 = !{i32 30, i32 30, i32 0, i32 1}
!814 = !{i32 31, i32 31, i32 0, i32 0}
!815 = !{i32 31, i32 31, i32 0, i32 1}
!816 = !{i32 31, i32 31, i32 0, i32 2}
!817 = !{i32 49}
!818 = !{!819, !820}
!819 = !{i32 47, !216}
!820 = !{i32 48, !227}
!821 = !{i32 47}
!822 = !{!823, !824}
!823 = !{i32 49, !208}
!824 = !{i32 48, !236}
!825 = distinct !{!825, !826, !831, !832}
!826 = !{i32 68, i32 5, !827, null}
!827 = !{i32 786443, !828, !241}
!828 = !{i32 786478, i32 0, !241, !"local_memset", !"local_memset", null, !241, i32 55, !829, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i7, i4)* @local_memset, null, null, !249, i32 55}
!829 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !830, i32 0, i32 0}
!830 = !{null, !715, !248, !248, !248}
!831 = !{!"llvm.loop.name", !"local_memset_label1"}
!832 = !{!"llvm.loop.tripcount", i32 0, i32 14, i32 7, !"user", !833}
!833 = !{i32 66, i32 9, !827, null}
!834 = !{i32 48}
!835 = !{!836, !837}
!836 = !{i32 49, !227}
!837 = !{i32 47, !261}
!838 = !{i32 46}
!839 = !{!840, !841}
!840 = !{i32 41, !216}
!841 = !{i32 42, !227}
!842 = !{i32 45}
!843 = !{!844, !845}
!844 = !{i32 43, !216}
!845 = !{i32 44, !227}
!846 = !{i32 43}
!847 = !{!848, !849}
!848 = !{i32 45, !208}
!849 = !{i32 44, !236}
!850 = distinct !{!850, !851, !856, !857}
!851 = !{i32 88, i32 5, !852, null}
!852 = !{i32 786443, !853, !241}
!853 = !{i32 786478, i32 0, !241, !"local_memcpy", !"local_memcpy", null, !241, i32 72, !854, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !249, i32 72}
!854 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !855, i32 0, i32 0}
!855 = !{null, !715, !244, !248}
!856 = !{!"llvm.loop.name", !"local_memcpy_label3"}
!857 = !{!"llvm.loop.tripcount", i32 0, i32 16, i32 8, !"user", !858}
!858 = !{i32 80, i32 9, !852, null}
!859 = !{i32 41}
!860 = !{!861, !862}
!861 = !{i32 46, !208}
!862 = !{i32 42, !236}
!863 = !{i32 42}
!864 = !{!865, !866}
!865 = !{i32 46, !227}
!866 = !{i32 41, !261}
!867 = !{i32 44}
!868 = !{!869, !870}
!869 = !{i32 45, !227}
!870 = !{i32 43, !261}
