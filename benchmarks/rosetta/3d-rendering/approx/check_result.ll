; ModuleID = '../src/check_result.cpp'
source_filename = "../src/check_result.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::basic_ofstream" = type { %"class.std::basic_ostream.base", %"class.std::basic_filebuf", %"class.std::basic_ios" }
%"class.std::basic_ostream.base" = type { i32 (...)** }
%"class.std::basic_filebuf" = type { %"class.std::basic_streambuf", %union.pthread_mutex_t, %"class.std::__basic_file", i32, %struct.__mbstate_t, %struct.__mbstate_t, %struct.__mbstate_t, i8*, i64, i8, i8, i8, i8, i8*, i8*, i8, %"class.std::codecvt"*, i8*, i64, i8*, i8* }
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%"class.std::__basic_file" = type <{ %struct._IO_FILE*, i8, [7 x i8] }>
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.__mbstate_t = type { i32, %union.anon }
%union.anon = type { i32 }
%"class.std::codecvt" = type { %"class.std::__codecvt_abstract_base.base", %struct.__locale_struct* }
%"class.std::__codecvt_abstract_base.base" = type { %"class.std::locale::facet.base" }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@__dso_handle = external hidden global i8
@.str = private unnamed_addr constant [12 x i8] c"outputs.txt\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"Image After Rendering: \0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str.4 = private unnamed_addr constant [30 x i8] c"Failed to create output file!\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_check_result.cpp, i8* null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" !dbg !932 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !933
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3, !dbg !933
  ret void, !dbg !933
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: noinline optnone uwtable
define void @_Z13check_resultsPA256_h([256 x i8]* %output) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !934 {
entry:
  %output.addr = alloca [256 x i8]*, align 8
  %ofile = alloca %"class.std::basic_ofstream", align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %pix = alloca i32, align 4
  store [256 x i8]* %output, [256 x i8]** %output.addr, align 8
  call void @llvm.dbg.declare(metadata [256 x i8]** %output.addr, metadata !942, metadata !DIExpression()), !dbg !943
  call void @llvm.dbg.declare(metadata %"class.std::basic_ofstream"* %ofile, metadata !944, metadata !DIExpression()), !dbg !949
  call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev(%"class.std::basic_ofstream"* %ofile), !dbg !949
  invoke void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_ofstream"* %ofile, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 16)
          to label %invoke.cont unwind label %lpad, !dbg !950

invoke.cont:                                      ; preds = %entry
  %call = invoke zeroext i1 @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ofstream"* %ofile)
          to label %invoke.cont1 unwind label %lpad, !dbg !951

invoke.cont1:                                     ; preds = %invoke.cont
  br i1 %call, label %if.then, label %if.else18, !dbg !953

if.then:                                          ; preds = %invoke.cont1
  %0 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !954
  %call3 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %0, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i32 0, i32 0))
          to label %invoke.cont2 unwind label %lpad, !dbg !956

invoke.cont2:                                     ; preds = %if.then
  call void @llvm.dbg.declare(metadata i32* %j, metadata !957, metadata !DIExpression()), !dbg !959
  store i32 255, i32* %j, align 4, !dbg !959
  br label %for.cond, !dbg !960

for.cond:                                         ; preds = %for.inc16, %invoke.cont2
  %1 = load i32, i32* %j, align 4, !dbg !961
  %cmp = icmp sge i32 %1, 0, !dbg !963
  br i1 %cmp, label %for.body, label %for.end17, !dbg !964

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i, metadata !965, metadata !DIExpression()), !dbg !968
  store i32 0, i32* %i, align 4, !dbg !968
  br label %for.cond4, !dbg !969

for.cond4:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %i, align 4, !dbg !970
  %cmp5 = icmp slt i32 %2, 256, !dbg !972
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !973

for.body6:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata i32* %pix, metadata !974, metadata !DIExpression()), !dbg !976
  %3 = load [256 x i8]*, [256 x i8]** %output.addr, align 8, !dbg !977
  %4 = load i32, i32* %i, align 4, !dbg !978
  %idxprom = sext i32 %4 to i64, !dbg !977
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* %3, i64 %idxprom, !dbg !977
  %5 = load i32, i32* %j, align 4, !dbg !979
  %idxprom7 = sext i32 %5 to i64, !dbg !977
  %arrayidx8 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx, i64 0, i64 %idxprom7, !dbg !977
  %6 = load i8, i8* %arrayidx8, align 1, !dbg !977
  %conv = zext i8 %6 to i32, !dbg !977
  store i32 %conv, i32* %pix, align 4, !dbg !976
  %7 = load i32, i32* %pix, align 4, !dbg !980
  %tobool = icmp ne i32 %7, 0, !dbg !980
  br i1 %tobool, label %if.then9, label %if.else, !dbg !982

if.then9:                                         ; preds = %for.body6
  %8 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !983
  %call11 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
          to label %invoke.cont10 unwind label %lpad, !dbg !984

invoke.cont10:                                    ; preds = %if.then9
  br label %if.end, !dbg !983

lpad:                                             ; preds = %invoke.cont19, %if.else18, %for.end, %if.else, %if.then9, %if.then, %invoke.cont, %entry
  %9 = landingpad { i8*, i32 }
          cleanup, !dbg !985
  %10 = extractvalue { i8*, i32 } %9, 0, !dbg !985
  store i8* %10, i8** %exn.slot, align 8, !dbg !985
  %11 = extractvalue { i8*, i32 } %9, 1, !dbg !985
  store i32 %11, i32* %ehselector.slot, align 4, !dbg !985
  call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* %ofile) #3, !dbg !985
  br label %eh.resume, !dbg !985

if.else:                                          ; preds = %for.body6
  %12 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !986
  %call13 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %12, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
          to label %invoke.cont12 unwind label %lpad, !dbg !987

invoke.cont12:                                    ; preds = %if.else
  br label %if.end

if.end:                                           ; preds = %invoke.cont12, %invoke.cont10
  br label %for.inc, !dbg !988

for.inc:                                          ; preds = %if.end
  %13 = load i32, i32* %i, align 4, !dbg !989
  %inc = add nsw i32 %13, 1, !dbg !989
  store i32 %inc, i32* %i, align 4, !dbg !989
  br label %for.cond4, !dbg !990, !llvm.loop !991

for.end:                                          ; preds = %for.cond4
  %14 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !993
  %call15 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %14, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont14 unwind label %lpad, !dbg !994

invoke.cont14:                                    ; preds = %for.end
  br label %for.inc16, !dbg !995

for.inc16:                                        ; preds = %invoke.cont14
  %15 = load i32, i32* %j, align 4, !dbg !996
  %dec = add nsw i32 %15, -1, !dbg !996
  store i32 %dec, i32* %j, align 4, !dbg !996
  br label %for.cond, !dbg !997, !llvm.loop !998

for.end17:                                        ; preds = %for.cond
  br label %if.end23, !dbg !1000

if.else18:                                        ; preds = %invoke.cont1
  %call20 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.4, i32 0, i32 0))
          to label %invoke.cont19 unwind label %lpad, !dbg !1001

invoke.cont19:                                    ; preds = %if.else18
  %call22 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call20, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont21 unwind label %lpad, !dbg !1003

invoke.cont21:                                    ; preds = %invoke.cont19
  br label %if.end23

if.end23:                                         ; preds = %invoke.cont21, %for.end17
  call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* %ofile) #3, !dbg !985
  ret void, !dbg !985

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !985
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !985
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !985
  %lpad.val24 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !985
  resume { i8*, i32 } %lpad.val24, !dbg !985
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #5

declare void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev(%"class.std::basic_ofstream"*) unnamed_addr #1

declare void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_ofstream"*, i8*, i32) #1

declare i32 @__gxx_personality_v0(...)

declare zeroext i1 @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ofstream"*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"*, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* dereferenceable(272)) #1

; Function Attrs: nounwind
declare void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"*) unnamed_addr #2

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_check_result.cpp() #0 section ".text.startup" !dbg !1004 {
entry:
  call void @__cxx_global_var_init(), !dbg !1006
  ret void
}

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!28}
!llvm.module.flags = !{!927, !928, !929, !930}
!llvm.ident = !{!931}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !2, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "std", scope: null)
!3 = !DIFile(filename: "/usr/include/c++/11/iostream", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!4 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !6, file: !5, line: 626, size: 8, flags: DIFlagTypePassByReference, elements: !7, identifier: "_ZTSNSt8ios_base4InitE")
!5 = !DIFile(filename: "/usr/include/c++/11/bits/ios_base.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!6 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !2, file: !5, line: 228, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt8ios_base")
!7 = !{!8, !12, !14, !18, !19, !24}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "_S_refcount", scope: !4, file: !5, line: 639, baseType: !9, flags: DIFlagStaticMember)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Atomic_word", file: !10, line: 32, baseType: !11)
!10 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/atomic_word.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
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
!28 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !29, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !30, globals: !31, imports: !38)
!29 = !DIFile(filename: "../src/check_result.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!30 = !{}
!31 = !{!0, !32, !36}
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression(DW_OP_constu, 256, DW_OP_stack_value))
!33 = distinct !DIGlobalVariable(name: "MAX_X", scope: !28, file: !34, line: 13, type: !35, isLocal: true, isDefinition: true)
!34 = !DIFile(filename: "../src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!35 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression(DW_OP_constu, 256, DW_OP_stack_value))
!37 = distinct !DIGlobalVariable(name: "MAX_Y", scope: !28, file: !34, line: 14, type: !35, isLocal: true, isDefinition: true)
!38 = !{!39, !45, !51, !56, !60, !62, !64, !66, !68, !75, !82, !89, !93, !97, !101, !110, !114, !116, !121, !127, !131, !138, !140, !144, !148, !152, !154, !158, !162, !164, !168, !170, !172, !176, !180, !184, !188, !192, !196, !198, !210, !214, !218, !223, !225, !227, !231, !235, !236, !237, !238, !239, !240, !257, !260, !265, !272, !280, !284, !291, !295, !299, !301, !303, !307, !313, !317, !323, !329, !331, !335, !339, !343, !347, !351, !353, !357, !361, !365, !367, !371, !375, !379, !381, !383, !387, !395, !399, !403, !407, !409, !415, !417, !424, !429, !433, !437, !441, !445, !449, !451, !453, !457, !461, !465, !467, !471, !475, !477, !479, !483, !488, !493, !498, !499, !500, !501, !502, !503, !504, !505, !506, !507, !508, !563, !567, !571, !578, !582, !585, !588, !591, !593, !595, !597, !600, !603, !606, !609, !612, !614, !619, !623, !626, !629, !631, !633, !635, !637, !640, !643, !646, !649, !652, !654, !658, !662, !667, !671, !673, !675, !677, !679, !681, !683, !685, !687, !689, !691, !693, !695, !697, !701, !705, !711, !715, !720, !722, !726, !728, !732, !740, !744, !748, !752, !756, !760, !764, !768, !772, !776, !780, !784, !788, !790, !792, !796, !800, !806, !810, !814, !816, !820, !824, !830, !832, !836, !840, !844, !848, !852, !856, !860, !861, !862, !863, !865, !866, !867, !868, !869, !870, !871, !877, !880, !881, !883, !885, !887, !889, !893, !895, !897, !899, !901, !903, !905, !907, !909, !913, !917, !919, !923}
!39 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !40, file: !44, line: 98)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !41, line: 7, baseType: !42)
!41 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!42 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !43, line: 49, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!43 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!44 = !DIFile(filename: "/usr/include/c++/11/cstdio", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!45 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !46, file: !44, line: 99)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !47, line: 84, baseType: !48)
!47 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !49, line: 14, baseType: !50)
!49 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!50 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !49, line: 10, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !52, file: !44, line: 101)
!52 = !DISubprogram(name: "clearerr", scope: !47, file: !47, line: 786, type: !53, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!53 = !DISubroutineType(types: !54)
!54 = !{null, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 64)
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !57, file: !44, line: 102)
!57 = !DISubprogram(name: "fclose", scope: !47, file: !47, line: 178, type: !58, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!58 = !DISubroutineType(types: !59)
!59 = !{!11, !55}
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !61, file: !44, line: 103)
!61 = !DISubprogram(name: "feof", scope: !47, file: !47, line: 788, type: !58, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !63, file: !44, line: 104)
!63 = !DISubprogram(name: "ferror", scope: !47, file: !47, line: 790, type: !58, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !65, file: !44, line: 105)
!65 = !DISubprogram(name: "fflush", scope: !47, file: !47, line: 230, type: !58, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !67, file: !44, line: 106)
!67 = !DISubprogram(name: "fgetc", scope: !47, file: !47, line: 513, type: !58, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!68 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !69, file: !44, line: 107)
!69 = !DISubprogram(name: "fgetpos", scope: !47, file: !47, line: 760, type: !70, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!70 = !DISubroutineType(types: !71)
!71 = !{!11, !72, !73}
!72 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !55)
!73 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !74)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!75 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !76, file: !44, line: 108)
!76 = !DISubprogram(name: "fgets", scope: !47, file: !47, line: 592, type: !77, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !81, !11, !72}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !79)
!82 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !83, file: !44, line: 109)
!83 = !DISubprogram(name: "fopen", scope: !47, file: !47, line: 258, type: !84, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!84 = !DISubroutineType(types: !85)
!85 = !{!55, !86, !86}
!86 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !87)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !80)
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !90, file: !44, line: 110)
!90 = !DISubprogram(name: "fprintf", scope: !47, file: !47, line: 350, type: !91, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!91 = !DISubroutineType(types: !92)
!92 = !{!11, !72, !86, null}
!93 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !94, file: !44, line: 111)
!94 = !DISubprogram(name: "fputc", scope: !47, file: !47, line: 549, type: !95, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!95 = !DISubroutineType(types: !96)
!96 = !{!11, !11, !55}
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !98, file: !44, line: 112)
!98 = !DISubprogram(name: "fputs", scope: !47, file: !47, line: 655, type: !99, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!99 = !DISubroutineType(types: !100)
!100 = !{!11, !86, !72}
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !102, file: !44, line: 113)
!102 = !DISubprogram(name: "fread", scope: !47, file: !47, line: 675, type: !103, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!103 = !DISubroutineType(types: !104)
!104 = !{!105, !108, !105, !105, !72}
!105 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !106, line: 62, baseType: !107)
!106 = !DIFile(filename: "/home/gabriel/Documents/hls-llvm-project/hls-build/lib/clang/7.0.0/include/stddef.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!107 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!108 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !109)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !111, file: !44, line: 114)
!111 = !DISubprogram(name: "freopen", scope: !47, file: !47, line: 265, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DISubroutineType(types: !113)
!113 = !{!55, !86, !86, !72}
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !115, file: !44, line: 115)
!115 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !47, file: !47, line: 434, type: !91, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !117, file: !44, line: 116)
!117 = !DISubprogram(name: "fseek", scope: !47, file: !47, line: 713, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DISubroutineType(types: !119)
!119 = !{!11, !55, !120, !11}
!120 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !122, file: !44, line: 117)
!122 = !DISubprogram(name: "fsetpos", scope: !47, file: !47, line: 765, type: !123, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!123 = !DISubroutineType(types: !124)
!124 = !{!11, !55, !125}
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !126, size: 64)
!126 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !46)
!127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !128, file: !44, line: 118)
!128 = !DISubprogram(name: "ftell", scope: !47, file: !47, line: 718, type: !129, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!129 = !DISubroutineType(types: !130)
!130 = !{!120, !55}
!131 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !132, file: !44, line: 119)
!132 = !DISubprogram(name: "fwrite", scope: !47, file: !47, line: 681, type: !133, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!133 = !DISubroutineType(types: !134)
!134 = !{!105, !135, !105, !105, !72}
!135 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !136)
!136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !137, size: 64)
!137 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !139, file: !44, line: 120)
!139 = !DISubprogram(name: "getc", scope: !47, file: !47, line: 514, type: !58, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!140 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !141, file: !44, line: 121)
!141 = !DISubprogram(name: "getchar", scope: !47, file: !47, line: 520, type: !142, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!142 = !DISubroutineType(types: !143)
!143 = !{!11}
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !145, file: !44, line: 126)
!145 = !DISubprogram(name: "perror", scope: !47, file: !47, line: 804, type: !146, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!146 = !DISubroutineType(types: !147)
!147 = !{null, !87}
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !149, file: !44, line: 127)
!149 = !DISubprogram(name: "printf", scope: !47, file: !47, line: 356, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!150 = !DISubroutineType(types: !151)
!151 = !{!11, !86, null}
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !153, file: !44, line: 128)
!153 = !DISubprogram(name: "putc", scope: !47, file: !47, line: 550, type: !95, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !155, file: !44, line: 129)
!155 = !DISubprogram(name: "putchar", scope: !47, file: !47, line: 556, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!156 = !DISubroutineType(types: !157)
!157 = !{!11, !11}
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !159, file: !44, line: 130)
!159 = !DISubprogram(name: "puts", scope: !47, file: !47, line: 661, type: !160, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!160 = !DISubroutineType(types: !161)
!161 = !{!11, !87}
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !163, file: !44, line: 131)
!163 = !DISubprogram(name: "remove", scope: !47, file: !47, line: 152, type: !160, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !165, file: !44, line: 132)
!165 = !DISubprogram(name: "rename", scope: !47, file: !47, line: 154, type: !166, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!166 = !DISubroutineType(types: !167)
!167 = !{!11, !87, !87}
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !169, file: !44, line: 133)
!169 = !DISubprogram(name: "rewind", scope: !47, file: !47, line: 723, type: !53, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !171, file: !44, line: 134)
!171 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !47, file: !47, line: 437, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !173, file: !44, line: 135)
!173 = !DISubprogram(name: "setbuf", scope: !47, file: !47, line: 328, type: !174, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!174 = !DISubroutineType(types: !175)
!175 = !{null, !72, !81}
!176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !177, file: !44, line: 136)
!177 = !DISubprogram(name: "setvbuf", scope: !47, file: !47, line: 332, type: !178, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!178 = !DISubroutineType(types: !179)
!179 = !{!11, !72, !81, !11, !105}
!180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !181, file: !44, line: 137)
!181 = !DISubprogram(name: "sprintf", scope: !47, file: !47, line: 358, type: !182, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!182 = !DISubroutineType(types: !183)
!183 = !{!11, !81, !86, null}
!184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !185, file: !44, line: 138)
!185 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !47, file: !47, line: 439, type: !186, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!186 = !DISubroutineType(types: !187)
!187 = !{!11, !86, !86, null}
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !189, file: !44, line: 139)
!189 = !DISubprogram(name: "tmpfile", scope: !47, file: !47, line: 188, type: !190, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!190 = !DISubroutineType(types: !191)
!191 = !{!55}
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !193, file: !44, line: 141)
!193 = !DISubprogram(name: "tmpnam", scope: !47, file: !47, line: 205, type: !194, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!194 = !DISubroutineType(types: !195)
!195 = !{!79, !79}
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !197, file: !44, line: 143)
!197 = !DISubprogram(name: "ungetc", scope: !47, file: !47, line: 668, type: !95, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !199, file: !44, line: 144)
!199 = !DISubprogram(name: "vfprintf", scope: !47, file: !47, line: 365, type: !200, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!200 = !DISubroutineType(types: !201)
!201 = !{!11, !72, !86, !202}
!202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!203 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !29, size: 192, flags: DIFlagTypePassByValue, elements: !204, identifier: "_ZTS13__va_list_tag")
!204 = !{!205, !207, !208, !209}
!205 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !203, file: !29, baseType: !206, size: 32)
!206 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !203, file: !29, baseType: !206, size: 32, offset: 32)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !203, file: !29, baseType: !109, size: 64, offset: 64)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !203, file: !29, baseType: !109, size: 64, offset: 128)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !211, file: !44, line: 145)
!211 = !DISubprogram(name: "vprintf", scope: !47, file: !47, line: 371, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!212 = !DISubroutineType(types: !213)
!213 = !{!11, !86, !202}
!214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !215, file: !44, line: 146)
!215 = !DISubprogram(name: "vsprintf", scope: !47, file: !47, line: 373, type: !216, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!216 = !DISubroutineType(types: !217)
!217 = !{!11, !81, !86, !202}
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !220, file: !44, line: 175)
!219 = !DINamespace(name: "__gnu_cxx", scope: null)
!220 = !DISubprogram(name: "snprintf", scope: !47, file: !47, line: 378, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DISubroutineType(types: !222)
!222 = !{!11, !81, !105, !86, null}
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !224, file: !44, line: 176)
!224 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !47, file: !47, line: 479, type: !200, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !226, file: !44, line: 177)
!226 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !47, file: !47, line: 484, type: !212, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !228, file: !44, line: 178)
!228 = !DISubprogram(name: "vsnprintf", scope: !47, file: !47, line: 382, type: !229, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!229 = !DISubroutineType(types: !230)
!230 = !{!11, !81, !105, !86, !202}
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !232, file: !44, line: 179)
!232 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !47, file: !47, line: 487, type: !233, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DISubroutineType(types: !234)
!234 = !{!11, !86, !86, !202}
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !220, file: !44, line: 185)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !224, file: !44, line: 186)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !226, file: !44, line: 187)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !228, file: !44, line: 188)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !232, file: !44, line: 189)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !241, file: !256, line: 64)
!241 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !242, line: 6, baseType: !243)
!242 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!243 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !244, line: 21, baseType: !245)
!244 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!245 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !244, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !246, identifier: "_ZTS11__mbstate_t")
!246 = !{!247, !248}
!247 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !245, file: !244, line: 15, baseType: !11, size: 32)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !245, file: !244, line: 20, baseType: !249, size: 32, offset: 32)
!249 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !245, file: !244, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !250, identifier: "_ZTSN11__mbstate_tUt_E")
!250 = !{!251, !252}
!251 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !249, file: !244, line: 18, baseType: !206, size: 32)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !249, file: !244, line: 19, baseType: !253, size: 32)
!253 = !DICompositeType(tag: DW_TAG_array_type, baseType: !80, size: 32, elements: !254)
!254 = !{!255}
!255 = !DISubrange(count: 4)
!256 = !DIFile(filename: "/usr/include/c++/11/cwchar", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !258, file: !256, line: 141)
!258 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !259, line: 20, baseType: !206)
!259 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !261, file: !256, line: 143)
!261 = !DISubprogram(name: "btowc", scope: !262, file: !262, line: 285, type: !263, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DIFile(filename: "/usr/include/wchar.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!263 = !DISubroutineType(types: !264)
!264 = !{!258, !11}
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !266, file: !256, line: 144)
!266 = !DISubprogram(name: "fgetwc", scope: !262, file: !262, line: 744, type: !267, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!267 = !DISubroutineType(types: !268)
!268 = !{!258, !269}
!269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !270, size: 64)
!270 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !271, line: 5, baseType: !42)
!271 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!272 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !273, file: !256, line: 145)
!273 = !DISubprogram(name: "fgetws", scope: !262, file: !262, line: 773, type: !274, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!274 = !DISubroutineType(types: !275)
!275 = !{!276, !278, !11, !279}
!276 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !277, size: 64)
!277 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!278 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !276)
!279 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !269)
!280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !281, file: !256, line: 146)
!281 = !DISubprogram(name: "fputwc", scope: !262, file: !262, line: 758, type: !282, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!282 = !DISubroutineType(types: !283)
!283 = !{!258, !277, !269}
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !285, file: !256, line: 147)
!285 = !DISubprogram(name: "fputws", scope: !262, file: !262, line: 780, type: !286, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DISubroutineType(types: !287)
!287 = !{!11, !288, !279}
!288 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !289)
!289 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !290, size: 64)
!290 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !277)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !292, file: !256, line: 148)
!292 = !DISubprogram(name: "fwide", scope: !262, file: !262, line: 588, type: !293, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DISubroutineType(types: !294)
!294 = !{!11, !269, !11}
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !296, file: !256, line: 149)
!296 = !DISubprogram(name: "fwprintf", scope: !262, file: !262, line: 595, type: !297, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!297 = !DISubroutineType(types: !298)
!298 = !{!11, !279, !288, null}
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !300, file: !256, line: 150)
!300 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !262, file: !262, line: 657, type: !297, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !302, file: !256, line: 151)
!302 = !DISubprogram(name: "getwc", scope: !262, file: !262, line: 745, type: !267, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !304, file: !256, line: 152)
!304 = !DISubprogram(name: "getwchar", scope: !262, file: !262, line: 751, type: !305, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!305 = !DISubroutineType(types: !306)
!306 = !{!258}
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !308, file: !256, line: 153)
!308 = !DISubprogram(name: "mbrlen", scope: !262, file: !262, line: 308, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!309 = !DISubroutineType(types: !310)
!310 = !{!105, !86, !105, !311}
!311 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !312)
!312 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !241, size: 64)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !314, file: !256, line: 154)
!314 = !DISubprogram(name: "mbrtowc", scope: !262, file: !262, line: 297, type: !315, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!315 = !DISubroutineType(types: !316)
!316 = !{!105, !278, !86, !105, !311}
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !318, file: !256, line: 155)
!318 = !DISubprogram(name: "mbsinit", scope: !262, file: !262, line: 293, type: !319, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!319 = !DISubroutineType(types: !320)
!320 = !{!11, !321}
!321 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !322, size: 64)
!322 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !241)
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !324, file: !256, line: 156)
!324 = !DISubprogram(name: "mbsrtowcs", scope: !262, file: !262, line: 338, type: !325, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!325 = !DISubroutineType(types: !326)
!326 = !{!105, !278, !327, !105, !311}
!327 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !328)
!328 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !330, file: !256, line: 157)
!330 = !DISubprogram(name: "putwc", scope: !262, file: !262, line: 759, type: !282, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !332, file: !256, line: 158)
!332 = !DISubprogram(name: "putwchar", scope: !262, file: !262, line: 765, type: !333, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!333 = !DISubroutineType(types: !334)
!334 = !{!258, !277}
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !336, file: !256, line: 160)
!336 = !DISubprogram(name: "swprintf", scope: !262, file: !262, line: 605, type: !337, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!337 = !DISubroutineType(types: !338)
!338 = !{!11, !278, !105, !288, null}
!339 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !340, file: !256, line: 162)
!340 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !262, file: !262, line: 664, type: !341, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!341 = !DISubroutineType(types: !342)
!342 = !{!11, !288, !288, null}
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !344, file: !256, line: 163)
!344 = !DISubprogram(name: "ungetwc", scope: !262, file: !262, line: 788, type: !345, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DISubroutineType(types: !346)
!346 = !{!258, !258, !269}
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !348, file: !256, line: 164)
!348 = !DISubprogram(name: "vfwprintf", scope: !262, file: !262, line: 613, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DISubroutineType(types: !350)
!350 = !{!11, !279, !288, !202}
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !352, file: !256, line: 166)
!352 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !262, file: !262, line: 711, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !354, file: !256, line: 169)
!354 = !DISubprogram(name: "vswprintf", scope: !262, file: !262, line: 626, type: !355, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!355 = !DISubroutineType(types: !356)
!356 = !{!11, !278, !105, !288, !202}
!357 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !358, file: !256, line: 172)
!358 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !262, file: !262, line: 718, type: !359, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!359 = !DISubroutineType(types: !360)
!360 = !{!11, !288, !288, !202}
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !362, file: !256, line: 174)
!362 = !DISubprogram(name: "vwprintf", scope: !262, file: !262, line: 621, type: !363, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!363 = !DISubroutineType(types: !364)
!364 = !{!11, !288, !202}
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !366, file: !256, line: 176)
!366 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !262, file: !262, line: 715, type: !363, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !368, file: !256, line: 178)
!368 = !DISubprogram(name: "wcrtomb", scope: !262, file: !262, line: 302, type: !369, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!369 = !DISubroutineType(types: !370)
!370 = !{!105, !81, !277, !311}
!371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !372, file: !256, line: 179)
!372 = !DISubprogram(name: "wcscat", scope: !262, file: !262, line: 97, type: !373, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!373 = !DISubroutineType(types: !374)
!374 = !{!276, !278, !288}
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !376, file: !256, line: 180)
!376 = !DISubprogram(name: "wcscmp", scope: !262, file: !262, line: 106, type: !377, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!377 = !DISubroutineType(types: !378)
!378 = !{!11, !289, !289}
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !380, file: !256, line: 181)
!380 = !DISubprogram(name: "wcscoll", scope: !262, file: !262, line: 131, type: !377, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !382, file: !256, line: 182)
!382 = !DISubprogram(name: "wcscpy", scope: !262, file: !262, line: 87, type: !373, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !384, file: !256, line: 183)
!384 = !DISubprogram(name: "wcscspn", scope: !262, file: !262, line: 188, type: !385, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!385 = !DISubroutineType(types: !386)
!386 = !{!105, !289, !289}
!387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !388, file: !256, line: 184)
!388 = !DISubprogram(name: "wcsftime", scope: !262, file: !262, line: 852, type: !389, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!389 = !DISubroutineType(types: !390)
!390 = !{!105, !278, !105, !288, !391}
!391 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !392)
!392 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !393, size: 64)
!393 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !394)
!394 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !262, line: 83, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !396, file: !256, line: 185)
!396 = !DISubprogram(name: "wcslen", scope: !262, file: !262, line: 223, type: !397, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!397 = !DISubroutineType(types: !398)
!398 = !{!105, !289}
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !400, file: !256, line: 186)
!400 = !DISubprogram(name: "wcsncat", scope: !262, file: !262, line: 101, type: !401, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!401 = !DISubroutineType(types: !402)
!402 = !{!276, !278, !288, !105}
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !404, file: !256, line: 187)
!404 = !DISubprogram(name: "wcsncmp", scope: !262, file: !262, line: 109, type: !405, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!405 = !DISubroutineType(types: !406)
!406 = !{!11, !289, !289, !105}
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !408, file: !256, line: 188)
!408 = !DISubprogram(name: "wcsncpy", scope: !262, file: !262, line: 92, type: !401, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !410, file: !256, line: 189)
!410 = !DISubprogram(name: "wcsrtombs", scope: !262, file: !262, line: 344, type: !411, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!411 = !DISubroutineType(types: !412)
!412 = !{!105, !81, !413, !105, !311}
!413 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !414)
!414 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !289, size: 64)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !416, file: !256, line: 190)
!416 = !DISubprogram(name: "wcsspn", scope: !262, file: !262, line: 192, type: !385, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !418, file: !256, line: 191)
!418 = !DISubprogram(name: "wcstod", scope: !262, file: !262, line: 378, type: !419, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!419 = !DISubroutineType(types: !420)
!420 = !{!421, !288, !422}
!421 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!422 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !423)
!423 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !276, size: 64)
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !425, file: !256, line: 193)
!425 = !DISubprogram(name: "wcstof", scope: !262, file: !262, line: 383, type: !426, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!426 = !DISubroutineType(types: !427)
!427 = !{!428, !288, !422}
!428 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !430, file: !256, line: 195)
!430 = !DISubprogram(name: "wcstok", scope: !262, file: !262, line: 218, type: !431, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!431 = !DISubroutineType(types: !432)
!432 = !{!276, !278, !288, !422}
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !434, file: !256, line: 196)
!434 = !DISubprogram(name: "wcstol", scope: !262, file: !262, line: 429, type: !435, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!435 = !DISubroutineType(types: !436)
!436 = !{!120, !288, !422, !11}
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !438, file: !256, line: 197)
!438 = !DISubprogram(name: "wcstoul", scope: !262, file: !262, line: 434, type: !439, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!439 = !DISubroutineType(types: !440)
!440 = !{!107, !288, !422, !11}
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !442, file: !256, line: 198)
!442 = !DISubprogram(name: "wcsxfrm", scope: !262, file: !262, line: 135, type: !443, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!443 = !DISubroutineType(types: !444)
!444 = !{!105, !278, !288, !105}
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !446, file: !256, line: 199)
!446 = !DISubprogram(name: "wctob", scope: !262, file: !262, line: 289, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DISubroutineType(types: !448)
!448 = !{!11, !258}
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !450, file: !256, line: 200)
!450 = !DISubprogram(name: "wmemcmp", scope: !262, file: !262, line: 259, type: !405, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !452, file: !256, line: 201)
!452 = !DISubprogram(name: "wmemcpy", scope: !262, file: !262, line: 263, type: !401, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !454, file: !256, line: 202)
!454 = !DISubprogram(name: "wmemmove", scope: !262, file: !262, line: 268, type: !455, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!455 = !DISubroutineType(types: !456)
!456 = !{!276, !276, !289, !105}
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !458, file: !256, line: 203)
!458 = !DISubprogram(name: "wmemset", scope: !262, file: !262, line: 272, type: !459, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!459 = !DISubroutineType(types: !460)
!460 = !{!276, !276, !277, !105}
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !462, file: !256, line: 204)
!462 = !DISubprogram(name: "wprintf", scope: !262, file: !262, line: 602, type: !463, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!463 = !DISubroutineType(types: !464)
!464 = !{!11, !288, null}
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !466, file: !256, line: 205)
!466 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !262, file: !262, line: 661, type: !463, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!467 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !468, file: !256, line: 206)
!468 = !DISubprogram(name: "wcschr", scope: !262, file: !262, line: 165, type: !469, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!469 = !DISubroutineType(types: !470)
!470 = !{!276, !289, !277}
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !472, file: !256, line: 207)
!472 = !DISubprogram(name: "wcspbrk", scope: !262, file: !262, line: 202, type: !473, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!473 = !DISubroutineType(types: !474)
!474 = !{!276, !289, !289}
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !476, file: !256, line: 208)
!476 = !DISubprogram(name: "wcsrchr", scope: !262, file: !262, line: 175, type: !469, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !478, file: !256, line: 209)
!478 = !DISubprogram(name: "wcsstr", scope: !262, file: !262, line: 213, type: !473, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !480, file: !256, line: 210)
!480 = !DISubprogram(name: "wmemchr", scope: !262, file: !262, line: 254, type: !481, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!481 = !DISubroutineType(types: !482)
!482 = !{!276, !289, !277, !105}
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !484, file: !256, line: 251)
!484 = !DISubprogram(name: "wcstold", scope: !262, file: !262, line: 385, type: !485, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!485 = !DISubroutineType(types: !486)
!486 = !{!487, !288, !422}
!487 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !489, file: !256, line: 260)
!489 = !DISubprogram(name: "wcstoll", scope: !262, file: !262, line: 442, type: !490, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!490 = !DISubroutineType(types: !491)
!491 = !{!492, !288, !422, !11}
!492 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !494, file: !256, line: 261)
!494 = !DISubprogram(name: "wcstoull", scope: !262, file: !262, line: 449, type: !495, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!495 = !DISubroutineType(types: !496)
!496 = !{!497, !288, !422, !11}
!497 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !484, file: !256, line: 267)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !489, file: !256, line: 268)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !494, file: !256, line: 269)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !425, file: !256, line: 283)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !352, file: !256, line: 286)
!503 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !358, file: !256, line: 289)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !366, file: !256, line: 292)
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !484, file: !256, line: 296)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !489, file: !256, line: 297)
!507 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !494, file: !256, line: 298)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !509, file: !510, line: 68)
!509 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !511, file: !510, line: 90, size: 64, flags: DIFlagTypePassByReference, elements: !512, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!510 = !DIFile(filename: "/usr/include/c++/11/bits/exception_ptr.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!511 = !DINamespace(name: "__exception_ptr", scope: !2)
!512 = !{!513, !514, !518, !521, !522, !527, !528, !532, !538, !542, !546, !549, !550, !553, !556}
!513 = !DIDerivedType(tag: DW_TAG_member, name: "_M_exception_object", scope: !509, file: !510, line: 92, baseType: !109, size: 64)
!514 = !DISubprogram(name: "exception_ptr", scope: !509, file: !510, line: 94, type: !515, isLocal: false, isDefinition: false, scopeLine: 94, flags: DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!515 = !DISubroutineType(types: !516)
!516 = !{null, !517, !109}
!517 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !509, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!518 = !DISubprogram(name: "_M_addref", linkageName: "_ZNSt15__exception_ptr13exception_ptr9_M_addrefEv", scope: !509, file: !510, line: 96, type: !519, isLocal: false, isDefinition: false, scopeLine: 96, flags: DIFlagPrototyped, isOptimized: false)
!519 = !DISubroutineType(types: !520)
!520 = !{null, !517}
!521 = !DISubprogram(name: "_M_release", linkageName: "_ZNSt15__exception_ptr13exception_ptr10_M_releaseEv", scope: !509, file: !510, line: 97, type: !519, isLocal: false, isDefinition: false, scopeLine: 97, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DISubprogram(name: "_M_get", linkageName: "_ZNKSt15__exception_ptr13exception_ptr6_M_getEv", scope: !509, file: !510, line: 99, type: !523, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPrototyped, isOptimized: false)
!523 = !DISubroutineType(types: !524)
!524 = !{!109, !525}
!525 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !526, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!526 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !509)
!527 = !DISubprogram(name: "exception_ptr", scope: !509, file: !510, line: 107, type: !519, isLocal: false, isDefinition: false, scopeLine: 107, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!528 = !DISubprogram(name: "exception_ptr", scope: !509, file: !510, line: 109, type: !529, isLocal: false, isDefinition: false, scopeLine: 109, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!529 = !DISubroutineType(types: !530)
!530 = !{null, !517, !531}
!531 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !526, size: 64)
!532 = !DISubprogram(name: "exception_ptr", scope: !509, file: !510, line: 112, type: !533, isLocal: false, isDefinition: false, scopeLine: 112, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!533 = !DISubroutineType(types: !534)
!534 = !{null, !517, !535}
!535 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !2, file: !536, line: 302, baseType: !537)
!536 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/c++config.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!537 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!538 = !DISubprogram(name: "exception_ptr", scope: !509, file: !510, line: 116, type: !539, isLocal: false, isDefinition: false, scopeLine: 116, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!539 = !DISubroutineType(types: !540)
!540 = !{null, !517, !541}
!541 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !509, size: 64)
!542 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSERKS0_", scope: !509, file: !510, line: 129, type: !543, isLocal: false, isDefinition: false, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!543 = !DISubroutineType(types: !544)
!544 = !{!545, !517, !531}
!545 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !509, size: 64)
!546 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSEOS0_", scope: !509, file: !510, line: 133, type: !547, isLocal: false, isDefinition: false, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!547 = !DISubroutineType(types: !548)
!548 = !{!545, !517, !541}
!549 = !DISubprogram(name: "~exception_ptr", scope: !509, file: !510, line: 140, type: !519, isLocal: false, isDefinition: false, scopeLine: 140, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!550 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr13exception_ptr4swapERS0_", scope: !509, file: !510, line: 143, type: !551, isLocal: false, isDefinition: false, scopeLine: 143, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!551 = !DISubroutineType(types: !552)
!552 = !{null, !517, !545}
!553 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt15__exception_ptr13exception_ptrcvbEv", scope: !509, file: !510, line: 155, type: !554, isLocal: false, isDefinition: false, scopeLine: 155, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!554 = !DISubroutineType(types: !555)
!555 = !{!13, !525}
!556 = !DISubprogram(name: "__cxa_exception_type", linkageName: "_ZNKSt15__exception_ptr13exception_ptr20__cxa_exception_typeEv", scope: !509, file: !510, line: 176, type: !557, isLocal: false, isDefinition: false, scopeLine: 176, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!557 = !DISubroutineType(types: !558)
!558 = !{!559, !525}
!559 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !560, size: 64)
!560 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !561)
!561 = !DICompositeType(tag: DW_TAG_class_type, name: "type_info", scope: !2, file: !562, line: 88, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt9type_info")
!562 = !DIFile(filename: "/usr/include/c++/11/typeinfo", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !511, entity: !564, file: !510, line: 84)
!564 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !2, file: !510, line: 80, type: !565, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!565 = !DISubroutineType(types: !566)
!566 = !{null, !509}
!567 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !568, entity: !569, file: !570, line: 58)
!568 = !DINamespace(name: "__gnu_debug", scope: null)
!569 = !DINamespace(name: "__debug", scope: !2)
!570 = !DIFile(filename: "/usr/include/c++/11/debug/debug.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !572, file: !577, line: 47)
!572 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !573, line: 24, baseType: !574)
!573 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!574 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !575, line: 37, baseType: !576)
!575 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!576 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!577 = !DIFile(filename: "/usr/include/c++/11/cstdint", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !579, file: !577, line: 48)
!579 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !573, line: 25, baseType: !580)
!580 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !575, line: 39, baseType: !581)
!581 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !583, file: !577, line: 49)
!583 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !573, line: 26, baseType: !584)
!584 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !575, line: 41, baseType: !11)
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !586, file: !577, line: 50)
!586 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !573, line: 27, baseType: !587)
!587 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !575, line: 44, baseType: !120)
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !589, file: !577, line: 52)
!589 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !590, line: 58, baseType: !576)
!590 = !DIFile(filename: "/usr/include/stdint.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !592, file: !577, line: 53)
!592 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !590, line: 60, baseType: !120)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !594, file: !577, line: 54)
!594 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !590, line: 61, baseType: !120)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !596, file: !577, line: 55)
!596 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !590, line: 62, baseType: !120)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !598, file: !577, line: 57)
!598 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !590, line: 43, baseType: !599)
!599 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !575, line: 52, baseType: !574)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !601, file: !577, line: 58)
!601 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !590, line: 44, baseType: !602)
!602 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !575, line: 54, baseType: !580)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !604, file: !577, line: 59)
!604 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !590, line: 45, baseType: !605)
!605 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !575, line: 56, baseType: !584)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !607, file: !577, line: 60)
!607 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !590, line: 46, baseType: !608)
!608 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !575, line: 58, baseType: !587)
!609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !610, file: !577, line: 62)
!610 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !590, line: 101, baseType: !611)
!611 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !575, line: 72, baseType: !120)
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !613, file: !577, line: 63)
!613 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !590, line: 87, baseType: !120)
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !615, file: !577, line: 65)
!615 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !616, line: 24, baseType: !617)
!616 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!617 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !575, line: 38, baseType: !618)
!618 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !620, file: !577, line: 66)
!620 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !616, line: 25, baseType: !621)
!621 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !575, line: 40, baseType: !622)
!622 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !624, file: !577, line: 67)
!624 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !616, line: 26, baseType: !625)
!625 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !575, line: 42, baseType: !206)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !627, file: !577, line: 68)
!627 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !616, line: 27, baseType: !628)
!628 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !575, line: 45, baseType: !107)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !630, file: !577, line: 70)
!630 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !590, line: 71, baseType: !618)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !632, file: !577, line: 71)
!632 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !590, line: 73, baseType: !107)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !634, file: !577, line: 72)
!634 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !590, line: 74, baseType: !107)
!635 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !636, file: !577, line: 73)
!636 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !590, line: 75, baseType: !107)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !638, file: !577, line: 75)
!638 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !590, line: 49, baseType: !639)
!639 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !575, line: 53, baseType: !617)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !641, file: !577, line: 76)
!641 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !590, line: 50, baseType: !642)
!642 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !575, line: 55, baseType: !621)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !644, file: !577, line: 77)
!644 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !590, line: 51, baseType: !645)
!645 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !575, line: 57, baseType: !625)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !647, file: !577, line: 78)
!647 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !590, line: 52, baseType: !648)
!648 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !575, line: 59, baseType: !628)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !650, file: !577, line: 80)
!650 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !590, line: 102, baseType: !651)
!651 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !575, line: 73, baseType: !107)
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !653, file: !577, line: 81)
!653 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !590, line: 90, baseType: !107)
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !655, file: !657, line: 53)
!655 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !656, line: 51, size: 768, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!656 = !DIFile(filename: "/usr/include/locale.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!657 = !DIFile(filename: "/usr/include/c++/11/clocale", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !659, file: !657, line: 54)
!659 = !DISubprogram(name: "setlocale", scope: !656, file: !656, line: 122, type: !660, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!660 = !DISubroutineType(types: !661)
!661 = !{!79, !11, !87}
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !663, file: !657, line: 55)
!663 = !DISubprogram(name: "localeconv", scope: !656, file: !656, line: 125, type: !664, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!664 = !DISubroutineType(types: !665)
!665 = !{!666}
!666 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !655, size: 64)
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !668, file: !670, line: 64)
!668 = !DISubprogram(name: "isalnum", scope: !669, file: !669, line: 108, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!669 = !DIFile(filename: "/usr/include/ctype.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!670 = !DIFile(filename: "/usr/include/c++/11/cctype", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !672, file: !670, line: 65)
!672 = !DISubprogram(name: "isalpha", scope: !669, file: !669, line: 109, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !674, file: !670, line: 66)
!674 = !DISubprogram(name: "iscntrl", scope: !669, file: !669, line: 110, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !676, file: !670, line: 67)
!676 = !DISubprogram(name: "isdigit", scope: !669, file: !669, line: 111, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !678, file: !670, line: 68)
!678 = !DISubprogram(name: "isgraph", scope: !669, file: !669, line: 113, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !680, file: !670, line: 69)
!680 = !DISubprogram(name: "islower", scope: !669, file: !669, line: 112, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !682, file: !670, line: 70)
!682 = !DISubprogram(name: "isprint", scope: !669, file: !669, line: 114, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !684, file: !670, line: 71)
!684 = !DISubprogram(name: "ispunct", scope: !669, file: !669, line: 115, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !686, file: !670, line: 72)
!686 = !DISubprogram(name: "isspace", scope: !669, file: !669, line: 116, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !688, file: !670, line: 73)
!688 = !DISubprogram(name: "isupper", scope: !669, file: !669, line: 117, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !690, file: !670, line: 74)
!690 = !DISubprogram(name: "isxdigit", scope: !669, file: !669, line: 118, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !692, file: !670, line: 75)
!692 = !DISubprogram(name: "tolower", scope: !669, file: !669, line: 122, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !694, file: !670, line: 76)
!694 = !DISubprogram(name: "toupper", scope: !669, file: !669, line: 125, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !696, file: !670, line: 87)
!696 = !DISubprogram(name: "isblank", scope: !669, file: !669, line: 130, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !698, file: !700, line: 52)
!698 = !DISubprogram(name: "abs", scope: !699, file: !699, line: 848, type: !156, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!699 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!700 = !DIFile(filename: "/usr/include/c++/11/bits/std_abs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !702, file: !704, line: 127)
!702 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !699, line: 63, baseType: !703)
!703 = !DICompositeType(tag: DW_TAG_structure_type, file: !699, line: 59, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!704 = !DIFile(filename: "/usr/include/c++/11/cstdlib", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !706, file: !704, line: 128)
!706 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !699, line: 71, baseType: !707)
!707 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !699, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !708, identifier: "_ZTS6ldiv_t")
!708 = !{!709, !710}
!709 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !707, file: !699, line: 69, baseType: !120, size: 64)
!710 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !707, file: !699, line: 70, baseType: !120, size: 64, offset: 64)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !712, file: !704, line: 130)
!712 = !DISubprogram(name: "abort", scope: !699, file: !699, line: 598, type: !713, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!713 = !DISubroutineType(types: !714)
!714 = !{null}
!715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !716, file: !704, line: 134)
!716 = !DISubprogram(name: "atexit", scope: !699, file: !699, line: 602, type: !717, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!717 = !DISubroutineType(types: !718)
!718 = !{!11, !719}
!719 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !713, size: 64)
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !721, file: !704, line: 137)
!721 = !DISubprogram(name: "at_quick_exit", scope: !699, file: !699, line: 607, type: !717, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !723, file: !704, line: 140)
!723 = !DISubprogram(name: "atof", scope: !699, file: !699, line: 102, type: !724, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!724 = !DISubroutineType(types: !725)
!725 = !{!421, !87}
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !727, file: !704, line: 141)
!727 = !DISubprogram(name: "atoi", scope: !699, file: !699, line: 105, type: !160, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !729, file: !704, line: 142)
!729 = !DISubprogram(name: "atol", scope: !699, file: !699, line: 108, type: !730, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!730 = !DISubroutineType(types: !731)
!731 = !{!120, !87}
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !733, file: !704, line: 143)
!733 = !DISubprogram(name: "bsearch", scope: !699, file: !699, line: 828, type: !734, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!734 = !DISubroutineType(types: !735)
!735 = !{!109, !136, !136, !105, !105, !736}
!736 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !699, line: 816, baseType: !737)
!737 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !738, size: 64)
!738 = !DISubroutineType(types: !739)
!739 = !{!11, !136, !136}
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !741, file: !704, line: 144)
!741 = !DISubprogram(name: "calloc", scope: !699, file: !699, line: 543, type: !742, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!742 = !DISubroutineType(types: !743)
!743 = !{!109, !105, !105}
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !745, file: !704, line: 145)
!745 = !DISubprogram(name: "div", scope: !699, file: !699, line: 860, type: !746, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!746 = !DISubroutineType(types: !747)
!747 = !{!702, !11, !11}
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !749, file: !704, line: 146)
!749 = !DISubprogram(name: "exit", scope: !699, file: !699, line: 624, type: !750, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!750 = !DISubroutineType(types: !751)
!751 = !{null, !11}
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !753, file: !704, line: 147)
!753 = !DISubprogram(name: "free", scope: !699, file: !699, line: 555, type: !754, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!754 = !DISubroutineType(types: !755)
!755 = !{null, !109}
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !757, file: !704, line: 148)
!757 = !DISubprogram(name: "getenv", scope: !699, file: !699, line: 641, type: !758, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!758 = !DISubroutineType(types: !759)
!759 = !{!79, !87}
!760 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !761, file: !704, line: 149)
!761 = !DISubprogram(name: "labs", scope: !699, file: !699, line: 849, type: !762, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!762 = !DISubroutineType(types: !763)
!763 = !{!120, !120}
!764 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !765, file: !704, line: 150)
!765 = !DISubprogram(name: "ldiv", scope: !699, file: !699, line: 862, type: !766, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!766 = !DISubroutineType(types: !767)
!767 = !{!706, !120, !120}
!768 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !769, file: !704, line: 151)
!769 = !DISubprogram(name: "malloc", scope: !699, file: !699, line: 540, type: !770, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!770 = !DISubroutineType(types: !771)
!771 = !{!109, !105}
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !773, file: !704, line: 153)
!773 = !DISubprogram(name: "mblen", scope: !699, file: !699, line: 930, type: !774, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!774 = !DISubroutineType(types: !775)
!775 = !{!11, !87, !105}
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !777, file: !704, line: 154)
!777 = !DISubprogram(name: "mbstowcs", scope: !699, file: !699, line: 941, type: !778, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!778 = !DISubroutineType(types: !779)
!779 = !{!105, !278, !86, !105}
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !781, file: !704, line: 155)
!781 = !DISubprogram(name: "mbtowc", scope: !699, file: !699, line: 933, type: !782, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!782 = !DISubroutineType(types: !783)
!783 = !{!11, !278, !86, !105}
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !785, file: !704, line: 157)
!785 = !DISubprogram(name: "qsort", scope: !699, file: !699, line: 838, type: !786, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!786 = !DISubroutineType(types: !787)
!787 = !{null, !109, !105, !105, !736}
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !789, file: !704, line: 160)
!789 = !DISubprogram(name: "quick_exit", scope: !699, file: !699, line: 630, type: !750, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !791, file: !704, line: 163)
!791 = !DISubprogram(name: "rand", scope: !699, file: !699, line: 454, type: !142, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !793, file: !704, line: 164)
!793 = !DISubprogram(name: "realloc", scope: !699, file: !699, line: 551, type: !794, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!794 = !DISubroutineType(types: !795)
!795 = !{!109, !109, !105}
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !797, file: !704, line: 165)
!797 = !DISubprogram(name: "srand", scope: !699, file: !699, line: 456, type: !798, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!798 = !DISubroutineType(types: !799)
!799 = !{null, !206}
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !801, file: !704, line: 166)
!801 = !DISubprogram(name: "strtod", scope: !699, file: !699, line: 118, type: !802, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!802 = !DISubroutineType(types: !803)
!803 = !{!421, !86, !804}
!804 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !805)
!805 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !807, file: !704, line: 167)
!807 = !DISubprogram(name: "strtol", scope: !699, file: !699, line: 177, type: !808, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!808 = !DISubroutineType(types: !809)
!809 = !{!120, !86, !804, !11}
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !811, file: !704, line: 168)
!811 = !DISubprogram(name: "strtoul", scope: !699, file: !699, line: 181, type: !812, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!812 = !DISubroutineType(types: !813)
!813 = !{!107, !86, !804, !11}
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !815, file: !704, line: 169)
!815 = !DISubprogram(name: "system", scope: !699, file: !699, line: 791, type: !160, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !817, file: !704, line: 171)
!817 = !DISubprogram(name: "wcstombs", scope: !699, file: !699, line: 945, type: !818, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!818 = !DISubroutineType(types: !819)
!819 = !{!105, !81, !288, !105}
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !821, file: !704, line: 172)
!821 = !DISubprogram(name: "wctomb", scope: !699, file: !699, line: 937, type: !822, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!822 = !DISubroutineType(types: !823)
!823 = !{!11, !79, !277}
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !825, file: !704, line: 200)
!825 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !699, line: 81, baseType: !826)
!826 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !699, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !827, identifier: "_ZTS7lldiv_t")
!827 = !{!828, !829}
!828 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !826, file: !699, line: 79, baseType: !492, size: 64)
!829 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !826, file: !699, line: 80, baseType: !492, size: 64, offset: 64)
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !831, file: !704, line: 206)
!831 = !DISubprogram(name: "_Exit", scope: !699, file: !699, line: 636, type: !750, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !833, file: !704, line: 210)
!833 = !DISubprogram(name: "llabs", scope: !699, file: !699, line: 852, type: !834, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!834 = !DISubroutineType(types: !835)
!835 = !{!492, !492}
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !837, file: !704, line: 216)
!837 = !DISubprogram(name: "lldiv", scope: !699, file: !699, line: 866, type: !838, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!838 = !DISubroutineType(types: !839)
!839 = !{!825, !492, !492}
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !841, file: !704, line: 227)
!841 = !DISubprogram(name: "atoll", scope: !699, file: !699, line: 113, type: !842, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!842 = !DISubroutineType(types: !843)
!843 = !{!492, !87}
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !845, file: !704, line: 228)
!845 = !DISubprogram(name: "strtoll", scope: !699, file: !699, line: 201, type: !846, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!846 = !DISubroutineType(types: !847)
!847 = !{!492, !86, !804, !11}
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !849, file: !704, line: 229)
!849 = !DISubprogram(name: "strtoull", scope: !699, file: !699, line: 206, type: !850, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!850 = !DISubroutineType(types: !851)
!851 = !{!497, !86, !804, !11}
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !853, file: !704, line: 231)
!853 = !DISubprogram(name: "strtof", scope: !699, file: !699, line: 124, type: !854, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!854 = !DISubroutineType(types: !855)
!855 = !{!428, !86, !804}
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !219, entity: !857, file: !704, line: 232)
!857 = !DISubprogram(name: "strtold", scope: !699, file: !699, line: 127, type: !858, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!858 = !DISubroutineType(types: !859)
!859 = !{!487, !86, !804}
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !825, file: !704, line: 240)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !831, file: !704, line: 242)
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !833, file: !704, line: 244)
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !864, file: !704, line: 245)
!864 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !219, file: !704, line: 213, type: !838, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !837, file: !704, line: 246)
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !841, file: !704, line: 248)
!867 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !853, file: !704, line: 249)
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !845, file: !704, line: 250)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !849, file: !704, line: 251)
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !857, file: !704, line: 252)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !872, file: !876, line: 82)
!872 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !873, line: 48, baseType: !874)
!873 = !DIFile(filename: "/usr/include/wctype.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!874 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !875, size: 64)
!875 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !584)
!876 = !DIFile(filename: "/usr/include/c++/11/cwctype", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !878, file: !876, line: 83)
!878 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !879, line: 38, baseType: !107)
!879 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!880 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !258, file: !876, line: 84)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !882, file: !876, line: 86)
!882 = !DISubprogram(name: "iswalnum", scope: !879, file: !879, line: 95, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !884, file: !876, line: 87)
!884 = !DISubprogram(name: "iswalpha", scope: !879, file: !879, line: 101, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !886, file: !876, line: 89)
!886 = !DISubprogram(name: "iswblank", scope: !879, file: !879, line: 146, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !888, file: !876, line: 91)
!888 = !DISubprogram(name: "iswcntrl", scope: !879, file: !879, line: 104, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !890, file: !876, line: 92)
!890 = !DISubprogram(name: "iswctype", scope: !879, file: !879, line: 159, type: !891, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!891 = !DISubroutineType(types: !892)
!892 = !{!11, !258, !878}
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !894, file: !876, line: 93)
!894 = !DISubprogram(name: "iswdigit", scope: !879, file: !879, line: 108, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !896, file: !876, line: 94)
!896 = !DISubprogram(name: "iswgraph", scope: !879, file: !879, line: 112, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !898, file: !876, line: 95)
!898 = !DISubprogram(name: "iswlower", scope: !879, file: !879, line: 117, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !900, file: !876, line: 96)
!900 = !DISubprogram(name: "iswprint", scope: !879, file: !879, line: 120, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !902, file: !876, line: 97)
!902 = !DISubprogram(name: "iswpunct", scope: !879, file: !879, line: 125, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !904, file: !876, line: 98)
!904 = !DISubprogram(name: "iswspace", scope: !879, file: !879, line: 130, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !906, file: !876, line: 99)
!906 = !DISubprogram(name: "iswupper", scope: !879, file: !879, line: 135, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !908, file: !876, line: 100)
!908 = !DISubprogram(name: "iswxdigit", scope: !879, file: !879, line: 140, type: !447, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !910, file: !876, line: 101)
!910 = !DISubprogram(name: "towctrans", scope: !873, file: !873, line: 55, type: !911, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!911 = !DISubroutineType(types: !912)
!912 = !{!258, !258, !872}
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !914, file: !876, line: 102)
!914 = !DISubprogram(name: "towlower", scope: !879, file: !879, line: 166, type: !915, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!915 = !DISubroutineType(types: !916)
!916 = !{!258, !258}
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !918, file: !876, line: 103)
!918 = !DISubprogram(name: "towupper", scope: !879, file: !879, line: 169, type: !915, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !920, file: !876, line: 104)
!920 = !DISubprogram(name: "wctrans", scope: !873, file: !873, line: 52, type: !921, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!921 = !DISubroutineType(types: !922)
!922 = !{!872, !87}
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !924, file: !876, line: 105)
!924 = !DISubprogram(name: "wctype", scope: !879, file: !879, line: 155, type: !925, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!925 = !DISubroutineType(types: !926)
!926 = !{!878, !87}
!927 = !{i32 2, !"Dwarf Version", i32 4}
!928 = !{i32 2, !"Debug Info Version", i32 3}
!929 = !{i32 1, !"wchar_size", i32 4}
!930 = !{i32 7, !"PIC Level", i32 2}
!931 = !{!"clang version 7.0.0 "}
!932 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !3, file: !3, line: 74, type: !713, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!933 = !DILocation(line: 74, column: 25, scope: !932)
!934 = distinct !DISubprogram(name: "check_results", linkageName: "_Z13check_resultsPA256_h", scope: !29, file: !29, line: 16, type: !935, isLocal: false, isDefinition: true, scopeLine: 17, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!935 = !DISubroutineType(types: !936)
!936 = !{null, !937}
!937 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !938, size: 64)
!938 = !DICompositeType(tag: DW_TAG_array_type, baseType: !939, size: 2048, elements: !940)
!939 = !DIDerivedType(tag: DW_TAG_typedef, name: "bit8", file: !34, line: 19, baseType: !618)
!940 = !{!941}
!941 = !DISubrange(count: 256)
!942 = !DILocalVariable(name: "output", arg: 1, scope: !934, file: !29, line: 16, type: !937)
!943 = !DILocation(line: 16, column: 25, scope: !934)
!944 = !DILocalVariable(name: "ofile", scope: !934, file: !29, line: 19, type: !945)
!945 = !DIDerivedType(tag: DW_TAG_typedef, name: "ofstream", scope: !2, file: !946, line: 165, baseType: !947)
!946 = !DIFile(filename: "/usr/include/c++/11/iosfwd", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!947 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ofstream<char, std::char_traits<char> >", scope: !2, file: !948, line: 1088, size: 4096, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt14basic_ofstreamIcSt11char_traitsIcEE")
!948 = !DIFile(filename: "/usr/include/c++/11/bits/fstream.tcc", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!949 = !DILocation(line: 19, column: 17, scope: !934)
!950 = !DILocation(line: 20, column: 9, scope: !934)
!951 = !DILocation(line: 21, column: 13, scope: !952)
!952 = distinct !DILexicalBlock(scope: !934, file: !29, line: 21, column: 7)
!953 = !DILocation(line: 21, column: 7, scope: !934)
!954 = !DILocation(line: 23, column: 5, scope: !955)
!955 = distinct !DILexicalBlock(scope: !952, file: !29, line: 22, column: 3)
!956 = !DILocation(line: 23, column: 11, scope: !955)
!957 = !DILocalVariable(name: "j", scope: !958, file: !29, line: 24, type: !11)
!958 = distinct !DILexicalBlock(scope: !955, file: !29, line: 24, column: 5)
!959 = !DILocation(line: 24, column: 14, scope: !958)
!960 = !DILocation(line: 24, column: 10, scope: !958)
!961 = !DILocation(line: 24, column: 29, scope: !962)
!962 = distinct !DILexicalBlock(scope: !958, file: !29, line: 24, column: 5)
!963 = !DILocation(line: 24, column: 31, scope: !962)
!964 = !DILocation(line: 24, column: 5, scope: !958)
!965 = !DILocalVariable(name: "i", scope: !966, file: !29, line: 26, type: !11)
!966 = distinct !DILexicalBlock(scope: !967, file: !29, line: 26, column: 7)
!967 = distinct !DILexicalBlock(scope: !962, file: !29, line: 25, column: 5)
!968 = !DILocation(line: 26, column: 16, scope: !966)
!969 = !DILocation(line: 26, column: 12, scope: !966)
!970 = !DILocation(line: 26, column: 23, scope: !971)
!971 = distinct !DILexicalBlock(scope: !966, file: !29, line: 26, column: 7)
!972 = !DILocation(line: 26, column: 25, scope: !971)
!973 = !DILocation(line: 26, column: 7, scope: !966)
!974 = !DILocalVariable(name: "pix", scope: !975, file: !29, line: 28, type: !11)
!975 = distinct !DILexicalBlock(scope: !971, file: !29, line: 27, column: 7)
!976 = !DILocation(line: 28, column: 13, scope: !975)
!977 = !DILocation(line: 28, column: 19, scope: !975)
!978 = !DILocation(line: 28, column: 26, scope: !975)
!979 = !DILocation(line: 28, column: 29, scope: !975)
!980 = !DILocation(line: 29, column: 13, scope: !981)
!981 = distinct !DILexicalBlock(scope: !975, file: !29, line: 29, column: 13)
!982 = !DILocation(line: 29, column: 13, scope: !975)
!983 = !DILocation(line: 30, column: 11, scope: !981)
!984 = !DILocation(line: 30, column: 17, scope: !981)
!985 = !DILocation(line: 41, column: 1, scope: !934)
!986 = !DILocation(line: 32, column: 11, scope: !981)
!987 = !DILocation(line: 32, column: 17, scope: !981)
!988 = !DILocation(line: 33, column: 7, scope: !975)
!989 = !DILocation(line: 26, column: 36, scope: !971)
!990 = !DILocation(line: 26, column: 7, scope: !971)
!991 = distinct !{!991, !973, !992}
!992 = !DILocation(line: 33, column: 7, scope: !966)
!993 = !DILocation(line: 34, column: 7, scope: !967)
!994 = !DILocation(line: 34, column: 13, scope: !967)
!995 = !DILocation(line: 35, column: 5, scope: !967)
!996 = !DILocation(line: 24, column: 39, scope: !962)
!997 = !DILocation(line: 24, column: 5, scope: !962)
!998 = distinct !{!998, !964, !999}
!999 = !DILocation(line: 35, column: 5, scope: !958)
!1000 = !DILocation(line: 36, column: 3, scope: !955)
!1001 = !DILocation(line: 39, column: 15, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !952, file: !29, line: 38, column: 3)
!1003 = !DILocation(line: 39, column: 50, scope: !1002)
!1004 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_check_result.cpp", scope: !29, file: !29, type: !1005, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !28, variables: !30)
!1005 = !DISubroutineType(types: !30)
!1006 = !DILocation(line: 0, scope: !1004)
