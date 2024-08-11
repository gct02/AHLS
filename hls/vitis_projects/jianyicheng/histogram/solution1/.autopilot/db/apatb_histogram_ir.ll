; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/ahls_resource_estimation/vitis_projects/histogram/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_histogram_ir(i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="1000" %f, double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="1000" %w, double* noalias nocapture nonnull "fpga.decayed.dim.hint"="1000" %hist) local_unnamed_addr #0 {
entry:
  %f_copy = alloca [1000 x i32], align 512
  %malloccall = tail call i8* @malloc(i64 8000)
  %w_copy = bitcast i8* %malloccall to [1000 x double]*
  %malloccall1 = tail call i8* @malloc(i64 8000)
  %hist_copy = bitcast i8* %malloccall1 to [1000 x double]*
  %0 = bitcast i32* %f to [1000 x i32]*
  %1 = bitcast double* %w to [1000 x double]*
  %2 = bitcast double* %hist to [1000 x double]*
  call fastcc void @copy_in([1000 x i32]* nonnull %0, [1000 x i32]* nonnull align 512 %f_copy, [1000 x double]* nonnull %1, [1000 x double]* %w_copy, [1000 x double]* nonnull %2, [1000 x double]* %hist_copy)
  call void @apatb_histogram_hw([1000 x i32]* %f_copy, [1000 x double]* %w_copy, [1000 x double]* %hist_copy)
  call void @copy_back([1000 x i32]* %0, [1000 x i32]* %f_copy, [1000 x double]* %1, [1000 x double]* %w_copy, [1000 x double]* %2, [1000 x double]* %hist_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([1000 x i32]* noalias readonly, [1000 x i32]* noalias align 512, [1000 x double]* noalias readonly, [1000 x double]* noalias, [1000 x double]* noalias readonly, [1000 x double]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1000i32([1000 x i32]* align 512 %1, [1000 x i32]* %0)
  call fastcc void @onebyonecpy_hls.p0a1000f64([1000 x double]* %3, [1000 x double]* %2)
  call fastcc void @onebyonecpy_hls.p0a1000f64([1000 x double]* %5, [1000 x double]* %4)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a1000i32([1000 x i32]* noalias align 512 %dst, [1000 x i32]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [1000 x i32]* %dst, null
  %1 = icmp eq [1000 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a1000i32([1000 x i32]* nonnull %dst, [1000 x i32]* nonnull %src, i64 1000)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1000i32([1000 x i32]* %dst, [1000 x i32]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [1000 x i32]* %src, null
  %1 = icmp eq [1000 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1000 x i32], [1000 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1000 x i32], [1000 x i32]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a1000f64([1000 x double]* noalias %dst, [1000 x double]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [1000 x double]* %dst, null
  %1 = icmp eq [1000 x double]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a1000f64([1000 x double]* nonnull %dst, [1000 x double]* nonnull %src, i64 1000)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1000f64([1000 x double]* %dst, [1000 x double]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [1000 x double]* %src, null
  %1 = icmp eq [1000 x double]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1000 x double], [1000 x double]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1000 x double], [1000 x double]* %src, i64 0, i64 %for.loop.idx2
  %3 = load double, double* %src.addr, align 8
  store double %3, double* %dst.addr, align 8
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([1000 x i32]* noalias, [1000 x i32]* noalias readonly align 512, [1000 x double]* noalias, [1000 x double]* noalias readonly, [1000 x double]* noalias, [1000 x double]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1000i32([1000 x i32]* %0, [1000 x i32]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a1000f64([1000 x double]* %2, [1000 x double]* %3)
  call fastcc void @onebyonecpy_hls.p0a1000f64([1000 x double]* %4, [1000 x double]* %5)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_histogram_hw([1000 x i32]*, [1000 x double]*, [1000 x double]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([1000 x i32]* noalias, [1000 x i32]* noalias readonly align 512, [1000 x double]* noalias, [1000 x double]* noalias readonly, [1000 x double]* noalias, [1000 x double]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1000f64([1000 x double]* %4, [1000 x double]* %5)
  ret void
}

define void @histogram_hw_stub_wrapper([1000 x i32]*, [1000 x double]*, [1000 x double]*) #5 {
entry:
  call void @copy_out([1000 x i32]* null, [1000 x i32]* %0, [1000 x double]* null, [1000 x double]* %1, [1000 x double]* null, [1000 x double]* %2)
  %3 = bitcast [1000 x i32]* %0 to i32*
  %4 = bitcast [1000 x double]* %1 to double*
  %5 = bitcast [1000 x double]* %2 to double*
  call void @histogram_hw_stub(i32* %3, double* %4, double* %5)
  call void @copy_in([1000 x i32]* null, [1000 x i32]* %0, [1000 x double]* null, [1000 x double]* %1, [1000 x double]* null, [1000 x double]* %2)
  ret void
}

declare void @histogram_hw_stub(i32*, double*, double*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
