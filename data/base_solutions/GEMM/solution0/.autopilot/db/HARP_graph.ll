; ModuleID = '<stdin>'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: nounwind
define void @bbgemm(double* "fpga.decayed.dim.hint"="4096" %m1, double* "fpga.decayed.dim.hint"="4096" %m2, double* "fpga.decayed.dim.hint"="4096" %prod) #0 !fpga.function.pragma !4 !id !6 {
entry:
  br label %loopjj, !id !7, !id.4 !7

loopjj:                                           ; preds = %entry
  br label %for.cond, !id !8, !id.6 !8

for.cond:                                         ; preds = %for.inc36, %loopjj
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %for.inc36 ], [ 0, %loopjj ], !id !9, !id.7 !9
  %cmp = icmp slt i64 %indvars.iv18, 64, !id !10, !id.9 !10
  br i1 %cmp, label %for.body, label %for.end38, !id !11, !id.10 !11

for.body:                                         ; preds = %for.cond
  br label %loopkk, !id !12, !id.11 !12

loopkk:                                           ; preds = %for.body
  br label %for.cond1, !id !13, !id.13 !13

for.cond1:                                        ; preds = %for.inc33, %loopkk
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.inc33 ], [ 0, %loopkk ], !id !14, !id.14 !14
  %cmp2 = icmp slt i64 %indvars.iv16, 64, !id !15, !id.16 !15
  br i1 %cmp2, label %for.body3, label %for.end35, !id !16, !id.17 !16

for.body3:                                        ; preds = %for.cond1
  br label %loopi, !id !17, !id.18 !17

loopi:                                            ; preds = %for.body3
  br label %for.cond4, !id !18, !id.20 !18

for.cond4:                                        ; preds = %for.inc30, %loopi
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.inc30 ], [ 0, %loopi ], !id !19, !id.21 !19
  %exitcond15 = icmp ne i64 %indvars.iv12, 64, !id !20, !id.23 !20
  br i1 %exitcond15, label %for.body6, label %for.end32, !id !21, !id.24 !21

for.body6:                                        ; preds = %for.cond4
  br label %loopk, !id !22, !id.25 !22

loopk:                                            ; preds = %for.body6
  br label %for.cond7, !id !23, !id.27 !23

for.cond7:                                        ; preds = %for.inc27, %loopk
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %for.inc27 ], [ 0, %loopk ], !id !24, !id.28 !24
  %exitcond11 = icmp ne i64 %indvars.iv5, 8, !id !25, !id.30 !25
  br i1 %exitcond11, label %for.body9, label %for.end29, !id !26, !id.31 !26

for.body9:                                        ; preds = %for.cond7
  %0 = mul nuw nsw i64 %indvars.iv12, 64, !id !27, !id.32 !27
  %1 = add nuw nsw i64 %indvars.iv5, %indvars.iv16, !id !28, !id.34 !28
  %2 = mul nuw nsw i64 %1, 64, !id !29, !id.35 !29
  %3 = add nuw nsw i64 %0, %indvars.iv5, !id !30, !id.37 !30
  %4 = add nuw nsw i64 %3, %indvars.iv16, !id !31, !id.38 !31
  %arrayidx = getelementptr inbounds double, double* %m1, i64 %4, !id !32, !id.39 !32
  %5 = load double, double* %arrayidx, align 8, !id !33, !id.40 !33
  br label %loopj, !id !34, !id.42 !34

loopj:                                            ; preds = %for.body9
  br label %for.cond14, !id !35, !id.44 !35

for.cond14:                                       ; preds = %for.inc, %loopj
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %loopj ], !id !36, !id.45 !36
  %exitcond = icmp ne i64 %indvars.iv, 8, !id !37, !id.47 !37
  br i1 %exitcond, label %for.body16, label %for.end, !id !38, !id.48 !38

for.body16:                                       ; preds = %for.cond14
  %6 = add nuw nsw i64 %2, %indvars.iv, !id !39, !id.49 !39
  %7 = add nuw nsw i64 %6, %indvars.iv18, !id !40, !id.50 !40
  %arrayidx20 = getelementptr inbounds double, double* %m2, i64 %7, !id !41, !id.51 !41
  %8 = load double, double* %arrayidx20, align 8, !id !42, !id.52 !42
  %mul21 = fmul double %5, %8, !id !43, !id.53 !43
  %9 = add nuw nsw i64 %0, %indvars.iv, !id !44, !id.55 !44
  %10 = add nuw nsw i64 %9, %indvars.iv18, !id !45, !id.56 !45
  %arrayidx25 = getelementptr inbounds double, double* %prod, i64 %10, !id !46, !id.57 !46
  %11 = load double, double* %arrayidx25, align 8, !id !47, !id.58 !47
  %add26 = fadd double %11, %mul21, !id !48, !id.59 !48
  store double %add26, double* %arrayidx25, align 8, !id !49, !id.60 !49
  br label %for.inc, !id !50, !id.61 !50

for.inc:                                          ; preds = %for.body16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !id !51, !id.62 !51
  br label %for.cond14, !llvm.loop !52, !id !53, !id.64 !53

for.end:                                          ; preds = %for.cond14
  br label %for.inc27, !id !54, !id.65 !54

for.inc27:                                        ; preds = %for.end
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1, !id !55, !id.66 !55
  br label %for.cond7, !llvm.loop !56, !id !57, !id.68 !57

for.end29:                                        ; preds = %for.cond7
  br label %for.inc30, !id !58, !id.69 !58

for.inc30:                                        ; preds = %for.end29
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1, !id !59, !id.70 !59
  br label %for.cond4, !llvm.loop !60, !id !61, !id.72 !61

for.end32:                                        ; preds = %for.cond4
  br label %for.inc33, !id !62, !id.73 !62

for.inc33:                                        ; preds = %for.end32
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 8, !id !63, !id.74 !63
  br label %for.cond1, !llvm.loop !64, !id !65, !id.76 !65

for.end35:                                        ; preds = %for.cond1
  br label %for.inc36, !id !66, !id.77 !66

for.inc36:                                        ; preds = %for.end35
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 8, !id !67, !id.78 !67
  br label %for.cond, !llvm.loop !68, !id !69, !id.80 !69

for.end38:                                        ; preds = %for.cond
  ret void, !id !70, !id.81 !70
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "fpga.static.pipeline"="0.-1" "fpga.top.func"="bbgemm" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!7 = !{i32 4}
!8 = !{i32 6}
!9 = !{i32 7}
!10 = !{i32 9}
!11 = !{i32 10}
!12 = !{i32 11}
!13 = !{i32 13}
!14 = !{i32 14}
!15 = !{i32 16}
!16 = !{i32 17}
!17 = !{i32 18}
!18 = !{i32 20}
!19 = !{i32 21}
!20 = !{i32 23}
!21 = !{i32 24}
!22 = !{i32 25}
!23 = !{i32 27}
!24 = !{i32 28}
!25 = !{i32 30}
!26 = !{i32 31}
!27 = !{i32 32}
!28 = !{i32 34}
!29 = !{i32 35}
!30 = !{i32 37}
!31 = !{i32 38}
!32 = !{i32 39}
!33 = !{i32 40}
!34 = !{i32 42}
!35 = !{i32 44}
!36 = !{i32 45}
!37 = !{i32 47}
!38 = !{i32 48}
!39 = !{i32 49}
!40 = !{i32 50}
!41 = !{i32 51}
!42 = !{i32 52}
!43 = !{i32 53}
!44 = !{i32 55}
!45 = !{i32 56}
!46 = !{i32 57}
!47 = !{i32 58}
!48 = !{i32 59}
!49 = !{i32 60}
!50 = !{i32 61}
!51 = !{i32 62}
!52 = distinct !{!52, i32 6}
!53 = !{i32 64}
!54 = !{i32 65}
!55 = !{i32 66}
!56 = distinct !{!56, i32 5}
!57 = !{i32 68}
!58 = !{i32 69}
!59 = !{i32 70}
!60 = distinct !{!60, i32 4}
!61 = !{i32 72}
!62 = !{i32 73}
!63 = !{i32 74}
!64 = distinct !{!64, i32 3}
!65 = !{i32 76}
!66 = !{i32 77}
!67 = !{i32 78}
!68 = distinct !{!68, i32 2}
!69 = !{i32 80}
!70 = !{i32 81}
