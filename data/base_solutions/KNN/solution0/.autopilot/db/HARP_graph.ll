; ModuleID = '<stdin>'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: nounwind
define void @md_kernel(double* "fpga.decayed.dim.hint"="256" %force_x, double* "fpga.decayed.dim.hint"="256" %force_y, double* "fpga.decayed.dim.hint"="256" %force_z, double* "fpga.decayed.dim.hint"="256" %position_x, double* "fpga.decayed.dim.hint"="256" %position_y, double* "fpga.decayed.dim.hint"="256" %position_z, i32* "fpga.decayed.dim.hint"="4096" %NL) #0 !fpga.function.pragma !4 !id !6 {
entry:
  br label %loop_i, !id !7, !id.8 !7

loop_i:                                           ; preds = %entry
  br label %for.cond, !id !8, !id.10 !8

for.cond:                                         ; preds = %for.inc41, %loop_i
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc41 ], [ 0, %loop_i ], !id !9, !id.11 !9
  %exitcond5 = icmp ne i64 %indvars.iv2, 256, !id !10, !id.13 !10
  br i1 %exitcond5, label %for.body, label %for.end43, !id !11, !id.14 !11

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds double, double* %position_x, i64 %indvars.iv2, !id !12, !id.15 !12
  %0 = load double, double* %arrayidx, align 8, !id !13, !id.16 !13
  %arrayidx2 = getelementptr inbounds double, double* %position_y, i64 %indvars.iv2, !id !14, !id.18 !14
  %1 = load double, double* %arrayidx2, align 8, !id !15, !id.19 !15
  %arrayidx4 = getelementptr inbounds double, double* %position_z, i64 %indvars.iv2, !id !16, !id.21 !16
  %2 = load double, double* %arrayidx4, align 8, !id !17, !id.22 !17
  br label %loop_j, !id !18, !id.27 !18

loop_j:                                           ; preds = %for.body
  br label %for.cond5, !id !19, !id.29 !19

for.cond5:                                        ; preds = %for.inc, %loop_j
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %loop_j ], !id !20, !id.30 !20
  %fx.0 = phi double [ 0.000000e+00, %loop_j ], [ %add30, %for.inc ], !id !21, !id.31 !21
  %fy.0 = phi double [ 0.000000e+00, %loop_j ], [ %add32, %for.inc ], !id !22, !id.32 !22
  %fz.0 = phi double [ 0.000000e+00, %loop_j ], [ %add34, %for.inc ], !id !23, !id.33 !23
  %exitcond = icmp ne i64 %indvars.iv, 16, !id !24, !id.38 !24
  br i1 %exitcond, label %for.body7, label %for.end, !id !25, !id.39 !25

for.body7:                                        ; preds = %for.cond5
  %3 = mul nuw nsw i64 %indvars.iv2, 16, !id !26, !id.40 !26
  %4 = add nuw nsw i64 %3, %indvars.iv, !id !27, !id.41 !27
  %arrayidx9 = getelementptr inbounds i32, i32* %NL, i64 %4, !id !28, !id.42 !28
  %5 = load i32, i32* %arrayidx9, align 4, !id !29, !id.43 !29
  %idxprom10 = sext i32 %5 to i64, !id !30, !id.45 !30
  %arrayidx11 = getelementptr inbounds double, double* %position_x, i64 %idxprom10, !id !31, !id.46 !31
  %6 = load double, double* %arrayidx11, align 8, !id !32, !id.47 !32
  %idxprom12 = sext i32 %5 to i64, !id !33, !id.49 !33
  %arrayidx13 = getelementptr inbounds double, double* %position_y, i64 %idxprom12, !id !34, !id.50 !34
  %7 = load double, double* %arrayidx13, align 8, !id !35, !id.51 !35
  %idxprom14 = sext i32 %5 to i64, !id !36, !id.53 !36
  %arrayidx15 = getelementptr inbounds double, double* %position_z, i64 %idxprom14, !id !37, !id.54 !37
  %8 = load double, double* %arrayidx15, align 8, !id !38, !id.55 !38
  %sub = fsub double %0, %6, !id !39, !id.57 !39
  %sub16 = fsub double %1, %7, !id !40, !id.59 !40
  %sub17 = fsub double %2, %8, !id !41, !id.61 !41
  %mul18 = fmul double %sub, %sub, !id !42, !id.63 !42
  %mul19 = fmul double %sub16, %sub16, !id !43, !id.64 !43
  %add20 = fadd double %mul18, %mul19, !id !44, !id.65 !44
  %mul21 = fmul double %sub17, %sub17, !id !45, !id.66 !45
  %add22 = fadd double %add20, %mul21, !id !46, !id.67 !46
  %div = fdiv double 1.000000e+00, %add22, !id !47, !id.68 !47
  %mul23 = fmul double %div, %div, !id !48, !id.70 !48
  %mul24 = fmul double %mul23, %div, !id !49, !id.71 !49
  %mul25 = fmul double 1.500000e+00, %mul24, !id !50, !id.73 !50
  %sub26 = fsub double %mul25, 2.000000e+00, !id !51, !id.74 !51
  %mul27 = fmul double %mul24, %sub26, !id !52, !id.75 !52
  %mul28 = fmul double %div, %mul27, !id !53, !id.77 !53
  %mul29 = fmul double %sub, %mul28, !id !54, !id.79 !54
  %add30 = fadd double %fx.0, %mul29, !id !55, !id.80 !55
  %mul31 = fmul double %sub16, %mul28, !id !56, !id.82 !56
  %add32 = fadd double %fy.0, %mul31, !id !57, !id.83 !57
  %mul33 = fmul double %sub17, %mul28, !id !58, !id.85 !58
  %add34 = fadd double %fz.0, %mul33, !id !59, !id.86 !59
  br label %for.inc, !id !60, !id.88 !60

for.inc:                                          ; preds = %for.body7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !61, !id.89 !61
  br label %for.cond5, !llvm.loop !62, !id !63, !id.91 !63

for.end:                                          ; preds = %for.cond5
  %fx.0.lcssa = phi double [ %fx.0, %for.cond5 ], !id !64, !id.92 !64
  %fy.0.lcssa = phi double [ %fy.0, %for.cond5 ], !id !65, !id.93 !65
  %fz.0.lcssa = phi double [ %fz.0, %for.cond5 ], !id !66, !id.94 !66
  %arrayidx36 = getelementptr inbounds double, double* %force_x, i64 %indvars.iv2, !id !67, !id.95 !67
  store double %fx.0.lcssa, double* %arrayidx36, align 8, !id !68, !id.96 !68
  %arrayidx38 = getelementptr inbounds double, double* %force_y, i64 %indvars.iv2, !id !69, !id.97 !69
  store double %fy.0.lcssa, double* %arrayidx38, align 8, !id !70, !id.98 !70
  %arrayidx40 = getelementptr inbounds double, double* %force_z, i64 %indvars.iv2, !id !71, !id.99 !71
  store double %fz.0.lcssa, double* %arrayidx40, align 8, !id !72, !id.100 !72
  br label %for.inc41, !id !73, !id.101 !73

for.inc41:                                        ; preds = %for.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1, !id !74, !id.102 !74
  br label %for.cond, !llvm.loop !75, !id !76, !id.104 !76

for.end43:                                        ; preds = %for.cond
  ret void, !id !77, !id.105 !77
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.static.pipeline"="0.-1" "fpga.top.func"="md_kernel" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{!5}
!5 = !{!"fpga.static.pipeline", !"user"}
!6 = !{i32 1}
!7 = !{i32 8}
!8 = !{i32 10}
!9 = !{i32 11}
!10 = !{i32 13}
!11 = !{i32 14}
!12 = !{i32 15}
!13 = !{i32 16}
!14 = !{i32 18}
!15 = !{i32 19}
!16 = !{i32 21}
!17 = !{i32 22}
!18 = !{i32 27}
!19 = !{i32 29}
!20 = !{i32 30}
!21 = !{i32 31}
!22 = !{i32 32}
!23 = !{i32 33}
!24 = !{i32 38}
!25 = !{i32 39}
!26 = !{i32 40}
!27 = !{i32 41}
!28 = !{i32 42}
!29 = !{i32 43}
!30 = !{i32 45}
!31 = !{i32 46}
!32 = !{i32 47}
!33 = !{i32 49}
!34 = !{i32 50}
!35 = !{i32 51}
!36 = !{i32 53}
!37 = !{i32 54}
!38 = !{i32 55}
!39 = !{i32 57}
!40 = !{i32 59}
!41 = !{i32 61}
!42 = !{i32 63}
!43 = !{i32 64}
!44 = !{i32 65}
!45 = !{i32 66}
!46 = !{i32 67}
!47 = !{i32 68}
!48 = !{i32 70}
!49 = !{i32 71}
!50 = !{i32 73}
!51 = !{i32 74}
!52 = !{i32 75}
!53 = !{i32 77}
!54 = !{i32 79}
!55 = !{i32 80}
!56 = !{i32 82}
!57 = !{i32 83}
!58 = !{i32 85}
!59 = !{i32 86}
!60 = !{i32 88}
!61 = !{i32 89}
!62 = distinct !{!62, i32 3}
!63 = !{i32 91}
!64 = !{i32 92}
!65 = !{i32 93}
!66 = !{i32 94}
!67 = !{i32 95}
!68 = !{i32 96}
!69 = !{i32 97}
!70 = !{i32 98}
!71 = !{i32 99}
!72 = !{i32 100}
!73 = !{i32 101}
!74 = !{i32 102}
!75 = distinct !{!75, i32 2}
!76 = !{i32 104}
!77 = !{i32 105}
