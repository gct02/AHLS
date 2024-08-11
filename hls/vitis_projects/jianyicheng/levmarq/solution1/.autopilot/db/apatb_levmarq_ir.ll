; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/ahls_resource_estimation/vitis_projects/levmarq/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_levmarq_ir(i32 %dummy, i32 %ny, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="1024" %dysq, i32 %npar, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="128" %g, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="128" %d, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="1024" %y, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="16384" %h) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 4096)
  %dysq_copy = bitcast i8* %malloccall to [1024 x float]*
  %g_copy = alloca [128 x float], align 512
  %d_copy = alloca [128 x float], align 512
  %malloccall1 = tail call i8* @malloc(i64 4096)
  %y_copy = bitcast i8* %malloccall1 to [1024 x float]*
  %malloccall2 = tail call i8* @malloc(i64 65536)
  %h_copy = bitcast i8* %malloccall2 to [16384 x float]*
  %0 = bitcast float* %dysq to [1024 x float]*
  %1 = bitcast float* %g to [128 x float]*
  %2 = bitcast float* %d to [128 x float]*
  %3 = bitcast float* %y to [1024 x float]*
  %4 = bitcast float* %h to [16384 x float]*
  call fastcc void @copy_in([1024 x float]* nonnull %0, [1024 x float]* %dysq_copy, [128 x float]* nonnull %1, [128 x float]* nonnull align 512 %g_copy, [128 x float]* nonnull %2, [128 x float]* nonnull align 512 %d_copy, [1024 x float]* nonnull %3, [1024 x float]* %y_copy, [16384 x float]* nonnull %4, [16384 x float]* %h_copy)
  call void @apatb_levmarq_hw(i32 %dummy, i32 %ny, [1024 x float]* %dysq_copy, i32 %npar, [128 x float]* %g_copy, [128 x float]* %d_copy, [1024 x float]* %y_copy, [16384 x float]* %h_copy)
  call void @copy_back([1024 x float]* %0, [1024 x float]* %dysq_copy, [128 x float]* %1, [128 x float]* %g_copy, [128 x float]* %2, [128 x float]* %d_copy, [1024 x float]* %3, [1024 x float]* %y_copy, [16384 x float]* %4, [16384 x float]* %h_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  tail call void @free(i8* %malloccall2)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([1024 x float]* noalias readonly, [1024 x float]* noalias, [128 x float]* noalias readonly, [128 x float]* noalias align 512, [128 x float]* noalias readonly, [128 x float]* noalias align 512, [1024 x float]* noalias readonly, [1024 x float]* noalias, [16384 x float]* noalias readonly, [16384 x float]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %1, [1024 x float]* %0)
  call fastcc void @onebyonecpy_hls.p0a128f32([128 x float]* align 512 %3, [128 x float]* %2)
  call fastcc void @onebyonecpy_hls.p0a128f32([128 x float]* align 512 %5, [128 x float]* %4)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %7, [1024 x float]* %6)
  call fastcc void @onebyonecpy_hls.p0a16384f32([16384 x float]* %9, [16384 x float]* %8)
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
define internal fastcc void @onebyonecpy_hls.p0a128f32([128 x float]* noalias align 512 %dst, [128 x float]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [128 x float]* %dst, null
  %1 = icmp eq [128 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a128f32([128 x float]* nonnull %dst, [128 x float]* nonnull %src, i64 128)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a128f32([128 x float]* %dst, [128 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [128 x float]* %src, null
  %1 = icmp eq [128 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [128 x float], [128 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [128 x float], [128 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a16384f32([16384 x float]* noalias %dst, [16384 x float]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [16384 x float]* %dst, null
  %1 = icmp eq [16384 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a16384f32([16384 x float]* nonnull %dst, [16384 x float]* nonnull %src, i64 16384)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a16384f32([16384 x float]* %dst, [16384 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [16384 x float]* %src, null
  %1 = icmp eq [16384 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [16384 x float], [16384 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [16384 x float], [16384 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @copy_out([1024 x float]* noalias, [1024 x float]* noalias readonly, [128 x float]* noalias, [128 x float]* noalias readonly align 512, [128 x float]* noalias, [128 x float]* noalias readonly align 512, [1024 x float]* noalias, [1024 x float]* noalias readonly, [16384 x float]* noalias, [16384 x float]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %0, [1024 x float]* %1)
  call fastcc void @onebyonecpy_hls.p0a128f32([128 x float]* %2, [128 x float]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a128f32([128 x float]* %4, [128 x float]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %6, [1024 x float]* %7)
  call fastcc void @onebyonecpy_hls.p0a16384f32([16384 x float]* %8, [16384 x float]* %9)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_levmarq_hw(i32, i32, [1024 x float]*, i32, [128 x float]*, [128 x float]*, [1024 x float]*, [16384 x float]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([1024 x float]* noalias, [1024 x float]* noalias readonly, [128 x float]* noalias, [128 x float]* noalias readonly align 512, [128 x float]* noalias, [128 x float]* noalias readonly align 512, [1024 x float]* noalias, [1024 x float]* noalias readonly, [16384 x float]* noalias, [16384 x float]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a128f32([128 x float]* %2, [128 x float]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a128f32([128 x float]* %4, [128 x float]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a16384f32([16384 x float]* %8, [16384 x float]* %9)
  ret void
}

define void @levmarq_hw_stub_wrapper(i32, i32, [1024 x float]*, i32, [128 x float]*, [128 x float]*, [1024 x float]*, [16384 x float]*) #5 {
entry:
  call void @copy_out([1024 x float]* null, [1024 x float]* %2, [128 x float]* null, [128 x float]* %4, [128 x float]* null, [128 x float]* %5, [1024 x float]* null, [1024 x float]* %6, [16384 x float]* null, [16384 x float]* %7)
  %8 = bitcast [1024 x float]* %2 to float*
  %9 = bitcast [128 x float]* %4 to float*
  %10 = bitcast [128 x float]* %5 to float*
  %11 = bitcast [1024 x float]* %6 to float*
  %12 = bitcast [16384 x float]* %7 to float*
  call void @levmarq_hw_stub(i32 %0, i32 %1, float* %8, i32 %3, float* %9, float* %10, float* %11, float* %12)
  call void @copy_in([1024 x float]* null, [1024 x float]* %2, [128 x float]* null, [128 x float]* %4, [128 x float]* null, [128 x float]* %5, [1024 x float]* null, [1024 x float]* %6, [16384 x float]* null, [16384 x float]* %7)
  ret void
}

declare void @levmarq_hw_stub(i32, i32, float*, i32, float*, float*, float*, float*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
