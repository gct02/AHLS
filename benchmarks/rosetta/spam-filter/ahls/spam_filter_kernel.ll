; ModuleID = '<stdin>'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@llvm.global_ctors = appending global [0 x { i32, void ()*, i8* }] zeroinitializer

; Function Attrs: nounwind
define float @_Z10dotProductPfS_(float* "fpga.decayed.dim.hint"="1024" %param, float* "fpga.decayed.dim.hint"="1024" %feature) #0 !dbg !377 {
entry:
  %param.addr = alloca float*, align 8
  %feature.addr = alloca float*, align 8
  %result = alloca float, align 4
  %i = alloca i32, align 4
  store float* %param, float** %param.addr, align 8
  call void @llvm.dbg.declare(metadata float** %param.addr, metadata !385, metadata !DIExpression()), !dbg !386
  store float* %feature, float** %feature.addr, align 8
  call void @llvm.dbg.declare(metadata float** %feature.addr, metadata !387, metadata !DIExpression()), !dbg !388
  %0 = bitcast float* %result to i8*, !dbg !389
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #7, !dbg !389
  call void @llvm.dbg.declare(metadata float* %result, metadata !390, metadata !DIExpression()), !dbg !391
  store float 0.000000e+00, float* %result, align 4, !dbg !391
  br label %DOT, !dbg !389

DOT:                                              ; preds = %entry
  %1 = bitcast i32* %i to i8*, !dbg !392
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #7, !dbg !392
  call void @llvm.dbg.declare(metadata i32* %i, metadata !394, metadata !DIExpression()), !dbg !395
  store i32 0, i32* %i, align 4, !dbg !395
  br label %for.cond, !dbg !392

for.cond:                                         ; preds = %for.inc, %DOT
  %2 = load i32, i32* %i, align 4, !dbg !396
  %cmp = icmp slt i32 %2, 1024, !dbg !398
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !399

for.cond.cleanup:                                 ; preds = %for.cond
  %3 = bitcast i32* %i to i8*, !dbg !400
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %3) #7, !dbg !400
  br label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load float*, float** %param.addr, align 8, !dbg !401
  %5 = load i32, i32* %i, align 4, !dbg !402
  %idxprom = sext i32 %5 to i64, !dbg !401
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom, !dbg !401
  %6 = load float, float* %arrayidx, align 4, !dbg !401
  %7 = load float*, float** %feature.addr, align 8, !dbg !403
  %8 = load i32, i32* %i, align 4, !dbg !404
  %idxprom1 = sext i32 %8 to i64, !dbg !403
  %arrayidx2 = getelementptr inbounds float, float* %7, i64 %idxprom1, !dbg !403
  %9 = load float, float* %arrayidx2, align 4, !dbg !403
  %mul = fmul float %6, %9, !dbg !405
  %10 = load float, float* %result, align 4, !dbg !406
  %add = fadd float %10, %mul, !dbg !406
  store float %add, float* %result, align 4, !dbg !406
  br label %for.inc, !dbg !407

for.inc:                                          ; preds = %for.body
  %11 = load i32, i32* %i, align 4, !dbg !408
  %inc = add i32 %11, 1, !dbg !408
  store i32 %inc, i32* %i, align 4, !dbg !408
  br label %for.cond, !dbg !400, !llvm.loop !409

for.end:                                          ; preds = %for.cond.cleanup
  %12 = load float, float* %result, align 4, !dbg !412
  %13 = bitcast float* %result to i8*, !dbg !413
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #7, !dbg !413
  ret float %12, !dbg !414
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind
define float @_Z7Sigmoidf(float %exponent) #3 !dbg !415 {
entry:
  %exponent.addr = alloca float, align 4
  store float %exponent, float* %exponent.addr, align 4
  call void @llvm.dbg.declare(metadata float* %exponent.addr, metadata !418, metadata !DIExpression()), !dbg !419
  %0 = load float, float* %exponent.addr, align 4, !dbg !420
  %sub = fsub float -0.000000e+00, %0, !dbg !421
  %1 = call float @llvm.exp.f32(float %sub), !dbg !422
  %add = fadd float 1.000000e+00, %1, !dbg !423
  %div = fdiv float 1.000000e+00, %add, !dbg !424
  ret float %div, !dbg !425
}

; Function Attrs: nounwind readnone speculatable willreturn
declare float @llvm.exp.f32(float) #1

; Function Attrs: nounwind
define void @_Z15computeGradientPfS_f(float* "fpga.decayed.dim.hint"="1024" %grad, float* "fpga.decayed.dim.hint"="1024" %feature, float %scale) #4 !dbg !426 {
entry:
  %grad.addr = alloca float*, align 8
  %feature.addr = alloca float*, align 8
  %scale.addr = alloca float, align 4
  %i = alloca i32, align 4
  store float* %grad, float** %grad.addr, align 8
  call void @llvm.dbg.declare(metadata float** %grad.addr, metadata !429, metadata !DIExpression()), !dbg !430
  store float* %feature, float** %feature.addr, align 8
  call void @llvm.dbg.declare(metadata float** %feature.addr, metadata !431, metadata !DIExpression()), !dbg !432
  store float %scale, float* %scale.addr, align 4
  call void @llvm.dbg.declare(metadata float* %scale.addr, metadata !433, metadata !DIExpression()), !dbg !434
  br label %GRAD, !dbg !435

GRAD:                                             ; preds = %entry
  %0 = bitcast i32* %i to i8*, !dbg !436
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #7, !dbg !436
  call void @llvm.dbg.declare(metadata i32* %i, metadata !438, metadata !DIExpression()), !dbg !439
  store i32 0, i32* %i, align 4, !dbg !439
  br label %for.cond, !dbg !436

for.cond:                                         ; preds = %for.inc, %GRAD
  %1 = load i32, i32* %i, align 4, !dbg !440
  %cmp = icmp slt i32 %1, 1024, !dbg !442
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !443

for.cond.cleanup:                                 ; preds = %for.cond
  %2 = bitcast i32* %i to i8*, !dbg !444
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %2) #7, !dbg !444
  br label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load float, float* %scale.addr, align 4, !dbg !445
  %4 = load float*, float** %feature.addr, align 8, !dbg !446
  %5 = load i32, i32* %i, align 4, !dbg !447
  %idxprom = sext i32 %5 to i64, !dbg !446
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom, !dbg !446
  %6 = load float, float* %arrayidx, align 4, !dbg !446
  %mul = fmul float %3, %6, !dbg !448
  %7 = load float*, float** %grad.addr, align 8, !dbg !449
  %8 = load i32, i32* %i, align 4, !dbg !450
  %idxprom1 = sext i32 %8 to i64, !dbg !449
  %arrayidx2 = getelementptr inbounds float, float* %7, i64 %idxprom1, !dbg !449
  store float %mul, float* %arrayidx2, align 4, !dbg !451
  br label %for.inc, !dbg !449

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !452
  %inc = add i32 %9, 1, !dbg !452
  store i32 %inc, i32* %i, align 4, !dbg !452
  br label %for.cond, !dbg !444, !llvm.loop !453

for.end:                                          ; preds = %for.cond.cleanup
  ret void, !dbg !456
}

; Function Attrs: nounwind
define void @_Z15updateParameterPfS_f(float* "fpga.decayed.dim.hint"="1024" %param, float* "fpga.decayed.dim.hint"="1024" %grad, float %scale) #5 !dbg !457 {
entry:
  %param.addr = alloca float*, align 8
  %grad.addr = alloca float*, align 8
  %scale.addr = alloca float, align 4
  %i = alloca i32, align 4
  store float* %param, float** %param.addr, align 8
  call void @llvm.dbg.declare(metadata float** %param.addr, metadata !460, metadata !DIExpression()), !dbg !461
  store float* %grad, float** %grad.addr, align 8
  call void @llvm.dbg.declare(metadata float** %grad.addr, metadata !462, metadata !DIExpression()), !dbg !463
  store float %scale, float* %scale.addr, align 4
  call void @llvm.dbg.declare(metadata float* %scale.addr, metadata !464, metadata !DIExpression()), !dbg !465
  br label %UPDATE, !dbg !466

UPDATE:                                           ; preds = %entry
  %0 = bitcast i32* %i to i8*, !dbg !467
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #7, !dbg !467
  call void @llvm.dbg.declare(metadata i32* %i, metadata !469, metadata !DIExpression()), !dbg !470
  store i32 0, i32* %i, align 4, !dbg !470
  br label %for.cond, !dbg !467

for.cond:                                         ; preds = %for.inc, %UPDATE
  %1 = load i32, i32* %i, align 4, !dbg !471
  %cmp = icmp slt i32 %1, 1024, !dbg !473
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !474

for.cond.cleanup:                                 ; preds = %for.cond
  %2 = bitcast i32* %i to i8*, !dbg !475
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %2) #7, !dbg !475
  br label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load float, float* %scale.addr, align 4, !dbg !476
  %4 = load float*, float** %grad.addr, align 8, !dbg !477
  %5 = load i32, i32* %i, align 4, !dbg !478
  %idxprom = sext i32 %5 to i64, !dbg !477
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom, !dbg !477
  %6 = load float, float* %arrayidx, align 4, !dbg !477
  %mul = fmul float %3, %6, !dbg !479
  %7 = load float*, float** %param.addr, align 8, !dbg !480
  %8 = load i32, i32* %i, align 4, !dbg !481
  %idxprom1 = sext i32 %8 to i64, !dbg !480
  %arrayidx2 = getelementptr inbounds float, float* %7, i64 %idxprom1, !dbg !480
  %9 = load float, float* %arrayidx2, align 4, !dbg !482
  %add = fadd float %9, %mul, !dbg !482
  store float %add, float* %arrayidx2, align 4, !dbg !482
  br label %for.inc, !dbg !480

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !483
  %inc = add i32 %10, 1, !dbg !483
  store i32 %inc, i32* %i, align 4, !dbg !483
  br label %for.cond, !dbg !475, !llvm.loop !484

for.end:                                          ; preds = %for.cond.cleanup
  ret void, !dbg !487
}

; Function Attrs: nounwind
define void @_Z5SgdLRPfPhS_(float* "fpga.decayed.dim.hint"="4608000" %data, i8* "fpga.decayed.dim.hint"="4500" %label, float* "fpga.decayed.dim.hint"="1024" %theta) #6 !dbg !488 !fpga.function.pragma !494 {
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
  call void @llvm.dbg.declare(metadata float** %data.addr, metadata !497, metadata !DIExpression()), !dbg !498
  store i8* %label, i8** %label.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %label.addr, metadata !499, metadata !DIExpression()), !dbg !500
  store float* %theta, float** %theta.addr, align 8
  call void @llvm.dbg.declare(metadata float** %theta.addr, metadata !501, metadata !DIExpression()), !dbg !502
  %0 = bitcast [1024 x float]* %gradient to i8*, !dbg !503
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* %0) #7, !dbg !503
  call void @llvm.dbg.declare(metadata [1024 x float]* %gradient, metadata !504, metadata !DIExpression()), !dbg !508
  br label %EPOCH, !dbg !503

EPOCH:                                            ; preds = %entry
  %1 = bitcast i32* %epoch to i8*, !dbg !509
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #7, !dbg !509
  call void @llvm.dbg.declare(metadata i32* %epoch, metadata !511, metadata !DIExpression()), !dbg !512
  store i32 0, i32* %epoch, align 4, !dbg !512
  br label %for.cond, !dbg !509

for.cond:                                         ; preds = %for.inc13, %EPOCH
  %2 = load i32, i32* %epoch, align 4, !dbg !513
  %cmp = icmp slt i32 %2, 5, !dbg !515
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !516

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 3, i32* %cleanup.dest.slot, align 4
  %3 = bitcast i32* %epoch to i8*, !dbg !517
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %3) #7, !dbg !517
  br label %for.end15

for.body:                                         ; preds = %for.cond
  br label %TRAINING_INST, !dbg !518

TRAINING_INST:                                    ; preds = %for.body
  %4 = bitcast i32* %training_id to i8*, !dbg !519
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #7, !dbg !519
  call void @llvm.dbg.declare(metadata i32* %training_id, metadata !522, metadata !DIExpression()), !dbg !523
  store i32 0, i32* %training_id, align 4, !dbg !523
  br label %for.cond1, !dbg !519

for.cond1:                                        ; preds = %for.inc, %TRAINING_INST
  %5 = load i32, i32* %training_id, align 4, !dbg !524
  %cmp2 = icmp slt i32 %5, 4500, !dbg !526
  br i1 %cmp2, label %for.body4, label %for.cond.cleanup3, !dbg !527

for.cond.cleanup3:                                ; preds = %for.cond1
  store i32 7, i32* %cleanup.dest.slot, align 4
  %6 = bitcast i32* %training_id to i8*, !dbg !528
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %6) #7, !dbg !528
  br label %for.end

for.body4:                                        ; preds = %for.cond1
  %7 = bitcast float* %dot to i8*, !dbg !529
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #7, !dbg !529
  call void @llvm.dbg.declare(metadata float* %dot, metadata !531, metadata !DIExpression()), !dbg !532
  %8 = load float*, float** %theta.addr, align 8, !dbg !533
  %9 = load float*, float** %data.addr, align 8, !dbg !534
  %10 = load i32, i32* %training_id, align 4, !dbg !535
  %mul = mul i32 1024, %10, !dbg !536
  %idxprom = sext i32 %mul to i64, !dbg !534
  %arrayidx = getelementptr inbounds float, float* %9, i64 %idxprom, !dbg !534
  %call = call float @_Z10dotProductPfS_(float* %8, float* %arrayidx), !dbg !537
  store float %call, float* %dot, align 4, !dbg !532
  %11 = bitcast float* %prob to i8*, !dbg !538
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #7, !dbg !538
  call void @llvm.dbg.declare(metadata float* %prob, metadata !539, metadata !DIExpression()), !dbg !540
  %12 = load float, float* %dot, align 4, !dbg !541
  %call5 = call float @_Z7Sigmoidf(float %12), !dbg !542
  store float %call5, float* %prob, align 4, !dbg !540
  %arraydecay = getelementptr inbounds [1024 x float], [1024 x float]* %gradient, i32 0, i32 0, !dbg !543
  %13 = load float*, float** %data.addr, align 8, !dbg !544
  %14 = load i32, i32* %training_id, align 4, !dbg !545
  %mul6 = mul i32 1024, %14, !dbg !546
  %idxprom7 = sext i32 %mul6 to i64, !dbg !544
  %arrayidx8 = getelementptr inbounds float, float* %13, i64 %idxprom7, !dbg !544
  %15 = load float, float* %prob, align 4, !dbg !547
  %16 = load i8*, i8** %label.addr, align 8, !dbg !548
  %17 = load i32, i32* %training_id, align 4, !dbg !549
  %idxprom9 = sext i32 %17 to i64, !dbg !548
  %arrayidx10 = getelementptr inbounds i8, i8* %16, i64 %idxprom9, !dbg !548
  %18 = load i8, i8* %arrayidx10, align 1, !dbg !548
  %conv = zext i8 %18 to i32, !dbg !548
  %conv11 = sitofp i32 %conv to float, !dbg !548
  %sub = fsub float %15, %conv11, !dbg !550
  call void @_Z15computeGradientPfS_f(float* %arraydecay, float* %arrayidx8, float %sub), !dbg !551
  %19 = load float*, float** %theta.addr, align 8, !dbg !552
  %arraydecay12 = getelementptr inbounds [1024 x float], [1024 x float]* %gradient, i32 0, i32 0, !dbg !553
  call void @_Z15updateParameterPfS_f(float* %19, float* %arraydecay12, float -6.000000e+04), !dbg !554
  %20 = bitcast float* %prob to i8*, !dbg !555
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #7, !dbg !555
  %21 = bitcast float* %dot to i8*, !dbg !555
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #7, !dbg !555
  br label %for.inc, !dbg !556

for.inc:                                          ; preds = %for.body4
  %22 = load i32, i32* %training_id, align 4, !dbg !557
  %inc = add i32 %22, 1, !dbg !557
  store i32 %inc, i32* %training_id, align 4, !dbg !557
  br label %for.cond1, !dbg !528, !llvm.loop !558

for.end:                                          ; preds = %for.cond.cleanup3
  br label %for.inc13, !dbg !561

for.inc13:                                        ; preds = %for.end
  %23 = load i32, i32* %epoch, align 4, !dbg !562
  %inc14 = add i32 %23, 1, !dbg !562
  store i32 %inc14, i32* %epoch, align 4, !dbg !562
  br label %for.cond, !dbg !517, !llvm.loop !563

for.end15:                                        ; preds = %for.cond.cleanup
  %24 = bitcast [1024 x float]* %gradient to i8*, !dbg !566
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* %24) #7, !dbg !566
  ret void, !dbg !566
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="dotProduct" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="Sigmoid" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="computeGradient" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="updateParameter" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.demangled.name"="SgdLR" "fpga.top.func"="SgdLR" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.ident = !{!373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373, !373}
!llvm.module.flags = !{!374, !375, !376}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, globals: !3, imports: !15)
!1 = !DIFile(filename: "/home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/spam_ahls/solution1/.autopilot/db/sgd.pp.0.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!2 = !{}
!3 = !{!4, !9, !11, !13}
!4 = !DIGlobalVariableExpression(var: !5, expr: !DIExpression(DW_OP_constu, 1024, DW_OP_stack_value))
!5 = distinct !DIGlobalVariable(name: "NUM_FEATURES", scope: !0, file: !6, line: 13, type: !7, isLocal: true, isDefinition: true)
!6 = !DIFile(filename: "benchmarks/rosetta/spam-filter/src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!7 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression(DW_OP_constu, 5, DW_OP_stack_value))
!10 = distinct !DIGlobalVariable(name: "NUM_EPOCHS", scope: !0, file: !6, line: 18, type: !7, isLocal: true, isDefinition: true)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression(DW_OP_constu, 4500, DW_OP_stack_value))
!12 = distinct !DIGlobalVariable(name: "NUM_TRAINING", scope: !0, file: !6, line: 15, type: !7, isLocal: true, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression(DW_OP_constu, 60000, DW_OP_stack_value))
!14 = distinct !DIGlobalVariable(name: "STEP_SIZE", scope: !0, file: !6, line: 17, type: !7, isLocal: true, isDefinition: true)
!15 = !{!16, !23, !30, !32, !34, !38, !40, !42, !44, !46, !48, !50, !52, !57, !61, !63, !65, !70, !72, !74, !76, !78, !80, !82, !85, !88, !90, !94, !99, !101, !103, !105, !107, !109, !111, !113, !115, !117, !119, !123, !127, !129, !131, !133, !135, !137, !139, !141, !143, !145, !147, !149, !151, !153, !155, !157, !161, !165, !169, !171, !173, !175, !177, !179, !181, !183, !185, !187, !191, !195, !199, !201, !203, !205, !210, !214, !218, !220, !222, !224, !226, !228, !230, !232, !234, !236, !238, !240, !242, !247, !251, !255, !257, !259, !261, !268, !272, !276, !278, !280, !282, !284, !286, !288, !292, !296, !298, !300, !302, !304, !308, !312, !316, !318, !320, !322, !324, !326, !328, !332, !336, !340, !342, !346, !350, !352, !354, !356, !358, !360, !362, !368}
!16 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !18, file: !22, line: 52)
!17 = !DINamespace(name: "std", scope: null)
!18 = !DISubprogram(name: "abs", scope: !19, file: !19, line: 848, type: !20, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!19 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!20 = !DISubroutineType(types: !21)
!21 = !{!8, !8}
!22 = !DIFile(filename: "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/bits/std_abs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!23 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !24, file: !29, line: 83)
!24 = !DISubprogram(name: "acos", scope: !25, file: !25, line: 53, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!25 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/mathcalls.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!26 = !DISubroutineType(types: !27)
!27 = !{!28, !28}
!28 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!29 = !DIFile(filename: "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/cmath", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!30 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !31, file: !29, line: 102)
!31 = !DISubprogram(name: "asin", scope: !25, file: !25, line: 55, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!32 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !33, file: !29, line: 121)
!33 = !DISubprogram(name: "atan", scope: !25, file: !25, line: 57, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !35, file: !29, line: 140)
!35 = !DISubprogram(name: "atan2", scope: !25, file: !25, line: 59, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!36 = !DISubroutineType(types: !37)
!37 = !{!28, !28, !28}
!38 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !39, file: !29, line: 161)
!39 = !DISubprogram(name: "ceil", scope: !25, file: !25, line: 159, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !41, file: !29, line: 180)
!41 = !DISubprogram(name: "cos", scope: !25, file: !25, line: 62, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !43, file: !29, line: 199)
!43 = !DISubprogram(name: "cosh", scope: !25, file: !25, line: 71, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !45, file: !29, line: 218)
!45 = !DISubprogram(name: "exp", scope: !25, file: !25, line: 95, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !47, file: !29, line: 237)
!47 = !DISubprogram(name: "fabs", scope: !25, file: !25, line: 162, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !49, file: !29, line: 256)
!49 = !DISubprogram(name: "floor", scope: !25, file: !25, line: 165, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !51, file: !29, line: 275)
!51 = !DISubprogram(name: "fmod", scope: !25, file: !25, line: 168, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!52 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !53, file: !29, line: 296)
!53 = !DISubprogram(name: "frexp", scope: !25, file: !25, line: 98, type: !54, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!54 = !DISubroutineType(types: !55)
!55 = !{!28, !28, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !58, file: !29, line: 315)
!58 = !DISubprogram(name: "ldexp", scope: !25, file: !25, line: 101, type: !59, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!59 = !DISubroutineType(types: !60)
!60 = !{!28, !28, !8}
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !62, file: !29, line: 334)
!62 = !DISubprogram(name: "log", scope: !25, file: !25, line: 104, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !64, file: !29, line: 353)
!64 = !DISubprogram(name: "log10", scope: !25, file: !25, line: 107, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !66, file: !29, line: 372)
!66 = !DISubprogram(name: "modf", scope: !25, file: !25, line: 110, type: !67, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!67 = !DISubroutineType(types: !68)
!68 = !{!28, !28, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !71, file: !29, line: 384)
!71 = !DISubprogram(name: "pow", scope: !25, file: !25, line: 140, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !73, file: !29, line: 421)
!73 = !DISubprogram(name: "sin", scope: !25, file: !25, line: 64, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!74 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !75, file: !29, line: 440)
!75 = !DISubprogram(name: "sinh", scope: !25, file: !25, line: 73, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !77, file: !29, line: 459)
!77 = !DISubprogram(name: "sqrt", scope: !25, file: !25, line: 143, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !79, file: !29, line: 478)
!79 = !DISubprogram(name: "tan", scope: !25, file: !25, line: 66, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !81, file: !29, line: 497)
!81 = !DISubprogram(name: "tanh", scope: !25, file: !25, line: 75, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !83, file: !29, line: 1065)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "double_t", file: !84, line: 164, baseType: !28)
!84 = !DIFile(filename: "/usr/include/math.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !86, file: !29, line: 1066)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "float_t", file: !84, line: 163, baseType: !87)
!87 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !89, file: !29, line: 1069)
!89 = !DISubprogram(name: "acosh", scope: !25, file: !25, line: 85, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !91, file: !29, line: 1070)
!91 = !DISubprogram(name: "acoshf", scope: !25, file: !25, line: 85, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!92 = !DISubroutineType(types: !93)
!93 = !{!87, !87}
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !95, file: !29, line: 1071)
!95 = !DISubprogram(name: "acoshl", scope: !25, file: !25, line: 85, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!96 = !DISubroutineType(types: !97)
!97 = !{!98, !98}
!98 = !DIBasicType(name: "long double", size: 64, encoding: DW_ATE_float)
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !100, file: !29, line: 1073)
!100 = !DISubprogram(name: "asinh", scope: !25, file: !25, line: 87, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !102, file: !29, line: 1074)
!102 = !DISubprogram(name: "asinhf", scope: !25, file: !25, line: 87, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !104, file: !29, line: 1075)
!104 = !DISubprogram(name: "asinhl", scope: !25, file: !25, line: 87, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !106, file: !29, line: 1077)
!106 = !DISubprogram(name: "atanh", scope: !25, file: !25, line: 89, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !108, file: !29, line: 1078)
!108 = !DISubprogram(name: "atanhf", scope: !25, file: !25, line: 89, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !110, file: !29, line: 1079)
!110 = !DISubprogram(name: "atanhl", scope: !25, file: !25, line: 89, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !112, file: !29, line: 1081)
!112 = !DISubprogram(name: "cbrt", scope: !25, file: !25, line: 152, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !114, file: !29, line: 1082)
!114 = !DISubprogram(name: "cbrtf", scope: !25, file: !25, line: 152, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !116, file: !29, line: 1083)
!116 = !DISubprogram(name: "cbrtl", scope: !25, file: !25, line: 152, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !118, file: !29, line: 1085)
!118 = !DISubprogram(name: "copysign", scope: !25, file: !25, line: 198, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !120, file: !29, line: 1086)
!120 = !DISubprogram(name: "copysignf", scope: !25, file: !25, line: 198, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!121 = !DISubroutineType(types: !122)
!122 = !{!87, !87, !87}
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !124, file: !29, line: 1087)
!124 = !DISubprogram(name: "copysignl", scope: !25, file: !25, line: 198, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!125 = !DISubroutineType(types: !126)
!126 = !{!98, !98, !98}
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !128, file: !29, line: 1089)
!128 = !DISubprogram(name: "erf", scope: !25, file: !25, line: 231, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !130, file: !29, line: 1090)
!130 = !DISubprogram(name: "erff", scope: !25, file: !25, line: 231, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !132, file: !29, line: 1091)
!132 = !DISubprogram(name: "erfl", scope: !25, file: !25, line: 231, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !134, file: !29, line: 1093)
!134 = !DISubprogram(name: "erfc", scope: !25, file: !25, line: 232, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !136, file: !29, line: 1094)
!136 = !DISubprogram(name: "erfcf", scope: !25, file: !25, line: 232, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !138, file: !29, line: 1095)
!138 = !DISubprogram(name: "erfcl", scope: !25, file: !25, line: 232, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !140, file: !29, line: 1097)
!140 = !DISubprogram(name: "exp2", scope: !25, file: !25, line: 130, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !142, file: !29, line: 1098)
!142 = !DISubprogram(name: "exp2f", scope: !25, file: !25, line: 130, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !144, file: !29, line: 1099)
!144 = !DISubprogram(name: "exp2l", scope: !25, file: !25, line: 130, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !146, file: !29, line: 1101)
!146 = !DISubprogram(name: "expm1", scope: !25, file: !25, line: 119, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !148, file: !29, line: 1102)
!148 = !DISubprogram(name: "expm1f", scope: !25, file: !25, line: 119, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !150, file: !29, line: 1103)
!150 = !DISubprogram(name: "expm1l", scope: !25, file: !25, line: 119, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !152, file: !29, line: 1105)
!152 = !DISubprogram(name: "fdim", scope: !25, file: !25, line: 329, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !154, file: !29, line: 1106)
!154 = !DISubprogram(name: "fdimf", scope: !25, file: !25, line: 329, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !156, file: !29, line: 1107)
!156 = !DISubprogram(name: "fdiml", scope: !25, file: !25, line: 329, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !158, file: !29, line: 1109)
!158 = !DISubprogram(name: "fma", scope: !25, file: !25, line: 340, type: !159, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DISubroutineType(types: !160)
!160 = !{!28, !28, !28, !28}
!161 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !162, file: !29, line: 1110)
!162 = !DISubprogram(name: "fmaf", scope: !25, file: !25, line: 340, type: !163, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!163 = !DISubroutineType(types: !164)
!164 = !{!87, !87, !87, !87}
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !166, file: !29, line: 1111)
!166 = !DISubprogram(name: "fmal", scope: !25, file: !25, line: 340, type: !167, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DISubroutineType(types: !168)
!168 = !{!98, !98, !98, !98}
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !170, file: !29, line: 1113)
!170 = !DISubprogram(name: "fmax", scope: !25, file: !25, line: 333, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !172, file: !29, line: 1114)
!172 = !DISubprogram(name: "fmaxf", scope: !25, file: !25, line: 333, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !174, file: !29, line: 1115)
!174 = !DISubprogram(name: "fmaxl", scope: !25, file: !25, line: 333, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !176, file: !29, line: 1117)
!176 = !DISubprogram(name: "fmin", scope: !25, file: !25, line: 336, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !178, file: !29, line: 1118)
!178 = !DISubprogram(name: "fminf", scope: !25, file: !25, line: 336, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !180, file: !29, line: 1119)
!180 = !DISubprogram(name: "fminl", scope: !25, file: !25, line: 336, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !182, file: !29, line: 1121)
!182 = !DISubprogram(name: "hypot", scope: !25, file: !25, line: 147, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !184, file: !29, line: 1122)
!184 = !DISubprogram(name: "hypotf", scope: !25, file: !25, line: 147, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !186, file: !29, line: 1123)
!186 = !DISubprogram(name: "hypotl", scope: !25, file: !25, line: 147, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !188, file: !29, line: 1125)
!188 = !DISubprogram(name: "ilogb", scope: !25, file: !25, line: 283, type: !189, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DISubroutineType(types: !190)
!190 = !{!8, !28}
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !192, file: !29, line: 1126)
!192 = !DISubprogram(name: "ilogbf", scope: !25, file: !25, line: 283, type: !193, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DISubroutineType(types: !194)
!194 = !{!8, !87}
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !196, file: !29, line: 1127)
!196 = !DISubprogram(name: "ilogbl", scope: !25, file: !25, line: 283, type: !197, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DISubroutineType(types: !198)
!198 = !{!8, !98}
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !200, file: !29, line: 1129)
!200 = !DISubprogram(name: "lgamma", scope: !25, file: !25, line: 233, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !202, file: !29, line: 1130)
!202 = !DISubprogram(name: "lgammaf", scope: !25, file: !25, line: 233, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !204, file: !29, line: 1131)
!204 = !DISubprogram(name: "lgammal", scope: !25, file: !25, line: 233, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !206, file: !29, line: 1134)
!206 = !DISubprogram(name: "llrint", scope: !25, file: !25, line: 319, type: !207, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!207 = !DISubroutineType(types: !208)
!208 = !{!209, !28}
!209 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !211, file: !29, line: 1135)
!211 = !DISubprogram(name: "llrintf", scope: !25, file: !25, line: 319, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!212 = !DISubroutineType(types: !213)
!213 = !{!209, !87}
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !215, file: !29, line: 1136)
!215 = !DISubprogram(name: "llrintl", scope: !25, file: !25, line: 319, type: !216, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!216 = !DISubroutineType(types: !217)
!217 = !{!209, !98}
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !219, file: !29, line: 1138)
!219 = !DISubprogram(name: "llround", scope: !25, file: !25, line: 325, type: !207, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !221, file: !29, line: 1139)
!221 = !DISubprogram(name: "llroundf", scope: !25, file: !25, line: 325, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !223, file: !29, line: 1140)
!223 = !DISubprogram(name: "llroundl", scope: !25, file: !25, line: 325, type: !216, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !225, file: !29, line: 1143)
!225 = !DISubprogram(name: "log1p", scope: !25, file: !25, line: 122, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !227, file: !29, line: 1144)
!227 = !DISubprogram(name: "log1pf", scope: !25, file: !25, line: 122, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !229, file: !29, line: 1145)
!229 = !DISubprogram(name: "log1pl", scope: !25, file: !25, line: 122, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !231, file: !29, line: 1147)
!231 = !DISubprogram(name: "log2", scope: !25, file: !25, line: 133, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !233, file: !29, line: 1148)
!233 = !DISubprogram(name: "log2f", scope: !25, file: !25, line: 133, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !235, file: !29, line: 1149)
!235 = !DISubprogram(name: "log2l", scope: !25, file: !25, line: 133, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !237, file: !29, line: 1151)
!237 = !DISubprogram(name: "logb", scope: !25, file: !25, line: 125, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !239, file: !29, line: 1152)
!239 = !DISubprogram(name: "logbf", scope: !25, file: !25, line: 125, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !241, file: !29, line: 1153)
!241 = !DISubprogram(name: "logbl", scope: !25, file: !25, line: 125, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !243, file: !29, line: 1155)
!243 = !DISubprogram(name: "lrint", scope: !25, file: !25, line: 317, type: !244, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!244 = !DISubroutineType(types: !245)
!245 = !{!246, !28}
!246 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !248, file: !29, line: 1156)
!248 = !DISubprogram(name: "lrintf", scope: !25, file: !25, line: 317, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!249 = !DISubroutineType(types: !250)
!250 = !{!246, !87}
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !252, file: !29, line: 1157)
!252 = !DISubprogram(name: "lrintl", scope: !25, file: !25, line: 317, type: !253, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!253 = !DISubroutineType(types: !254)
!254 = !{!246, !98}
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !256, file: !29, line: 1159)
!256 = !DISubprogram(name: "lround", scope: !25, file: !25, line: 323, type: !244, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !258, file: !29, line: 1160)
!258 = !DISubprogram(name: "lroundf", scope: !25, file: !25, line: 323, type: !249, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !260, file: !29, line: 1161)
!260 = !DISubprogram(name: "lroundl", scope: !25, file: !25, line: 323, type: !253, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !262, file: !29, line: 1163)
!262 = !DISubprogram(name: "nan", scope: !25, file: !25, line: 203, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!263 = !DISubroutineType(types: !264)
!264 = !{!28, !265}
!265 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !266, size: 64)
!266 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !267)
!267 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !269, file: !29, line: 1164)
!269 = !DISubprogram(name: "nanf", scope: !25, file: !25, line: 203, type: !270, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!270 = !DISubroutineType(types: !271)
!271 = !{!87, !265}
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !273, file: !29, line: 1165)
!273 = !DISubprogram(name: "nanl", scope: !25, file: !25, line: 203, type: !274, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!274 = !DISubroutineType(types: !275)
!275 = !{!98, !265}
!276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !277, file: !29, line: 1167)
!277 = !DISubprogram(name: "nearbyint", scope: !25, file: !25, line: 297, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !279, file: !29, line: 1168)
!279 = !DISubprogram(name: "nearbyintf", scope: !25, file: !25, line: 297, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !281, file: !29, line: 1169)
!281 = !DISubprogram(name: "nearbyintl", scope: !25, file: !25, line: 297, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !283, file: !29, line: 1171)
!283 = !DISubprogram(name: "nextafter", scope: !25, file: !25, line: 262, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !285, file: !29, line: 1172)
!285 = !DISubprogram(name: "nextafterf", scope: !25, file: !25, line: 262, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !287, file: !29, line: 1173)
!287 = !DISubprogram(name: "nextafterl", scope: !25, file: !25, line: 262, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !289, file: !29, line: 1175)
!289 = !DISubprogram(name: "nexttoward", scope: !25, file: !25, line: 264, type: !290, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!290 = !DISubroutineType(types: !291)
!291 = !{!28, !28, !98}
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !293, file: !29, line: 1176)
!293 = !DISubprogram(name: "nexttowardf", scope: !25, file: !25, line: 264, type: !294, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!294 = !DISubroutineType(types: !295)
!295 = !{!87, !87, !98}
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !297, file: !29, line: 1177)
!297 = !DISubprogram(name: "nexttowardl", scope: !25, file: !25, line: 264, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !299, file: !29, line: 1179)
!299 = !DISubprogram(name: "remainder", scope: !25, file: !25, line: 275, type: !36, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !301, file: !29, line: 1180)
!301 = !DISubprogram(name: "remainderf", scope: !25, file: !25, line: 275, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !303, file: !29, line: 1181)
!303 = !DISubprogram(name: "remainderl", scope: !25, file: !25, line: 275, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !305, file: !29, line: 1183)
!305 = !DISubprogram(name: "remquo", scope: !25, file: !25, line: 310, type: !306, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!306 = !DISubroutineType(types: !307)
!307 = !{!28, !28, !28, !56}
!308 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !309, file: !29, line: 1184)
!309 = !DISubprogram(name: "remquof", scope: !25, file: !25, line: 310, type: !310, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!310 = !DISubroutineType(types: !311)
!311 = !{!87, !87, !87, !56}
!312 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !313, file: !29, line: 1185)
!313 = !DISubprogram(name: "remquol", scope: !25, file: !25, line: 310, type: !314, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!314 = !DISubroutineType(types: !315)
!315 = !{!98, !98, !98, !56}
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !317, file: !29, line: 1187)
!317 = !DISubprogram(name: "rint", scope: !25, file: !25, line: 259, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !319, file: !29, line: 1188)
!319 = !DISubprogram(name: "rintf", scope: !25, file: !25, line: 259, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !321, file: !29, line: 1189)
!321 = !DISubprogram(name: "rintl", scope: !25, file: !25, line: 259, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !323, file: !29, line: 1191)
!323 = !DISubprogram(name: "round", scope: !25, file: !25, line: 301, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !325, file: !29, line: 1192)
!325 = !DISubprogram(name: "roundf", scope: !25, file: !25, line: 301, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !327, file: !29, line: 1193)
!327 = !DISubprogram(name: "roundl", scope: !25, file: !25, line: 301, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !329, file: !29, line: 1195)
!329 = !DISubprogram(name: "scalbln", scope: !25, file: !25, line: 293, type: !330, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!330 = !DISubroutineType(types: !331)
!331 = !{!28, !28, !246}
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !333, file: !29, line: 1196)
!333 = !DISubprogram(name: "scalblnf", scope: !25, file: !25, line: 293, type: !334, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DISubroutineType(types: !335)
!335 = !{!87, !87, !246}
!336 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !337, file: !29, line: 1197)
!337 = !DISubprogram(name: "scalblnl", scope: !25, file: !25, line: 293, type: !338, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!338 = !DISubroutineType(types: !339)
!339 = !{!98, !98, !246}
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !341, file: !29, line: 1199)
!341 = !DISubprogram(name: "scalbn", scope: !25, file: !25, line: 279, type: !59, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !343, file: !29, line: 1200)
!343 = !DISubprogram(name: "scalbnf", scope: !25, file: !25, line: 279, type: !344, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!344 = !DISubroutineType(types: !345)
!345 = !{!87, !87, !8}
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !347, file: !29, line: 1201)
!347 = !DISubprogram(name: "scalbnl", scope: !25, file: !25, line: 279, type: !348, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!348 = !DISubroutineType(types: !349)
!349 = !{!98, !98, !8}
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !351, file: !29, line: 1203)
!351 = !DISubprogram(name: "tgamma", scope: !25, file: !25, line: 238, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !353, file: !29, line: 1204)
!353 = !DISubprogram(name: "tgammaf", scope: !25, file: !25, line: 238, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!354 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !355, file: !29, line: 1205)
!355 = !DISubprogram(name: "tgammal", scope: !25, file: !25, line: 238, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !357, file: !29, line: 1207)
!357 = !DISubprogram(name: "trunc", scope: !25, file: !25, line: 305, type: !26, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !359, file: !29, line: 1208)
!359 = !DISubprogram(name: "truncf", scope: !25, file: !25, line: 305, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!360 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !17, entity: !361, file: !29, line: 1209)
!361 = !DISubprogram(name: "truncl", scope: !25, file: !25, line: 305, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!362 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !363, file: !367, line: 38)
!363 = !DISubprogram(name: "abs", linkageName: "_ZSt3absg", scope: !17, file: !22, line: 102, type: !364, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!364 = !DISubroutineType(types: !365)
!365 = !{!366, !366}
!366 = !DIBasicType(name: "__float128", size: 128, encoding: DW_ATE_float)
!367 = !DIFile(filename: "/tools/Xilinx/Vitis_HLS/2023.2/tps/lnx64/gcc-8.3.0/lib/gcc/x86_64-pc-linux-gnu/8.3.0/../../../../include/c++/8.3.0/math.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !369, file: !367, line: 54)
!369 = !DISubprogram(name: "modf", linkageName: "_ZSt4modfePe", scope: !17, file: !29, line: 380, type: !370, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!370 = !DISubroutineType(types: !371)
!371 = !{!98, !98, !372}
!372 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!373 = !{!"clang version 7.0.0 "}
!374 = !{i32 2, !"Dwarf Version", i32 4}
!375 = !{i32 2, !"Debug Info Version", i32 3}
!376 = !{i32 1, !"wchar_size", i32 4}
!377 = distinct !DISubprogram(name: "dotProduct", linkageName: "_Z10dotProductPfS_", scope: !378, file: !378, line: 14, type: !379, isLocal: false, isDefinition: true, scopeLine: 17, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!378 = !DIFile(filename: "benchmarks/rosetta/spam-filter/src/sgd.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/AHLS")
!379 = !DISubroutineType(types: !380)
!380 = !{!381, !382, !383}
!381 = !DIDerivedType(tag: DW_TAG_typedef, name: "FeatureType", file: !6, line: 22, baseType: !87)
!382 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !381, size: 64)
!383 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !384, size: 64)
!384 = !DIDerivedType(tag: DW_TAG_typedef, name: "DataType", file: !6, line: 23, baseType: !87)
!385 = !DILocalVariable(name: "param", arg: 1, scope: !377, file: !378, line: 15, type: !382)
!386 = !DILocation(line: 15, column: 17, scope: !377)
!387 = !DILocalVariable(name: "feature", arg: 2, scope: !377, file: !378, line: 16, type: !383)
!388 = !DILocation(line: 16, column: 14, scope: !377)
!389 = !DILocation(line: 18, column: 3, scope: !377)
!390 = !DILocalVariable(name: "result", scope: !377, file: !378, line: 18, type: !381)
!391 = !DILocation(line: 18, column: 15, scope: !377)
!392 = !DILocation(line: 19, column: 13, scope: !393)
!393 = distinct !DILexicalBlock(scope: !377, file: !378, line: 19, column: 8)
!394 = !DILocalVariable(name: "i", scope: !393, file: !378, line: 19, type: !8)
!395 = !DILocation(line: 19, column: 17, scope: !393)
!396 = !DILocation(line: 19, column: 24, scope: !397)
!397 = distinct !DILexicalBlock(scope: !393, file: !378, line: 19, column: 8)
!398 = !DILocation(line: 19, column: 26, scope: !397)
!399 = !DILocation(line: 19, column: 8, scope: !393)
!400 = !DILocation(line: 19, column: 8, scope: !397)
!401 = !DILocation(line: 20, column: 15, scope: !397)
!402 = !DILocation(line: 20, column: 21, scope: !397)
!403 = !DILocation(line: 20, column: 26, scope: !397)
!404 = !DILocation(line: 20, column: 34, scope: !397)
!405 = !DILocation(line: 20, column: 24, scope: !397)
!406 = !DILocation(line: 20, column: 12, scope: !397)
!407 = !DILocation(line: 20, column: 5, scope: !397)
!408 = !DILocation(line: 19, column: 43, scope: !397)
!409 = distinct !{!409, !399, !410, !411}
!410 = !DILocation(line: 20, column: 35, scope: !393)
!411 = !{!"llvm.loop.name", !"DOT"}
!412 = !DILocation(line: 21, column: 10, scope: !377)
!413 = !DILocation(line: 22, column: 1, scope: !377)
!414 = !DILocation(line: 21, column: 3, scope: !377)
!415 = distinct !DISubprogram(name: "Sigmoid", linkageName: "_Z7Sigmoidf", scope: !378, file: !378, line: 24, type: !416, isLocal: false, isDefinition: true, scopeLine: 25, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!416 = !DISubroutineType(types: !417)
!417 = !{!381, !381}
!418 = !DILocalVariable(name: "exponent", arg: 1, scope: !415, file: !378, line: 24, type: !381)
!419 = !DILocation(line: 24, column: 33, scope: !415)
!420 = !DILocation(line: 26, column: 31, scope: !415)
!421 = !DILocation(line: 26, column: 30, scope: !415)
!422 = !DILocation(line: 26, column: 25, scope: !415)
!423 = !DILocation(line: 26, column: 23, scope: !415)
!424 = !DILocation(line: 26, column: 15, scope: !415)
!425 = !DILocation(line: 26, column: 3, scope: !415)
!426 = distinct !DISubprogram(name: "computeGradient", linkageName: "_Z15computeGradientPfS_f", scope: !378, file: !378, line: 30, type: !427, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!427 = !DISubroutineType(types: !428)
!428 = !{null, !382, !383, !381}
!429 = !DILocalVariable(name: "grad", arg: 1, scope: !426, file: !378, line: 31, type: !382)
!430 = !DILocation(line: 31, column: 17, scope: !426)
!431 = !DILocalVariable(name: "feature", arg: 2, scope: !426, file: !378, line: 32, type: !383)
!432 = !DILocation(line: 32, column: 14, scope: !426)
!433 = !DILocalVariable(name: "scale", arg: 3, scope: !426, file: !378, line: 33, type: !381)
!434 = !DILocation(line: 33, column: 17, scope: !426)
!435 = !DILocation(line: 34, column: 1, scope: !426)
!436 = !DILocation(line: 35, column: 14, scope: !437)
!437 = distinct !DILexicalBlock(scope: !426, file: !378, line: 35, column: 9)
!438 = !DILocalVariable(name: "i", scope: !437, file: !378, line: 35, type: !8)
!439 = !DILocation(line: 35, column: 18, scope: !437)
!440 = !DILocation(line: 35, column: 25, scope: !441)
!441 = distinct !DILexicalBlock(scope: !437, file: !378, line: 35, column: 9)
!442 = !DILocation(line: 35, column: 27, scope: !441)
!443 = !DILocation(line: 35, column: 9, scope: !437)
!444 = !DILocation(line: 35, column: 9, scope: !441)
!445 = !DILocation(line: 36, column: 15, scope: !441)
!446 = !DILocation(line: 36, column: 23, scope: !441)
!447 = !DILocation(line: 36, column: 31, scope: !441)
!448 = !DILocation(line: 36, column: 21, scope: !441)
!449 = !DILocation(line: 36, column: 5, scope: !441)
!450 = !DILocation(line: 36, column: 10, scope: !441)
!451 = !DILocation(line: 36, column: 13, scope: !441)
!452 = !DILocation(line: 35, column: 44, scope: !441)
!453 = distinct !{!453, !443, !454, !455}
!454 = !DILocation(line: 36, column: 32, scope: !437)
!455 = !{!"llvm.loop.name", !"GRAD"}
!456 = !DILocation(line: 37, column: 1, scope: !426)
!457 = distinct !DISubprogram(name: "updateParameter", linkageName: "_Z15updateParameterPfS_f", scope: !378, file: !378, line: 40, type: !458, isLocal: false, isDefinition: true, scopeLine: 44, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!458 = !DISubroutineType(types: !459)
!459 = !{null, !382, !382, !381}
!460 = !DILocalVariable(name: "param", arg: 1, scope: !457, file: !378, line: 41, type: !382)
!461 = !DILocation(line: 41, column: 17, scope: !457)
!462 = !DILocalVariable(name: "grad", arg: 2, scope: !457, file: !378, line: 42, type: !382)
!463 = !DILocation(line: 42, column: 17, scope: !457)
!464 = !DILocalVariable(name: "scale", arg: 3, scope: !457, file: !378, line: 43, type: !381)
!465 = !DILocation(line: 43, column: 17, scope: !457)
!466 = !DILocation(line: 44, column: 1, scope: !457)
!467 = !DILocation(line: 45, column: 16, scope: !468)
!468 = distinct !DILexicalBlock(scope: !457, file: !378, line: 45, column: 11)
!469 = !DILocalVariable(name: "i", scope: !468, file: !378, line: 45, type: !8)
!470 = !DILocation(line: 45, column: 20, scope: !468)
!471 = !DILocation(line: 45, column: 27, scope: !472)
!472 = distinct !DILexicalBlock(scope: !468, file: !378, line: 45, column: 11)
!473 = !DILocation(line: 45, column: 29, scope: !472)
!474 = !DILocation(line: 45, column: 11, scope: !468)
!475 = !DILocation(line: 45, column: 11, scope: !472)
!476 = !DILocation(line: 46, column: 17, scope: !472)
!477 = !DILocation(line: 46, column: 25, scope: !472)
!478 = !DILocation(line: 46, column: 30, scope: !472)
!479 = !DILocation(line: 46, column: 23, scope: !472)
!480 = !DILocation(line: 46, column: 5, scope: !472)
!481 = !DILocation(line: 46, column: 11, scope: !472)
!482 = !DILocation(line: 46, column: 14, scope: !472)
!483 = !DILocation(line: 45, column: 46, scope: !472)
!484 = distinct !{!484, !474, !485, !486}
!485 = !DILocation(line: 46, column: 31, scope: !468)
!486 = !{!"llvm.loop.name", !"UPDATE"}
!487 = !DILocation(line: 47, column: 1, scope: !457)
!488 = distinct !DISubprogram(name: "SgdLR", linkageName: "_Z5SgdLRPfPhS_", scope: !378, file: !378, line: 50, type: !489, isLocal: false, isDefinition: true, scopeLine: 54, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!489 = !DISubroutineType(types: !490)
!490 = !{null, !383, !491, !382}
!491 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !492, size: 64)
!492 = !DIDerivedType(tag: DW_TAG_typedef, name: "LabelType", file: !6, line: 24, baseType: !493)
!493 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!494 = !{!495}
!495 = !{!"fpga.top", !"user", !496}
!496 = !DILocation(line: 50, column: 16, scope: !488)
!497 = !DILocalVariable(name: "data", arg: 1, scope: !488, file: !378, line: 51, type: !383)
!498 = !DILocation(line: 51, column: 14, scope: !488)
!499 = !DILocalVariable(name: "label", arg: 2, scope: !488, file: !378, line: 52, type: !491)
!500 = !DILocation(line: 52, column: 15, scope: !488)
!501 = !DILocalVariable(name: "theta", arg: 3, scope: !488, file: !378, line: 53, type: !382)
!502 = !DILocation(line: 53, column: 17, scope: !488)
!503 = !DILocation(line: 56, column: 3, scope: !488)
!504 = !DILocalVariable(name: "gradient", scope: !488, file: !378, line: 56, type: !505)
!505 = !DICompositeType(tag: DW_TAG_array_type, baseType: !381, size: 32768, elements: !506)
!506 = !{!507}
!507 = !DISubrange(count: 1024)
!508 = !DILocation(line: 56, column: 15, scope: !488)
!509 = !DILocation(line: 60, column: 15, scope: !510)
!510 = distinct !DILexicalBlock(scope: !488, file: !378, line: 60, column: 10)
!511 = !DILocalVariable(name: "epoch", scope: !510, file: !378, line: 60, type: !8)
!512 = !DILocation(line: 60, column: 19, scope: !510)
!513 = !DILocation(line: 60, column: 30, scope: !514)
!514 = distinct !DILexicalBlock(scope: !510, file: !378, line: 60, column: 10)
!515 = !DILocation(line: 60, column: 36, scope: !514)
!516 = !DILocation(line: 60, column: 10, scope: !510)
!517 = !DILocation(line: 60, column: 10, scope: !514)
!518 = !DILocation(line: 61, column: 3, scope: !514)
!519 = !DILocation(line: 63, column: 25, scope: !520)
!520 = distinct !DILexicalBlock(scope: !521, file: !378, line: 63, column: 20)
!521 = distinct !DILexicalBlock(scope: !514, file: !378, line: 61, column: 3)
!522 = !DILocalVariable(name: "training_id", scope: !520, file: !378, line: 63, type: !8)
!523 = !DILocation(line: 63, column: 29, scope: !520)
!524 = !DILocation(line: 63, column: 46, scope: !525)
!525 = distinct !DILexicalBlock(scope: !520, file: !378, line: 63, column: 20)
!526 = !DILocation(line: 63, column: 58, scope: !525)
!527 = !DILocation(line: 63, column: 20, scope: !520)
!528 = !DILocation(line: 63, column: 20, scope: !525)
!529 = !DILocation(line: 66, column: 7, scope: !530)
!530 = distinct !DILexicalBlock(scope: !525, file: !378, line: 64, column: 5)
!531 = !DILocalVariable(name: "dot", scope: !530, file: !378, line: 66, type: !381)
!532 = !DILocation(line: 66, column: 19, scope: !530)
!533 = !DILocation(line: 66, column: 36, scope: !530)
!534 = !DILocation(line: 66, column: 44, scope: !530)
!535 = !DILocation(line: 66, column: 64, scope: !530)
!536 = !DILocation(line: 66, column: 62, scope: !530)
!537 = !DILocation(line: 66, column: 25, scope: !530)
!538 = !DILocation(line: 68, column: 7, scope: !530)
!539 = !DILocalVariable(name: "prob", scope: !530, file: !378, line: 68, type: !381)
!540 = !DILocation(line: 68, column: 19, scope: !530)
!541 = !DILocation(line: 68, column: 34, scope: !530)
!542 = !DILocation(line: 68, column: 26, scope: !530)
!543 = !DILocation(line: 70, column: 23, scope: !530)
!544 = !DILocation(line: 70, column: 34, scope: !530)
!545 = !DILocation(line: 70, column: 54, scope: !530)
!546 = !DILocation(line: 70, column: 52, scope: !530)
!547 = !DILocation(line: 70, column: 69, scope: !530)
!548 = !DILocation(line: 70, column: 76, scope: !530)
!549 = !DILocation(line: 70, column: 82, scope: !530)
!550 = !DILocation(line: 70, column: 74, scope: !530)
!551 = !DILocation(line: 70, column: 7, scope: !530)
!552 = !DILocation(line: 72, column: 23, scope: !530)
!553 = !DILocation(line: 72, column: 30, scope: !530)
!554 = !DILocation(line: 72, column: 7, scope: !530)
!555 = !DILocation(line: 73, column: 5, scope: !525)
!556 = !DILocation(line: 73, column: 5, scope: !530)
!557 = !DILocation(line: 63, column: 86, scope: !525)
!558 = distinct !{!558, !527, !559, !560}
!559 = !DILocation(line: 73, column: 5, scope: !520)
!560 = !{!"llvm.loop.name", !"TRAINING_INST"}
!561 = !DILocation(line: 74, column: 3, scope: !521)
!562 = !DILocation(line: 60, column: 56, scope: !514)
!563 = distinct !{!563, !516, !564, !565}
!564 = !DILocation(line: 74, column: 3, scope: !510)
!565 = !{!"llvm.loop.name", !"EPOCH"}
!566 = !DILocation(line: 75, column: 1, scope: !488)
