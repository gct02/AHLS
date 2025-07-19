; ModuleID = 'data/base_solutions/SHA/solution0/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

@sha_info_data = common global [16 x i32] zeroinitializer, align 4
@sha_info_digest = common global [5 x i32] zeroinitializer, align 4
@sha_info_count_lo = common global i32 0, align 4
@sha_info_count_hi = common global i32 0, align 4
@local_indata = common global [2 x [8192 x i8]] zeroinitializer, align 1
@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: noinline nounwind
define void @local_memset(i32* %s, i32 %c, i32 %n, i32 %e) #0 !fpga.function.pragma !4 {
entry:
  %s.addr = alloca i32*, align 8
  %c.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %uc = alloca i32, align 4
  %p = alloca i32*, align 8
  %m = alloca i32, align 4
  store i32* %s, i32** %s.addr, align 8
  store i32 %c, i32* %c.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  %0 = bitcast i32* %uc to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = load i32, i32* %c.addr, align 4
  store i32 %1, i32* %uc, align 4
  %2 = bitcast i32** %p to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #4
  %3 = load i32*, i32** %s.addr, align 8
  store i32* %3, i32** %p, align 8
  %4 = bitcast i32* %m to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #4
  %5 = load i32, i32* %n.addr, align 4
  %div = sdiv i32 %5, 4
  store i32 %div, i32* %m, align 4
  br label %local_memset_label0

local_memset_label0:                              ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %local_memset_label0
  %6 = load i32, i32* %e.addr, align 4
  %dec = add nsw i32 %6, -1
  store i32 %dec, i32* %e.addr, align 4
  %cmp = icmp sgt i32 %6, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %7 = load i32*, i32** %p, align 8
  %incdec.ptr = getelementptr inbounds i32, i32* %7, i32 1
  store i32* %incdec.ptr, i32** %p, align 8
  br label %while.cond, !llvm.loop !45

while.end:                                        ; preds = %while.cond
  br label %local_memset_label1

local_memset_label1:                              ; preds = %while.end
  br label %while.cond1

while.cond1:                                      ; preds = %while.body4, %local_memset_label1
  %8 = load i32, i32* %m, align 4
  %dec2 = add nsw i32 %8, -1
  store i32 %dec2, i32* %m, align 4
  %cmp3 = icmp sgt i32 %8, 0
  br i1 %cmp3, label %while.body4, label %while.end6

while.body4:                                      ; preds = %while.cond1
  %9 = load i32, i32* %uc, align 4
  %10 = load i32*, i32** %p, align 8
  %incdec.ptr5 = getelementptr inbounds i32, i32* %10, i32 1
  store i32* %incdec.ptr5, i32** %p, align 8
  store i32 %9, i32* %10, align 4
  br label %while.cond1, !llvm.loop !47

while.end6:                                       ; preds = %while.cond1
  %11 = bitcast i32* %m to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %11) #4
  %12 = bitcast i32** %p to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %12) #4
  %13 = bitcast i32* %uc to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #4
  ret void
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: noinline nounwind
define void @local_memcpy(i32* %s1, i8* %s2, i32 %n) #0 !fpga.function.pragma !49 {
entry:
  %s1.addr = alloca i32*, align 8
  %s2.addr = alloca i8*, align 8
  %n.addr = alloca i32, align 4
  %p1 = alloca i32*, align 8
  %p2 = alloca i8*, align 8
  %tmp = alloca i32, align 4
  %m = alloca i32, align 4
  store i32* %s1, i32** %s1.addr, align 8
  store i8* %s2, i8** %s2.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  %0 = bitcast i32** %p1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #4
  %1 = load i32*, i32** %s1.addr, align 8
  store i32* %1, i32** %p1, align 8
  %2 = bitcast i8** %p2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #4
  %3 = load i8*, i8** %s2.addr, align 8
  store i8* %3, i8** %p2, align 8
  %4 = bitcast i32* %tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #4
  %5 = bitcast i32* %m to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #4
  %6 = load i32, i32* %n.addr, align 4
  %div = sdiv i32 %6, 4
  store i32 %div, i32* %m, align 4
  br label %local_memcpy_label3

local_memcpy_label3:                              ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %local_memcpy_label3
  %7 = load i32, i32* %m, align 4
  %dec = add nsw i32 %7, -1
  store i32 %dec, i32* %m, align 4
  %cmp = icmp sgt i32 %7, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  store i32 0, i32* %tmp, align 4
  %8 = load i8*, i8** %p2, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %incdec.ptr, i8** %p2, align 8
  %9 = load i8, i8* %8, align 1
  %conv = zext i8 %9 to i32
  %and = and i32 255, %conv
  %10 = load i32, i32* %tmp, align 4
  %or = or i32 %10, %and
  store i32 %or, i32* %tmp, align 4
  %11 = load i8*, i8** %p2, align 8
  %incdec.ptr1 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr1, i8** %p2, align 8
  %12 = load i8, i8* %11, align 1
  %conv2 = zext i8 %12 to i32
  %and3 = and i32 255, %conv2
  %shl = shl i32 %and3, 8
  %13 = load i32, i32* %tmp, align 4
  %or4 = or i32 %13, %shl
  store i32 %or4, i32* %tmp, align 4
  %14 = load i8*, i8** %p2, align 8
  %incdec.ptr5 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %incdec.ptr5, i8** %p2, align 8
  %15 = load i8, i8* %14, align 1
  %conv6 = zext i8 %15 to i32
  %and7 = and i32 255, %conv6
  %shl8 = shl i32 %and7, 16
  %16 = load i32, i32* %tmp, align 4
  %or9 = or i32 %16, %shl8
  store i32 %or9, i32* %tmp, align 4
  %17 = load i8*, i8** %p2, align 8
  %incdec.ptr10 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %incdec.ptr10, i8** %p2, align 8
  %18 = load i8, i8* %17, align 1
  %conv11 = zext i8 %18 to i32
  %and12 = and i32 255, %conv11
  %shl13 = shl i32 %and12, 24
  %19 = load i32, i32* %tmp, align 4
  %or14 = or i32 %19, %shl13
  store i32 %or14, i32* %tmp, align 4
  %20 = load i32, i32* %tmp, align 4
  %21 = load i32*, i32** %p1, align 8
  store i32 %20, i32* %21, align 4
  %22 = load i32*, i32** %p1, align 8
  %incdec.ptr15 = getelementptr inbounds i32, i32* %22, i32 1
  store i32* %incdec.ptr15, i32** %p1, align 8
  br label %while.cond, !llvm.loop !60

while.end:                                        ; preds = %while.cond
  %23 = bitcast i32* %m to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %23) #4
  %24 = bitcast i32* %tmp to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %24) #4
  %25 = bitcast i8** %p2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %25) #4
  %26 = bitcast i32** %p1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %26) #4
  ret void
}

; Function Attrs: noinline nounwind
define void @sha_transform() #0 !fpga.function.pragma !62 {
entry:
  %i = alloca i32, align 4
  %temp = alloca i32, align 4
  %A = alloca i32, align 4
  %B = alloca i32, align 4
  %C = alloca i32, align 4
  %D = alloca i32, align 4
  %E = alloca i32, align 4
  %W = alloca [80 x i32], align 4
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %temp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  %2 = bitcast i32* %A to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #4
  %3 = bitcast i32* %B to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #4
  %4 = bitcast i32* %C to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #4
  %5 = bitcast i32* %D to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #4
  %6 = bitcast i32* %E to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #4
  %7 = bitcast [80 x i32]* %W to i8*
  call void @llvm.lifetime.start.p0i8(i64 320, i8* %7) #4
  br label %sha_transform_label1

sha_transform_label1:                             ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %sha_transform_label1
  %8 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %8, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i32, i32* %i, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %idxprom
  %10 = load i32, i32* %arrayidx, align 4
  %11 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %11 to i64
  %arrayidx2 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %idxprom1
  store i32 %10, i32* %arrayidx2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  br label %sha_transform_label2

sha_transform_label2:                             ; preds = %for.end
  store i32 16, i32* %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc21, %sha_transform_label2
  %13 = load i32, i32* %i, align 4
  %cmp4 = icmp slt i32 %13, 80
  br i1 %cmp4, label %for.body5, label %for.end23

for.body5:                                        ; preds = %for.cond3
  %14 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %14, 3
  %idxprom6 = sext i32 %sub to i64
  %arrayidx7 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %idxprom6
  %15 = load i32, i32* %arrayidx7, align 4
  %16 = load i32, i32* %i, align 4
  %sub8 = sub nsw i32 %16, 8
  %idxprom9 = sext i32 %sub8 to i64
  %arrayidx10 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %idxprom9
  %17 = load i32, i32* %arrayidx10, align 4
  %xor = xor i32 %15, %17
  %18 = load i32, i32* %i, align 4
  %sub11 = sub nsw i32 %18, 14
  %idxprom12 = sext i32 %sub11 to i64
  %arrayidx13 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %idxprom12
  %19 = load i32, i32* %arrayidx13, align 4
  %xor14 = xor i32 %xor, %19
  %20 = load i32, i32* %i, align 4
  %sub15 = sub nsw i32 %20, 16
  %idxprom16 = sext i32 %sub15 to i64
  %arrayidx17 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %idxprom16
  %21 = load i32, i32* %arrayidx17, align 4
  %xor18 = xor i32 %xor14, %21
  %22 = load i32, i32* %i, align 4
  %idxprom19 = sext i32 %22 to i64
  %arrayidx20 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %idxprom19
  store i32 %xor18, i32* %arrayidx20, align 4
  br label %for.inc21

for.inc21:                                        ; preds = %for.body5
  %23 = load i32, i32* %i, align 4
  %inc22 = add nsw i32 %23, 1
  store i32 %inc22, i32* %i, align 4
  br label %for.cond3, !llvm.loop !73

for.end23:                                        ; preds = %for.cond3
  %24 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 4
  store i32 %24, i32* %A, align 4
  %25 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4
  store i32 %25, i32* %B, align 4
  %26 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 4
  store i32 %26, i32* %C, align 4
  %27 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4
  store i32 %27, i32* %D, align 4
  %28 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 4
  store i32 %28, i32* %E, align 4
  br label %sha_transform_label3

sha_transform_label3:                             ; preds = %for.end23
  store i32 0, i32* %i, align 4
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc38, %sha_transform_label3
  %29 = load i32, i32* %i, align 4
  %cmp25 = icmp slt i32 %29, 20
  br i1 %cmp25, label %for.body26, label %for.end40

for.body26:                                       ; preds = %for.cond24
  %30 = load i32, i32* %A, align 4
  %shl = shl i32 %30, 5
  %31 = load i32, i32* %A, align 4
  %shr = lshr i32 %31, 27
  %or = or i32 %shl, %shr
  %32 = load i32, i32* %B, align 4
  %33 = load i32, i32* %C, align 4
  %and = and i32 %32, %33
  %34 = load i32, i32* %B, align 4
  %neg = xor i32 %34, -1
  %35 = load i32, i32* %D, align 4
  %and27 = and i32 %neg, %35
  %or28 = or i32 %and, %and27
  %add = add i32 %or, %or28
  %36 = load i32, i32* %E, align 4
  %add29 = add i32 %add, %36
  %37 = load i32, i32* %i, align 4
  %idxprom30 = sext i32 %37 to i64
  %arrayidx31 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %idxprom30
  %38 = load i32, i32* %arrayidx31, align 4
  %add32 = add i32 %add29, %38
  %conv = zext i32 %add32 to i64
  %add33 = add nsw i64 %conv, 1518500249
  %conv34 = trunc i64 %add33 to i32
  store i32 %conv34, i32* %temp, align 4
  %39 = load i32, i32* %D, align 4
  store i32 %39, i32* %E, align 4
  %40 = load i32, i32* %C, align 4
  store i32 %40, i32* %D, align 4
  %41 = load i32, i32* %B, align 4
  %shl35 = shl i32 %41, 30
  %42 = load i32, i32* %B, align 4
  %shr36 = lshr i32 %42, 2
  %or37 = or i32 %shl35, %shr36
  store i32 %or37, i32* %C, align 4
  %43 = load i32, i32* %A, align 4
  store i32 %43, i32* %B, align 4
  %44 = load i32, i32* %temp, align 4
  store i32 %44, i32* %A, align 4
  br label %for.inc38

for.inc38:                                        ; preds = %for.body26
  %45 = load i32, i32* %i, align 4
  %inc39 = add nsw i32 %45, 1
  store i32 %inc39, i32* %i, align 4
  br label %for.cond24, !llvm.loop !75

for.end40:                                        ; preds = %for.cond24
  br label %sha_transform_label4

sha_transform_label4:                             ; preds = %for.end40
  store i32 20, i32* %i, align 4
  br label %for.cond41

for.cond41:                                       ; preds = %for.inc60, %sha_transform_label4
  %46 = load i32, i32* %i, align 4
  %cmp42 = icmp slt i32 %46, 40
  br i1 %cmp42, label %for.body43, label %for.end62

for.body43:                                       ; preds = %for.cond41
  %47 = load i32, i32* %A, align 4
  %shl44 = shl i32 %47, 5
  %48 = load i32, i32* %A, align 4
  %shr45 = lshr i32 %48, 27
  %or46 = or i32 %shl44, %shr45
  %49 = load i32, i32* %B, align 4
  %50 = load i32, i32* %C, align 4
  %xor47 = xor i32 %49, %50
  %51 = load i32, i32* %D, align 4
  %xor48 = xor i32 %xor47, %51
  %add49 = add i32 %or46, %xor48
  %52 = load i32, i32* %E, align 4
  %add50 = add i32 %add49, %52
  %53 = load i32, i32* %i, align 4
  %idxprom51 = sext i32 %53 to i64
  %arrayidx52 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %idxprom51
  %54 = load i32, i32* %arrayidx52, align 4
  %add53 = add i32 %add50, %54
  %conv54 = zext i32 %add53 to i64
  %add55 = add nsw i64 %conv54, 1859775393
  %conv56 = trunc i64 %add55 to i32
  store i32 %conv56, i32* %temp, align 4
  %55 = load i32, i32* %D, align 4
  store i32 %55, i32* %E, align 4
  %56 = load i32, i32* %C, align 4
  store i32 %56, i32* %D, align 4
  %57 = load i32, i32* %B, align 4
  %shl57 = shl i32 %57, 30
  %58 = load i32, i32* %B, align 4
  %shr58 = lshr i32 %58, 2
  %or59 = or i32 %shl57, %shr58
  store i32 %or59, i32* %C, align 4
  %59 = load i32, i32* %A, align 4
  store i32 %59, i32* %B, align 4
  %60 = load i32, i32* %temp, align 4
  store i32 %60, i32* %A, align 4
  br label %for.inc60

for.inc60:                                        ; preds = %for.body43
  %61 = load i32, i32* %i, align 4
  %inc61 = add nsw i32 %61, 1
  store i32 %inc61, i32* %i, align 4
  br label %for.cond41, !llvm.loop !77

for.end62:                                        ; preds = %for.cond41
  br label %sha_transform_label5

sha_transform_label5:                             ; preds = %for.end62
  store i32 40, i32* %i, align 4
  br label %for.cond63

for.cond63:                                       ; preds = %for.inc85, %sha_transform_label5
  %62 = load i32, i32* %i, align 4
  %cmp64 = icmp slt i32 %62, 60
  br i1 %cmp64, label %for.body65, label %for.end87

for.body65:                                       ; preds = %for.cond63
  %63 = load i32, i32* %A, align 4
  %shl66 = shl i32 %63, 5
  %64 = load i32, i32* %A, align 4
  %shr67 = lshr i32 %64, 27
  %or68 = or i32 %shl66, %shr67
  %65 = load i32, i32* %B, align 4
  %66 = load i32, i32* %C, align 4
  %and69 = and i32 %65, %66
  %67 = load i32, i32* %B, align 4
  %68 = load i32, i32* %D, align 4
  %and70 = and i32 %67, %68
  %or71 = or i32 %and69, %and70
  %69 = load i32, i32* %C, align 4
  %70 = load i32, i32* %D, align 4
  %and72 = and i32 %69, %70
  %or73 = or i32 %or71, %and72
  %add74 = add i32 %or68, %or73
  %71 = load i32, i32* %E, align 4
  %add75 = add i32 %add74, %71
  %72 = load i32, i32* %i, align 4
  %idxprom76 = sext i32 %72 to i64
  %arrayidx77 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %idxprom76
  %73 = load i32, i32* %arrayidx77, align 4
  %add78 = add i32 %add75, %73
  %conv79 = zext i32 %add78 to i64
  %add80 = add nsw i64 %conv79, 2400959708
  %conv81 = trunc i64 %add80 to i32
  store i32 %conv81, i32* %temp, align 4
  %74 = load i32, i32* %D, align 4
  store i32 %74, i32* %E, align 4
  %75 = load i32, i32* %C, align 4
  store i32 %75, i32* %D, align 4
  %76 = load i32, i32* %B, align 4
  %shl82 = shl i32 %76, 30
  %77 = load i32, i32* %B, align 4
  %shr83 = lshr i32 %77, 2
  %or84 = or i32 %shl82, %shr83
  store i32 %or84, i32* %C, align 4
  %78 = load i32, i32* %A, align 4
  store i32 %78, i32* %B, align 4
  %79 = load i32, i32* %temp, align 4
  store i32 %79, i32* %A, align 4
  br label %for.inc85

for.inc85:                                        ; preds = %for.body65
  %80 = load i32, i32* %i, align 4
  %inc86 = add nsw i32 %80, 1
  store i32 %inc86, i32* %i, align 4
  br label %for.cond63, !llvm.loop !79

for.end87:                                        ; preds = %for.cond63
  br label %sha_transform_label6

sha_transform_label6:                             ; preds = %for.end87
  store i32 60, i32* %i, align 4
  br label %for.cond88

for.cond88:                                       ; preds = %for.inc107, %sha_transform_label6
  %81 = load i32, i32* %i, align 4
  %cmp89 = icmp slt i32 %81, 80
  br i1 %cmp89, label %for.body90, label %for.end109

for.body90:                                       ; preds = %for.cond88
  %82 = load i32, i32* %A, align 4
  %shl91 = shl i32 %82, 5
  %83 = load i32, i32* %A, align 4
  %shr92 = lshr i32 %83, 27
  %or93 = or i32 %shl91, %shr92
  %84 = load i32, i32* %B, align 4
  %85 = load i32, i32* %C, align 4
  %xor94 = xor i32 %84, %85
  %86 = load i32, i32* %D, align 4
  %xor95 = xor i32 %xor94, %86
  %add96 = add i32 %or93, %xor95
  %87 = load i32, i32* %E, align 4
  %add97 = add i32 %add96, %87
  %88 = load i32, i32* %i, align 4
  %idxprom98 = sext i32 %88 to i64
  %arrayidx99 = getelementptr inbounds [80 x i32], [80 x i32]* %W, i64 0, i64 %idxprom98
  %89 = load i32, i32* %arrayidx99, align 4
  %add100 = add i32 %add97, %89
  %conv101 = zext i32 %add100 to i64
  %add102 = add nsw i64 %conv101, 3395469782
  %conv103 = trunc i64 %add102 to i32
  store i32 %conv103, i32* %temp, align 4
  %90 = load i32, i32* %D, align 4
  store i32 %90, i32* %E, align 4
  %91 = load i32, i32* %C, align 4
  store i32 %91, i32* %D, align 4
  %92 = load i32, i32* %B, align 4
  %shl104 = shl i32 %92, 30
  %93 = load i32, i32* %B, align 4
  %shr105 = lshr i32 %93, 2
  %or106 = or i32 %shl104, %shr105
  store i32 %or106, i32* %C, align 4
  %94 = load i32, i32* %A, align 4
  store i32 %94, i32* %B, align 4
  %95 = load i32, i32* %temp, align 4
  store i32 %95, i32* %A, align 4
  br label %for.inc107

for.inc107:                                       ; preds = %for.body90
  %96 = load i32, i32* %i, align 4
  %inc108 = add nsw i32 %96, 1
  store i32 %inc108, i32* %i, align 4
  br label %for.cond88, !llvm.loop !81

for.end109:                                       ; preds = %for.cond88
  %97 = load i32, i32* %A, align 4
  %98 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 4
  %add110 = add i32 %98, %97
  store i32 %add110, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 4
  %99 = load i32, i32* %B, align 4
  %100 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4
  %add111 = add i32 %100, %99
  store i32 %add111, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4
  %101 = load i32, i32* %C, align 4
  %102 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 4
  %add112 = add i32 %102, %101
  store i32 %add112, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 4
  %103 = load i32, i32* %D, align 4
  %104 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4
  %add113 = add i32 %104, %103
  store i32 %add113, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4
  %105 = load i32, i32* %E, align 4
  %106 = load i32, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 4
  %add114 = add i32 %106, %105
  store i32 %add114, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 4
  %107 = bitcast [80 x i32]* %W to i8*
  call void @llvm.lifetime.end.p0i8(i64 320, i8* %107) #4
  %108 = bitcast i32* %E to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %108) #4
  %109 = bitcast i32* %D to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %109) #4
  %110 = bitcast i32* %C to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %110) #4
  %111 = bitcast i32* %B to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %111) #4
  %112 = bitcast i32* %A to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %112) #4
  %113 = bitcast i32* %temp to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %113) #4
  %114 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %114) #4
  ret void
}

; Function Attrs: noinline nounwind
define void @sha_init() #0 !fpga.function.pragma !83 {
entry:
  store i32 1732584193, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 0), align 4
  store i32 -271733879, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 1), align 4
  store i32 -1732584194, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 2), align 4
  store i32 271733878, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 3), align 4
  store i32 -1009589776, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 4), align 4
  store i32 0, i32* @sha_info_count_lo, align 4
  store i32 0, i32* @sha_info_count_hi, align 4
  ret void
}

; Function Attrs: noinline nounwind
define void @sha_update(i8* %buffer, i32 %count) #0 !fpga.function.pragma !90 {
entry:
  %buffer.addr = alloca i8*, align 8
  %count.addr = alloca i32, align 4
  store i8* %buffer, i8** %buffer.addr, align 8
  store i32 %count, i32* %count.addr, align 4
  %0 = load i32, i32* @sha_info_count_lo, align 4
  %1 = load i32, i32* %count.addr, align 4
  %shl = shl i32 %1, 3
  %add = add i32 %0, %shl
  %2 = load i32, i32* @sha_info_count_lo, align 4
  %cmp = icmp ult i32 %add, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, i32* @sha_info_count_hi, align 4
  %inc = add i32 %3, 1
  store i32 %inc, i32* @sha_info_count_hi, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %count.addr, align 4
  %shl1 = shl i32 %4, 3
  %5 = load i32, i32* @sha_info_count_lo, align 4
  %add2 = add i32 %5, %shl1
  store i32 %add2, i32* @sha_info_count_lo, align 4
  %6 = load i32, i32* %count.addr, align 4
  %shr = lshr i32 %6, 29
  %7 = load i32, i32* @sha_info_count_hi, align 4
  %add3 = add i32 %7, %shr
  store i32 %add3, i32* @sha_info_count_hi, align 4
  br label %sha_update_label4

sha_update_label4:                                ; preds = %if.end
  br label %while.cond

while.cond:                                       ; preds = %while.body, %sha_update_label4
  %8 = load i32, i32* %count.addr, align 4
  %cmp4 = icmp sge i32 %8, 64
  br i1 %cmp4, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %9 = load i8*, i8** %buffer.addr, align 8
  call void @local_memcpy(i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i32 0, i32 0), i8* %9, i32 64)
  call void @sha_transform()
  %10 = load i8*, i8** %buffer.addr, align 8
  %add.ptr = getelementptr inbounds i8, i8* %10, i64 64
  store i8* %add.ptr, i8** %buffer.addr, align 8
  %11 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 %11, 64
  store i32 %sub, i32* %count.addr, align 4
  br label %while.cond, !llvm.loop !99

while.end:                                        ; preds = %while.cond
  %12 = load i8*, i8** %buffer.addr, align 8
  %13 = load i32, i32* %count.addr, align 4
  call void @local_memcpy(i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i32 0, i32 0), i8* %12, i32 %13)
  ret void
}

; Function Attrs: noinline nounwind
define void @sha_final() #0 !fpga.function.pragma !101 {
entry:
  %count = alloca i32, align 4
  %lo_bit_count = alloca i32, align 4
  %hi_bit_count = alloca i32, align 4
  %0 = bitcast i32* %count to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %lo_bit_count to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  %2 = load i32, i32* @sha_info_count_lo, align 4
  store i32 %2, i32* %lo_bit_count, align 4
  %3 = bitcast i32* %hi_bit_count to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #4
  %4 = load i32, i32* @sha_info_count_hi, align 4
  store i32 %4, i32* %hi_bit_count, align 4
  %5 = load i32, i32* %lo_bit_count, align 4
  %shr = lshr i32 %5, 3
  %and = and i32 %shr, 63
  store i32 %and, i32* %count, align 4
  %6 = load i32, i32* %count, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %count, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 %idxprom
  store i32 128, i32* %arrayidx, align 4
  %7 = load i32, i32* %count, align 4
  %cmp = icmp sgt i32 %7, 56
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %count, align 4
  %sub = sub nsw i32 64, %8
  %9 = load i32, i32* %count, align 4
  call void @local_memset(i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i32 0, i32 0), i32 0, i32 %sub, i32 %9)
  call void @sha_transform()
  call void @local_memset(i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i32 0, i32 0), i32 0, i32 56, i32 0)
  br label %if.end

if.else:                                          ; preds = %entry
  %10 = load i32, i32* %count, align 4
  %sub1 = sub nsw i32 56, %10
  %11 = load i32, i32* %count, align 4
  call void @local_memset(i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i32 0, i32 0), i32 0, i32 %sub1, i32 %11)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %12 = load i32, i32* %hi_bit_count, align 4
  store i32 %12, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 14), align 4
  %13 = load i32, i32* %lo_bit_count, align 4
  store i32 %13, i32* getelementptr inbounds ([16 x i32], [16 x i32]* @sha_info_data, i64 0, i64 15), align 4
  call void @sha_transform()
  %14 = bitcast i32* %hi_bit_count to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #4
  %15 = bitcast i32* %lo_bit_count to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #4
  %16 = bitcast i32* %count to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #4
  ret void
}

; Function Attrs: nounwind
define void @sha_stream([8192 x i8]* "fpga.decayed.dim.hint"="2" %indata, i32* "fpga.decayed.dim.hint"="2" %in_i, i32* "fpga.decayed.dim.hint"="5" %outdata) #3 !fpga.function.pragma !108 {
entry:
  %indata.addr = alloca [8192 x i8]*, align 8
  %in_i.addr = alloca i32*, align 8
  %outdata.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %p = alloca i8*, align 8
  store [8192 x i8]* %indata, [8192 x i8]** %indata.addr, align 8
  store i32* %in_i, i32** %in_i.addr, align 8
  store i32* %outdata, i32** %outdata.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  %2 = bitcast i8** %p to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #4
  br label %sha_stream_label1

sha_stream_label1:                                ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %sha_stream_label1
  %3 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %3, 2
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  br label %VITIS_LOOP_207_1

VITIS_LOOP_207_1:                                 ; preds = %for.body
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %VITIS_LOOP_207_1
  %4 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %4, 8192
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %5 = load [8192 x i8]*, [8192 x i8]** %indata.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds [8192 x i8], [8192 x i8]* %5, i64 %idxprom
  %7 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %7 to i64
  %arrayidx5 = getelementptr inbounds [8192 x i8], [8192 x i8]* %arrayidx, i64 0, i64 %idxprom4
  %8 = load i8, i8* %arrayidx5, align 1
  %9 = load i32, i32* %i, align 4
  %idxprom6 = sext i32 %9 to i64
  %arrayidx7 = getelementptr inbounds [2 x [8192 x i8]], [2 x [8192 x i8]]* @local_indata, i64 0, i64 %idxprom6
  %10 = load i32, i32* %j, align 4
  %idxprom8 = sext i32 %10 to i64
  %arrayidx9 = getelementptr inbounds [8192 x i8], [8192 x i8]* %arrayidx7, i64 0, i64 %idxprom8
  store i8 %8, i8* %arrayidx9, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %11 = load i32, i32* %j, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1, !llvm.loop !123

for.end:                                          ; preds = %for.cond1
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %12 = load i32, i32* %i, align 4
  %inc11 = add nsw i32 %12, 1
  store i32 %inc11, i32* %i, align 4
  br label %for.cond, !llvm.loop !125

for.end12:                                        ; preds = %for.cond
  call void @sha_init()
  br label %sha_stream_label0

sha_stream_label0:                                ; preds = %for.end12
  store i32 0, i32* %j, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc21, %sha_stream_label0
  %13 = load i32, i32* %j, align 4
  %cmp14 = icmp slt i32 %13, 2
  br i1 %cmp14, label %for.body15, label %for.end23

for.body15:                                       ; preds = %for.cond13
  %14 = load i32*, i32** %in_i.addr, align 8
  %15 = load i32, i32* %j, align 4
  %idxprom16 = sext i32 %15 to i64
  %arrayidx17 = getelementptr inbounds i32, i32* %14, i64 %idxprom16
  %16 = load i32, i32* %arrayidx17, align 4
  store i32 %16, i32* %i, align 4
  %17 = load i32, i32* %j, align 4
  %idxprom18 = sext i32 %17 to i64
  %arrayidx19 = getelementptr inbounds [2 x [8192 x i8]], [2 x [8192 x i8]]* @local_indata, i64 0, i64 %idxprom18
  %arrayidx20 = getelementptr inbounds [8192 x i8], [8192 x i8]* %arrayidx19, i64 0, i64 0
  store i8* %arrayidx20, i8** %p, align 8
  %18 = load i8*, i8** %p, align 8
  %19 = load i32, i32* %i, align 4
  call void @sha_update(i8* %18, i32 %19)
  br label %for.inc21

for.inc21:                                        ; preds = %for.body15
  %20 = load i32, i32* %j, align 4
  %inc22 = add nsw i32 %20, 1
  store i32 %inc22, i32* %j, align 4
  br label %for.cond13, !llvm.loop !127

for.end23:                                        ; preds = %for.cond13
  call void @sha_final()
  br label %sha_stream_label2

sha_stream_label2:                                ; preds = %for.end23
  store i32 0, i32* %i, align 4
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc31, %sha_stream_label2
  %21 = load i32, i32* %i, align 4
  %cmp25 = icmp slt i32 %21, 5
  br i1 %cmp25, label %for.body26, label %for.end33

for.body26:                                       ; preds = %for.cond24
  %22 = load i32, i32* %i, align 4
  %idxprom27 = sext i32 %22 to i64
  %arrayidx28 = getelementptr inbounds [5 x i32], [5 x i32]* @sha_info_digest, i64 0, i64 %idxprom27
  %23 = load i32, i32* %arrayidx28, align 4
  %24 = load i32*, i32** %outdata.addr, align 8
  %25 = load i32, i32* %i, align 4
  %idxprom29 = sext i32 %25 to i64
  %arrayidx30 = getelementptr inbounds i32, i32* %24, i64 %idxprom29
  store i32 %23, i32* %arrayidx30, align 4
  br label %for.inc31

for.inc31:                                        ; preds = %for.body26
  %26 = load i32, i32* %i, align 4
  %inc32 = add nsw i32 %26, 1
  store i32 %inc32, i32* %i, align 4
  br label %for.cond24, !llvm.loop !129

for.end33:                                        ; preds = %for.cond24
  %27 = bitcast i8** %p to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %27) #4
  %28 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %28) #4
  %29 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #4
  ret void
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.static.pipeline"="0.-1" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.static.pipeline"="0.-1" "fpga.top.func"="sha_stream" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{!5, !43}
!5 = !{!"fpga.inline", !"user", !6}
!6 = !DILocation(line: 21, column: 9, scope: !7)
!7 = !DILexicalBlockFile(scope: !9, file: !8, discriminator: 0)
!8 = !DIFile(filename: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/sha.tcl", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS")
!9 = distinct !DISubprogram(name: "local_memset", scope: !10, file: !10, line: 55, type: !11, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!10 = !DIFile(filename: "data/benchmarks/sha/sha.c", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !15, !15, !15}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = distinct !DICompileUnit(language: DW_LANG_C99, file: !17, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !18, retainedTypes: !19, globals: !22)
!17 = !DIFile(filename: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_solutions/SHA/solution0/.autopilot/db/sha.pp.0.c", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS")
!18 = !{}
!19 = !{!13, !20, !14, !15}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!22 = !{!23, !25, !27, !32, !37}
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "sha_info_count_lo", scope: !16, file: !10, line: 48, type: !14, isLocal: false, isDefinition: true)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "sha_info_count_hi", scope: !16, file: !10, line: 48, type: !14, isLocal: false, isDefinition: true)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "sha_info_data", scope: !16, file: !10, line: 49, type: !29, isLocal: false, isDefinition: true)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 512, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 16, lowerBound: 0)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "sha_info_digest", scope: !16, file: !10, line: 50, type: !34, isLocal: false, isDefinition: true)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 160, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 5, lowerBound: 0)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "local_indata", scope: !16, file: !10, line: 52, type: !39, isLocal: false, isDefinition: true)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 131072, elements: !40)
!40 = !{!41, !42}
!41 = !DISubrange(count: 2, lowerBound: 0)
!42 = !DISubrange(count: 8192, lowerBound: 0)
!43 = !{!"fpga.static.pipeline", !"user", !44}
!44 = !DILocation(line: 15, column: 9, scope: !7)
!45 = distinct !{!45, !46}
!46 = !{!"llvm.loop.name", !"local_memset_label0"}
!47 = distinct !{!47, !48}
!48 = !{!"llvm.loop.name", !"local_memset_label1"}
!49 = !{!50, !58}
!50 = !{!"fpga.inline", !"user", !51}
!51 = !DILocation(line: 22, column: 9, scope: !52)
!52 = !DILexicalBlockFile(scope: !53, file: !8, discriminator: 0)
!53 = distinct !DISubprogram(name: "local_memcpy", scope: !10, file: !10, line: 72, type: !54, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!54 = !DISubroutineType(types: !55)
!55 = !{null, !13, !56, !15}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!58 = !{!"fpga.static.pipeline", !"user", !59}
!59 = !DILocation(line: 16, column: 9, scope: !52)
!60 = distinct !{!60, !61}
!61 = !{!"llvm.loop.name", !"local_memcpy_label3"}
!62 = !{!63, !69}
!63 = !{!"fpga.inline", !"user", !64}
!64 = !DILocation(line: 24, column: 9, scope: !65)
!65 = !DILexicalBlockFile(scope: !66, file: !8, discriminator: 0)
!66 = distinct !DISubprogram(name: "sha_transform", scope: !10, file: !10, line: 92, type: !67, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !{!"fpga.static.pipeline", !"user", !70}
!70 = !DILocation(line: 17, column: 9, scope: !65)
!71 = distinct !{!71, !72}
!72 = !{!"llvm.loop.name", !"sha_transform_label1"}
!73 = distinct !{!73, !74}
!74 = !{!"llvm.loop.name", !"sha_transform_label2"}
!75 = distinct !{!75, !76}
!76 = !{!"llvm.loop.name", !"sha_transform_label3"}
!77 = distinct !{!77, !78}
!78 = !{!"llvm.loop.name", !"sha_transform_label4"}
!79 = distinct !{!79, !80}
!80 = !{!"llvm.loop.name", !"sha_transform_label5"}
!81 = distinct !{!81, !82}
!82 = !{!"llvm.loop.name", !"sha_transform_label6"}
!83 = !{!84, !88}
!84 = !{!"fpga.inline", !"user", !85}
!85 = !DILocation(line: 26, column: 9, scope: !86)
!86 = !DILexicalBlockFile(scope: !87, file: !8, discriminator: 0)
!87 = distinct !DISubprogram(name: "sha_init", scope: !10, file: !10, line: 143, type: !67, scopeLine: 143, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!88 = !{!"fpga.static.pipeline", !"user", !89}
!89 = !DILocation(line: 19, column: 9, scope: !86)
!90 = !{!91, !97}
!91 = !{!"fpga.inline", !"user", !92}
!92 = !DILocation(line: 25, column: 9, scope: !93)
!93 = !DILexicalBlockFile(scope: !94, file: !8, discriminator: 0)
!94 = distinct !DISubprogram(name: "sha_update", scope: !10, file: !10, line: 154, type: !95, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!95 = !DISubroutineType(types: !96)
!96 = !{null, !56, !15}
!97 = !{!"fpga.static.pipeline", !"user", !98}
!98 = !DILocation(line: 18, column: 9, scope: !93)
!99 = distinct !{!99, !100}
!100 = !{!"llvm.loop.name", !"sha_update_label4"}
!101 = !{!102, !106}
!102 = !{!"fpga.inline", !"user", !103}
!103 = !DILocation(line: 27, column: 9, scope: !104)
!104 = !DILexicalBlockFile(scope: !105, file: !8, discriminator: 0)
!105 = distinct !DISubprogram(name: "sha_final", scope: !10, file: !10, line: 173, type: !67, scopeLine: 173, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!106 = !{!"fpga.static.pipeline", !"user", !107}
!107 = !DILocation(line: 20, column: 9, scope: !104)
!108 = !{!109, !120}
!109 = !{!"fpga.static.pipeline", !"user", !110}
!110 = !DILocation(line: 14, column: 9, scope: !111)
!111 = !DILexicalBlockFile(scope: !112, file: !8, discriminator: 0)
!112 = distinct !DISubprogram(name: "sha_stream", scope: !10, file: !10, line: 196, type: !113, scopeLine: 200, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!113 = !DISubroutineType(types: !114)
!114 = !{null, !115, !118, !13}
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DICompositeType(tag: DW_TAG_array_type, baseType: !57, size: 65536, elements: !117)
!117 = !{!42}
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!120 = !{!"fpga.top", !"user", !121}
!121 = !DILocation(line: 196, column: 16, scope: !122)
!122 = !DILexicalBlockFile(scope: !112, file: !10, discriminator: 0)
!123 = distinct !{!123, !124}
!124 = !{!"llvm.loop.name", !"VITIS_LOOP_207_1"}
!125 = distinct !{!125, !126}
!126 = !{!"llvm.loop.name", !"sha_stream_label1"}
!127 = distinct !{!127, !128}
!128 = !{!"llvm.loop.name", !"sha_stream_label0"}
!129 = distinct !{!129, !130}
!130 = !{!"llvm.loop.name", !"sha_stream_label2"}
