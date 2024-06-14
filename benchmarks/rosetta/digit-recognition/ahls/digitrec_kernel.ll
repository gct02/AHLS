; ModuleID = 'digitrec_kernel_hls.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: nounwind
define i32 @_Z8popcounty(i64 %x) #0 {
entry:
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64, i64* %x.addr, align 8
  %shr = lshr i64 %0, 1
  %and = and i64 %shr, 6148914691236517205
  %1 = load i64, i64* %x.addr, align 8
  %sub = sub i64 %1, %and
  store i64 %sub, i64* %x.addr, align 8
  %2 = load i64, i64* %x.addr, align 8
  %and1 = and i64 %2, 3689348814741910323
  %3 = load i64, i64* %x.addr, align 8
  %shr2 = lshr i64 %3, 2
  %and3 = and i64 %shr2, 3689348814741910323
  %add = add i64 %and1, %and3
  store i64 %add, i64* %x.addr, align 8
  %4 = load i64, i64* %x.addr, align 8
  %5 = load i64, i64* %x.addr, align 8
  %shr4 = lshr i64 %5, 4
  %add5 = add i64 %4, %shr4
  %and6 = and i64 %add5, 1085102592571150095
  store i64 %and6, i64* %x.addr, align 8
  %6 = load i64, i64* %x.addr, align 8
  %shr7 = lshr i64 %6, 8
  %7 = load i64, i64* %x.addr, align 8
  %add8 = add i64 %7, %shr7
  store i64 %add8, i64* %x.addr, align 8
  %8 = load i64, i64* %x.addr, align 8
  %shr9 = lshr i64 %8, 16
  %9 = load i64, i64* %x.addr, align 8
  %add10 = add i64 %9, %shr9
  store i64 %add10, i64* %x.addr, align 8
  %10 = load i64, i64* %x.addr, align 8
  %shr11 = lshr i64 %10, 32
  %11 = load i64, i64* %x.addr, align 8
  %add12 = add i64 %11, %shr11
  store i64 %add12, i64* %x.addr, align 8
  %12 = load i64, i64* %x.addr, align 8
  %and13 = and i64 %12, 127
  %conv = trunc i64 %and13 to i32
  ret i32 %conv
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
define void @_Z10update_knnPKyS0_PiS1_i(i64* %train_inst, i64* %test_inst, i32* "fpga.decayed.dim.hint"="3" %dists, i32* "fpga.decayed.dim.hint"="3" %labels, i32 %label) #2 {
entry:
  %train_inst.addr = alloca i64*, align 8
  %test_inst.addr = alloca i64*, align 8
  %dists.addr = alloca i32*, align 8
  %labels.addr = alloca i32*, align 8
  %label.addr = alloca i32, align 4
  %dist = alloca i32, align 4
  %i = alloca i32, align 4
  %diff = alloca i64, align 8
  %max_dist = alloca i32, align 4
  %max_dist_id = alloca i32, align 4
  %k = alloca i32, align 4
  store i64* %train_inst, i64** %train_inst.addr, align 8
  store i64* %test_inst, i64** %test_inst.addr, align 8
  store i32* %dists, i32** %dists.addr, align 8
  store i32* %labels, i32** %labels.addr, align 8
  store i32 %label, i32* %label.addr, align 4
  %0 = bitcast i32* %dist to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6
  store i32 0, i32* %dist, align 4
  br label %VITIS_LOOP_33_1

VITIS_LOOP_33_1:                                  ; preds = %entry
  %1 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %VITIS_LOOP_33_1
  %2 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %2, 4
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  %3 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %3) #6
  br label %for.end

for.body:                                         ; preds = %for.cond
  %4 = bitcast i64* %diff to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #6
  %5 = load i64*, i64** %test_inst.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds i64, i64* %5, i64 %idxprom
  %7 = load i64, i64* %arrayidx, align 8
  %8 = load i64*, i64** %train_inst.addr, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %9 to i64
  %arrayidx2 = getelementptr inbounds i64, i64* %8, i64 %idxprom1
  %10 = load i64, i64* %arrayidx2, align 8
  %xor = xor i64 %7, %10
  store i64 %xor, i64* %diff, align 8
  %11 = load i64, i64* %diff, align 8
  %call = call i32 @_Z8popcounty(i64 %11)
  %12 = load i32, i32* %dist, align 4
  %add = add i32 %12, %call
  store i32 %add, i32* %dist, align 4
  %13 = bitcast i64* %diff to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %13) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, i32* %i, align 4
  %inc = add i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond.cleanup
  %15 = bitcast i32* %max_dist to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %15) #6
  store i32 0, i32* %max_dist, align 4
  %16 = bitcast i32* %max_dist_id to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %16) #6
  store i32 4, i32* %max_dist_id, align 4
  br label %FIND_MAX_DIST

FIND_MAX_DIST:                                    ; preds = %for.end
  %17 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %17) #6
  store i32 0, i32* %k, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc12, %FIND_MAX_DIST
  %18 = load i32, i32* %k, align 4
  %cmp4 = icmp slt i32 %18, 3
  br i1 %cmp4, label %for.body6, label %for.cond.cleanup5

for.cond.cleanup5:                                ; preds = %for.cond3
  %19 = bitcast i32* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %19) #6
  br label %for.end14

for.body6:                                        ; preds = %for.cond3
  %20 = load i32*, i32** %dists.addr, align 8
  %21 = load i32, i32* %k, align 4
  %idxprom7 = sext i32 %21 to i64
  %arrayidx8 = getelementptr inbounds i32, i32* %20, i64 %idxprom7
  %22 = load i32, i32* %arrayidx8, align 4
  %23 = load i32, i32* %max_dist, align 4
  %cmp9 = icmp sgt i32 %22, %23
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %for.body6
  %24 = load i32*, i32** %dists.addr, align 8
  %25 = load i32, i32* %k, align 4
  %idxprom10 = sext i32 %25 to i64
  %arrayidx11 = getelementptr inbounds i32, i32* %24, i64 %idxprom10
  %26 = load i32, i32* %arrayidx11, align 4
  store i32 %26, i32* %max_dist, align 4
  %27 = load i32, i32* %k, align 4
  store i32 %27, i32* %max_dist_id, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body6
  br label %for.inc12

for.inc12:                                        ; preds = %if.end
  %28 = load i32, i32* %k, align 4
  %inc13 = add i32 %28, 1
  store i32 %inc13, i32* %k, align 4
  br label %for.cond3, !llvm.loop !6

for.end14:                                        ; preds = %for.cond.cleanup5
  %29 = load i32, i32* %dist, align 4
  %30 = load i32, i32* %max_dist, align 4
  %cmp15 = icmp slt i32 %29, %30
  br i1 %cmp15, label %if.then16, label %if.end21

if.then16:                                        ; preds = %for.end14
  %31 = load i32, i32* %dist, align 4
  %32 = load i32*, i32** %dists.addr, align 8
  %33 = load i32, i32* %max_dist_id, align 4
  %idxprom17 = sext i32 %33 to i64
  %arrayidx18 = getelementptr inbounds i32, i32* %32, i64 %idxprom17
  store i32 %31, i32* %arrayidx18, align 4
  %34 = load i32, i32* %label.addr, align 4
  %35 = load i32*, i32** %labels.addr, align 8
  %36 = load i32, i32* %max_dist_id, align 4
  %idxprom19 = sext i32 %36 to i64
  %arrayidx20 = getelementptr inbounds i32, i32* %35, i64 %idxprom19
  store i32 %34, i32* %arrayidx20, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.then16, %for.end14
  %37 = bitcast i32* %max_dist_id to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %37) #6
  %38 = bitcast i32* %max_dist to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %38) #6
  %39 = bitcast i32* %dist to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %39) #6
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #3

; Function Attrs: nounwind
define zeroext i8 @_Z8knn_votePi(i32* "fpga.decayed.dim.hint"="3" %labels) #4 {
entry:
  %labels.addr = alloca i32*, align 8
  %max_vote = alloca i32, align 4
  %max_label = alloca i8, align 1
  %votes = alloca [10 x i32], align 4
  %i = alloca i32, align 4
  %i4 = alloca i32, align 4
  store i32* %labels, i32** %labels.addr, align 8
  %0 = bitcast i32* %max_vote to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6
  store i32 0, i32* %max_vote, align 4
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %max_label) #6
  store i8 0, i8* %max_label, align 1
  %1 = bitcast [10 x i32]* %votes to i8*
  call void @llvm.lifetime.start.p0i8(i64 40, i8* %1) #6
  %2 = bitcast [10 x i32]* %votes to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 40, i1 false)
  br label %VITIS_LOOP_69_1

VITIS_LOOP_69_1:                                  ; preds = %entry
  %3 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #6
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %VITIS_LOOP_69_1
  %4 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %4, 3
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  %5 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %5) #6
  br label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %labels.addr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 %idxprom
  %8 = load i32, i32* %arrayidx, align 4
  %idxprom1 = sext i32 %8 to i64
  %arrayidx2 = getelementptr inbounds [10 x i32], [10 x i32]* %votes, i64 0, i64 %idxprom1
  %9 = load i32, i32* %arrayidx2, align 4
  %inc = add i32 %9, 1
  store i32 %inc, i32* %arrayidx2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc3 = add i32 %10, 1
  store i32 %inc3, i32* %i, align 4
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond.cleanup
  br label %VITIS_LOOP_72_2

VITIS_LOOP_72_2:                                  ; preds = %for.end
  %11 = bitcast i32* %i4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #6
  store i32 0, i32* %i4, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc14, %VITIS_LOOP_72_2
  %12 = load i32, i32* %i4, align 4
  %cmp6 = icmp slt i32 %12, 10
  br i1 %cmp6, label %for.body8, label %for.cond.cleanup7

for.cond.cleanup7:                                ; preds = %for.cond5
  %13 = bitcast i32* %i4 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #6
  br label %for.end16

for.body8:                                        ; preds = %for.cond5
  %14 = load i32, i32* %i4, align 4
  %idxprom9 = sext i32 %14 to i64
  %arrayidx10 = getelementptr inbounds [10 x i32], [10 x i32]* %votes, i64 0, i64 %idxprom9
  %15 = load i32, i32* %arrayidx10, align 4
  %16 = load i32, i32* %max_vote, align 4
  %cmp11 = icmp sgt i32 %15, %16
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body8
  %17 = load i32, i32* %i4, align 4
  %idxprom12 = sext i32 %17 to i64
  %arrayidx13 = getelementptr inbounds [10 x i32], [10 x i32]* %votes, i64 0, i64 %idxprom12
  %18 = load i32, i32* %arrayidx13, align 4
  store i32 %18, i32* %max_vote, align 4
  %19 = load i32, i32* %i4, align 4
  %conv = trunc i32 %19 to i8
  store i8 %conv, i8* %max_label, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body8
  br label %for.inc14

for.inc14:                                        ; preds = %if.end
  %20 = load i32, i32* %i4, align 4
  %inc15 = add i32 %20, 1
  store i32 %inc15, i32* %i4, align 4
  br label %for.cond5, !llvm.loop !10

for.end16:                                        ; preds = %for.cond.cleanup7
  %21 = load i8, i8* %max_label, align 1
  %22 = bitcast [10 x i32]* %votes to i8*
  call void @llvm.lifetime.end.p0i8(i64 40, i8* %22) #6
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %max_label) #6
  %23 = bitcast i32* %max_vote to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %23) #6
  ret i8 %21
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #3

; Function Attrs: nounwind
define void @_Z8DigitRecPKyS0_PKhPh(i64* "fpga.decayed.dim.hint"="72000" %training_samples, i64* "fpga.decayed.dim.hint"="8000" %test_set, i8* "fpga.decayed.dim.hint"="18000" %training_labels, i8* "fpga.decayed.dim.hint"="2000" %results) #5 !fpga.function.pragma !12 {
entry:
  %training_samples.addr = alloca i64*, align 8
  %test_set.addr = alloca i64*, align 8
  %training_labels.addr = alloca i8*, align 8
  %results.addr = alloca i8*, align 8
  %dists = alloca [3 x i32], align 4
  %labels = alloca [3 x i32], align 4
  %t = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  %i = alloca i32, align 4
  %i7 = alloca i32, align 4
  %max_vote = alloca i8, align 1
  store i64* %training_samples, i64** %training_samples.addr, align 8
  store i64* %test_set, i64** %test_set.addr, align 8
  store i8* %training_labels, i8** %training_labels.addr, align 8
  store i8* %results, i8** %results.addr, align 8
  %0 = bitcast [3 x i32]* %dists to i8*
  call void @llvm.lifetime.start.p0i8(i64 12, i8* %0) #6
  %1 = bitcast [3 x i32]* %labels to i8*
  call void @llvm.lifetime.start.p0i8(i64 12, i8* %1) #6
  br label %TEST_LOOP

TEST_LOOP:                                        ; preds = %entry
  %2 = bitcast i32* %t to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #6
  store i32 0, i32* %t, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc26, %TEST_LOOP
  %3 = load i32, i32* %t, align 4
  %cmp = icmp slt i32 %3, 2000
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 3, i32* %cleanup.dest.slot, align 4
  %4 = bitcast i32* %t to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %4) #6
  br label %for.end28

for.body:                                         ; preds = %for.cond
  br label %SET_KNN_SET

SET_KNN_SET:                                      ; preds = %for.body
  %5 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #6
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %SET_KNN_SET
  %6 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %6, 3
  br i1 %cmp2, label %for.body4, label %for.cond.cleanup3

for.cond.cleanup3:                                ; preds = %for.cond1
  store i32 7, i32* %cleanup.dest.slot, align 4
  %7 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %7) #6
  br label %for.end

for.body4:                                        ; preds = %for.cond1
  %8 = load i32, i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %dists, i64 0, i64 %idxprom
  store i32 256, i32* %arrayidx, align 4
  %9 = load i32, i32* %i, align 4
  %idxprom5 = sext i32 %9 to i64
  %arrayidx6 = getelementptr inbounds [3 x i32], [3 x i32]* %labels, i64 0, i64 %idxprom5
  store i32 0, i32* %arrayidx6, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %10 = load i32, i32* %i, align 4
  %inc = add i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1, !llvm.loop !14

for.end:                                          ; preds = %for.cond.cleanup3
  br label %TRAINING_LOOP

TRAINING_LOOP:                                    ; preds = %for.end
  %11 = bitcast i32* %i7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #6
  store i32 0, i32* %i7, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc20, %TRAINING_LOOP
  %12 = load i32, i32* %i7, align 4
  %cmp9 = icmp slt i32 %12, 18000
  br i1 %cmp9, label %for.body11, label %for.cond.cleanup10

for.cond.cleanup10:                               ; preds = %for.cond8
  store i32 11, i32* %cleanup.dest.slot, align 4
  %13 = bitcast i32* %i7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #6
  br label %for.end22

for.body11:                                       ; preds = %for.cond8
  %14 = load i64*, i64** %training_samples.addr, align 8
  %15 = load i32, i32* %i7, align 4
  %mul = mul i32 %15, 4
  %idxprom12 = sext i32 %mul to i64
  %arrayidx13 = getelementptr inbounds i64, i64* %14, i64 %idxprom12
  %16 = load i64*, i64** %test_set.addr, align 8
  %17 = load i32, i32* %t, align 4
  %mul14 = mul i32 %17, 4
  %idxprom15 = sext i32 %mul14 to i64
  %arrayidx16 = getelementptr inbounds i64, i64* %16, i64 %idxprom15
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %dists, i32 0, i32 0
  %arraydecay17 = getelementptr inbounds [3 x i32], [3 x i32]* %labels, i32 0, i32 0
  %18 = load i8*, i8** %training_labels.addr, align 8
  %19 = load i32, i32* %i7, align 4
  %idxprom18 = sext i32 %19 to i64
  %arrayidx19 = getelementptr inbounds i8, i8* %18, i64 %idxprom18
  %20 = load i8, i8* %arrayidx19, align 1
  %conv = zext i8 %20 to i32
  call void @_Z10update_knnPKyS0_PiS1_i(i64* %arrayidx13, i64* %arrayidx16, i32* %arraydecay, i32* %arraydecay17, i32 %conv)
  br label %for.inc20

for.inc20:                                        ; preds = %for.body11
  %21 = load i32, i32* %i7, align 4
  %inc21 = add i32 %21, 1
  store i32 %inc21, i32* %i7, align 4
  br label %for.cond8, !llvm.loop !16

for.end22:                                        ; preds = %for.cond.cleanup10
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %max_vote) #6
  %arraydecay23 = getelementptr inbounds [3 x i32], [3 x i32]* %labels, i32 0, i32 0
  %call = call zeroext i8 @_Z8knn_votePi(i32* %arraydecay23)
  store i8 %call, i8* %max_vote, align 1
  %22 = load i8, i8* %max_vote, align 1
  %23 = load i8*, i8** %results.addr, align 8
  %24 = load i32, i32* %t, align 4
  %idxprom24 = sext i32 %24 to i64
  %arrayidx25 = getelementptr inbounds i8, i8* %23, i64 %idxprom24
  store i8 %22, i8* %arrayidx25, align 1
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %max_vote) #6
  br label %for.inc26

for.inc26:                                        ; preds = %for.end22
  %25 = load i32, i32* %t, align 4
  %inc27 = add i32 %25, 1
  store i32 %inc27, i32* %t, align 4
  br label %for.cond, !llvm.loop !18

for.end28:                                        ; preds = %for.cond.cleanup
  %26 = bitcast [3 x i32]* %labels to i8*
  call void @llvm.lifetime.end.p0i8(i64 12, i8* %26) #6
  %27 = bitcast [3 x i32]* %dists to i8*
  call void @llvm.lifetime.end.p0i8(i64 12, i8* %27) #6
  ret void
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="popcount" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="update_knn" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="knn_vote" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="DigitRec" "fpga.top.func"="DigitRec" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.name", !"VITIS_LOOP_33_1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.name", !"FIND_MAX_DIST"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.name", !"VITIS_LOOP_69_1"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.name", !"VITIS_LOOP_72_2"}
!12 = !{!13}
!13 = !{!"fpga.top", !"user"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.name", !"SET_KNN_SET"}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.name", !"TRAINING_LOOP"}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.name", !"TEST_LOOP"}
