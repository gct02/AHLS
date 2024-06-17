; ModuleID = '<stdin>'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Triangle_2D = type { i8, i8, i8, i8, i8, i8, i8 }
%struct.Triangle_3D = type { i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.CandidatePixel = type { i8, i8, i8, i8 }
%struct.Pixel = type { i8, i8, i8 }

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer = internal global [256 x [256 x i8]] zeroinitializer, align 1

; Function Attrs: nounwind
define i32 @_Z15check_clockwise11Triangle_2D(%struct.Triangle_2D* byval align 1 %triangle_2d) #0 {
entry:
  %cw = alloca i32, align 4
  %0 = bitcast i32* %cw to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #13
  %x2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4
  %1 = load i8, i8* %x2, align 1
  %conv = zext i8 %1 to i32
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0
  %2 = load i8, i8* %x0, align 1
  %conv1 = zext i8 %2 to i32
  %sub = sub i32 %conv, %conv1
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3
  %3 = load i8, i8* %y1, align 1
  %conv2 = zext i8 %3 to i32
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1
  %4 = load i8, i8* %y0, align 1
  %conv3 = zext i8 %4 to i32
  %sub4 = sub i32 %conv2, %conv3
  %mul = mul i32 %sub, %sub4
  %y2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5
  %5 = load i8, i8* %y2, align 1
  %conv5 = zext i8 %5 to i32
  %y06 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1
  %6 = load i8, i8* %y06, align 1
  %conv7 = zext i8 %6 to i32
  %sub8 = sub i32 %conv5, %conv7
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2
  %7 = load i8, i8* %x1, align 1
  %conv9 = zext i8 %7 to i32
  %x010 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0
  %8 = load i8, i8* %x010, align 1
  %conv11 = zext i8 %8 to i32
  %sub12 = sub i32 %conv9, %conv11
  %mul13 = mul i32 %sub8, %sub12
  %sub14 = sub i32 %mul, %mul13
  store i32 %sub14, i32* %cw, align 4
  %9 = load i32, i32* %cw, align 4
  %10 = bitcast i32* %cw to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #13
  ret i32 %9
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
define void @_Z18clockwise_verticesP11Triangle_2D(%struct.Triangle_2D* %triangle_2d) #3 {
entry:
  %triangle_2d.addr = alloca %struct.Triangle_2D*, align 8
  %tmp_x = alloca i8, align 1
  %tmp_y = alloca i8, align 1
  store %struct.Triangle_2D* %triangle_2d, %struct.Triangle_2D** %triangle_2d.addr, align 8
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %tmp_x) #13
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %tmp_y) #13
  %0 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %0, i32 0, i32 0
  %1 = load i8, i8* %x0, align 1
  store i8 %1, i8* %tmp_x, align 1
  %2 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %2, i32 0, i32 1
  %3 = load i8, i8* %y0, align 1
  store i8 %3, i8* %tmp_y, align 1
  %4 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %4, i32 0, i32 2
  %5 = load i8, i8* %x1, align 1
  %6 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %x01 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %6, i32 0, i32 0
  store i8 %5, i8* %x01, align 1
  %7 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %7, i32 0, i32 3
  %8 = load i8, i8* %y1, align 1
  %9 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %y02 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %9, i32 0, i32 1
  store i8 %8, i8* %y02, align 1
  %10 = load i8, i8* %tmp_x, align 1
  %11 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %x13 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %11, i32 0, i32 2
  store i8 %10, i8* %x13, align 1
  %12 = load i8, i8* %tmp_y, align 1
  %13 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %y14 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %13, i32 0, i32 3
  store i8 %12, i8* %y14, align 1
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %tmp_y) #13
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %tmp_x) #13
  ret void
}

; Function Attrs: nounwind
define zeroext i1 @_Z17pixel_in_trianglehh11Triangle_2D(i8 zeroext %x, i8 zeroext %y, %struct.Triangle_2D* byval align 1 %triangle_2d) #4 {
entry:
  %x.addr = alloca i8, align 1
  %y.addr = alloca i8, align 1
  %pi0 = alloca i32, align 4
  %pi1 = alloca i32, align 4
  %pi2 = alloca i32, align 4
  store i8 %x, i8* %x.addr, align 1
  store i8 %y, i8* %y.addr, align 1
  %0 = bitcast i32* %pi0 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #13
  %1 = bitcast i32* %pi1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #13
  %2 = bitcast i32* %pi2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #13
  %3 = load i8, i8* %x.addr, align 1
  %conv = zext i8 %3 to i32
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0
  %4 = load i8, i8* %x0, align 1
  %conv1 = zext i8 %4 to i32
  %sub = sub i32 %conv, %conv1
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3
  %5 = load i8, i8* %y1, align 1
  %conv2 = zext i8 %5 to i32
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1
  %6 = load i8, i8* %y0, align 1
  %conv3 = zext i8 %6 to i32
  %sub4 = sub i32 %conv2, %conv3
  %mul = mul i32 %sub, %sub4
  %7 = load i8, i8* %y.addr, align 1
  %conv5 = zext i8 %7 to i32
  %y06 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1
  %8 = load i8, i8* %y06, align 1
  %conv7 = zext i8 %8 to i32
  %sub8 = sub i32 %conv5, %conv7
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2
  %9 = load i8, i8* %x1, align 1
  %conv9 = zext i8 %9 to i32
  %x010 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0
  %10 = load i8, i8* %x010, align 1
  %conv11 = zext i8 %10 to i32
  %sub12 = sub i32 %conv9, %conv11
  %mul13 = mul i32 %sub8, %sub12
  %sub14 = sub i32 %mul, %mul13
  store i32 %sub14, i32* %pi0, align 4
  %11 = load i8, i8* %x.addr, align 1
  %conv15 = zext i8 %11 to i32
  %x116 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2
  %12 = load i8, i8* %x116, align 1
  %conv17 = zext i8 %12 to i32
  %sub18 = sub i32 %conv15, %conv17
  %y2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5
  %13 = load i8, i8* %y2, align 1
  %conv19 = zext i8 %13 to i32
  %y120 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3
  %14 = load i8, i8* %y120, align 1
  %conv21 = zext i8 %14 to i32
  %sub22 = sub i32 %conv19, %conv21
  %mul23 = mul i32 %sub18, %sub22
  %15 = load i8, i8* %y.addr, align 1
  %conv24 = zext i8 %15 to i32
  %y125 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3
  %16 = load i8, i8* %y125, align 1
  %conv26 = zext i8 %16 to i32
  %sub27 = sub i32 %conv24, %conv26
  %x2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4
  %17 = load i8, i8* %x2, align 1
  %conv28 = zext i8 %17 to i32
  %x129 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2
  %18 = load i8, i8* %x129, align 1
  %conv30 = zext i8 %18 to i32
  %sub31 = sub i32 %conv28, %conv30
  %mul32 = mul i32 %sub27, %sub31
  %sub33 = sub i32 %mul23, %mul32
  store i32 %sub33, i32* %pi1, align 4
  %19 = load i8, i8* %x.addr, align 1
  %conv34 = zext i8 %19 to i32
  %x235 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4
  %20 = load i8, i8* %x235, align 1
  %conv36 = zext i8 %20 to i32
  %sub37 = sub i32 %conv34, %conv36
  %y038 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1
  %21 = load i8, i8* %y038, align 1
  %conv39 = zext i8 %21 to i32
  %y240 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5
  %22 = load i8, i8* %y240, align 1
  %conv41 = zext i8 %22 to i32
  %sub42 = sub i32 %conv39, %conv41
  %mul43 = mul i32 %sub37, %sub42
  %23 = load i8, i8* %y.addr, align 1
  %conv44 = zext i8 %23 to i32
  %y245 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5
  %24 = load i8, i8* %y245, align 1
  %conv46 = zext i8 %24 to i32
  %sub47 = sub i32 %conv44, %conv46
  %x048 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0
  %25 = load i8, i8* %x048, align 1
  %conv49 = zext i8 %25 to i32
  %x250 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4
  %26 = load i8, i8* %x250, align 1
  %conv51 = zext i8 %26 to i32
  %sub52 = sub i32 %conv49, %conv51
  %mul53 = mul i32 %sub47, %sub52
  %sub54 = sub i32 %mul43, %mul53
  store i32 %sub54, i32* %pi2, align 4
  %27 = load i32, i32* %pi0, align 4
  %cmp = icmp sge i32 %27, 0
  br i1 %cmp, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %entry
  %28 = load i32, i32* %pi1, align 4
  %cmp55 = icmp sge i32 %28, 0
  br i1 %cmp55, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %29 = load i32, i32* %pi2, align 4
  %cmp56 = icmp sge i32 %29, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %entry
  %30 = phi i1 [ false, %land.lhs.true ], [ false, %entry ], [ %cmp56, %land.rhs ]
  %31 = bitcast i32* %pi2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %31) #13
  %32 = bitcast i32* %pi1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #13
  %33 = bitcast i32* %pi0 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %33) #13
  ret i1 %30
}

; Function Attrs: nounwind
define zeroext i8 @_Z8find_minhhh(i8 zeroext %in0, i8 zeroext %in1, i8 zeroext %in2) #5 {
entry:
  %retval = alloca i8, align 1
  %in0.addr = alloca i8, align 1
  %in1.addr = alloca i8, align 1
  %in2.addr = alloca i8, align 1
  store i8 %in0, i8* %in0.addr, align 1
  store i8 %in1, i8* %in1.addr, align 1
  store i8 %in2, i8* %in2.addr, align 1
  %0 = load i8, i8* %in0.addr, align 1
  %conv = zext i8 %0 to i32
  %1 = load i8, i8* %in1.addr, align 1
  %conv1 = zext i8 %1 to i32
  %cmp = icmp slt i32 %conv, %conv1
  br i1 %cmp, label %if.then, label %if.else6

if.then:                                          ; preds = %entry
  %2 = load i8, i8* %in0.addr, align 1
  %conv2 = zext i8 %2 to i32
  %3 = load i8, i8* %in2.addr, align 1
  %conv3 = zext i8 %3 to i32
  %cmp4 = icmp slt i32 %conv2, %conv3
  br i1 %cmp4, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.then
  %4 = load i8, i8* %in0.addr, align 1
  store i8 %4, i8* %retval, align 1
  br label %return

if.else:                                          ; preds = %if.then
  %5 = load i8, i8* %in2.addr, align 1
  store i8 %5, i8* %retval, align 1
  br label %return

if.else6:                                         ; preds = %entry
  %6 = load i8, i8* %in1.addr, align 1
  %conv7 = zext i8 %6 to i32
  %7 = load i8, i8* %in2.addr, align 1
  %conv8 = zext i8 %7 to i32
  %cmp9 = icmp slt i32 %conv7, %conv8
  br i1 %cmp9, label %if.then10, label %if.else11

if.then10:                                        ; preds = %if.else6
  %8 = load i8, i8* %in1.addr, align 1
  store i8 %8, i8* %retval, align 1
  br label %return

if.else11:                                        ; preds = %if.else6
  %9 = load i8, i8* %in2.addr, align 1
  store i8 %9, i8* %retval, align 1
  br label %return

return:                                           ; preds = %if.else11, %if.then10, %if.else, %if.then5
  %10 = load i8, i8* %retval, align 1
  ret i8 %10
}

; Function Attrs: nounwind
define zeroext i8 @_Z8find_maxhhh(i8 zeroext %in0, i8 zeroext %in1, i8 zeroext %in2) #6 {
entry:
  %retval = alloca i8, align 1
  %in0.addr = alloca i8, align 1
  %in1.addr = alloca i8, align 1
  %in2.addr = alloca i8, align 1
  store i8 %in0, i8* %in0.addr, align 1
  store i8 %in1, i8* %in1.addr, align 1
  store i8 %in2, i8* %in2.addr, align 1
  %0 = load i8, i8* %in0.addr, align 1
  %conv = zext i8 %0 to i32
  %1 = load i8, i8* %in1.addr, align 1
  %conv1 = zext i8 %1 to i32
  %cmp = icmp sgt i32 %conv, %conv1
  br i1 %cmp, label %if.then, label %if.else6

if.then:                                          ; preds = %entry
  %2 = load i8, i8* %in0.addr, align 1
  %conv2 = zext i8 %2 to i32
  %3 = load i8, i8* %in2.addr, align 1
  %conv3 = zext i8 %3 to i32
  %cmp4 = icmp sgt i32 %conv2, %conv3
  br i1 %cmp4, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.then
  %4 = load i8, i8* %in0.addr, align 1
  store i8 %4, i8* %retval, align 1
  br label %return

if.else:                                          ; preds = %if.then
  %5 = load i8, i8* %in2.addr, align 1
  store i8 %5, i8* %retval, align 1
  br label %return

if.else6:                                         ; preds = %entry
  %6 = load i8, i8* %in1.addr, align 1
  %conv7 = zext i8 %6 to i32
  %7 = load i8, i8* %in2.addr, align 1
  %conv8 = zext i8 %7 to i32
  %cmp9 = icmp sgt i32 %conv7, %conv8
  br i1 %cmp9, label %if.then10, label %if.else11

if.then10:                                        ; preds = %if.else6
  %8 = load i8, i8* %in1.addr, align 1
  store i8 %8, i8* %retval, align 1
  br label %return

if.else11:                                        ; preds = %if.else6
  %9 = load i8, i8* %in2.addr, align 1
  store i8 %9, i8* %retval, align 1
  br label %return

return:                                           ; preds = %if.else11, %if.then10, %if.else, %if.then5
  %10 = load i8, i8* %retval, align 1
  ret i8 %10
}

; Function Attrs: nounwind
define void @_Z10projection11Triangle_3DP11Triangle_2Di(%struct.Triangle_3D* byval align 1 %triangle_3d, %struct.Triangle_2D* %triangle_2d, i32 %angle) #7 {
entry:
  %triangle_2d.addr = alloca %struct.Triangle_2D*, align 8
  %angle.addr = alloca i32, align 4
  store %struct.Triangle_2D* %triangle_2d, %struct.Triangle_2D** %triangle_2d.addr, align 8
  store i32 %angle, i32* %angle.addr, align 4
  %0 = load i32, i32* %angle.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %x0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 0
  %1 = load i8, i8* %x0, align 1
  %2 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %x01 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %2, i32 0, i32 0
  store i8 %1, i8* %x01, align 1
  %y0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 1
  %3 = load i8, i8* %y0, align 1
  %4 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %y02 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %4, i32 0, i32 1
  store i8 %3, i8* %y02, align 1
  %x1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 3
  %5 = load i8, i8* %x1, align 1
  %6 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %x13 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %6, i32 0, i32 2
  store i8 %5, i8* %x13, align 1
  %y1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 4
  %7 = load i8, i8* %y1, align 1
  %8 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %y14 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %8, i32 0, i32 3
  store i8 %7, i8* %y14, align 1
  %x2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 6
  %9 = load i8, i8* %x2, align 1
  %10 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %x25 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %10, i32 0, i32 4
  store i8 %9, i8* %x25, align 1
  %y2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 7
  %11 = load i8, i8* %y2, align 1
  %12 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %y26 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %12, i32 0, i32 5
  store i8 %11, i8* %y26, align 1
  %z0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 2
  %13 = load i8, i8* %z0, align 1
  %conv = zext i8 %13 to i32
  %div = sdiv i32 %conv, 3
  %z1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 5
  %14 = load i8, i8* %z1, align 1
  %conv7 = zext i8 %14 to i32
  %div8 = sdiv i32 %conv7, 3
  %add = add i32 %div, %div8
  %z2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 8
  %15 = load i8, i8* %z2, align 1
  %conv9 = zext i8 %15 to i32
  %div10 = sdiv i32 %conv9, 3
  %add11 = add i32 %add, %div10
  %conv12 = trunc i32 %add11 to i8
  %16 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %z = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %16, i32 0, i32 6
  store i8 %conv12, i8* %z, align 1
  br label %if.end69

if.else:                                          ; preds = %entry
  %17 = load i32, i32* %angle.addr, align 4
  %cmp13 = icmp eq i32 %17, 1
  br i1 %cmp13, label %if.then14, label %if.else40

if.then14:                                        ; preds = %if.else
  %x015 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 0
  %18 = load i8, i8* %x015, align 1
  %19 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %x016 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %19, i32 0, i32 0
  store i8 %18, i8* %x016, align 1
  %z017 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 2
  %20 = load i8, i8* %z017, align 1
  %21 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %y018 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %21, i32 0, i32 1
  store i8 %20, i8* %y018, align 1
  %x119 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 3
  %22 = load i8, i8* %x119, align 1
  %23 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %x120 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %23, i32 0, i32 2
  store i8 %22, i8* %x120, align 1
  %z121 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 5
  %24 = load i8, i8* %z121, align 1
  %25 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %y122 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %25, i32 0, i32 3
  store i8 %24, i8* %y122, align 1
  %x223 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 6
  %26 = load i8, i8* %x223, align 1
  %27 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %x224 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %27, i32 0, i32 4
  store i8 %26, i8* %x224, align 1
  %z225 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 8
  %28 = load i8, i8* %z225, align 1
  %29 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %y226 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %29, i32 0, i32 5
  store i8 %28, i8* %y226, align 1
  %y027 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 1
  %30 = load i8, i8* %y027, align 1
  %conv28 = zext i8 %30 to i32
  %div29 = sdiv i32 %conv28, 3
  %y130 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 4
  %31 = load i8, i8* %y130, align 1
  %conv31 = zext i8 %31 to i32
  %div32 = sdiv i32 %conv31, 3
  %add33 = add i32 %div29, %div32
  %y234 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 7
  %32 = load i8, i8* %y234, align 1
  %conv35 = zext i8 %32 to i32
  %div36 = sdiv i32 %conv35, 3
  %add37 = add i32 %add33, %div36
  %conv38 = trunc i32 %add37 to i8
  %33 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %z39 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %33, i32 0, i32 6
  store i8 %conv38, i8* %z39, align 1
  br label %if.end68

if.else40:                                        ; preds = %if.else
  %34 = load i32, i32* %angle.addr, align 4
  %cmp41 = icmp eq i32 %34, 2
  br i1 %cmp41, label %if.then42, label %if.end

if.then42:                                        ; preds = %if.else40
  %z043 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 2
  %35 = load i8, i8* %z043, align 1
  %36 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %x044 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %36, i32 0, i32 0
  store i8 %35, i8* %x044, align 1
  %y045 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 1
  %37 = load i8, i8* %y045, align 1
  %38 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %y046 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %38, i32 0, i32 1
  store i8 %37, i8* %y046, align 1
  %z147 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 5
  %39 = load i8, i8* %z147, align 1
  %40 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %x148 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %40, i32 0, i32 2
  store i8 %39, i8* %x148, align 1
  %y149 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 4
  %41 = load i8, i8* %y149, align 1
  %42 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %y150 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %42, i32 0, i32 3
  store i8 %41, i8* %y150, align 1
  %z251 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 8
  %43 = load i8, i8* %z251, align 1
  %44 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %x252 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %44, i32 0, i32 4
  store i8 %43, i8* %x252, align 1
  %y253 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 7
  %45 = load i8, i8* %y253, align 1
  %46 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %y254 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %46, i32 0, i32 5
  store i8 %45, i8* %y254, align 1
  %x055 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 0
  %47 = load i8, i8* %x055, align 1
  %conv56 = zext i8 %47 to i32
  %div57 = sdiv i32 %conv56, 3
  %x158 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 3
  %48 = load i8, i8* %x158, align 1
  %conv59 = zext i8 %48 to i32
  %div60 = sdiv i32 %conv59, 3
  %add61 = add i32 %div57, %div60
  %x262 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 6
  %49 = load i8, i8* %x262, align 1
  %conv63 = zext i8 %49 to i32
  %div64 = sdiv i32 %conv63, 3
  %add65 = add i32 %add61, %div64
  %conv66 = trunc i32 %add65 to i8
  %50 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8
  %z67 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %50, i32 0, i32 6
  store i8 %conv66, i8* %z67, align 1
  br label %if.end

if.end:                                           ; preds = %if.then42, %if.else40
  br label %if.end68

if.end68:                                         ; preds = %if.end, %if.then14
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.then
  ret void
}

; Function Attrs: nounwind
define zeroext i1 @_Z14rasterization111Triangle_2DPhPi(%struct.Triangle_2D* byval align 1 %triangle_2d, i8* %max_min, i32* %max_index) #8 {
entry:
  %retval = alloca i1, align 1
  %max_min.addr = alloca i8*, align 8
  %max_index.addr = alloca i32*, align 8
  %agg.tmp = alloca %struct.Triangle_2D, align 1
  %agg.tmp1 = alloca %struct.Triangle_2D, align 1
  store i8* %max_min, i8** %max_min.addr, align 8
  store i32* %max_index, i32** %max_index.addr, align 8
  %0 = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, align 1
  store %struct.Triangle_2D %0, %struct.Triangle_2D* %agg.tmp, align 1
  %call = call i32 @_Z15check_clockwise11Triangle_2D(%struct.Triangle_2D* byval align 1 %agg.tmp)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i1 true, i1* %retval, align 1
  br label %return

if.end:                                           ; preds = %entry
  %1 = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, align 1
  store %struct.Triangle_2D %1, %struct.Triangle_2D* %agg.tmp1, align 1
  %call2 = call i32 @_Z15check_clockwise11Triangle_2D(%struct.Triangle_2D* byval align 1 %agg.tmp1)
  %cmp3 = icmp slt i32 %call2, 0
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  call void @_Z18clockwise_verticesP11Triangle_2D(%struct.Triangle_2D* %triangle_2d)
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0
  %2 = load i8, i8* %x0, align 1
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2
  %3 = load i8, i8* %x1, align 1
  %x2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4
  %4 = load i8, i8* %x2, align 1
  %call6 = call zeroext i8 @_Z8find_minhhh(i8 zeroext %2, i8 zeroext %3, i8 zeroext %4)
  %5 = load i8*, i8** %max_min.addr, align 8
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0
  store i8 %call6, i8* %arrayidx, align 1
  %x07 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0
  %6 = load i8, i8* %x07, align 1
  %x18 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2
  %7 = load i8, i8* %x18, align 1
  %x29 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4
  %8 = load i8, i8* %x29, align 1
  %call10 = call zeroext i8 @_Z8find_maxhhh(i8 zeroext %6, i8 zeroext %7, i8 zeroext %8)
  %9 = load i8*, i8** %max_min.addr, align 8
  %arrayidx11 = getelementptr inbounds i8, i8* %9, i64 1
  store i8 %call10, i8* %arrayidx11, align 1
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1
  %10 = load i8, i8* %y0, align 1
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3
  %11 = load i8, i8* %y1, align 1
  %y2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5
  %12 = load i8, i8* %y2, align 1
  %call12 = call zeroext i8 @_Z8find_minhhh(i8 zeroext %10, i8 zeroext %11, i8 zeroext %12)
  %13 = load i8*, i8** %max_min.addr, align 8
  %arrayidx13 = getelementptr inbounds i8, i8* %13, i64 2
  store i8 %call12, i8* %arrayidx13, align 1
  %y014 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1
  %14 = load i8, i8* %y014, align 1
  %y115 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3
  %15 = load i8, i8* %y115, align 1
  %y216 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5
  %16 = load i8, i8* %y216, align 1
  %call17 = call zeroext i8 @_Z8find_maxhhh(i8 zeroext %14, i8 zeroext %15, i8 zeroext %16)
  %17 = load i8*, i8** %max_min.addr, align 8
  %arrayidx18 = getelementptr inbounds i8, i8* %17, i64 3
  store i8 %call17, i8* %arrayidx18, align 1
  %18 = load i8*, i8** %max_min.addr, align 8
  %arrayidx19 = getelementptr inbounds i8, i8* %18, i64 1
  %19 = load i8, i8* %arrayidx19, align 1
  %conv = zext i8 %19 to i32
  %20 = load i8*, i8** %max_min.addr, align 8
  %arrayidx20 = getelementptr inbounds i8, i8* %20, i64 0
  %21 = load i8, i8* %arrayidx20, align 1
  %conv21 = zext i8 %21 to i32
  %sub = sub i32 %conv, %conv21
  %conv22 = trunc i32 %sub to i8
  %22 = load i8*, i8** %max_min.addr, align 8
  %arrayidx23 = getelementptr inbounds i8, i8* %22, i64 4
  store i8 %conv22, i8* %arrayidx23, align 1
  %23 = load i8*, i8** %max_min.addr, align 8
  %arrayidx24 = getelementptr inbounds i8, i8* %23, i64 1
  %24 = load i8, i8* %arrayidx24, align 1
  %conv25 = zext i8 %24 to i32
  %25 = load i8*, i8** %max_min.addr, align 8
  %arrayidx26 = getelementptr inbounds i8, i8* %25, i64 0
  %26 = load i8, i8* %arrayidx26, align 1
  %conv27 = zext i8 %26 to i32
  %sub28 = sub i32 %conv25, %conv27
  %27 = load i8*, i8** %max_min.addr, align 8
  %arrayidx29 = getelementptr inbounds i8, i8* %27, i64 3
  %28 = load i8, i8* %arrayidx29, align 1
  %conv30 = zext i8 %28 to i32
  %29 = load i8*, i8** %max_min.addr, align 8
  %arrayidx31 = getelementptr inbounds i8, i8* %29, i64 2
  %30 = load i8, i8* %arrayidx31, align 1
  %conv32 = zext i8 %30 to i32
  %sub33 = sub i32 %conv30, %conv32
  %mul = mul i32 %sub28, %sub33
  %31 = load i32*, i32** %max_index.addr, align 8
  %arrayidx34 = getelementptr inbounds i32, i32* %31, i64 0
  store i32 %mul, i32* %arrayidx34, align 4
  store i1 false, i1* %retval, align 1
  br label %return

return:                                           ; preds = %if.end5, %if.then
  %32 = load i1, i1* %retval, align 1
  ret i1 %32
}

; Function Attrs: nounwind
define i32 @_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel(i1 zeroext %flag, i8* %max_min, i32* %max_index, %struct.Triangle_2D* byval align 1 %triangle_2d, %struct.CandidatePixel* %fragment) #9 {
entry:
  %retval = alloca i32, align 4
  %flag.addr = alloca i1, align 1
  %max_min.addr = alloca i8*, align 8
  %max_index.addr = alloca i32*, align 8
  %fragment.addr = alloca %struct.CandidatePixel*, align 8
  %color = alloca i8, align 1
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %x = alloca i8, align 1
  %y = alloca i8, align 1
  %agg.tmp = alloca %struct.Triangle_2D, align 1
  store i1 %flag, i1* %flag.addr, align 1
  store i8* %max_min, i8** %max_min.addr, align 8
  store i32* %max_index, i32** %max_index.addr, align 8
  store %struct.CandidatePixel* %fragment, %struct.CandidatePixel** %fragment.addr, align 8
  %0 = load i1, i1* %flag.addr, align 1
  br i1 %0, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %color) #13
  store i8 100, i8* %color, align 1
  %1 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #13
  store i32 0, i32* %i, align 4
  br label %RAST2

RAST2:                                            ; preds = %if.end
  %2 = bitcast i32* %k to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #13
  store i32 0, i32* %k, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %RAST2
  %3 = load i32, i32* %k, align 4
  %4 = load i32*, i32** %max_index.addr, align 8
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0
  %5 = load i32, i32* %arrayidx, align 4
  %cmp = icmp slt i32 %3, %5
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  %6 = bitcast i32* %k to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #13
  br label %for.end

for.body:                                         ; preds = %for.cond
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %x) #13
  %7 = load i8*, i8** %max_min.addr, align 8
  %arrayidx1 = getelementptr inbounds i8, i8* %7, i64 0
  %8 = load i8, i8* %arrayidx1, align 1
  %conv = zext i8 %8 to i32
  %9 = load i32, i32* %k, align 4
  %10 = load i8*, i8** %max_min.addr, align 8
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 4
  %11 = load i8, i8* %arrayidx2, align 1
  %conv3 = zext i8 %11 to i32
  %rem = srem i32 %9, %conv3
  %add = add i32 %conv, %rem
  %conv4 = trunc i32 %add to i8
  store i8 %conv4, i8* %x, align 1
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %y) #13
  %12 = load i8*, i8** %max_min.addr, align 8
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 2
  %13 = load i8, i8* %arrayidx5, align 1
  %conv6 = zext i8 %13 to i32
  %14 = load i32, i32* %k, align 4
  %15 = load i8*, i8** %max_min.addr, align 8
  %arrayidx7 = getelementptr inbounds i8, i8* %15, i64 4
  %16 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %16 to i32
  %div = sdiv i32 %14, %conv8
  %add9 = add i32 %conv6, %div
  %conv10 = trunc i32 %add9 to i8
  store i8 %conv10, i8* %y, align 1
  %17 = load i8, i8* %x, align 1
  %18 = load i8, i8* %y, align 1
  %19 = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, align 1
  store %struct.Triangle_2D %19, %struct.Triangle_2D* %agg.tmp, align 1
  %call = call zeroext i1 @_Z17pixel_in_trianglehh11Triangle_2D(i8 zeroext %17, i8 zeroext %18, %struct.Triangle_2D* byval align 1 %agg.tmp)
  br i1 %call, label %if.then11, label %if.end23

if.then11:                                        ; preds = %for.body
  %20 = load i8, i8* %x, align 1
  %21 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragment.addr, align 8
  %22 = load i32, i32* %i, align 4
  %idxprom = sext i32 %22 to i64
  %arrayidx12 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %21, i64 %idxprom
  %x13 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx12, i32 0, i32 0
  store i8 %20, i8* %x13, align 1
  %23 = load i8, i8* %y, align 1
  %24 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragment.addr, align 8
  %25 = load i32, i32* %i, align 4
  %idxprom14 = sext i32 %25 to i64
  %arrayidx15 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %24, i64 %idxprom14
  %y16 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx15, i32 0, i32 1
  store i8 %23, i8* %y16, align 1
  %z = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 6
  %26 = load i8, i8* %z, align 1
  %27 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragment.addr, align 8
  %28 = load i32, i32* %i, align 4
  %idxprom17 = sext i32 %28 to i64
  %arrayidx18 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %27, i64 %idxprom17
  %z19 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx18, i32 0, i32 2
  store i8 %26, i8* %z19, align 1
  %29 = load i8, i8* %color, align 1
  %30 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragment.addr, align 8
  %31 = load i32, i32* %i, align 4
  %idxprom20 = sext i32 %31 to i64
  %arrayidx21 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %30, i64 %idxprom20
  %color22 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx21, i32 0, i32 3
  store i8 %29, i8* %color22, align 1
  %32 = load i32, i32* %i, align 4
  %inc = add i32 %32, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then11, %for.body
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %y) #13
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %x) #13
  br label %for.inc

for.inc:                                          ; preds = %if.end23
  %33 = load i32, i32* %k, align 4
  %inc24 = add i32 %33, 1
  store i32 %inc24, i32* %k, align 4
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond.cleanup
  %34 = load i32, i32* %i, align 4
  store i32 %34, i32* %retval, align 4
  %35 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %35) #13
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %color) #13
  br label %return

return:                                           ; preds = %for.end, %if.then
  %36 = load i32, i32* %retval, align 4
  ret i32 %36
}

; Function Attrs: nounwind
define i32 @_Z8zcullingiP14CandidatePixeliP5Pixel(i32 %counter, %struct.CandidatePixel* %fragments, i32 %size, %struct.Pixel* %pixels) #10 {
entry:
  %counter.addr = alloca i32, align 4
  %fragments.addr = alloca %struct.CandidatePixel*, align 8
  %size.addr = alloca i32, align 4
  %pixels.addr = alloca %struct.Pixel*, align 8
  %i = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  %j = alloca i32, align 4
  %pixel_cntr = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %counter, i32* %counter.addr, align 4
  store %struct.CandidatePixel* %fragments, %struct.CandidatePixel** %fragments.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  store %struct.Pixel* %pixels, %struct.Pixel** %pixels.addr, align 8
  %0 = load i32, i32* %counter.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %ZCULLING_INIT_ROW

ZCULLING_INIT_ROW:                                ; preds = %if.then
  %1 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #13
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %ZCULLING_INIT_ROW
  %2 = load i32, i32* %i, align 4
  %cmp1 = icmp slt i32 %2, 256
  br i1 %cmp1, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 3, i32* %cleanup.dest.slot, align 4
  %3 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %3) #13
  br label %for.end10

for.body:                                         ; preds = %for.cond
  br label %ZCULLING_INIT_COL

ZCULLING_INIT_COL:                                ; preds = %for.body
  %4 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #13
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %ZCULLING_INIT_COL
  %5 = load i32, i32* %j, align 4
  %cmp3 = icmp slt i32 %5, 256
  br i1 %cmp3, label %for.body5, label %for.cond.cleanup4

for.cond.cleanup4:                                ; preds = %for.cond2
  store i32 7, i32* %cleanup.dest.slot, align 4
  %6 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #13
  br label %for.end

for.body5:                                        ; preds = %for.cond2
  %7 = load i32, i32* %i, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom
  %8 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %8 to i64
  %arrayidx7 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx, i64 0, i64 %idxprom6
  store i8 -1, i8* %arrayidx7, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body5
  %9 = load i32, i32* %j, align 4
  %inc = add i32 %9, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond2, !llvm.loop !6

for.end:                                          ; preds = %for.cond.cleanup4
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %10 = load i32, i32* %i, align 4
  %inc9 = add i32 %10, 1
  store i32 %inc9, i32* %i, align 4
  br label %for.cond, !llvm.loop !8

for.end10:                                        ; preds = %for.cond.cleanup
  br label %if.end

if.end:                                           ; preds = %for.end10, %entry
  %11 = bitcast i32* %pixel_cntr to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #13
  store i32 0, i32* %pixel_cntr, align 4
  br label %ZCULLING

ZCULLING:                                         ; preds = %if.end
  %12 = bitcast i32* %n to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #13
  store i32 0, i32* %n, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc60, %ZCULLING
  %13 = load i32, i32* %n, align 4
  %14 = load i32, i32* %size.addr, align 4
  %cmp12 = icmp slt i32 %13, %14
  br i1 %cmp12, label %for.body14, label %for.cond.cleanup13

for.cond.cleanup13:                               ; preds = %for.cond11
  store i32 11, i32* %cleanup.dest.slot, align 4
  %15 = bitcast i32* %n to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #13
  br label %for.end62

for.body14:                                       ; preds = %for.cond11
  %16 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8
  %17 = load i32, i32* %n, align 4
  %idxprom15 = sext i32 %17 to i64
  %arrayidx16 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %16, i64 %idxprom15
  %z = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx16, i32 0, i32 2
  %18 = load i8, i8* %z, align 1
  %conv = zext i8 %18 to i32
  %19 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8
  %20 = load i32, i32* %n, align 4
  %idxprom17 = sext i32 %20 to i64
  %arrayidx18 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %19, i64 %idxprom17
  %y = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx18, i32 0, i32 1
  %21 = load i8, i8* %y, align 1
  %idxprom19 = zext i8 %21 to i64
  %arrayidx20 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom19
  %22 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8
  %23 = load i32, i32* %n, align 4
  %idxprom21 = sext i32 %23 to i64
  %arrayidx22 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %22, i64 %idxprom21
  %x = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx22, i32 0, i32 0
  %24 = load i8, i8* %x, align 1
  %idxprom23 = zext i8 %24 to i64
  %arrayidx24 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx20, i64 0, i64 %idxprom23
  %25 = load i8, i8* %arrayidx24, align 1
  %conv25 = zext i8 %25 to i32
  %cmp26 = icmp slt i32 %conv, %conv25
  br i1 %cmp26, label %if.then27, label %if.end59

if.then27:                                        ; preds = %for.body14
  %26 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8
  %27 = load i32, i32* %n, align 4
  %idxprom28 = sext i32 %27 to i64
  %arrayidx29 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %26, i64 %idxprom28
  %x30 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx29, i32 0, i32 0
  %28 = load i8, i8* %x30, align 1
  %29 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8
  %30 = load i32, i32* %pixel_cntr, align 4
  %idxprom31 = sext i32 %30 to i64
  %arrayidx32 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %29, i64 %idxprom31
  %x33 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx32, i32 0, i32 0
  store i8 %28, i8* %x33, align 1
  %31 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8
  %32 = load i32, i32* %n, align 4
  %idxprom34 = sext i32 %32 to i64
  %arrayidx35 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %31, i64 %idxprom34
  %y36 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx35, i32 0, i32 1
  %33 = load i8, i8* %y36, align 1
  %34 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8
  %35 = load i32, i32* %pixel_cntr, align 4
  %idxprom37 = sext i32 %35 to i64
  %arrayidx38 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %34, i64 %idxprom37
  %y39 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx38, i32 0, i32 1
  store i8 %33, i8* %y39, align 1
  %36 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8
  %37 = load i32, i32* %n, align 4
  %idxprom40 = sext i32 %37 to i64
  %arrayidx41 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %36, i64 %idxprom40
  %color = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx41, i32 0, i32 3
  %38 = load i8, i8* %color, align 1
  %39 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8
  %40 = load i32, i32* %pixel_cntr, align 4
  %idxprom42 = sext i32 %40 to i64
  %arrayidx43 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %39, i64 %idxprom42
  %color44 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx43, i32 0, i32 2
  store i8 %38, i8* %color44, align 1
  %41 = load i32, i32* %pixel_cntr, align 4
  %inc45 = add i32 %41, 1
  store i32 %inc45, i32* %pixel_cntr, align 4
  %42 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8
  %43 = load i32, i32* %n, align 4
  %idxprom46 = sext i32 %43 to i64
  %arrayidx47 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %42, i64 %idxprom46
  %z48 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx47, i32 0, i32 2
  %44 = load i8, i8* %z48, align 1
  %45 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8
  %46 = load i32, i32* %n, align 4
  %idxprom49 = sext i32 %46 to i64
  %arrayidx50 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %45, i64 %idxprom49
  %y51 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx50, i32 0, i32 1
  %47 = load i8, i8* %y51, align 1
  %idxprom52 = zext i8 %47 to i64
  %arrayidx53 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom52
  %48 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8
  %49 = load i32, i32* %n, align 4
  %idxprom54 = sext i32 %49 to i64
  %arrayidx55 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %48, i64 %idxprom54
  %x56 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx55, i32 0, i32 0
  %50 = load i8, i8* %x56, align 1
  %idxprom57 = zext i8 %50 to i64
  %arrayidx58 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx53, i64 0, i64 %idxprom57
  store i8 %44, i8* %arrayidx58, align 1
  br label %if.end59

if.end59:                                         ; preds = %if.then27, %for.body14
  br label %for.inc60

for.inc60:                                        ; preds = %if.end59
  %51 = load i32, i32* %n, align 4
  %inc61 = add i32 %51, 1
  store i32 %inc61, i32* %n, align 4
  br label %for.cond11, !llvm.loop !10

for.end62:                                        ; preds = %for.cond.cleanup13
  %52 = load i32, i32* %pixel_cntr, align 4
  store i32 1, i32* %cleanup.dest.slot, align 4
  %53 = bitcast i32* %pixel_cntr to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %53) #13
  ret i32 %52
}

; Function Attrs: nounwind
define void @_Z10coloringFBiiP5PixelPA256_h(i32 %counter, i32 %size_pixels, %struct.Pixel* %pixels, [256 x i8]* "fpga.decayed.dim.hint"="256" %frame_buffer) #11 {
entry:
  %counter.addr = alloca i32, align 4
  %size_pixels.addr = alloca i32, align 4
  %pixels.addr = alloca %struct.Pixel*, align 8
  %frame_buffer.addr = alloca [256 x i8]*, align 8
  %i = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  %j = alloca i32, align 4
  %i11 = alloca i32, align 4
  store i32 %counter, i32* %counter.addr, align 4
  store i32 %size_pixels, i32* %size_pixels.addr, align 4
  store %struct.Pixel* %pixels, %struct.Pixel** %pixels.addr, align 8
  store [256 x i8]* %frame_buffer, [256 x i8]** %frame_buffer.addr, align 8
  %0 = load i32, i32* %counter.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %COLORING_FB_INIT_ROW

COLORING_FB_INIT_ROW:                             ; preds = %if.then
  %1 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #13
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %COLORING_FB_INIT_ROW
  %2 = load i32, i32* %i, align 4
  %cmp1 = icmp slt i32 %2, 256
  br i1 %cmp1, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 3, i32* %cleanup.dest.slot, align 4
  %3 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %3) #13
  br label %for.end10

for.body:                                         ; preds = %for.cond
  br label %COLORING_FB_INIT_COL

COLORING_FB_INIT_COL:                             ; preds = %for.body
  %4 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #13
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %COLORING_FB_INIT_COL
  %5 = load i32, i32* %j, align 4
  %cmp3 = icmp slt i32 %5, 256
  br i1 %cmp3, label %for.body5, label %for.cond.cleanup4

for.cond.cleanup4:                                ; preds = %for.cond2
  store i32 7, i32* %cleanup.dest.slot, align 4
  %6 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #13
  br label %for.end

for.body5:                                        ; preds = %for.cond2
  %7 = load [256 x i8]*, [256 x i8]** %frame_buffer.addr, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* %7, i64 %idxprom
  %9 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %9 to i64
  %arrayidx7 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx, i64 0, i64 %idxprom6
  store i8 0, i8* %arrayidx7, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body5
  %10 = load i32, i32* %j, align 4
  %inc = add i32 %10, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond2, !llvm.loop !12

for.end:                                          ; preds = %for.cond.cleanup4
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %11 = load i32, i32* %i, align 4
  %inc9 = add i32 %11, 1
  store i32 %inc9, i32* %i, align 4
  br label %for.cond, !llvm.loop !14

for.end10:                                        ; preds = %for.cond.cleanup
  br label %if.end

if.end:                                           ; preds = %for.end10, %entry
  br label %COLORING_FB

COLORING_FB:                                      ; preds = %if.end
  %12 = bitcast i32* %i11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #13
  store i32 0, i32* %i11, align 4
  br label %for.cond12

for.cond12:                                       ; preds = %for.inc26, %COLORING_FB
  %13 = load i32, i32* %i11, align 4
  %14 = load i32, i32* %size_pixels.addr, align 4
  %cmp13 = icmp slt i32 %13, %14
  br i1 %cmp13, label %for.body15, label %for.cond.cleanup14

for.cond.cleanup14:                               ; preds = %for.cond12
  store i32 11, i32* %cleanup.dest.slot, align 4
  %15 = bitcast i32* %i11 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #13
  br label %for.end28

for.body15:                                       ; preds = %for.cond12
  %16 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8
  %17 = load i32, i32* %i11, align 4
  %idxprom16 = sext i32 %17 to i64
  %arrayidx17 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %16, i64 %idxprom16
  %color = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx17, i32 0, i32 2
  %18 = load i8, i8* %color, align 1
  %19 = load [256 x i8]*, [256 x i8]** %frame_buffer.addr, align 8
  %20 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8
  %21 = load i32, i32* %i11, align 4
  %idxprom18 = sext i32 %21 to i64
  %arrayidx19 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %20, i64 %idxprom18
  %x = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx19, i32 0, i32 0
  %22 = load i8, i8* %x, align 1
  %idxprom20 = zext i8 %22 to i64
  %arrayidx21 = getelementptr inbounds [256 x i8], [256 x i8]* %19, i64 %idxprom20
  %23 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8
  %24 = load i32, i32* %i11, align 4
  %idxprom22 = sext i32 %24 to i64
  %arrayidx23 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %23, i64 %idxprom22
  %y = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx23, i32 0, i32 1
  %25 = load i8, i8* %y, align 1
  %idxprom24 = zext i8 %25 to i64
  %arrayidx25 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx21, i64 0, i64 %idxprom24
  store i8 %18, i8* %arrayidx25, align 1
  br label %for.inc26

for.inc26:                                        ; preds = %for.body15
  %26 = load i32, i32* %i11, align 4
  %inc27 = add i32 %26, 1
  store i32 %inc27, i32* %i11, align 4
  br label %for.cond12, !llvm.loop !16

for.end28:                                        ; preds = %for.cond.cleanup14
  ret void
}

; Function Attrs: nounwind
define void @_Z9renderingP11Triangle_3DPA256_hi(%struct.Triangle_3D* %triangle_3ds, [256 x i8]* "fpga.decayed.dim.hint"="256" %output, i32 %num_3d_tri) #12 !fpga.function.pragma !18 {
entry:
  %triangle_3ds.addr = alloca %struct.Triangle_3D*, align 8
  %output.addr = alloca [256 x i8]*, align 8
  %num_3d_tri.addr = alloca i32, align 4
  %triangle_2ds = alloca %struct.Triangle_2D, align 1
  %angle = alloca i32, align 4
  %max_min = alloca [5 x i8], align 1
  %max_index = alloca [1 x i32], align 4
  %fragment = alloca [500 x %struct.CandidatePixel], align 1
  %pixels = alloca [500 x %struct.Pixel], align 1
  %i = alloca i32, align 4
  %agg.tmp = alloca %struct.Triangle_3D, align 1
  %flag = alloca i1, align 1
  %agg.tmp1 = alloca %struct.Triangle_2D, align 1
  %size_fragment = alloca i32, align 4
  %agg.tmp5 = alloca %struct.Triangle_2D, align 1
  %size_pixels = alloca i32, align 4
  store %struct.Triangle_3D* %triangle_3ds, %struct.Triangle_3D** %triangle_3ds.addr, align 8
  store [256 x i8]* %output, [256 x i8]** %output.addr, align 8
  store i32 %num_3d_tri, i32* %num_3d_tri.addr, align 4
  %0 = bitcast %struct.Triangle_2D* %triangle_2ds to i8*
  call void @llvm.lifetime.start.p0i8(i64 7, i8* %0) #13
  %1 = bitcast i32* %angle to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #13
  store i32 0, i32* %angle, align 4
  %2 = bitcast [5 x i8]* %max_min to i8*
  call void @llvm.lifetime.start.p0i8(i64 5, i8* %2) #13
  %3 = bitcast [1 x i32]* %max_index to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #13
  %4 = bitcast [500 x %struct.CandidatePixel]* %fragment to i8*
  call void @llvm.lifetime.start.p0i8(i64 2000, i8* %4) #13
  %5 = bitcast [500 x %struct.Pixel]* %pixels to i8*
  call void @llvm.lifetime.start.p0i8(i64 1500, i8* %5) #13
  br label %TRIANGLES

TRIANGLES:                                        ; preds = %entry
  %6 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #13
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %TRIANGLES
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %num_3d_tri.addr, align 4
  %cmp = icmp slt i32 %7, %8
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  %9 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #13
  br label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load %struct.Triangle_3D*, %struct.Triangle_3D** %triangle_3ds.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom = sext i32 %11 to i64
  %arrayidx = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %10, i64 %idxprom
  %12 = load %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx, align 1
  store %struct.Triangle_3D %12, %struct.Triangle_3D* %agg.tmp, align 1
  %13 = load i32, i32* %angle, align 4
  call void @_Z10projection11Triangle_3DP11Triangle_2Di(%struct.Triangle_3D* byval align 1 %agg.tmp, %struct.Triangle_2D* %triangle_2ds, i32 %13)
  %14 = bitcast i1* %flag to i8*
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %14) #13
  %15 = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2ds, align 1
  store %struct.Triangle_2D %15, %struct.Triangle_2D* %agg.tmp1, align 1
  %arraydecay = getelementptr inbounds [5 x i8], [5 x i8]* %max_min, i32 0, i32 0
  %arraydecay2 = getelementptr inbounds [1 x i32], [1 x i32]* %max_index, i32 0, i32 0
  %call = call zeroext i1 @_Z14rasterization111Triangle_2DPhPi(%struct.Triangle_2D* byval align 1 %agg.tmp1, i8* %arraydecay, i32* %arraydecay2)
  store i1 %call, i1* %flag, align 1
  %16 = bitcast i32* %size_fragment to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %16) #13
  %17 = load i1, i1* %flag, align 1
  %arraydecay3 = getelementptr inbounds [5 x i8], [5 x i8]* %max_min, i32 0, i32 0
  %arraydecay4 = getelementptr inbounds [1 x i32], [1 x i32]* %max_index, i32 0, i32 0
  %18 = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2ds, align 1
  store %struct.Triangle_2D %18, %struct.Triangle_2D* %agg.tmp5, align 1
  %arraydecay6 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i32 0, i32 0
  %call7 = call i32 @_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel(i1 zeroext %17, i8* %arraydecay3, i32* %arraydecay4, %struct.Triangle_2D* byval align 1 %agg.tmp5, %struct.CandidatePixel* %arraydecay6)
  store i32 %call7, i32* %size_fragment, align 4
  %19 = bitcast i32* %size_pixels to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %19) #13
  %20 = load i32, i32* %i, align 4
  %arraydecay8 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i32 0, i32 0
  %21 = load i32, i32* %size_fragment, align 4
  %arraydecay9 = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i32 0, i32 0
  %call10 = call i32 @_Z8zcullingiP14CandidatePixeliP5Pixel(i32 %20, %struct.CandidatePixel* %arraydecay8, i32 %21, %struct.Pixel* %arraydecay9)
  store i32 %call10, i32* %size_pixels, align 4
  %22 = load i32, i32* %i, align 4
  %23 = load i32, i32* %size_pixels, align 4
  %arraydecay11 = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i32 0, i32 0
  %24 = load [256 x i8]*, [256 x i8]** %output.addr, align 8
  call void @_Z10coloringFBiiP5PixelPA256_h(i32 %22, i32 %23, %struct.Pixel* %arraydecay11, [256 x i8]* %24)
  %25 = bitcast i32* %size_pixels to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %25) #13
  %26 = bitcast i32* %size_fragment to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %26) #13
  %27 = bitcast i1* %flag to i8*
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %27) #13
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %28 = load i32, i32* %i, align 4
  %inc = add i32 %28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !20

for.end:                                          ; preds = %for.cond.cleanup
  %29 = bitcast [500 x %struct.Pixel]* %pixels to i8*
  call void @llvm.lifetime.end.p0i8(i64 1500, i8* %29) #13
  %30 = bitcast [500 x %struct.CandidatePixel]* %fragment to i8*
  call void @llvm.lifetime.end.p0i8(i64 2000, i8* %30) #13
  %31 = bitcast [1 x i32]* %max_index to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %31) #13
  %32 = bitcast [5 x i8]* %max_min to i8*
  call void @llvm.lifetime.end.p0i8(i64 5, i8* %32) #13
  %33 = bitcast i32* %angle to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %33) #13
  %34 = bitcast %struct.Triangle_2D* %triangle_2ds to i8*
  call void @llvm.lifetime.end.p0i8(i64 7, i8* %34) #13
  ret void
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="check_clockwise" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="clockwise_vertices" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="pixel_in_triangle" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="find_min" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="find_max" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="projection" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="rasterization1" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="rasterization2" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="zculling" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="coloringFB" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="rendering" "fpga.top.func"="rendering" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.name", !"RAST2"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.name", !"ZCULLING_INIT_COL"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.name", !"ZCULLING_INIT_ROW"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.name", !"ZCULLING"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.name", !"COLORING_FB_INIT_COL"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.name", !"COLORING_FB_INIT_ROW"}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.name", !"COLORING_FB"}
!18 = !{!19}
!19 = !{!"fpga.top", !"user"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.name", !"TRIANGLES"}
