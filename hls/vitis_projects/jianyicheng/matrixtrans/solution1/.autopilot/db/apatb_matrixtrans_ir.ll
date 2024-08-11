; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/ahls_resource_estimation/vitis_projects/matrixtrans/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_matrixtrans_ir(i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %array_0, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %array_1, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %array_2, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %array_3, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %array_4, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %array_5, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %array_6, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %array_7, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="8192" %results_0, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="8192" %results_1, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="8192" %results_2, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="8192" %results_3, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="8192" %results_4, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="8192" %results_5, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="8192" %results_6, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="8192" %results_7) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 32768)
  %array_0_copy = bitcast i8* %malloccall to [8192 x i32]*
  %malloccall1 = tail call i8* @malloc(i64 32768)
  %array_1_copy = bitcast i8* %malloccall1 to [8192 x i32]*
  %malloccall2 = tail call i8* @malloc(i64 32768)
  %array_2_copy = bitcast i8* %malloccall2 to [8192 x i32]*
  %malloccall3 = tail call i8* @malloc(i64 32768)
  %array_3_copy = bitcast i8* %malloccall3 to [8192 x i32]*
  %malloccall4 = tail call i8* @malloc(i64 32768)
  %array_4_copy = bitcast i8* %malloccall4 to [8192 x i32]*
  %malloccall5 = tail call i8* @malloc(i64 32768)
  %array_5_copy = bitcast i8* %malloccall5 to [8192 x i32]*
  %malloccall6 = tail call i8* @malloc(i64 32768)
  %array_6_copy = bitcast i8* %malloccall6 to [8192 x i32]*
  %malloccall7 = tail call i8* @malloc(i64 32768)
  %array_7_copy = bitcast i8* %malloccall7 to [8192 x i32]*
  %malloccall8 = tail call i8* @malloc(i64 32768)
  %results_0_copy = bitcast i8* %malloccall8 to [8192 x i32]*
  %malloccall9 = tail call i8* @malloc(i64 32768)
  %results_1_copy = bitcast i8* %malloccall9 to [8192 x i32]*
  %malloccall10 = tail call i8* @malloc(i64 32768)
  %results_2_copy = bitcast i8* %malloccall10 to [8192 x i32]*
  %malloccall11 = tail call i8* @malloc(i64 32768)
  %results_3_copy = bitcast i8* %malloccall11 to [8192 x i32]*
  %malloccall12 = tail call i8* @malloc(i64 32768)
  %results_4_copy = bitcast i8* %malloccall12 to [8192 x i32]*
  %malloccall13 = tail call i8* @malloc(i64 32768)
  %results_5_copy = bitcast i8* %malloccall13 to [8192 x i32]*
  %malloccall14 = tail call i8* @malloc(i64 32768)
  %results_6_copy = bitcast i8* %malloccall14 to [8192 x i32]*
  %malloccall15 = tail call i8* @malloc(i64 32768)
  %results_7_copy = bitcast i8* %malloccall15 to [8192 x i32]*
  %0 = bitcast i32* %array_0 to [8192 x i32]*
  %1 = bitcast i32* %array_1 to [8192 x i32]*
  %2 = bitcast i32* %array_2 to [8192 x i32]*
  %3 = bitcast i32* %array_3 to [8192 x i32]*
  %4 = bitcast i32* %array_4 to [8192 x i32]*
  %5 = bitcast i32* %array_5 to [8192 x i32]*
  %6 = bitcast i32* %array_6 to [8192 x i32]*
  %7 = bitcast i32* %array_7 to [8192 x i32]*
  %8 = bitcast i32* %results_0 to [8192 x i32]*
  %9 = bitcast i32* %results_1 to [8192 x i32]*
  %10 = bitcast i32* %results_2 to [8192 x i32]*
  %11 = bitcast i32* %results_3 to [8192 x i32]*
  %12 = bitcast i32* %results_4 to [8192 x i32]*
  %13 = bitcast i32* %results_5 to [8192 x i32]*
  %14 = bitcast i32* %results_6 to [8192 x i32]*
  %15 = bitcast i32* %results_7 to [8192 x i32]*
  call fastcc void @copy_in([8192 x i32]* nonnull %0, [8192 x i32]* %array_0_copy, [8192 x i32]* nonnull %1, [8192 x i32]* %array_1_copy, [8192 x i32]* nonnull %2, [8192 x i32]* %array_2_copy, [8192 x i32]* nonnull %3, [8192 x i32]* %array_3_copy, [8192 x i32]* nonnull %4, [8192 x i32]* %array_4_copy, [8192 x i32]* nonnull %5, [8192 x i32]* %array_5_copy, [8192 x i32]* nonnull %6, [8192 x i32]* %array_6_copy, [8192 x i32]* nonnull %7, [8192 x i32]* %array_7_copy, [8192 x i32]* nonnull %8, [8192 x i32]* %results_0_copy, [8192 x i32]* nonnull %9, [8192 x i32]* %results_1_copy, [8192 x i32]* nonnull %10, [8192 x i32]* %results_2_copy, [8192 x i32]* nonnull %11, [8192 x i32]* %results_3_copy, [8192 x i32]* nonnull %12, [8192 x i32]* %results_4_copy, [8192 x i32]* nonnull %13, [8192 x i32]* %results_5_copy, [8192 x i32]* nonnull %14, [8192 x i32]* %results_6_copy, [8192 x i32]* nonnull %15, [8192 x i32]* %results_7_copy)
  call void @apatb_matrixtrans_hw([8192 x i32]* %array_0_copy, [8192 x i32]* %array_1_copy, [8192 x i32]* %array_2_copy, [8192 x i32]* %array_3_copy, [8192 x i32]* %array_4_copy, [8192 x i32]* %array_5_copy, [8192 x i32]* %array_6_copy, [8192 x i32]* %array_7_copy, [8192 x i32]* %results_0_copy, [8192 x i32]* %results_1_copy, [8192 x i32]* %results_2_copy, [8192 x i32]* %results_3_copy, [8192 x i32]* %results_4_copy, [8192 x i32]* %results_5_copy, [8192 x i32]* %results_6_copy, [8192 x i32]* %results_7_copy)
  call void @copy_back([8192 x i32]* %0, [8192 x i32]* %array_0_copy, [8192 x i32]* %1, [8192 x i32]* %array_1_copy, [8192 x i32]* %2, [8192 x i32]* %array_2_copy, [8192 x i32]* %3, [8192 x i32]* %array_3_copy, [8192 x i32]* %4, [8192 x i32]* %array_4_copy, [8192 x i32]* %5, [8192 x i32]* %array_5_copy, [8192 x i32]* %6, [8192 x i32]* %array_6_copy, [8192 x i32]* %7, [8192 x i32]* %array_7_copy, [8192 x i32]* %8, [8192 x i32]* %results_0_copy, [8192 x i32]* %9, [8192 x i32]* %results_1_copy, [8192 x i32]* %10, [8192 x i32]* %results_2_copy, [8192 x i32]* %11, [8192 x i32]* %results_3_copy, [8192 x i32]* %12, [8192 x i32]* %results_4_copy, [8192 x i32]* %13, [8192 x i32]* %results_5_copy, [8192 x i32]* %14, [8192 x i32]* %results_6_copy, [8192 x i32]* %15, [8192 x i32]* %results_7_copy)
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
define internal fastcc void @copy_in([8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %1, [8192 x i32]* %0)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %3, [8192 x i32]* %2)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %5, [8192 x i32]* %4)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %7, [8192 x i32]* %6)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %9, [8192 x i32]* %8)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %11, [8192 x i32]* %10)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %13, [8192 x i32]* %12)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %15, [8192 x i32]* %14)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %17, [8192 x i32]* %16)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %19, [8192 x i32]* %18)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %21, [8192 x i32]* %20)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %23, [8192 x i32]* %22)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %25, [8192 x i32]* %24)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %27, [8192 x i32]* %26)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %29, [8192 x i32]* %28)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %31, [8192 x i32]* %30)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* noalias %dst, [8192 x i32]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [8192 x i32]* %dst, null
  %1 = icmp eq [8192 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a8192i32([8192 x i32]* nonnull %dst, [8192 x i32]* nonnull %src, i64 8192)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a8192i32([8192 x i32]* %dst, [8192 x i32]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [8192 x i32]* %src, null
  %1 = icmp eq [8192 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [8192 x i32], [8192 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [8192 x i32], [8192 x i32]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i32, i32* %src.addr, align 4
  store i32 %3, i32* %dst.addr, align 4
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %0, [8192 x i32]* %1)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %2, [8192 x i32]* %3)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %4, [8192 x i32]* %5)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %6, [8192 x i32]* %7)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %8, [8192 x i32]* %9)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %10, [8192 x i32]* %11)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %12, [8192 x i32]* %13)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %14, [8192 x i32]* %15)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %16, [8192 x i32]* %17)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %18, [8192 x i32]* %19)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %20, [8192 x i32]* %21)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %22, [8192 x i32]* %23)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %24, [8192 x i32]* %25)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %26, [8192 x i32]* %27)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %28, [8192 x i32]* %29)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %30, [8192 x i32]* %31)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_matrixtrans_hw([8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly, [8192 x i32]* noalias, [8192 x i32]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %16, [8192 x i32]* %17)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %18, [8192 x i32]* %19)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %20, [8192 x i32]* %21)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %22, [8192 x i32]* %23)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %24, [8192 x i32]* %25)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %26, [8192 x i32]* %27)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %28, [8192 x i32]* %29)
  call fastcc void @onebyonecpy_hls.p0a8192i32([8192 x i32]* %30, [8192 x i32]* %31)
  ret void
}

define void @matrixtrans_hw_stub_wrapper([8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*, [8192 x i32]*) #5 {
entry:
  call void @copy_out([8192 x i32]* null, [8192 x i32]* %0, [8192 x i32]* null, [8192 x i32]* %1, [8192 x i32]* null, [8192 x i32]* %2, [8192 x i32]* null, [8192 x i32]* %3, [8192 x i32]* null, [8192 x i32]* %4, [8192 x i32]* null, [8192 x i32]* %5, [8192 x i32]* null, [8192 x i32]* %6, [8192 x i32]* null, [8192 x i32]* %7, [8192 x i32]* null, [8192 x i32]* %8, [8192 x i32]* null, [8192 x i32]* %9, [8192 x i32]* null, [8192 x i32]* %10, [8192 x i32]* null, [8192 x i32]* %11, [8192 x i32]* null, [8192 x i32]* %12, [8192 x i32]* null, [8192 x i32]* %13, [8192 x i32]* null, [8192 x i32]* %14, [8192 x i32]* null, [8192 x i32]* %15)
  %16 = bitcast [8192 x i32]* %0 to i32*
  %17 = bitcast [8192 x i32]* %1 to i32*
  %18 = bitcast [8192 x i32]* %2 to i32*
  %19 = bitcast [8192 x i32]* %3 to i32*
  %20 = bitcast [8192 x i32]* %4 to i32*
  %21 = bitcast [8192 x i32]* %5 to i32*
  %22 = bitcast [8192 x i32]* %6 to i32*
  %23 = bitcast [8192 x i32]* %7 to i32*
  %24 = bitcast [8192 x i32]* %8 to i32*
  %25 = bitcast [8192 x i32]* %9 to i32*
  %26 = bitcast [8192 x i32]* %10 to i32*
  %27 = bitcast [8192 x i32]* %11 to i32*
  %28 = bitcast [8192 x i32]* %12 to i32*
  %29 = bitcast [8192 x i32]* %13 to i32*
  %30 = bitcast [8192 x i32]* %14 to i32*
  %31 = bitcast [8192 x i32]* %15 to i32*
  call void @matrixtrans_hw_stub(i32* %16, i32* %17, i32* %18, i32* %19, i32* %20, i32* %21, i32* %22, i32* %23, i32* %24, i32* %25, i32* %26, i32* %27, i32* %28, i32* %29, i32* %30, i32* %31)
  call void @copy_in([8192 x i32]* null, [8192 x i32]* %0, [8192 x i32]* null, [8192 x i32]* %1, [8192 x i32]* null, [8192 x i32]* %2, [8192 x i32]* null, [8192 x i32]* %3, [8192 x i32]* null, [8192 x i32]* %4, [8192 x i32]* null, [8192 x i32]* %5, [8192 x i32]* null, [8192 x i32]* %6, [8192 x i32]* null, [8192 x i32]* %7, [8192 x i32]* null, [8192 x i32]* %8, [8192 x i32]* null, [8192 x i32]* %9, [8192 x i32]* null, [8192 x i32]* %10, [8192 x i32]* null, [8192 x i32]* %11, [8192 x i32]* null, [8192 x i32]* %12, [8192 x i32]* null, [8192 x i32]* %13, [8192 x i32]* null, [8192 x i32]* %14, [8192 x i32]* null, [8192 x i32]* %15)
  ret void
}

declare void @matrixtrans_hw_stub(i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*)

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
