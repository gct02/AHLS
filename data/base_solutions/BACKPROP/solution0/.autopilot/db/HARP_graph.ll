; ModuleID = '<stdin>'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: nounwind
define void @soft_max(double* "fpga.decayed.dim.hint"="3" %net_outputs, double* "fpga.decayed.dim.hint"="3" %activations) #0 !id !4 {
entry:
  br label %soft_max_loop1, !id !5, !id.4 !5

soft_max_loop1:                                   ; preds = %entry
  br label %for.cond, !id !6, !id.6 !6

for.cond:                                         ; preds = %for.inc, %soft_max_loop1
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc ], [ 0, %soft_max_loop1 ], !id !7, !id.7 !7
  %sum.0 = phi double [ 0.000000e+00, %soft_max_loop1 ], [ %add, %for.inc ], !id !8, !id.8 !8
  %exitcond3 = icmp ne i64 %indvars.iv1, 3, !id !9, !id.11 !9
  br i1 %exitcond3, label %for.body, label %for.end, !id !10, !id.12 !10

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds double, double* %activations, i64 %indvars.iv1, !id !11, !id.13 !11
  %0 = load double, double* %arrayidx, align 8, !id !12, !id.14 !12
  %sub = fsub double -0.000000e+00, %0, !id !13, !id.15 !13
  %1 = call double @llvm.exp.f64(double %sub), !id !14, !id.16 !14
  %add = fadd double %sum.0, %1, !id !15, !id.17 !15
  br label %for.inc, !id !16, !id.19 !16

for.inc:                                          ; preds = %for.body
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1, !id !17, !id.20 !17
  br label %for.cond, !llvm.loop !18, !id !19, !id.22 !19

for.end:                                          ; preds = %for.cond
  %sum.0.lcssa = phi double [ %sum.0, %for.cond ], !id !20, !id.23 !20
  br label %soft_max_loop2, !id !21, !id.24 !21

soft_max_loop2:                                   ; preds = %for.end
  br label %for.cond1, !id !22, !id.26 !22

for.cond1:                                        ; preds = %for.inc9, %soft_max_loop2
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc9 ], [ 0, %soft_max_loop2 ], !id !23, !id.27 !23
  %exitcond = icmp ne i64 %indvars.iv, 3, !id !24, !id.29 !24
  br i1 %exitcond, label %for.body3, label %for.end11, !id !25, !id.30 !25

for.body3:                                        ; preds = %for.cond1
  %arrayidx5 = getelementptr inbounds double, double* %activations, i64 %indvars.iv, !id !26, !id.31 !26
  %2 = load double, double* %arrayidx5, align 8, !id !27, !id.32 !27
  %sub6 = fsub double -0.000000e+00, %2, !id !28, !id.33 !28
  %3 = call double @llvm.exp.f64(double %sub6), !id !29, !id.34 !29
  %div = fdiv double %3, %sum.0.lcssa, !id !30, !id.35 !30
  %arrayidx8 = getelementptr inbounds double, double* %net_outputs, i64 %indvars.iv, !id !31, !id.36 !31
  store double %div, double* %arrayidx8, align 8, !id !32, !id.37 !32
  br label %for.inc9, !id !33, !id.38 !33

for.inc9:                                         ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !34, !id.39 !34
  br label %for.cond1, !llvm.loop !35, !id !36, !id.41 !36

for.end11:                                        ; preds = %for.cond1
  ret void, !id !37, !id.42 !37
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.exp.f64(double) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
define void @RELU(double* "fpga.decayed.dim.hint"="64" %activations, double* "fpga.decayed.dim.hint"="64" %dactivations, i32 %size) #0 !id !5 {
entry:
  br label %RELU_loop1, !id !38, !id.46 !38

RELU_loop1:                                       ; preds = %entry
  %0 = sext i32 %size to i64, !id !39, !id.48 !39
  br label %for.cond, !id !40, !id.49 !40

for.cond:                                         ; preds = %for.inc, %RELU_loop1
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %RELU_loop1 ], !id !41, !id.50 !41
  %cmp = icmp slt i64 %indvars.iv, %0, !id !42, !id.52 !42
  br i1 %cmp, label %for.body, label %for.end, !id !43, !id.53 !43

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds double, double* %activations, i64 %indvars.iv, !id !44, !id.54 !44
  %1 = load double, double* %arrayidx, align 8, !id !45, !id.55 !45
  %arrayidx2 = getelementptr inbounds double, double* %activations, i64 %indvars.iv, !id !46, !id.56 !46
  %2 = load double, double* %arrayidx2, align 8, !id !47, !id.57 !47
  %sub = fsub double 1.000000e+00, %2, !id !48, !id.58 !48
  %mul = fmul double %1, %sub, !id !49, !id.59 !49
  %arrayidx4 = getelementptr inbounds double, double* %dactivations, i64 %indvars.iv, !id !50, !id.60 !50
  store double %mul, double* %arrayidx4, align 8, !id !51, !id.61 !51
  %arrayidx6 = getelementptr inbounds double, double* %activations, i64 %indvars.iv, !id !52, !id.62 !52
  %3 = load double, double* %arrayidx6, align 8, !id !53, !id.63 !53
  %sub7 = fsub double -0.000000e+00, %3, !id !54, !id.64 !54
  %4 = call double @llvm.exp.f64(double %sub7), !id !55, !id.65 !55
  %add = fadd double 1.000000e+00, %4, !id !56, !id.66 !56
  %div = fdiv double 1.000000e+00, %add, !id !57, !id.67 !57
  %arrayidx9 = getelementptr inbounds double, double* %activations, i64 %indvars.iv, !id !58, !id.68 !58
  store double %div, double* %arrayidx9, align 8, !id !59, !id.69 !59
  br label %for.inc, !id !60, !id.70 !60

for.inc:                                          ; preds = %for.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !61, !id.71 !61
  br label %for.cond, !llvm.loop !62, !id !63, !id.73 !63

for.end:                                          ; preds = %for.cond
  ret void, !id !64, !id.74 !64
}

; Function Attrs: nounwind
define void @add_bias_to_activations(double* "fpga.decayed.dim.hint"="64" %biases, double* "fpga.decayed.dim.hint"="64" %activations, i32 %size) #0 !id !6 {
entry:
  br label %add_bias_to_activations_loop1, !id !65, !id.78 !65

add_bias_to_activations_loop1:                    ; preds = %entry
  %0 = sext i32 %size to i64, !id !66, !id.80 !66
  br label %for.cond, !id !67, !id.81 !67

for.cond:                                         ; preds = %for.inc, %add_bias_to_activations_loop1
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %add_bias_to_activations_loop1 ], !id !68, !id.82 !68
  %cmp = icmp slt i64 %indvars.iv, %0, !id !69, !id.84 !69
  br i1 %cmp, label %for.body, label %for.end, !id !70, !id.85 !70

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds double, double* %activations, i64 %indvars.iv, !id !71, !id.86 !71
  %1 = load double, double* %arrayidx, align 8, !id !72, !id.87 !72
  %arrayidx2 = getelementptr inbounds double, double* %biases, i64 %indvars.iv, !id !73, !id.88 !73
  %2 = load double, double* %arrayidx2, align 8, !id !74, !id.89 !74
  %add = fadd double %1, %2, !id !75, !id.90 !75
  %arrayidx4 = getelementptr inbounds double, double* %activations, i64 %indvars.iv, !id !76, !id.91 !76
  store double %add, double* %arrayidx4, align 8, !id !77, !id.92 !77
  br label %for.inc, !id !78, !id.93 !78

for.inc:                                          ; preds = %for.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !79, !id.94 !79
  br label %for.cond, !llvm.loop !80, !id !81, !id.96 !81

for.end:                                          ; preds = %for.cond
  ret void, !id !82, !id.97 !82
}

; Function Attrs: noinline nounwind
define void @matrix_vector_product_with_bias_input_layer(double* "fpga.decayed.dim.hint"="64" %biases, double* "fpga.decayed.dim.hint"="832" %weights, double* "fpga.decayed.dim.hint"="64" %activations, double* "fpga.decayed.dim.hint"="13" %input_sample) #3 !fpga.function.pragma !83 !id !8 {
entry:
  br label %matrix_vector_product_with_bias_input_layer_loop1, !id !85, !id.102 !85

matrix_vector_product_with_bias_input_layer_loop1: ; preds = %entry
  br label %for.cond, !id !86, !id.104 !86

for.cond:                                         ; preds = %for.inc12, %matrix_vector_product_with_bias_input_layer_loop1
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc12 ], [ 0, %matrix_vector_product_with_bias_input_layer_loop1 ], !id !87, !id.105 !87
  %exitcond5 = icmp ne i64 %indvars.iv2, 64, !id !88, !id.107 !88
  br i1 %exitcond5, label %for.body, label %for.end14, !id !89, !id.108 !89

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds double, double* %activations, i64 %indvars.iv2, !id !90, !id.109 !90
  store double 0.000000e+00, double* %arrayidx, align 8, !id !91, !id.110 !91
  br label %matrix_vector_product_with_bias_input_layer_loop1_1, !id !92, !id.111 !92

matrix_vector_product_with_bias_input_layer_loop1_1: ; preds = %for.body
  br label %for.cond1, !id !93, !id.113 !93

for.cond1:                                        ; preds = %for.inc, %matrix_vector_product_with_bias_input_layer_loop1_1
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %matrix_vector_product_with_bias_input_layer_loop1_1 ], !id !94, !id.114 !94
  %exitcond = icmp ne i64 %indvars.iv, 13, !id !95, !id.116 !95
  br i1 %exitcond, label %for.body3, label %for.end, !id !96, !id.117 !96

for.body3:                                        ; preds = %for.cond1
  %0 = mul nuw nsw i64 %indvars.iv2, 13, !id !97, !id.118 !97
  %1 = add nuw nsw i64 %0, %indvars.iv, !id !98, !id.119 !98
  %arrayidx5 = getelementptr inbounds double, double* %weights, i64 %1, !id !99, !id.120 !99
  %2 = load double, double* %arrayidx5, align 8, !id !100, !id.121 !100
  %arrayidx7 = getelementptr inbounds double, double* %input_sample, i64 %indvars.iv, !id !101, !id.122 !101
  %3 = load double, double* %arrayidx7, align 8, !id !102, !id.123 !102
  %mul8 = fmul double %2, %3, !id !103, !id.124 !103
  %arrayidx10 = getelementptr inbounds double, double* %activations, i64 %indvars.iv2, !id !104, !id.125 !104
  %4 = load double, double* %arrayidx10, align 8, !id !105, !id.126 !105
  %add11 = fadd double %4, %mul8, !id !106, !id.127 !106
  store double %add11, double* %arrayidx10, align 8, !id !107, !id.128 !107
  br label %for.inc, !id !108, !id.129 !108

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !109, !id.130 !109
  br label %for.cond1, !llvm.loop !110, !id !111, !id.132 !111

for.end:                                          ; preds = %for.cond1
  br label %for.inc12, !id !112, !id.133 !112

for.inc12:                                        ; preds = %for.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1, !id !113, !id.134 !113
  br label %for.cond, !llvm.loop !114, !id !115, !id.136 !115

for.end14:                                        ; preds = %for.cond
  call void @add_bias_to_activations(double* %biases, double* %activations, i32 64), !id !116, !id.137 !116
  ret void, !id !117, !id.138 !117
}

; Function Attrs: noinline nounwind
define void @matrix_vector_product_with_bias_second_layer(double* "fpga.decayed.dim.hint"="64" %biases, double* "fpga.decayed.dim.hint"="4096" %weights, double* "fpga.decayed.dim.hint"="64" %activations, double* "fpga.decayed.dim.hint"="64" %input_activations) #3 !fpga.function.pragma !83 !id !9 {
entry:
  br label %matrix_vector_product_with_bias_second_layer_loop1, !id !118, !id.143 !118

matrix_vector_product_with_bias_second_layer_loop1: ; preds = %entry
  br label %for.cond, !id !119, !id.145 !119

for.cond:                                         ; preds = %for.inc12, %matrix_vector_product_with_bias_second_layer_loop1
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc12 ], [ 0, %matrix_vector_product_with_bias_second_layer_loop1 ], !id !120, !id.146 !120
  %exitcond5 = icmp ne i64 %indvars.iv2, 64, !id !121, !id.148 !121
  br i1 %exitcond5, label %for.body, label %for.end14, !id !122, !id.149 !122

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds double, double* %activations, i64 %indvars.iv2, !id !123, !id.150 !123
  store double 0.000000e+00, double* %arrayidx, align 8, !id !124, !id.151 !124
  br label %matrix_vector_product_with_bias_second_layer_loop1_1, !id !125, !id.152 !125

matrix_vector_product_with_bias_second_layer_loop1_1: ; preds = %for.body
  br label %for.cond1, !id !126, !id.154 !126

for.cond1:                                        ; preds = %for.inc, %matrix_vector_product_with_bias_second_layer_loop1_1
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %matrix_vector_product_with_bias_second_layer_loop1_1 ], !id !127, !id.155 !127
  %exitcond = icmp ne i64 %indvars.iv, 64, !id !128, !id.157 !128
  br i1 %exitcond, label %for.body3, label %for.end, !id !129, !id.158 !129

for.body3:                                        ; preds = %for.cond1
  %0 = mul nuw nsw i64 %indvars.iv2, 64, !id !130, !id.159 !130
  %1 = add nuw nsw i64 %0, %indvars.iv, !id !131, !id.160 !131
  %arrayidx5 = getelementptr inbounds double, double* %weights, i64 %1, !id !132, !id.161 !132
  %2 = load double, double* %arrayidx5, align 8, !id !133, !id.162 !133
  %arrayidx7 = getelementptr inbounds double, double* %input_activations, i64 %indvars.iv, !id !134, !id.163 !134
  %3 = load double, double* %arrayidx7, align 8, !id !135, !id.164 !135
  %mul8 = fmul double %2, %3, !id !136, !id.165 !136
  %arrayidx10 = getelementptr inbounds double, double* %activations, i64 %indvars.iv2, !id !137, !id.166 !137
  %4 = load double, double* %arrayidx10, align 8, !id !138, !id.167 !138
  %add11 = fadd double %4, %mul8, !id !139, !id.168 !139
  store double %add11, double* %arrayidx10, align 8, !id !140, !id.169 !140
  br label %for.inc, !id !141, !id.170 !141

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !142, !id.171 !142
  br label %for.cond1, !llvm.loop !143, !id !144, !id.173 !144

for.end:                                          ; preds = %for.cond1
  br label %for.inc12, !id !145, !id.174 !145

for.inc12:                                        ; preds = %for.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1, !id !146, !id.175 !146
  br label %for.cond, !llvm.loop !147, !id !148, !id.177 !148

for.end14:                                        ; preds = %for.cond
  call void @add_bias_to_activations(double* %biases, double* %activations, i32 64), !id !149, !id.178 !149
  ret void, !id !150, !id.179 !150
}

; Function Attrs: noinline nounwind
define void @matrix_vector_product_with_bias_output_layer(double* "fpga.decayed.dim.hint"="3" %biases, double* "fpga.decayed.dim.hint"="192" %weights, double* "fpga.decayed.dim.hint"="3" %activations, double* "fpga.decayed.dim.hint"="64" %input_activations) #3 !fpga.function.pragma !83 !id !12 {
entry:
  br label %matrix_vector_product_with_bias_output_layer_loop1, !id !151, !id.184 !151

matrix_vector_product_with_bias_output_layer_loop1: ; preds = %entry
  br label %for.cond, !id !152, !id.186 !152

for.cond:                                         ; preds = %for.inc12, %matrix_vector_product_with_bias_output_layer_loop1
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc12 ], [ 0, %matrix_vector_product_with_bias_output_layer_loop1 ], !id !153, !id.187 !153
  %exitcond5 = icmp ne i64 %indvars.iv2, 3, !id !154, !id.189 !154
  br i1 %exitcond5, label %for.body, label %for.end14, !id !155, !id.190 !155

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds double, double* %activations, i64 %indvars.iv2, !id !156, !id.191 !156
  store double 0.000000e+00, double* %arrayidx, align 8, !id !157, !id.192 !157
  br label %matrix_vector_product_with_bias_output_layer_loop1_1, !id !158, !id.193 !158

matrix_vector_product_with_bias_output_layer_loop1_1: ; preds = %for.body
  br label %for.cond1, !id !159, !id.195 !159

for.cond1:                                        ; preds = %for.inc, %matrix_vector_product_with_bias_output_layer_loop1_1
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %matrix_vector_product_with_bias_output_layer_loop1_1 ], !id !160, !id.196 !160
  %exitcond = icmp ne i64 %indvars.iv, 64, !id !161, !id.198 !161
  br i1 %exitcond, label %for.body3, label %for.end, !id !162, !id.199 !162

for.body3:                                        ; preds = %for.cond1
  %0 = mul nuw nsw i64 %indvars.iv2, 64, !id !163, !id.200 !163
  %1 = add nuw nsw i64 %0, %indvars.iv, !id !164, !id.201 !164
  %arrayidx5 = getelementptr inbounds double, double* %weights, i64 %1, !id !165, !id.202 !165
  %2 = load double, double* %arrayidx5, align 8, !id !166, !id.203 !166
  %arrayidx7 = getelementptr inbounds double, double* %input_activations, i64 %indvars.iv, !id !167, !id.204 !167
  %3 = load double, double* %arrayidx7, align 8, !id !168, !id.205 !168
  %mul8 = fmul double %2, %3, !id !169, !id.206 !169
  %arrayidx10 = getelementptr inbounds double, double* %activations, i64 %indvars.iv2, !id !170, !id.207 !170
  %4 = load double, double* %arrayidx10, align 8, !id !171, !id.208 !171
  %add11 = fadd double %4, %mul8, !id !172, !id.209 !172
  store double %add11, double* %arrayidx10, align 8, !id !173, !id.210 !173
  br label %for.inc, !id !174, !id.211 !174

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !175, !id.212 !175
  br label %for.cond1, !llvm.loop !176, !id !177, !id.214 !177

for.end:                                          ; preds = %for.cond1
  br label %for.inc12, !id !178, !id.215 !178

for.inc12:                                        ; preds = %for.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1, !id !179, !id.216 !179
  br label %for.cond, !llvm.loop !180, !id !181, !id.218 !181

for.end14:                                        ; preds = %for.cond
  call void @add_bias_to_activations(double* %biases, double* %activations, i32 3), !id !182, !id.219 !182
  ret void, !id !183, !id.220 !183
}

; Function Attrs: nounwind
define void @take_difference(double* "fpga.decayed.dim.hint"="3" %net_outputs, double* "fpga.decayed.dim.hint"="3" %solutions, double* "fpga.decayed.dim.hint"="3" %output_difference, double* "fpga.decayed.dim.hint"="3" %dactivations) #0 !id !15 {
entry:
  br label %take_difference_loop1, !id !184, !id.225 !184

take_difference_loop1:                            ; preds = %entry
  br label %for.cond, !id !185, !id.227 !185

for.cond:                                         ; preds = %for.inc, %take_difference_loop1
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %take_difference_loop1 ], !id !186, !id.228 !186
  %exitcond = icmp ne i64 %indvars.iv, 3, !id !187, !id.230 !187
  br i1 %exitcond, label %for.body, label %for.end, !id !188, !id.231 !188

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds double, double* %net_outputs, i64 %indvars.iv, !id !189, !id.232 !189
  %0 = load double, double* %arrayidx, align 8, !id !190, !id.233 !190
  %arrayidx2 = getelementptr inbounds double, double* %solutions, i64 %indvars.iv, !id !191, !id.234 !191
  %1 = load double, double* %arrayidx2, align 8, !id !192, !id.235 !192
  %sub = fsub double %0, %1, !id !193, !id.236 !193
  %mul = fmul double %sub, -1.000000e+00, !id !194, !id.237 !194
  %arrayidx4 = getelementptr inbounds double, double* %dactivations, i64 %indvars.iv, !id !195, !id.238 !195
  %2 = load double, double* %arrayidx4, align 8, !id !196, !id.239 !196
  %mul5 = fmul double %mul, %2, !id !197, !id.240 !197
  %arrayidx7 = getelementptr inbounds double, double* %output_difference, i64 %indvars.iv, !id !198, !id.241 !198
  store double %mul5, double* %arrayidx7, align 8, !id !199, !id.242 !199
  br label %for.inc, !id !200, !id.243 !200

for.inc:                                          ; preds = %for.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !201, !id.244 !201
  br label %for.cond, !llvm.loop !202, !id !203, !id.246 !203

for.end:                                          ; preds = %for.cond
  ret void, !id !204, !id.247 !204
}

; Function Attrs: noinline nounwind
define void @get_delta_matrix_weights3(double* "fpga.decayed.dim.hint"="192" %delta_weights3, double* "fpga.decayed.dim.hint"="3" %output_difference, double* "fpga.decayed.dim.hint"="64" %last_activations) #3 !fpga.function.pragma !83 !id !16 {
entry:
  br label %get_delta_matrix_weights3_loop1, !id !205, !id.251 !205

get_delta_matrix_weights3_loop1:                  ; preds = %entry
  br label %for.cond, !id !206, !id.253 !206

for.cond:                                         ; preds = %for.inc9, %get_delta_matrix_weights3_loop1
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc9 ], [ 0, %get_delta_matrix_weights3_loop1 ], !id !207, !id.254 !207
  %exitcond5 = icmp ne i64 %indvars.iv2, 64, !id !208, !id.256 !208
  br i1 %exitcond5, label %for.body, label %for.end11, !id !209, !id.257 !209

for.body:                                         ; preds = %for.cond
  br label %get_delta_matrix_weights3_loop1_1, !id !210, !id.258 !210

get_delta_matrix_weights3_loop1_1:                ; preds = %for.body
  br label %for.cond1, !id !211, !id.260 !211

for.cond1:                                        ; preds = %for.inc, %get_delta_matrix_weights3_loop1_1
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %get_delta_matrix_weights3_loop1_1 ], !id !212, !id.261 !212
  %exitcond = icmp ne i64 %indvars.iv, 3, !id !213, !id.263 !213
  br i1 %exitcond, label %for.body3, label %for.end, !id !214, !id.264 !214

for.body3:                                        ; preds = %for.cond1
  %arrayidx = getelementptr inbounds double, double* %last_activations, i64 %indvars.iv2, !id !215, !id.265 !215
  %0 = load double, double* %arrayidx, align 8, !id !216, !id.266 !216
  %arrayidx5 = getelementptr inbounds double, double* %output_difference, i64 %indvars.iv, !id !217, !id.267 !217
  %1 = load double, double* %arrayidx5, align 8, !id !218, !id.268 !218
  %mul = fmul double %0, %1, !id !219, !id.269 !219
  %2 = mul nuw nsw i64 %indvars.iv2, 3, !id !220, !id.270 !220
  %3 = add nuw nsw i64 %2, %indvars.iv, !id !221, !id.271 !221
  %arrayidx8 = getelementptr inbounds double, double* %delta_weights3, i64 %3, !id !222, !id.272 !222
  store double %mul, double* %arrayidx8, align 8, !id !223, !id.273 !223
  br label %for.inc, !id !224, !id.274 !224

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !225, !id.275 !225
  br label %for.cond1, !llvm.loop !226, !id !227, !id.277 !227

for.end:                                          ; preds = %for.cond1
  br label %for.inc9, !id !228, !id.278 !228

for.inc9:                                         ; preds = %for.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1, !id !229, !id.279 !229
  br label %for.cond, !llvm.loop !230, !id !231, !id.281 !231

for.end11:                                        ; preds = %for.cond
  ret void, !id !232, !id.282 !232
}

; Function Attrs: noinline nounwind
define void @get_oracle_activations2(double* "fpga.decayed.dim.hint"="192" %weights3, double* "fpga.decayed.dim.hint"="3" %output_differences, double* "fpga.decayed.dim.hint"="64" %oracle_activations, double* "fpga.decayed.dim.hint"="64" %dactivations) #3 !fpga.function.pragma !83 !id !19 {
entry:
  br label %get_oracle_activations2_loop1, !id !233, !id.287 !233

get_oracle_activations2_loop1:                    ; preds = %entry
  br label %for.cond, !id !234, !id.289 !234

for.cond:                                         ; preds = %for.inc19, %get_oracle_activations2_loop1
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc19 ], [ 0, %get_oracle_activations2_loop1 ], !id !235, !id.290 !235
  %exitcond5 = icmp ne i64 %indvars.iv2, 64, !id !236, !id.292 !236
  br i1 %exitcond5, label %for.body, label %for.end21, !id !237, !id.293 !237

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds double, double* %oracle_activations, i64 %indvars.iv2, !id !238, !id.294 !238
  store double 0.000000e+00, double* %arrayidx, align 8, !id !239, !id.295 !239
  br label %get_oracle_activations2_loop1_1, !id !240, !id.296 !240

get_oracle_activations2_loop1_1:                  ; preds = %for.body
  br label %for.cond1, !id !241, !id.298 !241

for.cond1:                                        ; preds = %for.inc, %get_oracle_activations2_loop1_1
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %get_oracle_activations2_loop1_1 ], !id !242, !id.299 !242
  %exitcond = icmp ne i64 %indvars.iv, 3, !id !243, !id.301 !243
  br i1 %exitcond, label %for.body3, label %for.end, !id !244, !id.302 !244

for.body3:                                        ; preds = %for.cond1
  %arrayidx5 = getelementptr inbounds double, double* %output_differences, i64 %indvars.iv, !id !245, !id.303 !245
  %0 = load double, double* %arrayidx5, align 8, !id !246, !id.304 !246
  %1 = mul nuw nsw i64 %indvars.iv2, 3, !id !247, !id.305 !247
  %2 = add nuw nsw i64 %1, %indvars.iv, !id !248, !id.306 !248
  %arrayidx7 = getelementptr inbounds double, double* %weights3, i64 %2, !id !249, !id.307 !249
  %3 = load double, double* %arrayidx7, align 8, !id !250, !id.308 !250
  %mul8 = fmul double %0, %3, !id !251, !id.309 !251
  %arrayidx10 = getelementptr inbounds double, double* %oracle_activations, i64 %indvars.iv2, !id !252, !id.310 !252
  %4 = load double, double* %arrayidx10, align 8, !id !253, !id.311 !253
  %add11 = fadd double %4, %mul8, !id !254, !id.312 !254
  store double %add11, double* %arrayidx10, align 8, !id !255, !id.313 !255
  br label %for.inc, !id !256, !id.314 !256

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !257, !id.315 !257
  br label %for.cond1, !llvm.loop !258, !id !259, !id.317 !259

for.end:                                          ; preds = %for.cond1
  %arrayidx13 = getelementptr inbounds double, double* %oracle_activations, i64 %indvars.iv2, !id !260, !id.318 !260
  %5 = load double, double* %arrayidx13, align 8, !id !261, !id.319 !261
  %arrayidx15 = getelementptr inbounds double, double* %dactivations, i64 %indvars.iv2, !id !262, !id.320 !262
  %6 = load double, double* %arrayidx15, align 8, !id !263, !id.321 !263
  %mul16 = fmul double %5, %6, !id !264, !id.322 !264
  %arrayidx18 = getelementptr inbounds double, double* %oracle_activations, i64 %indvars.iv2, !id !265, !id.323 !265
  store double %mul16, double* %arrayidx18, align 8, !id !266, !id.324 !266
  br label %for.inc19, !id !267, !id.325 !267

for.inc19:                                        ; preds = %for.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1, !id !268, !id.326 !268
  br label %for.cond, !llvm.loop !269, !id !270, !id.328 !270

for.end21:                                        ; preds = %for.cond
  ret void, !id !271, !id.329 !271
}

; Function Attrs: noinline nounwind
define void @get_delta_matrix_weights2(double* "fpga.decayed.dim.hint"="4096" %delta_weights2, double* "fpga.decayed.dim.hint"="64" %output_difference, double* "fpga.decayed.dim.hint"="64" %last_activations) #3 !fpga.function.pragma !83 !id !272 {
entry:
  br label %get_delta_matrix_weights2_loop1, !id !273, !id.333 !273

get_delta_matrix_weights2_loop1:                  ; preds = %entry
  br label %for.cond, !id !274, !id.335 !274

for.cond:                                         ; preds = %for.inc9, %get_delta_matrix_weights2_loop1
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc9 ], [ 0, %get_delta_matrix_weights2_loop1 ], !id !275, !id.336 !275
  %exitcond5 = icmp ne i64 %indvars.iv2, 64, !id !276, !id.338 !276
  br i1 %exitcond5, label %for.body, label %for.end11, !id !277, !id.339 !277

for.body:                                         ; preds = %for.cond
  br label %get_delta_matrix_weights2_loop1_1, !id !278, !id.340 !278

get_delta_matrix_weights2_loop1_1:                ; preds = %for.body
  br label %for.cond1, !id !279, !id.342 !279

for.cond1:                                        ; preds = %for.inc, %get_delta_matrix_weights2_loop1_1
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %get_delta_matrix_weights2_loop1_1 ], !id !280, !id.343 !280
  %exitcond = icmp ne i64 %indvars.iv, 64, !id !281, !id.345 !281
  br i1 %exitcond, label %for.body3, label %for.end, !id !282, !id.346 !282

for.body3:                                        ; preds = %for.cond1
  %arrayidx = getelementptr inbounds double, double* %last_activations, i64 %indvars.iv2, !id !283, !id.347 !283
  %0 = load double, double* %arrayidx, align 8, !id !284, !id.348 !284
  %arrayidx5 = getelementptr inbounds double, double* %output_difference, i64 %indvars.iv, !id !285, !id.349 !285
  %1 = load double, double* %arrayidx5, align 8, !id !286, !id.350 !286
  %mul = fmul double %0, %1, !id !287, !id.351 !287
  %2 = mul nuw nsw i64 %indvars.iv2, 64, !id !288, !id.352 !288
  %3 = add nuw nsw i64 %2, %indvars.iv, !id !289, !id.353 !289
  %arrayidx8 = getelementptr inbounds double, double* %delta_weights2, i64 %3, !id !290, !id.354 !290
  store double %mul, double* %arrayidx8, align 8, !id !291, !id.355 !291
  br label %for.inc, !id !292, !id.356 !292

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !293, !id.357 !293
  br label %for.cond1, !llvm.loop !294, !id !295, !id.359 !295

for.end:                                          ; preds = %for.cond1
  br label %for.inc9, !id !296, !id.360 !296

for.inc9:                                         ; preds = %for.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1, !id !297, !id.361 !297
  br label %for.cond, !llvm.loop !298, !id !299, !id.363 !299

for.end11:                                        ; preds = %for.cond
  ret void, !id !300, !id.364 !300
}

; Function Attrs: noinline nounwind
define void @get_oracle_activations1(double* "fpga.decayed.dim.hint"="4096" %weights2, double* "fpga.decayed.dim.hint"="64" %output_differences, double* "fpga.decayed.dim.hint"="64" %oracle_activations, double* "fpga.decayed.dim.hint"="64" %dactivations) #3 !fpga.function.pragma !83 !id !301 {
entry:
  br label %get_oracle_activations1_loop1, !id !302, !id.369 !302

get_oracle_activations1_loop1:                    ; preds = %entry
  br label %for.cond, !id !303, !id.371 !303

for.cond:                                         ; preds = %for.inc19, %get_oracle_activations1_loop1
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc19 ], [ 0, %get_oracle_activations1_loop1 ], !id !304, !id.372 !304
  %exitcond5 = icmp ne i64 %indvars.iv2, 64, !id !305, !id.374 !305
  br i1 %exitcond5, label %for.body, label %for.end21, !id !306, !id.375 !306

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds double, double* %oracle_activations, i64 %indvars.iv2, !id !307, !id.376 !307
  store double 0.000000e+00, double* %arrayidx, align 8, !id !308, !id.377 !308
  br label %get_oracle_activations1_loop1_1, !id !309, !id.378 !309

get_oracle_activations1_loop1_1:                  ; preds = %for.body
  br label %for.cond1, !id !310, !id.380 !310

for.cond1:                                        ; preds = %for.inc, %get_oracle_activations1_loop1_1
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %get_oracle_activations1_loop1_1 ], !id !311, !id.381 !311
  %exitcond = icmp ne i64 %indvars.iv, 64, !id !312, !id.383 !312
  br i1 %exitcond, label %for.body3, label %for.end, !id !313, !id.384 !313

for.body3:                                        ; preds = %for.cond1
  %arrayidx5 = getelementptr inbounds double, double* %output_differences, i64 %indvars.iv, !id !314, !id.385 !314
  %0 = load double, double* %arrayidx5, align 8, !id !315, !id.386 !315
  %1 = mul nuw nsw i64 %indvars.iv2, 64, !id !316, !id.387 !316
  %2 = add nuw nsw i64 %1, %indvars.iv, !id !317, !id.388 !317
  %arrayidx7 = getelementptr inbounds double, double* %weights2, i64 %2, !id !318, !id.389 !318
  %3 = load double, double* %arrayidx7, align 8, !id !319, !id.390 !319
  %mul8 = fmul double %0, %3, !id !320, !id.391 !320
  %arrayidx10 = getelementptr inbounds double, double* %oracle_activations, i64 %indvars.iv2, !id !321, !id.392 !321
  %4 = load double, double* %arrayidx10, align 8, !id !322, !id.393 !322
  %add11 = fadd double %4, %mul8, !id !323, !id.394 !323
  store double %add11, double* %arrayidx10, align 8, !id !324, !id.395 !324
  br label %for.inc, !id !325, !id.396 !325

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !326, !id.397 !326
  br label %for.cond1, !llvm.loop !327, !id !328, !id.399 !328

for.end:                                          ; preds = %for.cond1
  %arrayidx13 = getelementptr inbounds double, double* %oracle_activations, i64 %indvars.iv2, !id !329, !id.400 !329
  %5 = load double, double* %arrayidx13, align 8, !id !330, !id.401 !330
  %arrayidx15 = getelementptr inbounds double, double* %dactivations, i64 %indvars.iv2, !id !331, !id.402 !331
  %6 = load double, double* %arrayidx15, align 8, !id !332, !id.403 !332
  %mul16 = fmul double %5, %6, !id !333, !id.404 !333
  %arrayidx18 = getelementptr inbounds double, double* %oracle_activations, i64 %indvars.iv2, !id !334, !id.405 !334
  store double %mul16, double* %arrayidx18, align 8, !id !335, !id.406 !335
  br label %for.inc19, !id !336, !id.407 !336

for.inc19:                                        ; preds = %for.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1, !id !337, !id.408 !337
  br label %for.cond, !llvm.loop !338, !id !339, !id.410 !339

for.end21:                                        ; preds = %for.cond
  ret void, !id !340, !id.411 !340
}

; Function Attrs: noinline nounwind
define void @get_delta_matrix_weights1(double* "fpga.decayed.dim.hint"="832" %delta_weights1, double* "fpga.decayed.dim.hint"="64" %output_difference, double* "fpga.decayed.dim.hint"="13" %last_activations) #3 !fpga.function.pragma !83 !id !26 {
entry:
  br label %get_delta_matrix_weights1_loop1, !id !341, !id.415 !341

get_delta_matrix_weights1_loop1:                  ; preds = %entry
  br label %for.cond, !id !342, !id.417 !342

for.cond:                                         ; preds = %for.inc9, %get_delta_matrix_weights1_loop1
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc9 ], [ 0, %get_delta_matrix_weights1_loop1 ], !id !343, !id.418 !343
  %exitcond5 = icmp ne i64 %indvars.iv2, 13, !id !344, !id.420 !344
  br i1 %exitcond5, label %for.body, label %for.end11, !id !345, !id.421 !345

for.body:                                         ; preds = %for.cond
  br label %get_delta_matrix_weights1_loop1_1, !id !346, !id.422 !346

get_delta_matrix_weights1_loop1_1:                ; preds = %for.body
  br label %for.cond1, !id !347, !id.424 !347

for.cond1:                                        ; preds = %for.inc, %get_delta_matrix_weights1_loop1_1
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %get_delta_matrix_weights1_loop1_1 ], !id !348, !id.425 !348
  %exitcond = icmp ne i64 %indvars.iv, 64, !id !349, !id.427 !349
  br i1 %exitcond, label %for.body3, label %for.end, !id !350, !id.428 !350

for.body3:                                        ; preds = %for.cond1
  %arrayidx = getelementptr inbounds double, double* %last_activations, i64 %indvars.iv2, !id !351, !id.429 !351
  %0 = load double, double* %arrayidx, align 8, !id !352, !id.430 !352
  %arrayidx5 = getelementptr inbounds double, double* %output_difference, i64 %indvars.iv, !id !353, !id.431 !353
  %1 = load double, double* %arrayidx5, align 8, !id !354, !id.432 !354
  %mul = fmul double %0, %1, !id !355, !id.433 !355
  %2 = mul nuw nsw i64 %indvars.iv2, 64, !id !356, !id.434 !356
  %3 = add nuw nsw i64 %2, %indvars.iv, !id !357, !id.435 !357
  %arrayidx8 = getelementptr inbounds double, double* %delta_weights1, i64 %3, !id !358, !id.436 !358
  store double %mul, double* %arrayidx8, align 8, !id !359, !id.437 !359
  br label %for.inc, !id !360, !id.438 !360

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !361, !id.439 !361
  br label %for.cond1, !llvm.loop !362, !id !363, !id.441 !363

for.end:                                          ; preds = %for.cond1
  br label %for.inc9, !id !364, !id.442 !364

for.inc9:                                         ; preds = %for.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1, !id !365, !id.443 !365
  br label %for.cond, !llvm.loop !366, !id !367, !id.445 !367

for.end11:                                        ; preds = %for.cond
  ret void, !id !368, !id.446 !368
}

; Function Attrs: noinline nounwind
define void @update_weights(double* "fpga.decayed.dim.hint"="832" %weights1, double* "fpga.decayed.dim.hint"="4096" %weights2, double* "fpga.decayed.dim.hint"="192" %weights3, double* "fpga.decayed.dim.hint"="832" %d_weights1, double* "fpga.decayed.dim.hint"="4096" %d_weights2, double* "fpga.decayed.dim.hint"="192" %d_weights3, double* "fpga.decayed.dim.hint"="64" %biases1, double* "fpga.decayed.dim.hint"="64" %biases2, double* "fpga.decayed.dim.hint"="3" %biases3, double* "fpga.decayed.dim.hint"="64" %d_biases1, double* "fpga.decayed.dim.hint"="64" %d_biases2, double* "fpga.decayed.dim.hint"="3" %d_biases3) #3 !fpga.function.pragma !83 !id !29 {
entry:
  br label %update_weights_loop1, !id !369, !id.461 !369

update_weights_loop1:                             ; preds = %entry
  br label %for.cond, !id !370, !id.463 !370

for.cond:                                         ; preds = %for.inc19, %update_weights_loop1
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %for.inc19 ], [ 0, %update_weights_loop1 ], !id !371, !id.464 !371
  %norm.0 = phi double [ 0.000000e+00, %update_weights_loop1 ], [ %norm.1.lcssa, %for.inc19 ], !id !372, !id.465 !372
  %exitcond87 = icmp ne i64 %indvars.iv81, 13, !id !373, !id.468 !373
  br i1 %exitcond87, label %for.body, label %for.end21, !id !374, !id.469 !374

for.body:                                         ; preds = %for.cond
  br label %update_weights_loop1_1, !id !375, !id.470 !375

update_weights_loop1_1:                           ; preds = %for.body
  br label %for.cond1, !id !376, !id.472 !376

for.cond1:                                        ; preds = %for.inc, %update_weights_loop1_1
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %for.inc ], [ 0, %update_weights_loop1_1 ], !id !377, !id.473 !377
  %norm.1 = phi double [ %norm.0, %update_weights_loop1_1 ], [ %add18, %for.inc ], !id !378, !id.474 !378
  %exitcond80 = icmp ne i64 %indvars.iv74, 64, !id !379, !id.477 !379
  br i1 %exitcond80, label %for.body3, label %for.end, !id !380, !id.478 !380

for.body3:                                        ; preds = %for.cond1
  %0 = mul nuw nsw i64 %indvars.iv81, 64, !id !381, !id.479 !381
  %1 = add nuw nsw i64 %0, %indvars.iv74, !id !382, !id.480 !382
  %arrayidx = getelementptr inbounds double, double* %d_weights1, i64 %1, !id !383, !id.481 !383
  %2 = load double, double* %arrayidx, align 8, !id !384, !id.482 !384
  %mul4 = fmul double %2, 1.000000e-02, !id !385, !id.483 !385
  %3 = mul nuw nsw i64 %indvars.iv81, 64, !id !386, !id.484 !386
  %4 = add nuw nsw i64 %3, %indvars.iv74, !id !387, !id.485 !387
  %arrayidx8 = getelementptr inbounds double, double* %weights1, i64 %4, !id !388, !id.486 !388
  %5 = load double, double* %arrayidx8, align 8, !id !389, !id.487 !389
  %sub = fsub double %5, %mul4, !id !390, !id.488 !390
  store double %sub, double* %arrayidx8, align 8, !id !391, !id.489 !391
  %6 = mul nuw nsw i64 %indvars.iv81, 64, !id !392, !id.490 !392
  %7 = add nuw nsw i64 %6, %indvars.iv74, !id !393, !id.491 !393
  %arrayidx12 = getelementptr inbounds double, double* %weights1, i64 %7, !id !394, !id.492 !394
  %8 = load double, double* %arrayidx12, align 8, !id !395, !id.493 !395
  %9 = mul nuw nsw i64 %indvars.iv81, 64, !id !396, !id.494 !396
  %10 = add nuw nsw i64 %9, %indvars.iv74, !id !397, !id.495 !397
  %arrayidx16 = getelementptr inbounds double, double* %weights1, i64 %10, !id !398, !id.496 !398
  %11 = load double, double* %arrayidx16, align 8, !id !399, !id.497 !399
  %mul17 = fmul double %8, %11, !id !400, !id.498 !400
  %add18 = fadd double %norm.1, %mul17, !id !401, !id.499 !401
  br label %for.inc, !id !402, !id.501 !402

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1, !id !403, !id.502 !403
  br label %for.cond1, !llvm.loop !404, !id !405, !id.504 !405

for.end:                                          ; preds = %for.cond1
  %norm.1.lcssa = phi double [ %norm.1, %for.cond1 ], !id !406, !id.505 !406
  br label %for.inc19, !id !407, !id.506 !407

for.inc19:                                        ; preds = %for.end
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1, !id !408, !id.507 !408
  br label %for.cond, !llvm.loop !409, !id !410, !id.509 !410

for.end21:                                        ; preds = %for.cond
  %norm.0.lcssa = phi double [ %norm.0, %for.cond ], !id !411, !id.510 !411
  br label %update_weights_loop2, !id !412, !id.511 !412

update_weights_loop2:                             ; preds = %for.end21
  br label %for.cond22, !id !413, !id.513 !413

for.cond22:                                       ; preds = %for.inc37, %update_weights_loop2
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %for.inc37 ], [ 0, %update_weights_loop2 ], !id !414, !id.514 !414
  %bias_norm.0 = phi double [ 0.000000e+00, %update_weights_loop2 ], [ %add36, %for.inc37 ], !id !415, !id.515 !415
  %exitcond73 = icmp ne i64 %indvars.iv71, 64, !id !416, !id.518 !416
  br i1 %exitcond73, label %for.body24, label %for.end39, !id !417, !id.519 !417

for.body24:                                       ; preds = %for.cond22
  %arrayidx26 = getelementptr inbounds double, double* %d_biases1, i64 %indvars.iv71, !id !418, !id.520 !418
  %12 = load double, double* %arrayidx26, align 8, !id !419, !id.521 !419
  %mul27 = fmul double %12, 1.000000e-02, !id !420, !id.522 !420
  %arrayidx29 = getelementptr inbounds double, double* %biases1, i64 %indvars.iv71, !id !421, !id.523 !421
  %13 = load double, double* %arrayidx29, align 8, !id !422, !id.524 !422
  %sub30 = fsub double %13, %mul27, !id !423, !id.525 !423
  store double %sub30, double* %arrayidx29, align 8, !id !424, !id.526 !424
  %arrayidx32 = getelementptr inbounds double, double* %biases1, i64 %indvars.iv71, !id !425, !id.527 !425
  %14 = load double, double* %arrayidx32, align 8, !id !426, !id.528 !426
  %arrayidx34 = getelementptr inbounds double, double* %biases1, i64 %indvars.iv71, !id !427, !id.529 !427
  %15 = load double, double* %arrayidx34, align 8, !id !428, !id.530 !428
  %mul35 = fmul double %14, %15, !id !429, !id.531 !429
  %add36 = fadd double %bias_norm.0, %mul35, !id !430, !id.532 !430
  br label %for.inc37, !id !431, !id.534 !431

for.inc37:                                        ; preds = %for.body24
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1, !id !432, !id.535 !432
  br label %for.cond22, !llvm.loop !433, !id !434, !id.537 !434

for.end39:                                        ; preds = %for.cond22
  %bias_norm.0.lcssa = phi double [ %bias_norm.0, %for.cond22 ], !id !435, !id.538 !435
  %16 = call double @llvm.sqrt.f64(double %norm.0.lcssa), !id !436, !id.539 !436
  %17 = call double @llvm.sqrt.f64(double %bias_norm.0.lcssa), !id !437, !id.541 !437
  br label %update_weights_loop3, !id !438, !id.543 !438

update_weights_loop3:                             ; preds = %for.end39
  br label %for.cond40, !id !439, !id.545 !439

for.cond40:                                       ; preds = %for.inc57, %update_weights_loop3
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc57 ], [ 0, %update_weights_loop3 ], !id !440, !id.546 !440
  %exitcond70 = icmp ne i64 %indvars.iv66, 13, !id !441, !id.548 !441
  br i1 %exitcond70, label %for.body42, label %for.end59, !id !442, !id.549 !442

for.body42:                                       ; preds = %for.cond40
  br label %update_weights_loop3_1, !id !443, !id.550 !443

update_weights_loop3_1:                           ; preds = %for.body42
  br label %for.cond43, !id !444, !id.552 !444

for.cond43:                                       ; preds = %for.inc54, %update_weights_loop3_1
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.inc54 ], [ 0, %update_weights_loop3_1 ], !id !445, !id.553 !445
  %exitcond65 = icmp ne i64 %indvars.iv61, 64, !id !446, !id.555 !446
  br i1 %exitcond65, label %for.body45, label %for.end56, !id !447, !id.556 !447

for.body45:                                       ; preds = %for.cond43
  %18 = mul nuw nsw i64 %indvars.iv66, 64, !id !448, !id.557 !448
  %19 = add nuw nsw i64 %18, %indvars.iv61, !id !449, !id.558 !449
  %arrayidx49 = getelementptr inbounds double, double* %weights1, i64 %19, !id !450, !id.559 !450
  %20 = load double, double* %arrayidx49, align 8, !id !451, !id.560 !451
  %div = fdiv double %20, %16, !id !452, !id.561 !452
  %21 = mul nuw nsw i64 %indvars.iv66, 64, !id !453, !id.562 !453
  %22 = add nuw nsw i64 %21, %indvars.iv61, !id !454, !id.563 !454
  %arrayidx53 = getelementptr inbounds double, double* %weights1, i64 %22, !id !455, !id.564 !455
  store double %div, double* %arrayidx53, align 8, !id !456, !id.565 !456
  br label %for.inc54, !id !457, !id.566 !457

for.inc54:                                        ; preds = %for.body45
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1, !id !458, !id.567 !458
  br label %for.cond43, !llvm.loop !459, !id !460, !id.569 !460

for.end56:                                        ; preds = %for.cond43
  br label %for.inc57, !id !461, !id.570 !461

for.inc57:                                        ; preds = %for.end56
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1, !id !462, !id.571 !462
  br label %for.cond40, !llvm.loop !463, !id !464, !id.573 !464

for.end59:                                        ; preds = %for.cond40
  br label %update_weights_loop4, !id !465, !id.574 !465

update_weights_loop4:                             ; preds = %for.end59
  br label %for.cond60, !id !466, !id.576 !466

for.cond60:                                       ; preds = %for.inc68, %update_weights_loop4
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc68 ], [ 0, %update_weights_loop4 ], !id !467, !id.577 !467
  %exitcond60 = icmp ne i64 %indvars.iv58, 64, !id !468, !id.579 !468
  br i1 %exitcond60, label %for.body62, label %for.end70, !id !469, !id.580 !469

for.body62:                                       ; preds = %for.cond60
  %arrayidx64 = getelementptr inbounds double, double* %biases1, i64 %indvars.iv58, !id !470, !id.581 !470
  %23 = load double, double* %arrayidx64, align 8, !id !471, !id.582 !471
  %div65 = fdiv double %23, %17, !id !472, !id.583 !472
  %arrayidx67 = getelementptr inbounds double, double* %biases1, i64 %indvars.iv58, !id !473, !id.584 !473
  store double %div65, double* %arrayidx67, align 8, !id !474, !id.585 !474
  br label %for.inc68, !id !475, !id.586 !475

for.inc68:                                        ; preds = %for.body62
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1, !id !476, !id.587 !476
  br label %for.cond60, !llvm.loop !477, !id !478, !id.589 !478

for.end70:                                        ; preds = %for.cond60
  br label %update_weights_loop5, !id !479, !id.592 !479

update_weights_loop5:                             ; preds = %for.end70
  br label %for.cond71, !id !480, !id.594 !480

for.cond71:                                       ; preds = %for.inc100, %update_weights_loop5
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.inc100 ], [ 0, %update_weights_loop5 ], !id !481, !id.595 !481
  %norm.2 = phi double [ 0.000000e+00, %update_weights_loop5 ], [ %norm.3.lcssa, %for.inc100 ], !id !482, !id.596 !482
  %exitcond57 = icmp ne i64 %indvars.iv51, 64, !id !483, !id.599 !483
  br i1 %exitcond57, label %for.body73, label %for.end102, !id !484, !id.600 !484

for.body73:                                       ; preds = %for.cond71
  br label %update_weights_loop5_1, !id !485, !id.601 !485

update_weights_loop5_1:                           ; preds = %for.body73
  br label %for.cond74, !id !486, !id.603 !486

for.cond74:                                       ; preds = %for.inc97, %update_weights_loop5_1
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.inc97 ], [ 0, %update_weights_loop5_1 ], !id !487, !id.604 !487
  %norm.3 = phi double [ %norm.2, %update_weights_loop5_1 ], [ %add96, %for.inc97 ], !id !488, !id.605 !488
  %exitcond50 = icmp ne i64 %indvars.iv44, 64, !id !489, !id.608 !489
  br i1 %exitcond50, label %for.body76, label %for.end99, !id !490, !id.609 !490

for.body76:                                       ; preds = %for.cond74
  %24 = mul nuw nsw i64 %indvars.iv51, 64, !id !491, !id.610 !491
  %25 = add nuw nsw i64 %24, %indvars.iv44, !id !492, !id.611 !492
  %arrayidx80 = getelementptr inbounds double, double* %d_weights2, i64 %25, !id !493, !id.612 !493
  %26 = load double, double* %arrayidx80, align 8, !id !494, !id.613 !494
  %mul81 = fmul double %26, 1.000000e-02, !id !495, !id.614 !495
  %27 = mul nuw nsw i64 %indvars.iv51, 64, !id !496, !id.615 !496
  %28 = add nuw nsw i64 %27, %indvars.iv44, !id !497, !id.616 !497
  %arrayidx85 = getelementptr inbounds double, double* %weights2, i64 %28, !id !498, !id.617 !498
  %29 = load double, double* %arrayidx85, align 8, !id !499, !id.618 !499
  %sub86 = fsub double %29, %mul81, !id !500, !id.619 !500
  store double %sub86, double* %arrayidx85, align 8, !id !501, !id.620 !501
  %30 = mul nuw nsw i64 %indvars.iv51, 64, !id !502, !id.621 !502
  %31 = add nuw nsw i64 %30, %indvars.iv44, !id !503, !id.622 !503
  %arrayidx90 = getelementptr inbounds double, double* %weights2, i64 %31, !id !504, !id.623 !504
  %32 = load double, double* %arrayidx90, align 8, !id !505, !id.624 !505
  %33 = mul nuw nsw i64 %indvars.iv51, 64, !id !506, !id.625 !506
  %34 = add nuw nsw i64 %33, %indvars.iv44, !id !507, !id.626 !507
  %arrayidx94 = getelementptr inbounds double, double* %weights2, i64 %34, !id !508, !id.627 !508
  %35 = load double, double* %arrayidx94, align 8, !id !509, !id.628 !509
  %mul95 = fmul double %32, %35, !id !510, !id.629 !510
  %add96 = fadd double %norm.3, %mul95, !id !511, !id.630 !511
  br label %for.inc97, !id !512, !id.632 !512

for.inc97:                                        ; preds = %for.body76
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1, !id !513, !id.633 !513
  br label %for.cond74, !llvm.loop !514, !id !515, !id.635 !515

for.end99:                                        ; preds = %for.cond74
  %norm.3.lcssa = phi double [ %norm.3, %for.cond74 ], !id !516, !id.636 !516
  br label %for.inc100, !id !517, !id.637 !517

for.inc100:                                       ; preds = %for.end99
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1, !id !518, !id.638 !518
  br label %for.cond71, !llvm.loop !519, !id !520, !id.640 !520

for.end102:                                       ; preds = %for.cond71
  %norm.2.lcssa = phi double [ %norm.2, %for.cond71 ], !id !521, !id.641 !521
  br label %update_weights_loop6, !id !522, !id.642 !522

update_weights_loop6:                             ; preds = %for.end102
  br label %for.cond103, !id !523, !id.644 !523

for.cond103:                                      ; preds = %for.inc118, %update_weights_loop6
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.inc118 ], [ 0, %update_weights_loop6 ], !id !524, !id.645 !524
  %bias_norm.1 = phi double [ 0.000000e+00, %update_weights_loop6 ], [ %add117, %for.inc118 ], !id !525, !id.646 !525
  %exitcond43 = icmp ne i64 %indvars.iv41, 64, !id !526, !id.649 !526
  br i1 %exitcond43, label %for.body105, label %for.end120, !id !527, !id.650 !527

for.body105:                                      ; preds = %for.cond103
  %arrayidx107 = getelementptr inbounds double, double* %d_biases2, i64 %indvars.iv41, !id !528, !id.651 !528
  %36 = load double, double* %arrayidx107, align 8, !id !529, !id.652 !529
  %mul108 = fmul double %36, 1.000000e-02, !id !530, !id.653 !530
  %arrayidx110 = getelementptr inbounds double, double* %biases2, i64 %indvars.iv41, !id !531, !id.654 !531
  %37 = load double, double* %arrayidx110, align 8, !id !532, !id.655 !532
  %sub111 = fsub double %37, %mul108, !id !533, !id.656 !533
  store double %sub111, double* %arrayidx110, align 8, !id !534, !id.657 !534
  %arrayidx113 = getelementptr inbounds double, double* %biases2, i64 %indvars.iv41, !id !535, !id.658 !535
  %38 = load double, double* %arrayidx113, align 8, !id !536, !id.659 !536
  %arrayidx115 = getelementptr inbounds double, double* %biases2, i64 %indvars.iv41, !id !537, !id.660 !537
  %39 = load double, double* %arrayidx115, align 8, !id !538, !id.661 !538
  %mul116 = fmul double %38, %39, !id !539, !id.662 !539
  %add117 = fadd double %bias_norm.1, %mul116, !id !540, !id.663 !540
  br label %for.inc118, !id !541, !id.665 !541

for.inc118:                                       ; preds = %for.body105
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1, !id !542, !id.666 !542
  br label %for.cond103, !llvm.loop !543, !id !544, !id.668 !544

for.end120:                                       ; preds = %for.cond103
  %bias_norm.1.lcssa = phi double [ %bias_norm.1, %for.cond103 ], !id !545, !id.669 !545
  %40 = call double @llvm.sqrt.f64(double %norm.2.lcssa), !id !546, !id.670 !546
  %41 = call double @llvm.sqrt.f64(double %bias_norm.1.lcssa), !id !547, !id.672 !547
  br label %update_weights_loop7, !id !548, !id.674 !548

update_weights_loop7:                             ; preds = %for.end120
  br label %for.cond121, !id !549, !id.676 !549

for.cond121:                                      ; preds = %for.inc139, %update_weights_loop7
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.inc139 ], [ 0, %update_weights_loop7 ], !id !550, !id.677 !550
  %exitcond40 = icmp ne i64 %indvars.iv36, 64, !id !551, !id.679 !551
  br i1 %exitcond40, label %for.body123, label %for.end141, !id !552, !id.680 !552

for.body123:                                      ; preds = %for.cond121
  br label %update_weights_loop7_1, !id !553, !id.681 !553

update_weights_loop7_1:                           ; preds = %for.body123
  br label %for.cond124, !id !554, !id.683 !554

for.cond124:                                      ; preds = %for.inc136, %update_weights_loop7_1
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.inc136 ], [ 0, %update_weights_loop7_1 ], !id !555, !id.684 !555
  %exitcond35 = icmp ne i64 %indvars.iv31, 64, !id !556, !id.686 !556
  br i1 %exitcond35, label %for.body126, label %for.end138, !id !557, !id.687 !557

for.body126:                                      ; preds = %for.cond124
  %42 = mul nuw nsw i64 %indvars.iv36, 64, !id !558, !id.688 !558
  %43 = add nuw nsw i64 %42, %indvars.iv31, !id !559, !id.689 !559
  %arrayidx130 = getelementptr inbounds double, double* %weights2, i64 %43, !id !560, !id.690 !560
  %44 = load double, double* %arrayidx130, align 8, !id !561, !id.691 !561
  %div131 = fdiv double %44, %40, !id !562, !id.692 !562
  %45 = mul nuw nsw i64 %indvars.iv36, 64, !id !563, !id.693 !563
  %46 = add nuw nsw i64 %45, %indvars.iv31, !id !564, !id.694 !564
  %arrayidx135 = getelementptr inbounds double, double* %weights2, i64 %46, !id !565, !id.695 !565
  store double %div131, double* %arrayidx135, align 8, !id !566, !id.696 !566
  br label %for.inc136, !id !567, !id.697 !567

for.inc136:                                       ; preds = %for.body126
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1, !id !568, !id.698 !568
  br label %for.cond124, !llvm.loop !569, !id !570, !id.700 !570

for.end138:                                       ; preds = %for.cond124
  br label %for.inc139, !id !571, !id.701 !571

for.inc139:                                       ; preds = %for.end138
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1, !id !572, !id.702 !572
  br label %for.cond121, !llvm.loop !573, !id !574, !id.704 !574

for.end141:                                       ; preds = %for.cond121
  br label %update_weights_loop8, !id !575, !id.705 !575

update_weights_loop8:                             ; preds = %for.end141
  br label %for.cond142, !id !576, !id.707 !576

for.cond142:                                      ; preds = %for.inc150, %update_weights_loop8
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %for.inc150 ], [ 0, %update_weights_loop8 ], !id !577, !id.708 !577
  %exitcond30 = icmp ne i64 %indvars.iv28, 64, !id !578, !id.710 !578
  br i1 %exitcond30, label %for.body144, label %for.end152, !id !579, !id.711 !579

for.body144:                                      ; preds = %for.cond142
  %arrayidx146 = getelementptr inbounds double, double* %biases2, i64 %indvars.iv28, !id !580, !id.712 !580
  %47 = load double, double* %arrayidx146, align 8, !id !581, !id.713 !581
  %div147 = fdiv double %47, %41, !id !582, !id.714 !582
  %arrayidx149 = getelementptr inbounds double, double* %biases2, i64 %indvars.iv28, !id !583, !id.715 !583
  store double %div147, double* %arrayidx149, align 8, !id !584, !id.716 !584
  br label %for.inc150, !id !585, !id.717 !585

for.inc150:                                       ; preds = %for.body144
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1, !id !586, !id.718 !586
  br label %for.cond142, !llvm.loop !587, !id !588, !id.720 !588

for.end152:                                       ; preds = %for.cond142
  br label %update_weights_loop9, !id !589, !id.723 !589

update_weights_loop9:                             ; preds = %for.end152
  br label %for.cond153, !id !590, !id.725 !590

for.cond153:                                      ; preds = %for.inc182, %update_weights_loop9
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %for.inc182 ], [ 0, %update_weights_loop9 ], !id !591, !id.726 !591
  %norm.4 = phi double [ 0.000000e+00, %update_weights_loop9 ], [ %norm.5.lcssa, %for.inc182 ], !id !592, !id.727 !592
  %exitcond27 = icmp ne i64 %indvars.iv21, 64, !id !593, !id.730 !593
  br i1 %exitcond27, label %for.body155, label %for.end184, !id !594, !id.731 !594

for.body155:                                      ; preds = %for.cond153
  br label %update_weights_loop9_1, !id !595, !id.732 !595

update_weights_loop9_1:                           ; preds = %for.body155
  br label %for.cond156, !id !596, !id.734 !596

for.cond156:                                      ; preds = %for.inc179, %update_weights_loop9_1
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.inc179 ], [ 0, %update_weights_loop9_1 ], !id !597, !id.735 !597
  %norm.5 = phi double [ %norm.4, %update_weights_loop9_1 ], [ %add178, %for.inc179 ], !id !598, !id.736 !598
  %exitcond20 = icmp ne i64 %indvars.iv14, 3, !id !599, !id.739 !599
  br i1 %exitcond20, label %for.body158, label %for.end181, !id !600, !id.740 !600

for.body158:                                      ; preds = %for.cond156
  %48 = mul nuw nsw i64 %indvars.iv21, 3, !id !601, !id.741 !601
  %49 = add nuw nsw i64 %48, %indvars.iv14, !id !602, !id.742 !602
  %arrayidx162 = getelementptr inbounds double, double* %d_weights3, i64 %49, !id !603, !id.743 !603
  %50 = load double, double* %arrayidx162, align 8, !id !604, !id.744 !604
  %mul163 = fmul double %50, 1.000000e-02, !id !605, !id.745 !605
  %51 = mul nuw nsw i64 %indvars.iv21, 3, !id !606, !id.746 !606
  %52 = add nuw nsw i64 %51, %indvars.iv14, !id !607, !id.747 !607
  %arrayidx167 = getelementptr inbounds double, double* %weights3, i64 %52, !id !608, !id.748 !608
  %53 = load double, double* %arrayidx167, align 8, !id !609, !id.749 !609
  %sub168 = fsub double %53, %mul163, !id !610, !id.750 !610
  store double %sub168, double* %arrayidx167, align 8, !id !611, !id.751 !611
  %54 = mul nuw nsw i64 %indvars.iv21, 3, !id !612, !id.752 !612
  %55 = add nuw nsw i64 %54, %indvars.iv14, !id !613, !id.753 !613
  %arrayidx172 = getelementptr inbounds double, double* %weights3, i64 %55, !id !614, !id.754 !614
  %56 = load double, double* %arrayidx172, align 8, !id !615, !id.755 !615
  %57 = mul nuw nsw i64 %indvars.iv21, 3, !id !616, !id.756 !616
  %58 = add nuw nsw i64 %57, %indvars.iv14, !id !617, !id.757 !617
  %arrayidx176 = getelementptr inbounds double, double* %weights3, i64 %58, !id !618, !id.758 !618
  %59 = load double, double* %arrayidx176, align 8, !id !619, !id.759 !619
  %mul177 = fmul double %56, %59, !id !620, !id.760 !620
  %add178 = fadd double %norm.5, %mul177, !id !621, !id.761 !621
  br label %for.inc179, !id !622, !id.763 !622

for.inc179:                                       ; preds = %for.body158
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1, !id !623, !id.764 !623
  br label %for.cond156, !llvm.loop !624, !id !625, !id.766 !625

for.end181:                                       ; preds = %for.cond156
  %norm.5.lcssa = phi double [ %norm.5, %for.cond156 ], !id !626, !id.767 !626
  br label %for.inc182, !id !627, !id.768 !627

for.inc182:                                       ; preds = %for.end181
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1, !id !628, !id.769 !628
  br label %for.cond153, !llvm.loop !629, !id !630, !id.771 !630

for.end184:                                       ; preds = %for.cond153
  %norm.4.lcssa = phi double [ %norm.4, %for.cond153 ], !id !631, !id.772 !631
  br label %update_weights_loop10, !id !632, !id.773 !632

update_weights_loop10:                            ; preds = %for.end184
  br label %for.cond185, !id !633, !id.775 !633

for.cond185:                                      ; preds = %for.inc200, %update_weights_loop10
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %for.inc200 ], [ 0, %update_weights_loop10 ], !id !634, !id.776 !634
  %bias_norm.2 = phi double [ 0.000000e+00, %update_weights_loop10 ], [ %add199, %for.inc200 ], !id !635, !id.777 !635
  %exitcond13 = icmp ne i64 %indvars.iv11, 3, !id !636, !id.780 !636
  br i1 %exitcond13, label %for.body187, label %for.end202, !id !637, !id.781 !637

for.body187:                                      ; preds = %for.cond185
  %arrayidx189 = getelementptr inbounds double, double* %d_biases3, i64 %indvars.iv11, !id !638, !id.782 !638
  %60 = load double, double* %arrayidx189, align 8, !id !639, !id.783 !639
  %mul190 = fmul double %60, 1.000000e-02, !id !640, !id.784 !640
  %arrayidx192 = getelementptr inbounds double, double* %biases3, i64 %indvars.iv11, !id !641, !id.785 !641
  %61 = load double, double* %arrayidx192, align 8, !id !642, !id.786 !642
  %sub193 = fsub double %61, %mul190, !id !643, !id.787 !643
  store double %sub193, double* %arrayidx192, align 8, !id !644, !id.788 !644
  %arrayidx195 = getelementptr inbounds double, double* %biases3, i64 %indvars.iv11, !id !645, !id.789 !645
  %62 = load double, double* %arrayidx195, align 8, !id !646, !id.790 !646
  %arrayidx197 = getelementptr inbounds double, double* %biases3, i64 %indvars.iv11, !id !647, !id.791 !647
  %63 = load double, double* %arrayidx197, align 8, !id !648, !id.792 !648
  %mul198 = fmul double %62, %63, !id !649, !id.793 !649
  %add199 = fadd double %bias_norm.2, %mul198, !id !650, !id.794 !650
  br label %for.inc200, !id !651, !id.796 !651

for.inc200:                                       ; preds = %for.body187
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !id !652, !id.797 !652
  br label %for.cond185, !llvm.loop !653, !id !654, !id.799 !654

for.end202:                                       ; preds = %for.cond185
  %bias_norm.2.lcssa = phi double [ %bias_norm.2, %for.cond185 ], !id !655, !id.800 !655
  %64 = call double @llvm.sqrt.f64(double %norm.4.lcssa), !id !656, !id.801 !656
  %65 = call double @llvm.sqrt.f64(double %bias_norm.2.lcssa), !id !657, !id.803 !657
  br label %update_weights_loop11, !id !658, !id.805 !658

update_weights_loop11:                            ; preds = %for.end202
  br label %for.cond203, !id !659, !id.807 !659

for.cond203:                                      ; preds = %for.inc221, %update_weights_loop11
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %for.inc221 ], [ 0, %update_weights_loop11 ], !id !660, !id.808 !660
  %exitcond10 = icmp ne i64 %indvars.iv6, 64, !id !661, !id.810 !661
  br i1 %exitcond10, label %for.body205, label %for.end223, !id !662, !id.811 !662

for.body205:                                      ; preds = %for.cond203
  br label %update_weights_loop11_1, !id !663, !id.812 !663

update_weights_loop11_1:                          ; preds = %for.body205
  br label %for.cond206, !id !664, !id.814 !664

for.cond206:                                      ; preds = %for.inc218, %update_weights_loop11_1
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc218 ], [ 0, %update_weights_loop11_1 ], !id !665, !id.815 !665
  %exitcond5 = icmp ne i64 %indvars.iv1, 3, !id !666, !id.817 !666
  br i1 %exitcond5, label %for.body208, label %for.end220, !id !667, !id.818 !667

for.body208:                                      ; preds = %for.cond206
  %66 = mul nuw nsw i64 %indvars.iv6, 3, !id !668, !id.819 !668
  %67 = add nuw nsw i64 %66, %indvars.iv1, !id !669, !id.820 !669
  %arrayidx212 = getelementptr inbounds double, double* %weights3, i64 %67, !id !670, !id.821 !670
  %68 = load double, double* %arrayidx212, align 8, !id !671, !id.822 !671
  %div213 = fdiv double %68, %64, !id !672, !id.823 !672
  %69 = mul nuw nsw i64 %indvars.iv6, 3, !id !673, !id.824 !673
  %70 = add nuw nsw i64 %69, %indvars.iv1, !id !674, !id.825 !674
  %arrayidx217 = getelementptr inbounds double, double* %weights3, i64 %70, !id !675, !id.826 !675
  store double %div213, double* %arrayidx217, align 8, !id !676, !id.827 !676
  br label %for.inc218, !id !677, !id.828 !677

for.inc218:                                       ; preds = %for.body208
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1, !id !678, !id.829 !678
  br label %for.cond206, !llvm.loop !679, !id !680, !id.831 !680

for.end220:                                       ; preds = %for.cond206
  br label %for.inc221, !id !681, !id.832 !681

for.inc221:                                       ; preds = %for.end220
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1, !id !682, !id.833 !682
  br label %for.cond203, !llvm.loop !683, !id !684, !id.835 !684

for.end223:                                       ; preds = %for.cond203
  br label %update_weights_loop12, !id !685, !id.836 !685

update_weights_loop12:                            ; preds = %for.end223
  br label %for.cond224, !id !686, !id.838 !686

for.cond224:                                      ; preds = %for.inc232, %update_weights_loop12
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc232 ], [ 0, %update_weights_loop12 ], !id !687, !id.839 !687
  %exitcond = icmp ne i64 %indvars.iv, 3, !id !688, !id.841 !688
  br i1 %exitcond, label %for.body226, label %for.end234, !id !689, !id.842 !689

for.body226:                                      ; preds = %for.cond224
  %arrayidx228 = getelementptr inbounds double, double* %biases3, i64 %indvars.iv, !id !690, !id.843 !690
  %71 = load double, double* %arrayidx228, align 8, !id !691, !id.844 !691
  %div229 = fdiv double %71, %65, !id !692, !id.845 !692
  %arrayidx231 = getelementptr inbounds double, double* %biases3, i64 %indvars.iv, !id !693, !id.846 !693
  store double %div229, double* %arrayidx231, align 8, !id !694, !id.847 !694
  br label %for.inc232, !id !695, !id.848 !695

for.inc232:                                       ; preds = %for.body226
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !696, !id.849 !696
  br label %for.cond224, !llvm.loop !697, !id !698, !id.851 !698

for.end234:                                       ; preds = %for.cond224
  ret void, !id !699, !id.852 !699
}

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.sqrt.f64(double) #1

; Function Attrs: nounwind
define void @backprop(double* "fpga.decayed.dim.hint"="832" %weights1, double* "fpga.decayed.dim.hint"="4096" %weights2, double* "fpga.decayed.dim.hint"="192" %weights3, double* "fpga.decayed.dim.hint"="64" %biases1, double* "fpga.decayed.dim.hint"="64" %biases2, double* "fpga.decayed.dim.hint"="3" %biases3, double* "fpga.decayed.dim.hint"="2119" %training_data, double* "fpga.decayed.dim.hint"="489" %training_targets) #4 !fpga.function.pragma !700 !id !43 {
entry:
  %activations1 = alloca [64 x double], align 8, !id !702, !id.853 !702
  %activations2 = alloca [64 x double], align 8, !id !703, !id.854 !703
  %activations3 = alloca [3 x double], align 8, !id !704, !id.855 !704
  %dactivations1 = alloca [64 x double], align 8, !id !705, !id.856 !705
  %dactivations2 = alloca [64 x double], align 8, !id !706, !id.857 !706
  %dactivations3 = alloca [3 x double], align 8, !id !707, !id.858 !707
  %net_outputs = alloca [3 x double], align 8, !id !708, !id.859 !708
  %output_difference = alloca [3 x double], align 8, !id !709, !id.860 !709
  %delta_weights1 = alloca [832 x double], align 8, !id !710, !id.861 !710
  %delta_weights2 = alloca [4096 x double], align 8, !id !711, !id.862 !711
  %delta_weights3 = alloca [192 x double], align 8, !id !712, !id.863 !712
  %oracle_activations1 = alloca [64 x double], align 8, !id !713, !id.864 !713
  %oracle_activations2 = alloca [64 x double], align 8, !id !714, !id.865 !714
  %0 = bitcast [64 x double]* %activations1 to i8*, !id !715, !id.874 !715
  call void @llvm.lifetime.start.p0i8(i64 512, i8* %0) #5, !id !716, !id.875 !716
  %1 = bitcast [64 x double]* %activations2 to i8*, !id !717, !id.877 !717
  call void @llvm.lifetime.start.p0i8(i64 512, i8* %1) #5, !id !718, !id.878 !718
  %2 = bitcast [3 x double]* %activations3 to i8*, !id !719, !id.880 !719
  call void @llvm.lifetime.start.p0i8(i64 24, i8* %2) #5, !id !720, !id.881 !720
  %3 = bitcast [64 x double]* %dactivations1 to i8*, !id !721, !id.883 !721
  call void @llvm.lifetime.start.p0i8(i64 512, i8* %3) #5, !id !722, !id.884 !722
  %4 = bitcast [64 x double]* %dactivations2 to i8*, !id !723, !id.886 !723
  call void @llvm.lifetime.start.p0i8(i64 512, i8* %4) #5, !id !724, !id.887 !724
  %5 = bitcast [3 x double]* %dactivations3 to i8*, !id !725, !id.889 !725
  call void @llvm.lifetime.start.p0i8(i64 24, i8* %5) #5, !id !726, !id.890 !726
  %6 = bitcast [3 x double]* %net_outputs to i8*, !id !727, !id.892 !727
  call void @llvm.lifetime.start.p0i8(i64 24, i8* %6) #5, !id !728, !id.893 !728
  %7 = bitcast [3 x double]* %output_difference to i8*, !id !729, !id.895 !729
  call void @llvm.lifetime.start.p0i8(i64 24, i8* %7) #5, !id !730, !id.896 !730
  %8 = bitcast [832 x double]* %delta_weights1 to i8*, !id !731, !id.898 !731
  call void @llvm.lifetime.start.p0i8(i64 6656, i8* %8) #5, !id !732, !id.899 !732
  %9 = bitcast [4096 x double]* %delta_weights2 to i8*, !id !733, !id.901 !733
  call void @llvm.lifetime.start.p0i8(i64 32768, i8* %9) #5, !id !734, !id.902 !734
  %10 = bitcast [192 x double]* %delta_weights3 to i8*, !id !735, !id.904 !735
  call void @llvm.lifetime.start.p0i8(i64 1536, i8* %10) #5, !id !736, !id.905 !736
  %11 = bitcast [64 x double]* %oracle_activations1 to i8*, !id !737, !id.907 !737
  call void @llvm.lifetime.start.p0i8(i64 512, i8* %11) #5, !id !738, !id.908 !738
  %12 = bitcast [64 x double]* %oracle_activations2 to i8*, !id !739, !id.910 !739
  call void @llvm.lifetime.start.p0i8(i64 512, i8* %12) #5, !id !740, !id.911 !740
  br label %backprop_loop1, !id !741, !id.913 !741

backprop_loop1:                                   ; preds = %entry
  br label %for.cond, !id !742, !id.915 !742

for.cond:                                         ; preds = %for.inc52, %backprop_loop1
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc52 ], [ 0, %backprop_loop1 ], !id !743, !id.916 !743
  %exitcond6 = icmp ne i64 %indvars.iv1, 163, !id !744, !id.918 !744
  br i1 %exitcond6, label %for.body, label %for.end54, !id !745, !id.919 !745

for.body:                                         ; preds = %for.cond
  br label %backprop_loop1_1, !id !746, !id.920 !746

backprop_loop1_1:                                 ; preds = %for.body
  br label %for.cond1, !id !747, !id.922 !747

for.cond1:                                        ; preds = %for.inc, %backprop_loop1_1
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %backprop_loop1_1 ], !id !748, !id.923 !748
  %exitcond = icmp ne i64 %indvars.iv, 64, !id !749, !id.925 !749
  br i1 %exitcond, label %for.body3, label %for.end, !id !750, !id.926 !750

for.body3:                                        ; preds = %for.cond1
  %arrayidx = getelementptr inbounds [64 x double], [64 x double]* %activations1, i64 0, i64 %indvars.iv, !id !751, !id.927 !751
  store double 0.000000e+00, double* %arrayidx, align 8, !id !752, !id.928 !752
  %arrayidx5 = getelementptr inbounds [64 x double], [64 x double]* %activations2, i64 0, i64 %indvars.iv, !id !753, !id.929 !753
  store double 0.000000e+00, double* %arrayidx5, align 8, !id !754, !id.930 !754
  %cmp6 = icmp slt i64 %indvars.iv, 3, !id !755, !id.931 !755
  br i1 %cmp6, label %if.then, label %if.end, !id !756, !id.932 !756

if.then:                                          ; preds = %for.body3
  %arrayidx8 = getelementptr inbounds [3 x double], [3 x double]* %activations3, i64 0, i64 %indvars.iv, !id !757, !id.933 !757
  store double 0.000000e+00, double* %arrayidx8, align 8, !id !758, !id.934 !758
  br label %if.end, !id !759, !id.935 !759

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc, !id !760, !id.936 !760

for.inc:                                          ; preds = %if.end
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !761, !id.937 !761
  br label %for.cond1, !llvm.loop !762, !id !763, !id.939 !763

for.end:                                          ; preds = %for.cond1
  %arraydecay = getelementptr inbounds [64 x double], [64 x double]* %activations1, i32 0, i32 0, !id !764, !id.940 !764
  %13 = mul nuw nsw i64 %indvars.iv1, 13, !id !765, !id.941 !765
  %arrayidx10 = getelementptr inbounds double, double* %training_data, i64 %13, !id !766, !id.942 !766
  call void @matrix_vector_product_with_bias_input_layer(double* %biases1, double* %weights1, double* %arraydecay, double* %arrayidx10), !id !767, !id.943 !767
  %arraydecay11 = getelementptr inbounds [64 x double], [64 x double]* %activations1, i32 0, i32 0, !id !768, !id.944 !768
  %arraydecay12 = getelementptr inbounds [64 x double], [64 x double]* %dactivations1, i32 0, i32 0, !id !769, !id.945 !769
  call void @RELU(double* %arraydecay11, double* %arraydecay12, i32 64), !id !770, !id.946 !770
  %arraydecay13 = getelementptr inbounds [64 x double], [64 x double]* %activations2, i32 0, i32 0, !id !771, !id.947 !771
  %arraydecay14 = getelementptr inbounds [64 x double], [64 x double]* %activations1, i32 0, i32 0, !id !772, !id.948 !772
  call void @matrix_vector_product_with_bias_second_layer(double* %biases2, double* %weights2, double* %arraydecay13, double* %arraydecay14), !id !773, !id.949 !773
  %arraydecay15 = getelementptr inbounds [64 x double], [64 x double]* %activations2, i32 0, i32 0, !id !774, !id.950 !774
  %arraydecay16 = getelementptr inbounds [64 x double], [64 x double]* %dactivations2, i32 0, i32 0, !id !775, !id.951 !775
  call void @RELU(double* %arraydecay15, double* %arraydecay16, i32 64), !id !776, !id.952 !776
  %arraydecay17 = getelementptr inbounds [3 x double], [3 x double]* %activations3, i32 0, i32 0, !id !777, !id.953 !777
  %arraydecay18 = getelementptr inbounds [64 x double], [64 x double]* %activations2, i32 0, i32 0, !id !778, !id.954 !778
  call void @matrix_vector_product_with_bias_output_layer(double* %biases3, double* %weights3, double* %arraydecay17, double* %arraydecay18), !id !779, !id.955 !779
  %arraydecay19 = getelementptr inbounds [3 x double], [3 x double]* %activations3, i32 0, i32 0, !id !780, !id.956 !780
  %arraydecay20 = getelementptr inbounds [3 x double], [3 x double]* %dactivations3, i32 0, i32 0, !id !781, !id.957 !781
  call void @RELU(double* %arraydecay19, double* %arraydecay20, i32 3), !id !782, !id.958 !782
  %arraydecay21 = getelementptr inbounds [3 x double], [3 x double]* %net_outputs, i32 0, i32 0, !id !783, !id.959 !783
  %arraydecay22 = getelementptr inbounds [3 x double], [3 x double]* %activations3, i32 0, i32 0, !id !784, !id.960 !784
  call void @soft_max(double* %arraydecay21, double* %arraydecay22), !id !785, !id.961 !785
  %arraydecay23 = getelementptr inbounds [3 x double], [3 x double]* %net_outputs, i32 0, i32 0, !id !786, !id.962 !786
  %14 = mul nuw nsw i64 %indvars.iv1, 3, !id !787, !id.963 !787
  %arrayidx26 = getelementptr inbounds double, double* %training_targets, i64 %14, !id !788, !id.964 !788
  %arraydecay27 = getelementptr inbounds [3 x double], [3 x double]* %output_difference, i32 0, i32 0, !id !789, !id.965 !789
  %arraydecay28 = getelementptr inbounds [3 x double], [3 x double]* %dactivations3, i32 0, i32 0, !id !790, !id.966 !790
  call void @take_difference(double* %arraydecay23, double* %arrayidx26, double* %arraydecay27, double* %arraydecay28), !id !791, !id.967 !791
  %arraydecay29 = getelementptr inbounds [192 x double], [192 x double]* %delta_weights3, i32 0, i32 0, !id !792, !id.968 !792
  %arraydecay30 = getelementptr inbounds [3 x double], [3 x double]* %output_difference, i32 0, i32 0, !id !793, !id.969 !793
  %arraydecay31 = getelementptr inbounds [64 x double], [64 x double]* %activations2, i32 0, i32 0, !id !794, !id.970 !794
  call void @get_delta_matrix_weights3(double* %arraydecay29, double* %arraydecay30, double* %arraydecay31), !id !795, !id.971 !795
  %arraydecay32 = getelementptr inbounds [3 x double], [3 x double]* %output_difference, i32 0, i32 0, !id !796, !id.972 !796
  %arraydecay33 = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations2, i32 0, i32 0, !id !797, !id.973 !797
  %arraydecay34 = getelementptr inbounds [64 x double], [64 x double]* %dactivations2, i32 0, i32 0, !id !798, !id.974 !798
  call void @get_oracle_activations2(double* %weights3, double* %arraydecay32, double* %arraydecay33, double* %arraydecay34), !id !799, !id.975 !799
  %arraydecay35 = getelementptr inbounds [4096 x double], [4096 x double]* %delta_weights2, i32 0, i32 0, !id !800, !id.976 !800
  %arraydecay36 = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations2, i32 0, i32 0, !id !801, !id.977 !801
  %arraydecay37 = getelementptr inbounds [64 x double], [64 x double]* %activations1, i32 0, i32 0, !id !802, !id.978 !802
  call void @get_delta_matrix_weights2(double* %arraydecay35, double* %arraydecay36, double* %arraydecay37), !id !803, !id.979 !803
  %arraydecay38 = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations2, i32 0, i32 0, !id !804, !id.980 !804
  %arraydecay39 = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations1, i32 0, i32 0, !id !805, !id.981 !805
  %arraydecay40 = getelementptr inbounds [64 x double], [64 x double]* %dactivations1, i32 0, i32 0, !id !806, !id.982 !806
  call void @get_oracle_activations1(double* %weights2, double* %arraydecay38, double* %arraydecay39, double* %arraydecay40), !id !807, !id.983 !807
  %arraydecay41 = getelementptr inbounds [832 x double], [832 x double]* %delta_weights1, i32 0, i32 0, !id !808, !id.984 !808
  %arraydecay42 = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations1, i32 0, i32 0, !id !809, !id.985 !809
  %15 = mul nuw nsw i64 %indvars.iv1, 13, !id !810, !id.986 !810
  %arrayidx45 = getelementptr inbounds double, double* %training_data, i64 %15, !id !811, !id.987 !811
  call void @get_delta_matrix_weights1(double* %arraydecay41, double* %arraydecay42, double* %arrayidx45), !id !812, !id.988 !812
  %arraydecay46 = getelementptr inbounds [832 x double], [832 x double]* %delta_weights1, i32 0, i32 0, !id !813, !id.989 !813
  %arraydecay47 = getelementptr inbounds [4096 x double], [4096 x double]* %delta_weights2, i32 0, i32 0, !id !814, !id.990 !814
  %arraydecay48 = getelementptr inbounds [192 x double], [192 x double]* %delta_weights3, i32 0, i32 0, !id !815, !id.991 !815
  %arraydecay49 = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations1, i32 0, i32 0, !id !816, !id.992 !816
  %arraydecay50 = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations2, i32 0, i32 0, !id !817, !id.993 !817
  %arraydecay51 = getelementptr inbounds [3 x double], [3 x double]* %output_difference, i32 0, i32 0, !id !818, !id.994 !818
  call void @update_weights(double* %weights1, double* %weights2, double* %weights3, double* %arraydecay46, double* %arraydecay47, double* %arraydecay48, double* %biases1, double* %biases2, double* %biases3, double* %arraydecay49, double* %arraydecay50, double* %arraydecay51), !id !819, !id.995 !819
  br label %for.inc52, !id !820, !id.996 !820

for.inc52:                                        ; preds = %for.end
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1, !id !821, !id.997 !821
  br label %for.cond, !llvm.loop !822, !id !823, !id.999 !823

for.end54:                                        ; preds = %for.cond
  %16 = bitcast [64 x double]* %oracle_activations2 to i8*, !id !824, !id.1000 !824
  call void @llvm.lifetime.end.p0i8(i64 512, i8* %16) #5, !id !825, !id.1001 !825
  %17 = bitcast [64 x double]* %oracle_activations1 to i8*, !id !826, !id.1002 !826
  call void @llvm.lifetime.end.p0i8(i64 512, i8* %17) #5, !id !827, !id.1003 !827
  %18 = bitcast [192 x double]* %delta_weights3 to i8*, !id !828, !id.1004 !828
  call void @llvm.lifetime.end.p0i8(i64 1536, i8* %18) #5, !id !829, !id.1005 !829
  %19 = bitcast [4096 x double]* %delta_weights2 to i8*, !id !830, !id.1006 !830
  call void @llvm.lifetime.end.p0i8(i64 32768, i8* %19) #5, !id !831, !id.1007 !831
  %20 = bitcast [832 x double]* %delta_weights1 to i8*, !id !832, !id.1008 !832
  call void @llvm.lifetime.end.p0i8(i64 6656, i8* %20) #5, !id !833, !id.1009 !833
  %21 = bitcast [3 x double]* %output_difference to i8*, !id !834, !id.1010 !834
  call void @llvm.lifetime.end.p0i8(i64 24, i8* %21) #5, !id !835, !id.1011 !835
  %22 = bitcast [3 x double]* %net_outputs to i8*, !id !836, !id.1012 !836
  call void @llvm.lifetime.end.p0i8(i64 24, i8* %22) #5, !id !837, !id.1013 !837
  %23 = bitcast [3 x double]* %dactivations3 to i8*, !id !838, !id.1014 !838
  call void @llvm.lifetime.end.p0i8(i64 24, i8* %23) #5, !id !839, !id.1015 !839
  %24 = bitcast [64 x double]* %dactivations2 to i8*, !id !840, !id.1016 !840
  call void @llvm.lifetime.end.p0i8(i64 512, i8* %24) #5, !id !841, !id.1017 !841
  %25 = bitcast [64 x double]* %dactivations1 to i8*, !id !842, !id.1018 !842
  call void @llvm.lifetime.end.p0i8(i64 512, i8* %25) #5, !id !843, !id.1019 !843
  %26 = bitcast [3 x double]* %activations3 to i8*, !id !844, !id.1020 !844
  call void @llvm.lifetime.end.p0i8(i64 24, i8* %26) #5, !id !845, !id.1021 !845
  %27 = bitcast [64 x double]* %activations2 to i8*, !id !846, !id.1022 !846
  call void @llvm.lifetime.end.p0i8(i64 512, i8* %27) #5, !id !847, !id.1023 !847
  %28 = bitcast [64 x double]* %activations1 to i8*, !id !848, !id.1024 !848
  call void @llvm.lifetime.end.p0i8(i64 512, i8* %28) #5, !id !849, !id.1025 !849
  ret void, !id !850, !id.1026 !850
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.static.pipeline"="0.-1" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.static.pipeline"="0.-1" "fpga.top.func"="backprop" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{i32 1}
!5 = !{i32 4}
!6 = !{i32 6}
!7 = !{i32 7}
!8 = !{i32 8}
!9 = !{i32 11}
!10 = !{i32 12}
!11 = !{i32 13}
!12 = !{i32 14}
!13 = !{i32 15}
!14 = !{i32 16}
!15 = !{i32 17}
!16 = !{i32 19}
!17 = !{i32 20}
!18 = distinct !{!18, i32 3}
!19 = !{i32 22}
!20 = !{i32 23}
!21 = !{i32 24}
!22 = !{i32 26}
!23 = !{i32 27}
!24 = !{i32 29}
!25 = !{i32 30}
!26 = !{i32 31}
!27 = !{i32 32}
!28 = !{i32 33}
!29 = !{i32 34}
!30 = !{i32 35}
!31 = !{i32 36}
!32 = !{i32 37}
!33 = !{i32 38}
!34 = !{i32 39}
!35 = distinct !{!35, i32 2}
!36 = !{i32 41}
!37 = !{i32 42}
!38 = !{i32 46}
!39 = !{i32 48}
!40 = !{i32 49}
!41 = !{i32 50}
!42 = !{i32 52}
!43 = !{i32 53}
!44 = !{i32 54}
!45 = !{i32 55}
!46 = !{i32 56}
!47 = !{i32 57}
!48 = !{i32 58}
!49 = !{i32 59}
!50 = !{i32 60}
!51 = !{i32 61}
!52 = !{i32 62}
!53 = !{i32 63}
!54 = !{i32 64}
!55 = !{i32 65}
!56 = !{i32 66}
!57 = !{i32 67}
!58 = !{i32 68}
!59 = !{i32 69}
!60 = !{i32 70}
!61 = !{i32 71}
!62 = distinct !{!62, i32 5}
!63 = !{i32 73}
!64 = !{i32 74}
!65 = !{i32 78}
!66 = !{i32 80}
!67 = !{i32 81}
!68 = !{i32 82}
!69 = !{i32 84}
!70 = !{i32 85}
!71 = !{i32 86}
!72 = !{i32 87}
!73 = !{i32 88}
!74 = !{i32 89}
!75 = !{i32 90}
!76 = !{i32 91}
!77 = !{i32 92}
!78 = !{i32 93}
!79 = !{i32 94}
!80 = distinct !{!80, i32 7}
!81 = !{i32 96}
!82 = !{i32 97}
!83 = !{!84}
!84 = !{!"fpga.inline", !"user"}
!85 = !{i32 102}
!86 = !{i32 104}
!87 = !{i32 105}
!88 = !{i32 107}
!89 = !{i32 108}
!90 = !{i32 109}
!91 = !{i32 110}
!92 = !{i32 111}
!93 = !{i32 113}
!94 = !{i32 114}
!95 = !{i32 116}
!96 = !{i32 117}
!97 = !{i32 118}
!98 = !{i32 119}
!99 = !{i32 120}
!100 = !{i32 121}
!101 = !{i32 122}
!102 = !{i32 123}
!103 = !{i32 124}
!104 = !{i32 125}
!105 = !{i32 126}
!106 = !{i32 127}
!107 = !{i32 128}
!108 = !{i32 129}
!109 = !{i32 130}
!110 = distinct !{!110, i32 10}
!111 = !{i32 132}
!112 = !{i32 133}
!113 = !{i32 134}
!114 = distinct !{!114, i32 9}
!115 = !{i32 136}
!116 = !{i32 137}
!117 = !{i32 138}
!118 = !{i32 143}
!119 = !{i32 145}
!120 = !{i32 146}
!121 = !{i32 148}
!122 = !{i32 149}
!123 = !{i32 150}
!124 = !{i32 151}
!125 = !{i32 152}
!126 = !{i32 154}
!127 = !{i32 155}
!128 = !{i32 157}
!129 = !{i32 158}
!130 = !{i32 159}
!131 = !{i32 160}
!132 = !{i32 161}
!133 = !{i32 162}
!134 = !{i32 163}
!135 = !{i32 164}
!136 = !{i32 165}
!137 = !{i32 166}
!138 = !{i32 167}
!139 = !{i32 168}
!140 = !{i32 169}
!141 = !{i32 170}
!142 = !{i32 171}
!143 = distinct !{!143, i32 13}
!144 = !{i32 173}
!145 = !{i32 174}
!146 = !{i32 175}
!147 = distinct !{!147, i32 12}
!148 = !{i32 177}
!149 = !{i32 178}
!150 = !{i32 179}
!151 = !{i32 184}
!152 = !{i32 186}
!153 = !{i32 187}
!154 = !{i32 189}
!155 = !{i32 190}
!156 = !{i32 191}
!157 = !{i32 192}
!158 = !{i32 193}
!159 = !{i32 195}
!160 = !{i32 196}
!161 = !{i32 198}
!162 = !{i32 199}
!163 = !{i32 200}
!164 = !{i32 201}
!165 = !{i32 202}
!166 = !{i32 203}
!167 = !{i32 204}
!168 = !{i32 205}
!169 = !{i32 206}
!170 = !{i32 207}
!171 = !{i32 208}
!172 = !{i32 209}
!173 = !{i32 210}
!174 = !{i32 211}
!175 = !{i32 212}
!176 = distinct !{!176, i32 16}
!177 = !{i32 214}
!178 = !{i32 215}
!179 = !{i32 216}
!180 = distinct !{!180, i32 15}
!181 = !{i32 218}
!182 = !{i32 219}
!183 = !{i32 220}
!184 = !{i32 225}
!185 = !{i32 227}
!186 = !{i32 228}
!187 = !{i32 230}
!188 = !{i32 231}
!189 = !{i32 232}
!190 = !{i32 233}
!191 = !{i32 234}
!192 = !{i32 235}
!193 = !{i32 236}
!194 = !{i32 237}
!195 = !{i32 238}
!196 = !{i32 239}
!197 = !{i32 240}
!198 = !{i32 241}
!199 = !{i32 242}
!200 = !{i32 243}
!201 = !{i32 244}
!202 = distinct !{!202, i32 18}
!203 = !{i32 246}
!204 = !{i32 247}
!205 = !{i32 251}
!206 = !{i32 253}
!207 = !{i32 254}
!208 = !{i32 256}
!209 = !{i32 257}
!210 = !{i32 258}
!211 = !{i32 260}
!212 = !{i32 261}
!213 = !{i32 263}
!214 = !{i32 264}
!215 = !{i32 265}
!216 = !{i32 266}
!217 = !{i32 267}
!218 = !{i32 268}
!219 = !{i32 269}
!220 = !{i32 270}
!221 = !{i32 271}
!222 = !{i32 272}
!223 = !{i32 273}
!224 = !{i32 274}
!225 = !{i32 275}
!226 = distinct !{!226, i32 21}
!227 = !{i32 277}
!228 = !{i32 278}
!229 = !{i32 279}
!230 = distinct !{!230, i32 20}
!231 = !{i32 281}
!232 = !{i32 282}
!233 = !{i32 287}
!234 = !{i32 289}
!235 = !{i32 290}
!236 = !{i32 292}
!237 = !{i32 293}
!238 = !{i32 294}
!239 = !{i32 295}
!240 = !{i32 296}
!241 = !{i32 298}
!242 = !{i32 299}
!243 = !{i32 301}
!244 = !{i32 302}
!245 = !{i32 303}
!246 = !{i32 304}
!247 = !{i32 305}
!248 = !{i32 306}
!249 = !{i32 307}
!250 = !{i32 308}
!251 = !{i32 309}
!252 = !{i32 310}
!253 = !{i32 311}
!254 = !{i32 312}
!255 = !{i32 313}
!256 = !{i32 314}
!257 = !{i32 315}
!258 = distinct !{!258, i32 24}
!259 = !{i32 317}
!260 = !{i32 318}
!261 = !{i32 319}
!262 = !{i32 320}
!263 = !{i32 321}
!264 = !{i32 322}
!265 = !{i32 323}
!266 = !{i32 324}
!267 = !{i32 325}
!268 = !{i32 326}
!269 = distinct !{!269, i32 23}
!270 = !{i32 328}
!271 = !{i32 329}
!272 = !{i32 25}
!273 = !{i32 333}
!274 = !{i32 335}
!275 = !{i32 336}
!276 = !{i32 338}
!277 = !{i32 339}
!278 = !{i32 340}
!279 = !{i32 342}
!280 = !{i32 343}
!281 = !{i32 345}
!282 = !{i32 346}
!283 = !{i32 347}
!284 = !{i32 348}
!285 = !{i32 349}
!286 = !{i32 350}
!287 = !{i32 351}
!288 = !{i32 352}
!289 = !{i32 353}
!290 = !{i32 354}
!291 = !{i32 355}
!292 = !{i32 356}
!293 = !{i32 357}
!294 = distinct !{!294, i32 27}
!295 = !{i32 359}
!296 = !{i32 360}
!297 = !{i32 361}
!298 = distinct !{!298, i32 26}
!299 = !{i32 363}
!300 = !{i32 364}
!301 = !{i32 28}
!302 = !{i32 369}
!303 = !{i32 371}
!304 = !{i32 372}
!305 = !{i32 374}
!306 = !{i32 375}
!307 = !{i32 376}
!308 = !{i32 377}
!309 = !{i32 378}
!310 = !{i32 380}
!311 = !{i32 381}
!312 = !{i32 383}
!313 = !{i32 384}
!314 = !{i32 385}
!315 = !{i32 386}
!316 = !{i32 387}
!317 = !{i32 388}
!318 = !{i32 389}
!319 = !{i32 390}
!320 = !{i32 391}
!321 = !{i32 392}
!322 = !{i32 393}
!323 = !{i32 394}
!324 = !{i32 395}
!325 = !{i32 396}
!326 = !{i32 397}
!327 = distinct !{!327, i32 30}
!328 = !{i32 399}
!329 = !{i32 400}
!330 = !{i32 401}
!331 = !{i32 402}
!332 = !{i32 403}
!333 = !{i32 404}
!334 = !{i32 405}
!335 = !{i32 406}
!336 = !{i32 407}
!337 = !{i32 408}
!338 = distinct !{!338, i32 29}
!339 = !{i32 410}
!340 = !{i32 411}
!341 = !{i32 415}
!342 = !{i32 417}
!343 = !{i32 418}
!344 = !{i32 420}
!345 = !{i32 421}
!346 = !{i32 422}
!347 = !{i32 424}
!348 = !{i32 425}
!349 = !{i32 427}
!350 = !{i32 428}
!351 = !{i32 429}
!352 = !{i32 430}
!353 = !{i32 431}
!354 = !{i32 432}
!355 = !{i32 433}
!356 = !{i32 434}
!357 = !{i32 435}
!358 = !{i32 436}
!359 = !{i32 437}
!360 = !{i32 438}
!361 = !{i32 439}
!362 = distinct !{!362, i32 33}
!363 = !{i32 441}
!364 = !{i32 442}
!365 = !{i32 443}
!366 = distinct !{!366, i32 32}
!367 = !{i32 445}
!368 = !{i32 446}
!369 = !{i32 461}
!370 = !{i32 463}
!371 = !{i32 464}
!372 = !{i32 465}
!373 = !{i32 468}
!374 = !{i32 469}
!375 = !{i32 470}
!376 = !{i32 472}
!377 = !{i32 473}
!378 = !{i32 474}
!379 = !{i32 477}
!380 = !{i32 478}
!381 = !{i32 479}
!382 = !{i32 480}
!383 = !{i32 481}
!384 = !{i32 482}
!385 = !{i32 483}
!386 = !{i32 484}
!387 = !{i32 485}
!388 = !{i32 486}
!389 = !{i32 487}
!390 = !{i32 488}
!391 = !{i32 489}
!392 = !{i32 490}
!393 = !{i32 491}
!394 = !{i32 492}
!395 = !{i32 493}
!396 = !{i32 494}
!397 = !{i32 495}
!398 = !{i32 496}
!399 = !{i32 497}
!400 = !{i32 498}
!401 = !{i32 499}
!402 = !{i32 501}
!403 = !{i32 502}
!404 = distinct !{!404, i32 52}
!405 = !{i32 504}
!406 = !{i32 505}
!407 = !{i32 506}
!408 = !{i32 507}
!409 = distinct !{!409, i32 51}
!410 = !{i32 509}
!411 = !{i32 510}
!412 = !{i32 511}
!413 = !{i32 513}
!414 = !{i32 514}
!415 = !{i32 515}
!416 = !{i32 518}
!417 = !{i32 519}
!418 = !{i32 520}
!419 = !{i32 521}
!420 = !{i32 522}
!421 = !{i32 523}
!422 = !{i32 524}
!423 = !{i32 525}
!424 = !{i32 526}
!425 = !{i32 527}
!426 = !{i32 528}
!427 = !{i32 529}
!428 = !{i32 530}
!429 = !{i32 531}
!430 = !{i32 532}
!431 = !{i32 534}
!432 = !{i32 535}
!433 = distinct !{!433, i32 50}
!434 = !{i32 537}
!435 = !{i32 538}
!436 = !{i32 539}
!437 = !{i32 541}
!438 = !{i32 543}
!439 = !{i32 545}
!440 = !{i32 546}
!441 = !{i32 548}
!442 = !{i32 549}
!443 = !{i32 550}
!444 = !{i32 552}
!445 = !{i32 553}
!446 = !{i32 555}
!447 = !{i32 556}
!448 = !{i32 557}
!449 = !{i32 558}
!450 = !{i32 559}
!451 = !{i32 560}
!452 = !{i32 561}
!453 = !{i32 562}
!454 = !{i32 563}
!455 = !{i32 564}
!456 = !{i32 565}
!457 = !{i32 566}
!458 = !{i32 567}
!459 = distinct !{!459, i32 49}
!460 = !{i32 569}
!461 = !{i32 570}
!462 = !{i32 571}
!463 = distinct !{!463, i32 48}
!464 = !{i32 573}
!465 = !{i32 574}
!466 = !{i32 576}
!467 = !{i32 577}
!468 = !{i32 579}
!469 = !{i32 580}
!470 = !{i32 581}
!471 = !{i32 582}
!472 = !{i32 583}
!473 = !{i32 584}
!474 = !{i32 585}
!475 = !{i32 586}
!476 = !{i32 587}
!477 = distinct !{!477, i32 47}
!478 = !{i32 589}
!479 = !{i32 592}
!480 = !{i32 594}
!481 = !{i32 595}
!482 = !{i32 596}
!483 = !{i32 599}
!484 = !{i32 600}
!485 = !{i32 601}
!486 = !{i32 603}
!487 = !{i32 604}
!488 = !{i32 605}
!489 = !{i32 608}
!490 = !{i32 609}
!491 = !{i32 610}
!492 = !{i32 611}
!493 = !{i32 612}
!494 = !{i32 613}
!495 = !{i32 614}
!496 = !{i32 615}
!497 = !{i32 616}
!498 = !{i32 617}
!499 = !{i32 618}
!500 = !{i32 619}
!501 = !{i32 620}
!502 = !{i32 621}
!503 = !{i32 622}
!504 = !{i32 623}
!505 = !{i32 624}
!506 = !{i32 625}
!507 = !{i32 626}
!508 = !{i32 627}
!509 = !{i32 628}
!510 = !{i32 629}
!511 = !{i32 630}
!512 = !{i32 632}
!513 = !{i32 633}
!514 = distinct !{!514, i32 46}
!515 = !{i32 635}
!516 = !{i32 636}
!517 = !{i32 637}
!518 = !{i32 638}
!519 = distinct !{!519, i32 45}
!520 = !{i32 640}
!521 = !{i32 641}
!522 = !{i32 642}
!523 = !{i32 644}
!524 = !{i32 645}
!525 = !{i32 646}
!526 = !{i32 649}
!527 = !{i32 650}
!528 = !{i32 651}
!529 = !{i32 652}
!530 = !{i32 653}
!531 = !{i32 654}
!532 = !{i32 655}
!533 = !{i32 656}
!534 = !{i32 657}
!535 = !{i32 658}
!536 = !{i32 659}
!537 = !{i32 660}
!538 = !{i32 661}
!539 = !{i32 662}
!540 = !{i32 663}
!541 = !{i32 665}
!542 = !{i32 666}
!543 = distinct !{!543, i32 44}
!544 = !{i32 668}
!545 = !{i32 669}
!546 = !{i32 670}
!547 = !{i32 672}
!548 = !{i32 674}
!549 = !{i32 676}
!550 = !{i32 677}
!551 = !{i32 679}
!552 = !{i32 680}
!553 = !{i32 681}
!554 = !{i32 683}
!555 = !{i32 684}
!556 = !{i32 686}
!557 = !{i32 687}
!558 = !{i32 688}
!559 = !{i32 689}
!560 = !{i32 690}
!561 = !{i32 691}
!562 = !{i32 692}
!563 = !{i32 693}
!564 = !{i32 694}
!565 = !{i32 695}
!566 = !{i32 696}
!567 = !{i32 697}
!568 = !{i32 698}
!569 = distinct !{!569, i32 43}
!570 = !{i32 700}
!571 = !{i32 701}
!572 = !{i32 702}
!573 = distinct !{!573, i32 42}
!574 = !{i32 704}
!575 = !{i32 705}
!576 = !{i32 707}
!577 = !{i32 708}
!578 = !{i32 710}
!579 = !{i32 711}
!580 = !{i32 712}
!581 = !{i32 713}
!582 = !{i32 714}
!583 = !{i32 715}
!584 = !{i32 716}
!585 = !{i32 717}
!586 = !{i32 718}
!587 = distinct !{!587, i32 41}
!588 = !{i32 720}
!589 = !{i32 723}
!590 = !{i32 725}
!591 = !{i32 726}
!592 = !{i32 727}
!593 = !{i32 730}
!594 = !{i32 731}
!595 = !{i32 732}
!596 = !{i32 734}
!597 = !{i32 735}
!598 = !{i32 736}
!599 = !{i32 739}
!600 = !{i32 740}
!601 = !{i32 741}
!602 = !{i32 742}
!603 = !{i32 743}
!604 = !{i32 744}
!605 = !{i32 745}
!606 = !{i32 746}
!607 = !{i32 747}
!608 = !{i32 748}
!609 = !{i32 749}
!610 = !{i32 750}
!611 = !{i32 751}
!612 = !{i32 752}
!613 = !{i32 753}
!614 = !{i32 754}
!615 = !{i32 755}
!616 = !{i32 756}
!617 = !{i32 757}
!618 = !{i32 758}
!619 = !{i32 759}
!620 = !{i32 760}
!621 = !{i32 761}
!622 = !{i32 763}
!623 = !{i32 764}
!624 = distinct !{!624, i32 40}
!625 = !{i32 766}
!626 = !{i32 767}
!627 = !{i32 768}
!628 = !{i32 769}
!629 = distinct !{!629, i32 39}
!630 = !{i32 771}
!631 = !{i32 772}
!632 = !{i32 773}
!633 = !{i32 775}
!634 = !{i32 776}
!635 = !{i32 777}
!636 = !{i32 780}
!637 = !{i32 781}
!638 = !{i32 782}
!639 = !{i32 783}
!640 = !{i32 784}
!641 = !{i32 785}
!642 = !{i32 786}
!643 = !{i32 787}
!644 = !{i32 788}
!645 = !{i32 789}
!646 = !{i32 790}
!647 = !{i32 791}
!648 = !{i32 792}
!649 = !{i32 793}
!650 = !{i32 794}
!651 = !{i32 796}
!652 = !{i32 797}
!653 = distinct !{!653, i32 38}
!654 = !{i32 799}
!655 = !{i32 800}
!656 = !{i32 801}
!657 = !{i32 803}
!658 = !{i32 805}
!659 = !{i32 807}
!660 = !{i32 808}
!661 = !{i32 810}
!662 = !{i32 811}
!663 = !{i32 812}
!664 = !{i32 814}
!665 = !{i32 815}
!666 = !{i32 817}
!667 = !{i32 818}
!668 = !{i32 819}
!669 = !{i32 820}
!670 = !{i32 821}
!671 = !{i32 822}
!672 = !{i32 823}
!673 = !{i32 824}
!674 = !{i32 825}
!675 = !{i32 826}
!676 = !{i32 827}
!677 = !{i32 828}
!678 = !{i32 829}
!679 = distinct !{!679, i32 37}
!680 = !{i32 831}
!681 = !{i32 832}
!682 = !{i32 833}
!683 = distinct !{!683, i32 36}
!684 = !{i32 835}
!685 = !{i32 836}
!686 = !{i32 838}
!687 = !{i32 839}
!688 = !{i32 841}
!689 = !{i32 842}
!690 = !{i32 843}
!691 = !{i32 844}
!692 = !{i32 845}
!693 = !{i32 846}
!694 = !{i32 847}
!695 = !{i32 848}
!696 = !{i32 849}
!697 = distinct !{!697, i32 35}
!698 = !{i32 851}
!699 = !{i32 852}
!700 = !{!701}
!701 = !{!"fpga.static.pipeline", !"user"}
!702 = !{i32 853}
!703 = !{i32 854}
!704 = !{i32 855}
!705 = !{i32 856}
!706 = !{i32 857}
!707 = !{i32 858}
!708 = !{i32 859}
!709 = !{i32 860}
!710 = !{i32 861}
!711 = !{i32 862}
!712 = !{i32 863}
!713 = !{i32 864}
!714 = !{i32 865}
!715 = !{i32 874}
!716 = !{i32 875}
!717 = !{i32 877}
!718 = !{i32 878}
!719 = !{i32 880}
!720 = !{i32 881}
!721 = !{i32 883}
!722 = !{i32 884}
!723 = !{i32 886}
!724 = !{i32 887}
!725 = !{i32 889}
!726 = !{i32 890}
!727 = !{i32 892}
!728 = !{i32 893}
!729 = !{i32 895}
!730 = !{i32 896}
!731 = !{i32 898}
!732 = !{i32 899}
!733 = !{i32 901}
!734 = !{i32 902}
!735 = !{i32 904}
!736 = !{i32 905}
!737 = !{i32 907}
!738 = !{i32 908}
!739 = !{i32 910}
!740 = !{i32 911}
!741 = !{i32 913}
!742 = !{i32 915}
!743 = !{i32 916}
!744 = !{i32 918}
!745 = !{i32 919}
!746 = !{i32 920}
!747 = !{i32 922}
!748 = !{i32 923}
!749 = !{i32 925}
!750 = !{i32 926}
!751 = !{i32 927}
!752 = !{i32 928}
!753 = !{i32 929}
!754 = !{i32 930}
!755 = !{i32 931}
!756 = !{i32 932}
!757 = !{i32 933}
!758 = !{i32 934}
!759 = !{i32 935}
!760 = !{i32 936}
!761 = !{i32 937}
!762 = distinct !{!762, i32 55}
!763 = !{i32 939}
!764 = !{i32 940}
!765 = !{i32 941}
!766 = !{i32 942}
!767 = !{i32 943}
!768 = !{i32 944}
!769 = !{i32 945}
!770 = !{i32 946}
!771 = !{i32 947}
!772 = !{i32 948}
!773 = !{i32 949}
!774 = !{i32 950}
!775 = !{i32 951}
!776 = !{i32 952}
!777 = !{i32 953}
!778 = !{i32 954}
!779 = !{i32 955}
!780 = !{i32 956}
!781 = !{i32 957}
!782 = !{i32 958}
!783 = !{i32 959}
!784 = !{i32 960}
!785 = !{i32 961}
!786 = !{i32 962}
!787 = !{i32 963}
!788 = !{i32 964}
!789 = !{i32 965}
!790 = !{i32 966}
!791 = !{i32 967}
!792 = !{i32 968}
!793 = !{i32 969}
!794 = !{i32 970}
!795 = !{i32 971}
!796 = !{i32 972}
!797 = !{i32 973}
!798 = !{i32 974}
!799 = !{i32 975}
!800 = !{i32 976}
!801 = !{i32 977}
!802 = !{i32 978}
!803 = !{i32 979}
!804 = !{i32 980}
!805 = !{i32 981}
!806 = !{i32 982}
!807 = !{i32 983}
!808 = !{i32 984}
!809 = !{i32 985}
!810 = !{i32 986}
!811 = !{i32 987}
!812 = !{i32 988}
!813 = !{i32 989}
!814 = !{i32 990}
!815 = !{i32 991}
!816 = !{i32 992}
!817 = !{i32 993}
!818 = !{i32 994}
!819 = !{i32 995}
!820 = !{i32 996}
!821 = !{i32 997}
!822 = distinct !{!822, i32 54}
!823 = !{i32 999}
!824 = !{i32 1000}
!825 = !{i32 1001}
!826 = !{i32 1002}
!827 = !{i32 1003}
!828 = !{i32 1004}
!829 = !{i32 1005}
!830 = !{i32 1006}
!831 = !{i32 1007}
!832 = !{i32 1008}
!833 = !{i32 1009}
!834 = !{i32 1010}
!835 = !{i32 1011}
!836 = !{i32 1012}
!837 = !{i32 1013}
!838 = !{i32 1014}
!839 = !{i32 1015}
!840 = !{i32 1016}
!841 = !{i32 1017}
!842 = !{i32 1018}
!843 = !{i32 1019}
!844 = !{i32 1020}
!845 = !{i32 1021}
!846 = !{i32 1022}
!847 = !{i32 1023}
!848 = !{i32 1024}
!849 = !{i32 1025}
!850 = !{i32 1026}
