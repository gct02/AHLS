; ModuleID = 'adpcm_instrumented.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.BinOpInfo = type { i32, i32, i32, double, double, double, double, double, %struct.BinOpInfo* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

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
@profileFileName = private constant [15 x i8] c"data_stats.txt\00"
@ops = global %struct.BinOpInfo* null, align 8
@.str = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"Unable to open %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [29 x i8] c"%u|%u|%u|%u|%lf|%lf|%lf|%lf\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1.8 = private unnamed_addr constant [3 x i8] c"%x\00", align 1
@.str.2.11 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"_raw\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

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
  call void @saveProfile(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @profileFileName, i32 0, i32 0))
  ret i32 0, !opID !28, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define void @adpcm_main(i32* "fpga.decayed.dim.hint"="8000" %input_samples, i32* "fpga.decayed.dim.hint"="4000" %compressed, i32* "fpga.decayed.dim.hint"="8000" %result) #1 !fpga.function.pragma !30 {
entry:
  %input_samples.addr = alloca i32*, align 8, !opID !32, !opCode !6, !bitwidth !7, !numUses !11
  %compressed.addr = alloca i32*, align 8, !opID !33, !opCode !6, !bitwidth !7, !numUses !11
  %result.addr = alloca i32*, align 8, !opID !34, !opCode !6, !bitwidth !7, !numUses !11
  %i = alloca i32, align 4, !opID !35, !opCode !6, !bitwidth !7, !numUses !36
  %j = alloca i32, align 4, !opID !37, !opCode !6, !bitwidth !7, !numUses !11
  store i32* %input_samples, i32** %input_samples.addr, align 8, !opID !38, !opCode !13, !bitwidth !7, !numUses !7
  store i32* %compressed, i32** %compressed.addr, align 8, !opID !39, !opCode !13, !bitwidth !7, !numUses !7
  store i32* %result, i32** %result.addr, align 8, !opID !40, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %i to i8*, !opID !41, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !43, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i32* %j to i8*, !opID !44, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #8, !opID !45, !opCode !22, !bitwidth !7, !numUses !7
  call void @reset(), !opID !46, !opCode !22, !bitwidth !7, !numUses !7
  store i32 10, i32* %j, align 4, !opID !47, !opCode !13, !bitwidth !7, !numUses !7
  br label %adpcm_main_label12, !opID !48, !opCode !49, !bitwidth !7, !numUses !7

adpcm_main_label12:                               ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !50, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !opID !51, !opCode !49, !bitwidth !7, !numUses !7

for.cond:                                         ; preds = %for.inc, %adpcm_main_label12
  %2 = load i32, i32* %i, align 4, !opID !52, !opCode !17, !bitwidth !53, !numUses !8
  %cmp = icmp slt i32 %2, 8000, !opID !54, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp, label %for.body, label %for.end, !opID !56, !opCode !49, !bitwidth !7, !numUses !7

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %input_samples.addr, align 8, !opID !57, !opCode !17, !bitwidth !7, !numUses !8
  %4 = load i32, i32* %i, align 4, !opID !58, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom = sext i32 %4 to i64, !opID !59, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !opID !62, !opCode !19, !bitwidth !7, !numUses !8
  %5 = load i32, i32* %arrayidx, align 4, !opID !63, !opCode !17, !bitwidth !53, !numUses !8
  %6 = load i32*, i32** %input_samples.addr, align 8, !opID !64, !opCode !17, !bitwidth !7, !numUses !8
  %7 = load i32, i32* %i, align 4, !opID !65, !opCode !17, !bitwidth !53, !numUses !8
  %add = add i32 %7, 1, !opID !66, !opCode !67, !bitwidth !53, !numUses !8
  %8 = sitofp i32 %add to double
  call void @profOp(i64 1399, i8 11, double %8, i32 32)
  %idxprom1 = sext i32 %add to i64, !opID !68, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %idxprom1, !opID !69, !opCode !19, !bitwidth !7, !numUses !8
  %9 = load i32, i32* %arrayidx2, align 4, !opID !70, !opCode !17, !bitwidth !53, !numUses !8
  %call = call i32 @encode(i32 %5, i32 %9), !opID !71, !opCode !22, !bitwidth !53, !numUses !8
  %10 = load i32*, i32** %compressed.addr, align 8, !opID !72, !opCode !17, !bitwidth !7, !numUses !8
  %11 = load i32, i32* %i, align 4, !opID !73, !opCode !17, !bitwidth !53, !numUses !8
  %div = sdiv i32 %11, 2, !opID !74, !opCode !75, !bitwidth !53, !numUses !8
  %12 = sitofp i32 %div to double
  call void @profOp(i64 1406, i8 18, double %12, i32 32)
  %idxprom3 = sext i32 %div to i64, !opID !76, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx4 = getelementptr inbounds i32, i32* %10, i64 %idxprom3, !opID !77, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %call, i32* %arrayidx4, align 4, !opID !78, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc, !opID !79, !opCode !49, !bitwidth !7, !numUses !7

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4, !opID !80, !opCode !17, !bitwidth !53, !numUses !8
  %add5 = add i32 %13, 2, !opID !81, !opCode !67, !bitwidth !53, !numUses !8
  %14 = sitofp i32 %add5 to double
  call void @profOp(i64 1412, i8 11, double %14, i32 32)
  store i32 %add5, i32* %i, align 4, !opID !82, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !llvm.loop !83, !opID !85, !opCode !49, !bitwidth !7, !numUses !7

for.end:                                          ; preds = %for.cond
  br label %adpcm_main_label13, !opID !86, !opCode !49, !bitwidth !7, !numUses !7

adpcm_main_label13:                               ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !87, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond6, !opID !88, !opCode !49, !bitwidth !7, !numUses !7

for.cond6:                                        ; preds = %for.inc17, %adpcm_main_label13
  %15 = load i32, i32* %i, align 4, !opID !89, !opCode !17, !bitwidth !53, !numUses !8
  %cmp7 = icmp slt i32 %15, 8000, !opID !90, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp7, label %for.body8, label %for.end19, !opID !91, !opCode !49, !bitwidth !7, !numUses !7

for.body8:                                        ; preds = %for.cond6
  %16 = load i32*, i32** %compressed.addr, align 8, !opID !92, !opCode !17, !bitwidth !7, !numUses !8
  %17 = load i32, i32* %i, align 4, !opID !93, !opCode !17, !bitwidth !53, !numUses !8
  %div9 = sdiv i32 %17, 2, !opID !94, !opCode !75, !bitwidth !53, !numUses !8
  %18 = sitofp i32 %div9 to double
  call void @profOp(i64 1423, i8 18, double %18, i32 32)
  %idxprom10 = sext i32 %div9 to i64, !opID !95, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx11 = getelementptr inbounds i32, i32* %16, i64 %idxprom10, !opID !96, !opCode !19, !bitwidth !7, !numUses !8
  %19 = load i32, i32* %arrayidx11, align 4, !opID !97, !opCode !17, !bitwidth !53, !numUses !8
  call void @decode(i32 %19), !opID !98, !opCode !22, !bitwidth !7, !numUses !7
  %20 = load i32, i32* @xout1, align 4, !opID !99, !opCode !17, !bitwidth !53, !numUses !8
  %21 = load i32*, i32** %result.addr, align 8, !opID !100, !opCode !17, !bitwidth !7, !numUses !8
  %22 = load i32, i32* %i, align 4, !opID !101, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom12 = sext i32 %22 to i64, !opID !102, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx13 = getelementptr inbounds i32, i32* %21, i64 %idxprom12, !opID !103, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %20, i32* %arrayidx13, align 4, !opID !104, !opCode !13, !bitwidth !7, !numUses !7
  %23 = load i32, i32* @xout2, align 4, !opID !105, !opCode !17, !bitwidth !53, !numUses !8
  %24 = load i32*, i32** %result.addr, align 8, !opID !106, !opCode !17, !bitwidth !7, !numUses !8
  %25 = load i32, i32* %i, align 4, !opID !107, !opCode !17, !bitwidth !53, !numUses !8
  %add14 = add i32 %25, 1, !opID !108, !opCode !67, !bitwidth !53, !numUses !8
  %26 = sitofp i32 %add14 to double
  call void @profOp(i64 1437, i8 11, double %26, i32 32)
  %idxprom15 = sext i32 %add14 to i64, !opID !109, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx16 = getelementptr inbounds i32, i32* %24, i64 %idxprom15, !opID !110, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %23, i32* %arrayidx16, align 4, !opID !111, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc17, !opID !112, !opCode !49, !bitwidth !7, !numUses !7

for.inc17:                                        ; preds = %for.body8
  %27 = load i32, i32* %i, align 4, !opID !113, !opCode !17, !bitwidth !53, !numUses !8
  %add18 = add i32 %27, 2, !opID !114, !opCode !67, !bitwidth !53, !numUses !8
  %28 = sitofp i32 %add18 to double
  call void @profOp(i64 1443, i8 11, double %28, i32 32)
  store i32 %add18, i32* %i, align 4, !opID !115, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond6, !llvm.loop !116, !opID !118, !opCode !49, !bitwidth !7, !numUses !7

for.end19:                                        ; preds = %for.cond6
  %29 = bitcast i32* %j to i8*, !opID !119, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #8, !opID !120, !opCode !22, !bitwidth !7, !numUses !7
  %30 = bitcast i32* %i to i8*, !opID !121, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %30) #8, !opID !122, !opCode !22, !bitwidth !7, !numUses !7
  ret void, !opID !1, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
define void @reset() #3 {
entry:
  %i = alloca i32, align 4, !opID !123, !opCode !6, !bitwidth !7, !numUses !124
  %0 = bitcast i32* %i to i8*, !opID !125, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !126, !opCode !22, !bitwidth !7, !numUses !7
  store i32 32, i32* @dec_detl, align 4, !opID !127, !opCode !13, !bitwidth !7, !numUses !7
  store i32 32, i32* @detl, align 4, !opID !128, !opCode !13, !bitwidth !7, !numUses !7
  store i32 8, i32* @dec_deth, align 4, !opID !129, !opCode !13, !bitwidth !7, !numUses !7
  store i32 8, i32* @deth, align 4, !opID !130, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @rlt2, align 4, !opID !131, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @rlt1, align 4, !opID !132, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @plt2, align 4, !opID !133, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @plt1, align 4, !opID !134, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @al2, align 4, !opID !135, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @al1, align 4, !opID !136, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @nbl, align 4, !opID !137, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @rh2, align 4, !opID !138, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @rh1, align 4, !opID !139, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @ph2, align 4, !opID !140, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @ph1, align 4, !opID !141, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @ah2, align 4, !opID !142, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @ah1, align 4, !opID !143, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @nbh, align 4, !opID !144, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_rlt2, align 4, !opID !145, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_rlt1, align 4, !opID !146, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_plt2, align 4, !opID !147, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_plt1, align 4, !opID !148, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_al2, align 4, !opID !149, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_al1, align 4, !opID !150, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_nbl, align 4, !opID !151, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_rh2, align 4, !opID !152, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_rh1, align 4, !opID !153, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_ph2, align 4, !opID !154, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_ph1, align 4, !opID !155, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_ah2, align 4, !opID !156, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_ah1, align 4, !opID !157, !opCode !13, !bitwidth !7, !numUses !7
  store i32 0, i32* @dec_nbh, align 4, !opID !158, !opCode !13, !bitwidth !7, !numUses !7
  br label %reset_label4, !opID !159, !opCode !49, !bitwidth !7, !numUses !7

reset_label4:                                     ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !160, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !opID !161, !opCode !49, !bitwidth !7, !numUses !7

for.cond:                                         ; preds = %for.inc, %reset_label4
  %1 = load i32, i32* %i, align 4, !opID !162, !opCode !17, !bitwidth !53, !numUses !8
  %cmp = icmp slt i32 %1, 6, !opID !163, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp, label %for.body, label %for.end, !opID !164, !opCode !49, !bitwidth !7, !numUses !7

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !opID !165, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom = sext i32 %2 to i64, !opID !166, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dltx, i64 0, i64 %idxprom, !opID !167, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx, align 4, !opID !168, !opCode !13, !bitwidth !7, !numUses !7
  %3 = load i32, i32* %i, align 4, !opID !169, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom1 = sext i32 %3 to i64, !opID !170, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx2 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dhx, i64 0, i64 %idxprom1, !opID !171, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx2, align 4, !opID !172, !opCode !13, !bitwidth !7, !numUses !7
  %4 = load i32, i32* %i, align 4, !opID !173, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom3 = sext i32 %4 to i64, !opID !174, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx4 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dltx, i64 0, i64 %idxprom3, !opID !175, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx4, align 4, !opID !176, !opCode !13, !bitwidth !7, !numUses !7
  %5 = load i32, i32* %i, align 4, !opID !177, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom5 = sext i32 %5 to i64, !opID !178, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx6 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dhx, i64 0, i64 %idxprom5, !opID !179, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx6, align 4, !opID !180, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc, !opID !181, !opCode !49, !bitwidth !7, !numUses !7

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !opID !182, !opCode !17, !bitwidth !53, !numUses !8
  %inc = add i32 %6, 1, !opID !183, !opCode !67, !bitwidth !53, !numUses !8
  %7 = sitofp i32 %inc to double
  call void @profOp(i64 1305, i8 11, double %7, i32 32)
  store i32 %inc, i32* %i, align 4, !opID !184, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !llvm.loop !185, !opID !187, !opCode !49, !bitwidth !7, !numUses !7

for.end:                                          ; preds = %for.cond
  br label %reset_label5, !opID !188, !opCode !49, !bitwidth !7, !numUses !7

reset_label5:                                     ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !189, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond7, !opID !190, !opCode !49, !bitwidth !7, !numUses !7

for.cond7:                                        ; preds = %for.inc18, %reset_label5
  %8 = load i32, i32* %i, align 4, !opID !191, !opCode !17, !bitwidth !53, !numUses !8
  %cmp8 = icmp slt i32 %8, 6, !opID !192, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp8, label %for.body9, label %for.end20, !opID !193, !opCode !49, !bitwidth !7, !numUses !7

for.body9:                                        ; preds = %for.cond7
  %9 = load i32, i32* %i, align 4, !opID !194, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom10 = sext i32 %9 to i64, !opID !195, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx11 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bpl, i64 0, i64 %idxprom10, !opID !196, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx11, align 4, !opID !197, !opCode !13, !bitwidth !7, !numUses !7
  %10 = load i32, i32* %i, align 4, !opID !198, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom12 = sext i32 %10 to i64, !opID !199, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx13 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bph, i64 0, i64 %idxprom12, !opID !200, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx13, align 4, !opID !201, !opCode !13, !bitwidth !7, !numUses !7
  %11 = load i32, i32* %i, align 4, !opID !202, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom14 = sext i32 %11 to i64, !opID !203, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx15 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bpl, i64 0, i64 %idxprom14, !opID !204, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx15, align 4, !opID !205, !opCode !13, !bitwidth !7, !numUses !7
  %12 = load i32, i32* %i, align 4, !opID !206, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom16 = sext i32 %12 to i64, !opID !207, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bph, i64 0, i64 %idxprom16, !opID !208, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx17, align 4, !opID !209, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc18, !opID !210, !opCode !49, !bitwidth !7, !numUses !7

for.inc18:                                        ; preds = %for.body9
  %13 = load i32, i32* %i, align 4, !opID !211, !opCode !17, !bitwidth !53, !numUses !8
  %inc19 = add i32 %13, 1, !opID !212, !opCode !67, !bitwidth !53, !numUses !8
  %14 = sitofp i32 %inc19 to double
  call void @profOp(i64 1332, i8 11, double %14, i32 32)
  store i32 %inc19, i32* %i, align 4, !opID !213, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond7, !llvm.loop !214, !opID !216, !opCode !49, !bitwidth !7, !numUses !7

for.end20:                                        ; preds = %for.cond7
  br label %reset_label6, !opID !217, !opCode !49, !bitwidth !7, !numUses !7

reset_label6:                                     ; preds = %for.end20
  store i32 0, i32* %i, align 4, !opID !218, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond21, !opID !219, !opCode !49, !bitwidth !7, !numUses !7

for.cond21:                                       ; preds = %for.inc26, %reset_label6
  %15 = load i32, i32* %i, align 4, !opID !220, !opCode !17, !bitwidth !53, !numUses !8
  %cmp22 = icmp slt i32 %15, 24, !opID !221, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp22, label %for.body23, label %for.end28, !opID !222, !opCode !49, !bitwidth !7, !numUses !7

for.body23:                                       ; preds = %for.cond21
  %16 = load i32, i32* %i, align 4, !opID !223, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom24 = sext i32 %16 to i64, !opID !224, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx25 = getelementptr inbounds [24 x i32], [24 x i32]* @tqmf, i64 0, i64 %idxprom24, !opID !225, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx25, align 4, !opID !226, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc26, !opID !227, !opCode !49, !bitwidth !7, !numUses !7

for.inc26:                                        ; preds = %for.body23
  %17 = load i32, i32* %i, align 4, !opID !228, !opCode !17, !bitwidth !53, !numUses !8
  %inc27 = add i32 %17, 1, !opID !229, !opCode !67, !bitwidth !53, !numUses !8
  %18 = sitofp i32 %inc27 to double
  call void @profOp(i64 1347, i8 11, double %18, i32 32)
  store i32 %inc27, i32* %i, align 4, !opID !230, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond21, !llvm.loop !231, !opID !233, !opCode !49, !bitwidth !7, !numUses !7

for.end28:                                        ; preds = %for.cond21
  br label %reset_label7, !opID !234, !opCode !49, !bitwidth !7, !numUses !7

reset_label7:                                     ; preds = %for.end28
  store i32 0, i32* %i, align 4, !opID !235, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond29, !opID !236, !opCode !49, !bitwidth !7, !numUses !7

for.cond29:                                       ; preds = %for.inc36, %reset_label7
  %19 = load i32, i32* %i, align 4, !opID !237, !opCode !17, !bitwidth !53, !numUses !8
  %cmp30 = icmp slt i32 %19, 11, !opID !238, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp30, label %for.body31, label %for.end38, !opID !239, !opCode !49, !bitwidth !7, !numUses !7

for.body31:                                       ; preds = %for.cond29
  %20 = load i32, i32* %i, align 4, !opID !240, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom32 = sext i32 %20 to i64, !opID !241, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx33 = getelementptr inbounds [11 x i32], [11 x i32]* @accumc, i64 0, i64 %idxprom32, !opID !242, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx33, align 4, !opID !243, !opCode !13, !bitwidth !7, !numUses !7
  %21 = load i32, i32* %i, align 4, !opID !244, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom34 = sext i32 %21 to i64, !opID !245, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx35 = getelementptr inbounds [11 x i32], [11 x i32]* @accumd, i64 0, i64 %idxprom34, !opID !246, !opCode !19, !bitwidth !7, !numUses !8
  store i32 0, i32* %arrayidx35, align 4, !opID !247, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc36, !opID !248, !opCode !49, !bitwidth !7, !numUses !7

for.inc36:                                        ; preds = %for.body31
  %22 = load i32, i32* %i, align 4, !opID !249, !opCode !17, !bitwidth !53, !numUses !8
  %inc37 = add i32 %22, 1, !opID !250, !opCode !67, !bitwidth !53, !numUses !8
  %23 = sitofp i32 %inc37 to double
  call void @profOp(i64 1366, i8 11, double %23, i32 32)
  store i32 %inc37, i32* %i, align 4, !opID !251, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond29, !llvm.loop !252, !opID !254, !opCode !49, !bitwidth !7, !numUses !7

for.end38:                                        ; preds = %for.cond29
  %24 = bitcast i32* %i to i8*, !opID !255, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %24) #8, !opID !256, !opCode !22, !bitwidth !7, !numUses !7
  ret void, !opID !257, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @encode(i32 %xin1, i32 %xin2) #3 {
entry:
  %xin1.addr = alloca i32, align 4, !opID !258, !opCode !6, !bitwidth !7, !numUses !259
  %xin2.addr = alloca i32, align 4, !opID !260, !opCode !6, !bitwidth !7, !numUses !259
  %i = alloca i32, align 4, !opID !261, !opCode !6, !bitwidth !7, !numUses !262
  %h_ptr = alloca i32*, align 8, !opID !263, !opCode !6, !bitwidth !7, !numUses !264
  %tqmf_ptr = alloca i32*, align 8, !opID !265, !opCode !6, !bitwidth !7, !numUses !266
  %tqmf_ptr1 = alloca i32*, align 8, !opID !267, !opCode !6, !bitwidth !7, !numUses !268
  %xa = alloca i64, align 8, !opID !269, !opCode !6, !bitwidth !7, !numUses !270
  %xb = alloca i64, align 8, !opID !271, !opCode !6, !bitwidth !7, !numUses !270
  %decis = alloca i32, align 4, !opID !272, !opCode !6, !bitwidth !7, !numUses !273
  store i32 %xin1, i32* %xin1.addr, align 4, !opID !274, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %xin2, i32* %xin2.addr, align 4, !opID !275, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %i to i8*, !opID !276, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !277, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i32** %h_ptr to i8*, !opID !278, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #8, !opID !279, !opCode !22, !bitwidth !7, !numUses !7
  %2 = bitcast i32** %tqmf_ptr to i8*, !opID !280, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #8, !opID !281, !opCode !22, !bitwidth !7, !numUses !7
  %3 = bitcast i32** %tqmf_ptr1 to i8*, !opID !282, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #8, !opID !283, !opCode !22, !bitwidth !7, !numUses !7
  %4 = bitcast i64* %xa to i8*, !opID !284, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #8, !opID !285, !opCode !22, !bitwidth !7, !numUses !7
  %5 = bitcast i64* %xb to i8*, !opID !286, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #8, !opID !287, !opCode !22, !bitwidth !7, !numUses !7
  %6 = bitcast i32* %decis to i8*, !opID !288, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #8, !opID !289, !opCode !22, !bitwidth !7, !numUses !7
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 8, !opID !290, !opCode !13, !bitwidth !7, !numUses !7
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 0), i32** %tqmf_ptr, align 8, !opID !291, !opCode !13, !bitwidth !7, !numUses !7
  %7 = load i32*, i32** %tqmf_ptr, align 8, !opID !292, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr = getelementptr inbounds i32, i32* %7, i32 1, !opID !293, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr, i32** %tqmf_ptr, align 8, !opID !294, !opCode !13, !bitwidth !7, !numUses !7
  %8 = load i32, i32* %7, align 4, !opID !295, !opCode !17, !bitwidth !53, !numUses !8
  %conv = sext i32 %8 to i64, !opID !296, !opCode !60, !bitwidth !61, !numUses !8
  %9 = load i32*, i32** %h_ptr, align 8, !opID !297, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr1 = getelementptr inbounds i32, i32* %9, i32 1, !opID !298, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr1, i32** %h_ptr, align 8, !opID !299, !opCode !13, !bitwidth !7, !numUses !7
  %10 = load i32, i32* %9, align 4, !opID !300, !opCode !17, !bitwidth !53, !numUses !8
  %conv2 = sext i32 %10 to i64, !opID !301, !opCode !60, !bitwidth !61, !numUses !8
  %mul = mul i64 %conv, %conv2, !opID !302, !opCode !303, !bitwidth !61, !numUses !8
  %11 = sitofp i64 %mul to double
  call void @profOp(i64 73, i8 15, double %11, i32 64)
  store i64 %mul, i64* %xa, align 8, !opID !304, !opCode !13, !bitwidth !7, !numUses !7
  %12 = load i32*, i32** %tqmf_ptr, align 8, !opID !305, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr3 = getelementptr inbounds i32, i32* %12, i32 1, !opID !306, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr3, i32** %tqmf_ptr, align 8, !opID !307, !opCode !13, !bitwidth !7, !numUses !7
  %13 = load i32, i32* %12, align 4, !opID !308, !opCode !17, !bitwidth !53, !numUses !8
  %conv4 = sext i32 %13 to i64, !opID !309, !opCode !60, !bitwidth !61, !numUses !8
  %14 = load i32*, i32** %h_ptr, align 8, !opID !310, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr5 = getelementptr inbounds i32, i32* %14, i32 1, !opID !311, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr5, i32** %h_ptr, align 8, !opID !312, !opCode !13, !bitwidth !7, !numUses !7
  %15 = load i32, i32* %14, align 4, !opID !313, !opCode !17, !bitwidth !53, !numUses !8
  %conv6 = sext i32 %15 to i64, !opID !314, !opCode !60, !bitwidth !61, !numUses !8
  %mul7 = mul i64 %conv4, %conv6, !opID !315, !opCode !303, !bitwidth !61, !numUses !8
  %16 = sitofp i64 %mul7 to double
  call void @profOp(i64 85, i8 15, double %16, i32 64)
  store i64 %mul7, i64* %xb, align 8, !opID !316, !opCode !13, !bitwidth !7, !numUses !7
  br label %encode_label0, !opID !317, !opCode !49, !bitwidth !7, !numUses !7

encode_label0:                                    ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !318, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !opID !319, !opCode !49, !bitwidth !7, !numUses !7

for.cond:                                         ; preds = %for.inc, %encode_label0
  %17 = load i32, i32* %i, align 4, !opID !320, !opCode !17, !bitwidth !53, !numUses !8
  %cmp = icmp slt i32 %17, 10, !opID !321, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp, label %for.body, label %for.end, !opID !322, !opCode !49, !bitwidth !7, !numUses !7

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %tqmf_ptr, align 8, !opID !323, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr8 = getelementptr inbounds i32, i32* %18, i32 1, !opID !324, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr8, i32** %tqmf_ptr, align 8, !opID !325, !opCode !13, !bitwidth !7, !numUses !7
  %19 = load i32, i32* %18, align 4, !opID !326, !opCode !17, !bitwidth !53, !numUses !8
  %conv9 = sext i32 %19 to i64, !opID !327, !opCode !60, !bitwidth !61, !numUses !8
  %20 = load i32*, i32** %h_ptr, align 8, !opID !328, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr10 = getelementptr inbounds i32, i32* %20, i32 1, !opID !329, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr10, i32** %h_ptr, align 8, !opID !330, !opCode !13, !bitwidth !7, !numUses !7
  %21 = load i32, i32* %20, align 4, !opID !331, !opCode !17, !bitwidth !53, !numUses !8
  %conv11 = sext i32 %21 to i64, !opID !332, !opCode !60, !bitwidth !61, !numUses !8
  %mul12 = mul i64 %conv9, %conv11, !opID !333, !opCode !303, !bitwidth !61, !numUses !8
  %22 = sitofp i64 %mul12 to double
  call void @profOp(i64 103, i8 15, double %22, i32 64)
  %23 = load i64, i64* %xa, align 8, !opID !334, !opCode !17, !bitwidth !61, !numUses !8
  %add = add i64 %23, %mul12, !opID !335, !opCode !67, !bitwidth !61, !numUses !8
  %24 = sitofp i64 %add to double
  call void @profOp(i64 105, i8 11, double %24, i32 64)
  store i64 %add, i64* %xa, align 8, !opID !336, !opCode !13, !bitwidth !7, !numUses !7
  %25 = load i32*, i32** %tqmf_ptr, align 8, !opID !337, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr13 = getelementptr inbounds i32, i32* %25, i32 1, !opID !338, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr13, i32** %tqmf_ptr, align 8, !opID !339, !opCode !13, !bitwidth !7, !numUses !7
  %26 = load i32, i32* %25, align 4, !opID !340, !opCode !17, !bitwidth !53, !numUses !8
  %conv14 = sext i32 %26 to i64, !opID !341, !opCode !60, !bitwidth !61, !numUses !8
  %27 = load i32*, i32** %h_ptr, align 8, !opID !342, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr15 = getelementptr inbounds i32, i32* %27, i32 1, !opID !343, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr15, i32** %h_ptr, align 8, !opID !344, !opCode !13, !bitwidth !7, !numUses !7
  %28 = load i32, i32* %27, align 4, !opID !345, !opCode !17, !bitwidth !53, !numUses !8
  %conv16 = sext i32 %28 to i64, !opID !346, !opCode !60, !bitwidth !61, !numUses !8
  %mul17 = mul i64 %conv14, %conv16, !opID !347, !opCode !303, !bitwidth !61, !numUses !8
  %29 = sitofp i64 %mul17 to double
  call void @profOp(i64 117, i8 15, double %29, i32 64)
  %30 = load i64, i64* %xb, align 8, !opID !348, !opCode !17, !bitwidth !61, !numUses !8
  %add18 = add i64 %30, %mul17, !opID !349, !opCode !67, !bitwidth !61, !numUses !8
  %31 = sitofp i64 %add18 to double
  call void @profOp(i64 119, i8 11, double %31, i32 64)
  store i64 %add18, i64* %xb, align 8, !opID !350, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc, !opID !351, !opCode !49, !bitwidth !7, !numUses !7

for.inc:                                          ; preds = %for.body
  %32 = load i32, i32* %i, align 4, !opID !352, !opCode !17, !bitwidth !53, !numUses !8
  %inc = add i32 %32, 1, !opID !353, !opCode !67, !bitwidth !53, !numUses !8
  %33 = sitofp i32 %inc to double
  call void @profOp(i64 123, i8 11, double %33, i32 32)
  store i32 %inc, i32* %i, align 4, !opID !354, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !llvm.loop !355, !opID !357, !opCode !49, !bitwidth !7, !numUses !7

for.end:                                          ; preds = %for.cond
  %34 = load i32*, i32** %tqmf_ptr, align 8, !opID !358, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr19 = getelementptr inbounds i32, i32* %34, i32 1, !opID !359, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr19, i32** %tqmf_ptr, align 8, !opID !360, !opCode !13, !bitwidth !7, !numUses !7
  %35 = load i32, i32* %34, align 4, !opID !361, !opCode !17, !bitwidth !53, !numUses !8
  %conv20 = sext i32 %35 to i64, !opID !362, !opCode !60, !bitwidth !61, !numUses !8
  %36 = load i32*, i32** %h_ptr, align 8, !opID !363, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr21 = getelementptr inbounds i32, i32* %36, i32 1, !opID !364, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr21, i32** %h_ptr, align 8, !opID !365, !opCode !13, !bitwidth !7, !numUses !7
  %37 = load i32, i32* %36, align 4, !opID !366, !opCode !17, !bitwidth !53, !numUses !8
  %conv22 = sext i32 %37 to i64, !opID !367, !opCode !60, !bitwidth !61, !numUses !8
  %mul23 = mul i64 %conv20, %conv22, !opID !368, !opCode !303, !bitwidth !61, !numUses !8
  %38 = sitofp i64 %mul23 to double
  call void @profOp(i64 136, i8 15, double %38, i32 64)
  %39 = load i64, i64* %xa, align 8, !opID !369, !opCode !17, !bitwidth !61, !numUses !8
  %add24 = add i64 %39, %mul23, !opID !370, !opCode !67, !bitwidth !61, !numUses !8
  %40 = sitofp i64 %add24 to double
  call void @profOp(i64 138, i8 11, double %40, i32 64)
  store i64 %add24, i64* %xa, align 8, !opID !371, !opCode !13, !bitwidth !7, !numUses !7
  %41 = load i32*, i32** %tqmf_ptr, align 8, !opID !372, !opCode !17, !bitwidth !7, !numUses !8
  %42 = load i32, i32* %41, align 4, !opID !373, !opCode !17, !bitwidth !53, !numUses !8
  %conv25 = sext i32 %42 to i64, !opID !374, !opCode !60, !bitwidth !61, !numUses !8
  %43 = load i32*, i32** %h_ptr, align 8, !opID !375, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr26 = getelementptr inbounds i32, i32* %43, i32 1, !opID !376, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr26, i32** %h_ptr, align 8, !opID !377, !opCode !13, !bitwidth !7, !numUses !7
  %44 = load i32, i32* %43, align 4, !opID !378, !opCode !17, !bitwidth !53, !numUses !8
  %conv27 = sext i32 %44 to i64, !opID !379, !opCode !60, !bitwidth !61, !numUses !8
  %mul28 = mul i64 %conv25, %conv27, !opID !380, !opCode !303, !bitwidth !61, !numUses !8
  %45 = sitofp i64 %mul28 to double
  call void @profOp(i64 148, i8 15, double %45, i32 64)
  %46 = load i64, i64* %xb, align 8, !opID !381, !opCode !17, !bitwidth !61, !numUses !8
  %add29 = add i64 %46, %mul28, !opID !382, !opCode !67, !bitwidth !61, !numUses !8
  %47 = sitofp i64 %add29 to double
  call void @profOp(i64 150, i8 11, double %47, i32 64)
  store i64 %add29, i64* %xb, align 8, !opID !383, !opCode !13, !bitwidth !7, !numUses !7
  %48 = load i32*, i32** %tqmf_ptr, align 8, !opID !384, !opCode !17, !bitwidth !7, !numUses !8
  %add.ptr = getelementptr inbounds i32, i32* %48, i64 -2, !opID !385, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %add.ptr, i32** %tqmf_ptr1, align 8, !opID !386, !opCode !13, !bitwidth !7, !numUses !7
  br label %encode_label1, !opID !387, !opCode !49, !bitwidth !7, !numUses !7

encode_label1:                                    ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !388, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond30, !opID !389, !opCode !49, !bitwidth !7, !numUses !7

for.cond30:                                       ; preds = %for.inc35, %encode_label1
  %49 = load i32, i32* %i, align 4, !opID !390, !opCode !17, !bitwidth !53, !numUses !8
  %cmp31 = icmp slt i32 %49, 22, !opID !391, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp31, label %for.body32, label %for.end37, !opID !392, !opCode !49, !bitwidth !7, !numUses !7

for.body32:                                       ; preds = %for.cond30
  %50 = load i32*, i32** %tqmf_ptr1, align 8, !opID !393, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr33 = getelementptr inbounds i32, i32* %50, i32 -1, !opID !394, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr33, i32** %tqmf_ptr1, align 8, !opID !395, !opCode !13, !bitwidth !7, !numUses !7
  %51 = load i32, i32* %50, align 4, !opID !396, !opCode !17, !bitwidth !53, !numUses !8
  %52 = load i32*, i32** %tqmf_ptr, align 8, !opID !397, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr34 = getelementptr inbounds i32, i32* %52, i32 -1, !opID !398, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr34, i32** %tqmf_ptr, align 8, !opID !399, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %51, i32* %52, align 4, !opID !400, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc35, !opID !401, !opCode !49, !bitwidth !7, !numUses !7

for.inc35:                                        ; preds = %for.body32
  %53 = load i32, i32* %i, align 4, !opID !402, !opCode !17, !bitwidth !53, !numUses !8
  %inc36 = add i32 %53, 1, !opID !403, !opCode !67, !bitwidth !53, !numUses !8
  %54 = sitofp i32 %inc36 to double
  call void @profOp(i64 171, i8 11, double %54, i32 32)
  store i32 %inc36, i32* %i, align 4, !opID !404, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond30, !llvm.loop !405, !opID !407, !opCode !49, !bitwidth !7, !numUses !7

for.end37:                                        ; preds = %for.cond30
  %55 = load i32, i32* %xin1.addr, align 4, !opID !408, !opCode !17, !bitwidth !53, !numUses !8
  %56 = load i32*, i32** %tqmf_ptr, align 8, !opID !409, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr38 = getelementptr inbounds i32, i32* %56, i32 -1, !opID !410, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr38, i32** %tqmf_ptr, align 8, !opID !411, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %55, i32* %56, align 4, !opID !412, !opCode !13, !bitwidth !7, !numUses !7
  %57 = load i32, i32* %xin2.addr, align 4, !opID !413, !opCode !17, !bitwidth !53, !numUses !8
  %58 = load i32*, i32** %tqmf_ptr, align 8, !opID !414, !opCode !17, !bitwidth !7, !numUses !8
  store i32 %57, i32* %58, align 4, !opID !415, !opCode !13, !bitwidth !7, !numUses !7
  %59 = load i64, i64* %xa, align 8, !opID !416, !opCode !17, !bitwidth !61, !numUses !8
  %60 = load i64, i64* %xb, align 8, !opID !417, !opCode !17, !bitwidth !61, !numUses !8
  %add39 = add i64 %59, %60, !opID !418, !opCode !67, !bitwidth !61, !numUses !8
  %61 = sitofp i64 %add39 to double
  call void @profOp(i64 184, i8 11, double %61, i32 64)
  %shr = ashr i64 %add39, 15, !opID !419, !opCode !420, !bitwidth !61, !numUses !8
  %62 = sitofp i64 %shr to double
  call void @profOp(i64 185, i8 25, double %62, i32 64)
  %conv40 = trunc i64 %shr to i32, !opID !421, !opCode !422, !bitwidth !53, !numUses !8
  store i32 %conv40, i32* @xl, align 4, !opID !423, !opCode !13, !bitwidth !7, !numUses !7
  %63 = load i64, i64* %xa, align 8, !opID !424, !opCode !17, !bitwidth !61, !numUses !8
  %64 = load i64, i64* %xb, align 8, !opID !425, !opCode !17, !bitwidth !61, !numUses !8
  %sub = sub i64 %63, %64, !opID !426, !opCode !427, !bitwidth !61, !numUses !8
  %65 = sitofp i64 %sub to double
  call void @profOp(i64 190, i8 13, double %65, i32 64)
  %shr41 = ashr i64 %sub, 15, !opID !428, !opCode !420, !bitwidth !61, !numUses !8
  %66 = sitofp i64 %shr41 to double
  call void @profOp(i64 191, i8 25, double %66, i32 64)
  %conv42 = trunc i64 %shr41 to i32, !opID !429, !opCode !422, !bitwidth !53, !numUses !8
  store i32 %conv42, i32* @xh, align 4, !opID !430, !opCode !13, !bitwidth !7, !numUses !7
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0)), !opID !431, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call, i32* @szl, align 4, !opID !432, !opCode !13, !bitwidth !7, !numUses !7
  %67 = load i32, i32* @rlt1, align 4, !opID !433, !opCode !17, !bitwidth !53, !numUses !8
  %68 = load i32, i32* @al1, align 4, !opID !434, !opCode !17, !bitwidth !53, !numUses !8
  %69 = load i32, i32* @rlt2, align 4, !opID !435, !opCode !17, !bitwidth !53, !numUses !8
  %70 = load i32, i32* @al2, align 4, !opID !436, !opCode !17, !bitwidth !53, !numUses !8
  %call43 = call i32 @filtep(i32 %67, i32 %68, i32 %69, i32 %70), !opID !437, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call43, i32* @spl, align 4, !opID !438, !opCode !13, !bitwidth !7, !numUses !7
  %71 = load i32, i32* @szl, align 4, !opID !439, !opCode !17, !bitwidth !53, !numUses !8
  %72 = load i32, i32* @spl, align 4, !opID !440, !opCode !17, !bitwidth !53, !numUses !8
  %add44 = add i32 %71, %72, !opID !441, !opCode !67, !bitwidth !53, !numUses !8
  %73 = sitofp i32 %add44 to double
  call void @profOp(i64 204, i8 11, double %73, i32 32)
  store i32 %add44, i32* @sl, align 4, !opID !442, !opCode !13, !bitwidth !7, !numUses !7
  %74 = load i32, i32* @xl, align 4, !opID !443, !opCode !17, !bitwidth !53, !numUses !8
  %75 = load i32, i32* @sl, align 4, !opID !444, !opCode !17, !bitwidth !53, !numUses !8
  %sub45 = sub i32 %74, %75, !opID !445, !opCode !427, !bitwidth !53, !numUses !8
  %76 = sitofp i32 %sub45 to double
  call void @profOp(i64 208, i8 13, double %76, i32 32)
  store i32 %sub45, i32* @el, align 4, !opID !446, !opCode !13, !bitwidth !7, !numUses !7
  %77 = load i32, i32* @el, align 4, !opID !447, !opCode !17, !bitwidth !53, !numUses !8
  %78 = load i32, i32* @detl, align 4, !opID !448, !opCode !17, !bitwidth !53, !numUses !8
  %call46 = call i32 @quantl(i32 %77, i32 %78), !opID !449, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call46, i32* @il, align 4, !opID !450, !opCode !13, !bitwidth !7, !numUses !7
  %79 = load i32, i32* @detl, align 4, !opID !451, !opCode !17, !bitwidth !53, !numUses !8
  %conv47 = sext i32 %79 to i64, !opID !452, !opCode !60, !bitwidth !61, !numUses !8
  %80 = load i32, i32* @il, align 4, !opID !453, !opCode !17, !bitwidth !53, !numUses !8
  %shr48 = ashr i32 %80, 2, !opID !454, !opCode !420, !bitwidth !53, !numUses !8
  %81 = sitofp i32 %shr48 to double
  call void @profOp(i64 217, i8 25, double %81, i32 32)
  %idxprom = sext i32 %shr48 to i64, !opID !455, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i64 0, i64 %idxprom, !opID !456, !opCode !19, !bitwidth !7, !numUses !8
  %82 = load i32, i32* %arrayidx, align 4, !opID !457, !opCode !17, !bitwidth !53, !numUses !8
  %conv49 = sext i32 %82 to i64, !opID !458, !opCode !60, !bitwidth !61, !numUses !8
  %mul50 = mul i64 %conv47, %conv49, !opID !459, !opCode !303, !bitwidth !61, !numUses !8
  %83 = sitofp i64 %mul50 to double
  call void @profOp(i64 222, i8 15, double %83, i32 64)
  %shr51 = ashr i64 %mul50, 15, !opID !460, !opCode !420, !bitwidth !61, !numUses !8
  %84 = sitofp i64 %shr51 to double
  call void @profOp(i64 223, i8 25, double %84, i32 64)
  %conv52 = trunc i64 %shr51 to i32, !opID !461, !opCode !422, !bitwidth !53, !numUses !8
  store i32 %conv52, i32* @dlt, align 4, !opID !462, !opCode !13, !bitwidth !7, !numUses !7
  %85 = load i32, i32* @il, align 4, !opID !463, !opCode !17, !bitwidth !53, !numUses !8
  %86 = load i32, i32* @nbl, align 4, !opID !464, !opCode !17, !bitwidth !53, !numUses !8
  %call53 = call i32 @logscl(i32 %85, i32 %86), !opID !465, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call53, i32* @nbl, align 4, !opID !466, !opCode !13, !bitwidth !7, !numUses !7
  %87 = load i32, i32* @nbl, align 4, !opID !467, !opCode !17, !bitwidth !53, !numUses !8
  %call54 = call i32 @scalel(i32 %87, i32 8), !opID !468, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call54, i32* @detl, align 4, !opID !469, !opCode !13, !bitwidth !7, !numUses !7
  %88 = load i32, i32* @dlt, align 4, !opID !470, !opCode !17, !bitwidth !53, !numUses !8
  %89 = load i32, i32* @szl, align 4, !opID !471, !opCode !17, !bitwidth !53, !numUses !8
  %add55 = add i32 %88, %89, !opID !472, !opCode !67, !bitwidth !53, !numUses !8
  %90 = sitofp i32 %add55 to double
  call void @profOp(i64 235, i8 11, double %90, i32 32)
  store i32 %add55, i32* @plt, align 4, !opID !473, !opCode !13, !bitwidth !7, !numUses !7
  %91 = load i32, i32* @dlt, align 4, !opID !474, !opCode !17, !bitwidth !53, !numUses !8
  call void @upzero(i32 %91, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0)), !opID !475, !opCode !22, !bitwidth !7, !numUses !7
  %92 = load i32, i32* @al1, align 4, !opID !476, !opCode !17, !bitwidth !53, !numUses !8
  %93 = load i32, i32* @al2, align 4, !opID !477, !opCode !17, !bitwidth !53, !numUses !8
  %94 = load i32, i32* @plt, align 4, !opID !478, !opCode !17, !bitwidth !53, !numUses !8
  %95 = load i32, i32* @plt1, align 4, !opID !479, !opCode !17, !bitwidth !53, !numUses !8
  %96 = load i32, i32* @plt2, align 4, !opID !480, !opCode !17, !bitwidth !53, !numUses !8
  %call56 = call i32 @uppol2(i32 %92, i32 %93, i32 %94, i32 %95, i32 %96), !opID !481, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call56, i32* @al2, align 4, !opID !482, !opCode !13, !bitwidth !7, !numUses !7
  %97 = load i32, i32* @al1, align 4, !opID !483, !opCode !17, !bitwidth !53, !numUses !8
  %98 = load i32, i32* @al2, align 4, !opID !484, !opCode !17, !bitwidth !53, !numUses !8
  %99 = load i32, i32* @plt, align 4, !opID !485, !opCode !17, !bitwidth !53, !numUses !8
  %100 = load i32, i32* @plt1, align 4, !opID !486, !opCode !17, !bitwidth !53, !numUses !8
  %call57 = call i32 @uppol1(i32 %97, i32 %98, i32 %99, i32 %100), !opID !487, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call57, i32* @al1, align 4, !opID !488, !opCode !13, !bitwidth !7, !numUses !7
  %101 = load i32, i32* @sl, align 4, !opID !489, !opCode !17, !bitwidth !53, !numUses !8
  %102 = load i32, i32* @dlt, align 4, !opID !490, !opCode !17, !bitwidth !53, !numUses !8
  %add58 = add i32 %101, %102, !opID !491, !opCode !67, !bitwidth !53, !numUses !8
  %103 = sitofp i32 %add58 to double
  call void @profOp(i64 254, i8 11, double %103, i32 32)
  store i32 %add58, i32* @rlt, align 4, !opID !492, !opCode !13, !bitwidth !7, !numUses !7
  %104 = load i32, i32* @rlt1, align 4, !opID !493, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %104, i32* @rlt2, align 4, !opID !494, !opCode !13, !bitwidth !7, !numUses !7
  %105 = load i32, i32* @rlt, align 4, !opID !495, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %105, i32* @rlt1, align 4, !opID !496, !opCode !13, !bitwidth !7, !numUses !7
  %106 = load i32, i32* @plt1, align 4, !opID !497, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %106, i32* @plt2, align 4, !opID !498, !opCode !13, !bitwidth !7, !numUses !7
  %107 = load i32, i32* @plt, align 4, !opID !499, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %107, i32* @plt1, align 4, !opID !500, !opCode !13, !bitwidth !7, !numUses !7
  %call59 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0)), !opID !501, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call59, i32* @szh, align 4, !opID !502, !opCode !13, !bitwidth !7, !numUses !7
  %108 = load i32, i32* @rh1, align 4, !opID !503, !opCode !17, !bitwidth !53, !numUses !8
  %109 = load i32, i32* @ah1, align 4, !opID !504, !opCode !17, !bitwidth !53, !numUses !8
  %110 = load i32, i32* @rh2, align 4, !opID !505, !opCode !17, !bitwidth !53, !numUses !8
  %111 = load i32, i32* @ah2, align 4, !opID !506, !opCode !17, !bitwidth !53, !numUses !8
  %call60 = call i32 @filtep(i32 %108, i32 %109, i32 %110, i32 %111), !opID !507, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call60, i32* @sph, align 4, !opID !508, !opCode !13, !bitwidth !7, !numUses !7
  %112 = load i32, i32* @sph, align 4, !opID !509, !opCode !17, !bitwidth !53, !numUses !8
  %113 = load i32, i32* @szh, align 4, !opID !510, !opCode !17, !bitwidth !53, !numUses !8
  %add61 = add i32 %112, %113, !opID !511, !opCode !67, !bitwidth !53, !numUses !8
  %114 = sitofp i32 %add61 to double
  call void @profOp(i64 274, i8 11, double %114, i32 32)
  store i32 %add61, i32* @sh, align 4, !opID !512, !opCode !13, !bitwidth !7, !numUses !7
  %115 = load i32, i32* @xh, align 4, !opID !513, !opCode !17, !bitwidth !53, !numUses !8
  %116 = load i32, i32* @sh, align 4, !opID !514, !opCode !17, !bitwidth !53, !numUses !8
  %sub62 = sub i32 %115, %116, !opID !515, !opCode !427, !bitwidth !53, !numUses !8
  %117 = sitofp i32 %sub62 to double
  call void @profOp(i64 278, i8 13, double %117, i32 32)
  store i32 %sub62, i32* @eh, align 4, !opID !516, !opCode !13, !bitwidth !7, !numUses !7
  %118 = load i32, i32* @eh, align 4, !opID !517, !opCode !17, !bitwidth !53, !numUses !8
  %cmp63 = icmp sge i32 %118, 0, !opID !518, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp63, label %if.then, label %if.else, !opID !519, !opCode !49, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %for.end37
  store i32 3, i32* @ih, align 4, !opID !520, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !521, !opCode !49, !bitwidth !7, !numUses !7

if.else:                                          ; preds = %for.end37
  store i32 1, i32* @ih, align 4, !opID !522, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !523, !opCode !49, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %if.else, %if.then
  %119 = load i32, i32* @deth, align 4, !opID !524, !opCode !17, !bitwidth !53, !numUses !8
  %conv64 = sext i32 %119 to i64, !opID !525, !opCode !60, !bitwidth !61, !numUses !8
  %mul65 = mul i64 564, %conv64, !opID !526, !opCode !303, !bitwidth !61, !numUses !8
  %120 = sitofp i64 %mul65 to double
  call void @profOp(i64 289, i8 15, double %120, i32 64)
  %shr66 = ashr i64 %mul65, 12, !opID !527, !opCode !420, !bitwidth !61, !numUses !8
  %121 = sitofp i64 %shr66 to double
  call void @profOp(i64 290, i8 25, double %121, i32 64)
  %conv67 = trunc i64 %shr66 to i32, !opID !528, !opCode !422, !bitwidth !53, !numUses !8
  store i32 %conv67, i32* %decis, align 4, !opID !529, !opCode !13, !bitwidth !7, !numUses !7
  %122 = load i32, i32* @eh, align 4, !opID !530, !opCode !17, !bitwidth !53, !numUses !8
  %call68 = call i32 @abs(i32 %122) #9, !opID !531, !opCode !22, !bitwidth !53, !numUses !8
  %123 = load i32, i32* %decis, align 4, !opID !532, !opCode !17, !bitwidth !53, !numUses !8
  %cmp69 = icmp sgt i32 %call68, %123, !opID !533, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp69, label %if.then70, label %if.end71, !opID !534, !opCode !49, !bitwidth !7, !numUses !7

if.then70:                                        ; preds = %if.end
  %124 = load i32, i32* @ih, align 4, !opID !535, !opCode !17, !bitwidth !53, !numUses !8
  %dec = add i32 %124, -1, !opID !536, !opCode !67, !bitwidth !53, !numUses !8
  %125 = sitofp i32 %dec to double
  call void @profOp(i64 299, i8 11, double %125, i32 32)
  store i32 %dec, i32* @ih, align 4, !opID !537, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end71, !opID !538, !opCode !49, !bitwidth !7, !numUses !7

if.end71:                                         ; preds = %if.then70, %if.end
  %126 = load i32, i32* @deth, align 4, !opID !539, !opCode !17, !bitwidth !53, !numUses !8
  %conv72 = sext i32 %126 to i64, !opID !540, !opCode !60, !bitwidth !61, !numUses !8
  %127 = load i32, i32* @ih, align 4, !opID !541, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom73 = sext i32 %127 to i64, !opID !542, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx74 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i64 0, i64 %idxprom73, !opID !543, !opCode !19, !bitwidth !7, !numUses !8
  %128 = load i32, i32* %arrayidx74, align 4, !opID !544, !opCode !17, !bitwidth !53, !numUses !8
  %conv75 = sext i32 %128 to i64, !opID !545, !opCode !60, !bitwidth !61, !numUses !8
  %mul76 = mul i64 %conv72, %conv75, !opID !546, !opCode !303, !bitwidth !61, !numUses !8
  %129 = sitofp i64 %mul76 to double
  call void @profOp(i64 309, i8 15, double %129, i32 64)
  %shr77 = ashr i64 %mul76, 15, !opID !547, !opCode !420, !bitwidth !61, !numUses !8
  %130 = sitofp i64 %shr77 to double
  call void @profOp(i64 310, i8 25, double %130, i32 64)
  %conv78 = trunc i64 %shr77 to i32, !opID !548, !opCode !422, !bitwidth !53, !numUses !8
  store i32 %conv78, i32* @dh, align 4, !opID !549, !opCode !13, !bitwidth !7, !numUses !7
  %131 = load i32, i32* @ih, align 4, !opID !550, !opCode !17, !bitwidth !53, !numUses !8
  %132 = load i32, i32* @nbh, align 4, !opID !551, !opCode !17, !bitwidth !53, !numUses !8
  %call79 = call i32 @logsch(i32 %131, i32 %132), !opID !552, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call79, i32* @nbh, align 4, !opID !553, !opCode !13, !bitwidth !7, !numUses !7
  %133 = load i32, i32* @nbh, align 4, !opID !554, !opCode !17, !bitwidth !53, !numUses !8
  %call80 = call i32 @scalel(i32 %133, i32 10), !opID !555, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call80, i32* @deth, align 4, !opID !556, !opCode !13, !bitwidth !7, !numUses !7
  %134 = load i32, i32* @dh, align 4, !opID !557, !opCode !17, !bitwidth !53, !numUses !8
  %135 = load i32, i32* @szh, align 4, !opID !558, !opCode !17, !bitwidth !53, !numUses !8
  %add81 = add i32 %134, %135, !opID !559, !opCode !67, !bitwidth !53, !numUses !8
  %136 = sitofp i32 %add81 to double
  call void @profOp(i64 322, i8 11, double %136, i32 32)
  store i32 %add81, i32* @ph, align 4, !opID !560, !opCode !13, !bitwidth !7, !numUses !7
  %137 = load i32, i32* @dh, align 4, !opID !561, !opCode !17, !bitwidth !53, !numUses !8
  call void @upzero(i32 %137, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0)), !opID !562, !opCode !22, !bitwidth !7, !numUses !7
  %138 = load i32, i32* @ah1, align 4, !opID !563, !opCode !17, !bitwidth !53, !numUses !8
  %139 = load i32, i32* @ah2, align 4, !opID !564, !opCode !17, !bitwidth !53, !numUses !8
  %140 = load i32, i32* @ph, align 4, !opID !565, !opCode !17, !bitwidth !53, !numUses !8
  %141 = load i32, i32* @ph1, align 4, !opID !566, !opCode !17, !bitwidth !53, !numUses !8
  %142 = load i32, i32* @ph2, align 4, !opID !567, !opCode !17, !bitwidth !53, !numUses !8
  %call82 = call i32 @uppol2(i32 %138, i32 %139, i32 %140, i32 %141, i32 %142), !opID !568, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call82, i32* @ah2, align 4, !opID !569, !opCode !13, !bitwidth !7, !numUses !7
  %143 = load i32, i32* @ah1, align 4, !opID !570, !opCode !17, !bitwidth !53, !numUses !8
  %144 = load i32, i32* @ah2, align 4, !opID !571, !opCode !17, !bitwidth !53, !numUses !8
  %145 = load i32, i32* @ph, align 4, !opID !572, !opCode !17, !bitwidth !53, !numUses !8
  %146 = load i32, i32* @ph1, align 4, !opID !573, !opCode !17, !bitwidth !53, !numUses !8
  %call83 = call i32 @uppol1(i32 %143, i32 %144, i32 %145, i32 %146), !opID !574, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call83, i32* @ah1, align 4, !opID !575, !opCode !13, !bitwidth !7, !numUses !7
  %147 = load i32, i32* @sh, align 4, !opID !576, !opCode !17, !bitwidth !53, !numUses !8
  %148 = load i32, i32* @dh, align 4, !opID !577, !opCode !17, !bitwidth !53, !numUses !8
  %add84 = add i32 %147, %148, !opID !578, !opCode !67, !bitwidth !53, !numUses !8
  %149 = sitofp i32 %add84 to double
  call void @profOp(i64 341, i8 11, double %149, i32 32)
  store i32 %add84, i32* @yh, align 4, !opID !579, !opCode !13, !bitwidth !7, !numUses !7
  %150 = load i32, i32* @rh1, align 4, !opID !580, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %150, i32* @rh2, align 4, !opID !581, !opCode !13, !bitwidth !7, !numUses !7
  %151 = load i32, i32* @yh, align 4, !opID !582, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %151, i32* @rh1, align 4, !opID !583, !opCode !13, !bitwidth !7, !numUses !7
  %152 = load i32, i32* @ph1, align 4, !opID !584, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %152, i32* @ph2, align 4, !opID !585, !opCode !13, !bitwidth !7, !numUses !7
  %153 = load i32, i32* @ph, align 4, !opID !586, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %153, i32* @ph1, align 4, !opID !587, !opCode !13, !bitwidth !7, !numUses !7
  %154 = load i32, i32* @il, align 4, !opID !588, !opCode !17, !bitwidth !53, !numUses !8
  %155 = load i32, i32* @ih, align 4, !opID !589, !opCode !17, !bitwidth !53, !numUses !8
  %shl = shl i32 %155, 6, !opID !590, !opCode !591, !bitwidth !53, !numUses !8
  %156 = sitofp i32 %shl to double
  call void @profOp(i64 353, i8 23, double %156, i32 32)
  %or = or i32 %154, %shl, !opID !592, !opCode !593, !bitwidth !53, !numUses !8
  %157 = sitofp i32 %or to double
  call void @profOp(i64 354, i8 27, double %157, i32 32)
  %158 = bitcast i32* %decis to i8*, !opID !594, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %158) #8, !opID !595, !opCode !22, !bitwidth !7, !numUses !7
  %159 = bitcast i64* %xb to i8*, !opID !596, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %159) #8, !opID !597, !opCode !22, !bitwidth !7, !numUses !7
  %160 = bitcast i64* %xa to i8*, !opID !598, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %160) #8, !opID !599, !opCode !22, !bitwidth !7, !numUses !7
  %161 = bitcast i32** %tqmf_ptr1 to i8*, !opID !600, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %161) #8, !opID !601, !opCode !22, !bitwidth !7, !numUses !7
  %162 = bitcast i32** %tqmf_ptr to i8*, !opID !602, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %162) #8, !opID !603, !opCode !22, !bitwidth !7, !numUses !7
  %163 = bitcast i32** %h_ptr to i8*, !opID !604, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %163) #8, !opID !605, !opCode !22, !bitwidth !7, !numUses !7
  %164 = bitcast i32* %i to i8*, !opID !606, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %164) #8, !opID !607, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %or, !opID !608, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define void @decode(i32 %input) #3 {
entry:
  %input.addr = alloca i32, align 4, !opID !609, !opCode !6, !bitwidth !7, !numUses !11
  %i = alloca i32, align 4, !opID !610, !opCode !6, !bitwidth !7, !numUses !262
  %xa1 = alloca i64, align 8, !opID !611, !opCode !6, !bitwidth !7, !numUses !612
  %xa2 = alloca i64, align 8, !opID !613, !opCode !6, !bitwidth !7, !numUses !612
  %h_ptr = alloca i32*, align 8, !opID !614, !opCode !6, !bitwidth !7, !numUses !264
  %ac_ptr = alloca i32*, align 8, !opID !615, !opCode !6, !bitwidth !7, !numUses !262
  %ac_ptr1 = alloca i32*, align 8, !opID !616, !opCode !6, !bitwidth !7, !numUses !268
  %ad_ptr = alloca i32*, align 8, !opID !617, !opCode !6, !bitwidth !7, !numUses !262
  %ad_ptr1 = alloca i32*, align 8, !opID !618, !opCode !6, !bitwidth !7, !numUses !268
  store i32 %input, i32* %input.addr, align 4, !opID !619, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %i to i8*, !opID !620, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !621, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i64* %xa1 to i8*, !opID !622, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #8, !opID !623, !opCode !22, !bitwidth !7, !numUses !7
  %2 = bitcast i64* %xa2 to i8*, !opID !624, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #8, !opID !625, !opCode !22, !bitwidth !7, !numUses !7
  %3 = bitcast i32** %h_ptr to i8*, !opID !626, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #8, !opID !627, !opCode !22, !bitwidth !7, !numUses !7
  %4 = bitcast i32** %ac_ptr to i8*, !opID !628, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #8, !opID !629, !opCode !22, !bitwidth !7, !numUses !7
  %5 = bitcast i32** %ac_ptr1 to i8*, !opID !630, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #8, !opID !631, !opCode !22, !bitwidth !7, !numUses !7
  %6 = bitcast i32** %ad_ptr to i8*, !opID !632, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #8, !opID !633, !opCode !22, !bitwidth !7, !numUses !7
  %7 = bitcast i32** %ad_ptr1 to i8*, !opID !634, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #8, !opID !635, !opCode !22, !bitwidth !7, !numUses !7
  %8 = load i32, i32* %input.addr, align 4, !opID !636, !opCode !17, !bitwidth !53, !numUses !8
  %and = and i32 %8, 63, !opID !637, !opCode !638, !bitwidth !53, !numUses !8
  %9 = sitofp i32 %and to double
  call void @profOp(i64 947, i8 26, double %9, i32 32)
  store i32 %and, i32* @ilr, align 4, !opID !639, !opCode !13, !bitwidth !7, !numUses !7
  %10 = load i32, i32* %input.addr, align 4, !opID !640, !opCode !17, !bitwidth !53, !numUses !8
  %shr = ashr i32 %10, 6, !opID !641, !opCode !420, !bitwidth !53, !numUses !8
  %11 = sitofp i32 %shr to double
  call void @profOp(i64 950, i8 25, double %11, i32 32)
  store i32 %shr, i32* @ih, align 4, !opID !642, !opCode !13, !bitwidth !7, !numUses !7
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0)), !opID !643, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call, i32* @dec_szl, align 4, !opID !644, !opCode !13, !bitwidth !7, !numUses !7
  %12 = load i32, i32* @dec_rlt1, align 4, !opID !645, !opCode !17, !bitwidth !53, !numUses !8
  %13 = load i32, i32* @dec_al1, align 4, !opID !646, !opCode !17, !bitwidth !53, !numUses !8
  %14 = load i32, i32* @dec_rlt2, align 4, !opID !647, !opCode !17, !bitwidth !53, !numUses !8
  %15 = load i32, i32* @dec_al2, align 4, !opID !648, !opCode !17, !bitwidth !53, !numUses !8
  %call1 = call i32 @filtep(i32 %12, i32 %13, i32 %14, i32 %15), !opID !649, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call1, i32* @dec_spl, align 4, !opID !650, !opCode !13, !bitwidth !7, !numUses !7
  %16 = load i32, i32* @dec_spl, align 4, !opID !651, !opCode !17, !bitwidth !53, !numUses !8
  %17 = load i32, i32* @dec_szl, align 4, !opID !652, !opCode !17, !bitwidth !53, !numUses !8
  %add = add i32 %16, %17, !opID !653, !opCode !67, !bitwidth !53, !numUses !8
  %18 = sitofp i32 %add to double
  call void @profOp(i64 962, i8 11, double %18, i32 32)
  store i32 %add, i32* @dec_sl, align 4, !opID !654, !opCode !13, !bitwidth !7, !numUses !7
  %19 = load i32, i32* @dec_detl, align 4, !opID !655, !opCode !17, !bitwidth !53, !numUses !8
  %conv = sext i32 %19 to i64, !opID !656, !opCode !60, !bitwidth !61, !numUses !8
  %20 = load i32, i32* @ilr, align 4, !opID !657, !opCode !17, !bitwidth !53, !numUses !8
  %shr2 = ashr i32 %20, 2, !opID !658, !opCode !420, !bitwidth !53, !numUses !8
  %21 = sitofp i32 %shr2 to double
  call void @profOp(i64 967, i8 25, double %21, i32 32)
  %idxprom = sext i32 %shr2 to i64, !opID !659, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i64 0, i64 %idxprom, !opID !660, !opCode !19, !bitwidth !7, !numUses !8
  %22 = load i32, i32* %arrayidx, align 4, !opID !661, !opCode !17, !bitwidth !53, !numUses !8
  %conv3 = sext i32 %22 to i64, !opID !662, !opCode !60, !bitwidth !61, !numUses !8
  %mul = mul i64 %conv, %conv3, !opID !663, !opCode !303, !bitwidth !61, !numUses !8
  %23 = sitofp i64 %mul to double
  call void @profOp(i64 972, i8 15, double %23, i32 64)
  %shr4 = ashr i64 %mul, 15, !opID !664, !opCode !420, !bitwidth !61, !numUses !8
  %24 = sitofp i64 %shr4 to double
  call void @profOp(i64 973, i8 25, double %24, i32 64)
  %conv5 = trunc i64 %shr4 to i32, !opID !665, !opCode !422, !bitwidth !53, !numUses !8
  store i32 %conv5, i32* @dec_dlt, align 4, !opID !666, !opCode !13, !bitwidth !7, !numUses !7
  %25 = load i32, i32* @dec_detl, align 4, !opID !667, !opCode !17, !bitwidth !53, !numUses !8
  %conv6 = sext i32 %25 to i64, !opID !668, !opCode !60, !bitwidth !61, !numUses !8
  %26 = load i32, i32* @il, align 4, !opID !669, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom7 = sext i32 %26 to i64, !opID !670, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx8 = getelementptr inbounds [64 x i32], [64 x i32]* @qq6_code6_table, i64 0, i64 %idxprom7, !opID !671, !opCode !19, !bitwidth !7, !numUses !8
  %27 = load i32, i32* %arrayidx8, align 4, !opID !672, !opCode !17, !bitwidth !53, !numUses !8
  %conv9 = sext i32 %27 to i64, !opID !673, !opCode !60, !bitwidth !61, !numUses !8
  %mul10 = mul i64 %conv6, %conv9, !opID !674, !opCode !303, !bitwidth !61, !numUses !8
  %28 = sitofp i64 %mul10 to double
  call void @profOp(i64 983, i8 15, double %28, i32 64)
  %shr11 = ashr i64 %mul10, 15, !opID !675, !opCode !420, !bitwidth !61, !numUses !8
  %29 = sitofp i64 %shr11 to double
  call void @profOp(i64 984, i8 25, double %29, i32 64)
  %conv12 = trunc i64 %shr11 to i32, !opID !676, !opCode !422, !bitwidth !53, !numUses !8
  store i32 %conv12, i32* @dl, align 4, !opID !677, !opCode !13, !bitwidth !7, !numUses !7
  %30 = load i32, i32* @dl, align 4, !opID !678, !opCode !17, !bitwidth !53, !numUses !8
  %31 = load i32, i32* @dec_sl, align 4, !opID !679, !opCode !17, !bitwidth !53, !numUses !8
  %add13 = add i32 %30, %31, !opID !680, !opCode !67, !bitwidth !53, !numUses !8
  %32 = sitofp i32 %add13 to double
  call void @profOp(i64 989, i8 11, double %32, i32 32)
  store i32 %add13, i32* @rl, align 4, !opID !681, !opCode !13, !bitwidth !7, !numUses !7
  %33 = load i32, i32* @ilr, align 4, !opID !682, !opCode !17, !bitwidth !53, !numUses !8
  %34 = load i32, i32* @dec_nbl, align 4, !opID !683, !opCode !17, !bitwidth !53, !numUses !8
  %call14 = call i32 @logscl(i32 %33, i32 %34), !opID !684, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call14, i32* @dec_nbl, align 4, !opID !685, !opCode !13, !bitwidth !7, !numUses !7
  %35 = load i32, i32* @dec_nbl, align 4, !opID !686, !opCode !17, !bitwidth !53, !numUses !8
  %call15 = call i32 @scalel(i32 %35, i32 8), !opID !687, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call15, i32* @dec_detl, align 4, !opID !688, !opCode !13, !bitwidth !7, !numUses !7
  %36 = load i32, i32* @dec_dlt, align 4, !opID !689, !opCode !17, !bitwidth !53, !numUses !8
  %37 = load i32, i32* @dec_szl, align 4, !opID !690, !opCode !17, !bitwidth !53, !numUses !8
  %add16 = add i32 %36, %37, !opID !691, !opCode !67, !bitwidth !53, !numUses !8
  %38 = sitofp i32 %add16 to double
  call void @profOp(i64 1000, i8 11, double %38, i32 32)
  store i32 %add16, i32* @dec_plt, align 4, !opID !692, !opCode !13, !bitwidth !7, !numUses !7
  %39 = load i32, i32* @dec_dlt, align 4, !opID !693, !opCode !17, !bitwidth !53, !numUses !8
  call void @upzero(i32 %39, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0)), !opID !694, !opCode !22, !bitwidth !7, !numUses !7
  %40 = load i32, i32* @dec_al1, align 4, !opID !695, !opCode !17, !bitwidth !53, !numUses !8
  %41 = load i32, i32* @dec_al2, align 4, !opID !696, !opCode !17, !bitwidth !53, !numUses !8
  %42 = load i32, i32* @dec_plt, align 4, !opID !697, !opCode !17, !bitwidth !53, !numUses !8
  %43 = load i32, i32* @dec_plt1, align 4, !opID !698, !opCode !17, !bitwidth !53, !numUses !8
  %44 = load i32, i32* @dec_plt2, align 4, !opID !699, !opCode !17, !bitwidth !53, !numUses !8
  %call17 = call i32 @uppol2(i32 %40, i32 %41, i32 %42, i32 %43, i32 %44), !opID !700, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call17, i32* @dec_al2, align 4, !opID !701, !opCode !13, !bitwidth !7, !numUses !7
  %45 = load i32, i32* @dec_al1, align 4, !opID !702, !opCode !17, !bitwidth !53, !numUses !8
  %46 = load i32, i32* @dec_al2, align 4, !opID !703, !opCode !17, !bitwidth !53, !numUses !8
  %47 = load i32, i32* @dec_plt, align 4, !opID !704, !opCode !17, !bitwidth !53, !numUses !8
  %48 = load i32, i32* @dec_plt1, align 4, !opID !705, !opCode !17, !bitwidth !53, !numUses !8
  %call18 = call i32 @uppol1(i32 %45, i32 %46, i32 %47, i32 %48), !opID !706, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call18, i32* @dec_al1, align 4, !opID !707, !opCode !13, !bitwidth !7, !numUses !7
  %49 = load i32, i32* @dec_sl, align 4, !opID !708, !opCode !17, !bitwidth !53, !numUses !8
  %50 = load i32, i32* @dec_dlt, align 4, !opID !709, !opCode !17, !bitwidth !53, !numUses !8
  %add19 = add i32 %49, %50, !opID !710, !opCode !67, !bitwidth !53, !numUses !8
  %51 = sitofp i32 %add19 to double
  call void @profOp(i64 1019, i8 11, double %51, i32 32)
  store i32 %add19, i32* @dec_rlt, align 4, !opID !711, !opCode !13, !bitwidth !7, !numUses !7
  %52 = load i32, i32* @dec_rlt1, align 4, !opID !712, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %52, i32* @dec_rlt2, align 4, !opID !713, !opCode !13, !bitwidth !7, !numUses !7
  %53 = load i32, i32* @dec_rlt, align 4, !opID !714, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %53, i32* @dec_rlt1, align 4, !opID !715, !opCode !13, !bitwidth !7, !numUses !7
  %54 = load i32, i32* @dec_plt1, align 4, !opID !716, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %54, i32* @dec_plt2, align 4, !opID !717, !opCode !13, !bitwidth !7, !numUses !7
  %55 = load i32, i32* @dec_plt, align 4, !opID !718, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %55, i32* @dec_plt1, align 4, !opID !719, !opCode !13, !bitwidth !7, !numUses !7
  %call20 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0)), !opID !720, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call20, i32* @dec_szh, align 4, !opID !721, !opCode !13, !bitwidth !7, !numUses !7
  %56 = load i32, i32* @dec_rh1, align 4, !opID !722, !opCode !17, !bitwidth !53, !numUses !8
  %57 = load i32, i32* @dec_ah1, align 4, !opID !723, !opCode !17, !bitwidth !53, !numUses !8
  %58 = load i32, i32* @dec_rh2, align 4, !opID !724, !opCode !17, !bitwidth !53, !numUses !8
  %59 = load i32, i32* @dec_ah2, align 4, !opID !725, !opCode !17, !bitwidth !53, !numUses !8
  %call21 = call i32 @filtep(i32 %56, i32 %57, i32 %58, i32 %59), !opID !726, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call21, i32* @dec_sph, align 4, !opID !727, !opCode !13, !bitwidth !7, !numUses !7
  %60 = load i32, i32* @dec_sph, align 4, !opID !728, !opCode !17, !bitwidth !53, !numUses !8
  %61 = load i32, i32* @dec_szh, align 4, !opID !729, !opCode !17, !bitwidth !53, !numUses !8
  %add22 = add i32 %60, %61, !opID !730, !opCode !67, !bitwidth !53, !numUses !8
  %62 = sitofp i32 %add22 to double
  call void @profOp(i64 1039, i8 11, double %62, i32 32)
  store i32 %add22, i32* @dec_sh, align 4, !opID !731, !opCode !13, !bitwidth !7, !numUses !7
  %63 = load i32, i32* @dec_deth, align 4, !opID !732, !opCode !17, !bitwidth !53, !numUses !8
  %conv23 = sext i32 %63 to i64, !opID !733, !opCode !60, !bitwidth !61, !numUses !8
  %64 = load i32, i32* @ih, align 4, !opID !734, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom24 = sext i32 %64 to i64, !opID !735, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx25 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i64 0, i64 %idxprom24, !opID !736, !opCode !19, !bitwidth !7, !numUses !8
  %65 = load i32, i32* %arrayidx25, align 4, !opID !737, !opCode !17, !bitwidth !53, !numUses !8
  %conv26 = sext i32 %65 to i64, !opID !738, !opCode !60, !bitwidth !61, !numUses !8
  %mul27 = mul i64 %conv23, %conv26, !opID !739, !opCode !303, !bitwidth !61, !numUses !8
  %66 = sitofp i64 %mul27 to double
  call void @profOp(i64 1048, i8 15, double %66, i32 64)
  %shr28 = ashr i64 %mul27, 15, !opID !740, !opCode !420, !bitwidth !61, !numUses !8
  %67 = sitofp i64 %shr28 to double
  call void @profOp(i64 1049, i8 25, double %67, i32 64)
  %conv29 = trunc i64 %shr28 to i32, !opID !741, !opCode !422, !bitwidth !53, !numUses !8
  store i32 %conv29, i32* @dec_dh, align 4, !opID !742, !opCode !13, !bitwidth !7, !numUses !7
  %68 = load i32, i32* @ih, align 4, !opID !743, !opCode !17, !bitwidth !53, !numUses !8
  %69 = load i32, i32* @dec_nbh, align 4, !opID !744, !opCode !17, !bitwidth !53, !numUses !8
  %call30 = call i32 @logsch(i32 %68, i32 %69), !opID !745, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call30, i32* @dec_nbh, align 4, !opID !746, !opCode !13, !bitwidth !7, !numUses !7
  %70 = load i32, i32* @dec_nbh, align 4, !opID !747, !opCode !17, !bitwidth !53, !numUses !8
  %call31 = call i32 @scalel(i32 %70, i32 10), !opID !748, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call31, i32* @dec_deth, align 4, !opID !749, !opCode !13, !bitwidth !7, !numUses !7
  %71 = load i32, i32* @dec_dh, align 4, !opID !750, !opCode !17, !bitwidth !53, !numUses !8
  %72 = load i32, i32* @dec_szh, align 4, !opID !751, !opCode !17, !bitwidth !53, !numUses !8
  %add32 = add i32 %71, %72, !opID !752, !opCode !67, !bitwidth !53, !numUses !8
  %73 = sitofp i32 %add32 to double
  call void @profOp(i64 1061, i8 11, double %73, i32 32)
  store i32 %add32, i32* @dec_ph, align 4, !opID !753, !opCode !13, !bitwidth !7, !numUses !7
  %74 = load i32, i32* @dec_dh, align 4, !opID !754, !opCode !17, !bitwidth !53, !numUses !8
  call void @upzero(i32 %74, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0)), !opID !755, !opCode !22, !bitwidth !7, !numUses !7
  %75 = load i32, i32* @dec_ah1, align 4, !opID !756, !opCode !17, !bitwidth !53, !numUses !8
  %76 = load i32, i32* @dec_ah2, align 4, !opID !757, !opCode !17, !bitwidth !53, !numUses !8
  %77 = load i32, i32* @dec_ph, align 4, !opID !758, !opCode !17, !bitwidth !53, !numUses !8
  %78 = load i32, i32* @dec_ph1, align 4, !opID !759, !opCode !17, !bitwidth !53, !numUses !8
  %79 = load i32, i32* @dec_ph2, align 4, !opID !760, !opCode !17, !bitwidth !53, !numUses !8
  %call33 = call i32 @uppol2(i32 %75, i32 %76, i32 %77, i32 %78, i32 %79), !opID !761, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call33, i32* @dec_ah2, align 4, !opID !762, !opCode !13, !bitwidth !7, !numUses !7
  %80 = load i32, i32* @dec_ah1, align 4, !opID !763, !opCode !17, !bitwidth !53, !numUses !8
  %81 = load i32, i32* @dec_ah2, align 4, !opID !764, !opCode !17, !bitwidth !53, !numUses !8
  %82 = load i32, i32* @dec_ph, align 4, !opID !765, !opCode !17, !bitwidth !53, !numUses !8
  %83 = load i32, i32* @dec_ph1, align 4, !opID !766, !opCode !17, !bitwidth !53, !numUses !8
  %call34 = call i32 @uppol1(i32 %80, i32 %81, i32 %82, i32 %83), !opID !767, !opCode !22, !bitwidth !53, !numUses !8
  store i32 %call34, i32* @dec_ah1, align 4, !opID !768, !opCode !13, !bitwidth !7, !numUses !7
  %84 = load i32, i32* @dec_sh, align 4, !opID !769, !opCode !17, !bitwidth !53, !numUses !8
  %85 = load i32, i32* @dec_dh, align 4, !opID !770, !opCode !17, !bitwidth !53, !numUses !8
  %add35 = add i32 %84, %85, !opID !771, !opCode !67, !bitwidth !53, !numUses !8
  %86 = sitofp i32 %add35 to double
  call void @profOp(i64 1080, i8 11, double %86, i32 32)
  store i32 %add35, i32* @rh, align 4, !opID !772, !opCode !13, !bitwidth !7, !numUses !7
  %87 = load i32, i32* @dec_rh1, align 4, !opID !773, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %87, i32* @dec_rh2, align 4, !opID !774, !opCode !13, !bitwidth !7, !numUses !7
  %88 = load i32, i32* @rh, align 4, !opID !775, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %88, i32* @dec_rh1, align 4, !opID !776, !opCode !13, !bitwidth !7, !numUses !7
  %89 = load i32, i32* @dec_ph1, align 4, !opID !777, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %89, i32* @dec_ph2, align 4, !opID !778, !opCode !13, !bitwidth !7, !numUses !7
  %90 = load i32, i32* @dec_ph, align 4, !opID !779, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %90, i32* @dec_ph1, align 4, !opID !780, !opCode !13, !bitwidth !7, !numUses !7
  %91 = load i32, i32* @rl, align 4, !opID !781, !opCode !17, !bitwidth !53, !numUses !8
  %92 = load i32, i32* @rh, align 4, !opID !782, !opCode !17, !bitwidth !53, !numUses !8
  %sub = sub i32 %91, %92, !opID !783, !opCode !427, !bitwidth !53, !numUses !8
  %93 = sitofp i32 %sub to double
  call void @profOp(i64 1092, i8 13, double %93, i32 32)
  store i32 %sub, i32* @xd, align 4, !opID !784, !opCode !13, !bitwidth !7, !numUses !7
  %94 = load i32, i32* @rl, align 4, !opID !785, !opCode !17, !bitwidth !53, !numUses !8
  %95 = load i32, i32* @rh, align 4, !opID !786, !opCode !17, !bitwidth !53, !numUses !8
  %add36 = add i32 %94, %95, !opID !787, !opCode !67, !bitwidth !53, !numUses !8
  %96 = sitofp i32 %add36 to double
  call void @profOp(i64 1096, i8 11, double %96, i32 32)
  store i32 %add36, i32* @xs, align 4, !opID !788, !opCode !13, !bitwidth !7, !numUses !7
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 8, !opID !789, !opCode !13, !bitwidth !7, !numUses !7
  store i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 0), i32** %ac_ptr, align 8, !opID !790, !opCode !13, !bitwidth !7, !numUses !7
  store i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 0), i32** %ad_ptr, align 8, !opID !791, !opCode !13, !bitwidth !7, !numUses !7
  %97 = load i32, i32* @xd, align 4, !opID !792, !opCode !17, !bitwidth !53, !numUses !8
  %conv37 = sext i32 %97 to i64, !opID !793, !opCode !60, !bitwidth !61, !numUses !8
  %98 = load i32*, i32** %h_ptr, align 8, !opID !794, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr = getelementptr inbounds i32, i32* %98, i32 1, !opID !795, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr, i32** %h_ptr, align 8, !opID !796, !opCode !13, !bitwidth !7, !numUses !7
  %99 = load i32, i32* %98, align 4, !opID !797, !opCode !17, !bitwidth !53, !numUses !8
  %conv38 = sext i32 %99 to i64, !opID !798, !opCode !60, !bitwidth !61, !numUses !8
  %mul39 = mul i64 %conv37, %conv38, !opID !799, !opCode !303, !bitwidth !61, !numUses !8
  %100 = sitofp i64 %mul39 to double
  call void @profOp(i64 1108, i8 15, double %100, i32 64)
  store i64 %mul39, i64* %xa1, align 8, !opID !800, !opCode !13, !bitwidth !7, !numUses !7
  %101 = load i32, i32* @xs, align 4, !opID !801, !opCode !17, !bitwidth !53, !numUses !8
  %conv40 = sext i32 %101 to i64, !opID !802, !opCode !60, !bitwidth !61, !numUses !8
  %102 = load i32*, i32** %h_ptr, align 8, !opID !803, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr41 = getelementptr inbounds i32, i32* %102, i32 1, !opID !804, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr41, i32** %h_ptr, align 8, !opID !805, !opCode !13, !bitwidth !7, !numUses !7
  %103 = load i32, i32* %102, align 4, !opID !806, !opCode !17, !bitwidth !53, !numUses !8
  %conv42 = sext i32 %103 to i64, !opID !807, !opCode !60, !bitwidth !61, !numUses !8
  %mul43 = mul i64 %conv40, %conv42, !opID !808, !opCode !303, !bitwidth !61, !numUses !8
  %104 = sitofp i64 %mul43 to double
  call void @profOp(i64 1117, i8 15, double %104, i32 64)
  store i64 %mul43, i64* %xa2, align 8, !opID !809, !opCode !13, !bitwidth !7, !numUses !7
  br label %decode_label2, !opID !810, !opCode !49, !bitwidth !7, !numUses !7

decode_label2:                                    ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !811, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !opID !812, !opCode !49, !bitwidth !7, !numUses !7

for.cond:                                         ; preds = %for.inc, %decode_label2
  %105 = load i32, i32* %i, align 4, !opID !813, !opCode !17, !bitwidth !53, !numUses !8
  %cmp = icmp slt i32 %105, 10, !opID !814, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp, label %for.body, label %for.end, !opID !815, !opCode !49, !bitwidth !7, !numUses !7

for.body:                                         ; preds = %for.cond
  %106 = load i32*, i32** %ac_ptr, align 8, !opID !816, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr44 = getelementptr inbounds i32, i32* %106, i32 1, !opID !817, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr44, i32** %ac_ptr, align 8, !opID !818, !opCode !13, !bitwidth !7, !numUses !7
  %107 = load i32, i32* %106, align 4, !opID !819, !opCode !17, !bitwidth !53, !numUses !8
  %conv45 = sext i32 %107 to i64, !opID !820, !opCode !60, !bitwidth !61, !numUses !8
  %108 = load i32*, i32** %h_ptr, align 8, !opID !821, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr46 = getelementptr inbounds i32, i32* %108, i32 1, !opID !822, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr46, i32** %h_ptr, align 8, !opID !823, !opCode !13, !bitwidth !7, !numUses !7
  %109 = load i32, i32* %108, align 4, !opID !824, !opCode !17, !bitwidth !53, !numUses !8
  %conv47 = sext i32 %109 to i64, !opID !825, !opCode !60, !bitwidth !61, !numUses !8
  %mul48 = mul i64 %conv45, %conv47, !opID !826, !opCode !303, !bitwidth !61, !numUses !8
  %110 = sitofp i64 %mul48 to double
  call void @profOp(i64 1135, i8 15, double %110, i32 64)
  %111 = load i64, i64* %xa1, align 8, !opID !827, !opCode !17, !bitwidth !61, !numUses !8
  %add49 = add i64 %111, %mul48, !opID !828, !opCode !67, !bitwidth !61, !numUses !8
  %112 = sitofp i64 %add49 to double
  call void @profOp(i64 1137, i8 11, double %112, i32 64)
  store i64 %add49, i64* %xa1, align 8, !opID !829, !opCode !13, !bitwidth !7, !numUses !7
  %113 = load i32*, i32** %ad_ptr, align 8, !opID !830, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr50 = getelementptr inbounds i32, i32* %113, i32 1, !opID !831, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr50, i32** %ad_ptr, align 8, !opID !832, !opCode !13, !bitwidth !7, !numUses !7
  %114 = load i32, i32* %113, align 4, !opID !833, !opCode !17, !bitwidth !53, !numUses !8
  %conv51 = sext i32 %114 to i64, !opID !834, !opCode !60, !bitwidth !61, !numUses !8
  %115 = load i32*, i32** %h_ptr, align 8, !opID !835, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr52 = getelementptr inbounds i32, i32* %115, i32 1, !opID !836, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr52, i32** %h_ptr, align 8, !opID !837, !opCode !13, !bitwidth !7, !numUses !7
  %116 = load i32, i32* %115, align 4, !opID !838, !opCode !17, !bitwidth !53, !numUses !8
  %conv53 = sext i32 %116 to i64, !opID !839, !opCode !60, !bitwidth !61, !numUses !8
  %mul54 = mul i64 %conv51, %conv53, !opID !840, !opCode !303, !bitwidth !61, !numUses !8
  %117 = sitofp i64 %mul54 to double
  call void @profOp(i64 1149, i8 15, double %117, i32 64)
  %118 = load i64, i64* %xa2, align 8, !opID !841, !opCode !17, !bitwidth !61, !numUses !8
  %add55 = add i64 %118, %mul54, !opID !842, !opCode !67, !bitwidth !61, !numUses !8
  %119 = sitofp i64 %add55 to double
  call void @profOp(i64 1151, i8 11, double %119, i32 64)
  store i64 %add55, i64* %xa2, align 8, !opID !843, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc, !opID !844, !opCode !49, !bitwidth !7, !numUses !7

for.inc:                                          ; preds = %for.body
  %120 = load i32, i32* %i, align 4, !opID !845, !opCode !17, !bitwidth !53, !numUses !8
  %inc = add i32 %120, 1, !opID !846, !opCode !67, !bitwidth !53, !numUses !8
  %121 = sitofp i32 %inc to double
  call void @profOp(i64 1155, i8 11, double %121, i32 32)
  store i32 %inc, i32* %i, align 4, !opID !847, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !llvm.loop !848, !opID !850, !opCode !49, !bitwidth !7, !numUses !7

for.end:                                          ; preds = %for.cond
  %122 = load i32*, i32** %ac_ptr, align 8, !opID !851, !opCode !17, !bitwidth !7, !numUses !8
  %123 = load i32, i32* %122, align 4, !opID !852, !opCode !17, !bitwidth !53, !numUses !8
  %conv56 = sext i32 %123 to i64, !opID !853, !opCode !60, !bitwidth !61, !numUses !8
  %124 = load i32*, i32** %h_ptr, align 8, !opID !854, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr57 = getelementptr inbounds i32, i32* %124, i32 1, !opID !855, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr57, i32** %h_ptr, align 8, !opID !856, !opCode !13, !bitwidth !7, !numUses !7
  %125 = load i32, i32* %124, align 4, !opID !857, !opCode !17, !bitwidth !53, !numUses !8
  %conv58 = sext i32 %125 to i64, !opID !858, !opCode !60, !bitwidth !61, !numUses !8
  %mul59 = mul i64 %conv56, %conv58, !opID !859, !opCode !303, !bitwidth !61, !numUses !8
  %126 = sitofp i64 %mul59 to double
  call void @profOp(i64 1166, i8 15, double %126, i32 64)
  %127 = load i64, i64* %xa1, align 8, !opID !860, !opCode !17, !bitwidth !61, !numUses !8
  %add60 = add i64 %127, %mul59, !opID !861, !opCode !67, !bitwidth !61, !numUses !8
  %128 = sitofp i64 %add60 to double
  call void @profOp(i64 1168, i8 11, double %128, i32 64)
  store i64 %add60, i64* %xa1, align 8, !opID !862, !opCode !13, !bitwidth !7, !numUses !7
  %129 = load i32*, i32** %ad_ptr, align 8, !opID !863, !opCode !17, !bitwidth !7, !numUses !8
  %130 = load i32, i32* %129, align 4, !opID !864, !opCode !17, !bitwidth !53, !numUses !8
  %conv61 = sext i32 %130 to i64, !opID !865, !opCode !60, !bitwidth !61, !numUses !8
  %131 = load i32*, i32** %h_ptr, align 8, !opID !866, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr62 = getelementptr inbounds i32, i32* %131, i32 1, !opID !867, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr62, i32** %h_ptr, align 8, !opID !868, !opCode !13, !bitwidth !7, !numUses !7
  %132 = load i32, i32* %131, align 4, !opID !869, !opCode !17, !bitwidth !53, !numUses !8
  %conv63 = sext i32 %132 to i64, !opID !870, !opCode !60, !bitwidth !61, !numUses !8
  %mul64 = mul i64 %conv61, %conv63, !opID !871, !opCode !303, !bitwidth !61, !numUses !8
  %133 = sitofp i64 %mul64 to double
  call void @profOp(i64 1178, i8 15, double %133, i32 64)
  %134 = load i64, i64* %xa2, align 8, !opID !872, !opCode !17, !bitwidth !61, !numUses !8
  %add65 = add i64 %134, %mul64, !opID !873, !opCode !67, !bitwidth !61, !numUses !8
  %135 = sitofp i64 %add65 to double
  call void @profOp(i64 1180, i8 11, double %135, i32 64)
  store i64 %add65, i64* %xa2, align 8, !opID !874, !opCode !13, !bitwidth !7, !numUses !7
  %136 = load i64, i64* %xa1, align 8, !opID !875, !opCode !17, !bitwidth !61, !numUses !8
  %shr66 = ashr i64 %136, 14, !opID !876, !opCode !420, !bitwidth !61, !numUses !8
  %137 = sitofp i64 %shr66 to double
  call void @profOp(i64 1183, i8 25, double %137, i32 64)
  %conv67 = trunc i64 %shr66 to i32, !opID !877, !opCode !422, !bitwidth !53, !numUses !8
  store i32 %conv67, i32* @xout1, align 4, !opID !878, !opCode !13, !bitwidth !7, !numUses !7
  %138 = load i64, i64* %xa2, align 8, !opID !879, !opCode !17, !bitwidth !61, !numUses !8
  %shr68 = ashr i64 %138, 14, !opID !880, !opCode !420, !bitwidth !61, !numUses !8
  %139 = sitofp i64 %shr68 to double
  call void @profOp(i64 1187, i8 25, double %139, i32 64)
  %conv69 = trunc i64 %shr68 to i32, !opID !881, !opCode !422, !bitwidth !53, !numUses !8
  store i32 %conv69, i32* @xout2, align 4, !opID !882, !opCode !13, !bitwidth !7, !numUses !7
  %140 = load i32*, i32** %ac_ptr, align 8, !opID !883, !opCode !17, !bitwidth !7, !numUses !8
  %add.ptr = getelementptr inbounds i32, i32* %140, i64 -1, !opID !884, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %add.ptr, i32** %ac_ptr1, align 8, !opID !885, !opCode !13, !bitwidth !7, !numUses !7
  %141 = load i32*, i32** %ad_ptr, align 8, !opID !886, !opCode !17, !bitwidth !7, !numUses !8
  %add.ptr70 = getelementptr inbounds i32, i32* %141, i64 -1, !opID !887, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %add.ptr70, i32** %ad_ptr1, align 8, !opID !888, !opCode !13, !bitwidth !7, !numUses !7
  br label %decode_label3, !opID !889, !opCode !49, !bitwidth !7, !numUses !7

decode_label3:                                    ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !890, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond71, !opID !891, !opCode !49, !bitwidth !7, !numUses !7

for.cond71:                                       ; preds = %for.inc78, %decode_label3
  %142 = load i32, i32* %i, align 4, !opID !892, !opCode !17, !bitwidth !53, !numUses !8
  %cmp72 = icmp slt i32 %142, 10, !opID !893, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp72, label %for.body73, label %for.end80, !opID !894, !opCode !49, !bitwidth !7, !numUses !7

for.body73:                                       ; preds = %for.cond71
  %143 = load i32*, i32** %ac_ptr1, align 8, !opID !895, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr74 = getelementptr inbounds i32, i32* %143, i32 -1, !opID !896, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr74, i32** %ac_ptr1, align 8, !opID !897, !opCode !13, !bitwidth !7, !numUses !7
  %144 = load i32, i32* %143, align 4, !opID !898, !opCode !17, !bitwidth !53, !numUses !8
  %145 = load i32*, i32** %ac_ptr, align 8, !opID !899, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr75 = getelementptr inbounds i32, i32* %145, i32 -1, !opID !900, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr75, i32** %ac_ptr, align 8, !opID !901, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %144, i32* %145, align 4, !opID !902, !opCode !13, !bitwidth !7, !numUses !7
  %146 = load i32*, i32** %ad_ptr1, align 8, !opID !903, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr76 = getelementptr inbounds i32, i32* %146, i32 -1, !opID !904, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr76, i32** %ad_ptr1, align 8, !opID !905, !opCode !13, !bitwidth !7, !numUses !7
  %147 = load i32, i32* %146, align 4, !opID !906, !opCode !17, !bitwidth !53, !numUses !8
  %148 = load i32*, i32** %ad_ptr, align 8, !opID !907, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr77 = getelementptr inbounds i32, i32* %148, i32 -1, !opID !908, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr77, i32** %ad_ptr, align 8, !opID !909, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %147, i32* %148, align 4, !opID !910, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc78, !opID !911, !opCode !49, !bitwidth !7, !numUses !7

for.inc78:                                        ; preds = %for.body73
  %149 = load i32, i32* %i, align 4, !opID !912, !opCode !17, !bitwidth !53, !numUses !8
  %inc79 = add i32 %149, 1, !opID !913, !opCode !67, !bitwidth !53, !numUses !8
  %150 = sitofp i32 %inc79 to double
  call void @profOp(i64 1220, i8 11, double %150, i32 32)
  store i32 %inc79, i32* %i, align 4, !opID !914, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond71, !llvm.loop !915, !opID !917, !opCode !49, !bitwidth !7, !numUses !7

for.end80:                                        ; preds = %for.cond71
  %151 = load i32, i32* @xd, align 4, !opID !918, !opCode !17, !bitwidth !53, !numUses !8
  %152 = load i32*, i32** %ac_ptr, align 8, !opID !919, !opCode !17, !bitwidth !7, !numUses !8
  store i32 %151, i32* %152, align 4, !opID !920, !opCode !13, !bitwidth !7, !numUses !7
  %153 = load i32, i32* @xs, align 4, !opID !921, !opCode !17, !bitwidth !53, !numUses !8
  %154 = load i32*, i32** %ad_ptr, align 8, !opID !922, !opCode !17, !bitwidth !7, !numUses !8
  store i32 %153, i32* %154, align 4, !opID !923, !opCode !13, !bitwidth !7, !numUses !7
  %155 = bitcast i32** %ad_ptr1 to i8*, !opID !924, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %155) #8, !opID !925, !opCode !22, !bitwidth !7, !numUses !7
  %156 = bitcast i32** %ad_ptr to i8*, !opID !926, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %156) #8, !opID !927, !opCode !22, !bitwidth !7, !numUses !7
  %157 = bitcast i32** %ac_ptr1 to i8*, !opID !928, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %157) #8, !opID !929, !opCode !22, !bitwidth !7, !numUses !7
  %158 = bitcast i32** %ac_ptr to i8*, !opID !930, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %158) #8, !opID !931, !opCode !22, !bitwidth !7, !numUses !7
  %159 = bitcast i32** %h_ptr to i8*, !opID !932, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %159) #8, !opID !933, !opCode !22, !bitwidth !7, !numUses !7
  %160 = bitcast i64* %xa2 to i8*, !opID !934, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %160) #8, !opID !935, !opCode !22, !bitwidth !7, !numUses !7
  %161 = bitcast i64* %xa1 to i8*, !opID !936, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %161) #8, !opID !937, !opCode !22, !bitwidth !7, !numUses !7
  %162 = bitcast i32* %i to i8*, !opID !938, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %162) #8, !opID !939, !opCode !22, !bitwidth !7, !numUses !7
  ret void, !opID !940, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
define i32 @filtez(i32* %bpl, i32* %dlt) #3 {
entry:
  %bpl.addr = alloca i32*, align 8, !opID !941, !opCode !6, !bitwidth !7, !numUses !268
  %dlt.addr = alloca i32*, align 8, !opID !942, !opCode !6, !bitwidth !7, !numUses !268
  %i = alloca i32, align 4, !opID !943, !opCode !6, !bitwidth !7, !numUses !944
  %zl = alloca i64, align 8, !opID !945, !opCode !6, !bitwidth !7, !numUses !944
  store i32* %bpl, i32** %bpl.addr, align 8, !opID !946, !opCode !13, !bitwidth !7, !numUses !7
  store i32* %dlt, i32** %dlt.addr, align 8, !opID !947, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %i to i8*, !opID !948, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !949, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i64* %zl to i8*, !opID !950, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #8, !opID !951, !opCode !22, !bitwidth !7, !numUses !7
  %2 = load i32*, i32** %bpl.addr, align 8, !opID !952, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr = getelementptr inbounds i32, i32* %2, i32 1, !opID !953, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr, i32** %bpl.addr, align 8, !opID !954, !opCode !13, !bitwidth !7, !numUses !7
  %3 = load i32, i32* %2, align 4, !opID !955, !opCode !17, !bitwidth !53, !numUses !8
  %conv = sext i32 %3 to i64, !opID !956, !opCode !60, !bitwidth !61, !numUses !8
  %4 = load i32*, i32** %dlt.addr, align 8, !opID !957, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr1 = getelementptr inbounds i32, i32* %4, i32 1, !opID !958, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr1, i32** %dlt.addr, align 8, !opID !959, !opCode !13, !bitwidth !7, !numUses !7
  %5 = load i32, i32* %4, align 4, !opID !960, !opCode !17, !bitwidth !53, !numUses !8
  %conv2 = sext i32 %5 to i64, !opID !961, !opCode !60, !bitwidth !61, !numUses !8
  %mul = mul i64 %conv, %conv2, !opID !962, !opCode !303, !bitwidth !61, !numUses !8
  %6 = sitofp i64 %mul to double
  call void @profOp(i64 390, i8 15, double %6, i32 64)
  store i64 %mul, i64* %zl, align 8, !opID !963, !opCode !13, !bitwidth !7, !numUses !7
  br label %filtez_label8, !opID !964, !opCode !49, !bitwidth !7, !numUses !7

filtez_label8:                                    ; preds = %entry
  store i32 1, i32* %i, align 4, !opID !965, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !opID !966, !opCode !49, !bitwidth !7, !numUses !7

for.cond:                                         ; preds = %for.inc, %filtez_label8
  %7 = load i32, i32* %i, align 4, !opID !967, !opCode !17, !bitwidth !53, !numUses !8
  %cmp = icmp slt i32 %7, 6, !opID !968, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp, label %for.body, label %for.end, !opID !969, !opCode !49, !bitwidth !7, !numUses !7

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %bpl.addr, align 8, !opID !970, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr3 = getelementptr inbounds i32, i32* %8, i32 1, !opID !971, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr3, i32** %bpl.addr, align 8, !opID !972, !opCode !13, !bitwidth !7, !numUses !7
  %9 = load i32, i32* %8, align 4, !opID !973, !opCode !17, !bitwidth !53, !numUses !8
  %conv4 = sext i32 %9 to i64, !opID !974, !opCode !60, !bitwidth !61, !numUses !8
  %10 = load i32*, i32** %dlt.addr, align 8, !opID !975, !opCode !17, !bitwidth !7, !numUses !259
  %incdec.ptr5 = getelementptr inbounds i32, i32* %10, i32 1, !opID !976, !opCode !19, !bitwidth !7, !numUses !8
  store i32* %incdec.ptr5, i32** %dlt.addr, align 8, !opID !977, !opCode !13, !bitwidth !7, !numUses !7
  %11 = load i32, i32* %10, align 4, !opID !978, !opCode !17, !bitwidth !53, !numUses !8
  %conv6 = sext i32 %11 to i64, !opID !979, !opCode !60, !bitwidth !61, !numUses !8
  %mul7 = mul i64 %conv4, %conv6, !opID !980, !opCode !303, !bitwidth !61, !numUses !8
  %12 = sitofp i64 %mul7 to double
  call void @profOp(i64 408, i8 15, double %12, i32 64)
  %13 = load i64, i64* %zl, align 8, !opID !981, !opCode !17, !bitwidth !61, !numUses !8
  %add = add i64 %13, %mul7, !opID !982, !opCode !67, !bitwidth !61, !numUses !8
  %14 = sitofp i64 %add to double
  call void @profOp(i64 410, i8 11, double %14, i32 64)
  store i64 %add, i64* %zl, align 8, !opID !983, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc, !opID !984, !opCode !49, !bitwidth !7, !numUses !7

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !opID !985, !opCode !17, !bitwidth !53, !numUses !8
  %inc = add i32 %15, 1, !opID !986, !opCode !67, !bitwidth !53, !numUses !8
  %16 = sitofp i32 %inc to double
  call void @profOp(i64 414, i8 11, double %16, i32 32)
  store i32 %inc, i32* %i, align 4, !opID !987, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !llvm.loop !988, !opID !990, !opCode !49, !bitwidth !7, !numUses !7

for.end:                                          ; preds = %for.cond
  %17 = load i64, i64* %zl, align 8, !opID !991, !opCode !17, !bitwidth !61, !numUses !8
  %shr = ashr i64 %17, 14, !opID !992, !opCode !420, !bitwidth !61, !numUses !8
  %18 = sitofp i64 %shr to double
  call void @profOp(i64 418, i8 25, double %18, i32 64)
  %conv8 = trunc i64 %shr to i32, !opID !993, !opCode !422, !bitwidth !53, !numUses !8
  %19 = bitcast i64* %zl to i8*, !opID !994, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #8, !opID !995, !opCode !22, !bitwidth !7, !numUses !7
  %20 = bitcast i32* %i to i8*, !opID !996, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #8, !opID !997, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %conv8, !opID !998, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @filtep(i32 %rlt1, i32 %al1, i32 %rlt2, i32 %al2) #3 {
entry:
  %rlt1.addr = alloca i32, align 4, !opID !999, !opCode !6, !bitwidth !7, !numUses !259
  %al1.addr = alloca i32, align 4, !opID !1000, !opCode !6, !bitwidth !7, !numUses !259
  %rlt2.addr = alloca i32, align 4, !opID !1001, !opCode !6, !bitwidth !7, !numUses !259
  %al2.addr = alloca i32, align 4, !opID !1002, !opCode !6, !bitwidth !7, !numUses !259
  %pl = alloca i64, align 8, !opID !1003, !opCode !6, !bitwidth !7, !numUses !612
  %pl2 = alloca i64, align 8, !opID !1004, !opCode !6, !bitwidth !7, !numUses !273
  store i32 %rlt1, i32* %rlt1.addr, align 4, !opID !1005, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %al1, i32* %al1.addr, align 4, !opID !1006, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %rlt2, i32* %rlt2.addr, align 4, !opID !1007, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %al2, i32* %al2.addr, align 4, !opID !1008, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i64* %pl to i8*, !opID !1009, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #8, !opID !1010, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i64* %pl2 to i8*, !opID !1011, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #8, !opID !1012, !opCode !22, !bitwidth !7, !numUses !7
  %2 = load i32, i32* %rlt1.addr, align 4, !opID !1013, !opCode !17, !bitwidth !53, !numUses !8
  %mul = mul i32 2, %2, !opID !1014, !opCode !303, !bitwidth !53, !numUses !8
  %3 = sitofp i32 %mul to double
  call void @profOp(i64 440, i8 15, double %3, i32 32)
  %conv = sext i32 %mul to i64, !opID !1015, !opCode !60, !bitwidth !61, !numUses !8
  store i64 %conv, i64* %pl, align 8, !opID !1016, !opCode !13, !bitwidth !7, !numUses !7
  %4 = load i32, i32* %al1.addr, align 4, !opID !1017, !opCode !17, !bitwidth !53, !numUses !8
  %conv1 = sext i32 %4 to i64, !opID !1018, !opCode !60, !bitwidth !61, !numUses !8
  %5 = load i64, i64* %pl, align 8, !opID !1019, !opCode !17, !bitwidth !61, !numUses !8
  %mul2 = mul i64 %conv1, %5, !opID !1020, !opCode !303, !bitwidth !61, !numUses !8
  %6 = sitofp i64 %mul2 to double
  call void @profOp(i64 446, i8 15, double %6, i32 64)
  store i64 %mul2, i64* %pl, align 8, !opID !1021, !opCode !13, !bitwidth !7, !numUses !7
  %7 = load i32, i32* %rlt2.addr, align 4, !opID !1022, !opCode !17, !bitwidth !53, !numUses !8
  %mul3 = mul i32 2, %7, !opID !1023, !opCode !303, !bitwidth !53, !numUses !8
  %8 = sitofp i32 %mul3 to double
  call void @profOp(i64 449, i8 15, double %8, i32 32)
  %conv4 = sext i32 %mul3 to i64, !opID !1024, !opCode !60, !bitwidth !61, !numUses !8
  store i64 %conv4, i64* %pl2, align 8, !opID !1025, !opCode !13, !bitwidth !7, !numUses !7
  %9 = load i32, i32* %al2.addr, align 4, !opID !1026, !opCode !17, !bitwidth !53, !numUses !8
  %conv5 = sext i32 %9 to i64, !opID !1027, !opCode !60, !bitwidth !61, !numUses !8
  %10 = load i64, i64* %pl2, align 8, !opID !1028, !opCode !17, !bitwidth !61, !numUses !8
  %mul6 = mul i64 %conv5, %10, !opID !1029, !opCode !303, !bitwidth !61, !numUses !8
  %11 = sitofp i64 %mul6 to double
  call void @profOp(i64 455, i8 15, double %11, i32 64)
  %12 = load i64, i64* %pl, align 8, !opID !1030, !opCode !17, !bitwidth !61, !numUses !8
  %add = add i64 %12, %mul6, !opID !1031, !opCode !67, !bitwidth !61, !numUses !8
  %13 = sitofp i64 %add to double
  call void @profOp(i64 457, i8 11, double %13, i32 64)
  store i64 %add, i64* %pl, align 8, !opID !1032, !opCode !13, !bitwidth !7, !numUses !7
  %14 = load i64, i64* %pl, align 8, !opID !1033, !opCode !17, !bitwidth !61, !numUses !8
  %shr = ashr i64 %14, 15, !opID !1034, !opCode !420, !bitwidth !61, !numUses !8
  %15 = sitofp i64 %shr to double
  call void @profOp(i64 460, i8 25, double %15, i32 64)
  %conv7 = trunc i64 %shr to i32, !opID !1035, !opCode !422, !bitwidth !53, !numUses !8
  %16 = bitcast i64* %pl2 to i8*, !opID !1036, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %16) #8, !opID !1037, !opCode !22, !bitwidth !7, !numUses !7
  %17 = bitcast i64* %pl to i8*, !opID !1038, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %17) #8, !opID !1039, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %conv7, !opID !1040, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @logscl(i32 %il, i32 %nbl) #3 {
entry:
  %il.addr = alloca i32, align 4, !opID !1041, !opCode !6, !bitwidth !7, !numUses !259
  %nbl.addr = alloca i32, align 4, !opID !1042, !opCode !6, !bitwidth !7, !numUses !612
  %wd = alloca i64, align 8, !opID !1043, !opCode !6, !bitwidth !7, !numUses !273
  store i32 %il, i32* %il.addr, align 4, !opID !1044, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %nbl, i32* %nbl.addr, align 4, !opID !1045, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i64* %wd to i8*, !opID !1046, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #8, !opID !1047, !opCode !22, !bitwidth !7, !numUses !7
  %1 = load i32, i32* %nbl.addr, align 4, !opID !1048, !opCode !17, !bitwidth !53, !numUses !8
  %conv = sext i32 %1 to i64, !opID !1049, !opCode !60, !bitwidth !61, !numUses !8
  %mul = mul i64 %conv, 127, !opID !1050, !opCode !303, !bitwidth !61, !numUses !8
  %2 = sitofp i64 %mul to double
  call void @profOp(i64 547, i8 15, double %2, i32 64)
  %shr = ashr i64 %mul, 7, !opID !1051, !opCode !420, !bitwidth !61, !numUses !8
  %3 = sitofp i64 %shr to double
  call void @profOp(i64 548, i8 25, double %3, i32 64)
  store i64 %shr, i64* %wd, align 8, !opID !1052, !opCode !13, !bitwidth !7, !numUses !7
  %4 = load i64, i64* %wd, align 8, !opID !1053, !opCode !17, !bitwidth !61, !numUses !8
  %conv1 = trunc i64 %4 to i32, !opID !1054, !opCode !422, !bitwidth !53, !numUses !8
  %5 = load i32, i32* %il.addr, align 4, !opID !1055, !opCode !17, !bitwidth !53, !numUses !8
  %shr2 = ashr i32 %5, 2, !opID !1056, !opCode !420, !bitwidth !53, !numUses !8
  %6 = sitofp i32 %shr2 to double
  call void @profOp(i64 553, i8 25, double %6, i32 32)
  %idxprom = sext i32 %shr2 to i64, !opID !1057, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @wl_code_table, i64 0, i64 %idxprom, !opID !1058, !opCode !19, !bitwidth !7, !numUses !8
  %7 = load i32, i32* %arrayidx, align 4, !opID !1059, !opCode !17, !bitwidth !53, !numUses !8
  %add = add i32 %conv1, %7, !opID !1060, !opCode !67, !bitwidth !53, !numUses !8
  %8 = sitofp i32 %add to double
  call void @profOp(i64 557, i8 11, double %8, i32 32)
  store i32 %add, i32* %nbl.addr, align 4, !opID !1061, !opCode !13, !bitwidth !7, !numUses !7
  %9 = load i32, i32* %nbl.addr, align 4, !opID !1062, !opCode !17, !bitwidth !53, !numUses !8
  %cmp = icmp slt i32 %9, 0, !opID !1063, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp, label %if.then, label %if.end, !opID !1064, !opCode !49, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %entry
  store i32 0, i32* %nbl.addr, align 4, !opID !1065, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !1066, !opCode !49, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %if.then, %entry
  %10 = load i32, i32* %nbl.addr, align 4, !opID !1067, !opCode !17, !bitwidth !53, !numUses !8
  %cmp3 = icmp sgt i32 %10, 18432, !opID !1068, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp3, label %if.then4, label %if.end5, !opID !1069, !opCode !49, !bitwidth !7, !numUses !7

if.then4:                                         ; preds = %if.end
  store i32 18432, i32* %nbl.addr, align 4, !opID !1070, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end5, !opID !1071, !opCode !49, !bitwidth !7, !numUses !7

if.end5:                                          ; preds = %if.then4, %if.end
  %11 = load i32, i32* %nbl.addr, align 4, !opID !1072, !opCode !17, !bitwidth !53, !numUses !8
  %12 = bitcast i64* %wd to i8*, !opID !1073, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %12) #8, !opID !1074, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %11, !opID !1075, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @scalel(i32 %nbl, i32 %shift_constant) #3 {
entry:
  %nbl.addr = alloca i32, align 4, !opID !1076, !opCode !6, !bitwidth !7, !numUses !11
  %shift_constant.addr = alloca i32, align 4, !opID !1077, !opCode !6, !bitwidth !7, !numUses !259
  %wd1 = alloca i32, align 4, !opID !1078, !opCode !6, !bitwidth !7, !numUses !273
  %wd2 = alloca i32, align 4, !opID !1079, !opCode !6, !bitwidth !7, !numUses !273
  %wd3 = alloca i32, align 4, !opID !1080, !opCode !6, !bitwidth !7, !numUses !273
  store i32 %nbl, i32* %nbl.addr, align 4, !opID !1081, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %shift_constant, i32* %shift_constant.addr, align 4, !opID !1082, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %wd1 to i8*, !opID !1083, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !1084, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i32* %wd2 to i8*, !opID !1085, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #8, !opID !1086, !opCode !22, !bitwidth !7, !numUses !7
  %2 = bitcast i32* %wd3 to i8*, !opID !1087, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #8, !opID !1088, !opCode !22, !bitwidth !7, !numUses !7
  %3 = load i32, i32* %nbl.addr, align 4, !opID !1089, !opCode !17, !bitwidth !53, !numUses !8
  %shr = ashr i32 %3, 6, !opID !1090, !opCode !420, !bitwidth !53, !numUses !8
  %4 = sitofp i32 %shr to double
  call void @profOp(i64 587, i8 25, double %4, i32 32)
  %and = and i32 %shr, 31, !opID !1091, !opCode !638, !bitwidth !53, !numUses !8
  %5 = sitofp i32 %and to double
  call void @profOp(i64 588, i8 26, double %5, i32 32)
  store i32 %and, i32* %wd1, align 4, !opID !1092, !opCode !13, !bitwidth !7, !numUses !7
  %6 = load i32, i32* %nbl.addr, align 4, !opID !1093, !opCode !17, !bitwidth !53, !numUses !8
  %shr1 = ashr i32 %6, 11, !opID !1094, !opCode !420, !bitwidth !53, !numUses !8
  %7 = sitofp i32 %shr1 to double
  call void @profOp(i64 591, i8 25, double %7, i32 32)
  store i32 %shr1, i32* %wd2, align 4, !opID !1095, !opCode !13, !bitwidth !7, !numUses !7
  %8 = load i32, i32* %wd1, align 4, !opID !1096, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom = sext i32 %8 to i64, !opID !1097, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx = getelementptr inbounds [32 x i32], [32 x i32]* @ilb_table, i64 0, i64 %idxprom, !opID !1098, !opCode !19, !bitwidth !7, !numUses !8
  %9 = load i32, i32* %arrayidx, align 4, !opID !1099, !opCode !17, !bitwidth !53, !numUses !8
  %10 = load i32, i32* %shift_constant.addr, align 4, !opID !1100, !opCode !17, !bitwidth !53, !numUses !8
  %add = add i32 %10, 1, !opID !1101, !opCode !67, !bitwidth !53, !numUses !8
  %11 = sitofp i32 %add to double
  call void @profOp(i64 598, i8 11, double %11, i32 32)
  %12 = load i32, i32* %wd2, align 4, !opID !1102, !opCode !17, !bitwidth !53, !numUses !8
  %sub = sub i32 %add, %12, !opID !1103, !opCode !427, !bitwidth !53, !numUses !8
  %13 = sitofp i32 %sub to double
  call void @profOp(i64 600, i8 13, double %13, i32 32)
  %shr2 = ashr i32 %9, %sub, !opID !1104, !opCode !420, !bitwidth !53, !numUses !8
  %14 = sitofp i32 %shr2 to double
  call void @profOp(i64 601, i8 25, double %14, i32 32)
  store i32 %shr2, i32* %wd3, align 4, !opID !1105, !opCode !13, !bitwidth !7, !numUses !7
  %15 = load i32, i32* %wd3, align 4, !opID !1106, !opCode !17, !bitwidth !53, !numUses !8
  %shl = shl i32 %15, 3, !opID !1107, !opCode !591, !bitwidth !53, !numUses !8
  %16 = sitofp i32 %shl to double
  call void @profOp(i64 604, i8 23, double %16, i32 32)
  %17 = bitcast i32* %wd3 to i8*, !opID !1108, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #8, !opID !1109, !opCode !22, !bitwidth !7, !numUses !7
  %18 = bitcast i32* %wd2 to i8*, !opID !1110, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #8, !opID !1111, !opCode !22, !bitwidth !7, !numUses !7
  %19 = bitcast i32* %wd1 to i8*, !opID !1112, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %19) #8, !opID !1113, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %shl, !opID !1114, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define void @upzero(i32 %dlt, i32* %dlti, i32* %bli) #3 {
entry:
  %dlt.addr = alloca i32, align 4, !opID !1115, !opCode !6, !bitwidth !7, !numUses !273
  %dlti.addr = alloca i32*, align 8, !opID !1116, !opCode !6, !bitwidth !7, !numUses !1117
  %bli.addr = alloca i32*, align 8, !opID !1118, !opCode !6, !bitwidth !7, !numUses !268
  %i = alloca i32, align 4, !opID !1119, !opCode !6, !bitwidth !7, !numUses !264
  %wd2 = alloca i32, align 4, !opID !1120, !opCode !6, !bitwidth !7, !numUses !268
  %wd3 = alloca i32, align 4, !opID !1121, !opCode !6, !bitwidth !7, !numUses !273
  store i32 %dlt, i32* %dlt.addr, align 4, !opID !1122, !opCode !13, !bitwidth !7, !numUses !7
  store i32* %dlti, i32** %dlti.addr, align 8, !opID !1123, !opCode !13, !bitwidth !7, !numUses !7
  store i32* %bli, i32** %bli.addr, align 8, !opID !1124, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %i to i8*, !opID !1125, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !1126, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i32* %wd2 to i8*, !opID !1127, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #8, !opID !1128, !opCode !22, !bitwidth !7, !numUses !7
  %2 = bitcast i32* %wd3 to i8*, !opID !1129, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #8, !opID !1130, !opCode !22, !bitwidth !7, !numUses !7
  %3 = load i32, i32* %dlt.addr, align 4, !opID !1131, !opCode !17, !bitwidth !53, !numUses !8
  %cmp = icmp eq i32 %3, 0, !opID !1132, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp, label %if.then, label %if.else, !opID !1133, !opCode !49, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %entry
  br label %upzero_label10, !opID !1134, !opCode !49, !bitwidth !7, !numUses !7

upzero_label10:                                   ; preds = %if.then
  store i32 0, i32* %i, align 4, !opID !1135, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !opID !1136, !opCode !49, !bitwidth !7, !numUses !7

for.cond:                                         ; preds = %for.inc, %upzero_label10
  %4 = load i32, i32* %i, align 4, !opID !1137, !opCode !17, !bitwidth !53, !numUses !8
  %cmp1 = icmp slt i32 %4, 6, !opID !1138, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp1, label %for.body, label %for.end, !opID !1139, !opCode !49, !bitwidth !7, !numUses !7

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %bli.addr, align 8, !opID !1140, !opCode !17, !bitwidth !7, !numUses !8
  %6 = load i32, i32* %i, align 4, !opID !1141, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom = sext i32 %6 to i64, !opID !1142, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !opID !1143, !opCode !19, !bitwidth !7, !numUses !8
  %7 = load i32, i32* %arrayidx, align 4, !opID !1144, !opCode !17, !bitwidth !53, !numUses !8
  %conv = sext i32 %7 to i64, !opID !1145, !opCode !60, !bitwidth !61, !numUses !8
  %mul = mul i64 255, %conv, !opID !1146, !opCode !303, !bitwidth !61, !numUses !8
  %8 = sitofp i64 %mul to double
  call void @profOp(i64 642, i8 15, double %8, i32 64)
  %shr = ashr i64 %mul, 8, !opID !1147, !opCode !420, !bitwidth !61, !numUses !8
  %9 = sitofp i64 %shr to double
  call void @profOp(i64 643, i8 25, double %9, i32 64)
  %conv2 = trunc i64 %shr to i32, !opID !1148, !opCode !422, !bitwidth !53, !numUses !8
  %10 = load i32*, i32** %bli.addr, align 8, !opID !1149, !opCode !17, !bitwidth !7, !numUses !8
  %11 = load i32, i32* %i, align 4, !opID !1150, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom3 = sext i32 %11 to i64, !opID !1151, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx4 = getelementptr inbounds i32, i32* %10, i64 %idxprom3, !opID !1152, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %conv2, i32* %arrayidx4, align 4, !opID !1153, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc, !opID !1154, !opCode !49, !bitwidth !7, !numUses !7

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !opID !1155, !opCode !17, !bitwidth !53, !numUses !8
  %inc = add i32 %12, 1, !opID !1156, !opCode !67, !bitwidth !53, !numUses !8
  %13 = sitofp i32 %inc to double
  call void @profOp(i64 652, i8 11, double %13, i32 32)
  store i32 %inc, i32* %i, align 4, !opID !1157, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !llvm.loop !1158, !opID !1160, !opCode !49, !bitwidth !7, !numUses !7

for.end:                                          ; preds = %for.cond
  br label %if.end27, !opID !1161, !opCode !49, !bitwidth !7, !numUses !7

if.else:                                          ; preds = %entry
  br label %upzero_label11, !opID !1162, !opCode !49, !bitwidth !7, !numUses !7

upzero_label11:                                   ; preds = %if.else
  store i32 0, i32* %i, align 4, !opID !1163, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond5, !opID !1164, !opCode !49, !bitwidth !7, !numUses !7

for.cond5:                                        ; preds = %for.inc24, %upzero_label11
  %14 = load i32, i32* %i, align 4, !opID !1165, !opCode !17, !bitwidth !53, !numUses !8
  %cmp6 = icmp slt i32 %14, 6, !opID !1166, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp6, label %for.body7, label %for.end26, !opID !1167, !opCode !49, !bitwidth !7, !numUses !7

for.body7:                                        ; preds = %for.cond5
  %15 = load i32, i32* %dlt.addr, align 4, !opID !1168, !opCode !17, !bitwidth !53, !numUses !8
  %conv8 = sext i32 %15 to i64, !opID !1169, !opCode !60, !bitwidth !61, !numUses !8
  %16 = load i32*, i32** %dlti.addr, align 8, !opID !1170, !opCode !17, !bitwidth !7, !numUses !8
  %17 = load i32, i32* %i, align 4, !opID !1171, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom9 = sext i32 %17 to i64, !opID !1172, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx10 = getelementptr inbounds i32, i32* %16, i64 %idxprom9, !opID !1173, !opCode !19, !bitwidth !7, !numUses !8
  %18 = load i32, i32* %arrayidx10, align 4, !opID !1174, !opCode !17, !bitwidth !53, !numUses !8
  %conv11 = sext i32 %18 to i64, !opID !1175, !opCode !60, !bitwidth !61, !numUses !8
  %mul12 = mul i64 %conv8, %conv11, !opID !1176, !opCode !303, !bitwidth !61, !numUses !8
  %19 = sitofp i64 %mul12 to double
  call void @profOp(i64 670, i8 15, double %19, i32 64)
  %cmp13 = icmp sge i64 %mul12, 0, !opID !1177, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp13, label %if.then14, label %if.else15, !opID !1178, !opCode !49, !bitwidth !7, !numUses !7

if.then14:                                        ; preds = %for.body7
  store i32 128, i32* %wd2, align 4, !opID !1179, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !1180, !opCode !49, !bitwidth !7, !numUses !7

if.else15:                                        ; preds = %for.body7
  store i32 -128, i32* %wd2, align 4, !opID !1181, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !1182, !opCode !49, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %if.else15, %if.then14
  %20 = load i32*, i32** %bli.addr, align 8, !opID !1183, !opCode !17, !bitwidth !7, !numUses !8
  %21 = load i32, i32* %i, align 4, !opID !1184, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom16 = sext i32 %21 to i64, !opID !1185, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx17 = getelementptr inbounds i32, i32* %20, i64 %idxprom16, !opID !1186, !opCode !19, !bitwidth !7, !numUses !8
  %22 = load i32, i32* %arrayidx17, align 4, !opID !1187, !opCode !17, !bitwidth !53, !numUses !8
  %conv18 = sext i32 %22 to i64, !opID !1188, !opCode !60, !bitwidth !61, !numUses !8
  %mul19 = mul i64 255, %conv18, !opID !1189, !opCode !303, !bitwidth !61, !numUses !8
  %23 = sitofp i64 %mul19 to double
  call void @profOp(i64 683, i8 15, double %23, i32 64)
  %shr20 = ashr i64 %mul19, 8, !opID !1190, !opCode !420, !bitwidth !61, !numUses !8
  %24 = sitofp i64 %shr20 to double
  call void @profOp(i64 684, i8 25, double %24, i32 64)
  %conv21 = trunc i64 %shr20 to i32, !opID !1191, !opCode !422, !bitwidth !53, !numUses !8
  store i32 %conv21, i32* %wd3, align 4, !opID !1192, !opCode !13, !bitwidth !7, !numUses !7
  %25 = load i32, i32* %wd2, align 4, !opID !1193, !opCode !17, !bitwidth !53, !numUses !8
  %26 = load i32, i32* %wd3, align 4, !opID !1194, !opCode !17, !bitwidth !53, !numUses !8
  %add = add i32 %25, %26, !opID !1195, !opCode !67, !bitwidth !53, !numUses !8
  %27 = sitofp i32 %add to double
  call void @profOp(i64 689, i8 11, double %27, i32 32)
  %28 = load i32*, i32** %bli.addr, align 8, !opID !1196, !opCode !17, !bitwidth !7, !numUses !8
  %29 = load i32, i32* %i, align 4, !opID !1197, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom22 = sext i32 %29 to i64, !opID !1198, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx23 = getelementptr inbounds i32, i32* %28, i64 %idxprom22, !opID !1199, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %add, i32* %arrayidx23, align 4, !opID !1200, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.inc24, !opID !1201, !opCode !49, !bitwidth !7, !numUses !7

for.inc24:                                        ; preds = %if.end
  %30 = load i32, i32* %i, align 4, !opID !1202, !opCode !17, !bitwidth !53, !numUses !8
  %inc25 = add i32 %30, 1, !opID !1203, !opCode !67, !bitwidth !53, !numUses !8
  %31 = sitofp i32 %inc25 to double
  call void @profOp(i64 697, i8 11, double %31, i32 32)
  store i32 %inc25, i32* %i, align 4, !opID !1204, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond5, !llvm.loop !1205, !opID !1207, !opCode !49, !bitwidth !7, !numUses !7

for.end26:                                        ; preds = %for.cond5
  br label %if.end27, !opID !1208, !opCode !49, !bitwidth !7, !numUses !7

if.end27:                                         ; preds = %for.end26, %for.end
  %32 = load i32*, i32** %dlti.addr, align 8, !opID !1209, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx28 = getelementptr inbounds i32, i32* %32, i64 4, !opID !1210, !opCode !19, !bitwidth !7, !numUses !8
  %33 = load i32, i32* %arrayidx28, align 4, !opID !1211, !opCode !17, !bitwidth !53, !numUses !8
  %34 = load i32*, i32** %dlti.addr, align 8, !opID !1212, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx29 = getelementptr inbounds i32, i32* %34, i64 5, !opID !1213, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %33, i32* %arrayidx29, align 4, !opID !1214, !opCode !13, !bitwidth !7, !numUses !7
  %35 = load i32*, i32** %dlti.addr, align 8, !opID !1215, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx30 = getelementptr inbounds i32, i32* %35, i64 3, !opID !1216, !opCode !19, !bitwidth !7, !numUses !8
  %36 = load i32, i32* %arrayidx30, align 4, !opID !1217, !opCode !17, !bitwidth !53, !numUses !8
  %37 = load i32*, i32** %dlti.addr, align 8, !opID !1218, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx31 = getelementptr inbounds i32, i32* %37, i64 4, !opID !1219, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %36, i32* %arrayidx31, align 4, !opID !1220, !opCode !13, !bitwidth !7, !numUses !7
  %38 = load i32*, i32** %dlti.addr, align 8, !opID !1221, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx32 = getelementptr inbounds i32, i32* %38, i64 2, !opID !1222, !opCode !19, !bitwidth !7, !numUses !8
  %39 = load i32, i32* %arrayidx32, align 4, !opID !1223, !opCode !17, !bitwidth !53, !numUses !8
  %40 = load i32*, i32** %dlti.addr, align 8, !opID !1224, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx33 = getelementptr inbounds i32, i32* %40, i64 3, !opID !1225, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %39, i32* %arrayidx33, align 4, !opID !1226, !opCode !13, !bitwidth !7, !numUses !7
  %41 = load i32*, i32** %dlti.addr, align 8, !opID !1227, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx34 = getelementptr inbounds i32, i32* %41, i64 1, !opID !1228, !opCode !19, !bitwidth !7, !numUses !8
  %42 = load i32, i32* %arrayidx34, align 4, !opID !1229, !opCode !17, !bitwidth !53, !numUses !8
  %43 = load i32*, i32** %dlti.addr, align 8, !opID !1230, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx35 = getelementptr inbounds i32, i32* %43, i64 2, !opID !1231, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %42, i32* %arrayidx35, align 4, !opID !1232, !opCode !13, !bitwidth !7, !numUses !7
  %44 = load i32*, i32** %dlti.addr, align 8, !opID !1233, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx36 = getelementptr inbounds i32, i32* %44, i64 0, !opID !1234, !opCode !19, !bitwidth !7, !numUses !8
  %45 = load i32, i32* %arrayidx36, align 4, !opID !1235, !opCode !17, !bitwidth !53, !numUses !8
  %46 = load i32*, i32** %dlti.addr, align 8, !opID !1236, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx37 = getelementptr inbounds i32, i32* %46, i64 1, !opID !1237, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %45, i32* %arrayidx37, align 4, !opID !1238, !opCode !13, !bitwidth !7, !numUses !7
  %47 = load i32, i32* %dlt.addr, align 4, !opID !1239, !opCode !17, !bitwidth !53, !numUses !8
  %48 = load i32*, i32** %dlti.addr, align 8, !opID !1240, !opCode !17, !bitwidth !7, !numUses !8
  %arrayidx38 = getelementptr inbounds i32, i32* %48, i64 0, !opID !1241, !opCode !19, !bitwidth !7, !numUses !8
  store i32 %47, i32* %arrayidx38, align 4, !opID !1242, !opCode !13, !bitwidth !7, !numUses !7
  %49 = bitcast i32* %wd3 to i8*, !opID !1243, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %49) #8, !opID !1244, !opCode !22, !bitwidth !7, !numUses !7
  %50 = bitcast i32* %wd2 to i8*, !opID !1245, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %50) #8, !opID !1246, !opCode !22, !bitwidth !7, !numUses !7
  %51 = bitcast i32* %i to i8*, !opID !1247, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %51) #8, !opID !1248, !opCode !22, !bitwidth !7, !numUses !7
  ret void, !opID !1249, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @uppol2(i32 %al1, i32 %al2, i32 %plt, i32 %plt1, i32 %plt2) #3 {
entry:
  %al1.addr = alloca i32, align 4, !opID !1250, !opCode !6, !bitwidth !7, !numUses !259
  %al2.addr = alloca i32, align 4, !opID !1251, !opCode !6, !bitwidth !7, !numUses !259
  %plt.addr = alloca i32, align 4, !opID !1252, !opCode !6, !bitwidth !7, !numUses !11
  %plt1.addr = alloca i32, align 4, !opID !1253, !opCode !6, !bitwidth !7, !numUses !259
  %plt2.addr = alloca i32, align 4, !opID !1254, !opCode !6, !bitwidth !7, !numUses !259
  %wd2 = alloca i64, align 8, !opID !1255, !opCode !6, !bitwidth !7, !numUses !270
  %wd4 = alloca i64, align 8, !opID !1256, !opCode !6, !bitwidth !7, !numUses !268
  %apl2 = alloca i32, align 4, !opID !1257, !opCode !6, !bitwidth !7, !numUses !612
  store i32 %al1, i32* %al1.addr, align 4, !opID !1258, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %al2, i32* %al2.addr, align 4, !opID !1259, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %plt, i32* %plt.addr, align 4, !opID !1260, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %plt1, i32* %plt1.addr, align 4, !opID !1261, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %plt2, i32* %plt2.addr, align 4, !opID !1262, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i64* %wd2 to i8*, !opID !1263, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #8, !opID !1264, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i64* %wd4 to i8*, !opID !1265, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #8, !opID !1266, !opCode !22, !bitwidth !7, !numUses !7
  %2 = bitcast i32* %apl2 to i8*, !opID !1267, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #8, !opID !1268, !opCode !22, !bitwidth !7, !numUses !7
  %3 = load i32, i32* %al1.addr, align 4, !opID !1269, !opCode !17, !bitwidth !53, !numUses !8
  %conv = sext i32 %3 to i64, !opID !1270, !opCode !60, !bitwidth !61, !numUses !8
  %mul = mul i64 4, %conv, !opID !1271, !opCode !303, !bitwidth !61, !numUses !8
  %4 = sitofp i64 %mul to double
  call void @profOp(i64 763, i8 15, double %4, i32 64)
  store i64 %mul, i64* %wd2, align 8, !opID !1272, !opCode !13, !bitwidth !7, !numUses !7
  %5 = load i32, i32* %plt.addr, align 4, !opID !1273, !opCode !17, !bitwidth !53, !numUses !8
  %conv1 = sext i32 %5 to i64, !opID !1274, !opCode !60, !bitwidth !61, !numUses !8
  %6 = load i32, i32* %plt1.addr, align 4, !opID !1275, !opCode !17, !bitwidth !53, !numUses !8
  %conv2 = sext i32 %6 to i64, !opID !1276, !opCode !60, !bitwidth !61, !numUses !8
  %mul3 = mul i64 %conv1, %conv2, !opID !1277, !opCode !303, !bitwidth !61, !numUses !8
  %7 = sitofp i64 %mul3 to double
  call void @profOp(i64 769, i8 15, double %7, i32 64)
  %cmp = icmp sge i64 %mul3, 0, !opID !1278, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp, label %if.then, label %if.end, !opID !1279, !opCode !49, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %entry
  %8 = load i64, i64* %wd2, align 8, !opID !1280, !opCode !17, !bitwidth !61, !numUses !8
  %sub = sub i64 0, %8, !opID !1281, !opCode !427, !bitwidth !61, !numUses !8
  %9 = sitofp i64 %sub to double
  call void @profOp(i64 773, i8 13, double %9, i32 64)
  store i64 %sub, i64* %wd2, align 8, !opID !1282, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !1283, !opCode !49, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %if.then, %entry
  %10 = load i64, i64* %wd2, align 8, !opID !1284, !opCode !17, !bitwidth !61, !numUses !8
  %shr = ashr i64 %10, 7, !opID !1285, !opCode !420, !bitwidth !61, !numUses !8
  %11 = sitofp i64 %shr to double
  call void @profOp(i64 777, i8 25, double %11, i32 64)
  store i64 %shr, i64* %wd2, align 8, !opID !1286, !opCode !13, !bitwidth !7, !numUses !7
  %12 = load i32, i32* %plt.addr, align 4, !opID !1287, !opCode !17, !bitwidth !53, !numUses !8
  %conv4 = sext i32 %12 to i64, !opID !1288, !opCode !60, !bitwidth !61, !numUses !8
  %13 = load i32, i32* %plt2.addr, align 4, !opID !1289, !opCode !17, !bitwidth !53, !numUses !8
  %conv5 = sext i32 %13 to i64, !opID !1290, !opCode !60, !bitwidth !61, !numUses !8
  %mul6 = mul i64 %conv4, %conv5, !opID !1291, !opCode !303, !bitwidth !61, !numUses !8
  %14 = sitofp i64 %mul6 to double
  call void @profOp(i64 783, i8 15, double %14, i32 64)
  %cmp7 = icmp sge i64 %mul6, 0, !opID !1292, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp7, label %if.then8, label %if.else, !opID !1293, !opCode !49, !bitwidth !7, !numUses !7

if.then8:                                         ; preds = %if.end
  %15 = load i64, i64* %wd2, align 8, !opID !1294, !opCode !17, !bitwidth !61, !numUses !8
  %add = add i64 %15, 128, !opID !1295, !opCode !67, !bitwidth !61, !numUses !8
  %16 = sitofp i64 %add to double
  call void @profOp(i64 787, i8 11, double %16, i32 64)
  store i64 %add, i64* %wd4, align 8, !opID !1296, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end10, !opID !1297, !opCode !49, !bitwidth !7, !numUses !7

if.else:                                          ; preds = %if.end
  %17 = load i64, i64* %wd2, align 8, !opID !1298, !opCode !17, !bitwidth !61, !numUses !8
  %sub9 = sub i64 %17, 128, !opID !1299, !opCode !427, !bitwidth !61, !numUses !8
  %18 = sitofp i64 %sub9 to double
  call void @profOp(i64 791, i8 13, double %18, i32 64)
  store i64 %sub9, i64* %wd4, align 8, !opID !1300, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end10, !opID !1301, !opCode !49, !bitwidth !7, !numUses !7

if.end10:                                         ; preds = %if.else, %if.then8
  %19 = load i64, i64* %wd4, align 8, !opID !1302, !opCode !17, !bitwidth !61, !numUses !8
  %20 = load i32, i32* %al2.addr, align 4, !opID !1303, !opCode !17, !bitwidth !53, !numUses !8
  %conv11 = sext i32 %20 to i64, !opID !1304, !opCode !60, !bitwidth !61, !numUses !8
  %mul12 = mul i64 127, %conv11, !opID !1305, !opCode !303, !bitwidth !61, !numUses !8
  %21 = sitofp i64 %mul12 to double
  call void @profOp(i64 797, i8 15, double %21, i32 64)
  %shr13 = ashr i64 %mul12, 7, !opID !1306, !opCode !420, !bitwidth !61, !numUses !8
  %22 = sitofp i64 %shr13 to double
  call void @profOp(i64 798, i8 25, double %22, i32 64)
  %add14 = add i64 %19, %shr13, !opID !1307, !opCode !67, !bitwidth !61, !numUses !8
  %23 = sitofp i64 %add14 to double
  call void @profOp(i64 799, i8 11, double %23, i32 64)
  %conv15 = trunc i64 %add14 to i32, !opID !1308, !opCode !422, !bitwidth !53, !numUses !8
  store i32 %conv15, i32* %apl2, align 4, !opID !1309, !opCode !13, !bitwidth !7, !numUses !7
  %24 = load i32, i32* %apl2, align 4, !opID !1310, !opCode !17, !bitwidth !53, !numUses !8
  %cmp16 = icmp sgt i32 %24, 12288, !opID !1311, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp16, label %if.then17, label %if.end18, !opID !1312, !opCode !49, !bitwidth !7, !numUses !7

if.then17:                                        ; preds = %if.end10
  store i32 12288, i32* %apl2, align 4, !opID !1313, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end18, !opID !1314, !opCode !49, !bitwidth !7, !numUses !7

if.end18:                                         ; preds = %if.then17, %if.end10
  %25 = load i32, i32* %apl2, align 4, !opID !1315, !opCode !17, !bitwidth !53, !numUses !8
  %cmp19 = icmp slt i32 %25, -12288, !opID !1316, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp19, label %if.then20, label %if.end21, !opID !1317, !opCode !49, !bitwidth !7, !numUses !7

if.then20:                                        ; preds = %if.end18
  store i32 -12288, i32* %apl2, align 4, !opID !1318, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end21, !opID !1319, !opCode !49, !bitwidth !7, !numUses !7

if.end21:                                         ; preds = %if.then20, %if.end18
  %26 = load i32, i32* %apl2, align 4, !opID !1320, !opCode !17, !bitwidth !53, !numUses !8
  %27 = bitcast i32* %apl2 to i8*, !opID !1321, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %27) #8, !opID !1322, !opCode !22, !bitwidth !7, !numUses !7
  %28 = bitcast i64* %wd4 to i8*, !opID !1323, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %28) #8, !opID !1324, !opCode !22, !bitwidth !7, !numUses !7
  %29 = bitcast i64* %wd2 to i8*, !opID !1325, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %29) #8, !opID !1326, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %26, !opID !1327, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @uppol1(i32 %al1, i32 %apl2, i32 %plt, i32 %plt1) #3 {
entry:
  %al1.addr = alloca i32, align 4, !opID !1328, !opCode !6, !bitwidth !7, !numUses !259
  %apl2.addr = alloca i32, align 4, !opID !1329, !opCode !6, !bitwidth !7, !numUses !259
  %plt.addr = alloca i32, align 4, !opID !1330, !opCode !6, !bitwidth !7, !numUses !259
  %plt1.addr = alloca i32, align 4, !opID !1331, !opCode !6, !bitwidth !7, !numUses !259
  %wd2 = alloca i64, align 8, !opID !1332, !opCode !6, !bitwidth !7, !numUses !268
  %wd3 = alloca i32, align 4, !opID !1333, !opCode !6, !bitwidth !7, !numUses !1334
  %apl1 = alloca i32, align 4, !opID !1335, !opCode !6, !bitwidth !7, !numUses !270
  store i32 %al1, i32* %al1.addr, align 4, !opID !1336, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %apl2, i32* %apl2.addr, align 4, !opID !1337, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %plt, i32* %plt.addr, align 4, !opID !1338, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %plt1, i32* %plt1.addr, align 4, !opID !1339, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i64* %wd2 to i8*, !opID !1340, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #8, !opID !1341, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i32* %wd3 to i8*, !opID !1342, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #8, !opID !1343, !opCode !22, !bitwidth !7, !numUses !7
  %2 = bitcast i32* %apl1 to i8*, !opID !1344, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #8, !opID !1345, !opCode !22, !bitwidth !7, !numUses !7
  %3 = load i32, i32* %al1.addr, align 4, !opID !1346, !opCode !17, !bitwidth !53, !numUses !8
  %conv = sext i32 %3 to i64, !opID !1347, !opCode !60, !bitwidth !61, !numUses !8
  %mul = mul i64 %conv, 255, !opID !1348, !opCode !303, !bitwidth !61, !numUses !8
  %4 = sitofp i64 %mul to double
  call void @profOp(i64 839, i8 15, double %4, i32 64)
  %shr = ashr i64 %mul, 8, !opID !1349, !opCode !420, !bitwidth !61, !numUses !8
  %5 = sitofp i64 %shr to double
  call void @profOp(i64 840, i8 25, double %5, i32 64)
  store i64 %shr, i64* %wd2, align 8, !opID !1350, !opCode !13, !bitwidth !7, !numUses !7
  %6 = load i32, i32* %plt.addr, align 4, !opID !1351, !opCode !17, !bitwidth !53, !numUses !8
  %conv1 = sext i32 %6 to i64, !opID !1352, !opCode !60, !bitwidth !61, !numUses !8
  %7 = load i32, i32* %plt1.addr, align 4, !opID !1353, !opCode !17, !bitwidth !53, !numUses !8
  %conv2 = sext i32 %7 to i64, !opID !1354, !opCode !60, !bitwidth !61, !numUses !8
  %mul3 = mul i64 %conv1, %conv2, !opID !1355, !opCode !303, !bitwidth !61, !numUses !8
  %8 = sitofp i64 %mul3 to double
  call void @profOp(i64 846, i8 15, double %8, i32 64)
  %cmp = icmp sge i64 %mul3, 0, !opID !1356, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp, label %if.then, label %if.else, !opID !1357, !opCode !49, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %entry
  %9 = load i64, i64* %wd2, align 8, !opID !1358, !opCode !17, !bitwidth !61, !numUses !8
  %conv4 = trunc i64 %9 to i32, !opID !1359, !opCode !422, !bitwidth !53, !numUses !8
  %add = add i32 %conv4, 192, !opID !1360, !opCode !67, !bitwidth !53, !numUses !8
  %10 = sitofp i32 %add to double
  call void @profOp(i64 851, i8 11, double %10, i32 32)
  store i32 %add, i32* %apl1, align 4, !opID !1361, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !1362, !opCode !49, !bitwidth !7, !numUses !7

if.else:                                          ; preds = %entry
  %11 = load i64, i64* %wd2, align 8, !opID !1363, !opCode !17, !bitwidth !61, !numUses !8
  %conv5 = trunc i64 %11 to i32, !opID !1364, !opCode !422, !bitwidth !53, !numUses !8
  %sub = sub i32 %conv5, 192, !opID !1365, !opCode !427, !bitwidth !53, !numUses !8
  %12 = sitofp i32 %sub to double
  call void @profOp(i64 856, i8 13, double %12, i32 32)
  store i32 %sub, i32* %apl1, align 4, !opID !1366, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !1367, !opCode !49, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %if.else, %if.then
  %13 = load i32, i32* %apl2.addr, align 4, !opID !1368, !opCode !17, !bitwidth !53, !numUses !8
  %sub6 = sub i32 15360, %13, !opID !1369, !opCode !427, !bitwidth !53, !numUses !8
  %14 = sitofp i32 %sub6 to double
  call void @profOp(i64 860, i8 13, double %14, i32 32)
  store i32 %sub6, i32* %wd3, align 4, !opID !1370, !opCode !13, !bitwidth !7, !numUses !7
  %15 = load i32, i32* %apl1, align 4, !opID !1371, !opCode !17, !bitwidth !53, !numUses !8
  %16 = load i32, i32* %wd3, align 4, !opID !1372, !opCode !17, !bitwidth !53, !numUses !8
  %cmp7 = icmp sgt i32 %15, %16, !opID !1373, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp7, label %if.then8, label %if.end9, !opID !1374, !opCode !49, !bitwidth !7, !numUses !7

if.then8:                                         ; preds = %if.end
  %17 = load i32, i32* %wd3, align 4, !opID !1375, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %17, i32* %apl1, align 4, !opID !1376, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end9, !opID !1377, !opCode !49, !bitwidth !7, !numUses !7

if.end9:                                          ; preds = %if.then8, %if.end
  %18 = load i32, i32* %apl1, align 4, !opID !1378, !opCode !17, !bitwidth !53, !numUses !8
  %19 = load i32, i32* %wd3, align 4, !opID !1379, !opCode !17, !bitwidth !53, !numUses !8
  %sub10 = sub i32 0, %19, !opID !1380, !opCode !427, !bitwidth !53, !numUses !8
  %20 = sitofp i32 %sub10 to double
  call void @profOp(i64 871, i8 13, double %20, i32 32)
  %cmp11 = icmp slt i32 %18, %sub10, !opID !1381, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp11, label %if.then12, label %if.end14, !opID !1382, !opCode !49, !bitwidth !7, !numUses !7

if.then12:                                        ; preds = %if.end9
  %21 = load i32, i32* %wd3, align 4, !opID !1383, !opCode !17, !bitwidth !53, !numUses !8
  %sub13 = sub i32 0, %21, !opID !1384, !opCode !427, !bitwidth !53, !numUses !8
  %22 = sitofp i32 %sub13 to double
  call void @profOp(i64 875, i8 13, double %22, i32 32)
  store i32 %sub13, i32* %apl1, align 4, !opID !1385, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end14, !opID !1386, !opCode !49, !bitwidth !7, !numUses !7

if.end14:                                         ; preds = %if.then12, %if.end9
  %23 = load i32, i32* %apl1, align 4, !opID !1387, !opCode !17, !bitwidth !53, !numUses !8
  %24 = bitcast i32* %apl1 to i8*, !opID !1388, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %24) #8, !opID !1389, !opCode !22, !bitwidth !7, !numUses !7
  %25 = bitcast i32* %wd3 to i8*, !opID !1390, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %25) #8, !opID !1391, !opCode !22, !bitwidth !7, !numUses !7
  %26 = bitcast i64* %wd2 to i8*, !opID !1392, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %26) #8, !opID !1393, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %23, !opID !1394, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @logsch(i32 %ih, i32 %nbh) #3 {
entry:
  %ih.addr = alloca i32, align 4, !opID !1395, !opCode !6, !bitwidth !7, !numUses !259
  %nbh.addr = alloca i32, align 4, !opID !1396, !opCode !6, !bitwidth !7, !numUses !612
  %wd = alloca i32, align 4, !opID !1397, !opCode !6, !bitwidth !7, !numUses !273
  store i32 %ih, i32* %ih.addr, align 4, !opID !1398, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %nbh, i32* %nbh.addr, align 4, !opID !1399, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %wd to i8*, !opID !1400, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !1401, !opCode !22, !bitwidth !7, !numUses !7
  %1 = load i32, i32* %nbh.addr, align 4, !opID !1402, !opCode !17, !bitwidth !53, !numUses !8
  %conv = sext i32 %1 to i64, !opID !1403, !opCode !60, !bitwidth !61, !numUses !8
  %mul = mul i64 %conv, 127, !opID !1404, !opCode !303, !bitwidth !61, !numUses !8
  %2 = sitofp i64 %mul to double
  call void @profOp(i64 895, i8 15, double %2, i32 64)
  %shr = ashr i64 %mul, 7, !opID !1405, !opCode !420, !bitwidth !61, !numUses !8
  %3 = sitofp i64 %shr to double
  call void @profOp(i64 896, i8 25, double %3, i32 64)
  %conv1 = trunc i64 %shr to i32, !opID !1406, !opCode !422, !bitwidth !53, !numUses !8
  store i32 %conv1, i32* %wd, align 4, !opID !1407, !opCode !13, !bitwidth !7, !numUses !7
  %4 = load i32, i32* %wd, align 4, !opID !1408, !opCode !17, !bitwidth !53, !numUses !8
  %5 = load i32, i32* %ih.addr, align 4, !opID !1409, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom = sext i32 %5 to i64, !opID !1410, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @wh_code_table, i64 0, i64 %idxprom, !opID !1411, !opCode !19, !bitwidth !7, !numUses !8
  %6 = load i32, i32* %arrayidx, align 4, !opID !1412, !opCode !17, !bitwidth !53, !numUses !8
  %add = add i32 %4, %6, !opID !1413, !opCode !67, !bitwidth !53, !numUses !8
  %7 = sitofp i32 %add to double
  call void @profOp(i64 904, i8 11, double %7, i32 32)
  store i32 %add, i32* %nbh.addr, align 4, !opID !1414, !opCode !13, !bitwidth !7, !numUses !7
  %8 = load i32, i32* %nbh.addr, align 4, !opID !1415, !opCode !17, !bitwidth !53, !numUses !8
  %cmp = icmp slt i32 %8, 0, !opID !1416, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp, label %if.then, label %if.end, !opID !1417, !opCode !49, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %entry
  store i32 0, i32* %nbh.addr, align 4, !opID !1418, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !1419, !opCode !49, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %if.then, %entry
  %9 = load i32, i32* %nbh.addr, align 4, !opID !1420, !opCode !17, !bitwidth !53, !numUses !8
  %cmp2 = icmp sgt i32 %9, 22528, !opID !1421, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp2, label %if.then3, label %if.end4, !opID !1422, !opCode !49, !bitwidth !7, !numUses !7

if.then3:                                         ; preds = %if.end
  store i32 22528, i32* %nbh.addr, align 4, !opID !1423, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end4, !opID !1424, !opCode !49, !bitwidth !7, !numUses !7

if.end4:                                          ; preds = %if.then3, %if.end
  %10 = load i32, i32* %nbh.addr, align 4, !opID !1425, !opCode !17, !bitwidth !53, !numUses !8
  %11 = bitcast i32* %wd to i8*, !opID !1426, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %11) #8, !opID !1427, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %10, !opID !1428, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind
define i32 @quantl(i32 %el, i32 %detl) #3 {
entry:
  %el.addr = alloca i32, align 4, !opID !1429, !opCode !6, !bitwidth !7, !numUses !11
  %detl.addr = alloca i32, align 4, !opID !1430, !opCode !6, !bitwidth !7, !numUses !259
  %ril = alloca i32, align 4, !opID !1431, !opCode !6, !bitwidth !7, !numUses !268
  %mil = alloca i32, align 4, !opID !1432, !opCode !6, !bitwidth !7, !numUses !270
  %wd = alloca i64, align 8, !opID !1433, !opCode !6, !bitwidth !7, !numUses !273
  %decis = alloca i64, align 8, !opID !1434, !opCode !6, !bitwidth !7, !numUses !273
  store i32 %el, i32* %el.addr, align 4, !opID !1435, !opCode !13, !bitwidth !7, !numUses !7
  store i32 %detl, i32* %detl.addr, align 4, !opID !1436, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %ril to i8*, !opID !1437, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !1438, !opCode !22, !bitwidth !7, !numUses !7
  %1 = bitcast i32* %mil to i8*, !opID !1439, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #8, !opID !1440, !opCode !22, !bitwidth !7, !numUses !7
  %2 = bitcast i64* %wd to i8*, !opID !1441, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #8, !opID !1442, !opCode !22, !bitwidth !7, !numUses !7
  %3 = bitcast i64* %decis to i8*, !opID !1443, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #8, !opID !1444, !opCode !22, !bitwidth !7, !numUses !7
  %4 = load i32, i32* %el.addr, align 4, !opID !1445, !opCode !17, !bitwidth !53, !numUses !8
  %call = call i32 @abs(i32 %4) #9, !opID !1446, !opCode !22, !bitwidth !53, !numUses !8
  %conv = sext i32 %call to i64, !opID !1447, !opCode !60, !bitwidth !61, !numUses !8
  store i64 %conv, i64* %wd, align 8, !opID !1448, !opCode !13, !bitwidth !7, !numUses !7
  br label %quantl_label9, !opID !1449, !opCode !49, !bitwidth !7, !numUses !7

quantl_label9:                                    ; preds = %entry
  store i32 0, i32* %mil, align 4, !opID !1450, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !opID !1451, !opCode !49, !bitwidth !7, !numUses !7

for.cond:                                         ; preds = %for.inc, %quantl_label9
  %5 = load i32, i32* %mil, align 4, !opID !1452, !opCode !17, !bitwidth !53, !numUses !8
  %cmp = icmp slt i32 %5, 30, !opID !1453, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp, label %for.body, label %for.end, !opID !1454, !opCode !49, !bitwidth !7, !numUses !7

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %mil, align 4, !opID !1455, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom = sext i32 %6 to i64, !opID !1456, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx = getelementptr inbounds [30 x i32], [30 x i32]* @decis_levl, i64 0, i64 %idxprom, !opID !1457, !opCode !19, !bitwidth !7, !numUses !8
  %7 = load i32, i32* %arrayidx, align 4, !opID !1458, !opCode !17, !bitwidth !53, !numUses !8
  %conv1 = sext i32 %7 to i64, !opID !1459, !opCode !60, !bitwidth !61, !numUses !8
  %8 = load i32, i32* %detl.addr, align 4, !opID !1460, !opCode !17, !bitwidth !53, !numUses !8
  %conv2 = sext i32 %8 to i64, !opID !1461, !opCode !60, !bitwidth !61, !numUses !8
  %mul = mul i64 %conv1, %conv2, !opID !1462, !opCode !303, !bitwidth !61, !numUses !8
  %9 = sitofp i64 %mul to double
  call void @profOp(i64 500, i8 15, double %9, i32 64)
  %shr = ashr i64 %mul, 15, !opID !1463, !opCode !420, !bitwidth !61, !numUses !8
  %10 = sitofp i64 %shr to double
  call void @profOp(i64 501, i8 25, double %10, i32 64)
  store i64 %shr, i64* %decis, align 8, !opID !1464, !opCode !13, !bitwidth !7, !numUses !7
  %11 = load i64, i64* %wd, align 8, !opID !1465, !opCode !17, !bitwidth !61, !numUses !8
  %12 = load i64, i64* %decis, align 8, !opID !1466, !opCode !17, !bitwidth !61, !numUses !8
  %cmp3 = icmp sle i64 %11, %12, !opID !1467, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp3, label %if.then, label %if.end, !opID !1468, !opCode !49, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %for.body
  br label %for.end, !opID !1469, !opCode !49, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %for.body
  br label %for.inc, !opID !1470, !opCode !49, !bitwidth !7, !numUses !7

for.inc:                                          ; preds = %if.end
  %13 = load i32, i32* %mil, align 4, !opID !1471, !opCode !17, !bitwidth !53, !numUses !8
  %inc = add i32 %13, 1, !opID !1472, !opCode !67, !bitwidth !53, !numUses !8
  %14 = sitofp i32 %inc to double
  call void @profOp(i64 510, i8 11, double %14, i32 32)
  store i32 %inc, i32* %mil, align 4, !opID !1473, !opCode !13, !bitwidth !7, !numUses !7
  br label %for.cond, !llvm.loop !1474, !opID !1476, !opCode !49, !bitwidth !7, !numUses !7

for.end:                                          ; preds = %if.then, %for.cond
  %15 = load i32, i32* %el.addr, align 4, !opID !1477, !opCode !17, !bitwidth !53, !numUses !8
  %cmp4 = icmp sge i32 %15, 0, !opID !1478, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp4, label %if.then5, label %if.else, !opID !1479, !opCode !49, !bitwidth !7, !numUses !7

if.then5:                                         ; preds = %for.end
  %16 = load i32, i32* %mil, align 4, !opID !1480, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom6 = sext i32 %16 to i64, !opID !1481, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx7 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_pos, i64 0, i64 %idxprom6, !opID !1482, !opCode !19, !bitwidth !7, !numUses !8
  %17 = load i32, i32* %arrayidx7, align 4, !opID !1483, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %17, i32* %ril, align 4, !opID !1484, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end10, !opID !1485, !opCode !49, !bitwidth !7, !numUses !7

if.else:                                          ; preds = %for.end
  %18 = load i32, i32* %mil, align 4, !opID !1486, !opCode !17, !bitwidth !53, !numUses !8
  %idxprom8 = sext i32 %18 to i64, !opID !1487, !opCode !60, !bitwidth !61, !numUses !8
  %arrayidx9 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_neg, i64 0, i64 %idxprom8, !opID !1488, !opCode !19, !bitwidth !7, !numUses !8
  %19 = load i32, i32* %arrayidx9, align 4, !opID !1489, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %19, i32* %ril, align 4, !opID !1490, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end10, !opID !1491, !opCode !49, !bitwidth !7, !numUses !7

if.end10:                                         ; preds = %if.else, %if.then5
  %20 = load i32, i32* %ril, align 4, !opID !1492, !opCode !17, !bitwidth !53, !numUses !8
  %21 = bitcast i64* %decis to i8*, !opID !1493, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %21) #8, !opID !1494, !opCode !22, !bitwidth !7, !numUses !7
  %22 = bitcast i64* %wd to i8*, !opID !1495, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %22) #8, !opID !1496, !opCode !22, !bitwidth !7, !numUses !7
  %23 = bitcast i32* %mil to i8*, !opID !1497, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %23) #8, !opID !1498, !opCode !22, !bitwidth !7, !numUses !7
  %24 = bitcast i32* %ril to i8*, !opID !1499, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %24) #8, !opID !1500, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %20, !opID !1501, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: nounwind readnone willreturn
define i32 @abs(i32 %n) #4 {
entry:
  %n.addr = alloca i32, align 4, !opID !1502, !opCode !6, !bitwidth !7, !numUses !273
  %m = alloca i32, align 4, !opID !1503, !opCode !6, !bitwidth !7, !numUses !268
  store i32 %n, i32* %n.addr, align 4, !opID !1504, !opCode !13, !bitwidth !7, !numUses !7
  %0 = bitcast i32* %m to i8*, !opID !1505, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !1506, !opCode !22, !bitwidth !7, !numUses !7
  %1 = load i32, i32* %n.addr, align 4, !opID !1507, !opCode !17, !bitwidth !53, !numUses !8
  %cmp = icmp sge i32 %1, 0, !opID !1508, !opCode !55, !bitwidth !8, !numUses !8
  br i1 %cmp, label %if.then, label %if.else, !opID !1509, !opCode !49, !bitwidth !7, !numUses !7

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4, !opID !1510, !opCode !17, !bitwidth !53, !numUses !8
  store i32 %2, i32* %m, align 4, !opID !1511, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !1512, !opCode !49, !bitwidth !7, !numUses !7

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %n.addr, align 4, !opID !1513, !opCode !17, !bitwidth !53, !numUses !8
  %sub = sub i32 0, %3, !opID !1514, !opCode !427, !bitwidth !53, !numUses !8
  %4 = sitofp i32 %sub to double
  call void @profOp(i64 29, i8 13, double %4, i32 32)
  store i32 %sub, i32* %m, align 4, !opID !1515, !opCode !13, !bitwidth !7, !numUses !7
  br label %if.end, !opID !1516, !opCode !49, !bitwidth !7, !numUses !7

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %m, align 4, !opID !1517, !opCode !17, !bitwidth !53, !numUses !8
  %6 = bitcast i32* %m to i8*, !opID !1518, !opCode !42, !bitwidth !7, !numUses !8
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #8, !opID !1519, !opCode !22, !bitwidth !7, !numUses !7
  ret i32 %5, !opID !1520, !opCode !29, !bitwidth !7, !numUses !7
}

; Function Attrs: noinline nounwind optnone uwtable
define void @profOp(i64 %opID, i8 zeroext %opCode, double %value, i32 %bitwidth) #0 {
entry:
  %opID.addr = alloca i64, align 8
  %opCode.addr = alloca i8, align 1
  %value.addr = alloca double, align 8
  %bitwidth.addr = alloca i32, align 4
  %isNewOp = alloca i8, align 1
  %currentOp = alloca %struct.BinOpInfo*, align 8
  %oldNumOccurs = alloca double, align 8
  %oldMean = alloca double, align 8
  %oldVariance = alloca double, align 8
  %newNumOccurs = alloca double, align 8
  %squaredValue = alloca double, align 8
  %newMean = alloca double, align 8
  %newVariance = alloca double, align 8
  %newOp = alloca %struct.BinOpInfo*, align 8
  store i64 %opID, i64* %opID.addr, align 8
  store i8 %opCode, i8* %opCode.addr, align 1
  store double %value, double* %value.addr, align 8
  store i32 %bitwidth, i32* %bitwidth.addr, align 4
  store i8 1, i8* %isNewOp, align 1
  %0 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  store %struct.BinOpInfo* %0, %struct.BinOpInfo** %currentOp, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.then, %entry
  %1 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %cmp = icmp ne %struct.BinOpInfo* %1, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %opID1 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %2, i32 0, i32 0
  %3 = load i32, i32* %opID1, align 8
  %conv = zext i32 %3 to i64
  %4 = load i64, i64* %opID.addr, align 8
  %cmp2 = icmp ne i64 %conv, %4
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %5 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %next = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %5, i32 0, i32 8
  %6 = load %struct.BinOpInfo*, %struct.BinOpInfo** %next, align 8
  store %struct.BinOpInfo* %6, %struct.BinOpInfo** %currentOp, align 8
  br label %while.cond

if.end:                                           ; preds = %while.body
  %7 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %numOccurs = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %7, i32 0, i32 3
  %8 = load double, double* %numOccurs, align 8
  store double %8, double* %oldNumOccurs, align 8
  %9 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %mean = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %9, i32 0, i32 4
  %10 = load double, double* %mean, align 8
  store double %10, double* %oldMean, align 8
  %11 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %variance = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %11, i32 0, i32 5
  %12 = load double, double* %variance, align 8
  store double %12, double* %oldVariance, align 8
  %13 = load double, double* %oldNumOccurs, align 8
  %add = fadd double %13, 1.000000e+00
  store double %add, double* %newNumOccurs, align 8
  %14 = load double, double* %value.addr, align 8
  %call = call double @pow(double %14, double 2.000000e+00) #8
  store double %call, double* %squaredValue, align 8
  %15 = load double, double* %oldMean, align 8
  %16 = load double, double* %value.addr, align 8
  %17 = load double, double* %oldMean, align 8
  %sub = fsub double %16, %17
  %18 = load double, double* %newNumOccurs, align 8
  %div = fdiv double %sub, %18
  %add4 = fadd double %15, %div
  store double %add4, double* %newMean, align 8
  %19 = load double, double* %oldVariance, align 8
  %20 = load double, double* %newNumOccurs, align 8
  %div5 = fdiv double %19, %20
  %21 = load double, double* %oldNumOccurs, align 8
  %mul = fmul double %div5, %21
  %22 = load double, double* %newMean, align 8
  %23 = load double, double* %value.addr, align 8
  %sub6 = fsub double %22, %23
  %24 = load double, double* %newNumOccurs, align 8
  %div7 = fdiv double %sub6, %24
  %25 = load double, double* %newMean, align 8
  %26 = load double, double* %value.addr, align 8
  %sub8 = fsub double %25, %26
  %mul9 = fmul double %div7, %sub8
  %add10 = fadd double %mul, %mul9
  store double %add10, double* %newVariance, align 8
  %27 = load double, double* %newNumOccurs, align 8
  %28 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %numOccurs11 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %28, i32 0, i32 3
  store double %27, double* %numOccurs11, align 8
  %29 = load double, double* %newMean, align 8
  %30 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %mean12 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %30, i32 0, i32 4
  store double %29, double* %mean12, align 8
  %31 = load double, double* %newVariance, align 8
  %32 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %variance13 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %32, i32 0, i32 5
  store double %31, double* %variance13, align 8
  %33 = load double, double* %newVariance, align 8
  %call14 = call double @sqrt(double %33) #8
  %34 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %standardDev = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %34, i32 0, i32 6
  store double %call14, double* %standardDev, align 8
  %35 = load double, double* %squaredValue, align 8
  %36 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %sumOfSquares = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %36, i32 0, i32 7
  %37 = load double, double* %sumOfSquares, align 8
  %add15 = fadd double %37, %35
  store double %add15, double* %sumOfSquares, align 8
  store i8 0, i8* %isNewOp, align 1
  br label %while.end

while.end:                                        ; preds = %if.end, %while.cond
  %38 = load i8, i8* %isNewOp, align 1
  %tobool = trunc i8 %38 to i1
  br i1 %tobool, label %if.then16, label %if.end30

if.then16:                                        ; preds = %while.end
  %call17 = call noalias i8* @malloc(i64 64) #8
  %39 = bitcast i8* %call17 to %struct.BinOpInfo*
  store %struct.BinOpInfo* %39, %struct.BinOpInfo** %newOp, align 8
  %40 = load i64, i64* %opID.addr, align 8
  %conv18 = trunc i64 %40 to i32
  %41 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %opID19 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %41, i32 0, i32 0
  store i32 %conv18, i32* %opID19, align 8
  %42 = load i8, i8* %opCode.addr, align 1
  %conv20 = zext i8 %42 to i32
  %43 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %opCode21 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %43, i32 0, i32 1
  store i32 %conv20, i32* %opCode21, align 4
  %44 = load i32, i32* %bitwidth.addr, align 4
  %45 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %bitwidth22 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %45, i32 0, i32 2
  store i32 %44, i32* %bitwidth22, align 8
  %46 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %numOccurs23 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %46, i32 0, i32 3
  store double 1.000000e+00, double* %numOccurs23, align 8
  %47 = load double, double* %value.addr, align 8
  %48 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %mean24 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %48, i32 0, i32 4
  store double %47, double* %mean24, align 8
  %49 = load double, double* %value.addr, align 8
  %call25 = call double @pow(double %49, double 2.000000e+00) #8
  %50 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %sumOfSquares26 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %50, i32 0, i32 7
  store double %call25, double* %sumOfSquares26, align 8
  %51 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %variance27 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %51, i32 0, i32 5
  store double 0.000000e+00, double* %variance27, align 8
  %52 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %standardDev28 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %52, i32 0, i32 6
  store double 0.000000e+00, double* %standardDev28, align 8
  %53 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %54 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %next29 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %54, i32 0, i32 8
  store %struct.BinOpInfo* %53, %struct.BinOpInfo** %next29, align 8
  %55 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  store %struct.BinOpInfo* %55, %struct.BinOpInfo** @ops, align 8
  br label %if.end30

if.end30:                                         ; preds = %if.then16, %while.end
  ret void
}

; Function Attrs: nounwind
declare double @pow(double, double) #5

; Function Attrs: nounwind
declare double @sqrt(double) #5

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #5

; Function Attrs: noinline nounwind optnone uwtable
define void @saveProfile(i8* %fileName) #0 {
entry:
  %fileName.addr = alloca i8*, align 8
  %count = alloca i32, align 4
  %nextOp = alloca %struct.BinOpInfo*, align 8
  %outputFile = alloca %struct._IO_FILE*, align 8
  store i8* %fileName, i8** %fileName.addr, align 8
  store i32 0, i32* %count, align 4
  %0 = load i8*, i8** %fileName.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %outputFile, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %outputFile, align 8
  %cmp = icmp eq %struct._IO_FILE* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %fileName.addr, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i32 0, i32 0), i8* %2)
  br label %return

if.end:                                           ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %3 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %cmp2 = icmp ne %struct.BinOpInfo* %3, null
  br i1 %cmp2, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %outputFile, align 8
  %5 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %opID = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %5, i32 0, i32 0
  %6 = load i32, i32* %opID, align 8
  %7 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %opCode = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %7, i32 0, i32 1
  %8 = load i32, i32* %opCode, align 4
  %9 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %bitwidth = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %9, i32 0, i32 2
  %10 = load i32, i32* %bitwidth, align 8
  %11 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %numOccurs = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %11, i32 0, i32 3
  %12 = load double, double* %numOccurs, align 8
  %conv = fptoui double %12 to i32
  %13 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %mean = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %13, i32 0, i32 4
  %14 = load double, double* %mean, align 8
  %15 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %variance = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %15, i32 0, i32 5
  %16 = load double, double* %variance, align 8
  %17 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %standardDev = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %17, i32 0, i32 6
  %18 = load double, double* %standardDev, align 8
  %19 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %sumOfSquares = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %19, i32 0, i32 7
  %20 = load double, double* %sumOfSquares, align 8
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i32 0, i32 0), i32 %6, i32 %8, i32 %10, i32 %conv, double %14, double %16, double %18, double %20)
  %21 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %next = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %21, i32 0, i32 8
  %22 = load %struct.BinOpInfo*, %struct.BinOpInfo** %next, align 8
  store %struct.BinOpInfo* %22, %struct.BinOpInfo** %nextOp, align 8
  %23 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %24 = bitcast %struct.BinOpInfo* %23 to i8*
  call void @free(i8* %24) #8
  %25 = load %struct.BinOpInfo*, %struct.BinOpInfo** %nextOp, align 8
  store %struct.BinOpInfo* %25, %struct.BinOpInfo** @ops, align 8
  %26 = load i32, i32* %count, align 4
  %inc = add nsw i32 %26, 1
  store i32 %inc, i32* %count, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %outputFile, align 8
  %call4 = call i32 @fclose(%struct._IO_FILE* %27)
  br label %return

return:                                           ; preds = %while.end, %if.then
  ret void
}

declare noalias %struct._IO_FILE* @fopen(i8*, i8*) #6

declare i32 @printf(i8*, ...) #6

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #6

; Function Attrs: nounwind
declare void @free(i8*) #5

declare i32 @fclose(%struct._IO_FILE*) #6

; Function Attrs: noinline nounwind optnone uwtable
define i8* @removeExt(i8* %filename) #0 {
entry:
  %retval = alloca i8*, align 8
  %filename.addr = alloca i8*, align 8
  %retStr = alloca i8*, align 8
  %lastExt = alloca i8*, align 8
  store i8* %filename, i8** %filename.addr, align 8
  %0 = load i8*, i8** %filename.addr, align 8
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %filename.addr, align 8
  %call = call i64 @strlen(i8* %1) #10
  %add = add i64 %call, 1
  %call1 = call noalias i8* @malloc(i64 %add) #8
  store i8* %call1, i8** %retStr, align 8
  %2 = load i8*, i8** %retStr, align 8
  %cmp2 = icmp eq i8* %2, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i8* null, i8** %retval, align 8
  br label %return

if.end4:                                          ; preds = %if.end
  %3 = load i8*, i8** %retStr, align 8
  %4 = load i8*, i8** %filename.addr, align 8
  %call5 = call i8* @strcpy(i8* %3, i8* %4) #8
  %5 = load i8*, i8** %retStr, align 8
  %call6 = call i8* @strrchr(i8* %5, i32 46) #10
  store i8* %call6, i8** %lastExt, align 8
  %6 = load i8*, i8** %lastExt, align 8
  %cmp7 = icmp ne i8* %6, null
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end4
  %7 = load i8*, i8** %lastExt, align 8
  store i8 0, i8* %7, align 1
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end4
  %8 = load i8*, i8** %retStr, align 8
  store i8* %8, i8** %retval, align 8
  br label %return

return:                                           ; preds = %if.end9, %if.then3, %if.then
  %9 = load i8*, i8** %retval, align 8
  ret i8* %9
}

; Function Attrs: nounwind readonly willreturn
declare i64 @strlen(i8*) #7

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #5

; Function Attrs: nounwind readonly willreturn
declare i8* @strrchr(i8*, i32) #7

; Function Attrs: noinline nounwind optnone uwtable
define void @populateInput(i32* %inputVector, i32 %numElts, i8* %fileName) #0 {
entry:
  %inputVector.addr = alloca i32*, align 8
  %numElts.addr = alloca i32, align 4
  %fileName.addr = alloca i8*, align 8
  %inputFile = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  store i32* %inputVector, i32** %inputVector.addr, align 8
  store i32 %numElts, i32* %numElts.addr, align 4
  store i8* %fileName, i8** %fileName.addr, align 8
  %0 = load i8*, i8** %fileName.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %inputFile, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %numElts.addr, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %inputFile, align 8
  %4 = load i32*, i32** %inputVector.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1.8, i32 0, i32 0), i32* %arrayidx)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %inputFile, align 8
  %call2 = call i32 @fclose(%struct._IO_FILE* %7)
  ret void
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #6

; Function Attrs: noinline nounwind optnone uwtable
define void @populateOutput(i32* %outputVector, i32 %numElts, i8* %fileName) #0 {
entry:
  %outputVector.addr = alloca i32*, align 8
  %numElts.addr = alloca i32, align 4
  %fileName.addr = alloca i8*, align 8
  %outputFile = alloca %struct._IO_FILE*, align 8
  %fileNameNoExt = alloca i8*, align 8
  %ext = alloca i8*, align 8
  %fileNameLen = alloca i32, align 4
  %rawFileName = alloca i8*, align 8
  %rawOutput = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  store i32* %outputVector, i32** %outputVector.addr, align 8
  store i32 %numElts, i32* %numElts.addr, align 4
  store i8* %fileName, i8** %fileName.addr, align 8
  %0 = load i8*, i8** %fileName.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2.11, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %outputFile, align 8
  %1 = load i8*, i8** %fileName.addr, align 8
  %call1 = call i8* @removeExt(i8* %1)
  store i8* %call1, i8** %fileNameNoExt, align 8
  %2 = load i8*, i8** %fileName.addr, align 8
  %call2 = call i8* @strrchr(i8* %2, i32 46) #10
  store i8* %call2, i8** %ext, align 8
  %3 = load i8*, i8** %fileName.addr, align 8
  %call3 = call i64 @strlen(i8* %3) #10
  %conv = trunc i64 %call3 to i32
  store i32 %conv, i32* %fileNameLen, align 4
  %4 = load i32, i32* %fileNameLen, align 4
  %add = add nsw i32 %4, 5
  %conv4 = sext i32 %add to i64
  %call5 = call noalias i8* @malloc(i64 %conv4) #8
  store i8* %call5, i8** %rawFileName, align 8
  %5 = load i8*, i8** %rawFileName, align 8
  %6 = load i8*, i8** %fileNameNoExt, align 8
  %call6 = call i8* @strcpy(i8* %5, i8* %6) #8
  %7 = load i8*, i8** %rawFileName, align 8
  %call7 = call i8* @strcat(i8* %7, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0)) #8
  %8 = load i8*, i8** %rawFileName, align 8
  %9 = load i8*, i8** %ext, align 8
  %call8 = call i8* @strcat(i8* %8, i8* %9) #8
  %10 = load i8*, i8** %rawFileName, align 8
  %call9 = call noalias %struct._IO_FILE* @fopen(i8* %10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2.11, i32 0, i32 0))
  store %struct._IO_FILE* %call9, %struct._IO_FILE** %rawOutput, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i32, i32* %i, align 4
  %12 = load i32, i32* %numElts.addr, align 4
  %cmp = icmp slt i32 %11, %12
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %outputFile, align 8
  %14 = load i32*, i32** %outputVector.addr, align 8
  %15 = load i32, i32* %i, align 4
  %idxprom = sext i32 %15 to i64
  %arrayidx = getelementptr inbounds i32, i32* %14, i64 %idxprom
  %16 = load i32, i32* %arrayidx, align 4
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i32 %16)
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %rawOutput, align 8
  %18 = load i32*, i32** %outputVector.addr, align 8
  %19 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %19 to i64
  %arrayidx13 = getelementptr inbounds i32, i32* %18, i64 %idxprom12
  %20 = load i32, i32* %arrayidx13, align 4
  %call14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i32 %20)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %outputFile, align 8
  %call15 = call i32 @fclose(%struct._IO_FILE* %22)
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %rawOutput, align 8
  %call16 = call i32 @fclose(%struct._IO_FILE* %23)
  ret void
}

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #5

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.top.func"="adpcm_main" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { nounwind readnone willreturn }
attributes #10 = { nounwind readonly willreturn }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!opCounter = !{!1}
!llvm.module.flags = !{!2, !3, !4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i64 1450}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
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
!30 = !{!31}
!31 = !{!"fpga.top", !"user"}
!32 = !{i64 1372}
!33 = !{i64 1373}
!34 = !{i64 1374}
!35 = !{i64 1375}
!36 = !{i32 16}
!37 = !{i64 1376}
!38 = !{i64 1377}
!39 = !{i64 1378}
!40 = !{i64 1379}
!41 = !{i64 1380}
!42 = !{i8 47}
!43 = !{i64 1381}
!44 = !{i64 1382}
!45 = !{i64 1383}
!46 = !{i64 1384}
!47 = !{i64 1385}
!48 = !{i64 1386}
!49 = !{i8 2}
!50 = !{i64 1387}
!51 = !{i64 1388}
!52 = !{i64 1389}
!53 = !{i32 32}
!54 = !{i64 1390}
!55 = !{i8 51}
!56 = !{i64 1391}
!57 = !{i64 1392}
!58 = !{i64 1393}
!59 = !{i64 1394}
!60 = !{i8 38}
!61 = !{i32 64}
!62 = !{i64 1395}
!63 = !{i64 1396}
!64 = !{i64 1397}
!65 = !{i64 1398}
!66 = !{i64 1399}
!67 = !{i8 11}
!68 = !{i64 1400}
!69 = !{i64 1401}
!70 = !{i64 1402}
!71 = !{i64 1403}
!72 = !{i64 1404}
!73 = !{i64 1405}
!74 = !{i64 1406}
!75 = !{i8 18}
!76 = !{i64 1407}
!77 = !{i64 1408}
!78 = !{i64 1409}
!79 = !{i64 1410}
!80 = !{i64 1411}
!81 = !{i64 1412}
!82 = !{i64 1413}
!83 = distinct !{!83, !84}
!84 = !{!"llvm.loop.name", !"adpcm_main_label12"}
!85 = !{i64 1414}
!86 = !{i64 1415}
!87 = !{i64 1416}
!88 = !{i64 1417}
!89 = !{i64 1418}
!90 = !{i64 1419}
!91 = !{i64 1420}
!92 = !{i64 1421}
!93 = !{i64 1422}
!94 = !{i64 1423}
!95 = !{i64 1424}
!96 = !{i64 1425}
!97 = !{i64 1426}
!98 = !{i64 1427}
!99 = !{i64 1428}
!100 = !{i64 1429}
!101 = !{i64 1430}
!102 = !{i64 1431}
!103 = !{i64 1432}
!104 = !{i64 1433}
!105 = !{i64 1434}
!106 = !{i64 1435}
!107 = !{i64 1436}
!108 = !{i64 1437}
!109 = !{i64 1438}
!110 = !{i64 1439}
!111 = !{i64 1440}
!112 = !{i64 1441}
!113 = !{i64 1442}
!114 = !{i64 1443}
!115 = !{i64 1444}
!116 = distinct !{!116, !117}
!117 = !{!"llvm.loop.name", !"adpcm_main_label13"}
!118 = !{i64 1445}
!119 = !{i64 1446}
!120 = !{i64 1447}
!121 = !{i64 1448}
!122 = !{i64 1449}
!123 = !{i64 1246}
!124 = !{i32 29}
!125 = !{i64 1247}
!126 = !{i64 1248}
!127 = !{i64 1249}
!128 = !{i64 1250}
!129 = !{i64 1251}
!130 = !{i64 1252}
!131 = !{i64 1253}
!132 = !{i64 1254}
!133 = !{i64 1255}
!134 = !{i64 1256}
!135 = !{i64 1257}
!136 = !{i64 1258}
!137 = !{i64 1259}
!138 = !{i64 1260}
!139 = !{i64 1261}
!140 = !{i64 1262}
!141 = !{i64 1263}
!142 = !{i64 1264}
!143 = !{i64 1265}
!144 = !{i64 1266}
!145 = !{i64 1267}
!146 = !{i64 1268}
!147 = !{i64 1269}
!148 = !{i64 1270}
!149 = !{i64 1271}
!150 = !{i64 1272}
!151 = !{i64 1273}
!152 = !{i64 1274}
!153 = !{i64 1275}
!154 = !{i64 1276}
!155 = !{i64 1277}
!156 = !{i64 1278}
!157 = !{i64 1279}
!158 = !{i64 1280}
!159 = !{i64 1281}
!160 = !{i64 1282}
!161 = !{i64 1283}
!162 = !{i64 1284}
!163 = !{i64 1285}
!164 = !{i64 1286}
!165 = !{i64 1287}
!166 = !{i64 1288}
!167 = !{i64 1289}
!168 = !{i64 1290}
!169 = !{i64 1291}
!170 = !{i64 1292}
!171 = !{i64 1293}
!172 = !{i64 1294}
!173 = !{i64 1295}
!174 = !{i64 1296}
!175 = !{i64 1297}
!176 = !{i64 1298}
!177 = !{i64 1299}
!178 = !{i64 1300}
!179 = !{i64 1301}
!180 = !{i64 1302}
!181 = !{i64 1303}
!182 = !{i64 1304}
!183 = !{i64 1305}
!184 = !{i64 1306}
!185 = distinct !{!185, !186}
!186 = !{!"llvm.loop.name", !"reset_label4"}
!187 = !{i64 1307}
!188 = !{i64 1308}
!189 = !{i64 1309}
!190 = !{i64 1310}
!191 = !{i64 1311}
!192 = !{i64 1312}
!193 = !{i64 1313}
!194 = !{i64 1314}
!195 = !{i64 1315}
!196 = !{i64 1316}
!197 = !{i64 1317}
!198 = !{i64 1318}
!199 = !{i64 1319}
!200 = !{i64 1320}
!201 = !{i64 1321}
!202 = !{i64 1322}
!203 = !{i64 1323}
!204 = !{i64 1324}
!205 = !{i64 1325}
!206 = !{i64 1326}
!207 = !{i64 1327}
!208 = !{i64 1328}
!209 = !{i64 1329}
!210 = !{i64 1330}
!211 = !{i64 1331}
!212 = !{i64 1332}
!213 = !{i64 1333}
!214 = distinct !{!214, !215}
!215 = !{!"llvm.loop.name", !"reset_label5"}
!216 = !{i64 1334}
!217 = !{i64 1335}
!218 = !{i64 1336}
!219 = !{i64 1337}
!220 = !{i64 1338}
!221 = !{i64 1339}
!222 = !{i64 1340}
!223 = !{i64 1341}
!224 = !{i64 1342}
!225 = !{i64 1343}
!226 = !{i64 1344}
!227 = !{i64 1345}
!228 = !{i64 1346}
!229 = !{i64 1347}
!230 = !{i64 1348}
!231 = distinct !{!231, !232}
!232 = !{!"llvm.loop.name", !"reset_label6"}
!233 = !{i64 1349}
!234 = !{i64 1350}
!235 = !{i64 1351}
!236 = !{i64 1352}
!237 = !{i64 1353}
!238 = !{i64 1354}
!239 = !{i64 1355}
!240 = !{i64 1356}
!241 = !{i64 1357}
!242 = !{i64 1358}
!243 = !{i64 1359}
!244 = !{i64 1360}
!245 = !{i64 1361}
!246 = !{i64 1362}
!247 = !{i64 1363}
!248 = !{i64 1364}
!249 = !{i64 1365}
!250 = !{i64 1366}
!251 = !{i64 1367}
!252 = distinct !{!252, !253}
!253 = !{!"llvm.loop.name", !"reset_label7"}
!254 = !{i64 1368}
!255 = !{i64 1369}
!256 = !{i64 1370}
!257 = !{i64 1371}
!258 = !{i64 36}
!259 = !{i32 2}
!260 = !{i64 37}
!261 = !{i64 38}
!262 = !{i32 10}
!263 = !{i64 39}
!264 = !{i32 15}
!265 = !{i64 40}
!266 = !{i32 20}
!267 = !{i64 41}
!268 = !{i32 5}
!269 = !{i64 42}
!270 = !{i32 9}
!271 = !{i64 43}
!272 = !{i64 44}
!273 = !{i32 4}
!274 = !{i64 45}
!275 = !{i64 46}
!276 = !{i64 47}
!277 = !{i64 48}
!278 = !{i64 49}
!279 = !{i64 50}
!280 = !{i64 51}
!281 = !{i64 52}
!282 = !{i64 53}
!283 = !{i64 54}
!284 = !{i64 55}
!285 = !{i64 56}
!286 = !{i64 57}
!287 = !{i64 58}
!288 = !{i64 59}
!289 = !{i64 60}
!290 = !{i64 61}
!291 = !{i64 62}
!292 = !{i64 63}
!293 = !{i64 64}
!294 = !{i64 65}
!295 = !{i64 66}
!296 = !{i64 67}
!297 = !{i64 68}
!298 = !{i64 69}
!299 = !{i64 70}
!300 = !{i64 71}
!301 = !{i64 72}
!302 = !{i64 73}
!303 = !{i8 15}
!304 = !{i64 74}
!305 = !{i64 75}
!306 = !{i64 76}
!307 = !{i64 77}
!308 = !{i64 78}
!309 = !{i64 79}
!310 = !{i64 80}
!311 = !{i64 81}
!312 = !{i64 82}
!313 = !{i64 83}
!314 = !{i64 84}
!315 = !{i64 85}
!316 = !{i64 86}
!317 = !{i64 87}
!318 = !{i64 88}
!319 = !{i64 89}
!320 = !{i64 90}
!321 = !{i64 91}
!322 = !{i64 92}
!323 = !{i64 93}
!324 = !{i64 94}
!325 = !{i64 95}
!326 = !{i64 96}
!327 = !{i64 97}
!328 = !{i64 98}
!329 = !{i64 99}
!330 = !{i64 100}
!331 = !{i64 101}
!332 = !{i64 102}
!333 = !{i64 103}
!334 = !{i64 104}
!335 = !{i64 105}
!336 = !{i64 106}
!337 = !{i64 107}
!338 = !{i64 108}
!339 = !{i64 109}
!340 = !{i64 110}
!341 = !{i64 111}
!342 = !{i64 112}
!343 = !{i64 113}
!344 = !{i64 114}
!345 = !{i64 115}
!346 = !{i64 116}
!347 = !{i64 117}
!348 = !{i64 118}
!349 = !{i64 119}
!350 = !{i64 120}
!351 = !{i64 121}
!352 = !{i64 122}
!353 = !{i64 123}
!354 = !{i64 124}
!355 = distinct !{!355, !356}
!356 = !{!"llvm.loop.name", !"encode_label0"}
!357 = !{i64 125}
!358 = !{i64 126}
!359 = !{i64 127}
!360 = !{i64 128}
!361 = !{i64 129}
!362 = !{i64 130}
!363 = !{i64 131}
!364 = !{i64 132}
!365 = !{i64 133}
!366 = !{i64 134}
!367 = !{i64 135}
!368 = !{i64 136}
!369 = !{i64 137}
!370 = !{i64 138}
!371 = !{i64 139}
!372 = !{i64 140}
!373 = !{i64 141}
!374 = !{i64 142}
!375 = !{i64 143}
!376 = !{i64 144}
!377 = !{i64 145}
!378 = !{i64 146}
!379 = !{i64 147}
!380 = !{i64 148}
!381 = !{i64 149}
!382 = !{i64 150}
!383 = !{i64 151}
!384 = !{i64 152}
!385 = !{i64 153}
!386 = !{i64 154}
!387 = !{i64 155}
!388 = !{i64 156}
!389 = !{i64 157}
!390 = !{i64 158}
!391 = !{i64 159}
!392 = !{i64 160}
!393 = !{i64 161}
!394 = !{i64 162}
!395 = !{i64 163}
!396 = !{i64 164}
!397 = !{i64 165}
!398 = !{i64 166}
!399 = !{i64 167}
!400 = !{i64 168}
!401 = !{i64 169}
!402 = !{i64 170}
!403 = !{i64 171}
!404 = !{i64 172}
!405 = distinct !{!405, !406}
!406 = !{!"llvm.loop.name", !"encode_label1"}
!407 = !{i64 173}
!408 = !{i64 174}
!409 = !{i64 175}
!410 = !{i64 176}
!411 = !{i64 177}
!412 = !{i64 178}
!413 = !{i64 179}
!414 = !{i64 180}
!415 = !{i64 181}
!416 = !{i64 182}
!417 = !{i64 183}
!418 = !{i64 184}
!419 = !{i64 185}
!420 = !{i8 25}
!421 = !{i64 186}
!422 = !{i8 36}
!423 = !{i64 187}
!424 = !{i64 188}
!425 = !{i64 189}
!426 = !{i64 190}
!427 = !{i8 13}
!428 = !{i64 191}
!429 = !{i64 192}
!430 = !{i64 193}
!431 = !{i64 194}
!432 = !{i64 195}
!433 = !{i64 196}
!434 = !{i64 197}
!435 = !{i64 198}
!436 = !{i64 199}
!437 = !{i64 200}
!438 = !{i64 201}
!439 = !{i64 202}
!440 = !{i64 203}
!441 = !{i64 204}
!442 = !{i64 205}
!443 = !{i64 206}
!444 = !{i64 207}
!445 = !{i64 208}
!446 = !{i64 209}
!447 = !{i64 210}
!448 = !{i64 211}
!449 = !{i64 212}
!450 = !{i64 213}
!451 = !{i64 214}
!452 = !{i64 215}
!453 = !{i64 216}
!454 = !{i64 217}
!455 = !{i64 218}
!456 = !{i64 219}
!457 = !{i64 220}
!458 = !{i64 221}
!459 = !{i64 222}
!460 = !{i64 223}
!461 = !{i64 224}
!462 = !{i64 225}
!463 = !{i64 226}
!464 = !{i64 227}
!465 = !{i64 228}
!466 = !{i64 229}
!467 = !{i64 230}
!468 = !{i64 231}
!469 = !{i64 232}
!470 = !{i64 233}
!471 = !{i64 234}
!472 = !{i64 235}
!473 = !{i64 236}
!474 = !{i64 237}
!475 = !{i64 238}
!476 = !{i64 239}
!477 = !{i64 240}
!478 = !{i64 241}
!479 = !{i64 242}
!480 = !{i64 243}
!481 = !{i64 244}
!482 = !{i64 245}
!483 = !{i64 246}
!484 = !{i64 247}
!485 = !{i64 248}
!486 = !{i64 249}
!487 = !{i64 250}
!488 = !{i64 251}
!489 = !{i64 252}
!490 = !{i64 253}
!491 = !{i64 254}
!492 = !{i64 255}
!493 = !{i64 256}
!494 = !{i64 257}
!495 = !{i64 258}
!496 = !{i64 259}
!497 = !{i64 260}
!498 = !{i64 261}
!499 = !{i64 262}
!500 = !{i64 263}
!501 = !{i64 264}
!502 = !{i64 265}
!503 = !{i64 266}
!504 = !{i64 267}
!505 = !{i64 268}
!506 = !{i64 269}
!507 = !{i64 270}
!508 = !{i64 271}
!509 = !{i64 272}
!510 = !{i64 273}
!511 = !{i64 274}
!512 = !{i64 275}
!513 = !{i64 276}
!514 = !{i64 277}
!515 = !{i64 278}
!516 = !{i64 279}
!517 = !{i64 280}
!518 = !{i64 281}
!519 = !{i64 282}
!520 = !{i64 283}
!521 = !{i64 284}
!522 = !{i64 285}
!523 = !{i64 286}
!524 = !{i64 287}
!525 = !{i64 288}
!526 = !{i64 289}
!527 = !{i64 290}
!528 = !{i64 291}
!529 = !{i64 292}
!530 = !{i64 293}
!531 = !{i64 294}
!532 = !{i64 295}
!533 = !{i64 296}
!534 = !{i64 297}
!535 = !{i64 298}
!536 = !{i64 299}
!537 = !{i64 300}
!538 = !{i64 301}
!539 = !{i64 302}
!540 = !{i64 303}
!541 = !{i64 304}
!542 = !{i64 305}
!543 = !{i64 306}
!544 = !{i64 307}
!545 = !{i64 308}
!546 = !{i64 309}
!547 = !{i64 310}
!548 = !{i64 311}
!549 = !{i64 312}
!550 = !{i64 313}
!551 = !{i64 314}
!552 = !{i64 315}
!553 = !{i64 316}
!554 = !{i64 317}
!555 = !{i64 318}
!556 = !{i64 319}
!557 = !{i64 320}
!558 = !{i64 321}
!559 = !{i64 322}
!560 = !{i64 323}
!561 = !{i64 324}
!562 = !{i64 325}
!563 = !{i64 326}
!564 = !{i64 327}
!565 = !{i64 328}
!566 = !{i64 329}
!567 = !{i64 330}
!568 = !{i64 331}
!569 = !{i64 332}
!570 = !{i64 333}
!571 = !{i64 334}
!572 = !{i64 335}
!573 = !{i64 336}
!574 = !{i64 337}
!575 = !{i64 338}
!576 = !{i64 339}
!577 = !{i64 340}
!578 = !{i64 341}
!579 = !{i64 342}
!580 = !{i64 343}
!581 = !{i64 344}
!582 = !{i64 345}
!583 = !{i64 346}
!584 = !{i64 347}
!585 = !{i64 348}
!586 = !{i64 349}
!587 = !{i64 350}
!588 = !{i64 351}
!589 = !{i64 352}
!590 = !{i64 353}
!591 = !{i8 23}
!592 = !{i64 354}
!593 = !{i8 27}
!594 = !{i64 355}
!595 = !{i64 356}
!596 = !{i64 357}
!597 = !{i64 358}
!598 = !{i64 359}
!599 = !{i64 360}
!600 = !{i64 361}
!601 = !{i64 362}
!602 = !{i64 363}
!603 = !{i64 364}
!604 = !{i64 365}
!605 = !{i64 366}
!606 = !{i64 367}
!607 = !{i64 368}
!608 = !{i64 369}
!609 = !{i64 920}
!610 = !{i64 921}
!611 = !{i64 922}
!612 = !{i32 8}
!613 = !{i64 923}
!614 = !{i64 924}
!615 = !{i64 925}
!616 = !{i64 926}
!617 = !{i64 927}
!618 = !{i64 928}
!619 = !{i64 929}
!620 = !{i64 930}
!621 = !{i64 931}
!622 = !{i64 932}
!623 = !{i64 933}
!624 = !{i64 934}
!625 = !{i64 935}
!626 = !{i64 936}
!627 = !{i64 937}
!628 = !{i64 938}
!629 = !{i64 939}
!630 = !{i64 940}
!631 = !{i64 941}
!632 = !{i64 942}
!633 = !{i64 943}
!634 = !{i64 944}
!635 = !{i64 945}
!636 = !{i64 946}
!637 = !{i64 947}
!638 = !{i8 26}
!639 = !{i64 948}
!640 = !{i64 949}
!641 = !{i64 950}
!642 = !{i64 951}
!643 = !{i64 952}
!644 = !{i64 953}
!645 = !{i64 954}
!646 = !{i64 955}
!647 = !{i64 956}
!648 = !{i64 957}
!649 = !{i64 958}
!650 = !{i64 959}
!651 = !{i64 960}
!652 = !{i64 961}
!653 = !{i64 962}
!654 = !{i64 963}
!655 = !{i64 964}
!656 = !{i64 965}
!657 = !{i64 966}
!658 = !{i64 967}
!659 = !{i64 968}
!660 = !{i64 969}
!661 = !{i64 970}
!662 = !{i64 971}
!663 = !{i64 972}
!664 = !{i64 973}
!665 = !{i64 974}
!666 = !{i64 975}
!667 = !{i64 976}
!668 = !{i64 977}
!669 = !{i64 978}
!670 = !{i64 979}
!671 = !{i64 980}
!672 = !{i64 981}
!673 = !{i64 982}
!674 = !{i64 983}
!675 = !{i64 984}
!676 = !{i64 985}
!677 = !{i64 986}
!678 = !{i64 987}
!679 = !{i64 988}
!680 = !{i64 989}
!681 = !{i64 990}
!682 = !{i64 991}
!683 = !{i64 992}
!684 = !{i64 993}
!685 = !{i64 994}
!686 = !{i64 995}
!687 = !{i64 996}
!688 = !{i64 997}
!689 = !{i64 998}
!690 = !{i64 999}
!691 = !{i64 1000}
!692 = !{i64 1001}
!693 = !{i64 1002}
!694 = !{i64 1003}
!695 = !{i64 1004}
!696 = !{i64 1005}
!697 = !{i64 1006}
!698 = !{i64 1007}
!699 = !{i64 1008}
!700 = !{i64 1009}
!701 = !{i64 1010}
!702 = !{i64 1011}
!703 = !{i64 1012}
!704 = !{i64 1013}
!705 = !{i64 1014}
!706 = !{i64 1015}
!707 = !{i64 1016}
!708 = !{i64 1017}
!709 = !{i64 1018}
!710 = !{i64 1019}
!711 = !{i64 1020}
!712 = !{i64 1021}
!713 = !{i64 1022}
!714 = !{i64 1023}
!715 = !{i64 1024}
!716 = !{i64 1025}
!717 = !{i64 1026}
!718 = !{i64 1027}
!719 = !{i64 1028}
!720 = !{i64 1029}
!721 = !{i64 1030}
!722 = !{i64 1031}
!723 = !{i64 1032}
!724 = !{i64 1033}
!725 = !{i64 1034}
!726 = !{i64 1035}
!727 = !{i64 1036}
!728 = !{i64 1037}
!729 = !{i64 1038}
!730 = !{i64 1039}
!731 = !{i64 1040}
!732 = !{i64 1041}
!733 = !{i64 1042}
!734 = !{i64 1043}
!735 = !{i64 1044}
!736 = !{i64 1045}
!737 = !{i64 1046}
!738 = !{i64 1047}
!739 = !{i64 1048}
!740 = !{i64 1049}
!741 = !{i64 1050}
!742 = !{i64 1051}
!743 = !{i64 1052}
!744 = !{i64 1053}
!745 = !{i64 1054}
!746 = !{i64 1055}
!747 = !{i64 1056}
!748 = !{i64 1057}
!749 = !{i64 1058}
!750 = !{i64 1059}
!751 = !{i64 1060}
!752 = !{i64 1061}
!753 = !{i64 1062}
!754 = !{i64 1063}
!755 = !{i64 1064}
!756 = !{i64 1065}
!757 = !{i64 1066}
!758 = !{i64 1067}
!759 = !{i64 1068}
!760 = !{i64 1069}
!761 = !{i64 1070}
!762 = !{i64 1071}
!763 = !{i64 1072}
!764 = !{i64 1073}
!765 = !{i64 1074}
!766 = !{i64 1075}
!767 = !{i64 1076}
!768 = !{i64 1077}
!769 = !{i64 1078}
!770 = !{i64 1079}
!771 = !{i64 1080}
!772 = !{i64 1081}
!773 = !{i64 1082}
!774 = !{i64 1083}
!775 = !{i64 1084}
!776 = !{i64 1085}
!777 = !{i64 1086}
!778 = !{i64 1087}
!779 = !{i64 1088}
!780 = !{i64 1089}
!781 = !{i64 1090}
!782 = !{i64 1091}
!783 = !{i64 1092}
!784 = !{i64 1093}
!785 = !{i64 1094}
!786 = !{i64 1095}
!787 = !{i64 1096}
!788 = !{i64 1097}
!789 = !{i64 1098}
!790 = !{i64 1099}
!791 = !{i64 1100}
!792 = !{i64 1101}
!793 = !{i64 1102}
!794 = !{i64 1103}
!795 = !{i64 1104}
!796 = !{i64 1105}
!797 = !{i64 1106}
!798 = !{i64 1107}
!799 = !{i64 1108}
!800 = !{i64 1109}
!801 = !{i64 1110}
!802 = !{i64 1111}
!803 = !{i64 1112}
!804 = !{i64 1113}
!805 = !{i64 1114}
!806 = !{i64 1115}
!807 = !{i64 1116}
!808 = !{i64 1117}
!809 = !{i64 1118}
!810 = !{i64 1119}
!811 = !{i64 1120}
!812 = !{i64 1121}
!813 = !{i64 1122}
!814 = !{i64 1123}
!815 = !{i64 1124}
!816 = !{i64 1125}
!817 = !{i64 1126}
!818 = !{i64 1127}
!819 = !{i64 1128}
!820 = !{i64 1129}
!821 = !{i64 1130}
!822 = !{i64 1131}
!823 = !{i64 1132}
!824 = !{i64 1133}
!825 = !{i64 1134}
!826 = !{i64 1135}
!827 = !{i64 1136}
!828 = !{i64 1137}
!829 = !{i64 1138}
!830 = !{i64 1139}
!831 = !{i64 1140}
!832 = !{i64 1141}
!833 = !{i64 1142}
!834 = !{i64 1143}
!835 = !{i64 1144}
!836 = !{i64 1145}
!837 = !{i64 1146}
!838 = !{i64 1147}
!839 = !{i64 1148}
!840 = !{i64 1149}
!841 = !{i64 1150}
!842 = !{i64 1151}
!843 = !{i64 1152}
!844 = !{i64 1153}
!845 = !{i64 1154}
!846 = !{i64 1155}
!847 = !{i64 1156}
!848 = distinct !{!848, !849}
!849 = !{!"llvm.loop.name", !"decode_label2"}
!850 = !{i64 1157}
!851 = !{i64 1158}
!852 = !{i64 1159}
!853 = !{i64 1160}
!854 = !{i64 1161}
!855 = !{i64 1162}
!856 = !{i64 1163}
!857 = !{i64 1164}
!858 = !{i64 1165}
!859 = !{i64 1166}
!860 = !{i64 1167}
!861 = !{i64 1168}
!862 = !{i64 1169}
!863 = !{i64 1170}
!864 = !{i64 1171}
!865 = !{i64 1172}
!866 = !{i64 1173}
!867 = !{i64 1174}
!868 = !{i64 1175}
!869 = !{i64 1176}
!870 = !{i64 1177}
!871 = !{i64 1178}
!872 = !{i64 1179}
!873 = !{i64 1180}
!874 = !{i64 1181}
!875 = !{i64 1182}
!876 = !{i64 1183}
!877 = !{i64 1184}
!878 = !{i64 1185}
!879 = !{i64 1186}
!880 = !{i64 1187}
!881 = !{i64 1188}
!882 = !{i64 1189}
!883 = !{i64 1190}
!884 = !{i64 1191}
!885 = !{i64 1192}
!886 = !{i64 1193}
!887 = !{i64 1194}
!888 = !{i64 1195}
!889 = !{i64 1196}
!890 = !{i64 1197}
!891 = !{i64 1198}
!892 = !{i64 1199}
!893 = !{i64 1200}
!894 = !{i64 1201}
!895 = !{i64 1202}
!896 = !{i64 1203}
!897 = !{i64 1204}
!898 = !{i64 1205}
!899 = !{i64 1206}
!900 = !{i64 1207}
!901 = !{i64 1208}
!902 = !{i64 1209}
!903 = !{i64 1210}
!904 = !{i64 1211}
!905 = !{i64 1212}
!906 = !{i64 1213}
!907 = !{i64 1214}
!908 = !{i64 1215}
!909 = !{i64 1216}
!910 = !{i64 1217}
!911 = !{i64 1218}
!912 = !{i64 1219}
!913 = !{i64 1220}
!914 = !{i64 1221}
!915 = distinct !{!915, !916}
!916 = !{!"llvm.loop.name", !"decode_label3"}
!917 = !{i64 1222}
!918 = !{i64 1223}
!919 = !{i64 1224}
!920 = !{i64 1225}
!921 = !{i64 1226}
!922 = !{i64 1227}
!923 = !{i64 1228}
!924 = !{i64 1229}
!925 = !{i64 1230}
!926 = !{i64 1231}
!927 = !{i64 1232}
!928 = !{i64 1233}
!929 = !{i64 1234}
!930 = !{i64 1235}
!931 = !{i64 1236}
!932 = !{i64 1237}
!933 = !{i64 1238}
!934 = !{i64 1239}
!935 = !{i64 1240}
!936 = !{i64 1241}
!937 = !{i64 1242}
!938 = !{i64 1243}
!939 = !{i64 1244}
!940 = !{i64 1245}
!941 = !{i64 370}
!942 = !{i64 371}
!943 = !{i64 372}
!944 = !{i32 6}
!945 = !{i64 373}
!946 = !{i64 374}
!947 = !{i64 375}
!948 = !{i64 376}
!949 = !{i64 377}
!950 = !{i64 378}
!951 = !{i64 379}
!952 = !{i64 380}
!953 = !{i64 381}
!954 = !{i64 382}
!955 = !{i64 383}
!956 = !{i64 384}
!957 = !{i64 385}
!958 = !{i64 386}
!959 = !{i64 387}
!960 = !{i64 388}
!961 = !{i64 389}
!962 = !{i64 390}
!963 = !{i64 391}
!964 = !{i64 392}
!965 = !{i64 393}
!966 = !{i64 394}
!967 = !{i64 395}
!968 = !{i64 396}
!969 = !{i64 397}
!970 = !{i64 398}
!971 = !{i64 399}
!972 = !{i64 400}
!973 = !{i64 401}
!974 = !{i64 402}
!975 = !{i64 403}
!976 = !{i64 404}
!977 = !{i64 405}
!978 = !{i64 406}
!979 = !{i64 407}
!980 = !{i64 408}
!981 = !{i64 409}
!982 = !{i64 410}
!983 = !{i64 411}
!984 = !{i64 412}
!985 = !{i64 413}
!986 = !{i64 414}
!987 = !{i64 415}
!988 = distinct !{!988, !989}
!989 = !{!"llvm.loop.name", !"filtez_label8"}
!990 = !{i64 416}
!991 = !{i64 417}
!992 = !{i64 418}
!993 = !{i64 419}
!994 = !{i64 420}
!995 = !{i64 421}
!996 = !{i64 422}
!997 = !{i64 423}
!998 = !{i64 424}
!999 = !{i64 425}
!1000 = !{i64 426}
!1001 = !{i64 427}
!1002 = !{i64 428}
!1003 = !{i64 429}
!1004 = !{i64 430}
!1005 = !{i64 431}
!1006 = !{i64 432}
!1007 = !{i64 433}
!1008 = !{i64 434}
!1009 = !{i64 435}
!1010 = !{i64 436}
!1011 = !{i64 437}
!1012 = !{i64 438}
!1013 = !{i64 439}
!1014 = !{i64 440}
!1015 = !{i64 441}
!1016 = !{i64 442}
!1017 = !{i64 443}
!1018 = !{i64 444}
!1019 = !{i64 445}
!1020 = !{i64 446}
!1021 = !{i64 447}
!1022 = !{i64 448}
!1023 = !{i64 449}
!1024 = !{i64 450}
!1025 = !{i64 451}
!1026 = !{i64 452}
!1027 = !{i64 453}
!1028 = !{i64 454}
!1029 = !{i64 455}
!1030 = !{i64 456}
!1031 = !{i64 457}
!1032 = !{i64 458}
!1033 = !{i64 459}
!1034 = !{i64 460}
!1035 = !{i64 461}
!1036 = !{i64 462}
!1037 = !{i64 463}
!1038 = !{i64 464}
!1039 = !{i64 465}
!1040 = !{i64 466}
!1041 = !{i64 538}
!1042 = !{i64 539}
!1043 = !{i64 540}
!1044 = !{i64 541}
!1045 = !{i64 542}
!1046 = !{i64 543}
!1047 = !{i64 544}
!1048 = !{i64 545}
!1049 = !{i64 546}
!1050 = !{i64 547}
!1051 = !{i64 548}
!1052 = !{i64 549}
!1053 = !{i64 550}
!1054 = !{i64 551}
!1055 = !{i64 552}
!1056 = !{i64 553}
!1057 = !{i64 554}
!1058 = !{i64 555}
!1059 = !{i64 556}
!1060 = !{i64 557}
!1061 = !{i64 558}
!1062 = !{i64 559}
!1063 = !{i64 560}
!1064 = !{i64 561}
!1065 = !{i64 562}
!1066 = !{i64 563}
!1067 = !{i64 564}
!1068 = !{i64 565}
!1069 = !{i64 566}
!1070 = !{i64 567}
!1071 = !{i64 568}
!1072 = !{i64 569}
!1073 = !{i64 570}
!1074 = !{i64 571}
!1075 = !{i64 572}
!1076 = !{i64 573}
!1077 = !{i64 574}
!1078 = !{i64 575}
!1079 = !{i64 576}
!1080 = !{i64 577}
!1081 = !{i64 578}
!1082 = !{i64 579}
!1083 = !{i64 580}
!1084 = !{i64 581}
!1085 = !{i64 582}
!1086 = !{i64 583}
!1087 = !{i64 584}
!1088 = !{i64 585}
!1089 = !{i64 586}
!1090 = !{i64 587}
!1091 = !{i64 588}
!1092 = !{i64 589}
!1093 = !{i64 590}
!1094 = !{i64 591}
!1095 = !{i64 592}
!1096 = !{i64 593}
!1097 = !{i64 594}
!1098 = !{i64 595}
!1099 = !{i64 596}
!1100 = !{i64 597}
!1101 = !{i64 598}
!1102 = !{i64 599}
!1103 = !{i64 600}
!1104 = !{i64 601}
!1105 = !{i64 602}
!1106 = !{i64 603}
!1107 = !{i64 604}
!1108 = !{i64 605}
!1109 = !{i64 606}
!1110 = !{i64 607}
!1111 = !{i64 608}
!1112 = !{i64 609}
!1113 = !{i64 610}
!1114 = !{i64 611}
!1115 = !{i64 612}
!1116 = !{i64 613}
!1117 = !{i32 13}
!1118 = !{i64 614}
!1119 = !{i64 615}
!1120 = !{i64 616}
!1121 = !{i64 617}
!1122 = !{i64 618}
!1123 = !{i64 619}
!1124 = !{i64 620}
!1125 = !{i64 621}
!1126 = !{i64 622}
!1127 = !{i64 623}
!1128 = !{i64 624}
!1129 = !{i64 625}
!1130 = !{i64 626}
!1131 = !{i64 627}
!1132 = !{i64 628}
!1133 = !{i64 629}
!1134 = !{i64 630}
!1135 = !{i64 631}
!1136 = !{i64 632}
!1137 = !{i64 633}
!1138 = !{i64 634}
!1139 = !{i64 635}
!1140 = !{i64 636}
!1141 = !{i64 637}
!1142 = !{i64 638}
!1143 = !{i64 639}
!1144 = !{i64 640}
!1145 = !{i64 641}
!1146 = !{i64 642}
!1147 = !{i64 643}
!1148 = !{i64 644}
!1149 = !{i64 645}
!1150 = !{i64 646}
!1151 = !{i64 647}
!1152 = !{i64 648}
!1153 = !{i64 649}
!1154 = !{i64 650}
!1155 = !{i64 651}
!1156 = !{i64 652}
!1157 = !{i64 653}
!1158 = distinct !{!1158, !1159}
!1159 = !{!"llvm.loop.name", !"upzero_label10"}
!1160 = !{i64 654}
!1161 = !{i64 655}
!1162 = !{i64 656}
!1163 = !{i64 657}
!1164 = !{i64 658}
!1165 = !{i64 659}
!1166 = !{i64 660}
!1167 = !{i64 661}
!1168 = !{i64 662}
!1169 = !{i64 663}
!1170 = !{i64 664}
!1171 = !{i64 665}
!1172 = !{i64 666}
!1173 = !{i64 667}
!1174 = !{i64 668}
!1175 = !{i64 669}
!1176 = !{i64 670}
!1177 = !{i64 671}
!1178 = !{i64 672}
!1179 = !{i64 673}
!1180 = !{i64 674}
!1181 = !{i64 675}
!1182 = !{i64 676}
!1183 = !{i64 677}
!1184 = !{i64 678}
!1185 = !{i64 679}
!1186 = !{i64 680}
!1187 = !{i64 681}
!1188 = !{i64 682}
!1189 = !{i64 683}
!1190 = !{i64 684}
!1191 = !{i64 685}
!1192 = !{i64 686}
!1193 = !{i64 687}
!1194 = !{i64 688}
!1195 = !{i64 689}
!1196 = !{i64 690}
!1197 = !{i64 691}
!1198 = !{i64 692}
!1199 = !{i64 693}
!1200 = !{i64 694}
!1201 = !{i64 695}
!1202 = !{i64 696}
!1203 = !{i64 697}
!1204 = !{i64 698}
!1205 = distinct !{!1205, !1206}
!1206 = !{!"llvm.loop.name", !"upzero_label11"}
!1207 = !{i64 699}
!1208 = !{i64 700}
!1209 = !{i64 701}
!1210 = !{i64 702}
!1211 = !{i64 703}
!1212 = !{i64 704}
!1213 = !{i64 705}
!1214 = !{i64 706}
!1215 = !{i64 707}
!1216 = !{i64 708}
!1217 = !{i64 709}
!1218 = !{i64 710}
!1219 = !{i64 711}
!1220 = !{i64 712}
!1221 = !{i64 713}
!1222 = !{i64 714}
!1223 = !{i64 715}
!1224 = !{i64 716}
!1225 = !{i64 717}
!1226 = !{i64 718}
!1227 = !{i64 719}
!1228 = !{i64 720}
!1229 = !{i64 721}
!1230 = !{i64 722}
!1231 = !{i64 723}
!1232 = !{i64 724}
!1233 = !{i64 725}
!1234 = !{i64 726}
!1235 = !{i64 727}
!1236 = !{i64 728}
!1237 = !{i64 729}
!1238 = !{i64 730}
!1239 = !{i64 731}
!1240 = !{i64 732}
!1241 = !{i64 733}
!1242 = !{i64 734}
!1243 = !{i64 735}
!1244 = !{i64 736}
!1245 = !{i64 737}
!1246 = !{i64 738}
!1247 = !{i64 739}
!1248 = !{i64 740}
!1249 = !{i64 741}
!1250 = !{i64 742}
!1251 = !{i64 743}
!1252 = !{i64 744}
!1253 = !{i64 745}
!1254 = !{i64 746}
!1255 = !{i64 747}
!1256 = !{i64 748}
!1257 = !{i64 749}
!1258 = !{i64 750}
!1259 = !{i64 751}
!1260 = !{i64 752}
!1261 = !{i64 753}
!1262 = !{i64 754}
!1263 = !{i64 755}
!1264 = !{i64 756}
!1265 = !{i64 757}
!1266 = !{i64 758}
!1267 = !{i64 759}
!1268 = !{i64 760}
!1269 = !{i64 761}
!1270 = !{i64 762}
!1271 = !{i64 763}
!1272 = !{i64 764}
!1273 = !{i64 765}
!1274 = !{i64 766}
!1275 = !{i64 767}
!1276 = !{i64 768}
!1277 = !{i64 769}
!1278 = !{i64 770}
!1279 = !{i64 771}
!1280 = !{i64 772}
!1281 = !{i64 773}
!1282 = !{i64 774}
!1283 = !{i64 775}
!1284 = !{i64 776}
!1285 = !{i64 777}
!1286 = !{i64 778}
!1287 = !{i64 779}
!1288 = !{i64 780}
!1289 = !{i64 781}
!1290 = !{i64 782}
!1291 = !{i64 783}
!1292 = !{i64 784}
!1293 = !{i64 785}
!1294 = !{i64 786}
!1295 = !{i64 787}
!1296 = !{i64 788}
!1297 = !{i64 789}
!1298 = !{i64 790}
!1299 = !{i64 791}
!1300 = !{i64 792}
!1301 = !{i64 793}
!1302 = !{i64 794}
!1303 = !{i64 795}
!1304 = !{i64 796}
!1305 = !{i64 797}
!1306 = !{i64 798}
!1307 = !{i64 799}
!1308 = !{i64 800}
!1309 = !{i64 801}
!1310 = !{i64 802}
!1311 = !{i64 803}
!1312 = !{i64 804}
!1313 = !{i64 805}
!1314 = !{i64 806}
!1315 = !{i64 807}
!1316 = !{i64 808}
!1317 = !{i64 809}
!1318 = !{i64 810}
!1319 = !{i64 811}
!1320 = !{i64 812}
!1321 = !{i64 813}
!1322 = !{i64 814}
!1323 = !{i64 815}
!1324 = !{i64 816}
!1325 = !{i64 817}
!1326 = !{i64 818}
!1327 = !{i64 819}
!1328 = !{i64 820}
!1329 = !{i64 821}
!1330 = !{i64 822}
!1331 = !{i64 823}
!1332 = !{i64 824}
!1333 = !{i64 825}
!1334 = !{i32 7}
!1335 = !{i64 826}
!1336 = !{i64 827}
!1337 = !{i64 828}
!1338 = !{i64 829}
!1339 = !{i64 830}
!1340 = !{i64 831}
!1341 = !{i64 832}
!1342 = !{i64 833}
!1343 = !{i64 834}
!1344 = !{i64 835}
!1345 = !{i64 836}
!1346 = !{i64 837}
!1347 = !{i64 838}
!1348 = !{i64 839}
!1349 = !{i64 840}
!1350 = !{i64 841}
!1351 = !{i64 842}
!1352 = !{i64 843}
!1353 = !{i64 844}
!1354 = !{i64 845}
!1355 = !{i64 846}
!1356 = !{i64 847}
!1357 = !{i64 848}
!1358 = !{i64 849}
!1359 = !{i64 850}
!1360 = !{i64 851}
!1361 = !{i64 852}
!1362 = !{i64 853}
!1363 = !{i64 854}
!1364 = !{i64 855}
!1365 = !{i64 856}
!1366 = !{i64 857}
!1367 = !{i64 858}
!1368 = !{i64 859}
!1369 = !{i64 860}
!1370 = !{i64 861}
!1371 = !{i64 862}
!1372 = !{i64 863}
!1373 = !{i64 864}
!1374 = !{i64 865}
!1375 = !{i64 866}
!1376 = !{i64 867}
!1377 = !{i64 868}
!1378 = !{i64 869}
!1379 = !{i64 870}
!1380 = !{i64 871}
!1381 = !{i64 872}
!1382 = !{i64 873}
!1383 = !{i64 874}
!1384 = !{i64 875}
!1385 = !{i64 876}
!1386 = !{i64 877}
!1387 = !{i64 878}
!1388 = !{i64 879}
!1389 = !{i64 880}
!1390 = !{i64 881}
!1391 = !{i64 882}
!1392 = !{i64 883}
!1393 = !{i64 884}
!1394 = !{i64 885}
!1395 = !{i64 886}
!1396 = !{i64 887}
!1397 = !{i64 888}
!1398 = !{i64 889}
!1399 = !{i64 890}
!1400 = !{i64 891}
!1401 = !{i64 892}
!1402 = !{i64 893}
!1403 = !{i64 894}
!1404 = !{i64 895}
!1405 = !{i64 896}
!1406 = !{i64 897}
!1407 = !{i64 898}
!1408 = !{i64 899}
!1409 = !{i64 900}
!1410 = !{i64 901}
!1411 = !{i64 902}
!1412 = !{i64 903}
!1413 = !{i64 904}
!1414 = !{i64 905}
!1415 = !{i64 906}
!1416 = !{i64 907}
!1417 = !{i64 908}
!1418 = !{i64 909}
!1419 = !{i64 910}
!1420 = !{i64 911}
!1421 = !{i64 912}
!1422 = !{i64 913}
!1423 = !{i64 914}
!1424 = !{i64 915}
!1425 = !{i64 916}
!1426 = !{i64 917}
!1427 = !{i64 918}
!1428 = !{i64 919}
!1429 = !{i64 467}
!1430 = !{i64 468}
!1431 = !{i64 469}
!1432 = !{i64 470}
!1433 = !{i64 471}
!1434 = !{i64 472}
!1435 = !{i64 473}
!1436 = !{i64 474}
!1437 = !{i64 475}
!1438 = !{i64 476}
!1439 = !{i64 477}
!1440 = !{i64 478}
!1441 = !{i64 479}
!1442 = !{i64 480}
!1443 = !{i64 481}
!1444 = !{i64 482}
!1445 = !{i64 483}
!1446 = !{i64 484}
!1447 = !{i64 485}
!1448 = !{i64 486}
!1449 = !{i64 487}
!1450 = !{i64 488}
!1451 = !{i64 489}
!1452 = !{i64 490}
!1453 = !{i64 491}
!1454 = !{i64 492}
!1455 = !{i64 493}
!1456 = !{i64 494}
!1457 = !{i64 495}
!1458 = !{i64 496}
!1459 = !{i64 497}
!1460 = !{i64 498}
!1461 = !{i64 499}
!1462 = !{i64 500}
!1463 = !{i64 501}
!1464 = !{i64 502}
!1465 = !{i64 503}
!1466 = !{i64 504}
!1467 = !{i64 505}
!1468 = !{i64 506}
!1469 = !{i64 507}
!1470 = !{i64 508}
!1471 = !{i64 509}
!1472 = !{i64 510}
!1473 = !{i64 511}
!1474 = distinct !{!1474, !1475}
!1475 = !{!"llvm.loop.name", !"quantl_label9"}
!1476 = !{i64 512}
!1477 = !{i64 513}
!1478 = !{i64 514}
!1479 = !{i64 515}
!1480 = !{i64 516}
!1481 = !{i64 517}
!1482 = !{i64 518}
!1483 = !{i64 519}
!1484 = !{i64 520}
!1485 = !{i64 521}
!1486 = !{i64 522}
!1487 = !{i64 523}
!1488 = !{i64 524}
!1489 = !{i64 525}
!1490 = !{i64 526}
!1491 = !{i64 527}
!1492 = !{i64 528}
!1493 = !{i64 529}
!1494 = !{i64 530}
!1495 = !{i64 531}
!1496 = !{i64 532}
!1497 = !{i64 533}
!1498 = !{i64 534}
!1499 = !{i64 535}
!1500 = !{i64 536}
!1501 = !{i64 537}
!1502 = !{i64 17}
!1503 = !{i64 18}
!1504 = !{i64 19}
!1505 = !{i64 20}
!1506 = !{i64 21}
!1507 = !{i64 22}
!1508 = !{i64 23}
!1509 = !{i64 24}
!1510 = !{i64 25}
!1511 = !{i64 26}
!1512 = !{i64 27}
!1513 = !{i64 28}
!1514 = !{i64 29}
!1515 = !{i64 30}
!1516 = !{i64 31}
!1517 = !{i64 32}
!1518 = !{i64 33}
!1519 = !{i64 34}
!1520 = !{i64 35}
