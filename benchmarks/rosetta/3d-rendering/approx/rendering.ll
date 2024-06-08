; ModuleID = '<stdin>'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Triangle_2D = type { i8, i8, i8, i8, i8, i8, i8 }
%struct.Triangle_3D = type { i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.CandidatePixel = type { i8, i8, i8, i8 }
%struct.Pixel = type { i8, i8, i8 }

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer
@_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer = internal global [256 x [256 x i8]] zeroinitializer, align 1, !dbg !0

; Function Attrs: nounwind
define i32 @_Z15check_clockwise11Triangle_2D(%struct.Triangle_2D* byval align 1 %triangle_2d) #0 !dbg !41 {
entry:
  %cw = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D* %triangle_2d, metadata !54, metadata !DIExpression()), !dbg !55
  %0 = bitcast i32* %cw to i8*, !dbg !56
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #13, !dbg !56
  call void @llvm.dbg.declare(metadata i32* %cw, metadata !57, metadata !DIExpression()), !dbg !58
  %x2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !59
  %1 = load i8, i8* %x2, align 1, !dbg !59
  %conv = zext i8 %1 to i32, !dbg !60
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !61
  %2 = load i8, i8* %x0, align 1, !dbg !61
  %conv1 = zext i8 %2 to i32, !dbg !62
  %sub = sub i32 %conv, %conv1, !dbg !63
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !64
  %3 = load i8, i8* %y1, align 1, !dbg !64
  %conv2 = zext i8 %3 to i32, !dbg !65
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !66
  %4 = load i8, i8* %y0, align 1, !dbg !66
  %conv3 = zext i8 %4 to i32, !dbg !67
  %sub4 = sub i32 %conv2, %conv3, !dbg !68
  %mul = mul i32 %sub, %sub4, !dbg !69
  %y2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !70
  %5 = load i8, i8* %y2, align 1, !dbg !70
  %conv5 = zext i8 %5 to i32, !dbg !71
  %y06 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !72
  %6 = load i8, i8* %y06, align 1, !dbg !72
  %conv7 = zext i8 %6 to i32, !dbg !73
  %sub8 = sub i32 %conv5, %conv7, !dbg !74
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !75
  %7 = load i8, i8* %x1, align 1, !dbg !75
  %conv9 = zext i8 %7 to i32, !dbg !76
  %x010 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !77
  %8 = load i8, i8* %x010, align 1, !dbg !77
  %conv11 = zext i8 %8 to i32, !dbg !78
  %sub12 = sub i32 %conv9, %conv11, !dbg !79
  %mul13 = mul i32 %sub8, %sub12, !dbg !80
  %sub14 = sub i32 %mul, %mul13, !dbg !81
  store i32 %sub14, i32* %cw, align 4, !dbg !82
  %9 = load i32, i32* %cw, align 4, !dbg !83
  %10 = bitcast i32* %cw to i8*, !dbg !84
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #13, !dbg !84
  ret i32 %9, !dbg !85
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
define void @_Z18clockwise_verticesP11Triangle_2D(%struct.Triangle_2D* %triangle_2d) #3 !dbg !86 {
entry:
  %triangle_2d.addr = alloca %struct.Triangle_2D*, align 8
  %tmp_x = alloca i8, align 1
  %tmp_y = alloca i8, align 1
  store %struct.Triangle_2D* %triangle_2d, %struct.Triangle_2D** %triangle_2d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D** %triangle_2d.addr, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %tmp_x) #13, !dbg !92
  call void @llvm.dbg.declare(metadata i8* %tmp_x, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %tmp_y) #13, !dbg !92
  call void @llvm.dbg.declare(metadata i8* %tmp_y, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !97
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %0, i32 0, i32 0, !dbg !98
  %1 = load i8, i8* %x0, align 1, !dbg !98
  store i8 %1, i8* %tmp_x, align 1, !dbg !99
  %2 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !100
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %2, i32 0, i32 1, !dbg !101
  %3 = load i8, i8* %y0, align 1, !dbg !101
  store i8 %3, i8* %tmp_y, align 1, !dbg !102
  %4 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !103
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %4, i32 0, i32 2, !dbg !104
  %5 = load i8, i8* %x1, align 1, !dbg !104
  %6 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !105
  %x01 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %6, i32 0, i32 0, !dbg !106
  store i8 %5, i8* %x01, align 1, !dbg !107
  %7 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !108
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %7, i32 0, i32 3, !dbg !109
  %8 = load i8, i8* %y1, align 1, !dbg !109
  %9 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !110
  %y02 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %9, i32 0, i32 1, !dbg !111
  store i8 %8, i8* %y02, align 1, !dbg !112
  %10 = load i8, i8* %tmp_x, align 1, !dbg !113
  %11 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !114
  %x13 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %11, i32 0, i32 2, !dbg !115
  store i8 %10, i8* %x13, align 1, !dbg !116
  %12 = load i8, i8* %tmp_y, align 1, !dbg !117
  %13 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !118
  %y14 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %13, i32 0, i32 3, !dbg !119
  store i8 %12, i8* %y14, align 1, !dbg !120
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %tmp_y) #13, !dbg !121
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %tmp_x) #13, !dbg !121
  ret void, !dbg !121
}

; Function Attrs: nounwind
define zeroext i1 @_Z17pixel_in_trianglehh11Triangle_2D(i8 zeroext %x, i8 zeroext %y, %struct.Triangle_2D* byval align 1 %triangle_2d) #4 !dbg !122 {
entry:
  %x.addr = alloca i8, align 1
  %y.addr = alloca i8, align 1
  %pi0 = alloca i32, align 4
  %pi1 = alloca i32, align 4
  %pi2 = alloca i32, align 4
  store i8 %x, i8* %x.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %x.addr, metadata !126, metadata !DIExpression()), !dbg !127
  store i8 %y, i8* %y.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y.addr, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D* %triangle_2d, metadata !130, metadata !DIExpression()), !dbg !131
  %0 = bitcast i32* %pi0 to i8*, !dbg !132
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #13, !dbg !132
  call void @llvm.dbg.declare(metadata i32* %pi0, metadata !133, metadata !DIExpression()), !dbg !134
  %1 = bitcast i32* %pi1 to i8*, !dbg !132
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #13, !dbg !132
  call void @llvm.dbg.declare(metadata i32* %pi1, metadata !135, metadata !DIExpression()), !dbg !136
  %2 = bitcast i32* %pi2 to i8*, !dbg !132
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #13, !dbg !132
  call void @llvm.dbg.declare(metadata i32* %pi2, metadata !137, metadata !DIExpression()), !dbg !138
  %3 = load i8, i8* %x.addr, align 1, !dbg !139
  %conv = zext i8 %3 to i32, !dbg !139
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !140
  %4 = load i8, i8* %x0, align 1, !dbg !140
  %conv1 = zext i8 %4 to i32, !dbg !141
  %sub = sub i32 %conv, %conv1, !dbg !142
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !143
  %5 = load i8, i8* %y1, align 1, !dbg !143
  %conv2 = zext i8 %5 to i32, !dbg !144
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !145
  %6 = load i8, i8* %y0, align 1, !dbg !145
  %conv3 = zext i8 %6 to i32, !dbg !146
  %sub4 = sub i32 %conv2, %conv3, !dbg !147
  %mul = mul i32 %sub, %sub4, !dbg !148
  %7 = load i8, i8* %y.addr, align 1, !dbg !149
  %conv5 = zext i8 %7 to i32, !dbg !149
  %y06 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !150
  %8 = load i8, i8* %y06, align 1, !dbg !150
  %conv7 = zext i8 %8 to i32, !dbg !151
  %sub8 = sub i32 %conv5, %conv7, !dbg !152
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !153
  %9 = load i8, i8* %x1, align 1, !dbg !153
  %conv9 = zext i8 %9 to i32, !dbg !154
  %x010 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !155
  %10 = load i8, i8* %x010, align 1, !dbg !155
  %conv11 = zext i8 %10 to i32, !dbg !156
  %sub12 = sub i32 %conv9, %conv11, !dbg !157
  %mul13 = mul i32 %sub8, %sub12, !dbg !158
  %sub14 = sub i32 %mul, %mul13, !dbg !159
  store i32 %sub14, i32* %pi0, align 4, !dbg !160
  %11 = load i8, i8* %x.addr, align 1, !dbg !161
  %conv15 = zext i8 %11 to i32, !dbg !161
  %x116 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !162
  %12 = load i8, i8* %x116, align 1, !dbg !162
  %conv17 = zext i8 %12 to i32, !dbg !163
  %sub18 = sub i32 %conv15, %conv17, !dbg !164
  %y2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !165
  %13 = load i8, i8* %y2, align 1, !dbg !165
  %conv19 = zext i8 %13 to i32, !dbg !166
  %y120 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !167
  %14 = load i8, i8* %y120, align 1, !dbg !167
  %conv21 = zext i8 %14 to i32, !dbg !168
  %sub22 = sub i32 %conv19, %conv21, !dbg !169
  %mul23 = mul i32 %sub18, %sub22, !dbg !170
  %15 = load i8, i8* %y.addr, align 1, !dbg !171
  %conv24 = zext i8 %15 to i32, !dbg !171
  %y125 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !172
  %16 = load i8, i8* %y125, align 1, !dbg !172
  %conv26 = zext i8 %16 to i32, !dbg !173
  %sub27 = sub i32 %conv24, %conv26, !dbg !174
  %x2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !175
  %17 = load i8, i8* %x2, align 1, !dbg !175
  %conv28 = zext i8 %17 to i32, !dbg !176
  %x129 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !177
  %18 = load i8, i8* %x129, align 1, !dbg !177
  %conv30 = zext i8 %18 to i32, !dbg !178
  %sub31 = sub i32 %conv28, %conv30, !dbg !179
  %mul32 = mul i32 %sub27, %sub31, !dbg !180
  %sub33 = sub i32 %mul23, %mul32, !dbg !181
  store i32 %sub33, i32* %pi1, align 4, !dbg !182
  %19 = load i8, i8* %x.addr, align 1, !dbg !183
  %conv34 = zext i8 %19 to i32, !dbg !183
  %x235 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !184
  %20 = load i8, i8* %x235, align 1, !dbg !184
  %conv36 = zext i8 %20 to i32, !dbg !185
  %sub37 = sub i32 %conv34, %conv36, !dbg !186
  %y038 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !187
  %21 = load i8, i8* %y038, align 1, !dbg !187
  %conv39 = zext i8 %21 to i32, !dbg !188
  %y240 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !189
  %22 = load i8, i8* %y240, align 1, !dbg !189
  %conv41 = zext i8 %22 to i32, !dbg !190
  %sub42 = sub i32 %conv39, %conv41, !dbg !191
  %mul43 = mul i32 %sub37, %sub42, !dbg !192
  %23 = load i8, i8* %y.addr, align 1, !dbg !193
  %conv44 = zext i8 %23 to i32, !dbg !193
  %y245 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !194
  %24 = load i8, i8* %y245, align 1, !dbg !194
  %conv46 = zext i8 %24 to i32, !dbg !195
  %sub47 = sub i32 %conv44, %conv46, !dbg !196
  %x048 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !197
  %25 = load i8, i8* %x048, align 1, !dbg !197
  %conv49 = zext i8 %25 to i32, !dbg !198
  %x250 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !199
  %26 = load i8, i8* %x250, align 1, !dbg !199
  %conv51 = zext i8 %26 to i32, !dbg !200
  %sub52 = sub i32 %conv49, %conv51, !dbg !201
  %mul53 = mul i32 %sub47, %sub52, !dbg !202
  %sub54 = sub i32 %mul43, %mul53, !dbg !203
  store i32 %sub54, i32* %pi2, align 4, !dbg !204
  %27 = load i32, i32* %pi0, align 4, !dbg !205
  %cmp = icmp sge i32 %27, 0, !dbg !206
  br i1 %cmp, label %land.lhs.true, label %land.end, !dbg !207

land.lhs.true:                                    ; preds = %entry
  %28 = load i32, i32* %pi1, align 4, !dbg !208
  %cmp55 = icmp sge i32 %28, 0, !dbg !209
  br i1 %cmp55, label %land.rhs, label %land.end, !dbg !210

land.rhs:                                         ; preds = %land.lhs.true
  %29 = load i32, i32* %pi2, align 4, !dbg !211
  %cmp56 = icmp sge i32 %29, 0, !dbg !212
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %entry
  %30 = phi i1 [ false, %land.lhs.true ], [ false, %entry ], [ %cmp56, %land.rhs ]
  %31 = bitcast i32* %pi2 to i8*, !dbg !213
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %31) #13, !dbg !213
  %32 = bitcast i32* %pi1 to i8*, !dbg !213
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #13, !dbg !213
  %33 = bitcast i32* %pi0 to i8*, !dbg !213
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %33) #13, !dbg !213
  ret i1 %30, !dbg !214
}

; Function Attrs: nounwind
define zeroext i8 @_Z8find_minhhh(i8 zeroext %in0, i8 zeroext %in1, i8 zeroext %in2) #5 !dbg !215 {
entry:
  %retval = alloca i8, align 1
  %in0.addr = alloca i8, align 1
  %in1.addr = alloca i8, align 1
  %in2.addr = alloca i8, align 1
  store i8 %in0, i8* %in0.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %in0.addr, metadata !218, metadata !DIExpression()), !dbg !219
  store i8 %in1, i8* %in1.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %in1.addr, metadata !220, metadata !DIExpression()), !dbg !221
  store i8 %in2, i8* %in2.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %in2.addr, metadata !222, metadata !DIExpression()), !dbg !223
  %0 = load i8, i8* %in0.addr, align 1, !dbg !224
  %conv = zext i8 %0 to i32, !dbg !224
  %1 = load i8, i8* %in1.addr, align 1, !dbg !226
  %conv1 = zext i8 %1 to i32, !dbg !226
  %cmp = icmp slt i32 %conv, %conv1, !dbg !227
  br i1 %cmp, label %if.then, label %if.else6, !dbg !228

if.then:                                          ; preds = %entry
  %2 = load i8, i8* %in0.addr, align 1, !dbg !229
  %conv2 = zext i8 %2 to i32, !dbg !229
  %3 = load i8, i8* %in2.addr, align 1, !dbg !232
  %conv3 = zext i8 %3 to i32, !dbg !232
  %cmp4 = icmp slt i32 %conv2, %conv3, !dbg !233
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !234

if.then5:                                         ; preds = %if.then
  %4 = load i8, i8* %in0.addr, align 1, !dbg !235
  store i8 %4, i8* %retval, align 1, !dbg !236
  br label %return, !dbg !236

if.else:                                          ; preds = %if.then
  %5 = load i8, i8* %in2.addr, align 1, !dbg !237
  store i8 %5, i8* %retval, align 1, !dbg !238
  br label %return, !dbg !238

if.else6:                                         ; preds = %entry
  %6 = load i8, i8* %in1.addr, align 1, !dbg !239
  %conv7 = zext i8 %6 to i32, !dbg !239
  %7 = load i8, i8* %in2.addr, align 1, !dbg !242
  %conv8 = zext i8 %7 to i32, !dbg !242
  %cmp9 = icmp slt i32 %conv7, %conv8, !dbg !243
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !244

if.then10:                                        ; preds = %if.else6
  %8 = load i8, i8* %in1.addr, align 1, !dbg !245
  store i8 %8, i8* %retval, align 1, !dbg !246
  br label %return, !dbg !246

if.else11:                                        ; preds = %if.else6
  %9 = load i8, i8* %in2.addr, align 1, !dbg !247
  store i8 %9, i8* %retval, align 1, !dbg !248
  br label %return, !dbg !248

return:                                           ; preds = %if.else11, %if.then10, %if.else, %if.then5
  %10 = load i8, i8* %retval, align 1, !dbg !249
  ret i8 %10, !dbg !249
}

; Function Attrs: nounwind
define zeroext i8 @_Z8find_maxhhh(i8 zeroext %in0, i8 zeroext %in1, i8 zeroext %in2) #6 !dbg !250 {
entry:
  %retval = alloca i8, align 1
  %in0.addr = alloca i8, align 1
  %in1.addr = alloca i8, align 1
  %in2.addr = alloca i8, align 1
  store i8 %in0, i8* %in0.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %in0.addr, metadata !251, metadata !DIExpression()), !dbg !252
  store i8 %in1, i8* %in1.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %in1.addr, metadata !253, metadata !DIExpression()), !dbg !254
  store i8 %in2, i8* %in2.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %in2.addr, metadata !255, metadata !DIExpression()), !dbg !256
  %0 = load i8, i8* %in0.addr, align 1, !dbg !257
  %conv = zext i8 %0 to i32, !dbg !257
  %1 = load i8, i8* %in1.addr, align 1, !dbg !259
  %conv1 = zext i8 %1 to i32, !dbg !259
  %cmp = icmp sgt i32 %conv, %conv1, !dbg !260
  br i1 %cmp, label %if.then, label %if.else6, !dbg !261

if.then:                                          ; preds = %entry
  %2 = load i8, i8* %in0.addr, align 1, !dbg !262
  %conv2 = zext i8 %2 to i32, !dbg !262
  %3 = load i8, i8* %in2.addr, align 1, !dbg !265
  %conv3 = zext i8 %3 to i32, !dbg !265
  %cmp4 = icmp sgt i32 %conv2, %conv3, !dbg !266
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !267

if.then5:                                         ; preds = %if.then
  %4 = load i8, i8* %in0.addr, align 1, !dbg !268
  store i8 %4, i8* %retval, align 1, !dbg !269
  br label %return, !dbg !269

if.else:                                          ; preds = %if.then
  %5 = load i8, i8* %in2.addr, align 1, !dbg !270
  store i8 %5, i8* %retval, align 1, !dbg !271
  br label %return, !dbg !271

if.else6:                                         ; preds = %entry
  %6 = load i8, i8* %in1.addr, align 1, !dbg !272
  %conv7 = zext i8 %6 to i32, !dbg !272
  %7 = load i8, i8* %in2.addr, align 1, !dbg !275
  %conv8 = zext i8 %7 to i32, !dbg !275
  %cmp9 = icmp sgt i32 %conv7, %conv8, !dbg !276
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !277

if.then10:                                        ; preds = %if.else6
  %8 = load i8, i8* %in1.addr, align 1, !dbg !278
  store i8 %8, i8* %retval, align 1, !dbg !279
  br label %return, !dbg !279

if.else11:                                        ; preds = %if.else6
  %9 = load i8, i8* %in2.addr, align 1, !dbg !280
  store i8 %9, i8* %retval, align 1, !dbg !281
  br label %return, !dbg !281

return:                                           ; preds = %if.else11, %if.then10, %if.else, %if.then5
  %10 = load i8, i8* %retval, align 1, !dbg !282
  ret i8 %10, !dbg !282
}

; Function Attrs: nounwind
define void @_Z10projection11Triangle_3DP11Triangle_2Di(%struct.Triangle_3D* byval align 1 %triangle_3d, %struct.Triangle_2D* %triangle_2d, i32 %angle) #7 !dbg !283 {
entry:
  %triangle_2d.addr = alloca %struct.Triangle_2D*, align 8
  %angle.addr = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.Triangle_3D* %triangle_3d, metadata !298, metadata !DIExpression()), !dbg !299
  store %struct.Triangle_2D* %triangle_2d, %struct.Triangle_2D** %triangle_2d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D** %triangle_2d.addr, metadata !300, metadata !DIExpression()), !dbg !301
  store i32 %angle, i32* %angle.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %angle.addr, metadata !302, metadata !DIExpression()), !dbg !303
  %0 = load i32, i32* %angle.addr, align 4, !dbg !304
  %cmp = icmp eq i32 %0, 0, !dbg !306
  br i1 %cmp, label %if.then, label %if.else, !dbg !307

if.then:                                          ; preds = %entry
  %x0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 0, !dbg !308
  %1 = load i8, i8* %x0, align 1, !dbg !308
  %2 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !310
  %x01 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %2, i32 0, i32 0, !dbg !311
  store i8 %1, i8* %x01, align 1, !dbg !312
  %y0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 1, !dbg !313
  %3 = load i8, i8* %y0, align 1, !dbg !313
  %4 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !314
  %y02 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %4, i32 0, i32 1, !dbg !315
  store i8 %3, i8* %y02, align 1, !dbg !316
  %x1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 3, !dbg !317
  %5 = load i8, i8* %x1, align 1, !dbg !317
  %6 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !318
  %x13 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %6, i32 0, i32 2, !dbg !319
  store i8 %5, i8* %x13, align 1, !dbg !320
  %y1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 4, !dbg !321
  %7 = load i8, i8* %y1, align 1, !dbg !321
  %8 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !322
  %y14 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %8, i32 0, i32 3, !dbg !323
  store i8 %7, i8* %y14, align 1, !dbg !324
  %x2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 6, !dbg !325
  %9 = load i8, i8* %x2, align 1, !dbg !325
  %10 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !326
  %x25 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %10, i32 0, i32 4, !dbg !327
  store i8 %9, i8* %x25, align 1, !dbg !328
  %y2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 7, !dbg !329
  %11 = load i8, i8* %y2, align 1, !dbg !329
  %12 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !330
  %y26 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %12, i32 0, i32 5, !dbg !331
  store i8 %11, i8* %y26, align 1, !dbg !332
  %z0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 2, !dbg !333
  %13 = load i8, i8* %z0, align 1, !dbg !333
  %conv = zext i8 %13 to i32, !dbg !334
  %div = sdiv i32 %conv, 3, !dbg !335
  %z1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 5, !dbg !336
  %14 = load i8, i8* %z1, align 1, !dbg !336
  %conv7 = zext i8 %14 to i32, !dbg !337
  %div8 = sdiv i32 %conv7, 3, !dbg !338
  %add = add i32 %div, %div8, !dbg !339
  %z2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 8, !dbg !340
  %15 = load i8, i8* %z2, align 1, !dbg !340
  %conv9 = zext i8 %15 to i32, !dbg !341
  %div10 = sdiv i32 %conv9, 3, !dbg !342
  %add11 = add i32 %add, %div10, !dbg !343
  %conv12 = trunc i32 %add11 to i8, !dbg !334
  %16 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !344
  %z = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %16, i32 0, i32 6, !dbg !345
  store i8 %conv12, i8* %z, align 1, !dbg !346
  br label %if.end69, !dbg !347

if.else:                                          ; preds = %entry
  %17 = load i32, i32* %angle.addr, align 4, !dbg !348
  %cmp13 = icmp eq i32 %17, 1, !dbg !350
  br i1 %cmp13, label %if.then14, label %if.else40, !dbg !351

if.then14:                                        ; preds = %if.else
  %x015 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 0, !dbg !352
  %18 = load i8, i8* %x015, align 1, !dbg !352
  %19 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !354
  %x016 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %19, i32 0, i32 0, !dbg !355
  store i8 %18, i8* %x016, align 1, !dbg !356
  %z017 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 2, !dbg !357
  %20 = load i8, i8* %z017, align 1, !dbg !357
  %21 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !358
  %y018 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %21, i32 0, i32 1, !dbg !359
  store i8 %20, i8* %y018, align 1, !dbg !360
  %x119 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 3, !dbg !361
  %22 = load i8, i8* %x119, align 1, !dbg !361
  %23 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !362
  %x120 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %23, i32 0, i32 2, !dbg !363
  store i8 %22, i8* %x120, align 1, !dbg !364
  %z121 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 5, !dbg !365
  %24 = load i8, i8* %z121, align 1, !dbg !365
  %25 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !366
  %y122 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %25, i32 0, i32 3, !dbg !367
  store i8 %24, i8* %y122, align 1, !dbg !368
  %x223 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 6, !dbg !369
  %26 = load i8, i8* %x223, align 1, !dbg !369
  %27 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !370
  %x224 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %27, i32 0, i32 4, !dbg !371
  store i8 %26, i8* %x224, align 1, !dbg !372
  %z225 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 8, !dbg !373
  %28 = load i8, i8* %z225, align 1, !dbg !373
  %29 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !374
  %y226 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %29, i32 0, i32 5, !dbg !375
  store i8 %28, i8* %y226, align 1, !dbg !376
  %y027 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 1, !dbg !377
  %30 = load i8, i8* %y027, align 1, !dbg !377
  %conv28 = zext i8 %30 to i32, !dbg !378
  %div29 = sdiv i32 %conv28, 3, !dbg !379
  %y130 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 4, !dbg !380
  %31 = load i8, i8* %y130, align 1, !dbg !380
  %conv31 = zext i8 %31 to i32, !dbg !381
  %div32 = sdiv i32 %conv31, 3, !dbg !382
  %add33 = add i32 %div29, %div32, !dbg !383
  %y234 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 7, !dbg !384
  %32 = load i8, i8* %y234, align 1, !dbg !384
  %conv35 = zext i8 %32 to i32, !dbg !385
  %div36 = sdiv i32 %conv35, 3, !dbg !386
  %add37 = add i32 %add33, %div36, !dbg !387
  %conv38 = trunc i32 %add37 to i8, !dbg !378
  %33 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !388
  %z39 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %33, i32 0, i32 6, !dbg !389
  store i8 %conv38, i8* %z39, align 1, !dbg !390
  br label %if.end68, !dbg !391

if.else40:                                        ; preds = %if.else
  %34 = load i32, i32* %angle.addr, align 4, !dbg !392
  %cmp41 = icmp eq i32 %34, 2, !dbg !394
  br i1 %cmp41, label %if.then42, label %if.end, !dbg !395

if.then42:                                        ; preds = %if.else40
  %z043 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 2, !dbg !396
  %35 = load i8, i8* %z043, align 1, !dbg !396
  %36 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !398
  %x044 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %36, i32 0, i32 0, !dbg !399
  store i8 %35, i8* %x044, align 1, !dbg !400
  %y045 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 1, !dbg !401
  %37 = load i8, i8* %y045, align 1, !dbg !401
  %38 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !402
  %y046 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %38, i32 0, i32 1, !dbg !403
  store i8 %37, i8* %y046, align 1, !dbg !404
  %z147 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 5, !dbg !405
  %39 = load i8, i8* %z147, align 1, !dbg !405
  %40 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !406
  %x148 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %40, i32 0, i32 2, !dbg !407
  store i8 %39, i8* %x148, align 1, !dbg !408
  %y149 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 4, !dbg !409
  %41 = load i8, i8* %y149, align 1, !dbg !409
  %42 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !410
  %y150 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %42, i32 0, i32 3, !dbg !411
  store i8 %41, i8* %y150, align 1, !dbg !412
  %z251 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 8, !dbg !413
  %43 = load i8, i8* %z251, align 1, !dbg !413
  %44 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !414
  %x252 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %44, i32 0, i32 4, !dbg !415
  store i8 %43, i8* %x252, align 1, !dbg !416
  %y253 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 7, !dbg !417
  %45 = load i8, i8* %y253, align 1, !dbg !417
  %46 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !418
  %y254 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %46, i32 0, i32 5, !dbg !419
  store i8 %45, i8* %y254, align 1, !dbg !420
  %x055 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 0, !dbg !421
  %47 = load i8, i8* %x055, align 1, !dbg !421
  %conv56 = zext i8 %47 to i32, !dbg !422
  %div57 = sdiv i32 %conv56, 3, !dbg !423
  %x158 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 3, !dbg !424
  %48 = load i8, i8* %x158, align 1, !dbg !424
  %conv59 = zext i8 %48 to i32, !dbg !425
  %div60 = sdiv i32 %conv59, 3, !dbg !426
  %add61 = add i32 %div57, %div60, !dbg !427
  %x262 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 6, !dbg !428
  %49 = load i8, i8* %x262, align 1, !dbg !428
  %conv63 = zext i8 %49 to i32, !dbg !429
  %div64 = sdiv i32 %conv63, 3, !dbg !430
  %add65 = add i32 %add61, %div64, !dbg !431
  %conv66 = trunc i32 %add65 to i8, !dbg !422
  %50 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !432
  %z67 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %50, i32 0, i32 6, !dbg !433
  store i8 %conv66, i8* %z67, align 1, !dbg !434
  br label %if.end, !dbg !435

if.end:                                           ; preds = %if.then42, %if.else40
  br label %if.end68

if.end68:                                         ; preds = %if.end, %if.then14
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.then
  ret void, !dbg !436
}

; Function Attrs: nounwind
define zeroext i1 @_Z14rasterization111Triangle_2DPhPi(%struct.Triangle_2D* byval align 1 %triangle_2d, i8* %max_min, i32* %max_index) #8 !dbg !437 {
entry:
  %retval = alloca i1, align 1
  %max_min.addr = alloca i8*, align 8
  %max_index.addr = alloca i32*, align 8
  %agg.tmp = alloca %struct.Triangle_2D, align 1
  %agg.tmp1 = alloca %struct.Triangle_2D, align 1
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D* %triangle_2d, metadata !442, metadata !DIExpression()), !dbg !443
  store i8* %max_min, i8** %max_min.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %max_min.addr, metadata !444, metadata !DIExpression()), !dbg !445
  store i32* %max_index, i32** %max_index.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %max_index.addr, metadata !446, metadata !DIExpression()), !dbg !447
  %0 = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, align 1, !dbg !448
  store %struct.Triangle_2D %0, %struct.Triangle_2D* %agg.tmp, align 1, !dbg !448
  %call = call i32 @_Z15check_clockwise11Triangle_2D(%struct.Triangle_2D* byval align 1 %agg.tmp), !dbg !450
  %cmp = icmp eq i32 %call, 0, !dbg !451
  br i1 %cmp, label %if.then, label %if.end, !dbg !452

if.then:                                          ; preds = %entry
  store i1 true, i1* %retval, align 1, !dbg !453
  br label %return, !dbg !453

if.end:                                           ; preds = %entry
  %1 = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, align 1, !dbg !454
  store %struct.Triangle_2D %1, %struct.Triangle_2D* %agg.tmp1, align 1, !dbg !454
  %call2 = call i32 @_Z15check_clockwise11Triangle_2D(%struct.Triangle_2D* byval align 1 %agg.tmp1), !dbg !456
  %cmp3 = icmp slt i32 %call2, 0, !dbg !457
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !458

if.then4:                                         ; preds = %if.end
  call void @_Z18clockwise_verticesP11Triangle_2D(%struct.Triangle_2D* %triangle_2d), !dbg !459
  br label %if.end5, !dbg !459

if.end5:                                          ; preds = %if.then4, %if.end
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !460
  %2 = load i8, i8* %x0, align 1, !dbg !460
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !461
  %3 = load i8, i8* %x1, align 1, !dbg !461
  %x2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !462
  %4 = load i8, i8* %x2, align 1, !dbg !462
  %call6 = call zeroext i8 @_Z8find_minhhh(i8 zeroext %2, i8 zeroext %3, i8 zeroext %4), !dbg !463
  %5 = load i8*, i8** %max_min.addr, align 8, !dbg !464
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !464
  store i8 %call6, i8* %arrayidx, align 1, !dbg !465
  %x07 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !466
  %6 = load i8, i8* %x07, align 1, !dbg !466
  %x18 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !467
  %7 = load i8, i8* %x18, align 1, !dbg !467
  %x29 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !468
  %8 = load i8, i8* %x29, align 1, !dbg !468
  %call10 = call zeroext i8 @_Z8find_maxhhh(i8 zeroext %6, i8 zeroext %7, i8 zeroext %8), !dbg !469
  %9 = load i8*, i8** %max_min.addr, align 8, !dbg !470
  %arrayidx11 = getelementptr inbounds i8, i8* %9, i64 1, !dbg !470
  store i8 %call10, i8* %arrayidx11, align 1, !dbg !471
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !472
  %10 = load i8, i8* %y0, align 1, !dbg !472
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !473
  %11 = load i8, i8* %y1, align 1, !dbg !473
  %y2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !474
  %12 = load i8, i8* %y2, align 1, !dbg !474
  %call12 = call zeroext i8 @_Z8find_minhhh(i8 zeroext %10, i8 zeroext %11, i8 zeroext %12), !dbg !475
  %13 = load i8*, i8** %max_min.addr, align 8, !dbg !476
  %arrayidx13 = getelementptr inbounds i8, i8* %13, i64 2, !dbg !476
  store i8 %call12, i8* %arrayidx13, align 1, !dbg !477
  %y014 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !478
  %14 = load i8, i8* %y014, align 1, !dbg !478
  %y115 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !479
  %15 = load i8, i8* %y115, align 1, !dbg !479
  %y216 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !480
  %16 = load i8, i8* %y216, align 1, !dbg !480
  %call17 = call zeroext i8 @_Z8find_maxhhh(i8 zeroext %14, i8 zeroext %15, i8 zeroext %16), !dbg !481
  %17 = load i8*, i8** %max_min.addr, align 8, !dbg !482
  %arrayidx18 = getelementptr inbounds i8, i8* %17, i64 3, !dbg !482
  store i8 %call17, i8* %arrayidx18, align 1, !dbg !483
  %18 = load i8*, i8** %max_min.addr, align 8, !dbg !484
  %arrayidx19 = getelementptr inbounds i8, i8* %18, i64 1, !dbg !484
  %19 = load i8, i8* %arrayidx19, align 1, !dbg !484
  %conv = zext i8 %19 to i32, !dbg !484
  %20 = load i8*, i8** %max_min.addr, align 8, !dbg !485
  %arrayidx20 = getelementptr inbounds i8, i8* %20, i64 0, !dbg !485
  %21 = load i8, i8* %arrayidx20, align 1, !dbg !485
  %conv21 = zext i8 %21 to i32, !dbg !485
  %sub = sub i32 %conv, %conv21, !dbg !486
  %conv22 = trunc i32 %sub to i8, !dbg !484
  %22 = load i8*, i8** %max_min.addr, align 8, !dbg !487
  %arrayidx23 = getelementptr inbounds i8, i8* %22, i64 4, !dbg !487
  store i8 %conv22, i8* %arrayidx23, align 1, !dbg !488
  %23 = load i8*, i8** %max_min.addr, align 8, !dbg !489
  %arrayidx24 = getelementptr inbounds i8, i8* %23, i64 1, !dbg !489
  %24 = load i8, i8* %arrayidx24, align 1, !dbg !489
  %conv25 = zext i8 %24 to i32, !dbg !489
  %25 = load i8*, i8** %max_min.addr, align 8, !dbg !490
  %arrayidx26 = getelementptr inbounds i8, i8* %25, i64 0, !dbg !490
  %26 = load i8, i8* %arrayidx26, align 1, !dbg !490
  %conv27 = zext i8 %26 to i32, !dbg !490
  %sub28 = sub i32 %conv25, %conv27, !dbg !491
  %27 = load i8*, i8** %max_min.addr, align 8, !dbg !492
  %arrayidx29 = getelementptr inbounds i8, i8* %27, i64 3, !dbg !492
  %28 = load i8, i8* %arrayidx29, align 1, !dbg !492
  %conv30 = zext i8 %28 to i32, !dbg !492
  %29 = load i8*, i8** %max_min.addr, align 8, !dbg !493
  %arrayidx31 = getelementptr inbounds i8, i8* %29, i64 2, !dbg !493
  %30 = load i8, i8* %arrayidx31, align 1, !dbg !493
  %conv32 = zext i8 %30 to i32, !dbg !493
  %sub33 = sub i32 %conv30, %conv32, !dbg !494
  %mul = mul i32 %sub28, %sub33, !dbg !495
  %31 = load i32*, i32** %max_index.addr, align 8, !dbg !496
  %arrayidx34 = getelementptr inbounds i32, i32* %31, i64 0, !dbg !496
  store i32 %mul, i32* %arrayidx34, align 4, !dbg !497
  store i1 false, i1* %retval, align 1, !dbg !498
  br label %return, !dbg !498

return:                                           ; preds = %if.end5, %if.then
  %32 = load i1, i1* %retval, align 1, !dbg !499
  ret i1 %32, !dbg !499
}

; Function Attrs: nounwind
define i32 @_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel(i1 zeroext %flag, i8* %max_min, i32* %max_index, %struct.Triangle_2D* byval align 1 %triangle_2d, %struct.CandidatePixel* %fragment) #9 !dbg !500 {
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
  call void @llvm.dbg.declare(metadata i1* %flag.addr, metadata !503, metadata !DIExpression()), !dbg !504
  store i8* %max_min, i8** %max_min.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %max_min.addr, metadata !505, metadata !DIExpression()), !dbg !506
  store i32* %max_index, i32** %max_index.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %max_index.addr, metadata !507, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D* %triangle_2d, metadata !509, metadata !DIExpression()), !dbg !510
  store %struct.CandidatePixel* %fragment, %struct.CandidatePixel** %fragment.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.CandidatePixel** %fragment.addr, metadata !511, metadata !DIExpression()), !dbg !512
  %0 = load i1, i1* %flag.addr, align 1, !dbg !513
  br i1 %0, label %if.then, label %if.end, !dbg !515

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !516
  br label %return, !dbg !516

if.end:                                           ; preds = %entry
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %color) #13, !dbg !518
  call void @llvm.dbg.declare(metadata i8* %color, metadata !519, metadata !DIExpression()), !dbg !520
  store i8 100, i8* %color, align 1, !dbg !520
  %1 = bitcast i32* %i to i8*, !dbg !521
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #13, !dbg !521
  call void @llvm.dbg.declare(metadata i32* %i, metadata !522, metadata !DIExpression()), !dbg !523
  store i32 0, i32* %i, align 4, !dbg !523
  br label %RAST2, !dbg !521

RAST2:                                            ; preds = %if.end
  %2 = bitcast i32* %k to i8*, !dbg !524
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #13, !dbg !524
  call void @llvm.dbg.declare(metadata i32* %k, metadata !526, metadata !DIExpression()), !dbg !527
  store i32 0, i32* %k, align 4, !dbg !527
  br label %for.cond, !dbg !524

for.cond:                                         ; preds = %for.inc, %RAST2
  %3 = load i32, i32* %k, align 4, !dbg !528
  %4 = load i32*, i32** %max_index.addr, align 8, !dbg !530
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !530
  %5 = load i32, i32* %arrayidx, align 4, !dbg !530
  %cmp = icmp slt i32 %3, %5, !dbg !531
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !532

for.cond.cleanup:                                 ; preds = %for.cond
  %6 = bitcast i32* %k to i8*, !dbg !533
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #13, !dbg !533
  br label %for.end

for.body:                                         ; preds = %for.cond
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %x) #13, !dbg !534
  call void @llvm.dbg.declare(metadata i8* %x, metadata !536, metadata !DIExpression()), !dbg !537
  %7 = load i8*, i8** %max_min.addr, align 8, !dbg !538
  %arrayidx1 = getelementptr inbounds i8, i8* %7, i64 0, !dbg !538
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !538
  %conv = zext i8 %8 to i32, !dbg !538
  %9 = load i32, i32* %k, align 4, !dbg !539
  %10 = load i8*, i8** %max_min.addr, align 8, !dbg !540
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 4, !dbg !540
  %11 = load i8, i8* %arrayidx2, align 1, !dbg !540
  %conv3 = zext i8 %11 to i32, !dbg !540
  %rem = srem i32 %9, %conv3, !dbg !541
  %add = add i32 %conv, %rem, !dbg !542
  %conv4 = trunc i32 %add to i8, !dbg !538
  store i8 %conv4, i8* %x, align 1, !dbg !537
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %y) #13, !dbg !543
  call void @llvm.dbg.declare(metadata i8* %y, metadata !544, metadata !DIExpression()), !dbg !545
  %12 = load i8*, i8** %max_min.addr, align 8, !dbg !546
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 2, !dbg !546
  %13 = load i8, i8* %arrayidx5, align 1, !dbg !546
  %conv6 = zext i8 %13 to i32, !dbg !546
  %14 = load i32, i32* %k, align 4, !dbg !547
  %15 = load i8*, i8** %max_min.addr, align 8, !dbg !548
  %arrayidx7 = getelementptr inbounds i8, i8* %15, i64 4, !dbg !548
  %16 = load i8, i8* %arrayidx7, align 1, !dbg !548
  %conv8 = zext i8 %16 to i32, !dbg !548
  %div = sdiv i32 %14, %conv8, !dbg !549
  %add9 = add i32 %conv6, %div, !dbg !550
  %conv10 = trunc i32 %add9 to i8, !dbg !546
  store i8 %conv10, i8* %y, align 1, !dbg !545
  %17 = load i8, i8* %x, align 1, !dbg !551
  %18 = load i8, i8* %y, align 1, !dbg !553
  %19 = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, align 1, !dbg !554
  store %struct.Triangle_2D %19, %struct.Triangle_2D* %agg.tmp, align 1, !dbg !554
  %call = call zeroext i1 @_Z17pixel_in_trianglehh11Triangle_2D(i8 zeroext %17, i8 zeroext %18, %struct.Triangle_2D* byval align 1 %agg.tmp), !dbg !555
  br i1 %call, label %if.then11, label %if.end23, !dbg !556

if.then11:                                        ; preds = %for.body
  %20 = load i8, i8* %x, align 1, !dbg !557
  %21 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragment.addr, align 8, !dbg !559
  %22 = load i32, i32* %i, align 4, !dbg !560
  %idxprom = sext i32 %22 to i64, !dbg !559
  %arrayidx12 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %21, i64 %idxprom, !dbg !559
  %x13 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx12, i32 0, i32 0, !dbg !561
  store i8 %20, i8* %x13, align 1, !dbg !562
  %23 = load i8, i8* %y, align 1, !dbg !563
  %24 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragment.addr, align 8, !dbg !564
  %25 = load i32, i32* %i, align 4, !dbg !565
  %idxprom14 = sext i32 %25 to i64, !dbg !564
  %arrayidx15 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %24, i64 %idxprom14, !dbg !564
  %y16 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx15, i32 0, i32 1, !dbg !566
  store i8 %23, i8* %y16, align 1, !dbg !567
  %z = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 6, !dbg !568
  %26 = load i8, i8* %z, align 1, !dbg !568
  %27 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragment.addr, align 8, !dbg !569
  %28 = load i32, i32* %i, align 4, !dbg !570
  %idxprom17 = sext i32 %28 to i64, !dbg !569
  %arrayidx18 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %27, i64 %idxprom17, !dbg !569
  %z19 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx18, i32 0, i32 2, !dbg !571
  store i8 %26, i8* %z19, align 1, !dbg !572
  %29 = load i8, i8* %color, align 1, !dbg !573
  %30 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragment.addr, align 8, !dbg !574
  %31 = load i32, i32* %i, align 4, !dbg !575
  %idxprom20 = sext i32 %31 to i64, !dbg !574
  %arrayidx21 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %30, i64 %idxprom20, !dbg !574
  %color22 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx21, i32 0, i32 3, !dbg !576
  store i8 %29, i8* %color22, align 1, !dbg !577
  %32 = load i32, i32* %i, align 4, !dbg !578
  %inc = add i32 %32, 1, !dbg !578
  store i32 %inc, i32* %i, align 4, !dbg !578
  br label %if.end23, !dbg !579

if.end23:                                         ; preds = %if.then11, %for.body
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %y) #13, !dbg !580
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %x) #13, !dbg !580
  br label %for.inc, !dbg !581

for.inc:                                          ; preds = %if.end23
  %33 = load i32, i32* %k, align 4, !dbg !582
  %inc24 = add i32 %33, 1, !dbg !582
  store i32 %inc24, i32* %k, align 4, !dbg !582
  br label %for.cond, !dbg !533, !llvm.loop !583

for.end:                                          ; preds = %for.cond.cleanup
  %34 = load i32, i32* %i, align 4, !dbg !586
  store i32 %34, i32* %retval, align 4, !dbg !587
  %35 = bitcast i32* %i to i8*, !dbg !588
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %35) #13, !dbg !588
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %color) #13, !dbg !588
  br label %return

return:                                           ; preds = %for.end, %if.then
  %36 = load i32, i32* %retval, align 4, !dbg !588
  ret i32 %36, !dbg !588
}

; Function Attrs: nounwind
define i32 @_Z8zcullingiP14CandidatePixeliP5Pixel(i32 %counter, %struct.CandidatePixel* %fragments, i32 %size, %struct.Pixel* %pixels) #10 !dbg !2 {
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
  call void @llvm.dbg.declare(metadata i32* %counter.addr, metadata !589, metadata !DIExpression()), !dbg !590
  store %struct.CandidatePixel* %fragments, %struct.CandidatePixel** %fragments.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.CandidatePixel** %fragments.addr, metadata !591, metadata !DIExpression()), !dbg !592
  store i32 %size, i32* %size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %size.addr, metadata !593, metadata !DIExpression()), !dbg !594
  store %struct.Pixel* %pixels, %struct.Pixel** %pixels.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Pixel** %pixels.addr, metadata !595, metadata !DIExpression()), !dbg !596
  %0 = load i32, i32* %counter.addr, align 4, !dbg !597
  %cmp = icmp eq i32 %0, 0, !dbg !599
  br i1 %cmp, label %if.then, label %if.end, !dbg !600

if.then:                                          ; preds = %entry
  br label %ZCULLING_INIT_ROW, !dbg !601

ZCULLING_INIT_ROW:                                ; preds = %if.then
  %1 = bitcast i32* %i to i8*, !dbg !602
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #13, !dbg !602
  call void @llvm.dbg.declare(metadata i32* %i, metadata !605, metadata !DIExpression()), !dbg !606
  store i32 0, i32* %i, align 4, !dbg !606
  br label %for.cond, !dbg !602

for.cond:                                         ; preds = %for.inc8, %ZCULLING_INIT_ROW
  %2 = load i32, i32* %i, align 4, !dbg !607
  %cmp1 = icmp slt i32 %2, 256, !dbg !609
  br i1 %cmp1, label %for.body, label %for.cond.cleanup, !dbg !610

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 3, i32* %cleanup.dest.slot, align 4
  %3 = bitcast i32* %i to i8*, !dbg !611
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %3) #13, !dbg !611
  br label %for.end10

for.body:                                         ; preds = %for.cond
  br label %ZCULLING_INIT_COL, !dbg !612

ZCULLING_INIT_COL:                                ; preds = %for.body
  %4 = bitcast i32* %j to i8*, !dbg !613
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #13, !dbg !613
  call void @llvm.dbg.declare(metadata i32* %j, metadata !616, metadata !DIExpression()), !dbg !617
  store i32 0, i32* %j, align 4, !dbg !617
  br label %for.cond2, !dbg !613

for.cond2:                                        ; preds = %for.inc, %ZCULLING_INIT_COL
  %5 = load i32, i32* %j, align 4, !dbg !618
  %cmp3 = icmp slt i32 %5, 256, !dbg !620
  br i1 %cmp3, label %for.body5, label %for.cond.cleanup4, !dbg !621

for.cond.cleanup4:                                ; preds = %for.cond2
  store i32 7, i32* %cleanup.dest.slot, align 4
  %6 = bitcast i32* %j to i8*, !dbg !622
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #13, !dbg !622
  br label %for.end

for.body5:                                        ; preds = %for.cond2
  %7 = load i32, i32* %i, align 4, !dbg !623
  %idxprom = sext i32 %7 to i64, !dbg !625
  %arrayidx = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom, !dbg !625
  %8 = load i32, i32* %j, align 4, !dbg !626
  %idxprom6 = sext i32 %8 to i64, !dbg !625
  %arrayidx7 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx, i64 0, i64 %idxprom6, !dbg !625
  store i8 -1, i8* %arrayidx7, align 1, !dbg !627
  br label %for.inc, !dbg !628

for.inc:                                          ; preds = %for.body5
  %9 = load i32, i32* %j, align 4, !dbg !629
  %inc = add i32 %9, 1, !dbg !629
  store i32 %inc, i32* %j, align 4, !dbg !629
  br label %for.cond2, !dbg !622, !llvm.loop !630

for.end:                                          ; preds = %for.cond.cleanup4
  br label %for.inc8, !dbg !633

for.inc8:                                         ; preds = %for.end
  %10 = load i32, i32* %i, align 4, !dbg !634
  %inc9 = add i32 %10, 1, !dbg !634
  store i32 %inc9, i32* %i, align 4, !dbg !634
  br label %for.cond, !dbg !611, !llvm.loop !635

for.end10:                                        ; preds = %for.cond.cleanup
  br label %if.end, !dbg !638

if.end:                                           ; preds = %for.end10, %entry
  %11 = bitcast i32* %pixel_cntr to i8*, !dbg !639
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #13, !dbg !639
  call void @llvm.dbg.declare(metadata i32* %pixel_cntr, metadata !640, metadata !DIExpression()), !dbg !641
  store i32 0, i32* %pixel_cntr, align 4, !dbg !641
  br label %ZCULLING, !dbg !639

ZCULLING:                                         ; preds = %if.end
  %12 = bitcast i32* %n to i8*, !dbg !642
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #13, !dbg !642
  call void @llvm.dbg.declare(metadata i32* %n, metadata !644, metadata !DIExpression()), !dbg !645
  store i32 0, i32* %n, align 4, !dbg !645
  br label %for.cond11, !dbg !642

for.cond11:                                       ; preds = %for.inc60, %ZCULLING
  %13 = load i32, i32* %n, align 4, !dbg !646
  %14 = load i32, i32* %size.addr, align 4, !dbg !648
  %cmp12 = icmp slt i32 %13, %14, !dbg !649
  br i1 %cmp12, label %for.body14, label %for.cond.cleanup13, !dbg !650

for.cond.cleanup13:                               ; preds = %for.cond11
  store i32 11, i32* %cleanup.dest.slot, align 4
  %15 = bitcast i32* %n to i8*, !dbg !651
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #13, !dbg !651
  br label %for.end62

for.body14:                                       ; preds = %for.cond11
  %16 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !652
  %17 = load i32, i32* %n, align 4, !dbg !655
  %idxprom15 = sext i32 %17 to i64, !dbg !652
  %arrayidx16 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %16, i64 %idxprom15, !dbg !652
  %z = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx16, i32 0, i32 2, !dbg !656
  %18 = load i8, i8* %z, align 1, !dbg !656
  %conv = zext i8 %18 to i32, !dbg !652
  %19 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !657
  %20 = load i32, i32* %n, align 4, !dbg !658
  %idxprom17 = sext i32 %20 to i64, !dbg !657
  %arrayidx18 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %19, i64 %idxprom17, !dbg !657
  %y = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx18, i32 0, i32 1, !dbg !659
  %21 = load i8, i8* %y, align 1, !dbg !659
  %idxprom19 = zext i8 %21 to i64, !dbg !660
  %arrayidx20 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom19, !dbg !660
  %22 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !661
  %23 = load i32, i32* %n, align 4, !dbg !662
  %idxprom21 = sext i32 %23 to i64, !dbg !661
  %arrayidx22 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %22, i64 %idxprom21, !dbg !661
  %x = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx22, i32 0, i32 0, !dbg !663
  %24 = load i8, i8* %x, align 1, !dbg !663
  %idxprom23 = zext i8 %24 to i64, !dbg !660
  %arrayidx24 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx20, i64 0, i64 %idxprom23, !dbg !660
  %25 = load i8, i8* %arrayidx24, align 1, !dbg !660
  %conv25 = zext i8 %25 to i32, !dbg !660
  %cmp26 = icmp slt i32 %conv, %conv25, !dbg !664
  br i1 %cmp26, label %if.then27, label %if.end59, !dbg !665

if.then27:                                        ; preds = %for.body14
  %26 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !666
  %27 = load i32, i32* %n, align 4, !dbg !668
  %idxprom28 = sext i32 %27 to i64, !dbg !666
  %arrayidx29 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %26, i64 %idxprom28, !dbg !666
  %x30 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx29, i32 0, i32 0, !dbg !669
  %28 = load i8, i8* %x30, align 1, !dbg !669
  %29 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8, !dbg !670
  %30 = load i32, i32* %pixel_cntr, align 4, !dbg !671
  %idxprom31 = sext i32 %30 to i64, !dbg !670
  %arrayidx32 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %29, i64 %idxprom31, !dbg !670
  %x33 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx32, i32 0, i32 0, !dbg !672
  store i8 %28, i8* %x33, align 1, !dbg !673
  %31 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !674
  %32 = load i32, i32* %n, align 4, !dbg !675
  %idxprom34 = sext i32 %32 to i64, !dbg !674
  %arrayidx35 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %31, i64 %idxprom34, !dbg !674
  %y36 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx35, i32 0, i32 1, !dbg !676
  %33 = load i8, i8* %y36, align 1, !dbg !676
  %34 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8, !dbg !677
  %35 = load i32, i32* %pixel_cntr, align 4, !dbg !678
  %idxprom37 = sext i32 %35 to i64, !dbg !677
  %arrayidx38 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %34, i64 %idxprom37, !dbg !677
  %y39 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx38, i32 0, i32 1, !dbg !679
  store i8 %33, i8* %y39, align 1, !dbg !680
  %36 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !681
  %37 = load i32, i32* %n, align 4, !dbg !682
  %idxprom40 = sext i32 %37 to i64, !dbg !681
  %arrayidx41 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %36, i64 %idxprom40, !dbg !681
  %color = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx41, i32 0, i32 3, !dbg !683
  %38 = load i8, i8* %color, align 1, !dbg !683
  %39 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8, !dbg !684
  %40 = load i32, i32* %pixel_cntr, align 4, !dbg !685
  %idxprom42 = sext i32 %40 to i64, !dbg !684
  %arrayidx43 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %39, i64 %idxprom42, !dbg !684
  %color44 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx43, i32 0, i32 2, !dbg !686
  store i8 %38, i8* %color44, align 1, !dbg !687
  %41 = load i32, i32* %pixel_cntr, align 4, !dbg !688
  %inc45 = add i32 %41, 1, !dbg !688
  store i32 %inc45, i32* %pixel_cntr, align 4, !dbg !688
  %42 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !689
  %43 = load i32, i32* %n, align 4, !dbg !690
  %idxprom46 = sext i32 %43 to i64, !dbg !689
  %arrayidx47 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %42, i64 %idxprom46, !dbg !689
  %z48 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx47, i32 0, i32 2, !dbg !691
  %44 = load i8, i8* %z48, align 1, !dbg !691
  %45 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !692
  %46 = load i32, i32* %n, align 4, !dbg !693
  %idxprom49 = sext i32 %46 to i64, !dbg !692
  %arrayidx50 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %45, i64 %idxprom49, !dbg !692
  %y51 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx50, i32 0, i32 1, !dbg !694
  %47 = load i8, i8* %y51, align 1, !dbg !694
  %idxprom52 = zext i8 %47 to i64, !dbg !695
  %arrayidx53 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom52, !dbg !695
  %48 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !696
  %49 = load i32, i32* %n, align 4, !dbg !697
  %idxprom54 = sext i32 %49 to i64, !dbg !696
  %arrayidx55 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %48, i64 %idxprom54, !dbg !696
  %x56 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx55, i32 0, i32 0, !dbg !698
  %50 = load i8, i8* %x56, align 1, !dbg !698
  %idxprom57 = zext i8 %50 to i64, !dbg !695
  %arrayidx58 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx53, i64 0, i64 %idxprom57, !dbg !695
  store i8 %44, i8* %arrayidx58, align 1, !dbg !699
  br label %if.end59, !dbg !700

if.end59:                                         ; preds = %if.then27, %for.body14
  br label %for.inc60, !dbg !701

for.inc60:                                        ; preds = %if.end59
  %51 = load i32, i32* %n, align 4, !dbg !702
  %inc61 = add i32 %51, 1, !dbg !702
  store i32 %inc61, i32* %n, align 4, !dbg !702
  br label %for.cond11, !dbg !651, !llvm.loop !703

for.end62:                                        ; preds = %for.cond.cleanup13
  %52 = load i32, i32* %pixel_cntr, align 4, !dbg !706
  store i32 1, i32* %cleanup.dest.slot, align 4
  %53 = bitcast i32* %pixel_cntr to i8*, !dbg !707
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %53) #13, !dbg !707
  ret i32 %52, !dbg !708
}

; Function Attrs: nounwind
define void @_Z10coloringFBiiP5PixelPA256_h(i32 %counter, i32 %size_pixels, %struct.Pixel* %pixels, [256 x i8]* "fpga.decayed.dim.hint"="256" %frame_buffer) #11 !dbg !709 {
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
  call void @llvm.dbg.declare(metadata i32* %counter.addr, metadata !715, metadata !DIExpression()), !dbg !716
  store i32 %size_pixels, i32* %size_pixels.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %size_pixels.addr, metadata !717, metadata !DIExpression()), !dbg !718
  store %struct.Pixel* %pixels, %struct.Pixel** %pixels.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Pixel** %pixels.addr, metadata !719, metadata !DIExpression()), !dbg !720
  store [256 x i8]* %frame_buffer, [256 x i8]** %frame_buffer.addr, align 8
  call void @llvm.dbg.declare(metadata [256 x i8]** %frame_buffer.addr, metadata !721, metadata !DIExpression()), !dbg !722
  %0 = load i32, i32* %counter.addr, align 4, !dbg !723
  %cmp = icmp eq i32 %0, 0, !dbg !725
  br i1 %cmp, label %if.then, label %if.end, !dbg !726

if.then:                                          ; preds = %entry
  br label %COLORING_FB_INIT_ROW, !dbg !727

COLORING_FB_INIT_ROW:                             ; preds = %if.then
  %1 = bitcast i32* %i to i8*, !dbg !728
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #13, !dbg !728
  call void @llvm.dbg.declare(metadata i32* %i, metadata !731, metadata !DIExpression()), !dbg !732
  store i32 0, i32* %i, align 4, !dbg !732
  br label %for.cond, !dbg !728

for.cond:                                         ; preds = %for.inc8, %COLORING_FB_INIT_ROW
  %2 = load i32, i32* %i, align 4, !dbg !733
  %cmp1 = icmp slt i32 %2, 256, !dbg !735
  br i1 %cmp1, label %for.body, label %for.cond.cleanup, !dbg !736

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 3, i32* %cleanup.dest.slot, align 4
  %3 = bitcast i32* %i to i8*, !dbg !737
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %3) #13, !dbg !737
  br label %for.end10

for.body:                                         ; preds = %for.cond
  br label %COLORING_FB_INIT_COL, !dbg !738

COLORING_FB_INIT_COL:                             ; preds = %for.body
  %4 = bitcast i32* %j to i8*, !dbg !739
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #13, !dbg !739
  call void @llvm.dbg.declare(metadata i32* %j, metadata !742, metadata !DIExpression()), !dbg !743
  store i32 0, i32* %j, align 4, !dbg !743
  br label %for.cond2, !dbg !739

for.cond2:                                        ; preds = %for.inc, %COLORING_FB_INIT_COL
  %5 = load i32, i32* %j, align 4, !dbg !744
  %cmp3 = icmp slt i32 %5, 256, !dbg !746
  br i1 %cmp3, label %for.body5, label %for.cond.cleanup4, !dbg !747

for.cond.cleanup4:                                ; preds = %for.cond2
  store i32 7, i32* %cleanup.dest.slot, align 4
  %6 = bitcast i32* %j to i8*, !dbg !748
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #13, !dbg !748
  br label %for.end

for.body5:                                        ; preds = %for.cond2
  %7 = load [256 x i8]*, [256 x i8]** %frame_buffer.addr, align 8, !dbg !749
  %8 = load i32, i32* %i, align 4, !dbg !750
  %idxprom = sext i32 %8 to i64, !dbg !749
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* %7, i64 %idxprom, !dbg !749
  %9 = load i32, i32* %j, align 4, !dbg !751
  %idxprom6 = sext i32 %9 to i64, !dbg !749
  %arrayidx7 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx, i64 0, i64 %idxprom6, !dbg !749
  store i8 0, i8* %arrayidx7, align 1, !dbg !752
  br label %for.inc, !dbg !749

for.inc:                                          ; preds = %for.body5
  %10 = load i32, i32* %j, align 4, !dbg !753
  %inc = add i32 %10, 1, !dbg !753
  store i32 %inc, i32* %j, align 4, !dbg !753
  br label %for.cond2, !dbg !748, !llvm.loop !754

for.end:                                          ; preds = %for.cond.cleanup4
  br label %for.inc8, !dbg !757

for.inc8:                                         ; preds = %for.end
  %11 = load i32, i32* %i, align 4, !dbg !758
  %inc9 = add i32 %11, 1, !dbg !758
  store i32 %inc9, i32* %i, align 4, !dbg !758
  br label %for.cond, !dbg !737, !llvm.loop !759

for.end10:                                        ; preds = %for.cond.cleanup
  br label %if.end, !dbg !762

if.end:                                           ; preds = %for.end10, %entry
  br label %COLORING_FB, !dbg !763

COLORING_FB:                                      ; preds = %if.end
  %12 = bitcast i32* %i11 to i8*, !dbg !764
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #13, !dbg !764
  call void @llvm.dbg.declare(metadata i32* %i11, metadata !766, metadata !DIExpression()), !dbg !767
  store i32 0, i32* %i11, align 4, !dbg !767
  br label %for.cond12, !dbg !764

for.cond12:                                       ; preds = %for.inc26, %COLORING_FB
  %13 = load i32, i32* %i11, align 4, !dbg !768
  %14 = load i32, i32* %size_pixels.addr, align 4, !dbg !770
  %cmp13 = icmp slt i32 %13, %14, !dbg !771
  br i1 %cmp13, label %for.body15, label %for.cond.cleanup14, !dbg !772

for.cond.cleanup14:                               ; preds = %for.cond12
  store i32 11, i32* %cleanup.dest.slot, align 4
  %15 = bitcast i32* %i11 to i8*, !dbg !773
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #13, !dbg !773
  br label %for.end28

for.body15:                                       ; preds = %for.cond12
  %16 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8, !dbg !774
  %17 = load i32, i32* %i11, align 4, !dbg !775
  %idxprom16 = sext i32 %17 to i64, !dbg !774
  %arrayidx17 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %16, i64 %idxprom16, !dbg !774
  %color = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx17, i32 0, i32 2, !dbg !776
  %18 = load i8, i8* %color, align 1, !dbg !776
  %19 = load [256 x i8]*, [256 x i8]** %frame_buffer.addr, align 8, !dbg !777
  %20 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8, !dbg !778
  %21 = load i32, i32* %i11, align 4, !dbg !779
  %idxprom18 = sext i32 %21 to i64, !dbg !778
  %arrayidx19 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %20, i64 %idxprom18, !dbg !778
  %x = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx19, i32 0, i32 0, !dbg !780
  %22 = load i8, i8* %x, align 1, !dbg !780
  %idxprom20 = zext i8 %22 to i64, !dbg !777
  %arrayidx21 = getelementptr inbounds [256 x i8], [256 x i8]* %19, i64 %idxprom20, !dbg !777
  %23 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8, !dbg !781
  %24 = load i32, i32* %i11, align 4, !dbg !782
  %idxprom22 = sext i32 %24 to i64, !dbg !781
  %arrayidx23 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %23, i64 %idxprom22, !dbg !781
  %y = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx23, i32 0, i32 1, !dbg !783
  %25 = load i8, i8* %y, align 1, !dbg !783
  %idxprom24 = zext i8 %25 to i64, !dbg !777
  %arrayidx25 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx21, i64 0, i64 %idxprom24, !dbg !777
  store i8 %18, i8* %arrayidx25, align 1, !dbg !784
  br label %for.inc26, !dbg !777

for.inc26:                                        ; preds = %for.body15
  %26 = load i32, i32* %i11, align 4, !dbg !785
  %inc27 = add i32 %26, 1, !dbg !785
  store i32 %inc27, i32* %i11, align 4, !dbg !785
  br label %for.cond12, !dbg !773, !llvm.loop !786

for.end28:                                        ; preds = %for.cond.cleanup14
  ret void, !dbg !789
}

; Function Attrs: nounwind
define void @_Z9renderingP11Triangle_3DPA256_hi(%struct.Triangle_3D* %triangle_3ds, [256 x i8]* "fpga.decayed.dim.hint"="256" %output, i32 %num_triangles) #12 !dbg !790 !fpga.function.pragma !794 {
entry:
  %triangle_3ds.addr = alloca %struct.Triangle_3D*, align 8
  %output.addr = alloca [256 x i8]*, align 8
  %num_triangles.addr = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata %struct.Triangle_3D** %triangle_3ds.addr, metadata !797, metadata !DIExpression()), !dbg !798
  store [256 x i8]* %output, [256 x i8]** %output.addr, align 8
  call void @llvm.dbg.declare(metadata [256 x i8]** %output.addr, metadata !799, metadata !DIExpression()), !dbg !800
  store i32 %num_triangles, i32* %num_triangles.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %num_triangles.addr, metadata !801, metadata !DIExpression()), !dbg !802
  %0 = bitcast %struct.Triangle_2D* %triangle_2ds to i8*, !dbg !803
  call void @llvm.lifetime.start.p0i8(i64 7, i8* %0) #13, !dbg !803
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D* %triangle_2ds, metadata !804, metadata !DIExpression()), !dbg !805
  %1 = bitcast i32* %angle to i8*, !dbg !806
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #13, !dbg !806
  call void @llvm.dbg.declare(metadata i32* %angle, metadata !807, metadata !DIExpression()), !dbg !808
  store i32 0, i32* %angle, align 4, !dbg !808
  %2 = bitcast [5 x i8]* %max_min to i8*, !dbg !809
  call void @llvm.lifetime.start.p0i8(i64 5, i8* %2) #13, !dbg !809
  call void @llvm.dbg.declare(metadata [5 x i8]* %max_min, metadata !810, metadata !DIExpression()), !dbg !814
  %3 = bitcast [1 x i32]* %max_index to i8*, !dbg !815
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #13, !dbg !815
  call void @llvm.dbg.declare(metadata [1 x i32]* %max_index, metadata !816, metadata !DIExpression()), !dbg !820
  %4 = bitcast [500 x %struct.CandidatePixel]* %fragment to i8*, !dbg !821
  call void @llvm.lifetime.start.p0i8(i64 2000, i8* %4) #13, !dbg !821
  call void @llvm.dbg.declare(metadata [500 x %struct.CandidatePixel]* %fragment, metadata !822, metadata !DIExpression()), !dbg !826
  %5 = bitcast [500 x %struct.Pixel]* %pixels to i8*, !dbg !827
  call void @llvm.lifetime.start.p0i8(i64 1500, i8* %5) #13, !dbg !827
  call void @llvm.dbg.declare(metadata [500 x %struct.Pixel]* %pixels, metadata !828, metadata !DIExpression()), !dbg !830
  br label %TRIANGLES, !dbg !827

TRIANGLES:                                        ; preds = %entry
  %6 = bitcast i32* %i to i8*, !dbg !831
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #13, !dbg !831
  call void @llvm.dbg.declare(metadata i32* %i, metadata !833, metadata !DIExpression()), !dbg !834
  store i32 0, i32* %i, align 4, !dbg !834
  br label %for.cond, !dbg !831

for.cond:                                         ; preds = %for.inc, %TRIANGLES
  %7 = load i32, i32* %i, align 4, !dbg !835
  %8 = load i32, i32* %num_triangles.addr, align 4, !dbg !837
  %cmp = icmp slt i32 %7, %8, !dbg !838
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !839

for.cond.cleanup:                                 ; preds = %for.cond
  %9 = bitcast i32* %i to i8*, !dbg !840
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #13, !dbg !840
  br label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load %struct.Triangle_3D*, %struct.Triangle_3D** %triangle_3ds.addr, align 8, !dbg !841
  %11 = load i32, i32* %i, align 4, !dbg !843
  %idxprom = sext i32 %11 to i64, !dbg !841
  %arrayidx = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %10, i64 %idxprom, !dbg !841
  %12 = load %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx, align 1, !dbg !841
  store %struct.Triangle_3D %12, %struct.Triangle_3D* %agg.tmp, align 1, !dbg !841
  %13 = load i32, i32* %angle, align 4, !dbg !844
  call void @_Z10projection11Triangle_3DP11Triangle_2Di(%struct.Triangle_3D* byval align 1 %agg.tmp, %struct.Triangle_2D* %triangle_2ds, i32 %13), !dbg !845
  %14 = bitcast i1* %flag to i8*, !dbg !846
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %14) #13, !dbg !846
  call void @llvm.dbg.declare(metadata i1* %flag, metadata !847, metadata !DIExpression()), !dbg !848
  %15 = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2ds, align 1, !dbg !849
  store %struct.Triangle_2D %15, %struct.Triangle_2D* %agg.tmp1, align 1, !dbg !849
  %arraydecay = getelementptr inbounds [5 x i8], [5 x i8]* %max_min, i32 0, i32 0, !dbg !850
  %arraydecay2 = getelementptr inbounds [1 x i32], [1 x i32]* %max_index, i32 0, i32 0, !dbg !851
  %call = call zeroext i1 @_Z14rasterization111Triangle_2DPhPi(%struct.Triangle_2D* byval align 1 %agg.tmp1, i8* %arraydecay, i32* %arraydecay2), !dbg !852
  store i1 %call, i1* %flag, align 1, !dbg !848
  %16 = bitcast i32* %size_fragment to i8*, !dbg !853
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %16) #13, !dbg !853
  call void @llvm.dbg.declare(metadata i32* %size_fragment, metadata !854, metadata !DIExpression()), !dbg !855
  %17 = load i1, i1* %flag, align 1, !dbg !856
  %arraydecay3 = getelementptr inbounds [5 x i8], [5 x i8]* %max_min, i32 0, i32 0, !dbg !857
  %arraydecay4 = getelementptr inbounds [1 x i32], [1 x i32]* %max_index, i32 0, i32 0, !dbg !858
  %18 = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2ds, align 1, !dbg !859
  store %struct.Triangle_2D %18, %struct.Triangle_2D* %agg.tmp5, align 1, !dbg !859
  %arraydecay6 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i32 0, i32 0, !dbg !860
  %call7 = call i32 @_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel(i1 zeroext %17, i8* %arraydecay3, i32* %arraydecay4, %struct.Triangle_2D* byval align 1 %agg.tmp5, %struct.CandidatePixel* %arraydecay6), !dbg !861
  store i32 %call7, i32* %size_fragment, align 4, !dbg !855
  %19 = bitcast i32* %size_pixels to i8*, !dbg !862
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %19) #13, !dbg !862
  call void @llvm.dbg.declare(metadata i32* %size_pixels, metadata !863, metadata !DIExpression()), !dbg !864
  %20 = load i32, i32* %i, align 4, !dbg !865
  %arraydecay8 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i32 0, i32 0, !dbg !866
  %21 = load i32, i32* %size_fragment, align 4, !dbg !867
  %arraydecay9 = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i32 0, i32 0, !dbg !868
  %call10 = call i32 @_Z8zcullingiP14CandidatePixeliP5Pixel(i32 %20, %struct.CandidatePixel* %arraydecay8, i32 %21, %struct.Pixel* %arraydecay9), !dbg !869
  store i32 %call10, i32* %size_pixels, align 4, !dbg !864
  %22 = load i32, i32* %i, align 4, !dbg !870
  %23 = load i32, i32* %size_pixels, align 4, !dbg !871
  %arraydecay11 = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i32 0, i32 0, !dbg !872
  %24 = load [256 x i8]*, [256 x i8]** %output.addr, align 8, !dbg !873
  call void @_Z10coloringFBiiP5PixelPA256_h(i32 %22, i32 %23, %struct.Pixel* %arraydecay11, [256 x i8]* %24), !dbg !874
  %25 = bitcast i32* %size_pixels to i8*, !dbg !875
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %25) #13, !dbg !875
  %26 = bitcast i32* %size_fragment to i8*, !dbg !875
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %26) #13, !dbg !875
  %27 = bitcast i1* %flag to i8*, !dbg !875
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %27) #13, !dbg !875
  br label %for.inc, !dbg !876

for.inc:                                          ; preds = %for.body
  %28 = load i32, i32* %i, align 4, !dbg !877
  %inc = add i32 %28, 1, !dbg !877
  store i32 %inc, i32* %i, align 4, !dbg !877
  br label %for.cond, !dbg !840, !llvm.loop !878

for.end:                                          ; preds = %for.cond.cleanup
  %29 = bitcast [500 x %struct.Pixel]* %pixels to i8*, !dbg !881
  call void @llvm.lifetime.end.p0i8(i64 1500, i8* %29) #13, !dbg !881
  %30 = bitcast [500 x %struct.CandidatePixel]* %fragment to i8*, !dbg !881
  call void @llvm.lifetime.end.p0i8(i64 2000, i8* %30) #13, !dbg !881
  %31 = bitcast [1 x i32]* %max_index to i8*, !dbg !881
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %31) #13, !dbg !881
  %32 = bitcast [5 x i8]* %max_min to i8*, !dbg !881
  call void @llvm.lifetime.end.p0i8(i64 5, i8* %32) #13, !dbg !881
  %33 = bitcast i32* %angle to i8*, !dbg !881
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %33) #13, !dbg !881
  %34 = bitcast %struct.Triangle_2D* %triangle_2ds to i8*, !dbg !881
  call void @llvm.lifetime.end.p0i8(i64 7, i8* %34) #13, !dbg !881
  ret void, !dbg !881
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

!llvm.dbg.cu = !{!25}
!llvm.ident = !{!37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37, !37}
!llvm.module.flags = !{!38, !39, !40}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "z_buffer", scope: !2, file: !3, line: 196, type: !34, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "zculling", linkageName: "_Z8zcullingiP14CandidatePixeliP5Pixel", scope: !3, file: !3, line: 193, type: !4, isLocal: false, isDefinition: true, scopeLine: 194, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!3 = !DIFile(filename: "benchmarks/rosetta/3d-rendering/src/rendering.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6, !7, !6, !18}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "CandidatePixel", file: !9, line: 55, baseType: !10)
!9 = !DIFile(filename: "benchmarks/rosetta/3d-rendering/src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx")
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !9, line: 49, size: 32, flags: DIFlagTypePassByValue, elements: !11, identifier: "_ZTS14CandidatePixel")
!11 = !{!12, !15, !16, !17}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !10, file: !9, line: 51, baseType: !13, size: 8)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "bit8", file: !9, line: 19, baseType: !14)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !10, file: !9, line: 52, baseType: !13, size: 8, offset: 8)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !10, file: !9, line: 53, baseType: !13, size: 8, offset: 16)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "color", scope: !10, file: !9, line: 54, baseType: !13, size: 8, offset: 24)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "Pixel", file: !9, line: 63, baseType: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !9, line: 58, size: 24, flags: DIFlagTypePassByValue, elements: !21, identifier: "_ZTS5Pixel")
!21 = !{!22, !23, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !20, file: !9, line: 60, baseType: !13, size: 8)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !20, file: !9, line: 61, baseType: !13, size: 8, offset: 8)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "color", scope: !20, file: !9, line: 62, baseType: !13, size: 8, offset: 16)
!25 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !26, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !27, globals: !28)
!26 = !DIFile(filename: "/home/gabriel/Documents/UFRGS/RAISE/Approx/raise_rendering/solution1/.autopilot/db/rendering.pp.0.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx")
!27 = !{}
!28 = !{!0, !29, !32}
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression(DW_OP_constu, 256, DW_OP_stack_value))
!30 = distinct !DIGlobalVariable(name: "MAX_X", scope: !25, file: !9, line: 13, type: !31, isLocal: true, isDefinition: true)
!31 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression(DW_OP_constu, 256, DW_OP_stack_value))
!33 = distinct !DIGlobalVariable(name: "MAX_Y", scope: !25, file: !9, line: 14, type: !31, isLocal: true, isDefinition: true)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 524288, elements: !35)
!35 = !{!36, !36}
!36 = !DISubrange(count: 256)
!37 = !{!"clang version 7.0.0 "}
!38 = !{i32 2, !"Dwarf Version", i32 4}
!39 = !{i32 2, !"Debug Info Version", i32 3}
!40 = !{i32 1, !"wchar_size", i32 4}
!41 = distinct !DISubprogram(name: "check_clockwise", linkageName: "_Z15check_clockwise11Triangle_2D", scope: !3, file: !3, line: 18, type: !42, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!42 = !DISubroutineType(types: !43)
!43 = !{!6, !44}
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "Triangle_2D", file: !9, line: 46, baseType: !45)
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !9, line: 37, size: 56, flags: DIFlagTypePassByValue, elements: !46, identifier: "_ZTS11Triangle_2D")
!46 = !{!47, !48, !49, !50, !51, !52, !53}
!47 = !DIDerivedType(tag: DW_TAG_member, name: "x0", scope: !45, file: !9, line: 39, baseType: !13, size: 8)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "y0", scope: !45, file: !9, line: 40, baseType: !13, size: 8, offset: 8)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "x1", scope: !45, file: !9, line: 41, baseType: !13, size: 8, offset: 16)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "y1", scope: !45, file: !9, line: 42, baseType: !13, size: 8, offset: 24)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "x2", scope: !45, file: !9, line: 43, baseType: !13, size: 8, offset: 32)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "y2", scope: !45, file: !9, line: 44, baseType: !13, size: 8, offset: 40)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !45, file: !9, line: 45, baseType: !13, size: 8, offset: 48)
!54 = !DILocalVariable(name: "triangle_2d", arg: 1, scope: !41, file: !3, line: 18, type: !44)
!55 = !DILocation(line: 18, column: 33, scope: !41)
!56 = !DILocation(line: 20, column: 3, scope: !41)
!57 = !DILocalVariable(name: "cw", scope: !41, file: !3, line: 20, type: !6)
!58 = !DILocation(line: 20, column: 7, scope: !41)
!59 = !DILocation(line: 22, column: 21, scope: !41)
!60 = !DILocation(line: 22, column: 9, scope: !41)
!61 = !DILocation(line: 22, column: 38, scope: !41)
!62 = !DILocation(line: 22, column: 26, scope: !41)
!63 = !DILocation(line: 22, column: 24, scope: !41)
!64 = !DILocation(line: 22, column: 57, scope: !41)
!65 = !DILocation(line: 22, column: 45, scope: !41)
!66 = !DILocation(line: 22, column: 74, scope: !41)
!67 = !DILocation(line: 22, column: 62, scope: !41)
!68 = !DILocation(line: 22, column: 60, scope: !41)
!69 = !DILocation(line: 22, column: 42, scope: !41)
!70 = !DILocation(line: 23, column: 23, scope: !41)
!71 = !DILocation(line: 23, column: 11, scope: !41)
!72 = !DILocation(line: 23, column: 40, scope: !41)
!73 = !DILocation(line: 23, column: 28, scope: !41)
!74 = !DILocation(line: 23, column: 26, scope: !41)
!75 = !DILocation(line: 23, column: 59, scope: !41)
!76 = !DILocation(line: 23, column: 47, scope: !41)
!77 = !DILocation(line: 23, column: 76, scope: !41)
!78 = !DILocation(line: 23, column: 64, scope: !41)
!79 = !DILocation(line: 23, column: 62, scope: !41)
!80 = !DILocation(line: 23, column: 44, scope: !41)
!81 = !DILocation(line: 23, column: 8, scope: !41)
!82 = !DILocation(line: 22, column: 6, scope: !41)
!83 = !DILocation(line: 25, column: 10, scope: !41)
!84 = !DILocation(line: 27, column: 1, scope: !41)
!85 = !DILocation(line: 25, column: 3, scope: !41)
!86 = distinct !DISubprogram(name: "clockwise_vertices", linkageName: "_Z18clockwise_verticesP11Triangle_2D", scope: !3, file: !3, line: 30, type: !87, isLocal: false, isDefinition: true, scopeLine: 31, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!87 = !DISubroutineType(types: !88)
!88 = !{null, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!90 = !DILocalVariable(name: "triangle_2d", arg: 1, scope: !86, file: !3, line: 30, type: !89)
!91 = !DILocation(line: 30, column: 38, scope: !86)
!92 = !DILocation(line: 32, column: 3, scope: !86)
!93 = !DILocalVariable(name: "tmp_x", scope: !86, file: !3, line: 32, type: !13)
!94 = !DILocation(line: 32, column: 8, scope: !86)
!95 = !DILocalVariable(name: "tmp_y", scope: !86, file: !3, line: 32, type: !13)
!96 = !DILocation(line: 32, column: 15, scope: !86)
!97 = !DILocation(line: 34, column: 11, scope: !86)
!98 = !DILocation(line: 34, column: 24, scope: !86)
!99 = !DILocation(line: 34, column: 9, scope: !86)
!100 = !DILocation(line: 35, column: 11, scope: !86)
!101 = !DILocation(line: 35, column: 24, scope: !86)
!102 = !DILocation(line: 35, column: 9, scope: !86)
!103 = !DILocation(line: 37, column: 21, scope: !86)
!104 = !DILocation(line: 37, column: 34, scope: !86)
!105 = !DILocation(line: 37, column: 3, scope: !86)
!106 = !DILocation(line: 37, column: 16, scope: !86)
!107 = !DILocation(line: 37, column: 19, scope: !86)
!108 = !DILocation(line: 38, column: 21, scope: !86)
!109 = !DILocation(line: 38, column: 34, scope: !86)
!110 = !DILocation(line: 38, column: 3, scope: !86)
!111 = !DILocation(line: 38, column: 16, scope: !86)
!112 = !DILocation(line: 38, column: 19, scope: !86)
!113 = !DILocation(line: 40, column: 21, scope: !86)
!114 = !DILocation(line: 40, column: 3, scope: !86)
!115 = !DILocation(line: 40, column: 16, scope: !86)
!116 = !DILocation(line: 40, column: 19, scope: !86)
!117 = !DILocation(line: 41, column: 21, scope: !86)
!118 = !DILocation(line: 41, column: 3, scope: !86)
!119 = !DILocation(line: 41, column: 16, scope: !86)
!120 = !DILocation(line: 41, column: 19, scope: !86)
!121 = !DILocation(line: 42, column: 1, scope: !86)
!122 = distinct !DISubprogram(name: "pixel_in_triangle", linkageName: "_Z17pixel_in_trianglehh11Triangle_2D", scope: !3, file: !3, line: 48, type: !123, isLocal: false, isDefinition: true, scopeLine: 49, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!123 = !DISubroutineType(types: !124)
!124 = !{!125, !13, !13, !44}
!125 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!126 = !DILocalVariable(name: "x", arg: 1, scope: !122, file: !3, line: 48, type: !13)
!127 = !DILocation(line: 48, column: 29, scope: !122)
!128 = !DILocalVariable(name: "y", arg: 2, scope: !122, file: !3, line: 48, type: !13)
!129 = !DILocation(line: 48, column: 37, scope: !122)
!130 = !DILocalVariable(name: "triangle_2d", arg: 3, scope: !122, file: !3, line: 48, type: !44)
!131 = !DILocation(line: 48, column: 52, scope: !122)
!132 = !DILocation(line: 50, column: 3, scope: !122)
!133 = !DILocalVariable(name: "pi0", scope: !122, file: !3, line: 50, type: !6)
!134 = !DILocation(line: 50, column: 7, scope: !122)
!135 = !DILocalVariable(name: "pi1", scope: !122, file: !3, line: 50, type: !6)
!136 = !DILocation(line: 50, column: 12, scope: !122)
!137 = !DILocalVariable(name: "pi2", scope: !122, file: !3, line: 50, type: !6)
!138 = !DILocation(line: 50, column: 17, scope: !122)
!139 = !DILocation(line: 52, column: 10, scope: !122)
!140 = !DILocation(line: 52, column: 26, scope: !122)
!141 = !DILocation(line: 52, column: 14, scope: !122)
!142 = !DILocation(line: 52, column: 12, scope: !122)
!143 = !DILocation(line: 52, column: 45, scope: !122)
!144 = !DILocation(line: 52, column: 33, scope: !122)
!145 = !DILocation(line: 52, column: 62, scope: !122)
!146 = !DILocation(line: 52, column: 50, scope: !122)
!147 = !DILocation(line: 52, column: 48, scope: !122)
!148 = !DILocation(line: 52, column: 30, scope: !122)
!149 = !DILocation(line: 52, column: 69, scope: !122)
!150 = !DILocation(line: 52, column: 85, scope: !122)
!151 = !DILocation(line: 52, column: 73, scope: !122)
!152 = !DILocation(line: 52, column: 71, scope: !122)
!153 = !DILocation(line: 52, column: 104, scope: !122)
!154 = !DILocation(line: 52, column: 92, scope: !122)
!155 = !DILocation(line: 52, column: 121, scope: !122)
!156 = !DILocation(line: 52, column: 109, scope: !122)
!157 = !DILocation(line: 52, column: 107, scope: !122)
!158 = !DILocation(line: 52, column: 89, scope: !122)
!159 = !DILocation(line: 52, column: 66, scope: !122)
!160 = !DILocation(line: 52, column: 7, scope: !122)
!161 = !DILocation(line: 53, column: 10, scope: !122)
!162 = !DILocation(line: 53, column: 26, scope: !122)
!163 = !DILocation(line: 53, column: 14, scope: !122)
!164 = !DILocation(line: 53, column: 12, scope: !122)
!165 = !DILocation(line: 53, column: 45, scope: !122)
!166 = !DILocation(line: 53, column: 33, scope: !122)
!167 = !DILocation(line: 53, column: 62, scope: !122)
!168 = !DILocation(line: 53, column: 50, scope: !122)
!169 = !DILocation(line: 53, column: 48, scope: !122)
!170 = !DILocation(line: 53, column: 30, scope: !122)
!171 = !DILocation(line: 53, column: 69, scope: !122)
!172 = !DILocation(line: 53, column: 85, scope: !122)
!173 = !DILocation(line: 53, column: 73, scope: !122)
!174 = !DILocation(line: 53, column: 71, scope: !122)
!175 = !DILocation(line: 53, column: 104, scope: !122)
!176 = !DILocation(line: 53, column: 92, scope: !122)
!177 = !DILocation(line: 53, column: 121, scope: !122)
!178 = !DILocation(line: 53, column: 109, scope: !122)
!179 = !DILocation(line: 53, column: 107, scope: !122)
!180 = !DILocation(line: 53, column: 89, scope: !122)
!181 = !DILocation(line: 53, column: 66, scope: !122)
!182 = !DILocation(line: 53, column: 7, scope: !122)
!183 = !DILocation(line: 54, column: 10, scope: !122)
!184 = !DILocation(line: 54, column: 26, scope: !122)
!185 = !DILocation(line: 54, column: 14, scope: !122)
!186 = !DILocation(line: 54, column: 12, scope: !122)
!187 = !DILocation(line: 54, column: 45, scope: !122)
!188 = !DILocation(line: 54, column: 33, scope: !122)
!189 = !DILocation(line: 54, column: 62, scope: !122)
!190 = !DILocation(line: 54, column: 50, scope: !122)
!191 = !DILocation(line: 54, column: 48, scope: !122)
!192 = !DILocation(line: 54, column: 30, scope: !122)
!193 = !DILocation(line: 54, column: 69, scope: !122)
!194 = !DILocation(line: 54, column: 85, scope: !122)
!195 = !DILocation(line: 54, column: 73, scope: !122)
!196 = !DILocation(line: 54, column: 71, scope: !122)
!197 = !DILocation(line: 54, column: 104, scope: !122)
!198 = !DILocation(line: 54, column: 92, scope: !122)
!199 = !DILocation(line: 54, column: 121, scope: !122)
!200 = !DILocation(line: 54, column: 109, scope: !122)
!201 = !DILocation(line: 54, column: 107, scope: !122)
!202 = !DILocation(line: 54, column: 89, scope: !122)
!203 = !DILocation(line: 54, column: 66, scope: !122)
!204 = !DILocation(line: 54, column: 7, scope: !122)
!205 = !DILocation(line: 56, column: 11, scope: !122)
!206 = !DILocation(line: 56, column: 15, scope: !122)
!207 = !DILocation(line: 56, column: 20, scope: !122)
!208 = !DILocation(line: 56, column: 23, scope: !122)
!209 = !DILocation(line: 56, column: 27, scope: !122)
!210 = !DILocation(line: 56, column: 32, scope: !122)
!211 = !DILocation(line: 56, column: 35, scope: !122)
!212 = !DILocation(line: 56, column: 39, scope: !122)
!213 = !DILocation(line: 57, column: 1, scope: !122)
!214 = !DILocation(line: 56, column: 3, scope: !122)
!215 = distinct !DISubprogram(name: "find_min", linkageName: "_Z8find_minhhh", scope: !3, file: !3, line: 60, type: !216, isLocal: false, isDefinition: true, scopeLine: 61, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!216 = !DISubroutineType(types: !217)
!217 = !{!13, !13, !13, !13}
!218 = !DILocalVariable(name: "in0", arg: 1, scope: !215, file: !3, line: 60, type: !13)
!219 = !DILocation(line: 60, column: 20, scope: !215)
!220 = !DILocalVariable(name: "in1", arg: 2, scope: !215, file: !3, line: 60, type: !13)
!221 = !DILocation(line: 60, column: 30, scope: !215)
!222 = !DILocalVariable(name: "in2", arg: 3, scope: !215, file: !3, line: 60, type: !13)
!223 = !DILocation(line: 60, column: 40, scope: !215)
!224 = !DILocation(line: 62, column: 7, scope: !225)
!225 = distinct !DILexicalBlock(scope: !215, file: !3, line: 62, column: 7)
!226 = !DILocation(line: 62, column: 13, scope: !225)
!227 = !DILocation(line: 62, column: 11, scope: !225)
!228 = !DILocation(line: 62, column: 7, scope: !215)
!229 = !DILocation(line: 64, column: 9, scope: !230)
!230 = distinct !DILexicalBlock(scope: !231, file: !3, line: 64, column: 9)
!231 = distinct !DILexicalBlock(scope: !225, file: !3, line: 63, column: 3)
!232 = !DILocation(line: 64, column: 15, scope: !230)
!233 = !DILocation(line: 64, column: 13, scope: !230)
!234 = !DILocation(line: 64, column: 9, scope: !231)
!235 = !DILocation(line: 65, column: 14, scope: !230)
!236 = !DILocation(line: 65, column: 7, scope: !230)
!237 = !DILocation(line: 67, column: 14, scope: !230)
!238 = !DILocation(line: 67, column: 7, scope: !230)
!239 = !DILocation(line: 71, column: 9, scope: !240)
!240 = distinct !DILexicalBlock(scope: !241, file: !3, line: 71, column: 9)
!241 = distinct !DILexicalBlock(scope: !225, file: !3, line: 70, column: 3)
!242 = !DILocation(line: 71, column: 15, scope: !240)
!243 = !DILocation(line: 71, column: 13, scope: !240)
!244 = !DILocation(line: 71, column: 9, scope: !241)
!245 = !DILocation(line: 72, column: 14, scope: !240)
!246 = !DILocation(line: 72, column: 7, scope: !240)
!247 = !DILocation(line: 74, column: 14, scope: !240)
!248 = !DILocation(line: 74, column: 7, scope: !240)
!249 = !DILocation(line: 76, column: 1, scope: !215)
!250 = distinct !DISubprogram(name: "find_max", linkageName: "_Z8find_maxhhh", scope: !3, file: !3, line: 79, type: !216, isLocal: false, isDefinition: true, scopeLine: 80, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!251 = !DILocalVariable(name: "in0", arg: 1, scope: !250, file: !3, line: 79, type: !13)
!252 = !DILocation(line: 79, column: 20, scope: !250)
!253 = !DILocalVariable(name: "in1", arg: 2, scope: !250, file: !3, line: 79, type: !13)
!254 = !DILocation(line: 79, column: 30, scope: !250)
!255 = !DILocalVariable(name: "in2", arg: 3, scope: !250, file: !3, line: 79, type: !13)
!256 = !DILocation(line: 79, column: 40, scope: !250)
!257 = !DILocation(line: 81, column: 7, scope: !258)
!258 = distinct !DILexicalBlock(scope: !250, file: !3, line: 81, column: 7)
!259 = !DILocation(line: 81, column: 13, scope: !258)
!260 = !DILocation(line: 81, column: 11, scope: !258)
!261 = !DILocation(line: 81, column: 7, scope: !250)
!262 = !DILocation(line: 83, column: 9, scope: !263)
!263 = distinct !DILexicalBlock(scope: !264, file: !3, line: 83, column: 9)
!264 = distinct !DILexicalBlock(scope: !258, file: !3, line: 82, column: 3)
!265 = !DILocation(line: 83, column: 15, scope: !263)
!266 = !DILocation(line: 83, column: 13, scope: !263)
!267 = !DILocation(line: 83, column: 9, scope: !264)
!268 = !DILocation(line: 84, column: 14, scope: !263)
!269 = !DILocation(line: 84, column: 7, scope: !263)
!270 = !DILocation(line: 86, column: 14, scope: !263)
!271 = !DILocation(line: 86, column: 7, scope: !263)
!272 = !DILocation(line: 90, column: 9, scope: !273)
!273 = distinct !DILexicalBlock(scope: !274, file: !3, line: 90, column: 9)
!274 = distinct !DILexicalBlock(scope: !258, file: !3, line: 89, column: 3)
!275 = !DILocation(line: 90, column: 15, scope: !273)
!276 = !DILocation(line: 90, column: 13, scope: !273)
!277 = !DILocation(line: 90, column: 9, scope: !274)
!278 = !DILocation(line: 91, column: 14, scope: !273)
!279 = !DILocation(line: 91, column: 7, scope: !273)
!280 = !DILocation(line: 93, column: 14, scope: !273)
!281 = !DILocation(line: 93, column: 7, scope: !273)
!282 = !DILocation(line: 95, column: 1, scope: !250)
!283 = distinct !DISubprogram(name: "projection", linkageName: "_Z10projection11Triangle_3DP11Triangle_2Di", scope: !3, file: !3, line: 100, type: !284, isLocal: false, isDefinition: true, scopeLine: 101, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!284 = !DISubroutineType(types: !285)
!285 = !{null, !286, !89, !6}
!286 = !DIDerivedType(tag: DW_TAG_typedef, name: "Triangle_3D", file: !9, line: 34, baseType: !287)
!287 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !9, line: 23, size: 72, flags: DIFlagTypePassByValue, elements: !288, identifier: "_ZTS11Triangle_3D")
!288 = !{!289, !290, !291, !292, !293, !294, !295, !296, !297}
!289 = !DIDerivedType(tag: DW_TAG_member, name: "x0", scope: !287, file: !9, line: 25, baseType: !13, size: 8)
!290 = !DIDerivedType(tag: DW_TAG_member, name: "y0", scope: !287, file: !9, line: 26, baseType: !13, size: 8, offset: 8)
!291 = !DIDerivedType(tag: DW_TAG_member, name: "z0", scope: !287, file: !9, line: 27, baseType: !13, size: 8, offset: 16)
!292 = !DIDerivedType(tag: DW_TAG_member, name: "x1", scope: !287, file: !9, line: 28, baseType: !13, size: 8, offset: 24)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "y1", scope: !287, file: !9, line: 29, baseType: !13, size: 8, offset: 32)
!294 = !DIDerivedType(tag: DW_TAG_member, name: "z1", scope: !287, file: !9, line: 30, baseType: !13, size: 8, offset: 40)
!295 = !DIDerivedType(tag: DW_TAG_member, name: "x2", scope: !287, file: !9, line: 31, baseType: !13, size: 8, offset: 48)
!296 = !DIDerivedType(tag: DW_TAG_member, name: "y2", scope: !287, file: !9, line: 32, baseType: !13, size: 8, offset: 56)
!297 = !DIDerivedType(tag: DW_TAG_member, name: "z2", scope: !287, file: !9, line: 33, baseType: !13, size: 8, offset: 64)
!298 = !DILocalVariable(name: "triangle_3d", arg: 1, scope: !283, file: !3, line: 100, type: !286)
!299 = !DILocation(line: 100, column: 29, scope: !283)
!300 = !DILocalVariable(name: "triangle_2d", arg: 2, scope: !283, file: !3, line: 100, type: !89)
!301 = !DILocation(line: 100, column: 55, scope: !283)
!302 = !DILocalVariable(name: "angle", arg: 3, scope: !283, file: !3, line: 100, type: !6)
!303 = !DILocation(line: 100, column: 72, scope: !283)
!304 = !DILocation(line: 106, column: 6, scope: !305)
!305 = distinct !DILexicalBlock(scope: !283, file: !3, line: 106, column: 6)
!306 = !DILocation(line: 106, column: 12, scope: !305)
!307 = !DILocation(line: 106, column: 6, scope: !283)
!308 = !DILocation(line: 108, column: 35, scope: !309)
!309 = distinct !DILexicalBlock(scope: !305, file: !3, line: 107, column: 3)
!310 = !DILocation(line: 108, column: 5, scope: !309)
!311 = !DILocation(line: 108, column: 18, scope: !309)
!312 = !DILocation(line: 108, column: 21, scope: !309)
!313 = !DILocation(line: 109, column: 35, scope: !309)
!314 = !DILocation(line: 109, column: 5, scope: !309)
!315 = !DILocation(line: 109, column: 18, scope: !309)
!316 = !DILocation(line: 109, column: 21, scope: !309)
!317 = !DILocation(line: 110, column: 35, scope: !309)
!318 = !DILocation(line: 110, column: 5, scope: !309)
!319 = !DILocation(line: 110, column: 18, scope: !309)
!320 = !DILocation(line: 110, column: 21, scope: !309)
!321 = !DILocation(line: 111, column: 35, scope: !309)
!322 = !DILocation(line: 111, column: 5, scope: !309)
!323 = !DILocation(line: 111, column: 18, scope: !309)
!324 = !DILocation(line: 111, column: 21, scope: !309)
!325 = !DILocation(line: 112, column: 35, scope: !309)
!326 = !DILocation(line: 112, column: 5, scope: !309)
!327 = !DILocation(line: 112, column: 18, scope: !309)
!328 = !DILocation(line: 112, column: 21, scope: !309)
!329 = !DILocation(line: 113, column: 35, scope: !309)
!330 = !DILocation(line: 113, column: 5, scope: !309)
!331 = !DILocation(line: 113, column: 18, scope: !309)
!332 = !DILocation(line: 113, column: 21, scope: !309)
!333 = !DILocation(line: 114, column: 34, scope: !309)
!334 = !DILocation(line: 114, column: 22, scope: !309)
!335 = !DILocation(line: 114, column: 37, scope: !309)
!336 = !DILocation(line: 114, column: 55, scope: !309)
!337 = !DILocation(line: 114, column: 43, scope: !309)
!338 = !DILocation(line: 114, column: 58, scope: !309)
!339 = !DILocation(line: 114, column: 41, scope: !309)
!340 = !DILocation(line: 114, column: 76, scope: !309)
!341 = !DILocation(line: 114, column: 64, scope: !309)
!342 = !DILocation(line: 114, column: 79, scope: !309)
!343 = !DILocation(line: 114, column: 62, scope: !309)
!344 = !DILocation(line: 114, column: 5, scope: !309)
!345 = !DILocation(line: 114, column: 18, scope: !309)
!346 = !DILocation(line: 114, column: 20, scope: !309)
!347 = !DILocation(line: 115, column: 3, scope: !309)
!348 = !DILocation(line: 117, column: 11, scope: !349)
!349 = distinct !DILexicalBlock(scope: !305, file: !3, line: 117, column: 11)
!350 = !DILocation(line: 117, column: 17, scope: !349)
!351 = !DILocation(line: 117, column: 11, scope: !305)
!352 = !DILocation(line: 119, column: 35, scope: !353)
!353 = distinct !DILexicalBlock(scope: !349, file: !3, line: 118, column: 3)
!354 = !DILocation(line: 119, column: 5, scope: !353)
!355 = !DILocation(line: 119, column: 18, scope: !353)
!356 = !DILocation(line: 119, column: 21, scope: !353)
!357 = !DILocation(line: 120, column: 35, scope: !353)
!358 = !DILocation(line: 120, column: 5, scope: !353)
!359 = !DILocation(line: 120, column: 18, scope: !353)
!360 = !DILocation(line: 120, column: 21, scope: !353)
!361 = !DILocation(line: 121, column: 35, scope: !353)
!362 = !DILocation(line: 121, column: 5, scope: !353)
!363 = !DILocation(line: 121, column: 18, scope: !353)
!364 = !DILocation(line: 121, column: 21, scope: !353)
!365 = !DILocation(line: 122, column: 35, scope: !353)
!366 = !DILocation(line: 122, column: 5, scope: !353)
!367 = !DILocation(line: 122, column: 18, scope: !353)
!368 = !DILocation(line: 122, column: 21, scope: !353)
!369 = !DILocation(line: 123, column: 35, scope: !353)
!370 = !DILocation(line: 123, column: 5, scope: !353)
!371 = !DILocation(line: 123, column: 18, scope: !353)
!372 = !DILocation(line: 123, column: 21, scope: !353)
!373 = !DILocation(line: 124, column: 35, scope: !353)
!374 = !DILocation(line: 124, column: 5, scope: !353)
!375 = !DILocation(line: 124, column: 18, scope: !353)
!376 = !DILocation(line: 124, column: 21, scope: !353)
!377 = !DILocation(line: 125, column: 34, scope: !353)
!378 = !DILocation(line: 125, column: 22, scope: !353)
!379 = !DILocation(line: 125, column: 37, scope: !353)
!380 = !DILocation(line: 125, column: 55, scope: !353)
!381 = !DILocation(line: 125, column: 43, scope: !353)
!382 = !DILocation(line: 125, column: 58, scope: !353)
!383 = !DILocation(line: 125, column: 41, scope: !353)
!384 = !DILocation(line: 125, column: 76, scope: !353)
!385 = !DILocation(line: 125, column: 64, scope: !353)
!386 = !DILocation(line: 125, column: 79, scope: !353)
!387 = !DILocation(line: 125, column: 62, scope: !353)
!388 = !DILocation(line: 125, column: 5, scope: !353)
!389 = !DILocation(line: 125, column: 18, scope: !353)
!390 = !DILocation(line: 125, column: 20, scope: !353)
!391 = !DILocation(line: 126, column: 3, scope: !353)
!392 = !DILocation(line: 128, column: 11, scope: !393)
!393 = distinct !DILexicalBlock(scope: !349, file: !3, line: 128, column: 11)
!394 = !DILocation(line: 128, column: 17, scope: !393)
!395 = !DILocation(line: 128, column: 11, scope: !349)
!396 = !DILocation(line: 130, column: 35, scope: !397)
!397 = distinct !DILexicalBlock(scope: !393, file: !3, line: 129, column: 3)
!398 = !DILocation(line: 130, column: 5, scope: !397)
!399 = !DILocation(line: 130, column: 18, scope: !397)
!400 = !DILocation(line: 130, column: 21, scope: !397)
!401 = !DILocation(line: 131, column: 35, scope: !397)
!402 = !DILocation(line: 131, column: 5, scope: !397)
!403 = !DILocation(line: 131, column: 18, scope: !397)
!404 = !DILocation(line: 131, column: 21, scope: !397)
!405 = !DILocation(line: 132, column: 35, scope: !397)
!406 = !DILocation(line: 132, column: 5, scope: !397)
!407 = !DILocation(line: 132, column: 18, scope: !397)
!408 = !DILocation(line: 132, column: 21, scope: !397)
!409 = !DILocation(line: 133, column: 35, scope: !397)
!410 = !DILocation(line: 133, column: 5, scope: !397)
!411 = !DILocation(line: 133, column: 18, scope: !397)
!412 = !DILocation(line: 133, column: 21, scope: !397)
!413 = !DILocation(line: 134, column: 35, scope: !397)
!414 = !DILocation(line: 134, column: 5, scope: !397)
!415 = !DILocation(line: 134, column: 18, scope: !397)
!416 = !DILocation(line: 134, column: 21, scope: !397)
!417 = !DILocation(line: 135, column: 35, scope: !397)
!418 = !DILocation(line: 135, column: 5, scope: !397)
!419 = !DILocation(line: 135, column: 18, scope: !397)
!420 = !DILocation(line: 135, column: 21, scope: !397)
!421 = !DILocation(line: 136, column: 34, scope: !397)
!422 = !DILocation(line: 136, column: 22, scope: !397)
!423 = !DILocation(line: 136, column: 37, scope: !397)
!424 = !DILocation(line: 136, column: 55, scope: !397)
!425 = !DILocation(line: 136, column: 43, scope: !397)
!426 = !DILocation(line: 136, column: 58, scope: !397)
!427 = !DILocation(line: 136, column: 41, scope: !397)
!428 = !DILocation(line: 136, column: 76, scope: !397)
!429 = !DILocation(line: 136, column: 64, scope: !397)
!430 = !DILocation(line: 136, column: 79, scope: !397)
!431 = !DILocation(line: 136, column: 62, scope: !397)
!432 = !DILocation(line: 136, column: 5, scope: !397)
!433 = !DILocation(line: 136, column: 18, scope: !397)
!434 = !DILocation(line: 136, column: 20, scope: !397)
!435 = !DILocation(line: 137, column: 3, scope: !397)
!436 = !DILocation(line: 138, column: 1, scope: !283)
!437 = distinct !DISubprogram(name: "rasterization1", linkageName: "_Z14rasterization111Triangle_2DPhPi", scope: !3, file: !3, line: 141, type: !438, isLocal: false, isDefinition: true, scopeLine: 142, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!438 = !DISubroutineType(types: !439)
!439 = !{!125, !44, !440, !441}
!440 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!441 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!442 = !DILocalVariable(name: "triangle_2d", arg: 1, scope: !437, file: !3, line: 141, type: !44)
!443 = !DILocation(line: 141, column: 33, scope: !437)
!444 = !DILocalVariable(name: "max_min", arg: 2, scope: !437, file: !3, line: 141, type: !440)
!445 = !DILocation(line: 141, column: 51, scope: !437)
!446 = !DILocalVariable(name: "max_index", arg: 3, scope: !437, file: !3, line: 141, type: !441)
!447 = !DILocation(line: 141, column: 66, scope: !437)
!448 = !DILocation(line: 144, column: 25, scope: !449)
!449 = distinct !DILexicalBlock(scope: !437, file: !3, line: 144, column: 8)
!450 = !DILocation(line: 144, column: 8, scope: !449)
!451 = !DILocation(line: 144, column: 39, scope: !449)
!452 = !DILocation(line: 144, column: 8, scope: !437)
!453 = !DILocation(line: 145, column: 5, scope: !449)
!454 = !DILocation(line: 146, column: 25, scope: !455)
!455 = distinct !DILexicalBlock(scope: !437, file: !3, line: 146, column: 8)
!456 = !DILocation(line: 146, column: 8, scope: !455)
!457 = !DILocation(line: 146, column: 39, scope: !455)
!458 = !DILocation(line: 146, column: 8, scope: !437)
!459 = !DILocation(line: 147, column: 5, scope: !455)
!460 = !DILocation(line: 150, column: 38, scope: !437)
!461 = !DILocation(line: 150, column: 54, scope: !437)
!462 = !DILocation(line: 150, column: 70, scope: !437)
!463 = !DILocation(line: 150, column: 16, scope: !437)
!464 = !DILocation(line: 150, column: 3, scope: !437)
!465 = !DILocation(line: 150, column: 14, scope: !437)
!466 = !DILocation(line: 151, column: 38, scope: !437)
!467 = !DILocation(line: 151, column: 54, scope: !437)
!468 = !DILocation(line: 151, column: 70, scope: !437)
!469 = !DILocation(line: 151, column: 16, scope: !437)
!470 = !DILocation(line: 151, column: 3, scope: !437)
!471 = !DILocation(line: 151, column: 14, scope: !437)
!472 = !DILocation(line: 152, column: 38, scope: !437)
!473 = !DILocation(line: 152, column: 54, scope: !437)
!474 = !DILocation(line: 152, column: 70, scope: !437)
!475 = !DILocation(line: 152, column: 16, scope: !437)
!476 = !DILocation(line: 152, column: 3, scope: !437)
!477 = !DILocation(line: 152, column: 14, scope: !437)
!478 = !DILocation(line: 153, column: 38, scope: !437)
!479 = !DILocation(line: 153, column: 54, scope: !437)
!480 = !DILocation(line: 153, column: 70, scope: !437)
!481 = !DILocation(line: 153, column: 16, scope: !437)
!482 = !DILocation(line: 153, column: 3, scope: !437)
!483 = !DILocation(line: 153, column: 14, scope: !437)
!484 = !DILocation(line: 154, column: 16, scope: !437)
!485 = !DILocation(line: 154, column: 29, scope: !437)
!486 = !DILocation(line: 154, column: 27, scope: !437)
!487 = !DILocation(line: 154, column: 3, scope: !437)
!488 = !DILocation(line: 154, column: 14, scope: !437)
!489 = !DILocation(line: 157, column: 19, scope: !437)
!490 = !DILocation(line: 157, column: 32, scope: !437)
!491 = !DILocation(line: 157, column: 30, scope: !437)
!492 = !DILocation(line: 157, column: 47, scope: !437)
!493 = !DILocation(line: 157, column: 60, scope: !437)
!494 = !DILocation(line: 157, column: 58, scope: !437)
!495 = !DILocation(line: 157, column: 44, scope: !437)
!496 = !DILocation(line: 157, column: 3, scope: !437)
!497 = !DILocation(line: 157, column: 16, scope: !437)
!498 = !DILocation(line: 159, column: 3, scope: !437)
!499 = !DILocation(line: 160, column: 1, scope: !437)
!500 = distinct !DISubprogram(name: "rasterization2", linkageName: "_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel", scope: !3, file: !3, line: 163, type: !501, isLocal: false, isDefinition: true, scopeLine: 164, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!501 = !DISubroutineType(types: !502)
!502 = !{!6, !125, !440, !441, !44, !7}
!503 = !DILocalVariable(name: "flag", arg: 1, scope: !500, file: !3, line: 163, type: !125)
!504 = !DILocation(line: 163, column: 27, scope: !500)
!505 = !DILocalVariable(name: "max_min", arg: 2, scope: !500, file: !3, line: 163, type: !440)
!506 = !DILocation(line: 163, column: 38, scope: !500)
!507 = !DILocalVariable(name: "max_index", arg: 3, scope: !500, file: !3, line: 163, type: !441)
!508 = !DILocation(line: 163, column: 53, scope: !500)
!509 = !DILocalVariable(name: "triangle_2d", arg: 4, scope: !500, file: !3, line: 163, type: !44)
!510 = !DILocation(line: 163, column: 78, scope: !500)
!511 = !DILocalVariable(name: "fragment", arg: 5, scope: !500, file: !3, line: 163, type: !7)
!512 = !DILocation(line: 163, column: 106, scope: !500)
!513 = !DILocation(line: 166, column: 8, scope: !514)
!514 = distinct !DILexicalBlock(scope: !500, file: !3, line: 166, column: 8)
!515 = !DILocation(line: 166, column: 8, scope: !500)
!516 = !DILocation(line: 168, column: 5, scope: !517)
!517 = distinct !DILexicalBlock(scope: !514, file: !3, line: 167, column: 3)
!518 = !DILocation(line: 171, column: 3, scope: !500)
!519 = !DILocalVariable(name: "color", scope: !500, file: !3, line: 171, type: !13)
!520 = !DILocation(line: 171, column: 8, scope: !500)
!521 = !DILocation(line: 172, column: 3, scope: !500)
!522 = !DILocalVariable(name: "i", scope: !500, file: !3, line: 172, type: !6)
!523 = !DILocation(line: 172, column: 7, scope: !500)
!524 = !DILocation(line: 174, column: 16, scope: !525)
!525 = distinct !DILexicalBlock(scope: !500, file: !3, line: 174, column: 10)
!526 = !DILocalVariable(name: "k", scope: !525, file: !3, line: 174, type: !6)
!527 = !DILocation(line: 174, column: 20, scope: !525)
!528 = !DILocation(line: 174, column: 27, scope: !529)
!529 = distinct !DILexicalBlock(scope: !525, file: !3, line: 174, column: 10)
!530 = !DILocation(line: 174, column: 31, scope: !529)
!531 = !DILocation(line: 174, column: 29, scope: !529)
!532 = !DILocation(line: 174, column: 10, scope: !525)
!533 = !DILocation(line: 174, column: 10, scope: !529)
!534 = !DILocation(line: 176, column: 5, scope: !535)
!535 = distinct !DILexicalBlock(scope: !529, file: !3, line: 175, column: 3)
!536 = !DILocalVariable(name: "x", scope: !535, file: !3, line: 176, type: !13)
!537 = !DILocation(line: 176, column: 10, scope: !535)
!538 = !DILocation(line: 176, column: 14, scope: !535)
!539 = !DILocation(line: 176, column: 27, scope: !535)
!540 = !DILocation(line: 176, column: 31, scope: !535)
!541 = !DILocation(line: 176, column: 29, scope: !535)
!542 = !DILocation(line: 176, column: 25, scope: !535)
!543 = !DILocation(line: 177, column: 5, scope: !535)
!544 = !DILocalVariable(name: "y", scope: !535, file: !3, line: 177, type: !13)
!545 = !DILocation(line: 177, column: 10, scope: !535)
!546 = !DILocation(line: 177, column: 14, scope: !535)
!547 = !DILocation(line: 177, column: 27, scope: !535)
!548 = !DILocation(line: 177, column: 31, scope: !535)
!549 = !DILocation(line: 177, column: 29, scope: !535)
!550 = !DILocation(line: 177, column: 25, scope: !535)
!551 = !DILocation(line: 179, column: 28, scope: !552)
!552 = distinct !DILexicalBlock(scope: !535, file: !3, line: 179, column: 9)
!553 = !DILocation(line: 179, column: 31, scope: !552)
!554 = !DILocation(line: 179, column: 34, scope: !552)
!555 = !DILocation(line: 179, column: 9, scope: !552)
!556 = !DILocation(line: 179, column: 9, scope: !535)
!557 = !DILocation(line: 181, column: 23, scope: !558)
!558 = distinct !DILexicalBlock(scope: !552, file: !3, line: 180, column: 5)
!559 = !DILocation(line: 181, column: 7, scope: !558)
!560 = !DILocation(line: 181, column: 16, scope: !558)
!561 = !DILocation(line: 181, column: 19, scope: !558)
!562 = !DILocation(line: 181, column: 21, scope: !558)
!563 = !DILocation(line: 182, column: 23, scope: !558)
!564 = !DILocation(line: 182, column: 7, scope: !558)
!565 = !DILocation(line: 182, column: 16, scope: !558)
!566 = !DILocation(line: 182, column: 19, scope: !558)
!567 = !DILocation(line: 182, column: 21, scope: !558)
!568 = !DILocation(line: 183, column: 35, scope: !558)
!569 = !DILocation(line: 183, column: 7, scope: !558)
!570 = !DILocation(line: 183, column: 16, scope: !558)
!571 = !DILocation(line: 183, column: 19, scope: !558)
!572 = !DILocation(line: 183, column: 21, scope: !558)
!573 = !DILocation(line: 184, column: 27, scope: !558)
!574 = !DILocation(line: 184, column: 7, scope: !558)
!575 = !DILocation(line: 184, column: 16, scope: !558)
!576 = !DILocation(line: 184, column: 19, scope: !558)
!577 = !DILocation(line: 184, column: 25, scope: !558)
!578 = !DILocation(line: 185, column: 8, scope: !558)
!579 = !DILocation(line: 186, column: 5, scope: !558)
!580 = !DILocation(line: 187, column: 3, scope: !529)
!581 = !DILocation(line: 187, column: 3, scope: !535)
!582 = !DILocation(line: 174, column: 47, scope: !529)
!583 = distinct !{!583, !532, !584, !585}
!584 = !DILocation(line: 187, column: 3, scope: !525)
!585 = !{!"llvm.loop.name", !"RAST2"}
!586 = !DILocation(line: 189, column: 10, scope: !500)
!587 = !DILocation(line: 189, column: 3, scope: !500)
!588 = !DILocation(line: 190, column: 1, scope: !500)
!589 = !DILocalVariable(name: "counter", arg: 1, scope: !2, file: !3, line: 193, type: !6)
!590 = !DILocation(line: 193, column: 18, scope: !2)
!591 = !DILocalVariable(name: "fragments", arg: 2, scope: !2, file: !3, line: 193, type: !7)
!592 = !DILocation(line: 193, column: 42, scope: !2)
!593 = !DILocalVariable(name: "size", arg: 3, scope: !2, file: !3, line: 193, type: !6)
!594 = !DILocation(line: 193, column: 59, scope: !2)
!595 = !DILocalVariable(name: "pixels", arg: 4, scope: !2, file: !3, line: 193, type: !18)
!596 = !DILocation(line: 193, column: 71, scope: !2)
!597 = !DILocation(line: 197, column: 7, scope: !598)
!598 = distinct !DILexicalBlock(scope: !2, file: !3, line: 197, column: 7)
!599 = !DILocation(line: 197, column: 15, scope: !598)
!600 = !DILocation(line: 197, column: 7, scope: !2)
!601 = !DILocation(line: 198, column: 3, scope: !598)
!602 = !DILocation(line: 199, column: 30, scope: !603)
!603 = distinct !DILexicalBlock(scope: !604, file: !3, line: 199, column: 24)
!604 = distinct !DILexicalBlock(scope: !598, file: !3, line: 198, column: 3)
!605 = !DILocalVariable(name: "i", scope: !603, file: !3, line: 199, type: !6)
!606 = !DILocation(line: 199, column: 34, scope: !603)
!607 = !DILocation(line: 199, column: 41, scope: !608)
!608 = distinct !DILexicalBlock(scope: !603, file: !3, line: 199, column: 24)
!609 = !DILocation(line: 199, column: 43, scope: !608)
!610 = !DILocation(line: 199, column: 24, scope: !603)
!611 = !DILocation(line: 199, column: 24, scope: !608)
!612 = !DILocation(line: 200, column: 5, scope: !608)
!613 = !DILocation(line: 201, column: 32, scope: !614)
!614 = distinct !DILexicalBlock(scope: !615, file: !3, line: 201, column: 26)
!615 = distinct !DILexicalBlock(scope: !608, file: !3, line: 200, column: 5)
!616 = !DILocalVariable(name: "j", scope: !614, file: !3, line: 201, type: !6)
!617 = !DILocation(line: 201, column: 36, scope: !614)
!618 = !DILocation(line: 201, column: 43, scope: !619)
!619 = distinct !DILexicalBlock(scope: !614, file: !3, line: 201, column: 26)
!620 = !DILocation(line: 201, column: 45, scope: !619)
!621 = !DILocation(line: 201, column: 26, scope: !614)
!622 = !DILocation(line: 201, column: 26, scope: !619)
!623 = !DILocation(line: 203, column: 18, scope: !624)
!624 = distinct !DILexicalBlock(scope: !619, file: !3, line: 202, column: 7)
!625 = !DILocation(line: 203, column: 9, scope: !624)
!626 = !DILocation(line: 203, column: 21, scope: !624)
!627 = !DILocation(line: 203, column: 24, scope: !624)
!628 = !DILocation(line: 204, column: 7, scope: !624)
!629 = !DILocation(line: 201, column: 56, scope: !619)
!630 = distinct !{!630, !621, !631, !632}
!631 = !DILocation(line: 204, column: 7, scope: !614)
!632 = !{!"llvm.loop.name", !"ZCULLING_INIT_COL"}
!633 = !DILocation(line: 205, column: 5, scope: !615)
!634 = !DILocation(line: 199, column: 54, scope: !608)
!635 = distinct !{!635, !610, !636, !637}
!636 = !DILocation(line: 205, column: 5, scope: !603)
!637 = !{!"llvm.loop.name", !"ZCULLING_INIT_ROW"}
!638 = !DILocation(line: 206, column: 3, scope: !604)
!639 = !DILocation(line: 209, column: 3, scope: !2)
!640 = !DILocalVariable(name: "pixel_cntr", scope: !2, file: !3, line: 209, type: !6)
!641 = !DILocation(line: 209, column: 7, scope: !2)
!642 = !DILocation(line: 212, column: 19, scope: !643)
!643 = distinct !DILexicalBlock(scope: !2, file: !3, line: 212, column: 13)
!644 = !DILocalVariable(name: "n", scope: !643, file: !3, line: 212, type: !6)
!645 = !DILocation(line: 212, column: 23, scope: !643)
!646 = !DILocation(line: 212, column: 30, scope: !647)
!647 = distinct !DILexicalBlock(scope: !643, file: !3, line: 212, column: 13)
!648 = !DILocation(line: 212, column: 34, scope: !647)
!649 = !DILocation(line: 212, column: 32, scope: !647)
!650 = !DILocation(line: 212, column: 13, scope: !643)
!651 = !DILocation(line: 212, column: 13, scope: !647)
!652 = !DILocation(line: 214, column: 9, scope: !653)
!653 = distinct !DILexicalBlock(scope: !654, file: !3, line: 214, column: 9)
!654 = distinct !DILexicalBlock(scope: !647, file: !3, line: 213, column: 3)
!655 = !DILocation(line: 214, column: 19, scope: !653)
!656 = !DILocation(line: 214, column: 22, scope: !653)
!657 = !DILocation(line: 214, column: 35, scope: !653)
!658 = !DILocation(line: 214, column: 45, scope: !653)
!659 = !DILocation(line: 214, column: 48, scope: !653)
!660 = !DILocation(line: 214, column: 26, scope: !653)
!661 = !DILocation(line: 214, column: 51, scope: !653)
!662 = !DILocation(line: 214, column: 61, scope: !653)
!663 = !DILocation(line: 214, column: 64, scope: !653)
!664 = !DILocation(line: 214, column: 24, scope: !653)
!665 = !DILocation(line: 214, column: 9, scope: !654)
!666 = !DILocation(line: 216, column: 30, scope: !667)
!667 = distinct !DILexicalBlock(scope: !653, file: !3, line: 215, column: 5)
!668 = !DILocation(line: 216, column: 40, scope: !667)
!669 = !DILocation(line: 216, column: 43, scope: !667)
!670 = !DILocation(line: 216, column: 7, scope: !667)
!671 = !DILocation(line: 216, column: 14, scope: !667)
!672 = !DILocation(line: 216, column: 26, scope: !667)
!673 = !DILocation(line: 216, column: 28, scope: !667)
!674 = !DILocation(line: 217, column: 30, scope: !667)
!675 = !DILocation(line: 217, column: 40, scope: !667)
!676 = !DILocation(line: 217, column: 43, scope: !667)
!677 = !DILocation(line: 217, column: 7, scope: !667)
!678 = !DILocation(line: 217, column: 14, scope: !667)
!679 = !DILocation(line: 217, column: 26, scope: !667)
!680 = !DILocation(line: 217, column: 28, scope: !667)
!681 = !DILocation(line: 218, column: 34, scope: !667)
!682 = !DILocation(line: 218, column: 44, scope: !667)
!683 = !DILocation(line: 218, column: 47, scope: !667)
!684 = !DILocation(line: 218, column: 7, scope: !667)
!685 = !DILocation(line: 218, column: 14, scope: !667)
!686 = !DILocation(line: 218, column: 26, scope: !667)
!687 = !DILocation(line: 218, column: 32, scope: !667)
!688 = !DILocation(line: 219, column: 17, scope: !667)
!689 = !DILocation(line: 220, column: 50, scope: !667)
!690 = !DILocation(line: 220, column: 60, scope: !667)
!691 = !DILocation(line: 220, column: 63, scope: !667)
!692 = !DILocation(line: 220, column: 16, scope: !667)
!693 = !DILocation(line: 220, column: 26, scope: !667)
!694 = !DILocation(line: 220, column: 29, scope: !667)
!695 = !DILocation(line: 220, column: 7, scope: !667)
!696 = !DILocation(line: 220, column: 32, scope: !667)
!697 = !DILocation(line: 220, column: 42, scope: !667)
!698 = !DILocation(line: 220, column: 45, scope: !667)
!699 = !DILocation(line: 220, column: 48, scope: !667)
!700 = !DILocation(line: 221, column: 5, scope: !667)
!701 = !DILocation(line: 222, column: 3, scope: !654)
!702 = !DILocation(line: 212, column: 42, scope: !647)
!703 = distinct !{!703, !650, !704, !705}
!704 = !DILocation(line: 222, column: 3, scope: !643)
!705 = !{!"llvm.loop.name", !"ZCULLING"}
!706 = !DILocation(line: 224, column: 10, scope: !2)
!707 = !DILocation(line: 225, column: 1, scope: !2)
!708 = !DILocation(line: 224, column: 3, scope: !2)
!709 = distinct !DISubprogram(name: "coloringFB", linkageName: "_Z10coloringFBiiP5PixelPA256_h", scope: !3, file: !3, line: 228, type: !710, isLocal: false, isDefinition: true, scopeLine: 229, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!710 = !DISubroutineType(types: !711)
!711 = !{null, !6, !6, !18, !712}
!712 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !713, size: 64)
!713 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 2048, elements: !714)
!714 = !{!36}
!715 = !DILocalVariable(name: "counter", arg: 1, scope: !709, file: !3, line: 228, type: !6)
!716 = !DILocation(line: 228, column: 21, scope: !709)
!717 = !DILocalVariable(name: "size_pixels", arg: 2, scope: !709, file: !3, line: 228, type: !6)
!718 = !DILocation(line: 228, column: 34, scope: !709)
!719 = !DILocalVariable(name: "pixels", arg: 3, scope: !709, file: !3, line: 228, type: !18)
!720 = !DILocation(line: 228, column: 53, scope: !709)
!721 = !DILocalVariable(name: "frame_buffer", arg: 4, scope: !709, file: !3, line: 228, type: !712)
!722 = !DILocation(line: 228, column: 68, scope: !709)
!723 = !DILocation(line: 230, column: 8, scope: !724)
!724 = distinct !DILexicalBlock(scope: !709, file: !3, line: 230, column: 8)
!725 = !DILocation(line: 230, column: 16, scope: !724)
!726 = !DILocation(line: 230, column: 8, scope: !709)
!727 = !DILocation(line: 231, column: 3, scope: !724)
!728 = !DILocation(line: 233, column: 33, scope: !729)
!729 = distinct !DILexicalBlock(scope: !730, file: !3, line: 233, column: 27)
!730 = distinct !DILexicalBlock(scope: !724, file: !3, line: 231, column: 3)
!731 = !DILocalVariable(name: "i", scope: !729, file: !3, line: 233, type: !6)
!732 = !DILocation(line: 233, column: 37, scope: !729)
!733 = !DILocation(line: 233, column: 44, scope: !734)
!734 = distinct !DILexicalBlock(scope: !729, file: !3, line: 233, column: 27)
!735 = !DILocation(line: 233, column: 46, scope: !734)
!736 = !DILocation(line: 233, column: 27, scope: !729)
!737 = !DILocation(line: 233, column: 27, scope: !734)
!738 = !DILocation(line: 234, column: 5, scope: !734)
!739 = !DILocation(line: 235, column: 35, scope: !740)
!740 = distinct !DILexicalBlock(scope: !741, file: !3, line: 235, column: 29)
!741 = distinct !DILexicalBlock(scope: !734, file: !3, line: 234, column: 5)
!742 = !DILocalVariable(name: "j", scope: !740, file: !3, line: 235, type: !6)
!743 = !DILocation(line: 235, column: 39, scope: !740)
!744 = !DILocation(line: 235, column: 46, scope: !745)
!745 = distinct !DILexicalBlock(scope: !740, file: !3, line: 235, column: 29)
!746 = !DILocation(line: 235, column: 48, scope: !745)
!747 = !DILocation(line: 235, column: 29, scope: !740)
!748 = !DILocation(line: 235, column: 29, scope: !745)
!749 = !DILocation(line: 236, column: 9, scope: !745)
!750 = !DILocation(line: 236, column: 22, scope: !745)
!751 = !DILocation(line: 236, column: 25, scope: !745)
!752 = !DILocation(line: 236, column: 28, scope: !745)
!753 = !DILocation(line: 235, column: 59, scope: !745)
!754 = distinct !{!754, !747, !755, !756}
!755 = !DILocation(line: 236, column: 30, scope: !740)
!756 = !{!"llvm.loop.name", !"COLORING_FB_INIT_COL"}
!757 = !DILocation(line: 237, column: 5, scope: !741)
!758 = !DILocation(line: 233, column: 57, scope: !734)
!759 = distinct !{!759, !736, !760, !761}
!760 = !DILocation(line: 237, column: 5, scope: !729)
!761 = !{!"llvm.loop.name", !"COLORING_FB_INIT_ROW"}
!762 = !DILocation(line: 238, column: 3, scope: !730)
!763 = !DILocation(line: 230, column: 19, scope: !724)
!764 = !DILocation(line: 241, column: 22, scope: !765)
!765 = distinct !DILexicalBlock(scope: !709, file: !3, line: 241, column: 16)
!766 = !DILocalVariable(name: "i", scope: !765, file: !3, line: 241, type: !6)
!767 = !DILocation(line: 241, column: 26, scope: !765)
!768 = !DILocation(line: 241, column: 33, scope: !769)
!769 = distinct !DILexicalBlock(scope: !765, file: !3, line: 241, column: 16)
!770 = !DILocation(line: 241, column: 37, scope: !769)
!771 = !DILocation(line: 241, column: 35, scope: !769)
!772 = !DILocation(line: 241, column: 16, scope: !765)
!773 = !DILocation(line: 241, column: 16, scope: !769)
!774 = !DILocation(line: 242, column: 50, scope: !769)
!775 = !DILocation(line: 242, column: 57, scope: !769)
!776 = !DILocation(line: 242, column: 60, scope: !769)
!777 = !DILocation(line: 242, column: 5, scope: !769)
!778 = !DILocation(line: 242, column: 19, scope: !769)
!779 = !DILocation(line: 242, column: 26, scope: !769)
!780 = !DILocation(line: 242, column: 29, scope: !769)
!781 = !DILocation(line: 242, column: 34, scope: !769)
!782 = !DILocation(line: 242, column: 41, scope: !769)
!783 = !DILocation(line: 242, column: 44, scope: !769)
!784 = !DILocation(line: 242, column: 48, scope: !769)
!785 = !DILocation(line: 241, column: 52, scope: !769)
!786 = distinct !{!786, !772, !787, !788}
!787 = !DILocation(line: 242, column: 60, scope: !765)
!788 = !{!"llvm.loop.name", !"COLORING_FB"}
!789 = !DILocation(line: 243, column: 1, scope: !709)
!790 = distinct !DISubprogram(name: "rendering", linkageName: "_Z9renderingP11Triangle_3DPA256_hi", scope: !3, file: !3, line: 246, type: !791, isLocal: false, isDefinition: true, scopeLine: 250, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!791 = !DISubroutineType(types: !792)
!792 = !{null, !793, !712, !6}
!793 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !286, size: 64)
!794 = !{!795}
!795 = !{!"fpga.top", !"user", !796}
!796 = !DILocation(line: 246, column: 16, scope: !790)
!797 = !DILocalVariable(name: "triangle_3ds", arg: 1, scope: !790, file: !3, line: 247, type: !793)
!798 = !DILocation(line: 247, column: 18, scope: !790)
!799 = !DILocalVariable(name: "output", arg: 2, scope: !790, file: !3, line: 248, type: !712)
!800 = !DILocation(line: 248, column: 10, scope: !790)
!801 = !DILocalVariable(name: "num_triangles", arg: 3, scope: !790, file: !3, line: 249, type: !6)
!802 = !DILocation(line: 249, column: 9, scope: !790)
!803 = !DILocation(line: 252, column: 3, scope: !790)
!804 = !DILocalVariable(name: "triangle_2ds", scope: !790, file: !3, line: 252, type: !44)
!805 = !DILocation(line: 252, column: 15, scope: !790)
!806 = !DILocation(line: 254, column: 3, scope: !790)
!807 = !DILocalVariable(name: "angle", scope: !790, file: !3, line: 254, type: !6)
!808 = !DILocation(line: 254, column: 7, scope: !790)
!809 = !DILocation(line: 257, column: 3, scope: !790)
!810 = !DILocalVariable(name: "max_min", scope: !790, file: !3, line: 257, type: !811)
!811 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 40, elements: !812)
!812 = !{!813}
!813 = !DISubrange(count: 5)
!814 = !DILocation(line: 257, column: 8, scope: !790)
!815 = !DILocation(line: 258, column: 3, scope: !790)
!816 = !DILocalVariable(name: "max_index", scope: !790, file: !3, line: 258, type: !817)
!817 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32, elements: !818)
!818 = !{!819}
!819 = !DISubrange(count: 1)
!820 = !DILocation(line: 258, column: 7, scope: !790)
!821 = !DILocation(line: 261, column: 3, scope: !790)
!822 = !DILocalVariable(name: "fragment", scope: !790, file: !3, line: 261, type: !823)
!823 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 16000, elements: !824)
!824 = !{!825}
!825 = !DISubrange(count: 500)
!826 = !DILocation(line: 261, column: 18, scope: !790)
!827 = !DILocation(line: 264, column: 3, scope: !790)
!828 = !DILocalVariable(name: "pixels", scope: !790, file: !3, line: 264, type: !829)
!829 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 12000, elements: !824)
!830 = !DILocation(line: 264, column: 9, scope: !790)
!831 = !DILocation(line: 267, column: 19, scope: !832)
!832 = distinct !DILexicalBlock(scope: !790, file: !3, line: 267, column: 14)
!833 = !DILocalVariable(name: "i", scope: !832, file: !3, line: 267, type: !6)
!834 = !DILocation(line: 267, column: 23, scope: !832)
!835 = !DILocation(line: 267, column: 30, scope: !836)
!836 = distinct !DILexicalBlock(scope: !832, file: !3, line: 267, column: 14)
!837 = !DILocation(line: 267, column: 34, scope: !836)
!838 = !DILocation(line: 267, column: 32, scope: !836)
!839 = !DILocation(line: 267, column: 14, scope: !832)
!840 = !DILocation(line: 267, column: 14, scope: !836)
!841 = !DILocation(line: 270, column: 17, scope: !842)
!842 = distinct !DILexicalBlock(scope: !836, file: !3, line: 268, column: 3)
!843 = !DILocation(line: 270, column: 30, scope: !842)
!844 = !DILocation(line: 270, column: 49, scope: !842)
!845 = !DILocation(line: 270, column: 5, scope: !842)
!846 = !DILocation(line: 271, column: 5, scope: !842)
!847 = !DILocalVariable(name: "flag", scope: !842, file: !3, line: 271, type: !125)
!848 = !DILocation(line: 271, column: 10, scope: !842)
!849 = !DILocation(line: 271, column: 32, scope: !842)
!850 = !DILocation(line: 271, column: 46, scope: !842)
!851 = !DILocation(line: 271, column: 55, scope: !842)
!852 = !DILocation(line: 271, column: 17, scope: !842)
!853 = !DILocation(line: 272, column: 5, scope: !842)
!854 = !DILocalVariable(name: "size_fragment", scope: !842, file: !3, line: 272, type: !6)
!855 = !DILocation(line: 272, column: 9, scope: !842)
!856 = !DILocation(line: 272, column: 41, scope: !842)
!857 = !DILocation(line: 272, column: 47, scope: !842)
!858 = !DILocation(line: 272, column: 56, scope: !842)
!859 = !DILocation(line: 272, column: 67, scope: !842)
!860 = !DILocation(line: 272, column: 81, scope: !842)
!861 = !DILocation(line: 272, column: 25, scope: !842)
!862 = !DILocation(line: 273, column: 5, scope: !842)
!863 = !DILocalVariable(name: "size_pixels", scope: !842, file: !3, line: 273, type: !6)
!864 = !DILocation(line: 273, column: 9, scope: !842)
!865 = !DILocation(line: 273, column: 33, scope: !842)
!866 = !DILocation(line: 273, column: 36, scope: !842)
!867 = !DILocation(line: 273, column: 46, scope: !842)
!868 = !DILocation(line: 273, column: 61, scope: !842)
!869 = !DILocation(line: 273, column: 23, scope: !842)
!870 = !DILocation(line: 274, column: 18, scope: !842)
!871 = !DILocation(line: 274, column: 21, scope: !842)
!872 = !DILocation(line: 274, column: 34, scope: !842)
!873 = !DILocation(line: 274, column: 42, scope: !842)
!874 = !DILocation(line: 274, column: 5, scope: !842)
!875 = !DILocation(line: 275, column: 3, scope: !836)
!876 = !DILocation(line: 275, column: 3, scope: !842)
!877 = !DILocation(line: 267, column: 51, scope: !836)
!878 = distinct !{!878, !839, !879, !880}
!879 = !DILocation(line: 275, column: 3, scope: !832)
!880 = !{!"llvm.loop.name", !"TRIANGLES"}
!881 = !DILocation(line: 276, column: 1, scope: !790)
