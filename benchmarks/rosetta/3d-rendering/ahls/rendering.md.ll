; ModuleID = '<stdin>'
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
  %x2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4, !opID !5, !opSignedness !6
  %0 = load i8, i8* %x2, align 1, !opID !7, !opSignedness !6
  %conv = zext i8 %0 to i32, !opID !8, !opSignedness !6
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !9, !opSignedness !6
  %1 = load i8, i8* %x0, align 1, !opID !10, !opSignedness !6
  %conv1 = zext i8 %1 to i32, !opID !11, !opSignedness !6
  %sub = sub nsw i32 %conv, %conv1, !opID !12, !opSignedness !6
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !13, !opSignedness !6
  %2 = load i8, i8* %y1, align 1, !opID !14, !opSignedness !6
  %conv2 = zext i8 %2 to i32, !opID !15, !opSignedness !6
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !16, !opSignedness !6
  %3 = load i8, i8* %y0, align 1, !opID !17, !opSignedness !6
  %conv3 = zext i8 %3 to i32, !opID !18, !opSignedness !6
  %sub4 = sub nsw i32 %conv2, %conv3, !opID !19, !opSignedness !6
  %mul = mul nsw i32 %sub4, %sub, !opID !20, !opSignedness !6
  %y2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5, !opID !21, !opSignedness !6
  %4 = load i8, i8* %y2, align 1, !opID !22, !opSignedness !6
  %conv5 = zext i8 %4 to i32, !opID !23, !opSignedness !6
  %sub8 = sub nsw i32 %conv5, %conv3, !opID !24, !opSignedness !6
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !25, !opSignedness !6
  %5 = load i8, i8* %x1, align 1, !opID !26, !opSignedness !6
  %conv9 = zext i8 %5 to i32, !opID !27, !opSignedness !6
  %sub12 = sub nsw i32 %conv9, %conv1, !opID !28, !opSignedness !6
  %mul13 = mul nsw i32 %sub12, %sub8, !opID !29, !opSignedness !6
  %sub14 = sub nsw i32 %mul, %mul13, !opID !30, !opSignedness !6
  ret i32 %sub14, !opID !31, !opSignedness !6
}

; Function Attrs: argmemonly norecurse nounwind willreturn
define void @_Z18clockwise_verticesP11Triangle_2D(%struct.Triangle_2D* nocapture %triangle_2d) local_unnamed_addr #1 {
entry:
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !32, !opSignedness !6
  %0 = load i8, i8* %x0, align 1, !opID !33, !opSignedness !6
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !34, !opSignedness !6
  %1 = load i8, i8* %y0, align 1, !opID !35, !opSignedness !6
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !36, !opSignedness !6
  %2 = load i8, i8* %x1, align 1, !opID !37, !opSignedness !6
  store i8 %2, i8* %x0, align 1, !opID !38, !opSignedness !6
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !39, !opSignedness !6
  %3 = load i8, i8* %y1, align 1, !opID !40, !opSignedness !6
  store i8 %3, i8* %y0, align 1, !opID !41, !opSignedness !6
  store i8 %0, i8* %x1, align 1, !opID !42, !opSignedness !6
  store i8 %1, i8* %y1, align 1, !opID !43, !opSignedness !6
  ret void, !opID !44, !opSignedness !6
}

; Function Attrs: argmemonly norecurse nounwind readonly willreturn
define zeroext i1 @_Z17pixel_in_trianglehh11Triangle_2D(i8 zeroext %x, i8 zeroext %y, %struct.Triangle_2D* byval nocapture readonly align 1 %triangle_2d) local_unnamed_addr #2 {
entry:
  %conv = zext i8 %x to i32, !opID !45, !opSignedness !6
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !46, !opSignedness !6
  %0 = load i8, i8* %x0, align 1, !opID !47, !opSignedness !6
  %conv1 = zext i8 %0 to i32, !opID !48, !opSignedness !6
  %sub = sub nsw i32 %conv, %conv1, !opID !49, !opSignedness !6
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !50, !opSignedness !6
  %1 = load i8, i8* %y1, align 1, !opID !51, !opSignedness !6
  %conv2 = zext i8 %1 to i32, !opID !52, !opSignedness !6
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !53, !opSignedness !6
  %2 = load i8, i8* %y0, align 1, !opID !54, !opSignedness !6
  %conv3 = zext i8 %2 to i32, !opID !55, !opSignedness !6
  %sub4 = sub nsw i32 %conv2, %conv3, !opID !56, !opSignedness !6
  %mul = mul nsw i32 %sub4, %sub, !opID !57, !opSignedness !6
  %conv5 = zext i8 %y to i32, !opID !58, !opSignedness !6
  %sub8 = sub nsw i32 %conv5, %conv3, !opID !59, !opSignedness !6
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !60, !opSignedness !6
  %3 = load i8, i8* %x1, align 1, !opID !61, !opSignedness !6
  %conv9 = zext i8 %3 to i32, !opID !62, !opSignedness !6
  %sub12 = sub nsw i32 %conv9, %conv1, !opID !63, !opSignedness !6
  %mul13 = mul nsw i32 %sub12, %sub8, !opID !64, !opSignedness !6
  %sub18 = sub nsw i32 %conv, %conv9, !opID !65, !opSignedness !6
  %y2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5, !opID !66, !opSignedness !6
  %4 = load i8, i8* %y2, align 1, !opID !67, !opSignedness !6
  %conv19 = zext i8 %4 to i32, !opID !68, !opSignedness !6
  %sub22 = sub nsw i32 %conv19, %conv2, !opID !69, !opSignedness !6
  %mul23 = mul nsw i32 %sub22, %sub18, !opID !70, !opSignedness !6
  %sub27 = sub nsw i32 %conv5, %conv2, !opID !71, !opSignedness !6
  %x2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4, !opID !72, !opSignedness !6
  %5 = load i8, i8* %x2, align 1, !opID !73, !opSignedness !6
  %conv28 = zext i8 %5 to i32, !opID !74, !opSignedness !6
  %sub31 = sub nsw i32 %conv28, %conv9, !opID !75, !opSignedness !6
  %mul32 = mul nsw i32 %sub31, %sub27, !opID !76, !opSignedness !6
  %sub37 = sub nsw i32 %conv, %conv28, !opID !77, !opSignedness !6
  %sub42 = sub nsw i32 %conv3, %conv19, !opID !78, !opSignedness !6
  %mul43 = mul nsw i32 %sub37, %sub42, !opID !79, !opSignedness !6
  %sub47 = sub nsw i32 %conv5, %conv19, !opID !80, !opSignedness !6
  %sub52 = sub nsw i32 %conv1, %conv28, !opID !81, !opSignedness !6
  %mul53 = mul nsw i32 %sub52, %sub47, !opID !82, !opSignedness !6
  %cmp = icmp sge i32 %mul, %mul13, !opID !83, !opSignedness !6
  %cmp55 = icmp sge i32 %mul23, %mul32, !opID !84, !opSignedness !6
  %or.cond = and i1 %cmp, %cmp55, !opID !85, !opSignedness !6
  br i1 %or.cond, label %land.rhs, label %land.end, !opID !86, !opSignedness !6

land.rhs:                                         ; preds = %entry
  %cmp56 = icmp sge i32 %mul43, %mul53, !opID !87, !opSignedness !6
  br label %land.end, !opID !88, !opSignedness !6

land.end:                                         ; preds = %land.rhs, %entry
  %6 = phi i1 [ false, %entry ], [ %cmp56, %land.rhs ], !opID !89, !opSignedness !6
  ret i1 %6, !opID !90, !opSignedness !6
}

; Function Attrs: argmemonly norecurse nounwind readnone willreturn
define zeroext i8 @_Z8find_minhhh(i8 zeroext %in0, i8 zeroext %in1, i8 zeroext %in2) local_unnamed_addr #3 {
entry:
  %cmp4 = icmp ult i8 %in0, %in2, !opID !91, !opSignedness !6
  %in0.in2 = select i1 %cmp4, i8 %in0, i8 %in2, !opID !92, !opSignedness !6
  %0 = icmp ult i8 %in0.in2, %in1, !opID !93, !opSignedness !6
  %retval.0 = select i1 %0, i8 %in0.in2, i8 %in1, !opID !94, !opSignedness !6
  ret i8 %retval.0, !opID !95, !opSignedness !6
}

; Function Attrs: argmemonly norecurse nounwind readnone willreturn
define zeroext i8 @_Z8find_maxhhh(i8 zeroext %in0, i8 zeroext %in1, i8 zeroext %in2) local_unnamed_addr #4 {
entry:
  %cmp4 = icmp ugt i8 %in0, %in2, !opID !96, !opSignedness !6
  %in0.in2 = select i1 %cmp4, i8 %in0, i8 %in2, !opID !97, !opSignedness !6
  %0 = icmp ugt i8 %in0.in2, %in1, !opID !98, !opSignedness !6
  %retval.0 = select i1 %0, i8 %in0.in2, i8 %in1, !opID !99, !opSignedness !6
  ret i8 %retval.0, !opID !100, !opSignedness !6
}

; Function Attrs: argmemonly norecurse nounwind willreturn
define void @_Z10projection11Triangle_3DP11Triangle_2Di(%struct.Triangle_3D* byval readonly align 1 %triangle_3d, %struct.Triangle_2D* %triangle_2d, i32 %angle) local_unnamed_addr #5 {
entry:
  switch i32 %angle, label %if.end69 [
    i32 0, label %if.then
    i32 1, label %if.then14
    i32 2, label %if.then42
  ], !opID !101, !opSignedness !6

if.then:                                          ; preds = %entry
  %x0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 0, !opID !102, !opSignedness !6
  %0 = load i8, i8* %x0, align 1, !opID !103, !opSignedness !6
  %x01 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !104, !opSignedness !6
  store i8 %0, i8* %x01, align 1, !opID !105, !opSignedness !6
  %y0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 1, !opID !106, !opSignedness !6
  %1 = load i8, i8* %y0, align 1, !opID !107, !opSignedness !6
  %y02 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !108, !opSignedness !6
  store i8 %1, i8* %y02, align 1, !opID !109, !opSignedness !6
  %x1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 3, !opID !110, !opSignedness !6
  %2 = load i8, i8* %x1, align 1, !opID !111, !opSignedness !6
  %x13 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !112, !opSignedness !6
  store i8 %2, i8* %x13, align 1, !opID !113, !opSignedness !6
  %y1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 4, !opID !114, !opSignedness !6
  %3 = load i8, i8* %y1, align 1, !opID !115, !opSignedness !6
  %y14 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !116, !opSignedness !6
  store i8 %3, i8* %y14, align 1, !opID !117, !opSignedness !6
  %x2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 6, !opID !118, !opSignedness !6
  %4 = load i8, i8* %x2, align 1, !opID !119, !opSignedness !6
  %x25 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4, !opID !120, !opSignedness !6
  store i8 %4, i8* %x25, align 1, !opID !121, !opSignedness !6
  %y2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 7, !opID !122, !opSignedness !6
  %5 = load i8, i8* %y2, align 1, !opID !123, !opSignedness !6
  %y26 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5, !opID !124, !opSignedness !6
  store i8 %5, i8* %y26, align 1, !opID !125, !opSignedness !6
  %z0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 2, !opID !126, !opSignedness !6
  %6 = load i8, i8* %z0, align 1, !opID !127, !opSignedness !6
  %7 = udiv i8 %6, 3, !opID !128, !opSignedness !6
  %z1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 5, !opID !129, !opSignedness !6
  %8 = load i8, i8* %z1, align 1, !opID !130, !opSignedness !6
  %9 = udiv i8 %8, 3, !opID !131, !opSignedness !6
  %addconv2 = add nuw i8 %9, %7, !opID !132, !opSignedness !6
  %z2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 8, !opID !133, !opSignedness !6
  br label %if.end69.sink.split, !opID !134, !opSignedness !6

if.then14:                                        ; preds = %entry
  %x015 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 0, !opID !135, !opSignedness !6
  %10 = load i8, i8* %x015, align 1, !opID !136, !opSignedness !6
  %x016 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !137, !opSignedness !6
  store i8 %10, i8* %x016, align 1, !opID !138, !opSignedness !6
  %z017 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 2, !opID !139, !opSignedness !6
  %11 = load i8, i8* %z017, align 1, !opID !140, !opSignedness !6
  %y018 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !141, !opSignedness !6
  store i8 %11, i8* %y018, align 1, !opID !142, !opSignedness !6
  %x119 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 3, !opID !143, !opSignedness !6
  %12 = load i8, i8* %x119, align 1, !opID !144, !opSignedness !6
  %x120 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !145, !opSignedness !6
  store i8 %12, i8* %x120, align 1, !opID !146, !opSignedness !6
  %z121 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 5, !opID !147, !opSignedness !6
  %13 = load i8, i8* %z121, align 1, !opID !148, !opSignedness !6
  %y122 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !149, !opSignedness !6
  store i8 %13, i8* %y122, align 1, !opID !150, !opSignedness !6
  %x223 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 6, !opID !151, !opSignedness !6
  %14 = load i8, i8* %x223, align 1, !opID !152, !opSignedness !6
  %x224 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4, !opID !153, !opSignedness !6
  store i8 %14, i8* %x224, align 1, !opID !154, !opSignedness !6
  %z225 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 8, !opID !155, !opSignedness !6
  %15 = load i8, i8* %z225, align 1, !opID !156, !opSignedness !6
  %y226 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5, !opID !157, !opSignedness !6
  store i8 %15, i8* %y226, align 1, !opID !158, !opSignedness !6
  %y027 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 1, !opID !159, !opSignedness !6
  %16 = load i8, i8* %y027, align 1, !opID !160, !opSignedness !6
  %17 = udiv i8 %16, 3, !opID !161, !opSignedness !6
  %y130 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 4, !opID !162, !opSignedness !6
  %18 = load i8, i8* %y130, align 1, !opID !163, !opSignedness !6
  %19 = udiv i8 %18, 3, !opID !164, !opSignedness !6
  %addconv1 = add nuw i8 %19, %17, !opID !165, !opSignedness !6
  %y234 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 7, !opID !166, !opSignedness !6
  br label %if.end69.sink.split, !opID !167, !opSignedness !6

if.then42:                                        ; preds = %entry
  %z043 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 2, !opID !168, !opSignedness !6
  %20 = load i8, i8* %z043, align 1, !opID !169, !opSignedness !6
  %x044 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !170, !opSignedness !6
  store i8 %20, i8* %x044, align 1, !opID !171, !opSignedness !6
  %y045 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 1, !opID !172, !opSignedness !6
  %21 = load i8, i8* %y045, align 1, !opID !173, !opSignedness !6
  %y046 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !174, !opSignedness !6
  store i8 %21, i8* %y046, align 1, !opID !175, !opSignedness !6
  %z147 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 5, !opID !176, !opSignedness !6
  %22 = load i8, i8* %z147, align 1, !opID !177, !opSignedness !6
  %x148 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !178, !opSignedness !6
  store i8 %22, i8* %x148, align 1, !opID !179, !opSignedness !6
  %y149 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 4, !opID !180, !opSignedness !6
  %23 = load i8, i8* %y149, align 1, !opID !181, !opSignedness !6
  %y150 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !182, !opSignedness !6
  store i8 %23, i8* %y150, align 1, !opID !183, !opSignedness !6
  %z251 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 8, !opID !184, !opSignedness !6
  %24 = load i8, i8* %z251, align 1, !opID !185, !opSignedness !6
  %x252 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4, !opID !186, !opSignedness !6
  store i8 %24, i8* %x252, align 1, !opID !187, !opSignedness !6
  %y253 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 7, !opID !188, !opSignedness !6
  %25 = load i8, i8* %y253, align 1, !opID !189, !opSignedness !6
  %y254 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5, !opID !190, !opSignedness !6
  store i8 %25, i8* %y254, align 1, !opID !191, !opSignedness !6
  %x055 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 0, !opID !192, !opSignedness !6
  %26 = load i8, i8* %x055, align 1, !opID !193, !opSignedness !6
  %27 = udiv i8 %26, 3, !opID !194, !opSignedness !6
  %x158 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 3, !opID !195, !opSignedness !6
  %28 = load i8, i8* %x158, align 1, !opID !196, !opSignedness !6
  %29 = udiv i8 %28, 3, !opID !197, !opSignedness !6
  %addconv = add nuw i8 %29, %27, !opID !198, !opSignedness !6
  %x262 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i64 0, i32 6, !opID !199, !opSignedness !6
  br label %if.end69.sink.split, !opID !200, !opSignedness !6

if.end69.sink.split:                              ; preds = %if.then42, %if.then14, %if.then
  %y234.sink = phi i8* [ %y234, %if.then14 ], [ %x262, %if.then42 ], [ %z2, %if.then ], !opID !201, !opSignedness !6
  %addconv1.sink = phi i8 [ %addconv1, %if.then14 ], [ %addconv, %if.then42 ], [ %addconv2, %if.then ], !opID !202, !opSignedness !6
  %30 = load i8, i8* %y234.sink, align 1, !opID !203, !opSignedness !6
  %31 = udiv i8 %30, 3, !opID !204, !opSignedness !6
  %add37 = add i8 %addconv1.sink, %31, !opID !205, !opSignedness !6
  %z39 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 6, !opID !206, !opSignedness !6
  store i8 %add37, i8* %z39, align 1, !opID !207, !opSignedness !6
  br label %if.end69, !opID !208, !opSignedness !6

if.end69:                                         ; preds = %if.end69.sink.split, %entry
  ret void, !opID !209, !opSignedness !6
}

; Function Attrs: argmemonly norecurse nounwind willreturn
define zeroext i1 @_Z14rasterization111Triangle_2DPhPi(%struct.Triangle_2D* byval align 1 %triangle_2d, i8* nocapture %max_min, i32* nocapture %max_index) local_unnamed_addr #6 {
entry:
  %.elt = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !210, !opSignedness !6
  %.unpack = load i8, i8* %.elt, align 1, !opID !211, !opSignedness !6
  %.elt15 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !212, !opSignedness !6
  %.unpack16 = load i8, i8* %.elt15, align 1, !opID !213, !opSignedness !6
  %.elt17 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !214, !opSignedness !6
  %.unpack18 = load i8, i8* %.elt17, align 1, !opID !215, !opSignedness !6
  %.elt19 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !216, !opSignedness !6
  %.unpack20 = load i8, i8* %.elt19, align 1, !opID !217, !opSignedness !6
  %.elt21 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4, !opID !218, !opSignedness !6
  %.unpack22 = load i8, i8* %.elt21, align 1, !opID !219, !opSignedness !6
  %.elt23 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5, !opID !220, !opSignedness !6
  %.unpack24 = load i8, i8* %.elt23, align 1, !opID !221, !opSignedness !6
  %conv.i = zext i8 %.unpack22 to i32, !opID !222, !opSignedness !6
  %conv1.i = zext i8 %.unpack to i32, !opID !223, !opSignedness !6
  %sub.i = sub nsw i32 %conv.i, %conv1.i, !opID !224, !opSignedness !6
  %conv2.i = zext i8 %.unpack20 to i32, !opID !225, !opSignedness !6
  %conv3.i = zext i8 %.unpack16 to i32, !opID !226, !opSignedness !6
  %sub4.i = sub nsw i32 %conv2.i, %conv3.i, !opID !227, !opSignedness !6
  %mul.i = mul nsw i32 %sub.i, %sub4.i, !opID !228, !opSignedness !6
  %conv5.i = zext i8 %.unpack24 to i32, !opID !229, !opSignedness !6
  %sub8.i = sub nsw i32 %conv5.i, %conv3.i, !opID !230, !opSignedness !6
  %conv9.i = zext i8 %.unpack18 to i32, !opID !231, !opSignedness !6
  %sub12.i = sub nsw i32 %conv9.i, %conv1.i, !opID !232, !opSignedness !6
  %mul13.i = mul nsw i32 %sub8.i, %sub12.i, !opID !233, !opSignedness !6
  %sub14.i = sub nsw i32 %mul.i, %mul13.i, !opID !234, !opSignedness !6
  %cmp = icmp eq i32 %sub14.i, 0, !opID !235, !opSignedness !6
  br i1 %cmp, label %return, label %if.end, !opID !236, !opSignedness !6

if.end:                                           ; preds = %entry
  %cmp3 = icmp slt i32 %sub14.i, 0, !opID !237, !opSignedness !6
  br i1 %cmp3, label %if.then4, label %if.end5, !opID !238, !opSignedness !6

if.then4:                                         ; preds = %if.end
  store i8 %.unpack18, i8* %.elt, align 1, !opID !239, !opSignedness !6
  store i8 %.unpack20, i8* %.elt15, align 1, !opID !240, !opSignedness !6
  store i8 %.unpack, i8* %.elt17, align 1, !opID !241, !opSignedness !6
  store i8 %.unpack16, i8* %.elt19, align 1, !opID !242, !opSignedness !6
  br label %if.end5, !opID !243, !opSignedness !6

if.end5:                                          ; preds = %if.then4, %if.end
  %0 = phi i8 [ %.unpack16, %if.then4 ], [ %.unpack20, %if.end ], !opID !244, !opSignedness !6
  %1 = phi i8 [ %.unpack20, %if.then4 ], [ %.unpack16, %if.end ], !opID !245, !opSignedness !6
  %2 = phi i8 [ %.unpack, %if.then4 ], [ %.unpack18, %if.end ], !opID !246, !opSignedness !6
  %3 = phi i8 [ %.unpack18, %if.then4 ], [ %.unpack, %if.end ], !opID !247, !opSignedness !6
  %cmp4.i47 = icmp ult i8 %3, %.unpack22, !opID !248, !opSignedness !6
  %in0.in2.i48 = select i1 %cmp4.i47, i8 %3, i8 %.unpack22, !opID !249, !opSignedness !6
  %4 = icmp ult i8 %in0.in2.i48, %2, !opID !250, !opSignedness !6
  %retval.0.i49 = select i1 %4, i8 %in0.in2.i48, i8 %2, !opID !251, !opSignedness !6
  store i8 %retval.0.i49, i8* %max_min, align 1, !opID !252, !opSignedness !6
  %cmp4.i44 = icmp ugt i8 %3, %.unpack22, !opID !253, !opSignedness !6
  %in0.in2.i45 = select i1 %cmp4.i44, i8 %3, i8 %.unpack22, !opID !254, !opSignedness !6
  %5 = icmp ugt i8 %in0.in2.i45, %2, !opID !255, !opSignedness !6
  %retval.0.i46 = select i1 %5, i8 %in0.in2.i45, i8 %2, !opID !256, !opSignedness !6
  %arrayidx11 = getelementptr inbounds i8, i8* %max_min, i64 1, !opID !257, !opSignedness !6
  store i8 %retval.0.i46, i8* %arrayidx11, align 1, !opID !258, !opSignedness !6
  %cmp4.i41 = icmp ult i8 %1, %.unpack24, !opID !259, !opSignedness !6
  %in0.in2.i42 = select i1 %cmp4.i41, i8 %1, i8 %.unpack24, !opID !260, !opSignedness !6
  %6 = icmp ult i8 %in0.in2.i42, %0, !opID !261, !opSignedness !6
  %retval.0.i43 = select i1 %6, i8 %in0.in2.i42, i8 %0, !opID !262, !opSignedness !6
  %arrayidx13 = getelementptr inbounds i8, i8* %max_min, i64 2, !opID !263, !opSignedness !6
  store i8 %retval.0.i43, i8* %arrayidx13, align 1, !opID !264, !opSignedness !6
  %cmp4.i = icmp ugt i8 %1, %.unpack24, !opID !265, !opSignedness !6
  %in0.in2.i = select i1 %cmp4.i, i8 %1, i8 %.unpack24, !opID !266, !opSignedness !6
  %7 = icmp ugt i8 %in0.in2.i, %0, !opID !267, !opSignedness !6
  %retval.0.i = select i1 %7, i8 %in0.in2.i, i8 %0, !opID !268, !opSignedness !6
  %arrayidx18 = getelementptr inbounds i8, i8* %max_min, i64 3, !opID !269, !opSignedness !6
  store i8 %retval.0.i, i8* %arrayidx18, align 1, !opID !270, !opSignedness !6
  %sub = sub i8 %retval.0.i46, %retval.0.i49, !opID !271, !opSignedness !6
  %arrayidx23 = getelementptr inbounds i8, i8* %max_min, i64 4, !opID !272, !opSignedness !6
  store i8 %sub, i8* %arrayidx23, align 1, !opID !273, !opSignedness !6
  %conv25 = zext i8 %retval.0.i46 to i32, !opID !274, !opSignedness !6
  %conv27 = zext i8 %retval.0.i49 to i32, !opID !275, !opSignedness !6
  %sub28 = sub nsw i32 %conv25, %conv27, !opID !276, !opSignedness !6
  %conv30 = zext i8 %retval.0.i to i32, !opID !277, !opSignedness !6
  %conv32 = zext i8 %retval.0.i43 to i32, !opID !278, !opSignedness !6
  %sub33 = sub nsw i32 %conv30, %conv32, !opID !279, !opSignedness !6
  %mul = mul nsw i32 %sub33, %sub28, !opID !280, !opSignedness !6
  store i32 %mul, i32* %max_index, align 4, !opID !281, !opSignedness !6
  br label %return, !opID !282, !opSignedness !6

return:                                           ; preds = %if.end5, %entry
  %retval.0 = phi i1 [ false, %if.end5 ], [ true, %entry ], !opID !283, !opSignedness !6
  ret i1 %retval.0, !opID !284, !opSignedness !6
}

; Function Attrs: argmemonly norecurse nounwind
define i32 @_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel(i1 zeroext %flag, i8* nocapture readonly %max_min, i32* nocapture readonly %max_index, %struct.Triangle_2D* byval nocapture readonly align 1 %triangle_2d, %struct.CandidatePixel* nocapture %fragment) local_unnamed_addr #7 {
entry:
  br i1 %flag, label %return, label %if.end, !opID !285, !opSignedness !6

if.end:                                           ; preds = %entry
  %0 = load i32, i32* %max_index, align 4, !opID !286, !opSignedness !6
  %cmp13 = icmp sgt i32 %0, 0, !opID !287, !opSignedness !6
  br i1 %cmp13, label %for.body.lr.ph, label %return, !opID !288, !opSignedness !6

for.body.lr.ph:                                   ; preds = %if.end
  %arrayidx2 = getelementptr inbounds i8, i8* %max_min, i64 4, !opID !289, !opSignedness !6
  %arrayidx5 = getelementptr inbounds i8, i8* %max_min, i64 2, !opID !290, !opSignedness !6
  %.elt = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 0, !opID !291, !opSignedness !6
  %.unpack = load i8, i8* %.elt, align 1, !opID !292, !opSignedness !6
  %.elt1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 1, !opID !293, !opSignedness !6
  %.unpack2 = load i8, i8* %.elt1, align 1, !opID !294, !opSignedness !6
  %.elt3 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 2, !opID !295, !opSignedness !6
  %.unpack4 = load i8, i8* %.elt3, align 1, !opID !296, !opSignedness !6
  %.elt5 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 3, !opID !297, !opSignedness !6
  %.unpack6 = load i8, i8* %.elt5, align 1, !opID !298, !opSignedness !6
  %.elt7 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 4, !opID !299, !opSignedness !6
  %.unpack8 = load i8, i8* %.elt7, align 1, !opID !300, !opSignedness !6
  %.elt9 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 5, !opID !301, !opSignedness !6
  %.unpack10 = load i8, i8* %.elt9, align 1, !opID !302, !opSignedness !6
  %.elt11 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i64 0, i32 6, !opID !303, !opSignedness !6
  %conv1.i = zext i8 %.unpack to i32, !opID !304, !opSignedness !6
  %conv2.i = zext i8 %.unpack6 to i32, !opID !305, !opSignedness !6
  %conv3.i = zext i8 %.unpack2 to i32, !opID !306, !opSignedness !6
  %sub4.i = sub nsw i32 %conv2.i, %conv3.i, !opID !307, !opSignedness !6
  %conv9.i = zext i8 %.unpack4 to i32, !opID !308, !opSignedness !6
  %sub12.i = sub nsw i32 %conv9.i, %conv1.i, !opID !309, !opSignedness !6
  %conv19.i = zext i8 %.unpack10 to i32, !opID !310, !opSignedness !6
  %sub22.i = sub nsw i32 %conv19.i, %conv2.i, !opID !311, !opSignedness !6
  %conv28.i = zext i8 %.unpack8 to i32, !opID !312, !opSignedness !6
  %sub31.i = sub nsw i32 %conv28.i, %conv9.i, !opID !313, !opSignedness !6
  %sub42.i = sub nsw i32 %conv3.i, %conv19.i, !opID !314, !opSignedness !6
  %sub52.i = sub nsw i32 %conv1.i, %conv28.i, !opID !315, !opSignedness !6
  %1 = load i8, i8* %.elt11, align 1, !opID !316, !opSignedness !6
  br label %for.body, !opID !317, !opSignedness !6

for.body:                                         ; preds = %if.end23, %for.body.lr.ph
  %k.015 = phi i32 [ 0, %for.body.lr.ph ], [ %inc24, %if.end23 ], !opID !318, !opSignedness !6
  %i.014 = phi i32 [ 0, %for.body.lr.ph ], [ %i.1, %if.end23 ], !opID !319, !opSignedness !6
  %2 = load i8, i8* %max_min, align 1, !opID !320, !opSignedness !6
  %3 = load i8, i8* %arrayidx2, align 1, !opID !321, !opSignedness !6
  %conv3 = zext i8 %3 to i32, !opID !322, !opSignedness !6
  %rem.urem = urem i32 %k.015, %conv3, !opID !323, !opSignedness !6
  %4 = trunc i32 %rem.urem to i8, !opID !324, !opSignedness !6
  %conv4 = add i8 %2, %4, !opID !325, !opSignedness !6
  %5 = load i8, i8* %arrayidx5, align 1, !opID !326, !opSignedness !6
  %div.udiv = udiv i32 %k.015, %conv3, !opID !327, !opSignedness !6
  %6 = trunc i32 %div.udiv to i8, !opID !328, !opSignedness !6
  %conv10 = add i8 %5, %6, !opID !329, !opSignedness !6
  %conv.i = zext i8 %conv4 to i32, !opID !330, !opSignedness !6
  %sub.i = sub nsw i32 %conv.i, %conv1.i, !opID !331, !opSignedness !6
  %mul.i = mul nsw i32 %sub4.i, %sub.i, !opID !332, !opSignedness !6
  %conv5.i = zext i8 %conv10 to i32, !opID !333, !opSignedness !6
  %sub8.i = sub nsw i32 %conv5.i, %conv3.i, !opID !334, !opSignedness !6
  %mul13.i = mul nsw i32 %sub12.i, %sub8.i, !opID !335, !opSignedness !6
  %sub18.i = sub nsw i32 %conv.i, %conv9.i, !opID !336, !opSignedness !6
  %mul23.i = mul nsw i32 %sub22.i, %sub18.i, !opID !337, !opSignedness !6
  %sub27.i = sub nsw i32 %conv5.i, %conv2.i, !opID !338, !opSignedness !6
  %mul32.i = mul nsw i32 %sub31.i, %sub27.i, !opID !339, !opSignedness !6
  %sub37.i = sub nsw i32 %conv.i, %conv28.i, !opID !340, !opSignedness !6
  %mul43.i = mul nsw i32 %sub42.i, %sub37.i, !opID !341, !opSignedness !6
  %sub47.i = sub nsw i32 %conv5.i, %conv19.i, !opID !342, !opSignedness !6
  %mul53.i = mul nsw i32 %sub47.i, %sub52.i, !opID !343, !opSignedness !6
  %cmp.i = icmp sge i32 %mul.i, %mul13.i, !opID !344, !opSignedness !6
  %cmp55.i = icmp sge i32 %mul23.i, %mul32.i, !opID !345, !opSignedness !6
  %or.cond.i = and i1 %cmp.i, %cmp55.i, !opID !346, !opSignedness !6
  %cmp56.i = icmp sge i32 %mul43.i, %mul53.i, !opID !347, !opSignedness !6
  %or.cond = and i1 %cmp56.i, %or.cond.i, !opID !348, !opSignedness !6
  br i1 %or.cond, label %if.then11, label %if.end23, !opID !349, !opSignedness !6

if.then11:                                        ; preds = %for.body
  %idxprom = sext i32 %i.014 to i64, !opID !350, !opSignedness !6
  %x13 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragment, i64 %idxprom, i32 0, !opID !351, !opSignedness !6
  store i8 %conv4, i8* %x13, align 1, !opID !352, !opSignedness !6
  %y16 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragment, i64 %idxprom, i32 1, !opID !353, !opSignedness !6
  store i8 %conv10, i8* %y16, align 1, !opID !354, !opSignedness !6
  %z19 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragment, i64 %idxprom, i32 2, !opID !355, !opSignedness !6
  store i8 %1, i8* %z19, align 1, !opID !356, !opSignedness !6
  %color22 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragment, i64 %idxprom, i32 3, !opID !357, !opSignedness !6
  store i8 100, i8* %color22, align 1, !opID !358, !opSignedness !6
  %inc = add i32 %i.014, 1, !opID !359, !opSignedness !6
  br label %if.end23, !opID !360, !opSignedness !6

if.end23:                                         ; preds = %if.then11, %for.body
  %i.1 = phi i32 [ %inc, %if.then11 ], [ %i.014, %for.body ], !opID !361, !opSignedness !6
  %inc24 = add nuw nsw i32 %k.015, 1, !opID !362, !opSignedness !6
  %7 = load i32, i32* %max_index, align 4, !opID !363, !opSignedness !6
  %cmp = icmp slt i32 %inc24, %7, !opID !364, !opSignedness !6
  br i1 %cmp, label %for.body, label %return, !llvm.loop !365, !opID !367, !opSignedness !6

return:                                           ; preds = %if.end23, %if.end, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ 0, %if.end ], [ %i.1, %if.end23 ], !opID !368, !opSignedness !6
  ret i32 %retval.0, !opID !369, !opSignedness !6
}

; Function Attrs: norecurse nounwind
define i32 @_Z8zcullingiP14CandidatePixeliP5Pixel(i32 %counter, %struct.CandidatePixel* nocapture readonly %fragments, i32 %size, %struct.Pixel* nocapture %pixels) local_unnamed_addr #8 {
entry:
  %cmp = icmp eq i32 %counter, 0, !opID !370, !opSignedness !6
  br i1 %cmp, label %ZCULLING_INIT_ROW, label %if.end, !opID !371, !opSignedness !6

ZCULLING_INIT_ROW:                                ; preds = %entry
  call void @llvm.memset.p0i8.i64(i8* align 1 getelementptr inbounds ([256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 0, i64 0), i8 -1, i64 65536, i1 false), !opID !372, !opSignedness !6
  br label %if.end, !opID !373, !opSignedness !6

if.end:                                           ; preds = %ZCULLING_INIT_ROW, %entry
  %cmp121 = icmp sgt i32 %size, 0, !opID !374, !opSignedness !6
  br i1 %cmp121, label %for.body14.lr.ph, label %for.cond.cleanup13, !opID !375, !opSignedness !6

for.body14.lr.ph:                                 ; preds = %if.end
  %wide.trip.count = zext i32 %size to i64, !opID !376, !opSignedness !6
  br label %for.body14, !opID !377, !opSignedness !6

for.cond.cleanup13:                               ; preds = %for.inc60, %if.end
  %pixel_cntr.0.lcssa = phi i32 [ 0, %if.end ], [ %pixel_cntr.1, %for.inc60 ], !opID !378, !opSignedness !6
  ret i32 %pixel_cntr.0.lcssa, !opID !379, !opSignedness !6

for.body14:                                       ; preds = %for.inc60, %for.body14.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body14.lr.ph ], [ %indvars.iv.next, %for.inc60 ], !opID !380, !opSignedness !6
  %pixel_cntr.02 = phi i32 [ 0, %for.body14.lr.ph ], [ %pixel_cntr.1, %for.inc60 ], !opID !381, !opSignedness !6
  %z = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragments, i64 %indvars.iv, i32 2, !opID !382, !opSignedness !6
  %0 = load i8, i8* %z, align 1, !opID !383, !opSignedness !6
  %y = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragments, i64 %indvars.iv, i32 1, !opID !384, !opSignedness !6
  %1 = load i8, i8* %y, align 1, !opID !385, !opSignedness !6
  %idxprom19 = zext i8 %1 to i64, !opID !386, !opSignedness !6
  %x = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragments, i64 %indvars.iv, i32 0, !opID !387, !opSignedness !6
  %2 = load i8, i8* %x, align 1, !opID !388, !opSignedness !6
  %idxprom23 = zext i8 %2 to i64, !opID !389, !opSignedness !6
  %arrayidx24 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom19, i64 %idxprom23, !opID !390, !opSignedness !6
  %3 = load i8, i8* %arrayidx24, align 1, !opID !391, !opSignedness !6
  %cmp26 = icmp ult i8 %0, %3, !opID !392, !opSignedness !6
  br i1 %cmp26, label %if.then27, label %for.inc60, !opID !393, !opSignedness !6

if.then27:                                        ; preds = %for.body14
  %idxprom31 = sext i32 %pixel_cntr.02 to i64, !opID !394, !opSignedness !6
  %x33 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %idxprom31, i32 0, !opID !395, !opSignedness !6
  store i8 %2, i8* %x33, align 1, !opID !396, !opSignedness !6
  %4 = load i8, i8* %y, align 1, !opID !397, !opSignedness !6
  %y39 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %idxprom31, i32 1, !opID !398, !opSignedness !6
  store i8 %4, i8* %y39, align 1, !opID !399, !opSignedness !6
  %color = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %fragments, i64 %indvars.iv, i32 3, !opID !400, !opSignedness !6
  %5 = load i8, i8* %color, align 1, !opID !401, !opSignedness !6
  %color44 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %idxprom31, i32 2, !opID !402, !opSignedness !6
  store i8 %5, i8* %color44, align 1, !opID !403, !opSignedness !6
  %inc45 = add i32 %pixel_cntr.02, 1, !opID !404, !opSignedness !6
  %6 = load i8, i8* %z, align 1, !opID !405, !opSignedness !6
  %7 = load i8, i8* %y, align 1, !opID !406, !opSignedness !6
  %idxprom52 = zext i8 %7 to i64, !opID !407, !opSignedness !6
  %8 = load i8, i8* %x, align 1, !opID !408, !opSignedness !6
  %idxprom57 = zext i8 %8 to i64, !opID !409, !opSignedness !6
  %arrayidx58 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom52, i64 %idxprom57, !opID !410, !opSignedness !6
  store i8 %6, i8* %arrayidx58, align 1, !opID !411, !opSignedness !6
  br label %for.inc60, !opID !412, !opSignedness !6

for.inc60:                                        ; preds = %if.then27, %for.body14
  %pixel_cntr.1 = phi i32 [ %inc45, %if.then27 ], [ %pixel_cntr.02, %for.body14 ], !opID !413, !opSignedness !6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !opID !414, !opSignedness !6
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count, !opID !415, !opSignedness !6
  br i1 %exitcond, label %for.cond.cleanup13, label %for.body14, !llvm.loop !416, !opID !418, !opSignedness !6
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #9

; Function Attrs: argmemonly norecurse nounwind
define void @_Z10coloringFBiiP5PixelPA256_h(i32 %counter, i32 %size_pixels, %struct.Pixel* nocapture readonly %pixels, [256 x i8]* nocapture "fpga.decayed.dim.hint"="256" %frame_buffer) local_unnamed_addr #10 {
entry:
  %frame_buffer9 = getelementptr inbounds [256 x i8], [256 x i8]* %frame_buffer, i64 0, i64 0, !opID !419, !opSignedness !6
  %cmp = icmp eq i32 %counter, 0, !opID !420, !opSignedness !6
  br i1 %cmp, label %COLORING_FB_INIT_ROW, label %COLORING_FB, !opID !421, !opSignedness !6

COLORING_FB_INIT_ROW:                             ; preds = %entry
  call void @llvm.memset.p0i8.i64(i8* align 1 %frame_buffer9, i8 0, i64 65536, i1 false), !opID !422, !opSignedness !6
  br label %COLORING_FB, !opID !423, !opSignedness !6

COLORING_FB:                                      ; preds = %COLORING_FB_INIT_ROW, %entry
  %cmp131 = icmp sgt i32 %size_pixels, 0, !opID !424, !opSignedness !6
  br i1 %cmp131, label %for.body15.lr.ph, label %for.cond.cleanup14, !opID !425, !opSignedness !6

for.body15.lr.ph:                                 ; preds = %COLORING_FB
  %wide.trip.count = zext i32 %size_pixels to i64, !opID !426, !opSignedness !6
  br label %for.body15, !opID !427, !opSignedness !6

for.cond.cleanup14:                               ; preds = %for.body15, %COLORING_FB
  ret void, !opID !428, !opSignedness !6

for.body15:                                       ; preds = %for.body15, %for.body15.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body15.lr.ph ], [ %indvars.iv.next, %for.body15 ], !opID !429, !opSignedness !6
  %color = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %indvars.iv, i32 2, !opID !430, !opSignedness !6
  %0 = load i8, i8* %color, align 1, !opID !431, !opSignedness !6
  %x = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %indvars.iv, i32 0, !opID !432, !opSignedness !6
  %1 = load i8, i8* %x, align 1, !opID !433, !opSignedness !6
  %idxprom20 = zext i8 %1 to i64, !opID !434, !opSignedness !6
  %y = getelementptr inbounds %struct.Pixel, %struct.Pixel* %pixels, i64 %indvars.iv, i32 1, !opID !435, !opSignedness !6
  %2 = load i8, i8* %y, align 1, !opID !436, !opSignedness !6
  %idxprom24 = zext i8 %2 to i64, !opID !437, !opSignedness !6
  %arrayidx25 = getelementptr inbounds [256 x i8], [256 x i8]* %frame_buffer, i64 %idxprom20, i64 %idxprom24, !opID !438, !opSignedness !6
  store i8 %0, i8* %arrayidx25, align 1, !opID !439, !opSignedness !6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !opID !440, !opSignedness !6
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count, !opID !441, !opSignedness !6
  br i1 %exitcond, label %for.cond.cleanup14, label %for.body15, !llvm.loop !442, !opID !444, !opSignedness !6
}

; Function Attrs: nounwind
define void @_Z9renderingP11Triangle_3DPA256_h(%struct.Triangle_3D* nocapture readonly "fpga.decayed.dim.hint"="3192" %triangle_3ds, [256 x i8]* nocapture "fpga.decayed.dim.hint"="256" %output) #11 !fpga.function.pragma !445 {
entry:
  %fragment = alloca [500 x %struct.CandidatePixel], align 1, !opID !447, !opSignedness !6
  %pixels = alloca [500 x %struct.Pixel], align 1, !opID !448, !opSignedness !6
  %0 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 0, i32 0, !opID !449, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 2000, i8* nonnull %0) #14, !opID !450, !opSignedness !6
  %1 = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 0, i32 0, !opID !451, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 1500, i8* nonnull %1) #14, !opID !452, !opSignedness !6
  %frame_buffer9.i = getelementptr inbounds [256 x i8], [256 x i8]* %output, i64 0, i64 0, !opID !453, !opSignedness !6
  br label %for.body, !opID !454, !opSignedness !6

for.cond.cleanup:                                 ; preds = %_Z10coloringFBiiP5PixelPA256_h.exit
  call void @llvm.lifetime.end.p0i8(i64 1500, i8* nonnull %1) #14, !opID !455, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 2000, i8* nonnull %0) #14, !opID !456, !opSignedness !6
  ret void, !opID !457, !opSignedness !6

for.body:                                         ; preds = %_Z10coloringFBiiP5PixelPA256_h.exit, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %_Z10coloringFBiiP5PixelPA256_h.exit ], !opID !458, !opSignedness !6
  %.elt = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 0, !opID !459, !opSignedness !6
  %.unpack = load i8, i8* %.elt, align 1, !opID !460, !opSignedness !6
  %.elt57 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 1, !opID !461, !opSignedness !6
  %.unpack58 = load i8, i8* %.elt57, align 1, !opID !462, !opSignedness !6
  %.elt59 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 2, !opID !463, !opSignedness !6
  %.unpack60 = load i8, i8* %.elt59, align 1, !opID !464, !opSignedness !6
  %.elt61 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 3, !opID !465, !opSignedness !6
  %.unpack62 = load i8, i8* %.elt61, align 1, !opID !466, !opSignedness !6
  %.elt63 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 4, !opID !467, !opSignedness !6
  %.unpack64 = load i8, i8* %.elt63, align 1, !opID !468, !opSignedness !6
  %.elt65 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 5, !opID !469, !opSignedness !6
  %.unpack66 = load i8, i8* %.elt65, align 1, !opID !470, !opSignedness !6
  %.elt67 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 6, !opID !471, !opSignedness !6
  %.unpack68 = load i8, i8* %.elt67, align 1, !opID !472, !opSignedness !6
  %.elt69 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 7, !opID !473, !opSignedness !6
  %.unpack70 = load i8, i8* %.elt69, align 1, !opID !474, !opSignedness !6
  %.elt71 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3ds, i64 %indvars.iv, i32 8, !opID !475, !opSignedness !6
  %.unpack72 = load i8, i8* %.elt71, align 1, !opID !476, !opSignedness !6
  %2 = udiv i8 %.unpack60, 3, !opID !477, !opSignedness !6
  %3 = udiv i8 %.unpack66, 3, !opID !478, !opSignedness !6
  %addconv2.i = add nuw i8 %3, %2, !opID !479, !opSignedness !6
  %4 = udiv i8 %.unpack72, 3, !opID !480, !opSignedness !6
  %add11.i = add i8 %addconv2.i, %4, !opID !481, !opSignedness !6
  %conv.i.i90 = zext i8 %.unpack68 to i32, !opID !482, !opSignedness !6
  %conv1.i.i91 = zext i8 %.unpack to i32, !opID !483, !opSignedness !6
  %sub.i.i92 = sub nsw i32 %conv.i.i90, %conv1.i.i91, !opID !484, !opSignedness !6
  %conv2.i.i93 = zext i8 %.unpack64 to i32, !opID !485, !opSignedness !6
  %conv3.i.i94 = zext i8 %.unpack58 to i32, !opID !486, !opSignedness !6
  %sub4.i.i95 = sub nsw i32 %conv2.i.i93, %conv3.i.i94, !opID !487, !opSignedness !6
  %mul.i.i96 = mul nsw i32 %sub.i.i92, %sub4.i.i95, !opID !488, !opSignedness !6
  %conv5.i.i97 = zext i8 %.unpack70 to i32, !opID !489, !opSignedness !6
  %sub8.i.i98 = sub nsw i32 %conv5.i.i97, %conv3.i.i94, !opID !490, !opSignedness !6
  %conv9.i.i99 = zext i8 %.unpack62 to i32, !opID !491, !opSignedness !6
  %sub12.i.i100 = sub nsw i32 %conv9.i.i99, %conv1.i.i91, !opID !492, !opSignedness !6
  %mul13.i.i101 = mul nsw i32 %sub8.i.i98, %sub12.i.i100, !opID !493, !opSignedness !6
  %sub14.i.i = sub nsw i32 %mul.i.i96, %mul13.i.i101, !opID !494, !opSignedness !6
  %cmp.i102 = icmp eq i32 %sub14.i.i, 0, !opID !495, !opSignedness !6
  br i1 %cmp.i102, label %_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit, label %if.end.i103, !opID !496, !opSignedness !6

if.end.i103:                                      ; preds = %for.body
  %cmp3.i = icmp slt i32 %sub14.i.i, 0, !opID !497, !opSignedness !6
  %spec.select = select i1 %cmp3.i, i8 %.unpack58, i8 %.unpack64, !opID !498, !opSignedness !6
  %spec.select158 = select i1 %cmp3.i, i8 %.unpack64, i8 %.unpack58, !opID !499, !opSignedness !6
  %spec.select159 = select i1 %cmp3.i, i8 %.unpack, i8 %.unpack62, !opID !500, !opSignedness !6
  %spec.select160 = select i1 %cmp3.i, i8 %.unpack62, i8 %.unpack, !opID !501, !opSignedness !6
  %cmp4.i47.i = icmp ult i8 %spec.select160, %.unpack68, !opID !502, !opSignedness !6
  %in0.in2.i48.i = select i1 %cmp4.i47.i, i8 %spec.select160, i8 %.unpack68, !opID !503, !opSignedness !6
  %5 = icmp ult i8 %in0.in2.i48.i, %spec.select159, !opID !504, !opSignedness !6
  %retval.0.i49.i = select i1 %5, i8 %in0.in2.i48.i, i8 %spec.select159, !opID !505, !opSignedness !6
  %cmp4.i44.i = icmp ugt i8 %spec.select160, %.unpack68, !opID !506, !opSignedness !6
  %in0.in2.i45.i = select i1 %cmp4.i44.i, i8 %spec.select160, i8 %.unpack68, !opID !507, !opSignedness !6
  %6 = icmp ugt i8 %in0.in2.i45.i, %spec.select159, !opID !508, !opSignedness !6
  %retval.0.i46.i = select i1 %6, i8 %in0.in2.i45.i, i8 %spec.select159, !opID !509, !opSignedness !6
  %cmp4.i41.i = icmp ult i8 %spec.select158, %.unpack70, !opID !510, !opSignedness !6
  %in0.in2.i42.i = select i1 %cmp4.i41.i, i8 %spec.select158, i8 %.unpack70, !opID !511, !opSignedness !6
  %7 = icmp ult i8 %in0.in2.i42.i, %spec.select, !opID !512, !opSignedness !6
  %retval.0.i43.i = select i1 %7, i8 %in0.in2.i42.i, i8 %spec.select, !opID !513, !opSignedness !6
  %cmp4.i.i = icmp ugt i8 %spec.select158, %.unpack70, !opID !514, !opSignedness !6
  %in0.in2.i.i = select i1 %cmp4.i.i, i8 %spec.select158, i8 %.unpack70, !opID !515, !opSignedness !6
  %8 = icmp ugt i8 %in0.in2.i.i, %spec.select, !opID !516, !opSignedness !6
  %retval.0.i.i = select i1 %8, i8 %in0.in2.i.i, i8 %spec.select, !opID !517, !opSignedness !6
  %sub.i = sub i8 %retval.0.i46.i, %retval.0.i49.i, !opID !518, !opSignedness !6
  %conv25.i = zext i8 %retval.0.i46.i to i32, !opID !519, !opSignedness !6
  %conv27.i = zext i8 %retval.0.i49.i to i32, !opID !520, !opSignedness !6
  %sub28.i = sub nsw i32 %conv25.i, %conv27.i, !opID !521, !opSignedness !6
  %conv30.i = zext i8 %retval.0.i.i to i32, !opID !522, !opSignedness !6
  %conv32.i = zext i8 %retval.0.i43.i to i32, !opID !523, !opSignedness !6
  %sub33.i = sub nsw i32 %conv30.i, %conv32.i, !opID !524, !opSignedness !6
  %mul.i = mul nsw i32 %sub33.i, %sub28.i, !opID !525, !opSignedness !6
  %cmp13.i = icmp sgt i32 %mul.i, 0, !opID !526, !opSignedness !6
  br i1 %cmp13.i, label %for.body.lr.ph.i, label %_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit, !opID !527, !opSignedness !6

for.body.lr.ph.i:                                 ; preds = %if.end.i103
  %sub22.i.i = sub nsw i32 %conv5.i.i97, %conv2.i.i93, !opID !528, !opSignedness !6
  %sub31.i.i = sub nsw i32 %conv.i.i90, %conv9.i.i99, !opID !529, !opSignedness !6
  %sub42.i.i = sub nsw i32 %conv3.i.i94, %conv5.i.i97, !opID !530, !opSignedness !6
  %sub52.i.i = sub nsw i32 %conv1.i.i91, %conv.i.i90, !opID !531, !opSignedness !6
  %conv3.i = zext i8 %sub.i to i32, !opID !532, !opSignedness !6
  br label %for.body.i, !opID !533, !opSignedness !6

for.body.i:                                       ; preds = %if.end23.i, %for.body.lr.ph.i
  %k.015.i = phi i32 [ 0, %for.body.lr.ph.i ], [ %inc24.i, %if.end23.i ], !opID !534, !opSignedness !6
  %i.014.i = phi i32 [ 0, %for.body.lr.ph.i ], [ %i.1.i, %if.end23.i ], !opID !535, !opSignedness !6
  %rem.urem.i = urem i32 %k.015.i, %conv3.i, !opID !536, !opSignedness !6
  %9 = trunc i32 %rem.urem.i to i8, !opID !537, !opSignedness !6
  %conv4.i = add i8 %retval.0.i49.i, %9, !opID !538, !opSignedness !6
  %div.udiv.i = udiv i32 %k.015.i, %conv3.i, !opID !539, !opSignedness !6
  %10 = trunc i32 %div.udiv.i to i8, !opID !540, !opSignedness !6
  %conv10.i = add i8 %retval.0.i43.i, %10, !opID !541, !opSignedness !6
  %conv.i.i = zext i8 %conv4.i to i32, !opID !542, !opSignedness !6
  %sub.i.i = sub nsw i32 %conv.i.i, %conv1.i.i91, !opID !543, !opSignedness !6
  %mul.i.i = mul nsw i32 %sub.i.i, %sub4.i.i95, !opID !544, !opSignedness !6
  %conv5.i.i = zext i8 %conv10.i to i32, !opID !545, !opSignedness !6
  %sub8.i.i = sub nsw i32 %conv5.i.i, %conv3.i.i94, !opID !546, !opSignedness !6
  %mul13.i.i = mul nsw i32 %sub8.i.i, %sub12.i.i100, !opID !547, !opSignedness !6
  %sub18.i.i = sub nsw i32 %conv.i.i, %conv9.i.i99, !opID !548, !opSignedness !6
  %mul23.i.i = mul nsw i32 %sub18.i.i, %sub22.i.i, !opID !549, !opSignedness !6
  %sub27.i.i = sub nsw i32 %conv5.i.i, %conv2.i.i93, !opID !550, !opSignedness !6
  %mul32.i.i = mul nsw i32 %sub27.i.i, %sub31.i.i, !opID !551, !opSignedness !6
  %sub37.i.i = sub nsw i32 %conv.i.i, %conv.i.i90, !opID !552, !opSignedness !6
  %mul43.i.i = mul nsw i32 %sub37.i.i, %sub42.i.i, !opID !553, !opSignedness !6
  %sub47.i.i = sub nsw i32 %conv5.i.i, %conv5.i.i97, !opID !554, !opSignedness !6
  %mul53.i.i = mul nsw i32 %sub47.i.i, %sub52.i.i, !opID !555, !opSignedness !6
  %cmp.i.i = icmp sge i32 %mul.i.i, %mul13.i.i, !opID !556, !opSignedness !6
  %cmp55.i.i = icmp sge i32 %mul23.i.i, %mul32.i.i, !opID !557, !opSignedness !6
  %or.cond.i.i = and i1 %cmp.i.i, %cmp55.i.i, !opID !558, !opSignedness !6
  %cmp56.i.i = icmp sge i32 %mul43.i.i, %mul53.i.i, !opID !559, !opSignedness !6
  %or.cond.i = and i1 %cmp56.i.i, %or.cond.i.i, !opID !560, !opSignedness !6
  br i1 %or.cond.i, label %if.then11.i, label %if.end23.i, !opID !561, !opSignedness !6

if.then11.i:                                      ; preds = %for.body.i
  %idxprom.i = sext i32 %i.014.i to i64, !opID !562, !opSignedness !6
  %x13.i85 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %idxprom.i, i32 0, !opID !563, !opSignedness !6
  store i8 %conv4.i, i8* %x13.i85, align 1, !opID !564, !opSignedness !6
  %y16.i = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %idxprom.i, i32 1, !opID !565, !opSignedness !6
  store i8 %conv10.i, i8* %y16.i, align 1, !opID !566, !opSignedness !6
  %z19.i = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %idxprom.i, i32 2, !opID !567, !opSignedness !6
  store i8 %add11.i, i8* %z19.i, align 1, !opID !568, !opSignedness !6
  %color22.i = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %idxprom.i, i32 3, !opID !569, !opSignedness !6
  store i8 100, i8* %color22.i, align 1, !opID !570, !opSignedness !6
  %inc.i = add i32 %i.014.i, 1, !opID !571, !opSignedness !6
  br label %if.end23.i, !opID !572, !opSignedness !6

if.end23.i:                                       ; preds = %if.then11.i, %for.body.i
  %i.1.i = phi i32 [ %inc.i, %if.then11.i ], [ %i.014.i, %for.body.i ], !opID !573, !opSignedness !6
  %inc24.i = add nuw nsw i32 %k.015.i, 1, !opID !574, !opSignedness !6
  %cmp.i86 = icmp slt i32 %inc24.i, %mul.i, !opID !575, !opSignedness !6
  br i1 %cmp.i86, label %for.body.i, label %_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit, !llvm.loop !365, !opID !576, !opSignedness !6

_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit: ; preds = %if.end23.i, %if.end.i103, %for.body
  %retval.0.i = phi i32 [ 0, %if.end.i103 ], [ 0, %for.body ], [ %i.1.i, %if.end23.i ], !opID !577, !opSignedness !6
  %cmp.i74 = icmp eq i64 %indvars.iv, 0, !opID !578, !opSignedness !6
  br i1 %cmp.i74, label %ZCULLING_INIT_ROW.i, label %if.end.i, !opID !579, !opSignedness !6

ZCULLING_INIT_ROW.i:                              ; preds = %_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit
  tail call void @llvm.memset.p0i8.i64(i8* align 1 getelementptr inbounds ([256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 0, i64 0), i8 -1, i64 65536, i1 false) #14, !opID !580, !opSignedness !6
  br label %if.end.i, !opID !581, !opSignedness !6

if.end.i:                                         ; preds = %ZCULLING_INIT_ROW.i, %_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel.exit
  %cmp121.i = icmp sgt i32 %retval.0.i, 0, !opID !582, !opSignedness !6
  br i1 %cmp121.i, label %for.body14.lr.ph.i, label %_Z8zcullingiP14CandidatePixeliP5Pixel.exit, !opID !583, !opSignedness !6

for.body14.lr.ph.i:                               ; preds = %if.end.i
  %wide.trip.count.i75 = zext i32 %retval.0.i to i64, !opID !584, !opSignedness !6
  br label %for.body14.i, !opID !585, !opSignedness !6

for.body14.i:                                     ; preds = %for.inc60.i, %for.body14.lr.ph.i
  %indvars.iv.i76 = phi i64 [ 0, %for.body14.lr.ph.i ], [ %indvars.iv.next.i81, %for.inc60.i ], !opID !586, !opSignedness !6
  %pixel_cntr.02.i = phi i32 [ 0, %for.body14.lr.ph.i ], [ %pixel_cntr.1.i, %for.inc60.i ], !opID !587, !opSignedness !6
  %z.i77 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %indvars.iv.i76, i32 2, !opID !588, !opSignedness !6
  %11 = load i8, i8* %z.i77, align 1, !opID !589, !opSignedness !6
  %y.i78 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %indvars.iv.i76, i32 1, !opID !590, !opSignedness !6
  %12 = load i8, i8* %y.i78, align 1, !opID !591, !opSignedness !6
  %idxprom19.i = zext i8 %12 to i64, !opID !592, !opSignedness !6
  %x.i79 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %indvars.iv.i76, i32 0, !opID !593, !opSignedness !6
  %13 = load i8, i8* %x.i79, align 1, !opID !594, !opSignedness !6
  %idxprom23.i = zext i8 %13 to i64, !opID !595, !opSignedness !6
  %arrayidx24.i = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom19.i, i64 %idxprom23.i, !opID !596, !opSignedness !6
  %14 = load i8, i8* %arrayidx24.i, align 1, !opID !597, !opSignedness !6
  %cmp26.i = icmp ult i8 %11, %14, !opID !598, !opSignedness !6
  br i1 %cmp26.i, label %if.then27.i, label %for.inc60.i, !opID !599, !opSignedness !6

if.then27.i:                                      ; preds = %for.body14.i
  %idxprom31.i = sext i32 %pixel_cntr.02.i to i64, !opID !600, !opSignedness !6
  %x33.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %idxprom31.i, i32 0, !opID !601, !opSignedness !6
  store i8 %13, i8* %x33.i, align 1, !opID !602, !opSignedness !6
  %y39.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %idxprom31.i, i32 1, !opID !603, !opSignedness !6
  store i8 %12, i8* %y39.i, align 1, !opID !604, !opSignedness !6
  %color.i80 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i64 0, i64 %indvars.iv.i76, i32 3, !opID !605, !opSignedness !6
  %15 = load i8, i8* %color.i80, align 1, !opID !606, !opSignedness !6
  %color44.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %idxprom31.i, i32 2, !opID !607, !opSignedness !6
  store i8 %15, i8* %color44.i, align 1, !opID !608, !opSignedness !6
  %inc45.i = add i32 %pixel_cntr.02.i, 1, !opID !609, !opSignedness !6
  store i8 %11, i8* %arrayidx24.i, align 1, !opID !610, !opSignedness !6
  br label %for.inc60.i, !opID !611, !opSignedness !6

for.inc60.i:                                      ; preds = %if.then27.i, %for.body14.i
  %pixel_cntr.1.i = phi i32 [ %inc45.i, %if.then27.i ], [ %pixel_cntr.02.i, %for.body14.i ], !opID !612, !opSignedness !6
  %indvars.iv.next.i81 = add nuw nsw i64 %indvars.iv.i76, 1, !opID !613, !opSignedness !6
  %exitcond.i82 = icmp eq i64 %indvars.iv.next.i81, %wide.trip.count.i75, !opID !614, !opSignedness !6
  br i1 %exitcond.i82, label %_Z8zcullingiP14CandidatePixeliP5Pixel.exit, label %for.body14.i, !llvm.loop !416, !opID !615, !opSignedness !6

_Z8zcullingiP14CandidatePixeliP5Pixel.exit:       ; preds = %for.inc60.i, %if.end.i
  %pixel_cntr.0.lcssa.i = phi i32 [ 0, %if.end.i ], [ %pixel_cntr.1.i, %for.inc60.i ], !opID !616, !opSignedness !6
  br i1 %cmp.i74, label %COLORING_FB_INIT_ROW.i, label %COLORING_FB.i, !opID !617, !opSignedness !6

COLORING_FB_INIT_ROW.i:                           ; preds = %_Z8zcullingiP14CandidatePixeliP5Pixel.exit
  tail call void @llvm.memset.p0i8.i64(i8* align 1 %frame_buffer9.i, i8 0, i64 65536, i1 false) #14, !opID !618, !opSignedness !6
  br label %COLORING_FB.i, !opID !619, !opSignedness !6

COLORING_FB.i:                                    ; preds = %COLORING_FB_INIT_ROW.i, %_Z8zcullingiP14CandidatePixeliP5Pixel.exit
  %cmp131.i = icmp sgt i32 %pixel_cntr.0.lcssa.i, 0, !opID !620, !opSignedness !6
  br i1 %cmp131.i, label %for.body15.lr.ph.i, label %_Z10coloringFBiiP5PixelPA256_h.exit, !opID !621, !opSignedness !6

for.body15.lr.ph.i:                               ; preds = %COLORING_FB.i
  %wide.trip.count.i = zext i32 %pixel_cntr.0.lcssa.i to i64, !opID !622, !opSignedness !6
  br label %for.body15.i, !opID !623, !opSignedness !6

for.body15.i:                                     ; preds = %for.body15.i, %for.body15.lr.ph.i
  %indvars.iv.i = phi i64 [ 0, %for.body15.lr.ph.i ], [ %indvars.iv.next.i, %for.body15.i ], !opID !624, !opSignedness !6
  %color.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %indvars.iv.i, i32 2, !opID !625, !opSignedness !6
  %16 = load i8, i8* %color.i, align 1, !opID !626, !opSignedness !6
  %x.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %indvars.iv.i, i32 0, !opID !627, !opSignedness !6
  %17 = load i8, i8* %x.i, align 1, !opID !628, !opSignedness !6
  %idxprom20.i = zext i8 %17 to i64, !opID !629, !opSignedness !6
  %y.i = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i64 0, i64 %indvars.iv.i, i32 1, !opID !630, !opSignedness !6
  %18 = load i8, i8* %y.i, align 1, !opID !631, !opSignedness !6
  %idxprom24.i = zext i8 %18 to i64, !opID !632, !opSignedness !6
  %arrayidx25.i = getelementptr inbounds [256 x i8], [256 x i8]* %output, i64 %idxprom20.i, i64 %idxprom24.i, !opID !633, !opSignedness !6
  store i8 %16, i8* %arrayidx25.i, align 1, !opID !634, !opSignedness !6
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !opID !635, !opSignedness !6
  %exitcond.i = icmp eq i64 %indvars.iv.next.i, %wide.trip.count.i, !opID !636, !opSignedness !6
  br i1 %exitcond.i, label %_Z10coloringFBiiP5PixelPA256_h.exit, label %for.body15.i, !llvm.loop !442, !opID !637, !opSignedness !6

_Z10coloringFBiiP5PixelPA256_h.exit:              ; preds = %for.body15.i, %COLORING_FB.i
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !opID !638, !opSignedness !6
  %exitcond = icmp eq i64 %indvars.iv.next, 3192, !opID !639, !opSignedness !6
  br i1 %exitcond, label %for.cond.cleanup, label %for.body, !llvm.loop !640, !opID !642, !opSignedness !6
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #9

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #9

; Function Attrs: noinline norecurse optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #12 {
entry:
  %retval = alloca i32, align 4, !opID !643, !opSignedness !6
  %argc.addr = alloca i32, align 4, !opID !644, !opSignedness !6
  %argv.addr = alloca i8**, align 8, !opID !645, !opSignedness !6
  %triangle_3ds = alloca [3192 x %struct.Triangle_3D], align 16, !opID !646, !opSignedness !6
  %output = alloca [256 x [256 x i8]], align 16, !opID !647, !opSignedness !6
  store i32 0, i32* %retval, align 4, !opID !648, !opSignedness !6
  store i32 %argc, i32* %argc.addr, align 4, !opID !649, !opSignedness !6
  store i8** %argv, i8*** %argv.addr, align 8, !opID !650, !opSignedness !6
  %0 = load i8**, i8*** %argv.addr, align 8, !opID !651, !opSignedness !6
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !opID !652, !opSignedness !6
  %1 = load i8*, i8** %arrayidx, align 8, !opID !653, !opSignedness !6
  %arraydecay = getelementptr inbounds [3192 x %struct.Triangle_3D], [3192 x %struct.Triangle_3D]* %triangle_3ds, i32 0, i32 0, !opID !654, !opSignedness !6
  call void @populateInput(i8* %1, %struct.Triangle_3D* %arraydecay), !opID !655, !opSignedness !6
  %arraydecay1 = getelementptr inbounds [3192 x %struct.Triangle_3D], [3192 x %struct.Triangle_3D]* %triangle_3ds, i32 0, i32 0, !opID !656, !opSignedness !6
  %arraydecay2 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* %output, i32 0, i32 0, !opID !657, !opSignedness !6
  call void @_Z9renderingP11Triangle_3DPA256_h(%struct.Triangle_3D* %arraydecay1, [256 x i8]* %arraydecay2), !opID !658, !opSignedness !6
  %arraydecay3 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* %output, i32 0, i32 0, !opID !659, !opSignedness !6
  call void @populateOutput([256 x i8]* %arraydecay3), !opID !660, !opSignedness !6
  ret i32 0, !opID !4, !opSignedness !6
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
!opIDCounter = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i64 646}
!5 = !{i64 1}
!6 = !{!"unknownSignedness"}
!7 = !{i64 2}
!8 = !{i64 3}
!9 = !{i64 4}
!10 = !{i64 5}
!11 = !{i64 6}
!12 = !{i64 7}
!13 = !{i64 8}
!14 = !{i64 9}
!15 = !{i64 10}
!16 = !{i64 11}
!17 = !{i64 12}
!18 = !{i64 13}
!19 = !{i64 14}
!20 = !{i64 15}
!21 = !{i64 16}
!22 = !{i64 17}
!23 = !{i64 18}
!24 = !{i64 19}
!25 = !{i64 20}
!26 = !{i64 21}
!27 = !{i64 22}
!28 = !{i64 23}
!29 = !{i64 24}
!30 = !{i64 25}
!31 = !{i64 26}
!32 = !{i64 27}
!33 = !{i64 28}
!34 = !{i64 29}
!35 = !{i64 30}
!36 = !{i64 31}
!37 = !{i64 32}
!38 = !{i64 33}
!39 = !{i64 34}
!40 = !{i64 35}
!41 = !{i64 36}
!42 = !{i64 37}
!43 = !{i64 38}
!44 = !{i64 39}
!45 = !{i64 40}
!46 = !{i64 41}
!47 = !{i64 42}
!48 = !{i64 43}
!49 = !{i64 44}
!50 = !{i64 45}
!51 = !{i64 46}
!52 = !{i64 47}
!53 = !{i64 48}
!54 = !{i64 49}
!55 = !{i64 50}
!56 = !{i64 51}
!57 = !{i64 52}
!58 = !{i64 53}
!59 = !{i64 54}
!60 = !{i64 55}
!61 = !{i64 56}
!62 = !{i64 57}
!63 = !{i64 58}
!64 = !{i64 59}
!65 = !{i64 60}
!66 = !{i64 61}
!67 = !{i64 62}
!68 = !{i64 63}
!69 = !{i64 64}
!70 = !{i64 65}
!71 = !{i64 66}
!72 = !{i64 67}
!73 = !{i64 68}
!74 = !{i64 69}
!75 = !{i64 70}
!76 = !{i64 71}
!77 = !{i64 72}
!78 = !{i64 73}
!79 = !{i64 74}
!80 = !{i64 75}
!81 = !{i64 76}
!82 = !{i64 77}
!83 = !{i64 78}
!84 = !{i64 79}
!85 = !{i64 80}
!86 = !{i64 81}
!87 = !{i64 82}
!88 = !{i64 83}
!89 = !{i64 84}
!90 = !{i64 85}
!91 = !{i64 86}
!92 = !{i64 87}
!93 = !{i64 88}
!94 = !{i64 89}
!95 = !{i64 90}
!96 = !{i64 91}
!97 = !{i64 92}
!98 = !{i64 93}
!99 = !{i64 94}
!100 = !{i64 95}
!101 = !{i64 96}
!102 = !{i64 97}
!103 = !{i64 98}
!104 = !{i64 99}
!105 = !{i64 100}
!106 = !{i64 101}
!107 = !{i64 102}
!108 = !{i64 103}
!109 = !{i64 104}
!110 = !{i64 105}
!111 = !{i64 106}
!112 = !{i64 107}
!113 = !{i64 108}
!114 = !{i64 109}
!115 = !{i64 110}
!116 = !{i64 111}
!117 = !{i64 112}
!118 = !{i64 113}
!119 = !{i64 114}
!120 = !{i64 115}
!121 = !{i64 116}
!122 = !{i64 117}
!123 = !{i64 118}
!124 = !{i64 119}
!125 = !{i64 120}
!126 = !{i64 121}
!127 = !{i64 122}
!128 = !{i64 123}
!129 = !{i64 124}
!130 = !{i64 125}
!131 = !{i64 126}
!132 = !{i64 127}
!133 = !{i64 128}
!134 = !{i64 129}
!135 = !{i64 130}
!136 = !{i64 131}
!137 = !{i64 132}
!138 = !{i64 133}
!139 = !{i64 134}
!140 = !{i64 135}
!141 = !{i64 136}
!142 = !{i64 137}
!143 = !{i64 138}
!144 = !{i64 139}
!145 = !{i64 140}
!146 = !{i64 141}
!147 = !{i64 142}
!148 = !{i64 143}
!149 = !{i64 144}
!150 = !{i64 145}
!151 = !{i64 146}
!152 = !{i64 147}
!153 = !{i64 148}
!154 = !{i64 149}
!155 = !{i64 150}
!156 = !{i64 151}
!157 = !{i64 152}
!158 = !{i64 153}
!159 = !{i64 154}
!160 = !{i64 155}
!161 = !{i64 156}
!162 = !{i64 157}
!163 = !{i64 158}
!164 = !{i64 159}
!165 = !{i64 160}
!166 = !{i64 161}
!167 = !{i64 162}
!168 = !{i64 163}
!169 = !{i64 164}
!170 = !{i64 165}
!171 = !{i64 166}
!172 = !{i64 167}
!173 = !{i64 168}
!174 = !{i64 169}
!175 = !{i64 170}
!176 = !{i64 171}
!177 = !{i64 172}
!178 = !{i64 173}
!179 = !{i64 174}
!180 = !{i64 175}
!181 = !{i64 176}
!182 = !{i64 177}
!183 = !{i64 178}
!184 = !{i64 179}
!185 = !{i64 180}
!186 = !{i64 181}
!187 = !{i64 182}
!188 = !{i64 183}
!189 = !{i64 184}
!190 = !{i64 185}
!191 = !{i64 186}
!192 = !{i64 187}
!193 = !{i64 188}
!194 = !{i64 189}
!195 = !{i64 190}
!196 = !{i64 191}
!197 = !{i64 192}
!198 = !{i64 193}
!199 = !{i64 194}
!200 = !{i64 195}
!201 = !{i64 196}
!202 = !{i64 197}
!203 = !{i64 198}
!204 = !{i64 199}
!205 = !{i64 200}
!206 = !{i64 201}
!207 = !{i64 202}
!208 = !{i64 203}
!209 = !{i64 204}
!210 = !{i64 205}
!211 = !{i64 206}
!212 = !{i64 207}
!213 = !{i64 208}
!214 = !{i64 209}
!215 = !{i64 210}
!216 = !{i64 211}
!217 = !{i64 212}
!218 = !{i64 213}
!219 = !{i64 214}
!220 = !{i64 215}
!221 = !{i64 216}
!222 = !{i64 217}
!223 = !{i64 218}
!224 = !{i64 219}
!225 = !{i64 220}
!226 = !{i64 221}
!227 = !{i64 222}
!228 = !{i64 223}
!229 = !{i64 224}
!230 = !{i64 225}
!231 = !{i64 226}
!232 = !{i64 227}
!233 = !{i64 228}
!234 = !{i64 229}
!235 = !{i64 230}
!236 = !{i64 231}
!237 = !{i64 232}
!238 = !{i64 233}
!239 = !{i64 234}
!240 = !{i64 235}
!241 = !{i64 236}
!242 = !{i64 237}
!243 = !{i64 238}
!244 = !{i64 239}
!245 = !{i64 240}
!246 = !{i64 241}
!247 = !{i64 242}
!248 = !{i64 243}
!249 = !{i64 244}
!250 = !{i64 245}
!251 = !{i64 246}
!252 = !{i64 247}
!253 = !{i64 248}
!254 = !{i64 249}
!255 = !{i64 250}
!256 = !{i64 251}
!257 = !{i64 252}
!258 = !{i64 253}
!259 = !{i64 254}
!260 = !{i64 255}
!261 = !{i64 256}
!262 = !{i64 257}
!263 = !{i64 258}
!264 = !{i64 259}
!265 = !{i64 260}
!266 = !{i64 261}
!267 = !{i64 262}
!268 = !{i64 263}
!269 = !{i64 264}
!270 = !{i64 265}
!271 = !{i64 266}
!272 = !{i64 267}
!273 = !{i64 268}
!274 = !{i64 269}
!275 = !{i64 270}
!276 = !{i64 271}
!277 = !{i64 272}
!278 = !{i64 273}
!279 = !{i64 274}
!280 = !{i64 275}
!281 = !{i64 276}
!282 = !{i64 277}
!283 = !{i64 278}
!284 = !{i64 279}
!285 = !{i64 280}
!286 = !{i64 281}
!287 = !{i64 282}
!288 = !{i64 283}
!289 = !{i64 284}
!290 = !{i64 285}
!291 = !{i64 286}
!292 = !{i64 287}
!293 = !{i64 288}
!294 = !{i64 289}
!295 = !{i64 290}
!296 = !{i64 291}
!297 = !{i64 292}
!298 = !{i64 293}
!299 = !{i64 294}
!300 = !{i64 295}
!301 = !{i64 296}
!302 = !{i64 297}
!303 = !{i64 298}
!304 = !{i64 299}
!305 = !{i64 300}
!306 = !{i64 301}
!307 = !{i64 302}
!308 = !{i64 303}
!309 = !{i64 304}
!310 = !{i64 305}
!311 = !{i64 306}
!312 = !{i64 307}
!313 = !{i64 308}
!314 = !{i64 309}
!315 = !{i64 310}
!316 = !{i64 311}
!317 = !{i64 312}
!318 = !{i64 313}
!319 = !{i64 314}
!320 = !{i64 315}
!321 = !{i64 316}
!322 = !{i64 317}
!323 = !{i64 318}
!324 = !{i64 319}
!325 = !{i64 320}
!326 = !{i64 321}
!327 = !{i64 322}
!328 = !{i64 323}
!329 = !{i64 324}
!330 = !{i64 325}
!331 = !{i64 326}
!332 = !{i64 327}
!333 = !{i64 328}
!334 = !{i64 329}
!335 = !{i64 330}
!336 = !{i64 331}
!337 = !{i64 332}
!338 = !{i64 333}
!339 = !{i64 334}
!340 = !{i64 335}
!341 = !{i64 336}
!342 = !{i64 337}
!343 = !{i64 338}
!344 = !{i64 339}
!345 = !{i64 340}
!346 = !{i64 341}
!347 = !{i64 342}
!348 = !{i64 343}
!349 = !{i64 344}
!350 = !{i64 345}
!351 = !{i64 346}
!352 = !{i64 347}
!353 = !{i64 348}
!354 = !{i64 349}
!355 = !{i64 350}
!356 = !{i64 351}
!357 = !{i64 352}
!358 = !{i64 353}
!359 = !{i64 354}
!360 = !{i64 355}
!361 = !{i64 356}
!362 = !{i64 357}
!363 = !{i64 358}
!364 = !{i64 359}
!365 = distinct !{!365, !366}
!366 = !{!"llvm.loop.name", !"RAST2"}
!367 = !{i64 360}
!368 = !{i64 361}
!369 = !{i64 362}
!370 = !{i64 363}
!371 = !{i64 364}
!372 = !{i64 365}
!373 = !{i64 366}
!374 = !{i64 367}
!375 = !{i64 368}
!376 = !{i64 369}
!377 = !{i64 370}
!378 = !{i64 371}
!379 = !{i64 372}
!380 = !{i64 373}
!381 = !{i64 374}
!382 = !{i64 375}
!383 = !{i64 376}
!384 = !{i64 377}
!385 = !{i64 378}
!386 = !{i64 379}
!387 = !{i64 380}
!388 = !{i64 381}
!389 = !{i64 382}
!390 = !{i64 383}
!391 = !{i64 384}
!392 = !{i64 385}
!393 = !{i64 386}
!394 = !{i64 387}
!395 = !{i64 388}
!396 = !{i64 389}
!397 = !{i64 390}
!398 = !{i64 391}
!399 = !{i64 392}
!400 = !{i64 393}
!401 = !{i64 394}
!402 = !{i64 395}
!403 = !{i64 396}
!404 = !{i64 397}
!405 = !{i64 398}
!406 = !{i64 399}
!407 = !{i64 400}
!408 = !{i64 401}
!409 = !{i64 402}
!410 = !{i64 403}
!411 = !{i64 404}
!412 = !{i64 405}
!413 = !{i64 406}
!414 = !{i64 407}
!415 = !{i64 408}
!416 = distinct !{!416, !417}
!417 = !{!"llvm.loop.name", !"ZCULLING"}
!418 = !{i64 409}
!419 = !{i64 410}
!420 = !{i64 411}
!421 = !{i64 412}
!422 = !{i64 413}
!423 = !{i64 414}
!424 = !{i64 415}
!425 = !{i64 416}
!426 = !{i64 417}
!427 = !{i64 418}
!428 = !{i64 419}
!429 = !{i64 420}
!430 = !{i64 421}
!431 = !{i64 422}
!432 = !{i64 423}
!433 = !{i64 424}
!434 = !{i64 425}
!435 = !{i64 426}
!436 = !{i64 427}
!437 = !{i64 428}
!438 = !{i64 429}
!439 = !{i64 430}
!440 = !{i64 431}
!441 = !{i64 432}
!442 = distinct !{!442, !443}
!443 = !{!"llvm.loop.name", !"COLORING_FB"}
!444 = !{i64 433}
!445 = !{!446}
!446 = !{!"fpga.top", !"user"}
!447 = !{i64 434}
!448 = !{i64 435}
!449 = !{i64 436}
!450 = !{i64 437}
!451 = !{i64 438}
!452 = !{i64 439}
!453 = !{i64 440}
!454 = !{i64 441}
!455 = !{i64 442}
!456 = !{i64 443}
!457 = !{i64 444}
!458 = !{i64 445}
!459 = !{i64 446}
!460 = !{i64 447}
!461 = !{i64 448}
!462 = !{i64 449}
!463 = !{i64 450}
!464 = !{i64 451}
!465 = !{i64 452}
!466 = !{i64 453}
!467 = !{i64 454}
!468 = !{i64 455}
!469 = !{i64 456}
!470 = !{i64 457}
!471 = !{i64 458}
!472 = !{i64 459}
!473 = !{i64 460}
!474 = !{i64 461}
!475 = !{i64 462}
!476 = !{i64 463}
!477 = !{i64 464}
!478 = !{i64 465}
!479 = !{i64 466}
!480 = !{i64 467}
!481 = !{i64 468}
!482 = !{i64 469}
!483 = !{i64 470}
!484 = !{i64 471}
!485 = !{i64 472}
!486 = !{i64 473}
!487 = !{i64 474}
!488 = !{i64 475}
!489 = !{i64 476}
!490 = !{i64 477}
!491 = !{i64 478}
!492 = !{i64 479}
!493 = !{i64 480}
!494 = !{i64 481}
!495 = !{i64 482}
!496 = !{i64 483}
!497 = !{i64 484}
!498 = !{i64 485}
!499 = !{i64 486}
!500 = !{i64 487}
!501 = !{i64 488}
!502 = !{i64 489}
!503 = !{i64 490}
!504 = !{i64 491}
!505 = !{i64 492}
!506 = !{i64 493}
!507 = !{i64 494}
!508 = !{i64 495}
!509 = !{i64 496}
!510 = !{i64 497}
!511 = !{i64 498}
!512 = !{i64 499}
!513 = !{i64 500}
!514 = !{i64 501}
!515 = !{i64 502}
!516 = !{i64 503}
!517 = !{i64 504}
!518 = !{i64 505}
!519 = !{i64 506}
!520 = !{i64 507}
!521 = !{i64 508}
!522 = !{i64 509}
!523 = !{i64 510}
!524 = !{i64 511}
!525 = !{i64 512}
!526 = !{i64 513}
!527 = !{i64 514}
!528 = !{i64 515}
!529 = !{i64 516}
!530 = !{i64 517}
!531 = !{i64 518}
!532 = !{i64 519}
!533 = !{i64 520}
!534 = !{i64 521}
!535 = !{i64 522}
!536 = !{i64 523}
!537 = !{i64 524}
!538 = !{i64 525}
!539 = !{i64 526}
!540 = !{i64 527}
!541 = !{i64 528}
!542 = !{i64 529}
!543 = !{i64 530}
!544 = !{i64 531}
!545 = !{i64 532}
!546 = !{i64 533}
!547 = !{i64 534}
!548 = !{i64 535}
!549 = !{i64 536}
!550 = !{i64 537}
!551 = !{i64 538}
!552 = !{i64 539}
!553 = !{i64 540}
!554 = !{i64 541}
!555 = !{i64 542}
!556 = !{i64 543}
!557 = !{i64 544}
!558 = !{i64 545}
!559 = !{i64 546}
!560 = !{i64 547}
!561 = !{i64 548}
!562 = !{i64 549}
!563 = !{i64 550}
!564 = !{i64 551}
!565 = !{i64 552}
!566 = !{i64 553}
!567 = !{i64 554}
!568 = !{i64 555}
!569 = !{i64 556}
!570 = !{i64 557}
!571 = !{i64 558}
!572 = !{i64 559}
!573 = !{i64 560}
!574 = !{i64 561}
!575 = !{i64 562}
!576 = !{i64 563}
!577 = !{i64 564}
!578 = !{i64 565}
!579 = !{i64 566}
!580 = !{i64 567}
!581 = !{i64 568}
!582 = !{i64 569}
!583 = !{i64 570}
!584 = !{i64 571}
!585 = !{i64 572}
!586 = !{i64 573}
!587 = !{i64 574}
!588 = !{i64 575}
!589 = !{i64 576}
!590 = !{i64 577}
!591 = !{i64 578}
!592 = !{i64 579}
!593 = !{i64 580}
!594 = !{i64 581}
!595 = !{i64 582}
!596 = !{i64 583}
!597 = !{i64 584}
!598 = !{i64 585}
!599 = !{i64 586}
!600 = !{i64 587}
!601 = !{i64 588}
!602 = !{i64 589}
!603 = !{i64 590}
!604 = !{i64 591}
!605 = !{i64 592}
!606 = !{i64 593}
!607 = !{i64 594}
!608 = !{i64 595}
!609 = !{i64 596}
!610 = !{i64 597}
!611 = !{i64 598}
!612 = !{i64 599}
!613 = !{i64 600}
!614 = !{i64 601}
!615 = !{i64 602}
!616 = !{i64 603}
!617 = !{i64 604}
!618 = !{i64 605}
!619 = !{i64 606}
!620 = !{i64 607}
!621 = !{i64 608}
!622 = !{i64 609}
!623 = !{i64 610}
!624 = !{i64 611}
!625 = !{i64 612}
!626 = !{i64 613}
!627 = !{i64 614}
!628 = !{i64 615}
!629 = !{i64 616}
!630 = !{i64 617}
!631 = !{i64 618}
!632 = !{i64 619}
!633 = !{i64 620}
!634 = !{i64 621}
!635 = !{i64 622}
!636 = !{i64 623}
!637 = !{i64 624}
!638 = !{i64 625}
!639 = !{i64 626}
!640 = distinct !{!640, !641}
!641 = !{!"llvm.loop.name", !"TRIANGLES"}
!642 = !{i64 627}
!643 = !{i64 628}
!644 = !{i64 629}
!645 = !{i64 630}
!646 = !{i64 631}
!647 = !{i64 632}
!648 = !{i64 633}
!649 = !{i64 634}
!650 = !{i64 635}
!651 = !{i64 636}
!652 = !{i64 637}
!653 = !{i64 638}
!654 = !{i64 639}
!655 = !{i64 640}
!656 = !{i64 641}
!657 = !{i64 642}
!658 = !{i64 643}
!659 = !{i64 644}
!660 = !{i64 645}
