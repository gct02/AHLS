; ModuleID = '<stdin>'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@h = constant [24 x i32] [i32 12, i32 -44, i32 -44, i32 212, i32 48, i32 -624, i32 128, i32 1448, i32 -840, i32 -3220, i32 3804, i32 15504, i32 15504, i32 3804, i32 -3220, i32 -840, i32 1448, i32 128, i32 -624, i32 48, i32 212, i32 -44, i32 -44, i32 12], align 4, !dbg !0
@qq4_code4_table = constant [16 x i32] [i32 0, i32 -20456, i32 -12896, i32 -8968, i32 -6288, i32 -4240, i32 -2584, i32 -1200, i32 20456, i32 12896, i32 8968, i32 6288, i32 4240, i32 2584, i32 1200, i32 0], align 4, !dbg !9
@qq6_code6_table = constant [64 x i32] [i32 -136, i32 -136, i32 -136, i32 -136, i32 -24808, i32 -21904, i32 -19008, i32 -16704, i32 -14984, i32 -13512, i32 -12280, i32 -11192, i32 -10232, i32 -9360, i32 -8576, i32 -7856, i32 -7192, i32 -6576, i32 -6000, i32 -5456, i32 -4944, i32 -4464, i32 -4008, i32 -3576, i32 -3168, i32 -2776, i32 -2400, i32 -2032, i32 -1688, i32 -1360, i32 -1040, i32 -728, i32 24808, i32 21904, i32 19008, i32 16704, i32 14984, i32 13512, i32 12280, i32 11192, i32 10232, i32 9360, i32 8576, i32 7856, i32 7192, i32 6576, i32 6000, i32 5456, i32 4944, i32 4464, i32 4008, i32 3576, i32 3168, i32 2776, i32 2400, i32 2032, i32 1688, i32 1360, i32 1040, i32 728, i32 432, i32 136, i32 -432, i32 -136], align 4, !dbg !16
@wl_code_table = constant [16 x i32] [i32 -60, i32 3042, i32 1198, i32 538, i32 334, i32 172, i32 58, i32 -30, i32 3042, i32 1198, i32 538, i32 334, i32 172, i32 58, i32 -30, i32 -60], align 4, !dbg !21
@ilb_table = constant [32 x i32] [i32 2048, i32 2093, i32 2139, i32 2186, i32 2233, i32 2282, i32 2332, i32 2383, i32 2435, i32 2489, i32 2543, i32 2599, i32 2656, i32 2714, i32 2774, i32 2834, i32 2896, i32 2960, i32 3025, i32 3091, i32 3158, i32 3228, i32 3298, i32 3371, i32 3444, i32 3520, i32 3597, i32 3676, i32 3756, i32 3838, i32 3922, i32 4008], align 4, !dbg !23
@decis_levl = constant [30 x i32] [i32 280, i32 576, i32 880, i32 1200, i32 1520, i32 1864, i32 2208, i32 2584, i32 2960, i32 3376, i32 3784, i32 4240, i32 4696, i32 5200, i32 5712, i32 6288, i32 6864, i32 7520, i32 8184, i32 8968, i32 9752, i32 10712, i32 11664, i32 12896, i32 14120, i32 15840, i32 17560, i32 20456, i32 23352, i32 32767], align 4, !dbg !28
@quant26bt_pos = constant [31 x i32] [i32 61, i32 60, i32 59, i32 58, i32 57, i32 56, i32 55, i32 54, i32 53, i32 52, i32 51, i32 50, i32 49, i32 48, i32 47, i32 46, i32 45, i32 44, i32 43, i32 42, i32 41, i32 40, i32 39, i32 38, i32 37, i32 36, i32 35, i32 34, i32 33, i32 32, i32 32], align 4, !dbg !33
@quant26bt_neg = constant [31 x i32] [i32 63, i32 62, i32 31, i32 30, i32 29, i32 28, i32 27, i32 26, i32 25, i32 24, i32 23, i32 22, i32 21, i32 20, i32 19, i32 18, i32 17, i32 16, i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 4], align 4, !dbg !38
@qq2_code2_table = constant [4 x i32] [i32 -7408, i32 -1616, i32 7408, i32 1616], align 4, !dbg !40
@wh_code_table = constant [4 x i32] [i32 798, i32 -214, i32 798, i32 -214], align 4, !dbg !45
@tqmf = common global [24 x i32] zeroinitializer, align 4, !dbg !47
@xl = common global i32 0, align 4, !dbg !52
@xh = common global i32 0, align 4, !dbg !54
@delay_bpl = common global [6 x i32] zeroinitializer, align 4, !dbg !81
@delay_dltx = common global [6 x i32] zeroinitializer, align 4, !dbg !86
@szl = common global i32 0, align 4, !dbg !73
@rlt1 = common global i32 0, align 4, !dbg !104
@al1 = common global i32 0, align 4, !dbg !90
@rlt2 = common global i32 0, align 4, !dbg !106
@al2 = common global i32 0, align 4, !dbg !92
@spl = common global i32 0, align 4, !dbg !75
@sl = common global i32 0, align 4, !dbg !77
@el = common global i32 0, align 4, !dbg !79
@detl = common global i32 0, align 4, !dbg !108
@il = common global i32 0, align 4, !dbg !71
@dlt = common global i32 0, align 4, !dbg !100
@nbl = common global i32 0, align 4, !dbg !88
@plt = common global i32 0, align 4, !dbg !94
@plt1 = common global i32 0, align 4, !dbg !96
@plt2 = common global i32 0, align 4, !dbg !98
@rlt = common global i32 0, align 4, !dbg !102
@delay_bph = common global [6 x i32] zeroinitializer, align 4, !dbg !134
@delay_dhx = common global [6 x i32] zeroinitializer, align 4, !dbg !132
@szh = common global i32 0, align 4, !dbg !122
@rh1 = common global i32 0, align 4, !dbg !144
@ah1 = common global i32 0, align 4, !dbg !136
@rh2 = common global i32 0, align 4, !dbg !146
@ah2 = common global i32 0, align 4, !dbg !138
@sph = common global i32 0, align 4, !dbg !124
@sh = common global i32 0, align 4, !dbg !112
@eh = common global i32 0, align 4, !dbg !114
@ih = common global i32 0, align 4, !dbg !118
@deth = common global i32 0, align 4, !dbg !110
@dh = common global i32 0, align 4, !dbg !116
@nbh = common global i32 0, align 4, !dbg !120
@ph = common global i32 0, align 4, !dbg !126
@ph1 = common global i32 0, align 4, !dbg !140
@ph2 = common global i32 0, align 4, !dbg !142
@yh = common global i32 0, align 4, !dbg !128
@ilr = common global i32 0, align 4, !dbg !148
@dec_del_bpl = common global [6 x i32] zeroinitializer, align 4, !dbg !158
@dec_del_dltx = common global [6 x i32] zeroinitializer, align 4, !dbg !160
@dec_szl = common global i32 0, align 4, !dbg !168
@dec_rlt1 = common global i32 0, align 4, !dbg !174
@dec_al1 = common global i32 0, align 4, !dbg !180
@dec_rlt2 = common global i32 0, align 4, !dbg !176
@dec_al2 = common global i32 0, align 4, !dbg !182
@dec_spl = common global i32 0, align 4, !dbg !170
@dec_sl = common global i32 0, align 4, !dbg !172
@dec_detl = common global i32 0, align 4, !dbg !154
@dec_dlt = common global i32 0, align 4, !dbg !156
@dl = common global i32 0, align 4, !dbg !184
@rl = common global i32 0, align 4, !dbg !150
@dec_nbl = common global i32 0, align 4, !dbg !186
@dec_plt = common global i32 0, align 4, !dbg !162
@dec_plt1 = common global i32 0, align 4, !dbg !164
@dec_plt2 = common global i32 0, align 4, !dbg !166
@dec_rlt = common global i32 0, align 4, !dbg !178
@dec_del_bph = common global [6 x i32] zeroinitializer, align 4, !dbg !192
@dec_del_dhx = common global [6 x i32] zeroinitializer, align 4, !dbg !194
@dec_szh = common global i32 0, align 4, !dbg !196
@dec_rh1 = common global i32 0, align 4, !dbg !198
@dec_ah1 = common global i32 0, align 4, !dbg !202
@dec_rh2 = common global i32 0, align 4, !dbg !200
@dec_ah2 = common global i32 0, align 4, !dbg !204
@dec_sph = common global i32 0, align 4, !dbg !208
@dec_sh = common global i32 0, align 4, !dbg !210
@dec_deth = common global i32 0, align 4, !dbg !152
@dec_dh = common global i32 0, align 4, !dbg !188
@dec_nbh = common global i32 0, align 4, !dbg !190
@dec_ph = common global i32 0, align 4, !dbg !206
@dec_ph1 = common global i32 0, align 4, !dbg !212
@dec_ph2 = common global i32 0, align 4, !dbg !214
@rh = common global i32 0, align 4, !dbg !130
@xd = common global i32 0, align 4, !dbg !69
@xs = common global i32 0, align 4, !dbg !67
@accumc = common global [11 x i32] zeroinitializer, align 4, !dbg !56
@accumd = common global [11 x i32] zeroinitializer, align 4, !dbg !61
@xout1 = common global i32 0, align 4, !dbg !63
@xout2 = common global i32 0, align 4, !dbg !65
@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: nounwind readnone willreturn
define i32 @abs(i32 %n) #0 !dbg !221 {
entry:
  %n.addr = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !224, metadata !DIExpression()), !dbg !225
  %0 = bitcast i32* %m to i8*, !dbg !226
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5, !dbg !226
  call void @llvm.dbg.declare(metadata i32* %m, metadata !227, metadata !DIExpression()), !dbg !228
  %1 = load i32, i32* %n.addr, align 4, !dbg !229
  %cmp = icmp sge i32 %1, 0, !dbg !231
  br i1 %cmp, label %if.then, label %if.else, !dbg !232

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4, !dbg !233
  store i32 %2, i32* %m, align 4, !dbg !234
  br label %if.end, !dbg !235

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %n.addr, align 4, !dbg !236
  %sub = sub i32 0, %3, !dbg !237
  store i32 %sub, i32* %m, align 4, !dbg !238
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %m, align 4, !dbg !239
  %5 = bitcast i32* %m to i8*, !dbg !240
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %5) #5, !dbg !240
  ret i32 %4, !dbg !241
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
define i32 @encode(i32 %xin1, i32 %xin2) #3 !dbg !242 {
entry:
  %xin1.addr = alloca i32, align 4
  %xin2.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %h_ptr = alloca i32*, align 8
  %tqmf_ptr = alloca i32*, align 8
  %tqmf_ptr1 = alloca i32*, align 8
  %xa = alloca i64, align 8
  %xb = alloca i64, align 8
  %decis = alloca i32, align 4
  store i32 %xin1, i32* %xin1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %xin1.addr, metadata !245, metadata !DIExpression()), !dbg !246
  store i32 %xin2, i32* %xin2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %xin2.addr, metadata !247, metadata !DIExpression()), !dbg !248
  %0 = bitcast i32* %i to i8*, !dbg !249
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5, !dbg !249
  call void @llvm.dbg.declare(metadata i32* %i, metadata !250, metadata !DIExpression()), !dbg !251
  %1 = bitcast i32** %h_ptr to i8*, !dbg !252
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #5, !dbg !252
  call void @llvm.dbg.declare(metadata i32** %h_ptr, metadata !253, metadata !DIExpression()), !dbg !255
  %2 = bitcast i32** %tqmf_ptr to i8*, !dbg !256
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #5, !dbg !256
  call void @llvm.dbg.declare(metadata i32** %tqmf_ptr, metadata !257, metadata !DIExpression()), !dbg !259
  %3 = bitcast i32** %tqmf_ptr1 to i8*, !dbg !256
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #5, !dbg !256
  call void @llvm.dbg.declare(metadata i32** %tqmf_ptr1, metadata !260, metadata !DIExpression()), !dbg !261
  %4 = bitcast i64* %xa to i8*, !dbg !262
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #5, !dbg !262
  call void @llvm.dbg.declare(metadata i64* %xa, metadata !263, metadata !DIExpression()), !dbg !264
  %5 = bitcast i64* %xb to i8*, !dbg !262
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #5, !dbg !262
  call void @llvm.dbg.declare(metadata i64* %xb, metadata !265, metadata !DIExpression()), !dbg !266
  %6 = bitcast i32* %decis to i8*, !dbg !267
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #5, !dbg !267
  call void @llvm.dbg.declare(metadata i32* %decis, metadata !268, metadata !DIExpression()), !dbg !269
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 8, !dbg !270
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 0), i32** %tqmf_ptr, align 8, !dbg !271
  %7 = load i32*, i32** %tqmf_ptr, align 8, !dbg !272
  %incdec.ptr = getelementptr inbounds i32, i32* %7, i32 1, !dbg !272
  store i32* %incdec.ptr, i32** %tqmf_ptr, align 8, !dbg !272
  %8 = load i32, i32* %7, align 4, !dbg !273
  %conv = sext i32 %8 to i64, !dbg !274
  %9 = load i32*, i32** %h_ptr, align 8, !dbg !275
  %incdec.ptr1 = getelementptr inbounds i32, i32* %9, i32 1, !dbg !275
  store i32* %incdec.ptr1, i32** %h_ptr, align 8, !dbg !275
  %10 = load i32, i32* %9, align 4, !dbg !276
  %conv2 = sext i32 %10 to i64, !dbg !277
  %mul = mul i64 %conv, %conv2, !dbg !278
  store i64 %mul, i64* %xa, align 8, !dbg !279
  %11 = load i32*, i32** %tqmf_ptr, align 8, !dbg !280
  %incdec.ptr3 = getelementptr inbounds i32, i32* %11, i32 1, !dbg !280
  store i32* %incdec.ptr3, i32** %tqmf_ptr, align 8, !dbg !280
  %12 = load i32, i32* %11, align 4, !dbg !281
  %conv4 = sext i32 %12 to i64, !dbg !282
  %13 = load i32*, i32** %h_ptr, align 8, !dbg !283
  %incdec.ptr5 = getelementptr inbounds i32, i32* %13, i32 1, !dbg !283
  store i32* %incdec.ptr5, i32** %h_ptr, align 8, !dbg !283
  %14 = load i32, i32* %13, align 4, !dbg !284
  %conv6 = sext i32 %14 to i64, !dbg !285
  %mul7 = mul i64 %conv4, %conv6, !dbg !286
  store i64 %mul7, i64* %xb, align 8, !dbg !287
  br label %encode_label0, !dbg !288

encode_label0:                                    ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !289
  br label %for.cond, !dbg !291

for.cond:                                         ; preds = %for.inc, %encode_label0
  %15 = load i32, i32* %i, align 4, !dbg !292
  %cmp = icmp slt i32 %15, 10, !dbg !294
  br i1 %cmp, label %for.body, label %for.end, !dbg !295

for.body:                                         ; preds = %for.cond
  %16 = load i32*, i32** %tqmf_ptr, align 8, !dbg !296
  %incdec.ptr8 = getelementptr inbounds i32, i32* %16, i32 1, !dbg !296
  store i32* %incdec.ptr8, i32** %tqmf_ptr, align 8, !dbg !296
  %17 = load i32, i32* %16, align 4, !dbg !298
  %conv9 = sext i32 %17 to i64, !dbg !299
  %18 = load i32*, i32** %h_ptr, align 8, !dbg !300
  %incdec.ptr10 = getelementptr inbounds i32, i32* %18, i32 1, !dbg !300
  store i32* %incdec.ptr10, i32** %h_ptr, align 8, !dbg !300
  %19 = load i32, i32* %18, align 4, !dbg !301
  %conv11 = sext i32 %19 to i64, !dbg !302
  %mul12 = mul i64 %conv9, %conv11, !dbg !303
  %20 = load i64, i64* %xa, align 8, !dbg !304
  %add = add i64 %20, %mul12, !dbg !304
  store i64 %add, i64* %xa, align 8, !dbg !304
  %21 = load i32*, i32** %tqmf_ptr, align 8, !dbg !305
  %incdec.ptr13 = getelementptr inbounds i32, i32* %21, i32 1, !dbg !305
  store i32* %incdec.ptr13, i32** %tqmf_ptr, align 8, !dbg !305
  %22 = load i32, i32* %21, align 4, !dbg !306
  %conv14 = sext i32 %22 to i64, !dbg !307
  %23 = load i32*, i32** %h_ptr, align 8, !dbg !308
  %incdec.ptr15 = getelementptr inbounds i32, i32* %23, i32 1, !dbg !308
  store i32* %incdec.ptr15, i32** %h_ptr, align 8, !dbg !308
  %24 = load i32, i32* %23, align 4, !dbg !309
  %conv16 = sext i32 %24 to i64, !dbg !310
  %mul17 = mul i64 %conv14, %conv16, !dbg !311
  %25 = load i64, i64* %xb, align 8, !dbg !312
  %add18 = add i64 %25, %mul17, !dbg !312
  store i64 %add18, i64* %xb, align 8, !dbg !312
  br label %for.inc, !dbg !313

for.inc:                                          ; preds = %for.body
  %26 = load i32, i32* %i, align 4, !dbg !314
  %inc = add i32 %26, 1, !dbg !314
  store i32 %inc, i32* %i, align 4, !dbg !314
  br label %for.cond, !dbg !315, !llvm.loop !316

for.end:                                          ; preds = %for.cond
  %27 = load i32*, i32** %tqmf_ptr, align 8, !dbg !319
  %incdec.ptr19 = getelementptr inbounds i32, i32* %27, i32 1, !dbg !319
  store i32* %incdec.ptr19, i32** %tqmf_ptr, align 8, !dbg !319
  %28 = load i32, i32* %27, align 4, !dbg !320
  %conv20 = sext i32 %28 to i64, !dbg !321
  %29 = load i32*, i32** %h_ptr, align 8, !dbg !322
  %incdec.ptr21 = getelementptr inbounds i32, i32* %29, i32 1, !dbg !322
  store i32* %incdec.ptr21, i32** %h_ptr, align 8, !dbg !322
  %30 = load i32, i32* %29, align 4, !dbg !323
  %conv22 = sext i32 %30 to i64, !dbg !324
  %mul23 = mul i64 %conv20, %conv22, !dbg !325
  %31 = load i64, i64* %xa, align 8, !dbg !326
  %add24 = add i64 %31, %mul23, !dbg !326
  store i64 %add24, i64* %xa, align 8, !dbg !326
  %32 = load i32*, i32** %tqmf_ptr, align 8, !dbg !327
  %33 = load i32, i32* %32, align 4, !dbg !328
  %conv25 = sext i32 %33 to i64, !dbg !329
  %34 = load i32*, i32** %h_ptr, align 8, !dbg !330
  %incdec.ptr26 = getelementptr inbounds i32, i32* %34, i32 1, !dbg !330
  store i32* %incdec.ptr26, i32** %h_ptr, align 8, !dbg !330
  %35 = load i32, i32* %34, align 4, !dbg !331
  %conv27 = sext i32 %35 to i64, !dbg !332
  %mul28 = mul i64 %conv25, %conv27, !dbg !333
  %36 = load i64, i64* %xb, align 8, !dbg !334
  %add29 = add i64 %36, %mul28, !dbg !334
  store i64 %add29, i64* %xb, align 8, !dbg !334
  %37 = load i32*, i32** %tqmf_ptr, align 8, !dbg !335
  %add.ptr = getelementptr inbounds i32, i32* %37, i64 -2, !dbg !336
  store i32* %add.ptr, i32** %tqmf_ptr1, align 8, !dbg !337
  br label %encode_label1, !dbg !338

encode_label1:                                    ; preds = %for.end
  store i32 0, i32* %i, align 4, !dbg !339
  br label %for.cond30, !dbg !341

for.cond30:                                       ; preds = %for.inc35, %encode_label1
  %38 = load i32, i32* %i, align 4, !dbg !342
  %cmp31 = icmp slt i32 %38, 22, !dbg !344
  br i1 %cmp31, label %for.body32, label %for.end37, !dbg !345

for.body32:                                       ; preds = %for.cond30
  %39 = load i32*, i32** %tqmf_ptr1, align 8, !dbg !346
  %incdec.ptr33 = getelementptr inbounds i32, i32* %39, i32 -1, !dbg !346
  store i32* %incdec.ptr33, i32** %tqmf_ptr1, align 8, !dbg !346
  %40 = load i32, i32* %39, align 4, !dbg !347
  %41 = load i32*, i32** %tqmf_ptr, align 8, !dbg !348
  %incdec.ptr34 = getelementptr inbounds i32, i32* %41, i32 -1, !dbg !348
  store i32* %incdec.ptr34, i32** %tqmf_ptr, align 8, !dbg !348
  store i32 %40, i32* %41, align 4, !dbg !349
  br label %for.inc35, !dbg !350

for.inc35:                                        ; preds = %for.body32
  %42 = load i32, i32* %i, align 4, !dbg !351
  %inc36 = add i32 %42, 1, !dbg !351
  store i32 %inc36, i32* %i, align 4, !dbg !351
  br label %for.cond30, !dbg !352, !llvm.loop !353

for.end37:                                        ; preds = %for.cond30
  %43 = load i32, i32* %xin1.addr, align 4, !dbg !356
  %44 = load i32*, i32** %tqmf_ptr, align 8, !dbg !357
  %incdec.ptr38 = getelementptr inbounds i32, i32* %44, i32 -1, !dbg !357
  store i32* %incdec.ptr38, i32** %tqmf_ptr, align 8, !dbg !357
  store i32 %43, i32* %44, align 4, !dbg !358
  %45 = load i32, i32* %xin2.addr, align 4, !dbg !359
  %46 = load i32*, i32** %tqmf_ptr, align 8, !dbg !360
  store i32 %45, i32* %46, align 4, !dbg !361
  %47 = load i64, i64* %xa, align 8, !dbg !362
  %48 = load i64, i64* %xb, align 8, !dbg !363
  %add39 = add i64 %47, %48, !dbg !364
  %shr = ashr i64 %add39, 15, !dbg !365
  %conv40 = trunc i64 %shr to i32, !dbg !366
  store i32 %conv40, i32* @xl, align 4, !dbg !367
  %49 = load i64, i64* %xa, align 8, !dbg !368
  %50 = load i64, i64* %xb, align 8, !dbg !369
  %sub = sub i64 %49, %50, !dbg !370
  %shr41 = ashr i64 %sub, 15, !dbg !371
  %conv42 = trunc i64 %shr41 to i32, !dbg !372
  store i32 %conv42, i32* @xh, align 4, !dbg !373
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0)), !dbg !374
  store i32 %call, i32* @szl, align 4, !dbg !375
  %51 = load i32, i32* @rlt1, align 4, !dbg !376
  %52 = load i32, i32* @al1, align 4, !dbg !377
  %53 = load i32, i32* @rlt2, align 4, !dbg !378
  %54 = load i32, i32* @al2, align 4, !dbg !379
  %call43 = call i32 @filtep(i32 %51, i32 %52, i32 %53, i32 %54), !dbg !380
  store i32 %call43, i32* @spl, align 4, !dbg !381
  %55 = load i32, i32* @szl, align 4, !dbg !382
  %56 = load i32, i32* @spl, align 4, !dbg !383
  %add44 = add i32 %55, %56, !dbg !384
  store i32 %add44, i32* @sl, align 4, !dbg !385
  %57 = load i32, i32* @xl, align 4, !dbg !386
  %58 = load i32, i32* @sl, align 4, !dbg !387
  %sub45 = sub i32 %57, %58, !dbg !388
  store i32 %sub45, i32* @el, align 4, !dbg !389
  %59 = load i32, i32* @el, align 4, !dbg !390
  %60 = load i32, i32* @detl, align 4, !dbg !391
  %call46 = call i32 @quantl(i32 %59, i32 %60), !dbg !392
  store i32 %call46, i32* @il, align 4, !dbg !393
  %61 = load i32, i32* @detl, align 4, !dbg !394
  %conv47 = sext i32 %61 to i64, !dbg !395
  %62 = load i32, i32* @il, align 4, !dbg !396
  %shr48 = ashr i32 %62, 2, !dbg !397
  %idxprom = sext i32 %shr48 to i64, !dbg !398
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i64 0, i64 %idxprom, !dbg !398
  %63 = load i32, i32* %arrayidx, align 4, !dbg !398
  %conv49 = sext i32 %63 to i64, !dbg !398
  %mul50 = mul i64 %conv47, %conv49, !dbg !399
  %shr51 = ashr i64 %mul50, 15, !dbg !400
  %conv52 = trunc i64 %shr51 to i32, !dbg !401
  store i32 %conv52, i32* @dlt, align 4, !dbg !402
  %64 = load i32, i32* @il, align 4, !dbg !403
  %65 = load i32, i32* @nbl, align 4, !dbg !404
  %call53 = call i32 @logscl(i32 %64, i32 %65), !dbg !405
  store i32 %call53, i32* @nbl, align 4, !dbg !406
  %66 = load i32, i32* @nbl, align 4, !dbg !407
  %call54 = call i32 @scalel(i32 %66, i32 8), !dbg !408
  store i32 %call54, i32* @detl, align 4, !dbg !409
  %67 = load i32, i32* @dlt, align 4, !dbg !410
  %68 = load i32, i32* @szl, align 4, !dbg !411
  %add55 = add i32 %67, %68, !dbg !412
  store i32 %add55, i32* @plt, align 4, !dbg !413
  %69 = load i32, i32* @dlt, align 4, !dbg !414
  call void @upzero(i32 %69, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0)), !dbg !415
  %70 = load i32, i32* @al1, align 4, !dbg !416
  %71 = load i32, i32* @al2, align 4, !dbg !417
  %72 = load i32, i32* @plt, align 4, !dbg !418
  %73 = load i32, i32* @plt1, align 4, !dbg !419
  %74 = load i32, i32* @plt2, align 4, !dbg !420
  %call56 = call i32 @uppol2(i32 %70, i32 %71, i32 %72, i32 %73, i32 %74), !dbg !421
  store i32 %call56, i32* @al2, align 4, !dbg !422
  %75 = load i32, i32* @al1, align 4, !dbg !423
  %76 = load i32, i32* @al2, align 4, !dbg !424
  %77 = load i32, i32* @plt, align 4, !dbg !425
  %78 = load i32, i32* @plt1, align 4, !dbg !426
  %call57 = call i32 @uppol1(i32 %75, i32 %76, i32 %77, i32 %78), !dbg !427
  store i32 %call57, i32* @al1, align 4, !dbg !428
  %79 = load i32, i32* @sl, align 4, !dbg !429
  %80 = load i32, i32* @dlt, align 4, !dbg !430
  %add58 = add i32 %79, %80, !dbg !431
  store i32 %add58, i32* @rlt, align 4, !dbg !432
  %81 = load i32, i32* @rlt1, align 4, !dbg !433
  store i32 %81, i32* @rlt2, align 4, !dbg !434
  %82 = load i32, i32* @rlt, align 4, !dbg !435
  store i32 %82, i32* @rlt1, align 4, !dbg !436
  %83 = load i32, i32* @plt1, align 4, !dbg !437
  store i32 %83, i32* @plt2, align 4, !dbg !438
  %84 = load i32, i32* @plt, align 4, !dbg !439
  store i32 %84, i32* @plt1, align 4, !dbg !440
  %call59 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0)), !dbg !441
  store i32 %call59, i32* @szh, align 4, !dbg !442
  %85 = load i32, i32* @rh1, align 4, !dbg !443
  %86 = load i32, i32* @ah1, align 4, !dbg !444
  %87 = load i32, i32* @rh2, align 4, !dbg !445
  %88 = load i32, i32* @ah2, align 4, !dbg !446
  %call60 = call i32 @filtep(i32 %85, i32 %86, i32 %87, i32 %88), !dbg !447
  store i32 %call60, i32* @sph, align 4, !dbg !448
  %89 = load i32, i32* @sph, align 4, !dbg !449
  %90 = load i32, i32* @szh, align 4, !dbg !450
  %add61 = add i32 %89, %90, !dbg !451
  store i32 %add61, i32* @sh, align 4, !dbg !452
  %91 = load i32, i32* @xh, align 4, !dbg !453
  %92 = load i32, i32* @sh, align 4, !dbg !454
  %sub62 = sub i32 %91, %92, !dbg !455
  store i32 %sub62, i32* @eh, align 4, !dbg !456
  %93 = load i32, i32* @eh, align 4, !dbg !457
  %cmp63 = icmp sge i32 %93, 0, !dbg !459
  br i1 %cmp63, label %if.then, label %if.else, !dbg !460

if.then:                                          ; preds = %for.end37
  store i32 3, i32* @ih, align 4, !dbg !461
  br label %if.end, !dbg !463

if.else:                                          ; preds = %for.end37
  store i32 1, i32* @ih, align 4, !dbg !464
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %94 = load i32, i32* @deth, align 4, !dbg !466
  %conv64 = sext i32 %94 to i64, !dbg !467
  %mul65 = mul i64 564, %conv64, !dbg !468
  %shr66 = ashr i64 %mul65, 12, !dbg !469
  %conv67 = trunc i64 %shr66 to i32, !dbg !470
  store i32 %conv67, i32* %decis, align 4, !dbg !471
  %95 = load i32, i32* @eh, align 4, !dbg !472
  %call68 = call i32 @abs(i32 %95) #6, !dbg !474
  %96 = load i32, i32* %decis, align 4, !dbg !475
  %cmp69 = icmp sgt i32 %call68, %96, !dbg !476
  br i1 %cmp69, label %if.then70, label %if.end71, !dbg !477

if.then70:                                        ; preds = %if.end
  %97 = load i32, i32* @ih, align 4, !dbg !478
  %dec = add i32 %97, -1, !dbg !478
  store i32 %dec, i32* @ih, align 4, !dbg !478
  br label %if.end71, !dbg !479

if.end71:                                         ; preds = %if.then70, %if.end
  %98 = load i32, i32* @deth, align 4, !dbg !480
  %conv72 = sext i32 %98 to i64, !dbg !481
  %99 = load i32, i32* @ih, align 4, !dbg !482
  %idxprom73 = sext i32 %99 to i64, !dbg !483
  %arrayidx74 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i64 0, i64 %idxprom73, !dbg !483
  %100 = load i32, i32* %arrayidx74, align 4, !dbg !483
  %conv75 = sext i32 %100 to i64, !dbg !483
  %mul76 = mul i64 %conv72, %conv75, !dbg !484
  %shr77 = ashr i64 %mul76, 15, !dbg !485
  %conv78 = trunc i64 %shr77 to i32, !dbg !486
  store i32 %conv78, i32* @dh, align 4, !dbg !487
  %101 = load i32, i32* @ih, align 4, !dbg !488
  %102 = load i32, i32* @nbh, align 4, !dbg !489
  %call79 = call i32 @logsch(i32 %101, i32 %102), !dbg !490
  store i32 %call79, i32* @nbh, align 4, !dbg !491
  %103 = load i32, i32* @nbh, align 4, !dbg !492
  %call80 = call i32 @scalel(i32 %103, i32 10), !dbg !493
  store i32 %call80, i32* @deth, align 4, !dbg !494
  %104 = load i32, i32* @dh, align 4, !dbg !495
  %105 = load i32, i32* @szh, align 4, !dbg !496
  %add81 = add i32 %104, %105, !dbg !497
  store i32 %add81, i32* @ph, align 4, !dbg !498
  %106 = load i32, i32* @dh, align 4, !dbg !499
  call void @upzero(i32 %106, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0)), !dbg !500
  %107 = load i32, i32* @ah1, align 4, !dbg !501
  %108 = load i32, i32* @ah2, align 4, !dbg !502
  %109 = load i32, i32* @ph, align 4, !dbg !503
  %110 = load i32, i32* @ph1, align 4, !dbg !504
  %111 = load i32, i32* @ph2, align 4, !dbg !505
  %call82 = call i32 @uppol2(i32 %107, i32 %108, i32 %109, i32 %110, i32 %111), !dbg !506
  store i32 %call82, i32* @ah2, align 4, !dbg !507
  %112 = load i32, i32* @ah1, align 4, !dbg !508
  %113 = load i32, i32* @ah2, align 4, !dbg !509
  %114 = load i32, i32* @ph, align 4, !dbg !510
  %115 = load i32, i32* @ph1, align 4, !dbg !511
  %call83 = call i32 @uppol1(i32 %112, i32 %113, i32 %114, i32 %115), !dbg !512
  store i32 %call83, i32* @ah1, align 4, !dbg !513
  %116 = load i32, i32* @sh, align 4, !dbg !514
  %117 = load i32, i32* @dh, align 4, !dbg !515
  %add84 = add i32 %116, %117, !dbg !516
  store i32 %add84, i32* @yh, align 4, !dbg !517
  %118 = load i32, i32* @rh1, align 4, !dbg !518
  store i32 %118, i32* @rh2, align 4, !dbg !519
  %119 = load i32, i32* @yh, align 4, !dbg !520
  store i32 %119, i32* @rh1, align 4, !dbg !521
  %120 = load i32, i32* @ph1, align 4, !dbg !522
  store i32 %120, i32* @ph2, align 4, !dbg !523
  %121 = load i32, i32* @ph, align 4, !dbg !524
  store i32 %121, i32* @ph1, align 4, !dbg !525
  %122 = load i32, i32* @il, align 4, !dbg !526
  %123 = load i32, i32* @ih, align 4, !dbg !527
  %shl = shl i32 %123, 6, !dbg !528
  %or = or i32 %122, %shl, !dbg !529
  %124 = bitcast i32* %decis to i8*, !dbg !530
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %124) #5, !dbg !530
  %125 = bitcast i64* %xb to i8*, !dbg !530
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %125) #5, !dbg !530
  %126 = bitcast i64* %xa to i8*, !dbg !530
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %126) #5, !dbg !530
  %127 = bitcast i32** %tqmf_ptr1 to i8*, !dbg !530
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %127) #5, !dbg !530
  %128 = bitcast i32** %tqmf_ptr to i8*, !dbg !530
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %128) #5, !dbg !530
  %129 = bitcast i32** %h_ptr to i8*, !dbg !530
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %129) #5, !dbg !530
  %130 = bitcast i32* %i to i8*, !dbg !530
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %130) #5, !dbg !530
  ret i32 %or, !dbg !531
}

; Function Attrs: nounwind
define i32 @filtez(i32* %bpl, i32* %dlt) #3 !dbg !532 {
entry:
  %bpl.addr = alloca i32*, align 8
  %dlt.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %zl = alloca i64, align 8
  store i32* %bpl, i32** %bpl.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %bpl.addr, metadata !535, metadata !DIExpression()), !dbg !536
  store i32* %dlt, i32** %dlt.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dlt.addr, metadata !537, metadata !DIExpression()), !dbg !538
  %0 = bitcast i32* %i to i8*, !dbg !539
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5, !dbg !539
  call void @llvm.dbg.declare(metadata i32* %i, metadata !540, metadata !DIExpression()), !dbg !541
  %1 = bitcast i64* %zl to i8*, !dbg !542
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #5, !dbg !542
  call void @llvm.dbg.declare(metadata i64* %zl, metadata !543, metadata !DIExpression()), !dbg !544
  %2 = load i32*, i32** %bpl.addr, align 8, !dbg !545
  %incdec.ptr = getelementptr inbounds i32, i32* %2, i32 1, !dbg !545
  store i32* %incdec.ptr, i32** %bpl.addr, align 8, !dbg !545
  %3 = load i32, i32* %2, align 4, !dbg !546
  %conv = sext i32 %3 to i64, !dbg !547
  %4 = load i32*, i32** %dlt.addr, align 8, !dbg !548
  %incdec.ptr1 = getelementptr inbounds i32, i32* %4, i32 1, !dbg !548
  store i32* %incdec.ptr1, i32** %dlt.addr, align 8, !dbg !548
  %5 = load i32, i32* %4, align 4, !dbg !549
  %conv2 = sext i32 %5 to i64, !dbg !550
  %mul = mul i64 %conv, %conv2, !dbg !551
  store i64 %mul, i64* %zl, align 8, !dbg !552
  br label %filtez_label8, !dbg !553

filtez_label8:                                    ; preds = %entry
  store i32 1, i32* %i, align 4, !dbg !554
  br label %for.cond, !dbg !556

for.cond:                                         ; preds = %for.inc, %filtez_label8
  %6 = load i32, i32* %i, align 4, !dbg !557
  %cmp = icmp slt i32 %6, 6, !dbg !559
  br i1 %cmp, label %for.body, label %for.end, !dbg !560

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %bpl.addr, align 8, !dbg !561
  %incdec.ptr3 = getelementptr inbounds i32, i32* %7, i32 1, !dbg !561
  store i32* %incdec.ptr3, i32** %bpl.addr, align 8, !dbg !561
  %8 = load i32, i32* %7, align 4, !dbg !562
  %conv4 = sext i32 %8 to i64, !dbg !563
  %9 = load i32*, i32** %dlt.addr, align 8, !dbg !564
  %incdec.ptr5 = getelementptr inbounds i32, i32* %9, i32 1, !dbg !564
  store i32* %incdec.ptr5, i32** %dlt.addr, align 8, !dbg !564
  %10 = load i32, i32* %9, align 4, !dbg !565
  %conv6 = sext i32 %10 to i64, !dbg !566
  %mul7 = mul i64 %conv4, %conv6, !dbg !567
  %11 = load i64, i64* %zl, align 8, !dbg !568
  %add = add i64 %11, %mul7, !dbg !568
  store i64 %add, i64* %zl, align 8, !dbg !568
  br label %for.inc, !dbg !569

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !570
  %inc = add i32 %12, 1, !dbg !570
  store i32 %inc, i32* %i, align 4, !dbg !570
  br label %for.cond, !dbg !571, !llvm.loop !572

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %zl, align 8, !dbg !575
  %shr = ashr i64 %13, 14, !dbg !576
  %conv8 = trunc i64 %shr to i32, !dbg !577
  %14 = bitcast i64* %zl to i8*, !dbg !578
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %14) #5, !dbg !578
  %15 = bitcast i32* %i to i8*, !dbg !578
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #5, !dbg !578
  ret i32 %conv8, !dbg !579
}

; Function Attrs: nounwind
define i32 @filtep(i32 %rlt1, i32 %al1, i32 %rlt2, i32 %al2) #3 !dbg !580 {
entry:
  %rlt1.addr = alloca i32, align 4
  %al1.addr = alloca i32, align 4
  %rlt2.addr = alloca i32, align 4
  %al2.addr = alloca i32, align 4
  %pl = alloca i64, align 8
  %pl2 = alloca i64, align 8
  store i32 %rlt1, i32* %rlt1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rlt1.addr, metadata !583, metadata !DIExpression()), !dbg !584
  store i32 %al1, i32* %al1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %al1.addr, metadata !585, metadata !DIExpression()), !dbg !586
  store i32 %rlt2, i32* %rlt2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %rlt2.addr, metadata !587, metadata !DIExpression()), !dbg !588
  store i32 %al2, i32* %al2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %al2.addr, metadata !589, metadata !DIExpression()), !dbg !590
  %0 = bitcast i64* %pl to i8*, !dbg !591
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5, !dbg !591
  call void @llvm.dbg.declare(metadata i64* %pl, metadata !592, metadata !DIExpression()), !dbg !593
  %1 = bitcast i64* %pl2 to i8*, !dbg !591
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #5, !dbg !591
  call void @llvm.dbg.declare(metadata i64* %pl2, metadata !594, metadata !DIExpression()), !dbg !595
  %2 = load i32, i32* %rlt1.addr, align 4, !dbg !596
  %mul = mul i32 2, %2, !dbg !597
  %conv = sext i32 %mul to i64, !dbg !598
  store i64 %conv, i64* %pl, align 8, !dbg !599
  %3 = load i32, i32* %al1.addr, align 4, !dbg !600
  %conv1 = sext i32 %3 to i64, !dbg !601
  %4 = load i64, i64* %pl, align 8, !dbg !602
  %mul2 = mul i64 %conv1, %4, !dbg !603
  store i64 %mul2, i64* %pl, align 8, !dbg !604
  %5 = load i32, i32* %rlt2.addr, align 4, !dbg !605
  %mul3 = mul i32 2, %5, !dbg !606
  %conv4 = sext i32 %mul3 to i64, !dbg !607
  store i64 %conv4, i64* %pl2, align 8, !dbg !608
  %6 = load i32, i32* %al2.addr, align 4, !dbg !609
  %conv5 = sext i32 %6 to i64, !dbg !610
  %7 = load i64, i64* %pl2, align 8, !dbg !611
  %mul6 = mul i64 %conv5, %7, !dbg !612
  %8 = load i64, i64* %pl, align 8, !dbg !613
  %add = add i64 %8, %mul6, !dbg !613
  store i64 %add, i64* %pl, align 8, !dbg !613
  %9 = load i64, i64* %pl, align 8, !dbg !614
  %shr = ashr i64 %9, 15, !dbg !615
  %conv7 = trunc i64 %shr to i32, !dbg !616
  %10 = bitcast i64* %pl2 to i8*, !dbg !617
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %10) #5, !dbg !617
  %11 = bitcast i64* %pl to i8*, !dbg !617
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %11) #5, !dbg !617
  ret i32 %conv7, !dbg !618
}

; Function Attrs: nounwind
define i32 @quantl(i32 %el, i32 %detl) #3 !dbg !619 {
entry:
  %el.addr = alloca i32, align 4
  %detl.addr = alloca i32, align 4
  %ril = alloca i32, align 4
  %mil = alloca i32, align 4
  %wd = alloca i64, align 8
  %decis = alloca i64, align 8
  store i32 %el, i32* %el.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %el.addr, metadata !620, metadata !DIExpression()), !dbg !621
  store i32 %detl, i32* %detl.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %detl.addr, metadata !622, metadata !DIExpression()), !dbg !623
  %0 = bitcast i32* %ril to i8*, !dbg !624
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5, !dbg !624
  call void @llvm.dbg.declare(metadata i32* %ril, metadata !625, metadata !DIExpression()), !dbg !626
  %1 = bitcast i32* %mil to i8*, !dbg !624
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5, !dbg !624
  call void @llvm.dbg.declare(metadata i32* %mil, metadata !627, metadata !DIExpression()), !dbg !628
  %2 = bitcast i64* %wd to i8*, !dbg !629
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #5, !dbg !629
  call void @llvm.dbg.declare(metadata i64* %wd, metadata !630, metadata !DIExpression()), !dbg !631
  %3 = bitcast i64* %decis to i8*, !dbg !629
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #5, !dbg !629
  call void @llvm.dbg.declare(metadata i64* %decis, metadata !632, metadata !DIExpression()), !dbg !633
  %4 = load i32, i32* %el.addr, align 4, !dbg !634
  %call = call i32 @abs(i32 %4) #6, !dbg !635
  %conv = sext i32 %call to i64, !dbg !635
  store i64 %conv, i64* %wd, align 8, !dbg !636
  br label %quantl_label9, !dbg !637

quantl_label9:                                    ; preds = %entry
  store i32 0, i32* %mil, align 4, !dbg !638
  br label %for.cond, !dbg !640

for.cond:                                         ; preds = %for.inc, %quantl_label9
  %5 = load i32, i32* %mil, align 4, !dbg !641
  %cmp = icmp slt i32 %5, 30, !dbg !643
  br i1 %cmp, label %for.body, label %for.end, !dbg !644

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %mil, align 4, !dbg !645
  %idxprom = sext i32 %6 to i64, !dbg !647
  %arrayidx = getelementptr inbounds [30 x i32], [30 x i32]* @decis_levl, i64 0, i64 %idxprom, !dbg !647
  %7 = load i32, i32* %arrayidx, align 4, !dbg !647
  %conv1 = sext i32 %7 to i64, !dbg !647
  %8 = load i32, i32* %detl.addr, align 4, !dbg !648
  %conv2 = sext i32 %8 to i64, !dbg !649
  %mul = mul i64 %conv1, %conv2, !dbg !650
  %shr = ashr i64 %mul, 15, !dbg !651
  store i64 %shr, i64* %decis, align 8, !dbg !652
  %9 = load i64, i64* %wd, align 8, !dbg !653
  %10 = load i64, i64* %decis, align 8, !dbg !655
  %cmp3 = icmp sle i64 %9, %10, !dbg !656
  br i1 %cmp3, label %if.then, label %if.end, !dbg !657

if.then:                                          ; preds = %for.body
  br label %for.end, !dbg !658

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !659

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %mil, align 4, !dbg !660
  %inc = add i32 %11, 1, !dbg !660
  store i32 %inc, i32* %mil, align 4, !dbg !660
  br label %for.cond, !dbg !661, !llvm.loop !662

for.end:                                          ; preds = %if.then, %for.cond
  %12 = load i32, i32* %el.addr, align 4, !dbg !665
  %cmp4 = icmp sge i32 %12, 0, !dbg !667
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !668

if.then5:                                         ; preds = %for.end
  %13 = load i32, i32* %mil, align 4, !dbg !669
  %idxprom6 = sext i32 %13 to i64, !dbg !670
  %arrayidx7 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_pos, i64 0, i64 %idxprom6, !dbg !670
  %14 = load i32, i32* %arrayidx7, align 4, !dbg !670
  store i32 %14, i32* %ril, align 4, !dbg !671
  br label %if.end10, !dbg !672

if.else:                                          ; preds = %for.end
  %15 = load i32, i32* %mil, align 4, !dbg !673
  %idxprom8 = sext i32 %15 to i64, !dbg !674
  %arrayidx9 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_neg, i64 0, i64 %idxprom8, !dbg !674
  %16 = load i32, i32* %arrayidx9, align 4, !dbg !674
  store i32 %16, i32* %ril, align 4, !dbg !675
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then5
  %17 = load i32, i32* %ril, align 4, !dbg !676
  %18 = bitcast i64* %decis to i8*, !dbg !677
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #5, !dbg !677
  %19 = bitcast i64* %wd to i8*, !dbg !677
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #5, !dbg !677
  %20 = bitcast i32* %mil to i8*, !dbg !677
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #5, !dbg !677
  %21 = bitcast i32* %ril to i8*, !dbg !677
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #5, !dbg !677
  ret i32 %17, !dbg !678
}

; Function Attrs: nounwind
define i32 @logscl(i32 %il, i32 %nbl) #3 !dbg !679 {
entry:
  %il.addr = alloca i32, align 4
  %nbl.addr = alloca i32, align 4
  %wd = alloca i64, align 8
  store i32 %il, i32* %il.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %il.addr, metadata !680, metadata !DIExpression()), !dbg !681
  store i32 %nbl, i32* %nbl.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nbl.addr, metadata !682, metadata !DIExpression()), !dbg !683
  %0 = bitcast i64* %wd to i8*, !dbg !684
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5, !dbg !684
  call void @llvm.dbg.declare(metadata i64* %wd, metadata !685, metadata !DIExpression()), !dbg !686
  %1 = load i32, i32* %nbl.addr, align 4, !dbg !687
  %conv = sext i32 %1 to i64, !dbg !688
  %mul = mul i64 %conv, 127, !dbg !689
  %shr = ashr i64 %mul, 7, !dbg !690
  store i64 %shr, i64* %wd, align 8, !dbg !691
  %2 = load i64, i64* %wd, align 8, !dbg !692
  %conv1 = trunc i64 %2 to i32, !dbg !693
  %3 = load i32, i32* %il.addr, align 4, !dbg !694
  %shr2 = ashr i32 %3, 2, !dbg !695
  %idxprom = sext i32 %shr2 to i64, !dbg !696
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @wl_code_table, i64 0, i64 %idxprom, !dbg !696
  %4 = load i32, i32* %arrayidx, align 4, !dbg !696
  %add = add i32 %conv1, %4, !dbg !697
  store i32 %add, i32* %nbl.addr, align 4, !dbg !698
  %5 = load i32, i32* %nbl.addr, align 4, !dbg !699
  %cmp = icmp slt i32 %5, 0, !dbg !701
  br i1 %cmp, label %if.then, label %if.end, !dbg !702

if.then:                                          ; preds = %entry
  store i32 0, i32* %nbl.addr, align 4, !dbg !703
  br label %if.end, !dbg !704

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32, i32* %nbl.addr, align 4, !dbg !705
  %cmp3 = icmp sgt i32 %6, 18432, !dbg !707
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !708

if.then4:                                         ; preds = %if.end
  store i32 18432, i32* %nbl.addr, align 4, !dbg !709
  br label %if.end5, !dbg !710

if.end5:                                          ; preds = %if.then4, %if.end
  %7 = load i32, i32* %nbl.addr, align 4, !dbg !711
  %8 = bitcast i64* %wd to i8*, !dbg !712
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %8) #5, !dbg !712
  ret i32 %7, !dbg !713
}

; Function Attrs: nounwind
define i32 @scalel(i32 %nbl, i32 %shift_constant) #3 !dbg !714 {
entry:
  %nbl.addr = alloca i32, align 4
  %shift_constant.addr = alloca i32, align 4
  %wd1 = alloca i32, align 4
  %wd2 = alloca i32, align 4
  %wd3 = alloca i32, align 4
  store i32 %nbl, i32* %nbl.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nbl.addr, metadata !715, metadata !DIExpression()), !dbg !716
  store i32 %shift_constant, i32* %shift_constant.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %shift_constant.addr, metadata !717, metadata !DIExpression()), !dbg !718
  %0 = bitcast i32* %wd1 to i8*, !dbg !719
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5, !dbg !719
  call void @llvm.dbg.declare(metadata i32* %wd1, metadata !720, metadata !DIExpression()), !dbg !721
  %1 = bitcast i32* %wd2 to i8*, !dbg !719
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5, !dbg !719
  call void @llvm.dbg.declare(metadata i32* %wd2, metadata !722, metadata !DIExpression()), !dbg !723
  %2 = bitcast i32* %wd3 to i8*, !dbg !719
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5, !dbg !719
  call void @llvm.dbg.declare(metadata i32* %wd3, metadata !724, metadata !DIExpression()), !dbg !725
  %3 = load i32, i32* %nbl.addr, align 4, !dbg !726
  %shr = ashr i32 %3, 6, !dbg !727
  %and = and i32 %shr, 31, !dbg !728
  store i32 %and, i32* %wd1, align 4, !dbg !729
  %4 = load i32, i32* %nbl.addr, align 4, !dbg !730
  %shr1 = ashr i32 %4, 11, !dbg !731
  store i32 %shr1, i32* %wd2, align 4, !dbg !732
  %5 = load i32, i32* %wd1, align 4, !dbg !733
  %idxprom = sext i32 %5 to i64, !dbg !734
  %arrayidx = getelementptr inbounds [32 x i32], [32 x i32]* @ilb_table, i64 0, i64 %idxprom, !dbg !734
  %6 = load i32, i32* %arrayidx, align 4, !dbg !734
  %7 = load i32, i32* %shift_constant.addr, align 4, !dbg !735
  %add = add i32 %7, 1, !dbg !736
  %8 = load i32, i32* %wd2, align 4, !dbg !737
  %sub = sub i32 %add, %8, !dbg !738
  %shr2 = ashr i32 %6, %sub, !dbg !739
  store i32 %shr2, i32* %wd3, align 4, !dbg !740
  %9 = load i32, i32* %wd3, align 4, !dbg !741
  %shl = shl i32 %9, 3, !dbg !742
  %10 = bitcast i32* %wd3 to i8*, !dbg !743
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #5, !dbg !743
  %11 = bitcast i32* %wd2 to i8*, !dbg !743
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %11) #5, !dbg !743
  %12 = bitcast i32* %wd1 to i8*, !dbg !743
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %12) #5, !dbg !743
  ret i32 %shl, !dbg !744
}

; Function Attrs: nounwind
define void @upzero(i32 %dlt, i32* %dlti, i32* %bli) #3 !dbg !745 {
entry:
  %dlt.addr = alloca i32, align 4
  %dlti.addr = alloca i32*, align 8
  %bli.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %wd2 = alloca i32, align 4
  %wd3 = alloca i32, align 4
  store i32 %dlt, i32* %dlt.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %dlt.addr, metadata !748, metadata !DIExpression()), !dbg !749
  store i32* %dlti, i32** %dlti.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %dlti.addr, metadata !750, metadata !DIExpression()), !dbg !751
  store i32* %bli, i32** %bli.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %bli.addr, metadata !752, metadata !DIExpression()), !dbg !753
  %0 = bitcast i32* %i to i8*, !dbg !754
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5, !dbg !754
  call void @llvm.dbg.declare(metadata i32* %i, metadata !755, metadata !DIExpression()), !dbg !756
  %1 = bitcast i32* %wd2 to i8*, !dbg !754
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5, !dbg !754
  call void @llvm.dbg.declare(metadata i32* %wd2, metadata !757, metadata !DIExpression()), !dbg !758
  %2 = bitcast i32* %wd3 to i8*, !dbg !754
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5, !dbg !754
  call void @llvm.dbg.declare(metadata i32* %wd3, metadata !759, metadata !DIExpression()), !dbg !760
  %3 = load i32, i32* %dlt.addr, align 4, !dbg !761
  %cmp = icmp eq i32 %3, 0, !dbg !763
  br i1 %cmp, label %if.then, label %if.else, !dbg !764

if.then:                                          ; preds = %entry
  br label %upzero_label10, !dbg !765

upzero_label10:                                   ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !766
  br label %for.cond, !dbg !769

for.cond:                                         ; preds = %for.inc, %upzero_label10
  %4 = load i32, i32* %i, align 4, !dbg !770
  %cmp1 = icmp slt i32 %4, 6, !dbg !772
  br i1 %cmp1, label %for.body, label %for.end, !dbg !773

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %bli.addr, align 8, !dbg !774
  %6 = load i32, i32* %i, align 4, !dbg !776
  %idxprom = sext i32 %6 to i64, !dbg !774
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !774
  %7 = load i32, i32* %arrayidx, align 4, !dbg !774
  %conv = sext i32 %7 to i64, !dbg !774
  %mul = mul i64 255, %conv, !dbg !777
  %shr = ashr i64 %mul, 8, !dbg !778
  %conv2 = trunc i64 %shr to i32, !dbg !779
  %8 = load i32*, i32** %bli.addr, align 8, !dbg !780
  %9 = load i32, i32* %i, align 4, !dbg !781
  %idxprom3 = sext i32 %9 to i64, !dbg !780
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %idxprom3, !dbg !780
  store i32 %conv2, i32* %arrayidx4, align 4, !dbg !782
  br label %for.inc, !dbg !783

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !784
  %inc = add i32 %10, 1, !dbg !784
  store i32 %inc, i32* %i, align 4, !dbg !784
  br label %for.cond, !dbg !785, !llvm.loop !786

for.end:                                          ; preds = %for.cond
  br label %if.end27, !dbg !789

if.else:                                          ; preds = %entry
  br label %upzero_label11, !dbg !790

upzero_label11:                                   ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !791
  br label %for.cond5, !dbg !794

for.cond5:                                        ; preds = %for.inc24, %upzero_label11
  %11 = load i32, i32* %i, align 4, !dbg !795
  %cmp6 = icmp slt i32 %11, 6, !dbg !797
  br i1 %cmp6, label %for.body7, label %for.end26, !dbg !798

for.body7:                                        ; preds = %for.cond5
  %12 = load i32, i32* %dlt.addr, align 4, !dbg !799
  %conv8 = sext i32 %12 to i64, !dbg !802
  %13 = load i32*, i32** %dlti.addr, align 8, !dbg !803
  %14 = load i32, i32* %i, align 4, !dbg !804
  %idxprom9 = sext i32 %14 to i64, !dbg !803
  %arrayidx10 = getelementptr inbounds i32, i32* %13, i64 %idxprom9, !dbg !803
  %15 = load i32, i32* %arrayidx10, align 4, !dbg !803
  %conv11 = sext i32 %15 to i64, !dbg !803
  %mul12 = mul i64 %conv8, %conv11, !dbg !805
  %cmp13 = icmp sge i64 %mul12, 0, !dbg !806
  br i1 %cmp13, label %if.then14, label %if.else15, !dbg !807

if.then14:                                        ; preds = %for.body7
  store i32 128, i32* %wd2, align 4, !dbg !808
  br label %if.end, !dbg !809

if.else15:                                        ; preds = %for.body7
  store i32 -128, i32* %wd2, align 4, !dbg !810
  br label %if.end

if.end:                                           ; preds = %if.else15, %if.then14
  %16 = load i32*, i32** %bli.addr, align 8, !dbg !811
  %17 = load i32, i32* %i, align 4, !dbg !812
  %idxprom16 = sext i32 %17 to i64, !dbg !811
  %arrayidx17 = getelementptr inbounds i32, i32* %16, i64 %idxprom16, !dbg !811
  %18 = load i32, i32* %arrayidx17, align 4, !dbg !811
  %conv18 = sext i32 %18 to i64, !dbg !811
  %mul19 = mul i64 255, %conv18, !dbg !813
  %shr20 = ashr i64 %mul19, 8, !dbg !814
  %conv21 = trunc i64 %shr20 to i32, !dbg !815
  store i32 %conv21, i32* %wd3, align 4, !dbg !816
  %19 = load i32, i32* %wd2, align 4, !dbg !817
  %20 = load i32, i32* %wd3, align 4, !dbg !818
  %add = add i32 %19, %20, !dbg !819
  %21 = load i32*, i32** %bli.addr, align 8, !dbg !820
  %22 = load i32, i32* %i, align 4, !dbg !821
  %idxprom22 = sext i32 %22 to i64, !dbg !820
  %arrayidx23 = getelementptr inbounds i32, i32* %21, i64 %idxprom22, !dbg !820
  store i32 %add, i32* %arrayidx23, align 4, !dbg !822
  br label %for.inc24, !dbg !823

for.inc24:                                        ; preds = %if.end
  %23 = load i32, i32* %i, align 4, !dbg !824
  %inc25 = add i32 %23, 1, !dbg !824
  store i32 %inc25, i32* %i, align 4, !dbg !824
  br label %for.cond5, !dbg !825, !llvm.loop !826

for.end26:                                        ; preds = %for.cond5
  br label %if.end27

if.end27:                                         ; preds = %for.end26, %for.end
  %24 = load i32*, i32** %dlti.addr, align 8, !dbg !829
  %arrayidx28 = getelementptr inbounds i32, i32* %24, i64 4, !dbg !829
  %25 = load i32, i32* %arrayidx28, align 4, !dbg !829
  %26 = load i32*, i32** %dlti.addr, align 8, !dbg !830
  %arrayidx29 = getelementptr inbounds i32, i32* %26, i64 5, !dbg !830
  store i32 %25, i32* %arrayidx29, align 4, !dbg !831
  %27 = load i32*, i32** %dlti.addr, align 8, !dbg !832
  %arrayidx30 = getelementptr inbounds i32, i32* %27, i64 3, !dbg !832
  %28 = load i32, i32* %arrayidx30, align 4, !dbg !832
  %29 = load i32*, i32** %dlti.addr, align 8, !dbg !833
  %arrayidx31 = getelementptr inbounds i32, i32* %29, i64 4, !dbg !833
  store i32 %28, i32* %arrayidx31, align 4, !dbg !834
  %30 = load i32*, i32** %dlti.addr, align 8, !dbg !835
  %arrayidx32 = getelementptr inbounds i32, i32* %30, i64 2, !dbg !835
  %31 = load i32, i32* %arrayidx32, align 4, !dbg !835
  %32 = load i32*, i32** %dlti.addr, align 8, !dbg !836
  %arrayidx33 = getelementptr inbounds i32, i32* %32, i64 3, !dbg !836
  store i32 %31, i32* %arrayidx33, align 4, !dbg !837
  %33 = load i32*, i32** %dlti.addr, align 8, !dbg !838
  %arrayidx34 = getelementptr inbounds i32, i32* %33, i64 1, !dbg !838
  %34 = load i32, i32* %arrayidx34, align 4, !dbg !838
  %35 = load i32*, i32** %dlti.addr, align 8, !dbg !839
  %arrayidx35 = getelementptr inbounds i32, i32* %35, i64 2, !dbg !839
  store i32 %34, i32* %arrayidx35, align 4, !dbg !840
  %36 = load i32*, i32** %dlti.addr, align 8, !dbg !841
  %arrayidx36 = getelementptr inbounds i32, i32* %36, i64 0, !dbg !841
  %37 = load i32, i32* %arrayidx36, align 4, !dbg !841
  %38 = load i32*, i32** %dlti.addr, align 8, !dbg !842
  %arrayidx37 = getelementptr inbounds i32, i32* %38, i64 1, !dbg !842
  store i32 %37, i32* %arrayidx37, align 4, !dbg !843
  %39 = load i32, i32* %dlt.addr, align 4, !dbg !844
  %40 = load i32*, i32** %dlti.addr, align 8, !dbg !845
  %arrayidx38 = getelementptr inbounds i32, i32* %40, i64 0, !dbg !845
  store i32 %39, i32* %arrayidx38, align 4, !dbg !846
  %41 = bitcast i32* %wd3 to i8*, !dbg !847
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %41) #5, !dbg !847
  %42 = bitcast i32* %wd2 to i8*, !dbg !847
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %42) #5, !dbg !847
  %43 = bitcast i32* %i to i8*, !dbg !847
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %43) #5, !dbg !847
  ret void, !dbg !847
}

; Function Attrs: nounwind
define i32 @uppol2(i32 %al1, i32 %al2, i32 %plt, i32 %plt1, i32 %plt2) #3 !dbg !848 {
entry:
  %al1.addr = alloca i32, align 4
  %al2.addr = alloca i32, align 4
  %plt.addr = alloca i32, align 4
  %plt1.addr = alloca i32, align 4
  %plt2.addr = alloca i32, align 4
  %wd2 = alloca i64, align 8
  %wd4 = alloca i64, align 8
  %apl2 = alloca i32, align 4
  store i32 %al1, i32* %al1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %al1.addr, metadata !851, metadata !DIExpression()), !dbg !852
  store i32 %al2, i32* %al2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %al2.addr, metadata !853, metadata !DIExpression()), !dbg !854
  store i32 %plt, i32* %plt.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %plt.addr, metadata !855, metadata !DIExpression()), !dbg !856
  store i32 %plt1, i32* %plt1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %plt1.addr, metadata !857, metadata !DIExpression()), !dbg !858
  store i32 %plt2, i32* %plt2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %plt2.addr, metadata !859, metadata !DIExpression()), !dbg !860
  %0 = bitcast i64* %wd2 to i8*, !dbg !861
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5, !dbg !861
  call void @llvm.dbg.declare(metadata i64* %wd2, metadata !862, metadata !DIExpression()), !dbg !863
  %1 = bitcast i64* %wd4 to i8*, !dbg !861
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #5, !dbg !861
  call void @llvm.dbg.declare(metadata i64* %wd4, metadata !864, metadata !DIExpression()), !dbg !865
  %2 = bitcast i32* %apl2 to i8*, !dbg !866
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5, !dbg !866
  call void @llvm.dbg.declare(metadata i32* %apl2, metadata !867, metadata !DIExpression()), !dbg !868
  %3 = load i32, i32* %al1.addr, align 4, !dbg !869
  %conv = sext i32 %3 to i64, !dbg !870
  %mul = mul i64 4, %conv, !dbg !871
  store i64 %mul, i64* %wd2, align 8, !dbg !872
  %4 = load i32, i32* %plt.addr, align 4, !dbg !873
  %conv1 = sext i32 %4 to i64, !dbg !875
  %5 = load i32, i32* %plt1.addr, align 4, !dbg !876
  %conv2 = sext i32 %5 to i64, !dbg !876
  %mul3 = mul i64 %conv1, %conv2, !dbg !877
  %cmp = icmp sge i64 %mul3, 0, !dbg !878
  br i1 %cmp, label %if.then, label %if.end, !dbg !879

if.then:                                          ; preds = %entry
  %6 = load i64, i64* %wd2, align 8, !dbg !880
  %sub = sub i64 0, %6, !dbg !881
  store i64 %sub, i64* %wd2, align 8, !dbg !882
  br label %if.end, !dbg !883

if.end:                                           ; preds = %if.then, %entry
  %7 = load i64, i64* %wd2, align 8, !dbg !884
  %shr = ashr i64 %7, 7, !dbg !885
  store i64 %shr, i64* %wd2, align 8, !dbg !886
  %8 = load i32, i32* %plt.addr, align 4, !dbg !887
  %conv4 = sext i32 %8 to i64, !dbg !889
  %9 = load i32, i32* %plt2.addr, align 4, !dbg !890
  %conv5 = sext i32 %9 to i64, !dbg !890
  %mul6 = mul i64 %conv4, %conv5, !dbg !891
  %cmp7 = icmp sge i64 %mul6, 0, !dbg !892
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !893

if.then8:                                         ; preds = %if.end
  %10 = load i64, i64* %wd2, align 8, !dbg !894
  %add = add i64 %10, 128, !dbg !896
  store i64 %add, i64* %wd4, align 8, !dbg !897
  br label %if.end10, !dbg !898

if.else:                                          ; preds = %if.end
  %11 = load i64, i64* %wd2, align 8, !dbg !899
  %sub9 = sub i64 %11, 128, !dbg !901
  store i64 %sub9, i64* %wd4, align 8, !dbg !902
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then8
  %12 = load i64, i64* %wd4, align 8, !dbg !903
  %13 = load i32, i32* %al2.addr, align 4, !dbg !904
  %conv11 = sext i32 %13 to i64, !dbg !905
  %mul12 = mul i64 127, %conv11, !dbg !906
  %shr13 = ashr i64 %mul12, 7, !dbg !907
  %add14 = add i64 %12, %shr13, !dbg !908
  %conv15 = trunc i64 %add14 to i32, !dbg !903
  store i32 %conv15, i32* %apl2, align 4, !dbg !909
  %14 = load i32, i32* %apl2, align 4, !dbg !910
  %cmp16 = icmp sgt i32 %14, 12288, !dbg !912
  br i1 %cmp16, label %if.then17, label %if.end18, !dbg !913

if.then17:                                        ; preds = %if.end10
  store i32 12288, i32* %apl2, align 4, !dbg !914
  br label %if.end18, !dbg !915

if.end18:                                         ; preds = %if.then17, %if.end10
  %15 = load i32, i32* %apl2, align 4, !dbg !916
  %cmp19 = icmp slt i32 %15, -12288, !dbg !918
  br i1 %cmp19, label %if.then20, label %if.end21, !dbg !919

if.then20:                                        ; preds = %if.end18
  store i32 -12288, i32* %apl2, align 4, !dbg !920
  br label %if.end21, !dbg !921

if.end21:                                         ; preds = %if.then20, %if.end18
  %16 = load i32, i32* %apl2, align 4, !dbg !922
  %17 = bitcast i32* %apl2 to i8*, !dbg !923
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #5, !dbg !923
  %18 = bitcast i64* %wd4 to i8*, !dbg !923
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #5, !dbg !923
  %19 = bitcast i64* %wd2 to i8*, !dbg !923
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #5, !dbg !923
  ret i32 %16, !dbg !924
}

; Function Attrs: nounwind
define i32 @uppol1(i32 %al1, i32 %apl2, i32 %plt, i32 %plt1) #3 !dbg !925 {
entry:
  %al1.addr = alloca i32, align 4
  %apl2.addr = alloca i32, align 4
  %plt.addr = alloca i32, align 4
  %plt1.addr = alloca i32, align 4
  %wd2 = alloca i64, align 8
  %wd3 = alloca i32, align 4
  %apl1 = alloca i32, align 4
  store i32 %al1, i32* %al1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %al1.addr, metadata !926, metadata !DIExpression()), !dbg !927
  store i32 %apl2, i32* %apl2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %apl2.addr, metadata !928, metadata !DIExpression()), !dbg !929
  store i32 %plt, i32* %plt.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %plt.addr, metadata !930, metadata !DIExpression()), !dbg !931
  store i32 %plt1, i32* %plt1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %plt1.addr, metadata !932, metadata !DIExpression()), !dbg !933
  %0 = bitcast i64* %wd2 to i8*, !dbg !934
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5, !dbg !934
  call void @llvm.dbg.declare(metadata i64* %wd2, metadata !935, metadata !DIExpression()), !dbg !936
  %1 = bitcast i32* %wd3 to i8*, !dbg !937
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5, !dbg !937
  call void @llvm.dbg.declare(metadata i32* %wd3, metadata !938, metadata !DIExpression()), !dbg !939
  %2 = bitcast i32* %apl1 to i8*, !dbg !937
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5, !dbg !937
  call void @llvm.dbg.declare(metadata i32* %apl1, metadata !940, metadata !DIExpression()), !dbg !941
  %3 = load i32, i32* %al1.addr, align 4, !dbg !942
  %conv = sext i32 %3 to i64, !dbg !943
  %mul = mul i64 %conv, 255, !dbg !944
  %shr = ashr i64 %mul, 8, !dbg !945
  store i64 %shr, i64* %wd2, align 8, !dbg !946
  %4 = load i32, i32* %plt.addr, align 4, !dbg !947
  %conv1 = sext i32 %4 to i64, !dbg !949
  %5 = load i32, i32* %plt1.addr, align 4, !dbg !950
  %conv2 = sext i32 %5 to i64, !dbg !950
  %mul3 = mul i64 %conv1, %conv2, !dbg !951
  %cmp = icmp sge i64 %mul3, 0, !dbg !952
  br i1 %cmp, label %if.then, label %if.else, !dbg !953

if.then:                                          ; preds = %entry
  %6 = load i64, i64* %wd2, align 8, !dbg !954
  %conv4 = trunc i64 %6 to i32, !dbg !956
  %add = add i32 %conv4, 192, !dbg !957
  store i32 %add, i32* %apl1, align 4, !dbg !958
  br label %if.end, !dbg !959

if.else:                                          ; preds = %entry
  %7 = load i64, i64* %wd2, align 8, !dbg !960
  %conv5 = trunc i64 %7 to i32, !dbg !962
  %sub = sub i32 %conv5, 192, !dbg !963
  store i32 %sub, i32* %apl1, align 4, !dbg !964
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %8 = load i32, i32* %apl2.addr, align 4, !dbg !965
  %sub6 = sub i32 15360, %8, !dbg !966
  store i32 %sub6, i32* %wd3, align 4, !dbg !967
  %9 = load i32, i32* %apl1, align 4, !dbg !968
  %10 = load i32, i32* %wd3, align 4, !dbg !970
  %cmp7 = icmp sgt i32 %9, %10, !dbg !971
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !972

if.then8:                                         ; preds = %if.end
  %11 = load i32, i32* %wd3, align 4, !dbg !973
  store i32 %11, i32* %apl1, align 4, !dbg !974
  br label %if.end9, !dbg !975

if.end9:                                          ; preds = %if.then8, %if.end
  %12 = load i32, i32* %apl1, align 4, !dbg !976
  %13 = load i32, i32* %wd3, align 4, !dbg !978
  %sub10 = sub i32 0, %13, !dbg !979
  %cmp11 = icmp slt i32 %12, %sub10, !dbg !980
  br i1 %cmp11, label %if.then12, label %if.end14, !dbg !981

if.then12:                                        ; preds = %if.end9
  %14 = load i32, i32* %wd3, align 4, !dbg !982
  %sub13 = sub i32 0, %14, !dbg !983
  store i32 %sub13, i32* %apl1, align 4, !dbg !984
  br label %if.end14, !dbg !985

if.end14:                                         ; preds = %if.then12, %if.end9
  %15 = load i32, i32* %apl1, align 4, !dbg !986
  %16 = bitcast i32* %apl1 to i8*, !dbg !987
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #5, !dbg !987
  %17 = bitcast i32* %wd3 to i8*, !dbg !987
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #5, !dbg !987
  %18 = bitcast i64* %wd2 to i8*, !dbg !987
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #5, !dbg !987
  ret i32 %15, !dbg !988
}

; Function Attrs: nounwind
define i32 @logsch(i32 %ih, i32 %nbh) #3 !dbg !989 {
entry:
  %ih.addr = alloca i32, align 4
  %nbh.addr = alloca i32, align 4
  %wd = alloca i32, align 4
  store i32 %ih, i32* %ih.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %ih.addr, metadata !990, metadata !DIExpression()), !dbg !991
  store i32 %nbh, i32* %nbh.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %nbh.addr, metadata !992, metadata !DIExpression()), !dbg !993
  %0 = bitcast i32* %wd to i8*, !dbg !994
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5, !dbg !994
  call void @llvm.dbg.declare(metadata i32* %wd, metadata !995, metadata !DIExpression()), !dbg !996
  %1 = load i32, i32* %nbh.addr, align 4, !dbg !997
  %conv = sext i32 %1 to i64, !dbg !998
  %mul = mul i64 %conv, 127, !dbg !999
  %shr = ashr i64 %mul, 7, !dbg !1000
  %conv1 = trunc i64 %shr to i32, !dbg !1001
  store i32 %conv1, i32* %wd, align 4, !dbg !1002
  %2 = load i32, i32* %wd, align 4, !dbg !1003
  %3 = load i32, i32* %ih.addr, align 4, !dbg !1004
  %idxprom = sext i32 %3 to i64, !dbg !1005
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @wh_code_table, i64 0, i64 %idxprom, !dbg !1005
  %4 = load i32, i32* %arrayidx, align 4, !dbg !1005
  %add = add i32 %2, %4, !dbg !1006
  store i32 %add, i32* %nbh.addr, align 4, !dbg !1007
  %5 = load i32, i32* %nbh.addr, align 4, !dbg !1008
  %cmp = icmp slt i32 %5, 0, !dbg !1010
  br i1 %cmp, label %if.then, label %if.end, !dbg !1011

if.then:                                          ; preds = %entry
  store i32 0, i32* %nbh.addr, align 4, !dbg !1012
  br label %if.end, !dbg !1013

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32, i32* %nbh.addr, align 4, !dbg !1014
  %cmp2 = icmp sgt i32 %6, 22528, !dbg !1016
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !1017

if.then3:                                         ; preds = %if.end
  store i32 22528, i32* %nbh.addr, align 4, !dbg !1018
  br label %if.end4, !dbg !1019

if.end4:                                          ; preds = %if.then3, %if.end
  %7 = load i32, i32* %nbh.addr, align 4, !dbg !1020
  %8 = bitcast i32* %wd to i8*, !dbg !1021
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #5, !dbg !1021
  ret i32 %7, !dbg !1022
}

; Function Attrs: nounwind
define void @decode(i32 %input) #3 !dbg !1023 {
entry:
  %input.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %xa1 = alloca i64, align 8
  %xa2 = alloca i64, align 8
  %h_ptr = alloca i32*, align 8
  %ac_ptr = alloca i32*, align 8
  %ac_ptr1 = alloca i32*, align 8
  %ad_ptr = alloca i32*, align 8
  %ad_ptr1 = alloca i32*, align 8
  store i32 %input, i32* %input.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %input.addr, metadata !1026, metadata !DIExpression()), !dbg !1027
  %0 = bitcast i32* %i to i8*, !dbg !1028
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5, !dbg !1028
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1029, metadata !DIExpression()), !dbg !1030
  %1 = bitcast i64* %xa1 to i8*, !dbg !1031
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #5, !dbg !1031
  call void @llvm.dbg.declare(metadata i64* %xa1, metadata !1032, metadata !DIExpression()), !dbg !1033
  %2 = bitcast i64* %xa2 to i8*, !dbg !1031
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #5, !dbg !1031
  call void @llvm.dbg.declare(metadata i64* %xa2, metadata !1034, metadata !DIExpression()), !dbg !1035
  %3 = bitcast i32** %h_ptr to i8*, !dbg !1036
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #5, !dbg !1036
  call void @llvm.dbg.declare(metadata i32** %h_ptr, metadata !1037, metadata !DIExpression()), !dbg !1038
  %4 = bitcast i32** %ac_ptr to i8*, !dbg !1039
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #5, !dbg !1039
  call void @llvm.dbg.declare(metadata i32** %ac_ptr, metadata !1040, metadata !DIExpression()), !dbg !1041
  %5 = bitcast i32** %ac_ptr1 to i8*, !dbg !1039
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #5, !dbg !1039
  call void @llvm.dbg.declare(metadata i32** %ac_ptr1, metadata !1042, metadata !DIExpression()), !dbg !1043
  %6 = bitcast i32** %ad_ptr to i8*, !dbg !1039
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #5, !dbg !1039
  call void @llvm.dbg.declare(metadata i32** %ad_ptr, metadata !1044, metadata !DIExpression()), !dbg !1045
  %7 = bitcast i32** %ad_ptr1 to i8*, !dbg !1039
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #5, !dbg !1039
  call void @llvm.dbg.declare(metadata i32** %ad_ptr1, metadata !1046, metadata !DIExpression()), !dbg !1047
  %8 = load i32, i32* %input.addr, align 4, !dbg !1048
  %and = and i32 %8, 63, !dbg !1049
  store i32 %and, i32* @ilr, align 4, !dbg !1050
  %9 = load i32, i32* %input.addr, align 4, !dbg !1051
  %shr = ashr i32 %9, 6, !dbg !1052
  store i32 %shr, i32* @ih, align 4, !dbg !1053
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0)), !dbg !1054
  store i32 %call, i32* @dec_szl, align 4, !dbg !1055
  %10 = load i32, i32* @dec_rlt1, align 4, !dbg !1056
  %11 = load i32, i32* @dec_al1, align 4, !dbg !1057
  %12 = load i32, i32* @dec_rlt2, align 4, !dbg !1058
  %13 = load i32, i32* @dec_al2, align 4, !dbg !1059
  %call1 = call i32 @filtep(i32 %10, i32 %11, i32 %12, i32 %13), !dbg !1060
  store i32 %call1, i32* @dec_spl, align 4, !dbg !1061
  %14 = load i32, i32* @dec_spl, align 4, !dbg !1062
  %15 = load i32, i32* @dec_szl, align 4, !dbg !1063
  %add = add i32 %14, %15, !dbg !1064
  store i32 %add, i32* @dec_sl, align 4, !dbg !1065
  %16 = load i32, i32* @dec_detl, align 4, !dbg !1066
  %conv = sext i32 %16 to i64, !dbg !1067
  %17 = load i32, i32* @ilr, align 4, !dbg !1068
  %shr2 = ashr i32 %17, 2, !dbg !1069
  %idxprom = sext i32 %shr2 to i64, !dbg !1070
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i64 0, i64 %idxprom, !dbg !1070
  %18 = load i32, i32* %arrayidx, align 4, !dbg !1070
  %conv3 = sext i32 %18 to i64, !dbg !1070
  %mul = mul i64 %conv, %conv3, !dbg !1071
  %shr4 = ashr i64 %mul, 15, !dbg !1072
  %conv5 = trunc i64 %shr4 to i32, !dbg !1073
  store i32 %conv5, i32* @dec_dlt, align 4, !dbg !1074
  %19 = load i32, i32* @dec_detl, align 4, !dbg !1075
  %conv6 = sext i32 %19 to i64, !dbg !1076
  %20 = load i32, i32* @il, align 4, !dbg !1077
  %idxprom7 = sext i32 %20 to i64, !dbg !1078
  %arrayidx8 = getelementptr inbounds [64 x i32], [64 x i32]* @qq6_code6_table, i64 0, i64 %idxprom7, !dbg !1078
  %21 = load i32, i32* %arrayidx8, align 4, !dbg !1078
  %conv9 = sext i32 %21 to i64, !dbg !1078
  %mul10 = mul i64 %conv6, %conv9, !dbg !1079
  %shr11 = ashr i64 %mul10, 15, !dbg !1080
  %conv12 = trunc i64 %shr11 to i32, !dbg !1081
  store i32 %conv12, i32* @dl, align 4, !dbg !1082
  %22 = load i32, i32* @dl, align 4, !dbg !1083
  %23 = load i32, i32* @dec_sl, align 4, !dbg !1084
  %add13 = add i32 %22, %23, !dbg !1085
  store i32 %add13, i32* @rl, align 4, !dbg !1086
  %24 = load i32, i32* @ilr, align 4, !dbg !1087
  %25 = load i32, i32* @dec_nbl, align 4, !dbg !1088
  %call14 = call i32 @logscl(i32 %24, i32 %25), !dbg !1089
  store i32 %call14, i32* @dec_nbl, align 4, !dbg !1090
  %26 = load i32, i32* @dec_nbl, align 4, !dbg !1091
  %call15 = call i32 @scalel(i32 %26, i32 8), !dbg !1092
  store i32 %call15, i32* @dec_detl, align 4, !dbg !1093
  %27 = load i32, i32* @dec_dlt, align 4, !dbg !1094
  %28 = load i32, i32* @dec_szl, align 4, !dbg !1095
  %add16 = add i32 %27, %28, !dbg !1096
  store i32 %add16, i32* @dec_plt, align 4, !dbg !1097
  %29 = load i32, i32* @dec_dlt, align 4, !dbg !1098
  call void @upzero(i32 %29, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0)), !dbg !1099
  %30 = load i32, i32* @dec_al1, align 4, !dbg !1100
  %31 = load i32, i32* @dec_al2, align 4, !dbg !1101
  %32 = load i32, i32* @dec_plt, align 4, !dbg !1102
  %33 = load i32, i32* @dec_plt1, align 4, !dbg !1103
  %34 = load i32, i32* @dec_plt2, align 4, !dbg !1104
  %call17 = call i32 @uppol2(i32 %30, i32 %31, i32 %32, i32 %33, i32 %34), !dbg !1105
  store i32 %call17, i32* @dec_al2, align 4, !dbg !1106
  %35 = load i32, i32* @dec_al1, align 4, !dbg !1107
  %36 = load i32, i32* @dec_al2, align 4, !dbg !1108
  %37 = load i32, i32* @dec_plt, align 4, !dbg !1109
  %38 = load i32, i32* @dec_plt1, align 4, !dbg !1110
  %call18 = call i32 @uppol1(i32 %35, i32 %36, i32 %37, i32 %38), !dbg !1111
  store i32 %call18, i32* @dec_al1, align 4, !dbg !1112
  %39 = load i32, i32* @dec_sl, align 4, !dbg !1113
  %40 = load i32, i32* @dec_dlt, align 4, !dbg !1114
  %add19 = add i32 %39, %40, !dbg !1115
  store i32 %add19, i32* @dec_rlt, align 4, !dbg !1116
  %41 = load i32, i32* @dec_rlt1, align 4, !dbg !1117
  store i32 %41, i32* @dec_rlt2, align 4, !dbg !1118
  %42 = load i32, i32* @dec_rlt, align 4, !dbg !1119
  store i32 %42, i32* @dec_rlt1, align 4, !dbg !1120
  %43 = load i32, i32* @dec_plt1, align 4, !dbg !1121
  store i32 %43, i32* @dec_plt2, align 4, !dbg !1122
  %44 = load i32, i32* @dec_plt, align 4, !dbg !1123
  store i32 %44, i32* @dec_plt1, align 4, !dbg !1124
  %call20 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0)), !dbg !1125
  store i32 %call20, i32* @dec_szh, align 4, !dbg !1126
  %45 = load i32, i32* @dec_rh1, align 4, !dbg !1127
  %46 = load i32, i32* @dec_ah1, align 4, !dbg !1128
  %47 = load i32, i32* @dec_rh2, align 4, !dbg !1129
  %48 = load i32, i32* @dec_ah2, align 4, !dbg !1130
  %call21 = call i32 @filtep(i32 %45, i32 %46, i32 %47, i32 %48), !dbg !1131
  store i32 %call21, i32* @dec_sph, align 4, !dbg !1132
  %49 = load i32, i32* @dec_sph, align 4, !dbg !1133
  %50 = load i32, i32* @dec_szh, align 4, !dbg !1134
  %add22 = add i32 %49, %50, !dbg !1135
  store i32 %add22, i32* @dec_sh, align 4, !dbg !1136
  %51 = load i32, i32* @dec_deth, align 4, !dbg !1137
  %conv23 = sext i32 %51 to i64, !dbg !1138
  %52 = load i32, i32* @ih, align 4, !dbg !1139
  %idxprom24 = sext i32 %52 to i64, !dbg !1140
  %arrayidx25 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i64 0, i64 %idxprom24, !dbg !1140
  %53 = load i32, i32* %arrayidx25, align 4, !dbg !1140
  %conv26 = sext i32 %53 to i64, !dbg !1140
  %mul27 = mul i64 %conv23, %conv26, !dbg !1141
  %shr28 = ashr i64 %mul27, 15, !dbg !1142
  %conv29 = trunc i64 %shr28 to i32, !dbg !1143
  store i32 %conv29, i32* @dec_dh, align 4, !dbg !1144
  %54 = load i32, i32* @ih, align 4, !dbg !1145
  %55 = load i32, i32* @dec_nbh, align 4, !dbg !1146
  %call30 = call i32 @logsch(i32 %54, i32 %55), !dbg !1147
  store i32 %call30, i32* @dec_nbh, align 4, !dbg !1148
  %56 = load i32, i32* @dec_nbh, align 4, !dbg !1149
  %call31 = call i32 @scalel(i32 %56, i32 10), !dbg !1150
  store i32 %call31, i32* @dec_deth, align 4, !dbg !1151
  %57 = load i32, i32* @dec_dh, align 4, !dbg !1152
  %58 = load i32, i32* @dec_szh, align 4, !dbg !1153
  %add32 = add i32 %57, %58, !dbg !1154
  store i32 %add32, i32* @dec_ph, align 4, !dbg !1155
  %59 = load i32, i32* @dec_dh, align 4, !dbg !1156
  call void @upzero(i32 %59, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0)), !dbg !1157
  %60 = load i32, i32* @dec_ah1, align 4, !dbg !1158
  %61 = load i32, i32* @dec_ah2, align 4, !dbg !1159
  %62 = load i32, i32* @dec_ph, align 4, !dbg !1160
  %63 = load i32, i32* @dec_ph1, align 4, !dbg !1161
  %64 = load i32, i32* @dec_ph2, align 4, !dbg !1162
  %call33 = call i32 @uppol2(i32 %60, i32 %61, i32 %62, i32 %63, i32 %64), !dbg !1163
  store i32 %call33, i32* @dec_ah2, align 4, !dbg !1164
  %65 = load i32, i32* @dec_ah1, align 4, !dbg !1165
  %66 = load i32, i32* @dec_ah2, align 4, !dbg !1166
  %67 = load i32, i32* @dec_ph, align 4, !dbg !1167
  %68 = load i32, i32* @dec_ph1, align 4, !dbg !1168
  %call34 = call i32 @uppol1(i32 %65, i32 %66, i32 %67, i32 %68), !dbg !1169
  store i32 %call34, i32* @dec_ah1, align 4, !dbg !1170
  %69 = load i32, i32* @dec_sh, align 4, !dbg !1171
  %70 = load i32, i32* @dec_dh, align 4, !dbg !1172
  %add35 = add i32 %69, %70, !dbg !1173
  store i32 %add35, i32* @rh, align 4, !dbg !1174
  %71 = load i32, i32* @dec_rh1, align 4, !dbg !1175
  store i32 %71, i32* @dec_rh2, align 4, !dbg !1176
  %72 = load i32, i32* @rh, align 4, !dbg !1177
  store i32 %72, i32* @dec_rh1, align 4, !dbg !1178
  %73 = load i32, i32* @dec_ph1, align 4, !dbg !1179
  store i32 %73, i32* @dec_ph2, align 4, !dbg !1180
  %74 = load i32, i32* @dec_ph, align 4, !dbg !1181
  store i32 %74, i32* @dec_ph1, align 4, !dbg !1182
  %75 = load i32, i32* @rl, align 4, !dbg !1183
  %76 = load i32, i32* @rh, align 4, !dbg !1184
  %sub = sub i32 %75, %76, !dbg !1185
  store i32 %sub, i32* @xd, align 4, !dbg !1186
  %77 = load i32, i32* @rl, align 4, !dbg !1187
  %78 = load i32, i32* @rh, align 4, !dbg !1188
  %add36 = add i32 %77, %78, !dbg !1189
  store i32 %add36, i32* @xs, align 4, !dbg !1190
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 8, !dbg !1191
  store i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 0), i32** %ac_ptr, align 8, !dbg !1192
  store i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 0), i32** %ad_ptr, align 8, !dbg !1193
  %79 = load i32, i32* @xd, align 4, !dbg !1194
  %conv37 = sext i32 %79 to i64, !dbg !1195
  %80 = load i32*, i32** %h_ptr, align 8, !dbg !1196
  %incdec.ptr = getelementptr inbounds i32, i32* %80, i32 1, !dbg !1196
  store i32* %incdec.ptr, i32** %h_ptr, align 8, !dbg !1196
  %81 = load i32, i32* %80, align 4, !dbg !1197
  %conv38 = sext i32 %81 to i64, !dbg !1198
  %mul39 = mul i64 %conv37, %conv38, !dbg !1199
  store i64 %mul39, i64* %xa1, align 8, !dbg !1200
  %82 = load i32, i32* @xs, align 4, !dbg !1201
  %conv40 = sext i32 %82 to i64, !dbg !1202
  %83 = load i32*, i32** %h_ptr, align 8, !dbg !1203
  %incdec.ptr41 = getelementptr inbounds i32, i32* %83, i32 1, !dbg !1203
  store i32* %incdec.ptr41, i32** %h_ptr, align 8, !dbg !1203
  %84 = load i32, i32* %83, align 4, !dbg !1204
  %conv42 = sext i32 %84 to i64, !dbg !1205
  %mul43 = mul i64 %conv40, %conv42, !dbg !1206
  store i64 %mul43, i64* %xa2, align 8, !dbg !1207
  br label %decode_label2, !dbg !1208

decode_label2:                                    ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !1209
  br label %for.cond, !dbg !1211

for.cond:                                         ; preds = %for.inc, %decode_label2
  %85 = load i32, i32* %i, align 4, !dbg !1212
  %cmp = icmp slt i32 %85, 10, !dbg !1214
  br i1 %cmp, label %for.body, label %for.end, !dbg !1215

for.body:                                         ; preds = %for.cond
  %86 = load i32*, i32** %ac_ptr, align 8, !dbg !1216
  %incdec.ptr44 = getelementptr inbounds i32, i32* %86, i32 1, !dbg !1216
  store i32* %incdec.ptr44, i32** %ac_ptr, align 8, !dbg !1216
  %87 = load i32, i32* %86, align 4, !dbg !1218
  %conv45 = sext i32 %87 to i64, !dbg !1219
  %88 = load i32*, i32** %h_ptr, align 8, !dbg !1220
  %incdec.ptr46 = getelementptr inbounds i32, i32* %88, i32 1, !dbg !1220
  store i32* %incdec.ptr46, i32** %h_ptr, align 8, !dbg !1220
  %89 = load i32, i32* %88, align 4, !dbg !1221
  %conv47 = sext i32 %89 to i64, !dbg !1222
  %mul48 = mul i64 %conv45, %conv47, !dbg !1223
  %90 = load i64, i64* %xa1, align 8, !dbg !1224
  %add49 = add i64 %90, %mul48, !dbg !1224
  store i64 %add49, i64* %xa1, align 8, !dbg !1224
  %91 = load i32*, i32** %ad_ptr, align 8, !dbg !1225
  %incdec.ptr50 = getelementptr inbounds i32, i32* %91, i32 1, !dbg !1225
  store i32* %incdec.ptr50, i32** %ad_ptr, align 8, !dbg !1225
  %92 = load i32, i32* %91, align 4, !dbg !1226
  %conv51 = sext i32 %92 to i64, !dbg !1227
  %93 = load i32*, i32** %h_ptr, align 8, !dbg !1228
  %incdec.ptr52 = getelementptr inbounds i32, i32* %93, i32 1, !dbg !1228
  store i32* %incdec.ptr52, i32** %h_ptr, align 8, !dbg !1228
  %94 = load i32, i32* %93, align 4, !dbg !1229
  %conv53 = sext i32 %94 to i64, !dbg !1230
  %mul54 = mul i64 %conv51, %conv53, !dbg !1231
  %95 = load i64, i64* %xa2, align 8, !dbg !1232
  %add55 = add i64 %95, %mul54, !dbg !1232
  store i64 %add55, i64* %xa2, align 8, !dbg !1232
  br label %for.inc, !dbg !1233

for.inc:                                          ; preds = %for.body
  %96 = load i32, i32* %i, align 4, !dbg !1234
  %inc = add i32 %96, 1, !dbg !1234
  store i32 %inc, i32* %i, align 4, !dbg !1234
  br label %for.cond, !dbg !1235, !llvm.loop !1236

for.end:                                          ; preds = %for.cond
  %97 = load i32*, i32** %ac_ptr, align 8, !dbg !1239
  %98 = load i32, i32* %97, align 4, !dbg !1240
  %conv56 = sext i32 %98 to i64, !dbg !1241
  %99 = load i32*, i32** %h_ptr, align 8, !dbg !1242
  %incdec.ptr57 = getelementptr inbounds i32, i32* %99, i32 1, !dbg !1242
  store i32* %incdec.ptr57, i32** %h_ptr, align 8, !dbg !1242
  %100 = load i32, i32* %99, align 4, !dbg !1243
  %conv58 = sext i32 %100 to i64, !dbg !1244
  %mul59 = mul i64 %conv56, %conv58, !dbg !1245
  %101 = load i64, i64* %xa1, align 8, !dbg !1246
  %add60 = add i64 %101, %mul59, !dbg !1246
  store i64 %add60, i64* %xa1, align 8, !dbg !1246
  %102 = load i32*, i32** %ad_ptr, align 8, !dbg !1247
  %103 = load i32, i32* %102, align 4, !dbg !1248
  %conv61 = sext i32 %103 to i64, !dbg !1249
  %104 = load i32*, i32** %h_ptr, align 8, !dbg !1250
  %incdec.ptr62 = getelementptr inbounds i32, i32* %104, i32 1, !dbg !1250
  store i32* %incdec.ptr62, i32** %h_ptr, align 8, !dbg !1250
  %105 = load i32, i32* %104, align 4, !dbg !1251
  %conv63 = sext i32 %105 to i64, !dbg !1252
  %mul64 = mul i64 %conv61, %conv63, !dbg !1253
  %106 = load i64, i64* %xa2, align 8, !dbg !1254
  %add65 = add i64 %106, %mul64, !dbg !1254
  store i64 %add65, i64* %xa2, align 8, !dbg !1254
  %107 = load i64, i64* %xa1, align 8, !dbg !1255
  %shr66 = ashr i64 %107, 14, !dbg !1256
  %conv67 = trunc i64 %shr66 to i32, !dbg !1255
  store i32 %conv67, i32* @xout1, align 4, !dbg !1257
  %108 = load i64, i64* %xa2, align 8, !dbg !1258
  %shr68 = ashr i64 %108, 14, !dbg !1259
  %conv69 = trunc i64 %shr68 to i32, !dbg !1258
  store i32 %conv69, i32* @xout2, align 4, !dbg !1260
  %109 = load i32*, i32** %ac_ptr, align 8, !dbg !1261
  %add.ptr = getelementptr inbounds i32, i32* %109, i64 -1, !dbg !1262
  store i32* %add.ptr, i32** %ac_ptr1, align 8, !dbg !1263
  %110 = load i32*, i32** %ad_ptr, align 8, !dbg !1264
  %add.ptr70 = getelementptr inbounds i32, i32* %110, i64 -1, !dbg !1265
  store i32* %add.ptr70, i32** %ad_ptr1, align 8, !dbg !1266
  br label %decode_label3, !dbg !1267

decode_label3:                                    ; preds = %for.end
  store i32 0, i32* %i, align 4, !dbg !1268
  br label %for.cond71, !dbg !1270

for.cond71:                                       ; preds = %for.inc78, %decode_label3
  %111 = load i32, i32* %i, align 4, !dbg !1271
  %cmp72 = icmp slt i32 %111, 10, !dbg !1273
  br i1 %cmp72, label %for.body73, label %for.end80, !dbg !1274

for.body73:                                       ; preds = %for.cond71
  %112 = load i32*, i32** %ac_ptr1, align 8, !dbg !1275
  %incdec.ptr74 = getelementptr inbounds i32, i32* %112, i32 -1, !dbg !1275
  store i32* %incdec.ptr74, i32** %ac_ptr1, align 8, !dbg !1275
  %113 = load i32, i32* %112, align 4, !dbg !1277
  %114 = load i32*, i32** %ac_ptr, align 8, !dbg !1278
  %incdec.ptr75 = getelementptr inbounds i32, i32* %114, i32 -1, !dbg !1278
  store i32* %incdec.ptr75, i32** %ac_ptr, align 8, !dbg !1278
  store i32 %113, i32* %114, align 4, !dbg !1279
  %115 = load i32*, i32** %ad_ptr1, align 8, !dbg !1280
  %incdec.ptr76 = getelementptr inbounds i32, i32* %115, i32 -1, !dbg !1280
  store i32* %incdec.ptr76, i32** %ad_ptr1, align 8, !dbg !1280
  %116 = load i32, i32* %115, align 4, !dbg !1281
  %117 = load i32*, i32** %ad_ptr, align 8, !dbg !1282
  %incdec.ptr77 = getelementptr inbounds i32, i32* %117, i32 -1, !dbg !1282
  store i32* %incdec.ptr77, i32** %ad_ptr, align 8, !dbg !1282
  store i32 %116, i32* %117, align 4, !dbg !1283
  br label %for.inc78, !dbg !1284

for.inc78:                                        ; preds = %for.body73
  %118 = load i32, i32* %i, align 4, !dbg !1285
  %inc79 = add i32 %118, 1, !dbg !1285
  store i32 %inc79, i32* %i, align 4, !dbg !1285
  br label %for.cond71, !dbg !1286, !llvm.loop !1287

for.end80:                                        ; preds = %for.cond71
  %119 = load i32, i32* @xd, align 4, !dbg !1290
  %120 = load i32*, i32** %ac_ptr, align 8, !dbg !1291
  store i32 %119, i32* %120, align 4, !dbg !1292
  %121 = load i32, i32* @xs, align 4, !dbg !1293
  %122 = load i32*, i32** %ad_ptr, align 8, !dbg !1294
  store i32 %121, i32* %122, align 4, !dbg !1295
  %123 = bitcast i32** %ad_ptr1 to i8*, !dbg !1296
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %123) #5, !dbg !1296
  %124 = bitcast i32** %ad_ptr to i8*, !dbg !1296
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %124) #5, !dbg !1296
  %125 = bitcast i32** %ac_ptr1 to i8*, !dbg !1296
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %125) #5, !dbg !1296
  %126 = bitcast i32** %ac_ptr to i8*, !dbg !1296
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %126) #5, !dbg !1296
  %127 = bitcast i32** %h_ptr to i8*, !dbg !1296
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %127) #5, !dbg !1296
  %128 = bitcast i64* %xa2 to i8*, !dbg !1296
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %128) #5, !dbg !1296
  %129 = bitcast i64* %xa1 to i8*, !dbg !1296
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %129) #5, !dbg !1296
  %130 = bitcast i32* %i to i8*, !dbg !1296
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %130) #5, !dbg !1296
  ret void, !dbg !1296
}

; Function Attrs: nounwind
define void @reset() #3 !dbg !1297 {
entry:
  %i = alloca i32, align 4
  %0 = bitcast i32* %i to i8*, !dbg !1300
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5, !dbg !1300
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1301, metadata !DIExpression()), !dbg !1302
  store i32 32, i32* @dec_detl, align 4, !dbg !1303
  store i32 32, i32* @detl, align 4, !dbg !1304
  store i32 8, i32* @dec_deth, align 4, !dbg !1305
  store i32 8, i32* @deth, align 4, !dbg !1306
  store i32 0, i32* @rlt2, align 4, !dbg !1307
  store i32 0, i32* @rlt1, align 4, !dbg !1308
  store i32 0, i32* @plt2, align 4, !dbg !1309
  store i32 0, i32* @plt1, align 4, !dbg !1310
  store i32 0, i32* @al2, align 4, !dbg !1311
  store i32 0, i32* @al1, align 4, !dbg !1312
  store i32 0, i32* @nbl, align 4, !dbg !1313
  store i32 0, i32* @rh2, align 4, !dbg !1314
  store i32 0, i32* @rh1, align 4, !dbg !1315
  store i32 0, i32* @ph2, align 4, !dbg !1316
  store i32 0, i32* @ph1, align 4, !dbg !1317
  store i32 0, i32* @ah2, align 4, !dbg !1318
  store i32 0, i32* @ah1, align 4, !dbg !1319
  store i32 0, i32* @nbh, align 4, !dbg !1320
  store i32 0, i32* @dec_rlt2, align 4, !dbg !1321
  store i32 0, i32* @dec_rlt1, align 4, !dbg !1322
  store i32 0, i32* @dec_plt2, align 4, !dbg !1323
  store i32 0, i32* @dec_plt1, align 4, !dbg !1324
  store i32 0, i32* @dec_al2, align 4, !dbg !1325
  store i32 0, i32* @dec_al1, align 4, !dbg !1326
  store i32 0, i32* @dec_nbl, align 4, !dbg !1327
  store i32 0, i32* @dec_rh2, align 4, !dbg !1328
  store i32 0, i32* @dec_rh1, align 4, !dbg !1329
  store i32 0, i32* @dec_ph2, align 4, !dbg !1330
  store i32 0, i32* @dec_ph1, align 4, !dbg !1331
  store i32 0, i32* @dec_ah2, align 4, !dbg !1332
  store i32 0, i32* @dec_ah1, align 4, !dbg !1333
  store i32 0, i32* @dec_nbh, align 4, !dbg !1334
  br label %reset_label4, !dbg !1335

reset_label4:                                     ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !1336
  br label %for.cond, !dbg !1338

for.cond:                                         ; preds = %for.inc, %reset_label4
  %1 = load i32, i32* %i, align 4, !dbg !1339
  %cmp = icmp slt i32 %1, 6, !dbg !1341
  br i1 %cmp, label %for.body, label %for.end, !dbg !1342

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !1343
  %idxprom = sext i32 %2 to i64, !dbg !1345
  %arrayidx = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dltx, i64 0, i64 %idxprom, !dbg !1345
  store i32 0, i32* %arrayidx, align 4, !dbg !1346
  %3 = load i32, i32* %i, align 4, !dbg !1347
  %idxprom1 = sext i32 %3 to i64, !dbg !1348
  %arrayidx2 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dhx, i64 0, i64 %idxprom1, !dbg !1348
  store i32 0, i32* %arrayidx2, align 4, !dbg !1349
  %4 = load i32, i32* %i, align 4, !dbg !1350
  %idxprom3 = sext i32 %4 to i64, !dbg !1351
  %arrayidx4 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dltx, i64 0, i64 %idxprom3, !dbg !1351
  store i32 0, i32* %arrayidx4, align 4, !dbg !1352
  %5 = load i32, i32* %i, align 4, !dbg !1353
  %idxprom5 = sext i32 %5 to i64, !dbg !1354
  %arrayidx6 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dhx, i64 0, i64 %idxprom5, !dbg !1354
  store i32 0, i32* %arrayidx6, align 4, !dbg !1355
  br label %for.inc, !dbg !1356

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !1357
  %inc = add i32 %6, 1, !dbg !1357
  store i32 %inc, i32* %i, align 4, !dbg !1357
  br label %for.cond, !dbg !1358, !llvm.loop !1359

for.end:                                          ; preds = %for.cond
  br label %reset_label5, !dbg !1360

reset_label5:                                     ; preds = %for.end
  store i32 0, i32* %i, align 4, !dbg !1362
  br label %for.cond7, !dbg !1364

for.cond7:                                        ; preds = %for.inc18, %reset_label5
  %7 = load i32, i32* %i, align 4, !dbg !1365
  %cmp8 = icmp slt i32 %7, 6, !dbg !1367
  br i1 %cmp8, label %for.body9, label %for.end20, !dbg !1368

for.body9:                                        ; preds = %for.cond7
  %8 = load i32, i32* %i, align 4, !dbg !1369
  %idxprom10 = sext i32 %8 to i64, !dbg !1371
  %arrayidx11 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bpl, i64 0, i64 %idxprom10, !dbg !1371
  store i32 0, i32* %arrayidx11, align 4, !dbg !1372
  %9 = load i32, i32* %i, align 4, !dbg !1373
  %idxprom12 = sext i32 %9 to i64, !dbg !1374
  %arrayidx13 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bph, i64 0, i64 %idxprom12, !dbg !1374
  store i32 0, i32* %arrayidx13, align 4, !dbg !1375
  %10 = load i32, i32* %i, align 4, !dbg !1376
  %idxprom14 = sext i32 %10 to i64, !dbg !1377
  %arrayidx15 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bpl, i64 0, i64 %idxprom14, !dbg !1377
  store i32 0, i32* %arrayidx15, align 4, !dbg !1378
  %11 = load i32, i32* %i, align 4, !dbg !1379
  %idxprom16 = sext i32 %11 to i64, !dbg !1380
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bph, i64 0, i64 %idxprom16, !dbg !1380
  store i32 0, i32* %arrayidx17, align 4, !dbg !1381
  br label %for.inc18, !dbg !1382

for.inc18:                                        ; preds = %for.body9
  %12 = load i32, i32* %i, align 4, !dbg !1383
  %inc19 = add i32 %12, 1, !dbg !1383
  store i32 %inc19, i32* %i, align 4, !dbg !1383
  br label %for.cond7, !dbg !1384, !llvm.loop !1385

for.end20:                                        ; preds = %for.cond7
  br label %reset_label6, !dbg !1386

reset_label6:                                     ; preds = %for.end20
  store i32 0, i32* %i, align 4, !dbg !1388
  br label %for.cond21, !dbg !1390

for.cond21:                                       ; preds = %for.inc26, %reset_label6
  %13 = load i32, i32* %i, align 4, !dbg !1391
  %cmp22 = icmp slt i32 %13, 24, !dbg !1393
  br i1 %cmp22, label %for.body23, label %for.end28, !dbg !1394

for.body23:                                       ; preds = %for.cond21
  %14 = load i32, i32* %i, align 4, !dbg !1395
  %idxprom24 = sext i32 %14 to i64, !dbg !1396
  %arrayidx25 = getelementptr inbounds [24 x i32], [24 x i32]* @tqmf, i64 0, i64 %idxprom24, !dbg !1396
  store i32 0, i32* %arrayidx25, align 4, !dbg !1397
  br label %for.inc26, !dbg !1396

for.inc26:                                        ; preds = %for.body23
  %15 = load i32, i32* %i, align 4, !dbg !1398
  %inc27 = add i32 %15, 1, !dbg !1398
  store i32 %inc27, i32* %i, align 4, !dbg !1398
  br label %for.cond21, !dbg !1399, !llvm.loop !1400

for.end28:                                        ; preds = %for.cond21
  br label %reset_label7, !dbg !1401

reset_label7:                                     ; preds = %for.end28
  store i32 0, i32* %i, align 4, !dbg !1403
  br label %for.cond29, !dbg !1405

for.cond29:                                       ; preds = %for.inc36, %reset_label7
  %16 = load i32, i32* %i, align 4, !dbg !1406
  %cmp30 = icmp slt i32 %16, 11, !dbg !1408
  br i1 %cmp30, label %for.body31, label %for.end38, !dbg !1409

for.body31:                                       ; preds = %for.cond29
  %17 = load i32, i32* %i, align 4, !dbg !1410
  %idxprom32 = sext i32 %17 to i64, !dbg !1412
  %arrayidx33 = getelementptr inbounds [11 x i32], [11 x i32]* @accumc, i64 0, i64 %idxprom32, !dbg !1412
  store i32 0, i32* %arrayidx33, align 4, !dbg !1413
  %18 = load i32, i32* %i, align 4, !dbg !1414
  %idxprom34 = sext i32 %18 to i64, !dbg !1415
  %arrayidx35 = getelementptr inbounds [11 x i32], [11 x i32]* @accumd, i64 0, i64 %idxprom34, !dbg !1415
  store i32 0, i32* %arrayidx35, align 4, !dbg !1416
  br label %for.inc36, !dbg !1417

for.inc36:                                        ; preds = %for.body31
  %19 = load i32, i32* %i, align 4, !dbg !1418
  %inc37 = add i32 %19, 1, !dbg !1418
  store i32 %inc37, i32* %i, align 4, !dbg !1418
  br label %for.cond29, !dbg !1419, !llvm.loop !1420

for.end38:                                        ; preds = %for.cond29
  %20 = bitcast i32* %i to i8*, !dbg !1423
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #5, !dbg !1423
  ret void, !dbg !1423
}

; Function Attrs: nounwind
define void @adpcm_main(i32* "fpga.decayed.dim.hint"="8000" %input_samples, i32* "fpga.decayed.dim.hint"="4000" %compressed, i32* "fpga.decayed.dim.hint"="8000" %result) #4 !dbg !1424 !fpga.function.pragma !1427 {
entry:
  %input_samples.addr = alloca i32*, align 8
  %compressed.addr = alloca i32*, align 8
  %result.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* %input_samples, i32** %input_samples.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %input_samples.addr, metadata !1430, metadata !DIExpression()), !dbg !1431
  store i32* %compressed, i32** %compressed.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %compressed.addr, metadata !1432, metadata !DIExpression()), !dbg !1433
  store i32* %result, i32** %result.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %result.addr, metadata !1434, metadata !DIExpression()), !dbg !1435
  %0 = bitcast i32* %i to i8*, !dbg !1436
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5, !dbg !1436
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1437, metadata !DIExpression()), !dbg !1438
  %1 = bitcast i32* %j to i8*, !dbg !1436
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5, !dbg !1436
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1439, metadata !DIExpression()), !dbg !1440
  call void @reset(), !dbg !1441
  store i32 10, i32* %j, align 4, !dbg !1442
  br label %adpcm_main_label12, !dbg !1443

adpcm_main_label12:                               ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !1444
  br label %for.cond, !dbg !1446

for.cond:                                         ; preds = %for.inc, %adpcm_main_label12
  %2 = load i32, i32* %i, align 4, !dbg !1447
  %cmp = icmp slt i32 %2, 8000, !dbg !1449
  br i1 %cmp, label %for.body, label %for.end, !dbg !1450

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %input_samples.addr, align 8, !dbg !1451
  %4 = load i32, i32* %i, align 4, !dbg !1453
  %idxprom = sext i32 %4 to i64, !dbg !1451
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !1451
  %5 = load i32, i32* %arrayidx, align 4, !dbg !1451
  %6 = load i32*, i32** %input_samples.addr, align 8, !dbg !1454
  %7 = load i32, i32* %i, align 4, !dbg !1455
  %add = add i32 %7, 1, !dbg !1456
  %idxprom1 = sext i32 %add to i64, !dbg !1454
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %idxprom1, !dbg !1454
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !1454
  %call = call i32 @encode(i32 %5, i32 %8), !dbg !1457
  %9 = load i32*, i32** %compressed.addr, align 8, !dbg !1458
  %10 = load i32, i32* %i, align 4, !dbg !1459
  %div = sdiv i32 %10, 2, !dbg !1460
  %idxprom3 = sext i32 %div to i64, !dbg !1458
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %idxprom3, !dbg !1458
  store i32 %call, i32* %arrayidx4, align 4, !dbg !1461
  br label %for.inc, !dbg !1462

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !1463
  %add5 = add i32 %11, 2, !dbg !1463
  store i32 %add5, i32* %i, align 4, !dbg !1463
  br label %for.cond, !dbg !1464, !llvm.loop !1465

for.end:                                          ; preds = %for.cond
  br label %adpcm_main_label13, !dbg !1466

adpcm_main_label13:                               ; preds = %for.end
  store i32 0, i32* %i, align 4, !dbg !1468
  br label %for.cond6, !dbg !1470

for.cond6:                                        ; preds = %for.inc17, %adpcm_main_label13
  %12 = load i32, i32* %i, align 4, !dbg !1471
  %cmp7 = icmp slt i32 %12, 8000, !dbg !1473
  br i1 %cmp7, label %for.body8, label %for.end19, !dbg !1474

for.body8:                                        ; preds = %for.cond6
  %13 = load i32*, i32** %compressed.addr, align 8, !dbg !1475
  %14 = load i32, i32* %i, align 4, !dbg !1477
  %div9 = sdiv i32 %14, 2, !dbg !1478
  %idxprom10 = sext i32 %div9 to i64, !dbg !1475
  %arrayidx11 = getelementptr inbounds i32, i32* %13, i64 %idxprom10, !dbg !1475
  %15 = load i32, i32* %arrayidx11, align 4, !dbg !1475
  call void @decode(i32 %15), !dbg !1479
  %16 = load i32, i32* @xout1, align 4, !dbg !1480
  %17 = load i32*, i32** %result.addr, align 8, !dbg !1481
  %18 = load i32, i32* %i, align 4, !dbg !1482
  %idxprom12 = sext i32 %18 to i64, !dbg !1481
  %arrayidx13 = getelementptr inbounds i32, i32* %17, i64 %idxprom12, !dbg !1481
  store i32 %16, i32* %arrayidx13, align 4, !dbg !1483
  %19 = load i32, i32* @xout2, align 4, !dbg !1484
  %20 = load i32*, i32** %result.addr, align 8, !dbg !1485
  %21 = load i32, i32* %i, align 4, !dbg !1486
  %add14 = add i32 %21, 1, !dbg !1487
  %idxprom15 = sext i32 %add14 to i64, !dbg !1485
  %arrayidx16 = getelementptr inbounds i32, i32* %20, i64 %idxprom15, !dbg !1485
  store i32 %19, i32* %arrayidx16, align 4, !dbg !1488
  br label %for.inc17, !dbg !1489

for.inc17:                                        ; preds = %for.body8
  %22 = load i32, i32* %i, align 4, !dbg !1490
  %add18 = add i32 %22, 2, !dbg !1490
  store i32 %add18, i32* %i, align 4, !dbg !1490
  br label %for.cond6, !dbg !1491, !llvm.loop !1492

for.end19:                                        ; preds = %for.cond6
  %23 = bitcast i32* %j to i8*, !dbg !1495
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %23) #5, !dbg !1495
  %24 = bitcast i32* %i to i8*, !dbg !1495
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %24) #5, !dbg !1495
  ret void, !dbg !1495
}

attributes #0 = { nounwind readnone willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.top.func"="adpcm_main" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!2}
!llvm.ident = !{!217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217, !217}
!llvm.module.flags = !{!218, !219, !220}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "h", scope: !2, file: !11, line: 89, type: !216, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8)
!3 = !DIFile(filename: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/adpcm_ahls/solution1/.autopilot/db/adpcm.pp.0.c", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{!0, !9, !16, !21, !23, !28, !33, !38, !40, !45, !47, !52, !54, !56, !61, !63, !65, !67, !69, !71, !73, !75, !77, !79, !81, !86, !88, !90, !92, !94, !96, !98, !100, !102, !104, !106, !108, !110, !112, !114, !116, !118, !120, !122, !124, !126, !128, !130, !132, !134, !136, !138, !140, !142, !144, !146, !148, !150, !152, !154, !156, !158, !160, !162, !164, !166, !168, !170, !172, !174, !176, !178, !180, !182, !184, !186, !188, !190, !192, !194, !196, !198, !200, !202, !204, !206, !208, !210, !212, !214}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "qq4_code4_table", scope: !2, file: !11, line: 109, type: !12, isLocal: false, isDefinition: true)
!11 = !DIFile(filename: "benchmarks/chstone/adpcm/src/adpcm.c", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 512, elements: !14)
!13 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!14 = !{!15}
!15 = !DISubrange(count: 16)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "qq6_code6_table", scope: !2, file: !11, line: 115, type: !18, isLocal: false, isDefinition: true)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 2048, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 64)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "wl_code_table", scope: !2, file: !11, line: 130, type: !12, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "ilb_table", scope: !2, file: !11, line: 135, type: !25, isLocal: false, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 1024, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 32)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "decis_levl", scope: !2, file: !11, line: 149, type: !30, isLocal: false, isDefinition: true)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 960, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 30)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "quant26bt_pos", scope: !2, file: !11, line: 160, type: !35, isLocal: false, isDefinition: true)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 992, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 31)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "quant26bt_neg", scope: !2, file: !11, line: 169, type: !35, isLocal: false, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(name: "qq2_code2_table", scope: !2, file: !11, line: 181, type: !42, isLocal: false, isDefinition: true)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 4)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(name: "wh_code_table", scope: !2, file: !11, line: 185, type: !42, isLocal: false, isDefinition: true)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "tqmf", scope: !2, file: !11, line: 85, type: !49, isLocal: false, isDefinition: true)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 768, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 24)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(name: "xl", scope: !2, file: !11, line: 95, type: !7, isLocal: false, isDefinition: true)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(name: "xh", scope: !2, file: !11, line: 95, type: !7, isLocal: false, isDefinition: true)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(name: "accumc", scope: !2, file: !11, line: 98, type: !58, isLocal: false, isDefinition: true)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 352, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 11)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(name: "accumd", scope: !2, file: !11, line: 98, type: !58, isLocal: false, isDefinition: true)
!63 = !DIGlobalVariableExpression(var: !64, expr: !DIExpression())
!64 = distinct !DIGlobalVariable(name: "xout1", scope: !2, file: !11, line: 101, type: !7, isLocal: false, isDefinition: true)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "xout2", scope: !2, file: !11, line: 101, type: !7, isLocal: false, isDefinition: true)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "xs", scope: !2, file: !11, line: 103, type: !7, isLocal: false, isDefinition: true)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(name: "xd", scope: !2, file: !11, line: 103, type: !7, isLocal: false, isDefinition: true)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(name: "il", scope: !2, file: !11, line: 107, type: !7, isLocal: false, isDefinition: true)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(name: "szl", scope: !2, file: !11, line: 107, type: !7, isLocal: false, isDefinition: true)
!75 = !DIGlobalVariableExpression(var: !76, expr: !DIExpression())
!76 = distinct !DIGlobalVariable(name: "spl", scope: !2, file: !11, line: 107, type: !7, isLocal: false, isDefinition: true)
!77 = !DIGlobalVariableExpression(var: !78, expr: !DIExpression())
!78 = distinct !DIGlobalVariable(name: "sl", scope: !2, file: !11, line: 107, type: !7, isLocal: false, isDefinition: true)
!79 = !DIGlobalVariableExpression(var: !80, expr: !DIExpression())
!80 = distinct !DIGlobalVariable(name: "el", scope: !2, file: !11, line: 107, type: !7, isLocal: false, isDefinition: true)
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(name: "delay_bpl", scope: !2, file: !11, line: 126, type: !83, isLocal: false, isDefinition: true)
!83 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 192, elements: !84)
!84 = !{!85}
!85 = !DISubrange(count: 6)
!86 = !DIGlobalVariableExpression(var: !87, expr: !DIExpression())
!87 = distinct !DIGlobalVariable(name: "delay_dltx", scope: !2, file: !11, line: 128, type: !83, isLocal: false, isDefinition: true)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression())
!89 = distinct !DIGlobalVariable(name: "nbl", scope: !2, file: !11, line: 142, type: !7, isLocal: false, isDefinition: true)
!90 = !DIGlobalVariableExpression(var: !91, expr: !DIExpression())
!91 = distinct !DIGlobalVariable(name: "al1", scope: !2, file: !11, line: 143, type: !7, isLocal: false, isDefinition: true)
!92 = !DIGlobalVariableExpression(var: !93, expr: !DIExpression())
!93 = distinct !DIGlobalVariable(name: "al2", scope: !2, file: !11, line: 143, type: !7, isLocal: false, isDefinition: true)
!94 = !DIGlobalVariableExpression(var: !95, expr: !DIExpression())
!95 = distinct !DIGlobalVariable(name: "plt", scope: !2, file: !11, line: 144, type: !7, isLocal: false, isDefinition: true)
!96 = !DIGlobalVariableExpression(var: !97, expr: !DIExpression())
!97 = distinct !DIGlobalVariable(name: "plt1", scope: !2, file: !11, line: 144, type: !7, isLocal: false, isDefinition: true)
!98 = !DIGlobalVariableExpression(var: !99, expr: !DIExpression())
!99 = distinct !DIGlobalVariable(name: "plt2", scope: !2, file: !11, line: 144, type: !7, isLocal: false, isDefinition: true)
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression())
!101 = distinct !DIGlobalVariable(name: "dlt", scope: !2, file: !11, line: 145, type: !7, isLocal: false, isDefinition: true)
!102 = !DIGlobalVariableExpression(var: !103, expr: !DIExpression())
!103 = distinct !DIGlobalVariable(name: "rlt", scope: !2, file: !11, line: 146, type: !7, isLocal: false, isDefinition: true)
!104 = !DIGlobalVariableExpression(var: !105, expr: !DIExpression())
!105 = distinct !DIGlobalVariable(name: "rlt1", scope: !2, file: !11, line: 146, type: !7, isLocal: false, isDefinition: true)
!106 = !DIGlobalVariableExpression(var: !107, expr: !DIExpression())
!107 = distinct !DIGlobalVariable(name: "rlt2", scope: !2, file: !11, line: 146, type: !7, isLocal: false, isDefinition: true)
!108 = !DIGlobalVariableExpression(var: !109, expr: !DIExpression())
!109 = distinct !DIGlobalVariable(name: "detl", scope: !2, file: !11, line: 156, type: !7, isLocal: false, isDefinition: true)
!110 = !DIGlobalVariableExpression(var: !111, expr: !DIExpression())
!111 = distinct !DIGlobalVariable(name: "deth", scope: !2, file: !11, line: 177, type: !7, isLocal: false, isDefinition: true)
!112 = !DIGlobalVariableExpression(var: !113, expr: !DIExpression())
!113 = distinct !DIGlobalVariable(name: "sh", scope: !2, file: !11, line: 178, type: !7, isLocal: false, isDefinition: true)
!114 = !DIGlobalVariableExpression(var: !115, expr: !DIExpression())
!115 = distinct !DIGlobalVariable(name: "eh", scope: !2, file: !11, line: 179, type: !7, isLocal: false, isDefinition: true)
!116 = !DIGlobalVariableExpression(var: !117, expr: !DIExpression())
!117 = distinct !DIGlobalVariable(name: "dh", scope: !2, file: !11, line: 190, type: !7, isLocal: false, isDefinition: true)
!118 = !DIGlobalVariableExpression(var: !119, expr: !DIExpression())
!119 = distinct !DIGlobalVariable(name: "ih", scope: !2, file: !11, line: 190, type: !7, isLocal: false, isDefinition: true)
!120 = !DIGlobalVariableExpression(var: !121, expr: !DIExpression())
!121 = distinct !DIGlobalVariable(name: "nbh", scope: !2, file: !11, line: 191, type: !7, isLocal: false, isDefinition: true)
!122 = !DIGlobalVariableExpression(var: !123, expr: !DIExpression())
!123 = distinct !DIGlobalVariable(name: "szh", scope: !2, file: !11, line: 191, type: !7, isLocal: false, isDefinition: true)
!124 = !DIGlobalVariableExpression(var: !125, expr: !DIExpression())
!125 = distinct !DIGlobalVariable(name: "sph", scope: !2, file: !11, line: 192, type: !7, isLocal: false, isDefinition: true)
!126 = !DIGlobalVariableExpression(var: !127, expr: !DIExpression())
!127 = distinct !DIGlobalVariable(name: "ph", scope: !2, file: !11, line: 192, type: !7, isLocal: false, isDefinition: true)
!128 = !DIGlobalVariableExpression(var: !129, expr: !DIExpression())
!129 = distinct !DIGlobalVariable(name: "yh", scope: !2, file: !11, line: 192, type: !7, isLocal: false, isDefinition: true)
!130 = !DIGlobalVariableExpression(var: !131, expr: !DIExpression())
!131 = distinct !DIGlobalVariable(name: "rh", scope: !2, file: !11, line: 192, type: !7, isLocal: false, isDefinition: true)
!132 = !DIGlobalVariableExpression(var: !133, expr: !DIExpression())
!133 = distinct !DIGlobalVariable(name: "delay_dhx", scope: !2, file: !11, line: 194, type: !83, isLocal: false, isDefinition: true)
!134 = !DIGlobalVariableExpression(var: !135, expr: !DIExpression())
!135 = distinct !DIGlobalVariable(name: "delay_bph", scope: !2, file: !11, line: 196, type: !83, isLocal: false, isDefinition: true)
!136 = !DIGlobalVariableExpression(var: !137, expr: !DIExpression())
!137 = distinct !DIGlobalVariable(name: "ah1", scope: !2, file: !11, line: 198, type: !7, isLocal: false, isDefinition: true)
!138 = !DIGlobalVariableExpression(var: !139, expr: !DIExpression())
!139 = distinct !DIGlobalVariable(name: "ah2", scope: !2, file: !11, line: 198, type: !7, isLocal: false, isDefinition: true)
!140 = !DIGlobalVariableExpression(var: !141, expr: !DIExpression())
!141 = distinct !DIGlobalVariable(name: "ph1", scope: !2, file: !11, line: 199, type: !7, isLocal: false, isDefinition: true)
!142 = !DIGlobalVariableExpression(var: !143, expr: !DIExpression())
!143 = distinct !DIGlobalVariable(name: "ph2", scope: !2, file: !11, line: 199, type: !7, isLocal: false, isDefinition: true)
!144 = !DIGlobalVariableExpression(var: !145, expr: !DIExpression())
!145 = distinct !DIGlobalVariable(name: "rh1", scope: !2, file: !11, line: 200, type: !7, isLocal: false, isDefinition: true)
!146 = !DIGlobalVariableExpression(var: !147, expr: !DIExpression())
!147 = distinct !DIGlobalVariable(name: "rh2", scope: !2, file: !11, line: 200, type: !7, isLocal: false, isDefinition: true)
!148 = !DIGlobalVariableExpression(var: !149, expr: !DIExpression())
!149 = distinct !DIGlobalVariable(name: "ilr", scope: !2, file: !11, line: 203, type: !7, isLocal: false, isDefinition: true)
!150 = !DIGlobalVariableExpression(var: !151, expr: !DIExpression())
!151 = distinct !DIGlobalVariable(name: "rl", scope: !2, file: !11, line: 203, type: !7, isLocal: false, isDefinition: true)
!152 = !DIGlobalVariableExpression(var: !153, expr: !DIExpression())
!153 = distinct !DIGlobalVariable(name: "dec_deth", scope: !2, file: !11, line: 204, type: !7, isLocal: false, isDefinition: true)
!154 = !DIGlobalVariableExpression(var: !155, expr: !DIExpression())
!155 = distinct !DIGlobalVariable(name: "dec_detl", scope: !2, file: !11, line: 204, type: !7, isLocal: false, isDefinition: true)
!156 = !DIGlobalVariableExpression(var: !157, expr: !DIExpression())
!157 = distinct !DIGlobalVariable(name: "dec_dlt", scope: !2, file: !11, line: 204, type: !7, isLocal: false, isDefinition: true)
!158 = !DIGlobalVariableExpression(var: !159, expr: !DIExpression())
!159 = distinct !DIGlobalVariable(name: "dec_del_bpl", scope: !2, file: !11, line: 206, type: !83, isLocal: false, isDefinition: true)
!160 = !DIGlobalVariableExpression(var: !161, expr: !DIExpression())
!161 = distinct !DIGlobalVariable(name: "dec_del_dltx", scope: !2, file: !11, line: 208, type: !83, isLocal: false, isDefinition: true)
!162 = !DIGlobalVariableExpression(var: !163, expr: !DIExpression())
!163 = distinct !DIGlobalVariable(name: "dec_plt", scope: !2, file: !11, line: 210, type: !7, isLocal: false, isDefinition: true)
!164 = !DIGlobalVariableExpression(var: !165, expr: !DIExpression())
!165 = distinct !DIGlobalVariable(name: "dec_plt1", scope: !2, file: !11, line: 210, type: !7, isLocal: false, isDefinition: true)
!166 = !DIGlobalVariableExpression(var: !167, expr: !DIExpression())
!167 = distinct !DIGlobalVariable(name: "dec_plt2", scope: !2, file: !11, line: 210, type: !7, isLocal: false, isDefinition: true)
!168 = !DIGlobalVariableExpression(var: !169, expr: !DIExpression())
!169 = distinct !DIGlobalVariable(name: "dec_szl", scope: !2, file: !11, line: 211, type: !7, isLocal: false, isDefinition: true)
!170 = !DIGlobalVariableExpression(var: !171, expr: !DIExpression())
!171 = distinct !DIGlobalVariable(name: "dec_spl", scope: !2, file: !11, line: 211, type: !7, isLocal: false, isDefinition: true)
!172 = !DIGlobalVariableExpression(var: !173, expr: !DIExpression())
!173 = distinct !DIGlobalVariable(name: "dec_sl", scope: !2, file: !11, line: 211, type: !7, isLocal: false, isDefinition: true)
!174 = !DIGlobalVariableExpression(var: !175, expr: !DIExpression())
!175 = distinct !DIGlobalVariable(name: "dec_rlt1", scope: !2, file: !11, line: 212, type: !7, isLocal: false, isDefinition: true)
!176 = !DIGlobalVariableExpression(var: !177, expr: !DIExpression())
!177 = distinct !DIGlobalVariable(name: "dec_rlt2", scope: !2, file: !11, line: 212, type: !7, isLocal: false, isDefinition: true)
!178 = !DIGlobalVariableExpression(var: !179, expr: !DIExpression())
!179 = distinct !DIGlobalVariable(name: "dec_rlt", scope: !2, file: !11, line: 212, type: !7, isLocal: false, isDefinition: true)
!180 = !DIGlobalVariableExpression(var: !181, expr: !DIExpression())
!181 = distinct !DIGlobalVariable(name: "dec_al1", scope: !2, file: !11, line: 213, type: !7, isLocal: false, isDefinition: true)
!182 = !DIGlobalVariableExpression(var: !183, expr: !DIExpression())
!183 = distinct !DIGlobalVariable(name: "dec_al2", scope: !2, file: !11, line: 213, type: !7, isLocal: false, isDefinition: true)
!184 = !DIGlobalVariableExpression(var: !185, expr: !DIExpression())
!185 = distinct !DIGlobalVariable(name: "dl", scope: !2, file: !11, line: 214, type: !7, isLocal: false, isDefinition: true)
!186 = !DIGlobalVariableExpression(var: !187, expr: !DIExpression())
!187 = distinct !DIGlobalVariable(name: "dec_nbl", scope: !2, file: !11, line: 215, type: !7, isLocal: false, isDefinition: true)
!188 = !DIGlobalVariableExpression(var: !189, expr: !DIExpression())
!189 = distinct !DIGlobalVariable(name: "dec_dh", scope: !2, file: !11, line: 215, type: !7, isLocal: false, isDefinition: true)
!190 = !DIGlobalVariableExpression(var: !191, expr: !DIExpression())
!191 = distinct !DIGlobalVariable(name: "dec_nbh", scope: !2, file: !11, line: 215, type: !7, isLocal: false, isDefinition: true)
!192 = !DIGlobalVariableExpression(var: !193, expr: !DIExpression())
!193 = distinct !DIGlobalVariable(name: "dec_del_bph", scope: !2, file: !11, line: 218, type: !83, isLocal: false, isDefinition: true)
!194 = !DIGlobalVariableExpression(var: !195, expr: !DIExpression())
!195 = distinct !DIGlobalVariable(name: "dec_del_dhx", scope: !2, file: !11, line: 220, type: !83, isLocal: false, isDefinition: true)
!196 = !DIGlobalVariableExpression(var: !197, expr: !DIExpression())
!197 = distinct !DIGlobalVariable(name: "dec_szh", scope: !2, file: !11, line: 222, type: !7, isLocal: false, isDefinition: true)
!198 = !DIGlobalVariableExpression(var: !199, expr: !DIExpression())
!199 = distinct !DIGlobalVariable(name: "dec_rh1", scope: !2, file: !11, line: 224, type: !7, isLocal: false, isDefinition: true)
!200 = !DIGlobalVariableExpression(var: !201, expr: !DIExpression())
!201 = distinct !DIGlobalVariable(name: "dec_rh2", scope: !2, file: !11, line: 224, type: !7, isLocal: false, isDefinition: true)
!202 = !DIGlobalVariableExpression(var: !203, expr: !DIExpression())
!203 = distinct !DIGlobalVariable(name: "dec_ah1", scope: !2, file: !11, line: 225, type: !7, isLocal: false, isDefinition: true)
!204 = !DIGlobalVariableExpression(var: !205, expr: !DIExpression())
!205 = distinct !DIGlobalVariable(name: "dec_ah2", scope: !2, file: !11, line: 225, type: !7, isLocal: false, isDefinition: true)
!206 = !DIGlobalVariableExpression(var: !207, expr: !DIExpression())
!207 = distinct !DIGlobalVariable(name: "dec_ph", scope: !2, file: !11, line: 226, type: !7, isLocal: false, isDefinition: true)
!208 = !DIGlobalVariableExpression(var: !209, expr: !DIExpression())
!209 = distinct !DIGlobalVariable(name: "dec_sph", scope: !2, file: !11, line: 226, type: !7, isLocal: false, isDefinition: true)
!210 = !DIGlobalVariableExpression(var: !211, expr: !DIExpression())
!211 = distinct !DIGlobalVariable(name: "dec_sh", scope: !2, file: !11, line: 228, type: !7, isLocal: false, isDefinition: true)
!212 = !DIGlobalVariableExpression(var: !213, expr: !DIExpression())
!213 = distinct !DIGlobalVariable(name: "dec_ph1", scope: !2, file: !11, line: 230, type: !7, isLocal: false, isDefinition: true)
!214 = !DIGlobalVariableExpression(var: !215, expr: !DIExpression())
!215 = distinct !DIGlobalVariable(name: "dec_ph2", scope: !2, file: !11, line: 230, type: !7, isLocal: false, isDefinition: true)
!216 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 768, elements: !50)
!217 = !{!"clang version 7.0.0 "}
!218 = !{i32 2, !"Dwarf Version", i32 4}
!219 = !{i32 2, !"Debug Info Version", i32 3}
!220 = !{i32 1, !"wchar_size", i32 4}
!221 = distinct !DISubprogram(name: "abs", scope: !11, file: !11, line: 238, type: !222, isLocal: false, isDefinition: true, scopeLine: 239, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!222 = !DISubroutineType(types: !223)
!223 = !{!7, !7}
!224 = !DILocalVariable(name: "n", arg: 1, scope: !221, file: !11, line: 238, type: !7)
!225 = !DILocation(line: 238, column: 10, scope: !221)
!226 = !DILocation(line: 240, column: 3, scope: !221)
!227 = !DILocalVariable(name: "m", scope: !221, file: !11, line: 240, type: !7)
!228 = !DILocation(line: 240, column: 7, scope: !221)
!229 = !DILocation(line: 242, column: 7, scope: !230)
!230 = distinct !DILexicalBlock(scope: !221, file: !11, line: 242, column: 7)
!231 = !DILocation(line: 242, column: 9, scope: !230)
!232 = !DILocation(line: 242, column: 7, scope: !221)
!233 = !DILocation(line: 243, column: 9, scope: !230)
!234 = !DILocation(line: 243, column: 7, scope: !230)
!235 = !DILocation(line: 243, column: 5, scope: !230)
!236 = !DILocation(line: 245, column: 10, scope: !230)
!237 = !DILocation(line: 245, column: 9, scope: !230)
!238 = !DILocation(line: 245, column: 7, scope: !230)
!239 = !DILocation(line: 246, column: 10, scope: !221)
!240 = !DILocation(line: 247, column: 1, scope: !221)
!241 = !DILocation(line: 246, column: 3, scope: !221)
!242 = distinct !DISubprogram(name: "encode", scope: !11, file: !11, line: 250, type: !243, isLocal: false, isDefinition: true, scopeLine: 251, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!243 = !DISubroutineType(types: !244)
!244 = !{!7, !7, !7}
!245 = !DILocalVariable(name: "xin1", arg: 1, scope: !242, file: !11, line: 250, type: !7)
!246 = !DILocation(line: 250, column: 13, scope: !242)
!247 = !DILocalVariable(name: "xin2", arg: 2, scope: !242, file: !11, line: 250, type: !7)
!248 = !DILocation(line: 250, column: 23, scope: !242)
!249 = !DILocation(line: 252, column: 3, scope: !242)
!250 = !DILocalVariable(name: "i", scope: !242, file: !11, line: 252, type: !7)
!251 = !DILocation(line: 252, column: 7, scope: !242)
!252 = !DILocation(line: 253, column: 3, scope: !242)
!253 = !DILocalVariable(name: "h_ptr", scope: !242, file: !11, line: 253, type: !254)
!254 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!255 = !DILocation(line: 253, column: 14, scope: !242)
!256 = !DILocation(line: 254, column: 3, scope: !242)
!257 = !DILocalVariable(name: "tqmf_ptr", scope: !242, file: !11, line: 254, type: !258)
!258 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!259 = !DILocation(line: 254, column: 8, scope: !242)
!260 = !DILocalVariable(name: "tqmf_ptr1", scope: !242, file: !11, line: 254, type: !258)
!261 = !DILocation(line: 254, column: 19, scope: !242)
!262 = !DILocation(line: 255, column: 3, scope: !242)
!263 = !DILocalVariable(name: "xa", scope: !242, file: !11, line: 255, type: !6)
!264 = !DILocation(line: 255, column: 12, scope: !242)
!265 = !DILocalVariable(name: "xb", scope: !242, file: !11, line: 255, type: !6)
!266 = !DILocation(line: 255, column: 16, scope: !242)
!267 = !DILocation(line: 256, column: 3, scope: !242)
!268 = !DILocalVariable(name: "decis", scope: !242, file: !11, line: 256, type: !7)
!269 = !DILocation(line: 256, column: 7, scope: !242)
!270 = !DILocation(line: 259, column: 9, scope: !242)
!271 = !DILocation(line: 260, column: 12, scope: !242)
!272 = !DILocation(line: 261, column: 25, scope: !242)
!273 = !DILocation(line: 261, column: 16, scope: !242)
!274 = !DILocation(line: 261, column: 8, scope: !242)
!275 = !DILocation(line: 261, column: 38, scope: !242)
!276 = !DILocation(line: 261, column: 32, scope: !242)
!277 = !DILocation(line: 261, column: 31, scope: !242)
!278 = !DILocation(line: 261, column: 29, scope: !242)
!279 = !DILocation(line: 261, column: 6, scope: !242)
!280 = !DILocation(line: 262, column: 25, scope: !242)
!281 = !DILocation(line: 262, column: 16, scope: !242)
!282 = !DILocation(line: 262, column: 8, scope: !242)
!283 = !DILocation(line: 262, column: 38, scope: !242)
!284 = !DILocation(line: 262, column: 32, scope: !242)
!285 = !DILocation(line: 262, column: 31, scope: !242)
!286 = !DILocation(line: 262, column: 29, scope: !242)
!287 = !DILocation(line: 262, column: 6, scope: !242)
!288 = !DILocation(line: 262, column: 3, scope: !242)
!289 = !DILocation(line: 264, column: 24, scope: !290)
!290 = distinct !DILexicalBlock(scope: !242, file: !11, line: 264, column: 17)
!291 = !DILocation(line: 264, column: 22, scope: !290)
!292 = !DILocation(line: 264, column: 29, scope: !293)
!293 = distinct !DILexicalBlock(scope: !290, file: !11, line: 264, column: 17)
!294 = !DILocation(line: 264, column: 31, scope: !293)
!295 = !DILocation(line: 264, column: 17, scope: !290)
!296 = !DILocation(line: 266, column: 30, scope: !297)
!297 = distinct !DILexicalBlock(scope: !293, file: !11, line: 265, column: 5)
!298 = !DILocation(line: 266, column: 21, scope: !297)
!299 = !DILocation(line: 266, column: 13, scope: !297)
!300 = !DILocation(line: 266, column: 43, scope: !297)
!301 = !DILocation(line: 266, column: 37, scope: !297)
!302 = !DILocation(line: 266, column: 36, scope: !297)
!303 = !DILocation(line: 266, column: 34, scope: !297)
!304 = !DILocation(line: 266, column: 10, scope: !297)
!305 = !DILocation(line: 267, column: 30, scope: !297)
!306 = !DILocation(line: 267, column: 21, scope: !297)
!307 = !DILocation(line: 267, column: 13, scope: !297)
!308 = !DILocation(line: 267, column: 43, scope: !297)
!309 = !DILocation(line: 267, column: 37, scope: !297)
!310 = !DILocation(line: 267, column: 36, scope: !297)
!311 = !DILocation(line: 267, column: 34, scope: !297)
!312 = !DILocation(line: 267, column: 10, scope: !297)
!313 = !DILocation(line: 268, column: 5, scope: !297)
!314 = !DILocation(line: 264, column: 38, scope: !293)
!315 = !DILocation(line: 264, column: 17, scope: !293)
!316 = distinct !{!316, !295, !317, !318}
!317 = !DILocation(line: 268, column: 5, scope: !290)
!318 = !{!"llvm.loop.name", !"encode_label0"}
!319 = !DILocation(line: 270, column: 26, scope: !242)
!320 = !DILocation(line: 270, column: 17, scope: !242)
!321 = !DILocation(line: 270, column: 9, scope: !242)
!322 = !DILocation(line: 270, column: 39, scope: !242)
!323 = !DILocation(line: 270, column: 33, scope: !242)
!324 = !DILocation(line: 270, column: 32, scope: !242)
!325 = !DILocation(line: 270, column: 30, scope: !242)
!326 = !DILocation(line: 270, column: 6, scope: !242)
!327 = !DILocation(line: 271, column: 18, scope: !242)
!328 = !DILocation(line: 271, column: 17, scope: !242)
!329 = !DILocation(line: 271, column: 9, scope: !242)
!330 = !DILocation(line: 271, column: 37, scope: !242)
!331 = !DILocation(line: 271, column: 31, scope: !242)
!332 = !DILocation(line: 271, column: 30, scope: !242)
!333 = !DILocation(line: 271, column: 28, scope: !242)
!334 = !DILocation(line: 271, column: 6, scope: !242)
!335 = !DILocation(line: 274, column: 15, scope: !242)
!336 = !DILocation(line: 274, column: 24, scope: !242)
!337 = !DILocation(line: 274, column: 13, scope: !242)
!338 = !DILocation(line: 274, column: 3, scope: !242)
!339 = !DILocation(line: 275, column: 24, scope: !340)
!340 = distinct !DILexicalBlock(scope: !242, file: !11, line: 275, column: 17)
!341 = !DILocation(line: 275, column: 22, scope: !340)
!342 = !DILocation(line: 275, column: 29, scope: !343)
!343 = distinct !DILexicalBlock(scope: !340, file: !11, line: 275, column: 17)
!344 = !DILocation(line: 275, column: 31, scope: !343)
!345 = !DILocation(line: 275, column: 17, scope: !340)
!346 = !DILocation(line: 276, column: 29, scope: !343)
!347 = !DILocation(line: 276, column: 19, scope: !343)
!348 = !DILocation(line: 276, column: 14, scope: !343)
!349 = !DILocation(line: 276, column: 17, scope: !343)
!350 = !DILocation(line: 276, column: 5, scope: !343)
!351 = !DILocation(line: 275, column: 38, scope: !343)
!352 = !DILocation(line: 275, column: 17, scope: !343)
!353 = distinct !{!353, !345, !354, !355}
!354 = !DILocation(line: 276, column: 29, scope: !340)
!355 = !{!"llvm.loop.name", !"encode_label1"}
!356 = !DILocation(line: 277, column: 17, scope: !242)
!357 = !DILocation(line: 277, column: 12, scope: !242)
!358 = !DILocation(line: 277, column: 15, scope: !242)
!359 = !DILocation(line: 278, column: 15, scope: !242)
!360 = !DILocation(line: 278, column: 4, scope: !242)
!361 = !DILocation(line: 278, column: 13, scope: !242)
!362 = !DILocation(line: 281, column: 9, scope: !242)
!363 = !DILocation(line: 281, column: 14, scope: !242)
!364 = !DILocation(line: 281, column: 12, scope: !242)
!365 = !DILocation(line: 281, column: 18, scope: !242)
!366 = !DILocation(line: 281, column: 8, scope: !242)
!367 = !DILocation(line: 281, column: 6, scope: !242)
!368 = !DILocation(line: 282, column: 9, scope: !242)
!369 = !DILocation(line: 282, column: 14, scope: !242)
!370 = !DILocation(line: 282, column: 12, scope: !242)
!371 = !DILocation(line: 282, column: 18, scope: !242)
!372 = !DILocation(line: 282, column: 8, scope: !242)
!373 = !DILocation(line: 282, column: 6, scope: !242)
!374 = !DILocation(line: 289, column: 9, scope: !242)
!375 = !DILocation(line: 289, column: 7, scope: !242)
!376 = !DILocation(line: 292, column: 17, scope: !242)
!377 = !DILocation(line: 292, column: 23, scope: !242)
!378 = !DILocation(line: 292, column: 28, scope: !242)
!379 = !DILocation(line: 292, column: 34, scope: !242)
!380 = !DILocation(line: 292, column: 9, scope: !242)
!381 = !DILocation(line: 292, column: 7, scope: !242)
!382 = !DILocation(line: 295, column: 8, scope: !242)
!383 = !DILocation(line: 295, column: 14, scope: !242)
!384 = !DILocation(line: 295, column: 12, scope: !242)
!385 = !DILocation(line: 295, column: 6, scope: !242)
!386 = !DILocation(line: 296, column: 8, scope: !242)
!387 = !DILocation(line: 296, column: 13, scope: !242)
!388 = !DILocation(line: 296, column: 11, scope: !242)
!389 = !DILocation(line: 296, column: 6, scope: !242)
!390 = !DILocation(line: 299, column: 16, scope: !242)
!391 = !DILocation(line: 299, column: 20, scope: !242)
!392 = !DILocation(line: 299, column: 8, scope: !242)
!393 = !DILocation(line: 299, column: 6, scope: !242)
!394 = !DILocation(line: 303, column: 17, scope: !242)
!395 = !DILocation(line: 303, column: 10, scope: !242)
!396 = !DILocation(line: 303, column: 40, scope: !242)
!397 = !DILocation(line: 303, column: 43, scope: !242)
!398 = !DILocation(line: 303, column: 24, scope: !242)
!399 = !DILocation(line: 303, column: 22, scope: !242)
!400 = !DILocation(line: 303, column: 50, scope: !242)
!401 = !DILocation(line: 303, column: 9, scope: !242)
!402 = !DILocation(line: 303, column: 7, scope: !242)
!403 = !DILocation(line: 306, column: 17, scope: !242)
!404 = !DILocation(line: 306, column: 21, scope: !242)
!405 = !DILocation(line: 306, column: 9, scope: !242)
!406 = !DILocation(line: 306, column: 7, scope: !242)
!407 = !DILocation(line: 310, column: 18, scope: !242)
!408 = !DILocation(line: 310, column: 10, scope: !242)
!409 = !DILocation(line: 310, column: 8, scope: !242)
!410 = !DILocation(line: 313, column: 9, scope: !242)
!411 = !DILocation(line: 313, column: 15, scope: !242)
!412 = !DILocation(line: 313, column: 13, scope: !242)
!413 = !DILocation(line: 313, column: 7, scope: !242)
!414 = !DILocation(line: 319, column: 11, scope: !242)
!415 = !DILocation(line: 319, column: 3, scope: !242)
!416 = !DILocation(line: 323, column: 17, scope: !242)
!417 = !DILocation(line: 323, column: 22, scope: !242)
!418 = !DILocation(line: 323, column: 27, scope: !242)
!419 = !DILocation(line: 323, column: 32, scope: !242)
!420 = !DILocation(line: 323, column: 38, scope: !242)
!421 = !DILocation(line: 323, column: 9, scope: !242)
!422 = !DILocation(line: 323, column: 7, scope: !242)
!423 = !DILocation(line: 327, column: 17, scope: !242)
!424 = !DILocation(line: 327, column: 22, scope: !242)
!425 = !DILocation(line: 327, column: 27, scope: !242)
!426 = !DILocation(line: 327, column: 32, scope: !242)
!427 = !DILocation(line: 327, column: 9, scope: !242)
!428 = !DILocation(line: 327, column: 7, scope: !242)
!429 = !DILocation(line: 330, column: 9, scope: !242)
!430 = !DILocation(line: 330, column: 14, scope: !242)
!431 = !DILocation(line: 330, column: 12, scope: !242)
!432 = !DILocation(line: 330, column: 7, scope: !242)
!433 = !DILocation(line: 333, column: 10, scope: !242)
!434 = !DILocation(line: 333, column: 8, scope: !242)
!435 = !DILocation(line: 334, column: 10, scope: !242)
!436 = !DILocation(line: 334, column: 8, scope: !242)
!437 = !DILocation(line: 335, column: 10, scope: !242)
!438 = !DILocation(line: 335, column: 8, scope: !242)
!439 = !DILocation(line: 336, column: 10, scope: !242)
!440 = !DILocation(line: 336, column: 8, scope: !242)
!441 = !DILocation(line: 340, column: 9, scope: !242)
!442 = !DILocation(line: 340, column: 7, scope: !242)
!443 = !DILocation(line: 342, column: 17, scope: !242)
!444 = !DILocation(line: 342, column: 22, scope: !242)
!445 = !DILocation(line: 342, column: 27, scope: !242)
!446 = !DILocation(line: 342, column: 32, scope: !242)
!447 = !DILocation(line: 342, column: 9, scope: !242)
!448 = !DILocation(line: 342, column: 7, scope: !242)
!449 = !DILocation(line: 345, column: 8, scope: !242)
!450 = !DILocation(line: 345, column: 14, scope: !242)
!451 = !DILocation(line: 345, column: 12, scope: !242)
!452 = !DILocation(line: 345, column: 6, scope: !242)
!453 = !DILocation(line: 347, column: 8, scope: !242)
!454 = !DILocation(line: 347, column: 13, scope: !242)
!455 = !DILocation(line: 347, column: 11, scope: !242)
!456 = !DILocation(line: 347, column: 6, scope: !242)
!457 = !DILocation(line: 351, column: 7, scope: !458)
!458 = distinct !DILexicalBlock(scope: !242, file: !11, line: 351, column: 7)
!459 = !DILocation(line: 351, column: 10, scope: !458)
!460 = !DILocation(line: 351, column: 7, scope: !242)
!461 = !DILocation(line: 353, column: 10, scope: !462)
!462 = distinct !DILexicalBlock(scope: !458, file: !11, line: 352, column: 5)
!463 = !DILocation(line: 354, column: 5, scope: !462)
!464 = !DILocation(line: 357, column: 10, scope: !465)
!465 = distinct !DILexicalBlock(scope: !458, file: !11, line: 356, column: 5)
!466 = !DILocation(line: 359, column: 26, scope: !242)
!467 = !DILocation(line: 359, column: 19, scope: !242)
!468 = !DILocation(line: 359, column: 17, scope: !242)
!469 = !DILocation(line: 359, column: 32, scope: !242)
!470 = !DILocation(line: 359, column: 11, scope: !242)
!471 = !DILocation(line: 359, column: 9, scope: !242)
!472 = !DILocation(line: 360, column: 12, scope: !473)
!473 = distinct !DILexicalBlock(scope: !242, file: !11, line: 360, column: 7)
!474 = !DILocation(line: 360, column: 7, scope: !473)
!475 = !DILocation(line: 360, column: 18, scope: !473)
!476 = !DILocation(line: 360, column: 16, scope: !473)
!477 = !DILocation(line: 360, column: 7, scope: !242)
!478 = !DILocation(line: 361, column: 7, scope: !473)
!479 = !DILocation(line: 361, column: 5, scope: !473)
!480 = !DILocation(line: 364, column: 16, scope: !242)
!481 = !DILocation(line: 364, column: 9, scope: !242)
!482 = !DILocation(line: 364, column: 39, scope: !242)
!483 = !DILocation(line: 364, column: 23, scope: !242)
!484 = !DILocation(line: 364, column: 21, scope: !242)
!485 = !DILocation(line: 364, column: 44, scope: !242)
!486 = !DILocation(line: 364, column: 8, scope: !242)
!487 = !DILocation(line: 364, column: 6, scope: !242)
!488 = !DILocation(line: 367, column: 17, scope: !242)
!489 = !DILocation(line: 367, column: 21, scope: !242)
!490 = !DILocation(line: 367, column: 9, scope: !242)
!491 = !DILocation(line: 367, column: 7, scope: !242)
!492 = !DILocation(line: 370, column: 18, scope: !242)
!493 = !DILocation(line: 370, column: 10, scope: !242)
!494 = !DILocation(line: 370, column: 8, scope: !242)
!495 = !DILocation(line: 373, column: 8, scope: !242)
!496 = !DILocation(line: 373, column: 13, scope: !242)
!497 = !DILocation(line: 373, column: 11, scope: !242)
!498 = !DILocation(line: 373, column: 6, scope: !242)
!499 = !DILocation(line: 378, column: 11, scope: !242)
!500 = !DILocation(line: 378, column: 3, scope: !242)
!501 = !DILocation(line: 382, column: 17, scope: !242)
!502 = !DILocation(line: 382, column: 22, scope: !242)
!503 = !DILocation(line: 382, column: 27, scope: !242)
!504 = !DILocation(line: 382, column: 31, scope: !242)
!505 = !DILocation(line: 382, column: 36, scope: !242)
!506 = !DILocation(line: 382, column: 9, scope: !242)
!507 = !DILocation(line: 382, column: 7, scope: !242)
!508 = !DILocation(line: 385, column: 17, scope: !242)
!509 = !DILocation(line: 385, column: 22, scope: !242)
!510 = !DILocation(line: 385, column: 27, scope: !242)
!511 = !DILocation(line: 385, column: 31, scope: !242)
!512 = !DILocation(line: 385, column: 9, scope: !242)
!513 = !DILocation(line: 385, column: 7, scope: !242)
!514 = !DILocation(line: 388, column: 8, scope: !242)
!515 = !DILocation(line: 388, column: 13, scope: !242)
!516 = !DILocation(line: 388, column: 11, scope: !242)
!517 = !DILocation(line: 388, column: 6, scope: !242)
!518 = !DILocation(line: 391, column: 9, scope: !242)
!519 = !DILocation(line: 391, column: 7, scope: !242)
!520 = !DILocation(line: 392, column: 9, scope: !242)
!521 = !DILocation(line: 392, column: 7, scope: !242)
!522 = !DILocation(line: 393, column: 9, scope: !242)
!523 = !DILocation(line: 393, column: 7, scope: !242)
!524 = !DILocation(line: 394, column: 9, scope: !242)
!525 = !DILocation(line: 394, column: 7, scope: !242)
!526 = !DILocation(line: 397, column: 11, scope: !242)
!527 = !DILocation(line: 397, column: 17, scope: !242)
!528 = !DILocation(line: 397, column: 20, scope: !242)
!529 = !DILocation(line: 397, column: 14, scope: !242)
!530 = !DILocation(line: 398, column: 1, scope: !242)
!531 = !DILocation(line: 397, column: 3, scope: !242)
!532 = distinct !DISubprogram(name: "filtez", scope: !11, file: !11, line: 583, type: !533, isLocal: false, isDefinition: true, scopeLine: 584, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!533 = !DISubroutineType(types: !534)
!534 = !{!7, !258, !258}
!535 = !DILocalVariable(name: "bpl", arg: 1, scope: !532, file: !11, line: 583, type: !258)
!536 = !DILocation(line: 583, column: 14, scope: !532)
!537 = !DILocalVariable(name: "dlt", arg: 2, scope: !532, file: !11, line: 583, type: !258)
!538 = !DILocation(line: 583, column: 24, scope: !532)
!539 = !DILocation(line: 585, column: 3, scope: !532)
!540 = !DILocalVariable(name: "i", scope: !532, file: !11, line: 585, type: !7)
!541 = !DILocation(line: 585, column: 7, scope: !532)
!542 = !DILocation(line: 586, column: 3, scope: !532)
!543 = !DILocalVariable(name: "zl", scope: !532, file: !11, line: 586, type: !6)
!544 = !DILocation(line: 586, column: 12, scope: !532)
!545 = !DILocation(line: 587, column: 20, scope: !532)
!546 = !DILocation(line: 587, column: 16, scope: !532)
!547 = !DILocation(line: 587, column: 8, scope: !532)
!548 = !DILocation(line: 587, column: 31, scope: !532)
!549 = !DILocation(line: 587, column: 27, scope: !532)
!550 = !DILocation(line: 587, column: 26, scope: !532)
!551 = !DILocation(line: 587, column: 24, scope: !532)
!552 = !DILocation(line: 587, column: 6, scope: !532)
!553 = !DILocation(line: 587, column: 3, scope: !532)
!554 = !DILocation(line: 588, column: 24, scope: !555)
!555 = distinct !DILexicalBlock(scope: !532, file: !11, line: 588, column: 17)
!556 = !DILocation(line: 588, column: 22, scope: !555)
!557 = !DILocation(line: 588, column: 29, scope: !558)
!558 = distinct !DILexicalBlock(scope: !555, file: !11, line: 588, column: 17)
!559 = !DILocation(line: 588, column: 31, scope: !558)
!560 = !DILocation(line: 588, column: 17, scope: !555)
!561 = !DILocation(line: 589, column: 23, scope: !558)
!562 = !DILocation(line: 589, column: 19, scope: !558)
!563 = !DILocation(line: 589, column: 11, scope: !558)
!564 = !DILocation(line: 589, column: 34, scope: !558)
!565 = !DILocation(line: 589, column: 30, scope: !558)
!566 = !DILocation(line: 589, column: 29, scope: !558)
!567 = !DILocation(line: 589, column: 27, scope: !558)
!568 = !DILocation(line: 589, column: 8, scope: !558)
!569 = !DILocation(line: 589, column: 5, scope: !558)
!570 = !DILocation(line: 588, column: 37, scope: !558)
!571 = !DILocation(line: 588, column: 17, scope: !558)
!572 = distinct !{!572, !560, !573, !574}
!573 = !DILocation(line: 589, column: 36, scope: !555)
!574 = !{!"llvm.loop.name", !"filtez_label8"}
!575 = !DILocation(line: 591, column: 18, scope: !532)
!576 = !DILocation(line: 591, column: 21, scope: !532)
!577 = !DILocation(line: 591, column: 11, scope: !532)
!578 = !DILocation(line: 592, column: 1, scope: !532)
!579 = !DILocation(line: 591, column: 3, scope: !532)
!580 = distinct !DISubprogram(name: "filtep", scope: !11, file: !11, line: 598, type: !581, isLocal: false, isDefinition: true, scopeLine: 599, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!581 = !DISubroutineType(types: !582)
!582 = !{!7, !7, !7, !7, !7}
!583 = !DILocalVariable(name: "rlt1", arg: 1, scope: !580, file: !11, line: 598, type: !7)
!584 = !DILocation(line: 598, column: 13, scope: !580)
!585 = !DILocalVariable(name: "al1", arg: 2, scope: !580, file: !11, line: 598, type: !7)
!586 = !DILocation(line: 598, column: 23, scope: !580)
!587 = !DILocalVariable(name: "rlt2", arg: 3, scope: !580, file: !11, line: 598, type: !7)
!588 = !DILocation(line: 598, column: 32, scope: !580)
!589 = !DILocalVariable(name: "al2", arg: 4, scope: !580, file: !11, line: 598, type: !7)
!590 = !DILocation(line: 598, column: 42, scope: !580)
!591 = !DILocation(line: 600, column: 3, scope: !580)
!592 = !DILocalVariable(name: "pl", scope: !580, file: !11, line: 600, type: !6)
!593 = !DILocation(line: 600, column: 12, scope: !580)
!594 = !DILocalVariable(name: "pl2", scope: !580, file: !11, line: 600, type: !6)
!595 = !DILocation(line: 600, column: 16, scope: !580)
!596 = !DILocation(line: 601, column: 12, scope: !580)
!597 = !DILocation(line: 601, column: 10, scope: !580)
!598 = !DILocation(line: 601, column: 8, scope: !580)
!599 = !DILocation(line: 601, column: 6, scope: !580)
!600 = !DILocation(line: 602, column: 15, scope: !580)
!601 = !DILocation(line: 602, column: 8, scope: !580)
!602 = !DILocation(line: 602, column: 20, scope: !580)
!603 = !DILocation(line: 602, column: 19, scope: !580)
!604 = !DILocation(line: 602, column: 6, scope: !580)
!605 = !DILocation(line: 603, column: 13, scope: !580)
!606 = !DILocation(line: 603, column: 11, scope: !580)
!607 = !DILocation(line: 603, column: 9, scope: !580)
!608 = !DILocation(line: 603, column: 7, scope: !580)
!609 = !DILocation(line: 604, column: 16, scope: !580)
!610 = !DILocation(line: 604, column: 9, scope: !580)
!611 = !DILocation(line: 604, column: 21, scope: !580)
!612 = !DILocation(line: 604, column: 20, scope: !580)
!613 = !DILocation(line: 604, column: 6, scope: !580)
!614 = !DILocation(line: 605, column: 18, scope: !580)
!615 = !DILocation(line: 605, column: 21, scope: !580)
!616 = !DILocation(line: 605, column: 11, scope: !580)
!617 = !DILocation(line: 606, column: 1, scope: !580)
!618 = !DILocation(line: 605, column: 3, scope: !580)
!619 = distinct !DISubprogram(name: "quantl", scope: !11, file: !11, line: 610, type: !243, isLocal: false, isDefinition: true, scopeLine: 611, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!620 = !DILocalVariable(name: "el", arg: 1, scope: !619, file: !11, line: 610, type: !7)
!621 = !DILocation(line: 610, column: 13, scope: !619)
!622 = !DILocalVariable(name: "detl", arg: 2, scope: !619, file: !11, line: 610, type: !7)
!623 = !DILocation(line: 610, column: 21, scope: !619)
!624 = !DILocation(line: 612, column: 3, scope: !619)
!625 = !DILocalVariable(name: "ril", scope: !619, file: !11, line: 612, type: !7)
!626 = !DILocation(line: 612, column: 7, scope: !619)
!627 = !DILocalVariable(name: "mil", scope: !619, file: !11, line: 612, type: !7)
!628 = !DILocation(line: 612, column: 12, scope: !619)
!629 = !DILocation(line: 613, column: 3, scope: !619)
!630 = !DILocalVariable(name: "wd", scope: !619, file: !11, line: 613, type: !6)
!631 = !DILocation(line: 613, column: 12, scope: !619)
!632 = !DILocalVariable(name: "decis", scope: !619, file: !11, line: 613, type: !6)
!633 = !DILocation(line: 613, column: 16, scope: !619)
!634 = !DILocation(line: 616, column: 13, scope: !619)
!635 = !DILocation(line: 616, column: 8, scope: !619)
!636 = !DILocation(line: 616, column: 6, scope: !619)
!637 = !DILocation(line: 616, column: 3, scope: !619)
!638 = !DILocation(line: 618, column: 26, scope: !639)
!639 = distinct !DILexicalBlock(scope: !619, file: !11, line: 618, column: 17)
!640 = !DILocation(line: 618, column: 22, scope: !639)
!641 = !DILocation(line: 618, column: 31, scope: !642)
!642 = distinct !DILexicalBlock(scope: !639, file: !11, line: 618, column: 17)
!643 = !DILocation(line: 618, column: 35, scope: !642)
!644 = !DILocation(line: 618, column: 17, scope: !639)
!645 = !DILocation(line: 620, column: 27, scope: !646)
!646 = distinct !DILexicalBlock(scope: !642, file: !11, line: 619, column: 5)
!647 = !DILocation(line: 620, column: 16, scope: !646)
!648 = !DILocation(line: 620, column: 41, scope: !646)
!649 = !DILocation(line: 620, column: 34, scope: !646)
!650 = !DILocation(line: 620, column: 32, scope: !646)
!651 = !DILocation(line: 620, column: 47, scope: !646)
!652 = !DILocation(line: 620, column: 13, scope: !646)
!653 = !DILocation(line: 621, column: 11, scope: !654)
!654 = distinct !DILexicalBlock(scope: !646, file: !11, line: 621, column: 11)
!655 = !DILocation(line: 621, column: 17, scope: !654)
!656 = !DILocation(line: 621, column: 14, scope: !654)
!657 = !DILocation(line: 621, column: 11, scope: !646)
!658 = !DILocation(line: 622, column: 2, scope: !654)
!659 = !DILocation(line: 623, column: 5, scope: !646)
!660 = !DILocation(line: 618, column: 44, scope: !642)
!661 = !DILocation(line: 618, column: 17, scope: !642)
!662 = distinct !{!662, !644, !663, !664}
!663 = !DILocation(line: 623, column: 5, scope: !639)
!664 = !{!"llvm.loop.name", !"quantl_label9"}
!665 = !DILocation(line: 625, column: 7, scope: !666)
!666 = distinct !DILexicalBlock(scope: !619, file: !11, line: 625, column: 7)
!667 = !DILocation(line: 625, column: 10, scope: !666)
!668 = !DILocation(line: 625, column: 7, scope: !619)
!669 = !DILocation(line: 626, column: 25, scope: !666)
!670 = !DILocation(line: 626, column: 11, scope: !666)
!671 = !DILocation(line: 626, column: 9, scope: !666)
!672 = !DILocation(line: 626, column: 5, scope: !666)
!673 = !DILocation(line: 628, column: 25, scope: !666)
!674 = !DILocation(line: 628, column: 11, scope: !666)
!675 = !DILocation(line: 628, column: 9, scope: !666)
!676 = !DILocation(line: 629, column: 11, scope: !619)
!677 = !DILocation(line: 630, column: 1, scope: !619)
!678 = !DILocation(line: 629, column: 3, scope: !619)
!679 = distinct !DISubprogram(name: "logscl", scope: !11, file: !11, line: 636, type: !243, isLocal: false, isDefinition: true, scopeLine: 637, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!680 = !DILocalVariable(name: "il", arg: 1, scope: !679, file: !11, line: 636, type: !7)
!681 = !DILocation(line: 636, column: 13, scope: !679)
!682 = !DILocalVariable(name: "nbl", arg: 2, scope: !679, file: !11, line: 636, type: !7)
!683 = !DILocation(line: 636, column: 21, scope: !679)
!684 = !DILocation(line: 638, column: 3, scope: !679)
!685 = !DILocalVariable(name: "wd", scope: !679, file: !11, line: 638, type: !6)
!686 = !DILocation(line: 638, column: 12, scope: !679)
!687 = !DILocation(line: 639, column: 16, scope: !679)
!688 = !DILocation(line: 639, column: 9, scope: !679)
!689 = !DILocation(line: 639, column: 20, scope: !679)
!690 = !DILocation(line: 639, column: 28, scope: !679)
!691 = !DILocation(line: 639, column: 6, scope: !679)
!692 = !DILocation(line: 640, column: 15, scope: !679)
!693 = !DILocation(line: 640, column: 9, scope: !679)
!694 = !DILocation(line: 640, column: 34, scope: !679)
!695 = !DILocation(line: 640, column: 37, scope: !679)
!696 = !DILocation(line: 640, column: 20, scope: !679)
!697 = !DILocation(line: 640, column: 18, scope: !679)
!698 = !DILocation(line: 640, column: 7, scope: !679)
!699 = !DILocation(line: 641, column: 7, scope: !700)
!700 = distinct !DILexicalBlock(scope: !679, file: !11, line: 641, column: 7)
!701 = !DILocation(line: 641, column: 11, scope: !700)
!702 = !DILocation(line: 641, column: 7, scope: !679)
!703 = !DILocation(line: 642, column: 9, scope: !700)
!704 = !DILocation(line: 642, column: 5, scope: !700)
!705 = !DILocation(line: 643, column: 7, scope: !706)
!706 = distinct !DILexicalBlock(scope: !679, file: !11, line: 643, column: 7)
!707 = !DILocation(line: 643, column: 11, scope: !706)
!708 = !DILocation(line: 643, column: 7, scope: !679)
!709 = !DILocation(line: 644, column: 9, scope: !706)
!710 = !DILocation(line: 644, column: 5, scope: !706)
!711 = !DILocation(line: 645, column: 11, scope: !679)
!712 = !DILocation(line: 646, column: 1, scope: !679)
!713 = !DILocation(line: 645, column: 3, scope: !679)
!714 = distinct !DISubprogram(name: "scalel", scope: !11, file: !11, line: 651, type: !243, isLocal: false, isDefinition: true, scopeLine: 652, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!715 = !DILocalVariable(name: "nbl", arg: 1, scope: !714, file: !11, line: 651, type: !7)
!716 = !DILocation(line: 651, column: 13, scope: !714)
!717 = !DILocalVariable(name: "shift_constant", arg: 2, scope: !714, file: !11, line: 651, type: !7)
!718 = !DILocation(line: 651, column: 22, scope: !714)
!719 = !DILocation(line: 653, column: 3, scope: !714)
!720 = !DILocalVariable(name: "wd1", scope: !714, file: !11, line: 653, type: !7)
!721 = !DILocation(line: 653, column: 7, scope: !714)
!722 = !DILocalVariable(name: "wd2", scope: !714, file: !11, line: 653, type: !7)
!723 = !DILocation(line: 653, column: 12, scope: !714)
!724 = !DILocalVariable(name: "wd3", scope: !714, file: !11, line: 653, type: !7)
!725 = !DILocation(line: 653, column: 17, scope: !714)
!726 = !DILocation(line: 654, column: 10, scope: !714)
!727 = !DILocation(line: 654, column: 14, scope: !714)
!728 = !DILocation(line: 654, column: 20, scope: !714)
!729 = !DILocation(line: 654, column: 7, scope: !714)
!730 = !DILocation(line: 655, column: 9, scope: !714)
!731 = !DILocation(line: 655, column: 13, scope: !714)
!732 = !DILocation(line: 655, column: 7, scope: !714)
!733 = !DILocation(line: 656, column: 19, scope: !714)
!734 = !DILocation(line: 656, column: 9, scope: !714)
!735 = !DILocation(line: 656, column: 28, scope: !714)
!736 = !DILocation(line: 656, column: 43, scope: !714)
!737 = !DILocation(line: 656, column: 49, scope: !714)
!738 = !DILocation(line: 656, column: 47, scope: !714)
!739 = !DILocation(line: 656, column: 24, scope: !714)
!740 = !DILocation(line: 656, column: 7, scope: !714)
!741 = !DILocation(line: 657, column: 11, scope: !714)
!742 = !DILocation(line: 657, column: 15, scope: !714)
!743 = !DILocation(line: 658, column: 1, scope: !714)
!744 = !DILocation(line: 657, column: 3, scope: !714)
!745 = distinct !DISubprogram(name: "upzero", scope: !11, file: !11, line: 664, type: !746, isLocal: false, isDefinition: true, scopeLine: 665, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!746 = !DISubroutineType(types: !747)
!747 = !{null, !7, !258, !258}
!748 = !DILocalVariable(name: "dlt", arg: 1, scope: !745, file: !11, line: 664, type: !7)
!749 = !DILocation(line: 664, column: 13, scope: !745)
!750 = !DILocalVariable(name: "dlti", arg: 2, scope: !745, file: !11, line: 664, type: !258)
!751 = !DILocation(line: 664, column: 23, scope: !745)
!752 = !DILocalVariable(name: "bli", arg: 3, scope: !745, file: !11, line: 664, type: !258)
!753 = !DILocation(line: 664, column: 34, scope: !745)
!754 = !DILocation(line: 666, column: 3, scope: !745)
!755 = !DILocalVariable(name: "i", scope: !745, file: !11, line: 666, type: !7)
!756 = !DILocation(line: 666, column: 7, scope: !745)
!757 = !DILocalVariable(name: "wd2", scope: !745, file: !11, line: 666, type: !7)
!758 = !DILocation(line: 666, column: 10, scope: !745)
!759 = !DILocalVariable(name: "wd3", scope: !745, file: !11, line: 666, type: !7)
!760 = !DILocation(line: 666, column: 15, scope: !745)
!761 = !DILocation(line: 668, column: 7, scope: !762)
!762 = distinct !DILexicalBlock(scope: !745, file: !11, line: 668, column: 7)
!763 = !DILocation(line: 668, column: 11, scope: !762)
!764 = !DILocation(line: 668, column: 7, scope: !745)
!765 = !DILocation(line: 669, column: 5, scope: !762)
!766 = !DILocation(line: 670, column: 29, scope: !767)
!767 = distinct !DILexicalBlock(scope: !768, file: !11, line: 670, column: 22)
!768 = distinct !DILexicalBlock(scope: !762, file: !11, line: 669, column: 5)
!769 = !DILocation(line: 670, column: 27, scope: !767)
!770 = !DILocation(line: 670, column: 34, scope: !771)
!771 = distinct !DILexicalBlock(scope: !767, file: !11, line: 670, column: 22)
!772 = !DILocation(line: 670, column: 36, scope: !771)
!773 = !DILocation(line: 670, column: 22, scope: !767)
!774 = !DILocation(line: 672, column: 28, scope: !775)
!775 = distinct !DILexicalBlock(scope: !771, file: !11, line: 671, column: 2)
!776 = !DILocation(line: 672, column: 32, scope: !775)
!777 = !DILocation(line: 672, column: 26, scope: !775)
!778 = !DILocation(line: 672, column: 36, scope: !775)
!779 = !DILocation(line: 672, column: 13, scope: !775)
!780 = !DILocation(line: 672, column: 4, scope: !775)
!781 = !DILocation(line: 672, column: 8, scope: !775)
!782 = !DILocation(line: 672, column: 11, scope: !775)
!783 = !DILocation(line: 673, column: 2, scope: !775)
!784 = !DILocation(line: 670, column: 42, scope: !771)
!785 = !DILocation(line: 670, column: 22, scope: !771)
!786 = distinct !{!786, !773, !787, !788}
!787 = !DILocation(line: 673, column: 2, scope: !767)
!788 = !{!"llvm.loop.name", !"upzero_label10"}
!789 = !DILocation(line: 674, column: 5, scope: !768)
!790 = !DILocation(line: 676, column: 5, scope: !762)
!791 = !DILocation(line: 677, column: 29, scope: !792)
!792 = distinct !DILexicalBlock(scope: !793, file: !11, line: 677, column: 22)
!793 = distinct !DILexicalBlock(scope: !762, file: !11, line: 676, column: 5)
!794 = !DILocation(line: 677, column: 27, scope: !792)
!795 = !DILocation(line: 677, column: 34, scope: !796)
!796 = distinct !DILexicalBlock(scope: !792, file: !11, line: 677, column: 22)
!797 = !DILocation(line: 677, column: 36, scope: !796)
!798 = !DILocation(line: 677, column: 22, scope: !792)
!799 = !DILocation(line: 679, column: 15, scope: !800)
!800 = distinct !DILexicalBlock(scope: !801, file: !11, line: 679, column: 8)
!801 = distinct !DILexicalBlock(scope: !796, file: !11, line: 678, column: 2)
!802 = !DILocation(line: 679, column: 8, scope: !800)
!803 = !DILocation(line: 679, column: 21, scope: !800)
!804 = !DILocation(line: 679, column: 26, scope: !800)
!805 = !DILocation(line: 679, column: 19, scope: !800)
!806 = !DILocation(line: 679, column: 29, scope: !800)
!807 = !DILocation(line: 679, column: 8, scope: !801)
!808 = !DILocation(line: 680, column: 10, scope: !800)
!809 = !DILocation(line: 680, column: 6, scope: !800)
!810 = !DILocation(line: 682, column: 10, scope: !800)
!811 = !DILocation(line: 683, column: 25, scope: !801)
!812 = !DILocation(line: 683, column: 29, scope: !801)
!813 = !DILocation(line: 683, column: 23, scope: !801)
!814 = !DILocation(line: 683, column: 33, scope: !801)
!815 = !DILocation(line: 683, column: 10, scope: !801)
!816 = !DILocation(line: 683, column: 8, scope: !801)
!817 = !DILocation(line: 684, column: 13, scope: !801)
!818 = !DILocation(line: 684, column: 19, scope: !801)
!819 = !DILocation(line: 684, column: 17, scope: !801)
!820 = !DILocation(line: 684, column: 4, scope: !801)
!821 = !DILocation(line: 684, column: 8, scope: !801)
!822 = !DILocation(line: 684, column: 11, scope: !801)
!823 = !DILocation(line: 685, column: 2, scope: !801)
!824 = !DILocation(line: 677, column: 42, scope: !796)
!825 = !DILocation(line: 677, column: 22, scope: !796)
!826 = distinct !{!826, !798, !827, !828}
!827 = !DILocation(line: 685, column: 2, scope: !792)
!828 = !{!"llvm.loop.name", !"upzero_label11"}
!829 = !DILocation(line: 688, column: 13, scope: !745)
!830 = !DILocation(line: 688, column: 3, scope: !745)
!831 = !DILocation(line: 688, column: 11, scope: !745)
!832 = !DILocation(line: 689, column: 13, scope: !745)
!833 = !DILocation(line: 689, column: 3, scope: !745)
!834 = !DILocation(line: 689, column: 11, scope: !745)
!835 = !DILocation(line: 690, column: 13, scope: !745)
!836 = !DILocation(line: 690, column: 3, scope: !745)
!837 = !DILocation(line: 690, column: 11, scope: !745)
!838 = !DILocation(line: 691, column: 13, scope: !745)
!839 = !DILocation(line: 691, column: 3, scope: !745)
!840 = !DILocation(line: 691, column: 11, scope: !745)
!841 = !DILocation(line: 692, column: 13, scope: !745)
!842 = !DILocation(line: 692, column: 3, scope: !745)
!843 = !DILocation(line: 692, column: 11, scope: !745)
!844 = !DILocation(line: 693, column: 13, scope: !745)
!845 = !DILocation(line: 693, column: 3, scope: !745)
!846 = !DILocation(line: 693, column: 11, scope: !745)
!847 = !DILocation(line: 694, column: 1, scope: !745)
!848 = distinct !DISubprogram(name: "uppol2", scope: !11, file: !11, line: 700, type: !849, isLocal: false, isDefinition: true, scopeLine: 701, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!849 = !DISubroutineType(types: !850)
!850 = !{!7, !7, !7, !7, !7, !7}
!851 = !DILocalVariable(name: "al1", arg: 1, scope: !848, file: !11, line: 700, type: !7)
!852 = !DILocation(line: 700, column: 13, scope: !848)
!853 = !DILocalVariable(name: "al2", arg: 2, scope: !848, file: !11, line: 700, type: !7)
!854 = !DILocation(line: 700, column: 22, scope: !848)
!855 = !DILocalVariable(name: "plt", arg: 3, scope: !848, file: !11, line: 700, type: !7)
!856 = !DILocation(line: 700, column: 31, scope: !848)
!857 = !DILocalVariable(name: "plt1", arg: 4, scope: !848, file: !11, line: 700, type: !7)
!858 = !DILocation(line: 700, column: 40, scope: !848)
!859 = !DILocalVariable(name: "plt2", arg: 5, scope: !848, file: !11, line: 700, type: !7)
!860 = !DILocation(line: 700, column: 50, scope: !848)
!861 = !DILocation(line: 702, column: 3, scope: !848)
!862 = !DILocalVariable(name: "wd2", scope: !848, file: !11, line: 702, type: !6)
!863 = !DILocation(line: 702, column: 12, scope: !848)
!864 = !DILocalVariable(name: "wd4", scope: !848, file: !11, line: 702, type: !6)
!865 = !DILocation(line: 702, column: 17, scope: !848)
!866 = !DILocation(line: 703, column: 3, scope: !848)
!867 = !DILocalVariable(name: "apl2", scope: !848, file: !11, line: 703, type: !7)
!868 = !DILocation(line: 703, column: 7, scope: !848)
!869 = !DILocation(line: 704, column: 21, scope: !848)
!870 = !DILocation(line: 704, column: 14, scope: !848)
!871 = !DILocation(line: 704, column: 12, scope: !848)
!872 = !DILocation(line: 704, column: 7, scope: !848)
!873 = !DILocation(line: 705, column: 14, scope: !874)
!874 = distinct !DILexicalBlock(scope: !848, file: !11, line: 705, column: 7)
!875 = !DILocation(line: 705, column: 7, scope: !874)
!876 = !DILocation(line: 705, column: 20, scope: !874)
!877 = !DILocation(line: 705, column: 18, scope: !874)
!878 = !DILocation(line: 705, column: 25, scope: !874)
!879 = !DILocation(line: 705, column: 7, scope: !848)
!880 = !DILocation(line: 706, column: 12, scope: !874)
!881 = !DILocation(line: 706, column: 11, scope: !874)
!882 = !DILocation(line: 706, column: 9, scope: !874)
!883 = !DILocation(line: 706, column: 5, scope: !874)
!884 = !DILocation(line: 707, column: 9, scope: !848)
!885 = !DILocation(line: 707, column: 13, scope: !848)
!886 = !DILocation(line: 707, column: 7, scope: !848)
!887 = !DILocation(line: 708, column: 14, scope: !888)
!888 = distinct !DILexicalBlock(scope: !848, file: !11, line: 708, column: 7)
!889 = !DILocation(line: 708, column: 7, scope: !888)
!890 = !DILocation(line: 708, column: 20, scope: !888)
!891 = !DILocation(line: 708, column: 18, scope: !888)
!892 = !DILocation(line: 708, column: 25, scope: !888)
!893 = !DILocation(line: 708, column: 7, scope: !848)
!894 = !DILocation(line: 710, column: 13, scope: !895)
!895 = distinct !DILexicalBlock(scope: !888, file: !11, line: 709, column: 5)
!896 = !DILocation(line: 710, column: 17, scope: !895)
!897 = !DILocation(line: 710, column: 11, scope: !895)
!898 = !DILocation(line: 711, column: 5, scope: !895)
!899 = !DILocation(line: 714, column: 13, scope: !900)
!900 = distinct !DILexicalBlock(scope: !888, file: !11, line: 713, column: 5)
!901 = !DILocation(line: 714, column: 17, scope: !900)
!902 = !DILocation(line: 714, column: 11, scope: !900)
!903 = !DILocation(line: 716, column: 10, scope: !848)
!904 = !DILocation(line: 716, column: 31, scope: !848)
!905 = !DILocation(line: 716, column: 24, scope: !848)
!906 = !DILocation(line: 716, column: 22, scope: !848)
!907 = !DILocation(line: 716, column: 35, scope: !848)
!908 = !DILocation(line: 716, column: 14, scope: !848)
!909 = !DILocation(line: 716, column: 8, scope: !848)
!910 = !DILocation(line: 719, column: 7, scope: !911)
!911 = distinct !DILexicalBlock(scope: !848, file: !11, line: 719, column: 7)
!912 = !DILocation(line: 719, column: 12, scope: !911)
!913 = !DILocation(line: 719, column: 7, scope: !848)
!914 = !DILocation(line: 720, column: 10, scope: !911)
!915 = !DILocation(line: 720, column: 5, scope: !911)
!916 = !DILocation(line: 721, column: 7, scope: !917)
!917 = distinct !DILexicalBlock(scope: !848, file: !11, line: 721, column: 7)
!918 = !DILocation(line: 721, column: 12, scope: !917)
!919 = !DILocation(line: 721, column: 7, scope: !848)
!920 = !DILocation(line: 722, column: 10, scope: !917)
!921 = !DILocation(line: 722, column: 5, scope: !917)
!922 = !DILocation(line: 723, column: 11, scope: !848)
!923 = !DILocation(line: 724, column: 1, scope: !848)
!924 = !DILocation(line: 723, column: 3, scope: !848)
!925 = distinct !DISubprogram(name: "uppol1", scope: !11, file: !11, line: 730, type: !581, isLocal: false, isDefinition: true, scopeLine: 731, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!926 = !DILocalVariable(name: "al1", arg: 1, scope: !925, file: !11, line: 730, type: !7)
!927 = !DILocation(line: 730, column: 13, scope: !925)
!928 = !DILocalVariable(name: "apl2", arg: 2, scope: !925, file: !11, line: 730, type: !7)
!929 = !DILocation(line: 730, column: 22, scope: !925)
!930 = !DILocalVariable(name: "plt", arg: 3, scope: !925, file: !11, line: 730, type: !7)
!931 = !DILocation(line: 730, column: 32, scope: !925)
!932 = !DILocalVariable(name: "plt1", arg: 4, scope: !925, file: !11, line: 730, type: !7)
!933 = !DILocation(line: 730, column: 41, scope: !925)
!934 = !DILocation(line: 732, column: 3, scope: !925)
!935 = !DILocalVariable(name: "wd2", scope: !925, file: !11, line: 732, type: !6)
!936 = !DILocation(line: 732, column: 12, scope: !925)
!937 = !DILocation(line: 733, column: 3, scope: !925)
!938 = !DILocalVariable(name: "wd3", scope: !925, file: !11, line: 733, type: !7)
!939 = !DILocation(line: 733, column: 7, scope: !925)
!940 = !DILocalVariable(name: "apl1", scope: !925, file: !11, line: 733, type: !7)
!941 = !DILocation(line: 733, column: 12, scope: !925)
!942 = !DILocation(line: 734, column: 17, scope: !925)
!943 = !DILocation(line: 734, column: 10, scope: !925)
!944 = !DILocation(line: 734, column: 21, scope: !925)
!945 = !DILocation(line: 734, column: 29, scope: !925)
!946 = !DILocation(line: 734, column: 7, scope: !925)
!947 = !DILocation(line: 735, column: 14, scope: !948)
!948 = distinct !DILexicalBlock(scope: !925, file: !11, line: 735, column: 7)
!949 = !DILocation(line: 735, column: 7, scope: !948)
!950 = !DILocation(line: 735, column: 20, scope: !948)
!951 = !DILocation(line: 735, column: 18, scope: !948)
!952 = !DILocation(line: 735, column: 25, scope: !948)
!953 = !DILocation(line: 735, column: 7, scope: !925)
!954 = !DILocation(line: 737, column: 20, scope: !955)
!955 = distinct !DILexicalBlock(scope: !948, file: !11, line: 736, column: 5)
!956 = !DILocation(line: 737, column: 14, scope: !955)
!957 = !DILocation(line: 737, column: 24, scope: !955)
!958 = !DILocation(line: 737, column: 12, scope: !955)
!959 = !DILocation(line: 738, column: 5, scope: !955)
!960 = !DILocation(line: 741, column: 20, scope: !961)
!961 = distinct !DILexicalBlock(scope: !948, file: !11, line: 740, column: 5)
!962 = !DILocation(line: 741, column: 14, scope: !961)
!963 = !DILocation(line: 741, column: 24, scope: !961)
!964 = !DILocation(line: 741, column: 12, scope: !961)
!965 = !DILocation(line: 744, column: 17, scope: !925)
!966 = !DILocation(line: 744, column: 15, scope: !925)
!967 = !DILocation(line: 744, column: 7, scope: !925)
!968 = !DILocation(line: 745, column: 7, scope: !969)
!969 = distinct !DILexicalBlock(scope: !925, file: !11, line: 745, column: 7)
!970 = !DILocation(line: 745, column: 14, scope: !969)
!971 = !DILocation(line: 745, column: 12, scope: !969)
!972 = !DILocation(line: 745, column: 7, scope: !925)
!973 = !DILocation(line: 746, column: 12, scope: !969)
!974 = !DILocation(line: 746, column: 10, scope: !969)
!975 = !DILocation(line: 746, column: 5, scope: !969)
!976 = !DILocation(line: 747, column: 7, scope: !977)
!977 = distinct !DILexicalBlock(scope: !925, file: !11, line: 747, column: 7)
!978 = !DILocation(line: 747, column: 15, scope: !977)
!979 = !DILocation(line: 747, column: 14, scope: !977)
!980 = !DILocation(line: 747, column: 12, scope: !977)
!981 = !DILocation(line: 747, column: 7, scope: !925)
!982 = !DILocation(line: 748, column: 13, scope: !977)
!983 = !DILocation(line: 748, column: 12, scope: !977)
!984 = !DILocation(line: 748, column: 10, scope: !977)
!985 = !DILocation(line: 748, column: 5, scope: !977)
!986 = !DILocation(line: 749, column: 11, scope: !925)
!987 = !DILocation(line: 750, column: 1, scope: !925)
!988 = !DILocation(line: 749, column: 3, scope: !925)
!989 = distinct !DISubprogram(name: "logsch", scope: !11, file: !11, line: 756, type: !243, isLocal: false, isDefinition: true, scopeLine: 757, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!990 = !DILocalVariable(name: "ih", arg: 1, scope: !989, file: !11, line: 756, type: !7)
!991 = !DILocation(line: 756, column: 13, scope: !989)
!992 = !DILocalVariable(name: "nbh", arg: 2, scope: !989, file: !11, line: 756, type: !7)
!993 = !DILocation(line: 756, column: 21, scope: !989)
!994 = !DILocation(line: 758, column: 3, scope: !989)
!995 = !DILocalVariable(name: "wd", scope: !989, file: !11, line: 758, type: !7)
!996 = !DILocation(line: 758, column: 7, scope: !989)
!997 = !DILocation(line: 759, column: 16, scope: !989)
!998 = !DILocation(line: 759, column: 9, scope: !989)
!999 = !DILocation(line: 759, column: 20, scope: !989)
!1000 = !DILocation(line: 759, column: 28, scope: !989)
!1001 = !DILocation(line: 759, column: 8, scope: !989)
!1002 = !DILocation(line: 759, column: 6, scope: !989)
!1003 = !DILocation(line: 760, column: 9, scope: !989)
!1004 = !DILocation(line: 760, column: 28, scope: !989)
!1005 = !DILocation(line: 760, column: 14, scope: !989)
!1006 = !DILocation(line: 760, column: 12, scope: !989)
!1007 = !DILocation(line: 760, column: 7, scope: !989)
!1008 = !DILocation(line: 761, column: 7, scope: !1009)
!1009 = distinct !DILexicalBlock(scope: !989, file: !11, line: 761, column: 7)
!1010 = !DILocation(line: 761, column: 11, scope: !1009)
!1011 = !DILocation(line: 761, column: 7, scope: !989)
!1012 = !DILocation(line: 762, column: 9, scope: !1009)
!1013 = !DILocation(line: 762, column: 5, scope: !1009)
!1014 = !DILocation(line: 763, column: 7, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !989, file: !11, line: 763, column: 7)
!1016 = !DILocation(line: 763, column: 11, scope: !1015)
!1017 = !DILocation(line: 763, column: 7, scope: !989)
!1018 = !DILocation(line: 764, column: 9, scope: !1015)
!1019 = !DILocation(line: 764, column: 5, scope: !1015)
!1020 = !DILocation(line: 765, column: 11, scope: !989)
!1021 = !DILocation(line: 766, column: 1, scope: !989)
!1022 = !DILocation(line: 765, column: 3, scope: !989)
!1023 = distinct !DISubprogram(name: "decode", scope: !11, file: !11, line: 403, type: !1024, isLocal: false, isDefinition: true, scopeLine: 404, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!1024 = !DISubroutineType(types: !1025)
!1025 = !{null, !7}
!1026 = !DILocalVariable(name: "input", arg: 1, scope: !1023, file: !11, line: 403, type: !7)
!1027 = !DILocation(line: 403, column: 13, scope: !1023)
!1028 = !DILocation(line: 405, column: 3, scope: !1023)
!1029 = !DILocalVariable(name: "i", scope: !1023, file: !11, line: 405, type: !7)
!1030 = !DILocation(line: 405, column: 7, scope: !1023)
!1031 = !DILocation(line: 406, column: 3, scope: !1023)
!1032 = !DILocalVariable(name: "xa1", scope: !1023, file: !11, line: 406, type: !6)
!1033 = !DILocation(line: 406, column: 12, scope: !1023)
!1034 = !DILocalVariable(name: "xa2", scope: !1023, file: !11, line: 406, type: !6)
!1035 = !DILocation(line: 406, column: 17, scope: !1023)
!1036 = !DILocation(line: 407, column: 3, scope: !1023)
!1037 = !DILocalVariable(name: "h_ptr", scope: !1023, file: !11, line: 407, type: !254)
!1038 = !DILocation(line: 407, column: 14, scope: !1023)
!1039 = !DILocation(line: 408, column: 3, scope: !1023)
!1040 = !DILocalVariable(name: "ac_ptr", scope: !1023, file: !11, line: 408, type: !258)
!1041 = !DILocation(line: 408, column: 8, scope: !1023)
!1042 = !DILocalVariable(name: "ac_ptr1", scope: !1023, file: !11, line: 408, type: !258)
!1043 = !DILocation(line: 408, column: 17, scope: !1023)
!1044 = !DILocalVariable(name: "ad_ptr", scope: !1023, file: !11, line: 408, type: !258)
!1045 = !DILocation(line: 408, column: 27, scope: !1023)
!1046 = !DILocalVariable(name: "ad_ptr1", scope: !1023, file: !11, line: 408, type: !258)
!1047 = !DILocation(line: 408, column: 36, scope: !1023)
!1048 = !DILocation(line: 411, column: 9, scope: !1023)
!1049 = !DILocation(line: 411, column: 15, scope: !1023)
!1050 = !DILocation(line: 411, column: 7, scope: !1023)
!1051 = !DILocation(line: 412, column: 8, scope: !1023)
!1052 = !DILocation(line: 412, column: 14, scope: !1023)
!1053 = !DILocation(line: 412, column: 6, scope: !1023)
!1054 = !DILocation(line: 417, column: 13, scope: !1023)
!1055 = !DILocation(line: 417, column: 11, scope: !1023)
!1056 = !DILocation(line: 420, column: 21, scope: !1023)
!1057 = !DILocation(line: 420, column: 31, scope: !1023)
!1058 = !DILocation(line: 420, column: 40, scope: !1023)
!1059 = !DILocation(line: 420, column: 50, scope: !1023)
!1060 = !DILocation(line: 420, column: 13, scope: !1023)
!1061 = !DILocation(line: 420, column: 11, scope: !1023)
!1062 = !DILocation(line: 422, column: 12, scope: !1023)
!1063 = !DILocation(line: 422, column: 22, scope: !1023)
!1064 = !DILocation(line: 422, column: 20, scope: !1023)
!1065 = !DILocation(line: 422, column: 10, scope: !1023)
!1066 = !DILocation(line: 425, column: 21, scope: !1023)
!1067 = !DILocation(line: 425, column: 14, scope: !1023)
!1068 = !DILocation(line: 425, column: 48, scope: !1023)
!1069 = !DILocation(line: 425, column: 52, scope: !1023)
!1070 = !DILocation(line: 425, column: 32, scope: !1023)
!1071 = !DILocation(line: 425, column: 30, scope: !1023)
!1072 = !DILocation(line: 425, column: 59, scope: !1023)
!1073 = !DILocation(line: 425, column: 13, scope: !1023)
!1074 = !DILocation(line: 425, column: 11, scope: !1023)
!1075 = !DILocation(line: 428, column: 16, scope: !1023)
!1076 = !DILocation(line: 428, column: 9, scope: !1023)
!1077 = !DILocation(line: 428, column: 43, scope: !1023)
!1078 = !DILocation(line: 428, column: 27, scope: !1023)
!1079 = !DILocation(line: 428, column: 25, scope: !1023)
!1080 = !DILocation(line: 428, column: 48, scope: !1023)
!1081 = !DILocation(line: 428, column: 8, scope: !1023)
!1082 = !DILocation(line: 428, column: 6, scope: !1023)
!1083 = !DILocation(line: 430, column: 8, scope: !1023)
!1084 = !DILocation(line: 430, column: 13, scope: !1023)
!1085 = !DILocation(line: 430, column: 11, scope: !1023)
!1086 = !DILocation(line: 430, column: 6, scope: !1023)
!1087 = !DILocation(line: 433, column: 21, scope: !1023)
!1088 = !DILocation(line: 433, column: 26, scope: !1023)
!1089 = !DILocation(line: 433, column: 13, scope: !1023)
!1090 = !DILocation(line: 433, column: 11, scope: !1023)
!1091 = !DILocation(line: 436, column: 22, scope: !1023)
!1092 = !DILocation(line: 436, column: 14, scope: !1023)
!1093 = !DILocation(line: 436, column: 12, scope: !1023)
!1094 = !DILocation(line: 440, column: 13, scope: !1023)
!1095 = !DILocation(line: 440, column: 23, scope: !1023)
!1096 = !DILocation(line: 440, column: 21, scope: !1023)
!1097 = !DILocation(line: 440, column: 11, scope: !1023)
!1098 = !DILocation(line: 443, column: 11, scope: !1023)
!1099 = !DILocation(line: 443, column: 3, scope: !1023)
!1100 = !DILocation(line: 446, column: 21, scope: !1023)
!1101 = !DILocation(line: 446, column: 30, scope: !1023)
!1102 = !DILocation(line: 446, column: 39, scope: !1023)
!1103 = !DILocation(line: 446, column: 48, scope: !1023)
!1104 = !DILocation(line: 446, column: 58, scope: !1023)
!1105 = !DILocation(line: 446, column: 13, scope: !1023)
!1106 = !DILocation(line: 446, column: 11, scope: !1023)
!1107 = !DILocation(line: 449, column: 21, scope: !1023)
!1108 = !DILocation(line: 449, column: 30, scope: !1023)
!1109 = !DILocation(line: 449, column: 39, scope: !1023)
!1110 = !DILocation(line: 449, column: 48, scope: !1023)
!1111 = !DILocation(line: 449, column: 13, scope: !1023)
!1112 = !DILocation(line: 449, column: 11, scope: !1023)
!1113 = !DILocation(line: 452, column: 13, scope: !1023)
!1114 = !DILocation(line: 452, column: 22, scope: !1023)
!1115 = !DILocation(line: 452, column: 20, scope: !1023)
!1116 = !DILocation(line: 452, column: 11, scope: !1023)
!1117 = !DILocation(line: 455, column: 14, scope: !1023)
!1118 = !DILocation(line: 455, column: 12, scope: !1023)
!1119 = !DILocation(line: 456, column: 14, scope: !1023)
!1120 = !DILocation(line: 456, column: 12, scope: !1023)
!1121 = !DILocation(line: 457, column: 14, scope: !1023)
!1122 = !DILocation(line: 457, column: 12, scope: !1023)
!1123 = !DILocation(line: 458, column: 14, scope: !1023)
!1124 = !DILocation(line: 458, column: 12, scope: !1023)
!1125 = !DILocation(line: 463, column: 13, scope: !1023)
!1126 = !DILocation(line: 463, column: 11, scope: !1023)
!1127 = !DILocation(line: 466, column: 21, scope: !1023)
!1128 = !DILocation(line: 466, column: 30, scope: !1023)
!1129 = !DILocation(line: 466, column: 39, scope: !1023)
!1130 = !DILocation(line: 466, column: 48, scope: !1023)
!1131 = !DILocation(line: 466, column: 13, scope: !1023)
!1132 = !DILocation(line: 466, column: 11, scope: !1023)
!1133 = !DILocation(line: 469, column: 12, scope: !1023)
!1134 = !DILocation(line: 469, column: 22, scope: !1023)
!1135 = !DILocation(line: 469, column: 20, scope: !1023)
!1136 = !DILocation(line: 469, column: 10, scope: !1023)
!1137 = !DILocation(line: 472, column: 20, scope: !1023)
!1138 = !DILocation(line: 472, column: 13, scope: !1023)
!1139 = !DILocation(line: 472, column: 47, scope: !1023)
!1140 = !DILocation(line: 472, column: 31, scope: !1023)
!1141 = !DILocation(line: 472, column: 29, scope: !1023)
!1142 = !DILocation(line: 472, column: 52, scope: !1023)
!1143 = !DILocation(line: 472, column: 12, scope: !1023)
!1144 = !DILocation(line: 472, column: 10, scope: !1023)
!1145 = !DILocation(line: 475, column: 21, scope: !1023)
!1146 = !DILocation(line: 475, column: 25, scope: !1023)
!1147 = !DILocation(line: 475, column: 13, scope: !1023)
!1148 = !DILocation(line: 475, column: 11, scope: !1023)
!1149 = !DILocation(line: 478, column: 22, scope: !1023)
!1150 = !DILocation(line: 478, column: 14, scope: !1023)
!1151 = !DILocation(line: 478, column: 12, scope: !1023)
!1152 = !DILocation(line: 481, column: 12, scope: !1023)
!1153 = !DILocation(line: 481, column: 21, scope: !1023)
!1154 = !DILocation(line: 481, column: 19, scope: !1023)
!1155 = !DILocation(line: 481, column: 10, scope: !1023)
!1156 = !DILocation(line: 484, column: 11, scope: !1023)
!1157 = !DILocation(line: 484, column: 3, scope: !1023)
!1158 = !DILocation(line: 487, column: 21, scope: !1023)
!1159 = !DILocation(line: 487, column: 30, scope: !1023)
!1160 = !DILocation(line: 487, column: 39, scope: !1023)
!1161 = !DILocation(line: 487, column: 47, scope: !1023)
!1162 = !DILocation(line: 487, column: 56, scope: !1023)
!1163 = !DILocation(line: 487, column: 13, scope: !1023)
!1164 = !DILocation(line: 487, column: 11, scope: !1023)
!1165 = !DILocation(line: 490, column: 21, scope: !1023)
!1166 = !DILocation(line: 490, column: 30, scope: !1023)
!1167 = !DILocation(line: 490, column: 39, scope: !1023)
!1168 = !DILocation(line: 490, column: 47, scope: !1023)
!1169 = !DILocation(line: 490, column: 13, scope: !1023)
!1170 = !DILocation(line: 490, column: 11, scope: !1023)
!1171 = !DILocation(line: 493, column: 8, scope: !1023)
!1172 = !DILocation(line: 493, column: 17, scope: !1023)
!1173 = !DILocation(line: 493, column: 15, scope: !1023)
!1174 = !DILocation(line: 493, column: 6, scope: !1023)
!1175 = !DILocation(line: 496, column: 13, scope: !1023)
!1176 = !DILocation(line: 496, column: 11, scope: !1023)
!1177 = !DILocation(line: 497, column: 13, scope: !1023)
!1178 = !DILocation(line: 497, column: 11, scope: !1023)
!1179 = !DILocation(line: 498, column: 13, scope: !1023)
!1180 = !DILocation(line: 498, column: 11, scope: !1023)
!1181 = !DILocation(line: 499, column: 13, scope: !1023)
!1182 = !DILocation(line: 499, column: 11, scope: !1023)
!1183 = !DILocation(line: 504, column: 8, scope: !1023)
!1184 = !DILocation(line: 504, column: 13, scope: !1023)
!1185 = !DILocation(line: 504, column: 11, scope: !1023)
!1186 = !DILocation(line: 504, column: 6, scope: !1023)
!1187 = !DILocation(line: 505, column: 8, scope: !1023)
!1188 = !DILocation(line: 505, column: 13, scope: !1023)
!1189 = !DILocation(line: 505, column: 11, scope: !1023)
!1190 = !DILocation(line: 505, column: 6, scope: !1023)
!1191 = !DILocation(line: 508, column: 9, scope: !1023)
!1192 = !DILocation(line: 509, column: 10, scope: !1023)
!1193 = !DILocation(line: 510, column: 10, scope: !1023)
!1194 = !DILocation(line: 511, column: 16, scope: !1023)
!1195 = !DILocation(line: 511, column: 9, scope: !1023)
!1196 = !DILocation(line: 511, column: 27, scope: !1023)
!1197 = !DILocation(line: 511, column: 21, scope: !1023)
!1198 = !DILocation(line: 511, column: 20, scope: !1023)
!1199 = !DILocation(line: 511, column: 19, scope: !1023)
!1200 = !DILocation(line: 511, column: 7, scope: !1023)
!1201 = !DILocation(line: 512, column: 16, scope: !1023)
!1202 = !DILocation(line: 512, column: 9, scope: !1023)
!1203 = !DILocation(line: 512, column: 27, scope: !1023)
!1204 = !DILocation(line: 512, column: 21, scope: !1023)
!1205 = !DILocation(line: 512, column: 20, scope: !1023)
!1206 = !DILocation(line: 512, column: 19, scope: !1023)
!1207 = !DILocation(line: 512, column: 7, scope: !1023)
!1208 = !DILocation(line: 512, column: 3, scope: !1023)
!1209 = !DILocation(line: 514, column: 24, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1023, file: !11, line: 514, column: 17)
!1211 = !DILocation(line: 514, column: 22, scope: !1210)
!1212 = !DILocation(line: 514, column: 29, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1210, file: !11, line: 514, column: 17)
!1214 = !DILocation(line: 514, column: 31, scope: !1213)
!1215 = !DILocation(line: 514, column: 17, scope: !1210)
!1216 = !DILocation(line: 516, column: 29, scope: !1217)
!1217 = distinct !DILexicalBlock(scope: !1213, file: !11, line: 515, column: 5)
!1218 = !DILocation(line: 516, column: 22, scope: !1217)
!1219 = !DILocation(line: 516, column: 14, scope: !1217)
!1220 = !DILocation(line: 516, column: 42, scope: !1217)
!1221 = !DILocation(line: 516, column: 36, scope: !1217)
!1222 = !DILocation(line: 516, column: 35, scope: !1217)
!1223 = !DILocation(line: 516, column: 33, scope: !1217)
!1224 = !DILocation(line: 516, column: 11, scope: !1217)
!1225 = !DILocation(line: 517, column: 29, scope: !1217)
!1226 = !DILocation(line: 517, column: 22, scope: !1217)
!1227 = !DILocation(line: 517, column: 14, scope: !1217)
!1228 = !DILocation(line: 517, column: 42, scope: !1217)
!1229 = !DILocation(line: 517, column: 36, scope: !1217)
!1230 = !DILocation(line: 517, column: 35, scope: !1217)
!1231 = !DILocation(line: 517, column: 33, scope: !1217)
!1232 = !DILocation(line: 517, column: 11, scope: !1217)
!1233 = !DILocation(line: 518, column: 5, scope: !1217)
!1234 = !DILocation(line: 514, column: 38, scope: !1213)
!1235 = !DILocation(line: 514, column: 17, scope: !1213)
!1236 = distinct !{!1236, !1215, !1237, !1238}
!1237 = !DILocation(line: 518, column: 5, scope: !1210)
!1238 = !{!"llvm.loop.name", !"decode_label2"}
!1239 = !DILocation(line: 520, column: 19, scope: !1023)
!1240 = !DILocation(line: 520, column: 18, scope: !1023)
!1241 = !DILocation(line: 520, column: 10, scope: !1023)
!1242 = !DILocation(line: 520, column: 36, scope: !1023)
!1243 = !DILocation(line: 520, column: 30, scope: !1023)
!1244 = !DILocation(line: 520, column: 29, scope: !1023)
!1245 = !DILocation(line: 520, column: 27, scope: !1023)
!1246 = !DILocation(line: 520, column: 7, scope: !1023)
!1247 = !DILocation(line: 521, column: 19, scope: !1023)
!1248 = !DILocation(line: 521, column: 18, scope: !1023)
!1249 = !DILocation(line: 521, column: 10, scope: !1023)
!1250 = !DILocation(line: 521, column: 36, scope: !1023)
!1251 = !DILocation(line: 521, column: 30, scope: !1023)
!1252 = !DILocation(line: 521, column: 29, scope: !1023)
!1253 = !DILocation(line: 521, column: 27, scope: !1023)
!1254 = !DILocation(line: 521, column: 7, scope: !1023)
!1255 = !DILocation(line: 524, column: 11, scope: !1023)
!1256 = !DILocation(line: 524, column: 15, scope: !1023)
!1257 = !DILocation(line: 524, column: 9, scope: !1023)
!1258 = !DILocation(line: 525, column: 11, scope: !1023)
!1259 = !DILocation(line: 525, column: 15, scope: !1023)
!1260 = !DILocation(line: 525, column: 9, scope: !1023)
!1261 = !DILocation(line: 528, column: 13, scope: !1023)
!1262 = !DILocation(line: 528, column: 20, scope: !1023)
!1263 = !DILocation(line: 528, column: 11, scope: !1023)
!1264 = !DILocation(line: 529, column: 13, scope: !1023)
!1265 = !DILocation(line: 529, column: 20, scope: !1023)
!1266 = !DILocation(line: 529, column: 11, scope: !1023)
!1267 = !DILocation(line: 529, column: 3, scope: !1023)
!1268 = !DILocation(line: 530, column: 24, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1023, file: !11, line: 530, column: 17)
!1270 = !DILocation(line: 530, column: 22, scope: !1269)
!1271 = !DILocation(line: 530, column: 29, scope: !1272)
!1272 = distinct !DILexicalBlock(scope: !1269, file: !11, line: 530, column: 17)
!1273 = !DILocation(line: 530, column: 31, scope: !1272)
!1274 = !DILocation(line: 530, column: 17, scope: !1269)
!1275 = !DILocation(line: 532, column: 27, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1272, file: !11, line: 531, column: 5)
!1277 = !DILocation(line: 532, column: 19, scope: !1276)
!1278 = !DILocation(line: 532, column: 14, scope: !1276)
!1279 = !DILocation(line: 532, column: 17, scope: !1276)
!1280 = !DILocation(line: 533, column: 27, scope: !1276)
!1281 = !DILocation(line: 533, column: 19, scope: !1276)
!1282 = !DILocation(line: 533, column: 14, scope: !1276)
!1283 = !DILocation(line: 533, column: 17, scope: !1276)
!1284 = !DILocation(line: 534, column: 5, scope: !1276)
!1285 = !DILocation(line: 530, column: 38, scope: !1272)
!1286 = !DILocation(line: 530, column: 17, scope: !1272)
!1287 = distinct !{!1287, !1274, !1288, !1289}
!1288 = !DILocation(line: 534, column: 5, scope: !1269)
!1289 = !{!"llvm.loop.name", !"decode_label3"}
!1290 = !DILocation(line: 535, column: 13, scope: !1023)
!1291 = !DILocation(line: 535, column: 4, scope: !1023)
!1292 = !DILocation(line: 535, column: 11, scope: !1023)
!1293 = !DILocation(line: 536, column: 13, scope: !1023)
!1294 = !DILocation(line: 536, column: 4, scope: !1023)
!1295 = !DILocation(line: 536, column: 11, scope: !1023)
!1296 = !DILocation(line: 537, column: 1, scope: !1023)
!1297 = distinct !DISubprogram(name: "reset", scope: !11, file: !11, line: 542, type: !1298, isLocal: false, isDefinition: true, scopeLine: 543, isOptimized: false, unit: !2, variables: !4)
!1298 = !DISubroutineType(types: !1299)
!1299 = !{null}
!1300 = !DILocation(line: 544, column: 3, scope: !1297)
!1301 = !DILocalVariable(name: "i", scope: !1297, file: !11, line: 544, type: !7)
!1302 = !DILocation(line: 544, column: 7, scope: !1297)
!1303 = !DILocation(line: 546, column: 19, scope: !1297)
!1304 = !DILocation(line: 546, column: 8, scope: !1297)
!1305 = !DILocation(line: 547, column: 19, scope: !1297)
!1306 = !DILocation(line: 547, column: 8, scope: !1297)
!1307 = !DILocation(line: 548, column: 47, scope: !1297)
!1308 = !DILocation(line: 548, column: 40, scope: !1297)
!1309 = !DILocation(line: 548, column: 33, scope: !1297)
!1310 = !DILocation(line: 548, column: 26, scope: !1297)
!1311 = !DILocation(line: 548, column: 19, scope: !1297)
!1312 = !DILocation(line: 548, column: 13, scope: !1297)
!1313 = !DILocation(line: 548, column: 7, scope: !1297)
!1314 = !DILocation(line: 549, column: 43, scope: !1297)
!1315 = !DILocation(line: 549, column: 37, scope: !1297)
!1316 = !DILocation(line: 549, column: 31, scope: !1297)
!1317 = !DILocation(line: 549, column: 25, scope: !1297)
!1318 = !DILocation(line: 549, column: 19, scope: !1297)
!1319 = !DILocation(line: 549, column: 13, scope: !1297)
!1320 = !DILocation(line: 549, column: 7, scope: !1297)
!1321 = !DILocation(line: 550, column: 75, scope: !1297)
!1322 = !DILocation(line: 550, column: 64, scope: !1297)
!1323 = !DILocation(line: 550, column: 53, scope: !1297)
!1324 = !DILocation(line: 550, column: 42, scope: !1297)
!1325 = !DILocation(line: 550, column: 31, scope: !1297)
!1326 = !DILocation(line: 550, column: 21, scope: !1297)
!1327 = !DILocation(line: 550, column: 11, scope: !1297)
!1328 = !DILocation(line: 551, column: 71, scope: !1297)
!1329 = !DILocation(line: 551, column: 61, scope: !1297)
!1330 = !DILocation(line: 551, column: 51, scope: !1297)
!1331 = !DILocation(line: 551, column: 41, scope: !1297)
!1332 = !DILocation(line: 551, column: 31, scope: !1297)
!1333 = !DILocation(line: 551, column: 21, scope: !1297)
!1334 = !DILocation(line: 551, column: 11, scope: !1297)
!1335 = !DILocation(line: 551, column: 3, scope: !1297)
!1336 = !DILocation(line: 553, column: 23, scope: !1337)
!1337 = distinct !DILexicalBlock(scope: !1297, file: !11, line: 553, column: 16)
!1338 = !DILocation(line: 553, column: 21, scope: !1337)
!1339 = !DILocation(line: 553, column: 28, scope: !1340)
!1340 = distinct !DILexicalBlock(scope: !1337, file: !11, line: 553, column: 16)
!1341 = !DILocation(line: 553, column: 30, scope: !1340)
!1342 = !DILocation(line: 553, column: 16, scope: !1337)
!1343 = !DILocation(line: 555, column: 18, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1340, file: !11, line: 554, column: 5)
!1345 = !DILocation(line: 555, column: 7, scope: !1344)
!1346 = !DILocation(line: 555, column: 21, scope: !1344)
!1347 = !DILocation(line: 556, column: 17, scope: !1344)
!1348 = !DILocation(line: 556, column: 7, scope: !1344)
!1349 = !DILocation(line: 556, column: 20, scope: !1344)
!1350 = !DILocation(line: 557, column: 20, scope: !1344)
!1351 = !DILocation(line: 557, column: 7, scope: !1344)
!1352 = !DILocation(line: 557, column: 23, scope: !1344)
!1353 = !DILocation(line: 558, column: 19, scope: !1344)
!1354 = !DILocation(line: 558, column: 7, scope: !1344)
!1355 = !DILocation(line: 558, column: 22, scope: !1344)
!1356 = !DILocation(line: 559, column: 5, scope: !1344)
!1357 = !DILocation(line: 553, column: 36, scope: !1340)
!1358 = !DILocation(line: 553, column: 16, scope: !1340)
!1359 = distinct !{!1359, !1342, !1360, !1361}
!1360 = !DILocation(line: 559, column: 5, scope: !1337)
!1361 = !{!"llvm.loop.name", !"reset_label4"}
!1362 = !DILocation(line: 561, column: 23, scope: !1363)
!1363 = distinct !DILexicalBlock(scope: !1297, file: !11, line: 561, column: 16)
!1364 = !DILocation(line: 561, column: 21, scope: !1363)
!1365 = !DILocation(line: 561, column: 28, scope: !1366)
!1366 = distinct !DILexicalBlock(scope: !1363, file: !11, line: 561, column: 16)
!1367 = !DILocation(line: 561, column: 30, scope: !1366)
!1368 = !DILocation(line: 561, column: 16, scope: !1363)
!1369 = !DILocation(line: 563, column: 17, scope: !1370)
!1370 = distinct !DILexicalBlock(scope: !1366, file: !11, line: 562, column: 5)
!1371 = !DILocation(line: 563, column: 7, scope: !1370)
!1372 = !DILocation(line: 563, column: 20, scope: !1370)
!1373 = !DILocation(line: 564, column: 17, scope: !1370)
!1374 = !DILocation(line: 564, column: 7, scope: !1370)
!1375 = !DILocation(line: 564, column: 20, scope: !1370)
!1376 = !DILocation(line: 565, column: 19, scope: !1370)
!1377 = !DILocation(line: 565, column: 7, scope: !1370)
!1378 = !DILocation(line: 565, column: 22, scope: !1370)
!1379 = !DILocation(line: 566, column: 19, scope: !1370)
!1380 = !DILocation(line: 566, column: 7, scope: !1370)
!1381 = !DILocation(line: 566, column: 22, scope: !1370)
!1382 = !DILocation(line: 567, column: 5, scope: !1370)
!1383 = !DILocation(line: 561, column: 36, scope: !1366)
!1384 = !DILocation(line: 561, column: 16, scope: !1366)
!1385 = distinct !{!1385, !1368, !1386, !1387}
!1386 = !DILocation(line: 567, column: 5, scope: !1363)
!1387 = !{!"llvm.loop.name", !"reset_label5"}
!1388 = !DILocation(line: 569, column: 23, scope: !1389)
!1389 = distinct !DILexicalBlock(scope: !1297, file: !11, line: 569, column: 16)
!1390 = !DILocation(line: 569, column: 21, scope: !1389)
!1391 = !DILocation(line: 569, column: 28, scope: !1392)
!1392 = distinct !DILexicalBlock(scope: !1389, file: !11, line: 569, column: 16)
!1393 = !DILocation(line: 569, column: 30, scope: !1392)
!1394 = !DILocation(line: 569, column: 16, scope: !1389)
!1395 = !DILocation(line: 570, column: 10, scope: !1392)
!1396 = !DILocation(line: 570, column: 5, scope: !1392)
!1397 = !DILocation(line: 570, column: 13, scope: !1392)
!1398 = !DILocation(line: 569, column: 37, scope: !1392)
!1399 = !DILocation(line: 569, column: 16, scope: !1392)
!1400 = distinct !{!1400, !1394, !1401, !1402}
!1401 = !DILocation(line: 570, column: 15, scope: !1389)
!1402 = !{!"llvm.loop.name", !"reset_label6"}
!1403 = !DILocation(line: 572, column: 23, scope: !1404)
!1404 = distinct !DILexicalBlock(scope: !1297, file: !11, line: 572, column: 16)
!1405 = !DILocation(line: 572, column: 21, scope: !1404)
!1406 = !DILocation(line: 572, column: 28, scope: !1407)
!1407 = distinct !DILexicalBlock(scope: !1404, file: !11, line: 572, column: 16)
!1408 = !DILocation(line: 572, column: 30, scope: !1407)
!1409 = !DILocation(line: 572, column: 16, scope: !1404)
!1410 = !DILocation(line: 574, column: 14, scope: !1411)
!1411 = distinct !DILexicalBlock(scope: !1407, file: !11, line: 573, column: 5)
!1412 = !DILocation(line: 574, column: 7, scope: !1411)
!1413 = !DILocation(line: 574, column: 17, scope: !1411)
!1414 = !DILocation(line: 575, column: 14, scope: !1411)
!1415 = !DILocation(line: 575, column: 7, scope: !1411)
!1416 = !DILocation(line: 575, column: 17, scope: !1411)
!1417 = !DILocation(line: 576, column: 5, scope: !1411)
!1418 = !DILocation(line: 572, column: 37, scope: !1407)
!1419 = !DILocation(line: 572, column: 16, scope: !1407)
!1420 = distinct !{!1420, !1409, !1421, !1422}
!1421 = !DILocation(line: 576, column: 5, scope: !1404)
!1422 = !{!"llvm.loop.name", !"reset_label7"}
!1423 = !DILocation(line: 577, column: 1, scope: !1297)
!1424 = distinct !DISubprogram(name: "adpcm_main", scope: !11, file: !11, line: 770, type: !1425, isLocal: false, isDefinition: true, scopeLine: 771, flags: DIFlagPrototyped, isOptimized: false, unit: !2, variables: !4)
!1425 = !DISubroutineType(types: !1426)
!1426 = !{null, !254, !258, !258}
!1427 = !{!1428}
!1428 = !{!"fpga.top", !"user", !1429}
!1429 = !DILocation(line: 769, column: 16, scope: !1424)
!1430 = !DILocalVariable(name: "input_samples", arg: 1, scope: !1424, file: !11, line: 770, type: !254)
!1431 = !DILocation(line: 770, column: 23, scope: !1424)
!1432 = !DILocalVariable(name: "compressed", arg: 2, scope: !1424, file: !11, line: 770, type: !258)
!1433 = !DILocation(line: 770, column: 48, scope: !1424)
!1434 = !DILocalVariable(name: "result", arg: 3, scope: !1424, file: !11, line: 770, type: !258)
!1435 = !DILocation(line: 770, column: 72, scope: !1424)
!1436 = !DILocation(line: 772, column: 3, scope: !1424)
!1437 = !DILocalVariable(name: "i", scope: !1424, file: !11, line: 772, type: !7)
!1438 = !DILocation(line: 772, column: 7, scope: !1424)
!1439 = !DILocalVariable(name: "j", scope: !1424, file: !11, line: 772, type: !7)
!1440 = !DILocation(line: 772, column: 10, scope: !1424)
!1441 = !DILocation(line: 775, column: 3, scope: !1424)
!1442 = !DILocation(line: 777, column: 5, scope: !1424)
!1443 = !DILocation(line: 777, column: 3, scope: !1424)
!1444 = !DILocation(line: 779, column: 29, scope: !1445)
!1445 = distinct !DILexicalBlock(scope: !1424, file: !11, line: 779, column: 22)
!1446 = !DILocation(line: 779, column: 27, scope: !1445)
!1447 = !DILocation(line: 779, column: 34, scope: !1448)
!1448 = distinct !DILexicalBlock(scope: !1445, file: !11, line: 779, column: 22)
!1449 = !DILocation(line: 779, column: 36, scope: !1448)
!1450 = !DILocation(line: 779, column: 22, scope: !1445)
!1451 = !DILocation(line: 781, column: 35, scope: !1452)
!1452 = distinct !DILexicalBlock(scope: !1448, file: !11, line: 780, column: 5)
!1453 = !DILocation(line: 781, column: 49, scope: !1452)
!1454 = !DILocation(line: 781, column: 53, scope: !1452)
!1455 = !DILocation(line: 781, column: 67, scope: !1452)
!1456 = !DILocation(line: 781, column: 69, scope: !1452)
!1457 = !DILocation(line: 781, column: 27, scope: !1452)
!1458 = !DILocation(line: 781, column: 7, scope: !1452)
!1459 = !DILocation(line: 781, column: 18, scope: !1452)
!1460 = !DILocation(line: 781, column: 20, scope: !1452)
!1461 = !DILocation(line: 781, column: 25, scope: !1452)
!1462 = !DILocation(line: 782, column: 5, scope: !1452)
!1463 = !DILocation(line: 779, column: 46, scope: !1448)
!1464 = !DILocation(line: 779, column: 22, scope: !1448)
!1465 = distinct !{!1465, !1450, !1466, !1467}
!1466 = !DILocation(line: 782, column: 5, scope: !1445)
!1467 = !{!"llvm.loop.name", !"adpcm_main_label12"}
!1468 = !DILocation(line: 783, column: 29, scope: !1469)
!1469 = distinct !DILexicalBlock(scope: !1424, file: !11, line: 783, column: 22)
!1470 = !DILocation(line: 783, column: 27, scope: !1469)
!1471 = !DILocation(line: 783, column: 34, scope: !1472)
!1472 = distinct !DILexicalBlock(scope: !1469, file: !11, line: 783, column: 22)
!1473 = !DILocation(line: 783, column: 36, scope: !1472)
!1474 = !DILocation(line: 783, column: 22, scope: !1469)
!1475 = !DILocation(line: 785, column: 17, scope: !1476)
!1476 = distinct !DILexicalBlock(scope: !1472, file: !11, line: 784, column: 5)
!1477 = !DILocation(line: 785, column: 28, scope: !1476)
!1478 = !DILocation(line: 785, column: 30, scope: !1476)
!1479 = !DILocation(line: 785, column: 9, scope: !1476)
!1480 = !DILocation(line: 786, column: 21, scope: !1476)
!1481 = !DILocation(line: 786, column: 9, scope: !1476)
!1482 = !DILocation(line: 786, column: 16, scope: !1476)
!1483 = !DILocation(line: 786, column: 19, scope: !1476)
!1484 = !DILocation(line: 787, column: 25, scope: !1476)
!1485 = !DILocation(line: 787, column: 9, scope: !1476)
!1486 = !DILocation(line: 787, column: 16, scope: !1476)
!1487 = !DILocation(line: 787, column: 18, scope: !1476)
!1488 = !DILocation(line: 787, column: 23, scope: !1476)
!1489 = !DILocation(line: 788, column: 5, scope: !1476)
!1490 = !DILocation(line: 783, column: 46, scope: !1472)
!1491 = !DILocation(line: 783, column: 22, scope: !1472)
!1492 = distinct !{!1492, !1474, !1493, !1494}
!1493 = !DILocation(line: 788, column: 5, scope: !1469)
!1494 = !{!"llvm.loop.name", !"adpcm_main_label13"}
!1495 = !DILocation(line: 789, column: 1, scope: !1424)
