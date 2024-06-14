; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Triangle_2D = type { i8, i8, i8, i8, i8, i8, i8 }
%struct.Triangle_3D = type { i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.CandidatePixel = type { i8, i8, i8, i8 }
%struct.Pixel = type { i8, i8, i8 }

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer = internal unnamed_addr global [256 x [256 x i8]] zeroinitializer, align 1

; Function Attrs: argmemonly norecurse nounwind readonly willreturn
define i32 @_Z15check_clockwise11Triangle_2D(%struct.Triangle_2D* byval nocapture readonly align 1 %triangle_2d) local_unnamed_addr #0 {
entry:
  %x2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4
  %0 = load i8, i8* %x2, align 1
  %conv = zext i8 %0 to i32
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0
  %1 = load i8, i8* %x0, align 1
  %conv1 = zext i8 %1 to i32
  %sub = sub nsw i32 %conv, %conv1
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3
  %2 = load i8, i8* %y1, align 1
  %conv2 = zext i8 %2 to i32
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1
  %3 = load i8, i8* %y0, align 1
  %conv3 = zext i8 %3 to i32
  %sub4 = sub nsw i32 %conv2, %conv3
  %mul = mul nsw i32 %sub4, %sub
  %y2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5
  %4 = load i8, i8* %y2, align 1
  %conv5 = zext i8 %4 to i32
  %sub8 = sub nsw i32 %conv5, %conv3
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2
  %5 = load i8, i8* %x1, align 1
  %conv9 = zext i8 %5 to i32
  %sub12 = sub nsw i32 %conv9, %conv1
  %mul13 = mul nsw i32 %sub12, %sub8
  %sub14 = sub nsw i32 %mul, %mul13
  ret i32 %sub14
}

; Function Attrs: argmemonly norecurse nounwind willreturn
define void @_Z18clockwise_verticesP11Triangle_2D(%struct.Triangle_2D* nocapture %triangle_2d) local_unnamed_addr #1 {
entry:
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0
  %0 = load i8, i8* %x0, align 1
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1
  %1 = load i8, i8* %y0, align 1
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2
  %2 = load i8, i8* %x1, align 1
  store i8 %2, i8* %x0, align 1
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3
  %3 = load i8, i8* %y1, align 1
  store i8 %3, i8* %y0, align 1
  store i8 %0, i8* %x1, align 1
  store i8 %1, i8* %y1, align 1
  ret void
}

; Function Attrs: argmemonly norecurse nounwind readonly willreturn
define zeroext i1 @_Z17pixel_in_trianglehh11Triangle_2D(i8 zeroext %x, i8 zeroext %y, %struct.Triangle_2D* byval nocapture readonly align 1 %triangle_2d) local_unnamed_addr #2 {
entry:
  %conv = zext i8 %x to i32
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0
  %0 = load i8, i8* %x0, align 1
  %conv1 = zext i8 %0 to i32
  %sub = sub nsw i32 %conv, %conv1
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3
  %1 = load i8, i8* %y1, align 1
  %conv2 = zext i8 %1 to i32
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1
  %2 = load i8, i8* %y0, align 1
  %conv3 = zext i8 %2 to i32
  %sub4 = sub nsw i32 %conv2, %conv3
  %mul = mul nsw i32 %sub4, %sub
  %conv5 = zext i8 %y to i32
  %sub8 = sub nsw i32 %conv5, %conv3
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2
  %3 = load i8, i8* %x1, align 1
  %conv9 = zext i8 %3 to i32
  %sub12 = sub nsw i32 %conv9, %conv1
  %mul13 = mul nsw i32 %sub12, %sub8
  %sub18 = sub nsw i32 %conv, %conv9
  %y2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5
  %4 = load i8, i8* %y2, align 1
  %conv19 = zext i8 %4 to i32
  %sub22 = sub nsw i32 %conv19, %conv2
  %mul23 = mul nsw i32 %sub22, %sub18
  %sub27 = sub nsw i32 %conv5, %conv2
  %x2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4
  %5 = load i8, i8* %x2, align 1
  %conv28 = zext i8 %5 to i32
  %sub31 = sub nsw i32 %conv28, %conv9
  %mul32 = mul nsw i32 %sub31, %sub27
  %sub37 = sub nsw i32 %conv, %conv28
  %sub42 = sub nsw i32 %conv3, %conv19
  %mul43 = mul nsw i32 %sub37, %sub42
  %sub47 = sub nsw i32 %conv5, %conv19
  %sub52 = sub nsw i32 %conv1, %conv28
  %mul53 = mul nsw i32 %sub52, %sub47
  %cmp = icmp sge i32 %mul, %mul13
  %cmp55 = icmp sge i32 %mul23, %mul32
  %or.cond = and i1 %cmp, %cmp55
  br i1 %or.cond, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %cmp56 = icmp sge i32 %mul43, %mul53
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %6 = phi i1 [ false, %entry ], [ %cmp56, %land.rhs ]
  ret i1 %6
}

; Function Attrs: argmemonly norecurse nounwind readnone willreturn
define zeroext i8 @_Z8find_minhhh(i8 zeroext %in0, i8 zeroext %in1, i8 zeroext %in2) local_unnamed_addr #3 {
entry:
  %cmp4 = icmp ult i8 %in0, %in2
  %in0.in2 = select i1 %cmp4, i8 %in0, i8 %in2
  %0 = icmp ult i8 %in0.in2, %in1
  %retval.0 = select i1 %0, i8 %in0.in2, i8 %in1
  ret i8 %retval.0
}

; Function Attrs: argmemonly norecurse nounwind readnone willreturn
define zeroext i8 @_Z8find_maxhhh(i8 zeroext %in0, i8 zeroext %in1, i8 zeroext %in2) local_unnamed_addr #4 {
entry:
  %cmp4 = icmp ugt i8 %in0, %in2
  %in0.in2 = select i1 %cmp4, i8 %in0, i8 %in2
  %0 = icmp ugt i8 %in0.in2, %in1
  %retval.0 = select i1 %0, i8 %in0.in2, i8 %in1
  ret i8 %retval.0
}

; Function Attrs: argmemonly norecurse nounwind willreturn
define void @_Z10projection11Triangle_3DP11Triangle_2Di(%struct.Triangle_3D* byval readonly align 1 %triangle_3d, %struct.Triangle_2D* %triangle_2d, i32 %angle) local_unnamed_addr #5 {
entry:
  switch i32 %angle, label %if.end69 [
    i32 0, label %if.then
    i32 1, label %if.then14
    i32 2, label %if.then42
  ]

if.then:                                          ; preds = %entry
  %x0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 0
  %0 = load i8, i8* %x0, align 1
  %x01 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0
  store i8 %0, i8* %x01, align 1
  %y0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 1
  %1 = load i8, i8* %y0, align 1
  %y02 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1
  store i8 %1, i8* %y02, align 1
  %x1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 3
  %2 = load i8, i8* %x1, align 1
  %x13 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2
  store i8 %2, i8* %x13, align 1
  %y1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 4
  %3 = load i8, i8* %y1, align 1
  %y14 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3
  store i8 %3, i8* %y14, align 1
  %x2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 6
  %4 = load i8, i8* %x2, align 1
  %x25 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4
  store i8 %4, i8* %x25, align 1
  %y2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 7
  %5 = load i8, i8* %y2, align 1
  %y26 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5
  store i8 %5, i8* %y26, align 1
  %z0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 2
  %6 = load i8, i8* %z0, align 1
  %7 = udiv i8 %6, 3
  %z1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 5
  %8 = load i8, i8* %z1, align 1
  %9 = udiv i8 %8, 3
  %addconv2 = add nuw i8 %9, %7
  %z2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 8
  br label %if.end69.sink.split

if.then14:                                        ; preds = %entry
  %x015 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 0
  %10 = load i8, i8* %x015, align 1
  %x016 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0
  store i8 %10, i8* %x016, align 1
  %z017 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 2
  %11 = load i8, i8* %z017, align 1
  %y018 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1
  store i8 %11, i8* %y018, align 1
  %x119 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 3
  %12 = load i8, i8* %x119, align 1
  %x120 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2
  store i8 %12, i8* %x120, align 1
  %z121 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 5
  %13 = load i8, i8* %z121, align 1
  %y122 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3
  store i8 %13, i8* %y122, align 1
  %x223 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 6
  %14 = load i8, i8* %x223, align 1
  %x224 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4
  store i8 %14, i8* %x224, align 1
  %z225 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 8
  %15 = load i8, i8* %z225, align 1
  %y226 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5
  store i8 %15, i8* %y226, align 1
  %y027 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 1
  %16 = load i8, i8* %y027, align 1
  %17 = udiv i8 %16, 3
  %y130 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 4
  %18 = load i8, i8* %y130, align 1
  %19 = udiv i8 %18, 3
  %addconv1 = add nuw i8 %19, %17
  %y234 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 7
  br label %if.end69.sink.split

if.then42:                                        ; preds = %entry
  %z043 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 2
  %20 = load i8, i8* %z043, align 1
  %x044 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0
  store i8 %20, i8* %x044, align 1
  %y045 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 1
  %21 = load i8, i8* %y045, align 1
  %y046 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1
  store i8 %21, i8* %y046, align 1
  %z147 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 5
  %22 = load i8, i8* %z147, align 1
  %x148 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2
  store i8 %22, i8* %x148, align 1
  %y149 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 4
  %23 = load i8, i8* %y149, align 1
  %y150 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3
  store i8 %23, i8* %y150, align 1
  %z251 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 8
  %24 = load i8, i8* %z251, align 1
  %x252 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4
  store i8 %24, i8* %x252, align 1
  %y253 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 7
  %25 = load i8, i8* %y253, align 1
  %y254 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5
  store i8 %25, i8* %y254, align 1
  %x055 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 0
  %26 = load i8, i8* %x055, align 1
  %27 = udiv i8 %26, 3
  %x158 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 3
  %28 = load i8, i8* %x158, align 1
  %29 = udiv i8 %28, 3
  %addconv = add nuw i8 %29, %27
  %x262 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 6
  br label %if.end69.sink.split

if.end69.sink.split:                              ; preds = %if.then42, %if.then14, %if.then
  %y234.sink = phi i8* [ %y234, %if.then14 ], [ %x262, %if.then42 ], [ %z2, %if.then ]
  %addconv1.sink = phi i8 [ %addconv1, %if.then14 ], [ %addconv, %if.then42 ], [ %addconv2, %if.then ]
  %30 = load i8, i8* %y234.sink, align 1
  %31 = udiv i8 %30, 3
  %add37 = add i8 %addconv1.sink, %31
  %z39 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 6
  store i8 %add37, i8* %z39, align 1
  br label %if.end69

if.end69:                                         ; preds = %if.end69.sink.split, %entry
  ret void
}

; Function Attrs: argmemonly norecurse nounwind willreturn
define zeroext i1 @_Z14rasterization111Triangle_2DPhPi(%struct.Triangle_2D* byval align 1 %triangle_2d, i8* nocapture %max_min, i32* nocapture %max_index) local_unnamed_addr #6 {
entry:
  %.elt = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0
  %.unpack = load i8, i8* %.elt, align 1
  %.elt15 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1
  %.unpack16 = load i8, i8* %.elt15, align 1
  %.elt17 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2
  %.unpack18 = load i8, i8* %.elt17, align 1
  %.elt19 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3
  %.unpack20 = load i8, i8* %.elt19, align 1
  %.elt21 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4
  %.unpack22 = load i8, i8* %.elt21, align 1
  %.elt23 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5
  %.unpack24 = load i8, i8* %.elt23, align 1
  %conv.i = zext i8 %.unpack22 to i32
  %conv1.i = zext i8 %.unpack to i32
  %sub.i = sub nsw i32 %conv.i, %conv1.i
  %conv2.i = zext i8 %.unpack20 to i32
  %conv3.i = zext i8 %.unpack16 to i32
  %sub4.i = sub nsw i32 %conv2.i, %conv3.i
  %mul.i = mul nsw i32 %sub.i, %sub4.i
  %conv5.i = zext i8 %.unpack24 to i32
  %sub8.i = sub nsw i32 %conv5.i, %conv3.i
  %conv9.i = zext i8 %.unpack18 to i32
  %sub12.i = sub nsw i32 %conv9.i, %conv1.i
  %mul13.i = mul nsw i32 %sub8.i, %sub12.i
  %sub14.i = sub nsw i32 %mul.i, %mul13.i
  %cmp = icmp eq i32 %sub14.i, 0
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %cmp3 = icmp slt i32 %sub14.i, 0
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store i8 %.unpack18, i8* %.elt, align 1
  store i8 %.unpack20, i8* %.elt15, align 1
  store i8 %.unpack, i8* %.elt17, align 1
  store i8 %.unpack16, i8* %.elt19, align 1
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %0 = phi i8 [ %.unpack16, %if.then4 ], [ %.unpack20, %if.end ]
  %1 = phi i8 [ %.unpack20, %if.then4 ], [ %.unpack16, %if.end ]
  %2 = phi i8 [ %.unpack, %if.then4 ], [ %.unpack18, %if.end ]
  %3 = phi i8 [ %.unpack18, %if.then4 ], [ %.unpack, %if.end ]
  %cmp4.i47 = icmp ult i8 %3, %.unpack22
  %in0.in2.i48 = select i1 %cmp4.i47, i8 %3, i8 %.unpack22
  %4 = icmp ult i8 %in0.in2.i48, %2
  %retval.0.i49 = select i1 %4, i8 %in0.in2.i48, i8 %2
  store i8 %retval.0.i49, i8* %max_min, align 1
  %cmp4.i44 = icmp ugt i8 %3, %.unpack22
  %in0.in2.i45 = select i1 %cmp4.i44, i8 %3, i8 %.unpack22
  %5 = icmp ugt i8 %in0.in2.i45, %2
  %retval.0.i46 = select i1 %5, i8 %in0.in2.i45, i8 %2
  %arrayidx11 = getelementptr inbounds i8, i8* %max_min, i64 1
  store i8 %retval.0.i46, i8* %arrayidx11, align 1
  %cmp4.i41 = icmp ult i8 %1, %.unpack24
  %in0.in2.i42 = select i1 %cmp4.i41, i8 %1, i8 %.unpack24
  %6 = icmp ult i8 %in0.in2.i42, %0
  %retval.0.i43 = select i1 %6, i8 %in0.in2.i42, i8 %0
  %arrayidx13 = getelementptr inbounds i8, i8* %max_min, i64 2
  store i8 %retval.0.i43, i8* %arrayidx13, align 1
  %cmp4.i = icmp ugt i8 %1, %.unpack24
  %in0.in2.i = select i1 %cmp4.i, i8 %1, i8 %.unpack24
  %7 = icmp ugt i8 %in0.in2.i, %0
  %retval.0.i = select i1 %7, i8 %in0.in2.i, i8 %0
  %arrayidx18 = getelementptr inbounds i8, i8* %max_min, i64 3
  store i8 %retval.0.i, i8* %arrayidx18, align 1
  %sub = sub i8 %retval.0.i46, %retval.0.i49
  %arrayidx23 = getelementptr inbounds i8, i8* %max_min, i64 4
  store i8 %sub, i8* %arrayidx23, align 1
  %conv25 = zext i8 %retval.0.i46 to i32
  %conv27 = zext i8 %retval.0.i49 to i32
  %sub28 = sub nsw i32 %conv25, %conv27
  %conv30 = zext i8 %retval.0.i to i32
  %conv32 = zext i8 %retval.0.i43 to i32
  %sub33 = sub nsw i32 %conv30, %conv32
  %mul = mul nsw i32 %sub33, %sub28
  store i32 %mul, i32* %max_index, align 4
  br label %return

return:                                           ; preds = %if.end5, %entry
  %retval.0 = phi i1 [ false, %if.end5 ], [ true, %entry ]
  ret i1 %retval.0
}

; Function Attrs: argmemonly norecurse nounwind
define i32 @_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel(i1 zeroext %flag, i8* nocapture readonly %max_min, i32* nocapture readonly %max_index, %struct.Triangle_2D* byval nocapture readonly align 1 %triangle_2d, %struct.CandidatePixel* nocapture %fragment) local_unnamed_addr #7 {
entry:
  br i1 %flag, label %return, label %if.end

if.end:                                           ; preds = %entry
  %0 = load i32, i32* %max_index, align 4
  %cmp13 = icmp sgt i32 %0, 0
  br i1 %cmp13, label %for.body.lr.ph, label %return

for.body.lr.ph:                                   ; preds = %if.end
  %arrayidx2 = getelementptr inbounds i8, i8* %max_min, i64 4
  %arrayidx5 = getelementptr inbounds i8, i8* %max_min, i64 2
  %.elt = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0
  %.unpack = load i8, i8* %.elt, align 1
  %.elt1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1
  %.unpack2 = load i8, i8* %.elt1, align 1
  %.elt3 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2
  %.unpack4 = load i8, i8* %.elt3, align 1
  %.elt5 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3
  %.unpack6 = load i8, i8* %.elt5, align 1
  %.elt7 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4
  %.unpack8 = load i8, i8* %.elt7, align 1
  %.elt9 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5
  %.unpack10 = load i8, i8* %.elt9, align 1
  %.elt11 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 6
  %conv1.i = zext i8 %.unpack to i32
  %conv2.i = zext i8 %.unpack6 to i32
  %conv3.i = zext i8 %.unpack2 to i32
  %sub4.i = sub nsw i32 %conv2.i, %conv3.i
  %conv9.i = zext i8 %.unpack4 to i32
  %sub12.i = sub nsw i32 %conv9.i, %conv1.i
  %conv19.i = zext i8 %.unpack10 to i32
  %sub22.i = sub nsw i32 %conv19.i, %conv2.i
  %conv28.i = zext i8 %.unpack8 to i32
  %sub31.i = sub nsw i32 %conv28.i, %conv9.i
  %sub42.i = sub nsw i32 %conv3.i, %conv19.i
  %sub52.i = sub nsw i32 %conv1.i, %conv28.i
  %1 = load i8, i8* %.elt11, align 1
  br label %for.body

for.body:                                         ; preds = %if.end23, %for.body.lr.ph
  %k.015 = phi i32 [ 0, %for.body.lr.ph ], [ %inc24, %if.end23 ]
  %i.014 = phi i32 [ 0, %for.body.lr.ph ], [ %i.1, %if.end23 ]
  %2 = load i8, i8* %max_min, align 1
  %3 = load i8, i8* %arrayidx2, align 1
  %conv3 = zext i8 %3 to i32
  %rem.urem = urem i32 %k.015, %conv3
  %4 = trunc i32 %rem.urem to i8
  %conv4 = add i8 %2, %4
  %5 = load i8, i8* %arrayidx5, align 1
  %div.udiv = udiv i32 %k.015, %conv3
  %6 = trunc i32 %div.udiv to i8
  %conv10 = add i8 %5, %6
  %conv.i = zext i8 %conv4 to i32
  %sub.i = sub nsw i32 %conv.i, %conv1.i
  %mul.i = mul nsw i32 %sub4.i, %sub.i
  %conv5.i = zext i8 %conv10 to i32
  %sub8.i = sub nsw i32 %conv5.i, %conv3.i
  %mul13.i = mul nsw i32 %sub12.i, %sub8.i
  %sub18.i = sub nsw i32 %conv.i, %conv9.i
  %mul23.i = mul nsw i32 %sub22.i, %sub18.i
  %sub27.i = sub nsw i32 %conv5.i, %conv2.i
  %mul32.i = mul nsw i32 %sub31.i, %sub27.i
  %sub37.i = sub nsw i32 %conv.i, %conv28.i
  %mul43.i = mul nsw i32 %sub42.i, %sub37.i
  %sub47.i = sub nsw i32 %conv5.i, %conv19.i
  %mul53.i = mul nsw i32 %sub47.i, %sub52.i
  %cmp.i = icmp sge i32 %mul.i, %mul13.i
  %cmp55.i = icmp sge i32 %mul23.i, %mul32.i
  %or.cond.i = and i1 %cmp.i, %cmp55.i
  %cmp56.i = icmp sge i32 %mul43.i, %mul53.i
  %or.cond = and i1 %cmp56.i, %or.cond.i
  br i1 %or.cond, label %if.then11, label %if.end23

if.then11:                                        ; preds = %for.body
  %idxprom = sext i32 %i.014 to i64
  %x13 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragment, i64 %idxprom, i32 0
  store i8 %conv4, i8* %x13, align 1
  %y16 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragment, i64 %idxprom, i32 1
  store i8 %conv10, i8* %y16, align 1
  %z19 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragment, i64 %idxprom, i32 2
  store i8 %1, i8* %z19, align 1
  %color22 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragment, i64 %idxprom, i32 3
  store i8 100, i8* %color22, align 1
  %inc = add i32 %i.014, 1
  br label %if.end23

if.end23:                                         ; preds = %if.then11, %for.body
  %i.1 = phi i32 [ %inc, %if.then11 ], [ %i.014, %for.body ]
  %inc24 = add nuw nsw i32 %k.015, 1
  %7 = load i32, i32* %max_index, align 4
  %cmp = icmp slt i32 %inc24, %7
  br i1 %cmp, label %for.body, label %return, !llvm.loop !4

return:                                           ; preds = %if.end23, %if.end, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ 0, %if.end ], [ %i.1, %if.end23 ]
  ret i32 %retval.0
}

; Function Attrs: norecurse nounwind
define i32 @_Z8zcullingiP14CandidatePixeliP5Pixel(i32 %counter, %struct.CandidatePixel* nocapture readonly %fragments, i32 %size, %struct.Pixel* nocapture %pixels) local_unnamed_addr #8 {
entry:
  %cmp = icmp eq i32 %counter, 0
  br i1 %cmp, label %ZCULLING_INIT_ROW, label %if.end

ZCULLING_INIT_ROW:                                ; preds = %entry
  call void @llvm.memset.p0i8.i64(i8* align 1 getelementptr inbounds ([256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 0, i64 0), i8 -1, i64 65536, i1 false)
  br label %if.end

if.end:                                           ; preds = %ZCULLING_INIT_ROW, %entry
  %cmp121 = icmp sgt i32 %size, 0
  br i1 %cmp121, label %for.body14.lr.ph, label %for.cond.cleanup13

for.body14.lr.ph:                                 ; preds = %if.end
  %wide.trip.count = zext i32 %size to i64
  br label %for.body14

for.cond.cleanup13:                               ; preds = %for.inc60, %if.end
  %pixel_cntr.0.lcssa = phi i32 [ 0, %if.end ], [ %pixel_cntr.1, %for.inc60 ]
  ret i32 %pixel_cntr.0.lcssa

for.body14:                                       ; preds = %for.inc60, %for.body14.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body14.lr.ph ], [ %indvars.iv.next, %for.inc60 ]
  %pixel_cntr.02 = phi i32 [ 0, %for.body14.lr.ph ], [ %pixel_cntr.1, %for.inc60 ]
  %z = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragments, i64 %indvars.iv, i32 2
  %0 = load i8, i8* %z, align 1
  %y = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragments, i64 %indvars.iv, i32 1
  %1 = load i8, i8* %y, align 1
  %idxprom19 = zext i8 %1 to i64
  %x = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragments, i64 %indvars.iv, i32 0
  %2 = load i8, i8* %x, align 1
  %idxprom23 = zext i8 %2 to i64
  %arrayidx24 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom19, i64 %idxprom23
  %3 = load i8, i8* %arrayidx24, align 1
  %cmp26 = icmp ult i8 %0, %3
  br i1 %cmp26, label %if.then27, label %for.inc60

if.then27:                                        ; preds = %for.body14
  %idxprom31 = sext i32 %pixel_cntr.02 to i64
  %x33 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %idxprom31, i32 0
  store i8 %2, i8* %x33, align 1
  %4 = load i8, i8* %y, align 1
  %y39 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %idxprom31, i32 1
  store i8 %4, i8* %y39, align 1
  %color = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragments, i64 %indvars.iv, i32 3
  %5 = load i8, i8* %color, align 1
  %color44 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %idxprom31, i32 2
  store i8 %5, i8* %color44, align 1
  %inc45 = add i32 %pixel_cntr.02, 1
  %6 = load i8, i8* %z, align 1
  %7 = load i8, i8* %y, align 1
  %idxprom52 = zext i8 %7 to i64
  %8 = load i8, i8* %x, align 1
  %idxprom57 = zext i8 %8 to i64
  %arrayidx58 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom52, i64 %idxprom57
  store i8 %6, i8* %arrayidx58, align 1
  br label %for.inc60

for.inc60:                                        ; preds = %if.then27, %for.body14
  %pixel_cntr.1 = phi i32 [ %inc45, %if.then27 ], [ %pixel_cntr.02, %for.body14 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond.cleanup13, label %for.body14, !llvm.loop !6
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #9

; Function Attrs: argmemonly norecurse nounwind
define void @_Z10coloringFBiiP5PixelPA256_h(i32 %counter, i32 %size_pixels, %struct.Pixel* nocapture readonly %pixels, [256 x i8]* nocapture "fpga.decayed.dim.hint"="256" %frame_buffer) local_unnamed_addr #10 {
entry:
  %frame_buffer9 = getelementptr inbounds [256 x i8], [256 x i8]* %frame_buffer, i64 0, i64 0
  %cmp = icmp eq i32 %counter, 0
  br i1 %cmp, label %COLORING_FB_INIT_ROW, label %COLORING_FB

COLORING_FB_INIT_ROW:                             ; preds = %entry
  call void @llvm.memset.p0i8.i64(i8* align 1 %frame_buffer9, i8 0, i64 65536, i1 false)
  br label %COLORING_FB

COLORING_FB:                                      ; preds = %COLORING_FB_INIT_ROW, %entry
  %cmp131 = icmp sgt i32 %size_pixels, 0
  br i1 %cmp131, label %for.body15.lr.ph, label %for.cond.cleanup14

for.body15.lr.ph:                                 ; preds = %COLORING_FB
  %wide.trip.count = zext i32 %size_pixels to i64
  br label %for.body15

for.cond.cleanup14:                               ; preds = %for.body15, %COLORING_FB
  ret void

for.body15:                                       ; preds = %for.body15, %for.body15.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body15.lr.ph ], [ %indvars.iv.next, %for.body15 ]
  %color = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %indvars.iv, i32 2
  %0 = load i8, i8* %color, align 1
  %x = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %indvars.iv, i32 0
  %1 = load i8, i8* %x, align 1
  %idxprom20 = zext i8 %1 to i64
  %y = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %indvars.iv, i32 1
  %2 = load i8, i8* %y, align 1
  %idxprom24 = zext i8 %2 to i64
  %arrayidx25 = getelementptr inbounds [256 x i8], [256 x i8]* %frame_buffer, i64 %idxprom20, i64 %idxprom24
  store i8 %0, i8* %arrayidx25, align 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond.cleanup14, label %for.body15, !llvm.loop !8
}

; Function Attrs: nounwind
define void @_Z9renderingP11Triangle_3DPA256_h(%struct.Triangle_3D* nocapture readonly "fpga.decayed.dim.hint"="3192" %triangle_3ds, [256 x i8]* nocapture "fpga.decayed.dim.hint"="256" %output) #11 !fpga.function.pragma !10 {
entry:
  %fragment = alloca [500 x %struct.CandidatePixel], align 1
  %pixels = alloca [500 x %struct.Pixel], align 1
  %0 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 2000, i8* nonnull %0) #14
  %1 = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 1500, i8* nonnull %1) #14
  %frame_buffer9.i = getelementptr inbounds [256 x i8], [256 x i8]* %output, i64 0, i64 0
  br label %for.body

for.cond.cleanup:                                 ; preds = %_Z10coloringFBiiP5PixelPA256_h.exit
  call void @llvm.lifetime.end.p0i8(i64 1500, i8* nonnull %1) #14
  call void @llvm.lifetime.end.p0i8(i64 2000, i8* nonnull %0) #14
  ret void

for.body:                                         ; preds = %_Z10coloringFBiiP5PixelPA256_h.exit, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %_Z10coloringFBiiP5PixelPA256_h.exit ]
  %.elt = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 0
  %.unpack = load i8, i8* %.elt, align 1
  %.elt57 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 1
  %.unpack58 = load i8, i8* %.elt57, align 1
  %.elt59 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 2
  %.unpack60 = load i8, i8* %.elt59, align 1
  %.elt61 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 3
  %.unpack62 = load i8, i8* %.elt61, align 1
  %.elt63 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 4
  %.unpack64 = load i8, i8* %.elt63, align 1
  %.elt65 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 5
  %.unpack66 = load i8, i8* %.elt65, align 1
  %.elt67 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 6
  %.unpack68 = load i8, i8* %.elt67, align 1
  %.elt69 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 7
  %.unpack70 = load i8, i8* %.elt69, align 1
  %.elt71 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 8
  %.unpack72 = load i8, i8* %.elt71, align 1
  %2 = udiv i8 %.unpack60, 3
  %3 = udiv i8 %.unpack66, 3
  %addconv2.i = add nuw i8 %3, %2
  %4 = udiv i8 %.unpack72, 3
  %add11.i = add i8 %addconv2.i, %4
  %conv.i.i90 = zext i8 %.unpack68 to i32
  %conv1.i.i91 = zext i8 %.unpack to i32
  %sub.i.i92 = sub nsw i32 %conv.i.i90, %conv1.i.i91
  %conv2.i.i93 = zext i8 %.unpack64 to i32
  %conv3.i.i94 = zext i8 %.unpack58 to i32
  %sub4.i.i95 = sub nsw i32 %conv2.i.i93, %conv3.i.i94
  %mul.i.i96 = mul nsw i32 %sub.i.i92, %sub4.i.i95
  %conv5.i.i97 = zext i8 %.unpack70 to i32
  %sub8.i.i98 = sub nsw i32 %conv5.i.i97, %conv3.i.i94
  %conv9.i.i99 = zext i8 %.unpack62 to i32
  %sub12.i.i100 = sub nsw i32 %conv9.i.i99, %conv1.i.i91
  %mul13.i.i101 = mul nsw i32 %sub8.i.i98, %sub12.i.i100
  %sub14.i.i = sub nsw i32 %mul.i.i96, %mul13.i.i101
  %cmp.i102 = icmp eq i32 %sub14.i.i, 0
  br i1 %cmp.i102, label %_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit, label %if.end.i103

if.end.i103:                                      ; preds = %for.body
  %cmp3.i = icmp slt i32 %sub14.i.i, 0
  %spec.select = select i1 %cmp3.i, i8 %.unpack58, i8 %.unpack64
  %spec.select158 = select i1 %cmp3.i, i8 %.unpack64, i8 %.unpack58
  %spec.select159 = select i1 %cmp3.i, i8 %.unpack, i8 %.unpack62
  %spec.select160 = select i1 %cmp3.i, i8 %.unpack62, i8 %.unpack
  %cmp4.i47.i = icmp ult i8 %spec.select160, %.unpack68
  %in0.in2.i48.i = select i1 %cmp4.i47.i, i8 %spec.select160, i8 %.unpack68
  %5 = icmp ult i8 %in0.in2.i48.i, %spec.select159
  %retval.0.i49.i = select i1 %5, i8 %in0.in2.i48.i, i8 %spec.select159
  %cmp4.i44.i = icmp ugt i8 %spec.select160, %.unpack68
  %in0.in2.i45.i = select i1 %cmp4.i44.i, i8 %spec.select160, i8 %.unpack68
  %6 = icmp ugt i8 %in0.in2.i45.i, %spec.select159
  %retval.0.i46.i = select i1 %6, i8 %in0.in2.i45.i, i8 %spec.select159
  %cmp4.i41.i = icmp ult i8 %spec.select158, %.unpack70
  %in0.in2.i42.i = select i1 %cmp4.i41.i, i8 %spec.select158, i8 %.unpack70
  %7 = icmp ult i8 %in0.in2.i42.i, %spec.select
  %retval.0.i43.i = select i1 %7, i8 %in0.in2.i42.i, i8 %spec.select
  %cmp4.i.i = icmp ugt i8 %spec.select158, %.unpack70
  %in0.in2.i.i = select i1 %cmp4.i.i, i8 %spec.select158, i8 %.unpack70
  %8 = icmp ugt i8 %in0.in2.i.i, %spec.select
  %retval.0.i.i = select i1 %8, i8 %in0.in2.i.i, i8 %spec.select
  %sub.i = sub i8 %retval.0.i46.i, %retval.0.i49.i
  %conv25.i = zext i8 %retval.0.i46.i to i32
  %conv27.i = zext i8 %retval.0.i49.i to i32
  %sub28.i = sub nsw i32 %conv25.i, %conv27.i
  %conv30.i = zext i8 %retval.0.i.i to i32
  %conv32.i = zext i8 %retval.0.i43.i to i32
  %sub33.i = sub nsw i32 %conv30.i, %conv32.i
  %mul.i = mul nsw i32 %sub33.i, %sub28.i
  %cmp13.i = icmp sgt i32 %mul.i, 0
  br i1 %cmp13.i, label %for.body.lr.ph.i, label %_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit

for.body.lr.ph.i:                                 ; preds = %if.end.i103
  %sub22.i.i = sub nsw i32 %conv5.i.i97, %conv2.i.i93
  %sub31.i.i = sub nsw i32 %conv.i.i90, %conv9.i.i99
  %sub42.i.i = sub nsw i32 %conv3.i.i94, %conv5.i.i97
  %sub52.i.i = sub nsw i32 %conv1.i.i91, %conv.i.i90
  %conv3.i = zext i8 %sub.i to i32
  br label %for.body.i

for.body.i:                                       ; preds = %if.end23.i, %for.body.lr.ph.i
  %k.015.i = phi i32 [ 0, %for.body.lr.ph.i ], [ %inc24.i, %if.end23.i ]
  %i.014.i = phi i32 [ 0, %for.body.lr.ph.i ], [ %i.1.i, %if.end23.i ]
  %rem.urem.i = urem i32 %k.015.i, %conv3.i
  %9 = trunc i32 %rem.urem.i to i8
  %conv4.i = add i8 %retval.0.i49.i, %9
  %div.udiv.i = udiv i32 %k.015.i, %conv3.i
  %10 = trunc i32 %div.udiv.i to i8
  %conv10.i = add i8 %retval.0.i43.i, %10
  %conv.i.i = zext i8 %conv4.i to i32
  %sub.i.i = sub nsw i32 %conv.i.i, %conv1.i.i91
  %mul.i.i = mul nsw i32 %sub.i.i, %sub4.i.i95
  %conv5.i.i = zext i8 %conv10.i to i32
  %sub8.i.i = sub nsw i32 %conv5.i.i, %conv3.i.i94
  %mul13.i.i = mul nsw i32 %sub8.i.i, %sub12.i.i100
  %sub18.i.i = sub nsw i32 %conv.i.i, %conv9.i.i99
  %mul23.i.i = mul nsw i32 %sub18.i.i, %sub22.i.i
  %sub27.i.i = sub nsw i32 %conv5.i.i, %conv2.i.i93
  %mul32.i.i = mul nsw i32 %sub27.i.i, %sub31.i.i
  %sub37.i.i = sub nsw i32 %conv.i.i, %conv.i.i90
  %mul43.i.i = mul nsw i32 %sub37.i.i, %sub42.i.i
  %sub47.i.i = sub nsw i32 %conv5.i.i, %conv5.i.i97
  %mul53.i.i = mul nsw i32 %sub47.i.i, %sub52.i.i
  %cmp.i.i = icmp sge i32 %mul.i.i, %mul13.i.i
  %cmp55.i.i = icmp sge i32 %mul23.i.i, %mul32.i.i
  %or.cond.i.i = and i1 %cmp.i.i, %cmp55.i.i
  %cmp56.i.i = icmp sge i32 %mul43.i.i, %mul53.i.i
  %or.cond.i = and i1 %cmp56.i.i, %or.cond.i.i
  br i1 %or.cond.i, label %if.then11.i, label %if.end23.i

if.then11.i:                                      ; preds = %for.body.i
  %idxprom.i = sext i32 %i.014.i to i64
  %x13.i85 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %idxprom.i, i32 0
  store i8 %conv4.i, i8* %x13.i85, align 1
  %y16.i = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %idxprom.i, i32 1
  store i8 %conv10.i, i8* %y16.i, align 1
  %z19.i = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %idxprom.i, i32 2
  store i8 %add11.i, i8* %z19.i, align 1
  %color22.i = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %idxprom.i, i32 3
  store i8 100, i8* %color22.i, align 1
  %inc.i = add i32 %i.014.i, 1
  br label %if.end23.i

if.end23.i:                                       ; preds = %if.then11.i, %for.body.i
  %i.1.i = phi i32 [ %inc.i, %if.then11.i ], [ %i.014.i, %for.body.i ]
  %inc24.i = add nuw nsw i32 %k.015.i, 1
  %cmp.i86 = icmp slt i32 %inc24.i, %mul.i
  br i1 %cmp.i86, label %for.body.i, label %_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit, !llvm.loop !4

_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit: ; preds = %if.end23.i, %if.end.i103, %for.body
  %retval.0.i = phi i32 [ 0, %if.end.i103 ], [ 0, %for.body ], [ %i.1.i, %if.end23.i ]
  %cmp.i74 = icmp eq i64 %indvars.iv, 0
  br i1 %cmp.i74, label %ZCULLING_INIT_ROW.i, label %if.end.i

ZCULLING_INIT_ROW.i:                              ; preds = %_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit
  tail call void @llvm.memset.p0i8.i64(i8* align 1 getelementptr inbounds ([256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 0, i64 0), i8 -1, i64 65536, i1 false) #14
  br label %if.end.i

if.end.i:                                         ; preds = %ZCULLING_INIT_ROW.i, %_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit
  %cmp121.i = icmp sgt i32 %retval.0.i, 0
  br i1 %cmp121.i, label %for.body14.lr.ph.i, label %_Z8zcullingiP14CandidatePixeliP5Pixel.exit

for.body14.lr.ph.i:                               ; preds = %if.end.i
  %wide.trip.count.i75 = zext i32 %retval.0.i to i64
  br label %for.body14.i

for.body14.i:                                     ; preds = %for.inc60.i, %for.body14.lr.ph.i
  %indvars.iv.i76 = phi i64 [ 0, %for.body14.lr.ph.i ], [ %indvars.iv.next.i81, %for.inc60.i ]
  %pixel_cntr.02.i = phi i32 [ 0, %for.body14.lr.ph.i ], [ %pixel_cntr.1.i, %for.inc60.i ]
  %z.i77 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %indvars.iv.i76, i32 2
  %11 = load i8, i8* %z.i77, align 1
  %y.i78 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %indvars.iv.i76, i32 1
  %12 = load i8, i8* %y.i78, align 1
  %idxprom19.i = zext i8 %12 to i64
  %x.i79 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %indvars.iv.i76, i32 0
  %13 = load i8, i8* %x.i79, align 1
  %idxprom23.i = zext i8 %13 to i64
  %arrayidx24.i = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom19.i, i64 %idxprom23.i
  %14 = load i8, i8* %arrayidx24.i, align 1
  %cmp26.i = icmp ult i8 %11, %14
  br i1 %cmp26.i, label %if.then27.i, label %for.inc60.i

if.then27.i:                                      ; preds = %for.body14.i
  %idxprom31.i = sext i32 %pixel_cntr.02.i to i64
  %x33.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %idxprom31.i, i32 0
  store i8 %13, i8* %x33.i, align 1
  %y39.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %idxprom31.i, i32 1
  store i8 %12, i8* %y39.i, align 1
  %color.i80 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %indvars.iv.i76, i32 3
  %15 = load i8, i8* %color.i80, align 1
  %color44.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %idxprom31.i, i32 2
  store i8 %15, i8* %color44.i, align 1
  %inc45.i = add i32 %pixel_cntr.02.i, 1
  store i8 %11, i8* %arrayidx24.i, align 1
  br label %for.inc60.i

for.inc60.i:                                      ; preds = %if.then27.i, %for.body14.i
  %pixel_cntr.1.i = phi i32 [ %inc45.i, %if.then27.i ], [ %pixel_cntr.02.i, %for.body14.i ]
  %indvars.iv.next.i81 = add nuw nsw i64 %indvars.iv.i76, 1
  %exitcond.i82 = icmp eq i64 %indvars.iv.next.i81, %wide.trip.count.i75
  br i1 %exitcond.i82, label %_Z8zcullingiP14CandidatePixeliP5Pixel.exit, label %for.body14.i, !llvm.loop !6

_Z8zcullingiP14CandidatePixeliP5Pixel.exit:       ; preds = %for.inc60.i, %if.end.i
  %pixel_cntr.0.lcssa.i = phi i32 [ 0, %if.end.i ], [ %pixel_cntr.1.i, %for.inc60.i ]
  br i1 %cmp.i74, label %COLORING_FB_INIT_ROW.i, label %COLORING_FB.i

COLORING_FB_INIT_ROW.i:                           ; preds = %_Z8zcullingiP14CandidatePixeliP5Pixel.exit
  tail call void @llvm.memset.p0i8.i64(i8* align 1 %frame_buffer9.i, i8 0, i64 65536, i1 false) #14
  br label %COLORING_FB.i

COLORING_FB.i:                                    ; preds = %COLORING_FB_INIT_ROW.i, %_Z8zcullingiP14CandidatePixeliP5Pixel.exit
  %cmp131.i = icmp sgt i32 %pixel_cntr.0.lcssa.i, 0
  br i1 %cmp131.i, label %for.body15.lr.ph.i, label %_Z10coloringFBiiP5PixelPA256_h.exit

for.body15.lr.ph.i:                               ; preds = %COLORING_FB.i
  %wide.trip.count.i = zext i32 %pixel_cntr.0.lcssa.i to i64
  br label %for.body15.i

for.body15.i:                                     ; preds = %for.body15.i, %for.body15.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %for.body15.lr.ph.i ], [ %indvars.iv.next.i, %for.body15.i ]
  %color.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %indvars.iv.i, i32 2
  %16 = load i8, i8* %color.i, align 1
  %x.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %indvars.iv.i, i32 0
  %17 = load i8, i8* %x.i, align 1
  %idxprom20.i = zext i8 %17 to i64
  %y.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %indvars.iv.i, i32 1
  %18 = load i8, i8* %y.i, align 1
  %idxprom24.i = zext i8 %18 to i64
  %arrayidx25.i = getelementptr inbounds [256 x i8], [256 x i8]* %output, i64 %idxprom20.i, i64 %idxprom24.i
  store i8 %16, i8* %arrayidx25.i, align 1
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, %wide.trip.count.i
  br i1 %exitcond.i, label %_Z10coloringFBiiP5PixelPA256_h.exit, label %for.body15.i, !llvm.loop !8

_Z10coloringFBiiP5PixelPA256_h.exit:              ; preds = %for.body15.i, %COLORING_FB.i
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 3192
  br i1 %exitcond, label %for.cond.cleanup, label %for.body, !llvm.loop !12
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #9

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #9

; Function Attrs: noinline norecurse optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #12 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %triangle_3ds = alloca [3192 x %struct.Triangle_3D], align 16
  %output = alloca [256 x [256 x i8]], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1
  %1 = load i8*, i8** %arrayidx, align 8
  %arraydecay = getelementptr inbounds [3192 x %struct.Triangle_3D], [3192 x %struct.Triangle_3D]* %triangle_3ds, i32 0, i32 0
  call void @populateInput(i8* %1, %struct.Triangle_3D* %arraydecay)
  %arraydecay1 = getelementptr inbounds [3192 x %struct.Triangle_3D], [3192 x %struct.Triangle_3D]* %triangle_3ds, i32 0, i32 0
  %arraydecay2 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* %output, i32 0, i32 0
  call void @_Z9renderingP11Triangle_3DPA256_h(%struct.Triangle_3D* %arraydecay1, [256 x i8]* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* %output, i32 0, i32 0
  call void @populateOutput([256 x i8]* %arraydecay3)
  ret i32 0
}

declare void @populateInput(i8*, %struct.Triangle_3D*) #13

declare void @populateOutput([256 x i8]*) #13

attributes #0 = { argmemonly norecurse nounwind readonly willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="check_clockwise" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly norecurse nounwind willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="clockwise_vertices" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly norecurse nounwind readonly willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="pixel_in_triangle" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly norecurse nounwind readnone willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="find_min" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly norecurse nounwind readnone willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="find_max" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly norecurse nounwind willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="projection" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly norecurse nounwind willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="rasterization1" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="rasterization2" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="zculling" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { argmemonly nounwind willreturn }
attributes #10 = { argmemonly norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="coloringFB" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="rendering" "fpga.top.func"="rendering" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.name", !"RAST2"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.name", !"ZCULLING"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.name", !"COLORING_FB"}
!10 = !{!11}
!11 = !{!"fpga.top", !"user"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.name", !"TRIANGLES"}
