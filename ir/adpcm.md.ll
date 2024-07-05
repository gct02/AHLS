; ModuleID = 'adpcm.md.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@test_data = common global [8000 x i32] zeroinitializer, align 16
@compressed = common global [4000 x i32] zeroinitializer, align 16
@result = common global [8000 x i32] zeroinitializer, align 16
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

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4, !opID !5, !opSignedness !6
  %argc.addr = alloca i32, align 4, !opID !7, !opSignedness !6
  %argv.addr = alloca i8**, align 8, !opID !8, !opSignedness !6
  store i32 0, i32* %retval, align 4, !opID !9, !opSignedness !6
  store i32 %argc, i32* %argc.addr, align 4, !opID !10, !opSignedness !6
  store i8** %argv, i8*** %argv.addr, align 8, !opID !11, !opSignedness !6
  %0 = load i8**, i8*** %argv.addr, align 8, !opID !12, !opSignedness !6
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !opID !13, !opSignedness !6
  %1 = load i8*, i8** %arrayidx, align 8, !opID !14, !opSignedness !6
  call void @populateInput(i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @test_data, i32 0, i32 0), i32 8000, i8* %1), !opID !15, !opSignedness !6
  call void @adpcm_main(i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @test_data, i32 0, i32 0), i32* getelementptr inbounds ([4000 x i32], [4000 x i32]* @compressed, i32 0, i32 0), i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @result, i32 0, i32 0)), !opID !16, !opSignedness !6
  %2 = load i8**, i8*** %argv.addr, align 8, !opID !17, !opSignedness !6
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2, !opID !18, !opSignedness !6
  %3 = load i8*, i8** %arrayidx1, align 8, !opID !19, !opSignedness !6
  call void @populateOutput(i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @result, i32 0, i32 0), i32 4000, i8* %3), !opID !20, !opSignedness !6
  ret i32 0, !opID !21, !opSignedness !6
}

declare void @populateInput(i32*, i32, i8*) #1

declare void @populateOutput(i32*, i32, i8*) #1

; Function Attrs: nounwind readnone willreturn
define i32 @abs(i32 %n) #2 {
entry:
  %n.addr = alloca i32, align 4, !opID !22, !opSignedness !6
  %m = alloca i32, align 4, !opID !23, !opSignedness !6
  store i32 %n, i32* %n.addr, align 4, !opID !24, !opSignedness !6
  %0 = bitcast i32* %m to i8*, !opID !25, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !26, !opSignedness !6
  %1 = load i32, i32* %n.addr, align 4, !opID !27, !opSignedness !6
  %cmp = icmp sge i32 %1, 0, !opID !28, !opSignedness !6
  br i1 %cmp, label %if.then, label %if.else, !opID !29, !opSignedness !6

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4, !opID !30, !opSignedness !6
  store i32 %2, i32* %m, align 4, !opID !31, !opSignedness !6
  br label %if.end, !opID !32, !opSignedness !6

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %n.addr, align 4, !opID !33, !opSignedness !6
  %sub = sub i32 0, %3, !opID !34, !opSignedness !6
  store i32 %sub, i32* %m, align 4, !opID !35, !opSignedness !6
  br label %if.end, !opID !36, !opSignedness !6

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %m, align 4, !opID !37, !opSignedness !6
  %5 = bitcast i32* %m to i8*, !opID !38, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %5) #6, !opID !39, !opSignedness !6
  ret i32 %4, !opID !40, !opSignedness !6
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #3

; Function Attrs: nounwind
define i32 @encode(i32 %xin1, i32 %xin2) #4 {
entry:
  %xin1.addr = alloca i32, align 4, !opID !41, !opSignedness !6
  %xin2.addr = alloca i32, align 4, !opID !42, !opSignedness !6
  %i = alloca i32, align 4, !opID !43, !opSignedness !6
  %h_ptr = alloca i32*, align 8, !opID !44, !opSignedness !6
  %tqmf_ptr = alloca i32*, align 8, !opID !45, !opSignedness !6
  %tqmf_ptr1 = alloca i32*, align 8, !opID !46, !opSignedness !6
  %xa = alloca i64, align 8, !opID !47, !opSignedness !6
  %xb = alloca i64, align 8, !opID !48, !opSignedness !6
  %decis = alloca i32, align 4, !opID !49, !opSignedness !6
  store i32 %xin1, i32* %xin1.addr, align 4, !opID !50, !opSignedness !6
  store i32 %xin2, i32* %xin2.addr, align 4, !opID !51, !opSignedness !6
  %0 = bitcast i32* %i to i8*, !opID !52, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !53, !opSignedness !6
  %1 = bitcast i32** %h_ptr to i8*, !opID !54, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #6, !opID !55, !opSignedness !6
  %2 = bitcast i32** %tqmf_ptr to i8*, !opID !56, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #6, !opID !57, !opSignedness !6
  %3 = bitcast i32** %tqmf_ptr1 to i8*, !opID !58, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #6, !opID !59, !opSignedness !6
  %4 = bitcast i64* %xa to i8*, !opID !60, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #6, !opID !61, !opSignedness !6
  %5 = bitcast i64* %xb to i8*, !opID !62, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #6, !opID !63, !opSignedness !6
  %6 = bitcast i32* %decis to i8*, !opID !64, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #6, !opID !65, !opSignedness !6
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 8, !opID !66, !opSignedness !6
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 0), i32** %tqmf_ptr, align 8, !opID !67, !opSignedness !6
  %7 = load i32*, i32** %tqmf_ptr, align 8, !opID !68, !opSignedness !6
  %incdec.ptr = getelementptr inbounds i32, i32* %7, i32 1, !opID !69, !opSignedness !6
  store i32* %incdec.ptr, i32** %tqmf_ptr, align 8, !opID !70, !opSignedness !6
  %8 = load i32, i32* %7, align 4, !opID !71, !opSignedness !6
  %conv = sext i32 %8 to i64, !opID !72, !opSignedness !6
  %9 = load i32*, i32** %h_ptr, align 8, !opID !73, !opSignedness !6
  %incdec.ptr1 = getelementptr inbounds i32, i32* %9, i32 1, !opID !74, !opSignedness !6
  store i32* %incdec.ptr1, i32** %h_ptr, align 8, !opID !75, !opSignedness !6
  %10 = load i32, i32* %9, align 4, !opID !76, !opSignedness !6
  %conv2 = sext i32 %10 to i64, !opID !77, !opSignedness !6
  %mul = mul i64 %conv, %conv2, !opID !78, !opSignedness !6
  store i64 %mul, i64* %xa, align 8, !opID !79, !opSignedness !6
  %11 = load i32*, i32** %tqmf_ptr, align 8, !opID !80, !opSignedness !6
  %incdec.ptr3 = getelementptr inbounds i32, i32* %11, i32 1, !opID !81, !opSignedness !6
  store i32* %incdec.ptr3, i32** %tqmf_ptr, align 8, !opID !82, !opSignedness !6
  %12 = load i32, i32* %11, align 4, !opID !83, !opSignedness !6
  %conv4 = sext i32 %12 to i64, !opID !84, !opSignedness !6
  %13 = load i32*, i32** %h_ptr, align 8, !opID !85, !opSignedness !6
  %incdec.ptr5 = getelementptr inbounds i32, i32* %13, i32 1, !opID !86, !opSignedness !6
  store i32* %incdec.ptr5, i32** %h_ptr, align 8, !opID !87, !opSignedness !6
  %14 = load i32, i32* %13, align 4, !opID !88, !opSignedness !6
  %conv6 = sext i32 %14 to i64, !opID !89, !opSignedness !6
  %mul7 = mul i64 %conv4, %conv6, !opID !90, !opSignedness !6
  store i64 %mul7, i64* %xb, align 8, !opID !91, !opSignedness !6
  br label %encode_label0, !opID !92, !opSignedness !6

encode_label0:                                    ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !93, !opSignedness !6
  br label %for.cond, !opID !94, !opSignedness !6

for.cond:                                         ; preds = %for.inc, %encode_label0
  %15 = load i32, i32* %i, align 4, !opID !95, !opSignedness !6
  %cmp = icmp slt i32 %15, 10, !opID !96, !opSignedness !6
  br i1 %cmp, label %for.body, label %for.end, !opID !97, !opSignedness !6

for.body:                                         ; preds = %for.cond
  %16 = load i32*, i32** %tqmf_ptr, align 8, !opID !98, !opSignedness !6
  %incdec.ptr8 = getelementptr inbounds i32, i32* %16, i32 1, !opID !99, !opSignedness !6
  store i32* %incdec.ptr8, i32** %tqmf_ptr, align 8, !opID !100, !opSignedness !6
  %17 = load i32, i32* %16, align 4, !opID !101, !opSignedness !6
  %conv9 = sext i32 %17 to i64, !opID !102, !opSignedness !6
  %18 = load i32*, i32** %h_ptr, align 8, !opID !103, !opSignedness !6
  %incdec.ptr10 = getelementptr inbounds i32, i32* %18, i32 1, !opID !104, !opSignedness !6
  store i32* %incdec.ptr10, i32** %h_ptr, align 8, !opID !105, !opSignedness !6
  %19 = load i32, i32* %18, align 4, !opID !106, !opSignedness !6
  %conv11 = sext i32 %19 to i64, !opID !107, !opSignedness !6
  %mul12 = mul i64 %conv9, %conv11, !opID !108, !opSignedness !6
  %20 = load i64, i64* %xa, align 8, !opID !109, !opSignedness !6
  %add = add i64 %20, %mul12, !opID !110, !opSignedness !6
  store i64 %add, i64* %xa, align 8, !opID !111, !opSignedness !6
  %21 = load i32*, i32** %tqmf_ptr, align 8, !opID !112, !opSignedness !6
  %incdec.ptr13 = getelementptr inbounds i32, i32* %21, i32 1, !opID !113, !opSignedness !6
  store i32* %incdec.ptr13, i32** %tqmf_ptr, align 8, !opID !114, !opSignedness !6
  %22 = load i32, i32* %21, align 4, !opID !115, !opSignedness !6
  %conv14 = sext i32 %22 to i64, !opID !116, !opSignedness !6
  %23 = load i32*, i32** %h_ptr, align 8, !opID !117, !opSignedness !6
  %incdec.ptr15 = getelementptr inbounds i32, i32* %23, i32 1, !opID !118, !opSignedness !6
  store i32* %incdec.ptr15, i32** %h_ptr, align 8, !opID !119, !opSignedness !6
  %24 = load i32, i32* %23, align 4, !opID !120, !opSignedness !6
  %conv16 = sext i32 %24 to i64, !opID !121, !opSignedness !6
  %mul17 = mul i64 %conv14, %conv16, !opID !122, !opSignedness !6
  %25 = load i64, i64* %xb, align 8, !opID !123, !opSignedness !6
  %add18 = add i64 %25, %mul17, !opID !124, !opSignedness !6
  store i64 %add18, i64* %xb, align 8, !opID !125, !opSignedness !6
  br label %for.inc, !opID !126, !opSignedness !6

for.inc:                                          ; preds = %for.body
  %26 = load i32, i32* %i, align 4, !opID !127, !opSignedness !6
  %inc = add i32 %26, 1, !opID !128, !opSignedness !6
  store i32 %inc, i32* %i, align 4, !opID !129, !opSignedness !6
  br label %for.cond, !llvm.loop !130, !opID !132, !opSignedness !6

for.end:                                          ; preds = %for.cond
  %27 = load i32*, i32** %tqmf_ptr, align 8, !opID !133, !opSignedness !6
  %incdec.ptr19 = getelementptr inbounds i32, i32* %27, i32 1, !opID !134, !opSignedness !6
  store i32* %incdec.ptr19, i32** %tqmf_ptr, align 8, !opID !135, !opSignedness !6
  %28 = load i32, i32* %27, align 4, !opID !136, !opSignedness !6
  %conv20 = sext i32 %28 to i64, !opID !137, !opSignedness !6
  %29 = load i32*, i32** %h_ptr, align 8, !opID !138, !opSignedness !6
  %incdec.ptr21 = getelementptr inbounds i32, i32* %29, i32 1, !opID !139, !opSignedness !6
  store i32* %incdec.ptr21, i32** %h_ptr, align 8, !opID !140, !opSignedness !6
  %30 = load i32, i32* %29, align 4, !opID !141, !opSignedness !6
  %conv22 = sext i32 %30 to i64, !opID !142, !opSignedness !6
  %mul23 = mul i64 %conv20, %conv22, !opID !143, !opSignedness !6
  %31 = load i64, i64* %xa, align 8, !opID !144, !opSignedness !6
  %add24 = add i64 %31, %mul23, !opID !145, !opSignedness !6
  store i64 %add24, i64* %xa, align 8, !opID !146, !opSignedness !6
  %32 = load i32*, i32** %tqmf_ptr, align 8, !opID !147, !opSignedness !6
  %33 = load i32, i32* %32, align 4, !opID !148, !opSignedness !6
  %conv25 = sext i32 %33 to i64, !opID !149, !opSignedness !6
  %34 = load i32*, i32** %h_ptr, align 8, !opID !150, !opSignedness !6
  %incdec.ptr26 = getelementptr inbounds i32, i32* %34, i32 1, !opID !151, !opSignedness !6
  store i32* %incdec.ptr26, i32** %h_ptr, align 8, !opID !152, !opSignedness !6
  %35 = load i32, i32* %34, align 4, !opID !153, !opSignedness !6
  %conv27 = sext i32 %35 to i64, !opID !154, !opSignedness !6
  %mul28 = mul i64 %conv25, %conv27, !opID !155, !opSignedness !6
  %36 = load i64, i64* %xb, align 8, !opID !156, !opSignedness !6
  %add29 = add i64 %36, %mul28, !opID !157, !opSignedness !6
  store i64 %add29, i64* %xb, align 8, !opID !158, !opSignedness !6
  %37 = load i32*, i32** %tqmf_ptr, align 8, !opID !159, !opSignedness !6
  %add.ptr = getelementptr inbounds i32, i32* %37, i64 -2, !opID !160, !opSignedness !6
  store i32* %add.ptr, i32** %tqmf_ptr1, align 8, !opID !161, !opSignedness !6
  br label %encode_label1, !opID !162, !opSignedness !6

encode_label1:                                    ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !163, !opSignedness !6
  br label %for.cond30, !opID !164, !opSignedness !6

for.cond30:                                       ; preds = %for.inc35, %encode_label1
  %38 = load i32, i32* %i, align 4, !opID !165, !opSignedness !6
  %cmp31 = icmp slt i32 %38, 22, !opID !166, !opSignedness !6
  br i1 %cmp31, label %for.body32, label %for.end37, !opID !167, !opSignedness !6

for.body32:                                       ; preds = %for.cond30
  %39 = load i32*, i32** %tqmf_ptr1, align 8, !opID !168, !opSignedness !6
  %incdec.ptr33 = getelementptr inbounds i32, i32* %39, i32 -1, !opID !169, !opSignedness !6
  store i32* %incdec.ptr33, i32** %tqmf_ptr1, align 8, !opID !170, !opSignedness !6
  %40 = load i32, i32* %39, align 4, !opID !171, !opSignedness !6
  %41 = load i32*, i32** %tqmf_ptr, align 8, !opID !172, !opSignedness !6
  %incdec.ptr34 = getelementptr inbounds i32, i32* %41, i32 -1, !opID !173, !opSignedness !6
  store i32* %incdec.ptr34, i32** %tqmf_ptr, align 8, !opID !174, !opSignedness !6
  store i32 %40, i32* %41, align 4, !opID !175, !opSignedness !6
  br label %for.inc35, !opID !176, !opSignedness !6

for.inc35:                                        ; preds = %for.body32
  %42 = load i32, i32* %i, align 4, !opID !177, !opSignedness !6
  %inc36 = add i32 %42, 1, !opID !178, !opSignedness !6
  store i32 %inc36, i32* %i, align 4, !opID !179, !opSignedness !6
  br label %for.cond30, !llvm.loop !180, !opID !182, !opSignedness !6

for.end37:                                        ; preds = %for.cond30
  %43 = load i32, i32* %xin1.addr, align 4, !opID !183, !opSignedness !6
  %44 = load i32*, i32** %tqmf_ptr, align 8, !opID !184, !opSignedness !6
  %incdec.ptr38 = getelementptr inbounds i32, i32* %44, i32 -1, !opID !185, !opSignedness !6
  store i32* %incdec.ptr38, i32** %tqmf_ptr, align 8, !opID !186, !opSignedness !6
  store i32 %43, i32* %44, align 4, !opID !187, !opSignedness !6
  %45 = load i32, i32* %xin2.addr, align 4, !opID !188, !opSignedness !6
  %46 = load i32*, i32** %tqmf_ptr, align 8, !opID !189, !opSignedness !6
  store i32 %45, i32* %46, align 4, !opID !190, !opSignedness !6
  %47 = load i64, i64* %xa, align 8, !opID !191, !opSignedness !6
  %48 = load i64, i64* %xb, align 8, !opID !192, !opSignedness !6
  %add39 = add i64 %47, %48, !opID !193, !opSignedness !6
  %shr = ashr i64 %add39, 15, !opID !194, !opSignedness !6
  %conv40 = trunc i64 %shr to i32, !opID !195, !opSignedness !6
  store i32 %conv40, i32* @xl, align 4, !opID !196, !opSignedness !6
  %49 = load i64, i64* %xa, align 8, !opID !197, !opSignedness !6
  %50 = load i64, i64* %xb, align 8, !opID !198, !opSignedness !6
  %sub = sub i64 %49, %50, !opID !199, !opSignedness !6
  %shr41 = ashr i64 %sub, 15, !opID !200, !opSignedness !6
  %conv42 = trunc i64 %shr41 to i32, !opID !201, !opSignedness !6
  store i32 %conv42, i32* @xh, align 4, !opID !202, !opSignedness !6
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0)), !opID !203, !opSignedness !6
  store i32 %call, i32* @szl, align 4, !opID !204, !opSignedness !6
  %51 = load i32, i32* @rlt1, align 4, !opID !205, !opSignedness !6
  %52 = load i32, i32* @al1, align 4, !opID !206, !opSignedness !6
  %53 = load i32, i32* @rlt2, align 4, !opID !207, !opSignedness !6
  %54 = load i32, i32* @al2, align 4, !opID !208, !opSignedness !6
  %call43 = call i32 @filtep(i32 %51, i32 %52, i32 %53, i32 %54), !opID !209, !opSignedness !6
  store i32 %call43, i32* @spl, align 4, !opID !210, !opSignedness !6
  %55 = load i32, i32* @szl, align 4, !opID !211, !opSignedness !6
  %56 = load i32, i32* @spl, align 4, !opID !212, !opSignedness !6
  %add44 = add i32 %55, %56, !opID !213, !opSignedness !6
  store i32 %add44, i32* @sl, align 4, !opID !214, !opSignedness !6
  %57 = load i32, i32* @xl, align 4, !opID !215, !opSignedness !6
  %58 = load i32, i32* @sl, align 4, !opID !216, !opSignedness !6
  %sub45 = sub i32 %57, %58, !opID !217, !opSignedness !6
  store i32 %sub45, i32* @el, align 4, !opID !218, !opSignedness !6
  %59 = load i32, i32* @el, align 4, !opID !219, !opSignedness !6
  %60 = load i32, i32* @detl, align 4, !opID !220, !opSignedness !6
  %call46 = call i32 @quantl(i32 %59, i32 %60), !opID !221, !opSignedness !6
  store i32 %call46, i32* @il, align 4, !opID !222, !opSignedness !6
  %61 = load i32, i32* @detl, align 4, !opID !223, !opSignedness !6
  %conv47 = sext i32 %61 to i64, !opID !224, !opSignedness !6
  %62 = load i32, i32* @il, align 4, !opID !225, !opSignedness !6
  %shr48 = ashr i32 %62, 2, !opID !226, !opSignedness !6
  %idxprom = sext i32 %shr48 to i64, !opID !227, !opSignedness !6
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i64 0, i64 %idxprom, !opID !228, !opSignedness !6
  %63 = load i32, i32* %arrayidx, align 4, !opID !229, !opSignedness !6
  %conv49 = sext i32 %63 to i64, !opID !230, !opSignedness !6
  %mul50 = mul i64 %conv47, %conv49, !opID !231, !opSignedness !6
  %shr51 = ashr i64 %mul50, 15, !opID !232, !opSignedness !6
  %conv52 = trunc i64 %shr51 to i32, !opID !233, !opSignedness !6
  store i32 %conv52, i32* @dlt, align 4, !opID !234, !opSignedness !6
  %64 = load i32, i32* @il, align 4, !opID !235, !opSignedness !6
  %65 = load i32, i32* @nbl, align 4, !opID !236, !opSignedness !6
  %call53 = call i32 @logscl(i32 %64, i32 %65), !opID !237, !opSignedness !6
  store i32 %call53, i32* @nbl, align 4, !opID !238, !opSignedness !6
  %66 = load i32, i32* @nbl, align 4, !opID !239, !opSignedness !6
  %call54 = call i32 @scalel(i32 %66, i32 8), !opID !240, !opSignedness !6
  store i32 %call54, i32* @detl, align 4, !opID !241, !opSignedness !6
  %67 = load i32, i32* @dlt, align 4, !opID !242, !opSignedness !6
  %68 = load i32, i32* @szl, align 4, !opID !243, !opSignedness !6
  %add55 = add i32 %67, %68, !opID !244, !opSignedness !6
  store i32 %add55, i32* @plt, align 4, !opID !245, !opSignedness !6
  %69 = load i32, i32* @dlt, align 4, !opID !246, !opSignedness !6
  call void @upzero(i32 %69, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0)), !opID !247, !opSignedness !6
  %70 = load i32, i32* @al1, align 4, !opID !248, !opSignedness !6
  %71 = load i32, i32* @al2, align 4, !opID !249, !opSignedness !6
  %72 = load i32, i32* @plt, align 4, !opID !250, !opSignedness !6
  %73 = load i32, i32* @plt1, align 4, !opID !251, !opSignedness !6
  %74 = load i32, i32* @plt2, align 4, !opID !252, !opSignedness !6
  %call56 = call i32 @uppol2(i32 %70, i32 %71, i32 %72, i32 %73, i32 %74), !opID !253, !opSignedness !6
  store i32 %call56, i32* @al2, align 4, !opID !254, !opSignedness !6
  %75 = load i32, i32* @al1, align 4, !opID !255, !opSignedness !6
  %76 = load i32, i32* @al2, align 4, !opID !256, !opSignedness !6
  %77 = load i32, i32* @plt, align 4, !opID !257, !opSignedness !6
  %78 = load i32, i32* @plt1, align 4, !opID !258, !opSignedness !6
  %call57 = call i32 @uppol1(i32 %75, i32 %76, i32 %77, i32 %78), !opID !259, !opSignedness !6
  store i32 %call57, i32* @al1, align 4, !opID !260, !opSignedness !6
  %79 = load i32, i32* @sl, align 4, !opID !261, !opSignedness !6
  %80 = load i32, i32* @dlt, align 4, !opID !262, !opSignedness !6
  %add58 = add i32 %79, %80, !opID !263, !opSignedness !6
  store i32 %add58, i32* @rlt, align 4, !opID !264, !opSignedness !6
  %81 = load i32, i32* @rlt1, align 4, !opID !265, !opSignedness !6
  store i32 %81, i32* @rlt2, align 4, !opID !266, !opSignedness !6
  %82 = load i32, i32* @rlt, align 4, !opID !267, !opSignedness !6
  store i32 %82, i32* @rlt1, align 4, !opID !268, !opSignedness !6
  %83 = load i32, i32* @plt1, align 4, !opID !269, !opSignedness !6
  store i32 %83, i32* @plt2, align 4, !opID !270, !opSignedness !6
  %84 = load i32, i32* @plt, align 4, !opID !271, !opSignedness !6
  store i32 %84, i32* @plt1, align 4, !opID !272, !opSignedness !6
  %call59 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0)), !opID !273, !opSignedness !6
  store i32 %call59, i32* @szh, align 4, !opID !274, !opSignedness !6
  %85 = load i32, i32* @rh1, align 4, !opID !275, !opSignedness !6
  %86 = load i32, i32* @ah1, align 4, !opID !276, !opSignedness !6
  %87 = load i32, i32* @rh2, align 4, !opID !277, !opSignedness !6
  %88 = load i32, i32* @ah2, align 4, !opID !278, !opSignedness !6
  %call60 = call i32 @filtep(i32 %85, i32 %86, i32 %87, i32 %88), !opID !279, !opSignedness !6
  store i32 %call60, i32* @sph, align 4, !opID !280, !opSignedness !6
  %89 = load i32, i32* @sph, align 4, !opID !281, !opSignedness !6
  %90 = load i32, i32* @szh, align 4, !opID !282, !opSignedness !6
  %add61 = add i32 %89, %90, !opID !283, !opSignedness !6
  store i32 %add61, i32* @sh, align 4, !opID !284, !opSignedness !6
  %91 = load i32, i32* @xh, align 4, !opID !285, !opSignedness !6
  %92 = load i32, i32* @sh, align 4, !opID !286, !opSignedness !6
  %sub62 = sub i32 %91, %92, !opID !287, !opSignedness !6
  store i32 %sub62, i32* @eh, align 4, !opID !288, !opSignedness !6
  %93 = load i32, i32* @eh, align 4, !opID !289, !opSignedness !6
  %cmp63 = icmp sge i32 %93, 0, !opID !290, !opSignedness !6
  br i1 %cmp63, label %if.then, label %if.else, !opID !291, !opSignedness !6

if.then:                                          ; preds = %for.end37
  store i32 3, i32* @ih, align 4, !opID !292, !opSignedness !6
  br label %if.end, !opID !293, !opSignedness !6

if.else:                                          ; preds = %for.end37
  store i32 1, i32* @ih, align 4, !opID !294, !opSignedness !6
  br label %if.end, !opID !295, !opSignedness !6

if.end:                                           ; preds = %if.else, %if.then
  %94 = load i32, i32* @deth, align 4, !opID !296, !opSignedness !6
  %conv64 = sext i32 %94 to i64, !opID !297, !opSignedness !6
  %mul65 = mul i64 564, %conv64, !opID !298, !opSignedness !6
  %shr66 = ashr i64 %mul65, 12, !opID !299, !opSignedness !6
  %conv67 = trunc i64 %shr66 to i32, !opID !300, !opSignedness !6
  store i32 %conv67, i32* %decis, align 4, !opID !301, !opSignedness !6
  %95 = load i32, i32* @eh, align 4, !opID !302, !opSignedness !6
  %call68 = call i32 @abs(i32 %95) #7, !opID !303, !opSignedness !6
  %96 = load i32, i32* %decis, align 4, !opID !304, !opSignedness !6
  %cmp69 = icmp sgt i32 %call68, %96, !opID !305, !opSignedness !6
  br i1 %cmp69, label %if.then70, label %if.end71, !opID !306, !opSignedness !6

if.then70:                                        ; preds = %if.end
  %97 = load i32, i32* @ih, align 4, !opID !307, !opSignedness !6
  %dec = add i32 %97, -1, !opID !308, !opSignedness !6
  store i32 %dec, i32* @ih, align 4, !opID !309, !opSignedness !6
  br label %if.end71, !opID !310, !opSignedness !6

if.end71:                                         ; preds = %if.then70, %if.end
  %98 = load i32, i32* @deth, align 4, !opID !311, !opSignedness !6
  %conv72 = sext i32 %98 to i64, !opID !312, !opSignedness !6
  %99 = load i32, i32* @ih, align 4, !opID !313, !opSignedness !6
  %idxprom73 = sext i32 %99 to i64, !opID !314, !opSignedness !6
  %arrayidx74 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i64 0, i64 %idxprom73, !opID !315, !opSignedness !6
  %100 = load i32, i32* %arrayidx74, align 4, !opID !316, !opSignedness !6
  %conv75 = sext i32 %100 to i64, !opID !317, !opSignedness !6
  %mul76 = mul i64 %conv72, %conv75, !opID !318, !opSignedness !6
  %shr77 = ashr i64 %mul76, 15, !opID !319, !opSignedness !6
  %conv78 = trunc i64 %shr77 to i32, !opID !320, !opSignedness !6
  store i32 %conv78, i32* @dh, align 4, !opID !321, !opSignedness !6
  %101 = load i32, i32* @ih, align 4, !opID !322, !opSignedness !6
  %102 = load i32, i32* @nbh, align 4, !opID !323, !opSignedness !6
  %call79 = call i32 @logsch(i32 %101, i32 %102), !opID !324, !opSignedness !6
  store i32 %call79, i32* @nbh, align 4, !opID !325, !opSignedness !6
  %103 = load i32, i32* @nbh, align 4, !opID !326, !opSignedness !6
  %call80 = call i32 @scalel(i32 %103, i32 10), !opID !327, !opSignedness !6
  store i32 %call80, i32* @deth, align 4, !opID !328, !opSignedness !6
  %104 = load i32, i32* @dh, align 4, !opID !329, !opSignedness !6
  %105 = load i32, i32* @szh, align 4, !opID !330, !opSignedness !6
  %add81 = add i32 %104, %105, !opID !331, !opSignedness !6
  store i32 %add81, i32* @ph, align 4, !opID !332, !opSignedness !6
  %106 = load i32, i32* @dh, align 4, !opID !333, !opSignedness !6
  call void @upzero(i32 %106, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0)), !opID !334, !opSignedness !6
  %107 = load i32, i32* @ah1, align 4, !opID !335, !opSignedness !6
  %108 = load i32, i32* @ah2, align 4, !opID !336, !opSignedness !6
  %109 = load i32, i32* @ph, align 4, !opID !337, !opSignedness !6
  %110 = load i32, i32* @ph1, align 4, !opID !338, !opSignedness !6
  %111 = load i32, i32* @ph2, align 4, !opID !339, !opSignedness !6
  %call82 = call i32 @uppol2(i32 %107, i32 %108, i32 %109, i32 %110, i32 %111), !opID !340, !opSignedness !6
  store i32 %call82, i32* @ah2, align 4, !opID !341, !opSignedness !6
  %112 = load i32, i32* @ah1, align 4, !opID !342, !opSignedness !6
  %113 = load i32, i32* @ah2, align 4, !opID !343, !opSignedness !6
  %114 = load i32, i32* @ph, align 4, !opID !344, !opSignedness !6
  %115 = load i32, i32* @ph1, align 4, !opID !345, !opSignedness !6
  %call83 = call i32 @uppol1(i32 %112, i32 %113, i32 %114, i32 %115), !opID !346, !opSignedness !6
  store i32 %call83, i32* @ah1, align 4, !opID !347, !opSignedness !6
  %116 = load i32, i32* @sh, align 4, !opID !348, !opSignedness !6
  %117 = load i32, i32* @dh, align 4, !opID !349, !opSignedness !6
  %add84 = add i32 %116, %117, !opID !350, !opSignedness !6
  store i32 %add84, i32* @yh, align 4, !opID !351, !opSignedness !6
  %118 = load i32, i32* @rh1, align 4, !opID !352, !opSignedness !6
  store i32 %118, i32* @rh2, align 4, !opID !353, !opSignedness !6
  %119 = load i32, i32* @yh, align 4, !opID !354, !opSignedness !6
  store i32 %119, i32* @rh1, align 4, !opID !355, !opSignedness !6
  %120 = load i32, i32* @ph1, align 4, !opID !356, !opSignedness !6
  store i32 %120, i32* @ph2, align 4, !opID !357, !opSignedness !6
  %121 = load i32, i32* @ph, align 4, !opID !358, !opSignedness !6
  store i32 %121, i32* @ph1, align 4, !opID !359, !opSignedness !6
  %122 = load i32, i32* @il, align 4, !opID !360, !opSignedness !6
  %123 = load i32, i32* @ih, align 4, !opID !361, !opSignedness !6
  %shl = shl i32 %123, 6, !opID !362, !opSignedness !6
  %or = or i32 %122, %shl, !opID !363, !opSignedness !6
  %124 = bitcast i32* %decis to i8*, !opID !364, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %124) #6, !opID !365, !opSignedness !6
  %125 = bitcast i64* %xb to i8*, !opID !366, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %125) #6, !opID !367, !opSignedness !6
  %126 = bitcast i64* %xa to i8*, !opID !368, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %126) #6, !opID !369, !opSignedness !6
  %127 = bitcast i32** %tqmf_ptr1 to i8*, !opID !370, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %127) #6, !opID !371, !opSignedness !6
  %128 = bitcast i32** %tqmf_ptr to i8*, !opID !372, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %128) #6, !opID !373, !opSignedness !6
  %129 = bitcast i32** %h_ptr to i8*, !opID !374, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %129) #6, !opID !375, !opSignedness !6
  %130 = bitcast i32* %i to i8*, !opID !376, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %130) #6, !opID !377, !opSignedness !6
  ret i32 %or, !opID !378, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @filtez(i32* %bpl, i32* %dlt) #4 {
entry:
  %bpl.addr = alloca i32*, align 8, !opID !379, !opSignedness !6
  %dlt.addr = alloca i32*, align 8, !opID !380, !opSignedness !6
  %i = alloca i32, align 4, !opID !381, !opSignedness !6
  %zl = alloca i64, align 8, !opID !382, !opSignedness !6
  store i32* %bpl, i32** %bpl.addr, align 8, !opID !383, !opSignedness !6
  store i32* %dlt, i32** %dlt.addr, align 8, !opID !384, !opSignedness !6
  %0 = bitcast i32* %i to i8*, !opID !385, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !386, !opSignedness !6
  %1 = bitcast i64* %zl to i8*, !opID !387, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #6, !opID !388, !opSignedness !6
  %2 = load i32*, i32** %bpl.addr, align 8, !opID !389, !opSignedness !6
  %incdec.ptr = getelementptr inbounds i32, i32* %2, i32 1, !opID !390, !opSignedness !6
  store i32* %incdec.ptr, i32** %bpl.addr, align 8, !opID !391, !opSignedness !6
  %3 = load i32, i32* %2, align 4, !opID !392, !opSignedness !6
  %conv = sext i32 %3 to i64, !opID !393, !opSignedness !6
  %4 = load i32*, i32** %dlt.addr, align 8, !opID !394, !opSignedness !6
  %incdec.ptr1 = getelementptr inbounds i32, i32* %4, i32 1, !opID !395, !opSignedness !6
  store i32* %incdec.ptr1, i32** %dlt.addr, align 8, !opID !396, !opSignedness !6
  %5 = load i32, i32* %4, align 4, !opID !397, !opSignedness !6
  %conv2 = sext i32 %5 to i64, !opID !398, !opSignedness !6
  %mul = mul i64 %conv, %conv2, !opID !399, !opSignedness !6
  store i64 %mul, i64* %zl, align 8, !opID !400, !opSignedness !6
  br label %filtez_label8, !opID !401, !opSignedness !6

filtez_label8:                                    ; preds = %entry
  store i32 1, i32* %i, align 4, !opID !402, !opSignedness !6
  br label %for.cond, !opID !403, !opSignedness !6

for.cond:                                         ; preds = %for.inc, %filtez_label8
  %6 = load i32, i32* %i, align 4, !opID !404, !opSignedness !6
  %cmp = icmp slt i32 %6, 6, !opID !405, !opSignedness !6
  br i1 %cmp, label %for.body, label %for.end, !opID !406, !opSignedness !6

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %bpl.addr, align 8, !opID !407, !opSignedness !6
  %incdec.ptr3 = getelementptr inbounds i32, i32* %7, i32 1, !opID !408, !opSignedness !6
  store i32* %incdec.ptr3, i32** %bpl.addr, align 8, !opID !409, !opSignedness !6
  %8 = load i32, i32* %7, align 4, !opID !410, !opSignedness !6
  %conv4 = sext i32 %8 to i64, !opID !411, !opSignedness !6
  %9 = load i32*, i32** %dlt.addr, align 8, !opID !412, !opSignedness !6
  %incdec.ptr5 = getelementptr inbounds i32, i32* %9, i32 1, !opID !413, !opSignedness !6
  store i32* %incdec.ptr5, i32** %dlt.addr, align 8, !opID !414, !opSignedness !6
  %10 = load i32, i32* %9, align 4, !opID !415, !opSignedness !6
  %conv6 = sext i32 %10 to i64, !opID !416, !opSignedness !6
  %mul7 = mul i64 %conv4, %conv6, !opID !417, !opSignedness !6
  %11 = load i64, i64* %zl, align 8, !opID !418, !opSignedness !6
  %add = add i64 %11, %mul7, !opID !419, !opSignedness !6
  store i64 %add, i64* %zl, align 8, !opID !420, !opSignedness !6
  br label %for.inc, !opID !421, !opSignedness !6

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !opID !422, !opSignedness !6
  %inc = add i32 %12, 1, !opID !423, !opSignedness !6
  store i32 %inc, i32* %i, align 4, !opID !424, !opSignedness !6
  br label %for.cond, !llvm.loop !425, !opID !427, !opSignedness !6

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %zl, align 8, !opID !428, !opSignedness !6
  %shr = ashr i64 %13, 14, !opID !429, !opSignedness !6
  %conv8 = trunc i64 %shr to i32, !opID !430, !opSignedness !6
  %14 = bitcast i64* %zl to i8*, !opID !431, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %14) #6, !opID !432, !opSignedness !6
  %15 = bitcast i32* %i to i8*, !opID !433, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #6, !opID !434, !opSignedness !6
  ret i32 %conv8, !opID !435, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @filtep(i32 %rlt1, i32 %al1, i32 %rlt2, i32 %al2) #4 {
entry:
  %rlt1.addr = alloca i32, align 4, !opID !436, !opSignedness !6
  %al1.addr = alloca i32, align 4, !opID !437, !opSignedness !6
  %rlt2.addr = alloca i32, align 4, !opID !438, !opSignedness !6
  %al2.addr = alloca i32, align 4, !opID !439, !opSignedness !6
  %pl = alloca i64, align 8, !opID !440, !opSignedness !6
  %pl2 = alloca i64, align 8, !opID !441, !opSignedness !6
  store i32 %rlt1, i32* %rlt1.addr, align 4, !opID !442, !opSignedness !6
  store i32 %al1, i32* %al1.addr, align 4, !opID !443, !opSignedness !6
  store i32 %rlt2, i32* %rlt2.addr, align 4, !opID !444, !opSignedness !6
  store i32 %al2, i32* %al2.addr, align 4, !opID !445, !opSignedness !6
  %0 = bitcast i64* %pl to i8*, !opID !446, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #6, !opID !447, !opSignedness !6
  %1 = bitcast i64* %pl2 to i8*, !opID !448, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #6, !opID !449, !opSignedness !6
  %2 = load i32, i32* %rlt1.addr, align 4, !opID !450, !opSignedness !6
  %mul = mul i32 2, %2, !opID !451, !opSignedness !6
  %conv = sext i32 %mul to i64, !opID !452, !opSignedness !6
  store i64 %conv, i64* %pl, align 8, !opID !453, !opSignedness !6
  %3 = load i32, i32* %al1.addr, align 4, !opID !454, !opSignedness !6
  %conv1 = sext i32 %3 to i64, !opID !455, !opSignedness !6
  %4 = load i64, i64* %pl, align 8, !opID !456, !opSignedness !6
  %mul2 = mul i64 %conv1, %4, !opID !457, !opSignedness !6
  store i64 %mul2, i64* %pl, align 8, !opID !458, !opSignedness !6
  %5 = load i32, i32* %rlt2.addr, align 4, !opID !459, !opSignedness !6
  %mul3 = mul i32 2, %5, !opID !460, !opSignedness !6
  %conv4 = sext i32 %mul3 to i64, !opID !461, !opSignedness !6
  store i64 %conv4, i64* %pl2, align 8, !opID !462, !opSignedness !6
  %6 = load i32, i32* %al2.addr, align 4, !opID !463, !opSignedness !6
  %conv5 = sext i32 %6 to i64, !opID !464, !opSignedness !6
  %7 = load i64, i64* %pl2, align 8, !opID !465, !opSignedness !6
  %mul6 = mul i64 %conv5, %7, !opID !466, !opSignedness !6
  %8 = load i64, i64* %pl, align 8, !opID !467, !opSignedness !6
  %add = add i64 %8, %mul6, !opID !468, !opSignedness !6
  store i64 %add, i64* %pl, align 8, !opID !469, !opSignedness !6
  %9 = load i64, i64* %pl, align 8, !opID !470, !opSignedness !6
  %shr = ashr i64 %9, 15, !opID !471, !opSignedness !6
  %conv7 = trunc i64 %shr to i32, !opID !472, !opSignedness !6
  %10 = bitcast i64* %pl2 to i8*, !opID !473, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %10) #6, !opID !474, !opSignedness !6
  %11 = bitcast i64* %pl to i8*, !opID !475, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %11) #6, !opID !476, !opSignedness !6
  ret i32 %conv7, !opID !477, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @quantl(i32 %el, i32 %detl) #4 {
entry:
  %el.addr = alloca i32, align 4, !opID !478, !opSignedness !6
  %detl.addr = alloca i32, align 4, !opID !479, !opSignedness !6
  %ril = alloca i32, align 4, !opID !480, !opSignedness !6
  %mil = alloca i32, align 4, !opID !481, !opSignedness !6
  %wd = alloca i64, align 8, !opID !482, !opSignedness !6
  %decis = alloca i64, align 8, !opID !483, !opSignedness !6
  store i32 %el, i32* %el.addr, align 4, !opID !484, !opSignedness !6
  store i32 %detl, i32* %detl.addr, align 4, !opID !485, !opSignedness !6
  %0 = bitcast i32* %ril to i8*, !opID !486, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !487, !opSignedness !6
  %1 = bitcast i32* %mil to i8*, !opID !488, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6, !opID !489, !opSignedness !6
  %2 = bitcast i64* %wd to i8*, !opID !490, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #6, !opID !491, !opSignedness !6
  %3 = bitcast i64* %decis to i8*, !opID !492, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #6, !opID !493, !opSignedness !6
  %4 = load i32, i32* %el.addr, align 4, !opID !494, !opSignedness !6
  %call = call i32 @abs(i32 %4) #7, !opID !495, !opSignedness !6
  %conv = sext i32 %call to i64, !opID !496, !opSignedness !6
  store i64 %conv, i64* %wd, align 8, !opID !497, !opSignedness !6
  br label %quantl_label9, !opID !498, !opSignedness !6

quantl_label9:                                    ; preds = %entry
  store i32 0, i32* %mil, align 4, !opID !499, !opSignedness !6
  br label %for.cond, !opID !500, !opSignedness !6

for.cond:                                         ; preds = %for.inc, %quantl_label9
  %5 = load i32, i32* %mil, align 4, !opID !501, !opSignedness !6
  %cmp = icmp slt i32 %5, 30, !opID !502, !opSignedness !6
  br i1 %cmp, label %for.body, label %for.end, !opID !503, !opSignedness !6

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %mil, align 4, !opID !504, !opSignedness !6
  %idxprom = sext i32 %6 to i64, !opID !505, !opSignedness !6
  %arrayidx = getelementptr inbounds [30 x i32], [30 x i32]* @decis_levl, i64 0, i64 %idxprom, !opID !506, !opSignedness !6
  %7 = load i32, i32* %arrayidx, align 4, !opID !507, !opSignedness !6
  %conv1 = sext i32 %7 to i64, !opID !508, !opSignedness !6
  %8 = load i32, i32* %detl.addr, align 4, !opID !509, !opSignedness !6
  %conv2 = sext i32 %8 to i64, !opID !510, !opSignedness !6
  %mul = mul i64 %conv1, %conv2, !opID !511, !opSignedness !6
  %shr = ashr i64 %mul, 15, !opID !512, !opSignedness !6
  store i64 %shr, i64* %decis, align 8, !opID !513, !opSignedness !6
  %9 = load i64, i64* %wd, align 8, !opID !514, !opSignedness !6
  %10 = load i64, i64* %decis, align 8, !opID !515, !opSignedness !6
  %cmp3 = icmp sle i64 %9, %10, !opID !516, !opSignedness !6
  br i1 %cmp3, label %if.then, label %if.end, !opID !517, !opSignedness !6

if.then:                                          ; preds = %for.body
  br label %for.end, !opID !518, !opSignedness !6

if.end:                                           ; preds = %for.body
  br label %for.inc, !opID !519, !opSignedness !6

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %mil, align 4, !opID !520, !opSignedness !6
  %inc = add i32 %11, 1, !opID !521, !opSignedness !6
  store i32 %inc, i32* %mil, align 4, !opID !522, !opSignedness !6
  br label %for.cond, !llvm.loop !523, !opID !525, !opSignedness !6

for.end:                                          ; preds = %if.then, %for.cond
  %12 = load i32, i32* %el.addr, align 4, !opID !526, !opSignedness !6
  %cmp4 = icmp sge i32 %12, 0, !opID !527, !opSignedness !6
  br i1 %cmp4, label %if.then5, label %if.else, !opID !528, !opSignedness !6

if.then5:                                         ; preds = %for.end
  %13 = load i32, i32* %mil, align 4, !opID !529, !opSignedness !6
  %idxprom6 = sext i32 %13 to i64, !opID !530, !opSignedness !6
  %arrayidx7 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_pos, i64 0, i64 %idxprom6, !opID !531, !opSignedness !6
  %14 = load i32, i32* %arrayidx7, align 4, !opID !532, !opSignedness !6
  store i32 %14, i32* %ril, align 4, !opID !533, !opSignedness !6
  br label %if.end10, !opID !534, !opSignedness !6

if.else:                                          ; preds = %for.end
  %15 = load i32, i32* %mil, align 4, !opID !535, !opSignedness !6
  %idxprom8 = sext i32 %15 to i64, !opID !536, !opSignedness !6
  %arrayidx9 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_neg, i64 0, i64 %idxprom8, !opID !537, !opSignedness !6
  %16 = load i32, i32* %arrayidx9, align 4, !opID !538, !opSignedness !6
  store i32 %16, i32* %ril, align 4, !opID !539, !opSignedness !6
  br label %if.end10, !opID !540, !opSignedness !6

if.end10:                                         ; preds = %if.else, %if.then5
  %17 = load i32, i32* %ril, align 4, !opID !541, !opSignedness !6
  %18 = bitcast i64* %decis to i8*, !opID !542, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #6, !opID !543, !opSignedness !6
  %19 = bitcast i64* %wd to i8*, !opID !544, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #6, !opID !545, !opSignedness !6
  %20 = bitcast i32* %mil to i8*, !opID !546, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #6, !opID !547, !opSignedness !6
  %21 = bitcast i32* %ril to i8*, !opID !548, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #6, !opID !549, !opSignedness !6
  ret i32 %17, !opID !550, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @logscl(i32 %il, i32 %nbl) #4 {
entry:
  %il.addr = alloca i32, align 4, !opID !551, !opSignedness !6
  %nbl.addr = alloca i32, align 4, !opID !552, !opSignedness !6
  %wd = alloca i64, align 8, !opID !553, !opSignedness !6
  store i32 %il, i32* %il.addr, align 4, !opID !554, !opSignedness !6
  store i32 %nbl, i32* %nbl.addr, align 4, !opID !555, !opSignedness !6
  %0 = bitcast i64* %wd to i8*, !opID !556, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #6, !opID !557, !opSignedness !6
  %1 = load i32, i32* %nbl.addr, align 4, !opID !558, !opSignedness !6
  %conv = sext i32 %1 to i64, !opID !559, !opSignedness !6
  %mul = mul i64 %conv, 127, !opID !560, !opSignedness !6
  %shr = ashr i64 %mul, 7, !opID !561, !opSignedness !6
  store i64 %shr, i64* %wd, align 8, !opID !562, !opSignedness !6
  %2 = load i64, i64* %wd, align 8, !opID !563, !opSignedness !6
  %conv1 = trunc i64 %2 to i32, !opID !564, !opSignedness !6
  %3 = load i32, i32* %il.addr, align 4, !opID !565, !opSignedness !6
  %shr2 = ashr i32 %3, 2, !opID !566, !opSignedness !6
  %idxprom = sext i32 %shr2 to i64, !opID !567, !opSignedness !6
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @wl_code_table, i64 0, i64 %idxprom, !opID !568, !opSignedness !6
  %4 = load i32, i32* %arrayidx, align 4, !opID !569, !opSignedness !6
  %add = add i32 %conv1, %4, !opID !570, !opSignedness !6
  store i32 %add, i32* %nbl.addr, align 4, !opID !571, !opSignedness !6
  %5 = load i32, i32* %nbl.addr, align 4, !opID !572, !opSignedness !6
  %cmp = icmp slt i32 %5, 0, !opID !573, !opSignedness !6
  br i1 %cmp, label %if.then, label %if.end, !opID !574, !opSignedness !6

if.then:                                          ; preds = %entry
  store i32 0, i32* %nbl.addr, align 4, !opID !575, !opSignedness !6
  br label %if.end, !opID !576, !opSignedness !6

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32, i32* %nbl.addr, align 4, !opID !577, !opSignedness !6
  %cmp3 = icmp sgt i32 %6, 18432, !opID !578, !opSignedness !6
  br i1 %cmp3, label %if.then4, label %if.end5, !opID !579, !opSignedness !6

if.then4:                                         ; preds = %if.end
  store i32 18432, i32* %nbl.addr, align 4, !opID !580, !opSignedness !6
  br label %if.end5, !opID !581, !opSignedness !6

if.end5:                                          ; preds = %if.then4, %if.end
  %7 = load i32, i32* %nbl.addr, align 4, !opID !582, !opSignedness !6
  %8 = bitcast i64* %wd to i8*, !opID !583, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %8) #6, !opID !584, !opSignedness !6
  ret i32 %7, !opID !585, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @scalel(i32 %nbl, i32 %shift_constant) #4 {
entry:
  %nbl.addr = alloca i32, align 4, !opID !586, !opSignedness !6
  %shift_constant.addr = alloca i32, align 4, !opID !587, !opSignedness !6
  %wd1 = alloca i32, align 4, !opID !588, !opSignedness !6
  %wd2 = alloca i32, align 4, !opID !589, !opSignedness !6
  %wd3 = alloca i32, align 4, !opID !590, !opSignedness !6
  store i32 %nbl, i32* %nbl.addr, align 4, !opID !591, !opSignedness !6
  store i32 %shift_constant, i32* %shift_constant.addr, align 4, !opID !592, !opSignedness !6
  %0 = bitcast i32* %wd1 to i8*, !opID !593, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !594, !opSignedness !6
  %1 = bitcast i32* %wd2 to i8*, !opID !595, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6, !opID !596, !opSignedness !6
  %2 = bitcast i32* %wd3 to i8*, !opID !597, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #6, !opID !598, !opSignedness !6
  %3 = load i32, i32* %nbl.addr, align 4, !opID !599, !opSignedness !6
  %shr = ashr i32 %3, 6, !opID !600, !opSignedness !6
  %and = and i32 %shr, 31, !opID !601, !opSignedness !6
  store i32 %and, i32* %wd1, align 4, !opID !602, !opSignedness !6
  %4 = load i32, i32* %nbl.addr, align 4, !opID !603, !opSignedness !6
  %shr1 = ashr i32 %4, 11, !opID !604, !opSignedness !6
  store i32 %shr1, i32* %wd2, align 4, !opID !605, !opSignedness !6
  %5 = load i32, i32* %wd1, align 4, !opID !606, !opSignedness !6
  %idxprom = sext i32 %5 to i64, !opID !607, !opSignedness !6
  %arrayidx = getelementptr inbounds [32 x i32], [32 x i32]* @ilb_table, i64 0, i64 %idxprom, !opID !608, !opSignedness !6
  %6 = load i32, i32* %arrayidx, align 4, !opID !609, !opSignedness !6
  %7 = load i32, i32* %shift_constant.addr, align 4, !opID !610, !opSignedness !6
  %add = add i32 %7, 1, !opID !611, !opSignedness !6
  %8 = load i32, i32* %wd2, align 4, !opID !612, !opSignedness !6
  %sub = sub i32 %add, %8, !opID !613, !opSignedness !6
  %shr2 = ashr i32 %6, %sub, !opID !614, !opSignedness !6
  store i32 %shr2, i32* %wd3, align 4, !opID !615, !opSignedness !6
  %9 = load i32, i32* %wd3, align 4, !opID !616, !opSignedness !6
  %shl = shl i32 %9, 3, !opID !617, !opSignedness !6
  %10 = bitcast i32* %wd3 to i8*, !opID !618, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #6, !opID !619, !opSignedness !6
  %11 = bitcast i32* %wd2 to i8*, !opID !620, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %11) #6, !opID !621, !opSignedness !6
  %12 = bitcast i32* %wd1 to i8*, !opID !622, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %12) #6, !opID !623, !opSignedness !6
  ret i32 %shl, !opID !624, !opSignedness !6
}

; Function Attrs: nounwind
define void @upzero(i32 %dlt, i32* %dlti, i32* %bli) #4 {
entry:
  %dlt.addr = alloca i32, align 4, !opID !625, !opSignedness !6
  %dlti.addr = alloca i32*, align 8, !opID !626, !opSignedness !6
  %bli.addr = alloca i32*, align 8, !opID !627, !opSignedness !6
  %i = alloca i32, align 4, !opID !628, !opSignedness !6
  %wd2 = alloca i32, align 4, !opID !629, !opSignedness !6
  %wd3 = alloca i32, align 4, !opID !630, !opSignedness !6
  store i32 %dlt, i32* %dlt.addr, align 4, !opID !631, !opSignedness !6
  store i32* %dlti, i32** %dlti.addr, align 8, !opID !632, !opSignedness !6
  store i32* %bli, i32** %bli.addr, align 8, !opID !633, !opSignedness !6
  %0 = bitcast i32* %i to i8*, !opID !634, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !635, !opSignedness !6
  %1 = bitcast i32* %wd2 to i8*, !opID !636, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6, !opID !637, !opSignedness !6
  %2 = bitcast i32* %wd3 to i8*, !opID !638, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #6, !opID !639, !opSignedness !6
  %3 = load i32, i32* %dlt.addr, align 4, !opID !640, !opSignedness !6
  %cmp = icmp eq i32 %3, 0, !opID !641, !opSignedness !6
  br i1 %cmp, label %if.then, label %if.else, !opID !642, !opSignedness !6

if.then:                                          ; preds = %entry
  br label %upzero_label10, !opID !643, !opSignedness !6

upzero_label10:                                   ; preds = %if.then
  store i32 0, i32* %i, align 4, !opID !644, !opSignedness !6
  br label %for.cond, !opID !645, !opSignedness !6

for.cond:                                         ; preds = %for.inc, %upzero_label10
  %4 = load i32, i32* %i, align 4, !opID !646, !opSignedness !6
  %cmp1 = icmp slt i32 %4, 6, !opID !647, !opSignedness !6
  br i1 %cmp1, label %for.body, label %for.end, !opID !648, !opSignedness !6

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %bli.addr, align 8, !opID !649, !opSignedness !6
  %6 = load i32, i32* %i, align 4, !opID !650, !opSignedness !6
  %idxprom = sext i32 %6 to i64, !opID !651, !opSignedness !6
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !opID !652, !opSignedness !6
  %7 = load i32, i32* %arrayidx, align 4, !opID !653, !opSignedness !6
  %conv = sext i32 %7 to i64, !opID !654, !opSignedness !6
  %mul = mul i64 255, %conv, !opID !655, !opSignedness !6
  %shr = ashr i64 %mul, 8, !opID !656, !opSignedness !6
  %conv2 = trunc i64 %shr to i32, !opID !657, !opSignedness !6
  %8 = load i32*, i32** %bli.addr, align 8, !opID !658, !opSignedness !6
  %9 = load i32, i32* %i, align 4, !opID !659, !opSignedness !6
  %idxprom3 = sext i32 %9 to i64, !opID !660, !opSignedness !6
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %idxprom3, !opID !661, !opSignedness !6
  store i32 %conv2, i32* %arrayidx4, align 4, !opID !662, !opSignedness !6
  br label %for.inc, !opID !663, !opSignedness !6

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !opID !664, !opSignedness !6
  %inc = add i32 %10, 1, !opID !665, !opSignedness !6
  store i32 %inc, i32* %i, align 4, !opID !666, !opSignedness !6
  br label %for.cond, !llvm.loop !667, !opID !669, !opSignedness !6

for.end:                                          ; preds = %for.cond
  br label %if.end27, !opID !670, !opSignedness !6

if.else:                                          ; preds = %entry
  br label %upzero_label11, !opID !671, !opSignedness !6

upzero_label11:                                   ; preds = %if.else
  store i32 0, i32* %i, align 4, !opID !672, !opSignedness !6
  br label %for.cond5, !opID !673, !opSignedness !6

for.cond5:                                        ; preds = %for.inc24, %upzero_label11
  %11 = load i32, i32* %i, align 4, !opID !674, !opSignedness !6
  %cmp6 = icmp slt i32 %11, 6, !opID !675, !opSignedness !6
  br i1 %cmp6, label %for.body7, label %for.end26, !opID !676, !opSignedness !6

for.body7:                                        ; preds = %for.cond5
  %12 = load i32, i32* %dlt.addr, align 4, !opID !677, !opSignedness !6
  %conv8 = sext i32 %12 to i64, !opID !678, !opSignedness !6
  %13 = load i32*, i32** %dlti.addr, align 8, !opID !679, !opSignedness !6
  %14 = load i32, i32* %i, align 4, !opID !680, !opSignedness !6
  %idxprom9 = sext i32 %14 to i64, !opID !681, !opSignedness !6
  %arrayidx10 = getelementptr inbounds i32, i32* %13, i64 %idxprom9, !opID !682, !opSignedness !6
  %15 = load i32, i32* %arrayidx10, align 4, !opID !683, !opSignedness !6
  %conv11 = sext i32 %15 to i64, !opID !684, !opSignedness !6
  %mul12 = mul i64 %conv8, %conv11, !opID !685, !opSignedness !6
  %cmp13 = icmp sge i64 %mul12, 0, !opID !686, !opSignedness !6
  br i1 %cmp13, label %if.then14, label %if.else15, !opID !687, !opSignedness !6

if.then14:                                        ; preds = %for.body7
  store i32 128, i32* %wd2, align 4, !opID !688, !opSignedness !6
  br label %if.end, !opID !689, !opSignedness !6

if.else15:                                        ; preds = %for.body7
  store i32 -128, i32* %wd2, align 4, !opID !690, !opSignedness !6
  br label %if.end, !opID !691, !opSignedness !6

if.end:                                           ; preds = %if.else15, %if.then14
  %16 = load i32*, i32** %bli.addr, align 8, !opID !692, !opSignedness !6
  %17 = load i32, i32* %i, align 4, !opID !693, !opSignedness !6
  %idxprom16 = sext i32 %17 to i64, !opID !694, !opSignedness !6
  %arrayidx17 = getelementptr inbounds i32, i32* %16, i64 %idxprom16, !opID !695, !opSignedness !6
  %18 = load i32, i32* %arrayidx17, align 4, !opID !696, !opSignedness !6
  %conv18 = sext i32 %18 to i64, !opID !697, !opSignedness !6
  %mul19 = mul i64 255, %conv18, !opID !698, !opSignedness !6
  %shr20 = ashr i64 %mul19, 8, !opID !699, !opSignedness !6
  %conv21 = trunc i64 %shr20 to i32, !opID !700, !opSignedness !6
  store i32 %conv21, i32* %wd3, align 4, !opID !701, !opSignedness !6
  %19 = load i32, i32* %wd2, align 4, !opID !702, !opSignedness !6
  %20 = load i32, i32* %wd3, align 4, !opID !703, !opSignedness !6
  %add = add i32 %19, %20, !opID !704, !opSignedness !6
  %21 = load i32*, i32** %bli.addr, align 8, !opID !705, !opSignedness !6
  %22 = load i32, i32* %i, align 4, !opID !706, !opSignedness !6
  %idxprom22 = sext i32 %22 to i64, !opID !707, !opSignedness !6
  %arrayidx23 = getelementptr inbounds i32, i32* %21, i64 %idxprom22, !opID !708, !opSignedness !6
  store i32 %add, i32* %arrayidx23, align 4, !opID !709, !opSignedness !6
  br label %for.inc24, !opID !710, !opSignedness !6

for.inc24:                                        ; preds = %if.end
  %23 = load i32, i32* %i, align 4, !opID !711, !opSignedness !6
  %inc25 = add i32 %23, 1, !opID !712, !opSignedness !6
  store i32 %inc25, i32* %i, align 4, !opID !713, !opSignedness !6
  br label %for.cond5, !llvm.loop !714, !opID !716, !opSignedness !6

for.end26:                                        ; preds = %for.cond5
  br label %if.end27, !opID !717, !opSignedness !6

if.end27:                                         ; preds = %for.end26, %for.end
  %24 = load i32*, i32** %dlti.addr, align 8, !opID !718, !opSignedness !6
  %arrayidx28 = getelementptr inbounds i32, i32* %24, i64 4, !opID !719, !opSignedness !6
  %25 = load i32, i32* %arrayidx28, align 4, !opID !720, !opSignedness !6
  %26 = load i32*, i32** %dlti.addr, align 8, !opID !721, !opSignedness !6
  %arrayidx29 = getelementptr inbounds i32, i32* %26, i64 5, !opID !722, !opSignedness !6
  store i32 %25, i32* %arrayidx29, align 4, !opID !723, !opSignedness !6
  %27 = load i32*, i32** %dlti.addr, align 8, !opID !724, !opSignedness !6
  %arrayidx30 = getelementptr inbounds i32, i32* %27, i64 3, !opID !725, !opSignedness !6
  %28 = load i32, i32* %arrayidx30, align 4, !opID !726, !opSignedness !6
  %29 = load i32*, i32** %dlti.addr, align 8, !opID !727, !opSignedness !6
  %arrayidx31 = getelementptr inbounds i32, i32* %29, i64 4, !opID !728, !opSignedness !6
  store i32 %28, i32* %arrayidx31, align 4, !opID !729, !opSignedness !6
  %30 = load i32*, i32** %dlti.addr, align 8, !opID !730, !opSignedness !6
  %arrayidx32 = getelementptr inbounds i32, i32* %30, i64 2, !opID !731, !opSignedness !6
  %31 = load i32, i32* %arrayidx32, align 4, !opID !732, !opSignedness !6
  %32 = load i32*, i32** %dlti.addr, align 8, !opID !733, !opSignedness !6
  %arrayidx33 = getelementptr inbounds i32, i32* %32, i64 3, !opID !734, !opSignedness !6
  store i32 %31, i32* %arrayidx33, align 4, !opID !735, !opSignedness !6
  %33 = load i32*, i32** %dlti.addr, align 8, !opID !736, !opSignedness !6
  %arrayidx34 = getelementptr inbounds i32, i32* %33, i64 1, !opID !737, !opSignedness !6
  %34 = load i32, i32* %arrayidx34, align 4, !opID !738, !opSignedness !6
  %35 = load i32*, i32** %dlti.addr, align 8, !opID !739, !opSignedness !6
  %arrayidx35 = getelementptr inbounds i32, i32* %35, i64 2, !opID !740, !opSignedness !6
  store i32 %34, i32* %arrayidx35, align 4, !opID !741, !opSignedness !6
  %36 = load i32*, i32** %dlti.addr, align 8, !opID !742, !opSignedness !6
  %arrayidx36 = getelementptr inbounds i32, i32* %36, i64 0, !opID !743, !opSignedness !6
  %37 = load i32, i32* %arrayidx36, align 4, !opID !744, !opSignedness !6
  %38 = load i32*, i32** %dlti.addr, align 8, !opID !745, !opSignedness !6
  %arrayidx37 = getelementptr inbounds i32, i32* %38, i64 1, !opID !746, !opSignedness !6
  store i32 %37, i32* %arrayidx37, align 4, !opID !747, !opSignedness !6
  %39 = load i32, i32* %dlt.addr, align 4, !opID !748, !opSignedness !6
  %40 = load i32*, i32** %dlti.addr, align 8, !opID !749, !opSignedness !6
  %arrayidx38 = getelementptr inbounds i32, i32* %40, i64 0, !opID !750, !opSignedness !6
  store i32 %39, i32* %arrayidx38, align 4, !opID !751, !opSignedness !6
  %41 = bitcast i32* %wd3 to i8*, !opID !752, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %41) #6, !opID !753, !opSignedness !6
  %42 = bitcast i32* %wd2 to i8*, !opID !754, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %42) #6, !opID !755, !opSignedness !6
  %43 = bitcast i32* %i to i8*, !opID !756, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %43) #6, !opID !757, !opSignedness !6
  ret void, !opID !758, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @uppol2(i32 %al1, i32 %al2, i32 %plt, i32 %plt1, i32 %plt2) #4 {
entry:
  %al1.addr = alloca i32, align 4, !opID !759, !opSignedness !6
  %al2.addr = alloca i32, align 4, !opID !760, !opSignedness !6
  %plt.addr = alloca i32, align 4, !opID !761, !opSignedness !6
  %plt1.addr = alloca i32, align 4, !opID !762, !opSignedness !6
  %plt2.addr = alloca i32, align 4, !opID !763, !opSignedness !6
  %wd2 = alloca i64, align 8, !opID !764, !opSignedness !6
  %wd4 = alloca i64, align 8, !opID !765, !opSignedness !6
  %apl2 = alloca i32, align 4, !opID !766, !opSignedness !6
  store i32 %al1, i32* %al1.addr, align 4, !opID !767, !opSignedness !6
  store i32 %al2, i32* %al2.addr, align 4, !opID !768, !opSignedness !6
  store i32 %plt, i32* %plt.addr, align 4, !opID !769, !opSignedness !6
  store i32 %plt1, i32* %plt1.addr, align 4, !opID !770, !opSignedness !6
  store i32 %plt2, i32* %plt2.addr, align 4, !opID !771, !opSignedness !6
  %0 = bitcast i64* %wd2 to i8*, !opID !772, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #6, !opID !773, !opSignedness !6
  %1 = bitcast i64* %wd4 to i8*, !opID !774, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #6, !opID !775, !opSignedness !6
  %2 = bitcast i32* %apl2 to i8*, !opID !776, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #6, !opID !777, !opSignedness !6
  %3 = load i32, i32* %al1.addr, align 4, !opID !778, !opSignedness !6
  %conv = sext i32 %3 to i64, !opID !779, !opSignedness !6
  %mul = mul i64 4, %conv, !opID !780, !opSignedness !6
  store i64 %mul, i64* %wd2, align 8, !opID !781, !opSignedness !6
  %4 = load i32, i32* %plt.addr, align 4, !opID !782, !opSignedness !6
  %conv1 = sext i32 %4 to i64, !opID !783, !opSignedness !6
  %5 = load i32, i32* %plt1.addr, align 4, !opID !784, !opSignedness !6
  %conv2 = sext i32 %5 to i64, !opID !785, !opSignedness !6
  %mul3 = mul i64 %conv1, %conv2, !opID !786, !opSignedness !6
  %cmp = icmp sge i64 %mul3, 0, !opID !787, !opSignedness !6
  br i1 %cmp, label %if.then, label %if.end, !opID !788, !opSignedness !6

if.then:                                          ; preds = %entry
  %6 = load i64, i64* %wd2, align 8, !opID !789, !opSignedness !6
  %sub = sub i64 0, %6, !opID !790, !opSignedness !6
  store i64 %sub, i64* %wd2, align 8, !opID !791, !opSignedness !6
  br label %if.end, !opID !792, !opSignedness !6

if.end:                                           ; preds = %if.then, %entry
  %7 = load i64, i64* %wd2, align 8, !opID !793, !opSignedness !6
  %shr = ashr i64 %7, 7, !opID !794, !opSignedness !6
  store i64 %shr, i64* %wd2, align 8, !opID !795, !opSignedness !6
  %8 = load i32, i32* %plt.addr, align 4, !opID !796, !opSignedness !6
  %conv4 = sext i32 %8 to i64, !opID !797, !opSignedness !6
  %9 = load i32, i32* %plt2.addr, align 4, !opID !798, !opSignedness !6
  %conv5 = sext i32 %9 to i64, !opID !799, !opSignedness !6
  %mul6 = mul i64 %conv4, %conv5, !opID !800, !opSignedness !6
  %cmp7 = icmp sge i64 %mul6, 0, !opID !801, !opSignedness !6
  br i1 %cmp7, label %if.then8, label %if.else, !opID !802, !opSignedness !6

if.then8:                                         ; preds = %if.end
  %10 = load i64, i64* %wd2, align 8, !opID !803, !opSignedness !6
  %add = add i64 %10, 128, !opID !804, !opSignedness !6
  store i64 %add, i64* %wd4, align 8, !opID !805, !opSignedness !6
  br label %if.end10, !opID !806, !opSignedness !6

if.else:                                          ; preds = %if.end
  %11 = load i64, i64* %wd2, align 8, !opID !807, !opSignedness !6
  %sub9 = sub i64 %11, 128, !opID !808, !opSignedness !6
  store i64 %sub9, i64* %wd4, align 8, !opID !809, !opSignedness !6
  br label %if.end10, !opID !810, !opSignedness !6

if.end10:                                         ; preds = %if.else, %if.then8
  %12 = load i64, i64* %wd4, align 8, !opID !811, !opSignedness !6
  %13 = load i32, i32* %al2.addr, align 4, !opID !812, !opSignedness !6
  %conv11 = sext i32 %13 to i64, !opID !813, !opSignedness !6
  %mul12 = mul i64 127, %conv11, !opID !814, !opSignedness !6
  %shr13 = ashr i64 %mul12, 7, !opID !815, !opSignedness !6
  %add14 = add i64 %12, %shr13, !opID !816, !opSignedness !6
  %conv15 = trunc i64 %add14 to i32, !opID !817, !opSignedness !6
  store i32 %conv15, i32* %apl2, align 4, !opID !818, !opSignedness !6
  %14 = load i32, i32* %apl2, align 4, !opID !819, !opSignedness !6
  %cmp16 = icmp sgt i32 %14, 12288, !opID !820, !opSignedness !6
  br i1 %cmp16, label %if.then17, label %if.end18, !opID !821, !opSignedness !6

if.then17:                                        ; preds = %if.end10
  store i32 12288, i32* %apl2, align 4, !opID !822, !opSignedness !6
  br label %if.end18, !opID !823, !opSignedness !6

if.end18:                                         ; preds = %if.then17, %if.end10
  %15 = load i32, i32* %apl2, align 4, !opID !824, !opSignedness !6
  %cmp19 = icmp slt i32 %15, -12288, !opID !825, !opSignedness !6
  br i1 %cmp19, label %if.then20, label %if.end21, !opID !826, !opSignedness !6

if.then20:                                        ; preds = %if.end18
  store i32 -12288, i32* %apl2, align 4, !opID !827, !opSignedness !6
  br label %if.end21, !opID !828, !opSignedness !6

if.end21:                                         ; preds = %if.then20, %if.end18
  %16 = load i32, i32* %apl2, align 4, !opID !829, !opSignedness !6
  %17 = bitcast i32* %apl2 to i8*, !opID !830, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #6, !opID !831, !opSignedness !6
  %18 = bitcast i64* %wd4 to i8*, !opID !832, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #6, !opID !833, !opSignedness !6
  %19 = bitcast i64* %wd2 to i8*, !opID !834, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #6, !opID !835, !opSignedness !6
  ret i32 %16, !opID !836, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @uppol1(i32 %al1, i32 %apl2, i32 %plt, i32 %plt1) #4 {
entry:
  %al1.addr = alloca i32, align 4, !opID !837, !opSignedness !6
  %apl2.addr = alloca i32, align 4, !opID !838, !opSignedness !6
  %plt.addr = alloca i32, align 4, !opID !839, !opSignedness !6
  %plt1.addr = alloca i32, align 4, !opID !840, !opSignedness !6
  %wd2 = alloca i64, align 8, !opID !841, !opSignedness !6
  %wd3 = alloca i32, align 4, !opID !842, !opSignedness !6
  %apl1 = alloca i32, align 4, !opID !843, !opSignedness !6
  store i32 %al1, i32* %al1.addr, align 4, !opID !844, !opSignedness !6
  store i32 %apl2, i32* %apl2.addr, align 4, !opID !845, !opSignedness !6
  store i32 %plt, i32* %plt.addr, align 4, !opID !846, !opSignedness !6
  store i32 %plt1, i32* %plt1.addr, align 4, !opID !847, !opSignedness !6
  %0 = bitcast i64* %wd2 to i8*, !opID !848, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #6, !opID !849, !opSignedness !6
  %1 = bitcast i32* %wd3 to i8*, !opID !850, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6, !opID !851, !opSignedness !6
  %2 = bitcast i32* %apl1 to i8*, !opID !852, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #6, !opID !853, !opSignedness !6
  %3 = load i32, i32* %al1.addr, align 4, !opID !854, !opSignedness !6
  %conv = sext i32 %3 to i64, !opID !855, !opSignedness !6
  %mul = mul i64 %conv, 255, !opID !856, !opSignedness !6
  %shr = ashr i64 %mul, 8, !opID !857, !opSignedness !6
  store i64 %shr, i64* %wd2, align 8, !opID !858, !opSignedness !6
  %4 = load i32, i32* %plt.addr, align 4, !opID !859, !opSignedness !6
  %conv1 = sext i32 %4 to i64, !opID !860, !opSignedness !6
  %5 = load i32, i32* %plt1.addr, align 4, !opID !861, !opSignedness !6
  %conv2 = sext i32 %5 to i64, !opID !862, !opSignedness !6
  %mul3 = mul i64 %conv1, %conv2, !opID !863, !opSignedness !6
  %cmp = icmp sge i64 %mul3, 0, !opID !864, !opSignedness !6
  br i1 %cmp, label %if.then, label %if.else, !opID !865, !opSignedness !6

if.then:                                          ; preds = %entry
  %6 = load i64, i64* %wd2, align 8, !opID !866, !opSignedness !6
  %conv4 = trunc i64 %6 to i32, !opID !867, !opSignedness !6
  %add = add i32 %conv4, 192, !opID !868, !opSignedness !6
  store i32 %add, i32* %apl1, align 4, !opID !869, !opSignedness !6
  br label %if.end, !opID !870, !opSignedness !6

if.else:                                          ; preds = %entry
  %7 = load i64, i64* %wd2, align 8, !opID !871, !opSignedness !6
  %conv5 = trunc i64 %7 to i32, !opID !872, !opSignedness !6
  %sub = sub i32 %conv5, 192, !opID !873, !opSignedness !6
  store i32 %sub, i32* %apl1, align 4, !opID !874, !opSignedness !6
  br label %if.end, !opID !875, !opSignedness !6

if.end:                                           ; preds = %if.else, %if.then
  %8 = load i32, i32* %apl2.addr, align 4, !opID !876, !opSignedness !6
  %sub6 = sub i32 15360, %8, !opID !877, !opSignedness !6
  store i32 %sub6, i32* %wd3, align 4, !opID !878, !opSignedness !6
  %9 = load i32, i32* %apl1, align 4, !opID !879, !opSignedness !6
  %10 = load i32, i32* %wd3, align 4, !opID !880, !opSignedness !6
  %cmp7 = icmp sgt i32 %9, %10, !opID !881, !opSignedness !6
  br i1 %cmp7, label %if.then8, label %if.end9, !opID !882, !opSignedness !6

if.then8:                                         ; preds = %if.end
  %11 = load i32, i32* %wd3, align 4, !opID !883, !opSignedness !6
  store i32 %11, i32* %apl1, align 4, !opID !884, !opSignedness !6
  br label %if.end9, !opID !885, !opSignedness !6

if.end9:                                          ; preds = %if.then8, %if.end
  %12 = load i32, i32* %apl1, align 4, !opID !886, !opSignedness !6
  %13 = load i32, i32* %wd3, align 4, !opID !887, !opSignedness !6
  %sub10 = sub i32 0, %13, !opID !888, !opSignedness !6
  %cmp11 = icmp slt i32 %12, %sub10, !opID !889, !opSignedness !6
  br i1 %cmp11, label %if.then12, label %if.end14, !opID !890, !opSignedness !6

if.then12:                                        ; preds = %if.end9
  %14 = load i32, i32* %wd3, align 4, !opID !891, !opSignedness !6
  %sub13 = sub i32 0, %14, !opID !892, !opSignedness !6
  store i32 %sub13, i32* %apl1, align 4, !opID !893, !opSignedness !6
  br label %if.end14, !opID !894, !opSignedness !6

if.end14:                                         ; preds = %if.then12, %if.end9
  %15 = load i32, i32* %apl1, align 4, !opID !895, !opSignedness !6
  %16 = bitcast i32* %apl1 to i8*, !opID !896, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #6, !opID !897, !opSignedness !6
  %17 = bitcast i32* %wd3 to i8*, !opID !898, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #6, !opID !899, !opSignedness !6
  %18 = bitcast i64* %wd2 to i8*, !opID !900, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #6, !opID !901, !opSignedness !6
  ret i32 %15, !opID !902, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @logsch(i32 %ih, i32 %nbh) #4 {
entry:
  %ih.addr = alloca i32, align 4, !opID !903, !opSignedness !6
  %nbh.addr = alloca i32, align 4, !opID !904, !opSignedness !6
  %wd = alloca i32, align 4, !opID !905, !opSignedness !6
  store i32 %ih, i32* %ih.addr, align 4, !opID !906, !opSignedness !6
  store i32 %nbh, i32* %nbh.addr, align 4, !opID !907, !opSignedness !6
  %0 = bitcast i32* %wd to i8*, !opID !908, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !909, !opSignedness !6
  %1 = load i32, i32* %nbh.addr, align 4, !opID !910, !opSignedness !6
  %conv = sext i32 %1 to i64, !opID !911, !opSignedness !6
  %mul = mul i64 %conv, 127, !opID !912, !opSignedness !6
  %shr = ashr i64 %mul, 7, !opID !913, !opSignedness !6
  %conv1 = trunc i64 %shr to i32, !opID !914, !opSignedness !6
  store i32 %conv1, i32* %wd, align 4, !opID !915, !opSignedness !6
  %2 = load i32, i32* %wd, align 4, !opID !916, !opSignedness !6
  %3 = load i32, i32* %ih.addr, align 4, !opID !917, !opSignedness !6
  %idxprom = sext i32 %3 to i64, !opID !918, !opSignedness !6
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @wh_code_table, i64 0, i64 %idxprom, !opID !919, !opSignedness !6
  %4 = load i32, i32* %arrayidx, align 4, !opID !920, !opSignedness !6
  %add = add i32 %2, %4, !opID !921, !opSignedness !6
  store i32 %add, i32* %nbh.addr, align 4, !opID !922, !opSignedness !6
  %5 = load i32, i32* %nbh.addr, align 4, !opID !923, !opSignedness !6
  %cmp = icmp slt i32 %5, 0, !opID !924, !opSignedness !6
  br i1 %cmp, label %if.then, label %if.end, !opID !925, !opSignedness !6

if.then:                                          ; preds = %entry
  store i32 0, i32* %nbh.addr, align 4, !opID !926, !opSignedness !6
  br label %if.end, !opID !927, !opSignedness !6

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32, i32* %nbh.addr, align 4, !opID !928, !opSignedness !6
  %cmp2 = icmp sgt i32 %6, 22528, !opID !929, !opSignedness !6
  br i1 %cmp2, label %if.then3, label %if.end4, !opID !930, !opSignedness !6

if.then3:                                         ; preds = %if.end
  store i32 22528, i32* %nbh.addr, align 4, !opID !931, !opSignedness !6
  br label %if.end4, !opID !932, !opSignedness !6

if.end4:                                          ; preds = %if.then3, %if.end
  %7 = load i32, i32* %nbh.addr, align 4, !opID !933, !opSignedness !6
  %8 = bitcast i32* %wd to i8*, !opID !934, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #6, !opID !935, !opSignedness !6
  ret i32 %7, !opID !936, !opSignedness !6
}

; Function Attrs: nounwind
define void @decode(i32 %input) #4 {
entry:
  %input.addr = alloca i32, align 4, !opID !937, !opSignedness !6
  %i = alloca i32, align 4, !opID !938, !opSignedness !6
  %xa1 = alloca i64, align 8, !opID !939, !opSignedness !6
  %xa2 = alloca i64, align 8, !opID !940, !opSignedness !6
  %h_ptr = alloca i32*, align 8, !opID !941, !opSignedness !6
  %ac_ptr = alloca i32*, align 8, !opID !942, !opSignedness !6
  %ac_ptr1 = alloca i32*, align 8, !opID !943, !opSignedness !6
  %ad_ptr = alloca i32*, align 8, !opID !944, !opSignedness !6
  %ad_ptr1 = alloca i32*, align 8, !opID !945, !opSignedness !6
  store i32 %input, i32* %input.addr, align 4, !opID !946, !opSignedness !6
  %0 = bitcast i32* %i to i8*, !opID !947, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !948, !opSignedness !6
  %1 = bitcast i64* %xa1 to i8*, !opID !949, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #6, !opID !950, !opSignedness !6
  %2 = bitcast i64* %xa2 to i8*, !opID !951, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #6, !opID !952, !opSignedness !6
  %3 = bitcast i32** %h_ptr to i8*, !opID !953, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #6, !opID !954, !opSignedness !6
  %4 = bitcast i32** %ac_ptr to i8*, !opID !955, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #6, !opID !956, !opSignedness !6
  %5 = bitcast i32** %ac_ptr1 to i8*, !opID !957, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #6, !opID !958, !opSignedness !6
  %6 = bitcast i32** %ad_ptr to i8*, !opID !959, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #6, !opID !960, !opSignedness !6
  %7 = bitcast i32** %ad_ptr1 to i8*, !opID !961, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #6, !opID !962, !opSignedness !6
  %8 = load i32, i32* %input.addr, align 4, !opID !963, !opSignedness !6
  %and = and i32 %8, 63, !opID !964, !opSignedness !6
  store i32 %and, i32* @ilr, align 4, !opID !965, !opSignedness !6
  %9 = load i32, i32* %input.addr, align 4, !opID !966, !opSignedness !6
  %shr = ashr i32 %9, 6, !opID !967, !opSignedness !6
  store i32 %shr, i32* @ih, align 4, !opID !968, !opSignedness !6
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0)), !opID !969, !opSignedness !6
  store i32 %call, i32* @dec_szl, align 4, !opID !970, !opSignedness !6
  %10 = load i32, i32* @dec_rlt1, align 4, !opID !971, !opSignedness !6
  %11 = load i32, i32* @dec_al1, align 4, !opID !972, !opSignedness !6
  %12 = load i32, i32* @dec_rlt2, align 4, !opID !973, !opSignedness !6
  %13 = load i32, i32* @dec_al2, align 4, !opID !974, !opSignedness !6
  %call1 = call i32 @filtep(i32 %10, i32 %11, i32 %12, i32 %13), !opID !975, !opSignedness !6
  store i32 %call1, i32* @dec_spl, align 4, !opID !976, !opSignedness !6
  %14 = load i32, i32* @dec_spl, align 4, !opID !977, !opSignedness !6
  %15 = load i32, i32* @dec_szl, align 4, !opID !978, !opSignedness !6
  %add = add i32 %14, %15, !opID !979, !opSignedness !6
  store i32 %add, i32* @dec_sl, align 4, !opID !980, !opSignedness !6
  %16 = load i32, i32* @dec_detl, align 4, !opID !981, !opSignedness !6
  %conv = sext i32 %16 to i64, !opID !982, !opSignedness !6
  %17 = load i32, i32* @ilr, align 4, !opID !983, !opSignedness !6
  %shr2 = ashr i32 %17, 2, !opID !984, !opSignedness !6
  %idxprom = sext i32 %shr2 to i64, !opID !985, !opSignedness !6
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i64 0, i64 %idxprom, !opID !986, !opSignedness !6
  %18 = load i32, i32* %arrayidx, align 4, !opID !987, !opSignedness !6
  %conv3 = sext i32 %18 to i64, !opID !988, !opSignedness !6
  %mul = mul i64 %conv, %conv3, !opID !989, !opSignedness !6
  %shr4 = ashr i64 %mul, 15, !opID !990, !opSignedness !6
  %conv5 = trunc i64 %shr4 to i32, !opID !991, !opSignedness !6
  store i32 %conv5, i32* @dec_dlt, align 4, !opID !992, !opSignedness !6
  %19 = load i32, i32* @dec_detl, align 4, !opID !993, !opSignedness !6
  %conv6 = sext i32 %19 to i64, !opID !994, !opSignedness !6
  %20 = load i32, i32* @il, align 4, !opID !995, !opSignedness !6
  %idxprom7 = sext i32 %20 to i64, !opID !996, !opSignedness !6
  %arrayidx8 = getelementptr inbounds [64 x i32], [64 x i32]* @qq6_code6_table, i64 0, i64 %idxprom7, !opID !997, !opSignedness !6
  %21 = load i32, i32* %arrayidx8, align 4, !opID !998, !opSignedness !6
  %conv9 = sext i32 %21 to i64, !opID !999, !opSignedness !6
  %mul10 = mul i64 %conv6, %conv9, !opID !1000, !opSignedness !6
  %shr11 = ashr i64 %mul10, 15, !opID !1001, !opSignedness !6
  %conv12 = trunc i64 %shr11 to i32, !opID !1002, !opSignedness !6
  store i32 %conv12, i32* @dl, align 4, !opID !1003, !opSignedness !6
  %22 = load i32, i32* @dl, align 4, !opID !1004, !opSignedness !6
  %23 = load i32, i32* @dec_sl, align 4, !opID !1005, !opSignedness !6
  %add13 = add i32 %22, %23, !opID !1006, !opSignedness !6
  store i32 %add13, i32* @rl, align 4, !opID !1007, !opSignedness !6
  %24 = load i32, i32* @ilr, align 4, !opID !1008, !opSignedness !6
  %25 = load i32, i32* @dec_nbl, align 4, !opID !1009, !opSignedness !6
  %call14 = call i32 @logscl(i32 %24, i32 %25), !opID !1010, !opSignedness !6
  store i32 %call14, i32* @dec_nbl, align 4, !opID !1011, !opSignedness !6
  %26 = load i32, i32* @dec_nbl, align 4, !opID !1012, !opSignedness !6
  %call15 = call i32 @scalel(i32 %26, i32 8), !opID !1013, !opSignedness !6
  store i32 %call15, i32* @dec_detl, align 4, !opID !1014, !opSignedness !6
  %27 = load i32, i32* @dec_dlt, align 4, !opID !1015, !opSignedness !6
  %28 = load i32, i32* @dec_szl, align 4, !opID !1016, !opSignedness !6
  %add16 = add i32 %27, %28, !opID !1017, !opSignedness !6
  store i32 %add16, i32* @dec_plt, align 4, !opID !1018, !opSignedness !6
  %29 = load i32, i32* @dec_dlt, align 4, !opID !1019, !opSignedness !6
  call void @upzero(i32 %29, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0)), !opID !1020, !opSignedness !6
  %30 = load i32, i32* @dec_al1, align 4, !opID !1021, !opSignedness !6
  %31 = load i32, i32* @dec_al2, align 4, !opID !1022, !opSignedness !6
  %32 = load i32, i32* @dec_plt, align 4, !opID !1023, !opSignedness !6
  %33 = load i32, i32* @dec_plt1, align 4, !opID !1024, !opSignedness !6
  %34 = load i32, i32* @dec_plt2, align 4, !opID !1025, !opSignedness !6
  %call17 = call i32 @uppol2(i32 %30, i32 %31, i32 %32, i32 %33, i32 %34), !opID !1026, !opSignedness !6
  store i32 %call17, i32* @dec_al2, align 4, !opID !1027, !opSignedness !6
  %35 = load i32, i32* @dec_al1, align 4, !opID !1028, !opSignedness !6
  %36 = load i32, i32* @dec_al2, align 4, !opID !1029, !opSignedness !6
  %37 = load i32, i32* @dec_plt, align 4, !opID !1030, !opSignedness !6
  %38 = load i32, i32* @dec_plt1, align 4, !opID !1031, !opSignedness !6
  %call18 = call i32 @uppol1(i32 %35, i32 %36, i32 %37, i32 %38), !opID !1032, !opSignedness !6
  store i32 %call18, i32* @dec_al1, align 4, !opID !1033, !opSignedness !6
  %39 = load i32, i32* @dec_sl, align 4, !opID !1034, !opSignedness !6
  %40 = load i32, i32* @dec_dlt, align 4, !opID !1035, !opSignedness !6
  %add19 = add i32 %39, %40, !opID !1036, !opSignedness !6
  store i32 %add19, i32* @dec_rlt, align 4, !opID !1037, !opSignedness !6
  %41 = load i32, i32* @dec_rlt1, align 4, !opID !1038, !opSignedness !6
  store i32 %41, i32* @dec_rlt2, align 4, !opID !1039, !opSignedness !6
  %42 = load i32, i32* @dec_rlt, align 4, !opID !1040, !opSignedness !6
  store i32 %42, i32* @dec_rlt1, align 4, !opID !1041, !opSignedness !6
  %43 = load i32, i32* @dec_plt1, align 4, !opID !1042, !opSignedness !6
  store i32 %43, i32* @dec_plt2, align 4, !opID !1043, !opSignedness !6
  %44 = load i32, i32* @dec_plt, align 4, !opID !1044, !opSignedness !6
  store i32 %44, i32* @dec_plt1, align 4, !opID !1045, !opSignedness !6
  %call20 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0)), !opID !1046, !opSignedness !6
  store i32 %call20, i32* @dec_szh, align 4, !opID !1047, !opSignedness !6
  %45 = load i32, i32* @dec_rh1, align 4, !opID !1048, !opSignedness !6
  %46 = load i32, i32* @dec_ah1, align 4, !opID !1049, !opSignedness !6
  %47 = load i32, i32* @dec_rh2, align 4, !opID !1050, !opSignedness !6
  %48 = load i32, i32* @dec_ah2, align 4, !opID !1051, !opSignedness !6
  %call21 = call i32 @filtep(i32 %45, i32 %46, i32 %47, i32 %48), !opID !1052, !opSignedness !6
  store i32 %call21, i32* @dec_sph, align 4, !opID !1053, !opSignedness !6
  %49 = load i32, i32* @dec_sph, align 4, !opID !1054, !opSignedness !6
  %50 = load i32, i32* @dec_szh, align 4, !opID !1055, !opSignedness !6
  %add22 = add i32 %49, %50, !opID !1056, !opSignedness !6
  store i32 %add22, i32* @dec_sh, align 4, !opID !1057, !opSignedness !6
  %51 = load i32, i32* @dec_deth, align 4, !opID !1058, !opSignedness !6
  %conv23 = sext i32 %51 to i64, !opID !1059, !opSignedness !6
  %52 = load i32, i32* @ih, align 4, !opID !1060, !opSignedness !6
  %idxprom24 = sext i32 %52 to i64, !opID !1061, !opSignedness !6
  %arrayidx25 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i64 0, i64 %idxprom24, !opID !1062, !opSignedness !6
  %53 = load i32, i32* %arrayidx25, align 4, !opID !1063, !opSignedness !6
  %conv26 = sext i32 %53 to i64, !opID !1064, !opSignedness !6
  %mul27 = mul i64 %conv23, %conv26, !opID !1065, !opSignedness !6
  %shr28 = ashr i64 %mul27, 15, !opID !1066, !opSignedness !6
  %conv29 = trunc i64 %shr28 to i32, !opID !1067, !opSignedness !6
  store i32 %conv29, i32* @dec_dh, align 4, !opID !1068, !opSignedness !6
  %54 = load i32, i32* @ih, align 4, !opID !1069, !opSignedness !6
  %55 = load i32, i32* @dec_nbh, align 4, !opID !1070, !opSignedness !6
  %call30 = call i32 @logsch(i32 %54, i32 %55), !opID !1071, !opSignedness !6
  store i32 %call30, i32* @dec_nbh, align 4, !opID !1072, !opSignedness !6
  %56 = load i32, i32* @dec_nbh, align 4, !opID !1073, !opSignedness !6
  %call31 = call i32 @scalel(i32 %56, i32 10), !opID !1074, !opSignedness !6
  store i32 %call31, i32* @dec_deth, align 4, !opID !1075, !opSignedness !6
  %57 = load i32, i32* @dec_dh, align 4, !opID !1076, !opSignedness !6
  %58 = load i32, i32* @dec_szh, align 4, !opID !1077, !opSignedness !6
  %add32 = add i32 %57, %58, !opID !1078, !opSignedness !6
  store i32 %add32, i32* @dec_ph, align 4, !opID !1079, !opSignedness !6
  %59 = load i32, i32* @dec_dh, align 4, !opID !1080, !opSignedness !6
  call void @upzero(i32 %59, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0)), !opID !1081, !opSignedness !6
  %60 = load i32, i32* @dec_ah1, align 4, !opID !1082, !opSignedness !6
  %61 = load i32, i32* @dec_ah2, align 4, !opID !1083, !opSignedness !6
  %62 = load i32, i32* @dec_ph, align 4, !opID !1084, !opSignedness !6
  %63 = load i32, i32* @dec_ph1, align 4, !opID !1085, !opSignedness !6
  %64 = load i32, i32* @dec_ph2, align 4, !opID !1086, !opSignedness !6
  %call33 = call i32 @uppol2(i32 %60, i32 %61, i32 %62, i32 %63, i32 %64), !opID !1087, !opSignedness !6
  store i32 %call33, i32* @dec_ah2, align 4, !opID !1088, !opSignedness !6
  %65 = load i32, i32* @dec_ah1, align 4, !opID !1089, !opSignedness !6
  %66 = load i32, i32* @dec_ah2, align 4, !opID !1090, !opSignedness !6
  %67 = load i32, i32* @dec_ph, align 4, !opID !1091, !opSignedness !6
  %68 = load i32, i32* @dec_ph1, align 4, !opID !1092, !opSignedness !6
  %call34 = call i32 @uppol1(i32 %65, i32 %66, i32 %67, i32 %68), !opID !1093, !opSignedness !6
  store i32 %call34, i32* @dec_ah1, align 4, !opID !1094, !opSignedness !6
  %69 = load i32, i32* @dec_sh, align 4, !opID !1095, !opSignedness !6
  %70 = load i32, i32* @dec_dh, align 4, !opID !1096, !opSignedness !6
  %add35 = add i32 %69, %70, !opID !1097, !opSignedness !6
  store i32 %add35, i32* @rh, align 4, !opID !1098, !opSignedness !6
  %71 = load i32, i32* @dec_rh1, align 4, !opID !1099, !opSignedness !6
  store i32 %71, i32* @dec_rh2, align 4, !opID !1100, !opSignedness !6
  %72 = load i32, i32* @rh, align 4, !opID !1101, !opSignedness !6
  store i32 %72, i32* @dec_rh1, align 4, !opID !1102, !opSignedness !6
  %73 = load i32, i32* @dec_ph1, align 4, !opID !1103, !opSignedness !6
  store i32 %73, i32* @dec_ph2, align 4, !opID !1104, !opSignedness !6
  %74 = load i32, i32* @dec_ph, align 4, !opID !1105, !opSignedness !6
  store i32 %74, i32* @dec_ph1, align 4, !opID !1106, !opSignedness !6
  %75 = load i32, i32* @rl, align 4, !opID !1107, !opSignedness !6
  %76 = load i32, i32* @rh, align 4, !opID !1108, !opSignedness !6
  %sub = sub i32 %75, %76, !opID !1109, !opSignedness !6
  store i32 %sub, i32* @xd, align 4, !opID !1110, !opSignedness !6
  %77 = load i32, i32* @rl, align 4, !opID !1111, !opSignedness !6
  %78 = load i32, i32* @rh, align 4, !opID !1112, !opSignedness !6
  %add36 = add i32 %77, %78, !opID !1113, !opSignedness !6
  store i32 %add36, i32* @xs, align 4, !opID !1114, !opSignedness !6
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 8, !opID !1115, !opSignedness !6
  store i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 0), i32** %ac_ptr, align 8, !opID !1116, !opSignedness !6
  store i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 0), i32** %ad_ptr, align 8, !opID !1117, !opSignedness !6
  %79 = load i32, i32* @xd, align 4, !opID !1118, !opSignedness !6
  %conv37 = sext i32 %79 to i64, !opID !1119, !opSignedness !6
  %80 = load i32*, i32** %h_ptr, align 8, !opID !1120, !opSignedness !6
  %incdec.ptr = getelementptr inbounds i32, i32* %80, i32 1, !opID !1121, !opSignedness !6
  store i32* %incdec.ptr, i32** %h_ptr, align 8, !opID !1122, !opSignedness !6
  %81 = load i32, i32* %80, align 4, !opID !1123, !opSignedness !6
  %conv38 = sext i32 %81 to i64, !opID !1124, !opSignedness !6
  %mul39 = mul i64 %conv37, %conv38, !opID !1125, !opSignedness !6
  store i64 %mul39, i64* %xa1, align 8, !opID !1126, !opSignedness !6
  %82 = load i32, i32* @xs, align 4, !opID !1127, !opSignedness !6
  %conv40 = sext i32 %82 to i64, !opID !1128, !opSignedness !6
  %83 = load i32*, i32** %h_ptr, align 8, !opID !1129, !opSignedness !6
  %incdec.ptr41 = getelementptr inbounds i32, i32* %83, i32 1, !opID !1130, !opSignedness !6
  store i32* %incdec.ptr41, i32** %h_ptr, align 8, !opID !1131, !opSignedness !6
  %84 = load i32, i32* %83, align 4, !opID !1132, !opSignedness !6
  %conv42 = sext i32 %84 to i64, !opID !1133, !opSignedness !6
  %mul43 = mul i64 %conv40, %conv42, !opID !1134, !opSignedness !6
  store i64 %mul43, i64* %xa2, align 8, !opID !1135, !opSignedness !6
  br label %decode_label2, !opID !1136, !opSignedness !6

decode_label2:                                    ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !1137, !opSignedness !6
  br label %for.cond, !opID !1138, !opSignedness !6

for.cond:                                         ; preds = %for.inc, %decode_label2
  %85 = load i32, i32* %i, align 4, !opID !1139, !opSignedness !6
  %cmp = icmp slt i32 %85, 10, !opID !1140, !opSignedness !6
  br i1 %cmp, label %for.body, label %for.end, !opID !1141, !opSignedness !6

for.body:                                         ; preds = %for.cond
  %86 = load i32*, i32** %ac_ptr, align 8, !opID !1142, !opSignedness !6
  %incdec.ptr44 = getelementptr inbounds i32, i32* %86, i32 1, !opID !1143, !opSignedness !6
  store i32* %incdec.ptr44, i32** %ac_ptr, align 8, !opID !1144, !opSignedness !6
  %87 = load i32, i32* %86, align 4, !opID !1145, !opSignedness !6
  %conv45 = sext i32 %87 to i64, !opID !1146, !opSignedness !6
  %88 = load i32*, i32** %h_ptr, align 8, !opID !1147, !opSignedness !6
  %incdec.ptr46 = getelementptr inbounds i32, i32* %88, i32 1, !opID !1148, !opSignedness !6
  store i32* %incdec.ptr46, i32** %h_ptr, align 8, !opID !1149, !opSignedness !6
  %89 = load i32, i32* %88, align 4, !opID !1150, !opSignedness !6
  %conv47 = sext i32 %89 to i64, !opID !1151, !opSignedness !6
  %mul48 = mul i64 %conv45, %conv47, !opID !1152, !opSignedness !6
  %90 = load i64, i64* %xa1, align 8, !opID !1153, !opSignedness !6
  %add49 = add i64 %90, %mul48, !opID !1154, !opSignedness !6
  store i64 %add49, i64* %xa1, align 8, !opID !1155, !opSignedness !6
  %91 = load i32*, i32** %ad_ptr, align 8, !opID !1156, !opSignedness !6
  %incdec.ptr50 = getelementptr inbounds i32, i32* %91, i32 1, !opID !1157, !opSignedness !6
  store i32* %incdec.ptr50, i32** %ad_ptr, align 8, !opID !1158, !opSignedness !6
  %92 = load i32, i32* %91, align 4, !opID !1159, !opSignedness !6
  %conv51 = sext i32 %92 to i64, !opID !1160, !opSignedness !6
  %93 = load i32*, i32** %h_ptr, align 8, !opID !1161, !opSignedness !6
  %incdec.ptr52 = getelementptr inbounds i32, i32* %93, i32 1, !opID !1162, !opSignedness !6
  store i32* %incdec.ptr52, i32** %h_ptr, align 8, !opID !1163, !opSignedness !6
  %94 = load i32, i32* %93, align 4, !opID !1164, !opSignedness !6
  %conv53 = sext i32 %94 to i64, !opID !1165, !opSignedness !6
  %mul54 = mul i64 %conv51, %conv53, !opID !1166, !opSignedness !6
  %95 = load i64, i64* %xa2, align 8, !opID !1167, !opSignedness !6
  %add55 = add i64 %95, %mul54, !opID !1168, !opSignedness !6
  store i64 %add55, i64* %xa2, align 8, !opID !1169, !opSignedness !6
  br label %for.inc, !opID !1170, !opSignedness !6

for.inc:                                          ; preds = %for.body
  %96 = load i32, i32* %i, align 4, !opID !1171, !opSignedness !6
  %inc = add i32 %96, 1, !opID !1172, !opSignedness !6
  store i32 %inc, i32* %i, align 4, !opID !1173, !opSignedness !6
  br label %for.cond, !llvm.loop !1174, !opID !1176, !opSignedness !6

for.end:                                          ; preds = %for.cond
  %97 = load i32*, i32** %ac_ptr, align 8, !opID !1177, !opSignedness !6
  %98 = load i32, i32* %97, align 4, !opID !1178, !opSignedness !6
  %conv56 = sext i32 %98 to i64, !opID !1179, !opSignedness !6
  %99 = load i32*, i32** %h_ptr, align 8, !opID !1180, !opSignedness !6
  %incdec.ptr57 = getelementptr inbounds i32, i32* %99, i32 1, !opID !1181, !opSignedness !6
  store i32* %incdec.ptr57, i32** %h_ptr, align 8, !opID !1182, !opSignedness !6
  %100 = load i32, i32* %99, align 4, !opID !1183, !opSignedness !6
  %conv58 = sext i32 %100 to i64, !opID !1184, !opSignedness !6
  %mul59 = mul i64 %conv56, %conv58, !opID !1185, !opSignedness !6
  %101 = load i64, i64* %xa1, align 8, !opID !1186, !opSignedness !6
  %add60 = add i64 %101, %mul59, !opID !1187, !opSignedness !6
  store i64 %add60, i64* %xa1, align 8, !opID !1188, !opSignedness !6
  %102 = load i32*, i32** %ad_ptr, align 8, !opID !1189, !opSignedness !6
  %103 = load i32, i32* %102, align 4, !opID !1190, !opSignedness !6
  %conv61 = sext i32 %103 to i64, !opID !1191, !opSignedness !6
  %104 = load i32*, i32** %h_ptr, align 8, !opID !1192, !opSignedness !6
  %incdec.ptr62 = getelementptr inbounds i32, i32* %104, i32 1, !opID !1193, !opSignedness !6
  store i32* %incdec.ptr62, i32** %h_ptr, align 8, !opID !1194, !opSignedness !6
  %105 = load i32, i32* %104, align 4, !opID !1195, !opSignedness !6
  %conv63 = sext i32 %105 to i64, !opID !1196, !opSignedness !6
  %mul64 = mul i64 %conv61, %conv63, !opID !1197, !opSignedness !6
  %106 = load i64, i64* %xa2, align 8, !opID !1198, !opSignedness !6
  %add65 = add i64 %106, %mul64, !opID !1199, !opSignedness !6
  store i64 %add65, i64* %xa2, align 8, !opID !1200, !opSignedness !6
  %107 = load i64, i64* %xa1, align 8, !opID !1201, !opSignedness !6
  %shr66 = ashr i64 %107, 14, !opID !1202, !opSignedness !6
  %conv67 = trunc i64 %shr66 to i32, !opID !1203, !opSignedness !6
  store i32 %conv67, i32* @xout1, align 4, !opID !1204, !opSignedness !6
  %108 = load i64, i64* %xa2, align 8, !opID !1205, !opSignedness !6
  %shr68 = ashr i64 %108, 14, !opID !1206, !opSignedness !6
  %conv69 = trunc i64 %shr68 to i32, !opID !1207, !opSignedness !6
  store i32 %conv69, i32* @xout2, align 4, !opID !1208, !opSignedness !6
  %109 = load i32*, i32** %ac_ptr, align 8, !opID !1209, !opSignedness !6
  %add.ptr = getelementptr inbounds i32, i32* %109, i64 -1, !opID !1210, !opSignedness !6
  store i32* %add.ptr, i32** %ac_ptr1, align 8, !opID !1211, !opSignedness !6
  %110 = load i32*, i32** %ad_ptr, align 8, !opID !1212, !opSignedness !6
  %add.ptr70 = getelementptr inbounds i32, i32* %110, i64 -1, !opID !1213, !opSignedness !6
  store i32* %add.ptr70, i32** %ad_ptr1, align 8, !opID !1214, !opSignedness !6
  br label %decode_label3, !opID !1215, !opSignedness !6

decode_label3:                                    ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !1216, !opSignedness !6
  br label %for.cond71, !opID !1217, !opSignedness !6

for.cond71:                                       ; preds = %for.inc78, %decode_label3
  %111 = load i32, i32* %i, align 4, !opID !1218, !opSignedness !6
  %cmp72 = icmp slt i32 %111, 10, !opID !1219, !opSignedness !6
  br i1 %cmp72, label %for.body73, label %for.end80, !opID !1220, !opSignedness !6

for.body73:                                       ; preds = %for.cond71
  %112 = load i32*, i32** %ac_ptr1, align 8, !opID !1221, !opSignedness !6
  %incdec.ptr74 = getelementptr inbounds i32, i32* %112, i32 -1, !opID !1222, !opSignedness !6
  store i32* %incdec.ptr74, i32** %ac_ptr1, align 8, !opID !1223, !opSignedness !6
  %113 = load i32, i32* %112, align 4, !opID !1224, !opSignedness !6
  %114 = load i32*, i32** %ac_ptr, align 8, !opID !1225, !opSignedness !6
  %incdec.ptr75 = getelementptr inbounds i32, i32* %114, i32 -1, !opID !1226, !opSignedness !6
  store i32* %incdec.ptr75, i32** %ac_ptr, align 8, !opID !1227, !opSignedness !6
  store i32 %113, i32* %114, align 4, !opID !1228, !opSignedness !6
  %115 = load i32*, i32** %ad_ptr1, align 8, !opID !1229, !opSignedness !6
  %incdec.ptr76 = getelementptr inbounds i32, i32* %115, i32 -1, !opID !1230, !opSignedness !6
  store i32* %incdec.ptr76, i32** %ad_ptr1, align 8, !opID !1231, !opSignedness !6
  %116 = load i32, i32* %115, align 4, !opID !1232, !opSignedness !6
  %117 = load i32*, i32** %ad_ptr, align 8, !opID !1233, !opSignedness !6
  %incdec.ptr77 = getelementptr inbounds i32, i32* %117, i32 -1, !opID !1234, !opSignedness !6
  store i32* %incdec.ptr77, i32** %ad_ptr, align 8, !opID !1235, !opSignedness !6
  store i32 %116, i32* %117, align 4, !opID !1236, !opSignedness !6
  br label %for.inc78, !opID !1237, !opSignedness !6

for.inc78:                                        ; preds = %for.body73
  %118 = load i32, i32* %i, align 4, !opID !1238, !opSignedness !6
  %inc79 = add i32 %118, 1, !opID !1239, !opSignedness !6
  store i32 %inc79, i32* %i, align 4, !opID !1240, !opSignedness !6
  br label %for.cond71, !llvm.loop !1241, !opID !1243, !opSignedness !6

for.end80:                                        ; preds = %for.cond71
  %119 = load i32, i32* @xd, align 4, !opID !1244, !opSignedness !6
  %120 = load i32*, i32** %ac_ptr, align 8, !opID !1245, !opSignedness !6
  store i32 %119, i32* %120, align 4, !opID !1246, !opSignedness !6
  %121 = load i32, i32* @xs, align 4, !opID !1247, !opSignedness !6
  %122 = load i32*, i32** %ad_ptr, align 8, !opID !1248, !opSignedness !6
  store i32 %121, i32* %122, align 4, !opID !1249, !opSignedness !6
  %123 = bitcast i32** %ad_ptr1 to i8*, !opID !1250, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %123) #6, !opID !1251, !opSignedness !6
  %124 = bitcast i32** %ad_ptr to i8*, !opID !1252, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %124) #6, !opID !1253, !opSignedness !6
  %125 = bitcast i32** %ac_ptr1 to i8*, !opID !1254, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %125) #6, !opID !1255, !opSignedness !6
  %126 = bitcast i32** %ac_ptr to i8*, !opID !1256, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %126) #6, !opID !1257, !opSignedness !6
  %127 = bitcast i32** %h_ptr to i8*, !opID !1258, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %127) #6, !opID !1259, !opSignedness !6
  %128 = bitcast i64* %xa2 to i8*, !opID !1260, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %128) #6, !opID !1261, !opSignedness !6
  %129 = bitcast i64* %xa1 to i8*, !opID !1262, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %129) #6, !opID !1263, !opSignedness !6
  %130 = bitcast i32* %i to i8*, !opID !1264, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %130) #6, !opID !1265, !opSignedness !6
  ret void, !opID !1266, !opSignedness !6
}

; Function Attrs: nounwind
define void @reset() #4 {
entry:
  %i = alloca i32, align 4, !opID !1267, !opSignedness !6
  %0 = bitcast i32* %i to i8*, !opID !1268, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !1269, !opSignedness !6
  store i32 32, i32* @dec_detl, align 4, !opID !1270, !opSignedness !6
  store i32 32, i32* @detl, align 4, !opID !1271, !opSignedness !6
  store i32 8, i32* @dec_deth, align 4, !opID !1272, !opSignedness !6
  store i32 8, i32* @deth, align 4, !opID !1273, !opSignedness !6
  store i32 0, i32* @rlt2, align 4, !opID !1274, !opSignedness !6
  store i32 0, i32* @rlt1, align 4, !opID !1275, !opSignedness !6
  store i32 0, i32* @plt2, align 4, !opID !1276, !opSignedness !6
  store i32 0, i32* @plt1, align 4, !opID !1277, !opSignedness !6
  store i32 0, i32* @al2, align 4, !opID !1278, !opSignedness !6
  store i32 0, i32* @al1, align 4, !opID !1279, !opSignedness !6
  store i32 0, i32* @nbl, align 4, !opID !1280, !opSignedness !6
  store i32 0, i32* @rh2, align 4, !opID !1281, !opSignedness !6
  store i32 0, i32* @rh1, align 4, !opID !1282, !opSignedness !6
  store i32 0, i32* @ph2, align 4, !opID !1283, !opSignedness !6
  store i32 0, i32* @ph1, align 4, !opID !1284, !opSignedness !6
  store i32 0, i32* @ah2, align 4, !opID !1285, !opSignedness !6
  store i32 0, i32* @ah1, align 4, !opID !1286, !opSignedness !6
  store i32 0, i32* @nbh, align 4, !opID !1287, !opSignedness !6
  store i32 0, i32* @dec_rlt2, align 4, !opID !1288, !opSignedness !6
  store i32 0, i32* @dec_rlt1, align 4, !opID !1289, !opSignedness !6
  store i32 0, i32* @dec_plt2, align 4, !opID !1290, !opSignedness !6
  store i32 0, i32* @dec_plt1, align 4, !opID !1291, !opSignedness !6
  store i32 0, i32* @dec_al2, align 4, !opID !1292, !opSignedness !6
  store i32 0, i32* @dec_al1, align 4, !opID !1293, !opSignedness !6
  store i32 0, i32* @dec_nbl, align 4, !opID !1294, !opSignedness !6
  store i32 0, i32* @dec_rh2, align 4, !opID !1295, !opSignedness !6
  store i32 0, i32* @dec_rh1, align 4, !opID !1296, !opSignedness !6
  store i32 0, i32* @dec_ph2, align 4, !opID !1297, !opSignedness !6
  store i32 0, i32* @dec_ph1, align 4, !opID !1298, !opSignedness !6
  store i32 0, i32* @dec_ah2, align 4, !opID !1299, !opSignedness !6
  store i32 0, i32* @dec_ah1, align 4, !opID !1300, !opSignedness !6
  store i32 0, i32* @dec_nbh, align 4, !opID !1301, !opSignedness !6
  br label %reset_label4, !opID !1302, !opSignedness !6

reset_label4:                                     ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !1303, !opSignedness !6
  br label %for.cond, !opID !1304, !opSignedness !6

for.cond:                                         ; preds = %for.inc, %reset_label4
  %1 = load i32, i32* %i, align 4, !opID !1305, !opSignedness !6
  %cmp = icmp slt i32 %1, 6, !opID !1306, !opSignedness !6
  br i1 %cmp, label %for.body, label %for.end, !opID !1307, !opSignedness !6

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !opID !1308, !opSignedness !6
  %idxprom = sext i32 %2 to i64, !opID !1309, !opSignedness !6
  %arrayidx = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dltx, i64 0, i64 %idxprom, !opID !1310, !opSignedness !6
  store i32 0, i32* %arrayidx, align 4, !opID !1311, !opSignedness !6
  %3 = load i32, i32* %i, align 4, !opID !1312, !opSignedness !6
  %idxprom1 = sext i32 %3 to i64, !opID !1313, !opSignedness !6
  %arrayidx2 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dhx, i64 0, i64 %idxprom1, !opID !1314, !opSignedness !6
  store i32 0, i32* %arrayidx2, align 4, !opID !1315, !opSignedness !6
  %4 = load i32, i32* %i, align 4, !opID !1316, !opSignedness !6
  %idxprom3 = sext i32 %4 to i64, !opID !1317, !opSignedness !6
  %arrayidx4 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dltx, i64 0, i64 %idxprom3, !opID !1318, !opSignedness !6
  store i32 0, i32* %arrayidx4, align 4, !opID !1319, !opSignedness !6
  %5 = load i32, i32* %i, align 4, !opID !1320, !opSignedness !6
  %idxprom5 = sext i32 %5 to i64, !opID !1321, !opSignedness !6
  %arrayidx6 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dhx, i64 0, i64 %idxprom5, !opID !1322, !opSignedness !6
  store i32 0, i32* %arrayidx6, align 4, !opID !1323, !opSignedness !6
  br label %for.inc, !opID !1324, !opSignedness !6

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !opID !1325, !opSignedness !6
  %inc = add i32 %6, 1, !opID !1326, !opSignedness !6
  store i32 %inc, i32* %i, align 4, !opID !1327, !opSignedness !6
  br label %for.cond, !llvm.loop !1328, !opID !1330, !opSignedness !6

for.end:                                          ; preds = %for.cond
  br label %reset_label5, !opID !1331, !opSignedness !6

reset_label5:                                     ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !1332, !opSignedness !6
  br label %for.cond7, !opID !1333, !opSignedness !6

for.cond7:                                        ; preds = %for.inc18, %reset_label5
  %7 = load i32, i32* %i, align 4, !opID !1334, !opSignedness !6
  %cmp8 = icmp slt i32 %7, 6, !opID !1335, !opSignedness !6
  br i1 %cmp8, label %for.body9, label %for.end20, !opID !1336, !opSignedness !6

for.body9:                                        ; preds = %for.cond7
  %8 = load i32, i32* %i, align 4, !opID !1337, !opSignedness !6
  %idxprom10 = sext i32 %8 to i64, !opID !1338, !opSignedness !6
  %arrayidx11 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bpl, i64 0, i64 %idxprom10, !opID !1339, !opSignedness !6
  store i32 0, i32* %arrayidx11, align 4, !opID !1340, !opSignedness !6
  %9 = load i32, i32* %i, align 4, !opID !1341, !opSignedness !6
  %idxprom12 = sext i32 %9 to i64, !opID !1342, !opSignedness !6
  %arrayidx13 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bph, i64 0, i64 %idxprom12, !opID !1343, !opSignedness !6
  store i32 0, i32* %arrayidx13, align 4, !opID !1344, !opSignedness !6
  %10 = load i32, i32* %i, align 4, !opID !1345, !opSignedness !6
  %idxprom14 = sext i32 %10 to i64, !opID !1346, !opSignedness !6
  %arrayidx15 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bpl, i64 0, i64 %idxprom14, !opID !1347, !opSignedness !6
  store i32 0, i32* %arrayidx15, align 4, !opID !1348, !opSignedness !6
  %11 = load i32, i32* %i, align 4, !opID !1349, !opSignedness !6
  %idxprom16 = sext i32 %11 to i64, !opID !1350, !opSignedness !6
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bph, i64 0, i64 %idxprom16, !opID !1351, !opSignedness !6
  store i32 0, i32* %arrayidx17, align 4, !opID !1352, !opSignedness !6
  br label %for.inc18, !opID !1353, !opSignedness !6

for.inc18:                                        ; preds = %for.body9
  %12 = load i32, i32* %i, align 4, !opID !1354, !opSignedness !6
  %inc19 = add i32 %12, 1, !opID !1355, !opSignedness !6
  store i32 %inc19, i32* %i, align 4, !opID !1356, !opSignedness !6
  br label %for.cond7, !llvm.loop !1357, !opID !1359, !opSignedness !6

for.end20:                                        ; preds = %for.cond7
  br label %reset_label6, !opID !1360, !opSignedness !6

reset_label6:                                     ; preds = %for.end20
  store i32 0, i32* %i, align 4, !opID !1361, !opSignedness !6
  br label %for.cond21, !opID !1362, !opSignedness !6

for.cond21:                                       ; preds = %for.inc26, %reset_label6
  %13 = load i32, i32* %i, align 4, !opID !1363, !opSignedness !6
  %cmp22 = icmp slt i32 %13, 24, !opID !1364, !opSignedness !6
  br i1 %cmp22, label %for.body23, label %for.end28, !opID !1365, !opSignedness !6

for.body23:                                       ; preds = %for.cond21
  %14 = load i32, i32* %i, align 4, !opID !1366, !opSignedness !6
  %idxprom24 = sext i32 %14 to i64, !opID !1367, !opSignedness !6
  %arrayidx25 = getelementptr inbounds [24 x i32], [24 x i32]* @tqmf, i64 0, i64 %idxprom24, !opID !1368, !opSignedness !6
  store i32 0, i32* %arrayidx25, align 4, !opID !1369, !opSignedness !6
  br label %for.inc26, !opID !1370, !opSignedness !6

for.inc26:                                        ; preds = %for.body23
  %15 = load i32, i32* %i, align 4, !opID !1371, !opSignedness !6
  %inc27 = add i32 %15, 1, !opID !1372, !opSignedness !6
  store i32 %inc27, i32* %i, align 4, !opID !1373, !opSignedness !6
  br label %for.cond21, !llvm.loop !1374, !opID !1376, !opSignedness !6

for.end28:                                        ; preds = %for.cond21
  br label %reset_label7, !opID !1377, !opSignedness !6

reset_label7:                                     ; preds = %for.end28
  store i32 0, i32* %i, align 4, !opID !1378, !opSignedness !6
  br label %for.cond29, !opID !1379, !opSignedness !6

for.cond29:                                       ; preds = %for.inc36, %reset_label7
  %16 = load i32, i32* %i, align 4, !opID !1380, !opSignedness !6
  %cmp30 = icmp slt i32 %16, 11, !opID !1381, !opSignedness !6
  br i1 %cmp30, label %for.body31, label %for.end38, !opID !1382, !opSignedness !6

for.body31:                                       ; preds = %for.cond29
  %17 = load i32, i32* %i, align 4, !opID !1383, !opSignedness !6
  %idxprom32 = sext i32 %17 to i64, !opID !1384, !opSignedness !6
  %arrayidx33 = getelementptr inbounds [11 x i32], [11 x i32]* @accumc, i64 0, i64 %idxprom32, !opID !1385, !opSignedness !6
  store i32 0, i32* %arrayidx33, align 4, !opID !1386, !opSignedness !6
  %18 = load i32, i32* %i, align 4, !opID !1387, !opSignedness !6
  %idxprom34 = sext i32 %18 to i64, !opID !1388, !opSignedness !6
  %arrayidx35 = getelementptr inbounds [11 x i32], [11 x i32]* @accumd, i64 0, i64 %idxprom34, !opID !1389, !opSignedness !6
  store i32 0, i32* %arrayidx35, align 4, !opID !1390, !opSignedness !6
  br label %for.inc36, !opID !1391, !opSignedness !6

for.inc36:                                        ; preds = %for.body31
  %19 = load i32, i32* %i, align 4, !opID !1392, !opSignedness !6
  %inc37 = add i32 %19, 1, !opID !1393, !opSignedness !6
  store i32 %inc37, i32* %i, align 4, !opID !1394, !opSignedness !6
  br label %for.cond29, !llvm.loop !1395, !opID !1397, !opSignedness !6

for.end38:                                        ; preds = %for.cond29
  %20 = bitcast i32* %i to i8*, !opID !1398, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #6, !opID !1399, !opSignedness !6
  ret void, !opID !1400, !opSignedness !6
}

; Function Attrs: nounwind
define void @adpcm_main(i32* "fpga.decayed.dim.hint"="8000" %input_samples, i32* "fpga.decayed.dim.hint"="4000" %compressed, i32* "fpga.decayed.dim.hint"="8000" %result) #5 !fpga.function.pragma !1401 {
entry:
  %input_samples.addr = alloca i32*, align 8, !opID !1403, !opSignedness !6
  %compressed.addr = alloca i32*, align 8, !opID !1404, !opSignedness !6
  %result.addr = alloca i32*, align 8, !opID !1405, !opSignedness !6
  %i = alloca i32, align 4, !opID !1406, !opSignedness !6
  %j = alloca i32, align 4, !opID !1407, !opSignedness !6
  store i32* %input_samples, i32** %input_samples.addr, align 8, !opID !1408, !opSignedness !6
  store i32* %compressed, i32** %compressed.addr, align 8, !opID !1409, !opSignedness !6
  store i32* %result, i32** %result.addr, align 8, !opID !1410, !opSignedness !6
  %0 = bitcast i32* %i to i8*, !opID !1411, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !1412, !opSignedness !6
  %1 = bitcast i32* %j to i8*, !opID !1413, !opSignedness !6
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6, !opID !1414, !opSignedness !6
  call void @reset(), !opID !1415, !opSignedness !6
  store i32 10, i32* %j, align 4, !opID !1416, !opSignedness !6
  br label %adpcm_main_label12, !opID !1417, !opSignedness !6

adpcm_main_label12:                               ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !1418, !opSignedness !6
  br label %for.cond, !opID !1419, !opSignedness !6

for.cond:                                         ; preds = %for.inc, %adpcm_main_label12
  %2 = load i32, i32* %i, align 4, !opID !1420, !opSignedness !6
  %cmp = icmp slt i32 %2, 8000, !opID !1421, !opSignedness !6
  br i1 %cmp, label %for.body, label %for.end, !opID !1422, !opSignedness !6

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %input_samples.addr, align 8, !opID !1423, !opSignedness !6
  %4 = load i32, i32* %i, align 4, !opID !1424, !opSignedness !6
  %idxprom = sext i32 %4 to i64, !opID !1425, !opSignedness !6
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !opID !1426, !opSignedness !6
  %5 = load i32, i32* %arrayidx, align 4, !opID !1427, !opSignedness !6
  %6 = load i32*, i32** %input_samples.addr, align 8, !opID !1428, !opSignedness !6
  %7 = load i32, i32* %i, align 4, !opID !1429, !opSignedness !6
  %add = add i32 %7, 1, !opID !1430, !opSignedness !6
  %idxprom1 = sext i32 %add to i64, !opID !1431, !opSignedness !6
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %idxprom1, !opID !1432, !opSignedness !6
  %8 = load i32, i32* %arrayidx2, align 4, !opID !1433, !opSignedness !6
  %call = call i32 @encode(i32 %5, i32 %8), !opID !1434, !opSignedness !6
  %9 = load i32*, i32** %compressed.addr, align 8, !opID !1435, !opSignedness !6
  %10 = load i32, i32* %i, align 4, !opID !1436, !opSignedness !6
  %div = sdiv i32 %10, 2, !opID !1437, !opSignedness !6
  %idxprom3 = sext i32 %div to i64, !opID !1438, !opSignedness !6
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %idxprom3, !opID !1439, !opSignedness !6
  store i32 %call, i32* %arrayidx4, align 4, !opID !1440, !opSignedness !6
  br label %for.inc, !opID !1441, !opSignedness !6

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !opID !1442, !opSignedness !6
  %add5 = add i32 %11, 2, !opID !1443, !opSignedness !6
  store i32 %add5, i32* %i, align 4, !opID !1444, !opSignedness !6
  br label %for.cond, !llvm.loop !1445, !opID !1447, !opSignedness !6

for.end:                                          ; preds = %for.cond
  br label %adpcm_main_label13, !opID !1448, !opSignedness !6

adpcm_main_label13:                               ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !1449, !opSignedness !6
  br label %for.cond6, !opID !1450, !opSignedness !6

for.cond6:                                        ; preds = %for.inc17, %adpcm_main_label13
  %12 = load i32, i32* %i, align 4, !opID !1451, !opSignedness !6
  %cmp7 = icmp slt i32 %12, 8000, !opID !1452, !opSignedness !6
  br i1 %cmp7, label %for.body8, label %for.end19, !opID !1453, !opSignedness !6

for.body8:                                        ; preds = %for.cond6
  %13 = load i32*, i32** %compressed.addr, align 8, !opID !1454, !opSignedness !6
  %14 = load i32, i32* %i, align 4, !opID !1455, !opSignedness !6
  %div9 = sdiv i32 %14, 2, !opID !1456, !opSignedness !6
  %idxprom10 = sext i32 %div9 to i64, !opID !1457, !opSignedness !6
  %arrayidx11 = getelementptr inbounds i32, i32* %13, i64 %idxprom10, !opID !1458, !opSignedness !6
  %15 = load i32, i32* %arrayidx11, align 4, !opID !1459, !opSignedness !6
  call void @decode(i32 %15), !opID !1460, !opSignedness !6
  %16 = load i32, i32* @xout1, align 4, !opID !1461, !opSignedness !6
  %17 = load i32*, i32** %result.addr, align 8, !opID !1462, !opSignedness !6
  %18 = load i32, i32* %i, align 4, !opID !1463, !opSignedness !6
  %idxprom12 = sext i32 %18 to i64, !opID !1464, !opSignedness !6
  %arrayidx13 = getelementptr inbounds i32, i32* %17, i64 %idxprom12, !opID !1465, !opSignedness !6
  store i32 %16, i32* %arrayidx13, align 4, !opID !1466, !opSignedness !6
  %19 = load i32, i32* @xout2, align 4, !opID !1467, !opSignedness !6
  %20 = load i32*, i32** %result.addr, align 8, !opID !1468, !opSignedness !6
  %21 = load i32, i32* %i, align 4, !opID !1469, !opSignedness !6
  %add14 = add i32 %21, 1, !opID !1470, !opSignedness !6
  %idxprom15 = sext i32 %add14 to i64, !opID !1471, !opSignedness !6
  %arrayidx16 = getelementptr inbounds i32, i32* %20, i64 %idxprom15, !opID !1472, !opSignedness !6
  store i32 %19, i32* %arrayidx16, align 4, !opID !1473, !opSignedness !6
  br label %for.inc17, !opID !1474, !opSignedness !6

for.inc17:                                        ; preds = %for.body8
  %22 = load i32, i32* %i, align 4, !opID !1475, !opSignedness !6
  %add18 = add i32 %22, 2, !opID !1476, !opSignedness !6
  store i32 %add18, i32* %i, align 4, !opID !1477, !opSignedness !6
  br label %for.cond6, !llvm.loop !1478, !opID !1480, !opSignedness !6

for.end19:                                        ; preds = %for.cond6
  %23 = bitcast i32* %j to i8*, !opID !1481, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %23) #6, !opID !1482, !opSignedness !6
  %24 = bitcast i32* %i to i8*, !opID !1483, !opSignedness !6
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %24) #6, !opID !1484, !opSignedness !6
  ret void, !opID !4, !opSignedness !6
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.top.func"="adpcm_main" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readnone willreturn }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!opIDCounter = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 2, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i64 1450}
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
!130 = distinct !{!130, !131}
!131 = !{!"llvm.loop.name", !"encode_label0"}
!132 = !{i64 125}
!133 = !{i64 126}
!134 = !{i64 127}
!135 = !{i64 128}
!136 = !{i64 129}
!137 = !{i64 130}
!138 = !{i64 131}
!139 = !{i64 132}
!140 = !{i64 133}
!141 = !{i64 134}
!142 = !{i64 135}
!143 = !{i64 136}
!144 = !{i64 137}
!145 = !{i64 138}
!146 = !{i64 139}
!147 = !{i64 140}
!148 = !{i64 141}
!149 = !{i64 142}
!150 = !{i64 143}
!151 = !{i64 144}
!152 = !{i64 145}
!153 = !{i64 146}
!154 = !{i64 147}
!155 = !{i64 148}
!156 = !{i64 149}
!157 = !{i64 150}
!158 = !{i64 151}
!159 = !{i64 152}
!160 = !{i64 153}
!161 = !{i64 154}
!162 = !{i64 155}
!163 = !{i64 156}
!164 = !{i64 157}
!165 = !{i64 158}
!166 = !{i64 159}
!167 = !{i64 160}
!168 = !{i64 161}
!169 = !{i64 162}
!170 = !{i64 163}
!171 = !{i64 164}
!172 = !{i64 165}
!173 = !{i64 166}
!174 = !{i64 167}
!175 = !{i64 168}
!176 = !{i64 169}
!177 = !{i64 170}
!178 = !{i64 171}
!179 = !{i64 172}
!180 = distinct !{!180, !181}
!181 = !{!"llvm.loop.name", !"encode_label1"}
!182 = !{i64 173}
!183 = !{i64 174}
!184 = !{i64 175}
!185 = !{i64 176}
!186 = !{i64 177}
!187 = !{i64 178}
!188 = !{i64 179}
!189 = !{i64 180}
!190 = !{i64 181}
!191 = !{i64 182}
!192 = !{i64 183}
!193 = !{i64 184}
!194 = !{i64 185}
!195 = !{i64 186}
!196 = !{i64 187}
!197 = !{i64 188}
!198 = !{i64 189}
!199 = !{i64 190}
!200 = !{i64 191}
!201 = !{i64 192}
!202 = !{i64 193}
!203 = !{i64 194}
!204 = !{i64 195}
!205 = !{i64 196}
!206 = !{i64 197}
!207 = !{i64 198}
!208 = !{i64 199}
!209 = !{i64 200}
!210 = !{i64 201}
!211 = !{i64 202}
!212 = !{i64 203}
!213 = !{i64 204}
!214 = !{i64 205}
!215 = !{i64 206}
!216 = !{i64 207}
!217 = !{i64 208}
!218 = !{i64 209}
!219 = !{i64 210}
!220 = !{i64 211}
!221 = !{i64 212}
!222 = !{i64 213}
!223 = !{i64 214}
!224 = !{i64 215}
!225 = !{i64 216}
!226 = !{i64 217}
!227 = !{i64 218}
!228 = !{i64 219}
!229 = !{i64 220}
!230 = !{i64 221}
!231 = !{i64 222}
!232 = !{i64 223}
!233 = !{i64 224}
!234 = !{i64 225}
!235 = !{i64 226}
!236 = !{i64 227}
!237 = !{i64 228}
!238 = !{i64 229}
!239 = !{i64 230}
!240 = !{i64 231}
!241 = !{i64 232}
!242 = !{i64 233}
!243 = !{i64 234}
!244 = !{i64 235}
!245 = !{i64 236}
!246 = !{i64 237}
!247 = !{i64 238}
!248 = !{i64 239}
!249 = !{i64 240}
!250 = !{i64 241}
!251 = !{i64 242}
!252 = !{i64 243}
!253 = !{i64 244}
!254 = !{i64 245}
!255 = !{i64 246}
!256 = !{i64 247}
!257 = !{i64 248}
!258 = !{i64 249}
!259 = !{i64 250}
!260 = !{i64 251}
!261 = !{i64 252}
!262 = !{i64 253}
!263 = !{i64 254}
!264 = !{i64 255}
!265 = !{i64 256}
!266 = !{i64 257}
!267 = !{i64 258}
!268 = !{i64 259}
!269 = !{i64 260}
!270 = !{i64 261}
!271 = !{i64 262}
!272 = !{i64 263}
!273 = !{i64 264}
!274 = !{i64 265}
!275 = !{i64 266}
!276 = !{i64 267}
!277 = !{i64 268}
!278 = !{i64 269}
!279 = !{i64 270}
!280 = !{i64 271}
!281 = !{i64 272}
!282 = !{i64 273}
!283 = !{i64 274}
!284 = !{i64 275}
!285 = !{i64 276}
!286 = !{i64 277}
!287 = !{i64 278}
!288 = !{i64 279}
!289 = !{i64 280}
!290 = !{i64 281}
!291 = !{i64 282}
!292 = !{i64 283}
!293 = !{i64 284}
!294 = !{i64 285}
!295 = !{i64 286}
!296 = !{i64 287}
!297 = !{i64 288}
!298 = !{i64 289}
!299 = !{i64 290}
!300 = !{i64 291}
!301 = !{i64 292}
!302 = !{i64 293}
!303 = !{i64 294}
!304 = !{i64 295}
!305 = !{i64 296}
!306 = !{i64 297}
!307 = !{i64 298}
!308 = !{i64 299}
!309 = !{i64 300}
!310 = !{i64 301}
!311 = !{i64 302}
!312 = !{i64 303}
!313 = !{i64 304}
!314 = !{i64 305}
!315 = !{i64 306}
!316 = !{i64 307}
!317 = !{i64 308}
!318 = !{i64 309}
!319 = !{i64 310}
!320 = !{i64 311}
!321 = !{i64 312}
!322 = !{i64 313}
!323 = !{i64 314}
!324 = !{i64 315}
!325 = !{i64 316}
!326 = !{i64 317}
!327 = !{i64 318}
!328 = !{i64 319}
!329 = !{i64 320}
!330 = !{i64 321}
!331 = !{i64 322}
!332 = !{i64 323}
!333 = !{i64 324}
!334 = !{i64 325}
!335 = !{i64 326}
!336 = !{i64 327}
!337 = !{i64 328}
!338 = !{i64 329}
!339 = !{i64 330}
!340 = !{i64 331}
!341 = !{i64 332}
!342 = !{i64 333}
!343 = !{i64 334}
!344 = !{i64 335}
!345 = !{i64 336}
!346 = !{i64 337}
!347 = !{i64 338}
!348 = !{i64 339}
!349 = !{i64 340}
!350 = !{i64 341}
!351 = !{i64 342}
!352 = !{i64 343}
!353 = !{i64 344}
!354 = !{i64 345}
!355 = !{i64 346}
!356 = !{i64 347}
!357 = !{i64 348}
!358 = !{i64 349}
!359 = !{i64 350}
!360 = !{i64 351}
!361 = !{i64 352}
!362 = !{i64 353}
!363 = !{i64 354}
!364 = !{i64 355}
!365 = !{i64 356}
!366 = !{i64 357}
!367 = !{i64 358}
!368 = !{i64 359}
!369 = !{i64 360}
!370 = !{i64 361}
!371 = !{i64 362}
!372 = !{i64 363}
!373 = !{i64 364}
!374 = !{i64 365}
!375 = !{i64 366}
!376 = !{i64 367}
!377 = !{i64 368}
!378 = !{i64 369}
!379 = !{i64 370}
!380 = !{i64 371}
!381 = !{i64 372}
!382 = !{i64 373}
!383 = !{i64 374}
!384 = !{i64 375}
!385 = !{i64 376}
!386 = !{i64 377}
!387 = !{i64 378}
!388 = !{i64 379}
!389 = !{i64 380}
!390 = !{i64 381}
!391 = !{i64 382}
!392 = !{i64 383}
!393 = !{i64 384}
!394 = !{i64 385}
!395 = !{i64 386}
!396 = !{i64 387}
!397 = !{i64 388}
!398 = !{i64 389}
!399 = !{i64 390}
!400 = !{i64 391}
!401 = !{i64 392}
!402 = !{i64 393}
!403 = !{i64 394}
!404 = !{i64 395}
!405 = !{i64 396}
!406 = !{i64 397}
!407 = !{i64 398}
!408 = !{i64 399}
!409 = !{i64 400}
!410 = !{i64 401}
!411 = !{i64 402}
!412 = !{i64 403}
!413 = !{i64 404}
!414 = !{i64 405}
!415 = !{i64 406}
!416 = !{i64 407}
!417 = !{i64 408}
!418 = !{i64 409}
!419 = !{i64 410}
!420 = !{i64 411}
!421 = !{i64 412}
!422 = !{i64 413}
!423 = !{i64 414}
!424 = !{i64 415}
!425 = distinct !{!425, !426}
!426 = !{!"llvm.loop.name", !"filtez_label8"}
!427 = !{i64 416}
!428 = !{i64 417}
!429 = !{i64 418}
!430 = !{i64 419}
!431 = !{i64 420}
!432 = !{i64 421}
!433 = !{i64 422}
!434 = !{i64 423}
!435 = !{i64 424}
!436 = !{i64 425}
!437 = !{i64 426}
!438 = !{i64 427}
!439 = !{i64 428}
!440 = !{i64 429}
!441 = !{i64 430}
!442 = !{i64 431}
!443 = !{i64 432}
!444 = !{i64 433}
!445 = !{i64 434}
!446 = !{i64 435}
!447 = !{i64 436}
!448 = !{i64 437}
!449 = !{i64 438}
!450 = !{i64 439}
!451 = !{i64 440}
!452 = !{i64 441}
!453 = !{i64 442}
!454 = !{i64 443}
!455 = !{i64 444}
!456 = !{i64 445}
!457 = !{i64 446}
!458 = !{i64 447}
!459 = !{i64 448}
!460 = !{i64 449}
!461 = !{i64 450}
!462 = !{i64 451}
!463 = !{i64 452}
!464 = !{i64 453}
!465 = !{i64 454}
!466 = !{i64 455}
!467 = !{i64 456}
!468 = !{i64 457}
!469 = !{i64 458}
!470 = !{i64 459}
!471 = !{i64 460}
!472 = !{i64 461}
!473 = !{i64 462}
!474 = !{i64 463}
!475 = !{i64 464}
!476 = !{i64 465}
!477 = !{i64 466}
!478 = !{i64 467}
!479 = !{i64 468}
!480 = !{i64 469}
!481 = !{i64 470}
!482 = !{i64 471}
!483 = !{i64 472}
!484 = !{i64 473}
!485 = !{i64 474}
!486 = !{i64 475}
!487 = !{i64 476}
!488 = !{i64 477}
!489 = !{i64 478}
!490 = !{i64 479}
!491 = !{i64 480}
!492 = !{i64 481}
!493 = !{i64 482}
!494 = !{i64 483}
!495 = !{i64 484}
!496 = !{i64 485}
!497 = !{i64 486}
!498 = !{i64 487}
!499 = !{i64 488}
!500 = !{i64 489}
!501 = !{i64 490}
!502 = !{i64 491}
!503 = !{i64 492}
!504 = !{i64 493}
!505 = !{i64 494}
!506 = !{i64 495}
!507 = !{i64 496}
!508 = !{i64 497}
!509 = !{i64 498}
!510 = !{i64 499}
!511 = !{i64 500}
!512 = !{i64 501}
!513 = !{i64 502}
!514 = !{i64 503}
!515 = !{i64 504}
!516 = !{i64 505}
!517 = !{i64 506}
!518 = !{i64 507}
!519 = !{i64 508}
!520 = !{i64 509}
!521 = !{i64 510}
!522 = !{i64 511}
!523 = distinct !{!523, !524}
!524 = !{!"llvm.loop.name", !"quantl_label9"}
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
!640 = !{i64 627}
!641 = !{i64 628}
!642 = !{i64 629}
!643 = !{i64 630}
!644 = !{i64 631}
!645 = !{i64 632}
!646 = !{i64 633}
!647 = !{i64 634}
!648 = !{i64 635}
!649 = !{i64 636}
!650 = !{i64 637}
!651 = !{i64 638}
!652 = !{i64 639}
!653 = !{i64 640}
!654 = !{i64 641}
!655 = !{i64 642}
!656 = !{i64 643}
!657 = !{i64 644}
!658 = !{i64 645}
!659 = !{i64 646}
!660 = !{i64 647}
!661 = !{i64 648}
!662 = !{i64 649}
!663 = !{i64 650}
!664 = !{i64 651}
!665 = !{i64 652}
!666 = !{i64 653}
!667 = distinct !{!667, !668}
!668 = !{!"llvm.loop.name", !"upzero_label10"}
!669 = !{i64 654}
!670 = !{i64 655}
!671 = !{i64 656}
!672 = !{i64 657}
!673 = !{i64 658}
!674 = !{i64 659}
!675 = !{i64 660}
!676 = !{i64 661}
!677 = !{i64 662}
!678 = !{i64 663}
!679 = !{i64 664}
!680 = !{i64 665}
!681 = !{i64 666}
!682 = !{i64 667}
!683 = !{i64 668}
!684 = !{i64 669}
!685 = !{i64 670}
!686 = !{i64 671}
!687 = !{i64 672}
!688 = !{i64 673}
!689 = !{i64 674}
!690 = !{i64 675}
!691 = !{i64 676}
!692 = !{i64 677}
!693 = !{i64 678}
!694 = !{i64 679}
!695 = !{i64 680}
!696 = !{i64 681}
!697 = !{i64 682}
!698 = !{i64 683}
!699 = !{i64 684}
!700 = !{i64 685}
!701 = !{i64 686}
!702 = !{i64 687}
!703 = !{i64 688}
!704 = !{i64 689}
!705 = !{i64 690}
!706 = !{i64 691}
!707 = !{i64 692}
!708 = !{i64 693}
!709 = !{i64 694}
!710 = !{i64 695}
!711 = !{i64 696}
!712 = !{i64 697}
!713 = !{i64 698}
!714 = distinct !{!714, !715}
!715 = !{!"llvm.loop.name", !"upzero_label11"}
!716 = !{i64 699}
!717 = !{i64 700}
!718 = !{i64 701}
!719 = !{i64 702}
!720 = !{i64 703}
!721 = !{i64 704}
!722 = !{i64 705}
!723 = !{i64 706}
!724 = !{i64 707}
!725 = !{i64 708}
!726 = !{i64 709}
!727 = !{i64 710}
!728 = !{i64 711}
!729 = !{i64 712}
!730 = !{i64 713}
!731 = !{i64 714}
!732 = !{i64 715}
!733 = !{i64 716}
!734 = !{i64 717}
!735 = !{i64 718}
!736 = !{i64 719}
!737 = !{i64 720}
!738 = !{i64 721}
!739 = !{i64 722}
!740 = !{i64 723}
!741 = !{i64 724}
!742 = !{i64 725}
!743 = !{i64 726}
!744 = !{i64 727}
!745 = !{i64 728}
!746 = !{i64 729}
!747 = !{i64 730}
!748 = !{i64 731}
!749 = !{i64 732}
!750 = !{i64 733}
!751 = !{i64 734}
!752 = !{i64 735}
!753 = !{i64 736}
!754 = !{i64 737}
!755 = !{i64 738}
!756 = !{i64 739}
!757 = !{i64 740}
!758 = !{i64 741}
!759 = !{i64 742}
!760 = !{i64 743}
!761 = !{i64 744}
!762 = !{i64 745}
!763 = !{i64 746}
!764 = !{i64 747}
!765 = !{i64 748}
!766 = !{i64 749}
!767 = !{i64 750}
!768 = !{i64 751}
!769 = !{i64 752}
!770 = !{i64 753}
!771 = !{i64 754}
!772 = !{i64 755}
!773 = !{i64 756}
!774 = !{i64 757}
!775 = !{i64 758}
!776 = !{i64 759}
!777 = !{i64 760}
!778 = !{i64 761}
!779 = !{i64 762}
!780 = !{i64 763}
!781 = !{i64 764}
!782 = !{i64 765}
!783 = !{i64 766}
!784 = !{i64 767}
!785 = !{i64 768}
!786 = !{i64 769}
!787 = !{i64 770}
!788 = !{i64 771}
!789 = !{i64 772}
!790 = !{i64 773}
!791 = !{i64 774}
!792 = !{i64 775}
!793 = !{i64 776}
!794 = !{i64 777}
!795 = !{i64 778}
!796 = !{i64 779}
!797 = !{i64 780}
!798 = !{i64 781}
!799 = !{i64 782}
!800 = !{i64 783}
!801 = !{i64 784}
!802 = !{i64 785}
!803 = !{i64 786}
!804 = !{i64 787}
!805 = !{i64 788}
!806 = !{i64 789}
!807 = !{i64 790}
!808 = !{i64 791}
!809 = !{i64 792}
!810 = !{i64 793}
!811 = !{i64 794}
!812 = !{i64 795}
!813 = !{i64 796}
!814 = !{i64 797}
!815 = !{i64 798}
!816 = !{i64 799}
!817 = !{i64 800}
!818 = !{i64 801}
!819 = !{i64 802}
!820 = !{i64 803}
!821 = !{i64 804}
!822 = !{i64 805}
!823 = !{i64 806}
!824 = !{i64 807}
!825 = !{i64 808}
!826 = !{i64 809}
!827 = !{i64 810}
!828 = !{i64 811}
!829 = !{i64 812}
!830 = !{i64 813}
!831 = !{i64 814}
!832 = !{i64 815}
!833 = !{i64 816}
!834 = !{i64 817}
!835 = !{i64 818}
!836 = !{i64 819}
!837 = !{i64 820}
!838 = !{i64 821}
!839 = !{i64 822}
!840 = !{i64 823}
!841 = !{i64 824}
!842 = !{i64 825}
!843 = !{i64 826}
!844 = !{i64 827}
!845 = !{i64 828}
!846 = !{i64 829}
!847 = !{i64 830}
!848 = !{i64 831}
!849 = !{i64 832}
!850 = !{i64 833}
!851 = !{i64 834}
!852 = !{i64 835}
!853 = !{i64 836}
!854 = !{i64 837}
!855 = !{i64 838}
!856 = !{i64 839}
!857 = !{i64 840}
!858 = !{i64 841}
!859 = !{i64 842}
!860 = !{i64 843}
!861 = !{i64 844}
!862 = !{i64 845}
!863 = !{i64 846}
!864 = !{i64 847}
!865 = !{i64 848}
!866 = !{i64 849}
!867 = !{i64 850}
!868 = !{i64 851}
!869 = !{i64 852}
!870 = !{i64 853}
!871 = !{i64 854}
!872 = !{i64 855}
!873 = !{i64 856}
!874 = !{i64 857}
!875 = !{i64 858}
!876 = !{i64 859}
!877 = !{i64 860}
!878 = !{i64 861}
!879 = !{i64 862}
!880 = !{i64 863}
!881 = !{i64 864}
!882 = !{i64 865}
!883 = !{i64 866}
!884 = !{i64 867}
!885 = !{i64 868}
!886 = !{i64 869}
!887 = !{i64 870}
!888 = !{i64 871}
!889 = !{i64 872}
!890 = !{i64 873}
!891 = !{i64 874}
!892 = !{i64 875}
!893 = !{i64 876}
!894 = !{i64 877}
!895 = !{i64 878}
!896 = !{i64 879}
!897 = !{i64 880}
!898 = !{i64 881}
!899 = !{i64 882}
!900 = !{i64 883}
!901 = !{i64 884}
!902 = !{i64 885}
!903 = !{i64 886}
!904 = !{i64 887}
!905 = !{i64 888}
!906 = !{i64 889}
!907 = !{i64 890}
!908 = !{i64 891}
!909 = !{i64 892}
!910 = !{i64 893}
!911 = !{i64 894}
!912 = !{i64 895}
!913 = !{i64 896}
!914 = !{i64 897}
!915 = !{i64 898}
!916 = !{i64 899}
!917 = !{i64 900}
!918 = !{i64 901}
!919 = !{i64 902}
!920 = !{i64 903}
!921 = !{i64 904}
!922 = !{i64 905}
!923 = !{i64 906}
!924 = !{i64 907}
!925 = !{i64 908}
!926 = !{i64 909}
!927 = !{i64 910}
!928 = !{i64 911}
!929 = !{i64 912}
!930 = !{i64 913}
!931 = !{i64 914}
!932 = !{i64 915}
!933 = !{i64 916}
!934 = !{i64 917}
!935 = !{i64 918}
!936 = !{i64 919}
!937 = !{i64 920}
!938 = !{i64 921}
!939 = !{i64 922}
!940 = !{i64 923}
!941 = !{i64 924}
!942 = !{i64 925}
!943 = !{i64 926}
!944 = !{i64 927}
!945 = !{i64 928}
!946 = !{i64 929}
!947 = !{i64 930}
!948 = !{i64 931}
!949 = !{i64 932}
!950 = !{i64 933}
!951 = !{i64 934}
!952 = !{i64 935}
!953 = !{i64 936}
!954 = !{i64 937}
!955 = !{i64 938}
!956 = !{i64 939}
!957 = !{i64 940}
!958 = !{i64 941}
!959 = !{i64 942}
!960 = !{i64 943}
!961 = !{i64 944}
!962 = !{i64 945}
!963 = !{i64 946}
!964 = !{i64 947}
!965 = !{i64 948}
!966 = !{i64 949}
!967 = !{i64 950}
!968 = !{i64 951}
!969 = !{i64 952}
!970 = !{i64 953}
!971 = !{i64 954}
!972 = !{i64 955}
!973 = !{i64 956}
!974 = !{i64 957}
!975 = !{i64 958}
!976 = !{i64 959}
!977 = !{i64 960}
!978 = !{i64 961}
!979 = !{i64 962}
!980 = !{i64 963}
!981 = !{i64 964}
!982 = !{i64 965}
!983 = !{i64 966}
!984 = !{i64 967}
!985 = !{i64 968}
!986 = !{i64 969}
!987 = !{i64 970}
!988 = !{i64 971}
!989 = !{i64 972}
!990 = !{i64 973}
!991 = !{i64 974}
!992 = !{i64 975}
!993 = !{i64 976}
!994 = !{i64 977}
!995 = !{i64 978}
!996 = !{i64 979}
!997 = !{i64 980}
!998 = !{i64 981}
!999 = !{i64 982}
!1000 = !{i64 983}
!1001 = !{i64 984}
!1002 = !{i64 985}
!1003 = !{i64 986}
!1004 = !{i64 987}
!1005 = !{i64 988}
!1006 = !{i64 989}
!1007 = !{i64 990}
!1008 = !{i64 991}
!1009 = !{i64 992}
!1010 = !{i64 993}
!1011 = !{i64 994}
!1012 = !{i64 995}
!1013 = !{i64 996}
!1014 = !{i64 997}
!1015 = !{i64 998}
!1016 = !{i64 999}
!1017 = !{i64 1000}
!1018 = !{i64 1001}
!1019 = !{i64 1002}
!1020 = !{i64 1003}
!1021 = !{i64 1004}
!1022 = !{i64 1005}
!1023 = !{i64 1006}
!1024 = !{i64 1007}
!1025 = !{i64 1008}
!1026 = !{i64 1009}
!1027 = !{i64 1010}
!1028 = !{i64 1011}
!1029 = !{i64 1012}
!1030 = !{i64 1013}
!1031 = !{i64 1014}
!1032 = !{i64 1015}
!1033 = !{i64 1016}
!1034 = !{i64 1017}
!1035 = !{i64 1018}
!1036 = !{i64 1019}
!1037 = !{i64 1020}
!1038 = !{i64 1021}
!1039 = !{i64 1022}
!1040 = !{i64 1023}
!1041 = !{i64 1024}
!1042 = !{i64 1025}
!1043 = !{i64 1026}
!1044 = !{i64 1027}
!1045 = !{i64 1028}
!1046 = !{i64 1029}
!1047 = !{i64 1030}
!1048 = !{i64 1031}
!1049 = !{i64 1032}
!1050 = !{i64 1033}
!1051 = !{i64 1034}
!1052 = !{i64 1035}
!1053 = !{i64 1036}
!1054 = !{i64 1037}
!1055 = !{i64 1038}
!1056 = !{i64 1039}
!1057 = !{i64 1040}
!1058 = !{i64 1041}
!1059 = !{i64 1042}
!1060 = !{i64 1043}
!1061 = !{i64 1044}
!1062 = !{i64 1045}
!1063 = !{i64 1046}
!1064 = !{i64 1047}
!1065 = !{i64 1048}
!1066 = !{i64 1049}
!1067 = !{i64 1050}
!1068 = !{i64 1051}
!1069 = !{i64 1052}
!1070 = !{i64 1053}
!1071 = !{i64 1054}
!1072 = !{i64 1055}
!1073 = !{i64 1056}
!1074 = !{i64 1057}
!1075 = !{i64 1058}
!1076 = !{i64 1059}
!1077 = !{i64 1060}
!1078 = !{i64 1061}
!1079 = !{i64 1062}
!1080 = !{i64 1063}
!1081 = !{i64 1064}
!1082 = !{i64 1065}
!1083 = !{i64 1066}
!1084 = !{i64 1067}
!1085 = !{i64 1068}
!1086 = !{i64 1069}
!1087 = !{i64 1070}
!1088 = !{i64 1071}
!1089 = !{i64 1072}
!1090 = !{i64 1073}
!1091 = !{i64 1074}
!1092 = !{i64 1075}
!1093 = !{i64 1076}
!1094 = !{i64 1077}
!1095 = !{i64 1078}
!1096 = !{i64 1079}
!1097 = !{i64 1080}
!1098 = !{i64 1081}
!1099 = !{i64 1082}
!1100 = !{i64 1083}
!1101 = !{i64 1084}
!1102 = !{i64 1085}
!1103 = !{i64 1086}
!1104 = !{i64 1087}
!1105 = !{i64 1088}
!1106 = !{i64 1089}
!1107 = !{i64 1090}
!1108 = !{i64 1091}
!1109 = !{i64 1092}
!1110 = !{i64 1093}
!1111 = !{i64 1094}
!1112 = !{i64 1095}
!1113 = !{i64 1096}
!1114 = !{i64 1097}
!1115 = !{i64 1098}
!1116 = !{i64 1099}
!1117 = !{i64 1100}
!1118 = !{i64 1101}
!1119 = !{i64 1102}
!1120 = !{i64 1103}
!1121 = !{i64 1104}
!1122 = !{i64 1105}
!1123 = !{i64 1106}
!1124 = !{i64 1107}
!1125 = !{i64 1108}
!1126 = !{i64 1109}
!1127 = !{i64 1110}
!1128 = !{i64 1111}
!1129 = !{i64 1112}
!1130 = !{i64 1113}
!1131 = !{i64 1114}
!1132 = !{i64 1115}
!1133 = !{i64 1116}
!1134 = !{i64 1117}
!1135 = !{i64 1118}
!1136 = !{i64 1119}
!1137 = !{i64 1120}
!1138 = !{i64 1121}
!1139 = !{i64 1122}
!1140 = !{i64 1123}
!1141 = !{i64 1124}
!1142 = !{i64 1125}
!1143 = !{i64 1126}
!1144 = !{i64 1127}
!1145 = !{i64 1128}
!1146 = !{i64 1129}
!1147 = !{i64 1130}
!1148 = !{i64 1131}
!1149 = !{i64 1132}
!1150 = !{i64 1133}
!1151 = !{i64 1134}
!1152 = !{i64 1135}
!1153 = !{i64 1136}
!1154 = !{i64 1137}
!1155 = !{i64 1138}
!1156 = !{i64 1139}
!1157 = !{i64 1140}
!1158 = !{i64 1141}
!1159 = !{i64 1142}
!1160 = !{i64 1143}
!1161 = !{i64 1144}
!1162 = !{i64 1145}
!1163 = !{i64 1146}
!1164 = !{i64 1147}
!1165 = !{i64 1148}
!1166 = !{i64 1149}
!1167 = !{i64 1150}
!1168 = !{i64 1151}
!1169 = !{i64 1152}
!1170 = !{i64 1153}
!1171 = !{i64 1154}
!1172 = !{i64 1155}
!1173 = !{i64 1156}
!1174 = distinct !{!1174, !1175}
!1175 = !{!"llvm.loop.name", !"decode_label2"}
!1176 = !{i64 1157}
!1177 = !{i64 1158}
!1178 = !{i64 1159}
!1179 = !{i64 1160}
!1180 = !{i64 1161}
!1181 = !{i64 1162}
!1182 = !{i64 1163}
!1183 = !{i64 1164}
!1184 = !{i64 1165}
!1185 = !{i64 1166}
!1186 = !{i64 1167}
!1187 = !{i64 1168}
!1188 = !{i64 1169}
!1189 = !{i64 1170}
!1190 = !{i64 1171}
!1191 = !{i64 1172}
!1192 = !{i64 1173}
!1193 = !{i64 1174}
!1194 = !{i64 1175}
!1195 = !{i64 1176}
!1196 = !{i64 1177}
!1197 = !{i64 1178}
!1198 = !{i64 1179}
!1199 = !{i64 1180}
!1200 = !{i64 1181}
!1201 = !{i64 1182}
!1202 = !{i64 1183}
!1203 = !{i64 1184}
!1204 = !{i64 1185}
!1205 = !{i64 1186}
!1206 = !{i64 1187}
!1207 = !{i64 1188}
!1208 = !{i64 1189}
!1209 = !{i64 1190}
!1210 = !{i64 1191}
!1211 = !{i64 1192}
!1212 = !{i64 1193}
!1213 = !{i64 1194}
!1214 = !{i64 1195}
!1215 = !{i64 1196}
!1216 = !{i64 1197}
!1217 = !{i64 1198}
!1218 = !{i64 1199}
!1219 = !{i64 1200}
!1220 = !{i64 1201}
!1221 = !{i64 1202}
!1222 = !{i64 1203}
!1223 = !{i64 1204}
!1224 = !{i64 1205}
!1225 = !{i64 1206}
!1226 = !{i64 1207}
!1227 = !{i64 1208}
!1228 = !{i64 1209}
!1229 = !{i64 1210}
!1230 = !{i64 1211}
!1231 = !{i64 1212}
!1232 = !{i64 1213}
!1233 = !{i64 1214}
!1234 = !{i64 1215}
!1235 = !{i64 1216}
!1236 = !{i64 1217}
!1237 = !{i64 1218}
!1238 = !{i64 1219}
!1239 = !{i64 1220}
!1240 = !{i64 1221}
!1241 = distinct !{!1241, !1242}
!1242 = !{!"llvm.loop.name", !"decode_label3"}
!1243 = !{i64 1222}
!1244 = !{i64 1223}
!1245 = !{i64 1224}
!1246 = !{i64 1225}
!1247 = !{i64 1226}
!1248 = !{i64 1227}
!1249 = !{i64 1228}
!1250 = !{i64 1229}
!1251 = !{i64 1230}
!1252 = !{i64 1231}
!1253 = !{i64 1232}
!1254 = !{i64 1233}
!1255 = !{i64 1234}
!1256 = !{i64 1235}
!1257 = !{i64 1236}
!1258 = !{i64 1237}
!1259 = !{i64 1238}
!1260 = !{i64 1239}
!1261 = !{i64 1240}
!1262 = !{i64 1241}
!1263 = !{i64 1242}
!1264 = !{i64 1243}
!1265 = !{i64 1244}
!1266 = !{i64 1245}
!1267 = !{i64 1246}
!1268 = !{i64 1247}
!1269 = !{i64 1248}
!1270 = !{i64 1249}
!1271 = !{i64 1250}
!1272 = !{i64 1251}
!1273 = !{i64 1252}
!1274 = !{i64 1253}
!1275 = !{i64 1254}
!1276 = !{i64 1255}
!1277 = !{i64 1256}
!1278 = !{i64 1257}
!1279 = !{i64 1258}
!1280 = !{i64 1259}
!1281 = !{i64 1260}
!1282 = !{i64 1261}
!1283 = !{i64 1262}
!1284 = !{i64 1263}
!1285 = !{i64 1264}
!1286 = !{i64 1265}
!1287 = !{i64 1266}
!1288 = !{i64 1267}
!1289 = !{i64 1268}
!1290 = !{i64 1269}
!1291 = !{i64 1270}
!1292 = !{i64 1271}
!1293 = !{i64 1272}
!1294 = !{i64 1273}
!1295 = !{i64 1274}
!1296 = !{i64 1275}
!1297 = !{i64 1276}
!1298 = !{i64 1277}
!1299 = !{i64 1278}
!1300 = !{i64 1279}
!1301 = !{i64 1280}
!1302 = !{i64 1281}
!1303 = !{i64 1282}
!1304 = !{i64 1283}
!1305 = !{i64 1284}
!1306 = !{i64 1285}
!1307 = !{i64 1286}
!1308 = !{i64 1287}
!1309 = !{i64 1288}
!1310 = !{i64 1289}
!1311 = !{i64 1290}
!1312 = !{i64 1291}
!1313 = !{i64 1292}
!1314 = !{i64 1293}
!1315 = !{i64 1294}
!1316 = !{i64 1295}
!1317 = !{i64 1296}
!1318 = !{i64 1297}
!1319 = !{i64 1298}
!1320 = !{i64 1299}
!1321 = !{i64 1300}
!1322 = !{i64 1301}
!1323 = !{i64 1302}
!1324 = !{i64 1303}
!1325 = !{i64 1304}
!1326 = !{i64 1305}
!1327 = !{i64 1306}
!1328 = distinct !{!1328, !1329}
!1329 = !{!"llvm.loop.name", !"reset_label4"}
!1330 = !{i64 1307}
!1331 = !{i64 1308}
!1332 = !{i64 1309}
!1333 = !{i64 1310}
!1334 = !{i64 1311}
!1335 = !{i64 1312}
!1336 = !{i64 1313}
!1337 = !{i64 1314}
!1338 = !{i64 1315}
!1339 = !{i64 1316}
!1340 = !{i64 1317}
!1341 = !{i64 1318}
!1342 = !{i64 1319}
!1343 = !{i64 1320}
!1344 = !{i64 1321}
!1345 = !{i64 1322}
!1346 = !{i64 1323}
!1347 = !{i64 1324}
!1348 = !{i64 1325}
!1349 = !{i64 1326}
!1350 = !{i64 1327}
!1351 = !{i64 1328}
!1352 = !{i64 1329}
!1353 = !{i64 1330}
!1354 = !{i64 1331}
!1355 = !{i64 1332}
!1356 = !{i64 1333}
!1357 = distinct !{!1357, !1358}
!1358 = !{!"llvm.loop.name", !"reset_label5"}
!1359 = !{i64 1334}
!1360 = !{i64 1335}
!1361 = !{i64 1336}
!1362 = !{i64 1337}
!1363 = !{i64 1338}
!1364 = !{i64 1339}
!1365 = !{i64 1340}
!1366 = !{i64 1341}
!1367 = !{i64 1342}
!1368 = !{i64 1343}
!1369 = !{i64 1344}
!1370 = !{i64 1345}
!1371 = !{i64 1346}
!1372 = !{i64 1347}
!1373 = !{i64 1348}
!1374 = distinct !{!1374, !1375}
!1375 = !{!"llvm.loop.name", !"reset_label6"}
!1376 = !{i64 1349}
!1377 = !{i64 1350}
!1378 = !{i64 1351}
!1379 = !{i64 1352}
!1380 = !{i64 1353}
!1381 = !{i64 1354}
!1382 = !{i64 1355}
!1383 = !{i64 1356}
!1384 = !{i64 1357}
!1385 = !{i64 1358}
!1386 = !{i64 1359}
!1387 = !{i64 1360}
!1388 = !{i64 1361}
!1389 = !{i64 1362}
!1390 = !{i64 1363}
!1391 = !{i64 1364}
!1392 = !{i64 1365}
!1393 = !{i64 1366}
!1394 = !{i64 1367}
!1395 = distinct !{!1395, !1396}
!1396 = !{!"llvm.loop.name", !"reset_label7"}
!1397 = !{i64 1368}
!1398 = !{i64 1369}
!1399 = !{i64 1370}
!1400 = !{i64 1371}
!1401 = !{!1402}
!1402 = !{!"fpga.top", !"user"}
!1403 = !{i64 1372}
!1404 = !{i64 1373}
!1405 = !{i64 1374}
!1406 = !{i64 1375}
!1407 = !{i64 1376}
!1408 = !{i64 1377}
!1409 = !{i64 1378}
!1410 = !{i64 1379}
!1411 = !{i64 1380}
!1412 = !{i64 1381}
!1413 = !{i64 1382}
!1414 = !{i64 1383}
!1415 = !{i64 1384}
!1416 = !{i64 1385}
!1417 = !{i64 1386}
!1418 = !{i64 1387}
!1419 = !{i64 1388}
!1420 = !{i64 1389}
!1421 = !{i64 1390}
!1422 = !{i64 1391}
!1423 = !{i64 1392}
!1424 = !{i64 1393}
!1425 = !{i64 1394}
!1426 = !{i64 1395}
!1427 = !{i64 1396}
!1428 = !{i64 1397}
!1429 = !{i64 1398}
!1430 = !{i64 1399}
!1431 = !{i64 1400}
!1432 = !{i64 1401}
!1433 = !{i64 1402}
!1434 = !{i64 1403}
!1435 = !{i64 1404}
!1436 = !{i64 1405}
!1437 = !{i64 1406}
!1438 = !{i64 1407}
!1439 = !{i64 1408}
!1440 = !{i64 1409}
!1441 = !{i64 1410}
!1442 = !{i64 1411}
!1443 = !{i64 1412}
!1444 = !{i64 1413}
!1445 = distinct !{!1445, !1446}
!1446 = !{!"llvm.loop.name", !"adpcm_main_label12"}
!1447 = !{i64 1414}
!1448 = !{i64 1415}
!1449 = !{i64 1416}
!1450 = !{i64 1417}
!1451 = !{i64 1418}
!1452 = !{i64 1419}
!1453 = !{i64 1420}
!1454 = !{i64 1421}
!1455 = !{i64 1422}
!1456 = !{i64 1423}
!1457 = !{i64 1424}
!1458 = !{i64 1425}
!1459 = !{i64 1426}
!1460 = !{i64 1427}
!1461 = !{i64 1428}
!1462 = !{i64 1429}
!1463 = !{i64 1430}
!1464 = !{i64 1431}
!1465 = !{i64 1432}
!1466 = !{i64 1433}
!1467 = !{i64 1434}
!1468 = !{i64 1435}
!1469 = !{i64 1436}
!1470 = !{i64 1437}
!1471 = !{i64 1438}
!1472 = !{i64 1439}
!1473 = !{i64 1440}
!1474 = !{i64 1441}
!1475 = !{i64 1442}
!1476 = !{i64 1443}
!1477 = !{i64 1444}
!1478 = distinct !{!1478, !1479}
!1479 = !{!"llvm.loop.name", !"adpcm_main_label13"}
!1480 = !{i64 1445}
!1481 = !{i64 1446}
!1482 = !{i64 1447}
!1483 = !{i64 1448}
!1484 = !{i64 1449}
