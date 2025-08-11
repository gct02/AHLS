; ModuleID = '<stdin>'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

@h = constant [24 x i32] [i32 12, i32 -44, i32 -44, i32 212, i32 48, i32 -624, i32 128, i32 1448, i32 -840, i32 -3220, i32 3804, i32 15504, i32 15504, i32 3804, i32 -3220, i32 -840, i32 1448, i32 128, i32 -624, i32 48, i32 212, i32 -44, i32 -44, i32 12], align 4, !id.1 !0, !id !0
@qq4_code4_table = constant [16 x i32] [i32 0, i32 -20456, i32 -12896, i32 -8968, i32 -6288, i32 -4240, i32 -2584, i32 -1200, i32 20456, i32 12896, i32 8968, i32 6288, i32 4240, i32 2584, i32 1200, i32 0], align 4, !id !1, !id.2 !1
@qq6_code6_table = constant [64 x i32] [i32 -136, i32 -136, i32 -136, i32 -136, i32 -24808, i32 -21904, i32 -19008, i32 -16704, i32 -14984, i32 -13512, i32 -12280, i32 -11192, i32 -10232, i32 -9360, i32 -8576, i32 -7856, i32 -7192, i32 -6576, i32 -6000, i32 -5456, i32 -4944, i32 -4464, i32 -4008, i32 -3576, i32 -3168, i32 -2776, i32 -2400, i32 -2032, i32 -1688, i32 -1360, i32 -1040, i32 -728, i32 24808, i32 21904, i32 19008, i32 16704, i32 14984, i32 13512, i32 12280, i32 11192, i32 10232, i32 9360, i32 8576, i32 7856, i32 7192, i32 6576, i32 6000, i32 5456, i32 4944, i32 4464, i32 4008, i32 3576, i32 3168, i32 2776, i32 2400, i32 2032, i32 1688, i32 1360, i32 1040, i32 728, i32 432, i32 136, i32 -432, i32 -136], align 4, !id !2, !id.3 !2
@wl_code_table = constant [16 x i32] [i32 -60, i32 3042, i32 1198, i32 538, i32 334, i32 172, i32 58, i32 -30, i32 3042, i32 1198, i32 538, i32 334, i32 172, i32 58, i32 -30, i32 -60], align 4, !id !3, !id.4 !3
@ilb_table = constant [32 x i32] [i32 2048, i32 2093, i32 2139, i32 2186, i32 2233, i32 2282, i32 2332, i32 2383, i32 2435, i32 2489, i32 2543, i32 2599, i32 2656, i32 2714, i32 2774, i32 2834, i32 2896, i32 2960, i32 3025, i32 3091, i32 3158, i32 3228, i32 3298, i32 3371, i32 3444, i32 3520, i32 3597, i32 3676, i32 3756, i32 3838, i32 3922, i32 4008], align 4, !id !4, !id.5 !4
@decis_levl = constant [30 x i32] [i32 280, i32 576, i32 880, i32 1200, i32 1520, i32 1864, i32 2208, i32 2584, i32 2960, i32 3376, i32 3784, i32 4240, i32 4696, i32 5200, i32 5712, i32 6288, i32 6864, i32 7520, i32 8184, i32 8968, i32 9752, i32 10712, i32 11664, i32 12896, i32 14120, i32 15840, i32 17560, i32 20456, i32 23352, i32 32767], align 4, !id !5, !id.6 !5
@quant26bt_pos = constant [31 x i32] [i32 61, i32 60, i32 59, i32 58, i32 57, i32 56, i32 55, i32 54, i32 53, i32 52, i32 51, i32 50, i32 49, i32 48, i32 47, i32 46, i32 45, i32 44, i32 43, i32 42, i32 41, i32 40, i32 39, i32 38, i32 37, i32 36, i32 35, i32 34, i32 33, i32 32, i32 32], align 4, !id !6, !id.7 !6
@quant26bt_neg = constant [31 x i32] [i32 63, i32 62, i32 31, i32 30, i32 29, i32 28, i32 27, i32 26, i32 25, i32 24, i32 23, i32 22, i32 21, i32 20, i32 19, i32 18, i32 17, i32 16, i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 4], align 4, !id !7, !id.8 !7
@qq2_code2_table = constant [4 x i32] [i32 -7408, i32 -1616, i32 7408, i32 1616], align 4, !id !8, !id.9 !8
@wh_code_table = constant [4 x i32] [i32 798, i32 -214, i32 798, i32 -214], align 4, !id !9, !id.10 !9
@xout1 = common global i32 0, align 4, !id !10, !id.11 !10
@xout2 = common global i32 0, align 4, !id !11, !id.12 !11
@tqmf = common global [24 x i32] zeroinitializer, align 4, !id !12, !id.13 !12
@xl = common global i32 0, align 4, !id !13, !id.14 !13
@xh = common global i32 0, align 4, !id !14, !id.15 !14
@delay_bpl = common global [6 x i32] zeroinitializer, align 4, !id !15, !id.16 !15
@delay_dltx = common global [6 x i32] zeroinitializer, align 4, !id !16, !id.17 !16
@szl = common global i32 0, align 4, !id !17, !id.18 !17
@rlt1 = common global i32 0, align 4, !id !18, !id.19 !18
@al1 = common global i32 0, align 4, !id !19, !id.20 !19
@rlt2 = common global i32 0, align 4, !id !20, !id.21 !20
@al2 = common global i32 0, align 4, !id !21, !id.22 !21
@spl = common global i32 0, align 4, !id !22, !id.23 !22
@sl = common global i32 0, align 4, !id !23, !id.24 !23
@el = common global i32 0, align 4, !id !24, !id.25 !24
@detl = common global i32 0, align 4, !id !25, !id.26 !25
@il = common global i32 0, align 4, !id !26, !id.27 !26
@dlt = common global i32 0, align 4, !id !27, !id.28 !27
@nbl = common global i32 0, align 4, !id !28, !id.29 !28
@plt = common global i32 0, align 4, !id !29, !id.30 !29
@plt1 = common global i32 0, align 4, !id !30, !id.31 !30
@plt2 = common global i32 0, align 4, !id !31, !id.32 !31
@rlt = common global i32 0, align 4, !id !32, !id.33 !32
@delay_bph = common global [6 x i32] zeroinitializer, align 4, !id !33, !id.34 !33
@delay_dhx = common global [6 x i32] zeroinitializer, align 4, !id !34, !id.35 !34
@szh = common global i32 0, align 4, !id !35, !id.36 !35
@rh1 = common global i32 0, align 4, !id !36, !id.37 !36
@ah1 = common global i32 0, align 4, !id !37, !id.38 !37
@rh2 = common global i32 0, align 4, !id !38, !id.39 !38
@ah2 = common global i32 0, align 4, !id !39, !id.40 !39
@sph = common global i32 0, align 4, !id !40, !id.41 !40
@sh = common global i32 0, align 4, !id !41, !id.42 !41
@eh = common global i32 0, align 4, !id !42, !id.43 !42
@ih = common global i32 0, align 4, !id !43, !id.44 !43
@deth = common global i32 0, align 4, !id !44, !id.45 !44
@dh = common global i32 0, align 4, !id !45, !id.46 !45
@nbh = common global i32 0, align 4, !id !46, !id.47 !46
@ph = common global i32 0, align 4, !id !47, !id.48 !47
@ph1 = common global i32 0, align 4, !id !48, !id.49 !48
@ph2 = common global i32 0, align 4, !id !49, !id.50 !49
@yh = common global i32 0, align 4, !id !50, !id.51 !50
@ilr = common global i32 0, align 4, !id !51, !id.52 !51
@dec_del_bpl = common global [6 x i32] zeroinitializer, align 4, !id !52, !id.53 !52
@dec_del_dltx = common global [6 x i32] zeroinitializer, align 4, !id !53, !id.54 !53
@dec_szl = common global i32 0, align 4, !id !54, !id.55 !54
@dec_rlt1 = common global i32 0, align 4, !id !55, !id.56 !55
@dec_al1 = common global i32 0, align 4, !id !56, !id.57 !56
@dec_rlt2 = common global i32 0, align 4, !id !57, !id.58 !57
@dec_al2 = common global i32 0, align 4, !id !58, !id.59 !58
@dec_spl = common global i32 0, align 4, !id !59, !id.60 !59
@dec_sl = common global i32 0, align 4, !id !60, !id.61 !60
@dec_detl = common global i32 0, align 4, !id !61, !id.62 !61
@dec_dlt = common global i32 0, align 4, !id !62, !id.63 !62
@dl = common global i32 0, align 4, !id !63, !id.64 !63
@rl = common global i32 0, align 4, !id !64, !id.65 !64
@dec_nbl = common global i32 0, align 4, !id !65, !id.66 !65
@dec_plt = common global i32 0, align 4, !id !66, !id.67 !66
@dec_plt1 = common global i32 0, align 4, !id !67, !id.68 !67
@dec_plt2 = common global i32 0, align 4, !id !68, !id.69 !68
@dec_rlt = common global i32 0, align 4, !id !69, !id.70 !69
@dec_del_bph = common global [6 x i32] zeroinitializer, align 4, !id !70, !id.71 !70
@dec_del_dhx = common global [6 x i32] zeroinitializer, align 4, !id !71, !id.72 !71
@dec_szh = common global i32 0, align 4, !id !72, !id.73 !72
@dec_rh1 = common global i32 0, align 4, !id !73, !id.74 !73
@dec_ah1 = common global i32 0, align 4, !id !74, !id.75 !74
@dec_rh2 = common global i32 0, align 4, !id !75, !id.76 !75
@dec_ah2 = common global i32 0, align 4, !id !76, !id.77 !76
@dec_sph = common global i32 0, align 4, !id !77, !id.78 !77
@dec_sh = common global i32 0, align 4, !id !78, !id.79 !78
@dec_deth = common global i32 0, align 4, !id !79, !id.80 !79
@dec_dh = common global i32 0, align 4, !id !80, !id.81 !80
@dec_nbh = common global i32 0, align 4, !id !81, !id.82 !81
@dec_ph = common global i32 0, align 4, !id !82, !id.83 !82
@dec_ph1 = common global i32 0, align 4, !id !83, !id.84 !83
@dec_ph2 = common global i32 0, align 4, !id !84, !id.85 !84
@rh = common global i32 0, align 4, !id !85, !id.86 !85
@xd = common global i32 0, align 4, !id !86, !id.87 !86
@xs = common global i32 0, align 4, !id !87, !id.88 !87
@accumc = common global [11 x i32] zeroinitializer, align 4, !id !88, !id.89 !88
@accumd = common global [11 x i32] zeroinitializer, align 4, !id !89, !id.90 !89

; Function Attrs: nounwind
define void @adpcm_main(i32* "fpga.decayed.dim.hint"="100" %in_data, i32* "fpga.decayed.dim.hint"="50" %encoded, i32* "fpga.decayed.dim.hint"="100" %decoded) #0 !fpga.function.pragma !94 !id !0 {
entry:
  call void @reset(), !id !3, !id.4 !3
  br label %adpcm_main_label12, !id !4, !id.5 !4

adpcm_main_label12:                               ; preds = %entry
  br label %for.cond, !id !6, !id.7 !6

for.cond:                                         ; preds = %for.inc, %adpcm_main_label12
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %for.inc ], [ 0, %adpcm_main_label12 ], !id !7, !id.8 !7
  %exitcond9 = icmp ne i64 %indvars.iv4, 50, !id !9, !id.10 !9
  br i1 %exitcond9, label %for.body, label %for.end, !id !10, !id.11 !10

for.body:                                         ; preds = %for.cond
  %0 = mul nuw nsw i64 2, %indvars.iv4, !id !11, !id.12 !11
  %arrayidx = getelementptr inbounds i32, i32* %in_data, i64 %0, !id !12, !id.13 !12
  %1 = load i32, i32* %arrayidx, align 4, !id !13, !id.14 !13
  %2 = mul nuw nsw i64 2, %indvars.iv4, !id !14, !id.15 !14
  %3 = add nuw nsw i64 %2, 1, !id !15, !id.16 !15
  %arrayidx3 = getelementptr inbounds i32, i32* %in_data, i64 %3, !id !16, !id.17 !16
  %4 = load i32, i32* %arrayidx3, align 4, !id !17, !id.18 !17
  %call = call i32 @encode(i32 %1, i32 %4), !id !18, !id.19 !18
  %arrayidx5 = getelementptr inbounds i32, i32* %encoded, i64 %indvars.iv4, !id !19, !id.20 !19
  store i32 %call, i32* %arrayidx5, align 4, !id !20, !id.21 !20
  br label %for.inc, !id !21, !id.22 !21

for.inc:                                          ; preds = %for.body
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !id !22, !id.23 !22
  br label %for.cond, !llvm.loop !96, !id !24, !id.25 !24

for.end:                                          ; preds = %for.cond
  br label %adpcm_main_label13, !id !25, !id.26 !25

adpcm_main_label13:                               ; preds = %for.end
  br label %for.cond6, !id !27, !id.28 !27

for.cond6:                                        ; preds = %for.inc18, %adpcm_main_label13
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc18 ], [ 0, %adpcm_main_label13 ], !id !28, !id.29 !28
  %exitcond = icmp ne i64 %indvars.iv, 50, !id !30, !id.31 !30
  br i1 %exitcond, label %for.body8, label %for.end20, !id !31, !id.32 !31

for.body8:                                        ; preds = %for.cond6
  %arrayidx10 = getelementptr inbounds i32, i32* %encoded, i64 %indvars.iv, !id !32, !id.33 !32
  %5 = load i32, i32* %arrayidx10, align 4, !id !33, !id.34 !33
  call void @decode(i32 %5), !id !34, !id.35 !34
  %6 = load i32, i32* @xout1, align 4, !id !35, !id.36 !35
  %7 = mul nuw nsw i64 2, %indvars.iv, !id !36, !id.37 !36
  %arrayidx13 = getelementptr inbounds i32, i32* %decoded, i64 %7, !id !37, !id.38 !37
  store i32 %6, i32* %arrayidx13, align 4, !id !38, !id.39 !38
  %8 = load i32, i32* @xout2, align 4, !id !39, !id.40 !39
  %9 = mul nuw nsw i64 2, %indvars.iv, !id !40, !id.41 !40
  %10 = add nuw nsw i64 %9, 1, !id !41, !id.42 !41
  %arrayidx17 = getelementptr inbounds i32, i32* %decoded, i64 %10, !id !42, !id.43 !42
  store i32 %8, i32* %arrayidx17, align 4, !id !43, !id.44 !43
  br label %for.inc18, !id !44, !id.45 !44

for.inc18:                                        ; preds = %for.body8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !45, !id.46 !45
  br label %for.cond6, !llvm.loop !97, !id !47, !id.48 !47

for.end20:                                        ; preds = %for.cond6
  ret void, !id !48, !id.49 !48
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: noinline nounwind
define void @reset() #3 !fpga.function.pragma !98 !id !3 {
entry:
  store i32 32, i32* @dec_detl, align 4, !id !49, !id.50 !49
  store i32 32, i32* @detl, align 4, !id !50, !id.51 !50
  store i32 8, i32* @dec_deth, align 4, !id !51, !id.52 !51
  store i32 8, i32* @deth, align 4, !id !52, !id.53 !52
  store i32 0, i32* @rlt2, align 4, !id !53, !id.54 !53
  store i32 0, i32* @rlt1, align 4, !id !54, !id.55 !54
  store i32 0, i32* @plt2, align 4, !id !55, !id.56 !55
  store i32 0, i32* @plt1, align 4, !id !56, !id.57 !56
  store i32 0, i32* @al2, align 4, !id !57, !id.58 !57
  store i32 0, i32* @al1, align 4, !id !58, !id.59 !58
  store i32 0, i32* @nbl, align 4, !id !59, !id.60 !59
  store i32 0, i32* @rh2, align 4, !id !60, !id.61 !60
  store i32 0, i32* @rh1, align 4, !id !61, !id.62 !61
  store i32 0, i32* @ph2, align 4, !id !62, !id.63 !62
  store i32 0, i32* @ph1, align 4, !id !63, !id.64 !63
  store i32 0, i32* @ah2, align 4, !id !64, !id.65 !64
  store i32 0, i32* @ah1, align 4, !id !65, !id.66 !65
  store i32 0, i32* @nbh, align 4, !id !66, !id.67 !66
  store i32 0, i32* @dec_rlt2, align 4, !id !67, !id.68 !67
  store i32 0, i32* @dec_rlt1, align 4, !id !68, !id.69 !68
  store i32 0, i32* @dec_plt2, align 4, !id !69, !id.70 !69
  store i32 0, i32* @dec_plt1, align 4, !id !70, !id.71 !70
  store i32 0, i32* @dec_al2, align 4, !id !71, !id.72 !71
  store i32 0, i32* @dec_al1, align 4, !id !72, !id.73 !72
  store i32 0, i32* @dec_nbl, align 4, !id !73, !id.74 !73
  store i32 0, i32* @dec_rh2, align 4, !id !74, !id.75 !74
  store i32 0, i32* @dec_rh1, align 4, !id !75, !id.76 !75
  store i32 0, i32* @dec_ph2, align 4, !id !76, !id.77 !76
  store i32 0, i32* @dec_ph1, align 4, !id !77, !id.78 !77
  store i32 0, i32* @dec_ah2, align 4, !id !78, !id.79 !78
  store i32 0, i32* @dec_ah1, align 4, !id !79, !id.80 !79
  store i32 0, i32* @dec_nbh, align 4, !id !80, !id.81 !80
  br label %reset_label4, !id !81, !id.82 !81

reset_label4:                                     ; preds = %entry
  br label %for.cond, !id !83, !id.84 !83

for.cond:                                         ; preds = %for.inc, %reset_label4
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.inc ], [ 0, %reset_label4 ], !id !84, !id.85 !84
  %exitcond9 = icmp ne i64 %indvars.iv7, 6, !id !86, !id.87 !86
  br i1 %exitcond9, label %for.body, label %for.end, !id !87, !id.88 !87

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dltx, i64 0, i64 %indvars.iv7, !id !88, !id.89 !88
  store i32 0, i32* %arrayidx, align 4, !id !89, !id.90 !89
  %arrayidx2 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dhx, i64 0, i64 %indvars.iv7, !id !100, !id.91 !100
  store i32 0, i32* %arrayidx2, align 4, !id !101, !id.92 !101
  %arrayidx4 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dltx, i64 0, i64 %indvars.iv7, !id !102, !id.93 !102
  store i32 0, i32* %arrayidx4, align 4, !id !103, !id.94 !103
  %arrayidx6 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dhx, i64 0, i64 %indvars.iv7, !id !104, !id.95 !104
  store i32 0, i32* %arrayidx6, align 4, !id !105, !id.96 !105
  br label %for.inc, !id !106, !id.97 !106

for.inc:                                          ; preds = %for.body
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1, !id !107, !id.98 !107
  br label %for.cond, !llvm.loop !108, !id !109, !id.100 !109

for.end:                                          ; preds = %for.cond
  br label %reset_label5, !id !110, !id.101 !110

reset_label5:                                     ; preds = %for.end
  br label %for.cond7, !id !111, !id.103 !111

for.cond7:                                        ; preds = %for.inc18, %reset_label5
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %for.inc18 ], [ 0, %reset_label5 ], !id !112, !id.104 !112
  %exitcond6 = icmp ne i64 %indvars.iv4, 6, !id !113, !id.106 !113
  br i1 %exitcond6, label %for.body9, label %for.end20, !id !114, !id.107 !114

for.body9:                                        ; preds = %for.cond7
  %arrayidx11 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bpl, i64 0, i64 %indvars.iv4, !id !115, !id.108 !115
  store i32 0, i32* %arrayidx11, align 4, !id !116, !id.109 !116
  %arrayidx13 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bph, i64 0, i64 %indvars.iv4, !id !117, !id.110 !117
  store i32 0, i32* %arrayidx13, align 4, !id !118, !id.111 !118
  %arrayidx15 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bpl, i64 0, i64 %indvars.iv4, !id !119, !id.112 !119
  store i32 0, i32* %arrayidx15, align 4, !id !120, !id.113 !120
  %arrayidx17 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bph, i64 0, i64 %indvars.iv4, !id !121, !id.114 !121
  store i32 0, i32* %arrayidx17, align 4, !id !122, !id.115 !122
  br label %for.inc18, !id !123, !id.116 !123

for.inc18:                                        ; preds = %for.body9
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1, !id !124, !id.117 !124
  br label %for.cond7, !llvm.loop !125, !id !126, !id.119 !126

for.end20:                                        ; preds = %for.cond7
  br label %reset_label6, !id !127, !id.120 !127

reset_label6:                                     ; preds = %for.end20
  br label %for.cond21, !id !128, !id.122 !128

for.cond21:                                       ; preds = %for.inc26, %reset_label6
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc26 ], [ 0, %reset_label6 ], !id !129, !id.123 !129
  %exitcond3 = icmp ne i64 %indvars.iv1, 24, !id !130, !id.125 !130
  br i1 %exitcond3, label %for.body23, label %for.end28, !id !131, !id.126 !131

for.body23:                                       ; preds = %for.cond21
  %arrayidx25 = getelementptr inbounds [24 x i32], [24 x i32]* @tqmf, i64 0, i64 %indvars.iv1, !id !132, !id.127 !132
  store i32 0, i32* %arrayidx25, align 4, !id !133, !id.128 !133
  br label %for.inc26, !id !134, !id.129 !134

for.inc26:                                        ; preds = %for.body23
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1, !id !135, !id.130 !135
  br label %for.cond21, !llvm.loop !136, !id !137, !id.132 !137

for.end28:                                        ; preds = %for.cond21
  br label %reset_label7, !id !138, !id.133 !138

reset_label7:                                     ; preds = %for.end28
  br label %for.cond29, !id !139, !id.135 !139

for.cond29:                                       ; preds = %for.inc36, %reset_label7
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc36 ], [ 0, %reset_label7 ], !id !140, !id.136 !140
  %exitcond = icmp ne i64 %indvars.iv, 11, !id !141, !id.138 !141
  br i1 %exitcond, label %for.body31, label %for.end38, !id !142, !id.139 !142

for.body31:                                       ; preds = %for.cond29
  %arrayidx33 = getelementptr inbounds [11 x i32], [11 x i32]* @accumc, i64 0, i64 %indvars.iv, !id !143, !id.140 !143
  store i32 0, i32* %arrayidx33, align 4, !id !144, !id.141 !144
  %arrayidx35 = getelementptr inbounds [11 x i32], [11 x i32]* @accumd, i64 0, i64 %indvars.iv, !id !145, !id.142 !145
  store i32 0, i32* %arrayidx35, align 4, !id !146, !id.143 !146
  br label %for.inc36, !id !147, !id.144 !147

for.inc36:                                        ; preds = %for.body31
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !148, !id.145 !148
  br label %for.cond29, !llvm.loop !149, !id !150, !id.147 !150

for.end38:                                        ; preds = %for.cond29
  ret void, !id !151, !id.148 !151
}

; Function Attrs: noinline nounwind
define i32 @encode(i32 %xin1, i32 %xin2) #3 !fpga.function.pragma !98 !id !8 {
entry:
  %incdec.ptr = getelementptr inbounds i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 0), i32 1, !id !152, !id.153 !152
  %0 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 0), align 4, !id !153, !id.155 !153
  %conv = sext i32 %0 to i64, !id !154, !id.156 !154
  %incdec.ptr1 = getelementptr inbounds i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32 1, !id !155, !id.157 !155
  %1 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), align 4, !id !156, !id.159 !156
  %conv2 = sext i32 %1 to i64, !id !157, !id.160 !157
  %mul = mul nsw i64 %conv, %conv2, !id !158, !id.161 !158
  %incdec.ptr3 = getelementptr inbounds i32, i32* %incdec.ptr, i32 1, !id !159, !id.163 !159
  %2 = load i32, i32* %incdec.ptr, align 4, !id !160, !id.165 !160
  %conv4 = sext i32 %2 to i64, !id !161, !id.166 !161
  %incdec.ptr5 = getelementptr inbounds i32, i32* %incdec.ptr1, i32 1, !id !162, !id.167 !162
  %3 = load i32, i32* %incdec.ptr1, align 4, !id !163, !id.169 !163
  %conv6 = sext i32 %3 to i64, !id !164, !id.170 !164
  %mul7 = mul nsw i64 %conv4, %conv6, !id !165, !id.171 !165
  br label %encode_label0, !id !166, !id.173 !166

encode_label0:                                    ; preds = %entry
  br label %for.cond, !id !167, !id.175 !167

for.cond:                                         ; preds = %for.inc, %encode_label0
  %tqmf_ptr.0 = phi i32* [ %incdec.ptr3, %encode_label0 ], [ %incdec.ptr13, %for.inc ], !id !168, !id.176 !168
  %h_ptr.0 = phi i32* [ %incdec.ptr5, %encode_label0 ], [ %incdec.ptr15, %for.inc ], !id !169, !id.177 !169
  %i.0 = phi i32 [ 0, %encode_label0 ], [ %inc, %for.inc ], !id !170, !id.178 !170
  %xa.0 = phi i64 [ %mul, %encode_label0 ], [ %add, %for.inc ], !id !171, !id.179 !171
  %xb.0 = phi i64 [ %mul7, %encode_label0 ], [ %add18, %for.inc ], !id !172, !id.180 !172
  %exitcond1 = icmp ne i32 %i.0, 10, !id !173, !id.186 !173
  br i1 %exitcond1, label %for.body, label %for.end, !id !174, !id.187 !174

for.body:                                         ; preds = %for.cond
  %incdec.ptr8 = getelementptr inbounds i32, i32* %tqmf_ptr.0, i32 1, !id !175, !id.188 !175
  %4 = load i32, i32* %tqmf_ptr.0, align 4, !id !176, !id.190 !176
  %conv9 = sext i32 %4 to i64, !id !177, !id.191 !177
  %incdec.ptr10 = getelementptr inbounds i32, i32* %h_ptr.0, i32 1, !id !178, !id.192 !178
  %5 = load i32, i32* %h_ptr.0, align 4, !id !179, !id.194 !179
  %conv11 = sext i32 %5 to i64, !id !180, !id.195 !180
  %mul12 = mul nsw i64 %conv9, %conv11, !id !181, !id.196 !181
  %add = add nsw i64 %xa.0, %mul12, !id !182, !id.197 !182
  %incdec.ptr13 = getelementptr inbounds i32, i32* %incdec.ptr8, i32 1, !id !183, !id.199 !183
  %6 = load i32, i32* %incdec.ptr8, align 4, !id !184, !id.201 !184
  %conv14 = sext i32 %6 to i64, !id !185, !id.202 !185
  %incdec.ptr15 = getelementptr inbounds i32, i32* %incdec.ptr10, i32 1, !id !186, !id.203 !186
  %7 = load i32, i32* %incdec.ptr10, align 4, !id !187, !id.205 !187
  %conv16 = sext i32 %7 to i64, !id !188, !id.206 !188
  %mul17 = mul nsw i64 %conv14, %conv16, !id !189, !id.207 !189
  %add18 = add nsw i64 %xb.0, %mul17, !id !190, !id.208 !190
  br label %for.inc, !id !191, !id.210 !191

for.inc:                                          ; preds = %for.body
  %inc = add nuw nsw i32 %i.0, 1, !id !192, !id.211 !192
  br label %for.cond, !llvm.loop !193, !id !194, !id.213 !194

for.end:                                          ; preds = %for.cond
  %xa.0.lcssa = phi i64 [ %xa.0, %for.cond ], !id !195, !id.214 !195
  %xb.0.lcssa = phi i64 [ %xb.0, %for.cond ], !id !196, !id.215 !196
  %incdec.ptr19 = getelementptr inbounds i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i64 0, i64 22), i32 1, !id !197, !id.216 !197
  %8 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i64 0, i64 22), align 4, !id !198, !id.218 !198
  %conv20 = sext i32 %8 to i64, !id !199, !id.219 !199
  %incdec.ptr21 = getelementptr inbounds i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i64 0, i64 22), i32 1, !id !200, !id.220 !200
  %9 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i64 0, i64 22), align 4, !id !201, !id.222 !201
  %conv22 = sext i32 %9 to i64, !id !202, !id.223 !202
  %mul23 = mul nsw i64 %conv20, %conv22, !id !203, !id.224 !203
  %add24 = add nsw i64 %xa.0.lcssa, %mul23, !id !204, !id.225 !204
  %10 = load i32, i32* %incdec.ptr19, align 4, !id !205, !id.227 !205
  %conv25 = sext i32 %10 to i64, !id !206, !id.228 !206
  %incdec.ptr26 = getelementptr inbounds i32, i32* %incdec.ptr21, i32 1, !id !207, !id.229 !207
  %11 = load i32, i32* %incdec.ptr21, align 4, !id !208, !id.231 !208
  %conv27 = sext i32 %11 to i64, !id !209, !id.232 !209
  %mul28 = mul nsw i64 %conv25, %conv27, !id !210, !id.233 !210
  %add29 = add nsw i64 %xb.0.lcssa, %mul28, !id !211, !id.234 !211
  %add.ptr = getelementptr inbounds i32, i32* %incdec.ptr19, i64 -2, !id !212, !id.236 !212
  br label %encode_label1, !id !213, !id.238 !213

encode_label1:                                    ; preds = %for.end
  br label %for.cond30, !id !214, !id.240 !214

for.cond30:                                       ; preds = %for.inc35, %encode_label1
  %tqmf_ptr1.0 = phi i32* [ %add.ptr, %encode_label1 ], [ %incdec.ptr33, %for.inc35 ], !id !215, !id.241 !215
  %tqmf_ptr.1 = phi i32* [ %incdec.ptr19, %encode_label1 ], [ %incdec.ptr34, %for.inc35 ], !id !216, !id.242 !216
  %i.1 = phi i32 [ 0, %encode_label1 ], [ %inc36, %for.inc35 ], !id !217, !id.243 !217
  %exitcond = icmp ne i32 %i.1, 22, !id !218, !id.247 !218
  br i1 %exitcond, label %for.body32, label %for.end37, !id !219, !id.248 !219

for.body32:                                       ; preds = %for.cond30
  %incdec.ptr33 = getelementptr inbounds i32, i32* %tqmf_ptr1.0, i32 -1, !id !220, !id.249 !220
  %12 = load i32, i32* %tqmf_ptr1.0, align 4, !id !221, !id.251 !221
  %incdec.ptr34 = getelementptr inbounds i32, i32* %tqmf_ptr.1, i32 -1, !id !222, !id.252 !222
  store i32 %12, i32* %tqmf_ptr.1, align 4, !id !223, !id.254 !223
  br label %for.inc35, !id !224, !id.255 !224

for.inc35:                                        ; preds = %for.body32
  %inc36 = add nuw nsw i32 %i.1, 1, !id !225, !id.256 !225
  br label %for.cond30, !llvm.loop !226, !id !227, !id.258 !227

for.end37:                                        ; preds = %for.cond30
  %scevgep = getelementptr i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i64 0, i64 22), i64 -21, !id !228, !id.259 !228
  %incdec.ptr38 = getelementptr inbounds i32, i32* %scevgep, i32 -1, !id !229, !id.260 !229
  store i32 %xin1, i32* %scevgep, align 4, !id !230, !id.262 !230
  store i32 %xin2, i32* %incdec.ptr38, align 4, !id !231, !id.263 !231
  %add39 = add nsw i64 %add24, %add29, !id !232, !id.264 !232
  %shr = ashr i64 %add39, 15, !id !233, !id.265 !233
  %conv40 = trunc i64 %shr to i32, !id !234, !id.266 !234
  store i32 %conv40, i32* @xl, align 4, !id !235, !id.267 !235
  %sub = sub nsw i64 %add24, %add29, !id !236, !id.268 !236
  %shr41 = ashr i64 %sub, 15, !id !237, !id.269 !237
  %conv42 = trunc i64 %shr41 to i32, !id !238, !id.270 !238
  store i32 %conv42, i32* @xh, align 4, !id !239, !id.271 !239
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0)), !id !240, !id.272 !240
  store i32 %call, i32* @szl, align 4, !id !241, !id.273 !241
  %13 = load i32, i32* @rlt1, align 4, !id !242, !id.274 !242
  %14 = load i32, i32* @al1, align 4, !id !243, !id.275 !243
  %15 = load i32, i32* @rlt2, align 4, !id !244, !id.276 !244
  %16 = load i32, i32* @al2, align 4, !id !245, !id.277 !245
  %call43 = call i32 @filtep(i32 %13, i32 %14, i32 %15, i32 %16), !id !246, !id.278 !246
  store i32 %call43, i32* @spl, align 4, !id !247, !id.279 !247
  %17 = load i32, i32* @szl, align 4, !id !248, !id.280 !248
  %18 = load i32, i32* @spl, align 4, !id !249, !id.281 !249
  %add44 = add nsw i32 %17, %18, !id !250, !id.282 !250
  store i32 %add44, i32* @sl, align 4, !id !251, !id.283 !251
  %19 = load i32, i32* @xl, align 4, !id !252, !id.284 !252
  %20 = load i32, i32* @sl, align 4, !id !253, !id.285 !253
  %sub45 = sub nsw i32 %19, %20, !id !254, !id.286 !254
  store i32 %sub45, i32* @el, align 4, !id !255, !id.287 !255
  %21 = load i32, i32* @el, align 4, !id !256, !id.288 !256
  %22 = load i32, i32* @detl, align 4, !id !257, !id.289 !257
  %call46 = call i32 @quantl(i32 %21, i32 %22), !id !258, !id.290 !258
  store i32 %call46, i32* @il, align 4, !id !259, !id.291 !259
  %23 = load i32, i32* @detl, align 4, !id !260, !id.292 !260
  %conv47 = sext i32 %23 to i64, !id !261, !id.293 !261
  %24 = load i32, i32* @il, align 4, !id !262, !id.294 !262
  %shr48 = ashr i32 %24, 2, !id !263, !id.295 !263
  %idxprom = sext i32 %shr48 to i64, !id !264, !id.296 !264
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i64 0, i64 %idxprom, !id !265, !id.297 !265
  %25 = load i32, i32* %arrayidx, align 4, !id !266, !id.298 !266
  %conv49 = sext i32 %25 to i64, !id !267, !id.299 !267
  %mul50 = mul nsw i64 %conv47, %conv49, !id !268, !id.300 !268
  %shr51 = ashr i64 %mul50, 15, !id !269, !id.301 !269
  %conv52 = trunc i64 %shr51 to i32, !id !270, !id.302 !270
  store i32 %conv52, i32* @dlt, align 4, !id !271, !id.303 !271
  %26 = load i32, i32* @il, align 4, !id !272, !id.304 !272
  %27 = load i32, i32* @nbl, align 4, !id !273, !id.305 !273
  %call53 = call i32 @logscl(i32 %26, i32 %27), !id !274, !id.306 !274
  store i32 %call53, i32* @nbl, align 4, !id !275, !id.307 !275
  %28 = load i32, i32* @nbl, align 4, !id !276, !id.308 !276
  %call54 = call i32 @scalel(i32 %28, i32 8), !id !277, !id.309 !277
  store i32 %call54, i32* @detl, align 4, !id !278, !id.310 !278
  %29 = load i32, i32* @dlt, align 4, !id !279, !id.311 !279
  %30 = load i32, i32* @szl, align 4, !id !280, !id.312 !280
  %add55 = add nsw i32 %29, %30, !id !281, !id.313 !281
  store i32 %add55, i32* @plt, align 4, !id !282, !id.314 !282
  %31 = load i32, i32* @dlt, align 4, !id !283, !id.315 !283
  call void @upzero(i32 %31, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0)), !id !284, !id.316 !284
  %32 = load i32, i32* @al1, align 4, !id !285, !id.317 !285
  %33 = load i32, i32* @al2, align 4, !id !286, !id.318 !286
  %34 = load i32, i32* @plt, align 4, !id !287, !id.319 !287
  %35 = load i32, i32* @plt1, align 4, !id !288, !id.320 !288
  %36 = load i32, i32* @plt2, align 4, !id !289, !id.321 !289
  %call56 = call i32 @uppol2(i32 %32, i32 %33, i32 %34, i32 %35, i32 %36), !id !290, !id.322 !290
  store i32 %call56, i32* @al2, align 4, !id !291, !id.323 !291
  %37 = load i32, i32* @al1, align 4, !id !292, !id.324 !292
  %38 = load i32, i32* @al2, align 4, !id !293, !id.325 !293
  %39 = load i32, i32* @plt, align 4, !id !294, !id.326 !294
  %40 = load i32, i32* @plt1, align 4, !id !295, !id.327 !295
  %call57 = call i32 @uppol1(i32 %37, i32 %38, i32 %39, i32 %40), !id !296, !id.328 !296
  store i32 %call57, i32* @al1, align 4, !id !297, !id.329 !297
  %41 = load i32, i32* @sl, align 4, !id !298, !id.330 !298
  %42 = load i32, i32* @dlt, align 4, !id !299, !id.331 !299
  %add58 = add nsw i32 %41, %42, !id !300, !id.332 !300
  store i32 %add58, i32* @rlt, align 4, !id !301, !id.333 !301
  %43 = load i32, i32* @rlt1, align 4, !id !302, !id.334 !302
  store i32 %43, i32* @rlt2, align 4, !id !303, !id.335 !303
  %44 = load i32, i32* @rlt, align 4, !id !304, !id.336 !304
  store i32 %44, i32* @rlt1, align 4, !id !305, !id.337 !305
  %45 = load i32, i32* @plt1, align 4, !id !306, !id.338 !306
  store i32 %45, i32* @plt2, align 4, !id !307, !id.339 !307
  %46 = load i32, i32* @plt, align 4, !id !308, !id.340 !308
  store i32 %46, i32* @plt1, align 4, !id !309, !id.341 !309
  %call59 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0)), !id !310, !id.342 !310
  store i32 %call59, i32* @szh, align 4, !id !311, !id.343 !311
  %47 = load i32, i32* @rh1, align 4, !id !312, !id.344 !312
  %48 = load i32, i32* @ah1, align 4, !id !313, !id.345 !313
  %49 = load i32, i32* @rh2, align 4, !id !314, !id.346 !314
  %50 = load i32, i32* @ah2, align 4, !id !315, !id.347 !315
  %call60 = call i32 @filtep(i32 %47, i32 %48, i32 %49, i32 %50), !id !316, !id.348 !316
  store i32 %call60, i32* @sph, align 4, !id !317, !id.349 !317
  %51 = load i32, i32* @sph, align 4, !id !318, !id.350 !318
  %52 = load i32, i32* @szh, align 4, !id !319, !id.351 !319
  %add61 = add nsw i32 %51, %52, !id !320, !id.352 !320
  store i32 %add61, i32* @sh, align 4, !id !321, !id.353 !321
  %53 = load i32, i32* @xh, align 4, !id !322, !id.354 !322
  %54 = load i32, i32* @sh, align 4, !id !323, !id.355 !323
  %sub62 = sub nsw i32 %53, %54, !id !324, !id.356 !324
  store i32 %sub62, i32* @eh, align 4, !id !325, !id.357 !325
  %55 = load i32, i32* @eh, align 4, !id !326, !id.358 !326
  %cmp63 = icmp sge i32 %55, 0, !id !327, !id.359 !327
  br i1 %cmp63, label %if.then, label %if.else, !id !328, !id.360 !328

if.then:                                          ; preds = %for.end37
  store i32 3, i32* @ih, align 4, !id !329, !id.361 !329
  br label %if.end, !id !330, !id.362 !330

if.else:                                          ; preds = %for.end37
  store i32 1, i32* @ih, align 4, !id !331, !id.363 !331
  br label %if.end, !id !332, !id.364 !332

if.end:                                           ; preds = %if.else, %if.then
  %56 = load i32, i32* @deth, align 4, !id !333, !id.365 !333
  %conv64 = sext i32 %56 to i64, !id !334, !id.366 !334
  %mul65 = mul nsw i64 564, %conv64, !id !335, !id.367 !335
  %shr66 = ashr i64 %mul65, 12, !id !336, !id.368 !336
  %conv67 = trunc i64 %shr66 to i32, !id !337, !id.369 !337
  %57 = load i32, i32* @eh, align 4, !id !338, !id.371 !338
  %call68 = call i32 @abs(i32 %57) #6, !id !339, !id.372 !339
  %cmp69 = icmp sgt i32 %call68, %conv67, !id !340, !id.373 !340
  br i1 %cmp69, label %if.then70, label %if.end71, !id !341, !id.374 !341

if.then70:                                        ; preds = %if.end
  %58 = load i32, i32* @ih, align 4, !id !342, !id.375 !342
  %dec = add nsw i32 %58, -1, !id !343, !id.376 !343
  store i32 %dec, i32* @ih, align 4, !id !344, !id.377 !344
  br label %if.end71, !id !345, !id.378 !345

if.end71:                                         ; preds = %if.then70, %if.end
  %59 = load i32, i32* @deth, align 4, !id !346, !id.379 !346
  %conv72 = sext i32 %59 to i64, !id !347, !id.380 !347
  %60 = load i32, i32* @ih, align 4, !id !348, !id.381 !348
  %idxprom73 = sext i32 %60 to i64, !id !349, !id.382 !349
  %arrayidx74 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i64 0, i64 %idxprom73, !id !350, !id.383 !350
  %61 = load i32, i32* %arrayidx74, align 4, !id !351, !id.384 !351
  %conv75 = sext i32 %61 to i64, !id !352, !id.385 !352
  %mul76 = mul nsw i64 %conv72, %conv75, !id !353, !id.386 !353
  %shr77 = ashr i64 %mul76, 15, !id !354, !id.387 !354
  %conv78 = trunc i64 %shr77 to i32, !id !355, !id.388 !355
  store i32 %conv78, i32* @dh, align 4, !id !356, !id.389 !356
  %62 = load i32, i32* @ih, align 4, !id !357, !id.390 !357
  %63 = load i32, i32* @nbh, align 4, !id !358, !id.391 !358
  %call79 = call i32 @logsch(i32 %62, i32 %63), !id !359, !id.392 !359
  store i32 %call79, i32* @nbh, align 4, !id !360, !id.393 !360
  %64 = load i32, i32* @nbh, align 4, !id !361, !id.394 !361
  %call80 = call i32 @scalel(i32 %64, i32 10), !id !362, !id.395 !362
  store i32 %call80, i32* @deth, align 4, !id !363, !id.396 !363
  %65 = load i32, i32* @dh, align 4, !id !364, !id.397 !364
  %66 = load i32, i32* @szh, align 4, !id !365, !id.398 !365
  %add81 = add nsw i32 %65, %66, !id !366, !id.399 !366
  store i32 %add81, i32* @ph, align 4, !id !367, !id.400 !367
  %67 = load i32, i32* @dh, align 4, !id !368, !id.401 !368
  call void @upzero(i32 %67, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0)), !id !369, !id.402 !369
  %68 = load i32, i32* @ah1, align 4, !id !370, !id.403 !370
  %69 = load i32, i32* @ah2, align 4, !id !371, !id.404 !371
  %70 = load i32, i32* @ph, align 4, !id !372, !id.405 !372
  %71 = load i32, i32* @ph1, align 4, !id !373, !id.406 !373
  %72 = load i32, i32* @ph2, align 4, !id !374, !id.407 !374
  %call82 = call i32 @uppol2(i32 %68, i32 %69, i32 %70, i32 %71, i32 %72), !id !375, !id.408 !375
  store i32 %call82, i32* @ah2, align 4, !id !376, !id.409 !376
  %73 = load i32, i32* @ah1, align 4, !id !377, !id.410 !377
  %74 = load i32, i32* @ah2, align 4, !id !378, !id.411 !378
  %75 = load i32, i32* @ph, align 4, !id !379, !id.412 !379
  %76 = load i32, i32* @ph1, align 4, !id !380, !id.413 !380
  %call83 = call i32 @uppol1(i32 %73, i32 %74, i32 %75, i32 %76), !id !381, !id.414 !381
  store i32 %call83, i32* @ah1, align 4, !id !382, !id.415 !382
  %77 = load i32, i32* @sh, align 4, !id !383, !id.416 !383
  %78 = load i32, i32* @dh, align 4, !id !384, !id.417 !384
  %add84 = add nsw i32 %77, %78, !id !385, !id.418 !385
  store i32 %add84, i32* @yh, align 4, !id !386, !id.419 !386
  %79 = load i32, i32* @rh1, align 4, !id !387, !id.420 !387
  store i32 %79, i32* @rh2, align 4, !id !388, !id.421 !388
  %80 = load i32, i32* @yh, align 4, !id !389, !id.422 !389
  store i32 %80, i32* @rh1, align 4, !id !390, !id.423 !390
  %81 = load i32, i32* @ph1, align 4, !id !391, !id.424 !391
  store i32 %81, i32* @ph2, align 4, !id !392, !id.425 !392
  %82 = load i32, i32* @ph, align 4, !id !393, !id.426 !393
  store i32 %82, i32* @ph1, align 4, !id !394, !id.427 !394
  %83 = load i32, i32* @il, align 4, !id !395, !id.428 !395
  %84 = load i32, i32* @ih, align 4, !id !396, !id.429 !396
  %shl = shl i32 %84, 6, !id !397, !id.430 !397
  %or = or i32 %83, %shl, !id !398, !id.431 !398
  ret i32 %or, !id !399, !id.432 !399
}

; Function Attrs: noinline nounwind
define void @decode(i32 %input) #3 !fpga.function.pragma !98 !id !11 {
entry:
  %and = and i32 %input, 63, !id !400, !id.434 !400
  store i32 %and, i32* @ilr, align 4, !id !401, !id.435 !401
  %shr = ashr i32 %input, 6, !id !402, !id.436 !402
  store i32 %shr, i32* @ih, align 4, !id !403, !id.437 !403
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0)), !id !404, !id.438 !404
  store i32 %call, i32* @dec_szl, align 4, !id !405, !id.439 !405
  %0 = load i32, i32* @dec_rlt1, align 4, !id !406, !id.440 !406
  %1 = load i32, i32* @dec_al1, align 4, !id !407, !id.441 !407
  %2 = load i32, i32* @dec_rlt2, align 4, !id !408, !id.442 !408
  %3 = load i32, i32* @dec_al2, align 4, !id !409, !id.443 !409
  %call1 = call i32 @filtep(i32 %0, i32 %1, i32 %2, i32 %3), !id !410, !id.444 !410
  store i32 %call1, i32* @dec_spl, align 4, !id !411, !id.445 !411
  %4 = load i32, i32* @dec_spl, align 4, !id !412, !id.446 !412
  %5 = load i32, i32* @dec_szl, align 4, !id !413, !id.447 !413
  %add = add nsw i32 %4, %5, !id !414, !id.448 !414
  store i32 %add, i32* @dec_sl, align 4, !id !415, !id.449 !415
  %6 = load i32, i32* @dec_detl, align 4, !id !416, !id.450 !416
  %conv = sext i32 %6 to i64, !id !417, !id.451 !417
  %7 = load i32, i32* @ilr, align 4, !id !418, !id.452 !418
  %shr2 = ashr i32 %7, 2, !id !419, !id.453 !419
  %idxprom = sext i32 %shr2 to i64, !id !420, !id.454 !420
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i64 0, i64 %idxprom, !id !421, !id.455 !421
  %8 = load i32, i32* %arrayidx, align 4, !id !422, !id.456 !422
  %conv3 = sext i32 %8 to i64, !id !423, !id.457 !423
  %mul = mul nsw i64 %conv, %conv3, !id !424, !id.458 !424
  %shr4 = ashr i64 %mul, 15, !id !425, !id.459 !425
  %conv5 = trunc i64 %shr4 to i32, !id !426, !id.460 !426
  store i32 %conv5, i32* @dec_dlt, align 4, !id !427, !id.461 !427
  %9 = load i32, i32* @dec_detl, align 4, !id !428, !id.462 !428
  %conv6 = sext i32 %9 to i64, !id !429, !id.463 !429
  %10 = load i32, i32* @il, align 4, !id !430, !id.464 !430
  %idxprom7 = sext i32 %10 to i64, !id !431, !id.465 !431
  %arrayidx8 = getelementptr inbounds [64 x i32], [64 x i32]* @qq6_code6_table, i64 0, i64 %idxprom7, !id !432, !id.466 !432
  %11 = load i32, i32* %arrayidx8, align 4, !id !433, !id.467 !433
  %conv9 = sext i32 %11 to i64, !id !434, !id.468 !434
  %mul10 = mul nsw i64 %conv6, %conv9, !id !435, !id.469 !435
  %shr11 = ashr i64 %mul10, 15, !id !436, !id.470 !436
  %conv12 = trunc i64 %shr11 to i32, !id !437, !id.471 !437
  store i32 %conv12, i32* @dl, align 4, !id !438, !id.472 !438
  %12 = load i32, i32* @dl, align 4, !id !439, !id.473 !439
  %13 = load i32, i32* @dec_sl, align 4, !id !440, !id.474 !440
  %add13 = add nsw i32 %12, %13, !id !441, !id.475 !441
  store i32 %add13, i32* @rl, align 4, !id !442, !id.476 !442
  %14 = load i32, i32* @ilr, align 4, !id !443, !id.477 !443
  %15 = load i32, i32* @dec_nbl, align 4, !id !444, !id.478 !444
  %call14 = call i32 @logscl(i32 %14, i32 %15), !id !445, !id.479 !445
  store i32 %call14, i32* @dec_nbl, align 4, !id !446, !id.480 !446
  %16 = load i32, i32* @dec_nbl, align 4, !id !447, !id.481 !447
  %call15 = call i32 @scalel(i32 %16, i32 8), !id !448, !id.482 !448
  store i32 %call15, i32* @dec_detl, align 4, !id !449, !id.483 !449
  %17 = load i32, i32* @dec_dlt, align 4, !id !450, !id.484 !450
  %18 = load i32, i32* @dec_szl, align 4, !id !451, !id.485 !451
  %add16 = add nsw i32 %17, %18, !id !452, !id.486 !452
  store i32 %add16, i32* @dec_plt, align 4, !id !453, !id.487 !453
  %19 = load i32, i32* @dec_dlt, align 4, !id !454, !id.488 !454
  call void @upzero(i32 %19, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0)), !id !455, !id.489 !455
  %20 = load i32, i32* @dec_al1, align 4, !id !456, !id.490 !456
  %21 = load i32, i32* @dec_al2, align 4, !id !457, !id.491 !457
  %22 = load i32, i32* @dec_plt, align 4, !id !458, !id.492 !458
  %23 = load i32, i32* @dec_plt1, align 4, !id !459, !id.493 !459
  %24 = load i32, i32* @dec_plt2, align 4, !id !460, !id.494 !460
  %call17 = call i32 @uppol2(i32 %20, i32 %21, i32 %22, i32 %23, i32 %24), !id !461, !id.495 !461
  store i32 %call17, i32* @dec_al2, align 4, !id !462, !id.496 !462
  %25 = load i32, i32* @dec_al1, align 4, !id !463, !id.497 !463
  %26 = load i32, i32* @dec_al2, align 4, !id !464, !id.498 !464
  %27 = load i32, i32* @dec_plt, align 4, !id !465, !id.499 !465
  %28 = load i32, i32* @dec_plt1, align 4, !id !466, !id.500 !466
  %call18 = call i32 @uppol1(i32 %25, i32 %26, i32 %27, i32 %28), !id !467, !id.501 !467
  store i32 %call18, i32* @dec_al1, align 4, !id !468, !id.502 !468
  %29 = load i32, i32* @dec_sl, align 4, !id !469, !id.503 !469
  %30 = load i32, i32* @dec_dlt, align 4, !id !470, !id.504 !470
  %add19 = add nsw i32 %29, %30, !id !471, !id.505 !471
  store i32 %add19, i32* @dec_rlt, align 4, !id !472, !id.506 !472
  %31 = load i32, i32* @dec_rlt1, align 4, !id !473, !id.507 !473
  store i32 %31, i32* @dec_rlt2, align 4, !id !474, !id.508 !474
  %32 = load i32, i32* @dec_rlt, align 4, !id !475, !id.509 !475
  store i32 %32, i32* @dec_rlt1, align 4, !id !476, !id.510 !476
  %33 = load i32, i32* @dec_plt1, align 4, !id !477, !id.511 !477
  store i32 %33, i32* @dec_plt2, align 4, !id !478, !id.512 !478
  %34 = load i32, i32* @dec_plt, align 4, !id !479, !id.513 !479
  store i32 %34, i32* @dec_plt1, align 4, !id !480, !id.514 !480
  %call20 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0)), !id !481, !id.515 !481
  store i32 %call20, i32* @dec_szh, align 4, !id !482, !id.516 !482
  %35 = load i32, i32* @dec_rh1, align 4, !id !483, !id.517 !483
  %36 = load i32, i32* @dec_ah1, align 4, !id !484, !id.518 !484
  %37 = load i32, i32* @dec_rh2, align 4, !id !485, !id.519 !485
  %38 = load i32, i32* @dec_ah2, align 4, !id !486, !id.520 !486
  %call21 = call i32 @filtep(i32 %35, i32 %36, i32 %37, i32 %38), !id !487, !id.521 !487
  store i32 %call21, i32* @dec_sph, align 4, !id !488, !id.522 !488
  %39 = load i32, i32* @dec_sph, align 4, !id !489, !id.523 !489
  %40 = load i32, i32* @dec_szh, align 4, !id !490, !id.524 !490
  %add22 = add nsw i32 %39, %40, !id !491, !id.525 !491
  store i32 %add22, i32* @dec_sh, align 4, !id !492, !id.526 !492
  %41 = load i32, i32* @dec_deth, align 4, !id !493, !id.527 !493
  %conv23 = sext i32 %41 to i64, !id !494, !id.528 !494
  %42 = load i32, i32* @ih, align 4, !id !495, !id.529 !495
  %idxprom24 = sext i32 %42 to i64, !id !496, !id.530 !496
  %arrayidx25 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i64 0, i64 %idxprom24, !id !497, !id.531 !497
  %43 = load i32, i32* %arrayidx25, align 4, !id !498, !id.532 !498
  %conv26 = sext i32 %43 to i64, !id !499, !id.533 !499
  %mul27 = mul nsw i64 %conv23, %conv26, !id !500, !id.534 !500
  %shr28 = ashr i64 %mul27, 15, !id !501, !id.535 !501
  %conv29 = trunc i64 %shr28 to i32, !id !502, !id.536 !502
  store i32 %conv29, i32* @dec_dh, align 4, !id !503, !id.537 !503
  %44 = load i32, i32* @ih, align 4, !id !504, !id.538 !504
  %45 = load i32, i32* @dec_nbh, align 4, !id !505, !id.539 !505
  %call30 = call i32 @logsch(i32 %44, i32 %45), !id !506, !id.540 !506
  store i32 %call30, i32* @dec_nbh, align 4, !id !507, !id.541 !507
  %46 = load i32, i32* @dec_nbh, align 4, !id !508, !id.542 !508
  %call31 = call i32 @scalel(i32 %46, i32 10), !id !509, !id.543 !509
  store i32 %call31, i32* @dec_deth, align 4, !id !510, !id.544 !510
  %47 = load i32, i32* @dec_dh, align 4, !id !511, !id.545 !511
  %48 = load i32, i32* @dec_szh, align 4, !id !512, !id.546 !512
  %add32 = add nsw i32 %47, %48, !id !513, !id.547 !513
  store i32 %add32, i32* @dec_ph, align 4, !id !514, !id.548 !514
  %49 = load i32, i32* @dec_dh, align 4, !id !515, !id.549 !515
  call void @upzero(i32 %49, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0)), !id !516, !id.550 !516
  %50 = load i32, i32* @dec_ah1, align 4, !id !517, !id.551 !517
  %51 = load i32, i32* @dec_ah2, align 4, !id !518, !id.552 !518
  %52 = load i32, i32* @dec_ph, align 4, !id !519, !id.553 !519
  %53 = load i32, i32* @dec_ph1, align 4, !id !520, !id.554 !520
  %54 = load i32, i32* @dec_ph2, align 4, !id !521, !id.555 !521
  %call33 = call i32 @uppol2(i32 %50, i32 %51, i32 %52, i32 %53, i32 %54), !id !522, !id.556 !522
  store i32 %call33, i32* @dec_ah2, align 4, !id !523, !id.557 !523
  %55 = load i32, i32* @dec_ah1, align 4, !id !524, !id.558 !524
  %56 = load i32, i32* @dec_ah2, align 4, !id !525, !id.559 !525
  %57 = load i32, i32* @dec_ph, align 4, !id !526, !id.560 !526
  %58 = load i32, i32* @dec_ph1, align 4, !id !527, !id.561 !527
  %call34 = call i32 @uppol1(i32 %55, i32 %56, i32 %57, i32 %58), !id !528, !id.562 !528
  store i32 %call34, i32* @dec_ah1, align 4, !id !529, !id.563 !529
  %59 = load i32, i32* @dec_sh, align 4, !id !530, !id.564 !530
  %60 = load i32, i32* @dec_dh, align 4, !id !531, !id.565 !531
  %add35 = add nsw i32 %59, %60, !id !532, !id.566 !532
  store i32 %add35, i32* @rh, align 4, !id !533, !id.567 !533
  %61 = load i32, i32* @dec_rh1, align 4, !id !534, !id.568 !534
  store i32 %61, i32* @dec_rh2, align 4, !id !535, !id.569 !535
  %62 = load i32, i32* @rh, align 4, !id !536, !id.570 !536
  store i32 %62, i32* @dec_rh1, align 4, !id !537, !id.571 !537
  %63 = load i32, i32* @dec_ph1, align 4, !id !538, !id.572 !538
  store i32 %63, i32* @dec_ph2, align 4, !id !539, !id.573 !539
  %64 = load i32, i32* @dec_ph, align 4, !id !540, !id.574 !540
  store i32 %64, i32* @dec_ph1, align 4, !id !541, !id.575 !541
  %65 = load i32, i32* @rl, align 4, !id !542, !id.576 !542
  %66 = load i32, i32* @rh, align 4, !id !543, !id.577 !543
  %sub = sub nsw i32 %65, %66, !id !544, !id.578 !544
  store i32 %sub, i32* @xd, align 4, !id !545, !id.579 !545
  %67 = load i32, i32* @rl, align 4, !id !546, !id.580 !546
  %68 = load i32, i32* @rh, align 4, !id !547, !id.581 !547
  %add36 = add nsw i32 %67, %68, !id !548, !id.582 !548
  store i32 %add36, i32* @xs, align 4, !id !549, !id.583 !549
  %69 = load i32, i32* @xd, align 4, !id !550, !id.587 !550
  %conv37 = sext i32 %69 to i64, !id !551, !id.588 !551
  %incdec.ptr = getelementptr inbounds i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32 1, !id !552, !id.589 !552
  %70 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), align 4, !id !553, !id.591 !553
  %conv38 = sext i32 %70 to i64, !id !554, !id.592 !554
  %mul39 = mul nsw i64 %conv37, %conv38, !id !555, !id.593 !555
  %71 = load i32, i32* @xs, align 4, !id !556, !id.595 !556
  %conv40 = sext i32 %71 to i64, !id !557, !id.596 !557
  %incdec.ptr41 = getelementptr inbounds i32, i32* %incdec.ptr, i32 1, !id !558, !id.597 !558
  %72 = load i32, i32* %incdec.ptr, align 4, !id !559, !id.599 !559
  %conv42 = sext i32 %72 to i64, !id !560, !id.600 !560
  %mul43 = mul nsw i64 %conv40, %conv42, !id !561, !id.601 !561
  br label %decode_label2, !id !562, !id.603 !562

decode_label2:                                    ; preds = %entry
  br label %for.cond, !id !563, !id.605 !563

for.cond:                                         ; preds = %for.inc, %decode_label2
  %ad_ptr.0 = phi i32* [ getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 0), %decode_label2 ], [ %incdec.ptr50, %for.inc ], !id !564, !id.606 !564
  %ac_ptr.0 = phi i32* [ getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 0), %decode_label2 ], [ %incdec.ptr44, %for.inc ], !id !565, !id.607 !565
  %h_ptr.0 = phi i32* [ %incdec.ptr41, %decode_label2 ], [ %incdec.ptr52, %for.inc ], !id !566, !id.608 !566
  %xa2.0 = phi i64 [ %mul43, %decode_label2 ], [ %add55, %for.inc ], !id !567, !id.609 !567
  %xa1.0 = phi i64 [ %mul39, %decode_label2 ], [ %add49, %for.inc ], !id !568, !id.610 !568
  %i.0 = phi i32 [ 0, %decode_label2 ], [ %inc, %for.inc ], !id !569, !id.611 !569
  %exitcond2 = icmp ne i32 %i.0, 10, !id !570, !id.618 !570
  br i1 %exitcond2, label %for.body, label %for.end, !id !571, !id.619 !571

for.body:                                         ; preds = %for.cond
  %incdec.ptr44 = getelementptr inbounds i32, i32* %ac_ptr.0, i32 1, !id !572, !id.620 !572
  %73 = load i32, i32* %ac_ptr.0, align 4, !id !573, !id.622 !573
  %conv45 = sext i32 %73 to i64, !id !574, !id.623 !574
  %incdec.ptr46 = getelementptr inbounds i32, i32* %h_ptr.0, i32 1, !id !575, !id.624 !575
  %74 = load i32, i32* %h_ptr.0, align 4, !id !576, !id.626 !576
  %conv47 = sext i32 %74 to i64, !id !577, !id.627 !577
  %mul48 = mul nsw i64 %conv45, %conv47, !id !578, !id.628 !578
  %add49 = add nsw i64 %xa1.0, %mul48, !id !579, !id.629 !579
  %incdec.ptr50 = getelementptr inbounds i32, i32* %ad_ptr.0, i32 1, !id !580, !id.631 !580
  %75 = load i32, i32* %ad_ptr.0, align 4, !id !581, !id.633 !581
  %conv51 = sext i32 %75 to i64, !id !582, !id.634 !582
  %incdec.ptr52 = getelementptr inbounds i32, i32* %incdec.ptr46, i32 1, !id !583, !id.635 !583
  %76 = load i32, i32* %incdec.ptr46, align 4, !id !584, !id.637 !584
  %conv53 = sext i32 %76 to i64, !id !585, !id.638 !585
  %mul54 = mul nsw i64 %conv51, %conv53, !id !586, !id.639 !586
  %add55 = add nsw i64 %xa2.0, %mul54, !id !587, !id.640 !587
  br label %for.inc, !id !588, !id.642 !588

for.inc:                                          ; preds = %for.body
  %inc = add nuw nsw i32 %i.0, 1, !id !589, !id.643 !589
  br label %for.cond, !llvm.loop !590, !id !591, !id.645 !591

for.end:                                          ; preds = %for.cond
  %xa2.0.lcssa = phi i64 [ %xa2.0, %for.cond ], !id !592, !id.646 !592
  %xa1.0.lcssa = phi i64 [ %xa1.0, %for.cond ], !id !593, !id.647 !593
  %77 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i64 0, i64 10), align 4, !id !594, !id.648 !594
  %conv56 = sext i32 %77 to i64, !id !595, !id.649 !595
  %incdec.ptr57 = getelementptr inbounds i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i64 0, i64 22), i32 1, !id !596, !id.650 !596
  %78 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i64 0, i64 22), align 4, !id !597, !id.652 !597
  %conv58 = sext i32 %78 to i64, !id !598, !id.653 !598
  %mul59 = mul nsw i64 %conv56, %conv58, !id !599, !id.654 !599
  %add60 = add nsw i64 %xa1.0.lcssa, %mul59, !id !600, !id.655 !600
  %79 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i64 0, i64 10), align 4, !id !601, !id.657 !601
  %conv61 = sext i32 %79 to i64, !id !602, !id.658 !602
  %incdec.ptr62 = getelementptr inbounds i32, i32* %incdec.ptr57, i32 1, !id !603, !id.659 !603
  %80 = load i32, i32* %incdec.ptr57, align 4, !id !604, !id.661 !604
  %conv63 = sext i32 %80 to i64, !id !605, !id.662 !605
  %mul64 = mul nsw i64 %conv61, %conv63, !id !606, !id.663 !606
  %add65 = add nsw i64 %xa2.0.lcssa, %mul64, !id !607, !id.664 !607
  %shr66 = ashr i64 %add60, 14, !id !608, !id.666 !608
  %conv67 = trunc i64 %shr66 to i32, !id !609, !id.667 !609
  store i32 %conv67, i32* @xout1, align 4, !id !610, !id.668 !610
  %shr68 = ashr i64 %add65, 14, !id !611, !id.669 !611
  %conv69 = trunc i64 %shr68 to i32, !id !612, !id.670 !612
  store i32 %conv69, i32* @xout2, align 4, !id !613, !id.671 !613
  %add.ptr = getelementptr inbounds i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i64 0, i64 10), i64 -1, !id !614, !id.672 !614
  %add.ptr70 = getelementptr inbounds i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i64 0, i64 10), i64 -1, !id !615, !id.674 !615
  br label %decode_label3, !id !616, !id.676 !616

decode_label3:                                    ; preds = %for.end
  %scevgep = getelementptr i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i64 0, i64 10), i64 -10, !id !617, !id.678 !617
  br label %for.cond71, !id !618, !id.679 !618

for.cond71:                                       ; preds = %for.inc78, %decode_label3
  %ad_ptr.1 = phi i32* [ getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i64 0, i64 10), %decode_label3 ], [ %incdec.ptr77, %for.inc78 ], !id !619, !id.680 !619
  %ac_ptr1.0 = phi i32* [ %add.ptr, %decode_label3 ], [ %incdec.ptr74, %for.inc78 ], !id !620, !id.681 !620
  %ac_ptr.1 = phi i32* [ getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i64 0, i64 10), %decode_label3 ], [ %incdec.ptr75, %for.inc78 ], !id !621, !id.682 !621
  %i.1 = phi i32 [ 0, %decode_label3 ], [ %inc79, %for.inc78 ], !id !622, !id.683 !622
  %ad_ptr1.0 = phi i32* [ %add.ptr70, %decode_label3 ], [ %incdec.ptr76, %for.inc78 ], !id !623, !id.684 !623
  %exitcond = icmp ne i32 %i.1, 10, !id !624, !id.690 !624
  br i1 %exitcond, label %for.body73, label %for.end80, !id !625, !id.691 !625

for.body73:                                       ; preds = %for.cond71
  %incdec.ptr74 = getelementptr inbounds i32, i32* %ac_ptr1.0, i32 -1, !id !626, !id.692 !626
  %81 = load i32, i32* %ac_ptr1.0, align 4, !id !627, !id.694 !627
  %incdec.ptr75 = getelementptr inbounds i32, i32* %ac_ptr.1, i32 -1, !id !628, !id.695 !628
  store i32 %81, i32* %ac_ptr.1, align 4, !id !629, !id.697 !629
  %incdec.ptr76 = getelementptr inbounds i32, i32* %ad_ptr1.0, i32 -1, !id !630, !id.698 !630
  %82 = load i32, i32* %ad_ptr1.0, align 4, !id !631, !id.700 !631
  %incdec.ptr77 = getelementptr inbounds i32, i32* %ad_ptr.1, i32 -1, !id !632, !id.701 !632
  store i32 %82, i32* %ad_ptr.1, align 4, !id !633, !id.703 !633
  br label %for.inc78, !id !634, !id.704 !634

for.inc78:                                        ; preds = %for.body73
  %inc79 = add nuw nsw i32 %i.1, 1, !id !635, !id.705 !635
  br label %for.cond71, !llvm.loop !636, !id !637, !id.707 !637

for.end80:                                        ; preds = %for.cond71
  %scevgep1 = getelementptr i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i64 0, i64 10), i64 -10, !id !638, !id.708 !638
  %83 = load i32, i32* @xd, align 4, !id !639, !id.709 !639
  store i32 %83, i32* %scevgep1, align 4, !id !640, !id.710 !640
  %84 = load i32, i32* @xs, align 4, !id !641, !id.711 !641
  store i32 %84, i32* %scevgep, align 4, !id !642, !id.712 !642
  ret void, !id !643, !id.713 !643
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: noinline nounwind
define i32 @filtez(i32* %bpl, i32* %dlt) #3 !fpga.function.pragma !98 !id !14 {
entry:
  %incdec.ptr = getelementptr inbounds i32, i32* %bpl, i32 1, !id !644, !id.716 !644
  %0 = load i32, i32* %bpl, align 4, !id !645, !id.718 !645
  %conv = sext i32 %0 to i64, !id !646, !id.719 !646
  %incdec.ptr1 = getelementptr inbounds i32, i32* %dlt, i32 1, !id !647, !id.720 !647
  %1 = load i32, i32* %dlt, align 4, !id !648, !id.722 !648
  %conv2 = sext i32 %1 to i64, !id !649, !id.723 !649
  %mul = mul nsw i64 %conv, %conv2, !id !650, !id.724 !650
  br label %filtez_label8, !id !651, !id.726 !651

filtez_label8:                                    ; preds = %entry
  br label %for.cond, !id !652, !id.728 !652

for.cond:                                         ; preds = %for.inc, %filtez_label8
  %zl.0 = phi i64 [ %mul, %filtez_label8 ], [ %add, %for.inc ], !id !653, !id.729 !653
  %i.0 = phi i32 [ 1, %filtez_label8 ], [ %inc, %for.inc ], !id !654, !id.730 !654
  %dlt.addr.0 = phi i32* [ %incdec.ptr1, %filtez_label8 ], [ %incdec.ptr5, %for.inc ], !id !655, !id.731 !655
  %bpl.addr.0 = phi i32* [ %incdec.ptr, %filtez_label8 ], [ %incdec.ptr3, %for.inc ], !id !656, !id.732 !656
  %exitcond = icmp ne i32 %i.0, 6, !id !657, !id.737 !657
  br i1 %exitcond, label %for.body, label %for.end, !id !658, !id.738 !658

for.body:                                         ; preds = %for.cond
  %incdec.ptr3 = getelementptr inbounds i32, i32* %bpl.addr.0, i32 1, !id !659, !id.739 !659
  %2 = load i32, i32* %bpl.addr.0, align 4, !id !660, !id.741 !660
  %conv4 = sext i32 %2 to i64, !id !661, !id.742 !661
  %incdec.ptr5 = getelementptr inbounds i32, i32* %dlt.addr.0, i32 1, !id !662, !id.743 !662
  %3 = load i32, i32* %dlt.addr.0, align 4, !id !663, !id.745 !663
  %conv6 = sext i32 %3 to i64, !id !664, !id.746 !664
  %mul7 = mul nsw i64 %conv4, %conv6, !id !665, !id.747 !665
  %add = add nsw i64 %zl.0, %mul7, !id !666, !id.748 !666
  br label %for.inc, !id !667, !id.750 !667

for.inc:                                          ; preds = %for.body
  %inc = add nuw nsw i32 %i.0, 1, !id !668, !id.751 !668
  br label %for.cond, !llvm.loop !669, !id !670, !id.753 !670

for.end:                                          ; preds = %for.cond
  %zl.0.lcssa = phi i64 [ %zl.0, %for.cond ], !id !671, !id.754 !671
  %shr = ashr i64 %zl.0.lcssa, 14, !id !672, !id.755 !672
  %conv8 = trunc i64 %shr to i32, !id !673, !id.756 !673
  ret i32 %conv8, !id !674, !id.757 !674
}

; Function Attrs: nounwind
define i32 @filtep(i32 %rlt1, i32 %al1, i32 %rlt2, i32 %al2) #4 !id !16 {
entry:
  %mul = mul nsw i32 2, %rlt1, !id !675, !id.762 !675
  %conv = sext i32 %mul to i64, !id !676, !id.763 !676
  %conv1 = sext i32 %al1 to i64, !id !677, !id.765 !677
  %mul2 = mul nsw i64 %conv1, %conv, !id !678, !id.766 !678
  %mul3 = mul nsw i32 2, %rlt2, !id !679, !id.768 !679
  %conv4 = sext i32 %mul3 to i64, !id !680, !id.769 !680
  %conv5 = sext i32 %al2 to i64, !id !681, !id.771 !681
  %mul6 = mul nsw i64 %conv5, %conv4, !id !682, !id.772 !682
  %add = add nsw i64 %mul2, %mul6, !id !683, !id.773 !683
  %shr = ashr i64 %add, 15, !id !684, !id.775 !684
  %conv7 = trunc i64 %shr to i32, !id !685, !id.776 !685
  ret i32 %conv7, !id !686, !id.777 !686
}

; Function Attrs: nounwind
define i32 @logscl(i32 %il, i32 %nbl) #4 !id !17 {
entry:
  %conv = sext i32 %nbl to i64, !id !687, !id.780 !687
  %mul = mul nsw i64 %conv, 127, !id !688, !id.781 !688
  %shr = ashr i64 %mul, 7, !id !689, !id.782 !689
  %conv1 = trunc i64 %shr to i32, !id !690, !id.784 !690
  %shr2 = ashr i32 %il, 2, !id !691, !id.785 !691
  %idxprom = sext i32 %shr2 to i64, !id !692, !id.786 !692
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @wl_code_table, i64 0, i64 %idxprom, !id !693, !id.787 !693
  %0 = load i32, i32* %arrayidx, align 4, !id !694, !id.788 !694
  %add = add nsw i32 %conv1, %0, !id !695, !id.789 !695
  %cmp = icmp slt i32 %add, 0, !id !696, !id.791 !696
  br i1 %cmp, label %if.then, label %if.end, !id !697, !id.792 !697

if.then:                                          ; preds = %entry
  br label %if.end, !id !698, !id.794 !698

if.end:                                           ; preds = %if.then, %entry
  %nbl.addr.0 = phi i32 [ 0, %if.then ], [ %add, %entry ], !id !699, !id.795 !699
  %cmp3 = icmp sgt i32 %nbl.addr.0, 18432, !id !700, !id.797 !700
  br i1 %cmp3, label %if.then4, label %if.end5, !id !701, !id.798 !701

if.then4:                                         ; preds = %if.end
  br label %if.end5, !id !702, !id.800 !702

if.end5:                                          ; preds = %if.then4, %if.end
  %nbl.addr.1 = phi i32 [ 18432, %if.then4 ], [ %nbl.addr.0, %if.end ], !id !703, !id.801 !703
  ret i32 %nbl.addr.1, !id !704, !id.803 !704
}

; Function Attrs: nounwind
define i32 @scalel(i32 %nbl, i32 %shift_constant) #4 !id !18 {
entry:
  %shr = ashr i32 %nbl, 6, !id !705, !id.806 !705
  %and = and i32 %shr, 31, !id !706, !id.807 !706
  %shr1 = ashr i32 %nbl, 11, !id !707, !id.809 !707
  %idxprom = sext i32 %and to i64, !id !708, !id.811 !708
  %arrayidx = getelementptr inbounds [32 x i32], [32 x i32]* @ilb_table, i64 0, i64 %idxprom, !id !709, !id.812 !709
  %0 = load i32, i32* %arrayidx, align 4, !id !710, !id.813 !710
  %add = add nsw i32 %shift_constant, 1, !id !711, !id.814 !711
  %sub = sub nsw i32 %add, %shr1, !id !712, !id.815 !712
  %shr2 = ashr i32 %0, %sub, !id !713, !id.816 !713
  %shl = shl i32 %shr2, 3, !id !714, !id.818 !714
  ret i32 %shl, !id !715, !id.819 !715
}

; Function Attrs: noinline nounwind
define void @upzero(i32 %dlt, i32* %dlti, i32* %bli) #3 !fpga.function.pragma !98 !id !19 {
entry:
  %cmp = icmp eq i32 %dlt, 0, !id !716, !id.823 !716
  br i1 %cmp, label %if.then, label %if.else, !id !717, !id.824 !717

if.then:                                          ; preds = %entry
  br label %upzero_label10, !id !718, !id.825 !718

upzero_label10:                                   ; preds = %if.then
  br label %for.cond, !id !719, !id.827 !719

for.cond:                                         ; preds = %for.inc, %upzero_label10
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %upzero_label10 ], !id !720, !id.828 !720
  %exitcond = icmp ne i64 %indvars.iv, 6, !id !721, !id.830 !721
  br i1 %exitcond, label %for.body, label %for.end, !id !722, !id.831 !722

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i32, i32* %bli, i64 %indvars.iv, !id !723, !id.832 !723
  %0 = load i32, i32* %arrayidx, align 4, !id !724, !id.833 !724
  %conv = sext i32 %0 to i64, !id !725, !id.834 !725
  %mul = mul nsw i64 255, %conv, !id !726, !id.835 !726
  %shr = ashr i64 %mul, 8, !id !727, !id.836 !727
  %conv2 = trunc i64 %shr to i32, !id !728, !id.837 !728
  %arrayidx4 = getelementptr inbounds i32, i32* %bli, i64 %indvars.iv, !id !729, !id.838 !729
  store i32 %conv2, i32* %arrayidx4, align 4, !id !730, !id.839 !730
  br label %for.inc, !id !731, !id.840 !731

for.inc:                                          ; preds = %for.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !732, !id.841 !732
  br label %for.cond, !llvm.loop !733, !id !734, !id.843 !734

for.end:                                          ; preds = %for.cond
  br label %if.end27, !id !735, !id.844 !735

if.else:                                          ; preds = %entry
  br label %upzero_label11, !id !736, !id.845 !736

upzero_label11:                                   ; preds = %if.else
  br label %for.cond5, !id !737, !id.847 !737

for.cond5:                                        ; preds = %for.inc24, %upzero_label11
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc24 ], [ 0, %upzero_label11 ], !id !738, !id.848 !738
  %exitcond3 = icmp ne i64 %indvars.iv1, 6, !id !739, !id.850 !739
  br i1 %exitcond3, label %for.body7, label %for.end26, !id !740, !id.851 !740

for.body7:                                        ; preds = %for.cond5
  %conv8 = sext i32 %dlt to i64, !id !741, !id.852 !741
  %arrayidx10 = getelementptr inbounds i32, i32* %dlti, i64 %indvars.iv1, !id !742, !id.853 !742
  %1 = load i32, i32* %arrayidx10, align 4, !id !743, !id.854 !743
  %conv11 = sext i32 %1 to i64, !id !744, !id.855 !744
  %mul12 = mul nsw i64 %conv8, %conv11, !id !745, !id.856 !745
  %cmp13 = icmp sge i64 %mul12, 0, !id !746, !id.857 !746
  br i1 %cmp13, label %if.then14, label %if.else15, !id !747, !id.858 !747

if.then14:                                        ; preds = %for.body7
  br label %if.end, !id !748, !id.860 !748

if.else15:                                        ; preds = %for.body7
  br label %if.end, !id !749, !id.862 !749

if.end:                                           ; preds = %if.else15, %if.then14
  %wd2.0 = phi i32 [ 128, %if.then14 ], [ -128, %if.else15 ], !id !750, !id.863 !750
  %arrayidx17 = getelementptr inbounds i32, i32* %bli, i64 %indvars.iv1, !id !751, !id.865 !751
  %2 = load i32, i32* %arrayidx17, align 4, !id !752, !id.866 !752
  %conv18 = sext i32 %2 to i64, !id !753, !id.867 !753
  %mul19 = mul nsw i64 255, %conv18, !id !754, !id.868 !754
  %shr20 = ashr i64 %mul19, 8, !id !755, !id.869 !755
  %conv21 = trunc i64 %shr20 to i32, !id !756, !id.870 !756
  %add = add nsw i32 %wd2.0, %conv21, !id !757, !id.872 !757
  %arrayidx23 = getelementptr inbounds i32, i32* %bli, i64 %indvars.iv1, !id !758, !id.873 !758
  store i32 %add, i32* %arrayidx23, align 4, !id !759, !id.874 !759
  br label %for.inc24, !id !760, !id.875 !760

for.inc24:                                        ; preds = %if.end
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1, !id !761, !id.876 !761
  br label %for.cond5, !llvm.loop !762, !id !763, !id.878 !763

for.end26:                                        ; preds = %for.cond5
  br label %if.end27, !id !764, !id.879 !764

if.end27:                                         ; preds = %for.end26, %for.end
  %arrayidx28 = getelementptr inbounds i32, i32* %dlti, i64 4, !id !765, !id.880 !765
  %3 = load i32, i32* %arrayidx28, align 4, !id !766, !id.881 !766
  %arrayidx29 = getelementptr inbounds i32, i32* %dlti, i64 5, !id !767, !id.882 !767
  store i32 %3, i32* %arrayidx29, align 4, !id !768, !id.883 !768
  %arrayidx30 = getelementptr inbounds i32, i32* %dlti, i64 3, !id !769, !id.884 !769
  %4 = load i32, i32* %arrayidx30, align 4, !id !770, !id.885 !770
  %arrayidx31 = getelementptr inbounds i32, i32* %dlti, i64 4, !id !771, !id.886 !771
  store i32 %4, i32* %arrayidx31, align 4, !id !772, !id.887 !772
  %arrayidx32 = getelementptr inbounds i32, i32* %dlti, i64 2, !id !773, !id.888 !773
  %5 = load i32, i32* %arrayidx32, align 4, !id !774, !id.889 !774
  %arrayidx33 = getelementptr inbounds i32, i32* %dlti, i64 3, !id !775, !id.890 !775
  store i32 %5, i32* %arrayidx33, align 4, !id !776, !id.891 !776
  %arrayidx34 = getelementptr inbounds i32, i32* %dlti, i64 1, !id !777, !id.892 !777
  %6 = load i32, i32* %arrayidx34, align 4, !id !778, !id.893 !778
  %arrayidx35 = getelementptr inbounds i32, i32* %dlti, i64 2, !id !779, !id.894 !779
  store i32 %6, i32* %arrayidx35, align 4, !id !780, !id.895 !780
  %arrayidx36 = getelementptr inbounds i32, i32* %dlti, i64 0, !id !781, !id.896 !781
  %7 = load i32, i32* %arrayidx36, align 4, !id !782, !id.897 !782
  %arrayidx37 = getelementptr inbounds i32, i32* %dlti, i64 1, !id !783, !id.898 !783
  store i32 %7, i32* %arrayidx37, align 4, !id !784, !id.899 !784
  %arrayidx38 = getelementptr inbounds i32, i32* %dlti, i64 0, !id !785, !id.900 !785
  store i32 %dlt, i32* %arrayidx38, align 4, !id !786, !id.901 !786
  ret void, !id !787, !id.902 !787
}

; Function Attrs: nounwind
define i32 @uppol2(i32 %al1, i32 %al2, i32 %plt, i32 %plt1, i32 %plt2) #4 !id !22 {
entry:
  %conv = sext i32 %al1 to i64, !id !788, !id.908 !788
  %mul = mul nsw i64 4, %conv, !id !789, !id.909 !789
  %conv1 = sext i32 %plt to i64, !id !790, !id.911 !790
  %conv2 = sext i32 %plt1 to i64, !id !791, !id.912 !791
  %mul3 = mul nsw i64 %conv1, %conv2, !id !792, !id.913 !792
  %cmp = icmp sge i64 %mul3, 0, !id !793, !id.914 !793
  br i1 %cmp, label %if.then, label %if.end, !id !794, !id.915 !794

if.then:                                          ; preds = %entry
  %sub = sub nsw i64 0, %mul, !id !795, !id.916 !795
  br label %if.end, !id !796, !id.918 !796

if.end:                                           ; preds = %if.then, %entry
  %wd2.0 = phi i64 [ %sub, %if.then ], [ %mul, %entry ], !id !797, !id.919 !797
  %shr = ashr i64 %wd2.0, 7, !id !798, !id.921 !798
  %conv4 = sext i32 %plt to i64, !id !799, !id.923 !799
  %conv5 = sext i32 %plt2 to i64, !id !800, !id.924 !800
  %mul6 = mul nsw i64 %conv4, %conv5, !id !801, !id.925 !801
  %cmp7 = icmp sge i64 %mul6, 0, !id !802, !id.926 !802
  br i1 %cmp7, label %if.then8, label %if.else, !id !803, !id.927 !803

if.then8:                                         ; preds = %if.end
  %add = add nsw i64 %shr, 128, !id !804, !id.928 !804
  br label %if.end10, !id !805, !id.930 !805

if.else:                                          ; preds = %if.end
  %sub9 = sub nsw i64 %shr, 128, !id !806, !id.931 !806
  br label %if.end10, !id !807, !id.933 !807

if.end10:                                         ; preds = %if.else, %if.then8
  %wd4.0 = phi i64 [ %add, %if.then8 ], [ %sub9, %if.else ], !id !808, !id.934 !808
  %conv11 = sext i32 %al2 to i64, !id !809, !id.936 !809
  %mul12 = mul nsw i64 127, %conv11, !id !810, !id.937 !810
  %shr13 = ashr i64 %mul12, 7, !id !811, !id.938 !811
  %add14 = add nsw i64 %wd4.0, %shr13, !id !812, !id.939 !812
  %conv15 = trunc i64 %add14 to i32, !id !813, !id.940 !813
  %cmp16 = icmp sgt i32 %conv15, 12288, !id !814, !id.942 !814
  br i1 %cmp16, label %if.then17, label %if.end18, !id !815, !id.943 !815

if.then17:                                        ; preds = %if.end10
  br label %if.end18, !id !816, !id.945 !816

if.end18:                                         ; preds = %if.then17, %if.end10
  %apl2.0 = phi i32 [ 12288, %if.then17 ], [ %conv15, %if.end10 ], !id !817, !id.946 !817
  %cmp19 = icmp slt i32 %apl2.0, -12288, !id !818, !id.948 !818
  br i1 %cmp19, label %if.then20, label %if.end21, !id !819, !id.949 !819

if.then20:                                        ; preds = %if.end18
  br label %if.end21, !id !820, !id.951 !820

if.end21:                                         ; preds = %if.then20, %if.end18
  %apl2.1 = phi i32 [ -12288, %if.then20 ], [ %apl2.0, %if.end18 ], !id !821, !id.952 !821
  ret i32 %apl2.1, !id !822, !id.954 !822
}

; Function Attrs: nounwind
define i32 @uppol1(i32 %al1, i32 %apl2, i32 %plt, i32 %plt1) #4 !id !23 {
entry:
  %conv = sext i32 %al1 to i64, !id !823, !id.959 !823
  %mul = mul nsw i64 %conv, 255, !id !824, !id.960 !824
  %shr = ashr i64 %mul, 8, !id !825, !id.961 !825
  %conv1 = sext i32 %plt to i64, !id !826, !id.963 !826
  %conv2 = sext i32 %plt1 to i64, !id !827, !id.964 !827
  %mul3 = mul nsw i64 %conv1, %conv2, !id !828, !id.965 !828
  %cmp = icmp sge i64 %mul3, 0, !id !829, !id.966 !829
  br i1 %cmp, label %if.then, label %if.else, !id !830, !id.967 !830

if.then:                                          ; preds = %entry
  %conv4 = trunc i64 %shr to i32, !id !831, !id.968 !831
  %add = add nsw i32 %conv4, 192, !id !832, !id.969 !832
  br label %if.end, !id !833, !id.971 !833

if.else:                                          ; preds = %entry
  %conv5 = trunc i64 %shr to i32, !id !834, !id.972 !834
  %sub = sub nsw i32 %conv5, 192, !id !835, !id.973 !835
  br label %if.end, !id !836, !id.975 !836

if.end:                                           ; preds = %if.else, %if.then
  %apl1.0 = phi i32 [ %add, %if.then ], [ %sub, %if.else ], !id !837, !id.976 !837
  %sub6 = sub nsw i32 15360, %apl2, !id !838, !id.978 !838
  %cmp7 = icmp sgt i32 %apl1.0, %sub6, !id !839, !id.980 !839
  br i1 %cmp7, label %if.then8, label %if.end9, !id !840, !id.981 !840

if.then8:                                         ; preds = %if.end
  br label %if.end9, !id !841, !id.983 !841

if.end9:                                          ; preds = %if.then8, %if.end
  %apl1.1 = phi i32 [ %sub6, %if.then8 ], [ %apl1.0, %if.end ], !id !842, !id.984 !842
  %sub10 = sub nsw i32 0, %sub6, !id !843, !id.986 !843
  %cmp11 = icmp slt i32 %apl1.1, %sub10, !id !844, !id.987 !844
  br i1 %cmp11, label %if.then12, label %if.end14, !id !845, !id.988 !845

if.then12:                                        ; preds = %if.end9
  %sub13 = sub nsw i32 0, %sub6, !id !846, !id.989 !846
  br label %if.end14, !id !847, !id.991 !847

if.end14:                                         ; preds = %if.then12, %if.end9
  %apl1.2 = phi i32 [ %sub13, %if.then12 ], [ %apl1.1, %if.end9 ], !id !848, !id.992 !848
  ret i32 %apl1.2, !id !849, !id.994 !849
}

; Function Attrs: nounwind
define i32 @logsch(i32 %ih, i32 %nbh) #4 !id !24 {
entry:
  %conv = sext i32 %nbh to i64, !id !850, !id.997 !850
  %mul = mul nsw i64 %conv, 127, !id !851, !id.998 !851
  %shr = ashr i64 %mul, 7, !id !852, !id.999 !852
  %conv1 = trunc i64 %shr to i32, !id !853, !id.1000 !853
  %idxprom = sext i32 %ih to i64, !id !854, !id.1002 !854
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @wh_code_table, i64 0, i64 %idxprom, !id !855, !id.1003 !855
  %0 = load i32, i32* %arrayidx, align 4, !id !856, !id.1004 !856
  %add = add nsw i32 %conv1, %0, !id !857, !id.1005 !857
  %cmp = icmp slt i32 %add, 0, !id !858, !id.1007 !858
  br i1 %cmp, label %if.then, label %if.end, !id !859, !id.1008 !859

if.then:                                          ; preds = %entry
  br label %if.end, !id !860, !id.1010 !860

if.end:                                           ; preds = %if.then, %entry
  %nbh.addr.0 = phi i32 [ 0, %if.then ], [ %add, %entry ], !id !861, !id.1011 !861
  %cmp2 = icmp sgt i32 %nbh.addr.0, 22528, !id !862, !id.1013 !862
  br i1 %cmp2, label %if.then3, label %if.end4, !id !863, !id.1014 !863

if.then3:                                         ; preds = %if.end
  br label %if.end4, !id !864, !id.1016 !864

if.end4:                                          ; preds = %if.then3, %if.end
  %nbh.addr.1 = phi i32 [ 22528, %if.then3 ], [ %nbh.addr.0, %if.end ], !id !865, !id.1017 !865
  ret i32 %nbh.addr.1, !id !866, !id.1019 !866
}

; Function Attrs: noinline nounwind
define i32 @quantl(i32 %el, i32 %detl) #3 !fpga.function.pragma !98 !id !25 {
entry:
  %call = call i32 @abs(i32 %el) #6, !id !867, !id.1022 !867
  %conv = sext i32 %call to i64, !id !868, !id.1023 !868
  br label %quantl_label9, !id !869, !id.1025 !869

quantl_label9:                                    ; preds = %entry
  br label %for.cond, !id !870, !id.1027 !870

for.cond:                                         ; preds = %for.inc, %quantl_label9
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %quantl_label9 ], !id !871, !id.1028 !871
  %cmp = icmp slt i64 %indvars.iv, 30, !id !872, !id.1030 !872
  br i1 %cmp, label %for.body, label %for.end.loopexit, !id !873, !id.1031 !873

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [30 x i32], [30 x i32]* @decis_levl, i64 0, i64 %indvars.iv, !id !874, !id.1032 !874
  %0 = load i32, i32* %arrayidx, align 4, !id !875, !id.1033 !875
  %conv1 = sext i32 %0 to i64, !id !876, !id.1034 !876
  %conv2 = sext i32 %detl to i64, !id !877, !id.1035 !877
  %mul = mul nsw i64 %conv1, %conv2, !id !878, !id.1036 !878
  %shr = ashr i64 %mul, 15, !id !879, !id.1037 !879
  %cmp3 = icmp sle i64 %conv, %shr, !id !880, !id.1039 !880
  br i1 %cmp3, label %if.then, label %if.end, !id !881, !id.1040 !881

if.then:                                          ; preds = %for.body
  %mil.0.lcssa1.wide = phi i64 [ %indvars.iv, %for.body ], !id !882, !id.1041 !882
  %1 = trunc i64 %mil.0.lcssa1.wide to i32, !id !883, !id.1042 !883
  br label %for.end, !id !884, !id.1043 !884

if.end:                                           ; preds = %for.body
  br label %for.inc, !id !885, !id.1044 !885

for.inc:                                          ; preds = %if.end
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !886, !id.1045 !886
  br label %for.cond, !llvm.loop !887, !id !888, !id.1047 !888

for.end.loopexit:                                 ; preds = %for.cond
  %mil.0.lcssa.wide = phi i64 [ %indvars.iv, %for.cond ], !id !889, !id.1048 !889
  %2 = trunc i64 %mil.0.lcssa.wide to i32, !id !890, !id.1049 !890
  br label %for.end, !id !891, !id.1050 !891

for.end:                                          ; preds = %for.end.loopexit, %if.then
  %mil.02 = phi i32 [ %2, %for.end.loopexit ], [ %1, %if.then ], !id !892, !id.1051 !892
  %cmp4 = icmp sge i32 %el, 0, !id !893, !id.1052 !893
  br i1 %cmp4, label %if.then5, label %if.else, !id !894, !id.1053 !894

if.then5:                                         ; preds = %for.end
  %idxprom6 = sext i32 %mil.02 to i64, !id !895, !id.1054 !895
  %arrayidx7 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_pos, i64 0, i64 %idxprom6, !id !896, !id.1055 !896
  %3 = load i32, i32* %arrayidx7, align 4, !id !897, !id.1056 !897
  br label %if.end10, !id !898, !id.1058 !898

if.else:                                          ; preds = %for.end
  %idxprom8 = sext i32 %mil.02 to i64, !id !899, !id.1059 !899
  %arrayidx9 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_neg, i64 0, i64 %idxprom8, !id !900, !id.1060 !900
  %4 = load i32, i32* %arrayidx9, align 4, !id !901, !id.1061 !901
  br label %if.end10, !id !902, !id.1063 !902

if.end10:                                         ; preds = %if.else, %if.then5
  %ril.0 = phi i32 [ %3, %if.then5 ], [ %4, %if.else ], !id !903, !id.1064 !903
  ret i32 %ril.0, !id !904, !id.1066 !904
}

; Function Attrs: nounwind readnone willreturn
define i32 @abs(i32 %n) #5 !id !27 {
entry:
  %cmp = icmp sge i32 %n, 0, !id !905, !id.1068 !905
  br i1 %cmp, label %if.then, label %if.else, !id !906, !id.1069 !906

if.then:                                          ; preds = %entry
  br label %if.end, !id !907, !id.1071 !907

if.else:                                          ; preds = %entry
  %sub = sub nsw i32 0, %n, !id !908, !id.1072 !908
  br label %if.end, !id !909, !id.1074 !909

if.end:                                           ; preds = %if.else, %if.then
  %m.0 = phi i32 [ %n, %if.then ], [ %sub, %if.else ], !id !910, !id.1075 !910
  ret i32 %m.0, !id !911, !id.1077 !911
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.static.pipeline"="0.-1" "fpga.top.func"="adpcm_main" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.static.pipeline"="0.-1" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone willreturn }

!llvm.ident = !{!90}
!llvm.module.flags = !{!91, !92, !93}

!0 = !{i32 1}
!1 = !{i32 2}
!2 = !{i32 3}
!3 = !{i32 4}
!4 = !{i32 5}
!5 = !{i32 6}
!6 = !{i32 7}
!7 = !{i32 8}
!8 = !{i32 9}
!9 = !{i32 10}
!10 = !{i32 11}
!11 = !{i32 12}
!12 = !{i32 13}
!13 = !{i32 14}
!14 = !{i32 15}
!15 = !{i32 16}
!16 = !{i32 17}
!17 = !{i32 18}
!18 = !{i32 19}
!19 = !{i32 20}
!20 = !{i32 21}
!21 = !{i32 22}
!22 = !{i32 23}
!23 = !{i32 24}
!24 = !{i32 25}
!25 = !{i32 26}
!26 = !{i32 27}
!27 = !{i32 28}
!28 = !{i32 29}
!29 = !{i32 30}
!30 = !{i32 31}
!31 = !{i32 32}
!32 = !{i32 33}
!33 = !{i32 34}
!34 = !{i32 35}
!35 = !{i32 36}
!36 = !{i32 37}
!37 = !{i32 38}
!38 = !{i32 39}
!39 = !{i32 40}
!40 = !{i32 41}
!41 = !{i32 42}
!42 = !{i32 43}
!43 = !{i32 44}
!44 = !{i32 45}
!45 = !{i32 46}
!46 = !{i32 47}
!47 = !{i32 48}
!48 = !{i32 49}
!49 = !{i32 50}
!50 = !{i32 51}
!51 = !{i32 52}
!52 = !{i32 53}
!53 = !{i32 54}
!54 = !{i32 55}
!55 = !{i32 56}
!56 = !{i32 57}
!57 = !{i32 58}
!58 = !{i32 59}
!59 = !{i32 60}
!60 = !{i32 61}
!61 = !{i32 62}
!62 = !{i32 63}
!63 = !{i32 64}
!64 = !{i32 65}
!65 = !{i32 66}
!66 = !{i32 67}
!67 = !{i32 68}
!68 = !{i32 69}
!69 = !{i32 70}
!70 = !{i32 71}
!71 = !{i32 72}
!72 = !{i32 73}
!73 = !{i32 74}
!74 = !{i32 75}
!75 = !{i32 76}
!76 = !{i32 77}
!77 = !{i32 78}
!78 = !{i32 79}
!79 = !{i32 80}
!80 = !{i32 81}
!81 = !{i32 82}
!82 = !{i32 83}
!83 = !{i32 84}
!84 = !{i32 85}
!85 = !{i32 86}
!86 = !{i32 87}
!87 = !{i32 88}
!88 = !{i32 89}
!89 = !{i32 90}
!90 = !{!"clang version 7.0.0 "}
!91 = !{i32 2, !"Dwarf Version", i32 4}
!92 = !{i32 2, !"Debug Info Version", i32 3}
!93 = !{i32 1, !"wchar_size", i32 4}
!94 = !{!95}
!95 = !{!"fpga.static.pipeline", !"user"}
!96 = distinct !{!96, i32 3}
!97 = distinct !{!97, i32 2}
!98 = !{!99}
!99 = !{!"fpga.inline", !"user"}
!100 = !{i32 91}
!101 = !{i32 92}
!102 = !{i32 93}
!103 = !{i32 94}
!104 = !{i32 95}
!105 = !{i32 96}
!106 = !{i32 97}
!107 = !{i32 98}
!108 = distinct !{!108, i32 8}
!109 = !{i32 100}
!110 = !{i32 101}
!111 = !{i32 103}
!112 = !{i32 104}
!113 = !{i32 106}
!114 = !{i32 107}
!115 = !{i32 108}
!116 = !{i32 109}
!117 = !{i32 110}
!118 = !{i32 111}
!119 = !{i32 112}
!120 = !{i32 113}
!121 = !{i32 114}
!122 = !{i32 115}
!123 = !{i32 116}
!124 = !{i32 117}
!125 = distinct !{!125, i32 7}
!126 = !{i32 119}
!127 = !{i32 120}
!128 = !{i32 122}
!129 = !{i32 123}
!130 = !{i32 125}
!131 = !{i32 126}
!132 = !{i32 127}
!133 = !{i32 128}
!134 = !{i32 129}
!135 = !{i32 130}
!136 = distinct !{!136, i32 6}
!137 = !{i32 132}
!138 = !{i32 133}
!139 = !{i32 135}
!140 = !{i32 136}
!141 = !{i32 138}
!142 = !{i32 139}
!143 = !{i32 140}
!144 = !{i32 141}
!145 = !{i32 142}
!146 = !{i32 143}
!147 = !{i32 144}
!148 = !{i32 145}
!149 = distinct !{!149, i32 5}
!150 = !{i32 147}
!151 = !{i32 148}
!152 = !{i32 153}
!153 = !{i32 155}
!154 = !{i32 156}
!155 = !{i32 157}
!156 = !{i32 159}
!157 = !{i32 160}
!158 = !{i32 161}
!159 = !{i32 163}
!160 = !{i32 165}
!161 = !{i32 166}
!162 = !{i32 167}
!163 = !{i32 169}
!164 = !{i32 170}
!165 = !{i32 171}
!166 = !{i32 173}
!167 = !{i32 175}
!168 = !{i32 176}
!169 = !{i32 177}
!170 = !{i32 178}
!171 = !{i32 179}
!172 = !{i32 180}
!173 = !{i32 186}
!174 = !{i32 187}
!175 = !{i32 188}
!176 = !{i32 190}
!177 = !{i32 191}
!178 = !{i32 192}
!179 = !{i32 194}
!180 = !{i32 195}
!181 = !{i32 196}
!182 = !{i32 197}
!183 = !{i32 199}
!184 = !{i32 201}
!185 = !{i32 202}
!186 = !{i32 203}
!187 = !{i32 205}
!188 = !{i32 206}
!189 = !{i32 207}
!190 = !{i32 208}
!191 = !{i32 210}
!192 = !{i32 211}
!193 = distinct !{!193, i32 11}
!194 = !{i32 213}
!195 = !{i32 214}
!196 = !{i32 215}
!197 = !{i32 216}
!198 = !{i32 218}
!199 = !{i32 219}
!200 = !{i32 220}
!201 = !{i32 222}
!202 = !{i32 223}
!203 = !{i32 224}
!204 = !{i32 225}
!205 = !{i32 227}
!206 = !{i32 228}
!207 = !{i32 229}
!208 = !{i32 231}
!209 = !{i32 232}
!210 = !{i32 233}
!211 = !{i32 234}
!212 = !{i32 236}
!213 = !{i32 238}
!214 = !{i32 240}
!215 = !{i32 241}
!216 = !{i32 242}
!217 = !{i32 243}
!218 = !{i32 247}
!219 = !{i32 248}
!220 = !{i32 249}
!221 = !{i32 251}
!222 = !{i32 252}
!223 = !{i32 254}
!224 = !{i32 255}
!225 = !{i32 256}
!226 = distinct !{!226, i32 10}
!227 = !{i32 258}
!228 = !{i32 259}
!229 = !{i32 260}
!230 = !{i32 262}
!231 = !{i32 263}
!232 = !{i32 264}
!233 = !{i32 265}
!234 = !{i32 266}
!235 = !{i32 267}
!236 = !{i32 268}
!237 = !{i32 269}
!238 = !{i32 270}
!239 = !{i32 271}
!240 = !{i32 272}
!241 = !{i32 273}
!242 = !{i32 274}
!243 = !{i32 275}
!244 = !{i32 276}
!245 = !{i32 277}
!246 = !{i32 278}
!247 = !{i32 279}
!248 = !{i32 280}
!249 = !{i32 281}
!250 = !{i32 282}
!251 = !{i32 283}
!252 = !{i32 284}
!253 = !{i32 285}
!254 = !{i32 286}
!255 = !{i32 287}
!256 = !{i32 288}
!257 = !{i32 289}
!258 = !{i32 290}
!259 = !{i32 291}
!260 = !{i32 292}
!261 = !{i32 293}
!262 = !{i32 294}
!263 = !{i32 295}
!264 = !{i32 296}
!265 = !{i32 297}
!266 = !{i32 298}
!267 = !{i32 299}
!268 = !{i32 300}
!269 = !{i32 301}
!270 = !{i32 302}
!271 = !{i32 303}
!272 = !{i32 304}
!273 = !{i32 305}
!274 = !{i32 306}
!275 = !{i32 307}
!276 = !{i32 308}
!277 = !{i32 309}
!278 = !{i32 310}
!279 = !{i32 311}
!280 = !{i32 312}
!281 = !{i32 313}
!282 = !{i32 314}
!283 = !{i32 315}
!284 = !{i32 316}
!285 = !{i32 317}
!286 = !{i32 318}
!287 = !{i32 319}
!288 = !{i32 320}
!289 = !{i32 321}
!290 = !{i32 322}
!291 = !{i32 323}
!292 = !{i32 324}
!293 = !{i32 325}
!294 = !{i32 326}
!295 = !{i32 327}
!296 = !{i32 328}
!297 = !{i32 329}
!298 = !{i32 330}
!299 = !{i32 331}
!300 = !{i32 332}
!301 = !{i32 333}
!302 = !{i32 334}
!303 = !{i32 335}
!304 = !{i32 336}
!305 = !{i32 337}
!306 = !{i32 338}
!307 = !{i32 339}
!308 = !{i32 340}
!309 = !{i32 341}
!310 = !{i32 342}
!311 = !{i32 343}
!312 = !{i32 344}
!313 = !{i32 345}
!314 = !{i32 346}
!315 = !{i32 347}
!316 = !{i32 348}
!317 = !{i32 349}
!318 = !{i32 350}
!319 = !{i32 351}
!320 = !{i32 352}
!321 = !{i32 353}
!322 = !{i32 354}
!323 = !{i32 355}
!324 = !{i32 356}
!325 = !{i32 357}
!326 = !{i32 358}
!327 = !{i32 359}
!328 = !{i32 360}
!329 = !{i32 361}
!330 = !{i32 362}
!331 = !{i32 363}
!332 = !{i32 364}
!333 = !{i32 365}
!334 = !{i32 366}
!335 = !{i32 367}
!336 = !{i32 368}
!337 = !{i32 369}
!338 = !{i32 371}
!339 = !{i32 372}
!340 = !{i32 373}
!341 = !{i32 374}
!342 = !{i32 375}
!343 = !{i32 376}
!344 = !{i32 377}
!345 = !{i32 378}
!346 = !{i32 379}
!347 = !{i32 380}
!348 = !{i32 381}
!349 = !{i32 382}
!350 = !{i32 383}
!351 = !{i32 384}
!352 = !{i32 385}
!353 = !{i32 386}
!354 = !{i32 387}
!355 = !{i32 388}
!356 = !{i32 389}
!357 = !{i32 390}
!358 = !{i32 391}
!359 = !{i32 392}
!360 = !{i32 393}
!361 = !{i32 394}
!362 = !{i32 395}
!363 = !{i32 396}
!364 = !{i32 397}
!365 = !{i32 398}
!366 = !{i32 399}
!367 = !{i32 400}
!368 = !{i32 401}
!369 = !{i32 402}
!370 = !{i32 403}
!371 = !{i32 404}
!372 = !{i32 405}
!373 = !{i32 406}
!374 = !{i32 407}
!375 = !{i32 408}
!376 = !{i32 409}
!377 = !{i32 410}
!378 = !{i32 411}
!379 = !{i32 412}
!380 = !{i32 413}
!381 = !{i32 414}
!382 = !{i32 415}
!383 = !{i32 416}
!384 = !{i32 417}
!385 = !{i32 418}
!386 = !{i32 419}
!387 = !{i32 420}
!388 = !{i32 421}
!389 = !{i32 422}
!390 = !{i32 423}
!391 = !{i32 424}
!392 = !{i32 425}
!393 = !{i32 426}
!394 = !{i32 427}
!395 = !{i32 428}
!396 = !{i32 429}
!397 = !{i32 430}
!398 = !{i32 431}
!399 = !{i32 432}
!400 = !{i32 434}
!401 = !{i32 435}
!402 = !{i32 436}
!403 = !{i32 437}
!404 = !{i32 438}
!405 = !{i32 439}
!406 = !{i32 440}
!407 = !{i32 441}
!408 = !{i32 442}
!409 = !{i32 443}
!410 = !{i32 444}
!411 = !{i32 445}
!412 = !{i32 446}
!413 = !{i32 447}
!414 = !{i32 448}
!415 = !{i32 449}
!416 = !{i32 450}
!417 = !{i32 451}
!418 = !{i32 452}
!419 = !{i32 453}
!420 = !{i32 454}
!421 = !{i32 455}
!422 = !{i32 456}
!423 = !{i32 457}
!424 = !{i32 458}
!425 = !{i32 459}
!426 = !{i32 460}
!427 = !{i32 461}
!428 = !{i32 462}
!429 = !{i32 463}
!430 = !{i32 464}
!431 = !{i32 465}
!432 = !{i32 466}
!433 = !{i32 467}
!434 = !{i32 468}
!435 = !{i32 469}
!436 = !{i32 470}
!437 = !{i32 471}
!438 = !{i32 472}
!439 = !{i32 473}
!440 = !{i32 474}
!441 = !{i32 475}
!442 = !{i32 476}
!443 = !{i32 477}
!444 = !{i32 478}
!445 = !{i32 479}
!446 = !{i32 480}
!447 = !{i32 481}
!448 = !{i32 482}
!449 = !{i32 483}
!450 = !{i32 484}
!451 = !{i32 485}
!452 = !{i32 486}
!453 = !{i32 487}
!454 = !{i32 488}
!455 = !{i32 489}
!456 = !{i32 490}
!457 = !{i32 491}
!458 = !{i32 492}
!459 = !{i32 493}
!460 = !{i32 494}
!461 = !{i32 495}
!462 = !{i32 496}
!463 = !{i32 497}
!464 = !{i32 498}
!465 = !{i32 499}
!466 = !{i32 500}
!467 = !{i32 501}
!468 = !{i32 502}
!469 = !{i32 503}
!470 = !{i32 504}
!471 = !{i32 505}
!472 = !{i32 506}
!473 = !{i32 507}
!474 = !{i32 508}
!475 = !{i32 509}
!476 = !{i32 510}
!477 = !{i32 511}
!478 = !{i32 512}
!479 = !{i32 513}
!480 = !{i32 514}
!481 = !{i32 515}
!482 = !{i32 516}
!483 = !{i32 517}
!484 = !{i32 518}
!485 = !{i32 519}
!486 = !{i32 520}
!487 = !{i32 521}
!488 = !{i32 522}
!489 = !{i32 523}
!490 = !{i32 524}
!491 = !{i32 525}
!492 = !{i32 526}
!493 = !{i32 527}
!494 = !{i32 528}
!495 = !{i32 529}
!496 = !{i32 530}
!497 = !{i32 531}
!498 = !{i32 532}
!499 = !{i32 533}
!500 = !{i32 534}
!501 = !{i32 535}
!502 = !{i32 536}
!503 = !{i32 537}
!504 = !{i32 538}
!505 = !{i32 539}
!506 = !{i32 540}
!507 = !{i32 541}
!508 = !{i32 542}
!509 = !{i32 543}
!510 = !{i32 544}
!511 = !{i32 545}
!512 = !{i32 546}
!513 = !{i32 547}
!514 = !{i32 548}
!515 = !{i32 549}
!516 = !{i32 550}
!517 = !{i32 551}
!518 = !{i32 552}
!519 = !{i32 553}
!520 = !{i32 554}
!521 = !{i32 555}
!522 = !{i32 556}
!523 = !{i32 557}
!524 = !{i32 558}
!525 = !{i32 559}
!526 = !{i32 560}
!527 = !{i32 561}
!528 = !{i32 562}
!529 = !{i32 563}
!530 = !{i32 564}
!531 = !{i32 565}
!532 = !{i32 566}
!533 = !{i32 567}
!534 = !{i32 568}
!535 = !{i32 569}
!536 = !{i32 570}
!537 = !{i32 571}
!538 = !{i32 572}
!539 = !{i32 573}
!540 = !{i32 574}
!541 = !{i32 575}
!542 = !{i32 576}
!543 = !{i32 577}
!544 = !{i32 578}
!545 = !{i32 579}
!546 = !{i32 580}
!547 = !{i32 581}
!548 = !{i32 582}
!549 = !{i32 583}
!550 = !{i32 587}
!551 = !{i32 588}
!552 = !{i32 589}
!553 = !{i32 591}
!554 = !{i32 592}
!555 = !{i32 593}
!556 = !{i32 595}
!557 = !{i32 596}
!558 = !{i32 597}
!559 = !{i32 599}
!560 = !{i32 600}
!561 = !{i32 601}
!562 = !{i32 603}
!563 = !{i32 605}
!564 = !{i32 606}
!565 = !{i32 607}
!566 = !{i32 608}
!567 = !{i32 609}
!568 = !{i32 610}
!569 = !{i32 611}
!570 = !{i32 618}
!571 = !{i32 619}
!572 = !{i32 620}
!573 = !{i32 622}
!574 = !{i32 623}
!575 = !{i32 624}
!576 = !{i32 626}
!577 = !{i32 627}
!578 = !{i32 628}
!579 = !{i32 629}
!580 = !{i32 631}
!581 = !{i32 633}
!582 = !{i32 634}
!583 = !{i32 635}
!584 = !{i32 637}
!585 = !{i32 638}
!586 = !{i32 639}
!587 = !{i32 640}
!588 = !{i32 642}
!589 = !{i32 643}
!590 = distinct !{!590, i32 14}
!591 = !{i32 645}
!592 = !{i32 646}
!593 = !{i32 647}
!594 = !{i32 648}
!595 = !{i32 649}
!596 = !{i32 650}
!597 = !{i32 652}
!598 = !{i32 653}
!599 = !{i32 654}
!600 = !{i32 655}
!601 = !{i32 657}
!602 = !{i32 658}
!603 = !{i32 659}
!604 = !{i32 661}
!605 = !{i32 662}
!606 = !{i32 663}
!607 = !{i32 664}
!608 = !{i32 666}
!609 = !{i32 667}
!610 = !{i32 668}
!611 = !{i32 669}
!612 = !{i32 670}
!613 = !{i32 671}
!614 = !{i32 672}
!615 = !{i32 674}
!616 = !{i32 676}
!617 = !{i32 678}
!618 = !{i32 679}
!619 = !{i32 680}
!620 = !{i32 681}
!621 = !{i32 682}
!622 = !{i32 683}
!623 = !{i32 684}
!624 = !{i32 690}
!625 = !{i32 691}
!626 = !{i32 692}
!627 = !{i32 694}
!628 = !{i32 695}
!629 = !{i32 697}
!630 = !{i32 698}
!631 = !{i32 700}
!632 = !{i32 701}
!633 = !{i32 703}
!634 = !{i32 704}
!635 = !{i32 705}
!636 = distinct !{!636, i32 13}
!637 = !{i32 707}
!638 = !{i32 708}
!639 = !{i32 709}
!640 = !{i32 710}
!641 = !{i32 711}
!642 = !{i32 712}
!643 = !{i32 713}
!644 = !{i32 716}
!645 = !{i32 718}
!646 = !{i32 719}
!647 = !{i32 720}
!648 = !{i32 722}
!649 = !{i32 723}
!650 = !{i32 724}
!651 = !{i32 726}
!652 = !{i32 728}
!653 = !{i32 729}
!654 = !{i32 730}
!655 = !{i32 731}
!656 = !{i32 732}
!657 = !{i32 737}
!658 = !{i32 738}
!659 = !{i32 739}
!660 = !{i32 741}
!661 = !{i32 742}
!662 = !{i32 743}
!663 = !{i32 745}
!664 = !{i32 746}
!665 = !{i32 747}
!666 = !{i32 748}
!667 = !{i32 750}
!668 = !{i32 751}
!669 = distinct !{!669, i32 16}
!670 = !{i32 753}
!671 = !{i32 754}
!672 = !{i32 755}
!673 = !{i32 756}
!674 = !{i32 757}
!675 = !{i32 762}
!676 = !{i32 763}
!677 = !{i32 765}
!678 = !{i32 766}
!679 = !{i32 768}
!680 = !{i32 769}
!681 = !{i32 771}
!682 = !{i32 772}
!683 = !{i32 773}
!684 = !{i32 775}
!685 = !{i32 776}
!686 = !{i32 777}
!687 = !{i32 780}
!688 = !{i32 781}
!689 = !{i32 782}
!690 = !{i32 784}
!691 = !{i32 785}
!692 = !{i32 786}
!693 = !{i32 787}
!694 = !{i32 788}
!695 = !{i32 789}
!696 = !{i32 791}
!697 = !{i32 792}
!698 = !{i32 794}
!699 = !{i32 795}
!700 = !{i32 797}
!701 = !{i32 798}
!702 = !{i32 800}
!703 = !{i32 801}
!704 = !{i32 803}
!705 = !{i32 806}
!706 = !{i32 807}
!707 = !{i32 809}
!708 = !{i32 811}
!709 = !{i32 812}
!710 = !{i32 813}
!711 = !{i32 814}
!712 = !{i32 815}
!713 = !{i32 816}
!714 = !{i32 818}
!715 = !{i32 819}
!716 = !{i32 823}
!717 = !{i32 824}
!718 = !{i32 825}
!719 = !{i32 827}
!720 = !{i32 828}
!721 = !{i32 830}
!722 = !{i32 831}
!723 = !{i32 832}
!724 = !{i32 833}
!725 = !{i32 834}
!726 = !{i32 835}
!727 = !{i32 836}
!728 = !{i32 837}
!729 = !{i32 838}
!730 = !{i32 839}
!731 = !{i32 840}
!732 = !{i32 841}
!733 = distinct !{!733, i32 21}
!734 = !{i32 843}
!735 = !{i32 844}
!736 = !{i32 845}
!737 = !{i32 847}
!738 = !{i32 848}
!739 = !{i32 850}
!740 = !{i32 851}
!741 = !{i32 852}
!742 = !{i32 853}
!743 = !{i32 854}
!744 = !{i32 855}
!745 = !{i32 856}
!746 = !{i32 857}
!747 = !{i32 858}
!748 = !{i32 860}
!749 = !{i32 862}
!750 = !{i32 863}
!751 = !{i32 865}
!752 = !{i32 866}
!753 = !{i32 867}
!754 = !{i32 868}
!755 = !{i32 869}
!756 = !{i32 870}
!757 = !{i32 872}
!758 = !{i32 873}
!759 = !{i32 874}
!760 = !{i32 875}
!761 = !{i32 876}
!762 = distinct !{!762, i32 22}
!763 = !{i32 878}
!764 = !{i32 879}
!765 = !{i32 880}
!766 = !{i32 881}
!767 = !{i32 882}
!768 = !{i32 883}
!769 = !{i32 884}
!770 = !{i32 885}
!771 = !{i32 886}
!772 = !{i32 887}
!773 = !{i32 888}
!774 = !{i32 889}
!775 = !{i32 890}
!776 = !{i32 891}
!777 = !{i32 892}
!778 = !{i32 893}
!779 = !{i32 894}
!780 = !{i32 895}
!781 = !{i32 896}
!782 = !{i32 897}
!783 = !{i32 898}
!784 = !{i32 899}
!785 = !{i32 900}
!786 = !{i32 901}
!787 = !{i32 902}
!788 = !{i32 908}
!789 = !{i32 909}
!790 = !{i32 911}
!791 = !{i32 912}
!792 = !{i32 913}
!793 = !{i32 914}
!794 = !{i32 915}
!795 = !{i32 916}
!796 = !{i32 918}
!797 = !{i32 919}
!798 = !{i32 921}
!799 = !{i32 923}
!800 = !{i32 924}
!801 = !{i32 925}
!802 = !{i32 926}
!803 = !{i32 927}
!804 = !{i32 928}
!805 = !{i32 930}
!806 = !{i32 931}
!807 = !{i32 933}
!808 = !{i32 934}
!809 = !{i32 936}
!810 = !{i32 937}
!811 = !{i32 938}
!812 = !{i32 939}
!813 = !{i32 940}
!814 = !{i32 942}
!815 = !{i32 943}
!816 = !{i32 945}
!817 = !{i32 946}
!818 = !{i32 948}
!819 = !{i32 949}
!820 = !{i32 951}
!821 = !{i32 952}
!822 = !{i32 954}
!823 = !{i32 959}
!824 = !{i32 960}
!825 = !{i32 961}
!826 = !{i32 963}
!827 = !{i32 964}
!828 = !{i32 965}
!829 = !{i32 966}
!830 = !{i32 967}
!831 = !{i32 968}
!832 = !{i32 969}
!833 = !{i32 971}
!834 = !{i32 972}
!835 = !{i32 973}
!836 = !{i32 975}
!837 = !{i32 976}
!838 = !{i32 978}
!839 = !{i32 980}
!840 = !{i32 981}
!841 = !{i32 983}
!842 = !{i32 984}
!843 = !{i32 986}
!844 = !{i32 987}
!845 = !{i32 988}
!846 = !{i32 989}
!847 = !{i32 991}
!848 = !{i32 992}
!849 = !{i32 994}
!850 = !{i32 997}
!851 = !{i32 998}
!852 = !{i32 999}
!853 = !{i32 1000}
!854 = !{i32 1002}
!855 = !{i32 1003}
!856 = !{i32 1004}
!857 = !{i32 1005}
!858 = !{i32 1007}
!859 = !{i32 1008}
!860 = !{i32 1010}
!861 = !{i32 1011}
!862 = !{i32 1013}
!863 = !{i32 1014}
!864 = !{i32 1016}
!865 = !{i32 1017}
!866 = !{i32 1019}
!867 = !{i32 1022}
!868 = !{i32 1023}
!869 = !{i32 1025}
!870 = !{i32 1027}
!871 = !{i32 1028}
!872 = !{i32 1030}
!873 = !{i32 1031}
!874 = !{i32 1032}
!875 = !{i32 1033}
!876 = !{i32 1034}
!877 = !{i32 1035}
!878 = !{i32 1036}
!879 = !{i32 1037}
!880 = !{i32 1039}
!881 = !{i32 1040}
!882 = !{i32 1041}
!883 = !{i32 1042}
!884 = !{i32 1043}
!885 = !{i32 1044}
!886 = !{i32 1045}
!887 = distinct !{!887, i32 27}
!888 = !{i32 1047}
!889 = !{i32 1048}
!890 = !{i32 1049}
!891 = !{i32 1050}
!892 = !{i32 1051}
!893 = !{i32 1052}
!894 = !{i32 1053}
!895 = !{i32 1054}
!896 = !{i32 1055}
!897 = !{i32 1056}
!898 = !{i32 1058}
!899 = !{i32 1059}
!900 = !{i32 1060}
!901 = !{i32 1061}
!902 = !{i32 1063}
!903 = !{i32 1064}
!904 = !{i32 1066}
!905 = !{i32 1068}
!906 = !{i32 1069}
!907 = !{i32 1071}
!908 = !{i32 1072}
!909 = !{i32 1074}
!910 = !{i32 1075}
!911 = !{i32 1077}
