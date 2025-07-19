; ModuleID = 'data/base_solutions/BACKPROP/solution0/.autopilot/db/a.o.3.bc'
source_filename = "data/base_solutions/BACKPROP/solution0/.autopilot/db/a.o.3.bc"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

$_ssdm_op_SpecTopModule = comdat any

$_ssdm_op_SpecPipeline = comdat any

$_ssdm_op_SpecLoopTripCount = comdat any

$_ssdm_op_SpecLoopName = comdat any

$_ssdm_op_SpecInterface = comdat any

$_ssdm_op_SpecBitsMap = comdat any

$_ssdm_op_Read.ap_auto.i9 = comdat any

$_ssdm_op_Read.ap_auto.i12 = comdat any

$_ssdm_op_Read.ap_auto.double = comdat any

$_ssdm_op_Mux.ap_auto.3double.i2 = comdat any

$_ssdm_op_BitConcatenate.i9.i7.i2 = comdat any

$_ssdm_op_BitConcatenate.i8.i6.i2 = comdat any

$_ssdm_op_BitConcatenate.i8.i2.i6 = comdat any

$_ssdm_op_BitConcatenate.i12.i6.i6 = comdat any

$_ssdm_op_BitConcatenate.i10.i4.i6 = comdat any

@empty = internal unnamed_addr constant [50 x i8] c"matrix_vector_product_with_bias_input_layer_loop1\00"
@empty_0 = internal unnamed_addr constant [17 x i8] c"backprop_loop1_1\00"
@empty_1 = internal unnamed_addr constant [15 x i8] c"backprop_loop1\00"
@empty_2 = internal unnamed_addr constant [11 x i8] c"RELU_loop1\00"
@empty_3 = internal unnamed_addr constant [15 x i8] c"soft_max_loop2\00"
@empty_4 = internal unnamed_addr constant [15 x i8] c"soft_max_loop1\00"
@empty_5 = internal unnamed_addr constant [34 x i8] c"get_delta_matrix_weights3_loop1_1\00"
@empty_6 = internal unnamed_addr constant [32 x i8] c"get_delta_matrix_weights3_loop1\00"
@empty_7 = internal unnamed_addr constant [32 x i8] c"get_oracle_activations1_loop1_1\00"
@empty_8 = internal unnamed_addr constant [10 x i8] c"ap_memory\00"
@empty_9 = internal unnamed_addr constant [30 x i8] c"get_oracle_activations1_loop1\00"
@empty_10 = internal unnamed_addr constant [9 x i8] c"backprop\00"
@empty_11 = internal unnamed_addr constant [53 x i8] c"matrix_vector_product_with_bias_second_layer_loop1_1\00"
@empty_12 = internal unnamed_addr constant [51 x i8] c"matrix_vector_product_with_bias_second_layer_loop1\00"
@empty_13 = internal unnamed_addr constant [53 x i8] c"matrix_vector_product_with_bias_output_layer_loop1_1\00"
@empty_14 = internal unnamed_addr constant [51 x i8] c"matrix_vector_product_with_bias_output_layer_loop1\00"
@empty_15 = internal unnamed_addr constant [22 x i8] c"take_difference_loop1\00"
@empty_16 = internal unnamed_addr constant [32 x i8] c"get_oracle_activations2_loop1_1\00"
@empty_17 = internal unnamed_addr constant [30 x i8] c"get_oracle_activations2_loop1\00"
@empty_18 = internal unnamed_addr constant [21 x i8] c"update_weights_loop7\00"
@empty_19 = internal unnamed_addr constant [32 x i8] c"get_delta_matrix_weights2_loop1\00"
@empty_20 = internal unnamed_addr constant [52 x i8] c"matrix_vector_product_with_bias_input_layer_loop1_1\00"
@empty_21 = internal unnamed_addr constant [21 x i8] c"update_weights_loop6\00"
@empty_22 = internal unnamed_addr constant [32 x i8] c"get_delta_matrix_weights1_loop1\00"
@empty_23 = internal unnamed_addr constant [22 x i8] c"update_weights_loop12\00"
@empty_24 = internal unnamed_addr constant [24 x i8] c"update_weights_loop11_1\00"
@empty_25 = internal unnamed_addr constant [22 x i8] c"update_weights_loop11\00"
@empty_26 = internal unnamed_addr constant [22 x i8] c"update_weights_loop10\00"
@empty_27 = internal unnamed_addr constant [23 x i8] c"update_weights_loop9_1\00"
@empty_28 = internal unnamed_addr constant [21 x i8] c"update_weights_loop9\00"
@empty_29 = internal unnamed_addr constant [21 x i8] c"update_weights_loop8\00"
@empty_30 = internal unnamed_addr constant [34 x i8] c"get_delta_matrix_weights2_loop1_1\00"
@empty_31 = internal unnamed_addr constant [30 x i8] c"add_bias_to_activations_loop1\00"
@empty_32 = internal unnamed_addr constant [34 x i8] c"get_delta_matrix_weights1_loop1_1\00"
@empty_33 = internal unnamed_addr constant [23 x i8] c"update_weights_loop5_1\00"
@empty_34 = internal unnamed_addr constant [21 x i8] c"update_weights_loop5\00"
@empty_35 = internal unnamed_addr constant [21 x i8] c"update_weights_loop4\00"
@empty_36 = internal unnamed_addr constant [23 x i8] c"update_weights_loop3_1\00"
@empty_37 = internal unnamed_addr constant [21 x i8] c"update_weights_loop3\00"
@empty_38 = internal unnamed_addr constant [21 x i8] c"update_weights_loop2\00"
@empty_39 = internal unnamed_addr constant [23 x i8] c"update_weights_loop1_1\00"
@empty_40 = internal unnamed_addr constant [21 x i8] c"update_weights_loop1\00"
@empty_41 = internal unnamed_addr constant [23 x i8] c"update_weights_loop7_1\00"
@empty_42 = internal unnamed_addr constant [1 x i8] zeroinitializer

; Function Attrs: noinline
define internal fastcc void @update_weights.1([832 x i64]* noalias nocapture %weights1, [4096 x i64]* noalias nocapture %weights2, [192 x i64]* noalias nocapture %weights3, [832 x double]* noalias nocapture align 512 %d_weights1, [4096 x double]* noalias nocapture align 512 %d_weights2, [192 x double]* noalias nocapture align 512 %d_weights3, [64 x i64]* noalias nocapture %biases1, [64 x i64]* noalias nocapture %biases2, [3 x i64]* noalias nocapture %biases3, [64 x double]* noalias nocapture align 512 %d_biases1, [64 x double]* noalias nocapture align 512 %d_biases2, double %p_read, double %p_read1, double %p_read2) #0 {
entry:
  %i = alloca i4, align 1, !bitwidth !178
  %norm = alloca double, align 8, !bitwidth !11
  call void (...) @_ssdm_op_SpecInterface([3 x i64]* %biases3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([64 x i64]* %biases2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([64 x i64]* %biases1, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([192 x i64]* %weights3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([4096 x i64]* %weights2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([832 x i64]* %weights1, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !179
  %p_read_1 = call double @_ssdm_op_Read.ap_auto.double(double %p_read2), !bitwidth !20
  %p_read_2 = call double @_ssdm_op_Read.ap_auto.double(double %p_read1), !bitwidth !20
  %p_read_3 = call double @_ssdm_op_Read.ap_auto.double(double %p_read), !bitwidth !20
  store double 0.000000e+00, double* %norm, align 8, !bitwidth !11, !dep_idx !180, !deps !181
  store i4 0, i4* %i, align 1, !bitwidth !11, !dep_idx !187, !deps !188
  br label %update_weights_loop1_1, !bitwidth !11

update_weights_loop1_1:                           ; preds = %for.inc19, %entry
  %i_12 = load i4, i4* %i, align 1, !bitwidth !191, !dep_idx !192, !deps !193
  %icmp_ln219 = icmp eq i4 %i_12, -3, !bitwidth !198
  %add_ln219 = add nuw i4 %i_12, 1, !bitwidth !191
  br i1 %icmp_ln219, label %for.inc37.preheader, label %update_weights_loop1_1.split, !llvm.loop !199, !bitwidth !11

for.inc37.preheader:                              ; preds = %update_weights_loop1_1
  %bias_norm_1 = alloca double, align 8, !bitwidth !11
  %i_1 = alloca i7, align 1, !bitwidth !216
  store i7 0, i7* %i_1, align 1, !bitwidth !11, !dep_idx !217, !deps !218
  store double 0.000000e+00, double* %bias_norm_1, align 8, !bitwidth !11, !dep_idx !221, !deps !222
  br label %for.inc37, !bitwidth !11

update_weights_loop1_1.split:                     ; preds = %update_weights_loop1_1
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 13, i64 13, i64 13), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_40)
  %tmp_1 = call i10 @_ssdm_op_BitConcatenate.i10.i4.i6(i4 %i_12, i6 0), !bitwidth !226
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %update_weights_loop1_1.split
  %j = phi i7 [ %add_ln222, %for.inc.split ], [ 0, %update_weights_loop1_1.split ], !bitwidth !227
  %icmp_ln222 = icmp eq i7 %j, -64, !bitwidth !198
  %add_ln222 = add nuw i7 %j, 1, !bitwidth !227
  br i1 %icmp_ln222, label %for.inc19, label %for.inc.split, !llvm.loop !228, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %norm_load_1 = load double, double* %norm, align 8, !bitwidth !20, !dep_idx !242, !deps !243
  %zext_ln222 = zext i7 %j to i10, !bitwidth !247
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([23 x i8]* @empty_39)
  %add_ln224 = add nuw i10 %zext_ln222, %tmp_1, !bitwidth !226
  %zext_ln224 = zext i10 %add_ln224 to i64, !bitwidth !248
  %d_weights1_addr = getelementptr inbounds [832 x double], [832 x double]* %d_weights1, i64 0, i64 %zext_ln224, !bitwidth !11
  %d_weights1_load = load double, double* %d_weights1_addr, align 8, !bitwidth !20
  %mul4 = fmul double %d_weights1_load, 1.000000e-02, !bitwidth !20
  %weights1_addr = getelementptr [832 x i64], [832 x i64]* %weights1, i64 0, i64 %zext_ln224, !bitwidth !7
  %weights1_load = load i64, i64* %weights1_addr, align 8, !bitwidth !20, !dep_idx !249, !deps !250
  %bitcast_ln224 = bitcast i64 %weights1_load to double, !bitwidth !20
  %sub = fsub double %bitcast_ln224, %mul4, !bitwidth !20
  %bitcast_ln224_1 = bitcast double %sub to i64, !bitwidth !20
  store i64 %bitcast_ln224_1, i64* %weights1_addr, align 8, !bitwidth !11, !dep_idx !254, !deps !255
  %mul2 = fmul double %sub, %sub, !bitwidth !20
  %norm_2 = fadd double %norm_load_1, %mul2, !bitwidth !20
  store double %norm_2, double* %norm, align 8, !bitwidth !11, !dep_idx !260, !deps !261
  br label %for.inc, !llvm.loop !228, !bitwidth !11

for.inc19:                                        ; preds = %for.inc
  store i4 %add_ln219, i4* %i, align 1, !bitwidth !11, !dep_idx !265, !deps !266
  br label %update_weights_loop1_1, !llvm.loop !199, !bitwidth !11

for.inc37:                                        ; preds = %for.inc37.split, %for.inc37.preheader
  %i_13 = load i7, i7* %i_1, align 1, !bitwidth !227, !dep_idx !270, !deps !271
  %icmp_ln229 = icmp eq i7 %i_13, -64, !bitwidth !198
  %add_ln229 = add nuw i7 %i_13, 1, !bitwidth !227
  br i1 %icmp_ln229, label %for.end39, label %for.inc37.split, !llvm.loop !274, !bitwidth !11

for.inc37.split:                                  ; preds = %for.inc37
  %bias_norm_1_load = load double, double* %bias_norm_1, align 8, !bitwidth !20, !dep_idx !281, !deps !282
  %zext_ln229 = zext i7 %i_13 to i64, !bitwidth !248
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_38)
  %d_biases1_addr = getelementptr inbounds [64 x double], [64 x double]* %d_biases1, i64 0, i64 %zext_ln229, !bitwidth !11
  %d_biases1_load = load double, double* %d_biases1_addr, align 8, !bitwidth !20
  %mul = fmul double %d_biases1_load, 1.000000e-02, !bitwidth !20
  %biases1_addr = getelementptr [64 x i64], [64 x i64]* %biases1, i64 0, i64 %zext_ln229, !bitwidth !7
  %biases1_load = load i64, i64* %biases1_addr, align 8, !bitwidth !20, !dep_idx !285, !deps !286
  %bitcast_ln231 = bitcast i64 %biases1_load to double, !bitwidth !20
  %sub1 = fsub double %bitcast_ln231, %mul, !bitwidth !20
  %bitcast_ln231_1 = bitcast double %sub1 to i64, !bitwidth !20
  store i64 %bitcast_ln231_1, i64* %biases1_addr, align 8, !bitwidth !11, !dep_idx !290, !deps !291
  %mul1 = fmul double %sub1, %sub1, !bitwidth !20
  %bias_norm_2 = fadd double %bias_norm_1_load, %mul1, !bitwidth !20
  store i7 %add_ln229, i7* %i_1, align 1, !bitwidth !11, !dep_idx !296, !deps !297
  store double %bias_norm_2, double* %bias_norm_1, align 8, !bitwidth !11, !dep_idx !300, !deps !301
  br label %for.inc37, !llvm.loop !274, !bitwidth !11

for.end39:                                        ; preds = %for.inc37
  %i_2 = alloca i4, align 1, !bitwidth !178
  %norm_load = load double, double* %norm, align 8, !bitwidth !20, !dep_idx !304, !deps !305
  %norm_1 = call double @llvm.sqrt.f64(double %norm_load), !bitwidth !20
  store i4 0, i4* %i_2, align 1, !bitwidth !11, !dep_idx !307, !deps !308
  br label %update_weights_loop3_1, !bitwidth !11

update_weights_loop3_1:                           ; preds = %for.inc57, %for.end39
  %i_14 = load i4, i4* %i_2, align 1, !bitwidth !191, !dep_idx !311, !deps !312
  %icmp_ln239 = icmp eq i4 %i_14, -3, !bitwidth !198
  %add_ln239 = add nuw i4 %i_14, 1, !bitwidth !191
  br i1 %icmp_ln239, label %update_weights_loop4, label %update_weights_loop3_1.split, !llvm.loop !315, !bitwidth !11

update_weights_loop3_1.split:                     ; preds = %update_weights_loop3_1
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 13, i64 13, i64 13), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_37)
  %tmp_2 = call i10 @_ssdm_op_BitConcatenate.i10.i4.i6(i4 %i_14, i6 0), !bitwidth !226
  br label %for.inc54, !bitwidth !11

for.inc54:                                        ; preds = %for.inc54.split, %update_weights_loop3_1.split
  %j_1 = phi i7 [ %add_ln242, %for.inc54.split ], [ 0, %update_weights_loop3_1.split ], !bitwidth !227
  %icmp_ln242 = icmp eq i7 %j_1, -64, !bitwidth !198
  %add_ln242 = add nuw i7 %j_1, 1, !bitwidth !227
  br i1 %icmp_ln242, label %for.inc57, label %for.inc54.split, !llvm.loop !322, !bitwidth !11

for.inc54.split:                                  ; preds = %for.inc54
  %zext_ln242 = zext i7 %j_1 to i10, !bitwidth !247
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([23 x i8]* @empty_36)
  %add_ln244 = add nuw i10 %zext_ln242, %tmp_2, !bitwidth !226
  %zext_ln244 = zext i10 %add_ln244 to i64, !bitwidth !248
  %weights1_addr_1 = getelementptr [832 x i64], [832 x i64]* %weights1, i64 0, i64 %zext_ln244, !bitwidth !7
  %weights1_load_1 = load i64, i64* %weights1_addr_1, align 8, !bitwidth !20, !dep_idx !335, !deps !336
  %bitcast_ln244 = bitcast i64 %weights1_load_1 to double, !bitwidth !20
  %div = fdiv double %bitcast_ln244, %norm_1, !bitwidth !20
  %bitcast_ln244_1 = bitcast double %div to i64, !bitwidth !20
  store i64 %bitcast_ln244_1, i64* %weights1_addr_1, align 8, !bitwidth !11, !dep_idx !339, !deps !340
  br label %for.inc54, !llvm.loop !322, !bitwidth !11

for.inc57:                                        ; preds = %for.inc54
  store i4 %add_ln239, i4* %i_2, align 1, !bitwidth !11, !dep_idx !344, !deps !345
  br label %update_weights_loop3_1, !llvm.loop !315, !bitwidth !11

update_weights_loop4:                             ; preds = %update_weights_loop3_1
  %i_3 = alloca i7, align 1, !bitwidth !216
  %bias_norm_1_load_1 = load double, double* %bias_norm_1, align 8, !bitwidth !20, !dep_idx !348, !deps !349
  %bias_norm = call double @llvm.sqrt.f64(double %bias_norm_1_load_1), !bitwidth !20
  store i7 0, i7* %i_3, align 1, !bitwidth !11, !dep_idx !351, !deps !352
  br label %for.inc68, !bitwidth !11

for.inc68:                                        ; preds = %for.inc68.split, %update_weights_loop4
  %i_15 = load i7, i7* %i_3, align 1, !bitwidth !227, !dep_idx !355, !deps !356
  %icmp_ln248 = icmp eq i7 %i_15, -64, !bitwidth !198
  %add_ln248 = add nuw i7 %i_15, 1, !bitwidth !227
  br i1 %icmp_ln248, label %update_weights_loop5_1.preheader, label %for.inc68.split, !llvm.loop !359, !bitwidth !11

update_weights_loop5_1.preheader:                 ; preds = %for.inc68
  %i_4 = alloca i7, align 1, !bitwidth !216
  %norm_3 = alloca double, align 8, !bitwidth !11
  store double 0.000000e+00, double* %norm_3, align 8, !bitwidth !11, !dep_idx !366, !deps !367
  store i7 0, i7* %i_4, align 1, !bitwidth !11, !dep_idx !371, !deps !372
  br label %update_weights_loop5_1, !bitwidth !11

for.inc68.split:                                  ; preds = %for.inc68
  %zext_ln248 = zext i7 %i_15 to i64, !bitwidth !248
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_35)
  %biases1_addr_1 = getelementptr [64 x i64], [64 x i64]* %biases1, i64 0, i64 %zext_ln248, !bitwidth !7
  %biases1_load_1 = load i64, i64* %biases1_addr_1, align 8, !bitwidth !20, !dep_idx !375, !deps !376
  %bitcast_ln250 = bitcast i64 %biases1_load_1 to double, !bitwidth !20
  %div1 = fdiv double %bitcast_ln250, %bias_norm, !bitwidth !20
  %bitcast_ln250_1 = bitcast double %div1 to i64, !bitwidth !20
  store i64 %bitcast_ln250_1, i64* %biases1_addr_1, align 8, !bitwidth !11, !dep_idx !379, !deps !380
  store i7 %add_ln248, i7* %i_3, align 1, !bitwidth !11, !dep_idx !384, !deps !385
  br label %for.inc68, !llvm.loop !359, !bitwidth !11

update_weights_loop5_1:                           ; preds = %for.inc100, %update_weights_loop5_1.preheader
  %i_16 = load i7, i7* %i_4, align 1, !bitwidth !227, !dep_idx !388, !deps !389
  %icmp_ln257 = icmp eq i7 %i_16, -64, !bitwidth !198
  %add_ln257 = add nuw i7 %i_16, 1, !bitwidth !227
  br i1 %icmp_ln257, label %for.inc118.preheader, label %update_weights_loop5_1.split, !llvm.loop !392, !bitwidth !11

for.inc118.preheader:                             ; preds = %update_weights_loop5_1
  %bias_norm_4 = alloca double, align 8, !bitwidth !11
  %i_5 = alloca i7, align 1, !bitwidth !216
  store i7 0, i7* %i_5, align 1, !bitwidth !11, !dep_idx !399, !deps !400
  store double 0.000000e+00, double* %bias_norm_4, align 8, !bitwidth !11, !dep_idx !403, !deps !404
  br label %for.inc118, !bitwidth !11

update_weights_loop5_1.split:                     ; preds = %update_weights_loop5_1
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_34)
  %empty = trunc i7 %i_16 to i6, !bitwidth !408
  %tmp_4 = call i12 @_ssdm_op_BitConcatenate.i12.i6.i6(i6 %empty, i6 0), !bitwidth !115
  br label %for.inc97, !bitwidth !11

for.inc97:                                        ; preds = %for.inc97.split, %update_weights_loop5_1.split
  %j_2 = phi i7 [ %add_ln260, %for.inc97.split ], [ 0, %update_weights_loop5_1.split ], !bitwidth !227
  %icmp_ln260 = icmp eq i7 %j_2, -64, !bitwidth !198
  %add_ln260 = add nuw i7 %j_2, 1, !bitwidth !227
  br i1 %icmp_ln260, label %for.inc100, label %for.inc97.split, !llvm.loop !409, !bitwidth !11

for.inc97.split:                                  ; preds = %for.inc97
  %norm_3_load_1 = load double, double* %norm_3, align 8, !bitwidth !20, !dep_idx !422, !deps !423
  %zext_ln260 = zext i7 %j_2 to i12, !bitwidth !426
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([23 x i8]* @empty_33)
  %add_ln262 = add nuw i12 %zext_ln260, %tmp_4, !bitwidth !115
  %zext_ln262 = zext i12 %add_ln262 to i64, !bitwidth !248
  %d_weights2_addr = getelementptr inbounds [4096 x double], [4096 x double]* %d_weights2, i64 0, i64 %zext_ln262, !bitwidth !11
  %d_weights2_load = load double, double* %d_weights2_addr, align 8, !bitwidth !20
  %mul6 = fmul double %d_weights2_load, 1.000000e-02, !bitwidth !20
  %weights2_addr = getelementptr [4096 x i64], [4096 x i64]* %weights2, i64 0, i64 %zext_ln262, !bitwidth !7
  %weights2_load = load i64, i64* %weights2_addr, align 8, !bitwidth !20, !dep_idx !427, !deps !428
  %bitcast_ln262 = bitcast i64 %weights2_load to double, !bitwidth !20
  %sub3 = fsub double %bitcast_ln262, %mul6, !bitwidth !20
  %bitcast_ln262_1 = bitcast double %sub3 to i64, !bitwidth !20
  store i64 %bitcast_ln262_1, i64* %weights2_addr, align 8, !bitwidth !11, !dep_idx !431, !deps !432
  %mul7 = fmul double %sub3, %sub3, !bitwidth !20
  %norm_5 = fadd double %norm_3_load_1, %mul7, !bitwidth !20
  store double %norm_5, double* %norm_3, align 8, !bitwidth !11, !dep_idx !436, !deps !437
  br label %for.inc97, !llvm.loop !409, !bitwidth !11

for.inc100:                                       ; preds = %for.inc97
  store i7 %add_ln257, i7* %i_4, align 1, !bitwidth !11, !dep_idx !440, !deps !441
  br label %update_weights_loop5_1, !llvm.loop !392, !bitwidth !11

for.inc118:                                       ; preds = %for.inc118.split, %for.inc118.preheader
  %i_17 = load i7, i7* %i_5, align 1, !bitwidth !227, !dep_idx !444, !deps !445
  %icmp_ln267 = icmp eq i7 %i_17, -64, !bitwidth !198
  %add_ln267 = add nuw i7 %i_17, 1, !bitwidth !227
  br i1 %icmp_ln267, label %for.end120, label %for.inc118.split, !llvm.loop !448, !bitwidth !11

for.inc118.split:                                 ; preds = %for.inc118
  %bias_norm_4_load = load double, double* %bias_norm_4, align 8, !bitwidth !20, !dep_idx !455, !deps !456
  %zext_ln267 = zext i7 %i_17 to i64, !bitwidth !248
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_21)
  %d_biases2_addr = getelementptr inbounds [64 x double], [64 x double]* %d_biases2, i64 0, i64 %zext_ln267, !bitwidth !11
  %d_biases2_load = load double, double* %d_biases2_addr, align 8, !bitwidth !20
  %mul3 = fmul double %d_biases2_load, 1.000000e-02, !bitwidth !20
  %biases2_addr = getelementptr [64 x i64], [64 x i64]* %biases2, i64 0, i64 %zext_ln267, !bitwidth !7
  %biases2_load = load i64, i64* %biases2_addr, align 8, !bitwidth !20, !dep_idx !459, !deps !460
  %bitcast_ln269 = bitcast i64 %biases2_load to double, !bitwidth !20
  %sub2 = fsub double %bitcast_ln269, %mul3, !bitwidth !20
  %bitcast_ln269_1 = bitcast double %sub2 to i64, !bitwidth !20
  store i64 %bitcast_ln269_1, i64* %biases2_addr, align 8, !bitwidth !11, !dep_idx !463, !deps !464
  %mul5 = fmul double %sub2, %sub2, !bitwidth !20
  %bias_norm_5 = fadd double %bias_norm_4_load, %mul5, !bitwidth !20
  store i7 %add_ln267, i7* %i_5, align 1, !bitwidth !11, !dep_idx !468, !deps !469
  store double %bias_norm_5, double* %bias_norm_4, align 8, !bitwidth !11, !dep_idx !472, !deps !473
  br label %for.inc118, !llvm.loop !448, !bitwidth !11

for.end120:                                       ; preds = %for.inc118
  %i_6 = alloca i7, align 1, !bitwidth !216
  %norm_3_load = load double, double* %norm_3, align 8, !bitwidth !20, !dep_idx !476, !deps !477
  %norm_4 = call double @llvm.sqrt.f64(double %norm_3_load), !bitwidth !20
  store i7 0, i7* %i_6, align 1, !bitwidth !11, !dep_idx !479, !deps !480
  br label %update_weights_loop7_1, !bitwidth !11

update_weights_loop7_1:                           ; preds = %for.inc139, %for.end120
  %i_18 = load i7, i7* %i_6, align 1, !bitwidth !227, !dep_idx !483, !deps !484
  %icmp_ln277 = icmp eq i7 %i_18, -64, !bitwidth !198
  %add_ln277 = add nuw i7 %i_18, 1, !bitwidth !227
  br i1 %icmp_ln277, label %update_weights_loop8, label %update_weights_loop7_1.split, !llvm.loop !487, !bitwidth !11

update_weights_loop7_1.split:                     ; preds = %update_weights_loop7_1
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_18)
  %empty_46 = trunc i7 %i_18 to i6, !bitwidth !408
  %tmp_6 = call i12 @_ssdm_op_BitConcatenate.i12.i6.i6(i6 %empty_46, i6 0), !bitwidth !115
  br label %for.inc136, !bitwidth !11

for.inc136:                                       ; preds = %for.inc136.split, %update_weights_loop7_1.split
  %j_3 = phi i7 [ %add_ln280, %for.inc136.split ], [ 0, %update_weights_loop7_1.split ], !bitwidth !227
  %icmp_ln280 = icmp eq i7 %j_3, -64, !bitwidth !198
  %add_ln280 = add nuw i7 %j_3, 1, !bitwidth !227
  br i1 %icmp_ln280, label %for.inc139, label %for.inc136.split, !llvm.loop !494, !bitwidth !11

for.inc136.split:                                 ; preds = %for.inc136
  %zext_ln280 = zext i7 %j_3 to i12, !bitwidth !426
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([23 x i8]* @empty_41)
  %add_ln282 = add nuw i12 %zext_ln280, %tmp_6, !bitwidth !115
  %zext_ln282 = zext i12 %add_ln282 to i64, !bitwidth !248
  %weights2_addr_1 = getelementptr [4096 x i64], [4096 x i64]* %weights2, i64 0, i64 %zext_ln282, !bitwidth !7
  %weights2_load_1 = load i64, i64* %weights2_addr_1, align 8, !bitwidth !20, !dep_idx !507, !deps !508
  %bitcast_ln282 = bitcast i64 %weights2_load_1 to double, !bitwidth !20
  %div3 = fdiv double %bitcast_ln282, %norm_4, !bitwidth !20
  %bitcast_ln282_1 = bitcast double %div3 to i64, !bitwidth !20
  store i64 %bitcast_ln282_1, i64* %weights2_addr_1, align 8, !bitwidth !11, !dep_idx !511, !deps !512
  br label %for.inc136, !llvm.loop !494, !bitwidth !11

for.inc139:                                       ; preds = %for.inc136
  store i7 %add_ln277, i7* %i_6, align 1, !bitwidth !11, !dep_idx !516, !deps !517
  br label %update_weights_loop7_1, !llvm.loop !487, !bitwidth !11

update_weights_loop8:                             ; preds = %update_weights_loop7_1
  %i_7 = alloca i7, align 1, !bitwidth !216
  %bias_norm_4_load_1 = load double, double* %bias_norm_4, align 8, !bitwidth !20, !dep_idx !520, !deps !521
  %bias_norm_3 = call double @llvm.sqrt.f64(double %bias_norm_4_load_1), !bitwidth !20
  store i7 0, i7* %i_7, align 1, !bitwidth !11, !dep_idx !523, !deps !524
  br label %for.inc150, !bitwidth !11

for.inc150:                                       ; preds = %for.inc150.split, %update_weights_loop8
  %i_19 = load i7, i7* %i_7, align 1, !bitwidth !227, !dep_idx !527, !deps !528
  %icmp_ln286 = icmp eq i7 %i_19, -64, !bitwidth !198
  %add_ln286 = add nuw i7 %i_19, 1, !bitwidth !227
  br i1 %icmp_ln286, label %update_weights_loop9_1.preheader, label %for.inc150.split, !llvm.loop !531, !bitwidth !11

update_weights_loop9_1.preheader:                 ; preds = %for.inc150
  %i_8 = alloca i7, align 1, !bitwidth !216
  %norm_6 = alloca double, align 8, !bitwidth !11
  store double 0.000000e+00, double* %norm_6, align 8, !bitwidth !11, !dep_idx !538, !deps !539
  store i7 0, i7* %i_8, align 1, !bitwidth !11, !dep_idx !543, !deps !544
  br label %update_weights_loop9_1, !bitwidth !11

for.inc150.split:                                 ; preds = %for.inc150
  %zext_ln286 = zext i7 %i_19 to i64, !bitwidth !248
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_29)
  %biases2_addr_1 = getelementptr [64 x i64], [64 x i64]* %biases2, i64 0, i64 %zext_ln286, !bitwidth !7
  %biases2_load_1 = load i64, i64* %biases2_addr_1, align 8, !bitwidth !20, !dep_idx !547, !deps !548
  %bitcast_ln288 = bitcast i64 %biases2_load_1 to double, !bitwidth !20
  %div2 = fdiv double %bitcast_ln288, %bias_norm_3, !bitwidth !20
  %bitcast_ln288_1 = bitcast double %div2 to i64, !bitwidth !20
  store i64 %bitcast_ln288_1, i64* %biases2_addr_1, align 8, !bitwidth !11, !dep_idx !551, !deps !552
  store i7 %add_ln286, i7* %i_7, align 1, !bitwidth !11, !dep_idx !556, !deps !557
  br label %for.inc150, !llvm.loop !531, !bitwidth !11

update_weights_loop9_1:                           ; preds = %for.inc182, %update_weights_loop9_1.preheader
  %i_20 = load i7, i7* %i_8, align 1, !bitwidth !227, !dep_idx !560, !deps !561
  %icmp_ln295 = icmp eq i7 %i_20, -64, !bitwidth !198
  %add_ln295 = add nuw i7 %i_20, 1, !bitwidth !227
  br i1 %icmp_ln295, label %for.inc200.preheader, label %update_weights_loop9_1.split, !llvm.loop !564, !bitwidth !11

for.inc200.preheader:                             ; preds = %update_weights_loop9_1
  %bias_norm_7 = alloca double, align 8, !bitwidth !11
  %i_9 = alloca i2, align 1, !bitwidth !571
  store i2 0, i2* %i_9, align 1, !bitwidth !11, !dep_idx !572, !deps !573
  store double 0.000000e+00, double* %bias_norm_7, align 8, !bitwidth !11, !dep_idx !576, !deps !577
  br label %for.inc200, !bitwidth !11

update_weights_loop9_1.split:                     ; preds = %update_weights_loop9_1
  %zext_ln295 = zext i7 %i_20 to i8, !bitwidth !581
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_28)
  %empty_47 = trunc i7 %i_20 to i6, !bitwidth !408
  %p_shl = call i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6 %empty_47, i2 0), !bitwidth !582
  %empty_48 = sub i8 %p_shl, %zext_ln295, !bitwidth !582
  br label %for.inc179, !bitwidth !11

for.inc179:                                       ; preds = %for.inc179.split, %update_weights_loop9_1.split
  %j_4 = phi i2 [ %add_ln298, %for.inc179.split ], [ 0, %update_weights_loop9_1.split ], !bitwidth !583
  %icmp_ln298 = icmp eq i2 %j_4, -1, !bitwidth !198
  %add_ln298 = add nuw i2 %j_4, 1, !bitwidth !583
  br i1 %icmp_ln298, label %for.inc182, label %for.inc179.split, !llvm.loop !584, !bitwidth !11

for.inc179.split:                                 ; preds = %for.inc179
  %norm_6_load_1 = load double, double* %norm_6, align 8, !bitwidth !20, !dep_idx !597, !deps !598
  %zext_ln298 = zext i2 %j_4 to i8, !bitwidth !581
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([23 x i8]* @empty_27)
  %add_ln300 = add i8 %zext_ln298, %empty_48, !bitwidth !582
  %zext_ln300 = zext i8 %add_ln300 to i64, !bitwidth !248
  %d_weights3_addr = getelementptr inbounds [192 x double], [192 x double]* %d_weights3, i64 0, i64 %zext_ln300, !bitwidth !11
  %d_weights3_load = load double, double* %d_weights3_addr, align 8, !bitwidth !20
  %mul10 = fmul double %d_weights3_load, 1.000000e-02, !bitwidth !20
  %weights3_addr = getelementptr [192 x i64], [192 x i64]* %weights3, i64 0, i64 %zext_ln300, !bitwidth !7
  %weights3_load = load i64, i64* %weights3_addr, align 8, !bitwidth !20, !dep_idx !601, !deps !602
  %bitcast_ln300 = bitcast i64 %weights3_load to double, !bitwidth !20
  %sub5 = fsub double %bitcast_ln300, %mul10, !bitwidth !20
  %bitcast_ln300_1 = bitcast double %sub5 to i64, !bitwidth !20
  store i64 %bitcast_ln300_1, i64* %weights3_addr, align 8, !bitwidth !11, !dep_idx !605, !deps !606
  %mul11 = fmul double %sub5, %sub5, !bitwidth !20
  %norm_8 = fadd double %norm_6_load_1, %mul11, !bitwidth !20
  store double %norm_8, double* %norm_6, align 8, !bitwidth !11, !dep_idx !610, !deps !611
  br label %for.inc179, !llvm.loop !584, !bitwidth !11

for.inc182:                                       ; preds = %for.inc179
  store i7 %add_ln295, i7* %i_8, align 1, !bitwidth !11, !dep_idx !614, !deps !615
  br label %update_weights_loop9_1, !llvm.loop !564, !bitwidth !11

for.inc200:                                       ; preds = %for.inc200.split, %for.inc200.preheader
  %i_21 = load i2, i2* %i_9, align 1, !bitwidth !583, !dep_idx !618, !deps !619
  %icmp_ln305 = icmp eq i2 %i_21, -1, !bitwidth !198
  %add_ln305 = add nuw i2 %i_21, 1, !bitwidth !583
  br i1 %icmp_ln305, label %for.end202, label %for.inc200.split, !llvm.loop !622, !bitwidth !11

for.inc200.split:                                 ; preds = %for.inc200
  %bias_norm_7_load = load double, double* %bias_norm_7, align 8, !bitwidth !20, !dep_idx !629, !deps !630
  %zext_ln305 = zext i2 %i_21 to i64, !bitwidth !248
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([22 x i8]* @empty_26)
  %tmp = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %p_read_3, double %p_read_2, double %p_read_1, i2 %i_21), !bitwidth !20
  %mul8 = fmul double %tmp, 1.000000e-02, !bitwidth !20
  %biases3_addr = getelementptr [3 x i64], [3 x i64]* %biases3, i64 0, i64 %zext_ln305, !bitwidth !7
  %biases3_load = load i64, i64* %biases3_addr, align 8, !bitwidth !20, !dep_idx !633, !deps !634
  %bitcast_ln307 = bitcast i64 %biases3_load to double, !bitwidth !20
  %sub4 = fsub double %bitcast_ln307, %mul8, !bitwidth !20
  %bitcast_ln307_1 = bitcast double %sub4 to i64, !bitwidth !20
  store i64 %bitcast_ln307_1, i64* %biases3_addr, align 8, !bitwidth !11, !dep_idx !637, !deps !638
  %mul9 = fmul double %sub4, %sub4, !bitwidth !20
  %bias_norm_8 = fadd double %bias_norm_7_load, %mul9, !bitwidth !20
  store i2 %add_ln305, i2* %i_9, align 1, !bitwidth !11, !dep_idx !642, !deps !643
  store double %bias_norm_8, double* %bias_norm_7, align 8, !bitwidth !11, !dep_idx !646, !deps !647
  br label %for.inc200, !llvm.loop !622, !bitwidth !11

for.end202:                                       ; preds = %for.inc200
  %i_10 = alloca i7, align 1, !bitwidth !216
  %norm_6_load = load double, double* %norm_6, align 8, !bitwidth !20, !dep_idx !650, !deps !651
  %norm_7 = call double @llvm.sqrt.f64(double %norm_6_load), !bitwidth !20
  store i7 0, i7* %i_10, align 1, !bitwidth !11, !dep_idx !653, !deps !654
  br label %update_weights_loop11_1, !bitwidth !11

update_weights_loop11_1:                          ; preds = %for.inc221, %for.end202
  %i_22 = load i7, i7* %i_10, align 1, !bitwidth !227, !dep_idx !657, !deps !658
  %icmp_ln315 = icmp eq i7 %i_22, -64, !bitwidth !198
  %add_ln315 = add nuw i7 %i_22, 1, !bitwidth !227
  br i1 %icmp_ln315, label %update_weights_loop12, label %update_weights_loop11_1.split, !llvm.loop !661, !bitwidth !11

update_weights_loop11_1.split:                    ; preds = %update_weights_loop11_1
  %zext_ln315 = zext i7 %i_22 to i8, !bitwidth !581
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([22 x i8]* @empty_25)
  %empty_49 = trunc i7 %i_22 to i6, !bitwidth !408
  %p_shl1 = call i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6 %empty_49, i2 0), !bitwidth !582
  %empty_50 = sub i8 %p_shl1, %zext_ln315, !bitwidth !582
  br label %for.inc218, !bitwidth !11

for.inc218:                                       ; preds = %for.inc218.split, %update_weights_loop11_1.split
  %j_5 = phi i2 [ %add_ln318, %for.inc218.split ], [ 0, %update_weights_loop11_1.split ], !bitwidth !583
  %icmp_ln318 = icmp eq i2 %j_5, -1, !bitwidth !198
  %add_ln318 = add nuw i2 %j_5, 1, !bitwidth !583
  br i1 %icmp_ln318, label %for.inc221, label %for.inc218.split, !llvm.loop !668, !bitwidth !11

for.inc218.split:                                 ; preds = %for.inc218
  %zext_ln318 = zext i2 %j_5 to i8, !bitwidth !581
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([24 x i8]* @empty_24)
  %add_ln320 = add i8 %zext_ln318, %empty_50, !bitwidth !582
  %zext_ln320 = zext i8 %add_ln320 to i64, !bitwidth !248
  %weights3_addr_1 = getelementptr [192 x i64], [192 x i64]* %weights3, i64 0, i64 %zext_ln320, !bitwidth !7
  %weights3_load_1 = load i64, i64* %weights3_addr_1, align 8, !bitwidth !20, !dep_idx !681, !deps !682
  %bitcast_ln320 = bitcast i64 %weights3_load_1 to double, !bitwidth !20
  %div5 = fdiv double %bitcast_ln320, %norm_7, !bitwidth !20
  %bitcast_ln320_1 = bitcast double %div5 to i64, !bitwidth !20
  store i64 %bitcast_ln320_1, i64* %weights3_addr_1, align 8, !bitwidth !11, !dep_idx !685, !deps !686
  br label %for.inc218, !llvm.loop !668, !bitwidth !11

for.inc221:                                       ; preds = %for.inc218
  store i7 %add_ln315, i7* %i_10, align 1, !bitwidth !11, !dep_idx !690, !deps !691
  br label %update_weights_loop11_1, !llvm.loop !661, !bitwidth !11

update_weights_loop12:                            ; preds = %update_weights_loop11_1
  %i_11 = alloca i2, align 1, !bitwidth !571
  %bias_norm_7_load_1 = load double, double* %bias_norm_7, align 8, !bitwidth !20, !dep_idx !694, !deps !695
  %bias_norm_6 = call double @llvm.sqrt.f64(double %bias_norm_7_load_1), !bitwidth !20
  store i2 0, i2* %i_11, align 1, !bitwidth !11, !dep_idx !697, !deps !698
  br label %for.inc232, !bitwidth !11

for.inc232:                                       ; preds = %for.inc232.split, %update_weights_loop12
  %i_23 = load i2, i2* %i_11, align 1, !bitwidth !583, !dep_idx !701, !deps !702
  %icmp_ln324 = icmp eq i2 %i_23, -1, !bitwidth !198
  %add_ln324 = add nuw i2 %i_23, 1, !bitwidth !583
  br i1 %icmp_ln324, label %for.end234, label %for.inc232.split, !llvm.loop !705, !bitwidth !11

for.inc232.split:                                 ; preds = %for.inc232
  %zext_ln324 = zext i2 %i_23 to i64, !bitwidth !248
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([22 x i8]* @empty_23)
  %biases3_addr_1 = getelementptr [3 x i64], [3 x i64]* %biases3, i64 0, i64 %zext_ln324, !bitwidth !7
  %biases3_load_1 = load i64, i64* %biases3_addr_1, align 8, !bitwidth !20, !dep_idx !712, !deps !713
  %bitcast_ln326 = bitcast i64 %biases3_load_1 to double, !bitwidth !20
  %div4 = fdiv double %bitcast_ln326, %bias_norm_6, !bitwidth !20
  %bitcast_ln326_1 = bitcast double %div4 to i64, !bitwidth !20
  store i64 %bitcast_ln326_1, i64* %biases3_addr_1, align 8, !bitwidth !11, !dep_idx !716, !deps !717
  store i2 %add_ln324, i2* %i_11, align 1, !bitwidth !11, !dep_idx !721, !deps !722
  br label %for.inc232, !llvm.loop !705, !bitwidth !11

for.end234:                                       ; preds = %for.inc232
  ret void, !bitwidth !11
}

; Function Attrs: noinline readonly
define internal fastcc { double, double, double } @take_difference.1(double %p_read, double %p_read1, double %p_read2, [489 x i64]* noalias nocapture %training_targets, double %p_read3, double %p_read14, double %p_read25, double %p_read6, double %p_read7, double %p_read8, i9 %idx) #1 {
entry:
  %i = alloca i2, align 1, !bitwidth !571
  %output_difference4_03 = alloca double, align 8, !bitwidth !11
  %write_flag_0 = alloca i1, align 1, !bitwidth !725
  %write_flag6_0 = alloca i1, align 1, !bitwidth !725
  %output_difference3_04 = alloca double, align 8, !bitwidth !11
  %output_difference_05 = alloca double, align 8, !bitwidth !11
  %write_flag3_0 = alloca i1, align 1, !bitwidth !725
  call void (...) @_ssdm_op_SpecInterface([489 x i64]* %training_targets, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !179
  %idx_read = call i9 @_ssdm_op_Read.ap_auto.i9(i9 %idx), !bitwidth !89
  %p_read_4 = call double @_ssdm_op_Read.ap_auto.double(double %p_read8), !bitwidth !20
  %p_read_5 = call double @_ssdm_op_Read.ap_auto.double(double %p_read7), !bitwidth !20
  %p_read_6 = call double @_ssdm_op_Read.ap_auto.double(double %p_read6), !bitwidth !20
  %p_read_7 = call double @_ssdm_op_Read.ap_auto.double(double %p_read25), !bitwidth !20
  %p_read_8 = call double @_ssdm_op_Read.ap_auto.double(double %p_read14), !bitwidth !20
  %p_read37 = call double @_ssdm_op_Read.ap_auto.double(double %p_read3), !bitwidth !20
  %p_read26 = call double @_ssdm_op_Read.ap_auto.double(double %p_read2), !bitwidth !20
  %p_read15 = call double @_ssdm_op_Read.ap_auto.double(double %p_read1), !bitwidth !20
  %p_read_9 = call double @_ssdm_op_Read.ap_auto.double(double %p_read), !bitwidth !20
  store i1 false, i1* %write_flag3_0, align 1, !bitwidth !11, !dep_idx !726, !deps !727
  store i1 false, i1* %write_flag6_0, align 1, !bitwidth !11, !dep_idx !730, !deps !731
  store i1 false, i1* %write_flag_0, align 1, !bitwidth !11, !dep_idx !734, !deps !735
  store i2 0, i2* %i, align 1, !bitwidth !11, !dep_idx !738, !deps !739
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split13, %entry
  %i_24 = load i2, i2* %i, align 1, !bitwidth !583, !dep_idx !742, !deps !743
  %icmp_ln114 = icmp eq i2 %i_24, -1, !bitwidth !198
  %add_ln114 = add nuw i2 %i_24, 1, !bitwidth !583
  br i1 %icmp_ln114, label %for.end, label %for.inc.split, !llvm.loop !746, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln114 = zext i2 %i_24 to i9, !bitwidth !757
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([22 x i8]* @empty_15)
  %tmp = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %p_read_9, double %p_read15, double %p_read26, i2 %i_24), !bitwidth !20
  %add_ln116 = add i9 %zext_ln114, %idx_read, !bitwidth !89
  %zext_ln116 = zext i9 %add_ln116 to i64, !bitwidth !248
  %training_targets_addr = getelementptr [489 x i64], [489 x i64]* %training_targets, i64 0, i64 %zext_ln116, !bitwidth !7
  %training_targets_load = load i64, i64* %training_targets_addr, align 8, !bitwidth !20
  %bitcast_ln116 = bitcast i64 %training_targets_load to double, !bitwidth !20
  %sub = fsub double %tmp, %bitcast_ln116, !bitwidth !20
  %bitcast_ln116_1 = bitcast double %sub to i64, !bitwidth !20
  %xor_ln116 = xor i64 %bitcast_ln116_1, -9223372036854775808, !bitwidth !20
  %bitcast_ln116_2 = bitcast i64 %xor_ln116 to double, !bitwidth !20
  %tmp_1 = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %p_read_6, double %p_read_5, double %p_read_4, i2 %i_24), !bitwidth !20
  %output_difference = fmul double %bitcast_ln116_2, %tmp_1, !bitwidth !20
  switch i2 %i_24, label %branch2 [
    i2 0, label %for.inc.split.for.inc.split13_crit_edge
    i2 1, label %branch1
  ], !bitwidth !758

for.inc.split.for.inc.split13_crit_edge:          ; preds = %for.inc.split
  store double %output_difference, double* %output_difference_05, align 8, !bitwidth !11, !dep_idx !759, !deps !760
  store i1 true, i1* %write_flag_0, align 1, !bitwidth !11, !dep_idx !762, !deps !763
  br label %for.inc.split13, !bitwidth !11

for.inc.split13:                                  ; preds = %branch2, %branch1, %for.inc.split.for.inc.split13_crit_edge
  store i2 %add_ln114, i2* %i, align 1, !bitwidth !11, !dep_idx !765, !deps !766
  br label %for.inc, !llvm.loop !746, !bitwidth !11

for.end:                                          ; preds = %for.inc
  %output_difference4_03_load = load double, double* %output_difference4_03, align 8, !bitwidth !20, !dep_idx !769, !deps !770
  %write_flag_0_load = load i1, i1* %write_flag_0, align 1, !bitwidth !198, !dep_idx !772, !deps !773
  %write_flag6_0_load = load i1, i1* %write_flag6_0, align 1, !bitwidth !198, !dep_idx !776, !deps !777
  %output_difference3_04_load = load double, double* %output_difference3_04, align 8, !bitwidth !20, !dep_idx !780, !deps !781
  %output_difference_05_load = load double, double* %output_difference_05, align 8, !bitwidth !20, !dep_idx !783, !deps !784
  %write_flag3_0_load = load i1, i1* %write_flag3_0, align 1, !bitwidth !198, !dep_idx !786, !deps !787
  %select_ln118 = select i1 %write_flag_0_load, double %output_difference_05_load, double %p_read37, !bitwidth !20
  %select_ln118_1 = select i1 %write_flag3_0_load, double %output_difference3_04_load, double %p_read_8, !bitwidth !20
  %select_ln118_2 = select i1 %write_flag6_0_load, double %output_difference4_03_load, double %p_read_7, !bitwidth !20
  %mrv = insertvalue { double, double, double } undef, double %select_ln118, 0, !bitwidth !11
  %mrv_1 = insertvalue { double, double, double } %mrv, double %select_ln118_1, 1, !bitwidth !11
  %mrv_2 = insertvalue { double, double, double } %mrv_1, double %select_ln118_2, 2, !bitwidth !11
  ret { double, double, double } %mrv_2, !bitwidth !11

branch1:                                          ; preds = %for.inc.split
  store i1 true, i1* %write_flag3_0, align 1, !bitwidth !11, !dep_idx !790, !deps !791
  store double %output_difference, double* %output_difference3_04, align 8, !bitwidth !11, !dep_idx !793, !deps !794
  br label %for.inc.split13, !bitwidth !11

branch2:                                          ; preds = %for.inc.split
  store i1 true, i1* %write_flag6_0, align 1, !bitwidth !11, !dep_idx !796, !deps !797
  store double %output_difference, double* %output_difference4_03, align 8, !bitwidth !11, !dep_idx !799, !deps !800
  br label %for.inc.split13, !bitwidth !11
}

; Function Attrs: noinline readonly
define internal fastcc { double, double, double } @soft_max(double %p_read, double %p_read1, double %p_read2, double %p_read3, double %p_read4, double %p_read5) #1 {
entry:
  %sum = alloca double, align 8, !bitwidth !11
  %i = alloca i2, align 1, !bitwidth !571
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !179
  %p_read_10 = call double @_ssdm_op_Read.ap_auto.double(double %p_read5), !bitwidth !20
  %p_read410 = call double @_ssdm_op_Read.ap_auto.double(double %p_read4), !bitwidth !20
  %p_read39 = call double @_ssdm_op_Read.ap_auto.double(double %p_read3), !bitwidth !20
  %p_read28 = call double @_ssdm_op_Read.ap_auto.double(double %p_read2), !bitwidth !20
  %p_read17 = call double @_ssdm_op_Read.ap_auto.double(double %p_read1), !bitwidth !20
  %p_read_11 = call double @_ssdm_op_Read.ap_auto.double(double %p_read), !bitwidth !20
  store i2 0, i2* %i, align 1, !bitwidth !11, !dep_idx !802, !deps !803
  store double 0.000000e+00, double* %sum, align 8, !bitwidth !11, !dep_idx !806, !deps !807
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %entry
  %i_25 = load i2, i2* %i, align 1, !bitwidth !583, !dep_idx !811, !deps !812
  %icmp_ln22 = icmp eq i2 %i_25, -1, !bitwidth !198
  %add_ln22 = add nuw i2 %i_25, 1, !bitwidth !583
  br i1 %icmp_ln22, label %for.inc9.preheader, label %for.inc.split, !llvm.loop !815, !bitwidth !11

for.inc9.preheader:                               ; preds = %for.inc
  %i_12 = alloca i2, align 1, !bitwidth !571
  %net_outputs2_03 = alloca double, align 8, !bitwidth !11
  %write_flag_0 = alloca i1, align 1, !bitwidth !725
  %write_flag8_0 = alloca i1, align 1, !bitwidth !725
  %net_outputs16_04 = alloca double, align 8, !bitwidth !11
  %net_outputs_05 = alloca double, align 8, !bitwidth !11
  %write_flag4_0 = alloca i1, align 1, !bitwidth !725
  store i1 false, i1* %write_flag4_0, align 1, !bitwidth !11, !dep_idx !826, !deps !827
  store i1 false, i1* %write_flag8_0, align 1, !bitwidth !11, !dep_idx !830, !deps !831
  store i1 false, i1* %write_flag_0, align 1, !bitwidth !11, !dep_idx !834, !deps !835
  store i2 0, i2* %i_12, align 1, !bitwidth !11, !dep_idx !838, !deps !839
  br label %for.inc9, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %sum_load = load double, double* %sum, align 8, !bitwidth !20, !dep_idx !842, !deps !843
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([15 x i8]* @empty_4)
  %tmp_2 = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %p_read39, double %p_read410, double %p_read_10, i2 %i_25), !bitwidth !20
  %bitcast_ln24 = bitcast double %tmp_2 to i64, !bitwidth !20
  %xor_ln24 = xor i64 %bitcast_ln24, -9223372036854775808, !bitwidth !20
  %bitcast_ln24_1 = bitcast i64 %xor_ln24 to double, !bitwidth !20
  %tmp = call double @llvm.exp.f64(double %bitcast_ln24_1), !bitwidth !20
  %sum_1 = fadd double %sum_load, %tmp, !bitwidth !20
  store i2 %add_ln22, i2* %i, align 1, !bitwidth !11, !dep_idx !846, !deps !847
  store double %sum_1, double* %sum, align 8, !bitwidth !11, !dep_idx !850, !deps !851
  br label %for.inc, !llvm.loop !815, !bitwidth !11

for.inc9:                                         ; preds = %for.inc9.split7, %for.inc9.preheader
  %i_26 = load i2, i2* %i_12, align 1, !bitwidth !583, !dep_idx !854, !deps !855
  %icmp_ln27 = icmp eq i2 %i_26, -1, !bitwidth !198
  %add_ln27 = add nuw i2 %i_26, 1, !bitwidth !583
  br i1 %icmp_ln27, label %for.end11, label %for.inc9.split, !llvm.loop !858, !bitwidth !11

for.inc9.split:                                   ; preds = %for.inc9
  %sum_load_1 = load double, double* %sum, align 8, !bitwidth !20, !dep_idx !865, !deps !866
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([15 x i8]* @empty_3)
  %tmp_3 = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %p_read39, double %p_read410, double %p_read_10, i2 %i_26), !bitwidth !20
  %bitcast_ln29 = bitcast double %tmp_3 to i64, !bitwidth !20
  %xor_ln29 = xor i64 %bitcast_ln29, -9223372036854775808, !bitwidth !20
  %bitcast_ln29_1 = bitcast i64 %xor_ln29 to double, !bitwidth !20
  %tmp_1 = call double @llvm.exp.f64(double %bitcast_ln29_1), !bitwidth !20
  %net_outputs = fdiv double %tmp_1, %sum_load_1, !bitwidth !20
  switch i2 %i_26, label %branch2 [
    i2 0, label %for.inc9.split.for.inc9.split7_crit_edge
    i2 1, label %branch1
  ], !bitwidth !758

for.inc9.split.for.inc9.split7_crit_edge:         ; preds = %for.inc9.split
  store double %net_outputs, double* %net_outputs_05, align 8, !bitwidth !11, !dep_idx !868, !deps !869
  store i1 true, i1* %write_flag_0, align 1, !bitwidth !11, !dep_idx !871, !deps !872
  br label %for.inc9.split7, !bitwidth !11

for.inc9.split7:                                  ; preds = %branch2, %branch1, %for.inc9.split.for.inc9.split7_crit_edge
  store i2 %add_ln27, i2* %i_12, align 1, !bitwidth !11, !dep_idx !874, !deps !875
  br label %for.inc9, !llvm.loop !858, !bitwidth !11

for.end11:                                        ; preds = %for.inc9
  %net_outputs2_03_load = load double, double* %net_outputs2_03, align 8, !bitwidth !20, !dep_idx !878, !deps !879
  %write_flag_0_load = load i1, i1* %write_flag_0, align 1, !bitwidth !198, !dep_idx !881, !deps !882
  %write_flag8_0_load = load i1, i1* %write_flag8_0, align 1, !bitwidth !198, !dep_idx !885, !deps !886
  %net_outputs16_04_load = load double, double* %net_outputs16_04, align 8, !bitwidth !20, !dep_idx !889, !deps !890
  %net_outputs_05_load = load double, double* %net_outputs_05, align 8, !bitwidth !20, !dep_idx !892, !deps !893
  %write_flag4_0_load = load i1, i1* %write_flag4_0, align 1, !bitwidth !198, !dep_idx !895, !deps !896
  %select_ln31 = select i1 %write_flag_0_load, double %net_outputs_05_load, double %p_read_11, !bitwidth !20
  %select_ln31_1 = select i1 %write_flag4_0_load, double %net_outputs16_04_load, double %p_read17, !bitwidth !20
  %select_ln31_2 = select i1 %write_flag8_0_load, double %net_outputs2_03_load, double %p_read28, !bitwidth !20
  %mrv = insertvalue { double, double, double } undef, double %select_ln31, 0, !bitwidth !11
  %mrv_1 = insertvalue { double, double, double } %mrv, double %select_ln31_1, 1, !bitwidth !11
  %mrv_2 = insertvalue { double, double, double } %mrv_1, double %select_ln31_2, 2, !bitwidth !11
  ret { double, double, double } %mrv_2, !bitwidth !11

branch1:                                          ; preds = %for.inc9.split
  store i1 true, i1* %write_flag4_0, align 1, !bitwidth !11, !dep_idx !899, !deps !900
  store double %net_outputs, double* %net_outputs16_04, align 8, !bitwidth !11, !dep_idx !902, !deps !903
  br label %for.inc9.split7, !bitwidth !11

branch2:                                          ; preds = %for.inc9.split
  store i1 true, i1* %write_flag8_0, align 1, !bitwidth !11, !dep_idx !905, !deps !906
  store double %net_outputs, double* %net_outputs2_03, align 8, !bitwidth !11, !dep_idx !908, !deps !909
  br label %for.inc9.split7, !bitwidth !11
}

; Function Attrs: noinline nounwind
define internal fastcc void @matrix_vector_product_with_bias_second_layer.1([64 x i64]* noalias nocapture %biases2, [4096 x i64]* noalias nocapture %weights2, [64 x double]* noalias nocapture align 512 %activations, [64 x double]* noalias nocapture align 512 %input_activations) unnamed_addr #2 {
entry:
  %i = alloca i7, align 1, !bitwidth !216
  call void (...) @_ssdm_op_SpecInterface([64 x i64]* %biases2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([4096 x i64]* %weights2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !179
  store i7 0, i7* %i, align 1, !bitwidth !11, !dep_idx !911, !deps !912
  br label %matrix_vector_product_with_bias_second_layer_loop1_1, !bitwidth !11

matrix_vector_product_with_bias_second_layer_loop1_1: ; preds = %for.inc12, %entry
  %i_27 = load i7, i7* %i, align 1, !bitwidth !227, !dep_idx !915, !deps !916
  %icmp_ln78 = icmp eq i7 %i_27, -64, !bitwidth !198
  %add_ln78 = add nuw i7 %i_27, 1, !bitwidth !227
  br i1 %icmp_ln78, label %for.end14, label %matrix_vector_product_with_bias_second_layer_loop1_1.split, !llvm.loop !919, !bitwidth !11

matrix_vector_product_with_bias_second_layer_loop1_1.split: ; preds = %matrix_vector_product_with_bias_second_layer_loop1_1
  %zext_ln78 = zext i7 %i_27 to i64, !bitwidth !248
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([51 x i8]* @empty_12)
  %activations_addr = getelementptr inbounds [64 x double], [64 x double]* %activations, i64 0, i64 %zext_ln78, !bitwidth !11
  %empty = trunc i7 %i_27 to i6, !bitwidth !408
  %tmp_9 = call i12 @_ssdm_op_BitConcatenate.i12.i6.i6(i6 %empty, i6 0), !bitwidth !115
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %matrix_vector_product_with_bias_second_layer_loop1_1.split
  %j = phi i7 [ %add_ln82, %for.inc.split ], [ 0, %matrix_vector_product_with_bias_second_layer_loop1_1.split ], !bitwidth !227
  %add113 = phi double [ %add, %for.inc.split ], [ 0.000000e+00, %matrix_vector_product_with_bias_second_layer_loop1_1.split ], !bitwidth !20
  %icmp_ln82 = icmp eq i7 %j, -64, !bitwidth !198
  %add_ln82 = add nuw i7 %j, 1, !bitwidth !227
  br i1 %icmp_ln82, label %for.inc12, label %for.inc.split, !llvm.loop !928, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln82 = zext i7 %j to i64, !bitwidth !248
  %zext_ln82_1 = zext i7 %j to i12, !bitwidth !426
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([53 x i8]* @empty_11)
  %add_ln84 = add nuw i12 %zext_ln82_1, %tmp_9, !bitwidth !115
  %zext_ln84 = zext i12 %add_ln84 to i64, !bitwidth !248
  %weights2_addr = getelementptr [4096 x i64], [4096 x i64]* %weights2, i64 0, i64 %zext_ln84, !bitwidth !7
  %weights2_load = load i64, i64* %weights2_addr, align 8, !bitwidth !20
  %bitcast_ln84 = bitcast i64 %weights2_load to double, !bitwidth !20
  %input_activations_addr = getelementptr inbounds [64 x double], [64 x double]* %input_activations, i64 0, i64 %zext_ln82, !bitwidth !11
  %input_activations_load = load double, double* %input_activations_addr, align 8, !bitwidth !20
  %mul8 = fmul double %bitcast_ln84, %input_activations_load, !bitwidth !20
  %add = fadd double %add113, %mul8, !bitwidth !20
  br label %for.inc, !llvm.loop !928, !bitwidth !11

for.inc12:                                        ; preds = %for.inc
  store double %add113, double* %activations_addr, align 8, !bitwidth !11, !dep_idx !941, !deps !942
  store i7 %add_ln78, i7* %i, align 1, !bitwidth !11, !dep_idx !945, !deps !946
  br label %matrix_vector_product_with_bias_second_layer_loop1_1, !llvm.loop !919, !bitwidth !11

for.end14:                                        ; preds = %matrix_vector_product_with_bias_second_layer_loop1_1
  call fastcc void @add_bias_to_activations.clone.1([64 x i64]* %biases2, [64 x double]* %activations), !bitwidth !11, !dep_idx !949, !deps !950
  ret void, !bitwidth !11
}

; Function Attrs: noinline readonly
define internal fastcc { double, double, double } @matrix_vector_product_with_bias_output_layer.1([3 x i64]* noalias nocapture %biases3, [192 x i64]* noalias nocapture %weights3, double %p_read, double %p_read1, double %p_read2, [64 x double]* noalias nocapture align 512 %input_activations) #1 {
entry:
  %j = alloca i2, align 1, !bitwidth !571
  %activations2_0 = alloca double, align 8, !bitwidth !11
  %activations12_0 = alloca double, align 8, !bitwidth !11
  %activations_0 = alloca double, align 8, !bitwidth !11
  call void (...) @_ssdm_op_SpecInterface([3 x i64]* %biases3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([192 x i64]* %weights3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !179
  %p_read25 = call double @_ssdm_op_Read.ap_auto.double(double %p_read2), !bitwidth !20
  %p_read14 = call double @_ssdm_op_Read.ap_auto.double(double %p_read1), !bitwidth !20
  %p_read_12 = call double @_ssdm_op_Read.ap_auto.double(double %p_read), !bitwidth !20
  store double %p_read_12, double* %activations_0, align 8, !bitwidth !11, !dep_idx !952, !deps !953
  store double %p_read14, double* %activations12_0, align 8, !bitwidth !11, !dep_idx !956, !deps !957
  store double %p_read25, double* %activations2_0, align 8, !bitwidth !11, !dep_idx !960, !deps !961
  store i2 0, i2* %j, align 1, !bitwidth !11, !dep_idx !964, !deps !965
  br label %matrix_vector_product_with_bias_output_layer_loop1_1, !bitwidth !11

matrix_vector_product_with_bias_output_layer_loop1_1: ; preds = %for.inc125, %entry
  %j_6 = load i2, i2* %j, align 1, !bitwidth !583, !dep_idx !968, !deps !969
  %icmp_ln96 = icmp eq i2 %j_6, -1, !bitwidth !198
  %add_ln96 = add nuw i2 %j_6, 1, !bitwidth !583
  br i1 %icmp_ln96, label %for.end14, label %matrix_vector_product_with_bias_output_layer_loop1_1.split, !llvm.loop !972, !bitwidth !11

matrix_vector_product_with_bias_output_layer_loop1_1.split: ; preds = %matrix_vector_product_with_bias_output_layer_loop1_1
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([51 x i8]* @empty_14)
  %tmp = call i8 @_ssdm_op_BitConcatenate.i8.i2.i6(i2 %j_6, i6 0), !bitwidth !582
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %matrix_vector_product_with_bias_output_layer_loop1_1.split
  %i = phi i7 [ %add_ln100, %for.inc.split ], [ 0, %matrix_vector_product_with_bias_output_layer_loop1_1.split ], !bitwidth !227
  %add113 = phi double [ %add, %for.inc.split ], [ 0.000000e+00, %matrix_vector_product_with_bias_output_layer_loop1_1.split ], !bitwidth !20
  %icmp_ln100 = icmp eq i7 %i, -64, !bitwidth !198
  %add_ln100 = add nuw i7 %i, 1, !bitwidth !227
  br i1 %icmp_ln100, label %for.inc12, label %for.inc.split, !llvm.loop !981, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln100 = zext i7 %i to i64, !bitwidth !248
  %zext_ln100_1 = zext i7 %i to i8, !bitwidth !581
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([53 x i8]* @empty_13)
  %add_ln102 = add nuw i8 %zext_ln100_1, %tmp, !bitwidth !582
  %zext_ln102 = zext i8 %add_ln102 to i64, !bitwidth !248
  %weights3_addr = getelementptr [192 x i64], [192 x i64]* %weights3, i64 0, i64 %zext_ln102, !bitwidth !7
  %weights3_load = load i64, i64* %weights3_addr, align 8, !bitwidth !20
  %bitcast_ln102 = bitcast i64 %weights3_load to double, !bitwidth !20
  %input_activations_addr = getelementptr inbounds [64 x double], [64 x double]* %input_activations, i64 0, i64 %zext_ln100, !bitwidth !11
  %input_activations_load = load double, double* %input_activations_addr, align 8, !bitwidth !20
  %mul8 = fmul double %bitcast_ln102, %input_activations_load, !bitwidth !20
  %add = fadd double %add113, %mul8, !bitwidth !20
  br label %for.inc, !llvm.loop !981, !bitwidth !11

for.inc12:                                        ; preds = %for.inc
  switch i2 %j_6, label %branch2 [
    i2 0, label %for.inc12.for.inc125_crit_edge
    i2 1, label %branch1
  ], !bitwidth !758

for.inc12.for.inc125_crit_edge:                   ; preds = %for.inc12
  store double %add113, double* %activations_0, align 8, !bitwidth !11, !dep_idx !994, !deps !995
  br label %for.inc125, !bitwidth !11

for.inc125:                                       ; preds = %branch2, %branch1, %for.inc12.for.inc125_crit_edge
  store i2 %add_ln96, i2* %j, align 1, !bitwidth !11, !dep_idx !997, !deps !998
  br label %matrix_vector_product_with_bias_output_layer_loop1_1, !llvm.loop !972, !bitwidth !11

for.end14:                                        ; preds = %matrix_vector_product_with_bias_output_layer_loop1_1
  %activations2_0_load = load double, double* %activations2_0, align 8, !bitwidth !20, !dep_idx !1001, !deps !1002
  %activations12_0_load = load double, double* %activations12_0, align 8, !bitwidth !20, !dep_idx !1005, !deps !1006
  %activations_0_load = load double, double* %activations_0, align 8, !bitwidth !20, !dep_idx !1009, !deps !1010
  %call_ret = call fastcc { double, double, double } @add_bias_to_activations.1([3 x i64]* %biases3, double %activations_0_load, double %activations12_0_load, double %activations2_0_load), !bitwidth !11
  ret { double, double, double } %call_ret, !bitwidth !11

branch1:                                          ; preds = %for.inc12
  store double %add113, double* %activations12_0, align 8, !bitwidth !11, !dep_idx !1013, !deps !1014
  br label %for.inc125, !bitwidth !11

branch2:                                          ; preds = %for.inc12
  store double %add113, double* %activations2_0, align 8, !bitwidth !11, !dep_idx !1016, !deps !1017
  br label %for.inc125, !bitwidth !11
}

; Function Attrs: noinline nounwind
define internal fastcc void @matrix_vector_product_with_bias_input_layer.1([64 x i64]* noalias nocapture %biases1, [832 x i64]* noalias nocapture %weights1, [64 x double]* noalias nocapture align 512 %activations, [2119 x i64]* noalias nocapture %training_data, i12 %idx) #2 {
entry:
  %phi_mul = alloca i10, align 2, !bitwidth !1019
  %j = alloca i7, align 1, !bitwidth !216
  call void (...) @_ssdm_op_SpecInterface([2119 x i64]* %training_data, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([64 x i64]* %biases1, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([832 x i64]* %weights1, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !179
  %idx_read = call i12 @_ssdm_op_Read.ap_auto.i12(i12 %idx) #4, !bitwidth !115
  store i7 0, i7* %j, align 1, !bitwidth !11, !dep_idx !1020, !deps !1021
  store i10 0, i10* %phi_mul, align 2, !bitwidth !11, !dep_idx !1024, !deps !1025
  br label %matrix_vector_product_with_bias_input_layer_loop1_1, !bitwidth !11

matrix_vector_product_with_bias_input_layer_loop1_1: ; preds = %for.inc12, %entry
  %phi_mul_load = load i10, i10* %phi_mul, align 2, !bitwidth !226, !dep_idx !1028, !deps !1029
  %j_7 = load i7, i7* %j, align 1, !bitwidth !227, !dep_idx !1032, !deps !1033
  %add_ln60_1 = add i10 %phi_mul_load, 13, !bitwidth !226
  %icmp_ln60 = icmp eq i7 %j_7, -64, !bitwidth !198
  %add_ln60 = add nuw i7 %j_7, 1, !bitwidth !227
  br i1 %icmp_ln60, label %for.end14, label %matrix_vector_product_with_bias_input_layer_loop1_1.split, !llvm.loop !1036, !bitwidth !11

matrix_vector_product_with_bias_input_layer_loop1_1.split: ; preds = %matrix_vector_product_with_bias_input_layer_loop1_1
  %zext_ln60 = zext i7 %j_7 to i64, !bitwidth !248
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([50 x i8]* @empty)
  %activations_addr = getelementptr inbounds [64 x double], [64 x double]* %activations, i64 0, i64 %zext_ln60, !bitwidth !11
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %matrix_vector_product_with_bias_input_layer_loop1_1.split
  %i = phi i4 [ %add_ln64, %for.inc.split ], [ 0, %matrix_vector_product_with_bias_input_layer_loop1_1.split ], !bitwidth !191
  %add113 = phi double [ %add, %for.inc.split ], [ 0.000000e+00, %matrix_vector_product_with_bias_input_layer_loop1_1.split ], !bitwidth !20
  %icmp_ln64 = icmp eq i4 %i, -3, !bitwidth !198
  %add_ln64 = add nuw i4 %i, 1, !bitwidth !191
  br i1 %icmp_ln64, label %for.inc12, label %for.inc.split, !llvm.loop !1045, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln64 = zext i4 %i to i12, !bitwidth !426
  %zext_ln64_1 = zext i4 %i to i10, !bitwidth !247
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 13, i64 13, i64 13), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([52 x i8]* @empty_20)
  %add_ln66 = add nuw i10 %zext_ln64_1, %phi_mul_load, !bitwidth !226
  %zext_ln66 = zext i10 %add_ln66 to i64, !bitwidth !248
  %weights1_addr = getelementptr [832 x i64], [832 x i64]* %weights1, i64 0, i64 %zext_ln66, !bitwidth !7
  %weights1_load = load i64, i64* %weights1_addr, align 8, !bitwidth !20
  %bitcast_ln66 = bitcast i64 %weights1_load to double, !bitwidth !20
  %add_ln66_1 = add i12 %zext_ln64, %idx_read, !bitwidth !115
  %zext_ln66_1 = zext i12 %add_ln66_1 to i64, !bitwidth !248
  %training_data_addr = getelementptr [2119 x i64], [2119 x i64]* %training_data, i64 0, i64 %zext_ln66_1, !bitwidth !7
  %training_data_load = load i64, i64* %training_data_addr, align 8, !bitwidth !20
  %bitcast_ln66_1 = bitcast i64 %training_data_load to double, !bitwidth !20
  %mul8 = fmul double %bitcast_ln66, %bitcast_ln66_1, !bitwidth !20
  %add = fadd double %add113, %mul8, !bitwidth !20
  br label %for.inc, !llvm.loop !1045, !bitwidth !11

for.inc12:                                        ; preds = %for.inc
  store double %add113, double* %activations_addr, align 8, !bitwidth !11, !dep_idx !1058, !deps !1059
  store i7 %add_ln60, i7* %j, align 1, !bitwidth !11, !dep_idx !1061, !deps !1062
  store i10 %add_ln60_1, i10* %phi_mul, align 2, !bitwidth !11, !dep_idx !1065, !deps !1066
  br label %matrix_vector_product_with_bias_input_layer_loop1_1, !llvm.loop !1036, !bitwidth !11

for.end14:                                        ; preds = %matrix_vector_product_with_bias_input_layer_loop1_1
  call fastcc void @add_bias_to_activations.clone.1([64 x i64]* %biases1, [64 x double]* %activations), !bitwidth !11, !dep_idx !1069, !deps !1070
  ret void, !bitwidth !11
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.sqrt.f64(double) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.exp.f64(double) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, i64, metadata) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata) #3

; Function Attrs: noinline
define internal fastcc void @get_oracle_activations2.1([192 x i64]* noalias nocapture %weights3, double %p_read, double %p_read1, double %p_read2, [64 x double]* noalias nocapture align 512 %oracle_activations, [64 x double]* noalias nocapture align 512 %dactivations) #0 {
entry:
  %i = alloca i7, align 1, !bitwidth !216
  call void (...) @_ssdm_op_SpecInterface([192 x i64]* %weights3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !179
  %p_read28 = call double @_ssdm_op_Read.ap_auto.double(double %p_read2), !bitwidth !20
  %p_read17 = call double @_ssdm_op_Read.ap_auto.double(double %p_read1), !bitwidth !20
  %p_read_13 = call double @_ssdm_op_Read.ap_auto.double(double %p_read), !bitwidth !20
  store i7 0, i7* %i, align 1, !bitwidth !11, !dep_idx !1072, !deps !1073
  br label %get_oracle_activations2_loop1_1, !bitwidth !11

get_oracle_activations2_loop1_1:                  ; preds = %for.inc19, %entry
  %i_28 = load i7, i7* %i, align 1, !bitwidth !227, !dep_idx !1076, !deps !1077
  %icmp_ln141 = icmp eq i7 %i_28, -64, !bitwidth !198
  %add_ln141 = add nuw i7 %i_28, 1, !bitwidth !227
  br i1 %icmp_ln141, label %for.end21, label %get_oracle_activations2_loop1_1.split, !llvm.loop !1080, !bitwidth !11

get_oracle_activations2_loop1_1.split:            ; preds = %get_oracle_activations2_loop1_1
  %zext_ln141 = zext i7 %i_28 to i64, !bitwidth !248
  %zext_ln141_1 = zext i7 %i_28 to i8, !bitwidth !581
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([30 x i8]* @empty_17)
  %oracle_activations_addr = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations, i64 0, i64 %zext_ln141, !bitwidth !11
  %empty = trunc i7 %i_28 to i6, !bitwidth !408
  %p_shl = call i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6 %empty, i2 0), !bitwidth !582
  %empty_51 = sub i8 %p_shl, %zext_ln141_1, !bitwidth !582
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %get_oracle_activations2_loop1_1.split
  %j = phi i2 [ %add_ln145, %for.inc.split ], [ 0, %get_oracle_activations2_loop1_1.split ], !bitwidth !583
  %add113 = phi double [ %add, %for.inc.split ], [ 0.000000e+00, %get_oracle_activations2_loop1_1.split ], !bitwidth !20
  %icmp_ln145 = icmp eq i2 %j, -1, !bitwidth !198
  %add_ln145 = add nuw i2 %j, 1, !bitwidth !583
  br i1 %icmp_ln145, label %for.inc19, label %for.inc.split, !llvm.loop !1089, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln145 = zext i2 %j to i8, !bitwidth !581
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([32 x i8]* @empty_16)
  %tmp = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %p_read_13, double %p_read17, double %p_read28, i2 %j), !bitwidth !20
  %add_ln147 = add i8 %zext_ln145, %empty_51, !bitwidth !582
  %zext_ln147 = zext i8 %add_ln147 to i64, !bitwidth !248
  %weights3_addr = getelementptr [192 x i64], [192 x i64]* %weights3, i64 0, i64 %zext_ln147, !bitwidth !7
  %weights3_load = load i64, i64* %weights3_addr, align 8, !bitwidth !20
  %bitcast_ln147 = bitcast i64 %weights3_load to double, !bitwidth !20
  %mul8 = fmul double %tmp, %bitcast_ln147, !bitwidth !20
  %add = fadd double %add113, %mul8, !bitwidth !20
  br label %for.inc, !llvm.loop !1089, !bitwidth !11

for.inc19:                                        ; preds = %for.inc
  %dactivations_addr = getelementptr inbounds [64 x double], [64 x double]* %dactivations, i64 0, i64 %zext_ln141, !bitwidth !11
  %dactivations_load = load double, double* %dactivations_addr, align 8, !bitwidth !20
  %mul = fmul double %add113, %dactivations_load, !bitwidth !20
  store double %mul, double* %oracle_activations_addr, align 8, !bitwidth !11
  store i7 %add_ln141, i7* %i, align 1, !bitwidth !11, !dep_idx !1102, !deps !1103
  br label %get_oracle_activations2_loop1_1, !llvm.loop !1080, !bitwidth !11

for.end21:                                        ; preds = %get_oracle_activations2_loop1_1
  ret void, !bitwidth !11
}

; Function Attrs: noinline nounwind
define internal fastcc void @get_oracle_activations1.1([4096 x i64]* noalias nocapture %weights2, [64 x double]* noalias nocapture align 512 %output_differences, [64 x double]* noalias nocapture align 512 %oracle_activations, [64 x double]* noalias nocapture align 512 %dactivations) unnamed_addr #2 {
entry:
  %i = alloca i7, align 1, !bitwidth !216
  call void (...) @_ssdm_op_SpecInterface([4096 x i64]* %weights2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !179
  store i7 0, i7* %i, align 1, !bitwidth !11, !dep_idx !1106, !deps !1107
  br label %get_oracle_activations1_loop1_1, !bitwidth !11

get_oracle_activations1_loop1_1:                  ; preds = %for.inc19, %entry
  %i_29 = load i7, i7* %i, align 1, !bitwidth !227, !dep_idx !1110, !deps !1111
  %icmp_ln174 = icmp eq i7 %i_29, -64, !bitwidth !198
  %add_ln174 = add nuw i7 %i_29, 1, !bitwidth !227
  br i1 %icmp_ln174, label %for.end21, label %get_oracle_activations1_loop1_1.split, !llvm.loop !1114, !bitwidth !11

get_oracle_activations1_loop1_1.split:            ; preds = %get_oracle_activations1_loop1_1
  %zext_ln174 = zext i7 %i_29 to i64, !bitwidth !248
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([30 x i8]* @empty_9)
  %oracle_activations_addr = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations, i64 0, i64 %zext_ln174, !bitwidth !11
  %empty = trunc i7 %i_29 to i6, !bitwidth !408
  %tmp_s = call i12 @_ssdm_op_BitConcatenate.i12.i6.i6(i6 %empty, i6 0), !bitwidth !115
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %get_oracle_activations1_loop1_1.split
  %j = phi i7 [ %add_ln178, %for.inc.split ], [ 0, %get_oracle_activations1_loop1_1.split ], !bitwidth !227
  %add113 = phi double [ %add, %for.inc.split ], [ 0.000000e+00, %get_oracle_activations1_loop1_1.split ], !bitwidth !20
  %icmp_ln178 = icmp eq i7 %j, -64, !bitwidth !198
  %add_ln178 = add nuw i7 %j, 1, !bitwidth !227
  br i1 %icmp_ln178, label %for.inc19, label %for.inc.split, !llvm.loop !1123, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln178 = zext i7 %j to i64, !bitwidth !248
  %zext_ln178_1 = zext i7 %j to i12, !bitwidth !426
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([32 x i8]* @empty_7)
  %output_differences_addr = getelementptr inbounds [64 x double], [64 x double]* %output_differences, i64 0, i64 %zext_ln178, !bitwidth !11
  %output_differences_load = load double, double* %output_differences_addr, align 8, !bitwidth !20
  %add_ln180 = add nuw i12 %zext_ln178_1, %tmp_s, !bitwidth !115
  %zext_ln180 = zext i12 %add_ln180 to i64, !bitwidth !248
  %weights2_addr = getelementptr [4096 x i64], [4096 x i64]* %weights2, i64 0, i64 %zext_ln180, !bitwidth !7
  %weights2_load = load i64, i64* %weights2_addr, align 8, !bitwidth !20
  %bitcast_ln180 = bitcast i64 %weights2_load to double, !bitwidth !20
  %mul8 = fmul double %output_differences_load, %bitcast_ln180, !bitwidth !20
  %add = fadd double %add113, %mul8, !bitwidth !20
  br label %for.inc, !llvm.loop !1123, !bitwidth !11

for.inc19:                                        ; preds = %for.inc
  %dactivations_addr = getelementptr inbounds [64 x double], [64 x double]* %dactivations, i64 0, i64 %zext_ln174, !bitwidth !11
  %dactivations_load = load double, double* %dactivations_addr, align 8, !bitwidth !20
  %mul = fmul double %add113, %dactivations_load, !bitwidth !20
  store double %mul, double* %oracle_activations_addr, align 8, !bitwidth !11
  store i7 %add_ln174, i7* %i, align 1, !bitwidth !11, !dep_idx !1136, !deps !1137
  br label %get_oracle_activations1_loop1_1, !llvm.loop !1114, !bitwidth !11

for.end21:                                        ; preds = %get_oracle_activations1_loop1_1
  ret void, !bitwidth !11
}

; Function Attrs: noinline
define internal fastcc void @get_delta_matrix_weights3([192 x double]* noalias nocapture align 512 %delta_weights3, double %p_read, double %p_read1, double %p_read2, [64 x double]* noalias nocapture align 512 %last_activations) #0 {
entry:
  %i = alloca i7, align 1, !bitwidth !216
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !179
  %p_read28 = call double @_ssdm_op_Read.ap_auto.double(double %p_read2), !bitwidth !20
  %p_read17 = call double @_ssdm_op_Read.ap_auto.double(double %p_read1), !bitwidth !20
  %p_read_14 = call double @_ssdm_op_Read.ap_auto.double(double %p_read), !bitwidth !20
  store i7 0, i7* %i, align 1, !bitwidth !11, !dep_idx !1140, !deps !1141
  br label %get_delta_matrix_weights3_loop1_1, !bitwidth !11

get_delta_matrix_weights3_loop1_1:                ; preds = %for.inc9, %entry
  %i_30 = load i7, i7* %i, align 1, !bitwidth !227, !dep_idx !1144, !deps !1145
  %icmp_ln125 = icmp eq i7 %i_30, -64, !bitwidth !198
  %add_ln125 = add nuw i7 %i_30, 1, !bitwidth !227
  br i1 %icmp_ln125, label %for.end11, label %get_delta_matrix_weights3_loop1_1.split, !llvm.loop !1148, !bitwidth !11

get_delta_matrix_weights3_loop1_1.split:          ; preds = %get_delta_matrix_weights3_loop1_1
  %zext_ln125 = zext i7 %i_30 to i64, !bitwidth !248
  %zext_ln125_1 = zext i7 %i_30 to i8, !bitwidth !581
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([32 x i8]* @empty_6)
  %last_activations_addr = getelementptr inbounds [64 x double], [64 x double]* %last_activations, i64 0, i64 %zext_ln125, !bitwidth !11
  %last_activations_load = load double, double* %last_activations_addr, align 8, !bitwidth !20
  %empty = trunc i7 %i_30 to i6, !bitwidth !408
  %p_shl = call i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6 %empty, i2 0), !bitwidth !582
  %empty_52 = sub i8 %p_shl, %zext_ln125_1, !bitwidth !582
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %get_delta_matrix_weights3_loop1_1.split
  %j = phi i2 [ %add_ln128, %for.inc.split ], [ 0, %get_delta_matrix_weights3_loop1_1.split ], !bitwidth !583
  %icmp_ln128 = icmp eq i2 %j, -1, !bitwidth !198
  %add_ln128 = add nuw i2 %j, 1, !bitwidth !583
  br i1 %icmp_ln128, label %for.inc9, label %for.inc.split, !llvm.loop !1159, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln128 = zext i2 %j to i8, !bitwidth !581
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([34 x i8]* @empty_5)
  %tmp = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %p_read_14, double %p_read17, double %p_read28, i2 %j), !bitwidth !20
  %mul = fmul double %last_activations_load, %tmp, !bitwidth !20
  %add_ln130 = add i8 %zext_ln128, %empty_52, !bitwidth !582
  %zext_ln130 = zext i8 %add_ln130 to i64, !bitwidth !248
  %delta_weights3_addr = getelementptr inbounds [192 x double], [192 x double]* %delta_weights3, i64 0, i64 %zext_ln130, !bitwidth !11
  store double %mul, double* %delta_weights3_addr, align 8, !bitwidth !11
  br label %for.inc, !llvm.loop !1159, !bitwidth !11

for.inc9:                                         ; preds = %for.inc
  store i7 %add_ln125, i7* %i, align 1, !bitwidth !11, !dep_idx !1172, !deps !1173
  br label %get_delta_matrix_weights3_loop1_1, !llvm.loop !1148, !bitwidth !11

for.end11:                                        ; preds = %get_delta_matrix_weights3_loop1_1
  ret void, !bitwidth !11
}

; Function Attrs: noinline nounwind
define internal fastcc void @get_delta_matrix_weights2([4096 x double]* noalias nocapture align 512 %delta_weights2, [64 x double]* noalias nocapture align 512 %output_difference, [64 x double]* noalias nocapture align 512 %last_activations) unnamed_addr #2 {
entry:
  %i = alloca i7, align 1, !bitwidth !216
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !179
  store i7 0, i7* %i, align 1, !bitwidth !11, !dep_idx !1176, !deps !1177
  br label %get_delta_matrix_weights2_loop1_1, !bitwidth !11

get_delta_matrix_weights2_loop1_1:                ; preds = %for.inc9, %entry
  %i_31 = load i7, i7* %i, align 1, !bitwidth !227, !dep_idx !1180, !deps !1181
  %icmp_ln158 = icmp eq i7 %i_31, -64, !bitwidth !198
  %add_ln158 = add nuw i7 %i_31, 1, !bitwidth !227
  br i1 %icmp_ln158, label %for.end11, label %get_delta_matrix_weights2_loop1_1.split, !llvm.loop !1184, !bitwidth !11

get_delta_matrix_weights2_loop1_1.split:          ; preds = %get_delta_matrix_weights2_loop1_1
  %zext_ln158 = zext i7 %i_31 to i64, !bitwidth !248
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([32 x i8]* @empty_19)
  %last_activations_addr = getelementptr inbounds [64 x double], [64 x double]* %last_activations, i64 0, i64 %zext_ln158, !bitwidth !11
  %last_activations_load = load double, double* %last_activations_addr, align 8, !bitwidth !20
  %empty = trunc i7 %i_31 to i6, !bitwidth !408
  %tmp_s = call i12 @_ssdm_op_BitConcatenate.i12.i6.i6(i6 %empty, i6 0), !bitwidth !115
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %get_delta_matrix_weights2_loop1_1.split
  %j = phi i7 [ %add_ln161, %for.inc.split ], [ 0, %get_delta_matrix_weights2_loop1_1.split ], !bitwidth !227
  %icmp_ln161 = icmp eq i7 %j, -64, !bitwidth !198
  %add_ln161 = add nuw i7 %j, 1, !bitwidth !227
  br i1 %icmp_ln161, label %for.inc9, label %for.inc.split, !llvm.loop !1193, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln161 = zext i7 %j to i64, !bitwidth !248
  %zext_ln161_1 = zext i7 %j to i12, !bitwidth !426
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([34 x i8]* @empty_30)
  %output_difference_addr = getelementptr inbounds [64 x double], [64 x double]* %output_difference, i64 0, i64 %zext_ln161, !bitwidth !11
  %output_difference_load = load double, double* %output_difference_addr, align 8, !bitwidth !20
  %mul = fmul double %last_activations_load, %output_difference_load, !bitwidth !20
  %add_ln163 = add nuw i12 %zext_ln161_1, %tmp_s, !bitwidth !115
  %zext_ln163 = zext i12 %add_ln163 to i64, !bitwidth !248
  %delta_weights2_addr = getelementptr inbounds [4096 x double], [4096 x double]* %delta_weights2, i64 0, i64 %zext_ln163, !bitwidth !11
  store double %mul, double* %delta_weights2_addr, align 8, !bitwidth !11
  br label %for.inc, !llvm.loop !1193, !bitwidth !11

for.inc9:                                         ; preds = %for.inc
  store i7 %add_ln158, i7* %i, align 1, !bitwidth !11, !dep_idx !1206, !deps !1207
  br label %get_delta_matrix_weights2_loop1_1, !llvm.loop !1184, !bitwidth !11

for.end11:                                        ; preds = %get_delta_matrix_weights2_loop1_1
  ret void, !bitwidth !11
}

; Function Attrs: noinline nounwind
define internal fastcc void @get_delta_matrix_weights1.1([832 x double]* noalias nocapture align 512 %delta_weights1, [64 x double]* noalias nocapture align 512 %output_difference, [2119 x i64]* noalias nocapture %training_data, i12 %idx) #2 {
entry:
  %i = alloca i4, align 1, !bitwidth !178
  call void (...) @_ssdm_op_SpecInterface([2119 x i64]* %training_data, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !179
  %idx_read = call i12 @_ssdm_op_Read.ap_auto.i12(i12 %idx) #4, !bitwidth !115
  store i4 0, i4* %i, align 1, !bitwidth !11, !dep_idx !1210, !deps !1211
  br label %get_delta_matrix_weights1_loop1_1, !bitwidth !11

get_delta_matrix_weights1_loop1_1:                ; preds = %for.inc9, %entry
  %i_32 = load i4, i4* %i, align 1, !bitwidth !191, !dep_idx !1214, !deps !1215
  %icmp_ln191 = icmp eq i4 %i_32, -3, !bitwidth !198
  %add_ln191 = add nuw i4 %i_32, 1, !bitwidth !191
  br i1 %icmp_ln191, label %for.end11, label %get_delta_matrix_weights1_loop1_1.split, !llvm.loop !1218, !bitwidth !11

get_delta_matrix_weights1_loop1_1.split:          ; preds = %get_delta_matrix_weights1_loop1_1
  %zext_ln191 = zext i4 %i_32 to i12, !bitwidth !426
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 13, i64 13, i64 13), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([32 x i8]* @empty_22)
  %p_sum = add i12 %zext_ln191, %idx_read, !bitwidth !115
  %p_sum_cast = zext i12 %p_sum to i64, !bitwidth !248
  %training_data_addr = getelementptr [2119 x i64], [2119 x i64]* %training_data, i64 0, i64 %p_sum_cast, !bitwidth !7
  %training_data_load = load i64, i64* %training_data_addr, align 8, !bitwidth !20
  %empty = bitcast i64 %training_data_load to double, !bitwidth !20
  %tmp = call i10 @_ssdm_op_BitConcatenate.i10.i4.i6(i4 %i_32, i6 0), !bitwidth !226
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %get_delta_matrix_weights1_loop1_1.split
  %j = phi i7 [ %add_ln194, %for.inc.split ], [ 0, %get_delta_matrix_weights1_loop1_1.split ], !bitwidth !227
  %icmp_ln194 = icmp eq i7 %j, -64, !bitwidth !198
  %add_ln194 = add nuw i7 %j, 1, !bitwidth !227
  br i1 %icmp_ln194, label %for.inc9, label %for.inc.split, !llvm.loop !1227, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln194 = zext i7 %j to i64, !bitwidth !248
  %zext_ln194_1 = zext i7 %j to i10, !bitwidth !247
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([34 x i8]* @empty_32)
  %output_difference_addr = getelementptr inbounds [64 x double], [64 x double]* %output_difference, i64 0, i64 %zext_ln194, !bitwidth !11
  %output_difference_load = load double, double* %output_difference_addr, align 8, !bitwidth !20
  %mul = fmul double %empty, %output_difference_load, !bitwidth !20
  %add_ln196 = add nuw i10 %zext_ln194_1, %tmp, !bitwidth !226
  %zext_ln196 = zext i10 %add_ln196 to i64, !bitwidth !248
  %delta_weights1_addr = getelementptr inbounds [832 x double], [832 x double]* %delta_weights1, i64 0, i64 %zext_ln196, !bitwidth !11
  store double %mul, double* %delta_weights1_addr, align 8, !bitwidth !11
  br label %for.inc, !llvm.loop !1227, !bitwidth !11

for.inc9:                                         ; preds = %for.inc
  store i4 %add_ln191, i4* %i, align 1, !bitwidth !11, !dep_idx !1240, !deps !1241
  br label %get_delta_matrix_weights1_loop1_1, !llvm.loop !1218, !bitwidth !11

for.end11:                                        ; preds = %get_delta_matrix_weights1_loop1_1
  ret void, !bitwidth !11
}

; Function Attrs: noinline nounwind
define void @backprop([832 x i64]* noalias %weights1, [4096 x i64]* noalias %weights2, [192 x i64]* noalias %weights3, [64 x i64]* noalias %biases1, [64 x i64]* noalias %biases2, [3 x i64]* noalias %biases3, [2119 x i64]* noalias %training_data, [489 x i64]* noalias %training_targets) #2 {
entry:
  %phi_mul = alloca i12, align 2, !bitwidth !1244
  %i = alloca i8, align 1, !bitwidth !1245
  %dactivations3_020 = alloca double, align 8, !bitwidth !11
  %dactivations3_121 = alloca double, align 8, !bitwidth !11
  %dactivations3_222 = alloca double, align 8, !bitwidth !11
  %net_outputs_023 = alloca double, align 8, !bitwidth !11
  %net_outputs_124 = alloca double, align 8, !bitwidth !11
  %net_outputs_225 = alloca double, align 8, !bitwidth !11
  %output_difference_2_032 = alloca double, align 8, !bitwidth !11
  %output_difference_1_033 = alloca double, align 8, !bitwidth !11
  %output_difference_0_034 = alloca double, align 8, !bitwidth !11
  %activations3_0_0 = alloca double, align 8, !bitwidth !11
  %activations3_1_0 = alloca double, align 8, !bitwidth !11
  %activations3_2_0 = alloca double, align 8, !bitwidth !11
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecTopModule([9 x i8]* @empty_10), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecInterface([832 x i64]* %weights1, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([832 x i64]* %weights1), !map !1246
  call void (...) @_ssdm_op_SpecInterface([4096 x i64]* %weights2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([4096 x i64]* %weights2), !map !1246
  call void (...) @_ssdm_op_SpecInterface([192 x i64]* %weights3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([192 x i64]* %weights3), !map !1246
  call void (...) @_ssdm_op_SpecInterface([64 x i64]* %biases1, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([64 x i64]* %biases1), !map !1246
  call void (...) @_ssdm_op_SpecInterface([64 x i64]* %biases2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([64 x i64]* %biases2), !map !1246
  call void (...) @_ssdm_op_SpecInterface([3 x i64]* %biases3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([3 x i64]* %biases3), !map !1246
  call void (...) @_ssdm_op_SpecInterface([2119 x i64]* %training_data, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([2119 x i64]* %training_data), !map !1246
  call void (...) @_ssdm_op_SpecInterface([489 x i64]* %training_targets, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([489 x i64]* %training_targets), !map !1246
  %activations1 = alloca [64 x double], i64 1, align 512, !bitwidth !11
  %activations2 = alloca [64 x double], i64 1, align 512, !bitwidth !11
  %dactivations1 = alloca [64 x double], i64 1, align 512, !bitwidth !11
  %dactivations2 = alloca [64 x double], i64 1, align 512, !bitwidth !11
  %delta_weights1 = alloca [832 x double], i64 1, align 512, !bitwidth !11
  %delta_weights2 = alloca [4096 x double], i64 1, align 512, !bitwidth !11
  %delta_weights3 = alloca [192 x double], i64 1, align 512, !bitwidth !11
  %oracle_activations1 = alloca [64 x double], i64 1, align 512, !bitwidth !11
  %oracle_activations2 = alloca [64 x double], i64 1, align 512, !bitwidth !11
  store i8 0, i8* %i, align 1, !bitwidth !11, !dep_idx !1247, !deps !1248
  store i12 0, i12* %phi_mul, align 2, !bitwidth !11, !dep_idx !1251, !deps !1252
  br label %backprop_loop1_1, !bitwidth !11

backprop_loop1_1:                                 ; preds = %for.inc52, %entry
  %phi_mul_load = load i12, i12* %phi_mul, align 2, !bitwidth !115, !dep_idx !1255, !deps !1256
  %i_33 = load i8, i8* %i, align 1, !bitwidth !582, !dep_idx !211, !deps !1259
  %activations3_0_0_load = load double, double* %activations3_0_0, align 8, !bitwidth !20, !dep_idx !1262, !deps !1263
  %activations3_1_0_load = load double, double* %activations3_1_0, align 8, !bitwidth !20, !dep_idx !1265, !deps !1266
  %activations3_2_0_load = load double, double* %activations3_2_0, align 8, !bitwidth !20, !dep_idx !1268, !deps !1269
  %add_ln356_1 = add i12 %phi_mul_load, 13, !bitwidth !115
  %icmp_ln356 = icmp eq i8 %i_33, -93, !bitwidth !198
  %add_ln356 = add nuw i8 %i_33, 1, !bitwidth !582
  br i1 %icmp_ln356, label %for.end54, label %backprop_loop1_1.split, !llvm.loop !1271, !bitwidth !11

backprop_loop1_1.split:                           ; preds = %backprop_loop1_1
  %zext_ln356 = zext i8 %i_33 to i9, !bitwidth !757
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 163, i64 163, i64 163), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([15 x i8]* @empty_1)
  br label %for.body3, !bitwidth !11

for.body3:                                        ; preds = %for.inc, %backprop_loop1_1.split
  %activations3_2_1 = phi double [ %activations3_2_0_load, %backprop_loop1_1.split ], [ %activations3_2_3, %for.inc ], !bitwidth !20
  %activations3_1_1 = phi double [ %activations3_1_0_load, %backprop_loop1_1.split ], [ %activations3_1_3, %for.inc ], !bitwidth !20
  %activations3_0_1 = phi double [ %activations3_0_0_load, %backprop_loop1_1.split ], [ %activations3_0_3, %for.inc ], !bitwidth !20
  %j = phi i7 [ 0, %backprop_loop1_1.split ], [ %add_ln359, %for.inc ], !bitwidth !227
  %icmp_ln359 = icmp eq i7 %j, -64, !bitwidth !198
  %add_ln359 = add nuw i7 %j, 1, !bitwidth !227
  br i1 %icmp_ln359, label %for.inc52, label %for.body3.split, !llvm.loop !1282, !bitwidth !11

for.body3.split:                                  ; preds = %for.body3
  %zext_ln359 = zext i7 %j to i64, !bitwidth !248
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !179
  call void (...) @_ssdm_op_SpecLoopName([17 x i8]* @empty_0)
  %activations1_addr = getelementptr inbounds [64 x double], [64 x double]* %activations1, i64 0, i64 %zext_ln359, !bitwidth !11
  store double 0.000000e+00, double* %activations1_addr, align 8, !bitwidth !11, !dep_idx !1295, !deps !1296
  %activations2_addr = getelementptr inbounds [64 x double], [64 x double]* %activations2, i64 0, i64 %zext_ln359, !bitwidth !11
  store double 0.000000e+00, double* %activations2_addr, align 8, !bitwidth !11, !dep_idx !1302, !deps !1303
  %icmp_ln363 = icmp ult i7 %j, 3, !bitwidth !198
  br i1 %icmp_ln363, label %if.then, label %for.inc, !bitwidth !11

if.then:                                          ; preds = %for.body3.split
  %trunc_ln364 = trunc i7 %j to i2, !bitwidth !583
  switch i2 %trunc_ln364, label %branch2 [
    i2 0, label %for.inc
    i2 1, label %branch1
  ], !bitwidth !758

for.inc:                                          ; preds = %branch2, %branch1, %if.then, %for.body3.split
  %activations3_2_3 = phi double [ %activations3_2_1, %for.body3.split ], [ 0.000000e+00, %branch2 ], [ %activations3_2_1, %branch1 ], [ %activations3_2_1, %if.then ], !bitwidth !20
  %activations3_1_3 = phi double [ %activations3_1_1, %for.body3.split ], [ %activations3_1_1, %branch2 ], [ 0.000000e+00, %branch1 ], [ %activations3_1_1, %if.then ], !bitwidth !20
  %activations3_0_3 = phi double [ %activations3_0_1, %for.body3.split ], [ %activations3_0_1, %branch2 ], [ %activations3_0_1, %branch1 ], [ 0.000000e+00, %if.then ], !bitwidth !20
  br label %for.body3, !llvm.loop !1282, !bitwidth !11

for.inc52:                                        ; preds = %for.body3
  %dactivations3_020_load = load double, double* %dactivations3_020, align 8, !bitwidth !20, !dep_idx !1308, !deps !1309
  %dactivations3_121_load = load double, double* %dactivations3_121, align 8, !bitwidth !20, !dep_idx !1311, !deps !1312
  %dactivations3_222_load = load double, double* %dactivations3_222, align 8, !bitwidth !20, !dep_idx !1314, !deps !1315
  %net_outputs_023_load = load double, double* %net_outputs_023, align 8, !bitwidth !20, !dep_idx !1317, !deps !1318
  %net_outputs_124_load = load double, double* %net_outputs_124, align 8, !bitwidth !20, !dep_idx !1320, !deps !1321
  %net_outputs_225_load = load double, double* %net_outputs_225, align 8, !bitwidth !20, !dep_idx !1323, !deps !1324
  %output_difference_2_032_load = load double, double* %output_difference_2_032, align 8, !bitwidth !20, !dep_idx !1326, !deps !1327
  %output_difference_1_033_load = load double, double* %output_difference_1_033, align 8, !bitwidth !20, !dep_idx !1329, !deps !1330
  %output_difference_0_034_load = load double, double* %output_difference_0_034, align 8, !bitwidth !20, !dep_idx !1332, !deps !1333
  call fastcc void @matrix_vector_product_with_bias_input_layer.1([64 x i64]* %biases1, [832 x i64]* %weights1, [64 x double]* %activations1, [2119 x i64]* %training_data, i12 %phi_mul_load), !bitwidth !11, !dep_idx !1335, !deps !1336
  call fastcc void @RELU([64 x double]* %activations1, [64 x double]* %dactivations1), !bitwidth !11, !dep_idx !1340, !deps !1341
  call fastcc void @matrix_vector_product_with_bias_second_layer.1([64 x i64]* %biases2, [4096 x i64]* %weights2, [64 x double]* %activations2, [64 x double]* %activations1), !bitwidth !11, !dep_idx !1343, !deps !1344
  call fastcc void @RELU([64 x double]* %activations2, [64 x double]* %dactivations2), !bitwidth !11, !dep_idx !1349, !deps !1350
  %call_ret1 = call fastcc { double, double, double } @matrix_vector_product_with_bias_output_layer.1([3 x i64]* %biases3, [192 x i64]* %weights3, double %activations3_0_1, double %activations3_1_1, double %activations3_2_1, [64 x double]* %activations2) #4, !bitwidth !11, !dep_idx !1352, !deps !1353
  %activations3_0 = extractvalue { double, double, double } %call_ret1, 0, !bitwidth !20
  %activations3_1 = extractvalue { double, double, double } %call_ret1, 1, !bitwidth !20
  %activations3_2 = extractvalue { double, double, double } %call_ret1, 2, !bitwidth !20
  %call_ret = call fastcc { double, double, double, double, double, double } @RELU.clone(double %activations3_0, double %activations3_1, double %activations3_2, double %dactivations3_020_load, double %dactivations3_121_load, double %dactivations3_222_load) #4, !bitwidth !11
  %dactivations3_2 = extractvalue { double, double, double, double, double, double } %call_ret, 2, !bitwidth !20
  %dactivations3_1 = extractvalue { double, double, double, double, double, double } %call_ret, 1, !bitwidth !20
  %dactivations3_0 = extractvalue { double, double, double, double, double, double } %call_ret, 0, !bitwidth !20
  %activations3_0_2 = extractvalue { double, double, double, double, double, double } %call_ret, 3, !bitwidth !20
  %activations3_1_2 = extractvalue { double, double, double, double, double, double } %call_ret, 4, !bitwidth !20
  %activations3_2_2 = extractvalue { double, double, double, double, double, double } %call_ret, 5, !bitwidth !20
  %call_ret2 = call fastcc { double, double, double } @soft_max(double %net_outputs_023_load, double %net_outputs_124_load, double %net_outputs_225_load, double %activations3_0_2, double %activations3_1_2, double %activations3_2_2) #4, !bitwidth !11
  %net_outputs_0 = extractvalue { double, double, double } %call_ret2, 0, !bitwidth !20
  %net_outputs_1 = extractvalue { double, double, double } %call_ret2, 1, !bitwidth !20
  %net_outputs_2 = extractvalue { double, double, double } %call_ret2, 2, !bitwidth !20
  %trunc_ln374 = trunc i8 %i_33 to i7, !bitwidth !227
  %shl_ln = call i9 @_ssdm_op_BitConcatenate.i9.i7.i2(i7 %trunc_ln374, i2 0), !bitwidth !89
  %sub_ln374 = sub i9 %shl_ln, %zext_ln356, !bitwidth !89
  %call_ret3 = call fastcc { double, double, double } @take_difference.1(double %net_outputs_0, double %net_outputs_1, double %net_outputs_2, [489 x i64]* %training_targets, double %output_difference_0_034_load, double %output_difference_1_033_load, double %output_difference_2_032_load, double %dactivations3_0, double %dactivations3_1, double %dactivations3_2, i9 %sub_ln374) #4, !bitwidth !11
  %output_difference_0 = extractvalue { double, double, double } %call_ret3, 0, !bitwidth !20
  %output_difference_1 = extractvalue { double, double, double } %call_ret3, 1, !bitwidth !20
  %output_difference_2 = extractvalue { double, double, double } %call_ret3, 2, !bitwidth !20
  call fastcc void @get_delta_matrix_weights3([192 x double]* %delta_weights3, double %output_difference_0, double %output_difference_1, double %output_difference_2, [64 x double]* %activations2) #4, !bitwidth !11, !dep_idx !1355, !deps !1356
  call fastcc void @get_oracle_activations2.1([192 x i64]* %weights3, double %output_difference_0, double %output_difference_1, double %output_difference_2, [64 x double]* %oracle_activations2, [64 x double]* %dactivations2) #4, !bitwidth !11, !dep_idx !1358, !deps !1359
  call fastcc void @get_delta_matrix_weights2([4096 x double]* %delta_weights2, [64 x double]* %oracle_activations2, [64 x double]* %activations1), !bitwidth !11, !dep_idx !1361, !deps !1362
  call fastcc void @get_oracle_activations1.1([4096 x i64]* %weights2, [64 x double]* %oracle_activations2, [64 x double]* %oracle_activations1, [64 x double]* %dactivations1), !bitwidth !11, !dep_idx !1364, !deps !1365
  call fastcc void @get_delta_matrix_weights1.1([832 x double]* %delta_weights1, [64 x double]* %oracle_activations1, [2119 x i64]* %training_data, i12 %phi_mul_load), !bitwidth !11, !dep_idx !1368, !deps !1369
  call fastcc void @update_weights.1([832 x i64]* %weights1, [4096 x i64]* %weights2, [192 x i64]* %weights3, [832 x double]* %delta_weights1, [4096 x double]* %delta_weights2, [192 x double]* %delta_weights3, [64 x i64]* %biases1, [64 x i64]* %biases2, [3 x i64]* %biases3, [64 x double]* %oracle_activations1, [64 x double]* %oracle_activations2, double %output_difference_0, double %output_difference_1, double %output_difference_2) #4, !bitwidth !11, !dep_idx !1371, !deps !1372
  store double %activations3_2_2, double* %activations3_2_0, align 8, !bitwidth !11, !dep_idx !1378, !deps !1379
  store double %activations3_1_2, double* %activations3_1_0, align 8, !bitwidth !11, !dep_idx !1381, !deps !1382
  store double %activations3_0_2, double* %activations3_0_0, align 8, !bitwidth !11, !dep_idx !1384, !deps !1385
  store double %output_difference_0, double* %output_difference_0_034, align 8, !bitwidth !11, !dep_idx !1387, !deps !1388
  store double %output_difference_1, double* %output_difference_1_033, align 8, !bitwidth !11, !dep_idx !1390, !deps !1391
  store double %output_difference_2, double* %output_difference_2_032, align 8, !bitwidth !11, !dep_idx !1393, !deps !1394
  store double %net_outputs_2, double* %net_outputs_225, align 8, !bitwidth !11, !dep_idx !1396, !deps !1397
  store double %net_outputs_1, double* %net_outputs_124, align 8, !bitwidth !11, !dep_idx !1399, !deps !1400
  store double %net_outputs_0, double* %net_outputs_023, align 8, !bitwidth !11, !dep_idx !1402, !deps !1403
  store double %dactivations3_2, double* %dactivations3_222, align 8, !bitwidth !11, !dep_idx !1405, !deps !1406
  store double %dactivations3_1, double* %dactivations3_121, align 8, !bitwidth !11, !dep_idx !1408, !deps !1409
  store double %dactivations3_0, double* %dactivations3_020, align 8, !bitwidth !11, !dep_idx !1411, !deps !1412
  store i8 %add_ln356, i8* %i, align 1, !bitwidth !11, !dep_idx !1414, !deps !1415
  store i12 %add_ln356_1, i12* %phi_mul, align 2, !bitwidth !11, !dep_idx !1418, !deps !1419
  br label %backprop_loop1_1, !llvm.loop !1271, !bitwidth !11

for.end54:                                        ; preds = %backprop_loop1_1
  ret void, !bitwidth !11

branch1:                                          ; preds = %if.then
  br label %for.inc, !bitwidth !11

branch2:                                          ; preds = %if.then
  br label %for.inc, !bitwidth !11
}

; Function Attrs: noinline nounwind
define internal fastcc void @add_bias_to_activations.clone.1([64 x i64]* noalias nocapture %biases2, [64 x double]* noalias nocapture align 512 %activations) unnamed_addr #2 {
entry:
  %i = alloca i7, align 1, !bitwidth !216
  call void (...) @_ssdm_op_SpecInterface([64 x i64]* %biases2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42)
  store i7 0, i7* %i, align 1, !bitwidth !11, !dep_idx !1422, !deps !1423
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %entry
  %i_34 = load i7, i7* %i, align 1, !bitwidth !227, !dep_idx !1426, !deps !1427
  %icmp_ln48 = icmp eq i7 %i_34, -64, !bitwidth !198
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64)
  %add_ln48 = add nuw i7 %i_34, 1, !bitwidth !227
  br i1 %icmp_ln48, label %for.end, label %for.inc.split, !llvm.loop !1430, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln48 = zext i7 %i_34 to i64, !bitwidth !248
  call void (...) @_ssdm_op_SpecLoopName([30 x i8]* @empty_31)
  %activations_addr = getelementptr inbounds [64 x double], [64 x double]* %activations, i64 0, i64 %zext_ln48, !bitwidth !11
  %activations_load = load double, double* %activations_addr, align 8, !bitwidth !20, !dep_idx !1442, !deps !1443
  %biases2_addr = getelementptr [64 x i64], [64 x i64]* %biases2, i64 0, i64 %zext_ln48, !bitwidth !7
  %biases2_load = load i64, i64* %biases2_addr, align 8, !bitwidth !20
  %bitcast_ln50 = bitcast i64 %biases2_load to double, !bitwidth !20
  %add = fadd double %activations_load, %bitcast_ln50, !bitwidth !20
  store double %add, double* %activations_addr, align 8, !bitwidth !11, !dep_idx !1445, !deps !1446
  store i7 %add_ln48, i7* %i, align 1, !bitwidth !11, !dep_idx !1448, !deps !1449
  br label %for.inc, !llvm.loop !1430, !bitwidth !11

for.end:                                          ; preds = %for.inc
  ret void, !bitwidth !11
}

; Function Attrs: noinline readonly
define internal fastcc { double, double, double } @add_bias_to_activations.1([3 x i64]* noalias nocapture %biases3, double %p_read, double %p_read1, double %p_read2) #1 {
entry:
  %i = alloca i2, align 1, !bitwidth !571
  %activations2_0 = alloca double, align 8, !bitwidth !11
  %activations12_0 = alloca double, align 8, !bitwidth !11
  %activations_0 = alloca double, align 8, !bitwidth !11
  call void (...) @_ssdm_op_SpecInterface([3 x i64]* %biases3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42)
  %p_read25 = call double @_ssdm_op_Read.ap_auto.double(double %p_read2), !bitwidth !20
  %p_read14 = call double @_ssdm_op_Read.ap_auto.double(double %p_read1), !bitwidth !20
  %p_read_15 = call double @_ssdm_op_Read.ap_auto.double(double %p_read), !bitwidth !20
  store double %p_read_15, double* %activations_0, align 8, !bitwidth !11, !dep_idx !1452, !deps !1453
  store double %p_read14, double* %activations12_0, align 8, !bitwidth !11, !dep_idx !1457, !deps !1458
  store double %p_read25, double* %activations2_0, align 8, !bitwidth !11, !dep_idx !1462, !deps !1463
  store i2 0, i2* %i, align 1, !bitwidth !11, !dep_idx !1467, !deps !1468
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split5, %entry
  %i_35 = load i2, i2* %i, align 1, !bitwidth !583, !dep_idx !1471, !deps !1472
  %icmp_ln48 = icmp eq i2 %i_35, -1, !bitwidth !198
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  %add_ln48 = add nuw i2 %i_35, 1, !bitwidth !583
  br i1 %icmp_ln48, label %for.end, label %for.inc.split, !llvm.loop !1475, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %activations2_0_load_1 = load double, double* %activations2_0, align 8, !bitwidth !20, !dep_idx !1483, !deps !1484
  %activations12_0_load_1 = load double, double* %activations12_0, align 8, !bitwidth !20, !dep_idx !1487, !deps !1488
  %activations_0_load_1 = load double, double* %activations_0, align 8, !bitwidth !20, !dep_idx !1491, !deps !1492
  %zext_ln48 = zext i2 %i_35 to i64, !bitwidth !248
  call void (...) @_ssdm_op_SpecLoopName([30 x i8]* @empty_31)
  %tmp = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %activations_0_load_1, double %activations12_0_load_1, double %activations2_0_load_1, i2 %i_35), !bitwidth !20
  %biases3_addr = getelementptr [3 x i64], [3 x i64]* %biases3, i64 0, i64 %zext_ln48, !bitwidth !7
  %biases3_load = load i64, i64* %biases3_addr, align 8, !bitwidth !20
  %bitcast_ln50 = bitcast i64 %biases3_load to double, !bitwidth !20
  %add = fadd double %tmp, %bitcast_ln50, !bitwidth !20
  switch i2 %i_35, label %branch2 [
    i2 0, label %for.inc.split.for.inc.split5_crit_edge
    i2 1, label %branch1
  ], !bitwidth !758

for.inc.split.for.inc.split5_crit_edge:           ; preds = %for.inc.split
  store double %add, double* %activations_0, align 8, !bitwidth !11, !dep_idx !1495, !deps !1496
  br label %for.inc.split5, !bitwidth !11

for.inc.split5:                                   ; preds = %branch2, %branch1, %for.inc.split.for.inc.split5_crit_edge
  store i2 %add_ln48, i2* %i, align 1, !bitwidth !11, !dep_idx !1499, !deps !1500
  br label %for.inc, !llvm.loop !1475, !bitwidth !11

for.end:                                          ; preds = %for.inc
  %activations2_0_load = load double, double* %activations2_0, align 8, !bitwidth !20, !dep_idx !1503, !deps !1504
  %activations12_0_load = load double, double* %activations12_0, align 8, !bitwidth !20, !dep_idx !1506, !deps !1507
  %activations_0_load = load double, double* %activations_0, align 8, !bitwidth !20, !dep_idx !1509, !deps !1510
  %mrv = insertvalue { double, double, double } undef, double %activations_0_load, 0, !bitwidth !11
  %mrv_1 = insertvalue { double, double, double } %mrv, double %activations12_0_load, 1, !bitwidth !11
  %mrv_2 = insertvalue { double, double, double } %mrv_1, double %activations2_0_load, 2, !bitwidth !11
  ret { double, double, double } %mrv_2, !bitwidth !11

branch1:                                          ; preds = %for.inc.split
  store double %add, double* %activations12_0, align 8, !bitwidth !11, !dep_idx !1512, !deps !1513
  br label %for.inc.split5, !bitwidth !11

branch2:                                          ; preds = %for.inc.split
  store double %add, double* %activations2_0, align 8, !bitwidth !11, !dep_idx !1516, !deps !1517
  br label %for.inc.split5, !bitwidth !11
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecTopModule(...) #4 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecPipeline(...) #4 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecLoopTripCount(...) #4 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecLoopName(...) #4 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecInterface(...) #4 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecBitsMap(...) #4 comdat {
entry:
  ret void
}

define weak i9 @_ssdm_op_Read.ap_auto.i9(i9 %0) comdat {
entry:
  ret i9 %0
}

define weak i12 @_ssdm_op_Read.ap_auto.i12(i12 %0) comdat {
entry:
  ret i12 %0
}

define weak double @_ssdm_op_Read.ap_auto.double(double %0) comdat {
entry:
  ret double %0
}

; Function Attrs: nounwind readnone
define weak double @_ssdm_op_Mux.ap_auto.3double.i2(double %0, double %1, double %2, i2 %3) #5 comdat {
entry:
  switch i2 %3, label %case2 [
    i2 0, label %case0
    i2 1, label %case1
  ]

case0:                                            ; preds = %case2, %case1, %entry
  %merge = phi double [ %0, %entry ], [ %1, %case1 ], [ %2, %case2 ]
  ret double %merge

case1:                                            ; preds = %entry
  br label %case0

case2:                                            ; preds = %entry
  br label %case0
}

; Function Attrs: nounwind readnone
define weak i9 @_ssdm_op_BitConcatenate.i9.i7.i2(i7 %0, i2 %1) #5 comdat {
entry:
  %empty = zext i7 %0 to i9
  %empty_53 = zext i2 %1 to i9
  %empty_54 = shl i9 %empty, 2
  %empty_55 = or i9 %empty_54, %empty_53
  ret i9 %empty_55
}

; Function Attrs: nounwind readnone
define weak i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6 %0, i2 %1) #5 comdat {
entry:
  %empty = zext i6 %0 to i8
  %empty_56 = zext i2 %1 to i8
  %empty_57 = shl i8 %empty, 2
  %empty_58 = or i8 %empty_57, %empty_56
  ret i8 %empty_58
}

; Function Attrs: nounwind readnone
define weak i8 @_ssdm_op_BitConcatenate.i8.i2.i6(i2 %0, i6 %1) #5 comdat {
entry:
  %empty = zext i2 %0 to i8
  %empty_59 = zext i6 %1 to i8
  %empty_60 = shl i8 %empty, 6
  %empty_61 = or i8 %empty_60, %empty_59
  ret i8 %empty_61
}

; Function Attrs: nounwind readnone
define weak i12 @_ssdm_op_BitConcatenate.i12.i6.i6(i6 %0, i6 %1) #5 comdat {
entry:
  %empty = zext i6 %0 to i12
  %empty_62 = zext i6 %1 to i12
  %empty_63 = shl i12 %empty, 6
  %empty_64 = or i12 %empty_63, %empty_62
  ret i12 %empty_64
}

; Function Attrs: nounwind readnone
define weak i10 @_ssdm_op_BitConcatenate.i10.i4.i6(i4 %0, i6 %1) #5 comdat {
entry:
  %empty = zext i4 %0 to i10
  %empty_65 = zext i6 %1 to i10
  %empty_66 = shl i10 %empty, 6
  %empty_67 = or i10 %empty_66, %empty_65
  ret i10 %empty_67
}

; Function Attrs: noinline readonly
define internal fastcc { double, double, double, double, double, double } @RELU.clone(double %p_read, double %p_read1, double %p_read2, double %p_read3, double %p_read14, double %p_read25) #1 {
entry:
  %i = alloca i2, align 1, !bitwidth !571
  %dactivations4_03 = alloca double, align 8, !bitwidth !11
  %write_flag_0 = alloca i1, align 1, !bitwidth !725
  %write_flag6_0 = alloca i1, align 1, !bitwidth !725
  %dactivations3_04 = alloca double, align 8, !bitwidth !11
  %dactivations_05 = alloca double, align 8, !bitwidth !11
  %write_flag3_0 = alloca i1, align 1, !bitwidth !725
  %activations2_0 = alloca double, align 8, !bitwidth !11
  %activations12_0 = alloca double, align 8, !bitwidth !11
  %activations_0 = alloca double, align 8, !bitwidth !11
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42)
  %p_read_16 = call double @_ssdm_op_Read.ap_auto.double(double %p_read25), !bitwidth !20
  %p_read_17 = call double @_ssdm_op_Read.ap_auto.double(double %p_read14), !bitwidth !20
  %p_read37 = call double @_ssdm_op_Read.ap_auto.double(double %p_read3), !bitwidth !20
  %p_read26 = call double @_ssdm_op_Read.ap_auto.double(double %p_read2), !bitwidth !20
  %p_read15 = call double @_ssdm_op_Read.ap_auto.double(double %p_read1), !bitwidth !20
  %p_read_18 = call double @_ssdm_op_Read.ap_auto.double(double %p_read), !bitwidth !20
  store double %p_read_18, double* %activations_0, align 8, !bitwidth !11, !dep_idx !1520, !deps !1521
  store double %p_read15, double* %activations12_0, align 8, !bitwidth !11, !dep_idx !1525, !deps !1526
  store double %p_read26, double* %activations2_0, align 8, !bitwidth !11, !dep_idx !1530, !deps !1531
  store i1 false, i1* %write_flag3_0, align 1, !bitwidth !11, !dep_idx !1535, !deps !1536
  store i1 false, i1* %write_flag6_0, align 1, !bitwidth !11, !dep_idx !1539, !deps !1540
  store i1 false, i1* %write_flag_0, align 1, !bitwidth !11, !dep_idx !1543, !deps !1544
  store i2 0, i2* %i, align 1, !bitwidth !11, !dep_idx !1547, !deps !1548
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split7, %entry
  %i_36 = load i2, i2* %i, align 1, !bitwidth !583, !dep_idx !1551, !deps !1552
  %icmp_ln36 = icmp eq i2 %i_36, -1, !bitwidth !198
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  %add_ln36 = add nuw i2 %i_36, 1, !bitwidth !583
  br i1 %icmp_ln36, label %for.end, label %for.inc.split, !llvm.loop !1555, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %activations2_0_load_2 = load double, double* %activations2_0, align 8, !bitwidth !20, !dep_idx !1564, !deps !1565
  %activations12_0_load11 = load double, double* %activations12_0, align 8, !bitwidth !20, !dep_idx !1568, !deps !1569
  %activations_0_load_2 = load double, double* %activations_0, align 8, !bitwidth !20, !dep_idx !1572, !deps !1573
  call void (...) @_ssdm_op_SpecLoopName([11 x i8]* @empty_2)
  %tmp_4 = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %activations_0_load_2, double %activations12_0_load11, double %activations2_0_load_2, i2 %i_36), !bitwidth !20
  %sub = fsub double 1.000000e+00, %tmp_4, !bitwidth !20
  %dactivations = fmul double %tmp_4, %sub, !bitwidth !20
  switch i2 %i_36, label %branch5 [
    i2 0, label %for.inc.split.for.inc.split12_crit_edge
    i2 1, label %branch4
  ], !bitwidth !758

for.inc.split.for.inc.split12_crit_edge:          ; preds = %for.inc.split
  store double %dactivations, double* %dactivations_05, align 8, !bitwidth !11, !dep_idx !1576, !deps !1577
  store i1 true, i1* %write_flag_0, align 1, !bitwidth !11, !dep_idx !1579, !deps !1580
  br label %for.inc.split12, !bitwidth !11

for.inc.split12:                                  ; preds = %branch5, %branch4, %for.inc.split.for.inc.split12_crit_edge
  %bitcast_ln39 = bitcast double %tmp_4 to i64, !bitwidth !20
  %xor_ln39 = xor i64 %bitcast_ln39, -9223372036854775808, !bitwidth !20
  %bitcast_ln39_1 = bitcast i64 %xor_ln39 to double, !bitwidth !20
  %tmp = call double @llvm.exp.f64(double %bitcast_ln39_1), !bitwidth !20
  %add = fadd double %tmp, 1.000000e+00, !bitwidth !20
  %div = fdiv double 1.000000e+00, %add, !bitwidth !20
  switch i2 %i_36, label %branch2 [
    i2 0, label %for.inc.split12.for.inc.split7_crit_edge
    i2 1, label %branch1
  ], !bitwidth !758

for.inc.split12.for.inc.split7_crit_edge:         ; preds = %for.inc.split12
  store double %div, double* %activations_0, align 8, !bitwidth !11, !dep_idx !1582, !deps !1583
  br label %for.inc.split7, !bitwidth !11

for.inc.split7:                                   ; preds = %branch2, %branch1, %for.inc.split12.for.inc.split7_crit_edge
  store i2 %add_ln36, i2* %i, align 1, !bitwidth !11, !dep_idx !1586, !deps !1587
  br label %for.inc, !llvm.loop !1555, !bitwidth !11

for.end:                                          ; preds = %for.inc
  %dactivations4_03_load = load double, double* %dactivations4_03, align 8, !bitwidth !20, !dep_idx !1590, !deps !1591
  %write_flag_0_load = load i1, i1* %write_flag_0, align 1, !bitwidth !198, !dep_idx !1593, !deps !1594
  %write_flag6_0_load = load i1, i1* %write_flag6_0, align 1, !bitwidth !198, !dep_idx !1597, !deps !1598
  %dactivations3_04_load = load double, double* %dactivations3_04, align 8, !bitwidth !20, !dep_idx !1601, !deps !1602
  %dactivations_05_load = load double, double* %dactivations_05, align 8, !bitwidth !20, !dep_idx !1604, !deps !1605
  %write_flag3_0_load = load i1, i1* %write_flag3_0, align 1, !bitwidth !198, !dep_idx !1607, !deps !1608
  %activations2_0_load = load double, double* %activations2_0, align 8, !bitwidth !20, !dep_idx !1611, !deps !1612
  %activations12_0_load = load double, double* %activations12_0, align 8, !bitwidth !20, !dep_idx !1614, !deps !1615
  %activations_0_load = load double, double* %activations_0, align 8, !bitwidth !20, !dep_idx !1617, !deps !1618
  %select_ln41 = select i1 %write_flag_0_load, double %dactivations_05_load, double %p_read37, !bitwidth !20
  %select_ln41_1 = select i1 %write_flag3_0_load, double %dactivations3_04_load, double %p_read_17, !bitwidth !20
  %select_ln41_2 = select i1 %write_flag6_0_load, double %dactivations4_03_load, double %p_read_16, !bitwidth !20
  %mrv = insertvalue { double, double, double, double, double, double } undef, double %select_ln41, 0, !bitwidth !11
  %mrv_s = insertvalue { double, double, double, double, double, double } %mrv, double %select_ln41_1, 1, !bitwidth !11
  %mrv_1 = insertvalue { double, double, double, double, double, double } %mrv_s, double %select_ln41_2, 2, !bitwidth !11
  %mrv_3 = insertvalue { double, double, double, double, double, double } %mrv_1, double %activations_0_load, 3, !bitwidth !11
  %mrv_4 = insertvalue { double, double, double, double, double, double } %mrv_3, double %activations12_0_load, 4, !bitwidth !11
  %mrv_5 = insertvalue { double, double, double, double, double, double } %mrv_4, double %activations2_0_load, 5, !bitwidth !11
  ret { double, double, double, double, double, double } %mrv_5, !bitwidth !11

branch1:                                          ; preds = %for.inc.split12
  store double %div, double* %activations12_0, align 8, !bitwidth !11, !dep_idx !1620, !deps !1621
  br label %for.inc.split7, !bitwidth !11

branch2:                                          ; preds = %for.inc.split12
  store double %div, double* %activations2_0, align 8, !bitwidth !11, !dep_idx !1624, !deps !1625
  br label %for.inc.split7, !bitwidth !11

branch4:                                          ; preds = %for.inc.split
  store i1 true, i1* %write_flag3_0, align 1, !bitwidth !11, !dep_idx !1628, !deps !1629
  store double %dactivations, double* %dactivations3_04, align 8, !bitwidth !11, !dep_idx !1631, !deps !1632
  br label %for.inc.split12, !bitwidth !11

branch5:                                          ; preds = %for.inc.split
  store i1 true, i1* %write_flag6_0, align 1, !bitwidth !11, !dep_idx !1634, !deps !1635
  store double %dactivations, double* %dactivations4_03, align 8, !bitwidth !11, !dep_idx !1637, !deps !1638
  br label %for.inc.split12, !bitwidth !11
}

; Function Attrs: noinline nounwind
define internal fastcc void @RELU([64 x double]* noalias nocapture align 512 %activations, [64 x double]* noalias nocapture align 512 %dactivations) unnamed_addr #2 {
entry:
  %i = alloca i7, align 1, !bitwidth !216
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42)
  store i7 0, i7* %i, align 1, !bitwidth !11, !dep_idx !1640, !deps !1641
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %entry
  %i_37 = load i7, i7* %i, align 1, !bitwidth !227, !dep_idx !1644, !deps !1645
  %icmp_ln36 = icmp eq i7 %i_37, -64, !bitwidth !198
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64)
  %add_ln36 = add nuw i7 %i_37, 1, !bitwidth !227
  br i1 %icmp_ln36, label %for.end, label %for.inc.split, !llvm.loop !1648, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln36 = zext i7 %i_37 to i64, !bitwidth !248
  call void (...) @_ssdm_op_SpecLoopName([11 x i8]* @empty_2)
  %activations_addr = getelementptr inbounds [64 x double], [64 x double]* %activations, i64 0, i64 %zext_ln36, !bitwidth !11
  %activations_load = load double, double* %activations_addr, align 8, !bitwidth !20, !dep_idx !1656, !deps !1657
  %sub = fsub double 1.000000e+00, %activations_load, !bitwidth !20
  %mul = fmul double %activations_load, %sub, !bitwidth !20
  %dactivations_addr = getelementptr inbounds [64 x double], [64 x double]* %dactivations, i64 0, i64 %zext_ln36, !bitwidth !11
  store double %mul, double* %dactivations_addr, align 8, !bitwidth !11
  %bitcast_ln39 = bitcast double %activations_load to i64, !bitwidth !20
  %xor_ln39 = xor i64 %bitcast_ln39, -9223372036854775808, !bitwidth !20
  %bitcast_ln39_2 = bitcast i64 %xor_ln39 to double, !bitwidth !20
  %tmp = call double @llvm.exp.f64(double %bitcast_ln39_2), !bitwidth !20
  %add = fadd double %tmp, 1.000000e+00, !bitwidth !20
  %div = fdiv double 1.000000e+00, %add, !bitwidth !20
  store double %div, double* %activations_addr, align 8, !bitwidth !11, !dep_idx !1659, !deps !1660
  store i7 %add_ln36, i7* %i, align 1, !bitwidth !11, !dep_idx !1662, !deps !1663
  br label %for.inc, !llvm.loop !1648, !bitwidth !11

for.end:                                          ; preds = %for.inc
  ret void, !bitwidth !11
}

attributes #0 = { noinline }
attributes #1 = { noinline readonly }
attributes #2 = { noinline nounwind }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }
attributes #5 = { nounwind readnone }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!blackbox_cfg = !{!1}
!llvm.module.flags = !{!2, !3}
!llvm.map.gv = !{}
!bitwidth_g = !{!4, !76, !98, !103, !108, !112, !122, !126, !131, !136, !140, !145, !166, !169, !171, !176}

!0 = !{!"clang version 7.0.0 "}
!1 = !{}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"reflow.full.lowering", i32 1}
!4 = !{void ([832 x i64]*, [4096 x i64]*, [192 x i64]*, [832 x double]*, [4096 x double]*, [192 x double]*, [64 x i64]*, [64 x i64]*, [3 x i64]*, [64 x double]*, [64 x double]*, double, double, double)* @update_weights.1, !5}
!5 = !{!6, !8, !9, !10, !12, !13, !14, !15, !16, !17, !18, !19, !21, !22, !23, !25, !27, !28, !29, !31, !32, !34, !36, !37, !39, !41, !42, !44, !46, !47, !49, !50, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !65, !66, !68, !69, !71, !72, !73, !74, !75}
!6 = !{!"Arg", i32 0, !7}
!7 = !{i32 0, i32 0, i32 64, i32 2}
!8 = !{!"Arg", i32 1, !7}
!9 = !{!"Arg", i32 2, !7}
!10 = !{!"Arg", i32 3, !11}
!11 = !{i32 0, i32 0, i32 0, i32 2}
!12 = !{!"Arg", i32 4, !11}
!13 = !{!"Arg", i32 5, !11}
!14 = !{!"Arg", i32 6, !7}
!15 = !{!"Arg", i32 7, !7}
!16 = !{!"Arg", i32 8, !7}
!17 = !{!"Arg", i32 9, !11}
!18 = !{!"Arg", i32 10, !11}
!19 = !{!"Arg", i32 11, !20}
!20 = !{i32 64, i32 64, i32 0, i32 2}
!21 = !{!"Arg", i32 12, !20}
!22 = !{!"Arg", i32 13, !20}
!23 = !{i32 1, !24}
!24 = !{i32 1, i32 32, i32 0, i32 0}
!25 = !{[10 x i8]* @empty_8, !26}
!26 = !{i32 0, i32 0, i32 8, i32 2}
!27 = !{i32 0, !24}
!28 = !{[1 x i8]* @empty_42, !26}
!29 = !{i32 -1, !30}
!30 = !{i32 1, i32 32, i32 0, i32 1}
!31 = !{double 0.000000e+00, !20}
!32 = !{i4 0, !33}
!33 = !{i32 1, i32 4, i32 0, i32 0}
!34 = !{i4 -3, !35}
!35 = !{i32 3, i32 4, i32 0, i32 1}
!36 = !{i4 1, !33}
!37 = !{i7 0, !38}
!38 = !{i32 1, i32 7, i32 0, i32 0}
!39 = !{i64 13, !40}
!40 = !{i32 5, i32 64, i32 0, i32 1}
!41 = !{[21 x i8]* @empty_40, !26}
!42 = !{i6 0, !43}
!43 = !{i32 1, i32 6, i32 0, i32 0}
!44 = !{i7 -64, !45}
!45 = !{i32 7, i32 7, i32 0, i32 1}
!46 = !{i7 1, !38}
!47 = !{i64 64, !48}
!48 = !{i32 8, i32 64, i32 0, i32 1}
!49 = !{[23 x i8]* @empty_39, !26}
!50 = !{i64 0, !51}
!51 = !{i32 1, i32 64, i32 0, i32 0}
!52 = !{double 1.000000e-02, !20}
!53 = !{[21 x i8]* @empty_38, !26}
!54 = !{[21 x i8]* @empty_37, !26}
!55 = !{[23 x i8]* @empty_36, !26}
!56 = !{[21 x i8]* @empty_35, !26}
!57 = !{[21 x i8]* @empty_34, !26}
!58 = !{[23 x i8]* @empty_33, !26}
!59 = !{[21 x i8]* @empty_21, !26}
!60 = !{[21 x i8]* @empty_18, !26}
!61 = !{[23 x i8]* @empty_41, !26}
!62 = !{[21 x i8]* @empty_29, !26}
!63 = !{i2 0, !64}
!64 = !{i32 1, i32 2, i32 0, i32 0}
!65 = !{[21 x i8]* @empty_28, !26}
!66 = !{i2 -1, !67}
!67 = !{i32 1, i32 2, i32 0, i32 1}
!68 = !{i2 1, !64}
!69 = !{i64 3, !70}
!70 = !{i32 3, i32 64, i32 0, i32 1}
!71 = !{[23 x i8]* @empty_27, !26}
!72 = !{[22 x i8]* @empty_26, !26}
!73 = !{[22 x i8]* @empty_25, !26}
!74 = !{[24 x i8]* @empty_24, !26}
!75 = !{[22 x i8]* @empty_23, !26}
!76 = !{{ double, double, double } (double, double, double, [489 x i64]*, double, double, double, double, double, double, i9)* @take_difference.1, !77}
!77 = !{!78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !23, !25, !27, !28, !29, !90, !63, !66, !68, !69, !92, !50, !93, !95, !96}
!78 = !{!"Arg", i32 0, !20}
!79 = !{!"Arg", i32 1, !20}
!80 = !{!"Arg", i32 2, !20}
!81 = !{!"Arg", i32 3, !7}
!82 = !{!"Arg", i32 4, !20}
!83 = !{!"Arg", i32 5, !20}
!84 = !{!"Arg", i32 6, !20}
!85 = !{!"Arg", i32 7, !20}
!86 = !{!"Arg", i32 8, !20}
!87 = !{!"Arg", i32 9, !20}
!88 = !{!"Arg", i32 10, !89}
!89 = !{i32 9, i32 9, i32 0, i32 2}
!90 = !{i1 false, !91}
!91 = !{i32 1, i32 1, i32 0, i32 0}
!92 = !{[22 x i8]* @empty_15, !26}
!93 = !{i64 -9223372036854775808, !94}
!94 = !{i32 64, i32 64, i32 0, i32 1}
!95 = !{i1 true, !91}
!96 = !{{ double, double, double } undef, !97}
!97 = !{i32 0, i32 0, i32 0, i32 0}
!98 = !{{ double, double, double } (double, double, double, double, double, double)* @soft_max, !99}
!99 = !{!78, !79, !80, !100, !82, !83, !23, !27, !28, !63, !31, !66, !68, !90, !69, !101, !93, !102, !95, !96}
!100 = !{!"Arg", i32 3, !20}
!101 = !{[15 x i8]* @empty_4, !26}
!102 = !{[15 x i8]* @empty_3, !26}
!103 = !{void ([64 x i64]*, [4096 x i64]*, [64 x double]*, [64 x double]*)* @matrix_vector_product_with_bias_second_layer.1, !104}
!104 = !{!6, !8, !105, !10, !23, !25, !27, !28, !29, !37, !44, !46, !47, !106, !50, !42, !31, !107}
!105 = !{!"Arg", i32 2, !11}
!106 = !{[51 x i8]* @empty_12, !26}
!107 = !{[53 x i8]* @empty_11, !26}
!108 = !{{ double, double, double } ([3 x i64]*, [192 x i64]*, double, double, double, [64 x double]*)* @matrix_vector_product_with_bias_output_layer.1, !109}
!109 = !{!6, !8, !80, !100, !82, !13, !23, !25, !27, !28, !29, !63, !66, !68, !69, !110, !42, !37, !31, !44, !46, !47, !111, !50}
!110 = !{[51 x i8]* @empty_14, !26}
!111 = !{[53 x i8]* @empty_13, !26}
!112 = !{void ([64 x i64]*, [832 x i64]*, [64 x double]*, [2119 x i64]*, i12)* @matrix_vector_product_with_bias_input_layer.1, !113}
!113 = !{!6, !8, !105, !81, !114, !23, !25, !27, !28, !29, !37, !116, !118, !44, !46, !47, !120, !50, !32, !31, !34, !36, !39, !121}
!114 = !{!"Arg", i32 4, !115}
!115 = !{i32 12, i32 12, i32 0, i32 2}
!116 = !{i10 0, !117}
!117 = !{i32 1, i32 10, i32 0, i32 0}
!118 = !{i10 13, !119}
!119 = !{i32 5, i32 10, i32 0, i32 1}
!120 = !{[50 x i8]* @empty, !26}
!121 = !{[52 x i8]* @empty_20, !26}
!122 = !{void ([192 x i64]*, double, double, double, [64 x double]*, [64 x double]*)* @get_oracle_activations2.1, !123}
!123 = !{!6, !79, !80, !100, !12, !13, !23, !25, !27, !28, !29, !37, !44, !46, !47, !124, !50, !63, !31, !66, !68, !69, !125}
!124 = !{[30 x i8]* @empty_17, !26}
!125 = !{[32 x i8]* @empty_16, !26}
!126 = !{void ([4096 x i64]*, [64 x double]*, [64 x double]*, [64 x double]*)* @get_oracle_activations1.1, !127}
!127 = !{!6, !128, !105, !10, !23, !25, !27, !28, !29, !37, !44, !46, !47, !129, !50, !42, !31, !130}
!128 = !{!"Arg", i32 1, !11}
!129 = !{[30 x i8]* @empty_9, !26}
!130 = !{[32 x i8]* @empty_7, !26}
!131 = !{void ([192 x double]*, double, double, double, [64 x double]*)* @get_delta_matrix_weights3, !132}
!132 = !{!133, !79, !80, !100, !12, !23, !27, !28, !37, !44, !46, !47, !134, !50, !63, !66, !68, !69, !135}
!133 = !{!"Arg", i32 0, !11}
!134 = !{[32 x i8]* @empty_6, !26}
!135 = !{[34 x i8]* @empty_5, !26}
!136 = !{void ([4096 x double]*, [64 x double]*, [64 x double]*)* @get_delta_matrix_weights2, !137}
!137 = !{!133, !128, !105, !23, !27, !28, !37, !44, !46, !47, !138, !50, !42, !139}
!138 = !{[32 x i8]* @empty_19, !26}
!139 = !{[34 x i8]* @empty_30, !26}
!140 = !{void ([832 x double]*, [64 x double]*, [2119 x i64]*, i12)* @get_delta_matrix_weights1.1, !141}
!141 = !{!133, !128, !9, !142, !23, !25, !27, !28, !29, !32, !34, !36, !39, !143, !50, !42, !37, !44, !46, !47, !144}
!142 = !{!"Arg", i32 3, !115}
!143 = !{[32 x i8]* @empty_22, !26}
!144 = !{[34 x i8]* @empty_32, !26}
!145 = !{void ([832 x i64]*, [4096 x i64]*, [192 x i64]*, [64 x i64]*, [64 x i64]*, [3 x i64]*, [2119 x i64]*, [489 x i64]*)* @backprop, !146}
!146 = !{!6, !8, !9, !81, !147, !148, !14, !15, !23, !27, !28, !149, !25, !29, !150, !151, !153, !155, !157, !159, !160, !162, !37, !44, !46, !47, !163, !50, !31, !164, !63, !68}
!147 = !{!"Arg", i32 4, !7}
!148 = !{!"Arg", i32 5, !7}
!149 = !{[9 x i8]* @empty_10, !26}
!150 = !{i64 1, !51}
!151 = !{i8 0, !152}
!152 = !{i32 1, i32 8, i32 0, i32 0}
!153 = !{i12 0, !154}
!154 = !{i32 1, i32 12, i32 0, i32 0}
!155 = !{i12 13, !156}
!156 = !{i32 5, i32 12, i32 0, i32 1}
!157 = !{i8 -93, !158}
!158 = !{i32 8, i32 8, i32 0, i32 1}
!159 = !{i8 1, !152}
!160 = !{i64 163, !161}
!161 = !{i32 9, i32 64, i32 0, i32 1}
!162 = !{[15 x i8]* @empty_1, !26}
!163 = !{[17 x i8]* @empty_0, !26}
!164 = !{i7 3, !165}
!165 = !{i32 3, i32 7, i32 0, i32 0}
!166 = !{void ([64 x i64]*, [64 x double]*)* @add_bias_to_activations.clone.1, !167}
!167 = !{!6, !128, !23, !25, !27, !28, !29, !37, !44, !47, !46, !168, !50}
!168 = !{[30 x i8]* @empty_31, !26}
!169 = !{{ double, double, double } ([3 x i64]*, double, double, double)* @add_bias_to_activations.1, !170}
!170 = !{!6, !79, !80, !100, !23, !25, !27, !28, !29, !63, !66, !69, !68, !168, !50, !96}
!171 = !{{ double, double, double, double, double, double } (double, double, double, double, double, double)* @RELU.clone, !172}
!172 = !{!78, !79, !80, !100, !82, !83, !23, !27, !28, !90, !63, !66, !69, !68, !173, !174, !95, !93, !175}
!173 = !{[11 x i8]* @empty_2, !26}
!174 = !{double 1.000000e+00, !20}
!175 = !{{ double, double, double, double, double, double } undef, !97}
!176 = !{void ([64 x double]*, [64 x double]*)* @RELU, !177}
!177 = !{!133, !128, !23, !27, !28, !37, !44, !47, !46, !173, !50, !174, !93}
!178 = !{i32 0, i32 0, i32 4, i32 1}
!179 = !{!"user"}
!180 = !{i32 173}
!181 = !{!182, !184, !185}
!182 = !{i32 161, !183}
!183 = !{!"RAW", !"indep"}
!184 = !{i32 162, !183}
!185 = !{i32 163, !186}
!186 = !{!"WAW", !"indep"}
!187 = !{i32 166}
!188 = !{!189, !190}
!189 = !{i32 164, !183}
!190 = !{i32 165, !186}
!191 = !{i32 4, i32 4, i32 0, i32 2}
!192 = !{i32 164}
!193 = !{!194, !196}
!194 = !{i32 166, !195}
!195 = !{!"WAR", !"indep"}
!196 = !{i32 165, !197}
!197 = !{!"WAR", !"indep", i32 1, !"*", i32 -1, i1 true}
!198 = !{i32 1, i32 1, i32 0, i32 2}
!199 = distinct !{!199, !200, !212, !213}
!200 = !{i32 227, i32 5, !201, null}
!201 = !{i32 786443, !202, i32 219, i32 5, !204, i32 0}
!202 = !{i32 786443, !203, !204}
!203 = !{i32 786478, i32 0, !204, !"update_weights", !"update_weights", null, !204, i32 201, !205, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !210, i32 212}
!204 = !{i32 786473, !"data/benchmarks/backprop/backprop.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!205 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !206, i32 0, i32 0}
!206 = !{null, !207, !207, !207, !207, !207, !207, !207, !207, !207, !207, !207, !207}
!207 = !{i32 786447, null, !"", !208, i32 0, i64 64, i64 0, i32 0, i32 0, !209}
!208 = !{i32 786473, !"<unknown>", null, null}
!209 = !{i32 786468, null, !"double", null, i32 0, i64 64, i64 0, i32 0, i32 0, i32 4}
!210 = !{!211}
!211 = !{i32 0}
!212 = !{!"llvm.loop.name", !"update_weights_loop1"}
!213 = !{!"llvm.loop.tripcount", i32 13, i32 13, i32 13, !"user", !214}
!214 = !{i32 220, i32 9, !215, null}
!215 = !{i32 786443, !201, !204}
!216 = !{i32 0, i32 0, i32 7, i32 1}
!217 = !{i32 172}
!218 = !{!219, !220}
!219 = !{i32 167, !183}
!220 = !{i32 168, !186}
!221 = !{i32 176}
!222 = !{!223, !224, !225}
!223 = !{i32 169, !183}
!224 = !{i32 170, !186}
!225 = !{i32 171, !183}
!226 = !{i32 10, i32 10, i32 0, i32 2}
!227 = !{i32 7, i32 7, i32 0, i32 2}
!228 = distinct !{!228, !229, !234, !235, !239}
!229 = !{i32 226, i32 9, !230, null}
!230 = !{i32 786443, !231, i32 222, i32 9, !204, i32 0}
!231 = !{i32 786443, !232, !204}
!232 = !{i32 786443, !233, i32 219, i32 26, !204, i32 0}
!233 = !{i32 786443, !215, i32 219, i32 5, !204, i32 0}
!234 = !{!"llvm.loop.name", !"update_weights_loop1_1"}
!235 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !236}
!236 = !{i32 78, i32 9, !237, null}
!237 = !{i32 786443, !230, !238}
!238 = !{i32 786473, !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/backprop.tcl", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!239 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !240}
!240 = !{i32 223, i32 9, !241, null}
!241 = !{i32 786443, !230, !204}
!242 = !{i32 162}
!243 = !{!244, !245}
!244 = !{i32 173, !195}
!245 = !{i32 163, !246}
!246 = !{!"WAR", !"indep", i32 2, !"*", !"*", i32 -1, i1 true, i32 -1, i1 true}
!247 = !{i32 10, i32 10, i32 0, i32 0}
!248 = !{i32 64, i32 64, i32 0, i32 0}
!249 = !{i32 183}
!250 = !{!251, !253}
!251 = !{i32 181, !252}
!252 = !{!"WAR", !"indep", i32 2, !"=", !"=", i32 0, i1 true, i32 0, i1 true}
!253 = !{i32 182, !195}
!254 = !{i32 181}
!255 = !{!256, !258, !259}
!256 = !{i32 183, !257}
!257 = !{!"RAW", !"indep", i32 2, !"=", !"=", i32 0, i1 true, i32 0, i1 true}
!258 = !{i32 184, !183}
!259 = !{i32 182, !186}
!260 = !{i32 163}
!261 = !{!262, !182, !263}
!262 = !{i32 173, !186}
!263 = !{i32 162, !264}
!264 = !{!"RAW", !"indep", i32 2, !"*", !"*", i32 -1, i1 true, i32 -1, i1 true}
!265 = !{i32 165}
!266 = !{!267, !268}
!267 = !{i32 166, !186}
!268 = !{i32 164, !269}
!269 = !{!"RAW", !"indep", i32 1, !"*", i32 -1, i1 true}
!270 = !{i32 167}
!271 = !{!272, !273}
!272 = !{i32 172, !195}
!273 = !{i32 168, !197}
!274 = distinct !{!274, !275, !277, !278}
!275 = !{i32 233, i32 5, !276, null}
!276 = !{i32 786443, !202, i32 229, i32 5, !204, i32 0}
!277 = !{!"llvm.loop.name", !"update_weights_loop2"}
!278 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !279}
!279 = !{i32 230, i32 9, !280, null}
!280 = !{i32 786443, !276, !204}
!281 = !{i32 169}
!282 = !{!283, !284}
!283 = !{i32 176, !195}
!284 = !{i32 170, !197}
!285 = !{i32 179}
!286 = !{!287, !289}
!287 = !{i32 177, !288}
!288 = !{!"WAR", !"indep", i32 1, !"=", i32 0, i1 true}
!289 = !{i32 178, !195}
!290 = !{i32 177}
!291 = !{!292, !294, !295}
!292 = !{i32 179, !293}
!293 = !{!"RAW", !"indep", i32 1, !"=", i32 0, i1 true}
!294 = !{i32 180, !183}
!295 = !{i32 178, !186}
!296 = !{i32 168}
!297 = !{!298, !299}
!298 = !{i32 172, !186}
!299 = !{i32 167, !269}
!300 = !{i32 170}
!301 = !{!302, !303, !225}
!302 = !{i32 176, !186}
!303 = !{i32 169, !269}
!304 = !{i32 161}
!305 = !{!244, !306}
!306 = !{i32 163, !195}
!307 = !{i32 185}
!308 = !{!309, !310}
!309 = !{i32 174, !183}
!310 = !{i32 175, !186}
!311 = !{i32 174}
!312 = !{!313, !314}
!313 = !{i32 185, !195}
!314 = !{i32 175, !197}
!315 = distinct !{!315, !316, !318, !319}
!316 = !{i32 246, i32 5, !317, null}
!317 = !{i32 786443, !202, i32 239, i32 5, !204, i32 0}
!318 = !{!"llvm.loop.name", !"update_weights_loop3"}
!319 = !{!"llvm.loop.tripcount", i32 13, i32 13, i32 13, !"user", !320}
!320 = !{i32 240, i32 9, !321, null}
!321 = !{i32 786443, !317, !204}
!322 = distinct !{!322, !323, !328, !329, !332}
!323 = !{i32 245, i32 9, !324, null}
!324 = !{i32 786443, !325, i32 242, i32 9, !204, i32 0}
!325 = !{i32 786443, !326, !204}
!326 = !{i32 786443, !327, i32 239, i32 26, !204, i32 0}
!327 = !{i32 786443, !321, i32 239, i32 5, !204, i32 0}
!328 = !{!"llvm.loop.name", !"update_weights_loop3_1"}
!329 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !330}
!330 = !{i32 79, i32 9, !331, null}
!331 = !{i32 786443, !324, !238}
!332 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !333}
!333 = !{i32 243, i32 9, !334, null}
!334 = !{i32 786443, !324, !204}
!335 = !{i32 184}
!336 = !{!337, !338}
!337 = !{i32 181, !195}
!338 = !{i32 182, !252}
!339 = !{i32 182}
!340 = !{!341, !342, !343}
!341 = !{i32 183, !183}
!342 = !{i32 181, !186}
!343 = !{i32 184, !257}
!344 = !{i32 175}
!345 = !{!346, !347}
!346 = !{i32 185, !186}
!347 = !{i32 174, !269}
!348 = !{i32 171}
!349 = !{!283, !350}
!350 = !{i32 170, !195}
!351 = !{i32 188}
!352 = !{!353, !354}
!353 = !{i32 186, !183}
!354 = !{i32 187, !186}
!355 = !{i32 186}
!356 = !{!357, !358}
!357 = !{i32 188, !195}
!358 = !{i32 187, !197}
!359 = distinct !{!359, !360, !362, !363}
!360 = !{i32 251, i32 5, !361, null}
!361 = !{i32 786443, !202, i32 248, i32 5, !204, i32 0}
!362 = !{!"llvm.loop.name", !"update_weights_loop4"}
!363 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !364}
!364 = !{i32 249, i32 9, !365, null}
!365 = !{i32 786443, !361, !204}
!366 = !{i32 201}
!367 = !{!368, !369, !370}
!368 = !{i32 189, !183}
!369 = !{i32 190, !183}
!370 = !{i32 191, !186}
!371 = !{i32 194}
!372 = !{!373, !374}
!373 = !{i32 192, !183}
!374 = !{i32 193, !186}
!375 = !{i32 180}
!376 = !{!377, !378}
!377 = !{i32 177, !195}
!378 = !{i32 178, !288}
!379 = !{i32 178}
!380 = !{!381, !382, !383}
!381 = !{i32 179, !183}
!382 = !{i32 177, !186}
!383 = !{i32 180, !293}
!384 = !{i32 187}
!385 = !{!386, !387}
!386 = !{i32 188, !186}
!387 = !{i32 186, !269}
!388 = !{i32 192}
!389 = !{!390, !391}
!390 = !{i32 194, !195}
!391 = !{i32 193, !197}
!392 = distinct !{!392, !393, !395, !396}
!393 = !{i32 265, i32 5, !394, null}
!394 = !{i32 786443, !202, i32 257, i32 5, !204, i32 0}
!395 = !{!"llvm.loop.name", !"update_weights_loop5"}
!396 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !397}
!397 = !{i32 258, i32 9, !398, null}
!398 = !{i32 786443, !394, !204}
!399 = !{i32 200}
!400 = !{!401, !402}
!401 = !{i32 195, !183}
!402 = !{i32 196, !186}
!403 = !{i32 204}
!404 = !{!405, !406, !407}
!405 = !{i32 197, !183}
!406 = !{i32 198, !186}
!407 = !{i32 199, !183}
!408 = !{i32 6, i32 6, i32 0, i32 2}
!409 = distinct !{!409, !410, !415, !416, !419}
!410 = !{i32 264, i32 9, !411, null}
!411 = !{i32 786443, !412, i32 260, i32 9, !204, i32 0}
!412 = !{i32 786443, !413, !204}
!413 = !{i32 786443, !414, i32 257, i32 26, !204, i32 0}
!414 = !{i32 786443, !398, i32 257, i32 5, !204, i32 0}
!415 = !{!"llvm.loop.name", !"update_weights_loop5_1"}
!416 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !417}
!417 = !{i32 80, i32 9, !418, null}
!418 = !{i32 786443, !411, !238}
!419 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !420}
!420 = !{i32 261, i32 9, !421, null}
!421 = !{i32 786443, !411, !204}
!422 = !{i32 190}
!423 = !{!424, !425}
!424 = !{i32 201, !195}
!425 = !{i32 191, !246}
!426 = !{i32 12, i32 12, i32 0, i32 0}
!427 = !{i32 211}
!428 = !{!429, !430}
!429 = !{i32 209, !252}
!430 = !{i32 210, !195}
!431 = !{i32 209}
!432 = !{!433, !434, !435}
!433 = !{i32 211, !257}
!434 = !{i32 212, !183}
!435 = !{i32 210, !186}
!436 = !{i32 191}
!437 = !{!438, !368, !439}
!438 = !{i32 201, !186}
!439 = !{i32 190, !264}
!440 = !{i32 193}
!441 = !{!442, !443}
!442 = !{i32 194, !186}
!443 = !{i32 192, !269}
!444 = !{i32 195}
!445 = !{!446, !447}
!446 = !{i32 200, !195}
!447 = !{i32 196, !197}
!448 = distinct !{!448, !449, !451, !452}
!449 = !{i32 271, i32 5, !450, null}
!450 = !{i32 786443, !202, i32 267, i32 5, !204, i32 0}
!451 = !{!"llvm.loop.name", !"update_weights_loop6"}
!452 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !453}
!453 = !{i32 268, i32 9, !454, null}
!454 = !{i32 786443, !450, !204}
!455 = !{i32 197}
!456 = !{!457, !458}
!457 = !{i32 204, !195}
!458 = !{i32 198, !197}
!459 = !{i32 207}
!460 = !{!461, !462}
!461 = !{i32 205, !288}
!462 = !{i32 206, !195}
!463 = !{i32 205}
!464 = !{!465, !466, !467}
!465 = !{i32 207, !293}
!466 = !{i32 208, !183}
!467 = !{i32 206, !186}
!468 = !{i32 196}
!469 = !{!470, !471}
!470 = !{i32 200, !186}
!471 = !{i32 195, !269}
!472 = !{i32 198}
!473 = !{!474, !475, !407}
!474 = !{i32 204, !186}
!475 = !{i32 197, !269}
!476 = !{i32 189}
!477 = !{!424, !478}
!478 = !{i32 191, !195}
!479 = !{i32 213}
!480 = !{!481, !482}
!481 = !{i32 202, !183}
!482 = !{i32 203, !186}
!483 = !{i32 202}
!484 = !{!485, !486}
!485 = !{i32 213, !195}
!486 = !{i32 203, !197}
!487 = distinct !{!487, !488, !490, !491}
!488 = !{i32 284, i32 5, !489, null}
!489 = !{i32 786443, !202, i32 277, i32 5, !204, i32 0}
!490 = !{!"llvm.loop.name", !"update_weights_loop7"}
!491 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !492}
!492 = !{i32 278, i32 9, !493, null}
!493 = !{i32 786443, !489, !204}
!494 = distinct !{!494, !495, !500, !501, !504}
!495 = !{i32 283, i32 9, !496, null}
!496 = !{i32 786443, !497, i32 280, i32 9, !204, i32 0}
!497 = !{i32 786443, !498, !204}
!498 = !{i32 786443, !499, i32 277, i32 26, !204, i32 0}
!499 = !{i32 786443, !493, i32 277, i32 5, !204, i32 0}
!500 = !{!"llvm.loop.name", !"update_weights_loop7_1"}
!501 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !502}
!502 = !{i32 81, i32 9, !503, null}
!503 = !{i32 786443, !496, !238}
!504 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !505}
!505 = !{i32 281, i32 9, !506, null}
!506 = !{i32 786443, !496, !204}
!507 = !{i32 212}
!508 = !{!509, !510}
!509 = !{i32 209, !195}
!510 = !{i32 210, !252}
!511 = !{i32 210}
!512 = !{!513, !514, !515}
!513 = !{i32 211, !183}
!514 = !{i32 209, !186}
!515 = !{i32 212, !257}
!516 = !{i32 203}
!517 = !{!518, !519}
!518 = !{i32 213, !186}
!519 = !{i32 202, !269}
!520 = !{i32 199}
!521 = !{!457, !522}
!522 = !{i32 198, !195}
!523 = !{i32 216}
!524 = !{!525, !526}
!525 = !{i32 214, !183}
!526 = !{i32 215, !186}
!527 = !{i32 214}
!528 = !{!529, !530}
!529 = !{i32 216, !195}
!530 = !{i32 215, !197}
!531 = distinct !{!531, !532, !534, !535}
!532 = !{i32 289, i32 5, !533, null}
!533 = !{i32 786443, !202, i32 286, i32 5, !204, i32 0}
!534 = !{!"llvm.loop.name", !"update_weights_loop8"}
!535 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !536}
!536 = !{i32 287, i32 9, !537, null}
!537 = !{i32 786443, !533, !204}
!538 = !{i32 229}
!539 = !{!540, !541, !542}
!540 = !{i32 217, !183}
!541 = !{i32 218, !183}
!542 = !{i32 219, !186}
!543 = !{i32 222}
!544 = !{!545, !546}
!545 = !{i32 220, !183}
!546 = !{i32 221, !186}
!547 = !{i32 208}
!548 = !{!549, !550}
!549 = !{i32 205, !195}
!550 = !{i32 206, !288}
!551 = !{i32 206}
!552 = !{!553, !554, !555}
!553 = !{i32 207, !183}
!554 = !{i32 205, !186}
!555 = !{i32 208, !293}
!556 = !{i32 215}
!557 = !{!558, !559}
!558 = !{i32 216, !186}
!559 = !{i32 214, !269}
!560 = !{i32 220}
!561 = !{!562, !563}
!562 = !{i32 222, !195}
!563 = !{i32 221, !197}
!564 = distinct !{!564, !565, !567, !568}
!565 = !{i32 303, i32 5, !566, null}
!566 = !{i32 786443, !202, i32 295, i32 5, !204, i32 0}
!567 = !{!"llvm.loop.name", !"update_weights_loop9"}
!568 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !569}
!569 = !{i32 296, i32 9, !570, null}
!570 = !{i32 786443, !566, !204}
!571 = !{i32 0, i32 0, i32 2, i32 1}
!572 = !{i32 228}
!573 = !{!574, !575}
!574 = !{i32 223, !183}
!575 = !{i32 224, !186}
!576 = !{i32 232}
!577 = !{!578, !579, !580}
!578 = !{i32 225, !183}
!579 = !{i32 226, !186}
!580 = !{i32 227, !183}
!581 = !{i32 8, i32 8, i32 0, i32 0}
!582 = !{i32 8, i32 8, i32 0, i32 2}
!583 = !{i32 2, i32 2, i32 0, i32 2}
!584 = distinct !{!584, !585, !590, !591, !594}
!585 = !{i32 302, i32 9, !586, null}
!586 = !{i32 786443, !587, i32 298, i32 9, !204, i32 0}
!587 = !{i32 786443, !588, !204}
!588 = !{i32 786443, !589, i32 295, i32 26, !204, i32 0}
!589 = !{i32 786443, !570, i32 295, i32 5, !204, i32 0}
!590 = !{!"llvm.loop.name", !"update_weights_loop9_1"}
!591 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !592}
!592 = !{i32 82, i32 9, !593, null}
!593 = !{i32 786443, !586, !238}
!594 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !595}
!595 = !{i32 299, i32 9, !596, null}
!596 = !{i32 786443, !586, !204}
!597 = !{i32 218}
!598 = !{!599, !600}
!599 = !{i32 229, !195}
!600 = !{i32 219, !246}
!601 = !{i32 239}
!602 = !{!603, !604}
!603 = !{i32 237, !252}
!604 = !{i32 238, !195}
!605 = !{i32 237}
!606 = !{!607, !608, !609}
!607 = !{i32 239, !257}
!608 = !{i32 240, !183}
!609 = !{i32 238, !186}
!610 = !{i32 219}
!611 = !{!612, !540, !613}
!612 = !{i32 229, !186}
!613 = !{i32 218, !264}
!614 = !{i32 221}
!615 = !{!616, !617}
!616 = !{i32 222, !186}
!617 = !{i32 220, !269}
!618 = !{i32 223}
!619 = !{!620, !621}
!620 = !{i32 228, !195}
!621 = !{i32 224, !197}
!622 = distinct !{!622, !623, !625, !626}
!623 = !{i32 309, i32 5, !624, null}
!624 = !{i32 786443, !202, i32 305, i32 5, !204, i32 0}
!625 = !{!"llvm.loop.name", !"update_weights_loop10"}
!626 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !627}
!627 = !{i32 306, i32 9, !628, null}
!628 = !{i32 786443, !624, !204}
!629 = !{i32 225}
!630 = !{!631, !632}
!631 = !{i32 232, !195}
!632 = !{i32 226, !197}
!633 = !{i32 235}
!634 = !{!635, !636}
!635 = !{i32 233, !288}
!636 = !{i32 234, !195}
!637 = !{i32 233}
!638 = !{!639, !640, !641}
!639 = !{i32 235, !293}
!640 = !{i32 236, !183}
!641 = !{i32 234, !186}
!642 = !{i32 224}
!643 = !{!644, !645}
!644 = !{i32 228, !186}
!645 = !{i32 223, !269}
!646 = !{i32 226}
!647 = !{!648, !649, !580}
!648 = !{i32 232, !186}
!649 = !{i32 225, !269}
!650 = !{i32 217}
!651 = !{!599, !652}
!652 = !{i32 219, !195}
!653 = !{i32 241}
!654 = !{!655, !656}
!655 = !{i32 230, !183}
!656 = !{i32 231, !186}
!657 = !{i32 230}
!658 = !{!659, !660}
!659 = !{i32 241, !195}
!660 = !{i32 231, !197}
!661 = distinct !{!661, !662, !664, !665}
!662 = !{i32 322, i32 5, !663, null}
!663 = !{i32 786443, !202, i32 315, i32 5, !204, i32 0}
!664 = !{!"llvm.loop.name", !"update_weights_loop11"}
!665 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !666}
!666 = !{i32 316, i32 9, !667, null}
!667 = !{i32 786443, !663, !204}
!668 = distinct !{!668, !669, !674, !675, !678}
!669 = !{i32 321, i32 9, !670, null}
!670 = !{i32 786443, !671, i32 318, i32 9, !204, i32 0}
!671 = !{i32 786443, !672, !204}
!672 = !{i32 786443, !673, i32 315, i32 26, !204, i32 0}
!673 = !{i32 786443, !667, i32 315, i32 5, !204, i32 0}
!674 = !{!"llvm.loop.name", !"update_weights_loop11_1"}
!675 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !676}
!676 = !{i32 83, i32 9, !677, null}
!677 = !{i32 786443, !670, !238}
!678 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !679}
!679 = !{i32 319, i32 9, !680, null}
!680 = !{i32 786443, !670, !204}
!681 = !{i32 240}
!682 = !{!683, !684}
!683 = !{i32 237, !195}
!684 = !{i32 238, !252}
!685 = !{i32 238}
!686 = !{!687, !688, !689}
!687 = !{i32 239, !183}
!688 = !{i32 237, !186}
!689 = !{i32 240, !257}
!690 = !{i32 231}
!691 = !{!692, !693}
!692 = !{i32 241, !186}
!693 = !{i32 230, !269}
!694 = !{i32 227}
!695 = !{!631, !696}
!696 = !{i32 226, !195}
!697 = !{i32 244}
!698 = !{!699, !700}
!699 = !{i32 242, !183}
!700 = !{i32 243, !186}
!701 = !{i32 242}
!702 = !{!703, !704}
!703 = !{i32 244, !195}
!704 = !{i32 243, !197}
!705 = distinct !{!705, !706, !708, !709}
!706 = !{i32 327, i32 5, !707, null}
!707 = !{i32 786443, !202, i32 324, i32 5, !204, i32 0}
!708 = !{!"llvm.loop.name", !"update_weights_loop12"}
!709 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !710}
!710 = !{i32 325, i32 9, !711, null}
!711 = !{i32 786443, !707, !204}
!712 = !{i32 236}
!713 = !{!714, !715}
!714 = !{i32 233, !195}
!715 = !{i32 234, !288}
!716 = !{i32 234}
!717 = !{!718, !719, !720}
!718 = !{i32 235, !183}
!719 = !{i32 233, !186}
!720 = !{i32 236, !293}
!721 = !{i32 243}
!722 = !{!723, !724}
!723 = !{i32 244, !186}
!724 = !{i32 242, !269}
!725 = !{i32 0, i32 0, i32 1, i32 0}
!726 = !{i32 157}
!727 = !{!728, !729}
!728 = !{i32 143, !183}
!729 = !{i32 144, !186}
!730 = !{i32 154}
!731 = !{!732, !733}
!732 = !{i32 145, !183}
!733 = !{i32 146, !186}
!734 = !{i32 153}
!735 = !{!736, !737}
!736 = !{i32 147, !183}
!737 = !{i32 148, !186}
!738 = !{i32 151}
!739 = !{!740, !741}
!740 = !{i32 149, !183}
!741 = !{i32 150, !186}
!742 = !{i32 149}
!743 = !{!744, !745}
!744 = !{i32 151, !195}
!745 = !{i32 150, !197}
!746 = distinct !{!746, !747, !753, !754}
!747 = !{i32 117, i32 5, !748, null}
!748 = !{i32 786443, !749, i32 114, i32 5, !204, i32 0}
!749 = !{i32 786443, !750, !204}
!750 = !{i32 786478, i32 0, !204, !"take_difference", !"take_difference", null, !204, i32 108, !751, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !210, i32 111}
!751 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !752, i32 0, i32 0}
!752 = !{null, !207, !207, !207, !207}
!753 = !{!"llvm.loop.name", !"take_difference_loop1"}
!754 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !755}
!755 = !{i32 115, i32 9, !756, null}
!756 = !{i32 786443, !748, !204}
!757 = !{i32 9, i32 9, i32 0, i32 0}
!758 = !{i32 2, i32 0, i32 0, i32 2}
!759 = !{i32 156}
!760 = !{!761}
!761 = !{i32 159, !183}
!762 = !{i32 148}
!763 = !{!764, !736}
!764 = !{i32 153, !186}
!765 = !{i32 150}
!766 = !{!767, !768}
!767 = !{i32 151, !186}
!768 = !{i32 149, !269}
!769 = !{i32 158}
!770 = !{!771}
!771 = !{i32 152, !195}
!772 = !{i32 147}
!773 = !{!774, !775}
!774 = !{i32 153, !195}
!775 = !{i32 148, !195}
!776 = !{i32 145}
!777 = !{!778, !779}
!778 = !{i32 154, !195}
!779 = !{i32 146, !195}
!780 = !{i32 160}
!781 = !{!782}
!782 = !{i32 155, !195}
!783 = !{i32 159}
!784 = !{!785}
!785 = !{i32 156, !195}
!786 = !{i32 143}
!787 = !{!788, !789}
!788 = !{i32 157, !195}
!789 = !{i32 144, !195}
!790 = !{i32 144}
!791 = !{!792, !728}
!792 = !{i32 157, !186}
!793 = !{i32 155}
!794 = !{!795}
!795 = !{i32 160, !183}
!796 = !{i32 146}
!797 = !{!798, !732}
!798 = !{i32 154, !186}
!799 = !{i32 152}
!800 = !{!801}
!801 = !{i32 158, !183}
!802 = !{i32 123}
!803 = !{!804, !805}
!804 = !{i32 118, !183}
!805 = !{i32 119, !186}
!806 = !{i32 132}
!807 = !{!808, !809, !810}
!808 = !{i32 120, !183}
!809 = !{i32 121, !186}
!810 = !{i32 122, !183}
!811 = !{i32 118}
!812 = !{!813, !814}
!813 = !{i32 123, !195}
!814 = !{i32 119, !197}
!815 = distinct !{!815, !816, !822, !823}
!816 = !{i32 25, i32 5, !817, null}
!817 = !{i32 786443, !818, i32 22, i32 5, !204, i32 0}
!818 = !{i32 786443, !819, !204}
!819 = !{i32 786478, i32 0, !204, !"soft_max", !"soft_max", null, !204, i32 16, !820, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !210, i32 16}
!820 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !821, i32 0, i32 0}
!821 = !{null, !207, !207}
!822 = !{!"llvm.loop.name", !"soft_max_loop1"}
!823 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !824}
!824 = !{i32 23, i32 9, !825, null}
!825 = !{i32 786443, !817, !204}
!826 = !{i32 139}
!827 = !{!828, !829}
!828 = !{i32 124, !183}
!829 = !{i32 125, !186}
!830 = !{i32 136}
!831 = !{!832, !833}
!832 = !{i32 126, !183}
!833 = !{i32 127, !186}
!834 = !{i32 135}
!835 = !{!836, !837}
!836 = !{i32 128, !183}
!837 = !{i32 129, !186}
!838 = !{i32 133}
!839 = !{!840, !841}
!840 = !{i32 130, !183}
!841 = !{i32 131, !186}
!842 = !{i32 120}
!843 = !{!844, !845}
!844 = !{i32 132, !195}
!845 = !{i32 121, !197}
!846 = !{i32 119}
!847 = !{!848, !849}
!848 = !{i32 123, !186}
!849 = !{i32 118, !269}
!850 = !{i32 121}
!851 = !{!852, !853, !810}
!852 = !{i32 132, !186}
!853 = !{i32 120, !269}
!854 = !{i32 130}
!855 = !{!856, !857}
!856 = !{i32 133, !195}
!857 = !{i32 131, !197}
!858 = distinct !{!858, !859, !861, !862}
!859 = !{i32 30, i32 5, !860, null}
!860 = !{i32 786443, !818, i32 27, i32 5, !204, i32 0}
!861 = !{!"llvm.loop.name", !"soft_max_loop2"}
!862 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !863}
!863 = !{i32 28, i32 9, !864, null}
!864 = !{i32 786443, !860, !204}
!865 = !{i32 122}
!866 = !{!844, !867}
!867 = !{i32 121, !195}
!868 = !{i32 138}
!869 = !{!870}
!870 = !{i32 141, !183}
!871 = !{i32 129}
!872 = !{!873, !836}
!873 = !{i32 135, !186}
!874 = !{i32 131}
!875 = !{!876, !877}
!876 = !{i32 133, !186}
!877 = !{i32 130, !269}
!878 = !{i32 140}
!879 = !{!880}
!880 = !{i32 134, !195}
!881 = !{i32 128}
!882 = !{!883, !884}
!883 = !{i32 135, !195}
!884 = !{i32 129, !195}
!885 = !{i32 126}
!886 = !{!887, !888}
!887 = !{i32 136, !195}
!888 = !{i32 127, !195}
!889 = !{i32 142}
!890 = !{!891}
!891 = !{i32 137, !195}
!892 = !{i32 141}
!893 = !{!894}
!894 = !{i32 138, !195}
!895 = !{i32 124}
!896 = !{!897, !898}
!897 = !{i32 139, !195}
!898 = !{i32 125, !195}
!899 = !{i32 125}
!900 = !{!901, !828}
!901 = !{i32 139, !186}
!902 = !{i32 137}
!903 = !{!904}
!904 = !{i32 142, !183}
!905 = !{i32 127}
!906 = !{!907, !832}
!907 = !{i32 136, !186}
!908 = !{i32 134}
!909 = !{!910}
!910 = !{i32 140, !183}
!911 = !{i32 115}
!912 = !{!913, !914}
!913 = !{i32 113, !183}
!914 = !{i32 114, !186}
!915 = !{i32 113}
!916 = !{!917, !918}
!917 = !{i32 115, !195}
!918 = !{i32 114, !197}
!919 = distinct !{!919, !920, !924, !925}
!920 = !{i32 86, i32 5, !921, null}
!921 = !{i32 786443, !922, i32 78, i32 5, !204, i32 0}
!922 = !{i32 786443, !923, !204}
!923 = !{i32 786478, i32 0, !204, !"matrix_vector_product_with_bias_second_layer", !"matrix_vector_product_with_bias_second_layer", null, !204, i32 72, !751, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([64 x i64]*, [4096 x i64]*, [64 x double]*, [64 x double]*)* @matrix_vector_product_with_bias_second_layer.1, null, null, !210, i32 75}
!924 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_second_layer_loop1"}
!925 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !926}
!926 = !{i32 79, i32 9, !927, null}
!927 = !{i32 786443, !921, !204}
!928 = distinct !{!928, !929, !934, !935, !938}
!929 = !{i32 85, i32 9, !930, null}
!930 = !{i32 786443, !931, i32 82, i32 9, !204, i32 0}
!931 = !{i32 786443, !932, !204}
!932 = !{i32 786443, !933, i32 78, i32 29, !204, i32 0}
!933 = !{i32 786443, !927, i32 78, i32 5, !204, i32 0}
!934 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_second_layer_loop1_1"}
!935 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !936}
!936 = !{i32 71, i32 9, !937, null}
!937 = !{i32 786443, !930, !238}
!938 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !939}
!939 = !{i32 83, i32 9, !940, null}
!940 = !{i32 786443, !930, !204}
!941 = !{i32 116}
!942 = !{!943}
!943 = !{i32 117, !944}
!944 = !{!"Unknown", !"indep"}
!945 = !{i32 114}
!946 = !{!947, !948}
!947 = !{i32 115, !186}
!948 = !{i32 113, !269}
!949 = !{i32 117}
!950 = !{!951}
!951 = !{i32 116, !944}
!952 = !{i32 112}
!953 = !{!954, !955}
!954 = !{i32 101, !183}
!955 = !{i32 102, !186}
!956 = !{i32 111}
!957 = !{!958, !959}
!958 = !{i32 103, !183}
!959 = !{i32 104, !186}
!960 = !{i32 110}
!961 = !{!962, !963}
!962 = !{i32 105, !183}
!963 = !{i32 106, !186}
!964 = !{i32 109}
!965 = !{!966, !967}
!966 = !{i32 107, !183}
!967 = !{i32 108, !186}
!968 = !{i32 107}
!969 = !{!970, !971}
!970 = !{i32 109, !195}
!971 = !{i32 108, !197}
!972 = distinct !{!972, !973, !977, !978}
!973 = !{i32 104, i32 5, !974, null}
!974 = !{i32 786443, !975, i32 96, i32 5, !204, i32 0}
!975 = !{i32 786443, !976, !204}
!976 = !{i32 786478, i32 0, !204, !"matrix_vector_product_with_bias_output_layer", !"matrix_vector_product_with_bias_output_layer", null, !204, i32 90, !751, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !210, i32 93}
!977 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_output_layer_loop1"}
!978 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !979}
!979 = !{i32 97, i32 9, !980, null}
!980 = !{i32 786443, !974, !204}
!981 = distinct !{!981, !982, !987, !988, !991}
!982 = !{i32 103, i32 9, !983, null}
!983 = !{i32 786443, !984, i32 100, i32 9, !204, i32 0}
!984 = !{i32 786443, !985, !204}
!985 = !{i32 786443, !986, i32 96, i32 27, !204, i32 0}
!986 = !{i32 786443, !980, i32 96, i32 5, !204, i32 0}
!987 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_output_layer_loop1_1"}
!988 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !989}
!989 = !{i32 72, i32 9, !990, null}
!990 = !{i32 786443, !983, !238}
!991 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !992}
!992 = !{i32 101, i32 9, !993, null}
!993 = !{i32 786443, !983, !204}
!994 = !{i32 102}
!995 = !{!996, !954}
!996 = !{i32 112, !186}
!997 = !{i32 108}
!998 = !{!999, !1000}
!999 = !{i32 109, !186}
!1000 = !{i32 107, !269}
!1001 = !{i32 105}
!1002 = !{!1003, !1004}
!1003 = !{i32 110, !195}
!1004 = !{i32 106, !195}
!1005 = !{i32 103}
!1006 = !{!1007, !1008}
!1007 = !{i32 111, !195}
!1008 = !{i32 104, !195}
!1009 = !{i32 101}
!1010 = !{!1011, !1012}
!1011 = !{i32 112, !195}
!1012 = !{i32 102, !195}
!1013 = !{i32 104}
!1014 = !{!1015, !958}
!1015 = !{i32 111, !186}
!1016 = !{i32 106}
!1017 = !{!1018, !962}
!1018 = !{i32 110, !186}
!1019 = !{i32 0, i32 0, i32 10, i32 1}
!1020 = !{i32 98}
!1021 = !{!1022, !1023}
!1022 = !{i32 93, !183}
!1023 = !{i32 94, !186}
!1024 = !{i32 97}
!1025 = !{!1026, !1027}
!1026 = !{i32 95, !183}
!1027 = !{i32 96, !186}
!1028 = !{i32 95}
!1029 = !{!1030, !1031}
!1030 = !{i32 97, !195}
!1031 = !{i32 96, !197}
!1032 = !{i32 93}
!1033 = !{!1034, !1035}
!1034 = !{i32 98, !195}
!1035 = !{i32 94, !197}
!1036 = distinct !{!1036, !1037, !1041, !1042}
!1037 = !{i32 68, i32 5, !1038, null}
!1038 = !{i32 786443, !1039, i32 60, i32 5, !204, i32 0}
!1039 = !{i32 786443, !1040, !204}
!1040 = !{i32 786478, i32 0, !204, !"matrix_vector_product_with_bias_input_layer", !"matrix_vector_product_with_bias_input_layer", null, !204, i32 54, !751, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([64 x i64]*, [832 x i64]*, [64 x double]*, [2119 x i64]*, i12)* @matrix_vector_product_with_bias_input_layer.1, null, null, !210, i32 57}
!1041 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_input_layer_loop1"}
!1042 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1043}
!1043 = !{i32 61, i32 9, !1044, null}
!1044 = !{i32 786443, !1038, !204}
!1045 = distinct !{!1045, !1046, !1051, !1052, !1055}
!1046 = !{i32 67, i32 9, !1047, null}
!1047 = !{i32 786443, !1048, i32 64, i32 9, !204, i32 0}
!1048 = !{i32 786443, !1049, !204}
!1049 = !{i32 786443, !1050, i32 60, i32 28, !204, i32 0}
!1050 = !{i32 786443, !1044, i32 60, i32 5, !204, i32 0}
!1051 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_input_layer_loop1_1"}
!1052 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1053}
!1053 = !{i32 70, i32 9, !1054, null}
!1054 = !{i32 786443, !1047, !238}
!1055 = !{!"llvm.loop.tripcount", i32 13, i32 13, i32 13, !"user", !1056}
!1056 = !{i32 65, i32 9, !1057, null}
!1057 = !{i32 786443, !1047, !204}
!1058 = !{i32 99}
!1059 = !{!1060}
!1060 = !{i32 100, !944}
!1061 = !{i32 94}
!1062 = !{!1063, !1064}
!1063 = !{i32 98, !186}
!1064 = !{i32 93, !269}
!1065 = !{i32 96}
!1066 = !{!1067, !1068}
!1067 = !{i32 97, !186}
!1068 = !{i32 95, !269}
!1069 = !{i32 100}
!1070 = !{!1071}
!1071 = !{i32 99, !944}
!1072 = !{i32 92}
!1073 = !{!1074, !1075}
!1074 = !{i32 90, !183}
!1075 = !{i32 91, !186}
!1076 = !{i32 90}
!1077 = !{!1078, !1079}
!1078 = !{i32 92, !195}
!1079 = !{i32 91, !197}
!1080 = distinct !{!1080, !1081, !1085, !1086}
!1081 = !{i32 150, i32 5, !1082, null}
!1082 = !{i32 786443, !1083, i32 141, i32 5, !204, i32 0}
!1083 = !{i32 786443, !1084, !204}
!1084 = !{i32 786478, i32 0, !204, !"get_oracle_activations2", !"get_oracle_activations2", null, !204, i32 135, !751, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !210, i32 138}
!1085 = !{!"llvm.loop.name", !"get_oracle_activations2_loop1"}
!1086 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1087}
!1087 = !{i32 142, i32 9, !1088, null}
!1088 = !{i32 786443, !1082, !204}
!1089 = distinct !{!1089, !1090, !1095, !1096, !1099}
!1090 = !{i32 148, i32 9, !1091, null}
!1091 = !{i32 786443, !1092, i32 145, i32 9, !204, i32 0}
!1092 = !{i32 786443, !1093, !204}
!1093 = !{i32 786443, !1094, i32 141, i32 30, !204, i32 0}
!1094 = !{i32 786443, !1088, i32 141, i32 5, !204, i32 0}
!1095 = !{!"llvm.loop.name", !"get_oracle_activations2_loop1_1"}
!1096 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1097}
!1097 = !{i32 74, i32 9, !1098, null}
!1098 = !{i32 786443, !1091, !238}
!1099 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !1100}
!1100 = !{i32 146, i32 9, !1101, null}
!1101 = !{i32 786443, !1091, !204}
!1102 = !{i32 91}
!1103 = !{!1104, !1105}
!1104 = !{i32 92, !186}
!1105 = !{i32 90, !269}
!1106 = !{i32 89}
!1107 = !{!1108, !1109}
!1108 = !{i32 87, !183}
!1109 = !{i32 88, !186}
!1110 = !{i32 87}
!1111 = !{!1112, !1113}
!1112 = !{i32 89, !195}
!1113 = !{i32 88, !197}
!1114 = distinct !{!1114, !1115, !1119, !1120}
!1115 = !{i32 183, i32 5, !1116, null}
!1116 = !{i32 786443, !1117, i32 174, i32 5, !204, i32 0}
!1117 = !{i32 786443, !1118, !204}
!1118 = !{i32 786478, i32 0, !204, !"get_oracle_activations1", !"get_oracle_activations1", null, !204, i32 168, !751, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([4096 x i64]*, [64 x double]*, [64 x double]*, [64 x double]*)* @get_oracle_activations1.1, null, null, !210, i32 171}
!1119 = !{!"llvm.loop.name", !"get_oracle_activations1_loop1"}
!1120 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1121}
!1121 = !{i32 175, i32 9, !1122, null}
!1122 = !{i32 786443, !1116, !204}
!1123 = distinct !{!1123, !1124, !1129, !1130, !1133}
!1124 = !{i32 181, i32 9, !1125, null}
!1125 = !{i32 786443, !1126, i32 178, i32 9, !204, i32 0}
!1126 = !{i32 786443, !1127, !204}
!1127 = !{i32 786443, !1128, i32 174, i32 30, !204, i32 0}
!1128 = !{i32 786443, !1122, i32 174, i32 5, !204, i32 0}
!1129 = !{!"llvm.loop.name", !"get_oracle_activations1_loop1_1"}
!1130 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1131}
!1131 = !{i32 73, i32 9, !1132, null}
!1132 = !{i32 786443, !1125, !238}
!1133 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1134}
!1134 = !{i32 179, i32 9, !1135, null}
!1135 = !{i32 786443, !1125, !204}
!1136 = !{i32 88}
!1137 = !{!1138, !1139}
!1138 = !{i32 89, !186}
!1139 = !{i32 87, !269}
!1140 = !{i32 86}
!1141 = !{!1142, !1143}
!1142 = !{i32 84, !183}
!1143 = !{i32 85, !186}
!1144 = !{i32 84}
!1145 = !{!1146, !1147}
!1146 = !{i32 86, !195}
!1147 = !{i32 85, !197}
!1148 = distinct !{!1148, !1149, !1155, !1156}
!1149 = !{i32 132, i32 5, !1150, null}
!1150 = !{i32 786443, !1151, i32 125, i32 5, !204, i32 0}
!1151 = !{i32 786443, !1152, !204}
!1152 = !{i32 786478, i32 0, !204, !"get_delta_matrix_weights3", !"get_delta_matrix_weights3", null, !204, i32 120, !1153, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !210, i32 122}
!1153 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !1154, i32 0, i32 0}
!1154 = !{null, !207, !207, !207}
!1155 = !{!"llvm.loop.name", !"get_delta_matrix_weights3_loop1"}
!1156 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1157}
!1157 = !{i32 126, i32 9, !1158, null}
!1158 = !{i32 786443, !1150, !204}
!1159 = distinct !{!1159, !1160, !1165, !1166, !1169}
!1160 = !{i32 131, i32 9, !1161, null}
!1161 = !{i32 786443, !1162, i32 128, i32 9, !204, i32 0}
!1162 = !{i32 786443, !1163, !204}
!1163 = !{i32 786443, !1164, i32 125, i32 30, !204, i32 0}
!1164 = !{i32 786443, !1158, i32 125, i32 5, !204, i32 0}
!1165 = !{!"llvm.loop.name", !"get_delta_matrix_weights3_loop1_1"}
!1166 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1167}
!1167 = !{i32 77, i32 9, !1168, null}
!1168 = !{i32 786443, !1161, !238}
!1169 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !1170}
!1170 = !{i32 129, i32 9, !1171, null}
!1171 = !{i32 786443, !1161, !204}
!1172 = !{i32 85}
!1173 = !{!1174, !1175}
!1174 = !{i32 86, !186}
!1175 = !{i32 84, !269}
!1176 = !{i32 83}
!1177 = !{!1178, !1179}
!1178 = !{i32 81, !183}
!1179 = !{i32 82, !186}
!1180 = !{i32 81}
!1181 = !{!1182, !1183}
!1182 = !{i32 83, !195}
!1183 = !{i32 82, !197}
!1184 = distinct !{!1184, !1185, !1189, !1190}
!1185 = !{i32 165, i32 5, !1186, null}
!1186 = !{i32 786443, !1187, i32 158, i32 5, !204, i32 0}
!1187 = !{i32 786443, !1188, !204}
!1188 = !{i32 786478, i32 0, !204, !"get_delta_matrix_weights2", !"get_delta_matrix_weights2", null, !204, i32 153, !1153, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([4096 x double]*, [64 x double]*, [64 x double]*)* @get_delta_matrix_weights2, null, null, !210, i32 155}
!1189 = !{!"llvm.loop.name", !"get_delta_matrix_weights2_loop1"}
!1190 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1191}
!1191 = !{i32 159, i32 9, !1192, null}
!1192 = !{i32 786443, !1186, !204}
!1193 = distinct !{!1193, !1194, !1199, !1200, !1203}
!1194 = !{i32 164, i32 9, !1195, null}
!1195 = !{i32 786443, !1196, i32 161, i32 9, !204, i32 0}
!1196 = !{i32 786443, !1197, !204}
!1197 = !{i32 786443, !1198, i32 158, i32 30, !204, i32 0}
!1198 = !{i32 786443, !1192, i32 158, i32 5, !204, i32 0}
!1199 = !{!"llvm.loop.name", !"get_delta_matrix_weights2_loop1_1"}
!1200 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1201}
!1201 = !{i32 76, i32 9, !1202, null}
!1202 = !{i32 786443, !1195, !238}
!1203 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1204}
!1204 = !{i32 162, i32 9, !1205, null}
!1205 = !{i32 786443, !1195, !204}
!1206 = !{i32 82}
!1207 = !{!1208, !1209}
!1208 = !{i32 83, !186}
!1209 = !{i32 81, !269}
!1210 = !{i32 80}
!1211 = !{!1212, !1213}
!1212 = !{i32 78, !183}
!1213 = !{i32 79, !186}
!1214 = !{i32 78}
!1215 = !{!1216, !1217}
!1216 = !{i32 80, !195}
!1217 = !{i32 79, !197}
!1218 = distinct !{!1218, !1219, !1223, !1224}
!1219 = !{i32 198, i32 5, !1220, null}
!1220 = !{i32 786443, !1221, i32 191, i32 5, !204, i32 0}
!1221 = !{i32 786443, !1222, !204}
!1222 = !{i32 786478, i32 0, !204, !"get_delta_matrix_weights1", !"get_delta_matrix_weights1", null, !204, i32 186, !1153, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([832 x double]*, [64 x double]*, [2119 x i64]*, i12)* @get_delta_matrix_weights1.1, null, null, !210, i32 188}
!1223 = !{!"llvm.loop.name", !"get_delta_matrix_weights1_loop1"}
!1224 = !{!"llvm.loop.tripcount", i32 13, i32 13, i32 13, !"user", !1225}
!1225 = !{i32 192, i32 9, !1226, null}
!1226 = !{i32 786443, !1220, !204}
!1227 = distinct !{!1227, !1228, !1233, !1234, !1237}
!1228 = !{i32 197, i32 9, !1229, null}
!1229 = !{i32 786443, !1230, i32 194, i32 9, !204, i32 0}
!1230 = !{i32 786443, !1231, !204}
!1231 = !{i32 786443, !1232, i32 191, i32 30, !204, i32 0}
!1232 = !{i32 786443, !1226, i32 191, i32 5, !204, i32 0}
!1233 = !{!"llvm.loop.name", !"get_delta_matrix_weights1_loop1_1"}
!1234 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1235}
!1235 = !{i32 75, i32 9, !1236, null}
!1236 = !{i32 786443, !1229, !238}
!1237 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1238}
!1238 = !{i32 195, i32 9, !1239, null}
!1239 = !{i32 786443, !1229, !204}
!1240 = !{i32 79}
!1241 = !{!1242, !1243}
!1242 = !{i32 80, !186}
!1243 = !{i32 78, !269}
!1244 = !{i32 0, i32 0, i32 12, i32 1}
!1245 = !{i32 0, i32 0, i32 8, i32 1}
!1246 = !{!1}
!1247 = !{i32 5}
!1248 = !{!1249, !1250}
!1249 = !{i32 0, !183}
!1250 = !{i32 1, !186}
!1251 = !{i32 4}
!1252 = !{!1253, !1254}
!1253 = !{i32 2, !183}
!1254 = !{i32 3, !186}
!1255 = !{i32 2}
!1256 = !{!1257, !1258}
!1257 = !{i32 4, !195}
!1258 = !{i32 3, !197}
!1259 = !{!1260, !1261}
!1260 = !{i32 5, !195}
!1261 = !{i32 1, !197}
!1262 = !{i32 33}
!1263 = !{!1264}
!1264 = !{i32 6, !197}
!1265 = !{i32 32}
!1266 = !{!1267}
!1267 = !{i32 7, !197}
!1268 = !{i32 31}
!1269 = !{!1270}
!1270 = !{i32 8, !197}
!1271 = distinct !{!1271, !1272, !1278, !1279}
!1272 = !{i32 382, i32 5, !1273, null}
!1273 = !{i32 786443, !1274, i32 356, i32 5, !204, i32 0}
!1274 = !{i32 786443, !1275, !204}
!1275 = !{i32 786478, i32 0, !204, !"backprop", !"backprop", null, !204, i32 330, !1276, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([832 x i64]*, [4096 x i64]*, [192 x i64]*, [64 x i64]*, [64 x i64]*, [3 x i64]*, [2119 x i64]*, [489 x i64]*)* @backprop, null, null, !210, i32 337}
!1276 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !1277, i32 0, i32 0}
!1277 = !{null, !207, !207, !207, !207, !207, !207, !207, !207}
!1278 = !{!"llvm.loop.name", !"backprop_loop1"}
!1279 = !{!"llvm.loop.tripcount", i32 163, i32 163, i32 163, !"user", !1280}
!1280 = !{i32 357, i32 9, !1281, null}
!1281 = !{i32 786443, !1273, !204}
!1282 = distinct !{!1282, !1283, !1288, !1289, !1292}
!1283 = !{i32 366, i32 9, !1284, null}
!1284 = !{i32 786443, !1285, i32 359, i32 9, !204, i32 0}
!1285 = !{i32 786443, !1286, !204}
!1286 = !{i32 786443, !1287, i32 356, i32 25, !204, i32 0}
!1287 = !{i32 786443, !1281, i32 356, i32 5, !204, i32 0}
!1288 = !{!"llvm.loop.name", !"backprop_loop1_1"}
!1289 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1290}
!1290 = !{i32 84, i32 9, !1291, null}
!1291 = !{i32 786443, !1284, !238}
!1292 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1293}
!1293 = !{i32 360, i32 9, !1294, null}
!1294 = !{i32 786443, !1284, !204}
!1295 = !{i32 22}
!1296 = !{!1297, !1299, !1300, !1301}
!1297 = !{i32 23, !1298}
!1298 = !{!"Unknown", !"indep", i32 1, !"*", i32 -1, i1 true}
!1299 = !{i32 18, !1298}
!1300 = !{i32 19, !269}
!1301 = !{i32 20, !269}
!1302 = !{i32 28}
!1303 = !{!1304, !1305, !1306, !1307}
!1304 = !{i32 19, !1298}
!1305 = !{i32 25, !1298}
!1306 = !{i32 26, !269}
!1307 = !{i32 27, !269}
!1308 = !{i32 42}
!1309 = !{!1310}
!1310 = !{i32 9, !197}
!1311 = !{i32 41}
!1312 = !{!1313}
!1313 = !{i32 10, !197}
!1314 = !{i32 40}
!1315 = !{!1316}
!1316 = !{i32 11, !197}
!1317 = !{i32 39}
!1318 = !{!1319}
!1319 = !{i32 12, !197}
!1320 = !{i32 38}
!1321 = !{!1322}
!1322 = !{i32 13, !197}
!1323 = !{i32 37}
!1324 = !{!1325}
!1325 = !{i32 14, !197}
!1326 = !{i32 36}
!1327 = !{!1328}
!1328 = !{i32 15, !197}
!1329 = !{i32 35}
!1330 = !{!1331}
!1331 = !{i32 16, !197}
!1332 = !{i32 34}
!1333 = !{!1334}
!1334 = !{i32 17, !197}
!1335 = !{i32 23}
!1336 = !{!1299, !1304, !1337, !1338, !1339}
!1337 = !{i32 20, !1298}
!1338 = !{i32 21, !1298}
!1339 = !{i32 22, !1298}
!1340 = !{i32 18}
!1341 = !{!1297, !1304, !1337, !1342, !1339}
!1342 = !{i32 24, !269}
!1343 = !{i32 19}
!1344 = !{!1297, !1299, !1305, !1345, !1346, !1338, !1347, !1348}
!1345 = !{i32 26, !1298}
!1346 = !{i32 27, !1298}
!1347 = !{i32 22, !197}
!1348 = !{i32 28, !1298}
!1349 = !{i32 25}
!1350 = !{!1304, !1345, !1346, !1351, !1348}
!1351 = !{i32 29, !269}
!1352 = !{i32 26}
!1353 = !{!1304, !1305, !1338, !1354}
!1354 = !{i32 28, !197}
!1355 = !{i32 27}
!1356 = !{!1304, !1305, !1357, !1354}
!1357 = !{i32 21, !269}
!1358 = !{i32 29}
!1359 = !{!1360, !1301, !1342, !1338}
!1360 = !{i32 25, !197}
!1361 = !{i32 20}
!1362 = !{!1297, !1299, !1363, !1357, !1347}
!1363 = !{i32 29, !197}
!1364 = !{i32 24}
!1365 = !{!1366, !1363, !1367, !1338}
!1366 = !{i32 18, !197}
!1367 = !{i32 30, !269}
!1368 = !{i32 30}
!1369 = !{!1370, !1357}
!1370 = !{i32 24, !197}
!1371 = !{i32 21}
!1372 = !{!1297, !1304, !1345, !1373, !1374, !1375, !1376, !1377}
!1373 = !{i32 27, !197}
!1374 = !{i32 29, !1298}
!1375 = !{i32 20, !197}
!1376 = !{i32 24, !1298}
!1377 = !{i32 30, !197}
!1378 = !{i32 8}
!1379 = !{!1380}
!1380 = !{i32 31, !269}
!1381 = !{i32 7}
!1382 = !{!1383}
!1383 = !{i32 32, !269}
!1384 = !{i32 6}
!1385 = !{!1386}
!1386 = !{i32 33, !269}
!1387 = !{i32 17}
!1388 = !{!1389}
!1389 = !{i32 34, !269}
!1390 = !{i32 16}
!1391 = !{!1392}
!1392 = !{i32 35, !269}
!1393 = !{i32 15}
!1394 = !{!1395}
!1395 = !{i32 36, !269}
!1396 = !{i32 14}
!1397 = !{!1398}
!1398 = !{i32 37, !269}
!1399 = !{i32 13}
!1400 = !{!1401}
!1401 = !{i32 38, !269}
!1402 = !{i32 12}
!1403 = !{!1404}
!1404 = !{i32 39, !269}
!1405 = !{i32 11}
!1406 = !{!1407}
!1407 = !{i32 40, !269}
!1408 = !{i32 10}
!1409 = !{!1410}
!1410 = !{i32 41, !269}
!1411 = !{i32 9}
!1412 = !{!1413}
!1413 = !{i32 42, !269}
!1414 = !{i32 1}
!1415 = !{!1416, !1417}
!1416 = !{i32 5, !186}
!1417 = !{i32 0, !269}
!1418 = !{i32 3}
!1419 = !{!1420, !1421}
!1420 = !{i32 4, !186}
!1421 = !{i32 2, !269}
!1422 = !{i32 262}
!1423 = !{!1424, !1425}
!1424 = !{i32 260, !183}
!1425 = !{i32 261, !186}
!1426 = !{i32 260}
!1427 = !{!1428, !1429}
!1428 = !{i32 262, !195}
!1429 = !{i32 261, !197}
!1430 = distinct !{!1430, !1431, !1438, !1439}
!1431 = !{i32 51, i32 5, !1432, null}
!1432 = !{i32 786443, !1433, i32 48, i32 5, !204, i32 0}
!1433 = !{i32 786443, !1434, !204}
!1434 = !{i32 786478, i32 0, !204, !"add_bias_to_activations", !"add_bias_to_activations", null, !204, i32 43, !1435, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([64 x i64]*, [64 x double]*)* @add_bias_to_activations.clone.1, null, null, !210, i32 45}
!1435 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !1436, i32 0, i32 0}
!1436 = !{null, !207, !207, !1437}
!1437 = !{i32 786468, null, !"int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 5}
!1438 = !{!"llvm.loop.name", !"add_bias_to_activations_loop1"}
!1439 = !{!"llvm.loop.tripcount", i32 3, i32 64, i32 33, !"user", !1440}
!1440 = !{i32 49, i32 9, !1441, null}
!1441 = !{i32 786443, !1432, !204}
!1442 = !{i32 264}
!1443 = !{!1444}
!1444 = !{i32 263, !288}
!1445 = !{i32 263}
!1446 = !{!1447}
!1447 = !{i32 264, !293}
!1448 = !{i32 261}
!1449 = !{!1450, !1451}
!1450 = !{i32 262, !186}
!1451 = !{i32 260, !269}
!1452 = !{i32 259}
!1453 = !{!1454, !1455, !1456}
!1454 = !{i32 245, !183}
!1455 = !{i32 246, !183}
!1456 = !{i32 247, !186}
!1457 = !{i32 258}
!1458 = !{!1459, !1460, !1461}
!1459 = !{i32 248, !183}
!1460 = !{i32 249, !183}
!1461 = !{i32 250, !186}
!1462 = !{i32 257}
!1463 = !{!1464, !1465, !1466}
!1464 = !{i32 251, !183}
!1465 = !{i32 252, !183}
!1466 = !{i32 253, !186}
!1467 = !{i32 256}
!1468 = !{!1469, !1470}
!1469 = !{i32 254, !183}
!1470 = !{i32 255, !186}
!1471 = !{i32 254}
!1472 = !{!1473, !1474}
!1473 = !{i32 256, !195}
!1474 = !{i32 255, !197}
!1475 = distinct !{!1475, !1476, !1438, !1480}
!1476 = !{i32 51, i32 5, !1477, null}
!1477 = !{i32 786443, !1478, i32 48, i32 5, !204, i32 0}
!1478 = !{i32 786443, !1479, !204}
!1479 = !{i32 786478, i32 0, !204, !"add_bias_to_activations", !"add_bias_to_activations", null, !204, i32 43, !1435, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !210, i32 45}
!1480 = !{!"llvm.loop.tripcount", i32 3, i32 64, i32 33, !"user", !1481}
!1481 = !{i32 49, i32 9, !1482, null}
!1482 = !{i32 786443, !1477, !204}
!1483 = !{i32 252}
!1484 = !{!1485, !1486}
!1485 = !{i32 257, !195}
!1486 = !{i32 253, !197}
!1487 = !{i32 249}
!1488 = !{!1489, !1490}
!1489 = !{i32 258, !195}
!1490 = !{i32 250, !197}
!1491 = !{i32 246}
!1492 = !{!1493, !1494}
!1493 = !{i32 259, !195}
!1494 = !{i32 247, !197}
!1495 = !{i32 247}
!1496 = !{!1497, !1454, !1498}
!1497 = !{i32 259, !186}
!1498 = !{i32 246, !269}
!1499 = !{i32 255}
!1500 = !{!1501, !1502}
!1501 = !{i32 256, !186}
!1502 = !{i32 254, !269}
!1503 = !{i32 251}
!1504 = !{!1485, !1505}
!1505 = !{i32 253, !195}
!1506 = !{i32 248}
!1507 = !{!1489, !1508}
!1508 = !{i32 250, !195}
!1509 = !{i32 245}
!1510 = !{!1493, !1511}
!1511 = !{i32 247, !195}
!1512 = !{i32 250}
!1513 = !{!1514, !1459, !1515}
!1514 = !{i32 258, !186}
!1515 = !{i32 249, !269}
!1516 = !{i32 253}
!1517 = !{!1518, !1464, !1519}
!1518 = !{i32 257, !186}
!1519 = !{i32 252, !269}
!1520 = !{i32 74}
!1521 = !{!1522, !1523, !1524}
!1522 = !{i32 48, !183}
!1523 = !{i32 49, !183}
!1524 = !{i32 50, !186}
!1525 = !{i32 73}
!1526 = !{!1527, !1528, !1529}
!1527 = !{i32 51, !183}
!1528 = !{i32 52, !183}
!1529 = !{i32 53, !186}
!1530 = !{i32 72}
!1531 = !{!1532, !1533, !1534}
!1532 = !{i32 54, !183}
!1533 = !{i32 55, !183}
!1534 = !{i32 56, !186}
!1535 = !{i32 71}
!1536 = !{!1537, !1538}
!1537 = !{i32 57, !183}
!1538 = !{i32 58, !186}
!1539 = !{i32 68}
!1540 = !{!1541, !1542}
!1541 = !{i32 59, !183}
!1542 = !{i32 60, !186}
!1543 = !{i32 67}
!1544 = !{!1545, !1546}
!1545 = !{i32 61, !183}
!1546 = !{i32 62, !186}
!1547 = !{i32 65}
!1548 = !{!1549, !1550}
!1549 = !{i32 63, !183}
!1550 = !{i32 64, !186}
!1551 = !{i32 63}
!1552 = !{!1553, !1554}
!1553 = !{i32 65, !195}
!1554 = !{i32 64, !197}
!1555 = distinct !{!1555, !1556, !1560, !1561}
!1556 = !{i32 40, i32 5, !1557, null}
!1557 = !{i32 786443, !1558, i32 36, i32 5, !204, i32 0}
!1558 = !{i32 786443, !1559, !204}
!1559 = !{i32 786478, i32 0, !204, !"RELU", !"RELU", null, !204, i32 33, !1435, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !210, i32 33}
!1560 = !{!"llvm.loop.name", !"RELU_loop1"}
!1561 = !{!"llvm.loop.tripcount", i32 3, i32 64, i32 33, !"user", !1562}
!1562 = !{i32 37, i32 9, !1563, null}
!1563 = !{i32 786443, !1557, !204}
!1564 = !{i32 55}
!1565 = !{!1566, !1567}
!1566 = !{i32 72, !195}
!1567 = !{i32 56, !197}
!1568 = !{i32 52}
!1569 = !{!1570, !1571}
!1570 = !{i32 73, !195}
!1571 = !{i32 53, !197}
!1572 = !{i32 49}
!1573 = !{!1574, !1575}
!1574 = !{i32 74, !195}
!1575 = !{i32 50, !197}
!1576 = !{i32 70}
!1577 = !{!1578}
!1578 = !{i32 76, !183}
!1579 = !{i32 62}
!1580 = !{!1581, !1545}
!1581 = !{i32 67, !186}
!1582 = !{i32 50}
!1583 = !{!1584, !1522, !1585}
!1584 = !{i32 74, !186}
!1585 = !{i32 49, !269}
!1586 = !{i32 64}
!1587 = !{!1588, !1589}
!1588 = !{i32 65, !186}
!1589 = !{i32 63, !269}
!1590 = !{i32 75}
!1591 = !{!1592}
!1592 = !{i32 66, !195}
!1593 = !{i32 61}
!1594 = !{!1595, !1596}
!1595 = !{i32 67, !195}
!1596 = !{i32 62, !195}
!1597 = !{i32 59}
!1598 = !{!1599, !1600}
!1599 = !{i32 68, !195}
!1600 = !{i32 60, !195}
!1601 = !{i32 77}
!1602 = !{!1603}
!1603 = !{i32 69, !195}
!1604 = !{i32 76}
!1605 = !{!1606}
!1606 = !{i32 70, !195}
!1607 = !{i32 57}
!1608 = !{!1609, !1610}
!1609 = !{i32 71, !195}
!1610 = !{i32 58, !195}
!1611 = !{i32 54}
!1612 = !{!1566, !1613}
!1613 = !{i32 56, !195}
!1614 = !{i32 51}
!1615 = !{!1570, !1616}
!1616 = !{i32 53, !195}
!1617 = !{i32 48}
!1618 = !{!1574, !1619}
!1619 = !{i32 50, !195}
!1620 = !{i32 53}
!1621 = !{!1622, !1527, !1623}
!1622 = !{i32 73, !186}
!1623 = !{i32 52, !269}
!1624 = !{i32 56}
!1625 = !{!1626, !1532, !1627}
!1626 = !{i32 72, !186}
!1627 = !{i32 55, !269}
!1628 = !{i32 58}
!1629 = !{!1630, !1537}
!1630 = !{i32 71, !186}
!1631 = !{i32 69}
!1632 = !{!1633}
!1633 = !{i32 77, !183}
!1634 = !{i32 60}
!1635 = !{!1636, !1541}
!1636 = !{i32 68, !186}
!1637 = !{i32 66}
!1638 = !{!1639}
!1639 = !{i32 75, !183}
!1640 = !{i32 45}
!1641 = !{!1642, !1643}
!1642 = !{i32 43, !183}
!1643 = !{i32 44, !186}
!1644 = !{i32 43}
!1645 = !{!1646, !1647}
!1646 = !{i32 45, !195}
!1647 = !{i32 44, !197}
!1648 = distinct !{!1648, !1649, !1560, !1653}
!1649 = !{i32 40, i32 5, !1650, null}
!1650 = !{i32 786443, !1651, i32 36, i32 5, !204, i32 0}
!1651 = !{i32 786443, !1652, !204}
!1652 = !{i32 786478, i32 0, !204, !"RELU", !"RELU", null, !204, i32 33, !1435, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([64 x double]*, [64 x double]*)* @RELU, null, null, !210, i32 33}
!1653 = !{!"llvm.loop.tripcount", i32 3, i32 64, i32 33, !"user", !1654}
!1654 = !{i32 37, i32 9, !1655, null}
!1655 = !{i32 786443, !1650, !204}
!1656 = !{i32 47}
!1657 = !{!1658}
!1658 = !{i32 46, !288}
!1659 = !{i32 46}
!1660 = !{!1661}
!1661 = !{i32 47, !293}
!1662 = !{i32 44}
!1663 = !{!1664, !1665}
!1664 = !{i32 45, !186}
!1665 = !{i32 43, !269}
