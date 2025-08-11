; ModuleID = '<stdin>'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: nounwind
define void @kernel_gramschmidt(i32 %ni, i32 %nj, [512 x double]* "fpga.decayed.dim.hint"="512" %A, [512 x double]* "fpga.decayed.dim.hint"="512" %R, [512 x double]* "fpga.decayed.dim.hint"="512" %Q) #0 !fpga.function.pragma !4 !id !6 {
entry:
  br label %loop1, !id !7, !id.6 !7

loop1:                                            ; preds = %entry
  %0 = sext i32 %ni to i64, !id !8, !id.8 !8
  %1 = sext i32 %ni to i64, !id !9, !id.9 !9
  %2 = sext i32 %ni to i64, !id !10, !id.10 !10
  %3 = sext i32 %ni to i64, !id !11, !id.11 !11
  %4 = sext i32 %nj to i64, !id !12, !id.12 !12
  br label %for.cond, !id !13, !id.13 !13

for.cond:                                         ; preds = %for.inc86, %loop1
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %for.inc86 ], [ 0, %loop1 ], !id !14, !id.14 !14
  %indvars.iv7 = phi i32 [ %indvars.iv.next8, %for.inc86 ], [ 1, %loop1 ], !id !15, !id.15 !15
  %5 = sext i32 %indvars.iv7 to i64, !id !16, !id.17 !16
  %cmp = icmp slt i64 %indvars.iv11, %4, !id !17, !id.18 !17
  br i1 %cmp, label %for.body, label %for.end88, !id !18, !id.19 !18

for.body:                                         ; preds = %for.cond
  br label %loop2, !id !19, !id.21 !19

loop2:                                            ; preds = %for.body
  br label %for.cond1, !id !20, !id.23 !20

for.cond1:                                        ; preds = %for.inc, %loop2
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %loop2 ], !id !21, !id.24 !21
  %nrm.0 = phi double [ 0.000000e+00, %loop2 ], [ %add, %for.inc ], !id !22, !id.25 !22
  %cmp2 = icmp slt i64 %indvars.iv, %0, !id !23, !id.28 !23
  br i1 %cmp2, label %for.body3, label %for.end, !id !24, !id.29 !24

for.body3:                                        ; preds = %for.cond1
  %arrayidx = getelementptr inbounds [512 x double], [512 x double]* %A, i64 %indvars.iv, !id !25, !id.30 !25
  %arrayidx5 = getelementptr inbounds [512 x double], [512 x double]* %arrayidx, i64 0, i64 %indvars.iv11, !id !26, !id.31 !26
  %6 = load double, double* %arrayidx5, align 8, !id !27, !id.32 !27
  %arrayidx7 = getelementptr inbounds [512 x double], [512 x double]* %A, i64 %indvars.iv, !id !28, !id.33 !28
  %arrayidx9 = getelementptr inbounds [512 x double], [512 x double]* %arrayidx7, i64 0, i64 %indvars.iv11, !id !29, !id.34 !29
  %7 = load double, double* %arrayidx9, align 8, !id !30, !id.35 !30
  %mul = fmul double %6, %7, !id !31, !id.36 !31
  %add = fadd double %nrm.0, %mul, !id !32, !id.37 !32
  br label %for.inc, !id !33, !id.39 !33

for.inc:                                          ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !34, !id.40 !34
  br label %for.cond1, !llvm.loop !35, !id !36, !id.42 !36

for.end:                                          ; preds = %for.cond1
  %nrm.0.lcssa = phi double [ %nrm.0, %for.cond1 ], !id !37, !id.43 !37
  %8 = call double @llvm.sqrt.f64(double %nrm.0.lcssa), !id !38, !id.44 !38
  %arrayidx11 = getelementptr inbounds [512 x double], [512 x double]* %R, i64 %indvars.iv11, !id !39, !id.45 !39
  %arrayidx13 = getelementptr inbounds [512 x double], [512 x double]* %arrayidx11, i64 0, i64 %indvars.iv11, !id !40, !id.46 !40
  store double %8, double* %arrayidx13, align 8, !id !41, !id.47 !41
  br label %loop3, !id !42, !id.48 !42

loop3:                                            ; preds = %for.end
  br label %for.cond14, !id !43, !id.50 !43

for.cond14:                                       ; preds = %for.inc29, %loop3
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc29 ], [ 0, %loop3 ], !id !44, !id.51 !44
  %cmp15 = icmp slt i64 %indvars.iv1, %1, !id !45, !id.53 !45
  br i1 %cmp15, label %for.body16, label %for.end31, !id !46, !id.54 !46

for.body16:                                       ; preds = %for.cond14
  %arrayidx18 = getelementptr inbounds [512 x double], [512 x double]* %A, i64 %indvars.iv1, !id !47, !id.55 !47
  %arrayidx20 = getelementptr inbounds [512 x double], [512 x double]* %arrayidx18, i64 0, i64 %indvars.iv11, !id !48, !id.56 !48
  %9 = load double, double* %arrayidx20, align 8, !id !49, !id.57 !49
  %arrayidx22 = getelementptr inbounds [512 x double], [512 x double]* %R, i64 %indvars.iv11, !id !50, !id.58 !50
  %arrayidx24 = getelementptr inbounds [512 x double], [512 x double]* %arrayidx22, i64 0, i64 %indvars.iv11, !id !51, !id.59 !51
  %10 = load double, double* %arrayidx24, align 8, !id !52, !id.60 !52
  %div = fdiv double %9, %10, !id !53, !id.61 !53
  %arrayidx26 = getelementptr inbounds [512 x double], [512 x double]* %Q, i64 %indvars.iv1, !id !54, !id.62 !54
  %arrayidx28 = getelementptr inbounds [512 x double], [512 x double]* %arrayidx26, i64 0, i64 %indvars.iv11, !id !55, !id.63 !55
  store double %div, double* %arrayidx28, align 8, !id !56, !id.64 !56
  br label %for.inc29, !id !57, !id.65 !57

for.inc29:                                        ; preds = %for.body16
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1, !id !58, !id.66 !58
  br label %for.cond14, !llvm.loop !59, !id !60, !id.68 !60

for.end31:                                        ; preds = %for.cond14
  br label %loop4, !id !61, !id.69 !61

loop4:                                            ; preds = %for.end31
  br label %for.cond33, !id !62, !id.71 !62

for.cond33:                                       ; preds = %for.inc83, %loop4
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.inc83 ], [ %5, %loop4 ], !id !63, !id.72 !63
  %wide.trip.count = sext i32 %nj to i64, !id !64, !id.74 !64
  %exitcond = icmp ne i64 %indvars.iv9, %wide.trip.count, !id !65, !id.75 !65
  br i1 %exitcond, label %for.body35, label %for.end85, !id !66, !id.76 !66

for.body35:                                       ; preds = %for.cond33
  %arrayidx37 = getelementptr inbounds [512 x double], [512 x double]* %R, i64 %indvars.iv11, !id !67, !id.77 !67
  %arrayidx39 = getelementptr inbounds [512 x double], [512 x double]* %arrayidx37, i64 0, i64 %indvars.iv9, !id !68, !id.78 !68
  store double 0.000000e+00, double* %arrayidx39, align 8, !id !69, !id.79 !69
  br label %loop5, !id !70, !id.80 !70

loop5:                                            ; preds = %for.body35
  br label %for.cond40, !id !71, !id.82 !71

for.cond40:                                       ; preds = %for.inc57, %loop5
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %for.inc57 ], [ 0, %loop5 ], !id !72, !id.83 !72
  %cmp41 = icmp slt i64 %indvars.iv3, %2, !id !73, !id.85 !73
  br i1 %cmp41, label %for.body42, label %for.end59, !id !74, !id.86 !74

for.body42:                                       ; preds = %for.cond40
  %arrayidx44 = getelementptr inbounds [512 x double], [512 x double]* %Q, i64 %indvars.iv3, !id !75, !id.87 !75
  %arrayidx46 = getelementptr inbounds [512 x double], [512 x double]* %arrayidx44, i64 0, i64 %indvars.iv11, !id !76, !id.88 !76
  %11 = load double, double* %arrayidx46, align 8, !id !77, !id.89 !77
  %arrayidx48 = getelementptr inbounds [512 x double], [512 x double]* %A, i64 %indvars.iv3, !id !78, !id.90 !78
  %arrayidx50 = getelementptr inbounds [512 x double], [512 x double]* %arrayidx48, i64 0, i64 %indvars.iv9, !id !79, !id.91 !79
  %12 = load double, double* %arrayidx50, align 8, !id !80, !id.92 !80
  %mul51 = fmul double %11, %12, !id !81, !id.93 !81
  %arrayidx53 = getelementptr inbounds [512 x double], [512 x double]* %R, i64 %indvars.iv11, !id !82, !id.94 !82
  %arrayidx55 = getelementptr inbounds [512 x double], [512 x double]* %arrayidx53, i64 0, i64 %indvars.iv9, !id !83, !id.95 !83
  %13 = load double, double* %arrayidx55, align 8, !id !84, !id.96 !84
  %add56 = fadd double %13, %mul51, !id !85, !id.97 !85
  store double %add56, double* %arrayidx55, align 8, !id !86, !id.98 !86
  br label %for.inc57, !id !87, !id.99 !87

for.inc57:                                        ; preds = %for.body42
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1, !id !88, !id.100 !88
  br label %for.cond40, !llvm.loop !89, !id !90, !id.102 !90

for.end59:                                        ; preds = %for.cond40
  br label %loop6, !id !91, !id.103 !91

loop6:                                            ; preds = %for.end59
  br label %for.cond60, !id !92, !id.105 !92

for.cond60:                                       ; preds = %for.inc80, %loop6
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %for.inc80 ], [ 0, %loop6 ], !id !93, !id.106 !93
  %cmp61 = icmp slt i64 %indvars.iv5, %3, !id !94, !id.108 !94
  br i1 %cmp61, label %for.body62, label %for.end82, !id !95, !id.109 !95

for.body62:                                       ; preds = %for.cond60
  %arrayidx64 = getelementptr inbounds [512 x double], [512 x double]* %A, i64 %indvars.iv5, !id !96, !id.110 !96
  %arrayidx66 = getelementptr inbounds [512 x double], [512 x double]* %arrayidx64, i64 0, i64 %indvars.iv9, !id !97, !id.111 !97
  %14 = load double, double* %arrayidx66, align 8, !id !98, !id.112 !98
  %arrayidx68 = getelementptr inbounds [512 x double], [512 x double]* %Q, i64 %indvars.iv5, !id !99, !id.113 !99
  %arrayidx70 = getelementptr inbounds [512 x double], [512 x double]* %arrayidx68, i64 0, i64 %indvars.iv11, !id !100, !id.114 !100
  %15 = load double, double* %arrayidx70, align 8, !id !101, !id.115 !101
  %arrayidx72 = getelementptr inbounds [512 x double], [512 x double]* %R, i64 %indvars.iv11, !id !102, !id.116 !102
  %arrayidx74 = getelementptr inbounds [512 x double], [512 x double]* %arrayidx72, i64 0, i64 %indvars.iv9, !id !103, !id.117 !103
  %16 = load double, double* %arrayidx74, align 8, !id !104, !id.118 !104
  %mul75 = fmul double %15, %16, !id !105, !id.119 !105
  %sub = fsub double %14, %mul75, !id !106, !id.120 !106
  %arrayidx77 = getelementptr inbounds [512 x double], [512 x double]* %A, i64 %indvars.iv5, !id !107, !id.121 !107
  %arrayidx79 = getelementptr inbounds [512 x double], [512 x double]* %arrayidx77, i64 0, i64 %indvars.iv9, !id !108, !id.122 !108
  store double %sub, double* %arrayidx79, align 8, !id !109, !id.123 !109
  br label %for.inc80, !id !110, !id.124 !110

for.inc80:                                        ; preds = %for.body62
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !id !111, !id.125 !111
  br label %for.cond60, !llvm.loop !112, !id !113, !id.127 !113

for.end82:                                        ; preds = %for.cond60
  br label %for.inc83, !id !114, !id.128 !114

for.inc83:                                        ; preds = %for.end82
  %indvars.iv.next10 = add nsw i64 %indvars.iv9, 1, !id !115, !id.129 !115
  br label %for.cond33, !llvm.loop !116, !id !117, !id.131 !117

for.end85:                                        ; preds = %for.cond33
  br label %for.inc86, !id !118, !id.132 !118

for.inc86:                                        ; preds = %for.end85
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1, !id !119, !id.133 !119
  %indvars.iv.next8 = add nuw i32 %indvars.iv7, 1, !id !120, !id.135 !120
  br label %for.cond, !llvm.loop !121, !id !122, !id.136 !122

for.end88:                                        ; preds = %for.cond
  ret void, !id !123, !id.137 !123
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare double @llvm.sqrt.f64(double) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.static.pipeline"="0.-1" "fpga.top.func"="kernel_gramschmidt" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!7 = !{i32 6}
!8 = !{i32 8}
!9 = !{i32 9}
!10 = !{i32 10}
!11 = !{i32 11}
!12 = !{i32 12}
!13 = !{i32 13}
!14 = !{i32 14}
!15 = !{i32 15}
!16 = !{i32 17}
!17 = !{i32 18}
!18 = !{i32 19}
!19 = !{i32 21}
!20 = !{i32 23}
!21 = !{i32 24}
!22 = !{i32 25}
!23 = !{i32 28}
!24 = !{i32 29}
!25 = !{i32 30}
!26 = !{i32 31}
!27 = !{i32 32}
!28 = !{i32 33}
!29 = !{i32 34}
!30 = !{i32 35}
!31 = !{i32 36}
!32 = !{i32 37}
!33 = !{i32 39}
!34 = !{i32 40}
!35 = distinct !{!35, i32 7}
!36 = !{i32 42}
!37 = !{i32 43}
!38 = !{i32 44}
!39 = !{i32 45}
!40 = !{i32 46}
!41 = !{i32 47}
!42 = !{i32 48}
!43 = !{i32 50}
!44 = !{i32 51}
!45 = !{i32 53}
!46 = !{i32 54}
!47 = !{i32 55}
!48 = !{i32 56}
!49 = !{i32 57}
!50 = !{i32 58}
!51 = !{i32 59}
!52 = !{i32 60}
!53 = !{i32 61}
!54 = !{i32 62}
!55 = !{i32 63}
!56 = !{i32 64}
!57 = !{i32 65}
!58 = !{i32 66}
!59 = distinct !{!59, i32 6}
!60 = !{i32 68}
!61 = !{i32 69}
!62 = !{i32 71}
!63 = !{i32 72}
!64 = !{i32 74}
!65 = !{i32 75}
!66 = !{i32 76}
!67 = !{i32 77}
!68 = !{i32 78}
!69 = !{i32 79}
!70 = !{i32 80}
!71 = !{i32 82}
!72 = !{i32 83}
!73 = !{i32 85}
!74 = !{i32 86}
!75 = !{i32 87}
!76 = !{i32 88}
!77 = !{i32 89}
!78 = !{i32 90}
!79 = !{i32 91}
!80 = !{i32 92}
!81 = !{i32 93}
!82 = !{i32 94}
!83 = !{i32 95}
!84 = !{i32 96}
!85 = !{i32 97}
!86 = !{i32 98}
!87 = !{i32 99}
!88 = !{i32 100}
!89 = distinct !{!89, i32 5}
!90 = !{i32 102}
!91 = !{i32 103}
!92 = !{i32 105}
!93 = !{i32 106}
!94 = !{i32 108}
!95 = !{i32 109}
!96 = !{i32 110}
!97 = !{i32 111}
!98 = !{i32 112}
!99 = !{i32 113}
!100 = !{i32 114}
!101 = !{i32 115}
!102 = !{i32 116}
!103 = !{i32 117}
!104 = !{i32 118}
!105 = !{i32 119}
!106 = !{i32 120}
!107 = !{i32 121}
!108 = !{i32 122}
!109 = !{i32 123}
!110 = !{i32 124}
!111 = !{i32 125}
!112 = distinct !{!112, i32 4}
!113 = !{i32 127}
!114 = !{i32 128}
!115 = !{i32 129}
!116 = distinct !{!116, i32 3}
!117 = !{i32 131}
!118 = !{i32 132}
!119 = !{i32 133}
!120 = !{i32 135}
!121 = distinct !{!121, i32 2}
!122 = !{i32 136}
!123 = !{i32 137}
