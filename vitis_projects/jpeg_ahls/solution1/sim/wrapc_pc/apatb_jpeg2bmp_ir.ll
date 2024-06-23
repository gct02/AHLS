; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/jpeg_ahls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_jpeg2bmp_ir(i8* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="6496" %inputVector, i32 %jpegSize, [16384 x i8]* noalias nocapture nonnull "fpga.decayed.dim.hint"="3" %outputVector) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 6496)
  %inputVector_copy = bitcast i8* %malloccall to [6496 x i8]*
  %malloccall1 = tail call i8* @malloc(i64 49152)
  %outputVector_copy = bitcast i8* %malloccall1 to [3 x [16384 x i8]]*
  %0 = bitcast i8* %inputVector to [6496 x i8]*
  %1 = bitcast [16384 x i8]* %outputVector to [3 x [16384 x i8]]*
  call fastcc void @copy_in([6496 x i8]* nonnull %0, [6496 x i8]* %inputVector_copy, [3 x [16384 x i8]]* nonnull %1, [3 x [16384 x i8]]* %outputVector_copy)
  call void @apatb_jpeg2bmp_hw([6496 x i8]* %inputVector_copy, i32 %jpegSize, [3 x [16384 x i8]]* %outputVector_copy)
  call void @copy_back([6496 x i8]* %0, [6496 x i8]* %inputVector_copy, [3 x [16384 x i8]]* %1, [3 x [16384 x i8]]* %outputVector_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([6496 x i8]* noalias readonly, [6496 x i8]* noalias, [3 x [16384 x i8]]* noalias readonly, [3 x [16384 x i8]]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a6496i8([6496 x i8]* %1, [6496 x i8]* %0)
  call fastcc void @onebyonecpy_hls.p0a3a16384i8([3 x [16384 x i8]]* %3, [3 x [16384 x i8]]* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a6496i8([6496 x i8]* noalias %dst, [6496 x i8]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [6496 x i8]* %dst, null
  %1 = icmp eq [6496 x i8]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a6496i8([6496 x i8]* nonnull %dst, [6496 x i8]* nonnull %src, i64 6496)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a6496i8([6496 x i8]* %dst, [6496 x i8]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [6496 x i8]* %src, null
  %1 = icmp eq [6496 x i8]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [6496 x i8], [6496 x i8]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [6496 x i8], [6496 x i8]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i8, i8* %src.addr, align 1
  store i8 %3, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a3a16384i8([3 x [16384 x i8]]* noalias %dst, [3 x [16384 x i8]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [3 x [16384 x i8]]* %dst, null
  %1 = icmp eq [3 x [16384 x i8]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a3a16384i8([3 x [16384 x i8]]* nonnull %dst, [3 x [16384 x i8]]* nonnull %src, i64 3)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a3a16384i8([3 x [16384 x i8]]* %dst, [3 x [16384 x i8]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [3 x [16384 x i8]]* %src, null
  %1 = icmp eq [3 x [16384 x i8]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [3 x [16384 x i8]], [3 x [16384 x i8]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [3 x [16384 x i8]], [3 x [16384 x i8]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a16384i8([16384 x i8]* %dst.addr, [16384 x i8]* %src.addr, i64 16384)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a16384i8([16384 x i8]* %dst, [16384 x i8]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [16384 x i8]* %src, null
  %1 = icmp eq [16384 x i8]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [16384 x i8], [16384 x i8]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [16384 x i8], [16384 x i8]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i8, i8* %src.addr, align 1
  store i8 %3, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out([6496 x i8]* noalias, [6496 x i8]* noalias readonly, [3 x [16384 x i8]]* noalias, [3 x [16384 x i8]]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a6496i8([6496 x i8]* %0, [6496 x i8]* %1)
  call fastcc void @onebyonecpy_hls.p0a3a16384i8([3 x [16384 x i8]]* %2, [3 x [16384 x i8]]* %3)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_jpeg2bmp_hw([6496 x i8]*, i32, [3 x [16384 x i8]]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([6496 x i8]* noalias, [6496 x i8]* noalias readonly, [3 x [16384 x i8]]* noalias, [3 x [16384 x i8]]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a3a16384i8([3 x [16384 x i8]]* %2, [3 x [16384 x i8]]* %3)
  ret void
}

define void @jpeg2bmp_hw_stub_wrapper([6496 x i8]*, i32, [3 x [16384 x i8]]*) #5 {
entry:
  call void @copy_out([6496 x i8]* null, [6496 x i8]* %0, [3 x [16384 x i8]]* null, [3 x [16384 x i8]]* %2)
  %3 = bitcast [6496 x i8]* %0 to i8*
  %4 = bitcast [3 x [16384 x i8]]* %2 to [16384 x i8]*
  call void @jpeg2bmp_hw_stub(i8* %3, i32 %1, [16384 x i8]* %4)
  call void @copy_in([6496 x i8]* null, [6496 x i8]* %0, [3 x [16384 x i8]]* null, [3 x [16384 x i8]]* %2)
  ret void
}

declare void @jpeg2bmp_hw_stub(i8*, i32, [16384 x i8]*)

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
