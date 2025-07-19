; ModuleID = 'data/base_solutions/SHA/solution0/.autopilot/db/a.g.2.bc'
source_filename = "data/base_solutions/SHA/solution0/.autopilot/db/a.g.2.bc"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

@sha_info_digest = internal unnamed_addr global [5 x i32] zeroinitializer, align 512
@sha_info_data = internal unnamed_addr global [16 x i32] zeroinitializer, align 512
@sha_info_count_lo = internal unnamed_addr global i32 0, align 512
@sha_info_count_hi = internal unnamed_addr global i32 0, align 512
@local_indata = internal global [16384 x i8] zeroinitializer
@0 = internal unnamed_addr constant [21 x i8] c"sha_transform_label1\00"
@1 = internal unnamed_addr constant [21 x i8] c"sha_transform_label2\00"
@2 = internal unnamed_addr constant [21 x i8] c"sha_transform_label3\00"
@3 = internal unnamed_addr constant [10 x i8] c"ap_memory\00"
@4 = internal unnamed_addr constant [1 x i8] zeroinitializer
@5 = internal unnamed_addr constant [21 x i8] c"sha_transform_label6\00"
@6 = internal unnamed_addr constant [11 x i8] c"sha_stream\00"
@7 = internal unnamed_addr constant [18 x i8] c"sha_stream_label2\00"
@8 = internal unnamed_addr constant [18 x i8] c"sha_stream_label0\00"
@9 = internal unnamed_addr constant [17 x i8] c"VITIS_LOOP_207_1\00"
@10 = internal unnamed_addr constant [18 x i8] c"sha_stream_label1\00"
@11 = internal unnamed_addr constant [18 x i8] c"sha_update_label4\00"
@12 = internal unnamed_addr constant [20 x i8] c"local_memcpy_label3\00"
@13 = internal unnamed_addr constant [21 x i8] c"sha_transform_label4\00"
@14 = internal unnamed_addr constant [21 x i8] c"sha_transform_label5\00"
@15 = internal unnamed_addr constant [20 x i8] c"local_memset_label1\00"

; Function Attrs: noinline
define internal fastcc void @sha_update([16384 x i8]* noalias nocapture align 512 %buffer, i64 %buffer.offset, i32 %count) #0 {
entry:
  call void (...) @_ssdm_SpecArrayPartialAccess_Offset(i64 %buffer.offset)
  call void (...) @_ssdm_SpecArrayPartialAccess([16384 x i8]* %buffer, i64 %buffer.offset, i32 1)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @4), !fpga.pragma.source !4
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @4), !fpga.pragma.source !4
  %sha_info_count_lo.load = load i32, i32* @sha_info_count_lo, align 512
  %shl.ln155 = shl i32 %count, 3
  %add.ln155 = add i32 %sha_info_count_lo.load, %shl.ln155
  %icmp.ln155 = icmp ult i32 %add.ln155, %sha_info_count_lo.load
  br i1 %icmp.ln155, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %sha_info_count_hi.load = load i32, i32* @sha_info_count_hi, align 512
  %add.ln156 = add i32 %sha_info_count_hi.load, 1
  store i32 %add.ln156, i32* @sha_info_count_hi, align 512
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 %add.ln155, i32* @sha_info_count_lo, align 512
  %lshr.ln159 = lshr i32 %count, 29
  %sha_info_count_hi.load.1 = load i32, i32* @sha_info_count_hi, align 512
  %add.ln159 = add i32 %sha_info_count_hi.load.1, %lshr.ln159
  store i32 %add.ln159, i32* @sha_info_count_hi, align 512
  %icmp.ln162 = icmp sgt i32 %count, 63
  br label %while.body

while.body:                                       ; preds = %while.body.split, %if.end
  %count.addr.02 = phi i32 [ %count, %if.end ], [ %add.ln167, %while.body.split ]
  %idx = phi i64 [ 0, %if.end ], [ %add.ln162, %while.body.split ]
  %icmp.ln162.1 = icmp sgt i32 %count.addr.02, 63
  br i1 %icmp.ln162.1, label %while.body.split, label %while.end.loopexit, !llvm.loop !5

while.body.split:                                 ; preds = %while.body
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 127, i64 128, i64 127), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @11)
  call fastcc void @local_memcpy([16384 x i8]* %buffer, i64 %buffer.offset, i32 64, i64 %idx)
  call fastcc void @sha_transform()
  %add.ln167 = add nuw nsw i32 %count.addr.02, -64
  %add.ln162 = add nuw nsw i64 %idx, 64
  br label %while.body, !llvm.loop !5

while.end.loopexit:                               ; preds = %while.body
  %add.ln162.1 = add nsw i32 %count, -64
  %lshr.ln162 = lshr i32 %add.ln162.1, 6
  %zext.ln162 = zext i32 %lshr.ln162 to i64
  %shl.ln162 = shl nuw nsw i64 %zext.ln162, 6
  %add.ln162.2 = add nuw nsw i64 %shl.ln162, 64
  %and.ln162 = and i32 %add.ln162.1, 63
  %select.ln169 = select i1 %icmp.ln162, i32 %and.ln162, i32 %count
  %select.ln169.1 = select i1 %icmp.ln162, i64 %add.ln162.2, i64 0
  call fastcc void @local_memcpy([16384 x i8]* %buffer, i64 %buffer.offset, i32 %select.ln169, i64 %select.ln169.1)
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @sha_transform() unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @4), !fpga.pragma.source !4
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @4), !fpga.pragma.source !4
  %W = alloca [80 x i32], i64 1, align 512
  br label %for.inc

for.inc:                                          ; preds = %for.inc.split, %entry
  %i = phi i64 [ %add.ln98, %for.inc.split ], [ 0, %entry ]
  %icmp.ln98 = icmp eq i64 %i, 16
  br i1 %icmp.ln98, label %for.inc21, label %for.inc.split, !llvm.loop !22

for.inc.split:                                    ; preds = %for.inc
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 16, i64 16, i64 16), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @0)
  %sha_info_data.addr = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %i
  %sha_info_data.load = load i32, i32* %sha_info_data.addr, align 4
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %sha_info_data.load) #2
  %W.addr = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %i
  store i32 %sha_info_data.load, i32* %W.addr, align 4
  %add.ln98 = add nuw nsw i64 %i, 1
  br label %for.inc, !llvm.loop !22

for.inc21:                                        ; preds = %for.inc21.split, %for.inc
  %i.1 = phi i64 [ %add.ln104, %for.inc21.split ], [ 16, %for.inc ]
  %icmp.ln104 = icmp eq i64 %i.1, 80
  br i1 %icmp.ln104, label %for.end23, label %for.inc21.split, !llvm.loop !33

for.inc21.split:                                  ; preds = %for.inc21
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @1)
  %add.ln106 = add nuw nsw i64 %i.1, -3
  %W.addr.1 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %add.ln106
  %W.load = load i32, i32* %W.addr.1, align 4
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %W.load) #2
  %add.ln106.1 = add nuw nsw i64 %i.1, -8
  %W.addr.2 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %add.ln106.1
  %W.load.1 = load i32, i32* %W.addr.2, align 4
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %W.load.1) #2
  %add.ln106.2 = add nuw nsw i64 %i.1, -14
  %W.addr.3 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %add.ln106.2
  %W.load.2 = load i32, i32* %W.addr.3, align 4
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %W.load.2) #2
  %add.ln106.3 = add nuw nsw i64 %i.1, -16
  %W.addr.4 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %add.ln106.3
  %W.load.3 = load i32, i32* %W.addr.4, align 4
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %W.load.3) #2
  %xor.ln106 = xor i32 %W.load.1, %W.load
  %xor.ln106.1 = xor i32 %xor.ln106, %W.load.2
  %xor.ln106.2 = xor i32 %xor.ln106.1, %W.load.3
  %W.addr.5 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %i.1
  store i32 %xor.ln106.2, i32* %W.addr.5, align 4
  %add.ln104 = add nuw nsw i64 %i.1, 1
  br label %for.inc21, !llvm.loop !33

for.end23:                                        ; preds = %for.inc21
  %A = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %A) #2
  %B = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %B) #2
  %C = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %C) #2
  %D = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %D) #2
  %E = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %E) #2
  br label %for.inc38

for.inc38:                                        ; preds = %for.inc38.split, %for.end23
  %i.2 = phi i64 [ %add.ln117, %for.inc38.split ], [ 0, %for.end23 ]
  %B.4 = phi i32 [ %A.9, %for.inc38.split ], [ %A, %for.end23 ]
  %B.2 = phi i32 [ %B.4, %for.inc38.split ], [ %B, %for.end23 ]
  %D.4 = phi i32 [ %C.2, %for.inc38.split ], [ %C, %for.end23 ]
  %E.4 = phi i32 [ %D.4, %for.inc38.split ], [ %D, %for.end23 ]
  %E.2 = phi i32 [ %E.4, %for.inc38.split ], [ %E, %for.end23 ]
  %icmp.ln117 = icmp eq i64 %i.2, 20
  br i1 %icmp.ln117, label %for.inc60, label %for.inc38.split, !llvm.loop !40

for.inc38.split:                                  ; preds = %for.inc38
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @2)
  %shl.ln119 = shl i32 %B.4, 5
  %lshr.ln119 = lshr i32 %B.4, 27
  %W.addr.6 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %i.2
  %W.load.4 = load i32, i32* %W.addr.6, align 4
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %W.load.4) #2
  %xor.ln119 = xor i32 %B.2, -1
  %and.ln119 = and i32 %D.4, %B.2
  %and.ln119.1 = and i32 %E.4, %xor.ln119
  %or.ln119 = or i32 %and.ln119.1, %and.ln119
  %or.ln119.1 = or i32 %shl.ln119, %lshr.ln119
  %add.ln119 = add i32 %or.ln119.1, 1518500249
  %add.ln119.1 = add i32 %add.ln119, %E.2
  %add.ln119.2 = add i32 %add.ln119.1, %or.ln119
  %A.9 = add i32 %add.ln119.2, %W.load.4
  %shl.ln119.1 = shl i32 %B.2, 30
  %lshr.ln119.1 = lshr i32 %B.2, 2
  %C.2 = or i32 %shl.ln119.1, %lshr.ln119.1
  %add.ln117 = add nuw nsw i64 %i.2, 1
  br label %for.inc38, !llvm.loop !40

for.inc60:                                        ; preds = %for.inc60.split, %for.inc38
  %i.3 = phi i64 [ %add.ln121, %for.inc60.split ], [ 20, %for.inc38 ]
  %B.7 = phi i32 [ %A.10, %for.inc60.split ], [ %B.4, %for.inc38 ]
  %B.5 = phi i32 [ %B.7, %for.inc60.split ], [ %B.2, %for.inc38 ]
  %D.7 = phi i32 [ %C.4, %for.inc60.split ], [ %D.4, %for.inc38 ]
  %E.7 = phi i32 [ %D.7, %for.inc60.split ], [ %E.4, %for.inc38 ]
  %E.5 = phi i32 [ %E.7, %for.inc60.split ], [ %E.2, %for.inc38 ]
  %icmp.ln121 = icmp eq i64 %i.3, 40
  br i1 %icmp.ln121, label %for.inc85, label %for.inc60.split, !llvm.loop !47

for.inc60.split:                                  ; preds = %for.inc60
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @13)
  %shl.ln123 = shl i32 %B.7, 5
  %lshr.ln123 = lshr i32 %B.7, 27
  %W.addr.7 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %i.3
  %W.load.5 = load i32, i32* %W.addr.7, align 4
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %W.load.5) #2
  %xor.ln123 = xor i32 %D.7, %B.5
  %xor.ln123.1 = xor i32 %xor.ln123, %E.7
  %or.ln123 = or i32 %shl.ln123, %lshr.ln123
  %add.ln123 = add i32 %or.ln123, 1859775393
  %add.ln123.1 = add i32 %add.ln123, %E.5
  %add.ln123.2 = add i32 %add.ln123.1, %xor.ln123.1
  %A.10 = add i32 %add.ln123.2, %W.load.5
  %shl.ln123.1 = shl i32 %B.5, 30
  %lshr.ln123.1 = lshr i32 %B.5, 2
  %C.4 = or i32 %shl.ln123.1, %lshr.ln123.1
  %add.ln121 = add nuw nsw i64 %i.3, 1
  br label %for.inc60, !llvm.loop !47

for.inc85:                                        ; preds = %for.inc85.split, %for.inc60
  %i.4 = phi i64 [ %add.ln125, %for.inc85.split ], [ 40, %for.inc60 ]
  %B.9 = phi i32 [ %A.11, %for.inc85.split ], [ %B.7, %for.inc60 ]
  %B.8 = phi i32 [ %B.9, %for.inc85.split ], [ %B.5, %for.inc60 ]
  %D.9 = phi i32 [ %C.6, %for.inc85.split ], [ %D.7, %for.inc60 ]
  %E.9 = phi i32 [ %D.9, %for.inc85.split ], [ %E.7, %for.inc60 ]
  %E.8 = phi i32 [ %E.9, %for.inc85.split ], [ %E.5, %for.inc60 ]
  %icmp.ln125 = icmp eq i64 %i.4, 60
  br i1 %icmp.ln125, label %for.inc107, label %for.inc85.split, !llvm.loop !54

for.inc85.split:                                  ; preds = %for.inc85
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @14)
  %shl.ln127 = shl i32 %B.9, 5
  %lshr.ln127 = lshr i32 %B.9, 27
  %W.addr.8 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %i.4
  %W.load.6 = load i32, i32* %W.addr.8, align 4
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %W.load.6) #2
  %or.ln127 = or i32 %E.9, %D.9
  %and.ln127 = and i32 %or.ln127, %B.8
  %and.ln127.1 = and i32 %E.9, %D.9
  %or.ln127.1 = or i32 %and.ln127, %and.ln127.1
  %or.ln127.2 = or i32 %shl.ln127, %lshr.ln127
  %add.ln127 = add i32 %or.ln127.2, -1894007588
  %add.ln127.1 = add i32 %add.ln127, %E.8
  %add.ln127.2 = add i32 %add.ln127.1, %or.ln127.1
  %A.11 = add i32 %add.ln127.2, %W.load.6
  %shl.ln127.1 = shl i32 %B.8, 30
  %lshr.ln127.1 = lshr i32 %B.8, 2
  %C.6 = or i32 %shl.ln127.1, %lshr.ln127.1
  %add.ln125 = add nuw nsw i64 %i.4, 1
  br label %for.inc85, !llvm.loop !54

for.inc107:                                       ; preds = %for.inc107.split, %for.inc85
  %i.5 = phi i64 [ %add.ln129, %for.inc107.split ], [ 60, %for.inc85 ]
  %A.12 = phi i32 [ %temp, %for.inc107.split ], [ %B.9, %for.inc85 ]
  %B.10 = phi i32 [ %A.12, %for.inc107.split ], [ %B.8, %for.inc85 ]
  %C.9 = phi i32 [ %C.8, %for.inc107.split ], [ %D.9, %for.inc85 ]
  %D.12 = phi i32 [ %C.9, %for.inc107.split ], [ %E.9, %for.inc85 ]
  %E.10 = phi i32 [ %D.12, %for.inc107.split ], [ %E.8, %for.inc85 ]
  %icmp.ln129 = icmp eq i64 %i.5, 80
  br i1 %icmp.ln129, label %for.end109, label %for.inc107.split, !llvm.loop !61

for.inc107.split:                                 ; preds = %for.inc107
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @5)
  %shl.ln131 = shl i32 %A.12, 5
  %lshr.ln131 = lshr i32 %A.12, 27
  %W.addr.9 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %i.5
  %W.load.7 = load i32, i32* %W.addr.9, align 4
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %W.load.7) #2
  %xor.ln131 = xor i32 %C.9, %B.10
  %xor.ln131.1 = xor i32 %xor.ln131, %D.12
  %or.ln131 = or i32 %shl.ln131, %lshr.ln131
  %add.ln131 = add i32 %or.ln131, -899497514
  %add.ln131.1 = add i32 %add.ln131, %E.10
  %add.ln131.2 = add i32 %add.ln131.1, %xor.ln131.1
  %temp = add i32 %add.ln131.2, %W.load.7
  %shl.ln131.1 = shl i32 %B.10, 30
  %lshr.ln131.1 = lshr i32 %B.10, 2
  %C.8 = or i32 %shl.ln131.1, %lshr.ln131.1
  %add.ln129 = add nuw nsw i64 %i.5, 1
  br label %for.inc107, !llvm.loop !61

for.end109:                                       ; preds = %for.inc107
  %add.ln135 = add i32 %A.12, %A
  store i32 %add.ln135, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512
  %add.ln136 = add i32 %B.10, %B
  store i32 %add.ln136, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4
  %add.ln137 = add i32 %C.9, %C
  store i32 %add.ln137, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8
  %add.ln138 = add i32 %D.12, %D
  store i32 %add.ln138, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4
  %add.ln139 = add i32 %E.10, %E
  store i32 %add.ln139, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16
  ret void
}

; Function Attrs: nounwind
define void @sha_stream([16384 x i8]* noalias %indata, [2 x i32]* noalias %in_i, [5 x i32]* noalias %outdata) #2 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @4), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecTopModule([11 x i8]* @6), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecInterface([16384 x i8]* %indata, [10 x i8]* @3, i32 0, i32 0, [1 x i8]* @4, i32 -1, i32 0, [1 x i8]* @4, [1 x i8]* @4, [1 x i8]* @4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @4, [1 x i8]* @4, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([16384 x i8]* %indata), !map !68
  call void (...) @_ssdm_op_SpecInterface([2 x i32]* %in_i, [10 x i8]* @3, i32 0, i32 0, [1 x i8]* @4, i32 -1, i32 0, [1 x i8]* @4, [1 x i8]* @4, [1 x i8]* @4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @4, [1 x i8]* @4, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([2 x i32]* %in_i), !map !68
  call void (...) @_ssdm_op_SpecInterface([5 x i32]* %outdata, [10 x i8]* @3, i32 0, i32 0, [1 x i8]* @4, i32 -1, i32 0, [1 x i8]* @4, [1 x i8]* @4, [1 x i8]* @4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @4, [1 x i8]* @4, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([5 x i32]* %outdata), !map !68
  br label %VITIS_LOOP_207_1

VITIS_LOOP_207_1:                                 ; preds = %for.inc10, %entry
  %i = phi i64 [ %add.ln205, %for.inc10 ], [ 0, %entry ]
  %shl.ln209 = shl i64 %i, 13
  %shl.ln209.1 = shl i64 %i, 13
  %icmp.ln205 = icmp eq i64 %i, 2
  br i1 %icmp.ln205, label %for.end12, label %VITIS_LOOP_207_1.split, !llvm.loop !69

VITIS_LOOP_207_1.split:                           ; preds = %VITIS_LOOP_207_1
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 2, i64 2, i64 2), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @10)
  br label %for.inc

for.inc:                                          ; preds = %for.inc.split, %VITIS_LOOP_207_1.split
  %j.1 = phi i64 [ %add.ln207, %for.inc.split ], [ 0, %VITIS_LOOP_207_1.split ]
  %add.ln209 = add i64 %shl.ln209, %j.1
  %local_indata.addr = getelementptr [16384 x i8], [16384 x i8]* @local_indata, i64 0, i64 %add.ln209
  %add.ln209.1 = add i64 %shl.ln209.1, %j.1
  %indata.addr = getelementptr [16384 x i8], [16384 x i8]* %indata, i64 0, i64 %add.ln209.1
  %icmp.ln207 = icmp eq i64 %j.1, 8192
  br i1 %icmp.ln207, label %for.inc10, label %for.inc.split, !llvm.loop !88

for.inc.split:                                    ; preds = %for.inc
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @4)
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 8192, i64 8192, i64 8192), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([17 x i8]* @9)
  %indata.load = load i8, i8* %indata.addr, align 1
  call void (...) @_ssdm_SpecKeepArrayLoad(i8 %indata.load) #2
  store i8 %indata.load, i8* %local_indata.addr, align 1
  %add.ln207 = add nuw nsw i64 %j.1, 1
  br label %for.inc, !llvm.loop !88

for.inc10:                                        ; preds = %for.inc
  %add.ln205 = add nuw nsw i64 %i, 1
  br label %VITIS_LOOP_207_1, !llvm.loop !69

for.end12:                                        ; preds = %VITIS_LOOP_207_1
  call fastcc void @sha_init()
  br label %for.inc21

for.inc21:                                        ; preds = %for.inc21.split, %for.end12
  %j = phi i64 [ %add.ln216, %for.inc21.split ], [ 0, %for.end12 ]
  %icmp.ln216 = icmp eq i64 %j, 2
  br i1 %icmp.ln216, label %for.end23, label %for.inc21.split, !llvm.loop !98

for.inc21.split:                                  ; preds = %for.inc21
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 2, i64 2, i64 2), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @8)
  %in_i.addr = getelementptr [2 x i32], [2 x i32]* %in_i, i64 0, i64 %j
  %i.6 = load i32, i32* %in_i.addr, align 4
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %i.6) #2
  call fastcc void @sha_update([16384 x i8]* @local_indata, i64 %j, i32 %i.6) #2
  %add.ln216 = add nuw nsw i64 %j, 1
  br label %for.inc21, !llvm.loop !98

for.end23:                                        ; preds = %for.inc21
  call fastcc void @sha_final()
  br label %for.inc31

for.inc31:                                        ; preds = %for.inc31.split, %for.end23
  %i.7 = phi i64 [ %add.ln225, %for.inc31.split ], [ 0, %for.end23 ]
  %icmp.ln225 = icmp eq i64 %i.7, 5
  br i1 %icmp.ln225, label %for.end33, label %for.inc31.split, !llvm.loop !105

for.inc31.split:                                  ; preds = %for.inc31
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 5, i64 5, i64 5), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @7)
  %sha_info_digest.addr = getelementptr inbounds [5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 %i.7
  %sha_info_digest.load = load i32, i32* %sha_info_digest.addr, align 4
  call void (...) @_ssdm_SpecKeepArrayLoad(i32 %sha_info_digest.load) #2
  %outdata.addr = getelementptr [5 x i32], [5 x i32]* %outdata, i64 0, i64 %i.7
  store i32 %sha_info_digest.load, i32* %outdata.addr, align 4
  %add.ln225 = add nuw nsw i64 %i.7, 1
  br label %for.inc31, !llvm.loop !105

for.end33:                                        ; preds = %for.inc31
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @sha_init() unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @4), !fpga.pragma.source !4
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @4), !fpga.pragma.source !4
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
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @4), !fpga.pragma.source !4
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @4), !fpga.pragma.source !4
  %lo_bit_count = load i32, i32* @sha_info_count_lo, align 512
  %hi_bit_count = load i32, i32* @sha_info_count_hi, align 512
  %lshr.ln178 = lshr i32 %lo_bit_count, 3
  %count = and i32 %lshr.ln178, 63
  %count.1 = add nuw nsw i32 %count, 1
  %zext.ln179 = zext i32 %count to i64
  %sha_info_data.addr = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %zext.ln179
  store i32 128, i32* %sha_info_data.addr, align 4
  %icmp.ln181 = icmp ugt i32 %count.1, 56
  br i1 %icmp.ln181, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %xor.ln182 = xor i32 %count, 63
  call fastcc void @local_memset(i32 %xor.ln182, i32 %count.1)
  call fastcc void @sha_transform()
  call fastcc void @local_memset(i32 56, i32 0)
  br label %if.end

if.else:                                          ; preds = %entry
  %sub.ln186 = sub nuw nsw i32 55, %count
  call fastcc void @local_memset(i32 %sub.ln186, i32 %count.1)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 %hi_bit_count, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 14), align 8
  store i32 %lo_bit_count, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 15), align 4
  call fastcc void @sha_transform()
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @local_memset(i32 %n, i32 %e) unnamed_addr #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @4)
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @4)
  %lshr.ln58 = lshr i32 %n, 31
  %trunc.ln58 = trunc i32 %lshr.ln58 to i1
  %sub.ln58 = sub i32 0, %n
  %lshr.ln58.1 = lshr i32 %sub.ln58, 2
  %sub.ln58.1 = sub i32 0, %lshr.ln58.1
  %lshr.ln58.2 = lshr i32 %n, 2
  %m = select i1 %trunc.ln58, i32 %sub.ln58.1, i32 %lshr.ln58.2
  %icmp.ln61 = icmp sgt i32 %e, 0
  br i1 %icmp.ln61, label %while.body.lr.ph, label %local_memset_label1

while.body.lr.ph:                                 ; preds = %entry
  %add.ln61 = add nsw i32 %e, -1
  %zext.ln61 = zext i32 %add.ln61 to i64
  %add.ln61.1 = add nuw nsw i64 %zext.ln61, 1
  br label %local_memset_label1

local_memset_label1:                              ; preds = %while.body.lr.ph, %entry
  %p.0.lcssa.idx = phi i64 [ %add.ln61.1, %while.body.lr.ph ], [ 0, %entry ]
  %sext.ln65 = sext i32 %m to i64
  br label %while.body4

while.body4:                                      ; preds = %while.body4.split, %local_memset_label1
  %idx = phi i64 [ 0, %local_memset_label1 ], [ %add.ln65, %while.body4.split ]
  %icmp.ln65 = icmp slt i64 %idx, %sext.ln65
  br i1 %icmp.ln65, label %while.body4.split, label %while.end6.loopexit, !llvm.loop !112

while.body4.split:                                ; preds = %while.body4
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 0, i64 14, i64 7), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([20 x i8]* @15)
  %add.ln57 = add nsw i64 %idx, %p.0.lcssa.idx
  %p = getelementptr [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %add.ln57
  store i32 0, i32* %p, align 4
  %add.ln65 = add nuw nsw i64 %idx, 1
  br label %while.body4, !llvm.loop !112

while.end6.loopexit:                              ; preds = %while.body4
  ret void
}

; Function Attrs: noinline
define internal fastcc void @local_memcpy([16384 x i8]* noalias nocapture align 512 %s2, i64 %s2.offset, i32 %n, i64 %idx1) #0 {
entry:
  call void (...) @_ssdm_SpecArrayPartialAccess_Offset(i64 %s2.offset)
  call void (...) @_ssdm_SpecArrayPartialAccess([16384 x i8]* %s2, i64 %s2.offset, i32 1)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @4)
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @4)
  %lshr.ln76 = lshr i32 %n, 31
  %trunc.ln76 = trunc i32 %lshr.ln76 to i1
  %sub.ln76 = sub i32 0, %n
  %lshr.ln76.1 = lshr i32 %sub.ln76, 2
  %sub.ln76.1 = sub i32 0, %lshr.ln76.1
  %lshr.ln76.2 = lshr i32 %n, 2
  %m = select i1 %trunc.ln76, i32 %sub.ln76.1, i32 %lshr.ln76.2
  %sext.ln79 = sext i32 %m to i64
  br label %while.body

while.body:                                       ; preds = %while.body.split, %entry
  %idx = phi i64 [ 0, %entry ], [ %add.ln79, %while.body.split ]
  %idx9 = phi i64 [ 0, %entry ], [ %add.ln79.1, %while.body.split ]
  %icmp.ln79 = icmp slt i64 %idx9, %sext.ln79
  br i1 %icmp.ln79, label %while.body.split, label %while.end.loopexit, !llvm.loop !121

while.body.split:                                 ; preds = %while.body
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 0, i64 16, i64 8), !fpga.pragma.source !4
  call void (...) @_ssdm_op_SpecLoopName([20 x i8]* @12)
  %p1 = getelementptr [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %idx9
  %add.ln73 = add i64 %idx, %idx1
  %shl.ln73 = shl i64 %s2.offset, 13
  %add.ln73.1 = add i64 %shl.ln73, %add.ln73
  %p2 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %add.ln73.1
  %add.ln82 = add i64 %add.ln73, 1
  %shl.ln82 = shl i64 %s2.offset, 13
  %add.ln82.1 = add i64 %shl.ln82, %add.ln82
  %p2.1 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %add.ln82.1
  %p2.load = load i8, i8* %p2, align 1
  call void (...) @_ssdm_SpecKeepArrayLoad(i8 %p2.load) #2
  %add.ln83 = add i64 %add.ln73, 2
  %shl.ln83 = shl i64 %s2.offset, 13
  %add.ln83.1 = add i64 %shl.ln83, %add.ln83
  %p2.2 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %add.ln83.1
  %p2.1.load = load i8, i8* %p2.1, align 1
  call void (...) @_ssdm_SpecKeepArrayLoad(i8 %p2.1.load) #2
  %add.ln84 = add i64 %add.ln73, 3
  %shl.ln84 = shl i64 %s2.offset, 13
  %add.ln84.1 = add i64 %shl.ln84, %add.ln84
  %p2.3 = getelementptr [16384 x i8], [16384 x i8]* %s2, i64 0, i64 %add.ln84.1
  %p2.2.load = load i8, i8* %p2.2, align 1
  call void (...) @_ssdm_SpecKeepArrayLoad(i8 %p2.2.load) #2
  %p2.3.load = load i8, i8* %p2.3, align 1
  call void (...) @_ssdm_SpecKeepArrayLoad(i8 %p2.3.load) #2
  %tmp.1 = call i32 @_ssdm_op_BitConcatenate.i32.i8.i8.i8.i8(i8 %p2.3.load, i8 %p2.2.load, i8 %p2.1.load, i8 %p2.load)
  store i32 %tmp.1, i32* %p1, align 4
  %add.ln79 = add nuw nsw i64 %idx, 4
  %add.ln79.1 = add nuw nsw i64 %idx9, 1
  br label %while.body, !llvm.loop !121

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

declare void @_ssdm_SpecKeepArrayLoad(...)

declare void @_ssdm_SpecArrayPartialAccess_Offset(...)

declare void @_ssdm_SpecArrayPartialAccess(...)

; Function Attrs: nounwind
declare void @_ssdm_InlineSelf(...) #2

; Function Attrs: nounwind readnone
declare i32 @_ssdm_op_BitConcatenate.i32.i8.i8.i8.i8(i8, i8, i8, i8) #4

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
!4 = !{!"user"}
!5 = distinct !{!5, !6, !19, !20}
!6 = !{i32 168, i32 5, !7, null}
!7 = !{i32 786443, !8, !9}
!8 = !{i32 786478, i32 0, !9, !"sha_update", !"sha_update", null, !9, i32 154, !10, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !17, i32 154}
!9 = !{i32 786473, !"data/benchmarks/sha/sha.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!10 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !11, i32 0, i32 0}
!11 = !{null, !12, !16}
!12 = !{i32 786447, null, !"", !13, i32 0, i64 64, i64 0, i32 0, i32 0, !14}
!13 = !{i32 786473, !"<unknown>", null, null}
!14 = !{i32 786470, null, !"", !13, i32 0, i64 0, i64 0, i32 0, i32 0, !15}
!15 = !{i32 786468, null, !"unsigned char", null, i32 0, i64 8, i64 0, i32 0, i32 0, i32 8}
!16 = !{i32 786468, null, !"int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 5}
!17 = !{!18}
!18 = !{i32 0}
!19 = !{!"llvm.loop.name", !"sha_update_label4"}
!20 = !{!"llvm.loop.tripcount", i32 127, i32 128, i32 127, !"user", !21}
!21 = !{i32 163, i32 9, !7, null}
!22 = distinct !{!22, !23, !29, !30}
!23 = !{i32 101, i32 5, !24, null}
!24 = !{i32 786443, !25, i32 98, i32 5, !9, i32 0}
!25 = !{i32 786443, !26, !9}
!26 = !{i32 786478, i32 0, !9, !"sha_transform", !"sha_transform", null, !9, i32 92, !27, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @sha_transform, null, null, !17, i32 92}
!27 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !28, i32 0, i32 0}
!28 = !{null}
!29 = !{!"llvm.loop.name", !"sha_transform_label1"}
!30 = !{!"llvm.loop.tripcount", i32 16, i32 16, i32 16, !"user", !31}
!31 = !{i32 99, i32 9, !32, null}
!32 = !{i32 786443, !24, !9}
!33 = distinct !{!33, !34, !36, !37}
!34 = !{i32 107, i32 5, !35, null}
!35 = !{i32 786443, !25, i32 104, i32 5, !9, i32 0}
!36 = !{!"llvm.loop.name", !"sha_transform_label2"}
!37 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !38}
!38 = !{i32 105, i32 9, !39, null}
!39 = !{i32 786443, !35, !9}
!40 = distinct !{!40, !41, !43, !44}
!41 = !{i32 120, i32 5, !42, null}
!42 = !{i32 786443, !25, i32 117, i32 27, !9, i32 0}
!43 = !{!"llvm.loop.name", !"sha_transform_label3"}
!44 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !45}
!45 = !{i32 118, i32 9, !46, null}
!46 = !{i32 786443, !42, !9}
!47 = distinct !{!47, !48, !50, !51}
!48 = !{i32 124, i32 5, !49, null}
!49 = !{i32 786443, !25, i32 121, i32 27, !9, i32 0}
!50 = !{!"llvm.loop.name", !"sha_transform_label4"}
!51 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !52}
!52 = !{i32 122, i32 9, !53, null}
!53 = !{i32 786443, !49, !9}
!54 = distinct !{!54, !55, !57, !58}
!55 = !{i32 128, i32 5, !56, null}
!56 = !{i32 786443, !25, i32 125, i32 27, !9, i32 0}
!57 = !{!"llvm.loop.name", !"sha_transform_label5"}
!58 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !59}
!59 = !{i32 126, i32 9, !60, null}
!60 = !{i32 786443, !56, !9}
!61 = distinct !{!61, !62, !64, !65}
!62 = !{i32 132, i32 5, !63, null}
!63 = !{i32 786443, !25, i32 129, i32 27, !9, i32 0}
!64 = !{!"llvm.loop.name", !"sha_transform_label6"}
!65 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !66}
!66 = !{i32 130, i32 9, !67, null}
!67 = !{i32 786443, !63, !9}
!68 = !{!1}
!69 = distinct !{!69, !70, !84, !85}
!70 = !{i32 211, i32 5, !71, null}
!71 = !{i32 786443, !72, i32 205, i32 5, !9, i32 0}
!72 = !{i32 786443, !73, !9}
!73 = !{i32 786478, i32 0, !9, !"sha_stream", !"sha_stream", null, !9, i32 196, !74, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !17, i32 200}
!74 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !75, i32 0, i32 0}
!75 = !{null, !76, !80, !82}
!76 = !{i32 786447, null, !"", !13, i32 0, i64 64, i64 0, i32 0, i32 0, !77}
!77 = !{i32 786433, null, !"", null, i32 0, i64 65536, i64 0, i32 0, i32 0, !14, !78, i32 0, null, null}
!78 = !{!79}
!79 = !{i32 786465, i64 0, i64 8191}
!80 = !{i32 786447, null, !"", !13, i32 0, i64 64, i64 0, i32 0, i32 0, !81}
!81 = !{i32 786470, null, !"", !13, i32 0, i64 0, i64 0, i32 0, i32 0, !16}
!82 = !{i32 786447, null, !"", !13, i32 0, i64 64, i64 0, i32 0, i32 0, !83}
!83 = !{i32 786468, null, !"unsigned int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 7}
!84 = !{!"llvm.loop.name", !"sha_stream_label1"}
!85 = !{!"llvm.loop.tripcount", i32 2, i32 2, i32 2, !"user", !86}
!86 = !{i32 206, i32 9, !87, null}
!87 = !{i32 786443, !71, !9}
!88 = distinct !{!88, !89, !93, !94, !95, !97}
!89 = !{i32 207, i32 20, !90, null}
!90 = !{i32 786443, !91, i32 207, i32 20, !9, i32 0}
!91 = !{i32 786443, !92, i32 205, i32 29, !9, i32 0}
!92 = !{i32 786443, !87, i32 205, i32 5, !9, i32 0}
!93 = !{i32 210, i32 9, !90, null}
!94 = !{!"llvm.loop.name", !"VITIS_LOOP_207_1"}
!95 = !{!"llvm.loop.tripcount", i32 8192, i32 8192, i32 8192, !"user", !96}
!96 = !{i32 208, i32 9, !90, null}
!97 = !{!"llvm.loop.pipeline.enable", i32 -1, i1 false, i8 -1, !"auto"}
!98 = distinct !{!98, !99, !101, !102}
!99 = !{i32 221, i32 5, !100, null}
!100 = !{i32 786443, !72, i32 216, i32 5, !9, i32 0}
!101 = !{!"llvm.loop.name", !"sha_stream_label0"}
!102 = !{!"llvm.loop.tripcount", i32 2, i32 2, i32 2, !"user", !103}
!103 = !{i32 217, i32 9, !104, null}
!104 = !{i32 786443, !100, !9}
!105 = distinct !{!105, !106, !108, !109}
!106 = !{i32 228, i32 5, !107, null}
!107 = !{i32 786443, !72, i32 225, i32 5, !9, i32 0}
!108 = !{!"llvm.loop.name", !"sha_stream_label2"}
!109 = !{!"llvm.loop.tripcount", i32 5, i32 5, i32 5, !"user", !110}
!110 = !{i32 226, i32 9, !111, null}
!111 = !{i32 786443, !107, !9}
!112 = distinct !{!112, !113, !118, !119}
!113 = !{i32 68, i32 5, !114, null}
!114 = !{i32 786443, !115, !9}
!115 = !{i32 786478, i32 0, !9, !"local_memset", !"local_memset", null, !9, i32 55, !116, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32)* @local_memset, null, null, !17, i32 55}
!116 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !117, i32 0, i32 0}
!117 = !{null, !82, !16, !16, !16}
!118 = !{!"llvm.loop.name", !"local_memset_label1"}
!119 = !{!"llvm.loop.tripcount", i32 0, i32 14, i32 7, !"user", !120}
!120 = !{i32 66, i32 9, !114, null}
!121 = distinct !{!121, !122, !127, !128}
!122 = !{i32 88, i32 5, !123, null}
!123 = !{i32 786443, !124, !9}
!124 = !{i32 786478, i32 0, !9, !"local_memcpy", !"local_memcpy", null, !9, i32 72, !125, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !17, i32 72}
!125 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !126, i32 0, i32 0}
!126 = !{null, !82, !12, !16}
!127 = !{!"llvm.loop.name", !"local_memcpy_label3"}
!128 = !{!"llvm.loop.tripcount", i32 0, i32 16, i32 8, !"user", !129}
!129 = !{i32 80, i32 9, !123, null}
