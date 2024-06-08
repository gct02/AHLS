; ModuleID = '../src/face_detect_host.cpp'
source_filename = "../src/face_detect_host.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%union.anon = type { i64, [8 x i8] }
%"class.std::allocator" = type { i8 }
%struct.timeval = type { i64, i64 }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@__dso_handle = external hidden global i8
@.str = private unnamed_addr constant [28 x i8] c"Face Detection Application\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"output_image.txt\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Checking results:\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"elapsed time: %lld us\0A\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_face_detect_host.cpp, i8* null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" !dbg !926 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !927
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3, !dbg !927
  ret void, !dbg !927
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: noinline norecurse optnone uwtable
define i32 @main(i32 %argc, i8** %argv) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !928 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %Data = alloca [240 x [320 x i8]], align 16
  %output_image_filename = alloca %"class.std::__cxx11::basic_string", align 8
  %ref.tmp = alloca %"class.std::allocator", align 1
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %result_x = alloca [100 x i32], align 16
  %result_y = alloca [100 x i32], align 16
  %result_w = alloca [100 x i32], align 16
  %result_h = alloca [100 x i32], align 16
  %res_size = alloca i32, align 4
  %start = alloca %struct.timeval, align 8
  %end = alloca %struct.timeval, align 8
  %agg.tmp = alloca %"class.std::__cxx11::basic_string", align 8
  %elapsed = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !931, metadata !DIExpression()), !dbg !932
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !933, metadata !DIExpression()), !dbg !934
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i32 0, i32 0)), !dbg !935
  call void @llvm.dbg.declare(metadata [240 x [320 x i8]]* %Data, metadata !936, metadata !DIExpression()), !dbg !941
  call void @llvm.dbg.declare(metadata %"class.std::__cxx11::basic_string"* %output_image_filename, metadata !942, metadata !DIExpression()), !dbg !948
  call void @_ZNSaIcEC1Ev(%"class.std::allocator"* %ref.tmp) #3, !dbg !949
  invoke void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_(%"class.std::__cxx11::basic_string"* %output_image_filename, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0), %"class.std::allocator"* dereferenceable(1) %ref.tmp)
          to label %invoke.cont unwind label %lpad, !dbg !949

invoke.cont:                                      ; preds = %entry
  call void @_ZNSaIcED1Ev(%"class.std::allocator"* %ref.tmp) #3, !dbg !948
  %0 = load i32, i32* %argc.addr, align 4, !dbg !950
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !951
  %arraydecay = getelementptr inbounds [240 x [320 x i8]], [240 x [320 x i8]]* %Data, i32 0, i32 0, !dbg !952
  invoke void @_Z23parse_command_line_argsiPPcPA320_h(i32 %0, i8** %1, [320 x i8]* %arraydecay)
          to label %invoke.cont2 unwind label %lpad1, !dbg !953

invoke.cont2:                                     ; preds = %invoke.cont
  call void @llvm.dbg.declare(metadata [100 x i32]* %result_x, metadata !954, metadata !DIExpression()), !dbg !958
  call void @llvm.dbg.declare(metadata [100 x i32]* %result_y, metadata !959, metadata !DIExpression()), !dbg !960
  call void @llvm.dbg.declare(metadata [100 x i32]* %result_w, metadata !961, metadata !DIExpression()), !dbg !962
  call void @llvm.dbg.declare(metadata [100 x i32]* %result_h, metadata !963, metadata !DIExpression()), !dbg !964
  call void @llvm.dbg.declare(metadata i32* %res_size, metadata !965, metadata !DIExpression()), !dbg !966
  store i32 0, i32* %res_size, align 4, !dbg !966
  call void @llvm.dbg.declare(metadata %struct.timeval* %start, metadata !967, metadata !DIExpression()), !dbg !975
  call void @llvm.dbg.declare(metadata %struct.timeval* %end, metadata !976, metadata !DIExpression()), !dbg !977
  %call3 = call i32 @gettimeofday(%struct.timeval* %start, i8* null) #3, !dbg !978
  %arraydecay4 = getelementptr inbounds [240 x [320 x i8]], [240 x [320 x i8]]* %Data, i32 0, i32 0, !dbg !979
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %result_x, i32 0, i32 0, !dbg !980
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %result_y, i32 0, i32 0, !dbg !981
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %result_w, i32 0, i32 0, !dbg !982
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %result_h, i32 0, i32 0, !dbg !983
  invoke void @_Z11face_detectPA320_hPiS1_S1_S1_S1_([320 x i8]* %arraydecay4, i32* %arraydecay5, i32* %arraydecay6, i32* %arraydecay7, i32* %arraydecay8, i32* %res_size)
          to label %invoke.cont9 unwind label %lpad1, !dbg !984

invoke.cont9:                                     ; preds = %invoke.cont2
  %call10 = call i32 @gettimeofday(%struct.timeval* %end, i8* null) #3, !dbg !985
  %call12 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i32 0, i32 0))
          to label %invoke.cont11 unwind label %lpad1, !dbg !986

invoke.cont11:                                    ; preds = %invoke.cont9
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %result_x, i32 0, i32 0, !dbg !987
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %result_y, i32 0, i32 0, !dbg !988
  %arraydecay15 = getelementptr inbounds [100 x i32], [100 x i32]* %result_w, i32 0, i32 0, !dbg !989
  %arraydecay16 = getelementptr inbounds [100 x i32], [100 x i32]* %result_h, i32 0, i32 0, !dbg !990
  %arraydecay17 = getelementptr inbounds [240 x [320 x i8]], [240 x [320 x i8]]* %Data, i32 0, i32 0, !dbg !991
  invoke void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1ERKS4_(%"class.std::__cxx11::basic_string"* %agg.tmp, %"class.std::__cxx11::basic_string"* dereferenceable(32) %output_image_filename)
          to label %invoke.cont18 unwind label %lpad1, !dbg !992

invoke.cont18:                                    ; preds = %invoke.cont11
  invoke void @_Z13check_resultsRiPiS0_S0_S0_PA320_hNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(i32* dereferenceable(4) %res_size, i32* %arraydecay13, i32* %arraydecay14, i32* %arraydecay15, i32* %arraydecay16, [320 x i8]* %arraydecay17, %"class.std::__cxx11::basic_string"* %agg.tmp)
          to label %invoke.cont20 unwind label %lpad19, !dbg !993

invoke.cont20:                                    ; preds = %invoke.cont18
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %agg.tmp) #3, !dbg !993
  call void @llvm.dbg.declare(metadata i64* %elapsed, metadata !994, metadata !DIExpression()), !dbg !995
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %end, i32 0, i32 0, !dbg !996
  %2 = load i64, i64* %tv_sec, align 8, !dbg !996
  %tv_sec21 = getelementptr inbounds %struct.timeval, %struct.timeval* %start, i32 0, i32 0, !dbg !997
  %3 = load i64, i64* %tv_sec21, align 8, !dbg !997
  %sub = sub nsw i64 %2, %3, !dbg !998
  %mul = mul nsw i64 %sub, 1000000, !dbg !999
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %end, i32 0, i32 1, !dbg !1000
  %4 = load i64, i64* %tv_usec, align 8, !dbg !1000
  %add = add nsw i64 %mul, %4, !dbg !1001
  %tv_usec22 = getelementptr inbounds %struct.timeval, %struct.timeval* %start, i32 0, i32 1, !dbg !1002
  %5 = load i64, i64* %tv_usec22, align 8, !dbg !1002
  %sub23 = sub nsw i64 %add, %5, !dbg !1003
  store i64 %sub23, i64* %elapsed, align 8, !dbg !995
  %6 = load i64, i64* %elapsed, align 8, !dbg !1004
  %call25 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0), i64 %6)
          to label %invoke.cont24 unwind label %lpad1, !dbg !1005

invoke.cont24:                                    ; preds = %invoke.cont20
  store i32 0, i32* %retval, align 4, !dbg !1006
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %output_image_filename) #3, !dbg !1007
  %7 = load i32, i32* %retval, align 4, !dbg !1007
  ret i32 %7, !dbg !1007

lpad:                                             ; preds = %entry
  %8 = landingpad { i8*, i32 }
          cleanup, !dbg !1007
  %9 = extractvalue { i8*, i32 } %8, 0, !dbg !1007
  store i8* %9, i8** %exn.slot, align 8, !dbg !1007
  %10 = extractvalue { i8*, i32 } %8, 1, !dbg !1007
  store i32 %10, i32* %ehselector.slot, align 4, !dbg !1007
  call void @_ZNSaIcED1Ev(%"class.std::allocator"* %ref.tmp) #3, !dbg !948
  br label %eh.resume, !dbg !948

lpad1:                                            ; preds = %invoke.cont20, %invoke.cont11, %invoke.cont9, %invoke.cont2, %invoke.cont
  %11 = landingpad { i8*, i32 }
          cleanup, !dbg !1007
  %12 = extractvalue { i8*, i32 } %11, 0, !dbg !1007
  store i8* %12, i8** %exn.slot, align 8, !dbg !1007
  %13 = extractvalue { i8*, i32 } %11, 1, !dbg !1007
  store i32 %13, i32* %ehselector.slot, align 4, !dbg !1007
  br label %ehcleanup, !dbg !1007

lpad19:                                           ; preds = %invoke.cont18
  %14 = landingpad { i8*, i32 }
          cleanup, !dbg !1007
  %15 = extractvalue { i8*, i32 } %14, 0, !dbg !1007
  store i8* %15, i8** %exn.slot, align 8, !dbg !1007
  %16 = extractvalue { i8*, i32 } %14, 1, !dbg !1007
  store i32 %16, i32* %ehselector.slot, align 4, !dbg !1007
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %agg.tmp) #3, !dbg !993
  br label %ehcleanup, !dbg !993

ehcleanup:                                        ; preds = %lpad19, %lpad1
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %output_image_filename) #3, !dbg !1007
  br label %eh.resume, !dbg !1007

eh.resume:                                        ; preds = %ehcleanup, %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !948
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !948
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !948
  %lpad.val26 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !948
  resume { i8*, i32 } %lpad.val26, !dbg !948
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #5

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare void @_ZNSaIcEC1Ev(%"class.std::allocator"*) unnamed_addr #2

declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EPKcRKS3_(%"class.std::__cxx11::basic_string"*, i8*, %"class.std::allocator"* dereferenceable(1)) unnamed_addr #1

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind
declare void @_ZNSaIcED1Ev(%"class.std::allocator"*) unnamed_addr #2

declare void @_Z23parse_command_line_argsiPPcPA320_h(i32, i8**, [320 x i8]*) #1

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, i8*) #2

declare void @_Z11face_detectPA320_hPiS1_S1_S1_S1_([320 x i8]*, i32*, i32*, i32*, i32*, i32*) #1

declare void @_Z13check_resultsRiPiS0_S0_S0_PA320_hNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(i32* dereferenceable(4), i32*, i32*, i32*, i32*, [320 x i8]*, %"class.std::__cxx11::basic_string"*) #1

declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1ERKS4_(%"class.std::__cxx11::basic_string"*, %"class.std::__cxx11::basic_string"* dereferenceable(32)) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"*) unnamed_addr #2

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_face_detect_host.cpp() #0 section ".text.startup" !dbg !1008 {
entry:
  call void @__cxx_global_var_init(), !dbg !1010
  ret void
}

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!28}
!llvm.module.flags = !{!921, !922, !923, !924}
!llvm.ident = !{!925}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !2, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "std", scope: null)
!3 = !DIFile(filename: "/usr/include/c++/11/iostream", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!4 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !6, file: !5, line: 626, size: 8, flags: DIFlagTypePassByReference, elements: !7, identifier: "_ZTSNSt8ios_base4InitE")
!5 = !DIFile(filename: "/usr/include/c++/11/bits/ios_base.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!6 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !2, file: !5, line: 228, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt8ios_base")
!7 = !{!8, !12, !14, !18, !19, !24}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "_S_refcount", scope: !4, file: !5, line: 639, baseType: !9, flags: DIFlagStaticMember)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Atomic_word", file: !10, line: 32, baseType: !11)
!10 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/atomic_word.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "_S_synced_with_stdio", scope: !4, file: !5, line: 640, baseType: !13, flags: DIFlagStaticMember)
!13 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!14 = !DISubprogram(name: "Init", scope: !4, file: !5, line: 630, type: !15, isLocal: false, isDefinition: false, scopeLine: 630, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!18 = !DISubprogram(name: "~Init", scope: !4, file: !5, line: 631, type: !15, isLocal: false, isDefinition: false, scopeLine: 631, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!19 = !DISubprogram(name: "Init", scope: !4, file: !5, line: 634, type: !20, isLocal: false, isDefinition: false, scopeLine: 634, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!20 = !DISubroutineType(types: !21)
!21 = !{null, !17, !22}
!22 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!24 = !DISubprogram(name: "operator=", linkageName: "_ZNSt8ios_base4InitaSERKS0_", scope: !4, file: !5, line: 635, type: !25, isLocal: false, isDefinition: false, scopeLine: 635, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!25 = !DISubroutineType(types: !26)
!26 = !{!27, !17, !22}
!27 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4, size: 64)
!28 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !29, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !30, globals: !31, imports: !32)
!29 = !DIFile(filename: "../src/face_detect_host.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!30 = !{}
!31 = !{!0}
!32 = !{!33, !39, !45, !50, !54, !56, !58, !60, !62, !69, !76, !83, !87, !91, !95, !104, !108, !110, !115, !121, !125, !132, !134, !138, !142, !146, !148, !152, !156, !158, !162, !164, !166, !170, !174, !178, !182, !186, !190, !192, !204, !208, !212, !217, !219, !221, !225, !229, !230, !231, !232, !233, !234, !238, !242, !248, !252, !257, !259, !264, !266, !270, !278, !282, !286, !290, !294, !298, !302, !306, !310, !314, !321, !325, !329, !331, !333, !337, !341, !347, !351, !355, !357, !364, !368, !375, !377, !381, !385, !389, !393, !398, !403, !408, !409, !410, !411, !413, !414, !415, !416, !417, !418, !419, !423, !440, !443, !448, !455, !460, !464, !468, !472, !476, !478, !480, !484, !490, !494, !500, !506, !508, !512, !516, !520, !524, !528, !530, !534, !538, !542, !544, !548, !552, !556, !558, !560, !564, !572, !576, !580, !584, !586, !592, !594, !600, !604, !608, !612, !616, !620, !624, !626, !628, !632, !636, !640, !642, !646, !650, !652, !654, !658, !662, !666, !670, !671, !672, !673, !674, !675, !676, !677, !678, !679, !680, !687, !691, !694, !697, !700, !702, !704, !706, !709, !712, !715, !718, !721, !723, !728, !732, !735, !738, !740, !742, !744, !746, !749, !752, !755, !758, !761, !763, !767, !771, !776, !780, !782, !784, !786, !788, !790, !792, !794, !796, !798, !800, !802, !804, !806, !861, !865, !871, !874, !875, !877, !879, !881, !883, !887, !889, !891, !893, !895, !897, !899, !901, !903, !907, !911, !913, !917}
!33 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !34, file: !38, line: 98)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !35, line: 7, baseType: !36)
!35 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!36 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !37, line: 49, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!37 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!38 = !DIFile(filename: "/usr/include/c++/11/cstdio", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !40, file: !38, line: 99)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !41, line: 84, baseType: !42)
!41 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !43, line: 14, baseType: !44)
!43 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!44 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !43, line: 10, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !46, file: !38, line: 101)
!46 = !DISubprogram(name: "clearerr", scope: !41, file: !41, line: 786, type: !47, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!47 = !DISubroutineType(types: !48)
!48 = !{null, !49}
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!50 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !51, file: !38, line: 102)
!51 = !DISubprogram(name: "fclose", scope: !41, file: !41, line: 178, type: !52, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!52 = !DISubroutineType(types: !53)
!53 = !{!11, !49}
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !55, file: !38, line: 103)
!55 = !DISubprogram(name: "feof", scope: !41, file: !41, line: 788, type: !52, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !57, file: !38, line: 104)
!57 = !DISubprogram(name: "ferror", scope: !41, file: !41, line: 790, type: !52, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !59, file: !38, line: 105)
!59 = !DISubprogram(name: "fflush", scope: !41, file: !41, line: 230, type: !52, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !61, file: !38, line: 106)
!61 = !DISubprogram(name: "fgetc", scope: !41, file: !41, line: 513, type: !52, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !63, file: !38, line: 107)
!63 = !DISubprogram(name: "fgetpos", scope: !41, file: !41, line: 760, type: !64, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!64 = !DISubroutineType(types: !65)
!65 = !{!11, !66, !67}
!66 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !49)
!67 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !68)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!69 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !70, file: !38, line: 108)
!70 = !DISubprogram(name: "fgets", scope: !41, file: !41, line: 592, type: !71, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!71 = !DISubroutineType(types: !72)
!72 = !{!73, !75, !11, !66}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !73)
!76 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !77, file: !38, line: 109)
!77 = !DISubprogram(name: "fopen", scope: !41, file: !41, line: 258, type: !78, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!78 = !DISubroutineType(types: !79)
!79 = !{!49, !80, !80}
!80 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !81)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !74)
!83 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !84, file: !38, line: 110)
!84 = !DISubprogram(name: "fprintf", scope: !41, file: !41, line: 350, type: !85, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!85 = !DISubroutineType(types: !86)
!86 = !{!11, !66, !80, null}
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !88, file: !38, line: 111)
!88 = !DISubprogram(name: "fputc", scope: !41, file: !41, line: 549, type: !89, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!89 = !DISubroutineType(types: !90)
!90 = !{!11, !11, !49}
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !92, file: !38, line: 112)
!92 = !DISubprogram(name: "fputs", scope: !41, file: !41, line: 655, type: !93, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!93 = !DISubroutineType(types: !94)
!94 = !{!11, !80, !66}
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !96, file: !38, line: 113)
!96 = !DISubprogram(name: "fread", scope: !41, file: !41, line: 675, type: !97, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!97 = !DISubroutineType(types: !98)
!98 = !{!99, !102, !99, !99, !66}
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !100, line: 62, baseType: !101)
!100 = !DIFile(filename: "/home/gabriel/Documents/hls-llvm-project/hls-build/lib/clang/7.0.0/include/stddef.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!101 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!102 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !103)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!104 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !105, file: !38, line: 114)
!105 = !DISubprogram(name: "freopen", scope: !41, file: !41, line: 265, type: !106, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!106 = !DISubroutineType(types: !107)
!107 = !{!49, !80, !80, !66}
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !109, file: !38, line: 115)
!109 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !41, file: !41, line: 434, type: !85, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !111, file: !38, line: 116)
!111 = !DISubprogram(name: "fseek", scope: !41, file: !41, line: 713, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DISubroutineType(types: !113)
!113 = !{!11, !49, !114, !11}
!114 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!115 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !116, file: !38, line: 117)
!116 = !DISubprogram(name: "fsetpos", scope: !41, file: !41, line: 765, type: !117, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!117 = !DISubroutineType(types: !118)
!118 = !{!11, !49, !119}
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!120 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !40)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !122, file: !38, line: 118)
!122 = !DISubprogram(name: "ftell", scope: !41, file: !41, line: 718, type: !123, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!123 = !DISubroutineType(types: !124)
!124 = !{!114, !49}
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !126, file: !38, line: 119)
!126 = !DISubprogram(name: "fwrite", scope: !41, file: !41, line: 681, type: !127, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!127 = !DISubroutineType(types: !128)
!128 = !{!99, !129, !99, !99, !66}
!129 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !130)
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !131, size: 64)
!131 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !133, file: !38, line: 120)
!133 = !DISubprogram(name: "getc", scope: !41, file: !41, line: 514, type: !52, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !135, file: !38, line: 121)
!135 = !DISubprogram(name: "getchar", scope: !41, file: !41, line: 520, type: !136, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!136 = !DISubroutineType(types: !137)
!137 = !{!11}
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !139, file: !38, line: 126)
!139 = !DISubprogram(name: "perror", scope: !41, file: !41, line: 804, type: !140, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!140 = !DISubroutineType(types: !141)
!141 = !{null, !81}
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !143, file: !38, line: 127)
!143 = !DISubprogram(name: "printf", scope: !41, file: !41, line: 356, type: !144, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!144 = !DISubroutineType(types: !145)
!145 = !{!11, !80, null}
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !147, file: !38, line: 128)
!147 = !DISubprogram(name: "putc", scope: !41, file: !41, line: 550, type: !89, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !149, file: !38, line: 129)
!149 = !DISubprogram(name: "putchar", scope: !41, file: !41, line: 556, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!150 = !DISubroutineType(types: !151)
!151 = !{!11, !11}
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !153, file: !38, line: 130)
!153 = !DISubprogram(name: "puts", scope: !41, file: !41, line: 661, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!154 = !DISubroutineType(types: !155)
!155 = !{!11, !81}
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !157, file: !38, line: 131)
!157 = !DISubprogram(name: "remove", scope: !41, file: !41, line: 152, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !159, file: !38, line: 132)
!159 = !DISubprogram(name: "rename", scope: !41, file: !41, line: 154, type: !160, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!160 = !DISubroutineType(types: !161)
!161 = !{!11, !81, !81}
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !163, file: !38, line: 133)
!163 = !DISubprogram(name: "rewind", scope: !41, file: !41, line: 723, type: !47, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !165, file: !38, line: 134)
!165 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !41, file: !41, line: 437, type: !144, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !167, file: !38, line: 135)
!167 = !DISubprogram(name: "setbuf", scope: !41, file: !41, line: 328, type: !168, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!168 = !DISubroutineType(types: !169)
!169 = !{null, !66, !75}
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !171, file: !38, line: 136)
!171 = !DISubprogram(name: "setvbuf", scope: !41, file: !41, line: 332, type: !172, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DISubroutineType(types: !173)
!173 = !{!11, !66, !75, !11, !99}
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !175, file: !38, line: 137)
!175 = !DISubprogram(name: "sprintf", scope: !41, file: !41, line: 358, type: !176, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!176 = !DISubroutineType(types: !177)
!177 = !{!11, !75, !80, null}
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !179, file: !38, line: 138)
!179 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !41, file: !41, line: 439, type: !180, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DISubroutineType(types: !181)
!181 = !{!11, !80, !80, null}
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !183, file: !38, line: 139)
!183 = !DISubprogram(name: "tmpfile", scope: !41, file: !41, line: 188, type: !184, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!184 = !DISubroutineType(types: !185)
!185 = !{!49}
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !187, file: !38, line: 141)
!187 = !DISubprogram(name: "tmpnam", scope: !41, file: !41, line: 205, type: !188, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DISubroutineType(types: !189)
!189 = !{!73, !73}
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !191, file: !38, line: 143)
!191 = !DISubprogram(name: "ungetc", scope: !41, file: !41, line: 668, type: !89, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !193, file: !38, line: 144)
!193 = !DISubprogram(name: "vfprintf", scope: !41, file: !41, line: 365, type: !194, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!194 = !DISubroutineType(types: !195)
!195 = !{!11, !66, !80, !196}
!196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !197, size: 64)
!197 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !29, size: 192, flags: DIFlagTypePassByValue, elements: !198, identifier: "_ZTS13__va_list_tag")
!198 = !{!199, !201, !202, !203}
!199 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !197, file: !29, baseType: !200, size: 32)
!200 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !197, file: !29, baseType: !200, size: 32, offset: 32)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !197, file: !29, baseType: !103, size: 64, offset: 64)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !197, file: !29, baseType: !103, size: 64, offset: 128)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !205, file: !38, line: 145)
!205 = !DISubprogram(name: "vprintf", scope: !41, file: !41, line: 371, type: !206, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DISubroutineType(types: !207)
!207 = !{!11, !80, !196}
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !209, file: !38, line: 146)
!209 = !DISubprogram(name: "vsprintf", scope: !41, file: !41, line: 373, type: !210, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DISubroutineType(types: !211)
!211 = !{!11, !75, !80, !196}
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !214, file: !38, line: 175)
!213 = !DINamespace(name: "__gnu_cxx", scope: null)
!214 = !DISubprogram(name: "snprintf", scope: !41, file: !41, line: 378, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DISubroutineType(types: !216)
!216 = !{!11, !75, !99, !80, null}
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !218, file: !38, line: 176)
!218 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !41, file: !41, line: 479, type: !194, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !220, file: !38, line: 177)
!220 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !41, file: !41, line: 484, type: !206, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !222, file: !38, line: 178)
!222 = !DISubprogram(name: "vsnprintf", scope: !41, file: !41, line: 382, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DISubroutineType(types: !224)
!224 = !{!11, !75, !99, !80, !196}
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !226, file: !38, line: 179)
!226 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !41, file: !41, line: 487, type: !227, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DISubroutineType(types: !228)
!228 = !{!11, !80, !80, !196}
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !214, file: !38, line: 185)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !218, file: !38, line: 186)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !220, file: !38, line: 187)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !222, file: !38, line: 188)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !226, file: !38, line: 189)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !235, file: !237, line: 52)
!235 = !DISubprogram(name: "abs", scope: !236, file: !236, line: 848, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!236 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!237 = !DIFile(filename: "/usr/include/c++/11/bits/std_abs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !239, file: !241, line: 127)
!239 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !236, line: 63, baseType: !240)
!240 = !DICompositeType(tag: DW_TAG_structure_type, file: !236, line: 59, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!241 = !DIFile(filename: "/usr/include/c++/11/cstdlib", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !243, file: !241, line: 128)
!243 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !236, line: 71, baseType: !244)
!244 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !236, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !245, identifier: "_ZTS6ldiv_t")
!245 = !{!246, !247}
!246 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !244, file: !236, line: 69, baseType: !114, size: 64)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !244, file: !236, line: 70, baseType: !114, size: 64, offset: 64)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !249, file: !241, line: 130)
!249 = !DISubprogram(name: "abort", scope: !236, file: !236, line: 598, type: !250, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!250 = !DISubroutineType(types: !251)
!251 = !{null}
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !253, file: !241, line: 134)
!253 = !DISubprogram(name: "atexit", scope: !236, file: !236, line: 602, type: !254, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!254 = !DISubroutineType(types: !255)
!255 = !{!11, !256}
!256 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !250, size: 64)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !258, file: !241, line: 137)
!258 = !DISubprogram(name: "at_quick_exit", scope: !236, file: !236, line: 607, type: !254, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !260, file: !241, line: 140)
!260 = !DISubprogram(name: "atof", scope: !236, file: !236, line: 102, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!261 = !DISubroutineType(types: !262)
!262 = !{!263, !81}
!263 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!264 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !265, file: !241, line: 141)
!265 = !DISubprogram(name: "atoi", scope: !236, file: !236, line: 105, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !267, file: !241, line: 142)
!267 = !DISubprogram(name: "atol", scope: !236, file: !236, line: 108, type: !268, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!268 = !DISubroutineType(types: !269)
!269 = !{!114, !81}
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !271, file: !241, line: 143)
!271 = !DISubprogram(name: "bsearch", scope: !236, file: !236, line: 828, type: !272, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!272 = !DISubroutineType(types: !273)
!273 = !{!103, !130, !130, !99, !99, !274}
!274 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !236, line: 816, baseType: !275)
!275 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !276, size: 64)
!276 = !DISubroutineType(types: !277)
!277 = !{!11, !130, !130}
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !279, file: !241, line: 144)
!279 = !DISubprogram(name: "calloc", scope: !236, file: !236, line: 543, type: !280, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!280 = !DISubroutineType(types: !281)
!281 = !{!103, !99, !99}
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !283, file: !241, line: 145)
!283 = !DISubprogram(name: "div", scope: !236, file: !236, line: 860, type: !284, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DISubroutineType(types: !285)
!285 = !{!239, !11, !11}
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !287, file: !241, line: 146)
!287 = !DISubprogram(name: "exit", scope: !236, file: !236, line: 624, type: !288, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!288 = !DISubroutineType(types: !289)
!289 = !{null, !11}
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !291, file: !241, line: 147)
!291 = !DISubprogram(name: "free", scope: !236, file: !236, line: 555, type: !292, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!292 = !DISubroutineType(types: !293)
!293 = !{null, !103}
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !295, file: !241, line: 148)
!295 = !DISubprogram(name: "getenv", scope: !236, file: !236, line: 641, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!296 = !DISubroutineType(types: !297)
!297 = !{!73, !81}
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !299, file: !241, line: 149)
!299 = !DISubprogram(name: "labs", scope: !236, file: !236, line: 849, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DISubroutineType(types: !301)
!301 = !{!114, !114}
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !303, file: !241, line: 150)
!303 = !DISubprogram(name: "ldiv", scope: !236, file: !236, line: 862, type: !304, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DISubroutineType(types: !305)
!305 = !{!243, !114, !114}
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !307, file: !241, line: 151)
!307 = !DISubprogram(name: "malloc", scope: !236, file: !236, line: 540, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DISubroutineType(types: !309)
!309 = !{!103, !99}
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !311, file: !241, line: 153)
!311 = !DISubprogram(name: "mblen", scope: !236, file: !236, line: 930, type: !312, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!312 = !DISubroutineType(types: !313)
!313 = !{!11, !81, !99}
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !315, file: !241, line: 154)
!315 = !DISubprogram(name: "mbstowcs", scope: !236, file: !236, line: 941, type: !316, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!316 = !DISubroutineType(types: !317)
!317 = !{!99, !318, !80, !99}
!318 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !319)
!319 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !320, size: 64)
!320 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !322, file: !241, line: 155)
!322 = !DISubprogram(name: "mbtowc", scope: !236, file: !236, line: 933, type: !323, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!323 = !DISubroutineType(types: !324)
!324 = !{!11, !318, !80, !99}
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !326, file: !241, line: 157)
!326 = !DISubprogram(name: "qsort", scope: !236, file: !236, line: 838, type: !327, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!327 = !DISubroutineType(types: !328)
!328 = !{null, !103, !99, !99, !274}
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !330, file: !241, line: 160)
!330 = !DISubprogram(name: "quick_exit", scope: !236, file: !236, line: 630, type: !288, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !332, file: !241, line: 163)
!332 = !DISubprogram(name: "rand", scope: !236, file: !236, line: 454, type: !136, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !334, file: !241, line: 164)
!334 = !DISubprogram(name: "realloc", scope: !236, file: !236, line: 551, type: !335, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!335 = !DISubroutineType(types: !336)
!336 = !{!103, !103, !99}
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !338, file: !241, line: 165)
!338 = !DISubprogram(name: "srand", scope: !236, file: !236, line: 456, type: !339, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!339 = !DISubroutineType(types: !340)
!340 = !{null, !200}
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !342, file: !241, line: 166)
!342 = !DISubprogram(name: "strtod", scope: !236, file: !236, line: 118, type: !343, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!343 = !DISubroutineType(types: !344)
!344 = !{!263, !80, !345}
!345 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !346)
!346 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !348, file: !241, line: 167)
!348 = !DISubprogram(name: "strtol", scope: !236, file: !236, line: 177, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DISubroutineType(types: !350)
!350 = !{!114, !80, !345, !11}
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !352, file: !241, line: 168)
!352 = !DISubprogram(name: "strtoul", scope: !236, file: !236, line: 181, type: !353, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!353 = !DISubroutineType(types: !354)
!354 = !{!101, !80, !345, !11}
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !356, file: !241, line: 169)
!356 = !DISubprogram(name: "system", scope: !236, file: !236, line: 791, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !358, file: !241, line: 171)
!358 = !DISubprogram(name: "wcstombs", scope: !236, file: !236, line: 945, type: !359, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!359 = !DISubroutineType(types: !360)
!360 = !{!99, !75, !361, !99}
!361 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !362)
!362 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !363, size: 64)
!363 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !320)
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !365, file: !241, line: 172)
!365 = !DISubprogram(name: "wctomb", scope: !236, file: !236, line: 937, type: !366, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!366 = !DISubroutineType(types: !367)
!367 = !{!11, !73, !320}
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !369, file: !241, line: 200)
!369 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !236, line: 81, baseType: !370)
!370 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !236, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !371, identifier: "_ZTS7lldiv_t")
!371 = !{!372, !374}
!372 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !370, file: !236, line: 79, baseType: !373, size: 64)
!373 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!374 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !370, file: !236, line: 80, baseType: !373, size: 64, offset: 64)
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !376, file: !241, line: 206)
!376 = !DISubprogram(name: "_Exit", scope: !236, file: !236, line: 636, type: !288, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !378, file: !241, line: 210)
!378 = !DISubprogram(name: "llabs", scope: !236, file: !236, line: 852, type: !379, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!379 = !DISubroutineType(types: !380)
!380 = !{!373, !373}
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !382, file: !241, line: 216)
!382 = !DISubprogram(name: "lldiv", scope: !236, file: !236, line: 866, type: !383, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!383 = !DISubroutineType(types: !384)
!384 = !{!369, !373, !373}
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !386, file: !241, line: 227)
!386 = !DISubprogram(name: "atoll", scope: !236, file: !236, line: 113, type: !387, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!387 = !DISubroutineType(types: !388)
!388 = !{!373, !81}
!389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !390, file: !241, line: 228)
!390 = !DISubprogram(name: "strtoll", scope: !236, file: !236, line: 201, type: !391, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!391 = !DISubroutineType(types: !392)
!392 = !{!373, !80, !345, !11}
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !394, file: !241, line: 229)
!394 = !DISubprogram(name: "strtoull", scope: !236, file: !236, line: 206, type: !395, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!395 = !DISubroutineType(types: !396)
!396 = !{!397, !80, !345, !11}
!397 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !399, file: !241, line: 231)
!399 = !DISubprogram(name: "strtof", scope: !236, file: !236, line: 124, type: !400, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!400 = !DISubroutineType(types: !401)
!401 = !{!402, !80, !345}
!402 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !404, file: !241, line: 232)
!404 = !DISubprogram(name: "strtold", scope: !236, file: !236, line: 127, type: !405, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!405 = !DISubroutineType(types: !406)
!406 = !{!407, !80, !345}
!407 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !369, file: !241, line: 240)
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !376, file: !241, line: 242)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !378, file: !241, line: 244)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !412, file: !241, line: 245)
!412 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !213, file: !241, line: 213, type: !383, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !382, file: !241, line: 246)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !386, file: !241, line: 248)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !399, file: !241, line: 249)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !390, file: !241, line: 250)
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !394, file: !241, line: 251)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !404, file: !241, line: 252)
!419 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !420, entity: !421, file: !422, line: 58)
!420 = !DINamespace(name: "__gnu_debug", scope: null)
!421 = !DINamespace(name: "__debug", scope: !2)
!422 = !DIFile(filename: "/usr/include/c++/11/debug/debug.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !424, file: !439, line: 64)
!424 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !425, line: 6, baseType: !426)
!425 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!426 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !427, line: 21, baseType: !428)
!427 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!428 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !427, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !429, identifier: "_ZTS11__mbstate_t")
!429 = !{!430, !431}
!430 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !428, file: !427, line: 15, baseType: !11, size: 32)
!431 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !428, file: !427, line: 20, baseType: !432, size: 32, offset: 32)
!432 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !428, file: !427, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !433, identifier: "_ZTSN11__mbstate_tUt_E")
!433 = !{!434, !435}
!434 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !432, file: !427, line: 18, baseType: !200, size: 32)
!435 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !432, file: !427, line: 19, baseType: !436, size: 32)
!436 = !DICompositeType(tag: DW_TAG_array_type, baseType: !74, size: 32, elements: !437)
!437 = !{!438}
!438 = !DISubrange(count: 4)
!439 = !DIFile(filename: "/usr/include/c++/11/cwchar", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !441, file: !439, line: 141)
!441 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !442, line: 20, baseType: !200)
!442 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !444, file: !439, line: 143)
!444 = !DISubprogram(name: "btowc", scope: !445, file: !445, line: 285, type: !446, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!445 = !DIFile(filename: "/usr/include/wchar.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!446 = !DISubroutineType(types: !447)
!447 = !{!441, !11}
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !449, file: !439, line: 144)
!449 = !DISubprogram(name: "fgetwc", scope: !445, file: !445, line: 744, type: !450, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!450 = !DISubroutineType(types: !451)
!451 = !{!441, !452}
!452 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !453, size: 64)
!453 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !454, line: 5, baseType: !36)
!454 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !456, file: !439, line: 145)
!456 = !DISubprogram(name: "fgetws", scope: !445, file: !445, line: 773, type: !457, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!457 = !DISubroutineType(types: !458)
!458 = !{!319, !318, !11, !459}
!459 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !452)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !461, file: !439, line: 146)
!461 = !DISubprogram(name: "fputwc", scope: !445, file: !445, line: 758, type: !462, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!462 = !DISubroutineType(types: !463)
!463 = !{!441, !320, !452}
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !465, file: !439, line: 147)
!465 = !DISubprogram(name: "fputws", scope: !445, file: !445, line: 780, type: !466, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!466 = !DISubroutineType(types: !467)
!467 = !{!11, !361, !459}
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !469, file: !439, line: 148)
!469 = !DISubprogram(name: "fwide", scope: !445, file: !445, line: 588, type: !470, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!470 = !DISubroutineType(types: !471)
!471 = !{!11, !452, !11}
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !473, file: !439, line: 149)
!473 = !DISubprogram(name: "fwprintf", scope: !445, file: !445, line: 595, type: !474, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!474 = !DISubroutineType(types: !475)
!475 = !{!11, !459, !361, null}
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !477, file: !439, line: 150)
!477 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !445, file: !445, line: 657, type: !474, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !479, file: !439, line: 151)
!479 = !DISubprogram(name: "getwc", scope: !445, file: !445, line: 745, type: !450, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !481, file: !439, line: 152)
!481 = !DISubprogram(name: "getwchar", scope: !445, file: !445, line: 751, type: !482, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!482 = !DISubroutineType(types: !483)
!483 = !{!441}
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !485, file: !439, line: 153)
!485 = !DISubprogram(name: "mbrlen", scope: !445, file: !445, line: 308, type: !486, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!486 = !DISubroutineType(types: !487)
!487 = !{!99, !80, !99, !488}
!488 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !489)
!489 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !424, size: 64)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !491, file: !439, line: 154)
!491 = !DISubprogram(name: "mbrtowc", scope: !445, file: !445, line: 297, type: !492, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!492 = !DISubroutineType(types: !493)
!493 = !{!99, !318, !80, !99, !488}
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !495, file: !439, line: 155)
!495 = !DISubprogram(name: "mbsinit", scope: !445, file: !445, line: 293, type: !496, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DISubroutineType(types: !497)
!497 = !{!11, !498}
!498 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !499, size: 64)
!499 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !424)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !501, file: !439, line: 156)
!501 = !DISubprogram(name: "mbsrtowcs", scope: !445, file: !445, line: 338, type: !502, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!502 = !DISubroutineType(types: !503)
!503 = !{!99, !318, !504, !99, !488}
!504 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !505)
!505 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !507, file: !439, line: 157)
!507 = !DISubprogram(name: "putwc", scope: !445, file: !445, line: 759, type: !462, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !509, file: !439, line: 158)
!509 = !DISubprogram(name: "putwchar", scope: !445, file: !445, line: 765, type: !510, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!510 = !DISubroutineType(types: !511)
!511 = !{!441, !320}
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !513, file: !439, line: 160)
!513 = !DISubprogram(name: "swprintf", scope: !445, file: !445, line: 605, type: !514, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DISubroutineType(types: !515)
!515 = !{!11, !318, !99, !361, null}
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !517, file: !439, line: 162)
!517 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !445, file: !445, line: 664, type: !518, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!518 = !DISubroutineType(types: !519)
!519 = !{!11, !361, !361, null}
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !521, file: !439, line: 163)
!521 = !DISubprogram(name: "ungetwc", scope: !445, file: !445, line: 788, type: !522, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DISubroutineType(types: !523)
!523 = !{!441, !441, !452}
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !525, file: !439, line: 164)
!525 = !DISubprogram(name: "vfwprintf", scope: !445, file: !445, line: 613, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DISubroutineType(types: !527)
!527 = !{!11, !459, !361, !196}
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !529, file: !439, line: 166)
!529 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !445, file: !445, line: 711, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !531, file: !439, line: 169)
!531 = !DISubprogram(name: "vswprintf", scope: !445, file: !445, line: 626, type: !532, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!532 = !DISubroutineType(types: !533)
!533 = !{!11, !318, !99, !361, !196}
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !535, file: !439, line: 172)
!535 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !445, file: !445, line: 718, type: !536, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!536 = !DISubroutineType(types: !537)
!537 = !{!11, !361, !361, !196}
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !539, file: !439, line: 174)
!539 = !DISubprogram(name: "vwprintf", scope: !445, file: !445, line: 621, type: !540, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!540 = !DISubroutineType(types: !541)
!541 = !{!11, !361, !196}
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !543, file: !439, line: 176)
!543 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !445, file: !445, line: 715, type: !540, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !545, file: !439, line: 178)
!545 = !DISubprogram(name: "wcrtomb", scope: !445, file: !445, line: 302, type: !546, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!546 = !DISubroutineType(types: !547)
!547 = !{!99, !75, !320, !488}
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !549, file: !439, line: 179)
!549 = !DISubprogram(name: "wcscat", scope: !445, file: !445, line: 97, type: !550, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!550 = !DISubroutineType(types: !551)
!551 = !{!319, !318, !361}
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !553, file: !439, line: 180)
!553 = !DISubprogram(name: "wcscmp", scope: !445, file: !445, line: 106, type: !554, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!554 = !DISubroutineType(types: !555)
!555 = !{!11, !362, !362}
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !557, file: !439, line: 181)
!557 = !DISubprogram(name: "wcscoll", scope: !445, file: !445, line: 131, type: !554, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !559, file: !439, line: 182)
!559 = !DISubprogram(name: "wcscpy", scope: !445, file: !445, line: 87, type: !550, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !561, file: !439, line: 183)
!561 = !DISubprogram(name: "wcscspn", scope: !445, file: !445, line: 188, type: !562, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!562 = !DISubroutineType(types: !563)
!563 = !{!99, !362, !362}
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !565, file: !439, line: 184)
!565 = !DISubprogram(name: "wcsftime", scope: !445, file: !445, line: 852, type: !566, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!566 = !DISubroutineType(types: !567)
!567 = !{!99, !318, !99, !361, !568}
!568 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !569)
!569 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !570, size: 64)
!570 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !571)
!571 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !445, line: 83, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !573, file: !439, line: 185)
!573 = !DISubprogram(name: "wcslen", scope: !445, file: !445, line: 223, type: !574, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!574 = !DISubroutineType(types: !575)
!575 = !{!99, !362}
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !577, file: !439, line: 186)
!577 = !DISubprogram(name: "wcsncat", scope: !445, file: !445, line: 101, type: !578, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!578 = !DISubroutineType(types: !579)
!579 = !{!319, !318, !361, !99}
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !581, file: !439, line: 187)
!581 = !DISubprogram(name: "wcsncmp", scope: !445, file: !445, line: 109, type: !582, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!582 = !DISubroutineType(types: !583)
!583 = !{!11, !362, !362, !99}
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !585, file: !439, line: 188)
!585 = !DISubprogram(name: "wcsncpy", scope: !445, file: !445, line: 92, type: !578, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !587, file: !439, line: 189)
!587 = !DISubprogram(name: "wcsrtombs", scope: !445, file: !445, line: 344, type: !588, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!588 = !DISubroutineType(types: !589)
!589 = !{!99, !75, !590, !99, !488}
!590 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !591)
!591 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !362, size: 64)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !593, file: !439, line: 190)
!593 = !DISubprogram(name: "wcsspn", scope: !445, file: !445, line: 192, type: !562, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !595, file: !439, line: 191)
!595 = !DISubprogram(name: "wcstod", scope: !445, file: !445, line: 378, type: !596, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!596 = !DISubroutineType(types: !597)
!597 = !{!263, !361, !598}
!598 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !599)
!599 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !319, size: 64)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !601, file: !439, line: 193)
!601 = !DISubprogram(name: "wcstof", scope: !445, file: !445, line: 383, type: !602, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!602 = !DISubroutineType(types: !603)
!603 = !{!402, !361, !598}
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !605, file: !439, line: 195)
!605 = !DISubprogram(name: "wcstok", scope: !445, file: !445, line: 218, type: !606, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!606 = !DISubroutineType(types: !607)
!607 = !{!319, !318, !361, !598}
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !609, file: !439, line: 196)
!609 = !DISubprogram(name: "wcstol", scope: !445, file: !445, line: 429, type: !610, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!610 = !DISubroutineType(types: !611)
!611 = !{!114, !361, !598, !11}
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !613, file: !439, line: 197)
!613 = !DISubprogram(name: "wcstoul", scope: !445, file: !445, line: 434, type: !614, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!614 = !DISubroutineType(types: !615)
!615 = !{!101, !361, !598, !11}
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !617, file: !439, line: 198)
!617 = !DISubprogram(name: "wcsxfrm", scope: !445, file: !445, line: 135, type: !618, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!618 = !DISubroutineType(types: !619)
!619 = !{!99, !318, !361, !99}
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !621, file: !439, line: 199)
!621 = !DISubprogram(name: "wctob", scope: !445, file: !445, line: 289, type: !622, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!622 = !DISubroutineType(types: !623)
!623 = !{!11, !441}
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !625, file: !439, line: 200)
!625 = !DISubprogram(name: "wmemcmp", scope: !445, file: !445, line: 259, type: !582, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !627, file: !439, line: 201)
!627 = !DISubprogram(name: "wmemcpy", scope: !445, file: !445, line: 263, type: !578, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !629, file: !439, line: 202)
!629 = !DISubprogram(name: "wmemmove", scope: !445, file: !445, line: 268, type: !630, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!630 = !DISubroutineType(types: !631)
!631 = !{!319, !319, !362, !99}
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !633, file: !439, line: 203)
!633 = !DISubprogram(name: "wmemset", scope: !445, file: !445, line: 272, type: !634, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!634 = !DISubroutineType(types: !635)
!635 = !{!319, !319, !320, !99}
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !637, file: !439, line: 204)
!637 = !DISubprogram(name: "wprintf", scope: !445, file: !445, line: 602, type: !638, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!638 = !DISubroutineType(types: !639)
!639 = !{!11, !361, null}
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !641, file: !439, line: 205)
!641 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !445, file: !445, line: 661, type: !638, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !643, file: !439, line: 206)
!643 = !DISubprogram(name: "wcschr", scope: !445, file: !445, line: 165, type: !644, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!644 = !DISubroutineType(types: !645)
!645 = !{!319, !362, !320}
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !647, file: !439, line: 207)
!647 = !DISubprogram(name: "wcspbrk", scope: !445, file: !445, line: 202, type: !648, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!648 = !DISubroutineType(types: !649)
!649 = !{!319, !362, !362}
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !651, file: !439, line: 208)
!651 = !DISubprogram(name: "wcsrchr", scope: !445, file: !445, line: 175, type: !644, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !653, file: !439, line: 209)
!653 = !DISubprogram(name: "wcsstr", scope: !445, file: !445, line: 213, type: !648, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !655, file: !439, line: 210)
!655 = !DISubprogram(name: "wmemchr", scope: !445, file: !445, line: 254, type: !656, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!656 = !DISubroutineType(types: !657)
!657 = !{!319, !362, !320, !99}
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !659, file: !439, line: 251)
!659 = !DISubprogram(name: "wcstold", scope: !445, file: !445, line: 385, type: !660, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!660 = !DISubroutineType(types: !661)
!661 = !{!407, !361, !598}
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !663, file: !439, line: 260)
!663 = !DISubprogram(name: "wcstoll", scope: !445, file: !445, line: 442, type: !664, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!664 = !DISubroutineType(types: !665)
!665 = !{!373, !361, !598, !11}
!666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !667, file: !439, line: 261)
!667 = !DISubprogram(name: "wcstoull", scope: !445, file: !445, line: 449, type: !668, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!668 = !DISubroutineType(types: !669)
!669 = !{!397, !361, !598, !11}
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !659, file: !439, line: 267)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !663, file: !439, line: 268)
!672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !667, file: !439, line: 269)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !601, file: !439, line: 283)
!674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !529, file: !439, line: 286)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !535, file: !439, line: 289)
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !543, file: !439, line: 292)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !659, file: !439, line: 296)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !663, file: !439, line: 297)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !667, file: !439, line: 298)
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !681, file: !686, line: 47)
!681 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !682, line: 24, baseType: !683)
!682 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!683 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !684, line: 37, baseType: !685)
!684 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!685 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!686 = !DIFile(filename: "/usr/include/c++/11/cstdint", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !688, file: !686, line: 48)
!688 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !682, line: 25, baseType: !689)
!689 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !684, line: 39, baseType: !690)
!690 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !692, file: !686, line: 49)
!692 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !682, line: 26, baseType: !693)
!693 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !684, line: 41, baseType: !11)
!694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !695, file: !686, line: 50)
!695 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !682, line: 27, baseType: !696)
!696 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !684, line: 44, baseType: !114)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !698, file: !686, line: 52)
!698 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !699, line: 58, baseType: !685)
!699 = !DIFile(filename: "/usr/include/stdint.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !701, file: !686, line: 53)
!701 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !699, line: 60, baseType: !114)
!702 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !703, file: !686, line: 54)
!703 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !699, line: 61, baseType: !114)
!704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !705, file: !686, line: 55)
!705 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !699, line: 62, baseType: !114)
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !707, file: !686, line: 57)
!707 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !699, line: 43, baseType: !708)
!708 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !684, line: 52, baseType: !683)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !710, file: !686, line: 58)
!710 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !699, line: 44, baseType: !711)
!711 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !684, line: 54, baseType: !689)
!712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !713, file: !686, line: 59)
!713 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !699, line: 45, baseType: !714)
!714 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !684, line: 56, baseType: !693)
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !716, file: !686, line: 60)
!716 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !699, line: 46, baseType: !717)
!717 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !684, line: 58, baseType: !696)
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !719, file: !686, line: 62)
!719 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !699, line: 101, baseType: !720)
!720 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !684, line: 72, baseType: !114)
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !722, file: !686, line: 63)
!722 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !699, line: 87, baseType: !114)
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !724, file: !686, line: 65)
!724 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !725, line: 24, baseType: !726)
!725 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!726 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !684, line: 38, baseType: !727)
!727 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !729, file: !686, line: 66)
!729 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !725, line: 25, baseType: !730)
!730 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !684, line: 40, baseType: !731)
!731 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !733, file: !686, line: 67)
!733 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !725, line: 26, baseType: !734)
!734 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !684, line: 42, baseType: !200)
!735 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !736, file: !686, line: 68)
!736 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !725, line: 27, baseType: !737)
!737 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !684, line: 45, baseType: !101)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !739, file: !686, line: 70)
!739 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !699, line: 71, baseType: !727)
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !741, file: !686, line: 71)
!741 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !699, line: 73, baseType: !101)
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !743, file: !686, line: 72)
!743 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !699, line: 74, baseType: !101)
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !745, file: !686, line: 73)
!745 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !699, line: 75, baseType: !101)
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !747, file: !686, line: 75)
!747 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !699, line: 49, baseType: !748)
!748 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !684, line: 53, baseType: !726)
!749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !750, file: !686, line: 76)
!750 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !699, line: 50, baseType: !751)
!751 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !684, line: 55, baseType: !730)
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !753, file: !686, line: 77)
!753 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !699, line: 51, baseType: !754)
!754 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !684, line: 57, baseType: !734)
!755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !756, file: !686, line: 78)
!756 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !699, line: 52, baseType: !757)
!757 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !684, line: 59, baseType: !737)
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !759, file: !686, line: 80)
!759 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !699, line: 102, baseType: !760)
!760 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !684, line: 73, baseType: !101)
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !762, file: !686, line: 81)
!762 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !699, line: 90, baseType: !101)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !764, file: !766, line: 53)
!764 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !765, line: 51, size: 768, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!765 = !DIFile(filename: "/usr/include/locale.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!766 = !DIFile(filename: "/usr/include/c++/11/clocale", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !768, file: !766, line: 54)
!768 = !DISubprogram(name: "setlocale", scope: !765, file: !765, line: 122, type: !769, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!769 = !DISubroutineType(types: !770)
!770 = !{!73, !11, !81}
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !772, file: !766, line: 55)
!772 = !DISubprogram(name: "localeconv", scope: !765, file: !765, line: 125, type: !773, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!773 = !DISubroutineType(types: !774)
!774 = !{!775}
!775 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !764, size: 64)
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !777, file: !779, line: 64)
!777 = !DISubprogram(name: "isalnum", scope: !778, file: !778, line: 108, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!778 = !DIFile(filename: "/usr/include/ctype.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!779 = !DIFile(filename: "/usr/include/c++/11/cctype", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !781, file: !779, line: 65)
!781 = !DISubprogram(name: "isalpha", scope: !778, file: !778, line: 109, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !783, file: !779, line: 66)
!783 = !DISubprogram(name: "iscntrl", scope: !778, file: !778, line: 110, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !785, file: !779, line: 67)
!785 = !DISubprogram(name: "isdigit", scope: !778, file: !778, line: 111, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !787, file: !779, line: 68)
!787 = !DISubprogram(name: "isgraph", scope: !778, file: !778, line: 113, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !789, file: !779, line: 69)
!789 = !DISubprogram(name: "islower", scope: !778, file: !778, line: 112, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !791, file: !779, line: 70)
!791 = !DISubprogram(name: "isprint", scope: !778, file: !778, line: 114, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !793, file: !779, line: 71)
!793 = !DISubprogram(name: "ispunct", scope: !778, file: !778, line: 115, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !795, file: !779, line: 72)
!795 = !DISubprogram(name: "isspace", scope: !778, file: !778, line: 116, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !797, file: !779, line: 73)
!797 = !DISubprogram(name: "isupper", scope: !778, file: !778, line: 117, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !799, file: !779, line: 74)
!799 = !DISubprogram(name: "isxdigit", scope: !778, file: !778, line: 118, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !801, file: !779, line: 75)
!801 = !DISubprogram(name: "tolower", scope: !778, file: !778, line: 122, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !803, file: !779, line: 76)
!803 = !DISubprogram(name: "toupper", scope: !778, file: !778, line: 125, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !805, file: !779, line: 87)
!805 = !DISubprogram(name: "isblank", scope: !778, file: !778, line: 130, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !807, file: !808, line: 68)
!807 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !809, file: !808, line: 90, size: 64, flags: DIFlagTypePassByReference, elements: !810, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!808 = !DIFile(filename: "/usr/include/c++/11/bits/exception_ptr.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!809 = !DINamespace(name: "__exception_ptr", scope: !2)
!810 = !{!811, !812, !816, !819, !820, !825, !826, !830, !836, !840, !844, !847, !848, !851, !854}
!811 = !DIDerivedType(tag: DW_TAG_member, name: "_M_exception_object", scope: !807, file: !808, line: 92, baseType: !103, size: 64)
!812 = !DISubprogram(name: "exception_ptr", scope: !807, file: !808, line: 94, type: !813, isLocal: false, isDefinition: false, scopeLine: 94, flags: DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!813 = !DISubroutineType(types: !814)
!814 = !{null, !815, !103}
!815 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !807, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!816 = !DISubprogram(name: "_M_addref", linkageName: "_ZNSt15__exception_ptr13exception_ptr9_M_addrefEv", scope: !807, file: !808, line: 96, type: !817, isLocal: false, isDefinition: false, scopeLine: 96, flags: DIFlagPrototyped, isOptimized: false)
!817 = !DISubroutineType(types: !818)
!818 = !{null, !815}
!819 = !DISubprogram(name: "_M_release", linkageName: "_ZNSt15__exception_ptr13exception_ptr10_M_releaseEv", scope: !807, file: !808, line: 97, type: !817, isLocal: false, isDefinition: false, scopeLine: 97, flags: DIFlagPrototyped, isOptimized: false)
!820 = !DISubprogram(name: "_M_get", linkageName: "_ZNKSt15__exception_ptr13exception_ptr6_M_getEv", scope: !807, file: !808, line: 99, type: !821, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPrototyped, isOptimized: false)
!821 = !DISubroutineType(types: !822)
!822 = !{!103, !823}
!823 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !824, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!824 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !807)
!825 = !DISubprogram(name: "exception_ptr", scope: !807, file: !808, line: 107, type: !817, isLocal: false, isDefinition: false, scopeLine: 107, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!826 = !DISubprogram(name: "exception_ptr", scope: !807, file: !808, line: 109, type: !827, isLocal: false, isDefinition: false, scopeLine: 109, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!827 = !DISubroutineType(types: !828)
!828 = !{null, !815, !829}
!829 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !824, size: 64)
!830 = !DISubprogram(name: "exception_ptr", scope: !807, file: !808, line: 112, type: !831, isLocal: false, isDefinition: false, scopeLine: 112, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!831 = !DISubroutineType(types: !832)
!832 = !{null, !815, !833}
!833 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !2, file: !834, line: 302, baseType: !835)
!834 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/c++config.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!835 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!836 = !DISubprogram(name: "exception_ptr", scope: !807, file: !808, line: 116, type: !837, isLocal: false, isDefinition: false, scopeLine: 116, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!837 = !DISubroutineType(types: !838)
!838 = !{null, !815, !839}
!839 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !807, size: 64)
!840 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSERKS0_", scope: !807, file: !808, line: 129, type: !841, isLocal: false, isDefinition: false, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!841 = !DISubroutineType(types: !842)
!842 = !{!843, !815, !829}
!843 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !807, size: 64)
!844 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSEOS0_", scope: !807, file: !808, line: 133, type: !845, isLocal: false, isDefinition: false, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!845 = !DISubroutineType(types: !846)
!846 = !{!843, !815, !839}
!847 = !DISubprogram(name: "~exception_ptr", scope: !807, file: !808, line: 140, type: !817, isLocal: false, isDefinition: false, scopeLine: 140, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!848 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr13exception_ptr4swapERS0_", scope: !807, file: !808, line: 143, type: !849, isLocal: false, isDefinition: false, scopeLine: 143, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!849 = !DISubroutineType(types: !850)
!850 = !{null, !815, !843}
!851 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt15__exception_ptr13exception_ptrcvbEv", scope: !807, file: !808, line: 155, type: !852, isLocal: false, isDefinition: false, scopeLine: 155, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!852 = !DISubroutineType(types: !853)
!853 = !{!13, !823}
!854 = !DISubprogram(name: "__cxa_exception_type", linkageName: "_ZNKSt15__exception_ptr13exception_ptr20__cxa_exception_typeEv", scope: !807, file: !808, line: 176, type: !855, isLocal: false, isDefinition: false, scopeLine: 176, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!855 = !DISubroutineType(types: !856)
!856 = !{!857, !823}
!857 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !858, size: 64)
!858 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !859)
!859 = !DICompositeType(tag: DW_TAG_class_type, name: "type_info", scope: !2, file: !860, line: 88, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt9type_info")
!860 = !DIFile(filename: "/usr/include/c++/11/typeinfo", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !809, entity: !862, file: !808, line: 84)
!862 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !2, file: !808, line: 80, type: !863, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!863 = !DISubroutineType(types: !864)
!864 = !{null, !807}
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !866, file: !870, line: 82)
!866 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !867, line: 48, baseType: !868)
!867 = !DIFile(filename: "/usr/include/wctype.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!868 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !869, size: 64)
!869 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !693)
!870 = !DIFile(filename: "/usr/include/c++/11/cwctype", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !872, file: !870, line: 83)
!872 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !873, line: 38, baseType: !101)
!873 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !441, file: !870, line: 84)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !876, file: !870, line: 86)
!876 = !DISubprogram(name: "iswalnum", scope: !873, file: !873, line: 95, type: !622, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !878, file: !870, line: 87)
!878 = !DISubprogram(name: "iswalpha", scope: !873, file: !873, line: 101, type: !622, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !880, file: !870, line: 89)
!880 = !DISubprogram(name: "iswblank", scope: !873, file: !873, line: 146, type: !622, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !882, file: !870, line: 91)
!882 = !DISubprogram(name: "iswcntrl", scope: !873, file: !873, line: 104, type: !622, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !884, file: !870, line: 92)
!884 = !DISubprogram(name: "iswctype", scope: !873, file: !873, line: 159, type: !885, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!885 = !DISubroutineType(types: !886)
!886 = !{!11, !441, !872}
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !888, file: !870, line: 93)
!888 = !DISubprogram(name: "iswdigit", scope: !873, file: !873, line: 108, type: !622, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !890, file: !870, line: 94)
!890 = !DISubprogram(name: "iswgraph", scope: !873, file: !873, line: 112, type: !622, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !892, file: !870, line: 95)
!892 = !DISubprogram(name: "iswlower", scope: !873, file: !873, line: 117, type: !622, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !894, file: !870, line: 96)
!894 = !DISubprogram(name: "iswprint", scope: !873, file: !873, line: 120, type: !622, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !896, file: !870, line: 97)
!896 = !DISubprogram(name: "iswpunct", scope: !873, file: !873, line: 125, type: !622, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !898, file: !870, line: 98)
!898 = !DISubprogram(name: "iswspace", scope: !873, file: !873, line: 130, type: !622, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !900, file: !870, line: 99)
!900 = !DISubprogram(name: "iswupper", scope: !873, file: !873, line: 135, type: !622, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !902, file: !870, line: 100)
!902 = !DISubprogram(name: "iswxdigit", scope: !873, file: !873, line: 140, type: !622, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !904, file: !870, line: 101)
!904 = !DISubprogram(name: "towctrans", scope: !867, file: !867, line: 55, type: !905, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!905 = !DISubroutineType(types: !906)
!906 = !{!441, !441, !866}
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !908, file: !870, line: 102)
!908 = !DISubprogram(name: "towlower", scope: !873, file: !873, line: 166, type: !909, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!909 = !DISubroutineType(types: !910)
!910 = !{!441, !441}
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !912, file: !870, line: 103)
!912 = !DISubprogram(name: "towupper", scope: !873, file: !873, line: 169, type: !909, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !914, file: !870, line: 104)
!914 = !DISubprogram(name: "wctrans", scope: !867, file: !867, line: 52, type: !915, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!915 = !DISubroutineType(types: !916)
!916 = !{!866, !81}
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !918, file: !870, line: 105)
!918 = !DISubprogram(name: "wctype", scope: !873, file: !873, line: 155, type: !919, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!919 = !DISubroutineType(types: !920)
!920 = !{!872, !81}
!921 = !{i32 2, !"Dwarf Version", i32 4}
!922 = !{i32 2, !"Debug Info Version", i32 3}
!923 = !{i32 1, !"wchar_size", i32 4}
!924 = !{i32 7, !"PIC Level", i32 2}
!925 = !{!"clang version 7.0.0 "}
!926 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !3, file: !3, line: 74, type: !250, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!927 = !DILocation(line: 74, column: 25, scope: !926)
!928 = distinct !DISubprogram(name: "main", scope: !29, file: !29, line: 25, type: !929, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!929 = !DISubroutineType(types: !930)
!930 = !{!11, !11, !346}
!931 = !DILocalVariable(name: "argc", arg: 1, scope: !928, file: !29, line: 25, type: !11)
!932 = !DILocation(line: 25, column: 14, scope: !928)
!933 = !DILocalVariable(name: "argv", arg: 2, scope: !928, file: !29, line: 25, type: !346)
!934 = !DILocation(line: 25, column: 28, scope: !928)
!935 = !DILocation(line: 27, column: 3, scope: !928)
!936 = !DILocalVariable(name: "Data", scope: !928, file: !29, line: 29, type: !937)
!937 = !DICompositeType(tag: DW_TAG_array_type, baseType: !727, size: 614400, elements: !938)
!938 = !{!939, !940}
!939 = !DISubrange(count: 240)
!940 = !DISubrange(count: 320)
!941 = !DILocation(line: 29, column: 17, scope: !928)
!942 = !DILocalVariable(name: "output_image_filename", scope: !928, file: !29, line: 31, type: !943)
!943 = !DIDerivedType(tag: DW_TAG_typedef, name: "string", scope: !2, file: !944, line: 79, baseType: !945)
!944 = !DIFile(filename: "/usr/include/c++/11/bits/stringfwd.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!945 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_string<char, std::char_traits<char>, std::allocator<char> >", scope: !947, file: !946, line: 1627, size: 256, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE")
!946 = !DIFile(filename: "/usr/include/c++/11/bits/basic_string.tcc", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!947 = !DINamespace(name: "__cxx11", scope: !2, exportSymbols: true)
!948 = !DILocation(line: 31, column: 15, scope: !928)
!949 = !DILocation(line: 31, column: 39, scope: !928)
!950 = !DILocation(line: 34, column: 27, scope: !928)
!951 = !DILocation(line: 34, column: 33, scope: !928)
!952 = !DILocation(line: 34, column: 39, scope: !928)
!953 = !DILocation(line: 34, column: 3, scope: !928)
!954 = !DILocalVariable(name: "result_x", scope: !928, file: !29, line: 37, type: !955)
!955 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 3200, elements: !956)
!956 = !{!957}
!957 = !DISubrange(count: 100)
!958 = !DILocation(line: 37, column: 7, scope: !928)
!959 = !DILocalVariable(name: "result_y", scope: !928, file: !29, line: 38, type: !955)
!960 = !DILocation(line: 38, column: 7, scope: !928)
!961 = !DILocalVariable(name: "result_w", scope: !928, file: !29, line: 39, type: !955)
!962 = !DILocation(line: 39, column: 7, scope: !928)
!963 = !DILocalVariable(name: "result_h", scope: !928, file: !29, line: 40, type: !955)
!964 = !DILocation(line: 40, column: 7, scope: !928)
!965 = !DILocalVariable(name: "res_size", scope: !928, file: !29, line: 41, type: !11)
!966 = !DILocation(line: 41, column: 7, scope: !928)
!967 = !DILocalVariable(name: "start", scope: !928, file: !29, line: 44, type: !968)
!968 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !969, line: 8, size: 128, flags: DIFlagTypePassByValue, elements: !970, identifier: "_ZTS7timeval")
!969 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timeval.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!970 = !{!971, !973}
!971 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !968, file: !969, line: 14, baseType: !972, size: 64)
!972 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !684, line: 160, baseType: !114)
!973 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !968, file: !969, line: 15, baseType: !974, size: 64, offset: 64)
!974 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !684, line: 162, baseType: !114)
!975 = !DILocation(line: 44, column: 18, scope: !928)
!976 = !DILocalVariable(name: "end", scope: !928, file: !29, line: 44, type: !968)
!977 = !DILocation(line: 44, column: 25, scope: !928)
!978 = !DILocation(line: 46, column: 3, scope: !928)
!979 = !DILocation(line: 47, column: 15, scope: !928)
!980 = !DILocation(line: 47, column: 21, scope: !928)
!981 = !DILocation(line: 47, column: 31, scope: !928)
!982 = !DILocation(line: 47, column: 41, scope: !928)
!983 = !DILocation(line: 47, column: 51, scope: !928)
!984 = !DILocation(line: 47, column: 3, scope: !928)
!985 = !DILocation(line: 48, column: 3, scope: !928)
!986 = !DILocation(line: 51, column: 3, scope: !928)
!987 = !DILocation(line: 52, column: 27, scope: !928)
!988 = !DILocation(line: 52, column: 37, scope: !928)
!989 = !DILocation(line: 52, column: 47, scope: !928)
!990 = !DILocation(line: 52, column: 57, scope: !928)
!991 = !DILocation(line: 52, column: 67, scope: !928)
!992 = !DILocation(line: 52, column: 73, scope: !928)
!993 = !DILocation(line: 52, column: 3, scope: !928)
!994 = !DILocalVariable(name: "elapsed", scope: !928, file: !29, line: 55, type: !373)
!995 = !DILocation(line: 55, column: 13, scope: !928)
!996 = !DILocation(line: 55, column: 28, scope: !928)
!997 = !DILocation(line: 55, column: 43, scope: !928)
!998 = !DILocation(line: 55, column: 35, scope: !928)
!999 = !DILocation(line: 55, column: 51, scope: !928)
!1000 = !DILocation(line: 55, column: 69, scope: !928)
!1001 = !DILocation(line: 55, column: 63, scope: !928)
!1002 = !DILocation(line: 55, column: 85, scope: !928)
!1003 = !DILocation(line: 55, column: 77, scope: !928)
!1004 = !DILocation(line: 56, column: 37, scope: !928)
!1005 = !DILocation(line: 56, column: 3, scope: !928)
!1006 = !DILocation(line: 58, column: 3, scope: !928)
!1007 = !DILocation(line: 59, column: 1, scope: !928)
!1008 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_face_detect_host.cpp", scope: !29, file: !29, type: !1009, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !28, variables: !30)
!1009 = !DISubroutineType(types: !30)
!1010 = !DILocation(line: 0, scope: !1008)
