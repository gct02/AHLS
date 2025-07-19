; ModuleID = 'data/base_solutions/SHA/solution0/.autopilot/db/a.g.bc'
source_filename = "data/base_solutions/SHA/solution0/.autopilot/db/a.g.bc"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

@sha_info_data = internal global [16 x i32] zeroinitializer, align 512
@sha_info_digest = internal unnamed_addr global [5 x i32] zeroinitializer, align 512
@sha_info_count_lo = internal unnamed_addr global i32 0, align 512
@sha_info_count_hi = internal unnamed_addr global i32 0, align 512
@local_indata = internal global [2 x [8192 x i8]] zeroinitializer, align 512
@0 = private unnamed_addr constant [10 x i8] c"ap_memory\00"
@1 = private unnamed_addr constant [1 x i8] zeroinitializer
@2 = private unnamed_addr constant [20 x i8] c"local_memset_label1\00"
@3 = private unnamed_addr constant [21 x i8] c"sha_transform_label6\00"
@4 = private unnamed_addr constant [21 x i8] c"sha_transform_label5\00"
@5 = private unnamed_addr constant [21 x i8] c"sha_transform_label4\00"
@6 = private unnamed_addr constant [21 x i8] c"sha_transform_label3\00"
@7 = private unnamed_addr constant [21 x i8] c"sha_transform_label2\00"
@8 = private unnamed_addr constant [21 x i8] c"sha_transform_label1\00"
@9 = private unnamed_addr constant [11 x i8] c"sha_stream\00"
@10 = private unnamed_addr constant [18 x i8] c"sha_stream_label2\00"
@11 = private unnamed_addr constant [18 x i8] c"sha_stream_label0\00"
@12 = private unnamed_addr constant [17 x i8] c"VITIS_LOOP_207_1\00"
@13 = private unnamed_addr constant [18 x i8] c"sha_stream_label1\00"
@14 = private unnamed_addr constant [18 x i8] c"sha_update_label4\00"
@15 = private unnamed_addr constant [20 x i8] c"local_memcpy_label3\00"

; Function Attrs: noinline nounwind
define internal fastcc void @local_memset(i32 %n, i32 %e) unnamed_addr #0 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1)
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @1)
  %div = sdiv i32 %n, 4
  %cmp6 = icmp sgt i32 %e, 0
  br i1 %cmp6, label %while.body.lr.ph, label %local_memset_label1

while.body.lr.ph:                                 ; preds = %entry
  %0 = add nsw i32 %e, -1
  %1 = zext i32 %0 to i64
  %2 = add nuw nsw i64 %1, 1
  br label %local_memset_label1

local_memset_label1:                              ; preds = %while.body.lr.ph, %entry
  %p.0.lcssa.idx = phi i64 [ 0, %entry ], [ %2, %while.body.lr.ph ]
  %3 = sext i32 %div to i64
  br label %while.body4

while.body4:                                      ; preds = %while.body4.split, %local_memset_label1
  %idx = phi i64 [ 0, %local_memset_label1 ], [ %inc, %while.body4.split ]
  %exitcond21 = icmp slt i64 %idx, %3
  br i1 %exitcond21, label %while.body4.split, label %while.end6.loopexit, !llvm.loop !4

while.body4.split:                                ; preds = %while.body4
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 0, i64 14, i64 7), !fpga.pragma.source !20
  call void (...) @_ssdm_op_SpecLoopName([20 x i8]* @2)
  %p.0.lcssa9.sum = add nsw i64 %p.0.lcssa.idx, %idx
  %p.0.lcssa9.gep1 = getelementptr [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %p.0.lcssa9.sum
  store i32 0, i32* %p.0.lcssa9.gep1, align 4
  %inc = add nuw nsw i64 %idx, 1
  br label %while.body4, !llvm.loop !4

while.end6.loopexit:                              ; preds = %while.body4
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @sha_transform() unnamed_addr #0 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1), !fpga.pragma.source !20
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @1), !fpga.pragma.source !20
  %W = alloca [80 x i32], align 512
  br label %for.inc

for.inc:                                          ; preds = %for.inc.split, %entry
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.inc.split ], [ 0, %entry ]
  %exitcond466 = icmp ne i64 %indvars.iv44, 16
  br i1 %exitcond466, label %for.inc.split, label %sha_transform_label2, !llvm.loop !21

for.inc.split:                                    ; preds = %for.inc
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 16, i64 16, i64 16), !fpga.pragma.source !20
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @8)
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %indvars.iv44
  %0 = load i32, i32* %arrayidx, align 4
  %arrayidx2 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %indvars.iv44
  store i32 %0, i32* %arrayidx2, align 4
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  br label %for.inc, !llvm.loop !21

sha_transform_label2:                             ; preds = %for.inc
  br label %for.inc21

for.inc21:                                        ; preds = %for.inc21.split, %sha_transform_label2
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.inc21.split ], [ 16, %sha_transform_label2 ]
  %exitcond435 = icmp ne i64 %indvars.iv37, 80
  br i1 %exitcond435, label %for.inc21.split, label %for.end23, !llvm.loop !32

for.inc21.split:                                  ; preds = %for.inc21
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !20
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @7)
  %1 = sub nuw nsw i64 %indvars.iv37, 3
  %arrayidx7 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %1
  %2 = load i32, i32* %arrayidx7, align 4
  %3 = sub nuw nsw i64 %indvars.iv37, 8
  %arrayidx10 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %3
  %4 = load i32, i32* %arrayidx10, align 4
  %5 = sub nuw nsw i64 %indvars.iv37, 14
  %arrayidx13 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %5
  %6 = load i32, i32* %arrayidx13, align 4
  %7 = sub nuw nsw i64 %indvars.iv37, 16
  %arrayidx17 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %7
  %8 = load i32, i32* %arrayidx17, align 4
  %thr.xor98 = xor i32 %8, %4
  %thr.xor99 = xor i32 %6, %2
  %thr.xor100 = xor i32 %thr.xor98, %thr.xor99
  %arrayidx20 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %indvars.iv37
  store i32 %thr.xor100, i32* %arrayidx20, align 4
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  br label %for.inc21, !llvm.loop !32

for.end23:                                        ; preds = %for.inc21
  %9 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512
  %10 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4
  %11 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8
  %12 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4
  %13 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16
  br label %for.inc38

for.inc38:                                        ; preds = %for.inc38.split, %for.end23
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.inc38.split ], [ 0, %for.end23 ]
  %A.024 = phi i32 [ %9, %for.end23 ], [ %conv34, %for.inc38.split ]
  %B.023 = phi i32 [ %10, %for.end23 ], [ %A.024, %for.inc38.split ]
  %C.022 = phi i32 [ %11, %for.end23 ], [ %or37, %for.inc38.split ]
  %D.021 = phi i32 [ %12, %for.end23 ], [ %C.022, %for.inc38.split ]
  %E.020 = phi i32 [ %13, %for.end23 ], [ %D.021, %for.inc38.split ]
  %exitcond364 = icmp ne i64 %indvars.iv34, 20
  br i1 %exitcond364, label %for.inc38.split, label %for.end40, !llvm.loop !39

for.inc38.split:                                  ; preds = %for.inc38
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !20
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @6)
  %shl = shl i32 %A.024, 5
  %shr = lshr i32 %A.024, 27
  %arrayidx31 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %indvars.iv34
  %14 = load i32, i32* %arrayidx31, align 4
  %thr.xor91 = xor i32 %B.023, -1
  %thr.and = and i32 %B.023, %C.022
  %thr.and92 = and i32 %D.021, %thr.xor91
  %thr.or93 = or i32 %thr.and, %thr.and92
  %thr.or94 = or i32 %shl, %shr
  %thr.add95 = add i32 %thr.or93, %E.020
  %thr.add96 = add i32 %14, %thr.or94
  %thr.add97 = add i32 %thr.add95, %thr.add96
  %conv = zext i32 %thr.add97 to i64
  %add33 = add nuw nsw i64 %conv, 1518500249
  %conv34 = trunc i64 %add33 to i32
  %shl35 = shl i32 %B.023, 30
  %shr36 = lshr i32 %B.023, 2
  %or37 = or i32 %shl35, %shr36
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  br label %for.inc38, !llvm.loop !39

for.end40:                                        ; preds = %for.inc38
  br label %for.inc60

for.inc60:                                        ; preds = %for.inc60.split, %for.end40
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.inc60.split ], [ 20, %for.end40 ]
  %A.118 = phi i32 [ %A.024, %for.end40 ], [ %conv56, %for.inc60.split ]
  %B.117 = phi i32 [ %B.023, %for.end40 ], [ %A.118, %for.inc60.split ]
  %C.116 = phi i32 [ %C.022, %for.end40 ], [ %or59, %for.inc60.split ]
  %D.115 = phi i32 [ %D.021, %for.end40 ], [ %C.116, %for.inc60.split ]
  %E.114 = phi i32 [ %E.020, %for.end40 ], [ %D.115, %for.inc60.split ]
  %exitcond333 = icmp ne i64 %indvars.iv31, 40
  br i1 %exitcond333, label %for.inc60.split, label %for.end62, !llvm.loop !46

for.inc60.split:                                  ; preds = %for.inc60
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !20
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @5)
  %shl44 = shl i32 %A.118, 5
  %shr45 = lshr i32 %A.118, 27
  %arrayidx52 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %indvars.iv31
  %15 = load i32, i32* %arrayidx52, align 4
  %thr.xor = xor i32 %B.117, %C.116
  %thr.xor86 = xor i32 %thr.xor, %D.115
  %thr.or87 = or i32 %shl44, %shr45
  %thr.add88 = add i32 %thr.xor86, %E.114
  %thr.add89 = add i32 %15, %thr.or87
  %thr.add90 = add i32 %thr.add88, %thr.add89
  %conv54 = zext i32 %thr.add90 to i64
  %add55 = add nuw nsw i64 %conv54, 1859775393
  %conv56 = trunc i64 %add55 to i32
  %shl57 = shl i32 %B.117, 30
  %shr58 = lshr i32 %B.117, 2
  %or59 = or i32 %shl57, %shr58
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  br label %for.inc60, !llvm.loop !46

for.end62:                                        ; preds = %for.inc60
  br label %for.inc85

for.inc85:                                        ; preds = %for.inc85.split, %for.end62
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %for.inc85.split ], [ 40, %for.end62 ]
  %A.212 = phi i32 [ %A.118, %for.end62 ], [ %conv81, %for.inc85.split ]
  %B.211 = phi i32 [ %B.117, %for.end62 ], [ %A.212, %for.inc85.split ]
  %C.210 = phi i32 [ %C.116, %for.end62 ], [ %or84, %for.inc85.split ]
  %D.29 = phi i32 [ %D.115, %for.end62 ], [ %C.210, %for.inc85.split ]
  %E.28 = phi i32 [ %E.114, %for.end62 ], [ %D.29, %for.inc85.split ]
  %exitcond302 = icmp ne i64 %indvars.iv28, 60
  br i1 %exitcond302, label %for.inc85.split, label %for.end87, !llvm.loop !53

for.inc85.split:                                  ; preds = %for.inc85
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !20
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @4)
  %shl66 = shl i32 %A.212, 5
  %shr67 = lshr i32 %A.212, 27
  %arrayidx77 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %indvars.iv28
  %16 = load i32, i32* %arrayidx77, align 4
  %thr.or = or i32 %C.210, %D.29
  %thr.and80 = and i32 %B.211, %thr.or
  %thr.and81 = and i32 %C.210, %D.29
  %thr.or82 = or i32 %thr.and80, %thr.and81
  %thr.or83 = or i32 %shl66, %shr67
  %thr.add = add i32 %thr.or82, %E.28
  %thr.add84 = add i32 %16, %thr.or83
  %thr.add85 = add i32 %thr.add, %thr.add84
  %conv79 = zext i32 %thr.add85 to i64
  %add80 = add nuw nsw i64 %conv79, 2400959708
  %conv81 = trunc i64 %add80 to i32
  %shl82 = shl i32 %B.211, 30
  %shr83 = lshr i32 %B.211, 2
  %or84 = or i32 %shl82, %shr83
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  br label %for.inc85, !llvm.loop !53

for.end87:                                        ; preds = %for.inc85
  br label %for.inc107

for.inc107:                                       ; preds = %for.inc107.split, %for.end87
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc107.split ], [ 60, %for.end87 ]
  %A.36 = phi i32 [ %A.212, %for.end87 ], [ %conv103, %for.inc107.split ]
  %B.35 = phi i32 [ %B.211, %for.end87 ], [ %A.36, %for.inc107.split ]
  %C.34 = phi i32 [ %C.210, %for.end87 ], [ %or106, %for.inc107.split ]
  %D.33 = phi i32 [ %D.29, %for.end87 ], [ %C.34, %for.inc107.split ]
  %E.32 = phi i32 [ %E.28, %for.end87 ], [ %D.33, %for.inc107.split ]
  %exitcond1 = icmp ne i64 %indvars.iv, 80
  br i1 %exitcond1, label %for.inc107.split, label %for.end109, !llvm.loop !60

for.inc107.split:                                 ; preds = %for.inc107
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 20, i64 20, i64 20), !fpga.pragma.source !20
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @3)
  %shl91 = shl i32 %A.36, 5
  %shr92 = lshr i32 %A.36, 27
  %arrayidx99 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %indvars.iv
  %17 = load i32, i32* %arrayidx99, align 4
  %thr.xor74 = xor i32 %B.35, %C.34
  %thr.xor75 = xor i32 %thr.xor74, %D.33
  %thr.or76 = or i32 %shl91, %shr92
  %thr.add77 = add i32 %thr.xor75, %E.32
  %thr.add78 = add i32 %17, %thr.or76
  %thr.add79 = add i32 %thr.add77, %thr.add78
  %conv101 = zext i32 %thr.add79 to i64
  %add102 = add nuw nsw i64 %conv101, 3395469782
  %conv103 = trunc i64 %add102 to i32
  %shl104 = shl i32 %B.35, 30
  %shr105 = lshr i32 %B.35, 2
  %or106 = or i32 %shl104, %shr105
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc107, !llvm.loop !60

for.end109:                                       ; preds = %for.inc107
  %add110 = add i32 %9, %A.36
  store i32 %add110, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 512
  %add111 = add i32 %10, %B.35
  store i32 %add111, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4
  %add112 = add i32 %11, %C.34
  store i32 %add112, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 8
  %add113 = add i32 %12, %D.33
  store i32 %add113, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4
  %add114 = add i32 %13, %E.32
  store i32 %add114, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 16
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @sha_init() unnamed_addr #0 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1), !fpga.pragma.source !20
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @1), !fpga.pragma.source !20
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
define internal fastcc void @sha_final() unnamed_addr #0 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1), !fpga.pragma.source !20
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @1), !fpga.pragma.source !20
  %0 = load i32, i32* @sha_info_count_lo, align 512
  %1 = load i32, i32* @sha_info_count_hi, align 512
  %shr = lshr i32 %0, 3
  %and = and i32 %shr, 63
  %inc = add nuw nsw i32 %and, 1
  %idxprom = sext i32 %and to i64
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %idxprom
  store i32 128, i32* %arrayidx, align 4
  %cmp = icmp sgt i32 %inc, 56
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %sub = sub nuw nsw i32 63, %and
  call fastcc void @local_memset(i32 %sub, i32 %inc)
  call fastcc void @sha_transform()
  call fastcc void @local_memset(i32 56, i32 0)
  br label %if.end

if.else:                                          ; preds = %entry
  %sub1 = sub nuw nsw i32 55, %and
  call fastcc void @local_memset(i32 %sub1, i32 %inc)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 %1, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 14), align 8
  store i32 %0, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 15), align 4
  call fastcc void @sha_transform()
  ret void
}

; Function Attrs: nounwind
define void @sha_stream([2 x [8192 x i8]]* noalias %indata, [2 x i32]* noalias %in_i, [5 x i32]* noalias %outdata) #1 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1), !fpga.pragma.source !20
  call void (...) @_ssdm_op_SpecTopModule([11 x i8]* @9), !fpga.pragma.source !20
  call void (...) @_ssdm_op_SpecInterface([2 x [8192 x i8]]* %indata, [10 x i8]* @0, i32 0, i32 0, [1 x i8]* @1, i32 -1, i32 0, [1 x i8]* @1, [1 x i8]* @1, [1 x i8]* @1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @1, [1 x i8]* @1, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([2 x [8192 x i8]]* %indata), !map !67
  call void (...) @_ssdm_op_SpecInterface([2 x i32]* %in_i, [10 x i8]* @0, i32 0, i32 0, [1 x i8]* @1, i32 -1, i32 0, [1 x i8]* @1, [1 x i8]* @1, [1 x i8]* @1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @1, [1 x i8]* @1, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([2 x i32]* %in_i), !map !67
  call void (...) @_ssdm_op_SpecInterface([5 x i32]* %outdata, [10 x i8]* @0, i32 0, i32 0, [1 x i8]* @1, i32 -1, i32 0, [1 x i8]* @1, [1 x i8]* @1, [1 x i8]* @1, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @1, [1 x i8]* @1, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([5 x i32]* %outdata), !map !67
  br label %VITIS_LOOP_207_1

VITIS_LOOP_207_1:                                 ; preds = %for.inc10, %entry
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.inc10 ], [ 0, %entry ]
  %exitcond164 = icmp ne i64 %indvars.iv14, 2
  br i1 %exitcond164, label %VITIS_LOOP_207_1.split, label %for.end12, !llvm.loop !68

VITIS_LOOP_207_1.split:                           ; preds = %VITIS_LOOP_207_1
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 2, i64 2, i64 2), !fpga.pragma.source !20
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @13)
  br label %for.inc

for.inc:                                          ; preds = %for.inc.split, %VITIS_LOOP_207_1.split
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %for.inc.split ], [ 0, %VITIS_LOOP_207_1.split ]
  %exitcond133 = icmp ne i64 %indvars.iv11, 8192
  br i1 %exitcond133, label %for.inc.split, label %for.inc10, !llvm.loop !87

for.inc.split:                                    ; preds = %for.inc
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @1)
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 8192, i64 8192, i64 8192), !fpga.pragma.source !20
  call void (...) @_ssdm_op_SpecLoopName([17 x i8]* @12)
  %0 = getelementptr [2 x [8192 x i8]], [2 x [8192 x i8]]* %indata, i64 0, i64 %indvars.iv14, i64 %indvars.iv11
  %1 = load i8, i8* %0, align 1
  %arrayidx93 = getelementptr inbounds [2 x [8192 x i8]], [2 x [8192 x i8]]* @local_indata, i64 0, i64 %indvars.iv14, i64 %indvars.iv11
  store i8 %1, i8* %arrayidx93, align 1
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br label %for.inc, !llvm.loop !87

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  br label %VITIS_LOOP_207_1, !llvm.loop !68

for.end12:                                        ; preds = %VITIS_LOOP_207_1
  call fastcc void @sha_init()
  br label %for.inc21

for.inc21:                                        ; preds = %for.inc21.split, %for.end12
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.inc21.split ], [ 0, %for.end12 ]
  %exitcond102 = icmp ne i64 %indvars.iv8, 2
  br i1 %exitcond102, label %for.inc21.split, label %for.end23, !llvm.loop !97

for.inc21.split:                                  ; preds = %for.inc21
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 2, i64 2, i64 2), !fpga.pragma.source !20
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @11)
  %2 = getelementptr [2 x i32], [2 x i32]* %in_i, i64 0, i64 %indvars.iv8
  %3 = load i32, i32* %2, align 4
  %4 = getelementptr inbounds [2 x [8192 x i8]], [2 x [8192 x i8]]* @local_indata, i64 0, i64 %indvars.iv8
  call fastcc void @sha_update([8192 x i8]* %4, i32 %3)
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  br label %for.inc21, !llvm.loop !97

for.end23:                                        ; preds = %for.inc21
  call fastcc void @sha_final()
  br label %for.inc31

for.inc31:                                        ; preds = %for.inc31.split, %for.end23
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc31.split ], [ 0, %for.end23 ]
  %exitcond1 = icmp ne i64 %indvars.iv, 5
  br i1 %exitcond1, label %for.inc31.split, label %for.end33, !llvm.loop !104

for.inc31.split:                                  ; preds = %for.inc31
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 5, i64 5, i64 5), !fpga.pragma.source !20
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @10)
  %arrayidx28 = getelementptr inbounds [5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 %indvars.iv
  %5 = load i32, i32* %arrayidx28, align 4
  %6 = getelementptr [5 x i32], [5 x i32]* %outdata, i64 0, i64 %indvars.iv
  store i32 %5, i32* %6, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc31, !llvm.loop !104

for.end33:                                        ; preds = %for.inc31
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @sha_update([8192 x i8]* noalias nocapture align 512 %buffer, i32 %count) unnamed_addr #0 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1), !fpga.pragma.source !20
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @1), !fpga.pragma.source !20
  %0 = load i32, i32* @sha_info_count_lo, align 512
  %shl = shl i32 %count, 3
  %add = add i32 %0, %shl
  %cmp = icmp ult i32 %add, %0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @sha_info_count_hi, align 512
  %inc = add i32 %1, 1
  store i32 %inc, i32* @sha_info_count_hi, align 512
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 %add, i32* @sha_info_count_lo, align 512
  %shr = lshr i32 %count, 29
  %2 = load i32, i32* @sha_info_count_hi, align 512
  %add3 = add i32 %2, %shr
  store i32 %add3, i32* @sha_info_count_hi, align 512
  %cmp41 = icmp sge i32 %count, 64
  br label %while.body

while.body:                                       ; preds = %while.body.split, %if.end
  %count.addr.02 = phi i32 [ %count, %if.end ], [ %sub, %while.body.split ]
  %idx = phi i64 [ 0, %if.end ], [ %inc5, %while.body.split ]
  %cmp42 = icmp sge i32 %count.addr.02, 64
  br i1 %cmp42, label %while.body.split, label %while.end.loopexit, !llvm.loop !111

while.body.split:                                 ; preds = %while.body
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 127, i64 128, i64 127), !fpga.pragma.source !20
  call void (...) @_ssdm_op_SpecLoopName([18 x i8]* @14)
  call fastcc void @local_memcpy([8192 x i8]* %buffer, i32 64, i64 %idx)
  call fastcc void @sha_transform()
  %sub = sub nuw nsw i32 %count.addr.02, 64
  %inc5 = add nuw nsw i64 %idx, 64
  br label %while.body, !llvm.loop !111

while.end.loopexit:                               ; preds = %while.body
  %3 = add nsw i32 %count, -64
  %4 = lshr i32 %3, 6
  %5 = zext i32 %4 to i64
  %6 = shl nuw nsw i64 %5, 6
  %7 = add nuw nsw i64 %6, 64
  %8 = shl nuw nsw i32 %4, 6
  %9 = sub i32 %3, %8
  %count.addr.0.lcssa.sel = select i1 %cmp41, i32 %9, i32 %count
  %buffer.addr.0.lcssa.idx.sel = select i1 %cmp41, i64 %7, i64 0
  call fastcc void @local_memcpy([8192 x i8]* %buffer, i32 %count.addr.0.lcssa.sel, i64 %buffer.addr.0.lcssa.idx.sel)
  ret void
}

; Function Attrs: noinline nounwind
define internal fastcc void @local_memcpy([8192 x i8]* noalias nocapture align 512 %s2, i32 %n, i64 %idx1) unnamed_addr #0 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @1)
  call void (...) @_ssdm_InlineSelf(i64 2, [1 x i8]* @1)
  %div = sdiv i32 %n, 4
  %0 = sext i32 %div to i64
  br label %while.body

while.body:                                       ; preds = %while.body.split, %entry
  %idx = phi i64 [ 0, %entry ], [ %inc, %while.body.split ]
  %idx9 = phi i64 [ 0, %entry ], [ %inc10, %while.body.split ]
  %exitcond91 = icmp slt i64 %idx9, %0
  br i1 %exitcond91, label %while.body.split, label %while.end.loopexit, !llvm.loop !121

while.body.split:                                 ; preds = %while.body
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 0, i64 16, i64 8), !fpga.pragma.source !20
  call void (...) @_ssdm_op_SpecLoopName([20 x i8]* @15)
  %.gep2 = getelementptr [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %idx9
  %.sum = add i64 %idx1, %idx
  %s2.gep3 = getelementptr [8192 x i8], [8192 x i8]* %s2, i64 0, i64 %.sum
  %s2.gep3.sum = add i64 %.sum, 1
  %incdec.ptr4 = getelementptr [8192 x i8], [8192 x i8]* %s2, i64 0, i64 %s2.gep3.sum
  %1 = load i8, i8* %s2.gep3, align 1
  %conv = zext i8 %1 to i32
  %s2.gep3.sum5 = add i64 %.sum, 2
  %incdec.ptr116 = getelementptr [8192 x i8], [8192 x i8]* %s2, i64 0, i64 %s2.gep3.sum5
  %2 = load i8, i8* %incdec.ptr4, align 1
  %conv2 = zext i8 %2 to i32
  %shl = shl nuw nsw i32 %conv2, 8
  %s2.gep3.sum7 = add i64 %.sum, 3
  %incdec.ptr528 = getelementptr [8192 x i8], [8192 x i8]* %s2, i64 0, i64 %s2.gep3.sum7
  %3 = load i8, i8* %incdec.ptr116, align 1
  %conv6 = zext i8 %3 to i32
  %shl8 = shl nuw nsw i32 %conv6, 16
  %4 = load i8, i8* %incdec.ptr528, align 1
  %conv11 = zext i8 %4 to i32
  %shl13 = shl nuw i32 %conv11, 24
  %thr.or12 = or i32 %shl13, %conv
  %thr.or13 = or i32 %shl8, %shl
  %thr.or14 = or i32 %thr.or12, %thr.or13
  store i32 %thr.or14, i32* %.gep2, align 4
  %inc = add nuw nsw i64 %idx, 4
  %inc10 = add nuw nsw i64 %idx9, 1
  br label %while.body, !llvm.loop !121

while.end.loopexit:                               ; preds = %while.body
  ret void
}

; Function Attrs: nounwind
declare void @_ssdm_op_SpecInterface(...) #1

; Function Attrs: nounwind
declare void @_ssdm_op_SpecBitsMap(...) #1

; Function Attrs: nounwind
declare void @_ssdm_op_SpecPipeline(...) #1

; Function Attrs: nounwind
declare void @_ssdm_InlineSelf(...) #1

; Function Attrs: nounwind
declare void @_ssdm_op_SpecLoopTripCount(...) #1

; Function Attrs: nounwind
declare void @_ssdm_op_SpecLoopName(...) #1

; Function Attrs: nounwind
declare void @_ssdm_op_SpecTopModule(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, i64, metadata) #2

attributes #0 = { noinline nounwind }
attributes #1 = { nounwind }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!blackbox_cfg = !{!1}
!llvm.module.flags = !{!2, !3}

!0 = !{!"clang version 7.0.0 "}
!1 = !{}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"reflow.full.lowering", i32 1}
!4 = distinct !{!4, !5, !17, !18}
!5 = !{i32 68, i32 5, !6, null}
!6 = !{i32 786443, !7, !8}
!7 = !{i32 786478, i32 0, !8, !"local_memset", !"local_memset", null, !8, i32 55, !9, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32, i32)* @local_memset, null, null, !15, i32 55}
!8 = !{i32 786473, !"data/benchmarks/sha/sha.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!9 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !10, i32 0, i32 0}
!10 = !{null, !11, !14, !14, !14}
!11 = !{i32 786447, null, !"", !12, i32 0, i64 64, i64 0, i32 0, i32 0, !13}
!12 = !{i32 786473, !"<unknown>", null, null}
!13 = !{i32 786468, null, !"unsigned int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 7}
!14 = !{i32 786468, null, !"int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 5}
!15 = !{!16}
!16 = !{i32 0}
!17 = !{!"llvm.loop.name", !"local_memset_label1"}
!18 = !{!"llvm.loop.tripcount", i32 0, i32 14, i32 7, !"user", !19}
!19 = !{i32 66, i32 9, !6, null}
!20 = !{!"user"}
!21 = distinct !{!21, !22, !28, !29}
!22 = !{i32 101, i32 5, !23, null}
!23 = !{i32 786443, !24, i32 98, i32 5, !8, i32 0}
!24 = !{i32 786443, !25, !8}
!25 = !{i32 786478, i32 0, !8, !"sha_transform", !"sha_transform", null, !8, i32 92, !26, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @sha_transform, null, null, !15, i32 92}
!26 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !27, i32 0, i32 0}
!27 = !{null}
!28 = !{!"llvm.loop.name", !"sha_transform_label1"}
!29 = !{!"llvm.loop.tripcount", i32 16, i32 16, i32 16, !"user", !30}
!30 = !{i32 99, i32 9, !31, null}
!31 = !{i32 786443, !23, !8}
!32 = distinct !{!32, !33, !35, !36}
!33 = !{i32 107, i32 5, !34, null}
!34 = !{i32 786443, !24, i32 104, i32 5, !8, i32 0}
!35 = !{!"llvm.loop.name", !"sha_transform_label2"}
!36 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !37}
!37 = !{i32 105, i32 9, !38, null}
!38 = !{i32 786443, !34, !8}
!39 = distinct !{!39, !40, !42, !43}
!40 = !{i32 120, i32 5, !41, null}
!41 = !{i32 786443, !24, i32 117, i32 27, !8, i32 0}
!42 = !{!"llvm.loop.name", !"sha_transform_label3"}
!43 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !44}
!44 = !{i32 118, i32 9, !45, null}
!45 = !{i32 786443, !41, !8}
!46 = distinct !{!46, !47, !49, !50}
!47 = !{i32 124, i32 5, !48, null}
!48 = !{i32 786443, !24, i32 121, i32 27, !8, i32 0}
!49 = !{!"llvm.loop.name", !"sha_transform_label4"}
!50 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !51}
!51 = !{i32 122, i32 9, !52, null}
!52 = !{i32 786443, !48, !8}
!53 = distinct !{!53, !54, !56, !57}
!54 = !{i32 128, i32 5, !55, null}
!55 = !{i32 786443, !24, i32 125, i32 27, !8, i32 0}
!56 = !{!"llvm.loop.name", !"sha_transform_label5"}
!57 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !58}
!58 = !{i32 126, i32 9, !59, null}
!59 = !{i32 786443, !55, !8}
!60 = distinct !{!60, !61, !63, !64}
!61 = !{i32 132, i32 5, !62, null}
!62 = !{i32 786443, !24, i32 129, i32 27, !8, i32 0}
!63 = !{!"llvm.loop.name", !"sha_transform_label6"}
!64 = !{!"llvm.loop.tripcount", i32 20, i32 20, i32 20, !"user", !65}
!65 = !{i32 130, i32 9, !66, null}
!66 = !{i32 786443, !62, !8}
!67 = !{!1}
!68 = distinct !{!68, !69, !83, !84}
!69 = !{i32 211, i32 5, !70, null}
!70 = !{i32 786443, !71, i32 205, i32 5, !8, i32 0}
!71 = !{i32 786443, !72, !8}
!72 = !{i32 786478, i32 0, !8, !"sha_stream", !"sha_stream", null, !8, i32 196, !73, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([2 x [8192 x i8]]*, [2 x i32]*, [5 x i32]*)* @sha_stream, null, null, !15, i32 200}
!73 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !74, i32 0, i32 0}
!74 = !{null, !75, !81, !11}
!75 = !{i32 786447, null, !"", !12, i32 0, i64 64, i64 0, i32 0, i32 0, !76}
!76 = !{i32 786433, null, !"", null, i32 0, i64 65536, i64 0, i32 0, i32 0, !77, !79, i32 0, null, null}
!77 = !{i32 786470, null, !"", !12, i32 0, i64 0, i64 0, i32 0, i32 0, !78}
!78 = !{i32 786468, null, !"unsigned char", null, i32 0, i64 8, i64 0, i32 0, i32 0, i32 8}
!79 = !{!80}
!80 = !{i32 786465, i64 0, i64 8191}
!81 = !{i32 786447, null, !"", !12, i32 0, i64 64, i64 0, i32 0, i32 0, !82}
!82 = !{i32 786470, null, !"", !12, i32 0, i64 0, i64 0, i32 0, i32 0, !14}
!83 = !{!"llvm.loop.name", !"sha_stream_label1"}
!84 = !{!"llvm.loop.tripcount", i32 2, i32 2, i32 2, !"user", !85}
!85 = !{i32 206, i32 9, !86, null}
!86 = !{i32 786443, !70, !8}
!87 = distinct !{!87, !88, !92, !93, !94, !96}
!88 = !{i32 207, i32 20, !89, null}
!89 = !{i32 786443, !90, i32 207, i32 20, !8, i32 0}
!90 = !{i32 786443, !91, i32 205, i32 29, !8, i32 0}
!91 = !{i32 786443, !86, i32 205, i32 5, !8, i32 0}
!92 = !{i32 210, i32 9, !89, null}
!93 = !{!"llvm.loop.name", !"VITIS_LOOP_207_1"}
!94 = !{!"llvm.loop.tripcount", i32 8192, i32 8192, i32 8192, !"user", !95}
!95 = !{i32 208, i32 9, !89, null}
!96 = !{!"llvm.loop.pipeline.enable", i32 -1, i1 false, i8 -1, !"auto"}
!97 = distinct !{!97, !98, !100, !101}
!98 = !{i32 221, i32 5, !99, null}
!99 = !{i32 786443, !71, i32 216, i32 5, !8, i32 0}
!100 = !{!"llvm.loop.name", !"sha_stream_label0"}
!101 = !{!"llvm.loop.tripcount", i32 2, i32 2, i32 2, !"user", !102}
!102 = !{i32 217, i32 9, !103, null}
!103 = !{i32 786443, !99, !8}
!104 = distinct !{!104, !105, !107, !108}
!105 = !{i32 228, i32 5, !106, null}
!106 = !{i32 786443, !71, i32 225, i32 5, !8, i32 0}
!107 = !{!"llvm.loop.name", !"sha_stream_label2"}
!108 = !{!"llvm.loop.tripcount", i32 5, i32 5, i32 5, !"user", !109}
!109 = !{i32 226, i32 9, !110, null}
!110 = !{i32 786443, !106, !8}
!111 = distinct !{!111, !112, !118, !119}
!112 = !{i32 168, i32 5, !113, null}
!113 = !{i32 786443, !114, !8}
!114 = !{i32 786478, i32 0, !8, !"sha_update", !"sha_update", null, !8, i32 154, !115, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([8192 x i8]*, i32)* @sha_update, null, null, !15, i32 154}
!115 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !116, i32 0, i32 0}
!116 = !{null, !117, !14}
!117 = !{i32 786447, null, !"", !12, i32 0, i64 64, i64 0, i32 0, i32 0, !77}
!118 = !{!"llvm.loop.name", !"sha_update_label4"}
!119 = !{!"llvm.loop.tripcount", i32 127, i32 128, i32 127, !"user", !120}
!120 = !{i32 163, i32 9, !113, null}
!121 = distinct !{!121, !122, !127, !128}
!122 = !{i32 88, i32 5, !123, null}
!123 = !{i32 786443, !124, !8}
!124 = !{i32 786478, i32 0, !8, !"local_memcpy", !"local_memcpy", null, !8, i32 72, !125, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([8192 x i8]*, i32, i64)* @local_memcpy, null, null, !15, i32 72}
!125 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !126, i32 0, i32 0}
!126 = !{null, !11, !117, !14}
!127 = !{!"llvm.loop.name", !"local_memcpy_label3"}
!128 = !{!"llvm.loop.tripcount", i32 0, i32 16, i32 8, !"user", !129}
!129 = !{i32 80, i32 9, !123, null}
