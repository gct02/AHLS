; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_solutions/KNN/solution0/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_md_kernel_ir(double* noalias nocapture nonnull "fpga.decayed.dim.hint"="256" %force_x, double* noalias nocapture nonnull "fpga.decayed.dim.hint"="256" %force_y, double* noalias nocapture nonnull "fpga.decayed.dim.hint"="256" %force_z, double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="256" %position_x, double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="256" %position_y, double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="256" %position_z, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %NL) local_unnamed_addr #0 {
entry:
  %force_x_copy = alloca [256 x double], align 512
  %force_y_copy = alloca [256 x double], align 512
  %force_z_copy = alloca [256 x double], align 512
  %position_x_copy = alloca [256 x double], align 512
  %position_y_copy = alloca [256 x double], align 512
  %position_z_copy = alloca [256 x double], align 512
  %malloccall = tail call i8* @malloc(i64 16384)
  %NL_copy = bitcast i8* %malloccall to [4096 x i32]*
  %0 = bitcast double* %force_x to [256 x double]*
  %1 = bitcast double* %force_y to [256 x double]*
  %2 = bitcast double* %force_z to [256 x double]*
  %3 = bitcast double* %position_x to [256 x double]*
  %4 = bitcast double* %position_y to [256 x double]*
  %5 = bitcast double* %position_z to [256 x double]*
  %6 = bitcast i32* %NL to [4096 x i32]*
  call fastcc void @copy_in([256 x double]* nonnull %0, [256 x double]* nonnull align 512 %force_x_copy, [256 x double]* nonnull %1, [256 x double]* nonnull align 512 %force_y_copy, [256 x double]* nonnull %2, [256 x double]* nonnull align 512 %force_z_copy, [256 x double]* nonnull %3, [256 x double]* nonnull align 512 %position_x_copy, [256 x double]* nonnull %4, [256 x double]* nonnull align 512 %position_y_copy, [256 x double]* nonnull %5, [256 x double]* nonnull align 512 %position_z_copy, [4096 x i32]* nonnull %6, [4096 x i32]* %NL_copy)
  call void @apatb_md_kernel_hw([256 x double]* %force_x_copy, [256 x double]* %force_y_copy, [256 x double]* %force_z_copy, [256 x double]* %position_x_copy, [256 x double]* %position_y_copy, [256 x double]* %position_z_copy, [4096 x i32]* %NL_copy)
  call void @copy_back([256 x double]* %0, [256 x double]* %force_x_copy, [256 x double]* %1, [256 x double]* %force_y_copy, [256 x double]* %2, [256 x double]* %force_z_copy, [256 x double]* %3, [256 x double]* %position_x_copy, [256 x double]* %4, [256 x double]* %position_y_copy, [256 x double]* %5, [256 x double]* %position_z_copy, [4096 x i32]* %6, [4096 x i32]* %NL_copy)
  tail call void @free(i8* %malloccall)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([256 x double]* noalias readonly, [256 x double]* noalias align 512, [256 x double]* noalias readonly, [256 x double]* noalias align 512, [256 x double]* noalias readonly, [256 x double]* noalias align 512, [256 x double]* noalias readonly, [256 x double]* noalias align 512, [256 x double]* noalias readonly, [256 x double]* noalias align 512, [256 x double]* noalias readonly, [256 x double]* noalias align 512, [4096 x i32]* noalias readonly, [4096 x i32]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* align 512 %1, [256 x double]* %0)
  call fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* align 512 %3, [256 x double]* %2)
  call fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* align 512 %5, [256 x double]* %4)
  call fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* align 512 %7, [256 x double]* %6)
  call fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* align 512 %9, [256 x double]* %8)
  call fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* align 512 %11, [256 x double]* %10)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %13, [4096 x i32]* %12)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* noalias align 512 %dst, [256 x double]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [256 x double]* %dst, null
  %1 = icmp eq [256 x double]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a256f64([256 x double]* nonnull %dst, [256 x double]* nonnull %src, i64 256)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a256f64([256 x double]* %dst, [256 x double]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [256 x double]* %src, null
  %1 = icmp eq [256 x double]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [256 x double], [256 x double]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [256 x double], [256 x double]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @copy_out([256 x double]* noalias, [256 x double]* noalias readonly align 512, [256 x double]* noalias, [256 x double]* noalias readonly align 512, [256 x double]* noalias, [256 x double]* noalias readonly align 512, [256 x double]* noalias, [256 x double]* noalias readonly align 512, [256 x double]* noalias, [256 x double]* noalias readonly align 512, [256 x double]* noalias, [256 x double]* noalias readonly align 512, [4096 x i32]* noalias, [4096 x i32]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* %0, [256 x double]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* %2, [256 x double]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* %4, [256 x double]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* %6, [256 x double]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* %8, [256 x double]* align 512 %9)
  call fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* %10, [256 x double]* align 512 %11)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %12, [4096 x i32]* %13)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_md_kernel_hw([256 x double]*, [256 x double]*, [256 x double]*, [256 x double]*, [256 x double]*, [256 x double]*, [4096 x i32]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([256 x double]* noalias, [256 x double]* noalias readonly align 512, [256 x double]* noalias, [256 x double]* noalias readonly align 512, [256 x double]* noalias, [256 x double]* noalias readonly align 512, [256 x double]* noalias, [256 x double]* noalias readonly align 512, [256 x double]* noalias, [256 x double]* noalias readonly align 512, [256 x double]* noalias, [256 x double]* noalias readonly align 512, [4096 x i32]* noalias, [4096 x i32]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* %0, [256 x double]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* %2, [256 x double]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a256f64([256 x double]* %4, [256 x double]* align 512 %5)
  ret void
}

define void @md_kernel_hw_stub_wrapper([256 x double]*, [256 x double]*, [256 x double]*, [256 x double]*, [256 x double]*, [256 x double]*, [4096 x i32]*) #5 {
entry:
  call void @copy_out([256 x double]* null, [256 x double]* %0, [256 x double]* null, [256 x double]* %1, [256 x double]* null, [256 x double]* %2, [256 x double]* null, [256 x double]* %3, [256 x double]* null, [256 x double]* %4, [256 x double]* null, [256 x double]* %5, [4096 x i32]* null, [4096 x i32]* %6)
  %7 = bitcast [256 x double]* %0 to double*
  %8 = bitcast [256 x double]* %1 to double*
  %9 = bitcast [256 x double]* %2 to double*
  %10 = bitcast [256 x double]* %3 to double*
  %11 = bitcast [256 x double]* %4 to double*
  %12 = bitcast [256 x double]* %5 to double*
  %13 = bitcast [4096 x i32]* %6 to i32*
  call void @md_kernel_hw_stub(double* %7, double* %8, double* %9, double* %10, double* %11, double* %12, i32* %13)
  call void @copy_in([256 x double]* null, [256 x double]* %0, [256 x double]* null, [256 x double]* %1, [256 x double]* null, [256 x double]* %2, [256 x double]* null, [256 x double]* %3, [256 x double]* null, [256 x double]* %4, [256 x double]* null, [256 x double]* %5, [4096 x i32]* null, [4096 x i32]* %6)
  ret void
}

declare void @md_kernel_hw_stub(double*, double*, double*, double*, double*, double*, i32*)

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
