; ModuleID = 'data/base_solutions/KNN/solution0/.autopilot/db/a.o.3.bc'
source_filename = "data/base_solutions/KNN/solution0/.autopilot/db/a.o.3.bc"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

$_ssdm_op_SpecTopModule = comdat any

$_ssdm_op_SpecPipeline = comdat any

$_ssdm_op_SpecLoopTripCount = comdat any

$_ssdm_op_SpecLoopName = comdat any

$_ssdm_op_SpecInterface = comdat any

$_ssdm_op_SpecBitsMap = comdat any

$_ssdm_op_BitConcatenate.i12.i8.i4 = comdat any

@empty = internal unnamed_addr constant [10 x i8] c"ap_memory\00"
@empty_0 = internal unnamed_addr constant [1 x i8] zeroinitializer
@empty_1 = internal unnamed_addr constant [10 x i8] c"md_kernel\00"
@empty_2 = internal unnamed_addr constant [7 x i8] c"loop_j\00"
@empty_3 = internal unnamed_addr constant [7 x i8] c"loop_i\00"

; Function Attrs: nounwind
define void @md_kernel([256 x i64]* noalias %force_x, [256 x i64]* noalias %force_y, [256 x i64]* noalias %force_z, [256 x i64]* noalias %position_x, [256 x i64]* noalias %position_y, [256 x i64]* noalias %position_z, [4096 x i32]* noalias %NL) #0 {
entry:
  %i = alloca i9, align 2, !bitwidth !49
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_0), !fpga.pragma.source !50
  call void (...) @_ssdm_op_SpecTopModule([10 x i8]* @empty_1), !fpga.pragma.source !50
  call void (...) @_ssdm_op_SpecInterface([256 x i64]* %force_x, [10 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 -1, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([256 x i64]* %force_x), !map !51
  call void (...) @_ssdm_op_SpecInterface([256 x i64]* %force_y, [10 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 -1, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([256 x i64]* %force_y), !map !51
  call void (...) @_ssdm_op_SpecInterface([256 x i64]* %force_z, [10 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 -1, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([256 x i64]* %force_z), !map !51
  call void (...) @_ssdm_op_SpecInterface([256 x i64]* %position_x, [10 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 -1, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([256 x i64]* %position_x), !map !51
  call void (...) @_ssdm_op_SpecInterface([256 x i64]* %position_y, [10 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 -1, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([256 x i64]* %position_y), !map !51
  call void (...) @_ssdm_op_SpecInterface([256 x i64]* %position_z, [10 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 -1, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([256 x i64]* %position_z), !map !51
  call void (...) @_ssdm_op_SpecInterface([4096 x i32]* %NL, [10 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 -1, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([4096 x i32]* %NL), !map !51
  store i9 0, i9* %i, align 2, !bitwidth !52, !dep_idx !53, !deps !54
  br label %loop_j, !bitwidth !52

loop_j:                                           ; preds = %for.inc41, %entry
  %i_1 = load i9, i9* %i, align 2, !bitwidth !59, !dep_idx !60, !deps !61
  %icmp_ln25 = icmp eq i9 %i_1, -256, !bitwidth !66
  %add_ln25 = add nuw i9 %i_1, 1, !bitwidth !59
  br i1 %icmp_ln25, label %for.end43, label %loop_j.split, !llvm.loop !67, !bitwidth !52

loop_j.split:                                     ; preds = %loop_j
  %zext_ln25 = zext i9 %i_1 to i64, !bitwidth !85
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 256, i64 256, i64 256), !fpga.pragma.source !50
  call void (...) @_ssdm_op_SpecLoopName([7 x i8]* @empty_3)
  %position_x_addr = getelementptr [256 x i64], [256 x i64]* %position_x, i64 0, i64 %zext_ln25, !bitwidth !7
  %position_x_load = load i64, i64* %position_x_addr, align 8, !bitwidth !39
  %i_x = bitcast i64 %position_x_load to double, !bitwidth !39
  %position_y_addr = getelementptr [256 x i64], [256 x i64]* %position_y, i64 0, i64 %zext_ln25, !bitwidth !7
  %position_y_load = load i64, i64* %position_y_addr, align 8, !bitwidth !39
  %i_y = bitcast i64 %position_y_load to double, !bitwidth !39
  %position_z_addr = getelementptr [256 x i64], [256 x i64]* %position_z, i64 0, i64 %zext_ln25, !bitwidth !7
  %position_z_load = load i64, i64* %position_z_addr, align 8, !bitwidth !39
  %i_z = bitcast i64 %position_z_load to double, !bitwidth !39
  %empty = trunc i9 %i_1 to i8, !bitwidth !86
  %tmp_1 = call i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8 %empty, i4 0), !bitwidth !87
  br label %for.inc, !bitwidth !52

for.inc:                                          ; preds = %for.inc.split, %loop_j.split
  %j = phi i5 [ %add_ln33, %for.inc.split ], [ 0, %loop_j.split ], !bitwidth !88
  %fz = phi double [ %fz_1, %for.inc.split ], [ 0.000000e+00, %loop_j.split ], !bitwidth !39
  %fy = phi double [ %fy_1, %for.inc.split ], [ 0.000000e+00, %loop_j.split ], !bitwidth !39
  %fx = phi double [ %fx_1, %for.inc.split ], [ 0.000000e+00, %loop_j.split ], !bitwidth !39
  %icmp_ln33 = icmp eq i5 %j, -16, !bitwidth !66
  %add_ln33 = add nuw i5 %j, 1, !bitwidth !88
  br i1 %icmp_ln33, label %for.inc41, label %for.inc.split, !llvm.loop !89, !bitwidth !52

for.inc.split:                                    ; preds = %for.inc
  %zext_ln33 = zext i5 %j to i12, !bitwidth !103
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 16, i64 16, i64 16), !fpga.pragma.source !50
  call void (...) @_ssdm_op_SpecLoopName([7 x i8]* @empty_2)
  %add_ln36 = add nuw i12 %zext_ln33, %tmp_1, !bitwidth !87
  %zext_ln36 = zext i12 %add_ln36 to i64, !bitwidth !85
  %NL_addr = getelementptr [4096 x i32], [4096 x i32]* %NL, i64 0, i64 %zext_ln36, !bitwidth !14
  %jidx = load i32, i32* %NL_addr, align 4, !bitwidth !104
  %zext_ln38 = zext i32 %jidx to i64, !bitwidth !85
  %position_x_addr_1 = getelementptr [256 x i64], [256 x i64]* %position_x, i64 0, i64 %zext_ln38, !bitwidth !7
  %position_x_load_1 = load i64, i64* %position_x_addr_1, align 8, !bitwidth !39
  %j_x = bitcast i64 %position_x_load_1 to double, !bitwidth !39
  %position_y_addr_1 = getelementptr [256 x i64], [256 x i64]* %position_y, i64 0, i64 %zext_ln38, !bitwidth !7
  %position_y_load_1 = load i64, i64* %position_y_addr_1, align 8, !bitwidth !39
  %j_y = bitcast i64 %position_y_load_1 to double, !bitwidth !39
  %position_z_addr_1 = getelementptr [256 x i64], [256 x i64]* %position_z, i64 0, i64 %zext_ln38, !bitwidth !7
  %position_z_load_1 = load i64, i64* %position_z_addr_1, align 8, !bitwidth !39
  %j_z = bitcast i64 %position_z_load_1 to double, !bitwidth !39
  %delx = fsub double %i_x, %j_x, !bitwidth !39
  %dely = fsub double %i_y, %j_y, !bitwidth !39
  %delz = fsub double %i_z, %j_z, !bitwidth !39
  %mul = fmul double %delx, %delx, !bitwidth !39
  %mul1 = fmul double %dely, %dely, !bitwidth !39
  %add = fadd double %mul, %mul1, !bitwidth !39
  %mul2 = fmul double %delz, %delz, !bitwidth !39
  %add1 = fadd double %add, %mul2, !bitwidth !39
  %r2inv = fdiv double 1.000000e+00, %add1, !bitwidth !39
  %mul3 = fmul double %r2inv, %r2inv, !bitwidth !39
  %r6inv = fmul double %mul3, %r2inv, !bitwidth !39
  %mul5 = fmul double %r6inv, 1.500000e+00, !bitwidth !39
  %sub = fadd double %mul5, -2.000000e+00, !bitwidth !39
  %potential = fmul double %r6inv, %sub, !bitwidth !39
  %force = fmul double %r2inv, %potential, !bitwidth !39
  %mul8 = fmul double %delx, %force, !bitwidth !39
  %fx_1 = fadd double %fx, %mul8, !bitwidth !39
  %mul9 = fmul double %dely, %force, !bitwidth !39
  %fy_1 = fadd double %fy, %mul9, !bitwidth !39
  %mul4 = fmul double %delz, %force, !bitwidth !39
  %fz_1 = fadd double %fz, %mul4, !bitwidth !39
  br label %for.inc, !llvm.loop !89, !bitwidth !52

for.inc41:                                        ; preds = %for.inc
  %bitcast_ln56 = bitcast double %fx to i64, !bitwidth !39
  %force_x_addr = getelementptr [256 x i64], [256 x i64]* %force_x, i64 0, i64 %zext_ln25, !bitwidth !7
  store i64 %bitcast_ln56, i64* %force_x_addr, align 8, !bitwidth !52
  %bitcast_ln57 = bitcast double %fy to i64, !bitwidth !39
  %force_y_addr = getelementptr [256 x i64], [256 x i64]* %force_y, i64 0, i64 %zext_ln25, !bitwidth !7
  store i64 %bitcast_ln57, i64* %force_y_addr, align 8, !bitwidth !52
  %bitcast_ln58 = bitcast double %fz to i64, !bitwidth !39
  %force_z_addr = getelementptr [256 x i64], [256 x i64]* %force_z, i64 0, i64 %zext_ln25, !bitwidth !7
  store i64 %bitcast_ln58, i64* %force_z_addr, align 8, !bitwidth !52
  store i9 %add_ln25, i9* %i, align 2, !bitwidth !52, !dep_idx !105, !deps !106
  br label %loop_j, !llvm.loop !67, !bitwidth !52

for.end43:                                        ; preds = %loop_j
  ret void, !bitwidth !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecTopModule(...) #0 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecPipeline(...) #0 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecLoopTripCount(...) #0 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecLoopName(...) #0 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecInterface(...) #0 comdat {
entry:
  ret void
}

; Function Attrs: nounwind
define weak void @_ssdm_op_SpecBitsMap(...) #0 comdat {
entry:
  ret void
}

; Function Attrs: nounwind readnone
define weak i12 @_ssdm_op_BitConcatenate.i12.i8.i4(i8 %0, i4 %1) #2 comdat {
entry:
  %empty = zext i8 %0 to i12
  %empty_7 = zext i4 %1 to i12
  %empty_8 = shl i12 %empty, 4
  %empty_9 = or i12 %empty_8, %empty_7
  ret i12 %empty_9
}

attributes #0 = { nounwind }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readnone }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!blackbox_cfg = !{!1}
!llvm.module.flags = !{!2, !3}
!llvm.map.gv = !{}
!bitwidth_g = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"reflow.full.lowering", i32 1}
!4 = !{void ([256 x i64]*, [256 x i64]*, [256 x i64]*, [256 x i64]*, [256 x i64]*, [256 x i64]*, [4096 x i32]*)* @md_kernel, !5}
!5 = !{!6, !8, !9, !10, !11, !12, !13, !15, !17, !18, !20, !21, !22, !24, !26, !28, !29, !31, !32, !34, !36, !38, !40, !42, !43, !45, !46, !47, !48}
!6 = !{!"Arg", i32 0, !7}
!7 = !{i32 0, i32 0, i32 64, i32 2}
!8 = !{!"Arg", i32 1, !7}
!9 = !{!"Arg", i32 2, !7}
!10 = !{!"Arg", i32 3, !7}
!11 = !{!"Arg", i32 4, !7}
!12 = !{!"Arg", i32 5, !7}
!13 = !{!"Arg", i32 6, !14}
!14 = !{i32 0, i32 0, i32 32, i32 2}
!15 = !{i32 1, !16}
!16 = !{i32 1, i32 32, i32 0, i32 0}
!17 = !{i32 0, !16}
!18 = !{[1 x i8]* @empty_0, !19}
!19 = !{i32 0, i32 0, i32 8, i32 2}
!20 = !{[10 x i8]* @empty_1, !19}
!21 = !{[10 x i8]* @empty, !19}
!22 = !{i32 -1, !23}
!23 = !{i32 1, i32 32, i32 0, i32 1}
!24 = !{i9 0, !25}
!25 = !{i32 1, i32 9, i32 0, i32 0}
!26 = !{i9 -256, !27}
!27 = !{i32 9, i32 9, i32 0, i32 1}
!28 = !{i9 1, !25}
!29 = !{i64 256, !30}
!30 = !{i32 10, i32 64, i32 0, i32 1}
!31 = !{[7 x i8]* @empty_3, !19}
!32 = !{i64 0, !33}
!33 = !{i32 1, i32 64, i32 0, i32 0}
!34 = !{i4 0, !35}
!35 = !{i32 1, i32 4, i32 0, i32 0}
!36 = !{i5 0, !37}
!37 = !{i32 1, i32 5, i32 0, i32 0}
!38 = !{double 0.000000e+00, !39}
!39 = !{i32 64, i32 64, i32 0, i32 2}
!40 = !{i5 -16, !41}
!41 = !{i32 5, i32 5, i32 0, i32 1}
!42 = !{i5 1, !37}
!43 = !{i64 16, !44}
!44 = !{i32 6, i32 64, i32 0, i32 1}
!45 = !{[7 x i8]* @empty_2, !19}
!46 = !{double 1.000000e+00, !39}
!47 = !{double 1.500000e+00, !39}
!48 = !{double -2.000000e+00, !39}
!49 = !{i32 0, i32 0, i32 9, i32 1}
!50 = !{!"user"}
!51 = !{!1}
!52 = !{i32 0, i32 0, i32 0, i32 2}
!53 = !{i32 2}
!54 = !{!55, !57}
!55 = !{i32 0, !56}
!56 = !{!"RAW", !"indep"}
!57 = !{i32 1, !58}
!58 = !{!"WAW", !"indep"}
!59 = !{i32 9, i32 9, i32 0, i32 2}
!60 = !{i32 0}
!61 = !{!62, !64}
!62 = !{i32 2, !63}
!63 = !{!"WAR", !"indep"}
!64 = !{i32 1, !65}
!65 = !{!"WAR", !"indep", i32 1, !"*", i32 -1, i1 true}
!66 = !{i32 1, i32 1, i32 0, i32 2}
!67 = distinct !{!67, !68, !81, !82}
!68 = !{i32 59, i32 5, !69, null}
!69 = !{i32 786443, !70, i32 25, i32 13, !72, i32 0}
!70 = !{i32 786443, !71, !72}
!71 = !{i32 786478, i32 0, !72, !"md_kernel", !"md_kernel", null, !72, i32 10, !73, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([256 x i64]*, [256 x i64]*, [256 x i64]*, [256 x i64]*, [256 x i64]*, [256 x i64]*, [4096 x i32]*)* @md_kernel, null, null, !80, i32 19}
!72 = !{i32 786473, !"data/benchmarks/knn/md.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!73 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !74, i32 0, i32 0}
!74 = !{null, !75, !75, !75, !75, !75, !75, !78}
!75 = !{i32 786447, null, !"", !76, i32 0, i64 64, i64 0, i32 0, i32 0, !77}
!76 = !{i32 786473, !"<unknown>", null, null}
!77 = !{i32 786468, null, !"double", null, i32 0, i64 64, i64 0, i32 0, i32 0, i32 4}
!78 = !{i32 786447, null, !"", !76, i32 0, i64 64, i64 0, i32 0, i32 0, !79}
!79 = !{i32 786468, null, !"int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 5}
!80 = !{!60}
!81 = !{!"llvm.loop.name", !"loop_i"}
!82 = !{!"llvm.loop.tripcount", i32 256, i32 256, i32 256, !"user", !83}
!83 = !{i32 26, i32 9, !84, null}
!84 = !{i32 786443, !69, !72}
!85 = !{i32 64, i32 64, i32 0, i32 0}
!86 = !{i32 8, i32 8, i32 0, i32 2}
!87 = !{i32 12, i32 12, i32 0, i32 2}
!88 = !{i32 5, i32 5, i32 0, i32 2}
!89 = distinct !{!89, !90, !95, !96, !100}
!90 = !{i32 54, i32 9, !91, null}
!91 = !{i32 786443, !92, i32 33, i32 17, !72, i32 0}
!92 = !{i32 786443, !93, !72}
!93 = !{i32 786443, !94, i32 25, i32 38, !72, i32 0}
!94 = !{i32 786443, !84, i32 25, i32 13, !72, i32 0}
!95 = !{!"llvm.loop.name", !"loop_j"}
!96 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !97}
!97 = !{i32 4, i32 9, !98, null}
!98 = !{i32 786443, !91, !99}
!99 = !{i32 786473, !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/data/base_directives/knn.tcl", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!100 = !{!"llvm.loop.tripcount", i32 16, i32 16, i32 16, !"user", !101}
!101 = !{i32 34, i32 9, !102, null}
!102 = !{i32 786443, !91, !72}
!103 = !{i32 12, i32 12, i32 0, i32 0}
!104 = !{i32 32, i32 32, i32 0, i32 2}
!105 = !{i32 1}
!106 = !{!107, !108}
!107 = !{i32 2, !58}
!108 = !{i32 0, !109}
!109 = !{!"RAW", !"indep", i32 1, !"*", i32 -1, i1 true}
