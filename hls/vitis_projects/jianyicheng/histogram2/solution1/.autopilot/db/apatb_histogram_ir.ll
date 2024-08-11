; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/ahls_resource_estimation/vitis_projects/histogram2/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_histogram_ir(i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %array_0, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %array_1, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %array_2, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %array_3, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %array_4, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %array_5, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %array_6, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %array_7, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="5" %results_0, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="5" %results_1, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="5" %results_2, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="5" %results_3, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="5" %results_4, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="5" %results_5, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="5" %results_6, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="5" %results_7, i32* noalias nocapture nonnull "fpga.decayed.dim.hint"="5" %results) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 16384)
  %array_0_copy = bitcast i8* %malloccall to [4096 x i32]*
  %malloccall1 = tail call i8* @malloc(i64 16384)
  %array_1_copy = bitcast i8* %malloccall1 to [4096 x i32]*
  %malloccall2 = tail call i8* @malloc(i64 16384)
  %array_2_copy = bitcast i8* %malloccall2 to [4096 x i32]*
  %malloccall3 = tail call i8* @malloc(i64 16384)
  %array_3_copy = bitcast i8* %malloccall3 to [4096 x i32]*
  %malloccall4 = tail call i8* @malloc(i64 16384)
  %array_4_copy = bitcast i8* %malloccall4 to [4096 x i32]*
  %malloccall5 = tail call i8* @malloc(i64 16384)
  %array_5_copy = bitcast i8* %malloccall5 to [4096 x i32]*
  %malloccall6 = tail call i8* @malloc(i64 16384)
  %array_6_copy = bitcast i8* %malloccall6 to [4096 x i32]*
  %malloccall7 = tail call i8* @malloc(i64 16384)
  %array_7_copy = bitcast i8* %malloccall7 to [4096 x i32]*
  %results_0_copy = alloca [5 x i32], align 512
  %results_1_copy = alloca [5 x i32], align 512
  %results_2_copy = alloca [5 x i32], align 512
  %results_3_copy = alloca [5 x i32], align 512
  %results_4_copy = alloca [5 x i32], align 512
  %results_5_copy = alloca [5 x i32], align 512
  %results_6_copy = alloca [5 x i32], align 512
  %results_7_copy = alloca [5 x i32], align 512
  %results_copy = alloca [5 x i32], align 512
  %0 = bitcast i32* %array_0 to [4096 x i32]*
  %1 = bitcast i32* %array_1 to [4096 x i32]*
  %2 = bitcast i32* %array_2 to [4096 x i32]*
  %3 = bitcast i32* %array_3 to [4096 x i32]*
  %4 = bitcast i32* %array_4 to [4096 x i32]*
  %5 = bitcast i32* %array_5 to [4096 x i32]*
  %6 = bitcast i32* %array_6 to [4096 x i32]*
  %7 = bitcast i32* %array_7 to [4096 x i32]*
  %8 = bitcast i32* %results_0 to [5 x i32]*
  %9 = bitcast i32* %results_1 to [5 x i32]*
  %10 = bitcast i32* %results_2 to [5 x i32]*
  %11 = bitcast i32* %results_3 to [5 x i32]*
  %12 = bitcast i32* %results_4 to [5 x i32]*
  %13 = bitcast i32* %results_5 to [5 x i32]*
  %14 = bitcast i32* %results_6 to [5 x i32]*
  %15 = bitcast i32* %results_7 to [5 x i32]*
  %16 = bitcast i32* %results to [5 x i32]*
  call fastcc void @copy_in([4096 x i32]* nonnull %0, [4096 x i32]* %array_0_copy, [4096 x i32]* nonnull %1, [4096 x i32]* %array_1_copy, [4096 x i32]* nonnull %2, [4096 x i32]* %array_2_copy, [4096 x i32]* nonnull %3, [4096 x i32]* %array_3_copy, [4096 x i32]* nonnull %4, [4096 x i32]* %array_4_copy, [4096 x i32]* nonnull %5, [4096 x i32]* %array_5_copy, [4096 x i32]* nonnull %6, [4096 x i32]* %array_6_copy, [4096 x i32]* nonnull %7, [4096 x i32]* %array_7_copy, [5 x i32]* nonnull %8, [5 x i32]* nonnull align 512 %results_0_copy, [5 x i32]* nonnull %9, [5 x i32]* nonnull align 512 %results_1_copy, [5 x i32]* nonnull %10, [5 x i32]* nonnull align 512 %results_2_copy, [5 x i32]* nonnull %11, [5 x i32]* nonnull align 512 %results_3_copy, [5 x i32]* nonnull %12, [5 x i32]* nonnull align 512 %results_4_copy, [5 x i32]* nonnull %13, [5 x i32]* nonnull align 512 %results_5_copy, [5 x i32]* nonnull %14, [5 x i32]* nonnull align 512 %results_6_copy, [5 x i32]* nonnull %15, [5 x i32]* nonnull align 512 %results_7_copy, [5 x i32]* nonnull %16, [5 x i32]* nonnull align 512 %results_copy)
  call void @apatb_histogram_hw([4096 x i32]* %array_0_copy, [4096 x i32]* %array_1_copy, [4096 x i32]* %array_2_copy, [4096 x i32]* %array_3_copy, [4096 x i32]* %array_4_copy, [4096 x i32]* %array_5_copy, [4096 x i32]* %array_6_copy, [4096 x i32]* %array_7_copy, [5 x i32]* %results_0_copy, [5 x i32]* %results_1_copy, [5 x i32]* %results_2_copy, [5 x i32]* %results_3_copy, [5 x i32]* %results_4_copy, [5 x i32]* %results_5_copy, [5 x i32]* %results_6_copy, [5 x i32]* %results_7_copy, [5 x i32]* %results_copy)
  call void @copy_back([4096 x i32]* %0, [4096 x i32]* %array_0_copy, [4096 x i32]* %1, [4096 x i32]* %array_1_copy, [4096 x i32]* %2, [4096 x i32]* %array_2_copy, [4096 x i32]* %3, [4096 x i32]* %array_3_copy, [4096 x i32]* %4, [4096 x i32]* %array_4_copy, [4096 x i32]* %5, [4096 x i32]* %array_5_copy, [4096 x i32]* %6, [4096 x i32]* %array_6_copy, [4096 x i32]* %7, [4096 x i32]* %array_7_copy, [5 x i32]* %8, [5 x i32]* %results_0_copy, [5 x i32]* %9, [5 x i32]* %results_1_copy, [5 x i32]* %10, [5 x i32]* %results_2_copy, [5 x i32]* %11, [5 x i32]* %results_3_copy, [5 x i32]* %12, [5 x i32]* %results_4_copy, [5 x i32]* %13, [5 x i32]* %results_5_copy, [5 x i32]* %14, [5 x i32]* %results_6_copy, [5 x i32]* %15, [5 x i32]* %results_7_copy, [5 x i32]* %16, [5 x i32]* %results_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  tail call void @free(i8* %malloccall2)
  tail call void @free(i8* %malloccall3)
  tail call void @free(i8* %malloccall4)
  tail call void @free(i8* %malloccall5)
  tail call void @free(i8* %malloccall6)
  tail call void @free(i8* %malloccall7)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [5 x i32]* noalias readonly, [5 x i32]* noalias align 512, [5 x i32]* noalias readonly, [5 x i32]* noalias align 512, [5 x i32]* noalias readonly, [5 x i32]* noalias align 512, [5 x i32]* noalias readonly, [5 x i32]* noalias align 512, [5 x i32]* noalias readonly, [5 x i32]* noalias align 512, [5 x i32]* noalias readonly, [5 x i32]* noalias align 512, [5 x i32]* noalias readonly, [5 x i32]* noalias align 512, [5 x i32]* noalias readonly, [5 x i32]* noalias align 512, [5 x i32]* noalias readonly, [5 x i32]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %1, [4096 x i32]* %0)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %3, [4096 x i32]* %2)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %5, [4096 x i32]* %4)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %7, [4096 x i32]* %6)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %9, [4096 x i32]* %8)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %11, [4096 x i32]* %10)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %13, [4096 x i32]* %12)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %15, [4096 x i32]* %14)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* align 512 %17, [5 x i32]* %16)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* align 512 %19, [5 x i32]* %18)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* align 512 %21, [5 x i32]* %20)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* align 512 %23, [5 x i32]* %22)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* align 512 %25, [5 x i32]* %24)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* align 512 %27, [5 x i32]* %26)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* align 512 %29, [5 x i32]* %28)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* align 512 %31, [5 x i32]* %30)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* align 512 %33, [5 x i32]* %32)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* noalias %dst, [4096 x i32]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [4096 x i32]* %dst, null
  %1 = icmp eq [4096 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a4096i32([4096 x i32]* nonnull %dst, [4096 x i32]* nonnull %src, i64 4096)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a4096i32([4096 x i32]* %dst, [4096 x i32]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [4096 x i32]* %src, null
  %1 = icmp eq [4096 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [4096 x i32], [4096 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [4096 x i32], [4096 x i32]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* noalias align 512 %dst, [5 x i32]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [5 x i32]* %dst, null
  %1 = icmp eq [5 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a5i32([5 x i32]* nonnull %dst, [5 x i32]* nonnull %src, i64 5)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a5i32([5 x i32]* %dst, [5 x i32]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [5 x i32]* %src, null
  %1 = icmp eq [5 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [5 x i32], [5 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [5 x i32], [5 x i32]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @copy_out([4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %0, [4096 x i32]* %1)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %2, [4096 x i32]* %3)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %4, [4096 x i32]* %5)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %6, [4096 x i32]* %7)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %8, [4096 x i32]* %9)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %10, [4096 x i32]* %11)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %12, [4096 x i32]* %13)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %14, [4096 x i32]* %15)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %16, [5 x i32]* align 512 %17)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %18, [5 x i32]* align 512 %19)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %20, [5 x i32]* align 512 %21)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %22, [5 x i32]* align 512 %23)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %24, [5 x i32]* align 512 %25)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %26, [5 x i32]* align 512 %27)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %28, [5 x i32]* align 512 %29)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %30, [5 x i32]* align 512 %31)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %32, [5 x i32]* align 512 %33)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_histogram_hw([4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [5 x i32]*, [5 x i32]*, [5 x i32]*, [5 x i32]*, [5 x i32]*, [5 x i32]*, [5 x i32]*, [5 x i32]*, [5 x i32]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512, [5 x i32]* noalias, [5 x i32]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %16, [5 x i32]* align 512 %17)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %18, [5 x i32]* align 512 %19)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %20, [5 x i32]* align 512 %21)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %22, [5 x i32]* align 512 %23)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %24, [5 x i32]* align 512 %25)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %26, [5 x i32]* align 512 %27)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %28, [5 x i32]* align 512 %29)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %30, [5 x i32]* align 512 %31)
  call fastcc void @onebyonecpy_hls.p0a5i32([5 x i32]* %32, [5 x i32]* align 512 %33)
  ret void
}

define void @histogram_hw_stub_wrapper([4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [5 x i32]*, [5 x i32]*, [5 x i32]*, [5 x i32]*, [5 x i32]*, [5 x i32]*, [5 x i32]*, [5 x i32]*, [5 x i32]*) #5 {
entry:
  call void @copy_out([4096 x i32]* null, [4096 x i32]* %0, [4096 x i32]* null, [4096 x i32]* %1, [4096 x i32]* null, [4096 x i32]* %2, [4096 x i32]* null, [4096 x i32]* %3, [4096 x i32]* null, [4096 x i32]* %4, [4096 x i32]* null, [4096 x i32]* %5, [4096 x i32]* null, [4096 x i32]* %6, [4096 x i32]* null, [4096 x i32]* %7, [5 x i32]* null, [5 x i32]* %8, [5 x i32]* null, [5 x i32]* %9, [5 x i32]* null, [5 x i32]* %10, [5 x i32]* null, [5 x i32]* %11, [5 x i32]* null, [5 x i32]* %12, [5 x i32]* null, [5 x i32]* %13, [5 x i32]* null, [5 x i32]* %14, [5 x i32]* null, [5 x i32]* %15, [5 x i32]* null, [5 x i32]* %16)
  %17 = bitcast [4096 x i32]* %0 to i32*
  %18 = bitcast [4096 x i32]* %1 to i32*
  %19 = bitcast [4096 x i32]* %2 to i32*
  %20 = bitcast [4096 x i32]* %3 to i32*
  %21 = bitcast [4096 x i32]* %4 to i32*
  %22 = bitcast [4096 x i32]* %5 to i32*
  %23 = bitcast [4096 x i32]* %6 to i32*
  %24 = bitcast [4096 x i32]* %7 to i32*
  %25 = bitcast [5 x i32]* %8 to i32*
  %26 = bitcast [5 x i32]* %9 to i32*
  %27 = bitcast [5 x i32]* %10 to i32*
  %28 = bitcast [5 x i32]* %11 to i32*
  %29 = bitcast [5 x i32]* %12 to i32*
  %30 = bitcast [5 x i32]* %13 to i32*
  %31 = bitcast [5 x i32]* %14 to i32*
  %32 = bitcast [5 x i32]* %15 to i32*
  %33 = bitcast [5 x i32]* %16 to i32*
  call void @histogram_hw_stub(i32* %17, i32* %18, i32* %19, i32* %20, i32* %21, i32* %22, i32* %23, i32* %24, i32* %25, i32* %26, i32* %27, i32* %28, i32* %29, i32* %30, i32* %31, i32* %32, i32* %33)
  call void @copy_in([4096 x i32]* null, [4096 x i32]* %0, [4096 x i32]* null, [4096 x i32]* %1, [4096 x i32]* null, [4096 x i32]* %2, [4096 x i32]* null, [4096 x i32]* %3, [4096 x i32]* null, [4096 x i32]* %4, [4096 x i32]* null, [4096 x i32]* %5, [4096 x i32]* null, [4096 x i32]* %6, [4096 x i32]* null, [4096 x i32]* %7, [5 x i32]* null, [5 x i32]* %8, [5 x i32]* null, [5 x i32]* %9, [5 x i32]* null, [5 x i32]* %10, [5 x i32]* null, [5 x i32]* %11, [5 x i32]* null, [5 x i32]* %12, [5 x i32]* null, [5 x i32]* %13, [5 x i32]* null, [5 x i32]* %14, [5 x i32]* null, [5 x i32]* %15, [5 x i32]* null, [5 x i32]* %16)
  ret void
}

declare void @histogram_hw_stub(i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*)

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
