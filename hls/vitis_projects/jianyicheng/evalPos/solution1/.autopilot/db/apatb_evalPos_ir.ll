; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/ahls_resource_estimation/vitis_projects/evalPos/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: argmemonly noinline willreturn
define void @apatb_evalPos_ir(i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="64" %board, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="1" %color, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="1" %profile, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="64" %rawMoveCount, i32* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="2" %pm_2, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="1" %res) local_unnamed_addr #0 {
entry:
  %board_copy = alloca [64 x i32], align 512
  %color_copy = alloca [1 x i32], align 512
  %profile_copy = alloca [1 x i32], align 512
  %rawMoveCount_copy = alloca [64 x i32], align 512
  %pm_2_copy = alloca [2 x i32], align 512
  %res_copy = alloca [1 x float], align 512
  %0 = bitcast i32* %board to [64 x i32]*
  %1 = bitcast i32* %color to [1 x i32]*
  %2 = bitcast i32* %profile to [1 x i32]*
  %3 = bitcast i32* %rawMoveCount to [64 x i32]*
  %4 = bitcast i32* %pm_2 to [2 x i32]*
  %5 = bitcast float* %res to [1 x float]*
  call fastcc void @copy_in([64 x i32]* nonnull %0, [64 x i32]* nonnull align 512 %board_copy, [1 x i32]* nonnull %1, [1 x i32]* nonnull align 512 %color_copy, [1 x i32]* nonnull %2, [1 x i32]* nonnull align 512 %profile_copy, [64 x i32]* nonnull %3, [64 x i32]* nonnull align 512 %rawMoveCount_copy, [2 x i32]* nonnull %4, [2 x i32]* nonnull align 512 %pm_2_copy, [1 x float]* nonnull %5, [1 x float]* nonnull align 512 %res_copy)
  call void @apatb_evalPos_hw([64 x i32]* %board_copy, [1 x i32]* %color_copy, [1 x i32]* %profile_copy, [64 x i32]* %rawMoveCount_copy, [2 x i32]* %pm_2_copy, [1 x float]* %res_copy)
  call void @copy_back([64 x i32]* %0, [64 x i32]* %board_copy, [1 x i32]* %1, [1 x i32]* %color_copy, [1 x i32]* %2, [1 x i32]* %profile_copy, [64 x i32]* %3, [64 x i32]* %rawMoveCount_copy, [2 x i32]* %4, [2 x i32]* %pm_2_copy, [1 x float]* %5, [1 x float]* %res_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([64 x i32]* noalias readonly, [64 x i32]* noalias align 512, [1 x i32]* noalias readonly, [1 x i32]* noalias align 512, [1 x i32]* noalias readonly, [1 x i32]* noalias align 512, [64 x i32]* noalias readonly, [64 x i32]* noalias align 512, [2 x i32]* noalias readonly, [2 x i32]* noalias align 512, [1 x float]* noalias readonly, [1 x float]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a64i32([64 x i32]* align 512 %1, [64 x i32]* %0)
  call fastcc void @onebyonecpy_hls.p0a1i32([1 x i32]* align 512 %3, [1 x i32]* %2)
  call fastcc void @onebyonecpy_hls.p0a1i32([1 x i32]* align 512 %5, [1 x i32]* %4)
  call fastcc void @onebyonecpy_hls.p0a64i32([64 x i32]* align 512 %7, [64 x i32]* %6)
  call fastcc void @onebyonecpy_hls.p0a2i32([2 x i32]* align 512 %9, [2 x i32]* %8)
  call fastcc void @onebyonecpy_hls.p0a1f32([1 x float]* align 512 %11, [1 x float]* %10)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a64i32([64 x i32]* noalias align 512 %dst, [64 x i32]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x i32]* %dst, null
  %1 = icmp eq [64 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a64i32([64 x i32]* nonnull %dst, [64 x i32]* nonnull %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a64i32([64 x i32]* %dst, [64 x i32]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [64 x i32]* %src, null
  %1 = icmp eq [64 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [64 x i32], [64 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [64 x i32], [64 x i32]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a1i32([1 x i32]* noalias align 512 %dst, [1 x i32]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [1 x i32]* %dst, null
  %1 = icmp eq [1 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a1i32([1 x i32]* nonnull %dst, [1 x i32]* nonnull %src, i64 1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1i32([1 x i32]* %dst, [1 x i32]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [1 x i32]* %src, null
  %1 = icmp eq [1 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1 x i32], [1 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1 x i32], [1 x i32]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a2i32([2 x i32]* noalias align 512 %dst, [2 x i32]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [2 x i32]* %dst, null
  %1 = icmp eq [2 x i32]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a2i32([2 x i32]* nonnull %dst, [2 x i32]* nonnull %src, i64 2)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2i32([2 x i32]* %dst, [2 x i32]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [2 x i32]* %src, null
  %1 = icmp eq [2 x i32]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2 x i32], [2 x i32]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [2 x i32], [2 x i32]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a1f32([1 x float]* noalias align 512 %dst, [1 x float]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [1 x float]* %dst, null
  %1 = icmp eq [1 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a1f32([1 x float]* nonnull %dst, [1 x float]* nonnull %src, i64 1)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a1f32([1 x float]* %dst, [1 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [1 x float]* %src, null
  %1 = icmp eq [1 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [1 x float], [1 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [1 x float], [1 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @copy_out([64 x i32]* noalias, [64 x i32]* noalias readonly align 512, [1 x i32]* noalias, [1 x i32]* noalias readonly align 512, [1 x i32]* noalias, [1 x i32]* noalias readonly align 512, [64 x i32]* noalias, [64 x i32]* noalias readonly align 512, [2 x i32]* noalias, [2 x i32]* noalias readonly align 512, [1 x float]* noalias, [1 x float]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a64i32([64 x i32]* %0, [64 x i32]* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a1i32([1 x i32]* %2, [1 x i32]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a1i32([1 x i32]* %4, [1 x i32]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a64i32([64 x i32]* %6, [64 x i32]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a2i32([2 x i32]* %8, [2 x i32]* align 512 %9)
  call fastcc void @onebyonecpy_hls.p0a1f32([1 x float]* %10, [1 x float]* align 512 %11)
  ret void
}

declare void @apatb_evalPos_hw([64 x i32]*, [1 x i32]*, [1 x i32]*, [64 x i32]*, [2 x i32]*, [1 x float]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([64 x i32]* noalias, [64 x i32]* noalias readonly align 512, [1 x i32]* noalias, [1 x i32]* noalias readonly align 512, [1 x i32]* noalias, [1 x i32]* noalias readonly align 512, [64 x i32]* noalias, [64 x i32]* noalias readonly align 512, [2 x i32]* noalias, [2 x i32]* noalias readonly align 512, [1 x float]* noalias, [1 x float]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a1f32([1 x float]* %10, [1 x float]* align 512 %11)
  ret void
}

define void @evalPos_hw_stub_wrapper([64 x i32]*, [1 x i32]*, [1 x i32]*, [64 x i32]*, [2 x i32]*, [1 x float]*) #5 {
entry:
  call void @copy_out([64 x i32]* null, [64 x i32]* %0, [1 x i32]* null, [1 x i32]* %1, [1 x i32]* null, [1 x i32]* %2, [64 x i32]* null, [64 x i32]* %3, [2 x i32]* null, [2 x i32]* %4, [1 x float]* null, [1 x float]* %5)
  %6 = bitcast [64 x i32]* %0 to i32*
  %7 = bitcast [1 x i32]* %1 to i32*
  %8 = bitcast [1 x i32]* %2 to i32*
  %9 = bitcast [64 x i32]* %3 to i32*
  %10 = bitcast [2 x i32]* %4 to i32*
  %11 = bitcast [1 x float]* %5 to float*
  call void @evalPos_hw_stub(i32* %6, i32* %7, i32* %8, i32* %9, i32* %10, float* %11)
  call void @copy_in([64 x i32]* null, [64 x i32]* %0, [1 x i32]* null, [1 x i32]* %1, [1 x i32]* null, [1 x i32]* %2, [64 x i32]* null, [64 x i32]* %3, [2 x i32]* null, [2 x i32]* %4, [1 x float]* null, [1 x float]* %5)
  ret void
}

declare void @evalPos_hw_stub(i32*, i32*, i32*, i32*, i32*, float*)

attributes #0 = { argmemonly noinline willreturn "fpga.wrapper.func"="wrapper" }
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
