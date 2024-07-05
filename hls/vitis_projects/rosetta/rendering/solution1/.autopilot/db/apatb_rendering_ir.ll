; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/rosetta/rendering/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.Triangle_3D = type { i8, i8, i8, i8, i8, i8, i8, i8, i8 }

; Function Attrs: noinline
define void @apatb_rendering_ir(%struct.Triangle_3D* noalias nocapture nonnull readonly %triangle_3ds, [256 x i8]* noalias nocapture nonnull "fpga.decayed.dim.hint"="256" %output, i32 %num_3d_tri) local_unnamed_addr #0 {
entry:
  %triangle_3ds_copy = alloca i72, align 512
  %malloccall = tail call i8* @malloc(i64 65536)
  %output_copy = bitcast i8* %malloccall to [256 x [256 x i8]]*
  %0 = bitcast [256 x i8]* %output to [256 x [256 x i8]]*
  call fastcc void @copy_in(%struct.Triangle_3D* nonnull %triangle_3ds, i72* nonnull align 512 %triangle_3ds_copy, [256 x [256 x i8]]* nonnull %0, [256 x [256 x i8]]* %output_copy)
  call void @apatb_rendering_hw(i72* %triangle_3ds_copy, [256 x [256 x i8]]* %output_copy, i32 %num_3d_tri)
  call void @copy_back(%struct.Triangle_3D* %triangle_3ds, i72* %triangle_3ds_copy, [256 x [256 x i8]]* %0, [256 x [256 x i8]]* %output_copy)
  tail call void @free(i8* %malloccall)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in(%struct.Triangle_3D* noalias readonly, i72* noalias align 512, [256 x [256 x i8]]* noalias readonly, [256 x [256 x i8]]* noalias) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.Triangle_3D(i72* align 512 %1, %struct.Triangle_3D* %0)
  call fastcc void @onebyonecpy_hls.p0a256a256i8([256 x [256 x i8]]* %3, [256 x [256 x i8]]* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.Triangle_3D(i72* noalias align 512 %dst, %struct.Triangle_3D* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq i72* %dst, null
  %1 = icmp eq %struct.Triangle_3D* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %src, i64 0, i32 0
  %3 = load i8, i8* %src.0, align 1
  %4 = zext i8 %3 to i72
  %src.1 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %src, i64 0, i32 1
  %5 = load i8, i8* %src.1, align 1
  %6 = zext i8 %5 to i72
  %7 = shl i72 %6, 8
  %.partset7 = or i72 %7, %4
  %src.2 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %src, i64 0, i32 2
  %8 = load i8, i8* %src.2, align 1
  %9 = zext i8 %8 to i72
  %10 = shl i72 %9, 16
  %.partset6 = or i72 %.partset7, %10
  %src.3 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %src, i64 0, i32 3
  %11 = load i8, i8* %src.3, align 1
  %12 = zext i8 %11 to i72
  %13 = shl i72 %12, 24
  %.partset5 = or i72 %.partset6, %13
  %src.4 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %src, i64 0, i32 4
  %14 = load i8, i8* %src.4, align 1
  %15 = zext i8 %14 to i72
  %16 = shl i72 %15, 32
  %src.5 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %src, i64 0, i32 5
  %17 = load i8, i8* %src.5, align 1
  %18 = zext i8 %17 to i72
  %19 = shl i72 %18, 40
  %src.6 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %src, i64 0, i32 6
  %20 = load i8, i8* %src.6, align 1
  %21 = zext i8 %20 to i72
  %22 = shl i72 %21, 48
  %src.7 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %src, i64 0, i32 7
  %23 = load i8, i8* %src.7, align 1
  %24 = zext i8 %23 to i72
  %25 = shl i72 %24, 56
  %src.8 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %src, i64 0, i32 8
  %26 = load i8, i8* %src.8, align 1
  %27 = zext i8 %26 to i72
  %28 = shl i72 %27, 64
  %.masked.masked.masked = or i72 %.partset5, %16
  %.masked9.masked = or i72 %.masked.masked.masked, %19
  %.masked = or i72 %.masked9.masked, %22
  %29 = or i72 %.masked, %25
  %.partset = or i72 %29, %28
  store i72 %.partset, i72* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a256a256i8([256 x [256 x i8]]* noalias %dst, [256 x [256 x i8]]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [256 x [256 x i8]]* %dst, null
  %1 = icmp eq [256 x [256 x i8]]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a256a256i8([256 x [256 x i8]]* nonnull %dst, [256 x [256 x i8]]* nonnull %src, i64 256)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a256a256i8([256 x [256 x i8]]* %dst, [256 x [256 x i8]]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [256 x [256 x i8]]* %src, null
  %1 = icmp eq [256 x [256 x i8]]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [256 x [256 x i8]], [256 x [256 x i8]]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [256 x [256 x i8]], [256 x [256 x i8]]* %src, i64 0, i64 %for.loop.idx2
  call void @arraycpy_hls.p0a256i8([256 x i8]* %dst.addr, [256 x i8]* %src.addr, i64 256)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a256i8([256 x i8]* %dst, [256 x i8]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [256 x i8]* %src, null
  %1 = icmp eq [256 x i8]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [256 x i8], [256 x i8]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [256 x i8], [256 x i8]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @copy_out(%struct.Triangle_3D* noalias, i72* noalias readonly align 512, [256 x [256 x i8]]* noalias, [256 x [256 x i8]]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.Triangle_3D.21(%struct.Triangle_3D* %0, i72* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0a256a256i8([256 x [256 x i8]]* %2, [256 x [256 x i8]]* %3)
  ret void
}

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0struct.Triangle_3D.21(%struct.Triangle_3D* noalias %dst, i72* noalias readonly align 512 %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %struct.Triangle_3D* %dst, null
  %1 = icmp eq i72* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %dst, i64 0, i32 0
  %3 = load i72, i72* %src, align 512
  %.partselect8 = trunc i72 %3 to i8
  store i8 %.partselect8, i8* %dst.0, align 512
  %dst.1 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %dst, i64 0, i32 1
  %4 = lshr i72 %3, 8
  %.partselect7 = trunc i72 %4 to i8
  store i8 %.partselect7, i8* %dst.1, align 1
  %dst.2 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %dst, i64 0, i32 2
  %5 = lshr i72 %3, 16
  %.partselect6 = trunc i72 %5 to i8
  store i8 %.partselect6, i8* %dst.2, align 2
  %dst.3 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %dst, i64 0, i32 3
  %6 = lshr i72 %3, 24
  %.partselect5 = trunc i72 %6 to i8
  store i8 %.partselect5, i8* %dst.3, align 1
  %dst.4 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %dst, i64 0, i32 4
  %7 = lshr i72 %3, 32
  %.partselect4 = trunc i72 %7 to i8
  store i8 %.partselect4, i8* %dst.4, align 4
  %dst.5 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %dst, i64 0, i32 5
  %8 = lshr i72 %3, 40
  %.partselect3 = trunc i72 %8 to i8
  store i8 %.partselect3, i8* %dst.5, align 1
  %dst.6 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %dst, i64 0, i32 6
  %9 = lshr i72 %3, 48
  %.partselect2 = trunc i72 %9 to i8
  store i8 %.partselect2, i8* %dst.6, align 2
  %dst.7 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %dst, i64 0, i32 7
  %10 = lshr i72 %3, 56
  %.partselect1 = trunc i72 %10 to i8
  store i8 %.partselect1, i8* %dst.7, align 1
  %dst.8 = getelementptr %struct.Triangle_3D, %struct.Triangle_3D* %dst, i64 0, i32 8
  %11 = lshr i72 %3, 64
  %.partselect = trunc i72 %11 to i8
  store i8 %.partselect, i8* %dst.8, align 8
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare void @apatb_rendering_hw(i72*, [256 x [256 x i8]]*, i32)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back(%struct.Triangle_3D* noalias, i72* noalias readonly align 512, [256 x [256 x i8]]* noalias, [256 x [256 x i8]]* noalias readonly) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a256a256i8([256 x [256 x i8]]* %2, [256 x [256 x i8]]* %3)
  ret void
}

define void @rendering_hw_stub_wrapper(i72*, [256 x [256 x i8]]*, i32) #5 {
entry:
  %3 = alloca %struct.Triangle_3D
  call void @copy_out(%struct.Triangle_3D* %3, i72* %0, [256 x [256 x i8]]* null, [256 x [256 x i8]]* %1)
  %4 = bitcast [256 x [256 x i8]]* %1 to [256 x i8]*
  call void @rendering_hw_stub(%struct.Triangle_3D* %3, [256 x i8]* %4, i32 %2)
  call void @copy_in(%struct.Triangle_3D* %3, i72* %0, [256 x [256 x i8]]* null, [256 x [256 x i8]]* %1)
  ret void
}

declare void @rendering_hw_stub(%struct.Triangle_3D*, [256 x i8]*, i32)

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
