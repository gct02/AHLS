; ModuleID = 'data/base_solutions/TRANS_FFT/solution0/.autopilot/db/a.g.ld.1.lower.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

@twiddles8.reversed8 = private unnamed_addr constant [8 x i32] [i32 0, i32 4, i32 2, i32 6, i32 1, i32 5, i32 3, i32 7], align 4
@fft1D_512.reversed = internal constant [8 x i32] [i32 0, i32 4, i32 2, i32 6, i32 1, i32 5, i32 3, i32 7], align 4

; Function Attrs: noinline nounwind
define void @twiddles8(double* "fpga.decayed.dim.hint"="8" %a_x, double* "fpga.decayed.dim.hint"="8" %a_y, i32 %i, i32 %n) #0 !fpga.function.pragma !4 {
entry:
  %a_x.addr = alloca double*, align 8
  %a_y.addr = alloca double*, align 8
  %i.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %reversed8 = alloca [8 x i32], align 4
  %j = alloca i32, align 4
  %phi = alloca double, align 8
  %tmp = alloca double, align 8
  %phi_x = alloca double, align 8
  %phi_y = alloca double, align 8
  store double* %a_x, double** %a_x.addr, align 8
  store double* %a_y, double** %a_y.addr, align 8
  store i32 %i, i32* %i.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = bitcast [8 x i32]* %reversed8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* %0) #6
  %1 = bitcast [8 x i32]* %reversed8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %1, i8* align 4 bitcast ([8 x i32]* @twiddles8.reversed8 to i8*), i64 32, i1 false)
  %2 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #6
  %3 = bitcast double* %phi to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #6
  %4 = bitcast double* %tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #6
  %5 = bitcast double* %phi_x to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #6
  %6 = bitcast double* %phi_y to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #6
  br label %twiddles

twiddles:                                         ; preds = %entry
  store i32 1, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %twiddles
  %7 = load i32, i32* %j, align 4
  %cmp = icmp slt i32 %7, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %8 = load i32, i32* %j, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds [8 x i32], [8 x i32]* %reversed8, i64 0, i64 %idxprom
  %9 = load i32, i32* %arrayidx, align 4
  %conv = sitofp i32 %9 to double
  %mul = fmul double 0xC01921FB54411744, %conv
  %10 = load i32, i32* %n.addr, align 4
  %conv1 = sitofp i32 %10 to double
  %div = fdiv double %mul, %conv1
  %11 = load i32, i32* %i.addr, align 4
  %conv2 = sitofp i32 %11 to double
  %mul3 = fmul double %div, %conv2
  store double %mul3, double* %phi, align 8
  %12 = load double, double* %phi, align 8
  %13 = call double @cos(double %12)
  store double %13, double* %phi_x, align 8
  %14 = load double, double* %phi, align 8
  %15 = call double @sin(double %14)
  store double %15, double* %phi_y, align 8
  %16 = load double*, double** %a_x.addr, align 8
  %17 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %17 to i64
  %arrayidx5 = getelementptr inbounds double, double* %16, i64 %idxprom4
  %18 = load double, double* %arrayidx5, align 8
  store double %18, double* %tmp, align 8
  %19 = load double*, double** %a_x.addr, align 8
  %20 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %20 to i64
  %arrayidx7 = getelementptr inbounds double, double* %19, i64 %idxprom6
  %21 = load double, double* %arrayidx7, align 8
  %22 = load double, double* %phi_x, align 8
  %mul8 = fmul double %21, %22
  %23 = load double*, double** %a_y.addr, align 8
  %24 = load i32, i32* %j, align 4
  %idxprom9 = sext i32 %24 to i64
  %arrayidx10 = getelementptr inbounds double, double* %23, i64 %idxprom9
  %25 = load double, double* %arrayidx10, align 8
  %26 = load double, double* %phi_y, align 8
  %mul11 = fmul double %25, %26
  %sub = fsub double %mul8, %mul11
  %27 = load double*, double** %a_x.addr, align 8
  %28 = load i32, i32* %j, align 4
  %idxprom12 = sext i32 %28 to i64
  %arrayidx13 = getelementptr inbounds double, double* %27, i64 %idxprom12
  store double %sub, double* %arrayidx13, align 8
  %29 = load double, double* %tmp, align 8
  %30 = load double, double* %phi_y, align 8
  %mul14 = fmul double %29, %30
  %31 = load double*, double** %a_y.addr, align 8
  %32 = load i32, i32* %j, align 4
  %idxprom15 = sext i32 %32 to i64
  %arrayidx16 = getelementptr inbounds double, double* %31, i64 %idxprom15
  %33 = load double, double* %arrayidx16, align 8
  %34 = load double, double* %phi_x, align 8
  %mul17 = fmul double %33, %34
  %add = fadd double %mul14, %mul17
  %35 = load double*, double** %a_y.addr, align 8
  %36 = load i32, i32* %j, align 4
  %idxprom18 = sext i32 %36 to i64
  %arrayidx19 = getelementptr inbounds double, double* %35, i64 %idxprom18
  store double %add, double* %arrayidx19, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %37 = load i32, i32* %j, align 4
  %inc = add nsw i32 %37, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond, !llvm.loop !31

for.end:                                          ; preds = %for.cond
  %38 = bitcast double* %phi_y to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %38) #6
  %39 = bitcast double* %phi_x to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %39) #6
  %40 = bitcast double* %tmp to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %40) #6
  %41 = bitcast double* %phi to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %41) #6
  %42 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %42) #6
  %43 = bitcast [8 x i32]* %reversed8 to i8*
  call void @llvm.lifetime.end.p0i8(i64 32, i8* %43) #6
  ret void
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.cos.f64(double) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.sin.f64(double) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: noinline nounwind
define void @loadx8(double* %a_x, double* %x, i32 %offset, i32 %sx) #0 !fpga.function.pragma !33 {
entry:
  %a_x.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %offset.addr = alloca i32, align 4
  %sx.addr = alloca i32, align 4
  store double* %a_x, double** %a_x.addr, align 8
  store double* %x, double** %x.addr, align 8
  store i32 %offset, i32* %offset.addr, align 4
  store i32 %sx, i32* %sx.addr, align 4
  %0 = load double*, double** %x.addr, align 8
  %1 = load i32, i32* %sx.addr, align 4
  %mul = mul nsw i32 0, %1
  %2 = load i32, i32* %offset.addr, align 4
  %add = add nsw i32 %mul, %2
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds double, double* %0, i64 %idxprom
  %3 = load double, double* %arrayidx, align 8
  %4 = load double*, double** %a_x.addr, align 8
  %arrayidx1 = getelementptr inbounds double, double* %4, i64 0
  store double %3, double* %arrayidx1, align 8
  %5 = load double*, double** %x.addr, align 8
  %6 = load i32, i32* %sx.addr, align 4
  %mul2 = mul nsw i32 1, %6
  %7 = load i32, i32* %offset.addr, align 4
  %add3 = add nsw i32 %mul2, %7
  %idxprom4 = sext i32 %add3 to i64
  %arrayidx5 = getelementptr inbounds double, double* %5, i64 %idxprom4
  %8 = load double, double* %arrayidx5, align 8
  %9 = load double*, double** %a_x.addr, align 8
  %arrayidx6 = getelementptr inbounds double, double* %9, i64 1
  store double %8, double* %arrayidx6, align 8
  %10 = load double*, double** %x.addr, align 8
  %11 = load i32, i32* %sx.addr, align 4
  %mul7 = mul nsw i32 2, %11
  %12 = load i32, i32* %offset.addr, align 4
  %add8 = add nsw i32 %mul7, %12
  %idxprom9 = sext i32 %add8 to i64
  %arrayidx10 = getelementptr inbounds double, double* %10, i64 %idxprom9
  %13 = load double, double* %arrayidx10, align 8
  %14 = load double*, double** %a_x.addr, align 8
  %arrayidx11 = getelementptr inbounds double, double* %14, i64 2
  store double %13, double* %arrayidx11, align 8
  %15 = load double*, double** %x.addr, align 8
  %16 = load i32, i32* %sx.addr, align 4
  %mul12 = mul nsw i32 3, %16
  %17 = load i32, i32* %offset.addr, align 4
  %add13 = add nsw i32 %mul12, %17
  %idxprom14 = sext i32 %add13 to i64
  %arrayidx15 = getelementptr inbounds double, double* %15, i64 %idxprom14
  %18 = load double, double* %arrayidx15, align 8
  %19 = load double*, double** %a_x.addr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %19, i64 3
  store double %18, double* %arrayidx16, align 8
  %20 = load double*, double** %x.addr, align 8
  %21 = load i32, i32* %sx.addr, align 4
  %mul17 = mul nsw i32 4, %21
  %22 = load i32, i32* %offset.addr, align 4
  %add18 = add nsw i32 %mul17, %22
  %idxprom19 = sext i32 %add18 to i64
  %arrayidx20 = getelementptr inbounds double, double* %20, i64 %idxprom19
  %23 = load double, double* %arrayidx20, align 8
  %24 = load double*, double** %a_x.addr, align 8
  %arrayidx21 = getelementptr inbounds double, double* %24, i64 4
  store double %23, double* %arrayidx21, align 8
  %25 = load double*, double** %x.addr, align 8
  %26 = load i32, i32* %sx.addr, align 4
  %mul22 = mul nsw i32 5, %26
  %27 = load i32, i32* %offset.addr, align 4
  %add23 = add nsw i32 %mul22, %27
  %idxprom24 = sext i32 %add23 to i64
  %arrayidx25 = getelementptr inbounds double, double* %25, i64 %idxprom24
  %28 = load double, double* %arrayidx25, align 8
  %29 = load double*, double** %a_x.addr, align 8
  %arrayidx26 = getelementptr inbounds double, double* %29, i64 5
  store double %28, double* %arrayidx26, align 8
  %30 = load double*, double** %x.addr, align 8
  %31 = load i32, i32* %sx.addr, align 4
  %mul27 = mul nsw i32 6, %31
  %32 = load i32, i32* %offset.addr, align 4
  %add28 = add nsw i32 %mul27, %32
  %idxprom29 = sext i32 %add28 to i64
  %arrayidx30 = getelementptr inbounds double, double* %30, i64 %idxprom29
  %33 = load double, double* %arrayidx30, align 8
  %34 = load double*, double** %a_x.addr, align 8
  %arrayidx31 = getelementptr inbounds double, double* %34, i64 6
  store double %33, double* %arrayidx31, align 8
  %35 = load double*, double** %x.addr, align 8
  %36 = load i32, i32* %sx.addr, align 4
  %mul32 = mul nsw i32 7, %36
  %37 = load i32, i32* %offset.addr, align 4
  %add33 = add nsw i32 %mul32, %37
  %idxprom34 = sext i32 %add33 to i64
  %arrayidx35 = getelementptr inbounds double, double* %35, i64 %idxprom34
  %38 = load double, double* %arrayidx35, align 8
  %39 = load double*, double** %a_x.addr, align 8
  %arrayidx36 = getelementptr inbounds double, double* %39, i64 7
  store double %38, double* %arrayidx36, align 8
  ret void
}

; Function Attrs: noinline nounwind
define void @loady8(double* %a_y, double* %x, i32 %offset, i32 %sx) #0 !fpga.function.pragma !40 {
entry:
  %a_y.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %offset.addr = alloca i32, align 4
  %sx.addr = alloca i32, align 4
  store double* %a_y, double** %a_y.addr, align 8
  store double* %x, double** %x.addr, align 8
  store i32 %offset, i32* %offset.addr, align 4
  store i32 %sx, i32* %sx.addr, align 4
  %0 = load double*, double** %x.addr, align 8
  %1 = load i32, i32* %sx.addr, align 4
  %mul = mul nsw i32 0, %1
  %2 = load i32, i32* %offset.addr, align 4
  %add = add nsw i32 %mul, %2
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds double, double* %0, i64 %idxprom
  %3 = load double, double* %arrayidx, align 8
  %4 = load double*, double** %a_y.addr, align 8
  %arrayidx1 = getelementptr inbounds double, double* %4, i64 0
  store double %3, double* %arrayidx1, align 8
  %5 = load double*, double** %x.addr, align 8
  %6 = load i32, i32* %sx.addr, align 4
  %mul2 = mul nsw i32 1, %6
  %7 = load i32, i32* %offset.addr, align 4
  %add3 = add nsw i32 %mul2, %7
  %idxprom4 = sext i32 %add3 to i64
  %arrayidx5 = getelementptr inbounds double, double* %5, i64 %idxprom4
  %8 = load double, double* %arrayidx5, align 8
  %9 = load double*, double** %a_y.addr, align 8
  %arrayidx6 = getelementptr inbounds double, double* %9, i64 1
  store double %8, double* %arrayidx6, align 8
  %10 = load double*, double** %x.addr, align 8
  %11 = load i32, i32* %sx.addr, align 4
  %mul7 = mul nsw i32 2, %11
  %12 = load i32, i32* %offset.addr, align 4
  %add8 = add nsw i32 %mul7, %12
  %idxprom9 = sext i32 %add8 to i64
  %arrayidx10 = getelementptr inbounds double, double* %10, i64 %idxprom9
  %13 = load double, double* %arrayidx10, align 8
  %14 = load double*, double** %a_y.addr, align 8
  %arrayidx11 = getelementptr inbounds double, double* %14, i64 2
  store double %13, double* %arrayidx11, align 8
  %15 = load double*, double** %x.addr, align 8
  %16 = load i32, i32* %sx.addr, align 4
  %mul12 = mul nsw i32 3, %16
  %17 = load i32, i32* %offset.addr, align 4
  %add13 = add nsw i32 %mul12, %17
  %idxprom14 = sext i32 %add13 to i64
  %arrayidx15 = getelementptr inbounds double, double* %15, i64 %idxprom14
  %18 = load double, double* %arrayidx15, align 8
  %19 = load double*, double** %a_y.addr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %19, i64 3
  store double %18, double* %arrayidx16, align 8
  %20 = load double*, double** %x.addr, align 8
  %21 = load i32, i32* %sx.addr, align 4
  %mul17 = mul nsw i32 4, %21
  %22 = load i32, i32* %offset.addr, align 4
  %add18 = add nsw i32 %mul17, %22
  %idxprom19 = sext i32 %add18 to i64
  %arrayidx20 = getelementptr inbounds double, double* %20, i64 %idxprom19
  %23 = load double, double* %arrayidx20, align 8
  %24 = load double*, double** %a_y.addr, align 8
  %arrayidx21 = getelementptr inbounds double, double* %24, i64 4
  store double %23, double* %arrayidx21, align 8
  %25 = load double*, double** %x.addr, align 8
  %26 = load i32, i32* %sx.addr, align 4
  %mul22 = mul nsw i32 5, %26
  %27 = load i32, i32* %offset.addr, align 4
  %add23 = add nsw i32 %mul22, %27
  %idxprom24 = sext i32 %add23 to i64
  %arrayidx25 = getelementptr inbounds double, double* %25, i64 %idxprom24
  %28 = load double, double* %arrayidx25, align 8
  %29 = load double*, double** %a_y.addr, align 8
  %arrayidx26 = getelementptr inbounds double, double* %29, i64 5
  store double %28, double* %arrayidx26, align 8
  %30 = load double*, double** %x.addr, align 8
  %31 = load i32, i32* %sx.addr, align 4
  %mul27 = mul nsw i32 6, %31
  %32 = load i32, i32* %offset.addr, align 4
  %add28 = add nsw i32 %mul27, %32
  %idxprom29 = sext i32 %add28 to i64
  %arrayidx30 = getelementptr inbounds double, double* %30, i64 %idxprom29
  %33 = load double, double* %arrayidx30, align 8
  %34 = load double*, double** %a_y.addr, align 8
  %arrayidx31 = getelementptr inbounds double, double* %34, i64 6
  store double %33, double* %arrayidx31, align 8
  %35 = load double*, double** %x.addr, align 8
  %36 = load i32, i32* %sx.addr, align 4
  %mul32 = mul nsw i32 7, %36
  %37 = load i32, i32* %offset.addr, align 4
  %add33 = add nsw i32 %mul32, %37
  %idxprom34 = sext i32 %add33 to i64
  %arrayidx35 = getelementptr inbounds double, double* %35, i64 %idxprom34
  %38 = load double, double* %arrayidx35, align 8
  %39 = load double*, double** %a_y.addr, align 8
  %arrayidx36 = getelementptr inbounds double, double* %39, i64 7
  store double %38, double* %arrayidx36, align 8
  ret void
}

; Function Attrs: nounwind
define void @fft1D_512(double* "fpga.decayed.dim.hint"="512" %work_x, double* "fpga.decayed.dim.hint"="512" %work_y) #4 !fpga.function.pragma !47 {
entry:
  %work_x.addr = alloca double*, align 8
  %work_y.addr = alloca double*, align 8
  %tid = alloca i32, align 4
  %hi = alloca i32, align 4
  %lo = alloca i32, align 4
  %stride = alloca i32, align 4
  %DATA_x = alloca [512 x double], align 8
  %DATA_y = alloca [512 x double], align 8
  %data_x = alloca [8 x double], align 8
  %data_y = alloca [8 x double], align 8
  %smem = alloca [576 x double], align 8
  %exp_1_8_x = alloca double, align 8
  %exp_1_4_x = alloca double, align 8
  %exp_3_8_x = alloca double, align 8
  %exp_1_8_y = alloca double, align 8
  %exp_1_4_y = alloca double, align 8
  %exp_3_8_y = alloca double, align 8
  %tmp_1 = alloca double, align 8
  %c0_x = alloca double, align 8
  %c0_y = alloca double, align 8
  %c0_x90 = alloca double, align 8
  %c0_y92 = alloca double, align 8
  %c0_x106 = alloca double, align 8
  %c0_y108 = alloca double, align 8
  %c0_x122 = alloca double, align 8
  %c0_y124 = alloca double, align 8
  %exp_1_44_x = alloca double, align 8
  %exp_1_44_y = alloca double, align 8
  %tmp = alloca double, align 8
  %c0_x178 = alloca double, align 8
  %c0_y180 = alloca double, align 8
  %c0_x194 = alloca double, align 8
  %c0_y196 = alloca double, align 8
  %c0_x222 = alloca double, align 8
  %c0_y224 = alloca double, align 8
  %c0_x238 = alloca double, align 8
  %c0_y240 = alloca double, align 8
  %exp_1_44_x254 = alloca double, align 8
  %exp_1_44_y255 = alloca double, align 8
  %tmp256 = alloca double, align 8
  %c0_x257 = alloca double, align 8
  %c0_y259 = alloca double, align 8
  %c0_x273 = alloca double, align 8
  %c0_y275 = alloca double, align 8
  %c0_x301 = alloca double, align 8
  %c0_y303 = alloca double, align 8
  %c0_x317 = alloca double, align 8
  %c0_y319 = alloca double, align 8
  %sx = alloca i32, align 4
  %offset = alloca i32, align 4
  %exp_1_8_x806 = alloca double, align 8
  %exp_1_4_x807 = alloca double, align 8
  %exp_3_8_x808 = alloca double, align 8
  %exp_1_8_y809 = alloca double, align 8
  %exp_1_4_y810 = alloca double, align 8
  %exp_3_8_y811 = alloca double, align 8
  %tmp_1812 = alloca double, align 8
  %c0_x813 = alloca double, align 8
  %c0_y815 = alloca double, align 8
  %c0_x829 = alloca double, align 8
  %c0_y831 = alloca double, align 8
  %c0_x845 = alloca double, align 8
  %c0_y847 = alloca double, align 8
  %c0_x861 = alloca double, align 8
  %c0_y863 = alloca double, align 8
  %exp_1_44_x917 = alloca double, align 8
  %exp_1_44_y918 = alloca double, align 8
  %tmp919 = alloca double, align 8
  %c0_x920 = alloca double, align 8
  %c0_y922 = alloca double, align 8
  %c0_x936 = alloca double, align 8
  %c0_y938 = alloca double, align 8
  %c0_x964 = alloca double, align 8
  %c0_y966 = alloca double, align 8
  %c0_x980 = alloca double, align 8
  %c0_y982 = alloca double, align 8
  %exp_1_44_x996 = alloca double, align 8
  %exp_1_44_y997 = alloca double, align 8
  %tmp998 = alloca double, align 8
  %c0_x999 = alloca double, align 8
  %c0_y1001 = alloca double, align 8
  %c0_x1015 = alloca double, align 8
  %c0_y1017 = alloca double, align 8
  %c0_x1043 = alloca double, align 8
  %c0_y1045 = alloca double, align 8
  %c0_x1059 = alloca double, align 8
  %c0_y1061 = alloca double, align 8
  %exp_1_8_x1554 = alloca double, align 8
  %exp_1_4_x1555 = alloca double, align 8
  %exp_3_8_x1556 = alloca double, align 8
  %exp_1_8_y1557 = alloca double, align 8
  %exp_1_4_y1558 = alloca double, align 8
  %exp_3_8_y1559 = alloca double, align 8
  %tmp_11560 = alloca double, align 8
  %c0_x1561 = alloca double, align 8
  %c0_y1563 = alloca double, align 8
  %c0_x1577 = alloca double, align 8
  %c0_y1579 = alloca double, align 8
  %c0_x1593 = alloca double, align 8
  %c0_y1595 = alloca double, align 8
  %c0_x1609 = alloca double, align 8
  %c0_y1611 = alloca double, align 8
  %exp_1_44_x1665 = alloca double, align 8
  %exp_1_44_y1666 = alloca double, align 8
  %tmp1667 = alloca double, align 8
  %c0_x1668 = alloca double, align 8
  %c0_y1670 = alloca double, align 8
  %c0_x1684 = alloca double, align 8
  %c0_y1686 = alloca double, align 8
  %c0_x1712 = alloca double, align 8
  %c0_y1714 = alloca double, align 8
  %c0_x1728 = alloca double, align 8
  %c0_y1730 = alloca double, align 8
  %exp_1_44_x1744 = alloca double, align 8
  %exp_1_44_y1745 = alloca double, align 8
  %tmp1746 = alloca double, align 8
  %c0_x1747 = alloca double, align 8
  %c0_y1749 = alloca double, align 8
  %c0_x1763 = alloca double, align 8
  %c0_y1765 = alloca double, align 8
  %c0_x1791 = alloca double, align 8
  %c0_y1793 = alloca double, align 8
  %c0_x1807 = alloca double, align 8
  %c0_y1809 = alloca double, align 8
  store double* %work_x, double** %work_x.addr, align 8
  store double* %work_y, double** %work_y.addr, align 8
  %0 = bitcast i32* %tid to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6
  %1 = bitcast i32* %hi to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6
  %2 = bitcast i32* %lo to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #6
  %3 = bitcast i32* %stride to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #6
  call void @llvm.sideeffect() #7 [ "xlx_array_partition"([8 x i32]* @fft1D_512.reversed, i32 999, i32 1, i32 1, i1 false) ]
  %4 = bitcast [512 x double]* %DATA_x to i8*
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* %4) #6
  %5 = bitcast [512 x double]* %DATA_y to i8*
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* %5) #6
  %6 = bitcast [8 x double]* %data_x to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* %6) #6
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([8 x double]* %data_x, i32 999, i32 1, i32 1, i1 false) ]
  %7 = bitcast [8 x double]* %data_y to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* %7) #6
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"([8 x double]* %data_y, i32 999, i32 1, i32 1, i1 false) ]
  %8 = bitcast [576 x double]* %smem to i8*
  call void @llvm.lifetime.start.p0i8(i64 4608, i8* %8) #6
  store i32 64, i32* %stride, align 4
  br label %loop1

loop1:                                            ; preds = %entry
  store i32 0, i32* %tid, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %loop1
  %9 = load i32, i32* %tid, align 4
  %cmp = icmp slt i32 %9, 64
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load double*, double** %work_x.addr, align 8
  %11 = load i32, i32* %stride, align 4
  %mul = mul nsw i32 0, %11
  %12 = load i32, i32* %tid, align 4
  %add = add nsw i32 %mul, %12
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds double, double* %10, i64 %idxprom
  %13 = load double, double* %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  store double %13, double* %arrayidx1, align 8
  %14 = load double*, double** %work_x.addr, align 8
  %15 = load i32, i32* %stride, align 4
  %mul2 = mul nsw i32 1, %15
  %16 = load i32, i32* %tid, align 4
  %add3 = add nsw i32 %mul2, %16
  %idxprom4 = sext i32 %add3 to i64
  %arrayidx5 = getelementptr inbounds double, double* %14, i64 %idxprom4
  %17 = load double, double* %arrayidx5, align 8
  %arrayidx6 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  store double %17, double* %arrayidx6, align 8
  %18 = load double*, double** %work_x.addr, align 8
  %19 = load i32, i32* %stride, align 4
  %mul7 = mul nsw i32 2, %19
  %20 = load i32, i32* %tid, align 4
  %add8 = add nsw i32 %mul7, %20
  %idxprom9 = sext i32 %add8 to i64
  %arrayidx10 = getelementptr inbounds double, double* %18, i64 %idxprom9
  %21 = load double, double* %arrayidx10, align 8
  %arrayidx11 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  store double %21, double* %arrayidx11, align 8
  %22 = load double*, double** %work_x.addr, align 8
  %23 = load i32, i32* %stride, align 4
  %mul12 = mul nsw i32 3, %23
  %24 = load i32, i32* %tid, align 4
  %add13 = add nsw i32 %mul12, %24
  %idxprom14 = sext i32 %add13 to i64
  %arrayidx15 = getelementptr inbounds double, double* %22, i64 %idxprom14
  %25 = load double, double* %arrayidx15, align 8
  %arrayidx16 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  store double %25, double* %arrayidx16, align 8
  %26 = load double*, double** %work_x.addr, align 8
  %27 = load i32, i32* %stride, align 4
  %mul17 = mul nsw i32 4, %27
  %28 = load i32, i32* %tid, align 4
  %add18 = add nsw i32 %mul17, %28
  %idxprom19 = sext i32 %add18 to i64
  %arrayidx20 = getelementptr inbounds double, double* %26, i64 %idxprom19
  %29 = load double, double* %arrayidx20, align 8
  %arrayidx21 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  store double %29, double* %arrayidx21, align 8
  %30 = load double*, double** %work_x.addr, align 8
  %31 = load i32, i32* %stride, align 4
  %mul22 = mul nsw i32 5, %31
  %32 = load i32, i32* %tid, align 4
  %add23 = add nsw i32 %mul22, %32
  %idxprom24 = sext i32 %add23 to i64
  %arrayidx25 = getelementptr inbounds double, double* %30, i64 %idxprom24
  %33 = load double, double* %arrayidx25, align 8
  %arrayidx26 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  store double %33, double* %arrayidx26, align 8
  %34 = load double*, double** %work_x.addr, align 8
  %35 = load i32, i32* %stride, align 4
  %mul27 = mul nsw i32 6, %35
  %36 = load i32, i32* %tid, align 4
  %add28 = add nsw i32 %mul27, %36
  %idxprom29 = sext i32 %add28 to i64
  %arrayidx30 = getelementptr inbounds double, double* %34, i64 %idxprom29
  %37 = load double, double* %arrayidx30, align 8
  %arrayidx31 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  store double %37, double* %arrayidx31, align 8
  %38 = load double*, double** %work_x.addr, align 8
  %39 = load i32, i32* %stride, align 4
  %mul32 = mul nsw i32 7, %39
  %40 = load i32, i32* %tid, align 4
  %add33 = add nsw i32 %mul32, %40
  %idxprom34 = sext i32 %add33 to i64
  %arrayidx35 = getelementptr inbounds double, double* %38, i64 %idxprom34
  %41 = load double, double* %arrayidx35, align 8
  %arrayidx36 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %41, double* %arrayidx36, align 8
  %42 = load double*, double** %work_y.addr, align 8
  %43 = load i32, i32* %stride, align 4
  %mul37 = mul nsw i32 0, %43
  %44 = load i32, i32* %tid, align 4
  %add38 = add nsw i32 %mul37, %44
  %idxprom39 = sext i32 %add38 to i64
  %arrayidx40 = getelementptr inbounds double, double* %42, i64 %idxprom39
  %45 = load double, double* %arrayidx40, align 8
  %arrayidx41 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  store double %45, double* %arrayidx41, align 8
  %46 = load double*, double** %work_y.addr, align 8
  %47 = load i32, i32* %stride, align 4
  %mul42 = mul nsw i32 1, %47
  %48 = load i32, i32* %tid, align 4
  %add43 = add nsw i32 %mul42, %48
  %idxprom44 = sext i32 %add43 to i64
  %arrayidx45 = getelementptr inbounds double, double* %46, i64 %idxprom44
  %49 = load double, double* %arrayidx45, align 8
  %arrayidx46 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  store double %49, double* %arrayidx46, align 8
  %50 = load double*, double** %work_y.addr, align 8
  %51 = load i32, i32* %stride, align 4
  %mul47 = mul nsw i32 2, %51
  %52 = load i32, i32* %tid, align 4
  %add48 = add nsw i32 %mul47, %52
  %idxprom49 = sext i32 %add48 to i64
  %arrayidx50 = getelementptr inbounds double, double* %50, i64 %idxprom49
  %53 = load double, double* %arrayidx50, align 8
  %arrayidx51 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  store double %53, double* %arrayidx51, align 8
  %54 = load double*, double** %work_y.addr, align 8
  %55 = load i32, i32* %stride, align 4
  %mul52 = mul nsw i32 3, %55
  %56 = load i32, i32* %tid, align 4
  %add53 = add nsw i32 %mul52, %56
  %idxprom54 = sext i32 %add53 to i64
  %arrayidx55 = getelementptr inbounds double, double* %54, i64 %idxprom54
  %57 = load double, double* %arrayidx55, align 8
  %arrayidx56 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %57, double* %arrayidx56, align 8
  %58 = load double*, double** %work_y.addr, align 8
  %59 = load i32, i32* %stride, align 4
  %mul57 = mul nsw i32 4, %59
  %60 = load i32, i32* %tid, align 4
  %add58 = add nsw i32 %mul57, %60
  %idxprom59 = sext i32 %add58 to i64
  %arrayidx60 = getelementptr inbounds double, double* %58, i64 %idxprom59
  %61 = load double, double* %arrayidx60, align 8
  %arrayidx61 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  store double %61, double* %arrayidx61, align 8
  %62 = load double*, double** %work_y.addr, align 8
  %63 = load i32, i32* %stride, align 4
  %mul62 = mul nsw i32 5, %63
  %64 = load i32, i32* %tid, align 4
  %add63 = add nsw i32 %mul62, %64
  %idxprom64 = sext i32 %add63 to i64
  %arrayidx65 = getelementptr inbounds double, double* %62, i64 %idxprom64
  %65 = load double, double* %arrayidx65, align 8
  %arrayidx66 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %65, double* %arrayidx66, align 8
  %66 = load double*, double** %work_y.addr, align 8
  %67 = load i32, i32* %stride, align 4
  %mul67 = mul nsw i32 6, %67
  %68 = load i32, i32* %tid, align 4
  %add68 = add nsw i32 %mul67, %68
  %idxprom69 = sext i32 %add68 to i64
  %arrayidx70 = getelementptr inbounds double, double* %66, i64 %idxprom69
  %69 = load double, double* %arrayidx70, align 8
  %arrayidx71 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %69, double* %arrayidx71, align 8
  %70 = load double*, double** %work_y.addr, align 8
  %71 = load i32, i32* %stride, align 4
  %mul72 = mul nsw i32 7, %71
  %72 = load i32, i32* %tid, align 4
  %add73 = add nsw i32 %mul72, %72
  %idxprom74 = sext i32 %add73 to i64
  %arrayidx75 = getelementptr inbounds double, double* %70, i64 %idxprom74
  %73 = load double, double* %arrayidx75, align 8
  %arrayidx76 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %73, double* %arrayidx76, align 8
  %74 = bitcast double* %exp_1_8_x to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %74) #6
  %75 = bitcast double* %exp_1_4_x to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %75) #6
  %76 = bitcast double* %exp_3_8_x to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %76) #6
  %77 = bitcast double* %exp_1_8_y to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %77) #6
  %78 = bitcast double* %exp_1_4_y to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %78) #6
  %79 = bitcast double* %exp_3_8_y to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %79) #6
  %80 = bitcast double* %tmp_1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %80) #6
  store double 1.000000e+00, double* %exp_1_8_x, align 8
  store double -1.000000e+00, double* %exp_1_8_y, align 8
  store double 0.000000e+00, double* %exp_1_4_x, align 8
  store double -1.000000e+00, double* %exp_1_4_y, align 8
  store double -1.000000e+00, double* %exp_3_8_x, align 8
  store double -1.000000e+00, double* %exp_3_8_y, align 8
  %81 = bitcast double* %c0_x to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %81) #6
  %arrayidx77 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  %82 = load double, double* %arrayidx77, align 8
  store double %82, double* %c0_x, align 8
  %83 = bitcast double* %c0_y to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %83) #6
  %arrayidx78 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  %84 = load double, double* %arrayidx78, align 8
  store double %84, double* %c0_y, align 8
  %85 = load double, double* %c0_x, align 8
  %arrayidx79 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  %86 = load double, double* %arrayidx79, align 8
  %add80 = fadd double %85, %86
  %arrayidx81 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  store double %add80, double* %arrayidx81, align 8
  %87 = load double, double* %c0_y, align 8
  %arrayidx82 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %88 = load double, double* %arrayidx82, align 8
  %add83 = fadd double %87, %88
  %arrayidx84 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  store double %add83, double* %arrayidx84, align 8
  %89 = load double, double* %c0_x, align 8
  %arrayidx85 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  %90 = load double, double* %arrayidx85, align 8
  %sub = fsub double %89, %90
  %arrayidx86 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  store double %sub, double* %arrayidx86, align 8
  %91 = load double, double* %c0_y, align 8
  %arrayidx87 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %92 = load double, double* %arrayidx87, align 8
  %sub88 = fsub double %91, %92
  %arrayidx89 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  store double %sub88, double* %arrayidx89, align 8
  %93 = bitcast double* %c0_y to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %93) #6
  %94 = bitcast double* %c0_x to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %94) #6
  %95 = bitcast double* %c0_x90 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %95) #6
  %arrayidx91 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  %96 = load double, double* %arrayidx91, align 8
  store double %96, double* %c0_x90, align 8
  %97 = bitcast double* %c0_y92 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %97) #6
  %arrayidx93 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %98 = load double, double* %arrayidx93, align 8
  store double %98, double* %c0_y92, align 8
  %99 = load double, double* %c0_x90, align 8
  %arrayidx94 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %100 = load double, double* %arrayidx94, align 8
  %add95 = fadd double %99, %100
  %arrayidx96 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  store double %add95, double* %arrayidx96, align 8
  %101 = load double, double* %c0_y92, align 8
  %arrayidx97 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %102 = load double, double* %arrayidx97, align 8
  %add98 = fadd double %101, %102
  %arrayidx99 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  store double %add98, double* %arrayidx99, align 8
  %103 = load double, double* %c0_x90, align 8
  %arrayidx100 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %104 = load double, double* %arrayidx100, align 8
  %sub101 = fsub double %103, %104
  %arrayidx102 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  store double %sub101, double* %arrayidx102, align 8
  %105 = load double, double* %c0_y92, align 8
  %arrayidx103 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %106 = load double, double* %arrayidx103, align 8
  %sub104 = fsub double %105, %106
  %arrayidx105 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %sub104, double* %arrayidx105, align 8
  %107 = bitcast double* %c0_y92 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %107) #6
  %108 = bitcast double* %c0_x90 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %108) #6
  %109 = bitcast double* %c0_x106 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %109) #6
  %arrayidx107 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  %110 = load double, double* %arrayidx107, align 8
  store double %110, double* %c0_x106, align 8
  %111 = bitcast double* %c0_y108 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %111) #6
  %arrayidx109 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %112 = load double, double* %arrayidx109, align 8
  store double %112, double* %c0_y108, align 8
  %113 = load double, double* %c0_x106, align 8
  %arrayidx110 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %114 = load double, double* %arrayidx110, align 8
  %add111 = fadd double %113, %114
  %arrayidx112 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  store double %add111, double* %arrayidx112, align 8
  %115 = load double, double* %c0_y108, align 8
  %arrayidx113 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %116 = load double, double* %arrayidx113, align 8
  %add114 = fadd double %115, %116
  %arrayidx115 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  store double %add114, double* %arrayidx115, align 8
  %117 = load double, double* %c0_x106, align 8
  %arrayidx116 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %118 = load double, double* %arrayidx116, align 8
  %sub117 = fsub double %117, %118
  %arrayidx118 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  store double %sub117, double* %arrayidx118, align 8
  %119 = load double, double* %c0_y108, align 8
  %arrayidx119 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %120 = load double, double* %arrayidx119, align 8
  %sub120 = fsub double %119, %120
  %arrayidx121 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %sub120, double* %arrayidx121, align 8
  %121 = bitcast double* %c0_y108 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %121) #6
  %122 = bitcast double* %c0_x106 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %122) #6
  %123 = bitcast double* %c0_x122 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %123) #6
  %arrayidx123 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %124 = load double, double* %arrayidx123, align 8
  store double %124, double* %c0_x122, align 8
  %125 = bitcast double* %c0_y124 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %125) #6
  %arrayidx125 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %126 = load double, double* %arrayidx125, align 8
  store double %126, double* %c0_y124, align 8
  %127 = load double, double* %c0_x122, align 8
  %arrayidx126 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %128 = load double, double* %arrayidx126, align 8
  %add127 = fadd double %127, %128
  %arrayidx128 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  store double %add127, double* %arrayidx128, align 8
  %129 = load double, double* %c0_y124, align 8
  %arrayidx129 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %130 = load double, double* %arrayidx129, align 8
  %add130 = fadd double %129, %130
  %arrayidx131 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %add130, double* %arrayidx131, align 8
  %131 = load double, double* %c0_x122, align 8
  %arrayidx132 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %132 = load double, double* %arrayidx132, align 8
  %sub133 = fsub double %131, %132
  %arrayidx134 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %sub133, double* %arrayidx134, align 8
  %133 = load double, double* %c0_y124, align 8
  %arrayidx135 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %134 = load double, double* %arrayidx135, align 8
  %sub136 = fsub double %133, %134
  %arrayidx137 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %sub136, double* %arrayidx137, align 8
  %135 = bitcast double* %c0_y124 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %135) #6
  %136 = bitcast double* %c0_x122 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %136) #6
  %arrayidx138 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %137 = load double, double* %arrayidx138, align 8
  store double %137, double* %tmp_1, align 8
  %arrayidx139 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %138 = load double, double* %arrayidx139, align 8
  %139 = load double, double* %exp_1_8_x, align 8
  %mul140 = fmul double %138, %139
  %arrayidx141 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %140 = load double, double* %arrayidx141, align 8
  %141 = load double, double* %exp_1_8_y, align 8
  %mul142 = fmul double %140, %141
  %sub143 = fsub double %mul140, %mul142
  %mul144 = fmul double 0x3FE6A09E60000000, %sub143
  %arrayidx145 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  store double %mul144, double* %arrayidx145, align 8
  %142 = load double, double* %tmp_1, align 8
  %143 = load double, double* %exp_1_8_y, align 8
  %mul146 = fmul double %142, %143
  %arrayidx147 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %144 = load double, double* %arrayidx147, align 8
  %145 = load double, double* %exp_1_8_x, align 8
  %mul148 = fmul double %144, %145
  %add149 = fadd double %mul146, %mul148
  %mul150 = fmul double 0x3FE6A09E60000000, %add149
  %arrayidx151 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %mul150, double* %arrayidx151, align 8
  %arrayidx152 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %146 = load double, double* %arrayidx152, align 8
  store double %146, double* %tmp_1, align 8
  %arrayidx153 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %147 = load double, double* %arrayidx153, align 8
  %148 = load double, double* %exp_1_4_x, align 8
  %mul154 = fmul double %147, %148
  %arrayidx155 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %149 = load double, double* %arrayidx155, align 8
  %150 = load double, double* %exp_1_4_y, align 8
  %mul156 = fmul double %149, %150
  %sub157 = fsub double %mul154, %mul156
  %arrayidx158 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  store double %sub157, double* %arrayidx158, align 8
  %151 = load double, double* %tmp_1, align 8
  %152 = load double, double* %exp_1_4_y, align 8
  %mul159 = fmul double %151, %152
  %arrayidx160 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %153 = load double, double* %arrayidx160, align 8
  %154 = load double, double* %exp_1_4_x, align 8
  %mul161 = fmul double %153, %154
  %add162 = fadd double %mul159, %mul161
  %arrayidx163 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %add162, double* %arrayidx163, align 8
  %arrayidx164 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %155 = load double, double* %arrayidx164, align 8
  store double %155, double* %tmp_1, align 8
  %arrayidx165 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %156 = load double, double* %arrayidx165, align 8
  %157 = load double, double* %exp_3_8_x, align 8
  %mul166 = fmul double %156, %157
  %arrayidx167 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %158 = load double, double* %arrayidx167, align 8
  %159 = load double, double* %exp_3_8_y, align 8
  %mul168 = fmul double %158, %159
  %sub169 = fsub double %mul166, %mul168
  %mul170 = fmul double 0x3FE6A09E60000000, %sub169
  %arrayidx171 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %mul170, double* %arrayidx171, align 8
  %160 = load double, double* %tmp_1, align 8
  %161 = load double, double* %exp_3_8_y, align 8
  %mul172 = fmul double %160, %161
  %arrayidx173 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %162 = load double, double* %arrayidx173, align 8
  %163 = load double, double* %exp_3_8_x, align 8
  %mul174 = fmul double %162, %163
  %add175 = fadd double %mul172, %mul174
  %mul176 = fmul double 0x3FE6A09E60000000, %add175
  %arrayidx177 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %mul176, double* %arrayidx177, align 8
  %164 = bitcast double* %exp_1_44_x to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %164) #6
  %165 = bitcast double* %exp_1_44_y to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %165) #6
  %166 = bitcast double* %tmp to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %166) #6
  store double 0.000000e+00, double* %exp_1_44_x, align 8
  store double -1.000000e+00, double* %exp_1_44_y, align 8
  %167 = bitcast double* %c0_x178 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %167) #6
  %arrayidx179 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  %168 = load double, double* %arrayidx179, align 8
  store double %168, double* %c0_x178, align 8
  %169 = bitcast double* %c0_y180 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %169) #6
  %arrayidx181 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  %170 = load double, double* %arrayidx181, align 8
  store double %170, double* %c0_y180, align 8
  %171 = load double, double* %c0_x178, align 8
  %arrayidx182 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  %172 = load double, double* %arrayidx182, align 8
  %add183 = fadd double %171, %172
  %arrayidx184 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  store double %add183, double* %arrayidx184, align 8
  %173 = load double, double* %c0_y180, align 8
  %arrayidx185 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %174 = load double, double* %arrayidx185, align 8
  %add186 = fadd double %173, %174
  %arrayidx187 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  store double %add186, double* %arrayidx187, align 8
  %175 = load double, double* %c0_x178, align 8
  %arrayidx188 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  %176 = load double, double* %arrayidx188, align 8
  %sub189 = fsub double %175, %176
  %arrayidx190 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  store double %sub189, double* %arrayidx190, align 8
  %177 = load double, double* %c0_y180, align 8
  %arrayidx191 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %178 = load double, double* %arrayidx191, align 8
  %sub192 = fsub double %177, %178
  %arrayidx193 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  store double %sub192, double* %arrayidx193, align 8
  %179 = bitcast double* %c0_y180 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %179) #6
  %180 = bitcast double* %c0_x178 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %180) #6
  %181 = bitcast double* %c0_x194 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %181) #6
  %arrayidx195 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  %182 = load double, double* %arrayidx195, align 8
  store double %182, double* %c0_x194, align 8
  %183 = bitcast double* %c0_y196 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %183) #6
  %arrayidx197 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %184 = load double, double* %arrayidx197, align 8
  store double %184, double* %c0_y196, align 8
  %185 = load double, double* %c0_x194, align 8
  %arrayidx198 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %186 = load double, double* %arrayidx198, align 8
  %add199 = fadd double %185, %186
  %arrayidx200 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  store double %add199, double* %arrayidx200, align 8
  %187 = load double, double* %c0_y196, align 8
  %arrayidx201 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %188 = load double, double* %arrayidx201, align 8
  %add202 = fadd double %187, %188
  %arrayidx203 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  store double %add202, double* %arrayidx203, align 8
  %189 = load double, double* %c0_x194, align 8
  %arrayidx204 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %190 = load double, double* %arrayidx204, align 8
  %sub205 = fsub double %189, %190
  %arrayidx206 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  store double %sub205, double* %arrayidx206, align 8
  %191 = load double, double* %c0_y196, align 8
  %arrayidx207 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %192 = load double, double* %arrayidx207, align 8
  %sub208 = fsub double %191, %192
  %arrayidx209 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %sub208, double* %arrayidx209, align 8
  %193 = bitcast double* %c0_y196 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %193) #6
  %194 = bitcast double* %c0_x194 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %194) #6
  %arrayidx210 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %195 = load double, double* %arrayidx210, align 8
  store double %195, double* %tmp, align 8
  %arrayidx211 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %196 = load double, double* %arrayidx211, align 8
  %197 = load double, double* %exp_1_44_x, align 8
  %mul212 = fmul double %196, %197
  %arrayidx213 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %198 = load double, double* %arrayidx213, align 8
  %199 = load double, double* %exp_1_44_y, align 8
  %mul214 = fmul double %198, %199
  %sub215 = fsub double %mul212, %mul214
  %arrayidx216 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  store double %sub215, double* %arrayidx216, align 8
  %200 = load double, double* %tmp, align 8
  %201 = load double, double* %exp_1_44_y, align 8
  %mul217 = fmul double %200, %201
  %arrayidx218 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %202 = load double, double* %arrayidx218, align 8
  %203 = load double, double* %exp_1_44_x, align 8
  %mul219 = fmul double %202, %203
  %sub220 = fsub double %mul217, %mul219
  %arrayidx221 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %sub220, double* %arrayidx221, align 8
  %204 = bitcast double* %c0_x222 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %204) #6
  %arrayidx223 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  %205 = load double, double* %arrayidx223, align 8
  store double %205, double* %c0_x222, align 8
  %206 = bitcast double* %c0_y224 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %206) #6
  %arrayidx225 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  %207 = load double, double* %arrayidx225, align 8
  store double %207, double* %c0_y224, align 8
  %208 = load double, double* %c0_x222, align 8
  %arrayidx226 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  %209 = load double, double* %arrayidx226, align 8
  %add227 = fadd double %208, %209
  %arrayidx228 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  store double %add227, double* %arrayidx228, align 8
  %210 = load double, double* %c0_y224, align 8
  %arrayidx229 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %211 = load double, double* %arrayidx229, align 8
  %add230 = fadd double %210, %211
  %arrayidx231 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  store double %add230, double* %arrayidx231, align 8
  %212 = load double, double* %c0_x222, align 8
  %arrayidx232 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  %213 = load double, double* %arrayidx232, align 8
  %sub233 = fsub double %212, %213
  %arrayidx234 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  store double %sub233, double* %arrayidx234, align 8
  %214 = load double, double* %c0_y224, align 8
  %arrayidx235 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %215 = load double, double* %arrayidx235, align 8
  %sub236 = fsub double %214, %215
  %arrayidx237 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  store double %sub236, double* %arrayidx237, align 8
  %216 = bitcast double* %c0_y224 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %216) #6
  %217 = bitcast double* %c0_x222 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %217) #6
  %218 = bitcast double* %c0_x238 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %218) #6
  %arrayidx239 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  %219 = load double, double* %arrayidx239, align 8
  store double %219, double* %c0_x238, align 8
  %220 = bitcast double* %c0_y240 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %220) #6
  %arrayidx241 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %221 = load double, double* %arrayidx241, align 8
  store double %221, double* %c0_y240, align 8
  %222 = load double, double* %c0_x238, align 8
  %arrayidx242 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %223 = load double, double* %arrayidx242, align 8
  %add243 = fadd double %222, %223
  %arrayidx244 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  store double %add243, double* %arrayidx244, align 8
  %224 = load double, double* %c0_y240, align 8
  %arrayidx245 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %225 = load double, double* %arrayidx245, align 8
  %add246 = fadd double %224, %225
  %arrayidx247 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  store double %add246, double* %arrayidx247, align 8
  %226 = load double, double* %c0_x238, align 8
  %arrayidx248 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %227 = load double, double* %arrayidx248, align 8
  %sub249 = fsub double %226, %227
  %arrayidx250 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  store double %sub249, double* %arrayidx250, align 8
  %228 = load double, double* %c0_y240, align 8
  %arrayidx251 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %229 = load double, double* %arrayidx251, align 8
  %sub252 = fsub double %228, %229
  %arrayidx253 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %sub252, double* %arrayidx253, align 8
  %230 = bitcast double* %c0_y240 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %230) #6
  %231 = bitcast double* %c0_x238 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %231) #6
  %232 = bitcast double* %tmp to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %232) #6
  %233 = bitcast double* %exp_1_44_y to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %233) #6
  %234 = bitcast double* %exp_1_44_x to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %234) #6
  %235 = bitcast double* %exp_1_44_x254 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %235) #6
  %236 = bitcast double* %exp_1_44_y255 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %236) #6
  %237 = bitcast double* %tmp256 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %237) #6
  store double 0.000000e+00, double* %exp_1_44_x254, align 8
  store double -1.000000e+00, double* %exp_1_44_y255, align 8
  %238 = bitcast double* %c0_x257 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %238) #6
  %arrayidx258 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  %239 = load double, double* %arrayidx258, align 8
  store double %239, double* %c0_x257, align 8
  %240 = bitcast double* %c0_y259 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %240) #6
  %arrayidx260 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %241 = load double, double* %arrayidx260, align 8
  store double %241, double* %c0_y259, align 8
  %242 = load double, double* %c0_x257, align 8
  %arrayidx261 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %243 = load double, double* %arrayidx261, align 8
  %add262 = fadd double %242, %243
  %arrayidx263 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  store double %add262, double* %arrayidx263, align 8
  %244 = load double, double* %c0_y259, align 8
  %arrayidx264 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %245 = load double, double* %arrayidx264, align 8
  %add265 = fadd double %244, %245
  %arrayidx266 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  store double %add265, double* %arrayidx266, align 8
  %246 = load double, double* %c0_x257, align 8
  %arrayidx267 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %247 = load double, double* %arrayidx267, align 8
  %sub268 = fsub double %246, %247
  %arrayidx269 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  store double %sub268, double* %arrayidx269, align 8
  %248 = load double, double* %c0_y259, align 8
  %arrayidx270 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %249 = load double, double* %arrayidx270, align 8
  %sub271 = fsub double %248, %249
  %arrayidx272 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %sub271, double* %arrayidx272, align 8
  %250 = bitcast double* %c0_y259 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %250) #6
  %251 = bitcast double* %c0_x257 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %251) #6
  %252 = bitcast double* %c0_x273 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %252) #6
  %arrayidx274 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %253 = load double, double* %arrayidx274, align 8
  store double %253, double* %c0_x273, align 8
  %254 = bitcast double* %c0_y275 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %254) #6
  %arrayidx276 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %255 = load double, double* %arrayidx276, align 8
  store double %255, double* %c0_y275, align 8
  %256 = load double, double* %c0_x273, align 8
  %arrayidx277 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %257 = load double, double* %arrayidx277, align 8
  %add278 = fadd double %256, %257
  %arrayidx279 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  store double %add278, double* %arrayidx279, align 8
  %258 = load double, double* %c0_y275, align 8
  %arrayidx280 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %259 = load double, double* %arrayidx280, align 8
  %add281 = fadd double %258, %259
  %arrayidx282 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %add281, double* %arrayidx282, align 8
  %260 = load double, double* %c0_x273, align 8
  %arrayidx283 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %261 = load double, double* %arrayidx283, align 8
  %sub284 = fsub double %260, %261
  %arrayidx285 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %sub284, double* %arrayidx285, align 8
  %262 = load double, double* %c0_y275, align 8
  %arrayidx286 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %263 = load double, double* %arrayidx286, align 8
  %sub287 = fsub double %262, %263
  %arrayidx288 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %sub287, double* %arrayidx288, align 8
  %264 = bitcast double* %c0_y275 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %264) #6
  %265 = bitcast double* %c0_x273 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %265) #6
  %arrayidx289 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %266 = load double, double* %arrayidx289, align 8
  store double %266, double* %tmp256, align 8
  %arrayidx290 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %267 = load double, double* %arrayidx290, align 8
  %268 = load double, double* %exp_1_44_x254, align 8
  %mul291 = fmul double %267, %268
  %arrayidx292 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %269 = load double, double* %arrayidx292, align 8
  %270 = load double, double* %exp_1_44_y255, align 8
  %mul293 = fmul double %269, %270
  %sub294 = fsub double %mul291, %mul293
  %arrayidx295 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %sub294, double* %arrayidx295, align 8
  %271 = load double, double* %tmp256, align 8
  %272 = load double, double* %exp_1_44_y255, align 8
  %mul296 = fmul double %271, %272
  %arrayidx297 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %273 = load double, double* %arrayidx297, align 8
  %274 = load double, double* %exp_1_44_x254, align 8
  %mul298 = fmul double %273, %274
  %sub299 = fsub double %mul296, %mul298
  %arrayidx300 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %sub299, double* %arrayidx300, align 8
  %275 = bitcast double* %c0_x301 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %275) #6
  %arrayidx302 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  %276 = load double, double* %arrayidx302, align 8
  store double %276, double* %c0_x301, align 8
  %277 = bitcast double* %c0_y303 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %277) #6
  %arrayidx304 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %278 = load double, double* %arrayidx304, align 8
  store double %278, double* %c0_y303, align 8
  %279 = load double, double* %c0_x301, align 8
  %arrayidx305 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %280 = load double, double* %arrayidx305, align 8
  %add306 = fadd double %279, %280
  %arrayidx307 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  store double %add306, double* %arrayidx307, align 8
  %281 = load double, double* %c0_y303, align 8
  %arrayidx308 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %282 = load double, double* %arrayidx308, align 8
  %add309 = fadd double %281, %282
  %arrayidx310 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  store double %add309, double* %arrayidx310, align 8
  %283 = load double, double* %c0_x301, align 8
  %arrayidx311 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %284 = load double, double* %arrayidx311, align 8
  %sub312 = fsub double %283, %284
  %arrayidx313 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  store double %sub312, double* %arrayidx313, align 8
  %285 = load double, double* %c0_y303, align 8
  %arrayidx314 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %286 = load double, double* %arrayidx314, align 8
  %sub315 = fsub double %285, %286
  %arrayidx316 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %sub315, double* %arrayidx316, align 8
  %287 = bitcast double* %c0_y303 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %287) #6
  %288 = bitcast double* %c0_x301 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %288) #6
  %289 = bitcast double* %c0_x317 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %289) #6
  %arrayidx318 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %290 = load double, double* %arrayidx318, align 8
  store double %290, double* %c0_x317, align 8
  %291 = bitcast double* %c0_y319 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %291) #6
  %arrayidx320 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %292 = load double, double* %arrayidx320, align 8
  store double %292, double* %c0_y319, align 8
  %293 = load double, double* %c0_x317, align 8
  %arrayidx321 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %294 = load double, double* %arrayidx321, align 8
  %add322 = fadd double %293, %294
  %arrayidx323 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  store double %add322, double* %arrayidx323, align 8
  %295 = load double, double* %c0_y319, align 8
  %arrayidx324 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %296 = load double, double* %arrayidx324, align 8
  %add325 = fadd double %295, %296
  %arrayidx326 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %add325, double* %arrayidx326, align 8
  %297 = load double, double* %c0_x317, align 8
  %arrayidx327 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %298 = load double, double* %arrayidx327, align 8
  %sub328 = fsub double %297, %298
  %arrayidx329 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %sub328, double* %arrayidx329, align 8
  %299 = load double, double* %c0_y319, align 8
  %arrayidx330 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %300 = load double, double* %arrayidx330, align 8
  %sub331 = fsub double %299, %300
  %arrayidx332 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %sub331, double* %arrayidx332, align 8
  %301 = bitcast double* %c0_y319 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %301) #6
  %302 = bitcast double* %c0_x317 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %302) #6
  %303 = bitcast double* %tmp256 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %303) #6
  %304 = bitcast double* %exp_1_44_y255 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %304) #6
  %305 = bitcast double* %exp_1_44_x254 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %305) #6
  %306 = bitcast double* %tmp_1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %306) #6
  %307 = bitcast double* %exp_3_8_y to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %307) #6
  %308 = bitcast double* %exp_1_4_y to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %308) #6
  %309 = bitcast double* %exp_1_8_y to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %309) #6
  %310 = bitcast double* %exp_3_8_x to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %310) #6
  %311 = bitcast double* %exp_1_4_x to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %311) #6
  %312 = bitcast double* %exp_1_8_x to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %312) #6
  %arraydecay = getelementptr inbounds [8 x double], [8 x double]* %data_x, i32 0, i32 0
  %arraydecay333 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i32 0, i32 0
  %313 = load i32, i32* %tid, align 4
  call void @twiddles8(double* %arraydecay, double* %arraydecay333, i32 %313, i32 512)
  %arrayidx334 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  %314 = load double, double* %arrayidx334, align 8
  %315 = load i32, i32* %tid, align 4
  %mul335 = mul nsw i32 %315, 8
  %idxprom336 = sext i32 %mul335 to i64
  %arrayidx337 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom336
  store double %314, double* %arrayidx337, align 8
  %arrayidx338 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  %316 = load double, double* %arrayidx338, align 8
  %317 = load i32, i32* %tid, align 4
  %mul339 = mul nsw i32 %317, 8
  %add340 = add nsw i32 %mul339, 1
  %idxprom341 = sext i32 %add340 to i64
  %arrayidx342 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom341
  store double %316, double* %arrayidx342, align 8
  %arrayidx343 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  %318 = load double, double* %arrayidx343, align 8
  %319 = load i32, i32* %tid, align 4
  %mul344 = mul nsw i32 %319, 8
  %add345 = add nsw i32 %mul344, 2
  %idxprom346 = sext i32 %add345 to i64
  %arrayidx347 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom346
  store double %318, double* %arrayidx347, align 8
  %arrayidx348 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %320 = load double, double* %arrayidx348, align 8
  %321 = load i32, i32* %tid, align 4
  %mul349 = mul nsw i32 %321, 8
  %add350 = add nsw i32 %mul349, 3
  %idxprom351 = sext i32 %add350 to i64
  %arrayidx352 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom351
  store double %320, double* %arrayidx352, align 8
  %arrayidx353 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  %322 = load double, double* %arrayidx353, align 8
  %323 = load i32, i32* %tid, align 4
  %mul354 = mul nsw i32 %323, 8
  %add355 = add nsw i32 %mul354, 4
  %idxprom356 = sext i32 %add355 to i64
  %arrayidx357 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom356
  store double %322, double* %arrayidx357, align 8
  %arrayidx358 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %324 = load double, double* %arrayidx358, align 8
  %325 = load i32, i32* %tid, align 4
  %mul359 = mul nsw i32 %325, 8
  %add360 = add nsw i32 %mul359, 5
  %idxprom361 = sext i32 %add360 to i64
  %arrayidx362 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom361
  store double %324, double* %arrayidx362, align 8
  %arrayidx363 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %326 = load double, double* %arrayidx363, align 8
  %327 = load i32, i32* %tid, align 4
  %mul364 = mul nsw i32 %327, 8
  %add365 = add nsw i32 %mul364, 6
  %idxprom366 = sext i32 %add365 to i64
  %arrayidx367 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom366
  store double %326, double* %arrayidx367, align 8
  %arrayidx368 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %328 = load double, double* %arrayidx368, align 8
  %329 = load i32, i32* %tid, align 4
  %mul369 = mul nsw i32 %329, 8
  %add370 = add nsw i32 %mul369, 7
  %idxprom371 = sext i32 %add370 to i64
  %arrayidx372 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom371
  store double %328, double* %arrayidx372, align 8
  %arrayidx373 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  %330 = load double, double* %arrayidx373, align 8
  %331 = load i32, i32* %tid, align 4
  %mul374 = mul nsw i32 %331, 8
  %idxprom375 = sext i32 %mul374 to i64
  %arrayidx376 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom375
  store double %330, double* %arrayidx376, align 8
  %arrayidx377 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %332 = load double, double* %arrayidx377, align 8
  %333 = load i32, i32* %tid, align 4
  %mul378 = mul nsw i32 %333, 8
  %add379 = add nsw i32 %mul378, 1
  %idxprom380 = sext i32 %add379 to i64
  %arrayidx381 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom380
  store double %332, double* %arrayidx381, align 8
  %arrayidx382 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %334 = load double, double* %arrayidx382, align 8
  %335 = load i32, i32* %tid, align 4
  %mul383 = mul nsw i32 %335, 8
  %add384 = add nsw i32 %mul383, 2
  %idxprom385 = sext i32 %add384 to i64
  %arrayidx386 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom385
  store double %334, double* %arrayidx386, align 8
  %arrayidx387 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %336 = load double, double* %arrayidx387, align 8
  %337 = load i32, i32* %tid, align 4
  %mul388 = mul nsw i32 %337, 8
  %add389 = add nsw i32 %mul388, 3
  %idxprom390 = sext i32 %add389 to i64
  %arrayidx391 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom390
  store double %336, double* %arrayidx391, align 8
  %arrayidx392 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %338 = load double, double* %arrayidx392, align 8
  %339 = load i32, i32* %tid, align 4
  %mul393 = mul nsw i32 %339, 8
  %add394 = add nsw i32 %mul393, 4
  %idxprom395 = sext i32 %add394 to i64
  %arrayidx396 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom395
  store double %338, double* %arrayidx396, align 8
  %arrayidx397 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %340 = load double, double* %arrayidx397, align 8
  %341 = load i32, i32* %tid, align 4
  %mul398 = mul nsw i32 %341, 8
  %add399 = add nsw i32 %mul398, 5
  %idxprom400 = sext i32 %add399 to i64
  %arrayidx401 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom400
  store double %340, double* %arrayidx401, align 8
  %arrayidx402 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %342 = load double, double* %arrayidx402, align 8
  %343 = load i32, i32* %tid, align 4
  %mul403 = mul nsw i32 %343, 8
  %add404 = add nsw i32 %mul403, 6
  %idxprom405 = sext i32 %add404 to i64
  %arrayidx406 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom405
  store double %342, double* %arrayidx406, align 8
  %arrayidx407 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %344 = load double, double* %arrayidx407, align 8
  %345 = load i32, i32* %tid, align 4
  %mul408 = mul nsw i32 %345, 8
  %add409 = add nsw i32 %mul408, 7
  %idxprom410 = sext i32 %add409 to i64
  %arrayidx411 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom410
  store double %344, double* %arrayidx411, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %346 = load i32, i32* %tid, align 4
  %inc = add nsw i32 %346, 1
  store i32 %inc, i32* %tid, align 4
  br label %for.cond, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  store i32 66, i32* %sx, align 4
  br label %loop2

loop2:                                            ; preds = %for.end
  store i32 0, i32* %tid, align 4
  br label %for.cond412

for.cond412:                                      ; preds = %for.inc481, %loop2
  %347 = load i32, i32* %tid, align 4
  %cmp413 = icmp slt i32 %347, 64
  br i1 %cmp413, label %for.body414, label %for.end483

for.body414:                                      ; preds = %for.cond412
  %348 = load i32, i32* %tid, align 4
  %shr = ashr i32 %348, 3
  store i32 %shr, i32* %hi, align 4
  %349 = load i32, i32* %tid, align 4
  %and = and i32 %349, 7
  store i32 %and, i32* %lo, align 4
  %350 = load i32, i32* %hi, align 4
  %mul415 = mul nsw i32 %350, 8
  %351 = load i32, i32* %lo, align 4
  %add416 = add nsw i32 %mul415, %351
  store i32 %add416, i32* %offset, align 4
  %352 = load i32, i32* %tid, align 4
  %mul417 = mul nsw i32 %352, 8
  %add418 = add nsw i32 %mul417, 0
  %idxprom419 = sext i32 %add418 to i64
  %arrayidx420 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom419
  %353 = load double, double* %arrayidx420, align 8
  %354 = load i32, i32* %sx, align 4
  %mul421 = mul nsw i32 0, %354
  %355 = load i32, i32* %offset, align 4
  %add422 = add nsw i32 %mul421, %355
  %idxprom423 = sext i32 %add422 to i64
  %arrayidx424 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom423
  store double %353, double* %arrayidx424, align 8
  %356 = load i32, i32* %tid, align 4
  %mul425 = mul nsw i32 %356, 8
  %add426 = add nsw i32 %mul425, 1
  %idxprom427 = sext i32 %add426 to i64
  %arrayidx428 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom427
  %357 = load double, double* %arrayidx428, align 8
  %358 = load i32, i32* %sx, align 4
  %mul429 = mul nsw i32 4, %358
  %359 = load i32, i32* %offset, align 4
  %add430 = add nsw i32 %mul429, %359
  %idxprom431 = sext i32 %add430 to i64
  %arrayidx432 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom431
  store double %357, double* %arrayidx432, align 8
  %360 = load i32, i32* %tid, align 4
  %mul433 = mul nsw i32 %360, 8
  %add434 = add nsw i32 %mul433, 4
  %idxprom435 = sext i32 %add434 to i64
  %arrayidx436 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom435
  %361 = load double, double* %arrayidx436, align 8
  %362 = load i32, i32* %sx, align 4
  %mul437 = mul nsw i32 1, %362
  %363 = load i32, i32* %offset, align 4
  %add438 = add nsw i32 %mul437, %363
  %idxprom439 = sext i32 %add438 to i64
  %arrayidx440 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom439
  store double %361, double* %arrayidx440, align 8
  %364 = load i32, i32* %tid, align 4
  %mul441 = mul nsw i32 %364, 8
  %add442 = add nsw i32 %mul441, 5
  %idxprom443 = sext i32 %add442 to i64
  %arrayidx444 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom443
  %365 = load double, double* %arrayidx444, align 8
  %366 = load i32, i32* %sx, align 4
  %mul445 = mul nsw i32 5, %366
  %367 = load i32, i32* %offset, align 4
  %add446 = add nsw i32 %mul445, %367
  %idxprom447 = sext i32 %add446 to i64
  %arrayidx448 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom447
  store double %365, double* %arrayidx448, align 8
  %368 = load i32, i32* %tid, align 4
  %mul449 = mul nsw i32 %368, 8
  %add450 = add nsw i32 %mul449, 2
  %idxprom451 = sext i32 %add450 to i64
  %arrayidx452 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom451
  %369 = load double, double* %arrayidx452, align 8
  %370 = load i32, i32* %sx, align 4
  %mul453 = mul nsw i32 2, %370
  %371 = load i32, i32* %offset, align 4
  %add454 = add nsw i32 %mul453, %371
  %idxprom455 = sext i32 %add454 to i64
  %arrayidx456 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom455
  store double %369, double* %arrayidx456, align 8
  %372 = load i32, i32* %tid, align 4
  %mul457 = mul nsw i32 %372, 8
  %add458 = add nsw i32 %mul457, 3
  %idxprom459 = sext i32 %add458 to i64
  %arrayidx460 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom459
  %373 = load double, double* %arrayidx460, align 8
  %374 = load i32, i32* %sx, align 4
  %mul461 = mul nsw i32 6, %374
  %375 = load i32, i32* %offset, align 4
  %add462 = add nsw i32 %mul461, %375
  %idxprom463 = sext i32 %add462 to i64
  %arrayidx464 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom463
  store double %373, double* %arrayidx464, align 8
  %376 = load i32, i32* %tid, align 4
  %mul465 = mul nsw i32 %376, 8
  %add466 = add nsw i32 %mul465, 6
  %idxprom467 = sext i32 %add466 to i64
  %arrayidx468 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom467
  %377 = load double, double* %arrayidx468, align 8
  %378 = load i32, i32* %sx, align 4
  %mul469 = mul nsw i32 3, %378
  %379 = load i32, i32* %offset, align 4
  %add470 = add nsw i32 %mul469, %379
  %idxprom471 = sext i32 %add470 to i64
  %arrayidx472 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom471
  store double %377, double* %arrayidx472, align 8
  %380 = load i32, i32* %tid, align 4
  %mul473 = mul nsw i32 %380, 8
  %add474 = add nsw i32 %mul473, 7
  %idxprom475 = sext i32 %add474 to i64
  %arrayidx476 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom475
  %381 = load double, double* %arrayidx476, align 8
  %382 = load i32, i32* %sx, align 4
  %mul477 = mul nsw i32 7, %382
  %383 = load i32, i32* %offset, align 4
  %add478 = add nsw i32 %mul477, %383
  %idxprom479 = sext i32 %add478 to i64
  %arrayidx480 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom479
  store double %381, double* %arrayidx480, align 8
  br label %for.inc481

for.inc481:                                       ; preds = %for.body414
  %384 = load i32, i32* %tid, align 4
  %inc482 = add nsw i32 %384, 1
  store i32 %inc482, i32* %tid, align 4
  br label %for.cond412, !llvm.loop !56

for.end483:                                       ; preds = %for.cond412
  store i32 8, i32* %sx, align 4
  br label %loop3

loop3:                                            ; preds = %for.end483
  store i32 0, i32* %tid, align 4
  br label %for.cond484

for.cond484:                                      ; preds = %for.inc555, %loop3
  %385 = load i32, i32* %tid, align 4
  %cmp485 = icmp slt i32 %385, 64
  br i1 %cmp485, label %for.body486, label %for.end557

for.body486:                                      ; preds = %for.cond484
  %386 = load i32, i32* %tid, align 4
  %shr487 = ashr i32 %386, 3
  store i32 %shr487, i32* %hi, align 4
  %387 = load i32, i32* %tid, align 4
  %and488 = and i32 %387, 7
  store i32 %and488, i32* %lo, align 4
  %388 = load i32, i32* %lo, align 4
  %mul489 = mul nsw i32 %388, 66
  %389 = load i32, i32* %hi, align 4
  %add490 = add nsw i32 %mul489, %389
  store i32 %add490, i32* %offset, align 4
  %390 = load i32, i32* %sx, align 4
  %mul491 = mul nsw i32 0, %390
  %391 = load i32, i32* %offset, align 4
  %add492 = add nsw i32 %mul491, %391
  %idxprom493 = sext i32 %add492 to i64
  %arrayidx494 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom493
  %392 = load double, double* %arrayidx494, align 8
  %393 = load i32, i32* %tid, align 4
  %mul495 = mul nsw i32 %393, 8
  %add496 = add nsw i32 %mul495, 0
  %idxprom497 = sext i32 %add496 to i64
  %arrayidx498 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom497
  store double %392, double* %arrayidx498, align 8
  %394 = load i32, i32* %sx, align 4
  %mul499 = mul nsw i32 4, %394
  %395 = load i32, i32* %offset, align 4
  %add500 = add nsw i32 %mul499, %395
  %idxprom501 = sext i32 %add500 to i64
  %arrayidx502 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom501
  %396 = load double, double* %arrayidx502, align 8
  %397 = load i32, i32* %tid, align 4
  %mul503 = mul nsw i32 %397, 8
  %add504 = add nsw i32 %mul503, 4
  %idxprom505 = sext i32 %add504 to i64
  %arrayidx506 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom505
  store double %396, double* %arrayidx506, align 8
  %398 = load i32, i32* %sx, align 4
  %mul507 = mul nsw i32 1, %398
  %399 = load i32, i32* %offset, align 4
  %add508 = add nsw i32 %mul507, %399
  %idxprom509 = sext i32 %add508 to i64
  %arrayidx510 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom509
  %400 = load double, double* %arrayidx510, align 8
  %401 = load i32, i32* %tid, align 4
  %mul511 = mul nsw i32 %401, 8
  %add512 = add nsw i32 %mul511, 1
  %idxprom513 = sext i32 %add512 to i64
  %arrayidx514 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom513
  store double %400, double* %arrayidx514, align 8
  %402 = load i32, i32* %sx, align 4
  %mul515 = mul nsw i32 5, %402
  %403 = load i32, i32* %offset, align 4
  %add516 = add nsw i32 %mul515, %403
  %idxprom517 = sext i32 %add516 to i64
  %arrayidx518 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom517
  %404 = load double, double* %arrayidx518, align 8
  %405 = load i32, i32* %tid, align 4
  %mul519 = mul nsw i32 %405, 8
  %add520 = add nsw i32 %mul519, 5
  %idxprom521 = sext i32 %add520 to i64
  %arrayidx522 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom521
  store double %404, double* %arrayidx522, align 8
  %406 = load i32, i32* %sx, align 4
  %mul523 = mul nsw i32 2, %406
  %407 = load i32, i32* %offset, align 4
  %add524 = add nsw i32 %mul523, %407
  %idxprom525 = sext i32 %add524 to i64
  %arrayidx526 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom525
  %408 = load double, double* %arrayidx526, align 8
  %409 = load i32, i32* %tid, align 4
  %mul527 = mul nsw i32 %409, 8
  %add528 = add nsw i32 %mul527, 2
  %idxprom529 = sext i32 %add528 to i64
  %arrayidx530 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom529
  store double %408, double* %arrayidx530, align 8
  %410 = load i32, i32* %sx, align 4
  %mul531 = mul nsw i32 6, %410
  %411 = load i32, i32* %offset, align 4
  %add532 = add nsw i32 %mul531, %411
  %idxprom533 = sext i32 %add532 to i64
  %arrayidx534 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom533
  %412 = load double, double* %arrayidx534, align 8
  %413 = load i32, i32* %tid, align 4
  %mul535 = mul nsw i32 %413, 8
  %add536 = add nsw i32 %mul535, 6
  %idxprom537 = sext i32 %add536 to i64
  %arrayidx538 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom537
  store double %412, double* %arrayidx538, align 8
  %414 = load i32, i32* %sx, align 4
  %mul539 = mul nsw i32 3, %414
  %415 = load i32, i32* %offset, align 4
  %add540 = add nsw i32 %mul539, %415
  %idxprom541 = sext i32 %add540 to i64
  %arrayidx542 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom541
  %416 = load double, double* %arrayidx542, align 8
  %417 = load i32, i32* %tid, align 4
  %mul543 = mul nsw i32 %417, 8
  %add544 = add nsw i32 %mul543, 3
  %idxprom545 = sext i32 %add544 to i64
  %arrayidx546 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom545
  store double %416, double* %arrayidx546, align 8
  %418 = load i32, i32* %sx, align 4
  %mul547 = mul nsw i32 7, %418
  %419 = load i32, i32* %offset, align 4
  %add548 = add nsw i32 %mul547, %419
  %idxprom549 = sext i32 %add548 to i64
  %arrayidx550 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom549
  %420 = load double, double* %arrayidx550, align 8
  %421 = load i32, i32* %tid, align 4
  %mul551 = mul nsw i32 %421, 8
  %add552 = add nsw i32 %mul551, 7
  %idxprom553 = sext i32 %add552 to i64
  %arrayidx554 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom553
  store double %420, double* %arrayidx554, align 8
  br label %for.inc555

for.inc555:                                       ; preds = %for.body486
  %422 = load i32, i32* %tid, align 4
  %inc556 = add nsw i32 %422, 1
  store i32 %inc556, i32* %tid, align 4
  br label %for.cond484, !llvm.loop !58

for.end557:                                       ; preds = %for.cond484
  store i32 66, i32* %sx, align 4
  br label %loop4

loop4:                                            ; preds = %for.end557
  store i32 0, i32* %tid, align 4
  br label %for.cond558

for.cond558:                                      ; preds = %for.inc629, %loop4
  %423 = load i32, i32* %tid, align 4
  %cmp559 = icmp slt i32 %423, 64
  br i1 %cmp559, label %for.body560, label %for.end631

for.body560:                                      ; preds = %for.cond558
  %424 = load i32, i32* %tid, align 4
  %shr561 = ashr i32 %424, 3
  store i32 %shr561, i32* %hi, align 4
  %425 = load i32, i32* %tid, align 4
  %and562 = and i32 %425, 7
  store i32 %and562, i32* %lo, align 4
  %426 = load i32, i32* %hi, align 4
  %mul563 = mul nsw i32 %426, 8
  %427 = load i32, i32* %lo, align 4
  %add564 = add nsw i32 %mul563, %427
  store i32 %add564, i32* %offset, align 4
  %428 = load i32, i32* %tid, align 4
  %mul565 = mul nsw i32 %428, 8
  %add566 = add nsw i32 %mul565, 0
  %idxprom567 = sext i32 %add566 to i64
  %arrayidx568 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom567
  %429 = load double, double* %arrayidx568, align 8
  %430 = load i32, i32* %sx, align 4
  %mul569 = mul nsw i32 0, %430
  %431 = load i32, i32* %offset, align 4
  %add570 = add nsw i32 %mul569, %431
  %idxprom571 = sext i32 %add570 to i64
  %arrayidx572 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom571
  store double %429, double* %arrayidx572, align 8
  %432 = load i32, i32* %tid, align 4
  %mul573 = mul nsw i32 %432, 8
  %add574 = add nsw i32 %mul573, 1
  %idxprom575 = sext i32 %add574 to i64
  %arrayidx576 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom575
  %433 = load double, double* %arrayidx576, align 8
  %434 = load i32, i32* %sx, align 4
  %mul577 = mul nsw i32 4, %434
  %435 = load i32, i32* %offset, align 4
  %add578 = add nsw i32 %mul577, %435
  %idxprom579 = sext i32 %add578 to i64
  %arrayidx580 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom579
  store double %433, double* %arrayidx580, align 8
  %436 = load i32, i32* %tid, align 4
  %mul581 = mul nsw i32 %436, 8
  %add582 = add nsw i32 %mul581, 4
  %idxprom583 = sext i32 %add582 to i64
  %arrayidx584 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom583
  %437 = load double, double* %arrayidx584, align 8
  %438 = load i32, i32* %sx, align 4
  %mul585 = mul nsw i32 1, %438
  %439 = load i32, i32* %offset, align 4
  %add586 = add nsw i32 %mul585, %439
  %idxprom587 = sext i32 %add586 to i64
  %arrayidx588 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom587
  store double %437, double* %arrayidx588, align 8
  %440 = load i32, i32* %tid, align 4
  %mul589 = mul nsw i32 %440, 8
  %add590 = add nsw i32 %mul589, 5
  %idxprom591 = sext i32 %add590 to i64
  %arrayidx592 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom591
  %441 = load double, double* %arrayidx592, align 8
  %442 = load i32, i32* %sx, align 4
  %mul593 = mul nsw i32 5, %442
  %443 = load i32, i32* %offset, align 4
  %add594 = add nsw i32 %mul593, %443
  %idxprom595 = sext i32 %add594 to i64
  %arrayidx596 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom595
  store double %441, double* %arrayidx596, align 8
  %444 = load i32, i32* %tid, align 4
  %mul597 = mul nsw i32 %444, 8
  %add598 = add nsw i32 %mul597, 2
  %idxprom599 = sext i32 %add598 to i64
  %arrayidx600 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom599
  %445 = load double, double* %arrayidx600, align 8
  %446 = load i32, i32* %sx, align 4
  %mul601 = mul nsw i32 2, %446
  %447 = load i32, i32* %offset, align 4
  %add602 = add nsw i32 %mul601, %447
  %idxprom603 = sext i32 %add602 to i64
  %arrayidx604 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom603
  store double %445, double* %arrayidx604, align 8
  %448 = load i32, i32* %tid, align 4
  %mul605 = mul nsw i32 %448, 8
  %add606 = add nsw i32 %mul605, 3
  %idxprom607 = sext i32 %add606 to i64
  %arrayidx608 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom607
  %449 = load double, double* %arrayidx608, align 8
  %450 = load i32, i32* %sx, align 4
  %mul609 = mul nsw i32 6, %450
  %451 = load i32, i32* %offset, align 4
  %add610 = add nsw i32 %mul609, %451
  %idxprom611 = sext i32 %add610 to i64
  %arrayidx612 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom611
  store double %449, double* %arrayidx612, align 8
  %452 = load i32, i32* %tid, align 4
  %mul613 = mul nsw i32 %452, 8
  %add614 = add nsw i32 %mul613, 6
  %idxprom615 = sext i32 %add614 to i64
  %arrayidx616 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom615
  %453 = load double, double* %arrayidx616, align 8
  %454 = load i32, i32* %sx, align 4
  %mul617 = mul nsw i32 3, %454
  %455 = load i32, i32* %offset, align 4
  %add618 = add nsw i32 %mul617, %455
  %idxprom619 = sext i32 %add618 to i64
  %arrayidx620 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom619
  store double %453, double* %arrayidx620, align 8
  %456 = load i32, i32* %tid, align 4
  %mul621 = mul nsw i32 %456, 8
  %add622 = add nsw i32 %mul621, 7
  %idxprom623 = sext i32 %add622 to i64
  %arrayidx624 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom623
  %457 = load double, double* %arrayidx624, align 8
  %458 = load i32, i32* %sx, align 4
  %mul625 = mul nsw i32 7, %458
  %459 = load i32, i32* %offset, align 4
  %add626 = add nsw i32 %mul625, %459
  %idxprom627 = sext i32 %add626 to i64
  %arrayidx628 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom627
  store double %457, double* %arrayidx628, align 8
  br label %for.inc629

for.inc629:                                       ; preds = %for.body560
  %460 = load i32, i32* %tid, align 4
  %inc630 = add nsw i32 %460, 1
  store i32 %inc630, i32* %tid, align 4
  br label %for.cond558, !llvm.loop !60

for.end631:                                       ; preds = %for.cond558
  br label %loop5

loop5:                                            ; preds = %for.end631
  store i32 0, i32* %tid, align 4
  br label %for.cond632

for.cond632:                                      ; preds = %for.inc720, %loop5
  %461 = load i32, i32* %tid, align 4
  %cmp633 = icmp slt i32 %461, 64
  br i1 %cmp633, label %for.body634, label %for.end722

for.body634:                                      ; preds = %for.cond632
  %462 = load i32, i32* %tid, align 4
  %mul635 = mul nsw i32 %462, 8
  %add636 = add nsw i32 %mul635, 0
  %idxprom637 = sext i32 %add636 to i64
  %arrayidx638 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom637
  %463 = load double, double* %arrayidx638, align 8
  %arrayidx639 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  store double %463, double* %arrayidx639, align 8
  %464 = load i32, i32* %tid, align 4
  %mul640 = mul nsw i32 %464, 8
  %add641 = add nsw i32 %mul640, 1
  %idxprom642 = sext i32 %add641 to i64
  %arrayidx643 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom642
  %465 = load double, double* %arrayidx643, align 8
  %arrayidx644 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  store double %465, double* %arrayidx644, align 8
  %466 = load i32, i32* %tid, align 4
  %mul645 = mul nsw i32 %466, 8
  %add646 = add nsw i32 %mul645, 2
  %idxprom647 = sext i32 %add646 to i64
  %arrayidx648 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom647
  %467 = load double, double* %arrayidx648, align 8
  %arrayidx649 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  store double %467, double* %arrayidx649, align 8
  %468 = load i32, i32* %tid, align 4
  %mul650 = mul nsw i32 %468, 8
  %add651 = add nsw i32 %mul650, 3
  %idxprom652 = sext i32 %add651 to i64
  %arrayidx653 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom652
  %469 = load double, double* %arrayidx653, align 8
  %arrayidx654 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %469, double* %arrayidx654, align 8
  %470 = load i32, i32* %tid, align 4
  %mul655 = mul nsw i32 %470, 8
  %add656 = add nsw i32 %mul655, 4
  %idxprom657 = sext i32 %add656 to i64
  %arrayidx658 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom657
  %471 = load double, double* %arrayidx658, align 8
  %arrayidx659 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  store double %471, double* %arrayidx659, align 8
  %472 = load i32, i32* %tid, align 4
  %mul660 = mul nsw i32 %472, 8
  %add661 = add nsw i32 %mul660, 5
  %idxprom662 = sext i32 %add661 to i64
  %arrayidx663 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom662
  %473 = load double, double* %arrayidx663, align 8
  %arrayidx664 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %473, double* %arrayidx664, align 8
  %474 = load i32, i32* %tid, align 4
  %mul665 = mul nsw i32 %474, 8
  %add666 = add nsw i32 %mul665, 6
  %idxprom667 = sext i32 %add666 to i64
  %arrayidx668 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom667
  %475 = load double, double* %arrayidx668, align 8
  %arrayidx669 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %475, double* %arrayidx669, align 8
  %476 = load i32, i32* %tid, align 4
  %mul670 = mul nsw i32 %476, 8
  %add671 = add nsw i32 %mul670, 7
  %idxprom672 = sext i32 %add671 to i64
  %arrayidx673 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom672
  %477 = load double, double* %arrayidx673, align 8
  %arrayidx674 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %477, double* %arrayidx674, align 8
  %478 = load i32, i32* %tid, align 4
  %shr675 = ashr i32 %478, 3
  store i32 %shr675, i32* %hi, align 4
  %479 = load i32, i32* %tid, align 4
  %and676 = and i32 %479, 7
  store i32 %and676, i32* %lo, align 4
  %arraydecay677 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i32 0, i32 0
  %arraydecay678 = getelementptr inbounds [576 x double], [576 x double]* %smem, i32 0, i32 0
  %480 = load i32, i32* %lo, align 4
  %mul679 = mul nsw i32 %480, 66
  %481 = load i32, i32* %hi, align 4
  %add680 = add nsw i32 %mul679, %481
  call void @loady8(double* %arraydecay677, double* %arraydecay678, i32 %add680, i32 8)
  %arrayidx681 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  %482 = load double, double* %arrayidx681, align 8
  %483 = load i32, i32* %tid, align 4
  %mul682 = mul nsw i32 %483, 8
  %idxprom683 = sext i32 %mul682 to i64
  %arrayidx684 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom683
  store double %482, double* %arrayidx684, align 8
  %arrayidx685 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %484 = load double, double* %arrayidx685, align 8
  %485 = load i32, i32* %tid, align 4
  %mul686 = mul nsw i32 %485, 8
  %add687 = add nsw i32 %mul686, 1
  %idxprom688 = sext i32 %add687 to i64
  %arrayidx689 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom688
  store double %484, double* %arrayidx689, align 8
  %arrayidx690 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %486 = load double, double* %arrayidx690, align 8
  %487 = load i32, i32* %tid, align 4
  %mul691 = mul nsw i32 %487, 8
  %add692 = add nsw i32 %mul691, 2
  %idxprom693 = sext i32 %add692 to i64
  %arrayidx694 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom693
  store double %486, double* %arrayidx694, align 8
  %arrayidx695 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %488 = load double, double* %arrayidx695, align 8
  %489 = load i32, i32* %tid, align 4
  %mul696 = mul nsw i32 %489, 8
  %add697 = add nsw i32 %mul696, 3
  %idxprom698 = sext i32 %add697 to i64
  %arrayidx699 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom698
  store double %488, double* %arrayidx699, align 8
  %arrayidx700 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %490 = load double, double* %arrayidx700, align 8
  %491 = load i32, i32* %tid, align 4
  %mul701 = mul nsw i32 %491, 8
  %add702 = add nsw i32 %mul701, 4
  %idxprom703 = sext i32 %add702 to i64
  %arrayidx704 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom703
  store double %490, double* %arrayidx704, align 8
  %arrayidx705 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %492 = load double, double* %arrayidx705, align 8
  %493 = load i32, i32* %tid, align 4
  %mul706 = mul nsw i32 %493, 8
  %add707 = add nsw i32 %mul706, 5
  %idxprom708 = sext i32 %add707 to i64
  %arrayidx709 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom708
  store double %492, double* %arrayidx709, align 8
  %arrayidx710 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %494 = load double, double* %arrayidx710, align 8
  %495 = load i32, i32* %tid, align 4
  %mul711 = mul nsw i32 %495, 8
  %add712 = add nsw i32 %mul711, 6
  %idxprom713 = sext i32 %add712 to i64
  %arrayidx714 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom713
  store double %494, double* %arrayidx714, align 8
  %arrayidx715 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %496 = load double, double* %arrayidx715, align 8
  %497 = load i32, i32* %tid, align 4
  %mul716 = mul nsw i32 %497, 8
  %add717 = add nsw i32 %mul716, 7
  %idxprom718 = sext i32 %add717 to i64
  %arrayidx719 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom718
  store double %496, double* %arrayidx719, align 8
  br label %for.inc720

for.inc720:                                       ; preds = %for.body634
  %498 = load i32, i32* %tid, align 4
  %inc721 = add nsw i32 %498, 1
  store i32 %inc721, i32* %tid, align 4
  br label %for.cond632, !llvm.loop !62

for.end722:                                       ; preds = %for.cond632
  br label %loop6

loop6:                                            ; preds = %for.end722
  store i32 0, i32* %tid, align 4
  br label %for.cond723

for.cond723:                                      ; preds = %for.inc1156, %loop6
  %499 = load i32, i32* %tid, align 4
  %cmp724 = icmp slt i32 %499, 64
  br i1 %cmp724, label %for.body725, label %for.end1158

for.body725:                                      ; preds = %for.cond723
  %500 = load i32, i32* %tid, align 4
  %mul726 = mul nsw i32 %500, 8
  %add727 = add nsw i32 %mul726, 0
  %idxprom728 = sext i32 %add727 to i64
  %arrayidx729 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom728
  %501 = load double, double* %arrayidx729, align 8
  %arrayidx730 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  store double %501, double* %arrayidx730, align 8
  %502 = load i32, i32* %tid, align 4
  %mul731 = mul nsw i32 %502, 8
  %add732 = add nsw i32 %mul731, 1
  %idxprom733 = sext i32 %add732 to i64
  %arrayidx734 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom733
  %503 = load double, double* %arrayidx734, align 8
  %arrayidx735 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  store double %503, double* %arrayidx735, align 8
  %504 = load i32, i32* %tid, align 4
  %mul736 = mul nsw i32 %504, 8
  %add737 = add nsw i32 %mul736, 2
  %idxprom738 = sext i32 %add737 to i64
  %arrayidx739 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom738
  %505 = load double, double* %arrayidx739, align 8
  %arrayidx740 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  store double %505, double* %arrayidx740, align 8
  %506 = load i32, i32* %tid, align 4
  %mul741 = mul nsw i32 %506, 8
  %add742 = add nsw i32 %mul741, 3
  %idxprom743 = sext i32 %add742 to i64
  %arrayidx744 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom743
  %507 = load double, double* %arrayidx744, align 8
  %arrayidx745 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  store double %507, double* %arrayidx745, align 8
  %508 = load i32, i32* %tid, align 4
  %mul746 = mul nsw i32 %508, 8
  %add747 = add nsw i32 %mul746, 4
  %idxprom748 = sext i32 %add747 to i64
  %arrayidx749 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom748
  %509 = load double, double* %arrayidx749, align 8
  %arrayidx750 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  store double %509, double* %arrayidx750, align 8
  %510 = load i32, i32* %tid, align 4
  %mul751 = mul nsw i32 %510, 8
  %add752 = add nsw i32 %mul751, 5
  %idxprom753 = sext i32 %add752 to i64
  %arrayidx754 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom753
  %511 = load double, double* %arrayidx754, align 8
  %arrayidx755 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  store double %511, double* %arrayidx755, align 8
  %512 = load i32, i32* %tid, align 4
  %mul756 = mul nsw i32 %512, 8
  %add757 = add nsw i32 %mul756, 6
  %idxprom758 = sext i32 %add757 to i64
  %arrayidx759 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom758
  %513 = load double, double* %arrayidx759, align 8
  %arrayidx760 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  store double %513, double* %arrayidx760, align 8
  %514 = load i32, i32* %tid, align 4
  %mul761 = mul nsw i32 %514, 8
  %add762 = add nsw i32 %mul761, 7
  %idxprom763 = sext i32 %add762 to i64
  %arrayidx764 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom763
  %515 = load double, double* %arrayidx764, align 8
  %arrayidx765 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %515, double* %arrayidx765, align 8
  %516 = load i32, i32* %tid, align 4
  %mul766 = mul nsw i32 %516, 8
  %add767 = add nsw i32 %mul766, 0
  %idxprom768 = sext i32 %add767 to i64
  %arrayidx769 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom768
  %517 = load double, double* %arrayidx769, align 8
  %arrayidx770 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  store double %517, double* %arrayidx770, align 8
  %518 = load i32, i32* %tid, align 4
  %mul771 = mul nsw i32 %518, 8
  %add772 = add nsw i32 %mul771, 1
  %idxprom773 = sext i32 %add772 to i64
  %arrayidx774 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom773
  %519 = load double, double* %arrayidx774, align 8
  %arrayidx775 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  store double %519, double* %arrayidx775, align 8
  %520 = load i32, i32* %tid, align 4
  %mul776 = mul nsw i32 %520, 8
  %add777 = add nsw i32 %mul776, 2
  %idxprom778 = sext i32 %add777 to i64
  %arrayidx779 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom778
  %521 = load double, double* %arrayidx779, align 8
  %arrayidx780 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  store double %521, double* %arrayidx780, align 8
  %522 = load i32, i32* %tid, align 4
  %mul781 = mul nsw i32 %522, 8
  %add782 = add nsw i32 %mul781, 3
  %idxprom783 = sext i32 %add782 to i64
  %arrayidx784 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom783
  %523 = load double, double* %arrayidx784, align 8
  %arrayidx785 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %523, double* %arrayidx785, align 8
  %524 = load i32, i32* %tid, align 4
  %mul786 = mul nsw i32 %524, 8
  %add787 = add nsw i32 %mul786, 4
  %idxprom788 = sext i32 %add787 to i64
  %arrayidx789 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom788
  %525 = load double, double* %arrayidx789, align 8
  %arrayidx790 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  store double %525, double* %arrayidx790, align 8
  %526 = load i32, i32* %tid, align 4
  %mul791 = mul nsw i32 %526, 8
  %add792 = add nsw i32 %mul791, 5
  %idxprom793 = sext i32 %add792 to i64
  %arrayidx794 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom793
  %527 = load double, double* %arrayidx794, align 8
  %arrayidx795 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %527, double* %arrayidx795, align 8
  %528 = load i32, i32* %tid, align 4
  %mul796 = mul nsw i32 %528, 8
  %add797 = add nsw i32 %mul796, 6
  %idxprom798 = sext i32 %add797 to i64
  %arrayidx799 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom798
  %529 = load double, double* %arrayidx799, align 8
  %arrayidx800 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %529, double* %arrayidx800, align 8
  %530 = load i32, i32* %tid, align 4
  %mul801 = mul nsw i32 %530, 8
  %add802 = add nsw i32 %mul801, 7
  %idxprom803 = sext i32 %add802 to i64
  %arrayidx804 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom803
  %531 = load double, double* %arrayidx804, align 8
  %arrayidx805 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %531, double* %arrayidx805, align 8
  %532 = bitcast double* %exp_1_8_x806 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %532) #6
  %533 = bitcast double* %exp_1_4_x807 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %533) #6
  %534 = bitcast double* %exp_3_8_x808 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %534) #6
  %535 = bitcast double* %exp_1_8_y809 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %535) #6
  %536 = bitcast double* %exp_1_4_y810 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %536) #6
  %537 = bitcast double* %exp_3_8_y811 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %537) #6
  %538 = bitcast double* %tmp_1812 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %538) #6
  store double 1.000000e+00, double* %exp_1_8_x806, align 8
  store double -1.000000e+00, double* %exp_1_8_y809, align 8
  store double 0.000000e+00, double* %exp_1_4_x807, align 8
  store double -1.000000e+00, double* %exp_1_4_y810, align 8
  store double -1.000000e+00, double* %exp_3_8_x808, align 8
  store double -1.000000e+00, double* %exp_3_8_y811, align 8
  %539 = bitcast double* %c0_x813 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %539) #6
  %arrayidx814 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  %540 = load double, double* %arrayidx814, align 8
  store double %540, double* %c0_x813, align 8
  %541 = bitcast double* %c0_y815 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %541) #6
  %arrayidx816 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  %542 = load double, double* %arrayidx816, align 8
  store double %542, double* %c0_y815, align 8
  %543 = load double, double* %c0_x813, align 8
  %arrayidx817 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  %544 = load double, double* %arrayidx817, align 8
  %add818 = fadd double %543, %544
  %arrayidx819 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  store double %add818, double* %arrayidx819, align 8
  %545 = load double, double* %c0_y815, align 8
  %arrayidx820 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %546 = load double, double* %arrayidx820, align 8
  %add821 = fadd double %545, %546
  %arrayidx822 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  store double %add821, double* %arrayidx822, align 8
  %547 = load double, double* %c0_x813, align 8
  %arrayidx823 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  %548 = load double, double* %arrayidx823, align 8
  %sub824 = fsub double %547, %548
  %arrayidx825 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  store double %sub824, double* %arrayidx825, align 8
  %549 = load double, double* %c0_y815, align 8
  %arrayidx826 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %550 = load double, double* %arrayidx826, align 8
  %sub827 = fsub double %549, %550
  %arrayidx828 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  store double %sub827, double* %arrayidx828, align 8
  %551 = bitcast double* %c0_y815 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %551) #6
  %552 = bitcast double* %c0_x813 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %552) #6
  %553 = bitcast double* %c0_x829 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %553) #6
  %arrayidx830 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  %554 = load double, double* %arrayidx830, align 8
  store double %554, double* %c0_x829, align 8
  %555 = bitcast double* %c0_y831 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %555) #6
  %arrayidx832 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %556 = load double, double* %arrayidx832, align 8
  store double %556, double* %c0_y831, align 8
  %557 = load double, double* %c0_x829, align 8
  %arrayidx833 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %558 = load double, double* %arrayidx833, align 8
  %add834 = fadd double %557, %558
  %arrayidx835 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  store double %add834, double* %arrayidx835, align 8
  %559 = load double, double* %c0_y831, align 8
  %arrayidx836 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %560 = load double, double* %arrayidx836, align 8
  %add837 = fadd double %559, %560
  %arrayidx838 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  store double %add837, double* %arrayidx838, align 8
  %561 = load double, double* %c0_x829, align 8
  %arrayidx839 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %562 = load double, double* %arrayidx839, align 8
  %sub840 = fsub double %561, %562
  %arrayidx841 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  store double %sub840, double* %arrayidx841, align 8
  %563 = load double, double* %c0_y831, align 8
  %arrayidx842 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %564 = load double, double* %arrayidx842, align 8
  %sub843 = fsub double %563, %564
  %arrayidx844 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %sub843, double* %arrayidx844, align 8
  %565 = bitcast double* %c0_y831 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %565) #6
  %566 = bitcast double* %c0_x829 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %566) #6
  %567 = bitcast double* %c0_x845 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %567) #6
  %arrayidx846 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  %568 = load double, double* %arrayidx846, align 8
  store double %568, double* %c0_x845, align 8
  %569 = bitcast double* %c0_y847 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %569) #6
  %arrayidx848 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %570 = load double, double* %arrayidx848, align 8
  store double %570, double* %c0_y847, align 8
  %571 = load double, double* %c0_x845, align 8
  %arrayidx849 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %572 = load double, double* %arrayidx849, align 8
  %add850 = fadd double %571, %572
  %arrayidx851 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  store double %add850, double* %arrayidx851, align 8
  %573 = load double, double* %c0_y847, align 8
  %arrayidx852 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %574 = load double, double* %arrayidx852, align 8
  %add853 = fadd double %573, %574
  %arrayidx854 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  store double %add853, double* %arrayidx854, align 8
  %575 = load double, double* %c0_x845, align 8
  %arrayidx855 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %576 = load double, double* %arrayidx855, align 8
  %sub856 = fsub double %575, %576
  %arrayidx857 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  store double %sub856, double* %arrayidx857, align 8
  %577 = load double, double* %c0_y847, align 8
  %arrayidx858 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %578 = load double, double* %arrayidx858, align 8
  %sub859 = fsub double %577, %578
  %arrayidx860 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %sub859, double* %arrayidx860, align 8
  %579 = bitcast double* %c0_y847 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %579) #6
  %580 = bitcast double* %c0_x845 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %580) #6
  %581 = bitcast double* %c0_x861 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %581) #6
  %arrayidx862 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %582 = load double, double* %arrayidx862, align 8
  store double %582, double* %c0_x861, align 8
  %583 = bitcast double* %c0_y863 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %583) #6
  %arrayidx864 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %584 = load double, double* %arrayidx864, align 8
  store double %584, double* %c0_y863, align 8
  %585 = load double, double* %c0_x861, align 8
  %arrayidx865 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %586 = load double, double* %arrayidx865, align 8
  %add866 = fadd double %585, %586
  %arrayidx867 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  store double %add866, double* %arrayidx867, align 8
  %587 = load double, double* %c0_y863, align 8
  %arrayidx868 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %588 = load double, double* %arrayidx868, align 8
  %add869 = fadd double %587, %588
  %arrayidx870 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %add869, double* %arrayidx870, align 8
  %589 = load double, double* %c0_x861, align 8
  %arrayidx871 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %590 = load double, double* %arrayidx871, align 8
  %sub872 = fsub double %589, %590
  %arrayidx873 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %sub872, double* %arrayidx873, align 8
  %591 = load double, double* %c0_y863, align 8
  %arrayidx874 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %592 = load double, double* %arrayidx874, align 8
  %sub875 = fsub double %591, %592
  %arrayidx876 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %sub875, double* %arrayidx876, align 8
  %593 = bitcast double* %c0_y863 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %593) #6
  %594 = bitcast double* %c0_x861 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %594) #6
  %arrayidx877 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %595 = load double, double* %arrayidx877, align 8
  store double %595, double* %tmp_1812, align 8
  %arrayidx878 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %596 = load double, double* %arrayidx878, align 8
  %597 = load double, double* %exp_1_8_x806, align 8
  %mul879 = fmul double %596, %597
  %arrayidx880 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %598 = load double, double* %arrayidx880, align 8
  %599 = load double, double* %exp_1_8_y809, align 8
  %mul881 = fmul double %598, %599
  %sub882 = fsub double %mul879, %mul881
  %mul883 = fmul double 0x3FE6A09E60000000, %sub882
  %arrayidx884 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  store double %mul883, double* %arrayidx884, align 8
  %600 = load double, double* %tmp_1812, align 8
  %601 = load double, double* %exp_1_8_y809, align 8
  %mul885 = fmul double %600, %601
  %arrayidx886 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %602 = load double, double* %arrayidx886, align 8
  %603 = load double, double* %exp_1_8_x806, align 8
  %mul887 = fmul double %602, %603
  %add888 = fadd double %mul885, %mul887
  %mul889 = fmul double 0x3FE6A09E60000000, %add888
  %arrayidx890 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %mul889, double* %arrayidx890, align 8
  %arrayidx891 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %604 = load double, double* %arrayidx891, align 8
  store double %604, double* %tmp_1812, align 8
  %arrayidx892 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %605 = load double, double* %arrayidx892, align 8
  %606 = load double, double* %exp_1_4_x807, align 8
  %mul893 = fmul double %605, %606
  %arrayidx894 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %607 = load double, double* %arrayidx894, align 8
  %608 = load double, double* %exp_1_4_y810, align 8
  %mul895 = fmul double %607, %608
  %sub896 = fsub double %mul893, %mul895
  %arrayidx897 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  store double %sub896, double* %arrayidx897, align 8
  %609 = load double, double* %tmp_1812, align 8
  %610 = load double, double* %exp_1_4_y810, align 8
  %mul898 = fmul double %609, %610
  %arrayidx899 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %611 = load double, double* %arrayidx899, align 8
  %612 = load double, double* %exp_1_4_x807, align 8
  %mul900 = fmul double %611, %612
  %add901 = fadd double %mul898, %mul900
  %arrayidx902 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %add901, double* %arrayidx902, align 8
  %arrayidx903 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %613 = load double, double* %arrayidx903, align 8
  store double %613, double* %tmp_1812, align 8
  %arrayidx904 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %614 = load double, double* %arrayidx904, align 8
  %615 = load double, double* %exp_3_8_x808, align 8
  %mul905 = fmul double %614, %615
  %arrayidx906 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %616 = load double, double* %arrayidx906, align 8
  %617 = load double, double* %exp_3_8_y811, align 8
  %mul907 = fmul double %616, %617
  %sub908 = fsub double %mul905, %mul907
  %mul909 = fmul double 0x3FE6A09E60000000, %sub908
  %arrayidx910 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %mul909, double* %arrayidx910, align 8
  %618 = load double, double* %tmp_1812, align 8
  %619 = load double, double* %exp_3_8_y811, align 8
  %mul911 = fmul double %618, %619
  %arrayidx912 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %620 = load double, double* %arrayidx912, align 8
  %621 = load double, double* %exp_3_8_x808, align 8
  %mul913 = fmul double %620, %621
  %add914 = fadd double %mul911, %mul913
  %mul915 = fmul double 0x3FE6A09E60000000, %add914
  %arrayidx916 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %mul915, double* %arrayidx916, align 8
  %622 = bitcast double* %exp_1_44_x917 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %622) #6
  %623 = bitcast double* %exp_1_44_y918 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %623) #6
  %624 = bitcast double* %tmp919 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %624) #6
  store double 0.000000e+00, double* %exp_1_44_x917, align 8
  store double -1.000000e+00, double* %exp_1_44_y918, align 8
  %625 = bitcast double* %c0_x920 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %625) #6
  %arrayidx921 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  %626 = load double, double* %arrayidx921, align 8
  store double %626, double* %c0_x920, align 8
  %627 = bitcast double* %c0_y922 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %627) #6
  %arrayidx923 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  %628 = load double, double* %arrayidx923, align 8
  store double %628, double* %c0_y922, align 8
  %629 = load double, double* %c0_x920, align 8
  %arrayidx924 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  %630 = load double, double* %arrayidx924, align 8
  %add925 = fadd double %629, %630
  %arrayidx926 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  store double %add925, double* %arrayidx926, align 8
  %631 = load double, double* %c0_y922, align 8
  %arrayidx927 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %632 = load double, double* %arrayidx927, align 8
  %add928 = fadd double %631, %632
  %arrayidx929 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  store double %add928, double* %arrayidx929, align 8
  %633 = load double, double* %c0_x920, align 8
  %arrayidx930 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  %634 = load double, double* %arrayidx930, align 8
  %sub931 = fsub double %633, %634
  %arrayidx932 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  store double %sub931, double* %arrayidx932, align 8
  %635 = load double, double* %c0_y922, align 8
  %arrayidx933 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %636 = load double, double* %arrayidx933, align 8
  %sub934 = fsub double %635, %636
  %arrayidx935 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  store double %sub934, double* %arrayidx935, align 8
  %637 = bitcast double* %c0_y922 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %637) #6
  %638 = bitcast double* %c0_x920 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %638) #6
  %639 = bitcast double* %c0_x936 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %639) #6
  %arrayidx937 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  %640 = load double, double* %arrayidx937, align 8
  store double %640, double* %c0_x936, align 8
  %641 = bitcast double* %c0_y938 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %641) #6
  %arrayidx939 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %642 = load double, double* %arrayidx939, align 8
  store double %642, double* %c0_y938, align 8
  %643 = load double, double* %c0_x936, align 8
  %arrayidx940 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %644 = load double, double* %arrayidx940, align 8
  %add941 = fadd double %643, %644
  %arrayidx942 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  store double %add941, double* %arrayidx942, align 8
  %645 = load double, double* %c0_y938, align 8
  %arrayidx943 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %646 = load double, double* %arrayidx943, align 8
  %add944 = fadd double %645, %646
  %arrayidx945 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  store double %add944, double* %arrayidx945, align 8
  %647 = load double, double* %c0_x936, align 8
  %arrayidx946 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %648 = load double, double* %arrayidx946, align 8
  %sub947 = fsub double %647, %648
  %arrayidx948 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  store double %sub947, double* %arrayidx948, align 8
  %649 = load double, double* %c0_y938, align 8
  %arrayidx949 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %650 = load double, double* %arrayidx949, align 8
  %sub950 = fsub double %649, %650
  %arrayidx951 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %sub950, double* %arrayidx951, align 8
  %651 = bitcast double* %c0_y938 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %651) #6
  %652 = bitcast double* %c0_x936 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %652) #6
  %arrayidx952 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %653 = load double, double* %arrayidx952, align 8
  store double %653, double* %tmp919, align 8
  %arrayidx953 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %654 = load double, double* %arrayidx953, align 8
  %655 = load double, double* %exp_1_44_x917, align 8
  %mul954 = fmul double %654, %655
  %arrayidx955 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %656 = load double, double* %arrayidx955, align 8
  %657 = load double, double* %exp_1_44_y918, align 8
  %mul956 = fmul double %656, %657
  %sub957 = fsub double %mul954, %mul956
  %arrayidx958 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  store double %sub957, double* %arrayidx958, align 8
  %658 = load double, double* %tmp919, align 8
  %659 = load double, double* %exp_1_44_y918, align 8
  %mul959 = fmul double %658, %659
  %arrayidx960 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %660 = load double, double* %arrayidx960, align 8
  %661 = load double, double* %exp_1_44_x917, align 8
  %mul961 = fmul double %660, %661
  %sub962 = fsub double %mul959, %mul961
  %arrayidx963 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %sub962, double* %arrayidx963, align 8
  %662 = bitcast double* %c0_x964 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %662) #6
  %arrayidx965 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  %663 = load double, double* %arrayidx965, align 8
  store double %663, double* %c0_x964, align 8
  %664 = bitcast double* %c0_y966 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %664) #6
  %arrayidx967 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  %665 = load double, double* %arrayidx967, align 8
  store double %665, double* %c0_y966, align 8
  %666 = load double, double* %c0_x964, align 8
  %arrayidx968 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  %667 = load double, double* %arrayidx968, align 8
  %add969 = fadd double %666, %667
  %arrayidx970 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  store double %add969, double* %arrayidx970, align 8
  %668 = load double, double* %c0_y966, align 8
  %arrayidx971 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %669 = load double, double* %arrayidx971, align 8
  %add972 = fadd double %668, %669
  %arrayidx973 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  store double %add972, double* %arrayidx973, align 8
  %670 = load double, double* %c0_x964, align 8
  %arrayidx974 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  %671 = load double, double* %arrayidx974, align 8
  %sub975 = fsub double %670, %671
  %arrayidx976 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  store double %sub975, double* %arrayidx976, align 8
  %672 = load double, double* %c0_y966, align 8
  %arrayidx977 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %673 = load double, double* %arrayidx977, align 8
  %sub978 = fsub double %672, %673
  %arrayidx979 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  store double %sub978, double* %arrayidx979, align 8
  %674 = bitcast double* %c0_y966 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %674) #6
  %675 = bitcast double* %c0_x964 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %675) #6
  %676 = bitcast double* %c0_x980 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %676) #6
  %arrayidx981 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  %677 = load double, double* %arrayidx981, align 8
  store double %677, double* %c0_x980, align 8
  %678 = bitcast double* %c0_y982 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %678) #6
  %arrayidx983 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %679 = load double, double* %arrayidx983, align 8
  store double %679, double* %c0_y982, align 8
  %680 = load double, double* %c0_x980, align 8
  %arrayidx984 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %681 = load double, double* %arrayidx984, align 8
  %add985 = fadd double %680, %681
  %arrayidx986 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  store double %add985, double* %arrayidx986, align 8
  %682 = load double, double* %c0_y982, align 8
  %arrayidx987 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %683 = load double, double* %arrayidx987, align 8
  %add988 = fadd double %682, %683
  %arrayidx989 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  store double %add988, double* %arrayidx989, align 8
  %684 = load double, double* %c0_x980, align 8
  %arrayidx990 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %685 = load double, double* %arrayidx990, align 8
  %sub991 = fsub double %684, %685
  %arrayidx992 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  store double %sub991, double* %arrayidx992, align 8
  %686 = load double, double* %c0_y982, align 8
  %arrayidx993 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %687 = load double, double* %arrayidx993, align 8
  %sub994 = fsub double %686, %687
  %arrayidx995 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %sub994, double* %arrayidx995, align 8
  %688 = bitcast double* %c0_y982 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %688) #6
  %689 = bitcast double* %c0_x980 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %689) #6
  %690 = bitcast double* %tmp919 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %690) #6
  %691 = bitcast double* %exp_1_44_y918 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %691) #6
  %692 = bitcast double* %exp_1_44_x917 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %692) #6
  %693 = bitcast double* %exp_1_44_x996 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %693) #6
  %694 = bitcast double* %exp_1_44_y997 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %694) #6
  %695 = bitcast double* %tmp998 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %695) #6
  store double 0.000000e+00, double* %exp_1_44_x996, align 8
  store double -1.000000e+00, double* %exp_1_44_y997, align 8
  %696 = bitcast double* %c0_x999 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %696) #6
  %arrayidx1000 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  %697 = load double, double* %arrayidx1000, align 8
  store double %697, double* %c0_x999, align 8
  %698 = bitcast double* %c0_y1001 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %698) #6
  %arrayidx1002 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %699 = load double, double* %arrayidx1002, align 8
  store double %699, double* %c0_y1001, align 8
  %700 = load double, double* %c0_x999, align 8
  %arrayidx1003 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %701 = load double, double* %arrayidx1003, align 8
  %add1004 = fadd double %700, %701
  %arrayidx1005 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  store double %add1004, double* %arrayidx1005, align 8
  %702 = load double, double* %c0_y1001, align 8
  %arrayidx1006 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %703 = load double, double* %arrayidx1006, align 8
  %add1007 = fadd double %702, %703
  %arrayidx1008 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  store double %add1007, double* %arrayidx1008, align 8
  %704 = load double, double* %c0_x999, align 8
  %arrayidx1009 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %705 = load double, double* %arrayidx1009, align 8
  %sub1010 = fsub double %704, %705
  %arrayidx1011 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  store double %sub1010, double* %arrayidx1011, align 8
  %706 = load double, double* %c0_y1001, align 8
  %arrayidx1012 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %707 = load double, double* %arrayidx1012, align 8
  %sub1013 = fsub double %706, %707
  %arrayidx1014 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %sub1013, double* %arrayidx1014, align 8
  %708 = bitcast double* %c0_y1001 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %708) #6
  %709 = bitcast double* %c0_x999 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %709) #6
  %710 = bitcast double* %c0_x1015 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %710) #6
  %arrayidx1016 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %711 = load double, double* %arrayidx1016, align 8
  store double %711, double* %c0_x1015, align 8
  %712 = bitcast double* %c0_y1017 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %712) #6
  %arrayidx1018 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %713 = load double, double* %arrayidx1018, align 8
  store double %713, double* %c0_y1017, align 8
  %714 = load double, double* %c0_x1015, align 8
  %arrayidx1019 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %715 = load double, double* %arrayidx1019, align 8
  %add1020 = fadd double %714, %715
  %arrayidx1021 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  store double %add1020, double* %arrayidx1021, align 8
  %716 = load double, double* %c0_y1017, align 8
  %arrayidx1022 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %717 = load double, double* %arrayidx1022, align 8
  %add1023 = fadd double %716, %717
  %arrayidx1024 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %add1023, double* %arrayidx1024, align 8
  %718 = load double, double* %c0_x1015, align 8
  %arrayidx1025 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %719 = load double, double* %arrayidx1025, align 8
  %sub1026 = fsub double %718, %719
  %arrayidx1027 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %sub1026, double* %arrayidx1027, align 8
  %720 = load double, double* %c0_y1017, align 8
  %arrayidx1028 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %721 = load double, double* %arrayidx1028, align 8
  %sub1029 = fsub double %720, %721
  %arrayidx1030 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %sub1029, double* %arrayidx1030, align 8
  %722 = bitcast double* %c0_y1017 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %722) #6
  %723 = bitcast double* %c0_x1015 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %723) #6
  %arrayidx1031 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %724 = load double, double* %arrayidx1031, align 8
  store double %724, double* %tmp998, align 8
  %arrayidx1032 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %725 = load double, double* %arrayidx1032, align 8
  %726 = load double, double* %exp_1_44_x996, align 8
  %mul1033 = fmul double %725, %726
  %arrayidx1034 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %727 = load double, double* %arrayidx1034, align 8
  %728 = load double, double* %exp_1_44_y997, align 8
  %mul1035 = fmul double %727, %728
  %sub1036 = fsub double %mul1033, %mul1035
  %arrayidx1037 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %sub1036, double* %arrayidx1037, align 8
  %729 = load double, double* %tmp998, align 8
  %730 = load double, double* %exp_1_44_y997, align 8
  %mul1038 = fmul double %729, %730
  %arrayidx1039 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %731 = load double, double* %arrayidx1039, align 8
  %732 = load double, double* %exp_1_44_x996, align 8
  %mul1040 = fmul double %731, %732
  %sub1041 = fsub double %mul1038, %mul1040
  %arrayidx1042 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %sub1041, double* %arrayidx1042, align 8
  %733 = bitcast double* %c0_x1043 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %733) #6
  %arrayidx1044 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  %734 = load double, double* %arrayidx1044, align 8
  store double %734, double* %c0_x1043, align 8
  %735 = bitcast double* %c0_y1045 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %735) #6
  %arrayidx1046 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %736 = load double, double* %arrayidx1046, align 8
  store double %736, double* %c0_y1045, align 8
  %737 = load double, double* %c0_x1043, align 8
  %arrayidx1047 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %738 = load double, double* %arrayidx1047, align 8
  %add1048 = fadd double %737, %738
  %arrayidx1049 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  store double %add1048, double* %arrayidx1049, align 8
  %739 = load double, double* %c0_y1045, align 8
  %arrayidx1050 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %740 = load double, double* %arrayidx1050, align 8
  %add1051 = fadd double %739, %740
  %arrayidx1052 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  store double %add1051, double* %arrayidx1052, align 8
  %741 = load double, double* %c0_x1043, align 8
  %arrayidx1053 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %742 = load double, double* %arrayidx1053, align 8
  %sub1054 = fsub double %741, %742
  %arrayidx1055 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  store double %sub1054, double* %arrayidx1055, align 8
  %743 = load double, double* %c0_y1045, align 8
  %arrayidx1056 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %744 = load double, double* %arrayidx1056, align 8
  %sub1057 = fsub double %743, %744
  %arrayidx1058 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %sub1057, double* %arrayidx1058, align 8
  %745 = bitcast double* %c0_y1045 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %745) #6
  %746 = bitcast double* %c0_x1043 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %746) #6
  %747 = bitcast double* %c0_x1059 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %747) #6
  %arrayidx1060 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %748 = load double, double* %arrayidx1060, align 8
  store double %748, double* %c0_x1059, align 8
  %749 = bitcast double* %c0_y1061 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %749) #6
  %arrayidx1062 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %750 = load double, double* %arrayidx1062, align 8
  store double %750, double* %c0_y1061, align 8
  %751 = load double, double* %c0_x1059, align 8
  %arrayidx1063 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %752 = load double, double* %arrayidx1063, align 8
  %add1064 = fadd double %751, %752
  %arrayidx1065 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  store double %add1064, double* %arrayidx1065, align 8
  %753 = load double, double* %c0_y1061, align 8
  %arrayidx1066 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %754 = load double, double* %arrayidx1066, align 8
  %add1067 = fadd double %753, %754
  %arrayidx1068 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %add1067, double* %arrayidx1068, align 8
  %755 = load double, double* %c0_x1059, align 8
  %arrayidx1069 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %756 = load double, double* %arrayidx1069, align 8
  %sub1070 = fsub double %755, %756
  %arrayidx1071 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %sub1070, double* %arrayidx1071, align 8
  %757 = load double, double* %c0_y1061, align 8
  %arrayidx1072 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %758 = load double, double* %arrayidx1072, align 8
  %sub1073 = fsub double %757, %758
  %arrayidx1074 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %sub1073, double* %arrayidx1074, align 8
  %759 = bitcast double* %c0_y1061 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %759) #6
  %760 = bitcast double* %c0_x1059 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %760) #6
  %761 = bitcast double* %tmp998 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %761) #6
  %762 = bitcast double* %exp_1_44_y997 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %762) #6
  %763 = bitcast double* %exp_1_44_x996 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %763) #6
  %764 = bitcast double* %tmp_1812 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %764) #6
  %765 = bitcast double* %exp_3_8_y811 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %765) #6
  %766 = bitcast double* %exp_1_4_y810 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %766) #6
  %767 = bitcast double* %exp_1_8_y809 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %767) #6
  %768 = bitcast double* %exp_3_8_x808 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %768) #6
  %769 = bitcast double* %exp_1_4_x807 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %769) #6
  %770 = bitcast double* %exp_1_8_x806 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %770) #6
  %771 = load i32, i32* %tid, align 4
  %shr1075 = ashr i32 %771, 3
  store i32 %shr1075, i32* %hi, align 4
  %arraydecay1076 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i32 0, i32 0
  %arraydecay1077 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i32 0, i32 0
  %772 = load i32, i32* %hi, align 4
  call void @twiddles8(double* %arraydecay1076, double* %arraydecay1077, i32 %772, i32 64)
  %arrayidx1078 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  %773 = load double, double* %arrayidx1078, align 8
  %774 = load i32, i32* %tid, align 4
  %mul1079 = mul nsw i32 %774, 8
  %idxprom1080 = sext i32 %mul1079 to i64
  %arrayidx1081 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1080
  store double %773, double* %arrayidx1081, align 8
  %arrayidx1082 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  %775 = load double, double* %arrayidx1082, align 8
  %776 = load i32, i32* %tid, align 4
  %mul1083 = mul nsw i32 %776, 8
  %add1084 = add nsw i32 %mul1083, 1
  %idxprom1085 = sext i32 %add1084 to i64
  %arrayidx1086 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1085
  store double %775, double* %arrayidx1086, align 8
  %arrayidx1087 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  %777 = load double, double* %arrayidx1087, align 8
  %778 = load i32, i32* %tid, align 4
  %mul1088 = mul nsw i32 %778, 8
  %add1089 = add nsw i32 %mul1088, 2
  %idxprom1090 = sext i32 %add1089 to i64
  %arrayidx1091 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1090
  store double %777, double* %arrayidx1091, align 8
  %arrayidx1092 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %779 = load double, double* %arrayidx1092, align 8
  %780 = load i32, i32* %tid, align 4
  %mul1093 = mul nsw i32 %780, 8
  %add1094 = add nsw i32 %mul1093, 3
  %idxprom1095 = sext i32 %add1094 to i64
  %arrayidx1096 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1095
  store double %779, double* %arrayidx1096, align 8
  %arrayidx1097 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  %781 = load double, double* %arrayidx1097, align 8
  %782 = load i32, i32* %tid, align 4
  %mul1098 = mul nsw i32 %782, 8
  %add1099 = add nsw i32 %mul1098, 4
  %idxprom1100 = sext i32 %add1099 to i64
  %arrayidx1101 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1100
  store double %781, double* %arrayidx1101, align 8
  %arrayidx1102 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %783 = load double, double* %arrayidx1102, align 8
  %784 = load i32, i32* %tid, align 4
  %mul1103 = mul nsw i32 %784, 8
  %add1104 = add nsw i32 %mul1103, 5
  %idxprom1105 = sext i32 %add1104 to i64
  %arrayidx1106 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1105
  store double %783, double* %arrayidx1106, align 8
  %arrayidx1107 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %785 = load double, double* %arrayidx1107, align 8
  %786 = load i32, i32* %tid, align 4
  %mul1108 = mul nsw i32 %786, 8
  %add1109 = add nsw i32 %mul1108, 6
  %idxprom1110 = sext i32 %add1109 to i64
  %arrayidx1111 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1110
  store double %785, double* %arrayidx1111, align 8
  %arrayidx1112 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %787 = load double, double* %arrayidx1112, align 8
  %788 = load i32, i32* %tid, align 4
  %mul1113 = mul nsw i32 %788, 8
  %add1114 = add nsw i32 %mul1113, 7
  %idxprom1115 = sext i32 %add1114 to i64
  %arrayidx1116 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1115
  store double %787, double* %arrayidx1116, align 8
  %arrayidx1117 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  %789 = load double, double* %arrayidx1117, align 8
  %790 = load i32, i32* %tid, align 4
  %mul1118 = mul nsw i32 %790, 8
  %idxprom1119 = sext i32 %mul1118 to i64
  %arrayidx1120 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1119
  store double %789, double* %arrayidx1120, align 8
  %arrayidx1121 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %791 = load double, double* %arrayidx1121, align 8
  %792 = load i32, i32* %tid, align 4
  %mul1122 = mul nsw i32 %792, 8
  %add1123 = add nsw i32 %mul1122, 1
  %idxprom1124 = sext i32 %add1123 to i64
  %arrayidx1125 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1124
  store double %791, double* %arrayidx1125, align 8
  %arrayidx1126 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %793 = load double, double* %arrayidx1126, align 8
  %794 = load i32, i32* %tid, align 4
  %mul1127 = mul nsw i32 %794, 8
  %add1128 = add nsw i32 %mul1127, 2
  %idxprom1129 = sext i32 %add1128 to i64
  %arrayidx1130 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1129
  store double %793, double* %arrayidx1130, align 8
  %arrayidx1131 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %795 = load double, double* %arrayidx1131, align 8
  %796 = load i32, i32* %tid, align 4
  %mul1132 = mul nsw i32 %796, 8
  %add1133 = add nsw i32 %mul1132, 3
  %idxprom1134 = sext i32 %add1133 to i64
  %arrayidx1135 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1134
  store double %795, double* %arrayidx1135, align 8
  %arrayidx1136 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %797 = load double, double* %arrayidx1136, align 8
  %798 = load i32, i32* %tid, align 4
  %mul1137 = mul nsw i32 %798, 8
  %add1138 = add nsw i32 %mul1137, 4
  %idxprom1139 = sext i32 %add1138 to i64
  %arrayidx1140 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1139
  store double %797, double* %arrayidx1140, align 8
  %arrayidx1141 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %799 = load double, double* %arrayidx1141, align 8
  %800 = load i32, i32* %tid, align 4
  %mul1142 = mul nsw i32 %800, 8
  %add1143 = add nsw i32 %mul1142, 5
  %idxprom1144 = sext i32 %add1143 to i64
  %arrayidx1145 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1144
  store double %799, double* %arrayidx1145, align 8
  %arrayidx1146 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %801 = load double, double* %arrayidx1146, align 8
  %802 = load i32, i32* %tid, align 4
  %mul1147 = mul nsw i32 %802, 8
  %add1148 = add nsw i32 %mul1147, 6
  %idxprom1149 = sext i32 %add1148 to i64
  %arrayidx1150 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1149
  store double %801, double* %arrayidx1150, align 8
  %arrayidx1151 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %803 = load double, double* %arrayidx1151, align 8
  %804 = load i32, i32* %tid, align 4
  %mul1152 = mul nsw i32 %804, 8
  %add1153 = add nsw i32 %mul1152, 7
  %idxprom1154 = sext i32 %add1153 to i64
  %arrayidx1155 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1154
  store double %803, double* %arrayidx1155, align 8
  br label %for.inc1156

for.inc1156:                                      ; preds = %for.body725
  %805 = load i32, i32* %tid, align 4
  %inc1157 = add nsw i32 %805, 1
  store i32 %inc1157, i32* %tid, align 4
  br label %for.cond723, !llvm.loop !64

for.end1158:                                      ; preds = %for.cond723
  store i32 72, i32* %sx, align 4
  br label %loop7

loop7:                                            ; preds = %for.end1158
  store i32 0, i32* %tid, align 4
  br label %for.cond1159

for.cond1159:                                     ; preds = %for.inc1230, %loop7
  %806 = load i32, i32* %tid, align 4
  %cmp1160 = icmp slt i32 %806, 64
  br i1 %cmp1160, label %for.body1161, label %for.end1232

for.body1161:                                     ; preds = %for.cond1159
  %807 = load i32, i32* %tid, align 4
  %shr1162 = ashr i32 %807, 3
  store i32 %shr1162, i32* %hi, align 4
  %808 = load i32, i32* %tid, align 4
  %and1163 = and i32 %808, 7
  store i32 %and1163, i32* %lo, align 4
  %809 = load i32, i32* %hi, align 4
  %mul1164 = mul nsw i32 %809, 8
  %810 = load i32, i32* %lo, align 4
  %add1165 = add nsw i32 %mul1164, %810
  store i32 %add1165, i32* %offset, align 4
  %811 = load i32, i32* %tid, align 4
  %mul1166 = mul nsw i32 %811, 8
  %add1167 = add nsw i32 %mul1166, 0
  %idxprom1168 = sext i32 %add1167 to i64
  %arrayidx1169 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1168
  %812 = load double, double* %arrayidx1169, align 8
  %813 = load i32, i32* %sx, align 4
  %mul1170 = mul nsw i32 0, %813
  %814 = load i32, i32* %offset, align 4
  %add1171 = add nsw i32 %mul1170, %814
  %idxprom1172 = sext i32 %add1171 to i64
  %arrayidx1173 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1172
  store double %812, double* %arrayidx1173, align 8
  %815 = load i32, i32* %tid, align 4
  %mul1174 = mul nsw i32 %815, 8
  %add1175 = add nsw i32 %mul1174, 1
  %idxprom1176 = sext i32 %add1175 to i64
  %arrayidx1177 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1176
  %816 = load double, double* %arrayidx1177, align 8
  %817 = load i32, i32* %sx, align 4
  %mul1178 = mul nsw i32 4, %817
  %818 = load i32, i32* %offset, align 4
  %add1179 = add nsw i32 %mul1178, %818
  %idxprom1180 = sext i32 %add1179 to i64
  %arrayidx1181 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1180
  store double %816, double* %arrayidx1181, align 8
  %819 = load i32, i32* %tid, align 4
  %mul1182 = mul nsw i32 %819, 8
  %add1183 = add nsw i32 %mul1182, 4
  %idxprom1184 = sext i32 %add1183 to i64
  %arrayidx1185 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1184
  %820 = load double, double* %arrayidx1185, align 8
  %821 = load i32, i32* %sx, align 4
  %mul1186 = mul nsw i32 1, %821
  %822 = load i32, i32* %offset, align 4
  %add1187 = add nsw i32 %mul1186, %822
  %idxprom1188 = sext i32 %add1187 to i64
  %arrayidx1189 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1188
  store double %820, double* %arrayidx1189, align 8
  %823 = load i32, i32* %tid, align 4
  %mul1190 = mul nsw i32 %823, 8
  %add1191 = add nsw i32 %mul1190, 5
  %idxprom1192 = sext i32 %add1191 to i64
  %arrayidx1193 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1192
  %824 = load double, double* %arrayidx1193, align 8
  %825 = load i32, i32* %sx, align 4
  %mul1194 = mul nsw i32 5, %825
  %826 = load i32, i32* %offset, align 4
  %add1195 = add nsw i32 %mul1194, %826
  %idxprom1196 = sext i32 %add1195 to i64
  %arrayidx1197 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1196
  store double %824, double* %arrayidx1197, align 8
  %827 = load i32, i32* %tid, align 4
  %mul1198 = mul nsw i32 %827, 8
  %add1199 = add nsw i32 %mul1198, 2
  %idxprom1200 = sext i32 %add1199 to i64
  %arrayidx1201 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1200
  %828 = load double, double* %arrayidx1201, align 8
  %829 = load i32, i32* %sx, align 4
  %mul1202 = mul nsw i32 2, %829
  %830 = load i32, i32* %offset, align 4
  %add1203 = add nsw i32 %mul1202, %830
  %idxprom1204 = sext i32 %add1203 to i64
  %arrayidx1205 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1204
  store double %828, double* %arrayidx1205, align 8
  %831 = load i32, i32* %tid, align 4
  %mul1206 = mul nsw i32 %831, 8
  %add1207 = add nsw i32 %mul1206, 3
  %idxprom1208 = sext i32 %add1207 to i64
  %arrayidx1209 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1208
  %832 = load double, double* %arrayidx1209, align 8
  %833 = load i32, i32* %sx, align 4
  %mul1210 = mul nsw i32 6, %833
  %834 = load i32, i32* %offset, align 4
  %add1211 = add nsw i32 %mul1210, %834
  %idxprom1212 = sext i32 %add1211 to i64
  %arrayidx1213 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1212
  store double %832, double* %arrayidx1213, align 8
  %835 = load i32, i32* %tid, align 4
  %mul1214 = mul nsw i32 %835, 8
  %add1215 = add nsw i32 %mul1214, 6
  %idxprom1216 = sext i32 %add1215 to i64
  %arrayidx1217 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1216
  %836 = load double, double* %arrayidx1217, align 8
  %837 = load i32, i32* %sx, align 4
  %mul1218 = mul nsw i32 3, %837
  %838 = load i32, i32* %offset, align 4
  %add1219 = add nsw i32 %mul1218, %838
  %idxprom1220 = sext i32 %add1219 to i64
  %arrayidx1221 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1220
  store double %836, double* %arrayidx1221, align 8
  %839 = load i32, i32* %tid, align 4
  %mul1222 = mul nsw i32 %839, 8
  %add1223 = add nsw i32 %mul1222, 7
  %idxprom1224 = sext i32 %add1223 to i64
  %arrayidx1225 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1224
  %840 = load double, double* %arrayidx1225, align 8
  %841 = load i32, i32* %sx, align 4
  %mul1226 = mul nsw i32 7, %841
  %842 = load i32, i32* %offset, align 4
  %add1227 = add nsw i32 %mul1226, %842
  %idxprom1228 = sext i32 %add1227 to i64
  %arrayidx1229 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1228
  store double %840, double* %arrayidx1229, align 8
  br label %for.inc1230

for.inc1230:                                      ; preds = %for.body1161
  %843 = load i32, i32* %tid, align 4
  %inc1231 = add nsw i32 %843, 1
  store i32 %inc1231, i32* %tid, align 4
  br label %for.cond1159, !llvm.loop !66

for.end1232:                                      ; preds = %for.cond1159
  store i32 8, i32* %sx, align 4
  br label %loop8

loop8:                                            ; preds = %for.end1232
  store i32 0, i32* %tid, align 4
  br label %for.cond1233

for.cond1233:                                     ; preds = %for.inc1304, %loop8
  %844 = load i32, i32* %tid, align 4
  %cmp1234 = icmp slt i32 %844, 64
  br i1 %cmp1234, label %for.body1235, label %for.end1306

for.body1235:                                     ; preds = %for.cond1233
  %845 = load i32, i32* %tid, align 4
  %shr1236 = ashr i32 %845, 3
  store i32 %shr1236, i32* %hi, align 4
  %846 = load i32, i32* %tid, align 4
  %and1237 = and i32 %846, 7
  store i32 %and1237, i32* %lo, align 4
  %847 = load i32, i32* %hi, align 4
  %mul1238 = mul nsw i32 %847, 72
  %848 = load i32, i32* %lo, align 4
  %add1239 = add nsw i32 %mul1238, %848
  store i32 %add1239, i32* %offset, align 4
  %849 = load i32, i32* %sx, align 4
  %mul1240 = mul nsw i32 0, %849
  %850 = load i32, i32* %offset, align 4
  %add1241 = add nsw i32 %mul1240, %850
  %idxprom1242 = sext i32 %add1241 to i64
  %arrayidx1243 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1242
  %851 = load double, double* %arrayidx1243, align 8
  %852 = load i32, i32* %tid, align 4
  %mul1244 = mul nsw i32 %852, 8
  %add1245 = add nsw i32 %mul1244, 0
  %idxprom1246 = sext i32 %add1245 to i64
  %arrayidx1247 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1246
  store double %851, double* %arrayidx1247, align 8
  %853 = load i32, i32* %sx, align 4
  %mul1248 = mul nsw i32 4, %853
  %854 = load i32, i32* %offset, align 4
  %add1249 = add nsw i32 %mul1248, %854
  %idxprom1250 = sext i32 %add1249 to i64
  %arrayidx1251 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1250
  %855 = load double, double* %arrayidx1251, align 8
  %856 = load i32, i32* %tid, align 4
  %mul1252 = mul nsw i32 %856, 8
  %add1253 = add nsw i32 %mul1252, 4
  %idxprom1254 = sext i32 %add1253 to i64
  %arrayidx1255 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1254
  store double %855, double* %arrayidx1255, align 8
  %857 = load i32, i32* %sx, align 4
  %mul1256 = mul nsw i32 1, %857
  %858 = load i32, i32* %offset, align 4
  %add1257 = add nsw i32 %mul1256, %858
  %idxprom1258 = sext i32 %add1257 to i64
  %arrayidx1259 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1258
  %859 = load double, double* %arrayidx1259, align 8
  %860 = load i32, i32* %tid, align 4
  %mul1260 = mul nsw i32 %860, 8
  %add1261 = add nsw i32 %mul1260, 1
  %idxprom1262 = sext i32 %add1261 to i64
  %arrayidx1263 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1262
  store double %859, double* %arrayidx1263, align 8
  %861 = load i32, i32* %sx, align 4
  %mul1264 = mul nsw i32 5, %861
  %862 = load i32, i32* %offset, align 4
  %add1265 = add nsw i32 %mul1264, %862
  %idxprom1266 = sext i32 %add1265 to i64
  %arrayidx1267 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1266
  %863 = load double, double* %arrayidx1267, align 8
  %864 = load i32, i32* %tid, align 4
  %mul1268 = mul nsw i32 %864, 8
  %add1269 = add nsw i32 %mul1268, 5
  %idxprom1270 = sext i32 %add1269 to i64
  %arrayidx1271 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1270
  store double %863, double* %arrayidx1271, align 8
  %865 = load i32, i32* %sx, align 4
  %mul1272 = mul nsw i32 2, %865
  %866 = load i32, i32* %offset, align 4
  %add1273 = add nsw i32 %mul1272, %866
  %idxprom1274 = sext i32 %add1273 to i64
  %arrayidx1275 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1274
  %867 = load double, double* %arrayidx1275, align 8
  %868 = load i32, i32* %tid, align 4
  %mul1276 = mul nsw i32 %868, 8
  %add1277 = add nsw i32 %mul1276, 2
  %idxprom1278 = sext i32 %add1277 to i64
  %arrayidx1279 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1278
  store double %867, double* %arrayidx1279, align 8
  %869 = load i32, i32* %sx, align 4
  %mul1280 = mul nsw i32 6, %869
  %870 = load i32, i32* %offset, align 4
  %add1281 = add nsw i32 %mul1280, %870
  %idxprom1282 = sext i32 %add1281 to i64
  %arrayidx1283 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1282
  %871 = load double, double* %arrayidx1283, align 8
  %872 = load i32, i32* %tid, align 4
  %mul1284 = mul nsw i32 %872, 8
  %add1285 = add nsw i32 %mul1284, 6
  %idxprom1286 = sext i32 %add1285 to i64
  %arrayidx1287 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1286
  store double %871, double* %arrayidx1287, align 8
  %873 = load i32, i32* %sx, align 4
  %mul1288 = mul nsw i32 3, %873
  %874 = load i32, i32* %offset, align 4
  %add1289 = add nsw i32 %mul1288, %874
  %idxprom1290 = sext i32 %add1289 to i64
  %arrayidx1291 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1290
  %875 = load double, double* %arrayidx1291, align 8
  %876 = load i32, i32* %tid, align 4
  %mul1292 = mul nsw i32 %876, 8
  %add1293 = add nsw i32 %mul1292, 3
  %idxprom1294 = sext i32 %add1293 to i64
  %arrayidx1295 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1294
  store double %875, double* %arrayidx1295, align 8
  %877 = load i32, i32* %sx, align 4
  %mul1296 = mul nsw i32 7, %877
  %878 = load i32, i32* %offset, align 4
  %add1297 = add nsw i32 %mul1296, %878
  %idxprom1298 = sext i32 %add1297 to i64
  %arrayidx1299 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1298
  %879 = load double, double* %arrayidx1299, align 8
  %880 = load i32, i32* %tid, align 4
  %mul1300 = mul nsw i32 %880, 8
  %add1301 = add nsw i32 %mul1300, 7
  %idxprom1302 = sext i32 %add1301 to i64
  %arrayidx1303 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1302
  store double %879, double* %arrayidx1303, align 8
  br label %for.inc1304

for.inc1304:                                      ; preds = %for.body1235
  %881 = load i32, i32* %tid, align 4
  %inc1305 = add nsw i32 %881, 1
  store i32 %inc1305, i32* %tid, align 4
  br label %for.cond1233, !llvm.loop !68

for.end1306:                                      ; preds = %for.cond1233
  store i32 72, i32* %sx, align 4
  br label %loop9

loop9:                                            ; preds = %for.end1306
  store i32 0, i32* %tid, align 4
  br label %for.cond1307

for.cond1307:                                     ; preds = %for.inc1378, %loop9
  %882 = load i32, i32* %tid, align 4
  %cmp1308 = icmp slt i32 %882, 64
  br i1 %cmp1308, label %for.body1309, label %for.end1380

for.body1309:                                     ; preds = %for.cond1307
  %883 = load i32, i32* %tid, align 4
  %shr1310 = ashr i32 %883, 3
  store i32 %shr1310, i32* %hi, align 4
  %884 = load i32, i32* %tid, align 4
  %and1311 = and i32 %884, 7
  store i32 %and1311, i32* %lo, align 4
  %885 = load i32, i32* %hi, align 4
  %mul1312 = mul nsw i32 %885, 8
  %886 = load i32, i32* %lo, align 4
  %add1313 = add nsw i32 %mul1312, %886
  store i32 %add1313, i32* %offset, align 4
  %887 = load i32, i32* %tid, align 4
  %mul1314 = mul nsw i32 %887, 8
  %add1315 = add nsw i32 %mul1314, 0
  %idxprom1316 = sext i32 %add1315 to i64
  %arrayidx1317 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1316
  %888 = load double, double* %arrayidx1317, align 8
  %889 = load i32, i32* %sx, align 4
  %mul1318 = mul nsw i32 0, %889
  %890 = load i32, i32* %offset, align 4
  %add1319 = add nsw i32 %mul1318, %890
  %idxprom1320 = sext i32 %add1319 to i64
  %arrayidx1321 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1320
  store double %888, double* %arrayidx1321, align 8
  %891 = load i32, i32* %tid, align 4
  %mul1322 = mul nsw i32 %891, 8
  %add1323 = add nsw i32 %mul1322, 1
  %idxprom1324 = sext i32 %add1323 to i64
  %arrayidx1325 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1324
  %892 = load double, double* %arrayidx1325, align 8
  %893 = load i32, i32* %sx, align 4
  %mul1326 = mul nsw i32 4, %893
  %894 = load i32, i32* %offset, align 4
  %add1327 = add nsw i32 %mul1326, %894
  %idxprom1328 = sext i32 %add1327 to i64
  %arrayidx1329 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1328
  store double %892, double* %arrayidx1329, align 8
  %895 = load i32, i32* %tid, align 4
  %mul1330 = mul nsw i32 %895, 8
  %add1331 = add nsw i32 %mul1330, 4
  %idxprom1332 = sext i32 %add1331 to i64
  %arrayidx1333 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1332
  %896 = load double, double* %arrayidx1333, align 8
  %897 = load i32, i32* %sx, align 4
  %mul1334 = mul nsw i32 1, %897
  %898 = load i32, i32* %offset, align 4
  %add1335 = add nsw i32 %mul1334, %898
  %idxprom1336 = sext i32 %add1335 to i64
  %arrayidx1337 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1336
  store double %896, double* %arrayidx1337, align 8
  %899 = load i32, i32* %tid, align 4
  %mul1338 = mul nsw i32 %899, 8
  %add1339 = add nsw i32 %mul1338, 5
  %idxprom1340 = sext i32 %add1339 to i64
  %arrayidx1341 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1340
  %900 = load double, double* %arrayidx1341, align 8
  %901 = load i32, i32* %sx, align 4
  %mul1342 = mul nsw i32 5, %901
  %902 = load i32, i32* %offset, align 4
  %add1343 = add nsw i32 %mul1342, %902
  %idxprom1344 = sext i32 %add1343 to i64
  %arrayidx1345 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1344
  store double %900, double* %arrayidx1345, align 8
  %903 = load i32, i32* %tid, align 4
  %mul1346 = mul nsw i32 %903, 8
  %add1347 = add nsw i32 %mul1346, 2
  %idxprom1348 = sext i32 %add1347 to i64
  %arrayidx1349 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1348
  %904 = load double, double* %arrayidx1349, align 8
  %905 = load i32, i32* %sx, align 4
  %mul1350 = mul nsw i32 2, %905
  %906 = load i32, i32* %offset, align 4
  %add1351 = add nsw i32 %mul1350, %906
  %idxprom1352 = sext i32 %add1351 to i64
  %arrayidx1353 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1352
  store double %904, double* %arrayidx1353, align 8
  %907 = load i32, i32* %tid, align 4
  %mul1354 = mul nsw i32 %907, 8
  %add1355 = add nsw i32 %mul1354, 3
  %idxprom1356 = sext i32 %add1355 to i64
  %arrayidx1357 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1356
  %908 = load double, double* %arrayidx1357, align 8
  %909 = load i32, i32* %sx, align 4
  %mul1358 = mul nsw i32 6, %909
  %910 = load i32, i32* %offset, align 4
  %add1359 = add nsw i32 %mul1358, %910
  %idxprom1360 = sext i32 %add1359 to i64
  %arrayidx1361 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1360
  store double %908, double* %arrayidx1361, align 8
  %911 = load i32, i32* %tid, align 4
  %mul1362 = mul nsw i32 %911, 8
  %add1363 = add nsw i32 %mul1362, 6
  %idxprom1364 = sext i32 %add1363 to i64
  %arrayidx1365 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1364
  %912 = load double, double* %arrayidx1365, align 8
  %913 = load i32, i32* %sx, align 4
  %mul1366 = mul nsw i32 3, %913
  %914 = load i32, i32* %offset, align 4
  %add1367 = add nsw i32 %mul1366, %914
  %idxprom1368 = sext i32 %add1367 to i64
  %arrayidx1369 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1368
  store double %912, double* %arrayidx1369, align 8
  %915 = load i32, i32* %tid, align 4
  %mul1370 = mul nsw i32 %915, 8
  %add1371 = add nsw i32 %mul1370, 7
  %idxprom1372 = sext i32 %add1371 to i64
  %arrayidx1373 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1372
  %916 = load double, double* %arrayidx1373, align 8
  %917 = load i32, i32* %sx, align 4
  %mul1374 = mul nsw i32 7, %917
  %918 = load i32, i32* %offset, align 4
  %add1375 = add nsw i32 %mul1374, %918
  %idxprom1376 = sext i32 %add1375 to i64
  %arrayidx1377 = getelementptr inbounds [576 x double], [576 x double]* %smem, i64 0, i64 %idxprom1376
  store double %916, double* %arrayidx1377, align 8
  br label %for.inc1378

for.inc1378:                                      ; preds = %for.body1309
  %919 = load i32, i32* %tid, align 4
  %inc1379 = add nsw i32 %919, 1
  store i32 %inc1379, i32* %tid, align 4
  br label %for.cond1307, !llvm.loop !70

for.end1380:                                      ; preds = %for.cond1307
  br label %loop10

loop10:                                           ; preds = %for.end1380
  store i32 0, i32* %tid, align 4
  br label %for.cond1381

for.cond1381:                                     ; preds = %for.inc1470, %loop10
  %920 = load i32, i32* %tid, align 4
  %cmp1382 = icmp slt i32 %920, 64
  br i1 %cmp1382, label %for.body1383, label %for.end1472

for.body1383:                                     ; preds = %for.cond1381
  %921 = load i32, i32* %tid, align 4
  %mul1384 = mul nsw i32 %921, 8
  %add1385 = add nsw i32 %mul1384, 0
  %idxprom1386 = sext i32 %add1385 to i64
  %arrayidx1387 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1386
  %922 = load double, double* %arrayidx1387, align 8
  %arrayidx1388 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  store double %922, double* %arrayidx1388, align 8
  %923 = load i32, i32* %tid, align 4
  %mul1389 = mul nsw i32 %923, 8
  %add1390 = add nsw i32 %mul1389, 1
  %idxprom1391 = sext i32 %add1390 to i64
  %arrayidx1392 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1391
  %924 = load double, double* %arrayidx1392, align 8
  %arrayidx1393 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  store double %924, double* %arrayidx1393, align 8
  %925 = load i32, i32* %tid, align 4
  %mul1394 = mul nsw i32 %925, 8
  %add1395 = add nsw i32 %mul1394, 2
  %idxprom1396 = sext i32 %add1395 to i64
  %arrayidx1397 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1396
  %926 = load double, double* %arrayidx1397, align 8
  %arrayidx1398 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  store double %926, double* %arrayidx1398, align 8
  %927 = load i32, i32* %tid, align 4
  %mul1399 = mul nsw i32 %927, 8
  %add1400 = add nsw i32 %mul1399, 3
  %idxprom1401 = sext i32 %add1400 to i64
  %arrayidx1402 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1401
  %928 = load double, double* %arrayidx1402, align 8
  %arrayidx1403 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %928, double* %arrayidx1403, align 8
  %929 = load i32, i32* %tid, align 4
  %mul1404 = mul nsw i32 %929, 8
  %add1405 = add nsw i32 %mul1404, 4
  %idxprom1406 = sext i32 %add1405 to i64
  %arrayidx1407 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1406
  %930 = load double, double* %arrayidx1407, align 8
  %arrayidx1408 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  store double %930, double* %arrayidx1408, align 8
  %931 = load i32, i32* %tid, align 4
  %mul1409 = mul nsw i32 %931, 8
  %add1410 = add nsw i32 %mul1409, 5
  %idxprom1411 = sext i32 %add1410 to i64
  %arrayidx1412 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1411
  %932 = load double, double* %arrayidx1412, align 8
  %arrayidx1413 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %932, double* %arrayidx1413, align 8
  %933 = load i32, i32* %tid, align 4
  %mul1414 = mul nsw i32 %933, 8
  %add1415 = add nsw i32 %mul1414, 6
  %idxprom1416 = sext i32 %add1415 to i64
  %arrayidx1417 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1416
  %934 = load double, double* %arrayidx1417, align 8
  %arrayidx1418 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %934, double* %arrayidx1418, align 8
  %935 = load i32, i32* %tid, align 4
  %mul1419 = mul nsw i32 %935, 8
  %add1420 = add nsw i32 %mul1419, 7
  %idxprom1421 = sext i32 %add1420 to i64
  %arrayidx1422 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1421
  %936 = load double, double* %arrayidx1422, align 8
  %arrayidx1423 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %936, double* %arrayidx1423, align 8
  %937 = load i32, i32* %tid, align 4
  %shr1424 = ashr i32 %937, 3
  store i32 %shr1424, i32* %hi, align 4
  %938 = load i32, i32* %tid, align 4
  %and1425 = and i32 %938, 7
  store i32 %and1425, i32* %lo, align 4
  %arraydecay1426 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i32 0, i32 0
  %arraydecay1427 = getelementptr inbounds [576 x double], [576 x double]* %smem, i32 0, i32 0
  %939 = load i32, i32* %hi, align 4
  %mul1428 = mul nsw i32 %939, 72
  %940 = load i32, i32* %lo, align 4
  %add1429 = add nsw i32 %mul1428, %940
  call void @loady8(double* %arraydecay1426, double* %arraydecay1427, i32 %add1429, i32 8)
  %arrayidx1430 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  %941 = load double, double* %arrayidx1430, align 8
  %942 = load i32, i32* %tid, align 4
  %mul1431 = mul nsw i32 %942, 8
  %add1432 = add nsw i32 %mul1431, 0
  %idxprom1433 = sext i32 %add1432 to i64
  %arrayidx1434 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1433
  store double %941, double* %arrayidx1434, align 8
  %arrayidx1435 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %943 = load double, double* %arrayidx1435, align 8
  %944 = load i32, i32* %tid, align 4
  %mul1436 = mul nsw i32 %944, 8
  %add1437 = add nsw i32 %mul1436, 1
  %idxprom1438 = sext i32 %add1437 to i64
  %arrayidx1439 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1438
  store double %943, double* %arrayidx1439, align 8
  %arrayidx1440 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %945 = load double, double* %arrayidx1440, align 8
  %946 = load i32, i32* %tid, align 4
  %mul1441 = mul nsw i32 %946, 8
  %add1442 = add nsw i32 %mul1441, 2
  %idxprom1443 = sext i32 %add1442 to i64
  %arrayidx1444 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1443
  store double %945, double* %arrayidx1444, align 8
  %arrayidx1445 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %947 = load double, double* %arrayidx1445, align 8
  %948 = load i32, i32* %tid, align 4
  %mul1446 = mul nsw i32 %948, 8
  %add1447 = add nsw i32 %mul1446, 3
  %idxprom1448 = sext i32 %add1447 to i64
  %arrayidx1449 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1448
  store double %947, double* %arrayidx1449, align 8
  %arrayidx1450 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %949 = load double, double* %arrayidx1450, align 8
  %950 = load i32, i32* %tid, align 4
  %mul1451 = mul nsw i32 %950, 8
  %add1452 = add nsw i32 %mul1451, 4
  %idxprom1453 = sext i32 %add1452 to i64
  %arrayidx1454 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1453
  store double %949, double* %arrayidx1454, align 8
  %arrayidx1455 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %951 = load double, double* %arrayidx1455, align 8
  %952 = load i32, i32* %tid, align 4
  %mul1456 = mul nsw i32 %952, 8
  %add1457 = add nsw i32 %mul1456, 5
  %idxprom1458 = sext i32 %add1457 to i64
  %arrayidx1459 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1458
  store double %951, double* %arrayidx1459, align 8
  %arrayidx1460 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %953 = load double, double* %arrayidx1460, align 8
  %954 = load i32, i32* %tid, align 4
  %mul1461 = mul nsw i32 %954, 8
  %add1462 = add nsw i32 %mul1461, 6
  %idxprom1463 = sext i32 %add1462 to i64
  %arrayidx1464 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1463
  store double %953, double* %arrayidx1464, align 8
  %arrayidx1465 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %955 = load double, double* %arrayidx1465, align 8
  %956 = load i32, i32* %tid, align 4
  %mul1466 = mul nsw i32 %956, 8
  %add1467 = add nsw i32 %mul1466, 7
  %idxprom1468 = sext i32 %add1467 to i64
  %arrayidx1469 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1468
  store double %955, double* %arrayidx1469, align 8
  br label %for.inc1470

for.inc1470:                                      ; preds = %for.body1383
  %957 = load i32, i32* %tid, align 4
  %inc1471 = add nsw i32 %957, 1
  store i32 %inc1471, i32* %tid, align 4
  br label %for.cond1381, !llvm.loop !72

for.end1472:                                      ; preds = %for.cond1381
  br label %loop11

loop11:                                           ; preds = %for.end1472
  store i32 0, i32* %tid, align 4
  br label %for.cond1473

for.cond1473:                                     ; preds = %for.inc1919, %loop11
  %958 = load i32, i32* %tid, align 4
  %cmp1474 = icmp slt i32 %958, 64
  br i1 %cmp1474, label %for.body1475, label %for.end1921

for.body1475:                                     ; preds = %for.cond1473
  %959 = load i32, i32* %tid, align 4
  %mul1476 = mul nsw i32 %959, 8
  %idxprom1477 = sext i32 %mul1476 to i64
  %arrayidx1478 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1477
  %960 = load double, double* %arrayidx1478, align 8
  %arrayidx1479 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  store double %960, double* %arrayidx1479, align 8
  %961 = load i32, i32* %tid, align 4
  %mul1480 = mul nsw i32 %961, 8
  %add1481 = add nsw i32 %mul1480, 1
  %idxprom1482 = sext i32 %add1481 to i64
  %arrayidx1483 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1482
  %962 = load double, double* %arrayidx1483, align 8
  %arrayidx1484 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  store double %962, double* %arrayidx1484, align 8
  %963 = load i32, i32* %tid, align 4
  %mul1485 = mul nsw i32 %963, 8
  %add1486 = add nsw i32 %mul1485, 2
  %idxprom1487 = sext i32 %add1486 to i64
  %arrayidx1488 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1487
  %964 = load double, double* %arrayidx1488, align 8
  %arrayidx1489 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  store double %964, double* %arrayidx1489, align 8
  %965 = load i32, i32* %tid, align 4
  %mul1490 = mul nsw i32 %965, 8
  %add1491 = add nsw i32 %mul1490, 3
  %idxprom1492 = sext i32 %add1491 to i64
  %arrayidx1493 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1492
  %966 = load double, double* %arrayidx1493, align 8
  %arrayidx1494 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %966, double* %arrayidx1494, align 8
  %967 = load i32, i32* %tid, align 4
  %mul1495 = mul nsw i32 %967, 8
  %add1496 = add nsw i32 %mul1495, 4
  %idxprom1497 = sext i32 %add1496 to i64
  %arrayidx1498 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1497
  %968 = load double, double* %arrayidx1498, align 8
  %arrayidx1499 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  store double %968, double* %arrayidx1499, align 8
  %969 = load i32, i32* %tid, align 4
  %mul1500 = mul nsw i32 %969, 8
  %add1501 = add nsw i32 %mul1500, 5
  %idxprom1502 = sext i32 %add1501 to i64
  %arrayidx1503 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1502
  %970 = load double, double* %arrayidx1503, align 8
  %arrayidx1504 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %970, double* %arrayidx1504, align 8
  %971 = load i32, i32* %tid, align 4
  %mul1505 = mul nsw i32 %971, 8
  %add1506 = add nsw i32 %mul1505, 6
  %idxprom1507 = sext i32 %add1506 to i64
  %arrayidx1508 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1507
  %972 = load double, double* %arrayidx1508, align 8
  %arrayidx1509 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %972, double* %arrayidx1509, align 8
  %973 = load i32, i32* %tid, align 4
  %mul1510 = mul nsw i32 %973, 8
  %add1511 = add nsw i32 %mul1510, 7
  %idxprom1512 = sext i32 %add1511 to i64
  %arrayidx1513 = getelementptr inbounds [512 x double], [512 x double]* %DATA_y, i64 0, i64 %idxprom1512
  %974 = load double, double* %arrayidx1513, align 8
  %arrayidx1514 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %974, double* %arrayidx1514, align 8
  %975 = load i32, i32* %tid, align 4
  %mul1515 = mul nsw i32 %975, 8
  %idxprom1516 = sext i32 %mul1515 to i64
  %arrayidx1517 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1516
  %976 = load double, double* %arrayidx1517, align 8
  %arrayidx1518 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  store double %976, double* %arrayidx1518, align 8
  %977 = load i32, i32* %tid, align 4
  %mul1519 = mul nsw i32 %977, 8
  %add1520 = add nsw i32 %mul1519, 1
  %idxprom1521 = sext i32 %add1520 to i64
  %arrayidx1522 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1521
  %978 = load double, double* %arrayidx1522, align 8
  %arrayidx1523 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  store double %978, double* %arrayidx1523, align 8
  %979 = load i32, i32* %tid, align 4
  %mul1524 = mul nsw i32 %979, 8
  %add1525 = add nsw i32 %mul1524, 2
  %idxprom1526 = sext i32 %add1525 to i64
  %arrayidx1527 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1526
  %980 = load double, double* %arrayidx1527, align 8
  %arrayidx1528 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  store double %980, double* %arrayidx1528, align 8
  %981 = load i32, i32* %tid, align 4
  %mul1529 = mul nsw i32 %981, 8
  %add1530 = add nsw i32 %mul1529, 3
  %idxprom1531 = sext i32 %add1530 to i64
  %arrayidx1532 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1531
  %982 = load double, double* %arrayidx1532, align 8
  %arrayidx1533 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  store double %982, double* %arrayidx1533, align 8
  %983 = load i32, i32* %tid, align 4
  %mul1534 = mul nsw i32 %983, 8
  %add1535 = add nsw i32 %mul1534, 4
  %idxprom1536 = sext i32 %add1535 to i64
  %arrayidx1537 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1536
  %984 = load double, double* %arrayidx1537, align 8
  %arrayidx1538 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  store double %984, double* %arrayidx1538, align 8
  %985 = load i32, i32* %tid, align 4
  %mul1539 = mul nsw i32 %985, 8
  %add1540 = add nsw i32 %mul1539, 5
  %idxprom1541 = sext i32 %add1540 to i64
  %arrayidx1542 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1541
  %986 = load double, double* %arrayidx1542, align 8
  %arrayidx1543 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  store double %986, double* %arrayidx1543, align 8
  %987 = load i32, i32* %tid, align 4
  %mul1544 = mul nsw i32 %987, 8
  %add1545 = add nsw i32 %mul1544, 6
  %idxprom1546 = sext i32 %add1545 to i64
  %arrayidx1547 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1546
  %988 = load double, double* %arrayidx1547, align 8
  %arrayidx1548 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  store double %988, double* %arrayidx1548, align 8
  %989 = load i32, i32* %tid, align 4
  %mul1549 = mul nsw i32 %989, 8
  %add1550 = add nsw i32 %mul1549, 7
  %idxprom1551 = sext i32 %add1550 to i64
  %arrayidx1552 = getelementptr inbounds [512 x double], [512 x double]* %DATA_x, i64 0, i64 %idxprom1551
  %990 = load double, double* %arrayidx1552, align 8
  %arrayidx1553 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %990, double* %arrayidx1553, align 8
  %991 = bitcast double* %exp_1_8_x1554 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %991) #6
  %992 = bitcast double* %exp_1_4_x1555 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %992) #6
  %993 = bitcast double* %exp_3_8_x1556 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %993) #6
  %994 = bitcast double* %exp_1_8_y1557 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %994) #6
  %995 = bitcast double* %exp_1_4_y1558 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %995) #6
  %996 = bitcast double* %exp_3_8_y1559 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %996) #6
  %997 = bitcast double* %tmp_11560 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %997) #6
  store double 1.000000e+00, double* %exp_1_8_x1554, align 8
  store double -1.000000e+00, double* %exp_1_8_y1557, align 8
  store double 0.000000e+00, double* %exp_1_4_x1555, align 8
  store double -1.000000e+00, double* %exp_1_4_y1558, align 8
  store double -1.000000e+00, double* %exp_3_8_x1556, align 8
  store double -1.000000e+00, double* %exp_3_8_y1559, align 8
  %998 = bitcast double* %c0_x1561 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %998) #6
  %arrayidx1562 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  %999 = load double, double* %arrayidx1562, align 8
  store double %999, double* %c0_x1561, align 8
  %1000 = bitcast double* %c0_y1563 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1000) #6
  %arrayidx1564 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  %1001 = load double, double* %arrayidx1564, align 8
  store double %1001, double* %c0_y1563, align 8
  %1002 = load double, double* %c0_x1561, align 8
  %arrayidx1565 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  %1003 = load double, double* %arrayidx1565, align 8
  %add1566 = fadd double %1002, %1003
  %arrayidx1567 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  store double %add1566, double* %arrayidx1567, align 8
  %1004 = load double, double* %c0_y1563, align 8
  %arrayidx1568 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %1005 = load double, double* %arrayidx1568, align 8
  %add1569 = fadd double %1004, %1005
  %arrayidx1570 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  store double %add1569, double* %arrayidx1570, align 8
  %1006 = load double, double* %c0_x1561, align 8
  %arrayidx1571 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  %1007 = load double, double* %arrayidx1571, align 8
  %sub1572 = fsub double %1006, %1007
  %arrayidx1573 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  store double %sub1572, double* %arrayidx1573, align 8
  %1008 = load double, double* %c0_y1563, align 8
  %arrayidx1574 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %1009 = load double, double* %arrayidx1574, align 8
  %sub1575 = fsub double %1008, %1009
  %arrayidx1576 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  store double %sub1575, double* %arrayidx1576, align 8
  %1010 = bitcast double* %c0_y1563 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1010) #6
  %1011 = bitcast double* %c0_x1561 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1011) #6
  %1012 = bitcast double* %c0_x1577 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1012) #6
  %arrayidx1578 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  %1013 = load double, double* %arrayidx1578, align 8
  store double %1013, double* %c0_x1577, align 8
  %1014 = bitcast double* %c0_y1579 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1014) #6
  %arrayidx1580 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %1015 = load double, double* %arrayidx1580, align 8
  store double %1015, double* %c0_y1579, align 8
  %1016 = load double, double* %c0_x1577, align 8
  %arrayidx1581 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %1017 = load double, double* %arrayidx1581, align 8
  %add1582 = fadd double %1016, %1017
  %arrayidx1583 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  store double %add1582, double* %arrayidx1583, align 8
  %1018 = load double, double* %c0_y1579, align 8
  %arrayidx1584 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %1019 = load double, double* %arrayidx1584, align 8
  %add1585 = fadd double %1018, %1019
  %arrayidx1586 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  store double %add1585, double* %arrayidx1586, align 8
  %1020 = load double, double* %c0_x1577, align 8
  %arrayidx1587 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %1021 = load double, double* %arrayidx1587, align 8
  %sub1588 = fsub double %1020, %1021
  %arrayidx1589 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  store double %sub1588, double* %arrayidx1589, align 8
  %1022 = load double, double* %c0_y1579, align 8
  %arrayidx1590 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %1023 = load double, double* %arrayidx1590, align 8
  %sub1591 = fsub double %1022, %1023
  %arrayidx1592 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %sub1591, double* %arrayidx1592, align 8
  %1024 = bitcast double* %c0_y1579 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1024) #6
  %1025 = bitcast double* %c0_x1577 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1025) #6
  %1026 = bitcast double* %c0_x1593 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1026) #6
  %arrayidx1594 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  %1027 = load double, double* %arrayidx1594, align 8
  store double %1027, double* %c0_x1593, align 8
  %1028 = bitcast double* %c0_y1595 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1028) #6
  %arrayidx1596 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %1029 = load double, double* %arrayidx1596, align 8
  store double %1029, double* %c0_y1595, align 8
  %1030 = load double, double* %c0_x1593, align 8
  %arrayidx1597 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %1031 = load double, double* %arrayidx1597, align 8
  %add1598 = fadd double %1030, %1031
  %arrayidx1599 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  store double %add1598, double* %arrayidx1599, align 8
  %1032 = load double, double* %c0_y1595, align 8
  %arrayidx1600 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %1033 = load double, double* %arrayidx1600, align 8
  %add1601 = fadd double %1032, %1033
  %arrayidx1602 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  store double %add1601, double* %arrayidx1602, align 8
  %1034 = load double, double* %c0_x1593, align 8
  %arrayidx1603 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %1035 = load double, double* %arrayidx1603, align 8
  %sub1604 = fsub double %1034, %1035
  %arrayidx1605 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  store double %sub1604, double* %arrayidx1605, align 8
  %1036 = load double, double* %c0_y1595, align 8
  %arrayidx1606 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %1037 = load double, double* %arrayidx1606, align 8
  %sub1607 = fsub double %1036, %1037
  %arrayidx1608 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %sub1607, double* %arrayidx1608, align 8
  %1038 = bitcast double* %c0_y1595 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1038) #6
  %1039 = bitcast double* %c0_x1593 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1039) #6
  %1040 = bitcast double* %c0_x1609 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1040) #6
  %arrayidx1610 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %1041 = load double, double* %arrayidx1610, align 8
  store double %1041, double* %c0_x1609, align 8
  %1042 = bitcast double* %c0_y1611 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1042) #6
  %arrayidx1612 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %1043 = load double, double* %arrayidx1612, align 8
  store double %1043, double* %c0_y1611, align 8
  %1044 = load double, double* %c0_x1609, align 8
  %arrayidx1613 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %1045 = load double, double* %arrayidx1613, align 8
  %add1614 = fadd double %1044, %1045
  %arrayidx1615 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  store double %add1614, double* %arrayidx1615, align 8
  %1046 = load double, double* %c0_y1611, align 8
  %arrayidx1616 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %1047 = load double, double* %arrayidx1616, align 8
  %add1617 = fadd double %1046, %1047
  %arrayidx1618 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %add1617, double* %arrayidx1618, align 8
  %1048 = load double, double* %c0_x1609, align 8
  %arrayidx1619 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %1049 = load double, double* %arrayidx1619, align 8
  %sub1620 = fsub double %1048, %1049
  %arrayidx1621 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %sub1620, double* %arrayidx1621, align 8
  %1050 = load double, double* %c0_y1611, align 8
  %arrayidx1622 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %1051 = load double, double* %arrayidx1622, align 8
  %sub1623 = fsub double %1050, %1051
  %arrayidx1624 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %sub1623, double* %arrayidx1624, align 8
  %1052 = bitcast double* %c0_y1611 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1052) #6
  %1053 = bitcast double* %c0_x1609 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1053) #6
  %arrayidx1625 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %1054 = load double, double* %arrayidx1625, align 8
  store double %1054, double* %tmp_11560, align 8
  %arrayidx1626 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %1055 = load double, double* %arrayidx1626, align 8
  %1056 = load double, double* %exp_1_8_x1554, align 8
  %mul1627 = fmul double %1055, %1056
  %arrayidx1628 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %1057 = load double, double* %arrayidx1628, align 8
  %1058 = load double, double* %exp_1_8_y1557, align 8
  %mul1629 = fmul double %1057, %1058
  %sub1630 = fsub double %mul1627, %mul1629
  %mul1631 = fmul double 0x3FE6A09E60000000, %sub1630
  %arrayidx1632 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  store double %mul1631, double* %arrayidx1632, align 8
  %1059 = load double, double* %tmp_11560, align 8
  %1060 = load double, double* %exp_1_8_y1557, align 8
  %mul1633 = fmul double %1059, %1060
  %arrayidx1634 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %1061 = load double, double* %arrayidx1634, align 8
  %1062 = load double, double* %exp_1_8_x1554, align 8
  %mul1635 = fmul double %1061, %1062
  %add1636 = fadd double %mul1633, %mul1635
  %mul1637 = fmul double 0x3FE6A09E60000000, %add1636
  %arrayidx1638 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %mul1637, double* %arrayidx1638, align 8
  %arrayidx1639 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %1063 = load double, double* %arrayidx1639, align 8
  store double %1063, double* %tmp_11560, align 8
  %arrayidx1640 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %1064 = load double, double* %arrayidx1640, align 8
  %1065 = load double, double* %exp_1_4_x1555, align 8
  %mul1641 = fmul double %1064, %1065
  %arrayidx1642 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %1066 = load double, double* %arrayidx1642, align 8
  %1067 = load double, double* %exp_1_4_y1558, align 8
  %mul1643 = fmul double %1066, %1067
  %sub1644 = fsub double %mul1641, %mul1643
  %arrayidx1645 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  store double %sub1644, double* %arrayidx1645, align 8
  %1068 = load double, double* %tmp_11560, align 8
  %1069 = load double, double* %exp_1_4_y1558, align 8
  %mul1646 = fmul double %1068, %1069
  %arrayidx1647 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %1070 = load double, double* %arrayidx1647, align 8
  %1071 = load double, double* %exp_1_4_x1555, align 8
  %mul1648 = fmul double %1070, %1071
  %add1649 = fadd double %mul1646, %mul1648
  %arrayidx1650 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %add1649, double* %arrayidx1650, align 8
  %arrayidx1651 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %1072 = load double, double* %arrayidx1651, align 8
  store double %1072, double* %tmp_11560, align 8
  %arrayidx1652 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %1073 = load double, double* %arrayidx1652, align 8
  %1074 = load double, double* %exp_3_8_x1556, align 8
  %mul1653 = fmul double %1073, %1074
  %arrayidx1654 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %1075 = load double, double* %arrayidx1654, align 8
  %1076 = load double, double* %exp_3_8_y1559, align 8
  %mul1655 = fmul double %1075, %1076
  %sub1656 = fsub double %mul1653, %mul1655
  %mul1657 = fmul double 0x3FE6A09E60000000, %sub1656
  %arrayidx1658 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %mul1657, double* %arrayidx1658, align 8
  %1077 = load double, double* %tmp_11560, align 8
  %1078 = load double, double* %exp_3_8_y1559, align 8
  %mul1659 = fmul double %1077, %1078
  %arrayidx1660 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %1079 = load double, double* %arrayidx1660, align 8
  %1080 = load double, double* %exp_3_8_x1556, align 8
  %mul1661 = fmul double %1079, %1080
  %add1662 = fadd double %mul1659, %mul1661
  %mul1663 = fmul double 0x3FE6A09E60000000, %add1662
  %arrayidx1664 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %mul1663, double* %arrayidx1664, align 8
  %1081 = bitcast double* %exp_1_44_x1665 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1081) #6
  %1082 = bitcast double* %exp_1_44_y1666 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1082) #6
  %1083 = bitcast double* %tmp1667 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1083) #6
  store double 0.000000e+00, double* %exp_1_44_x1665, align 8
  store double -1.000000e+00, double* %exp_1_44_y1666, align 8
  %1084 = bitcast double* %c0_x1668 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1084) #6
  %arrayidx1669 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  %1085 = load double, double* %arrayidx1669, align 8
  store double %1085, double* %c0_x1668, align 8
  %1086 = bitcast double* %c0_y1670 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1086) #6
  %arrayidx1671 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  %1087 = load double, double* %arrayidx1671, align 8
  store double %1087, double* %c0_y1670, align 8
  %1088 = load double, double* %c0_x1668, align 8
  %arrayidx1672 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  %1089 = load double, double* %arrayidx1672, align 8
  %add1673 = fadd double %1088, %1089
  %arrayidx1674 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  store double %add1673, double* %arrayidx1674, align 8
  %1090 = load double, double* %c0_y1670, align 8
  %arrayidx1675 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %1091 = load double, double* %arrayidx1675, align 8
  %add1676 = fadd double %1090, %1091
  %arrayidx1677 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  store double %add1676, double* %arrayidx1677, align 8
  %1092 = load double, double* %c0_x1668, align 8
  %arrayidx1678 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  %1093 = load double, double* %arrayidx1678, align 8
  %sub1679 = fsub double %1092, %1093
  %arrayidx1680 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  store double %sub1679, double* %arrayidx1680, align 8
  %1094 = load double, double* %c0_y1670, align 8
  %arrayidx1681 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %1095 = load double, double* %arrayidx1681, align 8
  %sub1682 = fsub double %1094, %1095
  %arrayidx1683 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  store double %sub1682, double* %arrayidx1683, align 8
  %1096 = bitcast double* %c0_y1670 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1096) #6
  %1097 = bitcast double* %c0_x1668 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1097) #6
  %1098 = bitcast double* %c0_x1684 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1098) #6
  %arrayidx1685 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  %1099 = load double, double* %arrayidx1685, align 8
  store double %1099, double* %c0_x1684, align 8
  %1100 = bitcast double* %c0_y1686 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1100) #6
  %arrayidx1687 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %1101 = load double, double* %arrayidx1687, align 8
  store double %1101, double* %c0_y1686, align 8
  %1102 = load double, double* %c0_x1684, align 8
  %arrayidx1688 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %1103 = load double, double* %arrayidx1688, align 8
  %add1689 = fadd double %1102, %1103
  %arrayidx1690 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  store double %add1689, double* %arrayidx1690, align 8
  %1104 = load double, double* %c0_y1686, align 8
  %arrayidx1691 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %1105 = load double, double* %arrayidx1691, align 8
  %add1692 = fadd double %1104, %1105
  %arrayidx1693 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  store double %add1692, double* %arrayidx1693, align 8
  %1106 = load double, double* %c0_x1684, align 8
  %arrayidx1694 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %1107 = load double, double* %arrayidx1694, align 8
  %sub1695 = fsub double %1106, %1107
  %arrayidx1696 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  store double %sub1695, double* %arrayidx1696, align 8
  %1108 = load double, double* %c0_y1686, align 8
  %arrayidx1697 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %1109 = load double, double* %arrayidx1697, align 8
  %sub1698 = fsub double %1108, %1109
  %arrayidx1699 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %sub1698, double* %arrayidx1699, align 8
  %1110 = bitcast double* %c0_y1686 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1110) #6
  %1111 = bitcast double* %c0_x1684 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1111) #6
  %arrayidx1700 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %1112 = load double, double* %arrayidx1700, align 8
  store double %1112, double* %tmp1667, align 8
  %arrayidx1701 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %1113 = load double, double* %arrayidx1701, align 8
  %1114 = load double, double* %exp_1_44_x1665, align 8
  %mul1702 = fmul double %1113, %1114
  %arrayidx1703 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %1115 = load double, double* %arrayidx1703, align 8
  %1116 = load double, double* %exp_1_44_y1666, align 8
  %mul1704 = fmul double %1115, %1116
  %sub1705 = fsub double %mul1702, %mul1704
  %arrayidx1706 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  store double %sub1705, double* %arrayidx1706, align 8
  %1117 = load double, double* %tmp1667, align 8
  %1118 = load double, double* %exp_1_44_y1666, align 8
  %mul1707 = fmul double %1117, %1118
  %arrayidx1708 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %1119 = load double, double* %arrayidx1708, align 8
  %1120 = load double, double* %exp_1_44_x1665, align 8
  %mul1709 = fmul double %1119, %1120
  %sub1710 = fsub double %mul1707, %mul1709
  %arrayidx1711 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %sub1710, double* %arrayidx1711, align 8
  %1121 = bitcast double* %c0_x1712 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1121) #6
  %arrayidx1713 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  %1122 = load double, double* %arrayidx1713, align 8
  store double %1122, double* %c0_x1712, align 8
  %1123 = bitcast double* %c0_y1714 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1123) #6
  %arrayidx1715 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  %1124 = load double, double* %arrayidx1715, align 8
  store double %1124, double* %c0_y1714, align 8
  %1125 = load double, double* %c0_x1712, align 8
  %arrayidx1716 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  %1126 = load double, double* %arrayidx1716, align 8
  %add1717 = fadd double %1125, %1126
  %arrayidx1718 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 0
  store double %add1717, double* %arrayidx1718, align 8
  %1127 = load double, double* %c0_y1714, align 8
  %arrayidx1719 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %1128 = load double, double* %arrayidx1719, align 8
  %add1720 = fadd double %1127, %1128
  %arrayidx1721 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 0
  store double %add1720, double* %arrayidx1721, align 8
  %1129 = load double, double* %c0_x1712, align 8
  %arrayidx1722 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  %1130 = load double, double* %arrayidx1722, align 8
  %sub1723 = fsub double %1129, %1130
  %arrayidx1724 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 1
  store double %sub1723, double* %arrayidx1724, align 8
  %1131 = load double, double* %c0_y1714, align 8
  %arrayidx1725 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  %1132 = load double, double* %arrayidx1725, align 8
  %sub1726 = fsub double %1131, %1132
  %arrayidx1727 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 1
  store double %sub1726, double* %arrayidx1727, align 8
  %1133 = bitcast double* %c0_y1714 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1133) #6
  %1134 = bitcast double* %c0_x1712 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1134) #6
  %1135 = bitcast double* %c0_x1728 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1135) #6
  %arrayidx1729 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  %1136 = load double, double* %arrayidx1729, align 8
  store double %1136, double* %c0_x1728, align 8
  %1137 = bitcast double* %c0_y1730 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1137) #6
  %arrayidx1731 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  %1138 = load double, double* %arrayidx1731, align 8
  store double %1138, double* %c0_y1730, align 8
  %1139 = load double, double* %c0_x1728, align 8
  %arrayidx1732 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %1140 = load double, double* %arrayidx1732, align 8
  %add1733 = fadd double %1139, %1140
  %arrayidx1734 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 2
  store double %add1733, double* %arrayidx1734, align 8
  %1141 = load double, double* %c0_y1730, align 8
  %arrayidx1735 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %1142 = load double, double* %arrayidx1735, align 8
  %add1736 = fadd double %1141, %1142
  %arrayidx1737 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 2
  store double %add1736, double* %arrayidx1737, align 8
  %1143 = load double, double* %c0_x1728, align 8
  %arrayidx1738 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  %1144 = load double, double* %arrayidx1738, align 8
  %sub1739 = fsub double %1143, %1144
  %arrayidx1740 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 3
  store double %sub1739, double* %arrayidx1740, align 8
  %1145 = load double, double* %c0_y1730, align 8
  %arrayidx1741 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  %1146 = load double, double* %arrayidx1741, align 8
  %sub1742 = fsub double %1145, %1146
  %arrayidx1743 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 3
  store double %sub1742, double* %arrayidx1743, align 8
  %1147 = bitcast double* %c0_y1730 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1147) #6
  %1148 = bitcast double* %c0_x1728 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1148) #6
  %1149 = bitcast double* %tmp1667 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1149) #6
  %1150 = bitcast double* %exp_1_44_y1666 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1150) #6
  %1151 = bitcast double* %exp_1_44_x1665 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1151) #6
  %1152 = bitcast double* %exp_1_44_x1744 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1152) #6
  %1153 = bitcast double* %exp_1_44_y1745 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1153) #6
  %1154 = bitcast double* %tmp1746 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1154) #6
  store double 0.000000e+00, double* %exp_1_44_x1744, align 8
  store double -1.000000e+00, double* %exp_1_44_y1745, align 8
  %1155 = bitcast double* %c0_x1747 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1155) #6
  %arrayidx1748 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  %1156 = load double, double* %arrayidx1748, align 8
  store double %1156, double* %c0_x1747, align 8
  %1157 = bitcast double* %c0_y1749 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1157) #6
  %arrayidx1750 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %1158 = load double, double* %arrayidx1750, align 8
  store double %1158, double* %c0_y1749, align 8
  %1159 = load double, double* %c0_x1747, align 8
  %arrayidx1751 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %1160 = load double, double* %arrayidx1751, align 8
  %add1752 = fadd double %1159, %1160
  %arrayidx1753 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  store double %add1752, double* %arrayidx1753, align 8
  %1161 = load double, double* %c0_y1749, align 8
  %arrayidx1754 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %1162 = load double, double* %arrayidx1754, align 8
  %add1755 = fadd double %1161, %1162
  %arrayidx1756 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  store double %add1755, double* %arrayidx1756, align 8
  %1163 = load double, double* %c0_x1747, align 8
  %arrayidx1757 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %1164 = load double, double* %arrayidx1757, align 8
  %sub1758 = fsub double %1163, %1164
  %arrayidx1759 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  store double %sub1758, double* %arrayidx1759, align 8
  %1165 = load double, double* %c0_y1749, align 8
  %arrayidx1760 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %1166 = load double, double* %arrayidx1760, align 8
  %sub1761 = fsub double %1165, %1166
  %arrayidx1762 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %sub1761, double* %arrayidx1762, align 8
  %1167 = bitcast double* %c0_y1749 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1167) #6
  %1168 = bitcast double* %c0_x1747 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1168) #6
  %1169 = bitcast double* %c0_x1763 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1169) #6
  %arrayidx1764 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %1170 = load double, double* %arrayidx1764, align 8
  store double %1170, double* %c0_x1763, align 8
  %1171 = bitcast double* %c0_y1765 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1171) #6
  %arrayidx1766 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %1172 = load double, double* %arrayidx1766, align 8
  store double %1172, double* %c0_y1765, align 8
  %1173 = load double, double* %c0_x1763, align 8
  %arrayidx1767 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %1174 = load double, double* %arrayidx1767, align 8
  %add1768 = fadd double %1173, %1174
  %arrayidx1769 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  store double %add1768, double* %arrayidx1769, align 8
  %1175 = load double, double* %c0_y1765, align 8
  %arrayidx1770 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %1176 = load double, double* %arrayidx1770, align 8
  %add1771 = fadd double %1175, %1176
  %arrayidx1772 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %add1771, double* %arrayidx1772, align 8
  %1177 = load double, double* %c0_x1763, align 8
  %arrayidx1773 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %1178 = load double, double* %arrayidx1773, align 8
  %sub1774 = fsub double %1177, %1178
  %arrayidx1775 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %sub1774, double* %arrayidx1775, align 8
  %1179 = load double, double* %c0_y1765, align 8
  %arrayidx1776 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %1180 = load double, double* %arrayidx1776, align 8
  %sub1777 = fsub double %1179, %1180
  %arrayidx1778 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %sub1777, double* %arrayidx1778, align 8
  %1181 = bitcast double* %c0_y1765 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1181) #6
  %1182 = bitcast double* %c0_x1763 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1182) #6
  %arrayidx1779 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %1183 = load double, double* %arrayidx1779, align 8
  store double %1183, double* %tmp1746, align 8
  %arrayidx1780 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %1184 = load double, double* %arrayidx1780, align 8
  %1185 = load double, double* %exp_1_44_x1744, align 8
  %mul1781 = fmul double %1184, %1185
  %arrayidx1782 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %1186 = load double, double* %arrayidx1782, align 8
  %1187 = load double, double* %exp_1_44_y1745, align 8
  %mul1783 = fmul double %1186, %1187
  %sub1784 = fsub double %mul1781, %mul1783
  %arrayidx1785 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %sub1784, double* %arrayidx1785, align 8
  %1188 = load double, double* %tmp1746, align 8
  %1189 = load double, double* %exp_1_44_y1745, align 8
  %mul1786 = fmul double %1188, %1189
  %arrayidx1787 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %1190 = load double, double* %arrayidx1787, align 8
  %1191 = load double, double* %exp_1_44_x1744, align 8
  %mul1788 = fmul double %1190, %1191
  %sub1789 = fsub double %mul1786, %mul1788
  %arrayidx1790 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %sub1789, double* %arrayidx1790, align 8
  %1192 = bitcast double* %c0_x1791 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1192) #6
  %arrayidx1792 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  %1193 = load double, double* %arrayidx1792, align 8
  store double %1193, double* %c0_x1791, align 8
  %1194 = bitcast double* %c0_y1793 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1194) #6
  %arrayidx1794 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  %1195 = load double, double* %arrayidx1794, align 8
  store double %1195, double* %c0_y1793, align 8
  %1196 = load double, double* %c0_x1791, align 8
  %arrayidx1795 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %1197 = load double, double* %arrayidx1795, align 8
  %add1796 = fadd double %1196, %1197
  %arrayidx1797 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 4
  store double %add1796, double* %arrayidx1797, align 8
  %1198 = load double, double* %c0_y1793, align 8
  %arrayidx1798 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %1199 = load double, double* %arrayidx1798, align 8
  %add1799 = fadd double %1198, %1199
  %arrayidx1800 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 4
  store double %add1799, double* %arrayidx1800, align 8
  %1200 = load double, double* %c0_x1791, align 8
  %arrayidx1801 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  %1201 = load double, double* %arrayidx1801, align 8
  %sub1802 = fsub double %1200, %1201
  %arrayidx1803 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 5
  store double %sub1802, double* %arrayidx1803, align 8
  %1202 = load double, double* %c0_y1793, align 8
  %arrayidx1804 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  %1203 = load double, double* %arrayidx1804, align 8
  %sub1805 = fsub double %1202, %1203
  %arrayidx1806 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 5
  store double %sub1805, double* %arrayidx1806, align 8
  %1204 = bitcast double* %c0_y1793 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1204) #6
  %1205 = bitcast double* %c0_x1791 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1205) #6
  %1206 = bitcast double* %c0_x1807 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1206) #6
  %arrayidx1808 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  %1207 = load double, double* %arrayidx1808, align 8
  store double %1207, double* %c0_x1807, align 8
  %1208 = bitcast double* %c0_y1809 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1208) #6
  %arrayidx1810 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  %1209 = load double, double* %arrayidx1810, align 8
  store double %1209, double* %c0_y1809, align 8
  %1210 = load double, double* %c0_x1807, align 8
  %arrayidx1811 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %1211 = load double, double* %arrayidx1811, align 8
  %add1812 = fadd double %1210, %1211
  %arrayidx1813 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 6
  store double %add1812, double* %arrayidx1813, align 8
  %1212 = load double, double* %c0_y1809, align 8
  %arrayidx1814 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %1213 = load double, double* %arrayidx1814, align 8
  %add1815 = fadd double %1212, %1213
  %arrayidx1816 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 6
  store double %add1815, double* %arrayidx1816, align 8
  %1214 = load double, double* %c0_x1807, align 8
  %arrayidx1817 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  %1215 = load double, double* %arrayidx1817, align 8
  %sub1818 = fsub double %1214, %1215
  %arrayidx1819 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 7
  store double %sub1818, double* %arrayidx1819, align 8
  %1216 = load double, double* %c0_y1809, align 8
  %arrayidx1820 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  %1217 = load double, double* %arrayidx1820, align 8
  %sub1821 = fsub double %1216, %1217
  %arrayidx1822 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 7
  store double %sub1821, double* %arrayidx1822, align 8
  %1218 = bitcast double* %c0_y1809 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1218) #6
  %1219 = bitcast double* %c0_x1807 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1219) #6
  %1220 = bitcast double* %tmp1746 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1220) #6
  %1221 = bitcast double* %exp_1_44_y1745 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1221) #6
  %1222 = bitcast double* %exp_1_44_x1744 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1222) #6
  %1223 = bitcast double* %tmp_11560 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1223) #6
  %1224 = bitcast double* %exp_3_8_y1559 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1224) #6
  %1225 = bitcast double* %exp_1_4_y1558 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1225) #6
  %1226 = bitcast double* %exp_1_8_y1557 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1226) #6
  %1227 = bitcast double* %exp_3_8_x1556 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1227) #6
  %1228 = bitcast double* %exp_1_4_x1555 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1228) #6
  %1229 = bitcast double* %exp_1_8_x1554 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %1229) #6
  %1230 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 0), align 4
  %idxprom1823 = sext i32 %1230 to i64
  %arrayidx1824 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 %idxprom1823
  %1231 = load double, double* %arrayidx1824, align 8
  %1232 = load double*, double** %work_x.addr, align 8
  %1233 = load i32, i32* %stride, align 4
  %mul1825 = mul nsw i32 0, %1233
  %1234 = load i32, i32* %tid, align 4
  %add1826 = add nsw i32 %mul1825, %1234
  %idxprom1827 = sext i32 %add1826 to i64
  %arrayidx1828 = getelementptr inbounds double, double* %1232, i64 %idxprom1827
  store double %1231, double* %arrayidx1828, align 8
  %1235 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 1), align 4
  %idxprom1829 = sext i32 %1235 to i64
  %arrayidx1830 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 %idxprom1829
  %1236 = load double, double* %arrayidx1830, align 8
  %1237 = load double*, double** %work_x.addr, align 8
  %1238 = load i32, i32* %stride, align 4
  %mul1831 = mul nsw i32 1, %1238
  %1239 = load i32, i32* %tid, align 4
  %add1832 = add nsw i32 %mul1831, %1239
  %idxprom1833 = sext i32 %add1832 to i64
  %arrayidx1834 = getelementptr inbounds double, double* %1237, i64 %idxprom1833
  store double %1236, double* %arrayidx1834, align 8
  %1240 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 2), align 4
  %idxprom1835 = sext i32 %1240 to i64
  %arrayidx1836 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 %idxprom1835
  %1241 = load double, double* %arrayidx1836, align 8
  %1242 = load double*, double** %work_x.addr, align 8
  %1243 = load i32, i32* %stride, align 4
  %mul1837 = mul nsw i32 2, %1243
  %1244 = load i32, i32* %tid, align 4
  %add1838 = add nsw i32 %mul1837, %1244
  %idxprom1839 = sext i32 %add1838 to i64
  %arrayidx1840 = getelementptr inbounds double, double* %1242, i64 %idxprom1839
  store double %1241, double* %arrayidx1840, align 8
  %1245 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 3), align 4
  %idxprom1841 = sext i32 %1245 to i64
  %arrayidx1842 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 %idxprom1841
  %1246 = load double, double* %arrayidx1842, align 8
  %1247 = load double*, double** %work_x.addr, align 8
  %1248 = load i32, i32* %stride, align 4
  %mul1843 = mul nsw i32 3, %1248
  %1249 = load i32, i32* %tid, align 4
  %add1844 = add nsw i32 %mul1843, %1249
  %idxprom1845 = sext i32 %add1844 to i64
  %arrayidx1846 = getelementptr inbounds double, double* %1247, i64 %idxprom1845
  store double %1246, double* %arrayidx1846, align 8
  %1250 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 4), align 4
  %idxprom1847 = sext i32 %1250 to i64
  %arrayidx1848 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 %idxprom1847
  %1251 = load double, double* %arrayidx1848, align 8
  %1252 = load double*, double** %work_x.addr, align 8
  %1253 = load i32, i32* %stride, align 4
  %mul1849 = mul nsw i32 4, %1253
  %1254 = load i32, i32* %tid, align 4
  %add1850 = add nsw i32 %mul1849, %1254
  %idxprom1851 = sext i32 %add1850 to i64
  %arrayidx1852 = getelementptr inbounds double, double* %1252, i64 %idxprom1851
  store double %1251, double* %arrayidx1852, align 8
  %1255 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 5), align 4
  %idxprom1853 = sext i32 %1255 to i64
  %arrayidx1854 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 %idxprom1853
  %1256 = load double, double* %arrayidx1854, align 8
  %1257 = load double*, double** %work_x.addr, align 8
  %1258 = load i32, i32* %stride, align 4
  %mul1855 = mul nsw i32 5, %1258
  %1259 = load i32, i32* %tid, align 4
  %add1856 = add nsw i32 %mul1855, %1259
  %idxprom1857 = sext i32 %add1856 to i64
  %arrayidx1858 = getelementptr inbounds double, double* %1257, i64 %idxprom1857
  store double %1256, double* %arrayidx1858, align 8
  %1260 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 6), align 4
  %idxprom1859 = sext i32 %1260 to i64
  %arrayidx1860 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 %idxprom1859
  %1261 = load double, double* %arrayidx1860, align 8
  %1262 = load double*, double** %work_x.addr, align 8
  %1263 = load i32, i32* %stride, align 4
  %mul1861 = mul nsw i32 6, %1263
  %1264 = load i32, i32* %tid, align 4
  %add1862 = add nsw i32 %mul1861, %1264
  %idxprom1863 = sext i32 %add1862 to i64
  %arrayidx1864 = getelementptr inbounds double, double* %1262, i64 %idxprom1863
  store double %1261, double* %arrayidx1864, align 8
  %1265 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 7), align 4
  %idxprom1865 = sext i32 %1265 to i64
  %arrayidx1866 = getelementptr inbounds [8 x double], [8 x double]* %data_x, i64 0, i64 %idxprom1865
  %1266 = load double, double* %arrayidx1866, align 8
  %1267 = load double*, double** %work_x.addr, align 8
  %1268 = load i32, i32* %stride, align 4
  %mul1867 = mul nsw i32 7, %1268
  %1269 = load i32, i32* %tid, align 4
  %add1868 = add nsw i32 %mul1867, %1269
  %idxprom1869 = sext i32 %add1868 to i64
  %arrayidx1870 = getelementptr inbounds double, double* %1267, i64 %idxprom1869
  store double %1266, double* %arrayidx1870, align 8
  %1270 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 0), align 4
  %idxprom1871 = sext i32 %1270 to i64
  %arrayidx1872 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 %idxprom1871
  %1271 = load double, double* %arrayidx1872, align 8
  %1272 = load double*, double** %work_y.addr, align 8
  %1273 = load i32, i32* %stride, align 4
  %mul1873 = mul nsw i32 0, %1273
  %1274 = load i32, i32* %tid, align 4
  %add1874 = add nsw i32 %mul1873, %1274
  %idxprom1875 = sext i32 %add1874 to i64
  %arrayidx1876 = getelementptr inbounds double, double* %1272, i64 %idxprom1875
  store double %1271, double* %arrayidx1876, align 8
  %1275 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 1), align 4
  %idxprom1877 = sext i32 %1275 to i64
  %arrayidx1878 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 %idxprom1877
  %1276 = load double, double* %arrayidx1878, align 8
  %1277 = load double*, double** %work_y.addr, align 8
  %1278 = load i32, i32* %stride, align 4
  %mul1879 = mul nsw i32 1, %1278
  %1279 = load i32, i32* %tid, align 4
  %add1880 = add nsw i32 %mul1879, %1279
  %idxprom1881 = sext i32 %add1880 to i64
  %arrayidx1882 = getelementptr inbounds double, double* %1277, i64 %idxprom1881
  store double %1276, double* %arrayidx1882, align 8
  %1280 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 2), align 4
  %idxprom1883 = sext i32 %1280 to i64
  %arrayidx1884 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 %idxprom1883
  %1281 = load double, double* %arrayidx1884, align 8
  %1282 = load double*, double** %work_y.addr, align 8
  %1283 = load i32, i32* %stride, align 4
  %mul1885 = mul nsw i32 2, %1283
  %1284 = load i32, i32* %tid, align 4
  %add1886 = add nsw i32 %mul1885, %1284
  %idxprom1887 = sext i32 %add1886 to i64
  %arrayidx1888 = getelementptr inbounds double, double* %1282, i64 %idxprom1887
  store double %1281, double* %arrayidx1888, align 8
  %1285 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 3), align 4
  %idxprom1889 = sext i32 %1285 to i64
  %arrayidx1890 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 %idxprom1889
  %1286 = load double, double* %arrayidx1890, align 8
  %1287 = load double*, double** %work_y.addr, align 8
  %1288 = load i32, i32* %stride, align 4
  %mul1891 = mul nsw i32 3, %1288
  %1289 = load i32, i32* %tid, align 4
  %add1892 = add nsw i32 %mul1891, %1289
  %idxprom1893 = sext i32 %add1892 to i64
  %arrayidx1894 = getelementptr inbounds double, double* %1287, i64 %idxprom1893
  store double %1286, double* %arrayidx1894, align 8
  %1290 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 4), align 4
  %idxprom1895 = sext i32 %1290 to i64
  %arrayidx1896 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 %idxprom1895
  %1291 = load double, double* %arrayidx1896, align 8
  %1292 = load double*, double** %work_y.addr, align 8
  %1293 = load i32, i32* %stride, align 4
  %mul1897 = mul nsw i32 4, %1293
  %1294 = load i32, i32* %tid, align 4
  %add1898 = add nsw i32 %mul1897, %1294
  %idxprom1899 = sext i32 %add1898 to i64
  %arrayidx1900 = getelementptr inbounds double, double* %1292, i64 %idxprom1899
  store double %1291, double* %arrayidx1900, align 8
  %1295 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 5), align 4
  %idxprom1901 = sext i32 %1295 to i64
  %arrayidx1902 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 %idxprom1901
  %1296 = load double, double* %arrayidx1902, align 8
  %1297 = load double*, double** %work_y.addr, align 8
  %1298 = load i32, i32* %stride, align 4
  %mul1903 = mul nsw i32 5, %1298
  %1299 = load i32, i32* %tid, align 4
  %add1904 = add nsw i32 %mul1903, %1299
  %idxprom1905 = sext i32 %add1904 to i64
  %arrayidx1906 = getelementptr inbounds double, double* %1297, i64 %idxprom1905
  store double %1296, double* %arrayidx1906, align 8
  %1300 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 6), align 4
  %idxprom1907 = sext i32 %1300 to i64
  %arrayidx1908 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 %idxprom1907
  %1301 = load double, double* %arrayidx1908, align 8
  %1302 = load double*, double** %work_y.addr, align 8
  %1303 = load i32, i32* %stride, align 4
  %mul1909 = mul nsw i32 6, %1303
  %1304 = load i32, i32* %tid, align 4
  %add1910 = add nsw i32 %mul1909, %1304
  %idxprom1911 = sext i32 %add1910 to i64
  %arrayidx1912 = getelementptr inbounds double, double* %1302, i64 %idxprom1911
  store double %1301, double* %arrayidx1912, align 8
  %1305 = load i32, i32* getelementptr inbounds ([8 x i32], [8 x i32]* @fft1D_512.reversed, i64 0, i64 7), align 4
  %idxprom1913 = sext i32 %1305 to i64
  %arrayidx1914 = getelementptr inbounds [8 x double], [8 x double]* %data_y, i64 0, i64 %idxprom1913
  %1306 = load double, double* %arrayidx1914, align 8
  %1307 = load double*, double** %work_y.addr, align 8
  %1308 = load i32, i32* %stride, align 4
  %mul1915 = mul nsw i32 7, %1308
  %1309 = load i32, i32* %tid, align 4
  %add1916 = add nsw i32 %mul1915, %1309
  %idxprom1917 = sext i32 %add1916 to i64
  %arrayidx1918 = getelementptr inbounds double, double* %1307, i64 %idxprom1917
  store double %1306, double* %arrayidx1918, align 8
  br label %for.inc1919

for.inc1919:                                      ; preds = %for.body1475
  %1310 = load i32, i32* %tid, align 4
  %inc1920 = add nsw i32 %1310, 1
  store i32 %inc1920, i32* %tid, align 4
  br label %for.cond1473, !llvm.loop !74

for.end1921:                                      ; preds = %for.cond1473
  %1311 = bitcast [576 x double]* %smem to i8*
  call void @llvm.lifetime.end.p0i8(i64 4608, i8* %1311) #6
  %1312 = bitcast [8 x double]* %data_y to i8*
  call void @llvm.lifetime.end.p0i8(i64 64, i8* %1312) #6
  %1313 = bitcast [8 x double]* %data_x to i8*
  call void @llvm.lifetime.end.p0i8(i64 64, i8* %1313) #6
  %1314 = bitcast [512 x double]* %DATA_y to i8*
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* %1314) #6
  %1315 = bitcast [512 x double]* %DATA_x to i8*
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* %1315) #6
  %1316 = bitcast i32* %stride to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %1316) #6
  %1317 = bitcast i32* %lo to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %1317) #6
  %1318 = bitcast i32* %hi to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %1318) #6
  %1319 = bitcast i32* %tid to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %1319) #6
  ret void
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.sideeffect() #5

declare double @cos(double)

declare double @sin(double)

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.static.pipeline"="0.-1" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.static.pipeline"="0.-1" "fpga.top.func"="fft1D_512" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="256" "xlx.source"="user" }
attributes #8 = { inaccessiblememonly nounwind "xlx.port.bitwidth"="512" "xlx.source"="user" }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{!5, !29}
!5 = !{!"fpga.inline", !"user", !6}
!6 = !DILocation(line: 17, column: 9, scope: !7)
!7 = !DILexicalBlockFile(scope: !9, file: !8, discriminator: 0)
!8 = !DIFile(filename: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/transposed_fft.tcl", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS")
!9 = distinct !DISubprogram(name: "twiddles8", scope: !10, file: !10, line: 23, type: !11, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!10 = !DIFile(filename: "data/benchmarks/transposed_fft/transposed_fft.c", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !13, !15, !15}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = distinct !DICompileUnit(language: DW_LANG_C99, file: !17, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !18, globals: !19)
!17 = !DIFile(filename: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_solutions/TRANS_FFT/solution0/.autopilot/db/transposed_fft.pp.0.c", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS")
!18 = !{}
!19 = !{!20}
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "reversed", scope: !22, file: !10, line: 116, type: !25, isLocal: true, isDefinition: true)
!22 = distinct !DISubprogram(name: "fft1D_512", scope: !10, file: !10, line: 114, type: !23, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !13, !13}
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 256, elements: !27)
!26 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!27 = !{!28}
!28 = !DISubrange(count: 8, lowerBound: 0)
!29 = !{!"fpga.static.pipeline", !"user", !30}
!30 = !DILocation(line: 14, column: 9, scope: !7)
!31 = distinct !{!31, !32}
!32 = !{!"llvm.loop.name", !"twiddles"}
!33 = !{!34, !38}
!34 = !{!"fpga.inline", !"user", !35}
!35 = !DILocation(line: 18, column: 9, scope: !36)
!36 = !DILexicalBlockFile(scope: !37, file: !8, discriminator: 0)
!37 = distinct !DISubprogram(name: "loadx8", scope: !10, file: !10, line: 92, type: !11, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!38 = !{!"fpga.static.pipeline", !"user", !39}
!39 = !DILocation(line: 15, column: 9, scope: !36)
!40 = !{!41, !45}
!41 = !{!"fpga.inline", !"user", !42}
!42 = !DILocation(line: 19, column: 9, scope: !43)
!43 = !DILexicalBlockFile(scope: !44, file: !8, discriminator: 0)
!44 = distinct !DISubprogram(name: "loady8", scope: !10, file: !10, line: 103, type: !11, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !18)
!45 = !{!"fpga.static.pipeline", !"user", !46}
!46 = !DILocation(line: 16, column: 9, scope: !43)
!47 = !{!48, !51}
!48 = !{!"fpga.static.pipeline", !"user", !49}
!49 = !DILocation(line: 13, column: 9, scope: !50)
!50 = !DILexicalBlockFile(scope: !22, file: !8, discriminator: 0)
!51 = !{!"fpga.top", !"user", !52}
!52 = !DILocation(line: 114, column: 16, scope: !53)
!53 = !DILexicalBlockFile(scope: !22, file: !10, discriminator: 0)
!54 = distinct !{!54, !55}
!55 = !{!"llvm.loop.name", !"loop1"}
!56 = distinct !{!56, !57}
!57 = !{!"llvm.loop.name", !"loop2"}
!58 = distinct !{!58, !59}
!59 = !{!"llvm.loop.name", !"loop3"}
!60 = distinct !{!60, !61}
!61 = !{!"llvm.loop.name", !"loop4"}
!62 = distinct !{!62, !63}
!63 = !{!"llvm.loop.name", !"loop5"}
!64 = distinct !{!64, !65}
!65 = !{!"llvm.loop.name", !"loop6"}
!66 = distinct !{!66, !67}
!67 = !{!"llvm.loop.name", !"loop7"}
!68 = distinct !{!68, !69}
!69 = !{!"llvm.loop.name", !"loop8"}
!70 = distinct !{!70, !71}
!71 = !{!"llvm.loop.name", !"loop9"}
!72 = distinct !{!72, !73}
!73 = !{!"llvm.loop.name", !"loop10"}
!74 = distinct !{!74, !75}
!75 = !{!"llvm.loop.name", !"loop11"}
