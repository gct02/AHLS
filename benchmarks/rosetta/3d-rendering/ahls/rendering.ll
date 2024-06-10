; ModuleID = 'llvm-link'
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
define i32 @_Z15check_clockwise11Triangle_2D(%struct.Triangle_2D* byval align 1 %triangle_2d) #0 !dbg !43 {
entry:
  %cw = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D* %triangle_2d, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = bitcast i32* %cw to i8*, !dbg !58
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #15, !dbg !58
  call void @llvm.dbg.declare(metadata i32* %cw, metadata !59, metadata !DIExpression()), !dbg !60
  %x2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !61
  %1 = load i8, i8* %x2, align 1, !dbg !61
  %conv = zext i8 %1 to i32, !dbg !62
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !63
  %2 = load i8, i8* %x0, align 1, !dbg !63
  %conv1 = zext i8 %2 to i32, !dbg !64
  %sub = sub i32 %conv, %conv1, !dbg !65
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !66
  %3 = load i8, i8* %y1, align 1, !dbg !66
  %conv2 = zext i8 %3 to i32, !dbg !67
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !68
  %4 = load i8, i8* %y0, align 1, !dbg !68
  %conv3 = zext i8 %4 to i32, !dbg !69
  %sub4 = sub i32 %conv2, %conv3, !dbg !70
  %mul = mul i32 %sub, %sub4, !dbg !71
  %y2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !72
  %5 = load i8, i8* %y2, align 1, !dbg !72
  %conv5 = zext i8 %5 to i32, !dbg !73
  %y06 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !74
  %6 = load i8, i8* %y06, align 1, !dbg !74
  %conv7 = zext i8 %6 to i32, !dbg !75
  %sub8 = sub i32 %conv5, %conv7, !dbg !76
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !77
  %7 = load i8, i8* %x1, align 1, !dbg !77
  %conv9 = zext i8 %7 to i32, !dbg !78
  %x010 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !79
  %8 = load i8, i8* %x010, align 1, !dbg !79
  %conv11 = zext i8 %8 to i32, !dbg !80
  %sub12 = sub i32 %conv9, %conv11, !dbg !81
  %mul13 = mul i32 %sub8, %sub12, !dbg !82
  %sub14 = sub i32 %mul, %mul13, !dbg !83
  store i32 %sub14, i32* %cw, align 4, !dbg !84
  %9 = load i32, i32* %cw, align 4, !dbg !85
  %10 = bitcast i32* %cw to i8*, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #15, !dbg !86
  ret i32 %9, !dbg !87
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
define void @_Z18clockwise_verticesP11Triangle_2D(%struct.Triangle_2D* %triangle_2d) #3 !dbg !88 {
entry:
  %triangle_2d.addr = alloca %struct.Triangle_2D*, align 8
  %tmp_x = alloca i8, align 1
  %tmp_y = alloca i8, align 1
  store %struct.Triangle_2D* %triangle_2d, %struct.Triangle_2D** %triangle_2d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D** %triangle_2d.addr, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %tmp_x) #15, !dbg !94
  call void @llvm.dbg.declare(metadata i8* %tmp_x, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %tmp_y) #15, !dbg !94
  call void @llvm.dbg.declare(metadata i8* %tmp_y, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !99
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %0, i32 0, i32 0, !dbg !100
  %1 = load i8, i8* %x0, align 1, !dbg !100
  store i8 %1, i8* %tmp_x, align 1, !dbg !101
  %2 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !102
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %2, i32 0, i32 1, !dbg !103
  %3 = load i8, i8* %y0, align 1, !dbg !103
  store i8 %3, i8* %tmp_y, align 1, !dbg !104
  %4 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !105
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %4, i32 0, i32 2, !dbg !106
  %5 = load i8, i8* %x1, align 1, !dbg !106
  %6 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !107
  %x01 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %6, i32 0, i32 0, !dbg !108
  store i8 %5, i8* %x01, align 1, !dbg !109
  %7 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !110
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %7, i32 0, i32 3, !dbg !111
  %8 = load i8, i8* %y1, align 1, !dbg !111
  %9 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !112
  %y02 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %9, i32 0, i32 1, !dbg !113
  store i8 %8, i8* %y02, align 1, !dbg !114
  %10 = load i8, i8* %tmp_x, align 1, !dbg !115
  %11 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !116
  %x13 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %11, i32 0, i32 2, !dbg !117
  store i8 %10, i8* %x13, align 1, !dbg !118
  %12 = load i8, i8* %tmp_y, align 1, !dbg !119
  %13 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !120
  %y14 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %13, i32 0, i32 3, !dbg !121
  store i8 %12, i8* %y14, align 1, !dbg !122
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %tmp_y) #15, !dbg !123
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %tmp_x) #15, !dbg !123
  ret void, !dbg !123
}

; Function Attrs: nounwind
define zeroext i1 @_Z17pixel_in_trianglehh11Triangle_2D(i8 zeroext %x, i8 zeroext %y, %struct.Triangle_2D* byval align 1 %triangle_2d) #4 !dbg !124 {
entry:
  %x.addr = alloca i8, align 1
  %y.addr = alloca i8, align 1
  %pi0 = alloca i32, align 4
  %pi1 = alloca i32, align 4
  %pi2 = alloca i32, align 4
  store i8 %x, i8* %x.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %x.addr, metadata !128, metadata !DIExpression()), !dbg !129
  store i8 %y, i8* %y.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y.addr, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D* %triangle_2d, metadata !132, metadata !DIExpression()), !dbg !133
  %0 = bitcast i32* %pi0 to i8*, !dbg !134
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #15, !dbg !134
  call void @llvm.dbg.declare(metadata i32* %pi0, metadata !135, metadata !DIExpression()), !dbg !136
  %1 = bitcast i32* %pi1 to i8*, !dbg !134
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #15, !dbg !134
  call void @llvm.dbg.declare(metadata i32* %pi1, metadata !137, metadata !DIExpression()), !dbg !138
  %2 = bitcast i32* %pi2 to i8*, !dbg !134
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #15, !dbg !134
  call void @llvm.dbg.declare(metadata i32* %pi2, metadata !139, metadata !DIExpression()), !dbg !140
  %3 = load i8, i8* %x.addr, align 1, !dbg !141
  %conv = zext i8 %3 to i32, !dbg !141
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !142
  %4 = load i8, i8* %x0, align 1, !dbg !142
  %conv1 = zext i8 %4 to i32, !dbg !143
  %sub = sub i32 %conv, %conv1, !dbg !144
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !145
  %5 = load i8, i8* %y1, align 1, !dbg !145
  %conv2 = zext i8 %5 to i32, !dbg !146
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !147
  %6 = load i8, i8* %y0, align 1, !dbg !147
  %conv3 = zext i8 %6 to i32, !dbg !148
  %sub4 = sub i32 %conv2, %conv3, !dbg !149
  %mul = mul i32 %sub, %sub4, !dbg !150
  %7 = load i8, i8* %y.addr, align 1, !dbg !151
  %conv5 = zext i8 %7 to i32, !dbg !151
  %y06 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !152
  %8 = load i8, i8* %y06, align 1, !dbg !152
  %conv7 = zext i8 %8 to i32, !dbg !153
  %sub8 = sub i32 %conv5, %conv7, !dbg !154
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !155
  %9 = load i8, i8* %x1, align 1, !dbg !155
  %conv9 = zext i8 %9 to i32, !dbg !156
  %x010 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !157
  %10 = load i8, i8* %x010, align 1, !dbg !157
  %conv11 = zext i8 %10 to i32, !dbg !158
  %sub12 = sub i32 %conv9, %conv11, !dbg !159
  %mul13 = mul i32 %sub8, %sub12, !dbg !160
  %sub14 = sub i32 %mul, %mul13, !dbg !161
  store i32 %sub14, i32* %pi0, align 4, !dbg !162
  %11 = load i8, i8* %x.addr, align 1, !dbg !163
  %conv15 = zext i8 %11 to i32, !dbg !163
  %x116 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !164
  %12 = load i8, i8* %x116, align 1, !dbg !164
  %conv17 = zext i8 %12 to i32, !dbg !165
  %sub18 = sub i32 %conv15, %conv17, !dbg !166
  %y2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !167
  %13 = load i8, i8* %y2, align 1, !dbg !167
  %conv19 = zext i8 %13 to i32, !dbg !168
  %y120 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !169
  %14 = load i8, i8* %y120, align 1, !dbg !169
  %conv21 = zext i8 %14 to i32, !dbg !170
  %sub22 = sub i32 %conv19, %conv21, !dbg !171
  %mul23 = mul i32 %sub18, %sub22, !dbg !172
  %15 = load i8, i8* %y.addr, align 1, !dbg !173
  %conv24 = zext i8 %15 to i32, !dbg !173
  %y125 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !174
  %16 = load i8, i8* %y125, align 1, !dbg !174
  %conv26 = zext i8 %16 to i32, !dbg !175
  %sub27 = sub i32 %conv24, %conv26, !dbg !176
  %x2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !177
  %17 = load i8, i8* %x2, align 1, !dbg !177
  %conv28 = zext i8 %17 to i32, !dbg !178
  %x129 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !179
  %18 = load i8, i8* %x129, align 1, !dbg !179
  %conv30 = zext i8 %18 to i32, !dbg !180
  %sub31 = sub i32 %conv28, %conv30, !dbg !181
  %mul32 = mul i32 %sub27, %sub31, !dbg !182
  %sub33 = sub i32 %mul23, %mul32, !dbg !183
  store i32 %sub33, i32* %pi1, align 4, !dbg !184
  %19 = load i8, i8* %x.addr, align 1, !dbg !185
  %conv34 = zext i8 %19 to i32, !dbg !185
  %x235 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !186
  %20 = load i8, i8* %x235, align 1, !dbg !186
  %conv36 = zext i8 %20 to i32, !dbg !187
  %sub37 = sub i32 %conv34, %conv36, !dbg !188
  %y038 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !189
  %21 = load i8, i8* %y038, align 1, !dbg !189
  %conv39 = zext i8 %21 to i32, !dbg !190
  %y240 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !191
  %22 = load i8, i8* %y240, align 1, !dbg !191
  %conv41 = zext i8 %22 to i32, !dbg !192
  %sub42 = sub i32 %conv39, %conv41, !dbg !193
  %mul43 = mul i32 %sub37, %sub42, !dbg !194
  %23 = load i8, i8* %y.addr, align 1, !dbg !195
  %conv44 = zext i8 %23 to i32, !dbg !195
  %y245 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !196
  %24 = load i8, i8* %y245, align 1, !dbg !196
  %conv46 = zext i8 %24 to i32, !dbg !197
  %sub47 = sub i32 %conv44, %conv46, !dbg !198
  %x048 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !199
  %25 = load i8, i8* %x048, align 1, !dbg !199
  %conv49 = zext i8 %25 to i32, !dbg !200
  %x250 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !201
  %26 = load i8, i8* %x250, align 1, !dbg !201
  %conv51 = zext i8 %26 to i32, !dbg !202
  %sub52 = sub i32 %conv49, %conv51, !dbg !203
  %mul53 = mul i32 %sub47, %sub52, !dbg !204
  %sub54 = sub i32 %mul43, %mul53, !dbg !205
  store i32 %sub54, i32* %pi2, align 4, !dbg !206
  %27 = load i32, i32* %pi0, align 4, !dbg !207
  %cmp = icmp sge i32 %27, 0, !dbg !208
  br i1 %cmp, label %land.lhs.true, label %land.end, !dbg !209

land.lhs.true:                                    ; preds = %entry
  %28 = load i32, i32* %pi1, align 4, !dbg !210
  %cmp55 = icmp sge i32 %28, 0, !dbg !211
  br i1 %cmp55, label %land.rhs, label %land.end, !dbg !212

land.rhs:                                         ; preds = %land.lhs.true
  %29 = load i32, i32* %pi2, align 4, !dbg !213
  %cmp56 = icmp sge i32 %29, 0, !dbg !214
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %entry
  %30 = phi i1 [ false, %land.lhs.true ], [ false, %entry ], [ %cmp56, %land.rhs ]
  %31 = bitcast i32* %pi2 to i8*, !dbg !215
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %31) #15, !dbg !215
  %32 = bitcast i32* %pi1 to i8*, !dbg !215
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #15, !dbg !215
  %33 = bitcast i32* %pi0 to i8*, !dbg !215
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %33) #15, !dbg !215
  ret i1 %30, !dbg !216
}

; Function Attrs: nounwind
define zeroext i8 @_Z8find_minhhh(i8 zeroext %in0, i8 zeroext %in1, i8 zeroext %in2) #5 !dbg !217 {
entry:
  %retval = alloca i8, align 1
  %in0.addr = alloca i8, align 1
  %in1.addr = alloca i8, align 1
  %in2.addr = alloca i8, align 1
  store i8 %in0, i8* %in0.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %in0.addr, metadata !220, metadata !DIExpression()), !dbg !221
  store i8 %in1, i8* %in1.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %in1.addr, metadata !222, metadata !DIExpression()), !dbg !223
  store i8 %in2, i8* %in2.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %in2.addr, metadata !224, metadata !DIExpression()), !dbg !225
  %0 = load i8, i8* %in0.addr, align 1, !dbg !226
  %conv = zext i8 %0 to i32, !dbg !226
  %1 = load i8, i8* %in1.addr, align 1, !dbg !228
  %conv1 = zext i8 %1 to i32, !dbg !228
  %cmp = icmp slt i32 %conv, %conv1, !dbg !229
  br i1 %cmp, label %if.then, label %if.else6, !dbg !230

if.then:                                          ; preds = %entry
  %2 = load i8, i8* %in0.addr, align 1, !dbg !231
  %conv2 = zext i8 %2 to i32, !dbg !231
  %3 = load i8, i8* %in2.addr, align 1, !dbg !234
  %conv3 = zext i8 %3 to i32, !dbg !234
  %cmp4 = icmp slt i32 %conv2, %conv3, !dbg !235
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !236

if.then5:                                         ; preds = %if.then
  %4 = load i8, i8* %in0.addr, align 1, !dbg !237
  store i8 %4, i8* %retval, align 1, !dbg !238
  br label %return, !dbg !238

if.else:                                          ; preds = %if.then
  %5 = load i8, i8* %in2.addr, align 1, !dbg !239
  store i8 %5, i8* %retval, align 1, !dbg !240
  br label %return, !dbg !240

if.else6:                                         ; preds = %entry
  %6 = load i8, i8* %in1.addr, align 1, !dbg !241
  %conv7 = zext i8 %6 to i32, !dbg !241
  %7 = load i8, i8* %in2.addr, align 1, !dbg !244
  %conv8 = zext i8 %7 to i32, !dbg !244
  %cmp9 = icmp slt i32 %conv7, %conv8, !dbg !245
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !246

if.then10:                                        ; preds = %if.else6
  %8 = load i8, i8* %in1.addr, align 1, !dbg !247
  store i8 %8, i8* %retval, align 1, !dbg !248
  br label %return, !dbg !248

if.else11:                                        ; preds = %if.else6
  %9 = load i8, i8* %in2.addr, align 1, !dbg !249
  store i8 %9, i8* %retval, align 1, !dbg !250
  br label %return, !dbg !250

return:                                           ; preds = %if.else11, %if.then10, %if.else, %if.then5
  %10 = load i8, i8* %retval, align 1, !dbg !251
  ret i8 %10, !dbg !251
}

; Function Attrs: nounwind
define zeroext i8 @_Z8find_maxhhh(i8 zeroext %in0, i8 zeroext %in1, i8 zeroext %in2) #6 !dbg !252 {
entry:
  %retval = alloca i8, align 1
  %in0.addr = alloca i8, align 1
  %in1.addr = alloca i8, align 1
  %in2.addr = alloca i8, align 1
  store i8 %in0, i8* %in0.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %in0.addr, metadata !253, metadata !DIExpression()), !dbg !254
  store i8 %in1, i8* %in1.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %in1.addr, metadata !255, metadata !DIExpression()), !dbg !256
  store i8 %in2, i8* %in2.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %in2.addr, metadata !257, metadata !DIExpression()), !dbg !258
  %0 = load i8, i8* %in0.addr, align 1, !dbg !259
  %conv = zext i8 %0 to i32, !dbg !259
  %1 = load i8, i8* %in1.addr, align 1, !dbg !261
  %conv1 = zext i8 %1 to i32, !dbg !261
  %cmp = icmp sgt i32 %conv, %conv1, !dbg !262
  br i1 %cmp, label %if.then, label %if.else6, !dbg !263

if.then:                                          ; preds = %entry
  %2 = load i8, i8* %in0.addr, align 1, !dbg !264
  %conv2 = zext i8 %2 to i32, !dbg !264
  %3 = load i8, i8* %in2.addr, align 1, !dbg !267
  %conv3 = zext i8 %3 to i32, !dbg !267
  %cmp4 = icmp sgt i32 %conv2, %conv3, !dbg !268
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !269

if.then5:                                         ; preds = %if.then
  %4 = load i8, i8* %in0.addr, align 1, !dbg !270
  store i8 %4, i8* %retval, align 1, !dbg !271
  br label %return, !dbg !271

if.else:                                          ; preds = %if.then
  %5 = load i8, i8* %in2.addr, align 1, !dbg !272
  store i8 %5, i8* %retval, align 1, !dbg !273
  br label %return, !dbg !273

if.else6:                                         ; preds = %entry
  %6 = load i8, i8* %in1.addr, align 1, !dbg !274
  %conv7 = zext i8 %6 to i32, !dbg !274
  %7 = load i8, i8* %in2.addr, align 1, !dbg !277
  %conv8 = zext i8 %7 to i32, !dbg !277
  %cmp9 = icmp sgt i32 %conv7, %conv8, !dbg !278
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !279

if.then10:                                        ; preds = %if.else6
  %8 = load i8, i8* %in1.addr, align 1, !dbg !280
  store i8 %8, i8* %retval, align 1, !dbg !281
  br label %return, !dbg !281

if.else11:                                        ; preds = %if.else6
  %9 = load i8, i8* %in2.addr, align 1, !dbg !282
  store i8 %9, i8* %retval, align 1, !dbg !283
  br label %return, !dbg !283

return:                                           ; preds = %if.else11, %if.then10, %if.else, %if.then5
  %10 = load i8, i8* %retval, align 1, !dbg !284
  ret i8 %10, !dbg !284
}

; Function Attrs: nounwind
define void @_Z10projection11Triangle_3DP11Triangle_2Di(%struct.Triangle_3D* byval align 1 %triangle_3d, %struct.Triangle_2D* %triangle_2d, i32 %angle) #7 !dbg !285 {
entry:
  %triangle_2d.addr = alloca %struct.Triangle_2D*, align 8
  %angle.addr = alloca i32, align 4
  call void @llvm.dbg.declare(metadata %struct.Triangle_3D* %triangle_3d, metadata !300, metadata !DIExpression()), !dbg !301
  store %struct.Triangle_2D* %triangle_2d, %struct.Triangle_2D** %triangle_2d.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D** %triangle_2d.addr, metadata !302, metadata !DIExpression()), !dbg !303
  store i32 %angle, i32* %angle.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %angle.addr, metadata !304, metadata !DIExpression()), !dbg !305
  %0 = load i32, i32* %angle.addr, align 4, !dbg !306
  %cmp = icmp eq i32 %0, 0, !dbg !308
  br i1 %cmp, label %if.then, label %if.else, !dbg !309

if.then:                                          ; preds = %entry
  %x0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 0, !dbg !310
  %1 = load i8, i8* %x0, align 1, !dbg !310
  %2 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !312
  %x01 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %2, i32 0, i32 0, !dbg !313
  store i8 %1, i8* %x01, align 1, !dbg !314
  %y0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 1, !dbg !315
  %3 = load i8, i8* %y0, align 1, !dbg !315
  %4 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !316
  %y02 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %4, i32 0, i32 1, !dbg !317
  store i8 %3, i8* %y02, align 1, !dbg !318
  %x1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 3, !dbg !319
  %5 = load i8, i8* %x1, align 1, !dbg !319
  %6 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !320
  %x13 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %6, i32 0, i32 2, !dbg !321
  store i8 %5, i8* %x13, align 1, !dbg !322
  %y1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 4, !dbg !323
  %7 = load i8, i8* %y1, align 1, !dbg !323
  %8 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !324
  %y14 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %8, i32 0, i32 3, !dbg !325
  store i8 %7, i8* %y14, align 1, !dbg !326
  %x2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 6, !dbg !327
  %9 = load i8, i8* %x2, align 1, !dbg !327
  %10 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !328
  %x25 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %10, i32 0, i32 4, !dbg !329
  store i8 %9, i8* %x25, align 1, !dbg !330
  %y2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 7, !dbg !331
  %11 = load i8, i8* %y2, align 1, !dbg !331
  %12 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !332
  %y26 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %12, i32 0, i32 5, !dbg !333
  store i8 %11, i8* %y26, align 1, !dbg !334
  %z0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 2, !dbg !335
  %13 = load i8, i8* %z0, align 1, !dbg !335
  %conv = zext i8 %13 to i32, !dbg !336
  %div = sdiv i32 %conv, 3, !dbg !337
  %z1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 5, !dbg !338
  %14 = load i8, i8* %z1, align 1, !dbg !338
  %conv7 = zext i8 %14 to i32, !dbg !339
  %div8 = sdiv i32 %conv7, 3, !dbg !340
  %add = add i32 %div, %div8, !dbg !341
  %z2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 8, !dbg !342
  %15 = load i8, i8* %z2, align 1, !dbg !342
  %conv9 = zext i8 %15 to i32, !dbg !343
  %div10 = sdiv i32 %conv9, 3, !dbg !344
  %add11 = add i32 %add, %div10, !dbg !345
  %conv12 = trunc i32 %add11 to i8, !dbg !336
  %16 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !346
  %z = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %16, i32 0, i32 6, !dbg !347
  store i8 %conv12, i8* %z, align 1, !dbg !348
  br label %if.end69, !dbg !349

if.else:                                          ; preds = %entry
  %17 = load i32, i32* %angle.addr, align 4, !dbg !350
  %cmp13 = icmp eq i32 %17, 1, !dbg !352
  br i1 %cmp13, label %if.then14, label %if.else40, !dbg !353

if.then14:                                        ; preds = %if.else
  %x015 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 0, !dbg !354
  %18 = load i8, i8* %x015, align 1, !dbg !354
  %19 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !356
  %x016 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %19, i32 0, i32 0, !dbg !357
  store i8 %18, i8* %x016, align 1, !dbg !358
  %z017 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 2, !dbg !359
  %20 = load i8, i8* %z017, align 1, !dbg !359
  %21 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !360
  %y018 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %21, i32 0, i32 1, !dbg !361
  store i8 %20, i8* %y018, align 1, !dbg !362
  %x119 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 3, !dbg !363
  %22 = load i8, i8* %x119, align 1, !dbg !363
  %23 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !364
  %x120 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %23, i32 0, i32 2, !dbg !365
  store i8 %22, i8* %x120, align 1, !dbg !366
  %z121 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 5, !dbg !367
  %24 = load i8, i8* %z121, align 1, !dbg !367
  %25 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !368
  %y122 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %25, i32 0, i32 3, !dbg !369
  store i8 %24, i8* %y122, align 1, !dbg !370
  %x223 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 6, !dbg !371
  %26 = load i8, i8* %x223, align 1, !dbg !371
  %27 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !372
  %x224 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %27, i32 0, i32 4, !dbg !373
  store i8 %26, i8* %x224, align 1, !dbg !374
  %z225 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 8, !dbg !375
  %28 = load i8, i8* %z225, align 1, !dbg !375
  %29 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !376
  %y226 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %29, i32 0, i32 5, !dbg !377
  store i8 %28, i8* %y226, align 1, !dbg !378
  %y027 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 1, !dbg !379
  %30 = load i8, i8* %y027, align 1, !dbg !379
  %conv28 = zext i8 %30 to i32, !dbg !380
  %div29 = sdiv i32 %conv28, 3, !dbg !381
  %y130 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 4, !dbg !382
  %31 = load i8, i8* %y130, align 1, !dbg !382
  %conv31 = zext i8 %31 to i32, !dbg !383
  %div32 = sdiv i32 %conv31, 3, !dbg !384
  %add33 = add i32 %div29, %div32, !dbg !385
  %y234 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 7, !dbg !386
  %32 = load i8, i8* %y234, align 1, !dbg !386
  %conv35 = zext i8 %32 to i32, !dbg !387
  %div36 = sdiv i32 %conv35, 3, !dbg !388
  %add37 = add i32 %add33, %div36, !dbg !389
  %conv38 = trunc i32 %add37 to i8, !dbg !380
  %33 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !390
  %z39 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %33, i32 0, i32 6, !dbg !391
  store i8 %conv38, i8* %z39, align 1, !dbg !392
  br label %if.end68, !dbg !393

if.else40:                                        ; preds = %if.else
  %34 = load i32, i32* %angle.addr, align 4, !dbg !394
  %cmp41 = icmp eq i32 %34, 2, !dbg !396
  br i1 %cmp41, label %if.then42, label %if.end, !dbg !397

if.then42:                                        ; preds = %if.else40
  %z043 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 2, !dbg !398
  %35 = load i8, i8* %z043, align 1, !dbg !398
  %36 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !400
  %x044 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %36, i32 0, i32 0, !dbg !401
  store i8 %35, i8* %x044, align 1, !dbg !402
  %y045 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 1, !dbg !403
  %37 = load i8, i8* %y045, align 1, !dbg !403
  %38 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !404
  %y046 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %38, i32 0, i32 1, !dbg !405
  store i8 %37, i8* %y046, align 1, !dbg !406
  %z147 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 5, !dbg !407
  %39 = load i8, i8* %z147, align 1, !dbg !407
  %40 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !408
  %x148 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %40, i32 0, i32 2, !dbg !409
  store i8 %39, i8* %x148, align 1, !dbg !410
  %y149 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 4, !dbg !411
  %41 = load i8, i8* %y149, align 1, !dbg !411
  %42 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !412
  %y150 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %42, i32 0, i32 3, !dbg !413
  store i8 %41, i8* %y150, align 1, !dbg !414
  %z251 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 8, !dbg !415
  %43 = load i8, i8* %z251, align 1, !dbg !415
  %44 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !416
  %x252 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %44, i32 0, i32 4, !dbg !417
  store i8 %43, i8* %x252, align 1, !dbg !418
  %y253 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 7, !dbg !419
  %45 = load i8, i8* %y253, align 1, !dbg !419
  %46 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !420
  %y254 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %46, i32 0, i32 5, !dbg !421
  store i8 %45, i8* %y254, align 1, !dbg !422
  %x055 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 0, !dbg !423
  %47 = load i8, i8* %x055, align 1, !dbg !423
  %conv56 = zext i8 %47 to i32, !dbg !424
  %div57 = sdiv i32 %conv56, 3, !dbg !425
  %x158 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 3, !dbg !426
  %48 = load i8, i8* %x158, align 1, !dbg !426
  %conv59 = zext i8 %48 to i32, !dbg !427
  %div60 = sdiv i32 %conv59, 3, !dbg !428
  %add61 = add i32 %div57, %div60, !dbg !429
  %x262 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %triangle_3d, i32 0, i32 6, !dbg !430
  %49 = load i8, i8* %x262, align 1, !dbg !430
  %conv63 = zext i8 %49 to i32, !dbg !431
  %div64 = sdiv i32 %conv63, 3, !dbg !432
  %add65 = add i32 %add61, %div64, !dbg !433
  %conv66 = trunc i32 %add65 to i8, !dbg !424
  %50 = load %struct.Triangle_2D*, %struct.Triangle_2D** %triangle_2d.addr, align 8, !dbg !434
  %z67 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %50, i32 0, i32 6, !dbg !435
  store i8 %conv66, i8* %z67, align 1, !dbg !436
  br label %if.end, !dbg !437

if.end:                                           ; preds = %if.then42, %if.else40
  br label %if.end68

if.end68:                                         ; preds = %if.end, %if.then14
  br label %if.end69

if.end69:                                         ; preds = %if.end68, %if.then
  ret void, !dbg !438
}

; Function Attrs: nounwind
define zeroext i1 @_Z14rasterization111Triangle_2DPhPi(%struct.Triangle_2D* byval align 1 %triangle_2d, i8* %max_min, i32* %max_index) #8 !dbg !439 {
entry:
  %retval = alloca i1, align 1
  %max_min.addr = alloca i8*, align 8
  %max_index.addr = alloca i32*, align 8
  %agg.tmp = alloca %struct.Triangle_2D, align 1
  %agg.tmp1 = alloca %struct.Triangle_2D, align 1
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D* %triangle_2d, metadata !444, metadata !DIExpression()), !dbg !445
  store i8* %max_min, i8** %max_min.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %max_min.addr, metadata !446, metadata !DIExpression()), !dbg !447
  store i32* %max_index, i32** %max_index.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %max_index.addr, metadata !448, metadata !DIExpression()), !dbg !449
  %0 = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, align 1, !dbg !450
  store %struct.Triangle_2D %0, %struct.Triangle_2D* %agg.tmp, align 1, !dbg !450
  %call = call i32 @_Z15check_clockwise11Triangle_2D(%struct.Triangle_2D* byval align 1 %agg.tmp), !dbg !452
  %cmp = icmp eq i32 %call, 0, !dbg !453
  br i1 %cmp, label %if.then, label %if.end, !dbg !454

if.then:                                          ; preds = %entry
  store i1 true, i1* %retval, align 1, !dbg !455
  br label %return, !dbg !455

if.end:                                           ; preds = %entry
  %1 = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, align 1, !dbg !456
  store %struct.Triangle_2D %1, %struct.Triangle_2D* %agg.tmp1, align 1, !dbg !456
  %call2 = call i32 @_Z15check_clockwise11Triangle_2D(%struct.Triangle_2D* byval align 1 %agg.tmp1), !dbg !458
  %cmp3 = icmp slt i32 %call2, 0, !dbg !459
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !460

if.then4:                                         ; preds = %if.end
  call void @_Z18clockwise_verticesP11Triangle_2D(%struct.Triangle_2D* %triangle_2d), !dbg !461
  br label %if.end5, !dbg !461

if.end5:                                          ; preds = %if.then4, %if.end
  %x0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !462
  %2 = load i8, i8* %x0, align 1, !dbg !462
  %x1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !463
  %3 = load i8, i8* %x1, align 1, !dbg !463
  %x2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !464
  %4 = load i8, i8* %x2, align 1, !dbg !464
  %call6 = call zeroext i8 @_Z8find_minhhh(i8 zeroext %2, i8 zeroext %3, i8 zeroext %4), !dbg !465
  %5 = load i8*, i8** %max_min.addr, align 8, !dbg !466
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !466
  store i8 %call6, i8* %arrayidx, align 1, !dbg !467
  %x07 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 0, !dbg !468
  %6 = load i8, i8* %x07, align 1, !dbg !468
  %x18 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 2, !dbg !469
  %7 = load i8, i8* %x18, align 1, !dbg !469
  %x29 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 4, !dbg !470
  %8 = load i8, i8* %x29, align 1, !dbg !470
  %call10 = call zeroext i8 @_Z8find_maxhhh(i8 zeroext %6, i8 zeroext %7, i8 zeroext %8), !dbg !471
  %9 = load i8*, i8** %max_min.addr, align 8, !dbg !472
  %arrayidx11 = getelementptr inbounds i8, i8* %9, i64 1, !dbg !472
  store i8 %call10, i8* %arrayidx11, align 1, !dbg !473
  %y0 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !474
  %10 = load i8, i8* %y0, align 1, !dbg !474
  %y1 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !475
  %11 = load i8, i8* %y1, align 1, !dbg !475
  %y2 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !476
  %12 = load i8, i8* %y2, align 1, !dbg !476
  %call12 = call zeroext i8 @_Z8find_minhhh(i8 zeroext %10, i8 zeroext %11, i8 zeroext %12), !dbg !477
  %13 = load i8*, i8** %max_min.addr, align 8, !dbg !478
  %arrayidx13 = getelementptr inbounds i8, i8* %13, i64 2, !dbg !478
  store i8 %call12, i8* %arrayidx13, align 1, !dbg !479
  %y014 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 1, !dbg !480
  %14 = load i8, i8* %y014, align 1, !dbg !480
  %y115 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 3, !dbg !481
  %15 = load i8, i8* %y115, align 1, !dbg !481
  %y216 = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 5, !dbg !482
  %16 = load i8, i8* %y216, align 1, !dbg !482
  %call17 = call zeroext i8 @_Z8find_maxhhh(i8 zeroext %14, i8 zeroext %15, i8 zeroext %16), !dbg !483
  %17 = load i8*, i8** %max_min.addr, align 8, !dbg !484
  %arrayidx18 = getelementptr inbounds i8, i8* %17, i64 3, !dbg !484
  store i8 %call17, i8* %arrayidx18, align 1, !dbg !485
  %18 = load i8*, i8** %max_min.addr, align 8, !dbg !486
  %arrayidx19 = getelementptr inbounds i8, i8* %18, i64 1, !dbg !486
  %19 = load i8, i8* %arrayidx19, align 1, !dbg !486
  %conv = zext i8 %19 to i32, !dbg !486
  %20 = load i8*, i8** %max_min.addr, align 8, !dbg !487
  %arrayidx20 = getelementptr inbounds i8, i8* %20, i64 0, !dbg !487
  %21 = load i8, i8* %arrayidx20, align 1, !dbg !487
  %conv21 = zext i8 %21 to i32, !dbg !487
  %sub = sub i32 %conv, %conv21, !dbg !488
  %conv22 = trunc i32 %sub to i8, !dbg !486
  %22 = load i8*, i8** %max_min.addr, align 8, !dbg !489
  %arrayidx23 = getelementptr inbounds i8, i8* %22, i64 4, !dbg !489
  store i8 %conv22, i8* %arrayidx23, align 1, !dbg !490
  %23 = load i8*, i8** %max_min.addr, align 8, !dbg !491
  %arrayidx24 = getelementptr inbounds i8, i8* %23, i64 1, !dbg !491
  %24 = load i8, i8* %arrayidx24, align 1, !dbg !491
  %conv25 = zext i8 %24 to i32, !dbg !491
  %25 = load i8*, i8** %max_min.addr, align 8, !dbg !492
  %arrayidx26 = getelementptr inbounds i8, i8* %25, i64 0, !dbg !492
  %26 = load i8, i8* %arrayidx26, align 1, !dbg !492
  %conv27 = zext i8 %26 to i32, !dbg !492
  %sub28 = sub i32 %conv25, %conv27, !dbg !493
  %27 = load i8*, i8** %max_min.addr, align 8, !dbg !494
  %arrayidx29 = getelementptr inbounds i8, i8* %27, i64 3, !dbg !494
  %28 = load i8, i8* %arrayidx29, align 1, !dbg !494
  %conv30 = zext i8 %28 to i32, !dbg !494
  %29 = load i8*, i8** %max_min.addr, align 8, !dbg !495
  %arrayidx31 = getelementptr inbounds i8, i8* %29, i64 2, !dbg !495
  %30 = load i8, i8* %arrayidx31, align 1, !dbg !495
  %conv32 = zext i8 %30 to i32, !dbg !495
  %sub33 = sub i32 %conv30, %conv32, !dbg !496
  %mul = mul i32 %sub28, %sub33, !dbg !497
  %31 = load i32*, i32** %max_index.addr, align 8, !dbg !498
  %arrayidx34 = getelementptr inbounds i32, i32* %31, i64 0, !dbg !498
  store i32 %mul, i32* %arrayidx34, align 4, !dbg !499
  store i1 false, i1* %retval, align 1, !dbg !500
  br label %return, !dbg !500

return:                                           ; preds = %if.end5, %if.then
  %32 = load i1, i1* %retval, align 1, !dbg !501
  ret i1 %32, !dbg !501
}

; Function Attrs: nounwind
define i32 @_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel(i1 zeroext %flag, i8* %max_min, i32* %max_index, %struct.Triangle_2D* byval align 1 %triangle_2d, %struct.CandidatePixel* %fragment) #9 !dbg !502 {
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
  call void @llvm.dbg.declare(metadata i1* %flag.addr, metadata !505, metadata !DIExpression()), !dbg !506
  store i8* %max_min, i8** %max_min.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %max_min.addr, metadata !507, metadata !DIExpression()), !dbg !508
  store i32* %max_index, i32** %max_index.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %max_index.addr, metadata !509, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D* %triangle_2d, metadata !511, metadata !DIExpression()), !dbg !512
  store %struct.CandidatePixel* %fragment, %struct.CandidatePixel** %fragment.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.CandidatePixel** %fragment.addr, metadata !513, metadata !DIExpression()), !dbg !514
  %0 = load i1, i1* %flag.addr, align 1, !dbg !515
  br i1 %0, label %if.then, label %if.end, !dbg !517

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !518
  br label %return, !dbg !518

if.end:                                           ; preds = %entry
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %color) #15, !dbg !520
  call void @llvm.dbg.declare(metadata i8* %color, metadata !521, metadata !DIExpression()), !dbg !522
  store i8 100, i8* %color, align 1, !dbg !522
  %1 = bitcast i32* %i to i8*, !dbg !523
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #15, !dbg !523
  call void @llvm.dbg.declare(metadata i32* %i, metadata !524, metadata !DIExpression()), !dbg !525
  store i32 0, i32* %i, align 4, !dbg !525
  br label %RAST2, !dbg !523

RAST2:                                            ; preds = %if.end
  %2 = bitcast i32* %k to i8*, !dbg !526
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #15, !dbg !526
  call void @llvm.dbg.declare(metadata i32* %k, metadata !528, metadata !DIExpression()), !dbg !529
  store i32 0, i32* %k, align 4, !dbg !529
  br label %for.cond, !dbg !526

for.cond:                                         ; preds = %for.inc, %RAST2
  %3 = load i32, i32* %k, align 4, !dbg !530
  %4 = load i32*, i32** %max_index.addr, align 8, !dbg !532
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 0, !dbg !532
  %5 = load i32, i32* %arrayidx, align 4, !dbg !532
  %cmp = icmp slt i32 %3, %5, !dbg !533
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !534

for.cond.cleanup:                                 ; preds = %for.cond
  %6 = bitcast i32* %k to i8*, !dbg !535
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #15, !dbg !535
  br label %for.end

for.body:                                         ; preds = %for.cond
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %x) #15, !dbg !536
  call void @llvm.dbg.declare(metadata i8* %x, metadata !538, metadata !DIExpression()), !dbg !539
  %7 = load i8*, i8** %max_min.addr, align 8, !dbg !540
  %arrayidx1 = getelementptr inbounds i8, i8* %7, i64 0, !dbg !540
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !540
  %conv = zext i8 %8 to i32, !dbg !540
  %9 = load i32, i32* %k, align 4, !dbg !541
  %10 = load i8*, i8** %max_min.addr, align 8, !dbg !542
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 4, !dbg !542
  %11 = load i8, i8* %arrayidx2, align 1, !dbg !542
  %conv3 = zext i8 %11 to i32, !dbg !542
  %rem = srem i32 %9, %conv3, !dbg !543
  %add = add i32 %conv, %rem, !dbg !544
  %conv4 = trunc i32 %add to i8, !dbg !540
  store i8 %conv4, i8* %x, align 1, !dbg !539
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %y) #15, !dbg !545
  call void @llvm.dbg.declare(metadata i8* %y, metadata !546, metadata !DIExpression()), !dbg !547
  %12 = load i8*, i8** %max_min.addr, align 8, !dbg !548
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 2, !dbg !548
  %13 = load i8, i8* %arrayidx5, align 1, !dbg !548
  %conv6 = zext i8 %13 to i32, !dbg !548
  %14 = load i32, i32* %k, align 4, !dbg !549
  %15 = load i8*, i8** %max_min.addr, align 8, !dbg !550
  %arrayidx7 = getelementptr inbounds i8, i8* %15, i64 4, !dbg !550
  %16 = load i8, i8* %arrayidx7, align 1, !dbg !550
  %conv8 = zext i8 %16 to i32, !dbg !550
  %div = sdiv i32 %14, %conv8, !dbg !551
  %add9 = add i32 %conv6, %div, !dbg !552
  %conv10 = trunc i32 %add9 to i8, !dbg !548
  store i8 %conv10, i8* %y, align 1, !dbg !547
  %17 = load i8, i8* %x, align 1, !dbg !553
  %18 = load i8, i8* %y, align 1, !dbg !555
  %19 = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, align 1, !dbg !556
  store %struct.Triangle_2D %19, %struct.Triangle_2D* %agg.tmp, align 1, !dbg !556
  %call = call zeroext i1 @_Z17pixel_in_trianglehh11Triangle_2D(i8 zeroext %17, i8 zeroext %18, %struct.Triangle_2D* byval align 1 %agg.tmp), !dbg !557
  br i1 %call, label %if.then11, label %if.end23, !dbg !558

if.then11:                                        ; preds = %for.body
  %20 = load i8, i8* %x, align 1, !dbg !559
  %21 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragment.addr, align 8, !dbg !561
  %22 = load i32, i32* %i, align 4, !dbg !562
  %idxprom = sext i32 %22 to i64, !dbg !561
  %arrayidx12 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %21, i64 %idxprom, !dbg !561
  %x13 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx12, i32 0, i32 0, !dbg !563
  store i8 %20, i8* %x13, align 1, !dbg !564
  %23 = load i8, i8* %y, align 1, !dbg !565
  %24 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragment.addr, align 8, !dbg !566
  %25 = load i32, i32* %i, align 4, !dbg !567
  %idxprom14 = sext i32 %25 to i64, !dbg !566
  %arrayidx15 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %24, i64 %idxprom14, !dbg !566
  %y16 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx15, i32 0, i32 1, !dbg !568
  store i8 %23, i8* %y16, align 1, !dbg !569
  %z = getelementptr inbounds %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2d, i32 0, i32 6, !dbg !570
  %26 = load i8, i8* %z, align 1, !dbg !570
  %27 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragment.addr, align 8, !dbg !571
  %28 = load i32, i32* %i, align 4, !dbg !572
  %idxprom17 = sext i32 %28 to i64, !dbg !571
  %arrayidx18 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %27, i64 %idxprom17, !dbg !571
  %z19 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx18, i32 0, i32 2, !dbg !573
  store i8 %26, i8* %z19, align 1, !dbg !574
  %29 = load i8, i8* %color, align 1, !dbg !575
  %30 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragment.addr, align 8, !dbg !576
  %31 = load i32, i32* %i, align 4, !dbg !577
  %idxprom20 = sext i32 %31 to i64, !dbg !576
  %arrayidx21 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %30, i64 %idxprom20, !dbg !576
  %color22 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx21, i32 0, i32 3, !dbg !578
  store i8 %29, i8* %color22, align 1, !dbg !579
  %32 = load i32, i32* %i, align 4, !dbg !580
  %inc = add i32 %32, 1, !dbg !580
  store i32 %inc, i32* %i, align 4, !dbg !580
  br label %if.end23, !dbg !581

if.end23:                                         ; preds = %if.then11, %for.body
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %y) #15, !dbg !582
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %x) #15, !dbg !582
  br label %for.inc, !dbg !583

for.inc:                                          ; preds = %if.end23
  %33 = load i32, i32* %k, align 4, !dbg !584
  %inc24 = add i32 %33, 1, !dbg !584
  store i32 %inc24, i32* %k, align 4, !dbg !584
  br label %for.cond, !dbg !535, !llvm.loop !585

for.end:                                          ; preds = %for.cond.cleanup
  %34 = load i32, i32* %i, align 4, !dbg !588
  store i32 %34, i32* %retval, align 4, !dbg !589
  %35 = bitcast i32* %i to i8*, !dbg !590
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %35) #15, !dbg !590
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %color) #15, !dbg !590
  br label %return

return:                                           ; preds = %for.end, %if.then
  %36 = load i32, i32* %retval, align 4, !dbg !590
  ret i32 %36, !dbg !590
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
  call void @llvm.dbg.declare(metadata i32* %counter.addr, metadata !591, metadata !DIExpression()), !dbg !592
  store %struct.CandidatePixel* %fragments, %struct.CandidatePixel** %fragments.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.CandidatePixel** %fragments.addr, metadata !593, metadata !DIExpression()), !dbg !594
  store i32 %size, i32* %size.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %size.addr, metadata !595, metadata !DIExpression()), !dbg !596
  store %struct.Pixel* %pixels, %struct.Pixel** %pixels.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Pixel** %pixels.addr, metadata !597, metadata !DIExpression()), !dbg !598
  %0 = load i32, i32* %counter.addr, align 4, !dbg !599
  %cmp = icmp eq i32 %0, 0, !dbg !601
  br i1 %cmp, label %if.then, label %if.end, !dbg !602

if.then:                                          ; preds = %entry
  br label %ZCULLING_INIT_ROW, !dbg !603

ZCULLING_INIT_ROW:                                ; preds = %if.then
  %1 = bitcast i32* %i to i8*, !dbg !604
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #15, !dbg !604
  call void @llvm.dbg.declare(metadata i32* %i, metadata !607, metadata !DIExpression()), !dbg !608
  store i32 0, i32* %i, align 4, !dbg !608
  br label %for.cond, !dbg !604

for.cond:                                         ; preds = %for.inc8, %ZCULLING_INIT_ROW
  %2 = load i32, i32* %i, align 4, !dbg !609
  %cmp1 = icmp slt i32 %2, 256, !dbg !611
  br i1 %cmp1, label %for.body, label %for.cond.cleanup, !dbg !612

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 3, i32* %cleanup.dest.slot, align 4
  %3 = bitcast i32* %i to i8*, !dbg !613
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %3) #15, !dbg !613
  br label %for.end10

for.body:                                         ; preds = %for.cond
  br label %ZCULLING_INIT_COL, !dbg !614

ZCULLING_INIT_COL:                                ; preds = %for.body
  %4 = bitcast i32* %j to i8*, !dbg !615
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #15, !dbg !615
  call void @llvm.dbg.declare(metadata i32* %j, metadata !618, metadata !DIExpression()), !dbg !619
  store i32 0, i32* %j, align 4, !dbg !619
  br label %for.cond2, !dbg !615

for.cond2:                                        ; preds = %for.inc, %ZCULLING_INIT_COL
  %5 = load i32, i32* %j, align 4, !dbg !620
  %cmp3 = icmp slt i32 %5, 256, !dbg !622
  br i1 %cmp3, label %for.body5, label %for.cond.cleanup4, !dbg !623

for.cond.cleanup4:                                ; preds = %for.cond2
  store i32 7, i32* %cleanup.dest.slot, align 4
  %6 = bitcast i32* %j to i8*, !dbg !624
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #15, !dbg !624
  br label %for.end

for.body5:                                        ; preds = %for.cond2
  %7 = load i32, i32* %i, align 4, !dbg !625
  %idxprom = sext i32 %7 to i64, !dbg !627
  %arrayidx = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom, !dbg !627
  %8 = load i32, i32* %j, align 4, !dbg !628
  %idxprom6 = sext i32 %8 to i64, !dbg !627
  %arrayidx7 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx, i64 0, i64 %idxprom6, !dbg !627
  store i8 -1, i8* %arrayidx7, align 1, !dbg !629
  br label %for.inc, !dbg !630

for.inc:                                          ; preds = %for.body5
  %9 = load i32, i32* %j, align 4, !dbg !631
  %inc = add i32 %9, 1, !dbg !631
  store i32 %inc, i32* %j, align 4, !dbg !631
  br label %for.cond2, !dbg !624, !llvm.loop !632

for.end:                                          ; preds = %for.cond.cleanup4
  br label %for.inc8, !dbg !635

for.inc8:                                         ; preds = %for.end
  %10 = load i32, i32* %i, align 4, !dbg !636
  %inc9 = add i32 %10, 1, !dbg !636
  store i32 %inc9, i32* %i, align 4, !dbg !636
  br label %for.cond, !dbg !613, !llvm.loop !637

for.end10:                                        ; preds = %for.cond.cleanup
  br label %if.end, !dbg !640

if.end:                                           ; preds = %for.end10, %entry
  %11 = bitcast i32* %pixel_cntr to i8*, !dbg !641
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #15, !dbg !641
  call void @llvm.dbg.declare(metadata i32* %pixel_cntr, metadata !642, metadata !DIExpression()), !dbg !643
  store i32 0, i32* %pixel_cntr, align 4, !dbg !643
  br label %ZCULLING, !dbg !641

ZCULLING:                                         ; preds = %if.end
  %12 = bitcast i32* %n to i8*, !dbg !644
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #15, !dbg !644
  call void @llvm.dbg.declare(metadata i32* %n, metadata !646, metadata !DIExpression()), !dbg !647
  store i32 0, i32* %n, align 4, !dbg !647
  br label %for.cond11, !dbg !644

for.cond11:                                       ; preds = %for.inc60, %ZCULLING
  %13 = load i32, i32* %n, align 4, !dbg !648
  %14 = load i32, i32* %size.addr, align 4, !dbg !650
  %cmp12 = icmp slt i32 %13, %14, !dbg !651
  br i1 %cmp12, label %for.body14, label %for.cond.cleanup13, !dbg !652

for.cond.cleanup13:                               ; preds = %for.cond11
  store i32 11, i32* %cleanup.dest.slot, align 4
  %15 = bitcast i32* %n to i8*, !dbg !653
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #15, !dbg !653
  br label %for.end62

for.body14:                                       ; preds = %for.cond11
  %16 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !654
  %17 = load i32, i32* %n, align 4, !dbg !657
  %idxprom15 = sext i32 %17 to i64, !dbg !654
  %arrayidx16 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %16, i64 %idxprom15, !dbg !654
  %z = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx16, i32 0, i32 2, !dbg !658
  %18 = load i8, i8* %z, align 1, !dbg !658
  %conv = zext i8 %18 to i32, !dbg !654
  %19 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !659
  %20 = load i32, i32* %n, align 4, !dbg !660
  %idxprom17 = sext i32 %20 to i64, !dbg !659
  %arrayidx18 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %19, i64 %idxprom17, !dbg !659
  %y = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx18, i32 0, i32 1, !dbg !661
  %21 = load i8, i8* %y, align 1, !dbg !661
  %idxprom19 = zext i8 %21 to i64, !dbg !662
  %arrayidx20 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom19, !dbg !662
  %22 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !663
  %23 = load i32, i32* %n, align 4, !dbg !664
  %idxprom21 = sext i32 %23 to i64, !dbg !663
  %arrayidx22 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %22, i64 %idxprom21, !dbg !663
  %x = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx22, i32 0, i32 0, !dbg !665
  %24 = load i8, i8* %x, align 1, !dbg !665
  %idxprom23 = zext i8 %24 to i64, !dbg !662
  %arrayidx24 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx20, i64 0, i64 %idxprom23, !dbg !662
  %25 = load i8, i8* %arrayidx24, align 1, !dbg !662
  %conv25 = zext i8 %25 to i32, !dbg !662
  %cmp26 = icmp slt i32 %conv, %conv25, !dbg !666
  br i1 %cmp26, label %if.then27, label %if.end59, !dbg !667

if.then27:                                        ; preds = %for.body14
  %26 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !668
  %27 = load i32, i32* %n, align 4, !dbg !670
  %idxprom28 = sext i32 %27 to i64, !dbg !668
  %arrayidx29 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %26, i64 %idxprom28, !dbg !668
  %x30 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx29, i32 0, i32 0, !dbg !671
  %28 = load i8, i8* %x30, align 1, !dbg !671
  %29 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8, !dbg !672
  %30 = load i32, i32* %pixel_cntr, align 4, !dbg !673
  %idxprom31 = sext i32 %30 to i64, !dbg !672
  %arrayidx32 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %29, i64 %idxprom31, !dbg !672
  %x33 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx32, i32 0, i32 0, !dbg !674
  store i8 %28, i8* %x33, align 1, !dbg !675
  %31 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !676
  %32 = load i32, i32* %n, align 4, !dbg !677
  %idxprom34 = sext i32 %32 to i64, !dbg !676
  %arrayidx35 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %31, i64 %idxprom34, !dbg !676
  %y36 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx35, i32 0, i32 1, !dbg !678
  %33 = load i8, i8* %y36, align 1, !dbg !678
  %34 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8, !dbg !679
  %35 = load i32, i32* %pixel_cntr, align 4, !dbg !680
  %idxprom37 = sext i32 %35 to i64, !dbg !679
  %arrayidx38 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %34, i64 %idxprom37, !dbg !679
  %y39 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx38, i32 0, i32 1, !dbg !681
  store i8 %33, i8* %y39, align 1, !dbg !682
  %36 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !683
  %37 = load i32, i32* %n, align 4, !dbg !684
  %idxprom40 = sext i32 %37 to i64, !dbg !683
  %arrayidx41 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %36, i64 %idxprom40, !dbg !683
  %color = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx41, i32 0, i32 3, !dbg !685
  %38 = load i8, i8* %color, align 1, !dbg !685
  %39 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8, !dbg !686
  %40 = load i32, i32* %pixel_cntr, align 4, !dbg !687
  %idxprom42 = sext i32 %40 to i64, !dbg !686
  %arrayidx43 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %39, i64 %idxprom42, !dbg !686
  %color44 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx43, i32 0, i32 2, !dbg !688
  store i8 %38, i8* %color44, align 1, !dbg !689
  %41 = load i32, i32* %pixel_cntr, align 4, !dbg !690
  %inc45 = add i32 %41, 1, !dbg !690
  store i32 %inc45, i32* %pixel_cntr, align 4, !dbg !690
  %42 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !691
  %43 = load i32, i32* %n, align 4, !dbg !692
  %idxprom46 = sext i32 %43 to i64, !dbg !691
  %arrayidx47 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %42, i64 %idxprom46, !dbg !691
  %z48 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx47, i32 0, i32 2, !dbg !693
  %44 = load i8, i8* %z48, align 1, !dbg !693
  %45 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !694
  %46 = load i32, i32* %n, align 4, !dbg !695
  %idxprom49 = sext i32 %46 to i64, !dbg !694
  %arrayidx50 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %45, i64 %idxprom49, !dbg !694
  %y51 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx50, i32 0, i32 1, !dbg !696
  %47 = load i8, i8* %y51, align 1, !dbg !696
  %idxprom52 = zext i8 %47 to i64, !dbg !697
  %arrayidx53 = getelementptr inbounds [256 x [256 x i8]], [256 x [256 x i8]]* @_ZZ8zcullingiP14CandidatePixeliP5PixelE8z_buffer, i64 0, i64 %idxprom52, !dbg !697
  %48 = load %struct.CandidatePixel*, %struct.CandidatePixel** %fragments.addr, align 8, !dbg !698
  %49 = load i32, i32* %n, align 4, !dbg !699
  %idxprom54 = sext i32 %49 to i64, !dbg !698
  %arrayidx55 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %48, i64 %idxprom54, !dbg !698
  %x56 = getelementptr inbounds %struct.CandidatePixel, %struct.CandidatePixel* %arrayidx55, i32 0, i32 0, !dbg !700
  %50 = load i8, i8* %x56, align 1, !dbg !700
  %idxprom57 = zext i8 %50 to i64, !dbg !697
  %arrayidx58 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx53, i64 0, i64 %idxprom57, !dbg !697
  store i8 %44, i8* %arrayidx58, align 1, !dbg !701
  br label %if.end59, !dbg !702

if.end59:                                         ; preds = %if.then27, %for.body14
  br label %for.inc60, !dbg !703

for.inc60:                                        ; preds = %if.end59
  %51 = load i32, i32* %n, align 4, !dbg !704
  %inc61 = add i32 %51, 1, !dbg !704
  store i32 %inc61, i32* %n, align 4, !dbg !704
  br label %for.cond11, !dbg !653, !llvm.loop !705

for.end62:                                        ; preds = %for.cond.cleanup13
  %52 = load i32, i32* %pixel_cntr, align 4, !dbg !708
  store i32 1, i32* %cleanup.dest.slot, align 4
  %53 = bitcast i32* %pixel_cntr to i8*, !dbg !709
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %53) #15, !dbg !709
  ret i32 %52, !dbg !710
}

; Function Attrs: nounwind
define void @_Z10coloringFBiiP5PixelPA256_h(i32 %counter, i32 %size_pixels, %struct.Pixel* %pixels, [256 x i8]* "fpga.decayed.dim.hint"="256" %frame_buffer) #11 !dbg !711 {
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
  call void @llvm.dbg.declare(metadata i32* %counter.addr, metadata !717, metadata !DIExpression()), !dbg !718
  store i32 %size_pixels, i32* %size_pixels.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %size_pixels.addr, metadata !719, metadata !DIExpression()), !dbg !720
  store %struct.Pixel* %pixels, %struct.Pixel** %pixels.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Pixel** %pixels.addr, metadata !721, metadata !DIExpression()), !dbg !722
  store [256 x i8]* %frame_buffer, [256 x i8]** %frame_buffer.addr, align 8
  call void @llvm.dbg.declare(metadata [256 x i8]** %frame_buffer.addr, metadata !723, metadata !DIExpression()), !dbg !724
  %0 = load i32, i32* %counter.addr, align 4, !dbg !725
  %cmp = icmp eq i32 %0, 0, !dbg !727
  br i1 %cmp, label %if.then, label %if.end, !dbg !728

if.then:                                          ; preds = %entry
  br label %COLORING_FB_INIT_ROW, !dbg !729

COLORING_FB_INIT_ROW:                             ; preds = %if.then
  %1 = bitcast i32* %i to i8*, !dbg !730
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #15, !dbg !730
  call void @llvm.dbg.declare(metadata i32* %i, metadata !733, metadata !DIExpression()), !dbg !734
  store i32 0, i32* %i, align 4, !dbg !734
  br label %for.cond, !dbg !730

for.cond:                                         ; preds = %for.inc8, %COLORING_FB_INIT_ROW
  %2 = load i32, i32* %i, align 4, !dbg !735
  %cmp1 = icmp slt i32 %2, 256, !dbg !737
  br i1 %cmp1, label %for.body, label %for.cond.cleanup, !dbg !738

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 3, i32* %cleanup.dest.slot, align 4
  %3 = bitcast i32* %i to i8*, !dbg !739
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %3) #15, !dbg !739
  br label %for.end10

for.body:                                         ; preds = %for.cond
  br label %COLORING_FB_INIT_COL, !dbg !740

COLORING_FB_INIT_COL:                             ; preds = %for.body
  %4 = bitcast i32* %j to i8*, !dbg !741
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #15, !dbg !741
  call void @llvm.dbg.declare(metadata i32* %j, metadata !744, metadata !DIExpression()), !dbg !745
  store i32 0, i32* %j, align 4, !dbg !745
  br label %for.cond2, !dbg !741

for.cond2:                                        ; preds = %for.inc, %COLORING_FB_INIT_COL
  %5 = load i32, i32* %j, align 4, !dbg !746
  %cmp3 = icmp slt i32 %5, 256, !dbg !748
  br i1 %cmp3, label %for.body5, label %for.cond.cleanup4, !dbg !749

for.cond.cleanup4:                                ; preds = %for.cond2
  store i32 7, i32* %cleanup.dest.slot, align 4
  %6 = bitcast i32* %j to i8*, !dbg !750
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #15, !dbg !750
  br label %for.end

for.body5:                                        ; preds = %for.cond2
  %7 = load [256 x i8]*, [256 x i8]** %frame_buffer.addr, align 8, !dbg !751
  %8 = load i32, i32* %i, align 4, !dbg !752
  %idxprom = sext i32 %8 to i64, !dbg !751
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* %7, i64 %idxprom, !dbg !751
  %9 = load i32, i32* %j, align 4, !dbg !753
  %idxprom6 = sext i32 %9 to i64, !dbg !751
  %arrayidx7 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx, i64 0, i64 %idxprom6, !dbg !751
  store i8 0, i8* %arrayidx7, align 1, !dbg !754
  br label %for.inc, !dbg !751

for.inc:                                          ; preds = %for.body5
  %10 = load i32, i32* %j, align 4, !dbg !755
  %inc = add i32 %10, 1, !dbg !755
  store i32 %inc, i32* %j, align 4, !dbg !755
  br label %for.cond2, !dbg !750, !llvm.loop !756

for.end:                                          ; preds = %for.cond.cleanup4
  br label %for.inc8, !dbg !759

for.inc8:                                         ; preds = %for.end
  %11 = load i32, i32* %i, align 4, !dbg !760
  %inc9 = add i32 %11, 1, !dbg !760
  store i32 %inc9, i32* %i, align 4, !dbg !760
  br label %for.cond, !dbg !739, !llvm.loop !761

for.end10:                                        ; preds = %for.cond.cleanup
  br label %if.end, !dbg !764

if.end:                                           ; preds = %for.end10, %entry
  br label %COLORING_FB, !dbg !765

COLORING_FB:                                      ; preds = %if.end
  %12 = bitcast i32* %i11 to i8*, !dbg !766
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #15, !dbg !766
  call void @llvm.dbg.declare(metadata i32* %i11, metadata !768, metadata !DIExpression()), !dbg !769
  store i32 0, i32* %i11, align 4, !dbg !769
  br label %for.cond12, !dbg !766

for.cond12:                                       ; preds = %for.inc26, %COLORING_FB
  %13 = load i32, i32* %i11, align 4, !dbg !770
  %14 = load i32, i32* %size_pixels.addr, align 4, !dbg !772
  %cmp13 = icmp slt i32 %13, %14, !dbg !773
  br i1 %cmp13, label %for.body15, label %for.cond.cleanup14, !dbg !774

for.cond.cleanup14:                               ; preds = %for.cond12
  store i32 11, i32* %cleanup.dest.slot, align 4
  %15 = bitcast i32* %i11 to i8*, !dbg !775
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #15, !dbg !775
  br label %for.end28

for.body15:                                       ; preds = %for.cond12
  %16 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8, !dbg !776
  %17 = load i32, i32* %i11, align 4, !dbg !777
  %idxprom16 = sext i32 %17 to i64, !dbg !776
  %arrayidx17 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %16, i64 %idxprom16, !dbg !776
  %color = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx17, i32 0, i32 2, !dbg !778
  %18 = load i8, i8* %color, align 1, !dbg !778
  %19 = load [256 x i8]*, [256 x i8]** %frame_buffer.addr, align 8, !dbg !779
  %20 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8, !dbg !780
  %21 = load i32, i32* %i11, align 4, !dbg !781
  %idxprom18 = sext i32 %21 to i64, !dbg !780
  %arrayidx19 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %20, i64 %idxprom18, !dbg !780
  %x = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx19, i32 0, i32 0, !dbg !782
  %22 = load i8, i8* %x, align 1, !dbg !782
  %idxprom20 = zext i8 %22 to i64, !dbg !779
  %arrayidx21 = getelementptr inbounds [256 x i8], [256 x i8]* %19, i64 %idxprom20, !dbg !779
  %23 = load %struct.Pixel*, %struct.Pixel** %pixels.addr, align 8, !dbg !783
  %24 = load i32, i32* %i11, align 4, !dbg !784
  %idxprom22 = sext i32 %24 to i64, !dbg !783
  %arrayidx23 = getelementptr inbounds %struct.Pixel, %struct.Pixel* %23, i64 %idxprom22, !dbg !783
  %y = getelementptr inbounds %struct.Pixel, %struct.Pixel* %arrayidx23, i32 0, i32 1, !dbg !785
  %25 = load i8, i8* %y, align 1, !dbg !785
  %idxprom24 = zext i8 %25 to i64, !dbg !779
  %arrayidx25 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx21, i64 0, i64 %idxprom24, !dbg !779
  store i8 %18, i8* %arrayidx25, align 1, !dbg !786
  br label %for.inc26, !dbg !779

for.inc26:                                        ; preds = %for.body15
  %26 = load i32, i32* %i11, align 4, !dbg !787
  %inc27 = add i32 %26, 1, !dbg !787
  store i32 %inc27, i32* %i11, align 4, !dbg !787
  br label %for.cond12, !dbg !775, !llvm.loop !788

for.end28:                                        ; preds = %for.cond.cleanup14
  ret void, !dbg !791
}

; Function Attrs: nounwind
define void @_Z9renderingP11Triangle_3DPA256_h(%struct.Triangle_3D* "fpga.decayed.dim.hint"="3192" %triangle_3ds, [256 x i8]* "fpga.decayed.dim.hint"="256" %output) #12 !dbg !792 !fpga.function.pragma !796 {
entry:
  %triangle_3ds.addr = alloca %struct.Triangle_3D*, align 8
  %output.addr = alloca [256 x i8]*, align 8
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
  call void @llvm.dbg.declare(metadata %struct.Triangle_3D** %triangle_3ds.addr, metadata !799, metadata !DIExpression()), !dbg !800
  store [256 x i8]* %output, [256 x i8]** %output.addr, align 8
  call void @llvm.dbg.declare(metadata [256 x i8]** %output.addr, metadata !801, metadata !DIExpression()), !dbg !802
  %0 = bitcast %struct.Triangle_2D* %triangle_2ds to i8*, !dbg !803
  call void @llvm.lifetime.start.p0i8(i64 7, i8* %0) #15, !dbg !803
  call void @llvm.dbg.declare(metadata %struct.Triangle_2D* %triangle_2ds, metadata !804, metadata !DIExpression()), !dbg !805
  %1 = bitcast i32* %angle to i8*, !dbg !806
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #15, !dbg !806
  call void @llvm.dbg.declare(metadata i32* %angle, metadata !807, metadata !DIExpression()), !dbg !808
  store i32 0, i32* %angle, align 4, !dbg !808
  %2 = bitcast [5 x i8]* %max_min to i8*, !dbg !809
  call void @llvm.lifetime.start.p0i8(i64 5, i8* %2) #15, !dbg !809
  call void @llvm.dbg.declare(metadata [5 x i8]* %max_min, metadata !810, metadata !DIExpression()), !dbg !814
  %3 = bitcast [1 x i32]* %max_index to i8*, !dbg !815
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #15, !dbg !815
  call void @llvm.dbg.declare(metadata [1 x i32]* %max_index, metadata !816, metadata !DIExpression()), !dbg !820
  %4 = bitcast [500 x %struct.CandidatePixel]* %fragment to i8*, !dbg !821
  call void @llvm.lifetime.start.p0i8(i64 2000, i8* %4) #15, !dbg !821
  call void @llvm.dbg.declare(metadata [500 x %struct.CandidatePixel]* %fragment, metadata !822, metadata !DIExpression()), !dbg !826
  %5 = bitcast [500 x %struct.Pixel]* %pixels to i8*, !dbg !827
  call void @llvm.lifetime.start.p0i8(i64 1500, i8* %5) #15, !dbg !827
  call void @llvm.dbg.declare(metadata [500 x %struct.Pixel]* %pixels, metadata !828, metadata !DIExpression()), !dbg !830
  br label %TRIANGLES, !dbg !827

TRIANGLES:                                        ; preds = %entry
  %6 = bitcast i32* %i to i8*, !dbg !831
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #15, !dbg !831
  call void @llvm.dbg.declare(metadata i32* %i, metadata !833, metadata !DIExpression()), !dbg !834
  store i32 0, i32* %i, align 4, !dbg !834
  br label %for.cond, !dbg !831

for.cond:                                         ; preds = %for.inc, %TRIANGLES
  %7 = load i32, i32* %i, align 4, !dbg !835
  %cmp = icmp slt i32 %7, 3192, !dbg !837
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !838

for.cond.cleanup:                                 ; preds = %for.cond
  %8 = bitcast i32* %i to i8*, !dbg !839
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #15, !dbg !839
  br label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load %struct.Triangle_3D*, %struct.Triangle_3D** %triangle_3ds.addr, align 8, !dbg !840
  %10 = load i32, i32* %i, align 4, !dbg !842
  %idxprom = sext i32 %10 to i64, !dbg !840
  %arrayidx = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %9, i64 %idxprom, !dbg !840
  %11 = load %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx, align 1, !dbg !840
  store %struct.Triangle_3D %11, %struct.Triangle_3D* %agg.tmp, align 1, !dbg !840
  %12 = load i32, i32* %angle, align 4, !dbg !843
  call void @_Z10projection11Triangle_3DP11Triangle_2Di(%struct.Triangle_3D* byval align 1 %agg.tmp, %struct.Triangle_2D* %triangle_2ds, i32 %12), !dbg !844
  %13 = bitcast i1* %flag to i8*, !dbg !845
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %13) #15, !dbg !845
  call void @llvm.dbg.declare(metadata i1* %flag, metadata !846, metadata !DIExpression()), !dbg !847
  %14 = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2ds, align 1, !dbg !848
  store %struct.Triangle_2D %14, %struct.Triangle_2D* %agg.tmp1, align 1, !dbg !848
  %arraydecay = getelementptr inbounds [5 x i8], [5 x i8]* %max_min, i32 0, i32 0, !dbg !849
  %arraydecay2 = getelementptr inbounds [1 x i32], [1 x i32]* %max_index, i32 0, i32 0, !dbg !850
  %call = call zeroext i1 @_Z14rasterization111Triangle_2DPhPi(%struct.Triangle_2D* byval align 1 %agg.tmp1, i8* %arraydecay, i32* %arraydecay2), !dbg !851
  store i1 %call, i1* %flag, align 1, !dbg !847
  %15 = bitcast i32* %size_fragment to i8*, !dbg !852
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %15) #15, !dbg !852
  call void @llvm.dbg.declare(metadata i32* %size_fragment, metadata !853, metadata !DIExpression()), !dbg !854
  %16 = load i1, i1* %flag, align 1, !dbg !855
  %arraydecay3 = getelementptr inbounds [5 x i8], [5 x i8]* %max_min, i32 0, i32 0, !dbg !856
  %arraydecay4 = getelementptr inbounds [1 x i32], [1 x i32]* %max_index, i32 0, i32 0, !dbg !857
  %17 = load %struct.Triangle_2D, %struct.Triangle_2D* %triangle_2ds, align 1, !dbg !858
  store %struct.Triangle_2D %17, %struct.Triangle_2D* %agg.tmp5, align 1, !dbg !858
  %arraydecay6 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i32 0, i32 0, !dbg !859
  %call7 = call i32 @_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel(i1 zeroext %16, i8* %arraydecay3, i32* %arraydecay4, %struct.Triangle_2D* byval align 1 %agg.tmp5, %struct.CandidatePixel* %arraydecay6), !dbg !860
  store i32 %call7, i32* %size_fragment, align 4, !dbg !854
  %18 = bitcast i32* %size_pixels to i8*, !dbg !861
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %18) #15, !dbg !861
  call void @llvm.dbg.declare(metadata i32* %size_pixels, metadata !862, metadata !DIExpression()), !dbg !863
  %19 = load i32, i32* %i, align 4, !dbg !864
  %arraydecay8 = getelementptr inbounds [500 x %struct.CandidatePixel], [500 x %struct.CandidatePixel]* %fragment, i32 0, i32 0, !dbg !865
  %20 = load i32, i32* %size_fragment, align 4, !dbg !866
  %arraydecay9 = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i32 0, i32 0, !dbg !867
  %call10 = call i32 @_Z8zcullingiP14CandidatePixeliP5Pixel(i32 %19, %struct.CandidatePixel* %arraydecay8, i32 %20, %struct.Pixel* %arraydecay9), !dbg !868
  store i32 %call10, i32* %size_pixels, align 4, !dbg !863
  %21 = load i32, i32* %i, align 4, !dbg !869
  %22 = load i32, i32* %size_pixels, align 4, !dbg !870
  %arraydecay11 = getelementptr inbounds [500 x %struct.Pixel], [500 x %struct.Pixel]* %pixels, i32 0, i32 0, !dbg !871
  %23 = load [256 x i8]*, [256 x i8]** %output.addr, align 8, !dbg !872
  call void @_Z10coloringFBiiP5PixelPA256_h(i32 %21, i32 %22, %struct.Pixel* %arraydecay11, [256 x i8]* %23), !dbg !873
  %24 = bitcast i32* %size_pixels to i8*, !dbg !874
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %24) #15, !dbg !874
  %25 = bitcast i32* %size_fragment to i8*, !dbg !874
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %25) #15, !dbg !874
  %26 = bitcast i1* %flag to i8*, !dbg !874
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %26) #15, !dbg !874
  br label %for.inc, !dbg !875

for.inc:                                          ; preds = %for.body
  %27 = load i32, i32* %i, align 4, !dbg !876
  %inc = add i32 %27, 1, !dbg !876
  store i32 %inc, i32* %i, align 4, !dbg !876
  br label %for.cond, !dbg !839, !llvm.loop !877

for.end:                                          ; preds = %for.cond.cleanup
  %28 = bitcast [500 x %struct.Pixel]* %pixels to i8*, !dbg !880
  call void @llvm.lifetime.end.p0i8(i64 1500, i8* %28) #15, !dbg !880
  %29 = bitcast [500 x %struct.CandidatePixel]* %fragment to i8*, !dbg !880
  call void @llvm.lifetime.end.p0i8(i64 2000, i8* %29) #15, !dbg !880
  %30 = bitcast [1 x i32]* %max_index to i8*, !dbg !880
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %30) #15, !dbg !880
  %31 = bitcast [5 x i8]* %max_min to i8*, !dbg !880
  call void @llvm.lifetime.end.p0i8(i64 5, i8* %31) #15, !dbg !880
  %32 = bitcast i32* %angle to i8*, !dbg !880
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #15, !dbg !880
  %33 = bitcast %struct.Triangle_2D* %triangle_2ds to i8*, !dbg !880
  call void @llvm.lifetime.end.p0i8(i64 7, i8* %33) #15, !dbg !880
  ret void, !dbg !880
}

; Function Attrs: noinline norecurse optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #13 {
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

declare void @populateInput(i8*, %struct.Triangle_3D*) #14

declare void @populateOutput([256 x i8]*) #14

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
attributes #13 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { nounwind }

!llvm.dbg.cu = !{!25}
!llvm.ident = !{!39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39, !39}
!llvm.module.flags = !{!40, !41, !42}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "z_buffer", scope: !2, file: !3, line: 196, type: !36, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "zculling", linkageName: "_Z8zcullingiP14CandidatePixeliP5Pixel", scope: !3, file: !3, line: 193, type: !4, isLocal: false, isDefinition: true, scopeLine: 194, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!3 = !DIFile(filename: "benchmarks/rosetta/3d-rendering/src/rendering.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6, !7, !6, !18}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "CandidatePixel", file: !9, line: 57, baseType: !10)
!9 = !DIFile(filename: "benchmarks/rosetta/3d-rendering/src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !9, line: 51, size: 32, flags: DIFlagTypePassByValue, elements: !11, identifier: "_ZTS14CandidatePixel")
!11 = !{!12, !15, !16, !17}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !10, file: !9, line: 53, baseType: !13, size: 8)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "bit8", file: !9, line: 21, baseType: !14)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !10, file: !9, line: 54, baseType: !13, size: 8, offset: 8)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !10, file: !9, line: 55, baseType: !13, size: 8, offset: 16)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "color", scope: !10, file: !9, line: 56, baseType: !13, size: 8, offset: 24)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "Pixel", file: !9, line: 65, baseType: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !9, line: 60, size: 24, flags: DIFlagTypePassByValue, elements: !21, identifier: "_ZTS5Pixel")
!21 = !{!22, !23, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !20, file: !9, line: 62, baseType: !13, size: 8)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !20, file: !9, line: 63, baseType: !13, size: 8, offset: 8)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "color", scope: !20, file: !9, line: 64, baseType: !13, size: 8, offset: 16)
!25 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !26, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !27, globals: !28)
!26 = !DIFile(filename: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/rendering_ahls/solution1/.autopilot/db/rendering.pp.0.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!27 = !{}
!28 = !{!0, !29, !32, !34}
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression(DW_OP_constu, 256, DW_OP_stack_value))
!30 = distinct !DIGlobalVariable(name: "MAX_X", scope: !25, file: !9, line: 13, type: !31, isLocal: true, isDefinition: true)
!31 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression(DW_OP_constu, 256, DW_OP_stack_value))
!33 = distinct !DIGlobalVariable(name: "MAX_Y", scope: !25, file: !9, line: 14, type: !31, isLocal: true, isDefinition: true)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression(DW_OP_constu, 3192, DW_OP_stack_value))
!35 = distinct !DIGlobalVariable(name: "NUM_3D_TRI", scope: !25, file: !9, line: 19, type: !31, isLocal: true, isDefinition: true)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 524288, elements: !37)
!37 = !{!38, !38}
!38 = !DISubrange(count: 256)
!39 = !{!"clang version 7.0.0 "}
!40 = !{i32 2, !"Dwarf Version", i32 4}
!41 = !{i32 2, !"Debug Info Version", i32 3}
!42 = !{i32 1, !"wchar_size", i32 4}
!43 = distinct !DISubprogram(name: "check_clockwise", linkageName: "_Z15check_clockwise11Triangle_2D", scope: !3, file: !3, line: 18, type: !44, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!44 = !DISubroutineType(types: !45)
!45 = !{!6, !46}
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "Triangle_2D", file: !9, line: 48, baseType: !47)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !9, line: 39, size: 56, flags: DIFlagTypePassByValue, elements: !48, identifier: "_ZTS11Triangle_2D")
!48 = !{!49, !50, !51, !52, !53, !54, !55}
!49 = !DIDerivedType(tag: DW_TAG_member, name: "x0", scope: !47, file: !9, line: 41, baseType: !13, size: 8)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "y0", scope: !47, file: !9, line: 42, baseType: !13, size: 8, offset: 8)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "x1", scope: !47, file: !9, line: 43, baseType: !13, size: 8, offset: 16)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "y1", scope: !47, file: !9, line: 44, baseType: !13, size: 8, offset: 24)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "x2", scope: !47, file: !9, line: 45, baseType: !13, size: 8, offset: 32)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "y2", scope: !47, file: !9, line: 46, baseType: !13, size: 8, offset: 40)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !47, file: !9, line: 47, baseType: !13, size: 8, offset: 48)
!56 = !DILocalVariable(name: "triangle_2d", arg: 1, scope: !43, file: !3, line: 18, type: !46)
!57 = !DILocation(line: 18, column: 33, scope: !43)
!58 = !DILocation(line: 20, column: 3, scope: !43)
!59 = !DILocalVariable(name: "cw", scope: !43, file: !3, line: 20, type: !6)
!60 = !DILocation(line: 20, column: 7, scope: !43)
!61 = !DILocation(line: 22, column: 21, scope: !43)
!62 = !DILocation(line: 22, column: 9, scope: !43)
!63 = !DILocation(line: 22, column: 38, scope: !43)
!64 = !DILocation(line: 22, column: 26, scope: !43)
!65 = !DILocation(line: 22, column: 24, scope: !43)
!66 = !DILocation(line: 22, column: 57, scope: !43)
!67 = !DILocation(line: 22, column: 45, scope: !43)
!68 = !DILocation(line: 22, column: 74, scope: !43)
!69 = !DILocation(line: 22, column: 62, scope: !43)
!70 = !DILocation(line: 22, column: 60, scope: !43)
!71 = !DILocation(line: 22, column: 42, scope: !43)
!72 = !DILocation(line: 23, column: 23, scope: !43)
!73 = !DILocation(line: 23, column: 11, scope: !43)
!74 = !DILocation(line: 23, column: 40, scope: !43)
!75 = !DILocation(line: 23, column: 28, scope: !43)
!76 = !DILocation(line: 23, column: 26, scope: !43)
!77 = !DILocation(line: 23, column: 59, scope: !43)
!78 = !DILocation(line: 23, column: 47, scope: !43)
!79 = !DILocation(line: 23, column: 76, scope: !43)
!80 = !DILocation(line: 23, column: 64, scope: !43)
!81 = !DILocation(line: 23, column: 62, scope: !43)
!82 = !DILocation(line: 23, column: 44, scope: !43)
!83 = !DILocation(line: 23, column: 8, scope: !43)
!84 = !DILocation(line: 22, column: 6, scope: !43)
!85 = !DILocation(line: 25, column: 10, scope: !43)
!86 = !DILocation(line: 27, column: 1, scope: !43)
!87 = !DILocation(line: 25, column: 3, scope: !43)
!88 = distinct !DISubprogram(name: "clockwise_vertices", linkageName: "_Z18clockwise_verticesP11Triangle_2D", scope: !3, file: !3, line: 30, type: !89, isLocal: false, isDefinition: true, scopeLine: 31, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!89 = !DISubroutineType(types: !90)
!90 = !{null, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!92 = !DILocalVariable(name: "triangle_2d", arg: 1, scope: !88, file: !3, line: 30, type: !91)
!93 = !DILocation(line: 30, column: 38, scope: !88)
!94 = !DILocation(line: 32, column: 3, scope: !88)
!95 = !DILocalVariable(name: "tmp_x", scope: !88, file: !3, line: 32, type: !13)
!96 = !DILocation(line: 32, column: 8, scope: !88)
!97 = !DILocalVariable(name: "tmp_y", scope: !88, file: !3, line: 32, type: !13)
!98 = !DILocation(line: 32, column: 15, scope: !88)
!99 = !DILocation(line: 34, column: 11, scope: !88)
!100 = !DILocation(line: 34, column: 24, scope: !88)
!101 = !DILocation(line: 34, column: 9, scope: !88)
!102 = !DILocation(line: 35, column: 11, scope: !88)
!103 = !DILocation(line: 35, column: 24, scope: !88)
!104 = !DILocation(line: 35, column: 9, scope: !88)
!105 = !DILocation(line: 37, column: 21, scope: !88)
!106 = !DILocation(line: 37, column: 34, scope: !88)
!107 = !DILocation(line: 37, column: 3, scope: !88)
!108 = !DILocation(line: 37, column: 16, scope: !88)
!109 = !DILocation(line: 37, column: 19, scope: !88)
!110 = !DILocation(line: 38, column: 21, scope: !88)
!111 = !DILocation(line: 38, column: 34, scope: !88)
!112 = !DILocation(line: 38, column: 3, scope: !88)
!113 = !DILocation(line: 38, column: 16, scope: !88)
!114 = !DILocation(line: 38, column: 19, scope: !88)
!115 = !DILocation(line: 40, column: 21, scope: !88)
!116 = !DILocation(line: 40, column: 3, scope: !88)
!117 = !DILocation(line: 40, column: 16, scope: !88)
!118 = !DILocation(line: 40, column: 19, scope: !88)
!119 = !DILocation(line: 41, column: 21, scope: !88)
!120 = !DILocation(line: 41, column: 3, scope: !88)
!121 = !DILocation(line: 41, column: 16, scope: !88)
!122 = !DILocation(line: 41, column: 19, scope: !88)
!123 = !DILocation(line: 42, column: 1, scope: !88)
!124 = distinct !DISubprogram(name: "pixel_in_triangle", linkageName: "_Z17pixel_in_trianglehh11Triangle_2D", scope: !3, file: !3, line: 48, type: !125, isLocal: false, isDefinition: true, scopeLine: 49, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!125 = !DISubroutineType(types: !126)
!126 = !{!127, !13, !13, !46}
!127 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!128 = !DILocalVariable(name: "x", arg: 1, scope: !124, file: !3, line: 48, type: !13)
!129 = !DILocation(line: 48, column: 29, scope: !124)
!130 = !DILocalVariable(name: "y", arg: 2, scope: !124, file: !3, line: 48, type: !13)
!131 = !DILocation(line: 48, column: 37, scope: !124)
!132 = !DILocalVariable(name: "triangle_2d", arg: 3, scope: !124, file: !3, line: 48, type: !46)
!133 = !DILocation(line: 48, column: 52, scope: !124)
!134 = !DILocation(line: 50, column: 3, scope: !124)
!135 = !DILocalVariable(name: "pi0", scope: !124, file: !3, line: 50, type: !6)
!136 = !DILocation(line: 50, column: 7, scope: !124)
!137 = !DILocalVariable(name: "pi1", scope: !124, file: !3, line: 50, type: !6)
!138 = !DILocation(line: 50, column: 12, scope: !124)
!139 = !DILocalVariable(name: "pi2", scope: !124, file: !3, line: 50, type: !6)
!140 = !DILocation(line: 50, column: 17, scope: !124)
!141 = !DILocation(line: 52, column: 10, scope: !124)
!142 = !DILocation(line: 52, column: 26, scope: !124)
!143 = !DILocation(line: 52, column: 14, scope: !124)
!144 = !DILocation(line: 52, column: 12, scope: !124)
!145 = !DILocation(line: 52, column: 45, scope: !124)
!146 = !DILocation(line: 52, column: 33, scope: !124)
!147 = !DILocation(line: 52, column: 62, scope: !124)
!148 = !DILocation(line: 52, column: 50, scope: !124)
!149 = !DILocation(line: 52, column: 48, scope: !124)
!150 = !DILocation(line: 52, column: 30, scope: !124)
!151 = !DILocation(line: 52, column: 69, scope: !124)
!152 = !DILocation(line: 52, column: 85, scope: !124)
!153 = !DILocation(line: 52, column: 73, scope: !124)
!154 = !DILocation(line: 52, column: 71, scope: !124)
!155 = !DILocation(line: 52, column: 104, scope: !124)
!156 = !DILocation(line: 52, column: 92, scope: !124)
!157 = !DILocation(line: 52, column: 121, scope: !124)
!158 = !DILocation(line: 52, column: 109, scope: !124)
!159 = !DILocation(line: 52, column: 107, scope: !124)
!160 = !DILocation(line: 52, column: 89, scope: !124)
!161 = !DILocation(line: 52, column: 66, scope: !124)
!162 = !DILocation(line: 52, column: 7, scope: !124)
!163 = !DILocation(line: 53, column: 10, scope: !124)
!164 = !DILocation(line: 53, column: 26, scope: !124)
!165 = !DILocation(line: 53, column: 14, scope: !124)
!166 = !DILocation(line: 53, column: 12, scope: !124)
!167 = !DILocation(line: 53, column: 45, scope: !124)
!168 = !DILocation(line: 53, column: 33, scope: !124)
!169 = !DILocation(line: 53, column: 62, scope: !124)
!170 = !DILocation(line: 53, column: 50, scope: !124)
!171 = !DILocation(line: 53, column: 48, scope: !124)
!172 = !DILocation(line: 53, column: 30, scope: !124)
!173 = !DILocation(line: 53, column: 69, scope: !124)
!174 = !DILocation(line: 53, column: 85, scope: !124)
!175 = !DILocation(line: 53, column: 73, scope: !124)
!176 = !DILocation(line: 53, column: 71, scope: !124)
!177 = !DILocation(line: 53, column: 104, scope: !124)
!178 = !DILocation(line: 53, column: 92, scope: !124)
!179 = !DILocation(line: 53, column: 121, scope: !124)
!180 = !DILocation(line: 53, column: 109, scope: !124)
!181 = !DILocation(line: 53, column: 107, scope: !124)
!182 = !DILocation(line: 53, column: 89, scope: !124)
!183 = !DILocation(line: 53, column: 66, scope: !124)
!184 = !DILocation(line: 53, column: 7, scope: !124)
!185 = !DILocation(line: 54, column: 10, scope: !124)
!186 = !DILocation(line: 54, column: 26, scope: !124)
!187 = !DILocation(line: 54, column: 14, scope: !124)
!188 = !DILocation(line: 54, column: 12, scope: !124)
!189 = !DILocation(line: 54, column: 45, scope: !124)
!190 = !DILocation(line: 54, column: 33, scope: !124)
!191 = !DILocation(line: 54, column: 62, scope: !124)
!192 = !DILocation(line: 54, column: 50, scope: !124)
!193 = !DILocation(line: 54, column: 48, scope: !124)
!194 = !DILocation(line: 54, column: 30, scope: !124)
!195 = !DILocation(line: 54, column: 69, scope: !124)
!196 = !DILocation(line: 54, column: 85, scope: !124)
!197 = !DILocation(line: 54, column: 73, scope: !124)
!198 = !DILocation(line: 54, column: 71, scope: !124)
!199 = !DILocation(line: 54, column: 104, scope: !124)
!200 = !DILocation(line: 54, column: 92, scope: !124)
!201 = !DILocation(line: 54, column: 121, scope: !124)
!202 = !DILocation(line: 54, column: 109, scope: !124)
!203 = !DILocation(line: 54, column: 107, scope: !124)
!204 = !DILocation(line: 54, column: 89, scope: !124)
!205 = !DILocation(line: 54, column: 66, scope: !124)
!206 = !DILocation(line: 54, column: 7, scope: !124)
!207 = !DILocation(line: 56, column: 11, scope: !124)
!208 = !DILocation(line: 56, column: 15, scope: !124)
!209 = !DILocation(line: 56, column: 20, scope: !124)
!210 = !DILocation(line: 56, column: 23, scope: !124)
!211 = !DILocation(line: 56, column: 27, scope: !124)
!212 = !DILocation(line: 56, column: 32, scope: !124)
!213 = !DILocation(line: 56, column: 35, scope: !124)
!214 = !DILocation(line: 56, column: 39, scope: !124)
!215 = !DILocation(line: 57, column: 1, scope: !124)
!216 = !DILocation(line: 56, column: 3, scope: !124)
!217 = distinct !DISubprogram(name: "find_min", linkageName: "_Z8find_minhhh", scope: !3, file: !3, line: 60, type: !218, isLocal: false, isDefinition: true, scopeLine: 61, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!218 = !DISubroutineType(types: !219)
!219 = !{!13, !13, !13, !13}
!220 = !DILocalVariable(name: "in0", arg: 1, scope: !217, file: !3, line: 60, type: !13)
!221 = !DILocation(line: 60, column: 20, scope: !217)
!222 = !DILocalVariable(name: "in1", arg: 2, scope: !217, file: !3, line: 60, type: !13)
!223 = !DILocation(line: 60, column: 30, scope: !217)
!224 = !DILocalVariable(name: "in2", arg: 3, scope: !217, file: !3, line: 60, type: !13)
!225 = !DILocation(line: 60, column: 40, scope: !217)
!226 = !DILocation(line: 62, column: 7, scope: !227)
!227 = distinct !DILexicalBlock(scope: !217, file: !3, line: 62, column: 7)
!228 = !DILocation(line: 62, column: 13, scope: !227)
!229 = !DILocation(line: 62, column: 11, scope: !227)
!230 = !DILocation(line: 62, column: 7, scope: !217)
!231 = !DILocation(line: 64, column: 9, scope: !232)
!232 = distinct !DILexicalBlock(scope: !233, file: !3, line: 64, column: 9)
!233 = distinct !DILexicalBlock(scope: !227, file: !3, line: 63, column: 3)
!234 = !DILocation(line: 64, column: 15, scope: !232)
!235 = !DILocation(line: 64, column: 13, scope: !232)
!236 = !DILocation(line: 64, column: 9, scope: !233)
!237 = !DILocation(line: 65, column: 14, scope: !232)
!238 = !DILocation(line: 65, column: 7, scope: !232)
!239 = !DILocation(line: 67, column: 14, scope: !232)
!240 = !DILocation(line: 67, column: 7, scope: !232)
!241 = !DILocation(line: 71, column: 9, scope: !242)
!242 = distinct !DILexicalBlock(scope: !243, file: !3, line: 71, column: 9)
!243 = distinct !DILexicalBlock(scope: !227, file: !3, line: 70, column: 3)
!244 = !DILocation(line: 71, column: 15, scope: !242)
!245 = !DILocation(line: 71, column: 13, scope: !242)
!246 = !DILocation(line: 71, column: 9, scope: !243)
!247 = !DILocation(line: 72, column: 14, scope: !242)
!248 = !DILocation(line: 72, column: 7, scope: !242)
!249 = !DILocation(line: 74, column: 14, scope: !242)
!250 = !DILocation(line: 74, column: 7, scope: !242)
!251 = !DILocation(line: 76, column: 1, scope: !217)
!252 = distinct !DISubprogram(name: "find_max", linkageName: "_Z8find_maxhhh", scope: !3, file: !3, line: 79, type: !218, isLocal: false, isDefinition: true, scopeLine: 80, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!253 = !DILocalVariable(name: "in0", arg: 1, scope: !252, file: !3, line: 79, type: !13)
!254 = !DILocation(line: 79, column: 20, scope: !252)
!255 = !DILocalVariable(name: "in1", arg: 2, scope: !252, file: !3, line: 79, type: !13)
!256 = !DILocation(line: 79, column: 30, scope: !252)
!257 = !DILocalVariable(name: "in2", arg: 3, scope: !252, file: !3, line: 79, type: !13)
!258 = !DILocation(line: 79, column: 40, scope: !252)
!259 = !DILocation(line: 81, column: 7, scope: !260)
!260 = distinct !DILexicalBlock(scope: !252, file: !3, line: 81, column: 7)
!261 = !DILocation(line: 81, column: 13, scope: !260)
!262 = !DILocation(line: 81, column: 11, scope: !260)
!263 = !DILocation(line: 81, column: 7, scope: !252)
!264 = !DILocation(line: 83, column: 9, scope: !265)
!265 = distinct !DILexicalBlock(scope: !266, file: !3, line: 83, column: 9)
!266 = distinct !DILexicalBlock(scope: !260, file: !3, line: 82, column: 3)
!267 = !DILocation(line: 83, column: 15, scope: !265)
!268 = !DILocation(line: 83, column: 13, scope: !265)
!269 = !DILocation(line: 83, column: 9, scope: !266)
!270 = !DILocation(line: 84, column: 14, scope: !265)
!271 = !DILocation(line: 84, column: 7, scope: !265)
!272 = !DILocation(line: 86, column: 14, scope: !265)
!273 = !DILocation(line: 86, column: 7, scope: !265)
!274 = !DILocation(line: 90, column: 9, scope: !275)
!275 = distinct !DILexicalBlock(scope: !276, file: !3, line: 90, column: 9)
!276 = distinct !DILexicalBlock(scope: !260, file: !3, line: 89, column: 3)
!277 = !DILocation(line: 90, column: 15, scope: !275)
!278 = !DILocation(line: 90, column: 13, scope: !275)
!279 = !DILocation(line: 90, column: 9, scope: !276)
!280 = !DILocation(line: 91, column: 14, scope: !275)
!281 = !DILocation(line: 91, column: 7, scope: !275)
!282 = !DILocation(line: 93, column: 14, scope: !275)
!283 = !DILocation(line: 93, column: 7, scope: !275)
!284 = !DILocation(line: 95, column: 1, scope: !252)
!285 = distinct !DISubprogram(name: "projection", linkageName: "_Z10projection11Triangle_3DP11Triangle_2Di", scope: !3, file: !3, line: 100, type: !286, isLocal: false, isDefinition: true, scopeLine: 101, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!286 = !DISubroutineType(types: !287)
!287 = !{null, !288, !91, !6}
!288 = !DIDerivedType(tag: DW_TAG_typedef, name: "Triangle_3D", file: !9, line: 36, baseType: !289)
!289 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !9, line: 25, size: 72, flags: DIFlagTypePassByValue, elements: !290, identifier: "_ZTS11Triangle_3D")
!290 = !{!291, !292, !293, !294, !295, !296, !297, !298, !299}
!291 = !DIDerivedType(tag: DW_TAG_member, name: "x0", scope: !289, file: !9, line: 27, baseType: !13, size: 8)
!292 = !DIDerivedType(tag: DW_TAG_member, name: "y0", scope: !289, file: !9, line: 28, baseType: !13, size: 8, offset: 8)
!293 = !DIDerivedType(tag: DW_TAG_member, name: "z0", scope: !289, file: !9, line: 29, baseType: !13, size: 8, offset: 16)
!294 = !DIDerivedType(tag: DW_TAG_member, name: "x1", scope: !289, file: !9, line: 30, baseType: !13, size: 8, offset: 24)
!295 = !DIDerivedType(tag: DW_TAG_member, name: "y1", scope: !289, file: !9, line: 31, baseType: !13, size: 8, offset: 32)
!296 = !DIDerivedType(tag: DW_TAG_member, name: "z1", scope: !289, file: !9, line: 32, baseType: !13, size: 8, offset: 40)
!297 = !DIDerivedType(tag: DW_TAG_member, name: "x2", scope: !289, file: !9, line: 33, baseType: !13, size: 8, offset: 48)
!298 = !DIDerivedType(tag: DW_TAG_member, name: "y2", scope: !289, file: !9, line: 34, baseType: !13, size: 8, offset: 56)
!299 = !DIDerivedType(tag: DW_TAG_member, name: "z2", scope: !289, file: !9, line: 35, baseType: !13, size: 8, offset: 64)
!300 = !DILocalVariable(name: "triangle_3d", arg: 1, scope: !285, file: !3, line: 100, type: !288)
!301 = !DILocation(line: 100, column: 29, scope: !285)
!302 = !DILocalVariable(name: "triangle_2d", arg: 2, scope: !285, file: !3, line: 100, type: !91)
!303 = !DILocation(line: 100, column: 55, scope: !285)
!304 = !DILocalVariable(name: "angle", arg: 3, scope: !285, file: !3, line: 100, type: !6)
!305 = !DILocation(line: 100, column: 72, scope: !285)
!306 = !DILocation(line: 106, column: 6, scope: !307)
!307 = distinct !DILexicalBlock(scope: !285, file: !3, line: 106, column: 6)
!308 = !DILocation(line: 106, column: 12, scope: !307)
!309 = !DILocation(line: 106, column: 6, scope: !285)
!310 = !DILocation(line: 108, column: 35, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !3, line: 107, column: 3)
!312 = !DILocation(line: 108, column: 5, scope: !311)
!313 = !DILocation(line: 108, column: 18, scope: !311)
!314 = !DILocation(line: 108, column: 21, scope: !311)
!315 = !DILocation(line: 109, column: 35, scope: !311)
!316 = !DILocation(line: 109, column: 5, scope: !311)
!317 = !DILocation(line: 109, column: 18, scope: !311)
!318 = !DILocation(line: 109, column: 21, scope: !311)
!319 = !DILocation(line: 110, column: 35, scope: !311)
!320 = !DILocation(line: 110, column: 5, scope: !311)
!321 = !DILocation(line: 110, column: 18, scope: !311)
!322 = !DILocation(line: 110, column: 21, scope: !311)
!323 = !DILocation(line: 111, column: 35, scope: !311)
!324 = !DILocation(line: 111, column: 5, scope: !311)
!325 = !DILocation(line: 111, column: 18, scope: !311)
!326 = !DILocation(line: 111, column: 21, scope: !311)
!327 = !DILocation(line: 112, column: 35, scope: !311)
!328 = !DILocation(line: 112, column: 5, scope: !311)
!329 = !DILocation(line: 112, column: 18, scope: !311)
!330 = !DILocation(line: 112, column: 21, scope: !311)
!331 = !DILocation(line: 113, column: 35, scope: !311)
!332 = !DILocation(line: 113, column: 5, scope: !311)
!333 = !DILocation(line: 113, column: 18, scope: !311)
!334 = !DILocation(line: 113, column: 21, scope: !311)
!335 = !DILocation(line: 114, column: 34, scope: !311)
!336 = !DILocation(line: 114, column: 22, scope: !311)
!337 = !DILocation(line: 114, column: 37, scope: !311)
!338 = !DILocation(line: 114, column: 55, scope: !311)
!339 = !DILocation(line: 114, column: 43, scope: !311)
!340 = !DILocation(line: 114, column: 58, scope: !311)
!341 = !DILocation(line: 114, column: 41, scope: !311)
!342 = !DILocation(line: 114, column: 76, scope: !311)
!343 = !DILocation(line: 114, column: 64, scope: !311)
!344 = !DILocation(line: 114, column: 79, scope: !311)
!345 = !DILocation(line: 114, column: 62, scope: !311)
!346 = !DILocation(line: 114, column: 5, scope: !311)
!347 = !DILocation(line: 114, column: 18, scope: !311)
!348 = !DILocation(line: 114, column: 20, scope: !311)
!349 = !DILocation(line: 115, column: 3, scope: !311)
!350 = !DILocation(line: 117, column: 11, scope: !351)
!351 = distinct !DILexicalBlock(scope: !307, file: !3, line: 117, column: 11)
!352 = !DILocation(line: 117, column: 17, scope: !351)
!353 = !DILocation(line: 117, column: 11, scope: !307)
!354 = !DILocation(line: 119, column: 35, scope: !355)
!355 = distinct !DILexicalBlock(scope: !351, file: !3, line: 118, column: 3)
!356 = !DILocation(line: 119, column: 5, scope: !355)
!357 = !DILocation(line: 119, column: 18, scope: !355)
!358 = !DILocation(line: 119, column: 21, scope: !355)
!359 = !DILocation(line: 120, column: 35, scope: !355)
!360 = !DILocation(line: 120, column: 5, scope: !355)
!361 = !DILocation(line: 120, column: 18, scope: !355)
!362 = !DILocation(line: 120, column: 21, scope: !355)
!363 = !DILocation(line: 121, column: 35, scope: !355)
!364 = !DILocation(line: 121, column: 5, scope: !355)
!365 = !DILocation(line: 121, column: 18, scope: !355)
!366 = !DILocation(line: 121, column: 21, scope: !355)
!367 = !DILocation(line: 122, column: 35, scope: !355)
!368 = !DILocation(line: 122, column: 5, scope: !355)
!369 = !DILocation(line: 122, column: 18, scope: !355)
!370 = !DILocation(line: 122, column: 21, scope: !355)
!371 = !DILocation(line: 123, column: 35, scope: !355)
!372 = !DILocation(line: 123, column: 5, scope: !355)
!373 = !DILocation(line: 123, column: 18, scope: !355)
!374 = !DILocation(line: 123, column: 21, scope: !355)
!375 = !DILocation(line: 124, column: 35, scope: !355)
!376 = !DILocation(line: 124, column: 5, scope: !355)
!377 = !DILocation(line: 124, column: 18, scope: !355)
!378 = !DILocation(line: 124, column: 21, scope: !355)
!379 = !DILocation(line: 125, column: 34, scope: !355)
!380 = !DILocation(line: 125, column: 22, scope: !355)
!381 = !DILocation(line: 125, column: 37, scope: !355)
!382 = !DILocation(line: 125, column: 55, scope: !355)
!383 = !DILocation(line: 125, column: 43, scope: !355)
!384 = !DILocation(line: 125, column: 58, scope: !355)
!385 = !DILocation(line: 125, column: 41, scope: !355)
!386 = !DILocation(line: 125, column: 76, scope: !355)
!387 = !DILocation(line: 125, column: 64, scope: !355)
!388 = !DILocation(line: 125, column: 79, scope: !355)
!389 = !DILocation(line: 125, column: 62, scope: !355)
!390 = !DILocation(line: 125, column: 5, scope: !355)
!391 = !DILocation(line: 125, column: 18, scope: !355)
!392 = !DILocation(line: 125, column: 20, scope: !355)
!393 = !DILocation(line: 126, column: 3, scope: !355)
!394 = !DILocation(line: 128, column: 11, scope: !395)
!395 = distinct !DILexicalBlock(scope: !351, file: !3, line: 128, column: 11)
!396 = !DILocation(line: 128, column: 17, scope: !395)
!397 = !DILocation(line: 128, column: 11, scope: !351)
!398 = !DILocation(line: 130, column: 35, scope: !399)
!399 = distinct !DILexicalBlock(scope: !395, file: !3, line: 129, column: 3)
!400 = !DILocation(line: 130, column: 5, scope: !399)
!401 = !DILocation(line: 130, column: 18, scope: !399)
!402 = !DILocation(line: 130, column: 21, scope: !399)
!403 = !DILocation(line: 131, column: 35, scope: !399)
!404 = !DILocation(line: 131, column: 5, scope: !399)
!405 = !DILocation(line: 131, column: 18, scope: !399)
!406 = !DILocation(line: 131, column: 21, scope: !399)
!407 = !DILocation(line: 132, column: 35, scope: !399)
!408 = !DILocation(line: 132, column: 5, scope: !399)
!409 = !DILocation(line: 132, column: 18, scope: !399)
!410 = !DILocation(line: 132, column: 21, scope: !399)
!411 = !DILocation(line: 133, column: 35, scope: !399)
!412 = !DILocation(line: 133, column: 5, scope: !399)
!413 = !DILocation(line: 133, column: 18, scope: !399)
!414 = !DILocation(line: 133, column: 21, scope: !399)
!415 = !DILocation(line: 134, column: 35, scope: !399)
!416 = !DILocation(line: 134, column: 5, scope: !399)
!417 = !DILocation(line: 134, column: 18, scope: !399)
!418 = !DILocation(line: 134, column: 21, scope: !399)
!419 = !DILocation(line: 135, column: 35, scope: !399)
!420 = !DILocation(line: 135, column: 5, scope: !399)
!421 = !DILocation(line: 135, column: 18, scope: !399)
!422 = !DILocation(line: 135, column: 21, scope: !399)
!423 = !DILocation(line: 136, column: 34, scope: !399)
!424 = !DILocation(line: 136, column: 22, scope: !399)
!425 = !DILocation(line: 136, column: 37, scope: !399)
!426 = !DILocation(line: 136, column: 55, scope: !399)
!427 = !DILocation(line: 136, column: 43, scope: !399)
!428 = !DILocation(line: 136, column: 58, scope: !399)
!429 = !DILocation(line: 136, column: 41, scope: !399)
!430 = !DILocation(line: 136, column: 76, scope: !399)
!431 = !DILocation(line: 136, column: 64, scope: !399)
!432 = !DILocation(line: 136, column: 79, scope: !399)
!433 = !DILocation(line: 136, column: 62, scope: !399)
!434 = !DILocation(line: 136, column: 5, scope: !399)
!435 = !DILocation(line: 136, column: 18, scope: !399)
!436 = !DILocation(line: 136, column: 20, scope: !399)
!437 = !DILocation(line: 137, column: 3, scope: !399)
!438 = !DILocation(line: 138, column: 1, scope: !285)
!439 = distinct !DISubprogram(name: "rasterization1", linkageName: "_Z14rasterization111Triangle_2DPhPi", scope: !3, file: !3, line: 141, type: !440, isLocal: false, isDefinition: true, scopeLine: 142, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!440 = !DISubroutineType(types: !441)
!441 = !{!127, !46, !442, !443}
!442 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!443 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!444 = !DILocalVariable(name: "triangle_2d", arg: 1, scope: !439, file: !3, line: 141, type: !46)
!445 = !DILocation(line: 141, column: 33, scope: !439)
!446 = !DILocalVariable(name: "max_min", arg: 2, scope: !439, file: !3, line: 141, type: !442)
!447 = !DILocation(line: 141, column: 51, scope: !439)
!448 = !DILocalVariable(name: "max_index", arg: 3, scope: !439, file: !3, line: 141, type: !443)
!449 = !DILocation(line: 141, column: 66, scope: !439)
!450 = !DILocation(line: 144, column: 25, scope: !451)
!451 = distinct !DILexicalBlock(scope: !439, file: !3, line: 144, column: 8)
!452 = !DILocation(line: 144, column: 8, scope: !451)
!453 = !DILocation(line: 144, column: 39, scope: !451)
!454 = !DILocation(line: 144, column: 8, scope: !439)
!455 = !DILocation(line: 145, column: 5, scope: !451)
!456 = !DILocation(line: 146, column: 25, scope: !457)
!457 = distinct !DILexicalBlock(scope: !439, file: !3, line: 146, column: 8)
!458 = !DILocation(line: 146, column: 8, scope: !457)
!459 = !DILocation(line: 146, column: 39, scope: !457)
!460 = !DILocation(line: 146, column: 8, scope: !439)
!461 = !DILocation(line: 147, column: 5, scope: !457)
!462 = !DILocation(line: 150, column: 38, scope: !439)
!463 = !DILocation(line: 150, column: 54, scope: !439)
!464 = !DILocation(line: 150, column: 70, scope: !439)
!465 = !DILocation(line: 150, column: 16, scope: !439)
!466 = !DILocation(line: 150, column: 3, scope: !439)
!467 = !DILocation(line: 150, column: 14, scope: !439)
!468 = !DILocation(line: 151, column: 38, scope: !439)
!469 = !DILocation(line: 151, column: 54, scope: !439)
!470 = !DILocation(line: 151, column: 70, scope: !439)
!471 = !DILocation(line: 151, column: 16, scope: !439)
!472 = !DILocation(line: 151, column: 3, scope: !439)
!473 = !DILocation(line: 151, column: 14, scope: !439)
!474 = !DILocation(line: 152, column: 38, scope: !439)
!475 = !DILocation(line: 152, column: 54, scope: !439)
!476 = !DILocation(line: 152, column: 70, scope: !439)
!477 = !DILocation(line: 152, column: 16, scope: !439)
!478 = !DILocation(line: 152, column: 3, scope: !439)
!479 = !DILocation(line: 152, column: 14, scope: !439)
!480 = !DILocation(line: 153, column: 38, scope: !439)
!481 = !DILocation(line: 153, column: 54, scope: !439)
!482 = !DILocation(line: 153, column: 70, scope: !439)
!483 = !DILocation(line: 153, column: 16, scope: !439)
!484 = !DILocation(line: 153, column: 3, scope: !439)
!485 = !DILocation(line: 153, column: 14, scope: !439)
!486 = !DILocation(line: 154, column: 16, scope: !439)
!487 = !DILocation(line: 154, column: 29, scope: !439)
!488 = !DILocation(line: 154, column: 27, scope: !439)
!489 = !DILocation(line: 154, column: 3, scope: !439)
!490 = !DILocation(line: 154, column: 14, scope: !439)
!491 = !DILocation(line: 157, column: 19, scope: !439)
!492 = !DILocation(line: 157, column: 32, scope: !439)
!493 = !DILocation(line: 157, column: 30, scope: !439)
!494 = !DILocation(line: 157, column: 47, scope: !439)
!495 = !DILocation(line: 157, column: 60, scope: !439)
!496 = !DILocation(line: 157, column: 58, scope: !439)
!497 = !DILocation(line: 157, column: 44, scope: !439)
!498 = !DILocation(line: 157, column: 3, scope: !439)
!499 = !DILocation(line: 157, column: 16, scope: !439)
!500 = !DILocation(line: 159, column: 3, scope: !439)
!501 = !DILocation(line: 160, column: 1, scope: !439)
!502 = distinct !DISubprogram(name: "rasterization2", linkageName: "_Z14rasterization2bPhPi11Triangle_2DP14CandidatePixel", scope: !3, file: !3, line: 163, type: !503, isLocal: false, isDefinition: true, scopeLine: 164, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!503 = !DISubroutineType(types: !504)
!504 = !{!6, !127, !442, !443, !46, !7}
!505 = !DILocalVariable(name: "flag", arg: 1, scope: !502, file: !3, line: 163, type: !127)
!506 = !DILocation(line: 163, column: 27, scope: !502)
!507 = !DILocalVariable(name: "max_min", arg: 2, scope: !502, file: !3, line: 163, type: !442)
!508 = !DILocation(line: 163, column: 38, scope: !502)
!509 = !DILocalVariable(name: "max_index", arg: 3, scope: !502, file: !3, line: 163, type: !443)
!510 = !DILocation(line: 163, column: 53, scope: !502)
!511 = !DILocalVariable(name: "triangle_2d", arg: 4, scope: !502, file: !3, line: 163, type: !46)
!512 = !DILocation(line: 163, column: 78, scope: !502)
!513 = !DILocalVariable(name: "fragment", arg: 5, scope: !502, file: !3, line: 163, type: !7)
!514 = !DILocation(line: 163, column: 106, scope: !502)
!515 = !DILocation(line: 166, column: 8, scope: !516)
!516 = distinct !DILexicalBlock(scope: !502, file: !3, line: 166, column: 8)
!517 = !DILocation(line: 166, column: 8, scope: !502)
!518 = !DILocation(line: 168, column: 5, scope: !519)
!519 = distinct !DILexicalBlock(scope: !516, file: !3, line: 167, column: 3)
!520 = !DILocation(line: 171, column: 3, scope: !502)
!521 = !DILocalVariable(name: "color", scope: !502, file: !3, line: 171, type: !13)
!522 = !DILocation(line: 171, column: 8, scope: !502)
!523 = !DILocation(line: 172, column: 3, scope: !502)
!524 = !DILocalVariable(name: "i", scope: !502, file: !3, line: 172, type: !6)
!525 = !DILocation(line: 172, column: 7, scope: !502)
!526 = !DILocation(line: 174, column: 16, scope: !527)
!527 = distinct !DILexicalBlock(scope: !502, file: !3, line: 174, column: 10)
!528 = !DILocalVariable(name: "k", scope: !527, file: !3, line: 174, type: !6)
!529 = !DILocation(line: 174, column: 20, scope: !527)
!530 = !DILocation(line: 174, column: 27, scope: !531)
!531 = distinct !DILexicalBlock(scope: !527, file: !3, line: 174, column: 10)
!532 = !DILocation(line: 174, column: 31, scope: !531)
!533 = !DILocation(line: 174, column: 29, scope: !531)
!534 = !DILocation(line: 174, column: 10, scope: !527)
!535 = !DILocation(line: 174, column: 10, scope: !531)
!536 = !DILocation(line: 176, column: 5, scope: !537)
!537 = distinct !DILexicalBlock(scope: !531, file: !3, line: 175, column: 3)
!538 = !DILocalVariable(name: "x", scope: !537, file: !3, line: 176, type: !13)
!539 = !DILocation(line: 176, column: 10, scope: !537)
!540 = !DILocation(line: 176, column: 14, scope: !537)
!541 = !DILocation(line: 176, column: 27, scope: !537)
!542 = !DILocation(line: 176, column: 31, scope: !537)
!543 = !DILocation(line: 176, column: 29, scope: !537)
!544 = !DILocation(line: 176, column: 25, scope: !537)
!545 = !DILocation(line: 177, column: 5, scope: !537)
!546 = !DILocalVariable(name: "y", scope: !537, file: !3, line: 177, type: !13)
!547 = !DILocation(line: 177, column: 10, scope: !537)
!548 = !DILocation(line: 177, column: 14, scope: !537)
!549 = !DILocation(line: 177, column: 27, scope: !537)
!550 = !DILocation(line: 177, column: 31, scope: !537)
!551 = !DILocation(line: 177, column: 29, scope: !537)
!552 = !DILocation(line: 177, column: 25, scope: !537)
!553 = !DILocation(line: 179, column: 28, scope: !554)
!554 = distinct !DILexicalBlock(scope: !537, file: !3, line: 179, column: 9)
!555 = !DILocation(line: 179, column: 31, scope: !554)
!556 = !DILocation(line: 179, column: 34, scope: !554)
!557 = !DILocation(line: 179, column: 9, scope: !554)
!558 = !DILocation(line: 179, column: 9, scope: !537)
!559 = !DILocation(line: 181, column: 23, scope: !560)
!560 = distinct !DILexicalBlock(scope: !554, file: !3, line: 180, column: 5)
!561 = !DILocation(line: 181, column: 7, scope: !560)
!562 = !DILocation(line: 181, column: 16, scope: !560)
!563 = !DILocation(line: 181, column: 19, scope: !560)
!564 = !DILocation(line: 181, column: 21, scope: !560)
!565 = !DILocation(line: 182, column: 23, scope: !560)
!566 = !DILocation(line: 182, column: 7, scope: !560)
!567 = !DILocation(line: 182, column: 16, scope: !560)
!568 = !DILocation(line: 182, column: 19, scope: !560)
!569 = !DILocation(line: 182, column: 21, scope: !560)
!570 = !DILocation(line: 183, column: 35, scope: !560)
!571 = !DILocation(line: 183, column: 7, scope: !560)
!572 = !DILocation(line: 183, column: 16, scope: !560)
!573 = !DILocation(line: 183, column: 19, scope: !560)
!574 = !DILocation(line: 183, column: 21, scope: !560)
!575 = !DILocation(line: 184, column: 27, scope: !560)
!576 = !DILocation(line: 184, column: 7, scope: !560)
!577 = !DILocation(line: 184, column: 16, scope: !560)
!578 = !DILocation(line: 184, column: 19, scope: !560)
!579 = !DILocation(line: 184, column: 25, scope: !560)
!580 = !DILocation(line: 185, column: 8, scope: !560)
!581 = !DILocation(line: 186, column: 5, scope: !560)
!582 = !DILocation(line: 187, column: 3, scope: !531)
!583 = !DILocation(line: 187, column: 3, scope: !537)
!584 = !DILocation(line: 174, column: 47, scope: !531)
!585 = distinct !{!585, !534, !586, !587}
!586 = !DILocation(line: 187, column: 3, scope: !527)
!587 = !{!"llvm.loop.name", !"RAST2"}
!588 = !DILocation(line: 189, column: 10, scope: !502)
!589 = !DILocation(line: 189, column: 3, scope: !502)
!590 = !DILocation(line: 190, column: 1, scope: !502)
!591 = !DILocalVariable(name: "counter", arg: 1, scope: !2, file: !3, line: 193, type: !6)
!592 = !DILocation(line: 193, column: 18, scope: !2)
!593 = !DILocalVariable(name: "fragments", arg: 2, scope: !2, file: !3, line: 193, type: !7)
!594 = !DILocation(line: 193, column: 42, scope: !2)
!595 = !DILocalVariable(name: "size", arg: 3, scope: !2, file: !3, line: 193, type: !6)
!596 = !DILocation(line: 193, column: 59, scope: !2)
!597 = !DILocalVariable(name: "pixels", arg: 4, scope: !2, file: !3, line: 193, type: !18)
!598 = !DILocation(line: 193, column: 71, scope: !2)
!599 = !DILocation(line: 197, column: 7, scope: !600)
!600 = distinct !DILexicalBlock(scope: !2, file: !3, line: 197, column: 7)
!601 = !DILocation(line: 197, column: 15, scope: !600)
!602 = !DILocation(line: 197, column: 7, scope: !2)
!603 = !DILocation(line: 198, column: 3, scope: !600)
!604 = !DILocation(line: 199, column: 30, scope: !605)
!605 = distinct !DILexicalBlock(scope: !606, file: !3, line: 199, column: 24)
!606 = distinct !DILexicalBlock(scope: !600, file: !3, line: 198, column: 3)
!607 = !DILocalVariable(name: "i", scope: !605, file: !3, line: 199, type: !6)
!608 = !DILocation(line: 199, column: 34, scope: !605)
!609 = !DILocation(line: 199, column: 41, scope: !610)
!610 = distinct !DILexicalBlock(scope: !605, file: !3, line: 199, column: 24)
!611 = !DILocation(line: 199, column: 43, scope: !610)
!612 = !DILocation(line: 199, column: 24, scope: !605)
!613 = !DILocation(line: 199, column: 24, scope: !610)
!614 = !DILocation(line: 200, column: 5, scope: !610)
!615 = !DILocation(line: 201, column: 32, scope: !616)
!616 = distinct !DILexicalBlock(scope: !617, file: !3, line: 201, column: 26)
!617 = distinct !DILexicalBlock(scope: !610, file: !3, line: 200, column: 5)
!618 = !DILocalVariable(name: "j", scope: !616, file: !3, line: 201, type: !6)
!619 = !DILocation(line: 201, column: 36, scope: !616)
!620 = !DILocation(line: 201, column: 43, scope: !621)
!621 = distinct !DILexicalBlock(scope: !616, file: !3, line: 201, column: 26)
!622 = !DILocation(line: 201, column: 45, scope: !621)
!623 = !DILocation(line: 201, column: 26, scope: !616)
!624 = !DILocation(line: 201, column: 26, scope: !621)
!625 = !DILocation(line: 203, column: 18, scope: !626)
!626 = distinct !DILexicalBlock(scope: !621, file: !3, line: 202, column: 7)
!627 = !DILocation(line: 203, column: 9, scope: !626)
!628 = !DILocation(line: 203, column: 21, scope: !626)
!629 = !DILocation(line: 203, column: 24, scope: !626)
!630 = !DILocation(line: 204, column: 7, scope: !626)
!631 = !DILocation(line: 201, column: 56, scope: !621)
!632 = distinct !{!632, !623, !633, !634}
!633 = !DILocation(line: 204, column: 7, scope: !616)
!634 = !{!"llvm.loop.name", !"ZCULLING_INIT_COL"}
!635 = !DILocation(line: 205, column: 5, scope: !617)
!636 = !DILocation(line: 199, column: 54, scope: !610)
!637 = distinct !{!637, !612, !638, !639}
!638 = !DILocation(line: 205, column: 5, scope: !605)
!639 = !{!"llvm.loop.name", !"ZCULLING_INIT_ROW"}
!640 = !DILocation(line: 206, column: 3, scope: !606)
!641 = !DILocation(line: 209, column: 3, scope: !2)
!642 = !DILocalVariable(name: "pixel_cntr", scope: !2, file: !3, line: 209, type: !6)
!643 = !DILocation(line: 209, column: 7, scope: !2)
!644 = !DILocation(line: 212, column: 19, scope: !645)
!645 = distinct !DILexicalBlock(scope: !2, file: !3, line: 212, column: 13)
!646 = !DILocalVariable(name: "n", scope: !645, file: !3, line: 212, type: !6)
!647 = !DILocation(line: 212, column: 23, scope: !645)
!648 = !DILocation(line: 212, column: 30, scope: !649)
!649 = distinct !DILexicalBlock(scope: !645, file: !3, line: 212, column: 13)
!650 = !DILocation(line: 212, column: 34, scope: !649)
!651 = !DILocation(line: 212, column: 32, scope: !649)
!652 = !DILocation(line: 212, column: 13, scope: !645)
!653 = !DILocation(line: 212, column: 13, scope: !649)
!654 = !DILocation(line: 214, column: 9, scope: !655)
!655 = distinct !DILexicalBlock(scope: !656, file: !3, line: 214, column: 9)
!656 = distinct !DILexicalBlock(scope: !649, file: !3, line: 213, column: 3)
!657 = !DILocation(line: 214, column: 19, scope: !655)
!658 = !DILocation(line: 214, column: 22, scope: !655)
!659 = !DILocation(line: 214, column: 35, scope: !655)
!660 = !DILocation(line: 214, column: 45, scope: !655)
!661 = !DILocation(line: 214, column: 48, scope: !655)
!662 = !DILocation(line: 214, column: 26, scope: !655)
!663 = !DILocation(line: 214, column: 51, scope: !655)
!664 = !DILocation(line: 214, column: 61, scope: !655)
!665 = !DILocation(line: 214, column: 64, scope: !655)
!666 = !DILocation(line: 214, column: 24, scope: !655)
!667 = !DILocation(line: 214, column: 9, scope: !656)
!668 = !DILocation(line: 216, column: 30, scope: !669)
!669 = distinct !DILexicalBlock(scope: !655, file: !3, line: 215, column: 5)
!670 = !DILocation(line: 216, column: 40, scope: !669)
!671 = !DILocation(line: 216, column: 43, scope: !669)
!672 = !DILocation(line: 216, column: 7, scope: !669)
!673 = !DILocation(line: 216, column: 14, scope: !669)
!674 = !DILocation(line: 216, column: 26, scope: !669)
!675 = !DILocation(line: 216, column: 28, scope: !669)
!676 = !DILocation(line: 217, column: 30, scope: !669)
!677 = !DILocation(line: 217, column: 40, scope: !669)
!678 = !DILocation(line: 217, column: 43, scope: !669)
!679 = !DILocation(line: 217, column: 7, scope: !669)
!680 = !DILocation(line: 217, column: 14, scope: !669)
!681 = !DILocation(line: 217, column: 26, scope: !669)
!682 = !DILocation(line: 217, column: 28, scope: !669)
!683 = !DILocation(line: 218, column: 34, scope: !669)
!684 = !DILocation(line: 218, column: 44, scope: !669)
!685 = !DILocation(line: 218, column: 47, scope: !669)
!686 = !DILocation(line: 218, column: 7, scope: !669)
!687 = !DILocation(line: 218, column: 14, scope: !669)
!688 = !DILocation(line: 218, column: 26, scope: !669)
!689 = !DILocation(line: 218, column: 32, scope: !669)
!690 = !DILocation(line: 219, column: 17, scope: !669)
!691 = !DILocation(line: 220, column: 50, scope: !669)
!692 = !DILocation(line: 220, column: 60, scope: !669)
!693 = !DILocation(line: 220, column: 63, scope: !669)
!694 = !DILocation(line: 220, column: 16, scope: !669)
!695 = !DILocation(line: 220, column: 26, scope: !669)
!696 = !DILocation(line: 220, column: 29, scope: !669)
!697 = !DILocation(line: 220, column: 7, scope: !669)
!698 = !DILocation(line: 220, column: 32, scope: !669)
!699 = !DILocation(line: 220, column: 42, scope: !669)
!700 = !DILocation(line: 220, column: 45, scope: !669)
!701 = !DILocation(line: 220, column: 48, scope: !669)
!702 = !DILocation(line: 221, column: 5, scope: !669)
!703 = !DILocation(line: 222, column: 3, scope: !656)
!704 = !DILocation(line: 212, column: 42, scope: !649)
!705 = distinct !{!705, !652, !706, !707}
!706 = !DILocation(line: 222, column: 3, scope: !645)
!707 = !{!"llvm.loop.name", !"ZCULLING"}
!708 = !DILocation(line: 224, column: 10, scope: !2)
!709 = !DILocation(line: 225, column: 1, scope: !2)
!710 = !DILocation(line: 224, column: 3, scope: !2)
!711 = distinct !DISubprogram(name: "coloringFB", linkageName: "_Z10coloringFBiiP5PixelPA256_h", scope: !3, file: !3, line: 228, type: !712, isLocal: false, isDefinition: true, scopeLine: 229, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!712 = !DISubroutineType(types: !713)
!713 = !{null, !6, !6, !18, !714}
!714 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !715, size: 64)
!715 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 2048, elements: !716)
!716 = !{!38}
!717 = !DILocalVariable(name: "counter", arg: 1, scope: !711, file: !3, line: 228, type: !6)
!718 = !DILocation(line: 228, column: 21, scope: !711)
!719 = !DILocalVariable(name: "size_pixels", arg: 2, scope: !711, file: !3, line: 228, type: !6)
!720 = !DILocation(line: 228, column: 34, scope: !711)
!721 = !DILocalVariable(name: "pixels", arg: 3, scope: !711, file: !3, line: 228, type: !18)
!722 = !DILocation(line: 228, column: 53, scope: !711)
!723 = !DILocalVariable(name: "frame_buffer", arg: 4, scope: !711, file: !3, line: 228, type: !714)
!724 = !DILocation(line: 228, column: 68, scope: !711)
!725 = !DILocation(line: 230, column: 8, scope: !726)
!726 = distinct !DILexicalBlock(scope: !711, file: !3, line: 230, column: 8)
!727 = !DILocation(line: 230, column: 16, scope: !726)
!728 = !DILocation(line: 230, column: 8, scope: !711)
!729 = !DILocation(line: 231, column: 3, scope: !726)
!730 = !DILocation(line: 233, column: 33, scope: !731)
!731 = distinct !DILexicalBlock(scope: !732, file: !3, line: 233, column: 27)
!732 = distinct !DILexicalBlock(scope: !726, file: !3, line: 231, column: 3)
!733 = !DILocalVariable(name: "i", scope: !731, file: !3, line: 233, type: !6)
!734 = !DILocation(line: 233, column: 37, scope: !731)
!735 = !DILocation(line: 233, column: 44, scope: !736)
!736 = distinct !DILexicalBlock(scope: !731, file: !3, line: 233, column: 27)
!737 = !DILocation(line: 233, column: 46, scope: !736)
!738 = !DILocation(line: 233, column: 27, scope: !731)
!739 = !DILocation(line: 233, column: 27, scope: !736)
!740 = !DILocation(line: 234, column: 5, scope: !736)
!741 = !DILocation(line: 235, column: 35, scope: !742)
!742 = distinct !DILexicalBlock(scope: !743, file: !3, line: 235, column: 29)
!743 = distinct !DILexicalBlock(scope: !736, file: !3, line: 234, column: 5)
!744 = !DILocalVariable(name: "j", scope: !742, file: !3, line: 235, type: !6)
!745 = !DILocation(line: 235, column: 39, scope: !742)
!746 = !DILocation(line: 235, column: 46, scope: !747)
!747 = distinct !DILexicalBlock(scope: !742, file: !3, line: 235, column: 29)
!748 = !DILocation(line: 235, column: 48, scope: !747)
!749 = !DILocation(line: 235, column: 29, scope: !742)
!750 = !DILocation(line: 235, column: 29, scope: !747)
!751 = !DILocation(line: 236, column: 9, scope: !747)
!752 = !DILocation(line: 236, column: 22, scope: !747)
!753 = !DILocation(line: 236, column: 25, scope: !747)
!754 = !DILocation(line: 236, column: 28, scope: !747)
!755 = !DILocation(line: 235, column: 59, scope: !747)
!756 = distinct !{!756, !749, !757, !758}
!757 = !DILocation(line: 236, column: 30, scope: !742)
!758 = !{!"llvm.loop.name", !"COLORING_FB_INIT_COL"}
!759 = !DILocation(line: 237, column: 5, scope: !743)
!760 = !DILocation(line: 233, column: 57, scope: !736)
!761 = distinct !{!761, !738, !762, !763}
!762 = !DILocation(line: 237, column: 5, scope: !731)
!763 = !{!"llvm.loop.name", !"COLORING_FB_INIT_ROW"}
!764 = !DILocation(line: 238, column: 3, scope: !732)
!765 = !DILocation(line: 230, column: 19, scope: !726)
!766 = !DILocation(line: 241, column: 22, scope: !767)
!767 = distinct !DILexicalBlock(scope: !711, file: !3, line: 241, column: 16)
!768 = !DILocalVariable(name: "i", scope: !767, file: !3, line: 241, type: !6)
!769 = !DILocation(line: 241, column: 26, scope: !767)
!770 = !DILocation(line: 241, column: 33, scope: !771)
!771 = distinct !DILexicalBlock(scope: !767, file: !3, line: 241, column: 16)
!772 = !DILocation(line: 241, column: 37, scope: !771)
!773 = !DILocation(line: 241, column: 35, scope: !771)
!774 = !DILocation(line: 241, column: 16, scope: !767)
!775 = !DILocation(line: 241, column: 16, scope: !771)
!776 = !DILocation(line: 242, column: 50, scope: !771)
!777 = !DILocation(line: 242, column: 57, scope: !771)
!778 = !DILocation(line: 242, column: 60, scope: !771)
!779 = !DILocation(line: 242, column: 5, scope: !771)
!780 = !DILocation(line: 242, column: 19, scope: !771)
!781 = !DILocation(line: 242, column: 26, scope: !771)
!782 = !DILocation(line: 242, column: 29, scope: !771)
!783 = !DILocation(line: 242, column: 34, scope: !771)
!784 = !DILocation(line: 242, column: 41, scope: !771)
!785 = !DILocation(line: 242, column: 44, scope: !771)
!786 = !DILocation(line: 242, column: 48, scope: !771)
!787 = !DILocation(line: 241, column: 52, scope: !771)
!788 = distinct !{!788, !774, !789, !790}
!789 = !DILocation(line: 242, column: 60, scope: !767)
!790 = !{!"llvm.loop.name", !"COLORING_FB"}
!791 = !DILocation(line: 243, column: 1, scope: !711)
!792 = distinct !DISubprogram(name: "rendering", linkageName: "_Z9renderingP11Triangle_3DPA256_h", scope: !3, file: !3, line: 246, type: !793, isLocal: false, isDefinition: true, scopeLine: 247, flags: DIFlagPrototyped, isOptimized: false, unit: !25, variables: !27)
!793 = !DISubroutineType(types: !794)
!794 = !{null, !795, !714}
!795 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !288, size: 64)
!796 = !{!797}
!797 = !{!"fpga.top", !"user", !798}
!798 = !DILocation(line: 246, column: 16, scope: !792)
!799 = !DILocalVariable(name: "triangle_3ds", arg: 1, scope: !792, file: !3, line: 246, type: !795)
!800 = !DILocation(line: 246, column: 72, scope: !792)
!801 = !DILocalVariable(name: "output", arg: 2, scope: !792, file: !3, line: 246, type: !714)
!802 = !DILocation(line: 246, column: 103, scope: !792)
!803 = !DILocation(line: 249, column: 3, scope: !792)
!804 = !DILocalVariable(name: "triangle_2ds", scope: !792, file: !3, line: 249, type: !46)
!805 = !DILocation(line: 249, column: 15, scope: !792)
!806 = !DILocation(line: 251, column: 3, scope: !792)
!807 = !DILocalVariable(name: "angle", scope: !792, file: !3, line: 251, type: !6)
!808 = !DILocation(line: 251, column: 7, scope: !792)
!809 = !DILocation(line: 254, column: 3, scope: !792)
!810 = !DILocalVariable(name: "max_min", scope: !792, file: !3, line: 254, type: !811)
!811 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 40, elements: !812)
!812 = !{!813}
!813 = !DISubrange(count: 5)
!814 = !DILocation(line: 254, column: 8, scope: !792)
!815 = !DILocation(line: 255, column: 3, scope: !792)
!816 = !DILocalVariable(name: "max_index", scope: !792, file: !3, line: 255, type: !817)
!817 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 32, elements: !818)
!818 = !{!819}
!819 = !DISubrange(count: 1)
!820 = !DILocation(line: 255, column: 7, scope: !792)
!821 = !DILocation(line: 258, column: 3, scope: !792)
!822 = !DILocalVariable(name: "fragment", scope: !792, file: !3, line: 258, type: !823)
!823 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 16000, elements: !824)
!824 = !{!825}
!825 = !DISubrange(count: 500)
!826 = !DILocation(line: 258, column: 18, scope: !792)
!827 = !DILocation(line: 261, column: 3, scope: !792)
!828 = !DILocalVariable(name: "pixels", scope: !792, file: !3, line: 261, type: !829)
!829 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 12000, elements: !824)
!830 = !DILocation(line: 261, column: 9, scope: !792)
!831 = !DILocation(line: 264, column: 19, scope: !832)
!832 = distinct !DILexicalBlock(scope: !792, file: !3, line: 264, column: 14)
!833 = !DILocalVariable(name: "i", scope: !832, file: !3, line: 264, type: !6)
!834 = !DILocation(line: 264, column: 23, scope: !832)
!835 = !DILocation(line: 264, column: 30, scope: !836)
!836 = distinct !DILexicalBlock(scope: !832, file: !3, line: 264, column: 14)
!837 = !DILocation(line: 264, column: 32, scope: !836)
!838 = !DILocation(line: 264, column: 14, scope: !832)
!839 = !DILocation(line: 264, column: 14, scope: !836)
!840 = !DILocation(line: 267, column: 17, scope: !841)
!841 = distinct !DILexicalBlock(scope: !836, file: !3, line: 265, column: 3)
!842 = !DILocation(line: 267, column: 30, scope: !841)
!843 = !DILocation(line: 267, column: 49, scope: !841)
!844 = !DILocation(line: 267, column: 5, scope: !841)
!845 = !DILocation(line: 268, column: 5, scope: !841)
!846 = !DILocalVariable(name: "flag", scope: !841, file: !3, line: 268, type: !127)
!847 = !DILocation(line: 268, column: 10, scope: !841)
!848 = !DILocation(line: 268, column: 32, scope: !841)
!849 = !DILocation(line: 268, column: 46, scope: !841)
!850 = !DILocation(line: 268, column: 55, scope: !841)
!851 = !DILocation(line: 268, column: 17, scope: !841)
!852 = !DILocation(line: 269, column: 5, scope: !841)
!853 = !DILocalVariable(name: "size_fragment", scope: !841, file: !3, line: 269, type: !6)
!854 = !DILocation(line: 269, column: 9, scope: !841)
!855 = !DILocation(line: 269, column: 41, scope: !841)
!856 = !DILocation(line: 269, column: 47, scope: !841)
!857 = !DILocation(line: 269, column: 56, scope: !841)
!858 = !DILocation(line: 269, column: 67, scope: !841)
!859 = !DILocation(line: 269, column: 81, scope: !841)
!860 = !DILocation(line: 269, column: 25, scope: !841)
!861 = !DILocation(line: 270, column: 5, scope: !841)
!862 = !DILocalVariable(name: "size_pixels", scope: !841, file: !3, line: 270, type: !6)
!863 = !DILocation(line: 270, column: 9, scope: !841)
!864 = !DILocation(line: 270, column: 33, scope: !841)
!865 = !DILocation(line: 270, column: 36, scope: !841)
!866 = !DILocation(line: 270, column: 46, scope: !841)
!867 = !DILocation(line: 270, column: 61, scope: !841)
!868 = !DILocation(line: 270, column: 23, scope: !841)
!869 = !DILocation(line: 271, column: 18, scope: !841)
!870 = !DILocation(line: 271, column: 21, scope: !841)
!871 = !DILocation(line: 271, column: 34, scope: !841)
!872 = !DILocation(line: 271, column: 42, scope: !841)
!873 = !DILocation(line: 271, column: 5, scope: !841)
!874 = !DILocation(line: 272, column: 3, scope: !836)
!875 = !DILocation(line: 272, column: 3, scope: !841)
!876 = !DILocation(line: 264, column: 48, scope: !836)
!877 = distinct !{!877, !838, !878, !879}
!878 = !DILocation(line: 272, column: 3, scope: !832)
!879 = !{!"llvm.loop.name", !"TRIANGLES"}
!880 = !DILocation(line: 273, column: 1, scope: !792)
