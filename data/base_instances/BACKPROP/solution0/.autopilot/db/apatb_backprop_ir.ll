; ModuleID = '/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_instances/BACKPROP/solution0/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline
define void @apatb_backprop_ir(double* noalias nocapture nonnull "fpga.decayed.dim.hint"="832" %weights1, double* noalias nocapture nonnull "fpga.decayed.dim.hint"="4096" %weights2, double* noalias nocapture nonnull "fpga.decayed.dim.hint"="192" %weights3, double* noalias nocapture nonnull "fpga.decayed.dim.hint"="64" %biases1, double* noalias nocapture nonnull "fpga.decayed.dim.hint"="64" %biases2, double* noalias nocapture nonnull "fpga.decayed.dim.hint"="3" %biases3, double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="2119" %training_data, double* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="489" %training_targets) local_unnamed_addr #0 {
entry:
  %malloccall = tail call i8* @malloc(i64 6656)
  %weights1_copy = bitcast i8* %malloccall to [832 x double]*
  %malloccall1 = tail call i8* @malloc(i64 32768)
  %weights2_copy = bitcast i8* %malloccall1 to [4096 x double]*
  %weights3_copy = alloca [192 x double], align 512
  %biases1_copy = alloca [64 x double], align 512
  %biases2_copy = alloca [64 x double], align 512
  %biases3_copy = alloca [3 x double], align 512
  %malloccall2 = tail call i8* @malloc(i64 16952)
  %training_data_copy = bitcast i8* %malloccall2 to [2119 x double]*
  %training_targets_copy = alloca [489 x double], align 512
  %0 = bitcast double* %weights1 to [832 x double]*
  %1 = bitcast double* %weights2 to [4096 x double]*
  %2 = bitcast double* %weights3 to [192 x double]*
  %3 = bitcast double* %biases1 to [64 x double]*
  %4 = bitcast double* %biases2 to [64 x double]*
  %5 = bitcast double* %biases3 to [3 x double]*
  %6 = bitcast double* %training_data to [2119 x double]*
  %7 = bitcast double* %training_targets to [489 x double]*
  call fastcc void @copy_in([832 x double]* nonnull %0, [832 x double]* %weights1_copy, [4096 x double]* nonnull %1, [4096 x double]* %weights2_copy, [192 x double]* nonnull %2, [192 x double]* nonnull align 512 %weights3_copy, [64 x double]* nonnull %3, [64 x double]* nonnull align 512 %biases1_copy, [64 x double]* nonnull %4, [64 x double]* nonnull align 512 %biases2_copy, [3 x double]* nonnull %5, [3 x double]* nonnull align 512 %biases3_copy, [2119 x double]* nonnull %6, [2119 x double]* %training_data_copy, [489 x double]* nonnull %7, [489 x double]* nonnull align 512 %training_targets_copy)
  call void @apatb_backprop_hw([832 x double]* %weights1_copy, [4096 x double]* %weights2_copy, [192 x double]* %weights3_copy, [64 x double]* %biases1_copy, [64 x double]* %biases2_copy, [3 x double]* %biases3_copy, [2119 x double]* %training_data_copy, [489 x double]* %training_targets_copy)
  call void @copy_back([832 x double]* %0, [832 x double]* %weights1_copy, [4096 x double]* %1, [4096 x double]* %weights2_copy, [192 x double]* %2, [192 x double]* %weights3_copy, [64 x double]* %3, [64 x double]* %biases1_copy, [64 x double]* %4, [64 x double]* %biases2_copy, [3 x double]* %5, [3 x double]* %biases3_copy, [2119 x double]* %6, [2119 x double]* %training_data_copy, [489 x double]* %7, [489 x double]* %training_targets_copy)
  tail call void @free(i8* %malloccall)
  tail call void @free(i8* %malloccall1)
  tail call void @free(i8* %malloccall2)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in([832 x double]* noalias readonly, [832 x double]* noalias, [4096 x double]* noalias readonly, [4096 x double]* noalias, [192 x double]* noalias readonly, [192 x double]* noalias align 512, [64 x double]* noalias readonly, [64 x double]* noalias align 512, [64 x double]* noalias readonly, [64 x double]* noalias align 512, [3 x double]* noalias readonly, [3 x double]* noalias align 512, [2119 x double]* noalias readonly, [2119 x double]* noalias, [489 x double]* noalias readonly, [489 x double]* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0a832f64([832 x double]* %1, [832 x double]* %0)
  call fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* %3, [4096 x double]* %2)
  call fastcc void @onebyonecpy_hls.p0a192f64([192 x double]* align 512 %5, [192 x double]* %4)
  call fastcc void @onebyonecpy_hls.p0a64f64([64 x double]* align 512 %7, [64 x double]* %6)
  call fastcc void @onebyonecpy_hls.p0a64f64([64 x double]* align 512 %9, [64 x double]* %8)
  call fastcc void @onebyonecpy_hls.p0a3f64([3 x double]* align 512 %11, [3 x double]* %10)
  call fastcc void @onebyonecpy_hls.p0a2119f64([2119 x double]* %13, [2119 x double]* %12)
  call fastcc void @onebyonecpy_hls.p0a489f64([489 x double]* align 512 %15, [489 x double]* %14)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a832f64([832 x double]* noalias %dst, [832 x double]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [832 x double]* %dst, null
  %1 = icmp eq [832 x double]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a832f64([832 x double]* nonnull %dst, [832 x double]* nonnull %src, i64 832)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a832f64([832 x double]* %dst, [832 x double]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [832 x double]* %src, null
  %1 = icmp eq [832 x double]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [832 x double], [832 x double]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [832 x double], [832 x double]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* noalias %dst, [4096 x double]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [4096 x double]* %dst, null
  %1 = icmp eq [4096 x double]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a4096f64([4096 x double]* nonnull %dst, [4096 x double]* nonnull %src, i64 4096)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a4096f64([4096 x double]* %dst, [4096 x double]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [4096 x double]* %src, null
  %1 = icmp eq [4096 x double]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [4096 x double], [4096 x double]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [4096 x double], [4096 x double]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a192f64([192 x double]* noalias align 512 %dst, [192 x double]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [192 x double]* %dst, null
  %1 = icmp eq [192 x double]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a192f64([192 x double]* nonnull %dst, [192 x double]* nonnull %src, i64 192)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a192f64([192 x double]* %dst, [192 x double]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [192 x double]* %src, null
  %1 = icmp eq [192 x double]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [192 x double], [192 x double]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [192 x double], [192 x double]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a64f64([64 x double]* noalias align 512 %dst, [64 x double]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [64 x double]* %dst, null
  %1 = icmp eq [64 x double]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a64f64([64 x double]* nonnull %dst, [64 x double]* nonnull %src, i64 64)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a64f64([64 x double]* %dst, [64 x double]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [64 x double]* %src, null
  %1 = icmp eq [64 x double]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [64 x double], [64 x double]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [64 x double], [64 x double]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a3f64([3 x double]* noalias align 512 %dst, [3 x double]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [3 x double]* %dst, null
  %1 = icmp eq [3 x double]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a3f64([3 x double]* nonnull %dst, [3 x double]* nonnull %src, i64 3)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a3f64([3 x double]* %dst, [3 x double]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [3 x double]* %src, null
  %1 = icmp eq [3 x double]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [3 x double], [3 x double]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [3 x double], [3 x double]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a2119f64([2119 x double]* noalias %dst, [2119 x double]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [2119 x double]* %dst, null
  %1 = icmp eq [2119 x double]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a2119f64([2119 x double]* nonnull %dst, [2119 x double]* nonnull %src, i64 2119)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2119f64([2119 x double]* %dst, [2119 x double]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [2119 x double]* %src, null
  %1 = icmp eq [2119 x double]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2119 x double], [2119 x double]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [2119 x double], [2119 x double]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @onebyonecpy_hls.p0a489f64([489 x double]* noalias align 512 %dst, [489 x double]* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [489 x double]* %dst, null
  %1 = icmp eq [489 x double]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a489f64([489 x double]* nonnull %dst, [489 x double]* nonnull %src, i64 489)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a489f64([489 x double]* %dst, [489 x double]* readonly %src, i64 %num) local_unnamed_addr #3 {
entry:
  %0 = icmp eq [489 x double]* %src, null
  %1 = icmp eq [489 x double]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [489 x double], [489 x double]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [489 x double], [489 x double]* %src, i64 0, i64 %for.loop.idx2
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
define internal fastcc void @copy_out([832 x double]* noalias, [832 x double]* noalias readonly, [4096 x double]* noalias, [4096 x double]* noalias readonly, [192 x double]* noalias, [192 x double]* noalias readonly align 512, [64 x double]* noalias, [64 x double]* noalias readonly align 512, [64 x double]* noalias, [64 x double]* noalias readonly align 512, [3 x double]* noalias, [3 x double]* noalias readonly align 512, [2119 x double]* noalias, [2119 x double]* noalias readonly, [489 x double]* noalias, [489 x double]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a832f64([832 x double]* %0, [832 x double]* %1)
  call fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* %2, [4096 x double]* %3)
  call fastcc void @onebyonecpy_hls.p0a192f64([192 x double]* %4, [192 x double]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a64f64([64 x double]* %6, [64 x double]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a64f64([64 x double]* %8, [64 x double]* align 512 %9)
  call fastcc void @onebyonecpy_hls.p0a3f64([3 x double]* %10, [3 x double]* align 512 %11)
  call fastcc void @onebyonecpy_hls.p0a2119f64([2119 x double]* %12, [2119 x double]* %13)
  call fastcc void @onebyonecpy_hls.p0a489f64([489 x double]* %14, [489 x double]* align 512 %15)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_backprop_hw([832 x double]*, [4096 x double]*, [192 x double]*, [64 x double]*, [64 x double]*, [3 x double]*, [2119 x double]*, [489 x double]*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back([832 x double]* noalias, [832 x double]* noalias readonly, [4096 x double]* noalias, [4096 x double]* noalias readonly, [192 x double]* noalias, [192 x double]* noalias readonly align 512, [64 x double]* noalias, [64 x double]* noalias readonly align 512, [64 x double]* noalias, [64 x double]* noalias readonly align 512, [3 x double]* noalias, [3 x double]* noalias readonly align 512, [2119 x double]* noalias, [2119 x double]* noalias readonly, [489 x double]* noalias, [489 x double]* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a832f64([832 x double]* %0, [832 x double]* %1)
  call fastcc void @onebyonecpy_hls.p0a4096f64([4096 x double]* %2, [4096 x double]* %3)
  call fastcc void @onebyonecpy_hls.p0a192f64([192 x double]* %4, [192 x double]* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0a64f64([64 x double]* %6, [64 x double]* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0a64f64([64 x double]* %8, [64 x double]* align 512 %9)
  call fastcc void @onebyonecpy_hls.p0a3f64([3 x double]* %10, [3 x double]* align 512 %11)
  ret void
}

define void @backprop_hw_stub_wrapper([832 x double]*, [4096 x double]*, [192 x double]*, [64 x double]*, [64 x double]*, [3 x double]*, [2119 x double]*, [489 x double]*) #5 {
entry:
  call void @copy_out([832 x double]* null, [832 x double]* %0, [4096 x double]* null, [4096 x double]* %1, [192 x double]* null, [192 x double]* %2, [64 x double]* null, [64 x double]* %3, [64 x double]* null, [64 x double]* %4, [3 x double]* null, [3 x double]* %5, [2119 x double]* null, [2119 x double]* %6, [489 x double]* null, [489 x double]* %7)
  %8 = bitcast [832 x double]* %0 to double*
  %9 = bitcast [4096 x double]* %1 to double*
  %10 = bitcast [192 x double]* %2 to double*
  %11 = bitcast [64 x double]* %3 to double*
  %12 = bitcast [64 x double]* %4 to double*
  %13 = bitcast [3 x double]* %5 to double*
  %14 = bitcast [2119 x double]* %6 to double*
  %15 = bitcast [489 x double]* %7 to double*
  call void @backprop_hw_stub(double* %8, double* %9, double* %10, double* %11, double* %12, double* %13, double* %14, double* %15)
  call void @copy_in([832 x double]* null, [832 x double]* %0, [4096 x double]* null, [4096 x double]* %1, [192 x double]* null, [192 x double]* %2, [64 x double]* null, [64 x double]* %3, [64 x double]* null, [64 x double]* %4, [3 x double]* null, [3 x double]* %5, [2119 x double]* null, [2119 x double]* %6, [489 x double]* null, [489 x double]* %7)
  ret void
}

declare void @backprop_hw_stub(double*, double*, double*, double*, double*, double*, double*, double*)

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
