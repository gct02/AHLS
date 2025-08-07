; ModuleID = 'data/base_solutions/BACKPROP/solution0/.autopilot/db/a.o.3.bc'
source_filename = "data/base_solutions/BACKPROP/solution0/.autopilot/db/a.o.3.bc"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

$_ssdm_op_Write.ap_auto.doubleP0A = comdat any

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

@empty = internal unnamed_addr constant [30 x i8] c"add_bias_to_activations_loop1\00"
@empty_0 = internal unnamed_addr constant [17 x i8] c"backprop_loop1_1\00"
@empty_1 = internal unnamed_addr constant [11 x i8] c"RELU_loop1\00"
@empty_2 = internal unnamed_addr constant [15 x i8] c"soft_max_loop1\00"
@empty_3 = internal unnamed_addr constant [15 x i8] c"soft_max_loop2\00"
@empty_4 = internal unnamed_addr constant [22 x i8] c"take_difference_loop1\00"
@empty_5 = internal unnamed_addr constant [15 x i8] c"backprop_loop1\00"
@empty_6 = internal unnamed_addr constant [34 x i8] c"get_delta_matrix_weights3_loop1_1\00"
@empty_7 = internal unnamed_addr constant [30 x i8] c"get_oracle_activations2_loop1\00"
@empty_8 = internal unnamed_addr constant [10 x i8] c"ap_memory\00"
@empty_9 = internal unnamed_addr constant [32 x i8] c"get_oracle_activations1_loop1_1\00"
@empty_10 = internal unnamed_addr constant [9 x i8] c"backprop\00"
@empty_11 = internal unnamed_addr constant [52 x i8] c"matrix_vector_product_with_bias_input_layer_loop1_1\00"
@empty_12 = internal unnamed_addr constant [50 x i8] c"matrix_vector_product_with_bias_input_layer_loop1\00"
@empty_13 = internal unnamed_addr constant [53 x i8] c"matrix_vector_product_with_bias_second_layer_loop1_1\00"
@empty_14 = internal unnamed_addr constant [51 x i8] c"matrix_vector_product_with_bias_second_layer_loop1\00"
@empty_15 = internal unnamed_addr constant [53 x i8] c"matrix_vector_product_with_bias_output_layer_loop1_1\00"
@empty_16 = internal unnamed_addr constant [51 x i8] c"matrix_vector_product_with_bias_output_layer_loop1\00"
@empty_17 = internal unnamed_addr constant [32 x i8] c"get_oracle_activations2_loop1_1\00"
@empty_18 = internal unnamed_addr constant [23 x i8] c"update_weights_loop7_1\00"
@empty_19 = internal unnamed_addr constant [34 x i8] c"get_delta_matrix_weights2_loop1_1\00"
@empty_20 = internal unnamed_addr constant [32 x i8] c"get_delta_matrix_weights2_loop1\00"
@empty_21 = internal unnamed_addr constant [21 x i8] c"update_weights_loop7\00"
@empty_22 = internal unnamed_addr constant [34 x i8] c"get_delta_matrix_weights1_loop1_1\00"
@empty_23 = internal unnamed_addr constant [32 x i8] c"get_delta_matrix_weights1_loop1\00"
@empty_24 = internal unnamed_addr constant [22 x i8] c"update_weights_loop12\00"
@empty_25 = internal unnamed_addr constant [24 x i8] c"update_weights_loop11_1\00"
@empty_26 = internal unnamed_addr constant [22 x i8] c"update_weights_loop11\00"
@empty_27 = internal unnamed_addr constant [22 x i8] c"update_weights_loop10\00"
@empty_28 = internal unnamed_addr constant [23 x i8] c"update_weights_loop9_1\00"
@empty_29 = internal unnamed_addr constant [21 x i8] c"update_weights_loop9\00"
@empty_30 = internal unnamed_addr constant [32 x i8] c"get_delta_matrix_weights3_loop1\00"
@empty_31 = internal unnamed_addr constant [21 x i8] c"update_weights_loop1\00"
@empty_32 = internal unnamed_addr constant [30 x i8] c"get_oracle_activations1_loop1\00"
@empty_33 = internal unnamed_addr constant [21 x i8] c"update_weights_loop6\00"
@empty_34 = internal unnamed_addr constant [23 x i8] c"update_weights_loop5_1\00"
@empty_35 = internal unnamed_addr constant [21 x i8] c"update_weights_loop5\00"
@empty_36 = internal unnamed_addr constant [21 x i8] c"update_weights_loop4\00"
@empty_37 = internal unnamed_addr constant [23 x i8] c"update_weights_loop3_1\00"
@empty_38 = internal unnamed_addr constant [21 x i8] c"update_weights_loop3\00"
@empty_39 = internal unnamed_addr constant [21 x i8] c"update_weights_loop2\00"
@empty_40 = internal unnamed_addr constant [23 x i8] c"update_weights_loop1_1\00"
@empty_41 = internal unnamed_addr constant [21 x i8] c"update_weights_loop8\00"
@empty_42 = internal unnamed_addr constant [1 x i8] zeroinitializer

; Function Attrs: noinline
define internal fastcc void @update_weights.1([832 x i64]* noalias nocapture %weights1, [4096 x i64]* noalias nocapture %weights2, [192 x i64]* noalias nocapture %weights3, [832 x double]* noalias nocapture align 512 %d_weights1, [4096 x double]* noalias nocapture align 512 %d_weights2, [192 x double]* noalias nocapture align 512 %d_weights3, [64 x i64]* noalias nocapture %biases1, [64 x i64]* noalias nocapture %biases2, [3 x i64]* noalias nocapture %biases3, [64 x double]* noalias nocapture align 512 %d_biases1, [64 x double]* noalias nocapture align 512 %d_biases2, double %p_read, double %p_read1, double %p_read2) #0 {
entry:
  %i = alloca i4, align 1, !bitwidth !186
  %norm = alloca double, align 8, !bitwidth !11
  call void (...) @_ssdm_op_SpecInterface([3 x i64]* %biases3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([64 x i64]* %biases2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([64 x i64]* %biases1, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([192 x i64]* %weights3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([4096 x i64]* %weights2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([832 x i64]* %weights1, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !187
  %p_read_1 = call double @_ssdm_op_Read.ap_auto.double(double %p_read2), !bitwidth !20
  %p_read_2 = call double @_ssdm_op_Read.ap_auto.double(double %p_read1), !bitwidth !20
  %p_read_3 = call double @_ssdm_op_Read.ap_auto.double(double %p_read), !bitwidth !20
  store double 0.000000e+00, double* %norm, align 8, !bitwidth !11, !dep_idx !188, !deps !189
  store i4 0, i4* %i, align 1, !bitwidth !11, !dep_idx !195, !deps !196
  br label %update_weights_loop1_1, !bitwidth !11

update_weights_loop1_1:                           ; preds = %for.inc19, %entry
  %i_12 = load i4, i4* %i, align 1, !bitwidth !199, !dep_idx !200, !deps !201
  %icmp_ln219 = icmp eq i4 %i_12, -3, !bitwidth !206
  %add_ln219 = add nuw i4 %i_12, 1, !bitwidth !199
  br i1 %icmp_ln219, label %for.inc37.preheader, label %update_weights_loop1_1.split, !llvm.loop !207, !bitwidth !11

for.inc37.preheader:                              ; preds = %update_weights_loop1_1
  %bias_norm_1 = alloca double, align 8, !bitwidth !11
  %i_1 = alloca i7, align 1, !bitwidth !224
  store i7 0, i7* %i_1, align 1, !bitwidth !11, !dep_idx !225, !deps !226
  store double 0.000000e+00, double* %bias_norm_1, align 8, !bitwidth !11, !dep_idx !229, !deps !230
  br label %for.inc37, !bitwidth !11

update_weights_loop1_1.split:                     ; preds = %update_weights_loop1_1
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 13, i64 13, i64 13), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_31)
  %tmp_1 = call i10 @_ssdm_op_BitConcatenate.i10.i4.i6(i4 %i_12, i6 0), !bitwidth !234
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %update_weights_loop1_1.split
  %j = phi i7 [ %add_ln222, %for.inc.split ], [ 0, %update_weights_loop1_1.split ], !bitwidth !235
  %icmp_ln222 = icmp eq i7 %j, -64, !bitwidth !206
  %add_ln222 = add nuw i7 %j, 1, !bitwidth !235
  br i1 %icmp_ln222, label %for.inc19, label %for.inc.split, !llvm.loop !236, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %norm_load_1 = load double, double* %norm, align 8, !bitwidth !20, !dep_idx !250, !deps !251
  %zext_ln222 = zext i7 %j to i10, !bitwidth !255
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([23 x i8]* @empty_40)
  %add_ln224 = add nuw i10 %zext_ln222, %tmp_1, !bitwidth !234
  %zext_ln224 = zext i10 %add_ln224 to i64, !bitwidth !256
  %d_weights1_addr = getelementptr inbounds [832 x double], [832 x double]* %d_weights1, i64 0, i64 %zext_ln224, !bitwidth !11
  %d_weights1_load = load double, double* %d_weights1_addr, align 8, !bitwidth !20
  %mul4 = fmul double %d_weights1_load, 1.000000e-02, !bitwidth !20
  %weights1_addr = getelementptr [832 x i64], [832 x i64]* %weights1, i64 0, i64 %zext_ln224, !bitwidth !7
  %weights1_load = load i64, i64* %weights1_addr, align 8, !bitwidth !20, !dep_idx !257, !deps !258
  %bitcast_ln224 = bitcast i64 %weights1_load to double, !bitwidth !20
  %sub = fsub double %bitcast_ln224, %mul4, !bitwidth !20
  %bitcast_ln224_1 = bitcast double %sub to i64, !bitwidth !20
  store i64 %bitcast_ln224_1, i64* %weights1_addr, align 8, !bitwidth !11, !dep_idx !262, !deps !263
  %mul2 = fmul double %sub, %sub, !bitwidth !20
  %norm_2 = fadd double %norm_load_1, %mul2, !bitwidth !20
  store double %norm_2, double* %norm, align 8, !bitwidth !11, !dep_idx !268, !deps !269
  br label %for.inc, !llvm.loop !236, !bitwidth !11

for.inc19:                                        ; preds = %for.inc
  store i4 %add_ln219, i4* %i, align 1, !bitwidth !11, !dep_idx !273, !deps !274
  br label %update_weights_loop1_1, !llvm.loop !207, !bitwidth !11

for.inc37:                                        ; preds = %for.inc37.split, %for.inc37.preheader
  %i_13 = load i7, i7* %i_1, align 1, !bitwidth !235, !dep_idx !278, !deps !279
  %icmp_ln229 = icmp eq i7 %i_13, -64, !bitwidth !206
  %add_ln229 = add nuw i7 %i_13, 1, !bitwidth !235
  br i1 %icmp_ln229, label %for.end39, label %for.inc37.split, !llvm.loop !282, !bitwidth !11

for.inc37.split:                                  ; preds = %for.inc37
  %bias_norm_1_load = load double, double* %bias_norm_1, align 8, !bitwidth !20, !dep_idx !289, !deps !290
  %zext_ln229 = zext i7 %i_13 to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_39)
  %d_biases1_addr = getelementptr inbounds [64 x double], [64 x double]* %d_biases1, i64 0, i64 %zext_ln229, !bitwidth !11
  %d_biases1_load = load double, double* %d_biases1_addr, align 8, !bitwidth !20
  %mul = fmul double %d_biases1_load, 1.000000e-02, !bitwidth !20
  %biases1_addr = getelementptr [64 x i64], [64 x i64]* %biases1, i64 0, i64 %zext_ln229, !bitwidth !7
  %biases1_load = load i64, i64* %biases1_addr, align 8, !bitwidth !20, !dep_idx !293, !deps !294
  %bitcast_ln231 = bitcast i64 %biases1_load to double, !bitwidth !20
  %sub1 = fsub double %bitcast_ln231, %mul, !bitwidth !20
  %bitcast_ln231_1 = bitcast double %sub1 to i64, !bitwidth !20
  store i64 %bitcast_ln231_1, i64* %biases1_addr, align 8, !bitwidth !11, !dep_idx !298, !deps !299
  %mul1 = fmul double %sub1, %sub1, !bitwidth !20
  %bias_norm_2 = fadd double %bias_norm_1_load, %mul1, !bitwidth !20
  store i7 %add_ln229, i7* %i_1, align 1, !bitwidth !11, !dep_idx !304, !deps !305
  store double %bias_norm_2, double* %bias_norm_1, align 8, !bitwidth !11, !dep_idx !308, !deps !309
  br label %for.inc37, !llvm.loop !282, !bitwidth !11

for.end39:                                        ; preds = %for.inc37
  %i_2 = alloca i4, align 1, !bitwidth !186
  %norm_load = load double, double* %norm, align 8, !bitwidth !20, !dep_idx !312, !deps !313
  %norm_1 = call double @llvm.sqrt.f64(double %norm_load), !bitwidth !20
  store i4 0, i4* %i_2, align 1, !bitwidth !11, !dep_idx !315, !deps !316
  br label %update_weights_loop3_1, !bitwidth !11

update_weights_loop3_1:                           ; preds = %for.inc57, %for.end39
  %i_14 = load i4, i4* %i_2, align 1, !bitwidth !199, !dep_idx !319, !deps !320
  %icmp_ln239 = icmp eq i4 %i_14, -3, !bitwidth !206
  %add_ln239 = add nuw i4 %i_14, 1, !bitwidth !199
  br i1 %icmp_ln239, label %update_weights_loop4, label %update_weights_loop3_1.split, !llvm.loop !323, !bitwidth !11

update_weights_loop3_1.split:                     ; preds = %update_weights_loop3_1
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 13, i64 13, i64 13), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_38)
  %tmp_2 = call i10 @_ssdm_op_BitConcatenate.i10.i4.i6(i4 %i_14, i6 0), !bitwidth !234
  br label %for.inc54, !bitwidth !11

for.inc54:                                        ; preds = %for.inc54.split, %update_weights_loop3_1.split
  %j_1 = phi i7 [ %add_ln242, %for.inc54.split ], [ 0, %update_weights_loop3_1.split ], !bitwidth !235
  %icmp_ln242 = icmp eq i7 %j_1, -64, !bitwidth !206
  %add_ln242 = add nuw i7 %j_1, 1, !bitwidth !235
  br i1 %icmp_ln242, label %for.inc57, label %for.inc54.split, !llvm.loop !330, !bitwidth !11

for.inc54.split:                                  ; preds = %for.inc54
  %zext_ln242 = zext i7 %j_1 to i10, !bitwidth !255
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([23 x i8]* @empty_37)
  %add_ln244 = add nuw i10 %zext_ln242, %tmp_2, !bitwidth !234
  %zext_ln244 = zext i10 %add_ln244 to i64, !bitwidth !256
  %weights1_addr_1 = getelementptr [832 x i64], [832 x i64]* %weights1, i64 0, i64 %zext_ln244, !bitwidth !7
  %weights1_load_1 = load i64, i64* %weights1_addr_1, align 8, !bitwidth !20, !dep_idx !343, !deps !344
  %bitcast_ln244 = bitcast i64 %weights1_load_1 to double, !bitwidth !20
  %div = fdiv double %bitcast_ln244, %norm_1, !bitwidth !20
  %bitcast_ln244_1 = bitcast double %div to i64, !bitwidth !20
  store i64 %bitcast_ln244_1, i64* %weights1_addr_1, align 8, !bitwidth !11, !dep_idx !347, !deps !348
  br label %for.inc54, !llvm.loop !330, !bitwidth !11

for.inc57:                                        ; preds = %for.inc54
  store i4 %add_ln239, i4* %i_2, align 1, !bitwidth !11, !dep_idx !352, !deps !353
  br label %update_weights_loop3_1, !llvm.loop !323, !bitwidth !11

update_weights_loop4:                             ; preds = %update_weights_loop3_1
  %i_3 = alloca i7, align 1, !bitwidth !224
  %bias_norm_1_load_1 = load double, double* %bias_norm_1, align 8, !bitwidth !20, !dep_idx !356, !deps !357
  %bias_norm = call double @llvm.sqrt.f64(double %bias_norm_1_load_1), !bitwidth !20
  store i7 0, i7* %i_3, align 1, !bitwidth !11, !dep_idx !359, !deps !360
  br label %for.inc68, !bitwidth !11

for.inc68:                                        ; preds = %for.inc68.split, %update_weights_loop4
  %i_15 = load i7, i7* %i_3, align 1, !bitwidth !235, !dep_idx !363, !deps !364
  %icmp_ln248 = icmp eq i7 %i_15, -64, !bitwidth !206
  %add_ln248 = add nuw i7 %i_15, 1, !bitwidth !235
  br i1 %icmp_ln248, label %update_weights_loop5_1.preheader, label %for.inc68.split, !llvm.loop !367, !bitwidth !11

update_weights_loop5_1.preheader:                 ; preds = %for.inc68
  %i_4 = alloca i7, align 1, !bitwidth !224
  %norm_3 = alloca double, align 8, !bitwidth !11
  store double 0.000000e+00, double* %norm_3, align 8, !bitwidth !11, !dep_idx !374, !deps !375
  store i7 0, i7* %i_4, align 1, !bitwidth !11, !dep_idx !379, !deps !380
  br label %update_weights_loop5_1, !bitwidth !11

for.inc68.split:                                  ; preds = %for.inc68
  %zext_ln248 = zext i7 %i_15 to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_36)
  %biases1_addr_1 = getelementptr [64 x i64], [64 x i64]* %biases1, i64 0, i64 %zext_ln248, !bitwidth !7
  %biases1_load_1 = load i64, i64* %biases1_addr_1, align 8, !bitwidth !20, !dep_idx !383, !deps !384
  %bitcast_ln250 = bitcast i64 %biases1_load_1 to double, !bitwidth !20
  %div1 = fdiv double %bitcast_ln250, %bias_norm, !bitwidth !20
  %bitcast_ln250_1 = bitcast double %div1 to i64, !bitwidth !20
  store i64 %bitcast_ln250_1, i64* %biases1_addr_1, align 8, !bitwidth !11, !dep_idx !387, !deps !388
  store i7 %add_ln248, i7* %i_3, align 1, !bitwidth !11, !dep_idx !392, !deps !393
  br label %for.inc68, !llvm.loop !367, !bitwidth !11

update_weights_loop5_1:                           ; preds = %for.inc100, %update_weights_loop5_1.preheader
  %i_16 = load i7, i7* %i_4, align 1, !bitwidth !235, !dep_idx !396, !deps !397
  %icmp_ln257 = icmp eq i7 %i_16, -64, !bitwidth !206
  %add_ln257 = add nuw i7 %i_16, 1, !bitwidth !235
  br i1 %icmp_ln257, label %for.inc118.preheader, label %update_weights_loop5_1.split, !llvm.loop !400, !bitwidth !11

for.inc118.preheader:                             ; preds = %update_weights_loop5_1
  %bias_norm_4 = alloca double, align 8, !bitwidth !11
  %i_5 = alloca i7, align 1, !bitwidth !224
  store i7 0, i7* %i_5, align 1, !bitwidth !11, !dep_idx !407, !deps !408
  store double 0.000000e+00, double* %bias_norm_4, align 8, !bitwidth !11, !dep_idx !411, !deps !412
  br label %for.inc118, !bitwidth !11

update_weights_loop5_1.split:                     ; preds = %update_weights_loop5_1
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_35)
  %empty = trunc i7 %i_16 to i6, !bitwidth !416
  %tmp_4 = call i12 @_ssdm_op_BitConcatenate.i12.i6.i6(i6 %empty, i6 0), !bitwidth !105
  br label %for.inc97, !bitwidth !11

for.inc97:                                        ; preds = %for.inc97.split, %update_weights_loop5_1.split
  %j_2 = phi i7 [ %add_ln260, %for.inc97.split ], [ 0, %update_weights_loop5_1.split ], !bitwidth !235
  %icmp_ln260 = icmp eq i7 %j_2, -64, !bitwidth !206
  %add_ln260 = add nuw i7 %j_2, 1, !bitwidth !235
  br i1 %icmp_ln260, label %for.inc100, label %for.inc97.split, !llvm.loop !417, !bitwidth !11

for.inc97.split:                                  ; preds = %for.inc97
  %norm_3_load_1 = load double, double* %norm_3, align 8, !bitwidth !20, !dep_idx !430, !deps !431
  %zext_ln260 = zext i7 %j_2 to i12, !bitwidth !434
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([23 x i8]* @empty_34)
  %add_ln262 = add nuw i12 %zext_ln260, %tmp_4, !bitwidth !105
  %zext_ln262 = zext i12 %add_ln262 to i64, !bitwidth !256
  %d_weights2_addr = getelementptr inbounds [4096 x double], [4096 x double]* %d_weights2, i64 0, i64 %zext_ln262, !bitwidth !11
  %d_weights2_load = load double, double* %d_weights2_addr, align 8, !bitwidth !20
  %mul6 = fmul double %d_weights2_load, 1.000000e-02, !bitwidth !20
  %weights2_addr = getelementptr [4096 x i64], [4096 x i64]* %weights2, i64 0, i64 %zext_ln262, !bitwidth !7
  %weights2_load = load i64, i64* %weights2_addr, align 8, !bitwidth !20, !dep_idx !435, !deps !436
  %bitcast_ln262 = bitcast i64 %weights2_load to double, !bitwidth !20
  %sub3 = fsub double %bitcast_ln262, %mul6, !bitwidth !20
  %bitcast_ln262_1 = bitcast double %sub3 to i64, !bitwidth !20
  store i64 %bitcast_ln262_1, i64* %weights2_addr, align 8, !bitwidth !11, !dep_idx !439, !deps !440
  %mul7 = fmul double %sub3, %sub3, !bitwidth !20
  %norm_5 = fadd double %norm_3_load_1, %mul7, !bitwidth !20
  store double %norm_5, double* %norm_3, align 8, !bitwidth !11, !dep_idx !444, !deps !445
  br label %for.inc97, !llvm.loop !417, !bitwidth !11

for.inc100:                                       ; preds = %for.inc97
  store i7 %add_ln257, i7* %i_4, align 1, !bitwidth !11, !dep_idx !448, !deps !449
  br label %update_weights_loop5_1, !llvm.loop !400, !bitwidth !11

for.inc118:                                       ; preds = %for.inc118.split, %for.inc118.preheader
  %i_17 = load i7, i7* %i_5, align 1, !bitwidth !235, !dep_idx !452, !deps !453
  %icmp_ln267 = icmp eq i7 %i_17, -64, !bitwidth !206
  %add_ln267 = add nuw i7 %i_17, 1, !bitwidth !235
  br i1 %icmp_ln267, label %for.end120, label %for.inc118.split, !llvm.loop !456, !bitwidth !11

for.inc118.split:                                 ; preds = %for.inc118
  %bias_norm_4_load = load double, double* %bias_norm_4, align 8, !bitwidth !20, !dep_idx !463, !deps !464
  %zext_ln267 = zext i7 %i_17 to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_33)
  %d_biases2_addr = getelementptr inbounds [64 x double], [64 x double]* %d_biases2, i64 0, i64 %zext_ln267, !bitwidth !11
  %d_biases2_load = load double, double* %d_biases2_addr, align 8, !bitwidth !20
  %mul3 = fmul double %d_biases2_load, 1.000000e-02, !bitwidth !20
  %biases2_addr = getelementptr [64 x i64], [64 x i64]* %biases2, i64 0, i64 %zext_ln267, !bitwidth !7
  %biases2_load = load i64, i64* %biases2_addr, align 8, !bitwidth !20, !dep_idx !467, !deps !468
  %bitcast_ln269 = bitcast i64 %biases2_load to double, !bitwidth !20
  %sub2 = fsub double %bitcast_ln269, %mul3, !bitwidth !20
  %bitcast_ln269_1 = bitcast double %sub2 to i64, !bitwidth !20
  store i64 %bitcast_ln269_1, i64* %biases2_addr, align 8, !bitwidth !11, !dep_idx !471, !deps !472
  %mul5 = fmul double %sub2, %sub2, !bitwidth !20
  %bias_norm_5 = fadd double %bias_norm_4_load, %mul5, !bitwidth !20
  store i7 %add_ln267, i7* %i_5, align 1, !bitwidth !11, !dep_idx !476, !deps !477
  store double %bias_norm_5, double* %bias_norm_4, align 8, !bitwidth !11, !dep_idx !480, !deps !481
  br label %for.inc118, !llvm.loop !456, !bitwidth !11

for.end120:                                       ; preds = %for.inc118
  %i_6 = alloca i7, align 1, !bitwidth !224
  %norm_3_load = load double, double* %norm_3, align 8, !bitwidth !20, !dep_idx !484, !deps !485
  %norm_4 = call double @llvm.sqrt.f64(double %norm_3_load), !bitwidth !20
  store i7 0, i7* %i_6, align 1, !bitwidth !11, !dep_idx !487, !deps !488
  br label %update_weights_loop7_1, !bitwidth !11

update_weights_loop7_1:                           ; preds = %for.inc139, %for.end120
  %i_18 = load i7, i7* %i_6, align 1, !bitwidth !235, !dep_idx !491, !deps !492
  %icmp_ln277 = icmp eq i7 %i_18, -64, !bitwidth !206
  %add_ln277 = add nuw i7 %i_18, 1, !bitwidth !235
  br i1 %icmp_ln277, label %update_weights_loop8, label %update_weights_loop7_1.split, !llvm.loop !495, !bitwidth !11

update_weights_loop7_1.split:                     ; preds = %update_weights_loop7_1
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_21)
  %empty_46 = trunc i7 %i_18 to i6, !bitwidth !416
  %tmp_6 = call i12 @_ssdm_op_BitConcatenate.i12.i6.i6(i6 %empty_46, i6 0), !bitwidth !105
  br label %for.inc136, !bitwidth !11

for.inc136:                                       ; preds = %for.inc136.split, %update_weights_loop7_1.split
  %j_3 = phi i7 [ %add_ln280, %for.inc136.split ], [ 0, %update_weights_loop7_1.split ], !bitwidth !235
  %icmp_ln280 = icmp eq i7 %j_3, -64, !bitwidth !206
  %add_ln280 = add nuw i7 %j_3, 1, !bitwidth !235
  br i1 %icmp_ln280, label %for.inc139, label %for.inc136.split, !llvm.loop !502, !bitwidth !11

for.inc136.split:                                 ; preds = %for.inc136
  %zext_ln280 = zext i7 %j_3 to i12, !bitwidth !434
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([23 x i8]* @empty_18)
  %add_ln282 = add nuw i12 %zext_ln280, %tmp_6, !bitwidth !105
  %zext_ln282 = zext i12 %add_ln282 to i64, !bitwidth !256
  %weights2_addr_1 = getelementptr [4096 x i64], [4096 x i64]* %weights2, i64 0, i64 %zext_ln282, !bitwidth !7
  %weights2_load_1 = load i64, i64* %weights2_addr_1, align 8, !bitwidth !20, !dep_idx !515, !deps !516
  %bitcast_ln282 = bitcast i64 %weights2_load_1 to double, !bitwidth !20
  %div3 = fdiv double %bitcast_ln282, %norm_4, !bitwidth !20
  %bitcast_ln282_1 = bitcast double %div3 to i64, !bitwidth !20
  store i64 %bitcast_ln282_1, i64* %weights2_addr_1, align 8, !bitwidth !11, !dep_idx !519, !deps !520
  br label %for.inc136, !llvm.loop !502, !bitwidth !11

for.inc139:                                       ; preds = %for.inc136
  store i7 %add_ln277, i7* %i_6, align 1, !bitwidth !11, !dep_idx !524, !deps !525
  br label %update_weights_loop7_1, !llvm.loop !495, !bitwidth !11

update_weights_loop8:                             ; preds = %update_weights_loop7_1
  %i_7 = alloca i7, align 1, !bitwidth !224
  %bias_norm_4_load_1 = load double, double* %bias_norm_4, align 8, !bitwidth !20, !dep_idx !528, !deps !529
  %bias_norm_3 = call double @llvm.sqrt.f64(double %bias_norm_4_load_1), !bitwidth !20
  store i7 0, i7* %i_7, align 1, !bitwidth !11, !dep_idx !531, !deps !532
  br label %for.inc150, !bitwidth !11

for.inc150:                                       ; preds = %for.inc150.split, %update_weights_loop8
  %i_19 = load i7, i7* %i_7, align 1, !bitwidth !235, !dep_idx !535, !deps !536
  %icmp_ln286 = icmp eq i7 %i_19, -64, !bitwidth !206
  %add_ln286 = add nuw i7 %i_19, 1, !bitwidth !235
  br i1 %icmp_ln286, label %update_weights_loop9_1.preheader, label %for.inc150.split, !llvm.loop !539, !bitwidth !11

update_weights_loop9_1.preheader:                 ; preds = %for.inc150
  %i_8 = alloca i7, align 1, !bitwidth !224
  %norm_6 = alloca double, align 8, !bitwidth !11
  store double 0.000000e+00, double* %norm_6, align 8, !bitwidth !11, !dep_idx !546, !deps !547
  store i7 0, i7* %i_8, align 1, !bitwidth !11, !dep_idx !551, !deps !552
  br label %update_weights_loop9_1, !bitwidth !11

for.inc150.split:                                 ; preds = %for.inc150
  %zext_ln286 = zext i7 %i_19 to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_41)
  %biases2_addr_1 = getelementptr [64 x i64], [64 x i64]* %biases2, i64 0, i64 %zext_ln286, !bitwidth !7
  %biases2_load_1 = load i64, i64* %biases2_addr_1, align 8, !bitwidth !20, !dep_idx !555, !deps !556
  %bitcast_ln288 = bitcast i64 %biases2_load_1 to double, !bitwidth !20
  %div2 = fdiv double %bitcast_ln288, %bias_norm_3, !bitwidth !20
  %bitcast_ln288_1 = bitcast double %div2 to i64, !bitwidth !20
  store i64 %bitcast_ln288_1, i64* %biases2_addr_1, align 8, !bitwidth !11, !dep_idx !559, !deps !560
  store i7 %add_ln286, i7* %i_7, align 1, !bitwidth !11, !dep_idx !564, !deps !565
  br label %for.inc150, !llvm.loop !539, !bitwidth !11

update_weights_loop9_1:                           ; preds = %for.inc182, %update_weights_loop9_1.preheader
  %i_20 = load i7, i7* %i_8, align 1, !bitwidth !235, !dep_idx !568, !deps !569
  %icmp_ln295 = icmp eq i7 %i_20, -64, !bitwidth !206
  %add_ln295 = add nuw i7 %i_20, 1, !bitwidth !235
  br i1 %icmp_ln295, label %for.inc200.preheader, label %update_weights_loop9_1.split, !llvm.loop !572, !bitwidth !11

for.inc200.preheader:                             ; preds = %update_weights_loop9_1
  %bias_norm_7 = alloca double, align 8, !bitwidth !11
  %i_9 = alloca i2, align 1, !bitwidth !579
  store i2 0, i2* %i_9, align 1, !bitwidth !11, !dep_idx !580, !deps !581
  store double 0.000000e+00, double* %bias_norm_7, align 8, !bitwidth !11, !dep_idx !584, !deps !585
  br label %for.inc200, !bitwidth !11

update_weights_loop9_1.split:                     ; preds = %update_weights_loop9_1
  %zext_ln295 = zext i7 %i_20 to i8, !bitwidth !589
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([21 x i8]* @empty_29)
  %empty_47 = trunc i7 %i_20 to i6, !bitwidth !416
  %p_shl = call i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6 %empty_47, i2 0), !bitwidth !590
  %empty_48 = sub i8 %p_shl, %zext_ln295, !bitwidth !590
  br label %for.inc179, !bitwidth !11

for.inc179:                                       ; preds = %for.inc179.split, %update_weights_loop9_1.split
  %j_4 = phi i2 [ %add_ln298, %for.inc179.split ], [ 0, %update_weights_loop9_1.split ], !bitwidth !591
  %icmp_ln298 = icmp eq i2 %j_4, -1, !bitwidth !206
  %add_ln298 = add nuw i2 %j_4, 1, !bitwidth !591
  br i1 %icmp_ln298, label %for.inc182, label %for.inc179.split, !llvm.loop !592, !bitwidth !11

for.inc179.split:                                 ; preds = %for.inc179
  %norm_6_load_1 = load double, double* %norm_6, align 8, !bitwidth !20, !dep_idx !605, !deps !606
  %zext_ln298 = zext i2 %j_4 to i8, !bitwidth !589
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([23 x i8]* @empty_28)
  %add_ln300 = add i8 %zext_ln298, %empty_48, !bitwidth !590
  %zext_ln300 = zext i8 %add_ln300 to i64, !bitwidth !256
  %d_weights3_addr = getelementptr inbounds [192 x double], [192 x double]* %d_weights3, i64 0, i64 %zext_ln300, !bitwidth !11
  %d_weights3_load = load double, double* %d_weights3_addr, align 8, !bitwidth !20
  %mul10 = fmul double %d_weights3_load, 1.000000e-02, !bitwidth !20
  %weights3_addr = getelementptr [192 x i64], [192 x i64]* %weights3, i64 0, i64 %zext_ln300, !bitwidth !7
  %weights3_load = load i64, i64* %weights3_addr, align 8, !bitwidth !20, !dep_idx !609, !deps !610
  %bitcast_ln300 = bitcast i64 %weights3_load to double, !bitwidth !20
  %sub5 = fsub double %bitcast_ln300, %mul10, !bitwidth !20
  %bitcast_ln300_1 = bitcast double %sub5 to i64, !bitwidth !20
  store i64 %bitcast_ln300_1, i64* %weights3_addr, align 8, !bitwidth !11, !dep_idx !613, !deps !614
  %mul11 = fmul double %sub5, %sub5, !bitwidth !20
  %norm_8 = fadd double %norm_6_load_1, %mul11, !bitwidth !20
  store double %norm_8, double* %norm_6, align 8, !bitwidth !11, !dep_idx !618, !deps !619
  br label %for.inc179, !llvm.loop !592, !bitwidth !11

for.inc182:                                       ; preds = %for.inc179
  store i7 %add_ln295, i7* %i_8, align 1, !bitwidth !11, !dep_idx !622, !deps !623
  br label %update_weights_loop9_1, !llvm.loop !572, !bitwidth !11

for.inc200:                                       ; preds = %for.inc200.split, %for.inc200.preheader
  %i_21 = load i2, i2* %i_9, align 1, !bitwidth !591, !dep_idx !626, !deps !627
  %icmp_ln305 = icmp eq i2 %i_21, -1, !bitwidth !206
  %add_ln305 = add nuw i2 %i_21, 1, !bitwidth !591
  br i1 %icmp_ln305, label %for.end202, label %for.inc200.split, !llvm.loop !630, !bitwidth !11

for.inc200.split:                                 ; preds = %for.inc200
  %bias_norm_7_load = load double, double* %bias_norm_7, align 8, !bitwidth !20, !dep_idx !637, !deps !638
  %zext_ln305 = zext i2 %i_21 to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([22 x i8]* @empty_27)
  %tmp = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %p_read_3, double %p_read_2, double %p_read_1, i2 %i_21), !bitwidth !20
  %mul8 = fmul double %tmp, 1.000000e-02, !bitwidth !20
  %biases3_addr = getelementptr [3 x i64], [3 x i64]* %biases3, i64 0, i64 %zext_ln305, !bitwidth !7
  %biases3_load = load i64, i64* %biases3_addr, align 8, !bitwidth !20, !dep_idx !641, !deps !642
  %bitcast_ln307 = bitcast i64 %biases3_load to double, !bitwidth !20
  %sub4 = fsub double %bitcast_ln307, %mul8, !bitwidth !20
  %bitcast_ln307_1 = bitcast double %sub4 to i64, !bitwidth !20
  store i64 %bitcast_ln307_1, i64* %biases3_addr, align 8, !bitwidth !11, !dep_idx !645, !deps !646
  %mul9 = fmul double %sub4, %sub4, !bitwidth !20
  %bias_norm_8 = fadd double %bias_norm_7_load, %mul9, !bitwidth !20
  store i2 %add_ln305, i2* %i_9, align 1, !bitwidth !11, !dep_idx !650, !deps !651
  store double %bias_norm_8, double* %bias_norm_7, align 8, !bitwidth !11, !dep_idx !654, !deps !655
  br label %for.inc200, !llvm.loop !630, !bitwidth !11

for.end202:                                       ; preds = %for.inc200
  %i_10 = alloca i7, align 1, !bitwidth !224
  %norm_6_load = load double, double* %norm_6, align 8, !bitwidth !20, !dep_idx !658, !deps !659
  %norm_7 = call double @llvm.sqrt.f64(double %norm_6_load), !bitwidth !20
  store i7 0, i7* %i_10, align 1, !bitwidth !11, !dep_idx !661, !deps !662
  br label %update_weights_loop11_1, !bitwidth !11

update_weights_loop11_1:                          ; preds = %for.inc221, %for.end202
  %i_22 = load i7, i7* %i_10, align 1, !bitwidth !235, !dep_idx !665, !deps !666
  %icmp_ln315 = icmp eq i7 %i_22, -64, !bitwidth !206
  %add_ln315 = add nuw i7 %i_22, 1, !bitwidth !235
  br i1 %icmp_ln315, label %update_weights_loop12, label %update_weights_loop11_1.split, !llvm.loop !669, !bitwidth !11

update_weights_loop11_1.split:                    ; preds = %update_weights_loop11_1
  %zext_ln315 = zext i7 %i_22 to i8, !bitwidth !589
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([22 x i8]* @empty_26)
  %empty_49 = trunc i7 %i_22 to i6, !bitwidth !416
  %p_shl1 = call i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6 %empty_49, i2 0), !bitwidth !590
  %empty_50 = sub i8 %p_shl1, %zext_ln315, !bitwidth !590
  br label %for.inc218, !bitwidth !11

for.inc218:                                       ; preds = %for.inc218.split, %update_weights_loop11_1.split
  %j_5 = phi i2 [ %add_ln318, %for.inc218.split ], [ 0, %update_weights_loop11_1.split ], !bitwidth !591
  %icmp_ln318 = icmp eq i2 %j_5, -1, !bitwidth !206
  %add_ln318 = add nuw i2 %j_5, 1, !bitwidth !591
  br i1 %icmp_ln318, label %for.inc221, label %for.inc218.split, !llvm.loop !676, !bitwidth !11

for.inc218.split:                                 ; preds = %for.inc218
  %zext_ln318 = zext i2 %j_5 to i8, !bitwidth !589
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([24 x i8]* @empty_25)
  %add_ln320 = add i8 %zext_ln318, %empty_50, !bitwidth !590
  %zext_ln320 = zext i8 %add_ln320 to i64, !bitwidth !256
  %weights3_addr_1 = getelementptr [192 x i64], [192 x i64]* %weights3, i64 0, i64 %zext_ln320, !bitwidth !7
  %weights3_load_1 = load i64, i64* %weights3_addr_1, align 8, !bitwidth !20, !dep_idx !689, !deps !690
  %bitcast_ln320 = bitcast i64 %weights3_load_1 to double, !bitwidth !20
  %div5 = fdiv double %bitcast_ln320, %norm_7, !bitwidth !20
  %bitcast_ln320_1 = bitcast double %div5 to i64, !bitwidth !20
  store i64 %bitcast_ln320_1, i64* %weights3_addr_1, align 8, !bitwidth !11, !dep_idx !693, !deps !694
  br label %for.inc218, !llvm.loop !676, !bitwidth !11

for.inc221:                                       ; preds = %for.inc218
  store i7 %add_ln315, i7* %i_10, align 1, !bitwidth !11, !dep_idx !698, !deps !699
  br label %update_weights_loop11_1, !llvm.loop !669, !bitwidth !11

update_weights_loop12:                            ; preds = %update_weights_loop11_1
  %i_11 = alloca i2, align 1, !bitwidth !579
  %bias_norm_7_load_1 = load double, double* %bias_norm_7, align 8, !bitwidth !20, !dep_idx !702, !deps !703
  %bias_norm_6 = call double @llvm.sqrt.f64(double %bias_norm_7_load_1), !bitwidth !20
  store i2 0, i2* %i_11, align 1, !bitwidth !11, !dep_idx !705, !deps !706
  br label %for.inc232, !bitwidth !11

for.inc232:                                       ; preds = %for.inc232.split, %update_weights_loop12
  %i_23 = load i2, i2* %i_11, align 1, !bitwidth !591, !dep_idx !709, !deps !710
  %icmp_ln324 = icmp eq i2 %i_23, -1, !bitwidth !206
  %add_ln324 = add nuw i2 %i_23, 1, !bitwidth !591
  br i1 %icmp_ln324, label %for.end234, label %for.inc232.split, !llvm.loop !713, !bitwidth !11

for.inc232.split:                                 ; preds = %for.inc232
  %zext_ln324 = zext i2 %i_23 to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([22 x i8]* @empty_24)
  %biases3_addr_1 = getelementptr [3 x i64], [3 x i64]* %biases3, i64 0, i64 %zext_ln324, !bitwidth !7
  %biases3_load_1 = load i64, i64* %biases3_addr_1, align 8, !bitwidth !20, !dep_idx !720, !deps !721
  %bitcast_ln326 = bitcast i64 %biases3_load_1 to double, !bitwidth !20
  %div4 = fdiv double %bitcast_ln326, %bias_norm_6, !bitwidth !20
  %bitcast_ln326_1 = bitcast double %div4 to i64, !bitwidth !20
  store i64 %bitcast_ln326_1, i64* %biases3_addr_1, align 8, !bitwidth !11, !dep_idx !724, !deps !725
  store i2 %add_ln324, i2* %i_11, align 1, !bitwidth !11, !dep_idx !729, !deps !730
  br label %for.inc232, !llvm.loop !713, !bitwidth !11

for.end234:                                       ; preds = %for.inc232
  ret void, !bitwidth !11
}

; Function Attrs: nounwind
define internal void @matrix_vector_product_with_bias_second_layer.1_Pipeline_add_bias_to_activations_([64 x double]* %activations, [64 x i64]* %biases2) #1 {
newFuncRoot:
  %i_12 = alloca i7, align 1, !bitwidth !224
  call void (...) @_ssdm_op_SpecInterface([64 x i64]* %biases2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  store i7 0, i7* %i_12, align 1, !bitwidth !11, !dep_idx !733, !deps !734
  br label %for.inc.i, !bitwidth !11

add_bias_to_activations.exit.exitStub:            ; preds = %for.inc.i
  ret void, !bitwidth !11

for.inc.i:                                        ; preds = %for.inc.i.split, %newFuncRoot
  %i = load i7, i7* %i_12, align 1, !bitwidth !235, !dep_idx !737, !deps !738
  %icmp_ln48 = icmp eq i7 %i, -64, !bitwidth !206
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64)
  %add_ln48 = add nuw i7 %i, 1, !bitwidth !235
  br i1 %icmp_ln48, label %add_bias_to_activations.exit.exitStub, label %for.inc.i.split, !llvm.loop !741, !bitwidth !11

for.inc.i.split:                                  ; preds = %for.inc.i
  %zext_ln48 = zext i7 %i to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_42)
  call void (...) @_ssdm_op_SpecLoopName([30 x i8]* @empty)
  %activations_addr = getelementptr inbounds [64 x double], [64 x double]* %activations, i64 0, i64 %zext_ln48, !bitwidth !11
  %activations_load = load double, double* %activations_addr, align 8, !alias.scope !758, !noalias !761, !bitwidth !20, !dep_idx !763, !deps !764
  %biases2_addr = getelementptr [64 x i64], [64 x i64]* %biases2, i64 0, i64 %zext_ln48, !bitwidth !7
  %biases2_load = load i64, i64* %biases2_addr, align 8, !bitwidth !20
  %bitcast_ln50 = bitcast i64 %biases2_load to double, !bitwidth !20
  %add_i = fadd double %activations_load, %bitcast_ln50, !bitwidth !20
  store double %add_i, double* %activations_addr, align 8, !alias.scope !758, !noalias !761, !bitwidth !11, !dep_idx !766, !deps !767
  store i7 %add_ln48, i7* %i_12, align 1, !bitwidth !11, !dep_idx !769, !deps !770
  br label %for.inc.i, !llvm.loop !741, !bitwidth !11
}

; Function Attrs: noinline nounwind
define internal fastcc void @matrix_vector_product_with_bias_second_layer.1([64 x i64]* noalias nocapture %biases2, [4096 x i64]* noalias nocapture %weights2, [64 x double]* noalias nocapture align 512 %activations, [64 x double]* noalias nocapture align 512 %input_activations) unnamed_addr #2 {
entry:
  %i = alloca i7, align 1, !bitwidth !224
  call void (...) @_ssdm_op_SpecInterface([64 x i64]* %biases2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([4096 x i64]* %weights2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !187
  store i7 0, i7* %i, align 1, !bitwidth !11, !dep_idx !773, !deps !774
  br label %matrix_vector_product_with_bias_second_layer_loop1_1, !bitwidth !11

matrix_vector_product_with_bias_second_layer_loop1_1: ; preds = %for.inc12, %entry
  %i_24 = load i7, i7* %i, align 1, !bitwidth !235, !dep_idx !777, !deps !778
  %icmp_ln78 = icmp eq i7 %i_24, -64, !bitwidth !206
  %add_ln78 = add nuw i7 %i_24, 1, !bitwidth !235
  br i1 %icmp_ln78, label %for.inc.i.preheader, label %matrix_vector_product_with_bias_second_layer_loop1_1.split, !llvm.loop !781, !bitwidth !11

for.inc.i.preheader:                              ; preds = %matrix_vector_product_with_bias_second_layer_loop1_1
  call void @matrix_vector_product_with_bias_second_layer.1_Pipeline_add_bias_to_activations_([64 x double]* %activations, [64 x i64]* %biases2), !bitwidth !11, !dep_idx !788, !deps !789
  ret void, !bitwidth !11

matrix_vector_product_with_bias_second_layer_loop1_1.split: ; preds = %matrix_vector_product_with_bias_second_layer_loop1_1
  %zext_ln78 = zext i7 %i_24 to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([51 x i8]* @empty_14)
  %activations_addr = getelementptr inbounds [64 x double], [64 x double]* %activations, i64 0, i64 %zext_ln78, !bitwidth !11
  %empty = trunc i7 %i_24 to i6, !bitwidth !416
  %tmp_9 = call i12 @_ssdm_op_BitConcatenate.i12.i6.i6(i6 %empty, i6 0), !bitwidth !105
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %matrix_vector_product_with_bias_second_layer_loop1_1.split
  %j = phi i7 [ %add_ln82, %for.inc.split ], [ 0, %matrix_vector_product_with_bias_second_layer_loop1_1.split ], !bitwidth !235
  %add113 = phi double [ %add, %for.inc.split ], [ 0.000000e+00, %matrix_vector_product_with_bias_second_layer_loop1_1.split ], !bitwidth !20
  %icmp_ln82 = icmp eq i7 %j, -64, !bitwidth !206
  %add_ln82 = add nuw i7 %j, 1, !bitwidth !235
  br i1 %icmp_ln82, label %for.inc12, label %for.inc.split, !llvm.loop !792, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln82 = zext i7 %j to i64, !bitwidth !256
  %zext_ln82_1 = zext i7 %j to i12, !bitwidth !434
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([53 x i8]* @empty_13)
  %add_ln84 = add nuw i12 %zext_ln82_1, %tmp_9, !bitwidth !105
  %zext_ln84 = zext i12 %add_ln84 to i64, !bitwidth !256
  %weights2_addr = getelementptr [4096 x i64], [4096 x i64]* %weights2, i64 0, i64 %zext_ln84, !bitwidth !7
  %weights2_load = load i64, i64* %weights2_addr, align 8, !bitwidth !20
  %bitcast_ln84 = bitcast i64 %weights2_load to double, !bitwidth !20
  %input_activations_addr = getelementptr inbounds [64 x double], [64 x double]* %input_activations, i64 0, i64 %zext_ln82, !bitwidth !11
  %input_activations_load = load double, double* %input_activations_addr, align 8, !bitwidth !20
  %mul8 = fmul double %bitcast_ln84, %input_activations_load, !bitwidth !20
  %add = fadd double %add113, %mul8, !bitwidth !20
  br label %for.inc, !llvm.loop !792, !bitwidth !11

for.inc12:                                        ; preds = %for.inc
  store double %add113, double* %activations_addr, align 8, !bitwidth !11, !dep_idx !805, !deps !806
  store i7 %add_ln78, i7* %i, align 1, !bitwidth !11, !dep_idx !808, !deps !809
  br label %matrix_vector_product_with_bias_second_layer_loop1_1, !llvm.loop !781, !bitwidth !11
}

define internal void @matrix_vector_product_with_bias_output_layer.1_Pipeline_add_bias_to_activations_(double %activations_0, double %activations12_0, double %activations2_0, [3 x i64]* %biases3, double* %activations_2_out, double* %activations12_2_out, double* %activations2_2_out) {
newFuncRoot:
  %i = alloca i2, align 1, !bitwidth !579
  %activations2_2 = alloca double, align 8, !bitwidth !11
  %activations12_2 = alloca double, align 8, !bitwidth !11
  %activations_2 = alloca double, align 8, !bitwidth !11
  call void (...) @_ssdm_op_SpecInterface([3 x i64]* %biases3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  %activations2_0_read = call double @_ssdm_op_Read.ap_auto.double(double %activations2_0), !bitwidth !20
  %activations12_0_read = call double @_ssdm_op_Read.ap_auto.double(double %activations12_0), !bitwidth !20
  %activations_0_read = call double @_ssdm_op_Read.ap_auto.double(double %activations_0), !bitwidth !20
  store double %activations_0_read, double* %activations_2, align 8, !bitwidth !11, !dep_idx !812, !deps !813
  store double %activations12_0_read, double* %activations12_2, align 8, !bitwidth !11, !dep_idx !817, !deps !818
  store double %activations2_0_read, double* %activations2_2, align 8, !bitwidth !11, !dep_idx !822, !deps !823
  store i2 0, i2* %i, align 1, !bitwidth !11, !dep_idx !827, !deps !828
  br label %for.inc.i, !bitwidth !11

add_bias_to_activations.exit.exitStub:            ; preds = %for.inc.i
  %activations2_2_load = load double, double* %activations2_2, align 8, !bitwidth !20, !dep_idx !831, !deps !832
  %activations12_2_load = load double, double* %activations12_2, align 8, !bitwidth !20, !dep_idx !835, !deps !836
  %activations_2_load = load double, double* %activations_2, align 8, !bitwidth !20, !dep_idx !839, !deps !840
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %activations_2_out, double %activations_2_load), !bitwidth !11
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %activations12_2_out, double %activations12_2_load), !bitwidth !11
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %activations2_2_out, double %activations2_2_load), !bitwidth !11
  ret void, !bitwidth !11

for.inc.i:                                        ; preds = %for.inc.i.split5, %newFuncRoot
  %i_25 = load i2, i2* %i, align 1, !bitwidth !591, !dep_idx !843, !deps !844
  %icmp_ln48 = icmp eq i2 %i_25, -1, !bitwidth !206
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  %add_ln48 = add nuw i2 %i_25, 1, !bitwidth !591
  br i1 %icmp_ln48, label %add_bias_to_activations.exit.exitStub, label %for.inc.i.split, !llvm.loop !847, !bitwidth !11

for.inc.i.split5:                                 ; preds = %for.inc.i.split.for.inc.i.split5_crit_edge, %branch2, %for.inc.i.split.for.inc.i.split5_crit_edge5
  store i2 %add_ln48, i2* %i, align 1, !bitwidth !11, !dep_idx !855, !deps !856
  br label %for.inc.i, !llvm.loop !847, !bitwidth !11

for.inc.i.split:                                  ; preds = %for.inc.i
  %activations2_2_load_1 = load double, double* %activations2_2, align 8, !bitwidth !20, !dep_idx !859, !deps !860
  %activations12_2_load_1 = load double, double* %activations12_2, align 8, !bitwidth !20, !dep_idx !862, !deps !863
  %activations_2_load_1 = load double, double* %activations_2, align 8, !bitwidth !20, !dep_idx !865, !deps !866
  %zext_ln48 = zext i2 %i_25 to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_42)
  call void (...) @_ssdm_op_SpecLoopName([30 x i8]* @empty)
  %tmp = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %activations_2_load_1, double %activations12_2_load_1, double %activations2_2_load_1, i2 %i_25), !bitwidth !20
  %biases3_addr = getelementptr [3 x i64], [3 x i64]* %biases3, i64 0, i64 %zext_ln48, !bitwidth !7
  %biases3_load = load i64, i64* %biases3_addr, align 8, !bitwidth !20
  %bitcast_ln50 = bitcast i64 %biases3_load to double, !bitwidth !20
  %add_i = fadd double %tmp, %bitcast_ln50, !bitwidth !20
  switch i2 %i_25, label %branch2 [
    i2 0, label %for.inc.i.split.for.inc.i.split5_crit_edge
    i2 1, label %for.inc.i.split.for.inc.i.split5_crit_edge5
  ], !bitwidth !868

for.inc.i.split.for.inc.i.split5_crit_edge5:      ; preds = %for.inc.i.split
  store double %add_i, double* %activations12_2, align 8, !bitwidth !11, !dep_idx !869, !deps !870
  br label %for.inc.i.split5, !bitwidth !11

branch2:                                          ; preds = %for.inc.i.split
  store double %add_i, double* %activations2_2, align 8, !bitwidth !11, !dep_idx !873, !deps !874
  br label %for.inc.i.split5, !bitwidth !11

for.inc.i.split.for.inc.i.split5_crit_edge:       ; preds = %for.inc.i.split
  store double %add_i, double* %activations_2, align 8, !bitwidth !11, !dep_idx !877, !deps !878
  br label %for.inc.i.split5, !bitwidth !11
}

; Function Attrs: noinline readonly
define internal fastcc { double, double, double } @matrix_vector_product_with_bias_output_layer.1([3 x i64]* noalias nocapture %biases3, [192 x i64]* noalias nocapture %weights3, double %p_read, double %p_read1, double %p_read2, [64 x double]* noalias nocapture align 512 %input_activations) #3 {
entry:
  %j = alloca i2, align 1, !bitwidth !579
  %activations2_0 = alloca double, align 8, !bitwidth !11
  %activations12_0 = alloca double, align 8, !bitwidth !11
  %activations_0 = alloca double, align 8, !bitwidth !11
  %p_read_4 = call double @_ssdm_op_Read.ap_auto.double(double %p_read2), !bitwidth !20
  %p_read14 = call double @_ssdm_op_Read.ap_auto.double(double %p_read1), !bitwidth !20
  %p_read_5 = call double @_ssdm_op_Read.ap_auto.double(double %p_read), !bitwidth !20
  %activations2_2_loc = alloca double, i64 1, align 8, !bitwidth !11
  %activations12_2_loc = alloca double, i64 1, align 8, !bitwidth !11
  %activations_2_loc = alloca double, i64 1, align 8, !bitwidth !11
  call void (...) @_ssdm_op_SpecInterface([3 x i64]* %biases3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([192 x i64]* %weights3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !187
  store double %p_read_5, double* %activations_0, align 8, !bitwidth !11, !dep_idx !881, !deps !882
  store double %p_read14, double* %activations12_0, align 8, !bitwidth !11, !dep_idx !885, !deps !886
  store double %p_read_4, double* %activations2_0, align 8, !bitwidth !11, !dep_idx !889, !deps !890
  store i2 0, i2* %j, align 1, !bitwidth !11, !dep_idx !893, !deps !894
  br label %matrix_vector_product_with_bias_output_layer_loop1_1, !bitwidth !11

matrix_vector_product_with_bias_output_layer_loop1_1: ; preds = %for.inc129, %entry
  %j_6 = load i2, i2* %j, align 1, !bitwidth !591, !dep_idx !897, !deps !898
  %icmp_ln96 = icmp eq i2 %j_6, -1, !bitwidth !206
  %add_ln96 = add nuw i2 %j_6, 1, !bitwidth !591
  br i1 %icmp_ln96, label %for.inc.i.preheader, label %matrix_vector_product_with_bias_output_layer_loop1_1.split, !llvm.loop !901, !bitwidth !11

for.inc.i.preheader:                              ; preds = %matrix_vector_product_with_bias_output_layer_loop1_1
  %activations2_0_load = load double, double* %activations2_0, align 8, !bitwidth !20, !dep_idx !908, !deps !909
  %activations12_0_load = load double, double* %activations12_0, align 8, !bitwidth !20, !dep_idx !912, !deps !913
  %activations_0_load = load double, double* %activations_0, align 8, !bitwidth !20, !dep_idx !916, !deps !917
  call void @matrix_vector_product_with_bias_output_layer.1_Pipeline_add_bias_to_activations_(double %activations_0_load, double %activations12_0_load, double %activations2_0_load, [3 x i64]* %biases3, double* %activations_2_loc, double* %activations12_2_loc, double* %activations2_2_loc), !bitwidth !11, !dep_idx !920, !deps !921
  %activations_2_loc_load = load double, double* %activations_2_loc, align 8, !bitwidth !20, !dep_idx !925, !deps !926
  %activations12_2_loc_load = load double, double* %activations12_2_loc, align 8, !bitwidth !20, !dep_idx !928, !deps !926
  %activations2_2_loc_load = load double, double* %activations2_2_loc, align 8, !bitwidth !20, !dep_idx !929, !deps !926
  %mrv = insertvalue { double, double, double } undef, double %activations_2_loc_load, 0, !bitwidth !11
  %mrv_1 = insertvalue { double, double, double } %mrv, double %activations12_2_loc_load, 1, !bitwidth !11
  %mrv_2 = insertvalue { double, double, double } %mrv_1, double %activations2_2_loc_load, 2, !bitwidth !11
  ret { double, double, double } %mrv_2, !bitwidth !11

matrix_vector_product_with_bias_output_layer_loop1_1.split: ; preds = %matrix_vector_product_with_bias_output_layer_loop1_1
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([51 x i8]* @empty_16)
  %tmp_s = call i8 @_ssdm_op_BitConcatenate.i8.i2.i6(i2 %j_6, i6 0), !bitwidth !590
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %matrix_vector_product_with_bias_output_layer_loop1_1.split
  %i_13 = phi i7 [ %add_ln100, %for.inc.split ], [ 0, %matrix_vector_product_with_bias_output_layer_loop1_1.split ], !bitwidth !235
  %add113 = phi double [ %add, %for.inc.split ], [ 0.000000e+00, %matrix_vector_product_with_bias_output_layer_loop1_1.split ], !bitwidth !20
  %icmp_ln100 = icmp eq i7 %i_13, -64, !bitwidth !206
  %add_ln100 = add nuw i7 %i_13, 1, !bitwidth !235
  br i1 %icmp_ln100, label %for.inc12, label %for.inc.split, !llvm.loop !930, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln100 = zext i7 %i_13 to i64, !bitwidth !256
  %zext_ln100_1 = zext i7 %i_13 to i8, !bitwidth !589
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([53 x i8]* @empty_15)
  %add_ln102 = add nuw i8 %zext_ln100_1, %tmp_s, !bitwidth !590
  %zext_ln102 = zext i8 %add_ln102 to i64, !bitwidth !256
  %weights3_addr = getelementptr [192 x i64], [192 x i64]* %weights3, i64 0, i64 %zext_ln102, !bitwidth !7
  %weights3_load = load i64, i64* %weights3_addr, align 8, !bitwidth !20
  %bitcast_ln102 = bitcast i64 %weights3_load to double, !bitwidth !20
  %input_activations_addr = getelementptr inbounds [64 x double], [64 x double]* %input_activations, i64 0, i64 %zext_ln100, !bitwidth !11
  %input_activations_load = load double, double* %input_activations_addr, align 8, !bitwidth !20
  %mul8 = fmul double %bitcast_ln102, %input_activations_load, !bitwidth !20
  %add = fadd double %add113, %mul8, !bitwidth !20
  br label %for.inc, !llvm.loop !930, !bitwidth !11

for.inc12:                                        ; preds = %for.inc
  switch i2 %j_6, label %branch5 [
    i2 0, label %for.inc12.for.inc129_crit_edge
    i2 1, label %branch4
  ], !bitwidth !868

for.inc12.for.inc129_crit_edge:                   ; preds = %for.inc12
  store double %add113, double* %activations_0, align 8, !bitwidth !11, !dep_idx !943, !deps !944
  br label %for.inc129, !bitwidth !11

for.inc129:                                       ; preds = %branch5, %branch4, %for.inc12.for.inc129_crit_edge
  store i2 %add_ln96, i2* %j, align 1, !bitwidth !11, !dep_idx !946, !deps !947
  br label %matrix_vector_product_with_bias_output_layer_loop1_1, !llvm.loop !901, !bitwidth !11

branch4:                                          ; preds = %for.inc12
  store double %add113, double* %activations12_0, align 8, !bitwidth !11, !dep_idx !950, !deps !951
  br label %for.inc129, !bitwidth !11

branch5:                                          ; preds = %for.inc12
  store double %add113, double* %activations2_0, align 8, !bitwidth !11, !dep_idx !953, !deps !954
  br label %for.inc129, !bitwidth !11
}

; Function Attrs: nounwind
define internal void @matrix_vector_product_with_bias_input_layer.1_Pipeline_add_bias_to_activations_l([64 x double]* %activations, [64 x i64]* %biases1) #1 {
newFuncRoot:
  %i = alloca i7, align 1, !bitwidth !224
  call void (...) @_ssdm_op_SpecInterface([64 x i64]* %biases1, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  store i7 0, i7* %i, align 1, !bitwidth !11, !dep_idx !956, !deps !957
  br label %for.inc.i, !bitwidth !11

add_bias_to_activations.exit.exitStub:            ; preds = %for.inc.i
  ret void, !bitwidth !11

for.inc.i:                                        ; preds = %for.inc.i.split, %newFuncRoot
  %i_26 = load i7, i7* %i, align 1, !bitwidth !235, !dep_idx !960, !deps !961
  %icmp_ln48 = icmp eq i7 %i_26, -64, !bitwidth !206
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64)
  %add_ln48 = add nuw i7 %i_26, 1, !bitwidth !235
  br i1 %icmp_ln48, label %add_bias_to_activations.exit.exitStub, label %for.inc.i.split, !llvm.loop !964, !bitwidth !11

for.inc.i.split:                                  ; preds = %for.inc.i
  %zext_ln48 = zext i7 %i_26 to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_42)
  call void (...) @_ssdm_op_SpecLoopName([30 x i8]* @empty)
  %activations_addr = getelementptr inbounds [64 x double], [64 x double]* %activations, i64 0, i64 %zext_ln48, !bitwidth !11
  %activations_load = load double, double* %activations_addr, align 8, !alias.scope !972, !noalias !975, !bitwidth !20, !dep_idx !977, !deps !978
  %biases1_addr = getelementptr [64 x i64], [64 x i64]* %biases1, i64 0, i64 %zext_ln48, !bitwidth !7
  %biases1_load = load i64, i64* %biases1_addr, align 8, !bitwidth !20
  %bitcast_ln50 = bitcast i64 %biases1_load to double, !bitwidth !20
  %add_i = fadd double %activations_load, %bitcast_ln50, !bitwidth !20
  store double %add_i, double* %activations_addr, align 8, !alias.scope !972, !noalias !975, !bitwidth !11, !dep_idx !980, !deps !981
  store i7 %add_ln48, i7* %i, align 1, !bitwidth !11, !dep_idx !983, !deps !984
  br label %for.inc.i, !llvm.loop !964, !bitwidth !11
}

; Function Attrs: noinline nounwind
define internal fastcc void @matrix_vector_product_with_bias_input_layer.1([64 x i64]* noalias nocapture %biases1, [832 x i64]* noalias nocapture %weights1, [64 x double]* noalias nocapture align 512 %activations, [2119 x i64]* noalias nocapture %training_data, i12 %idx) #2 {
entry:
  %phi_mul = alloca i10, align 2, !bitwidth !987
  %j = alloca i7, align 1, !bitwidth !224
  call void (...) @_ssdm_op_SpecInterface([2119 x i64]* %training_data, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([64 x i64]* %biases1, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecInterface([832 x i64]* %weights1, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !187
  %idx_read = call i12 @_ssdm_op_Read.ap_auto.i12(i12 %idx) #1, !bitwidth !105
  store i7 0, i7* %j, align 1, !bitwidth !11, !dep_idx !988, !deps !989
  store i10 0, i10* %phi_mul, align 2, !bitwidth !11, !dep_idx !992, !deps !993
  br label %matrix_vector_product_with_bias_input_layer_loop1_1, !bitwidth !11

matrix_vector_product_with_bias_input_layer_loop1_1: ; preds = %for.inc12, %entry
  %phi_mul_load = load i10, i10* %phi_mul, align 2, !bitwidth !234, !dep_idx !996, !deps !997
  %j_7 = load i7, i7* %j, align 1, !bitwidth !235, !dep_idx !1000, !deps !1001
  %add_ln60_1 = add i10 %phi_mul_load, 13, !bitwidth !234
  %icmp_ln60 = icmp eq i7 %j_7, -64, !bitwidth !206
  %add_ln60 = add nuw i7 %j_7, 1, !bitwidth !235
  br i1 %icmp_ln60, label %for.inc.i.preheader, label %matrix_vector_product_with_bias_input_layer_loop1_1.split, !llvm.loop !1004, !bitwidth !11

for.inc.i.preheader:                              ; preds = %matrix_vector_product_with_bias_input_layer_loop1_1
  call void @matrix_vector_product_with_bias_input_layer.1_Pipeline_add_bias_to_activations_l([64 x double]* %activations, [64 x i64]* %biases1), !bitwidth !11, !dep_idx !1011, !deps !1012
  ret void, !bitwidth !11

matrix_vector_product_with_bias_input_layer_loop1_1.split: ; preds = %matrix_vector_product_with_bias_input_layer_loop1_1
  %zext_ln60 = zext i7 %j_7 to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([50 x i8]* @empty_12)
  %activations_addr = getelementptr inbounds [64 x double], [64 x double]* %activations, i64 0, i64 %zext_ln60, !bitwidth !11
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %matrix_vector_product_with_bias_input_layer_loop1_1.split
  %i_14 = phi i4 [ %add_ln64, %for.inc.split ], [ 0, %matrix_vector_product_with_bias_input_layer_loop1_1.split ], !bitwidth !199
  %add113 = phi double [ %add, %for.inc.split ], [ 0.000000e+00, %matrix_vector_product_with_bias_input_layer_loop1_1.split ], !bitwidth !20
  %icmp_ln64 = icmp eq i4 %i_14, -3, !bitwidth !206
  %add_ln64 = add nuw i4 %i_14, 1, !bitwidth !199
  br i1 %icmp_ln64, label %for.inc12, label %for.inc.split, !llvm.loop !1014, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln64 = zext i4 %i_14 to i12, !bitwidth !434
  %zext_ln64_1 = zext i4 %i_14 to i10, !bitwidth !255
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 13, i64 13, i64 13), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([52 x i8]* @empty_11)
  %add_ln66 = add nuw i10 %zext_ln64_1, %phi_mul_load, !bitwidth !234
  %zext_ln66 = zext i10 %add_ln66 to i64, !bitwidth !256
  %weights1_addr = getelementptr [832 x i64], [832 x i64]* %weights1, i64 0, i64 %zext_ln66, !bitwidth !7
  %weights1_load = load i64, i64* %weights1_addr, align 8, !bitwidth !20
  %bitcast_ln66 = bitcast i64 %weights1_load to double, !bitwidth !20
  %add_ln66_1 = add i12 %zext_ln64, %idx_read, !bitwidth !105
  %zext_ln66_1 = zext i12 %add_ln66_1 to i64, !bitwidth !256
  %training_data_addr = getelementptr [2119 x i64], [2119 x i64]* %training_data, i64 0, i64 %zext_ln66_1, !bitwidth !7
  %training_data_load = load i64, i64* %training_data_addr, align 8, !bitwidth !20
  %bitcast_ln66_1 = bitcast i64 %training_data_load to double, !bitwidth !20
  %mul8 = fmul double %bitcast_ln66, %bitcast_ln66_1, !bitwidth !20
  %add = fadd double %add113, %mul8, !bitwidth !20
  br label %for.inc, !llvm.loop !1014, !bitwidth !11

for.inc12:                                        ; preds = %for.inc
  store double %add113, double* %activations_addr, align 8, !bitwidth !11, !dep_idx !1027, !deps !1028
  store i7 %add_ln60, i7* %j, align 1, !bitwidth !11, !dep_idx !1030, !deps !1031
  store i10 %add_ln60_1, i10* %phi_mul, align 2, !bitwidth !11, !dep_idx !1034, !deps !1035
  br label %matrix_vector_product_with_bias_input_layer_loop1_1, !llvm.loop !1004, !bitwidth !11
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.sqrt.f64(double) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.exp.f64(double) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, i64, metadata) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata) #4

; Function Attrs: noinline
define internal fastcc void @get_oracle_activations2.1([192 x i64]* noalias nocapture %weights3, double %p_read, double %p_read1, double %p_read2, [64 x double]* noalias nocapture align 512 %oracle_activations, [64 x double]* noalias nocapture align 512 %dactivations) #0 {
entry:
  %i = alloca i7, align 1, !bitwidth !224
  call void (...) @_ssdm_op_SpecInterface([192 x i64]* %weights3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !187
  %p_read_6 = call double @_ssdm_op_Read.ap_auto.double(double %p_read2), !bitwidth !20
  %p_read_7 = call double @_ssdm_op_Read.ap_auto.double(double %p_read1), !bitwidth !20
  %p_read_8 = call double @_ssdm_op_Read.ap_auto.double(double %p_read), !bitwidth !20
  store i7 0, i7* %i, align 1, !bitwidth !11, !dep_idx !1038, !deps !1039
  br label %get_oracle_activations2_loop1_1, !bitwidth !11

get_oracle_activations2_loop1_1:                  ; preds = %for.inc19, %entry
  %i_27 = load i7, i7* %i, align 1, !bitwidth !235, !dep_idx !1042, !deps !1043
  %icmp_ln141 = icmp eq i7 %i_27, -64, !bitwidth !206
  %add_ln141 = add nuw i7 %i_27, 1, !bitwidth !235
  br i1 %icmp_ln141, label %for.end21, label %get_oracle_activations2_loop1_1.split, !llvm.loop !1046, !bitwidth !11

get_oracle_activations2_loop1_1.split:            ; preds = %get_oracle_activations2_loop1_1
  %zext_ln141 = zext i7 %i_27 to i64, !bitwidth !256
  %zext_ln141_1 = zext i7 %i_27 to i8, !bitwidth !589
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([30 x i8]* @empty_7)
  %oracle_activations_addr = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations, i64 0, i64 %zext_ln141, !bitwidth !11
  %empty = trunc i7 %i_27 to i6, !bitwidth !416
  %p_shl = call i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6 %empty, i2 0), !bitwidth !590
  %empty_51 = sub i8 %p_shl, %zext_ln141_1, !bitwidth !590
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %get_oracle_activations2_loop1_1.split
  %j = phi i2 [ %add_ln145, %for.inc.split ], [ 0, %get_oracle_activations2_loop1_1.split ], !bitwidth !591
  %add113 = phi double [ %add, %for.inc.split ], [ 0.000000e+00, %get_oracle_activations2_loop1_1.split ], !bitwidth !20
  %icmp_ln145 = icmp eq i2 %j, -1, !bitwidth !206
  %add_ln145 = add nuw i2 %j, 1, !bitwidth !591
  br i1 %icmp_ln145, label %for.inc19, label %for.inc.split, !llvm.loop !1055, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln145 = zext i2 %j to i8, !bitwidth !589
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([32 x i8]* @empty_17)
  %tmp = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %p_read_8, double %p_read_7, double %p_read_6, i2 %j), !bitwidth !20
  %add_ln147 = add i8 %zext_ln145, %empty_51, !bitwidth !590
  %zext_ln147 = zext i8 %add_ln147 to i64, !bitwidth !256
  %weights3_addr = getelementptr [192 x i64], [192 x i64]* %weights3, i64 0, i64 %zext_ln147, !bitwidth !7
  %weights3_load = load i64, i64* %weights3_addr, align 8, !bitwidth !20
  %bitcast_ln147 = bitcast i64 %weights3_load to double, !bitwidth !20
  %mul8 = fmul double %tmp, %bitcast_ln147, !bitwidth !20
  %add = fadd double %add113, %mul8, !bitwidth !20
  br label %for.inc, !llvm.loop !1055, !bitwidth !11

for.inc19:                                        ; preds = %for.inc
  %dactivations_addr = getelementptr inbounds [64 x double], [64 x double]* %dactivations, i64 0, i64 %zext_ln141, !bitwidth !11
  %dactivations_load = load double, double* %dactivations_addr, align 8, !bitwidth !20
  %mul = fmul double %add113, %dactivations_load, !bitwidth !20
  store double %mul, double* %oracle_activations_addr, align 8, !bitwidth !11
  store i7 %add_ln141, i7* %i, align 1, !bitwidth !11, !dep_idx !1068, !deps !1069
  br label %get_oracle_activations2_loop1_1, !llvm.loop !1046, !bitwidth !11

for.end21:                                        ; preds = %get_oracle_activations2_loop1_1
  ret void, !bitwidth !11
}

; Function Attrs: noinline nounwind
define internal fastcc void @get_oracle_activations1.1([4096 x i64]* noalias nocapture %weights2, [64 x double]* noalias nocapture align 512 %output_differences, [64 x double]* noalias nocapture align 512 %oracle_activations, [64 x double]* noalias nocapture align 512 %dactivations) unnamed_addr #2 {
entry:
  %i = alloca i7, align 1, !bitwidth !224
  call void (...) @_ssdm_op_SpecInterface([4096 x i64]* %weights2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !187
  store i7 0, i7* %i, align 1, !bitwidth !11, !dep_idx !1072, !deps !1073
  br label %get_oracle_activations1_loop1_1, !bitwidth !11

get_oracle_activations1_loop1_1:                  ; preds = %for.inc19, %entry
  %i_28 = load i7, i7* %i, align 1, !bitwidth !235, !dep_idx !1076, !deps !1077
  %icmp_ln174 = icmp eq i7 %i_28, -64, !bitwidth !206
  %add_ln174 = add nuw i7 %i_28, 1, !bitwidth !235
  br i1 %icmp_ln174, label %for.end21, label %get_oracle_activations1_loop1_1.split, !llvm.loop !1080, !bitwidth !11

get_oracle_activations1_loop1_1.split:            ; preds = %get_oracle_activations1_loop1_1
  %zext_ln174 = zext i7 %i_28 to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([30 x i8]* @empty_32)
  %oracle_activations_addr = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations, i64 0, i64 %zext_ln174, !bitwidth !11
  %empty = trunc i7 %i_28 to i6, !bitwidth !416
  %tmp_s = call i12 @_ssdm_op_BitConcatenate.i12.i6.i6(i6 %empty, i6 0), !bitwidth !105
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %get_oracle_activations1_loop1_1.split
  %j = phi i7 [ %add_ln178, %for.inc.split ], [ 0, %get_oracle_activations1_loop1_1.split ], !bitwidth !235
  %add113 = phi double [ %add, %for.inc.split ], [ 0.000000e+00, %get_oracle_activations1_loop1_1.split ], !bitwidth !20
  %icmp_ln178 = icmp eq i7 %j, -64, !bitwidth !206
  %add_ln178 = add nuw i7 %j, 1, !bitwidth !235
  br i1 %icmp_ln178, label %for.inc19, label %for.inc.split, !llvm.loop !1089, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln178 = zext i7 %j to i64, !bitwidth !256
  %zext_ln178_1 = zext i7 %j to i12, !bitwidth !434
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([32 x i8]* @empty_9)
  %output_differences_addr = getelementptr inbounds [64 x double], [64 x double]* %output_differences, i64 0, i64 %zext_ln178, !bitwidth !11
  %output_differences_load = load double, double* %output_differences_addr, align 8, !bitwidth !20
  %add_ln180 = add nuw i12 %zext_ln178_1, %tmp_s, !bitwidth !105
  %zext_ln180 = zext i12 %add_ln180 to i64, !bitwidth !256
  %weights2_addr = getelementptr [4096 x i64], [4096 x i64]* %weights2, i64 0, i64 %zext_ln180, !bitwidth !7
  %weights2_load = load i64, i64* %weights2_addr, align 8, !bitwidth !20
  %bitcast_ln180 = bitcast i64 %weights2_load to double, !bitwidth !20
  %mul8 = fmul double %output_differences_load, %bitcast_ln180, !bitwidth !20
  %add = fadd double %add113, %mul8, !bitwidth !20
  br label %for.inc, !llvm.loop !1089, !bitwidth !11

for.inc19:                                        ; preds = %for.inc
  %dactivations_addr = getelementptr inbounds [64 x double], [64 x double]* %dactivations, i64 0, i64 %zext_ln174, !bitwidth !11
  %dactivations_load = load double, double* %dactivations_addr, align 8, !bitwidth !20
  %mul = fmul double %add113, %dactivations_load, !bitwidth !20
  store double %mul, double* %oracle_activations_addr, align 8, !bitwidth !11
  store i7 %add_ln174, i7* %i, align 1, !bitwidth !11, !dep_idx !1102, !deps !1103
  br label %get_oracle_activations1_loop1_1, !llvm.loop !1080, !bitwidth !11

for.end21:                                        ; preds = %get_oracle_activations1_loop1_1
  ret void, !bitwidth !11
}

; Function Attrs: noinline
define internal fastcc void @get_delta_matrix_weights3([192 x double]* noalias nocapture align 512 %delta_weights3, double %p_read, double %p_read1, double %p_read2, [64 x double]* noalias nocapture align 512 %last_activations) #0 {
entry:
  %i = alloca i7, align 1, !bitwidth !224
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !187
  %p_read28 = call double @_ssdm_op_Read.ap_auto.double(double %p_read2), !bitwidth !20
  %p_read17 = call double @_ssdm_op_Read.ap_auto.double(double %p_read1), !bitwidth !20
  %p_read_9 = call double @_ssdm_op_Read.ap_auto.double(double %p_read), !bitwidth !20
  store i7 0, i7* %i, align 1, !bitwidth !11, !dep_idx !1106, !deps !1107
  br label %get_delta_matrix_weights3_loop1_1, !bitwidth !11

get_delta_matrix_weights3_loop1_1:                ; preds = %for.inc9, %entry
  %i_29 = load i7, i7* %i, align 1, !bitwidth !235, !dep_idx !1110, !deps !1111
  %icmp_ln125 = icmp eq i7 %i_29, -64, !bitwidth !206
  %add_ln125 = add nuw i7 %i_29, 1, !bitwidth !235
  br i1 %icmp_ln125, label %for.end11, label %get_delta_matrix_weights3_loop1_1.split, !llvm.loop !1114, !bitwidth !11

get_delta_matrix_weights3_loop1_1.split:          ; preds = %get_delta_matrix_weights3_loop1_1
  %zext_ln125 = zext i7 %i_29 to i64, !bitwidth !256
  %zext_ln125_1 = zext i7 %i_29 to i8, !bitwidth !589
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([32 x i8]* @empty_30)
  %last_activations_addr = getelementptr inbounds [64 x double], [64 x double]* %last_activations, i64 0, i64 %zext_ln125, !bitwidth !11
  %last_activations_load = load double, double* %last_activations_addr, align 8, !bitwidth !20
  %empty = trunc i7 %i_29 to i6, !bitwidth !416
  %p_shl = call i8 @_ssdm_op_BitConcatenate.i8.i6.i2(i6 %empty, i2 0), !bitwidth !590
  %empty_52 = sub i8 %p_shl, %zext_ln125_1, !bitwidth !590
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %get_delta_matrix_weights3_loop1_1.split
  %j = phi i2 [ %add_ln128, %for.inc.split ], [ 0, %get_delta_matrix_weights3_loop1_1.split ], !bitwidth !591
  %icmp_ln128 = icmp eq i2 %j, -1, !bitwidth !206
  %add_ln128 = add nuw i2 %j, 1, !bitwidth !591
  br i1 %icmp_ln128, label %for.inc9, label %for.inc.split, !llvm.loop !1125, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln128 = zext i2 %j to i8, !bitwidth !589
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([34 x i8]* @empty_6)
  %tmp = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %p_read_9, double %p_read17, double %p_read28, i2 %j), !bitwidth !20
  %mul = fmul double %last_activations_load, %tmp, !bitwidth !20
  %add_ln130 = add i8 %zext_ln128, %empty_52, !bitwidth !590
  %zext_ln130 = zext i8 %add_ln130 to i64, !bitwidth !256
  %delta_weights3_addr = getelementptr inbounds [192 x double], [192 x double]* %delta_weights3, i64 0, i64 %zext_ln130, !bitwidth !11
  store double %mul, double* %delta_weights3_addr, align 8, !bitwidth !11
  br label %for.inc, !llvm.loop !1125, !bitwidth !11

for.inc9:                                         ; preds = %for.inc
  store i7 %add_ln125, i7* %i, align 1, !bitwidth !11, !dep_idx !1138, !deps !1139
  br label %get_delta_matrix_weights3_loop1_1, !llvm.loop !1114, !bitwidth !11

for.end11:                                        ; preds = %get_delta_matrix_weights3_loop1_1
  ret void, !bitwidth !11
}

; Function Attrs: noinline nounwind
define internal fastcc void @get_delta_matrix_weights2([4096 x double]* noalias nocapture align 512 %delta_weights2, [64 x double]* noalias nocapture align 512 %output_difference, [64 x double]* noalias nocapture align 512 %last_activations) unnamed_addr #2 {
entry:
  %i = alloca i7, align 1, !bitwidth !224
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !187
  store i7 0, i7* %i, align 1, !bitwidth !11, !dep_idx !1142, !deps !1143
  br label %get_delta_matrix_weights2_loop1_1, !bitwidth !11

get_delta_matrix_weights2_loop1_1:                ; preds = %for.inc9, %entry
  %i_30 = load i7, i7* %i, align 1, !bitwidth !235, !dep_idx !1146, !deps !1147
  %icmp_ln158 = icmp eq i7 %i_30, -64, !bitwidth !206
  %add_ln158 = add nuw i7 %i_30, 1, !bitwidth !235
  br i1 %icmp_ln158, label %for.end11, label %get_delta_matrix_weights2_loop1_1.split, !llvm.loop !1150, !bitwidth !11

get_delta_matrix_weights2_loop1_1.split:          ; preds = %get_delta_matrix_weights2_loop1_1
  %zext_ln158 = zext i7 %i_30 to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([32 x i8]* @empty_20)
  %last_activations_addr = getelementptr inbounds [64 x double], [64 x double]* %last_activations, i64 0, i64 %zext_ln158, !bitwidth !11
  %last_activations_load = load double, double* %last_activations_addr, align 8, !bitwidth !20
  %empty = trunc i7 %i_30 to i6, !bitwidth !416
  %tmp_s = call i12 @_ssdm_op_BitConcatenate.i12.i6.i6(i6 %empty, i6 0), !bitwidth !105
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %get_delta_matrix_weights2_loop1_1.split
  %j = phi i7 [ %add_ln161, %for.inc.split ], [ 0, %get_delta_matrix_weights2_loop1_1.split ], !bitwidth !235
  %icmp_ln161 = icmp eq i7 %j, -64, !bitwidth !206
  %add_ln161 = add nuw i7 %j, 1, !bitwidth !235
  br i1 %icmp_ln161, label %for.inc9, label %for.inc.split, !llvm.loop !1159, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln161 = zext i7 %j to i64, !bitwidth !256
  %zext_ln161_1 = zext i7 %j to i12, !bitwidth !434
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([34 x i8]* @empty_19)
  %output_difference_addr = getelementptr inbounds [64 x double], [64 x double]* %output_difference, i64 0, i64 %zext_ln161, !bitwidth !11
  %output_difference_load = load double, double* %output_difference_addr, align 8, !bitwidth !20
  %mul = fmul double %last_activations_load, %output_difference_load, !bitwidth !20
  %add_ln163 = add nuw i12 %zext_ln161_1, %tmp_s, !bitwidth !105
  %zext_ln163 = zext i12 %add_ln163 to i64, !bitwidth !256
  %delta_weights2_addr = getelementptr inbounds [4096 x double], [4096 x double]* %delta_weights2, i64 0, i64 %zext_ln163, !bitwidth !11
  store double %mul, double* %delta_weights2_addr, align 8, !bitwidth !11
  br label %for.inc, !llvm.loop !1159, !bitwidth !11

for.inc9:                                         ; preds = %for.inc
  store i7 %add_ln158, i7* %i, align 1, !bitwidth !11, !dep_idx !1172, !deps !1173
  br label %get_delta_matrix_weights2_loop1_1, !llvm.loop !1150, !bitwidth !11

for.end11:                                        ; preds = %get_delta_matrix_weights2_loop1_1
  ret void, !bitwidth !11
}

; Function Attrs: noinline nounwind
define internal fastcc void @get_delta_matrix_weights1.1([832 x double]* noalias nocapture align 512 %delta_weights1, [64 x double]* noalias nocapture align 512 %output_difference, [2119 x i64]* noalias nocapture %training_data, i12 %idx) #2 {
entry:
  %i = alloca i4, align 1, !bitwidth !186
  call void (...) @_ssdm_op_SpecInterface([2119 x i64]* %training_data, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !187
  %idx_read = call i12 @_ssdm_op_Read.ap_auto.i12(i12 %idx) #1, !bitwidth !105
  store i4 0, i4* %i, align 1, !bitwidth !11, !dep_idx !1176, !deps !1177
  br label %get_delta_matrix_weights1_loop1_1, !bitwidth !11

get_delta_matrix_weights1_loop1_1:                ; preds = %for.inc9, %entry
  %i_31 = load i4, i4* %i, align 1, !bitwidth !199, !dep_idx !1180, !deps !1181
  %icmp_ln191 = icmp eq i4 %i_31, -3, !bitwidth !206
  %add_ln191 = add nuw i4 %i_31, 1, !bitwidth !199
  br i1 %icmp_ln191, label %for.end11, label %get_delta_matrix_weights1_loop1_1.split, !llvm.loop !1184, !bitwidth !11

get_delta_matrix_weights1_loop1_1.split:          ; preds = %get_delta_matrix_weights1_loop1_1
  %zext_ln191 = zext i4 %i_31 to i12, !bitwidth !434
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 13, i64 13, i64 13), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([32 x i8]* @empty_23)
  %p_sum = add i12 %zext_ln191, %idx_read, !bitwidth !105
  %p_sum_cast = zext i12 %p_sum to i64, !bitwidth !256
  %training_data_addr = getelementptr [2119 x i64], [2119 x i64]* %training_data, i64 0, i64 %p_sum_cast, !bitwidth !7
  %training_data_load = load i64, i64* %training_data_addr, align 8, !bitwidth !20
  %empty = bitcast i64 %training_data_load to double, !bitwidth !20
  %tmp = call i10 @_ssdm_op_BitConcatenate.i10.i4.i6(i4 %i_31, i6 0), !bitwidth !234
  br label %for.inc, !bitwidth !11

for.inc:                                          ; preds = %for.inc.split, %get_delta_matrix_weights1_loop1_1.split
  %j = phi i7 [ %add_ln194, %for.inc.split ], [ 0, %get_delta_matrix_weights1_loop1_1.split ], !bitwidth !235
  %icmp_ln194 = icmp eq i7 %j, -64, !bitwidth !206
  %add_ln194 = add nuw i7 %j, 1, !bitwidth !235
  br i1 %icmp_ln194, label %for.inc9, label %for.inc.split, !llvm.loop !1193, !bitwidth !11

for.inc.split:                                    ; preds = %for.inc
  %zext_ln194 = zext i7 %j to i64, !bitwidth !256
  %zext_ln194_1 = zext i7 %j to i10, !bitwidth !255
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([34 x i8]* @empty_22)
  %output_difference_addr = getelementptr inbounds [64 x double], [64 x double]* %output_difference, i64 0, i64 %zext_ln194, !bitwidth !11
  %output_difference_load = load double, double* %output_difference_addr, align 8, !bitwidth !20
  %mul = fmul double %empty, %output_difference_load, !bitwidth !20
  %add_ln196 = add nuw i10 %zext_ln194_1, %tmp, !bitwidth !234
  %zext_ln196 = zext i10 %add_ln196 to i64, !bitwidth !256
  %delta_weights1_addr = getelementptr inbounds [832 x double], [832 x double]* %delta_weights1, i64 0, i64 %zext_ln196, !bitwidth !11
  store double %mul, double* %delta_weights1_addr, align 8, !bitwidth !11
  br label %for.inc, !llvm.loop !1193, !bitwidth !11

for.inc9:                                         ; preds = %for.inc
  store i4 %add_ln191, i4* %i, align 1, !bitwidth !11, !dep_idx !1206, !deps !1207
  br label %get_delta_matrix_weights1_loop1_1, !llvm.loop !1184, !bitwidth !11

for.end11:                                        ; preds = %get_delta_matrix_weights1_loop1_1
  ret void, !bitwidth !11
}

; Function Attrs: nounwind
define internal void @backprop_Pipeline_take_difference_loop1(double %output_difference_2_022, double %output_difference_1_021, double %output_difference_0_020, double %net_outputs_0_1_reload, double %net_outputs_1_1_reload, double %net_outputs_2_1_reload, i9 %sub_ln374, [489 x i64]* %training_targets, double %dactivations3_0_1_reload, double %dactivations3_1_1_reload, double %dactivations3_2_1_reload, double* %output_difference_2_1_out, double* %output_difference_1_1_out, double* %output_difference_0_1_out) #1 {
newFuncRoot:
  %i_20 = alloca i2, align 1, !bitwidth !579
  %output_difference_0_1 = alloca double, align 8, !bitwidth !11
  %output_difference_1_1 = alloca double, align 8, !bitwidth !11
  %output_difference_2_1 = alloca double, align 8, !bitwidth !11
  call void (...) @_ssdm_op_SpecInterface([489 x i64]* %training_targets, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  %dactivations3_2_1_reload_read = call double @_ssdm_op_Read.ap_auto.double(double %dactivations3_2_1_reload) #1, !bitwidth !20
  %dactivations3_1_1_reload_read = call double @_ssdm_op_Read.ap_auto.double(double %dactivations3_1_1_reload) #1, !bitwidth !20
  %dactivations3_0_1_reload_read = call double @_ssdm_op_Read.ap_auto.double(double %dactivations3_0_1_reload) #1, !bitwidth !20
  %sub_ln374_read = call i9 @_ssdm_op_Read.ap_auto.i9(i9 %sub_ln374) #1, !bitwidth !138
  %net_outputs_2_1_reload_read = call double @_ssdm_op_Read.ap_auto.double(double %net_outputs_2_1_reload) #1, !bitwidth !20
  %net_outputs_1_1_reload_read = call double @_ssdm_op_Read.ap_auto.double(double %net_outputs_1_1_reload) #1, !bitwidth !20
  %net_outputs_0_1_reload_read = call double @_ssdm_op_Read.ap_auto.double(double %net_outputs_0_1_reload) #1, !bitwidth !20
  %output_difference_0_020_read = call double @_ssdm_op_Read.ap_auto.double(double %output_difference_0_020) #1, !bitwidth !20
  %output_difference_1_021_read = call double @_ssdm_op_Read.ap_auto.double(double %output_difference_1_021) #1, !bitwidth !20
  %output_difference_2_022_read = call double @_ssdm_op_Read.ap_auto.double(double %output_difference_2_022) #1, !bitwidth !20
  store double %output_difference_2_022_read, double* %output_difference_2_1, align 8, !bitwidth !11, !dep_idx !1210, !deps !1211
  store double %output_difference_1_021_read, double* %output_difference_1_1, align 8, !bitwidth !11, !dep_idx !1214, !deps !1215
  store double %output_difference_0_020_read, double* %output_difference_0_1, align 8, !bitwidth !11, !dep_idx !1218, !deps !1219
  store i2 0, i2* %i_20, align 1, !bitwidth !11, !dep_idx !1222, !deps !1223
  br label %for.inc.i47, !bitwidth !11

take_difference.exit.exitStub:                    ; preds = %for.inc.i47
  %output_difference_0_1_load = load double, double* %output_difference_0_1, align 8, !bitwidth !20, !dep_idx !1226, !deps !1227
  %output_difference_1_1_load = load double, double* %output_difference_1_1, align 8, !bitwidth !20, !dep_idx !1230, !deps !1231
  %output_difference_2_1_load = load double, double* %output_difference_2_1, align 8, !bitwidth !20, !dep_idx !1234, !deps !1235
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %output_difference_2_1_out, double %output_difference_2_1_load) #1, !bitwidth !11
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %output_difference_1_1_out, double %output_difference_1_1_load) #1, !bitwidth !11
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %output_difference_0_1_out, double %output_difference_0_1_load) #1, !bitwidth !11
  ret void, !bitwidth !11

for.inc.i47:                                      ; preds = %for.inc.i47.split39, %newFuncRoot
  %i = load i2, i2* %i_20, align 1, !bitwidth !591, !dep_idx !1238, !deps !1239
  %icmp_ln114 = icmp eq i2 %i, -1, !bitwidth !206
  %add_ln114 = add nuw i2 %i, 1, !bitwidth !591
  br i1 %icmp_ln114, label %take_difference.exit.exitStub, label %for.inc.i47.split, !llvm.loop !1242, !bitwidth !11

for.inc.i47.split39:                              ; preds = %for.inc.i47.split.for.inc.i47.split39_crit_edge, %branch14, %for.inc.i47.split.for.inc.i47.split39_crit_edge11
  store i2 %add_ln114, i2* %i_20, align 1, !bitwidth !11, !dep_idx !1260, !deps !1261
  br label %for.inc.i47, !llvm.loop !1242, !bitwidth !11

for.inc.i47.split:                                ; preds = %for.inc.i47
  %zext_ln114 = zext i2 %i to i9, !bitwidth !1264
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_42)
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([22 x i8]* @empty_4)
  %tmp_8 = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %net_outputs_0_1_reload_read, double %net_outputs_1_1_reload_read, double %net_outputs_2_1_reload_read, i2 %i), !bitwidth !20
  %add_ln116 = add i9 %zext_ln114, %sub_ln374_read, !bitwidth !138
  %zext_ln116 = zext i9 %add_ln116 to i64, !bitwidth !256
  %training_targets_addr = getelementptr [489 x i64], [489 x i64]* %training_targets, i64 0, i64 %zext_ln116, !bitwidth !7
  %training_targets_load = load i64, i64* %training_targets_addr, align 8, !bitwidth !20
  %bitcast_ln116 = bitcast i64 %training_targets_load to double, !bitwidth !20
  %sub_i4 = fsub double %tmp_8, %bitcast_ln116, !bitwidth !20
  %bitcast_ln116_1 = bitcast double %sub_i4 to i64, !bitwidth !20
  %xor_ln116 = xor i64 %bitcast_ln116_1, -9223372036854775808, !bitwidth !20
  %bitcast_ln116_2 = bitcast i64 %xor_ln116 to double, !bitwidth !20
  %tmp_9 = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %dactivations3_0_1_reload_read, double %dactivations3_1_1_reload_read, double %dactivations3_2_1_reload_read, i2 %i), !bitwidth !20
  %output_difference_1 = fmul double %bitcast_ln116_2, %tmp_9, !bitwidth !20
  switch i2 %i, label %branch14 [
    i2 0, label %for.inc.i47.split.for.inc.i47.split39_crit_edge
    i2 1, label %for.inc.i47.split.for.inc.i47.split39_crit_edge11
  ], !bitwidth !868

for.inc.i47.split.for.inc.i47.split39_crit_edge11: ; preds = %for.inc.i47.split
  store double %output_difference_1, double* %output_difference_1_1, align 8, !bitwidth !11, !dep_idx !1265, !deps !1266
  br label %for.inc.i47.split39, !bitwidth !11

branch14:                                         ; preds = %for.inc.i47.split
  store double %output_difference_1, double* %output_difference_2_1, align 8, !bitwidth !11, !dep_idx !1268, !deps !1269
  br label %for.inc.i47.split39, !bitwidth !11

for.inc.i47.split.for.inc.i47.split39_crit_edge:  ; preds = %for.inc.i47.split
  store double %output_difference_1, double* %output_difference_0_1, align 8, !bitwidth !11, !dep_idx !1271, !deps !1272
  br label %for.inc.i47.split39, !bitwidth !11
}

; Function Attrs: nounwind
define internal void @backprop_Pipeline_soft_max_loop2(double %net_outputs_2_06, double %net_outputs_1_05, double %net_outputs_0_04, double %activations3_0_4_reload, double %activations3_1_4_reload, double %activations3_2_4_reload, double %sum_reload, double* %net_outputs_2_1_out, double* %net_outputs_1_1_out, double* %net_outputs_0_1_out) #1 {
newFuncRoot:
  %i_19 = alloca i2, align 1, !bitwidth !579
  %net_outputs_0_1 = alloca double, align 8, !bitwidth !11
  %net_outputs_1_1 = alloca double, align 8, !bitwidth !11
  %net_outputs_2_1 = alloca double, align 8, !bitwidth !11
  %sum_reload_read = call double @_ssdm_op_Read.ap_auto.double(double %sum_reload) #1, !bitwidth !20
  %activations3_2_4_reload_read = call double @_ssdm_op_Read.ap_auto.double(double %activations3_2_4_reload) #1, !bitwidth !20
  %activations3_1_4_reload_read = call double @_ssdm_op_Read.ap_auto.double(double %activations3_1_4_reload) #1, !bitwidth !20
  %activations3_0_4_reload_read = call double @_ssdm_op_Read.ap_auto.double(double %activations3_0_4_reload) #1, !bitwidth !20
  %net_outputs_0_04_read = call double @_ssdm_op_Read.ap_auto.double(double %net_outputs_0_04) #1, !bitwidth !20
  %net_outputs_1_05_read = call double @_ssdm_op_Read.ap_auto.double(double %net_outputs_1_05) #1, !bitwidth !20
  %net_outputs_2_06_read = call double @_ssdm_op_Read.ap_auto.double(double %net_outputs_2_06) #1, !bitwidth !20
  store double %net_outputs_2_06_read, double* %net_outputs_2_1, align 8, !bitwidth !11, !dep_idx !1274, !deps !1275
  store double %net_outputs_1_05_read, double* %net_outputs_1_1, align 8, !bitwidth !11, !dep_idx !1278, !deps !1279
  store double %net_outputs_0_04_read, double* %net_outputs_0_1, align 8, !bitwidth !11, !dep_idx !1282, !deps !1283
  store i2 0, i2* %i_19, align 1, !bitwidth !11, !dep_idx !1286, !deps !1287
  br label %for.inc9.i, !bitwidth !11

soft_max.exit.exitStub:                           ; preds = %for.inc9.i
  %net_outputs_0_1_load = load double, double* %net_outputs_0_1, align 8, !bitwidth !20, !dep_idx !1290, !deps !1291
  %net_outputs_1_1_load = load double, double* %net_outputs_1_1, align 8, !bitwidth !20, !dep_idx !1294, !deps !1295
  %net_outputs_2_1_load = load double, double* %net_outputs_2_1, align 8, !bitwidth !20, !dep_idx !1298, !deps !1299
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %net_outputs_2_1_out, double %net_outputs_2_1_load) #1, !bitwidth !11
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %net_outputs_1_1_out, double %net_outputs_1_1_load) #1, !bitwidth !11
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %net_outputs_0_1_out, double %net_outputs_0_1_load) #1, !bitwidth !11
  ret void, !bitwidth !11

for.inc9.i:                                       ; preds = %for.inc9.i.split30, %newFuncRoot
  %i = load i2, i2* %i_19, align 1, !bitwidth !591, !dep_idx !1302, !deps !1303
  %icmp_ln27 = icmp eq i2 %i, -1, !bitwidth !206
  %add_ln27 = add nuw i2 %i, 1, !bitwidth !591
  br i1 %icmp_ln27, label %soft_max.exit.exitStub, label %for.inc9.i.split, !llvm.loop !1306, !bitwidth !11

for.inc9.i.split30:                               ; preds = %for.inc9.i.split.for.inc9.i.split30_crit_edge, %branch11, %for.inc9.i.split.for.inc9.i.split30_crit_edge8
  store i2 %add_ln27, i2* %i_19, align 1, !bitwidth !11, !dep_idx !1317, !deps !1318
  br label %for.inc9.i, !llvm.loop !1306, !bitwidth !11

for.inc9.i.split:                                 ; preds = %for.inc9.i
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_42)
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([15 x i8]* @empty_3)
  %tmp_7 = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %activations3_0_4_reload_read, double %activations3_1_4_reload_read, double %activations3_2_4_reload_read, i2 %i), !bitwidth !20
  %bitcast_ln29 = bitcast double %tmp_7 to i64, !bitwidth !20
  %xor_ln29 = xor i64 %bitcast_ln29, -9223372036854775808, !bitwidth !20
  %bitcast_ln29_1 = bitcast i64 %xor_ln29 to double, !bitwidth !20
  %tmp_4 = call double @llvm.exp.f64(double %bitcast_ln29_1), !bitwidth !20
  %net_outputs_1 = fdiv double %tmp_4, %sum_reload_read, !bitwidth !20
  switch i2 %i, label %branch11 [
    i2 0, label %for.inc9.i.split.for.inc9.i.split30_crit_edge
    i2 1, label %for.inc9.i.split.for.inc9.i.split30_crit_edge8
  ], !bitwidth !868

for.inc9.i.split.for.inc9.i.split30_crit_edge8:   ; preds = %for.inc9.i.split
  store double %net_outputs_1, double* %net_outputs_1_1, align 8, !bitwidth !11, !dep_idx !1321, !deps !1322
  br label %for.inc9.i.split30, !bitwidth !11

branch11:                                         ; preds = %for.inc9.i.split
  store double %net_outputs_1, double* %net_outputs_2_1, align 8, !bitwidth !11, !dep_idx !1324, !deps !1325
  br label %for.inc9.i.split30, !bitwidth !11

for.inc9.i.split.for.inc9.i.split30_crit_edge:    ; preds = %for.inc9.i.split
  store double %net_outputs_1, double* %net_outputs_0_1, align 8, !bitwidth !11, !dep_idx !1327, !deps !1328
  br label %for.inc9.i.split30, !bitwidth !11
}

; Function Attrs: nounwind
define internal void @backprop_Pipeline_soft_max_loop1(double %activations3_0_4_reload, double %activations3_1_4_reload, double %activations3_2_4_reload, double* %sum_out) #1 {
newFuncRoot:
  %sum = alloca double, align 8, !bitwidth !11
  %i_18 = alloca i2, align 1, !bitwidth !579
  %activations3_2_4_reload_read = call double @_ssdm_op_Read.ap_auto.double(double %activations3_2_4_reload) #1, !bitwidth !20
  %activations3_1_4_reload_read = call double @_ssdm_op_Read.ap_auto.double(double %activations3_1_4_reload) #1, !bitwidth !20
  %activations3_0_4_reload_read = call double @_ssdm_op_Read.ap_auto.double(double %activations3_0_4_reload) #1, !bitwidth !20
  store i2 0, i2* %i_18, align 1, !bitwidth !11, !dep_idx !1330, !deps !1331
  store double 0.000000e+00, double* %sum, align 8, !bitwidth !11, !dep_idx !1334, !deps !1335
  br label %for.inc.i35, !bitwidth !11

for.inc9.i.preheader.exitStub:                    ; preds = %for.inc.i35
  %sum_load_1 = load double, double* %sum, align 8, !bitwidth !20, !dep_idx !1339, !deps !1340
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %sum_out, double %sum_load_1) #1, !bitwidth !11
  ret void, !bitwidth !11

for.inc.i35:                                      ; preds = %for.inc.i35.split, %newFuncRoot
  %i = load i2, i2* %i_18, align 1, !bitwidth !591, !dep_idx !1343, !deps !1344
  %icmp_ln22 = icmp eq i2 %i, -1, !bitwidth !206
  %add_ln22 = add nuw i2 %i, 1, !bitwidth !591
  br i1 %icmp_ln22, label %for.inc9.i.preheader.exitStub, label %for.inc.i35.split, !llvm.loop !1347, !bitwidth !11

for.inc.i35.split:                                ; preds = %for.inc.i35
  %sum_load = load double, double* %sum, align 8, !bitwidth !20, !dep_idx !1354, !deps !1355
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_42)
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([15 x i8]* @empty_2)
  %tmp_6 = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %activations3_0_4_reload_read, double %activations3_1_4_reload_read, double %activations3_2_4_reload_read, i2 %i), !bitwidth !20
  %bitcast_ln24 = bitcast double %tmp_6 to i64, !bitwidth !20
  %xor_ln24 = xor i64 %bitcast_ln24, -9223372036854775808, !bitwidth !20
  %bitcast_ln24_1 = bitcast i64 %xor_ln24 to double, !bitwidth !20
  %tmp_3 = call double @llvm.exp.f64(double %bitcast_ln24_1), !bitwidth !20
  %sum_1 = fadd double %sum_load, %tmp_3, !bitwidth !20
  store i2 %add_ln22, i2* %i_18, align 1, !bitwidth !11, !dep_idx !1357, !deps !1358
  store double %sum_1, double* %sum, align 8, !bitwidth !11, !dep_idx !1361, !deps !1362
  br label %for.inc.i35, !llvm.loop !1347, !bitwidth !11
}

; Function Attrs: nounwind
define internal void @backprop_Pipeline_backprop_loop1_1(double %activations3_2_0, double %activations3_1_0, double %activations3_0_0, [64 x double]* %activations1, [64 x double]* %activations2, double* %activations3_2_1_out, double* %activations3_1_1_out, double* %activations3_0_1_out) #1 {
newFuncRoot:
  %j = alloca i7, align 1, !bitwidth !224
  %activations3_0_1 = alloca double, align 8, !bitwidth !11
  %activations3_1_1 = alloca double, align 8, !bitwidth !11
  %activations3_2_1 = alloca double, align 8, !bitwidth !11
  %activations3_0_0_read = call double @_ssdm_op_Read.ap_auto.double(double %activations3_0_0) #1, !bitwidth !20
  %activations3_1_0_read = call double @_ssdm_op_Read.ap_auto.double(double %activations3_1_0) #1, !bitwidth !20
  %activations3_2_0_read = call double @_ssdm_op_Read.ap_auto.double(double %activations3_2_0) #1, !bitwidth !20
  store double %activations3_2_0_read, double* %activations3_2_1, align 8, !bitwidth !11, !dep_idx !1365, !deps !1366
  store double %activations3_1_0_read, double* %activations3_1_1, align 8, !bitwidth !11, !dep_idx !1369, !deps !1370
  store double %activations3_0_0_read, double* %activations3_0_1, align 8, !bitwidth !11, !dep_idx !1373, !deps !1374
  store i7 0, i7* %j, align 1, !bitwidth !11, !dep_idx !1377, !deps !1378
  br label %for.body3, !bitwidth !11

for.inc52.exitStub:                               ; preds = %for.body3
  %activations3_0_1_load = load double, double* %activations3_0_1, align 8, !bitwidth !20, !dep_idx !1381, !deps !1382
  %activations3_1_1_load = load double, double* %activations3_1_1, align 8, !bitwidth !20, !dep_idx !1385, !deps !1386
  %activations3_2_1_load = load double, double* %activations3_2_1, align 8, !bitwidth !20, !dep_idx !1389, !deps !1390
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %activations3_2_1_out, double %activations3_2_1_load) #1, !bitwidth !11
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %activations3_1_1_out, double %activations3_1_1_load) #1, !bitwidth !11
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %activations3_0_1_out, double %activations3_0_1_load) #1, !bitwidth !11
  ret void, !bitwidth !11

for.body3:                                        ; preds = %for.inc, %newFuncRoot
  %j_8 = load i7, i7* %j, align 1, !bitwidth !235, !dep_idx !1393, !deps !1394
  %icmp_ln359 = icmp eq i7 %j_8, -64, !bitwidth !206
  %add_ln359 = add nuw i7 %j_8, 1, !bitwidth !235
  br i1 %icmp_ln359, label %for.inc52.exitStub, label %for.body3.split, !llvm.loop !1397, !bitwidth !11

for.inc:                                          ; preds = %if.then.for.inc_crit_edge, %branch5, %if.then.for.inc_crit_edge7, %for.body3.split
  store i7 %add_ln359, i7* %j, align 1, !bitwidth !11, !dep_idx !1408, !deps !1409
  br label %for.body3, !llvm.loop !1397, !bitwidth !11

for.body3.split:                                  ; preds = %for.body3
  %zext_ln359 = zext i7 %j_8 to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_42)
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([17 x i8]* @empty_0)
  %activations1_addr = getelementptr inbounds [64 x double], [64 x double]* %activations1, i64 0, i64 %zext_ln359, !bitwidth !11
  store double 0.000000e+00, double* %activations1_addr, align 8, !bitwidth !11
  %activations2_addr = getelementptr inbounds [64 x double], [64 x double]* %activations2, i64 0, i64 %zext_ln359, !bitwidth !11
  store double 0.000000e+00, double* %activations2_addr, align 8, !bitwidth !11
  %icmp_ln363 = icmp ult i7 %j_8, 3, !bitwidth !206
  br i1 %icmp_ln363, label %if.then, label %for.inc, !bitwidth !11

if.then:                                          ; preds = %for.body3.split
  %trunc_ln364 = trunc i7 %j_8 to i2, !bitwidth !591
  switch i2 %trunc_ln364, label %branch5 [
    i2 0, label %if.then.for.inc_crit_edge
    i2 1, label %if.then.for.inc_crit_edge7
  ], !bitwidth !868

if.then.for.inc_crit_edge7:                       ; preds = %if.then
  store double 0.000000e+00, double* %activations3_1_1, align 8, !bitwidth !11, !dep_idx !1412, !deps !1413
  br label %for.inc, !bitwidth !11

branch5:                                          ; preds = %if.then
  store double 0.000000e+00, double* %activations3_2_1, align 8, !bitwidth !11, !dep_idx !1415, !deps !1416
  br label %for.inc, !bitwidth !11

if.then.for.inc_crit_edge:                        ; preds = %if.then
  store double 0.000000e+00, double* %activations3_0_1, align 8, !bitwidth !11, !dep_idx !1418, !deps !1419
  br label %for.inc, !bitwidth !11
}

; Function Attrs: nounwind
define internal void @backprop_Pipeline_RELU_loop12(double %activations3_2, double %activations3_1, double %activations3_0, double %dactivations3_2_03, double %dactivations3_1_02, double %dactivations3_0_01, double* %activations3_2_4_out, double* %activations3_1_4_out, double* %activations3_0_4_out, double* %dactivations3_2_1_out, double* %dactivations3_1_1_out, double* %dactivations3_0_1_out) #1 {
newFuncRoot:
  %i_17 = alloca i2, align 1, !bitwidth !579
  %dactivations3_0_1 = alloca double, align 8, !bitwidth !11
  %dactivations3_1_1 = alloca double, align 8, !bitwidth !11
  %dactivations3_2_1 = alloca double, align 8, !bitwidth !11
  %activations3_0_4 = alloca double, align 8, !bitwidth !11
  %activations3_1_4 = alloca double, align 8, !bitwidth !11
  %activations3_2_4 = alloca double, align 8, !bitwidth !11
  %dactivations3_0_01_read = call double @_ssdm_op_Read.ap_auto.double(double %dactivations3_0_01) #1, !bitwidth !20
  %dactivations3_1_02_read = call double @_ssdm_op_Read.ap_auto.double(double %dactivations3_1_02) #1, !bitwidth !20
  %dactivations3_2_03_read = call double @_ssdm_op_Read.ap_auto.double(double %dactivations3_2_03) #1, !bitwidth !20
  %activations3_0_read = call double @_ssdm_op_Read.ap_auto.double(double %activations3_0) #1, !bitwidth !20
  %activations3_1_read = call double @_ssdm_op_Read.ap_auto.double(double %activations3_1) #1, !bitwidth !20
  %activations3_2_read = call double @_ssdm_op_Read.ap_auto.double(double %activations3_2) #1, !bitwidth !20
  store double %activations3_2_read, double* %activations3_2_4, align 8, !bitwidth !11, !dep_idx !1421, !deps !1422
  store double %activations3_1_read, double* %activations3_1_4, align 8, !bitwidth !11, !dep_idx !1426, !deps !1427
  store double %activations3_0_read, double* %activations3_0_4, align 8, !bitwidth !11, !dep_idx !1431, !deps !1432
  store double %dactivations3_2_03_read, double* %dactivations3_2_1, align 8, !bitwidth !11, !dep_idx !1436, !deps !1437
  store double %dactivations3_1_02_read, double* %dactivations3_1_1, align 8, !bitwidth !11, !dep_idx !1440, !deps !1441
  store double %dactivations3_0_01_read, double* %dactivations3_0_1, align 8, !bitwidth !11, !dep_idx !1444, !deps !1445
  store i2 0, i2* %i_17, align 1, !bitwidth !11, !dep_idx !1448, !deps !1449
  br label %for.inc.i30, !bitwidth !11

for.inc.i35.preheader.exitStub:                   ; preds = %for.inc.i30
  %dactivations3_0_1_load = load double, double* %dactivations3_0_1, align 8, !bitwidth !20, !dep_idx !1452, !deps !1453
  %dactivations3_1_1_load = load double, double* %dactivations3_1_1, align 8, !bitwidth !20, !dep_idx !1456, !deps !1457
  %dactivations3_2_1_load = load double, double* %dactivations3_2_1, align 8, !bitwidth !20, !dep_idx !1460, !deps !1461
  %activations3_0_4_load = load double, double* %activations3_0_4, align 8, !bitwidth !20, !dep_idx !1464, !deps !1465
  %activations3_1_4_load = load double, double* %activations3_1_4, align 8, !bitwidth !20, !dep_idx !1468, !deps !1469
  %activations3_2_4_load = load double, double* %activations3_2_4, align 8, !bitwidth !20, !dep_idx !1472, !deps !1473
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %activations3_2_4_out, double %activations3_2_4_load) #1, !bitwidth !11
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %activations3_1_4_out, double %activations3_1_4_load) #1, !bitwidth !11
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %activations3_0_4_out, double %activations3_0_4_load) #1, !bitwidth !11
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %dactivations3_2_1_out, double %dactivations3_2_1_load) #1, !bitwidth !11
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %dactivations3_1_1_out, double %dactivations3_1_1_load) #1, !bitwidth !11
  call void @_ssdm_op_Write.ap_auto.doubleP0A(double* %dactivations3_0_1_out, double %dactivations3_0_1_load) #1, !bitwidth !11
  ret void, !bitwidth !11

for.inc.i30:                                      ; preds = %for.inc.i30.split9, %newFuncRoot
  %i = load i2, i2* %i_17, align 1, !bitwidth !591, !dep_idx !1476, !deps !1477
  %icmp_ln36 = icmp eq i2 %i, -1, !bitwidth !206
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 3, i64 3, i64 3)
  %add_ln36 = add nuw i2 %i, 1, !bitwidth !591
  br i1 %icmp_ln36, label %for.inc.i35.preheader.exitStub, label %for.inc.i30.split, !llvm.loop !1480, !bitwidth !11

for.inc.i30.split9:                               ; preds = %for.inc.i30.split.for.inc.i30.split9_crit_edge, %branch8, %for.inc.i30.split.for.inc.i30.split9_crit_edge8
  store i2 %add_ln36, i2* %i_17, align 1, !bitwidth !11, !dep_idx !1489, !deps !1490
  br label %for.inc.i30, !llvm.loop !1480, !bitwidth !11

for.inc.i30.split:                                ; preds = %for.inc.i30
  %activations3_0_4_load_1 = load double, double* %activations3_0_4, align 8, !bitwidth !20, !dep_idx !1493, !deps !1494
  %activations3_1_4_load_1 = load double, double* %activations3_1_4, align 8, !bitwidth !20, !dep_idx !1496, !deps !1497
  %activations3_2_4_load_1 = load double, double* %activations3_2_4, align 8, !bitwidth !20, !dep_idx !1499, !deps !1500
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_42)
  call void (...) @_ssdm_op_SpecLoopName([11 x i8]* @empty_1)
  %tmp_5 = call double @_ssdm_op_Mux.ap_auto.3double.i2(double %activations3_0_4_load_1, double %activations3_1_4_load_1, double %activations3_2_4_load_1, i2 %i), !bitwidth !20
  %sub_i2 = fsub double 1.000000e+00, %tmp_5, !bitwidth !20
  %dactivations3_1 = fmul double %tmp_5, %sub_i2, !bitwidth !20
  %bitcast_ln39 = bitcast double %tmp_5 to i64, !bitwidth !20
  %xor_ln39 = xor i64 %bitcast_ln39, -9223372036854775808, !bitwidth !20
  %bitcast_ln39_1 = bitcast i64 %xor_ln39 to double, !bitwidth !20
  %tmp_2 = call double @llvm.exp.f64(double %bitcast_ln39_1), !bitwidth !20
  %add_i2 = fadd double %tmp_2, 1.000000e+00, !bitwidth !20
  %activations3_1_2 = fdiv double 1.000000e+00, %add_i2, !bitwidth !20
  switch i2 %i, label %branch8 [
    i2 0, label %for.inc.i30.split.for.inc.i30.split9_crit_edge
    i2 1, label %for.inc.i30.split.for.inc.i30.split9_crit_edge8
  ], !bitwidth !868

for.inc.i30.split.for.inc.i30.split9_crit_edge8:  ; preds = %for.inc.i30.split
  store double %activations3_1_2, double* %activations3_1_4, align 8, !bitwidth !11, !dep_idx !1502, !deps !1503
  store double %dactivations3_1, double* %dactivations3_1_1, align 8, !bitwidth !11, !dep_idx !1506, !deps !1507
  br label %for.inc.i30.split9, !bitwidth !11

branch8:                                          ; preds = %for.inc.i30.split
  store double %activations3_1_2, double* %activations3_2_4, align 8, !bitwidth !11, !dep_idx !1509, !deps !1510
  store double %dactivations3_1, double* %dactivations3_2_1, align 8, !bitwidth !11, !dep_idx !1513, !deps !1514
  br label %for.inc.i30.split9, !bitwidth !11

for.inc.i30.split.for.inc.i30.split9_crit_edge:   ; preds = %for.inc.i30.split
  store double %activations3_1_2, double* %activations3_0_4, align 8, !bitwidth !11, !dep_idx !1516, !deps !1517
  store double %dactivations3_1, double* %dactivations3_0_1, align 8, !bitwidth !11, !dep_idx !1520, !deps !1521
  br label %for.inc.i30.split9, !bitwidth !11
}

; Function Attrs: nounwind
define internal void @backprop_Pipeline_RELU_loop11([64 x double]* %activations2, [64 x double]* %dactivations2) #1 {
newFuncRoot:
  %i_16 = alloca i7, align 1, !bitwidth !224
  store i7 0, i7* %i_16, align 1, !bitwidth !11, !dep_idx !1523, !deps !1524
  br label %for.inc.i18, !bitwidth !11

RELU.exit19.exitStub:                             ; preds = %for.inc.i18
  ret void, !bitwidth !11

for.inc.i18:                                      ; preds = %for.inc.i18.split, %newFuncRoot
  %i = load i7, i7* %i_16, align 1, !bitwidth !235, !dep_idx !1527, !deps !1528
  %icmp_ln36 = icmp eq i7 %i, -64, !bitwidth !206
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64)
  %add_ln36 = add nuw i7 %i, 1, !bitwidth !235
  br i1 %icmp_ln36, label %RELU.exit19.exitStub, label %for.inc.i18.split, !llvm.loop !1531, !bitwidth !11

for.inc.i18.split:                                ; preds = %for.inc.i18
  %zext_ln36 = zext i7 %i to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_42)
  call void (...) @_ssdm_op_SpecLoopName([11 x i8]* @empty_1)
  %activations2_addr = getelementptr inbounds [64 x double], [64 x double]* %activations2, i64 0, i64 %zext_ln36, !bitwidth !11
  %activations2_load = load double, double* %activations2_addr, align 8, !alias.scope !1537, !noalias !1540, !bitwidth !20, !dep_idx !1542, !deps !1543
  %sub_i1 = fsub double 1.000000e+00, %activations2_load, !bitwidth !20
  %mul_i1 = fmul double %activations2_load, %sub_i1, !bitwidth !20
  %dactivations2_addr = getelementptr inbounds [64 x double], [64 x double]* %dactivations2, i64 0, i64 %zext_ln36, !bitwidth !11
  store double %mul_i1, double* %dactivations2_addr, align 8, !alias.scope !1540, !noalias !1537, !bitwidth !11
  %bitcast_ln39 = bitcast double %activations2_load to i64, !bitwidth !20
  %xor_ln39 = xor i64 %bitcast_ln39, -9223372036854775808, !bitwidth !20
  %bitcast_ln39_2 = bitcast i64 %xor_ln39 to double, !bitwidth !20
  %tmp_1 = call double @llvm.exp.f64(double %bitcast_ln39_2), !bitwidth !20
  %add_i1 = fadd double %tmp_1, 1.000000e+00, !bitwidth !20
  %div_i1 = fdiv double 1.000000e+00, %add_i1, !bitwidth !20
  store double %div_i1, double* %activations2_addr, align 8, !alias.scope !1537, !noalias !1540, !bitwidth !11, !dep_idx !1545, !deps !1546
  store i7 %add_ln36, i7* %i_16, align 1, !bitwidth !11, !dep_idx !1548, !deps !1549
  br label %for.inc.i18, !llvm.loop !1531, !bitwidth !11
}

; Function Attrs: nounwind
define internal void @backprop_Pipeline_RELU_loop1([64 x double]* %activations1, [64 x double]* %dactivations1) #1 {
newFuncRoot:
  %i_15 = alloca i7, align 1, !bitwidth !224
  store i7 0, i7* %i_15, align 1, !bitwidth !11, !dep_idx !1552, !deps !1553
  br label %for.inc.i, !bitwidth !11

RELU.exit.exitStub:                               ; preds = %for.inc.i
  ret void, !bitwidth !11

for.inc.i:                                        ; preds = %for.inc.i.split, %newFuncRoot
  %i = load i7, i7* %i_15, align 1, !bitwidth !235, !dep_idx !1556, !deps !1557
  %icmp_ln36 = icmp eq i7 %i, -64, !bitwidth !206
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 64, i64 64, i64 64)
  %add_ln36 = add nuw i7 %i, 1, !bitwidth !235
  br i1 %icmp_ln36, label %RELU.exit.exitStub, label %for.inc.i.split, !llvm.loop !1560, !bitwidth !11

for.inc.i.split:                                  ; preds = %for.inc.i
  %zext_ln36 = zext i7 %i to i64, !bitwidth !256
  call void (...) @_ssdm_op_SpecPipeline(i32 -1, i32 0, i32 0, i32 0, [1 x i8]* @empty_42)
  call void (...) @_ssdm_op_SpecLoopName([11 x i8]* @empty_1)
  %activations1_addr = getelementptr inbounds [64 x double], [64 x double]* %activations1, i64 0, i64 %zext_ln36, !bitwidth !11
  %activations1_load = load double, double* %activations1_addr, align 8, !alias.scope !1566, !noalias !1569, !bitwidth !20, !dep_idx !1571, !deps !1572
  %sub_i = fsub double 1.000000e+00, %activations1_load, !bitwidth !20
  %mul_i = fmul double %activations1_load, %sub_i, !bitwidth !20
  %dactivations1_addr = getelementptr inbounds [64 x double], [64 x double]* %dactivations1, i64 0, i64 %zext_ln36, !bitwidth !11
  store double %mul_i, double* %dactivations1_addr, align 8, !alias.scope !1569, !noalias !1566, !bitwidth !11
  %bitcast_ln39 = bitcast double %activations1_load to i64, !bitwidth !20
  %xor_ln39 = xor i64 %bitcast_ln39, -9223372036854775808, !bitwidth !20
  %bitcast_ln39_1 = bitcast i64 %xor_ln39 to double, !bitwidth !20
  %tmp = call double @llvm.exp.f64(double %bitcast_ln39_1), !bitwidth !20
  %add_i = fadd double %tmp, 1.000000e+00, !bitwidth !20
  %div_i = fdiv double 1.000000e+00, %add_i, !bitwidth !20
  store double %div_i, double* %activations1_addr, align 8, !alias.scope !1566, !noalias !1569, !bitwidth !11, !dep_idx !1574, !deps !1575
  store i7 %add_ln36, i7* %i_15, align 1, !bitwidth !11, !dep_idx !1577, !deps !1578
  br label %for.inc.i, !llvm.loop !1560, !bitwidth !11
}

; Function Attrs: nounwind
define void @backprop([832 x i64]* noalias %weights1, [4096 x i64]* noalias %weights2, [192 x i64]* noalias %weights3, [64 x i64]* noalias %biases1, [64 x i64]* noalias %biases2, [3 x i64]* noalias %biases3, [2119 x i64]* noalias %training_data, [489 x i64]* noalias %training_targets) #1 {
entry:
  %phi_mul = alloca i12, align 2, !bitwidth !1581
  %i = alloca i8, align 1, !bitwidth !1582
  %dactivations3_0_01 = alloca double, align 8, !bitwidth !11
  %dactivations3_1_02 = alloca double, align 8, !bitwidth !11
  %dactivations3_2_03 = alloca double, align 8, !bitwidth !11
  %net_outputs_0_04 = alloca double, align 8, !bitwidth !11
  %net_outputs_1_05 = alloca double, align 8, !bitwidth !11
  %net_outputs_2_06 = alloca double, align 8, !bitwidth !11
  %activations3_0_0 = alloca double, align 8, !bitwidth !11
  %activations3_1_0 = alloca double, align 8, !bitwidth !11
  %activations3_2_0 = alloca double, align 8, !bitwidth !11
  %output_difference_0_020 = alloca double, align 8, !bitwidth !11
  %output_difference_1_021 = alloca double, align 8, !bitwidth !11
  %output_difference_2_022 = alloca double, align 8, !bitwidth !11
  %output_difference_0_1_loc = alloca double, i64 1, align 8, !bitwidth !11
  %output_difference_1_1_loc = alloca double, i64 1, align 8, !bitwidth !11
  %output_difference_2_1_loc = alloca double, i64 1, align 8, !bitwidth !11
  %net_outputs_0_1_loc = alloca double, i64 1, align 8, !bitwidth !11
  %net_outputs_1_1_loc = alloca double, i64 1, align 8, !bitwidth !11
  %net_outputs_2_1_loc = alloca double, i64 1, align 8, !bitwidth !11
  %sum_loc = alloca double, i64 1, align 8, !bitwidth !11
  %dactivations3_0_1_loc = alloca double, i64 1, align 8, !bitwidth !11
  %dactivations3_1_1_loc = alloca double, i64 1, align 8, !bitwidth !11
  %dactivations3_2_1_loc = alloca double, i64 1, align 8, !bitwidth !11
  %activations3_0_4_loc = alloca double, i64 1, align 8, !bitwidth !11
  %activations3_1_4_loc = alloca double, i64 1, align 8, !bitwidth !11
  %activations3_2_4_loc = alloca double, i64 1, align 8, !bitwidth !11
  %activations3_0_1_loc = alloca double, i64 1, align 8, !bitwidth !11
  %activations3_1_1_loc = alloca double, i64 1, align 8, !bitwidth !11
  %activations3_2_1_loc = alloca double, i64 1, align 8, !bitwidth !11
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_42), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecTopModule([9 x i8]* @empty_10), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecInterface([832 x i64]* %weights1, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([832 x i64]* %weights1), !map !1583
  call void (...) @_ssdm_op_SpecInterface([4096 x i64]* %weights2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([4096 x i64]* %weights2), !map !1583
  call void (...) @_ssdm_op_SpecInterface([192 x i64]* %weights3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([192 x i64]* %weights3), !map !1583
  call void (...) @_ssdm_op_SpecInterface([64 x i64]* %biases1, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([64 x i64]* %biases1), !map !1583
  call void (...) @_ssdm_op_SpecInterface([64 x i64]* %biases2, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([64 x i64]* %biases2), !map !1583
  call void (...) @_ssdm_op_SpecInterface([3 x i64]* %biases3, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([3 x i64]* %biases3), !map !1583
  call void (...) @_ssdm_op_SpecInterface([2119 x i64]* %training_data, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([2119 x i64]* %training_data), !map !1583
  call void (...) @_ssdm_op_SpecInterface([489 x i64]* %training_targets, [10 x i8]* @empty_8, i32 0, i32 0, [1 x i8]* @empty_42, i32 -1, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_42, [1 x i8]* @empty_42, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([489 x i64]* %training_targets), !map !1583
  %activations1 = alloca [64 x double], i64 1, align 512, !bitwidth !11
  %activations2 = alloca [64 x double], i64 1, align 512, !bitwidth !11
  %dactivations1 = alloca [64 x double], i64 1, align 512, !bitwidth !11
  %dactivations2 = alloca [64 x double], i64 1, align 512, !bitwidth !11
  %delta_weights1 = alloca [832 x double], i64 1, align 512, !bitwidth !11
  %delta_weights2 = alloca [4096 x double], i64 1, align 512, !bitwidth !11
  %delta_weights3 = alloca [192 x double], i64 1, align 512, !bitwidth !11
  %oracle_activations1 = alloca [64 x double], i64 1, align 512, !bitwidth !11
  %oracle_activations2 = alloca [64 x double], i64 1, align 512, !bitwidth !11
  store i8 0, i8* %i, align 1, !bitwidth !11, !dep_idx !1584, !deps !1585
  store i12 0, i12* %phi_mul, align 2, !bitwidth !11, !dep_idx !1588, !deps !1589
  br label %backprop_loop1_1, !bitwidth !11

backprop_loop1_1:                                 ; preds = %backprop_loop1_1.split, %entry
  %phi_mul_load = load i12, i12* %phi_mul, align 2, !bitwidth !105, !dep_idx !1592, !deps !1593
  %i_32 = load i8, i8* %i, align 1, !bitwidth !590, !dep_idx !219, !deps !1596
  %add_ln356_1 = add i12 %phi_mul_load, 13, !bitwidth !105
  %icmp_ln356 = icmp eq i8 %i_32, -93, !bitwidth !206
  %add_ln356 = add nuw i8 %i_32, 1, !bitwidth !590
  br i1 %icmp_ln356, label %for.end54, label %backprop_loop1_1.split, !llvm.loop !1599, !bitwidth !11

backprop_loop1_1.split:                           ; preds = %backprop_loop1_1
  %dactivations3_0_01_load = load double, double* %dactivations3_0_01, align 8, !bitwidth !20, !dep_idx !1604, !deps !1605
  %dactivations3_1_02_load = load double, double* %dactivations3_1_02, align 8, !bitwidth !20, !dep_idx !1607, !deps !1608
  %dactivations3_2_03_load = load double, double* %dactivations3_2_03, align 8, !bitwidth !20, !dep_idx !1610, !deps !1611
  %net_outputs_0_04_load = load double, double* %net_outputs_0_04, align 8, !bitwidth !20, !dep_idx !1613, !deps !1614
  %net_outputs_1_05_load = load double, double* %net_outputs_1_05, align 8, !bitwidth !20, !dep_idx !1616, !deps !1617
  %net_outputs_2_06_load = load double, double* %net_outputs_2_06, align 8, !bitwidth !20, !dep_idx !1619, !deps !1620
  %activations3_0_0_load = load double, double* %activations3_0_0, align 8, !bitwidth !20, !dep_idx !1622, !deps !1623
  %activations3_1_0_load = load double, double* %activations3_1_0, align 8, !bitwidth !20, !dep_idx !1625, !deps !1626
  %activations3_2_0_load = load double, double* %activations3_2_0, align 8, !bitwidth !20, !dep_idx !1628, !deps !1629
  %output_difference_0_020_load = load double, double* %output_difference_0_020, align 8, !bitwidth !20, !dep_idx !1631, !deps !1632
  %output_difference_1_021_load = load double, double* %output_difference_1_021, align 8, !bitwidth !20, !dep_idx !1634, !deps !1635
  %output_difference_2_022_load = load double, double* %output_difference_2_022, align 8, !bitwidth !20, !dep_idx !1637, !deps !1638
  %zext_ln356 = zext i8 %i_32 to i9, !bitwidth !1264
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 163, i64 163, i64 163), !fpga.pragma.source !187
  call void (...) @_ssdm_op_SpecLoopName([15 x i8]* @empty_5)
  call void @backprop_Pipeline_backprop_loop1_1(double %activations3_2_0_load, double %activations3_1_0_load, double %activations3_0_0_load, [64 x double]* %activations1, [64 x double]* %activations2, double* %activations3_2_1_loc, double* %activations3_1_1_loc, double* %activations3_0_1_loc), !bitwidth !11, !dep_idx !1640, !deps !1641
  %activations3_2_1_loc_load = load double, double* %activations3_2_1_loc, align 8, !bitwidth !20, !dep_idx !1653, !deps !1654
  %activations3_1_1_loc_load = load double, double* %activations3_1_1_loc, align 8, !bitwidth !20, !dep_idx !1656, !deps !1654
  %activations3_0_1_loc_load = load double, double* %activations3_0_1_loc, align 8, !bitwidth !20, !dep_idx !1657, !deps !1654
  call fastcc void @matrix_vector_product_with_bias_input_layer.1([64 x i64]* %biases1, [832 x i64]* %weights1, [64 x double]* %activations1, [2119 x i64]* %training_data, i12 %phi_mul_load), !bitwidth !11, !dep_idx !1658, !deps !1659
  call void @backprop_Pipeline_RELU_loop1([64 x double]* %activations1, [64 x double]* %dactivations1), !bitwidth !11, !dep_idx !1663, !deps !1664
  call fastcc void @matrix_vector_product_with_bias_second_layer.1([64 x i64]* %biases2, [4096 x i64]* %weights2, [64 x double]* %activations2, [64 x double]* %activations1), !bitwidth !11, !dep_idx !1666, !deps !1667
  call void @backprop_Pipeline_RELU_loop11([64 x double]* %activations2, [64 x double]* %dactivations2), !bitwidth !11, !dep_idx !1670, !deps !1671
  %call_ret = call fastcc { double, double, double } @matrix_vector_product_with_bias_output_layer.1([3 x i64]* %biases3, [192 x i64]* %weights3, double %activations3_0_1_loc_load, double %activations3_1_1_loc_load, double %activations3_2_1_loc_load, [64 x double]* %activations2) #1, !bitwidth !11, !dep_idx !1673, !deps !1674
  %activations3_0 = extractvalue { double, double, double } %call_ret, 0, !bitwidth !20
  %activations3_1 = extractvalue { double, double, double } %call_ret, 1, !bitwidth !20
  %activations3_2 = extractvalue { double, double, double } %call_ret, 2, !bitwidth !20
  call void @backprop_Pipeline_RELU_loop12(double %activations3_2, double %activations3_1, double %activations3_0, double %dactivations3_2_03_load, double %dactivations3_1_02_load, double %dactivations3_0_01_load, double* %activations3_2_4_loc, double* %activations3_1_4_loc, double* %activations3_0_4_loc, double* %dactivations3_2_1_loc, double* %dactivations3_1_1_loc, double* %dactivations3_0_1_loc), !bitwidth !11, !dep_idx !1675, !deps !1676
  %activations3_2_4_loc_load = load double, double* %activations3_2_4_loc, align 8, !bitwidth !20, !dep_idx !1683, !deps !1684
  %activations3_1_4_loc_load = load double, double* %activations3_1_4_loc, align 8, !bitwidth !20, !dep_idx !1686, !deps !1684
  %activations3_0_4_loc_load = load double, double* %activations3_0_4_loc, align 8, !bitwidth !20, !dep_idx !1687, !deps !1684
  %dactivations3_2_1_loc_load = load double, double* %dactivations3_2_1_loc, align 8, !bitwidth !20, !dep_idx !1688, !deps !1684
  %dactivations3_1_1_loc_load = load double, double* %dactivations3_1_1_loc, align 8, !bitwidth !20, !dep_idx !1689, !deps !1684
  %dactivations3_0_1_loc_load = load double, double* %dactivations3_0_1_loc, align 8, !bitwidth !20, !dep_idx !1690, !deps !1684
  call void @backprop_Pipeline_soft_max_loop1(double %activations3_0_4_loc_load, double %activations3_1_4_loc_load, double %activations3_2_4_loc_load, double* %sum_loc), !bitwidth !11, !dep_idx !1691, !deps !1692
  %sum_loc_load = load double, double* %sum_loc, align 8, !bitwidth !20, !dep_idx !1694, !deps !1695
  call void @backprop_Pipeline_soft_max_loop2(double %net_outputs_2_06_load, double %net_outputs_1_05_load, double %net_outputs_0_04_load, double %activations3_0_4_loc_load, double %activations3_1_4_loc_load, double %activations3_2_4_loc_load, double %sum_loc_load, double* %net_outputs_2_1_loc, double* %net_outputs_1_1_loc, double* %net_outputs_0_1_loc), !bitwidth !11, !dep_idx !1697, !deps !1698
  %net_outputs_2_1_loc_load = load double, double* %net_outputs_2_1_loc, align 8, !bitwidth !20, !dep_idx !1702, !deps !1703
  %net_outputs_1_1_loc_load = load double, double* %net_outputs_1_1_loc, align 8, !bitwidth !20, !dep_idx !1705, !deps !1703
  %net_outputs_0_1_loc_load = load double, double* %net_outputs_0_1_loc, align 8, !bitwidth !20, !dep_idx !1706, !deps !1703
  %trunc_ln374 = trunc i8 %i_32 to i7, !bitwidth !235
  %shl_ln = call i9 @_ssdm_op_BitConcatenate.i9.i7.i2(i7 %trunc_ln374, i2 0), !bitwidth !138
  %sub_ln374 = sub i9 %shl_ln, %zext_ln356, !bitwidth !138
  call void @backprop_Pipeline_take_difference_loop1(double %output_difference_2_022_load, double %output_difference_1_021_load, double %output_difference_0_020_load, double %net_outputs_0_1_loc_load, double %net_outputs_1_1_loc_load, double %net_outputs_2_1_loc_load, i9 %sub_ln374, [489 x i64]* %training_targets, double %dactivations3_0_1_loc_load, double %dactivations3_1_1_loc_load, double %dactivations3_2_1_loc_load, double* %output_difference_2_1_loc, double* %output_difference_1_1_loc, double* %output_difference_0_1_loc), !bitwidth !11, !dep_idx !1707, !deps !1708
  %output_difference_2_1_loc_load = load double, double* %output_difference_2_1_loc, align 8, !bitwidth !20, !dep_idx !1712, !deps !1713
  %output_difference_1_1_loc_load = load double, double* %output_difference_1_1_loc, align 8, !bitwidth !20, !dep_idx !1715, !deps !1713
  %output_difference_0_1_loc_load = load double, double* %output_difference_0_1_loc, align 8, !bitwidth !20, !dep_idx !1716, !deps !1713
  call fastcc void @get_delta_matrix_weights3([192 x double]* %delta_weights3, double %output_difference_0_1_loc_load, double %output_difference_1_1_loc_load, double %output_difference_2_1_loc_load, [64 x double]* %activations2) #1, !bitwidth !11, !dep_idx !1717, !deps !1718
  call fastcc void @get_oracle_activations2.1([192 x i64]* %weights3, double %output_difference_0_1_loc_load, double %output_difference_1_1_loc_load, double %output_difference_2_1_loc_load, [64 x double]* %oracle_activations2, [64 x double]* %dactivations2) #1, !bitwidth !11, !dep_idx !1720, !deps !1721
  call fastcc void @get_delta_matrix_weights2([4096 x double]* %delta_weights2, [64 x double]* %oracle_activations2, [64 x double]* %activations1), !bitwidth !11, !dep_idx !1723, !deps !1724
  call fastcc void @get_oracle_activations1.1([4096 x i64]* %weights2, [64 x double]* %oracle_activations2, [64 x double]* %oracle_activations1, [64 x double]* %dactivations1), !bitwidth !11, !dep_idx !1726, !deps !1727
  call fastcc void @get_delta_matrix_weights1.1([832 x double]* %delta_weights1, [64 x double]* %oracle_activations1, [2119 x i64]* %training_data, i12 %phi_mul_load), !bitwidth !11, !dep_idx !1730, !deps !1731
  call fastcc void @update_weights.1([832 x i64]* %weights1, [4096 x i64]* %weights2, [192 x i64]* %weights3, [832 x double]* %delta_weights1, [4096 x double]* %delta_weights2, [192 x double]* %delta_weights3, [64 x i64]* %biases1, [64 x i64]* %biases2, [3 x i64]* %biases3, [64 x double]* %oracle_activations1, [64 x double]* %oracle_activations2, double %output_difference_0_1_loc_load, double %output_difference_1_1_loc_load, double %output_difference_2_1_loc_load) #1, !bitwidth !11, !dep_idx !1733, !deps !1734
  store double %output_difference_2_1_loc_load, double* %output_difference_2_022, align 8, !bitwidth !11, !dep_idx !1740, !deps !1741
  store double %output_difference_1_1_loc_load, double* %output_difference_1_021, align 8, !bitwidth !11, !dep_idx !1743, !deps !1744
  store double %output_difference_0_1_loc_load, double* %output_difference_0_020, align 8, !bitwidth !11, !dep_idx !1746, !deps !1747
  store double %activations3_2_4_loc_load, double* %activations3_2_0, align 8, !bitwidth !11, !dep_idx !1749, !deps !1750
  store double %activations3_1_4_loc_load, double* %activations3_1_0, align 8, !bitwidth !11, !dep_idx !1752, !deps !1753
  store double %activations3_0_4_loc_load, double* %activations3_0_0, align 8, !bitwidth !11, !dep_idx !1755, !deps !1756
  store double %net_outputs_2_1_loc_load, double* %net_outputs_2_06, align 8, !bitwidth !11, !dep_idx !1758, !deps !1759
  store double %net_outputs_1_1_loc_load, double* %net_outputs_1_05, align 8, !bitwidth !11, !dep_idx !1761, !deps !1762
  store double %net_outputs_0_1_loc_load, double* %net_outputs_0_04, align 8, !bitwidth !11, !dep_idx !1764, !deps !1765
  store double %dactivations3_2_1_loc_load, double* %dactivations3_2_03, align 8, !bitwidth !11, !dep_idx !1767, !deps !1768
  store double %dactivations3_1_1_loc_load, double* %dactivations3_1_02, align 8, !bitwidth !11, !dep_idx !1770, !deps !1771
  store double %dactivations3_0_1_loc_load, double* %dactivations3_0_01, align 8, !bitwidth !11, !dep_idx !1773, !deps !1774
  store i8 %add_ln356, i8* %i, align 1, !bitwidth !11, !dep_idx !1776, !deps !1777
  store i12 %add_ln356_1, i12* %phi_mul, align 2, !bitwidth !11, !dep_idx !1780, !deps !1781
  br label %backprop_loop1_1, !llvm.loop !1599, !bitwidth !11

for.end54:                                        ; preds = %backprop_loop1_1
  ret void, !bitwidth !11
}

define weak void @_ssdm_op_Write.ap_auto.doubleP0A(double* %0, double %1) comdat {
entry:
  store double %1, double* %0, align 8
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecTopModule(...) #1 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecPipeline(...) #1 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecLoopTripCount(...) #1 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecLoopName(...) #1 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecInterface(...) #1 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecBitsMap(...) #1 comdat {
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

attributes #0 = { noinline }
attributes #1 = { nounwind }
attributes #2 = { noinline nounwind }
attributes #3 = { noinline readonly }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nounwind readnone }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!blackbox_cfg = !{!1}
!llvm.module.flags = !{!2, !3}
!llvm.map.gv = !{}
!bitwidth_g = !{!4, !76, !80, !85, !92, !101, !102, !112, !116, !121, !125, !129, !134, !148, !154, !157, !162, !166, !168, !169}

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
!41 = !{[21 x i8]* @empty_31, !26}
!42 = !{i6 0, !43}
!43 = !{i32 1, i32 6, i32 0, i32 0}
!44 = !{i7 -64, !45}
!45 = !{i32 7, i32 7, i32 0, i32 1}
!46 = !{i7 1, !38}
!47 = !{i64 64, !48}
!48 = !{i32 8, i32 64, i32 0, i32 1}
!49 = !{[23 x i8]* @empty_40, !26}
!50 = !{i64 0, !51}
!51 = !{i32 1, i32 64, i32 0, i32 0}
!52 = !{double 1.000000e-02, !20}
!53 = !{[21 x i8]* @empty_39, !26}
!54 = !{[21 x i8]* @empty_38, !26}
!55 = !{[23 x i8]* @empty_37, !26}
!56 = !{[21 x i8]* @empty_36, !26}
!57 = !{[21 x i8]* @empty_35, !26}
!58 = !{[23 x i8]* @empty_34, !26}
!59 = !{[21 x i8]* @empty_33, !26}
!60 = !{[21 x i8]* @empty_21, !26}
!61 = !{[23 x i8]* @empty_18, !26}
!62 = !{[21 x i8]* @empty_41, !26}
!63 = !{i2 0, !64}
!64 = !{i32 1, i32 2, i32 0, i32 0}
!65 = !{[21 x i8]* @empty_29, !26}
!66 = !{i2 -1, !67}
!67 = !{i32 1, i32 2, i32 0, i32 1}
!68 = !{i2 1, !64}
!69 = !{i64 3, !70}
!70 = !{i32 3, i32 64, i32 0, i32 1}
!71 = !{[23 x i8]* @empty_28, !26}
!72 = !{[22 x i8]* @empty_27, !26}
!73 = !{[22 x i8]* @empty_26, !26}
!74 = !{[24 x i8]* @empty_25, !26}
!75 = !{[22 x i8]* @empty_24, !26}
!76 = !{void ([64 x double]*, [64 x i64]*)* @matrix_vector_product_with_bias_second_layer.1_Pipeline_add_bias_to_activations_, !77}
!77 = !{!78, !8, !23, !25, !27, !28, !29, !37, !44, !47, !46, !79, !50}
!78 = !{!"Arg", i32 0, !11}
!79 = !{[30 x i8]* @empty, !26}
!80 = !{void ([64 x i64]*, [4096 x i64]*, [64 x double]*, [64 x double]*)* @matrix_vector_product_with_bias_second_layer.1, !81}
!81 = !{!6, !8, !82, !10, !23, !25, !27, !28, !29, !37, !44, !46, !47, !83, !50, !42, !31, !84}
!82 = !{!"Arg", i32 2, !11}
!83 = !{[51 x i8]* @empty_14, !26}
!84 = !{[53 x i8]* @empty_13, !26}
!85 = !{void (double, double, double, [3 x i64]*, double*, double*, double*)* @matrix_vector_product_with_bias_output_layer.1_Pipeline_add_bias_to_activations_, !86}
!86 = !{!87, !88, !89, !90, !12, !13, !91, !23, !25, !27, !28, !29, !63, !66, !69, !68, !79, !50}
!87 = !{!"Arg", i32 0, !20}
!88 = !{!"Arg", i32 1, !20}
!89 = !{!"Arg", i32 2, !20}
!90 = !{!"Arg", i32 3, !7}
!91 = !{!"Arg", i32 6, !11}
!92 = !{{ double, double, double } ([3 x i64]*, [192 x i64]*, double, double, double, [64 x double]*)* @matrix_vector_product_with_bias_output_layer.1, !93}
!93 = !{!6, !8, !89, !94, !95, !13, !23, !96, !25, !27, !28, !29, !63, !66, !68, !97, !69, !99, !42, !37, !31, !44, !46, !47, !100, !50}
!94 = !{!"Arg", i32 3, !20}
!95 = !{!"Arg", i32 4, !20}
!96 = !{i64 1, !51}
!97 = !{{ double, double, double } undef, !98}
!98 = !{i32 0, i32 0, i32 0, i32 0}
!99 = !{[51 x i8]* @empty_16, !26}
!100 = !{[53 x i8]* @empty_15, !26}
!101 = !{void ([64 x double]*, [64 x i64]*)* @matrix_vector_product_with_bias_input_layer.1_Pipeline_add_bias_to_activations_l, !77}
!102 = !{void ([64 x i64]*, [832 x i64]*, [64 x double]*, [2119 x i64]*, i12)* @matrix_vector_product_with_bias_input_layer.1, !103}
!103 = !{!6, !8, !82, !90, !104, !23, !25, !27, !28, !29, !37, !106, !108, !44, !46, !47, !110, !50, !32, !31, !34, !36, !39, !111}
!104 = !{!"Arg", i32 4, !105}
!105 = !{i32 12, i32 12, i32 0, i32 2}
!106 = !{i10 0, !107}
!107 = !{i32 1, i32 10, i32 0, i32 0}
!108 = !{i10 13, !109}
!109 = !{i32 5, i32 10, i32 0, i32 1}
!110 = !{[50 x i8]* @empty_12, !26}
!111 = !{[52 x i8]* @empty_11, !26}
!112 = !{void ([192 x i64]*, double, double, double, [64 x double]*, [64 x double]*)* @get_oracle_activations2.1, !113}
!113 = !{!6, !88, !89, !94, !12, !13, !23, !25, !27, !28, !29, !37, !44, !46, !47, !114, !50, !63, !31, !66, !68, !69, !115}
!114 = !{[30 x i8]* @empty_7, !26}
!115 = !{[32 x i8]* @empty_17, !26}
!116 = !{void ([4096 x i64]*, [64 x double]*, [64 x double]*, [64 x double]*)* @get_oracle_activations1.1, !117}
!117 = !{!6, !118, !82, !10, !23, !25, !27, !28, !29, !37, !44, !46, !47, !119, !50, !42, !31, !120}
!118 = !{!"Arg", i32 1, !11}
!119 = !{[30 x i8]* @empty_32, !26}
!120 = !{[32 x i8]* @empty_9, !26}
!121 = !{void ([192 x double]*, double, double, double, [64 x double]*)* @get_delta_matrix_weights3, !122}
!122 = !{!78, !88, !89, !94, !12, !23, !27, !28, !37, !44, !46, !47, !123, !50, !63, !66, !68, !69, !124}
!123 = !{[32 x i8]* @empty_30, !26}
!124 = !{[34 x i8]* @empty_6, !26}
!125 = !{void ([4096 x double]*, [64 x double]*, [64 x double]*)* @get_delta_matrix_weights2, !126}
!126 = !{!78, !118, !82, !23, !27, !28, !37, !44, !46, !47, !127, !50, !42, !128}
!127 = !{[32 x i8]* @empty_20, !26}
!128 = !{[34 x i8]* @empty_19, !26}
!129 = !{void ([832 x double]*, [64 x double]*, [2119 x i64]*, i12)* @get_delta_matrix_weights1.1, !130}
!130 = !{!78, !118, !9, !131, !23, !25, !27, !28, !29, !32, !34, !36, !39, !132, !50, !42, !37, !44, !46, !47, !133}
!131 = !{!"Arg", i32 3, !105}
!132 = !{[32 x i8]* @empty_23, !26}
!133 = !{[34 x i8]* @empty_22, !26}
!134 = !{void (double, double, double, double, double, double, i9, [489 x i64]*, double, double, double, double*, double*, double*)* @backprop_Pipeline_take_difference_loop1, !135}
!135 = !{!87, !88, !89, !94, !95, !136, !137, !15, !139, !140, !141, !142, !143, !144, !23, !25, !27, !28, !29, !63, !66, !68, !69, !145, !50, !146}
!136 = !{!"Arg", i32 5, !20}
!137 = !{!"Arg", i32 6, !138}
!138 = !{i32 9, i32 9, i32 0, i32 2}
!139 = !{!"Arg", i32 8, !20}
!140 = !{!"Arg", i32 9, !20}
!141 = !{!"Arg", i32 10, !20}
!142 = !{!"Arg", i32 11, !11}
!143 = !{!"Arg", i32 12, !11}
!144 = !{!"Arg", i32 13, !11}
!145 = !{[22 x i8]* @empty_4, !26}
!146 = !{i64 -9223372036854775808, !147}
!147 = !{i32 64, i32 64, i32 0, i32 1}
!148 = !{void (double, double, double, double, double, double, double, double*, double*, double*)* @backprop_Pipeline_soft_max_loop2, !149}
!149 = !{!87, !88, !89, !94, !95, !136, !150, !151, !152, !17, !23, !63, !66, !68, !29, !27, !28, !69, !153, !146}
!150 = !{!"Arg", i32 6, !20}
!151 = !{!"Arg", i32 7, !11}
!152 = !{!"Arg", i32 8, !11}
!153 = !{[15 x i8]* @empty_3, !26}
!154 = !{void (double, double, double, double*)* @backprop_Pipeline_soft_max_loop1, !155}
!155 = !{!87, !88, !89, !10, !23, !63, !31, !66, !68, !29, !27, !28, !69, !156, !146}
!156 = !{[15 x i8]* @empty_2, !26}
!157 = !{void (double, double, double, [64 x double]*, [64 x double]*, double*, double*, double*)* @backprop_Pipeline_backprop_loop1_1, !158}
!158 = !{!87, !88, !89, !10, !12, !13, !91, !151, !23, !37, !44, !46, !29, !27, !28, !47, !159, !50, !31, !160, !63, !68}
!159 = !{[17 x i8]* @empty_0, !26}
!160 = !{i7 3, !161}
!161 = !{i32 3, i32 7, i32 0, i32 0}
!162 = !{void (double, double, double, double, double, double, double*, double*, double*, double*, double*, double*)* @backprop_Pipeline_RELU_loop12, !163}
!163 = !{!87, !88, !89, !94, !95, !136, !91, !151, !152, !17, !18, !142, !23, !63, !66, !69, !68, !29, !27, !28, !164, !165, !146}
!164 = !{[11 x i8]* @empty_1, !26}
!165 = !{double 1.000000e+00, !20}
!166 = !{void ([64 x double]*, [64 x double]*)* @backprop_Pipeline_RELU_loop11, !167}
!167 = !{!78, !118, !23, !37, !44, !47, !46, !29, !27, !28, !164, !50, !165, !146}
!168 = !{void ([64 x double]*, [64 x double]*)* @backprop_Pipeline_RELU_loop1, !167}
!169 = !{void ([832 x i64]*, [4096 x i64]*, [192 x i64]*, [64 x i64]*, [64 x i64]*, [3 x i64]*, [2119 x i64]*, [489 x i64]*)* @backprop, !170}
!170 = !{!6, !8, !9, !90, !171, !172, !14, !15, !23, !96, !27, !28, !173, !25, !29, !174, !176, !178, !180, !182, !183, !185, !63}
!171 = !{!"Arg", i32 4, !7}
!172 = !{!"Arg", i32 5, !7}
!173 = !{[9 x i8]* @empty_10, !26}
!174 = !{i8 0, !175}
!175 = !{i32 1, i32 8, i32 0, i32 0}
!176 = !{i12 0, !177}
!177 = !{i32 1, i32 12, i32 0, i32 0}
!178 = !{i12 13, !179}
!179 = !{i32 5, i32 12, i32 0, i32 1}
!180 = !{i8 -93, !181}
!181 = !{i32 8, i32 8, i32 0, i32 1}
!182 = !{i8 1, !175}
!183 = !{i64 163, !184}
!184 = !{i32 9, i32 64, i32 0, i32 1}
!185 = !{[15 x i8]* @empty_5, !26}
!186 = !{i32 0, i32 0, i32 4, i32 1}
!187 = !{!"user"}
!188 = !{i32 195}
!189 = !{!190, !192, !193}
!190 = !{i32 183, !191}
!191 = !{!"RAW", !"indep"}
!192 = !{i32 184, !191}
!193 = !{i32 185, !194}
!194 = !{!"WAW", !"indep"}
!195 = !{i32 188}
!196 = !{!197, !198}
!197 = !{i32 186, !191}
!198 = !{i32 187, !194}
!199 = !{i32 4, i32 4, i32 0, i32 2}
!200 = !{i32 186}
!201 = !{!202, !204}
!202 = !{i32 188, !203}
!203 = !{!"WAR", !"indep"}
!204 = !{i32 187, !205}
!205 = !{!"WAR", !"indep", i32 1, !"*", i32 -1, i1 true}
!206 = !{i32 1, i32 1, i32 0, i32 2}
!207 = distinct !{!207, !208, !220, !221}
!208 = !{i32 227, i32 5, !209, null}
!209 = !{i32 786443, !210, i32 219, i32 5, !212, i32 0}
!210 = !{i32 786443, !211, !212}
!211 = !{i32 786478, i32 0, !212, !"update_weights", !"update_weights", null, !212, i32 201, !213, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !218, i32 212}
!212 = !{i32 786473, !"data/benchmarks/backprop/backprop.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!213 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !214, i32 0, i32 0}
!214 = !{null, !215, !215, !215, !215, !215, !215, !215, !215, !215, !215, !215, !215}
!215 = !{i32 786447, null, !"", !216, i32 0, i64 64, i64 0, i32 0, i32 0, !217}
!216 = !{i32 786473, !"<unknown>", null, null}
!217 = !{i32 786468, null, !"double", null, i32 0, i64 64, i64 0, i32 0, i32 0, i32 4}
!218 = !{!219}
!219 = !{i32 0}
!220 = !{!"llvm.loop.name", !"update_weights_loop1"}
!221 = !{!"llvm.loop.tripcount", i32 13, i32 13, i32 13, !"user", !222}
!222 = !{i32 220, i32 9, !223, null}
!223 = !{i32 786443, !209, !212}
!224 = !{i32 0, i32 0, i32 7, i32 1}
!225 = !{i32 194}
!226 = !{!227, !228}
!227 = !{i32 189, !191}
!228 = !{i32 190, !194}
!229 = !{i32 198}
!230 = !{!231, !232, !233}
!231 = !{i32 191, !191}
!232 = !{i32 192, !194}
!233 = !{i32 193, !191}
!234 = !{i32 10, i32 10, i32 0, i32 2}
!235 = !{i32 7, i32 7, i32 0, i32 2}
!236 = distinct !{!236, !237, !242, !243, !247}
!237 = !{i32 226, i32 9, !238, null}
!238 = !{i32 786443, !239, i32 222, i32 9, !212, i32 0}
!239 = !{i32 786443, !240, !212}
!240 = !{i32 786443, !241, i32 219, i32 26, !212, i32 0}
!241 = !{i32 786443, !223, i32 219, i32 5, !212, i32 0}
!242 = !{!"llvm.loop.name", !"update_weights_loop1_1"}
!243 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !244}
!244 = !{i32 63, i32 9, !245, null}
!245 = !{i32 786443, !238, !246}
!246 = !{i32 786473, !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/backprop.tcl", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!247 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !248}
!248 = !{i32 223, i32 9, !249, null}
!249 = !{i32 786443, !238, !212}
!250 = !{i32 184}
!251 = !{!252, !253}
!252 = !{i32 195, !203}
!253 = !{i32 185, !254}
!254 = !{!"WAR", !"indep", i32 2, !"*", !"*", i32 -1, i1 true, i32 -1, i1 true}
!255 = !{i32 10, i32 10, i32 0, i32 0}
!256 = !{i32 64, i32 64, i32 0, i32 0}
!257 = !{i32 205}
!258 = !{!259, !261}
!259 = !{i32 203, !260}
!260 = !{!"WAR", !"indep", i32 2, !"=", !"=", i32 0, i1 true, i32 0, i1 true}
!261 = !{i32 204, !203}
!262 = !{i32 203}
!263 = !{!264, !266, !267}
!264 = !{i32 205, !265}
!265 = !{!"RAW", !"indep", i32 2, !"=", !"=", i32 0, i1 true, i32 0, i1 true}
!266 = !{i32 206, !191}
!267 = !{i32 204, !194}
!268 = !{i32 185}
!269 = !{!270, !190, !271}
!270 = !{i32 195, !194}
!271 = !{i32 184, !272}
!272 = !{!"RAW", !"indep", i32 2, !"*", !"*", i32 -1, i1 true, i32 -1, i1 true}
!273 = !{i32 187}
!274 = !{!275, !276}
!275 = !{i32 188, !194}
!276 = !{i32 186, !277}
!277 = !{!"RAW", !"indep", i32 1, !"*", i32 -1, i1 true}
!278 = !{i32 189}
!279 = !{!280, !281}
!280 = !{i32 194, !203}
!281 = !{i32 190, !205}
!282 = distinct !{!282, !283, !285, !286}
!283 = !{i32 233, i32 5, !284, null}
!284 = !{i32 786443, !210, i32 229, i32 5, !212, i32 0}
!285 = !{!"llvm.loop.name", !"update_weights_loop2"}
!286 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !287}
!287 = !{i32 230, i32 9, !288, null}
!288 = !{i32 786443, !284, !212}
!289 = !{i32 191}
!290 = !{!291, !292}
!291 = !{i32 198, !203}
!292 = !{i32 192, !205}
!293 = !{i32 201}
!294 = !{!295, !297}
!295 = !{i32 199, !296}
!296 = !{!"WAR", !"indep", i32 1, !"=", i32 0, i1 true}
!297 = !{i32 200, !203}
!298 = !{i32 199}
!299 = !{!300, !302, !303}
!300 = !{i32 201, !301}
!301 = !{!"RAW", !"indep", i32 1, !"=", i32 0, i1 true}
!302 = !{i32 202, !191}
!303 = !{i32 200, !194}
!304 = !{i32 190}
!305 = !{!306, !307}
!306 = !{i32 194, !194}
!307 = !{i32 189, !277}
!308 = !{i32 192}
!309 = !{!310, !311, !233}
!310 = !{i32 198, !194}
!311 = !{i32 191, !277}
!312 = !{i32 183}
!313 = !{!252, !314}
!314 = !{i32 185, !203}
!315 = !{i32 207}
!316 = !{!317, !318}
!317 = !{i32 196, !191}
!318 = !{i32 197, !194}
!319 = !{i32 196}
!320 = !{!321, !322}
!321 = !{i32 207, !203}
!322 = !{i32 197, !205}
!323 = distinct !{!323, !324, !326, !327}
!324 = !{i32 246, i32 5, !325, null}
!325 = !{i32 786443, !210, i32 239, i32 5, !212, i32 0}
!326 = !{!"llvm.loop.name", !"update_weights_loop3"}
!327 = !{!"llvm.loop.tripcount", i32 13, i32 13, i32 13, !"user", !328}
!328 = !{i32 240, i32 9, !329, null}
!329 = !{i32 786443, !325, !212}
!330 = distinct !{!330, !331, !336, !337, !340}
!331 = !{i32 245, i32 9, !332, null}
!332 = !{i32 786443, !333, i32 242, i32 9, !212, i32 0}
!333 = !{i32 786443, !334, !212}
!334 = !{i32 786443, !335, i32 239, i32 26, !212, i32 0}
!335 = !{i32 786443, !329, i32 239, i32 5, !212, i32 0}
!336 = !{!"llvm.loop.name", !"update_weights_loop3_1"}
!337 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !338}
!338 = !{i32 64, i32 9, !339, null}
!339 = !{i32 786443, !332, !246}
!340 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !341}
!341 = !{i32 243, i32 9, !342, null}
!342 = !{i32 786443, !332, !212}
!343 = !{i32 206}
!344 = !{!345, !346}
!345 = !{i32 203, !203}
!346 = !{i32 204, !260}
!347 = !{i32 204}
!348 = !{!349, !350, !351}
!349 = !{i32 205, !191}
!350 = !{i32 203, !194}
!351 = !{i32 206, !265}
!352 = !{i32 197}
!353 = !{!354, !355}
!354 = !{i32 207, !194}
!355 = !{i32 196, !277}
!356 = !{i32 193}
!357 = !{!291, !358}
!358 = !{i32 192, !203}
!359 = !{i32 210}
!360 = !{!361, !362}
!361 = !{i32 208, !191}
!362 = !{i32 209, !194}
!363 = !{i32 208}
!364 = !{!365, !366}
!365 = !{i32 210, !203}
!366 = !{i32 209, !205}
!367 = distinct !{!367, !368, !370, !371}
!368 = !{i32 251, i32 5, !369, null}
!369 = !{i32 786443, !210, i32 248, i32 5, !212, i32 0}
!370 = !{!"llvm.loop.name", !"update_weights_loop4"}
!371 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !372}
!372 = !{i32 249, i32 9, !373, null}
!373 = !{i32 786443, !369, !212}
!374 = !{i32 223}
!375 = !{!376, !377, !378}
!376 = !{i32 211, !191}
!377 = !{i32 212, !191}
!378 = !{i32 213, !194}
!379 = !{i32 216}
!380 = !{!381, !382}
!381 = !{i32 214, !191}
!382 = !{i32 215, !194}
!383 = !{i32 202}
!384 = !{!385, !386}
!385 = !{i32 199, !203}
!386 = !{i32 200, !296}
!387 = !{i32 200}
!388 = !{!389, !390, !391}
!389 = !{i32 201, !191}
!390 = !{i32 199, !194}
!391 = !{i32 202, !301}
!392 = !{i32 209}
!393 = !{!394, !395}
!394 = !{i32 210, !194}
!395 = !{i32 208, !277}
!396 = !{i32 214}
!397 = !{!398, !399}
!398 = !{i32 216, !203}
!399 = !{i32 215, !205}
!400 = distinct !{!400, !401, !403, !404}
!401 = !{i32 265, i32 5, !402, null}
!402 = !{i32 786443, !210, i32 257, i32 5, !212, i32 0}
!403 = !{!"llvm.loop.name", !"update_weights_loop5"}
!404 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !405}
!405 = !{i32 258, i32 9, !406, null}
!406 = !{i32 786443, !402, !212}
!407 = !{i32 222}
!408 = !{!409, !410}
!409 = !{i32 217, !191}
!410 = !{i32 218, !194}
!411 = !{i32 226}
!412 = !{!413, !414, !415}
!413 = !{i32 219, !191}
!414 = !{i32 220, !194}
!415 = !{i32 221, !191}
!416 = !{i32 6, i32 6, i32 0, i32 2}
!417 = distinct !{!417, !418, !423, !424, !427}
!418 = !{i32 264, i32 9, !419, null}
!419 = !{i32 786443, !420, i32 260, i32 9, !212, i32 0}
!420 = !{i32 786443, !421, !212}
!421 = !{i32 786443, !422, i32 257, i32 26, !212, i32 0}
!422 = !{i32 786443, !406, i32 257, i32 5, !212, i32 0}
!423 = !{!"llvm.loop.name", !"update_weights_loop5_1"}
!424 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !425}
!425 = !{i32 65, i32 9, !426, null}
!426 = !{i32 786443, !419, !246}
!427 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !428}
!428 = !{i32 261, i32 9, !429, null}
!429 = !{i32 786443, !419, !212}
!430 = !{i32 212}
!431 = !{!432, !433}
!432 = !{i32 223, !203}
!433 = !{i32 213, !254}
!434 = !{i32 12, i32 12, i32 0, i32 0}
!435 = !{i32 233}
!436 = !{!437, !438}
!437 = !{i32 231, !260}
!438 = !{i32 232, !203}
!439 = !{i32 231}
!440 = !{!441, !442, !443}
!441 = !{i32 233, !265}
!442 = !{i32 234, !191}
!443 = !{i32 232, !194}
!444 = !{i32 213}
!445 = !{!446, !376, !447}
!446 = !{i32 223, !194}
!447 = !{i32 212, !272}
!448 = !{i32 215}
!449 = !{!450, !451}
!450 = !{i32 216, !194}
!451 = !{i32 214, !277}
!452 = !{i32 217}
!453 = !{!454, !455}
!454 = !{i32 222, !203}
!455 = !{i32 218, !205}
!456 = distinct !{!456, !457, !459, !460}
!457 = !{i32 271, i32 5, !458, null}
!458 = !{i32 786443, !210, i32 267, i32 5, !212, i32 0}
!459 = !{!"llvm.loop.name", !"update_weights_loop6"}
!460 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !461}
!461 = !{i32 268, i32 9, !462, null}
!462 = !{i32 786443, !458, !212}
!463 = !{i32 219}
!464 = !{!465, !466}
!465 = !{i32 226, !203}
!466 = !{i32 220, !205}
!467 = !{i32 229}
!468 = !{!469, !470}
!469 = !{i32 227, !296}
!470 = !{i32 228, !203}
!471 = !{i32 227}
!472 = !{!473, !474, !475}
!473 = !{i32 229, !301}
!474 = !{i32 230, !191}
!475 = !{i32 228, !194}
!476 = !{i32 218}
!477 = !{!478, !479}
!478 = !{i32 222, !194}
!479 = !{i32 217, !277}
!480 = !{i32 220}
!481 = !{!482, !483, !415}
!482 = !{i32 226, !194}
!483 = !{i32 219, !277}
!484 = !{i32 211}
!485 = !{!432, !486}
!486 = !{i32 213, !203}
!487 = !{i32 235}
!488 = !{!489, !490}
!489 = !{i32 224, !191}
!490 = !{i32 225, !194}
!491 = !{i32 224}
!492 = !{!493, !494}
!493 = !{i32 235, !203}
!494 = !{i32 225, !205}
!495 = distinct !{!495, !496, !498, !499}
!496 = !{i32 284, i32 5, !497, null}
!497 = !{i32 786443, !210, i32 277, i32 5, !212, i32 0}
!498 = !{!"llvm.loop.name", !"update_weights_loop7"}
!499 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !500}
!500 = !{i32 278, i32 9, !501, null}
!501 = !{i32 786443, !497, !212}
!502 = distinct !{!502, !503, !508, !509, !512}
!503 = !{i32 283, i32 9, !504, null}
!504 = !{i32 786443, !505, i32 280, i32 9, !212, i32 0}
!505 = !{i32 786443, !506, !212}
!506 = !{i32 786443, !507, i32 277, i32 26, !212, i32 0}
!507 = !{i32 786443, !501, i32 277, i32 5, !212, i32 0}
!508 = !{!"llvm.loop.name", !"update_weights_loop7_1"}
!509 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !510}
!510 = !{i32 66, i32 9, !511, null}
!511 = !{i32 786443, !504, !246}
!512 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !513}
!513 = !{i32 281, i32 9, !514, null}
!514 = !{i32 786443, !504, !212}
!515 = !{i32 234}
!516 = !{!517, !518}
!517 = !{i32 231, !203}
!518 = !{i32 232, !260}
!519 = !{i32 232}
!520 = !{!521, !522, !523}
!521 = !{i32 233, !191}
!522 = !{i32 231, !194}
!523 = !{i32 234, !265}
!524 = !{i32 225}
!525 = !{!526, !527}
!526 = !{i32 235, !194}
!527 = !{i32 224, !277}
!528 = !{i32 221}
!529 = !{!465, !530}
!530 = !{i32 220, !203}
!531 = !{i32 238}
!532 = !{!533, !534}
!533 = !{i32 236, !191}
!534 = !{i32 237, !194}
!535 = !{i32 236}
!536 = !{!537, !538}
!537 = !{i32 238, !203}
!538 = !{i32 237, !205}
!539 = distinct !{!539, !540, !542, !543}
!540 = !{i32 289, i32 5, !541, null}
!541 = !{i32 786443, !210, i32 286, i32 5, !212, i32 0}
!542 = !{!"llvm.loop.name", !"update_weights_loop8"}
!543 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !544}
!544 = !{i32 287, i32 9, !545, null}
!545 = !{i32 786443, !541, !212}
!546 = !{i32 251}
!547 = !{!548, !549, !550}
!548 = !{i32 239, !191}
!549 = !{i32 240, !191}
!550 = !{i32 241, !194}
!551 = !{i32 244}
!552 = !{!553, !554}
!553 = !{i32 242, !191}
!554 = !{i32 243, !194}
!555 = !{i32 230}
!556 = !{!557, !558}
!557 = !{i32 227, !203}
!558 = !{i32 228, !296}
!559 = !{i32 228}
!560 = !{!561, !562, !563}
!561 = !{i32 229, !191}
!562 = !{i32 227, !194}
!563 = !{i32 230, !301}
!564 = !{i32 237}
!565 = !{!566, !567}
!566 = !{i32 238, !194}
!567 = !{i32 236, !277}
!568 = !{i32 242}
!569 = !{!570, !571}
!570 = !{i32 244, !203}
!571 = !{i32 243, !205}
!572 = distinct !{!572, !573, !575, !576}
!573 = !{i32 303, i32 5, !574, null}
!574 = !{i32 786443, !210, i32 295, i32 5, !212, i32 0}
!575 = !{!"llvm.loop.name", !"update_weights_loop9"}
!576 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !577}
!577 = !{i32 296, i32 9, !578, null}
!578 = !{i32 786443, !574, !212}
!579 = !{i32 0, i32 0, i32 2, i32 1}
!580 = !{i32 250}
!581 = !{!582, !583}
!582 = !{i32 245, !191}
!583 = !{i32 246, !194}
!584 = !{i32 254}
!585 = !{!586, !587, !588}
!586 = !{i32 247, !191}
!587 = !{i32 248, !194}
!588 = !{i32 249, !191}
!589 = !{i32 8, i32 8, i32 0, i32 0}
!590 = !{i32 8, i32 8, i32 0, i32 2}
!591 = !{i32 2, i32 2, i32 0, i32 2}
!592 = distinct !{!592, !593, !598, !599, !602}
!593 = !{i32 302, i32 9, !594, null}
!594 = !{i32 786443, !595, i32 298, i32 9, !212, i32 0}
!595 = !{i32 786443, !596, !212}
!596 = !{i32 786443, !597, i32 295, i32 26, !212, i32 0}
!597 = !{i32 786443, !578, i32 295, i32 5, !212, i32 0}
!598 = !{!"llvm.loop.name", !"update_weights_loop9_1"}
!599 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !600}
!600 = !{i32 67, i32 9, !601, null}
!601 = !{i32 786443, !594, !246}
!602 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !603}
!603 = !{i32 299, i32 9, !604, null}
!604 = !{i32 786443, !594, !212}
!605 = !{i32 240}
!606 = !{!607, !608}
!607 = !{i32 251, !203}
!608 = !{i32 241, !254}
!609 = !{i32 261}
!610 = !{!611, !612}
!611 = !{i32 259, !260}
!612 = !{i32 260, !203}
!613 = !{i32 259}
!614 = !{!615, !616, !617}
!615 = !{i32 261, !265}
!616 = !{i32 262, !191}
!617 = !{i32 260, !194}
!618 = !{i32 241}
!619 = !{!620, !548, !621}
!620 = !{i32 251, !194}
!621 = !{i32 240, !272}
!622 = !{i32 243}
!623 = !{!624, !625}
!624 = !{i32 244, !194}
!625 = !{i32 242, !277}
!626 = !{i32 245}
!627 = !{!628, !629}
!628 = !{i32 250, !203}
!629 = !{i32 246, !205}
!630 = distinct !{!630, !631, !633, !634}
!631 = !{i32 309, i32 5, !632, null}
!632 = !{i32 786443, !210, i32 305, i32 5, !212, i32 0}
!633 = !{!"llvm.loop.name", !"update_weights_loop10"}
!634 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !635}
!635 = !{i32 306, i32 9, !636, null}
!636 = !{i32 786443, !632, !212}
!637 = !{i32 247}
!638 = !{!639, !640}
!639 = !{i32 254, !203}
!640 = !{i32 248, !205}
!641 = !{i32 257}
!642 = !{!643, !644}
!643 = !{i32 255, !296}
!644 = !{i32 256, !203}
!645 = !{i32 255}
!646 = !{!647, !648, !649}
!647 = !{i32 257, !301}
!648 = !{i32 258, !191}
!649 = !{i32 256, !194}
!650 = !{i32 246}
!651 = !{!652, !653}
!652 = !{i32 250, !194}
!653 = !{i32 245, !277}
!654 = !{i32 248}
!655 = !{!656, !657, !588}
!656 = !{i32 254, !194}
!657 = !{i32 247, !277}
!658 = !{i32 239}
!659 = !{!607, !660}
!660 = !{i32 241, !203}
!661 = !{i32 263}
!662 = !{!663, !664}
!663 = !{i32 252, !191}
!664 = !{i32 253, !194}
!665 = !{i32 252}
!666 = !{!667, !668}
!667 = !{i32 263, !203}
!668 = !{i32 253, !205}
!669 = distinct !{!669, !670, !672, !673}
!670 = !{i32 322, i32 5, !671, null}
!671 = !{i32 786443, !210, i32 315, i32 5, !212, i32 0}
!672 = !{!"llvm.loop.name", !"update_weights_loop11"}
!673 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !674}
!674 = !{i32 316, i32 9, !675, null}
!675 = !{i32 786443, !671, !212}
!676 = distinct !{!676, !677, !682, !683, !686}
!677 = !{i32 321, i32 9, !678, null}
!678 = !{i32 786443, !679, i32 318, i32 9, !212, i32 0}
!679 = !{i32 786443, !680, !212}
!680 = !{i32 786443, !681, i32 315, i32 26, !212, i32 0}
!681 = !{i32 786443, !675, i32 315, i32 5, !212, i32 0}
!682 = !{!"llvm.loop.name", !"update_weights_loop11_1"}
!683 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !684}
!684 = !{i32 68, i32 9, !685, null}
!685 = !{i32 786443, !678, !246}
!686 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !687}
!687 = !{i32 319, i32 9, !688, null}
!688 = !{i32 786443, !678, !212}
!689 = !{i32 262}
!690 = !{!691, !692}
!691 = !{i32 259, !203}
!692 = !{i32 260, !260}
!693 = !{i32 260}
!694 = !{!695, !696, !697}
!695 = !{i32 261, !191}
!696 = !{i32 259, !194}
!697 = !{i32 262, !265}
!698 = !{i32 253}
!699 = !{!700, !701}
!700 = !{i32 263, !194}
!701 = !{i32 252, !277}
!702 = !{i32 249}
!703 = !{!639, !704}
!704 = !{i32 248, !203}
!705 = !{i32 266}
!706 = !{!707, !708}
!707 = !{i32 264, !191}
!708 = !{i32 265, !194}
!709 = !{i32 264}
!710 = !{!711, !712}
!711 = !{i32 266, !203}
!712 = !{i32 265, !205}
!713 = distinct !{!713, !714, !716, !717}
!714 = !{i32 327, i32 5, !715, null}
!715 = !{i32 786443, !210, i32 324, i32 5, !212, i32 0}
!716 = !{!"llvm.loop.name", !"update_weights_loop12"}
!717 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !718}
!718 = !{i32 325, i32 9, !719, null}
!719 = !{i32 786443, !715, !212}
!720 = !{i32 258}
!721 = !{!722, !723}
!722 = !{i32 255, !203}
!723 = !{i32 256, !296}
!724 = !{i32 256}
!725 = !{!726, !727, !728}
!726 = !{i32 257, !191}
!727 = !{i32 255, !194}
!728 = !{i32 258, !301}
!729 = !{i32 265}
!730 = !{!731, !732}
!731 = !{i32 266, !194}
!732 = !{i32 264, !277}
!733 = !{i32 289}
!734 = !{!735, !736}
!735 = !{i32 287, !191}
!736 = !{i32 288, !194}
!737 = !{i32 287}
!738 = !{!739, !740}
!739 = !{i32 289, !203}
!740 = !{i32 288, !205}
!741 = distinct !{!741, !742, !753, !754, !755, !757}
!742 = !{i32 48, i32 5, !743, !748}
!743 = !{i32 786443, !744, i32 48, i32 5, !212, i32 0}
!744 = !{i32 786478, i32 0, !212, !"add_bias_to_activations", !"add_bias_to_activations", null, !212, i32 43, !745, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !218, i32 45}
!745 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !746, i32 0, i32 0}
!746 = !{null, !215, !215, !747}
!747 = !{i32 786468, null, !"int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 5}
!748 = !{i32 87, i32 5, !749, null}
!749 = !{i32 786443, !750, !212}
!750 = !{i32 786478, i32 0, !212, !"matrix_vector_product_with_bias_second_layer", !"matrix_vector_product_with_bias_second_layer", null, !212, i32 72, !751, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([64 x i64]*, [4096 x i64]*, [64 x double]*, [64 x double]*)* @matrix_vector_product_with_bias_second_layer.1, null, null, !218, i32 75}
!751 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !752, i32 0, i32 0}
!752 = !{null, !215, !215, !215, !215}
!753 = !{i32 51, i32 5, !743, !748}
!754 = !{!"llvm.loop.name", !"add_bias_to_activations_loop1"}
!755 = !{!"llvm.loop.tripcount", i32 3, i32 64, i32 33, !"user", !756}
!756 = !{i32 49, i32 9, !743, !748}
!757 = !{!"llvm.loop.pipeline.enable", i32 -1, i1 false, i8 -1, !"auto"}
!758 = !{!759}
!759 = distinct !{!759, !760, !"add_bias_to_activations: %activations"}
!760 = distinct !{!760, !"add_bias_to_activations"}
!761 = !{!762}
!762 = distinct !{!762, !760, !"add_bias_to_activations: %biases"}
!763 = !{i32 291}
!764 = !{!765}
!765 = !{i32 290, !296}
!766 = !{i32 290}
!767 = !{!768}
!768 = !{i32 291, !301}
!769 = !{i32 288}
!770 = !{!771, !772}
!771 = !{i32 289, !194}
!772 = !{i32 287, !277}
!773 = !{i32 180}
!774 = !{!775, !776}
!775 = !{i32 178, !191}
!776 = !{i32 179, !194}
!777 = !{i32 178}
!778 = !{!779, !780}
!779 = !{i32 180, !203}
!780 = !{i32 179, !205}
!781 = distinct !{!781, !782, !784, !785}
!782 = !{i32 86, i32 5, !783, null}
!783 = !{i32 786443, !749, i32 78, i32 5, !212, i32 0}
!784 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_second_layer_loop1"}
!785 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !786}
!786 = !{i32 79, i32 9, !787, null}
!787 = !{i32 786443, !783, !212}
!788 = !{i32 182}
!789 = !{!790}
!790 = !{i32 181, !791}
!791 = !{!"Unknown", !"indep"}
!792 = distinct !{!792, !793, !798, !799, !802}
!793 = !{i32 85, i32 9, !794, null}
!794 = !{i32 786443, !795, i32 82, i32 9, !212, i32 0}
!795 = !{i32 786443, !796, !212}
!796 = !{i32 786443, !797, i32 78, i32 29, !212, i32 0}
!797 = !{i32 786443, !787, i32 78, i32 5, !212, i32 0}
!798 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_second_layer_loop1_1"}
!799 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !800}
!800 = !{i32 56, i32 9, !801, null}
!801 = !{i32 786443, !794, !246}
!802 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !803}
!803 = !{i32 83, i32 9, !804, null}
!804 = !{i32 786443, !794, !212}
!805 = !{i32 181}
!806 = !{!807}
!807 = !{i32 182, !791}
!808 = !{i32 179}
!809 = !{!810, !811}
!810 = !{i32 180, !194}
!811 = !{i32 178, !277}
!812 = !{i32 286}
!813 = !{!814, !815, !816}
!814 = !{i32 272, !191}
!815 = !{i32 273, !191}
!816 = !{i32 274, !194}
!817 = !{i32 285}
!818 = !{!819, !820, !821}
!819 = !{i32 275, !191}
!820 = !{i32 276, !191}
!821 = !{i32 277, !194}
!822 = !{i32 284}
!823 = !{!824, !825, !826}
!824 = !{i32 278, !191}
!825 = !{i32 279, !191}
!826 = !{i32 280, !194}
!827 = !{i32 283}
!828 = !{!829, !830}
!829 = !{i32 281, !191}
!830 = !{i32 282, !194}
!831 = !{i32 278}
!832 = !{!833, !834}
!833 = !{i32 284, !203}
!834 = !{i32 280, !203}
!835 = !{i32 275}
!836 = !{!837, !838}
!837 = !{i32 285, !203}
!838 = !{i32 277, !203}
!839 = !{i32 272}
!840 = !{!841, !842}
!841 = !{i32 286, !203}
!842 = !{i32 274, !203}
!843 = !{i32 281}
!844 = !{!845, !846}
!845 = !{i32 283, !203}
!846 = !{i32 282, !205}
!847 = distinct !{!847, !848, !852, !754, !853, !757}
!848 = !{i32 48, i32 5, !743, !849}
!849 = !{i32 105, i32 5, !850, null}
!850 = !{i32 786443, !851, !212}
!851 = !{i32 786478, i32 0, !212, !"matrix_vector_product_with_bias_output_layer", !"matrix_vector_product_with_bias_output_layer", null, !212, i32 90, !751, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !218, i32 93}
!852 = !{i32 51, i32 5, !743, !849}
!853 = !{!"llvm.loop.tripcount", i32 3, i32 64, i32 33, !"user", !854}
!854 = !{i32 49, i32 9, !743, !849}
!855 = !{i32 282}
!856 = !{!857, !858}
!857 = !{i32 283, !194}
!858 = !{i32 281, !277}
!859 = !{i32 279}
!860 = !{!833, !861}
!861 = !{i32 280, !205}
!862 = !{i32 276}
!863 = !{!837, !864}
!864 = !{i32 277, !205}
!865 = !{i32 273}
!866 = !{!841, !867}
!867 = !{i32 274, !205}
!868 = !{i32 2, i32 0, i32 0, i32 2}
!869 = !{i32 277}
!870 = !{!871, !819, !872}
!871 = !{i32 285, !194}
!872 = !{i32 276, !277}
!873 = !{i32 280}
!874 = !{!875, !824, !876}
!875 = !{i32 284, !194}
!876 = !{i32 279, !277}
!877 = !{i32 274}
!878 = !{!879, !814, !880}
!879 = !{i32 286, !194}
!880 = !{i32 273, !277}
!881 = !{i32 173}
!882 = !{!883, !884}
!883 = !{i32 162, !191}
!884 = !{i32 163, !194}
!885 = !{i32 172}
!886 = !{!887, !888}
!887 = !{i32 164, !191}
!888 = !{i32 165, !194}
!889 = !{i32 171}
!890 = !{!891, !892}
!891 = !{i32 166, !191}
!892 = !{i32 167, !194}
!893 = !{i32 170}
!894 = !{!895, !896}
!895 = !{i32 168, !191}
!896 = !{i32 169, !194}
!897 = !{i32 168}
!898 = !{!899, !900}
!899 = !{i32 170, !203}
!900 = !{i32 169, !205}
!901 = distinct !{!901, !902, !904, !905}
!902 = !{i32 104, i32 5, !903, null}
!903 = !{i32 786443, !850, i32 96, i32 5, !212, i32 0}
!904 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_output_layer_loop1"}
!905 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !906}
!906 = !{i32 97, i32 9, !907, null}
!907 = !{i32 786443, !903, !212}
!908 = !{i32 166}
!909 = !{!910, !911}
!910 = !{i32 171, !203}
!911 = !{i32 167, !203}
!912 = !{i32 164}
!913 = !{!914, !915}
!914 = !{i32 172, !203}
!915 = !{i32 165, !203}
!916 = !{i32 162}
!917 = !{!918, !919}
!918 = !{i32 173, !203}
!919 = !{i32 163, !203}
!920 = !{i32 177}
!921 = !{!922, !923, !924}
!922 = !{i32 174, !191}
!923 = !{i32 175, !191}
!924 = !{i32 176, !191}
!925 = !{i32 174}
!926 = !{!927}
!927 = !{i32 177, !203}
!928 = !{i32 175}
!929 = !{i32 176}
!930 = distinct !{!930, !931, !936, !937, !940}
!931 = !{i32 103, i32 9, !932, null}
!932 = !{i32 786443, !933, i32 100, i32 9, !212, i32 0}
!933 = !{i32 786443, !934, !212}
!934 = !{i32 786443, !935, i32 96, i32 27, !212, i32 0}
!935 = !{i32 786443, !907, i32 96, i32 5, !212, i32 0}
!936 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_output_layer_loop1_1"}
!937 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !938}
!938 = !{i32 57, i32 9, !939, null}
!939 = !{i32 786443, !932, !246}
!940 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !941}
!941 = !{i32 101, i32 9, !942, null}
!942 = !{i32 786443, !932, !212}
!943 = !{i32 163}
!944 = !{!945, !883}
!945 = !{i32 173, !194}
!946 = !{i32 169}
!947 = !{!948, !949}
!948 = !{i32 170, !194}
!949 = !{i32 168, !277}
!950 = !{i32 165}
!951 = !{!952, !887}
!952 = !{i32 172, !194}
!953 = !{i32 167}
!954 = !{!955, !891}
!955 = !{i32 171, !194}
!956 = !{i32 269}
!957 = !{!958, !959}
!958 = !{i32 267, !191}
!959 = !{i32 268, !194}
!960 = !{i32 267}
!961 = !{!962, !963}
!962 = !{i32 269, !203}
!963 = !{i32 268, !205}
!964 = distinct !{!964, !965, !969, !754, !970, !757}
!965 = !{i32 48, i32 5, !743, !966}
!966 = !{i32 69, i32 5, !967, null}
!967 = !{i32 786443, !968, !212}
!968 = !{i32 786478, i32 0, !212, !"matrix_vector_product_with_bias_input_layer", !"matrix_vector_product_with_bias_input_layer", null, !212, i32 54, !751, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([64 x i64]*, [832 x i64]*, [64 x double]*, [2119 x i64]*, i12)* @matrix_vector_product_with_bias_input_layer.1, null, null, !218, i32 57}
!969 = !{i32 51, i32 5, !743, !966}
!970 = !{!"llvm.loop.tripcount", i32 3, i32 64, i32 33, !"user", !971}
!971 = !{i32 49, i32 9, !743, !966}
!972 = !{!973}
!973 = distinct !{!973, !974, !"add_bias_to_activations: %activations"}
!974 = distinct !{!974, !"add_bias_to_activations"}
!975 = !{!976}
!976 = distinct !{!976, !974, !"add_bias_to_activations: %biases"}
!977 = !{i32 271}
!978 = !{!979}
!979 = !{i32 270, !296}
!980 = !{i32 270}
!981 = !{!982}
!982 = !{i32 271, !301}
!983 = !{i32 268}
!984 = !{!985, !986}
!985 = !{i32 269, !194}
!986 = !{i32 267, !277}
!987 = !{i32 0, i32 0, i32 10, i32 1}
!988 = !{i32 159}
!989 = !{!990, !991}
!990 = !{i32 154, !191}
!991 = !{i32 155, !194}
!992 = !{i32 158}
!993 = !{!994, !995}
!994 = !{i32 156, !191}
!995 = !{i32 157, !194}
!996 = !{i32 156}
!997 = !{!998, !999}
!998 = !{i32 158, !203}
!999 = !{i32 157, !205}
!1000 = !{i32 154}
!1001 = !{!1002, !1003}
!1002 = !{i32 159, !203}
!1003 = !{i32 155, !205}
!1004 = distinct !{!1004, !1005, !1007, !1008}
!1005 = !{i32 68, i32 5, !1006, null}
!1006 = !{i32 786443, !967, i32 60, i32 5, !212, i32 0}
!1007 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_input_layer_loop1"}
!1008 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1009}
!1009 = !{i32 61, i32 9, !1010, null}
!1010 = !{i32 786443, !1006, !212}
!1011 = !{i32 161}
!1012 = !{!1013}
!1013 = !{i32 160, !791}
!1014 = distinct !{!1014, !1015, !1020, !1021, !1024}
!1015 = !{i32 67, i32 9, !1016, null}
!1016 = !{i32 786443, !1017, i32 64, i32 9, !212, i32 0}
!1017 = !{i32 786443, !1018, !212}
!1018 = !{i32 786443, !1019, i32 60, i32 28, !212, i32 0}
!1019 = !{i32 786443, !1010, i32 60, i32 5, !212, i32 0}
!1020 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_input_layer_loop1_1"}
!1021 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1022}
!1022 = !{i32 55, i32 9, !1023, null}
!1023 = !{i32 786443, !1016, !246}
!1024 = !{!"llvm.loop.tripcount", i32 13, i32 13, i32 13, !"user", !1025}
!1025 = !{i32 65, i32 9, !1026, null}
!1026 = !{i32 786443, !1016, !212}
!1027 = !{i32 160}
!1028 = !{!1029}
!1029 = !{i32 161, !791}
!1030 = !{i32 155}
!1031 = !{!1032, !1033}
!1032 = !{i32 159, !194}
!1033 = !{i32 154, !277}
!1034 = !{i32 157}
!1035 = !{!1036, !1037}
!1036 = !{i32 158, !194}
!1037 = !{i32 156, !277}
!1038 = !{i32 153}
!1039 = !{!1040, !1041}
!1040 = !{i32 151, !191}
!1041 = !{i32 152, !194}
!1042 = !{i32 151}
!1043 = !{!1044, !1045}
!1044 = !{i32 153, !203}
!1045 = !{i32 152, !205}
!1046 = distinct !{!1046, !1047, !1051, !1052}
!1047 = !{i32 150, i32 5, !1048, null}
!1048 = !{i32 786443, !1049, i32 141, i32 5, !212, i32 0}
!1049 = !{i32 786443, !1050, !212}
!1050 = !{i32 786478, i32 0, !212, !"get_oracle_activations2", !"get_oracle_activations2", null, !212, i32 135, !751, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !218, i32 138}
!1051 = !{!"llvm.loop.name", !"get_oracle_activations2_loop1"}
!1052 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1053}
!1053 = !{i32 142, i32 9, !1054, null}
!1054 = !{i32 786443, !1048, !212}
!1055 = distinct !{!1055, !1056, !1061, !1062, !1065}
!1056 = !{i32 148, i32 9, !1057, null}
!1057 = !{i32 786443, !1058, i32 145, i32 9, !212, i32 0}
!1058 = !{i32 786443, !1059, !212}
!1059 = !{i32 786443, !1060, i32 141, i32 30, !212, i32 0}
!1060 = !{i32 786443, !1054, i32 141, i32 5, !212, i32 0}
!1061 = !{!"llvm.loop.name", !"get_oracle_activations2_loop1_1"}
!1062 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1063}
!1063 = !{i32 59, i32 9, !1064, null}
!1064 = !{i32 786443, !1057, !246}
!1065 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !1066}
!1066 = !{i32 146, i32 9, !1067, null}
!1067 = !{i32 786443, !1057, !212}
!1068 = !{i32 152}
!1069 = !{!1070, !1071}
!1070 = !{i32 153, !194}
!1071 = !{i32 151, !277}
!1072 = !{i32 150}
!1073 = !{!1074, !1075}
!1074 = !{i32 148, !191}
!1075 = !{i32 149, !194}
!1076 = !{i32 148}
!1077 = !{!1078, !1079}
!1078 = !{i32 150, !203}
!1079 = !{i32 149, !205}
!1080 = distinct !{!1080, !1081, !1085, !1086}
!1081 = !{i32 183, i32 5, !1082, null}
!1082 = !{i32 786443, !1083, i32 174, i32 5, !212, i32 0}
!1083 = !{i32 786443, !1084, !212}
!1084 = !{i32 786478, i32 0, !212, !"get_oracle_activations1", !"get_oracle_activations1", null, !212, i32 168, !751, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([4096 x i64]*, [64 x double]*, [64 x double]*, [64 x double]*)* @get_oracle_activations1.1, null, null, !218, i32 171}
!1085 = !{!"llvm.loop.name", !"get_oracle_activations1_loop1"}
!1086 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1087}
!1087 = !{i32 175, i32 9, !1088, null}
!1088 = !{i32 786443, !1082, !212}
!1089 = distinct !{!1089, !1090, !1095, !1096, !1099}
!1090 = !{i32 181, i32 9, !1091, null}
!1091 = !{i32 786443, !1092, i32 178, i32 9, !212, i32 0}
!1092 = !{i32 786443, !1093, !212}
!1093 = !{i32 786443, !1094, i32 174, i32 30, !212, i32 0}
!1094 = !{i32 786443, !1088, i32 174, i32 5, !212, i32 0}
!1095 = !{!"llvm.loop.name", !"get_oracle_activations1_loop1_1"}
!1096 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1097}
!1097 = !{i32 58, i32 9, !1098, null}
!1098 = !{i32 786443, !1091, !246}
!1099 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1100}
!1100 = !{i32 179, i32 9, !1101, null}
!1101 = !{i32 786443, !1091, !212}
!1102 = !{i32 149}
!1103 = !{!1104, !1105}
!1104 = !{i32 150, !194}
!1105 = !{i32 148, !277}
!1106 = !{i32 147}
!1107 = !{!1108, !1109}
!1108 = !{i32 145, !191}
!1109 = !{i32 146, !194}
!1110 = !{i32 145}
!1111 = !{!1112, !1113}
!1112 = !{i32 147, !203}
!1113 = !{i32 146, !205}
!1114 = distinct !{!1114, !1115, !1121, !1122}
!1115 = !{i32 132, i32 5, !1116, null}
!1116 = !{i32 786443, !1117, i32 125, i32 5, !212, i32 0}
!1117 = !{i32 786443, !1118, !212}
!1118 = !{i32 786478, i32 0, !212, !"get_delta_matrix_weights3", !"get_delta_matrix_weights3", null, !212, i32 120, !1119, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !218, i32 122}
!1119 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !1120, i32 0, i32 0}
!1120 = !{null, !215, !215, !215}
!1121 = !{!"llvm.loop.name", !"get_delta_matrix_weights3_loop1"}
!1122 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1123}
!1123 = !{i32 126, i32 9, !1124, null}
!1124 = !{i32 786443, !1116, !212}
!1125 = distinct !{!1125, !1126, !1131, !1132, !1135}
!1126 = !{i32 131, i32 9, !1127, null}
!1127 = !{i32 786443, !1128, i32 128, i32 9, !212, i32 0}
!1128 = !{i32 786443, !1129, !212}
!1129 = !{i32 786443, !1130, i32 125, i32 30, !212, i32 0}
!1130 = !{i32 786443, !1124, i32 125, i32 5, !212, i32 0}
!1131 = !{!"llvm.loop.name", !"get_delta_matrix_weights3_loop1_1"}
!1132 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1133}
!1133 = !{i32 62, i32 9, !1134, null}
!1134 = !{i32 786443, !1127, !246}
!1135 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !1136}
!1136 = !{i32 129, i32 9, !1137, null}
!1137 = !{i32 786443, !1127, !212}
!1138 = !{i32 146}
!1139 = !{!1140, !1141}
!1140 = !{i32 147, !194}
!1141 = !{i32 145, !277}
!1142 = !{i32 144}
!1143 = !{!1144, !1145}
!1144 = !{i32 142, !191}
!1145 = !{i32 143, !194}
!1146 = !{i32 142}
!1147 = !{!1148, !1149}
!1148 = !{i32 144, !203}
!1149 = !{i32 143, !205}
!1150 = distinct !{!1150, !1151, !1155, !1156}
!1151 = !{i32 165, i32 5, !1152, null}
!1152 = !{i32 786443, !1153, i32 158, i32 5, !212, i32 0}
!1153 = !{i32 786443, !1154, !212}
!1154 = !{i32 786478, i32 0, !212, !"get_delta_matrix_weights2", !"get_delta_matrix_weights2", null, !212, i32 153, !1119, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([4096 x double]*, [64 x double]*, [64 x double]*)* @get_delta_matrix_weights2, null, null, !218, i32 155}
!1155 = !{!"llvm.loop.name", !"get_delta_matrix_weights2_loop1"}
!1156 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1157}
!1157 = !{i32 159, i32 9, !1158, null}
!1158 = !{i32 786443, !1152, !212}
!1159 = distinct !{!1159, !1160, !1165, !1166, !1169}
!1160 = !{i32 164, i32 9, !1161, null}
!1161 = !{i32 786443, !1162, i32 161, i32 9, !212, i32 0}
!1162 = !{i32 786443, !1163, !212}
!1163 = !{i32 786443, !1164, i32 158, i32 30, !212, i32 0}
!1164 = !{i32 786443, !1158, i32 158, i32 5, !212, i32 0}
!1165 = !{!"llvm.loop.name", !"get_delta_matrix_weights2_loop1_1"}
!1166 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1167}
!1167 = !{i32 61, i32 9, !1168, null}
!1168 = !{i32 786443, !1161, !246}
!1169 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1170}
!1170 = !{i32 162, i32 9, !1171, null}
!1171 = !{i32 786443, !1161, !212}
!1172 = !{i32 143}
!1173 = !{!1174, !1175}
!1174 = !{i32 144, !194}
!1175 = !{i32 142, !277}
!1176 = !{i32 141}
!1177 = !{!1178, !1179}
!1178 = !{i32 139, !191}
!1179 = !{i32 140, !194}
!1180 = !{i32 139}
!1181 = !{!1182, !1183}
!1182 = !{i32 141, !203}
!1183 = !{i32 140, !205}
!1184 = distinct !{!1184, !1185, !1189, !1190}
!1185 = !{i32 198, i32 5, !1186, null}
!1186 = !{i32 786443, !1187, i32 191, i32 5, !212, i32 0}
!1187 = !{i32 786443, !1188, !212}
!1188 = !{i32 786478, i32 0, !212, !"get_delta_matrix_weights1", !"get_delta_matrix_weights1", null, !212, i32 186, !1119, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([832 x double]*, [64 x double]*, [2119 x i64]*, i12)* @get_delta_matrix_weights1.1, null, null, !218, i32 188}
!1189 = !{!"llvm.loop.name", !"get_delta_matrix_weights1_loop1"}
!1190 = !{!"llvm.loop.tripcount", i32 13, i32 13, i32 13, !"user", !1191}
!1191 = !{i32 192, i32 9, !1192, null}
!1192 = !{i32 786443, !1186, !212}
!1193 = distinct !{!1193, !1194, !1199, !1200, !1203}
!1194 = !{i32 197, i32 9, !1195, null}
!1195 = !{i32 786443, !1196, i32 194, i32 9, !212, i32 0}
!1196 = !{i32 786443, !1197, !212}
!1197 = !{i32 786443, !1198, i32 191, i32 30, !212, i32 0}
!1198 = !{i32 786443, !1192, i32 191, i32 5, !212, i32 0}
!1199 = !{!"llvm.loop.name", !"get_delta_matrix_weights1_loop1_1"}
!1200 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1201}
!1201 = !{i32 60, i32 9, !1202, null}
!1202 = !{i32 786443, !1195, !246}
!1203 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1204}
!1204 = !{i32 195, i32 9, !1205, null}
!1205 = !{i32 786443, !1195, !212}
!1206 = !{i32 140}
!1207 = !{!1208, !1209}
!1208 = !{i32 141, !194}
!1209 = !{i32 139, !277}
!1210 = !{i32 138}
!1211 = !{!1212, !1213}
!1212 = !{i32 127, !191}
!1213 = !{i32 128, !194}
!1214 = !{i32 137}
!1215 = !{!1216, !1217}
!1216 = !{i32 129, !191}
!1217 = !{i32 130, !194}
!1218 = !{i32 136}
!1219 = !{!1220, !1221}
!1220 = !{i32 131, !191}
!1221 = !{i32 132, !194}
!1222 = !{i32 135}
!1223 = !{!1224, !1225}
!1224 = !{i32 133, !191}
!1225 = !{i32 134, !194}
!1226 = !{i32 131}
!1227 = !{!1228, !1229}
!1228 = !{i32 136, !203}
!1229 = !{i32 132, !203}
!1230 = !{i32 129}
!1231 = !{!1232, !1233}
!1232 = !{i32 137, !203}
!1233 = !{i32 130, !203}
!1234 = !{i32 127}
!1235 = !{!1236, !1237}
!1236 = !{i32 138, !203}
!1237 = !{i32 128, !203}
!1238 = !{i32 133}
!1239 = !{!1240, !1241}
!1240 = !{i32 135, !203}
!1241 = !{i32 134, !205}
!1242 = distinct !{!1242, !1243, !1256, !1257, !1258, !757}
!1243 = !{i32 114, i32 5, !1244, !1246}
!1244 = !{i32 786443, !1245, i32 114, i32 5, !212, i32 0}
!1245 = !{i32 786478, i32 0, !212, !"take_difference", !"take_difference", null, !212, i32 108, !751, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !218, i32 111}
!1246 = !{i32 374, i32 9, !1247, null}
!1247 = !{i32 786443, !1248, !212}
!1248 = !{i32 786443, !1249, i32 356, i32 25, !212, i32 0}
!1249 = !{i32 786443, !1250, i32 356, i32 5, !212, i32 0}
!1250 = !{i32 786443, !1251, !212}
!1251 = !{i32 786443, !1252, i32 356, i32 5, !212, i32 0}
!1252 = !{i32 786443, !1253, !212}
!1253 = !{i32 786478, i32 0, !212, !"backprop", !"backprop", null, !212, i32 330, !1254, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([832 x i64]*, [4096 x i64]*, [192 x i64]*, [64 x i64]*, [64 x i64]*, [3 x i64]*, [2119 x i64]*, [489 x i64]*)* @backprop, null, null, !218, i32 337}
!1254 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !1255, i32 0, i32 0}
!1255 = !{null, !215, !215, !215, !215, !215, !215, !215, !215}
!1256 = !{i32 117, i32 5, !1244, !1246}
!1257 = !{!"llvm.loop.name", !"take_difference_loop1"}
!1258 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !1259}
!1259 = !{i32 115, i32 9, !1244, !1246}
!1260 = !{i32 134}
!1261 = !{!1262, !1263}
!1262 = !{i32 135, !194}
!1263 = !{i32 133, !277}
!1264 = !{i32 9, i32 9, i32 0, i32 0}
!1265 = !{i32 130}
!1266 = !{!1267, !1216}
!1267 = !{i32 137, !194}
!1268 = !{i32 128}
!1269 = !{!1270, !1212}
!1270 = !{i32 138, !194}
!1271 = !{i32 132}
!1272 = !{!1273, !1220}
!1273 = !{i32 136, !194}
!1274 = !{i32 126}
!1275 = !{!1276, !1277}
!1276 = !{i32 115, !191}
!1277 = !{i32 116, !194}
!1278 = !{i32 125}
!1279 = !{!1280, !1281}
!1280 = !{i32 117, !191}
!1281 = !{i32 118, !194}
!1282 = !{i32 124}
!1283 = !{!1284, !1285}
!1284 = !{i32 119, !191}
!1285 = !{i32 120, !194}
!1286 = !{i32 123}
!1287 = !{!1288, !1289}
!1288 = !{i32 121, !191}
!1289 = !{i32 122, !194}
!1290 = !{i32 119}
!1291 = !{!1292, !1293}
!1292 = !{i32 124, !203}
!1293 = !{i32 120, !203}
!1294 = !{i32 117}
!1295 = !{!1296, !1297}
!1296 = !{i32 125, !203}
!1297 = !{i32 118, !203}
!1298 = !{i32 115}
!1299 = !{!1300, !1301}
!1300 = !{i32 126, !203}
!1301 = !{i32 116, !203}
!1302 = !{i32 121}
!1303 = !{!1304, !1305}
!1304 = !{i32 123, !203}
!1305 = !{i32 122, !205}
!1306 = distinct !{!1306, !1307, !1313, !1314, !1315, !757}
!1307 = !{i32 27, i32 5, !1308, !1312}
!1308 = !{i32 786443, !1309, i32 27, i32 5, !212, i32 0}
!1309 = !{i32 786478, i32 0, !212, !"soft_max", !"soft_max", null, !212, i32 16, !1310, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !218, i32 16}
!1310 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !1311, i32 0, i32 0}
!1311 = !{null, !215, !215}
!1312 = !{i32 373, i32 9, !1247, null}
!1313 = !{i32 30, i32 5, !1308, !1312}
!1314 = !{!"llvm.loop.name", !"soft_max_loop2"}
!1315 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !1316}
!1316 = !{i32 28, i32 9, !1308, !1312}
!1317 = !{i32 122}
!1318 = !{!1319, !1320}
!1319 = !{i32 123, !194}
!1320 = !{i32 121, !277}
!1321 = !{i32 118}
!1322 = !{!1323, !1280}
!1323 = !{i32 125, !194}
!1324 = !{i32 116}
!1325 = !{!1326, !1276}
!1326 = !{i32 126, !194}
!1327 = !{i32 120}
!1328 = !{!1329, !1284}
!1329 = !{i32 124, !194}
!1330 = !{i32 113}
!1331 = !{!1332, !1333}
!1332 = !{i32 108, !191}
!1333 = !{i32 109, !194}
!1334 = !{i32 114}
!1335 = !{!1336, !1337, !1338}
!1336 = !{i32 110, !191}
!1337 = !{i32 111, !191}
!1338 = !{i32 112, !194}
!1339 = !{i32 110}
!1340 = !{!1341, !1342}
!1341 = !{i32 114, !203}
!1342 = !{i32 112, !203}
!1343 = !{i32 108}
!1344 = !{!1345, !1346}
!1345 = !{i32 113, !203}
!1346 = !{i32 109, !205}
!1347 = distinct !{!1347, !1348, !1350, !1351, !1352, !757}
!1348 = !{i32 22, i32 5, !1349, !1312}
!1349 = !{i32 786443, !1309, i32 22, i32 5, !212, i32 0}
!1350 = !{i32 25, i32 5, !1349, !1312}
!1351 = !{!"llvm.loop.name", !"soft_max_loop1"}
!1352 = !{!"llvm.loop.tripcount", i32 3, i32 3, i32 3, !"user", !1353}
!1353 = !{i32 23, i32 9, !1349, !1312}
!1354 = !{i32 111}
!1355 = !{!1341, !1356}
!1356 = !{i32 112, !205}
!1357 = !{i32 109}
!1358 = !{!1359, !1360}
!1359 = !{i32 113, !194}
!1360 = !{i32 108, !277}
!1361 = !{i32 112}
!1362 = !{!1363, !1336, !1364}
!1363 = !{i32 114, !194}
!1364 = !{i32 111, !277}
!1365 = !{i32 107}
!1366 = !{!1367, !1368}
!1367 = !{i32 96, !191}
!1368 = !{i32 97, !194}
!1369 = !{i32 106}
!1370 = !{!1371, !1372}
!1371 = !{i32 98, !191}
!1372 = !{i32 99, !194}
!1373 = !{i32 105}
!1374 = !{!1375, !1376}
!1375 = !{i32 100, !191}
!1376 = !{i32 101, !194}
!1377 = !{i32 104}
!1378 = !{!1379, !1380}
!1379 = !{i32 102, !191}
!1380 = !{i32 103, !194}
!1381 = !{i32 100}
!1382 = !{!1383, !1384}
!1383 = !{i32 105, !203}
!1384 = !{i32 101, !203}
!1385 = !{i32 98}
!1386 = !{!1387, !1388}
!1387 = !{i32 106, !203}
!1388 = !{i32 99, !203}
!1389 = !{i32 96}
!1390 = !{!1391, !1392}
!1391 = !{i32 107, !203}
!1392 = !{i32 97, !203}
!1393 = !{i32 102}
!1394 = !{!1395, !1396}
!1395 = !{i32 104, !203}
!1396 = !{i32 103, !205}
!1397 = distinct !{!1397, !1398, !1400, !1401, !1402, !1405, !757}
!1398 = !{i32 359, i32 9, !1399, null}
!1399 = !{i32 786443, !1247, i32 359, i32 9, !212, i32 0}
!1400 = !{i32 366, i32 9, !1399, null}
!1401 = !{!"llvm.loop.name", !"backprop_loop1_1"}
!1402 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !1403}
!1403 = !{i32 69, i32 9, !1404, null}
!1404 = !{i32 786443, !1399, !246}
!1405 = !{!"llvm.loop.tripcount", i32 64, i32 64, i32 64, !"user", !1406}
!1406 = !{i32 360, i32 9, !1407, null}
!1407 = !{i32 786443, !1399, !212}
!1408 = !{i32 103}
!1409 = !{!1410, !1411}
!1410 = !{i32 104, !194}
!1411 = !{i32 102, !277}
!1412 = !{i32 99}
!1413 = !{!1414, !1371}
!1414 = !{i32 106, !194}
!1415 = !{i32 97}
!1416 = !{!1417, !1367}
!1417 = !{i32 107, !194}
!1418 = !{i32 101}
!1419 = !{!1420, !1375}
!1420 = !{i32 105, !194}
!1421 = !{i32 95}
!1422 = !{!1423, !1424, !1425}
!1423 = !{i32 72, !191}
!1424 = !{i32 73, !191}
!1425 = !{i32 74, !194}
!1426 = !{i32 94}
!1427 = !{!1428, !1429, !1430}
!1428 = !{i32 75, !191}
!1429 = !{i32 76, !191}
!1430 = !{i32 77, !194}
!1431 = !{i32 93}
!1432 = !{!1433, !1434, !1435}
!1433 = !{i32 78, !191}
!1434 = !{i32 79, !191}
!1435 = !{i32 80, !194}
!1436 = !{i32 92}
!1437 = !{!1438, !1439}
!1438 = !{i32 81, !191}
!1439 = !{i32 82, !194}
!1440 = !{i32 91}
!1441 = !{!1442, !1443}
!1442 = !{i32 83, !191}
!1443 = !{i32 84, !194}
!1444 = !{i32 90}
!1445 = !{!1446, !1447}
!1446 = !{i32 85, !191}
!1447 = !{i32 86, !194}
!1448 = !{i32 89}
!1449 = !{!1450, !1451}
!1450 = !{i32 87, !191}
!1451 = !{i32 88, !194}
!1452 = !{i32 85}
!1453 = !{!1454, !1455}
!1454 = !{i32 90, !203}
!1455 = !{i32 86, !203}
!1456 = !{i32 83}
!1457 = !{!1458, !1459}
!1458 = !{i32 91, !203}
!1459 = !{i32 84, !203}
!1460 = !{i32 81}
!1461 = !{!1462, !1463}
!1462 = !{i32 92, !203}
!1463 = !{i32 82, !203}
!1464 = !{i32 78}
!1465 = !{!1466, !1467}
!1466 = !{i32 93, !203}
!1467 = !{i32 80, !203}
!1468 = !{i32 75}
!1469 = !{!1470, !1471}
!1470 = !{i32 94, !203}
!1471 = !{i32 77, !203}
!1472 = !{i32 72}
!1473 = !{!1474, !1475}
!1474 = !{i32 95, !203}
!1475 = !{i32 74, !203}
!1476 = !{i32 87}
!1477 = !{!1478, !1479}
!1478 = !{i32 89, !203}
!1479 = !{i32 88, !205}
!1480 = distinct !{!1480, !1481, !1485, !1486, !1487, !757}
!1481 = !{i32 36, i32 5, !1482, !1484}
!1482 = !{i32 786443, !1483, i32 36, i32 5, !212, i32 0}
!1483 = !{i32 786478, i32 0, !212, !"RELU", !"RELU", null, !212, i32 33, !745, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, !218, i32 33}
!1484 = !{i32 372, i32 9, !1247, null}
!1485 = !{i32 40, i32 5, !1482, !1484}
!1486 = !{!"llvm.loop.name", !"RELU_loop1"}
!1487 = !{!"llvm.loop.tripcount", i32 3, i32 64, i32 33, !"user", !1488}
!1488 = !{i32 37, i32 9, !1482, !1484}
!1489 = !{i32 88}
!1490 = !{!1491, !1492}
!1491 = !{i32 89, !194}
!1492 = !{i32 87, !277}
!1493 = !{i32 79}
!1494 = !{!1466, !1495}
!1495 = !{i32 80, !205}
!1496 = !{i32 76}
!1497 = !{!1470, !1498}
!1498 = !{i32 77, !205}
!1499 = !{i32 73}
!1500 = !{!1474, !1501}
!1501 = !{i32 74, !205}
!1502 = !{i32 77}
!1503 = !{!1504, !1428, !1505}
!1504 = !{i32 94, !194}
!1505 = !{i32 76, !277}
!1506 = !{i32 84}
!1507 = !{!1508, !1442}
!1508 = !{i32 91, !194}
!1509 = !{i32 74}
!1510 = !{!1511, !1423, !1512}
!1511 = !{i32 95, !194}
!1512 = !{i32 73, !277}
!1513 = !{i32 82}
!1514 = !{!1515, !1438}
!1515 = !{i32 92, !194}
!1516 = !{i32 80}
!1517 = !{!1518, !1433, !1519}
!1518 = !{i32 93, !194}
!1519 = !{i32 79, !277}
!1520 = !{i32 86}
!1521 = !{!1522, !1446}
!1522 = !{i32 90, !194}
!1523 = !{i32 69}
!1524 = !{!1525, !1526}
!1525 = !{i32 67, !191}
!1526 = !{i32 68, !194}
!1527 = !{i32 67}
!1528 = !{!1529, !1530}
!1529 = !{i32 69, !203}
!1530 = !{i32 68, !205}
!1531 = distinct !{!1531, !1532, !1534, !1486, !1535, !757}
!1532 = !{i32 36, i32 5, !1482, !1533}
!1533 = !{i32 370, i32 9, !1247, null}
!1534 = !{i32 40, i32 5, !1482, !1533}
!1535 = !{!"llvm.loop.tripcount", i32 3, i32 64, i32 33, !"user", !1536}
!1536 = !{i32 37, i32 9, !1482, !1533}
!1537 = !{!1538}
!1538 = distinct !{!1538, !1539, !"RELU: %activations"}
!1539 = distinct !{!1539, !"RELU"}
!1540 = !{!1541}
!1541 = distinct !{!1541, !1539, !"RELU: %dactivations"}
!1542 = !{i32 71}
!1543 = !{!1544}
!1544 = !{i32 70, !296}
!1545 = !{i32 70}
!1546 = !{!1547}
!1547 = !{i32 71, !301}
!1548 = !{i32 68}
!1549 = !{!1550, !1551}
!1550 = !{i32 69, !194}
!1551 = !{i32 67, !277}
!1552 = !{i32 64}
!1553 = !{!1554, !1555}
!1554 = !{i32 62, !191}
!1555 = !{i32 63, !194}
!1556 = !{i32 62}
!1557 = !{!1558, !1559}
!1558 = !{i32 64, !203}
!1559 = !{i32 63, !205}
!1560 = distinct !{!1560, !1561, !1563, !1486, !1564, !757}
!1561 = !{i32 36, i32 5, !1482, !1562}
!1562 = !{i32 368, i32 9, !1247, null}
!1563 = !{i32 40, i32 5, !1482, !1562}
!1564 = !{!"llvm.loop.tripcount", i32 3, i32 64, i32 33, !"user", !1565}
!1565 = !{i32 37, i32 9, !1482, !1562}
!1566 = !{!1567}
!1567 = distinct !{!1567, !1568, !"RELU: %activations"}
!1568 = distinct !{!1568, !"RELU"}
!1569 = !{!1570}
!1570 = distinct !{!1570, !1568, !"RELU: %dactivations"}
!1571 = !{i32 66}
!1572 = !{!1573}
!1573 = !{i32 65, !296}
!1574 = !{i32 65}
!1575 = !{!1576}
!1576 = !{i32 66, !301}
!1577 = !{i32 63}
!1578 = !{!1579, !1580}
!1579 = !{i32 64, !194}
!1580 = !{i32 62, !277}
!1581 = !{i32 0, i32 0, i32 12, i32 1}
!1582 = !{i32 0, i32 0, i32 8, i32 1}
!1583 = !{!1}
!1584 = !{i32 5}
!1585 = !{!1586, !1587}
!1586 = !{i32 0, !191}
!1587 = !{i32 1, !194}
!1588 = !{i32 4}
!1589 = !{!1590, !1591}
!1590 = !{i32 2, !191}
!1591 = !{i32 3, !194}
!1592 = !{i32 2}
!1593 = !{!1594, !1595}
!1594 = !{i32 4, !203}
!1595 = !{i32 3, !205}
!1596 = !{!1597, !1598}
!1597 = !{i32 5, !203}
!1598 = !{i32 1, !205}
!1599 = distinct !{!1599, !1600, !1601, !1602}
!1600 = !{i32 382, i32 5, !1251, null}
!1601 = !{!"llvm.loop.name", !"backprop_loop1"}
!1602 = !{!"llvm.loop.tripcount", i32 163, i32 163, i32 163, !"user", !1603}
!1603 = !{i32 357, i32 9, !1250, null}
!1604 = !{i32 61}
!1605 = !{!1606}
!1606 = !{i32 6, !205}
!1607 = !{i32 60}
!1608 = !{!1609}
!1609 = !{i32 7, !205}
!1610 = !{i32 59}
!1611 = !{!1612}
!1612 = !{i32 8, !205}
!1613 = !{i32 58}
!1614 = !{!1615}
!1615 = !{i32 9, !205}
!1616 = !{i32 57}
!1617 = !{!1618}
!1618 = !{i32 10, !205}
!1619 = !{i32 56}
!1620 = !{!1621}
!1621 = !{i32 11, !205}
!1622 = !{i32 55}
!1623 = !{!1624}
!1624 = !{i32 12, !205}
!1625 = !{i32 54}
!1626 = !{!1627}
!1627 = !{i32 13, !205}
!1628 = !{i32 53}
!1629 = !{!1630}
!1630 = !{i32 14, !205}
!1631 = !{i32 52}
!1632 = !{!1633}
!1633 = !{i32 15, !205}
!1634 = !{i32 51}
!1635 = !{!1636}
!1636 = !{i32 16, !205}
!1637 = !{i32 50}
!1638 = !{!1639}
!1639 = !{i32 17, !205}
!1640 = !{i32 28}
!1641 = !{!1642, !1643, !1644, !1645, !1647, !1648, !1649, !1650, !1651, !1652}
!1642 = !{i32 18, !277}
!1643 = !{i32 19, !277}
!1644 = !{i32 20, !277}
!1645 = !{i32 21, !1646}
!1646 = !{!"Unknown", !"indep", i32 1, !"*", i32 -1, i1 true}
!1647 = !{i32 22, !1646}
!1648 = !{i32 23, !1646}
!1649 = !{i32 24, !1646}
!1650 = !{i32 25, !277}
!1651 = !{i32 26, !277}
!1652 = !{i32 27, !277}
!1653 = !{i32 18}
!1654 = !{!1655}
!1655 = !{i32 28, !205}
!1656 = !{i32 19}
!1657 = !{i32 20}
!1658 = !{i32 21}
!1659 = !{!1660, !1647, !1648, !1661, !1662}
!1660 = !{i32 28, !1646}
!1661 = !{i32 27, !1646}
!1662 = !{i32 29, !1646}
!1663 = !{i32 22}
!1664 = !{!1660, !1645, !1648, !1661, !1665}
!1665 = !{i32 30, !277}
!1666 = !{i32 23}
!1667 = !{!1660, !1645, !1647, !1649, !1668, !1669, !1662}
!1668 = !{i32 25, !1646}
!1669 = !{i32 26, !1646}
!1670 = !{i32 24}
!1671 = !{!1660, !1648, !1668, !1669, !1672}
!1672 = !{i32 31, !277}
!1673 = !{i32 25}
!1674 = !{!1655, !1648, !1649, !1662}
!1675 = !{i32 38}
!1676 = !{!1677, !1678, !1679, !1680, !1681, !1682}
!1677 = !{i32 32, !277}
!1678 = !{i32 33, !277}
!1679 = !{i32 34, !277}
!1680 = !{i32 35, !277}
!1681 = !{i32 36, !277}
!1682 = !{i32 37, !277}
!1683 = !{i32 32}
!1684 = !{!1685}
!1685 = !{i32 38, !205}
!1686 = !{i32 33}
!1687 = !{i32 34}
!1688 = !{i32 35}
!1689 = !{i32 36}
!1690 = !{i32 37}
!1691 = !{i32 40}
!1692 = !{!1693}
!1693 = !{i32 39, !277}
!1694 = !{i32 39}
!1695 = !{!1696}
!1696 = !{i32 40, !205}
!1697 = !{i32 44}
!1698 = !{!1699, !1700, !1701}
!1699 = !{i32 41, !277}
!1700 = !{i32 42, !277}
!1701 = !{i32 43, !277}
!1702 = !{i32 41}
!1703 = !{!1704}
!1704 = !{i32 44, !205}
!1705 = !{i32 42}
!1706 = !{i32 43}
!1707 = !{i32 48}
!1708 = !{!1709, !1710, !1711}
!1709 = !{i32 45, !277}
!1710 = !{i32 46, !277}
!1711 = !{i32 47, !277}
!1712 = !{i32 45}
!1713 = !{!1714}
!1714 = !{i32 48, !205}
!1715 = !{i32 46}
!1716 = !{i32 47}
!1717 = !{i32 26}
!1718 = !{!1655, !1648, !1649, !1719}
!1719 = !{i32 29, !277}
!1720 = !{i32 31}
!1721 = !{!1722, !1652, !1665, !1662}
!1722 = !{i32 24, !205}
!1723 = !{i32 27}
!1724 = !{!1655, !1645, !1647, !1725, !1719}
!1725 = !{i32 31, !205}
!1726 = !{i32 30}
!1727 = !{!1728, !1725, !1729, !1662}
!1728 = !{i32 22, !205}
!1729 = !{i32 49, !277}
!1730 = !{i32 49}
!1731 = !{!1732, !1719}
!1732 = !{i32 30, !205}
!1733 = !{i32 29}
!1734 = !{!1645, !1648, !1668, !1735, !1736, !1737, !1738, !1739}
!1735 = !{i32 26, !205}
!1736 = !{i32 31, !1646}
!1737 = !{i32 27, !205}
!1738 = !{i32 30, !1646}
!1739 = !{i32 49, !205}
!1740 = !{i32 17}
!1741 = !{!1742}
!1742 = !{i32 50, !277}
!1743 = !{i32 16}
!1744 = !{!1745}
!1745 = !{i32 51, !277}
!1746 = !{i32 15}
!1747 = !{!1748}
!1748 = !{i32 52, !277}
!1749 = !{i32 14}
!1750 = !{!1751}
!1751 = !{i32 53, !277}
!1752 = !{i32 13}
!1753 = !{!1754}
!1754 = !{i32 54, !277}
!1755 = !{i32 12}
!1756 = !{!1757}
!1757 = !{i32 55, !277}
!1758 = !{i32 11}
!1759 = !{!1760}
!1760 = !{i32 56, !277}
!1761 = !{i32 10}
!1762 = !{!1763}
!1763 = !{i32 57, !277}
!1764 = !{i32 9}
!1765 = !{!1766}
!1766 = !{i32 58, !277}
!1767 = !{i32 8}
!1768 = !{!1769}
!1769 = !{i32 59, !277}
!1770 = !{i32 7}
!1771 = !{!1772}
!1772 = !{i32 60, !277}
!1773 = !{i32 6}
!1774 = !{!1775}
!1775 = !{i32 61, !277}
!1776 = !{i32 1}
!1777 = !{!1778, !1779}
!1778 = !{i32 5, !194}
!1779 = !{i32 0, !277}
!1780 = !{i32 3}
!1781 = !{!1782, !1783}
!1782 = !{i32 4, !194}
!1783 = !{i32 2, !277}
