; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdout = external global %struct._IO_FILE*, align 8
@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: noinline norecurse optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %data_points = alloca float*, align 8
  %labels = alloca i8*, align 8
  %param_vector = alloca float*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  call void @setbuf(%struct._IO_FILE* %0, i8* null) #12
  %call = call i8* @_Znam(i64 20480000) #13
  %1 = bitcast i8* %call to float*
  store float* %1, float** %data_points, align 8
  %call1 = call i8* @_Znam(i64 5000) #13
  store i8* %call1, i8** %labels, align 8
  %call2 = call i8* @_Znam(i64 4096) #13
  %2 = bitcast i8* %call2 to float*
  store float* %2, float** %param_vector, align 8
  %3 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %3, i64 1
  %4 = load i8*, i8** %arrayidx, align 8
  %5 = load i8**, i8*** %argv.addr, align 8
  %arrayidx3 = getelementptr inbounds i8*, i8** %5, i64 2
  %6 = load i8*, i8** %arrayidx3, align 8
  %7 = load float*, float** %data_points, align 8
  %8 = load i8*, i8** %labels, align 8
  call void @populateInput(i8* %4, i8* %6, float* %7, i8* %8)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %9, 1024
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load float*, float** %param_vector, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom = sext i32 %11 to i64
  %arrayidx4 = getelementptr inbounds float, float* %10, i64 %idxprom
  store float 0.000000e+00, float* %arrayidx4, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %13 = load float*, float** %data_points, align 8
  %14 = load i8*, i8** %labels, align 8
  %15 = load float*, float** %param_vector, align 8
  call void @_Z5SgdLRPfPhS_(float* %13, i8* %14, float* %15)
  %16 = load float*, float** %param_vector, align 8
  %17 = load float*, float** %data_points, align 8
  %18 = load i8*, i8** %labels, align 8
  %19 = load i8**, i8*** %argv.addr, align 8
  %arrayidx5 = getelementptr inbounds i8*, i8** %19, i64 3
  %20 = load i8*, i8** %arrayidx5, align 8
  call void @populateOutput(float* %16, float* %17, i8* %18, i8* %20)
  %21 = load float*, float** %data_points, align 8
  %isnull = icmp eq float* %21, null
  br i1 %isnull, label %delete.end, label %delete.notnull

delete.notnull:                                   ; preds = %for.end
  %22 = bitcast float* %21 to i8*
  call void @_ZdaPv(i8* %22) #14
  br label %delete.end

delete.end:                                       ; preds = %delete.notnull, %for.end
  %23 = load i8*, i8** %labels, align 8
  %isnull6 = icmp eq i8* %23, null
  br i1 %isnull6, label %delete.end8, label %delete.notnull7

delete.notnull7:                                  ; preds = %delete.end
  call void @_ZdaPv(i8* %23) #14
  br label %delete.end8

delete.end8:                                      ; preds = %delete.notnull7, %delete.end
  %24 = load float*, float** %param_vector, align 8
  %isnull9 = icmp eq float* %24, null
  br i1 %isnull9, label %delete.end11, label %delete.notnull10

delete.notnull10:                                 ; preds = %delete.end8
  %25 = bitcast float* %24 to i8*
  call void @_ZdaPv(i8* %25) #14
  br label %delete.end11

delete.end11:                                     ; preds = %delete.notnull10, %delete.end8
  ret i32 0
}

; Function Attrs: nounwind
declare void @setbuf(%struct._IO_FILE*, i8*) #1

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #2

declare void @populateInput(i8*, i8*, float*, i8*) #3

declare void @populateOutput(float*, float*, i8*, i8*) #3

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #4

; Function Attrs: nounwind
define float @_Z10dotProductPfS_(float* "fpga.decayed.dim.hint"="1024" %param, float* "fpga.decayed.dim.hint"="1024" %feature) #5 {
entry:
  %param.addr = alloca float*, align 8
  %feature.addr = alloca float*, align 8
  %result = alloca float, align 4
  %i = alloca i32, align 4
  store float* %param, float** %param.addr, align 8
  store float* %feature, float** %feature.addr, align 8
  %0 = bitcast float* %result to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #12
  store float 0.000000e+00, float* %result, align 4
  br label %DOT

DOT:                                              ; preds = %entry
  %1 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #12
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %DOT
  %2 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %2, 1024
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  %3 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %3) #12
  br label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load float*, float** %param.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom
  %6 = load float, float* %arrayidx, align 4
  %7 = load float*, float** %feature.addr, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %8 to i64
  %arrayidx2 = getelementptr inbounds float, float* %7, i64 %idxprom1
  %9 = load float, float* %arrayidx2, align 4
  %mul = fmul float %6, %9
  %10 = load float, float* %result, align 4
  %add = fadd float %10, %mul
  store float %add, float* %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4
  %inc = add i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond.cleanup
  %12 = load float, float* %result, align 4
  %13 = bitcast float* %result to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #12
  ret float %12
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #6

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #6

; Function Attrs: nounwind
define float @_Z7Sigmoidf(float %exponent) #7 {
entry:
  %exponent.addr = alloca float, align 4
  store float %exponent, float* %exponent.addr, align 4
  %0 = load float, float* %exponent.addr, align 4
  %sub = fsub float -0.000000e+00, %0
  %1 = call float @llvm.exp.f32(float %sub)
  %add = fadd float 1.000000e+00, %1
  %div = fdiv float 1.000000e+00, %add
  ret float %div
}

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.exp.f32(float) #8

; Function Attrs: nounwind
define void @_Z15computeGradientPfS_f(float* "fpga.decayed.dim.hint"="1024" %grad, float* "fpga.decayed.dim.hint"="1024" %feature, float %scale) #9 {
entry:
  %grad.addr = alloca float*, align 8
  %feature.addr = alloca float*, align 8
  %scale.addr = alloca float, align 4
  %i = alloca i32, align 4
  store float* %grad, float** %grad.addr, align 8
  store float* %feature, float** %feature.addr, align 8
  store float %scale, float* %scale.addr, align 4
  br label %GRAD

GRAD:                                             ; preds = %entry
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #12
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %GRAD
  %1 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %1, 1024
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  %2 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %2) #12
  br label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load float, float* %scale.addr, align 4
  %4 = load float*, float** %feature.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom
  %6 = load float, float* %arrayidx, align 4
  %mul = fmul float %3, %6
  %7 = load float*, float** %grad.addr, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %8 to i64
  %arrayidx2 = getelementptr inbounds float, float* %7, i64 %idxprom1
  store float %mul, float* %arrayidx2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond.cleanup
  ret void
}

; Function Attrs: nounwind
define void @_Z15updateParameterPfS_f(float* "fpga.decayed.dim.hint"="1024" %param, float* "fpga.decayed.dim.hint"="1024" %grad, float %scale) #10 {
entry:
  %param.addr = alloca float*, align 8
  %grad.addr = alloca float*, align 8
  %scale.addr = alloca float, align 4
  %i = alloca i32, align 4
  store float* %param, float** %param.addr, align 8
  store float* %grad, float** %grad.addr, align 8
  store float %scale, float* %scale.addr, align 4
  br label %UPDATE

UPDATE:                                           ; preds = %entry
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #12
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %UPDATE
  %1 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %1, 1024
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  %2 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %2) #12
  br label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load float, float* %scale.addr, align 4
  %4 = load float*, float** %grad.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom
  %6 = load float, float* %arrayidx, align 4
  %mul = fmul float %3, %6
  %7 = load float*, float** %param.addr, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %8 to i64
  %arrayidx2 = getelementptr inbounds float, float* %7, i64 %idxprom1
  %9 = load float, float* %arrayidx2, align 4
  %add = fadd float %9, %mul
  store float %add, float* %arrayidx2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc = add i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond.cleanup
  ret void
}

; Function Attrs: nounwind
define void @_Z5SgdLRPfPhS_(float* "fpga.decayed.dim.hint"="4608000" %data, i8* "fpga.decayed.dim.hint"="4500" %label, float* "fpga.decayed.dim.hint"="1024" %theta) #11 !fpga.function.pragma !10 {
entry:
  %data.addr = alloca float*, align 8
  %label.addr = alloca i8*, align 8
  %theta.addr = alloca float*, align 8
  %gradient = alloca [1024 x float], align 4
  %epoch = alloca i32, align 4
  %cleanup.dest.slot = alloca i32, align 4
  %training_id = alloca i32, align 4
  %dot = alloca float, align 4
  %prob = alloca float, align 4
  store float* %data, float** %data.addr, align 8
  store i8* %label, i8** %label.addr, align 8
  store float* %theta, float** %theta.addr, align 8
  %0 = bitcast [1024 x float]* %gradient to i8*
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* %0) #12
  br label %EPOCH

EPOCH:                                            ; preds = %entry
  %1 = bitcast i32* %epoch to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #12
  store i32 0, i32* %epoch, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc13, %EPOCH
  %2 = load i32, i32* %epoch, align 4
  %cmp = icmp slt i32 %2, 5
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 3, i32* %cleanup.dest.slot, align 4
  %3 = bitcast i32* %epoch to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %3) #12
  br label %for.end15

for.body:                                         ; preds = %for.cond
  br label %TRAINING_INST

TRAINING_INST:                                    ; preds = %for.body
  %4 = bitcast i32* %training_id to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #12
  store i32 0, i32* %training_id, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %TRAINING_INST
  %5 = load i32, i32* %training_id, align 4
  %cmp2 = icmp slt i32 %5, 4500
  br i1 %cmp2, label %for.body4, label %for.cond.cleanup3

for.cond.cleanup3:                                ; preds = %for.cond1
  store i32 7, i32* %cleanup.dest.slot, align 4
  %6 = bitcast i32* %training_id to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #12
  br label %for.end

for.body4:                                        ; preds = %for.cond1
  %7 = bitcast float* %dot to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #12
  %8 = load float*, float** %theta.addr, align 8
  %9 = load float*, float** %data.addr, align 8
  %10 = load i32, i32* %training_id, align 4
  %mul = mul i32 1024, %10
  %idxprom = sext i32 %mul to i64
  %arrayidx = getelementptr inbounds float, float* %9, i64 %idxprom
  %call = call float @_Z10dotProductPfS_(float* %8, float* %arrayidx)
  store float %call, float* %dot, align 4
  %11 = bitcast float* %prob to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #12
  %12 = load float, float* %dot, align 4
  %call5 = call float @_Z7Sigmoidf(float %12)
  store float %call5, float* %prob, align 4
  %arraydecay = getelementptr inbounds [1024 x float], [1024 x float]* %gradient, i32 0, i32 0
  %13 = load float*, float** %data.addr, align 8
  %14 = load i32, i32* %training_id, align 4
  %mul6 = mul i32 1024, %14
  %idxprom7 = sext i32 %mul6 to i64
  %arrayidx8 = getelementptr inbounds float, float* %13, i64 %idxprom7
  %15 = load float, float* %prob, align 4
  %16 = load i8*, i8** %label.addr, align 8
  %17 = load i32, i32* %training_id, align 4
  %idxprom9 = sext i32 %17 to i64
  %arrayidx10 = getelementptr inbounds i8, i8* %16, i64 %idxprom9
  %18 = load i8, i8* %arrayidx10, align 1
  %conv = zext i8 %18 to i32
  %conv11 = sitofp i32 %conv to float
  %sub = fsub float %15, %conv11
  call void @_Z15computeGradientPfS_f(float* %arraydecay, float* %arrayidx8, float %sub)
  %19 = load float*, float** %theta.addr, align 8
  %arraydecay12 = getelementptr inbounds [1024 x float], [1024 x float]* %gradient, i32 0, i32 0
  call void @_Z15updateParameterPfS_f(float* %19, float* %arraydecay12, float -6.000000e+04)
  %20 = bitcast float* %prob to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #12
  %21 = bitcast float* %dot to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #12
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %22 = load i32, i32* %training_id, align 4
  %inc = add i32 %22, 1
  store i32 %inc, i32* %training_id, align 4
  br label %for.cond1, !llvm.loop !12

for.end:                                          ; preds = %for.cond.cleanup3
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %23 = load i32, i32* %epoch, align 4
  %inc14 = add i32 %23, 1
  store i32 %inc14, i32* %epoch, align 4
  br label %for.cond, !llvm.loop !14

for.end15:                                        ; preds = %for.cond.cleanup
  %24 = bitcast [1024 x float]* %gradient to i8*
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* %24) #12
  ret void
}

attributes #0 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="dotProduct" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn }
attributes #7 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="Sigmoid" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readnone speculatable willreturn }
attributes #9 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="computeGradient" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="updateParameter" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="SgdLR" "fpga.top.func"="SgdLR" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nounwind }
attributes #13 = { builtin }
attributes #14 = { builtin nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 2, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.name", !"DOT"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.name", !"GRAD"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.name", !"UPDATE"}
!10 = !{!11}
!11 = !{!"fpga.top", !"user"}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.name", !"TRAINING_INST"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.name", !"EPOCH"}
