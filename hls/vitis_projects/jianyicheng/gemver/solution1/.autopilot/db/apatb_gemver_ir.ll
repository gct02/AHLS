; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/ahls_resource_estimation/vitis_projects/gemver/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_gemver_ir(float* noalias nocapture nonnull "fpga.decayed.dim.hint"="65536" %A, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="256" %u1, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="256" %v1, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="256" %u2, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="256" %v2, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="256" %w, float* noalias nocapture nonnull "fpga.decayed.dim.hint"="256" %x, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="256" %y, float* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="256" %z) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 262144)
  %A_copy = bitcast i8* %malloccall to [65536 x float]*
  %u1_copy = alloca [256 x float], align 512
  %v1_copy = alloca [256 x float], align 512
  %u2_copy = alloca [256 x float], align 512
  %v2_copy = alloca [256 x float], align 512
  %w_copy = alloca [256 x float], align 512
  %x_copy = alloca [256 x float], align 512
  %y_copy = alloca [256 x float], align 512
  %z_copy = alloca [256 x float], align 512
  %0 = bitcast float* %A to [65536 x float]*
  %1 = bitcast float* %u1 to [256 x float]*
  %2 = bitcast float* %v1 to [256 x float]*
  %3 = bitcast float* %u2 to [256 x float]*
  %4 = bitcast float* %v2 to [256 x float]*
  %5 = bitcast float* %w to [256 x float]*
  %6 = bitcast float* %x to [256 x float]*
  %7 = bitcast float* %y to [256 x float]*
  %8 = bitcast float* %z to [256 x float]*
  call fastcc void @copy_in([65536 x float]* nonnull %0, [65536 x float]* %A_copy, [256 x float]* nonnull %1, [256 x float]* nonnull align 512 %u1_copy, [256 x float]* nonnull %2, [256 x float]* nonnull align 512 %v1_copy, [256 x float]* nonnull %3, [256 x float]* nonnull align 512 %u2_copy, [256 x float]* nonnull %4, [256 x float]* nonnull align 512 %v2_copy, [256 x float]* nonnull %5, [256 x float]* nonnull align 512 %w_copy, [256 x float]* nonnull %6, [256 x float]* nonnull align 512 %x_copy, [256 x float]* nonnull %7, [256 x float]* nonnull align 512 %y_copy, [256 x float]* nonnull %8, [256 x float]* nonnull align 512 %z_copy)
  call void @apatb_gemver_hw([65536 x float]* %A_copy, [256 x float]* %u1_copy, [256 x float]* %v1_copy, [256 x float]* %u2_copy, [256 x float]* %v2_copy, [256 x float]* %w_copy, [256 x float]* %x_copy, [256 x float]* %y_copy, [256 x float]* %z_copy)
  call void @copy_back([65536 x float]* %0, [65536 x float]* %A_copy, [256 x float]* %1, [256 x float]* %u1_copy, [256 x float]* %2, [256 x float]* %v1_copy, [256 x float]* %3, [256 x float]* %u2_copy, [256 x float]* %4, [256 x float]* %v2_copy, [256 x float]* %5, [256 x float]* %w_copy, [256 x float]* %6, [256 x float]* %x_copy, [256 x float]* %7, [256 x float]* %y_copy, [256 x float]* %8, [256 x float]* %z_copy)
  tail call void @free(i8* %malloccall)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([65536 x float]* noalias readonly, [65536 x float]* noalias, [256 x float]* noalias readonly, [256 x float]* noalias align 512, [256 x float]* noalias readonly, [256 x float]* noalias align 512, [256 x float]* noalias readonly, [256 x float]* noalias align 512, [256 x float]* noalias readonly, [256 x float]* noalias align 512, [256 x float]* noalias readonly, [256 x float]* noalias align 512, [256 x float]* noalias readonly, [256 x float]* noalias align 512, [256 x float]* noalias readonly, [256 x float]* noalias align 512, [256 x float]* noalias readonly, [256 x float]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a65536f32([65536 x float]* %1, [65536 x float]* %0)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* align 512 %3, [256 x float]* %2)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* align 512 %5, [256 x float]* %4)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* align 512 %7, [256 x float]* %6)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* align 512 %9, [256 x float]* %8)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* align 512 %11, [256 x float]* %10)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* align 512 %13, [256 x float]* %12)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* align 512 %15, [256 x float]* %14)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* align 512 %17, [256 x float]* %16)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a65536f32([65536 x float]* noalias %dst, [65536 x float]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [65536 x float]* %dst, null
  %1 = icmp eq [65536 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a65536f32([65536 x float]* nonnull %dst, [65536 x float]* nonnull %src, i64 65536)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a65536f32([65536 x float]* %dst, [65536 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [65536 x float]* %src, null
  %1 = icmp eq [65536 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [65536 x float], [65536 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [65536 x float], [65536 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* noalias align 512 %dst, [256 x float]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [256 x float]* %dst, null
  %1 = icmp eq [256 x float]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a256f32([256 x float]* nonnull %dst, [256 x float]* nonnull %src, i64 256)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a256f32([256 x float]* %dst, [256 x float]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [256 x float]* %src, null
  %1 = icmp eq [256 x float]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [256 x float], [256 x float]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [256 x float], [256 x float]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @copy_out([65536 x float]* noalias, [65536 x float]* noalias readonly, [256 x float]* noalias, [256 x float]* noalias readonly align 512, [256 x float]* noalias, [256 x float]* noalias readonly align 512, [256 x float]* noalias, [256 x float]* noalias readonly align 512, [256 x float]* noalias, [256 x float]* noalias readonly align 512, [256 x float]* noalias, [256 x float]* noalias readonly align 512, [256 x float]* noalias, [256 x float]* noalias readonly align 512, [256 x float]* noalias, [256 x float]* noalias readonly align 512, [256 x float]* noalias, [256 x float]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a65536f32([65536 x float]* %0, [65536 x float]* %1)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* %2, [256 x float]* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* %4, [256 x float]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* %6, [256 x float]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* %8, [256 x float]* align 512 %9)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* %10, [256 x float]* align 512 %11)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* %12, [256 x float]* align 512 %13)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* %14, [256 x float]* align 512 %15)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* %16, [256 x float]* align 512 %17)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_gemver_hw([65536 x float]*, [256 x float]*, [256 x float]*, [256 x float]*, [256 x float]*, [256 x float]*, [256 x float]*, [256 x float]*, [256 x float]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([65536 x float]* noalias, [65536 x float]* noalias readonly, [256 x float]* noalias, [256 x float]* noalias readonly align 512, [256 x float]* noalias, [256 x float]* noalias readonly align 512, [256 x float]* noalias, [256 x float]* noalias readonly align 512, [256 x float]* noalias, [256 x float]* noalias readonly align 512, [256 x float]* noalias, [256 x float]* noalias readonly align 512, [256 x float]* noalias, [256 x float]* noalias readonly align 512, [256 x float]* noalias, [256 x float]* noalias readonly align 512, [256 x float]* noalias, [256 x float]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a65536f32([65536 x float]* %0, [65536 x float]* %1)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* %10, [256 x float]* align 512 %11)
  call fastcc void @onebyonecpy_hls.p0a256f32([256 x float]* %12, [256 x float]* align 512 %13)
  ret void
}

define void @gemver_hw_stub_wrapper([65536 x float]*, [256 x float]*, [256 x float]*, [256 x float]*, [256 x float]*, [256 x float]*, [256 x float]*, [256 x float]*, [256 x float]*) #5 {
entry:
  call void @copy_out([65536 x float]* null, [65536 x float]* %0, [256 x float]* null, [256 x float]* %1, [256 x float]* null, [256 x float]* %2, [256 x float]* null, [256 x float]* %3, [256 x float]* null, [256 x float]* %4, [256 x float]* null, [256 x float]* %5, [256 x float]* null, [256 x float]* %6, [256 x float]* null, [256 x float]* %7, [256 x float]* null, [256 x float]* %8)
  %9 = bitcast [65536 x float]* %0 to float*
  %10 = bitcast [256 x float]* %1 to float*
  %11 = bitcast [256 x float]* %2 to float*
  %12 = bitcast [256 x float]* %3 to float*
  %13 = bitcast [256 x float]* %4 to float*
  %14 = bitcast [256 x float]* %5 to float*
  %15 = bitcast [256 x float]* %6 to float*
  %16 = bitcast [256 x float]* %7 to float*
  %17 = bitcast [256 x float]* %8 to float*
  call void @gemver_hw_stub(float* %9, float* %10, float* %11, float* %12, float* %13, float* %14, float* %15, float* %16, float* %17)
  call void @copy_in([65536 x float]* null, [65536 x float]* %0, [256 x float]* null, [256 x float]* %1, [256 x float]* null, [256 x float]* %2, [256 x float]* null, [256 x float]* %3, [256 x float]* null, [256 x float]* %4, [256 x float]* null, [256 x float]* %5, [256 x float]* null, [256 x float]* %6, [256 x float]* null, [256 x float]* %7, [256 x float]* null, [256 x float]* %8)
  ret void
}

declare void @gemver_hw_stub(float*, float*, float*, float*, float*, float*, float*, float*, float*)

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
