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
@.str.1 = private unnamed_addr constant [6 x i8] c"Test \00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c": expected = \00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c", result = \00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"\0A\09 \00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c" / \00", align 1
@.str.6 = private unnamed_addr constant [10 x i8] c" correct!\00", align 1
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str.7 = private unnamed_addr constant [30 x i8] c"Failed to create output file!\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_check_result.cpp, i8* null }]

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

; Function Attrs: noinline optnone uwtable
define void @_Z13check_resultsPhPKhi(i8* %result, i8* %expected, i32 %cnt) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !928 {
entry:
  %result.addr = alloca i8*, align 8
  %expected.addr = alloca i8*, align 8
  %cnt.addr = alloca i32, align 4
  %correct_cnt = alloca i32, align 4
  %ofile = alloca %"class.std::basic_ofstream", align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %i = alloca i32, align 4
  store i8* %result, i8** %result.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %result.addr, metadata !936, metadata !DIExpression()), !dbg !937
  store i8* %expected, i8** %expected.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %expected.addr, metadata !938, metadata !DIExpression()), !dbg !939
  store i32 %cnt, i32* %cnt.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %cnt.addr, metadata !940, metadata !DIExpression()), !dbg !941
  call void @llvm.dbg.declare(metadata i32* %correct_cnt, metadata !942, metadata !DIExpression()), !dbg !943
  store i32 0, i32* %correct_cnt, align 4, !dbg !943
  call void @llvm.dbg.declare(metadata %"class.std::basic_ofstream"* %ofile, metadata !944, metadata !DIExpression()), !dbg !949
  call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev(%"class.std::basic_ofstream"* %ofile), !dbg !949
  invoke void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_ofstream"* %ofile, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 16)
          to label %invoke.cont unwind label %lpad, !dbg !950

invoke.cont:                                      ; preds = %entry
  %call = invoke zeroext i1 @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ofstream"* %ofile)
          to label %invoke.cont1 unwind label %lpad, !dbg !951

invoke.cont1:                                     ; preds = %invoke.cont
  br i1 %call, label %if.then, label %if.else41, !dbg !953

if.then:                                          ; preds = %invoke.cont1
  call void @llvm.dbg.declare(metadata i32* %i, metadata !954, metadata !DIExpression()), !dbg !957
  store i32 0, i32* %i, align 4, !dbg !957
  br label %for.cond, !dbg !958

for.cond:                                         ; preds = %for.inc, %if.then
  %0 = load i32, i32* %i, align 4, !dbg !959
  %1 = load i32, i32* %cnt.addr, align 4, !dbg !961
  %cmp = icmp slt i32 %0, %1, !dbg !962
  br i1 %cmp, label %for.body, label %for.end, !dbg !963

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %result.addr, align 8, !dbg !964
  %3 = load i32, i32* %i, align 4, !dbg !967
  %idxprom = sext i32 %3 to i64, !dbg !964
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 %idxprom, !dbg !964
  %4 = load i8, i8* %arrayidx, align 1, !dbg !964
  %conv = zext i8 %4 to i32, !dbg !964
  %5 = load i8*, i8** %expected.addr, align 8, !dbg !968
  %6 = load i32, i32* %i, align 4, !dbg !969
  %idxprom2 = sext i32 %6 to i64, !dbg !968
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 %idxprom2, !dbg !968
  %7 = load i8, i8* %arrayidx3, align 1, !dbg !968
  %conv4 = zext i8 %7 to i32, !dbg !968
  %cmp5 = icmp ne i32 %conv, %conv4, !dbg !970
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !971

if.then6:                                         ; preds = %for.body
  %8 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !972
  %call8 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0))
          to label %invoke.cont7 unwind label %lpad, !dbg !973

invoke.cont7:                                     ; preds = %if.then6
  %9 = load i32, i32* %i, align 4, !dbg !974
  %call10 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call8, i32 %9)
          to label %invoke.cont9 unwind label %lpad, !dbg !975

invoke.cont9:                                     ; preds = %invoke.cont7
  %call12 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call10, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i32 0, i32 0))
          to label %invoke.cont11 unwind label %lpad, !dbg !976

invoke.cont11:                                    ; preds = %invoke.cont9
  %10 = load i8*, i8** %expected.addr, align 8, !dbg !977
  %11 = load i32, i32* %i, align 4, !dbg !978
  %idxprom13 = sext i32 %11 to i64, !dbg !977
  %arrayidx14 = getelementptr inbounds i8, i8* %10, i64 %idxprom13, !dbg !977
  %12 = load i8, i8* %arrayidx14, align 1, !dbg !977
  %conv15 = zext i8 %12 to i32, !dbg !977
  %call17 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call12, i32 %conv15)
          to label %invoke.cont16 unwind label %lpad, !dbg !979

invoke.cont16:                                    ; preds = %invoke.cont11
  %call19 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call17, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0))
          to label %invoke.cont18 unwind label %lpad, !dbg !980

invoke.cont18:                                    ; preds = %invoke.cont16
  %13 = load i8*, i8** %result.addr, align 8, !dbg !981
  %14 = load i32, i32* %i, align 4, !dbg !982
  %idxprom20 = sext i32 %14 to i64, !dbg !981
  %arrayidx21 = getelementptr inbounds i8, i8* %13, i64 %idxprom20, !dbg !981
  %15 = load i8, i8* %arrayidx21, align 1, !dbg !981
  %conv22 = zext i8 %15 to i32, !dbg !981
  %call24 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call19, i32 %conv22)
          to label %invoke.cont23 unwind label %lpad, !dbg !983

invoke.cont23:                                    ; preds = %invoke.cont18
  %call26 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call24, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont25 unwind label %lpad, !dbg !984

invoke.cont25:                                    ; preds = %invoke.cont23
  br label %if.end, !dbg !972

lpad:                                             ; preds = %invoke.cont42, %if.else41, %invoke.cont38, %invoke.cont36, %invoke.cont34, %invoke.cont32, %invoke.cont30, %invoke.cont28, %for.end, %invoke.cont23, %invoke.cont18, %invoke.cont16, %invoke.cont11, %invoke.cont9, %invoke.cont7, %if.then6, %invoke.cont, %entry
  %16 = landingpad { i8*, i32 }
          cleanup, !dbg !985
  %17 = extractvalue { i8*, i32 } %16, 0, !dbg !985
  store i8* %17, i8** %exn.slot, align 8, !dbg !985
  %18 = extractvalue { i8*, i32 } %16, 1, !dbg !985
  store i32 %18, i32* %ehselector.slot, align 4, !dbg !985
  call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* %ofile) #3, !dbg !985
  br label %eh.resume, !dbg !985

if.else:                                          ; preds = %for.body
  %19 = load i32, i32* %correct_cnt, align 4, !dbg !986
  %inc = add nsw i32 %19, 1, !dbg !986
  store i32 %inc, i32* %correct_cnt, align 4, !dbg !986
  br label %if.end

if.end:                                           ; preds = %if.else, %invoke.cont25
  br label %for.inc, !dbg !987

for.inc:                                          ; preds = %if.end
  %20 = load i32, i32* %i, align 4, !dbg !988
  %inc27 = add nsw i32 %20, 1, !dbg !988
  store i32 %inc27, i32* %i, align 4, !dbg !988
  br label %for.cond, !dbg !989, !llvm.loop !990

for.end:                                          ; preds = %for.cond
  %21 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !992
  %call29 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %21, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0))
          to label %invoke.cont28 unwind label %lpad, !dbg !993

invoke.cont28:                                    ; preds = %for.end
  %22 = load i32, i32* %correct_cnt, align 4, !dbg !994
  %call31 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call29, i32 %22)
          to label %invoke.cont30 unwind label %lpad, !dbg !995

invoke.cont30:                                    ; preds = %invoke.cont28
  %call33 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call31, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0))
          to label %invoke.cont32 unwind label %lpad, !dbg !996

invoke.cont32:                                    ; preds = %invoke.cont30
  %23 = load i32, i32* %cnt.addr, align 4, !dbg !997
  %call35 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call33, i32 %23)
          to label %invoke.cont34 unwind label %lpad, !dbg !998

invoke.cont34:                                    ; preds = %invoke.cont32
  %call37 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call35, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.6, i32 0, i32 0))
          to label %invoke.cont36 unwind label %lpad, !dbg !999

invoke.cont36:                                    ; preds = %invoke.cont34
  %call39 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call37, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont38 unwind label %lpad, !dbg !1000

invoke.cont38:                                    ; preds = %invoke.cont36
  invoke void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv(%"class.std::basic_ofstream"* %ofile)
          to label %invoke.cont40 unwind label %lpad, !dbg !1001

invoke.cont40:                                    ; preds = %invoke.cont38
  br label %if.end46, !dbg !1002

if.else41:                                        ; preds = %invoke.cont1
  %call43 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.7, i32 0, i32 0))
          to label %invoke.cont42 unwind label %lpad, !dbg !1003

invoke.cont42:                                    ; preds = %if.else41
  %call45 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call43, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont44 unwind label %lpad, !dbg !1005

invoke.cont44:                                    ; preds = %invoke.cont42
  br label %if.end46

if.end46:                                         ; preds = %invoke.cont44, %invoke.cont40
  call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* %ofile) #3, !dbg !985
  ret void, !dbg !985

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !985
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !985
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !985
  %lpad.val47 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !985
  resume { i8*, i32 } %lpad.val47, !dbg !985
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #5

declare void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev(%"class.std::basic_ofstream"*) unnamed_addr #1

declare void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_ofstream"*, i8*, i32) #1

declare i32 @__gxx_personality_v0(...)

declare zeroext i1 @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ofstream"*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"*, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* dereferenceable(272)) #1

declare void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv(%"class.std::basic_ofstream"*) #1

; Function Attrs: nounwind
declare void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"*) unnamed_addr #2

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_check_result.cpp() #0 section ".text.startup" !dbg !1006 {
entry:
  call void @__cxx_global_var_init(), !dbg !1008
  ret void
}

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!28}
!llvm.module.flags = !{!921, !922, !923, !924}
!llvm.ident = !{!925}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !2, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "std", scope: null)
!3 = !DIFile(filename: "/usr/include/c++/11/iostream", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!4 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !6, file: !5, line: 626, size: 8, flags: DIFlagTypePassByReference, elements: !7, identifier: "_ZTSNSt8ios_base4InitE")
!5 = !DIFile(filename: "/usr/include/c++/11/bits/ios_base.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!6 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !2, file: !5, line: 228, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt8ios_base")
!7 = !{!8, !12, !14, !18, !19, !24}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "_S_refcount", scope: !4, file: !5, line: 639, baseType: !9, flags: DIFlagStaticMember)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Atomic_word", file: !10, line: 32, baseType: !11)
!10 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/atomic_word.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
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
!28 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !29, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !30, retainedTypes: !31, globals: !32, imports: !33)
!29 = !DIFile(filename: "../src/check_result.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!30 = !{}
!31 = !{!11}
!32 = !{!0}
!33 = !{!34, !40, !46, !51, !55, !57, !59, !61, !63, !70, !77, !84, !88, !92, !96, !105, !109, !111, !116, !122, !126, !133, !135, !138, !142, !146, !148, !152, !156, !158, !162, !164, !166, !170, !174, !178, !182, !186, !190, !192, !204, !208, !212, !217, !219, !221, !225, !229, !230, !231, !232, !233, !234, !251, !254, !259, !266, !274, !278, !285, !289, !293, !295, !297, !301, !307, !311, !317, !323, !325, !329, !333, !337, !341, !345, !347, !351, !355, !359, !361, !365, !369, !373, !375, !377, !381, !389, !393, !397, !401, !403, !409, !411, !418, !423, !427, !431, !435, !439, !443, !445, !447, !451, !455, !459, !461, !465, !469, !471, !473, !477, !482, !487, !492, !493, !494, !495, !496, !497, !498, !499, !500, !501, !502, !557, !561, !565, !572, !576, !579, !582, !585, !587, !589, !591, !594, !597, !600, !603, !606, !608, !613, !617, !620, !623, !625, !627, !629, !631, !634, !637, !640, !643, !646, !648, !652, !656, !661, !665, !667, !669, !671, !673, !675, !677, !679, !681, !683, !685, !687, !689, !691, !695, !699, !705, !709, !714, !716, !720, !722, !726, !734, !738, !742, !746, !750, !754, !758, !762, !766, !770, !774, !778, !782, !784, !786, !790, !794, !800, !804, !808, !810, !814, !818, !824, !826, !830, !834, !838, !842, !846, !850, !854, !855, !856, !857, !859, !860, !861, !862, !863, !864, !865, !871, !874, !875, !877, !879, !881, !883, !887, !889, !891, !893, !895, !897, !899, !901, !903, !907, !911, !913, !917}
!34 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !35, file: !39, line: 98)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !36, line: 7, baseType: !37)
!36 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!37 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !38, line: 49, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!38 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!39 = !DIFile(filename: "/usr/include/c++/11/cstdio", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!40 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !41, file: !39, line: 99)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !42, line: 84, baseType: !43)
!42 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !44, line: 14, baseType: !45)
!44 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!45 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !44, line: 10, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!46 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !47, file: !39, line: 101)
!47 = !DISubprogram(name: "clearerr", scope: !42, file: !42, line: 786, type: !48, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !52, file: !39, line: 102)
!52 = !DISubprogram(name: "fclose", scope: !42, file: !42, line: 178, type: !53, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!53 = !DISubroutineType(types: !54)
!54 = !{!11, !50}
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !56, file: !39, line: 103)
!56 = !DISubprogram(name: "feof", scope: !42, file: !42, line: 788, type: !53, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !58, file: !39, line: 104)
!58 = !DISubprogram(name: "ferror", scope: !42, file: !42, line: 790, type: !53, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !60, file: !39, line: 105)
!60 = !DISubprogram(name: "fflush", scope: !42, file: !42, line: 230, type: !53, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !62, file: !39, line: 106)
!62 = !DISubprogram(name: "fgetc", scope: !42, file: !42, line: 513, type: !53, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !64, file: !39, line: 107)
!64 = !DISubprogram(name: "fgetpos", scope: !42, file: !42, line: 760, type: !65, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!65 = !DISubroutineType(types: !66)
!66 = !{!11, !67, !68}
!67 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !50)
!68 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !69)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !71, file: !39, line: 108)
!71 = !DISubprogram(name: "fgets", scope: !42, file: !42, line: 592, type: !72, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !76, !11, !67}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !74)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !78, file: !39, line: 109)
!78 = !DISubprogram(name: "fopen", scope: !42, file: !42, line: 258, type: !79, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!79 = !DISubroutineType(types: !80)
!80 = !{!50, !81, !81}
!81 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !82)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !75)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !85, file: !39, line: 110)
!85 = !DISubprogram(name: "fprintf", scope: !42, file: !42, line: 350, type: !86, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!86 = !DISubroutineType(types: !87)
!87 = !{!11, !67, !81, null}
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !89, file: !39, line: 111)
!89 = !DISubprogram(name: "fputc", scope: !42, file: !42, line: 549, type: !90, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!90 = !DISubroutineType(types: !91)
!91 = !{!11, !11, !50}
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !93, file: !39, line: 112)
!93 = !DISubprogram(name: "fputs", scope: !42, file: !42, line: 655, type: !94, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!94 = !DISubroutineType(types: !95)
!95 = !{!11, !81, !67}
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !97, file: !39, line: 113)
!97 = !DISubprogram(name: "fread", scope: !42, file: !42, line: 675, type: !98, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!98 = !DISubroutineType(types: !99)
!99 = !{!100, !103, !100, !100, !67}
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !101, line: 62, baseType: !102)
!101 = !DIFile(filename: "/home/gabriel/Documents/hls-llvm-project/hls-build/lib/clang/7.0.0/include/stddef.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!102 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!103 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !104)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !106, file: !39, line: 114)
!106 = !DISubprogram(name: "freopen", scope: !42, file: !42, line: 265, type: !107, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!107 = !DISubroutineType(types: !108)
!108 = !{!50, !81, !81, !67}
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !110, file: !39, line: 115)
!110 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !42, file: !42, line: 434, type: !86, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !112, file: !39, line: 116)
!112 = !DISubprogram(name: "fseek", scope: !42, file: !42, line: 713, type: !113, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!113 = !DISubroutineType(types: !114)
!114 = !{!11, !50, !115, !11}
!115 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !117, file: !39, line: 117)
!117 = !DISubprogram(name: "fsetpos", scope: !42, file: !42, line: 765, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DISubroutineType(types: !119)
!119 = !{!11, !50, !120}
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!121 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !41)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !123, file: !39, line: 118)
!123 = !DISubprogram(name: "ftell", scope: !42, file: !42, line: 718, type: !124, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!124 = !DISubroutineType(types: !125)
!125 = !{!115, !50}
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !127, file: !39, line: 119)
!127 = !DISubprogram(name: "fwrite", scope: !42, file: !42, line: 681, type: !128, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!128 = !DISubroutineType(types: !129)
!129 = !{!100, !130, !100, !100, !67}
!130 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !131)
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!132 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !134, file: !39, line: 120)
!134 = !DISubprogram(name: "getc", scope: !42, file: !42, line: 514, type: !53, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !136, file: !39, line: 121)
!136 = !DISubprogram(name: "getchar", scope: !42, file: !42, line: 520, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DISubroutineType(types: !31)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !139, file: !39, line: 126)
!139 = !DISubprogram(name: "perror", scope: !42, file: !42, line: 804, type: !140, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!140 = !DISubroutineType(types: !141)
!141 = !{null, !82}
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !143, file: !39, line: 127)
!143 = !DISubprogram(name: "printf", scope: !42, file: !42, line: 356, type: !144, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!144 = !DISubroutineType(types: !145)
!145 = !{!11, !81, null}
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !147, file: !39, line: 128)
!147 = !DISubprogram(name: "putc", scope: !42, file: !42, line: 550, type: !90, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !149, file: !39, line: 129)
!149 = !DISubprogram(name: "putchar", scope: !42, file: !42, line: 556, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!150 = !DISubroutineType(types: !151)
!151 = !{!11, !11}
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !153, file: !39, line: 130)
!153 = !DISubprogram(name: "puts", scope: !42, file: !42, line: 661, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!154 = !DISubroutineType(types: !155)
!155 = !{!11, !82}
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !157, file: !39, line: 131)
!157 = !DISubprogram(name: "remove", scope: !42, file: !42, line: 152, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!158 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !159, file: !39, line: 132)
!159 = !DISubprogram(name: "rename", scope: !42, file: !42, line: 154, type: !160, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!160 = !DISubroutineType(types: !161)
!161 = !{!11, !82, !82}
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !163, file: !39, line: 133)
!163 = !DISubprogram(name: "rewind", scope: !42, file: !42, line: 723, type: !48, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !165, file: !39, line: 134)
!165 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !42, file: !42, line: 437, type: !144, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !167, file: !39, line: 135)
!167 = !DISubprogram(name: "setbuf", scope: !42, file: !42, line: 328, type: !168, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!168 = !DISubroutineType(types: !169)
!169 = !{null, !67, !76}
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !171, file: !39, line: 136)
!171 = !DISubprogram(name: "setvbuf", scope: !42, file: !42, line: 332, type: !172, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DISubroutineType(types: !173)
!173 = !{!11, !67, !76, !11, !100}
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !175, file: !39, line: 137)
!175 = !DISubprogram(name: "sprintf", scope: !42, file: !42, line: 358, type: !176, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!176 = !DISubroutineType(types: !177)
!177 = !{!11, !76, !81, null}
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !179, file: !39, line: 138)
!179 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !42, file: !42, line: 439, type: !180, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DISubroutineType(types: !181)
!181 = !{!11, !81, !81, null}
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !183, file: !39, line: 139)
!183 = !DISubprogram(name: "tmpfile", scope: !42, file: !42, line: 188, type: !184, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!184 = !DISubroutineType(types: !185)
!185 = !{!50}
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !187, file: !39, line: 141)
!187 = !DISubprogram(name: "tmpnam", scope: !42, file: !42, line: 205, type: !188, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DISubroutineType(types: !189)
!189 = !{!74, !74}
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !191, file: !39, line: 143)
!191 = !DISubprogram(name: "ungetc", scope: !42, file: !42, line: 668, type: !90, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !193, file: !39, line: 144)
!193 = !DISubprogram(name: "vfprintf", scope: !42, file: !42, line: 365, type: !194, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!194 = !DISubroutineType(types: !195)
!195 = !{!11, !67, !81, !196}
!196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !197, size: 64)
!197 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !29, size: 192, flags: DIFlagTypePassByValue, elements: !198, identifier: "_ZTS13__va_list_tag")
!198 = !{!199, !201, !202, !203}
!199 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !197, file: !29, baseType: !200, size: 32)
!200 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !197, file: !29, baseType: !200, size: 32, offset: 32)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !197, file: !29, baseType: !104, size: 64, offset: 64)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !197, file: !29, baseType: !104, size: 64, offset: 128)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !205, file: !39, line: 145)
!205 = !DISubprogram(name: "vprintf", scope: !42, file: !42, line: 371, type: !206, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!206 = !DISubroutineType(types: !207)
!207 = !{!11, !81, !196}
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !209, file: !39, line: 146)
!209 = !DISubprogram(name: "vsprintf", scope: !42, file: !42, line: 373, type: !210, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DISubroutineType(types: !211)
!211 = !{!11, !76, !81, !196}
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !214, file: !39, line: 175)
!213 = !DINamespace(name: "__gnu_cxx", scope: null)
!214 = !DISubprogram(name: "snprintf", scope: !42, file: !42, line: 378, type: !215, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DISubroutineType(types: !216)
!216 = !{!11, !76, !100, !81, null}
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !218, file: !39, line: 176)
!218 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !42, file: !42, line: 479, type: !194, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !220, file: !39, line: 177)
!220 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !42, file: !42, line: 484, type: !206, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !222, file: !39, line: 178)
!222 = !DISubprogram(name: "vsnprintf", scope: !42, file: !42, line: 382, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DISubroutineType(types: !224)
!224 = !{!11, !76, !100, !81, !196}
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !226, file: !39, line: 179)
!226 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !42, file: !42, line: 487, type: !227, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DISubroutineType(types: !228)
!228 = !{!11, !81, !81, !196}
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !214, file: !39, line: 185)
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !218, file: !39, line: 186)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !220, file: !39, line: 187)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !222, file: !39, line: 188)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !226, file: !39, line: 189)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !235, file: !250, line: 64)
!235 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !236, line: 6, baseType: !237)
!236 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!237 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !238, line: 21, baseType: !239)
!238 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!239 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !238, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !240, identifier: "_ZTS11__mbstate_t")
!240 = !{!241, !242}
!241 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !239, file: !238, line: 15, baseType: !11, size: 32)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !239, file: !238, line: 20, baseType: !243, size: 32, offset: 32)
!243 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !239, file: !238, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !244, identifier: "_ZTSN11__mbstate_tUt_E")
!244 = !{!245, !246}
!245 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !243, file: !238, line: 18, baseType: !200, size: 32)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !243, file: !238, line: 19, baseType: !247, size: 32)
!247 = !DICompositeType(tag: DW_TAG_array_type, baseType: !75, size: 32, elements: !248)
!248 = !{!249}
!249 = !DISubrange(count: 4)
!250 = !DIFile(filename: "/usr/include/c++/11/cwchar", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !252, file: !250, line: 141)
!252 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !253, line: 20, baseType: !200)
!253 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !255, file: !250, line: 143)
!255 = !DISubprogram(name: "btowc", scope: !256, file: !256, line: 285, type: !257, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DIFile(filename: "/usr/include/wchar.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!257 = !DISubroutineType(types: !258)
!258 = !{!252, !11}
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !260, file: !250, line: 144)
!260 = !DISubprogram(name: "fgetwc", scope: !256, file: !256, line: 744, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!261 = !DISubroutineType(types: !262)
!262 = !{!252, !263}
!263 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !264, size: 64)
!264 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !265, line: 5, baseType: !37)
!265 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !267, file: !250, line: 145)
!267 = !DISubprogram(name: "fgetws", scope: !256, file: !256, line: 773, type: !268, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!268 = !DISubroutineType(types: !269)
!269 = !{!270, !272, !11, !273}
!270 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !271, size: 64)
!271 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!272 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !270)
!273 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !263)
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !275, file: !250, line: 146)
!275 = !DISubprogram(name: "fputwc", scope: !256, file: !256, line: 758, type: !276, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!276 = !DISubroutineType(types: !277)
!277 = !{!252, !271, !263}
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !279, file: !250, line: 147)
!279 = !DISubprogram(name: "fputws", scope: !256, file: !256, line: 780, type: !280, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!280 = !DISubroutineType(types: !281)
!281 = !{!11, !282, !273}
!282 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !283)
!283 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !284, size: 64)
!284 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !271)
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !286, file: !250, line: 148)
!286 = !DISubprogram(name: "fwide", scope: !256, file: !256, line: 588, type: !287, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!287 = !DISubroutineType(types: !288)
!288 = !{!11, !263, !11}
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !290, file: !250, line: 149)
!290 = !DISubprogram(name: "fwprintf", scope: !256, file: !256, line: 595, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!291 = !DISubroutineType(types: !292)
!292 = !{!11, !273, !282, null}
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !294, file: !250, line: 150)
!294 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !256, file: !256, line: 657, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !296, file: !250, line: 151)
!296 = !DISubprogram(name: "getwc", scope: !256, file: !256, line: 745, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !298, file: !250, line: 152)
!298 = !DISubprogram(name: "getwchar", scope: !256, file: !256, line: 751, type: !299, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!299 = !DISubroutineType(types: !300)
!300 = !{!252}
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !302, file: !250, line: 153)
!302 = !DISubprogram(name: "mbrlen", scope: !256, file: !256, line: 308, type: !303, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!303 = !DISubroutineType(types: !304)
!304 = !{!100, !81, !100, !305}
!305 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !306)
!306 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !235, size: 64)
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !308, file: !250, line: 154)
!308 = !DISubprogram(name: "mbrtowc", scope: !256, file: !256, line: 297, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!309 = !DISubroutineType(types: !310)
!310 = !{!100, !272, !81, !100, !305}
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !312, file: !250, line: 155)
!312 = !DISubprogram(name: "mbsinit", scope: !256, file: !256, line: 293, type: !313, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!313 = !DISubroutineType(types: !314)
!314 = !{!11, !315}
!315 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !316, size: 64)
!316 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !235)
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !318, file: !250, line: 156)
!318 = !DISubprogram(name: "mbsrtowcs", scope: !256, file: !256, line: 338, type: !319, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!319 = !DISubroutineType(types: !320)
!320 = !{!100, !272, !321, !100, !305}
!321 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !322)
!322 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !324, file: !250, line: 157)
!324 = !DISubprogram(name: "putwc", scope: !256, file: !256, line: 759, type: !276, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !326, file: !250, line: 158)
!326 = !DISubprogram(name: "putwchar", scope: !256, file: !256, line: 765, type: !327, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!327 = !DISubroutineType(types: !328)
!328 = !{!252, !271}
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !330, file: !250, line: 160)
!330 = !DISubprogram(name: "swprintf", scope: !256, file: !256, line: 605, type: !331, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!331 = !DISubroutineType(types: !332)
!332 = !{!11, !272, !100, !282, null}
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !334, file: !250, line: 162)
!334 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !256, file: !256, line: 664, type: !335, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!335 = !DISubroutineType(types: !336)
!336 = !{!11, !282, !282, null}
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !338, file: !250, line: 163)
!338 = !DISubprogram(name: "ungetwc", scope: !256, file: !256, line: 788, type: !339, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!339 = !DISubroutineType(types: !340)
!340 = !{!252, !252, !263}
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !342, file: !250, line: 164)
!342 = !DISubprogram(name: "vfwprintf", scope: !256, file: !256, line: 613, type: !343, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!343 = !DISubroutineType(types: !344)
!344 = !{!11, !273, !282, !196}
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !346, file: !250, line: 166)
!346 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !256, file: !256, line: 711, type: !343, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !348, file: !250, line: 169)
!348 = !DISubprogram(name: "vswprintf", scope: !256, file: !256, line: 626, type: !349, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!349 = !DISubroutineType(types: !350)
!350 = !{!11, !272, !100, !282, !196}
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !352, file: !250, line: 172)
!352 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !256, file: !256, line: 718, type: !353, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!353 = !DISubroutineType(types: !354)
!354 = !{!11, !282, !282, !196}
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !356, file: !250, line: 174)
!356 = !DISubprogram(name: "vwprintf", scope: !256, file: !256, line: 621, type: !357, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!357 = !DISubroutineType(types: !358)
!358 = !{!11, !282, !196}
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !360, file: !250, line: 176)
!360 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !256, file: !256, line: 715, type: !357, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !362, file: !250, line: 178)
!362 = !DISubprogram(name: "wcrtomb", scope: !256, file: !256, line: 302, type: !363, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!363 = !DISubroutineType(types: !364)
!364 = !{!100, !76, !271, !305}
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !366, file: !250, line: 179)
!366 = !DISubprogram(name: "wcscat", scope: !256, file: !256, line: 97, type: !367, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!367 = !DISubroutineType(types: !368)
!368 = !{!270, !272, !282}
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !370, file: !250, line: 180)
!370 = !DISubprogram(name: "wcscmp", scope: !256, file: !256, line: 106, type: !371, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!371 = !DISubroutineType(types: !372)
!372 = !{!11, !283, !283}
!373 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !374, file: !250, line: 181)
!374 = !DISubprogram(name: "wcscoll", scope: !256, file: !256, line: 131, type: !371, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !376, file: !250, line: 182)
!376 = !DISubprogram(name: "wcscpy", scope: !256, file: !256, line: 87, type: !367, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!377 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !378, file: !250, line: 183)
!378 = !DISubprogram(name: "wcscspn", scope: !256, file: !256, line: 188, type: !379, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!379 = !DISubroutineType(types: !380)
!380 = !{!100, !283, !283}
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !382, file: !250, line: 184)
!382 = !DISubprogram(name: "wcsftime", scope: !256, file: !256, line: 852, type: !383, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!383 = !DISubroutineType(types: !384)
!384 = !{!100, !272, !100, !282, !385}
!385 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !386)
!386 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !387, size: 64)
!387 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !388)
!388 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !256, line: 83, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !390, file: !250, line: 185)
!390 = !DISubprogram(name: "wcslen", scope: !256, file: !256, line: 223, type: !391, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!391 = !DISubroutineType(types: !392)
!392 = !{!100, !283}
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !394, file: !250, line: 186)
!394 = !DISubprogram(name: "wcsncat", scope: !256, file: !256, line: 101, type: !395, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!395 = !DISubroutineType(types: !396)
!396 = !{!270, !272, !282, !100}
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !398, file: !250, line: 187)
!398 = !DISubprogram(name: "wcsncmp", scope: !256, file: !256, line: 109, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!399 = !DISubroutineType(types: !400)
!400 = !{!11, !283, !283, !100}
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !402, file: !250, line: 188)
!402 = !DISubprogram(name: "wcsncpy", scope: !256, file: !256, line: 92, type: !395, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !404, file: !250, line: 189)
!404 = !DISubprogram(name: "wcsrtombs", scope: !256, file: !256, line: 344, type: !405, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!405 = !DISubroutineType(types: !406)
!406 = !{!100, !76, !407, !100, !305}
!407 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !408)
!408 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !283, size: 64)
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !410, file: !250, line: 190)
!410 = !DISubprogram(name: "wcsspn", scope: !256, file: !256, line: 192, type: !379, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !412, file: !250, line: 191)
!412 = !DISubprogram(name: "wcstod", scope: !256, file: !256, line: 378, type: !413, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!413 = !DISubroutineType(types: !414)
!414 = !{!415, !282, !416}
!415 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!416 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !417)
!417 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !270, size: 64)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !419, file: !250, line: 193)
!419 = !DISubprogram(name: "wcstof", scope: !256, file: !256, line: 383, type: !420, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!420 = !DISubroutineType(types: !421)
!421 = !{!422, !282, !416}
!422 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !424, file: !250, line: 195)
!424 = !DISubprogram(name: "wcstok", scope: !256, file: !256, line: 218, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!425 = !DISubroutineType(types: !426)
!426 = !{!270, !272, !282, !416}
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !428, file: !250, line: 196)
!428 = !DISubprogram(name: "wcstol", scope: !256, file: !256, line: 429, type: !429, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!429 = !DISubroutineType(types: !430)
!430 = !{!115, !282, !416, !11}
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !432, file: !250, line: 197)
!432 = !DISubprogram(name: "wcstoul", scope: !256, file: !256, line: 434, type: !433, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!433 = !DISubroutineType(types: !434)
!434 = !{!102, !282, !416, !11}
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !436, file: !250, line: 198)
!436 = !DISubprogram(name: "wcsxfrm", scope: !256, file: !256, line: 135, type: !437, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!437 = !DISubroutineType(types: !438)
!438 = !{!100, !272, !282, !100}
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !440, file: !250, line: 199)
!440 = !DISubprogram(name: "wctob", scope: !256, file: !256, line: 289, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!441 = !DISubroutineType(types: !442)
!442 = !{!11, !252}
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !444, file: !250, line: 200)
!444 = !DISubprogram(name: "wmemcmp", scope: !256, file: !256, line: 259, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !446, file: !250, line: 201)
!446 = !DISubprogram(name: "wmemcpy", scope: !256, file: !256, line: 263, type: !395, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !448, file: !250, line: 202)
!448 = !DISubprogram(name: "wmemmove", scope: !256, file: !256, line: 268, type: !449, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!449 = !DISubroutineType(types: !450)
!450 = !{!270, !270, !283, !100}
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !452, file: !250, line: 203)
!452 = !DISubprogram(name: "wmemset", scope: !256, file: !256, line: 272, type: !453, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!453 = !DISubroutineType(types: !454)
!454 = !{!270, !270, !271, !100}
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !456, file: !250, line: 204)
!456 = !DISubprogram(name: "wprintf", scope: !256, file: !256, line: 602, type: !457, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!457 = !DISubroutineType(types: !458)
!458 = !{!11, !282, null}
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !460, file: !250, line: 205)
!460 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !256, file: !256, line: 661, type: !457, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !462, file: !250, line: 206)
!462 = !DISubprogram(name: "wcschr", scope: !256, file: !256, line: 165, type: !463, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!463 = !DISubroutineType(types: !464)
!464 = !{!270, !283, !271}
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !466, file: !250, line: 207)
!466 = !DISubprogram(name: "wcspbrk", scope: !256, file: !256, line: 202, type: !467, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!467 = !DISubroutineType(types: !468)
!468 = !{!270, !283, !283}
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !470, file: !250, line: 208)
!470 = !DISubprogram(name: "wcsrchr", scope: !256, file: !256, line: 175, type: !463, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !472, file: !250, line: 209)
!472 = !DISubprogram(name: "wcsstr", scope: !256, file: !256, line: 213, type: !467, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !474, file: !250, line: 210)
!474 = !DISubprogram(name: "wmemchr", scope: !256, file: !256, line: 254, type: !475, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!475 = !DISubroutineType(types: !476)
!476 = !{!270, !283, !271, !100}
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !478, file: !250, line: 251)
!478 = !DISubprogram(name: "wcstold", scope: !256, file: !256, line: 385, type: !479, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!479 = !DISubroutineType(types: !480)
!480 = !{!481, !282, !416}
!481 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !483, file: !250, line: 260)
!483 = !DISubprogram(name: "wcstoll", scope: !256, file: !256, line: 442, type: !484, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!484 = !DISubroutineType(types: !485)
!485 = !{!486, !282, !416, !11}
!486 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !488, file: !250, line: 261)
!488 = !DISubprogram(name: "wcstoull", scope: !256, file: !256, line: 449, type: !489, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!489 = !DISubroutineType(types: !490)
!490 = !{!491, !282, !416, !11}
!491 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !478, file: !250, line: 267)
!493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !483, file: !250, line: 268)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !488, file: !250, line: 269)
!495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !419, file: !250, line: 283)
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !346, file: !250, line: 286)
!497 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !352, file: !250, line: 289)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !360, file: !250, line: 292)
!499 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !478, file: !250, line: 296)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !483, file: !250, line: 297)
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !488, file: !250, line: 298)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !503, file: !504, line: 68)
!503 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !505, file: !504, line: 90, size: 64, flags: DIFlagTypePassByReference, elements: !506, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!504 = !DIFile(filename: "/usr/include/c++/11/bits/exception_ptr.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!505 = !DINamespace(name: "__exception_ptr", scope: !2)
!506 = !{!507, !508, !512, !515, !516, !521, !522, !526, !532, !536, !540, !543, !544, !547, !550}
!507 = !DIDerivedType(tag: DW_TAG_member, name: "_M_exception_object", scope: !503, file: !504, line: 92, baseType: !104, size: 64)
!508 = !DISubprogram(name: "exception_ptr", scope: !503, file: !504, line: 94, type: !509, isLocal: false, isDefinition: false, scopeLine: 94, flags: DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!509 = !DISubroutineType(types: !510)
!510 = !{null, !511, !104}
!511 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !503, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!512 = !DISubprogram(name: "_M_addref", linkageName: "_ZNSt15__exception_ptr13exception_ptr9_M_addrefEv", scope: !503, file: !504, line: 96, type: !513, isLocal: false, isDefinition: false, scopeLine: 96, flags: DIFlagPrototyped, isOptimized: false)
!513 = !DISubroutineType(types: !514)
!514 = !{null, !511}
!515 = !DISubprogram(name: "_M_release", linkageName: "_ZNSt15__exception_ptr13exception_ptr10_M_releaseEv", scope: !503, file: !504, line: 97, type: !513, isLocal: false, isDefinition: false, scopeLine: 97, flags: DIFlagPrototyped, isOptimized: false)
!516 = !DISubprogram(name: "_M_get", linkageName: "_ZNKSt15__exception_ptr13exception_ptr6_M_getEv", scope: !503, file: !504, line: 99, type: !517, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPrototyped, isOptimized: false)
!517 = !DISubroutineType(types: !518)
!518 = !{!104, !519}
!519 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !520, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!520 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !503)
!521 = !DISubprogram(name: "exception_ptr", scope: !503, file: !504, line: 107, type: !513, isLocal: false, isDefinition: false, scopeLine: 107, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!522 = !DISubprogram(name: "exception_ptr", scope: !503, file: !504, line: 109, type: !523, isLocal: false, isDefinition: false, scopeLine: 109, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!523 = !DISubroutineType(types: !524)
!524 = !{null, !511, !525}
!525 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !520, size: 64)
!526 = !DISubprogram(name: "exception_ptr", scope: !503, file: !504, line: 112, type: !527, isLocal: false, isDefinition: false, scopeLine: 112, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!527 = !DISubroutineType(types: !528)
!528 = !{null, !511, !529}
!529 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !2, file: !530, line: 302, baseType: !531)
!530 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/c++config.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!531 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!532 = !DISubprogram(name: "exception_ptr", scope: !503, file: !504, line: 116, type: !533, isLocal: false, isDefinition: false, scopeLine: 116, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!533 = !DISubroutineType(types: !534)
!534 = !{null, !511, !535}
!535 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !503, size: 64)
!536 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSERKS0_", scope: !503, file: !504, line: 129, type: !537, isLocal: false, isDefinition: false, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!537 = !DISubroutineType(types: !538)
!538 = !{!539, !511, !525}
!539 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !503, size: 64)
!540 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSEOS0_", scope: !503, file: !504, line: 133, type: !541, isLocal: false, isDefinition: false, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!541 = !DISubroutineType(types: !542)
!542 = !{!539, !511, !535}
!543 = !DISubprogram(name: "~exception_ptr", scope: !503, file: !504, line: 140, type: !513, isLocal: false, isDefinition: false, scopeLine: 140, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!544 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr13exception_ptr4swapERS0_", scope: !503, file: !504, line: 143, type: !545, isLocal: false, isDefinition: false, scopeLine: 143, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!545 = !DISubroutineType(types: !546)
!546 = !{null, !511, !539}
!547 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt15__exception_ptr13exception_ptrcvbEv", scope: !503, file: !504, line: 155, type: !548, isLocal: false, isDefinition: false, scopeLine: 155, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!548 = !DISubroutineType(types: !549)
!549 = !{!13, !519}
!550 = !DISubprogram(name: "__cxa_exception_type", linkageName: "_ZNKSt15__exception_ptr13exception_ptr20__cxa_exception_typeEv", scope: !503, file: !504, line: 176, type: !551, isLocal: false, isDefinition: false, scopeLine: 176, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!551 = !DISubroutineType(types: !552)
!552 = !{!553, !519}
!553 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !554, size: 64)
!554 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !555)
!555 = !DICompositeType(tag: DW_TAG_class_type, name: "type_info", scope: !2, file: !556, line: 88, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt9type_info")
!556 = !DIFile(filename: "/usr/include/c++/11/typeinfo", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !505, entity: !558, file: !504, line: 84)
!558 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !2, file: !504, line: 80, type: !559, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!559 = !DISubroutineType(types: !560)
!560 = !{null, !503}
!561 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !562, entity: !563, file: !564, line: 58)
!562 = !DINamespace(name: "__gnu_debug", scope: null)
!563 = !DINamespace(name: "__debug", scope: !2)
!564 = !DIFile(filename: "/usr/include/c++/11/debug/debug.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !566, file: !571, line: 47)
!566 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !567, line: 24, baseType: !568)
!567 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!568 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !569, line: 37, baseType: !570)
!569 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!570 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!571 = !DIFile(filename: "/usr/include/c++/11/cstdint", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !573, file: !571, line: 48)
!573 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !567, line: 25, baseType: !574)
!574 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !569, line: 39, baseType: !575)
!575 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !577, file: !571, line: 49)
!577 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !567, line: 26, baseType: !578)
!578 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !569, line: 41, baseType: !11)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !580, file: !571, line: 50)
!580 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !567, line: 27, baseType: !581)
!581 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !569, line: 44, baseType: !115)
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !583, file: !571, line: 52)
!583 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !584, line: 58, baseType: !570)
!584 = !DIFile(filename: "/usr/include/stdint.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !586, file: !571, line: 53)
!586 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !584, line: 60, baseType: !115)
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !588, file: !571, line: 54)
!588 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !584, line: 61, baseType: !115)
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !590, file: !571, line: 55)
!590 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !584, line: 62, baseType: !115)
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !592, file: !571, line: 57)
!592 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !584, line: 43, baseType: !593)
!593 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !569, line: 52, baseType: !568)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !595, file: !571, line: 58)
!595 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !584, line: 44, baseType: !596)
!596 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !569, line: 54, baseType: !574)
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !598, file: !571, line: 59)
!598 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !584, line: 45, baseType: !599)
!599 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !569, line: 56, baseType: !578)
!600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !601, file: !571, line: 60)
!601 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !584, line: 46, baseType: !602)
!602 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !569, line: 58, baseType: !581)
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !604, file: !571, line: 62)
!604 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !584, line: 101, baseType: !605)
!605 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !569, line: 72, baseType: !115)
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !607, file: !571, line: 63)
!607 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !584, line: 87, baseType: !115)
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !609, file: !571, line: 65)
!609 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !610, line: 24, baseType: !611)
!610 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!611 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !569, line: 38, baseType: !612)
!612 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !614, file: !571, line: 66)
!614 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !610, line: 25, baseType: !615)
!615 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !569, line: 40, baseType: !616)
!616 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !618, file: !571, line: 67)
!618 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !610, line: 26, baseType: !619)
!619 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !569, line: 42, baseType: !200)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !621, file: !571, line: 68)
!621 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !610, line: 27, baseType: !622)
!622 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !569, line: 45, baseType: !102)
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !624, file: !571, line: 70)
!624 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !584, line: 71, baseType: !612)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !626, file: !571, line: 71)
!626 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !584, line: 73, baseType: !102)
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !628, file: !571, line: 72)
!628 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !584, line: 74, baseType: !102)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !630, file: !571, line: 73)
!630 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !584, line: 75, baseType: !102)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !632, file: !571, line: 75)
!632 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !584, line: 49, baseType: !633)
!633 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !569, line: 53, baseType: !611)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !635, file: !571, line: 76)
!635 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !584, line: 50, baseType: !636)
!636 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !569, line: 55, baseType: !615)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !638, file: !571, line: 77)
!638 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !584, line: 51, baseType: !639)
!639 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !569, line: 57, baseType: !619)
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !641, file: !571, line: 78)
!641 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !584, line: 52, baseType: !642)
!642 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !569, line: 59, baseType: !622)
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !644, file: !571, line: 80)
!644 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !584, line: 102, baseType: !645)
!645 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !569, line: 73, baseType: !102)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !647, file: !571, line: 81)
!647 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !584, line: 90, baseType: !102)
!648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !649, file: !651, line: 53)
!649 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !650, line: 51, size: 768, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!650 = !DIFile(filename: "/usr/include/locale.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!651 = !DIFile(filename: "/usr/include/c++/11/clocale", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !653, file: !651, line: 54)
!653 = !DISubprogram(name: "setlocale", scope: !650, file: !650, line: 122, type: !654, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!654 = !DISubroutineType(types: !655)
!655 = !{!74, !11, !82}
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !657, file: !651, line: 55)
!657 = !DISubprogram(name: "localeconv", scope: !650, file: !650, line: 125, type: !658, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!658 = !DISubroutineType(types: !659)
!659 = !{!660}
!660 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !649, size: 64)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !662, file: !664, line: 64)
!662 = !DISubprogram(name: "isalnum", scope: !663, file: !663, line: 108, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!663 = !DIFile(filename: "/usr/include/ctype.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!664 = !DIFile(filename: "/usr/include/c++/11/cctype", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !666, file: !664, line: 65)
!666 = !DISubprogram(name: "isalpha", scope: !663, file: !663, line: 109, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !668, file: !664, line: 66)
!668 = !DISubprogram(name: "iscntrl", scope: !663, file: !663, line: 110, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !670, file: !664, line: 67)
!670 = !DISubprogram(name: "isdigit", scope: !663, file: !663, line: 111, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !672, file: !664, line: 68)
!672 = !DISubprogram(name: "isgraph", scope: !663, file: !663, line: 113, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !674, file: !664, line: 69)
!674 = !DISubprogram(name: "islower", scope: !663, file: !663, line: 112, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !676, file: !664, line: 70)
!676 = !DISubprogram(name: "isprint", scope: !663, file: !663, line: 114, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !678, file: !664, line: 71)
!678 = !DISubprogram(name: "ispunct", scope: !663, file: !663, line: 115, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !680, file: !664, line: 72)
!680 = !DISubprogram(name: "isspace", scope: !663, file: !663, line: 116, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !682, file: !664, line: 73)
!682 = !DISubprogram(name: "isupper", scope: !663, file: !663, line: 117, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !684, file: !664, line: 74)
!684 = !DISubprogram(name: "isxdigit", scope: !663, file: !663, line: 118, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !686, file: !664, line: 75)
!686 = !DISubprogram(name: "tolower", scope: !663, file: !663, line: 122, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !688, file: !664, line: 76)
!688 = !DISubprogram(name: "toupper", scope: !663, file: !663, line: 125, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !690, file: !664, line: 87)
!690 = !DISubprogram(name: "isblank", scope: !663, file: !663, line: 130, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !692, file: !694, line: 52)
!692 = !DISubprogram(name: "abs", scope: !693, file: !693, line: 848, type: !150, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!693 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!694 = !DIFile(filename: "/usr/include/c++/11/bits/std_abs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !696, file: !698, line: 127)
!696 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !693, line: 63, baseType: !697)
!697 = !DICompositeType(tag: DW_TAG_structure_type, file: !693, line: 59, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!698 = !DIFile(filename: "/usr/include/c++/11/cstdlib", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !700, file: !698, line: 128)
!700 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !693, line: 71, baseType: !701)
!701 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !693, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !702, identifier: "_ZTS6ldiv_t")
!702 = !{!703, !704}
!703 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !701, file: !693, line: 69, baseType: !115, size: 64)
!704 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !701, file: !693, line: 70, baseType: !115, size: 64, offset: 64)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !706, file: !698, line: 130)
!706 = !DISubprogram(name: "abort", scope: !693, file: !693, line: 598, type: !707, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!707 = !DISubroutineType(types: !708)
!708 = !{null}
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !710, file: !698, line: 134)
!710 = !DISubprogram(name: "atexit", scope: !693, file: !693, line: 602, type: !711, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!711 = !DISubroutineType(types: !712)
!712 = !{!11, !713}
!713 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !707, size: 64)
!714 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !715, file: !698, line: 137)
!715 = !DISubprogram(name: "at_quick_exit", scope: !693, file: !693, line: 607, type: !711, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !717, file: !698, line: 140)
!717 = !DISubprogram(name: "atof", scope: !693, file: !693, line: 102, type: !718, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!718 = !DISubroutineType(types: !719)
!719 = !{!415, !82}
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !721, file: !698, line: 141)
!721 = !DISubprogram(name: "atoi", scope: !693, file: !693, line: 105, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !723, file: !698, line: 142)
!723 = !DISubprogram(name: "atol", scope: !693, file: !693, line: 108, type: !724, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!724 = !DISubroutineType(types: !725)
!725 = !{!115, !82}
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !727, file: !698, line: 143)
!727 = !DISubprogram(name: "bsearch", scope: !693, file: !693, line: 828, type: !728, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!728 = !DISubroutineType(types: !729)
!729 = !{!104, !131, !131, !100, !100, !730}
!730 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !693, line: 816, baseType: !731)
!731 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !732, size: 64)
!732 = !DISubroutineType(types: !733)
!733 = !{!11, !131, !131}
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !735, file: !698, line: 144)
!735 = !DISubprogram(name: "calloc", scope: !693, file: !693, line: 543, type: !736, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!736 = !DISubroutineType(types: !737)
!737 = !{!104, !100, !100}
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !739, file: !698, line: 145)
!739 = !DISubprogram(name: "div", scope: !693, file: !693, line: 860, type: !740, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!740 = !DISubroutineType(types: !741)
!741 = !{!696, !11, !11}
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !743, file: !698, line: 146)
!743 = !DISubprogram(name: "exit", scope: !693, file: !693, line: 624, type: !744, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!744 = !DISubroutineType(types: !745)
!745 = !{null, !11}
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !747, file: !698, line: 147)
!747 = !DISubprogram(name: "free", scope: !693, file: !693, line: 555, type: !748, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!748 = !DISubroutineType(types: !749)
!749 = !{null, !104}
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !751, file: !698, line: 148)
!751 = !DISubprogram(name: "getenv", scope: !693, file: !693, line: 641, type: !752, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!752 = !DISubroutineType(types: !753)
!753 = !{!74, !82}
!754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !755, file: !698, line: 149)
!755 = !DISubprogram(name: "labs", scope: !693, file: !693, line: 849, type: !756, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!756 = !DISubroutineType(types: !757)
!757 = !{!115, !115}
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !759, file: !698, line: 150)
!759 = !DISubprogram(name: "ldiv", scope: !693, file: !693, line: 862, type: !760, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!760 = !DISubroutineType(types: !761)
!761 = !{!700, !115, !115}
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !763, file: !698, line: 151)
!763 = !DISubprogram(name: "malloc", scope: !693, file: !693, line: 540, type: !764, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!764 = !DISubroutineType(types: !765)
!765 = !{!104, !100}
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !767, file: !698, line: 153)
!767 = !DISubprogram(name: "mblen", scope: !693, file: !693, line: 930, type: !768, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!768 = !DISubroutineType(types: !769)
!769 = !{!11, !82, !100}
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !771, file: !698, line: 154)
!771 = !DISubprogram(name: "mbstowcs", scope: !693, file: !693, line: 941, type: !772, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!772 = !DISubroutineType(types: !773)
!773 = !{!100, !272, !81, !100}
!774 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !775, file: !698, line: 155)
!775 = !DISubprogram(name: "mbtowc", scope: !693, file: !693, line: 933, type: !776, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!776 = !DISubroutineType(types: !777)
!777 = !{!11, !272, !81, !100}
!778 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !779, file: !698, line: 157)
!779 = !DISubprogram(name: "qsort", scope: !693, file: !693, line: 838, type: !780, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!780 = !DISubroutineType(types: !781)
!781 = !{null, !104, !100, !100, !730}
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !783, file: !698, line: 160)
!783 = !DISubprogram(name: "quick_exit", scope: !693, file: !693, line: 630, type: !744, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !785, file: !698, line: 163)
!785 = !DISubprogram(name: "rand", scope: !693, file: !693, line: 454, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !787, file: !698, line: 164)
!787 = !DISubprogram(name: "realloc", scope: !693, file: !693, line: 551, type: !788, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!788 = !DISubroutineType(types: !789)
!789 = !{!104, !104, !100}
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !791, file: !698, line: 165)
!791 = !DISubprogram(name: "srand", scope: !693, file: !693, line: 456, type: !792, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!792 = !DISubroutineType(types: !793)
!793 = !{null, !200}
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !795, file: !698, line: 166)
!795 = !DISubprogram(name: "strtod", scope: !693, file: !693, line: 118, type: !796, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!796 = !DISubroutineType(types: !797)
!797 = !{!415, !81, !798}
!798 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !799)
!799 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !801, file: !698, line: 167)
!801 = !DISubprogram(name: "strtol", scope: !693, file: !693, line: 177, type: !802, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!802 = !DISubroutineType(types: !803)
!803 = !{!115, !81, !798, !11}
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !805, file: !698, line: 168)
!805 = !DISubprogram(name: "strtoul", scope: !693, file: !693, line: 181, type: !806, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!806 = !DISubroutineType(types: !807)
!807 = !{!102, !81, !798, !11}
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !809, file: !698, line: 169)
!809 = !DISubprogram(name: "system", scope: !693, file: !693, line: 791, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !811, file: !698, line: 171)
!811 = !DISubprogram(name: "wcstombs", scope: !693, file: !693, line: 945, type: !812, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!812 = !DISubroutineType(types: !813)
!813 = !{!100, !76, !282, !100}
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !815, file: !698, line: 172)
!815 = !DISubprogram(name: "wctomb", scope: !693, file: !693, line: 937, type: !816, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!816 = !DISubroutineType(types: !817)
!817 = !{!11, !74, !271}
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !819, file: !698, line: 200)
!819 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !693, line: 81, baseType: !820)
!820 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !693, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !821, identifier: "_ZTS7lldiv_t")
!821 = !{!822, !823}
!822 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !820, file: !693, line: 79, baseType: !486, size: 64)
!823 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !820, file: !693, line: 80, baseType: !486, size: 64, offset: 64)
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !825, file: !698, line: 206)
!825 = !DISubprogram(name: "_Exit", scope: !693, file: !693, line: 636, type: !744, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !827, file: !698, line: 210)
!827 = !DISubprogram(name: "llabs", scope: !693, file: !693, line: 852, type: !828, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!828 = !DISubroutineType(types: !829)
!829 = !{!486, !486}
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !831, file: !698, line: 216)
!831 = !DISubprogram(name: "lldiv", scope: !693, file: !693, line: 866, type: !832, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!832 = !DISubroutineType(types: !833)
!833 = !{!819, !486, !486}
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !835, file: !698, line: 227)
!835 = !DISubprogram(name: "atoll", scope: !693, file: !693, line: 113, type: !836, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!836 = !DISubroutineType(types: !837)
!837 = !{!486, !82}
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !839, file: !698, line: 228)
!839 = !DISubprogram(name: "strtoll", scope: !693, file: !693, line: 201, type: !840, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!840 = !DISubroutineType(types: !841)
!841 = !{!486, !81, !798, !11}
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !843, file: !698, line: 229)
!843 = !DISubprogram(name: "strtoull", scope: !693, file: !693, line: 206, type: !844, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!844 = !DISubroutineType(types: !845)
!845 = !{!491, !81, !798, !11}
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !847, file: !698, line: 231)
!847 = !DISubprogram(name: "strtof", scope: !693, file: !693, line: 124, type: !848, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!848 = !DISubroutineType(types: !849)
!849 = !{!422, !81, !798}
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !213, entity: !851, file: !698, line: 232)
!851 = !DISubprogram(name: "strtold", scope: !693, file: !693, line: 127, type: !852, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!852 = !DISubroutineType(types: !853)
!853 = !{!481, !81, !798}
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !819, file: !698, line: 240)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !825, file: !698, line: 242)
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !827, file: !698, line: 244)
!857 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !858, file: !698, line: 245)
!858 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !213, file: !698, line: 213, type: !832, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!859 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !831, file: !698, line: 246)
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !835, file: !698, line: 248)
!861 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !847, file: !698, line: 249)
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !839, file: !698, line: 250)
!863 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !843, file: !698, line: 251)
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !851, file: !698, line: 252)
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !866, file: !870, line: 82)
!866 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !867, line: 48, baseType: !868)
!867 = !DIFile(filename: "/usr/include/wctype.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!868 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !869, size: 64)
!869 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !578)
!870 = !DIFile(filename: "/usr/include/c++/11/cwctype", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !872, file: !870, line: 83)
!872 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !873, line: 38, baseType: !102)
!873 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !252, file: !870, line: 84)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !876, file: !870, line: 86)
!876 = !DISubprogram(name: "iswalnum", scope: !873, file: !873, line: 95, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !878, file: !870, line: 87)
!878 = !DISubprogram(name: "iswalpha", scope: !873, file: !873, line: 101, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !880, file: !870, line: 89)
!880 = !DISubprogram(name: "iswblank", scope: !873, file: !873, line: 146, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !882, file: !870, line: 91)
!882 = !DISubprogram(name: "iswcntrl", scope: !873, file: !873, line: 104, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !884, file: !870, line: 92)
!884 = !DISubprogram(name: "iswctype", scope: !873, file: !873, line: 159, type: !885, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!885 = !DISubroutineType(types: !886)
!886 = !{!11, !252, !872}
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !888, file: !870, line: 93)
!888 = !DISubprogram(name: "iswdigit", scope: !873, file: !873, line: 108, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !890, file: !870, line: 94)
!890 = !DISubprogram(name: "iswgraph", scope: !873, file: !873, line: 112, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !892, file: !870, line: 95)
!892 = !DISubprogram(name: "iswlower", scope: !873, file: !873, line: 117, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !894, file: !870, line: 96)
!894 = !DISubprogram(name: "iswprint", scope: !873, file: !873, line: 120, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !896, file: !870, line: 97)
!896 = !DISubprogram(name: "iswpunct", scope: !873, file: !873, line: 125, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !898, file: !870, line: 98)
!898 = !DISubprogram(name: "iswspace", scope: !873, file: !873, line: 130, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !900, file: !870, line: 99)
!900 = !DISubprogram(name: "iswupper", scope: !873, file: !873, line: 135, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !902, file: !870, line: 100)
!902 = !DISubprogram(name: "iswxdigit", scope: !873, file: !873, line: 140, type: !441, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !904, file: !870, line: 101)
!904 = !DISubprogram(name: "towctrans", scope: !867, file: !867, line: 55, type: !905, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!905 = !DISubroutineType(types: !906)
!906 = !{!252, !252, !866}
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !908, file: !870, line: 102)
!908 = !DISubprogram(name: "towlower", scope: !873, file: !873, line: 166, type: !909, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!909 = !DISubroutineType(types: !910)
!910 = !{!252, !252}
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !912, file: !870, line: 103)
!912 = !DISubprogram(name: "towupper", scope: !873, file: !873, line: 169, type: !909, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !914, file: !870, line: 104)
!914 = !DISubprogram(name: "wctrans", scope: !867, file: !867, line: 52, type: !915, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!915 = !DISubroutineType(types: !916)
!916 = !{!866, !82}
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !918, file: !870, line: 105)
!918 = !DISubprogram(name: "wctype", scope: !873, file: !873, line: 155, type: !919, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!919 = !DISubroutineType(types: !920)
!920 = !{!872, !82}
!921 = !{i32 2, !"Dwarf Version", i32 4}
!922 = !{i32 2, !"Debug Info Version", i32 3}
!923 = !{i32 1, !"wchar_size", i32 4}
!924 = !{i32 7, !"PIC Level", i32 2}
!925 = !{!"clang version 7.0.0 "}
!926 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !3, file: !3, line: 74, type: !707, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!927 = !DILocation(line: 74, column: 25, scope: !926)
!928 = distinct !DISubprogram(name: "check_results", linkageName: "_Z13check_resultsPhPKhi", scope: !29, file: !29, line: 14, type: !929, isLocal: false, isDefinition: true, scopeLine: 15, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!929 = !DISubroutineType(types: !930)
!930 = !{null, !931, !934, !11}
!931 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !932, size: 64)
!932 = !DIDerivedType(tag: DW_TAG_typedef, name: "LabelType", file: !933, line: 18, baseType: !612)
!933 = !DIFile(filename: "../src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!934 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !935, size: 64)
!935 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !932)
!936 = !DILocalVariable(name: "result", arg: 1, scope: !928, file: !29, line: 14, type: !931)
!937 = !DILocation(line: 14, column: 31, scope: !928)
!938 = !DILocalVariable(name: "expected", arg: 2, scope: !928, file: !29, line: 14, type: !934)
!939 = !DILocation(line: 14, column: 56, scope: !928)
!940 = !DILocalVariable(name: "cnt", arg: 3, scope: !928, file: !29, line: 14, type: !11)
!941 = !DILocation(line: 14, column: 70, scope: !928)
!942 = !DILocalVariable(name: "correct_cnt", scope: !928, file: !29, line: 16, type: !11)
!943 = !DILocation(line: 16, column: 7, scope: !928)
!944 = !DILocalVariable(name: "ofile", scope: !928, file: !29, line: 18, type: !945)
!945 = !DIDerivedType(tag: DW_TAG_typedef, name: "ofstream", scope: !2, file: !946, line: 165, baseType: !947)
!946 = !DIFile(filename: "/usr/include/c++/11/iosfwd", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!947 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ofstream<char, std::char_traits<char> >", scope: !2, file: !948, line: 1088, size: 4096, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt14basic_ofstreamIcSt11char_traitsIcEE")
!948 = !DIFile(filename: "/usr/include/c++/11/bits/fstream.tcc", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!949 = !DILocation(line: 18, column: 17, scope: !928)
!950 = !DILocation(line: 19, column: 9, scope: !928)
!951 = !DILocation(line: 20, column: 13, scope: !952)
!952 = distinct !DILexicalBlock(scope: !928, file: !29, line: 20, column: 7)
!953 = !DILocation(line: 20, column: 7, scope: !928)
!954 = !DILocalVariable(name: "i", scope: !955, file: !29, line: 22, type: !11)
!955 = distinct !DILexicalBlock(scope: !956, file: !29, line: 22, column: 5)
!956 = distinct !DILexicalBlock(scope: !952, file: !29, line: 21, column: 3)
!957 = !DILocation(line: 22, column: 14, scope: !955)
!958 = !DILocation(line: 22, column: 10, scope: !955)
!959 = !DILocation(line: 22, column: 21, scope: !960)
!960 = distinct !DILexicalBlock(scope: !955, file: !29, line: 22, column: 5)
!961 = !DILocation(line: 22, column: 25, scope: !960)
!962 = !DILocation(line: 22, column: 23, scope: !960)
!963 = !DILocation(line: 22, column: 5, scope: !955)
!964 = !DILocation(line: 24, column: 11, scope: !965)
!965 = distinct !DILexicalBlock(scope: !966, file: !29, line: 24, column: 11)
!966 = distinct !DILexicalBlock(scope: !960, file: !29, line: 23, column: 5)
!967 = !DILocation(line: 24, column: 18, scope: !965)
!968 = !DILocation(line: 24, column: 24, scope: !965)
!969 = !DILocation(line: 24, column: 33, scope: !965)
!970 = !DILocation(line: 24, column: 21, scope: !965)
!971 = !DILocation(line: 24, column: 11, scope: !966)
!972 = !DILocation(line: 25, column: 9, scope: !965)
!973 = !DILocation(line: 25, column: 15, scope: !965)
!974 = !DILocation(line: 25, column: 29, scope: !965)
!975 = !DILocation(line: 25, column: 26, scope: !965)
!976 = !DILocation(line: 25, column: 31, scope: !965)
!977 = !DILocation(line: 25, column: 57, scope: !965)
!978 = !DILocation(line: 25, column: 66, scope: !965)
!979 = !DILocation(line: 25, column: 50, scope: !965)
!980 = !DILocation(line: 25, column: 70, scope: !965)
!981 = !DILocation(line: 25, column: 94, scope: !965)
!982 = !DILocation(line: 25, column: 101, scope: !965)
!983 = !DILocation(line: 25, column: 87, scope: !965)
!984 = !DILocation(line: 25, column: 105, scope: !965)
!985 = !DILocation(line: 37, column: 1, scope: !928)
!986 = !DILocation(line: 27, column: 21, scope: !965)
!987 = !DILocation(line: 28, column: 5, scope: !966)
!988 = !DILocation(line: 22, column: 32, scope: !960)
!989 = !DILocation(line: 22, column: 5, scope: !960)
!990 = distinct !{!990, !963, !991}
!991 = !DILocation(line: 28, column: 5, scope: !955)
!992 = !DILocation(line: 30, column: 5, scope: !956)
!993 = !DILocation(line: 30, column: 11, scope: !956)
!994 = !DILocation(line: 30, column: 25, scope: !956)
!995 = !DILocation(line: 30, column: 22, scope: !956)
!996 = !DILocation(line: 30, column: 37, scope: !956)
!997 = !DILocation(line: 30, column: 49, scope: !956)
!998 = !DILocation(line: 30, column: 46, scope: !956)
!999 = !DILocation(line: 30, column: 53, scope: !956)
!1000 = !DILocation(line: 30, column: 68, scope: !956)
!1001 = !DILocation(line: 31, column: 11, scope: !956)
!1002 = !DILocation(line: 32, column: 3, scope: !956)
!1003 = !DILocation(line: 35, column: 15, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !952, file: !29, line: 34, column: 3)
!1005 = !DILocation(line: 35, column: 50, scope: !1004)
!1006 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_check_result.cpp", scope: !29, file: !29, type: !1007, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !28, variables: !30)
!1007 = !DISubroutineType(types: !30)
!1008 = !DILocation(line: 0, scope: !1006)
