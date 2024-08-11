; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/ahls_resource_estimation/vitis_projects/matrixadd/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define float @apatb_matrixadd_ir(float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %array_0, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %array_1, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %array_2, float* noalias nocapture nonnull readnone "fpga.decayed.dim.hint"="8192" %array_3, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %array_4, float* noalias nocapture nonnull readnone "fpga.decayed.dim.hint"="8192" %array_5, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %array_6, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="8192" %array_7) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 32768)
  %array_0_copy = bitcast i8* %malloccall to [8192 x float]*
  %malloccall1 = tail call i8* @malloc(i64 32768)
  %array_1_copy = bitcast i8* %malloccall1 to [8192 x float]*
  %malloccall2 = tail call i8* @malloc(i64 32768)
  %array_2_copy = bitcast i8* %malloccall2 to [8192 x float]*
  %malloccall3 = tail call i8* @malloc(i64 32768)
  %array_3_copy = bitcast i8* %malloccall3 to [8192 x float]*
  %malloccall4 = tail call i8* @malloc(i64 32768)
  %array_4_copy = bitcast i8* %malloccall4 to [8192 x float]*
  %malloccall5 = tail call i8* @malloc(i64 32768)
  %array_5_copy = bitcast i8* %malloccall5 to [8192 x float]*
  %malloccall6 = tail call i8* @malloc(i64 32768)
  %array_6_copy = bitcast i8* %malloccall6 to [8192 x float]*
  %malloccall7 = tail call i8* @malloc(i64 32768)
  %array_7_copy = bitcast i8* %malloccall7 to [8192 x float]*
  %0 = bitcast float* %array_0 to [8192 x float]*
  %1 = bitcast float* %array_1 to [8192 x float]*
  %2 = bitcast float* %array_2 to [8192 x float]*
  %3 = bitcast float* %array_3 to [8192 x float]*
  %4 = bitcast float* %array_4 to [8192 x float]*
  %5 = bitcast float* %array_5 to [8192 x float]*
  %6 = bitcast float* %array_6 to [8192 x float]*
  %7 = bitcast float* %array_7 to [8192 x float]*
  call fastcc void @copy_in([8192 x float]* nonnull %0, [8192 x float]* %array_0_copy, [8192 x float]* nonnull %1, [8192 x float]* %array_1_copy, [8192 x float]* nonnull %2, [8192 x float]* %array_2_copy, [8192 x float]* nonnull %3, [8192 x float]* %array_3_copy, [8192 x float]* nonnull %4, [8192 x float]* %array_4_copy, [8192 x float]* nonnull %5, [8192 x float]* %array_5_copy, [8192 x float]* nonnull %6, [8192 x float]* %array_6_copy, [8192 x float]* nonnull %7, [8192 x float]* %array_7_copy)
  %8 = call float @apatb_matrixadd_hw([8192 x float]* %array_0_copy, [8192 x float]* %array_1_copy, [8192 x float]* %array_2_copy, [8192 x float]* %array_3_copy, [8192 x float]* %array_4_copy, [8192 x float]* %array_5_copy, [8192 x float]* %array_6_copy, [8192 x float]* %array_7_copy)
  call void @copy_back([8192 x float]* %0, [8192 x float]* %array_0_copy, [8192 x float]* %1, [8192 x float]* %array_1_copy, [8192 x float]* %2, [8192 x float]* %array_2_copy, [8192 x float]* %3, [8192 x float]* %array_3_copy, [8192 x float]* %4, [8192 x float]* %array_4_copy, [8192 x float]* %5, [8192 x float]* %array_5_copy, [8192 x float]* %6, [8192 x float]* %array_6_copy, [8192 x float]* %7, [8192 x float]* %array_7_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  tail call void @free(i8* %malloccall2)
  tail call void @free(i8* %malloccall3)
  tail call void @free(i8* %malloccall4)
  tail call void @free(i8* %malloccall5)
  tail call void @free(i8* %malloccall6)
  tail call void @free(i8* %malloccall7)
  ret float %8
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %1, [8192 x float]* %0)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %3, [8192 x float]* %2)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %5, [8192 x float]* %4)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %7, [8192 x float]* %6)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %9, [8192 x float]* %8)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %11, [8192 x float]* %10)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %13, [8192 x float]* %12)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %15, [8192 x float]* %14)
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
define internal fastcc void @copy_out([8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %0, [8192 x float]* %1)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %2, [8192 x float]* %3)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %4, [8192 x float]* %5)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %6, [8192 x float]* %7)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %8, [8192 x float]* %9)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %10, [8192 x float]* %11)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %12, [8192 x float]* %13)
  call fastcc void @onebyonecpy_hls.p0a8192f32([8192 x float]* %14, [8192 x float]* %15)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare float @apatb_matrixadd_hw([8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly, [8192 x float]* noalias, [8192 x float]* noalias readonly) unnamed_addr #4 {
entry:
  ret void
}

define float @matrixadd_hw_stub_wrapper([8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*, [8192 x float]*) #5 {
entry:
  call void @copy_out([8192 x float]* null, [8192 x float]* %0, [8192 x float]* null, [8192 x float]* %1, [8192 x float]* null, [8192 x float]* %2, [8192 x float]* null, [8192 x float]* %3, [8192 x float]* null, [8192 x float]* %4, [8192 x float]* null, [8192 x float]* %5, [8192 x float]* null, [8192 x float]* %6, [8192 x float]* null, [8192 x float]* %7)
  %8 = bitcast [8192 x float]* %0 to float*
  %9 = bitcast [8192 x float]* %1 to float*
  %10 = bitcast [8192 x float]* %2 to float*
  %11 = bitcast [8192 x float]* %3 to float*
  %12 = bitcast [8192 x float]* %4 to float*
  %13 = bitcast [8192 x float]* %5 to float*
  %14 = bitcast [8192 x float]* %6 to float*
  %15 = bitcast [8192 x float]* %7 to float*
  %16 = call float @matrixadd_hw_stub(float* %8, float* %9, float* %10, float* %11, float* %12, float* %13, float* %14, float* %15)
  call void @copy_in([8192 x float]* null, [8192 x float]* %0, [8192 x float]* null, [8192 x float]* %1, [8192 x float]* null, [8192 x float]* %2, [8192 x float]* null, [8192 x float]* %3, [8192 x float]* null, [8192 x float]* %4, [8192 x float]* null, [8192 x float]* %5, [8192 x float]* null, [8192 x float]* %6, [8192 x float]* null, [8192 x float]* %7)
  ret float %16
}

declare float @matrixadd_hw_stub(float*, float*, float*, float*, float*, float*, float*, float*)

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
