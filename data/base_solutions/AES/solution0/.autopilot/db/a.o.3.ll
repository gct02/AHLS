; ModuleID = 'data/base_instances/AES/solution0/.autopilot/db/a.o.3.bc'
source_filename = "data/base_instances/AES/solution0/.autopilot/db/a.o.3.bc"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

$_ssdm_op_SpecTopModule = comdat any

$_ssdm_op_SpecLoopTripCount = comdat any

$_ssdm_op_SpecLoopName = comdat any

$_ssdm_op_SpecInterface = comdat any

$_ssdm_op_SpecBitsMap = comdat any

$_ssdm_op_Read.ap_auto.i4 = comdat any

$_ssdm_op_PartSelect.i6.i11.i32.i32 = comdat any

$_ssdm_op_PartSelect.i4.i8.i32.i32 = comdat any

$_ssdm_op_PartSelect.i4.i6.i32.i32 = comdat any

$_ssdm_op_PartSelect.i4.i32.i32.i32 = comdat any

$_ssdm_op_PartSelect.i24.i32.i32.i32 = comdat any

$_ssdm_op_PartSelect.i24.i31.i32.i32 = comdat any

$_ssdm_op_Mux.ap_auto.4i32.i2 = comdat any

$_ssdm_op_BitSelect.i1.i32.i32 = comdat any

$_ssdm_op_BitConcatenate.i9.i6.i3 = comdat any

$_ssdm_op_BitConcatenate.i9.i2.i7 = comdat any

$_ssdm_op_BitConcatenate.i8.i4.i4 = comdat any

$_ssdm_op_BitConcatenate.i6.i4.i2 = comdat any

$_ssdm_op_BitConcatenate.i6.i3.i3 = comdat any

$_ssdm_op_BitConcatenate.i5.i1.i4 = comdat any

$_ssdm_op_BitConcatenate.i4.i2.i2 = comdat any

$_ssdm_op_BitConcatenate.i32.i31.i1 = comdat any

$_ssdm_op_BitConcatenate.i32.i24.i8 = comdat any

$_ssdm_op_BitConcatenate.i31.i30.i1 = comdat any

$_ssdm_op_BitConcatenate.i10.i3.i7 = comdat any

@word = internal global [480 x i32] zeroinitializer
@invSbox = internal constant [256 x i8] c"R\09j\D506\A58\BF@\A3\9E\81\F3\D7\FB|\E39\82\9B/\FF\874\8ECD\C4\DE\E9\CBT{\942\A6\C2#=\EEL\95\0BB\FA\C3N\08.\A1f(\D9$\B2v[\A2Im\8B\D1%r\F8\F6d\86h\98\16\D4\A4\\\CC]e\B6\92lpHP\FD\ED\B9\DA^\15FW\A7\8D\9D\84\90\D8\AB\00\8C\BC\D3\0A\F7\E4X\05\B8\B3E\06\D0,\1E\8F\CA?\0F\02\C1\AF\BD\03\01\13\8Ak:\91\11AOg\DC\EA\97\F2\CF\CE\F0\B4\E6s\96\ACt\22\E7\AD5\85\E2\F97\E8\1Cu\DFnG\F1\1Aq\1D)\C5\89o\B7b\0E\AA\18\BE\1B\FCV>K\C6\D2y \9A\DB\C0\FEx\CDZ\F4\1F\DD\A83\88\07\C71\B1\12\10Y'\80\EC_`Q\7F\A9\19\B5J\0D-\E5z\9F\93\C9\9C\EF\A0\E0;M\AE*\F5\B0\C8\EB\BB<\83S\99a\17+\04~\BAw\D6&\E1i\14cU!\0C}"
@Sbox_1 = internal constant [256 x i8] c"c|w{\F2ko\C50\01g+\FE\D7\ABv\CA\82\C9}\FAYG\F0\AD\D4\A2\AF\9C\A4r\C0\B7\FD\93&6?\F7\CC4\A5\E5\F1q\D81\15\04\C7#\C3\18\96\05\9A\07\12\80\E2\EB'\B2u\09\83,\1A\1BnZ\A0R;\D6\B3)\E3/\84S\D1\00\ED \FC\B1[j\CB\BE9JLX\CF\D0\EF\AA\FBCM3\85E\F9\02\7FP<\9F\A8Q\A3@\8F\92\9D8\F5\BC\B6\DA!\10\FF\F3\D2\CD\0C\13\EC_\97D\17\C4\A7~=d]\19s`\81O\DC\22*\90\88F\EE\B8\14\DE^\0B\DB\E02:\0AI\06$\\\C2\D3\ACb\91\95\E4y\E7\C87m\8D\D5N\A9lV\F4\EAez\AE\08\BAx%.\1C\A6\B4\C6\E8\DDt\1FK\BD\8B\8Ap>\B5fH\03\F6\0Ea5W\B9\86\C1\1D\9E\E1\F8\98\11i\D9\8E\94\9B\1E\87\E9\CEU(\DF\8C\A1\89\0D\BF\E6BhA\99-\0F\B0T\BB\16"
@Sbox = internal constant [256 x i8] c"c|w{\F2ko\C50\01g+\FE\D7\ABv\CA\82\C9}\FAYG\F0\AD\D4\A2\AF\9C\A4r\C0\B7\FD\93&6?\F7\CC4\A5\E5\F1q\D81\15\04\C7#\C3\18\96\05\9A\07\12\80\E2\EB'\B2u\09\83,\1A\1BnZ\A0R;\D6\B3)\E3/\84S\D1\00\ED \FC\B1[j\CB\BE9JLX\CF\D0\EF\AA\FBCM3\85E\F9\02\7FP<\9F\A8Q\A3@\8F\92\9D8\F5\BC\B6\DA!\10\FF\F3\D2\CD\0C\13\EC_\97D\17\C4\A7~=d]\19s`\81O\DC\22*\90\88F\EE\B8\14\DE^\0B\DB\E02:\0AI\06$\\\C2\D3\ACb\91\95\E4y\E7\C87m\8D\D5N\A9lV\F4\EAez\AE\08\BAx%.\1C\A6\B4\C6\E8\DDt\1FK\BD\8B\8Ap>\B5fH\03\F6\0Ea5W\B9\86\C1\1D\9E\E1\F8\98\11i\D9\8E\94\9B\1E\87\E9\CEU(\DF\8C\A1\89\0D\BF\E6BhA\99-\0F\B0T\BB\16"
@Rcon0 = internal unnamed_addr constant [30 x i8] c"\01\02\04\08\10 @\80\1B6l\D8\ABM\9A/^\BCc\C6\975j\D4\B3}\FA\EF\C5\91"
@empty = internal unnamed_addr constant [1 x i8] zeroinitializer
@empty_0 = internal unnamed_addr constant [9 x i8] c"aes_main\00"
@empty_1 = internal unnamed_addr constant [15 x i8] c"encrypt_label1\00"
@empty_2 = internal unnamed_addr constant [35 x i8] c"AddRoundKey_InversMixColumn_label0\00"
@empty_3 = internal unnamed_addr constant [29 x i8] c"MixColumn_AddRoundKey_label0\00"
@empty_4 = internal unnamed_addr constant [19 x i8] c"KeySchedule_label4\00"
@empty_5 = internal unnamed_addr constant [19 x i8] c"AddRoundKey_label0\00"
@empty_6 = internal unnamed_addr constant [35 x i8] c"AddRoundKey_InversMixColumn_label3\00"
@empty_7 = internal unnamed_addr constant [35 x i8] c"AddRoundKey_InversMixColumn_label1\00"
@empty_8 = internal unnamed_addr constant [15 x i8] c"decrypt_label4\00"
@empty_9 = internal unnamed_addr constant [35 x i8] c"AddRoundKey_InversMixColumn_label2\00"
@empty_10 = internal unnamed_addr constant [29 x i8] c"MixColumn_AddRoundKey_label1\00"
@empty_11 = internal unnamed_addr constant [10 x i8] c"ap_memory\00"
@empty_12 = internal unnamed_addr constant [19 x i8] c"KeySchedule_label9\00"
@empty_13 = internal unnamed_addr constant [19 x i8] c"KeySchedule_label6\00"
@empty_14 = internal unnamed_addr constant [19 x i8] c"KeySchedule_label5\00"

; Function Attrs: nounwind readnone
declare i8 @llvm.part.select.i8(i8, i32, i32) #0

; Function Attrs: nounwind readnone
declare i6 @llvm.part.select.i6(i6, i32, i32) #0

; Function Attrs: nounwind readnone
declare i32 @llvm.part.select.i32(i32, i32, i32) #0

; Function Attrs: nounwind readnone
declare i31 @llvm.part.select.i31(i31, i32, i32) #0

; Function Attrs: nounwind readnone
declare i11 @llvm.part.select.i11(i11, i32, i32) #0

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: noinline nounwind
define internal fastcc void @encrypt([32 x i32]* noalias nocapture %statemt, [32 x i32]* noalias nocapture %key) unnamed_addr #2 {
entry:
  %i = alloca i4, align 1, !bitwidth !143
  call void (...) @_ssdm_op_SpecInterface([32 x i32]* %key, [10 x i8]* @empty_11, i32 0, i32 0, [1 x i8]* @empty, i32 -1, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, [1 x i8]* @empty, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([32 x i32]* %statemt, [10 x i8]* @empty_11, i32 0, i32 0, [1 x i8]* @empty, i32 -1, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, [1 x i8]* @empty, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, i32 -1, i32 0)
  call fastcc void @KeySchedule([32 x i32]* %key), !bitwidth !144, !dep_idx !145, !deps !146
  call fastcc void @AddRoundKey([32 x i32]* %statemt, i4 0), !bitwidth !144, !dep_idx !151, !deps !152
  store i4 1, i4* %i, align 1, !bitwidth !144, !dep_idx !156, !deps !157
  br label %for.inc, !bitwidth !144

for.inc:                                          ; preds = %for.inc.split, %entry
  %i_2 = load i4, i4* %i, align 1, !bitwidth !37, !dep_idx !162, !deps !163
  %icmp_ln110 = icmp eq i4 %i_2, -6, !bitwidth !168
  br i1 %icmp_ln110, label %for.end, label %for.inc.split, !llvm.loop !169, !bitwidth !144

for.inc.split:                                    ; preds = %for.inc
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 9, i64 9, i64 9), !fpga.pragma.source !184
  call void (...) @_ssdm_op_SpecLoopName([15 x i8]* @empty_1)
  call fastcc void @ByteSub_ShiftRow([32 x i32]* %statemt), !bitwidth !144, !dep_idx !185, !deps !186
  call fastcc void @MixColumn_AddRoundKey([32 x i32]* %statemt, i4 %i_2), !bitwidth !144, !dep_idx !189, !deps !190
  %i_3 = add nuw i4 %i_2, 1, !bitwidth !37
  store i4 %i_3, i4* %i, align 1, !bitwidth !144, !dep_idx !192, !deps !193
  br label %for.inc, !llvm.loop !169, !bitwidth !144

for.end:                                          ; preds = %for.inc
  call fastcc void @ByteSub_ShiftRow([32 x i32]* %statemt), !bitwidth !144, !dep_idx !197, !deps !198
  call fastcc void @AddRoundKey([32 x i32]* %statemt, i4 -6), !bitwidth !144, !dep_idx !199, !deps !200
  ret void, !bitwidth !144
}

; Function Attrs: noinline nounwind
define internal fastcc void @decrypt([32 x i32]* noalias nocapture %statemt, [32 x i32]* noalias nocapture %key) unnamed_addr #2 {
entry:
  %i_01 = alloca i4, align 1, !bitwidth !143
  call void (...) @_ssdm_op_SpecInterface([32 x i32]* %key, [10 x i8]* @empty_11, i32 0, i32 0, [1 x i8]* @empty, i32 -1, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, [1 x i8]* @empty, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([32 x i32]* %statemt, [10 x i8]* @empty_11, i32 0, i32 0, [1 x i8]* @empty, i32 -1, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, [1 x i8]* @empty, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, i32 -1, i32 0)
  call fastcc void @KeySchedule([32 x i32]* %key), !bitwidth !144, !dep_idx !201, !deps !202
  call fastcc void @AddRoundKey([32 x i32]* %statemt, i4 -6), !bitwidth !144, !dep_idx !206, !deps !207
  call fastcc void @InversShiftRow_ByteSub([32 x i32]* %statemt), !bitwidth !144, !dep_idx !211, !deps !212
  store i4 -7, i4* %i_01, align 1, !bitwidth !144, !dep_idx !213, !deps !214
  br label %for.inc, !bitwidth !144

for.inc:                                          ; preds = %for.inc.split, %entry
  %i_4 = load i4, i4* %i_01, align 1, !bitwidth !37, !dep_idx !217, !deps !218
  %icmp_ln116 = icmp eq i4 %i_4, 0, !bitwidth !168
  br i1 %icmp_ln116, label %for.end, label %for.inc.split, !llvm.loop !221, !bitwidth !144

for.inc.split:                                    ; preds = %for.inc
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 9, i64 9, i64 9), !fpga.pragma.source !184
  call void (...) @_ssdm_op_SpecLoopName([15 x i8]* @empty_8)
  call fastcc void @AddRoundKey_InversMixColumn([32 x i32]* %statemt, i4 %i_4), !bitwidth !144, !dep_idx !228, !deps !229
  call fastcc void @InversShiftRow_ByteSub([32 x i32]* %statemt), !bitwidth !144, !dep_idx !231, !deps !232
  %i = add i4 %i_4, -1, !bitwidth !37
  store i4 %i, i4* %i_01, align 1, !bitwidth !144, !dep_idx !234, !deps !235
  br label %for.inc, !llvm.loop !221, !bitwidth !144

for.end:                                          ; preds = %for.inc
  call fastcc void @AddRoundKey([32 x i32]* %statemt, i4 0), !bitwidth !144, !dep_idx !238, !deps !239
  ret void, !bitwidth !144
}

; Function Attrs: noinline nounwind
define i32 @aes_main([32 x i32]* noalias %statemt, [32 x i32]* noalias %key) #2 {
entry:
  call void (...) @_ssdm_op_SpecBitsMap(i32 0), !map !240
  call void (...) @_ssdm_op_SpecTopModule([9 x i8]* @empty_0), !fpga.pragma.source !246
  call void (...) @_ssdm_op_SpecInterface([32 x i32]* %statemt, [10 x i8]* @empty_11, i32 0, i32 0, [1 x i8]* @empty, i32 -1, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, [1 x i8]* @empty, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([32 x i32]* %statemt), !map !247
  call void (...) @_ssdm_op_SpecInterface([32 x i32]* %key, [10 x i8]* @empty_11, i32 0, i32 0, [1 x i8]* @empty, i32 -1, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, [1 x i8]* @empty, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([32 x i32]* %key), !map !247
  call fastcc void @encrypt([32 x i32]* %statemt, [32 x i32]* %key), !bitwidth !144, !dep_idx !248, !deps !249
  call fastcc void @decrypt([32 x i32]* %statemt, [32 x i32]* %key), !bitwidth !144, !dep_idx !181, !deps !251
  ret i32 0, !bitwidth !144
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecTopModule(...) #3 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecLoopTripCount(...) #3 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecLoopName(...) #3 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecInterface(...) #3 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecBitsMap(...) #3 comdat {
entry:
  ret void
}

define weak i4 @_ssdm_op_Read.ap_auto.i4(i4 %0) comdat {
entry:
  ret i4 %0
}

; Function Attrs: nounwind readnone
define weak i6 @_ssdm_op_PartSelect.i6.i11.i32.i32(i11 %0, i32 %1, i32 %2) #0 comdat {
entry:
  %empty = call i11 @llvm.part.select.i11(i11 %0, i32 %1, i32 %2)
  %empty_28 = trunc i11 %empty to i6
  ret i6 %empty_28
}

; Function Attrs: nounwind readnone
define weak i4 @_ssdm_op_PartSelect.i4.i8.i32.i32(i8 %0, i32 %1, i32 %2) #0 comdat {
entry:
  %empty = call i8 @llvm.part.select.i8(i8 %0, i32 %1, i32 %2)
  %empty_29 = trunc i8 %empty to i4
  ret i4 %empty_29
}

; Function Attrs: nounwind readnone
define weak i4 @_ssdm_op_PartSelect.i4.i6.i32.i32(i6 %0, i32 %1, i32 %2) #0 comdat {
entry:
  %empty = call i6 @llvm.part.select.i6(i6 %0, i32 %1, i32 %2)
  %empty_30 = trunc i6 %empty to i4
  ret i4 %empty_30
}

; Function Attrs: nounwind readnone
define weak i4 @_ssdm_op_PartSelect.i4.i32.i32.i32(i32 %0, i32 %1, i32 %2) #0 comdat {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_31 = trunc i32 %empty to i4
  ret i4 %empty_31
}

; Function Attrs: nounwind readnone
define weak i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32 %0, i32 %1, i32 %2) #0 comdat {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_32 = trunc i32 %empty to i24
  ret i24 %empty_32
}

; Function Attrs: nounwind readnone
define weak i24 @_ssdm_op_PartSelect.i24.i31.i32.i32(i31 %0, i32 %1, i32 %2) #0 comdat {
entry:
  %empty = call i31 @llvm.part.select.i31(i31 %0, i32 %1, i32 %2)
  %empty_33 = trunc i31 %empty to i24
  ret i24 %empty_33
}

; Function Attrs: nounwind readnone
define weak i32 @_ssdm_op_Mux.ap_auto.4i32.i2(i32 %0, i32 %1, i32 %2, i32 %3, i2 %4) #0 comdat {
entry:
  switch i2 %4, label %case3 [
    i2 0, label %case0
    i2 1, label %case1
    i2 -2, label %case2
  ]

case0:                                            ; preds = %case3, %case2, %case1, %entry
  %merge = phi i32 [ %0, %entry ], [ %1, %case1 ], [ %2, %case2 ], [ %3, %case3 ]
  ret i32 %merge

case1:                                            ; preds = %entry
  br label %case0

case2:                                            ; preds = %entry
  br label %case0

case3:                                            ; preds = %entry
  br label %case0
}

; Function Attrs: nounwind readnone
define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %0, i32 %1) #0 comdat {
entry:
  %empty = shl i32 1, %1
  %empty_34 = and i32 %0, %empty
  %empty_35 = icmp ne i32 %empty_34, 0
  ret i1 %empty_35
}

; Function Attrs: nounwind readnone
define weak i9 @_ssdm_op_BitConcatenate.i9.i6.i3(i6 %0, i3 %1) #0 comdat {
entry:
  %empty = zext i6 %0 to i9
  %empty_36 = zext i3 %1 to i9
  %empty_37 = shl i9 %empty, 3
  %empty_38 = or i9 %empty_37, %empty_36
  ret i9 %empty_38
}

; Function Attrs: nounwind readnone
define weak i9 @_ssdm_op_BitConcatenate.i9.i2.i7(i2 %0, i7 %1) #0 comdat {
entry:
  %empty = zext i2 %0 to i9
  %empty_39 = zext i7 %1 to i9
  %empty_40 = shl i9 %empty, 7
  %empty_41 = or i9 %empty_40, %empty_39
  ret i9 %empty_41
}

; Function Attrs: nounwind readnone
define weak i8 @_ssdm_op_BitConcatenate.i8.i4.i4(i4 %0, i4 %1) #0 comdat {
entry:
  %empty = zext i4 %0 to i8
  %empty_42 = zext i4 %1 to i8
  %empty_43 = shl i8 %empty, 4
  %empty_44 = or i8 %empty_43, %empty_42
  ret i8 %empty_44
}

; Function Attrs: nounwind readnone
define weak i6 @_ssdm_op_BitConcatenate.i6.i4.i2(i4 %0, i2 %1) #0 comdat {
entry:
  %empty = zext i4 %0 to i6
  %empty_45 = zext i2 %1 to i6
  %empty_46 = shl i6 %empty, 2
  %empty_47 = or i6 %empty_46, %empty_45
  ret i6 %empty_47
}

; Function Attrs: nounwind readnone
define weak i6 @_ssdm_op_BitConcatenate.i6.i3.i3(i3 %0, i3 %1) #0 comdat {
entry:
  %empty = zext i3 %0 to i6
  %empty_48 = zext i3 %1 to i6
  %empty_49 = shl i6 %empty, 3
  %empty_50 = or i6 %empty_49, %empty_48
  ret i6 %empty_50
}

; Function Attrs: nounwind readnone
define weak i5 @_ssdm_op_BitConcatenate.i5.i1.i4(i1 %0, i4 %1) #0 comdat {
entry:
  %empty = zext i1 %0 to i5
  %empty_51 = zext i4 %1 to i5
  %empty_52 = shl i5 %empty, 4
  %empty_53 = or i5 %empty_52, %empty_51
  ret i5 %empty_53
}

; Function Attrs: nounwind readnone
define weak i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %0, i2 %1) #0 comdat {
entry:
  %empty = zext i2 %0 to i4
  %empty_54 = zext i2 %1 to i4
  %empty_55 = shl i4 %empty, 2
  %empty_56 = or i4 %empty_55, %empty_54
  ret i4 %empty_56
}

; Function Attrs: nounwind readnone
define weak i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %0, i1 %1) #0 comdat {
entry:
  %empty = zext i31 %0 to i32
  %empty_57 = zext i1 %1 to i32
  %empty_58 = shl i32 %empty, 1
  %empty_59 = or i32 %empty_58, %empty_57
  ret i32 %empty_59
}

; Function Attrs: nounwind readnone
define weak i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %0, i8 %1) #0 comdat {
entry:
  %empty = zext i24 %0 to i32
  %empty_60 = zext i8 %1 to i32
  %empty_61 = shl i32 %empty, 8
  %empty_62 = or i32 %empty_61, %empty_60
  ret i32 %empty_62
}

; Function Attrs: nounwind readnone
define weak i31 @_ssdm_op_BitConcatenate.i31.i30.i1(i30 %0, i1 %1) #0 comdat {
entry:
  %empty = zext i30 %0 to i31
  %empty_63 = zext i1 %1 to i31
  %empty_64 = shl i31 %empty, 1
  %empty_65 = or i31 %empty_64, %empty_63
  ret i31 %empty_65
}

; Function Attrs: nounwind readnone
define weak i10 @_ssdm_op_BitConcatenate.i10.i3.i7(i3 %0, i7 %1) #0 comdat {
entry:
  %empty = zext i3 %0 to i10
  %empty_66 = zext i7 %1 to i10
  %empty_67 = shl i10 %empty, 7
  %empty_68 = or i10 %empty_67, %empty_66
  ret i10 %empty_68
}

; Function Attrs: noinline nounwind
define internal fastcc void @MixColumn_AddRoundKey([32 x i32]* noalias nocapture %statemt, i4 %n) #2 {
entry:
  %j = alloca i3, align 1, !bitwidth !253
  call void (...) @_ssdm_op_SpecInterface([32 x i32]* %statemt, [10 x i8]* @empty_11, i32 0, i32 0, [1 x i8]* @empty, i32 -1, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, [1 x i8]* @empty, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, i32 -1, i32 0)
  %n_read = call i4 @_ssdm_op_Read.ap_auto.i4(i4 %n) #3, !bitwidth !37
  %ret = alloca [32 x i32], i64 1, align 512, !bitwidth !7
  %mul = call i6 @_ssdm_op_BitConcatenate.i6.i4.i2(i4 %n_read, i2 0), !bitwidth !254
  store i3 0, i3* %j, align 1, !bitwidth !144, !dep_idx !255, !deps !256
  br label %for.body, !bitwidth !144

for.body:                                         ; preds = %for.body.split, %entry
  %j_2 = load i3, i3* %j, align 1, !bitwidth !259, !dep_idx !260, !deps !261
  %icmp_ln324 = icmp eq i3 %j_2, -4, !bitwidth !168
  %add_ln324 = add nuw i3 %j_2, 1, !bitwidth !259
  br i1 %icmp_ln324, label %for.inc266.preheader, label %for.body.split, !llvm.loop !264, !bitwidth !144

for.inc266.preheader:                             ; preds = %for.body
  %j_1 = alloca i3, align 1, !bitwidth !253
  store i3 0, i3* %j_1, align 1, !bitwidth !144, !dep_idx !274, !deps !275
  br label %for.inc266, !bitwidth !144

for.body.split:                                   ; preds = %for.body
  %zext_ln324 = zext i3 %j_2 to i6, !bitwidth !278
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !184
  call void (...) @_ssdm_op_SpecLoopName([29 x i8]* @empty_3)
  %trunc_ln326 = trunc i3 %j_2 to i2, !bitwidth !279
  %shl_ln = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %trunc_ln326, i2 0), !bitwidth !37
  %zext_ln326 = zext i4 %shl_ln to i64, !bitwidth !280
  %statemt_addr = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln326, !bitwidth !7
  %x_9 = load i32, i32* %statemt_addr, align 4, !bitwidth !281, !dep_idx !282, !deps !283
  %shl_ln326 = shl i32 %x_9, 1, !bitwidth !281
  %ret_addr = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %zext_ln326, !bitwidth !7
  %tmp_2 = call i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32 %x_9, i32 7, i32 30), !bitwidth !288
  %and_ln = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_2, i8 0), !bitwidth !281
  %icmp_ln327 = icmp eq i32 %and_ln, 256, !bitwidth !168
  %xor_ln327 = xor i32 %shl_ln326, 283, !bitwidth !281
  %select_ln327 = select i1 %icmp_ln327, i32 %xor_ln327, i32 %shl_ln326, !bitwidth !281
  %or_ln328 = or i4 %shl_ln, 1, !bitwidth !37
  %zext_ln328 = zext i4 %or_ln328 to i64, !bitwidth !280
  %statemt_addr_1 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln328, !bitwidth !7
  %x = load i32, i32* %statemt_addr_1, align 4, !bitwidth !281, !dep_idx !289, !deps !283
  %shl_ln329 = shl i32 %x, 1, !bitwidth !281
  %x_1 = xor i32 %x, %shl_ln329, !bitwidth !281
  %tmp_4 = call i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32 %x_1, i32 8, i32 31), !bitwidth !288
  %and_ln1 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_4, i8 0), !bitwidth !281
  %icmp_ln330 = icmp eq i32 %and_ln1, 256, !bitwidth !168
  %xor_ln330 = xor i32 %x_1, 283, !bitwidth !281
  %x_2 = select i1 %icmp_ln330, i32 %xor_ln330, i32 %x_1, !bitwidth !281
  %or_ln333 = or i4 %shl_ln, 2, !bitwidth !37
  %zext_ln333 = zext i4 %or_ln333 to i64, !bitwidth !280
  %statemt_addr_2 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln333, !bitwidth !7
  %x_3 = load i32, i32* %statemt_addr_2, align 4, !bitwidth !281, !dep_idx !290, !deps !283
  %or_ln333_1 = or i4 %shl_ln, 3, !bitwidth !37
  %zext_ln333_1 = zext i4 %or_ln333_1 to i64, !bitwidth !280
  %statemt_addr_3 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln333_1, !bitwidth !7
  %x_6 = load i32, i32* %statemt_addr_3, align 4, !bitwidth !281, !dep_idx !291, !deps !283
  %add_ln333 = add nuw i6 %zext_ln324, %mul, !bitwidth !254
  %zext_ln333_2 = zext i6 %add_ln333 to i64, !bitwidth !280
  %zext_ln333_3 = zext i6 %add_ln333 to i9, !bitwidth !292
  %zext_ln333_4 = zext i6 %add_ln333 to i8, !bitwidth !293
  %word_addr = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln333_2, !bitwidth !7
  %add_ln342 = add i8 %zext_ln333_4, 120, !bitwidth !68
  %zext_ln342 = zext i8 %add_ln342 to i64, !bitwidth !280
  %word_addr_1 = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln342, !bitwidth !7
  %add_ln351 = add i9 %zext_ln333_3, 240, !bitwidth !70
  %zext_ln351 = zext i9 %add_ln351 to i64, !bitwidth !280
  %word_addr_2 = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln351, !bitwidth !7
  %add_ln360 = add i9 %zext_ln333_3, -152, !bitwidth !70
  %zext_ln360 = zext i9 %add_ln360 to i64, !bitwidth !280
  %word_addr_3 = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln360, !bitwidth !7
  %word_load = load i32, i32* %word_addr, align 4, !bitwidth !281
  %xor_ln332 = xor i32 %x_6, %x_3, !bitwidth !281
  %xor_ln332_1 = xor i32 %select_ln327, %x_2, !bitwidth !281
  %xor_ln332_3 = xor i32 %xor_ln332_1, %word_load, !bitwidth !281
  %xor_ln332_2 = xor i32 %xor_ln332_3, %xor_ln332, !bitwidth !281
  store i32 %xor_ln332_2, i32* %ret_addr, align 16, !bitwidth !144, !dep_idx !294, !deps !295
  %ret_addr_1 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %zext_ln328, !bitwidth !7
  %tmp_5 = call i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32 %x, i32 7, i32 30), !bitwidth !288
  %and_ln2 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_5, i8 0), !bitwidth !281
  %icmp_ln336 = icmp eq i32 %and_ln2, 256, !bitwidth !168
  %xor_ln336 = xor i32 %shl_ln329, 283, !bitwidth !281
  %select_ln336 = select i1 %icmp_ln336, i32 %xor_ln336, i32 %shl_ln329, !bitwidth !281
  %shl_ln338 = shl i32 %x_3, 1, !bitwidth !281
  %x_4 = xor i32 %x_3, %shl_ln338, !bitwidth !281
  %tmp_7 = call i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32 %x_4, i32 8, i32 31), !bitwidth !288
  %and_ln3 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_7, i8 0), !bitwidth !281
  %icmp_ln339 = icmp eq i32 %and_ln3, 256, !bitwidth !168
  %xor_ln339 = xor i32 %x_4, 283, !bitwidth !281
  %x_5 = select i1 %icmp_ln339, i32 %xor_ln339, i32 %x_4, !bitwidth !281
  %word_load_1 = load i32, i32* %word_addr_1, align 4, !bitwidth !281
  %xor_ln341 = xor i32 %x_6, %x_9, !bitwidth !281
  %xor_ln341_1 = xor i32 %select_ln336, %x_5, !bitwidth !281
  %xor_ln341_3 = xor i32 %xor_ln341_1, %word_load_1, !bitwidth !281
  %xor_ln341_2 = xor i32 %xor_ln341_3, %xor_ln341, !bitwidth !281
  store i32 %xor_ln341_2, i32* %ret_addr_1, align 4, !bitwidth !144, !dep_idx !300, !deps !295
  %ret_addr_2 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %zext_ln333, !bitwidth !7
  %tmp_8 = call i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32 %x_3, i32 7, i32 30), !bitwidth !288
  %and_ln4 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_8, i8 0), !bitwidth !281
  %icmp_ln345 = icmp eq i32 %and_ln4, 256, !bitwidth !168
  %xor_ln345 = xor i32 %shl_ln338, 283, !bitwidth !281
  %select_ln345 = select i1 %icmp_ln345, i32 %xor_ln345, i32 %shl_ln338, !bitwidth !281
  %shl_ln347 = shl i32 %x_6, 1, !bitwidth !281
  %x_7 = xor i32 %x_6, %shl_ln347, !bitwidth !281
  %tmp_s = call i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32 %x_7, i32 8, i32 31), !bitwidth !288
  %and_ln5 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_s, i8 0), !bitwidth !281
  %icmp_ln348 = icmp eq i32 %and_ln5, 256, !bitwidth !168
  %xor_ln348 = xor i32 %x_7, 283, !bitwidth !281
  %x_8 = select i1 %icmp_ln348, i32 %xor_ln348, i32 %x_7, !bitwidth !281
  %word_load_2 = load i32, i32* %word_addr_2, align 4, !bitwidth !281
  %xor_ln350 = xor i32 %x, %x_9, !bitwidth !281
  %xor_ln350_1 = xor i32 %select_ln345, %x_8, !bitwidth !281
  %xor_ln350_3 = xor i32 %xor_ln350_1, %word_load_2, !bitwidth !281
  %xor_ln350_2 = xor i32 %xor_ln350_3, %xor_ln350, !bitwidth !281
  store i32 %xor_ln350_2, i32* %ret_addr_2, align 8, !bitwidth !144, !dep_idx !301, !deps !295
  %ret_addr_3 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %zext_ln333_1, !bitwidth !7
  %tmp_1 = call i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32 %x_6, i32 7, i32 30), !bitwidth !288
  %and_ln6 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_1, i8 0), !bitwidth !281
  %icmp_ln354 = icmp eq i32 %and_ln6, 256, !bitwidth !168
  %xor_ln354 = xor i32 %shl_ln347, 283, !bitwidth !281
  %select_ln354 = select i1 %icmp_ln354, i32 %xor_ln354, i32 %shl_ln347, !bitwidth !281
  %x_10 = xor i32 %x_9, %shl_ln326, !bitwidth !281
  %tmp_3 = call i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32 %x_10, i32 8, i32 31), !bitwidth !288
  %and_ln7 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_3, i8 0), !bitwidth !281
  %icmp_ln357 = icmp eq i32 %and_ln7, 256, !bitwidth !168
  %xor_ln357 = xor i32 %x_10, 283, !bitwidth !281
  %x_11 = select i1 %icmp_ln357, i32 %xor_ln357, i32 %x_10, !bitwidth !281
  %word_load_3 = load i32, i32* %word_addr_3, align 4, !bitwidth !281
  %xor_ln359 = xor i32 %x_3, %x, !bitwidth !281
  %xor_ln359_1 = xor i32 %x_11, %select_ln354, !bitwidth !281
  %xor_ln359_3 = xor i32 %xor_ln359_1, %word_load_3, !bitwidth !281
  %xor_ln359_2 = xor i32 %xor_ln359_3, %xor_ln359, !bitwidth !281
  store i32 %xor_ln359_2, i32* %ret_addr_3, align 4, !bitwidth !144, !dep_idx !302, !deps !295
  store i3 %add_ln324, i3* %j, align 1, !bitwidth !144, !dep_idx !303, !deps !304
  br label %for.body, !llvm.loop !264, !bitwidth !144

for.inc266:                                       ; preds = %for.inc266.split, %for.inc266.preheader
  %j_3 = load i3, i3* %j_1, align 1, !bitwidth !259, !dep_idx !307, !deps !308
  %icmp_ln364 = icmp eq i3 %j_3, -4, !bitwidth !168
  %add_ln364 = add nuw i3 %j_3, 1, !bitwidth !259
  br i1 %icmp_ln364, label %for.end268, label %for.inc266.split, !llvm.loop !311, !bitwidth !144

for.inc266.split:                                 ; preds = %for.inc266
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !184
  call void (...) @_ssdm_op_SpecLoopName([29 x i8]* @empty_10)
  %trunc_ln366 = trunc i3 %j_3 to i2, !bitwidth !279
  %shl_ln4 = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %trunc_ln366, i2 0), !bitwidth !37
  %zext_ln366 = zext i4 %shl_ln4 to i64, !bitwidth !280
  %ret_addr_4 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %zext_ln366, !bitwidth !7
  %ret_load = load i32, i32* %ret_addr_4, align 16, !bitwidth !281, !dep_idx !315, !deps !316
  %statemt_addr_4 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln366, !bitwidth !7
  store i32 %ret_load, i32* %statemt_addr_4, align 4, !bitwidth !144, !dep_idx !321, !deps !322
  %or_ln367 = or i4 %shl_ln4, 1, !bitwidth !37
  %zext_ln367 = zext i4 %or_ln367 to i64, !bitwidth !280
  %ret_addr_5 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %zext_ln367, !bitwidth !7
  %ret_load_1 = load i32, i32* %ret_addr_5, align 4, !bitwidth !281, !dep_idx !327, !deps !316
  %statemt_addr_5 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln367, !bitwidth !7
  store i32 %ret_load_1, i32* %statemt_addr_5, align 4, !bitwidth !144, !dep_idx !328, !deps !322
  %or_ln368 = or i4 %shl_ln4, 2, !bitwidth !37
  %zext_ln368 = zext i4 %or_ln368 to i64, !bitwidth !280
  %ret_addr_6 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %zext_ln368, !bitwidth !7
  %ret_load_2 = load i32, i32* %ret_addr_6, align 8, !bitwidth !281, !dep_idx !329, !deps !316
  %statemt_addr_6 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln368, !bitwidth !7
  store i32 %ret_load_2, i32* %statemt_addr_6, align 4, !bitwidth !144, !dep_idx !330, !deps !322
  %or_ln369 = or i4 %shl_ln4, 3, !bitwidth !37
  %zext_ln369 = zext i4 %or_ln369 to i64, !bitwidth !280
  %ret_addr_7 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %zext_ln369, !bitwidth !7
  %ret_load_3 = load i32, i32* %ret_addr_7, align 4, !bitwidth !281, !dep_idx !331, !deps !316
  %statemt_addr_7 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln369, !bitwidth !7
  store i32 %ret_load_3, i32* %statemt_addr_7, align 4, !bitwidth !144, !dep_idx !332, !deps !322
  store i3 %add_ln364, i3* %j_1, align 1, !bitwidth !144, !dep_idx !333, !deps !334
  br label %for.inc266, !llvm.loop !311, !bitwidth !144

for.end268:                                       ; preds = %for.inc266
  ret void, !bitwidth !144
}

; Function Attrs: noinline nounwind
define internal fastcc void @KeySchedule([32 x i32]* noalias nocapture %key) unnamed_addr #2 {
entry:
  %j = alloca i3, align 1, !bitwidth !253
  call void (...) @_ssdm_op_SpecInterface([32 x i32]* %key, [10 x i8]* @empty_11, i32 0, i32 0, [1 x i8]* @empty, i32 -1, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, [1 x i8]* @empty, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, i32 -1, i32 0)
  store i3 0, i3* %j, align 1, !bitwidth !144, !dep_idx !337, !deps !338
  br label %KeySchedule_label5, !bitwidth !144

KeySchedule_label5:                               ; preds = %for.inc16, %entry
  %j_4 = load i3, i3* %j, align 1, !bitwidth !259, !dep_idx !341, !deps !342
  %icmp_ln554 = icmp eq i3 %j_4, -4, !bitwidth !168
  %add_ln554 = add nuw i3 %j_4, 1, !bitwidth !259
  br i1 %icmp_ln554, label %KeySchedule_label7.preheader, label %KeySchedule_label5.split, !llvm.loop !345, !bitwidth !144

KeySchedule_label7.preheader:                     ; preds = %KeySchedule_label5
  %j_2 = alloca i6, align 1, !bitwidth !353
  store i6 4, i6* %j_2, align 1, !bitwidth !144, !dep_idx !354, !deps !355
  br label %KeySchedule_label7, !bitwidth !144

KeySchedule_label5.split:                         ; preds = %KeySchedule_label5
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !184
  call void (...) @_ssdm_op_SpecLoopName([19 x i8]* @empty_4)
  %empty = trunc i3 %j_4 to i2, !bitwidth !279
  %tmp_s = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %empty, i2 0), !bitwidth !37
  br label %for.inc, !bitwidth !144

for.inc:                                          ; preds = %for.inc.split, %KeySchedule_label5.split
  %i = phi i3 [ %add_ln557, %for.inc.split ], [ 0, %KeySchedule_label5.split ], !bitwidth !259
  %icmp_ln557 = icmp eq i3 %i, -4, !bitwidth !168
  %add_ln557 = add nuw i3 %i, 1, !bitwidth !259
  br i1 %icmp_ln557, label %for.inc16, label %for.inc.split, !llvm.loop !358, !bitwidth !144

for.inc.split:                                    ; preds = %for.inc
  %tmp_13 = call i10 @_ssdm_op_BitConcatenate.i10.i3.i7(i3 %i, i7 0), !bitwidth !373
  %zext_ln559_1 = zext i10 %tmp_13 to i11, !bitwidth !374
  %tmp_14 = call i6 @_ssdm_op_BitConcatenate.i6.i3.i3(i3 %i, i3 0), !bitwidth !254
  %zext_ln559_2 = zext i6 %tmp_14 to i11, !bitwidth !374
  %sub_ln559 = sub i11 %zext_ln559_1, %zext_ln559_2, !bitwidth !375
  %tmp_35_cast = call i6 @_ssdm_op_PartSelect.i6.i11.i32.i32(i11 %sub_ln559, i32 3, i32 8), !bitwidth !254
  %tmp_15 = call i9 @_ssdm_op_BitConcatenate.i9.i6.i3(i6 %tmp_35_cast, i3 %j_4), !bitwidth !376
  %zext_ln559_3 = zext i9 %tmp_15 to i64, !bitwidth !280
  %word_addr_7 = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln559_3, !bitwidth !7
  %zext_ln557 = zext i3 %i to i4, !bitwidth !377
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !246
  call void (...) @_ssdm_op_SpecLoopName([19 x i8]* @empty_14)
  %add_ln559 = add nuw i4 %zext_ln557, %tmp_s, !bitwidth !37
  %zext_ln559 = zext i4 %add_ln559 to i64, !bitwidth !280
  %key_addr = getelementptr [32 x i32], [32 x i32]* %key, i64 0, i64 %zext_ln559, !bitwidth !7
  %key_load = load i32, i32* %key_addr, align 4, !bitwidth !281
  store i32 %key_load, i32* %word_addr_7, align 4, !bitwidth !144, !dep_idx !378, !deps !379
  br label %for.inc, !llvm.loop !358, !bitwidth !144

for.inc16:                                        ; preds = %for.inc
  store i3 %add_ln554, i3* %j, align 1, !bitwidth !144, !dep_idx !386, !deps !387
  br label %KeySchedule_label5, !llvm.loop !345, !bitwidth !144

KeySchedule_label7:                               ; preds = %for.inc136, %KeySchedule_label7.preheader
  %j_5 = load i6, i6* %j_2, align 1, !bitwidth !254, !dep_idx !390, !deps !391
  %icmp_ln565 = icmp eq i6 %j_5, -20, !bitwidth !168
  br i1 %icmp_ln565, label %cleanup, label %KeySchedule_label7.split_ifconv, !llvm.loop !394, !bitwidth !144

KeySchedule_label7.split_ifconv:                  ; preds = %KeySchedule_label7
  %zext_ln501 = zext i6 %j_5 to i9, !bitwidth !292
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 40, i64 40, i64 40), !fpga.pragma.source !184
  call void (...) @_ssdm_op_SpecLoopName([19 x i8]* @empty_13)
  %empty_69 = trunc i6 %j_5 to i2, !bitwidth !279
  %icmp_ln570 = icmp eq i2 %empty_69, 0, !bitwidth !168
  %add_ln571 = add nuw i6 %j_5, -1, !bitwidth !254
  %zext_ln571_1 = zext i6 %add_ln571 to i64, !bitwidth !280
  %zext_ln571_2 = zext i6 %add_ln571 to i9, !bitwidth !292
  %zext_ln571_4 = zext i6 %add_ln571 to i8, !bitwidth !293
  %add_ln571_2 = add i8 %zext_ln571_4, 120, !bitwidth !68
  %zext_ln571_5 = zext i8 %add_ln571_2 to i64, !bitwidth !280
  %word_addr = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln571_5, !bitwidth !7
  %add_ln572 = add i9 %zext_ln571_2, 240, !bitwidth !70
  %zext_ln572 = zext i9 %add_ln572 to i64, !bitwidth !280
  %word_addr_4 = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln572, !bitwidth !7
  %add_ln573 = add i9 %zext_ln571_2, -152, !bitwidth !70
  %zext_ln573 = zext i9 %add_ln573 to i64, !bitwidth !280
  %word_addr_5 = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln573, !bitwidth !7
  %word_addr_6 = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln571_1, !bitwidth !7
  %temp_1_1 = load i32, i32* %word_addr, align 4, !bitwidth !281, !dep_idx !402, !deps !403
  %trunc_ln572 = trunc i32 %temp_1_1 to i8, !bitwidth !407
  %temp_2_1 = load i32, i32* %word_addr_4, align 4, !bitwidth !281, !dep_idx !408, !deps !403
  %trunc_ln573 = trunc i32 %temp_2_1 to i8, !bitwidth !407
  %word_load_5 = load i32, i32* %word_addr_5, align 4, !bitwidth !281, !dep_idx !409, !deps !403
  %trunc_ln574 = trunc i32 %word_load_5 to i8, !bitwidth !407
  %temp_0_1 = load i32, i32* %word_addr_6, align 4, !bitwidth !281, !dep_idx !410, !deps !403
  %trunc_ln571 = trunc i32 %temp_0_1 to i8, !bitwidth !407
  %tmp_1 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %temp_1_1, i32 31), !bitwidth !168
  %sub_ln571 = sub i8 0, %trunc_ln572, !bitwidth !407
  %trunc_ln571_2 = call i4 @_ssdm_op_PartSelect.i4.i8.i32.i32(i8 %sub_ln571, i32 4, i32 7), !bitwidth !37
  %sub_ln571_1 = sub i4 0, %trunc_ln571_2, !bitwidth !37
  %tmp_4 = call i4 @_ssdm_op_PartSelect.i4.i32.i32.i32(i32 %temp_1_1, i32 4, i32 7), !bitwidth !37
  %select_ln571 = select i1 %tmp_1, i4 %sub_ln571_1, i4 %tmp_4, !bitwidth !37
  %tmp_5 = call i8 @_ssdm_op_BitConcatenate.i8.i4.i4(i4 %select_ln571, i4 0), !bitwidth !407
  %trunc_ln571_1 = trunc i32 %temp_1_1 to i4, !bitwidth !37
  %p_and_f1 = call i5 @_ssdm_op_BitConcatenate.i5.i1.i4(i1 false, i4 %trunc_ln571_1), !bitwidth !411
  %zext_ln571_6 = zext i5 %p_and_f1 to i6, !bitwidth !278
  %sub_ln571_2 = sub i4 0, %trunc_ln571_1, !bitwidth !37
  %p_and_t1 = call i5 @_ssdm_op_BitConcatenate.i5.i1.i4(i1 false, i4 %sub_ln571_2), !bitwidth !411
  %zext_ln571_7 = zext i5 %p_and_t1 to i6, !bitwidth !278
  %sub_ln571_3 = sub i6 0, %zext_ln571_7, !bitwidth !84
  %select_ln571_1 = select i1 %tmp_1, i6 %sub_ln571_3, i6 %zext_ln571_6, !bitwidth !254
  %sext_ln571 = sext i6 %select_ln571_1 to i8, !bitwidth !68
  %add_ln571_3 = add i8 %tmp_5, %sext_ln571, !bitwidth !407
  %zext_ln571_8 = zext i8 %add_ln571_3 to i64, !bitwidth !280
  %Sbox_addr = getelementptr [256 x i8], [256 x i8]* @Sbox, i64 0, i64 %zext_ln571_8, !bitwidth !12
  %Sbox_load = load i8, i8* %Sbox_addr, align 1, !bitwidth !407
  %trunc_ln571_4 = call i4 @_ssdm_op_PartSelect.i4.i6.i32.i32(i6 %j_5, i32 2, i32 5), !bitwidth !37
  %add_ln571_1 = add i4 %trunc_ln571_4, -1, !bitwidth !37
  %zext_ln571 = zext i4 %add_ln571_1 to i64, !bitwidth !280
  %Rcon0_addr = getelementptr inbounds [30 x i8], [30 x i8]* @Rcon0, i64 0, i64 %zext_ln571, !bitwidth !12
  %Rcon0_load = load i8, i8* %Rcon0_addr, align 1, !bitwidth !407
  %temp_0 = xor i8 %Rcon0_load, %Sbox_load, !bitwidth !407
  %zext_ln571_3 = zext i8 %temp_0 to i32, !bitwidth !412
  %tmp_2 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %temp_2_1, i32 31), !bitwidth !168
  %sub_ln572 = sub i8 0, %trunc_ln573, !bitwidth !407
  %trunc_ln572_2 = call i4 @_ssdm_op_PartSelect.i4.i8.i32.i32(i8 %sub_ln572, i32 4, i32 7), !bitwidth !37
  %sub_ln572_1 = sub i4 0, %trunc_ln572_2, !bitwidth !37
  %tmp_6 = call i4 @_ssdm_op_PartSelect.i4.i32.i32.i32(i32 %temp_2_1, i32 4, i32 7), !bitwidth !37
  %select_ln572 = select i1 %tmp_2, i4 %sub_ln572_1, i4 %tmp_6, !bitwidth !37
  %tmp_7 = call i8 @_ssdm_op_BitConcatenate.i8.i4.i4(i4 %select_ln572, i4 0), !bitwidth !407
  %trunc_ln572_1 = trunc i32 %temp_2_1 to i4, !bitwidth !37
  %p_and_f2 = call i5 @_ssdm_op_BitConcatenate.i5.i1.i4(i1 false, i4 %trunc_ln572_1), !bitwidth !411
  %zext_ln572_2 = zext i5 %p_and_f2 to i6, !bitwidth !278
  %sub_ln572_2 = sub i4 0, %trunc_ln572_1, !bitwidth !37
  %p_and_t2 = call i5 @_ssdm_op_BitConcatenate.i5.i1.i4(i1 false, i4 %sub_ln572_2), !bitwidth !411
  %zext_ln572_3 = zext i5 %p_and_t2 to i6, !bitwidth !278
  %sub_ln572_3 = sub i6 0, %zext_ln572_3, !bitwidth !84
  %select_ln572_1 = select i1 %tmp_2, i6 %sub_ln572_3, i6 %zext_ln572_2, !bitwidth !254
  %sext_ln572 = sext i6 %select_ln572_1 to i8, !bitwidth !68
  %add_ln572_1 = add i8 %tmp_7, %sext_ln572, !bitwidth !407
  %zext_ln572_4 = zext i8 %add_ln572_1 to i64, !bitwidth !280
  %Sbox_addr_1 = getelementptr [256 x i8], [256 x i8]* @Sbox, i64 0, i64 %zext_ln572_4, !bitwidth !12
  %temp_1 = load i8, i8* %Sbox_addr_1, align 1, !bitwidth !407
  %zext_ln572_1 = zext i8 %temp_1 to i32, !bitwidth !412
  %tmp_3 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %word_load_5, i32 31), !bitwidth !168
  %sub_ln573 = sub i8 0, %trunc_ln574, !bitwidth !407
  %trunc_ln573_2 = call i4 @_ssdm_op_PartSelect.i4.i8.i32.i32(i8 %sub_ln573, i32 4, i32 7), !bitwidth !37
  %sub_ln573_1 = sub i4 0, %trunc_ln573_2, !bitwidth !37
  %tmp_8 = call i4 @_ssdm_op_PartSelect.i4.i32.i32.i32(i32 %word_load_5, i32 4, i32 7), !bitwidth !37
  %select_ln573 = select i1 %tmp_3, i4 %sub_ln573_1, i4 %tmp_8, !bitwidth !37
  %tmp_9 = call i8 @_ssdm_op_BitConcatenate.i8.i4.i4(i4 %select_ln573, i4 0), !bitwidth !407
  %trunc_ln573_1 = trunc i32 %word_load_5 to i4, !bitwidth !37
  %p_and_f4 = call i5 @_ssdm_op_BitConcatenate.i5.i1.i4(i1 false, i4 %trunc_ln573_1), !bitwidth !411
  %zext_ln573_2 = zext i5 %p_and_f4 to i6, !bitwidth !278
  %sub_ln573_2 = sub i4 0, %trunc_ln573_1, !bitwidth !37
  %p_and_t6 = call i5 @_ssdm_op_BitConcatenate.i5.i1.i4(i1 false, i4 %sub_ln573_2), !bitwidth !411
  %zext_ln573_3 = zext i5 %p_and_t6 to i6, !bitwidth !278
  %sub_ln573_3 = sub i6 0, %zext_ln573_3, !bitwidth !84
  %select_ln573_1 = select i1 %tmp_3, i6 %sub_ln573_3, i6 %zext_ln573_2, !bitwidth !254
  %sext_ln573 = sext i6 %select_ln573_1 to i8, !bitwidth !68
  %add_ln573_1 = add i8 %tmp_9, %sext_ln573, !bitwidth !407
  %zext_ln573_4 = zext i8 %add_ln573_1 to i64, !bitwidth !280
  %Sbox_addr_2 = getelementptr [256 x i8], [256 x i8]* @Sbox, i64 0, i64 %zext_ln573_4, !bitwidth !12
  %temp_2 = load i8, i8* %Sbox_addr_2, align 1, !bitwidth !407
  %zext_ln573_1 = zext i8 %temp_2 to i32, !bitwidth !412
  %tmp_10 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %temp_0_1, i32 31), !bitwidth !168
  %sub_ln574 = sub i8 0, %trunc_ln571, !bitwidth !407
  %trunc_ln574_2 = call i4 @_ssdm_op_PartSelect.i4.i8.i32.i32(i8 %sub_ln574, i32 4, i32 7), !bitwidth !37
  %sub_ln574_1 = sub i4 0, %trunc_ln574_2, !bitwidth !37
  %tmp_11 = call i4 @_ssdm_op_PartSelect.i4.i32.i32.i32(i32 %temp_0_1, i32 4, i32 7), !bitwidth !37
  %select_ln574 = select i1 %tmp_10, i4 %sub_ln574_1, i4 %tmp_11, !bitwidth !37
  %tmp_12 = call i8 @_ssdm_op_BitConcatenate.i8.i4.i4(i4 %select_ln574, i4 0), !bitwidth !407
  %trunc_ln574_1 = trunc i32 %temp_0_1 to i4, !bitwidth !37
  %p_and_f = call i5 @_ssdm_op_BitConcatenate.i5.i1.i4(i1 false, i4 %trunc_ln574_1), !bitwidth !411
  %zext_ln574 = zext i5 %p_and_f to i6, !bitwidth !278
  %sub_ln574_2 = sub i4 0, %trunc_ln574_1, !bitwidth !37
  %p_and_t = call i5 @_ssdm_op_BitConcatenate.i5.i1.i4(i1 false, i4 %sub_ln574_2), !bitwidth !411
  %zext_ln574_1 = zext i5 %p_and_t to i6, !bitwidth !278
  %sub_ln574_3 = sub i6 0, %zext_ln574_1, !bitwidth !84
  %select_ln574_1 = select i1 %tmp_10, i6 %sub_ln574_3, i6 %zext_ln574, !bitwidth !254
  %sext_ln574 = sext i6 %select_ln574_1 to i8, !bitwidth !68
  %add_ln574 = add i8 %tmp_12, %sext_ln574, !bitwidth !407
  %zext_ln574_2 = zext i8 %add_ln574 to i64, !bitwidth !280
  %Sbox_addr_3 = getelementptr [256 x i8], [256 x i8]* @Sbox, i64 0, i64 %zext_ln574_2, !bitwidth !12
  %Sbox_load_3 = load i8, i8* %Sbox_addr_3, align 1, !bitwidth !407
  %zext_ln577 = zext i8 %Sbox_load_3 to i32, !bitwidth !412
  %temp_2_2 = select i1 %icmp_ln570, i32 %zext_ln573_1, i32 %temp_2_1, !bitwidth !281
  %temp_1_2 = select i1 %icmp_ln570, i32 %zext_ln572_1, i32 %temp_1_1, !bitwidth !281
  %temp_0_2 = select i1 %icmp_ln570, i32 %zext_ln571_3, i32 %temp_0_1, !bitwidth !281
  %temp_3 = select i1 %icmp_ln570, i32 %zext_ln577, i32 %word_load_5, !bitwidth !281
  %empty_70 = add nuw i6 %j_5, -4, !bitwidth !254
  %zext_ln592 = zext i6 %empty_70 to i9, !bitwidth !292
  br label %for.inc133, !bitwidth !144

for.inc133:                                       ; preds = %for.inc133.split, %KeySchedule_label7.split_ifconv
  %i_2 = phi i3 [ %add_ln592, %for.inc133.split ], [ 0, %KeySchedule_label7.split_ifconv ], !bitwidth !259
  %trunc_ln592 = trunc i3 %i_2 to i2, !bitwidth !279
  %icmp_ln592 = icmp eq i3 %i_2, -4, !bitwidth !168
  %add_ln592 = add nuw i3 %i_2, 1, !bitwidth !259
  br i1 %icmp_ln592, label %for.inc136, label %for.inc133.split, !llvm.loop !413, !bitwidth !144

for.inc133.split:                                 ; preds = %for.inc133
  %tmp_16 = call i9 @_ssdm_op_BitConcatenate.i9.i2.i7(i2 %trunc_ln592, i7 0), !bitwidth !376
  %tmp_17 = call i6 @_ssdm_op_BitConcatenate.i6.i3.i3(i3 %i_2, i3 0), !bitwidth !254
  %zext_ln594 = zext i6 %tmp_17 to i9, !bitwidth !292
  %sub_ln594 = sub i9 %tmp_16, %zext_ln594, !bitwidth !376
  %add_ln594 = add i9 %sub_ln594, %zext_ln592, !bitwidth !376
  %zext_ln594_1 = zext i9 %add_ln594 to i64, !bitwidth !280
  %word_addr_8 = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln594_1, !bitwidth !7
  %add_ln594_1 = add i9 %sub_ln594, %zext_ln501, !bitwidth !376
  %zext_ln594_2 = zext i9 %add_ln594_1 to i64, !bitwidth !280
  %word_addr_9 = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln594_2, !bitwidth !7
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !246
  call void (...) @_ssdm_op_SpecLoopName([19 x i8]* @empty_12)
  %word_load = load i32, i32* %word_addr_8, align 4, !bitwidth !281, !dep_idx !427, !deps !428
  %tmp = call i32 @_ssdm_op_Mux.ap_auto.4i32.i2(i32 %temp_0_2, i32 %temp_1_2, i32 %temp_2_2, i32 %temp_3, i2 %trunc_ln592), !bitwidth !281
  %xor_ln594 = xor i32 %word_load, %tmp, !bitwidth !281
  store i32 %xor_ln594, i32* %word_addr_9, align 4, !bitwidth !144, !dep_idx !431, !deps !432
  br label %for.inc133, !llvm.loop !413, !bitwidth !144

for.inc136:                                       ; preds = %for.inc133
  %add_ln565 = add nuw i6 %j_5, 1, !bitwidth !254
  store i6 %add_ln565, i6* %j_2, align 1, !bitwidth !144, !dep_idx !441, !deps !442
  br label %KeySchedule_label7, !llvm.loop !394, !bitwidth !144

cleanup:                                          ; preds = %KeySchedule_label7
  ret void, !bitwidth !144
}

; Function Attrs: noinline nounwind
define internal fastcc void @InversShiftRow_ByteSub([32 x i32]* noalias nocapture %statemt) unnamed_addr #2 {
entry:
  call void (...) @_ssdm_op_SpecInterface([32 x i32]* %statemt, [10 x i8]* @empty_11, i32 0, i32 0, [1 x i8]* @empty, i32 -1, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, [1 x i8]* @empty, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, i32 -1, i32 0)
  %statemt_addr = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 13, !bitwidth !7
  %statemt_load = load i32, i32* %statemt_addr, align 4, !bitwidth !281, !dep_idx !445, !deps !446
  %trunc_ln222 = trunc i32 %statemt_load to i8, !bitwidth !407
  %zext_ln222 = zext i8 %trunc_ln222 to i64, !bitwidth !280
  %invSbox_addr = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln222, !bitwidth !12
  %temp = load i8, i8* %invSbox_addr, align 1, !bitwidth !407
  %zext_ln218 = zext i8 %temp to i32, !bitwidth !412
  %statemt_addr_8 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 9, !bitwidth !7
  %statemt_load_4 = load i32, i32* %statemt_addr_8, align 4, !bitwidth !281, !dep_idx !448, !deps !449
  %trunc_ln223 = trunc i32 %statemt_load_4 to i8, !bitwidth !407
  %zext_ln223 = zext i8 %trunc_ln223 to i64, !bitwidth !280
  %invSbox_addr_1 = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln223, !bitwidth !12
  %invSbox_load = load i8, i8* %invSbox_addr_1, align 1, !bitwidth !407
  %zext_ln223_1 = zext i8 %invSbox_load to i32, !bitwidth !412
  store i32 %zext_ln223_1, i32* %statemt_addr, align 4, !bitwidth !144, !dep_idx !451, !deps !452
  %statemt_addr_9 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 5, !bitwidth !7
  %statemt_load_5 = load i32, i32* %statemt_addr_9, align 4, !bitwidth !281, !dep_idx !454, !deps !455
  %trunc_ln224 = trunc i32 %statemt_load_5 to i8, !bitwidth !407
  %zext_ln224 = zext i8 %trunc_ln224 to i64, !bitwidth !280
  %invSbox_addr_2 = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln224, !bitwidth !12
  %invSbox_load_1 = load i8, i8* %invSbox_addr_2, align 1, !bitwidth !407
  %zext_ln224_1 = zext i8 %invSbox_load_1 to i32, !bitwidth !412
  store i32 %zext_ln224_1, i32* %statemt_addr_8, align 4, !bitwidth !144, !dep_idx !457, !deps !458
  %statemt_addr_10 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 1, !bitwidth !7
  %statemt_load_6 = load i32, i32* %statemt_addr_10, align 4, !bitwidth !281, !dep_idx !460, !deps !461
  %trunc_ln225 = trunc i32 %statemt_load_6 to i8, !bitwidth !407
  %zext_ln225 = zext i8 %trunc_ln225 to i64, !bitwidth !280
  %invSbox_addr_3 = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln225, !bitwidth !12
  %invSbox_load_2 = load i8, i8* %invSbox_addr_3, align 1, !bitwidth !407
  %zext_ln225_1 = zext i8 %invSbox_load_2 to i32, !bitwidth !412
  store i32 %zext_ln225_1, i32* %statemt_addr_9, align 4, !bitwidth !144, !dep_idx !463, !deps !464
  store i32 %zext_ln218, i32* %statemt_addr_10, align 4, !bitwidth !144, !dep_idx !466, !deps !467
  %statemt_addr_11 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 14, !bitwidth !7
  %statemt_load_7 = load i32, i32* %statemt_addr_11, align 4, !bitwidth !281, !dep_idx !469, !deps !470
  %trunc_ln227 = trunc i32 %statemt_load_7 to i8, !bitwidth !407
  %zext_ln227 = zext i8 %trunc_ln227 to i64, !bitwidth !280
  %invSbox_addr_4 = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln227, !bitwidth !12
  %temp_1 = load i8, i8* %invSbox_addr_4, align 1, !bitwidth !407
  %zext_ln218_1 = zext i8 %temp_1 to i32, !bitwidth !412
  %statemt_addr_12 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 6, !bitwidth !7
  %statemt_load_8 = load i32, i32* %statemt_addr_12, align 4, !bitwidth !281, !dep_idx !472, !deps !473
  %trunc_ln228 = trunc i32 %statemt_load_8 to i8, !bitwidth !407
  %zext_ln228 = zext i8 %trunc_ln228 to i64, !bitwidth !280
  %invSbox_addr_5 = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln228, !bitwidth !12
  %invSbox_load_4 = load i8, i8* %invSbox_addr_5, align 1, !bitwidth !407
  %zext_ln228_1 = zext i8 %invSbox_load_4 to i32, !bitwidth !412
  store i32 %zext_ln228_1, i32* %statemt_addr_11, align 4, !bitwidth !144, !dep_idx !475, !deps !476
  store i32 %zext_ln218_1, i32* %statemt_addr_12, align 4, !bitwidth !144, !dep_idx !478, !deps !479
  %statemt_addr_13 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 2, !bitwidth !7
  %statemt_load_9 = load i32, i32* %statemt_addr_13, align 4, !bitwidth !281, !dep_idx !481, !deps !482
  %trunc_ln230 = trunc i32 %statemt_load_9 to i8, !bitwidth !407
  %zext_ln230 = zext i8 %trunc_ln230 to i64, !bitwidth !280
  %invSbox_addr_6 = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln230, !bitwidth !12
  %temp_2 = load i8, i8* %invSbox_addr_6, align 1, !bitwidth !407
  %zext_ln218_2 = zext i8 %temp_2 to i32, !bitwidth !412
  %statemt_addr_14 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 10, !bitwidth !7
  %statemt_load_10 = load i32, i32* %statemt_addr_14, align 4, !bitwidth !281, !dep_idx !484, !deps !485
  %trunc_ln231 = trunc i32 %statemt_load_10 to i8, !bitwidth !407
  %zext_ln231 = zext i8 %trunc_ln231 to i64, !bitwidth !280
  %invSbox_addr_7 = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln231, !bitwidth !12
  %invSbox_load_6 = load i8, i8* %invSbox_addr_7, align 1, !bitwidth !407
  %zext_ln231_1 = zext i8 %invSbox_load_6 to i32, !bitwidth !412
  store i32 %zext_ln231_1, i32* %statemt_addr_13, align 4, !bitwidth !144, !dep_idx !487, !deps !488
  store i32 %zext_ln218_2, i32* %statemt_addr_14, align 4, !bitwidth !144, !dep_idx !490, !deps !491
  %statemt_addr_15 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 15, !bitwidth !7
  %statemt_load_11 = load i32, i32* %statemt_addr_15, align 4, !bitwidth !281, !dep_idx !493, !deps !494
  %trunc_ln233 = trunc i32 %statemt_load_11 to i8, !bitwidth !407
  %zext_ln233 = zext i8 %trunc_ln233 to i64, !bitwidth !280
  %invSbox_addr_8 = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln233, !bitwidth !12
  %temp_3 = load i8, i8* %invSbox_addr_8, align 1, !bitwidth !407
  %zext_ln218_3 = zext i8 %temp_3 to i32, !bitwidth !412
  %statemt_addr_16 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 3, !bitwidth !7
  %statemt_load_12 = load i32, i32* %statemt_addr_16, align 4, !bitwidth !281, !dep_idx !496, !deps !497
  %trunc_ln234 = trunc i32 %statemt_load_12 to i8, !bitwidth !407
  %zext_ln234 = zext i8 %trunc_ln234 to i64, !bitwidth !280
  %invSbox_addr_9 = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln234, !bitwidth !12
  %invSbox_load_8 = load i8, i8* %invSbox_addr_9, align 1, !bitwidth !407
  %zext_ln234_1 = zext i8 %invSbox_load_8 to i32, !bitwidth !412
  store i32 %zext_ln234_1, i32* %statemt_addr_15, align 4, !bitwidth !144, !dep_idx !499, !deps !500
  %statemt_addr_17 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 7, !bitwidth !7
  %statemt_load_13 = load i32, i32* %statemt_addr_17, align 4, !bitwidth !281, !dep_idx !502, !deps !503
  %trunc_ln235 = trunc i32 %statemt_load_13 to i8, !bitwidth !407
  %zext_ln235 = zext i8 %trunc_ln235 to i64, !bitwidth !280
  %invSbox_addr_10 = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln235, !bitwidth !12
  %invSbox_load_9 = load i8, i8* %invSbox_addr_10, align 1, !bitwidth !407
  %zext_ln235_1 = zext i8 %invSbox_load_9 to i32, !bitwidth !412
  store i32 %zext_ln235_1, i32* %statemt_addr_16, align 4, !bitwidth !144, !dep_idx !505, !deps !506
  %statemt_addr_18 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 11, !bitwidth !7
  %statemt_load_14 = load i32, i32* %statemt_addr_18, align 4, !bitwidth !281, !dep_idx !508, !deps !509
  %trunc_ln236 = trunc i32 %statemt_load_14 to i8, !bitwidth !407
  %zext_ln236 = zext i8 %trunc_ln236 to i64, !bitwidth !280
  %invSbox_addr_11 = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln236, !bitwidth !12
  %invSbox_load_10 = load i8, i8* %invSbox_addr_11, align 1, !bitwidth !407
  %zext_ln236_1 = zext i8 %invSbox_load_10 to i32, !bitwidth !412
  store i32 %zext_ln236_1, i32* %statemt_addr_17, align 4, !bitwidth !144, !dep_idx !511, !deps !512
  store i32 %zext_ln218_3, i32* %statemt_addr_18, align 4, !bitwidth !144, !dep_idx !514, !deps !515
  %statemt_addr_19 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 0, !bitwidth !7
  %statemt_load_15 = load i32, i32* %statemt_addr_19, align 4, !bitwidth !281, !dep_idx !517, !deps !518
  %trunc_ln238 = trunc i32 %statemt_load_15 to i8, !bitwidth !407
  %zext_ln238 = zext i8 %trunc_ln238 to i64, !bitwidth !280
  %invSbox_addr_12 = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln238, !bitwidth !12
  %invSbox_load_11 = load i8, i8* %invSbox_addr_12, align 1, !bitwidth !407
  %zext_ln238_1 = zext i8 %invSbox_load_11 to i32, !bitwidth !412
  store i32 %zext_ln238_1, i32* %statemt_addr_19, align 4, !bitwidth !144, !dep_idx !520, !deps !521
  %statemt_addr_20 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 4, !bitwidth !7
  %statemt_load_16 = load i32, i32* %statemt_addr_20, align 4, !bitwidth !281, !dep_idx !523, !deps !524
  %trunc_ln239 = trunc i32 %statemt_load_16 to i8, !bitwidth !407
  %zext_ln239 = zext i8 %trunc_ln239 to i64, !bitwidth !280
  %invSbox_addr_13 = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln239, !bitwidth !12
  %invSbox_load_12 = load i8, i8* %invSbox_addr_13, align 1, !bitwidth !407
  %zext_ln239_1 = zext i8 %invSbox_load_12 to i32, !bitwidth !412
  store i32 %zext_ln239_1, i32* %statemt_addr_20, align 4, !bitwidth !144, !dep_idx !526, !deps !527
  %statemt_addr_21 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 8, !bitwidth !7
  %statemt_load_17 = load i32, i32* %statemt_addr_21, align 4, !bitwidth !281, !dep_idx !529, !deps !530
  %trunc_ln240 = trunc i32 %statemt_load_17 to i8, !bitwidth !407
  %zext_ln240 = zext i8 %trunc_ln240 to i64, !bitwidth !280
  %invSbox_addr_14 = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln240, !bitwidth !12
  %invSbox_load_13 = load i8, i8* %invSbox_addr_14, align 1, !bitwidth !407
  %zext_ln240_1 = zext i8 %invSbox_load_13 to i32, !bitwidth !412
  store i32 %zext_ln240_1, i32* %statemt_addr_21, align 4, !bitwidth !144, !dep_idx !532, !deps !533
  %statemt_addr_22 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 12, !bitwidth !7
  %statemt_load_18 = load i32, i32* %statemt_addr_22, align 4, !bitwidth !281, !dep_idx !535, !deps !536
  %trunc_ln241 = trunc i32 %statemt_load_18 to i8, !bitwidth !407
  %zext_ln241 = zext i8 %trunc_ln241 to i64, !bitwidth !280
  %invSbox_addr_15 = getelementptr [256 x i8], [256 x i8]* @invSbox, i64 0, i64 %zext_ln241, !bitwidth !12
  %invSbox_load_14 = load i8, i8* %invSbox_addr_15, align 1, !bitwidth !407
  %zext_ln241_1 = zext i8 %invSbox_load_14 to i32, !bitwidth !412
  store i32 %zext_ln241_1, i32* %statemt_addr_22, align 4, !bitwidth !144, !dep_idx !538, !deps !539
  ret void, !bitwidth !144
}

; Function Attrs: noinline nounwind
define internal fastcc void @ByteSub_ShiftRow([32 x i32]* noalias nocapture %statemt) unnamed_addr #2 {
entry:
  call void (...) @_ssdm_op_SpecInterface([32 x i32]* %statemt, [10 x i8]* @empty_11, i32 0, i32 0, [1 x i8]* @empty, i32 -1, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, [1 x i8]* @empty, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, i32 -1, i32 0)
  %statemt_addr = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 1, !bitwidth !7
  %statemt_load = load i32, i32* %statemt_addr, align 4, !bitwidth !281, !dep_idx !541, !deps !542
  %trunc_ln102 = trunc i32 %statemt_load to i8, !bitwidth !407
  %zext_ln102 = zext i8 %trunc_ln102 to i64, !bitwidth !280
  %Sbox_1_addr = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln102, !bitwidth !12
  %temp = load i8, i8* %Sbox_1_addr, align 1, !bitwidth !407
  %zext_ln98 = zext i8 %temp to i32, !bitwidth !412
  %statemt_addr_23 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 5, !bitwidth !7
  %statemt_load_19 = load i32, i32* %statemt_addr_23, align 4, !bitwidth !281, !dep_idx !544, !deps !545
  %trunc_ln103 = trunc i32 %statemt_load_19 to i8, !bitwidth !407
  %zext_ln103 = zext i8 %trunc_ln103 to i64, !bitwidth !280
  %Sbox_1_addr_1 = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln103, !bitwidth !12
  %Sbox_1_load = load i8, i8* %Sbox_1_addr_1, align 1, !bitwidth !407
  %zext_ln103_1 = zext i8 %Sbox_1_load to i32, !bitwidth !412
  store i32 %zext_ln103_1, i32* %statemt_addr, align 4, !bitwidth !144, !dep_idx !547, !deps !548
  %statemt_addr_24 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 9, !bitwidth !7
  %statemt_load_20 = load i32, i32* %statemt_addr_24, align 4, !bitwidth !281, !dep_idx !550, !deps !551
  %trunc_ln104 = trunc i32 %statemt_load_20 to i8, !bitwidth !407
  %zext_ln104 = zext i8 %trunc_ln104 to i64, !bitwidth !280
  %Sbox_1_addr_2 = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln104, !bitwidth !12
  %Sbox_1_load_1 = load i8, i8* %Sbox_1_addr_2, align 1, !bitwidth !407
  %zext_ln104_1 = zext i8 %Sbox_1_load_1 to i32, !bitwidth !412
  store i32 %zext_ln104_1, i32* %statemt_addr_23, align 4, !bitwidth !144, !dep_idx !553, !deps !554
  %statemt_addr_25 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 13, !bitwidth !7
  %statemt_load_21 = load i32, i32* %statemt_addr_25, align 4, !bitwidth !281, !dep_idx !556, !deps !557
  %trunc_ln105 = trunc i32 %statemt_load_21 to i8, !bitwidth !407
  %zext_ln105 = zext i8 %trunc_ln105 to i64, !bitwidth !280
  %Sbox_1_addr_3 = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln105, !bitwidth !12
  %Sbox_1_load_2 = load i8, i8* %Sbox_1_addr_3, align 1, !bitwidth !407
  %zext_ln105_1 = zext i8 %Sbox_1_load_2 to i32, !bitwidth !412
  store i32 %zext_ln105_1, i32* %statemt_addr_24, align 4, !bitwidth !144, !dep_idx !559, !deps !560
  store i32 %zext_ln98, i32* %statemt_addr_25, align 4, !bitwidth !144, !dep_idx !562, !deps !563
  %statemt_addr_26 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 2, !bitwidth !7
  %statemt_load_22 = load i32, i32* %statemt_addr_26, align 4, !bitwidth !281, !dep_idx !565, !deps !566
  %trunc_ln107 = trunc i32 %statemt_load_22 to i8, !bitwidth !407
  %zext_ln107 = zext i8 %trunc_ln107 to i64, !bitwidth !280
  %Sbox_1_addr_4 = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln107, !bitwidth !12
  %temp_4 = load i8, i8* %Sbox_1_addr_4, align 1, !bitwidth !407
  %zext_ln98_1 = zext i8 %temp_4 to i32, !bitwidth !412
  %statemt_addr_27 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 10, !bitwidth !7
  %statemt_load_23 = load i32, i32* %statemt_addr_27, align 4, !bitwidth !281, !dep_idx !568, !deps !569
  %trunc_ln108 = trunc i32 %statemt_load_23 to i8, !bitwidth !407
  %zext_ln108 = zext i8 %trunc_ln108 to i64, !bitwidth !280
  %Sbox_1_addr_5 = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln108, !bitwidth !12
  %Sbox_1_load_4 = load i8, i8* %Sbox_1_addr_5, align 1, !bitwidth !407
  %zext_ln108_1 = zext i8 %Sbox_1_load_4 to i32, !bitwidth !412
  store i32 %zext_ln108_1, i32* %statemt_addr_26, align 4, !bitwidth !144, !dep_idx !571, !deps !572
  store i32 %zext_ln98_1, i32* %statemt_addr_27, align 4, !bitwidth !144, !dep_idx !574, !deps !575
  %statemt_addr_28 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 6, !bitwidth !7
  %statemt_load_24 = load i32, i32* %statemt_addr_28, align 4, !bitwidth !281, !dep_idx !577, !deps !578
  %trunc_ln110 = trunc i32 %statemt_load_24 to i8, !bitwidth !407
  %zext_ln110 = zext i8 %trunc_ln110 to i64, !bitwidth !280
  %Sbox_1_addr_6 = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln110, !bitwidth !12
  %temp_5 = load i8, i8* %Sbox_1_addr_6, align 1, !bitwidth !407
  %zext_ln98_2 = zext i8 %temp_5 to i32, !bitwidth !412
  %statemt_addr_29 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 14, !bitwidth !7
  %statemt_load_25 = load i32, i32* %statemt_addr_29, align 4, !bitwidth !281, !dep_idx !580, !deps !581
  %trunc_ln111 = trunc i32 %statemt_load_25 to i8, !bitwidth !407
  %zext_ln111 = zext i8 %trunc_ln111 to i64, !bitwidth !280
  %Sbox_1_addr_7 = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln111, !bitwidth !12
  %Sbox_1_load_6 = load i8, i8* %Sbox_1_addr_7, align 1, !bitwidth !407
  %zext_ln111_1 = zext i8 %Sbox_1_load_6 to i32, !bitwidth !412
  store i32 %zext_ln111_1, i32* %statemt_addr_28, align 4, !bitwidth !144, !dep_idx !583, !deps !584
  store i32 %zext_ln98_2, i32* %statemt_addr_29, align 4, !bitwidth !144, !dep_idx !586, !deps !587
  %statemt_addr_30 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 3, !bitwidth !7
  %statemt_load_26 = load i32, i32* %statemt_addr_30, align 4, !bitwidth !281, !dep_idx !589, !deps !590
  %trunc_ln113 = trunc i32 %statemt_load_26 to i8, !bitwidth !407
  %zext_ln113 = zext i8 %trunc_ln113 to i64, !bitwidth !280
  %Sbox_1_addr_8 = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln113, !bitwidth !12
  %temp_6 = load i8, i8* %Sbox_1_addr_8, align 1, !bitwidth !407
  %zext_ln98_3 = zext i8 %temp_6 to i32, !bitwidth !412
  %statemt_addr_31 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 15, !bitwidth !7
  %statemt_load_27 = load i32, i32* %statemt_addr_31, align 4, !bitwidth !281, !dep_idx !592, !deps !593
  %trunc_ln114 = trunc i32 %statemt_load_27 to i8, !bitwidth !407
  %zext_ln114 = zext i8 %trunc_ln114 to i64, !bitwidth !280
  %Sbox_1_addr_9 = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln114, !bitwidth !12
  %Sbox_1_load_8 = load i8, i8* %Sbox_1_addr_9, align 1, !bitwidth !407
  %zext_ln114_1 = zext i8 %Sbox_1_load_8 to i32, !bitwidth !412
  store i32 %zext_ln114_1, i32* %statemt_addr_30, align 4, !bitwidth !144, !dep_idx !595, !deps !596
  %statemt_addr_32 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 11, !bitwidth !7
  %statemt_load_28 = load i32, i32* %statemt_addr_32, align 4, !bitwidth !281, !dep_idx !598, !deps !599
  %trunc_ln115 = trunc i32 %statemt_load_28 to i8, !bitwidth !407
  %zext_ln115 = zext i8 %trunc_ln115 to i64, !bitwidth !280
  %Sbox_1_addr_10 = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln115, !bitwidth !12
  %Sbox_1_load_9 = load i8, i8* %Sbox_1_addr_10, align 1, !bitwidth !407
  %zext_ln115_1 = zext i8 %Sbox_1_load_9 to i32, !bitwidth !412
  store i32 %zext_ln115_1, i32* %statemt_addr_31, align 4, !bitwidth !144, !dep_idx !601, !deps !602
  %statemt_addr_33 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 7, !bitwidth !7
  %statemt_load_29 = load i32, i32* %statemt_addr_33, align 4, !bitwidth !281, !dep_idx !604, !deps !605
  %trunc_ln116 = trunc i32 %statemt_load_29 to i8, !bitwidth !407
  %zext_ln116 = zext i8 %trunc_ln116 to i64, !bitwidth !280
  %Sbox_1_addr_11 = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln116, !bitwidth !12
  %Sbox_1_load_10 = load i8, i8* %Sbox_1_addr_11, align 1, !bitwidth !407
  %zext_ln116_1 = zext i8 %Sbox_1_load_10 to i32, !bitwidth !412
  store i32 %zext_ln116_1, i32* %statemt_addr_32, align 4, !bitwidth !144, !dep_idx !607, !deps !608
  store i32 %zext_ln98_3, i32* %statemt_addr_33, align 4, !bitwidth !144, !dep_idx !610, !deps !611
  %statemt_addr_34 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 0, !bitwidth !7
  %statemt_load_30 = load i32, i32* %statemt_addr_34, align 4, !bitwidth !281, !dep_idx !613, !deps !614
  %trunc_ln118 = trunc i32 %statemt_load_30 to i8, !bitwidth !407
  %zext_ln118 = zext i8 %trunc_ln118 to i64, !bitwidth !280
  %Sbox_1_addr_12 = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln118, !bitwidth !12
  %Sbox_1_load_11 = load i8, i8* %Sbox_1_addr_12, align 1, !bitwidth !407
  %zext_ln118_1 = zext i8 %Sbox_1_load_11 to i32, !bitwidth !412
  store i32 %zext_ln118_1, i32* %statemt_addr_34, align 4, !bitwidth !144, !dep_idx !616, !deps !617
  %statemt_addr_35 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 4, !bitwidth !7
  %statemt_load_31 = load i32, i32* %statemt_addr_35, align 4, !bitwidth !281, !dep_idx !619, !deps !620
  %trunc_ln119 = trunc i32 %statemt_load_31 to i8, !bitwidth !407
  %zext_ln119 = zext i8 %trunc_ln119 to i64, !bitwidth !280
  %Sbox_1_addr_13 = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln119, !bitwidth !12
  %Sbox_1_load_12 = load i8, i8* %Sbox_1_addr_13, align 1, !bitwidth !407
  %zext_ln119_1 = zext i8 %Sbox_1_load_12 to i32, !bitwidth !412
  store i32 %zext_ln119_1, i32* %statemt_addr_35, align 4, !bitwidth !144, !dep_idx !622, !deps !623
  %statemt_addr_36 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 8, !bitwidth !7
  %statemt_load_32 = load i32, i32* %statemt_addr_36, align 4, !bitwidth !281, !dep_idx !625, !deps !626
  %trunc_ln120 = trunc i32 %statemt_load_32 to i8, !bitwidth !407
  %zext_ln120 = zext i8 %trunc_ln120 to i64, !bitwidth !280
  %Sbox_1_addr_14 = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln120, !bitwidth !12
  %Sbox_1_load_13 = load i8, i8* %Sbox_1_addr_14, align 1, !bitwidth !407
  %zext_ln120_1 = zext i8 %Sbox_1_load_13 to i32, !bitwidth !412
  store i32 %zext_ln120_1, i32* %statemt_addr_36, align 4, !bitwidth !144, !dep_idx !628, !deps !629
  %statemt_addr_37 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 12, !bitwidth !7
  %statemt_load_33 = load i32, i32* %statemt_addr_37, align 4, !bitwidth !281, !dep_idx !631, !deps !632
  %trunc_ln121 = trunc i32 %statemt_load_33 to i8, !bitwidth !407
  %zext_ln121 = zext i8 %trunc_ln121 to i64, !bitwidth !280
  %Sbox_1_addr_15 = getelementptr [256 x i8], [256 x i8]* @Sbox_1, i64 0, i64 %zext_ln121, !bitwidth !12
  %Sbox_1_load_14 = load i8, i8* %Sbox_1_addr_15, align 1, !bitwidth !407
  %zext_ln121_1 = zext i8 %Sbox_1_load_14 to i32, !bitwidth !412
  store i32 %zext_ln121_1, i32* %statemt_addr_37, align 4, !bitwidth !144, !dep_idx !634, !deps !635
  ret void, !bitwidth !144
}

; Function Attrs: noinline nounwind
define internal fastcc void @AddRoundKey_InversMixColumn([32 x i32]* noalias nocapture %statemt, i4 %n) #2 {
entry:
  %j = alloca i3, align 1, !bitwidth !253
  call void (...) @_ssdm_op_SpecInterface([32 x i32]* %statemt, [10 x i8]* @empty_11, i32 0, i32 0, [1 x i8]* @empty, i32 -1, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, [1 x i8]* @empty, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, i32 -1, i32 0)
  %n_read = call i4 @_ssdm_op_Read.ap_auto.i4(i4 %n) #3, !bitwidth !37
  %ret = alloca [32 x i32], i64 1, align 512, !bitwidth !7
  %mul = call i6 @_ssdm_op_BitConcatenate.i6.i4.i2(i4 %n_read, i2 0), !bitwidth !254
  store i3 0, i3* %j, align 1, !bitwidth !144, !dep_idx !637, !deps !638
  br label %for.inc, !bitwidth !144

for.inc:                                          ; preds = %for.inc.split, %entry
  %j_6 = load i3, i3* %j, align 1, !bitwidth !259, !dep_idx !641, !deps !642
  %icmp_ln380 = icmp eq i3 %j_6, -4, !bitwidth !168
  %add_ln380 = add nuw i3 %j_6, 1, !bitwidth !259
  br i1 %icmp_ln380, label %AddRoundKey_InversMixColumn_label1.preheader, label %for.inc.split, !llvm.loop !645, !bitwidth !144

AddRoundKey_InversMixColumn_label1.preheader:     ; preds = %for.inc
  %j_3 = alloca i3, align 1, !bitwidth !253
  store i3 0, i3* %j_3, align 1, !bitwidth !144, !dep_idx !651, !deps !652
  br label %AddRoundKey_InversMixColumn_label1, !bitwidth !144

for.inc.split:                                    ; preds = %for.inc
  %zext_ln380 = zext i3 %j_6 to i6, !bitwidth !278
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !184
  call void (...) @_ssdm_op_SpecLoopName([35 x i8]* @empty_9)
  %add_ln382 = add nuw i6 %zext_ln380, %mul, !bitwidth !254
  %zext_ln382 = zext i6 %add_ln382 to i64, !bitwidth !280
  %zext_ln382_2 = zext i6 %add_ln382 to i9, !bitwidth !292
  %zext_ln382_3 = zext i6 %add_ln382 to i8, !bitwidth !293
  %word_addr = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln382, !bitwidth !7
  %add_ln383 = add i8 %zext_ln382_3, 120, !bitwidth !68
  %zext_ln383_1 = zext i8 %add_ln383 to i64, !bitwidth !280
  %word_addr_10 = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln383_1, !bitwidth !7
  %add_ln384 = add i9 %zext_ln382_2, 240, !bitwidth !70
  %zext_ln384_1 = zext i9 %add_ln384 to i64, !bitwidth !280
  %word_addr_11 = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln384_1, !bitwidth !7
  %add_ln385 = add i9 %zext_ln382_2, -152, !bitwidth !70
  %zext_ln385_1 = zext i9 %add_ln385 to i64, !bitwidth !280
  %word_addr_12 = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln385_1, !bitwidth !7
  %word_load = load i32, i32* %word_addr, align 4, !bitwidth !281
  %trunc_ln382 = trunc i3 %j_6 to i2, !bitwidth !279
  %shl_ln = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %trunc_ln382, i2 0), !bitwidth !37
  %zext_ln382_1 = zext i4 %shl_ln to i64, !bitwidth !280
  %statemt_addr = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln382_1, !bitwidth !7
  %statemt_load = load i32, i32* %statemt_addr, align 4, !bitwidth !281, !dep_idx !655, !deps !656
  %xor_ln382 = xor i32 %statemt_load, %word_load, !bitwidth !281
  store i32 %xor_ln382, i32* %statemt_addr, align 4, !bitwidth !144, !dep_idx !663, !deps !664
  %word_load_7 = load i32, i32* %word_addr_10, align 4, !bitwidth !281
  %or_ln383 = or i4 %shl_ln, 1, !bitwidth !37
  %zext_ln383 = zext i4 %or_ln383 to i64, !bitwidth !280
  %statemt_addr_38 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln383, !bitwidth !7
  %statemt_load_34 = load i32, i32* %statemt_addr_38, align 4, !bitwidth !281, !dep_idx !675, !deps !676
  %xor_ln383 = xor i32 %statemt_load_34, %word_load_7, !bitwidth !281
  store i32 %xor_ln383, i32* %statemt_addr_38, align 4, !bitwidth !144, !dep_idx !678, !deps !679
  %word_load_8 = load i32, i32* %word_addr_11, align 4, !bitwidth !281
  %or_ln384 = or i4 %shl_ln, 2, !bitwidth !37
  %zext_ln384 = zext i4 %or_ln384 to i64, !bitwidth !280
  %statemt_addr_39 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln384, !bitwidth !7
  %statemt_load_35 = load i32, i32* %statemt_addr_39, align 4, !bitwidth !281, !dep_idx !681, !deps !682
  %xor_ln384 = xor i32 %statemt_load_35, %word_load_8, !bitwidth !281
  store i32 %xor_ln384, i32* %statemt_addr_39, align 4, !bitwidth !144, !dep_idx !684, !deps !685
  %word_load_9 = load i32, i32* %word_addr_12, align 4, !bitwidth !281
  %or_ln385 = or i4 %shl_ln, 3, !bitwidth !37
  %zext_ln385 = zext i4 %or_ln385 to i64, !bitwidth !280
  %statemt_addr_40 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln385, !bitwidth !7
  %statemt_load_36 = load i32, i32* %statemt_addr_40, align 4, !bitwidth !281, !dep_idx !687, !deps !688
  %xor_ln385 = xor i32 %statemt_load_36, %word_load_9, !bitwidth !281
  store i32 %xor_ln385, i32* %statemt_addr_40, align 4, !bitwidth !144, !dep_idx !690, !deps !691
  store i3 %add_ln380, i3* %j, align 1, !bitwidth !144, !dep_idx !693, !deps !694
  br label %for.inc, !llvm.loop !645, !bitwidth !144

AddRoundKey_InversMixColumn_label1:               ; preds = %for.inc193, %AddRoundKey_InversMixColumn_label1.preheader
  %j_7 = load i3, i3* %j_3, align 1, !bitwidth !259, !dep_idx !697, !deps !698
  %icmp_ln389 = icmp eq i3 %j_7, -4, !bitwidth !168
  %add_ln389 = add nuw i3 %j_7, 1, !bitwidth !259
  br i1 %icmp_ln389, label %for.inc229.preheader, label %AddRoundKey_InversMixColumn_label1.split, !llvm.loop !701, !bitwidth !144

for.inc229.preheader:                             ; preds = %AddRoundKey_InversMixColumn_label1
  %i = alloca i3, align 1, !bitwidth !253
  store i3 0, i3* %i, align 1, !bitwidth !144, !dep_idx !705, !deps !706
  br label %for.inc229, !bitwidth !144

AddRoundKey_InversMixColumn_label1.split:         ; preds = %AddRoundKey_InversMixColumn_label1
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !184
  call void (...) @_ssdm_op_SpecLoopName([35 x i8]* @empty_2)
  %empty = trunc i3 %j_7 to i2, !bitwidth !279
  %tmp_s = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %empty, i2 0), !bitwidth !37
  br label %for.body36, !bitwidth !144

for.body36:                                       ; preds = %for.body36.split, %AddRoundKey_InversMixColumn_label1.split
  %i_3 = phi i3 [ 0, %AddRoundKey_InversMixColumn_label1.split ], [ %add_ln404, %for.body36.split ], !bitwidth !259
  %icmp_ln392 = icmp eq i3 %i_3, -4, !bitwidth !168
  %add_ln404 = add nuw i3 %i_3, 1, !bitwidth !259
  br i1 %icmp_ln392, label %for.inc193, label %for.body36.split, !llvm.loop !709, !bitwidth !144

for.body36.split:                                 ; preds = %for.body36
  %zext_ln392 = zext i3 %i_3 to i4, !bitwidth !377
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !246
  call void (...) @_ssdm_op_SpecLoopName([35 x i8]* @empty_7)
  %add_ln394 = add nuw i4 %zext_ln392, %tmp_s, !bitwidth !37
  %zext_ln394 = zext i4 %add_ln394 to i64, !bitwidth !280
  %statemt_addr_45 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln394, !bitwidth !7
  %statemt_load_37 = load i32, i32* %statemt_addr_45, align 4, !bitwidth !281, !dep_idx !723, !deps !724
  %tmp_18 = call i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32 %statemt_load_37, i32 7, i32 30), !bitwidth !288
  %and_ln = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_18, i8 0), !bitwidth !281
  %icmp_ln395 = icmp eq i32 %and_ln, 256, !bitwidth !168
  %trunc_ln395 = trunc i32 %statemt_load_37 to i30, !bitwidth !729
  %trunc_ln = call i31 @_ssdm_op_BitConcatenate.i31.i30.i1(i30 %trunc_ln395, i1 false), !bitwidth !730
  %xor_ln395 = xor i31 %trunc_ln, 283, !bitwidth !730
  %select_ln395 = select i1 %icmp_ln395, i31 %xor_ln395, i31 %trunc_ln, !bitwidth !730
  %trunc_ln396 = trunc i32 %statemt_load_37 to i31, !bitwidth !730
  %xor_ln397 = xor i31 %select_ln395, %trunc_ln396, !bitwidth !730
  %tmp_19 = call i24 @_ssdm_op_PartSelect.i24.i31.i32.i32(i31 %xor_ln397, i32 7, i32 30), !bitwidth !288
  %and_ln8 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_19, i8 0), !bitwidth !281
  %icmp_ln398 = icmp eq i32 %and_ln8, 256, !bitwidth !168
  %shl_ln398 = shl i31 %xor_ln397, 1, !bitwidth !730
  %xor_ln398 = xor i31 %shl_ln398, 283, !bitwidth !730
  %select_ln398 = select i1 %icmp_ln398, i31 %xor_ln398, i31 %shl_ln398, !bitwidth !730
  %xor_ln400 = xor i31 %select_ln398, %trunc_ln396, !bitwidth !730
  %x = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %xor_ln400, i1 false), !bitwidth !281
  %tmp_20 = call i24 @_ssdm_op_PartSelect.i24.i31.i32.i32(i31 %xor_ln400, i32 7, i32 30), !bitwidth !288
  %and_ln9 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_20, i8 0), !bitwidth !281
  %icmp_ln401 = icmp eq i32 %and_ln9, 256, !bitwidth !168
  %xor_ln401 = xor i32 %x, 283, !bitwidth !281
  %x_12 = select i1 %icmp_ln401, i32 %xor_ln401, i32 %x, !bitwidth !281
  %ret_addr_11 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %zext_ln394, !bitwidth !7
  %empty_71 = trunc i3 %add_ln404 to i2, !bitwidth !279
  %add_ln404_1 = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %empty, i2 %empty_71), !bitwidth !37
  %zext_ln404 = zext i4 %add_ln404_1 to i64, !bitwidth !280
  %statemt_addr_46 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln404, !bitwidth !7
  %statemt_load_38 = load i32, i32* %statemt_addr_46, align 4, !bitwidth !281, !dep_idx !731, !deps !724
  %trunc_ln377 = trunc i32 %statemt_load_38 to i30, !bitwidth !729
  %trunc_ln7 = call i31 @_ssdm_op_BitConcatenate.i31.i30.i1(i30 %trunc_ln377, i1 false), !bitwidth !730
  %tmp_21 = call i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32 %statemt_load_38, i32 7, i32 30), !bitwidth !288
  %and_ln1 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_21, i8 0), !bitwidth !281
  %icmp_ln405 = icmp eq i32 %and_ln1, 256, !bitwidth !168
  %x_13 = xor i31 %trunc_ln7, 283, !bitwidth !730
  %select_ln405 = select i1 %icmp_ln405, i31 %x_13, i31 %trunc_ln7, !bitwidth !730
  %tmp_22 = call i24 @_ssdm_op_PartSelect.i24.i31.i32.i32(i31 %select_ln405, i32 7, i32 30), !bitwidth !288
  %and_ln2 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_22, i8 0), !bitwidth !281
  %icmp_ln407 = icmp eq i32 %and_ln2, 256, !bitwidth !168
  %shl_ln407 = shl i31 %select_ln405, 1, !bitwidth !730
  %xor_ln407 = xor i31 %shl_ln407, 283, !bitwidth !730
  %select_ln407 = select i1 %icmp_ln407, i31 %xor_ln407, i31 %shl_ln407, !bitwidth !730
  %trunc_ln408 = trunc i32 %statemt_load_38 to i31, !bitwidth !730
  %xor_ln409 = xor i31 %select_ln407, %trunc_ln408, !bitwidth !730
  %x_14 = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %xor_ln409, i1 false), !bitwidth !281
  %tmp_23 = call i24 @_ssdm_op_PartSelect.i24.i31.i32.i32(i31 %xor_ln409, i32 7, i32 30), !bitwidth !288
  %and_ln3 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_23, i8 0), !bitwidth !281
  %icmp_ln410 = icmp eq i32 %and_ln3, 256, !bitwidth !168
  %x_15 = xor i32 %x_14, 283, !bitwidth !281
  %x_16 = select i1 %icmp_ln410, i32 %x_15, i32 %x_14, !bitwidth !281
  %trunc_ln414 = trunc i3 %i_3 to i2, !bitwidth !279
  %xor_ln414 = xor i2 %trunc_ln414, -2, !bitwidth !279
  %or_ln = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %empty, i2 %xor_ln414), !bitwidth !37
  %zext_ln414 = zext i4 %or_ln to i64, !bitwidth !280
  %statemt_addr_47 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln414, !bitwidth !7
  %statemt_load_39 = load i32, i32* %statemt_addr_47, align 4, !bitwidth !281, !dep_idx !732, !deps !724
  %tmp_24 = call i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32 %statemt_load_39, i32 7, i32 30), !bitwidth !288
  %and_ln4 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_24, i8 0), !bitwidth !281
  %icmp_ln415 = icmp eq i32 %and_ln4, 256, !bitwidth !168
  %trunc_ln415 = trunc i32 %statemt_load_39 to i30, !bitwidth !729
  %trunc_ln1 = call i31 @_ssdm_op_BitConcatenate.i31.i30.i1(i30 %trunc_ln415, i1 false), !bitwidth !730
  %xor_ln415 = xor i31 %trunc_ln1, 283, !bitwidth !730
  %select_ln415 = select i1 %icmp_ln415, i31 %xor_ln415, i31 %trunc_ln1, !bitwidth !730
  %trunc_ln416 = trunc i32 %statemt_load_39 to i31, !bitwidth !730
  %xor_ln417 = xor i31 %select_ln415, %trunc_ln416, !bitwidth !730
  %shl_ln377 = shl i31 %xor_ln417, 1, !bitwidth !730
  %tmp_25 = call i24 @_ssdm_op_PartSelect.i24.i31.i32.i32(i31 %xor_ln417, i32 7, i32 30), !bitwidth !288
  %and_ln5 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_25, i8 0), !bitwidth !281
  %icmp_ln418 = icmp eq i32 %and_ln5, 256, !bitwidth !168
  %x_17 = xor i31 %shl_ln377, 283, !bitwidth !730
  %select_ln418 = select i1 %icmp_ln418, i31 %x_17, i31 %shl_ln377, !bitwidth !730
  %x_18 = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %select_ln418, i1 false), !bitwidth !281
  %tmp_26 = call i24 @_ssdm_op_PartSelect.i24.i31.i32.i32(i31 %select_ln418, i32 7, i32 30), !bitwidth !288
  %and_ln6 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_26, i8 0), !bitwidth !281
  %icmp_ln420 = icmp eq i32 %and_ln6, 256, !bitwidth !168
  %xor_ln420 = xor i32 %x_18, 283, !bitwidth !281
  %x_19 = select i1 %icmp_ln420, i32 %xor_ln420, i32 %x_18, !bitwidth !281
  %add_ln424 = add i2 %trunc_ln414, -1, !bitwidth !279
  %or_ln1 = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %empty, i2 %add_ln424), !bitwidth !37
  %zext_ln424 = zext i4 %or_ln1 to i64, !bitwidth !280
  %statemt_addr_48 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln424, !bitwidth !7
  %statemt_load_40 = load i32, i32* %statemt_addr_48, align 4, !bitwidth !281, !dep_idx !733, !deps !724
  %trunc_ln377_1 = trunc i32 %statemt_load_40 to i30, !bitwidth !729
  %trunc_ln377_2 = call i31 @_ssdm_op_BitConcatenate.i31.i30.i1(i30 %trunc_ln377_1, i1 false), !bitwidth !730
  %tmp_27 = call i24 @_ssdm_op_PartSelect.i24.i32.i32.i32(i32 %statemt_load_40, i32 7, i32 30), !bitwidth !288
  %and_ln7 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_27, i8 0), !bitwidth !281
  %icmp_ln425 = icmp eq i32 %and_ln7, 256, !bitwidth !168
  %x_20 = xor i31 %trunc_ln377_2, 283, !bitwidth !730
  %select_ln425 = select i1 %icmp_ln425, i31 %x_20, i31 %trunc_ln377_2, !bitwidth !730
  %shl_ln377_1 = shl i31 %select_ln425, 1, !bitwidth !730
  %tmp_28 = call i24 @_ssdm_op_PartSelect.i24.i31.i32.i32(i31 %select_ln425, i32 7, i32 30), !bitwidth !288
  %and_ln10 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_28, i8 0), !bitwidth !281
  %icmp_ln427 = icmp eq i32 %and_ln10, 256, !bitwidth !168
  %xor_ln427 = xor i31 %shl_ln377_1, 283, !bitwidth !730
  %select_ln427 = select i1 %icmp_ln427, i31 %xor_ln427, i31 %shl_ln377_1, !bitwidth !730
  %x_21 = call i32 @_ssdm_op_BitConcatenate.i32.i31.i1(i31 %select_ln427, i1 false), !bitwidth !281
  %tmp_29 = call i24 @_ssdm_op_PartSelect.i24.i31.i32.i32(i31 %select_ln427, i32 7, i32 30), !bitwidth !288
  %and_ln11 = call i32 @_ssdm_op_BitConcatenate.i32.i24.i8(i24 %tmp_29, i8 0), !bitwidth !281
  %icmp_ln429 = icmp eq i32 %and_ln11, 256, !bitwidth !168
  %x_22 = xor i32 %x_21, 283, !bitwidth !281
  %x_23 = select i1 %icmp_ln429, i32 %x_22, i32 %x_21, !bitwidth !281
  %xor_ln431 = xor i32 %statemt_load_38, %statemt_load_40, !bitwidth !281
  %xor_ln431_1 = xor i32 %xor_ln431, %statemt_load_39, !bitwidth !281
  %xor_ln431_2 = xor i32 %x_12, %x_16, !bitwidth !281
  %xor_ln431_3 = xor i32 %x_19, %x_23, !bitwidth !281
  %xor_ln431_4 = xor i32 %xor_ln431_3, %xor_ln431_2, !bitwidth !281
  %xor_ln431_5 = xor i32 %xor_ln431_4, %xor_ln431_1, !bitwidth !281
  store i32 %xor_ln431_5, i32* %ret_addr_11, align 4, !bitwidth !144, !dep_idx !734, !deps !735
  br label %for.body36, !llvm.loop !709, !bitwidth !144

for.inc193:                                       ; preds = %for.body36
  store i3 %add_ln389, i3* %j_3, align 1, !bitwidth !144, !dep_idx !740, !deps !741
  br label %AddRoundKey_InversMixColumn_label1, !llvm.loop !701, !bitwidth !144

for.inc229:                                       ; preds = %for.inc229.split, %for.inc229.preheader
  %i_5 = load i3, i3* %i, align 1, !bitwidth !259, !dep_idx !744, !deps !745
  %icmp_ln436 = icmp eq i3 %i_5, -4, !bitwidth !168
  %add_ln436 = add nuw i3 %i_5, 1, !bitwidth !259
  br i1 %icmp_ln436, label %for.end231, label %for.inc229.split, !llvm.loop !748, !bitwidth !144

for.inc229.split:                                 ; preds = %for.inc229
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !184
  call void (...) @_ssdm_op_SpecLoopName([35 x i8]* @empty_6)
  %trunc_ln438 = trunc i3 %i_5 to i2, !bitwidth !279
  %shl_ln5 = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %trunc_ln438, i2 0), !bitwidth !37
  %zext_ln438 = zext i4 %shl_ln5 to i64, !bitwidth !280
  %ret_addr = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %zext_ln438, !bitwidth !7
  %ret_load = load i32, i32* %ret_addr, align 16, !bitwidth !281, !dep_idx !752, !deps !753
  %statemt_addr_41 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln438, !bitwidth !7
  store i32 %ret_load, i32* %statemt_addr_41, align 4, !bitwidth !144, !dep_idx !755, !deps !756
  %or_ln439 = or i4 %shl_ln5, 1, !bitwidth !37
  %zext_ln439 = zext i4 %or_ln439 to i64, !bitwidth !280
  %ret_addr_8 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %zext_ln439, !bitwidth !7
  %ret_load_4 = load i32, i32* %ret_addr_8, align 4, !bitwidth !281, !dep_idx !765, !deps !753
  %statemt_addr_42 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln439, !bitwidth !7
  store i32 %ret_load_4, i32* %statemt_addr_42, align 4, !bitwidth !144, !dep_idx !766, !deps !756
  %or_ln440 = or i4 %shl_ln5, 2, !bitwidth !37
  %zext_ln440 = zext i4 %or_ln440 to i64, !bitwidth !280
  %ret_addr_9 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %zext_ln440, !bitwidth !7
  %ret_load_5 = load i32, i32* %ret_addr_9, align 8, !bitwidth !281, !dep_idx !767, !deps !753
  %statemt_addr_43 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln440, !bitwidth !7
  store i32 %ret_load_5, i32* %statemt_addr_43, align 4, !bitwidth !144, !dep_idx !768, !deps !756
  %or_ln441 = or i4 %shl_ln5, 3, !bitwidth !37
  %zext_ln441 = zext i4 %or_ln441 to i64, !bitwidth !280
  %ret_addr_10 = getelementptr inbounds [32 x i32], [32 x i32]* %ret, i64 0, i64 %zext_ln441, !bitwidth !7
  %ret_load_6 = load i32, i32* %ret_addr_10, align 4, !bitwidth !281, !dep_idx !769, !deps !753
  %statemt_addr_44 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln441, !bitwidth !7
  store i32 %ret_load_6, i32* %statemt_addr_44, align 4, !bitwidth !144, !dep_idx !770, !deps !756
  store i3 %add_ln436, i3* %i, align 1, !bitwidth !144, !dep_idx !771, !deps !772
  br label %for.inc229, !llvm.loop !748, !bitwidth !144

for.end231:                                       ; preds = %for.inc229
  ret void, !bitwidth !144
}

; Function Attrs: noinline nounwind
define internal fastcc void @AddRoundKey([32 x i32]* noalias nocapture %statemt, i4 %n) #2 {
entry:
  %j = alloca i3, align 1, !bitwidth !253
  call void (...) @_ssdm_op_SpecInterface([32 x i32]* %statemt, [10 x i8]* @empty_11, i32 0, i32 0, [1 x i8]* @empty, i32 -1, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, [1 x i8]* @empty, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty, [1 x i8]* @empty, i32 -1, i32 0)
  %n_read = call i4 @_ssdm_op_Read.ap_auto.i4(i4 %n) #3, !bitwidth !37
  %mul = call i6 @_ssdm_op_BitConcatenate.i6.i4.i2(i4 %n_read, i2 0), !bitwidth !254
  store i3 0, i3* %j, align 1, !bitwidth !144, !dep_idx !775, !deps !776
  br label %for.inc, !bitwidth !144

for.inc:                                          ; preds = %for.inc.split, %entry
  %j_8 = load i3, i3* %j, align 1, !bitwidth !259, !dep_idx !779, !deps !780
  %icmp_ln469 = icmp eq i3 %j_8, -4, !bitwidth !168
  %add_ln469 = add nuw i3 %j_8, 1, !bitwidth !259
  br i1 %icmp_ln469, label %for.end, label %for.inc.split, !llvm.loop !783, !bitwidth !144

for.inc.split:                                    ; preds = %for.inc
  %zext_ln469 = zext i3 %j_8 to i6, !bitwidth !278
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 4, i64 4, i64 4), !fpga.pragma.source !184
  call void (...) @_ssdm_op_SpecLoopName([19 x i8]* @empty_5)
  %add_ln471 = add nuw i6 %zext_ln469, %mul, !bitwidth !254
  %zext_ln471 = zext i6 %add_ln471 to i64, !bitwidth !280
  %zext_ln471_2 = zext i6 %add_ln471 to i9, !bitwidth !292
  %zext_ln471_3 = zext i6 %add_ln471 to i8, !bitwidth !293
  %word_addr = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln471, !bitwidth !7
  %add_ln472 = add i8 %zext_ln471_3, 120, !bitwidth !68
  %zext_ln472_1 = zext i8 %add_ln472 to i64, !bitwidth !280
  %word_addr_13 = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln472_1, !bitwidth !7
  %add_ln473 = add i9 %zext_ln471_2, 240, !bitwidth !70
  %zext_ln473_1 = zext i9 %add_ln473 to i64, !bitwidth !280
  %word_addr_14 = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln473_1, !bitwidth !7
  %add_ln474 = add i9 %zext_ln471_2, -152, !bitwidth !70
  %zext_ln474_1 = zext i9 %add_ln474 to i64, !bitwidth !280
  %word_addr_15 = getelementptr [480 x i32], [480 x i32]* @word, i64 0, i64 %zext_ln474_1, !bitwidth !7
  %word_load = load i32, i32* %word_addr, align 4, !bitwidth !281
  %trunc_ln471 = trunc i3 %j_8 to i2, !bitwidth !279
  %shl_ln = call i4 @_ssdm_op_BitConcatenate.i4.i2.i2(i2 %trunc_ln471, i2 0), !bitwidth !37
  %zext_ln471_1 = zext i4 %shl_ln to i64, !bitwidth !280
  %statemt_addr = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln471_1, !bitwidth !7
  %statemt_load = load i32, i32* %statemt_addr, align 4, !bitwidth !281, !dep_idx !789, !deps !790
  %xor_ln471 = xor i32 %statemt_load, %word_load, !bitwidth !281
  store i32 %xor_ln471, i32* %statemt_addr, align 4, !bitwidth !144, !dep_idx !792, !deps !793
  %word_load_10 = load i32, i32* %word_addr_13, align 4, !bitwidth !281
  %or_ln472 = or i4 %shl_ln, 1, !bitwidth !37
  %zext_ln472 = zext i4 %or_ln472 to i64, !bitwidth !280
  %statemt_addr_49 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln472, !bitwidth !7
  %statemt_load_41 = load i32, i32* %statemt_addr_49, align 4, !bitwidth !281, !dep_idx !795, !deps !796
  %xor_ln472 = xor i32 %statemt_load_41, %word_load_10, !bitwidth !281
  store i32 %xor_ln472, i32* %statemt_addr_49, align 4, !bitwidth !144, !dep_idx !798, !deps !799
  %word_load_11 = load i32, i32* %word_addr_14, align 4, !bitwidth !281
  %or_ln473 = or i4 %shl_ln, 2, !bitwidth !37
  %zext_ln473 = zext i4 %or_ln473 to i64, !bitwidth !280
  %statemt_addr_50 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln473, !bitwidth !7
  %statemt_load_42 = load i32, i32* %statemt_addr_50, align 4, !bitwidth !281, !dep_idx !801, !deps !802
  %xor_ln473 = xor i32 %statemt_load_42, %word_load_11, !bitwidth !281
  store i32 %xor_ln473, i32* %statemt_addr_50, align 4, !bitwidth !144, !dep_idx !804, !deps !805
  %word_load_12 = load i32, i32* %word_addr_15, align 4, !bitwidth !281
  %or_ln474 = or i4 %shl_ln, 3, !bitwidth !37
  %zext_ln474 = zext i4 %or_ln474 to i64, !bitwidth !280
  %statemt_addr_51 = getelementptr [32 x i32], [32 x i32]* %statemt, i64 0, i64 %zext_ln474, !bitwidth !7
  %statemt_load_43 = load i32, i32* %statemt_addr_51, align 4, !bitwidth !281, !dep_idx !807, !deps !808
  %xor_ln474 = xor i32 %statemt_load_43, %word_load_12, !bitwidth !281
  store i32 %xor_ln474, i32* %statemt_addr_51, align 4, !bitwidth !144, !dep_idx !810, !deps !811
  store i3 %add_ln469, i3* %j, align 1, !bitwidth !144, !dep_idx !813, !deps !814
  br label %for.inc, !llvm.loop !783, !bitwidth !144

for.end:                                          ; preds = %for.inc
  ret void, !bitwidth !144
}

attributes #0 = { nounwind readnone }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noinline nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!blackbox_cfg = !{!1}
!llvm.module.flags = !{!2, !3}
!llvm.map.gv = !{}
!bitwidth_g = !{!4, !25, !31, !34, !73, !103, !123, !126, !140}

!0 = !{!"clang version 7.0.0 "}
!1 = !{}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"reflow.full.lowering", i32 1}
!4 = !{void ([32 x i32]*, [32 x i32]*)* @encrypt, !5}
!5 = !{!6, !8, !9, !11, !13, !14, !15, !17, !19, !20, !22, !24}
!6 = !{!"Arg", i32 0, !7}
!7 = !{i32 0, i32 0, i32 32, i32 2}
!8 = !{!"Arg", i32 1, !7}
!9 = !{i32 1, !10}
!10 = !{i32 1, i32 32, i32 0, i32 0}
!11 = !{[10 x i8]* @empty_11, !12}
!12 = !{i32 0, i32 0, i32 8, i32 2}
!13 = !{i32 0, !10}
!14 = !{[1 x i8]* @empty, !12}
!15 = !{i32 -1, !16}
!16 = !{i32 1, i32 32, i32 0, i32 1}
!17 = !{i4 0, !18}
!18 = !{i32 1, i32 4, i32 0, i32 0}
!19 = !{i4 1, !18}
!20 = !{i4 -6, !21}
!21 = !{i32 4, i32 4, i32 0, i32 1}
!22 = !{i64 9, !23}
!23 = !{i32 5, i32 64, i32 0, i32 1}
!24 = !{[15 x i8]* @empty_1, !12}
!25 = !{void ([32 x i32]*, [32 x i32]*)* @decrypt, !26}
!26 = !{!6, !8, !9, !11, !13, !14, !15, !20, !27, !17, !22, !28, !29}
!27 = !{i4 -7, !21}
!28 = !{[15 x i8]* @empty_8, !12}
!29 = !{i4 -1, !30}
!30 = !{i32 1, i32 4, i32 0, i32 1}
!31 = !{i32 ([32 x i32]*, [32 x i32]*)* @aes_main, !32}
!32 = !{!6, !8, !13, !33, !11, !14, !15}
!33 = !{[9 x i8]* @empty_0, !12}
!34 = !{void ([32 x i32]*, i4)* @MixColumn_AddRoundKey, !35}
!35 = !{!6, !36, !9, !11, !13, !14, !15, !38, !40, !42, !44, !46, !47, !49, !50, !51, !53, !55, !57, !59, !19, !60, !62, !63, !65, !66, !67, !69, !71, !72}
!36 = !{!"Arg", i32 1, !37}
!37 = !{i32 4, i32 4, i32 0, i32 2}
!38 = !{i64 1, !39}
!39 = !{i32 1, i32 64, i32 0, i32 0}
!40 = !{i2 0, !41}
!41 = !{i32 1, i32 2, i32 0, i32 0}
!42 = !{i3 0, !43}
!43 = !{i32 1, i32 3, i32 0, i32 0}
!44 = !{i3 -4, !45}
!45 = !{i32 3, i32 3, i32 0, i32 1}
!46 = !{i3 1, !43}
!47 = !{i64 4, !48}
!48 = !{i32 4, i32 64, i32 0, i32 1}
!49 = !{[29 x i8]* @empty_3, !12}
!50 = !{i64 0, !39}
!51 = !{i32 7, !52}
!52 = !{i32 4, i32 32, i32 0, i32 1}
!53 = !{i32 30, !54}
!54 = !{i32 6, i32 32, i32 0, i32 1}
!55 = !{i8 0, !56}
!56 = !{i32 1, i32 8, i32 0, i32 0}
!57 = !{i32 256, !58}
!58 = !{i32 10, i32 32, i32 0, i32 1}
!59 = !{i32 283, !58}
!60 = !{i32 8, !61}
!61 = !{i32 5, i32 32, i32 0, i32 1}
!62 = !{i32 31, !54}
!63 = !{i4 2, !64}
!64 = !{i32 3, i32 4, i32 0, i32 1}
!65 = !{i4 3, !64}
!66 = !{[480 x i32]* @word, !7}
!67 = !{i8 120, !68}
!68 = !{i32 8, i32 8, i32 0, i32 1}
!69 = !{i9 240, !70}
!70 = !{i32 9, i32 9, i32 0, i32 1}
!71 = !{i9 -152, !70}
!72 = !{[29 x i8]* @empty_10, !12}
!73 = !{void ([32 x i32]*)* @KeySchedule, !74}
!74 = !{!6, !9, !11, !13, !14, !15, !42, !44, !46, !75, !47, !77, !40, !78, !80, !60, !66, !50, !82, !83, !85, !87, !88, !67, !69, !71, !62, !55, !90, !51, !17, !91, !93, !95, !96, !97, !29, !98, !99, !101, !102}
!75 = !{i6 4, !76}
!76 = !{i32 4, i32 6, i32 0, i32 1}
!77 = !{[19 x i8]* @empty_4, !12}
!78 = !{i7 0, !79}
!79 = !{i32 1, i32 7, i32 0, i32 0}
!80 = !{i32 3, !81}
!81 = !{i32 3, i32 32, i32 0, i32 1}
!82 = !{[19 x i8]* @empty_14, !12}
!83 = !{i6 -20, !84}
!84 = !{i32 6, i32 6, i32 0, i32 1}
!85 = !{i64 40, !86}
!86 = !{i32 7, i32 64, i32 0, i32 1}
!87 = !{[19 x i8]* @empty_13, !12}
!88 = !{i6 -1, !89}
!89 = !{i32 1, i32 6, i32 0, i32 1}
!90 = !{i32 4, !52}
!91 = !{i1 false, !92}
!92 = !{i32 1, i32 1, i32 0, i32 0}
!93 = !{i6 0, !94}
!94 = !{i32 1, i32 6, i32 0, i32 0}
!95 = !{[256 x i8]* @Sbox, !12}
!96 = !{i32 2, !81}
!97 = !{i32 5, !52}
!98 = !{[30 x i8]* @Rcon0, !12}
!99 = !{i6 -4, !100}
!100 = !{i32 3, i32 6, i32 0, i32 1}
!101 = !{[19 x i8]* @empty_12, !12}
!102 = !{i6 1, !94}
!103 = !{void ([32 x i32]*)* @InversShiftRow_ByteSub, !104}
!104 = !{!6, !11, !13, !14, !15, !50, !105, !107, !108, !109, !38, !111, !112, !113, !115, !116, !117, !118, !119, !120, !121, !122}
!105 = !{i64 13, !106}
!106 = !{i32 5, i32 64, i32 0, i32 0}
!107 = !{[256 x i8]* @invSbox, !12}
!108 = !{i64 9, !106}
!109 = !{i64 5, !110}
!110 = !{i32 4, i32 64, i32 0, i32 0}
!111 = !{i64 14, !106}
!112 = !{i64 6, !110}
!113 = !{i64 2, !114}
!114 = !{i32 3, i32 64, i32 0, i32 0}
!115 = !{i64 10, !106}
!116 = !{i64 15, !106}
!117 = !{i64 3, !114}
!118 = !{i64 7, !110}
!119 = !{i64 11, !106}
!120 = !{i64 4, !110}
!121 = !{i64 8, !106}
!122 = !{i64 12, !106}
!123 = !{void ([32 x i32]*)* @ByteSub_ShiftRow, !124}
!124 = !{!6, !11, !13, !14, !15, !50, !38, !125, !109, !108, !105, !113, !115, !112, !111, !117, !116, !119, !118, !120, !121, !122}
!125 = !{[256 x i8]* @Sbox_1, !12}
!126 = !{void ([32 x i32]*, i4)* @AddRoundKey_InversMixColumn, !127}
!127 = !{!6, !36, !9, !11, !13, !14, !15, !38, !40, !42, !44, !46, !47, !128, !66, !50, !67, !69, !71, !19, !63, !65, !129, !130, !51, !53, !55, !57, !91, !131, !133, !59, !135, !137, !139}
!128 = !{[35 x i8]* @empty_9, !12}
!129 = !{[35 x i8]* @empty_2, !12}
!130 = !{[35 x i8]* @empty_7, !12}
!131 = !{i31 283, !132}
!132 = !{i32 10, i32 31, i32 0, i32 1}
!133 = !{i31 1, !134}
!134 = !{i32 1, i32 31, i32 0, i32 0}
!135 = !{i2 -2, !136}
!136 = !{i32 2, i32 2, i32 0, i32 1}
!137 = !{i2 -1, !138}
!138 = !{i32 1, i32 2, i32 0, i32 1}
!139 = !{[35 x i8]* @empty_6, !12}
!140 = !{void ([32 x i32]*, i4)* @AddRoundKey, !141}
!141 = !{!6, !36, !9, !11, !13, !14, !15, !40, !42, !44, !46, !47, !142, !66, !50, !67, !69, !71, !19, !63, !65}
!142 = !{[19 x i8]* @empty_5, !12}
!143 = !{i32 0, i32 0, i32 4, i32 1}
!144 = !{i32 0, i32 0, i32 0, i32 2}
!145 = !{i32 14}
!146 = !{!147, !149, !150}
!147 = !{i32 11, !148}
!148 = !{!"Unknown", !"indep"}
!149 = !{i32 12, !148}
!150 = !{i32 13, !148}
!151 = !{i32 11}
!152 = !{!153, !154, !149, !155, !150}
!153 = !{i32 14, !148}
!154 = !{i32 15, !148}
!155 = !{i32 16, !148}
!156 = !{i32 19}
!157 = !{!158, !160}
!158 = !{i32 17, !159}
!159 = !{!"RAW", !"indep"}
!160 = !{i32 18, !161}
!161 = !{!"WAW", !"indep"}
!162 = !{i32 17}
!163 = !{!164, !166}
!164 = !{i32 19, !165}
!165 = !{!"WAR", !"indep"}
!166 = !{i32 18, !167}
!167 = !{!"WAR", !"indep", i32 1, !"*", i32 -1, i1 true}
!168 = !{i32 1, i32 1, i32 0, i32 2}
!169 = distinct !{!169, !170, !182, !183}
!170 = !{i32 114, i32 5, !171, null}
!171 = !{i32 786443, !172, i32 110, i32 5, !174, i32 0}
!172 = !{i32 786443, !173, !174}
!173 = !{i32 786478, i32 0, !174, !"encrypt", !"encrypt", null, !174, i32 66, !175, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([32 x i32]*, [32 x i32]*)* @encrypt, null, null, !180, i32 66}
!174 = !{i32 786473, !"data/benchmarks/aes/aes_enc.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!175 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !176, i32 0, i32 0}
!176 = !{!177, !178, !178, !177}
!177 = !{i32 786468, null, !"int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 5}
!178 = !{i32 786447, null, !"", !179, i32 0, i64 64, i64 0, i32 0, i32 0, !177}
!179 = !{i32 786473, !"<unknown>", null, null}
!180 = !{!181}
!181 = !{i32 0}
!182 = !{!"llvm.loop.name", !"encrypt_label1"}
!183 = !{!"llvm.loop.tripcount", i32 9, i32 9, i32 9, !"infer-from-design"}
!184 = !{!"infer-from-design"}
!185 = !{i32 16}
!186 = !{!147, !154, !149, !187}
!187 = !{i32 13, !188}
!188 = !{!"Unknown", !"indep", i32 1, !"*", i32 -1, i1 true}
!189 = !{i32 13}
!190 = !{!153, !147, !154, !149, !191}
!191 = !{i32 16, !188}
!192 = !{i32 18}
!193 = !{!194, !195}
!194 = !{i32 19, !161}
!195 = !{i32 17, !196}
!196 = !{!"RAW", !"indep", i32 1, !"*", i32 -1, i1 true}
!197 = !{i32 15}
!198 = !{!147, !149, !155, !150}
!199 = !{i32 12}
!200 = !{!153, !147, !154, !155, !150}
!201 = !{i32 5}
!202 = !{!203, !204, !205}
!203 = !{i32 2, !148}
!204 = !{i32 3, !148}
!205 = !{i32 4, !148}
!206 = !{i32 2}
!207 = !{!208, !209, !204, !205, !210}
!208 = !{i32 5, !148}
!209 = !{i32 6, !148}
!210 = !{i32 7, !148}
!211 = !{i32 6}
!212 = !{!203, !204, !205, !210}
!213 = !{i32 10}
!214 = !{!215, !216}
!215 = !{i32 8, !159}
!216 = !{i32 9, !161}
!217 = !{i32 8}
!218 = !{!219, !220}
!219 = !{i32 10, !165}
!220 = !{i32 9, !167}
!221 = distinct !{!221, !222, !227, !183}
!222 = !{i32 120, i32 5, !223, null}
!223 = !{i32 786443, !224, i32 116, i32 5, !226, i32 0}
!224 = !{i32 786443, !225, !226}
!225 = !{i32 786478, i32 0, !226, !"decrypt", !"decrypt", null, !226, i32 66, !175, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([32 x i32]*, [32 x i32]*)* @decrypt, null, null, !180, i32 66}
!226 = !{i32 786473, !"data/benchmarks/aes/aes_dec.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!227 = !{!"llvm.loop.name", !"decrypt_label4"}
!228 = !{i32 4}
!229 = !{!208, !203, !209, !204, !230}
!230 = !{i32 7, !188}
!231 = !{i32 7}
!232 = !{!203, !209, !204, !233}
!233 = !{i32 4, !188}
!234 = !{i32 9}
!235 = !{!236, !237}
!236 = !{i32 10, !161}
!237 = !{i32 8, !196}
!238 = !{i32 3}
!239 = !{!208, !203, !209, !205, !210}
!240 = !{!241}
!241 = !{i32 0, i32 31, !242}
!242 = !{!243}
!243 = !{!"return", !244, !"int", i32 0, i32 31}
!244 = !{!245}
!245 = !{i32 0, i32 1, i32 0}
!246 = !{!"user"}
!247 = !{!1}
!248 = !{i32 1}
!249 = !{!250}
!250 = !{i32 0, !148}
!251 = !{!252}
!252 = !{i32 1, !148}
!253 = !{i32 0, i32 0, i32 3, i32 1}
!254 = !{i32 6, i32 6, i32 0, i32 2}
!255 = !{i32 140}
!256 = !{!257, !258}
!257 = !{i32 138, !159}
!258 = !{i32 139, !161}
!259 = !{i32 3, i32 3, i32 0, i32 2}
!260 = !{i32 138}
!261 = !{!262, !263}
!262 = !{i32 140, !165}
!263 = !{i32 139, !167}
!264 = distinct !{!264, !265, !272, !273}
!265 = !{i32 361, i32 5, !266, null}
!266 = !{i32 786443, !267, i32 324, i32 5, !269, i32 0}
!267 = !{i32 786443, !268, !269}
!268 = !{i32 786478, i32 0, !269, !"MixColumn_AddRoundKey", !"MixColumn_AddRoundKey", null, !269, i32 319, !270, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([32 x i32]*, i4)* @MixColumn_AddRoundKey, null, null, !180, i32 319}
!269 = !{i32 786473, !"data/benchmarks/aes/aes_key.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!270 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !271, i32 0, i32 0}
!271 = !{!177, !178, !177, !177}
!272 = !{!"llvm.loop.name", !"MixColumn_AddRoundKey_label0"}
!273 = !{!"llvm.loop.tripcount", i32 4, i32 4, i32 4, !"infer-from-design"}
!274 = !{i32 151}
!275 = !{!276, !277}
!276 = !{i32 141, !159}
!277 = !{i32 142, !161}
!278 = !{i32 6, i32 6, i32 0, i32 0}
!279 = !{i32 2, i32 2, i32 0, i32 2}
!280 = !{i32 64, i32 64, i32 0, i32 0}
!281 = !{i32 32, i32 32, i32 0, i32 2}
!282 = !{i32 156}
!283 = !{!284, !285, !286, !287}
!284 = !{i32 143, !165}
!285 = !{i32 144, !165}
!286 = !{i32 145, !165}
!287 = !{i32 146, !165}
!288 = !{i32 24, i32 24, i32 0, i32 2}
!289 = !{i32 157}
!290 = !{i32 158}
!291 = !{i32 159}
!292 = !{i32 9, i32 9, i32 0, i32 0}
!293 = !{i32 8, i32 8, i32 0, i32 0}
!294 = !{i32 152}
!295 = !{!296, !297, !298, !299}
!296 = !{i32 147, !159}
!297 = !{i32 148, !159}
!298 = !{i32 149, !159}
!299 = !{i32 150, !159}
!300 = !{i32 153}
!301 = !{i32 154}
!302 = !{i32 155}
!303 = !{i32 139}
!304 = !{!305, !306}
!305 = !{i32 140, !161}
!306 = !{i32 138, !196}
!307 = !{i32 141}
!308 = !{!309, !310}
!309 = !{i32 151, !165}
!310 = !{i32 142, !167}
!311 = distinct !{!311, !312, !314, !273}
!312 = !{i32 370, i32 5, !313, null}
!313 = !{i32 786443, !267, i32 364, i32 5, !269, i32 0}
!314 = !{!"llvm.loop.name", !"MixColumn_AddRoundKey_label1"}
!315 = !{i32 147}
!316 = !{!317, !318, !319, !320}
!317 = !{i32 152, !165}
!318 = !{i32 153, !165}
!319 = !{i32 154, !165}
!320 = !{i32 155, !165}
!321 = !{i32 143}
!322 = !{!323, !324, !325, !326}
!323 = !{i32 156, !159}
!324 = !{i32 157, !159}
!325 = !{i32 158, !159}
!326 = !{i32 159, !159}
!327 = !{i32 148}
!328 = !{i32 144}
!329 = !{i32 149}
!330 = !{i32 145}
!331 = !{i32 150}
!332 = !{i32 146}
!333 = !{i32 142}
!334 = !{!335, !336}
!335 = !{i32 151, !161}
!336 = !{i32 141, !196}
!337 = !{i32 127}
!338 = !{!339, !340}
!339 = !{i32 125, !159}
!340 = !{i32 126, !161}
!341 = !{i32 125}
!342 = !{!343, !344}
!343 = !{i32 127, !165}
!344 = !{i32 126, !167}
!345 = distinct !{!345, !346, !352, !273}
!346 = !{i32 561, i32 5, !347, null}
!347 = !{i32 786443, !348, i32 554, i32 5, !269, i32 0}
!348 = !{i32 786443, !349, !269}
!349 = !{i32 786478, i32 0, !269, !"KeySchedule", !"KeySchedule", null, !269, i32 480, !350, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([32 x i32]*)* @KeySchedule, null, null, !180, i32 480}
!350 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !351, i32 0, i32 0}
!351 = !{!177, !177, !178}
!352 = !{!"llvm.loop.name", !"KeySchedule_label4"}
!353 = !{i32 0, i32 0, i32 6, i32 1}
!354 = !{i32 130}
!355 = !{!356, !357}
!356 = !{i32 128, !159}
!357 = !{i32 129, !161}
!358 = distinct !{!358, !359, !365, !366, !370}
!359 = !{i32 560, i32 9, !360, null}
!360 = !{i32 786443, !361, i32 557, i32 9, !269, i32 0}
!361 = !{i32 786443, !362, !269}
!362 = !{i32 786443, !363, i32 554, i32 30, !269, i32 0}
!363 = !{i32 786443, !364, i32 554, i32 5, !269, i32 0}
!364 = !{i32 786443, !347, !269}
!365 = !{!"llvm.loop.name", !"KeySchedule_label5"}
!366 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !367}
!367 = !{i32 17, i32 9, !368, null}
!368 = !{i32 786443, !360, !369}
!369 = !{i32 786473, !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/aes.tcl", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!370 = !{!"llvm.loop.tripcount", i32 4, i32 4, i32 4, !"user", !371}
!371 = !{i32 558, i32 9, !372, null}
!372 = !{i32 786443, !360, !269}
!373 = !{i32 10, i32 10, i32 0, i32 2}
!374 = !{i32 11, i32 11, i32 0, i32 0}
!375 = !{i32 11, i32 11, i32 0, i32 1}
!376 = !{i32 9, i32 9, i32 0, i32 2}
!377 = !{i32 4, i32 4, i32 0, i32 0}
!378 = !{i32 131}
!379 = !{!380, !381, !382, !383, !384, !385}
!380 = !{i32 133, !159}
!381 = !{i32 134, !159}
!382 = !{i32 135, !159}
!383 = !{i32 136, !159}
!384 = !{i32 137, !159}
!385 = !{i32 132, !161}
!386 = !{i32 126}
!387 = !{!388, !389}
!388 = !{i32 127, !161}
!389 = !{i32 125, !196}
!390 = !{i32 128}
!391 = !{!392, !393}
!392 = !{i32 130, !165}
!393 = !{i32 129, !167}
!394 = distinct !{!394, !395, !397, !398, !401}
!395 = !{i32 596, i32 5, !396, null}
!396 = !{i32 786443, !348, i32 565, i32 5, !269, i32 0}
!397 = !{!"llvm.loop.name", !"KeySchedule_label6"}
!398 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !399}
!399 = !{i32 19, i32 9, !400, null}
!400 = !{i32 786443, !396, !369}
!401 = !{!"llvm.loop.tripcount", i32 40, i32 40, i32 40, !"infer-from-design"}
!402 = !{i32 133}
!403 = !{!404, !405}
!404 = !{i32 131, !165}
!405 = !{i32 132, !406}
!406 = !{!"WAR", i32 1, !">", i32 1, i1 true}
!407 = !{i32 8, i32 8, i32 0, i32 2}
!408 = !{i32 134}
!409 = !{i32 135}
!410 = !{i32 136}
!411 = !{i32 5, i32 5, i32 0, i32 2}
!412 = !{i32 32, i32 32, i32 0, i32 0}
!413 = distinct !{!413, !414, !420, !421, !424}
!414 = !{i32 595, i32 9, !415, null}
!415 = !{i32 786443, !416, i32 592, i32 9, !269, i32 0}
!416 = !{i32 786443, !417, !269}
!417 = !{i32 786443, !418, i32 565, i32 49, !269, i32 0}
!418 = !{i32 786443, !419, i32 565, i32 5, !269, i32 0}
!419 = !{i32 786443, !396, !269}
!420 = !{!"llvm.loop.name", !"KeySchedule_label9"}
!421 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !422}
!422 = !{i32 21, i32 9, !423, null}
!423 = !{i32 786443, !415, !369}
!424 = !{!"llvm.loop.tripcount", i32 4, i32 4, i32 4, !"user", !425}
!425 = !{i32 593, i32 9, !426, null}
!426 = !{i32 786443, !415, !269}
!427 = !{i32 137}
!428 = !{!404, !429}
!429 = !{i32 132, !430}
!430 = !{!"WAR", i32 2, !">", !"=", i32 4, i1 true, i32 0, i1 true}
!431 = !{i32 132}
!432 = !{!433, !435, !436, !437, !438, !439}
!433 = !{i32 133, !434}
!434 = !{!"RAW", i32 1, !"<", i32 1, i1 true}
!435 = !{i32 134, !434}
!436 = !{i32 135, !434}
!437 = !{i32 136, !434}
!438 = !{i32 131, !161}
!439 = !{i32 137, !440}
!440 = !{!"RAW", i32 2, !"<", !"=", i32 4, i1 true, i32 0, i1 true}
!441 = !{i32 129}
!442 = !{!443, !444}
!443 = !{i32 130, !161}
!444 = !{i32 128, !196}
!445 = !{i32 95}
!446 = !{!447}
!447 = !{i32 93, !165}
!448 = !{i32 97}
!449 = !{!450}
!450 = !{i32 94, !165}
!451 = !{i32 93}
!452 = !{!453}
!453 = !{i32 95, !159}
!454 = !{i32 99}
!455 = !{!456}
!456 = !{i32 96, !165}
!457 = !{i32 94}
!458 = !{!459}
!459 = !{i32 97, !159}
!460 = !{i32 100}
!461 = !{!462}
!462 = !{i32 98, !165}
!463 = !{i32 96}
!464 = !{!465}
!465 = !{i32 99, !159}
!466 = !{i32 98}
!467 = !{!468}
!468 = !{i32 100, !159}
!469 = !{i32 103}
!470 = !{!471}
!471 = !{i32 101, !165}
!472 = !{i32 104}
!473 = !{!474}
!474 = !{i32 102, !165}
!475 = !{i32 101}
!476 = !{!477}
!477 = !{i32 103, !159}
!478 = !{i32 102}
!479 = !{!480}
!480 = !{i32 104, !159}
!481 = !{i32 107}
!482 = !{!483}
!483 = !{i32 105, !165}
!484 = !{i32 108}
!485 = !{!486}
!486 = !{i32 106, !165}
!487 = !{i32 105}
!488 = !{!489}
!489 = !{i32 107, !159}
!490 = !{i32 106}
!491 = !{!492}
!492 = !{i32 108, !159}
!493 = !{i32 111}
!494 = !{!495}
!495 = !{i32 109, !165}
!496 = !{i32 113}
!497 = !{!498}
!498 = !{i32 110, !165}
!499 = !{i32 109}
!500 = !{!501}
!501 = !{i32 111, !159}
!502 = !{i32 115}
!503 = !{!504}
!504 = !{i32 112, !165}
!505 = !{i32 110}
!506 = !{!507}
!507 = !{i32 113, !159}
!508 = !{i32 116}
!509 = !{!510}
!510 = !{i32 114, !165}
!511 = !{i32 112}
!512 = !{!513}
!513 = !{i32 115, !159}
!514 = !{i32 114}
!515 = !{!516}
!516 = !{i32 116, !159}
!517 = !{i32 118}
!518 = !{!519}
!519 = !{i32 117, !165}
!520 = !{i32 117}
!521 = !{!522}
!522 = !{i32 118, !159}
!523 = !{i32 120}
!524 = !{!525}
!525 = !{i32 119, !165}
!526 = !{i32 119}
!527 = !{!528}
!528 = !{i32 120, !159}
!529 = !{i32 122}
!530 = !{!531}
!531 = !{i32 121, !165}
!532 = !{i32 121}
!533 = !{!534}
!534 = !{i32 122, !159}
!535 = !{i32 124}
!536 = !{!537}
!537 = !{i32 123, !165}
!538 = !{i32 123}
!539 = !{!540}
!540 = !{i32 124, !159}
!541 = !{i32 63}
!542 = !{!543}
!543 = !{i32 61, !165}
!544 = !{i32 65}
!545 = !{!546}
!546 = !{i32 62, !165}
!547 = !{i32 61}
!548 = !{!549}
!549 = !{i32 63, !159}
!550 = !{i32 67}
!551 = !{!552}
!552 = !{i32 64, !165}
!553 = !{i32 62}
!554 = !{!555}
!555 = !{i32 65, !159}
!556 = !{i32 68}
!557 = !{!558}
!558 = !{i32 66, !165}
!559 = !{i32 64}
!560 = !{!561}
!561 = !{i32 67, !159}
!562 = !{i32 66}
!563 = !{!564}
!564 = !{i32 68, !159}
!565 = !{i32 71}
!566 = !{!567}
!567 = !{i32 69, !165}
!568 = !{i32 72}
!569 = !{!570}
!570 = !{i32 70, !165}
!571 = !{i32 69}
!572 = !{!573}
!573 = !{i32 71, !159}
!574 = !{i32 70}
!575 = !{!576}
!576 = !{i32 72, !159}
!577 = !{i32 75}
!578 = !{!579}
!579 = !{i32 73, !165}
!580 = !{i32 76}
!581 = !{!582}
!582 = !{i32 74, !165}
!583 = !{i32 73}
!584 = !{!585}
!585 = !{i32 75, !159}
!586 = !{i32 74}
!587 = !{!588}
!588 = !{i32 76, !159}
!589 = !{i32 79}
!590 = !{!591}
!591 = !{i32 77, !165}
!592 = !{i32 81}
!593 = !{!594}
!594 = !{i32 78, !165}
!595 = !{i32 77}
!596 = !{!597}
!597 = !{i32 79, !159}
!598 = !{i32 83}
!599 = !{!600}
!600 = !{i32 80, !165}
!601 = !{i32 78}
!602 = !{!603}
!603 = !{i32 81, !159}
!604 = !{i32 84}
!605 = !{!606}
!606 = !{i32 82, !165}
!607 = !{i32 80}
!608 = !{!609}
!609 = !{i32 83, !159}
!610 = !{i32 82}
!611 = !{!612}
!612 = !{i32 84, !159}
!613 = !{i32 86}
!614 = !{!615}
!615 = !{i32 85, !165}
!616 = !{i32 85}
!617 = !{!618}
!618 = !{i32 86, !159}
!619 = !{i32 88}
!620 = !{!621}
!621 = !{i32 87, !165}
!622 = !{i32 87}
!623 = !{!624}
!624 = !{i32 88, !159}
!625 = !{i32 90}
!626 = !{!627}
!627 = !{i32 89, !165}
!628 = !{i32 89}
!629 = !{!630}
!630 = !{i32 90, !159}
!631 = !{i32 92}
!632 = !{!633}
!633 = !{i32 91, !165}
!634 = !{i32 91}
!635 = !{!636}
!636 = !{i32 92, !159}
!637 = !{i32 33}
!638 = !{!639, !640}
!639 = !{i32 31, !159}
!640 = !{i32 32, !161}
!641 = !{i32 31}
!642 = !{!643, !644}
!643 = !{i32 33, !165}
!644 = !{i32 32, !167}
!645 = distinct !{!645, !646, !650, !273}
!646 = !{i32 386, i32 5, !647, null}
!647 = !{i32 786443, !648, i32 380, i32 5, !269, i32 0}
!648 = !{i32 786443, !649, !269}
!649 = !{i32 786478, i32 0, !269, !"AddRoundKey_InversMixColumn", !"AddRoundKey_InversMixColumn", null, !269, i32 375, !270, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([32 x i32]*, i4)* @AddRoundKey_InversMixColumn, null, null, !180, i32 375}
!650 = !{!"llvm.loop.name", !"AddRoundKey_InversMixColumn_label2"}
!651 = !{i32 52}
!652 = !{!653, !654}
!653 = !{i32 34, !159}
!654 = !{i32 35, !161}
!655 = !{i32 41}
!656 = !{!657, !659, !660, !661, !662}
!657 = !{i32 36, !658}
!658 = !{!"WAR", !"indep", i32 1, !"=", i32 0, i1 true}
!659 = !{i32 37, !165}
!660 = !{i32 38, !165}
!661 = !{i32 39, !165}
!662 = !{i32 40, !165}
!663 = !{i32 36}
!664 = !{!665, !667, !668, !669, !670, !671, !672, !673, !674}
!665 = !{i32 41, !666}
!666 = !{!"RAW", !"indep", i32 1, !"=", i32 0, i1 true}
!667 = !{i32 37, !161}
!668 = !{i32 38, !161}
!669 = !{i32 39, !161}
!670 = !{i32 40, !161}
!671 = !{i32 42, !159}
!672 = !{i32 43, !159}
!673 = !{i32 44, !159}
!674 = !{i32 45, !159}
!675 = !{i32 47}
!676 = !{!677, !659, !660, !661, !662}
!677 = !{i32 46, !658}
!678 = !{i32 46}
!679 = !{!680, !667, !668, !669, !670, !671, !672, !673, !674}
!680 = !{i32 47, !666}
!681 = !{i32 49}
!682 = !{!683, !659, !660, !661, !662}
!683 = !{i32 48, !658}
!684 = !{i32 48}
!685 = !{!686, !667, !668, !669, !670, !671, !672, !673, !674}
!686 = !{i32 49, !666}
!687 = !{i32 51}
!688 = !{!689, !659, !660, !661, !662}
!689 = !{i32 50, !658}
!690 = !{i32 50}
!691 = !{!692, !667, !668, !669, !670, !671, !672, !673, !674}
!692 = !{i32 51, !666}
!693 = !{i32 32}
!694 = !{!695, !696}
!695 = !{i32 33, !161}
!696 = !{i32 31, !196}
!697 = !{i32 34}
!698 = !{!699, !700}
!699 = !{i32 52, !165}
!700 = !{i32 35, !167}
!701 = distinct !{!701, !702, !704, !273}
!702 = !{i32 433, i32 5, !703, null}
!703 = !{i32 786443, !648, i32 389, i32 5, !269, i32 0}
!704 = !{!"llvm.loop.name", !"AddRoundKey_InversMixColumn_label0"}
!705 = !{i32 55}
!706 = !{!707, !708}
!707 = !{i32 53, !159}
!708 = !{i32 54, !161}
!709 = distinct !{!709, !710, !716, !717, !720}
!710 = !{i32 432, i32 9, !711, null}
!711 = !{i32 786443, !712, i32 392, i32 9, !269, i32 0}
!712 = !{i32 786443, !713, !269}
!713 = !{i32 786443, !714, i32 389, i32 30, !269, i32 0}
!714 = !{i32 786443, !715, i32 389, i32 5, !269, i32 0}
!715 = !{i32 786443, !703, !269}
!716 = !{!"llvm.loop.name", !"AddRoundKey_InversMixColumn_label1"}
!717 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !718}
!718 = !{i32 16, i32 9, !719, null}
!719 = !{i32 786443, !711, !369}
!720 = !{!"llvm.loop.tripcount", i32 4, i32 4, i32 4, !"user", !721}
!721 = !{i32 393, i32 9, !722, null}
!722 = !{i32 786443, !711, !269}
!723 = !{i32 42}
!724 = !{!725, !726, !727, !728, !659, !660, !661, !662}
!725 = !{i32 36, !165}
!726 = !{i32 46, !165}
!727 = !{i32 48, !165}
!728 = !{i32 50, !165}
!729 = !{i32 30, i32 30, i32 0, i32 2}
!730 = !{i32 31, i32 31, i32 0, i32 2}
!731 = !{i32 43}
!732 = !{i32 44}
!733 = !{i32 45}
!734 = !{i32 56}
!735 = !{!736, !737, !738, !739}
!736 = !{i32 57, !159}
!737 = !{i32 58, !159}
!738 = !{i32 59, !159}
!739 = !{i32 60, !159}
!740 = !{i32 35}
!741 = !{!742, !743}
!742 = !{i32 52, !161}
!743 = !{i32 34, !196}
!744 = !{i32 53}
!745 = !{!746, !747}
!746 = !{i32 55, !165}
!747 = !{i32 54, !167}
!748 = distinct !{!748, !749, !751, !273}
!749 = !{i32 442, i32 5, !750, null}
!750 = !{i32 786443, !648, i32 436, i32 5, !269, i32 0}
!751 = !{!"llvm.loop.name", !"AddRoundKey_InversMixColumn_label3"}
!752 = !{i32 57}
!753 = !{!754}
!754 = !{i32 56, !165}
!755 = !{i32 37}
!756 = !{!757, !758, !759, !760, !761, !762, !763, !764, !671, !672, !673, !674}
!757 = !{i32 41, !159}
!758 = !{i32 36, !161}
!759 = !{i32 47, !159}
!760 = !{i32 46, !161}
!761 = !{i32 49, !159}
!762 = !{i32 48, !161}
!763 = !{i32 51, !159}
!764 = !{i32 50, !161}
!765 = !{i32 58}
!766 = !{i32 38}
!767 = !{i32 59}
!768 = !{i32 39}
!769 = !{i32 60}
!770 = !{i32 40}
!771 = !{i32 54}
!772 = !{!773, !774}
!773 = !{i32 55, !161}
!774 = !{i32 53, !196}
!775 = !{i32 22}
!776 = !{!777, !778}
!777 = !{i32 20, !159}
!778 = !{i32 21, !161}
!779 = !{i32 20}
!780 = !{!781, !782}
!781 = !{i32 22, !165}
!782 = !{i32 21, !167}
!783 = distinct !{!783, !784, !788, !273}
!784 = !{i32 475, i32 5, !785, null}
!785 = !{i32 786443, !786, i32 469, i32 5, !269, i32 0}
!786 = !{i32 786443, !787, !269}
!787 = !{i32 786478, i32 0, !269, !"AddRoundKey", !"AddRoundKey", null, !269, i32 447, !270, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([32 x i32]*, i4)* @AddRoundKey, null, null, !180, i32 447}
!788 = !{!"llvm.loop.name", !"AddRoundKey_label0"}
!789 = !{i32 24}
!790 = !{!791}
!791 = !{i32 23, !658}
!792 = !{i32 23}
!793 = !{!794}
!794 = !{i32 24, !666}
!795 = !{i32 26}
!796 = !{!797}
!797 = !{i32 25, !658}
!798 = !{i32 25}
!799 = !{!800}
!800 = !{i32 26, !666}
!801 = !{i32 28}
!802 = !{!803}
!803 = !{i32 27, !658}
!804 = !{i32 27}
!805 = !{!806}
!806 = !{i32 28, !666}
!807 = !{i32 30}
!808 = !{!809}
!809 = !{i32 29, !658}
!810 = !{i32 29}
!811 = !{!812}
!812 = !{i32 30, !666}
!813 = !{i32 21}
!814 = !{!815, !816}
!815 = !{i32 22, !161}
!816 = !{i32 20, !196}
