; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/spam_ahls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_SgdLR_ir(float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="81920" %data, i8* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="80" %label, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1024" %theta) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 327680)
  %data_copy = bitcast i8* %malloccall to [81920 x float]*
  %label_copy = alloca [80 x i8], align 512
  %malloccall1 = tail call i8* @malloc(i64 4096)
  %theta_copy = bitcast i8* %malloccall1 to [1024 x float]*
  %0 = bitcast float* %data to [81920 x float]*
  %1 = bitcast i8* %label to [80 x i8]*
  %2 = bitcast float* %theta to [1024 x float]*
  call fastcc void @copy_in([81920 x float]* nonnull %0, [81920 x float]* %data_copy, [80 x i8]* nonnull %1, [80 x i8]* nonnull align 512 %label_copy, [1024 x float]* nonnull %2, [1024 x float]* %theta_copy)
  call void @apatb_SgdLR_hw([81920 x float]* %data_copy, [80 x i8]* %label_copy, [1024 x float]* %theta_copy)
  call void @copy_back([81920 x float]* %0, [81920 x float]* %data_copy, [80 x i8]* %1, [80 x i8]* %label_copy, [1024 x float]* %2, [1024 x float]* %theta_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([81920 x float]* noalias readonly, [81920 x float]* noalias, [80 x i8]* noalias readonly, [80 x i8]* noalias align 512, [1024 x float]* noalias readonly, [1024 x float]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a81920f32([81920 x float]* %1, [81920 x float]* %0)
  call fastcc void @onebyonecpy_hls.p0a80i8([80 x i8]* align 512 %3, [80 x i8]* %2)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %5, [1024 x float]* %4)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a81920f32([81920 x float]* noalias %dst, [81920 x float]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [81920 x float]* %dst, null
  %1 = icmp eq [81920 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a81920f32([81920 x float]* nonnull %dst, [81920 x float]* nonnull %src, i64 81920)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a81920f32([81920 x float]* %dst, [81920 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [81920 x float]* %src, null
  %1 = icmp eq [81920 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [81920 x float], [81920 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [81920 x float], [81920 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a80i8([80 x i8]* noalias align 512 %dst, [80 x i8]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [80 x i8]* %dst, null
  %1 = icmp eq [80 x i8]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a80i8([80 x i8]* nonnull %dst, [80 x i8]* nonnull %src, i64 80)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a80i8([80 x i8]* %dst, [80 x i8]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [80 x i8]* %src, null
  %1 = icmp eq [80 x i8]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [80 x i8], [80 x i8]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [80 x i8], [80 x i8]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @copy_out([81920 x float]* noalias, [81920 x float]* noalias readonly, [80 x i8]* noalias, [80 x i8]* noalias readonly align 512, [1024 x float]* noalias, [1024 x float]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a81920f32([81920 x float]* %0, [81920 x float]* %1)
  call fastcc void @onebyonecpy_hls.p0a80i8([80 x i8]* %2, [80 x i8]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %4, [1024 x float]* %5)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_SgdLR_hw([81920 x float]*, [80 x i8]*, [1024 x float]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([81920 x float]* noalias, [81920 x float]* noalias readonly, [80 x i8]* noalias, [80 x i8]* noalias readonly align 512, [1024 x float]* noalias, [1024 x float]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1024f32([1024 x float]* %4, [1024 x float]* %5)
  ret void
}

define void @SgdLR_hw_stub_wrapper([81920 x float]*, [80 x i8]*, [1024 x float]*) #5 {
entry:
  call void @copy_out([81920 x float]* null, [81920 x float]* %0, [80 x i8]* null, [80 x i8]* %1, [1024 x float]* null, [1024 x float]* %2)
  %3 = bitcast [81920 x float]* %0 to float*
  %4 = bitcast [80 x i8]* %1 to i8*
  %5 = bitcast [1024 x float]* %2 to float*
  call void @SgdLR_hw_stub(float* %3, i8* %4, float* %5)
  call void @copy_in([81920 x float]* null, [81920 x float]* %0, [80 x i8]* null, [80 x i8]* %1, [1024 x float]* null, [1024 x float]* %2)
  ret void
}

declare void @SgdLR_hw_stub(float*, i8*, float*)

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
