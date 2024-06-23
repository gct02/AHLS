; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/digitrec_ahls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_DigitRec_ir(i64* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="12000" %training_samples, i64* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="2000" %test_set, i8* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="3000" %training_labels, i8* noalias nocapture nonnull "fpga.decayed.dim.hint"="500" %results) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 96000)
  %training_samples_copy = bitcast i8* %malloccall to [12000 x i64]*
  %malloccall1 = tail call i8* @malloc(i64 16000)
  %test_set_copy = bitcast i8* %malloccall1 to [2000 x i64]*
  %training_labels_copy = alloca [3000 x i8], align 512
  %results_copy = alloca [500 x i8], align 512
  %0 = bitcast i64* %training_samples to [12000 x i64]*
  %1 = bitcast i64* %test_set to [2000 x i64]*
  %2 = bitcast i8* %training_labels to [3000 x i8]*
  %3 = bitcast i8* %results to [500 x i8]*
  call fastcc void @copy_in([12000 x i64]* nonnull %0, [12000 x i64]* %training_samples_copy, [2000 x i64]* nonnull %1, [2000 x i64]* %test_set_copy, [3000 x i8]* nonnull %2, [3000 x i8]* nonnull align 512 %training_labels_copy, [500 x i8]* nonnull %3, [500 x i8]* nonnull align 512 %results_copy)
  call void @apatb_DigitRec_hw([12000 x i64]* %training_samples_copy, [2000 x i64]* %test_set_copy, [3000 x i8]* %training_labels_copy, [500 x i8]* %results_copy)
  call void @copy_back([12000 x i64]* %0, [12000 x i64]* %training_samples_copy, [2000 x i64]* %1, [2000 x i64]* %test_set_copy, [3000 x i8]* %2, [3000 x i8]* %training_labels_copy, [500 x i8]* %3, [500 x i8]* %results_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([12000 x i64]* noalias readonly, [12000 x i64]* noalias, [2000 x i64]* noalias readonly, [2000 x i64]* noalias, [3000 x i8]* noalias readonly, [3000 x i8]* noalias align 512, [500 x i8]* noalias readonly, [500 x i8]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a12000i64([12000 x i64]* %1, [12000 x i64]* %0)
  call fastcc void @onebyonecpy_hls.p0a2000i64([2000 x i64]* %3, [2000 x i64]* %2)
  call fastcc void @onebyonecpy_hls.p0a3000i8([3000 x i8]* align 512 %5, [3000 x i8]* %4)
  call fastcc void @onebyonecpy_hls.p0a500i8([500 x i8]* align 512 %7, [500 x i8]* %6)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a12000i64([12000 x i64]* noalias %dst, [12000 x i64]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [12000 x i64]* %dst, null
  %1 = icmp eq [12000 x i64]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a12000i64([12000 x i64]* nonnull %dst, [12000 x i64]* nonnull %src, i64 12000)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a12000i64([12000 x i64]* %dst, [12000 x i64]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [12000 x i64]* %src, null
  %1 = icmp eq [12000 x i64]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [12000 x i64], [12000 x i64]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [12000 x i64], [12000 x i64]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i64, i64* %src.addr, align 8
  store i64 %3, i64* %dst.addr, align 8
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a2000i64([2000 x i64]* noalias %dst, [2000 x i64]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [2000 x i64]* %dst, null
  %1 = icmp eq [2000 x i64]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a2000i64([2000 x i64]* nonnull %dst, [2000 x i64]* nonnull %src, i64 2000)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2000i64([2000 x i64]* %dst, [2000 x i64]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [2000 x i64]* %src, null
  %1 = icmp eq [2000 x i64]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2000 x i64], [2000 x i64]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [2000 x i64], [2000 x i64]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i64, i64* %src.addr, align 8
  store i64 %3, i64* %dst.addr, align 8
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a3000i8([3000 x i8]* noalias align 512 %dst, [3000 x i8]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [3000 x i8]* %dst, null
  %1 = icmp eq [3000 x i8]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a3000i8([3000 x i8]* nonnull %dst, [3000 x i8]* nonnull %src, i64 3000)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a3000i8([3000 x i8]* %dst, [3000 x i8]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [3000 x i8]* %src, null
  %1 = icmp eq [3000 x i8]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [3000 x i8], [3000 x i8]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [3000 x i8], [3000 x i8]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a500i8([500 x i8]* noalias align 512 %dst, [500 x i8]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [500 x i8]* %dst, null
  %1 = icmp eq [500 x i8]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a500i8([500 x i8]* nonnull %dst, [500 x i8]* nonnull %src, i64 500)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a500i8([500 x i8]* %dst, [500 x i8]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [500 x i8]* %src, null
  %1 = icmp eq [500 x i8]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [500 x i8], [500 x i8]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [500 x i8], [500 x i8]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @copy_out([12000 x i64]* noalias, [12000 x i64]* noalias readonly, [2000 x i64]* noalias, [2000 x i64]* noalias readonly, [3000 x i8]* noalias, [3000 x i8]* noalias readonly align 512, [500 x i8]* noalias, [500 x i8]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a12000i64([12000 x i64]* %0, [12000 x i64]* %1)
  call fastcc void @onebyonecpy_hls.p0a2000i64([2000 x i64]* %2, [2000 x i64]* %3)
  call fastcc void @onebyonecpy_hls.p0a3000i8([3000 x i8]* %4, [3000 x i8]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a500i8([500 x i8]* %6, [500 x i8]* align 512 %7)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_DigitRec_hw([12000 x i64]*, [2000 x i64]*, [3000 x i8]*, [500 x i8]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([12000 x i64]* noalias, [12000 x i64]* noalias readonly, [2000 x i64]* noalias, [2000 x i64]* noalias readonly, [3000 x i8]* noalias, [3000 x i8]* noalias readonly align 512, [500 x i8]* noalias, [500 x i8]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a500i8([500 x i8]* %6, [500 x i8]* align 512 %7)
  ret void
}

define void @DigitRec_hw_stub_wrapper([12000 x i64]*, [2000 x i64]*, [3000 x i8]*, [500 x i8]*) #5 {
entry:
  call void @copy_out([12000 x i64]* null, [12000 x i64]* %0, [2000 x i64]* null, [2000 x i64]* %1, [3000 x i8]* null, [3000 x i8]* %2, [500 x i8]* null, [500 x i8]* %3)
  %4 = bitcast [12000 x i64]* %0 to i64*
  %5 = bitcast [2000 x i64]* %1 to i64*
  %6 = bitcast [3000 x i8]* %2 to i8*
  %7 = bitcast [500 x i8]* %3 to i8*
  call void @DigitRec_hw_stub(i64* %4, i64* %5, i8* %6, i8* %7)
  call void @copy_in([12000 x i64]* null, [12000 x i64]* %0, [2000 x i64]* null, [2000 x i64]* %1, [3000 x i8]* null, [3000 x i8]* %2, [500 x i8]* null, [500 x i8]* %3)
  ret void
}

declare void @DigitRec_hw_stub(i64*, i64*, i8*, i8*)

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
