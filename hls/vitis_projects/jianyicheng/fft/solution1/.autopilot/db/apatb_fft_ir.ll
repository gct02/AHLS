; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/ahls_resource_estimation/vitis_projects/fft/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_fft_ir(float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_R_0, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_R_1, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_R_2, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_R_3, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_R_4, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_R_5, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_R_6, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_R_7, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_I_0, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_I_1, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_I_2, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_I_3, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_I_4, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_I_5, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_I_6, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %X_I_7, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="512" %cos_coefficients_table, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="512" %sin_coefficients_table) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 4096)
  %X_R_0_copy = bitcast i8* %malloccall to [1024 x float]*
  %malloccall1 = tail call i8* @malloc(i64 4096)
  %X_R_1_copy = bitcast i8* %malloccall1 to [1024 x float]*
  %malloccall2 = tail call i8* @malloc(i64 4096)
  %X_R_2_copy = bitcast i8* %malloccall2 to [1024 x float]*
  %malloccall3 = tail call i8* @malloc(i64 4096)
  %X_R_3_copy = bitcast i8* %malloccall3 to [1024 x float]*
  %malloccall4 = tail call i8* @malloc(i64 4096)
  %X_R_4_copy = bitcast i8* %malloccall4 to [1024 x float]*
  %malloccall5 = tail call i8* @malloc(i64 4096)
  %X_R_5_copy = bitcast i8* %malloccall5 to [1024 x float]*
  %malloccall6 = tail call i8* @malloc(i64 4096)
  %X_R_6_copy = bitcast i8* %malloccall6 to [1024 x float]*
  %malloccall7 = tail call i8* @malloc(i64 4096)
  %X_R_7_copy = bitcast i8* %malloccall7 to [1024 x float]*
  %malloccall8 = tail call i8* @malloc(i64 4096)
  %X_I_0_copy = bitcast i8* %malloccall8 to [1024 x float]*
  %malloccall9 = tail call i8* @malloc(i64 4096)
  %X_I_1_copy = bitcast i8* %malloccall9 to [1024 x float]*
  %malloccall10 = tail call i8* @malloc(i64 4096)
  %X_I_2_copy = bitcast i8* %malloccall10 to [1024 x float]*
  %malloccall11 = tail call i8* @malloc(i64 4096)
  %X_I_3_copy = bitcast i8* %malloccall11 to [1024 x float]*
  %malloccall12 = tail call i8* @malloc(i64 4096)
  %X_I_4_copy = bitcast i8* %malloccall12 to [1024 x float]*
  %malloccall13 = tail call i8* @malloc(i64 4096)
  %X_I_5_copy = bitcast i8* %malloccall13 to [1024 x float]*
  %malloccall14 = tail call i8* @malloc(i64 4096)
  %X_I_6_copy = bitcast i8* %malloccall14 to [1024 x float]*
  %malloccall15 = tail call i8* @malloc(i64 4096)
  %X_I_7_copy = bitcast i8* %malloccall15 to [1024 x float]*
  %cos_coefficients_table_copy = alloca [512 x float], align 512
  %sin_coefficients_table_copy = alloca [512 x float], align 512
  %0 = bitcast float* %X_R_0 to [1024 x float]*
  %1 = bitcast float* %X_R_1 to [1024 x float]*
  %2 = bitcast float* %X_R_2 to [1024 x float]*
  %3 = bitcast float* %X_R_3 to [1024 x float]*
  %4 = bitcast float* %X_R_4 to [1024 x float]*
  %5 = bitcast float* %X_R_5 to [1024 x float]*
  %6 = bitcast float* %X_R_6 to [1024 x float]*
  %7 = bitcast float* %X_R_7 to [1024 x float]*
  %8 = bitcast float* %X_I_0 to [1024 x float]*
  %9 = bitcast float* %X_I_1 to [1024 x float]*
  %10 = bitcast float* %X_I_2 to [1024 x float]*
  %11 = bitcast float* %X_I_3 to [1024 x float]*
  %12 = bitcast float* %X_I_4 to [1024 x float]*
  %13 = bitcast float* %X_I_5 to [1024 x float]*
  %14 = bitcast float* %X_I_6 to [1024 x float]*
  %15 = bitcast float* %X_I_7 to [1024 x float]*
  %16 = bitcast float* %cos_coefficients_table to [512 x float]*
  %17 = bitcast float* %sin_coefficients_table to [512 x float]*
  call fastcc void @copy_in([1024 x float]* nonnull %0, [1024 x float]* %X_R_0_copy, [1024 x float]* nonnull %1, [1024 x float]* %X_R_1_copy, [1024 x float]* nonnull %2, [1024 x float]* %X_R_2_copy, [1024 x float]* nonnull %3, [1024 x float]* %X_R_3_copy, [1024 x float]* nonnull %4, [1024 x float]* %X_R_4_copy, [1024 x float]* nonnull %5, [1024 x float]* %X_R_5_copy, [1024 x float]* nonnull %6, [1024 x float]* %X_R_6_copy, [1024 x float]* nonnull %7, [1024 x float]* %X_R_7_copy, [1024 x float]* nonnull %8, [1024 x float]* %X_I_0_copy, [1024 x float]* nonnull %9, [1024 x float]* %X_I_1_copy, [1024 x float]* nonnull %10, [1024 x float]* %X_I_2_copy, [1024 x float]* nonnull %11, [1024 x float]* %X_I_3_copy, [1024 x float]* nonnull %12, [1024 x float]* %X_I_4_copy, [1024 x float]* nonnull %13, [1024 x float]* %X_I_5_copy, [1024 x float]* nonnull %14, [1024 x float]* %X_I_6_copy, [1024 x float]* nonnull %15, [1024 x float]* %X_I_7_copy, [512 x float]* nonnull %16, [512 x float]* nonnull align 512 %cos_coefficients_table_copy, [512 x float]* nonnull %17, [512 x float]* nonnull align 512 %sin_coefficients_table_copy)
  call void @apatb_fft_hw([1024 x float]* %X_R_0_copy, [1024 x float]* %X_R_1_copy, [1024 x float]* %X_R_2_copy, [1024 x float]* %X_R_3_copy, [1024 x float]* %X_R_4_copy, [1024 x float]* %X_R_5_copy, [1024 x float]* %X_R_6_copy, [1024 x float]* %X_R_7_copy, [1024 x float]* %X_I_0_copy, [1024 x float]* %X_I_1_copy, [1024 x float]* %X_I_2_copy, [1024 x float]* %X_I_3_copy, [1024 x float]* %X_I_4_copy, [1024 x float]* %X_I_5_copy, [1024 x float]* %X_I_6_copy, [1024 x float]* %X_I_7_copy, [512 x float]* %cos_coefficients_table_copy, [512 x float]* %sin_coefficients_table_copy)
  call void @copy_back([1024 x float]* %0, [1024 x float]* %X_R_0_copy, [1024 x float]* %1, [1024 x float]* %X_R_1_copy, [1024 x float]* %2, [1024 x float]* %X_R_2_copy, [1024 x float]* %3, [1024 x float]* %X_R_3_copy, [1024 x float]* %4, [1024 x float]* %X_R_4_copy, [1024 x float]* %5, [1024 x float]* %X_R_5_copy, [1024 x float]* %6, [1024 x float]* %X_R_6_copy, [1024 x float]* %7, [1024 x float]* %X_R_7_copy, [1024 x float]* %8, [1024 x float]* %X_I_0_copy, [1024 x float]* %9, [1024 x float]* %X_I_1_copy, [1024 x float]* %10, [1024 x float]* %X_I_2_copy, [1024 x float]* %11, [1024 x float]* %X_I_3_copy, [1024 x float]* %12, [1024 x float]* %X_I_4_copy, [1024 x float]* %13, [1024 x float]* %X_I_5_copy, [1024 x float]* %14, [1024 x float]* %X_I_6_copy, [1024 x float]* %15, [1024 x float]* %X_I_7_copy, [512 x float]* %16, [512 x float]* %cos_coefficients_table_copy, [512 x float]* %17, [512 x float]* %sin_coefficients_table_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  tail call void @free(i8* %malloccall2)
  tail call void @free(i8* %malloccall3)
  tail call void @free(i8* %malloccall4)
  tail call void @free(i8* %malloccall5)
  tail call void @free(i8* %malloccall6)
  tail call void @free(i8* %malloccall7)
  tail call void @free(i8* %malloccall8)
  tail call void @free(i8* %malloccall9)
  tail call void @free(i8* %malloccall10)
  tail call void @free(i8* %malloccall11)
  tail call void @free(i8* %malloccall12)
  tail call void @free(i8* %malloccall13)
  tail call void @free(i8* %malloccall14)
  tail call void @free(i8* %malloccall15)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [512 x float]* noalias readonly, [512 x float]* noalias align 512, [512 x float]* noalias readonly, [512 x float]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %1, [1024 x float]* %0)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %3, [1024 x float]* %2)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %5, [1024 x float]* %4)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %7, [1024 x float]* %6)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %9, [1024 x float]* %8)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %11, [1024 x float]* %10)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %13, [1024 x float]* %12)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %15, [1024 x float]* %14)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %17, [1024 x float]* %16)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %19, [1024 x float]* %18)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %21, [1024 x float]* %20)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %23, [1024 x float]* %22)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %25, [1024 x float]* %24)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %27, [1024 x float]* %26)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %29, [1024 x float]* %28)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %31, [1024 x float]* %30)
  call fastcc void @onebyonecpy_hls.p0a512f32([512 x float]* align 512 %33, [512 x float]* %32)
  call fastcc void @onebyonecpy_hls.p0a512f32([512 x float]* align 512 %35, [512 x float]* %34)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* noalias %dst, [1024 x float]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [1024 x float]* %dst, null
  %1 = icmp eq [1024 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a1024f32([1024 x float]* nonnull %dst, [1024 x float]* nonnull %src, i64 1024)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1024f32([1024 x float]* %dst, [1024 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [1024 x float]* %src, null
  %1 = icmp eq [1024 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1024 x float], [1024 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1024 x float], [1024 x float]* %src, i64 0, i64 %for.loop.idx2
  %3 = load float, float* %src.addr, align 4
  store float %3, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a512f32([512 x float]* noalias align 512 %dst, [512 x float]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [512 x float]* %dst, null
  %1 = icmp eq [512 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a512f32([512 x float]* nonnull %dst, [512 x float]* nonnull %src, i64 512)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a512f32([512 x float]* %dst, [512 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [512 x float]* %src, null
  %1 = icmp eq [512 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [512 x float], [512 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [512 x float], [512 x float]* %src, i64 0, i64 %for.loop.idx2
  %3 = load float, float* %src.addr, align 4
  store float %3, float* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [512 x float]* noalias, [512 x float]* noalias readonly align 512, [512 x float]* noalias, [512 x float]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %0, [1024 x float]* %1)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %2, [1024 x float]* %3)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %4, [1024 x float]* %5)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %6, [1024 x float]* %7)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %8, [1024 x float]* %9)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %10, [1024 x float]* %11)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %12, [1024 x float]* %13)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %14, [1024 x float]* %15)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %16, [1024 x float]* %17)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %18, [1024 x float]* %19)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %20, [1024 x float]* %21)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %22, [1024 x float]* %23)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %24, [1024 x float]* %25)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %26, [1024 x float]* %27)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %28, [1024 x float]* %29)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %30, [1024 x float]* %31)
  call fastcc void @onebyonecpy_hls.p0a512f32([512 x float]* %32, [512 x float]* align 512 %33)
  call fastcc void @onebyonecpy_hls.p0a512f32([512 x float]* %34, [512 x float]* align 512 %35)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_fft_hw([1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [512 x float]*, [512 x float]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [1024 x float]* noalias, [1024 x float]* noalias readonly, [512 x float]* noalias, [512 x float]* noalias readonly align 512, [512 x float]* noalias, [512 x float]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %0, [1024 x float]* %1)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %2, [1024 x float]* %3)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %4, [1024 x float]* %5)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %6, [1024 x float]* %7)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %8, [1024 x float]* %9)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %10, [1024 x float]* %11)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %12, [1024 x float]* %13)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %14, [1024 x float]* %15)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %16, [1024 x float]* %17)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %18, [1024 x float]* %19)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %20, [1024 x float]* %21)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %22, [1024 x float]* %23)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %24, [1024 x float]* %25)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %26, [1024 x float]* %27)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %28, [1024 x float]* %29)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %30, [1024 x float]* %31)
  ret void
}

define void @fft_hw_stub_wrapper([1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [1024 x float]*, [512 x float]*, [512 x float]*) #5 {
entry:
  call void @copy_out([1024 x float]* null, [1024 x float]* %0, [1024 x float]* null, [1024 x float]* %1, [1024 x float]* null, [1024 x float]* %2, [1024 x float]* null, [1024 x float]* %3, [1024 x float]* null, [1024 x float]* %4, [1024 x float]* null, [1024 x float]* %5, [1024 x float]* null, [1024 x float]* %6, [1024 x float]* null, [1024 x float]* %7, [1024 x float]* null, [1024 x float]* %8, [1024 x float]* null, [1024 x float]* %9, [1024 x float]* null, [1024 x float]* %10, [1024 x float]* null, [1024 x float]* %11, [1024 x float]* null, [1024 x float]* %12, [1024 x float]* null, [1024 x float]* %13, [1024 x float]* null, [1024 x float]* %14, [1024 x float]* null, [1024 x float]* %15, [512 x float]* null, [512 x float]* %16, [512 x float]* null, [512 x float]* %17)
  %18 = bitcast [1024 x float]* %0 to float*
  %19 = bitcast [1024 x float]* %1 to float*
  %20 = bitcast [1024 x float]* %2 to float*
  %21 = bitcast [1024 x float]* %3 to float*
  %22 = bitcast [1024 x float]* %4 to float*
  %23 = bitcast [1024 x float]* %5 to float*
  %24 = bitcast [1024 x float]* %6 to float*
  %25 = bitcast [1024 x float]* %7 to float*
  %26 = bitcast [1024 x float]* %8 to float*
  %27 = bitcast [1024 x float]* %9 to float*
  %28 = bitcast [1024 x float]* %10 to float*
  %29 = bitcast [1024 x float]* %11 to float*
  %30 = bitcast [1024 x float]* %12 to float*
  %31 = bitcast [1024 x float]* %13 to float*
  %32 = bitcast [1024 x float]* %14 to float*
  %33 = bitcast [1024 x float]* %15 to float*
  %34 = bitcast [512 x float]* %16 to float*
  %35 = bitcast [512 x float]* %17 to float*
  call void @fft_hw_stub(float* %18, float* %19, float* %20, float* %21, float* %22, float* %23, float* %24, float* %25, float* %26, float* %27, float* %28, float* %29, float* %30, float* %31, float* %32, float* %33, float* %34, float* %35)
  call void @copy_in([1024 x float]* null, [1024 x float]* %0, [1024 x float]* null, [1024 x float]* %1, [1024 x float]* null, [1024 x float]* %2, [1024 x float]* null, [1024 x float]* %3, [1024 x float]* null, [1024 x float]* %4, [1024 x float]* null, [1024 x float]* %5, [1024 x float]* null, [1024 x float]* %6, [1024 x float]* null, [1024 x float]* %7, [1024 x float]* null, [1024 x float]* %8, [1024 x float]* null, [1024 x float]* %9, [1024 x float]* null, [1024 x float]* %10, [1024 x float]* null, [1024 x float]* %11, [1024 x float]* null, [1024 x float]* %12, [1024 x float]* null, [1024 x float]* %13, [1024 x float]* null, [1024 x float]* %14, [1024 x float]* null, [1024 x float]* %15, [512 x float]* null, [512 x float]* %16, [512 x float]* null, [512 x float]* %17)
  ret void
}

declare void @fft_hw_stub(float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
