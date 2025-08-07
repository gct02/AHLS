; ModuleID = 'gnn/test/test2/prj/solution0/.autopilot/db/a.o.3.bc'
source_filename = "gnn/test/test2/prj/solution0/.autopilot/db/a.o.3.bc"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

$_ssdm_op_SpecTopModule = comdat any

$_ssdm_op_SpecPipeline = comdat any

$_ssdm_op_SpecLoopTripCount = comdat any

$_ssdm_op_SpecLoopName = comdat any

$_ssdm_op_SpecInterface = comdat any

$_ssdm_op_SpecBitsMap = comdat any

@empty = internal unnamed_addr constant [10 x i8] c"ap_memory\00"
@empty_0 = internal unnamed_addr constant [1 x i8] zeroinitializer
@empty_1 = internal unnamed_addr constant [7 x i8] c"top_fn\00"
@empty_2 = internal unnamed_addr constant [15 x i8] c"top_fn_loop1_1\00"
@empty_3 = internal unnamed_addr constant [13 x i8] c"top_fn_loop1\00"
@empty_4 = internal unnamed_addr constant [15 x i8] c"init_arr_loop1\00"

; Function Attrs: nounwind
define void @top_fn([100 x i32]* noalias %in_arr, [100 x i32]* noalias %out_arr) #0 {
entry:
  %i = alloca i7, align 1, !bitwidth !32
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_0), !fpga.pragma.source !33
  call void (...) @_ssdm_op_SpecTopModule([7 x i8]* @empty_1), !fpga.pragma.source !33
  call void (...) @_ssdm_op_SpecInterface([100 x i32]* %in_arr, [10 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 -1, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([100 x i32]* %in_arr), !map !34
  call void (...) @_ssdm_op_SpecInterface([100 x i32]* %out_arr, [10 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 -1, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecBitsMap([100 x i32]* %out_arr), !map !34
  call fastcc void @init_arr([100 x i32]* %out_arr), !bitwidth !35, !dep_idx !36, !deps !37
  store i7 0, i7* %i, align 1, !bitwidth !35, !dep_idx !42, !deps !43
  br label %top_fn_loop1_1, !bitwidth !35

top_fn_loop1_1:                                   ; preds = %for.inc8, %entry
  %i_1 = load i7, i7* %i, align 1, !bitwidth !46, !dep_idx !47, !deps !48
  %icmp_ln20 = icmp eq i7 %i_1, -28, !bitwidth !53
  %add_ln20 = add nuw i7 %i_1, 1, !bitwidth !46
  br i1 %icmp_ln20, label %for.end10, label %top_fn_loop1_1.split, !llvm.loop !54, !bitwidth !35

top_fn_loop1_1.split:                             ; preds = %top_fn_loop1_1
  %zext_ln20 = zext i7 %i_1 to i64, !bitwidth !71
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 100, i64 100, i64 100), !fpga.pragma.source !33
  call void (...) @_ssdm_op_SpecLoopName([13 x i8]* @empty_3)
  %out_arr_addr = getelementptr [100 x i32], [100 x i32]* %out_arr, i64 0, i64 %zext_ln20, !bitwidth !7
  %out_arr_load = load i32, i32* %out_arr_addr, align 4, !bitwidth !72, !dep_idx !66, !deps !73
  br label %for.inc, !bitwidth !35

for.inc:                                          ; preds = %for.inc.split, %top_fn_loop1_1.split
  %j = phi i7 [ %add_ln24, %for.inc.split ], [ 0, %top_fn_loop1_1.split ], !bitwidth !46
  %empty = phi i32 [ %add_ln26, %for.inc.split ], [ %out_arr_load, %top_fn_loop1_1.split ], !bitwidth !72
  %icmp_ln24 = icmp eq i7 %j, -28, !bitwidth !53
  %add_ln24 = add nuw i7 %j, 1, !bitwidth !46
  br i1 %icmp_ln24, label %for.inc8, label %for.inc.split, !llvm.loop !77, !bitwidth !35

for.inc.split:                                    ; preds = %for.inc
  %zext_ln24 = zext i7 %j to i64, !bitwidth !71
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 100, i64 100, i64 100), !fpga.pragma.source !33
  call void (...) @_ssdm_op_SpecLoopName([15 x i8]* @empty_2)
  %in_arr_addr = getelementptr [100 x i32], [100 x i32]* %in_arr, i64 0, i64 %zext_ln24, !bitwidth !7
  %in_arr_load = load i32, i32* %in_arr_addr, align 4, !bitwidth !72
  %add_ln26 = add nsw i32 %in_arr_load, %empty, !bitwidth !72
  br label %for.inc, !llvm.loop !77, !bitwidth !35

for.inc8:                                         ; preds = %for.inc
  store i32 %empty, i32* %out_arr_addr, align 4, !bitwidth !35, !dep_idx !91, !deps !92
  store i7 %add_ln20, i7* %i, align 1, !bitwidth !35, !dep_idx !96, !deps !97
  br label %top_fn_loop1_1, !llvm.loop !54, !bitwidth !35

for.end10:                                        ; preds = %top_fn_loop1_1
  ret void, !bitwidth !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: noinline nounwind
define internal fastcc void @init_arr([100 x i32]* noalias nocapture %out_arr) unnamed_addr #2 {
entry:
  %i = alloca i7, align 1, !bitwidth !32
  call void (...) @_ssdm_op_SpecInterface([100 x i32]* %out_arr, [10 x i8]* @empty, i32 0, i32 0, [1 x i8]* @empty_0, i32 -1, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @empty_0, [1 x i8]* @empty_0, i32 -1, i32 0)
  call void (...) @_ssdm_op_SpecPipeline(i32 0, i32 0, i32 1, i32 0, [1 x i8]* @empty_0), !fpga.pragma.source !33
  store i7 0, i7* %i, align 1, !bitwidth !35, !dep_idx !101, !deps !102
  br label %for.inc, !bitwidth !35

for.inc:                                          ; preds = %for.inc.split, %entry
  %i_2 = load i7, i7* %i, align 1, !bitwidth !46, !dep_idx !105, !deps !106
  %icmp_ln8 = icmp eq i7 %i_2, -28, !bitwidth !53
  %add_ln8 = add nuw i7 %i_2, 1, !bitwidth !46
  br i1 %icmp_ln8, label %for.end, label %for.inc.split, !llvm.loop !109, !bitwidth !35

for.inc.split:                                    ; preds = %for.inc
  %zext_ln8 = zext i7 %i_2 to i64, !bitwidth !71
  call void (...) @_ssdm_op_SpecLoopTripCount(i64 100, i64 100, i64 100), !fpga.pragma.source !33
  call void (...) @_ssdm_op_SpecLoopName([15 x i8]* @empty_4)
  %out_arr_addr = getelementptr [100 x i32], [100 x i32]* %out_arr, i64 0, i64 %zext_ln8, !bitwidth !7
  store i32 0, i32* %out_arr_addr, align 4, !bitwidth !35
  store i7 %add_ln8, i7* %i, align 1, !bitwidth !35, !dep_idx !120, !deps !121
  br label %for.inc, !llvm.loop !109, !bitwidth !35

for.end:                                          ; preds = %for.inc
  ret void, !bitwidth !35
}

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

attributes #0 = { nounwind }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noinline nounwind }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!blackbox_cfg = !{!1}
!llvm.module.flags = !{!2, !3}
!llvm.map.gv = !{}
!bitwidth_g = !{!4, !29}

!0 = !{!"clang version 7.0.0 "}
!1 = !{}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 7, !"reflow.full.lowering", i32 1}
!4 = !{void ([100 x i32]*, [100 x i32]*)* @top_fn, !5}
!5 = !{!6, !8, !9, !11, !12, !14, !15, !16, !18, !20, !22, !23, !25, !26, !28}
!6 = !{!"Arg", i32 0, !7}
!7 = !{i32 0, i32 0, i32 32, i32 2}
!8 = !{!"Arg", i32 1, !7}
!9 = !{i32 1, !10}
!10 = !{i32 1, i32 32, i32 0, i32 0}
!11 = !{i32 0, !10}
!12 = !{[1 x i8]* @empty_0, !13}
!13 = !{i32 0, i32 0, i32 8, i32 2}
!14 = !{[7 x i8]* @empty_1, !13}
!15 = !{[10 x i8]* @empty, !13}
!16 = !{i32 -1, !17}
!17 = !{i32 1, i32 32, i32 0, i32 1}
!18 = !{i7 0, !19}
!19 = !{i32 1, i32 7, i32 0, i32 0}
!20 = !{i7 -28, !21}
!21 = !{i32 6, i32 7, i32 0, i32 1}
!22 = !{i7 1, !19}
!23 = !{i64 100, !24}
!24 = !{i32 8, i32 64, i32 0, i32 1}
!25 = !{[13 x i8]* @empty_3, !13}
!26 = !{i64 0, !27}
!27 = !{i32 1, i32 64, i32 0, i32 0}
!28 = !{[15 x i8]* @empty_2, !13}
!29 = !{void ([100 x i32]*)* @init_arr, !30}
!30 = !{!6, !9, !15, !11, !12, !16, !18, !20, !22, !23, !31, !26}
!31 = !{[15 x i8]* @empty_4, !13}
!32 = !{i32 0, i32 0, i32 7, i32 1}
!33 = !{!"user"}
!34 = !{!1}
!35 = !{i32 0, i32 0, i32 0, i32 2}
!36 = !{i32 5}
!37 = !{!38, !40}
!38 = !{i32 0, !39}
!39 = !{!"RAW", !"indep"}
!40 = !{i32 1, !41}
!41 = !{!"WAW", !"indep"}
!42 = !{i32 4}
!43 = !{!44, !45}
!44 = !{i32 2, !39}
!45 = !{i32 3, !41}
!46 = !{i32 7, i32 7, i32 0, i32 2}
!47 = !{i32 2}
!48 = !{!49, !51}
!49 = !{i32 4, !50}
!50 = !{!"WAR", !"indep"}
!51 = !{i32 3, !52}
!52 = !{!"WAR", !"indep", i32 1, !"*", i32 -1, i1 true}
!53 = !{i32 1, i32 1, i32 0, i32 2}
!54 = distinct !{!54, !55, !67, !68}
!55 = !{i32 28, i32 5, !56, null}
!56 = !{i32 786443, !57, i32 20, i32 5, !59, i32 0}
!57 = !{i32 786443, !58, !59}
!58 = !{i32 786478, i32 0, !59, !"top_fn", !"top_fn", null, !59, i32 14, !60, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([100 x i32]*, [100 x i32]*)* @top_fn, null, null, !65, i32 14}
!59 = !{i32 786473, !"gnn/test/test2/kernel.c", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!60 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !61, i32 0, i32 0}
!61 = !{null, !62, !62}
!62 = !{i32 786447, null, !"", !63, i32 0, i64 64, i64 0, i32 0, i32 0, !64}
!63 = !{i32 786473, !"<unknown>", null, null}
!64 = !{i32 786468, null, !"int", null, i32 0, i64 32, i64 0, i32 0, i32 0, i32 5}
!65 = !{!66}
!66 = !{i32 0}
!67 = !{!"llvm.loop.name", !"top_fn_loop1"}
!68 = !{!"llvm.loop.tripcount", i32 100, i32 100, i32 100, !"user", !69}
!69 = !{i32 21, i32 9, !70, null}
!70 = !{i32 786443, !56, !59}
!71 = !{i32 64, i32 64, i32 0, i32 0}
!72 = !{i32 32, i32 32, i32 0, i32 2}
!73 = !{!74, !75}
!74 = !{i32 5, !50}
!75 = !{i32 1, !76}
!76 = !{!"WAR", !"indep", i32 1, !"=", i32 0, i1 true}
!77 = distinct !{!77, !78, !83, !84, !88}
!78 = !{i32 27, i32 9, !79, null}
!79 = !{i32 786443, !80, i32 24, i32 9, !59, i32 0}
!80 = !{i32 786443, !81, !59}
!81 = !{i32 786443, !82, i32 20, i32 31, !59, i32 0}
!82 = !{i32 786443, !70, i32 20, i32 5, !59, i32 0}
!83 = !{!"llvm.loop.name", !"top_fn_loop1_1"}
!84 = !{!"llvm.loop.flatten.enable", i1 false, !"user", !85}
!85 = !{i32 6, i32 9, !86, null}
!86 = !{i32 786443, !79, !87}
!87 = !{i32 786473, !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS/gnn/test/test2/dct0.tcl", !"/home/gabriel/Documents/UFRGS/RAISE/AHLS/AHLS", null}
!88 = !{!"llvm.loop.tripcount", i32 100, i32 100, i32 100, !"user", !89}
!89 = !{i32 25, i32 9, !90, null}
!90 = !{i32 786443, !79, !59}
!91 = !{i32 1}
!92 = !{!93, !94}
!93 = !{i32 5, !41}
!94 = !{i32 0, !95}
!95 = !{!"RAW", !"indep", i32 1, !"=", i32 0, i1 true}
!96 = !{i32 3}
!97 = !{!98, !99}
!98 = !{i32 4, !41}
!99 = !{i32 2, !100}
!100 = !{!"RAW", !"indep", i32 1, !"*", i32 -1, i1 true}
!101 = !{i32 8}
!102 = !{!103, !104}
!103 = !{i32 6, !39}
!104 = !{i32 7, !41}
!105 = !{i32 6}
!106 = !{!107, !108}
!107 = !{i32 8, !50}
!108 = !{i32 7, !52}
!109 = distinct !{!109, !110, !116, !117}
!110 = !{i32 11, i32 5, !111, null}
!111 = !{i32 786443, !112, i32 8, i32 5, !59, i32 0}
!112 = !{i32 786443, !113, !59}
!113 = !{i32 786478, i32 0, !59, !"init_arr", !"init_arr", null, !59, i32 4, !114, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void ([100 x i32]*)* @init_arr, null, null, !65, i32 4}
!114 = !{i32 786453, i32 0, !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, !115, i32 0, i32 0}
!115 = !{null, !62}
!116 = !{!"llvm.loop.name", !"init_arr_loop1"}
!117 = !{!"llvm.loop.tripcount", i32 100, i32 100, i32 100, !"user", !118}
!118 = !{i32 9, i32 9, !119, null}
!119 = !{i32 786443, !111, !59}
!120 = !{i32 7}
!121 = !{!122, !123}
!122 = !{i32 8, !41}
!123 = !{i32 6, !100}
