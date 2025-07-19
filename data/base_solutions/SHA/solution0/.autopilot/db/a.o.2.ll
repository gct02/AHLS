; ModuleID = 'data/base_solutions/SHA/solution0/.autopilot/db/a.o.2.bc'
source_filename = "data/base_solutions/SHA/solution0/.autopilot/db/a.o.2.bc"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

@sha_info_digest = internal unnamed_addr global [5 x i32] zeroinitializer, align 512
@sha_info_data = internal unnamed_addr global [16 x i32] zeroinitializer, align 512
@sha_info_count_lo = internal unnamed_addr global i32 0, align 512
@sha_info_count_hi = internal unnamed_addr global i32 0, align 512
@local_indata = internal global [2 x [8192 x i8]] zeroinitializer, align 512
@0 = internal unnamed_addr constant [18 x i8] c"sha_stream_label2\00"
@1 = internal unnamed_addr constant [11 x i8] c"sha_stream\00"
@2 = internal unnamed_addr constant [21 x i8] c"sha_transform_label1\00"
@3 = internal unnamed_addr constant [10 x i8] c"ap_memory\00"
@4 = internal unnamed_addr constant [20 x i8] c"local_memset_label1\00"
@5 = internal unnamed_addr constant [17 x i8] c"VITIS_LOOP_207_1\00"
@6 = internal unnamed_addr constant [18 x i8] c"sha_stream_label1\00"
@7 = internal unnamed_addr constant [18 x i8] c"sha_update_label4\00"
@8 = internal unnamed_addr constant [20 x i8] c"local_memcpy_label3\00"
@9 = internal unnamed_addr constant [21 x i8] c"sha_transform_label4\00"
@10 = internal unnamed_addr constant [21 x i8] c"sha_transform_label3\00"
@11 = internal unnamed_addr constant [21 x i8] c"sha_transform_label2\00"
@12 = internal unnamed_addr constant [21 x i8] c"sha_transform_label5\00"
@13 = internal unnamed_addr constant [1 x i8] zeroinitializer
@14 = internal unnamed_addr constant [21 x i8] c"sha_transform_label6\00"
@15 = internal unnamed_addr constant [18 x i8] c"sha_stream_label0\00"

; Function Attrs: noinline
define internal fastcc void @sha_update([2 x [8192 x i8]]* noalias nocapture align 512 %buffer, i1 %buffer.offset, i32 %count) #0 {
entry:
  %count.cast = trunc i32 %count to i14
  call void (...) @_ssdm_SpecKeepAssert(i1 %buffer.offset), !hlsrange !4
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @13), !fpga.pragma.source !5
  %sha_info_count_lo.load = load i32, i32* @sha_info_count_lo, align 512
  %shl.ln155 = shl i32 %count, 3
  %add.ln155 = add i32 %sha_info_count_lo.load, %shl.ln155
  %icmp.ln155 = icmp ult i32 %add.ln155, %sha_info_count_lo.load
  %sha_info_count_hi.load = load i32, i32* @sha_info_count_hi, align 512
  %add.ln156 = add i32 %sha_info_count_hi.load, 1
  %select.ln155 = select i1 %icmp.ln155, i32 %add.ln156, i32 %sha_info_count_hi.load
  store i32 %add.ln155, i32* @sha_info_count_lo, align 512
  %lshr.ln159 = lshr i32 %count, 29
  %add.ln159 = add i32 %select.ln155, %lshr.ln159
  %icmp.ln162 = icmp sgt i32 %count, 63
  store i32 %add.ln159, i32* @sha_info_count_hi, align 512
  br label %while.body

while.body:                                       ; preds = %while.body.split, %entry
  %count.addr.02 = phi i32 [ %count, %entry ], [ %add.ln167, %while.body.split ]
  %idx = phi i32 [ 0, %entry ], [ %add.ln162, %while.body.split ]
  %trunc.ln162 = trunc i32 %idx to i14
  %icmp.ln162.1 = icmp sgt i32 %count.addr.02, 63
  br i1 %icmp.ln162.1, label %while.body.split, label %while.end.loopexit, !llvm.loop !6

while.body.split:                                 ; preds = %while.body
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 127, i64 128, i64 127), !fpga.pragma.source !5
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @7)
  call fastcc void @local_memcpy([2 x [8192 x i8]]* noalias nocapture align 512 %buffer, i1 %buffer.offset, i32 64, i14 %trunc.ln162)
  call fastcc void @sha_transform()
  %add.ln167 = add nuw nsw i32 %count.addr.02, -64
  %add.ln162 = add nuw i32 %idx, 64
  br label %while.body, !llvm.loop !6

while.end.loopexit:                               ; preds = %while.body
  %trunc.ln162.1 = trunc i32 %count to i6
  %and.ln162 = and i14 %count.cast, -64
  %zext.ln169 = zext i6 %trunc.ln162.1 to i32
  %select.ln169 = select i1 %icmp.ln162, i32 %zext.ln169, i32 %count
  %select.ln169.1 = select i1 %icmp.ln162, i14 %and.ln162, i14 0
  call fastcc void @local_memcpy([2 x [8192 x i8]]* noalias nocapture align 512 %buffer, i1 %buffer.offset, i32 %select.ln169, i14 %select.ln169.1)
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @sha_transform() unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @13), !fpga.pragma.source !5
  %W = alloca [80 x i32], i64 1, align 512
  br label %for.inc

for.inc:                                          ; preds = %for.inc.split, %entry
  %i = phi i5 [ %add.ln98, %for.inc.split ], [ 0, %entry ]
  %zext.ln98 = zext i5 %i to i64
  %icmp.ln98 = icmp eq i5 %i, -16
  br i1 %icmp.ln98, label %for.inc21.preheader, label %for.inc.split, !llvm.loop !23

for.inc21.preheader:                              ; preds = %for.inc
  br label %for.inc21

for.inc.split:                                    ; preds = %for.inc
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 16, i64 16, i64 16), !fpga.pragma.source !5
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @2)
  %sha_info_data.addr = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext.ln98
  %sha_info_data.load = load i32, i32* %sha_info_data.addr, align 4
  %W.addr = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext.ln98
  store i32 %sha_info_data.load, i32* %W.addr, align 4
  %add.ln98 = add nuw i5 %i, 1
  br label %for.inc, !llvm.loop !23

for.inc21:                                        ; preds = %for.inc21.split, %for.inc21.preheader
  %i.1 = phi i7 [ %add.ln104, %for.inc21.split ], [ 16, %for.inc21.preheader ]
  %zext.ln104 = zext i7 %i.1 to i64
  %icmp.ln104 = icmp eq i7 %i.1, -48
  br i1 %icmp.ln104, label %for.end23, label %for.inc21.split, !llvm.loop !34

for.inc21.split:                                  ; preds = %for.inc21
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !5
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @11)
  %add.ln106 = add nuw i7 %i.1, -3
  %zext.ln106 = zext i7 %add.ln106 to i64
  %W.addr.1 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext.ln106
  %W.load = load i32, i32* %W.addr.1, align 4
  %add.ln106.1 = add nuw i7 %i.1, -8
  %zext.ln106.1 = zext i7 %add.ln106.1 to i64
  %W.addr.2 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext.ln106.1
  %W.load.1 = load i32, i32* %W.addr.2, align 4
  %add.ln106.2 = add nuw i7 %i.1, -14
  %zext.ln106.2 = zext i7 %add.ln106.2 to i64
  %W.addr.3 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext.ln106.2
  %W.load.2 = load i32, i32* %W.addr.3, align 4
  %add.ln106.3 = add nuw nsw i7 %i.1, -16
  %zext.ln106.3 = zext i7 %add.ln106.3 to i64
  %W.addr.4 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext.ln106.3
  %W.load.3 = load i32, i32* %W.addr.4, align 4
  %xor.ln106 = xor i32 %W.load.1, %W.load
  %xor.ln106.1 = xor i32 %W.load.2, %W.load.3
  %xor.ln106.2 = xor i32 %xor.ln106.1, %xor.ln106
  %W.addr.5 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext.ln104
  store i32 %xor.ln106.2, i32* %W.addr.5, align 4
  %add.ln104 = add nuw i7 %i.1, 1
  br label %for.inc21, !llvm.loop !34

for.end23:                                        ; preds = %for.inc21
  %A = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512
  %B = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4
  %C = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8
  %D = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4
  %E = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16
  br label %for.inc38

for.inc38:                                        ; preds = %for.inc38.split, %for.end23
  %i.2 = phi i5 [ %add.ln117, %for.inc38.split ], [ 0, %for.end23 ]
  %B.3 = phi i32 [ %A.9, %for.inc38.split ], [ %A, %for.end23 ]
  %B.2 = phi i32 [ %B.3, %for.inc38.split ], [ %B, %for.end23 ]
  %D.3 = phi i32 [ %C.2, %for.inc38.split ], [ %C, %for.end23 ]
  %E.3 = phi i32 [ %D.3, %for.inc38.split ], [ %D, %for.end23 ]
  %E.2 = phi i32 [ %E.3, %for.inc38.split ], [ %E, %for.end23 ]
  %zext.ln94 = zext i5 %i.2 to i64
  %icmp.ln117 = icmp eq i5 %i.2, -12
  br i1 %icmp.ln117, label %for.inc60.preheader, label %for.inc38.split, !llvm.loop !41

for.inc60.preheader:                              ; preds = %for.inc38
  br label %for.inc60

for.inc38.split:                                  ; preds = %for.inc38
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !5
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @10)
  %shl.ln119 = shl i32 %B.3, 5
  %lshr.ln119 = lshr i32 %B.3, 27
  %W.addr.6 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext.ln94
  %W.load.4 = load i32, i32* %W.addr.6, align 4
  %xor.ln119 = xor i32 %B.2, -1
  %and.ln119 = and i32 %D.3, %B.2
  %and.ln119.1 = and i32 %E.3, %xor.ln119
  %or.ln119 = or i32 %and.ln119.1, %and.ln119
  %or.ln119.1 = or i32 %shl.ln119, %lshr.ln119
  %add.ln119 = add i32 %W.load.4, %or.ln119.1
  %add.ln119.1 = add i32 %or.ln119, 1518500249
  %add.ln119.2 = add i32 %add.ln119.1, %E.2
  %A.9 = add i32 %add.ln119.2, %add.ln119
  %shl.ln119.1 = shl i32 %B.2, 30
  %lshr.ln119.1 = lshr i32 %B.2, 2
  %C.2 = or i32 %shl.ln119.1, %lshr.ln119.1
  %add.ln117 = add nuw i5 %i.2, 1
  br label %for.inc38, !llvm.loop !41

for.inc60:                                        ; preds = %for.inc60.split, %for.inc60.preheader
  %i.3 = phi i6 [ %add.ln121, %for.inc60.split ], [ 20, %for.inc60.preheader ]
  %B.6 = phi i32 [ %A.10, %for.inc60.split ], [ %B.3, %for.inc60.preheader ]
  %B.5 = phi i32 [ %B.6, %for.inc60.split ], [ %B.2, %for.inc60.preheader ]
  %D.6 = phi i32 [ %C.4, %for.inc60.split ], [ %D.3, %for.inc60.preheader ]
  %E.6 = phi i32 [ %D.6, %for.inc60.split ], [ %E.3, %for.inc60.preheader ]
  %E.5 = phi i32 [ %E.6, %for.inc60.split ], [ %E.2, %for.inc60.preheader ]
  %zext.ln94.1 = zext i6 %i.3 to i64
  %icmp.ln121 = icmp eq i6 %i.3, -24
  br i1 %icmp.ln121, label %for.inc85.preheader, label %for.inc60.split, !llvm.loop !48

for.inc85.preheader:                              ; preds = %for.inc60
  br label %for.inc85

for.inc60.split:                                  ; preds = %for.inc60
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !5
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @9)
  %shl.ln123 = shl i32 %B.6, 5
  %lshr.ln123 = lshr i32 %B.6, 27
  %W.addr.7 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext.ln94.1
  %W.load.5 = load i32, i32* %W.addr.7, align 4
  %xor.ln123 = xor i32 %B.5, %E.6
  %xor.ln123.1 = xor i32 %xor.ln123, %D.6
  %or.ln123 = or i32 %shl.ln123, %lshr.ln123
  %add.ln123 = add i32 %W.load.5, %or.ln123
  %add.ln123.1 = add i32 %xor.ln123.1, 1859775393
  %add.ln123.2 = add i32 %add.ln123.1, %E.5
  %A.10 = add i32 %add.ln123.2, %add.ln123
  %shl.ln123.1 = shl i32 %B.5, 30
  %lshr.ln123.1 = lshr i32 %B.5, 2
  %C.4 = or i32 %shl.ln123.1, %lshr.ln123.1
  %add.ln121 = add nuw i6 %i.3, 1
  br label %for.inc60, !llvm.loop !48

for.inc85:                                        ; preds = %for.inc85.split, %for.inc85.preheader
  %i.4 = phi i6 [ %add.ln125, %for.inc85.split ], [ -24, %for.inc85.preheader ]
  %B.9 = phi i32 [ %A.11, %for.inc85.split ], [ %B.6, %for.inc85.preheader ]
  %B.8 = phi i32 [ %B.9, %for.inc85.split ], [ %B.5, %for.inc85.preheader ]
  %D.9 = phi i32 [ %C.6, %for.inc85.split ], [ %D.6, %for.inc85.preheader ]
  %E.9 = phi i32 [ %D.9, %for.inc85.split ], [ %E.6, %for.inc85.preheader ]
  %E.8 = phi i32 [ %E.9, %for.inc85.split ], [ %E.5, %for.inc85.preheader ]
  %zext.ln94.2 = zext i6 %i.4 to i64
  %icmp.ln125 = icmp eq i6 %i.4, -4
  br i1 %icmp.ln125, label %for.inc107.preheader, label %for.inc85.split, !llvm.loop !55

for.inc107.preheader:                             ; preds = %for.inc85
  br label %for.inc107

for.inc85.split:                                  ; preds = %for.inc85
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !5
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @12)
  %shl.ln127 = shl i32 %B.9, 5
  %lshr.ln127 = lshr i32 %B.9, 27
  %W.addr.8 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext.ln94.2
  %W.load.6 = load i32, i32* %W.addr.8, align 4
  %or.ln127 = or i32 %E.9, %D.9
  %and.ln127 = and i32 %or.ln127, %B.8
  %and.ln127.1 = and i32 %E.9, %D.9
  %or.ln127.1 = or i32 %and.ln127, %and.ln127.1
  %or.ln127.2 = or i32 %shl.ln127, %lshr.ln127
  %add.ln127 = add i32 %W.load.6, %or.ln127.2
  %add.ln127.1 = add i32 %E.8, %or.ln127.1
  %add.ln127.2 = add i32 %add.ln127.1, -1894007588
  %A.11 = add i32 %add.ln127.2, %add.ln127
  %shl.ln127.1 = shl i32 %B.8, 30
  %lshr.ln127.1 = lshr i32 %B.8, 2
  %C.6 = or i32 %shl.ln127.1, %lshr.ln127.1
  %add.ln125 = add nuw i6 %i.4, 1
  br label %for.inc85, !llvm.loop !55

for.inc107:                                       ; preds = %for.inc107.split, %for.inc107.preheader
  %i.5 = phi i7 [ %add.ln129, %for.inc107.split ], [ 60, %for.inc107.preheader ]
  %A.12 = phi i32 [ %temp, %for.inc107.split ], [ %B.9, %for.inc107.preheader ]
  %B.10 = phi i32 [ %A.12, %for.inc107.split ], [ %B.8, %for.inc107.preheader ]
  %C.9 = phi i32 [ %C.8, %for.inc107.split ], [ %D.9, %for.inc107.preheader ]
  %D.12 = phi i32 [ %C.9, %for.inc107.split ], [ %E.9, %for.inc107.preheader ]
  %E.10 = phi i32 [ %D.12, %for.inc107.split ], [ %E.8, %for.inc107.preheader ]
  %zext.ln129 = zext i7 %i.5 to i64
  %icmp.ln129 = icmp eq i7 %i.5, -48
  br i1 %icmp.ln129, label %for.end109, label %for.inc107.split, !llvm.loop !62

for.inc107.split:                                 ; preds = %for.inc107
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !5
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @14)
  %shl.ln131 = shl i32 %A.12, 5
  %lshr.ln131 = lshr i32 %A.12, 27
  %W.addr.9 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %zext.ln129
  %W.load.7 = load i32, i32* %W.addr.9, align 4
  %xor.ln131 = xor i32 %B.10, %D.12
  %xor.ln131.1 = xor i32 %xor.ln131, %C.9
  %or.ln131 = or i32 %shl.ln131, %lshr.ln131
  %add.ln131 = add i32 %W.load.7, %or.ln131
  %add.ln131.1 = add i32 %xor.ln131.1, -899497514
  %add.ln131.2 = add i32 %add.ln131.1, %E.10
  %temp = add i32 %add.ln131.2, %add.ln131
  %shl.ln131.1 = shl i32 %B.10, 30
  %lshr.ln131.1 = lshr i32 %B.10, 2
  %C.8 = or i32 %shl.ln131.1, %lshr.ln131.1
  %add.ln129 = add nuw i7 %i.5, 1
  br label %for.inc107, !llvm.loop !62

for.end109:                                       ; preds = %for.inc107
  %E.10.lcssa = phi i32 [ %E.10, %for.inc107 ]
  %D.12.lcssa = phi i32 [ %D.12, %for.inc107 ]
  %C.9.lcssa = phi i32 [ %C.9, %for.inc107 ]
  %B.10.lcssa = phi i32 [ %B.10, %for.inc107 ]
  %A.12.lcssa = phi i32 [ %A.12, %for.inc107 ]
  %add.ln135 = add i32 %A, %A.12.lcssa
  store i32 %add.ln135, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512
  %add.ln136 = add i32 %B, %B.10.lcssa
  store i32 %add.ln136, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4
  %add.ln137 = add i32 %C, %C.9.lcssa
  store i32 %add.ln137, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8
  %add.ln138 = add i32 %D, %D.12.lcssa
  store i32 %add.ln138, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4
  %add.ln139 = add i32 %E, %E.10.lcssa
  store i32 %add.ln139, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16
  ret void
}

; Function Attrs: nounwind
define void @sha_stream([2 x [8192 x i8]]* noalias %indata, [2 x i32]* noalias %in_i, [5 x i32]* noalias %outdata) #2 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @13), !fpga.pragma.source !5
  call void (...) @_ssdm_op_SpecTopModule([11 x i8]* @1), !fpga.pragma.source !5
  call void (...) @_ssdm_op_SpecInterface([2 x [8192 x i8]]* %indata, [10 x i8]* @3, i32 0, i32 0, [1 x i8]* @13, i32 -1, i32 0, [1 x i8]* @13, [1 x i8]* @13, [1 x i8]* @13, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @13, [1 x i8]* @13, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([2 x [8192 x i8]]* %indata), !map !69
  call void (...) @_ssdm_op_SpecInterface([2 x i32]* %in_i, [10 x i8]* @3, i32 0, i32 0, [1 x i8]* @13, i32 -1, i32 0, [1 x i8]* @13, [1 x i8]* @13, [1 x i8]* @13, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @13, [1 x i8]* @13, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([2 x i32]* %in_i), !map !69
  call void (...) @_ssdm_op_SpecInterface([5 x i32]* %outdata, [10 x i8]* @3, i32 0, i32 0, [1 x i8]* @13, i32 -1, i32 0, [1 x i8]* @13, [1 x i8]* @13, [1 x i8]* @13, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @13, [1 x i8]* @13, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([5 x i32]* %outdata), !map !69
  br label %VITIS_LOOP_207_1

VITIS_LOOP_207_1:                                 ; preds = %for.inc10, %entry
  %i = phi i2 [ %add.ln205, %for.inc10 ], [ 0, %entry ]
  %zext.ln205 = zext i2 %i to i64
  %icmp.ln205 = icmp eq i2 %i, -2
  br i1 %icmp.ln205, label %for.end12, label %VITIS_LOOP_207_1.split, !llvm.loop !70

VITIS_LOOP_207_1.split:                           ; preds = %VITIS_LOOP_207_1
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 2, i64 2, i64 2), !fpga.pragma.source !5
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @6)
  br label %for.inc

for.inc:                                          ; preds = %for.inc.split, %VITIS_LOOP_207_1.split
  %j.1 = phi i14 [ %add.ln207, %for.inc.split ], [ 0, %VITIS_LOOP_207_1.split ]
  %zext.ln207 = zext i14 %j.1 to i64
  %icmp.ln207 = icmp eq i14 %j.1, -8192
  br i1 %icmp.ln207, label %for.inc10, label %for.inc.split, !llvm.loop !89

for.inc.split:                                    ; preds = %for.inc
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @13)
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 8192, i64 8192, i64 8192), !fpga.pragma.source !5
  call void (...) @_ssdm_op_SpecLoopName([17 x i8]* @5)
  %indata.addr = getelementptr [2 x [8192 x i8]], [2 x [8192 x i8]]* %indata, i64 0, i64 %zext.ln205, i64 %zext.ln207
  %indata.load = load i8, i8* %indata.addr, align 1
  %local_indata.addr = getelementptr inbounds [2 x [8192 x i8]], [2 x [8192 x i8]]* @local_indata, i64 0, i64 %zext.ln205, i64 %zext.ln207
  store i8 %indata.load, i8* %local_indata.addr, align 1
  %add.ln207 = add nuw i14 %j.1, 1
  br label %for.inc, !llvm.loop !89

for.inc10:                                        ; preds = %for.inc
  %add.ln205 = add nuw i2 %i, 1
  br label %VITIS_LOOP_207_1, !llvm.loop !70

for.end12:                                        ; preds = %VITIS_LOOP_207_1
  call fastcc void @sha_init()
  br label %for.inc21

for.inc21:                                        ; preds = %for.inc21.split, %for.end12
  %j = phi i2 [ %add.ln216, %for.inc21.split ], [ 0, %for.end12 ]
  %zext.ln216 = zext i2 %j to i64
  %trunc.ln216 = trunc i2 %j to i1
  %icmp.ln216 = icmp eq i2 %j, -2
  br i1 %icmp.ln216, label %for.end23, label %for.inc21.split, !llvm.loop !99

for.inc21.split:                                  ; preds = %for.inc21
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 2, i64 2, i64 2), !fpga.pragma.source !5
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @15)
  %in_i.addr = getelementptr [2 x i32], [2 x i32]* %in_i, i64 0, i64 %zext.ln216
  %i.6 = load i32, i32* %in_i.addr, align 4
  call fastcc void @sha_update([2 x [8192 x i8]]* noalias nocapture align 512 @local_indata, i1 %trunc.ln216, i32 %i.6) #2
  %add.ln216 = add nuw i2 %j, 1
  br label %for.inc21, !llvm.loop !99

for.end23:                                        ; preds = %for.inc21
  call fastcc void @sha_final()
  br label %for.inc31

for.inc31:                                        ; preds = %for.inc31.split, %for.end23
  %i.7 = phi i3 [ %add.ln225, %for.inc31.split ], [ 0, %for.end23 ]
  %zext.ln225 = zext i3 %i.7 to i64
  %icmp.ln225 = icmp eq i3 %i.7, -3
  br i1 %icmp.ln225, label %for.end33, label %for.inc31.split, !llvm.loop !106

for.inc31.split:                                  ; preds = %for.inc31
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 5, i64 5, i64 5), !fpga.pragma.source !5
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @0)
  %sha_info_digest.addr = getelementptr inbounds [5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 %zext.ln225
  %sha_info_digest.load = load i32, i32* %sha_info_digest.addr, align 4
  %outdata.addr = getelementptr [5 x i32], [5 x i32]* %outdata, i64 0, i64 %zext.ln225
  store i32 %sha_info_digest.load, i32* %outdata.addr, align 4
  %add.ln225 = add nuw i3 %i.7, 1
  br label %for.inc31, !llvm.loop !106

for.end33:                                        ; preds = %for.inc31
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @sha_init() unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @13), !fpga.pragma.source !5
  store i32 1732584193, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512
  store i32 -271733879, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4
  store i32 -1732584194, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8
  store i32 271733878, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4
  store i32 -1009589776, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16
  store i32 0, i32* @sha_info_count_lo, align 512
  store i32 0, i32* @sha_info_count_hi, align 512
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @sha_final() unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @13), !fpga.pragma.source !5
  %lo_bit_count = load i32, i32* @sha_info_count_lo, align 512
  %trunc.ln175 = trunc i32 %lo_bit_count to i9
  %hi_bit_count = load i32, i32* @sha_info_count_hi, align 512
  %lshr.ln178 = lshr i9 %trunc.ln175, 3
  %count = trunc i9 %lshr.ln178 to i6
  %zext.ln174 = zext i6 %count to i7
  %count.1 = add nuw i7 %zext.ln174, 1
  %zext.ln179 = zext i6 %count to i64
  %sha_info_data.addr = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext.ln179
  store i32 128, i32* %sha_info_data.addr, align 4
  %icmp.ln181 = icmp ugt i7 %count.1, 56
  br i1 %icmp.ln181, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %xor.ln182 = xor i6 %count, -1
  %zext.ln182 = zext i6 %xor.ln182 to i7
  call fastcc void @local_memset(i7 %zext.ln182, i7 %count.1)
  call fastcc void @sha_transform()
  call fastcc void @local_memset(i7 56, i7 0)
  br label %if.end

if.else:                                          ; preds = %entry
  %sub.ln186 = sub nsw i7 55, %zext.ln174
  call fastcc void @local_memset(i7 %sub.ln186, i7 %count.1)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 %hi_bit_count, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 14), align 8
  store i32 %lo_bit_count, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 15), align 4
  call fastcc void @sha_transform()
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @local_memset(i7 %n, i7 %e) #1 {
entry_ifconv:
  %e.cast1 = trunc i7 %e to i4
  call void (...) @_ssdm_SpecKeepAssert(i7 %n) #2, !hlsrange !113
  call void (...) @_ssdm_SpecKeepAssert(i7 %e) #2, !hlsrange !114
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @13)
  %lshr.ln58 = lshr i7 %n, 6
  %trunc.ln58 = trunc i7 %lshr.ln58 to i1
  %sub.ln58 = sub i7 0, %n
  %lshr.ln58.1 = lshr i7 %sub.ln58, 2
  %trunc.ln58.1 = trunc i7 %lshr.ln58.1 to i5
  %sext.ln58 = sext i5 %trunc.ln58.1 to i30
  %zext.ln58 = zext i30 %sext.ln58 to i31
  %sub.ln58.1 = sub i31 0, %zext.ln58
  %lshr.ln58.2 = lshr i7 %n, 2
  %trunc.ln58.2 = trunc i7 %lshr.ln58.2 to i5
  %sext.ln58.1 = sext i5 %trunc.ln58.2 to i30
  %zext.ln58.1 = zext i30 %sext.ln58.1 to i31
  %m = select i1 %trunc.ln58, i31 %sub.ln58.1, i31 %zext.ln58.1
  br label %while.body4

while.body4:                                      ; preds = %while.body4.split, %entry_ifconv
  %idx = phi i30 [ 0, %entry_ifconv ], [ %add.ln65, %while.body4.split ]
  %trunc.ln65 = trunc i30 %idx to i4
  %zext.ln65 = zext i30 %idx to i31
  %icmp.ln65 = icmp slt i31 %zext.ln65, %m
  br i1 %icmp.ln65, label %while.body4.split, label %while.end6.loopexit, !llvm.loop !115

while.body4.split:                                ; preds = %while.body4
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 0, i64 14, i64 7), !fpga.pragma.source !5
  call void (...) @_ssdm_op_SpecLoopName([20 x i8]* @4)
  %add.ln57 = add i4 %trunc.ln65, %e.cast1
  %zext.ln57 = zext i4 %add.ln57 to i64
  %p = getelementptr [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext.ln57
  store i32 0, i32* %p, align 4
  %add.ln65 = add nuw i30 %idx, 1
  br label %while.body4, !llvm.loop !115

while.end6.loopexit:                              ; preds = %while.body4
  ret void
}

; Function Attrs: noinline
define internal fastcc void @local_memcpy([2 x [8192 x i8]]* noalias nocapture align 512 %s2, i1 %s2.offset, i32 %n, i14 %idx1) #0 {
entry:
  %s2.offset.cast = zext i1 %s2.offset to i64
  call void (...) @_ssdm_SpecKeepAssert(i1 %s2.offset), !hlsrange !4
  call void (...) @_ssdm_SpecKeepAssert(i32 %n), !hlsrange !124
  call void (...) @_ssdm_SpecKeepAssert(i14 %idx1), !hlsrange !125
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @13)
  %lshr.ln76 = lshr i32 %n, 31
  %trunc.ln76 = trunc i32 %lshr.ln76 to i1
  %sub.ln76 = sub i32 0, %n
  %lshr.ln76.1 = lshr i32 %sub.ln76, 2
  %trunc.ln76.1 = trunc i32 %lshr.ln76.1 to i31
  %sub.ln76.1 = sub i31 0, %trunc.ln76.1
  %lshr.ln76.2 = lshr i32 %n, 2
  %trunc.ln76.2 = trunc i32 %lshr.ln76.2 to i31
  %m = select i1 %trunc.ln76, i31 %sub.ln76.1, i31 %trunc.ln76.2
  br label %while.body

while.body:                                       ; preds = %while.body.split, %entry
  %idx = phi i32 [ 0, %entry ], [ %add.ln79, %while.body.split ]
  %idx9 = phi i5 [ 0, %entry ], [ %add.ln79.1, %while.body.split ]
  %zext.ln79 = zext i5 %idx9 to i64
  %trunc.ln79 = trunc i32 %idx to i14
  %zext.ln79.1 = zext i5 %idx9 to i31
  %icmp.ln79 = icmp slt i31 %zext.ln79.1, %m
  br i1 %icmp.ln79, label %while.body.split, label %while.end.loopexit, !llvm.loop !126

while.body.split:                                 ; preds = %while.body
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 0, i64 16, i64 8), !fpga.pragma.source !5
  call void (...) @_ssdm_op_SpecLoopName([20 x i8]* @8)
  %p1 = getelementptr [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext.ln79
  %add.ln73 = add i14 %trunc.ln79, %idx1
  %zext.ln73 = zext i14 %add.ln73 to i64
  %p2 = getelementptr [2 x [8192 x i8]], [2 x [8192 x i8]]* %s2, i64 0, i64 %s2.offset.cast, i64 %zext.ln73
  %add.ln82 = add i14 %add.ln73, 1
  %zext.ln82 = zext i14 %add.ln82 to i64
  %p2.1 = getelementptr [2 x [8192 x i8]], [2 x [8192 x i8]]* %s2, i64 0, i64 %s2.offset.cast, i64 %zext.ln82
  %p2.load = load i8, i8* %p2, align 1
  %add.ln83 = add i14 %add.ln73, 2
  %zext.ln83 = zext i14 %add.ln83 to i64
  %p2.2 = getelementptr [2 x [8192 x i8]], [2 x [8192 x i8]]* %s2, i64 0, i64 %s2.offset.cast, i64 %zext.ln83
  %p2.1.load = load i8, i8* %p2.1, align 1
  %add.ln84 = add i14 %add.ln73, 3
  %zext.ln84 = zext i14 %add.ln84 to i64
  %p2.3 = getelementptr [2 x [8192 x i8]], [2 x [8192 x i8]]* %s2, i64 0, i64 %s2.offset.cast, i64 %zext.ln84
  %p2.2.load = load i8, i8* %p2.2, align 1
  %p2.3.load = load i8, i8* %p2.3, align 1
  %tmp = call i32 @_ssdm_op_BitConcatenate.i32.i8.i8.i8.i8(i8 %p2.3.load, i8 %p2.2.load, i8 %p2.1.load, i8 %p2.load)
  store i32 %tmp, i32* %p1, align 4
  %add.ln79 = add nuw i32 %idx, 4
  %add.ln79.1 = add nuw i5 %idx9, 1
  br label %while.body, !llvm.loop !126

while.end.loopexit:                               ; preds = %while.body
  ret void
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, i64, metadata) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata) #3

; Function Attrs: nounwind
declare void @_ssdm_op_SpecTopModule(...) #2

; Function Attrs: nounwind
declare void @_ssdm_op_SpecPipeline(...) #2

; Function Attrs: nounwind
declare void @_ssdm_op_SpecLoopTripCount(...) #2

; Function Attrs: nounwind
declare void @_ssdm_op_SpecLoopName(...) #2

; Function Attrs: nounwind
declare void @_ssdm_op_SpecInterface(...) #2

; Function Attrs: nounwind
declare void @_ssdm_op_SpecBitsMap(...) #2

; Function Attrs: nounwind readnone
declare i32 @_ssdm_op_BitConcatenate.i32.i8.i8.i8.i8(i8, i8, i8, i8) #4

declare void @_ssdm_SpecKeepAssert(...)

attributes #0 = { noinline }
attributes #1 = { noinline nounwind }
attributes #2 = { nounwind }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind readnone }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!blackbox_cfg = !{!1}
!llvm.module.flags = !{!2, !3}
!llvm.map.gv = !{}

!0 = !{!"clang version 7.0.0 "}
!1 = !{}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"reflow.full.lowering", i32 1}
!4 = !{i1 true, i1 false, i1 false, i1 true}
!5 = !{!"user"}
!6 = distinct !{!6, !7, !20, !21}
!7 = !{i32 168, i32 5, !8, null}
!8 = !{i32 786443, !9, !10}
!9 = !{i32 786478, i32 0, !10, !"sha_update", !"sha_update", null, !10, i32 154, !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !18, i32 154}
!10 = !{i32 786473, !"data/benchmarks/sha/sha.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!11 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !12, i32 0, i32 0}
!12 = !{null, !13, !17}
!13 = !{i32 786447, null, !"", !14, i32 0, i64 64, i64 0, i32 0, i32 0, !15}
!14 = !{i32 786473, !"<unknown>", null, null}
!15 = !{i32 786470, null, !"", !14, i32 0, i64 0, i64 0, i32 0, i32 0, !16}
!16 = !{i32 786468, null, !"unsigned char", null, i32 0, i64 8, i64 0, i32 0, i32 0, i32 8}
!17 = !{i32 786468, null, !"int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 5}
!18 = !{!19}
!19 = !{i32 0}
!20 = !{!"llvm.loop.name", !"sha_update_label4"}
!21 = !{!"llvm.loop.tripcount", i32 127, i32 128, i32 127, !"user", !22}
!22 = !{i32 163, i32 9, !8, null}
!23 = distinct !{!23, !24, !30, !31}
!24 = !{i32 101, i32 5, !25, null}
!25 = !{i32 786443, !26, i32 98, i32 5, !10, i32 0}
!26 = !{i32 786443, !27, !10}
!27 = !{i32 786478, i32 0, !10, !"sha_transform", !"sha_transform", null, !10, i32 92, !28, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @sha_transform, null, null, !18, i32 92}
!28 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !29, i32 0, i32 0}
!29 = !{null}
!30 = !{!"llvm.loop.name", !"sha_transform_label1"}
!31 = !{!"llvm.loop.tripcount", i32 16, i32 16, i32 16, !"user", !32}
!32 = !{i32 99, i32 9, !33, null}
!33 = !{i32 786443, !25, !10}
!34 = distinct !{!34, !35, !37, !38}
!35 = !{i32 107, i32 5, !36, null}
!36 = !{i32 786443, !26, i32 104, i32 5, !10, i32 0}
!37 = !{!"llvm.loop.name", !"sha_transform_label2"}
!38 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !39}
!39 = !{i32 105, i32 9, !40, null}
!40 = !{i32 786443, !36, !10}
!41 = distinct !{!41, !42, !44, !45}
!42 = !{i32 120, i32 5, !43, null}
!43 = !{i32 786443, !26, i32 117, i32 27, !10, i32 0}
!44 = !{!"llvm.loop.name", !"sha_transform_label3"}
!45 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !46}
!46 = !{i32 118, i32 9, !47, null}
!47 = !{i32 786443, !43, !10}
!48 = distinct !{!48, !49, !51, !52}
!49 = !{i32 124, i32 5, !50, null}
!50 = !{i32 786443, !26, i32 121, i32 27, !10, i32 0}
!51 = !{!"llvm.loop.name", !"sha_transform_label4"}
!52 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !53}
!53 = !{i32 122, i32 9, !54, null}
!54 = !{i32 786443, !50, !10}
!55 = distinct !{!55, !56, !58, !59}
!56 = !{i32 128, i32 5, !57, null}
!57 = !{i32 786443, !26, i32 125, i32 27, !10, i32 0}
!58 = !{!"llvm.loop.name", !"sha_transform_label5"}
!59 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !60}
!60 = !{i32 126, i32 9, !61, null}
!61 = !{i32 786443, !57, !10}
!62 = distinct !{!62, !63, !65, !66}
!63 = !{i32 132, i32 5, !64, null}
!64 = !{i32 786443, !26, i32 129, i32 27, !10, i32 0}
!65 = !{!"llvm.loop.name", !"sha_transform_label6"}
!66 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !67}
!67 = !{i32 130, i32 9, !68, null}
!68 = !{i32 786443, !64, !10}
!69 = !{!1}
!70 = distinct !{!70, !71, !85, !86}
!71 = !{i32 211, i32 5, !72, null}
!72 = !{i32 786443, !73, i32 205, i32 5, !10, i32 0}
!73 = !{i32 786443, !74, !10}
!74 = !{i32 786478, i32 0, !10, !"sha_stream", !"sha_stream", null, !10, i32 196, !75, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([2 x [8192 x i8]]*, [2 x i32]*, [5 x i32]*)* @sha_stream, null, null, !18, i32 200}
!75 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !76, i32 0, i32 0}
!76 = !{null, !77, !81, !83}
!77 = !{i32 786447, null, !"", !14, i32 0, i64 64, i64 0, i32 0, i32 0, !78}
!78 = !{i32 786433, null, !"", null, i32 0, i64 65536, i64 0, i32 0, i32 0, !15, !79, i32 0, null, null}
!79 = !{!80}
!80 = !{i32 786465, i64 0, i64 8191}
!81 = !{i32 786447, null, !"", !14, i32 0, i64 64, i64 0, i32 0, i32 0, !82}
!82 = !{i32 786470, null, !"", !14, i32 0, i64 0, i64 0, i32 0, i32 0, !17}
!83 = !{i32 786447, null, !"", !14, i32 0, i64 64, i64 0, i32 0, i32 0, !84}
!84 = !{i32 786468, null, !"unsigned int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 7}
!85 = !{!"llvm.loop.name", !"sha_stream_label1"}
!86 = !{!"llvm.loop.tripcount", i32 2, i32 2, i32 2, !"user", !87}
!87 = !{i32 206, i32 9, !88, null}
!88 = !{i32 786443, !72, !10}
!89 = distinct !{!89, !90, !94, !95, !96, !98}
!90 = !{i32 207, i32 20, !91, null}
!91 = !{i32 786443, !92, i32 207, i32 20, !10, i32 0}
!92 = !{i32 786443, !93, i32 205, i32 29, !10, i32 0}
!93 = !{i32 786443, !88, i32 205, i32 5, !10, i32 0}
!94 = !{i32 210, i32 9, !91, null}
!95 = !{!"llvm.loop.name", !"VITIS_LOOP_207_1"}
!96 = !{!"llvm.loop.tripcount", i32 8192, i32 8192, i32 8192, !"user", !97}
!97 = !{i32 208, i32 9, !91, null}
!98 = !{!"llvm.loop.pipeline.enable", i32 -1, i1 false, i8 -1, !"auto"}
!99 = distinct !{!99, !100, !102, !103}
!100 = !{i32 221, i32 5, !101, null}
!101 = !{i32 786443, !73, i32 216, i32 5, !10, i32 0}
!102 = !{!"llvm.loop.name", !"sha_stream_label0"}
!103 = !{!"llvm.loop.tripcount", i32 2, i32 2, i32 2, !"user", !104}
!104 = !{i32 217, i32 9, !105, null}
!105 = !{i32 786443, !101, !10}
!106 = distinct !{!106, !107, !109, !110}
!107 = !{i32 228, i32 5, !108, null}
!108 = !{i32 786443, !73, i32 225, i32 5, !10, i32 0}
!109 = !{!"llvm.loop.name", !"sha_stream_label2"}
!110 = !{!"llvm.loop.tripcount", i32 5, i32 5, i32 5, !"user", !111}
!111 = !{i32 226, i32 9, !112, null}
!112 = !{i32 786443, !108, !10}
!113 = !{i7 -8, i7 63, i7 0, i7 -1}
!114 = !{i7 -64, i7 63, i7 0, i7 -64}
!115 = distinct !{!115, !116, !121, !122}
!116 = !{i32 68, i32 5, !117, null}
!117 = !{i32 786443, !118, !10}
!118 = !{i32 786478, i32 0, !10, !"local_memset", !"local_memset", null, !10, i32 55, !119, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i7, i7)* @local_memset, null, null, !18, i32 55}
!119 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !120, i32 0, i32 0}
!120 = !{null, !83, !17, !17, !17}
!121 = !{!"llvm.loop.name", !"local_memset_label1"}
!122 = !{!"llvm.loop.tripcount", i32 0, i32 14, i32 7, !"user", !123}
!123 = !{i32 66, i32 9, !117, null}
!124 = !{i32 -2147483648, i32 64, i32 0, i32 -1}
!125 = !{i14 -8192, i14 8191, i14 0, i14 -1}
!126 = distinct !{!126, !127, !132, !133}
!127 = !{i32 88, i32 5, !128, null}
!128 = !{i32 786443, !129, !10}
!129 = !{i32 786478, i32 0, !10, !"local_memcpy", !"local_memcpy", null, !10, i32 72, !130, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !18, i32 72}
!130 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !131, i32 0, i32 0}
!131 = !{null, !83, !13, !17}
!132 = !{!"llvm.loop.name", !"local_memcpy_label3"}
!133 = !{!"llvm.loop.tripcount", i32 0, i32 16, i32 8, !"user", !134}
!134 = !{i32 80, i32 9, !128, null}
