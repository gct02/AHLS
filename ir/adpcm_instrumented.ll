; ModuleID = 'adpcm_instrumented.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.BinOpInfo = type { i32, i32, i8, i8, i32, i32, double, double, double, double, double, %struct.BinOpInfo* }
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
@.str.2 = private unnamed_addr constant [38 x i8] c"%u|%u|%u|%u|%u|%u|%u|%lf|%lf|%lf|%lf\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1.8 = private unnamed_addr constant [3 x i8] c"%x\00", align 1
@.str.2.11 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"_raw\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4, !opID !5, !opSignedness !6
  call void @profOp(i64 1, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %argc.addr = alloca i32, align 4, !opID !7, !opSignedness !6
  call void @profOp(i64 2, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %argv.addr = alloca i8**, align 8, !opID !8, !opSignedness !6
  call void @profOp(i64 3, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 3, i1 false)
  store i32 0, i32* %retval, align 4, !opID !9, !opSignedness !6
  call void @profOp(i64 4, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %argc, i32* %argc.addr, align 4, !opID !10, !opSignedness !6
  call void @profOp(i64 5, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i8** %argv, i8*** %argv.addr, align 8, !opID !11, !opSignedness !6
  call void @profOp(i64 6, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %0 = load i8**, i8*** %argv.addr, align 8, !opID !12, !opSignedness !6
  call void @profOp(i64 7, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1, !opID !13, !opSignedness !6
  call void @profOp(i64 8, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %1 = load i8*, i8** %arrayidx, align 8, !opID !14, !opSignedness !6
  call void @profOp(i64 9, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @populateInput(i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @test_data, i32 0, i32 0), i32 8000, i8* %1), !opID !15, !opSignedness !6
  call void @profOp(i64 10, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @adpcm_main(i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @test_data, i32 0, i32 0), i32* getelementptr inbounds ([4000 x i32], [4000 x i32]* @compressed, i32 0, i32 0), i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @result, i32 0, i32 0)), !opID !16, !opSignedness !6
  call void @profOp(i64 11, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %2 = load i8**, i8*** %argv.addr, align 8, !opID !17, !opSignedness !6
  call void @profOp(i64 12, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2, !opID !18, !opSignedness !6
  call void @profOp(i64 13, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %3 = load i8*, i8** %arrayidx1, align 8, !opID !19, !opSignedness !6
  call void @profOp(i64 14, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @populateOutput(i32* getelementptr inbounds ([8000 x i32], [8000 x i32]* @result, i32 0, i32 0), i32 4000, i8* %3), !opID !20, !opSignedness !6
  call void @profOp(i64 15, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @saveProfile(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @profileFileName, i32 0, i32 0))
  ret i32 0, !opID !21, !opSignedness !6
}

; Function Attrs: nounwind
define void @adpcm_main(i32* "fpga.decayed.dim.hint"="8000" %input_samples, i32* "fpga.decayed.dim.hint"="4000" %compressed, i32* "fpga.decayed.dim.hint"="8000" %result) #1 !fpga.function.pragma !22 {
entry:
  %input_samples.addr = alloca i32*, align 8, !opID !24, !opSignedness !6
  call void @profOp(i64 1372, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 3, i1 false)
  %compressed.addr = alloca i32*, align 8, !opID !25, !opSignedness !6
  call void @profOp(i64 1373, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 3, i1 false)
  %result.addr = alloca i32*, align 8, !opID !26, !opSignedness !6
  call void @profOp(i64 1374, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 3, i1 false)
  %i = alloca i32, align 4, !opID !27, !opSignedness !6
  call void @profOp(i64 1375, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 16, i1 false)
  %j = alloca i32, align 4, !opID !28, !opSignedness !6
  call void @profOp(i64 1376, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 3, i1 false)
  store i32* %input_samples, i32** %input_samples.addr, align 8, !opID !29, !opSignedness !6
  call void @profOp(i64 1377, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32* %compressed, i32** %compressed.addr, align 8, !opID !30, !opSignedness !6
  call void @profOp(i64 1378, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32* %result, i32** %result.addr, align 8, !opID !31, !opSignedness !6
  call void @profOp(i64 1379, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %0 = bitcast i32* %i to i8*, !opID !32, !opSignedness !6
  call void @profOp(i64 1380, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !33, !opSignedness !6
  call void @profOp(i64 1381, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %1 = bitcast i32* %j to i8*, !opID !34, !opSignedness !6
  call void @profOp(i64 1382, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #8, !opID !35, !opSignedness !6
  call void @profOp(i64 1383, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @reset(), !opID !36, !opSignedness !6
  call void @profOp(i64 1384, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 10, i32* %j, align 4, !opID !37, !opSignedness !6
  call void @profOp(i64 1385, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %adpcm_main_label12, !opID !38, !opSignedness !6

adpcm_main_label12:                               ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !39, !opSignedness !6
  call void @profOp(i64 1387, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond, !opID !40, !opSignedness !6

for.cond:                                         ; preds = %for.inc, %adpcm_main_label12
  %2 = load i32, i32* %i, align 4, !opID !41, !opSignedness !6
  call void @profOp(i64 1389, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp = icmp slt i32 %2, 8000, !opID !42, !opSignedness !6
  call void @profOp(i64 1390, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp, label %for.body, label %for.end, !opID !43, !opSignedness !6

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %input_samples.addr, align 8, !opID !44, !opSignedness !6
  call void @profOp(i64 1392, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %4 = load i32, i32* %i, align 4, !opID !45, !opSignedness !6
  call void @profOp(i64 1393, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom = sext i32 %4 to i64, !opID !46, !opSignedness !6
  call void @profOp(i64 1394, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !opID !47, !opSignedness !6
  call void @profOp(i64 1395, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %5 = load i32, i32* %arrayidx, align 4, !opID !48, !opSignedness !6
  call void @profOp(i64 1396, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %6 = load i32*, i32** %input_samples.addr, align 8, !opID !49, !opSignedness !6
  call void @profOp(i64 1397, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %7 = load i32, i32* %i, align 4, !opID !50, !opSignedness !6
  call void @profOp(i64 1398, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add = add i32 %7, 1, !opID !51, !opSignedness !6
  %8 = sext i32 %add to i64
  call void @profOp(i64 1399, i8 11, i64 %8, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %idxprom1 = sext i32 %add to i64, !opID !52, !opSignedness !6
  call void @profOp(i64 1400, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %idxprom1, !opID !53, !opSignedness !6
  call void @profOp(i64 1401, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %9 = load i32, i32* %arrayidx2, align 4, !opID !54, !opSignedness !6
  call void @profOp(i64 1402, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call = call i32 @encode(i32 %5, i32 %9), !opID !55, !opSignedness !6
  call void @profOp(i64 1403, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %10 = load i32*, i32** %compressed.addr, align 8, !opID !56, !opSignedness !6
  call void @profOp(i64 1404, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %11 = load i32, i32* %i, align 4, !opID !57, !opSignedness !6
  call void @profOp(i64 1405, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %div = sdiv i32 %11, 2, !opID !58, !opSignedness !6
  %12 = sext i32 %div to i64
  call void @profOp(i64 1406, i8 18, i64 %12, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %idxprom3 = sext i32 %div to i64, !opID !59, !opSignedness !6
  call void @profOp(i64 1407, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx4 = getelementptr inbounds i32, i32* %10, i64 %idxprom3, !opID !60, !opSignedness !6
  call void @profOp(i64 1408, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 %call, i32* %arrayidx4, align 4, !opID !61, !opSignedness !6
  call void @profOp(i64 1409, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.inc, !opID !62, !opSignedness !6

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4, !opID !63, !opSignedness !6
  call void @profOp(i64 1411, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add5 = add i32 %13, 2, !opID !64, !opSignedness !6
  %14 = sext i32 %add5 to i64
  call void @profOp(i64 1412, i8 11, i64 %14, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add5, i32* %i, align 4, !opID !65, !opSignedness !6
  call void @profOp(i64 1413, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond, !llvm.loop !66, !opID !68, !opSignedness !6

for.end:                                          ; preds = %for.cond
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %adpcm_main_label13, !opID !69, !opSignedness !6

adpcm_main_label13:                               ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !70, !opSignedness !6
  call void @profOp(i64 1416, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond6, !opID !71, !opSignedness !6

for.cond6:                                        ; preds = %for.inc17, %adpcm_main_label13
  %15 = load i32, i32* %i, align 4, !opID !72, !opSignedness !6
  call void @profOp(i64 1418, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp7 = icmp slt i32 %15, 8000, !opID !73, !opSignedness !6
  call void @profOp(i64 1419, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp7, label %for.body8, label %for.end19, !opID !74, !opSignedness !6

for.body8:                                        ; preds = %for.cond6
  %16 = load i32*, i32** %compressed.addr, align 8, !opID !75, !opSignedness !6
  call void @profOp(i64 1421, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %17 = load i32, i32* %i, align 4, !opID !76, !opSignedness !6
  call void @profOp(i64 1422, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %div9 = sdiv i32 %17, 2, !opID !77, !opSignedness !6
  %18 = sext i32 %div9 to i64
  call void @profOp(i64 1423, i8 18, i64 %18, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %idxprom10 = sext i32 %div9 to i64, !opID !78, !opSignedness !6
  call void @profOp(i64 1424, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx11 = getelementptr inbounds i32, i32* %16, i64 %idxprom10, !opID !79, !opSignedness !6
  call void @profOp(i64 1425, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %19 = load i32, i32* %arrayidx11, align 4, !opID !80, !opSignedness !6
  call void @profOp(i64 1426, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  call void @decode(i32 %19), !opID !81, !opSignedness !6
  call void @profOp(i64 1427, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %20 = load i32, i32* @xout1, align 4, !opID !82, !opSignedness !6
  call void @profOp(i64 1428, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %21 = load i32*, i32** %result.addr, align 8, !opID !83, !opSignedness !6
  call void @profOp(i64 1429, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %22 = load i32, i32* %i, align 4, !opID !84, !opSignedness !6
  call void @profOp(i64 1430, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom12 = sext i32 %22 to i64, !opID !85, !opSignedness !6
  call void @profOp(i64 1431, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx13 = getelementptr inbounds i32, i32* %21, i64 %idxprom12, !opID !86, !opSignedness !6
  call void @profOp(i64 1432, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 %20, i32* %arrayidx13, align 4, !opID !87, !opSignedness !6
  call void @profOp(i64 1433, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %23 = load i32, i32* @xout2, align 4, !opID !88, !opSignedness !6
  call void @profOp(i64 1434, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %24 = load i32*, i32** %result.addr, align 8, !opID !89, !opSignedness !6
  call void @profOp(i64 1435, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %25 = load i32, i32* %i, align 4, !opID !90, !opSignedness !6
  call void @profOp(i64 1436, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add14 = add i32 %25, 1, !opID !91, !opSignedness !6
  %26 = sext i32 %add14 to i64
  call void @profOp(i64 1437, i8 11, i64 %26, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %idxprom15 = sext i32 %add14 to i64, !opID !92, !opSignedness !6
  call void @profOp(i64 1438, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx16 = getelementptr inbounds i32, i32* %24, i64 %idxprom15, !opID !93, !opSignedness !6
  call void @profOp(i64 1439, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 %23, i32* %arrayidx16, align 4, !opID !94, !opSignedness !6
  call void @profOp(i64 1440, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.inc17, !opID !95, !opSignedness !6

for.inc17:                                        ; preds = %for.body8
  %27 = load i32, i32* %i, align 4, !opID !96, !opSignedness !6
  call void @profOp(i64 1442, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add18 = add i32 %27, 2, !opID !97, !opSignedness !6
  %28 = sext i32 %add18 to i64
  call void @profOp(i64 1443, i8 11, i64 %28, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add18, i32* %i, align 4, !opID !98, !opSignedness !6
  call void @profOp(i64 1444, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond6, !llvm.loop !99, !opID !101, !opSignedness !6

for.end19:                                        ; preds = %for.cond6
  %29 = bitcast i32* %j to i8*, !opID !102, !opSignedness !6
  call void @profOp(i64 1446, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #8, !opID !103, !opSignedness !6
  call void @profOp(i64 1447, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %30 = bitcast i32* %i to i8*, !opID !104, !opSignedness !6
  call void @profOp(i64 1448, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %30) #8, !opID !105, !opSignedness !6
  call void @profOp(i64 1449, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  ret void, !opID !1, !opSignedness !6
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
define void @reset() #3 {
entry:
  %i = alloca i32, align 4, !opID !106, !opSignedness !6
  call void @profOp(i64 1246, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 29, i1 false)
  %0 = bitcast i32* %i to i8*, !opID !107, !opSignedness !6
  call void @profOp(i64 1247, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !108, !opSignedness !6
  call void @profOp(i64 1248, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 32, i32* @dec_detl, align 4, !opID !109, !opSignedness !6
  call void @profOp(i64 1249, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 32, i32* @detl, align 4, !opID !110, !opSignedness !6
  call void @profOp(i64 1250, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 8, i32* @dec_deth, align 4, !opID !111, !opSignedness !6
  call void @profOp(i64 1251, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 8, i32* @deth, align 4, !opID !112, !opSignedness !6
  call void @profOp(i64 1252, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @rlt2, align 4, !opID !113, !opSignedness !6
  call void @profOp(i64 1253, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @rlt1, align 4, !opID !114, !opSignedness !6
  call void @profOp(i64 1254, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @plt2, align 4, !opID !115, !opSignedness !6
  call void @profOp(i64 1255, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @plt1, align 4, !opID !116, !opSignedness !6
  call void @profOp(i64 1256, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @al2, align 4, !opID !117, !opSignedness !6
  call void @profOp(i64 1257, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @al1, align 4, !opID !118, !opSignedness !6
  call void @profOp(i64 1258, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @nbl, align 4, !opID !119, !opSignedness !6
  call void @profOp(i64 1259, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @rh2, align 4, !opID !120, !opSignedness !6
  call void @profOp(i64 1260, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @rh1, align 4, !opID !121, !opSignedness !6
  call void @profOp(i64 1261, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @ph2, align 4, !opID !122, !opSignedness !6
  call void @profOp(i64 1262, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @ph1, align 4, !opID !123, !opSignedness !6
  call void @profOp(i64 1263, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @ah2, align 4, !opID !124, !opSignedness !6
  call void @profOp(i64 1264, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @ah1, align 4, !opID !125, !opSignedness !6
  call void @profOp(i64 1265, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @nbh, align 4, !opID !126, !opSignedness !6
  call void @profOp(i64 1266, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @dec_rlt2, align 4, !opID !127, !opSignedness !6
  call void @profOp(i64 1267, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @dec_rlt1, align 4, !opID !128, !opSignedness !6
  call void @profOp(i64 1268, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @dec_plt2, align 4, !opID !129, !opSignedness !6
  call void @profOp(i64 1269, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @dec_plt1, align 4, !opID !130, !opSignedness !6
  call void @profOp(i64 1270, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @dec_al2, align 4, !opID !131, !opSignedness !6
  call void @profOp(i64 1271, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @dec_al1, align 4, !opID !132, !opSignedness !6
  call void @profOp(i64 1272, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @dec_nbl, align 4, !opID !133, !opSignedness !6
  call void @profOp(i64 1273, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @dec_rh2, align 4, !opID !134, !opSignedness !6
  call void @profOp(i64 1274, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @dec_rh1, align 4, !opID !135, !opSignedness !6
  call void @profOp(i64 1275, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @dec_ph2, align 4, !opID !136, !opSignedness !6
  call void @profOp(i64 1276, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @dec_ph1, align 4, !opID !137, !opSignedness !6
  call void @profOp(i64 1277, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @dec_ah2, align 4, !opID !138, !opSignedness !6
  call void @profOp(i64 1278, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @dec_ah1, align 4, !opID !139, !opSignedness !6
  call void @profOp(i64 1279, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 0, i32* @dec_nbh, align 4, !opID !140, !opSignedness !6
  call void @profOp(i64 1280, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %reset_label4, !opID !141, !opSignedness !6

reset_label4:                                     ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !142, !opSignedness !6
  call void @profOp(i64 1282, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond, !opID !143, !opSignedness !6

for.cond:                                         ; preds = %for.inc, %reset_label4
  %1 = load i32, i32* %i, align 4, !opID !144, !opSignedness !6
  call void @profOp(i64 1284, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp = icmp slt i32 %1, 6, !opID !145, !opSignedness !6
  call void @profOp(i64 1285, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp, label %for.body, label %for.end, !opID !146, !opSignedness !6

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !opID !147, !opSignedness !6
  call void @profOp(i64 1287, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom = sext i32 %2 to i64, !opID !148, !opSignedness !6
  call void @profOp(i64 1288, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dltx, i64 0, i64 %idxprom, !opID !149, !opSignedness !6
  call void @profOp(i64 1289, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 0, i32* %arrayidx, align 4, !opID !150, !opSignedness !6
  call void @profOp(i64 1290, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %3 = load i32, i32* %i, align 4, !opID !151, !opSignedness !6
  call void @profOp(i64 1291, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom1 = sext i32 %3 to i64, !opID !152, !opSignedness !6
  call void @profOp(i64 1292, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx2 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dhx, i64 0, i64 %idxprom1, !opID !153, !opSignedness !6
  call void @profOp(i64 1293, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 0, i32* %arrayidx2, align 4, !opID !154, !opSignedness !6
  call void @profOp(i64 1294, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %4 = load i32, i32* %i, align 4, !opID !155, !opSignedness !6
  call void @profOp(i64 1295, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom3 = sext i32 %4 to i64, !opID !156, !opSignedness !6
  call void @profOp(i64 1296, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx4 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dltx, i64 0, i64 %idxprom3, !opID !157, !opSignedness !6
  call void @profOp(i64 1297, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 0, i32* %arrayidx4, align 4, !opID !158, !opSignedness !6
  call void @profOp(i64 1298, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %5 = load i32, i32* %i, align 4, !opID !159, !opSignedness !6
  call void @profOp(i64 1299, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom5 = sext i32 %5 to i64, !opID !160, !opSignedness !6
  call void @profOp(i64 1300, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx6 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dhx, i64 0, i64 %idxprom5, !opID !161, !opSignedness !6
  call void @profOp(i64 1301, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 0, i32* %arrayidx6, align 4, !opID !162, !opSignedness !6
  call void @profOp(i64 1302, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.inc, !opID !163, !opSignedness !6

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !opID !164, !opSignedness !6
  call void @profOp(i64 1304, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %inc = add i32 %6, 1, !opID !165, !opSignedness !6
  %7 = sext i32 %inc to i64
  call void @profOp(i64 1305, i8 11, i64 %7, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %inc, i32* %i, align 4, !opID !166, !opSignedness !6
  call void @profOp(i64 1306, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond, !llvm.loop !167, !opID !169, !opSignedness !6

for.end:                                          ; preds = %for.cond
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %reset_label5, !opID !170, !opSignedness !6

reset_label5:                                     ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !171, !opSignedness !6
  call void @profOp(i64 1309, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond7, !opID !172, !opSignedness !6

for.cond7:                                        ; preds = %for.inc18, %reset_label5
  %8 = load i32, i32* %i, align 4, !opID !173, !opSignedness !6
  call void @profOp(i64 1311, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp8 = icmp slt i32 %8, 6, !opID !174, !opSignedness !6
  call void @profOp(i64 1312, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp8, label %for.body9, label %for.end20, !opID !175, !opSignedness !6

for.body9:                                        ; preds = %for.cond7
  %9 = load i32, i32* %i, align 4, !opID !176, !opSignedness !6
  call void @profOp(i64 1314, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom10 = sext i32 %9 to i64, !opID !177, !opSignedness !6
  call void @profOp(i64 1315, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx11 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bpl, i64 0, i64 %idxprom10, !opID !178, !opSignedness !6
  call void @profOp(i64 1316, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 0, i32* %arrayidx11, align 4, !opID !179, !opSignedness !6
  call void @profOp(i64 1317, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %10 = load i32, i32* %i, align 4, !opID !180, !opSignedness !6
  call void @profOp(i64 1318, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom12 = sext i32 %10 to i64, !opID !181, !opSignedness !6
  call void @profOp(i64 1319, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx13 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bph, i64 0, i64 %idxprom12, !opID !182, !opSignedness !6
  call void @profOp(i64 1320, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 0, i32* %arrayidx13, align 4, !opID !183, !opSignedness !6
  call void @profOp(i64 1321, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %11 = load i32, i32* %i, align 4, !opID !184, !opSignedness !6
  call void @profOp(i64 1322, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom14 = sext i32 %11 to i64, !opID !185, !opSignedness !6
  call void @profOp(i64 1323, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx15 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bpl, i64 0, i64 %idxprom14, !opID !186, !opSignedness !6
  call void @profOp(i64 1324, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 0, i32* %arrayidx15, align 4, !opID !187, !opSignedness !6
  call void @profOp(i64 1325, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %12 = load i32, i32* %i, align 4, !opID !188, !opSignedness !6
  call void @profOp(i64 1326, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom16 = sext i32 %12 to i64, !opID !189, !opSignedness !6
  call void @profOp(i64 1327, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bph, i64 0, i64 %idxprom16, !opID !190, !opSignedness !6
  call void @profOp(i64 1328, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 0, i32* %arrayidx17, align 4, !opID !191, !opSignedness !6
  call void @profOp(i64 1329, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.inc18, !opID !192, !opSignedness !6

for.inc18:                                        ; preds = %for.body9
  %13 = load i32, i32* %i, align 4, !opID !193, !opSignedness !6
  call void @profOp(i64 1331, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %inc19 = add i32 %13, 1, !opID !194, !opSignedness !6
  %14 = sext i32 %inc19 to i64
  call void @profOp(i64 1332, i8 11, i64 %14, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %inc19, i32* %i, align 4, !opID !195, !opSignedness !6
  call void @profOp(i64 1333, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond7, !llvm.loop !196, !opID !198, !opSignedness !6

for.end20:                                        ; preds = %for.cond7
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %reset_label6, !opID !199, !opSignedness !6

reset_label6:                                     ; preds = %for.end20
  store i32 0, i32* %i, align 4, !opID !200, !opSignedness !6
  call void @profOp(i64 1336, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond21, !opID !201, !opSignedness !6

for.cond21:                                       ; preds = %for.inc26, %reset_label6
  %15 = load i32, i32* %i, align 4, !opID !202, !opSignedness !6
  call void @profOp(i64 1338, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp22 = icmp slt i32 %15, 24, !opID !203, !opSignedness !6
  call void @profOp(i64 1339, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp22, label %for.body23, label %for.end28, !opID !204, !opSignedness !6

for.body23:                                       ; preds = %for.cond21
  %16 = load i32, i32* %i, align 4, !opID !205, !opSignedness !6
  call void @profOp(i64 1341, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom24 = sext i32 %16 to i64, !opID !206, !opSignedness !6
  call void @profOp(i64 1342, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx25 = getelementptr inbounds [24 x i32], [24 x i32]* @tqmf, i64 0, i64 %idxprom24, !opID !207, !opSignedness !6
  call void @profOp(i64 1343, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 0, i32* %arrayidx25, align 4, !opID !208, !opSignedness !6
  call void @profOp(i64 1344, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.inc26, !opID !209, !opSignedness !6

for.inc26:                                        ; preds = %for.body23
  %17 = load i32, i32* %i, align 4, !opID !210, !opSignedness !6
  call void @profOp(i64 1346, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %inc27 = add i32 %17, 1, !opID !211, !opSignedness !6
  %18 = sext i32 %inc27 to i64
  call void @profOp(i64 1347, i8 11, i64 %18, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %inc27, i32* %i, align 4, !opID !212, !opSignedness !6
  call void @profOp(i64 1348, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond21, !llvm.loop !213, !opID !215, !opSignedness !6

for.end28:                                        ; preds = %for.cond21
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %reset_label7, !opID !216, !opSignedness !6

reset_label7:                                     ; preds = %for.end28
  store i32 0, i32* %i, align 4, !opID !217, !opSignedness !6
  call void @profOp(i64 1351, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond29, !opID !218, !opSignedness !6

for.cond29:                                       ; preds = %for.inc36, %reset_label7
  %19 = load i32, i32* %i, align 4, !opID !219, !opSignedness !6
  call void @profOp(i64 1353, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp30 = icmp slt i32 %19, 11, !opID !220, !opSignedness !6
  call void @profOp(i64 1354, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp30, label %for.body31, label %for.end38, !opID !221, !opSignedness !6

for.body31:                                       ; preds = %for.cond29
  %20 = load i32, i32* %i, align 4, !opID !222, !opSignedness !6
  call void @profOp(i64 1356, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom32 = sext i32 %20 to i64, !opID !223, !opSignedness !6
  call void @profOp(i64 1357, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx33 = getelementptr inbounds [11 x i32], [11 x i32]* @accumc, i64 0, i64 %idxprom32, !opID !224, !opSignedness !6
  call void @profOp(i64 1358, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 0, i32* %arrayidx33, align 4, !opID !225, !opSignedness !6
  call void @profOp(i64 1359, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %21 = load i32, i32* %i, align 4, !opID !226, !opSignedness !6
  call void @profOp(i64 1360, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom34 = sext i32 %21 to i64, !opID !227, !opSignedness !6
  call void @profOp(i64 1361, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx35 = getelementptr inbounds [11 x i32], [11 x i32]* @accumd, i64 0, i64 %idxprom34, !opID !228, !opSignedness !6
  call void @profOp(i64 1362, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 0, i32* %arrayidx35, align 4, !opID !229, !opSignedness !6
  call void @profOp(i64 1363, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.inc36, !opID !230, !opSignedness !6

for.inc36:                                        ; preds = %for.body31
  %22 = load i32, i32* %i, align 4, !opID !231, !opSignedness !6
  call void @profOp(i64 1365, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %inc37 = add i32 %22, 1, !opID !232, !opSignedness !6
  %23 = sext i32 %inc37 to i64
  call void @profOp(i64 1366, i8 11, i64 %23, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %inc37, i32* %i, align 4, !opID !233, !opSignedness !6
  call void @profOp(i64 1367, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond29, !llvm.loop !234, !opID !236, !opSignedness !6

for.end38:                                        ; preds = %for.cond29
  %24 = bitcast i32* %i to i8*, !opID !237, !opSignedness !6
  call void @profOp(i64 1369, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %24) #8, !opID !238, !opSignedness !6
  call void @profOp(i64 1370, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  ret void, !opID !239, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @encode(i32 %xin1, i32 %xin2) #3 {
entry:
  %xin1.addr = alloca i32, align 4, !opID !240, !opSignedness !6
  call void @profOp(i64 36, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %xin2.addr = alloca i32, align 4, !opID !241, !opSignedness !6
  call void @profOp(i64 37, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %i = alloca i32, align 4, !opID !242, !opSignedness !6
  call void @profOp(i64 38, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 10, i1 false)
  %h_ptr = alloca i32*, align 8, !opID !243, !opSignedness !6
  call void @profOp(i64 39, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 15, i1 false)
  %tqmf_ptr = alloca i32*, align 8, !opID !244, !opSignedness !6
  call void @profOp(i64 40, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 20, i1 false)
  %tqmf_ptr1 = alloca i32*, align 8, !opID !245, !opSignedness !6
  call void @profOp(i64 41, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 5, i1 false)
  %xa = alloca i64, align 8, !opID !246, !opSignedness !6
  call void @profOp(i64 42, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 9, i1 false)
  %xb = alloca i64, align 8, !opID !247, !opSignedness !6
  call void @profOp(i64 43, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 9, i1 false)
  %decis = alloca i32, align 4, !opID !248, !opSignedness !6
  call void @profOp(i64 44, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 4, i1 false)
  store i32 %xin1, i32* %xin1.addr, align 4, !opID !249, !opSignedness !6
  call void @profOp(i64 45, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %xin2, i32* %xin2.addr, align 4, !opID !250, !opSignedness !6
  call void @profOp(i64 46, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %0 = bitcast i32* %i to i8*, !opID !251, !opSignedness !6
  call void @profOp(i64 47, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !252, !opSignedness !6
  call void @profOp(i64 48, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %1 = bitcast i32** %h_ptr to i8*, !opID !253, !opSignedness !6
  call void @profOp(i64 49, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #8, !opID !254, !opSignedness !6
  call void @profOp(i64 50, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %2 = bitcast i32** %tqmf_ptr to i8*, !opID !255, !opSignedness !6
  call void @profOp(i64 51, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #8, !opID !256, !opSignedness !6
  call void @profOp(i64 52, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %3 = bitcast i32** %tqmf_ptr1 to i8*, !opID !257, !opSignedness !6
  call void @profOp(i64 53, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #8, !opID !258, !opSignedness !6
  call void @profOp(i64 54, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %4 = bitcast i64* %xa to i8*, !opID !259, !opSignedness !6
  call void @profOp(i64 55, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #8, !opID !260, !opSignedness !6
  call void @profOp(i64 56, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %5 = bitcast i64* %xb to i8*, !opID !261, !opSignedness !6
  call void @profOp(i64 57, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #8, !opID !262, !opSignedness !6
  call void @profOp(i64 58, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %6 = bitcast i32* %decis to i8*, !opID !263, !opSignedness !6
  call void @profOp(i64 59, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #8, !opID !264, !opSignedness !6
  call void @profOp(i64 60, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 8, !opID !265, !opSignedness !6
  call void @profOp(i64 61, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 0), i32** %tqmf_ptr, align 8, !opID !266, !opSignedness !6
  call void @profOp(i64 62, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %7 = load i32*, i32** %tqmf_ptr, align 8, !opID !267, !opSignedness !6
  call void @profOp(i64 63, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr = getelementptr inbounds i32, i32* %7, i32 1, !opID !268, !opSignedness !6
  call void @profOp(i64 64, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr, i32** %tqmf_ptr, align 8, !opID !269, !opSignedness !6
  call void @profOp(i64 65, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %8 = load i32, i32* %7, align 4, !opID !270, !opSignedness !6
  call void @profOp(i64 66, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv = sext i32 %8 to i64, !opID !271, !opSignedness !6
  call void @profOp(i64 67, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %9 = load i32*, i32** %h_ptr, align 8, !opID !272, !opSignedness !6
  call void @profOp(i64 68, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr1 = getelementptr inbounds i32, i32* %9, i32 1, !opID !273, !opSignedness !6
  call void @profOp(i64 69, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr1, i32** %h_ptr, align 8, !opID !274, !opSignedness !6
  call void @profOp(i64 70, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %10 = load i32, i32* %9, align 4, !opID !275, !opSignedness !6
  call void @profOp(i64 71, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv2 = sext i32 %10 to i64, !opID !276, !opSignedness !6
  call void @profOp(i64 72, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul = mul i64 %conv, %conv2, !opID !277, !opSignedness !6
  call void @profOp(i64 73, i8 15, i64 %mul, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %mul, i64* %xa, align 8, !opID !278, !opSignedness !6
  call void @profOp(i64 74, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %11 = load i32*, i32** %tqmf_ptr, align 8, !opID !279, !opSignedness !6
  call void @profOp(i64 75, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr3 = getelementptr inbounds i32, i32* %11, i32 1, !opID !280, !opSignedness !6
  call void @profOp(i64 76, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr3, i32** %tqmf_ptr, align 8, !opID !281, !opSignedness !6
  call void @profOp(i64 77, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %12 = load i32, i32* %11, align 4, !opID !282, !opSignedness !6
  call void @profOp(i64 78, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv4 = sext i32 %12 to i64, !opID !283, !opSignedness !6
  call void @profOp(i64 79, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %13 = load i32*, i32** %h_ptr, align 8, !opID !284, !opSignedness !6
  call void @profOp(i64 80, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr5 = getelementptr inbounds i32, i32* %13, i32 1, !opID !285, !opSignedness !6
  call void @profOp(i64 81, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr5, i32** %h_ptr, align 8, !opID !286, !opSignedness !6
  call void @profOp(i64 82, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %14 = load i32, i32* %13, align 4, !opID !287, !opSignedness !6
  call void @profOp(i64 83, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv6 = sext i32 %14 to i64, !opID !288, !opSignedness !6
  call void @profOp(i64 84, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul7 = mul i64 %conv4, %conv6, !opID !289, !opSignedness !6
  call void @profOp(i64 85, i8 15, i64 %mul7, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %mul7, i64* %xb, align 8, !opID !290, !opSignedness !6
  call void @profOp(i64 86, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %encode_label0, !opID !291, !opSignedness !6

encode_label0:                                    ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !292, !opSignedness !6
  call void @profOp(i64 88, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond, !opID !293, !opSignedness !6

for.cond:                                         ; preds = %for.inc, %encode_label0
  %15 = load i32, i32* %i, align 4, !opID !294, !opSignedness !6
  call void @profOp(i64 90, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp = icmp slt i32 %15, 10, !opID !295, !opSignedness !6
  call void @profOp(i64 91, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp, label %for.body, label %for.end, !opID !296, !opSignedness !6

for.body:                                         ; preds = %for.cond
  %16 = load i32*, i32** %tqmf_ptr, align 8, !opID !297, !opSignedness !6
  call void @profOp(i64 93, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr8 = getelementptr inbounds i32, i32* %16, i32 1, !opID !298, !opSignedness !6
  call void @profOp(i64 94, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr8, i32** %tqmf_ptr, align 8, !opID !299, !opSignedness !6
  call void @profOp(i64 95, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %17 = load i32, i32* %16, align 4, !opID !300, !opSignedness !6
  call void @profOp(i64 96, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv9 = sext i32 %17 to i64, !opID !301, !opSignedness !6
  call void @profOp(i64 97, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %18 = load i32*, i32** %h_ptr, align 8, !opID !302, !opSignedness !6
  call void @profOp(i64 98, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr10 = getelementptr inbounds i32, i32* %18, i32 1, !opID !303, !opSignedness !6
  call void @profOp(i64 99, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr10, i32** %h_ptr, align 8, !opID !304, !opSignedness !6
  call void @profOp(i64 100, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %19 = load i32, i32* %18, align 4, !opID !305, !opSignedness !6
  call void @profOp(i64 101, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv11 = sext i32 %19 to i64, !opID !306, !opSignedness !6
  call void @profOp(i64 102, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul12 = mul i64 %conv9, %conv11, !opID !307, !opSignedness !6
  call void @profOp(i64 103, i8 15, i64 %mul12, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %20 = load i64, i64* %xa, align 8, !opID !308, !opSignedness !6
  call void @profOp(i64 104, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %add = add i64 %20, %mul12, !opID !309, !opSignedness !6
  call void @profOp(i64 105, i8 11, i64 %add, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %add, i64* %xa, align 8, !opID !310, !opSignedness !6
  call void @profOp(i64 106, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %21 = load i32*, i32** %tqmf_ptr, align 8, !opID !311, !opSignedness !6
  call void @profOp(i64 107, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr13 = getelementptr inbounds i32, i32* %21, i32 1, !opID !312, !opSignedness !6
  call void @profOp(i64 108, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr13, i32** %tqmf_ptr, align 8, !opID !313, !opSignedness !6
  call void @profOp(i64 109, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %22 = load i32, i32* %21, align 4, !opID !314, !opSignedness !6
  call void @profOp(i64 110, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv14 = sext i32 %22 to i64, !opID !315, !opSignedness !6
  call void @profOp(i64 111, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %23 = load i32*, i32** %h_ptr, align 8, !opID !316, !opSignedness !6
  call void @profOp(i64 112, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr15 = getelementptr inbounds i32, i32* %23, i32 1, !opID !317, !opSignedness !6
  call void @profOp(i64 113, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr15, i32** %h_ptr, align 8, !opID !318, !opSignedness !6
  call void @profOp(i64 114, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %24 = load i32, i32* %23, align 4, !opID !319, !opSignedness !6
  call void @profOp(i64 115, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv16 = sext i32 %24 to i64, !opID !320, !opSignedness !6
  call void @profOp(i64 116, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul17 = mul i64 %conv14, %conv16, !opID !321, !opSignedness !6
  call void @profOp(i64 117, i8 15, i64 %mul17, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %25 = load i64, i64* %xb, align 8, !opID !322, !opSignedness !6
  call void @profOp(i64 118, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %add18 = add i64 %25, %mul17, !opID !323, !opSignedness !6
  call void @profOp(i64 119, i8 11, i64 %add18, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %add18, i64* %xb, align 8, !opID !324, !opSignedness !6
  call void @profOp(i64 120, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.inc, !opID !325, !opSignedness !6

for.inc:                                          ; preds = %for.body
  %26 = load i32, i32* %i, align 4, !opID !326, !opSignedness !6
  call void @profOp(i64 122, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %inc = add i32 %26, 1, !opID !327, !opSignedness !6
  %27 = sext i32 %inc to i64
  call void @profOp(i64 123, i8 11, i64 %27, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %inc, i32* %i, align 4, !opID !328, !opSignedness !6
  call void @profOp(i64 124, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond, !llvm.loop !329, !opID !331, !opSignedness !6

for.end:                                          ; preds = %for.cond
  %28 = load i32*, i32** %tqmf_ptr, align 8, !opID !332, !opSignedness !6
  call void @profOp(i64 126, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr19 = getelementptr inbounds i32, i32* %28, i32 1, !opID !333, !opSignedness !6
  call void @profOp(i64 127, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr19, i32** %tqmf_ptr, align 8, !opID !334, !opSignedness !6
  call void @profOp(i64 128, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %29 = load i32, i32* %28, align 4, !opID !335, !opSignedness !6
  call void @profOp(i64 129, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv20 = sext i32 %29 to i64, !opID !336, !opSignedness !6
  call void @profOp(i64 130, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %30 = load i32*, i32** %h_ptr, align 8, !opID !337, !opSignedness !6
  call void @profOp(i64 131, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr21 = getelementptr inbounds i32, i32* %30, i32 1, !opID !338, !opSignedness !6
  call void @profOp(i64 132, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr21, i32** %h_ptr, align 8, !opID !339, !opSignedness !6
  call void @profOp(i64 133, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %31 = load i32, i32* %30, align 4, !opID !340, !opSignedness !6
  call void @profOp(i64 134, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv22 = sext i32 %31 to i64, !opID !341, !opSignedness !6
  call void @profOp(i64 135, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul23 = mul i64 %conv20, %conv22, !opID !342, !opSignedness !6
  call void @profOp(i64 136, i8 15, i64 %mul23, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %32 = load i64, i64* %xa, align 8, !opID !343, !opSignedness !6
  call void @profOp(i64 137, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %add24 = add i64 %32, %mul23, !opID !344, !opSignedness !6
  call void @profOp(i64 138, i8 11, i64 %add24, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %add24, i64* %xa, align 8, !opID !345, !opSignedness !6
  call void @profOp(i64 139, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %33 = load i32*, i32** %tqmf_ptr, align 8, !opID !346, !opSignedness !6
  call void @profOp(i64 140, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %34 = load i32, i32* %33, align 4, !opID !347, !opSignedness !6
  call void @profOp(i64 141, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv25 = sext i32 %34 to i64, !opID !348, !opSignedness !6
  call void @profOp(i64 142, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %35 = load i32*, i32** %h_ptr, align 8, !opID !349, !opSignedness !6
  call void @profOp(i64 143, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr26 = getelementptr inbounds i32, i32* %35, i32 1, !opID !350, !opSignedness !6
  call void @profOp(i64 144, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr26, i32** %h_ptr, align 8, !opID !351, !opSignedness !6
  call void @profOp(i64 145, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %36 = load i32, i32* %35, align 4, !opID !352, !opSignedness !6
  call void @profOp(i64 146, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv27 = sext i32 %36 to i64, !opID !353, !opSignedness !6
  call void @profOp(i64 147, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul28 = mul i64 %conv25, %conv27, !opID !354, !opSignedness !6
  call void @profOp(i64 148, i8 15, i64 %mul28, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %37 = load i64, i64* %xb, align 8, !opID !355, !opSignedness !6
  call void @profOp(i64 149, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %add29 = add i64 %37, %mul28, !opID !356, !opSignedness !6
  call void @profOp(i64 150, i8 11, i64 %add29, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %add29, i64* %xb, align 8, !opID !357, !opSignedness !6
  call void @profOp(i64 151, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %38 = load i32*, i32** %tqmf_ptr, align 8, !opID !358, !opSignedness !6
  call void @profOp(i64 152, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %add.ptr = getelementptr inbounds i32, i32* %38, i64 -2, !opID !359, !opSignedness !6
  call void @profOp(i64 153, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %add.ptr, i32** %tqmf_ptr1, align 8, !opID !360, !opSignedness !6
  call void @profOp(i64 154, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %encode_label1, !opID !361, !opSignedness !6

encode_label1:                                    ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !362, !opSignedness !6
  call void @profOp(i64 156, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond30, !opID !363, !opSignedness !6

for.cond30:                                       ; preds = %for.inc35, %encode_label1
  %39 = load i32, i32* %i, align 4, !opID !364, !opSignedness !6
  call void @profOp(i64 158, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp31 = icmp slt i32 %39, 22, !opID !365, !opSignedness !6
  call void @profOp(i64 159, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp31, label %for.body32, label %for.end37, !opID !366, !opSignedness !6

for.body32:                                       ; preds = %for.cond30
  %40 = load i32*, i32** %tqmf_ptr1, align 8, !opID !367, !opSignedness !6
  call void @profOp(i64 161, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr33 = getelementptr inbounds i32, i32* %40, i32 -1, !opID !368, !opSignedness !6
  call void @profOp(i64 162, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr33, i32** %tqmf_ptr1, align 8, !opID !369, !opSignedness !6
  call void @profOp(i64 163, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %41 = load i32, i32* %40, align 4, !opID !370, !opSignedness !6
  call void @profOp(i64 164, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %42 = load i32*, i32** %tqmf_ptr, align 8, !opID !371, !opSignedness !6
  call void @profOp(i64 165, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr34 = getelementptr inbounds i32, i32* %42, i32 -1, !opID !372, !opSignedness !6
  call void @profOp(i64 166, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr34, i32** %tqmf_ptr, align 8, !opID !373, !opSignedness !6
  call void @profOp(i64 167, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %41, i32* %42, align 4, !opID !374, !opSignedness !6
  call void @profOp(i64 168, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.inc35, !opID !375, !opSignedness !6

for.inc35:                                        ; preds = %for.body32
  %43 = load i32, i32* %i, align 4, !opID !376, !opSignedness !6
  call void @profOp(i64 170, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %inc36 = add i32 %43, 1, !opID !377, !opSignedness !6
  %44 = sext i32 %inc36 to i64
  call void @profOp(i64 171, i8 11, i64 %44, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %inc36, i32* %i, align 4, !opID !378, !opSignedness !6
  call void @profOp(i64 172, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond30, !llvm.loop !379, !opID !381, !opSignedness !6

for.end37:                                        ; preds = %for.cond30
  %45 = load i32, i32* %xin1.addr, align 4, !opID !382, !opSignedness !6
  call void @profOp(i64 174, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %46 = load i32*, i32** %tqmf_ptr, align 8, !opID !383, !opSignedness !6
  call void @profOp(i64 175, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr38 = getelementptr inbounds i32, i32* %46, i32 -1, !opID !384, !opSignedness !6
  call void @profOp(i64 176, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr38, i32** %tqmf_ptr, align 8, !opID !385, !opSignedness !6
  call void @profOp(i64 177, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %45, i32* %46, align 4, !opID !386, !opSignedness !6
  call void @profOp(i64 178, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %47 = load i32, i32* %xin2.addr, align 4, !opID !387, !opSignedness !6
  call void @profOp(i64 179, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %48 = load i32*, i32** %tqmf_ptr, align 8, !opID !388, !opSignedness !6
  call void @profOp(i64 180, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 %47, i32* %48, align 4, !opID !389, !opSignedness !6
  call void @profOp(i64 181, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %49 = load i64, i64* %xa, align 8, !opID !390, !opSignedness !6
  call void @profOp(i64 182, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %50 = load i64, i64* %xb, align 8, !opID !391, !opSignedness !6
  call void @profOp(i64 183, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %add39 = add i64 %49, %50, !opID !392, !opSignedness !6
  call void @profOp(i64 184, i8 11, i64 %add39, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %shr = ashr i64 %add39, 15, !opID !393, !opSignedness !6
  call void @profOp(i64 185, i8 25, i64 %shr, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv40 = trunc i64 %shr to i32, !opID !394, !opSignedness !6
  call void @profOp(i64 186, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %conv40, i32* @xl, align 4, !opID !395, !opSignedness !6
  call void @profOp(i64 187, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %51 = load i64, i64* %xa, align 8, !opID !396, !opSignedness !6
  call void @profOp(i64 188, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %52 = load i64, i64* %xb, align 8, !opID !397, !opSignedness !6
  call void @profOp(i64 189, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %sub = sub i64 %51, %52, !opID !398, !opSignedness !6
  call void @profOp(i64 190, i8 13, i64 %sub, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %shr41 = ashr i64 %sub, 15, !opID !399, !opSignedness !6
  call void @profOp(i64 191, i8 25, i64 %shr41, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv42 = trunc i64 %shr41 to i32, !opID !400, !opSignedness !6
  call void @profOp(i64 192, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %conv42, i32* @xh, align 4, !opID !401, !opSignedness !6
  call void @profOp(i64 193, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0)), !opID !402, !opSignedness !6
  call void @profOp(i64 194, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call, i32* @szl, align 4, !opID !403, !opSignedness !6
  call void @profOp(i64 195, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %53 = load i32, i32* @rlt1, align 4, !opID !404, !opSignedness !6
  call void @profOp(i64 196, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %54 = load i32, i32* @al1, align 4, !opID !405, !opSignedness !6
  call void @profOp(i64 197, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %55 = load i32, i32* @rlt2, align 4, !opID !406, !opSignedness !6
  call void @profOp(i64 198, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %56 = load i32, i32* @al2, align 4, !opID !407, !opSignedness !6
  call void @profOp(i64 199, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call43 = call i32 @filtep(i32 %53, i32 %54, i32 %55, i32 %56), !opID !408, !opSignedness !6
  call void @profOp(i64 200, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call43, i32* @spl, align 4, !opID !409, !opSignedness !6
  call void @profOp(i64 201, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %57 = load i32, i32* @szl, align 4, !opID !410, !opSignedness !6
  call void @profOp(i64 202, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %58 = load i32, i32* @spl, align 4, !opID !411, !opSignedness !6
  call void @profOp(i64 203, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add44 = add i32 %57, %58, !opID !412, !opSignedness !6
  %59 = sext i32 %add44 to i64
  call void @profOp(i64 204, i8 11, i64 %59, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add44, i32* @sl, align 4, !opID !413, !opSignedness !6
  call void @profOp(i64 205, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %60 = load i32, i32* @xl, align 4, !opID !414, !opSignedness !6
  call void @profOp(i64 206, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %61 = load i32, i32* @sl, align 4, !opID !415, !opSignedness !6
  call void @profOp(i64 207, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %sub45 = sub i32 %60, %61, !opID !416, !opSignedness !6
  %62 = sext i32 %sub45 to i64
  call void @profOp(i64 208, i8 13, i64 %62, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %sub45, i32* @el, align 4, !opID !417, !opSignedness !6
  call void @profOp(i64 209, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %63 = load i32, i32* @el, align 4, !opID !418, !opSignedness !6
  call void @profOp(i64 210, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %64 = load i32, i32* @detl, align 4, !opID !419, !opSignedness !6
  call void @profOp(i64 211, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call46 = call i32 @quantl(i32 %63, i32 %64), !opID !420, !opSignedness !6
  call void @profOp(i64 212, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call46, i32* @il, align 4, !opID !421, !opSignedness !6
  call void @profOp(i64 213, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %65 = load i32, i32* @detl, align 4, !opID !422, !opSignedness !6
  call void @profOp(i64 214, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv47 = sext i32 %65 to i64, !opID !423, !opSignedness !6
  call void @profOp(i64 215, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %66 = load i32, i32* @il, align 4, !opID !424, !opSignedness !6
  call void @profOp(i64 216, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %shr48 = ashr i32 %66, 2, !opID !425, !opSignedness !6
  %67 = sext i32 %shr48 to i64
  call void @profOp(i64 217, i8 25, i64 %67, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %idxprom = sext i32 %shr48 to i64, !opID !426, !opSignedness !6
  call void @profOp(i64 218, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i64 0, i64 %idxprom, !opID !427, !opSignedness !6
  call void @profOp(i64 219, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %68 = load i32, i32* %arrayidx, align 4, !opID !428, !opSignedness !6
  call void @profOp(i64 220, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv49 = sext i32 %68 to i64, !opID !429, !opSignedness !6
  call void @profOp(i64 221, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul50 = mul i64 %conv47, %conv49, !opID !430, !opSignedness !6
  call void @profOp(i64 222, i8 15, i64 %mul50, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %shr51 = ashr i64 %mul50, 15, !opID !431, !opSignedness !6
  call void @profOp(i64 223, i8 25, i64 %shr51, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv52 = trunc i64 %shr51 to i32, !opID !432, !opSignedness !6
  call void @profOp(i64 224, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %conv52, i32* @dlt, align 4, !opID !433, !opSignedness !6
  call void @profOp(i64 225, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %69 = load i32, i32* @il, align 4, !opID !434, !opSignedness !6
  call void @profOp(i64 226, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %70 = load i32, i32* @nbl, align 4, !opID !435, !opSignedness !6
  call void @profOp(i64 227, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call53 = call i32 @logscl(i32 %69, i32 %70), !opID !436, !opSignedness !6
  call void @profOp(i64 228, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call53, i32* @nbl, align 4, !opID !437, !opSignedness !6
  call void @profOp(i64 229, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %71 = load i32, i32* @nbl, align 4, !opID !438, !opSignedness !6
  call void @profOp(i64 230, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call54 = call i32 @scalel(i32 %71, i32 8), !opID !439, !opSignedness !6
  call void @profOp(i64 231, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call54, i32* @detl, align 4, !opID !440, !opSignedness !6
  call void @profOp(i64 232, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %72 = load i32, i32* @dlt, align 4, !opID !441, !opSignedness !6
  call void @profOp(i64 233, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %73 = load i32, i32* @szl, align 4, !opID !442, !opSignedness !6
  call void @profOp(i64 234, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add55 = add i32 %72, %73, !opID !443, !opSignedness !6
  %74 = sext i32 %add55 to i64
  call void @profOp(i64 235, i8 11, i64 %74, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add55, i32* @plt, align 4, !opID !444, !opSignedness !6
  call void @profOp(i64 236, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %75 = load i32, i32* @dlt, align 4, !opID !445, !opSignedness !6
  call void @profOp(i64 237, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  call void @upzero(i32 %75, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0)), !opID !446, !opSignedness !6
  call void @profOp(i64 238, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %76 = load i32, i32* @al1, align 4, !opID !447, !opSignedness !6
  call void @profOp(i64 239, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %77 = load i32, i32* @al2, align 4, !opID !448, !opSignedness !6
  call void @profOp(i64 240, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %78 = load i32, i32* @plt, align 4, !opID !449, !opSignedness !6
  call void @profOp(i64 241, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %79 = load i32, i32* @plt1, align 4, !opID !450, !opSignedness !6
  call void @profOp(i64 242, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %80 = load i32, i32* @plt2, align 4, !opID !451, !opSignedness !6
  call void @profOp(i64 243, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call56 = call i32 @uppol2(i32 %76, i32 %77, i32 %78, i32 %79, i32 %80), !opID !452, !opSignedness !6
  call void @profOp(i64 244, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call56, i32* @al2, align 4, !opID !453, !opSignedness !6
  call void @profOp(i64 245, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %81 = load i32, i32* @al1, align 4, !opID !454, !opSignedness !6
  call void @profOp(i64 246, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %82 = load i32, i32* @al2, align 4, !opID !455, !opSignedness !6
  call void @profOp(i64 247, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %83 = load i32, i32* @plt, align 4, !opID !456, !opSignedness !6
  call void @profOp(i64 248, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %84 = load i32, i32* @plt1, align 4, !opID !457, !opSignedness !6
  call void @profOp(i64 249, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call57 = call i32 @uppol1(i32 %81, i32 %82, i32 %83, i32 %84), !opID !458, !opSignedness !6
  call void @profOp(i64 250, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call57, i32* @al1, align 4, !opID !459, !opSignedness !6
  call void @profOp(i64 251, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %85 = load i32, i32* @sl, align 4, !opID !460, !opSignedness !6
  call void @profOp(i64 252, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %86 = load i32, i32* @dlt, align 4, !opID !461, !opSignedness !6
  call void @profOp(i64 253, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add58 = add i32 %85, %86, !opID !462, !opSignedness !6
  %87 = sext i32 %add58 to i64
  call void @profOp(i64 254, i8 11, i64 %87, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add58, i32* @rlt, align 4, !opID !463, !opSignedness !6
  call void @profOp(i64 255, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %88 = load i32, i32* @rlt1, align 4, !opID !464, !opSignedness !6
  call void @profOp(i64 256, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %88, i32* @rlt2, align 4, !opID !465, !opSignedness !6
  call void @profOp(i64 257, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %89 = load i32, i32* @rlt, align 4, !opID !466, !opSignedness !6
  call void @profOp(i64 258, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %89, i32* @rlt1, align 4, !opID !467, !opSignedness !6
  call void @profOp(i64 259, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %90 = load i32, i32* @plt1, align 4, !opID !468, !opSignedness !6
  call void @profOp(i64 260, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %90, i32* @plt2, align 4, !opID !469, !opSignedness !6
  call void @profOp(i64 261, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %91 = load i32, i32* @plt, align 4, !opID !470, !opSignedness !6
  call void @profOp(i64 262, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %91, i32* @plt1, align 4, !opID !471, !opSignedness !6
  call void @profOp(i64 263, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %call59 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0)), !opID !472, !opSignedness !6
  call void @profOp(i64 264, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call59, i32* @szh, align 4, !opID !473, !opSignedness !6
  call void @profOp(i64 265, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %92 = load i32, i32* @rh1, align 4, !opID !474, !opSignedness !6
  call void @profOp(i64 266, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %93 = load i32, i32* @ah1, align 4, !opID !475, !opSignedness !6
  call void @profOp(i64 267, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %94 = load i32, i32* @rh2, align 4, !opID !476, !opSignedness !6
  call void @profOp(i64 268, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %95 = load i32, i32* @ah2, align 4, !opID !477, !opSignedness !6
  call void @profOp(i64 269, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call60 = call i32 @filtep(i32 %92, i32 %93, i32 %94, i32 %95), !opID !478, !opSignedness !6
  call void @profOp(i64 270, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call60, i32* @sph, align 4, !opID !479, !opSignedness !6
  call void @profOp(i64 271, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %96 = load i32, i32* @sph, align 4, !opID !480, !opSignedness !6
  call void @profOp(i64 272, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %97 = load i32, i32* @szh, align 4, !opID !481, !opSignedness !6
  call void @profOp(i64 273, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add61 = add i32 %96, %97, !opID !482, !opSignedness !6
  %98 = sext i32 %add61 to i64
  call void @profOp(i64 274, i8 11, i64 %98, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add61, i32* @sh, align 4, !opID !483, !opSignedness !6
  call void @profOp(i64 275, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %99 = load i32, i32* @xh, align 4, !opID !484, !opSignedness !6
  call void @profOp(i64 276, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %100 = load i32, i32* @sh, align 4, !opID !485, !opSignedness !6
  call void @profOp(i64 277, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %sub62 = sub i32 %99, %100, !opID !486, !opSignedness !6
  %101 = sext i32 %sub62 to i64
  call void @profOp(i64 278, i8 13, i64 %101, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %sub62, i32* @eh, align 4, !opID !487, !opSignedness !6
  call void @profOp(i64 279, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %102 = load i32, i32* @eh, align 4, !opID !488, !opSignedness !6
  call void @profOp(i64 280, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp63 = icmp sge i32 %102, 0, !opID !489, !opSignedness !6
  call void @profOp(i64 281, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp63, label %if.then, label %if.else, !opID !490, !opSignedness !6

if.then:                                          ; preds = %for.end37
  store i32 3, i32* @ih, align 4, !opID !491, !opSignedness !6
  call void @profOp(i64 283, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end, !opID !492, !opSignedness !6

if.else:                                          ; preds = %for.end37
  store i32 1, i32* @ih, align 4, !opID !493, !opSignedness !6
  call void @profOp(i64 285, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end, !opID !494, !opSignedness !6

if.end:                                           ; preds = %if.else, %if.then
  %103 = load i32, i32* @deth, align 4, !opID !495, !opSignedness !6
  call void @profOp(i64 287, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv64 = sext i32 %103 to i64, !opID !496, !opSignedness !6
  call void @profOp(i64 288, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul65 = mul i64 564, %conv64, !opID !497, !opSignedness !6
  call void @profOp(i64 289, i8 15, i64 %mul65, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %shr66 = ashr i64 %mul65, 12, !opID !498, !opSignedness !6
  call void @profOp(i64 290, i8 25, i64 %shr66, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv67 = trunc i64 %shr66 to i32, !opID !499, !opSignedness !6
  call void @profOp(i64 291, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %conv67, i32* %decis, align 4, !opID !500, !opSignedness !6
  call void @profOp(i64 292, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %104 = load i32, i32* @eh, align 4, !opID !501, !opSignedness !6
  call void @profOp(i64 293, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call68 = call i32 @abs(i32 %104) #9, !opID !502, !opSignedness !6
  call void @profOp(i64 294, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %105 = load i32, i32* %decis, align 4, !opID !503, !opSignedness !6
  call void @profOp(i64 295, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp69 = icmp sgt i32 %call68, %105, !opID !504, !opSignedness !6
  call void @profOp(i64 296, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp69, label %if.then70, label %if.end71, !opID !505, !opSignedness !6

if.then70:                                        ; preds = %if.end
  %106 = load i32, i32* @ih, align 4, !opID !506, !opSignedness !6
  call void @profOp(i64 298, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %dec = add i32 %106, -1, !opID !507, !opSignedness !6
  %107 = sext i32 %dec to i64
  call void @profOp(i64 299, i8 11, i64 %107, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %dec, i32* @ih, align 4, !opID !508, !opSignedness !6
  call void @profOp(i64 300, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end71, !opID !509, !opSignedness !6

if.end71:                                         ; preds = %if.then70, %if.end
  %108 = load i32, i32* @deth, align 4, !opID !510, !opSignedness !6
  call void @profOp(i64 302, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv72 = sext i32 %108 to i64, !opID !511, !opSignedness !6
  call void @profOp(i64 303, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %109 = load i32, i32* @ih, align 4, !opID !512, !opSignedness !6
  call void @profOp(i64 304, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom73 = sext i32 %109 to i64, !opID !513, !opSignedness !6
  call void @profOp(i64 305, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx74 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i64 0, i64 %idxprom73, !opID !514, !opSignedness !6
  call void @profOp(i64 306, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %110 = load i32, i32* %arrayidx74, align 4, !opID !515, !opSignedness !6
  call void @profOp(i64 307, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv75 = sext i32 %110 to i64, !opID !516, !opSignedness !6
  call void @profOp(i64 308, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul76 = mul i64 %conv72, %conv75, !opID !517, !opSignedness !6
  call void @profOp(i64 309, i8 15, i64 %mul76, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %shr77 = ashr i64 %mul76, 15, !opID !518, !opSignedness !6
  call void @profOp(i64 310, i8 25, i64 %shr77, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv78 = trunc i64 %shr77 to i32, !opID !519, !opSignedness !6
  call void @profOp(i64 311, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %conv78, i32* @dh, align 4, !opID !520, !opSignedness !6
  call void @profOp(i64 312, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %111 = load i32, i32* @ih, align 4, !opID !521, !opSignedness !6
  call void @profOp(i64 313, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %112 = load i32, i32* @nbh, align 4, !opID !522, !opSignedness !6
  call void @profOp(i64 314, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call79 = call i32 @logsch(i32 %111, i32 %112), !opID !523, !opSignedness !6
  call void @profOp(i64 315, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call79, i32* @nbh, align 4, !opID !524, !opSignedness !6
  call void @profOp(i64 316, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %113 = load i32, i32* @nbh, align 4, !opID !525, !opSignedness !6
  call void @profOp(i64 317, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call80 = call i32 @scalel(i32 %113, i32 10), !opID !526, !opSignedness !6
  call void @profOp(i64 318, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call80, i32* @deth, align 4, !opID !527, !opSignedness !6
  call void @profOp(i64 319, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %114 = load i32, i32* @dh, align 4, !opID !528, !opSignedness !6
  call void @profOp(i64 320, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %115 = load i32, i32* @szh, align 4, !opID !529, !opSignedness !6
  call void @profOp(i64 321, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add81 = add i32 %114, %115, !opID !530, !opSignedness !6
  %116 = sext i32 %add81 to i64
  call void @profOp(i64 322, i8 11, i64 %116, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add81, i32* @ph, align 4, !opID !531, !opSignedness !6
  call void @profOp(i64 323, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %117 = load i32, i32* @dh, align 4, !opID !532, !opSignedness !6
  call void @profOp(i64 324, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  call void @upzero(i32 %117, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0)), !opID !533, !opSignedness !6
  call void @profOp(i64 325, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %118 = load i32, i32* @ah1, align 4, !opID !534, !opSignedness !6
  call void @profOp(i64 326, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %119 = load i32, i32* @ah2, align 4, !opID !535, !opSignedness !6
  call void @profOp(i64 327, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %120 = load i32, i32* @ph, align 4, !opID !536, !opSignedness !6
  call void @profOp(i64 328, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %121 = load i32, i32* @ph1, align 4, !opID !537, !opSignedness !6
  call void @profOp(i64 329, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %122 = load i32, i32* @ph2, align 4, !opID !538, !opSignedness !6
  call void @profOp(i64 330, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call82 = call i32 @uppol2(i32 %118, i32 %119, i32 %120, i32 %121, i32 %122), !opID !539, !opSignedness !6
  call void @profOp(i64 331, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call82, i32* @ah2, align 4, !opID !540, !opSignedness !6
  call void @profOp(i64 332, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %123 = load i32, i32* @ah1, align 4, !opID !541, !opSignedness !6
  call void @profOp(i64 333, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %124 = load i32, i32* @ah2, align 4, !opID !542, !opSignedness !6
  call void @profOp(i64 334, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %125 = load i32, i32* @ph, align 4, !opID !543, !opSignedness !6
  call void @profOp(i64 335, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %126 = load i32, i32* @ph1, align 4, !opID !544, !opSignedness !6
  call void @profOp(i64 336, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call83 = call i32 @uppol1(i32 %123, i32 %124, i32 %125, i32 %126), !opID !545, !opSignedness !6
  call void @profOp(i64 337, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call83, i32* @ah1, align 4, !opID !546, !opSignedness !6
  call void @profOp(i64 338, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %127 = load i32, i32* @sh, align 4, !opID !547, !opSignedness !6
  call void @profOp(i64 339, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %128 = load i32, i32* @dh, align 4, !opID !548, !opSignedness !6
  call void @profOp(i64 340, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add84 = add i32 %127, %128, !opID !549, !opSignedness !6
  %129 = sext i32 %add84 to i64
  call void @profOp(i64 341, i8 11, i64 %129, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add84, i32* @yh, align 4, !opID !550, !opSignedness !6
  call void @profOp(i64 342, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %130 = load i32, i32* @rh1, align 4, !opID !551, !opSignedness !6
  call void @profOp(i64 343, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %130, i32* @rh2, align 4, !opID !552, !opSignedness !6
  call void @profOp(i64 344, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %131 = load i32, i32* @yh, align 4, !opID !553, !opSignedness !6
  call void @profOp(i64 345, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %131, i32* @rh1, align 4, !opID !554, !opSignedness !6
  call void @profOp(i64 346, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %132 = load i32, i32* @ph1, align 4, !opID !555, !opSignedness !6
  call void @profOp(i64 347, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %132, i32* @ph2, align 4, !opID !556, !opSignedness !6
  call void @profOp(i64 348, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %133 = load i32, i32* @ph, align 4, !opID !557, !opSignedness !6
  call void @profOp(i64 349, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %133, i32* @ph1, align 4, !opID !558, !opSignedness !6
  call void @profOp(i64 350, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %134 = load i32, i32* @il, align 4, !opID !559, !opSignedness !6
  call void @profOp(i64 351, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %135 = load i32, i32* @ih, align 4, !opID !560, !opSignedness !6
  call void @profOp(i64 352, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %shl = shl i32 %135, 6, !opID !561, !opSignedness !6
  %136 = sext i32 %shl to i64
  call void @profOp(i64 353, i8 23, i64 %136, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %or = or i32 %134, %shl, !opID !562, !opSignedness !6
  %137 = sext i32 %or to i64
  call void @profOp(i64 354, i8 27, i64 %137, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %138 = bitcast i32* %decis to i8*, !opID !563, !opSignedness !6
  call void @profOp(i64 355, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %138) #8, !opID !564, !opSignedness !6
  call void @profOp(i64 356, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %139 = bitcast i64* %xb to i8*, !opID !565, !opSignedness !6
  call void @profOp(i64 357, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %139) #8, !opID !566, !opSignedness !6
  call void @profOp(i64 358, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %140 = bitcast i64* %xa to i8*, !opID !567, !opSignedness !6
  call void @profOp(i64 359, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %140) #8, !opID !568, !opSignedness !6
  call void @profOp(i64 360, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %141 = bitcast i32** %tqmf_ptr1 to i8*, !opID !569, !opSignedness !6
  call void @profOp(i64 361, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %141) #8, !opID !570, !opSignedness !6
  call void @profOp(i64 362, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %142 = bitcast i32** %tqmf_ptr to i8*, !opID !571, !opSignedness !6
  call void @profOp(i64 363, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %142) #8, !opID !572, !opSignedness !6
  call void @profOp(i64 364, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %143 = bitcast i32** %h_ptr to i8*, !opID !573, !opSignedness !6
  call void @profOp(i64 365, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %143) #8, !opID !574, !opSignedness !6
  call void @profOp(i64 366, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %144 = bitcast i32* %i to i8*, !opID !575, !opSignedness !6
  call void @profOp(i64 367, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %144) #8, !opID !576, !opSignedness !6
  call void @profOp(i64 368, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  ret i32 %or, !opID !577, !opSignedness !6
}

; Function Attrs: nounwind
define void @decode(i32 %input) #3 {
entry:
  %input.addr = alloca i32, align 4, !opID !578, !opSignedness !6
  call void @profOp(i64 920, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 3, i1 false)
  %i = alloca i32, align 4, !opID !579, !opSignedness !6
  call void @profOp(i64 921, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 10, i1 false)
  %xa1 = alloca i64, align 8, !opID !580, !opSignedness !6
  call void @profOp(i64 922, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 8, i1 false)
  %xa2 = alloca i64, align 8, !opID !581, !opSignedness !6
  call void @profOp(i64 923, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 8, i1 false)
  %h_ptr = alloca i32*, align 8, !opID !582, !opSignedness !6
  call void @profOp(i64 924, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 15, i1 false)
  %ac_ptr = alloca i32*, align 8, !opID !583, !opSignedness !6
  call void @profOp(i64 925, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 10, i1 false)
  %ac_ptr1 = alloca i32*, align 8, !opID !584, !opSignedness !6
  call void @profOp(i64 926, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 5, i1 false)
  %ad_ptr = alloca i32*, align 8, !opID !585, !opSignedness !6
  call void @profOp(i64 927, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 10, i1 false)
  %ad_ptr1 = alloca i32*, align 8, !opID !586, !opSignedness !6
  call void @profOp(i64 928, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 5, i1 false)
  store i32 %input, i32* %input.addr, align 4, !opID !587, !opSignedness !6
  call void @profOp(i64 929, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %0 = bitcast i32* %i to i8*, !opID !588, !opSignedness !6
  call void @profOp(i64 930, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !589, !opSignedness !6
  call void @profOp(i64 931, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %1 = bitcast i64* %xa1 to i8*, !opID !590, !opSignedness !6
  call void @profOp(i64 932, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #8, !opID !591, !opSignedness !6
  call void @profOp(i64 933, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %2 = bitcast i64* %xa2 to i8*, !opID !592, !opSignedness !6
  call void @profOp(i64 934, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #8, !opID !593, !opSignedness !6
  call void @profOp(i64 935, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %3 = bitcast i32** %h_ptr to i8*, !opID !594, !opSignedness !6
  call void @profOp(i64 936, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #8, !opID !595, !opSignedness !6
  call void @profOp(i64 937, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %4 = bitcast i32** %ac_ptr to i8*, !opID !596, !opSignedness !6
  call void @profOp(i64 938, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #8, !opID !597, !opSignedness !6
  call void @profOp(i64 939, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %5 = bitcast i32** %ac_ptr1 to i8*, !opID !598, !opSignedness !6
  call void @profOp(i64 940, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #8, !opID !599, !opSignedness !6
  call void @profOp(i64 941, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %6 = bitcast i32** %ad_ptr to i8*, !opID !600, !opSignedness !6
  call void @profOp(i64 942, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #8, !opID !601, !opSignedness !6
  call void @profOp(i64 943, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %7 = bitcast i32** %ad_ptr1 to i8*, !opID !602, !opSignedness !6
  call void @profOp(i64 944, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #8, !opID !603, !opSignedness !6
  call void @profOp(i64 945, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %8 = load i32, i32* %input.addr, align 4, !opID !604, !opSignedness !6
  call void @profOp(i64 946, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %and = and i32 %8, 63, !opID !605, !opSignedness !6
  %9 = sext i32 %and to i64
  call void @profOp(i64 947, i8 26, i64 %9, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %and, i32* @ilr, align 4, !opID !606, !opSignedness !6
  call void @profOp(i64 948, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %10 = load i32, i32* %input.addr, align 4, !opID !607, !opSignedness !6
  call void @profOp(i64 949, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %shr = ashr i32 %10, 6, !opID !608, !opSignedness !6
  %11 = sext i32 %shr to i64
  call void @profOp(i64 950, i8 25, i64 %11, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %shr, i32* @ih, align 4, !opID !609, !opSignedness !6
  call void @profOp(i64 951, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0)), !opID !610, !opSignedness !6
  call void @profOp(i64 952, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call, i32* @dec_szl, align 4, !opID !611, !opSignedness !6
  call void @profOp(i64 953, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %12 = load i32, i32* @dec_rlt1, align 4, !opID !612, !opSignedness !6
  call void @profOp(i64 954, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %13 = load i32, i32* @dec_al1, align 4, !opID !613, !opSignedness !6
  call void @profOp(i64 955, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %14 = load i32, i32* @dec_rlt2, align 4, !opID !614, !opSignedness !6
  call void @profOp(i64 956, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %15 = load i32, i32* @dec_al2, align 4, !opID !615, !opSignedness !6
  call void @profOp(i64 957, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call1 = call i32 @filtep(i32 %12, i32 %13, i32 %14, i32 %15), !opID !616, !opSignedness !6
  call void @profOp(i64 958, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call1, i32* @dec_spl, align 4, !opID !617, !opSignedness !6
  call void @profOp(i64 959, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %16 = load i32, i32* @dec_spl, align 4, !opID !618, !opSignedness !6
  call void @profOp(i64 960, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %17 = load i32, i32* @dec_szl, align 4, !opID !619, !opSignedness !6
  call void @profOp(i64 961, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add = add i32 %16, %17, !opID !620, !opSignedness !6
  %18 = sext i32 %add to i64
  call void @profOp(i64 962, i8 11, i64 %18, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add, i32* @dec_sl, align 4, !opID !621, !opSignedness !6
  call void @profOp(i64 963, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %19 = load i32, i32* @dec_detl, align 4, !opID !622, !opSignedness !6
  call void @profOp(i64 964, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv = sext i32 %19 to i64, !opID !623, !opSignedness !6
  call void @profOp(i64 965, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %20 = load i32, i32* @ilr, align 4, !opID !624, !opSignedness !6
  call void @profOp(i64 966, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %shr2 = ashr i32 %20, 2, !opID !625, !opSignedness !6
  %21 = sext i32 %shr2 to i64
  call void @profOp(i64 967, i8 25, i64 %21, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %idxprom = sext i32 %shr2 to i64, !opID !626, !opSignedness !6
  call void @profOp(i64 968, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i64 0, i64 %idxprom, !opID !627, !opSignedness !6
  call void @profOp(i64 969, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %22 = load i32, i32* %arrayidx, align 4, !opID !628, !opSignedness !6
  call void @profOp(i64 970, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv3 = sext i32 %22 to i64, !opID !629, !opSignedness !6
  call void @profOp(i64 971, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul = mul i64 %conv, %conv3, !opID !630, !opSignedness !6
  call void @profOp(i64 972, i8 15, i64 %mul, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %shr4 = ashr i64 %mul, 15, !opID !631, !opSignedness !6
  call void @profOp(i64 973, i8 25, i64 %shr4, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv5 = trunc i64 %shr4 to i32, !opID !632, !opSignedness !6
  call void @profOp(i64 974, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %conv5, i32* @dec_dlt, align 4, !opID !633, !opSignedness !6
  call void @profOp(i64 975, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %23 = load i32, i32* @dec_detl, align 4, !opID !634, !opSignedness !6
  call void @profOp(i64 976, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv6 = sext i32 %23 to i64, !opID !635, !opSignedness !6
  call void @profOp(i64 977, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %24 = load i32, i32* @il, align 4, !opID !636, !opSignedness !6
  call void @profOp(i64 978, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom7 = sext i32 %24 to i64, !opID !637, !opSignedness !6
  call void @profOp(i64 979, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx8 = getelementptr inbounds [64 x i32], [64 x i32]* @qq6_code6_table, i64 0, i64 %idxprom7, !opID !638, !opSignedness !6
  call void @profOp(i64 980, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %25 = load i32, i32* %arrayidx8, align 4, !opID !639, !opSignedness !6
  call void @profOp(i64 981, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv9 = sext i32 %25 to i64, !opID !640, !opSignedness !6
  call void @profOp(i64 982, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul10 = mul i64 %conv6, %conv9, !opID !641, !opSignedness !6
  call void @profOp(i64 983, i8 15, i64 %mul10, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %shr11 = ashr i64 %mul10, 15, !opID !642, !opSignedness !6
  call void @profOp(i64 984, i8 25, i64 %shr11, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv12 = trunc i64 %shr11 to i32, !opID !643, !opSignedness !6
  call void @profOp(i64 985, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %conv12, i32* @dl, align 4, !opID !644, !opSignedness !6
  call void @profOp(i64 986, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %26 = load i32, i32* @dl, align 4, !opID !645, !opSignedness !6
  call void @profOp(i64 987, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %27 = load i32, i32* @dec_sl, align 4, !opID !646, !opSignedness !6
  call void @profOp(i64 988, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add13 = add i32 %26, %27, !opID !647, !opSignedness !6
  %28 = sext i32 %add13 to i64
  call void @profOp(i64 989, i8 11, i64 %28, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add13, i32* @rl, align 4, !opID !648, !opSignedness !6
  call void @profOp(i64 990, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %29 = load i32, i32* @ilr, align 4, !opID !649, !opSignedness !6
  call void @profOp(i64 991, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %30 = load i32, i32* @dec_nbl, align 4, !opID !650, !opSignedness !6
  call void @profOp(i64 992, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call14 = call i32 @logscl(i32 %29, i32 %30), !opID !651, !opSignedness !6
  call void @profOp(i64 993, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call14, i32* @dec_nbl, align 4, !opID !652, !opSignedness !6
  call void @profOp(i64 994, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %31 = load i32, i32* @dec_nbl, align 4, !opID !653, !opSignedness !6
  call void @profOp(i64 995, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call15 = call i32 @scalel(i32 %31, i32 8), !opID !654, !opSignedness !6
  call void @profOp(i64 996, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call15, i32* @dec_detl, align 4, !opID !655, !opSignedness !6
  call void @profOp(i64 997, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %32 = load i32, i32* @dec_dlt, align 4, !opID !656, !opSignedness !6
  call void @profOp(i64 998, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %33 = load i32, i32* @dec_szl, align 4, !opID !657, !opSignedness !6
  call void @profOp(i64 999, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add16 = add i32 %32, %33, !opID !658, !opSignedness !6
  %34 = sext i32 %add16 to i64
  call void @profOp(i64 1000, i8 11, i64 %34, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add16, i32* @dec_plt, align 4, !opID !659, !opSignedness !6
  call void @profOp(i64 1001, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %35 = load i32, i32* @dec_dlt, align 4, !opID !660, !opSignedness !6
  call void @profOp(i64 1002, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  call void @upzero(i32 %35, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0)), !opID !661, !opSignedness !6
  call void @profOp(i64 1003, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %36 = load i32, i32* @dec_al1, align 4, !opID !662, !opSignedness !6
  call void @profOp(i64 1004, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %37 = load i32, i32* @dec_al2, align 4, !opID !663, !opSignedness !6
  call void @profOp(i64 1005, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %38 = load i32, i32* @dec_plt, align 4, !opID !664, !opSignedness !6
  call void @profOp(i64 1006, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %39 = load i32, i32* @dec_plt1, align 4, !opID !665, !opSignedness !6
  call void @profOp(i64 1007, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %40 = load i32, i32* @dec_plt2, align 4, !opID !666, !opSignedness !6
  call void @profOp(i64 1008, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call17 = call i32 @uppol2(i32 %36, i32 %37, i32 %38, i32 %39, i32 %40), !opID !667, !opSignedness !6
  call void @profOp(i64 1009, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call17, i32* @dec_al2, align 4, !opID !668, !opSignedness !6
  call void @profOp(i64 1010, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %41 = load i32, i32* @dec_al1, align 4, !opID !669, !opSignedness !6
  call void @profOp(i64 1011, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %42 = load i32, i32* @dec_al2, align 4, !opID !670, !opSignedness !6
  call void @profOp(i64 1012, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %43 = load i32, i32* @dec_plt, align 4, !opID !671, !opSignedness !6
  call void @profOp(i64 1013, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %44 = load i32, i32* @dec_plt1, align 4, !opID !672, !opSignedness !6
  call void @profOp(i64 1014, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call18 = call i32 @uppol1(i32 %41, i32 %42, i32 %43, i32 %44), !opID !673, !opSignedness !6
  call void @profOp(i64 1015, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call18, i32* @dec_al1, align 4, !opID !674, !opSignedness !6
  call void @profOp(i64 1016, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %45 = load i32, i32* @dec_sl, align 4, !opID !675, !opSignedness !6
  call void @profOp(i64 1017, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %46 = load i32, i32* @dec_dlt, align 4, !opID !676, !opSignedness !6
  call void @profOp(i64 1018, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add19 = add i32 %45, %46, !opID !677, !opSignedness !6
  %47 = sext i32 %add19 to i64
  call void @profOp(i64 1019, i8 11, i64 %47, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add19, i32* @dec_rlt, align 4, !opID !678, !opSignedness !6
  call void @profOp(i64 1020, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %48 = load i32, i32* @dec_rlt1, align 4, !opID !679, !opSignedness !6
  call void @profOp(i64 1021, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %48, i32* @dec_rlt2, align 4, !opID !680, !opSignedness !6
  call void @profOp(i64 1022, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %49 = load i32, i32* @dec_rlt, align 4, !opID !681, !opSignedness !6
  call void @profOp(i64 1023, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %49, i32* @dec_rlt1, align 4, !opID !682, !opSignedness !6
  call void @profOp(i64 1024, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %50 = load i32, i32* @dec_plt1, align 4, !opID !683, !opSignedness !6
  call void @profOp(i64 1025, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %50, i32* @dec_plt2, align 4, !opID !684, !opSignedness !6
  call void @profOp(i64 1026, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %51 = load i32, i32* @dec_plt, align 4, !opID !685, !opSignedness !6
  call void @profOp(i64 1027, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %51, i32* @dec_plt1, align 4, !opID !686, !opSignedness !6
  call void @profOp(i64 1028, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %call20 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0)), !opID !687, !opSignedness !6
  call void @profOp(i64 1029, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call20, i32* @dec_szh, align 4, !opID !688, !opSignedness !6
  call void @profOp(i64 1030, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %52 = load i32, i32* @dec_rh1, align 4, !opID !689, !opSignedness !6
  call void @profOp(i64 1031, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %53 = load i32, i32* @dec_ah1, align 4, !opID !690, !opSignedness !6
  call void @profOp(i64 1032, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %54 = load i32, i32* @dec_rh2, align 4, !opID !691, !opSignedness !6
  call void @profOp(i64 1033, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %55 = load i32, i32* @dec_ah2, align 4, !opID !692, !opSignedness !6
  call void @profOp(i64 1034, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call21 = call i32 @filtep(i32 %52, i32 %53, i32 %54, i32 %55), !opID !693, !opSignedness !6
  call void @profOp(i64 1035, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call21, i32* @dec_sph, align 4, !opID !694, !opSignedness !6
  call void @profOp(i64 1036, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %56 = load i32, i32* @dec_sph, align 4, !opID !695, !opSignedness !6
  call void @profOp(i64 1037, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %57 = load i32, i32* @dec_szh, align 4, !opID !696, !opSignedness !6
  call void @profOp(i64 1038, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add22 = add i32 %56, %57, !opID !697, !opSignedness !6
  %58 = sext i32 %add22 to i64
  call void @profOp(i64 1039, i8 11, i64 %58, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add22, i32* @dec_sh, align 4, !opID !698, !opSignedness !6
  call void @profOp(i64 1040, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %59 = load i32, i32* @dec_deth, align 4, !opID !699, !opSignedness !6
  call void @profOp(i64 1041, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv23 = sext i32 %59 to i64, !opID !700, !opSignedness !6
  call void @profOp(i64 1042, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %60 = load i32, i32* @ih, align 4, !opID !701, !opSignedness !6
  call void @profOp(i64 1043, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom24 = sext i32 %60 to i64, !opID !702, !opSignedness !6
  call void @profOp(i64 1044, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx25 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i64 0, i64 %idxprom24, !opID !703, !opSignedness !6
  call void @profOp(i64 1045, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %61 = load i32, i32* %arrayidx25, align 4, !opID !704, !opSignedness !6
  call void @profOp(i64 1046, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv26 = sext i32 %61 to i64, !opID !705, !opSignedness !6
  call void @profOp(i64 1047, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul27 = mul i64 %conv23, %conv26, !opID !706, !opSignedness !6
  call void @profOp(i64 1048, i8 15, i64 %mul27, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %shr28 = ashr i64 %mul27, 15, !opID !707, !opSignedness !6
  call void @profOp(i64 1049, i8 25, i64 %shr28, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv29 = trunc i64 %shr28 to i32, !opID !708, !opSignedness !6
  call void @profOp(i64 1050, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %conv29, i32* @dec_dh, align 4, !opID !709, !opSignedness !6
  call void @profOp(i64 1051, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %62 = load i32, i32* @ih, align 4, !opID !710, !opSignedness !6
  call void @profOp(i64 1052, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %63 = load i32, i32* @dec_nbh, align 4, !opID !711, !opSignedness !6
  call void @profOp(i64 1053, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call30 = call i32 @logsch(i32 %62, i32 %63), !opID !712, !opSignedness !6
  call void @profOp(i64 1054, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call30, i32* @dec_nbh, align 4, !opID !713, !opSignedness !6
  call void @profOp(i64 1055, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %64 = load i32, i32* @dec_nbh, align 4, !opID !714, !opSignedness !6
  call void @profOp(i64 1056, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call31 = call i32 @scalel(i32 %64, i32 10), !opID !715, !opSignedness !6
  call void @profOp(i64 1057, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call31, i32* @dec_deth, align 4, !opID !716, !opSignedness !6
  call void @profOp(i64 1058, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %65 = load i32, i32* @dec_dh, align 4, !opID !717, !opSignedness !6
  call void @profOp(i64 1059, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %66 = load i32, i32* @dec_szh, align 4, !opID !718, !opSignedness !6
  call void @profOp(i64 1060, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add32 = add i32 %65, %66, !opID !719, !opSignedness !6
  %67 = sext i32 %add32 to i64
  call void @profOp(i64 1061, i8 11, i64 %67, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add32, i32* @dec_ph, align 4, !opID !720, !opSignedness !6
  call void @profOp(i64 1062, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %68 = load i32, i32* @dec_dh, align 4, !opID !721, !opSignedness !6
  call void @profOp(i64 1063, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  call void @upzero(i32 %68, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0)), !opID !722, !opSignedness !6
  call void @profOp(i64 1064, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %69 = load i32, i32* @dec_ah1, align 4, !opID !723, !opSignedness !6
  call void @profOp(i64 1065, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %70 = load i32, i32* @dec_ah2, align 4, !opID !724, !opSignedness !6
  call void @profOp(i64 1066, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %71 = load i32, i32* @dec_ph, align 4, !opID !725, !opSignedness !6
  call void @profOp(i64 1067, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %72 = load i32, i32* @dec_ph1, align 4, !opID !726, !opSignedness !6
  call void @profOp(i64 1068, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %73 = load i32, i32* @dec_ph2, align 4, !opID !727, !opSignedness !6
  call void @profOp(i64 1069, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call33 = call i32 @uppol2(i32 %69, i32 %70, i32 %71, i32 %72, i32 %73), !opID !728, !opSignedness !6
  call void @profOp(i64 1070, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call33, i32* @dec_ah2, align 4, !opID !729, !opSignedness !6
  call void @profOp(i64 1071, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %74 = load i32, i32* @dec_ah1, align 4, !opID !730, !opSignedness !6
  call void @profOp(i64 1072, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %75 = load i32, i32* @dec_ah2, align 4, !opID !731, !opSignedness !6
  call void @profOp(i64 1073, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %76 = load i32, i32* @dec_ph, align 4, !opID !732, !opSignedness !6
  call void @profOp(i64 1074, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %77 = load i32, i32* @dec_ph1, align 4, !opID !733, !opSignedness !6
  call void @profOp(i64 1075, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call34 = call i32 @uppol1(i32 %74, i32 %75, i32 %76, i32 %77), !opID !734, !opSignedness !6
  call void @profOp(i64 1076, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %call34, i32* @dec_ah1, align 4, !opID !735, !opSignedness !6
  call void @profOp(i64 1077, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %78 = load i32, i32* @dec_sh, align 4, !opID !736, !opSignedness !6
  call void @profOp(i64 1078, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %79 = load i32, i32* @dec_dh, align 4, !opID !737, !opSignedness !6
  call void @profOp(i64 1079, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add35 = add i32 %78, %79, !opID !738, !opSignedness !6
  %80 = sext i32 %add35 to i64
  call void @profOp(i64 1080, i8 11, i64 %80, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add35, i32* @rh, align 4, !opID !739, !opSignedness !6
  call void @profOp(i64 1081, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %81 = load i32, i32* @dec_rh1, align 4, !opID !740, !opSignedness !6
  call void @profOp(i64 1082, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %81, i32* @dec_rh2, align 4, !opID !741, !opSignedness !6
  call void @profOp(i64 1083, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %82 = load i32, i32* @rh, align 4, !opID !742, !opSignedness !6
  call void @profOp(i64 1084, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %82, i32* @dec_rh1, align 4, !opID !743, !opSignedness !6
  call void @profOp(i64 1085, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %83 = load i32, i32* @dec_ph1, align 4, !opID !744, !opSignedness !6
  call void @profOp(i64 1086, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %83, i32* @dec_ph2, align 4, !opID !745, !opSignedness !6
  call void @profOp(i64 1087, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %84 = load i32, i32* @dec_ph, align 4, !opID !746, !opSignedness !6
  call void @profOp(i64 1088, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %84, i32* @dec_ph1, align 4, !opID !747, !opSignedness !6
  call void @profOp(i64 1089, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %85 = load i32, i32* @rl, align 4, !opID !748, !opSignedness !6
  call void @profOp(i64 1090, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %86 = load i32, i32* @rh, align 4, !opID !749, !opSignedness !6
  call void @profOp(i64 1091, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %sub = sub i32 %85, %86, !opID !750, !opSignedness !6
  %87 = sext i32 %sub to i64
  call void @profOp(i64 1092, i8 13, i64 %87, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %sub, i32* @xd, align 4, !opID !751, !opSignedness !6
  call void @profOp(i64 1093, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %88 = load i32, i32* @rl, align 4, !opID !752, !opSignedness !6
  call void @profOp(i64 1094, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %89 = load i32, i32* @rh, align 4, !opID !753, !opSignedness !6
  call void @profOp(i64 1095, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add36 = add i32 %88, %89, !opID !754, !opSignedness !6
  %90 = sext i32 %add36 to i64
  call void @profOp(i64 1096, i8 11, i64 %90, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add36, i32* @xs, align 4, !opID !755, !opSignedness !6
  call void @profOp(i64 1097, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 8, !opID !756, !opSignedness !6
  call void @profOp(i64 1098, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 0), i32** %ac_ptr, align 8, !opID !757, !opSignedness !6
  call void @profOp(i64 1099, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 0), i32** %ad_ptr, align 8, !opID !758, !opSignedness !6
  call void @profOp(i64 1100, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %91 = load i32, i32* @xd, align 4, !opID !759, !opSignedness !6
  call void @profOp(i64 1101, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv37 = sext i32 %91 to i64, !opID !760, !opSignedness !6
  call void @profOp(i64 1102, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %92 = load i32*, i32** %h_ptr, align 8, !opID !761, !opSignedness !6
  call void @profOp(i64 1103, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr = getelementptr inbounds i32, i32* %92, i32 1, !opID !762, !opSignedness !6
  call void @profOp(i64 1104, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr, i32** %h_ptr, align 8, !opID !763, !opSignedness !6
  call void @profOp(i64 1105, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %93 = load i32, i32* %92, align 4, !opID !764, !opSignedness !6
  call void @profOp(i64 1106, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv38 = sext i32 %93 to i64, !opID !765, !opSignedness !6
  call void @profOp(i64 1107, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul39 = mul i64 %conv37, %conv38, !opID !766, !opSignedness !6
  call void @profOp(i64 1108, i8 15, i64 %mul39, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %mul39, i64* %xa1, align 8, !opID !767, !opSignedness !6
  call void @profOp(i64 1109, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %94 = load i32, i32* @xs, align 4, !opID !768, !opSignedness !6
  call void @profOp(i64 1110, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv40 = sext i32 %94 to i64, !opID !769, !opSignedness !6
  call void @profOp(i64 1111, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %95 = load i32*, i32** %h_ptr, align 8, !opID !770, !opSignedness !6
  call void @profOp(i64 1112, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr41 = getelementptr inbounds i32, i32* %95, i32 1, !opID !771, !opSignedness !6
  call void @profOp(i64 1113, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr41, i32** %h_ptr, align 8, !opID !772, !opSignedness !6
  call void @profOp(i64 1114, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %96 = load i32, i32* %95, align 4, !opID !773, !opSignedness !6
  call void @profOp(i64 1115, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv42 = sext i32 %96 to i64, !opID !774, !opSignedness !6
  call void @profOp(i64 1116, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul43 = mul i64 %conv40, %conv42, !opID !775, !opSignedness !6
  call void @profOp(i64 1117, i8 15, i64 %mul43, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %mul43, i64* %xa2, align 8, !opID !776, !opSignedness !6
  call void @profOp(i64 1118, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %decode_label2, !opID !777, !opSignedness !6

decode_label2:                                    ; preds = %entry
  store i32 0, i32* %i, align 4, !opID !778, !opSignedness !6
  call void @profOp(i64 1120, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond, !opID !779, !opSignedness !6

for.cond:                                         ; preds = %for.inc, %decode_label2
  %97 = load i32, i32* %i, align 4, !opID !780, !opSignedness !6
  call void @profOp(i64 1122, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp = icmp slt i32 %97, 10, !opID !781, !opSignedness !6
  call void @profOp(i64 1123, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp, label %for.body, label %for.end, !opID !782, !opSignedness !6

for.body:                                         ; preds = %for.cond
  %98 = load i32*, i32** %ac_ptr, align 8, !opID !783, !opSignedness !6
  call void @profOp(i64 1125, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr44 = getelementptr inbounds i32, i32* %98, i32 1, !opID !784, !opSignedness !6
  call void @profOp(i64 1126, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr44, i32** %ac_ptr, align 8, !opID !785, !opSignedness !6
  call void @profOp(i64 1127, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %99 = load i32, i32* %98, align 4, !opID !786, !opSignedness !6
  call void @profOp(i64 1128, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv45 = sext i32 %99 to i64, !opID !787, !opSignedness !6
  call void @profOp(i64 1129, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %100 = load i32*, i32** %h_ptr, align 8, !opID !788, !opSignedness !6
  call void @profOp(i64 1130, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr46 = getelementptr inbounds i32, i32* %100, i32 1, !opID !789, !opSignedness !6
  call void @profOp(i64 1131, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr46, i32** %h_ptr, align 8, !opID !790, !opSignedness !6
  call void @profOp(i64 1132, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %101 = load i32, i32* %100, align 4, !opID !791, !opSignedness !6
  call void @profOp(i64 1133, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv47 = sext i32 %101 to i64, !opID !792, !opSignedness !6
  call void @profOp(i64 1134, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul48 = mul i64 %conv45, %conv47, !opID !793, !opSignedness !6
  call void @profOp(i64 1135, i8 15, i64 %mul48, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %102 = load i64, i64* %xa1, align 8, !opID !794, !opSignedness !6
  call void @profOp(i64 1136, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %add49 = add i64 %102, %mul48, !opID !795, !opSignedness !6
  call void @profOp(i64 1137, i8 11, i64 %add49, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %add49, i64* %xa1, align 8, !opID !796, !opSignedness !6
  call void @profOp(i64 1138, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %103 = load i32*, i32** %ad_ptr, align 8, !opID !797, !opSignedness !6
  call void @profOp(i64 1139, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr50 = getelementptr inbounds i32, i32* %103, i32 1, !opID !798, !opSignedness !6
  call void @profOp(i64 1140, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr50, i32** %ad_ptr, align 8, !opID !799, !opSignedness !6
  call void @profOp(i64 1141, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %104 = load i32, i32* %103, align 4, !opID !800, !opSignedness !6
  call void @profOp(i64 1142, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv51 = sext i32 %104 to i64, !opID !801, !opSignedness !6
  call void @profOp(i64 1143, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %105 = load i32*, i32** %h_ptr, align 8, !opID !802, !opSignedness !6
  call void @profOp(i64 1144, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr52 = getelementptr inbounds i32, i32* %105, i32 1, !opID !803, !opSignedness !6
  call void @profOp(i64 1145, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr52, i32** %h_ptr, align 8, !opID !804, !opSignedness !6
  call void @profOp(i64 1146, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %106 = load i32, i32* %105, align 4, !opID !805, !opSignedness !6
  call void @profOp(i64 1147, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv53 = sext i32 %106 to i64, !opID !806, !opSignedness !6
  call void @profOp(i64 1148, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul54 = mul i64 %conv51, %conv53, !opID !807, !opSignedness !6
  call void @profOp(i64 1149, i8 15, i64 %mul54, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %107 = load i64, i64* %xa2, align 8, !opID !808, !opSignedness !6
  call void @profOp(i64 1150, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %add55 = add i64 %107, %mul54, !opID !809, !opSignedness !6
  call void @profOp(i64 1151, i8 11, i64 %add55, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %add55, i64* %xa2, align 8, !opID !810, !opSignedness !6
  call void @profOp(i64 1152, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.inc, !opID !811, !opSignedness !6

for.inc:                                          ; preds = %for.body
  %108 = load i32, i32* %i, align 4, !opID !812, !opSignedness !6
  call void @profOp(i64 1154, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %inc = add i32 %108, 1, !opID !813, !opSignedness !6
  %109 = sext i32 %inc to i64
  call void @profOp(i64 1155, i8 11, i64 %109, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %inc, i32* %i, align 4, !opID !814, !opSignedness !6
  call void @profOp(i64 1156, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond, !llvm.loop !815, !opID !817, !opSignedness !6

for.end:                                          ; preds = %for.cond
  %110 = load i32*, i32** %ac_ptr, align 8, !opID !818, !opSignedness !6
  call void @profOp(i64 1158, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %111 = load i32, i32* %110, align 4, !opID !819, !opSignedness !6
  call void @profOp(i64 1159, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv56 = sext i32 %111 to i64, !opID !820, !opSignedness !6
  call void @profOp(i64 1160, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %112 = load i32*, i32** %h_ptr, align 8, !opID !821, !opSignedness !6
  call void @profOp(i64 1161, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr57 = getelementptr inbounds i32, i32* %112, i32 1, !opID !822, !opSignedness !6
  call void @profOp(i64 1162, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr57, i32** %h_ptr, align 8, !opID !823, !opSignedness !6
  call void @profOp(i64 1163, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %113 = load i32, i32* %112, align 4, !opID !824, !opSignedness !6
  call void @profOp(i64 1164, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv58 = sext i32 %113 to i64, !opID !825, !opSignedness !6
  call void @profOp(i64 1165, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul59 = mul i64 %conv56, %conv58, !opID !826, !opSignedness !6
  call void @profOp(i64 1166, i8 15, i64 %mul59, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %114 = load i64, i64* %xa1, align 8, !opID !827, !opSignedness !6
  call void @profOp(i64 1167, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %add60 = add i64 %114, %mul59, !opID !828, !opSignedness !6
  call void @profOp(i64 1168, i8 11, i64 %add60, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %add60, i64* %xa1, align 8, !opID !829, !opSignedness !6
  call void @profOp(i64 1169, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %115 = load i32*, i32** %ad_ptr, align 8, !opID !830, !opSignedness !6
  call void @profOp(i64 1170, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %116 = load i32, i32* %115, align 4, !opID !831, !opSignedness !6
  call void @profOp(i64 1171, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv61 = sext i32 %116 to i64, !opID !832, !opSignedness !6
  call void @profOp(i64 1172, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %117 = load i32*, i32** %h_ptr, align 8, !opID !833, !opSignedness !6
  call void @profOp(i64 1173, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr62 = getelementptr inbounds i32, i32* %117, i32 1, !opID !834, !opSignedness !6
  call void @profOp(i64 1174, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr62, i32** %h_ptr, align 8, !opID !835, !opSignedness !6
  call void @profOp(i64 1175, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %118 = load i32, i32* %117, align 4, !opID !836, !opSignedness !6
  call void @profOp(i64 1176, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv63 = sext i32 %118 to i64, !opID !837, !opSignedness !6
  call void @profOp(i64 1177, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul64 = mul i64 %conv61, %conv63, !opID !838, !opSignedness !6
  call void @profOp(i64 1178, i8 15, i64 %mul64, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %119 = load i64, i64* %xa2, align 8, !opID !839, !opSignedness !6
  call void @profOp(i64 1179, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %add65 = add i64 %119, %mul64, !opID !840, !opSignedness !6
  call void @profOp(i64 1180, i8 11, i64 %add65, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %add65, i64* %xa2, align 8, !opID !841, !opSignedness !6
  call void @profOp(i64 1181, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %120 = load i64, i64* %xa1, align 8, !opID !842, !opSignedness !6
  call void @profOp(i64 1182, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %shr66 = ashr i64 %120, 14, !opID !843, !opSignedness !6
  call void @profOp(i64 1183, i8 25, i64 %shr66, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv67 = trunc i64 %shr66 to i32, !opID !844, !opSignedness !6
  call void @profOp(i64 1184, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %conv67, i32* @xout1, align 4, !opID !845, !opSignedness !6
  call void @profOp(i64 1185, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %121 = load i64, i64* %xa2, align 8, !opID !846, !opSignedness !6
  call void @profOp(i64 1186, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %shr68 = ashr i64 %121, 14, !opID !847, !opSignedness !6
  call void @profOp(i64 1187, i8 25, i64 %shr68, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv69 = trunc i64 %shr68 to i32, !opID !848, !opSignedness !6
  call void @profOp(i64 1188, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %conv69, i32* @xout2, align 4, !opID !849, !opSignedness !6
  call void @profOp(i64 1189, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %122 = load i32*, i32** %ac_ptr, align 8, !opID !850, !opSignedness !6
  call void @profOp(i64 1190, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %add.ptr = getelementptr inbounds i32, i32* %122, i64 -1, !opID !851, !opSignedness !6
  call void @profOp(i64 1191, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %add.ptr, i32** %ac_ptr1, align 8, !opID !852, !opSignedness !6
  call void @profOp(i64 1192, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %123 = load i32*, i32** %ad_ptr, align 8, !opID !853, !opSignedness !6
  call void @profOp(i64 1193, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %add.ptr70 = getelementptr inbounds i32, i32* %123, i64 -1, !opID !854, !opSignedness !6
  call void @profOp(i64 1194, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %add.ptr70, i32** %ad_ptr1, align 8, !opID !855, !opSignedness !6
  call void @profOp(i64 1195, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %decode_label3, !opID !856, !opSignedness !6

decode_label3:                                    ; preds = %for.end
  store i32 0, i32* %i, align 4, !opID !857, !opSignedness !6
  call void @profOp(i64 1197, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond71, !opID !858, !opSignedness !6

for.cond71:                                       ; preds = %for.inc78, %decode_label3
  %124 = load i32, i32* %i, align 4, !opID !859, !opSignedness !6
  call void @profOp(i64 1199, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp72 = icmp slt i32 %124, 10, !opID !860, !opSignedness !6
  call void @profOp(i64 1200, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp72, label %for.body73, label %for.end80, !opID !861, !opSignedness !6

for.body73:                                       ; preds = %for.cond71
  %125 = load i32*, i32** %ac_ptr1, align 8, !opID !862, !opSignedness !6
  call void @profOp(i64 1202, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr74 = getelementptr inbounds i32, i32* %125, i32 -1, !opID !863, !opSignedness !6
  call void @profOp(i64 1203, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr74, i32** %ac_ptr1, align 8, !opID !864, !opSignedness !6
  call void @profOp(i64 1204, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %126 = load i32, i32* %125, align 4, !opID !865, !opSignedness !6
  call void @profOp(i64 1205, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %127 = load i32*, i32** %ac_ptr, align 8, !opID !866, !opSignedness !6
  call void @profOp(i64 1206, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr75 = getelementptr inbounds i32, i32* %127, i32 -1, !opID !867, !opSignedness !6
  call void @profOp(i64 1207, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr75, i32** %ac_ptr, align 8, !opID !868, !opSignedness !6
  call void @profOp(i64 1208, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %126, i32* %127, align 4, !opID !869, !opSignedness !6
  call void @profOp(i64 1209, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %128 = load i32*, i32** %ad_ptr1, align 8, !opID !870, !opSignedness !6
  call void @profOp(i64 1210, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr76 = getelementptr inbounds i32, i32* %128, i32 -1, !opID !871, !opSignedness !6
  call void @profOp(i64 1211, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr76, i32** %ad_ptr1, align 8, !opID !872, !opSignedness !6
  call void @profOp(i64 1212, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %129 = load i32, i32* %128, align 4, !opID !873, !opSignedness !6
  call void @profOp(i64 1213, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %130 = load i32*, i32** %ad_ptr, align 8, !opID !874, !opSignedness !6
  call void @profOp(i64 1214, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr77 = getelementptr inbounds i32, i32* %130, i32 -1, !opID !875, !opSignedness !6
  call void @profOp(i64 1215, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr77, i32** %ad_ptr, align 8, !opID !876, !opSignedness !6
  call void @profOp(i64 1216, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %129, i32* %130, align 4, !opID !877, !opSignedness !6
  call void @profOp(i64 1217, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.inc78, !opID !878, !opSignedness !6

for.inc78:                                        ; preds = %for.body73
  %131 = load i32, i32* %i, align 4, !opID !879, !opSignedness !6
  call void @profOp(i64 1219, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %inc79 = add i32 %131, 1, !opID !880, !opSignedness !6
  %132 = sext i32 %inc79 to i64
  call void @profOp(i64 1220, i8 11, i64 %132, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %inc79, i32* %i, align 4, !opID !881, !opSignedness !6
  call void @profOp(i64 1221, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond71, !llvm.loop !882, !opID !884, !opSignedness !6

for.end80:                                        ; preds = %for.cond71
  %133 = load i32, i32* @xd, align 4, !opID !885, !opSignedness !6
  call void @profOp(i64 1223, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %134 = load i32*, i32** %ac_ptr, align 8, !opID !886, !opSignedness !6
  call void @profOp(i64 1224, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 %133, i32* %134, align 4, !opID !887, !opSignedness !6
  call void @profOp(i64 1225, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %135 = load i32, i32* @xs, align 4, !opID !888, !opSignedness !6
  call void @profOp(i64 1226, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %136 = load i32*, i32** %ad_ptr, align 8, !opID !889, !opSignedness !6
  call void @profOp(i64 1227, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 %135, i32* %136, align 4, !opID !890, !opSignedness !6
  call void @profOp(i64 1228, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %137 = bitcast i32** %ad_ptr1 to i8*, !opID !891, !opSignedness !6
  call void @profOp(i64 1229, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %137) #8, !opID !892, !opSignedness !6
  call void @profOp(i64 1230, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %138 = bitcast i32** %ad_ptr to i8*, !opID !893, !opSignedness !6
  call void @profOp(i64 1231, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %138) #8, !opID !894, !opSignedness !6
  call void @profOp(i64 1232, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %139 = bitcast i32** %ac_ptr1 to i8*, !opID !895, !opSignedness !6
  call void @profOp(i64 1233, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %139) #8, !opID !896, !opSignedness !6
  call void @profOp(i64 1234, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %140 = bitcast i32** %ac_ptr to i8*, !opID !897, !opSignedness !6
  call void @profOp(i64 1235, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %140) #8, !opID !898, !opSignedness !6
  call void @profOp(i64 1236, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %141 = bitcast i32** %h_ptr to i8*, !opID !899, !opSignedness !6
  call void @profOp(i64 1237, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %141) #8, !opID !900, !opSignedness !6
  call void @profOp(i64 1238, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %142 = bitcast i64* %xa2 to i8*, !opID !901, !opSignedness !6
  call void @profOp(i64 1239, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %142) #8, !opID !902, !opSignedness !6
  call void @profOp(i64 1240, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %143 = bitcast i64* %xa1 to i8*, !opID !903, !opSignedness !6
  call void @profOp(i64 1241, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %143) #8, !opID !904, !opSignedness !6
  call void @profOp(i64 1242, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %144 = bitcast i32* %i to i8*, !opID !905, !opSignedness !6
  call void @profOp(i64 1243, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %144) #8, !opID !906, !opSignedness !6
  call void @profOp(i64 1244, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  ret void, !opID !907, !opSignedness !6
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
define i32 @filtez(i32* %bpl, i32* %dlt) #3 {
entry:
  %bpl.addr = alloca i32*, align 8, !opID !908, !opSignedness !6
  call void @profOp(i64 370, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 5, i1 false)
  %dlt.addr = alloca i32*, align 8, !opID !909, !opSignedness !6
  call void @profOp(i64 371, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 5, i1 false)
  %i = alloca i32, align 4, !opID !910, !opSignedness !6
  call void @profOp(i64 372, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 6, i1 false)
  %zl = alloca i64, align 8, !opID !911, !opSignedness !6
  call void @profOp(i64 373, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 6, i1 false)
  store i32* %bpl, i32** %bpl.addr, align 8, !opID !912, !opSignedness !6
  call void @profOp(i64 374, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32* %dlt, i32** %dlt.addr, align 8, !opID !913, !opSignedness !6
  call void @profOp(i64 375, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %0 = bitcast i32* %i to i8*, !opID !914, !opSignedness !6
  call void @profOp(i64 376, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !915, !opSignedness !6
  call void @profOp(i64 377, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %1 = bitcast i64* %zl to i8*, !opID !916, !opSignedness !6
  call void @profOp(i64 378, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #8, !opID !917, !opSignedness !6
  call void @profOp(i64 379, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %2 = load i32*, i32** %bpl.addr, align 8, !opID !918, !opSignedness !6
  call void @profOp(i64 380, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr = getelementptr inbounds i32, i32* %2, i32 1, !opID !919, !opSignedness !6
  call void @profOp(i64 381, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr, i32** %bpl.addr, align 8, !opID !920, !opSignedness !6
  call void @profOp(i64 382, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %3 = load i32, i32* %2, align 4, !opID !921, !opSignedness !6
  call void @profOp(i64 383, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv = sext i32 %3 to i64, !opID !922, !opSignedness !6
  call void @profOp(i64 384, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %4 = load i32*, i32** %dlt.addr, align 8, !opID !923, !opSignedness !6
  call void @profOp(i64 385, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr1 = getelementptr inbounds i32, i32* %4, i32 1, !opID !924, !opSignedness !6
  call void @profOp(i64 386, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr1, i32** %dlt.addr, align 8, !opID !925, !opSignedness !6
  call void @profOp(i64 387, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %5 = load i32, i32* %4, align 4, !opID !926, !opSignedness !6
  call void @profOp(i64 388, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv2 = sext i32 %5 to i64, !opID !927, !opSignedness !6
  call void @profOp(i64 389, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul = mul i64 %conv, %conv2, !opID !928, !opSignedness !6
  call void @profOp(i64 390, i8 15, i64 %mul, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %mul, i64* %zl, align 8, !opID !929, !opSignedness !6
  call void @profOp(i64 391, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %filtez_label8, !opID !930, !opSignedness !6

filtez_label8:                                    ; preds = %entry
  store i32 1, i32* %i, align 4, !opID !931, !opSignedness !6
  call void @profOp(i64 393, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond, !opID !932, !opSignedness !6

for.cond:                                         ; preds = %for.inc, %filtez_label8
  %6 = load i32, i32* %i, align 4, !opID !933, !opSignedness !6
  call void @profOp(i64 395, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp = icmp slt i32 %6, 6, !opID !934, !opSignedness !6
  call void @profOp(i64 396, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp, label %for.body, label %for.end, !opID !935, !opSignedness !6

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %bpl.addr, align 8, !opID !936, !opSignedness !6
  call void @profOp(i64 398, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr3 = getelementptr inbounds i32, i32* %7, i32 1, !opID !937, !opSignedness !6
  call void @profOp(i64 399, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr3, i32** %bpl.addr, align 8, !opID !938, !opSignedness !6
  call void @profOp(i64 400, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %8 = load i32, i32* %7, align 4, !opID !939, !opSignedness !6
  call void @profOp(i64 401, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv4 = sext i32 %8 to i64, !opID !940, !opSignedness !6
  call void @profOp(i64 402, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %9 = load i32*, i32** %dlt.addr, align 8, !opID !941, !opSignedness !6
  call void @profOp(i64 403, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %incdec.ptr5 = getelementptr inbounds i32, i32* %9, i32 1, !opID !942, !opSignedness !6
  call void @profOp(i64 404, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32* %incdec.ptr5, i32** %dlt.addr, align 8, !opID !943, !opSignedness !6
  call void @profOp(i64 405, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %10 = load i32, i32* %9, align 4, !opID !944, !opSignedness !6
  call void @profOp(i64 406, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv6 = sext i32 %10 to i64, !opID !945, !opSignedness !6
  call void @profOp(i64 407, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul7 = mul i64 %conv4, %conv6, !opID !946, !opSignedness !6
  call void @profOp(i64 408, i8 15, i64 %mul7, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %11 = load i64, i64* %zl, align 8, !opID !947, !opSignedness !6
  call void @profOp(i64 409, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %add = add i64 %11, %mul7, !opID !948, !opSignedness !6
  call void @profOp(i64 410, i8 11, i64 %add, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %add, i64* %zl, align 8, !opID !949, !opSignedness !6
  call void @profOp(i64 411, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.inc, !opID !950, !opSignedness !6

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !opID !951, !opSignedness !6
  call void @profOp(i64 413, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %inc = add i32 %12, 1, !opID !952, !opSignedness !6
  %13 = sext i32 %inc to i64
  call void @profOp(i64 414, i8 11, i64 %13, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %inc, i32* %i, align 4, !opID !953, !opSignedness !6
  call void @profOp(i64 415, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond, !llvm.loop !954, !opID !956, !opSignedness !6

for.end:                                          ; preds = %for.cond
  %14 = load i64, i64* %zl, align 8, !opID !957, !opSignedness !6
  call void @profOp(i64 417, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %shr = ashr i64 %14, 14, !opID !958, !opSignedness !6
  call void @profOp(i64 418, i8 25, i64 %shr, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv8 = trunc i64 %shr to i32, !opID !959, !opSignedness !6
  call void @profOp(i64 419, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %15 = bitcast i64* %zl to i8*, !opID !960, !opSignedness !6
  call void @profOp(i64 420, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %15) #8, !opID !961, !opSignedness !6
  call void @profOp(i64 421, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %16 = bitcast i32* %i to i8*, !opID !962, !opSignedness !6
  call void @profOp(i64 422, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #8, !opID !963, !opSignedness !6
  call void @profOp(i64 423, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  ret i32 %conv8, !opID !964, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @filtep(i32 %rlt1, i32 %al1, i32 %rlt2, i32 %al2) #3 {
entry:
  %rlt1.addr = alloca i32, align 4, !opID !965, !opSignedness !6
  call void @profOp(i64 425, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %al1.addr = alloca i32, align 4, !opID !966, !opSignedness !6
  call void @profOp(i64 426, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %rlt2.addr = alloca i32, align 4, !opID !967, !opSignedness !6
  call void @profOp(i64 427, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %al2.addr = alloca i32, align 4, !opID !968, !opSignedness !6
  call void @profOp(i64 428, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %pl = alloca i64, align 8, !opID !969, !opSignedness !6
  call void @profOp(i64 429, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 8, i1 false)
  %pl2 = alloca i64, align 8, !opID !970, !opSignedness !6
  call void @profOp(i64 430, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 4, i1 false)
  store i32 %rlt1, i32* %rlt1.addr, align 4, !opID !971, !opSignedness !6
  call void @profOp(i64 431, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %al1, i32* %al1.addr, align 4, !opID !972, !opSignedness !6
  call void @profOp(i64 432, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %rlt2, i32* %rlt2.addr, align 4, !opID !973, !opSignedness !6
  call void @profOp(i64 433, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %al2, i32* %al2.addr, align 4, !opID !974, !opSignedness !6
  call void @profOp(i64 434, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %0 = bitcast i64* %pl to i8*, !opID !975, !opSignedness !6
  call void @profOp(i64 435, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #8, !opID !976, !opSignedness !6
  call void @profOp(i64 436, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %1 = bitcast i64* %pl2 to i8*, !opID !977, !opSignedness !6
  call void @profOp(i64 437, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #8, !opID !978, !opSignedness !6
  call void @profOp(i64 438, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %2 = load i32, i32* %rlt1.addr, align 4, !opID !979, !opSignedness !6
  call void @profOp(i64 439, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %mul = mul i32 2, %2, !opID !980, !opSignedness !6
  %3 = sext i32 %mul to i64
  call void @profOp(i64 440, i8 15, i64 %3, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %conv = sext i32 %mul to i64, !opID !981, !opSignedness !6
  call void @profOp(i64 441, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  store i64 %conv, i64* %pl, align 8, !opID !982, !opSignedness !6
  call void @profOp(i64 442, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %4 = load i32, i32* %al1.addr, align 4, !opID !983, !opSignedness !6
  call void @profOp(i64 443, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv1 = sext i32 %4 to i64, !opID !984, !opSignedness !6
  call void @profOp(i64 444, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %5 = load i64, i64* %pl, align 8, !opID !985, !opSignedness !6
  call void @profOp(i64 445, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul2 = mul i64 %conv1, %5, !opID !986, !opSignedness !6
  call void @profOp(i64 446, i8 15, i64 %mul2, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %mul2, i64* %pl, align 8, !opID !987, !opSignedness !6
  call void @profOp(i64 447, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %6 = load i32, i32* %rlt2.addr, align 4, !opID !988, !opSignedness !6
  call void @profOp(i64 448, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %mul3 = mul i32 2, %6, !opID !989, !opSignedness !6
  %7 = sext i32 %mul3 to i64
  call void @profOp(i64 449, i8 15, i64 %7, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %conv4 = sext i32 %mul3 to i64, !opID !990, !opSignedness !6
  call void @profOp(i64 450, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  store i64 %conv4, i64* %pl2, align 8, !opID !991, !opSignedness !6
  call void @profOp(i64 451, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %8 = load i32, i32* %al2.addr, align 4, !opID !992, !opSignedness !6
  call void @profOp(i64 452, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv5 = sext i32 %8 to i64, !opID !993, !opSignedness !6
  call void @profOp(i64 453, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %9 = load i64, i64* %pl2, align 8, !opID !994, !opSignedness !6
  call void @profOp(i64 454, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul6 = mul i64 %conv5, %9, !opID !995, !opSignedness !6
  call void @profOp(i64 455, i8 15, i64 %mul6, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %10 = load i64, i64* %pl, align 8, !opID !996, !opSignedness !6
  call void @profOp(i64 456, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %add = add i64 %10, %mul6, !opID !997, !opSignedness !6
  call void @profOp(i64 457, i8 11, i64 %add, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %add, i64* %pl, align 8, !opID !998, !opSignedness !6
  call void @profOp(i64 458, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %11 = load i64, i64* %pl, align 8, !opID !999, !opSignedness !6
  call void @profOp(i64 459, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %shr = ashr i64 %11, 15, !opID !1000, !opSignedness !6
  call void @profOp(i64 460, i8 25, i64 %shr, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv7 = trunc i64 %shr to i32, !opID !1001, !opSignedness !6
  call void @profOp(i64 461, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %12 = bitcast i64* %pl2 to i8*, !opID !1002, !opSignedness !6
  call void @profOp(i64 462, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %12) #8, !opID !1003, !opSignedness !6
  call void @profOp(i64 463, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %13 = bitcast i64* %pl to i8*, !opID !1004, !opSignedness !6
  call void @profOp(i64 464, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %13) #8, !opID !1005, !opSignedness !6
  call void @profOp(i64 465, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  ret i32 %conv7, !opID !1006, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @logscl(i32 %il, i32 %nbl) #3 {
entry:
  %il.addr = alloca i32, align 4, !opID !1007, !opSignedness !6
  call void @profOp(i64 538, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %nbl.addr = alloca i32, align 4, !opID !1008, !opSignedness !6
  call void @profOp(i64 539, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 8, i1 false)
  %wd = alloca i64, align 8, !opID !1009, !opSignedness !6
  call void @profOp(i64 540, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 4, i1 false)
  store i32 %il, i32* %il.addr, align 4, !opID !1010, !opSignedness !6
  call void @profOp(i64 541, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %nbl, i32* %nbl.addr, align 4, !opID !1011, !opSignedness !6
  call void @profOp(i64 542, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %0 = bitcast i64* %wd to i8*, !opID !1012, !opSignedness !6
  call void @profOp(i64 543, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #8, !opID !1013, !opSignedness !6
  call void @profOp(i64 544, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %1 = load i32, i32* %nbl.addr, align 4, !opID !1014, !opSignedness !6
  call void @profOp(i64 545, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv = sext i32 %1 to i64, !opID !1015, !opSignedness !6
  call void @profOp(i64 546, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul = mul i64 %conv, 127, !opID !1016, !opSignedness !6
  call void @profOp(i64 547, i8 15, i64 %mul, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %shr = ashr i64 %mul, 7, !opID !1017, !opSignedness !6
  call void @profOp(i64 548, i8 25, i64 %shr, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %shr, i64* %wd, align 8, !opID !1018, !opSignedness !6
  call void @profOp(i64 549, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %2 = load i64, i64* %wd, align 8, !opID !1019, !opSignedness !6
  call void @profOp(i64 550, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %conv1 = trunc i64 %2 to i32, !opID !1020, !opSignedness !6
  call void @profOp(i64 551, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %3 = load i32, i32* %il.addr, align 4, !opID !1021, !opSignedness !6
  call void @profOp(i64 552, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %shr2 = ashr i32 %3, 2, !opID !1022, !opSignedness !6
  %4 = sext i32 %shr2 to i64
  call void @profOp(i64 553, i8 25, i64 %4, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %idxprom = sext i32 %shr2 to i64, !opID !1023, !opSignedness !6
  call void @profOp(i64 554, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @wl_code_table, i64 0, i64 %idxprom, !opID !1024, !opSignedness !6
  call void @profOp(i64 555, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %5 = load i32, i32* %arrayidx, align 4, !opID !1025, !opSignedness !6
  call void @profOp(i64 556, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add = add i32 %conv1, %5, !opID !1026, !opSignedness !6
  %6 = sext i32 %add to i64
  call void @profOp(i64 557, i8 11, i64 %6, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add, i32* %nbl.addr, align 4, !opID !1027, !opSignedness !6
  call void @profOp(i64 558, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %7 = load i32, i32* %nbl.addr, align 4, !opID !1028, !opSignedness !6
  call void @profOp(i64 559, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp = icmp slt i32 %7, 0, !opID !1029, !opSignedness !6
  call void @profOp(i64 560, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp, label %if.then, label %if.end, !opID !1030, !opSignedness !6

if.then:                                          ; preds = %entry
  store i32 0, i32* %nbl.addr, align 4, !opID !1031, !opSignedness !6
  call void @profOp(i64 562, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end, !opID !1032, !opSignedness !6

if.end:                                           ; preds = %if.then, %entry
  %8 = load i32, i32* %nbl.addr, align 4, !opID !1033, !opSignedness !6
  call void @profOp(i64 564, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp3 = icmp sgt i32 %8, 18432, !opID !1034, !opSignedness !6
  call void @profOp(i64 565, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp3, label %if.then4, label %if.end5, !opID !1035, !opSignedness !6

if.then4:                                         ; preds = %if.end
  store i32 18432, i32* %nbl.addr, align 4, !opID !1036, !opSignedness !6
  call void @profOp(i64 567, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end5, !opID !1037, !opSignedness !6

if.end5:                                          ; preds = %if.then4, %if.end
  %9 = load i32, i32* %nbl.addr, align 4, !opID !1038, !opSignedness !6
  call void @profOp(i64 569, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %10 = bitcast i64* %wd to i8*, !opID !1039, !opSignedness !6
  call void @profOp(i64 570, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %10) #8, !opID !1040, !opSignedness !6
  call void @profOp(i64 571, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  ret i32 %9, !opID !1041, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @scalel(i32 %nbl, i32 %shift_constant) #3 {
entry:
  %nbl.addr = alloca i32, align 4, !opID !1042, !opSignedness !6
  call void @profOp(i64 573, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 3, i1 false)
  %shift_constant.addr = alloca i32, align 4, !opID !1043, !opSignedness !6
  call void @profOp(i64 574, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %wd1 = alloca i32, align 4, !opID !1044, !opSignedness !6
  call void @profOp(i64 575, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 4, i1 false)
  %wd2 = alloca i32, align 4, !opID !1045, !opSignedness !6
  call void @profOp(i64 576, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 4, i1 false)
  %wd3 = alloca i32, align 4, !opID !1046, !opSignedness !6
  call void @profOp(i64 577, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 4, i1 false)
  store i32 %nbl, i32* %nbl.addr, align 4, !opID !1047, !opSignedness !6
  call void @profOp(i64 578, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %shift_constant, i32* %shift_constant.addr, align 4, !opID !1048, !opSignedness !6
  call void @profOp(i64 579, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %0 = bitcast i32* %wd1 to i8*, !opID !1049, !opSignedness !6
  call void @profOp(i64 580, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !1050, !opSignedness !6
  call void @profOp(i64 581, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %1 = bitcast i32* %wd2 to i8*, !opID !1051, !opSignedness !6
  call void @profOp(i64 582, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #8, !opID !1052, !opSignedness !6
  call void @profOp(i64 583, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %2 = bitcast i32* %wd3 to i8*, !opID !1053, !opSignedness !6
  call void @profOp(i64 584, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #8, !opID !1054, !opSignedness !6
  call void @profOp(i64 585, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %3 = load i32, i32* %nbl.addr, align 4, !opID !1055, !opSignedness !6
  call void @profOp(i64 586, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %shr = ashr i32 %3, 6, !opID !1056, !opSignedness !6
  %4 = sext i32 %shr to i64
  call void @profOp(i64 587, i8 25, i64 %4, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %and = and i32 %shr, 31, !opID !1057, !opSignedness !6
  %5 = sext i32 %and to i64
  call void @profOp(i64 588, i8 26, i64 %5, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %and, i32* %wd1, align 4, !opID !1058, !opSignedness !6
  call void @profOp(i64 589, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %6 = load i32, i32* %nbl.addr, align 4, !opID !1059, !opSignedness !6
  call void @profOp(i64 590, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %shr1 = ashr i32 %6, 11, !opID !1060, !opSignedness !6
  %7 = sext i32 %shr1 to i64
  call void @profOp(i64 591, i8 25, i64 %7, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %shr1, i32* %wd2, align 4, !opID !1061, !opSignedness !6
  call void @profOp(i64 592, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %8 = load i32, i32* %wd1, align 4, !opID !1062, !opSignedness !6
  call void @profOp(i64 593, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom = sext i32 %8 to i64, !opID !1063, !opSignedness !6
  call void @profOp(i64 594, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx = getelementptr inbounds [32 x i32], [32 x i32]* @ilb_table, i64 0, i64 %idxprom, !opID !1064, !opSignedness !6
  call void @profOp(i64 595, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %9 = load i32, i32* %arrayidx, align 4, !opID !1065, !opSignedness !6
  call void @profOp(i64 596, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %10 = load i32, i32* %shift_constant.addr, align 4, !opID !1066, !opSignedness !6
  call void @profOp(i64 597, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add = add i32 %10, 1, !opID !1067, !opSignedness !6
  %11 = sext i32 %add to i64
  call void @profOp(i64 598, i8 11, i64 %11, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %12 = load i32, i32* %wd2, align 4, !opID !1068, !opSignedness !6
  call void @profOp(i64 599, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %sub = sub i32 %add, %12, !opID !1069, !opSignedness !6
  %13 = sext i32 %sub to i64
  call void @profOp(i64 600, i8 13, i64 %13, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %shr2 = ashr i32 %9, %sub, !opID !1070, !opSignedness !6
  %14 = sext i32 %shr2 to i64
  call void @profOp(i64 601, i8 25, i64 %14, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %shr2, i32* %wd3, align 4, !opID !1071, !opSignedness !6
  call void @profOp(i64 602, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %15 = load i32, i32* %wd3, align 4, !opID !1072, !opSignedness !6
  call void @profOp(i64 603, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %shl = shl i32 %15, 3, !opID !1073, !opSignedness !6
  %16 = sext i32 %shl to i64
  call void @profOp(i64 604, i8 23, i64 %16, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %17 = bitcast i32* %wd3 to i8*, !opID !1074, !opSignedness !6
  call void @profOp(i64 605, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #8, !opID !1075, !opSignedness !6
  call void @profOp(i64 606, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %18 = bitcast i32* %wd2 to i8*, !opID !1076, !opSignedness !6
  call void @profOp(i64 607, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #8, !opID !1077, !opSignedness !6
  call void @profOp(i64 608, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %19 = bitcast i32* %wd1 to i8*, !opID !1078, !opSignedness !6
  call void @profOp(i64 609, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %19) #8, !opID !1079, !opSignedness !6
  call void @profOp(i64 610, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  ret i32 %shl, !opID !1080, !opSignedness !6
}

; Function Attrs: nounwind
define void @upzero(i32 %dlt, i32* %dlti, i32* %bli) #3 {
entry:
  %dlt.addr = alloca i32, align 4, !opID !1081, !opSignedness !6
  call void @profOp(i64 612, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 4, i1 false)
  %dlti.addr = alloca i32*, align 8, !opID !1082, !opSignedness !6
  call void @profOp(i64 613, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 13, i1 false)
  %bli.addr = alloca i32*, align 8, !opID !1083, !opSignedness !6
  call void @profOp(i64 614, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 5, i1 false)
  %i = alloca i32, align 4, !opID !1084, !opSignedness !6
  call void @profOp(i64 615, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 15, i1 false)
  %wd2 = alloca i32, align 4, !opID !1085, !opSignedness !6
  call void @profOp(i64 616, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 5, i1 false)
  %wd3 = alloca i32, align 4, !opID !1086, !opSignedness !6
  call void @profOp(i64 617, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 4, i1 false)
  store i32 %dlt, i32* %dlt.addr, align 4, !opID !1087, !opSignedness !6
  call void @profOp(i64 618, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32* %dlti, i32** %dlti.addr, align 8, !opID !1088, !opSignedness !6
  call void @profOp(i64 619, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32* %bli, i32** %bli.addr, align 8, !opID !1089, !opSignedness !6
  call void @profOp(i64 620, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %0 = bitcast i32* %i to i8*, !opID !1090, !opSignedness !6
  call void @profOp(i64 621, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !1091, !opSignedness !6
  call void @profOp(i64 622, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %1 = bitcast i32* %wd2 to i8*, !opID !1092, !opSignedness !6
  call void @profOp(i64 623, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #8, !opID !1093, !opSignedness !6
  call void @profOp(i64 624, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %2 = bitcast i32* %wd3 to i8*, !opID !1094, !opSignedness !6
  call void @profOp(i64 625, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #8, !opID !1095, !opSignedness !6
  call void @profOp(i64 626, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %3 = load i32, i32* %dlt.addr, align 4, !opID !1096, !opSignedness !6
  call void @profOp(i64 627, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp = icmp eq i32 %3, 0, !opID !1097, !opSignedness !6
  call void @profOp(i64 628, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp, label %if.then, label %if.else, !opID !1098, !opSignedness !6

if.then:                                          ; preds = %entry
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %upzero_label10, !opID !1099, !opSignedness !6

upzero_label10:                                   ; preds = %if.then
  store i32 0, i32* %i, align 4, !opID !1100, !opSignedness !6
  call void @profOp(i64 631, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond, !opID !1101, !opSignedness !6

for.cond:                                         ; preds = %for.inc, %upzero_label10
  %4 = load i32, i32* %i, align 4, !opID !1102, !opSignedness !6
  call void @profOp(i64 633, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp1 = icmp slt i32 %4, 6, !opID !1103, !opSignedness !6
  call void @profOp(i64 634, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp1, label %for.body, label %for.end, !opID !1104, !opSignedness !6

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %bli.addr, align 8, !opID !1105, !opSignedness !6
  call void @profOp(i64 636, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %6 = load i32, i32* %i, align 4, !opID !1106, !opSignedness !6
  call void @profOp(i64 637, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom = sext i32 %6 to i64, !opID !1107, !opSignedness !6
  call void @profOp(i64 638, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !opID !1108, !opSignedness !6
  call void @profOp(i64 639, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %7 = load i32, i32* %arrayidx, align 4, !opID !1109, !opSignedness !6
  call void @profOp(i64 640, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv = sext i32 %7 to i64, !opID !1110, !opSignedness !6
  call void @profOp(i64 641, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul = mul i64 255, %conv, !opID !1111, !opSignedness !6
  call void @profOp(i64 642, i8 15, i64 %mul, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %shr = ashr i64 %mul, 8, !opID !1112, !opSignedness !6
  call void @profOp(i64 643, i8 25, i64 %shr, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv2 = trunc i64 %shr to i32, !opID !1113, !opSignedness !6
  call void @profOp(i64 644, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %8 = load i32*, i32** %bli.addr, align 8, !opID !1114, !opSignedness !6
  call void @profOp(i64 645, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %9 = load i32, i32* %i, align 4, !opID !1115, !opSignedness !6
  call void @profOp(i64 646, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom3 = sext i32 %9 to i64, !opID !1116, !opSignedness !6
  call void @profOp(i64 647, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %idxprom3, !opID !1117, !opSignedness !6
  call void @profOp(i64 648, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 %conv2, i32* %arrayidx4, align 4, !opID !1118, !opSignedness !6
  call void @profOp(i64 649, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.inc, !opID !1119, !opSignedness !6

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !opID !1120, !opSignedness !6
  call void @profOp(i64 651, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %inc = add i32 %10, 1, !opID !1121, !opSignedness !6
  %11 = sext i32 %inc to i64
  call void @profOp(i64 652, i8 11, i64 %11, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %inc, i32* %i, align 4, !opID !1122, !opSignedness !6
  call void @profOp(i64 653, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond, !llvm.loop !1123, !opID !1125, !opSignedness !6

for.end:                                          ; preds = %for.cond
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end27, !opID !1126, !opSignedness !6

if.else:                                          ; preds = %entry
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %upzero_label11, !opID !1127, !opSignedness !6

upzero_label11:                                   ; preds = %if.else
  store i32 0, i32* %i, align 4, !opID !1128, !opSignedness !6
  call void @profOp(i64 657, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond5, !opID !1129, !opSignedness !6

for.cond5:                                        ; preds = %for.inc24, %upzero_label11
  %12 = load i32, i32* %i, align 4, !opID !1130, !opSignedness !6
  call void @profOp(i64 659, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp6 = icmp slt i32 %12, 6, !opID !1131, !opSignedness !6
  call void @profOp(i64 660, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp6, label %for.body7, label %for.end26, !opID !1132, !opSignedness !6

for.body7:                                        ; preds = %for.cond5
  %13 = load i32, i32* %dlt.addr, align 4, !opID !1133, !opSignedness !6
  call void @profOp(i64 662, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv8 = sext i32 %13 to i64, !opID !1134, !opSignedness !6
  call void @profOp(i64 663, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %14 = load i32*, i32** %dlti.addr, align 8, !opID !1135, !opSignedness !6
  call void @profOp(i64 664, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %15 = load i32, i32* %i, align 4, !opID !1136, !opSignedness !6
  call void @profOp(i64 665, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom9 = sext i32 %15 to i64, !opID !1137, !opSignedness !6
  call void @profOp(i64 666, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx10 = getelementptr inbounds i32, i32* %14, i64 %idxprom9, !opID !1138, !opSignedness !6
  call void @profOp(i64 667, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %16 = load i32, i32* %arrayidx10, align 4, !opID !1139, !opSignedness !6
  call void @profOp(i64 668, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv11 = sext i32 %16 to i64, !opID !1140, !opSignedness !6
  call void @profOp(i64 669, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul12 = mul i64 %conv8, %conv11, !opID !1141, !opSignedness !6
  call void @profOp(i64 670, i8 15, i64 %mul12, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %cmp13 = icmp sge i64 %mul12, 0, !opID !1142, !opSignedness !6
  call void @profOp(i64 671, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp13, label %if.then14, label %if.else15, !opID !1143, !opSignedness !6

if.then14:                                        ; preds = %for.body7
  store i32 128, i32* %wd2, align 4, !opID !1144, !opSignedness !6
  call void @profOp(i64 673, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end, !opID !1145, !opSignedness !6

if.else15:                                        ; preds = %for.body7
  store i32 -128, i32* %wd2, align 4, !opID !1146, !opSignedness !6
  call void @profOp(i64 675, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end, !opID !1147, !opSignedness !6

if.end:                                           ; preds = %if.else15, %if.then14
  %17 = load i32*, i32** %bli.addr, align 8, !opID !1148, !opSignedness !6
  call void @profOp(i64 677, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %18 = load i32, i32* %i, align 4, !opID !1149, !opSignedness !6
  call void @profOp(i64 678, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom16 = sext i32 %18 to i64, !opID !1150, !opSignedness !6
  call void @profOp(i64 679, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx17 = getelementptr inbounds i32, i32* %17, i64 %idxprom16, !opID !1151, !opSignedness !6
  call void @profOp(i64 680, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %19 = load i32, i32* %arrayidx17, align 4, !opID !1152, !opSignedness !6
  call void @profOp(i64 681, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv18 = sext i32 %19 to i64, !opID !1153, !opSignedness !6
  call void @profOp(i64 682, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul19 = mul i64 255, %conv18, !opID !1154, !opSignedness !6
  call void @profOp(i64 683, i8 15, i64 %mul19, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %shr20 = ashr i64 %mul19, 8, !opID !1155, !opSignedness !6
  call void @profOp(i64 684, i8 25, i64 %shr20, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv21 = trunc i64 %shr20 to i32, !opID !1156, !opSignedness !6
  call void @profOp(i64 685, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %conv21, i32* %wd3, align 4, !opID !1157, !opSignedness !6
  call void @profOp(i64 686, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %20 = load i32, i32* %wd2, align 4, !opID !1158, !opSignedness !6
  call void @profOp(i64 687, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %21 = load i32, i32* %wd3, align 4, !opID !1159, !opSignedness !6
  call void @profOp(i64 688, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add = add i32 %20, %21, !opID !1160, !opSignedness !6
  %22 = sext i32 %add to i64
  call void @profOp(i64 689, i8 11, i64 %22, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %23 = load i32*, i32** %bli.addr, align 8, !opID !1161, !opSignedness !6
  call void @profOp(i64 690, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %24 = load i32, i32* %i, align 4, !opID !1162, !opSignedness !6
  call void @profOp(i64 691, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom22 = sext i32 %24 to i64, !opID !1163, !opSignedness !6
  call void @profOp(i64 692, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx23 = getelementptr inbounds i32, i32* %23, i64 %idxprom22, !opID !1164, !opSignedness !6
  call void @profOp(i64 693, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 %add, i32* %arrayidx23, align 4, !opID !1165, !opSignedness !6
  call void @profOp(i64 694, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.inc24, !opID !1166, !opSignedness !6

for.inc24:                                        ; preds = %if.end
  %25 = load i32, i32* %i, align 4, !opID !1167, !opSignedness !6
  call void @profOp(i64 696, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %inc25 = add i32 %25, 1, !opID !1168, !opSignedness !6
  %26 = sext i32 %inc25 to i64
  call void @profOp(i64 697, i8 11, i64 %26, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %inc25, i32* %i, align 4, !opID !1169, !opSignedness !6
  call void @profOp(i64 698, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond5, !llvm.loop !1170, !opID !1172, !opSignedness !6

for.end26:                                        ; preds = %for.cond5
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end27, !opID !1173, !opSignedness !6

if.end27:                                         ; preds = %for.end26, %for.end
  %27 = load i32*, i32** %dlti.addr, align 8, !opID !1174, !opSignedness !6
  call void @profOp(i64 701, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %arrayidx28 = getelementptr inbounds i32, i32* %27, i64 4, !opID !1175, !opSignedness !6
  call void @profOp(i64 702, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %28 = load i32, i32* %arrayidx28, align 4, !opID !1176, !opSignedness !6
  call void @profOp(i64 703, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %29 = load i32*, i32** %dlti.addr, align 8, !opID !1177, !opSignedness !6
  call void @profOp(i64 704, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %arrayidx29 = getelementptr inbounds i32, i32* %29, i64 5, !opID !1178, !opSignedness !6
  call void @profOp(i64 705, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 %28, i32* %arrayidx29, align 4, !opID !1179, !opSignedness !6
  call void @profOp(i64 706, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %30 = load i32*, i32** %dlti.addr, align 8, !opID !1180, !opSignedness !6
  call void @profOp(i64 707, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %arrayidx30 = getelementptr inbounds i32, i32* %30, i64 3, !opID !1181, !opSignedness !6
  call void @profOp(i64 708, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %31 = load i32, i32* %arrayidx30, align 4, !opID !1182, !opSignedness !6
  call void @profOp(i64 709, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %32 = load i32*, i32** %dlti.addr, align 8, !opID !1183, !opSignedness !6
  call void @profOp(i64 710, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %arrayidx31 = getelementptr inbounds i32, i32* %32, i64 4, !opID !1184, !opSignedness !6
  call void @profOp(i64 711, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 %31, i32* %arrayidx31, align 4, !opID !1185, !opSignedness !6
  call void @profOp(i64 712, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %33 = load i32*, i32** %dlti.addr, align 8, !opID !1186, !opSignedness !6
  call void @profOp(i64 713, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %arrayidx32 = getelementptr inbounds i32, i32* %33, i64 2, !opID !1187, !opSignedness !6
  call void @profOp(i64 714, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %34 = load i32, i32* %arrayidx32, align 4, !opID !1188, !opSignedness !6
  call void @profOp(i64 715, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %35 = load i32*, i32** %dlti.addr, align 8, !opID !1189, !opSignedness !6
  call void @profOp(i64 716, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %arrayidx33 = getelementptr inbounds i32, i32* %35, i64 3, !opID !1190, !opSignedness !6
  call void @profOp(i64 717, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 %34, i32* %arrayidx33, align 4, !opID !1191, !opSignedness !6
  call void @profOp(i64 718, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %36 = load i32*, i32** %dlti.addr, align 8, !opID !1192, !opSignedness !6
  call void @profOp(i64 719, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %arrayidx34 = getelementptr inbounds i32, i32* %36, i64 1, !opID !1193, !opSignedness !6
  call void @profOp(i64 720, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %37 = load i32, i32* %arrayidx34, align 4, !opID !1194, !opSignedness !6
  call void @profOp(i64 721, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %38 = load i32*, i32** %dlti.addr, align 8, !opID !1195, !opSignedness !6
  call void @profOp(i64 722, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %arrayidx35 = getelementptr inbounds i32, i32* %38, i64 2, !opID !1196, !opSignedness !6
  call void @profOp(i64 723, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 %37, i32* %arrayidx35, align 4, !opID !1197, !opSignedness !6
  call void @profOp(i64 724, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %39 = load i32*, i32** %dlti.addr, align 8, !opID !1198, !opSignedness !6
  call void @profOp(i64 725, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %arrayidx36 = getelementptr inbounds i32, i32* %39, i64 0, !opID !1199, !opSignedness !6
  call void @profOp(i64 726, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %40 = load i32, i32* %arrayidx36, align 4, !opID !1200, !opSignedness !6
  call void @profOp(i64 727, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %41 = load i32*, i32** %dlti.addr, align 8, !opID !1201, !opSignedness !6
  call void @profOp(i64 728, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %arrayidx37 = getelementptr inbounds i32, i32* %41, i64 1, !opID !1202, !opSignedness !6
  call void @profOp(i64 729, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 %40, i32* %arrayidx37, align 4, !opID !1203, !opSignedness !6
  call void @profOp(i64 730, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %42 = load i32, i32* %dlt.addr, align 4, !opID !1204, !opSignedness !6
  call void @profOp(i64 731, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %43 = load i32*, i32** %dlti.addr, align 8, !opID !1205, !opSignedness !6
  call void @profOp(i64 732, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %arrayidx38 = getelementptr inbounds i32, i32* %43, i64 0, !opID !1206, !opSignedness !6
  call void @profOp(i64 733, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  store i32 %42, i32* %arrayidx38, align 4, !opID !1207, !opSignedness !6
  call void @profOp(i64 734, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %44 = bitcast i32* %wd3 to i8*, !opID !1208, !opSignedness !6
  call void @profOp(i64 735, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %44) #8, !opID !1209, !opSignedness !6
  call void @profOp(i64 736, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %45 = bitcast i32* %wd2 to i8*, !opID !1210, !opSignedness !6
  call void @profOp(i64 737, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %45) #8, !opID !1211, !opSignedness !6
  call void @profOp(i64 738, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %46 = bitcast i32* %i to i8*, !opID !1212, !opSignedness !6
  call void @profOp(i64 739, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %46) #8, !opID !1213, !opSignedness !6
  call void @profOp(i64 740, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  ret void, !opID !1214, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @uppol2(i32 %al1, i32 %al2, i32 %plt, i32 %plt1, i32 %plt2) #3 {
entry:
  %al1.addr = alloca i32, align 4, !opID !1215, !opSignedness !6
  call void @profOp(i64 742, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %al2.addr = alloca i32, align 4, !opID !1216, !opSignedness !6
  call void @profOp(i64 743, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %plt.addr = alloca i32, align 4, !opID !1217, !opSignedness !6
  call void @profOp(i64 744, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 3, i1 false)
  %plt1.addr = alloca i32, align 4, !opID !1218, !opSignedness !6
  call void @profOp(i64 745, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %plt2.addr = alloca i32, align 4, !opID !1219, !opSignedness !6
  call void @profOp(i64 746, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %wd2 = alloca i64, align 8, !opID !1220, !opSignedness !6
  call void @profOp(i64 747, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 9, i1 false)
  %wd4 = alloca i64, align 8, !opID !1221, !opSignedness !6
  call void @profOp(i64 748, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 5, i1 false)
  %apl2 = alloca i32, align 4, !opID !1222, !opSignedness !6
  call void @profOp(i64 749, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 8, i1 false)
  store i32 %al1, i32* %al1.addr, align 4, !opID !1223, !opSignedness !6
  call void @profOp(i64 750, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %al2, i32* %al2.addr, align 4, !opID !1224, !opSignedness !6
  call void @profOp(i64 751, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %plt, i32* %plt.addr, align 4, !opID !1225, !opSignedness !6
  call void @profOp(i64 752, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %plt1, i32* %plt1.addr, align 4, !opID !1226, !opSignedness !6
  call void @profOp(i64 753, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %plt2, i32* %plt2.addr, align 4, !opID !1227, !opSignedness !6
  call void @profOp(i64 754, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %0 = bitcast i64* %wd2 to i8*, !opID !1228, !opSignedness !6
  call void @profOp(i64 755, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #8, !opID !1229, !opSignedness !6
  call void @profOp(i64 756, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %1 = bitcast i64* %wd4 to i8*, !opID !1230, !opSignedness !6
  call void @profOp(i64 757, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #8, !opID !1231, !opSignedness !6
  call void @profOp(i64 758, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %2 = bitcast i32* %apl2 to i8*, !opID !1232, !opSignedness !6
  call void @profOp(i64 759, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #8, !opID !1233, !opSignedness !6
  call void @profOp(i64 760, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %3 = load i32, i32* %al1.addr, align 4, !opID !1234, !opSignedness !6
  call void @profOp(i64 761, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv = sext i32 %3 to i64, !opID !1235, !opSignedness !6
  call void @profOp(i64 762, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul = mul i64 4, %conv, !opID !1236, !opSignedness !6
  call void @profOp(i64 763, i8 15, i64 %mul, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %mul, i64* %wd2, align 8, !opID !1237, !opSignedness !6
  call void @profOp(i64 764, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %4 = load i32, i32* %plt.addr, align 4, !opID !1238, !opSignedness !6
  call void @profOp(i64 765, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv1 = sext i32 %4 to i64, !opID !1239, !opSignedness !6
  call void @profOp(i64 766, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %5 = load i32, i32* %plt1.addr, align 4, !opID !1240, !opSignedness !6
  call void @profOp(i64 767, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv2 = sext i32 %5 to i64, !opID !1241, !opSignedness !6
  call void @profOp(i64 768, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul3 = mul i64 %conv1, %conv2, !opID !1242, !opSignedness !6
  call void @profOp(i64 769, i8 15, i64 %mul3, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %cmp = icmp sge i64 %mul3, 0, !opID !1243, !opSignedness !6
  call void @profOp(i64 770, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp, label %if.then, label %if.end, !opID !1244, !opSignedness !6

if.then:                                          ; preds = %entry
  %6 = load i64, i64* %wd2, align 8, !opID !1245, !opSignedness !6
  call void @profOp(i64 772, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %sub = sub i64 0, %6, !opID !1246, !opSignedness !6
  call void @profOp(i64 773, i8 13, i64 %sub, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %sub, i64* %wd2, align 8, !opID !1247, !opSignedness !6
  call void @profOp(i64 774, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end, !opID !1248, !opSignedness !6

if.end:                                           ; preds = %if.then, %entry
  %7 = load i64, i64* %wd2, align 8, !opID !1249, !opSignedness !6
  call void @profOp(i64 776, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %shr = ashr i64 %7, 7, !opID !1250, !opSignedness !6
  call void @profOp(i64 777, i8 25, i64 %shr, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %shr, i64* %wd2, align 8, !opID !1251, !opSignedness !6
  call void @profOp(i64 778, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %8 = load i32, i32* %plt.addr, align 4, !opID !1252, !opSignedness !6
  call void @profOp(i64 779, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv4 = sext i32 %8 to i64, !opID !1253, !opSignedness !6
  call void @profOp(i64 780, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %9 = load i32, i32* %plt2.addr, align 4, !opID !1254, !opSignedness !6
  call void @profOp(i64 781, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv5 = sext i32 %9 to i64, !opID !1255, !opSignedness !6
  call void @profOp(i64 782, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul6 = mul i64 %conv4, %conv5, !opID !1256, !opSignedness !6
  call void @profOp(i64 783, i8 15, i64 %mul6, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %cmp7 = icmp sge i64 %mul6, 0, !opID !1257, !opSignedness !6
  call void @profOp(i64 784, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp7, label %if.then8, label %if.else, !opID !1258, !opSignedness !6

if.then8:                                         ; preds = %if.end
  %10 = load i64, i64* %wd2, align 8, !opID !1259, !opSignedness !6
  call void @profOp(i64 786, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %add = add i64 %10, 128, !opID !1260, !opSignedness !6
  call void @profOp(i64 787, i8 11, i64 %add, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %add, i64* %wd4, align 8, !opID !1261, !opSignedness !6
  call void @profOp(i64 788, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end10, !opID !1262, !opSignedness !6

if.else:                                          ; preds = %if.end
  %11 = load i64, i64* %wd2, align 8, !opID !1263, !opSignedness !6
  call void @profOp(i64 790, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %sub9 = sub i64 %11, 128, !opID !1264, !opSignedness !6
  call void @profOp(i64 791, i8 13, i64 %sub9, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %sub9, i64* %wd4, align 8, !opID !1265, !opSignedness !6
  call void @profOp(i64 792, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end10, !opID !1266, !opSignedness !6

if.end10:                                         ; preds = %if.else, %if.then8
  %12 = load i64, i64* %wd4, align 8, !opID !1267, !opSignedness !6
  call void @profOp(i64 794, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %13 = load i32, i32* %al2.addr, align 4, !opID !1268, !opSignedness !6
  call void @profOp(i64 795, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv11 = sext i32 %13 to i64, !opID !1269, !opSignedness !6
  call void @profOp(i64 796, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul12 = mul i64 127, %conv11, !opID !1270, !opSignedness !6
  call void @profOp(i64 797, i8 15, i64 %mul12, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %shr13 = ashr i64 %mul12, 7, !opID !1271, !opSignedness !6
  call void @profOp(i64 798, i8 25, i64 %shr13, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %add14 = add i64 %12, %shr13, !opID !1272, !opSignedness !6
  call void @profOp(i64 799, i8 11, i64 %add14, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv15 = trunc i64 %add14 to i32, !opID !1273, !opSignedness !6
  call void @profOp(i64 800, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %conv15, i32* %apl2, align 4, !opID !1274, !opSignedness !6
  call void @profOp(i64 801, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %14 = load i32, i32* %apl2, align 4, !opID !1275, !opSignedness !6
  call void @profOp(i64 802, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp16 = icmp sgt i32 %14, 12288, !opID !1276, !opSignedness !6
  call void @profOp(i64 803, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp16, label %if.then17, label %if.end18, !opID !1277, !opSignedness !6

if.then17:                                        ; preds = %if.end10
  store i32 12288, i32* %apl2, align 4, !opID !1278, !opSignedness !6
  call void @profOp(i64 805, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end18, !opID !1279, !opSignedness !6

if.end18:                                         ; preds = %if.then17, %if.end10
  %15 = load i32, i32* %apl2, align 4, !opID !1280, !opSignedness !6
  call void @profOp(i64 807, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp19 = icmp slt i32 %15, -12288, !opID !1281, !opSignedness !6
  call void @profOp(i64 808, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp19, label %if.then20, label %if.end21, !opID !1282, !opSignedness !6

if.then20:                                        ; preds = %if.end18
  store i32 -12288, i32* %apl2, align 4, !opID !1283, !opSignedness !6
  call void @profOp(i64 810, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end21, !opID !1284, !opSignedness !6

if.end21:                                         ; preds = %if.then20, %if.end18
  %16 = load i32, i32* %apl2, align 4, !opID !1285, !opSignedness !6
  call void @profOp(i64 812, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %17 = bitcast i32* %apl2 to i8*, !opID !1286, !opSignedness !6
  call void @profOp(i64 813, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #8, !opID !1287, !opSignedness !6
  call void @profOp(i64 814, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %18 = bitcast i64* %wd4 to i8*, !opID !1288, !opSignedness !6
  call void @profOp(i64 815, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #8, !opID !1289, !opSignedness !6
  call void @profOp(i64 816, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %19 = bitcast i64* %wd2 to i8*, !opID !1290, !opSignedness !6
  call void @profOp(i64 817, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #8, !opID !1291, !opSignedness !6
  call void @profOp(i64 818, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  ret i32 %16, !opID !1292, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @uppol1(i32 %al1, i32 %apl2, i32 %plt, i32 %plt1) #3 {
entry:
  %al1.addr = alloca i32, align 4, !opID !1293, !opSignedness !6
  call void @profOp(i64 820, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %apl2.addr = alloca i32, align 4, !opID !1294, !opSignedness !6
  call void @profOp(i64 821, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %plt.addr = alloca i32, align 4, !opID !1295, !opSignedness !6
  call void @profOp(i64 822, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %plt1.addr = alloca i32, align 4, !opID !1296, !opSignedness !6
  call void @profOp(i64 823, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %wd2 = alloca i64, align 8, !opID !1297, !opSignedness !6
  call void @profOp(i64 824, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 5, i1 false)
  %wd3 = alloca i32, align 4, !opID !1298, !opSignedness !6
  call void @profOp(i64 825, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 7, i1 false)
  %apl1 = alloca i32, align 4, !opID !1299, !opSignedness !6
  call void @profOp(i64 826, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 9, i1 false)
  store i32 %al1, i32* %al1.addr, align 4, !opID !1300, !opSignedness !6
  call void @profOp(i64 827, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %apl2, i32* %apl2.addr, align 4, !opID !1301, !opSignedness !6
  call void @profOp(i64 828, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %plt, i32* %plt.addr, align 4, !opID !1302, !opSignedness !6
  call void @profOp(i64 829, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %plt1, i32* %plt1.addr, align 4, !opID !1303, !opSignedness !6
  call void @profOp(i64 830, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %0 = bitcast i64* %wd2 to i8*, !opID !1304, !opSignedness !6
  call void @profOp(i64 831, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #8, !opID !1305, !opSignedness !6
  call void @profOp(i64 832, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %1 = bitcast i32* %wd3 to i8*, !opID !1306, !opSignedness !6
  call void @profOp(i64 833, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #8, !opID !1307, !opSignedness !6
  call void @profOp(i64 834, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %2 = bitcast i32* %apl1 to i8*, !opID !1308, !opSignedness !6
  call void @profOp(i64 835, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #8, !opID !1309, !opSignedness !6
  call void @profOp(i64 836, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %3 = load i32, i32* %al1.addr, align 4, !opID !1310, !opSignedness !6
  call void @profOp(i64 837, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv = sext i32 %3 to i64, !opID !1311, !opSignedness !6
  call void @profOp(i64 838, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul = mul i64 %conv, 255, !opID !1312, !opSignedness !6
  call void @profOp(i64 839, i8 15, i64 %mul, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %shr = ashr i64 %mul, 8, !opID !1313, !opSignedness !6
  call void @profOp(i64 840, i8 25, i64 %shr, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %shr, i64* %wd2, align 8, !opID !1314, !opSignedness !6
  call void @profOp(i64 841, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %4 = load i32, i32* %plt.addr, align 4, !opID !1315, !opSignedness !6
  call void @profOp(i64 842, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv1 = sext i32 %4 to i64, !opID !1316, !opSignedness !6
  call void @profOp(i64 843, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %5 = load i32, i32* %plt1.addr, align 4, !opID !1317, !opSignedness !6
  call void @profOp(i64 844, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv2 = sext i32 %5 to i64, !opID !1318, !opSignedness !6
  call void @profOp(i64 845, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul3 = mul i64 %conv1, %conv2, !opID !1319, !opSignedness !6
  call void @profOp(i64 846, i8 15, i64 %mul3, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %cmp = icmp sge i64 %mul3, 0, !opID !1320, !opSignedness !6
  call void @profOp(i64 847, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp, label %if.then, label %if.else, !opID !1321, !opSignedness !6

if.then:                                          ; preds = %entry
  %6 = load i64, i64* %wd2, align 8, !opID !1322, !opSignedness !6
  call void @profOp(i64 849, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %conv4 = trunc i64 %6 to i32, !opID !1323, !opSignedness !6
  call void @profOp(i64 850, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add = add i32 %conv4, 192, !opID !1324, !opSignedness !6
  %7 = sext i32 %add to i64
  call void @profOp(i64 851, i8 11, i64 %7, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add, i32* %apl1, align 4, !opID !1325, !opSignedness !6
  call void @profOp(i64 852, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end, !opID !1326, !opSignedness !6

if.else:                                          ; preds = %entry
  %8 = load i64, i64* %wd2, align 8, !opID !1327, !opSignedness !6
  call void @profOp(i64 854, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %conv5 = trunc i64 %8 to i32, !opID !1328, !opSignedness !6
  call void @profOp(i64 855, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %sub = sub i32 %conv5, 192, !opID !1329, !opSignedness !6
  %9 = sext i32 %sub to i64
  call void @profOp(i64 856, i8 13, i64 %9, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %sub, i32* %apl1, align 4, !opID !1330, !opSignedness !6
  call void @profOp(i64 857, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end, !opID !1331, !opSignedness !6

if.end:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %apl2.addr, align 4, !opID !1332, !opSignedness !6
  call void @profOp(i64 859, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %sub6 = sub i32 15360, %10, !opID !1333, !opSignedness !6
  %11 = sext i32 %sub6 to i64
  call void @profOp(i64 860, i8 13, i64 %11, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %sub6, i32* %wd3, align 4, !opID !1334, !opSignedness !6
  call void @profOp(i64 861, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %12 = load i32, i32* %apl1, align 4, !opID !1335, !opSignedness !6
  call void @profOp(i64 862, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %13 = load i32, i32* %wd3, align 4, !opID !1336, !opSignedness !6
  call void @profOp(i64 863, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp7 = icmp sgt i32 %12, %13, !opID !1337, !opSignedness !6
  call void @profOp(i64 864, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp7, label %if.then8, label %if.end9, !opID !1338, !opSignedness !6

if.then8:                                         ; preds = %if.end
  %14 = load i32, i32* %wd3, align 4, !opID !1339, !opSignedness !6
  call void @profOp(i64 866, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %14, i32* %apl1, align 4, !opID !1340, !opSignedness !6
  call void @profOp(i64 867, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end9, !opID !1341, !opSignedness !6

if.end9:                                          ; preds = %if.then8, %if.end
  %15 = load i32, i32* %apl1, align 4, !opID !1342, !opSignedness !6
  call void @profOp(i64 869, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %16 = load i32, i32* %wd3, align 4, !opID !1343, !opSignedness !6
  call void @profOp(i64 870, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %sub10 = sub i32 0, %16, !opID !1344, !opSignedness !6
  %17 = sext i32 %sub10 to i64
  call void @profOp(i64 871, i8 13, i64 %17, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  %cmp11 = icmp slt i32 %15, %sub10, !opID !1345, !opSignedness !6
  call void @profOp(i64 872, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp11, label %if.then12, label %if.end14, !opID !1346, !opSignedness !6

if.then12:                                        ; preds = %if.end9
  %18 = load i32, i32* %wd3, align 4, !opID !1347, !opSignedness !6
  call void @profOp(i64 874, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %sub13 = sub i32 0, %18, !opID !1348, !opSignedness !6
  %19 = sext i32 %sub13 to i64
  call void @profOp(i64 875, i8 13, i64 %19, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %sub13, i32* %apl1, align 4, !opID !1349, !opSignedness !6
  call void @profOp(i64 876, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end14, !opID !1350, !opSignedness !6

if.end14:                                         ; preds = %if.then12, %if.end9
  %20 = load i32, i32* %apl1, align 4, !opID !1351, !opSignedness !6
  call void @profOp(i64 878, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %21 = bitcast i32* %apl1 to i8*, !opID !1352, !opSignedness !6
  call void @profOp(i64 879, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #8, !opID !1353, !opSignedness !6
  call void @profOp(i64 880, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %22 = bitcast i32* %wd3 to i8*, !opID !1354, !opSignedness !6
  call void @profOp(i64 881, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #8, !opID !1355, !opSignedness !6
  call void @profOp(i64 882, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %23 = bitcast i64* %wd2 to i8*, !opID !1356, !opSignedness !6
  call void @profOp(i64 883, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %23) #8, !opID !1357, !opSignedness !6
  call void @profOp(i64 884, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  ret i32 %20, !opID !1358, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @logsch(i32 %ih, i32 %nbh) #3 {
entry:
  %ih.addr = alloca i32, align 4, !opID !1359, !opSignedness !6
  call void @profOp(i64 886, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %nbh.addr = alloca i32, align 4, !opID !1360, !opSignedness !6
  call void @profOp(i64 887, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 8, i1 false)
  %wd = alloca i32, align 4, !opID !1361, !opSignedness !6
  call void @profOp(i64 888, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 4, i1 false)
  store i32 %ih, i32* %ih.addr, align 4, !opID !1362, !opSignedness !6
  call void @profOp(i64 889, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %nbh, i32* %nbh.addr, align 4, !opID !1363, !opSignedness !6
  call void @profOp(i64 890, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %0 = bitcast i32* %wd to i8*, !opID !1364, !opSignedness !6
  call void @profOp(i64 891, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !1365, !opSignedness !6
  call void @profOp(i64 892, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %1 = load i32, i32* %nbh.addr, align 4, !opID !1366, !opSignedness !6
  call void @profOp(i64 893, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv = sext i32 %1 to i64, !opID !1367, !opSignedness !6
  call void @profOp(i64 894, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul = mul i64 %conv, 127, !opID !1368, !opSignedness !6
  call void @profOp(i64 895, i8 15, i64 %mul, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %shr = ashr i64 %mul, 7, !opID !1369, !opSignedness !6
  call void @profOp(i64 896, i8 25, i64 %shr, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %conv1 = trunc i64 %shr to i32, !opID !1370, !opSignedness !6
  call void @profOp(i64 897, i8 36, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %conv1, i32* %wd, align 4, !opID !1371, !opSignedness !6
  call void @profOp(i64 898, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %2 = load i32, i32* %wd, align 4, !opID !1372, !opSignedness !6
  call void @profOp(i64 899, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %3 = load i32, i32* %ih.addr, align 4, !opID !1373, !opSignedness !6
  call void @profOp(i64 900, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom = sext i32 %3 to i64, !opID !1374, !opSignedness !6
  call void @profOp(i64 901, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @wh_code_table, i64 0, i64 %idxprom, !opID !1375, !opSignedness !6
  call void @profOp(i64 902, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %4 = load i32, i32* %arrayidx, align 4, !opID !1376, !opSignedness !6
  call void @profOp(i64 903, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %add = add i32 %2, %4, !opID !1377, !opSignedness !6
  %5 = sext i32 %add to i64
  call void @profOp(i64 904, i8 11, i64 %5, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %add, i32* %nbh.addr, align 4, !opID !1378, !opSignedness !6
  call void @profOp(i64 905, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %6 = load i32, i32* %nbh.addr, align 4, !opID !1379, !opSignedness !6
  call void @profOp(i64 906, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp = icmp slt i32 %6, 0, !opID !1380, !opSignedness !6
  call void @profOp(i64 907, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp, label %if.then, label %if.end, !opID !1381, !opSignedness !6

if.then:                                          ; preds = %entry
  store i32 0, i32* %nbh.addr, align 4, !opID !1382, !opSignedness !6
  call void @profOp(i64 909, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end, !opID !1383, !opSignedness !6

if.end:                                           ; preds = %if.then, %entry
  %7 = load i32, i32* %nbh.addr, align 4, !opID !1384, !opSignedness !6
  call void @profOp(i64 911, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp2 = icmp sgt i32 %7, 22528, !opID !1385, !opSignedness !6
  call void @profOp(i64 912, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp2, label %if.then3, label %if.end4, !opID !1386, !opSignedness !6

if.then3:                                         ; preds = %if.end
  store i32 22528, i32* %nbh.addr, align 4, !opID !1387, !opSignedness !6
  call void @profOp(i64 914, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end4, !opID !1388, !opSignedness !6

if.end4:                                          ; preds = %if.then3, %if.end
  %8 = load i32, i32* %nbh.addr, align 4, !opID !1389, !opSignedness !6
  call void @profOp(i64 916, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %9 = bitcast i32* %wd to i8*, !opID !1390, !opSignedness !6
  call void @profOp(i64 917, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #8, !opID !1391, !opSignedness !6
  call void @profOp(i64 918, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  ret i32 %8, !opID !1392, !opSignedness !6
}

; Function Attrs: nounwind
define i32 @quantl(i32 %el, i32 %detl) #3 {
entry:
  %el.addr = alloca i32, align 4, !opID !1393, !opSignedness !6
  call void @profOp(i64 467, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 3, i1 false)
  %detl.addr = alloca i32, align 4, !opID !1394, !opSignedness !6
  call void @profOp(i64 468, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 2, i1 false)
  %ril = alloca i32, align 4, !opID !1395, !opSignedness !6
  call void @profOp(i64 469, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 5, i1 false)
  %mil = alloca i32, align 4, !opID !1396, !opSignedness !6
  call void @profOp(i64 470, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 9, i1 false)
  %wd = alloca i64, align 8, !opID !1397, !opSignedness !6
  call void @profOp(i64 471, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 4, i1 false)
  %decis = alloca i64, align 8, !opID !1398, !opSignedness !6
  call void @profOp(i64 472, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 4, i1 false)
  store i32 %el, i32* %el.addr, align 4, !opID !1399, !opSignedness !6
  call void @profOp(i64 473, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  store i32 %detl, i32* %detl.addr, align 4, !opID !1400, !opSignedness !6
  call void @profOp(i64 474, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %0 = bitcast i32* %ril to i8*, !opID !1401, !opSignedness !6
  call void @profOp(i64 475, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !1402, !opSignedness !6
  call void @profOp(i64 476, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %1 = bitcast i32* %mil to i8*, !opID !1403, !opSignedness !6
  call void @profOp(i64 477, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #8, !opID !1404, !opSignedness !6
  call void @profOp(i64 478, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %2 = bitcast i64* %wd to i8*, !opID !1405, !opSignedness !6
  call void @profOp(i64 479, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #8, !opID !1406, !opSignedness !6
  call void @profOp(i64 480, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %3 = bitcast i64* %decis to i8*, !opID !1407, !opSignedness !6
  call void @profOp(i64 481, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #8, !opID !1408, !opSignedness !6
  call void @profOp(i64 482, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %4 = load i32, i32* %el.addr, align 4, !opID !1409, !opSignedness !6
  call void @profOp(i64 483, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %call = call i32 @abs(i32 %4) #9, !opID !1410, !opSignedness !6
  call void @profOp(i64 484, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv = sext i32 %call to i64, !opID !1411, !opSignedness !6
  call void @profOp(i64 485, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  store i64 %conv, i64* %wd, align 8, !opID !1412, !opSignedness !6
  call void @profOp(i64 486, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %quantl_label9, !opID !1413, !opSignedness !6

quantl_label9:                                    ; preds = %entry
  store i32 0, i32* %mil, align 4, !opID !1414, !opSignedness !6
  call void @profOp(i64 488, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond, !opID !1415, !opSignedness !6

for.cond:                                         ; preds = %for.inc, %quantl_label9
  %5 = load i32, i32* %mil, align 4, !opID !1416, !opSignedness !6
  call void @profOp(i64 490, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp = icmp slt i32 %5, 30, !opID !1417, !opSignedness !6
  call void @profOp(i64 491, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp, label %for.body, label %for.end, !opID !1418, !opSignedness !6

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %mil, align 4, !opID !1419, !opSignedness !6
  call void @profOp(i64 493, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom = sext i32 %6 to i64, !opID !1420, !opSignedness !6
  call void @profOp(i64 494, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx = getelementptr inbounds [30 x i32], [30 x i32]* @decis_levl, i64 0, i64 %idxprom, !opID !1421, !opSignedness !6
  call void @profOp(i64 495, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %7 = load i32, i32* %arrayidx, align 4, !opID !1422, !opSignedness !6
  call void @profOp(i64 496, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv1 = sext i32 %7 to i64, !opID !1423, !opSignedness !6
  call void @profOp(i64 497, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %8 = load i32, i32* %detl.addr, align 4, !opID !1424, !opSignedness !6
  call void @profOp(i64 498, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %conv2 = sext i32 %8 to i64, !opID !1425, !opSignedness !6
  call void @profOp(i64 499, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %mul = mul i64 %conv1, %conv2, !opID !1426, !opSignedness !6
  call void @profOp(i64 500, i8 15, i64 %mul, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  %shr = ashr i64 %mul, 15, !opID !1427, !opSignedness !6
  call void @profOp(i64 501, i8 25, i64 %shr, i64 0, double 0.000000e+00, i1 true, i1 false, i32 64, i32 1, i1 true)
  store i64 %shr, i64* %decis, align 8, !opID !1428, !opSignedness !6
  call void @profOp(i64 502, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %9 = load i64, i64* %wd, align 8, !opID !1429, !opSignedness !6
  call void @profOp(i64 503, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %10 = load i64, i64* %decis, align 8, !opID !1430, !opSignedness !6
  call void @profOp(i64 504, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %cmp3 = icmp sle i64 %9, %10, !opID !1431, !opSignedness !6
  call void @profOp(i64 505, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp3, label %if.then, label %if.end, !opID !1432, !opSignedness !6

if.then:                                          ; preds = %for.body
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.end, !opID !1433, !opSignedness !6

if.end:                                           ; preds = %for.body
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.inc, !opID !1434, !opSignedness !6

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %mil, align 4, !opID !1435, !opSignedness !6
  call void @profOp(i64 509, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %inc = add i32 %11, 1, !opID !1436, !opSignedness !6
  %12 = sext i32 %inc to i64
  call void @profOp(i64 510, i8 11, i64 %12, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %inc, i32* %mil, align 4, !opID !1437, !opSignedness !6
  call void @profOp(i64 511, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %for.cond, !llvm.loop !1438, !opID !1440, !opSignedness !6

for.end:                                          ; preds = %if.then, %for.cond
  %13 = load i32, i32* %el.addr, align 4, !opID !1441, !opSignedness !6
  call void @profOp(i64 513, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp4 = icmp sge i32 %13, 0, !opID !1442, !opSignedness !6
  call void @profOp(i64 514, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp4, label %if.then5, label %if.else, !opID !1443, !opSignedness !6

if.then5:                                         ; preds = %for.end
  %14 = load i32, i32* %mil, align 4, !opID !1444, !opSignedness !6
  call void @profOp(i64 516, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom6 = sext i32 %14 to i64, !opID !1445, !opSignedness !6
  call void @profOp(i64 517, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx7 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_pos, i64 0, i64 %idxprom6, !opID !1446, !opSignedness !6
  call void @profOp(i64 518, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %15 = load i32, i32* %arrayidx7, align 4, !opID !1447, !opSignedness !6
  call void @profOp(i64 519, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %15, i32* %ril, align 4, !opID !1448, !opSignedness !6
  call void @profOp(i64 520, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end10, !opID !1449, !opSignedness !6

if.else:                                          ; preds = %for.end
  %16 = load i32, i32* %mil, align 4, !opID !1450, !opSignedness !6
  call void @profOp(i64 522, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %idxprom8 = sext i32 %16 to i64, !opID !1451, !opSignedness !6
  call void @profOp(i64 523, i8 38, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 64, i32 1, i1 false)
  %arrayidx9 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_neg, i64 0, i64 %idxprom8, !opID !1452, !opSignedness !6
  call void @profOp(i64 524, i8 32, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  %17 = load i32, i32* %arrayidx9, align 4, !opID !1453, !opSignedness !6
  call void @profOp(i64 525, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %17, i32* %ril, align 4, !opID !1454, !opSignedness !6
  call void @profOp(i64 526, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end10, !opID !1455, !opSignedness !6

if.end10:                                         ; preds = %if.else, %if.then5
  %18 = load i32, i32* %ril, align 4, !opID !1456, !opSignedness !6
  call void @profOp(i64 528, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %19 = bitcast i64* %decis to i8*, !opID !1457, !opSignedness !6
  call void @profOp(i64 529, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #8, !opID !1458, !opSignedness !6
  call void @profOp(i64 530, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %20 = bitcast i64* %wd to i8*, !opID !1459, !opSignedness !6
  call void @profOp(i64 531, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %20) #8, !opID !1460, !opSignedness !6
  call void @profOp(i64 532, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %21 = bitcast i32* %mil to i8*, !opID !1461, !opSignedness !6
  call void @profOp(i64 533, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #8, !opID !1462, !opSignedness !6
  call void @profOp(i64 534, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %22 = bitcast i32* %ril to i8*, !opID !1463, !opSignedness !6
  call void @profOp(i64 535, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #8, !opID !1464, !opSignedness !6
  call void @profOp(i64 536, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  ret i32 %18, !opID !1465, !opSignedness !6
}

; Function Attrs: nounwind readnone willreturn
define i32 @abs(i32 %n) #4 {
entry:
  %n.addr = alloca i32, align 4, !opID !1466, !opSignedness !6
  call void @profOp(i64 17, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 4, i1 false)
  %m = alloca i32, align 4, !opID !1467, !opSignedness !6
  call void @profOp(i64 18, i8 29, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 5, i1 false)
  store i32 %n, i32* %n.addr, align 4, !opID !1468, !opSignedness !6
  call void @profOp(i64 19, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %0 = bitcast i32* %m to i8*, !opID !1469, !opSignedness !6
  call void @profOp(i64 20, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #8, !opID !1470, !opSignedness !6
  call void @profOp(i64 21, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  %1 = load i32, i32* %n.addr, align 4, !opID !1471, !opSignedness !6
  call void @profOp(i64 22, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %cmp = icmp sge i32 %1, 0, !opID !1472, !opSignedness !6
  call void @profOp(i64 23, i8 51, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 1, i32 1, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br i1 %cmp, label %if.then, label %if.else, !opID !1473, !opSignedness !6

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %n.addr, align 4, !opID !1474, !opSignedness !6
  call void @profOp(i64 25, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  store i32 %2, i32* %m, align 4, !opID !1475, !opSignedness !6
  call void @profOp(i64 26, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end, !opID !1476, !opSignedness !6

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %n.addr, align 4, !opID !1477, !opSignedness !6
  call void @profOp(i64 28, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %sub = sub i32 0, %3, !opID !1478, !opSignedness !6
  %4 = sext i32 %sub to i64
  call void @profOp(i64 29, i8 13, i64 %4, i64 0, double 0.000000e+00, i1 true, i1 false, i32 32, i32 1, i1 true)
  store i32 %sub, i32* %m, align 4, !opID !1479, !opSignedness !6
  call void @profOp(i64 30, i8 31, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  br label %if.end, !opID !1480, !opSignedness !6

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %m, align 4, !opID !1481, !opSignedness !6
  call void @profOp(i64 32, i8 30, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 32, i32 1, i1 false)
  %6 = bitcast i32* %m to i8*, !opID !1482, !opSignedness !6
  call void @profOp(i64 33, i8 47, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 1, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #8, !opID !1483, !opSignedness !6
  call void @profOp(i64 34, i8 54, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  call void @profOp(i64 0, i8 0, i64 0, i64 0, double 0.000000e+00, i1 false, i1 false, i32 0, i32 0, i1 false)
  ret i32 %5, !opID !1484, !opSignedness !6
}

; Function Attrs: noinline nounwind optnone uwtable
define void @profOp(i64 %instID, i8 zeroext %instOpcode, i64 %signedIntValue, i64 %unsignedIntValue, double %fpValue, i1 zeroext %isSignedValue, i1 zeroext %isFpValue, i32 %bitwidth, i32 %numUses, i1 zeroext %isBinaryOp) #0 {
entry:
  %instID.addr = alloca i64, align 8
  %instOpcode.addr = alloca i8, align 1
  %signedIntValue.addr = alloca i64, align 8
  %unsignedIntValue.addr = alloca i64, align 8
  %fpValue.addr = alloca double, align 8
  %isSignedValue.addr = alloca i8, align 1
  %isFpValue.addr = alloca i8, align 1
  %bitwidth.addr = alloca i32, align 4
  %numUses.addr = alloca i32, align 4
  %isBinaryOp.addr = alloca i8, align 1
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
  store i64 %instID, i64* %instID.addr, align 8
  store i8 %instOpcode, i8* %instOpcode.addr, align 1
  store i64 %signedIntValue, i64* %signedIntValue.addr, align 8
  store i64 %unsignedIntValue, i64* %unsignedIntValue.addr, align 8
  store double %fpValue, double* %fpValue.addr, align 8
  %frombool = zext i1 %isSignedValue to i8
  store i8 %frombool, i8* %isSignedValue.addr, align 1
  %frombool1 = zext i1 %isFpValue to i8
  store i8 %frombool1, i8* %isFpValue.addr, align 1
  store i32 %bitwidth, i32* %bitwidth.addr, align 4
  store i32 %numUses, i32* %numUses.addr, align 4
  %frombool2 = zext i1 %isBinaryOp to i8
  store i8 %frombool2, i8* %isBinaryOp.addr, align 1
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
  %opID = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %2, i32 0, i32 0
  %3 = load i32, i32* %opID, align 8
  %conv = zext i32 %3 to i64
  %4 = load i64, i64* %instID.addr, align 8
  %cmp3 = icmp ne i64 %conv, %4
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %5 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %next = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %5, i32 0, i32 11
  %6 = load %struct.BinOpInfo*, %struct.BinOpInfo** %next, align 8
  store %struct.BinOpInfo* %6, %struct.BinOpInfo** %currentOp, align 8
  br label %while.cond

if.end:                                           ; preds = %while.body
  %7 = load i8, i8* %isBinaryOp.addr, align 1
  %tobool = trunc i8 %7 to i1
  br i1 %tobool, label %if.then5, label %if.else55

if.then5:                                         ; preds = %if.end
  %8 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %numOccurs = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %8, i32 0, i32 6
  %9 = load double, double* %numOccurs, align 8
  store double %9, double* %oldNumOccurs, align 8
  %10 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %mean = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %10, i32 0, i32 7
  %11 = load double, double* %mean, align 8
  store double %11, double* %oldMean, align 8
  %12 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %variance = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %12, i32 0, i32 8
  %13 = load double, double* %variance, align 8
  store double %13, double* %oldVariance, align 8
  %14 = load double, double* %oldNumOccurs, align 8
  %add = fadd double %14, 1.000000e+00
  store double %add, double* %newNumOccurs, align 8
  %15 = load i8, i8* %isFpValue.addr, align 1
  %tobool6 = trunc i8 %15 to i1
  br i1 %tobool6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then5
  %16 = load double, double* %fpValue.addr, align 8
  %call = call double @pow(double %16, double 2.000000e+00) #8
  store double %call, double* %squaredValue, align 8
  %17 = load double, double* %oldMean, align 8
  %18 = load double, double* %fpValue.addr, align 8
  %19 = load double, double* %oldMean, align 8
  %sub = fsub double %18, %19
  %20 = load double, double* %newNumOccurs, align 8
  %div = fdiv double %sub, %20
  %add8 = fadd double %17, %div
  store double %add8, double* %newMean, align 8
  %21 = load double, double* %oldNumOccurs, align 8
  %22 = load double, double* %newNumOccurs, align 8
  %div9 = fdiv double %21, %22
  %23 = load double, double* %oldVariance, align 8
  %mul = fmul double %div9, %23
  %24 = load double, double* %fpValue.addr, align 8
  %25 = load double, double* %oldMean, align 8
  %sub10 = fsub double %24, %25
  %26 = load double, double* %newNumOccurs, align 8
  %div11 = fdiv double %sub10, %26
  %27 = load double, double* %fpValue.addr, align 8
  %28 = load double, double* %newMean, align 8
  %sub12 = fsub double %27, %28
  %mul13 = fmul double %div11, %sub12
  %add14 = fadd double %mul, %mul13
  store double %add14, double* %newVariance, align 8
  br label %if.end49

if.else:                                          ; preds = %if.then5
  %29 = load i8, i8* %isSignedValue.addr, align 1
  %tobool15 = trunc i8 %29 to i1
  br i1 %tobool15, label %if.then16, label %if.else32

if.then16:                                        ; preds = %if.else
  %30 = load i64, i64* %signedIntValue.addr, align 8
  %conv17 = sitofp i64 %30 to double
  %call18 = call double @pow(double %conv17, double 2.000000e+00) #8
  store double %call18, double* %squaredValue, align 8
  %31 = load double, double* %oldMean, align 8
  %32 = load i64, i64* %signedIntValue.addr, align 8
  %conv19 = sitofp i64 %32 to double
  %33 = load double, double* %oldMean, align 8
  %sub20 = fsub double %conv19, %33
  %34 = load double, double* %newNumOccurs, align 8
  %div21 = fdiv double %sub20, %34
  %add22 = fadd double %31, %div21
  store double %add22, double* %newMean, align 8
  %35 = load double, double* %oldVariance, align 8
  %36 = load double, double* %newNumOccurs, align 8
  %div23 = fdiv double %35, %36
  %37 = load double, double* %oldNumOccurs, align 8
  %mul24 = fmul double %div23, %37
  %38 = load double, double* %newMean, align 8
  %39 = load i64, i64* %signedIntValue.addr, align 8
  %conv25 = sitofp i64 %39 to double
  %sub26 = fsub double %38, %conv25
  %40 = load double, double* %newNumOccurs, align 8
  %div27 = fdiv double %sub26, %40
  %41 = load double, double* %newMean, align 8
  %42 = load i64, i64* %signedIntValue.addr, align 8
  %conv28 = sitofp i64 %42 to double
  %sub29 = fsub double %41, %conv28
  %mul30 = fmul double %div27, %sub29
  %add31 = fadd double %mul24, %mul30
  store double %add31, double* %newVariance, align 8
  br label %if.end48

if.else32:                                        ; preds = %if.else
  %43 = load i64, i64* %unsignedIntValue.addr, align 8
  %conv33 = uitofp i64 %43 to double
  %call34 = call double @pow(double %conv33, double 2.000000e+00) #8
  store double %call34, double* %squaredValue, align 8
  %44 = load double, double* %oldMean, align 8
  %45 = load i64, i64* %unsignedIntValue.addr, align 8
  %conv35 = uitofp i64 %45 to double
  %46 = load double, double* %oldMean, align 8
  %sub36 = fsub double %conv35, %46
  %47 = load double, double* %newNumOccurs, align 8
  %div37 = fdiv double %sub36, %47
  %add38 = fadd double %44, %div37
  store double %add38, double* %newMean, align 8
  %48 = load double, double* %oldVariance, align 8
  %49 = load double, double* %newNumOccurs, align 8
  %div39 = fdiv double %48, %49
  %50 = load double, double* %oldNumOccurs, align 8
  %mul40 = fmul double %div39, %50
  %51 = load double, double* %newMean, align 8
  %52 = load i64, i64* %unsignedIntValue.addr, align 8
  %conv41 = uitofp i64 %52 to double
  %sub42 = fsub double %51, %conv41
  %53 = load double, double* %newNumOccurs, align 8
  %div43 = fdiv double %sub42, %53
  %54 = load double, double* %newMean, align 8
  %55 = load i64, i64* %unsignedIntValue.addr, align 8
  %conv44 = uitofp i64 %55 to double
  %sub45 = fsub double %54, %conv44
  %mul46 = fmul double %div43, %sub45
  %add47 = fadd double %mul40, %mul46
  store double %add47, double* %newVariance, align 8
  br label %if.end48

if.end48:                                         ; preds = %if.else32, %if.then16
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.then7
  %56 = load double, double* %newNumOccurs, align 8
  %57 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %numOccurs50 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %57, i32 0, i32 6
  store double %56, double* %numOccurs50, align 8
  %58 = load double, double* %newMean, align 8
  %59 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %mean51 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %59, i32 0, i32 7
  store double %58, double* %mean51, align 8
  %60 = load double, double* %newVariance, align 8
  %61 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %variance52 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %61, i32 0, i32 8
  store double %60, double* %variance52, align 8
  %62 = load double, double* %newVariance, align 8
  %call53 = call double @sqrt(double %62) #8
  %63 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %standardDev = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %63, i32 0, i32 9
  store double %call53, double* %standardDev, align 8
  %64 = load double, double* %squaredValue, align 8
  %65 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %sumOfSquares = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %65, i32 0, i32 10
  %66 = load double, double* %sumOfSquares, align 8
  %add54 = fadd double %66, %64
  store double %add54, double* %sumOfSquares, align 8
  br label %if.end58

if.else55:                                        ; preds = %if.end
  %67 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %numOccurs56 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %67, i32 0, i32 6
  %68 = load double, double* %numOccurs56, align 8
  %add57 = fadd double %68, 1.000000e+00
  store double %add57, double* %numOccurs56, align 8
  br label %if.end58

if.end58:                                         ; preds = %if.else55, %if.end49
  store i8 0, i8* %isNewOp, align 1
  br label %while.end

while.end:                                        ; preds = %if.end58, %while.cond
  %69 = load i8, i8* %isNewOp, align 1
  %tobool59 = trunc i8 %69 to i1
  br i1 %tobool59, label %if.then60, label %if.end104

if.then60:                                        ; preds = %while.end
  %call61 = call noalias i8* @malloc(i64 72) #8
  %70 = bitcast i8* %call61 to %struct.BinOpInfo*
  store %struct.BinOpInfo* %70, %struct.BinOpInfo** %newOp, align 8
  %71 = load i64, i64* %instID.addr, align 8
  %conv62 = trunc i64 %71 to i32
  %72 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %opID63 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %72, i32 0, i32 0
  store i32 %conv62, i32* %opID63, align 8
  %73 = load i8, i8* %instOpcode.addr, align 1
  %conv64 = zext i8 %73 to i32
  %74 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %opCode = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %74, i32 0, i32 1
  store i32 %conv64, i32* %opCode, align 4
  %75 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %numOccurs65 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %75, i32 0, i32 6
  store double 1.000000e+00, double* %numOccurs65, align 8
  %76 = load i8, i8* %isBinaryOp.addr, align 1
  %tobool66 = trunc i8 %76 to i1
  br i1 %tobool66, label %if.then67, label %if.else89

if.then67:                                        ; preds = %if.then60
  %77 = load i8, i8* %isFpValue.addr, align 1
  %tobool68 = trunc i8 %77 to i1
  br i1 %tobool68, label %if.then69, label %if.else73

if.then69:                                        ; preds = %if.then67
  %78 = load double, double* %fpValue.addr, align 8
  %79 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %mean70 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %79, i32 0, i32 7
  store double %78, double* %mean70, align 8
  %80 = load double, double* %fpValue.addr, align 8
  %call71 = call double @pow(double %80, double 2.000000e+00) #8
  %81 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %sumOfSquares72 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %81, i32 0, i32 10
  store double %call71, double* %sumOfSquares72, align 8
  br label %if.end88

if.else73:                                        ; preds = %if.then67
  %82 = load i8, i8* %isSignedValue.addr, align 1
  %tobool74 = trunc i8 %82 to i1
  br i1 %tobool74, label %if.then75, label %if.else81

if.then75:                                        ; preds = %if.else73
  %83 = load i64, i64* %signedIntValue.addr, align 8
  %conv76 = sitofp i64 %83 to double
  %84 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %mean77 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %84, i32 0, i32 7
  store double %conv76, double* %mean77, align 8
  %85 = load i64, i64* %signedIntValue.addr, align 8
  %conv78 = sitofp i64 %85 to double
  %call79 = call double @pow(double %conv78, double 2.000000e+00) #8
  %86 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %sumOfSquares80 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %86, i32 0, i32 10
  store double %call79, double* %sumOfSquares80, align 8
  br label %if.end87

if.else81:                                        ; preds = %if.else73
  %87 = load i64, i64* %unsignedIntValue.addr, align 8
  %conv82 = uitofp i64 %87 to double
  %88 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %mean83 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %88, i32 0, i32 7
  store double %conv82, double* %mean83, align 8
  %89 = load i64, i64* %unsignedIntValue.addr, align 8
  %conv84 = uitofp i64 %89 to double
  %call85 = call double @pow(double %conv84, double 2.000000e+00) #8
  %90 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %sumOfSquares86 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %90, i32 0, i32 10
  store double %call85, double* %sumOfSquares86, align 8
  br label %if.end87

if.end87:                                         ; preds = %if.else81, %if.then75
  br label %if.end88

if.end88:                                         ; preds = %if.end87, %if.then69
  br label %if.end92

if.else89:                                        ; preds = %if.then60
  %91 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %mean90 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %91, i32 0, i32 7
  store double 0.000000e+00, double* %mean90, align 8
  %92 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %sumOfSquares91 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %92, i32 0, i32 10
  store double 0.000000e+00, double* %sumOfSquares91, align 8
  br label %if.end92

if.end92:                                         ; preds = %if.else89, %if.end88
  %93 = load i8, i8* %isSignedValue.addr, align 1
  %tobool93 = trunc i8 %93 to i1
  %94 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %isSignedValue94 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %94, i32 0, i32 2
  %frombool95 = zext i1 %tobool93 to i8
  store i8 %frombool95, i8* %isSignedValue94, align 8
  %95 = load i8, i8* %isFpValue.addr, align 1
  %tobool96 = trunc i8 %95 to i1
  %96 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %isFpValue97 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %96, i32 0, i32 3
  %frombool98 = zext i1 %tobool96 to i8
  store i8 %frombool98, i8* %isFpValue97, align 1
  %97 = load i32, i32* %bitwidth.addr, align 4
  %98 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %bitwidth99 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %98, i32 0, i32 4
  store i32 %97, i32* %bitwidth99, align 4
  %99 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %variance100 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %99, i32 0, i32 8
  store double 0.000000e+00, double* %variance100, align 8
  %100 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %standardDev101 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %100, i32 0, i32 9
  store double 0.000000e+00, double* %standardDev101, align 8
  %101 = load i32, i32* %numUses.addr, align 4
  %102 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %numUses102 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %102, i32 0, i32 5
  store i32 %101, i32* %numUses102, align 8
  %103 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %104 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %next103 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %104, i32 0, i32 11
  store %struct.BinOpInfo* %103, %struct.BinOpInfo** %next103, align 8
  %105 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  store %struct.BinOpInfo* %105, %struct.BinOpInfo** @ops, align 8
  br label %if.end104

if.end104:                                        ; preds = %if.end92, %while.end
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
  %isSignedValue = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %9, i32 0, i32 2
  %10 = load i8, i8* %isSignedValue, align 8
  %tobool = trunc i8 %10 to i1
  %conv = zext i1 %tobool to i32
  %11 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %isFpValue = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %11, i32 0, i32 3
  %12 = load i8, i8* %isFpValue, align 1
  %tobool3 = trunc i8 %12 to i1
  %conv4 = zext i1 %tobool3 to i32
  %13 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %bitwidth = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %13, i32 0, i32 4
  %14 = load i32, i32* %bitwidth, align 4
  %15 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %numOccurs = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %15, i32 0, i32 6
  %16 = load double, double* %numOccurs, align 8
  %conv5 = fptoui double %16 to i32
  %17 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %numUses = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %17, i32 0, i32 5
  %18 = load i32, i32* %numUses, align 8
  %19 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %mean = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %19, i32 0, i32 7
  %20 = load double, double* %mean, align 8
  %21 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %variance = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %21, i32 0, i32 8
  %22 = load double, double* %variance, align 8
  %23 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %standardDev = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %23, i32 0, i32 9
  %24 = load double, double* %standardDev, align 8
  %25 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %sumOfSquares = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %25, i32 0, i32 10
  %26 = load double, double* %sumOfSquares, align 8
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.2, i32 0, i32 0), i32 %6, i32 %8, i32 %conv, i32 %conv4, i32 %14, i32 %conv5, i32 %18, double %20, double %22, double %24, double %26)
  %27 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %next = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %27, i32 0, i32 11
  %28 = load %struct.BinOpInfo*, %struct.BinOpInfo** %next, align 8
  store %struct.BinOpInfo* %28, %struct.BinOpInfo** %nextOp, align 8
  %29 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %30 = bitcast %struct.BinOpInfo* %29 to i8*
  call void @free(i8* %30) #8
  %31 = load %struct.BinOpInfo*, %struct.BinOpInfo** %nextOp, align 8
  store %struct.BinOpInfo* %31, %struct.BinOpInfo** @ops, align 8
  %32 = load i32, i32* %count, align 4
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %count, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** %outputFile, align 8
  %call7 = call i32 @fclose(%struct._IO_FILE* %33)
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
!opIDCounter = !{!1}
!llvm.module.flags = !{!2, !3, !4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i64 1450}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
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
!22 = !{!23}
!23 = !{!"fpga.top", !"user"}
!24 = !{i64 1372}
!25 = !{i64 1373}
!26 = !{i64 1374}
!27 = !{i64 1375}
!28 = !{i64 1376}
!29 = !{i64 1377}
!30 = !{i64 1378}
!31 = !{i64 1379}
!32 = !{i64 1380}
!33 = !{i64 1381}
!34 = !{i64 1382}
!35 = !{i64 1383}
!36 = !{i64 1384}
!37 = !{i64 1385}
!38 = !{i64 1386}
!39 = !{i64 1387}
!40 = !{i64 1388}
!41 = !{i64 1389}
!42 = !{i64 1390}
!43 = !{i64 1391}
!44 = !{i64 1392}
!45 = !{i64 1393}
!46 = !{i64 1394}
!47 = !{i64 1395}
!48 = !{i64 1396}
!49 = !{i64 1397}
!50 = !{i64 1398}
!51 = !{i64 1399}
!52 = !{i64 1400}
!53 = !{i64 1401}
!54 = !{i64 1402}
!55 = !{i64 1403}
!56 = !{i64 1404}
!57 = !{i64 1405}
!58 = !{i64 1406}
!59 = !{i64 1407}
!60 = !{i64 1408}
!61 = !{i64 1409}
!62 = !{i64 1410}
!63 = !{i64 1411}
!64 = !{i64 1412}
!65 = !{i64 1413}
!66 = distinct !{!66, !67}
!67 = !{!"llvm.loop.name", !"adpcm_main_label12"}
!68 = !{i64 1414}
!69 = !{i64 1415}
!70 = !{i64 1416}
!71 = !{i64 1417}
!72 = !{i64 1418}
!73 = !{i64 1419}
!74 = !{i64 1420}
!75 = !{i64 1421}
!76 = !{i64 1422}
!77 = !{i64 1423}
!78 = !{i64 1424}
!79 = !{i64 1425}
!80 = !{i64 1426}
!81 = !{i64 1427}
!82 = !{i64 1428}
!83 = !{i64 1429}
!84 = !{i64 1430}
!85 = !{i64 1431}
!86 = !{i64 1432}
!87 = !{i64 1433}
!88 = !{i64 1434}
!89 = !{i64 1435}
!90 = !{i64 1436}
!91 = !{i64 1437}
!92 = !{i64 1438}
!93 = !{i64 1439}
!94 = !{i64 1440}
!95 = !{i64 1441}
!96 = !{i64 1442}
!97 = !{i64 1443}
!98 = !{i64 1444}
!99 = distinct !{!99, !100}
!100 = !{!"llvm.loop.name", !"adpcm_main_label13"}
!101 = !{i64 1445}
!102 = !{i64 1446}
!103 = !{i64 1447}
!104 = !{i64 1448}
!105 = !{i64 1449}
!106 = !{i64 1246}
!107 = !{i64 1247}
!108 = !{i64 1248}
!109 = !{i64 1249}
!110 = !{i64 1250}
!111 = !{i64 1251}
!112 = !{i64 1252}
!113 = !{i64 1253}
!114 = !{i64 1254}
!115 = !{i64 1255}
!116 = !{i64 1256}
!117 = !{i64 1257}
!118 = !{i64 1258}
!119 = !{i64 1259}
!120 = !{i64 1260}
!121 = !{i64 1261}
!122 = !{i64 1262}
!123 = !{i64 1263}
!124 = !{i64 1264}
!125 = !{i64 1265}
!126 = !{i64 1266}
!127 = !{i64 1267}
!128 = !{i64 1268}
!129 = !{i64 1269}
!130 = !{i64 1270}
!131 = !{i64 1271}
!132 = !{i64 1272}
!133 = !{i64 1273}
!134 = !{i64 1274}
!135 = !{i64 1275}
!136 = !{i64 1276}
!137 = !{i64 1277}
!138 = !{i64 1278}
!139 = !{i64 1279}
!140 = !{i64 1280}
!141 = !{i64 1281}
!142 = !{i64 1282}
!143 = !{i64 1283}
!144 = !{i64 1284}
!145 = !{i64 1285}
!146 = !{i64 1286}
!147 = !{i64 1287}
!148 = !{i64 1288}
!149 = !{i64 1289}
!150 = !{i64 1290}
!151 = !{i64 1291}
!152 = !{i64 1292}
!153 = !{i64 1293}
!154 = !{i64 1294}
!155 = !{i64 1295}
!156 = !{i64 1296}
!157 = !{i64 1297}
!158 = !{i64 1298}
!159 = !{i64 1299}
!160 = !{i64 1300}
!161 = !{i64 1301}
!162 = !{i64 1302}
!163 = !{i64 1303}
!164 = !{i64 1304}
!165 = !{i64 1305}
!166 = !{i64 1306}
!167 = distinct !{!167, !168}
!168 = !{!"llvm.loop.name", !"reset_label4"}
!169 = !{i64 1307}
!170 = !{i64 1308}
!171 = !{i64 1309}
!172 = !{i64 1310}
!173 = !{i64 1311}
!174 = !{i64 1312}
!175 = !{i64 1313}
!176 = !{i64 1314}
!177 = !{i64 1315}
!178 = !{i64 1316}
!179 = !{i64 1317}
!180 = !{i64 1318}
!181 = !{i64 1319}
!182 = !{i64 1320}
!183 = !{i64 1321}
!184 = !{i64 1322}
!185 = !{i64 1323}
!186 = !{i64 1324}
!187 = !{i64 1325}
!188 = !{i64 1326}
!189 = !{i64 1327}
!190 = !{i64 1328}
!191 = !{i64 1329}
!192 = !{i64 1330}
!193 = !{i64 1331}
!194 = !{i64 1332}
!195 = !{i64 1333}
!196 = distinct !{!196, !197}
!197 = !{!"llvm.loop.name", !"reset_label5"}
!198 = !{i64 1334}
!199 = !{i64 1335}
!200 = !{i64 1336}
!201 = !{i64 1337}
!202 = !{i64 1338}
!203 = !{i64 1339}
!204 = !{i64 1340}
!205 = !{i64 1341}
!206 = !{i64 1342}
!207 = !{i64 1343}
!208 = !{i64 1344}
!209 = !{i64 1345}
!210 = !{i64 1346}
!211 = !{i64 1347}
!212 = !{i64 1348}
!213 = distinct !{!213, !214}
!214 = !{!"llvm.loop.name", !"reset_label6"}
!215 = !{i64 1349}
!216 = !{i64 1350}
!217 = !{i64 1351}
!218 = !{i64 1352}
!219 = !{i64 1353}
!220 = !{i64 1354}
!221 = !{i64 1355}
!222 = !{i64 1356}
!223 = !{i64 1357}
!224 = !{i64 1358}
!225 = !{i64 1359}
!226 = !{i64 1360}
!227 = !{i64 1361}
!228 = !{i64 1362}
!229 = !{i64 1363}
!230 = !{i64 1364}
!231 = !{i64 1365}
!232 = !{i64 1366}
!233 = !{i64 1367}
!234 = distinct !{!234, !235}
!235 = !{!"llvm.loop.name", !"reset_label7"}
!236 = !{i64 1368}
!237 = !{i64 1369}
!238 = !{i64 1370}
!239 = !{i64 1371}
!240 = !{i64 36}
!241 = !{i64 37}
!242 = !{i64 38}
!243 = !{i64 39}
!244 = !{i64 40}
!245 = !{i64 41}
!246 = !{i64 42}
!247 = !{i64 43}
!248 = !{i64 44}
!249 = !{i64 45}
!250 = !{i64 46}
!251 = !{i64 47}
!252 = !{i64 48}
!253 = !{i64 49}
!254 = !{i64 50}
!255 = !{i64 51}
!256 = !{i64 52}
!257 = !{i64 53}
!258 = !{i64 54}
!259 = !{i64 55}
!260 = !{i64 56}
!261 = !{i64 57}
!262 = !{i64 58}
!263 = !{i64 59}
!264 = !{i64 60}
!265 = !{i64 61}
!266 = !{i64 62}
!267 = !{i64 63}
!268 = !{i64 64}
!269 = !{i64 65}
!270 = !{i64 66}
!271 = !{i64 67}
!272 = !{i64 68}
!273 = !{i64 69}
!274 = !{i64 70}
!275 = !{i64 71}
!276 = !{i64 72}
!277 = !{i64 73}
!278 = !{i64 74}
!279 = !{i64 75}
!280 = !{i64 76}
!281 = !{i64 77}
!282 = !{i64 78}
!283 = !{i64 79}
!284 = !{i64 80}
!285 = !{i64 81}
!286 = !{i64 82}
!287 = !{i64 83}
!288 = !{i64 84}
!289 = !{i64 85}
!290 = !{i64 86}
!291 = !{i64 87}
!292 = !{i64 88}
!293 = !{i64 89}
!294 = !{i64 90}
!295 = !{i64 91}
!296 = !{i64 92}
!297 = !{i64 93}
!298 = !{i64 94}
!299 = !{i64 95}
!300 = !{i64 96}
!301 = !{i64 97}
!302 = !{i64 98}
!303 = !{i64 99}
!304 = !{i64 100}
!305 = !{i64 101}
!306 = !{i64 102}
!307 = !{i64 103}
!308 = !{i64 104}
!309 = !{i64 105}
!310 = !{i64 106}
!311 = !{i64 107}
!312 = !{i64 108}
!313 = !{i64 109}
!314 = !{i64 110}
!315 = !{i64 111}
!316 = !{i64 112}
!317 = !{i64 113}
!318 = !{i64 114}
!319 = !{i64 115}
!320 = !{i64 116}
!321 = !{i64 117}
!322 = !{i64 118}
!323 = !{i64 119}
!324 = !{i64 120}
!325 = !{i64 121}
!326 = !{i64 122}
!327 = !{i64 123}
!328 = !{i64 124}
!329 = distinct !{!329, !330}
!330 = !{!"llvm.loop.name", !"encode_label0"}
!331 = !{i64 125}
!332 = !{i64 126}
!333 = !{i64 127}
!334 = !{i64 128}
!335 = !{i64 129}
!336 = !{i64 130}
!337 = !{i64 131}
!338 = !{i64 132}
!339 = !{i64 133}
!340 = !{i64 134}
!341 = !{i64 135}
!342 = !{i64 136}
!343 = !{i64 137}
!344 = !{i64 138}
!345 = !{i64 139}
!346 = !{i64 140}
!347 = !{i64 141}
!348 = !{i64 142}
!349 = !{i64 143}
!350 = !{i64 144}
!351 = !{i64 145}
!352 = !{i64 146}
!353 = !{i64 147}
!354 = !{i64 148}
!355 = !{i64 149}
!356 = !{i64 150}
!357 = !{i64 151}
!358 = !{i64 152}
!359 = !{i64 153}
!360 = !{i64 154}
!361 = !{i64 155}
!362 = !{i64 156}
!363 = !{i64 157}
!364 = !{i64 158}
!365 = !{i64 159}
!366 = !{i64 160}
!367 = !{i64 161}
!368 = !{i64 162}
!369 = !{i64 163}
!370 = !{i64 164}
!371 = !{i64 165}
!372 = !{i64 166}
!373 = !{i64 167}
!374 = !{i64 168}
!375 = !{i64 169}
!376 = !{i64 170}
!377 = !{i64 171}
!378 = !{i64 172}
!379 = distinct !{!379, !380}
!380 = !{!"llvm.loop.name", !"encode_label1"}
!381 = !{i64 173}
!382 = !{i64 174}
!383 = !{i64 175}
!384 = !{i64 176}
!385 = !{i64 177}
!386 = !{i64 178}
!387 = !{i64 179}
!388 = !{i64 180}
!389 = !{i64 181}
!390 = !{i64 182}
!391 = !{i64 183}
!392 = !{i64 184}
!393 = !{i64 185}
!394 = !{i64 186}
!395 = !{i64 187}
!396 = !{i64 188}
!397 = !{i64 189}
!398 = !{i64 190}
!399 = !{i64 191}
!400 = !{i64 192}
!401 = !{i64 193}
!402 = !{i64 194}
!403 = !{i64 195}
!404 = !{i64 196}
!405 = !{i64 197}
!406 = !{i64 198}
!407 = !{i64 199}
!408 = !{i64 200}
!409 = !{i64 201}
!410 = !{i64 202}
!411 = !{i64 203}
!412 = !{i64 204}
!413 = !{i64 205}
!414 = !{i64 206}
!415 = !{i64 207}
!416 = !{i64 208}
!417 = !{i64 209}
!418 = !{i64 210}
!419 = !{i64 211}
!420 = !{i64 212}
!421 = !{i64 213}
!422 = !{i64 214}
!423 = !{i64 215}
!424 = !{i64 216}
!425 = !{i64 217}
!426 = !{i64 218}
!427 = !{i64 219}
!428 = !{i64 220}
!429 = !{i64 221}
!430 = !{i64 222}
!431 = !{i64 223}
!432 = !{i64 224}
!433 = !{i64 225}
!434 = !{i64 226}
!435 = !{i64 227}
!436 = !{i64 228}
!437 = !{i64 229}
!438 = !{i64 230}
!439 = !{i64 231}
!440 = !{i64 232}
!441 = !{i64 233}
!442 = !{i64 234}
!443 = !{i64 235}
!444 = !{i64 236}
!445 = !{i64 237}
!446 = !{i64 238}
!447 = !{i64 239}
!448 = !{i64 240}
!449 = !{i64 241}
!450 = !{i64 242}
!451 = !{i64 243}
!452 = !{i64 244}
!453 = !{i64 245}
!454 = !{i64 246}
!455 = !{i64 247}
!456 = !{i64 248}
!457 = !{i64 249}
!458 = !{i64 250}
!459 = !{i64 251}
!460 = !{i64 252}
!461 = !{i64 253}
!462 = !{i64 254}
!463 = !{i64 255}
!464 = !{i64 256}
!465 = !{i64 257}
!466 = !{i64 258}
!467 = !{i64 259}
!468 = !{i64 260}
!469 = !{i64 261}
!470 = !{i64 262}
!471 = !{i64 263}
!472 = !{i64 264}
!473 = !{i64 265}
!474 = !{i64 266}
!475 = !{i64 267}
!476 = !{i64 268}
!477 = !{i64 269}
!478 = !{i64 270}
!479 = !{i64 271}
!480 = !{i64 272}
!481 = !{i64 273}
!482 = !{i64 274}
!483 = !{i64 275}
!484 = !{i64 276}
!485 = !{i64 277}
!486 = !{i64 278}
!487 = !{i64 279}
!488 = !{i64 280}
!489 = !{i64 281}
!490 = !{i64 282}
!491 = !{i64 283}
!492 = !{i64 284}
!493 = !{i64 285}
!494 = !{i64 286}
!495 = !{i64 287}
!496 = !{i64 288}
!497 = !{i64 289}
!498 = !{i64 290}
!499 = !{i64 291}
!500 = !{i64 292}
!501 = !{i64 293}
!502 = !{i64 294}
!503 = !{i64 295}
!504 = !{i64 296}
!505 = !{i64 297}
!506 = !{i64 298}
!507 = !{i64 299}
!508 = !{i64 300}
!509 = !{i64 301}
!510 = !{i64 302}
!511 = !{i64 303}
!512 = !{i64 304}
!513 = !{i64 305}
!514 = !{i64 306}
!515 = !{i64 307}
!516 = !{i64 308}
!517 = !{i64 309}
!518 = !{i64 310}
!519 = !{i64 311}
!520 = !{i64 312}
!521 = !{i64 313}
!522 = !{i64 314}
!523 = !{i64 315}
!524 = !{i64 316}
!525 = !{i64 317}
!526 = !{i64 318}
!527 = !{i64 319}
!528 = !{i64 320}
!529 = !{i64 321}
!530 = !{i64 322}
!531 = !{i64 323}
!532 = !{i64 324}
!533 = !{i64 325}
!534 = !{i64 326}
!535 = !{i64 327}
!536 = !{i64 328}
!537 = !{i64 329}
!538 = !{i64 330}
!539 = !{i64 331}
!540 = !{i64 332}
!541 = !{i64 333}
!542 = !{i64 334}
!543 = !{i64 335}
!544 = !{i64 336}
!545 = !{i64 337}
!546 = !{i64 338}
!547 = !{i64 339}
!548 = !{i64 340}
!549 = !{i64 341}
!550 = !{i64 342}
!551 = !{i64 343}
!552 = !{i64 344}
!553 = !{i64 345}
!554 = !{i64 346}
!555 = !{i64 347}
!556 = !{i64 348}
!557 = !{i64 349}
!558 = !{i64 350}
!559 = !{i64 351}
!560 = !{i64 352}
!561 = !{i64 353}
!562 = !{i64 354}
!563 = !{i64 355}
!564 = !{i64 356}
!565 = !{i64 357}
!566 = !{i64 358}
!567 = !{i64 359}
!568 = !{i64 360}
!569 = !{i64 361}
!570 = !{i64 362}
!571 = !{i64 363}
!572 = !{i64 364}
!573 = !{i64 365}
!574 = !{i64 366}
!575 = !{i64 367}
!576 = !{i64 368}
!577 = !{i64 369}
!578 = !{i64 920}
!579 = !{i64 921}
!580 = !{i64 922}
!581 = !{i64 923}
!582 = !{i64 924}
!583 = !{i64 925}
!584 = !{i64 926}
!585 = !{i64 927}
!586 = !{i64 928}
!587 = !{i64 929}
!588 = !{i64 930}
!589 = !{i64 931}
!590 = !{i64 932}
!591 = !{i64 933}
!592 = !{i64 934}
!593 = !{i64 935}
!594 = !{i64 936}
!595 = !{i64 937}
!596 = !{i64 938}
!597 = !{i64 939}
!598 = !{i64 940}
!599 = !{i64 941}
!600 = !{i64 942}
!601 = !{i64 943}
!602 = !{i64 944}
!603 = !{i64 945}
!604 = !{i64 946}
!605 = !{i64 947}
!606 = !{i64 948}
!607 = !{i64 949}
!608 = !{i64 950}
!609 = !{i64 951}
!610 = !{i64 952}
!611 = !{i64 953}
!612 = !{i64 954}
!613 = !{i64 955}
!614 = !{i64 956}
!615 = !{i64 957}
!616 = !{i64 958}
!617 = !{i64 959}
!618 = !{i64 960}
!619 = !{i64 961}
!620 = !{i64 962}
!621 = !{i64 963}
!622 = !{i64 964}
!623 = !{i64 965}
!624 = !{i64 966}
!625 = !{i64 967}
!626 = !{i64 968}
!627 = !{i64 969}
!628 = !{i64 970}
!629 = !{i64 971}
!630 = !{i64 972}
!631 = !{i64 973}
!632 = !{i64 974}
!633 = !{i64 975}
!634 = !{i64 976}
!635 = !{i64 977}
!636 = !{i64 978}
!637 = !{i64 979}
!638 = !{i64 980}
!639 = !{i64 981}
!640 = !{i64 982}
!641 = !{i64 983}
!642 = !{i64 984}
!643 = !{i64 985}
!644 = !{i64 986}
!645 = !{i64 987}
!646 = !{i64 988}
!647 = !{i64 989}
!648 = !{i64 990}
!649 = !{i64 991}
!650 = !{i64 992}
!651 = !{i64 993}
!652 = !{i64 994}
!653 = !{i64 995}
!654 = !{i64 996}
!655 = !{i64 997}
!656 = !{i64 998}
!657 = !{i64 999}
!658 = !{i64 1000}
!659 = !{i64 1001}
!660 = !{i64 1002}
!661 = !{i64 1003}
!662 = !{i64 1004}
!663 = !{i64 1005}
!664 = !{i64 1006}
!665 = !{i64 1007}
!666 = !{i64 1008}
!667 = !{i64 1009}
!668 = !{i64 1010}
!669 = !{i64 1011}
!670 = !{i64 1012}
!671 = !{i64 1013}
!672 = !{i64 1014}
!673 = !{i64 1015}
!674 = !{i64 1016}
!675 = !{i64 1017}
!676 = !{i64 1018}
!677 = !{i64 1019}
!678 = !{i64 1020}
!679 = !{i64 1021}
!680 = !{i64 1022}
!681 = !{i64 1023}
!682 = !{i64 1024}
!683 = !{i64 1025}
!684 = !{i64 1026}
!685 = !{i64 1027}
!686 = !{i64 1028}
!687 = !{i64 1029}
!688 = !{i64 1030}
!689 = !{i64 1031}
!690 = !{i64 1032}
!691 = !{i64 1033}
!692 = !{i64 1034}
!693 = !{i64 1035}
!694 = !{i64 1036}
!695 = !{i64 1037}
!696 = !{i64 1038}
!697 = !{i64 1039}
!698 = !{i64 1040}
!699 = !{i64 1041}
!700 = !{i64 1042}
!701 = !{i64 1043}
!702 = !{i64 1044}
!703 = !{i64 1045}
!704 = !{i64 1046}
!705 = !{i64 1047}
!706 = !{i64 1048}
!707 = !{i64 1049}
!708 = !{i64 1050}
!709 = !{i64 1051}
!710 = !{i64 1052}
!711 = !{i64 1053}
!712 = !{i64 1054}
!713 = !{i64 1055}
!714 = !{i64 1056}
!715 = !{i64 1057}
!716 = !{i64 1058}
!717 = !{i64 1059}
!718 = !{i64 1060}
!719 = !{i64 1061}
!720 = !{i64 1062}
!721 = !{i64 1063}
!722 = !{i64 1064}
!723 = !{i64 1065}
!724 = !{i64 1066}
!725 = !{i64 1067}
!726 = !{i64 1068}
!727 = !{i64 1069}
!728 = !{i64 1070}
!729 = !{i64 1071}
!730 = !{i64 1072}
!731 = !{i64 1073}
!732 = !{i64 1074}
!733 = !{i64 1075}
!734 = !{i64 1076}
!735 = !{i64 1077}
!736 = !{i64 1078}
!737 = !{i64 1079}
!738 = !{i64 1080}
!739 = !{i64 1081}
!740 = !{i64 1082}
!741 = !{i64 1083}
!742 = !{i64 1084}
!743 = !{i64 1085}
!744 = !{i64 1086}
!745 = !{i64 1087}
!746 = !{i64 1088}
!747 = !{i64 1089}
!748 = !{i64 1090}
!749 = !{i64 1091}
!750 = !{i64 1092}
!751 = !{i64 1093}
!752 = !{i64 1094}
!753 = !{i64 1095}
!754 = !{i64 1096}
!755 = !{i64 1097}
!756 = !{i64 1098}
!757 = !{i64 1099}
!758 = !{i64 1100}
!759 = !{i64 1101}
!760 = !{i64 1102}
!761 = !{i64 1103}
!762 = !{i64 1104}
!763 = !{i64 1105}
!764 = !{i64 1106}
!765 = !{i64 1107}
!766 = !{i64 1108}
!767 = !{i64 1109}
!768 = !{i64 1110}
!769 = !{i64 1111}
!770 = !{i64 1112}
!771 = !{i64 1113}
!772 = !{i64 1114}
!773 = !{i64 1115}
!774 = !{i64 1116}
!775 = !{i64 1117}
!776 = !{i64 1118}
!777 = !{i64 1119}
!778 = !{i64 1120}
!779 = !{i64 1121}
!780 = !{i64 1122}
!781 = !{i64 1123}
!782 = !{i64 1124}
!783 = !{i64 1125}
!784 = !{i64 1126}
!785 = !{i64 1127}
!786 = !{i64 1128}
!787 = !{i64 1129}
!788 = !{i64 1130}
!789 = !{i64 1131}
!790 = !{i64 1132}
!791 = !{i64 1133}
!792 = !{i64 1134}
!793 = !{i64 1135}
!794 = !{i64 1136}
!795 = !{i64 1137}
!796 = !{i64 1138}
!797 = !{i64 1139}
!798 = !{i64 1140}
!799 = !{i64 1141}
!800 = !{i64 1142}
!801 = !{i64 1143}
!802 = !{i64 1144}
!803 = !{i64 1145}
!804 = !{i64 1146}
!805 = !{i64 1147}
!806 = !{i64 1148}
!807 = !{i64 1149}
!808 = !{i64 1150}
!809 = !{i64 1151}
!810 = !{i64 1152}
!811 = !{i64 1153}
!812 = !{i64 1154}
!813 = !{i64 1155}
!814 = !{i64 1156}
!815 = distinct !{!815, !816}
!816 = !{!"llvm.loop.name", !"decode_label2"}
!817 = !{i64 1157}
!818 = !{i64 1158}
!819 = !{i64 1159}
!820 = !{i64 1160}
!821 = !{i64 1161}
!822 = !{i64 1162}
!823 = !{i64 1163}
!824 = !{i64 1164}
!825 = !{i64 1165}
!826 = !{i64 1166}
!827 = !{i64 1167}
!828 = !{i64 1168}
!829 = !{i64 1169}
!830 = !{i64 1170}
!831 = !{i64 1171}
!832 = !{i64 1172}
!833 = !{i64 1173}
!834 = !{i64 1174}
!835 = !{i64 1175}
!836 = !{i64 1176}
!837 = !{i64 1177}
!838 = !{i64 1178}
!839 = !{i64 1179}
!840 = !{i64 1180}
!841 = !{i64 1181}
!842 = !{i64 1182}
!843 = !{i64 1183}
!844 = !{i64 1184}
!845 = !{i64 1185}
!846 = !{i64 1186}
!847 = !{i64 1187}
!848 = !{i64 1188}
!849 = !{i64 1189}
!850 = !{i64 1190}
!851 = !{i64 1191}
!852 = !{i64 1192}
!853 = !{i64 1193}
!854 = !{i64 1194}
!855 = !{i64 1195}
!856 = !{i64 1196}
!857 = !{i64 1197}
!858 = !{i64 1198}
!859 = !{i64 1199}
!860 = !{i64 1200}
!861 = !{i64 1201}
!862 = !{i64 1202}
!863 = !{i64 1203}
!864 = !{i64 1204}
!865 = !{i64 1205}
!866 = !{i64 1206}
!867 = !{i64 1207}
!868 = !{i64 1208}
!869 = !{i64 1209}
!870 = !{i64 1210}
!871 = !{i64 1211}
!872 = !{i64 1212}
!873 = !{i64 1213}
!874 = !{i64 1214}
!875 = !{i64 1215}
!876 = !{i64 1216}
!877 = !{i64 1217}
!878 = !{i64 1218}
!879 = !{i64 1219}
!880 = !{i64 1220}
!881 = !{i64 1221}
!882 = distinct !{!882, !883}
!883 = !{!"llvm.loop.name", !"decode_label3"}
!884 = !{i64 1222}
!885 = !{i64 1223}
!886 = !{i64 1224}
!887 = !{i64 1225}
!888 = !{i64 1226}
!889 = !{i64 1227}
!890 = !{i64 1228}
!891 = !{i64 1229}
!892 = !{i64 1230}
!893 = !{i64 1231}
!894 = !{i64 1232}
!895 = !{i64 1233}
!896 = !{i64 1234}
!897 = !{i64 1235}
!898 = !{i64 1236}
!899 = !{i64 1237}
!900 = !{i64 1238}
!901 = !{i64 1239}
!902 = !{i64 1240}
!903 = !{i64 1241}
!904 = !{i64 1242}
!905 = !{i64 1243}
!906 = !{i64 1244}
!907 = !{i64 1245}
!908 = !{i64 370}
!909 = !{i64 371}
!910 = !{i64 372}
!911 = !{i64 373}
!912 = !{i64 374}
!913 = !{i64 375}
!914 = !{i64 376}
!915 = !{i64 377}
!916 = !{i64 378}
!917 = !{i64 379}
!918 = !{i64 380}
!919 = !{i64 381}
!920 = !{i64 382}
!921 = !{i64 383}
!922 = !{i64 384}
!923 = !{i64 385}
!924 = !{i64 386}
!925 = !{i64 387}
!926 = !{i64 388}
!927 = !{i64 389}
!928 = !{i64 390}
!929 = !{i64 391}
!930 = !{i64 392}
!931 = !{i64 393}
!932 = !{i64 394}
!933 = !{i64 395}
!934 = !{i64 396}
!935 = !{i64 397}
!936 = !{i64 398}
!937 = !{i64 399}
!938 = !{i64 400}
!939 = !{i64 401}
!940 = !{i64 402}
!941 = !{i64 403}
!942 = !{i64 404}
!943 = !{i64 405}
!944 = !{i64 406}
!945 = !{i64 407}
!946 = !{i64 408}
!947 = !{i64 409}
!948 = !{i64 410}
!949 = !{i64 411}
!950 = !{i64 412}
!951 = !{i64 413}
!952 = !{i64 414}
!953 = !{i64 415}
!954 = distinct !{!954, !955}
!955 = !{!"llvm.loop.name", !"filtez_label8"}
!956 = !{i64 416}
!957 = !{i64 417}
!958 = !{i64 418}
!959 = !{i64 419}
!960 = !{i64 420}
!961 = !{i64 421}
!962 = !{i64 422}
!963 = !{i64 423}
!964 = !{i64 424}
!965 = !{i64 425}
!966 = !{i64 426}
!967 = !{i64 427}
!968 = !{i64 428}
!969 = !{i64 429}
!970 = !{i64 430}
!971 = !{i64 431}
!972 = !{i64 432}
!973 = !{i64 433}
!974 = !{i64 434}
!975 = !{i64 435}
!976 = !{i64 436}
!977 = !{i64 437}
!978 = !{i64 438}
!979 = !{i64 439}
!980 = !{i64 440}
!981 = !{i64 441}
!982 = !{i64 442}
!983 = !{i64 443}
!984 = !{i64 444}
!985 = !{i64 445}
!986 = !{i64 446}
!987 = !{i64 447}
!988 = !{i64 448}
!989 = !{i64 449}
!990 = !{i64 450}
!991 = !{i64 451}
!992 = !{i64 452}
!993 = !{i64 453}
!994 = !{i64 454}
!995 = !{i64 455}
!996 = !{i64 456}
!997 = !{i64 457}
!998 = !{i64 458}
!999 = !{i64 459}
!1000 = !{i64 460}
!1001 = !{i64 461}
!1002 = !{i64 462}
!1003 = !{i64 463}
!1004 = !{i64 464}
!1005 = !{i64 465}
!1006 = !{i64 466}
!1007 = !{i64 538}
!1008 = !{i64 539}
!1009 = !{i64 540}
!1010 = !{i64 541}
!1011 = !{i64 542}
!1012 = !{i64 543}
!1013 = !{i64 544}
!1014 = !{i64 545}
!1015 = !{i64 546}
!1016 = !{i64 547}
!1017 = !{i64 548}
!1018 = !{i64 549}
!1019 = !{i64 550}
!1020 = !{i64 551}
!1021 = !{i64 552}
!1022 = !{i64 553}
!1023 = !{i64 554}
!1024 = !{i64 555}
!1025 = !{i64 556}
!1026 = !{i64 557}
!1027 = !{i64 558}
!1028 = !{i64 559}
!1029 = !{i64 560}
!1030 = !{i64 561}
!1031 = !{i64 562}
!1032 = !{i64 563}
!1033 = !{i64 564}
!1034 = !{i64 565}
!1035 = !{i64 566}
!1036 = !{i64 567}
!1037 = !{i64 568}
!1038 = !{i64 569}
!1039 = !{i64 570}
!1040 = !{i64 571}
!1041 = !{i64 572}
!1042 = !{i64 573}
!1043 = !{i64 574}
!1044 = !{i64 575}
!1045 = !{i64 576}
!1046 = !{i64 577}
!1047 = !{i64 578}
!1048 = !{i64 579}
!1049 = !{i64 580}
!1050 = !{i64 581}
!1051 = !{i64 582}
!1052 = !{i64 583}
!1053 = !{i64 584}
!1054 = !{i64 585}
!1055 = !{i64 586}
!1056 = !{i64 587}
!1057 = !{i64 588}
!1058 = !{i64 589}
!1059 = !{i64 590}
!1060 = !{i64 591}
!1061 = !{i64 592}
!1062 = !{i64 593}
!1063 = !{i64 594}
!1064 = !{i64 595}
!1065 = !{i64 596}
!1066 = !{i64 597}
!1067 = !{i64 598}
!1068 = !{i64 599}
!1069 = !{i64 600}
!1070 = !{i64 601}
!1071 = !{i64 602}
!1072 = !{i64 603}
!1073 = !{i64 604}
!1074 = !{i64 605}
!1075 = !{i64 606}
!1076 = !{i64 607}
!1077 = !{i64 608}
!1078 = !{i64 609}
!1079 = !{i64 610}
!1080 = !{i64 611}
!1081 = !{i64 612}
!1082 = !{i64 613}
!1083 = !{i64 614}
!1084 = !{i64 615}
!1085 = !{i64 616}
!1086 = !{i64 617}
!1087 = !{i64 618}
!1088 = !{i64 619}
!1089 = !{i64 620}
!1090 = !{i64 621}
!1091 = !{i64 622}
!1092 = !{i64 623}
!1093 = !{i64 624}
!1094 = !{i64 625}
!1095 = !{i64 626}
!1096 = !{i64 627}
!1097 = !{i64 628}
!1098 = !{i64 629}
!1099 = !{i64 630}
!1100 = !{i64 631}
!1101 = !{i64 632}
!1102 = !{i64 633}
!1103 = !{i64 634}
!1104 = !{i64 635}
!1105 = !{i64 636}
!1106 = !{i64 637}
!1107 = !{i64 638}
!1108 = !{i64 639}
!1109 = !{i64 640}
!1110 = !{i64 641}
!1111 = !{i64 642}
!1112 = !{i64 643}
!1113 = !{i64 644}
!1114 = !{i64 645}
!1115 = !{i64 646}
!1116 = !{i64 647}
!1117 = !{i64 648}
!1118 = !{i64 649}
!1119 = !{i64 650}
!1120 = !{i64 651}
!1121 = !{i64 652}
!1122 = !{i64 653}
!1123 = distinct !{!1123, !1124}
!1124 = !{!"llvm.loop.name", !"upzero_label10"}
!1125 = !{i64 654}
!1126 = !{i64 655}
!1127 = !{i64 656}
!1128 = !{i64 657}
!1129 = !{i64 658}
!1130 = !{i64 659}
!1131 = !{i64 660}
!1132 = !{i64 661}
!1133 = !{i64 662}
!1134 = !{i64 663}
!1135 = !{i64 664}
!1136 = !{i64 665}
!1137 = !{i64 666}
!1138 = !{i64 667}
!1139 = !{i64 668}
!1140 = !{i64 669}
!1141 = !{i64 670}
!1142 = !{i64 671}
!1143 = !{i64 672}
!1144 = !{i64 673}
!1145 = !{i64 674}
!1146 = !{i64 675}
!1147 = !{i64 676}
!1148 = !{i64 677}
!1149 = !{i64 678}
!1150 = !{i64 679}
!1151 = !{i64 680}
!1152 = !{i64 681}
!1153 = !{i64 682}
!1154 = !{i64 683}
!1155 = !{i64 684}
!1156 = !{i64 685}
!1157 = !{i64 686}
!1158 = !{i64 687}
!1159 = !{i64 688}
!1160 = !{i64 689}
!1161 = !{i64 690}
!1162 = !{i64 691}
!1163 = !{i64 692}
!1164 = !{i64 693}
!1165 = !{i64 694}
!1166 = !{i64 695}
!1167 = !{i64 696}
!1168 = !{i64 697}
!1169 = !{i64 698}
!1170 = distinct !{!1170, !1171}
!1171 = !{!"llvm.loop.name", !"upzero_label11"}
!1172 = !{i64 699}
!1173 = !{i64 700}
!1174 = !{i64 701}
!1175 = !{i64 702}
!1176 = !{i64 703}
!1177 = !{i64 704}
!1178 = !{i64 705}
!1179 = !{i64 706}
!1180 = !{i64 707}
!1181 = !{i64 708}
!1182 = !{i64 709}
!1183 = !{i64 710}
!1184 = !{i64 711}
!1185 = !{i64 712}
!1186 = !{i64 713}
!1187 = !{i64 714}
!1188 = !{i64 715}
!1189 = !{i64 716}
!1190 = !{i64 717}
!1191 = !{i64 718}
!1192 = !{i64 719}
!1193 = !{i64 720}
!1194 = !{i64 721}
!1195 = !{i64 722}
!1196 = !{i64 723}
!1197 = !{i64 724}
!1198 = !{i64 725}
!1199 = !{i64 726}
!1200 = !{i64 727}
!1201 = !{i64 728}
!1202 = !{i64 729}
!1203 = !{i64 730}
!1204 = !{i64 731}
!1205 = !{i64 732}
!1206 = !{i64 733}
!1207 = !{i64 734}
!1208 = !{i64 735}
!1209 = !{i64 736}
!1210 = !{i64 737}
!1211 = !{i64 738}
!1212 = !{i64 739}
!1213 = !{i64 740}
!1214 = !{i64 741}
!1215 = !{i64 742}
!1216 = !{i64 743}
!1217 = !{i64 744}
!1218 = !{i64 745}
!1219 = !{i64 746}
!1220 = !{i64 747}
!1221 = !{i64 748}
!1222 = !{i64 749}
!1223 = !{i64 750}
!1224 = !{i64 751}
!1225 = !{i64 752}
!1226 = !{i64 753}
!1227 = !{i64 754}
!1228 = !{i64 755}
!1229 = !{i64 756}
!1230 = !{i64 757}
!1231 = !{i64 758}
!1232 = !{i64 759}
!1233 = !{i64 760}
!1234 = !{i64 761}
!1235 = !{i64 762}
!1236 = !{i64 763}
!1237 = !{i64 764}
!1238 = !{i64 765}
!1239 = !{i64 766}
!1240 = !{i64 767}
!1241 = !{i64 768}
!1242 = !{i64 769}
!1243 = !{i64 770}
!1244 = !{i64 771}
!1245 = !{i64 772}
!1246 = !{i64 773}
!1247 = !{i64 774}
!1248 = !{i64 775}
!1249 = !{i64 776}
!1250 = !{i64 777}
!1251 = !{i64 778}
!1252 = !{i64 779}
!1253 = !{i64 780}
!1254 = !{i64 781}
!1255 = !{i64 782}
!1256 = !{i64 783}
!1257 = !{i64 784}
!1258 = !{i64 785}
!1259 = !{i64 786}
!1260 = !{i64 787}
!1261 = !{i64 788}
!1262 = !{i64 789}
!1263 = !{i64 790}
!1264 = !{i64 791}
!1265 = !{i64 792}
!1266 = !{i64 793}
!1267 = !{i64 794}
!1268 = !{i64 795}
!1269 = !{i64 796}
!1270 = !{i64 797}
!1271 = !{i64 798}
!1272 = !{i64 799}
!1273 = !{i64 800}
!1274 = !{i64 801}
!1275 = !{i64 802}
!1276 = !{i64 803}
!1277 = !{i64 804}
!1278 = !{i64 805}
!1279 = !{i64 806}
!1280 = !{i64 807}
!1281 = !{i64 808}
!1282 = !{i64 809}
!1283 = !{i64 810}
!1284 = !{i64 811}
!1285 = !{i64 812}
!1286 = !{i64 813}
!1287 = !{i64 814}
!1288 = !{i64 815}
!1289 = !{i64 816}
!1290 = !{i64 817}
!1291 = !{i64 818}
!1292 = !{i64 819}
!1293 = !{i64 820}
!1294 = !{i64 821}
!1295 = !{i64 822}
!1296 = !{i64 823}
!1297 = !{i64 824}
!1298 = !{i64 825}
!1299 = !{i64 826}
!1300 = !{i64 827}
!1301 = !{i64 828}
!1302 = !{i64 829}
!1303 = !{i64 830}
!1304 = !{i64 831}
!1305 = !{i64 832}
!1306 = !{i64 833}
!1307 = !{i64 834}
!1308 = !{i64 835}
!1309 = !{i64 836}
!1310 = !{i64 837}
!1311 = !{i64 838}
!1312 = !{i64 839}
!1313 = !{i64 840}
!1314 = !{i64 841}
!1315 = !{i64 842}
!1316 = !{i64 843}
!1317 = !{i64 844}
!1318 = !{i64 845}
!1319 = !{i64 846}
!1320 = !{i64 847}
!1321 = !{i64 848}
!1322 = !{i64 849}
!1323 = !{i64 850}
!1324 = !{i64 851}
!1325 = !{i64 852}
!1326 = !{i64 853}
!1327 = !{i64 854}
!1328 = !{i64 855}
!1329 = !{i64 856}
!1330 = !{i64 857}
!1331 = !{i64 858}
!1332 = !{i64 859}
!1333 = !{i64 860}
!1334 = !{i64 861}
!1335 = !{i64 862}
!1336 = !{i64 863}
!1337 = !{i64 864}
!1338 = !{i64 865}
!1339 = !{i64 866}
!1340 = !{i64 867}
!1341 = !{i64 868}
!1342 = !{i64 869}
!1343 = !{i64 870}
!1344 = !{i64 871}
!1345 = !{i64 872}
!1346 = !{i64 873}
!1347 = !{i64 874}
!1348 = !{i64 875}
!1349 = !{i64 876}
!1350 = !{i64 877}
!1351 = !{i64 878}
!1352 = !{i64 879}
!1353 = !{i64 880}
!1354 = !{i64 881}
!1355 = !{i64 882}
!1356 = !{i64 883}
!1357 = !{i64 884}
!1358 = !{i64 885}
!1359 = !{i64 886}
!1360 = !{i64 887}
!1361 = !{i64 888}
!1362 = !{i64 889}
!1363 = !{i64 890}
!1364 = !{i64 891}
!1365 = !{i64 892}
!1366 = !{i64 893}
!1367 = !{i64 894}
!1368 = !{i64 895}
!1369 = !{i64 896}
!1370 = !{i64 897}
!1371 = !{i64 898}
!1372 = !{i64 899}
!1373 = !{i64 900}
!1374 = !{i64 901}
!1375 = !{i64 902}
!1376 = !{i64 903}
!1377 = !{i64 904}
!1378 = !{i64 905}
!1379 = !{i64 906}
!1380 = !{i64 907}
!1381 = !{i64 908}
!1382 = !{i64 909}
!1383 = !{i64 910}
!1384 = !{i64 911}
!1385 = !{i64 912}
!1386 = !{i64 913}
!1387 = !{i64 914}
!1388 = !{i64 915}
!1389 = !{i64 916}
!1390 = !{i64 917}
!1391 = !{i64 918}
!1392 = !{i64 919}
!1393 = !{i64 467}
!1394 = !{i64 468}
!1395 = !{i64 469}
!1396 = !{i64 470}
!1397 = !{i64 471}
!1398 = !{i64 472}
!1399 = !{i64 473}
!1400 = !{i64 474}
!1401 = !{i64 475}
!1402 = !{i64 476}
!1403 = !{i64 477}
!1404 = !{i64 478}
!1405 = !{i64 479}
!1406 = !{i64 480}
!1407 = !{i64 481}
!1408 = !{i64 482}
!1409 = !{i64 483}
!1410 = !{i64 484}
!1411 = !{i64 485}
!1412 = !{i64 486}
!1413 = !{i64 487}
!1414 = !{i64 488}
!1415 = !{i64 489}
!1416 = !{i64 490}
!1417 = !{i64 491}
!1418 = !{i64 492}
!1419 = !{i64 493}
!1420 = !{i64 494}
!1421 = !{i64 495}
!1422 = !{i64 496}
!1423 = !{i64 497}
!1424 = !{i64 498}
!1425 = !{i64 499}
!1426 = !{i64 500}
!1427 = !{i64 501}
!1428 = !{i64 502}
!1429 = !{i64 503}
!1430 = !{i64 504}
!1431 = !{i64 505}
!1432 = !{i64 506}
!1433 = !{i64 507}
!1434 = !{i64 508}
!1435 = !{i64 509}
!1436 = !{i64 510}
!1437 = !{i64 511}
!1438 = distinct !{!1438, !1439}
!1439 = !{!"llvm.loop.name", !"quantl_label9"}
!1440 = !{i64 512}
!1441 = !{i64 513}
!1442 = !{i64 514}
!1443 = !{i64 515}
!1444 = !{i64 516}
!1445 = !{i64 517}
!1446 = !{i64 518}
!1447 = !{i64 519}
!1448 = !{i64 520}
!1449 = !{i64 521}
!1450 = !{i64 522}
!1451 = !{i64 523}
!1452 = !{i64 524}
!1453 = !{i64 525}
!1454 = !{i64 526}
!1455 = !{i64 527}
!1456 = !{i64 528}
!1457 = !{i64 529}
!1458 = !{i64 530}
!1459 = !{i64 531}
!1460 = !{i64 532}
!1461 = !{i64 533}
!1462 = !{i64 534}
!1463 = !{i64 535}
!1464 = !{i64 536}
!1465 = !{i64 537}
!1466 = !{i64 17}
!1467 = !{i64 18}
!1468 = !{i64 19}
!1469 = !{i64 20}
!1470 = !{i64 21}
!1471 = !{i64 22}
!1472 = !{i64 23}
!1473 = !{i64 24}
!1474 = !{i64 25}
!1475 = !{i64 26}
!1476 = !{i64 27}
!1477 = !{i64 28}
!1478 = !{i64 29}
!1479 = !{i64 30}
!1480 = !{i64 31}
!1481 = !{i64 32}
!1482 = !{i64 33}
!1483 = !{i64 34}
!1484 = !{i64 35}
