; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_instances/GRAMSCHMIDT/solution0/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_kernel_gramschmidt_ir(i32 %ni, i32 %nj, [512 x double]* noalias nocapture nonnull "fpga.decayed.dim.hint"="512" %A, [512 x double]* noalias nocapture nonnull "fpga.decayed.dim.hint"="512" %R, [512 x double]* noalias nocapture nonnull "fpga.decayed.dim.hint"="512" %Q) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 2097152)
  %A_copy = bitcast i8* %malloccall to [512 x [512 x double]]*
  %malloccall1 = tail call i8* @malloc(i64 2097152)
  %R_copy = bitcast i8* %malloccall1 to [512 x [512 x double]]*
  %malloccall2 = tail call i8* @malloc(i64 2097152)
  %Q_copy = bitcast i8* %malloccall2 to [512 x [512 x double]]*
  %0 = bitcast [512 x double]* %A to [512 x [512 x double]]*
  %1 = bitcast [512 x double]* %R to [512 x [512 x double]]*
  %2 = bitcast [512 x double]* %Q to [512 x [512 x double]]*
  call fastcc void @copy_in([512 x [512 x double]]* nonnull %0, [512 x [512 x double]]* %A_copy, [512 x [512 x double]]* nonnull %1, [512 x [512 x double]]* %R_copy, [512 x [512 x double]]* nonnull %2, [512 x [512 x double]]* %Q_copy)
  call void @apatb_kernel_gramschmidt_hw(i32 %ni, i32 %nj, [512 x [512 x double]]* %A_copy, [512 x [512 x double]]* %R_copy, [512 x [512 x double]]* %Q_copy)
  call void @copy_back([512 x [512 x double]]* %0, [512 x [512 x double]]* %A_copy, [512 x [512 x double]]* %1, [512 x [512 x double]]* %R_copy, [512 x [512 x double]]* %2, [512 x [512 x double]]* %Q_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  tail call void @free(i8* %malloccall2)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([512 x [512 x double]]* noalias readonly, [512 x [512 x double]]* noalias, [512 x [512 x double]]* noalias readonly, [512 x [512 x double]]* noalias, [512 x [512 x double]]* noalias readonly, [512 x [512 x double]]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a512a512f64([512 x [512 x double]]* %1, [512 x [512 x double]]* %0)
  call fastcc void @onebyonecpy_hls.p0a512a512f64([512 x [512 x double]]* %3, [512 x [512 x double]]* %2)
  call fastcc void @onebyonecpy_hls.p0a512a512f64([512 x [512 x double]]* %5, [512 x [512 x double]]* %4)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a512a512f64([512 x [512 x double]]* noalias %dst, [512 x [512 x double]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [512 x [512 x double]]* %dst, null
  %1 = icmp eq [512 x [512 x double]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a512a512f64([512 x [512 x double]]* nonnull %dst, [512 x [512 x double]]* nonnull %src, i64 512)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a512a512f64([512 x [512 x double]]* %dst, [512 x [512 x double]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [512 x [512 x double]]* %src, null
  %1 = icmp eq [512 x [512 x double]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [512 x [512 x double]], [512 x [512 x double]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [512 x [512 x double]], [512 x [512 x double]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a512f64([512 x double]* %dst.addr, [512 x double]* %src.addr, i64 512)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a512f64([512 x double]* %dst, [512 x double]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [512 x double]* %src, null
  %1 = icmp eq [512 x double]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [512 x double], [512 x double]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [512 x double], [512 x double]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @copy_out([512 x [512 x double]]* noalias, [512 x [512 x double]]* noalias readonly, [512 x [512 x double]]* noalias, [512 x [512 x double]]* noalias readonly, [512 x [512 x double]]* noalias, [512 x [512 x double]]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a512a512f64([512 x [512 x double]]* %0, [512 x [512 x double]]* %1)
  call fastcc void @onebyonecpy_hls.p0a512a512f64([512 x [512 x double]]* %2, [512 x [512 x double]]* %3)
  call fastcc void @onebyonecpy_hls.p0a512a512f64([512 x [512 x double]]* %4, [512 x [512 x double]]* %5)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_kernel_gramschmidt_hw(i32, i32, [512 x [512 x double]]*, [512 x [512 x double]]*, [512 x [512 x double]]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([512 x [512 x double]]* noalias, [512 x [512 x double]]* noalias readonly, [512 x [512 x double]]* noalias, [512 x [512 x double]]* noalias readonly, [512 x [512 x double]]* noalias, [512 x [512 x double]]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a512a512f64([512 x [512 x double]]* %0, [512 x [512 x double]]* %1)
  call fastcc void @onebyonecpy_hls.p0a512a512f64([512 x [512 x double]]* %2, [512 x [512 x double]]* %3)
  call fastcc void @onebyonecpy_hls.p0a512a512f64([512 x [512 x double]]* %4, [512 x [512 x double]]* %5)
  ret void
}

define void @kernel_gramschmidt_hw_stub_wrapper(i32, i32, [512 x [512 x double]]*, [512 x [512 x double]]*, [512 x [512 x double]]*) #5 {
entry:
  call void @copy_out([512 x [512 x double]]* null, [512 x [512 x double]]* %2, [512 x [512 x double]]* null, [512 x [512 x double]]* %3, [512 x [512 x double]]* null, [512 x [512 x double]]* %4)
  %5 = bitcast [512 x [512 x double]]* %2 to [512 x double]*
  %6 = bitcast [512 x [512 x double]]* %3 to [512 x double]*
  %7 = bitcast [512 x [512 x double]]* %4 to [512 x double]*
  call void @kernel_gramschmidt_hw_stub(i32 %0, i32 %1, [512 x double]* %5, [512 x double]* %6, [512 x double]* %7)
  call void @copy_in([512 x [512 x double]]* null, [512 x [512 x double]]* %2, [512 x [512 x double]]* null, [512 x [512 x double]]* %3, [512 x [512 x double]]* null, [512 x [512 x double]]* %4)
  ret void
}

declare void @kernel_gramschmidt_hw_stub(i32, i32, [512 x double]*, [512 x double]*, [512 x double]*)

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
