; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/ahls_resource_estimation/vitis_projects/matrixmult/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_matrixmult_ir(float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %A_0, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %A_1, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %A_2, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %A_3, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %A_4, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %A_5, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %A_6, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %A_7, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %B_0, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %B_1, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %B_2, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %B_3, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %B_4, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %B_5, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %B_6, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %B_7, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="32" %C_0, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="32" %C_1, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="32" %C_2, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="32" %C_3, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="32" %C_4, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="32" %C_5, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="32" %C_6, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="32" %C_7) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 32768)
  %A_0_copy = bitcast i8* %malloccall to [8192 x float]*
  %malloccall1 = tail call i8* @malloc(i64 32768)
  %A_1_copy = bitcast i8* %malloccall1 to [8192 x float]*
  %malloccall2 = tail call i8* @malloc(i64 32768)
  %A_2_copy = bitcast i8* %malloccall2 to [8192 x float]*
  %malloccall3 = tail call i8* @malloc(i64 32768)
  %A_3_copy = bitcast i8* %malloccall3 to [8192 x float]*
  %malloccall4 = tail call i8* @malloc(i64 32768)
  %A_4_copy = bitcast i8* %malloccall4 to [8192 x float]*
  %malloccall5 = tail call i8* @malloc(i64 32768)
  %A_5_copy = bitcast i8* %malloccall5 to [8192 x float]*
  %malloccall6 = tail call i8* @malloc(i64 32768)
  %A_6_copy = bitcast i8* %malloccall6 to [8192 x float]*
  %malloccall7 = tail call i8* @malloc(i64 32768)
  %A_7_copy = bitcast i8* %malloccall7 to [8192 x float]*
  %malloccall8 = tail call i8* @malloc(i64 32768)
  %B_0_copy = bitcast i8* %malloccall8 to [8192 x float]*
  %malloccall9 = tail call i8* @malloc(i64 32768)
  %B_1_copy = bitcast i8* %malloccall9 to [8192 x float]*
  %malloccall10 = tail call i8* @malloc(i64 32768)
  %B_2_copy = bitcast i8* %malloccall10 to [8192 x float]*
  %malloccall11 = tail call i8* @malloc(i64 32768)
  %B_3_copy = bitcast i8* %malloccall11 to [8192 x float]*
  %malloccall12 = tail call i8* @malloc(i64 32768)
  %B_4_copy = bitcast i8* %malloccall12 to [8192 x float]*
  %malloccall13 = tail call i8* @malloc(i64 32768)
  %B_5_copy = bitcast i8* %malloccall13 to [8192 x float]*
  %malloccall14 = tail call i8* @malloc(i64 32768)
  %B_6_copy = bitcast i8* %malloccall14 to [8192 x float]*
  %malloccall15 = tail call i8* @malloc(i64 32768)
  %B_7_copy = bitcast i8* %malloccall15 to [8192 x float]*
  %C_0_copy = alloca [32 x float], align 512
  %C_1_copy = alloca [32 x float], align 512
  %C_2_copy = alloca [32 x float], align 512
  %C_3_copy = alloca [32 x float], align 512
  %C_4_copy = alloca [32 x float], align 512
  %C_5_copy = alloca [32 x float], align 512
  %C_6_copy = alloca [32 x float], align 512
  %C_7_copy = alloca [32 x float], align 512
  %0 = bitcast float* %A_0 to [8192 x float]*
  %1 = bitcast float* %A_1 to [8192 x float]*
  %2 = bitcast float* %A_2 to [8192 x float]*
  %3 = bitcast float* %A_3 to [8192 x float]*
  %4 = bitcast float* %A_4 to [8192 x float]*
  %5 = bitcast float* %A_5 to [8192 x float]*
  %6 = bitcast float* %A_6 to [8192 x float]*
  %7 = bitcast float* %A_7 to [8192 x float]*
  %8 = bitcast float* %B_0 to [8192 x float]*
  %9 = bitcast float* %B_1 to [8192 x float]*
  %10 = bitcast float* %B_2 to [8192 x float]*
  %11 = bitcast float* %B_3 to [8192 x float]*
  %12 = bitcast float* %B_4 to [8192 x float]*
  %13 = bitcast float* %B_5 to [8192 x float]*
  %14 = bitcast float* %B_6 to [8192 x float]*
  %15 = bitcast float* %B_7 to [8192 x float]*
  %16 = bitcast float* %C_0 to [32 x float]*
  %17 = bitcast float* %C_1 to [32 x float]*
  %18 = bitcast float* %C_2 to [32 x float]*
  %19 = bitcast float* %C_3 to [32 x float]*
  %20 = bitcast float* %C_4 to [32 x float]*
  %21 = bitcast float* %C_5 to [32 x float]*
  %22 = bitcast float* %C_6 to [32 x float]*
  %23 = bitcast float* %C_7 to [32 x float]*
  call fastcc void @copy_in([8192 x float]* nonnull %0, [8192 x float]* %A_0_copy, [8192 x float]* nonnull %1, [8192 x float]* %A_1_copy, [8192 x float]* nonnull %2, [8192 x float]* %A_2_copy, [8192 x float]* nonnull %3, [8192 x float]* %A_3_copy, [8192 x float]* nonnull %4, [8192 x float]* %A_4_copy, [8192 x float]* nonnull %5, [8192 x float]* %A_5_copy, [8192 x float]* nonnull %6, [8192 x float]* %A_6_copy, [8192 x float]* nonnull %7, [8192 x float]* %A_7_copy, [8192 x float]* nonnull %8, [8192 x float]* %B_0_copy, [8192 x float]* nonnull %9, [8192 x float]* %B_1_copy, [8192 x float]* nonnull %10, [8192 x float]* %B_2_copy, [8192 x float]* nonnull %11, [8192 x float]* %B_3_copy, [8192 x float]* nonnull %12, [8192 x float]* %B_4_copy, [8192 x float]* nonnull %13, [8192 x float]* %B_5_copy, [8192 x float]* nonnull %14, [8192 x float]* %B_6_copy, [8192 x float]* nonnull %15, [8192 x float]* %B_7_copy, [32 x float]* nonnull %16, [32 x float]* nonnull align 512 %C_0_copy, [32 x float]* nonnull %17, [32 x float]* nonnull align 512 %C_1_copy, [32 x float]* nonnull %18, [32 x float]* nonnull align 512 %C_2_copy, [32 x float]* nonnull %19, [32 x float]* nonnull align 512 %C_3_copy, [32 x float]* nonnull %20, [32 x float]* nonnull align 512 %C_4_copy, [32 x float]* nonnull %21, [32 x float]* nonnull align 512 %C_5_copy, [32 x float]* nonnull %22, [32 x float]* nonnull align 512 %C_6_copy, [32 x float]* nonnull %23, [32 x float]* nonnull align 512 %C_7_copy)
  call void @apatb_matrixmult_hw([8192 x float]* %A_0_copy, [8192 x float]* %A_1_copy, [8192 x float]* %A_2_copy, [8192 x float]* %A_3_copy, [8192 x float]* %A_4_copy, [8192 x float]* %A_5_copy, [8192 x float]* %A_6_copy, [8192 x float]* %A_7_copy, [8192 x float]* %B_0_copy, [8192 x float]* %B_1_copy, [8192 x float]* %B_2_copy, [8192 x float]* %B_3_copy, [8192 x float]* %B_4_copy, [8192 x float]* %B_5_copy, [8192 x float]* %B_6_copy, [8192 x float]* %B_7_copy, [32 x float]* %C_0_copy, [32 x float]* %C_1_copy, [32 x float]* %C_2_copy, [32 x float]* %C_3_copy, [32 x float]* %C_4_copy, [32 x float]* %C_5_copy, [32 x float]* %C_6_copy, [32 x float]* %C_7_copy)
  call void @copy_back([8192 x float]* %0, [8192 x float]* %A_0_copy, [8192 x float]* %1, [8192 x float]* %A_1_copy, [8192 x float]* %2, [8192 x float]* %A_2_copy, [8192 x float]* %3, [8192 x float]* %A_3_copy, [8192 x float]* %4, [8192 x float]* %A_4_copy, [8192 x float]* %5, [8192 x float]* %A_5_copy, [8192 x float]* %6, [8192 x float]* %A_6_copy, [8192 x float]* %7, [8192 x float]* %A_7_copy, [8192 x float]* %8, [8192 x float]* %B_0_copy, [8192 x float]* %9, [8192 x float]* %B_1_copy, [8192 x float]* %10, [8192 x float]* %B_2_copy, [8192 x float]* %11, [8192 x float]* %B_3_copy, [8192 x float]* %12, [8192 x float]* %B_4_copy, [8192 x float]* %13, [8192 x float]* %B_5_copy, [8192 x float]* %14, [8192 x float]* %B_6_copy, [8192 x float]* %15, [8192 x float]* %B_7_copy, [32 x float]* %16, [32 x float]* %C_0_copy, [32 x float]* %17, [32 x float]* %C_1_copy, [32 x float]* %18, [32 x float]* %C_2_copy, [32 x float]* %19, [32 x float]* %C_3_copy, [32 x float]* %20, [32 x float]* %C_4_copy, [32 x float]* %21, [32 x float]* %C_5_copy, [32 x float]* %22, [32 x float]* %C_6_copy, [32 x float]* %23, [32 x float]* %C_7_copy)
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
define internal fastcc void @copy_in([8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [32 x float]* noalias readonly, [32 x float]* noalias align 512, [32 x float]* noalias readonly, [32 x float]* noalias align 512, [32 x float]* noalias readonly, [32 x float]* noalias align 512, [32 x float]* noalias readonly, [32 x float]* noalias align 512, [32 x float]* noalias readonly, [32 x float]* noalias align 512, [32 x float]* noalias readonly, [32 x float]* noalias align 512, [32 x float]* noalias readonly, [32 x float]* noalias align 512, [32 x float]* noalias readonly, [32 x float]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %1, [8192 x float]* %0)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %3, [8192 x float]* %2)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %5, [8192 x float]* %4)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %7, [8192 x float]* %6)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %9, [8192 x float]* %8)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %11, [8192 x float]* %10)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %13, [8192 x float]* %12)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %15, [8192 x float]* %14)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %17, [8192 x float]* %16)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %19, [8192 x float]* %18)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %21, [8192 x float]* %20)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %23, [8192 x float]* %22)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %25, [8192 x float]* %24)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %27, [8192 x float]* %26)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %29, [8192 x float]* %28)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %31, [8192 x float]* %30)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* align 512 %33, [32 x float]* %32)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* align 512 %35, [32 x float]* %34)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* align 512 %37, [32 x float]* %36)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* align 512 %39, [32 x float]* %38)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* align 512 %41, [32 x float]* %40)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* align 512 %43, [32 x float]* %42)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* align 512 %45, [32 x float]* %44)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* align 512 %47, [32 x float]* %46)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* noalias %dst, [8192 x float]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [8192 x float]* %dst, null
  %1 = icmp eq [8192 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a8192f32([8192 x float]* nonnull %dst, [8192 x float]* nonnull %src, i64 8192)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a8192f32([8192 x float]* %dst, [8192 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [8192 x float]* %src, null
  %1 = icmp eq [8192 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [8192 x float], [8192 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [8192 x float], [8192 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* noalias align 512 %dst, [32 x float]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [32 x float]* %dst, null
  %1 = icmp eq [32 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a32f32([32 x float]* nonnull %dst, [32 x float]* nonnull %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a32f32([32 x float]* %dst, [32 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [32 x float]* %src, null
  %1 = icmp eq [32 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [32 x float], [32 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [32 x float], [32 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @copy_out([8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [32 x float]* noalias, [32 x float]* noalias readonly align 512, [32 x float]* noalias, [32 x float]* noalias readonly align 512, [32 x float]* noalias, [32 x float]* noalias readonly align 512, [32 x float]* noalias, [32 x float]* noalias readonly align 512, [32 x float]* noalias, [32 x float]* noalias readonly align 512, [32 x float]* noalias, [32 x float]* noalias readonly align 512, [32 x float]* noalias, [32 x float]* noalias readonly align 512, [32 x float]* noalias, [32 x float]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %0, [8192 x float]* %1)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %2, [8192 x float]* %3)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %4, [8192 x float]* %5)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %6, [8192 x float]* %7)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %8, [8192 x float]* %9)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %10, [8192 x float]* %11)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %12, [8192 x float]* %13)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %14, [8192 x float]* %15)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %16, [8192 x float]* %17)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %18, [8192 x float]* %19)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %20, [8192 x float]* %21)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %22, [8192 x float]* %23)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %24, [8192 x float]* %25)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %26, [8192 x float]* %27)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %28, [8192 x float]* %29)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %30, [8192 x float]* %31)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %32, [32 x float]* align 512 %33)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %34, [32 x float]* align 512 %35)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %36, [32 x float]* align 512 %37)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %38, [32 x float]* align 512 %39)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %40, [32 x float]* align 512 %41)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %42, [32 x float]* align 512 %43)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %44, [32 x float]* align 512 %45)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %46, [32 x float]* align 512 %47)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_matrixmult_hw([8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [32 x float]*, [32 x float]*, [32 x float]*, [32 x float]*, [32 x float]*, [32 x float]*, [32 x float]*, [32 x float]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [32 x float]* noalias, [32 x float]* noalias readonly align 512, [32 x float]* noalias, [32 x float]* noalias readonly align 512, [32 x float]* noalias, [32 x float]* noalias readonly align 512, [32 x float]* noalias, [32 x float]* noalias readonly align 512, [32 x float]* noalias, [32 x float]* noalias readonly align 512, [32 x float]* noalias, [32 x float]* noalias readonly align 512, [32 x float]* noalias, [32 x float]* noalias readonly align 512, [32 x float]* noalias, [32 x float]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %32, [32 x float]* align 512 %33)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %34, [32 x float]* align 512 %35)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %36, [32 x float]* align 512 %37)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %38, [32 x float]* align 512 %39)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %40, [32 x float]* align 512 %41)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %42, [32 x float]* align 512 %43)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %44, [32 x float]* align 512 %45)
  call fastcc void @onebyonecpy_hls.p0a32f32([32 x float]* %46, [32 x float]* align 512 %47)
  ret void
}

define void @matrixmult_hw_stub_wrapper([8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [32 x float]*, [32 x float]*, [32 x float]*, [32 x float]*, [32 x float]*, [32 x float]*, [32 x float]*, [32 x float]*) #5 {
entry:
  call void @copy_out([8192 x float]* null, [8192 x float]* %0, [8192 x float]* null, [8192 x float]* %1, [8192 x float]* null, [8192 x float]* %2, [8192 x float]* null, [8192 x float]* %3, [8192 x float]* null, [8192 x float]* %4, [8192 x float]* null, [8192 x float]* %5, [8192 x float]* null, [8192 x float]* %6, [8192 x float]* null, [8192 x float]* %7, [8192 x float]* null, [8192 x float]* %8, [8192 x float]* null, [8192 x float]* %9, [8192 x float]* null, [8192 x float]* %10, [8192 x float]* null, [8192 x float]* %11, [8192 x float]* null, [8192 x float]* %12, [8192 x float]* null, [8192 x float]* %13, [8192 x float]* null, [8192 x float]* %14, [8192 x float]* null, [8192 x float]* %15, [32 x float]* null, [32 x float]* %16, [32 x float]* null, [32 x float]* %17, [32 x float]* null, [32 x float]* %18, [32 x float]* null, [32 x float]* %19, [32 x float]* null, [32 x float]* %20, [32 x float]* null, [32 x float]* %21, [32 x float]* null, [32 x float]* %22, [32 x float]* null, [32 x float]* %23)
  %24 = bitcast [8192 x float]* %0 to float*
  %25 = bitcast [8192 x float]* %1 to float*
  %26 = bitcast [8192 x float]* %2 to float*
  %27 = bitcast [8192 x float]* %3 to float*
  %28 = bitcast [8192 x float]* %4 to float*
  %29 = bitcast [8192 x float]* %5 to float*
  %30 = bitcast [8192 x float]* %6 to float*
  %31 = bitcast [8192 x float]* %7 to float*
  %32 = bitcast [8192 x float]* %8 to float*
  %33 = bitcast [8192 x float]* %9 to float*
  %34 = bitcast [8192 x float]* %10 to float*
  %35 = bitcast [8192 x float]* %11 to float*
  %36 = bitcast [8192 x float]* %12 to float*
  %37 = bitcast [8192 x float]* %13 to float*
  %38 = bitcast [8192 x float]* %14 to float*
  %39 = bitcast [8192 x float]* %15 to float*
  %40 = bitcast [32 x float]* %16 to float*
  %41 = bitcast [32 x float]* %17 to float*
  %42 = bitcast [32 x float]* %18 to float*
  %43 = bitcast [32 x float]* %19 to float*
  %44 = bitcast [32 x float]* %20 to float*
  %45 = bitcast [32 x float]* %21 to float*
  %46 = bitcast [32 x float]* %22 to float*
  %47 = bitcast [32 x float]* %23 to float*
  call void @matrixmult_hw_stub(float* %24, float* %25, float* %26, float* %27, float* %28, float* %29, float* %30, float* %31, float* %32, float* %33, float* %34, float* %35, float* %36, float* %37, float* %38, float* %39, float* %40, float* %41, float* %42, float* %43, float* %44, float* %45, float* %46, float* %47)
  call void @copy_in([8192 x float]* null, [8192 x float]* %0, [8192 x float]* null, [8192 x float]* %1, [8192 x float]* null, [8192 x float]* %2, [8192 x float]* null, [8192 x float]* %3, [8192 x float]* null, [8192 x float]* %4, [8192 x float]* null, [8192 x float]* %5, [8192 x float]* null, [8192 x float]* %6, [8192 x float]* null, [8192 x float]* %7, [8192 x float]* null, [8192 x float]* %8, [8192 x float]* null, [8192 x float]* %9, [8192 x float]* null, [8192 x float]* %10, [8192 x float]* null, [8192 x float]* %11, [8192 x float]* null, [8192 x float]* %12, [8192 x float]* null, [8192 x float]* %13, [8192 x float]* null, [8192 x float]* %14, [8192 x float]* null, [8192 x float]* %15, [32 x float]* null, [32 x float]* %16, [32 x float]* null, [32 x float]* %17, [32 x float]* null, [32 x float]* %18, [32 x float]* null, [32 x float]* %19, [32 x float]* null, [32 x float]* %20, [32 x float]* null, [32 x float]* %21, [32 x float]* null, [32 x float]* %22, [32 x float]* null, [32 x float]* %23)
  ret void
}

declare void @matrixmult_hw_stub(float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*, float*)

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
