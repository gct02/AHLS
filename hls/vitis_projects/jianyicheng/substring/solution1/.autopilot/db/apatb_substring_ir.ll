; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/ahls_resource_estimation/vitis_projects/substring/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define i32 @apatb_substring_ir(i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %str_0, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %str_1, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %str_2, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %str_3, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %str_4, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %str_5, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %str_6, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="4096" %str_7) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 16384)
  %str_0_copy = bitcast i8* %malloccall to [4096 x i32]*
  %malloccall1 = tail call i8* @malloc(i64 16384)
  %str_1_copy = bitcast i8* %malloccall1 to [4096 x i32]*
  %malloccall2 = tail call i8* @malloc(i64 16384)
  %str_2_copy = bitcast i8* %malloccall2 to [4096 x i32]*
  %malloccall3 = tail call i8* @malloc(i64 16384)
  %str_3_copy = bitcast i8* %malloccall3 to [4096 x i32]*
  %malloccall4 = tail call i8* @malloc(i64 16384)
  %str_4_copy = bitcast i8* %malloccall4 to [4096 x i32]*
  %malloccall5 = tail call i8* @malloc(i64 16384)
  %str_5_copy = bitcast i8* %malloccall5 to [4096 x i32]*
  %malloccall6 = tail call i8* @malloc(i64 16384)
  %str_6_copy = bitcast i8* %malloccall6 to [4096 x i32]*
  %malloccall7 = tail call i8* @malloc(i64 16384)
  %str_7_copy = bitcast i8* %malloccall7 to [4096 x i32]*
  %0 = bitcast i32* %str_0 to [4096 x i32]*
  %1 = bitcast i32* %str_1 to [4096 x i32]*
  %2 = bitcast i32* %str_2 to [4096 x i32]*
  %3 = bitcast i32* %str_3 to [4096 x i32]*
  %4 = bitcast i32* %str_4 to [4096 x i32]*
  %5 = bitcast i32* %str_5 to [4096 x i32]*
  %6 = bitcast i32* %str_6 to [4096 x i32]*
  %7 = bitcast i32* %str_7 to [4096 x i32]*
  call fastcc void @copy_in([4096 x i32]* nonnull %0, [4096 x i32]* %str_0_copy, [4096 x i32]* nonnull %1, [4096 x i32]* %str_1_copy, [4096 x i32]* nonnull %2, [4096 x i32]* %str_2_copy, [4096 x i32]* nonnull %3, [4096 x i32]* %str_3_copy, [4096 x i32]* nonnull %4, [4096 x i32]* %str_4_copy, [4096 x i32]* nonnull %5, [4096 x i32]* %str_5_copy, [4096 x i32]* nonnull %6, [4096 x i32]* %str_6_copy, [4096 x i32]* nonnull %7, [4096 x i32]* %str_7_copy)
  %8 = call i32 @apatb_substring_hw([4096 x i32]* %str_0_copy, [4096 x i32]* %str_1_copy, [4096 x i32]* %str_2_copy, [4096 x i32]* %str_3_copy, [4096 x i32]* %str_4_copy, [4096 x i32]* %str_5_copy, [4096 x i32]* %str_6_copy, [4096 x i32]* %str_7_copy)
  call void @copy_back([4096 x i32]* %0, [4096 x i32]* %str_0_copy, [4096 x i32]* %1, [4096 x i32]* %str_1_copy, [4096 x i32]* %2, [4096 x i32]* %str_2_copy, [4096 x i32]* %3, [4096 x i32]* %str_3_copy, [4096 x i32]* %4, [4096 x i32]* %str_4_copy, [4096 x i32]* %5, [4096 x i32]* %str_5_copy, [4096 x i32]* %6, [4096 x i32]* %str_6_copy, [4096 x i32]* %7, [4096 x i32]* %str_7_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  tail call void @free(i8* %malloccall2)
  tail call void @free(i8* %malloccall3)
  tail call void @free(i8* %malloccall4)
  tail call void @free(i8* %malloccall5)
  tail call void @free(i8* %malloccall6)
  tail call void @free(i8* %malloccall7)
  ret i32 %8
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %1, [4096 x i32]* %0)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %3, [4096 x i32]* %2)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %5, [4096 x i32]* %4)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %7, [4096 x i32]* %6)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %9, [4096 x i32]* %8)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %11, [4096 x i32]* %10)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %13, [4096 x i32]* %12)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %15, [4096 x i32]* %14)
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
define internal fastcc void @copy_out([4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %0, [4096 x i32]* %1)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %2, [4096 x i32]* %3)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %4, [4096 x i32]* %5)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %6, [4096 x i32]* %7)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %8, [4096 x i32]* %9)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %10, [4096 x i32]* %11)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %12, [4096 x i32]* %13)
  call fastcc void @onebyonecpy_hls.p0a4096i32([4096 x i32]* %14, [4096 x i32]* %15)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare i32 @apatb_substring_hw([4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly, [4096 x i32]* noalias, [4096 x i32]* noalias readonly) unnamed_addr #4 {
entry:
  ret void
}

define i32 @substring_hw_stub_wrapper([4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*, [4096 x i32]*) #5 {
entry:
  call void @copy_out([4096 x i32]* null, [4096 x i32]* %0, [4096 x i32]* null, [4096 x i32]* %1, [4096 x i32]* null, [4096 x i32]* %2, [4096 x i32]* null, [4096 x i32]* %3, [4096 x i32]* null, [4096 x i32]* %4, [4096 x i32]* null, [4096 x i32]* %5, [4096 x i32]* null, [4096 x i32]* %6, [4096 x i32]* null, [4096 x i32]* %7)
  %8 = bitcast [4096 x i32]* %0 to i32*
  %9 = bitcast [4096 x i32]* %1 to i32*
  %10 = bitcast [4096 x i32]* %2 to i32*
  %11 = bitcast [4096 x i32]* %3 to i32*
  %12 = bitcast [4096 x i32]* %4 to i32*
  %13 = bitcast [4096 x i32]* %5 to i32*
  %14 = bitcast [4096 x i32]* %6 to i32*
  %15 = bitcast [4096 x i32]* %7 to i32*
  %16 = call i32 @substring_hw_stub(i32* %8, i32* %9, i32* %10, i32* %11, i32* %12, i32* %13, i32* %14, i32* %15)
  call void @copy_in([4096 x i32]* null, [4096 x i32]* %0, [4096 x i32]* null, [4096 x i32]* %1, [4096 x i32]* null, [4096 x i32]* %2, [4096 x i32]* null, [4096 x i32]* %3, [4096 x i32]* null, [4096 x i32]* %4, [4096 x i32]* null, [4096 x i32]* %5, [4096 x i32]* null, [4096 x i32]* %6, [4096 x i32]* null, [4096 x i32]* %7)
  ret i32 %16
}

declare i32 @substring_hw_stub(i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32*)

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
