; ModuleID = 'data/base_solutions/BACKPROP/solution0/.autopilot/db/a.g.ld.0.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: noinline nounwind
define void @soft_max(double* "fpga.decayed.dim.hint"="3" %net_outputs, double* "fpga.decayed.dim.hint"="3" %activations) #0 !fpga.function.pragma !4 {
entry:
  %net_outputs.addr = alloca double*, align 8
  %activations.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %sum = alloca double, align 8
  store double* %net_outputs, double** %net_outputs.addr, align 8
  store double* %activations, double** %activations.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast double* %sum to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #4
  store double 0.000000e+00, double* %sum, align 8
  br label %soft_max_loop1

soft_max_loop1:                                   ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %soft_max_loop1
  %2 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %2, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load double*, double** %activations.addr, align 8
  %4 = load i32, i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds double, double* %3, i64 %idxprom
  %5 = load double, double* %arrayidx, align 8
  %sub = fsub double -0.000000e+00, %5
  %6 = call double @llvm.exp.f64(double %sub)
  %7 = load double, double* %sum, align 8
  %add = fadd double %7, %6
  store double %add, double* %sum, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !21

for.end:                                          ; preds = %for.cond
  br label %soft_max_loop2

soft_max_loop2:                                   ; preds = %for.end
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc9, %soft_max_loop2
  %9 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %9, 3
  br i1 %cmp2, label %for.body3, label %for.end11

for.body3:                                        ; preds = %for.cond1
  %10 = load double*, double** %activations.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom4 = sext i32 %11 to i64
  %arrayidx5 = getelementptr inbounds double, double* %10, i64 %idxprom4
  %12 = load double, double* %arrayidx5, align 8
  %sub6 = fsub double -0.000000e+00, %12
  %13 = call double @llvm.exp.f64(double %sub6)
  %14 = load double, double* %sum, align 8
  %div = fdiv double %13, %14
  %15 = load double*, double** %net_outputs.addr, align 8
  %16 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %16 to i64
  %arrayidx8 = getelementptr inbounds double, double* %15, i64 %idxprom7
  store double %div, double* %arrayidx8, align 8
  br label %for.inc9

for.inc9:                                         ; preds = %for.body3
  %17 = load i32, i32* %i, align 4
  %inc10 = add nsw i32 %17, 1
  store i32 %inc10, i32* %i, align 4
  br label %for.cond1, !llvm.loop !23

for.end11:                                        ; preds = %for.cond1
  %18 = bitcast double* %sum to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #4
  %19 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %19) #4
  ret void
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.exp.f64(double) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: noinline nounwind
define void @RELU(double* "fpga.decayed.dim.hint"="64" %activations, double* "fpga.decayed.dim.hint"="64" %dactivations, i32 %size) #0 !fpga.function.pragma !25 {
entry:
  %activations.addr = alloca double*, align 8
  %dactivations.addr = alloca double*, align 8
  %size.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store double* %activations, double** %activations.addr, align 8
  store double* %dactivations, double** %dactivations.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  br label %RELU_loop1

RELU_loop1:                                       ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %RELU_loop1
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %size.addr, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load double*, double** %activations.addr, align 8
  %4 = load i32, i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds double, double* %3, i64 %idxprom
  %5 = load double, double* %arrayidx, align 8
  %6 = load double*, double** %activations.addr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %7 to i64
  %arrayidx2 = getelementptr inbounds double, double* %6, i64 %idxprom1
  %8 = load double, double* %arrayidx2, align 8
  %sub = fsub double 1.000000e+00, %8
  %mul = fmul double %5, %sub
  %9 = load double*, double** %dactivations.addr, align 8
  %10 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %10 to i64
  %arrayidx4 = getelementptr inbounds double, double* %9, i64 %idxprom3
  store double %mul, double* %arrayidx4, align 8
  %11 = load double*, double** %activations.addr, align 8
  %12 = load i32, i32* %i, align 4
  %idxprom5 = sext i32 %12 to i64
  %arrayidx6 = getelementptr inbounds double, double* %11, i64 %idxprom5
  %13 = load double, double* %arrayidx6, align 8
  %sub7 = fsub double -0.000000e+00, %13
  %14 = call double @llvm.exp.f64(double %sub7)
  %add = fadd double 1.000000e+00, %14
  %div = fdiv double 1.000000e+00, %add
  %15 = load double*, double** %activations.addr, align 8
  %16 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %16 to i64
  %arrayidx9 = getelementptr inbounds double, double* %15, i64 %idxprom8
  store double %div, double* %arrayidx9, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !35

for.end:                                          ; preds = %for.cond
  %18 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #4
  ret void
}

; Function Attrs: noinline nounwind
define void @add_bias_to_activations(double* "fpga.decayed.dim.hint"="64" %biases, double* "fpga.decayed.dim.hint"="64" %activations, i32 %size) #0 !fpga.function.pragma !37 {
entry:
  %biases.addr = alloca double*, align 8
  %activations.addr = alloca double*, align 8
  %size.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store double* %biases, double** %biases.addr, align 8
  store double* %activations, double** %activations.addr, align 8
  store i32 %size, i32* %size.addr, align 4
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  br label %add_bias_to_activations_loop1

add_bias_to_activations_loop1:                    ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %add_bias_to_activations_loop1
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %size.addr, align 4
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load double*, double** %activations.addr, align 8
  %4 = load i32, i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds double, double* %3, i64 %idxprom
  %5 = load double, double* %arrayidx, align 8
  %6 = load double*, double** %biases.addr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %7 to i64
  %arrayidx2 = getelementptr inbounds double, double* %6, i64 %idxprom1
  %8 = load double, double* %arrayidx2, align 8
  %add = fadd double %5, %8
  %9 = load double*, double** %activations.addr, align 8
  %10 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %10 to i64
  %arrayidx4 = getelementptr inbounds double, double* %9, i64 %idxprom3
  store double %add, double* %arrayidx4, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  %12 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %12) #4
  ret void
}

; Function Attrs: noinline nounwind
define void @matrix_vector_product_with_bias_input_layer(double* "fpga.decayed.dim.hint"="64" %biases, double* "fpga.decayed.dim.hint"="832" %weights, double* "fpga.decayed.dim.hint"="64" %activations, double* "fpga.decayed.dim.hint"="13" %input_sample) #0 !fpga.function.pragma !46 {
entry:
  %biases.addr = alloca double*, align 8
  %weights.addr = alloca double*, align 8
  %activations.addr = alloca double*, align 8
  %input_sample.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double* %biases, double** %biases.addr, align 8
  store double* %weights, double** %weights.addr, align 8
  store double* %activations, double** %activations.addr, align 8
  store double* %input_sample, double** %input_sample.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  br label %matrix_vector_product_with_bias_input_layer_loop1

matrix_vector_product_with_bias_input_layer_loop1: ; preds = %entry
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %matrix_vector_product_with_bias_input_layer_loop1
  %2 = load i32, i32* %j, align 4
  %cmp = icmp slt i32 %2, 64
  br i1 %cmp, label %for.body, label %for.end14

for.body:                                         ; preds = %for.cond
  %3 = load double*, double** %activations.addr, align 8
  %4 = load i32, i32* %j, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds double, double* %3, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8
  br label %matrix_vector_product_with_bias_input_layer_loop1_1

matrix_vector_product_with_bias_input_layer_loop1_1: ; preds = %for.body
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %matrix_vector_product_with_bias_input_layer_loop1_1
  %5 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %5, 13
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load double*, double** %weights.addr, align 8
  %7 = load i32, i32* %j, align 4
  %mul = mul nsw i32 %7, 13
  %8 = load i32, i32* %i, align 4
  %add = add nsw i32 %mul, %8
  %idxprom4 = sext i32 %add to i64
  %arrayidx5 = getelementptr inbounds double, double* %6, i64 %idxprom4
  %9 = load double, double* %arrayidx5, align 8
  %10 = load double*, double** %input_sample.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom6 = sext i32 %11 to i64
  %arrayidx7 = getelementptr inbounds double, double* %10, i64 %idxprom6
  %12 = load double, double* %arrayidx7, align 8
  %mul8 = fmul double %9, %12
  %13 = load double*, double** %activations.addr, align 8
  %14 = load i32, i32* %j, align 4
  %idxprom9 = sext i32 %14 to i64
  %arrayidx10 = getelementptr inbounds double, double* %13, i64 %idxprom9
  %15 = load double, double* %arrayidx10, align 8
  %add11 = fadd double %15, %mul8
  store double %add11, double* %arrayidx10, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %16 = load i32, i32* %i, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1, !llvm.loop !55

for.end:                                          ; preds = %for.cond1
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %17 = load i32, i32* %j, align 4
  %inc13 = add nsw i32 %17, 1
  store i32 %inc13, i32* %j, align 4
  br label %for.cond, !llvm.loop !57

for.end14:                                        ; preds = %for.cond
  %18 = load double*, double** %biases.addr, align 8
  %19 = load double*, double** %activations.addr, align 8
  call void @add_bias_to_activations(double* %18, double* %19, i32 64)
  %20 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #4
  %21 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #4
  ret void
}

; Function Attrs: noinline nounwind
define void @matrix_vector_product_with_bias_second_layer(double* "fpga.decayed.dim.hint"="64" %biases, double* "fpga.decayed.dim.hint"="4096" %weights, double* "fpga.decayed.dim.hint"="64" %activations, double* "fpga.decayed.dim.hint"="64" %input_activations) #0 !fpga.function.pragma !59 {
entry:
  %biases.addr = alloca double*, align 8
  %weights.addr = alloca double*, align 8
  %activations.addr = alloca double*, align 8
  %input_activations.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double* %biases, double** %biases.addr, align 8
  store double* %weights, double** %weights.addr, align 8
  store double* %activations, double** %activations.addr, align 8
  store double* %input_activations, double** %input_activations.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  br label %matrix_vector_product_with_bias_second_layer_loop1

matrix_vector_product_with_bias_second_layer_loop1: ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %matrix_vector_product_with_bias_second_layer_loop1
  %2 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %2, 64
  br i1 %cmp, label %for.body, label %for.end14

for.body:                                         ; preds = %for.cond
  %3 = load double*, double** %activations.addr, align 8
  %4 = load i32, i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds double, double* %3, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8
  br label %matrix_vector_product_with_bias_second_layer_loop1_1

matrix_vector_product_with_bias_second_layer_loop1_1: ; preds = %for.body
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %matrix_vector_product_with_bias_second_layer_loop1_1
  %5 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %5, 64
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load double*, double** %weights.addr, align 8
  %7 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %7, 64
  %8 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul, %8
  %idxprom4 = sext i32 %add to i64
  %arrayidx5 = getelementptr inbounds double, double* %6, i64 %idxprom4
  %9 = load double, double* %arrayidx5, align 8
  %10 = load double*, double** %input_activations.addr, align 8
  %11 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %11 to i64
  %arrayidx7 = getelementptr inbounds double, double* %10, i64 %idxprom6
  %12 = load double, double* %arrayidx7, align 8
  %mul8 = fmul double %9, %12
  %13 = load double*, double** %activations.addr, align 8
  %14 = load i32, i32* %i, align 4
  %idxprom9 = sext i32 %14 to i64
  %arrayidx10 = getelementptr inbounds double, double* %13, i64 %idxprom9
  %15 = load double, double* %arrayidx10, align 8
  %add11 = fadd double %15, %mul8
  store double %add11, double* %arrayidx10, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %16 = load i32, i32* %j, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1, !llvm.loop !66

for.end:                                          ; preds = %for.cond1
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %17 = load i32, i32* %i, align 4
  %inc13 = add nsw i32 %17, 1
  store i32 %inc13, i32* %i, align 4
  br label %for.cond, !llvm.loop !68

for.end14:                                        ; preds = %for.cond
  %18 = load double*, double** %biases.addr, align 8
  %19 = load double*, double** %activations.addr, align 8
  call void @add_bias_to_activations(double* %18, double* %19, i32 64)
  %20 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #4
  %21 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #4
  ret void
}

; Function Attrs: noinline nounwind
define void @matrix_vector_product_with_bias_output_layer(double* "fpga.decayed.dim.hint"="3" %biases, double* "fpga.decayed.dim.hint"="192" %weights, double* "fpga.decayed.dim.hint"="3" %activations, double* "fpga.decayed.dim.hint"="64" %input_activations) #0 !fpga.function.pragma !70 {
entry:
  %biases.addr = alloca double*, align 8
  %weights.addr = alloca double*, align 8
  %activations.addr = alloca double*, align 8
  %input_activations.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double* %biases, double** %biases.addr, align 8
  store double* %weights, double** %weights.addr, align 8
  store double* %activations, double** %activations.addr, align 8
  store double* %input_activations, double** %input_activations.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  br label %matrix_vector_product_with_bias_output_layer_loop1

matrix_vector_product_with_bias_output_layer_loop1: ; preds = %entry
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %matrix_vector_product_with_bias_output_layer_loop1
  %2 = load i32, i32* %j, align 4
  %cmp = icmp slt i32 %2, 3
  br i1 %cmp, label %for.body, label %for.end14

for.body:                                         ; preds = %for.cond
  %3 = load double*, double** %activations.addr, align 8
  %4 = load i32, i32* %j, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds double, double* %3, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8
  br label %matrix_vector_product_with_bias_output_layer_loop1_1

matrix_vector_product_with_bias_output_layer_loop1_1: ; preds = %for.body
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %matrix_vector_product_with_bias_output_layer_loop1_1
  %5 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %5, 64
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load double*, double** %weights.addr, align 8
  %7 = load i32, i32* %j, align 4
  %mul = mul nsw i32 %7, 64
  %8 = load i32, i32* %i, align 4
  %add = add nsw i32 %mul, %8
  %idxprom4 = sext i32 %add to i64
  %arrayidx5 = getelementptr inbounds double, double* %6, i64 %idxprom4
  %9 = load double, double* %arrayidx5, align 8
  %10 = load double*, double** %input_activations.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom6 = sext i32 %11 to i64
  %arrayidx7 = getelementptr inbounds double, double* %10, i64 %idxprom6
  %12 = load double, double* %arrayidx7, align 8
  %mul8 = fmul double %9, %12
  %13 = load double*, double** %activations.addr, align 8
  %14 = load i32, i32* %j, align 4
  %idxprom9 = sext i32 %14 to i64
  %arrayidx10 = getelementptr inbounds double, double* %13, i64 %idxprom9
  %15 = load double, double* %arrayidx10, align 8
  %add11 = fadd double %15, %mul8
  store double %add11, double* %arrayidx10, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %16 = load i32, i32* %i, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1, !llvm.loop !77

for.end:                                          ; preds = %for.cond1
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %17 = load i32, i32* %j, align 4
  %inc13 = add nsw i32 %17, 1
  store i32 %inc13, i32* %j, align 4
  br label %for.cond, !llvm.loop !79

for.end14:                                        ; preds = %for.cond
  %18 = load double*, double** %biases.addr, align 8
  %19 = load double*, double** %activations.addr, align 8
  call void @add_bias_to_activations(double* %18, double* %19, i32 3)
  %20 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #4
  %21 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #4
  ret void
}

; Function Attrs: noinline nounwind
define void @take_difference(double* "fpga.decayed.dim.hint"="3" %net_outputs, double* "fpga.decayed.dim.hint"="3" %solutions, double* "fpga.decayed.dim.hint"="3" %output_difference, double* "fpga.decayed.dim.hint"="3" %dactivations) #0 !fpga.function.pragma !81 {
entry:
  %net_outputs.addr = alloca double*, align 8
  %solutions.addr = alloca double*, align 8
  %output_difference.addr = alloca double*, align 8
  %dactivations.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store double* %net_outputs, double** %net_outputs.addr, align 8
  store double* %solutions, double** %solutions.addr, align 8
  store double* %output_difference, double** %output_difference.addr, align 8
  store double* %dactivations, double** %dactivations.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  br label %take_difference_loop1

take_difference_loop1:                            ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %take_difference_loop1
  %1 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %1, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load double*, double** %net_outputs.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds double, double* %2, i64 %idxprom
  %4 = load double, double* %arrayidx, align 8
  %5 = load double*, double** %solutions.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %6 to i64
  %arrayidx2 = getelementptr inbounds double, double* %5, i64 %idxprom1
  %7 = load double, double* %arrayidx2, align 8
  %sub = fsub double %4, %7
  %mul = fmul double %sub, -1.000000e+00
  %8 = load double*, double** %dactivations.addr, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %9 to i64
  %arrayidx4 = getelementptr inbounds double, double* %8, i64 %idxprom3
  %10 = load double, double* %arrayidx4, align 8
  %mul5 = fmul double %mul, %10
  %11 = load double*, double** %output_difference.addr, align 8
  %12 = load i32, i32* %i, align 4
  %idxprom6 = sext i32 %12 to i64
  %arrayidx7 = getelementptr inbounds double, double* %11, i64 %idxprom6
  store double %mul5, double* %arrayidx7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %13 = load i32, i32* %i, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !88

for.end:                                          ; preds = %for.cond
  %14 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %14) #4
  ret void
}

; Function Attrs: noinline nounwind
define void @get_delta_matrix_weights3(double* "fpga.decayed.dim.hint"="192" %delta_weights3, double* "fpga.decayed.dim.hint"="3" %output_difference, double* "fpga.decayed.dim.hint"="64" %last_activations) #0 !fpga.function.pragma !90 {
entry:
  %delta_weights3.addr = alloca double*, align 8
  %output_difference.addr = alloca double*, align 8
  %last_activations.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double* %delta_weights3, double** %delta_weights3.addr, align 8
  store double* %output_difference, double** %output_difference.addr, align 8
  store double* %last_activations, double** %last_activations.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  br label %get_delta_matrix_weights3_loop1

get_delta_matrix_weights3_loop1:                  ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %get_delta_matrix_weights3_loop1
  %2 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %2, 64
  br i1 %cmp, label %for.body, label %for.end11

for.body:                                         ; preds = %for.cond
  br label %get_delta_matrix_weights3_loop1_1

get_delta_matrix_weights3_loop1_1:                ; preds = %for.body
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %get_delta_matrix_weights3_loop1_1
  %3 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %3, 3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load double*, double** %last_activations.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds double, double* %4, i64 %idxprom
  %6 = load double, double* %arrayidx, align 8
  %7 = load double*, double** %output_difference.addr, align 8
  %8 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %8 to i64
  %arrayidx5 = getelementptr inbounds double, double* %7, i64 %idxprom4
  %9 = load double, double* %arrayidx5, align 8
  %mul = fmul double %6, %9
  %10 = load double*, double** %delta_weights3.addr, align 8
  %11 = load i32, i32* %i, align 4
  %mul6 = mul nsw i32 %11, 3
  %12 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul6, %12
  %idxprom7 = sext i32 %add to i64
  %arrayidx8 = getelementptr inbounds double, double* %10, i64 %idxprom7
  store double %mul, double* %arrayidx8, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %13 = load i32, i32* %j, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1, !llvm.loop !99

for.end:                                          ; preds = %for.cond1
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %14 = load i32, i32* %i, align 4
  %inc10 = add nsw i32 %14, 1
  store i32 %inc10, i32* %i, align 4
  br label %for.cond, !llvm.loop !101

for.end11:                                        ; preds = %for.cond
  %15 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #4
  %16 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #4
  ret void
}

; Function Attrs: noinline nounwind
define void @get_oracle_activations2(double* "fpga.decayed.dim.hint"="192" %weights3, double* "fpga.decayed.dim.hint"="3" %output_differences, double* "fpga.decayed.dim.hint"="64" %oracle_activations, double* "fpga.decayed.dim.hint"="64" %dactivations) #0 !fpga.function.pragma !103 {
entry:
  %weights3.addr = alloca double*, align 8
  %output_differences.addr = alloca double*, align 8
  %oracle_activations.addr = alloca double*, align 8
  %dactivations.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double* %weights3, double** %weights3.addr, align 8
  store double* %output_differences, double** %output_differences.addr, align 8
  store double* %oracle_activations, double** %oracle_activations.addr, align 8
  store double* %dactivations, double** %dactivations.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  br label %get_oracle_activations2_loop1

get_oracle_activations2_loop1:                    ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc19, %get_oracle_activations2_loop1
  %2 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %2, 64
  br i1 %cmp, label %for.body, label %for.end21

for.body:                                         ; preds = %for.cond
  %3 = load double*, double** %oracle_activations.addr, align 8
  %4 = load i32, i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds double, double* %3, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8
  br label %get_oracle_activations2_loop1_1

get_oracle_activations2_loop1_1:                  ; preds = %for.body
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %get_oracle_activations2_loop1_1
  %5 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %5, 3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load double*, double** %output_differences.addr, align 8
  %7 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %7 to i64
  %arrayidx5 = getelementptr inbounds double, double* %6, i64 %idxprom4
  %8 = load double, double* %arrayidx5, align 8
  %9 = load double*, double** %weights3.addr, align 8
  %10 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %10, 3
  %11 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul, %11
  %idxprom6 = sext i32 %add to i64
  %arrayidx7 = getelementptr inbounds double, double* %9, i64 %idxprom6
  %12 = load double, double* %arrayidx7, align 8
  %mul8 = fmul double %8, %12
  %13 = load double*, double** %oracle_activations.addr, align 8
  %14 = load i32, i32* %i, align 4
  %idxprom9 = sext i32 %14 to i64
  %arrayidx10 = getelementptr inbounds double, double* %13, i64 %idxprom9
  %15 = load double, double* %arrayidx10, align 8
  %add11 = fadd double %15, %mul8
  store double %add11, double* %arrayidx10, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %16 = load i32, i32* %j, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1, !llvm.loop !110

for.end:                                          ; preds = %for.cond1
  %17 = load double*, double** %oracle_activations.addr, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %18 to i64
  %arrayidx13 = getelementptr inbounds double, double* %17, i64 %idxprom12
  %19 = load double, double* %arrayidx13, align 8
  %20 = load double*, double** %dactivations.addr, align 8
  %21 = load i32, i32* %i, align 4
  %idxprom14 = sext i32 %21 to i64
  %arrayidx15 = getelementptr inbounds double, double* %20, i64 %idxprom14
  %22 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %19, %22
  %23 = load double*, double** %oracle_activations.addr, align 8
  %24 = load i32, i32* %i, align 4
  %idxprom17 = sext i32 %24 to i64
  %arrayidx18 = getelementptr inbounds double, double* %23, i64 %idxprom17
  store double %mul16, double* %arrayidx18, align 8
  br label %for.inc19

for.inc19:                                        ; preds = %for.end
  %25 = load i32, i32* %i, align 4
  %inc20 = add nsw i32 %25, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond, !llvm.loop !112

for.end21:                                        ; preds = %for.cond
  %26 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %26) #4
  %27 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %27) #4
  ret void
}

; Function Attrs: noinline nounwind
define void @get_delta_matrix_weights2(double* "fpga.decayed.dim.hint"="4096" %delta_weights2, double* "fpga.decayed.dim.hint"="64" %output_difference, double* "fpga.decayed.dim.hint"="64" %last_activations) #0 !fpga.function.pragma !114 {
entry:
  %delta_weights2.addr = alloca double*, align 8
  %output_difference.addr = alloca double*, align 8
  %last_activations.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double* %delta_weights2, double** %delta_weights2.addr, align 8
  store double* %output_difference, double** %output_difference.addr, align 8
  store double* %last_activations, double** %last_activations.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  br label %get_delta_matrix_weights2_loop1

get_delta_matrix_weights2_loop1:                  ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %get_delta_matrix_weights2_loop1
  %2 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %2, 64
  br i1 %cmp, label %for.body, label %for.end11

for.body:                                         ; preds = %for.cond
  br label %get_delta_matrix_weights2_loop1_1

get_delta_matrix_weights2_loop1_1:                ; preds = %for.body
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %get_delta_matrix_weights2_loop1_1
  %3 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %3, 64
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load double*, double** %last_activations.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds double, double* %4, i64 %idxprom
  %6 = load double, double* %arrayidx, align 8
  %7 = load double*, double** %output_difference.addr, align 8
  %8 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %8 to i64
  %arrayidx5 = getelementptr inbounds double, double* %7, i64 %idxprom4
  %9 = load double, double* %arrayidx5, align 8
  %mul = fmul double %6, %9
  %10 = load double*, double** %delta_weights2.addr, align 8
  %11 = load i32, i32* %i, align 4
  %mul6 = mul nsw i32 %11, 64
  %12 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul6, %12
  %idxprom7 = sext i32 %add to i64
  %arrayidx8 = getelementptr inbounds double, double* %10, i64 %idxprom7
  store double %mul, double* %arrayidx8, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %13 = load i32, i32* %j, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1, !llvm.loop !121

for.end:                                          ; preds = %for.cond1
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %14 = load i32, i32* %i, align 4
  %inc10 = add nsw i32 %14, 1
  store i32 %inc10, i32* %i, align 4
  br label %for.cond, !llvm.loop !123

for.end11:                                        ; preds = %for.cond
  %15 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #4
  %16 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #4
  ret void
}

; Function Attrs: noinline nounwind
define void @get_oracle_activations1(double* "fpga.decayed.dim.hint"="4096" %weights2, double* "fpga.decayed.dim.hint"="64" %output_differences, double* "fpga.decayed.dim.hint"="64" %oracle_activations, double* "fpga.decayed.dim.hint"="64" %dactivations) #0 !fpga.function.pragma !125 {
entry:
  %weights2.addr = alloca double*, align 8
  %output_differences.addr = alloca double*, align 8
  %oracle_activations.addr = alloca double*, align 8
  %dactivations.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double* %weights2, double** %weights2.addr, align 8
  store double* %output_differences, double** %output_differences.addr, align 8
  store double* %oracle_activations, double** %oracle_activations.addr, align 8
  store double* %dactivations, double** %dactivations.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  br label %get_oracle_activations1_loop1

get_oracle_activations1_loop1:                    ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc19, %get_oracle_activations1_loop1
  %2 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %2, 64
  br i1 %cmp, label %for.body, label %for.end21

for.body:                                         ; preds = %for.cond
  %3 = load double*, double** %oracle_activations.addr, align 8
  %4 = load i32, i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds double, double* %3, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8
  br label %get_oracle_activations1_loop1_1

get_oracle_activations1_loop1_1:                  ; preds = %for.body
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %get_oracle_activations1_loop1_1
  %5 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %5, 64
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load double*, double** %output_differences.addr, align 8
  %7 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %7 to i64
  %arrayidx5 = getelementptr inbounds double, double* %6, i64 %idxprom4
  %8 = load double, double* %arrayidx5, align 8
  %9 = load double*, double** %weights2.addr, align 8
  %10 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %10, 64
  %11 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul, %11
  %idxprom6 = sext i32 %add to i64
  %arrayidx7 = getelementptr inbounds double, double* %9, i64 %idxprom6
  %12 = load double, double* %arrayidx7, align 8
  %mul8 = fmul double %8, %12
  %13 = load double*, double** %oracle_activations.addr, align 8
  %14 = load i32, i32* %i, align 4
  %idxprom9 = sext i32 %14 to i64
  %arrayidx10 = getelementptr inbounds double, double* %13, i64 %idxprom9
  %15 = load double, double* %arrayidx10, align 8
  %add11 = fadd double %15, %mul8
  store double %add11, double* %arrayidx10, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %16 = load i32, i32* %j, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1, !llvm.loop !132

for.end:                                          ; preds = %for.cond1
  %17 = load double*, double** %oracle_activations.addr, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %18 to i64
  %arrayidx13 = getelementptr inbounds double, double* %17, i64 %idxprom12
  %19 = load double, double* %arrayidx13, align 8
  %20 = load double*, double** %dactivations.addr, align 8
  %21 = load i32, i32* %i, align 4
  %idxprom14 = sext i32 %21 to i64
  %arrayidx15 = getelementptr inbounds double, double* %20, i64 %idxprom14
  %22 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %19, %22
  %23 = load double*, double** %oracle_activations.addr, align 8
  %24 = load i32, i32* %i, align 4
  %idxprom17 = sext i32 %24 to i64
  %arrayidx18 = getelementptr inbounds double, double* %23, i64 %idxprom17
  store double %mul16, double* %arrayidx18, align 8
  br label %for.inc19

for.inc19:                                        ; preds = %for.end
  %25 = load i32, i32* %i, align 4
  %inc20 = add nsw i32 %25, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond, !llvm.loop !134

for.end21:                                        ; preds = %for.cond
  %26 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %26) #4
  %27 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %27) #4
  ret void
}

; Function Attrs: noinline nounwind
define void @get_delta_matrix_weights1(double* "fpga.decayed.dim.hint"="832" %delta_weights1, double* "fpga.decayed.dim.hint"="64" %output_difference, double* "fpga.decayed.dim.hint"="13" %last_activations) #0 !fpga.function.pragma !136 {
entry:
  %delta_weights1.addr = alloca double*, align 8
  %output_difference.addr = alloca double*, align 8
  %last_activations.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store double* %delta_weights1, double** %delta_weights1.addr, align 8
  store double* %output_difference, double** %output_difference.addr, align 8
  store double* %last_activations, double** %last_activations.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  br label %get_delta_matrix_weights1_loop1

get_delta_matrix_weights1_loop1:                  ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %get_delta_matrix_weights1_loop1
  %2 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %2, 13
  br i1 %cmp, label %for.body, label %for.end11

for.body:                                         ; preds = %for.cond
  br label %get_delta_matrix_weights1_loop1_1

get_delta_matrix_weights1_loop1_1:                ; preds = %for.body
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %get_delta_matrix_weights1_loop1_1
  %3 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %3, 64
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load double*, double** %last_activations.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds double, double* %4, i64 %idxprom
  %6 = load double, double* %arrayidx, align 8
  %7 = load double*, double** %output_difference.addr, align 8
  %8 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %8 to i64
  %arrayidx5 = getelementptr inbounds double, double* %7, i64 %idxprom4
  %9 = load double, double* %arrayidx5, align 8
  %mul = fmul double %6, %9
  %10 = load double*, double** %delta_weights1.addr, align 8
  %11 = load i32, i32* %i, align 4
  %mul6 = mul nsw i32 %11, 64
  %12 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul6, %12
  %idxprom7 = sext i32 %add to i64
  %arrayidx8 = getelementptr inbounds double, double* %10, i64 %idxprom7
  store double %mul, double* %arrayidx8, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %13 = load i32, i32* %j, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1, !llvm.loop !143

for.end:                                          ; preds = %for.cond1
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %14 = load i32, i32* %i, align 4
  %inc10 = add nsw i32 %14, 1
  store i32 %inc10, i32* %i, align 4
  br label %for.cond, !llvm.loop !145

for.end11:                                        ; preds = %for.cond
  %15 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %15) #4
  %16 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #4
  ret void
}

; Function Attrs: noinline nounwind
define void @update_weights(double* "fpga.decayed.dim.hint"="832" %weights1, double* "fpga.decayed.dim.hint"="4096" %weights2, double* "fpga.decayed.dim.hint"="192" %weights3, double* "fpga.decayed.dim.hint"="832" %d_weights1, double* "fpga.decayed.dim.hint"="4096" %d_weights2, double* "fpga.decayed.dim.hint"="192" %d_weights3, double* "fpga.decayed.dim.hint"="64" %biases1, double* "fpga.decayed.dim.hint"="64" %biases2, double* "fpga.decayed.dim.hint"="3" %biases3, double* "fpga.decayed.dim.hint"="64" %d_biases1, double* "fpga.decayed.dim.hint"="64" %d_biases2, double* "fpga.decayed.dim.hint"="3" %d_biases3) #0 !fpga.function.pragma !147 {
entry:
  %weights1.addr = alloca double*, align 8
  %weights2.addr = alloca double*, align 8
  %weights3.addr = alloca double*, align 8
  %d_weights1.addr = alloca double*, align 8
  %d_weights2.addr = alloca double*, align 8
  %d_weights3.addr = alloca double*, align 8
  %biases1.addr = alloca double*, align 8
  %biases2.addr = alloca double*, align 8
  %biases3.addr = alloca double*, align 8
  %d_biases1.addr = alloca double*, align 8
  %d_biases2.addr = alloca double*, align 8
  %d_biases3.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %norm = alloca double, align 8
  %bias_norm = alloca double, align 8
  store double* %weights1, double** %weights1.addr, align 8
  store double* %weights2, double** %weights2.addr, align 8
  store double* %weights3, double** %weights3.addr, align 8
  store double* %d_weights1, double** %d_weights1.addr, align 8
  store double* %d_weights2, double** %d_weights2.addr, align 8
  store double* %d_weights3, double** %d_weights3.addr, align 8
  store double* %biases1, double** %biases1.addr, align 8
  store double* %biases2, double** %biases2.addr, align 8
  store double* %biases3, double** %biases3.addr, align 8
  store double* %d_biases1, double** %d_biases1.addr, align 8
  store double* %d_biases2, double** %d_biases2.addr, align 8
  store double* %d_biases3, double** %d_biases3.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  %2 = bitcast double* %norm to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #4
  %3 = bitcast double* %bias_norm to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #4
  store double 0.000000e+00, double* %norm, align 8
  store double 0.000000e+00, double* %bias_norm, align 8
  br label %update_weights_loop1

update_weights_loop1:                             ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc19, %update_weights_loop1
  %4 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %4, 13
  br i1 %cmp, label %for.body, label %for.end21

for.body:                                         ; preds = %for.cond
  br label %update_weights_loop1_1

update_weights_loop1_1:                           ; preds = %for.body
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %update_weights_loop1_1
  %5 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %5, 64
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load double*, double** %d_weights1.addr, align 8
  %7 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %7, 64
  %8 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul, %8
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds double, double* %6, i64 %idxprom
  %9 = load double, double* %arrayidx, align 8
  %mul4 = fmul double %9, 1.000000e-02
  %10 = load double*, double** %weights1.addr, align 8
  %11 = load i32, i32* %i, align 4
  %mul5 = mul nsw i32 %11, 64
  %12 = load i32, i32* %j, align 4
  %add6 = add nsw i32 %mul5, %12
  %idxprom7 = sext i32 %add6 to i64
  %arrayidx8 = getelementptr inbounds double, double* %10, i64 %idxprom7
  %13 = load double, double* %arrayidx8, align 8
  %sub = fsub double %13, %mul4
  store double %sub, double* %arrayidx8, align 8
  %14 = load double*, double** %weights1.addr, align 8
  %15 = load i32, i32* %i, align 4
  %mul9 = mul nsw i32 %15, 64
  %16 = load i32, i32* %j, align 4
  %add10 = add nsw i32 %mul9, %16
  %idxprom11 = sext i32 %add10 to i64
  %arrayidx12 = getelementptr inbounds double, double* %14, i64 %idxprom11
  %17 = load double, double* %arrayidx12, align 8
  %18 = load double*, double** %weights1.addr, align 8
  %19 = load i32, i32* %i, align 4
  %mul13 = mul nsw i32 %19, 64
  %20 = load i32, i32* %j, align 4
  %add14 = add nsw i32 %mul13, %20
  %idxprom15 = sext i32 %add14 to i64
  %arrayidx16 = getelementptr inbounds double, double* %18, i64 %idxprom15
  %21 = load double, double* %arrayidx16, align 8
  %mul17 = fmul double %17, %21
  %22 = load double, double* %norm, align 8
  %add18 = fadd double %22, %mul17
  store double %add18, double* %norm, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %23 = load i32, i32* %j, align 4
  %inc = add nsw i32 %23, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1, !llvm.loop !156

for.end:                                          ; preds = %for.cond1
  br label %for.inc19

for.inc19:                                        ; preds = %for.end
  %24 = load i32, i32* %i, align 4
  %inc20 = add nsw i32 %24, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond, !llvm.loop !158

for.end21:                                        ; preds = %for.cond
  br label %update_weights_loop2

update_weights_loop2:                             ; preds = %for.end21
  store i32 0, i32* %i, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc37, %update_weights_loop2
  %25 = load i32, i32* %i, align 4
  %cmp23 = icmp slt i32 %25, 64
  br i1 %cmp23, label %for.body24, label %for.end39

for.body24:                                       ; preds = %for.cond22
  %26 = load double*, double** %d_biases1.addr, align 8
  %27 = load i32, i32* %i, align 4
  %idxprom25 = sext i32 %27 to i64
  %arrayidx26 = getelementptr inbounds double, double* %26, i64 %idxprom25
  %28 = load double, double* %arrayidx26, align 8
  %mul27 = fmul double %28, 1.000000e-02
  %29 = load double*, double** %biases1.addr, align 8
  %30 = load i32, i32* %i, align 4
  %idxprom28 = sext i32 %30 to i64
  %arrayidx29 = getelementptr inbounds double, double* %29, i64 %idxprom28
  %31 = load double, double* %arrayidx29, align 8
  %sub30 = fsub double %31, %mul27
  store double %sub30, double* %arrayidx29, align 8
  %32 = load double*, double** %biases1.addr, align 8
  %33 = load i32, i32* %i, align 4
  %idxprom31 = sext i32 %33 to i64
  %arrayidx32 = getelementptr inbounds double, double* %32, i64 %idxprom31
  %34 = load double, double* %arrayidx32, align 8
  %35 = load double*, double** %biases1.addr, align 8
  %36 = load i32, i32* %i, align 4
  %idxprom33 = sext i32 %36 to i64
  %arrayidx34 = getelementptr inbounds double, double* %35, i64 %idxprom33
  %37 = load double, double* %arrayidx34, align 8
  %mul35 = fmul double %34, %37
  %38 = load double, double* %bias_norm, align 8
  %add36 = fadd double %38, %mul35
  store double %add36, double* %bias_norm, align 8
  br label %for.inc37

for.inc37:                                        ; preds = %for.body24
  %39 = load i32, i32* %i, align 4
  %inc38 = add nsw i32 %39, 1
  store i32 %inc38, i32* %i, align 4
  br label %for.cond22, !llvm.loop !160

for.end39:                                        ; preds = %for.cond22
  %40 = load double, double* %norm, align 8
  %41 = call double @llvm.sqrt.f64(double %40)
  store double %41, double* %norm, align 8
  %42 = load double, double* %bias_norm, align 8
  %43 = call double @llvm.sqrt.f64(double %42)
  store double %43, double* %bias_norm, align 8
  br label %update_weights_loop3

update_weights_loop3:                             ; preds = %for.end39
  store i32 0, i32* %i, align 4
  br label %for.cond40

for.cond40:                                       ; preds = %for.inc57, %update_weights_loop3
  %44 = load i32, i32* %i, align 4
  %cmp41 = icmp slt i32 %44, 13
  br i1 %cmp41, label %for.body42, label %for.end59

for.body42:                                       ; preds = %for.cond40
  br label %update_weights_loop3_1

update_weights_loop3_1:                           ; preds = %for.body42
  store i32 0, i32* %j, align 4
  br label %for.cond43

for.cond43:                                       ; preds = %for.inc54, %update_weights_loop3_1
  %45 = load i32, i32* %j, align 4
  %cmp44 = icmp slt i32 %45, 64
  br i1 %cmp44, label %for.body45, label %for.end56

for.body45:                                       ; preds = %for.cond43
  %46 = load double*, double** %weights1.addr, align 8
  %47 = load i32, i32* %i, align 4
  %mul46 = mul nsw i32 %47, 64
  %48 = load i32, i32* %j, align 4
  %add47 = add nsw i32 %mul46, %48
  %idxprom48 = sext i32 %add47 to i64
  %arrayidx49 = getelementptr inbounds double, double* %46, i64 %idxprom48
  %49 = load double, double* %arrayidx49, align 8
  %50 = load double, double* %norm, align 8
  %div = fdiv double %49, %50
  %51 = load double*, double** %weights1.addr, align 8
  %52 = load i32, i32* %i, align 4
  %mul50 = mul nsw i32 %52, 64
  %53 = load i32, i32* %j, align 4
  %add51 = add nsw i32 %mul50, %53
  %idxprom52 = sext i32 %add51 to i64
  %arrayidx53 = getelementptr inbounds double, double* %51, i64 %idxprom52
  store double %div, double* %arrayidx53, align 8
  br label %for.inc54

for.inc54:                                        ; preds = %for.body45
  %54 = load i32, i32* %j, align 4
  %inc55 = add nsw i32 %54, 1
  store i32 %inc55, i32* %j, align 4
  br label %for.cond43, !llvm.loop !162

for.end56:                                        ; preds = %for.cond43
  br label %for.inc57

for.inc57:                                        ; preds = %for.end56
  %55 = load i32, i32* %i, align 4
  %inc58 = add nsw i32 %55, 1
  store i32 %inc58, i32* %i, align 4
  br label %for.cond40, !llvm.loop !164

for.end59:                                        ; preds = %for.cond40
  br label %update_weights_loop4

update_weights_loop4:                             ; preds = %for.end59
  store i32 0, i32* %i, align 4
  br label %for.cond60

for.cond60:                                       ; preds = %for.inc68, %update_weights_loop4
  %56 = load i32, i32* %i, align 4
  %cmp61 = icmp slt i32 %56, 64
  br i1 %cmp61, label %for.body62, label %for.end70

for.body62:                                       ; preds = %for.cond60
  %57 = load double*, double** %biases1.addr, align 8
  %58 = load i32, i32* %i, align 4
  %idxprom63 = sext i32 %58 to i64
  %arrayidx64 = getelementptr inbounds double, double* %57, i64 %idxprom63
  %59 = load double, double* %arrayidx64, align 8
  %60 = load double, double* %bias_norm, align 8
  %div65 = fdiv double %59, %60
  %61 = load double*, double** %biases1.addr, align 8
  %62 = load i32, i32* %i, align 4
  %idxprom66 = sext i32 %62 to i64
  %arrayidx67 = getelementptr inbounds double, double* %61, i64 %idxprom66
  store double %div65, double* %arrayidx67, align 8
  br label %for.inc68

for.inc68:                                        ; preds = %for.body62
  %63 = load i32, i32* %i, align 4
  %inc69 = add nsw i32 %63, 1
  store i32 %inc69, i32* %i, align 4
  br label %for.cond60, !llvm.loop !166

for.end70:                                        ; preds = %for.cond60
  store double 0.000000e+00, double* %norm, align 8
  store double 0.000000e+00, double* %bias_norm, align 8
  br label %update_weights_loop5

update_weights_loop5:                             ; preds = %for.end70
  store i32 0, i32* %i, align 4
  br label %for.cond71

for.cond71:                                       ; preds = %for.inc100, %update_weights_loop5
  %64 = load i32, i32* %i, align 4
  %cmp72 = icmp slt i32 %64, 64
  br i1 %cmp72, label %for.body73, label %for.end102

for.body73:                                       ; preds = %for.cond71
  br label %update_weights_loop5_1

update_weights_loop5_1:                           ; preds = %for.body73
  store i32 0, i32* %j, align 4
  br label %for.cond74

for.cond74:                                       ; preds = %for.inc97, %update_weights_loop5_1
  %65 = load i32, i32* %j, align 4
  %cmp75 = icmp slt i32 %65, 64
  br i1 %cmp75, label %for.body76, label %for.end99

for.body76:                                       ; preds = %for.cond74
  %66 = load double*, double** %d_weights2.addr, align 8
  %67 = load i32, i32* %i, align 4
  %mul77 = mul nsw i32 %67, 64
  %68 = load i32, i32* %j, align 4
  %add78 = add nsw i32 %mul77, %68
  %idxprom79 = sext i32 %add78 to i64
  %arrayidx80 = getelementptr inbounds double, double* %66, i64 %idxprom79
  %69 = load double, double* %arrayidx80, align 8
  %mul81 = fmul double %69, 1.000000e-02
  %70 = load double*, double** %weights2.addr, align 8
  %71 = load i32, i32* %i, align 4
  %mul82 = mul nsw i32 %71, 64
  %72 = load i32, i32* %j, align 4
  %add83 = add nsw i32 %mul82, %72
  %idxprom84 = sext i32 %add83 to i64
  %arrayidx85 = getelementptr inbounds double, double* %70, i64 %idxprom84
  %73 = load double, double* %arrayidx85, align 8
  %sub86 = fsub double %73, %mul81
  store double %sub86, double* %arrayidx85, align 8
  %74 = load double*, double** %weights2.addr, align 8
  %75 = load i32, i32* %i, align 4
  %mul87 = mul nsw i32 %75, 64
  %76 = load i32, i32* %j, align 4
  %add88 = add nsw i32 %mul87, %76
  %idxprom89 = sext i32 %add88 to i64
  %arrayidx90 = getelementptr inbounds double, double* %74, i64 %idxprom89
  %77 = load double, double* %arrayidx90, align 8
  %78 = load double*, double** %weights2.addr, align 8
  %79 = load i32, i32* %i, align 4
  %mul91 = mul nsw i32 %79, 64
  %80 = load i32, i32* %j, align 4
  %add92 = add nsw i32 %mul91, %80
  %idxprom93 = sext i32 %add92 to i64
  %arrayidx94 = getelementptr inbounds double, double* %78, i64 %idxprom93
  %81 = load double, double* %arrayidx94, align 8
  %mul95 = fmul double %77, %81
  %82 = load double, double* %norm, align 8
  %add96 = fadd double %82, %mul95
  store double %add96, double* %norm, align 8
  br label %for.inc97

for.inc97:                                        ; preds = %for.body76
  %83 = load i32, i32* %j, align 4
  %inc98 = add nsw i32 %83, 1
  store i32 %inc98, i32* %j, align 4
  br label %for.cond74, !llvm.loop !168

for.end99:                                        ; preds = %for.cond74
  br label %for.inc100

for.inc100:                                       ; preds = %for.end99
  %84 = load i32, i32* %i, align 4
  %inc101 = add nsw i32 %84, 1
  store i32 %inc101, i32* %i, align 4
  br label %for.cond71, !llvm.loop !170

for.end102:                                       ; preds = %for.cond71
  br label %update_weights_loop6

update_weights_loop6:                             ; preds = %for.end102
  store i32 0, i32* %i, align 4
  br label %for.cond103

for.cond103:                                      ; preds = %for.inc118, %update_weights_loop6
  %85 = load i32, i32* %i, align 4
  %cmp104 = icmp slt i32 %85, 64
  br i1 %cmp104, label %for.body105, label %for.end120

for.body105:                                      ; preds = %for.cond103
  %86 = load double*, double** %d_biases2.addr, align 8
  %87 = load i32, i32* %i, align 4
  %idxprom106 = sext i32 %87 to i64
  %arrayidx107 = getelementptr inbounds double, double* %86, i64 %idxprom106
  %88 = load double, double* %arrayidx107, align 8
  %mul108 = fmul double %88, 1.000000e-02
  %89 = load double*, double** %biases2.addr, align 8
  %90 = load i32, i32* %i, align 4
  %idxprom109 = sext i32 %90 to i64
  %arrayidx110 = getelementptr inbounds double, double* %89, i64 %idxprom109
  %91 = load double, double* %arrayidx110, align 8
  %sub111 = fsub double %91, %mul108
  store double %sub111, double* %arrayidx110, align 8
  %92 = load double*, double** %biases2.addr, align 8
  %93 = load i32, i32* %i, align 4
  %idxprom112 = sext i32 %93 to i64
  %arrayidx113 = getelementptr inbounds double, double* %92, i64 %idxprom112
  %94 = load double, double* %arrayidx113, align 8
  %95 = load double*, double** %biases2.addr, align 8
  %96 = load i32, i32* %i, align 4
  %idxprom114 = sext i32 %96 to i64
  %arrayidx115 = getelementptr inbounds double, double* %95, i64 %idxprom114
  %97 = load double, double* %arrayidx115, align 8
  %mul116 = fmul double %94, %97
  %98 = load double, double* %bias_norm, align 8
  %add117 = fadd double %98, %mul116
  store double %add117, double* %bias_norm, align 8
  br label %for.inc118

for.inc118:                                       ; preds = %for.body105
  %99 = load i32, i32* %i, align 4
  %inc119 = add nsw i32 %99, 1
  store i32 %inc119, i32* %i, align 4
  br label %for.cond103, !llvm.loop !172

for.end120:                                       ; preds = %for.cond103
  %100 = load double, double* %norm, align 8
  %101 = call double @llvm.sqrt.f64(double %100)
  store double %101, double* %norm, align 8
  %102 = load double, double* %bias_norm, align 8
  %103 = call double @llvm.sqrt.f64(double %102)
  store double %103, double* %bias_norm, align 8
  br label %update_weights_loop7

update_weights_loop7:                             ; preds = %for.end120
  store i32 0, i32* %i, align 4
  br label %for.cond121

for.cond121:                                      ; preds = %for.inc139, %update_weights_loop7
  %104 = load i32, i32* %i, align 4
  %cmp122 = icmp slt i32 %104, 64
  br i1 %cmp122, label %for.body123, label %for.end141

for.body123:                                      ; preds = %for.cond121
  br label %update_weights_loop7_1

update_weights_loop7_1:                           ; preds = %for.body123
  store i32 0, i32* %j, align 4
  br label %for.cond124

for.cond124:                                      ; preds = %for.inc136, %update_weights_loop7_1
  %105 = load i32, i32* %j, align 4
  %cmp125 = icmp slt i32 %105, 64
  br i1 %cmp125, label %for.body126, label %for.end138

for.body126:                                      ; preds = %for.cond124
  %106 = load double*, double** %weights2.addr, align 8
  %107 = load i32, i32* %i, align 4
  %mul127 = mul nsw i32 %107, 64
  %108 = load i32, i32* %j, align 4
  %add128 = add nsw i32 %mul127, %108
  %idxprom129 = sext i32 %add128 to i64
  %arrayidx130 = getelementptr inbounds double, double* %106, i64 %idxprom129
  %109 = load double, double* %arrayidx130, align 8
  %110 = load double, double* %norm, align 8
  %div131 = fdiv double %109, %110
  %111 = load double*, double** %weights2.addr, align 8
  %112 = load i32, i32* %i, align 4
  %mul132 = mul nsw i32 %112, 64
  %113 = load i32, i32* %j, align 4
  %add133 = add nsw i32 %mul132, %113
  %idxprom134 = sext i32 %add133 to i64
  %arrayidx135 = getelementptr inbounds double, double* %111, i64 %idxprom134
  store double %div131, double* %arrayidx135, align 8
  br label %for.inc136

for.inc136:                                       ; preds = %for.body126
  %114 = load i32, i32* %j, align 4
  %inc137 = add nsw i32 %114, 1
  store i32 %inc137, i32* %j, align 4
  br label %for.cond124, !llvm.loop !174

for.end138:                                       ; preds = %for.cond124
  br label %for.inc139

for.inc139:                                       ; preds = %for.end138
  %115 = load i32, i32* %i, align 4
  %inc140 = add nsw i32 %115, 1
  store i32 %inc140, i32* %i, align 4
  br label %for.cond121, !llvm.loop !176

for.end141:                                       ; preds = %for.cond121
  br label %update_weights_loop8

update_weights_loop8:                             ; preds = %for.end141
  store i32 0, i32* %i, align 4
  br label %for.cond142

for.cond142:                                      ; preds = %for.inc150, %update_weights_loop8
  %116 = load i32, i32* %i, align 4
  %cmp143 = icmp slt i32 %116, 64
  br i1 %cmp143, label %for.body144, label %for.end152

for.body144:                                      ; preds = %for.cond142
  %117 = load double*, double** %biases2.addr, align 8
  %118 = load i32, i32* %i, align 4
  %idxprom145 = sext i32 %118 to i64
  %arrayidx146 = getelementptr inbounds double, double* %117, i64 %idxprom145
  %119 = load double, double* %arrayidx146, align 8
  %120 = load double, double* %bias_norm, align 8
  %div147 = fdiv double %119, %120
  %121 = load double*, double** %biases2.addr, align 8
  %122 = load i32, i32* %i, align 4
  %idxprom148 = sext i32 %122 to i64
  %arrayidx149 = getelementptr inbounds double, double* %121, i64 %idxprom148
  store double %div147, double* %arrayidx149, align 8
  br label %for.inc150

for.inc150:                                       ; preds = %for.body144
  %123 = load i32, i32* %i, align 4
  %inc151 = add nsw i32 %123, 1
  store i32 %inc151, i32* %i, align 4
  br label %for.cond142, !llvm.loop !178

for.end152:                                       ; preds = %for.cond142
  store double 0.000000e+00, double* %norm, align 8
  store double 0.000000e+00, double* %bias_norm, align 8
  br label %update_weights_loop9

update_weights_loop9:                             ; preds = %for.end152
  store i32 0, i32* %i, align 4
  br label %for.cond153

for.cond153:                                      ; preds = %for.inc182, %update_weights_loop9
  %124 = load i32, i32* %i, align 4
  %cmp154 = icmp slt i32 %124, 64
  br i1 %cmp154, label %for.body155, label %for.end184

for.body155:                                      ; preds = %for.cond153
  br label %update_weights_loop9_1

update_weights_loop9_1:                           ; preds = %for.body155
  store i32 0, i32* %j, align 4
  br label %for.cond156

for.cond156:                                      ; preds = %for.inc179, %update_weights_loop9_1
  %125 = load i32, i32* %j, align 4
  %cmp157 = icmp slt i32 %125, 3
  br i1 %cmp157, label %for.body158, label %for.end181

for.body158:                                      ; preds = %for.cond156
  %126 = load double*, double** %d_weights3.addr, align 8
  %127 = load i32, i32* %i, align 4
  %mul159 = mul nsw i32 %127, 3
  %128 = load i32, i32* %j, align 4
  %add160 = add nsw i32 %mul159, %128
  %idxprom161 = sext i32 %add160 to i64
  %arrayidx162 = getelementptr inbounds double, double* %126, i64 %idxprom161
  %129 = load double, double* %arrayidx162, align 8
  %mul163 = fmul double %129, 1.000000e-02
  %130 = load double*, double** %weights3.addr, align 8
  %131 = load i32, i32* %i, align 4
  %mul164 = mul nsw i32 %131, 3
  %132 = load i32, i32* %j, align 4
  %add165 = add nsw i32 %mul164, %132
  %idxprom166 = sext i32 %add165 to i64
  %arrayidx167 = getelementptr inbounds double, double* %130, i64 %idxprom166
  %133 = load double, double* %arrayidx167, align 8
  %sub168 = fsub double %133, %mul163
  store double %sub168, double* %arrayidx167, align 8
  %134 = load double*, double** %weights3.addr, align 8
  %135 = load i32, i32* %i, align 4
  %mul169 = mul nsw i32 %135, 3
  %136 = load i32, i32* %j, align 4
  %add170 = add nsw i32 %mul169, %136
  %idxprom171 = sext i32 %add170 to i64
  %arrayidx172 = getelementptr inbounds double, double* %134, i64 %idxprom171
  %137 = load double, double* %arrayidx172, align 8
  %138 = load double*, double** %weights3.addr, align 8
  %139 = load i32, i32* %i, align 4
  %mul173 = mul nsw i32 %139, 3
  %140 = load i32, i32* %j, align 4
  %add174 = add nsw i32 %mul173, %140
  %idxprom175 = sext i32 %add174 to i64
  %arrayidx176 = getelementptr inbounds double, double* %138, i64 %idxprom175
  %141 = load double, double* %arrayidx176, align 8
  %mul177 = fmul double %137, %141
  %142 = load double, double* %norm, align 8
  %add178 = fadd double %142, %mul177
  store double %add178, double* %norm, align 8
  br label %for.inc179

for.inc179:                                       ; preds = %for.body158
  %143 = load i32, i32* %j, align 4
  %inc180 = add nsw i32 %143, 1
  store i32 %inc180, i32* %j, align 4
  br label %for.cond156, !llvm.loop !180

for.end181:                                       ; preds = %for.cond156
  br label %for.inc182

for.inc182:                                       ; preds = %for.end181
  %144 = load i32, i32* %i, align 4
  %inc183 = add nsw i32 %144, 1
  store i32 %inc183, i32* %i, align 4
  br label %for.cond153, !llvm.loop !182

for.end184:                                       ; preds = %for.cond153
  br label %update_weights_loop10

update_weights_loop10:                            ; preds = %for.end184
  store i32 0, i32* %i, align 4
  br label %for.cond185

for.cond185:                                      ; preds = %for.inc200, %update_weights_loop10
  %145 = load i32, i32* %i, align 4
  %cmp186 = icmp slt i32 %145, 3
  br i1 %cmp186, label %for.body187, label %for.end202

for.body187:                                      ; preds = %for.cond185
  %146 = load double*, double** %d_biases3.addr, align 8
  %147 = load i32, i32* %i, align 4
  %idxprom188 = sext i32 %147 to i64
  %arrayidx189 = getelementptr inbounds double, double* %146, i64 %idxprom188
  %148 = load double, double* %arrayidx189, align 8
  %mul190 = fmul double %148, 1.000000e-02
  %149 = load double*, double** %biases3.addr, align 8
  %150 = load i32, i32* %i, align 4
  %idxprom191 = sext i32 %150 to i64
  %arrayidx192 = getelementptr inbounds double, double* %149, i64 %idxprom191
  %151 = load double, double* %arrayidx192, align 8
  %sub193 = fsub double %151, %mul190
  store double %sub193, double* %arrayidx192, align 8
  %152 = load double*, double** %biases3.addr, align 8
  %153 = load i32, i32* %i, align 4
  %idxprom194 = sext i32 %153 to i64
  %arrayidx195 = getelementptr inbounds double, double* %152, i64 %idxprom194
  %154 = load double, double* %arrayidx195, align 8
  %155 = load double*, double** %biases3.addr, align 8
  %156 = load i32, i32* %i, align 4
  %idxprom196 = sext i32 %156 to i64
  %arrayidx197 = getelementptr inbounds double, double* %155, i64 %idxprom196
  %157 = load double, double* %arrayidx197, align 8
  %mul198 = fmul double %154, %157
  %158 = load double, double* %bias_norm, align 8
  %add199 = fadd double %158, %mul198
  store double %add199, double* %bias_norm, align 8
  br label %for.inc200

for.inc200:                                       ; preds = %for.body187
  %159 = load i32, i32* %i, align 4
  %inc201 = add nsw i32 %159, 1
  store i32 %inc201, i32* %i, align 4
  br label %for.cond185, !llvm.loop !184

for.end202:                                       ; preds = %for.cond185
  %160 = load double, double* %norm, align 8
  %161 = call double @llvm.sqrt.f64(double %160)
  store double %161, double* %norm, align 8
  %162 = load double, double* %bias_norm, align 8
  %163 = call double @llvm.sqrt.f64(double %162)
  store double %163, double* %bias_norm, align 8
  br label %update_weights_loop11

update_weights_loop11:                            ; preds = %for.end202
  store i32 0, i32* %i, align 4
  br label %for.cond203

for.cond203:                                      ; preds = %for.inc221, %update_weights_loop11
  %164 = load i32, i32* %i, align 4
  %cmp204 = icmp slt i32 %164, 64
  br i1 %cmp204, label %for.body205, label %for.end223

for.body205:                                      ; preds = %for.cond203
  br label %update_weights_loop11_1

update_weights_loop11_1:                          ; preds = %for.body205
  store i32 0, i32* %j, align 4
  br label %for.cond206

for.cond206:                                      ; preds = %for.inc218, %update_weights_loop11_1
  %165 = load i32, i32* %j, align 4
  %cmp207 = icmp slt i32 %165, 3
  br i1 %cmp207, label %for.body208, label %for.end220

for.body208:                                      ; preds = %for.cond206
  %166 = load double*, double** %weights3.addr, align 8
  %167 = load i32, i32* %i, align 4
  %mul209 = mul nsw i32 %167, 3
  %168 = load i32, i32* %j, align 4
  %add210 = add nsw i32 %mul209, %168
  %idxprom211 = sext i32 %add210 to i64
  %arrayidx212 = getelementptr inbounds double, double* %166, i64 %idxprom211
  %169 = load double, double* %arrayidx212, align 8
  %170 = load double, double* %norm, align 8
  %div213 = fdiv double %169, %170
  %171 = load double*, double** %weights3.addr, align 8
  %172 = load i32, i32* %i, align 4
  %mul214 = mul nsw i32 %172, 3
  %173 = load i32, i32* %j, align 4
  %add215 = add nsw i32 %mul214, %173
  %idxprom216 = sext i32 %add215 to i64
  %arrayidx217 = getelementptr inbounds double, double* %171, i64 %idxprom216
  store double %div213, double* %arrayidx217, align 8
  br label %for.inc218

for.inc218:                                       ; preds = %for.body208
  %174 = load i32, i32* %j, align 4
  %inc219 = add nsw i32 %174, 1
  store i32 %inc219, i32* %j, align 4
  br label %for.cond206, !llvm.loop !186

for.end220:                                       ; preds = %for.cond206
  br label %for.inc221

for.inc221:                                       ; preds = %for.end220
  %175 = load i32, i32* %i, align 4
  %inc222 = add nsw i32 %175, 1
  store i32 %inc222, i32* %i, align 4
  br label %for.cond203, !llvm.loop !188

for.end223:                                       ; preds = %for.cond203
  br label %update_weights_loop12

update_weights_loop12:                            ; preds = %for.end223
  store i32 0, i32* %i, align 4
  br label %for.cond224

for.cond224:                                      ; preds = %for.inc232, %update_weights_loop12
  %176 = load i32, i32* %i, align 4
  %cmp225 = icmp slt i32 %176, 3
  br i1 %cmp225, label %for.body226, label %for.end234

for.body226:                                      ; preds = %for.cond224
  %177 = load double*, double** %biases3.addr, align 8
  %178 = load i32, i32* %i, align 4
  %idxprom227 = sext i32 %178 to i64
  %arrayidx228 = getelementptr inbounds double, double* %177, i64 %idxprom227
  %179 = load double, double* %arrayidx228, align 8
  %180 = load double, double* %bias_norm, align 8
  %div229 = fdiv double %179, %180
  %181 = load double*, double** %biases3.addr, align 8
  %182 = load i32, i32* %i, align 4
  %idxprom230 = sext i32 %182 to i64
  %arrayidx231 = getelementptr inbounds double, double* %181, i64 %idxprom230
  store double %div229, double* %arrayidx231, align 8
  br label %for.inc232

for.inc232:                                       ; preds = %for.body226
  %183 = load i32, i32* %i, align 4
  %inc233 = add nsw i32 %183, 1
  store i32 %inc233, i32* %i, align 4
  br label %for.cond224, !llvm.loop !190

for.end234:                                       ; preds = %for.cond224
  %184 = bitcast double* %bias_norm to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %184) #4
  %185 = bitcast double* %norm to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %185) #4
  %186 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %186) #4
  %187 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %187) #4
  ret void
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.sqrt.f64(double) #1

; Function Attrs: noinline nounwind
define void @backprop(double* "fpga.decayed.dim.hint"="832" %weights1, double* "fpga.decayed.dim.hint"="4096" %weights2, double* "fpga.decayed.dim.hint"="192" %weights3, double* "fpga.decayed.dim.hint"="64" %biases1, double* "fpga.decayed.dim.hint"="64" %biases2, double* "fpga.decayed.dim.hint"="3" %biases3, double* "fpga.decayed.dim.hint"="2119" %training_data, double* "fpga.decayed.dim.hint"="489" %training_targets) #3 !fpga.function.pragma !192 {
entry:
  %weights1.addr = alloca double*, align 8
  %weights2.addr = alloca double*, align 8
  %weights3.addr = alloca double*, align 8
  %biases1.addr = alloca double*, align 8
  %biases2.addr = alloca double*, align 8
  %biases3.addr = alloca double*, align 8
  %training_data.addr = alloca double*, align 8
  %training_targets.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %activations1 = alloca [64 x double], align 8
  %activations2 = alloca [64 x double], align 8
  %activations3 = alloca [3 x double], align 8
  %dactivations1 = alloca [64 x double], align 8
  %dactivations2 = alloca [64 x double], align 8
  %dactivations3 = alloca [3 x double], align 8
  %net_outputs = alloca [3 x double], align 8
  %output_difference = alloca [3 x double], align 8
  %delta_weights1 = alloca [832 x double], align 8
  %delta_weights2 = alloca [4096 x double], align 8
  %delta_weights3 = alloca [192 x double], align 8
  %oracle_activations1 = alloca [64 x double], align 8
  %oracle_activations2 = alloca [64 x double], align 8
  store double* %weights1, double** %weights1.addr, align 8
  store double* %weights2, double** %weights2.addr, align 8
  store double* %weights3, double** %weights3.addr, align 8
  store double* %biases1, double** %biases1.addr, align 8
  store double* %biases2, double** %biases2.addr, align 8
  store double* %biases3, double** %biases3.addr, align 8
  store double* %training_data, double** %training_data.addr, align 8
  store double* %training_targets, double** %training_targets.addr, align 8
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #4
  %1 = bitcast i32* %j to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #4
  %2 = bitcast [64 x double]* %activations1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 512, i8* %2) #4
  %3 = bitcast [64 x double]* %activations2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 512, i8* %3) #4
  %4 = bitcast [3 x double]* %activations3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* %4) #4
  %5 = bitcast [64 x double]* %dactivations1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 512, i8* %5) #4
  %6 = bitcast [64 x double]* %dactivations2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 512, i8* %6) #4
  %7 = bitcast [3 x double]* %dactivations3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* %7) #4
  %8 = bitcast [3 x double]* %net_outputs to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* %8) #4
  %9 = bitcast [3 x double]* %output_difference to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* %9) #4
  %10 = bitcast [832 x double]* %delta_weights1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 6656, i8* %10) #4
  %11 = bitcast [4096 x double]* %delta_weights2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32768, i8* %11) #4
  %12 = bitcast [192 x double]* %delta_weights3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 1536, i8* %12) #4
  %13 = bitcast [64 x double]* %oracle_activations1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 512, i8* %13) #4
  %14 = bitcast [64 x double]* %oracle_activations2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 512, i8* %14) #4
  br label %backprop_loop1

backprop_loop1:                                   ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc52, %backprop_loop1
  %15 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %15, 163
  br i1 %cmp, label %for.body, label %for.end54

for.body:                                         ; preds = %for.cond
  br label %backprop_loop1_1

backprop_loop1_1:                                 ; preds = %for.body
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %backprop_loop1_1
  %16 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %16, 64
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %17 = load i32, i32* %j, align 4
  %idxprom = sext i32 %17 to i64
  %arrayidx = getelementptr inbounds [64 x double], [64 x double]* %activations1, i64 0, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8
  %18 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %18 to i64
  %arrayidx5 = getelementptr inbounds [64 x double], [64 x double]* %activations2, i64 0, i64 %idxprom4
  store double 0.000000e+00, double* %arrayidx5, align 8
  %19 = load i32, i32* %j, align 4
  %cmp6 = icmp slt i32 %19, 3
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %20 = load i32, i32* %j, align 4
  %idxprom7 = sext i32 %20 to i64
  %arrayidx8 = getelementptr inbounds [3 x double], [3 x double]* %activations3, i64 0, i64 %idxprom7
  store double 0.000000e+00, double* %arrayidx8, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %21 = load i32, i32* %j, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1, !llvm.loop !204

for.end:                                          ; preds = %for.cond1
  %22 = load double*, double** %biases1.addr, align 8
  %23 = load double*, double** %weights1.addr, align 8
  %arraydecay = getelementptr inbounds [64 x double], [64 x double]* %activations1, i32 0, i32 0
  %24 = load double*, double** %training_data.addr, align 8
  %25 = load i32, i32* %i, align 4
  %mul = mul nsw i32 %25, 13
  %idxprom9 = sext i32 %mul to i64
  %arrayidx10 = getelementptr inbounds double, double* %24, i64 %idxprom9
  call void @matrix_vector_product_with_bias_input_layer(double* %22, double* %23, double* %arraydecay, double* %arrayidx10)
  %arraydecay11 = getelementptr inbounds [64 x double], [64 x double]* %activations1, i32 0, i32 0
  %arraydecay12 = getelementptr inbounds [64 x double], [64 x double]* %dactivations1, i32 0, i32 0
  call void @RELU(double* %arraydecay11, double* %arraydecay12, i32 64)
  %26 = load double*, double** %biases2.addr, align 8
  %27 = load double*, double** %weights2.addr, align 8
  %arraydecay13 = getelementptr inbounds [64 x double], [64 x double]* %activations2, i32 0, i32 0
  %arraydecay14 = getelementptr inbounds [64 x double], [64 x double]* %activations1, i32 0, i32 0
  call void @matrix_vector_product_with_bias_second_layer(double* %26, double* %27, double* %arraydecay13, double* %arraydecay14)
  %arraydecay15 = getelementptr inbounds [64 x double], [64 x double]* %activations2, i32 0, i32 0
  %arraydecay16 = getelementptr inbounds [64 x double], [64 x double]* %dactivations2, i32 0, i32 0
  call void @RELU(double* %arraydecay15, double* %arraydecay16, i32 64)
  %28 = load double*, double** %biases3.addr, align 8
  %29 = load double*, double** %weights3.addr, align 8
  %arraydecay17 = getelementptr inbounds [3 x double], [3 x double]* %activations3, i32 0, i32 0
  %arraydecay18 = getelementptr inbounds [64 x double], [64 x double]* %activations2, i32 0, i32 0
  call void @matrix_vector_product_with_bias_output_layer(double* %28, double* %29, double* %arraydecay17, double* %arraydecay18)
  %arraydecay19 = getelementptr inbounds [3 x double], [3 x double]* %activations3, i32 0, i32 0
  %arraydecay20 = getelementptr inbounds [3 x double], [3 x double]* %dactivations3, i32 0, i32 0
  call void @RELU(double* %arraydecay19, double* %arraydecay20, i32 3)
  %arraydecay21 = getelementptr inbounds [3 x double], [3 x double]* %net_outputs, i32 0, i32 0
  %arraydecay22 = getelementptr inbounds [3 x double], [3 x double]* %activations3, i32 0, i32 0
  call void @soft_max(double* %arraydecay21, double* %arraydecay22)
  %arraydecay23 = getelementptr inbounds [3 x double], [3 x double]* %net_outputs, i32 0, i32 0
  %30 = load double*, double** %training_targets.addr, align 8
  %31 = load i32, i32* %i, align 4
  %mul24 = mul nsw i32 %31, 3
  %idxprom25 = sext i32 %mul24 to i64
  %arrayidx26 = getelementptr inbounds double, double* %30, i64 %idxprom25
  %arraydecay27 = getelementptr inbounds [3 x double], [3 x double]* %output_difference, i32 0, i32 0
  %arraydecay28 = getelementptr inbounds [3 x double], [3 x double]* %dactivations3, i32 0, i32 0
  call void @take_difference(double* %arraydecay23, double* %arrayidx26, double* %arraydecay27, double* %arraydecay28)
  %arraydecay29 = getelementptr inbounds [192 x double], [192 x double]* %delta_weights3, i32 0, i32 0
  %arraydecay30 = getelementptr inbounds [3 x double], [3 x double]* %output_difference, i32 0, i32 0
  %arraydecay31 = getelementptr inbounds [64 x double], [64 x double]* %activations2, i32 0, i32 0
  call void @get_delta_matrix_weights3(double* %arraydecay29, double* %arraydecay30, double* %arraydecay31)
  %32 = load double*, double** %weights3.addr, align 8
  %arraydecay32 = getelementptr inbounds [3 x double], [3 x double]* %output_difference, i32 0, i32 0
  %arraydecay33 = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations2, i32 0, i32 0
  %arraydecay34 = getelementptr inbounds [64 x double], [64 x double]* %dactivations2, i32 0, i32 0
  call void @get_oracle_activations2(double* %32, double* %arraydecay32, double* %arraydecay33, double* %arraydecay34)
  %arraydecay35 = getelementptr inbounds [4096 x double], [4096 x double]* %delta_weights2, i32 0, i32 0
  %arraydecay36 = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations2, i32 0, i32 0
  %arraydecay37 = getelementptr inbounds [64 x double], [64 x double]* %activations1, i32 0, i32 0
  call void @get_delta_matrix_weights2(double* %arraydecay35, double* %arraydecay36, double* %arraydecay37)
  %33 = load double*, double** %weights2.addr, align 8
  %arraydecay38 = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations2, i32 0, i32 0
  %arraydecay39 = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations1, i32 0, i32 0
  %arraydecay40 = getelementptr inbounds [64 x double], [64 x double]* %dactivations1, i32 0, i32 0
  call void @get_oracle_activations1(double* %33, double* %arraydecay38, double* %arraydecay39, double* %arraydecay40)
  %arraydecay41 = getelementptr inbounds [832 x double], [832 x double]* %delta_weights1, i32 0, i32 0
  %arraydecay42 = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations1, i32 0, i32 0
  %34 = load double*, double** %training_data.addr, align 8
  %35 = load i32, i32* %i, align 4
  %mul43 = mul nsw i32 %35, 13
  %idxprom44 = sext i32 %mul43 to i64
  %arrayidx45 = getelementptr inbounds double, double* %34, i64 %idxprom44
  call void @get_delta_matrix_weights1(double* %arraydecay41, double* %arraydecay42, double* %arrayidx45)
  %36 = load double*, double** %weights1.addr, align 8
  %37 = load double*, double** %weights2.addr, align 8
  %38 = load double*, double** %weights3.addr, align 8
  %arraydecay46 = getelementptr inbounds [832 x double], [832 x double]* %delta_weights1, i32 0, i32 0
  %arraydecay47 = getelementptr inbounds [4096 x double], [4096 x double]* %delta_weights2, i32 0, i32 0
  %arraydecay48 = getelementptr inbounds [192 x double], [192 x double]* %delta_weights3, i32 0, i32 0
  %39 = load double*, double** %biases1.addr, align 8
  %40 = load double*, double** %biases2.addr, align 8
  %41 = load double*, double** %biases3.addr, align 8
  %arraydecay49 = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations1, i32 0, i32 0
  %arraydecay50 = getelementptr inbounds [64 x double], [64 x double]* %oracle_activations2, i32 0, i32 0
  %arraydecay51 = getelementptr inbounds [3 x double], [3 x double]* %output_difference, i32 0, i32 0
  call void @update_weights(double* %36, double* %37, double* %38, double* %arraydecay46, double* %arraydecay47, double* %arraydecay48, double* %39, double* %40, double* %41, double* %arraydecay49, double* %arraydecay50, double* %arraydecay51)
  br label %for.inc52

for.inc52:                                        ; preds = %for.end
  %42 = load i32, i32* %i, align 4
  %inc53 = add nsw i32 %42, 1
  store i32 %inc53, i32* %i, align 4
  br label %for.cond, !llvm.loop !206

for.end54:                                        ; preds = %for.cond
  %43 = bitcast [64 x double]* %oracle_activations2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 512, i8* %43) #4
  %44 = bitcast [64 x double]* %oracle_activations1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 512, i8* %44) #4
  %45 = bitcast [192 x double]* %delta_weights3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 1536, i8* %45) #4
  %46 = bitcast [4096 x double]* %delta_weights2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 32768, i8* %46) #4
  %47 = bitcast [832 x double]* %delta_weights1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 6656, i8* %47) #4
  %48 = bitcast [3 x double]* %output_difference to i8*
  call void @llvm.lifetime.end.p0i8(i64 24, i8* %48) #4
  %49 = bitcast [3 x double]* %net_outputs to i8*
  call void @llvm.lifetime.end.p0i8(i64 24, i8* %49) #4
  %50 = bitcast [3 x double]* %dactivations3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 24, i8* %50) #4
  %51 = bitcast [64 x double]* %dactivations2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 512, i8* %51) #4
  %52 = bitcast [64 x double]* %dactivations1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 512, i8* %52) #4
  %53 = bitcast [3 x double]* %activations3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 24, i8* %53) #4
  %54 = bitcast [64 x double]* %activations2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 512, i8* %54) #4
  %55 = bitcast [64 x double]* %activations1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 512, i8* %55) #4
  %56 = bitcast i32* %j to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %56) #4
  %57 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %57) #4
  ret void
}

attributes #0 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.static.pipeline"="0.-1" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.static.pipeline"="0.-1" "fpga.top.func"="backprop" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{!5, !19}
!5 = !{!"fpga.inline", !"user", !6}
!6 = !DILocation(line: 57, column: 9, scope: !7)
!7 = !DILexicalBlockFile(scope: !9, file: !8, discriminator: 0)
!8 = !DIFile(filename: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/backprop.tcl", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS")
!9 = distinct !DISubprogram(name: "soft_max", scope: !10, file: !10, line: 16, type: !11, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !17)
!10 = !DIFile(filename: "data/benchmarks/backprop/backprop.c", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!15 = distinct !DICompileUnit(language: DW_LANG_C99, file: !16, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !17, retainedTypes: !18)
!16 = !DIFile(filename: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_solutions/BACKPROP/solution0/.autopilot/db/backprop.pp.0.c", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS")
!17 = !{}
!18 = !{!14}
!19 = !{!"fpga.static.pipeline", !"user", !20}
!20 = !DILocation(line: 43, column: 9, scope: !7)
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.name", !"soft_max_loop1"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.name", !"soft_max_loop2"}
!25 = !{!26, !33}
!26 = !{!"fpga.inline", !"user", !27}
!27 = !DILocation(line: 58, column: 9, scope: !28)
!28 = !DILexicalBlockFile(scope: !29, file: !8, discriminator: 0)
!29 = distinct !DISubprogram(name: "RELU", scope: !10, file: !10, line: 33, type: !30, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !17)
!30 = !DISubroutineType(types: !31)
!31 = !{null, !13, !13, !32}
!32 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!33 = !{!"fpga.static.pipeline", !"user", !34}
!34 = !DILocation(line: 44, column: 9, scope: !28)
!35 = distinct !{!35, !36}
!36 = !{!"llvm.loop.name", !"RELU_loop1"}
!37 = !{!38, !42}
!38 = !{!"fpga.inline", !"user", !39}
!39 = !DILocation(line: 59, column: 9, scope: !40)
!40 = !DILexicalBlockFile(scope: !41, file: !8, discriminator: 0)
!41 = distinct !DISubprogram(name: "add_bias_to_activations", scope: !10, file: !10, line: 43, type: !30, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !17)
!42 = !{!"fpga.static.pipeline", !"user", !43}
!43 = !DILocation(line: 45, column: 9, scope: !40)
!44 = distinct !{!44, !45}
!45 = !{!"llvm.loop.name", !"add_bias_to_activations_loop1"}
!46 = !{!47, !53}
!47 = !{!"fpga.inline", !"user", !48}
!48 = !DILocation(line: 62, column: 9, scope: !49)
!49 = !DILexicalBlockFile(scope: !50, file: !8, discriminator: 0)
!50 = distinct !DISubprogram(name: "matrix_vector_product_with_bias_input_layer", scope: !10, file: !10, line: 54, type: !51, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !17)
!51 = !DISubroutineType(types: !52)
!52 = !{null, !13, !13, !13, !13}
!53 = !{!"fpga.static.pipeline", !"user", !54}
!54 = !DILocation(line: 46, column: 9, scope: !49)
!55 = distinct !{!55, !56}
!56 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_input_layer_loop1_1"}
!57 = distinct !{!57, !58}
!58 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_input_layer_loop1"}
!59 = !{!60, !64}
!60 = !{!"fpga.inline", !"user", !61}
!61 = !DILocation(line: 63, column: 9, scope: !62)
!62 = !DILexicalBlockFile(scope: !63, file: !8, discriminator: 0)
!63 = distinct !DISubprogram(name: "matrix_vector_product_with_bias_second_layer", scope: !10, file: !10, line: 72, type: !51, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !17)
!64 = !{!"fpga.static.pipeline", !"user", !65}
!65 = !DILocation(line: 47, column: 9, scope: !62)
!66 = distinct !{!66, !67}
!67 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_second_layer_loop1_1"}
!68 = distinct !{!68, !69}
!69 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_second_layer_loop1"}
!70 = !{!71, !75}
!71 = !{!"fpga.inline", !"user", !72}
!72 = !DILocation(line: 64, column: 9, scope: !73)
!73 = !DILexicalBlockFile(scope: !74, file: !8, discriminator: 0)
!74 = distinct !DISubprogram(name: "matrix_vector_product_with_bias_output_layer", scope: !10, file: !10, line: 90, type: !51, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !17)
!75 = !{!"fpga.static.pipeline", !"user", !76}
!76 = !DILocation(line: 48, column: 9, scope: !73)
!77 = distinct !{!77, !78}
!78 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_output_layer_loop1_1"}
!79 = distinct !{!79, !80}
!80 = !{!"llvm.loop.name", !"matrix_vector_product_with_bias_output_layer_loop1"}
!81 = !{!82, !86}
!82 = !{!"fpga.inline", !"user", !83}
!83 = !DILocation(line: 60, column: 9, scope: !84)
!84 = !DILexicalBlockFile(scope: !85, file: !8, discriminator: 0)
!85 = distinct !DISubprogram(name: "take_difference", scope: !10, file: !10, line: 108, type: !51, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !17)
!86 = !{!"fpga.static.pipeline", !"user", !87}
!87 = !DILocation(line: 49, column: 9, scope: !84)
!88 = distinct !{!88, !89}
!89 = !{!"llvm.loop.name", !"take_difference_loop1"}
!90 = !{!91, !97}
!91 = !{!"fpga.inline", !"user", !92}
!92 = !DILocation(line: 67, column: 9, scope: !93)
!93 = !DILexicalBlockFile(scope: !94, file: !8, discriminator: 0)
!94 = distinct !DISubprogram(name: "get_delta_matrix_weights3", scope: !10, file: !10, line: 120, type: !95, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !17)
!95 = !DISubroutineType(types: !96)
!96 = !{null, !13, !13, !13}
!97 = !{!"fpga.static.pipeline", !"user", !98}
!98 = !DILocation(line: 52, column: 9, scope: !93)
!99 = distinct !{!99, !100}
!100 = !{!"llvm.loop.name", !"get_delta_matrix_weights3_loop1_1"}
!101 = distinct !{!101, !102}
!102 = !{!"llvm.loop.name", !"get_delta_matrix_weights3_loop1"}
!103 = !{!104, !108}
!104 = !{!"fpga.inline", !"user", !105}
!105 = !DILocation(line: 69, column: 9, scope: !106)
!106 = !DILexicalBlockFile(scope: !107, file: !8, discriminator: 0)
!107 = distinct !DISubprogram(name: "get_oracle_activations2", scope: !10, file: !10, line: 135, type: !51, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !17)
!108 = !{!"fpga.static.pipeline", !"user", !109}
!109 = !DILocation(line: 54, column: 9, scope: !106)
!110 = distinct !{!110, !111}
!111 = !{!"llvm.loop.name", !"get_oracle_activations2_loop1_1"}
!112 = distinct !{!112, !113}
!113 = !{!"llvm.loop.name", !"get_oracle_activations2_loop1"}
!114 = !{!115, !119}
!115 = !{!"fpga.inline", !"user", !116}
!116 = !DILocation(line: 66, column: 9, scope: !117)
!117 = !DILexicalBlockFile(scope: !118, file: !8, discriminator: 0)
!118 = distinct !DISubprogram(name: "get_delta_matrix_weights2", scope: !10, file: !10, line: 153, type: !95, scopeLine: 155, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !17)
!119 = !{!"fpga.static.pipeline", !"user", !120}
!120 = !DILocation(line: 51, column: 9, scope: !117)
!121 = distinct !{!121, !122}
!122 = !{!"llvm.loop.name", !"get_delta_matrix_weights2_loop1_1"}
!123 = distinct !{!123, !124}
!124 = !{!"llvm.loop.name", !"get_delta_matrix_weights2_loop1"}
!125 = !{!126, !130}
!126 = !{!"fpga.inline", !"user", !127}
!127 = !DILocation(line: 68, column: 9, scope: !128)
!128 = !DILexicalBlockFile(scope: !129, file: !8, discriminator: 0)
!129 = distinct !DISubprogram(name: "get_oracle_activations1", scope: !10, file: !10, line: 168, type: !51, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !17)
!130 = !{!"fpga.static.pipeline", !"user", !131}
!131 = !DILocation(line: 53, column: 9, scope: !128)
!132 = distinct !{!132, !133}
!133 = !{!"llvm.loop.name", !"get_oracle_activations1_loop1_1"}
!134 = distinct !{!134, !135}
!135 = !{!"llvm.loop.name", !"get_oracle_activations1_loop1"}
!136 = !{!137, !141}
!137 = !{!"fpga.inline", !"user", !138}
!138 = !DILocation(line: 65, column: 9, scope: !139)
!139 = !DILexicalBlockFile(scope: !140, file: !8, discriminator: 0)
!140 = distinct !DISubprogram(name: "get_delta_matrix_weights1", scope: !10, file: !10, line: 186, type: !95, scopeLine: 188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !17)
!141 = !{!"fpga.static.pipeline", !"user", !142}
!142 = !DILocation(line: 50, column: 9, scope: !139)
!143 = distinct !{!143, !144}
!144 = !{!"llvm.loop.name", !"get_delta_matrix_weights1_loop1_1"}
!145 = distinct !{!145, !146}
!146 = !{!"llvm.loop.name", !"get_delta_matrix_weights1_loop1"}
!147 = !{!148, !154}
!148 = !{!"fpga.inline", !"user", !149}
!149 = !DILocation(line: 61, column: 9, scope: !150)
!150 = !DILexicalBlockFile(scope: !151, file: !8, discriminator: 0)
!151 = distinct !DISubprogram(name: "update_weights", scope: !10, file: !10, line: 201, type: !152, scopeLine: 212, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !17)
!152 = !DISubroutineType(types: !153)
!153 = !{null, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13, !13}
!154 = !{!"fpga.static.pipeline", !"user", !155}
!155 = !DILocation(line: 55, column: 9, scope: !150)
!156 = distinct !{!156, !157}
!157 = !{!"llvm.loop.name", !"update_weights_loop1_1"}
!158 = distinct !{!158, !159}
!159 = !{!"llvm.loop.name", !"update_weights_loop1"}
!160 = distinct !{!160, !161}
!161 = !{!"llvm.loop.name", !"update_weights_loop2"}
!162 = distinct !{!162, !163}
!163 = !{!"llvm.loop.name", !"update_weights_loop3_1"}
!164 = distinct !{!164, !165}
!165 = !{!"llvm.loop.name", !"update_weights_loop3"}
!166 = distinct !{!166, !167}
!167 = !{!"llvm.loop.name", !"update_weights_loop4"}
!168 = distinct !{!168, !169}
!169 = !{!"llvm.loop.name", !"update_weights_loop5_1"}
!170 = distinct !{!170, !171}
!171 = !{!"llvm.loop.name", !"update_weights_loop5"}
!172 = distinct !{!172, !173}
!173 = !{!"llvm.loop.name", !"update_weights_loop6"}
!174 = distinct !{!174, !175}
!175 = !{!"llvm.loop.name", !"update_weights_loop7_1"}
!176 = distinct !{!176, !177}
!177 = !{!"llvm.loop.name", !"update_weights_loop7"}
!178 = distinct !{!178, !179}
!179 = !{!"llvm.loop.name", !"update_weights_loop8"}
!180 = distinct !{!180, !181}
!181 = !{!"llvm.loop.name", !"update_weights_loop9_1"}
!182 = distinct !{!182, !183}
!183 = !{!"llvm.loop.name", !"update_weights_loop9"}
!184 = distinct !{!184, !185}
!185 = !{!"llvm.loop.name", !"update_weights_loop10"}
!186 = distinct !{!186, !187}
!187 = !{!"llvm.loop.name", !"update_weights_loop11_1"}
!188 = distinct !{!188, !189}
!189 = !{!"llvm.loop.name", !"update_weights_loop11"}
!190 = distinct !{!190, !191}
!191 = !{!"llvm.loop.name", !"update_weights_loop12"}
!192 = !{!193, !199, !201}
!193 = !{!"fpga.inline", !"user", !194}
!194 = !DILocation(line: 56, column: 9, scope: !195)
!195 = !DILexicalBlockFile(scope: !196, file: !8, discriminator: 0)
!196 = distinct !DISubprogram(name: "backprop", scope: !10, file: !10, line: 330, type: !197, scopeLine: 337, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !17)
!197 = !DISubroutineType(types: !198)
!198 = !{null, !13, !13, !13, !13, !13, !13, !13, !13}
!199 = !{!"fpga.static.pipeline", !"user", !200}
!200 = !DILocation(line: 42, column: 9, scope: !195)
!201 = !{!"fpga.top", !"user", !202}
!202 = !DILocation(line: 330, column: 16, scope: !203)
!203 = !DILexicalBlockFile(scope: !196, file: !10, discriminator: 0)
!204 = distinct !{!204, !205}
!205 = !{!"llvm.loop.name", !"backprop_loop1_1"}
!206 = distinct !{!206, !207}
!207 = !{!"llvm.loop.name", !"backprop_loop1"}
