; ModuleID = '<stdin>'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@h = constant [24 x i32] [i32 12, i32 -44, i32 -44, i32 212, i32 48, i32 -624, i32 128, i32 1448, i32 -840, i32 -3220, i32 3804, i32 15504, i32 15504, i32 3804, i32 -3220, i32 -840, i32 1448, i32 128, i32 -624, i32 48, i32 212, i32 -44, i32 -44, i32 12], align 4
@qq4_code4_table = constant [16 x i32] [i32 0, i32 -20456, i32 -12896, i32 -8968, i32 -6288, i32 -4240, i32 -2584, i32 -1200, i32 20456, i32 12896, i32 8968, i32 6288, i32 4240, i32 2584, i32 1200, i32 0], align 4
@qq6_code6_table = constant [64 x i32] [i32 -136, i32 -136, i32 -136, i32 -136, i32 -24808, i32 -21904, i32 -19008, i32 -16704, i32 -14984, i32 -13512, i32 -12280, i32 -11192, i32 -10232, i32 -9360, i32 -8576, i32 -7856, i32 -7192, i32 -6576, i32 -6000, i32 -5456, i32 -4944, i32 -4464, i32 -4008, i32 -3576, i32 -3168, i32 -2776, i32 -2400, i32 -2032, i32 -1688, i32 -1360, i32 -1040, i32 -728, i32 24808, i32 21904, i32 19008, i32 16704, i32 14984, i32 13512, i32 12280, i32 11192, i32 10232, i32 9360, i32 8576, i32 7856, i32 7192, i32 6576, i32 6000, i32 5456, i32 4944, i32 4464, i32 4008, i32 3576, i32 3168, i32 2776, i32 2400, i32 2032, i32 1688, i32 1360, i32 1040, i32 728, i32 432, i32 136, i32 -432, i32 -136], align 4
@wl_code_table = constant [16 x i32] [i32 -60, i32 3042, i32 1198, i32 538, i32 334, i32 172, i32 58, i32 -30, i32 3042, i32 1198, i32 538, i32 334, i32 172, i32 58, i32 -30, i32 -60], align 4
@ilb_table = constant [32 x i32] [i32 2048, i32 2093, i32 2139, i32 2186, i32 2233, i32 2282, i32 2332, i32 2383, i32 2435, i32 2489, i32 2543, i32 2599, i32 2656, i32 2714, i32 2774, i32 2834, i32 2896, i32 2960, i32 3025, i32 3091, i32 3158, i32 3228, i32 3298, i32 3371, i32 3444, i32 3520, i32 3597, i32 3676, i32 3756, i32 3838, i32 3922, i32 4008], align 4
@decis_levl = constant [30 x i32] [i32 280, i32 576, i32 880, i32 1200, i32 1520, i32 1864, i32 2208, i32 2584, i32 2960, i32 3376, i32 3784, i32 4240, i32 4696, i32 5200, i32 5712, i32 6288, i32 6864, i32 7520, i32 8184, i32 8968, i32 9752, i32 10712, i32 11664, i32 12896, i32 14120, i32 15840, i32 17560, i32 20456, i32 23352, i32 32767], align 4
@quant26bt_pos = constant [31 x i32] [i32 61, i32 60, i32 59, i32 58, i32 57, i32 56, i32 55, i32 54, i32 53, i32 52, i32 51, i32 50, i32 49, i32 48, i32 47, i32 46, i32 45, i32 44, i32 43, i32 42, i32 41, i32 40, i32 39, i32 38, i32 37, i32 36, i32 35, i32 34, i32 33, i32 32, i32 32], align 4
@quant26bt_neg = constant [31 x i32] [i32 63, i32 62, i32 31, i32 30, i32 29, i32 28, i32 27, i32 26, i32 25, i32 24, i32 23, i32 22, i32 21, i32 20, i32 19, i32 18, i32 17, i32 16, i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 4], align 4
@qq2_code2_table = constant [4 x i32] [i32 -7408, i32 -1616, i32 7408, i32 1616], align 4
@wh_code_table = constant [4 x i32] [i32 798, i32 -214, i32 798, i32 -214], align 4
@tqmf = common global [24 x i32] zeroinitializer, align 4
@xl = common global i32 0, align 4
@xh = common global i32 0, align 4
@delay_bpl = common global [6 x i32] zeroinitializer, align 4
@delay_dltx = common global [6 x i32] zeroinitializer, align 4
@szl = common global i32 0, align 4
@rlt1 = common global i32 0, align 4
@al1 = common global i32 0, align 4
@rlt2 = common global i32 0, align 4
@al2 = common global i32 0, align 4
@spl = common global i32 0, align 4
@sl = common global i32 0, align 4
@el = common global i32 0, align 4
@detl = common global i32 0, align 4
@il = common global i32 0, align 4
@dlt = common global i32 0, align 4
@nbl = common global i32 0, align 4
@plt = common global i32 0, align 4
@plt1 = common global i32 0, align 4
@plt2 = common global i32 0, align 4
@rlt = common global i32 0, align 4
@delay_bph = common global [6 x i32] zeroinitializer, align 4
@delay_dhx = common global [6 x i32] zeroinitializer, align 4
@szh = common global i32 0, align 4
@rh1 = common global i32 0, align 4
@ah1 = common global i32 0, align 4
@rh2 = common global i32 0, align 4
@ah2 = common global i32 0, align 4
@sph = common global i32 0, align 4
@sh = common global i32 0, align 4
@eh = common global i32 0, align 4
@ih = common global i32 0, align 4
@deth = common global i32 0, align 4
@dh = common global i32 0, align 4
@nbh = common global i32 0, align 4
@ph = common global i32 0, align 4
@ph1 = common global i32 0, align 4
@ph2 = common global i32 0, align 4
@yh = common global i32 0, align 4
@ilr = common global i32 0, align 4
@dec_del_bpl = common global [6 x i32] zeroinitializer, align 4
@dec_del_dltx = common global [6 x i32] zeroinitializer, align 4
@dec_szl = common global i32 0, align 4
@dec_rlt1 = common global i32 0, align 4
@dec_al1 = common global i32 0, align 4
@dec_rlt2 = common global i32 0, align 4
@dec_al2 = common global i32 0, align 4
@dec_spl = common global i32 0, align 4
@dec_sl = common global i32 0, align 4
@dec_detl = common global i32 0, align 4
@dec_dlt = common global i32 0, align 4
@dl = common global i32 0, align 4
@rl = common global i32 0, align 4
@dec_nbl = common global i32 0, align 4
@dec_plt = common global i32 0, align 4
@dec_plt1 = common global i32 0, align 4
@dec_plt2 = common global i32 0, align 4
@dec_rlt = common global i32 0, align 4
@dec_del_bph = common global [6 x i32] zeroinitializer, align 4
@dec_del_dhx = common global [6 x i32] zeroinitializer, align 4
@dec_szh = common global i32 0, align 4
@dec_rh1 = common global i32 0, align 4
@dec_ah1 = common global i32 0, align 4
@dec_rh2 = common global i32 0, align 4
@dec_ah2 = common global i32 0, align 4
@dec_sph = common global i32 0, align 4
@dec_sh = common global i32 0, align 4
@dec_deth = common global i32 0, align 4
@dec_dh = common global i32 0, align 4
@dec_nbh = common global i32 0, align 4
@dec_ph = common global i32 0, align 4
@dec_ph1 = common global i32 0, align 4
@dec_ph2 = common global i32 0, align 4
@rh = common global i32 0, align 4
@xd = common global i32 0, align 4
@xs = common global i32 0, align 4
@accumc = common global [11 x i32] zeroinitializer, align 4
@accumd = common global [11 x i32] zeroinitializer, align 4
@xout1 = common global i32 0, align 4
@xout2 = common global i32 0, align 4
@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: nounwind readnone willreturn
define i32 @abs(i32 %n) #0 {
entry:
  %n.addr = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = bitcast i32* %m to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = load i32, i32* %n.addr, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4
  store i32 %2, i32* %m, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %n.addr, align 4
  %sub = sub i32 0, %3
  store i32 %sub, i32* %m, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %m, align 4
  %5 = bitcast i32* %m to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %5) #5
  ret i32 %4
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
define i32 @encode(i32 %xin1, i32 %xin2) #3 {
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
  store i32 %xin2, i32* %xin2.addr, align 4
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32** %h_ptr to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #5
  %2 = bitcast i32** %tqmf_ptr to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #5
  %3 = bitcast i32** %tqmf_ptr1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #5
  %4 = bitcast i64* %xa to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #5
  %5 = bitcast i64* %xb to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #5
  %6 = bitcast i32* %decis to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #5
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 8
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 0), i32** %tqmf_ptr, align 8
  %7 = load i32*, i32** %tqmf_ptr, align 8
  %incdec.ptr = getelementptr inbounds i32, i32* %7, i32 1
  store i32* %incdec.ptr, i32** %tqmf_ptr, align 8
  %8 = load i32, i32* %7, align 4
  %conv = sext i32 %8 to i64
  %9 = load i32*, i32** %h_ptr, align 8
  %incdec.ptr1 = getelementptr inbounds i32, i32* %9, i32 1
  store i32* %incdec.ptr1, i32** %h_ptr, align 8
  %10 = load i32, i32* %9, align 4
  %conv2 = sext i32 %10 to i64
  %mul = mul i64 %conv, %conv2
  store i64 %mul, i64* %xa, align 8
  %11 = load i32*, i32** %tqmf_ptr, align 8
  %incdec.ptr3 = getelementptr inbounds i32, i32* %11, i32 1
  store i32* %incdec.ptr3, i32** %tqmf_ptr, align 8
  %12 = load i32, i32* %11, align 4
  %conv4 = sext i32 %12 to i64
  %13 = load i32*, i32** %h_ptr, align 8
  %incdec.ptr5 = getelementptr inbounds i32, i32* %13, i32 1
  store i32* %incdec.ptr5, i32** %h_ptr, align 8
  %14 = load i32, i32* %13, align 4
  %conv6 = sext i32 %14 to i64
  %mul7 = mul i64 %conv4, %conv6
  store i64 %mul7, i64* %xb, align 8
  br label %encode_label0

encode_label0:                                    ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %encode_label0
  %15 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %15, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %16 = load i32*, i32** %tqmf_ptr, align 8
  %incdec.ptr8 = getelementptr inbounds i32, i32* %16, i32 1
  store i32* %incdec.ptr8, i32** %tqmf_ptr, align 8
  %17 = load i32, i32* %16, align 4
  %conv9 = sext i32 %17 to i64
  %18 = load i32*, i32** %h_ptr, align 8
  %incdec.ptr10 = getelementptr inbounds i32, i32* %18, i32 1
  store i32* %incdec.ptr10, i32** %h_ptr, align 8
  %19 = load i32, i32* %18, align 4
  %conv11 = sext i32 %19 to i64
  %mul12 = mul i64 %conv9, %conv11
  %20 = load i64, i64* %xa, align 8
  %add = add i64 %20, %mul12
  store i64 %add, i64* %xa, align 8
  %21 = load i32*, i32** %tqmf_ptr, align 8
  %incdec.ptr13 = getelementptr inbounds i32, i32* %21, i32 1
  store i32* %incdec.ptr13, i32** %tqmf_ptr, align 8
  %22 = load i32, i32* %21, align 4
  %conv14 = sext i32 %22 to i64
  %23 = load i32*, i32** %h_ptr, align 8
  %incdec.ptr15 = getelementptr inbounds i32, i32* %23, i32 1
  store i32* %incdec.ptr15, i32** %h_ptr, align 8
  %24 = load i32, i32* %23, align 4
  %conv16 = sext i32 %24 to i64
  %mul17 = mul i64 %conv14, %conv16
  %25 = load i64, i64* %xb, align 8
  %add18 = add i64 %25, %mul17
  store i64 %add18, i64* %xb, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %26 = load i32, i32* %i, align 4
  %inc = add i32 %26, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond
  %27 = load i32*, i32** %tqmf_ptr, align 8
  %incdec.ptr19 = getelementptr inbounds i32, i32* %27, i32 1
  store i32* %incdec.ptr19, i32** %tqmf_ptr, align 8
  %28 = load i32, i32* %27, align 4
  %conv20 = sext i32 %28 to i64
  %29 = load i32*, i32** %h_ptr, align 8
  %incdec.ptr21 = getelementptr inbounds i32, i32* %29, i32 1
  store i32* %incdec.ptr21, i32** %h_ptr, align 8
  %30 = load i32, i32* %29, align 4
  %conv22 = sext i32 %30 to i64
  %mul23 = mul i64 %conv20, %conv22
  %31 = load i64, i64* %xa, align 8
  %add24 = add i64 %31, %mul23
  store i64 %add24, i64* %xa, align 8
  %32 = load i32*, i32** %tqmf_ptr, align 8
  %33 = load i32, i32* %32, align 4
  %conv25 = sext i32 %33 to i64
  %34 = load i32*, i32** %h_ptr, align 8
  %incdec.ptr26 = getelementptr inbounds i32, i32* %34, i32 1
  store i32* %incdec.ptr26, i32** %h_ptr, align 8
  %35 = load i32, i32* %34, align 4
  %conv27 = sext i32 %35 to i64
  %mul28 = mul i64 %conv25, %conv27
  %36 = load i64, i64* %xb, align 8
  %add29 = add i64 %36, %mul28
  store i64 %add29, i64* %xb, align 8
  %37 = load i32*, i32** %tqmf_ptr, align 8
  %add.ptr = getelementptr inbounds i32, i32* %37, i64 -2
  store i32* %add.ptr, i32** %tqmf_ptr1, align 8
  br label %encode_label1

encode_label1:                                    ; preds = %for.end
  store i32 0, i32* %i, align 4
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc35, %encode_label1
  %38 = load i32, i32* %i, align 4
  %cmp31 = icmp slt i32 %38, 22
  br i1 %cmp31, label %for.body32, label %for.end37

for.body32:                                       ; preds = %for.cond30
  %39 = load i32*, i32** %tqmf_ptr1, align 8
  %incdec.ptr33 = getelementptr inbounds i32, i32* %39, i32 -1
  store i32* %incdec.ptr33, i32** %tqmf_ptr1, align 8
  %40 = load i32, i32* %39, align 4
  %41 = load i32*, i32** %tqmf_ptr, align 8
  %incdec.ptr34 = getelementptr inbounds i32, i32* %41, i32 -1
  store i32* %incdec.ptr34, i32** %tqmf_ptr, align 8
  store i32 %40, i32* %41, align 4
  br label %for.inc35

for.inc35:                                        ; preds = %for.body32
  %42 = load i32, i32* %i, align 4
  %inc36 = add i32 %42, 1
  store i32 %inc36, i32* %i, align 4
  br label %for.cond30, !llvm.loop !6

for.end37:                                        ; preds = %for.cond30
  %43 = load i32, i32* %xin1.addr, align 4
  %44 = load i32*, i32** %tqmf_ptr, align 8
  %incdec.ptr38 = getelementptr inbounds i32, i32* %44, i32 -1
  store i32* %incdec.ptr38, i32** %tqmf_ptr, align 8
  store i32 %43, i32* %44, align 4
  %45 = load i32, i32* %xin2.addr, align 4
  %46 = load i32*, i32** %tqmf_ptr, align 8
  store i32 %45, i32* %46, align 4
  %47 = load i64, i64* %xa, align 8
  %48 = load i64, i64* %xb, align 8
  %add39 = add i64 %47, %48
  %shr = ashr i64 %add39, 15
  %conv40 = trunc i64 %shr to i32
  store i32 %conv40, i32* @xl, align 4
  %49 = load i64, i64* %xa, align 8
  %50 = load i64, i64* %xb, align 8
  %sub = sub i64 %49, %50
  %shr41 = ashr i64 %sub, 15
  %conv42 = trunc i64 %shr41 to i32
  store i32 %conv42, i32* @xh, align 4
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0))
  store i32 %call, i32* @szl, align 4
  %51 = load i32, i32* @rlt1, align 4
  %52 = load i32, i32* @al1, align 4
  %53 = load i32, i32* @rlt2, align 4
  %54 = load i32, i32* @al2, align 4
  %call43 = call i32 @filtep(i32 %51, i32 %52, i32 %53, i32 %54)
  store i32 %call43, i32* @spl, align 4
  %55 = load i32, i32* @szl, align 4
  %56 = load i32, i32* @spl, align 4
  %add44 = add i32 %55, %56
  store i32 %add44, i32* @sl, align 4
  %57 = load i32, i32* @xl, align 4
  %58 = load i32, i32* @sl, align 4
  %sub45 = sub i32 %57, %58
  store i32 %sub45, i32* @el, align 4
  %59 = load i32, i32* @el, align 4
  %60 = load i32, i32* @detl, align 4
  %call46 = call i32 @quantl(i32 %59, i32 %60)
  store i32 %call46, i32* @il, align 4
  %61 = load i32, i32* @detl, align 4
  %conv47 = sext i32 %61 to i64
  %62 = load i32, i32* @il, align 4
  %shr48 = ashr i32 %62, 2
  %idxprom = sext i32 %shr48 to i64
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i64 0, i64 %idxprom
  %63 = load i32, i32* %arrayidx, align 4
  %conv49 = sext i32 %63 to i64
  %mul50 = mul i64 %conv47, %conv49
  %shr51 = ashr i64 %mul50, 15
  %conv52 = trunc i64 %shr51 to i32
  store i32 %conv52, i32* @dlt, align 4
  %64 = load i32, i32* @il, align 4
  %65 = load i32, i32* @nbl, align 4
  %call53 = call i32 @logscl(i32 %64, i32 %65)
  store i32 %call53, i32* @nbl, align 4
  %66 = load i32, i32* @nbl, align 4
  %call54 = call i32 @scalel(i32 %66, i32 8)
  store i32 %call54, i32* @detl, align 4
  %67 = load i32, i32* @dlt, align 4
  %68 = load i32, i32* @szl, align 4
  %add55 = add i32 %67, %68
  store i32 %add55, i32* @plt, align 4
  %69 = load i32, i32* @dlt, align 4
  call void @upzero(i32 %69, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0))
  %70 = load i32, i32* @al1, align 4
  %71 = load i32, i32* @al2, align 4
  %72 = load i32, i32* @plt, align 4
  %73 = load i32, i32* @plt1, align 4
  %74 = load i32, i32* @plt2, align 4
  %call56 = call i32 @uppol2(i32 %70, i32 %71, i32 %72, i32 %73, i32 %74)
  store i32 %call56, i32* @al2, align 4
  %75 = load i32, i32* @al1, align 4
  %76 = load i32, i32* @al2, align 4
  %77 = load i32, i32* @plt, align 4
  %78 = load i32, i32* @plt1, align 4
  %call57 = call i32 @uppol1(i32 %75, i32 %76, i32 %77, i32 %78)
  store i32 %call57, i32* @al1, align 4
  %79 = load i32, i32* @sl, align 4
  %80 = load i32, i32* @dlt, align 4
  %add58 = add i32 %79, %80
  store i32 %add58, i32* @rlt, align 4
  %81 = load i32, i32* @rlt1, align 4
  store i32 %81, i32* @rlt2, align 4
  %82 = load i32, i32* @rlt, align 4
  store i32 %82, i32* @rlt1, align 4
  %83 = load i32, i32* @plt1, align 4
  store i32 %83, i32* @plt2, align 4
  %84 = load i32, i32* @plt, align 4
  store i32 %84, i32* @plt1, align 4
  %call59 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0))
  store i32 %call59, i32* @szh, align 4
  %85 = load i32, i32* @rh1, align 4
  %86 = load i32, i32* @ah1, align 4
  %87 = load i32, i32* @rh2, align 4
  %88 = load i32, i32* @ah2, align 4
  %call60 = call i32 @filtep(i32 %85, i32 %86, i32 %87, i32 %88)
  store i32 %call60, i32* @sph, align 4
  %89 = load i32, i32* @sph, align 4
  %90 = load i32, i32* @szh, align 4
  %add61 = add i32 %89, %90
  store i32 %add61, i32* @sh, align 4
  %91 = load i32, i32* @xh, align 4
  %92 = load i32, i32* @sh, align 4
  %sub62 = sub i32 %91, %92
  store i32 %sub62, i32* @eh, align 4
  %93 = load i32, i32* @eh, align 4
  %cmp63 = icmp sge i32 %93, 0
  br i1 %cmp63, label %if.then, label %if.else

if.then:                                          ; preds = %for.end37
  store i32 3, i32* @ih, align 4
  br label %if.end

if.else:                                          ; preds = %for.end37
  store i32 1, i32* @ih, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %94 = load i32, i32* @deth, align 4
  %conv64 = sext i32 %94 to i64
  %mul65 = mul i64 564, %conv64
  %shr66 = ashr i64 %mul65, 12
  %conv67 = trunc i64 %shr66 to i32
  store i32 %conv67, i32* %decis, align 4
  %95 = load i32, i32* @eh, align 4
  %call68 = call i32 @abs(i32 %95) #6
  %96 = load i32, i32* %decis, align 4
  %cmp69 = icmp sgt i32 %call68, %96
  br i1 %cmp69, label %if.then70, label %if.end71

if.then70:                                        ; preds = %if.end
  %97 = load i32, i32* @ih, align 4
  %dec = add i32 %97, -1
  store i32 %dec, i32* @ih, align 4
  br label %if.end71

if.end71:                                         ; preds = %if.then70, %if.end
  %98 = load i32, i32* @deth, align 4
  %conv72 = sext i32 %98 to i64
  %99 = load i32, i32* @ih, align 4
  %idxprom73 = sext i32 %99 to i64
  %arrayidx74 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i64 0, i64 %idxprom73
  %100 = load i32, i32* %arrayidx74, align 4
  %conv75 = sext i32 %100 to i64
  %mul76 = mul i64 %conv72, %conv75
  %shr77 = ashr i64 %mul76, 15
  %conv78 = trunc i64 %shr77 to i32
  store i32 %conv78, i32* @dh, align 4
  %101 = load i32, i32* @ih, align 4
  %102 = load i32, i32* @nbh, align 4
  %call79 = call i32 @logsch(i32 %101, i32 %102)
  store i32 %call79, i32* @nbh, align 4
  %103 = load i32, i32* @nbh, align 4
  %call80 = call i32 @scalel(i32 %103, i32 10)
  store i32 %call80, i32* @deth, align 4
  %104 = load i32, i32* @dh, align 4
  %105 = load i32, i32* @szh, align 4
  %add81 = add i32 %104, %105
  store i32 %add81, i32* @ph, align 4
  %106 = load i32, i32* @dh, align 4
  call void @upzero(i32 %106, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0))
  %107 = load i32, i32* @ah1, align 4
  %108 = load i32, i32* @ah2, align 4
  %109 = load i32, i32* @ph, align 4
  %110 = load i32, i32* @ph1, align 4
  %111 = load i32, i32* @ph2, align 4
  %call82 = call i32 @uppol2(i32 %107, i32 %108, i32 %109, i32 %110, i32 %111)
  store i32 %call82, i32* @ah2, align 4
  %112 = load i32, i32* @ah1, align 4
  %113 = load i32, i32* @ah2, align 4
  %114 = load i32, i32* @ph, align 4
  %115 = load i32, i32* @ph1, align 4
  %call83 = call i32 @uppol1(i32 %112, i32 %113, i32 %114, i32 %115)
  store i32 %call83, i32* @ah1, align 4
  %116 = load i32, i32* @sh, align 4
  %117 = load i32, i32* @dh, align 4
  %add84 = add i32 %116, %117
  store i32 %add84, i32* @yh, align 4
  %118 = load i32, i32* @rh1, align 4
  store i32 %118, i32* @rh2, align 4
  %119 = load i32, i32* @yh, align 4
  store i32 %119, i32* @rh1, align 4
  %120 = load i32, i32* @ph1, align 4
  store i32 %120, i32* @ph2, align 4
  %121 = load i32, i32* @ph, align 4
  store i32 %121, i32* @ph1, align 4
  %122 = load i32, i32* @il, align 4
  %123 = load i32, i32* @ih, align 4
  %shl = shl i32 %123, 6
  %or = or i32 %122, %shl
  %124 = bitcast i32* %decis to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %124) #5
  %125 = bitcast i64* %xb to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %125) #5
  %126 = bitcast i64* %xa to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %126) #5
  %127 = bitcast i32** %tqmf_ptr1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %127) #5
  %128 = bitcast i32** %tqmf_ptr to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %128) #5
  %129 = bitcast i32** %h_ptr to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %129) #5
  %130 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %130) #5
  ret i32 %or
}

; Function Attrs: nounwind
define i32 @filtez(i32* %bpl, i32* %dlt) #3 {
entry:
  %bpl.addr = alloca i32*, align 8
  %dlt.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %zl = alloca i64, align 8
  store i32* %bpl, i32** %bpl.addr, align 8
  store i32* %dlt, i32** %dlt.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i64* %zl to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #5
  %2 = load i32*, i32** %bpl.addr, align 8
  %incdec.ptr = getelementptr inbounds i32, i32* %2, i32 1
  store i32* %incdec.ptr, i32** %bpl.addr, align 8
  %3 = load i32, i32* %2, align 4
  %conv = sext i32 %3 to i64
  %4 = load i32*, i32** %dlt.addr, align 8
  %incdec.ptr1 = getelementptr inbounds i32, i32* %4, i32 1
  store i32* %incdec.ptr1, i32** %dlt.addr, align 8
  %5 = load i32, i32* %4, align 4
  %conv2 = sext i32 %5 to i64
  %mul = mul i64 %conv, %conv2
  store i64 %mul, i64* %zl, align 8
  br label %filtez_label8

filtez_label8:                                    ; preds = %entry
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %filtez_label8
  %6 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %6, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %bpl.addr, align 8
  %incdec.ptr3 = getelementptr inbounds i32, i32* %7, i32 1
  store i32* %incdec.ptr3, i32** %bpl.addr, align 8
  %8 = load i32, i32* %7, align 4
  %conv4 = sext i32 %8 to i64
  %9 = load i32*, i32** %dlt.addr, align 8
  %incdec.ptr5 = getelementptr inbounds i32, i32* %9, i32 1
  store i32* %incdec.ptr5, i32** %dlt.addr, align 8
  %10 = load i32, i32* %9, align 4
  %conv6 = sext i32 %10 to i64
  %mul7 = mul i64 %conv4, %conv6
  %11 = load i64, i64* %zl, align 8
  %add = add i64 %11, %mul7
  store i64 %add, i64* %zl, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4
  %inc = add i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %zl, align 8
  %shr = ashr i64 %13, 14
  %conv8 = trunc i64 %shr to i32
  %14 = bitcast i64* %zl to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %14) #5
  %15 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #5
  ret i32 %conv8
}

; Function Attrs: nounwind
define i32 @filtep(i32 %rlt1, i32 %al1, i32 %rlt2, i32 %al2) #3 {
entry:
  %rlt1.addr = alloca i32, align 4
  %al1.addr = alloca i32, align 4
  %rlt2.addr = alloca i32, align 4
  %al2.addr = alloca i32, align 4
  %pl = alloca i64, align 8
  %pl2 = alloca i64, align 8
  store i32 %rlt1, i32* %rlt1.addr, align 4
  store i32 %al1, i32* %al1.addr, align 4
  store i32 %rlt2, i32* %rlt2.addr, align 4
  store i32 %al2, i32* %al2.addr, align 4
  %0 = bitcast i64* %pl to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5
  %1 = bitcast i64* %pl2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #5
  %2 = load i32, i32* %rlt1.addr, align 4
  %mul = mul i32 2, %2
  %conv = sext i32 %mul to i64
  store i64 %conv, i64* %pl, align 8
  %3 = load i32, i32* %al1.addr, align 4
  %conv1 = sext i32 %3 to i64
  %4 = load i64, i64* %pl, align 8
  %mul2 = mul i64 %conv1, %4
  store i64 %mul2, i64* %pl, align 8
  %5 = load i32, i32* %rlt2.addr, align 4
  %mul3 = mul i32 2, %5
  %conv4 = sext i32 %mul3 to i64
  store i64 %conv4, i64* %pl2, align 8
  %6 = load i32, i32* %al2.addr, align 4
  %conv5 = sext i32 %6 to i64
  %7 = load i64, i64* %pl2, align 8
  %mul6 = mul i64 %conv5, %7
  %8 = load i64, i64* %pl, align 8
  %add = add i64 %8, %mul6
  store i64 %add, i64* %pl, align 8
  %9 = load i64, i64* %pl, align 8
  %shr = ashr i64 %9, 15
  %conv7 = trunc i64 %shr to i32
  %10 = bitcast i64* %pl2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %10) #5
  %11 = bitcast i64* %pl to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %11) #5
  ret i32 %conv7
}

; Function Attrs: nounwind
define i32 @quantl(i32 %el, i32 %detl) #3 {
entry:
  %el.addr = alloca i32, align 4
  %detl.addr = alloca i32, align 4
  %ril = alloca i32, align 4
  %mil = alloca i32, align 4
  %wd = alloca i64, align 8
  %decis = alloca i64, align 8
  store i32 %el, i32* %el.addr, align 4
  store i32 %detl, i32* %detl.addr, align 4
  %0 = bitcast i32* %ril to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32* %mil to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = bitcast i64* %wd to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #5
  %3 = bitcast i64* %decis to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #5
  %4 = load i32, i32* %el.addr, align 4
  %call = call i32 @abs(i32 %4) #6
  %conv = sext i32 %call to i64
  store i64 %conv, i64* %wd, align 8
  br label %quantl_label9

quantl_label9:                                    ; preds = %entry
  store i32 0, i32* %mil, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %quantl_label9
  %5 = load i32, i32* %mil, align 4
  %cmp = icmp slt i32 %5, 30
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %mil, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds [30 x i32], [30 x i32]* @decis_levl, i64 0, i64 %idxprom
  %7 = load i32, i32* %arrayidx, align 4
  %conv1 = sext i32 %7 to i64
  %8 = load i32, i32* %detl.addr, align 4
  %conv2 = sext i32 %8 to i64
  %mul = mul i64 %conv1, %conv2
  %shr = ashr i64 %mul, 15
  store i64 %shr, i64* %decis, align 8
  %9 = load i64, i64* %wd, align 8
  %10 = load i64, i64* %decis, align 8
  %cmp3 = icmp sle i64 %9, %10
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %mil, align 4
  %inc = add i32 %11, 1
  store i32 %inc, i32* %mil, align 4
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %if.then, %for.cond
  %12 = load i32, i32* %el.addr, align 4
  %cmp4 = icmp sge i32 %12, 0
  br i1 %cmp4, label %if.then5, label %if.else

if.then5:                                         ; preds = %for.end
  %13 = load i32, i32* %mil, align 4
  %idxprom6 = sext i32 %13 to i64
  %arrayidx7 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_pos, i64 0, i64 %idxprom6
  %14 = load i32, i32* %arrayidx7, align 4
  store i32 %14, i32* %ril, align 4
  br label %if.end10

if.else:                                          ; preds = %for.end
  %15 = load i32, i32* %mil, align 4
  %idxprom8 = sext i32 %15 to i64
  %arrayidx9 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_neg, i64 0, i64 %idxprom8
  %16 = load i32, i32* %arrayidx9, align 4
  store i32 %16, i32* %ril, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then5
  %17 = load i32, i32* %ril, align 4
  %18 = bitcast i64* %decis to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #5
  %19 = bitcast i64* %wd to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #5
  %20 = bitcast i32* %mil to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #5
  %21 = bitcast i32* %ril to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #5
  ret i32 %17
}

; Function Attrs: nounwind
define i32 @logscl(i32 %il, i32 %nbl) #3 {
entry:
  %il.addr = alloca i32, align 4
  %nbl.addr = alloca i32, align 4
  %wd = alloca i64, align 8
  store i32 %il, i32* %il.addr, align 4
  store i32 %nbl, i32* %nbl.addr, align 4
  %0 = bitcast i64* %wd to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5
  %1 = load i32, i32* %nbl.addr, align 4
  %conv = sext i32 %1 to i64
  %mul = mul i64 %conv, 127
  %shr = ashr i64 %mul, 7
  store i64 %shr, i64* %wd, align 8
  %2 = load i64, i64* %wd, align 8
  %conv1 = trunc i64 %2 to i32
  %3 = load i32, i32* %il.addr, align 4
  %shr2 = ashr i32 %3, 2
  %idxprom = sext i32 %shr2 to i64
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @wl_code_table, i64 0, i64 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  %add = add i32 %conv1, %4
  store i32 %add, i32* %nbl.addr, align 4
  %5 = load i32, i32* %nbl.addr, align 4
  %cmp = icmp slt i32 %5, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %nbl.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32, i32* %nbl.addr, align 4
  %cmp3 = icmp sgt i32 %6, 18432
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  store i32 18432, i32* %nbl.addr, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %7 = load i32, i32* %nbl.addr, align 4
  %8 = bitcast i64* %wd to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %8) #5
  ret i32 %7
}

; Function Attrs: nounwind
define i32 @scalel(i32 %nbl, i32 %shift_constant) #3 {
entry:
  %nbl.addr = alloca i32, align 4
  %shift_constant.addr = alloca i32, align 4
  %wd1 = alloca i32, align 4
  %wd2 = alloca i32, align 4
  %wd3 = alloca i32, align 4
  store i32 %nbl, i32* %nbl.addr, align 4
  store i32 %shift_constant, i32* %shift_constant.addr, align 4
  %0 = bitcast i32* %wd1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32* %wd2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = bitcast i32* %wd3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5
  %3 = load i32, i32* %nbl.addr, align 4
  %shr = ashr i32 %3, 6
  %and = and i32 %shr, 31
  store i32 %and, i32* %wd1, align 4
  %4 = load i32, i32* %nbl.addr, align 4
  %shr1 = ashr i32 %4, 11
  store i32 %shr1, i32* %wd2, align 4
  %5 = load i32, i32* %wd1, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [32 x i32], [32 x i32]* @ilb_table, i64 0, i64 %idxprom
  %6 = load i32, i32* %arrayidx, align 4
  %7 = load i32, i32* %shift_constant.addr, align 4
  %add = add i32 %7, 1
  %8 = load i32, i32* %wd2, align 4
  %sub = sub i32 %add, %8
  %shr2 = ashr i32 %6, %sub
  store i32 %shr2, i32* %wd3, align 4
  %9 = load i32, i32* %wd3, align 4
  %shl = shl i32 %9, 3
  %10 = bitcast i32* %wd3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #5
  %11 = bitcast i32* %wd2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %11) #5
  %12 = bitcast i32* %wd1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %12) #5
  ret i32 %shl
}

; Function Attrs: nounwind
define void @upzero(i32 %dlt, i32* %dlti, i32* %bli) #3 {
entry:
  %dlt.addr = alloca i32, align 4
  %dlti.addr = alloca i32*, align 8
  %bli.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %wd2 = alloca i32, align 4
  %wd3 = alloca i32, align 4
  store i32 %dlt, i32* %dlt.addr, align 4
  store i32* %dlti, i32** %dlti.addr, align 8
  store i32* %bli, i32** %bli.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32* %wd2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = bitcast i32* %wd3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5
  %3 = load i32, i32* %dlt.addr, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %upzero_label10

upzero_label10:                                   ; preds = %if.then
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %upzero_label10
  %4 = load i32, i32* %i, align 4
  %cmp1 = icmp slt i32 %4, 6
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %bli.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom
  %7 = load i32, i32* %arrayidx, align 4
  %conv = sext i32 %7 to i64
  %mul = mul i64 255, %conv
  %shr = ashr i64 %mul, 8
  %conv2 = trunc i64 %shr to i32
  %8 = load i32*, i32** %bli.addr, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %9 to i64
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %idxprom3
  store i32 %conv2, i32* %arrayidx4, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc = add i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !12

for.end:                                          ; preds = %for.cond
  br label %if.end27

if.else:                                          ; preds = %entry
  br label %upzero_label11

upzero_label11:                                   ; preds = %if.else
  store i32 0, i32* %i, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc24, %upzero_label11
  %11 = load i32, i32* %i, align 4
  %cmp6 = icmp slt i32 %11, 6
  br i1 %cmp6, label %for.body7, label %for.end26

for.body7:                                        ; preds = %for.cond5
  %12 = load i32, i32* %dlt.addr, align 4
  %conv8 = sext i32 %12 to i64
  %13 = load i32*, i32** %dlti.addr, align 8
  %14 = load i32, i32* %i, align 4
  %idxprom9 = sext i32 %14 to i64
  %arrayidx10 = getelementptr inbounds i32, i32* %13, i64 %idxprom9
  %15 = load i32, i32* %arrayidx10, align 4
  %conv11 = sext i32 %15 to i64
  %mul12 = mul i64 %conv8, %conv11
  %cmp13 = icmp sge i64 %mul12, 0
  br i1 %cmp13, label %if.then14, label %if.else15

if.then14:                                        ; preds = %for.body7
  store i32 128, i32* %wd2, align 4
  br label %if.end

if.else15:                                        ; preds = %for.body7
  store i32 -128, i32* %wd2, align 4
  br label %if.end

if.end:                                           ; preds = %if.else15, %if.then14
  %16 = load i32*, i32** %bli.addr, align 8
  %17 = load i32, i32* %i, align 4
  %idxprom16 = sext i32 %17 to i64
  %arrayidx17 = getelementptr inbounds i32, i32* %16, i64 %idxprom16
  %18 = load i32, i32* %arrayidx17, align 4
  %conv18 = sext i32 %18 to i64
  %mul19 = mul i64 255, %conv18
  %shr20 = ashr i64 %mul19, 8
  %conv21 = trunc i64 %shr20 to i32
  store i32 %conv21, i32* %wd3, align 4
  %19 = load i32, i32* %wd2, align 4
  %20 = load i32, i32* %wd3, align 4
  %add = add i32 %19, %20
  %21 = load i32*, i32** %bli.addr, align 8
  %22 = load i32, i32* %i, align 4
  %idxprom22 = sext i32 %22 to i64
  %arrayidx23 = getelementptr inbounds i32, i32* %21, i64 %idxprom22
  store i32 %add, i32* %arrayidx23, align 4
  br label %for.inc24

for.inc24:                                        ; preds = %if.end
  %23 = load i32, i32* %i, align 4
  %inc25 = add i32 %23, 1
  store i32 %inc25, i32* %i, align 4
  br label %for.cond5, !llvm.loop !14

for.end26:                                        ; preds = %for.cond5
  br label %if.end27

if.end27:                                         ; preds = %for.end26, %for.end
  %24 = load i32*, i32** %dlti.addr, align 8
  %arrayidx28 = getelementptr inbounds i32, i32* %24, i64 4
  %25 = load i32, i32* %arrayidx28, align 4
  %26 = load i32*, i32** %dlti.addr, align 8
  %arrayidx29 = getelementptr inbounds i32, i32* %26, i64 5
  store i32 %25, i32* %arrayidx29, align 4
  %27 = load i32*, i32** %dlti.addr, align 8
  %arrayidx30 = getelementptr inbounds i32, i32* %27, i64 3
  %28 = load i32, i32* %arrayidx30, align 4
  %29 = load i32*, i32** %dlti.addr, align 8
  %arrayidx31 = getelementptr inbounds i32, i32* %29, i64 4
  store i32 %28, i32* %arrayidx31, align 4
  %30 = load i32*, i32** %dlti.addr, align 8
  %arrayidx32 = getelementptr inbounds i32, i32* %30, i64 2
  %31 = load i32, i32* %arrayidx32, align 4
  %32 = load i32*, i32** %dlti.addr, align 8
  %arrayidx33 = getelementptr inbounds i32, i32* %32, i64 3
  store i32 %31, i32* %arrayidx33, align 4
  %33 = load i32*, i32** %dlti.addr, align 8
  %arrayidx34 = getelementptr inbounds i32, i32* %33, i64 1
  %34 = load i32, i32* %arrayidx34, align 4
  %35 = load i32*, i32** %dlti.addr, align 8
  %arrayidx35 = getelementptr inbounds i32, i32* %35, i64 2
  store i32 %34, i32* %arrayidx35, align 4
  %36 = load i32*, i32** %dlti.addr, align 8
  %arrayidx36 = getelementptr inbounds i32, i32* %36, i64 0
  %37 = load i32, i32* %arrayidx36, align 4
  %38 = load i32*, i32** %dlti.addr, align 8
  %arrayidx37 = getelementptr inbounds i32, i32* %38, i64 1
  store i32 %37, i32* %arrayidx37, align 4
  %39 = load i32, i32* %dlt.addr, align 4
  %40 = load i32*, i32** %dlti.addr, align 8
  %arrayidx38 = getelementptr inbounds i32, i32* %40, i64 0
  store i32 %39, i32* %arrayidx38, align 4
  %41 = bitcast i32* %wd3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %41) #5
  %42 = bitcast i32* %wd2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %42) #5
  %43 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %43) #5
  ret void
}

; Function Attrs: nounwind
define i32 @uppol2(i32 %al1, i32 %al2, i32 %plt, i32 %plt1, i32 %plt2) #3 {
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
  store i32 %al2, i32* %al2.addr, align 4
  store i32 %plt, i32* %plt.addr, align 4
  store i32 %plt1, i32* %plt1.addr, align 4
  store i32 %plt2, i32* %plt2.addr, align 4
  %0 = bitcast i64* %wd2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5
  %1 = bitcast i64* %wd4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #5
  %2 = bitcast i32* %apl2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5
  %3 = load i32, i32* %al1.addr, align 4
  %conv = sext i32 %3 to i64
  %mul = mul i64 4, %conv
  store i64 %mul, i64* %wd2, align 8
  %4 = load i32, i32* %plt.addr, align 4
  %conv1 = sext i32 %4 to i64
  %5 = load i32, i32* %plt1.addr, align 4
  %conv2 = sext i32 %5 to i64
  %mul3 = mul i64 %conv1, %conv2
  %cmp = icmp sge i64 %mul3, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load i64, i64* %wd2, align 8
  %sub = sub i64 0, %6
  store i64 %sub, i64* %wd2, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load i64, i64* %wd2, align 8
  %shr = ashr i64 %7, 7
  store i64 %shr, i64* %wd2, align 8
  %8 = load i32, i32* %plt.addr, align 4
  %conv4 = sext i32 %8 to i64
  %9 = load i32, i32* %plt2.addr, align 4
  %conv5 = sext i32 %9 to i64
  %mul6 = mul i64 %conv4, %conv5
  %cmp7 = icmp sge i64 %mul6, 0
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.end
  %10 = load i64, i64* %wd2, align 8
  %add = add i64 %10, 128
  store i64 %add, i64* %wd4, align 8
  br label %if.end10

if.else:                                          ; preds = %if.end
  %11 = load i64, i64* %wd2, align 8
  %sub9 = sub i64 %11, 128
  store i64 %sub9, i64* %wd4, align 8
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then8
  %12 = load i64, i64* %wd4, align 8
  %13 = load i32, i32* %al2.addr, align 4
  %conv11 = sext i32 %13 to i64
  %mul12 = mul i64 127, %conv11
  %shr13 = ashr i64 %mul12, 7
  %add14 = add i64 %12, %shr13
  %conv15 = trunc i64 %add14 to i32
  store i32 %conv15, i32* %apl2, align 4
  %14 = load i32, i32* %apl2, align 4
  %cmp16 = icmp sgt i32 %14, 12288
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end10
  store i32 12288, i32* %apl2, align 4
  br label %if.end18

if.end18:                                         ; preds = %if.then17, %if.end10
  %15 = load i32, i32* %apl2, align 4
  %cmp19 = icmp slt i32 %15, -12288
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.end18
  store i32 -12288, i32* %apl2, align 4
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %if.end18
  %16 = load i32, i32* %apl2, align 4
  %17 = bitcast i32* %apl2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #5
  %18 = bitcast i64* %wd4 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #5
  %19 = bitcast i64* %wd2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #5
  ret i32 %16
}

; Function Attrs: nounwind
define i32 @uppol1(i32 %al1, i32 %apl2, i32 %plt, i32 %plt1) #3 {
entry:
  %al1.addr = alloca i32, align 4
  %apl2.addr = alloca i32, align 4
  %plt.addr = alloca i32, align 4
  %plt1.addr = alloca i32, align 4
  %wd2 = alloca i64, align 8
  %wd3 = alloca i32, align 4
  %apl1 = alloca i32, align 4
  store i32 %al1, i32* %al1.addr, align 4
  store i32 %apl2, i32* %apl2.addr, align 4
  store i32 %plt, i32* %plt.addr, align 4
  store i32 %plt1, i32* %plt1.addr, align 4
  %0 = bitcast i64* %wd2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5
  %1 = bitcast i32* %wd3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = bitcast i32* %apl1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5
  %3 = load i32, i32* %al1.addr, align 4
  %conv = sext i32 %3 to i64
  %mul = mul i64 %conv, 255
  %shr = ashr i64 %mul, 8
  store i64 %shr, i64* %wd2, align 8
  %4 = load i32, i32* %plt.addr, align 4
  %conv1 = sext i32 %4 to i64
  %5 = load i32, i32* %plt1.addr, align 4
  %conv2 = sext i32 %5 to i64
  %mul3 = mul i64 %conv1, %conv2
  %cmp = icmp sge i64 %mul3, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %6 = load i64, i64* %wd2, align 8
  %conv4 = trunc i64 %6 to i32
  %add = add i32 %conv4, 192
  store i32 %add, i32* %apl1, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %7 = load i64, i64* %wd2, align 8
  %conv5 = trunc i64 %7 to i32
  %sub = sub i32 %conv5, 192
  store i32 %sub, i32* %apl1, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %8 = load i32, i32* %apl2.addr, align 4
  %sub6 = sub i32 15360, %8
  store i32 %sub6, i32* %wd3, align 4
  %9 = load i32, i32* %apl1, align 4
  %10 = load i32, i32* %wd3, align 4
  %cmp7 = icmp sgt i32 %9, %10
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  %11 = load i32, i32* %wd3, align 4
  store i32 %11, i32* %apl1, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end
  %12 = load i32, i32* %apl1, align 4
  %13 = load i32, i32* %wd3, align 4
  %sub10 = sub i32 0, %13
  %cmp11 = icmp slt i32 %12, %sub10
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.end9
  %14 = load i32, i32* %wd3, align 4
  %sub13 = sub i32 0, %14
  store i32 %sub13, i32* %apl1, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %if.end9
  %15 = load i32, i32* %apl1, align 4
  %16 = bitcast i32* %apl1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #5
  %17 = bitcast i32* %wd3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #5
  %18 = bitcast i64* %wd2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #5
  ret i32 %15
}

; Function Attrs: nounwind
define i32 @logsch(i32 %ih, i32 %nbh) #3 {
entry:
  %ih.addr = alloca i32, align 4
  %nbh.addr = alloca i32, align 4
  %wd = alloca i32, align 4
  store i32 %ih, i32* %ih.addr, align 4
  store i32 %nbh, i32* %nbh.addr, align 4
  %0 = bitcast i32* %wd to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = load i32, i32* %nbh.addr, align 4
  %conv = sext i32 %1 to i64
  %mul = mul i64 %conv, 127
  %shr = ashr i64 %mul, 7
  %conv1 = trunc i64 %shr to i32
  store i32 %conv1, i32* %wd, align 4
  %2 = load i32, i32* %wd, align 4
  %3 = load i32, i32* %ih.addr, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @wh_code_table, i64 0, i64 %idxprom
  %4 = load i32, i32* %arrayidx, align 4
  %add = add i32 %2, %4
  store i32 %add, i32* %nbh.addr, align 4
  %5 = load i32, i32* %nbh.addr, align 4
  %cmp = icmp slt i32 %5, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %nbh.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32, i32* %nbh.addr, align 4
  %cmp2 = icmp sgt i32 %6, 22528
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 22528, i32* %nbh.addr, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %7 = load i32, i32* %nbh.addr, align 4
  %8 = bitcast i32* %wd to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #5
  ret i32 %7
}

; Function Attrs: nounwind
define void @decode(i32 %input) #3 {
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
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i64* %xa1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #5
  %2 = bitcast i64* %xa2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #5
  %3 = bitcast i32** %h_ptr to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #5
  %4 = bitcast i32** %ac_ptr to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #5
  %5 = bitcast i32** %ac_ptr1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #5
  %6 = bitcast i32** %ad_ptr to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #5
  %7 = bitcast i32** %ad_ptr1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #5
  %8 = load i32, i32* %input.addr, align 4
  %and = and i32 %8, 63
  store i32 %and, i32* @ilr, align 4
  %9 = load i32, i32* %input.addr, align 4
  %shr = ashr i32 %9, 6
  store i32 %shr, i32* @ih, align 4
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0))
  store i32 %call, i32* @dec_szl, align 4
  %10 = load i32, i32* @dec_rlt1, align 4
  %11 = load i32, i32* @dec_al1, align 4
  %12 = load i32, i32* @dec_rlt2, align 4
  %13 = load i32, i32* @dec_al2, align 4
  %call1 = call i32 @filtep(i32 %10, i32 %11, i32 %12, i32 %13)
  store i32 %call1, i32* @dec_spl, align 4
  %14 = load i32, i32* @dec_spl, align 4
  %15 = load i32, i32* @dec_szl, align 4
  %add = add i32 %14, %15
  store i32 %add, i32* @dec_sl, align 4
  %16 = load i32, i32* @dec_detl, align 4
  %conv = sext i32 %16 to i64
  %17 = load i32, i32* @ilr, align 4
  %shr2 = ashr i32 %17, 2
  %idxprom = sext i32 %shr2 to i64
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i64 0, i64 %idxprom
  %18 = load i32, i32* %arrayidx, align 4
  %conv3 = sext i32 %18 to i64
  %mul = mul i64 %conv, %conv3
  %shr4 = ashr i64 %mul, 15
  %conv5 = trunc i64 %shr4 to i32
  store i32 %conv5, i32* @dec_dlt, align 4
  %19 = load i32, i32* @dec_detl, align 4
  %conv6 = sext i32 %19 to i64
  %20 = load i32, i32* @il, align 4
  %idxprom7 = sext i32 %20 to i64
  %arrayidx8 = getelementptr inbounds [64 x i32], [64 x i32]* @qq6_code6_table, i64 0, i64 %idxprom7
  %21 = load i32, i32* %arrayidx8, align 4
  %conv9 = sext i32 %21 to i64
  %mul10 = mul i64 %conv6, %conv9
  %shr11 = ashr i64 %mul10, 15
  %conv12 = trunc i64 %shr11 to i32
  store i32 %conv12, i32* @dl, align 4
  %22 = load i32, i32* @dl, align 4
  %23 = load i32, i32* @dec_sl, align 4
  %add13 = add i32 %22, %23
  store i32 %add13, i32* @rl, align 4
  %24 = load i32, i32* @ilr, align 4
  %25 = load i32, i32* @dec_nbl, align 4
  %call14 = call i32 @logscl(i32 %24, i32 %25)
  store i32 %call14, i32* @dec_nbl, align 4
  %26 = load i32, i32* @dec_nbl, align 4
  %call15 = call i32 @scalel(i32 %26, i32 8)
  store i32 %call15, i32* @dec_detl, align 4
  %27 = load i32, i32* @dec_dlt, align 4
  %28 = load i32, i32* @dec_szl, align 4
  %add16 = add i32 %27, %28
  store i32 %add16, i32* @dec_plt, align 4
  %29 = load i32, i32* @dec_dlt, align 4
  call void @upzero(i32 %29, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0))
  %30 = load i32, i32* @dec_al1, align 4
  %31 = load i32, i32* @dec_al2, align 4
  %32 = load i32, i32* @dec_plt, align 4
  %33 = load i32, i32* @dec_plt1, align 4
  %34 = load i32, i32* @dec_plt2, align 4
  %call17 = call i32 @uppol2(i32 %30, i32 %31, i32 %32, i32 %33, i32 %34)
  store i32 %call17, i32* @dec_al2, align 4
  %35 = load i32, i32* @dec_al1, align 4
  %36 = load i32, i32* @dec_al2, align 4
  %37 = load i32, i32* @dec_plt, align 4
  %38 = load i32, i32* @dec_plt1, align 4
  %call18 = call i32 @uppol1(i32 %35, i32 %36, i32 %37, i32 %38)
  store i32 %call18, i32* @dec_al1, align 4
  %39 = load i32, i32* @dec_sl, align 4
  %40 = load i32, i32* @dec_dlt, align 4
  %add19 = add i32 %39, %40
  store i32 %add19, i32* @dec_rlt, align 4
  %41 = load i32, i32* @dec_rlt1, align 4
  store i32 %41, i32* @dec_rlt2, align 4
  %42 = load i32, i32* @dec_rlt, align 4
  store i32 %42, i32* @dec_rlt1, align 4
  %43 = load i32, i32* @dec_plt1, align 4
  store i32 %43, i32* @dec_plt2, align 4
  %44 = load i32, i32* @dec_plt, align 4
  store i32 %44, i32* @dec_plt1, align 4
  %call20 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0))
  store i32 %call20, i32* @dec_szh, align 4
  %45 = load i32, i32* @dec_rh1, align 4
  %46 = load i32, i32* @dec_ah1, align 4
  %47 = load i32, i32* @dec_rh2, align 4
  %48 = load i32, i32* @dec_ah2, align 4
  %call21 = call i32 @filtep(i32 %45, i32 %46, i32 %47, i32 %48)
  store i32 %call21, i32* @dec_sph, align 4
  %49 = load i32, i32* @dec_sph, align 4
  %50 = load i32, i32* @dec_szh, align 4
  %add22 = add i32 %49, %50
  store i32 %add22, i32* @dec_sh, align 4
  %51 = load i32, i32* @dec_deth, align 4
  %conv23 = sext i32 %51 to i64
  %52 = load i32, i32* @ih, align 4
  %idxprom24 = sext i32 %52 to i64
  %arrayidx25 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i64 0, i64 %idxprom24
  %53 = load i32, i32* %arrayidx25, align 4
  %conv26 = sext i32 %53 to i64
  %mul27 = mul i64 %conv23, %conv26
  %shr28 = ashr i64 %mul27, 15
  %conv29 = trunc i64 %shr28 to i32
  store i32 %conv29, i32* @dec_dh, align 4
  %54 = load i32, i32* @ih, align 4
  %55 = load i32, i32* @dec_nbh, align 4
  %call30 = call i32 @logsch(i32 %54, i32 %55)
  store i32 %call30, i32* @dec_nbh, align 4
  %56 = load i32, i32* @dec_nbh, align 4
  %call31 = call i32 @scalel(i32 %56, i32 10)
  store i32 %call31, i32* @dec_deth, align 4
  %57 = load i32, i32* @dec_dh, align 4
  %58 = load i32, i32* @dec_szh, align 4
  %add32 = add i32 %57, %58
  store i32 %add32, i32* @dec_ph, align 4
  %59 = load i32, i32* @dec_dh, align 4
  call void @upzero(i32 %59, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0))
  %60 = load i32, i32* @dec_ah1, align 4
  %61 = load i32, i32* @dec_ah2, align 4
  %62 = load i32, i32* @dec_ph, align 4
  %63 = load i32, i32* @dec_ph1, align 4
  %64 = load i32, i32* @dec_ph2, align 4
  %call33 = call i32 @uppol2(i32 %60, i32 %61, i32 %62, i32 %63, i32 %64)
  store i32 %call33, i32* @dec_ah2, align 4
  %65 = load i32, i32* @dec_ah1, align 4
  %66 = load i32, i32* @dec_ah2, align 4
  %67 = load i32, i32* @dec_ph, align 4
  %68 = load i32, i32* @dec_ph1, align 4
  %call34 = call i32 @uppol1(i32 %65, i32 %66, i32 %67, i32 %68)
  store i32 %call34, i32* @dec_ah1, align 4
  %69 = load i32, i32* @dec_sh, align 4
  %70 = load i32, i32* @dec_dh, align 4
  %add35 = add i32 %69, %70
  store i32 %add35, i32* @rh, align 4
  %71 = load i32, i32* @dec_rh1, align 4
  store i32 %71, i32* @dec_rh2, align 4
  %72 = load i32, i32* @rh, align 4
  store i32 %72, i32* @dec_rh1, align 4
  %73 = load i32, i32* @dec_ph1, align 4
  store i32 %73, i32* @dec_ph2, align 4
  %74 = load i32, i32* @dec_ph, align 4
  store i32 %74, i32* @dec_ph1, align 4
  %75 = load i32, i32* @rl, align 4
  %76 = load i32, i32* @rh, align 4
  %sub = sub i32 %75, %76
  store i32 %sub, i32* @xd, align 4
  %77 = load i32, i32* @rl, align 4
  %78 = load i32, i32* @rh, align 4
  %add36 = add i32 %77, %78
  store i32 %add36, i32* @xs, align 4
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 8
  store i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 0), i32** %ac_ptr, align 8
  store i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 0), i32** %ad_ptr, align 8
  %79 = load i32, i32* @xd, align 4
  %conv37 = sext i32 %79 to i64
  %80 = load i32*, i32** %h_ptr, align 8
  %incdec.ptr = getelementptr inbounds i32, i32* %80, i32 1
  store i32* %incdec.ptr, i32** %h_ptr, align 8
  %81 = load i32, i32* %80, align 4
  %conv38 = sext i32 %81 to i64
  %mul39 = mul i64 %conv37, %conv38
  store i64 %mul39, i64* %xa1, align 8
  %82 = load i32, i32* @xs, align 4
  %conv40 = sext i32 %82 to i64
  %83 = load i32*, i32** %h_ptr, align 8
  %incdec.ptr41 = getelementptr inbounds i32, i32* %83, i32 1
  store i32* %incdec.ptr41, i32** %h_ptr, align 8
  %84 = load i32, i32* %83, align 4
  %conv42 = sext i32 %84 to i64
  %mul43 = mul i64 %conv40, %conv42
  store i64 %mul43, i64* %xa2, align 8
  br label %decode_label2

decode_label2:                                    ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %decode_label2
  %85 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %85, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %86 = load i32*, i32** %ac_ptr, align 8
  %incdec.ptr44 = getelementptr inbounds i32, i32* %86, i32 1
  store i32* %incdec.ptr44, i32** %ac_ptr, align 8
  %87 = load i32, i32* %86, align 4
  %conv45 = sext i32 %87 to i64
  %88 = load i32*, i32** %h_ptr, align 8
  %incdec.ptr46 = getelementptr inbounds i32, i32* %88, i32 1
  store i32* %incdec.ptr46, i32** %h_ptr, align 8
  %89 = load i32, i32* %88, align 4
  %conv47 = sext i32 %89 to i64
  %mul48 = mul i64 %conv45, %conv47
  %90 = load i64, i64* %xa1, align 8
  %add49 = add i64 %90, %mul48
  store i64 %add49, i64* %xa1, align 8
  %91 = load i32*, i32** %ad_ptr, align 8
  %incdec.ptr50 = getelementptr inbounds i32, i32* %91, i32 1
  store i32* %incdec.ptr50, i32** %ad_ptr, align 8
  %92 = load i32, i32* %91, align 4
  %conv51 = sext i32 %92 to i64
  %93 = load i32*, i32** %h_ptr, align 8
  %incdec.ptr52 = getelementptr inbounds i32, i32* %93, i32 1
  store i32* %incdec.ptr52, i32** %h_ptr, align 8
  %94 = load i32, i32* %93, align 4
  %conv53 = sext i32 %94 to i64
  %mul54 = mul i64 %conv51, %conv53
  %95 = load i64, i64* %xa2, align 8
  %add55 = add i64 %95, %mul54
  store i64 %add55, i64* %xa2, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %96 = load i32, i32* %i, align 4
  %inc = add i32 %96, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !16

for.end:                                          ; preds = %for.cond
  %97 = load i32*, i32** %ac_ptr, align 8
  %98 = load i32, i32* %97, align 4
  %conv56 = sext i32 %98 to i64
  %99 = load i32*, i32** %h_ptr, align 8
  %incdec.ptr57 = getelementptr inbounds i32, i32* %99, i32 1
  store i32* %incdec.ptr57, i32** %h_ptr, align 8
  %100 = load i32, i32* %99, align 4
  %conv58 = sext i32 %100 to i64
  %mul59 = mul i64 %conv56, %conv58
  %101 = load i64, i64* %xa1, align 8
  %add60 = add i64 %101, %mul59
  store i64 %add60, i64* %xa1, align 8
  %102 = load i32*, i32** %ad_ptr, align 8
  %103 = load i32, i32* %102, align 4
  %conv61 = sext i32 %103 to i64
  %104 = load i32*, i32** %h_ptr, align 8
  %incdec.ptr62 = getelementptr inbounds i32, i32* %104, i32 1
  store i32* %incdec.ptr62, i32** %h_ptr, align 8
  %105 = load i32, i32* %104, align 4
  %conv63 = sext i32 %105 to i64
  %mul64 = mul i64 %conv61, %conv63
  %106 = load i64, i64* %xa2, align 8
  %add65 = add i64 %106, %mul64
  store i64 %add65, i64* %xa2, align 8
  %107 = load i64, i64* %xa1, align 8
  %shr66 = ashr i64 %107, 14
  %conv67 = trunc i64 %shr66 to i32
  store i32 %conv67, i32* @xout1, align 4
  %108 = load i64, i64* %xa2, align 8
  %shr68 = ashr i64 %108, 14
  %conv69 = trunc i64 %shr68 to i32
  store i32 %conv69, i32* @xout2, align 4
  %109 = load i32*, i32** %ac_ptr, align 8
  %add.ptr = getelementptr inbounds i32, i32* %109, i64 -1
  store i32* %add.ptr, i32** %ac_ptr1, align 8
  %110 = load i32*, i32** %ad_ptr, align 8
  %add.ptr70 = getelementptr inbounds i32, i32* %110, i64 -1
  store i32* %add.ptr70, i32** %ad_ptr1, align 8
  br label %decode_label3

decode_label3:                                    ; preds = %for.end
  store i32 0, i32* %i, align 4
  br label %for.cond71

for.cond71:                                       ; preds = %for.inc78, %decode_label3
  %111 = load i32, i32* %i, align 4
  %cmp72 = icmp slt i32 %111, 10
  br i1 %cmp72, label %for.body73, label %for.end80

for.body73:                                       ; preds = %for.cond71
  %112 = load i32*, i32** %ac_ptr1, align 8
  %incdec.ptr74 = getelementptr inbounds i32, i32* %112, i32 -1
  store i32* %incdec.ptr74, i32** %ac_ptr1, align 8
  %113 = load i32, i32* %112, align 4
  %114 = load i32*, i32** %ac_ptr, align 8
  %incdec.ptr75 = getelementptr inbounds i32, i32* %114, i32 -1
  store i32* %incdec.ptr75, i32** %ac_ptr, align 8
  store i32 %113, i32* %114, align 4
  %115 = load i32*, i32** %ad_ptr1, align 8
  %incdec.ptr76 = getelementptr inbounds i32, i32* %115, i32 -1
  store i32* %incdec.ptr76, i32** %ad_ptr1, align 8
  %116 = load i32, i32* %115, align 4
  %117 = load i32*, i32** %ad_ptr, align 8
  %incdec.ptr77 = getelementptr inbounds i32, i32* %117, i32 -1
  store i32* %incdec.ptr77, i32** %ad_ptr, align 8
  store i32 %116, i32* %117, align 4
  br label %for.inc78

for.inc78:                                        ; preds = %for.body73
  %118 = load i32, i32* %i, align 4
  %inc79 = add i32 %118, 1
  store i32 %inc79, i32* %i, align 4
  br label %for.cond71, !llvm.loop !18

for.end80:                                        ; preds = %for.cond71
  %119 = load i32, i32* @xd, align 4
  %120 = load i32*, i32** %ac_ptr, align 8
  store i32 %119, i32* %120, align 4
  %121 = load i32, i32* @xs, align 4
  %122 = load i32*, i32** %ad_ptr, align 8
  store i32 %121, i32* %122, align 4
  %123 = bitcast i32** %ad_ptr1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %123) #5
  %124 = bitcast i32** %ad_ptr to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %124) #5
  %125 = bitcast i32** %ac_ptr1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %125) #5
  %126 = bitcast i32** %ac_ptr to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %126) #5
  %127 = bitcast i32** %h_ptr to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %127) #5
  %128 = bitcast i64* %xa2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %128) #5
  %129 = bitcast i64* %xa1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %129) #5
  %130 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %130) #5
  ret void
}

; Function Attrs: nounwind
define void @reset() #3 {
entry:
  %i = alloca i32, align 4
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  store i32 32, i32* @dec_detl, align 4
  store i32 32, i32* @detl, align 4
  store i32 8, i32* @dec_deth, align 4
  store i32 8, i32* @deth, align 4
  store i32 0, i32* @rlt2, align 4
  store i32 0, i32* @rlt1, align 4
  store i32 0, i32* @plt2, align 4
  store i32 0, i32* @plt1, align 4
  store i32 0, i32* @al2, align 4
  store i32 0, i32* @al1, align 4
  store i32 0, i32* @nbl, align 4
  store i32 0, i32* @rh2, align 4
  store i32 0, i32* @rh1, align 4
  store i32 0, i32* @ph2, align 4
  store i32 0, i32* @ph1, align 4
  store i32 0, i32* @ah2, align 4
  store i32 0, i32* @ah1, align 4
  store i32 0, i32* @nbh, align 4
  store i32 0, i32* @dec_rlt2, align 4
  store i32 0, i32* @dec_rlt1, align 4
  store i32 0, i32* @dec_plt2, align 4
  store i32 0, i32* @dec_plt1, align 4
  store i32 0, i32* @dec_al2, align 4
  store i32 0, i32* @dec_al1, align 4
  store i32 0, i32* @dec_nbl, align 4
  store i32 0, i32* @dec_rh2, align 4
  store i32 0, i32* @dec_rh1, align 4
  store i32 0, i32* @dec_ph2, align 4
  store i32 0, i32* @dec_ph1, align 4
  store i32 0, i32* @dec_ah2, align 4
  store i32 0, i32* @dec_ah1, align 4
  store i32 0, i32* @dec_nbh, align 4
  br label %reset_label4

reset_label4:                                     ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %reset_label4
  %1 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %1, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dltx, i64 0, i64 %idxprom
  store i32 0, i32* %arrayidx, align 4
  %3 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %3 to i64
  %arrayidx2 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dhx, i64 0, i64 %idxprom1
  store i32 0, i32* %arrayidx2, align 4
  %4 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %4 to i64
  %arrayidx4 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dltx, i64 0, i64 %idxprom3
  store i32 0, i32* %arrayidx4, align 4
  %5 = load i32, i32* %i, align 4
  %idxprom5 = sext i32 %5 to i64
  %arrayidx6 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dhx, i64 0, i64 %idxprom5
  store i32 0, i32* %arrayidx6, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !20

for.end:                                          ; preds = %for.cond
  br label %reset_label5

reset_label5:                                     ; preds = %for.end
  store i32 0, i32* %i, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc18, %reset_label5
  %7 = load i32, i32* %i, align 4
  %cmp8 = icmp slt i32 %7, 6
  br i1 %cmp8, label %for.body9, label %for.end20

for.body9:                                        ; preds = %for.cond7
  %8 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %8 to i64
  %arrayidx11 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bpl, i64 0, i64 %idxprom10
  store i32 0, i32* %arrayidx11, align 4
  %9 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %9 to i64
  %arrayidx13 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bph, i64 0, i64 %idxprom12
  store i32 0, i32* %arrayidx13, align 4
  %10 = load i32, i32* %i, align 4
  %idxprom14 = sext i32 %10 to i64
  %arrayidx15 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bpl, i64 0, i64 %idxprom14
  store i32 0, i32* %arrayidx15, align 4
  %11 = load i32, i32* %i, align 4
  %idxprom16 = sext i32 %11 to i64
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bph, i64 0, i64 %idxprom16
  store i32 0, i32* %arrayidx17, align 4
  br label %for.inc18

for.inc18:                                        ; preds = %for.body9
  %12 = load i32, i32* %i, align 4
  %inc19 = add i32 %12, 1
  store i32 %inc19, i32* %i, align 4
  br label %for.cond7, !llvm.loop !22

for.end20:                                        ; preds = %for.cond7
  br label %reset_label6

reset_label6:                                     ; preds = %for.end20
  store i32 0, i32* %i, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc26, %reset_label6
  %13 = load i32, i32* %i, align 4
  %cmp22 = icmp slt i32 %13, 24
  br i1 %cmp22, label %for.body23, label %for.end28

for.body23:                                       ; preds = %for.cond21
  %14 = load i32, i32* %i, align 4
  %idxprom24 = sext i32 %14 to i64
  %arrayidx25 = getelementptr inbounds [24 x i32], [24 x i32]* @tqmf, i64 0, i64 %idxprom24
  store i32 0, i32* %arrayidx25, align 4
  br label %for.inc26

for.inc26:                                        ; preds = %for.body23
  %15 = load i32, i32* %i, align 4
  %inc27 = add i32 %15, 1
  store i32 %inc27, i32* %i, align 4
  br label %for.cond21, !llvm.loop !24

for.end28:                                        ; preds = %for.cond21
  br label %reset_label7

reset_label7:                                     ; preds = %for.end28
  store i32 0, i32* %i, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc36, %reset_label7
  %16 = load i32, i32* %i, align 4
  %cmp30 = icmp slt i32 %16, 11
  br i1 %cmp30, label %for.body31, label %for.end38

for.body31:                                       ; preds = %for.cond29
  %17 = load i32, i32* %i, align 4
  %idxprom32 = sext i32 %17 to i64
  %arrayidx33 = getelementptr inbounds [11 x i32], [11 x i32]* @accumc, i64 0, i64 %idxprom32
  store i32 0, i32* %arrayidx33, align 4
  %18 = load i32, i32* %i, align 4
  %idxprom34 = sext i32 %18 to i64
  %arrayidx35 = getelementptr inbounds [11 x i32], [11 x i32]* @accumd, i64 0, i64 %idxprom34
  store i32 0, i32* %arrayidx35, align 4
  br label %for.inc36

for.inc36:                                        ; preds = %for.body31
  %19 = load i32, i32* %i, align 4
  %inc37 = add i32 %19, 1
  store i32 %inc37, i32* %i, align 4
  br label %for.cond29, !llvm.loop !26

for.end38:                                        ; preds = %for.cond29
  %20 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #5
  ret void
}

; Function Attrs: nounwind
define void @adpcm_main(i32* "fpga.decayed.dim.hint"="8000" %input_samples, i32* "fpga.decayed.dim.hint"="4000" %compressed, i32* "fpga.decayed.dim.hint"="8000" %result) #4 !fpga.function.pragma !28 {
entry:
  %input_samples.addr = alloca i32*, align 8
  %compressed.addr = alloca i32*, align 8
  %result.addr = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* %input_samples, i32** %input_samples.addr, align 8
  store i32* %compressed, i32** %compressed.addr, align 8
  store i32* %result, i32** %result.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  call void @reset()
  store i32 10, i32* %j, align 4
  br label %adpcm_main_label12

adpcm_main_label12:                               ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %adpcm_main_label12
  %2 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %2, 8000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %input_samples.addr, align 8
  %4 = load i32, i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom
  %5 = load i32, i32* %arrayidx, align 4
  %6 = load i32*, i32** %input_samples.addr, align 8
  %7 = load i32, i32* %i, align 4
  %add = add i32 %7, 1
  %idxprom1 = sext i32 %add to i64
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %idxprom1
  %8 = load i32, i32* %arrayidx2, align 4
  %call = call i32 @encode(i32 %5, i32 %8)
  %9 = load i32*, i32** %compressed.addr, align 8
  %10 = load i32, i32* %i, align 4
  %div = sdiv i32 %10, 2
  %idxprom3 = sext i32 %div to i64
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %idxprom3
  store i32 %call, i32* %arrayidx4, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4
  %add5 = add i32 %11, 2
  store i32 %add5, i32* %i, align 4
  br label %for.cond, !llvm.loop !30

for.end:                                          ; preds = %for.cond
  br label %adpcm_main_label13

adpcm_main_label13:                               ; preds = %for.end
  store i32 0, i32* %i, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc17, %adpcm_main_label13
  %12 = load i32, i32* %i, align 4
  %cmp7 = icmp slt i32 %12, 8000
  br i1 %cmp7, label %for.body8, label %for.end19

for.body8:                                        ; preds = %for.cond6
  %13 = load i32*, i32** %compressed.addr, align 8
  %14 = load i32, i32* %i, align 4
  %div9 = sdiv i32 %14, 2
  %idxprom10 = sext i32 %div9 to i64
  %arrayidx11 = getelementptr inbounds i32, i32* %13, i64 %idxprom10
  %15 = load i32, i32* %arrayidx11, align 4
  call void @decode(i32 %15)
  %16 = load i32, i32* @xout1, align 4
  %17 = load i32*, i32** %result.addr, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %18 to i64
  %arrayidx13 = getelementptr inbounds i32, i32* %17, i64 %idxprom12
  store i32 %16, i32* %arrayidx13, align 4
  %19 = load i32, i32* @xout2, align 4
  %20 = load i32*, i32** %result.addr, align 8
  %21 = load i32, i32* %i, align 4
  %add14 = add i32 %21, 1
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds i32, i32* %20, i64 %idxprom15
  store i32 %19, i32* %arrayidx16, align 4
  br label %for.inc17

for.inc17:                                        ; preds = %for.body8
  %22 = load i32, i32* %i, align 4
  %add18 = add i32 %22, 2
  store i32 %add18, i32* %i, align 4
  br label %for.cond6, !llvm.loop !32

for.end19:                                        ; preds = %for.cond6
  %23 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %23) #5
  %24 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %24) #5
  ret void
}

attributes #0 = { nounwind readnone willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.top.func"="adpcm_main" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readnone willreturn }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.name", !"encode_label0"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.name", !"encode_label1"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.name", !"filtez_label8"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.name", !"quantl_label9"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.name", !"upzero_label10"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.name", !"upzero_label11"}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.name", !"decode_label2"}
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.name", !"decode_label3"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.name", !"reset_label4"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.name", !"reset_label5"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.name", !"reset_label6"}
!26 = distinct !{!26, !27}
!27 = !{!"llvm.loop.name", !"reset_label7"}
!28 = !{!29}
!29 = !{!"fpga.top", !"user"}
!30 = distinct !{!30, !31}
!31 = !{!"llvm.loop.name", !"adpcm_main_label12"}
!32 = distinct !{!32, !33}
!33 = !{!"llvm.loop.name", !"adpcm_main_label13"}
