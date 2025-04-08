; ModuleID = 'a.o.3.bc'
source_filename = "a.o.3.bc"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

$_ssdm_op_SpecTopModule = comdat any

$_ssdm_op_SpecPipeline = comdat any

$_ssdm_op_SpecLoopTripCount = comdat any

$_ssdm_op_SpecLoopName = comdat any

$_ssdm_op_SpecInterface = comdat any

$_ssdm_op_SpecBitsMap = comdat any

$_ssdm_op_Read.ap_auto.i8 = comdat any

$_ssdm_op_Read.ap_auto.i32 = comdat any

$_ssdm_op_Read.ap_auto.i16 = comdat any

$_ssdm_op_Read.ap_auto.i15 = comdat any

$_ssdm_op_PartSelect.i5.i15.i32.i32 = comdat any

$_ssdm_op_PartSelect.i4.i8.i32.i32 = comdat any

$_ssdm_op_PartSelect.i4.i6.i32.i32 = comdat any

$_ssdm_op_PartSelect.i4.i15.i32.i32 = comdat any

$_ssdm_op_PartSelect.i32.i50.i32.i32 = comdat any

$_ssdm_op_PartSelect.i32.i47.i32.i32 = comdat any

$_ssdm_op_PartSelect.i32.i46.i32.i32 = comdat any

$_ssdm_op_PartSelect.i32.i40.i32.i32 = comdat any

$_ssdm_op_PartSelect.i2.i8.i32.i32 = comdat any

$_ssdm_op_PartSelect.i17.i25.i32.i32 = comdat any

$_ssdm_op_PartSelect.i16.i31.i32.i32 = comdat any

$_ssdm_op_PartSelect.i16.i23.i32.i32 = comdat any

$_ssdm_op_PartSelect.i15.i30.i32.i32 = comdat any

$_ssdm_op_PartSelect.i14.i29.i32.i32 = comdat any

$_ssdm_op_PartSelect.i13.i25.i32.i32 = comdat any

$_ssdm_op_PartSelect.i12.i19.i32.i32 = comdat any

$_ssdm_op_PartSelect.i11.i16.i32.i32 = comdat any

$_ssdm_op_Mux.ap_auto.4i14.i2 = comdat any

$_ssdm_op_Mux.ap_auto.4i11.i2 = comdat any

$_ssdm_op_BitSelect.i1.i64.i32 = comdat any

$_ssdm_op_BitSelect.i1.i32.i32 = comdat any

$_ssdm_op_BitConcatenate.i8.i2.i6 = comdat any

$_ssdm_op_BitConcatenate.i7.i6.i1 = comdat any

$_ssdm_op_BitConcatenate.i40.i32.i8 = comdat any

$_ssdm_op_BitConcatenate.i36.i32.i4 = comdat any

$_ssdm_op_BitConcatenate.i34.i32.i2 = comdat any

$_ssdm_op_BitConcatenate.i32.i31.i1 = comdat any

$_ssdm_op_BitConcatenate.i24.i16.i8 = comdat any

$_ssdm_op_BitConcatenate.i22.i15.i7 = comdat any

$_ssdm_op_BitConcatenate.i18.i16.i2 = comdat any

$_ssdm_op_BitConcatenate.i15.i12.i3 = comdat any

@xout2 = internal unnamed_addr global i32 0, align 512
@xout1 = internal unnamed_addr global i32 0, align 512
@wl_code_table = internal unnamed_addr constant [16 x i13] [i13 -60, i13 3042, i13 1198, i13 538, i13 334, i13 172, i13 58, i13 -30, i13 3042, i13 1198, i13 538, i13 334, i13 172, i13 58, i13 -30, i13 -60]
@tqmf = internal unnamed_addr global [24 x i32] zeroinitializer, align 512
@rlt2 = internal unnamed_addr global i31 0
@rlt1 = internal unnamed_addr global i31 0
@rh2 = internal unnamed_addr global i31 0
@rh1 = internal unnamed_addr global i31 0
@quant26bt_pos = internal unnamed_addr constant [31 x i6] [i6 -3, i6 -4, i6 -5, i6 -6, i6 -7, i6 -8, i6 -9, i6 -10, i6 -11, i6 -12, i6 -13, i6 -14, i6 -15, i6 -16, i6 -17, i6 -18, i6 -19, i6 -20, i6 -21, i6 -22, i6 -23, i6 -24, i6 -25, i6 -26, i6 -27, i6 -28, i6 -29, i6 -30, i6 -31, i6 -32, i6 -32]
@quant26bt_neg = internal unnamed_addr constant [31 x i6] [i6 -1, i6 -2, i6 31, i6 30, i6 29, i6 28, i6 27, i6 26, i6 25, i6 24, i6 23, i6 22, i6 21, i6 20, i6 19, i6 18, i6 17, i6 16, i6 15, i6 14, i6 13, i6 12, i6 11, i6 10, i6 9, i6 8, i6 7, i6 6, i6 5, i6 4, i6 4]
@qq6_code6_table = internal unnamed_addr constant [64 x i16] [i16 -136, i16 -136, i16 -136, i16 -136, i16 -24808, i16 -21904, i16 -19008, i16 -16704, i16 -14984, i16 -13512, i16 -12280, i16 -11192, i16 -10232, i16 -9360, i16 -8576, i16 -7856, i16 -7192, i16 -6576, i16 -6000, i16 -5456, i16 -4944, i16 -4464, i16 -4008, i16 -3576, i16 -3168, i16 -2776, i16 -2400, i16 -2032, i16 -1688, i16 -1360, i16 -1040, i16 -728, i16 24808, i16 21904, i16 19008, i16 16704, i16 14984, i16 13512, i16 12280, i16 11192, i16 10232, i16 9360, i16 8576, i16 7856, i16 7192, i16 6576, i16 6000, i16 5456, i16 4944, i16 4464, i16 4008, i16 3576, i16 3168, i16 2776, i16 2400, i16 2032, i16 1688, i16 1360, i16 1040, i16 728, i16 432, i16 136, i16 -432, i16 -136]
@qq4_code4_table = internal unnamed_addr constant [16 x i16] [i16 0, i16 -20456, i16 -12896, i16 -8968, i16 -6288, i16 -4240, i16 -2584, i16 -1200, i16 20456, i16 12896, i16 8968, i16 6288, i16 4240, i16 2584, i16 1200, i16 0]
@plt2 = internal unnamed_addr global i32 0, align 512
@plt1 = internal unnamed_addr global i32 0, align 512
@ph2 = internal unnamed_addr global i32 0, align 512
@ph1 = internal unnamed_addr global i32 0, align 512
@nbl = internal unnamed_addr global i15 0
@nbh = internal unnamed_addr global i15 0
@ilb_table = internal unnamed_addr constant [32 x i12] [i12 -2048, i12 -2003, i12 -1957, i12 -1910, i12 -1863, i12 -1814, i12 -1764, i12 -1713, i12 -1661, i12 -1607, i12 -1553, i12 -1497, i12 -1440, i12 -1382, i12 -1322, i12 -1262, i12 -1200, i12 -1136, i12 -1071, i12 -1005, i12 -938, i12 -868, i12 -798, i12 -725, i12 -652, i12 -576, i12 -499, i12 -420, i12 -340, i12 -258, i12 -174, i12 -88]
@il = internal unnamed_addr global i6 0
@h = internal unnamed_addr constant [24 x i15] [i15 12, i15 -44, i15 -44, i15 212, i15 48, i15 -624, i15 128, i15 1448, i15 -840, i15 -3220, i15 3804, i15 15504, i15 15504, i15 3804, i15 -3220, i15 -840, i15 1448, i15 128, i15 -624, i15 48, i15 212, i15 -44, i15 -44, i15 12]
@detl = internal unnamed_addr global i15 0
@deth = internal unnamed_addr global i15 0
@delay_dltx = internal global [6 x i16] zeroinitializer
@delay_dhx = internal global [6 x i16] zeroinitializer
@delay_bpl = internal global [6 x i32] zeroinitializer, align 512
@delay_bph = internal global [6 x i32] zeroinitializer, align 512
@decis_levl = internal unnamed_addr constant [30 x i15] [i15 280, i15 576, i15 880, i15 1200, i15 1520, i15 1864, i15 2208, i15 2584, i15 2960, i15 3376, i15 3784, i15 4240, i15 4696, i15 5200, i15 5712, i15 6288, i15 6864, i15 7520, i15 8184, i15 8968, i15 9752, i15 10712, i15 11664, i15 12896, i15 14120, i15 15840, i15 -15208, i15 -12312, i15 -9416, i15 -1]
@dec_rlt2 = internal unnamed_addr global i31 0
@dec_rlt1 = internal unnamed_addr global i31 0
@dec_rh2 = internal unnamed_addr global i31 0
@dec_rh1 = internal unnamed_addr global i31 0
@dec_plt2 = internal unnamed_addr global i32 0, align 512
@dec_plt1 = internal unnamed_addr global i32 0, align 512
@dec_ph2 = internal unnamed_addr global i32 0, align 512
@dec_ph1 = internal unnamed_addr global i32 0, align 512
@dec_nbl = internal unnamed_addr global i15 0
@dec_nbh = internal unnamed_addr global i15 0
@dec_detl = internal unnamed_addr global i15 0
@dec_deth = internal unnamed_addr global i15 0
@dec_del_dltx = internal global [6 x i16] zeroinitializer
@dec_del_dhx = internal global [6 x i16] zeroinitializer
@dec_del_bpl = internal global [6 x i32] zeroinitializer, align 512
@dec_del_bph = internal global [6 x i32] zeroinitializer, align 512
@dec_al2 = internal unnamed_addr global i15 0
@dec_al1 = internal unnamed_addr global i16 0
@dec_ah2 = internal unnamed_addr global i15 0
@dec_ah1 = internal unnamed_addr global i16 0
@al2 = internal unnamed_addr global i15 0
@al1 = internal unnamed_addr global i16 0
@ah2 = internal unnamed_addr global i15 0
@ah1 = internal unnamed_addr global i16 0
@accumd = internal unnamed_addr global [11 x i32] zeroinitializer, align 512
@accumc = internal unnamed_addr global [11 x i32] zeroinitializer, align 512
@empty = internal unnamed_addr constant [15 x i8] c"upzero_label11\00"
@empty_0 = internal unnamed_addr constant [15 x i8] c"upzero_label10\00"
@empty_1 = internal unnamed_addr constant [19 x i8] c"adpcm_main_label12\00"
@empty_2 = internal unnamed_addr constant [14 x i8] c"decode_label2\00"
@empty_3 = internal unnamed_addr constant [14 x i8] c"decode_label3\00"
@empty_4 = internal unnamed_addr constant [1 x i8] zeroinitializer
@empty_5 = internal unnamed_addr constant [10 x i8] c"ap_memory\00"
@empty_6 = internal unnamed_addr constant [13 x i8] c"reset_label7\00"
@empty_7 = internal unnamed_addr constant [14 x i8] c"encode_label0\00"
@empty_8 = internal unnamed_addr constant [14 x i8] c"encode_label1\00"
@empty_9 = internal unnamed_addr constant [13 x i8] c"reset_label5\00"
@empty_10 = internal unnamed_addr constant [13 x i8] c"reset_label4\00"
@empty_11 = internal unnamed_addr constant [14 x i8] c"quantl_label9\00"
@empty_12 = internal unnamed_addr constant [14 x i8] c"filtez_label8\00"
@empty_13 = internal unnamed_addr constant [19 x i8] c"adpcm_main_label13\00"
@empty_14 = internal unnamed_addr constant [11 x i8] c"adpcm_main\00"
@empty_15 = internal unnamed_addr constant [13 x i8] c"reset_label6\00"

; Function Attrs: nounwind
define internal fastcc void @upzero(i16 %dlt, [6 x i16]* noalias nocapture align 512 %dlti, [6 x i32]* noalias nocapture align 512 %bli) #0 {
entry:
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_4)
  %dlt_read = call i16 @_ssdm_op_Read.ap_auto.i16(i16 %dlt) #0, !bitwidth !7
  %dlti_addr = getelementptr inbounds [6 x i16], [6 x i16]* %dlti, i64 0, i64 0, !bitwidth !160
  %icmp_ln535 = icmp eq i16 %dlt_read, 0, !bitwidth !336
  %i = alloca i3, align 1, !bitwidth !337
  br i1 %icmp_ln535, label %for.inc.preheader, label %upzero_label11, !bitwidth !338

for.inc.preheader:                                ; preds = %entry
  store i3 0, i3* %i, align 1, !bitwidth !338, !dep_idx !339, !deps !340
  br label %for.inc, !bitwidth !338

for.inc:                                          ; preds = %for.inc.split, %for.inc.preheader
  %i_1 = load i3, i3* %i, align 1, !bitwidth !348, !dep_idx !349, !deps !350
  %icmp_ln537 = icmp eq i3 %i_1, -2, !bitwidth !336
  %add_ln537 = add nuw i3 %i_1, 1, !bitwidth !348
  br i1 %icmp_ln537, label %if.end27.loopexit7, label %for.inc.split, !llvm.loop !357, !bitwidth !338

for.inc.split:                                    ; preds = %for.inc
  %zext_ln537 = zext i3 %i_1 to i64, !bitwidth !381
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 6, i64 6, i64 6), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecLoopName([15 x i8]* @empty_0)
  %bli_addr = getelementptr inbounds [6 x i32], [6 x i32]* %bli, i64 0, i64 %zext_ln537, !bitwidth !158
  %bli_load = load i32, i32* %bli_addr, align 4, !bitwidth !139, !dep_idx !383, !deps !384
  %sext_ln539 = sext i32 %bli_load to i40, !bitwidth !388
  %shl_ln = call i40 @_ssdm_op_BitConcatenate.i40.i32.i8(i32 %bli_load, i8 0), !bitwidth !389
  %sub_ln539 = sub i40 %shl_ln, %sext_ln539, !bitwidth !389
  %trunc_ln = call i32 @_ssdm_op_PartSelect.i32.i40.i32.i32(i40 %sub_ln539, i32 8, i32 39), !bitwidth !139
  store i32 %trunc_ln, i32* %bli_addr, align 4, !bitwidth !338, !dep_idx !390, !deps !391
  store i3 %add_ln537, i3* %i, align 1, !bitwidth !338, !dep_idx !396, !deps !397
  br label %for.inc, !llvm.loop !357, !bitwidth !338

upzero_label11:                                   ; preds = %entry
  %sext_ln543 = sext i16 %dlt_read to i32, !bitwidth !401
  store i3 0, i3* %i, align 1, !bitwidth !338, !dep_idx !402, !deps !403
  br label %for.body7, !bitwidth !338

for.body7:                                        ; preds = %for.body7.split, %upzero_label11
  %i_2 = load i3, i3* %i, align 1, !bitwidth !348, !dep_idx !404, !deps !405
  %icmp_ln543 = icmp eq i3 %i_2, -2, !bitwidth !336
  %add_ln543 = add nuw i3 %i_2, 1, !bitwidth !348
  br i1 %icmp_ln543, label %if.end27.loopexit, label %for.body7.split, !llvm.loop !408, !bitwidth !338

for.body7.split:                                  ; preds = %for.body7
  %zext_ln543 = zext i3 %i_2 to i64, !bitwidth !381
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 6, i64 6, i64 6), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecLoopName([15 x i8]* @empty)
  %dlti_addr_1 = getelementptr inbounds [6 x i16], [6 x i16]* %dlti, i64 0, i64 %zext_ln543, !bitwidth !160
  %dlti_load = load i16, i16* %dlti_addr_1, align 2, !bitwidth !7, !dep_idx !420, !deps !421
  %sext_ln545 = sext i16 %dlti_load to i32, !bitwidth !401
  %mul_ln545 = mul i32 %sext_ln545, %sext_ln543, !bitwidth !139
  %sext_ln545_1 = sext i32 %mul_ln545 to i64, !bitwidth !428
  %tmp = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %sext_ln545_1, i32 63), !bitwidth !336
  %select_ln549 = select i1 %tmp, i32 -128, i32 128, !bitwidth !40
  %bli_addr_1 = getelementptr inbounds [6 x i32], [6 x i32]* %bli, i64 0, i64 %zext_ln543, !bitwidth !158
  %bli_load_1 = load i32, i32* %bli_addr_1, align 4, !bitwidth !139, !dep_idx !429, !deps !430
  %sext_ln549 = sext i32 %bli_load_1 to i40, !bitwidth !388
  %shl_ln1 = call i40 @_ssdm_op_BitConcatenate.i40.i32.i8(i32 %bli_load_1, i8 0), !bitwidth !389
  %sub_ln549 = sub i40 %shl_ln1, %sext_ln549, !bitwidth !389
  %wd3 = call i32 @_ssdm_op_PartSelect.i32.i40.i32.i32(i40 %sub_ln549, i32 8, i32 39), !bitwidth !139
  %add_ln550 = add nsw i32 %wd3, %select_ln549, !bitwidth !139
  store i32 %add_ln550, i32* %bli_addr_1, align 4, !bitwidth !338, !dep_idx !433, !deps !434
  store i3 %add_ln543, i3* %i, align 1, !bitwidth !338, !dep_idx !438, !deps !439
  br label %for.body7, !llvm.loop !408, !bitwidth !338

if.end27.loopexit:                                ; preds = %for.body7
  br label %if.end27, !bitwidth !338

if.end27.loopexit7:                               ; preds = %for.inc
  br label %if.end27, !bitwidth !338

if.end27:                                         ; preds = %if.end27.loopexit7, %if.end27.loopexit
  %dlti_addr_2 = getelementptr inbounds [6 x i16], [6 x i16]* %dlti, i64 0, i64 4, !bitwidth !160
  %dlti_load_1 = load i16, i16* %dlti_addr_2, align 2, !bitwidth !7, !dep_idx !441, !deps !442
  %dlti_addr_3 = getelementptr inbounds [6 x i16], [6 x i16]* %dlti, i64 0, i64 5, !bitwidth !160
  store i16 %dlti_load_1, i16* %dlti_addr_3, align 2, !bitwidth !338, !dep_idx !443, !deps !444
  %dlti_addr_4 = getelementptr inbounds [6 x i16], [6 x i16]* %dlti, i64 0, i64 3, !bitwidth !160
  %dlti_load_2 = load i16, i16* %dlti_addr_4, align 2, !bitwidth !7, !dep_idx !446, !deps !447
  store i16 %dlti_load_2, i16* %dlti_addr_2, align 2, !bitwidth !338, !dep_idx !448, !deps !449
  %dlti_addr_5 = getelementptr inbounds [6 x i16], [6 x i16]* %dlti, i64 0, i64 2, !bitwidth !160
  %dlti_load_3 = load i16, i16* %dlti_addr_5, align 2, !bitwidth !7, !dep_idx !451, !deps !452
  store i16 %dlti_load_3, i16* %dlti_addr_4, align 2, !bitwidth !338, !dep_idx !453, !deps !454
  %dlti_addr_6 = getelementptr inbounds [6 x i16], [6 x i16]* %dlti, i64 0, i64 1, !bitwidth !160
  %dlti_load_4 = load i16, i16* %dlti_addr_6, align 2, !bitwidth !7, !dep_idx !456, !deps !457
  store i16 %dlti_load_4, i16* %dlti_addr_5, align 2, !bitwidth !338, !dep_idx !458, !deps !459
  %dlti_load_5 = load i16, i16* %dlti_addr, align 2, !bitwidth !7, !dep_idx !461, !deps !462
  store i16 %dlti_load_5, i16* %dlti_addr_6, align 2, !bitwidth !338, !dep_idx !463, !deps !464
  store i16 %dlt_read, i16* %dlti_addr, align 2, !bitwidth !338, !dep_idx !466, !deps !467
  ret void, !bitwidth !338
}

; Function Attrs: nounwind
define internal fastcc void @reset() unnamed_addr #0 {
entry:
  %i = alloca i3, align 1, !bitwidth !337
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_4), !fpga.pragma.source !382
  store i15 32, i15* @dec_detl, align 2, !bitwidth !338
  store i15 32, i15* @detl, align 2, !bitwidth !338
  store i15 8, i15* @dec_deth, align 2, !bitwidth !338
  store i15 8, i15* @deth, align 2, !bitwidth !338
  store i31 0, i31* @rlt2, align 4, !bitwidth !338
  store i31 0, i31* @rlt1, align 4, !bitwidth !338
  store i32 0, i32* @plt2, align 512, !bitwidth !338
  store i32 0, i32* @plt1, align 512, !bitwidth !338
  store i15 0, i15* @al2, align 2, !bitwidth !338
  store i16 0, i16* @al1, align 2, !bitwidth !338
  store i15 0, i15* @nbl, align 2, !bitwidth !338
  store i31 0, i31* @rh2, align 4, !bitwidth !338
  store i31 0, i31* @rh1, align 4, !bitwidth !338
  store i32 0, i32* @ph2, align 512, !bitwidth !338
  store i32 0, i32* @ph1, align 512, !bitwidth !338
  store i15 0, i15* @ah2, align 2, !bitwidth !338
  store i16 0, i16* @ah1, align 2, !bitwidth !338
  store i15 0, i15* @nbh, align 2, !bitwidth !338
  store i31 0, i31* @dec_rlt2, align 4, !bitwidth !338
  store i31 0, i31* @dec_rlt1, align 4, !bitwidth !338
  store i32 0, i32* @dec_plt2, align 512, !bitwidth !338
  store i32 0, i32* @dec_plt1, align 512, !bitwidth !338
  store i15 0, i15* @dec_al2, align 2, !bitwidth !338
  store i16 0, i16* @dec_al1, align 2, !bitwidth !338
  store i15 0, i15* @dec_nbl, align 2, !bitwidth !338
  store i31 0, i31* @dec_rh2, align 4, !bitwidth !338
  store i31 0, i31* @dec_rh1, align 4, !bitwidth !338
  store i32 0, i32* @dec_ph2, align 512, !bitwidth !338
  store i32 0, i32* @dec_ph1, align 512, !bitwidth !338
  store i15 0, i15* @dec_ah2, align 2, !bitwidth !338
  store i16 0, i16* @dec_ah1, align 2, !bitwidth !338
  store i15 0, i15* @dec_nbh, align 2, !bitwidth !338
  store i3 0, i3* %i, align 1, !bitwidth !338, !dep_idx !469, !deps !470
  br label %for.inc, !bitwidth !338

for.inc:                                          ; preds = %for.inc.split, %entry
  %i_5 = load i3, i3* %i, align 1, !bitwidth !348, !dep_idx !473, !deps !474
  %icmp_ln427 = icmp eq i3 %i_5, -2, !bitwidth !336
  %add_ln427 = add nuw i3 %i_5, 1, !bitwidth !348
  br i1 %icmp_ln427, label %for.inc18.preheader, label %for.inc.split, !llvm.loop !477, !bitwidth !338

for.inc18.preheader:                              ; preds = %for.inc
  %i_2 = alloca i3, align 1, !bitwidth !337
  store i3 0, i3* %i_2, align 1, !bitwidth !338, !dep_idx !491, !deps !492
  br label %for.inc18, !bitwidth !338

for.inc.split:                                    ; preds = %for.inc
  %zext_ln427 = zext i3 %i_5 to i64, !bitwidth !381
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 6, i64 6, i64 6), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecLoopName([13 x i8]* @empty_10)
  %delay_dltx_addr = getelementptr inbounds [6 x i16], [6 x i16]* @delay_dltx, i64 0, i64 %zext_ln427, !bitwidth !160
  store i16 0, i16* %delay_dltx_addr, align 2, !bitwidth !338
  %delay_dhx_addr = getelementptr inbounds [6 x i16], [6 x i16]* @delay_dhx, i64 0, i64 %zext_ln427, !bitwidth !160
  store i16 0, i16* %delay_dhx_addr, align 2, !bitwidth !338
  %dec_del_dltx_addr = getelementptr inbounds [6 x i16], [6 x i16]* @dec_del_dltx, i64 0, i64 %zext_ln427, !bitwidth !160
  store i16 0, i16* %dec_del_dltx_addr, align 2, !bitwidth !338
  %dec_del_dhx_addr = getelementptr inbounds [6 x i16], [6 x i16]* @dec_del_dhx, i64 0, i64 %zext_ln427, !bitwidth !160
  store i16 0, i16* %dec_del_dhx_addr, align 2, !bitwidth !338
  store i3 %add_ln427, i3* %i, align 1, !bitwidth !338, !dep_idx !495, !deps !496
  br label %for.inc, !llvm.loop !477, !bitwidth !338

for.inc18:                                        ; preds = %for.inc18.split, %for.inc18.preheader
  %i_6 = load i3, i3* %i_2, align 1, !bitwidth !348, !dep_idx !499, !deps !500
  %icmp_ln436 = icmp eq i3 %i_6, -2, !bitwidth !336
  %add_ln436 = add nuw i3 %i_6, 1, !bitwidth !348
  br i1 %icmp_ln436, label %for.inc26.preheader, label %for.inc18.split, !llvm.loop !503, !bitwidth !338

for.inc26.preheader:                              ; preds = %for.inc18
  %i_3 = alloca i5, align 1, !bitwidth !513
  store i5 0, i5* %i_3, align 1, !bitwidth !338, !dep_idx !514, !deps !515
  br label %for.inc26, !bitwidth !338

for.inc18.split:                                  ; preds = %for.inc18
  %zext_ln436 = zext i3 %i_6 to i64, !bitwidth !381
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 6, i64 6, i64 6), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecLoopName([13 x i8]* @empty_9)
  %delay_bpl_addr = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bpl, i64 0, i64 %zext_ln436, !bitwidth !158
  store i32 0, i32* %delay_bpl_addr, align 4, !bitwidth !338
  %delay_bph_addr = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bph, i64 0, i64 %zext_ln436, !bitwidth !158
  store i32 0, i32* %delay_bph_addr, align 4, !bitwidth !338
  %dec_del_bpl_addr = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bpl, i64 0, i64 %zext_ln436, !bitwidth !158
  store i32 0, i32* %dec_del_bpl_addr, align 4, !bitwidth !338
  %dec_del_bph_addr = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bph, i64 0, i64 %zext_ln436, !bitwidth !158
  store i32 0, i32* %dec_del_bph_addr, align 4, !bitwidth !338
  store i3 %add_ln436, i3* %i_2, align 1, !bitwidth !338, !dep_idx !518, !deps !519
  br label %for.inc18, !llvm.loop !503, !bitwidth !338

for.inc26:                                        ; preds = %for.inc26.split, %for.inc26.preheader
  %i_7 = load i5, i5* %i_3, align 1, !bitwidth !522, !dep_idx !523, !deps !524
  %icmp_ln445 = icmp eq i5 %i_7, -8, !bitwidth !336
  %add_ln445 = add nuw i5 %i_7, 1, !bitwidth !522
  br i1 %icmp_ln445, label %for.inc36.preheader, label %for.inc26.split, !llvm.loop !527, !bitwidth !338

for.inc36.preheader:                              ; preds = %for.inc26
  %i_4 = alloca i4, align 1, !bitwidth !537
  store i4 0, i4* %i_4, align 1, !bitwidth !338, !dep_idx !538, !deps !539
  br label %for.inc36, !bitwidth !338

for.inc26.split:                                  ; preds = %for.inc26
  %zext_ln445 = zext i5 %i_7 to i64, !bitwidth !381
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 24, i64 24, i64 24), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecLoopName([13 x i8]* @empty_15)
  %tqmf_addr = getelementptr inbounds [24 x i32], [24 x i32]* @tqmf, i64 0, i64 %zext_ln445, !bitwidth !158
  store i32 0, i32* %tqmf_addr, align 4, !bitwidth !338
  store i5 %add_ln445, i5* %i_3, align 1, !bitwidth !338, !dep_idx !542, !deps !543
  br label %for.inc26, !llvm.loop !527, !bitwidth !338

for.inc36:                                        ; preds = %for.inc36.split, %for.inc36.preheader
  %i_8 = load i4, i4* %i_4, align 1, !bitwidth !546, !dep_idx !547, !deps !548
  %icmp_ln451 = icmp eq i4 %i_8, -5, !bitwidth !336
  %add_ln451 = add nuw i4 %i_8, 1, !bitwidth !546
  br i1 %icmp_ln451, label %for.end38, label %for.inc36.split, !llvm.loop !551, !bitwidth !338

for.inc36.split:                                  ; preds = %for.inc36
  %zext_ln451 = zext i4 %i_8 to i64, !bitwidth !381
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 11, i64 11, i64 11), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecLoopName([13 x i8]* @empty_6)
  %accumc_addr = getelementptr inbounds [11 x i32], [11 x i32]* @accumc, i64 0, i64 %zext_ln451, !bitwidth !158
  store i32 0, i32* %accumc_addr, align 4, !bitwidth !338
  %accumd_addr = getelementptr inbounds [11 x i32], [11 x i32]* @accumd, i64 0, i64 %zext_ln451, !bitwidth !158
  store i32 0, i32* %accumd_addr, align 4, !bitwidth !338
  store i4 %add_ln451, i4* %i_4, align 1, !bitwidth !338, !dep_idx !561, !deps !562
  br label %for.inc36, !llvm.loop !551, !bitwidth !338

for.end38:                                        ; preds = %for.inc36
  ret void, !bitwidth !338
}

; Function Attrs: nounwind readnone
define internal fastcc i6 @quantl(i32 %el, i15 %detl) #1 {
entry:
  %mil = alloca i5, align 1, !bitwidth !513
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_4), !fpga.pragma.source !382
  %detl_read = call i15 @_ssdm_op_Read.ap_auto.i15(i15 %detl) #0, !bitwidth !141
  %el_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %el) #0, !bitwidth !139
  %tmp = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %el_read, i32 31), !bitwidth !336
  %m = sub nsw i32 0, %el_read, !bitwidth !139
  %m_2 = select i1 %tmp, i32 %m, i32 %el_read, !bitwidth !139
  %zext_ln493 = zext i15 %detl_read to i30, !bitwidth !565
  store i5 0, i5* %mil, align 1, !bitwidth !338, !dep_idx !566, !deps !567
  br label %for.body, !bitwidth !338

for.body:                                         ; preds = %for.inc, %entry
  %mil_1 = load i5, i5* %mil, align 1, !bitwidth !522, !dep_idx !570, !deps !571
  %icmp_ln493 = icmp eq i5 %mil_1, -2, !bitwidth !336
  %add_ln493 = add nuw i5 %mil_1, 1, !bitwidth !522
  br i1 %icmp_ln493, label %for.end_ifconv, label %for.body.split, !llvm.loop !574, !bitwidth !338

for.body.split:                                   ; preds = %for.body
  %zext_ln493_1 = zext i5 %mil_1 to i64, !bitwidth !381
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 30, i64 30, i64 30), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecLoopName([14 x i8]* @empty_11)
  %decis_levl_addr = getelementptr inbounds [30 x i15], [30 x i15]* @decis_levl, i64 0, i64 %zext_ln493_1, !bitwidth !149
  %decis_levl_load = load i15, i15* %decis_levl_addr, align 2, !bitwidth !141
  %zext_ln495 = zext i15 %decis_levl_load to i30, !bitwidth !565
  %mul_ln495 = mul i30 %zext_ln495, %zext_ln493, !bitwidth !588
  %decis = call i15 @_ssdm_op_PartSelect.i15.i30.i32.i32(i30 %mul_ln495, i32 15, i32 29), !bitwidth !141
  %zext_ln486 = zext i15 %decis to i32, !bitwidth !589
  %icmp_ln496 = icmp slt i32 %zext_ln486, %m_2, !bitwidth !336
  br i1 %icmp_ln496, label %for.inc, label %for.end_ifconv, !bitwidth !338

for.inc:                                          ; preds = %for.body.split
  store i5 %add_ln493, i5* %mil, align 1, !bitwidth !338, !dep_idx !590, !deps !591
  br label %for.body, !llvm.loop !574, !bitwidth !338

for.end_ifconv:                                   ; preds = %for.body.split, %for.body
  %mil_02 = phi i5 [ %mil_1, %for.body.split ], [ -2, %for.body ], !bitwidth !522
  %zext_ln502 = zext i5 %mil_02 to i64, !bitwidth !381
  %quant26bt_pos_addr = getelementptr inbounds [31 x i6], [31 x i6]* @quant26bt_pos, i64 0, i64 %zext_ln502, !bitwidth !153
  %ril = load i6, i6* %quant26bt_pos_addr, align 1, !bitwidth !594
  %quant26bt_neg_addr = getelementptr inbounds [31 x i6], [31 x i6]* @quant26bt_neg, i64 0, i64 %zext_ln502, !bitwidth !153
  %ril_1 = load i6, i6* %quant26bt_neg_addr, align 1, !bitwidth !594
  %ril_2 = select i1 %tmp, i6 %ril_1, i6 %ril, !bitwidth !594
  ret i6 %ril_2, !bitwidth !338
}

; Function Attrs: nounwind readnone
declare i8 @llvm.part.select.i8(i8, i32, i32) #1

; Function Attrs: nounwind readnone
declare i6 @llvm.part.select.i6(i6, i32, i32) #1

; Function Attrs: nounwind readnone
declare i50 @llvm.part.select.i50(i50, i32, i32) #1

; Function Attrs: nounwind readnone
declare i47 @llvm.part.select.i47(i47, i32, i32) #1

; Function Attrs: nounwind readnone
declare i46 @llvm.part.select.i46(i46, i32, i32) #1

; Function Attrs: nounwind readnone
declare i40 @llvm.part.select.i40(i40, i32, i32) #1

; Function Attrs: nounwind readnone
declare i31 @llvm.part.select.i31(i31, i32, i32) #1

; Function Attrs: nounwind readnone
declare i30 @llvm.part.select.i30(i30, i32, i32) #1

; Function Attrs: nounwind readnone
declare i29 @llvm.part.select.i29(i29, i32, i32) #1

; Function Attrs: nounwind readnone
declare i25 @llvm.part.select.i25(i25, i32, i32) #1

; Function Attrs: nounwind readnone
declare i23 @llvm.part.select.i23(i23, i32, i32) #1

; Function Attrs: nounwind readnone
declare i19 @llvm.part.select.i19(i19, i32, i32) #1

; Function Attrs: nounwind readnone
declare i16 @llvm.part.select.i16(i16, i32, i32) #1

; Function Attrs: nounwind readnone
declare i15 @llvm.part.select.i15(i15, i32, i32) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, i64, metadata) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata) #2

; Function Attrs: nounwind readonly
define internal fastcc i32 @filtez([6 x i32]* noalias nocapture align 512 %bpl, [6 x i16]* noalias nocapture align 512 %dlt) #3 {
entry:
  %idx = alloca i3, align 1, !bitwidth !337
  %zl_1 = alloca i50, align 8, !bitwidth !595
  %i_02 = alloca i3, align 1, !bitwidth !337
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_4)
  %dlt_addr = getelementptr inbounds [6 x i16], [6 x i16]* %dlt, i64 0, i64 0, !bitwidth !160
  %bpl_addr = getelementptr inbounds [6 x i32], [6 x i32]* %bpl, i64 0, i64 0, !bitwidth !158
  %bpl_load = load i32, i32* %bpl_addr, align 512, !bitwidth !139
  %sext_ln461 = sext i32 %bpl_load to i48, !bitwidth !596
  %dlt_load = load i16, i16* %dlt_addr, align 2, !bitwidth !7
  %sext_ln461_1 = sext i16 %dlt_load to i48, !bitwidth !596
  %zl = mul i48 %sext_ln461_1, %sext_ln461, !bitwidth !597
  %sext_ln460 = sext i48 %zl to i50, !bitwidth !598
  store i3 1, i3* %i_02, align 1, !bitwidth !338, !dep_idx !599, !deps !600
  store i50 %sext_ln460, i50* %zl_1, align 8, !bitwidth !338, !dep_idx !603, !deps !604
  store i3 1, i3* %idx, align 1, !bitwidth !338, !dep_idx !608, !deps !609
  br label %for.inc, !bitwidth !338

for.inc:                                          ; preds = %for.inc.split, %entry
  %i_9 = load i3, i3* %i_02, align 1, !bitwidth !348, !dep_idx !612, !deps !613
  %icmp_ln464 = icmp eq i3 %i_9, -2, !bitwidth !336
  br i1 %icmp_ln464, label %for.end, label %for.inc.split, !llvm.loop !616, !bitwidth !338

for.inc.split:                                    ; preds = %for.inc
  %idx_load = load i3, i3* %idx, align 1, !bitwidth !348, !dep_idx !630, !deps !631
  %zl_1_load = load i50, i50* %zl_1, align 8, !bitwidth !634, !dep_idx !635, !deps !636
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 5, i64 5, i64 5), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecLoopName([14 x i8]* @empty_12)
  %zext_ln460 = zext i3 %idx_load to i64, !bitwidth !381
  %dlt_addr_1 = getelementptr [6 x i16], [6 x i16]* %dlt, i64 0, i64 %zext_ln460, !bitwidth !160
  %bpl_addr_1 = getelementptr [6 x i32], [6 x i32]* %bpl, i64 0, i64 %zext_ln460, !bitwidth !158
  %bpl_load_1 = load i32, i32* %bpl_addr_1, align 4, !bitwidth !139
  %sext_ln466 = sext i32 %bpl_load_1 to i48, !bitwidth !596
  %dlt_load_1 = load i16, i16* %dlt_addr_1, align 2, !bitwidth !7
  %sext_ln466_1 = sext i16 %dlt_load_1 to i48, !bitwidth !596
  %mul_ln466 = mul i48 %sext_ln466_1, %sext_ln466, !bitwidth !597
  %sext_ln466_2 = sext i48 %mul_ln466 to i50, !bitwidth !598
  %zl_2 = add nsw i50 %sext_ln466_2, %zl_1_load, !bitwidth !634
  %i = add nuw i3 %i_9, 1, !bitwidth !348
  %add_ln464 = add i3 %idx_load, 1, !bitwidth !348
  store i3 %i, i3* %i_02, align 1, !bitwidth !338, !dep_idx !639, !deps !640
  store i50 %zl_2, i50* %zl_1, align 8, !bitwidth !338, !dep_idx !643, !deps !644
  store i3 %add_ln464, i3* %idx, align 1, !bitwidth !338, !dep_idx !647, !deps !648
  br label %for.inc, !llvm.loop !616, !bitwidth !338

for.end:                                          ; preds = %for.inc
  %zl_1_load_1 = load i50, i50* %zl_1, align 8, !bitwidth !634, !dep_idx !651, !deps !652
  %trunc_ln = call i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50 %zl_1_load_1, i32 14, i32 45), !bitwidth !139
  ret i32 %trunc_ln, !bitwidth !338
}

; Function Attrs: nounwind
define internal fastcc i8 @encode(i32 %xin1, i32 %xin2) #0 {
entry:
  %idx = alloca i5, align 1, !bitwidth !513
  %i = alloca i4, align 1, !bitwidth !537
  %xa_1 = alloca i50, align 8, !bitwidth !595
  %xb_1 = alloca i50, align 8, !bitwidth !595
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_4), !fpga.pragma.source !382
  %xin2_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %xin2) #0, !bitwidth !139
  %xin1_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %xin1) #0, !bitwidth !139
  %tqmf_load = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i64 0, i64 0), align 512, !bitwidth !139, !dep_idx !654, !deps !655
  %shl_ln = call i36 @_ssdm_op_BitConcatenate.i36.i32.i4(i32 %tqmf_load, i4 0), !bitwidth !658
  %sext_ln250 = sext i36 %shl_ln to i37, !bitwidth !659
  %shl_ln250_1 = call i34 @_ssdm_op_BitConcatenate.i34.i32.i2(i32 %tqmf_load, i2 0), !bitwidth !660
  %sext_ln250_1 = sext i34 %shl_ln250_1 to i37, !bitwidth !659
  %xa = sub i37 %sext_ln250, %sext_ln250_1, !bitwidth !659
  %sext_ln244 = sext i37 %xa to i50, !bitwidth !598
  %tqmf_load_1 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i64 0, i64 1), align 4, !bitwidth !139, !dep_idx !661, !deps !662
  %sext_ln251 = sext i32 %tqmf_load_1 to i39, !bitwidth !664
  %xb = mul i39 %sext_ln251, -44, !bitwidth !665
  %sext_ln244_1 = sext i39 %xb to i50, !bitwidth !598
  store i50 %sext_ln244_1, i50* %xb_1, align 8, !bitwidth !338, !dep_idx !666, !deps !667
  store i50 %sext_ln244, i50* %xa_1, align 8, !bitwidth !338, !dep_idx !671, !deps !672
  store i4 0, i4* %i, align 1, !bitwidth !338, !dep_idx !676, !deps !677
  store i5 0, i5* %idx, align 1, !bitwidth !338, !dep_idx !680, !deps !681
  br label %for.inc, !bitwidth !338

for.inc:                                          ; preds = %for.inc.split, %entry
  %i_10 = load i4, i4* %i, align 1, !bitwidth !546, !dep_idx !684, !deps !685
  %icmp_ln255 = icmp eq i4 %i_10, -6, !bitwidth !336
  %i_11 = add nuw i4 %i_10, 1, !bitwidth !546
  br i1 %icmp_ln255, label %for.end, label %for.inc.split, !llvm.loop !688, !bitwidth !338

for.inc.split:                                    ; preds = %for.inc
  %idx_load = load i5, i5* %idx, align 1, !bitwidth !522, !dep_idx !700, !deps !701
  %xa_1_load_1 = load i50, i50* %xa_1, align 8, !bitwidth !634, !dep_idx !704, !deps !705
  %xb_1_load_1 = load i50, i50* %xb_1, align 8, !bitwidth !634, !dep_idx !708, !deps !709
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 10, i64 10, i64 10), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecLoopName([14 x i8]* @empty_7)
  %add_ln243 = add nuw i5 %idx_load, 2, !bitwidth !522
  %zext_ln243 = zext i5 %add_ln243 to i64, !bitwidth !381
  %tqmf_ptr = getelementptr [24 x i32], [24 x i32]* @tqmf, i64 0, i64 %zext_ln243, !bitwidth !158
  %h_ptr = getelementptr [24 x i15], [24 x i15]* @h, i64 0, i64 %zext_ln243, !bitwidth !149
  %add_ln257 = add nuw i5 %idx_load, 3, !bitwidth !522
  %zext_ln257 = zext i5 %add_ln257 to i64, !bitwidth !381
  %tqmf_ptr_1 = getelementptr [24 x i32], [24 x i32]* @tqmf, i64 0, i64 %zext_ln257, !bitwidth !158
  %tqmf_ptr_load = load i32, i32* %tqmf_ptr, align 8, !bitwidth !139, !dep_idx !712, !deps !713
  %sext_ln257 = sext i32 %tqmf_ptr_load to i47, !bitwidth !714
  %h_ptr_1 = getelementptr [24 x i15], [24 x i15]* @h, i64 0, i64 %zext_ln257, !bitwidth !149
  %h_ptr_load = load i15, i15* %h_ptr, align 4, !bitwidth !141
  %sext_ln257_1 = sext i15 %h_ptr_load to i47, !bitwidth !714
  %mul_ln257 = mul i47 %sext_ln257_1, %sext_ln257, !bitwidth !715
  %sext_ln257_2 = sext i47 %mul_ln257 to i50, !bitwidth !598
  %xa_3 = add nsw i50 %sext_ln257_2, %xa_1_load_1, !bitwidth !634
  %tqmf_ptr_1_load = load i32, i32* %tqmf_ptr_1, align 4, !bitwidth !139, !dep_idx !716, !deps !713
  %sext_ln258 = sext i32 %tqmf_ptr_1_load to i47, !bitwidth !714
  %h_ptr_1_load = load i15, i15* %h_ptr_1, align 2, !bitwidth !141
  %sext_ln258_1 = sext i15 %h_ptr_1_load to i47, !bitwidth !714
  %mul_ln258 = mul i47 %sext_ln258_1, %sext_ln258, !bitwidth !715
  %sext_ln258_2 = sext i47 %mul_ln258 to i50, !bitwidth !598
  %xb_3 = add nsw i50 %sext_ln258_2, %xb_1_load_1, !bitwidth !634
  store i50 %xb_3, i50* %xb_1, align 8, !bitwidth !338, !dep_idx !717, !deps !718
  store i50 %xa_3, i50* %xa_1, align 8, !bitwidth !338, !dep_idx !721, !deps !722
  store i4 %i_11, i4* %i, align 1, !bitwidth !338, !dep_idx !725, !deps !726
  store i5 %add_ln243, i5* %idx, align 1, !bitwidth !338, !dep_idx !729, !deps !730
  br label %for.inc, !llvm.loop !688, !bitwidth !338

for.end:                                          ; preds = %for.inc
  %idx118 = alloca i6, align 1, !bitwidth !733
  %i_6 = alloca i5, align 1, !bitwidth !513
  %xa_1_load = load i50, i50* %xa_1, align 8, !bitwidth !634, !dep_idx !734, !deps !735
  %xb_1_load = load i50, i50* %xb_1, align 8, !bitwidth !634, !dep_idx !737, !deps !738
  %trunc_ln255 = trunc i50 %xb_1_load to i47, !bitwidth !715
  %trunc_ln255_1 = trunc i50 %xa_1_load to i47, !bitwidth !715
  %tqmf_load_2 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i64 0, i64 22), align 8, !bitwidth !139, !dep_idx !740, !deps !741
  %tqmf_load_3 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i64 0, i64 23), align 4, !bitwidth !139, !dep_idx !742, !deps !741
  store i5 0, i5* %i_6, align 1, !bitwidth !338, !dep_idx !743, !deps !744
  store i6 0, i6* %idx118, align 1, !bitwidth !338, !dep_idx !747, !deps !748
  br label %for.inc35, !bitwidth !338

for.inc35:                                        ; preds = %for.inc35.split, %for.end
  %i_12 = load i5, i5* %i_6, align 1, !bitwidth !522, !dep_idx !751, !deps !752
  %icmp_ln269 = icmp eq i5 %i_12, -10, !bitwidth !336
  %i_13 = add nuw i5 %i_12, 1, !bitwidth !522
  br i1 %icmp_ln269, label %for.end37, label %for.inc35.split, !llvm.loop !755, !bitwidth !338

for.inc35.split:                                  ; preds = %for.inc35
  %idx118_load = load i6, i6* %idx118, align 1, !bitwidth !594, !dep_idx !765, !deps !766
  %trunc_ln269 = trunc i6 %idx118_load to i5, !bitwidth !522
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 22, i64 22, i64 22), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecLoopName([14 x i8]* @empty_8)
  %add_ln243_1 = add i5 %trunc_ln269, -11, !bitwidth !522
  %zext_ln243_1 = zext i5 %add_ln243_1 to i64, !bitwidth !381
  %tqmf_ptr1 = getelementptr [24 x i32], [24 x i32]* @tqmf, i64 0, i64 %zext_ln243_1, !bitwidth !158
  %add_ln243_2 = add i5 %trunc_ln269, -9, !bitwidth !522
  %zext_ln243_2 = zext i5 %add_ln243_2 to i64, !bitwidth !381
  %tqmf_ptr_2 = getelementptr [24 x i32], [24 x i32]* @tqmf, i64 0, i64 %zext_ln243_2, !bitwidth !158
  %tqmf_ptr1_load = load i32, i32* %tqmf_ptr1, align 4, !bitwidth !139, !dep_idx !769, !deps !770
  store i32 %tqmf_ptr1_load, i32* %tqmf_ptr_2, align 4, !bitwidth !338, !dep_idx !773, !deps !774
  %add_ln269 = add nsw i6 %idx118_load, -1, !bitwidth !594
  store i5 %i_13, i5* %i_6, align 1, !bitwidth !338, !dep_idx !785, !deps !786
  store i6 %add_ln269, i6* %idx118, align 1, !bitwidth !338, !dep_idx !789, !deps !790
  br label %for.inc35, !llvm.loop !755, !bitwidth !338

for.end37:                                        ; preds = %for.inc35
  %sext_ln263 = sext i32 %tqmf_load_2 to i39, !bitwidth !664
  %mul_ln262 = mul i39 %sext_ln263, -44, !bitwidth !665
  %sext_ln263_1 = sext i39 %mul_ln262 to i47, !bitwidth !714
  %shl_ln2 = call i36 @_ssdm_op_BitConcatenate.i36.i32.i4(i32 %tqmf_load_3, i4 0), !bitwidth !658
  %sext_ln263_2 = sext i36 %shl_ln2 to i37, !bitwidth !659
  %shl_ln263_1 = call i34 @_ssdm_op_BitConcatenate.i34.i32.i2(i32 %tqmf_load_3, i2 0), !bitwidth !660
  %sext_ln263_3 = sext i34 %shl_ln263_1 to i37, !bitwidth !659
  %sub_ln263 = sub i37 %sext_ln263_2, %sext_ln263_3, !bitwidth !659
  %sext_ln262 = sext i37 %sub_ln263 to i47, !bitwidth !714
  %xa_4 = add i47 %sext_ln263_1, %trunc_ln255_1, !bitwidth !715
  %xb_4 = add i47 %sext_ln262, %trunc_ln255, !bitwidth !715
  store i32 %xin1_read, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i64 0, i64 1), align 4, !bitwidth !338, !dep_idx !793, !deps !794
  store i32 %xin2_read, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i64 0, i64 0), align 512, !bitwidth !338, !dep_idx !797, !deps !798
  %add_ln278 = add i47 %xb_4, %xa_4, !bitwidth !715
  %trunc_ln1 = call i32 @_ssdm_op_PartSelect.i32.i47.i32.i32(i47 %add_ln278, i32 15, i32 46), !bitwidth !139
  %sub_ln279 = sub i47 %xa_4, %xb_4, !bitwidth !715
  %trunc_ln2 = call i32 @_ssdm_op_PartSelect.i32.i47.i32.i32(i47 %sub_ln279, i32 15, i32 46), !bitwidth !139
  %tmp = call fastcc i32 @filtez([6 x i32]* @delay_bpl, [6 x i16]* @delay_dltx), !bitwidth !139, !dep_idx !799, !deps !800
  %rlt1_load = load i31, i31* @rlt1, align 4, !bitwidth !803, !dep_idx !804, !deps !805
  %al1_load = load i16, i16* @al1, align 2, !bitwidth !7, !dep_idx !807, !deps !808
  %rlt2_load = load i31, i31* @rlt2, align 4, !bitwidth !803, !dep_idx !810, !deps !811
  %al2_load = load i15, i15* @al2, align 2, !bitwidth !141, !dep_idx !813, !deps !814
  %pl = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %rlt1_load, i1 false), !bitwidth !139
  %sext_ln475 = sext i32 %pl to i47, !bitwidth !714
  %sext_ln477 = sext i16 %al1_load to i25, !bitwidth !816
  %sext_ln475_1 = sext i16 %al1_load to i47, !bitwidth !714
  %mul_ln475 = mul i47 %sext_ln475_1, %sext_ln475, !bitwidth !715
  %pl2 = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %rlt2_load, i1 false), !bitwidth !139
  %sext_ln475_2 = sext i32 %pl2 to i47, !bitwidth !714
  %sext_ln479 = sext i15 %al2_load to i23, !bitwidth !817
  %sext_ln479_1 = sext i15 %al2_load to i47, !bitwidth !714
  %mul_ln479 = mul i47 %sext_ln479_1, %sext_ln475_2, !bitwidth !715
  %pl_1 = add i47 %mul_ln479, %mul_ln475, !bitwidth !715
  %trunc_ln3 = call i32 @_ssdm_op_PartSelect.i32.i47.i32.i32(i47 %pl_1, i32 15, i32 46), !bitwidth !139
  %add_ln284 = add nsw i32 %trunc_ln3, %tmp, !bitwidth !139
  %trunc_ln285 = trunc i32 %add_ln284 to i31, !bitwidth !803
  %sub_ln285 = sub nsw i32 %trunc_ln1, %add_ln284, !bitwidth !139
  %detl_load = load i15, i15* @detl, align 2, !bitwidth !141, !dep_idx !818, !deps !819
  %il_assign = call fastcc i6 @quantl(i32 %sub_ln285, i15 %detl_load), !bitwidth !594
  store i6 %il_assign, i6* @il, align 1, !bitwidth !338
  %zext_ln287 = zext i15 %detl_load to i31, !bitwidth !821
  %lshr_ln = call i4 @_ssdm_op_PartSelect.i4.i6.i32.i32(i6 %il_assign, i32 2, i32 5), !bitwidth !546
  %zext_ln287_1 = zext i4 %lshr_ln to i64, !bitwidth !381
  %qq4_code4_table_addr = getelementptr inbounds [16 x i16], [16 x i16]* @qq4_code4_table, i64 0, i64 %zext_ln287_1, !bitwidth !160
  %qq4_code4_table_load = load i16, i16* %qq4_code4_table_addr, align 2, !bitwidth !7
  %sext_ln287 = sext i16 %qq4_code4_table_load to i31, !bitwidth !822
  %mul_ln287 = mul i31 %sext_ln287, %zext_ln287, !bitwidth !803
  %trunc_ln5 = call i16 @_ssdm_op_PartSelect.i16.i31.i32.i32(i31 %mul_ln287, i32 15, i32 30), !bitwidth !7
  %sext_ln287_1 = sext i16 %trunc_ln5 to i32, !bitwidth !401
  %sext_ln511 = sext i16 %trunc_ln5 to i31, !bitwidth !822
  %nbl_load = load i15, i15* @nbl, align 2, !bitwidth !141, !dep_idx !823, !deps !824
  %zext_ln511 = zext i15 %nbl_load to i23, !bitwidth !826
  %shl_ln3 = call i22 @_ssdm_op_BitConcatenate.i22.i15.i7(i15 %nbl_load, i7 0), !bitwidth !827
  %zext_ln511_1 = zext i22 %shl_ln3 to i23, !bitwidth !826
  %sub_ln511 = sub i23 %zext_ln511_1, %zext_ln511, !bitwidth !817
  %trunc_ln6 = call i16 @_ssdm_op_PartSelect.i16.i23.i32.i32(i23 %sub_ln511, i32 7, i32 22), !bitwidth !7
  %sext_ln512 = sext i16 %trunc_ln6 to i17, !bitwidth !828
  %wl_code_table_addr = getelementptr inbounds [16 x i13], [16 x i13]* @wl_code_table, i64 0, i64 %zext_ln287_1, !bitwidth !222
  %wl_code_table_load = load i13, i13* %wl_code_table_addr, align 2, !bitwidth !829
  %sext_ln512_1 = sext i13 %wl_code_table_load to i17, !bitwidth !828
  %add_ln512 = add nsw i17 %sext_ln512_1, %sext_ln512, !bitwidth !828
  %sext_ln509 = sext i17 %add_ln512 to i32, !bitwidth !401
  %tmp_4 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %sext_ln509, i32 31), !bitwidth !336
  %select_ln513 = select i1 %tmp_4, i17 0, i17 %add_ln512, !bitwidth !830
  %trunc_ln509 = trunc i17 %select_ln513 to i15, !bitwidth !141
  %icmp_ln515 = icmp ugt i17 %select_ln513, 18432, !bitwidth !336
  %select_ln515 = select i1 %icmp_ln515, i15 -14336, i15 %trunc_ln509, !bitwidth !141
  store i15 %select_ln515, i15* @nbl, align 2, !bitwidth !338, !dep_idx !831, !deps !832
  %wd1 = call i5 @_ssdm_op_PartSelect.i5.i15.i32.i32(i15 %select_ln515, i32 6, i32 10), !bitwidth !522
  %trunc_ln8 = call i4 @_ssdm_op_PartSelect.i4.i15.i32.i32(i15 %select_ln515, i32 11, i32 14), !bitwidth !546
  %zext_ln525 = zext i5 %wd1 to i64, !bitwidth !381
  %ilb_table_addr = getelementptr inbounds [32 x i12], [32 x i12]* @ilb_table, i64 0, i64 %zext_ln525, !bitwidth !233
  %ilb_table_load = load i12, i12* %ilb_table_addr, align 2, !bitwidth !834
  %sub_ln525 = sub i4 -7, %trunc_ln8, !bitwidth !546
  %sub_ln525cast = zext i4 %sub_ln525 to i12, !bitwidth !835
  %wd3 = lshr i12 %ilb_table_load, %sub_ln525cast, !bitwidth !834
  %shl_ln4 = call i15 @_ssdm_op_BitConcatenate.i15.i12.i3(i12 %wd3, i3 0), !bitwidth !141
  store i15 %shl_ln4, i15* @detl, align 2, !bitwidth !338, !dep_idx !836, !deps !837
  %add_ln290 = add nsw i32 %sext_ln287_1, %tmp, !bitwidth !139
  call fastcc void @upzero(i16 %trunc_ln5, [6 x i16]* @delay_dltx, [6 x i32]* @delay_bpl), !bitwidth !338, !dep_idx !839, !deps !840
  %plt1_load = load i32, i32* @plt1, align 512, !bitwidth !139, !dep_idx !842, !deps !843
  %plt2_load = load i32, i32* @plt2, align 512, !bitwidth !139, !dep_idx !845, !deps !846
  %wd2 = call i18 @_ssdm_op_BitConcatenate.i18.i16.i2(i16 %al1_load, i2 0), !bitwidth !848
  %sext_ln566 = sext i18 %wd2 to i19, !bitwidth !849
  %sext_ln570 = sext i32 %add_ln290 to i64, !bitwidth !428
  %sext_ln570_1 = sext i32 %plt1_load to i64, !bitwidth !428
  %mul_ln570 = mul nsw i64 %sext_ln570_1, %sext_ln570, !bitwidth !850
  %tmp_7 = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %mul_ln570, i32 63), !bitwidth !336
  %sub_ln571 = sub i19 0, %sext_ln566, !bitwidth !849
  %tmp_5 = call i11 @_ssdm_op_PartSelect.i11.i16.i32.i32(i16 %al1_load, i32 5, i32 15), !bitwidth !851
  %sext_ln572 = sext i11 %tmp_5 to i12, !bitwidth !852
  %tmp_6 = call i12 @_ssdm_op_PartSelect.i12.i19.i32.i32(i19 %sub_ln571, i32 7, i32 18), !bitwidth !834
  %select_ln570 = select i1 %tmp_7, i12 %sext_ln572, i12 %tmp_6, !bitwidth !834
  %sext_ln574_2 = sext i12 %select_ln570 to i17, !bitwidth !828
  %sext_ln574 = sext i32 %plt2_load to i64, !bitwidth !428
  %mul_ln574 = mul nsw i64 %sext_ln574, %sext_ln570, !bitwidth !850
  %tmp_10 = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %mul_ln574, i32 63), !bitwidth !336
  %shl_ln5 = call i22 @_ssdm_op_BitConcatenate.i22.i15.i7(i15 %al2_load, i7 0), !bitwidth !827
  %sext_ln580 = sext i22 %shl_ln5 to i23, !bitwidth !817
  %sub_ln580 = sub i23 %sext_ln580, %sext_ln479, !bitwidth !817
  %trunc_ln = call i16 @_ssdm_op_PartSelect.i16.i23.i32.i32(i23 %sub_ln580, i32 7, i32 22), !bitwidth !7
  %sext_ln580_1 = sext i16 %trunc_ln to i17, !bitwidth !828
  %select_ln580 = select i1 %tmp_10, i17 -128, i17 128, !bitwidth !243
  %add_ln580 = add i17 %sext_ln580_1, %select_ln580, !bitwidth !828
  %apl2 = add i17 %add_ln580, %sext_ln574_2, !bitwidth !828
  %icmp_ln583 = icmp sgt i17 %apl2, 12288, !bitwidth !336
  %apl2_1 = select i1 %icmp_ln583, i17 12288, i17 %apl2, !bitwidth !830
  %trunc_ln567 = trunc i17 %apl2_1 to i15, !bitwidth !141
  %icmp_ln585 = icmp slt i17 %apl2_1, -12288, !bitwidth !336
  %apl2_2 = select i1 %icmp_ln585, i15 -12288, i15 %trunc_ln567, !bitwidth !141
  store i15 %apl2_2, i15* @al2, align 2, !bitwidth !338, !dep_idx !853, !deps !854
  %shl_ln6 = call i24 @_ssdm_op_BitConcatenate.i24.i16.i8(i16 %al1_load, i8 0), !bitwidth !856
  %sext_ln597 = sext i24 %shl_ln6 to i25, !bitwidth !816
  %sub_ln597 = sub i25 %sext_ln597, %sext_ln477, !bitwidth !816
  %trunc_ln4 = call i17 @_ssdm_op_PartSelect.i17.i25.i32.i32(i25 %sub_ln597, i32 8, i32 24), !bitwidth !830
  %sext_ln599 = sext i17 %trunc_ln4 to i18, !bitwidth !857
  %select_ln599 = select i1 %tmp_7, i18 -192, i18 192, !bitwidth !250
  %apl1 = add i18 %select_ln599, %sext_ln599, !bitwidth !857
  %wd3_1 = sub i15 15360, %apl2_2, !bitwidth !141
  %zext_ln595 = zext i15 %wd3_1 to i18, !bitwidth !858
  %zext_ln595_1 = zext i15 %wd3_1 to i16, !bitwidth !859
  %icmp_ln607 = icmp sgt i18 %apl1, %zext_ln595, !bitwidth !336
  %apl1_1 = select i1 %icmp_ln607, i18 %zext_ln595, i18 %apl1, !bitwidth !848
  %trunc_ln595 = trunc i18 %apl1_1 to i16, !bitwidth !7
  %apl1_2 = sub nsw i16 0, %zext_ln595_1, !bitwidth !860
  %sext_ln609 = sext i16 %apl1_2 to i18, !bitwidth !857
  %icmp_ln609 = icmp slt i18 %apl1_1, %sext_ln609, !bitwidth !336
  %apl1_3 = select i1 %icmp_ln609, i16 %apl1_2, i16 %trunc_ln595, !bitwidth !7
  store i16 %apl1_3, i16* @al1, align 2, !bitwidth !338, !dep_idx !861, !deps !862
  %add_ln294 = add i31 %sext_ln511, %trunc_ln285, !bitwidth !803
  store i31 %rlt1_load, i31* @rlt2, align 4, !bitwidth !338, !dep_idx !864, !deps !865
  store i31 %add_ln294, i31* @rlt1, align 4, !bitwidth !338, !dep_idx !867, !deps !868
  store i32 %plt1_load, i32* @plt2, align 512, !bitwidth !338, !dep_idx !870, !deps !871
  store i32 %add_ln290, i32* @plt1, align 512, !bitwidth !338, !dep_idx !873, !deps !874
  %tmp_2 = call fastcc i32 @filtez([6 x i32]* @delay_bph, [6 x i16]* @delay_dhx), !bitwidth !139, !dep_idx !876, !deps !877
  %rh1_load = load i31, i31* @rh1, align 4, !bitwidth !803, !dep_idx !879, !deps !880
  %ah1_load = load i16, i16* @ah1, align 2, !bitwidth !7, !dep_idx !882, !deps !883
  %rh2_load = load i31, i31* @rh2, align 4, !bitwidth !803, !dep_idx !885, !deps !886
  %ah2_load = load i15, i15* @ah2, align 2, !bitwidth !141, !dep_idx !888, !deps !889
  %pl_2 = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %rh1_load, i1 false), !bitwidth !139
  %sext_ln475_3 = sext i32 %pl_2 to i47, !bitwidth !714
  %sext_ln477_1 = sext i16 %ah1_load to i25, !bitwidth !816
  %sext_ln475_4 = sext i16 %ah1_load to i47, !bitwidth !714
  %mul_ln475_1 = mul i47 %sext_ln475_4, %sext_ln475_3, !bitwidth !715
  %pl2_1 = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %rh2_load, i1 false), !bitwidth !139
  %sext_ln475_5 = sext i32 %pl2_1 to i47, !bitwidth !714
  %sext_ln479_2 = sext i15 %ah2_load to i23, !bitwidth !817
  %sext_ln479_3 = sext i15 %ah2_load to i47, !bitwidth !714
  %mul_ln479_1 = mul i47 %sext_ln479_3, %sext_ln475_5, !bitwidth !715
  %pl_3 = add i47 %mul_ln479_1, %mul_ln475_1, !bitwidth !715
  %trunc_ln480_1 = call i32 @_ssdm_op_PartSelect.i32.i47.i32.i32(i47 %pl_3, i32 15, i32 46), !bitwidth !139
  %add_ln303 = add nsw i32 %trunc_ln480_1, %tmp_2, !bitwidth !139
  %trunc_ln304 = trunc i32 %add_ln303 to i31, !bitwidth !803
  %sub_ln304 = sub nsw i32 %trunc_ln2, %add_ln303, !bitwidth !139
  %tmp_11 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %sub_ln304, i32 31), !bitwidth !336
  %select_ln305 = select i1 %tmp_11, i2 -2, i2 0, !bitwidth !891
  %deth_load = load i15, i15* @deth, align 2, !bitwidth !141, !dep_idx !892, !deps !893
  %zext_ln310 = zext i15 %deth_load to i29, !bitwidth !895
  %zext_ln310_1 = zext i15 %deth_load to i25, !bitwidth !896
  %mul_ln310 = mul i25 %zext_ln310_1, 564, !bitwidth !897
  %decis = call i13 @_ssdm_op_PartSelect.i13.i25.i32.i32(i25 %mul_ln310, i32 12, i32 24), !bitwidth !829
  %zext_ln310_2 = zext i13 %decis to i32, !bitwidth !589
  %m = sub nsw i32 0, %sub_ln304, !bitwidth !139
  %m_3 = select i1 %tmp_11, i32 %m, i32 %sub_ln304, !bitwidth !139
  %icmp_ln311 = icmp sgt i32 %m_3, %zext_ln310_2, !bitwidth !336
  %select_ln311 = select i1 %icmp_ln311, i2 -2, i2 -1, !bitwidth !891
  %add_ln314 = add i2 %select_ln311, %select_ln305, !bitwidth !891
  %tmp_1 = call i14 @_ssdm_op_Mux.ap_auto.4i14.i2(i14 -7408, i14 -1616, i14 7408, i14 1616, i2 %add_ln314), !bitwidth !898
  %sext_ln314 = sext i14 %tmp_1 to i29, !bitwidth !899
  %mul_ln314 = mul i29 %sext_ln314, %zext_ln310, !bitwidth !900
  %trunc_ln7 = call i14 @_ssdm_op_PartSelect.i14.i29.i32.i32(i29 %mul_ln314, i32 15, i32 28), !bitwidth !898
  %sext_ln314_1 = sext i14 %trunc_ln7 to i32, !bitwidth !401
  %sext_ln620_1 = sext i14 %trunc_ln7 to i16, !bitwidth !860
  %sext_ln620 = sext i14 %trunc_ln7 to i31, !bitwidth !822
  %nbh_load = load i15, i15* @nbh, align 2, !bitwidth !141, !dep_idx !901, !deps !902
  %zext_ln620 = zext i15 %nbh_load to i23, !bitwidth !826
  %shl_ln7 = call i22 @_ssdm_op_BitConcatenate.i22.i15.i7(i15 %nbh_load, i7 0), !bitwidth !827
  %zext_ln620_1 = zext i22 %shl_ln7 to i23, !bitwidth !826
  %sub_ln620 = sub i23 %zext_ln620_1, %zext_ln620, !bitwidth !817
  %wd = call i16 @_ssdm_op_PartSelect.i16.i23.i32.i32(i23 %sub_ln620, i32 7, i32 22), !bitwidth !7
  %sext_ln618 = sext i16 %wd to i17, !bitwidth !828
  %tmp_3 = call i11 @_ssdm_op_Mux.ap_auto.4i11.i2(i11 798, i11 -214, i11 798, i11 -214, i2 %add_ln314), !bitwidth !851
  %sext_ln621 = sext i11 %tmp_3 to i17, !bitwidth !828
  %add_ln621 = add nsw i17 %sext_ln618, %sext_ln621, !bitwidth !828
  %sext_ln617 = sext i17 %add_ln621 to i32, !bitwidth !401
  %tmp_12 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %sext_ln617, i32 31), !bitwidth !336
  %select_ln622 = select i1 %tmp_12, i17 0, i17 %add_ln621, !bitwidth !830
  %trunc_ln617 = trunc i17 %select_ln622 to i15, !bitwidth !141
  %icmp_ln624 = icmp ugt i17 %select_ln622, 22528, !bitwidth !336
  %select_ln624 = select i1 %icmp_ln624, i15 -10240, i15 %trunc_ln617, !bitwidth !141
  store i15 %select_ln624, i15* @nbh, align 2, !bitwidth !338, !dep_idx !904, !deps !905
  %wd1_1 = call i5 @_ssdm_op_PartSelect.i5.i15.i32.i32(i15 %select_ln624, i32 6, i32 10), !bitwidth !522
  %trunc_ln522_1 = call i4 @_ssdm_op_PartSelect.i4.i15.i32.i32(i15 %select_ln624, i32 11, i32 14), !bitwidth !546
  %zext_ln525_1 = zext i5 %wd1_1 to i64, !bitwidth !381
  %ilb_table_addr_1 = getelementptr inbounds [32 x i12], [32 x i12]* @ilb_table, i64 0, i64 %zext_ln525_1, !bitwidth !233
  %ilb_table_load_1 = load i12, i12* %ilb_table_addr_1, align 2, !bitwidth !834
  %sub_ln525_1 = sub i4 -5, %trunc_ln522_1, !bitwidth !546
  %sub_ln525_1cast = zext i4 %sub_ln525_1 to i12, !bitwidth !835
  %wd3_2 = lshr i12 %ilb_table_load_1, %sub_ln525_1cast, !bitwidth !834
  %shl_ln526_1 = call i15 @_ssdm_op_BitConcatenate.i15.i12.i3(i12 %wd3_2, i3 0), !bitwidth !141
  store i15 %shl_ln526_1, i15* @deth, align 2, !bitwidth !338, !dep_idx !907, !deps !908
  %add_ln317 = add nsw i32 %sext_ln314_1, %tmp_2, !bitwidth !139
  call fastcc void @upzero(i16 %sext_ln620_1, [6 x i16]* @delay_dhx, [6 x i32]* @delay_bph), !bitwidth !338, !dep_idx !910, !deps !911
  %ph1_load = load i32, i32* @ph1, align 512, !bitwidth !139, !dep_idx !913, !deps !914
  %ph2_load = load i32, i32* @ph2, align 512, !bitwidth !139, !dep_idx !916, !deps !917
  %wd2_1 = call i18 @_ssdm_op_BitConcatenate.i18.i16.i2(i16 %ah1_load, i2 0), !bitwidth !848
  %sext_ln566_1 = sext i18 %wd2_1 to i19, !bitwidth !849
  %sext_ln570_2 = sext i32 %add_ln317 to i64, !bitwidth !428
  %sext_ln570_3 = sext i32 %ph1_load to i64, !bitwidth !428
  %mul_ln570_1 = mul nsw i64 %sext_ln570_3, %sext_ln570_2, !bitwidth !850
  %tmp_13 = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %mul_ln570_1, i32 63), !bitwidth !336
  %sub_ln571_1 = sub i19 0, %sext_ln566_1, !bitwidth !849
  %tmp_8 = call i11 @_ssdm_op_PartSelect.i11.i16.i32.i32(i16 %ah1_load, i32 5, i32 15), !bitwidth !851
  %sext_ln572_1 = sext i11 %tmp_8 to i12, !bitwidth !852
  %tmp_9 = call i12 @_ssdm_op_PartSelect.i12.i19.i32.i32(i19 %sub_ln571_1, i32 7, i32 18), !bitwidth !834
  %select_ln570_1 = select i1 %tmp_13, i12 %sext_ln572_1, i12 %tmp_9, !bitwidth !834
  %sext_ln574_3 = sext i12 %select_ln570_1 to i17, !bitwidth !828
  %sext_ln574_1 = sext i32 %ph2_load to i64, !bitwidth !428
  %mul_ln574_1 = mul nsw i64 %sext_ln574_1, %sext_ln570_2, !bitwidth !850
  %tmp_14 = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %mul_ln574_1, i32 63), !bitwidth !336
  %shl_ln580_1 = call i22 @_ssdm_op_BitConcatenate.i22.i15.i7(i15 %ah2_load, i7 0), !bitwidth !827
  %sext_ln580_2 = sext i22 %shl_ln580_1 to i23, !bitwidth !817
  %sub_ln580_1 = sub i23 %sext_ln580_2, %sext_ln479_2, !bitwidth !817
  %trunc_ln580_1 = call i16 @_ssdm_op_PartSelect.i16.i23.i32.i32(i23 %sub_ln580_1, i32 7, i32 22), !bitwidth !7
  %sext_ln580_3 = sext i16 %trunc_ln580_1 to i17, !bitwidth !828
  %select_ln580_1 = select i1 %tmp_14, i17 -128, i17 128, !bitwidth !243
  %add_ln580_2 = add i17 %sext_ln580_3, %select_ln580_1, !bitwidth !828
  %apl2_3 = add i17 %add_ln580_2, %sext_ln574_3, !bitwidth !828
  %icmp_ln583_1 = icmp sgt i17 %apl2_3, 12288, !bitwidth !336
  %apl2_4 = select i1 %icmp_ln583_1, i17 12288, i17 %apl2_3, !bitwidth !830
  %trunc_ln567_1 = trunc i17 %apl2_4 to i15, !bitwidth !141
  %icmp_ln585_1 = icmp slt i17 %apl2_4, -12288, !bitwidth !336
  %apl2_5 = select i1 %icmp_ln585_1, i15 -12288, i15 %trunc_ln567_1, !bitwidth !141
  store i15 %apl2_5, i15* @ah2, align 2, !bitwidth !338, !dep_idx !919, !deps !920
  %shl_ln597_1 = call i24 @_ssdm_op_BitConcatenate.i24.i16.i8(i16 %ah1_load, i8 0), !bitwidth !856
  %sext_ln597_1 = sext i24 %shl_ln597_1 to i25, !bitwidth !816
  %sub_ln597_1 = sub i25 %sext_ln597_1, %sext_ln477_1, !bitwidth !816
  %trunc_ln597_1 = call i17 @_ssdm_op_PartSelect.i17.i25.i32.i32(i25 %sub_ln597_1, i32 8, i32 24), !bitwidth !830
  %sext_ln599_1 = sext i17 %trunc_ln597_1 to i18, !bitwidth !857
  %select_ln599_1 = select i1 %tmp_13, i18 -192, i18 192, !bitwidth !250
  %apl1_4 = add i18 %select_ln599_1, %sext_ln599_1, !bitwidth !857
  %wd3_3 = sub i15 15360, %apl2_5, !bitwidth !141
  %zext_ln595_2 = zext i15 %wd3_3 to i18, !bitwidth !858
  %zext_ln595_3 = zext i15 %wd3_3 to i16, !bitwidth !859
  %icmp_ln607_1 = icmp sgt i18 %apl1_4, %zext_ln595_2, !bitwidth !336
  %apl1_5 = select i1 %icmp_ln607_1, i18 %zext_ln595_2, i18 %apl1_4, !bitwidth !848
  %trunc_ln595_1 = trunc i18 %apl1_5 to i16, !bitwidth !7
  %apl1_6 = sub nsw i16 0, %zext_ln595_3, !bitwidth !860
  %sext_ln609_1 = sext i16 %apl1_6 to i18, !bitwidth !857
  %icmp_ln609_1 = icmp slt i18 %apl1_5, %sext_ln609_1, !bitwidth !336
  %apl1_7 = select i1 %icmp_ln609_1, i16 %apl1_6, i16 %trunc_ln595_1, !bitwidth !7
  store i16 %apl1_7, i16* @ah1, align 2, !bitwidth !338, !dep_idx !922, !deps !923
  %add_ln321 = add i31 %trunc_ln304, %sext_ln620, !bitwidth !803
  store i31 %rh1_load, i31* @rh2, align 4, !bitwidth !338, !dep_idx !925, !deps !926
  store i31 %add_ln321, i31* @rh1, align 4, !bitwidth !338, !dep_idx !928, !deps !929
  store i32 %ph1_load, i32* @ph2, align 512, !bitwidth !338, !dep_idx !931, !deps !932
  store i32 %add_ln317, i32* @ph1, align 512, !bitwidth !338, !dep_idx !934, !deps !935
  %or_ln = call i8 @_ssdm_op_BitConcatenate.i8.i2.i6(i2 %add_ln314, i6 %il_assign), !bitwidth !286
  ret i8 %or_ln, !bitwidth !338
}

; Function Attrs: nounwind
define internal fastcc void @decode(i8 %input) #0 {
entry:
  %idx = alloca i5, align 1, !bitwidth !513
  %xa2_2 = alloca i50, align 8, !bitwidth !595
  %xa1_2 = alloca i50, align 8, !bitwidth !595
  %i = alloca i4, align 1, !bitwidth !537
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_4), !fpga.pragma.source !382
  %input_read = call i8 @_ssdm_op_Read.ap_auto.i8(i8 %input) #0, !bitwidth !286
  %tmp = call fastcc i32 @filtez([6 x i32]* @dec_del_bpl, [6 x i16]* @dec_del_dltx), !bitwidth !139, !dep_idx !937, !deps !938
  %dec_rlt1_load = load i31, i31* @dec_rlt1, align 4, !bitwidth !803, !dep_idx !940, !deps !941
  %dec_al1_load = load i16, i16* @dec_al1, align 2, !bitwidth !7, !dep_idx !943, !deps !944
  %dec_rlt2_load = load i31, i31* @dec_rlt2, align 4, !bitwidth !803, !dep_idx !946, !deps !947
  %dec_al2_load = load i15, i15* @dec_al2, align 2, !bitwidth !141, !dep_idx !949, !deps !950
  %pl = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %dec_rlt1_load, i1 false), !bitwidth !139
  %sext_ln475 = sext i32 %pl to i47, !bitwidth !714
  %sext_ln477 = sext i16 %dec_al1_load to i25, !bitwidth !816
  %sext_ln475_6 = sext i16 %dec_al1_load to i47, !bitwidth !714
  %mul_ln475 = mul i47 %sext_ln475_6, %sext_ln475, !bitwidth !715
  %pl2 = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %dec_rlt2_load, i1 false), !bitwidth !139
  %sext_ln475_7 = sext i32 %pl2 to i47, !bitwidth !714
  %sext_ln479 = sext i15 %dec_al2_load to i23, !bitwidth !817
  %sext_ln479_4 = sext i15 %dec_al2_load to i47, !bitwidth !714
  %mul_ln479 = mul i47 %sext_ln479_4, %sext_ln475_7, !bitwidth !715
  %pl_4 = add i47 %mul_ln479, %mul_ln475, !bitwidth !715
  %trunc_ln = call i32 @_ssdm_op_PartSelect.i32.i47.i32.i32(i47 %pl_4, i32 15, i32 46), !bitwidth !139
  %add_ln344 = add nsw i32 %trunc_ln, %tmp, !bitwidth !139
  %trunc_ln345 = trunc i32 %add_ln344 to i31, !bitwidth !803
  %dec_detl_load = load i15, i15* @dec_detl, align 2, !bitwidth !141, !dep_idx !952, !deps !953
  %zext_ln345_1 = zext i15 %dec_detl_load to i31, !bitwidth !821
  %trunc_ln345_1 = call i4 @_ssdm_op_PartSelect.i4.i8.i32.i32(i8 %input_read, i32 2, i32 5), !bitwidth !546
  %zext_ln345 = zext i4 %trunc_ln345_1 to i64, !bitwidth !381
  %qq4_code4_table_addr = getelementptr inbounds [16 x i16], [16 x i16]* @qq4_code4_table, i64 0, i64 %zext_ln345, !bitwidth !160
  %qq4_code4_table_load = load i16, i16* %qq4_code4_table_addr, align 2, !bitwidth !7
  %sext_ln345 = sext i16 %qq4_code4_table_load to i31, !bitwidth !822
  %mul_ln345 = mul i31 %sext_ln345, %zext_ln345_1, !bitwidth !803
  %trunc_ln345_2 = call i16 @_ssdm_op_PartSelect.i16.i31.i32.i32(i31 %mul_ln345, i32 15, i32 30), !bitwidth !7
  %sext_ln345_1 = sext i16 %trunc_ln345_2 to i32, !bitwidth !401
  %sext_ln346_1 = sext i16 %trunc_ln345_2 to i31, !bitwidth !822
  %il_load = load i6, i6* @il, align 1, !bitwidth !594
  %zext_ln346 = zext i6 %il_load to i64, !bitwidth !381
  %qq6_code6_table_addr = getelementptr inbounds [64 x i16], [64 x i16]* @qq6_code6_table, i64 0, i64 %zext_ln346, !bitwidth !160
  %qq6_code6_table_load = load i16, i16* %qq6_code6_table_addr, align 2, !bitwidth !7
  %sext_ln346 = sext i16 %qq6_code6_table_load to i31, !bitwidth !822
  %mul_ln346 = mul i31 %sext_ln346, %zext_ln345_1, !bitwidth !803
  %trunc_ln10 = call i16 @_ssdm_op_PartSelect.i16.i31.i32.i32(i31 %mul_ln346, i32 15, i32 30), !bitwidth !7
  %sext_ln346_2 = sext i16 %trunc_ln10 to i32, !bitwidth !401
  %add_ln347 = add nsw i32 %sext_ln346_2, %add_ln344, !bitwidth !139
  %dec_nbl_load = load i15, i15* @dec_nbl, align 2, !bitwidth !141, !dep_idx !955, !deps !956
  %zext_ln511 = zext i15 %dec_nbl_load to i23, !bitwidth !826
  %shl_ln = call i22 @_ssdm_op_BitConcatenate.i22.i15.i7(i15 %dec_nbl_load, i7 0), !bitwidth !827
  %zext_ln511_2 = zext i22 %shl_ln to i23, !bitwidth !826
  %sub_ln511 = sub i23 %zext_ln511_2, %zext_ln511, !bitwidth !817
  %trunc_ln11 = call i16 @_ssdm_op_PartSelect.i16.i23.i32.i32(i23 %sub_ln511, i32 7, i32 22), !bitwidth !7
  %sext_ln512 = sext i16 %trunc_ln11 to i17, !bitwidth !828
  %wl_code_table_addr = getelementptr inbounds [16 x i13], [16 x i13]* @wl_code_table, i64 0, i64 %zext_ln345, !bitwidth !222
  %wl_code_table_load = load i13, i13* %wl_code_table_addr, align 2, !bitwidth !829
  %sext_ln512_2 = sext i13 %wl_code_table_load to i17, !bitwidth !828
  %add_ln512 = add nsw i17 %sext_ln512_2, %sext_ln512, !bitwidth !828
  %sext_ln509 = sext i17 %add_ln512 to i32, !bitwidth !401
  %tmp_16 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %sext_ln509, i32 31), !bitwidth !336
  %select_ln513 = select i1 %tmp_16, i17 0, i17 %add_ln512, !bitwidth !830
  %trunc_ln509 = trunc i17 %select_ln513 to i15, !bitwidth !141
  %icmp_ln515 = icmp ugt i17 %select_ln513, 18432, !bitwidth !336
  %select_ln515 = select i1 %icmp_ln515, i15 -14336, i15 %trunc_ln509, !bitwidth !141
  store i15 %select_ln515, i15* @dec_nbl, align 2, !bitwidth !338, !dep_idx !958, !deps !959
  %wd1 = call i5 @_ssdm_op_PartSelect.i5.i15.i32.i32(i15 %select_ln515, i32 6, i32 10), !bitwidth !522
  %trunc_ln12 = call i4 @_ssdm_op_PartSelect.i4.i15.i32.i32(i15 %select_ln515, i32 11, i32 14), !bitwidth !546
  %zext_ln525 = zext i5 %wd1 to i64, !bitwidth !381
  %ilb_table_addr = getelementptr inbounds [32 x i12], [32 x i12]* @ilb_table, i64 0, i64 %zext_ln525, !bitwidth !233
  %ilb_table_load = load i12, i12* %ilb_table_addr, align 2, !bitwidth !834
  %sub_ln525 = sub i4 -7, %trunc_ln12, !bitwidth !546
  %sub_ln525cast = zext i4 %sub_ln525 to i12, !bitwidth !835
  %wd3 = lshr i12 %ilb_table_load, %sub_ln525cast, !bitwidth !834
  %shl_ln8 = call i15 @_ssdm_op_BitConcatenate.i15.i12.i3(i12 %wd3, i3 0), !bitwidth !141
  store i15 %shl_ln8, i15* @dec_detl, align 2, !bitwidth !338, !dep_idx !961, !deps !962
  %add_ln350 = add nsw i32 %sext_ln345_1, %tmp, !bitwidth !139
  call fastcc void @upzero(i16 %trunc_ln345_2, [6 x i16]* @dec_del_dltx, [6 x i32]* @dec_del_bpl), !bitwidth !338, !dep_idx !964, !deps !965
  %dec_plt1_load = load i32, i32* @dec_plt1, align 512, !bitwidth !139, !dep_idx !967, !deps !968
  %dec_plt2_load = load i32, i32* @dec_plt2, align 512, !bitwidth !139, !dep_idx !970, !deps !971
  %wd2 = call i18 @_ssdm_op_BitConcatenate.i18.i16.i2(i16 %dec_al1_load, i2 0), !bitwidth !848
  %sext_ln566 = sext i18 %wd2 to i19, !bitwidth !849
  %sext_ln570 = sext i32 %add_ln350 to i64, !bitwidth !428
  %sext_ln570_4 = sext i32 %dec_plt1_load to i64, !bitwidth !428
  %mul_ln570 = mul nsw i64 %sext_ln570_4, %sext_ln570, !bitwidth !850
  %tmp_17 = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %mul_ln570, i32 63), !bitwidth !336
  %sub_ln571 = sub i19 0, %sext_ln566, !bitwidth !849
  %tmp_s = call i11 @_ssdm_op_PartSelect.i11.i16.i32.i32(i16 %dec_al1_load, i32 5, i32 15), !bitwidth !851
  %sext_ln572 = sext i11 %tmp_s to i12, !bitwidth !852
  %tmp_1 = call i12 @_ssdm_op_PartSelect.i12.i19.i32.i32(i19 %sub_ln571, i32 7, i32 18), !bitwidth !834
  %select_ln570 = select i1 %tmp_17, i12 %sext_ln572, i12 %tmp_1, !bitwidth !834
  %sext_ln574_4 = sext i12 %select_ln570 to i17, !bitwidth !828
  %sext_ln574 = sext i32 %dec_plt2_load to i64, !bitwidth !428
  %mul_ln574 = mul nsw i64 %sext_ln574, %sext_ln570, !bitwidth !850
  %tmp_18 = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %mul_ln574, i32 63), !bitwidth !336
  %shl_ln9 = call i22 @_ssdm_op_BitConcatenate.i22.i15.i7(i15 %dec_al2_load, i7 0), !bitwidth !827
  %sext_ln580 = sext i22 %shl_ln9 to i23, !bitwidth !817
  %sub_ln580 = sub i23 %sext_ln580, %sext_ln479, !bitwidth !817
  %trunc_ln13 = call i16 @_ssdm_op_PartSelect.i16.i23.i32.i32(i23 %sub_ln580, i32 7, i32 22), !bitwidth !7
  %sext_ln580_4 = sext i16 %trunc_ln13 to i17, !bitwidth !828
  %select_ln580 = select i1 %tmp_18, i17 -128, i17 128, !bitwidth !243
  %add_ln580 = add i17 %sext_ln580_4, %select_ln580, !bitwidth !828
  %apl2 = add i17 %add_ln580, %sext_ln574_4, !bitwidth !828
  %icmp_ln583 = icmp sgt i17 %apl2, 12288, !bitwidth !336
  %apl2_6 = select i1 %icmp_ln583, i17 12288, i17 %apl2, !bitwidth !830
  %trunc_ln567 = trunc i17 %apl2_6 to i15, !bitwidth !141
  %icmp_ln585 = icmp slt i17 %apl2_6, -12288, !bitwidth !336
  %apl2_7 = select i1 %icmp_ln585, i15 -12288, i15 %trunc_ln567, !bitwidth !141
  store i15 %apl2_7, i15* @dec_al2, align 2, !bitwidth !338, !dep_idx !973, !deps !974
  %shl_ln1 = call i24 @_ssdm_op_BitConcatenate.i24.i16.i8(i16 %dec_al1_load, i8 0), !bitwidth !856
  %sext_ln597 = sext i24 %shl_ln1 to i25, !bitwidth !816
  %sub_ln597 = sub i25 %sext_ln597, %sext_ln477, !bitwidth !816
  %trunc_ln14 = call i17 @_ssdm_op_PartSelect.i17.i25.i32.i32(i25 %sub_ln597, i32 8, i32 24), !bitwidth !830
  %sext_ln599 = sext i17 %trunc_ln14 to i18, !bitwidth !857
  %select_ln599 = select i1 %tmp_17, i18 -192, i18 192, !bitwidth !250
  %apl1 = add i18 %select_ln599, %sext_ln599, !bitwidth !857
  %wd3_4 = sub i15 15360, %apl2_7, !bitwidth !141
  %zext_ln595 = zext i15 %wd3_4 to i18, !bitwidth !858
  %zext_ln595_4 = zext i15 %wd3_4 to i16, !bitwidth !859
  %icmp_ln607 = icmp sgt i18 %apl1, %zext_ln595, !bitwidth !336
  %apl1_8 = select i1 %icmp_ln607, i18 %zext_ln595, i18 %apl1, !bitwidth !848
  %trunc_ln595 = trunc i18 %apl1_8 to i16, !bitwidth !7
  %apl1_9 = sub nsw i16 0, %zext_ln595_4, !bitwidth !860
  %sext_ln609 = sext i16 %apl1_9 to i18, !bitwidth !857
  %icmp_ln609 = icmp slt i18 %apl1_8, %sext_ln609, !bitwidth !336
  %apl1_10 = select i1 %icmp_ln609, i16 %apl1_9, i16 %trunc_ln595, !bitwidth !7
  store i16 %apl1_10, i16* @dec_al1, align 2, !bitwidth !338, !dep_idx !976, !deps !977
  %add_ln354 = add i31 %trunc_ln345, %sext_ln346_1, !bitwidth !803
  store i31 %dec_rlt1_load, i31* @dec_rlt2, align 4, !bitwidth !338, !dep_idx !979, !deps !980
  store i31 %add_ln354, i31* @dec_rlt1, align 4, !bitwidth !338, !dep_idx !982, !deps !983
  store i32 %dec_plt1_load, i32* @dec_plt2, align 512, !bitwidth !338, !dep_idx !985, !deps !986
  store i32 %add_ln350, i32* @dec_plt1, align 512, !bitwidth !338, !dep_idx !988, !deps !989
  %tmp_3 = call fastcc i32 @filtez([6 x i32]* @dec_del_bph, [6 x i16]* @dec_del_dhx), !bitwidth !139, !dep_idx !991, !deps !992
  %dec_rh1_load = load i31, i31* @dec_rh1, align 4, !bitwidth !803, !dep_idx !994, !deps !995
  %dec_ah1_load = load i16, i16* @dec_ah1, align 2, !bitwidth !7, !dep_idx !997, !deps !998
  %dec_rh2_load = load i31, i31* @dec_rh2, align 4, !bitwidth !803, !dep_idx !1000, !deps !1001
  %dec_ah2_load = load i15, i15* @dec_ah2, align 2, !bitwidth !141, !dep_idx !1003, !deps !1004
  %pl_5 = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %dec_rh1_load, i1 false), !bitwidth !139
  %sext_ln475_8 = sext i32 %pl_5 to i47, !bitwidth !714
  %sext_ln477_2 = sext i16 %dec_ah1_load to i25, !bitwidth !816
  %sext_ln475_9 = sext i16 %dec_ah1_load to i47, !bitwidth !714
  %mul_ln475_2 = mul i47 %sext_ln475_9, %sext_ln475_8, !bitwidth !715
  %pl2_2 = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %dec_rh2_load, i1 false), !bitwidth !139
  %sext_ln475_10 = sext i32 %pl2_2 to i47, !bitwidth !714
  %sext_ln479_5 = sext i15 %dec_ah2_load to i23, !bitwidth !817
  %sext_ln479_6 = sext i15 %dec_ah2_load to i47, !bitwidth !714
  %mul_ln479_2 = mul i47 %sext_ln479_6, %sext_ln475_10, !bitwidth !715
  %pl_6 = add i47 %mul_ln479_2, %mul_ln475_2, !bitwidth !715
  %trunc_ln480_2 = call i32 @_ssdm_op_PartSelect.i32.i47.i32.i32(i47 %pl_6, i32 15, i32 46), !bitwidth !139
  %dec_deth_load = load i15, i15* @dec_deth, align 2, !bitwidth !141, !dep_idx !1006, !deps !1007
  %zext_ln364 = zext i15 %dec_deth_load to i29, !bitwidth !895
  %trunc_ln15 = call i2 @_ssdm_op_PartSelect.i2.i8.i32.i32(i8 %input_read, i32 6, i32 7), !bitwidth !891
  %tmp_4 = call i14 @_ssdm_op_Mux.ap_auto.4i14.i2(i14 -7408, i14 -1616, i14 7408, i14 1616, i2 %trunc_ln15), !bitwidth !898
  %sext_ln364 = sext i14 %tmp_4 to i29, !bitwidth !899
  %mul_ln364 = mul i29 %sext_ln364, %zext_ln364, !bitwidth !900
  %trunc_ln364_1 = call i14 @_ssdm_op_PartSelect.i14.i29.i32.i32(i29 %mul_ln364, i32 15, i32 28), !bitwidth !898
  %sext_ln364_1 = sext i14 %trunc_ln364_1 to i32, !bitwidth !401
  %sext_ln620 = sext i14 %trunc_ln364_1 to i16, !bitwidth !860
  %dec_nbh_load = load i15, i15* @dec_nbh, align 2, !bitwidth !141, !dep_idx !1009, !deps !1010
  %zext_ln620 = zext i15 %dec_nbh_load to i23, !bitwidth !826
  %shl_ln2 = call i22 @_ssdm_op_BitConcatenate.i22.i15.i7(i15 %dec_nbh_load, i7 0), !bitwidth !827
  %zext_ln620_2 = zext i22 %shl_ln2 to i23, !bitwidth !826
  %sub_ln620 = sub i23 %zext_ln620_2, %zext_ln620, !bitwidth !817
  %wd = call i16 @_ssdm_op_PartSelect.i16.i23.i32.i32(i23 %sub_ln620, i32 7, i32 22), !bitwidth !7
  %sext_ln618 = sext i16 %wd to i17, !bitwidth !828
  %tmp_5 = call i11 @_ssdm_op_Mux.ap_auto.4i11.i2(i11 798, i11 -214, i11 798, i11 -214, i2 %trunc_ln15), !bitwidth !851
  %sext_ln621 = sext i11 %tmp_5 to i17, !bitwidth !828
  %add_ln621 = add nsw i17 %sext_ln618, %sext_ln621, !bitwidth !828
  %sext_ln617 = sext i17 %add_ln621 to i32, !bitwidth !401
  %tmp_19 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %sext_ln617, i32 31), !bitwidth !336
  %select_ln622 = select i1 %tmp_19, i17 0, i17 %add_ln621, !bitwidth !830
  %trunc_ln617 = trunc i17 %select_ln622 to i15, !bitwidth !141
  %icmp_ln624 = icmp ugt i17 %select_ln622, 22528, !bitwidth !336
  %select_ln624 = select i1 %icmp_ln624, i15 -10240, i15 %trunc_ln617, !bitwidth !141
  store i15 %select_ln624, i15* @dec_nbh, align 2, !bitwidth !338, !dep_idx !1012, !deps !1013
  %wd1_2 = call i5 @_ssdm_op_PartSelect.i5.i15.i32.i32(i15 %select_ln624, i32 6, i32 10), !bitwidth !522
  %trunc_ln522_2 = call i4 @_ssdm_op_PartSelect.i4.i15.i32.i32(i15 %select_ln624, i32 11, i32 14), !bitwidth !546
  %zext_ln525_2 = zext i5 %wd1_2 to i64, !bitwidth !381
  %ilb_table_addr_2 = getelementptr inbounds [32 x i12], [32 x i12]* @ilb_table, i64 0, i64 %zext_ln525_2, !bitwidth !233
  %ilb_table_load_2 = load i12, i12* %ilb_table_addr_2, align 2, !bitwidth !834
  %sub_ln525_2 = sub i4 -5, %trunc_ln522_2, !bitwidth !546
  %sub_ln525_2cast = zext i4 %sub_ln525_2 to i12, !bitwidth !835
  %wd3_5 = lshr i12 %ilb_table_load_2, %sub_ln525_2cast, !bitwidth !834
  %shl_ln526_2 = call i15 @_ssdm_op_BitConcatenate.i15.i12.i3(i12 %wd3_5, i3 0), !bitwidth !141
  store i15 %shl_ln526_2, i15* @dec_deth, align 2, !bitwidth !338, !dep_idx !1015, !deps !1016
  %add_ln367 = add nsw i32 %sext_ln364_1, %tmp_3, !bitwidth !139
  call fastcc void @upzero(i16 %sext_ln620, [6 x i16]* @dec_del_dhx, [6 x i32]* @dec_del_bph), !bitwidth !338, !dep_idx !1018, !deps !1019
  %dec_ph1_load = load i32, i32* @dec_ph1, align 512, !bitwidth !139, !dep_idx !1021, !deps !1022
  %dec_ph2_load = load i32, i32* @dec_ph2, align 512, !bitwidth !139, !dep_idx !1024, !deps !1025
  %wd2_2 = call i18 @_ssdm_op_BitConcatenate.i18.i16.i2(i16 %dec_ah1_load, i2 0), !bitwidth !848
  %sext_ln566_2 = sext i18 %wd2_2 to i19, !bitwidth !849
  %sext_ln570_5 = sext i32 %add_ln367 to i64, !bitwidth !428
  %sext_ln570_6 = sext i32 %dec_ph1_load to i64, !bitwidth !428
  %mul_ln570_2 = mul nsw i64 %sext_ln570_6, %sext_ln570_5, !bitwidth !850
  %tmp_20 = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %mul_ln570_2, i32 63), !bitwidth !336
  %sub_ln571_2 = sub i19 0, %sext_ln566_2, !bitwidth !849
  %tmp_2 = call i11 @_ssdm_op_PartSelect.i11.i16.i32.i32(i16 %dec_ah1_load, i32 5, i32 15), !bitwidth !851
  %sext_ln572_2 = sext i11 %tmp_2 to i12, !bitwidth !852
  %tmp_6 = call i12 @_ssdm_op_PartSelect.i12.i19.i32.i32(i19 %sub_ln571_2, i32 7, i32 18), !bitwidth !834
  %select_ln570_2 = select i1 %tmp_20, i12 %sext_ln572_2, i12 %tmp_6, !bitwidth !834
  %sext_ln574_5 = sext i12 %select_ln570_2 to i17, !bitwidth !828
  %sext_ln574_2 = sext i32 %dec_ph2_load to i64, !bitwidth !428
  %mul_ln574_2 = mul nsw i64 %sext_ln574_2, %sext_ln570_5, !bitwidth !850
  %tmp_21 = call i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %mul_ln574_2, i32 63), !bitwidth !336
  %shl_ln580_2 = call i22 @_ssdm_op_BitConcatenate.i22.i15.i7(i15 %dec_ah2_load, i7 0), !bitwidth !827
  %sext_ln580_5 = sext i22 %shl_ln580_2 to i23, !bitwidth !817
  %sub_ln580_2 = sub i23 %sext_ln580_5, %sext_ln479_5, !bitwidth !817
  %trunc_ln580_2 = call i16 @_ssdm_op_PartSelect.i16.i23.i32.i32(i23 %sub_ln580_2, i32 7, i32 22), !bitwidth !7
  %sext_ln580_6 = sext i16 %trunc_ln580_2 to i17, !bitwidth !828
  %select_ln580_2 = select i1 %tmp_21, i17 -128, i17 128, !bitwidth !243
  %add_ln580_5 = add i17 %sext_ln580_6, %select_ln580_2, !bitwidth !828
  %apl2_8 = add i17 %add_ln580_5, %sext_ln574_5, !bitwidth !828
  %icmp_ln583_2 = icmp sgt i17 %apl2_8, 12288, !bitwidth !336
  %apl2_9 = select i1 %icmp_ln583_2, i17 12288, i17 %apl2_8, !bitwidth !830
  %trunc_ln567_2 = trunc i17 %apl2_9 to i15, !bitwidth !141
  %icmp_ln585_2 = icmp slt i17 %apl2_9, -12288, !bitwidth !336
  %apl2_10 = select i1 %icmp_ln585_2, i15 -12288, i15 %trunc_ln567_2, !bitwidth !141
  store i15 %apl2_10, i15* @dec_ah2, align 2, !bitwidth !338, !dep_idx !1027, !deps !1028
  %shl_ln597_2 = call i24 @_ssdm_op_BitConcatenate.i24.i16.i8(i16 %dec_ah1_load, i8 0), !bitwidth !856
  %sext_ln597_2 = sext i24 %shl_ln597_2 to i25, !bitwidth !816
  %sub_ln597_2 = sub i25 %sext_ln597_2, %sext_ln477_2, !bitwidth !816
  %trunc_ln597_2 = call i17 @_ssdm_op_PartSelect.i17.i25.i32.i32(i25 %sub_ln597_2, i32 8, i32 24), !bitwidth !830
  %sext_ln599_2 = sext i17 %trunc_ln597_2 to i18, !bitwidth !857
  %select_ln599_2 = select i1 %tmp_20, i18 -192, i18 192, !bitwidth !250
  %apl1_11 = add i18 %select_ln599_2, %sext_ln599_2, !bitwidth !857
  %wd3_6 = sub i15 15360, %apl2_10, !bitwidth !141
  %zext_ln595_5 = zext i15 %wd3_6 to i18, !bitwidth !858
  %zext_ln595_6 = zext i15 %wd3_6 to i16, !bitwidth !859
  %icmp_ln607_2 = icmp sgt i18 %apl1_11, %zext_ln595_5, !bitwidth !336
  %apl1_12 = select i1 %icmp_ln607_2, i18 %zext_ln595_5, i18 %apl1_11, !bitwidth !848
  %trunc_ln595_2 = trunc i18 %apl1_12 to i16, !bitwidth !7
  %apl1_13 = sub nsw i16 0, %zext_ln595_6, !bitwidth !860
  %sext_ln609_2 = sext i16 %apl1_13 to i18, !bitwidth !857
  %icmp_ln609_2 = icmp slt i18 %apl1_12, %sext_ln609_2, !bitwidth !336
  %apl1_14 = select i1 %icmp_ln609_2, i16 %apl1_13, i16 %trunc_ln595_2, !bitwidth !7
  store i16 %apl1_14, i16* @dec_ah1, align 2, !bitwidth !338, !dep_idx !1030, !deps !1031
  %add_ln371 = add nsw i32 %add_ln367, %trunc_ln480_2, !bitwidth !139
  %trunc_ln372 = trunc i32 %add_ln371 to i31, !bitwidth !803
  store i31 %dec_rh1_load, i31* @dec_rh2, align 4, !bitwidth !338, !dep_idx !1033, !deps !1034
  store i31 %trunc_ln372, i31* @dec_rh1, align 4, !bitwidth !338, !dep_idx !1036, !deps !1037
  store i32 %dec_ph1_load, i32* @dec_ph2, align 512, !bitwidth !338, !dep_idx !1039, !deps !1040
  store i32 %add_ln367, i32* @dec_ph1, align 512, !bitwidth !338, !dep_idx !1042, !deps !1043
  %sub_ln378 = sub nsw i32 %add_ln347, %add_ln371, !bitwidth !139
  %add_ln379 = add nsw i32 %add_ln371, %add_ln347, !bitwidth !139
  %shl_ln3 = call i36 @_ssdm_op_BitConcatenate.i36.i32.i4(i32 %sub_ln378, i4 0), !bitwidth !658
  %sext_ln385 = sext i36 %shl_ln3 to i37, !bitwidth !659
  %shl_ln385_1 = call i34 @_ssdm_op_BitConcatenate.i34.i32.i2(i32 %sub_ln378, i2 0), !bitwidth !660
  %sext_ln385_1 = sext i34 %shl_ln385_1 to i37, !bitwidth !659
  %xa1 = sub i37 %sext_ln385, %sext_ln385_1, !bitwidth !659
  %sext_ln333 = sext i37 %xa1 to i50, !bitwidth !598
  %sext_ln386 = sext i32 %add_ln379 to i39, !bitwidth !664
  %xa2 = mul i39 %sext_ln386, -44, !bitwidth !665
  %sext_ln333_1 = sext i39 %xa2 to i50, !bitwidth !598
  store i4 0, i4* %i, align 1, !bitwidth !338, !dep_idx !1045, !deps !1046
  store i50 %sext_ln333, i50* %xa1_2, align 8, !bitwidth !338, !dep_idx !1049, !deps !1050
  store i50 %sext_ln333_1, i50* %xa2_2, align 8, !bitwidth !338, !dep_idx !1054, !deps !1055
  store i5 0, i5* %idx, align 1, !bitwidth !338, !dep_idx !1059, !deps !1060
  br label %for.inc, !bitwidth !338

for.inc:                                          ; preds = %for.inc.split, %entry
  %i_14 = load i4, i4* %i, align 1, !bitwidth !546, !dep_idx !1063, !deps !1064
  %icmp_ln389 = icmp eq i4 %i_14, -6, !bitwidth !336
  %i_15 = add nuw i4 %i_14, 1, !bitwidth !546
  br i1 %icmp_ln389, label %for.end, label %for.inc.split, !llvm.loop !1067, !bitwidth !338

for.inc.split:                                    ; preds = %for.inc
  %idx_load = load i5, i5* %idx, align 1, !bitwidth !522, !dep_idx !1081, !deps !1082
  %xa2_2_load_1 = load i50, i50* %xa2_2, align 8, !bitwidth !634, !dep_idx !1085, !deps !1086
  %xa1_2_load_1 = load i50, i50* %xa1_2, align 8, !bitwidth !634, !dep_idx !1089, !deps !1090
  %zext_ln389 = zext i4 %i_14 to i64, !bitwidth !381
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 10, i64 10, i64 10), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecLoopName([14 x i8]* @empty_2)
  %ad_ptr = getelementptr [11 x i32], [11 x i32]* @accumd, i64 0, i64 %zext_ln389, !bitwidth !158
  %ac_ptr = getelementptr [11 x i32], [11 x i32]* @accumc, i64 0, i64 %zext_ln389, !bitwidth !158
  %add_ln335 = add nuw i5 %idx_load, 2, !bitwidth !522
  %zext_ln335 = zext i5 %add_ln335 to i64, !bitwidth !381
  %h_ptr = getelementptr [24 x i15], [24 x i15]* @h, i64 0, i64 %zext_ln335, !bitwidth !149
  %ac_ptr_load = load i32, i32* %ac_ptr, align 4, !bitwidth !139, !dep_idx !1093, !deps !1094
  %sext_ln391 = sext i32 %ac_ptr_load to i47, !bitwidth !714
  %add_ln391 = add nuw i5 %idx_load, 3, !bitwidth !522
  %zext_ln391 = zext i5 %add_ln391 to i64, !bitwidth !381
  %h_ptr_2 = getelementptr [24 x i15], [24 x i15]* @h, i64 0, i64 %zext_ln391, !bitwidth !149
  %h_ptr_load = load i15, i15* %h_ptr, align 4, !bitwidth !141
  %sext_ln391_1 = sext i15 %h_ptr_load to i47, !bitwidth !714
  %mul_ln391 = mul i47 %sext_ln391_1, %sext_ln391, !bitwidth !715
  %sext_ln391_2 = sext i47 %mul_ln391 to i50, !bitwidth !598
  %xa1_5 = add nsw i50 %sext_ln391_2, %xa1_2_load_1, !bitwidth !634
  %ad_ptr_load = load i32, i32* %ad_ptr, align 4, !bitwidth !139, !dep_idx !1097, !deps !1098
  %sext_ln392 = sext i32 %ad_ptr_load to i47, !bitwidth !714
  %h_ptr_2_load = load i15, i15* %h_ptr_2, align 2, !bitwidth !141
  %sext_ln392_1 = sext i15 %h_ptr_2_load to i47, !bitwidth !714
  %mul_ln392 = mul i47 %sext_ln392_1, %sext_ln392, !bitwidth !715
  %sext_ln392_2 = sext i47 %mul_ln392 to i50, !bitwidth !598
  %xa2_5 = add nsw i50 %sext_ln392_2, %xa2_2_load_1, !bitwidth !634
  store i4 %i_15, i4* %i, align 1, !bitwidth !338, !dep_idx !1101, !deps !1102
  store i50 %xa1_5, i50* %xa1_2, align 8, !bitwidth !338, !dep_idx !1105, !deps !1106
  store i50 %xa2_5, i50* %xa2_2, align 8, !bitwidth !338, !dep_idx !1109, !deps !1110
  store i5 %add_ln335, i5* %idx, align 1, !bitwidth !338, !dep_idx !1113, !deps !1114
  br label %for.inc, !llvm.loop !1067, !bitwidth !338

for.end:                                          ; preds = %for.inc
  %idx121 = alloca i5, align 1, !bitwidth !513
  %i_9 = alloca i4, align 1, !bitwidth !537
  %xa2_2_load = load i50, i50* %xa2_2, align 8, !bitwidth !634, !dep_idx !1117, !deps !1118
  %xa1_2_load = load i50, i50* %xa1_2, align 8, !bitwidth !634, !dep_idx !1120, !deps !1121
  %trunc_ln389 = trunc i50 %xa2_2_load to i46, !bitwidth !1123
  %trunc_ln389_1 = trunc i50 %xa1_2_load to i46, !bitwidth !1123
  %accumc_load = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i64 0, i64 10), align 8, !bitwidth !139, !dep_idx !1124, !deps !1125
  %sext_ln395 = sext i32 %accumc_load to i39, !bitwidth !664
  %mul_ln395 = mul i39 %sext_ln395, -44, !bitwidth !665
  %sext_ln395_1 = sext i39 %mul_ln395 to i46, !bitwidth !1126
  %xa1_4 = add i46 %sext_ln395_1, %trunc_ln389_1, !bitwidth !1123
  %accumd_load = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i64 0, i64 10), align 8, !bitwidth !139, !dep_idx !1127, !deps !1128
  %shl_ln4 = call i36 @_ssdm_op_BitConcatenate.i36.i32.i4(i32 %accumd_load, i4 0), !bitwidth !658
  %sext_ln396 = sext i36 %shl_ln4 to i37, !bitwidth !659
  %shl_ln396_1 = call i34 @_ssdm_op_BitConcatenate.i34.i32.i2(i32 %accumd_load, i2 0), !bitwidth !660
  %sext_ln396_1 = sext i34 %shl_ln396_1 to i37, !bitwidth !659
  %sub_ln396 = sub i37 %sext_ln396, %sext_ln396_1, !bitwidth !659
  %sext_ln396_2 = sext i37 %sub_ln396 to i46, !bitwidth !1126
  %xa2_4 = add i46 %sext_ln396_2, %trunc_ln389, !bitwidth !1123
  %trunc_ln17 = call i32 @_ssdm_op_PartSelect.i32.i46.i32.i32(i46 %xa1_4, i32 14, i32 45), !bitwidth !139
  store i32 %trunc_ln17, i32* @xout1, align 512, !bitwidth !338
  %trunc_ln18 = call i32 @_ssdm_op_PartSelect.i32.i46.i32.i32(i46 %xa2_4, i32 14, i32 45), !bitwidth !139
  store i32 %trunc_ln18, i32* @xout2, align 512, !bitwidth !338
  store i4 0, i4* %i_9, align 1, !bitwidth !338, !dep_idx !1129, !deps !1130
  store i5 0, i5* %idx121, align 1, !bitwidth !338, !dep_idx !1133, !deps !1134
  br label %for.inc78, !bitwidth !338

for.inc78:                                        ; preds = %for.inc78.split, %for.end
  %i_16 = load i4, i4* %i_9, align 1, !bitwidth !546, !dep_idx !1137, !deps !1138
  %icmp_ln405 = icmp eq i4 %i_16, -6, !bitwidth !336
  %i_17 = add nuw i4 %i_16, 1, !bitwidth !546
  br i1 %icmp_ln405, label %for.end80, label %for.inc78.split, !llvm.loop !1141, !bitwidth !338

for.inc78.split:                                  ; preds = %for.inc78
  %idx121_load = load i5, i5* %idx121, align 1, !bitwidth !522, !dep_idx !1151, !deps !1152
  %trunc_ln405 = trunc i5 %idx121_load to i4, !bitwidth !546
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 10, i64 10, i64 10), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecLoopName([14 x i8]* @empty_3)
  %add_ln335_1 = add i4 %trunc_ln405, -6, !bitwidth !546
  %zext_ln335_1 = zext i4 %add_ln335_1 to i64, !bitwidth !381
  %ad_ptr_1 = getelementptr [11 x i32], [11 x i32]* @accumd, i64 0, i64 %zext_ln335_1, !bitwidth !158
  %add_ln335_2 = add i4 %trunc_ln405, -7, !bitwidth !546
  %zext_ln335_2 = zext i4 %add_ln335_2 to i64, !bitwidth !381
  %ac_ptr1 = getelementptr [11 x i32], [11 x i32]* @accumc, i64 0, i64 %zext_ln335_2, !bitwidth !158
  %ac_ptr_1 = getelementptr [11 x i32], [11 x i32]* @accumc, i64 0, i64 %zext_ln335_1, !bitwidth !158
  %ad_ptr1 = getelementptr [11 x i32], [11 x i32]* @accumd, i64 0, i64 %zext_ln335_2, !bitwidth !158
  %ac_ptr1_load = load i32, i32* %ac_ptr1, align 4, !bitwidth !139, !dep_idx !1155, !deps !1156
  store i32 %ac_ptr1_load, i32* %ac_ptr_1, align 4, !bitwidth !338, !dep_idx !1159, !deps !1160
  %ad_ptr1_load = load i32, i32* %ad_ptr1, align 4, !bitwidth !139, !dep_idx !1166, !deps !1167
  store i32 %ad_ptr1_load, i32* %ad_ptr_1, align 4, !bitwidth !338, !dep_idx !1169, !deps !1170
  %add_ln405 = add nsw i5 %idx121_load, -1, !bitwidth !522
  store i4 %i_17, i4* %i_9, align 1, !bitwidth !338, !dep_idx !1175, !deps !1176
  store i5 %add_ln405, i5* %idx121, align 1, !bitwidth !338, !dep_idx !1179, !deps !1180
  br label %for.inc78, !llvm.loop !1141, !bitwidth !338

for.end80:                                        ; preds = %for.inc78
  store i32 %sub_ln378, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i64 0, i64 0), align 512, !bitwidth !338, !dep_idx !1183, !deps !1184
  store i32 %add_ln379, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i64 0, i64 0), align 512, !bitwidth !338, !dep_idx !1187, !deps !1188
  ret void, !bitwidth !338
}

; Function Attrs: nounwind
define void @adpcm_main([100 x i32]* noalias %in_data, [50 x i32]* noalias %encoded, [100 x i32]* noalias %decoded) #0 {
entry:
  %i = alloca i6, align 1, !bitwidth !733
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_4), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecTopModule([11 x i8]* @empty_14), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecInterface([100 x i32]* %in_data, [10 x i8]* @empty_5, i32 0, i32 0, [1 x i8]* @empty_4, i32 -1, i32 0, [1 x i8]* @empty_4, [1 x i8]* @empty_4, [1 x i8]* @empty_4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_4, [1 x i8]* @empty_4, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([100 x i32]* %in_data), !map !1191
  call void (...) @_ssdm_op_SpecInterface([50 x i32]* %encoded, [10 x i8]* @empty_5, i32 0, i32 0, [1 x i8]* @empty_4, i32 -1, i32 0, [1 x i8]* @empty_4, [1 x i8]* @empty_4, [1 x i8]* @empty_4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_4, [1 x i8]* @empty_4, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([50 x i32]* %encoded), !map !1191
  call void (...) @_ssdm_op_SpecInterface([100 x i32]* %decoded, [10 x i8]* @empty_5, i32 0, i32 0, [1 x i8]* @empty_4, i32 -1, i32 0, [1 x i8]* @empty_4, [1 x i8]* @empty_4, [1 x i8]* @empty_4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_4, [1 x i8]* @empty_4, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([100 x i32]* %decoded), !map !1191
  call fastcc void @reset(), !bitwidth !338, !dep_idx !1192, !deps !1193
  store i6 0, i6* %i, align 1, !bitwidth !338, !dep_idx !1196, !deps !1197
  br label %for.inc, !bitwidth !338

for.inc:                                          ; preds = %for.inc.split, %entry
  %i_18 = load i6, i6* %i, align 1, !bitwidth !594, !dep_idx !1200, !deps !1201
  %icmp_ln217 = icmp eq i6 %i_18, -14, !bitwidth !336
  %add_ln217 = add nuw i6 %i_18, 1, !bitwidth !594
  br i1 %icmp_ln217, label %for.inc18.preheader, label %for.inc.split, !llvm.loop !1204, !bitwidth !338

for.inc18.preheader:                              ; preds = %for.inc
  %i_11 = alloca i6, align 1, !bitwidth !733
  store i6 0, i6* %i_11, align 1, !bitwidth !338, !dep_idx !1220, !deps !1221
  br label %for.inc18, !bitwidth !338

for.inc.split:                                    ; preds = %for.inc
  %zext_ln217 = zext i6 %i_18 to i64, !bitwidth !381
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 50, i64 50, i64 50), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecLoopName([19 x i8]* @empty_1)
  %shl_ln = call i7 @_ssdm_op_BitConcatenate.i7.i6.i1(i6 %i_18, i1 false), !bitwidth !1224
  %zext_ln219 = zext i7 %shl_ln to i64, !bitwidth !381
  %in_data_addr = getelementptr [100 x i32], [100 x i32]* %in_data, i64 0, i64 %zext_ln219, !bitwidth !158
  %in_data_load = load i32, i32* %in_data_addr, align 4, !bitwidth !139
  %or_ln219 = or i7 %shl_ln, 1, !bitwidth !1224
  %zext_ln219_1 = zext i7 %or_ln219 to i64, !bitwidth !381
  %in_data_addr_1 = getelementptr [100 x i32], [100 x i32]* %in_data, i64 0, i64 %zext_ln219_1, !bitwidth !158
  %in_data_load_1 = load i32, i32* %in_data_addr_1, align 4, !bitwidth !139
  %tmp = call fastcc i8 @encode(i32 %in_data_load, i32 %in_data_load_1), !bitwidth !286, !dep_idx !372, !deps !1225
  %zext_ln219_2 = zext i8 %tmp to i32, !bitwidth !589
  %encoded_addr = getelementptr [50 x i32], [50 x i32]* %encoded, i64 0, i64 %zext_ln217, !bitwidth !158
  store i32 %zext_ln219_2, i32* %encoded_addr, align 4, !bitwidth !338, !dep_idx !1228, !deps !1229
  store i6 %add_ln217, i6* %i, align 1, !bitwidth !338, !dep_idx !1231, !deps !1232
  br label %for.inc, !llvm.loop !1204, !bitwidth !338

for.inc18:                                        ; preds = %for.inc18.split, %for.inc18.preheader
  %i_19 = load i6, i6* %i_11, align 1, !bitwidth !594, !dep_idx !1235, !deps !1236
  %icmp_ln223 = icmp eq i6 %i_19, -14, !bitwidth !336
  %add_ln223 = add nuw i6 %i_19, 1, !bitwidth !594
  br i1 %icmp_ln223, label %for.end20, label %for.inc18.split, !llvm.loop !1239, !bitwidth !338

for.inc18.split:                                  ; preds = %for.inc18
  %zext_ln223 = zext i6 %i_19 to i64, !bitwidth !381
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 50, i64 50, i64 50), !fpga.pragma.source !382
  call void (...) @_ssdm_op_SpecLoopName([19 x i8]* @empty_13)
  %encoded_addr_1 = getelementptr [50 x i32], [50 x i32]* %encoded, i64 0, i64 %zext_ln223, !bitwidth !158
  %encoded_load = load i32, i32* %encoded_addr_1, align 4, !bitwidth !139, !dep_idx !1249, !deps !1250
  %trunc_ln225 = trunc i32 %encoded_load to i8, !bitwidth !286
  call fastcc void @decode(i8 %trunc_ln225), !bitwidth !338, !dep_idx !1252, !deps !1253
  %xout1_load = load i32, i32* @xout1, align 512, !bitwidth !139, !dep_idx !1257, !deps !1258
  %shl_ln5 = call i7 @_ssdm_op_BitConcatenate.i7.i6.i1(i6 %i_19, i1 false), !bitwidth !1224
  %zext_ln226 = zext i7 %shl_ln5 to i64, !bitwidth !381
  %decoded_addr = getelementptr [100 x i32], [100 x i32]* %decoded, i64 0, i64 %zext_ln226, !bitwidth !158
  store i32 %xout1_load, i32* %decoded_addr, align 4, !bitwidth !338
  %xout2_load = load i32, i32* @xout2, align 512, !bitwidth !139, !dep_idx !1260, !deps !1258
  %or_ln227 = or i7 %shl_ln5, 1, !bitwidth !1224
  %zext_ln227 = zext i7 %or_ln227 to i64, !bitwidth !381
  %decoded_addr_1 = getelementptr [100 x i32], [100 x i32]* %decoded, i64 0, i64 %zext_ln227, !bitwidth !158
  store i32 %xout2_load, i32* %decoded_addr_1, align 4, !bitwidth !338
  store i6 %add_ln223, i6* %i_11, align 1, !bitwidth !338, !dep_idx !1261, !deps !1262
  br label %for.inc18, !llvm.loop !1239, !bitwidth !338

for.end20:                                        ; preds = %for.inc18
  ret void, !bitwidth !338
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecTopModule(...) #0 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecPipeline(...) #0 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecLoopTripCount(...) #0 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecLoopName(...) #0 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecInterface(...) #0 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecBitsMap(...) #0 comdat {
entry:
  ret void
}

define weak i8 @_ssdm_op_Read.ap_auto.i8(i8 %0) comdat {
entry:
  ret i8 %0
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32 %0) comdat {
entry:
  ret i32 %0
}

define weak i16 @_ssdm_op_Read.ap_auto.i16(i16 %0) comdat {
entry:
  ret i16 %0
}

define weak i15 @_ssdm_op_Read.ap_auto.i15(i15 %0) comdat {
entry:
  ret i15 %0
}

; Function Attrs: nounwind readnone
define weak i5 @_ssdm_op_PartSelect.i5.i15.i32.i32(i15 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i15 @llvm.part.select.i15(i15 %0, i32 %1, i32 %2)
  %empty_47 = trunc i15 %empty to i5
  ret i5 %empty_47
}

; Function Attrs: nounwind readnone
define weak i4 @_ssdm_op_PartSelect.i4.i8.i32.i32(i8 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i8 @llvm.part.select.i8(i8 %0, i32 %1, i32 %2)
  %empty_48 = trunc i8 %empty to i4
  ret i4 %empty_48
}

; Function Attrs: nounwind readnone
define weak i4 @_ssdm_op_PartSelect.i4.i6.i32.i32(i6 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i6 @llvm.part.select.i6(i6 %0, i32 %1, i32 %2)
  %empty_49 = trunc i6 %empty to i4
  ret i4 %empty_49
}

; Function Attrs: nounwind readnone
define weak i4 @_ssdm_op_PartSelect.i4.i15.i32.i32(i15 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i15 @llvm.part.select.i15(i15 %0, i32 %1, i32 %2)
  %empty_50 = trunc i15 %empty to i4
  ret i4 %empty_50
}

; Function Attrs: nounwind readnone
define weak i32 @_ssdm_op_PartSelect.i32.i50.i32.i32(i50 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i50 @llvm.part.select.i50(i50 %0, i32 %1, i32 %2)
  %empty_51 = trunc i50 %empty to i32
  ret i32 %empty_51
}

; Function Attrs: nounwind readnone
define weak i32 @_ssdm_op_PartSelect.i32.i47.i32.i32(i47 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i47 @llvm.part.select.i47(i47 %0, i32 %1, i32 %2)
  %empty_52 = trunc i47 %empty to i32
  ret i32 %empty_52
}

; Function Attrs: nounwind readnone
define weak i32 @_ssdm_op_PartSelect.i32.i46.i32.i32(i46 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i46 @llvm.part.select.i46(i46 %0, i32 %1, i32 %2)
  %empty_53 = trunc i46 %empty to i32
  ret i32 %empty_53
}

; Function Attrs: nounwind readnone
define weak i32 @_ssdm_op_PartSelect.i32.i40.i32.i32(i40 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i40 @llvm.part.select.i40(i40 %0, i32 %1, i32 %2)
  %empty_54 = trunc i40 %empty to i32
  ret i32 %empty_54
}

; Function Attrs: nounwind readnone
define weak i2 @_ssdm_op_PartSelect.i2.i8.i32.i32(i8 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i8 @llvm.part.select.i8(i8 %0, i32 %1, i32 %2)
  %empty_55 = trunc i8 %empty to i2
  ret i2 %empty_55
}

; Function Attrs: nounwind readnone
define weak i17 @_ssdm_op_PartSelect.i17.i25.i32.i32(i25 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i25 @llvm.part.select.i25(i25 %0, i32 %1, i32 %2)
  %empty_56 = trunc i25 %empty to i17
  ret i17 %empty_56
}

; Function Attrs: nounwind readnone
define weak i16 @_ssdm_op_PartSelect.i16.i31.i32.i32(i31 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i31 @llvm.part.select.i31(i31 %0, i32 %1, i32 %2)
  %empty_57 = trunc i31 %empty to i16
  ret i16 %empty_57
}

; Function Attrs: nounwind readnone
define weak i16 @_ssdm_op_PartSelect.i16.i23.i32.i32(i23 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i23 @llvm.part.select.i23(i23 %0, i32 %1, i32 %2)
  %empty_58 = trunc i23 %empty to i16
  ret i16 %empty_58
}

; Function Attrs: nounwind readnone
define weak i15 @_ssdm_op_PartSelect.i15.i30.i32.i32(i30 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i30 @llvm.part.select.i30(i30 %0, i32 %1, i32 %2)
  %empty_59 = trunc i30 %empty to i15
  ret i15 %empty_59
}

; Function Attrs: nounwind readnone
define weak i14 @_ssdm_op_PartSelect.i14.i29.i32.i32(i29 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i29 @llvm.part.select.i29(i29 %0, i32 %1, i32 %2)
  %empty_60 = trunc i29 %empty to i14
  ret i14 %empty_60
}

; Function Attrs: nounwind readnone
define weak i13 @_ssdm_op_PartSelect.i13.i25.i32.i32(i25 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i25 @llvm.part.select.i25(i25 %0, i32 %1, i32 %2)
  %empty_61 = trunc i25 %empty to i13
  ret i13 %empty_61
}

; Function Attrs: nounwind readnone
define weak i12 @_ssdm_op_PartSelect.i12.i19.i32.i32(i19 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i19 @llvm.part.select.i19(i19 %0, i32 %1, i32 %2)
  %empty_62 = trunc i19 %empty to i12
  ret i12 %empty_62
}

; Function Attrs: nounwind readnone
define weak i11 @_ssdm_op_PartSelect.i11.i16.i32.i32(i16 %0, i32 %1, i32 %2) #1 comdat {
entry:
  %empty = call i16 @llvm.part.select.i16(i16 %0, i32 %1, i32 %2)
  %empty_63 = trunc i16 %empty to i11
  ret i11 %empty_63
}

; Function Attrs: nounwind readnone
define weak i14 @_ssdm_op_Mux.ap_auto.4i14.i2(i14 %0, i14 %1, i14 %2, i14 %3, i2 %4) #1 comdat {
entry:
  switch i2 %4, label %case3 [
    i2 0, label %case0
    i2 1, label %case1
    i2 -2, label %case2
  ]

case0:                                            ; preds = %case3, %case2, %case1, %entry
  %merge = phi i14 [ %0, %entry ], [ %1, %case1 ], [ %2, %case2 ], [ %3, %case3 ]
  ret i14 %merge

case1:                                            ; preds = %entry
  br label %case0

case2:                                            ; preds = %entry
  br label %case0

case3:                                            ; preds = %entry
  br label %case0
}

; Function Attrs: nounwind readnone
define weak i11 @_ssdm_op_Mux.ap_auto.4i11.i2(i11 %0, i11 %1, i11 %2, i11 %3, i2 %4) #1 comdat {
entry:
  switch i2 %4, label %case3 [
    i2 0, label %case0
    i2 1, label %case1
    i2 -2, label %case2
  ]

case0:                                            ; preds = %case3, %case2, %case1, %entry
  %merge = phi i11 [ %0, %entry ], [ %1, %case1 ], [ %2, %case2 ], [ %3, %case3 ]
  ret i11 %merge

case1:                                            ; preds = %entry
  br label %case0

case2:                                            ; preds = %entry
  br label %case0

case3:                                            ; preds = %entry
  br label %case0
}

; Function Attrs: nounwind readnone
define weak i1 @_ssdm_op_BitSelect.i1.i64.i32(i64 %0, i32 %1) #1 comdat {
entry:
  %empty = zext i32 %1 to i64
  %empty_64 = shl i64 1, %empty
  %empty_65 = and i64 %0, %empty_64
  %empty_66 = icmp ne i64 %empty_65, 0
  ret i1 %empty_66
}

; Function Attrs: nounwind readnone
define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %0, i32 %1) #1 comdat {
entry:
  %empty = shl i32 1, %1
  %empty_67 = and i32 %0, %empty
  %empty_68 = icmp ne i32 %empty_67, 0
  ret i1 %empty_68
}

; Function Attrs: nounwind readnone
define weak i8 @_ssdm_op_BitConcatenate.i8.i2.i6(i2 %0, i6 %1) #1 comdat {
entry:
  %empty = zext i2 %0 to i8
  %empty_69 = zext i6 %1 to i8
  %empty_70 = shl i8 %empty, 6
  %empty_71 = or i8 %empty_70, %empty_69
  ret i8 %empty_71
}

; Function Attrs: nounwind readnone
define weak i7 @_ssdm_op_BitConcatenate.i7.i6.i1(i6 %0, i1 %1) #1 comdat {
entry:
  %empty = zext i6 %0 to i7
  %empty_72 = zext i1 %1 to i7
  %empty_73 = shl i7 %empty, 1
  %empty_74 = or i7 %empty_73, %empty_72
  ret i7 %empty_74
}

; Function Attrs: nounwind readnone
define weak i40 @_ssdm_op_BitConcatenate.i40.i32.i8(i32 %0, i8 %1) #1 comdat {
entry:
  %empty = zext i32 %0 to i40
  %empty_75 = zext i8 %1 to i40
  %empty_76 = shl i40 %empty, 8
  %empty_77 = or i40 %empty_76, %empty_75
  ret i40 %empty_77
}

; Function Attrs: nounwind readnone
define weak i36 @_ssdm_op_BitConcatenate.i36.i32.i4(i32 %0, i4 %1) #1 comdat {
entry:
  %empty = zext i32 %0 to i36
  %empty_78 = zext i4 %1 to i36
  %empty_79 = shl i36 %empty, 4
  %empty_80 = or i36 %empty_79, %empty_78
  ret i36 %empty_80
}

; Function Attrs: nounwind readnone
define weak i34 @_ssdm_op_BitConcatenate.i34.i32.i2(i32 %0, i2 %1) #1 comdat {
entry:
  %empty = zext i32 %0 to i34
  %empty_81 = zext i2 %1 to i34
  %empty_82 = shl i34 %empty, 2
  %empty_83 = or i34 %empty_82, %empty_81
  ret i34 %empty_83
}

; Function Attrs: nounwind readnone
define weak i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %0, i1 %1) #1 comdat {
entry:
  %empty = zext i31 %0 to i32
  %empty_84 = zext i1 %1 to i32
  %empty_85 = shl i32 %empty, 1
  %empty_86 = or i32 %empty_85, %empty_84
  ret i32 %empty_86
}

; Function Attrs: nounwind readnone
define weak i24 @_ssdm_op_BitConcatenate.i24.i16.i8(i16 %0, i8 %1) #1 comdat {
entry:
  %empty = zext i16 %0 to i24
  %empty_87 = zext i8 %1 to i24
  %empty_88 = shl i24 %empty, 8
  %empty_89 = or i24 %empty_88, %empty_87
  ret i24 %empty_89
}

; Function Attrs: nounwind readnone
define weak i22 @_ssdm_op_BitConcatenate.i22.i15.i7(i15 %0, i7 %1) #1 comdat {
entry:
  %empty = zext i15 %0 to i22
  %empty_90 = zext i7 %1 to i22
  %empty_91 = shl i22 %empty, 7
  %empty_92 = or i22 %empty_91, %empty_90
  ret i22 %empty_92
}

; Function Attrs: nounwind readnone
define weak i18 @_ssdm_op_BitConcatenate.i18.i16.i2(i16 %0, i2 %1) #1 comdat {
entry:
  %empty = zext i16 %0 to i18
  %empty_93 = zext i2 %1 to i18
  %empty_94 = shl i18 %empty, 2
  %empty_95 = or i18 %empty_94, %empty_93
  ret i18 %empty_95
}

; Function Attrs: nounwind readnone
define weak i15 @_ssdm_op_BitConcatenate.i15.i12.i3(i12 %0, i3 %1) #1 comdat {
entry:
  %empty = zext i12 %0 to i15
  %empty_96 = zext i3 %1 to i15
  %empty_97 = shl i15 %empty, 3
  %empty_98 = or i15 %empty_97, %empty_96
  ret i15 %empty_98
}

attributes #0 = { nounwind }
attributes #1 = { nounwind readnone }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!blackbox_cfg = !{!1}
!llvm.module.flags = !{!2, !3}
!llvm.map.gv = !{}
!bitwidth_g = !{!4, !57, !136, !155, !165, !283, !320}

!0 = !{!"clang version 7.0.0 "}
!1 = !{}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"reflow.full.lowering", i32 1}
!4 = !{void (i16, [6 x i16]*, [6 x i32]*)* @upzero, !5}
!5 = !{!6, !8, !10, !12, !14, !15, !17, !19, !21, !23, !25, !26, !28, !29, !31, !33, !35, !36, !37, !39, !41, !43, !44, !46, !47, !48, !49, !50, !51, !52, !53, !8, !54, !55, !56}
!6 = !{!"Arg", i32 0, !7}
!7 = !{i32 16, i32 16, i32 0, i32 2}
!8 = !{!"Arg", i32 1, !9}
!9 = !{i32 0, i32 0, i32 16, i32 1}
!10 = !{!"Arg", i32 2, !11}
!11 = !{i32 0, i32 0, i32 32, i32 1}
!12 = !{i32 0, !13}
!13 = !{i32 1, i32 32, i32 0, i32 0}
!14 = !{i32 1, !13}
!15 = !{[1 x i8]* @empty_4, !16}
!16 = !{i32 0, i32 0, i32 8, i32 2}
!17 = !{i64 0, !18}
!18 = !{i32 1, i32 64, i32 0, i32 0}
!19 = !{i16 0, !20}
!20 = !{i32 1, i32 16, i32 0, i32 0}
!21 = !{i3 0, !22}
!22 = !{i32 1, i32 3, i32 0, i32 0}
!23 = !{i3 -2, !24}
!24 = !{i32 2, i32 3, i32 0, i32 1}
!25 = !{i3 1, !22}
!26 = !{i64 6, !27}
!27 = !{i32 4, i32 64, i32 0, i32 1}
!28 = !{[15 x i8]* @empty_0, !16}
!29 = !{i8 0, !30}
!30 = !{i32 1, i32 8, i32 0, i32 0}
!31 = !{i32 8, !32}
!32 = !{i32 5, i32 32, i32 0, i32 1}
!33 = !{i32 39, !34}
!34 = !{i32 7, i32 32, i32 0, i32 1}
!35 = !{[15 x i8]* @empty, !16}
!36 = !{i32 63, !34}
!37 = !{i32 -128, !38}
!38 = !{i32 8, i32 32, i32 0, i32 1}
!39 = !{i32 128, !40}
!40 = !{i32 9, i32 32, i32 0, i32 1}
!41 = !{i64 4, !42}
!42 = !{i32 4, i32 64, i32 0, i32 0}
!43 = !{i64 5, !42}
!44 = !{i64 3, !45}
!45 = !{i32 3, i32 64, i32 0, i32 0}
!46 = !{i64 2, !45}
!47 = !{i64 1, !18}
!48 = !{[6 x i32]* @delay_bpl, !11}
!49 = !{!"Arg", i32 0, !11}
!50 = !{[6 x i32]* @delay_bph, !11}
!51 = !{[6 x i32]* @dec_del_bpl, !11}
!52 = !{[6 x i32]* @dec_del_bph, !11}
!53 = !{[6 x i16]* @delay_dltx, !9}
!54 = !{[6 x i16]* @delay_dhx, !9}
!55 = !{[6 x i16]* @dec_del_dltx, !9}
!56 = !{[6 x i16]* @dec_del_dhx, !9}
!57 = !{void ()* @reset, !58}
!58 = !{!14, !12, !15, !59, !61, !63, !64, !66, !67, !68, !70, !72, !73, !75, !76, !78, !19, !80, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !21, !23, !25, !26, !104, !105, !17, !106, !107, !108, !109, !111, !112, !113, !114, !115, !116, !118, !119, !121, !123, !124, !125, !127, !128, !130, !131, !132, !133, !133, !134, !135}
!59 = !{i15 32, !60}
!60 = !{i32 7, i32 15, i32 0, i32 1}
!61 = !{i15* @dec_detl, !62}
!62 = !{i32 0, i32 0, i32 15, i32 1}
!63 = !{i15* @detl, !62}
!64 = !{i15 8, !65}
!65 = !{i32 5, i32 15, i32 0, i32 1}
!66 = !{i15* @dec_deth, !62}
!67 = !{i15* @deth, !62}
!68 = !{i31 0, !69}
!69 = !{i32 1, i32 31, i32 0, i32 0}
!70 = !{i31* @rlt2, !71}
!71 = !{i32 0, i32 0, i32 31, i32 0}
!72 = !{i31* @rlt1, !71}
!73 = !{i32* @plt2, !74}
!74 = !{i32 0, i32 0, i32 32, i32 0}
!75 = !{i32* @plt1, !74}
!76 = !{i15 0, !77}
!77 = !{i32 1, i32 15, i32 0, i32 0}
!78 = !{i15* @al2, !79}
!79 = !{i32 0, i32 0, i32 15, i32 0}
!80 = !{i16* @al1, !81}
!81 = !{i32 0, i32 0, i32 16, i32 0}
!82 = !{i15* @nbl, !79}
!83 = !{i31* @rh2, !71}
!84 = !{i31* @rh1, !71}
!85 = !{i32* @ph2, !74}
!86 = !{i32* @ph1, !74}
!87 = !{i15* @ah2, !79}
!88 = !{i16* @ah1, !81}
!89 = !{i15* @nbh, !79}
!90 = !{i31* @dec_rlt2, !71}
!91 = !{i31* @dec_rlt1, !71}
!92 = !{i32* @dec_plt2, !74}
!93 = !{i32* @dec_plt1, !74}
!94 = !{i15* @dec_al2, !79}
!95 = !{i16* @dec_al1, !81}
!96 = !{i15* @dec_nbl, !79}
!97 = !{i31* @dec_rh2, !71}
!98 = !{i31* @dec_rh1, !71}
!99 = !{i32* @dec_ph2, !74}
!100 = !{i32* @dec_ph1, !74}
!101 = !{i15* @dec_ah2, !79}
!102 = !{i16* @dec_ah1, !81}
!103 = !{i15* @dec_nbh, !79}
!104 = !{[13 x i8]* @empty_10, !16}
!105 = !{[6 x i16]* @delay_dltx, !81}
!106 = !{[6 x i16]* @delay_dhx, !81}
!107 = !{[6 x i16]* @dec_del_dltx, !81}
!108 = !{[6 x i16]* @dec_del_dhx, !81}
!109 = !{i5 0, !110}
!110 = !{i32 1, i32 5, i32 0, i32 0}
!111 = !{[13 x i8]* @empty_9, !16}
!112 = !{[6 x i32]* @delay_bpl, !74}
!113 = !{[6 x i32]* @delay_bph, !74}
!114 = !{[6 x i32]* @dec_del_bpl, !74}
!115 = !{[6 x i32]* @dec_del_bph, !74}
!116 = !{i5 -8, !117}
!117 = !{i32 4, i32 5, i32 0, i32 1}
!118 = !{i5 1, !110}
!119 = !{i4 0, !120}
!120 = !{i32 1, i32 4, i32 0, i32 0}
!121 = !{i64 24, !122}
!122 = !{i32 6, i32 64, i32 0, i32 1}
!123 = !{[13 x i8]* @empty_15, !16}
!124 = !{[24 x i32]* @tqmf, !74}
!125 = !{i4 -5, !126}
!126 = !{i32 4, i32 4, i32 0, i32 1}
!127 = !{i4 1, !120}
!128 = !{i64 11, !129}
!129 = !{i32 5, i32 64, i32 0, i32 1}
!130 = !{[13 x i8]* @empty_6, !16}
!131 = !{[11 x i32]* @accumc, !74}
!132 = !{[11 x i32]* @accumd, !74}
!133 = !{!"Arg", i32 1, !81}
!134 = !{!"Arg", i32 2, !74}
!135 = !{!"Arg", i32 0, !74}
!136 = !{i6 (i32, i15)* @quantl, !137}
!137 = !{!138, !140, !14, !12, !15, !142, !109, !144, !118, !146, !147, !148, !17, !150, !151, !152, !154}
!138 = !{!"Arg", i32 0, !139}
!139 = !{i32 32, i32 32, i32 0, i32 2}
!140 = !{!"Arg", i32 1, !141}
!141 = !{i32 15, i32 15, i32 0, i32 2}
!142 = !{i32 31, !143}
!143 = !{i32 6, i32 32, i32 0, i32 1}
!144 = !{i5 -2, !145}
!145 = !{i32 2, i32 5, i32 0, i32 1}
!146 = !{i64 30, !122}
!147 = !{[14 x i8]* @empty_11, !16}
!148 = !{[30 x i15]* @decis_levl, !149}
!149 = !{i32 0, i32 0, i32 15, i32 2}
!150 = !{i32 15, !32}
!151 = !{i32 29, !143}
!152 = !{[31 x i6]* @quant26bt_pos, !153}
!153 = !{i32 0, i32 0, i32 6, i32 2}
!154 = !{[31 x i6]* @quant26bt_neg, !153}
!155 = !{i32 ([6 x i32]*, [6 x i16]*)* @filtez, !156}
!156 = !{!157, !159, !14, !12, !15, !17, !25, !23, !161, !162, !163, !164}
!157 = !{!"Arg", i32 0, !158}
!158 = !{i32 0, i32 0, i32 32, i32 2}
!159 = !{!"Arg", i32 1, !160}
!160 = !{i32 0, i32 0, i32 16, i32 2}
!161 = !{i64 5, !27}
!162 = !{[14 x i8]* @empty_12, !16}
!163 = !{i32 14, !32}
!164 = !{i32 45, !34}
!165 = !{i8 (i32, i32)* @encode, !166}
!166 = !{!138, !167, !14, !12, !15, !168, !17, !169, !119, !170, !172, !174, !175, !109, !177, !127, !178, !179, !180, !182, !183, !184, !185, !186, !188, !189, !191, !118, !193, !194, !195, !196, !150, !198, !199, !200, !201, !203, !204, !205, !206, !208, !209, !210, !212, !214, !215, !216, !217, !219, !220, !221, !142, !223, !225, !227, !229, !230, !231, !163, !232, !234, !21, !235, !236, !36, !237, !239, !240, !242, !244, !246, !247, !29, !31, !248, !249, !251, !252, !19, !253, !254, !255, !256, !257, !258, !259, !261, !262, !264, !265, !267, !269, !271, !272, !273, !274, !275, !277, !279, !280, !125, !281, !282}
!167 = !{!"Arg", i32 1, !139}
!168 = !{[24 x i32]* @tqmf, !11}
!169 = !{i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i64 0, i64 0), !158}
!170 = !{i2 0, !171}
!171 = !{i32 1, i32 2, i32 0, i32 0}
!172 = !{i64 1, !173}
!173 = !{i32 2, i32 64, i32 0, i32 0}
!174 = !{i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i64 0, i64 1), !158}
!175 = !{i39 -44, !176}
!176 = !{i32 7, i32 39, i32 0, i32 1}
!177 = !{i4 -6, !126}
!178 = !{i64 10, !129}
!179 = !{[14 x i8]* @empty_7, !16}
!180 = !{i5 2, !181}
!181 = !{i32 3, i32 5, i32 0, i32 1}
!182 = !{[24 x i15]* @h, !149}
!183 = !{i5 3, !181}
!184 = !{i64 22, !122}
!185 = !{i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i64 0, i64 22), !158}
!186 = !{i64 23, !187}
!187 = !{i32 6, i32 64, i32 0, i32 0}
!188 = !{i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i64 0, i64 23), !158}
!189 = !{i6 0, !190}
!190 = !{i32 1, i32 6, i32 0, i32 0}
!191 = !{i5 -10, !192}
!192 = !{i32 5, i32 5, i32 0, i32 1}
!193 = !{[14 x i8]* @empty_8, !16}
!194 = !{i5 -11, !192}
!195 = !{i5 -9, !192}
!196 = !{i6 -1, !197}
!197 = !{i32 1, i32 6, i32 0, i32 1}
!198 = !{i32 46, !34}
!199 = !{[6 x i32]* @delay_bpl, !158}
!200 = !{[6 x i16]* @delay_dltx, !160}
!201 = !{i31* @rlt1, !202}
!202 = !{i32 0, i32 0, i32 31, i32 2}
!203 = !{i16* @al1, !9}
!204 = !{i31* @rlt2, !202}
!205 = !{i15* @al2, !149}
!206 = !{i1 false, !207}
!207 = !{i32 1, i32 1, i32 0, i32 0}
!208 = !{i15* @detl, !149}
!209 = !{i6* @il, !153}
!210 = !{i32 2, !211}
!211 = !{i32 3, i32 32, i32 0, i32 1}
!212 = !{i32 5, !213}
!213 = !{i32 4, i32 32, i32 0, i32 1}
!214 = !{[16 x i16]* @qq4_code4_table, !160}
!215 = !{i32 30, !143}
!216 = !{i15* @nbl, !149}
!217 = !{i7 0, !218}
!218 = !{i32 1, i32 7, i32 0, i32 0}
!219 = !{i32 7, !213}
!220 = !{i32 22, !143}
!221 = !{[16 x i13]* @wl_code_table, !222}
!222 = !{i32 0, i32 0, i32 13, i32 2}
!223 = !{i17 0, !224}
!224 = !{i32 1, i32 17, i32 0, i32 0}
!225 = !{i17 18432, !226}
!226 = !{i32 16, i32 17, i32 0, i32 0}
!227 = !{i15 -14336, !228}
!228 = !{i32 15, i32 15, i32 0, i32 1}
!229 = !{i32 6, !213}
!230 = !{i32 10, !32}
!231 = !{i32 11, !32}
!232 = !{[32 x i12]* @ilb_table, !233}
!233 = !{i32 0, i32 0, i32 12, i32 2}
!234 = !{i4 -7, !126}
!235 = !{i32* @plt1, !11}
!236 = !{i32* @plt2, !11}
!237 = !{i19 0, !238}
!238 = !{i32 1, i32 19, i32 0, i32 0}
!239 = !{i32 18, !143}
!240 = !{i17 -128, !241}
!241 = !{i32 8, i32 17, i32 0, i32 1}
!242 = !{i17 128, !243}
!243 = !{i32 9, i32 17, i32 0, i32 1}
!244 = !{i17 12288, !245}
!245 = !{i32 15, i32 17, i32 0, i32 1}
!246 = !{i17 -12288, !245}
!247 = !{i15 -12288, !228}
!248 = !{i32 24, !143}
!249 = !{i18 -192, !250}
!250 = !{i32 9, i32 18, i32 0, i32 1}
!251 = !{i18 192, !250}
!252 = !{i15 15360, !228}
!253 = !{[6 x i32]* @delay_bph, !158}
!254 = !{[6 x i16]* @delay_dhx, !160}
!255 = !{i31* @rh1, !202}
!256 = !{i16* @ah1, !9}
!257 = !{i31* @rh2, !202}
!258 = !{i15* @ah2, !149}
!259 = !{i2 -2, !260}
!260 = !{i32 2, i32 2, i32 0, i32 1}
!261 = !{i15* @deth, !149}
!262 = !{i25 564, !263}
!263 = !{i32 11, i32 25, i32 0, i32 1}
!264 = !{i32 12, !32}
!265 = !{i2 -1, !266}
!266 = !{i32 1, i32 2, i32 0, i32 1}
!267 = !{i14 -7408, !268}
!268 = !{i32 14, i32 14, i32 0, i32 1}
!269 = !{i14 -1616, !270}
!270 = !{i32 12, i32 14, i32 0, i32 1}
!271 = !{i14 7408, !268}
!272 = !{i14 1616, !270}
!273 = !{i32 28, !143}
!274 = !{i15* @nbh, !149}
!275 = !{i11 798, !276}
!276 = !{i32 11, i32 11, i32 0, i32 1}
!277 = !{i11 -214, !278}
!278 = !{i32 9, i32 11, i32 0, i32 1}
!279 = !{i17 22528, !226}
!280 = !{i15 -10240, !228}
!281 = !{i32* @ph1, !11}
!282 = !{i32* @ph2, !11}
!283 = !{void (i8)* @decode, !284}
!284 = !{!285, !14, !12, !15, !287, !288, !289, !290, !291, !292, !206, !150, !198, !293, !210, !212, !214, !17, !215, !209, !294, !295, !217, !219, !220, !221, !142, !223, !225, !227, !229, !230, !231, !163, !232, !234, !21, !296, !297, !170, !36, !237, !239, !240, !242, !244, !246, !247, !29, !31, !248, !249, !251, !252, !19, !298, !299, !300, !301, !302, !303, !304, !267, !269, !271, !272, !273, !305, !275, !277, !279, !280, !125, !306, !307, !119, !175, !109, !177, !127, !178, !308, !309, !310, !180, !182, !183, !311, !312, !164, !313, !314, !315, !316, !318, !319}
!285 = !{!"Arg", i32 0, !286}
!286 = !{i32 8, i32 8, i32 0, i32 2}
!287 = !{[6 x i32]* @dec_del_bpl, !158}
!288 = !{[6 x i16]* @dec_del_dltx, !160}
!289 = !{i31* @dec_rlt1, !202}
!290 = !{i16* @dec_al1, !9}
!291 = !{i31* @dec_rlt2, !202}
!292 = !{i15* @dec_al2, !149}
!293 = !{i15* @dec_detl, !149}
!294 = !{[64 x i16]* @qq6_code6_table, !160}
!295 = !{i15* @dec_nbl, !149}
!296 = !{i32* @dec_plt1, !11}
!297 = !{i32* @dec_plt2, !11}
!298 = !{[6 x i32]* @dec_del_bph, !158}
!299 = !{[6 x i16]* @dec_del_dhx, !160}
!300 = !{i31* @dec_rh1, !202}
!301 = !{i16* @dec_ah1, !9}
!302 = !{i31* @dec_rh2, !202}
!303 = !{i15* @dec_ah2, !149}
!304 = !{i15* @dec_deth, !149}
!305 = !{i15* @dec_nbh, !149}
!306 = !{i32* @dec_ph1, !11}
!307 = !{i32* @dec_ph2, !11}
!308 = !{[14 x i8]* @empty_2, !16}
!309 = !{[11 x i32]* @accumd, !11}
!310 = !{[11 x i32]* @accumc, !11}
!311 = !{i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i64 0, i64 10), !158}
!312 = !{i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i64 0, i64 10), !158}
!313 = !{i32* @xout1, !158}
!314 = !{i32* @xout2, !158}
!315 = !{[14 x i8]* @empty_3, !16}
!316 = !{i5 -1, !317}
!317 = !{i32 1, i32 5, i32 0, i32 1}
!318 = !{i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i64 0, i64 0), !158}
!319 = !{i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i64 0, i64 0), !158}
!320 = !{void ([100 x i32]*, [50 x i32]*, [100 x i32]*)* @adpcm_main, !321}
!321 = !{!157, !322, !323, !14, !12, !15, !324, !325, !326, !189, !328, !330, !331, !333, !206, !17, !334, !335, !313, !314}
!322 = !{!"Arg", i32 1, !158}
!323 = !{!"Arg", i32 2, !158}
!324 = !{[11 x i8]* @empty_14, !16}
!325 = !{[10 x i8]* @empty_5, !16}
!326 = !{i32 -1, !327}
!327 = !{i32 1, i32 32, i32 0, i32 1}
!328 = !{i6 -14, !329}
!329 = !{i32 5, i32 6, i32 0, i32 1}
!330 = !{i6 1, !190}
!331 = !{i64 50, !332}
!332 = !{i32 7, i32 64, i32 0, i32 1}
!333 = !{[19 x i8]* @empty_1, !16}
!334 = !{i7 1, !218}
!335 = !{[19 x i8]* @empty_13, !16}
!336 = !{i32 1, i32 1, i32 0, i32 2}
!337 = !{i32 0, i32 0, i32 3, i32 1}
!338 = !{i32 0, i32 0, i32 0, i32 2}
!339 = !{i32 175}
!340 = !{!341, !343, !345, !346, !347}
!341 = !{i32 170, !342}
!342 = !{!"WAW", !"indep"}
!343 = !{i32 171, !344}
!344 = !{!"RAW", !"indep"}
!345 = !{i32 172, !344}
!346 = !{i32 173, !342}
!347 = !{i32 174, !342}
!348 = !{i32 3, i32 3, i32 0, i32 2}
!349 = !{i32 171}
!350 = !{!351, !353, !354, !356}
!351 = !{i32 175, !352}
!352 = !{!"WAR", !"indep"}
!353 = !{i32 170, !352}
!354 = !{i32 173, !355}
!355 = !{!"WAR", !"indep", i32 1, !"*", i32 -1, i1 true}
!356 = !{i32 174, !352}
!357 = distinct !{!357, !358, !373, !374, !378}
!358 = !{i32 540, i32 9, !359, null}
!359 = !{i32 786443, !360, i32 537, i32 9, !365, i32 0}
!360 = !{i32 786443, !361, !365}
!361 = !{i32 786443, !362, i32 535, i32 19, !365, i32 0}
!362 = !{i32 786443, !363, i32 535, i32 9, !365, i32 0}
!363 = !{i32 786443, !364, !365}
!364 = !{i32 786478, i32 0, !365, !"upzero", !"upzero", null, !365, i32 531, !366, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i16, [6 x i16]*, [6 x i32]*)* @upzero, null, null, !371, i32 531}
!365 = !{i32 786473, !"data/benchmarks/adpcm/adpcm.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!366 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !367, i32 0, i32 0}
!367 = !{null, !368, !369, !369}
!368 = !{i32 786468, null, !"int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 5}
!369 = !{i32 786447, null, !"", !370, i32 0, i64 64, i64 0, i32 0, i32 0, !368}
!370 = !{i32 786473, !"<unknown>", null, null}
!371 = !{!372}
!372 = !{i32 0}
!373 = !{!"llvm.loop.name", !"upzero_label10"}
!374 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !375}
!375 = !{i32 39, i32 9, !376, null}
!376 = !{i32 786443, !359, !377}
!377 = !{i32 786473, !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/adpcm.tcl", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!378 = !{!"llvm.loop.tripcount", i32 6, i32 6, i32 6, !"user", !379}
!379 = !{i32 538, i32 9, !380, null}
!380 = !{i32 786443, !359, !365}
!381 = !{i32 64, i32 64, i32 0, i32 0}
!382 = !{!"user"}
!383 = !{i32 178}
!384 = !{!385, !387}
!385 = !{i32 176, !386}
!386 = !{!"WAR", !"indep", i32 1, !"=", i32 0, i1 true}
!387 = !{i32 177, !352}
!388 = !{i32 40, i32 40, i32 0, i32 1}
!389 = !{i32 40, i32 40, i32 0, i32 2}
!390 = !{i32 176}
!391 = !{!392, !394, !395}
!392 = !{i32 178, !393}
!393 = !{!"RAW", !"indep", i32 1, !"=", i32 0, i1 true}
!394 = !{i32 179, !344}
!395 = !{i32 177, !342}
!396 = !{i32 173}
!397 = !{!398, !341, !399, !345, !347}
!398 = !{i32 175, !342}
!399 = !{i32 171, !400}
!400 = !{!"RAW", !"indep", i32 1, !"*", i32 -1, i1 true}
!401 = !{i32 32, i32 32, i32 0, i32 1}
!402 = !{i32 170}
!403 = !{!398, !343, !345, !346, !347}
!404 = !{i32 172}
!405 = !{!351, !353, !406, !407}
!406 = !{i32 173, !352}
!407 = !{i32 174, !355}
!408 = distinct !{!408, !409, !413, !414, !417}
!409 = !{i32 551, i32 9, !410, null}
!410 = !{i32 786443, !411, i32 543, i32 9, !365, i32 0}
!411 = !{i32 786443, !412, !365}
!412 = !{i32 786443, !362, i32 541, i32 12, !365, i32 0}
!413 = !{!"llvm.loop.name", !"upzero_label11"}
!414 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !415}
!415 = !{i32 40, i32 9, !416, null}
!416 = !{i32 786443, !410, !377}
!417 = !{!"llvm.loop.tripcount", i32 6, i32 6, i32 6, !"user", !418}
!418 = !{i32 544, i32 9, !419, null}
!419 = !{i32 786443, !410, !365}
!420 = !{i32 186}
!421 = !{!422, !423, !424, !425, !426, !427}
!422 = !{i32 180, !352}
!423 = !{i32 181, !352}
!424 = !{i32 182, !352}
!425 = !{i32 183, !352}
!426 = !{i32 184, !352}
!427 = !{i32 185, !352}
!428 = !{i32 64, i32 64, i32 0, i32 1}
!429 = !{i32 179}
!430 = !{!431, !432}
!431 = !{i32 176, !352}
!432 = !{i32 177, !386}
!433 = !{i32 177}
!434 = !{!435, !436, !437}
!435 = !{i32 178, !344}
!436 = !{i32 176, !342}
!437 = !{i32 179, !393}
!438 = !{i32 174}
!439 = !{!398, !341, !343, !440, !346}
!440 = !{i32 172, !400}
!441 = !{i32 187}
!442 = !{!423}
!443 = !{i32 180}
!444 = !{!445}
!445 = !{i32 186, !344}
!446 = !{i32 188}
!447 = !{!424}
!448 = !{i32 181}
!449 = !{!445, !450}
!450 = !{i32 187, !344}
!451 = !{i32 189}
!452 = !{!425}
!453 = !{i32 182}
!454 = !{!445, !455}
!455 = !{i32 188, !344}
!456 = !{i32 190}
!457 = !{!426}
!458 = !{i32 183}
!459 = !{!445, !460}
!460 = !{i32 189, !344}
!461 = !{i32 191}
!462 = !{!427}
!463 = !{i32 184}
!464 = !{!445, !465}
!465 = !{i32 190, !344}
!466 = !{i32 185}
!467 = !{!445, !468}
!468 = !{i32 191, !344}
!469 = !{i32 147}
!470 = !{!471, !472}
!471 = !{i32 145, !344}
!472 = !{i32 146, !342}
!473 = !{i32 145}
!474 = !{!475, !476}
!475 = !{i32 147, !352}
!476 = !{i32 146, !355}
!477 = distinct !{!477, !478, !484, !485, !488}
!478 = !{i32 433, i32 5, !479, null}
!479 = !{i32 786443, !480, i32 427, i32 5, !365, i32 0}
!480 = !{i32 786443, !481, !365}
!481 = !{i32 786478, i32 0, !365, !"reset", !"reset", null, !365, i32 416, !482, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, void ()* @reset, null, null, !371, i32 416}
!482 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !483, i32 0, i32 0}
!483 = !{null}
!484 = !{!"llvm.loop.name", !"reset_label4"}
!485 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !486}
!486 = !{i32 33, i32 9, !487, null}
!487 = !{i32 786443, !479, !377}
!488 = !{!"llvm.loop.tripcount", i32 6, i32 6, i32 6, !"user", !489}
!489 = !{i32 428, i32 9, !490, null}
!490 = !{i32 786443, !479, !365}
!491 = !{i32 150}
!492 = !{!493, !494}
!493 = !{i32 148, !344}
!494 = !{i32 149, !342}
!495 = !{i32 146}
!496 = !{!497, !498}
!497 = !{i32 147, !342}
!498 = !{i32 145, !400}
!499 = !{i32 148}
!500 = !{!501, !502}
!501 = !{i32 150, !352}
!502 = !{i32 149, !355}
!503 = distinct !{!503, !504, !506, !507, !510}
!504 = !{i32 442, i32 5, !505, null}
!505 = !{i32 786443, !480, i32 436, i32 5, !365, i32 0}
!506 = !{!"llvm.loop.name", !"reset_label5"}
!507 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !508}
!508 = !{i32 34, i32 9, !509, null}
!509 = !{i32 786443, !505, !377}
!510 = !{!"llvm.loop.tripcount", i32 6, i32 6, i32 6, !"user", !511}
!511 = !{i32 437, i32 9, !512, null}
!512 = !{i32 786443, !505, !365}
!513 = !{i32 0, i32 0, i32 5, i32 1}
!514 = !{i32 153}
!515 = !{!516, !517}
!516 = !{i32 151, !344}
!517 = !{i32 152, !342}
!518 = !{i32 149}
!519 = !{!520, !521}
!520 = !{i32 150, !342}
!521 = !{i32 148, !400}
!522 = !{i32 5, i32 5, i32 0, i32 2}
!523 = !{i32 151}
!524 = !{!525, !526}
!525 = !{i32 153, !352}
!526 = !{i32 152, !355}
!527 = distinct !{!527, !528, !530, !531, !534}
!528 = !{i32 448, i32 5, !529, null}
!529 = !{i32 786443, !480, i32 445, i32 5, !365, i32 0}
!530 = !{!"llvm.loop.name", !"reset_label6"}
!531 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !532}
!532 = !{i32 35, i32 9, !533, null}
!533 = !{i32 786443, !529, !377}
!534 = !{!"llvm.loop.tripcount", i32 24, i32 24, i32 24, !"user", !535}
!535 = !{i32 446, i32 9, !536, null}
!536 = !{i32 786443, !529, !365}
!537 = !{i32 0, i32 0, i32 4, i32 1}
!538 = !{i32 156}
!539 = !{!540, !541}
!540 = !{i32 154, !344}
!541 = !{i32 155, !342}
!542 = !{i32 152}
!543 = !{!544, !545}
!544 = !{i32 153, !342}
!545 = !{i32 151, !400}
!546 = !{i32 4, i32 4, i32 0, i32 2}
!547 = !{i32 154}
!548 = !{!549, !550}
!549 = !{i32 156, !352}
!550 = !{i32 155, !355}
!551 = distinct !{!551, !552, !554, !555, !558}
!552 = !{i32 455, i32 5, !553, null}
!553 = !{i32 786443, !480, i32 451, i32 5, !365, i32 0}
!554 = !{!"llvm.loop.name", !"reset_label7"}
!555 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !556}
!556 = !{i32 36, i32 9, !557, null}
!557 = !{i32 786443, !553, !377}
!558 = !{!"llvm.loop.tripcount", i32 11, i32 11, i32 11, !"user", !559}
!559 = !{i32 452, i32 9, !560, null}
!560 = !{i32 786443, !553, !365}
!561 = !{i32 155}
!562 = !{!563, !564}
!563 = !{i32 156, !342}
!564 = !{i32 154, !400}
!565 = !{i32 30, i32 30, i32 0, i32 0}
!566 = !{i32 169}
!567 = !{!568, !569}
!568 = !{i32 167, !344}
!569 = !{i32 168, !342}
!570 = !{i32 167}
!571 = !{!572, !573}
!572 = !{i32 169, !352}
!573 = !{i32 168, !355}
!574 = distinct !{!574, !575, !581, !582, !585}
!575 = !{i32 498, i32 5, !576, null}
!576 = !{i32 786443, !577, i32 493, i32 5, !365, i32 0}
!577 = !{i32 786443, !578, !365}
!578 = !{i32 786478, i32 0, !365, !"quantl", !"quantl", null, !365, i32 484, !579, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i6 (i32, i15)* @quantl, null, null, !371, i32 484}
!579 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !580, i32 0, i32 0}
!580 = !{!368, !368, !368}
!581 = !{!"llvm.loop.name", !"quantl_label9"}
!582 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !583}
!583 = !{i32 38, i32 9, !584, null}
!584 = !{i32 786443, !576, !377}
!585 = !{!"llvm.loop.tripcount", i32 30, i32 30, i32 30, !"user", !586}
!586 = !{i32 494, i32 9, !587, null}
!587 = !{i32 786443, !576, !365}
!588 = !{i32 30, i32 30, i32 0, i32 2}
!589 = !{i32 32, i32 32, i32 0, i32 0}
!590 = !{i32 168}
!591 = !{!592, !593}
!592 = !{i32 169, !342}
!593 = !{i32 167, !400}
!594 = !{i32 6, i32 6, i32 0, i32 2}
!595 = !{i32 0, i32 0, i32 50, i32 1}
!596 = !{i32 48, i32 48, i32 0, i32 1}
!597 = !{i32 48, i32 48, i32 0, i32 2}
!598 = !{i32 50, i32 50, i32 0, i32 1}
!599 = !{i32 164}
!600 = !{!601, !602}
!601 = !{i32 157, !344}
!602 = !{i32 158, !342}
!603 = !{i32 165}
!604 = !{!605, !606, !607}
!605 = !{i32 159, !344}
!606 = !{i32 160, !344}
!607 = !{i32 161, !342}
!608 = !{i32 166}
!609 = !{!610, !611}
!610 = !{i32 162, !344}
!611 = !{i32 163, !342}
!612 = !{i32 157}
!613 = !{!614, !615}
!614 = !{i32 164, !352}
!615 = !{i32 158, !355}
!616 = distinct !{!616, !617, !623, !624, !627}
!617 = !{i32 467, i32 5, !618, null}
!618 = !{i32 786443, !619, i32 464, i32 5, !365, i32 0}
!619 = !{i32 786443, !620, !365}
!620 = !{i32 786478, i32 0, !365, !"filtez", !"filtez", null, !365, i32 458, !621, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 ([6 x i32]*, [6 x i16]*)* @filtez, null, null, !371, i32 458}
!621 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !622, i32 0, i32 0}
!622 = !{!368, !369, !369}
!623 = !{!"llvm.loop.name", !"filtez_label8"}
!624 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !625}
!625 = !{i32 37, i32 9, !626, null}
!626 = !{i32 786443, !618, !377}
!627 = !{!"llvm.loop.tripcount", i32 5, i32 5, i32 5, !"user", !628}
!628 = !{i32 465, i32 9, !629, null}
!629 = !{i32 786443, !618, !365}
!630 = !{i32 162}
!631 = !{!632, !633}
!632 = !{i32 166, !352}
!633 = !{i32 163, !355}
!634 = !{i32 50, i32 50, i32 0, i32 2}
!635 = !{i32 160}
!636 = !{!637, !638}
!637 = !{i32 165, !352}
!638 = !{i32 161, !355}
!639 = !{i32 158}
!640 = !{!641, !642}
!641 = !{i32 164, !342}
!642 = !{i32 157, !400}
!643 = !{i32 161}
!644 = !{!645, !605, !646}
!645 = !{i32 165, !342}
!646 = !{i32 160, !400}
!647 = !{i32 163}
!648 = !{!649, !650}
!649 = !{i32 166, !342}
!650 = !{i32 162, !400}
!651 = !{i32 159}
!652 = !{!637, !653}
!653 = !{i32 161, !352}
!654 = !{i32 105}
!655 = !{!656, !657}
!656 = !{i32 79, !352}
!657 = !{i32 80, !352}
!658 = !{i32 36, i32 36, i32 0, i32 2}
!659 = !{i32 37, i32 37, i32 0, i32 1}
!660 = !{i32 34, i32 34, i32 0, i32 2}
!661 = !{i32 101}
!662 = !{!663, !657}
!663 = !{i32 81, !352}
!664 = !{i32 39, i32 39, i32 0, i32 1}
!665 = !{i32 39, i32 39, i32 0, i32 2}
!666 = !{i32 94}
!667 = !{!668, !669, !670}
!668 = !{i32 82, !344}
!669 = !{i32 83, !344}
!670 = !{i32 84, !342}
!671 = !{i32 93}
!672 = !{!673, !674, !675}
!673 = !{i32 85, !344}
!674 = !{i32 86, !344}
!675 = !{i32 87, !342}
!676 = !{i32 92}
!677 = !{!678, !679}
!678 = !{i32 88, !344}
!679 = !{i32 89, !342}
!680 = !{i32 99}
!681 = !{!682, !683}
!682 = !{i32 90, !344}
!683 = !{i32 91, !342}
!684 = !{i32 88}
!685 = !{!686, !687}
!686 = !{i32 92, !352}
!687 = !{i32 89, !355}
!688 = distinct !{!688, !689, !693, !694, !697}
!689 = !{i32 259, i32 5, !690, null}
!690 = !{i32 786443, !691, i32 255, i32 5, !365, i32 0}
!691 = !{i32 786443, !692, !365}
!692 = !{i32 786478, i32 0, !365, !"encode", !"encode", null, !365, i32 240, !579, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i8 (i32, i32)* @encode, null, null, !371, i32 240}
!693 = !{!"llvm.loop.name", !"encode_label0"}
!694 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !695}
!695 = !{i32 29, i32 9, !696, null}
!696 = !{i32 786443, !690, !377}
!697 = !{!"llvm.loop.tripcount", i32 10, i32 10, i32 10, !"user", !698}
!698 = !{i32 256, i32 9, !699, null}
!699 = !{i32 786443, !690, !365}
!700 = !{i32 90}
!701 = !{!702, !703}
!702 = !{i32 99, !352}
!703 = !{i32 91, !355}
!704 = !{i32 86}
!705 = !{!706, !707}
!706 = !{i32 93, !352}
!707 = !{i32 87, !355}
!708 = !{i32 83}
!709 = !{!710, !711}
!710 = !{i32 94, !352}
!711 = !{i32 84, !355}
!712 = !{i32 102}
!713 = !{!663, !656, !657}
!714 = !{i32 47, i32 47, i32 0, i32 1}
!715 = !{i32 47, i32 47, i32 0, i32 2}
!716 = !{i32 103}
!717 = !{i32 84}
!718 = !{!719, !668, !720}
!719 = !{i32 94, !342}
!720 = !{i32 83, !400}
!721 = !{i32 87}
!722 = !{!723, !673, !724}
!723 = !{i32 93, !342}
!724 = !{i32 86, !400}
!725 = !{i32 89}
!726 = !{!727, !728}
!727 = !{i32 92, !342}
!728 = !{i32 88, !400}
!729 = !{i32 91}
!730 = !{!731, !732}
!731 = !{i32 99, !342}
!732 = !{i32 90, !400}
!733 = !{i32 0, i32 0, i32 6, i32 1}
!734 = !{i32 85}
!735 = !{!706, !736}
!736 = !{i32 87, !352}
!737 = !{i32 82}
!738 = !{!710, !739}
!739 = !{i32 84, !352}
!740 = !{i32 143}
!741 = !{!657}
!742 = !{i32 144}
!743 = !{i32 100}
!744 = !{!745, !746}
!745 = !{i32 95, !344}
!746 = !{i32 96, !342}
!747 = !{i32 142}
!748 = !{!749, !750}
!749 = !{i32 97, !344}
!750 = !{i32 98, !342}
!751 = !{i32 95}
!752 = !{!753, !754}
!753 = !{i32 100, !352}
!754 = !{i32 96, !355}
!755 = distinct !{!755, !756, !758, !759, !762}
!756 = !{i32 272, i32 5, !757, null}
!757 = !{i32 786443, !691, i32 269, i32 5, !365, i32 0}
!758 = !{!"llvm.loop.name", !"encode_label1"}
!759 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !760}
!760 = !{i32 30, i32 9, !761, null}
!761 = !{i32 786443, !757, !377}
!762 = !{!"llvm.loop.tripcount", i32 22, i32 22, i32 22, !"user", !763}
!763 = !{i32 270, i32 9, !764, null}
!764 = !{i32 786443, !757, !365}
!765 = !{i32 97}
!766 = !{!767, !768}
!767 = !{i32 142, !352}
!768 = !{i32 98, !355}
!769 = !{i32 104}
!770 = !{!663, !656, !771}
!771 = !{i32 80, !772}
!772 = !{!"WAR", i32 1, !"<", i32 2, i1 true}
!773 = !{i32 80}
!774 = !{!775, !776, !777, !778, !779, !780, !781, !782, !783}
!775 = !{i32 105, !344}
!776 = !{i32 101, !344}
!777 = !{i32 143, !344}
!778 = !{i32 144, !344}
!779 = !{i32 102, !344}
!780 = !{i32 103, !344}
!781 = !{i32 81, !342}
!782 = !{i32 79, !342}
!783 = !{i32 104, !784}
!784 = !{!"RAW", i32 1, !">", i32 2, i1 true}
!785 = !{i32 96}
!786 = !{!787, !788}
!787 = !{i32 100, !342}
!788 = !{i32 95, !400}
!789 = !{i32 98}
!790 = !{!791, !792}
!791 = !{i32 142, !342}
!792 = !{i32 97, !400}
!793 = !{i32 81}
!794 = !{!776, !779, !780, !795, !796}
!795 = !{i32 104, !344}
!796 = !{i32 80, !342}
!797 = !{i32 79}
!798 = !{!775, !779, !780, !795, !796}
!799 = !{i32 115}
!800 = !{!801}
!801 = !{i32 106, !802}
!802 = !{!"Unknown", !"indep"}
!803 = !{i32 31, i32 31, i32 0, i32 2}
!804 = !{i32 121}
!805 = !{!806}
!806 = !{i32 107, !352}
!807 = !{i32 119}
!808 = !{!809}
!809 = !{i32 108, !352}
!810 = !{i32 120}
!811 = !{!812}
!812 = !{i32 109, !352}
!813 = !{i32 118}
!814 = !{!815}
!815 = !{i32 110, !352}
!816 = !{i32 25, i32 25, i32 0, i32 1}
!817 = !{i32 23, i32 23, i32 0, i32 1}
!818 = !{i32 114}
!819 = !{!820}
!820 = !{i32 111, !352}
!821 = !{i32 31, i32 31, i32 0, i32 0}
!822 = !{i32 31, i32 31, i32 0, i32 1}
!823 = !{i32 113}
!824 = !{!825}
!825 = !{i32 112, !352}
!826 = !{i32 23, i32 23, i32 0, i32 0}
!827 = !{i32 22, i32 22, i32 0, i32 2}
!828 = !{i32 17, i32 17, i32 0, i32 1}
!829 = !{i32 13, i32 13, i32 0, i32 2}
!830 = !{i32 17, i32 17, i32 0, i32 2}
!831 = !{i32 112}
!832 = !{!833}
!833 = !{i32 113, !344}
!834 = !{i32 12, i32 12, i32 0, i32 2}
!835 = !{i32 12, i32 12, i32 0, i32 0}
!836 = !{i32 111}
!837 = !{!838}
!838 = !{i32 114, !344}
!839 = !{i32 106}
!840 = !{!841}
!841 = !{i32 115, !802}
!842 = !{i32 123}
!843 = !{!844}
!844 = !{i32 116, !352}
!845 = !{i32 122}
!846 = !{!847}
!847 = !{i32 117, !352}
!848 = !{i32 18, i32 18, i32 0, i32 2}
!849 = !{i32 19, i32 19, i32 0, i32 1}
!850 = !{i32 64, i32 64, i32 0, i32 2}
!851 = !{i32 11, i32 11, i32 0, i32 2}
!852 = !{i32 12, i32 12, i32 0, i32 1}
!853 = !{i32 110}
!854 = !{!855}
!855 = !{i32 118, !344}
!856 = !{i32 24, i32 24, i32 0, i32 2}
!857 = !{i32 18, i32 18, i32 0, i32 1}
!858 = !{i32 18, i32 18, i32 0, i32 0}
!859 = !{i32 16, i32 16, i32 0, i32 0}
!860 = !{i32 16, i32 16, i32 0, i32 1}
!861 = !{i32 108}
!862 = !{!863}
!863 = !{i32 119, !344}
!864 = !{i32 109}
!865 = !{!866}
!866 = !{i32 120, !344}
!867 = !{i32 107}
!868 = !{!869}
!869 = !{i32 121, !344}
!870 = !{i32 117}
!871 = !{!872}
!872 = !{i32 122, !344}
!873 = !{i32 116}
!874 = !{!875}
!875 = !{i32 123, !344}
!876 = !{i32 133}
!877 = !{!878}
!878 = !{i32 124, !802}
!879 = !{i32 139}
!880 = !{!881}
!881 = !{i32 125, !352}
!882 = !{i32 137}
!883 = !{!884}
!884 = !{i32 126, !352}
!885 = !{i32 138}
!886 = !{!887}
!887 = !{i32 127, !352}
!888 = !{i32 136}
!889 = !{!890}
!890 = !{i32 128, !352}
!891 = !{i32 2, i32 2, i32 0, i32 2}
!892 = !{i32 132}
!893 = !{!894}
!894 = !{i32 129, !352}
!895 = !{i32 29, i32 29, i32 0, i32 0}
!896 = !{i32 25, i32 25, i32 0, i32 0}
!897 = !{i32 25, i32 25, i32 0, i32 2}
!898 = !{i32 14, i32 14, i32 0, i32 2}
!899 = !{i32 29, i32 29, i32 0, i32 1}
!900 = !{i32 29, i32 29, i32 0, i32 2}
!901 = !{i32 131}
!902 = !{!903}
!903 = !{i32 130, !352}
!904 = !{i32 130}
!905 = !{!906}
!906 = !{i32 131, !344}
!907 = !{i32 129}
!908 = !{!909}
!909 = !{i32 132, !344}
!910 = !{i32 124}
!911 = !{!912}
!912 = !{i32 133, !802}
!913 = !{i32 141}
!914 = !{!915}
!915 = !{i32 134, !352}
!916 = !{i32 140}
!917 = !{!918}
!918 = !{i32 135, !352}
!919 = !{i32 128}
!920 = !{!921}
!921 = !{i32 136, !344}
!922 = !{i32 126}
!923 = !{!924}
!924 = !{i32 137, !344}
!925 = !{i32 127}
!926 = !{!927}
!927 = !{i32 138, !344}
!928 = !{i32 125}
!929 = !{!930}
!930 = !{i32 139, !344}
!931 = !{i32 135}
!932 = !{!933}
!933 = !{i32 140, !344}
!934 = !{i32 134}
!935 = !{!936}
!936 = !{i32 141, !344}
!937 = !{i32 22}
!938 = !{!939}
!939 = !{i32 13, !802}
!940 = !{i32 28}
!941 = !{!942}
!942 = !{i32 14, !352}
!943 = !{i32 26}
!944 = !{!945}
!945 = !{i32 15, !352}
!946 = !{i32 27}
!947 = !{!948}
!948 = !{i32 16, !352}
!949 = !{i32 25}
!950 = !{!951}
!951 = !{i32 17, !352}
!952 = !{i32 21}
!953 = !{!954}
!954 = !{i32 18, !352}
!955 = !{i32 20}
!956 = !{!957}
!957 = !{i32 19, !352}
!958 = !{i32 19}
!959 = !{!960}
!960 = !{i32 20, !344}
!961 = !{i32 18}
!962 = !{!963}
!963 = !{i32 21, !344}
!964 = !{i32 13}
!965 = !{!966}
!966 = !{i32 22, !802}
!967 = !{i32 30}
!968 = !{!969}
!969 = !{i32 23, !352}
!970 = !{i32 29}
!971 = !{!972}
!972 = !{i32 24, !352}
!973 = !{i32 17}
!974 = !{!975}
!975 = !{i32 25, !344}
!976 = !{i32 15}
!977 = !{!978}
!978 = !{i32 26, !344}
!979 = !{i32 16}
!980 = !{!981}
!981 = !{i32 27, !344}
!982 = !{i32 14}
!983 = !{!984}
!984 = !{i32 28, !344}
!985 = !{i32 24}
!986 = !{!987}
!987 = !{i32 29, !344}
!988 = !{i32 23}
!989 = !{!990}
!990 = !{i32 30, !344}
!991 = !{i32 40}
!992 = !{!993}
!993 = !{i32 31, !802}
!994 = !{i32 46}
!995 = !{!996}
!996 = !{i32 32, !352}
!997 = !{i32 44}
!998 = !{!999}
!999 = !{i32 33, !352}
!1000 = !{i32 45}
!1001 = !{!1002}
!1002 = !{i32 34, !352}
!1003 = !{i32 43}
!1004 = !{!1005}
!1005 = !{i32 35, !352}
!1006 = !{i32 39}
!1007 = !{!1008}
!1008 = !{i32 36, !352}
!1009 = !{i32 38}
!1010 = !{!1011}
!1011 = !{i32 37, !352}
!1012 = !{i32 37}
!1013 = !{!1014}
!1014 = !{i32 38, !344}
!1015 = !{i32 36}
!1016 = !{!1017}
!1017 = !{i32 39, !344}
!1018 = !{i32 31}
!1019 = !{!1020}
!1020 = !{i32 40, !802}
!1021 = !{i32 48}
!1022 = !{!1023}
!1023 = !{i32 41, !352}
!1024 = !{i32 47}
!1025 = !{!1026}
!1026 = !{i32 42, !352}
!1027 = !{i32 35}
!1028 = !{!1029}
!1029 = !{i32 43, !344}
!1030 = !{i32 33}
!1031 = !{!1032}
!1032 = !{i32 44, !344}
!1033 = !{i32 34}
!1034 = !{!1035}
!1035 = !{i32 45, !344}
!1036 = !{i32 32}
!1037 = !{!1038}
!1038 = !{i32 46, !344}
!1039 = !{i32 42}
!1040 = !{!1041}
!1041 = !{i32 47, !344}
!1042 = !{i32 41}
!1043 = !{!1044}
!1044 = !{i32 48, !344}
!1045 = !{i32 59}
!1046 = !{!1047, !1048}
!1047 = !{i32 49, !344}
!1048 = !{i32 50, !342}
!1049 = !{i32 61}
!1050 = !{!1051, !1052, !1053}
!1051 = !{i32 51, !344}
!1052 = !{i32 52, !344}
!1053 = !{i32 53, !342}
!1054 = !{i32 60}
!1055 = !{!1056, !1057, !1058}
!1056 = !{i32 54, !344}
!1057 = !{i32 55, !344}
!1058 = !{i32 56, !342}
!1059 = !{i32 68}
!1060 = !{!1061, !1062}
!1061 = !{i32 57, !344}
!1062 = !{i32 58, !342}
!1063 = !{i32 49}
!1064 = !{!1065, !1066}
!1065 = !{i32 59, !352}
!1066 = !{i32 50, !355}
!1067 = distinct !{!1067, !1068, !1074, !1075, !1078}
!1068 = !{i32 393, i32 5, !1069, null}
!1069 = !{i32 786443, !1070, i32 389, i32 5, !365, i32 0}
!1070 = !{i32 786443, !1071, !365}
!1071 = !{i32 786478, i32 0, !365, !"decode", !"decode", null, !365, i32 331, !1072, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i8)* @decode, null, null, !371, i32 331}
!1072 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !1073, i32 0, i32 0}
!1073 = !{null, !368}
!1074 = !{!"llvm.loop.name", !"decode_label2"}
!1075 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1076}
!1076 = !{i32 31, i32 9, !1077, null}
!1077 = !{i32 786443, !1069, !377}
!1078 = !{!"llvm.loop.tripcount", i32 10, i32 10, i32 10, !"user", !1079}
!1079 = !{i32 390, i32 9, !1080, null}
!1080 = !{i32 786443, !1069, !365}
!1081 = !{i32 57}
!1082 = !{!1083, !1084}
!1083 = !{i32 68, !352}
!1084 = !{i32 58, !355}
!1085 = !{i32 55}
!1086 = !{!1087, !1088}
!1087 = !{i32 60, !352}
!1088 = !{i32 56, !355}
!1089 = !{i32 52}
!1090 = !{!1091, !1092}
!1091 = !{i32 61, !352}
!1092 = !{i32 53, !355}
!1093 = !{i32 72}
!1094 = !{!1095, !1096}
!1095 = !{i32 69, !352}
!1096 = !{i32 62, !352}
!1097 = !{i32 74}
!1098 = !{!1099, !1100}
!1099 = !{i32 70, !352}
!1100 = !{i32 63, !352}
!1101 = !{i32 50}
!1102 = !{!1103, !1104}
!1103 = !{i32 59, !342}
!1104 = !{i32 49, !400}
!1105 = !{i32 53}
!1106 = !{!1107, !1051, !1108}
!1107 = !{i32 61, !342}
!1108 = !{i32 52, !400}
!1109 = !{i32 56}
!1110 = !{!1111, !1056, !1112}
!1111 = !{i32 60, !342}
!1112 = !{i32 55, !400}
!1113 = !{i32 58}
!1114 = !{!1115, !1116}
!1115 = !{i32 68, !342}
!1116 = !{i32 57, !400}
!1117 = !{i32 54}
!1118 = !{!1087, !1119}
!1119 = !{i32 56, !352}
!1120 = !{i32 51}
!1121 = !{!1091, !1122}
!1122 = !{i32 53, !352}
!1123 = !{i32 46, i32 46, i32 0, i32 2}
!1124 = !{i32 77}
!1125 = !{!1096}
!1126 = !{i32 46, i32 46, i32 0, i32 1}
!1127 = !{i32 78}
!1128 = !{!1100}
!1129 = !{i32 71}
!1130 = !{!1131, !1132}
!1131 = !{i32 64, !344}
!1132 = !{i32 65, !342}
!1133 = !{i32 76}
!1134 = !{!1135, !1136}
!1135 = !{i32 66, !344}
!1136 = !{i32 67, !342}
!1137 = !{i32 64}
!1138 = !{!1139, !1140}
!1139 = !{i32 71, !352}
!1140 = !{i32 65, !355}
!1141 = distinct !{!1141, !1142, !1144, !1145, !1148}
!1142 = !{i32 409, i32 5, !1143, null}
!1143 = !{i32 786443, !1070, i32 405, i32 5, !365, i32 0}
!1144 = !{!"llvm.loop.name", !"decode_label3"}
!1145 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1146}
!1146 = !{i32 32, i32 9, !1147, null}
!1147 = !{i32 786443, !1143, !377}
!1148 = !{!"llvm.loop.tripcount", i32 10, i32 10, i32 10, !"user", !1149}
!1149 = !{i32 406, i32 9, !1150, null}
!1150 = !{i32 786443, !1143, !365}
!1151 = !{i32 66}
!1152 = !{!1153, !1154}
!1153 = !{i32 76, !352}
!1154 = !{i32 67, !355}
!1155 = !{i32 73}
!1156 = !{!1095, !1157}
!1157 = !{i32 62, !1158}
!1158 = !{!"WAR", i32 1, !"<", i32 1, i1 true}
!1159 = !{i32 62}
!1160 = !{!1161, !1162, !1163, !1164}
!1161 = !{i32 77, !344}
!1162 = !{i32 72, !344}
!1163 = !{i32 69, !342}
!1164 = !{i32 73, !1165}
!1165 = !{!"RAW", i32 1, !">", i32 1, i1 true}
!1166 = !{i32 75}
!1167 = !{!1099, !1168}
!1168 = !{i32 63, !1158}
!1169 = !{i32 63}
!1170 = !{!1171, !1172, !1173, !1174}
!1171 = !{i32 78, !344}
!1172 = !{i32 74, !344}
!1173 = !{i32 70, !342}
!1174 = !{i32 75, !1165}
!1175 = !{i32 65}
!1176 = !{!1177, !1178}
!1177 = !{i32 71, !342}
!1178 = !{i32 64, !400}
!1179 = !{i32 67}
!1180 = !{!1181, !1182}
!1181 = !{i32 76, !342}
!1182 = !{i32 66, !400}
!1183 = !{i32 69}
!1184 = !{!1162, !1185, !1186}
!1185 = !{i32 73, !344}
!1186 = !{i32 62, !342}
!1187 = !{i32 70}
!1188 = !{!1172, !1189, !1190}
!1189 = !{i32 75, !344}
!1190 = !{i32 63, !342}
!1191 = !{!1}
!1192 = !{i32 7}
!1193 = !{!1194, !1195}
!1194 = !{i32 0, !802}
!1195 = !{i32 1, !802}
!1196 = !{i32 4}
!1197 = !{!1198, !1199}
!1198 = !{i32 2, !344}
!1199 = !{i32 3, !342}
!1200 = !{i32 2}
!1201 = !{!1202, !1203}
!1202 = !{i32 4, !352}
!1203 = !{i32 3, !355}
!1204 = distinct !{!1204, !1205, !1213, !1214, !1217}
!1205 = !{i32 220, i32 5, !1206, null}
!1206 = !{i32 786443, !1207, i32 217, i32 5, !365, i32 0}
!1207 = !{i32 786443, !1208, !365}
!1208 = !{i32 786478, i32 0, !365, !"adpcm_main", !"adpcm_main", null, !365, i32 207, !1209, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([100 x i32]*, [50 x i32]*, [100 x i32]*)* @adpcm_main, null, null, !371, i32 211}
!1209 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !1210, i32 0, i32 0}
!1210 = !{null, !1211, !369, !369}
!1211 = !{i32 786447, null, !"", !370, i32 0, i64 64, i64 0, i32 0, i32 0, !1212}
!1212 = !{i32 786470, null, !"", !370, i32 0, i64 0, i64 0, i32 0, i32 0, !368}
!1213 = !{!"llvm.loop.name", !"adpcm_main_label12"}
!1214 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1215}
!1215 = !{i32 41, i32 9, !1216, null}
!1216 = !{i32 786443, !1206, !377}
!1217 = !{!"llvm.loop.tripcount", i32 50, i32 50, i32 50, !"user", !1218}
!1218 = !{i32 218, i32 9, !1219, null}
!1219 = !{i32 786443, !1206, !365}
!1220 = !{i32 9}
!1221 = !{!1222, !1223}
!1222 = !{i32 5, !344}
!1223 = !{i32 6, !342}
!1224 = !{i32 7, i32 7, i32 0, i32 2}
!1225 = !{!1226, !1227}
!1226 = !{i32 7, !802}
!1227 = !{i32 1, !344}
!1228 = !{i32 10}
!1229 = !{!1230}
!1230 = !{i32 8, !344}
!1231 = !{i32 3}
!1232 = !{!1233, !1234}
!1233 = !{i32 4, !342}
!1234 = !{i32 2, !400}
!1235 = !{i32 5}
!1236 = !{!1237, !1238}
!1237 = !{i32 9, !352}
!1238 = !{i32 6, !355}
!1239 = distinct !{!1239, !1240, !1242, !1243, !1246}
!1240 = !{i32 228, i32 5, !1241, null}
!1241 = !{i32 786443, !1207, i32 223, i32 5, !365, i32 0}
!1242 = !{!"llvm.loop.name", !"adpcm_main_label13"}
!1243 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1244}
!1244 = !{i32 42, i32 9, !1245, null}
!1245 = !{i32 786443, !1241, !377}
!1246 = !{!"llvm.loop.tripcount", i32 50, i32 50, i32 50, !"user", !1247}
!1247 = !{i32 224, i32 9, !1248, null}
!1248 = !{i32 786443, !1241, !365}
!1249 = !{i32 8}
!1250 = !{!1251}
!1251 = !{i32 10, !352}
!1252 = !{i32 1}
!1253 = !{!1226, !1254, !1255, !1256}
!1254 = !{i32 0, !352}
!1255 = !{i32 11, !400}
!1256 = !{i32 12, !400}
!1257 = !{i32 11}
!1258 = !{!1259}
!1259 = !{i32 1, !355}
!1260 = !{i32 12}
!1261 = !{i32 6}
!1262 = !{!1263, !1264}
!1263 = !{i32 9, !342}
!1264 = !{i32 5, !400}
