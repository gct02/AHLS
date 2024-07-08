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
  %retval = alloca i32, align 4, !opID !5, !opCode !6, !bitwidth !7, !numUses !8
  %argc.addr = alloca i32, align 4, !opID !9, !opCode !6, !bitwidth !7, !numUses !8
  %argv.addr = alloca i8**, align 8, !opID !10, !opCode !6, !bitwidth !7, !numUses !11
  store i32 0, i32* %retval, align 4, !opID !12, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %argc, i32* %argc.addr, align 4, !opID !14, !opCode !13, !bitwidth !7, !numUses !7
  store i8** %argv, i8*** %argv.addr, align 8, !opID !15, !opCode !13, !bitwidth !7, !numUses !7
  %0 = load i8**, i8*** %argv.addr, align 8, !opID !16, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !opID !18, !opCode !19, !bitwidth !7, !numUses !8
  %1 = load i8*, i8** %arrayidx, align 8, !opID !20, !opCode !17, !bitwidth !7, !numUses !8
  call void @populateInput(i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @test_data, i32 0, i32 0), i32 8000, i8* %1), !opID !21, !opCode !22, !bitwidth !7, !numUses !7
  call void @adpcm_main(i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @test_data, i32 0, i32 0), i32* getelementptr inbounds ([4000 x i32], [4000 x i32]* @compressed, i32 0, i32 0), i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @result, i32 0, i32 0)), !opID !23, !opCode !22, !bitwidth !7, !numUses !7
  %2 = load i8**, i8*** %argv.addr, align 8, !opID !24, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2, !opID !25, !opCode !19, !bitwidth !7, !numUses !8
  %3 = load i8*, i8** %arrayidx1, align 8, !opID !26, !opCode !17, !bitwidth !7, !numUses !8
  call void @populateOutput(i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @result, i32 0, i32 0), i32 4000, i8* %3), !opID !27, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 0, !opID !28, !opCode !29, !bitwidth !7, !numUses !7
}

declare void @populateInput(i32*, i32, i8*) #1

declare void @populateOutput(i32*, i32, i8*) #1

; Function Attrs: nounwind readnone willreturn
define i32 @abs(i32 %n) #2 {
entry:
  %n.addr = alloca i32, align 4, !opID !30, !opCode !6, !bitwidth !7, !numUses !31
  %m = alloca i32, align 4, !opID !32, !opCode !6, !bitwidth !7, !numUses !33
  store i32 %n, i32* %n.addr, align 4, !opID !34, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %m to i8*, !opID !35, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !37, !opCode !22, !bitwidth !7, !numUses !7
  %1 = load i32, i32* %n.addr, align 4, !opID !38, !opCode !17, !bitwidth !39, !numUses !8
  %cmp = icmp sge i32 %1, 0, !opID !40, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp, label %if.then, label %if.else, !opID !42, !opCode !43, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4, !opID !44, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %2, i32* %m, align 4, !opID !45, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !46, !opCode !43, !bitwidth !7, !numUses !7

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %n.addr, align 4, !opID !47, !opCode !17, !bitwidth !39, !numUses !8
  %sub = sub i32 0, %3, !opID !48, !opCode !49, !bitwidth !39, !numUses !8
  store i32 %sub, i32* %m, align 4, !opID !50, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !51, !opCode !43, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %m, align 4, !opID !52, !opCode !17, !bitwidth !39, !numUses !8
  %5 = bitcast i32* %m to i8*, !opID !53, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %5) #6, !opID !54, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %4, !opID !55, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #3

; Function Attrs: nounwind
define i32 @encode(i32 %xin1, i32 %xin2) #4 {
entry:
  %xin1.addr = alloca i32, align 4, !opID !56, !opCode !6, !bitwidth !7, !numUses !57
  %xin2.addr = alloca i32, align 4, !opID !58, !opCode !6, !bitwidth !7, !numUses !57
  %i = alloca i32, align 4, !opID !59, !opCode !6, !bitwidth !7, !numUses !60
  %h_ptr = alloca i32*, align 8, !opID !61, !opCode !6, !bitwidth !7, !numUses !62
  %tqmf_ptr = alloca i32*, align 8, !opID !63, !opCode !6, !bitwidth !7, !numUses !64
  %tqmf_ptr1 = alloca i32*, align 8, !opID !65, !opCode !6, !bitwidth !7, !numUses !33
  %xa = alloca i64, align 8, !opID !66, !opCode !6, !bitwidth !7, !numUses !67
  %xb = alloca i64, align 8, !opID !68, !opCode !6, !bitwidth !7, !numUses !67
  %decis = alloca i32, align 4, !opID !69, !opCode !6, !bitwidth !7, !numUses !31
  store i32 %xin1, i32* %xin1.addr, align 4, !opID !70, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %xin2, i32* %xin2.addr, align 4, !opID !71, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %i to i8*, !opID !72, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !73, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i32** %h_ptr to i8*, !opID !74, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #6, !opID !75, !opCode !22, !bitwidth !7, !numUses !7
  %2 = bitcast i32** %tqmf_ptr to i8*, !opID !76, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #6, !opID !77, !opCode !22, !bitwidth !7, !numUses !7
  %3 = bitcast i32** %tqmf_ptr1 to i8*, !opID !78, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #6, !opID !79, !opCode !22, !bitwidth !7, !numUses !7
  %4 = bitcast i64* %xa to i8*, !opID !80, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #6, !opID !81, !opCode !22, !bitwidth !7, !numUses !7
  %5 = bitcast i64* %xb to i8*, !opID !82, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #6, !opID !83, !opCode !22, !bitwidth !7, !numUses !7
  %6 = bitcast i32* %decis to i8*, !opID !84, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #6, !opID !85, !opCode !22, !bitwidth !7, !numUses !7
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 8, !opID !86, !opCode !13, !bitwidth !7, !numUses !7
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 0), i32** %tqmf_ptr, align 8, !opID !87, !opCode !13, !bitwidth !7, !numUses !7
  %7 = load i32*, i32** %tqmf_ptr, align 8, !opID !88, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr = getelementptr inbounds i32, i32* %7, i32 1, !opID !89, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr, i32** %tqmf_ptr, align 8, !opID !90, !opCode !13, !bitwidth !7, !numUses !7
  %8 = load i32, i32* %7, align 4, !opID !91, !opCode !17, !bitwidth !39, !numUses !8
  %conv = sext i32 %8 to i64, !opID !92, !opCode !93, !bitwidth !94, !numUses !8
  %9 = load i32*, i32** %h_ptr, align 8, !opID !95, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr1 = getelementptr inbounds i32, i32* %9, i32 1, !opID !96, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr1, i32** %h_ptr, align 8, !opID !97, !opCode !13, !bitwidth !7, !numUses !7
  %10 = load i32, i32* %9, align 4, !opID !98, !opCode !17, !bitwidth !39, !numUses !8
  %conv2 = sext i32 %10 to i64, !opID !99, !opCode !93, !bitwidth !94, !numUses !8
  %mul = mul i64 %conv, %conv2, !opID !100, !opCode !101, !bitwidth !94, !numUses !8
  store i64 %mul, i64* %xa, align 8, !opID !102, !opCode !13, !bitwidth !7, !numUses !7
  %11 = load i32*, i32** %tqmf_ptr, align 8, !opID !103, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr3 = getelementptr inbounds i32, i32* %11, i32 1, !opID !104, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr3, i32** %tqmf_ptr, align 8, !opID !105, !opCode !13, !bitwidth !7, !numUses !7
  %12 = load i32, i32* %11, align 4, !opID !106, !opCode !17, !bitwidth !39, !numUses !8
  %conv4 = sext i32 %12 to i64, !opID !107, !opCode !93, !bitwidth !94, !numUses !8
  %13 = load i32*, i32** %h_ptr, align 8, !opID !108, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr5 = getelementptr inbounds i32, i32* %13, i32 1, !opID !109, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr5, i32** %h_ptr, align 8, !opID !110, !opCode !13, !bitwidth !7, !numUses !7
  %14 = load i32, i32* %13, align 4, !opID !111, !opCode !17, !bitwidth !39, !numUses !8
  %conv6 = sext i32 %14 to i64, !opID !112, !opCode !93, !bitwidth !94, !numUses !8
  %mul7 = mul i64 %conv4, %conv6, !opID !113, !opCode !101, !bitwidth !94, !numUses !8
  store i64 %mul7, i64* %xb, align 8, !opID !114, !opCode !13, !bitwidth !7, !numUses !7
  br label %encode_label0, !opID !115, !opCode !43, !bitwidth !7, !numUses !7

encode_label0:                                    ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !116, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !opID !117, !opCode !43, !bitwidth !7, !numUses !7

for.cond:                                         ; preds = %for.inc, %encode_label0
  %15 = load i32, i32* %i, align 4, !opID !118, !opCode !17, !bitwidth !39, !numUses !8
  %cmp = icmp slt i32 %15, 10, !opID !119, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp, label %for.body, label %for.end, !opID !120, !opCode !43, !bitwidth !7, !numUses !7

for.body:                                         ; preds = %for.cond
  %16 = load i32*, i32** %tqmf_ptr, align 8, !opID !121, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr8 = getelementptr inbounds i32, i32* %16, i32 1, !opID !122, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr8, i32** %tqmf_ptr, align 8, !opID !123, !opCode !13, !bitwidth !7, !numUses !7
  %17 = load i32, i32* %16, align 4, !opID !124, !opCode !17, !bitwidth !39, !numUses !8
  %conv9 = sext i32 %17 to i64, !opID !125, !opCode !93, !bitwidth !94, !numUses !8
  %18 = load i32*, i32** %h_ptr, align 8, !opID !126, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr10 = getelementptr inbounds i32, i32* %18, i32 1, !opID !127, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr10, i32** %h_ptr, align 8, !opID !128, !opCode !13, !bitwidth !7, !numUses !7
  %19 = load i32, i32* %18, align 4, !opID !129, !opCode !17, !bitwidth !39, !numUses !8
  %conv11 = sext i32 %19 to i64, !opID !130, !opCode !93, !bitwidth !94, !numUses !8
  %mul12 = mul i64 %conv9, %conv11, !opID !131, !opCode !101, !bitwidth !94, !numUses !8
  %20 = load i64, i64* %xa, align 8, !opID !132, !opCode !17, !bitwidth !94, !numUses !8
  %add = add i64 %20, %mul12, !opID !133, !opCode !134, !bitwidth !94, !numUses !8
  store i64 %add, i64* %xa, align 8, !opID !135, !opCode !13, !bitwidth !7, !numUses !7
  %21 = load i32*, i32** %tqmf_ptr, align 8, !opID !136, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr13 = getelementptr inbounds i32, i32* %21, i32 1, !opID !137, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr13, i32** %tqmf_ptr, align 8, !opID !138, !opCode !13, !bitwidth !7, !numUses !7
  %22 = load i32, i32* %21, align 4, !opID !139, !opCode !17, !bitwidth !39, !numUses !8
  %conv14 = sext i32 %22 to i64, !opID !140, !opCode !93, !bitwidth !94, !numUses !8
  %23 = load i32*, i32** %h_ptr, align 8, !opID !141, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr15 = getelementptr inbounds i32, i32* %23, i32 1, !opID !142, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr15, i32** %h_ptr, align 8, !opID !143, !opCode !13, !bitwidth !7, !numUses !7
  %24 = load i32, i32* %23, align 4, !opID !144, !opCode !17, !bitwidth !39, !numUses !8
  %conv16 = sext i32 %24 to i64, !opID !145, !opCode !93, !bitwidth !94, !numUses !8
  %mul17 = mul i64 %conv14, %conv16, !opID !146, !opCode !101, !bitwidth !94, !numUses !8
  %25 = load i64, i64* %xb, align 8, !opID !147, !opCode !17, !bitwidth !94, !numUses !8
  %add18 = add i64 %25, %mul17, !opID !148, !opCode !134, !bitwidth !94, !numUses !8
  store i64 %add18, i64* %xb, align 8, !opID !149, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc, !opID !150, !opCode !43, !bitwidth !7, !numUses !7

for.inc:                                          ; preds = %for.body
  %26 = load i32, i32* %i, align 4, !opID !151, !opCode !17, !bitwidth !39, !numUses !8
  %inc = add i32 %26, 1, !opID !152, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %inc, i32* %i, align 4, !opID !153, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !llvm.loop !154, !opID !156, !opCode !43, !bitwidth !7, !numUses !7

for.end:                                          ; preds = %for.cond
  %27 = load i32*, i32** %tqmf_ptr, align 8, !opID !157, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr19 = getelementptr inbounds i32, i32* %27, i32 1, !opID !158, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr19, i32** %tqmf_ptr, align 8, !opID !159, !opCode !13, !bitwidth !7, !numUses !7
  %28 = load i32, i32* %27, align 4, !opID !160, !opCode !17, !bitwidth !39, !numUses !8
  %conv20 = sext i32 %28 to i64, !opID !161, !opCode !93, !bitwidth !94, !numUses !8
  %29 = load i32*, i32** %h_ptr, align 8, !opID !162, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr21 = getelementptr inbounds i32, i32* %29, i32 1, !opID !163, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr21, i32** %h_ptr, align 8, !opID !164, !opCode !13, !bitwidth !7, !numUses !7
  %30 = load i32, i32* %29, align 4, !opID !165, !opCode !17, !bitwidth !39, !numUses !8
  %conv22 = sext i32 %30 to i64, !opID !166, !opCode !93, !bitwidth !94, !numUses !8
  %mul23 = mul i64 %conv20, %conv22, !opID !167, !opCode !101, !bitwidth !94, !numUses !8
  %31 = load i64, i64* %xa, align 8, !opID !168, !opCode !17, !bitwidth !94, !numUses !8
  %add24 = add i64 %31, %mul23, !opID !169, !opCode !134, !bitwidth !94, !numUses !8
  store i64 %add24, i64* %xa, align 8, !opID !170, !opCode !13, !bitwidth !7, !numUses !7
  %32 = load i32*, i32** %tqmf_ptr, align 8, !opID !171, !opCode !17, !bitwidth !7, !numUses !8
  %33 = load i32, i32* %32, align 4, !opID !172, !opCode !17, !bitwidth !39, !numUses !8
  %conv25 = sext i32 %33 to i64, !opID !173, !opCode !93, !bitwidth !94, !numUses !8
  %34 = load i32*, i32** %h_ptr, align 8, !opID !174, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr26 = getelementptr inbounds i32, i32* %34, i32 1, !opID !175, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr26, i32** %h_ptr, align 8, !opID !176, !opCode !13, !bitwidth !7, !numUses !7
  %35 = load i32, i32* %34, align 4, !opID !177, !opCode !17, !bitwidth !39, !numUses !8
  %conv27 = sext i32 %35 to i64, !opID !178, !opCode !93, !bitwidth !94, !numUses !8
  %mul28 = mul i64 %conv25, %conv27, !opID !179, !opCode !101, !bitwidth !94, !numUses !8
  %36 = load i64, i64* %xb, align 8, !opID !180, !opCode !17, !bitwidth !94, !numUses !8
  %add29 = add i64 %36, %mul28, !opID !181, !opCode !134, !bitwidth !94, !numUses !8
  store i64 %add29, i64* %xb, align 8, !opID !182, !opCode !13, !bitwidth !7, !numUses !7
  %37 = load i32*, i32** %tqmf_ptr, align 8, !opID !183, !opCode !17, !bitwidth !7, !numUses !8
  %add.ptr = getelementptr inbounds i32, i32* %37, i64 -2, !opID !184, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %add.ptr, i32** %tqmf_ptr1, align 8, !opID !185, !opCode !13, !bitwidth !7, !numUses !7
  br label %encode_label1, !opID !186, !opCode !43, !bitwidth !7, !numUses !7

encode_label1:                                    ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !187, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond30, !opID !188, !opCode !43, !bitwidth !7, !numUses !7

for.cond30:                                       ; preds = %for.inc35, %encode_label1
  %38 = load i32, i32* %i, align 4, !opID !189, !opCode !17, !bitwidth !39, !numUses !8
  %cmp31 = icmp slt i32 %38, 22, !opID !190, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp31, label %for.body32, label %for.end37, !opID !191, !opCode !43, !bitwidth !7, !numUses !7

for.body32:                                       ; preds = %for.cond30
  %39 = load i32*, i32** %tqmf_ptr1, align 8, !opID !192, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr33 = getelementptr inbounds i32, i32* %39, i32 -1, !opID !193, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr33, i32** %tqmf_ptr1, align 8, !opID !194, !opCode !13, !bitwidth !7, !numUses !7
  %40 = load i32, i32* %39, align 4, !opID !195, !opCode !17, !bitwidth !39, !numUses !8
  %41 = load i32*, i32** %tqmf_ptr, align 8, !opID !196, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr34 = getelementptr inbounds i32, i32* %41, i32 -1, !opID !197, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr34, i32** %tqmf_ptr, align 8, !opID !198, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %40, i32* %41, align 4, !opID !199, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc35, !opID !200, !opCode !43, !bitwidth !7, !numUses !7

for.inc35:                                        ; preds = %for.body32
  %42 = load i32, i32* %i, align 4, !opID !201, !opCode !17, !bitwidth !39, !numUses !8
  %inc36 = add i32 %42, 1, !opID !202, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %inc36, i32* %i, align 4, !opID !203, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond30, !llvm.loop !204, !opID !206, !opCode !43, !bitwidth !7, !numUses !7

for.end37:                                        ; preds = %for.cond30
  %43 = load i32, i32* %xin1.addr, align 4, !opID !207, !opCode !17, !bitwidth !39, !numUses !8
  %44 = load i32*, i32** %tqmf_ptr, align 8, !opID !208, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr38 = getelementptr inbounds i32, i32* %44, i32 -1, !opID !209, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr38, i32** %tqmf_ptr, align 8, !opID !210, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %43, i32* %44, align 4, !opID !211, !opCode !13, !bitwidth !7, !numUses !7
  %45 = load i32, i32* %xin2.addr, align 4, !opID !212, !opCode !17, !bitwidth !39, !numUses !8
  %46 = load i32*, i32** %tqmf_ptr, align 8, !opID !213, !opCode !17, !bitwidth !7, !numUses !8
  store i32 %45, i32* %46, align 4, !opID !214, !opCode !13, !bitwidth !7, !numUses !7
  %47 = load i64, i64* %xa, align 8, !opID !215, !opCode !17, !bitwidth !94, !numUses !8
  %48 = load i64, i64* %xb, align 8, !opID !216, !opCode !17, !bitwidth !94, !numUses !8
  %add39 = add i64 %47, %48, !opID !217, !opCode !134, !bitwidth !94, !numUses !8
  %shr = ashr i64 %add39, 15, !opID !218, !opCode !219, !bitwidth !94, !numUses !8
  %conv40 = trunc i64 %shr to i32, !opID !220, !opCode !221, !bitwidth !39, !numUses !8
  store i32 %conv40, i32* @xl, align 4, !opID !222, !opCode !13, !bitwidth !7, !numUses !7
  %49 = load i64, i64* %xa, align 8, !opID !223, !opCode !17, !bitwidth !94, !numUses !8
  %50 = load i64, i64* %xb, align 8, !opID !224, !opCode !17, !bitwidth !94, !numUses !8
  %sub = sub i64 %49, %50, !opID !225, !opCode !49, !bitwidth !94, !numUses !8
  %shr41 = ashr i64 %sub, 15, !opID !226, !opCode !219, !bitwidth !94, !numUses !8
  %conv42 = trunc i64 %shr41 to i32, !opID !227, !opCode !221, !bitwidth !39, !numUses !8
  store i32 %conv42, i32* @xh, align 4, !opID !228, !opCode !13, !bitwidth !7, !numUses !7
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0)), !opID !229, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call, i32* @szl, align 4, !opID !230, !opCode !13, !bitwidth !7, !numUses !7
  %51 = load i32, i32* @rlt1, align 4, !opID !231, !opCode !17, !bitwidth !39, !numUses !8
  %52 = load i32, i32* @al1, align 4, !opID !232, !opCode !17, !bitwidth !39, !numUses !8
  %53 = load i32, i32* @rlt2, align 4, !opID !233, !opCode !17, !bitwidth !39, !numUses !8
  %54 = load i32, i32* @al2, align 4, !opID !234, !opCode !17, !bitwidth !39, !numUses !8
  %call43 = call i32 @filtep(i32 %51, i32 %52, i32 %53, i32 %54), !opID !235, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call43, i32* @spl, align 4, !opID !236, !opCode !13, !bitwidth !7, !numUses !7
  %55 = load i32, i32* @szl, align 4, !opID !237, !opCode !17, !bitwidth !39, !numUses !8
  %56 = load i32, i32* @spl, align 4, !opID !238, !opCode !17, !bitwidth !39, !numUses !8
  %add44 = add i32 %55, %56, !opID !239, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add44, i32* @sl, align 4, !opID !240, !opCode !13, !bitwidth !7, !numUses !7
  %57 = load i32, i32* @xl, align 4, !opID !241, !opCode !17, !bitwidth !39, !numUses !8
  %58 = load i32, i32* @sl, align 4, !opID !242, !opCode !17, !bitwidth !39, !numUses !8
  %sub45 = sub i32 %57, %58, !opID !243, !opCode !49, !bitwidth !39, !numUses !8
  store i32 %sub45, i32* @el, align 4, !opID !244, !opCode !13, !bitwidth !7, !numUses !7
  %59 = load i32, i32* @el, align 4, !opID !245, !opCode !17, !bitwidth !39, !numUses !8
  %60 = load i32, i32* @detl, align 4, !opID !246, !opCode !17, !bitwidth !39, !numUses !8
  %call46 = call i32 @quantl(i32 %59, i32 %60), !opID !247, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call46, i32* @il, align 4, !opID !248, !opCode !13, !bitwidth !7, !numUses !7
  %61 = load i32, i32* @detl, align 4, !opID !249, !opCode !17, !bitwidth !39, !numUses !8
  %conv47 = sext i32 %61 to i64, !opID !250, !opCode !93, !bitwidth !94, !numUses !8
  %62 = load i32, i32* @il, align 4, !opID !251, !opCode !17, !bitwidth !39, !numUses !8
  %shr48 = ashr i32 %62, 2, !opID !252, !opCode !219, !bitwidth !39, !numUses !8
  %idxprom = sext i32 %shr48 to i64, !opID !253, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i64 0, i64 %idxprom, !opID !254, !opCode !19, !bitwidth !7, !numUses !8
  %63 = load i32, i32* %arrayidx, align 4, !opID !255, !opCode !17, !bitwidth !39, !numUses !8
  %conv49 = sext i32 %63 to i64, !opID !256, !opCode !93, !bitwidth !94, !numUses !8
  %mul50 = mul i64 %conv47, %conv49, !opID !257, !opCode !101, !bitwidth !94, !numUses !8
  %shr51 = ashr i64 %mul50, 15, !opID !258, !opCode !219, !bitwidth !94, !numUses !8
  %conv52 = trunc i64 %shr51 to i32, !opID !259, !opCode !221, !bitwidth !39, !numUses !8
  store i32 %conv52, i32* @dlt, align 4, !opID !260, !opCode !13, !bitwidth !7, !numUses !7
  %64 = load i32, i32* @il, align 4, !opID !261, !opCode !17, !bitwidth !39, !numUses !8
  %65 = load i32, i32* @nbl, align 4, !opID !262, !opCode !17, !bitwidth !39, !numUses !8
  %call53 = call i32 @logscl(i32 %64, i32 %65), !opID !263, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call53, i32* @nbl, align 4, !opID !264, !opCode !13, !bitwidth !7, !numUses !7
  %66 = load i32, i32* @nbl, align 4, !opID !265, !opCode !17, !bitwidth !39, !numUses !8
  %call54 = call i32 @scalel(i32 %66, i32 8), !opID !266, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call54, i32* @detl, align 4, !opID !267, !opCode !13, !bitwidth !7, !numUses !7
  %67 = load i32, i32* @dlt, align 4, !opID !268, !opCode !17, !bitwidth !39, !numUses !8
  %68 = load i32, i32* @szl, align 4, !opID !269, !opCode !17, !bitwidth !39, !numUses !8
  %add55 = add i32 %67, %68, !opID !270, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add55, i32* @plt, align 4, !opID !271, !opCode !13, !bitwidth !7, !numUses !7
  %69 = load i32, i32* @dlt, align 4, !opID !272, !opCode !17, !bitwidth !39, !numUses !8
  call void @upzero(i32 %69, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0)), !opID !273, !opCode !22, !bitwidth !7, !numUses !7
  %70 = load i32, i32* @al1, align 4, !opID !274, !opCode !17, !bitwidth !39, !numUses !8
  %71 = load i32, i32* @al2, align 4, !opID !275, !opCode !17, !bitwidth !39, !numUses !8
  %72 = load i32, i32* @plt, align 4, !opID !276, !opCode !17, !bitwidth !39, !numUses !8
  %73 = load i32, i32* @plt1, align 4, !opID !277, !opCode !17, !bitwidth !39, !numUses !8
  %74 = load i32, i32* @plt2, align 4, !opID !278, !opCode !17, !bitwidth !39, !numUses !8
  %call56 = call i32 @uppol2(i32 %70, i32 %71, i32 %72, i32 %73, i32 %74), !opID !279, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call56, i32* @al2, align 4, !opID !280, !opCode !13, !bitwidth !7, !numUses !7
  %75 = load i32, i32* @al1, align 4, !opID !281, !opCode !17, !bitwidth !39, !numUses !8
  %76 = load i32, i32* @al2, align 4, !opID !282, !opCode !17, !bitwidth !39, !numUses !8
  %77 = load i32, i32* @plt, align 4, !opID !283, !opCode !17, !bitwidth !39, !numUses !8
  %78 = load i32, i32* @plt1, align 4, !opID !284, !opCode !17, !bitwidth !39, !numUses !8
  %call57 = call i32 @uppol1(i32 %75, i32 %76, i32 %77, i32 %78), !opID !285, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call57, i32* @al1, align 4, !opID !286, !opCode !13, !bitwidth !7, !numUses !7
  %79 = load i32, i32* @sl, align 4, !opID !287, !opCode !17, !bitwidth !39, !numUses !8
  %80 = load i32, i32* @dlt, align 4, !opID !288, !opCode !17, !bitwidth !39, !numUses !8
  %add58 = add i32 %79, %80, !opID !289, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add58, i32* @rlt, align 4, !opID !290, !opCode !13, !bitwidth !7, !numUses !7
  %81 = load i32, i32* @rlt1, align 4, !opID !291, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %81, i32* @rlt2, align 4, !opID !292, !opCode !13, !bitwidth !7, !numUses !7
  %82 = load i32, i32* @rlt, align 4, !opID !293, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %82, i32* @rlt1, align 4, !opID !294, !opCode !13, !bitwidth !7, !numUses !7
  %83 = load i32, i32* @plt1, align 4, !opID !295, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %83, i32* @plt2, align 4, !opID !296, !opCode !13, !bitwidth !7, !numUses !7
  %84 = load i32, i32* @plt, align 4, !opID !297, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %84, i32* @plt1, align 4, !opID !298, !opCode !13, !bitwidth !7, !numUses !7
  %call59 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0)), !opID !299, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call59, i32* @szh, align 4, !opID !300, !opCode !13, !bitwidth !7, !numUses !7
  %85 = load i32, i32* @rh1, align 4, !opID !301, !opCode !17, !bitwidth !39, !numUses !8
  %86 = load i32, i32* @ah1, align 4, !opID !302, !opCode !17, !bitwidth !39, !numUses !8
  %87 = load i32, i32* @rh2, align 4, !opID !303, !opCode !17, !bitwidth !39, !numUses !8
  %88 = load i32, i32* @ah2, align 4, !opID !304, !opCode !17, !bitwidth !39, !numUses !8
  %call60 = call i32 @filtep(i32 %85, i32 %86, i32 %87, i32 %88), !opID !305, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call60, i32* @sph, align 4, !opID !306, !opCode !13, !bitwidth !7, !numUses !7
  %89 = load i32, i32* @sph, align 4, !opID !307, !opCode !17, !bitwidth !39, !numUses !8
  %90 = load i32, i32* @szh, align 4, !opID !308, !opCode !17, !bitwidth !39, !numUses !8
  %add61 = add i32 %89, %90, !opID !309, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add61, i32* @sh, align 4, !opID !310, !opCode !13, !bitwidth !7, !numUses !7
  %91 = load i32, i32* @xh, align 4, !opID !311, !opCode !17, !bitwidth !39, !numUses !8
  %92 = load i32, i32* @sh, align 4, !opID !312, !opCode !17, !bitwidth !39, !numUses !8
  %sub62 = sub i32 %91, %92, !opID !313, !opCode !49, !bitwidth !39, !numUses !8
  store i32 %sub62, i32* @eh, align 4, !opID !314, !opCode !13, !bitwidth !7, !numUses !7
  %93 = load i32, i32* @eh, align 4, !opID !315, !opCode !17, !bitwidth !39, !numUses !8
  %cmp63 = icmp sge i32 %93, 0, !opID !316, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp63, label %if.then, label %if.else, !opID !317, !opCode !43, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %for.end37
  store i32 3, i32* @ih, align 4, !opID !318, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !319, !opCode !43, !bitwidth !7, !numUses !7

if.else:                                          ; preds = %for.end37
  store i32 1, i32* @ih, align 4, !opID !320, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !321, !opCode !43, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %if.else, %if.then
  %94 = load i32, i32* @deth, align 4, !opID !322, !opCode !17, !bitwidth !39, !numUses !8
  %conv64 = sext i32 %94 to i64, !opID !323, !opCode !93, !bitwidth !94, !numUses !8
  %mul65 = mul i64 564, %conv64, !opID !324, !opCode !101, !bitwidth !94, !numUses !8
  %shr66 = ashr i64 %mul65, 12, !opID !325, !opCode !219, !bitwidth !94, !numUses !8
  %conv67 = trunc i64 %shr66 to i32, !opID !326, !opCode !221, !bitwidth !39, !numUses !8
  store i32 %conv67, i32* %decis, align 4, !opID !327, !opCode !13, !bitwidth !7, !numUses !7
  %95 = load i32, i32* @eh, align 4, !opID !328, !opCode !17, !bitwidth !39, !numUses !8
  %call68 = call i32 @abs(i32 %95) #7, !opID !329, !opCode !22, !bitwidth !39, !numUses !8
  %96 = load i32, i32* %decis, align 4, !opID !330, !opCode !17, !bitwidth !39, !numUses !8
  %cmp69 = icmp sgt i32 %call68, %96, !opID !331, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp69, label %if.then70, label %if.end71, !opID !332, !opCode !43, !bitwidth !7, !numUses !7

if.then70:                                        ; preds = %if.end
  %97 = load i32, i32* @ih, align 4, !opID !333, !opCode !17, !bitwidth !39, !numUses !8
  %dec = add i32 %97, -1, !opID !334, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %dec, i32* @ih, align 4, !opID !335, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end71, !opID !336, !opCode !43, !bitwidth !7, !numUses !7

if.end71:                                         ; preds = %if.then70, %if.end
  %98 = load i32, i32* @deth, align 4, !opID !337, !opCode !17, !bitwidth !39, !numUses !8
  %conv72 = sext i32 %98 to i64, !opID !338, !opCode !93, !bitwidth !94, !numUses !8
  %99 = load i32, i32* @ih, align 4, !opID !339, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom73 = sext i32 %99 to i64, !opID !340, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx74 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i64 0, i64 %idxprom73, !opID !341, !opCode !19, !bitwidth !7, !numUses !8
  %100 = load i32, i32* %arrayidx74, align 4, !opID !342, !opCode !17, !bitwidth !39, !numUses !8
  %conv75 = sext i32 %100 to i64, !opID !343, !opCode !93, !bitwidth !94, !numUses !8
  %mul76 = mul i64 %conv72, %conv75, !opID !344, !opCode !101, !bitwidth !94, !numUses !8
  %shr77 = ashr i64 %mul76, 15, !opID !345, !opCode !219, !bitwidth !94, !numUses !8
  %conv78 = trunc i64 %shr77 to i32, !opID !346, !opCode !221, !bitwidth !39, !numUses !8
  store i32 %conv78, i32* @dh, align 4, !opID !347, !opCode !13, !bitwidth !7, !numUses !7
  %101 = load i32, i32* @ih, align 4, !opID !348, !opCode !17, !bitwidth !39, !numUses !8
  %102 = load i32, i32* @nbh, align 4, !opID !349, !opCode !17, !bitwidth !39, !numUses !8
  %call79 = call i32 @logsch(i32 %101, i32 %102), !opID !350, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call79, i32* @nbh, align 4, !opID !351, !opCode !13, !bitwidth !7, !numUses !7
  %103 = load i32, i32* @nbh, align 4, !opID !352, !opCode !17, !bitwidth !39, !numUses !8
  %call80 = call i32 @scalel(i32 %103, i32 10), !opID !353, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call80, i32* @deth, align 4, !opID !354, !opCode !13, !bitwidth !7, !numUses !7
  %104 = load i32, i32* @dh, align 4, !opID !355, !opCode !17, !bitwidth !39, !numUses !8
  %105 = load i32, i32* @szh, align 4, !opID !356, !opCode !17, !bitwidth !39, !numUses !8
  %add81 = add i32 %104, %105, !opID !357, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add81, i32* @ph, align 4, !opID !358, !opCode !13, !bitwidth !7, !numUses !7
  %106 = load i32, i32* @dh, align 4, !opID !359, !opCode !17, !bitwidth !39, !numUses !8
  call void @upzero(i32 %106, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0)), !opID !360, !opCode !22, !bitwidth !7, !numUses !7
  %107 = load i32, i32* @ah1, align 4, !opID !361, !opCode !17, !bitwidth !39, !numUses !8
  %108 = load i32, i32* @ah2, align 4, !opID !362, !opCode !17, !bitwidth !39, !numUses !8
  %109 = load i32, i32* @ph, align 4, !opID !363, !opCode !17, !bitwidth !39, !numUses !8
  %110 = load i32, i32* @ph1, align 4, !opID !364, !opCode !17, !bitwidth !39, !numUses !8
  %111 = load i32, i32* @ph2, align 4, !opID !365, !opCode !17, !bitwidth !39, !numUses !8
  %call82 = call i32 @uppol2(i32 %107, i32 %108, i32 %109, i32 %110, i32 %111), !opID !366, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call82, i32* @ah2, align 4, !opID !367, !opCode !13, !bitwidth !7, !numUses !7
  %112 = load i32, i32* @ah1, align 4, !opID !368, !opCode !17, !bitwidth !39, !numUses !8
  %113 = load i32, i32* @ah2, align 4, !opID !369, !opCode !17, !bitwidth !39, !numUses !8
  %114 = load i32, i32* @ph, align 4, !opID !370, !opCode !17, !bitwidth !39, !numUses !8
  %115 = load i32, i32* @ph1, align 4, !opID !371, !opCode !17, !bitwidth !39, !numUses !8
  %call83 = call i32 @uppol1(i32 %112, i32 %113, i32 %114, i32 %115), !opID !372, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call83, i32* @ah1, align 4, !opID !373, !opCode !13, !bitwidth !7, !numUses !7
  %116 = load i32, i32* @sh, align 4, !opID !374, !opCode !17, !bitwidth !39, !numUses !8
  %117 = load i32, i32* @dh, align 4, !opID !375, !opCode !17, !bitwidth !39, !numUses !8
  %add84 = add i32 %116, %117, !opID !376, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add84, i32* @yh, align 4, !opID !377, !opCode !13, !bitwidth !7, !numUses !7
  %118 = load i32, i32* @rh1, align 4, !opID !378, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %118, i32* @rh2, align 4, !opID !379, !opCode !13, !bitwidth !7, !numUses !7
  %119 = load i32, i32* @yh, align 4, !opID !380, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %119, i32* @rh1, align 4, !opID !381, !opCode !13, !bitwidth !7, !numUses !7
  %120 = load i32, i32* @ph1, align 4, !opID !382, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %120, i32* @ph2, align 4, !opID !383, !opCode !13, !bitwidth !7, !numUses !7
  %121 = load i32, i32* @ph, align 4, !opID !384, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %121, i32* @ph1, align 4, !opID !385, !opCode !13, !bitwidth !7, !numUses !7
  %122 = load i32, i32* @il, align 4, !opID !386, !opCode !17, !bitwidth !39, !numUses !8
  %123 = load i32, i32* @ih, align 4, !opID !387, !opCode !17, !bitwidth !39, !numUses !8
  %shl = shl i32 %123, 6, !opID !388, !opCode !389, !bitwidth !39, !numUses !8
  %or = or i32 %122, %shl, !opID !390, !opCode !391, !bitwidth !39, !numUses !8
  %124 = bitcast i32* %decis to i8*, !opID !392, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %124) #6, !opID !393, !opCode !22, !bitwidth !7, !numUses !7
  %125 = bitcast i64* %xb to i8*, !opID !394, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %125) #6, !opID !395, !opCode !22, !bitwidth !7, !numUses !7
  %126 = bitcast i64* %xa to i8*, !opID !396, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %126) #6, !opID !397, !opCode !22, !bitwidth !7, !numUses !7
  %127 = bitcast i32** %tqmf_ptr1 to i8*, !opID !398, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %127) #6, !opID !399, !opCode !22, !bitwidth !7, !numUses !7
  %128 = bitcast i32** %tqmf_ptr to i8*, !opID !400, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %128) #6, !opID !401, !opCode !22, !bitwidth !7, !numUses !7
  %129 = bitcast i32** %h_ptr to i8*, !opID !402, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %129) #6, !opID !403, !opCode !22, !bitwidth !7, !numUses !7
  %130 = bitcast i32* %i to i8*, !opID !404, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %130) #6, !opID !405, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %or, !opID !406, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @filtez(i32* %bpl, i32* %dlt) #4 {
entry:
  %bpl.addr = alloca i32*, align 8, !opID !407, !opCode !6, !bitwidth !7, !numUses !33
  %dlt.addr = alloca i32*, align 8, !opID !408, !opCode !6, !bitwidth !7, !numUses !33
  %i = alloca i32, align 4, !opID !409, !opCode !6, !bitwidth !7, !numUses !410
  %zl = alloca i64, align 8, !opID !411, !opCode !6, !bitwidth !7, !numUses !410
  store i32* %bpl, i32** %bpl.addr, align 8, !opID !412, !opCode !13, !bitwidth !7, !numUses !7
  store i32* %dlt, i32** %dlt.addr, align 8, !opID !413, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %i to i8*, !opID !414, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !415, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i64* %zl to i8*, !opID !416, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #6, !opID !417, !opCode !22, !bitwidth !7, !numUses !7
  %2 = load i32*, i32** %bpl.addr, align 8, !opID !418, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr = getelementptr inbounds i32, i32* %2, i32 1, !opID !419, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr, i32** %bpl.addr, align 8, !opID !420, !opCode !13, !bitwidth !7, !numUses !7
  %3 = load i32, i32* %2, align 4, !opID !421, !opCode !17, !bitwidth !39, !numUses !8
  %conv = sext i32 %3 to i64, !opID !422, !opCode !93, !bitwidth !94, !numUses !8
  %4 = load i32*, i32** %dlt.addr, align 8, !opID !423, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr1 = getelementptr inbounds i32, i32* %4, i32 1, !opID !424, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr1, i32** %dlt.addr, align 8, !opID !425, !opCode !13, !bitwidth !7, !numUses !7
  %5 = load i32, i32* %4, align 4, !opID !426, !opCode !17, !bitwidth !39, !numUses !8
  %conv2 = sext i32 %5 to i64, !opID !427, !opCode !93, !bitwidth !94, !numUses !8
  %mul = mul i64 %conv, %conv2, !opID !428, !opCode !101, !bitwidth !94, !numUses !8
  store i64 %mul, i64* %zl, align 8, !opID !429, !opCode !13, !bitwidth !7, !numUses !7
  br label %filtez_label8, !opID !430, !opCode !43, !bitwidth !7, !numUses !7

filtez_label8:                                    ; preds = %entry
  store i32 1, i32* %i, align 4, !opID !431, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !opID !432, !opCode !43, !bitwidth !7, !numUses !7

for.cond:                                         ; preds = %for.inc, %filtez_label8
  %6 = load i32, i32* %i, align 4, !opID !433, !opCode !17, !bitwidth !39, !numUses !8
  %cmp = icmp slt i32 %6, 6, !opID !434, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp, label %for.body, label %for.end, !opID !435, !opCode !43, !bitwidth !7, !numUses !7

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %bpl.addr, align 8, !opID !436, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr3 = getelementptr inbounds i32, i32* %7, i32 1, !opID !437, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr3, i32** %bpl.addr, align 8, !opID !438, !opCode !13, !bitwidth !7, !numUses !7
  %8 = load i32, i32* %7, align 4, !opID !439, !opCode !17, !bitwidth !39, !numUses !8
  %conv4 = sext i32 %8 to i64, !opID !440, !opCode !93, !bitwidth !94, !numUses !8
  %9 = load i32*, i32** %dlt.addr, align 8, !opID !441, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr5 = getelementptr inbounds i32, i32* %9, i32 1, !opID !442, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr5, i32** %dlt.addr, align 8, !opID !443, !opCode !13, !bitwidth !7, !numUses !7
  %10 = load i32, i32* %9, align 4, !opID !444, !opCode !17, !bitwidth !39, !numUses !8
  %conv6 = sext i32 %10 to i64, !opID !445, !opCode !93, !bitwidth !94, !numUses !8
  %mul7 = mul i64 %conv4, %conv6, !opID !446, !opCode !101, !bitwidth !94, !numUses !8
  %11 = load i64, i64* %zl, align 8, !opID !447, !opCode !17, !bitwidth !94, !numUses !8
  %add = add i64 %11, %mul7, !opID !448, !opCode !134, !bitwidth !94, !numUses !8
  store i64 %add, i64* %zl, align 8, !opID !449, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc, !opID !450, !opCode !43, !bitwidth !7, !numUses !7

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !opID !451, !opCode !17, !bitwidth !39, !numUses !8
  %inc = add i32 %12, 1, !opID !452, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %inc, i32* %i, align 4, !opID !453, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !llvm.loop !454, !opID !456, !opCode !43, !bitwidth !7, !numUses !7

for.end:                                          ; preds = %for.cond
  %13 = load i64, i64* %zl, align 8, !opID !457, !opCode !17, !bitwidth !94, !numUses !8
  %shr = ashr i64 %13, 14, !opID !458, !opCode !219, !bitwidth !94, !numUses !8
  %conv8 = trunc i64 %shr to i32, !opID !459, !opCode !221, !bitwidth !39, !numUses !8
  %14 = bitcast i64* %zl to i8*, !opID !460, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %14) #6, !opID !461, !opCode !22, !bitwidth !7, !numUses !7
  %15 = bitcast i32* %i to i8*, !opID !462, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #6, !opID !463, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %conv8, !opID !464, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @filtep(i32 %rlt1, i32 %al1, i32 %rlt2, i32 %al2) #4 {
entry:
  %rlt1.addr = alloca i32, align 4, !opID !465, !opCode !6, !bitwidth !7, !numUses !57
  %al1.addr = alloca i32, align 4, !opID !466, !opCode !6, !bitwidth !7, !numUses !57
  %rlt2.addr = alloca i32, align 4, !opID !467, !opCode !6, !bitwidth !7, !numUses !57
  %al2.addr = alloca i32, align 4, !opID !468, !opCode !6, !bitwidth !7, !numUses !57
  %pl = alloca i64, align 8, !opID !469, !opCode !6, !bitwidth !7, !numUses !470
  %pl2 = alloca i64, align 8, !opID !471, !opCode !6, !bitwidth !7, !numUses !31
  store i32 %rlt1, i32* %rlt1.addr, align 4, !opID !472, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %al1, i32* %al1.addr, align 4, !opID !473, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %rlt2, i32* %rlt2.addr, align 4, !opID !474, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %al2, i32* %al2.addr, align 4, !opID !475, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i64* %pl to i8*, !opID !476, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #6, !opID !477, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i64* %pl2 to i8*, !opID !478, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #6, !opID !479, !opCode !22, !bitwidth !7, !numUses !7
  %2 = load i32, i32* %rlt1.addr, align 4, !opID !480, !opCode !17, !bitwidth !39, !numUses !8
  %mul = mul i32 2, %2, !opID !481, !opCode !101, !bitwidth !39, !numUses !8
  %conv = sext i32 %mul to i64, !opID !482, !opCode !93, !bitwidth !94, !numUses !8
  store i64 %conv, i64* %pl, align 8, !opID !483, !opCode !13, !bitwidth !7, !numUses !7
  %3 = load i32, i32* %al1.addr, align 4, !opID !484, !opCode !17, !bitwidth !39, !numUses !8
  %conv1 = sext i32 %3 to i64, !opID !485, !opCode !93, !bitwidth !94, !numUses !8
  %4 = load i64, i64* %pl, align 8, !opID !486, !opCode !17, !bitwidth !94, !numUses !8
  %mul2 = mul i64 %conv1, %4, !opID !487, !opCode !101, !bitwidth !94, !numUses !8
  store i64 %mul2, i64* %pl, align 8, !opID !488, !opCode !13, !bitwidth !7, !numUses !7
  %5 = load i32, i32* %rlt2.addr, align 4, !opID !489, !opCode !17, !bitwidth !39, !numUses !8
  %mul3 = mul i32 2, %5, !opID !490, !opCode !101, !bitwidth !39, !numUses !8
  %conv4 = sext i32 %mul3 to i64, !opID !491, !opCode !93, !bitwidth !94, !numUses !8
  store i64 %conv4, i64* %pl2, align 8, !opID !492, !opCode !13, !bitwidth !7, !numUses !7
  %6 = load i32, i32* %al2.addr, align 4, !opID !493, !opCode !17, !bitwidth !39, !numUses !8
  %conv5 = sext i32 %6 to i64, !opID !494, !opCode !93, !bitwidth !94, !numUses !8
  %7 = load i64, i64* %pl2, align 8, !opID !495, !opCode !17, !bitwidth !94, !numUses !8
  %mul6 = mul i64 %conv5, %7, !opID !496, !opCode !101, !bitwidth !94, !numUses !8
  %8 = load i64, i64* %pl, align 8, !opID !497, !opCode !17, !bitwidth !94, !numUses !8
  %add = add i64 %8, %mul6, !opID !498, !opCode !134, !bitwidth !94, !numUses !8
  store i64 %add, i64* %pl, align 8, !opID !499, !opCode !13, !bitwidth !7, !numUses !7
  %9 = load i64, i64* %pl, align 8, !opID !500, !opCode !17, !bitwidth !94, !numUses !8
  %shr = ashr i64 %9, 15, !opID !501, !opCode !219, !bitwidth !94, !numUses !8
  %conv7 = trunc i64 %shr to i32, !opID !502, !opCode !221, !bitwidth !39, !numUses !8
  %10 = bitcast i64* %pl2 to i8*, !opID !503, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %10) #6, !opID !504, !opCode !22, !bitwidth !7, !numUses !7
  %11 = bitcast i64* %pl to i8*, !opID !505, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %11) #6, !opID !506, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %conv7, !opID !507, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @quantl(i32 %el, i32 %detl) #4 {
entry:
  %el.addr = alloca i32, align 4, !opID !508, !opCode !6, !bitwidth !7, !numUses !11
  %detl.addr = alloca i32, align 4, !opID !509, !opCode !6, !bitwidth !7, !numUses !57
  %ril = alloca i32, align 4, !opID !510, !opCode !6, !bitwidth !7, !numUses !33
  %mil = alloca i32, align 4, !opID !511, !opCode !6, !bitwidth !7, !numUses !67
  %wd = alloca i64, align 8, !opID !512, !opCode !6, !bitwidth !7, !numUses !31
  %decis = alloca i64, align 8, !opID !513, !opCode !6, !bitwidth !7, !numUses !31
  store i32 %el, i32* %el.addr, align 4, !opID !514, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %detl, i32* %detl.addr, align 4, !opID !515, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %ril to i8*, !opID !516, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !517, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i32* %mil to i8*, !opID !518, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6, !opID !519, !opCode !22, !bitwidth !7, !numUses !7
  %2 = bitcast i64* %wd to i8*, !opID !520, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #6, !opID !521, !opCode !22, !bitwidth !7, !numUses !7
  %3 = bitcast i64* %decis to i8*, !opID !522, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #6, !opID !523, !opCode !22, !bitwidth !7, !numUses !7
  %4 = load i32, i32* %el.addr, align 4, !opID !524, !opCode !17, !bitwidth !39, !numUses !8
  %call = call i32 @abs(i32 %4) #7, !opID !525, !opCode !22, !bitwidth !39, !numUses !8
  %conv = sext i32 %call to i64, !opID !526, !opCode !93, !bitwidth !94, !numUses !8
  store i64 %conv, i64* %wd, align 8, !opID !527, !opCode !13, !bitwidth !7, !numUses !7
  br label %quantl_label9, !opID !528, !opCode !43, !bitwidth !7, !numUses !7

quantl_label9:                                    ; preds = %entry
  store i32 0, i32* %mil, align 4, !opID !529, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !opID !530, !opCode !43, !bitwidth !7, !numUses !7

for.cond:                                         ; preds = %for.inc, %quantl_label9
  %5 = load i32, i32* %mil, align 4, !opID !531, !opCode !17, !bitwidth !39, !numUses !8
  %cmp = icmp slt i32 %5, 30, !opID !532, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp, label %for.body, label %for.end, !opID !533, !opCode !43, !bitwidth !7, !numUses !7

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %mil, align 4, !opID !534, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom = sext i32 %6 to i64, !opID !535, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx = getelementptr inbounds [30 x i32], [30 x i32]* @decis_levl, i64 0, i64 %idxprom, !opID !536, !opCode !19, !bitwidth !7, !numUses !8
  %7 = load i32, i32* %arrayidx, align 4, !opID !537, !opCode !17, !bitwidth !39, !numUses !8
  %conv1 = sext i32 %7 to i64, !opID !538, !opCode !93, !bitwidth !94, !numUses !8
  %8 = load i32, i32* %detl.addr, align 4, !opID !539, !opCode !17, !bitwidth !39, !numUses !8
  %conv2 = sext i32 %8 to i64, !opID !540, !opCode !93, !bitwidth !94, !numUses !8
  %mul = mul i64 %conv1, %conv2, !opID !541, !opCode !101, !bitwidth !94, !numUses !8
  %shr = ashr i64 %mul, 15, !opID !542, !opCode !219, !bitwidth !94, !numUses !8
  store i64 %shr, i64* %decis, align 8, !opID !543, !opCode !13, !bitwidth !7, !numUses !7
  %9 = load i64, i64* %wd, align 8, !opID !544, !opCode !17, !bitwidth !94, !numUses !8
  %10 = load i64, i64* %decis, align 8, !opID !545, !opCode !17, !bitwidth !94, !numUses !8
  %cmp3 = icmp sle i64 %9, %10, !opID !546, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp3, label %if.then, label %if.end, !opID !547, !opCode !43, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %for.body
  br label %for.end, !opID !548, !opCode !43, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %for.body
  br label %for.inc, !opID !549, !opCode !43, !bitwidth !7, !numUses !7

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %mil, align 4, !opID !550, !opCode !17, !bitwidth !39, !numUses !8
  %inc = add i32 %11, 1, !opID !551, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %inc, i32* %mil, align 4, !opID !552, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !llvm.loop !553, !opID !555, !opCode !43, !bitwidth !7, !numUses !7

for.end:                                          ; preds = %if.then, %for.cond
  %12 = load i32, i32* %el.addr, align 4, !opID !556, !opCode !17, !bitwidth !39, !numUses !8
  %cmp4 = icmp sge i32 %12, 0, !opID !557, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp4, label %if.then5, label %if.else, !opID !558, !opCode !43, !bitwidth !7, !numUses !7

if.then5:                                         ; preds = %for.end
  %13 = load i32, i32* %mil, align 4, !opID !559, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom6 = sext i32 %13 to i64, !opID !560, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx7 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_pos, i64 0, i64 %idxprom6, !opID !561, !opCode !19, !bitwidth !7, !numUses !8
  %14 = load i32, i32* %arrayidx7, align 4, !opID !562, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %14, i32* %ril, align 4, !opID !563, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end10, !opID !564, !opCode !43, !bitwidth !7, !numUses !7

if.else:                                          ; preds = %for.end
  %15 = load i32, i32* %mil, align 4, !opID !565, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom8 = sext i32 %15 to i64, !opID !566, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx9 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_neg, i64 0, i64 %idxprom8, !opID !567, !opCode !19, !bitwidth !7, !numUses !8
  %16 = load i32, i32* %arrayidx9, align 4, !opID !568, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %16, i32* %ril, align 4, !opID !569, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end10, !opID !570, !opCode !43, !bitwidth !7, !numUses !7

if.end10:                                         ; preds = %if.else, %if.then5
  %17 = load i32, i32* %ril, align 4, !opID !571, !opCode !17, !bitwidth !39, !numUses !8
  %18 = bitcast i64* %decis to i8*, !opID !572, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #6, !opID !573, !opCode !22, !bitwidth !7, !numUses !7
  %19 = bitcast i64* %wd to i8*, !opID !574, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #6, !opID !575, !opCode !22, !bitwidth !7, !numUses !7
  %20 = bitcast i32* %mil to i8*, !opID !576, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #6, !opID !577, !opCode !22, !bitwidth !7, !numUses !7
  %21 = bitcast i32* %ril to i8*, !opID !578, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #6, !opID !579, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %17, !opID !580, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @logscl(i32 %il, i32 %nbl) #4 {
entry:
  %il.addr = alloca i32, align 4, !opID !581, !opCode !6, !bitwidth !7, !numUses !57
  %nbl.addr = alloca i32, align 4, !opID !582, !opCode !6, !bitwidth !7, !numUses !470
  %wd = alloca i64, align 8, !opID !583, !opCode !6, !bitwidth !7, !numUses !31
  store i32 %il, i32* %il.addr, align 4, !opID !584, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %nbl, i32* %nbl.addr, align 4, !opID !585, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i64* %wd to i8*, !opID !586, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #6, !opID !587, !opCode !22, !bitwidth !7, !numUses !7
  %1 = load i32, i32* %nbl.addr, align 4, !opID !588, !opCode !17, !bitwidth !39, !numUses !8
  %conv = sext i32 %1 to i64, !opID !589, !opCode !93, !bitwidth !94, !numUses !8
  %mul = mul i64 %conv, 127, !opID !590, !opCode !101, !bitwidth !94, !numUses !8
  %shr = ashr i64 %mul, 7, !opID !591, !opCode !219, !bitwidth !94, !numUses !8
  store i64 %shr, i64* %wd, align 8, !opID !592, !opCode !13, !bitwidth !7, !numUses !7
  %2 = load i64, i64* %wd, align 8, !opID !593, !opCode !17, !bitwidth !94, !numUses !8
  %conv1 = trunc i64 %2 to i32, !opID !594, !opCode !221, !bitwidth !39, !numUses !8
  %3 = load i32, i32* %il.addr, align 4, !opID !595, !opCode !17, !bitwidth !39, !numUses !8
  %shr2 = ashr i32 %3, 2, !opID !596, !opCode !219, !bitwidth !39, !numUses !8
  %idxprom = sext i32 %shr2 to i64, !opID !597, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @wl_code_table, i64 0, i64 %idxprom, !opID !598, !opCode !19, !bitwidth !7, !numUses !8
  %4 = load i32, i32* %arrayidx, align 4, !opID !599, !opCode !17, !bitwidth !39, !numUses !8
  %add = add i32 %conv1, %4, !opID !600, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add, i32* %nbl.addr, align 4, !opID !601, !opCode !13, !bitwidth !7, !numUses !7
  %5 = load i32, i32* %nbl.addr, align 4, !opID !602, !opCode !17, !bitwidth !39, !numUses !8
  %cmp = icmp slt i32 %5, 0, !opID !603, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp, label %if.then, label %if.end, !opID !604, !opCode !43, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %entry
  store i32 0, i32* %nbl.addr, align 4, !opID !605, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !606, !opCode !43, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32, i32* %nbl.addr, align 4, !opID !607, !opCode !17, !bitwidth !39, !numUses !8
  %cmp3 = icmp sgt i32 %6, 18432, !opID !608, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp3, label %if.then4, label %if.end5, !opID !609, !opCode !43, !bitwidth !7, !numUses !7

if.then4:                                         ; preds = %if.end
  store i32 18432, i32* %nbl.addr, align 4, !opID !610, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end5, !opID !611, !opCode !43, !bitwidth !7, !numUses !7

if.end5:                                          ; preds = %if.then4, %if.end
  %7 = load i32, i32* %nbl.addr, align 4, !opID !612, !opCode !17, !bitwidth !39, !numUses !8
  %8 = bitcast i64* %wd to i8*, !opID !613, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %8) #6, !opID !614, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %7, !opID !615, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @scalel(i32 %nbl, i32 %shift_constant) #4 {
entry:
  %nbl.addr = alloca i32, align 4, !opID !616, !opCode !6, !bitwidth !7, !numUses !11
  %shift_constant.addr = alloca i32, align 4, !opID !617, !opCode !6, !bitwidth !7, !numUses !57
  %wd1 = alloca i32, align 4, !opID !618, !opCode !6, !bitwidth !7, !numUses !31
  %wd2 = alloca i32, align 4, !opID !619, !opCode !6, !bitwidth !7, !numUses !31
  %wd3 = alloca i32, align 4, !opID !620, !opCode !6, !bitwidth !7, !numUses !31
  store i32 %nbl, i32* %nbl.addr, align 4, !opID !621, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %shift_constant, i32* %shift_constant.addr, align 4, !opID !622, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %wd1 to i8*, !opID !623, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !624, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i32* %wd2 to i8*, !opID !625, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6, !opID !626, !opCode !22, !bitwidth !7, !numUses !7
  %2 = bitcast i32* %wd3 to i8*, !opID !627, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #6, !opID !628, !opCode !22, !bitwidth !7, !numUses !7
  %3 = load i32, i32* %nbl.addr, align 4, !opID !629, !opCode !17, !bitwidth !39, !numUses !8
  %shr = ashr i32 %3, 6, !opID !630, !opCode !219, !bitwidth !39, !numUses !8
  %and = and i32 %shr, 31, !opID !631, !opCode !632, !bitwidth !39, !numUses !8
  store i32 %and, i32* %wd1, align 4, !opID !633, !opCode !13, !bitwidth !7, !numUses !7
  %4 = load i32, i32* %nbl.addr, align 4, !opID !634, !opCode !17, !bitwidth !39, !numUses !8
  %shr1 = ashr i32 %4, 11, !opID !635, !opCode !219, !bitwidth !39, !numUses !8
  store i32 %shr1, i32* %wd2, align 4, !opID !636, !opCode !13, !bitwidth !7, !numUses !7
  %5 = load i32, i32* %wd1, align 4, !opID !637, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom = sext i32 %5 to i64, !opID !638, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx = getelementptr inbounds [32 x i32], [32 x i32]* @ilb_table, i64 0, i64 %idxprom, !opID !639, !opCode !19, !bitwidth !7, !numUses !8
  %6 = load i32, i32* %arrayidx, align 4, !opID !640, !opCode !17, !bitwidth !39, !numUses !8
  %7 = load i32, i32* %shift_constant.addr, align 4, !opID !641, !opCode !17, !bitwidth !39, !numUses !8
  %add = add i32 %7, 1, !opID !642, !opCode !134, !bitwidth !39, !numUses !8
  %8 = load i32, i32* %wd2, align 4, !opID !643, !opCode !17, !bitwidth !39, !numUses !8
  %sub = sub i32 %add, %8, !opID !644, !opCode !49, !bitwidth !39, !numUses !8
  %shr2 = ashr i32 %6, %sub, !opID !645, !opCode !219, !bitwidth !39, !numUses !8
  store i32 %shr2, i32* %wd3, align 4, !opID !646, !opCode !13, !bitwidth !7, !numUses !7
  %9 = load i32, i32* %wd3, align 4, !opID !647, !opCode !17, !bitwidth !39, !numUses !8
  %shl = shl i32 %9, 3, !opID !648, !opCode !389, !bitwidth !39, !numUses !8
  %10 = bitcast i32* %wd3 to i8*, !opID !649, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #6, !opID !650, !opCode !22, !bitwidth !7, !numUses !7
  %11 = bitcast i32* %wd2 to i8*, !opID !651, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %11) #6, !opID !652, !opCode !22, !bitwidth !7, !numUses !7
  %12 = bitcast i32* %wd1 to i8*, !opID !653, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %12) #6, !opID !654, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %shl, !opID !655, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define void @upzero(i32 %dlt, i32* %dlti, i32* %bli) #4 {
entry:
  %dlt.addr = alloca i32, align 4, !opID !656, !opCode !6, !bitwidth !7, !numUses !31
  %dlti.addr = alloca i32*, align 8, !opID !657, !opCode !6, !bitwidth !7, !numUses !658
  %bli.addr = alloca i32*, align 8, !opID !659, !opCode !6, !bitwidth !7, !numUses !33
  %i = alloca i32, align 4, !opID !660, !opCode !6, !bitwidth !7, !numUses !62
  %wd2 = alloca i32, align 4, !opID !661, !opCode !6, !bitwidth !7, !numUses !33
  %wd3 = alloca i32, align 4, !opID !662, !opCode !6, !bitwidth !7, !numUses !31
  store i32 %dlt, i32* %dlt.addr, align 4, !opID !663, !opCode !13, !bitwidth !7, !numUses !7
  store i32* %dlti, i32** %dlti.addr, align 8, !opID !664, !opCode !13, !bitwidth !7, !numUses !7
  store i32* %bli, i32** %bli.addr, align 8, !opID !665, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %i to i8*, !opID !666, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !667, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i32* %wd2 to i8*, !opID !668, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6, !opID !669, !opCode !22, !bitwidth !7, !numUses !7
  %2 = bitcast i32* %wd3 to i8*, !opID !670, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #6, !opID !671, !opCode !22, !bitwidth !7, !numUses !7
  %3 = load i32, i32* %dlt.addr, align 4, !opID !672, !opCode !17, !bitwidth !39, !numUses !8
  %cmp = icmp eq i32 %3, 0, !opID !673, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp, label %if.then, label %if.else, !opID !674, !opCode !43, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %entry
  br label %upzero_label10, !opID !675, !opCode !43, !bitwidth !7, !numUses !7

upzero_label10:                                   ; preds = %if.then
  store i32 0, i32* %i, align 4, !opID !676, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !opID !677, !opCode !43, !bitwidth !7, !numUses !7

for.cond:                                         ; preds = %for.inc, %upzero_label10
  %4 = load i32, i32* %i, align 4, !opID !678, !opCode !17, !bitwidth !39, !numUses !8
  %cmp1 = icmp slt i32 %4, 6, !opID !679, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp1, label %for.body, label %for.end, !opID !680, !opCode !43, !bitwidth !7, !numUses !7

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %bli.addr, align 8, !opID !681, !opCode !17, !bitwidth !7, !numUses !8
  %6 = load i32, i32* %i, align 4, !opID !682, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom = sext i32 %6 to i64, !opID !683, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !opID !684, !opCode !19, !bitwidth !7, !numUses !8
  %7 = load i32, i32* %arrayidx, align 4, !opID !685, !opCode !17, !bitwidth !39, !numUses !8
  %conv = sext i32 %7 to i64, !opID !686, !opCode !93, !bitwidth !94, !numUses !8
  %mul = mul i64 255, %conv, !opID !687, !opCode !101, !bitwidth !94, !numUses !8
  %shr = ashr i64 %mul, 8, !opID !688, !opCode !219, !bitwidth !94, !numUses !8
  %conv2 = trunc i64 %shr to i32, !opID !689, !opCode !221, !bitwidth !39, !numUses !8
  %8 = load i32*, i32** %bli.addr, align 8, !opID !690, !opCode !17, !bitwidth !7, !numUses !8
  %9 = load i32, i32* %i, align 4, !opID !691, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom3 = sext i32 %9 to i64, !opID !692, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %idxprom3, !opID !693, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %conv2, i32* %arrayidx4, align 4, !opID !694, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc, !opID !695, !opCode !43, !bitwidth !7, !numUses !7

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !opID !696, !opCode !17, !bitwidth !39, !numUses !8
  %inc = add i32 %10, 1, !opID !697, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %inc, i32* %i, align 4, !opID !698, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !llvm.loop !699, !opID !701, !opCode !43, !bitwidth !7, !numUses !7

for.end:                                          ; preds = %for.cond
  br label %if.end27, !opID !702, !opCode !43, !bitwidth !7, !numUses !7

if.else:                                          ; preds = %entry
  br label %upzero_label11, !opID !703, !opCode !43, !bitwidth !7, !numUses !7

upzero_label11:                                   ; preds = %if.else
  store i32 0, i32* %i, align 4, !opID !704, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond5, !opID !705, !opCode !43, !bitwidth !7, !numUses !7

for.cond5:                                        ; preds = %for.inc24, %upzero_label11
  %11 = load i32, i32* %i, align 4, !opID !706, !opCode !17, !bitwidth !39, !numUses !8
  %cmp6 = icmp slt i32 %11, 6, !opID !707, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp6, label %for.body7, label %for.end26, !opID !708, !opCode !43, !bitwidth !7, !numUses !7

for.body7:                                        ; preds = %for.cond5
  %12 = load i32, i32* %dlt.addr, align 4, !opID !709, !opCode !17, !bitwidth !39, !numUses !8
  %conv8 = sext i32 %12 to i64, !opID !710, !opCode !93, !bitwidth !94, !numUses !8
  %13 = load i32*, i32** %dlti.addr, align 8, !opID !711, !opCode !17, !bitwidth !7, !numUses !8
  %14 = load i32, i32* %i, align 4, !opID !712, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom9 = sext i32 %14 to i64, !opID !713, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx10 = getelementptr inbounds i32, i32* %13, i64 %idxprom9, !opID !714, !opCode !19, !bitwidth !7, !numUses !8
  %15 = load i32, i32* %arrayidx10, align 4, !opID !715, !opCode !17, !bitwidth !39, !numUses !8
  %conv11 = sext i32 %15 to i64, !opID !716, !opCode !93, !bitwidth !94, !numUses !8
  %mul12 = mul i64 %conv8, %conv11, !opID !717, !opCode !101, !bitwidth !94, !numUses !8
  %cmp13 = icmp sge i64 %mul12, 0, !opID !718, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp13, label %if.then14, label %if.else15, !opID !719, !opCode !43, !bitwidth !7, !numUses !7

if.then14:                                        ; preds = %for.body7
  store i32 128, i32* %wd2, align 4, !opID !720, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !721, !opCode !43, !bitwidth !7, !numUses !7

if.else15:                                        ; preds = %for.body7
  store i32 -128, i32* %wd2, align 4, !opID !722, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !723, !opCode !43, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %if.else15, %if.then14
  %16 = load i32*, i32** %bli.addr, align 8, !opID !724, !opCode !17, !bitwidth !7, !numUses !8
  %17 = load i32, i32* %i, align 4, !opID !725, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom16 = sext i32 %17 to i64, !opID !726, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx17 = getelementptr inbounds i32, i32* %16, i64 %idxprom16, !opID !727, !opCode !19, !bitwidth !7, !numUses !8
  %18 = load i32, i32* %arrayidx17, align 4, !opID !728, !opCode !17, !bitwidth !39, !numUses !8
  %conv18 = sext i32 %18 to i64, !opID !729, !opCode !93, !bitwidth !94, !numUses !8
  %mul19 = mul i64 255, %conv18, !opID !730, !opCode !101, !bitwidth !94, !numUses !8
  %shr20 = ashr i64 %mul19, 8, !opID !731, !opCode !219, !bitwidth !94, !numUses !8
  %conv21 = trunc i64 %shr20 to i32, !opID !732, !opCode !221, !bitwidth !39, !numUses !8
  store i32 %conv21, i32* %wd3, align 4, !opID !733, !opCode !13, !bitwidth !7, !numUses !7
  %19 = load i32, i32* %wd2, align 4, !opID !734, !opCode !17, !bitwidth !39, !numUses !8
  %20 = load i32, i32* %wd3, align 4, !opID !735, !opCode !17, !bitwidth !39, !numUses !8
  %add = add i32 %19, %20, !opID !736, !opCode !134, !bitwidth !39, !numUses !8
  %21 = load i32*, i32** %bli.addr, align 8, !opID !737, !opCode !17, !bitwidth !7, !numUses !8
  %22 = load i32, i32* %i, align 4, !opID !738, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom22 = sext i32 %22 to i64, !opID !739, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx23 = getelementptr inbounds i32, i32* %21, i64 %idxprom22, !opID !740, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %add, i32* %arrayidx23, align 4, !opID !741, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc24, !opID !742, !opCode !43, !bitwidth !7, !numUses !7

for.inc24:                                        ; preds = %if.end
  %23 = load i32, i32* %i, align 4, !opID !743, !opCode !17, !bitwidth !39, !numUses !8
  %inc25 = add i32 %23, 1, !opID !744, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %inc25, i32* %i, align 4, !opID !745, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond5, !llvm.loop !746, !opID !748, !opCode !43, !bitwidth !7, !numUses !7

for.end26:                                        ; preds = %for.cond5
  br label %if.end27, !opID !749, !opCode !43, !bitwidth !7, !numUses !7

if.end27:                                         ; preds = %for.end26, %for.end
  %24 = load i32*, i32** %dlti.addr, align 8, !opID !750, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx28 = getelementptr inbounds i32, i32* %24, i64 4, !opID !751, !opCode !19, !bitwidth !7, !numUses !8
  %25 = load i32, i32* %arrayidx28, align 4, !opID !752, !opCode !17, !bitwidth !39, !numUses !8
  %26 = load i32*, i32** %dlti.addr, align 8, !opID !753, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx29 = getelementptr inbounds i32, i32* %26, i64 5, !opID !754, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %25, i32* %arrayidx29, align 4, !opID !755, !opCode !13, !bitwidth !7, !numUses !7
  %27 = load i32*, i32** %dlti.addr, align 8, !opID !756, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx30 = getelementptr inbounds i32, i32* %27, i64 3, !opID !757, !opCode !19, !bitwidth !7, !numUses !8
  %28 = load i32, i32* %arrayidx30, align 4, !opID !758, !opCode !17, !bitwidth !39, !numUses !8
  %29 = load i32*, i32** %dlti.addr, align 8, !opID !759, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx31 = getelementptr inbounds i32, i32* %29, i64 4, !opID !760, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %28, i32* %arrayidx31, align 4, !opID !761, !opCode !13, !bitwidth !7, !numUses !7
  %30 = load i32*, i32** %dlti.addr, align 8, !opID !762, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx32 = getelementptr inbounds i32, i32* %30, i64 2, !opID !763, !opCode !19, !bitwidth !7, !numUses !8
  %31 = load i32, i32* %arrayidx32, align 4, !opID !764, !opCode !17, !bitwidth !39, !numUses !8
  %32 = load i32*, i32** %dlti.addr, align 8, !opID !765, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx33 = getelementptr inbounds i32, i32* %32, i64 3, !opID !766, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %31, i32* %arrayidx33, align 4, !opID !767, !opCode !13, !bitwidth !7, !numUses !7
  %33 = load i32*, i32** %dlti.addr, align 8, !opID !768, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx34 = getelementptr inbounds i32, i32* %33, i64 1, !opID !769, !opCode !19, !bitwidth !7, !numUses !8
  %34 = load i32, i32* %arrayidx34, align 4, !opID !770, !opCode !17, !bitwidth !39, !numUses !8
  %35 = load i32*, i32** %dlti.addr, align 8, !opID !771, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx35 = getelementptr inbounds i32, i32* %35, i64 2, !opID !772, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %34, i32* %arrayidx35, align 4, !opID !773, !opCode !13, !bitwidth !7, !numUses !7
  %36 = load i32*, i32** %dlti.addr, align 8, !opID !774, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx36 = getelementptr inbounds i32, i32* %36, i64 0, !opID !775, !opCode !19, !bitwidth !7, !numUses !8
  %37 = load i32, i32* %arrayidx36, align 4, !opID !776, !opCode !17, !bitwidth !39, !numUses !8
  %38 = load i32*, i32** %dlti.addr, align 8, !opID !777, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx37 = getelementptr inbounds i32, i32* %38, i64 1, !opID !778, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %37, i32* %arrayidx37, align 4, !opID !779, !opCode !13, !bitwidth !7, !numUses !7
  %39 = load i32, i32* %dlt.addr, align 4, !opID !780, !opCode !17, !bitwidth !39, !numUses !8
  %40 = load i32*, i32** %dlti.addr, align 8, !opID !781, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx38 = getelementptr inbounds i32, i32* %40, i64 0, !opID !782, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %39, i32* %arrayidx38, align 4, !opID !783, !opCode !13, !bitwidth !7, !numUses !7
  %41 = bitcast i32* %wd3 to i8*, !opID !784, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %41) #6, !opID !785, !opCode !22, !bitwidth !7, !numUses !7
  %42 = bitcast i32* %wd2 to i8*, !opID !786, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %42) #6, !opID !787, !opCode !22, !bitwidth !7, !numUses !7
  %43 = bitcast i32* %i to i8*, !opID !788, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %43) #6, !opID !789, !opCode !22, !bitwidth !7, !numUses !7
  ret void, !opID !790, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @uppol2(i32 %al1, i32 %al2, i32 %plt, i32 %plt1, i32 %plt2) #4 {
entry:
  %al1.addr = alloca i32, align 4, !opID !791, !opCode !6, !bitwidth !7, !numUses !57
  %al2.addr = alloca i32, align 4, !opID !792, !opCode !6, !bitwidth !7, !numUses !57
  %plt.addr = alloca i32, align 4, !opID !793, !opCode !6, !bitwidth !7, !numUses !11
  %plt1.addr = alloca i32, align 4, !opID !794, !opCode !6, !bitwidth !7, !numUses !57
  %plt2.addr = alloca i32, align 4, !opID !795, !opCode !6, !bitwidth !7, !numUses !57
  %wd2 = alloca i64, align 8, !opID !796, !opCode !6, !bitwidth !7, !numUses !67
  %wd4 = alloca i64, align 8, !opID !797, !opCode !6, !bitwidth !7, !numUses !33
  %apl2 = alloca i32, align 4, !opID !798, !opCode !6, !bitwidth !7, !numUses !470
  store i32 %al1, i32* %al1.addr, align 4, !opID !799, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %al2, i32* %al2.addr, align 4, !opID !800, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %plt, i32* %plt.addr, align 4, !opID !801, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %plt1, i32* %plt1.addr, align 4, !opID !802, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %plt2, i32* %plt2.addr, align 4, !opID !803, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i64* %wd2 to i8*, !opID !804, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #6, !opID !805, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i64* %wd4 to i8*, !opID !806, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #6, !opID !807, !opCode !22, !bitwidth !7, !numUses !7
  %2 = bitcast i32* %apl2 to i8*, !opID !808, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #6, !opID !809, !opCode !22, !bitwidth !7, !numUses !7
  %3 = load i32, i32* %al1.addr, align 4, !opID !810, !opCode !17, !bitwidth !39, !numUses !8
  %conv = sext i32 %3 to i64, !opID !811, !opCode !93, !bitwidth !94, !numUses !8
  %mul = mul i64 4, %conv, !opID !812, !opCode !101, !bitwidth !94, !numUses !8
  store i64 %mul, i64* %wd2, align 8, !opID !813, !opCode !13, !bitwidth !7, !numUses !7
  %4 = load i32, i32* %plt.addr, align 4, !opID !814, !opCode !17, !bitwidth !39, !numUses !8
  %conv1 = sext i32 %4 to i64, !opID !815, !opCode !93, !bitwidth !94, !numUses !8
  %5 = load i32, i32* %plt1.addr, align 4, !opID !816, !opCode !17, !bitwidth !39, !numUses !8
  %conv2 = sext i32 %5 to i64, !opID !817, !opCode !93, !bitwidth !94, !numUses !8
  %mul3 = mul i64 %conv1, %conv2, !opID !818, !opCode !101, !bitwidth !94, !numUses !8
  %cmp = icmp sge i64 %mul3, 0, !opID !819, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp, label %if.then, label %if.end, !opID !820, !opCode !43, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %entry
  %6 = load i64, i64* %wd2, align 8, !opID !821, !opCode !17, !bitwidth !94, !numUses !8
  %sub = sub i64 0, %6, !opID !822, !opCode !49, !bitwidth !94, !numUses !8
  store i64 %sub, i64* %wd2, align 8, !opID !823, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !824, !opCode !43, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %if.then, %entry
  %7 = load i64, i64* %wd2, align 8, !opID !825, !opCode !17, !bitwidth !94, !numUses !8
  %shr = ashr i64 %7, 7, !opID !826, !opCode !219, !bitwidth !94, !numUses !8
  store i64 %shr, i64* %wd2, align 8, !opID !827, !opCode !13, !bitwidth !7, !numUses !7
  %8 = load i32, i32* %plt.addr, align 4, !opID !828, !opCode !17, !bitwidth !39, !numUses !8
  %conv4 = sext i32 %8 to i64, !opID !829, !opCode !93, !bitwidth !94, !numUses !8
  %9 = load i32, i32* %plt2.addr, align 4, !opID !830, !opCode !17, !bitwidth !39, !numUses !8
  %conv5 = sext i32 %9 to i64, !opID !831, !opCode !93, !bitwidth !94, !numUses !8
  %mul6 = mul i64 %conv4, %conv5, !opID !832, !opCode !101, !bitwidth !94, !numUses !8
  %cmp7 = icmp sge i64 %mul6, 0, !opID !833, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp7, label %if.then8, label %if.else, !opID !834, !opCode !43, !bitwidth !7, !numUses !7

if.then8:                                         ; preds = %if.end
  %10 = load i64, i64* %wd2, align 8, !opID !835, !opCode !17, !bitwidth !94, !numUses !8
  %add = add i64 %10, 128, !opID !836, !opCode !134, !bitwidth !94, !numUses !8
  store i64 %add, i64* %wd4, align 8, !opID !837, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end10, !opID !838, !opCode !43, !bitwidth !7, !numUses !7

if.else:                                          ; preds = %if.end
  %11 = load i64, i64* %wd2, align 8, !opID !839, !opCode !17, !bitwidth !94, !numUses !8
  %sub9 = sub i64 %11, 128, !opID !840, !opCode !49, !bitwidth !94, !numUses !8
  store i64 %sub9, i64* %wd4, align 8, !opID !841, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end10, !opID !842, !opCode !43, !bitwidth !7, !numUses !7

if.end10:                                         ; preds = %if.else, %if.then8
  %12 = load i64, i64* %wd4, align 8, !opID !843, !opCode !17, !bitwidth !94, !numUses !8
  %13 = load i32, i32* %al2.addr, align 4, !opID !844, !opCode !17, !bitwidth !39, !numUses !8
  %conv11 = sext i32 %13 to i64, !opID !845, !opCode !93, !bitwidth !94, !numUses !8
  %mul12 = mul i64 127, %conv11, !opID !846, !opCode !101, !bitwidth !94, !numUses !8
  %shr13 = ashr i64 %mul12, 7, !opID !847, !opCode !219, !bitwidth !94, !numUses !8
  %add14 = add i64 %12, %shr13, !opID !848, !opCode !134, !bitwidth !94, !numUses !8
  %conv15 = trunc i64 %add14 to i32, !opID !849, !opCode !221, !bitwidth !39, !numUses !8
  store i32 %conv15, i32* %apl2, align 4, !opID !850, !opCode !13, !bitwidth !7, !numUses !7
  %14 = load i32, i32* %apl2, align 4, !opID !851, !opCode !17, !bitwidth !39, !numUses !8
  %cmp16 = icmp sgt i32 %14, 12288, !opID !852, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp16, label %if.then17, label %if.end18, !opID !853, !opCode !43, !bitwidth !7, !numUses !7

if.then17:                                        ; preds = %if.end10
  store i32 12288, i32* %apl2, align 4, !opID !854, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end18, !opID !855, !opCode !43, !bitwidth !7, !numUses !7

if.end18:                                         ; preds = %if.then17, %if.end10
  %15 = load i32, i32* %apl2, align 4, !opID !856, !opCode !17, !bitwidth !39, !numUses !8
  %cmp19 = icmp slt i32 %15, -12288, !opID !857, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp19, label %if.then20, label %if.end21, !opID !858, !opCode !43, !bitwidth !7, !numUses !7

if.then20:                                        ; preds = %if.end18
  store i32 -12288, i32* %apl2, align 4, !opID !859, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end21, !opID !860, !opCode !43, !bitwidth !7, !numUses !7

if.end21:                                         ; preds = %if.then20, %if.end18
  %16 = load i32, i32* %apl2, align 4, !opID !861, !opCode !17, !bitwidth !39, !numUses !8
  %17 = bitcast i32* %apl2 to i8*, !opID !862, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #6, !opID !863, !opCode !22, !bitwidth !7, !numUses !7
  %18 = bitcast i64* %wd4 to i8*, !opID !864, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #6, !opID !865, !opCode !22, !bitwidth !7, !numUses !7
  %19 = bitcast i64* %wd2 to i8*, !opID !866, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #6, !opID !867, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %16, !opID !868, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @uppol1(i32 %al1, i32 %apl2, i32 %plt, i32 %plt1) #4 {
entry:
  %al1.addr = alloca i32, align 4, !opID !869, !opCode !6, !bitwidth !7, !numUses !57
  %apl2.addr = alloca i32, align 4, !opID !870, !opCode !6, !bitwidth !7, !numUses !57
  %plt.addr = alloca i32, align 4, !opID !871, !opCode !6, !bitwidth !7, !numUses !57
  %plt1.addr = alloca i32, align 4, !opID !872, !opCode !6, !bitwidth !7, !numUses !57
  %wd2 = alloca i64, align 8, !opID !873, !opCode !6, !bitwidth !7, !numUses !33
  %wd3 = alloca i32, align 4, !opID !874, !opCode !6, !bitwidth !7, !numUses !875
  %apl1 = alloca i32, align 4, !opID !876, !opCode !6, !bitwidth !7, !numUses !67
  store i32 %al1, i32* %al1.addr, align 4, !opID !877, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %apl2, i32* %apl2.addr, align 4, !opID !878, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %plt, i32* %plt.addr, align 4, !opID !879, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %plt1, i32* %plt1.addr, align 4, !opID !880, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i64* %wd2 to i8*, !opID !881, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #6, !opID !882, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i32* %wd3 to i8*, !opID !883, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6, !opID !884, !opCode !22, !bitwidth !7, !numUses !7
  %2 = bitcast i32* %apl1 to i8*, !opID !885, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #6, !opID !886, !opCode !22, !bitwidth !7, !numUses !7
  %3 = load i32, i32* %al1.addr, align 4, !opID !887, !opCode !17, !bitwidth !39, !numUses !8
  %conv = sext i32 %3 to i64, !opID !888, !opCode !93, !bitwidth !94, !numUses !8
  %mul = mul i64 %conv, 255, !opID !889, !opCode !101, !bitwidth !94, !numUses !8
  %shr = ashr i64 %mul, 8, !opID !890, !opCode !219, !bitwidth !94, !numUses !8
  store i64 %shr, i64* %wd2, align 8, !opID !891, !opCode !13, !bitwidth !7, !numUses !7
  %4 = load i32, i32* %plt.addr, align 4, !opID !892, !opCode !17, !bitwidth !39, !numUses !8
  %conv1 = sext i32 %4 to i64, !opID !893, !opCode !93, !bitwidth !94, !numUses !8
  %5 = load i32, i32* %plt1.addr, align 4, !opID !894, !opCode !17, !bitwidth !39, !numUses !8
  %conv2 = sext i32 %5 to i64, !opID !895, !opCode !93, !bitwidth !94, !numUses !8
  %mul3 = mul i64 %conv1, %conv2, !opID !896, !opCode !101, !bitwidth !94, !numUses !8
  %cmp = icmp sge i64 %mul3, 0, !opID !897, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp, label %if.then, label %if.else, !opID !898, !opCode !43, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %entry
  %6 = load i64, i64* %wd2, align 8, !opID !899, !opCode !17, !bitwidth !94, !numUses !8
  %conv4 = trunc i64 %6 to i32, !opID !900, !opCode !221, !bitwidth !39, !numUses !8
  %add = add i32 %conv4, 192, !opID !901, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add, i32* %apl1, align 4, !opID !902, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !903, !opCode !43, !bitwidth !7, !numUses !7

if.else:                                          ; preds = %entry
  %7 = load i64, i64* %wd2, align 8, !opID !904, !opCode !17, !bitwidth !94, !numUses !8
  %conv5 = trunc i64 %7 to i32, !opID !905, !opCode !221, !bitwidth !39, !numUses !8
  %sub = sub i32 %conv5, 192, !opID !906, !opCode !49, !bitwidth !39, !numUses !8
  store i32 %sub, i32* %apl1, align 4, !opID !907, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !908, !opCode !43, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %if.else, %if.then
  %8 = load i32, i32* %apl2.addr, align 4, !opID !909, !opCode !17, !bitwidth !39, !numUses !8
  %sub6 = sub i32 15360, %8, !opID !910, !opCode !49, !bitwidth !39, !numUses !8
  store i32 %sub6, i32* %wd3, align 4, !opID !911, !opCode !13, !bitwidth !7, !numUses !7
  %9 = load i32, i32* %apl1, align 4, !opID !912, !opCode !17, !bitwidth !39, !numUses !8
  %10 = load i32, i32* %wd3, align 4, !opID !913, !opCode !17, !bitwidth !39, !numUses !8
  %cmp7 = icmp sgt i32 %9, %10, !opID !914, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp7, label %if.then8, label %if.end9, !opID !915, !opCode !43, !bitwidth !7, !numUses !7

if.then8:                                         ; preds = %if.end
  %11 = load i32, i32* %wd3, align 4, !opID !916, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %11, i32* %apl1, align 4, !opID !917, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end9, !opID !918, !opCode !43, !bitwidth !7, !numUses !7

if.end9:                                          ; preds = %if.then8, %if.end
  %12 = load i32, i32* %apl1, align 4, !opID !919, !opCode !17, !bitwidth !39, !numUses !8
  %13 = load i32, i32* %wd3, align 4, !opID !920, !opCode !17, !bitwidth !39, !numUses !8
  %sub10 = sub i32 0, %13, !opID !921, !opCode !49, !bitwidth !39, !numUses !8
  %cmp11 = icmp slt i32 %12, %sub10, !opID !922, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp11, label %if.then12, label %if.end14, !opID !923, !opCode !43, !bitwidth !7, !numUses !7

if.then12:                                        ; preds = %if.end9
  %14 = load i32, i32* %wd3, align 4, !opID !924, !opCode !17, !bitwidth !39, !numUses !8
  %sub13 = sub i32 0, %14, !opID !925, !opCode !49, !bitwidth !39, !numUses !8
  store i32 %sub13, i32* %apl1, align 4, !opID !926, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end14, !opID !927, !opCode !43, !bitwidth !7, !numUses !7

if.end14:                                         ; preds = %if.then12, %if.end9
  %15 = load i32, i32* %apl1, align 4, !opID !928, !opCode !17, !bitwidth !39, !numUses !8
  %16 = bitcast i32* %apl1 to i8*, !opID !929, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #6, !opID !930, !opCode !22, !bitwidth !7, !numUses !7
  %17 = bitcast i32* %wd3 to i8*, !opID !931, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #6, !opID !932, !opCode !22, !bitwidth !7, !numUses !7
  %18 = bitcast i64* %wd2 to i8*, !opID !933, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #6, !opID !934, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %15, !opID !935, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @logsch(i32 %ih, i32 %nbh) #4 {
entry:
  %ih.addr = alloca i32, align 4, !opID !936, !opCode !6, !bitwidth !7, !numUses !57
  %nbh.addr = alloca i32, align 4, !opID !937, !opCode !6, !bitwidth !7, !numUses !470
  %wd = alloca i32, align 4, !opID !938, !opCode !6, !bitwidth !7, !numUses !31
  store i32 %ih, i32* %ih.addr, align 4, !opID !939, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %nbh, i32* %nbh.addr, align 4, !opID !940, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %wd to i8*, !opID !941, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !942, !opCode !22, !bitwidth !7, !numUses !7
  %1 = load i32, i32* %nbh.addr, align 4, !opID !943, !opCode !17, !bitwidth !39, !numUses !8
  %conv = sext i32 %1 to i64, !opID !944, !opCode !93, !bitwidth !94, !numUses !8
  %mul = mul i64 %conv, 127, !opID !945, !opCode !101, !bitwidth !94, !numUses !8
  %shr = ashr i64 %mul, 7, !opID !946, !opCode !219, !bitwidth !94, !numUses !8
  %conv1 = trunc i64 %shr to i32, !opID !947, !opCode !221, !bitwidth !39, !numUses !8
  store i32 %conv1, i32* %wd, align 4, !opID !948, !opCode !13, !bitwidth !7, !numUses !7
  %2 = load i32, i32* %wd, align 4, !opID !949, !opCode !17, !bitwidth !39, !numUses !8
  %3 = load i32, i32* %ih.addr, align 4, !opID !950, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom = sext i32 %3 to i64, !opID !951, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @wh_code_table, i64 0, i64 %idxprom, !opID !952, !opCode !19, !bitwidth !7, !numUses !8
  %4 = load i32, i32* %arrayidx, align 4, !opID !953, !opCode !17, !bitwidth !39, !numUses !8
  %add = add i32 %2, %4, !opID !954, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add, i32* %nbh.addr, align 4, !opID !955, !opCode !13, !bitwidth !7, !numUses !7
  %5 = load i32, i32* %nbh.addr, align 4, !opID !956, !opCode !17, !bitwidth !39, !numUses !8
  %cmp = icmp slt i32 %5, 0, !opID !957, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp, label %if.then, label %if.end, !opID !958, !opCode !43, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %entry
  store i32 0, i32* %nbh.addr, align 4, !opID !959, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !960, !opCode !43, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32, i32* %nbh.addr, align 4, !opID !961, !opCode !17, !bitwidth !39, !numUses !8
  %cmp2 = icmp sgt i32 %6, 22528, !opID !962, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp2, label %if.then3, label %if.end4, !opID !963, !opCode !43, !bitwidth !7, !numUses !7

if.then3:                                         ; preds = %if.end
  store i32 22528, i32* %nbh.addr, align 4, !opID !964, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end4, !opID !965, !opCode !43, !bitwidth !7, !numUses !7

if.end4:                                          ; preds = %if.then3, %if.end
  %7 = load i32, i32* %nbh.addr, align 4, !opID !966, !opCode !17, !bitwidth !39, !numUses !8
  %8 = bitcast i32* %wd to i8*, !opID !967, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #6, !opID !968, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %7, !opID !969, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define void @decode(i32 %input) #4 {
entry:
  %input.addr = alloca i32, align 4, !opID !970, !opCode !6, !bitwidth !7, !numUses !11
  %i = alloca i32, align 4, !opID !971, !opCode !6, !bitwidth !7, !numUses !60
  %xa1 = alloca i64, align 8, !opID !972, !opCode !6, !bitwidth !7, !numUses !470
  %xa2 = alloca i64, align 8, !opID !973, !opCode !6, !bitwidth !7, !numUses !470
  %h_ptr = alloca i32*, align 8, !opID !974, !opCode !6, !bitwidth !7, !numUses !62
  %ac_ptr = alloca i32*, align 8, !opID !975, !opCode !6, !bitwidth !7, !numUses !60
  %ac_ptr1 = alloca i32*, align 8, !opID !976, !opCode !6, !bitwidth !7, !numUses !33
  %ad_ptr = alloca i32*, align 8, !opID !977, !opCode !6, !bitwidth !7, !numUses !60
  %ad_ptr1 = alloca i32*, align 8, !opID !978, !opCode !6, !bitwidth !7, !numUses !33
  store i32 %input, i32* %input.addr, align 4, !opID !979, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %i to i8*, !opID !980, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !981, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i64* %xa1 to i8*, !opID !982, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #6, !opID !983, !opCode !22, !bitwidth !7, !numUses !7
  %2 = bitcast i64* %xa2 to i8*, !opID !984, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #6, !opID !985, !opCode !22, !bitwidth !7, !numUses !7
  %3 = bitcast i32** %h_ptr to i8*, !opID !986, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #6, !opID !987, !opCode !22, !bitwidth !7, !numUses !7
  %4 = bitcast i32** %ac_ptr to i8*, !opID !988, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #6, !opID !989, !opCode !22, !bitwidth !7, !numUses !7
  %5 = bitcast i32** %ac_ptr1 to i8*, !opID !990, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #6, !opID !991, !opCode !22, !bitwidth !7, !numUses !7
  %6 = bitcast i32** %ad_ptr to i8*, !opID !992, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #6, !opID !993, !opCode !22, !bitwidth !7, !numUses !7
  %7 = bitcast i32** %ad_ptr1 to i8*, !opID !994, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #6, !opID !995, !opCode !22, !bitwidth !7, !numUses !7
  %8 = load i32, i32* %input.addr, align 4, !opID !996, !opCode !17, !bitwidth !39, !numUses !8
  %and = and i32 %8, 63, !opID !997, !opCode !632, !bitwidth !39, !numUses !8
  store i32 %and, i32* @ilr, align 4, !opID !998, !opCode !13, !bitwidth !7, !numUses !7
  %9 = load i32, i32* %input.addr, align 4, !opID !999, !opCode !17, !bitwidth !39, !numUses !8
  %shr = ashr i32 %9, 6, !opID !1000, !opCode !219, !bitwidth !39, !numUses !8
  store i32 %shr, i32* @ih, align 4, !opID !1001, !opCode !13, !bitwidth !7, !numUses !7
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0)), !opID !1002, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call, i32* @dec_szl, align 4, !opID !1003, !opCode !13, !bitwidth !7, !numUses !7
  %10 = load i32, i32* @dec_rlt1, align 4, !opID !1004, !opCode !17, !bitwidth !39, !numUses !8
  %11 = load i32, i32* @dec_al1, align 4, !opID !1005, !opCode !17, !bitwidth !39, !numUses !8
  %12 = load i32, i32* @dec_rlt2, align 4, !opID !1006, !opCode !17, !bitwidth !39, !numUses !8
  %13 = load i32, i32* @dec_al2, align 4, !opID !1007, !opCode !17, !bitwidth !39, !numUses !8
  %call1 = call i32 @filtep(i32 %10, i32 %11, i32 %12, i32 %13), !opID !1008, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call1, i32* @dec_spl, align 4, !opID !1009, !opCode !13, !bitwidth !7, !numUses !7
  %14 = load i32, i32* @dec_spl, align 4, !opID !1010, !opCode !17, !bitwidth !39, !numUses !8
  %15 = load i32, i32* @dec_szl, align 4, !opID !1011, !opCode !17, !bitwidth !39, !numUses !8
  %add = add i32 %14, %15, !opID !1012, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add, i32* @dec_sl, align 4, !opID !1013, !opCode !13, !bitwidth !7, !numUses !7
  %16 = load i32, i32* @dec_detl, align 4, !opID !1014, !opCode !17, !bitwidth !39, !numUses !8
  %conv = sext i32 %16 to i64, !opID !1015, !opCode !93, !bitwidth !94, !numUses !8
  %17 = load i32, i32* @ilr, align 4, !opID !1016, !opCode !17, !bitwidth !39, !numUses !8
  %shr2 = ashr i32 %17, 2, !opID !1017, !opCode !219, !bitwidth !39, !numUses !8
  %idxprom = sext i32 %shr2 to i64, !opID !1018, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i64 0, i64 %idxprom, !opID !1019, !opCode !19, !bitwidth !7, !numUses !8
  %18 = load i32, i32* %arrayidx, align 4, !opID !1020, !opCode !17, !bitwidth !39, !numUses !8
  %conv3 = sext i32 %18 to i64, !opID !1021, !opCode !93, !bitwidth !94, !numUses !8
  %mul = mul i64 %conv, %conv3, !opID !1022, !opCode !101, !bitwidth !94, !numUses !8
  %shr4 = ashr i64 %mul, 15, !opID !1023, !opCode !219, !bitwidth !94, !numUses !8
  %conv5 = trunc i64 %shr4 to i32, !opID !1024, !opCode !221, !bitwidth !39, !numUses !8
  store i32 %conv5, i32* @dec_dlt, align 4, !opID !1025, !opCode !13, !bitwidth !7, !numUses !7
  %19 = load i32, i32* @dec_detl, align 4, !opID !1026, !opCode !17, !bitwidth !39, !numUses !8
  %conv6 = sext i32 %19 to i64, !opID !1027, !opCode !93, !bitwidth !94, !numUses !8
  %20 = load i32, i32* @il, align 4, !opID !1028, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom7 = sext i32 %20 to i64, !opID !1029, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx8 = getelementptr inbounds [64 x i32], [64 x i32]* @qq6_code6_table, i64 0, i64 %idxprom7, !opID !1030, !opCode !19, !bitwidth !7, !numUses !8
  %21 = load i32, i32* %arrayidx8, align 4, !opID !1031, !opCode !17, !bitwidth !39, !numUses !8
  %conv9 = sext i32 %21 to i64, !opID !1032, !opCode !93, !bitwidth !94, !numUses !8
  %mul10 = mul i64 %conv6, %conv9, !opID !1033, !opCode !101, !bitwidth !94, !numUses !8
  %shr11 = ashr i64 %mul10, 15, !opID !1034, !opCode !219, !bitwidth !94, !numUses !8
  %conv12 = trunc i64 %shr11 to i32, !opID !1035, !opCode !221, !bitwidth !39, !numUses !8
  store i32 %conv12, i32* @dl, align 4, !opID !1036, !opCode !13, !bitwidth !7, !numUses !7
  %22 = load i32, i32* @dl, align 4, !opID !1037, !opCode !17, !bitwidth !39, !numUses !8
  %23 = load i32, i32* @dec_sl, align 4, !opID !1038, !opCode !17, !bitwidth !39, !numUses !8
  %add13 = add i32 %22, %23, !opID !1039, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add13, i32* @rl, align 4, !opID !1040, !opCode !13, !bitwidth !7, !numUses !7
  %24 = load i32, i32* @ilr, align 4, !opID !1041, !opCode !17, !bitwidth !39, !numUses !8
  %25 = load i32, i32* @dec_nbl, align 4, !opID !1042, !opCode !17, !bitwidth !39, !numUses !8
  %call14 = call i32 @logscl(i32 %24, i32 %25), !opID !1043, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call14, i32* @dec_nbl, align 4, !opID !1044, !opCode !13, !bitwidth !7, !numUses !7
  %26 = load i32, i32* @dec_nbl, align 4, !opID !1045, !opCode !17, !bitwidth !39, !numUses !8
  %call15 = call i32 @scalel(i32 %26, i32 8), !opID !1046, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call15, i32* @dec_detl, align 4, !opID !1047, !opCode !13, !bitwidth !7, !numUses !7
  %27 = load i32, i32* @dec_dlt, align 4, !opID !1048, !opCode !17, !bitwidth !39, !numUses !8
  %28 = load i32, i32* @dec_szl, align 4, !opID !1049, !opCode !17, !bitwidth !39, !numUses !8
  %add16 = add i32 %27, %28, !opID !1050, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add16, i32* @dec_plt, align 4, !opID !1051, !opCode !13, !bitwidth !7, !numUses !7
  %29 = load i32, i32* @dec_dlt, align 4, !opID !1052, !opCode !17, !bitwidth !39, !numUses !8
  call void @upzero(i32 %29, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0)), !opID !1053, !opCode !22, !bitwidth !7, !numUses !7
  %30 = load i32, i32* @dec_al1, align 4, !opID !1054, !opCode !17, !bitwidth !39, !numUses !8
  %31 = load i32, i32* @dec_al2, align 4, !opID !1055, !opCode !17, !bitwidth !39, !numUses !8
  %32 = load i32, i32* @dec_plt, align 4, !opID !1056, !opCode !17, !bitwidth !39, !numUses !8
  %33 = load i32, i32* @dec_plt1, align 4, !opID !1057, !opCode !17, !bitwidth !39, !numUses !8
  %34 = load i32, i32* @dec_plt2, align 4, !opID !1058, !opCode !17, !bitwidth !39, !numUses !8
  %call17 = call i32 @uppol2(i32 %30, i32 %31, i32 %32, i32 %33, i32 %34), !opID !1059, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call17, i32* @dec_al2, align 4, !opID !1060, !opCode !13, !bitwidth !7, !numUses !7
  %35 = load i32, i32* @dec_al1, align 4, !opID !1061, !opCode !17, !bitwidth !39, !numUses !8
  %36 = load i32, i32* @dec_al2, align 4, !opID !1062, !opCode !17, !bitwidth !39, !numUses !8
  %37 = load i32, i32* @dec_plt, align 4, !opID !1063, !opCode !17, !bitwidth !39, !numUses !8
  %38 = load i32, i32* @dec_plt1, align 4, !opID !1064, !opCode !17, !bitwidth !39, !numUses !8
  %call18 = call i32 @uppol1(i32 %35, i32 %36, i32 %37, i32 %38), !opID !1065, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call18, i32* @dec_al1, align 4, !opID !1066, !opCode !13, !bitwidth !7, !numUses !7
  %39 = load i32, i32* @dec_sl, align 4, !opID !1067, !opCode !17, !bitwidth !39, !numUses !8
  %40 = load i32, i32* @dec_dlt, align 4, !opID !1068, !opCode !17, !bitwidth !39, !numUses !8
  %add19 = add i32 %39, %40, !opID !1069, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add19, i32* @dec_rlt, align 4, !opID !1070, !opCode !13, !bitwidth !7, !numUses !7
  %41 = load i32, i32* @dec_rlt1, align 4, !opID !1071, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %41, i32* @dec_rlt2, align 4, !opID !1072, !opCode !13, !bitwidth !7, !numUses !7
  %42 = load i32, i32* @dec_rlt, align 4, !opID !1073, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %42, i32* @dec_rlt1, align 4, !opID !1074, !opCode !13, !bitwidth !7, !numUses !7
  %43 = load i32, i32* @dec_plt1, align 4, !opID !1075, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %43, i32* @dec_plt2, align 4, !opID !1076, !opCode !13, !bitwidth !7, !numUses !7
  %44 = load i32, i32* @dec_plt, align 4, !opID !1077, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %44, i32* @dec_plt1, align 4, !opID !1078, !opCode !13, !bitwidth !7, !numUses !7
  %call20 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0)), !opID !1079, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call20, i32* @dec_szh, align 4, !opID !1080, !opCode !13, !bitwidth !7, !numUses !7
  %45 = load i32, i32* @dec_rh1, align 4, !opID !1081, !opCode !17, !bitwidth !39, !numUses !8
  %46 = load i32, i32* @dec_ah1, align 4, !opID !1082, !opCode !17, !bitwidth !39, !numUses !8
  %47 = load i32, i32* @dec_rh2, align 4, !opID !1083, !opCode !17, !bitwidth !39, !numUses !8
  %48 = load i32, i32* @dec_ah2, align 4, !opID !1084, !opCode !17, !bitwidth !39, !numUses !8
  %call21 = call i32 @filtep(i32 %45, i32 %46, i32 %47, i32 %48), !opID !1085, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call21, i32* @dec_sph, align 4, !opID !1086, !opCode !13, !bitwidth !7, !numUses !7
  %49 = load i32, i32* @dec_sph, align 4, !opID !1087, !opCode !17, !bitwidth !39, !numUses !8
  %50 = load i32, i32* @dec_szh, align 4, !opID !1088, !opCode !17, !bitwidth !39, !numUses !8
  %add22 = add i32 %49, %50, !opID !1089, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add22, i32* @dec_sh, align 4, !opID !1090, !opCode !13, !bitwidth !7, !numUses !7
  %51 = load i32, i32* @dec_deth, align 4, !opID !1091, !opCode !17, !bitwidth !39, !numUses !8
  %conv23 = sext i32 %51 to i64, !opID !1092, !opCode !93, !bitwidth !94, !numUses !8
  %52 = load i32, i32* @ih, align 4, !opID !1093, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom24 = sext i32 %52 to i64, !opID !1094, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx25 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i64 0, i64 %idxprom24, !opID !1095, !opCode !19, !bitwidth !7, !numUses !8
  %53 = load i32, i32* %arrayidx25, align 4, !opID !1096, !opCode !17, !bitwidth !39, !numUses !8
  %conv26 = sext i32 %53 to i64, !opID !1097, !opCode !93, !bitwidth !94, !numUses !8
  %mul27 = mul i64 %conv23, %conv26, !opID !1098, !opCode !101, !bitwidth !94, !numUses !8
  %shr28 = ashr i64 %mul27, 15, !opID !1099, !opCode !219, !bitwidth !94, !numUses !8
  %conv29 = trunc i64 %shr28 to i32, !opID !1100, !opCode !221, !bitwidth !39, !numUses !8
  store i32 %conv29, i32* @dec_dh, align 4, !opID !1101, !opCode !13, !bitwidth !7, !numUses !7
  %54 = load i32, i32* @ih, align 4, !opID !1102, !opCode !17, !bitwidth !39, !numUses !8
  %55 = load i32, i32* @dec_nbh, align 4, !opID !1103, !opCode !17, !bitwidth !39, !numUses !8
  %call30 = call i32 @logsch(i32 %54, i32 %55), !opID !1104, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call30, i32* @dec_nbh, align 4, !opID !1105, !opCode !13, !bitwidth !7, !numUses !7
  %56 = load i32, i32* @dec_nbh, align 4, !opID !1106, !opCode !17, !bitwidth !39, !numUses !8
  %call31 = call i32 @scalel(i32 %56, i32 10), !opID !1107, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call31, i32* @dec_deth, align 4, !opID !1108, !opCode !13, !bitwidth !7, !numUses !7
  %57 = load i32, i32* @dec_dh, align 4, !opID !1109, !opCode !17, !bitwidth !39, !numUses !8
  %58 = load i32, i32* @dec_szh, align 4, !opID !1110, !opCode !17, !bitwidth !39, !numUses !8
  %add32 = add i32 %57, %58, !opID !1111, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add32, i32* @dec_ph, align 4, !opID !1112, !opCode !13, !bitwidth !7, !numUses !7
  %59 = load i32, i32* @dec_dh, align 4, !opID !1113, !opCode !17, !bitwidth !39, !numUses !8
  call void @upzero(i32 %59, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0)), !opID !1114, !opCode !22, !bitwidth !7, !numUses !7
  %60 = load i32, i32* @dec_ah1, align 4, !opID !1115, !opCode !17, !bitwidth !39, !numUses !8
  %61 = load i32, i32* @dec_ah2, align 4, !opID !1116, !opCode !17, !bitwidth !39, !numUses !8
  %62 = load i32, i32* @dec_ph, align 4, !opID !1117, !opCode !17, !bitwidth !39, !numUses !8
  %63 = load i32, i32* @dec_ph1, align 4, !opID !1118, !opCode !17, !bitwidth !39, !numUses !8
  %64 = load i32, i32* @dec_ph2, align 4, !opID !1119, !opCode !17, !bitwidth !39, !numUses !8
  %call33 = call i32 @uppol2(i32 %60, i32 %61, i32 %62, i32 %63, i32 %64), !opID !1120, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call33, i32* @dec_ah2, align 4, !opID !1121, !opCode !13, !bitwidth !7, !numUses !7
  %65 = load i32, i32* @dec_ah1, align 4, !opID !1122, !opCode !17, !bitwidth !39, !numUses !8
  %66 = load i32, i32* @dec_ah2, align 4, !opID !1123, !opCode !17, !bitwidth !39, !numUses !8
  %67 = load i32, i32* @dec_ph, align 4, !opID !1124, !opCode !17, !bitwidth !39, !numUses !8
  %68 = load i32, i32* @dec_ph1, align 4, !opID !1125, !opCode !17, !bitwidth !39, !numUses !8
  %call34 = call i32 @uppol1(i32 %65, i32 %66, i32 %67, i32 %68), !opID !1126, !opCode !22, !bitwidth !39, !numUses !8
  store i32 %call34, i32* @dec_ah1, align 4, !opID !1127, !opCode !13, !bitwidth !7, !numUses !7
  %69 = load i32, i32* @dec_sh, align 4, !opID !1128, !opCode !17, !bitwidth !39, !numUses !8
  %70 = load i32, i32* @dec_dh, align 4, !opID !1129, !opCode !17, !bitwidth !39, !numUses !8
  %add35 = add i32 %69, %70, !opID !1130, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add35, i32* @rh, align 4, !opID !1131, !opCode !13, !bitwidth !7, !numUses !7
  %71 = load i32, i32* @dec_rh1, align 4, !opID !1132, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %71, i32* @dec_rh2, align 4, !opID !1133, !opCode !13, !bitwidth !7, !numUses !7
  %72 = load i32, i32* @rh, align 4, !opID !1134, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %72, i32* @dec_rh1, align 4, !opID !1135, !opCode !13, !bitwidth !7, !numUses !7
  %73 = load i32, i32* @dec_ph1, align 4, !opID !1136, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %73, i32* @dec_ph2, align 4, !opID !1137, !opCode !13, !bitwidth !7, !numUses !7
  %74 = load i32, i32* @dec_ph, align 4, !opID !1138, !opCode !17, !bitwidth !39, !numUses !8
  store i32 %74, i32* @dec_ph1, align 4, !opID !1139, !opCode !13, !bitwidth !7, !numUses !7
  %75 = load i32, i32* @rl, align 4, !opID !1140, !opCode !17, !bitwidth !39, !numUses !8
  %76 = load i32, i32* @rh, align 4, !opID !1141, !opCode !17, !bitwidth !39, !numUses !8
  %sub = sub i32 %75, %76, !opID !1142, !opCode !49, !bitwidth !39, !numUses !8
  store i32 %sub, i32* @xd, align 4, !opID !1143, !opCode !13, !bitwidth !7, !numUses !7
  %77 = load i32, i32* @rl, align 4, !opID !1144, !opCode !17, !bitwidth !39, !numUses !8
  %78 = load i32, i32* @rh, align 4, !opID !1145, !opCode !17, !bitwidth !39, !numUses !8
  %add36 = add i32 %77, %78, !opID !1146, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add36, i32* @xs, align 4, !opID !1147, !opCode !13, !bitwidth !7, !numUses !7
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 8, !opID !1148, !opCode !13, !bitwidth !7, !numUses !7
  store i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 0), i32** %ac_ptr, align 8, !opID !1149, !opCode !13, !bitwidth !7, !numUses !7
  store i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 0), i32** %ad_ptr, align 8, !opID !1150, !opCode !13, !bitwidth !7, !numUses !7
  %79 = load i32, i32* @xd, align 4, !opID !1151, !opCode !17, !bitwidth !39, !numUses !8
  %conv37 = sext i32 %79 to i64, !opID !1152, !opCode !93, !bitwidth !94, !numUses !8
  %80 = load i32*, i32** %h_ptr, align 8, !opID !1153, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr = getelementptr inbounds i32, i32* %80, i32 1, !opID !1154, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr, i32** %h_ptr, align 8, !opID !1155, !opCode !13, !bitwidth !7, !numUses !7
  %81 = load i32, i32* %80, align 4, !opID !1156, !opCode !17, !bitwidth !39, !numUses !8
  %conv38 = sext i32 %81 to i64, !opID !1157, !opCode !93, !bitwidth !94, !numUses !8
  %mul39 = mul i64 %conv37, %conv38, !opID !1158, !opCode !101, !bitwidth !94, !numUses !8
  store i64 %mul39, i64* %xa1, align 8, !opID !1159, !opCode !13, !bitwidth !7, !numUses !7
  %82 = load i32, i32* @xs, align 4, !opID !1160, !opCode !17, !bitwidth !39, !numUses !8
  %conv40 = sext i32 %82 to i64, !opID !1161, !opCode !93, !bitwidth !94, !numUses !8
  %83 = load i32*, i32** %h_ptr, align 8, !opID !1162, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr41 = getelementptr inbounds i32, i32* %83, i32 1, !opID !1163, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr41, i32** %h_ptr, align 8, !opID !1164, !opCode !13, !bitwidth !7, !numUses !7
  %84 = load i32, i32* %83, align 4, !opID !1165, !opCode !17, !bitwidth !39, !numUses !8
  %conv42 = sext i32 %84 to i64, !opID !1166, !opCode !93, !bitwidth !94, !numUses !8
  %mul43 = mul i64 %conv40, %conv42, !opID !1167, !opCode !101, !bitwidth !94, !numUses !8
  store i64 %mul43, i64* %xa2, align 8, !opID !1168, !opCode !13, !bitwidth !7, !numUses !7
  br label %decode_label2, !opID !1169, !opCode !43, !bitwidth !7, !numUses !7

decode_label2:                                    ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !1170, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !opID !1171, !opCode !43, !bitwidth !7, !numUses !7

for.cond:                                         ; preds = %for.inc, %decode_label2
  %85 = load i32, i32* %i, align 4, !opID !1172, !opCode !17, !bitwidth !39, !numUses !8
  %cmp = icmp slt i32 %85, 10, !opID !1173, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp, label %for.body, label %for.end, !opID !1174, !opCode !43, !bitwidth !7, !numUses !7

for.body:                                         ; preds = %for.cond
  %86 = load i32*, i32** %ac_ptr, align 8, !opID !1175, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr44 = getelementptr inbounds i32, i32* %86, i32 1, !opID !1176, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr44, i32** %ac_ptr, align 8, !opID !1177, !opCode !13, !bitwidth !7, !numUses !7
  %87 = load i32, i32* %86, align 4, !opID !1178, !opCode !17, !bitwidth !39, !numUses !8
  %conv45 = sext i32 %87 to i64, !opID !1179, !opCode !93, !bitwidth !94, !numUses !8
  %88 = load i32*, i32** %h_ptr, align 8, !opID !1180, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr46 = getelementptr inbounds i32, i32* %88, i32 1, !opID !1181, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr46, i32** %h_ptr, align 8, !opID !1182, !opCode !13, !bitwidth !7, !numUses !7
  %89 = load i32, i32* %88, align 4, !opID !1183, !opCode !17, !bitwidth !39, !numUses !8
  %conv47 = sext i32 %89 to i64, !opID !1184, !opCode !93, !bitwidth !94, !numUses !8
  %mul48 = mul i64 %conv45, %conv47, !opID !1185, !opCode !101, !bitwidth !94, !numUses !8
  %90 = load i64, i64* %xa1, align 8, !opID !1186, !opCode !17, !bitwidth !94, !numUses !8
  %add49 = add i64 %90, %mul48, !opID !1187, !opCode !134, !bitwidth !94, !numUses !8
  store i64 %add49, i64* %xa1, align 8, !opID !1188, !opCode !13, !bitwidth !7, !numUses !7
  %91 = load i32*, i32** %ad_ptr, align 8, !opID !1189, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr50 = getelementptr inbounds i32, i32* %91, i32 1, !opID !1190, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr50, i32** %ad_ptr, align 8, !opID !1191, !opCode !13, !bitwidth !7, !numUses !7
  %92 = load i32, i32* %91, align 4, !opID !1192, !opCode !17, !bitwidth !39, !numUses !8
  %conv51 = sext i32 %92 to i64, !opID !1193, !opCode !93, !bitwidth !94, !numUses !8
  %93 = load i32*, i32** %h_ptr, align 8, !opID !1194, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr52 = getelementptr inbounds i32, i32* %93, i32 1, !opID !1195, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr52, i32** %h_ptr, align 8, !opID !1196, !opCode !13, !bitwidth !7, !numUses !7
  %94 = load i32, i32* %93, align 4, !opID !1197, !opCode !17, !bitwidth !39, !numUses !8
  %conv53 = sext i32 %94 to i64, !opID !1198, !opCode !93, !bitwidth !94, !numUses !8
  %mul54 = mul i64 %conv51, %conv53, !opID !1199, !opCode !101, !bitwidth !94, !numUses !8
  %95 = load i64, i64* %xa2, align 8, !opID !1200, !opCode !17, !bitwidth !94, !numUses !8
  %add55 = add i64 %95, %mul54, !opID !1201, !opCode !134, !bitwidth !94, !numUses !8
  store i64 %add55, i64* %xa2, align 8, !opID !1202, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc, !opID !1203, !opCode !43, !bitwidth !7, !numUses !7

for.inc:                                          ; preds = %for.body
  %96 = load i32, i32* %i, align 4, !opID !1204, !opCode !17, !bitwidth !39, !numUses !8
  %inc = add i32 %96, 1, !opID !1205, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %inc, i32* %i, align 4, !opID !1206, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !llvm.loop !1207, !opID !1209, !opCode !43, !bitwidth !7, !numUses !7

for.end:                                          ; preds = %for.cond
  %97 = load i32*, i32** %ac_ptr, align 8, !opID !1210, !opCode !17, !bitwidth !7, !numUses !8
  %98 = load i32, i32* %97, align 4, !opID !1211, !opCode !17, !bitwidth !39, !numUses !8
  %conv56 = sext i32 %98 to i64, !opID !1212, !opCode !93, !bitwidth !94, !numUses !8
  %99 = load i32*, i32** %h_ptr, align 8, !opID !1213, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr57 = getelementptr inbounds i32, i32* %99, i32 1, !opID !1214, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr57, i32** %h_ptr, align 8, !opID !1215, !opCode !13, !bitwidth !7, !numUses !7
  %100 = load i32, i32* %99, align 4, !opID !1216, !opCode !17, !bitwidth !39, !numUses !8
  %conv58 = sext i32 %100 to i64, !opID !1217, !opCode !93, !bitwidth !94, !numUses !8
  %mul59 = mul i64 %conv56, %conv58, !opID !1218, !opCode !101, !bitwidth !94, !numUses !8
  %101 = load i64, i64* %xa1, align 8, !opID !1219, !opCode !17, !bitwidth !94, !numUses !8
  %add60 = add i64 %101, %mul59, !opID !1220, !opCode !134, !bitwidth !94, !numUses !8
  store i64 %add60, i64* %xa1, align 8, !opID !1221, !opCode !13, !bitwidth !7, !numUses !7
  %102 = load i32*, i32** %ad_ptr, align 8, !opID !1222, !opCode !17, !bitwidth !7, !numUses !8
  %103 = load i32, i32* %102, align 4, !opID !1223, !opCode !17, !bitwidth !39, !numUses !8
  %conv61 = sext i32 %103 to i64, !opID !1224, !opCode !93, !bitwidth !94, !numUses !8
  %104 = load i32*, i32** %h_ptr, align 8, !opID !1225, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr62 = getelementptr inbounds i32, i32* %104, i32 1, !opID !1226, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr62, i32** %h_ptr, align 8, !opID !1227, !opCode !13, !bitwidth !7, !numUses !7
  %105 = load i32, i32* %104, align 4, !opID !1228, !opCode !17, !bitwidth !39, !numUses !8
  %conv63 = sext i32 %105 to i64, !opID !1229, !opCode !93, !bitwidth !94, !numUses !8
  %mul64 = mul i64 %conv61, %conv63, !opID !1230, !opCode !101, !bitwidth !94, !numUses !8
  %106 = load i64, i64* %xa2, align 8, !opID !1231, !opCode !17, !bitwidth !94, !numUses !8
  %add65 = add i64 %106, %mul64, !opID !1232, !opCode !134, !bitwidth !94, !numUses !8
  store i64 %add65, i64* %xa2, align 8, !opID !1233, !opCode !13, !bitwidth !7, !numUses !7
  %107 = load i64, i64* %xa1, align 8, !opID !1234, !opCode !17, !bitwidth !94, !numUses !8
  %shr66 = ashr i64 %107, 14, !opID !1235, !opCode !219, !bitwidth !94, !numUses !8
  %conv67 = trunc i64 %shr66 to i32, !opID !1236, !opCode !221, !bitwidth !39, !numUses !8
  store i32 %conv67, i32* @xout1, align 4, !opID !1237, !opCode !13, !bitwidth !7, !numUses !7
  %108 = load i64, i64* %xa2, align 8, !opID !1238, !opCode !17, !bitwidth !94, !numUses !8
  %shr68 = ashr i64 %108, 14, !opID !1239, !opCode !219, !bitwidth !94, !numUses !8
  %conv69 = trunc i64 %shr68 to i32, !opID !1240, !opCode !221, !bitwidth !39, !numUses !8
  store i32 %conv69, i32* @xout2, align 4, !opID !1241, !opCode !13, !bitwidth !7, !numUses !7
  %109 = load i32*, i32** %ac_ptr, align 8, !opID !1242, !opCode !17, !bitwidth !7, !numUses !8
  %add.ptr = getelementptr inbounds i32, i32* %109, i64 -1, !opID !1243, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %add.ptr, i32** %ac_ptr1, align 8, !opID !1244, !opCode !13, !bitwidth !7, !numUses !7
  %110 = load i32*, i32** %ad_ptr, align 8, !opID !1245, !opCode !17, !bitwidth !7, !numUses !8
  %add.ptr70 = getelementptr inbounds i32, i32* %110, i64 -1, !opID !1246, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %add.ptr70, i32** %ad_ptr1, align 8, !opID !1247, !opCode !13, !bitwidth !7, !numUses !7
  br label %decode_label3, !opID !1248, !opCode !43, !bitwidth !7, !numUses !7

decode_label3:                                    ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !1249, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond71, !opID !1250, !opCode !43, !bitwidth !7, !numUses !7

for.cond71:                                       ; preds = %for.inc78, %decode_label3
  %111 = load i32, i32* %i, align 4, !opID !1251, !opCode !17, !bitwidth !39, !numUses !8
  %cmp72 = icmp slt i32 %111, 10, !opID !1252, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp72, label %for.body73, label %for.end80, !opID !1253, !opCode !43, !bitwidth !7, !numUses !7

for.body73:                                       ; preds = %for.cond71
  %112 = load i32*, i32** %ac_ptr1, align 8, !opID !1254, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr74 = getelementptr inbounds i32, i32* %112, i32 -1, !opID !1255, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr74, i32** %ac_ptr1, align 8, !opID !1256, !opCode !13, !bitwidth !7, !numUses !7
  %113 = load i32, i32* %112, align 4, !opID !1257, !opCode !17, !bitwidth !39, !numUses !8
  %114 = load i32*, i32** %ac_ptr, align 8, !opID !1258, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr75 = getelementptr inbounds i32, i32* %114, i32 -1, !opID !1259, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr75, i32** %ac_ptr, align 8, !opID !1260, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %113, i32* %114, align 4, !opID !1261, !opCode !13, !bitwidth !7, !numUses !7
  %115 = load i32*, i32** %ad_ptr1, align 8, !opID !1262, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr76 = getelementptr inbounds i32, i32* %115, i32 -1, !opID !1263, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr76, i32** %ad_ptr1, align 8, !opID !1264, !opCode !13, !bitwidth !7, !numUses !7
  %116 = load i32, i32* %115, align 4, !opID !1265, !opCode !17, !bitwidth !39, !numUses !8
  %117 = load i32*, i32** %ad_ptr, align 8, !opID !1266, !opCode !17, !bitwidth !7, !numUses !57
  %incdec.ptr77 = getelementptr inbounds i32, i32* %117, i32 -1, !opID !1267, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr77, i32** %ad_ptr, align 8, !opID !1268, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %116, i32* %117, align 4, !opID !1269, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc78, !opID !1270, !opCode !43, !bitwidth !7, !numUses !7

for.inc78:                                        ; preds = %for.body73
  %118 = load i32, i32* %i, align 4, !opID !1271, !opCode !17, !bitwidth !39, !numUses !8
  %inc79 = add i32 %118, 1, !opID !1272, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %inc79, i32* %i, align 4, !opID !1273, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond71, !llvm.loop !1274, !opID !1276, !opCode !43, !bitwidth !7, !numUses !7

for.end80:                                        ; preds = %for.cond71
  %119 = load i32, i32* @xd, align 4, !opID !1277, !opCode !17, !bitwidth !39, !numUses !8
  %120 = load i32*, i32** %ac_ptr, align 8, !opID !1278, !opCode !17, !bitwidth !7, !numUses !8
  store i32 %119, i32* %120, align 4, !opID !1279, !opCode !13, !bitwidth !7, !numUses !7
  %121 = load i32, i32* @xs, align 4, !opID !1280, !opCode !17, !bitwidth !39, !numUses !8
  %122 = load i32*, i32** %ad_ptr, align 8, !opID !1281, !opCode !17, !bitwidth !7, !numUses !8
  store i32 %121, i32* %122, align 4, !opID !1282, !opCode !13, !bitwidth !7, !numUses !7
  %123 = bitcast i32** %ad_ptr1 to i8*, !opID !1283, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %123) #6, !opID !1284, !opCode !22, !bitwidth !7, !numUses !7
  %124 = bitcast i32** %ad_ptr to i8*, !opID !1285, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %124) #6, !opID !1286, !opCode !22, !bitwidth !7, !numUses !7
  %125 = bitcast i32** %ac_ptr1 to i8*, !opID !1287, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %125) #6, !opID !1288, !opCode !22, !bitwidth !7, !numUses !7
  %126 = bitcast i32** %ac_ptr to i8*, !opID !1289, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %126) #6, !opID !1290, !opCode !22, !bitwidth !7, !numUses !7
  %127 = bitcast i32** %h_ptr to i8*, !opID !1291, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %127) #6, !opID !1292, !opCode !22, !bitwidth !7, !numUses !7
  %128 = bitcast i64* %xa2 to i8*, !opID !1293, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %128) #6, !opID !1294, !opCode !22, !bitwidth !7, !numUses !7
  %129 = bitcast i64* %xa1 to i8*, !opID !1295, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %129) #6, !opID !1296, !opCode !22, !bitwidth !7, !numUses !7
  %130 = bitcast i32* %i to i8*, !opID !1297, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %130) #6, !opID !1298, !opCode !22, !bitwidth !7, !numUses !7
  ret void, !opID !1299, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define void @reset() #4 {
entry:
  %i = alloca i32, align 4, !opID !1300, !opCode !6, !bitwidth !7, !numUses !1301
  %0 = bitcast i32* %i to i8*, !opID !1302, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !1303, !opCode !22, !bitwidth !7, !numUses !7
  store i32 32, i32* @dec_detl, align 4, !opID !1304, !opCode !13, !bitwidth !7, !numUses !7
  store i32 32, i32* @detl, align 4, !opID !1305, !opCode !13, !bitwidth !7, !numUses !7
  store i32 8, i32* @dec_deth, align 4, !opID !1306, !opCode !13, !bitwidth !7, !numUses !7
  store i32 8, i32* @deth, align 4, !opID !1307, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @rlt2, align 4, !opID !1308, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @rlt1, align 4, !opID !1309, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @plt2, align 4, !opID !1310, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @plt1, align 4, !opID !1311, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @al2, align 4, !opID !1312, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @al1, align 4, !opID !1313, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @nbl, align 4, !opID !1314, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @rh2, align 4, !opID !1315, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @rh1, align 4, !opID !1316, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @ph2, align 4, !opID !1317, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @ph1, align 4, !opID !1318, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @ah2, align 4, !opID !1319, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @ah1, align 4, !opID !1320, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @nbh, align 4, !opID !1321, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_rlt2, align 4, !opID !1322, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_rlt1, align 4, !opID !1323, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_plt2, align 4, !opID !1324, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_plt1, align 4, !opID !1325, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_al2, align 4, !opID !1326, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_al1, align 4, !opID !1327, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_nbl, align 4, !opID !1328, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_rh2, align 4, !opID !1329, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_rh1, align 4, !opID !1330, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_ph2, align 4, !opID !1331, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_ph1, align 4, !opID !1332, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_ah2, align 4, !opID !1333, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_ah1, align 4, !opID !1334, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_nbh, align 4, !opID !1335, !opCode !13, !bitwidth !7, !numUses !7
  br label %reset_label4, !opID !1336, !opCode !43, !bitwidth !7, !numUses !7

reset_label4:                                     ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !1337, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !opID !1338, !opCode !43, !bitwidth !7, !numUses !7

for.cond:                                         ; preds = %for.inc, %reset_label4
  %1 = load i32, i32* %i, align 4, !opID !1339, !opCode !17, !bitwidth !39, !numUses !8
  %cmp = icmp slt i32 %1, 6, !opID !1340, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp, label %for.body, label %for.end, !opID !1341, !opCode !43, !bitwidth !7, !numUses !7

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !opID !1342, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom = sext i32 %2 to i64, !opID !1343, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dltx, i64 0, i64 %idxprom, !opID !1344, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx, align 4, !opID !1345, !opCode !13, !bitwidth !7, !numUses !7
  %3 = load i32, i32* %i, align 4, !opID !1346, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom1 = sext i32 %3 to i64, !opID !1347, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx2 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dhx, i64 0, i64 %idxprom1, !opID !1348, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx2, align 4, !opID !1349, !opCode !13, !bitwidth !7, !numUses !7
  %4 = load i32, i32* %i, align 4, !opID !1350, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom3 = sext i32 %4 to i64, !opID !1351, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx4 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dltx, i64 0, i64 %idxprom3, !opID !1352, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx4, align 4, !opID !1353, !opCode !13, !bitwidth !7, !numUses !7
  %5 = load i32, i32* %i, align 4, !opID !1354, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom5 = sext i32 %5 to i64, !opID !1355, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx6 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dhx, i64 0, i64 %idxprom5, !opID !1356, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx6, align 4, !opID !1357, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc, !opID !1358, !opCode !43, !bitwidth !7, !numUses !7

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !opID !1359, !opCode !17, !bitwidth !39, !numUses !8
  %inc = add i32 %6, 1, !opID !1360, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %inc, i32* %i, align 4, !opID !1361, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !llvm.loop !1362, !opID !1364, !opCode !43, !bitwidth !7, !numUses !7

for.end:                                          ; preds = %for.cond
  br label %reset_label5, !opID !1365, !opCode !43, !bitwidth !7, !numUses !7

reset_label5:                                     ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !1366, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond7, !opID !1367, !opCode !43, !bitwidth !7, !numUses !7

for.cond7:                                        ; preds = %for.inc18, %reset_label5
  %7 = load i32, i32* %i, align 4, !opID !1368, !opCode !17, !bitwidth !39, !numUses !8
  %cmp8 = icmp slt i32 %7, 6, !opID !1369, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp8, label %for.body9, label %for.end20, !opID !1370, !opCode !43, !bitwidth !7, !numUses !7

for.body9:                                        ; preds = %for.cond7
  %8 = load i32, i32* %i, align 4, !opID !1371, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom10 = sext i32 %8 to i64, !opID !1372, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx11 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bpl, i64 0, i64 %idxprom10, !opID !1373, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx11, align 4, !opID !1374, !opCode !13, !bitwidth !7, !numUses !7
  %9 = load i32, i32* %i, align 4, !opID !1375, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom12 = sext i32 %9 to i64, !opID !1376, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx13 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bph, i64 0, i64 %idxprom12, !opID !1377, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx13, align 4, !opID !1378, !opCode !13, !bitwidth !7, !numUses !7
  %10 = load i32, i32* %i, align 4, !opID !1379, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom14 = sext i32 %10 to i64, !opID !1380, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx15 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bpl, i64 0, i64 %idxprom14, !opID !1381, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx15, align 4, !opID !1382, !opCode !13, !bitwidth !7, !numUses !7
  %11 = load i32, i32* %i, align 4, !opID !1383, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom16 = sext i32 %11 to i64, !opID !1384, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bph, i64 0, i64 %idxprom16, !opID !1385, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx17, align 4, !opID !1386, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc18, !opID !1387, !opCode !43, !bitwidth !7, !numUses !7

for.inc18:                                        ; preds = %for.body9
  %12 = load i32, i32* %i, align 4, !opID !1388, !opCode !17, !bitwidth !39, !numUses !8
  %inc19 = add i32 %12, 1, !opID !1389, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %inc19, i32* %i, align 4, !opID !1390, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond7, !llvm.loop !1391, !opID !1393, !opCode !43, !bitwidth !7, !numUses !7

for.end20:                                        ; preds = %for.cond7
  br label %reset_label6, !opID !1394, !opCode !43, !bitwidth !7, !numUses !7

reset_label6:                                     ; preds = %for.end20
  store i32 0, i32* %i, align 4, !opID !1395, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond21, !opID !1396, !opCode !43, !bitwidth !7, !numUses !7

for.cond21:                                       ; preds = %for.inc26, %reset_label6
  %13 = load i32, i32* %i, align 4, !opID !1397, !opCode !17, !bitwidth !39, !numUses !8
  %cmp22 = icmp slt i32 %13, 24, !opID !1398, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp22, label %for.body23, label %for.end28, !opID !1399, !opCode !43, !bitwidth !7, !numUses !7

for.body23:                                       ; preds = %for.cond21
  %14 = load i32, i32* %i, align 4, !opID !1400, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom24 = sext i32 %14 to i64, !opID !1401, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx25 = getelementptr inbounds [24 x i32], [24 x i32]* @tqmf, i64 0, i64 %idxprom24, !opID !1402, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx25, align 4, !opID !1403, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc26, !opID !1404, !opCode !43, !bitwidth !7, !numUses !7

for.inc26:                                        ; preds = %for.body23
  %15 = load i32, i32* %i, align 4, !opID !1405, !opCode !17, !bitwidth !39, !numUses !8
  %inc27 = add i32 %15, 1, !opID !1406, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %inc27, i32* %i, align 4, !opID !1407, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond21, !llvm.loop !1408, !opID !1410, !opCode !43, !bitwidth !7, !numUses !7

for.end28:                                        ; preds = %for.cond21
  br label %reset_label7, !opID !1411, !opCode !43, !bitwidth !7, !numUses !7

reset_label7:                                     ; preds = %for.end28
  store i32 0, i32* %i, align 4, !opID !1412, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond29, !opID !1413, !opCode !43, !bitwidth !7, !numUses !7

for.cond29:                                       ; preds = %for.inc36, %reset_label7
  %16 = load i32, i32* %i, align 4, !opID !1414, !opCode !17, !bitwidth !39, !numUses !8
  %cmp30 = icmp slt i32 %16, 11, !opID !1415, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp30, label %for.body31, label %for.end38, !opID !1416, !opCode !43, !bitwidth !7, !numUses !7

for.body31:                                       ; preds = %for.cond29
  %17 = load i32, i32* %i, align 4, !opID !1417, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom32 = sext i32 %17 to i64, !opID !1418, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx33 = getelementptr inbounds [11 x i32], [11 x i32]* @accumc, i64 0, i64 %idxprom32, !opID !1419, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx33, align 4, !opID !1420, !opCode !13, !bitwidth !7, !numUses !7
  %18 = load i32, i32* %i, align 4, !opID !1421, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom34 = sext i32 %18 to i64, !opID !1422, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx35 = getelementptr inbounds [11 x i32], [11 x i32]* @accumd, i64 0, i64 %idxprom34, !opID !1423, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx35, align 4, !opID !1424, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc36, !opID !1425, !opCode !43, !bitwidth !7, !numUses !7

for.inc36:                                        ; preds = %for.body31
  %19 = load i32, i32* %i, align 4, !opID !1426, !opCode !17, !bitwidth !39, !numUses !8
  %inc37 = add i32 %19, 1, !opID !1427, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %inc37, i32* %i, align 4, !opID !1428, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond29, !llvm.loop !1429, !opID !1431, !opCode !43, !bitwidth !7, !numUses !7

for.end38:                                        ; preds = %for.cond29
  %20 = bitcast i32* %i to i8*, !opID !1432, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #6, !opID !1433, !opCode !22, !bitwidth !7, !numUses !7
  ret void, !opID !1434, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define void @adpcm_main(i32* "fpga.decayed.dim.hint"="8000" %input_samples, i32* "fpga.decayed.dim.hint"="4000" %compressed, i32* "fpga.decayed.dim.hint"="8000" %result) #5 !fpga.function.pragma !1435 {
entry:
  %input_samples.addr = alloca i32*, align 8, !opID !1437, !opCode !6, !bitwidth !7, !numUses !11
  %compressed.addr = alloca i32*, align 8, !opID !1438, !opCode !6, !bitwidth !7, !numUses !11
  %result.addr = alloca i32*, align 8, !opID !1439, !opCode !6, !bitwidth !7, !numUses !11
  %i = alloca i32, align 4, !opID !1440, !opCode !6, !bitwidth !7, !numUses !1441
  %j = alloca i32, align 4, !opID !1442, !opCode !6, !bitwidth !7, !numUses !11
  store i32* %input_samples, i32** %input_samples.addr, align 8, !opID !1443, !opCode !13, !bitwidth !7, !numUses !7
  store i32* %compressed, i32** %compressed.addr, align 8, !opID !1444, !opCode !13, !bitwidth !7, !numUses !7
  store i32* %result, i32** %result.addr, align 8, !opID !1445, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %i to i8*, !opID !1446, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !opID !1447, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i32* %j to i8*, !opID !1448, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #6, !opID !1449, !opCode !22, !bitwidth !7, !numUses !7
  call void @reset(), !opID !1450, !opCode !22, !bitwidth !7, !numUses !7
  store i32 10, i32* %j, align 4, !opID !1451, !opCode !13, !bitwidth !7, !numUses !7
  br label %adpcm_main_label12, !opID !1452, !opCode !43, !bitwidth !7, !numUses !7

adpcm_main_label12:                               ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !1453, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !opID !1454, !opCode !43, !bitwidth !7, !numUses !7

for.cond:                                         ; preds = %for.inc, %adpcm_main_label12
  %2 = load i32, i32* %i, align 4, !opID !1455, !opCode !17, !bitwidth !39, !numUses !8
  %cmp = icmp slt i32 %2, 8000, !opID !1456, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp, label %for.body, label %for.end, !opID !1457, !opCode !43, !bitwidth !7, !numUses !7

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %input_samples.addr, align 8, !opID !1458, !opCode !17, !bitwidth !7, !numUses !8
  %4 = load i32, i32* %i, align 4, !opID !1459, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom = sext i32 %4 to i64, !opID !1460, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !opID !1461, !opCode !19, !bitwidth !7, !numUses !8
  %5 = load i32, i32* %arrayidx, align 4, !opID !1462, !opCode !17, !bitwidth !39, !numUses !8
  %6 = load i32*, i32** %input_samples.addr, align 8, !opID !1463, !opCode !17, !bitwidth !7, !numUses !8
  %7 = load i32, i32* %i, align 4, !opID !1464, !opCode !17, !bitwidth !39, !numUses !8
  %add = add i32 %7, 1, !opID !1465, !opCode !134, !bitwidth !39, !numUses !8
  %idxprom1 = sext i32 %add to i64, !opID !1466, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %idxprom1, !opID !1467, !opCode !19, !bitwidth !7, !numUses !8
  %8 = load i32, i32* %arrayidx2, align 4, !opID !1468, !opCode !17, !bitwidth !39, !numUses !8
  %call = call i32 @encode(i32 %5, i32 %8), !opID !1469, !opCode !22, !bitwidth !39, !numUses !8
  %9 = load i32*, i32** %compressed.addr, align 8, !opID !1470, !opCode !17, !bitwidth !7, !numUses !8
  %10 = load i32, i32* %i, align 4, !opID !1471, !opCode !17, !bitwidth !39, !numUses !8
  %div = sdiv i32 %10, 2, !opID !1472, !opCode !1473, !bitwidth !39, !numUses !8
  %idxprom3 = sext i32 %div to i64, !opID !1474, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %idxprom3, !opID !1475, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %call, i32* %arrayidx4, align 4, !opID !1476, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc, !opID !1477, !opCode !43, !bitwidth !7, !numUses !7

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !opID !1478, !opCode !17, !bitwidth !39, !numUses !8
  %add5 = add i32 %11, 2, !opID !1479, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add5, i32* %i, align 4, !opID !1480, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !llvm.loop !1481, !opID !1483, !opCode !43, !bitwidth !7, !numUses !7

for.end:                                          ; preds = %for.cond
  br label %adpcm_main_label13, !opID !1484, !opCode !43, !bitwidth !7, !numUses !7

adpcm_main_label13:                               ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !1485, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond6, !opID !1486, !opCode !43, !bitwidth !7, !numUses !7

for.cond6:                                        ; preds = %for.inc17, %adpcm_main_label13
  %12 = load i32, i32* %i, align 4, !opID !1487, !opCode !17, !bitwidth !39, !numUses !8
  %cmp7 = icmp slt i32 %12, 8000, !opID !1488, !opCode !41, !bitwidth !8, !numUses !8
  br i1 %cmp7, label %for.body8, label %for.end19, !opID !1489, !opCode !43, !bitwidth !7, !numUses !7

for.body8:                                        ; preds = %for.cond6
  %13 = load i32*, i32** %compressed.addr, align 8, !opID !1490, !opCode !17, !bitwidth !7, !numUses !8
  %14 = load i32, i32* %i, align 4, !opID !1491, !opCode !17, !bitwidth !39, !numUses !8
  %div9 = sdiv i32 %14, 2, !opID !1492, !opCode !1473, !bitwidth !39, !numUses !8
  %idxprom10 = sext i32 %div9 to i64, !opID !1493, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx11 = getelementptr inbounds i32, i32* %13, i64 %idxprom10, !opID !1494, !opCode !19, !bitwidth !7, !numUses !8
  %15 = load i32, i32* %arrayidx11, align 4, !opID !1495, !opCode !17, !bitwidth !39, !numUses !8
  call void @decode(i32 %15), !opID !1496, !opCode !22, !bitwidth !7, !numUses !7
  %16 = load i32, i32* @xout1, align 4, !opID !1497, !opCode !17, !bitwidth !39, !numUses !8
  %17 = load i32*, i32** %result.addr, align 8, !opID !1498, !opCode !17, !bitwidth !7, !numUses !8
  %18 = load i32, i32* %i, align 4, !opID !1499, !opCode !17, !bitwidth !39, !numUses !8
  %idxprom12 = sext i32 %18 to i64, !opID !1500, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx13 = getelementptr inbounds i32, i32* %17, i64 %idxprom12, !opID !1501, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %16, i32* %arrayidx13, align 4, !opID !1502, !opCode !13, !bitwidth !7, !numUses !7
  %19 = load i32, i32* @xout2, align 4, !opID !1503, !opCode !17, !bitwidth !39, !numUses !8
  %20 = load i32*, i32** %result.addr, align 8, !opID !1504, !opCode !17, !bitwidth !7, !numUses !8
  %21 = load i32, i32* %i, align 4, !opID !1505, !opCode !17, !bitwidth !39, !numUses !8
  %add14 = add i32 %21, 1, !opID !1506, !opCode !134, !bitwidth !39, !numUses !8
  %idxprom15 = sext i32 %add14 to i64, !opID !1507, !opCode !93, !bitwidth !94, !numUses !8
  %arrayidx16 = getelementptr inbounds i32, i32* %20, i64 %idxprom15, !opID !1508, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %19, i32* %arrayidx16, align 4, !opID !1509, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc17, !opID !1510, !opCode !43, !bitwidth !7, !numUses !7

for.inc17:                                        ; preds = %for.body8
  %22 = load i32, i32* %i, align 4, !opID !1511, !opCode !17, !bitwidth !39, !numUses !8
  %add18 = add i32 %22, 2, !opID !1512, !opCode !134, !bitwidth !39, !numUses !8
  store i32 %add18, i32* %i, align 4, !opID !1513, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond6, !llvm.loop !1514, !opID !1516, !opCode !43, !bitwidth !7, !numUses !7

for.end19:                                        ; preds = %for.cond6
  %23 = bitcast i32* %j to i8*, !opID !1517, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %23) #6, !opID !1518, !opCode !22, !bitwidth !7, !numUses !7
  %24 = bitcast i32* %i to i8*, !opID !1519, !opCode !36, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %24) #6, !opID !1520, !opCode !22, !bitwidth !7, !numUses !7
  ret void, !opID !4, !opCode !29, !bitwidth !7, !numUses !7
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
!opCounter = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 2, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i64 1450}
!5 = !{i64 1}
!6 = !{i8 29}
!7 = !{i32 0}
!8 = !{i32 1}
!9 = !{i64 2}
!10 = !{i64 3}
!11 = !{i32 3}
!12 = !{i64 4}
!13 = !{i8 31}
!14 = !{i64 5}
!15 = !{i64 6}
!16 = !{i64 7}
!17 = !{i8 30}
!18 = !{i64 8}
!19 = !{i8 32}
!20 = !{i64 9}
!21 = !{i64 10}
!22 = !{i8 54}
!23 = !{i64 11}
!24 = !{i64 12}
!25 = !{i64 13}
!26 = !{i64 14}
!27 = !{i64 15}
!28 = !{i64 16}
!29 = !{i8 1}
!30 = !{i64 17}
!31 = !{i32 4}
!32 = !{i64 18}
!33 = !{i32 5}
!34 = !{i64 19}
!35 = !{i64 20}
!36 = !{i8 47}
!37 = !{i64 21}
!38 = !{i64 22}
!39 = !{i32 32}
!40 = !{i64 23}
!41 = !{i8 51}
!42 = !{i64 24}
!43 = !{i8 2}
!44 = !{i64 25}
!45 = !{i64 26}
!46 = !{i64 27}
!47 = !{i64 28}
!48 = !{i64 29}
!49 = !{i8 13}
!50 = !{i64 30}
!51 = !{i64 31}
!52 = !{i64 32}
!53 = !{i64 33}
!54 = !{i64 34}
!55 = !{i64 35}
!56 = !{i64 36}
!57 = !{i32 2}
!58 = !{i64 37}
!59 = !{i64 38}
!60 = !{i32 10}
!61 = !{i64 39}
!62 = !{i32 15}
!63 = !{i64 40}
!64 = !{i32 20}
!65 = !{i64 41}
!66 = !{i64 42}
!67 = !{i32 9}
!68 = !{i64 43}
!69 = !{i64 44}
!70 = !{i64 45}
!71 = !{i64 46}
!72 = !{i64 47}
!73 = !{i64 48}
!74 = !{i64 49}
!75 = !{i64 50}
!76 = !{i64 51}
!77 = !{i64 52}
!78 = !{i64 53}
!79 = !{i64 54}
!80 = !{i64 55}
!81 = !{i64 56}
!82 = !{i64 57}
!83 = !{i64 58}
!84 = !{i64 59}
!85 = !{i64 60}
!86 = !{i64 61}
!87 = !{i64 62}
!88 = !{i64 63}
!89 = !{i64 64}
!90 = !{i64 65}
!91 = !{i64 66}
!92 = !{i64 67}
!93 = !{i8 38}
!94 = !{i32 64}
!95 = !{i64 68}
!96 = !{i64 69}
!97 = !{i64 70}
!98 = !{i64 71}
!99 = !{i64 72}
!100 = !{i64 73}
!101 = !{i8 15}
!102 = !{i64 74}
!103 = !{i64 75}
!104 = !{i64 76}
!105 = !{i64 77}
!106 = !{i64 78}
!107 = !{i64 79}
!108 = !{i64 80}
!109 = !{i64 81}
!110 = !{i64 82}
!111 = !{i64 83}
!112 = !{i64 84}
!113 = !{i64 85}
!114 = !{i64 86}
!115 = !{i64 87}
!116 = !{i64 88}
!117 = !{i64 89}
!118 = !{i64 90}
!119 = !{i64 91}
!120 = !{i64 92}
!121 = !{i64 93}
!122 = !{i64 94}
!123 = !{i64 95}
!124 = !{i64 96}
!125 = !{i64 97}
!126 = !{i64 98}
!127 = !{i64 99}
!128 = !{i64 100}
!129 = !{i64 101}
!130 = !{i64 102}
!131 = !{i64 103}
!132 = !{i64 104}
!133 = !{i64 105}
!134 = !{i8 11}
!135 = !{i64 106}
!136 = !{i64 107}
!137 = !{i64 108}
!138 = !{i64 109}
!139 = !{i64 110}
!140 = !{i64 111}
!141 = !{i64 112}
!142 = !{i64 113}
!143 = !{i64 114}
!144 = !{i64 115}
!145 = !{i64 116}
!146 = !{i64 117}
!147 = !{i64 118}
!148 = !{i64 119}
!149 = !{i64 120}
!150 = !{i64 121}
!151 = !{i64 122}
!152 = !{i64 123}
!153 = !{i64 124}
!154 = distinct !{!154, !155}
!155 = !{!"llvm.loop.name", !"encode_label0"}
!156 = !{i64 125}
!157 = !{i64 126}
!158 = !{i64 127}
!159 = !{i64 128}
!160 = !{i64 129}
!161 = !{i64 130}
!162 = !{i64 131}
!163 = !{i64 132}
!164 = !{i64 133}
!165 = !{i64 134}
!166 = !{i64 135}
!167 = !{i64 136}
!168 = !{i64 137}
!169 = !{i64 138}
!170 = !{i64 139}
!171 = !{i64 140}
!172 = !{i64 141}
!173 = !{i64 142}
!174 = !{i64 143}
!175 = !{i64 144}
!176 = !{i64 145}
!177 = !{i64 146}
!178 = !{i64 147}
!179 = !{i64 148}
!180 = !{i64 149}
!181 = !{i64 150}
!182 = !{i64 151}
!183 = !{i64 152}
!184 = !{i64 153}
!185 = !{i64 154}
!186 = !{i64 155}
!187 = !{i64 156}
!188 = !{i64 157}
!189 = !{i64 158}
!190 = !{i64 159}
!191 = !{i64 160}
!192 = !{i64 161}
!193 = !{i64 162}
!194 = !{i64 163}
!195 = !{i64 164}
!196 = !{i64 165}
!197 = !{i64 166}
!198 = !{i64 167}
!199 = !{i64 168}
!200 = !{i64 169}
!201 = !{i64 170}
!202 = !{i64 171}
!203 = !{i64 172}
!204 = distinct !{!204, !205}
!205 = !{!"llvm.loop.name", !"encode_label1"}
!206 = !{i64 173}
!207 = !{i64 174}
!208 = !{i64 175}
!209 = !{i64 176}
!210 = !{i64 177}
!211 = !{i64 178}
!212 = !{i64 179}
!213 = !{i64 180}
!214 = !{i64 181}
!215 = !{i64 182}
!216 = !{i64 183}
!217 = !{i64 184}
!218 = !{i64 185}
!219 = !{i8 25}
!220 = !{i64 186}
!221 = !{i8 36}
!222 = !{i64 187}
!223 = !{i64 188}
!224 = !{i64 189}
!225 = !{i64 190}
!226 = !{i64 191}
!227 = !{i64 192}
!228 = !{i64 193}
!229 = !{i64 194}
!230 = !{i64 195}
!231 = !{i64 196}
!232 = !{i64 197}
!233 = !{i64 198}
!234 = !{i64 199}
!235 = !{i64 200}
!236 = !{i64 201}
!237 = !{i64 202}
!238 = !{i64 203}
!239 = !{i64 204}
!240 = !{i64 205}
!241 = !{i64 206}
!242 = !{i64 207}
!243 = !{i64 208}
!244 = !{i64 209}
!245 = !{i64 210}
!246 = !{i64 211}
!247 = !{i64 212}
!248 = !{i64 213}
!249 = !{i64 214}
!250 = !{i64 215}
!251 = !{i64 216}
!252 = !{i64 217}
!253 = !{i64 218}
!254 = !{i64 219}
!255 = !{i64 220}
!256 = !{i64 221}
!257 = !{i64 222}
!258 = !{i64 223}
!259 = !{i64 224}
!260 = !{i64 225}
!261 = !{i64 226}
!262 = !{i64 227}
!263 = !{i64 228}
!264 = !{i64 229}
!265 = !{i64 230}
!266 = !{i64 231}
!267 = !{i64 232}
!268 = !{i64 233}
!269 = !{i64 234}
!270 = !{i64 235}
!271 = !{i64 236}
!272 = !{i64 237}
!273 = !{i64 238}
!274 = !{i64 239}
!275 = !{i64 240}
!276 = !{i64 241}
!277 = !{i64 242}
!278 = !{i64 243}
!279 = !{i64 244}
!280 = !{i64 245}
!281 = !{i64 246}
!282 = !{i64 247}
!283 = !{i64 248}
!284 = !{i64 249}
!285 = !{i64 250}
!286 = !{i64 251}
!287 = !{i64 252}
!288 = !{i64 253}
!289 = !{i64 254}
!290 = !{i64 255}
!291 = !{i64 256}
!292 = !{i64 257}
!293 = !{i64 258}
!294 = !{i64 259}
!295 = !{i64 260}
!296 = !{i64 261}
!297 = !{i64 262}
!298 = !{i64 263}
!299 = !{i64 264}
!300 = !{i64 265}
!301 = !{i64 266}
!302 = !{i64 267}
!303 = !{i64 268}
!304 = !{i64 269}
!305 = !{i64 270}
!306 = !{i64 271}
!307 = !{i64 272}
!308 = !{i64 273}
!309 = !{i64 274}
!310 = !{i64 275}
!311 = !{i64 276}
!312 = !{i64 277}
!313 = !{i64 278}
!314 = !{i64 279}
!315 = !{i64 280}
!316 = !{i64 281}
!317 = !{i64 282}
!318 = !{i64 283}
!319 = !{i64 284}
!320 = !{i64 285}
!321 = !{i64 286}
!322 = !{i64 287}
!323 = !{i64 288}
!324 = !{i64 289}
!325 = !{i64 290}
!326 = !{i64 291}
!327 = !{i64 292}
!328 = !{i64 293}
!329 = !{i64 294}
!330 = !{i64 295}
!331 = !{i64 296}
!332 = !{i64 297}
!333 = !{i64 298}
!334 = !{i64 299}
!335 = !{i64 300}
!336 = !{i64 301}
!337 = !{i64 302}
!338 = !{i64 303}
!339 = !{i64 304}
!340 = !{i64 305}
!341 = !{i64 306}
!342 = !{i64 307}
!343 = !{i64 308}
!344 = !{i64 309}
!345 = !{i64 310}
!346 = !{i64 311}
!347 = !{i64 312}
!348 = !{i64 313}
!349 = !{i64 314}
!350 = !{i64 315}
!351 = !{i64 316}
!352 = !{i64 317}
!353 = !{i64 318}
!354 = !{i64 319}
!355 = !{i64 320}
!356 = !{i64 321}
!357 = !{i64 322}
!358 = !{i64 323}
!359 = !{i64 324}
!360 = !{i64 325}
!361 = !{i64 326}
!362 = !{i64 327}
!363 = !{i64 328}
!364 = !{i64 329}
!365 = !{i64 330}
!366 = !{i64 331}
!367 = !{i64 332}
!368 = !{i64 333}
!369 = !{i64 334}
!370 = !{i64 335}
!371 = !{i64 336}
!372 = !{i64 337}
!373 = !{i64 338}
!374 = !{i64 339}
!375 = !{i64 340}
!376 = !{i64 341}
!377 = !{i64 342}
!378 = !{i64 343}
!379 = !{i64 344}
!380 = !{i64 345}
!381 = !{i64 346}
!382 = !{i64 347}
!383 = !{i64 348}
!384 = !{i64 349}
!385 = !{i64 350}
!386 = !{i64 351}
!387 = !{i64 352}
!388 = !{i64 353}
!389 = !{i8 23}
!390 = !{i64 354}
!391 = !{i8 27}
!392 = !{i64 355}
!393 = !{i64 356}
!394 = !{i64 357}
!395 = !{i64 358}
!396 = !{i64 359}
!397 = !{i64 360}
!398 = !{i64 361}
!399 = !{i64 362}
!400 = !{i64 363}
!401 = !{i64 364}
!402 = !{i64 365}
!403 = !{i64 366}
!404 = !{i64 367}
!405 = !{i64 368}
!406 = !{i64 369}
!407 = !{i64 370}
!408 = !{i64 371}
!409 = !{i64 372}
!410 = !{i32 6}
!411 = !{i64 373}
!412 = !{i64 374}
!413 = !{i64 375}
!414 = !{i64 376}
!415 = !{i64 377}
!416 = !{i64 378}
!417 = !{i64 379}
!418 = !{i64 380}
!419 = !{i64 381}
!420 = !{i64 382}
!421 = !{i64 383}
!422 = !{i64 384}
!423 = !{i64 385}
!424 = !{i64 386}
!425 = !{i64 387}
!426 = !{i64 388}
!427 = !{i64 389}
!428 = !{i64 390}
!429 = !{i64 391}
!430 = !{i64 392}
!431 = !{i64 393}
!432 = !{i64 394}
!433 = !{i64 395}
!434 = !{i64 396}
!435 = !{i64 397}
!436 = !{i64 398}
!437 = !{i64 399}
!438 = !{i64 400}
!439 = !{i64 401}
!440 = !{i64 402}
!441 = !{i64 403}
!442 = !{i64 404}
!443 = !{i64 405}
!444 = !{i64 406}
!445 = !{i64 407}
!446 = !{i64 408}
!447 = !{i64 409}
!448 = !{i64 410}
!449 = !{i64 411}
!450 = !{i64 412}
!451 = !{i64 413}
!452 = !{i64 414}
!453 = !{i64 415}
!454 = distinct !{!454, !455}
!455 = !{!"llvm.loop.name", !"filtez_label8"}
!456 = !{i64 416}
!457 = !{i64 417}
!458 = !{i64 418}
!459 = !{i64 419}
!460 = !{i64 420}
!461 = !{i64 421}
!462 = !{i64 422}
!463 = !{i64 423}
!464 = !{i64 424}
!465 = !{i64 425}
!466 = !{i64 426}
!467 = !{i64 427}
!468 = !{i64 428}
!469 = !{i64 429}
!470 = !{i32 8}
!471 = !{i64 430}
!472 = !{i64 431}
!473 = !{i64 432}
!474 = !{i64 433}
!475 = !{i64 434}
!476 = !{i64 435}
!477 = !{i64 436}
!478 = !{i64 437}
!479 = !{i64 438}
!480 = !{i64 439}
!481 = !{i64 440}
!482 = !{i64 441}
!483 = !{i64 442}
!484 = !{i64 443}
!485 = !{i64 444}
!486 = !{i64 445}
!487 = !{i64 446}
!488 = !{i64 447}
!489 = !{i64 448}
!490 = !{i64 449}
!491 = !{i64 450}
!492 = !{i64 451}
!493 = !{i64 452}
!494 = !{i64 453}
!495 = !{i64 454}
!496 = !{i64 455}
!497 = !{i64 456}
!498 = !{i64 457}
!499 = !{i64 458}
!500 = !{i64 459}
!501 = !{i64 460}
!502 = !{i64 461}
!503 = !{i64 462}
!504 = !{i64 463}
!505 = !{i64 464}
!506 = !{i64 465}
!507 = !{i64 466}
!508 = !{i64 467}
!509 = !{i64 468}
!510 = !{i64 469}
!511 = !{i64 470}
!512 = !{i64 471}
!513 = !{i64 472}
!514 = !{i64 473}
!515 = !{i64 474}
!516 = !{i64 475}
!517 = !{i64 476}
!518 = !{i64 477}
!519 = !{i64 478}
!520 = !{i64 479}
!521 = !{i64 480}
!522 = !{i64 481}
!523 = !{i64 482}
!524 = !{i64 483}
!525 = !{i64 484}
!526 = !{i64 485}
!527 = !{i64 486}
!528 = !{i64 487}
!529 = !{i64 488}
!530 = !{i64 489}
!531 = !{i64 490}
!532 = !{i64 491}
!533 = !{i64 492}
!534 = !{i64 493}
!535 = !{i64 494}
!536 = !{i64 495}
!537 = !{i64 496}
!538 = !{i64 497}
!539 = !{i64 498}
!540 = !{i64 499}
!541 = !{i64 500}
!542 = !{i64 501}
!543 = !{i64 502}
!544 = !{i64 503}
!545 = !{i64 504}
!546 = !{i64 505}
!547 = !{i64 506}
!548 = !{i64 507}
!549 = !{i64 508}
!550 = !{i64 509}
!551 = !{i64 510}
!552 = !{i64 511}
!553 = distinct !{!553, !554}
!554 = !{!"llvm.loop.name", !"quantl_label9"}
!555 = !{i64 512}
!556 = !{i64 513}
!557 = !{i64 514}
!558 = !{i64 515}
!559 = !{i64 516}
!560 = !{i64 517}
!561 = !{i64 518}
!562 = !{i64 519}
!563 = !{i64 520}
!564 = !{i64 521}
!565 = !{i64 522}
!566 = !{i64 523}
!567 = !{i64 524}
!568 = !{i64 525}
!569 = !{i64 526}
!570 = !{i64 527}
!571 = !{i64 528}
!572 = !{i64 529}
!573 = !{i64 530}
!574 = !{i64 531}
!575 = !{i64 532}
!576 = !{i64 533}
!577 = !{i64 534}
!578 = !{i64 535}
!579 = !{i64 536}
!580 = !{i64 537}
!581 = !{i64 538}
!582 = !{i64 539}
!583 = !{i64 540}
!584 = !{i64 541}
!585 = !{i64 542}
!586 = !{i64 543}
!587 = !{i64 544}
!588 = !{i64 545}
!589 = !{i64 546}
!590 = !{i64 547}
!591 = !{i64 548}
!592 = !{i64 549}
!593 = !{i64 550}
!594 = !{i64 551}
!595 = !{i64 552}
!596 = !{i64 553}
!597 = !{i64 554}
!598 = !{i64 555}
!599 = !{i64 556}
!600 = !{i64 557}
!601 = !{i64 558}
!602 = !{i64 559}
!603 = !{i64 560}
!604 = !{i64 561}
!605 = !{i64 562}
!606 = !{i64 563}
!607 = !{i64 564}
!608 = !{i64 565}
!609 = !{i64 566}
!610 = !{i64 567}
!611 = !{i64 568}
!612 = !{i64 569}
!613 = !{i64 570}
!614 = !{i64 571}
!615 = !{i64 572}
!616 = !{i64 573}
!617 = !{i64 574}
!618 = !{i64 575}
!619 = !{i64 576}
!620 = !{i64 577}
!621 = !{i64 578}
!622 = !{i64 579}
!623 = !{i64 580}
!624 = !{i64 581}
!625 = !{i64 582}
!626 = !{i64 583}
!627 = !{i64 584}
!628 = !{i64 585}
!629 = !{i64 586}
!630 = !{i64 587}
!631 = !{i64 588}
!632 = !{i8 26}
!633 = !{i64 589}
!634 = !{i64 590}
!635 = !{i64 591}
!636 = !{i64 592}
!637 = !{i64 593}
!638 = !{i64 594}
!639 = !{i64 595}
!640 = !{i64 596}
!641 = !{i64 597}
!642 = !{i64 598}
!643 = !{i64 599}
!644 = !{i64 600}
!645 = !{i64 601}
!646 = !{i64 602}
!647 = !{i64 603}
!648 = !{i64 604}
!649 = !{i64 605}
!650 = !{i64 606}
!651 = !{i64 607}
!652 = !{i64 608}
!653 = !{i64 609}
!654 = !{i64 610}
!655 = !{i64 611}
!656 = !{i64 612}
!657 = !{i64 613}
!658 = !{i32 13}
!659 = !{i64 614}
!660 = !{i64 615}
!661 = !{i64 616}
!662 = !{i64 617}
!663 = !{i64 618}
!664 = !{i64 619}
!665 = !{i64 620}
!666 = !{i64 621}
!667 = !{i64 622}
!668 = !{i64 623}
!669 = !{i64 624}
!670 = !{i64 625}
!671 = !{i64 626}
!672 = !{i64 627}
!673 = !{i64 628}
!674 = !{i64 629}
!675 = !{i64 630}
!676 = !{i64 631}
!677 = !{i64 632}
!678 = !{i64 633}
!679 = !{i64 634}
!680 = !{i64 635}
!681 = !{i64 636}
!682 = !{i64 637}
!683 = !{i64 638}
!684 = !{i64 639}
!685 = !{i64 640}
!686 = !{i64 641}
!687 = !{i64 642}
!688 = !{i64 643}
!689 = !{i64 644}
!690 = !{i64 645}
!691 = !{i64 646}
!692 = !{i64 647}
!693 = !{i64 648}
!694 = !{i64 649}
!695 = !{i64 650}
!696 = !{i64 651}
!697 = !{i64 652}
!698 = !{i64 653}
!699 = distinct !{!699, !700}
!700 = !{!"llvm.loop.name", !"upzero_label10"}
!701 = !{i64 654}
!702 = !{i64 655}
!703 = !{i64 656}
!704 = !{i64 657}
!705 = !{i64 658}
!706 = !{i64 659}
!707 = !{i64 660}
!708 = !{i64 661}
!709 = !{i64 662}
!710 = !{i64 663}
!711 = !{i64 664}
!712 = !{i64 665}
!713 = !{i64 666}
!714 = !{i64 667}
!715 = !{i64 668}
!716 = !{i64 669}
!717 = !{i64 670}
!718 = !{i64 671}
!719 = !{i64 672}
!720 = !{i64 673}
!721 = !{i64 674}
!722 = !{i64 675}
!723 = !{i64 676}
!724 = !{i64 677}
!725 = !{i64 678}
!726 = !{i64 679}
!727 = !{i64 680}
!728 = !{i64 681}
!729 = !{i64 682}
!730 = !{i64 683}
!731 = !{i64 684}
!732 = !{i64 685}
!733 = !{i64 686}
!734 = !{i64 687}
!735 = !{i64 688}
!736 = !{i64 689}
!737 = !{i64 690}
!738 = !{i64 691}
!739 = !{i64 692}
!740 = !{i64 693}
!741 = !{i64 694}
!742 = !{i64 695}
!743 = !{i64 696}
!744 = !{i64 697}
!745 = !{i64 698}
!746 = distinct !{!746, !747}
!747 = !{!"llvm.loop.name", !"upzero_label11"}
!748 = !{i64 699}
!749 = !{i64 700}
!750 = !{i64 701}
!751 = !{i64 702}
!752 = !{i64 703}
!753 = !{i64 704}
!754 = !{i64 705}
!755 = !{i64 706}
!756 = !{i64 707}
!757 = !{i64 708}
!758 = !{i64 709}
!759 = !{i64 710}
!760 = !{i64 711}
!761 = !{i64 712}
!762 = !{i64 713}
!763 = !{i64 714}
!764 = !{i64 715}
!765 = !{i64 716}
!766 = !{i64 717}
!767 = !{i64 718}
!768 = !{i64 719}
!769 = !{i64 720}
!770 = !{i64 721}
!771 = !{i64 722}
!772 = !{i64 723}
!773 = !{i64 724}
!774 = !{i64 725}
!775 = !{i64 726}
!776 = !{i64 727}
!777 = !{i64 728}
!778 = !{i64 729}
!779 = !{i64 730}
!780 = !{i64 731}
!781 = !{i64 732}
!782 = !{i64 733}
!783 = !{i64 734}
!784 = !{i64 735}
!785 = !{i64 736}
!786 = !{i64 737}
!787 = !{i64 738}
!788 = !{i64 739}
!789 = !{i64 740}
!790 = !{i64 741}
!791 = !{i64 742}
!792 = !{i64 743}
!793 = !{i64 744}
!794 = !{i64 745}
!795 = !{i64 746}
!796 = !{i64 747}
!797 = !{i64 748}
!798 = !{i64 749}
!799 = !{i64 750}
!800 = !{i64 751}
!801 = !{i64 752}
!802 = !{i64 753}
!803 = !{i64 754}
!804 = !{i64 755}
!805 = !{i64 756}
!806 = !{i64 757}
!807 = !{i64 758}
!808 = !{i64 759}
!809 = !{i64 760}
!810 = !{i64 761}
!811 = !{i64 762}
!812 = !{i64 763}
!813 = !{i64 764}
!814 = !{i64 765}
!815 = !{i64 766}
!816 = !{i64 767}
!817 = !{i64 768}
!818 = !{i64 769}
!819 = !{i64 770}
!820 = !{i64 771}
!821 = !{i64 772}
!822 = !{i64 773}
!823 = !{i64 774}
!824 = !{i64 775}
!825 = !{i64 776}
!826 = !{i64 777}
!827 = !{i64 778}
!828 = !{i64 779}
!829 = !{i64 780}
!830 = !{i64 781}
!831 = !{i64 782}
!832 = !{i64 783}
!833 = !{i64 784}
!834 = !{i64 785}
!835 = !{i64 786}
!836 = !{i64 787}
!837 = !{i64 788}
!838 = !{i64 789}
!839 = !{i64 790}
!840 = !{i64 791}
!841 = !{i64 792}
!842 = !{i64 793}
!843 = !{i64 794}
!844 = !{i64 795}
!845 = !{i64 796}
!846 = !{i64 797}
!847 = !{i64 798}
!848 = !{i64 799}
!849 = !{i64 800}
!850 = !{i64 801}
!851 = !{i64 802}
!852 = !{i64 803}
!853 = !{i64 804}
!854 = !{i64 805}
!855 = !{i64 806}
!856 = !{i64 807}
!857 = !{i64 808}
!858 = !{i64 809}
!859 = !{i64 810}
!860 = !{i64 811}
!861 = !{i64 812}
!862 = !{i64 813}
!863 = !{i64 814}
!864 = !{i64 815}
!865 = !{i64 816}
!866 = !{i64 817}
!867 = !{i64 818}
!868 = !{i64 819}
!869 = !{i64 820}
!870 = !{i64 821}
!871 = !{i64 822}
!872 = !{i64 823}
!873 = !{i64 824}
!874 = !{i64 825}
!875 = !{i32 7}
!876 = !{i64 826}
!877 = !{i64 827}
!878 = !{i64 828}
!879 = !{i64 829}
!880 = !{i64 830}
!881 = !{i64 831}
!882 = !{i64 832}
!883 = !{i64 833}
!884 = !{i64 834}
!885 = !{i64 835}
!886 = !{i64 836}
!887 = !{i64 837}
!888 = !{i64 838}
!889 = !{i64 839}
!890 = !{i64 840}
!891 = !{i64 841}
!892 = !{i64 842}
!893 = !{i64 843}
!894 = !{i64 844}
!895 = !{i64 845}
!896 = !{i64 846}
!897 = !{i64 847}
!898 = !{i64 848}
!899 = !{i64 849}
!900 = !{i64 850}
!901 = !{i64 851}
!902 = !{i64 852}
!903 = !{i64 853}
!904 = !{i64 854}
!905 = !{i64 855}
!906 = !{i64 856}
!907 = !{i64 857}
!908 = !{i64 858}
!909 = !{i64 859}
!910 = !{i64 860}
!911 = !{i64 861}
!912 = !{i64 862}
!913 = !{i64 863}
!914 = !{i64 864}
!915 = !{i64 865}
!916 = !{i64 866}
!917 = !{i64 867}
!918 = !{i64 868}
!919 = !{i64 869}
!920 = !{i64 870}
!921 = !{i64 871}
!922 = !{i64 872}
!923 = !{i64 873}
!924 = !{i64 874}
!925 = !{i64 875}
!926 = !{i64 876}
!927 = !{i64 877}
!928 = !{i64 878}
!929 = !{i64 879}
!930 = !{i64 880}
!931 = !{i64 881}
!932 = !{i64 882}
!933 = !{i64 883}
!934 = !{i64 884}
!935 = !{i64 885}
!936 = !{i64 886}
!937 = !{i64 887}
!938 = !{i64 888}
!939 = !{i64 889}
!940 = !{i64 890}
!941 = !{i64 891}
!942 = !{i64 892}
!943 = !{i64 893}
!944 = !{i64 894}
!945 = !{i64 895}
!946 = !{i64 896}
!947 = !{i64 897}
!948 = !{i64 898}
!949 = !{i64 899}
!950 = !{i64 900}
!951 = !{i64 901}
!952 = !{i64 902}
!953 = !{i64 903}
!954 = !{i64 904}
!955 = !{i64 905}
!956 = !{i64 906}
!957 = !{i64 907}
!958 = !{i64 908}
!959 = !{i64 909}
!960 = !{i64 910}
!961 = !{i64 911}
!962 = !{i64 912}
!963 = !{i64 913}
!964 = !{i64 914}
!965 = !{i64 915}
!966 = !{i64 916}
!967 = !{i64 917}
!968 = !{i64 918}
!969 = !{i64 919}
!970 = !{i64 920}
!971 = !{i64 921}
!972 = !{i64 922}
!973 = !{i64 923}
!974 = !{i64 924}
!975 = !{i64 925}
!976 = !{i64 926}
!977 = !{i64 927}
!978 = !{i64 928}
!979 = !{i64 929}
!980 = !{i64 930}
!981 = !{i64 931}
!982 = !{i64 932}
!983 = !{i64 933}
!984 = !{i64 934}
!985 = !{i64 935}
!986 = !{i64 936}
!987 = !{i64 937}
!988 = !{i64 938}
!989 = !{i64 939}
!990 = !{i64 940}
!991 = !{i64 941}
!992 = !{i64 942}
!993 = !{i64 943}
!994 = !{i64 944}
!995 = !{i64 945}
!996 = !{i64 946}
!997 = !{i64 947}
!998 = !{i64 948}
!999 = !{i64 949}
!1000 = !{i64 950}
!1001 = !{i64 951}
!1002 = !{i64 952}
!1003 = !{i64 953}
!1004 = !{i64 954}
!1005 = !{i64 955}
!1006 = !{i64 956}
!1007 = !{i64 957}
!1008 = !{i64 958}
!1009 = !{i64 959}
!1010 = !{i64 960}
!1011 = !{i64 961}
!1012 = !{i64 962}
!1013 = !{i64 963}
!1014 = !{i64 964}
!1015 = !{i64 965}
!1016 = !{i64 966}
!1017 = !{i64 967}
!1018 = !{i64 968}
!1019 = !{i64 969}
!1020 = !{i64 970}
!1021 = !{i64 971}
!1022 = !{i64 972}
!1023 = !{i64 973}
!1024 = !{i64 974}
!1025 = !{i64 975}
!1026 = !{i64 976}
!1027 = !{i64 977}
!1028 = !{i64 978}
!1029 = !{i64 979}
!1030 = !{i64 980}
!1031 = !{i64 981}
!1032 = !{i64 982}
!1033 = !{i64 983}
!1034 = !{i64 984}
!1035 = !{i64 985}
!1036 = !{i64 986}
!1037 = !{i64 987}
!1038 = !{i64 988}
!1039 = !{i64 989}
!1040 = !{i64 990}
!1041 = !{i64 991}
!1042 = !{i64 992}
!1043 = !{i64 993}
!1044 = !{i64 994}
!1045 = !{i64 995}
!1046 = !{i64 996}
!1047 = !{i64 997}
!1048 = !{i64 998}
!1049 = !{i64 999}
!1050 = !{i64 1000}
!1051 = !{i64 1001}
!1052 = !{i64 1002}
!1053 = !{i64 1003}
!1054 = !{i64 1004}
!1055 = !{i64 1005}
!1056 = !{i64 1006}
!1057 = !{i64 1007}
!1058 = !{i64 1008}
!1059 = !{i64 1009}
!1060 = !{i64 1010}
!1061 = !{i64 1011}
!1062 = !{i64 1012}
!1063 = !{i64 1013}
!1064 = !{i64 1014}
!1065 = !{i64 1015}
!1066 = !{i64 1016}
!1067 = !{i64 1017}
!1068 = !{i64 1018}
!1069 = !{i64 1019}
!1070 = !{i64 1020}
!1071 = !{i64 1021}
!1072 = !{i64 1022}
!1073 = !{i64 1023}
!1074 = !{i64 1024}
!1075 = !{i64 1025}
!1076 = !{i64 1026}
!1077 = !{i64 1027}
!1078 = !{i64 1028}
!1079 = !{i64 1029}
!1080 = !{i64 1030}
!1081 = !{i64 1031}
!1082 = !{i64 1032}
!1083 = !{i64 1033}
!1084 = !{i64 1034}
!1085 = !{i64 1035}
!1086 = !{i64 1036}
!1087 = !{i64 1037}
!1088 = !{i64 1038}
!1089 = !{i64 1039}
!1090 = !{i64 1040}
!1091 = !{i64 1041}
!1092 = !{i64 1042}
!1093 = !{i64 1043}
!1094 = !{i64 1044}
!1095 = !{i64 1045}
!1096 = !{i64 1046}
!1097 = !{i64 1047}
!1098 = !{i64 1048}
!1099 = !{i64 1049}
!1100 = !{i64 1050}
!1101 = !{i64 1051}
!1102 = !{i64 1052}
!1103 = !{i64 1053}
!1104 = !{i64 1054}
!1105 = !{i64 1055}
!1106 = !{i64 1056}
!1107 = !{i64 1057}
!1108 = !{i64 1058}
!1109 = !{i64 1059}
!1110 = !{i64 1060}
!1111 = !{i64 1061}
!1112 = !{i64 1062}
!1113 = !{i64 1063}
!1114 = !{i64 1064}
!1115 = !{i64 1065}
!1116 = !{i64 1066}
!1117 = !{i64 1067}
!1118 = !{i64 1068}
!1119 = !{i64 1069}
!1120 = !{i64 1070}
!1121 = !{i64 1071}
!1122 = !{i64 1072}
!1123 = !{i64 1073}
!1124 = !{i64 1074}
!1125 = !{i64 1075}
!1126 = !{i64 1076}
!1127 = !{i64 1077}
!1128 = !{i64 1078}
!1129 = !{i64 1079}
!1130 = !{i64 1080}
!1131 = !{i64 1081}
!1132 = !{i64 1082}
!1133 = !{i64 1083}
!1134 = !{i64 1084}
!1135 = !{i64 1085}
!1136 = !{i64 1086}
!1137 = !{i64 1087}
!1138 = !{i64 1088}
!1139 = !{i64 1089}
!1140 = !{i64 1090}
!1141 = !{i64 1091}
!1142 = !{i64 1092}
!1143 = !{i64 1093}
!1144 = !{i64 1094}
!1145 = !{i64 1095}
!1146 = !{i64 1096}
!1147 = !{i64 1097}
!1148 = !{i64 1098}
!1149 = !{i64 1099}
!1150 = !{i64 1100}
!1151 = !{i64 1101}
!1152 = !{i64 1102}
!1153 = !{i64 1103}
!1154 = !{i64 1104}
!1155 = !{i64 1105}
!1156 = !{i64 1106}
!1157 = !{i64 1107}
!1158 = !{i64 1108}
!1159 = !{i64 1109}
!1160 = !{i64 1110}
!1161 = !{i64 1111}
!1162 = !{i64 1112}
!1163 = !{i64 1113}
!1164 = !{i64 1114}
!1165 = !{i64 1115}
!1166 = !{i64 1116}
!1167 = !{i64 1117}
!1168 = !{i64 1118}
!1169 = !{i64 1119}
!1170 = !{i64 1120}
!1171 = !{i64 1121}
!1172 = !{i64 1122}
!1173 = !{i64 1123}
!1174 = !{i64 1124}
!1175 = !{i64 1125}
!1176 = !{i64 1126}
!1177 = !{i64 1127}
!1178 = !{i64 1128}
!1179 = !{i64 1129}
!1180 = !{i64 1130}
!1181 = !{i64 1131}
!1182 = !{i64 1132}
!1183 = !{i64 1133}
!1184 = !{i64 1134}
!1185 = !{i64 1135}
!1186 = !{i64 1136}
!1187 = !{i64 1137}
!1188 = !{i64 1138}
!1189 = !{i64 1139}
!1190 = !{i64 1140}
!1191 = !{i64 1141}
!1192 = !{i64 1142}
!1193 = !{i64 1143}
!1194 = !{i64 1144}
!1195 = !{i64 1145}
!1196 = !{i64 1146}
!1197 = !{i64 1147}
!1198 = !{i64 1148}
!1199 = !{i64 1149}
!1200 = !{i64 1150}
!1201 = !{i64 1151}
!1202 = !{i64 1152}
!1203 = !{i64 1153}
!1204 = !{i64 1154}
!1205 = !{i64 1155}
!1206 = !{i64 1156}
!1207 = distinct !{!1207, !1208}
!1208 = !{!"llvm.loop.name", !"decode_label2"}
!1209 = !{i64 1157}
!1210 = !{i64 1158}
!1211 = !{i64 1159}
!1212 = !{i64 1160}
!1213 = !{i64 1161}
!1214 = !{i64 1162}
!1215 = !{i64 1163}
!1216 = !{i64 1164}
!1217 = !{i64 1165}
!1218 = !{i64 1166}
!1219 = !{i64 1167}
!1220 = !{i64 1168}
!1221 = !{i64 1169}
!1222 = !{i64 1170}
!1223 = !{i64 1171}
!1224 = !{i64 1172}
!1225 = !{i64 1173}
!1226 = !{i64 1174}
!1227 = !{i64 1175}
!1228 = !{i64 1176}
!1229 = !{i64 1177}
!1230 = !{i64 1178}
!1231 = !{i64 1179}
!1232 = !{i64 1180}
!1233 = !{i64 1181}
!1234 = !{i64 1182}
!1235 = !{i64 1183}
!1236 = !{i64 1184}
!1237 = !{i64 1185}
!1238 = !{i64 1186}
!1239 = !{i64 1187}
!1240 = !{i64 1188}
!1241 = !{i64 1189}
!1242 = !{i64 1190}
!1243 = !{i64 1191}
!1244 = !{i64 1192}
!1245 = !{i64 1193}
!1246 = !{i64 1194}
!1247 = !{i64 1195}
!1248 = !{i64 1196}
!1249 = !{i64 1197}
!1250 = !{i64 1198}
!1251 = !{i64 1199}
!1252 = !{i64 1200}
!1253 = !{i64 1201}
!1254 = !{i64 1202}
!1255 = !{i64 1203}
!1256 = !{i64 1204}
!1257 = !{i64 1205}
!1258 = !{i64 1206}
!1259 = !{i64 1207}
!1260 = !{i64 1208}
!1261 = !{i64 1209}
!1262 = !{i64 1210}
!1263 = !{i64 1211}
!1264 = !{i64 1212}
!1265 = !{i64 1213}
!1266 = !{i64 1214}
!1267 = !{i64 1215}
!1268 = !{i64 1216}
!1269 = !{i64 1217}
!1270 = !{i64 1218}
!1271 = !{i64 1219}
!1272 = !{i64 1220}
!1273 = !{i64 1221}
!1274 = distinct !{!1274, !1275}
!1275 = !{!"llvm.loop.name", !"decode_label3"}
!1276 = !{i64 1222}
!1277 = !{i64 1223}
!1278 = !{i64 1224}
!1279 = !{i64 1225}
!1280 = !{i64 1226}
!1281 = !{i64 1227}
!1282 = !{i64 1228}
!1283 = !{i64 1229}
!1284 = !{i64 1230}
!1285 = !{i64 1231}
!1286 = !{i64 1232}
!1287 = !{i64 1233}
!1288 = !{i64 1234}
!1289 = !{i64 1235}
!1290 = !{i64 1236}
!1291 = !{i64 1237}
!1292 = !{i64 1238}
!1293 = !{i64 1239}
!1294 = !{i64 1240}
!1295 = !{i64 1241}
!1296 = !{i64 1242}
!1297 = !{i64 1243}
!1298 = !{i64 1244}
!1299 = !{i64 1245}
!1300 = !{i64 1246}
!1301 = !{i32 29}
!1302 = !{i64 1247}
!1303 = !{i64 1248}
!1304 = !{i64 1249}
!1305 = !{i64 1250}
!1306 = !{i64 1251}
!1307 = !{i64 1252}
!1308 = !{i64 1253}
!1309 = !{i64 1254}
!1310 = !{i64 1255}
!1311 = !{i64 1256}
!1312 = !{i64 1257}
!1313 = !{i64 1258}
!1314 = !{i64 1259}
!1315 = !{i64 1260}
!1316 = !{i64 1261}
!1317 = !{i64 1262}
!1318 = !{i64 1263}
!1319 = !{i64 1264}
!1320 = !{i64 1265}
!1321 = !{i64 1266}
!1322 = !{i64 1267}
!1323 = !{i64 1268}
!1324 = !{i64 1269}
!1325 = !{i64 1270}
!1326 = !{i64 1271}
!1327 = !{i64 1272}
!1328 = !{i64 1273}
!1329 = !{i64 1274}
!1330 = !{i64 1275}
!1331 = !{i64 1276}
!1332 = !{i64 1277}
!1333 = !{i64 1278}
!1334 = !{i64 1279}
!1335 = !{i64 1280}
!1336 = !{i64 1281}
!1337 = !{i64 1282}
!1338 = !{i64 1283}
!1339 = !{i64 1284}
!1340 = !{i64 1285}
!1341 = !{i64 1286}
!1342 = !{i64 1287}
!1343 = !{i64 1288}
!1344 = !{i64 1289}
!1345 = !{i64 1290}
!1346 = !{i64 1291}
!1347 = !{i64 1292}
!1348 = !{i64 1293}
!1349 = !{i64 1294}
!1350 = !{i64 1295}
!1351 = !{i64 1296}
!1352 = !{i64 1297}
!1353 = !{i64 1298}
!1354 = !{i64 1299}
!1355 = !{i64 1300}
!1356 = !{i64 1301}
!1357 = !{i64 1302}
!1358 = !{i64 1303}
!1359 = !{i64 1304}
!1360 = !{i64 1305}
!1361 = !{i64 1306}
!1362 = distinct !{!1362, !1363}
!1363 = !{!"llvm.loop.name", !"reset_label4"}
!1364 = !{i64 1307}
!1365 = !{i64 1308}
!1366 = !{i64 1309}
!1367 = !{i64 1310}
!1368 = !{i64 1311}
!1369 = !{i64 1312}
!1370 = !{i64 1313}
!1371 = !{i64 1314}
!1372 = !{i64 1315}
!1373 = !{i64 1316}
!1374 = !{i64 1317}
!1375 = !{i64 1318}
!1376 = !{i64 1319}
!1377 = !{i64 1320}
!1378 = !{i64 1321}
!1379 = !{i64 1322}
!1380 = !{i64 1323}
!1381 = !{i64 1324}
!1382 = !{i64 1325}
!1383 = !{i64 1326}
!1384 = !{i64 1327}
!1385 = !{i64 1328}
!1386 = !{i64 1329}
!1387 = !{i64 1330}
!1388 = !{i64 1331}
!1389 = !{i64 1332}
!1390 = !{i64 1333}
!1391 = distinct !{!1391, !1392}
!1392 = !{!"llvm.loop.name", !"reset_label5"}
!1393 = !{i64 1334}
!1394 = !{i64 1335}
!1395 = !{i64 1336}
!1396 = !{i64 1337}
!1397 = !{i64 1338}
!1398 = !{i64 1339}
!1399 = !{i64 1340}
!1400 = !{i64 1341}
!1401 = !{i64 1342}
!1402 = !{i64 1343}
!1403 = !{i64 1344}
!1404 = !{i64 1345}
!1405 = !{i64 1346}
!1406 = !{i64 1347}
!1407 = !{i64 1348}
!1408 = distinct !{!1408, !1409}
!1409 = !{!"llvm.loop.name", !"reset_label6"}
!1410 = !{i64 1349}
!1411 = !{i64 1350}
!1412 = !{i64 1351}
!1413 = !{i64 1352}
!1414 = !{i64 1353}
!1415 = !{i64 1354}
!1416 = !{i64 1355}
!1417 = !{i64 1356}
!1418 = !{i64 1357}
!1419 = !{i64 1358}
!1420 = !{i64 1359}
!1421 = !{i64 1360}
!1422 = !{i64 1361}
!1423 = !{i64 1362}
!1424 = !{i64 1363}
!1425 = !{i64 1364}
!1426 = !{i64 1365}
!1427 = !{i64 1366}
!1428 = !{i64 1367}
!1429 = distinct !{!1429, !1430}
!1430 = !{!"llvm.loop.name", !"reset_label7"}
!1431 = !{i64 1368}
!1432 = !{i64 1369}
!1433 = !{i64 1370}
!1434 = !{i64 1371}
!1435 = !{!1436}
!1436 = !{!"fpga.top", !"user"}
!1437 = !{i64 1372}
!1438 = !{i64 1373}
!1439 = !{i64 1374}
!1440 = !{i64 1375}
!1441 = !{i32 16}
!1442 = !{i64 1376}
!1443 = !{i64 1377}
!1444 = !{i64 1378}
!1445 = !{i64 1379}
!1446 = !{i64 1380}
!1447 = !{i64 1381}
!1448 = !{i64 1382}
!1449 = !{i64 1383}
!1450 = !{i64 1384}
!1451 = !{i64 1385}
!1452 = !{i64 1386}
!1453 = !{i64 1387}
!1454 = !{i64 1388}
!1455 = !{i64 1389}
!1456 = !{i64 1390}
!1457 = !{i64 1391}
!1458 = !{i64 1392}
!1459 = !{i64 1393}
!1460 = !{i64 1394}
!1461 = !{i64 1395}
!1462 = !{i64 1396}
!1463 = !{i64 1397}
!1464 = !{i64 1398}
!1465 = !{i64 1399}
!1466 = !{i64 1400}
!1467 = !{i64 1401}
!1468 = !{i64 1402}
!1469 = !{i64 1403}
!1470 = !{i64 1404}
!1471 = !{i64 1405}
!1472 = !{i64 1406}
!1473 = !{i8 18}
!1474 = !{i64 1407}
!1475 = !{i64 1408}
!1476 = !{i64 1409}
!1477 = !{i64 1410}
!1478 = !{i64 1411}
!1479 = !{i64 1412}
!1480 = !{i64 1413}
!1481 = distinct !{!1481, !1482}
!1482 = !{!"llvm.loop.name", !"adpcm_main_label12"}
!1483 = !{i64 1414}
!1484 = !{i64 1415}
!1485 = !{i64 1416}
!1486 = !{i64 1417}
!1487 = !{i64 1418}
!1488 = !{i64 1419}
!1489 = !{i64 1420}
!1490 = !{i64 1421}
!1491 = !{i64 1422}
!1492 = !{i64 1423}
!1493 = !{i64 1424}
!1494 = !{i64 1425}
!1495 = !{i64 1426}
!1496 = !{i64 1427}
!1497 = !{i64 1428}
!1498 = !{i64 1429}
!1499 = !{i64 1430}
!1500 = !{i64 1431}
!1501 = !{i64 1432}
!1502 = !{i64 1433}
!1503 = !{i64 1434}
!1504 = !{i64 1435}
!1505 = !{i64 1436}
!1506 = !{i64 1437}
!1507 = !{i64 1438}
!1508 = !{i64 1439}
!1509 = !{i64 1440}
!1510 = !{i64 1441}
!1511 = !{i64 1442}
!1512 = !{i64 1443}
!1513 = !{i64 1444}
!1514 = distinct !{!1514, !1515}
!1515 = !{!"llvm.loop.name", !"adpcm_main_label13"}
!1516 = !{i64 1445}
!1517 = !{i64 1446}
!1518 = !{i64 1447}
!1519 = !{i64 1448}
!1520 = !{i64 1449}
