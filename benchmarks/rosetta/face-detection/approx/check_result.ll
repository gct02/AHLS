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
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%union.anon = type { i64, [8 x i8] }
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
%struct.__mbstate_t = type { i32, %union.anon.0 }
%union.anon.0 = type { i32 }
%"class.std::codecvt" = type { %"class.std::__codecvt_abstract_base.base", %struct.__locale_struct* }
%"class.std::__codecvt_abstract_base.base" = type { %"class.std::locale::facet.base" }
%struct.MyRect = type { i32, i32, i32, i32 }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@__dso_handle = external hidden global i8
@.str = private unnamed_addr constant [12 x i8] c"outputs.txt\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"\0Aresult_size = \00", align 1
@.str.2 = private unnamed_addr constant [40 x i8] c"\0A [Test Bench (main) ] detected rects: \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.4 = private unnamed_addr constant [37 x i8] c"\0A-- saving output image [Start] --\0D\0A\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"\0A-- saving output image [Done] --\0D\0A\00", align 1
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str.6 = private unnamed_addr constant [30 x i8] c"Failed to create output file!\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_check_result.cpp, i8* null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" !dbg !967 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !968
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3, !dbg !968
  ret void, !dbg !968
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: noinline optnone uwtable
define void @_Z13check_resultsRiPiS0_S0_S0_PA320_hNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE(i32* dereferenceable(4) %result_size, i32* %result_x, i32* %result_y, i32* %result_w, i32* %result_h, [320 x i8]* %Data, %"class.std::__cxx11::basic_string"* %outFile) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !969 {
entry:
  %result_size.addr = alloca i32*, align 8
  %result_x.addr = alloca i32*, align 8
  %result_y.addr = alloca i32*, align 8
  %result_w.addr = alloca i32*, align 8
  %result_h.addr = alloca i32*, align 8
  %Data.addr = alloca [320 x i8]*, align 8
  %ofile = alloca %"class.std::basic_ofstream", align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %result = alloca [100 x %struct.MyRect], align 16
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %i61 = alloca i32, align 4
  %r = alloca %struct.MyRect, align 4
  %agg.tmp = alloca %struct.MyRect, align 4
  %flag = alloca i32, align 4
  store i32* %result_size, i32** %result_size.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %result_size.addr, metadata !983, metadata !DIExpression()), !dbg !984
  store i32* %result_x, i32** %result_x.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %result_x.addr, metadata !985, metadata !DIExpression()), !dbg !986
  store i32* %result_y, i32** %result_y.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %result_y.addr, metadata !987, metadata !DIExpression()), !dbg !988
  store i32* %result_w, i32** %result_w.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %result_w.addr, metadata !989, metadata !DIExpression()), !dbg !990
  store i32* %result_h, i32** %result_h.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %result_h.addr, metadata !991, metadata !DIExpression()), !dbg !992
  store [320 x i8]* %Data, [320 x i8]** %Data.addr, align 8
  call void @llvm.dbg.declare(metadata [320 x i8]** %Data.addr, metadata !993, metadata !DIExpression()), !dbg !994
  call void @llvm.dbg.declare(metadata %"class.std::__cxx11::basic_string"* %outFile, metadata !995, metadata !DIExpression()), !dbg !996
  call void @llvm.dbg.declare(metadata %"class.std::basic_ofstream"* %ofile, metadata !997, metadata !DIExpression()), !dbg !1002
  call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev(%"class.std::basic_ofstream"* %ofile), !dbg !1002
  invoke void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_ofstream"* %ofile, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 16)
          to label %invoke.cont unwind label %lpad, !dbg !1003

invoke.cont:                                      ; preds = %entry
  %call = invoke zeroext i1 @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ofstream"* %ofile)
          to label %invoke.cont1 unwind label %lpad, !dbg !1004

invoke.cont1:                                     ; preds = %invoke.cont
  br i1 %call, label %if.then, label %if.else, !dbg !1006

if.then:                                          ; preds = %invoke.cont1
  %0 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !1007
  %call3 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0))
          to label %invoke.cont2 unwind label %lpad, !dbg !1009

invoke.cont2:                                     ; preds = %if.then
  %1 = load i32*, i32** %result_size.addr, align 8, !dbg !1010
  %2 = load i32, i32* %1, align 4, !dbg !1010
  %call5 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call3, i32 %2)
          to label %invoke.cont4 unwind label %lpad, !dbg !1011

invoke.cont4:                                     ; preds = %invoke.cont2
  %call7 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call5, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont6 unwind label %lpad, !dbg !1012

invoke.cont6:                                     ; preds = %invoke.cont4
  call void @llvm.dbg.declare(metadata [100 x %struct.MyRect]* %result, metadata !1013, metadata !DIExpression()), !dbg !1024
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1025, metadata !DIExpression()), !dbg !1027
  store i32 0, i32* %j, align 4, !dbg !1027
  br label %for.cond, !dbg !1028

for.cond:                                         ; preds = %for.inc, %invoke.cont6
  %3 = load i32, i32* %j, align 4, !dbg !1029
  %cmp = icmp slt i32 %3, 100, !dbg !1031
  br i1 %cmp, label %for.body, label %for.end, !dbg !1032

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %result_x.addr, align 8, !dbg !1033
  %5 = load i32, i32* %j, align 4, !dbg !1035
  %idxprom = sext i32 %5 to i64, !dbg !1033
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !1033
  %6 = load i32, i32* %arrayidx, align 4, !dbg !1033
  %7 = load i32, i32* %j, align 4, !dbg !1036
  %idxprom8 = sext i32 %7 to i64, !dbg !1037
  %arrayidx9 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom8, !dbg !1037
  %x = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx9, i32 0, i32 0, !dbg !1038
  store i32 %6, i32* %x, align 16, !dbg !1039
  %8 = load i32*, i32** %result_y.addr, align 8, !dbg !1040
  %9 = load i32, i32* %j, align 4, !dbg !1041
  %idxprom10 = sext i32 %9 to i64, !dbg !1040
  %arrayidx11 = getelementptr inbounds i32, i32* %8, i64 %idxprom10, !dbg !1040
  %10 = load i32, i32* %arrayidx11, align 4, !dbg !1040
  %11 = load i32, i32* %j, align 4, !dbg !1042
  %idxprom12 = sext i32 %11 to i64, !dbg !1043
  %arrayidx13 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom12, !dbg !1043
  %y = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx13, i32 0, i32 1, !dbg !1044
  store i32 %10, i32* %y, align 4, !dbg !1045
  %12 = load i32*, i32** %result_w.addr, align 8, !dbg !1046
  %13 = load i32, i32* %j, align 4, !dbg !1047
  %idxprom14 = sext i32 %13 to i64, !dbg !1046
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !1046
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !1046
  %15 = load i32, i32* %j, align 4, !dbg !1048
  %idxprom16 = sext i32 %15 to i64, !dbg !1049
  %arrayidx17 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom16, !dbg !1049
  %width = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx17, i32 0, i32 2, !dbg !1050
  store i32 %14, i32* %width, align 8, !dbg !1051
  %16 = load i32*, i32** %result_h.addr, align 8, !dbg !1052
  %17 = load i32, i32* %j, align 4, !dbg !1053
  %idxprom18 = sext i32 %17 to i64, !dbg !1052
  %arrayidx19 = getelementptr inbounds i32, i32* %16, i64 %idxprom18, !dbg !1052
  %18 = load i32, i32* %arrayidx19, align 4, !dbg !1052
  %19 = load i32, i32* %j, align 4, !dbg !1054
  %idxprom20 = sext i32 %19 to i64, !dbg !1055
  %arrayidx21 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom20, !dbg !1055
  %height = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx21, i32 0, i32 3, !dbg !1056
  store i32 %18, i32* %height, align 4, !dbg !1057
  br label %for.inc, !dbg !1058

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %j, align 4, !dbg !1059
  %inc = add nsw i32 %20, 1, !dbg !1059
  store i32 %inc, i32* %j, align 4, !dbg !1059
  br label %for.cond, !dbg !1060, !llvm.loop !1061

lpad:                                             ; preds = %invoke.cont76, %if.else, %invoke.cont72, %for.end70, %for.body64, %invoke.cont58, %for.end57, %invoke.cont51, %invoke.cont46, %invoke.cont44, %invoke.cont39, %invoke.cont37, %invoke.cont32, %invoke.cont30, %invoke.cont25, %for.body24, %invoke.cont4, %invoke.cont2, %if.then, %invoke.cont, %entry
  %21 = landingpad { i8*, i32 }
          cleanup, !dbg !1063
  %22 = extractvalue { i8*, i32 } %21, 0, !dbg !1063
  store i8* %22, i8** %exn.slot, align 8, !dbg !1063
  %23 = extractvalue { i8*, i32 } %21, 1, !dbg !1063
  store i32 %23, i32* %ehselector.slot, align 4, !dbg !1063
  call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* %ofile) #3, !dbg !1063
  br label %eh.resume, !dbg !1063

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1064, metadata !DIExpression()), !dbg !1066
  store i32 0, i32* %i, align 4, !dbg !1066
  br label %for.cond22, !dbg !1067

for.cond22:                                       ; preds = %for.inc55, %for.end
  %24 = load i32, i32* %i, align 4, !dbg !1068
  %25 = load i32*, i32** %result_size.addr, align 8, !dbg !1070
  %26 = load i32, i32* %25, align 4, !dbg !1070
  %cmp23 = icmp slt i32 %24, %26, !dbg !1071
  br i1 %cmp23, label %for.body24, label %for.end57, !dbg !1072

for.body24:                                       ; preds = %for.cond22
  %27 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !1073
  %call26 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %27, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.2, i32 0, i32 0))
          to label %invoke.cont25 unwind label %lpad, !dbg !1075

invoke.cont25:                                    ; preds = %for.body24
  %28 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !1076
  %29 = load i32, i32* %i, align 4, !dbg !1077
  %idxprom27 = sext i32 %29 to i64, !dbg !1078
  %arrayidx28 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom27, !dbg !1078
  %x29 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx28, i32 0, i32 0, !dbg !1079
  %30 = load i32, i32* %x29, align 16, !dbg !1079
  %call31 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %28, i32 %30)
          to label %invoke.cont30 unwind label %lpad, !dbg !1080

invoke.cont30:                                    ; preds = %invoke.cont25
  %call33 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call31, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
          to label %invoke.cont32 unwind label %lpad, !dbg !1081

invoke.cont32:                                    ; preds = %invoke.cont30
  %31 = load i32, i32* %i, align 4, !dbg !1082
  %idxprom34 = sext i32 %31 to i64, !dbg !1083
  %arrayidx35 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom34, !dbg !1083
  %y36 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx35, i32 0, i32 1, !dbg !1084
  %32 = load i32, i32* %y36, align 4, !dbg !1084
  %call38 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call33, i32 %32)
          to label %invoke.cont37 unwind label %lpad, !dbg !1085

invoke.cont37:                                    ; preds = %invoke.cont32
  %call40 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call38, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
          to label %invoke.cont39 unwind label %lpad, !dbg !1086

invoke.cont39:                                    ; preds = %invoke.cont37
  %33 = load i32, i32* %i, align 4, !dbg !1087
  %idxprom41 = sext i32 %33 to i64, !dbg !1088
  %arrayidx42 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom41, !dbg !1088
  %width43 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx42, i32 0, i32 2, !dbg !1089
  %34 = load i32, i32* %width43, align 8, !dbg !1089
  %call45 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call40, i32 %34)
          to label %invoke.cont44 unwind label %lpad, !dbg !1090

invoke.cont44:                                    ; preds = %invoke.cont39
  %call47 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call45, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
          to label %invoke.cont46 unwind label %lpad, !dbg !1091

invoke.cont46:                                    ; preds = %invoke.cont44
  %35 = load i32, i32* %i, align 4, !dbg !1092
  %idxprom48 = sext i32 %35 to i64, !dbg !1093
  %arrayidx49 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom48, !dbg !1093
  %height50 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx49, i32 0, i32 3, !dbg !1094
  %36 = load i32, i32* %height50, align 4, !dbg !1094
  %call52 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call47, i32 %36)
          to label %invoke.cont51 unwind label %lpad, !dbg !1095

invoke.cont51:                                    ; preds = %invoke.cont46
  %37 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !1096
  %call54 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %37, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont53 unwind label %lpad, !dbg !1097

invoke.cont53:                                    ; preds = %invoke.cont51
  br label %for.inc55, !dbg !1098

for.inc55:                                        ; preds = %invoke.cont53
  %38 = load i32, i32* %i, align 4, !dbg !1099
  %inc56 = add nsw i32 %38, 1, !dbg !1099
  store i32 %inc56, i32* %i, align 4, !dbg !1099
  br label %for.cond22, !dbg !1100, !llvm.loop !1101

for.end57:                                        ; preds = %for.cond22
  invoke void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE5closeEv(%"class.std::basic_ofstream"* %ofile)
          to label %invoke.cont58 unwind label %lpad, !dbg !1103

invoke.cont58:                                    ; preds = %for.end57
  %call60 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.4, i32 0, i32 0))
          to label %invoke.cont59 unwind label %lpad, !dbg !1104

invoke.cont59:                                    ; preds = %invoke.cont58
  call void @llvm.dbg.declare(metadata i32* %i61, metadata !1105, metadata !DIExpression()), !dbg !1107
  store i32 0, i32* %i61, align 4, !dbg !1107
  br label %for.cond62, !dbg !1108

for.cond62:                                       ; preds = %for.inc68, %invoke.cont59
  %39 = load i32, i32* %i61, align 4, !dbg !1109
  %40 = load i32*, i32** %result_size.addr, align 8, !dbg !1111
  %41 = load i32, i32* %40, align 4, !dbg !1111
  %cmp63 = icmp slt i32 %39, %41, !dbg !1112
  br i1 %cmp63, label %for.body64, label %for.end70, !dbg !1113

for.body64:                                       ; preds = %for.cond62
  call void @llvm.dbg.declare(metadata %struct.MyRect* %r, metadata !1114, metadata !DIExpression()), !dbg !1116
  %42 = load i32, i32* %i61, align 4, !dbg !1117
  %idxprom65 = sext i32 %42 to i64, !dbg !1118
  %arrayidx66 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom65, !dbg !1118
  %43 = bitcast %struct.MyRect* %r to i8*, !dbg !1118
  %44 = bitcast %struct.MyRect* %arrayidx66 to i8*, !dbg !1118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %43, i8* align 4 %44, i64 16, i1 false), !dbg !1118
  %45 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8, !dbg !1119
  %46 = bitcast %struct.MyRect* %agg.tmp to i8*, !dbg !1120
  %47 = bitcast %struct.MyRect* %r to i8*, !dbg !1120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %46, i8* align 4 %47, i64 16, i1 false), !dbg !1120
  %48 = bitcast %struct.MyRect* %agg.tmp to { i64, i64 }*, !dbg !1121
  %49 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %48, i32 0, i32 0, !dbg !1121
  %50 = load i64, i64* %49, align 4, !dbg !1121
  %51 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %48, i32 0, i32 1, !dbg !1121
  %52 = load i64, i64* %51, align 4, !dbg !1121
  invoke void @drawRectangle([320 x i8]* %45, i64 %50, i64 %52)
          to label %invoke.cont67 unwind label %lpad, !dbg !1121

invoke.cont67:                                    ; preds = %for.body64
  br label %for.inc68, !dbg !1122

for.inc68:                                        ; preds = %invoke.cont67
  %53 = load i32, i32* %i61, align 4, !dbg !1123
  %inc69 = add nsw i32 %53, 1, !dbg !1123
  store i32 %inc69, i32* %i61, align 4, !dbg !1123
  br label %for.cond62, !dbg !1124, !llvm.loop !1125

for.end70:                                        ; preds = %for.cond62
  call void @llvm.dbg.declare(metadata i32* %flag, metadata !1127, metadata !DIExpression()), !dbg !1128
  %call71 = call i8* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%"class.std::__cxx11::basic_string"* %outFile) #3, !dbg !1129
  %54 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8, !dbg !1130
  %call73 = invoke i32 @writePgm(i8* %call71, [320 x i8]* %54)
          to label %invoke.cont72 unwind label %lpad, !dbg !1131

invoke.cont72:                                    ; preds = %for.end70
  store i32 %call73, i32* %flag, align 4, !dbg !1128
  %call75 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i32 0, i32 0))
          to label %invoke.cont74 unwind label %lpad, !dbg !1132

invoke.cont74:                                    ; preds = %invoke.cont72
  br label %if.end, !dbg !1133

if.else:                                          ; preds = %invoke.cont1
  %call77 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.6, i32 0, i32 0))
          to label %invoke.cont76 unwind label %lpad, !dbg !1134

invoke.cont76:                                    ; preds = %if.else
  %call79 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call77, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont78 unwind label %lpad, !dbg !1136

invoke.cont78:                                    ; preds = %invoke.cont76
  br label %if.end

if.end:                                           ; preds = %invoke.cont78, %invoke.cont74
  call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* %ofile) #3, !dbg !1063
  ret void, !dbg !1063

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !1063
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !1063
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !1063
  %lpad.val80 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !1063
  resume { i8*, i32 } %lpad.val80, !dbg !1063
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

declare i32 @printf(i8*, ...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #6

declare void @drawRectangle([320 x i8]*, i64, i64) #1

declare i32 @writePgm(i8*, [320 x i8]*) #1

; Function Attrs: nounwind
declare i8* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%"class.std::__cxx11::basic_string"*) #2

; Function Attrs: nounwind
declare void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"*) unnamed_addr #2

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_check_result.cpp() #0 section ".text.startup" !dbg !1137 {
entry:
  call void @__cxx_global_var_init(), !dbg !1139
  ret void
}

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable willreturn }
attributes #6 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!28}
!llvm.module.flags = !{!962, !963, !964, !965}
!llvm.ident = !{!966}

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
!28 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !29, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !30, globals: !31, imports: !36)
!29 = !DIFile(filename: "../src/check_result.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!30 = !{}
!31 = !{!0, !32}
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression(DW_OP_constu, 100, DW_OP_stack_value))
!33 = distinct !DIGlobalVariable(name: "RESULT_SIZE", scope: !28, file: !34, line: 15, type: !35, isLocal: true, isDefinition: true)
!34 = !DIFile(filename: "../src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!35 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!36 = !{!37, !43, !49, !54, !58, !60, !62, !64, !66, !73, !80, !87, !91, !95, !99, !108, !112, !114, !119, !125, !129, !136, !138, !142, !146, !150, !152, !156, !160, !162, !166, !168, !170, !174, !178, !182, !186, !190, !194, !196, !208, !212, !216, !221, !223, !225, !229, !233, !234, !235, !236, !237, !238, !242, !246, !252, !256, !261, !263, !268, !270, !274, !282, !286, !290, !294, !298, !302, !306, !310, !314, !318, !325, !329, !333, !335, !337, !341, !345, !351, !355, !359, !361, !368, !372, !379, !381, !385, !389, !393, !397, !402, !407, !412, !413, !414, !415, !417, !418, !419, !420, !421, !422, !423, !427, !444, !447, !452, !459, !464, !468, !472, !476, !480, !482, !484, !488, !494, !498, !504, !510, !512, !516, !520, !524, !528, !532, !534, !538, !542, !546, !548, !552, !556, !560, !562, !564, !568, !576, !580, !584, !588, !590, !596, !598, !604, !608, !612, !616, !620, !624, !628, !630, !632, !636, !640, !644, !646, !650, !654, !656, !658, !662, !666, !670, !674, !675, !676, !677, !678, !679, !680, !681, !682, !683, !684, !691, !695, !698, !701, !704, !706, !708, !710, !713, !716, !719, !722, !725, !727, !732, !736, !739, !742, !744, !746, !748, !750, !753, !756, !759, !762, !765, !767, !771, !775, !780, !784, !786, !788, !790, !792, !794, !796, !798, !800, !802, !804, !806, !808, !810, !865, !869, !875, !878, !879, !881, !883, !885, !887, !891, !893, !895, !897, !899, !901, !903, !905, !907, !911, !915, !917, !921, !925, !927, !928, !929, !930, !931, !932, !933, !938, !939, !940, !941, !942, !943, !944, !945, !946, !947, !948, !949, !950, !951, !952, !953, !954, !955, !956, !957, !958, !959, !960, !961}
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !38, file: !42, line: 98)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !39, line: 7, baseType: !40)
!39 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!40 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !41, line: 49, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!41 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!42 = !DIFile(filename: "/usr/include/c++/11/cstdio", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !44, file: !42, line: 99)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !45, line: 84, baseType: !46)
!45 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !47, line: 14, baseType: !48)
!47 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!48 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !47, line: 10, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!49 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !50, file: !42, line: 101)
!50 = !DISubprogram(name: "clearerr", scope: !45, file: !45, line: 786, type: !51, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!51 = !DISubroutineType(types: !52)
!52 = !{null, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!54 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !55, file: !42, line: 102)
!55 = !DISubprogram(name: "fclose", scope: !45, file: !45, line: 178, type: !56, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!56 = !DISubroutineType(types: !57)
!57 = !{!11, !53}
!58 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !59, file: !42, line: 103)
!59 = !DISubprogram(name: "feof", scope: !45, file: !45, line: 788, type: !56, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!60 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !61, file: !42, line: 104)
!61 = !DISubprogram(name: "ferror", scope: !45, file: !45, line: 790, type: !56, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !63, file: !42, line: 105)
!63 = !DISubprogram(name: "fflush", scope: !45, file: !45, line: 230, type: !56, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !65, file: !42, line: 106)
!65 = !DISubprogram(name: "fgetc", scope: !45, file: !45, line: 513, type: !56, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !67, file: !42, line: 107)
!67 = !DISubprogram(name: "fgetpos", scope: !45, file: !45, line: 760, type: !68, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!68 = !DISubroutineType(types: !69)
!69 = !{!11, !70, !71}
!70 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !53)
!71 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !72)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !74, file: !42, line: 108)
!74 = !DISubprogram(name: "fgets", scope: !45, file: !45, line: 592, type: !75, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !79, !11, !70}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !77)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !81, file: !42, line: 109)
!81 = !DISubprogram(name: "fopen", scope: !45, file: !45, line: 258, type: !82, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!82 = !DISubroutineType(types: !83)
!83 = !{!53, !84, !84}
!84 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !85)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !78)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !88, file: !42, line: 110)
!88 = !DISubprogram(name: "fprintf", scope: !45, file: !45, line: 350, type: !89, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!89 = !DISubroutineType(types: !90)
!90 = !{!11, !70, !84, null}
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !92, file: !42, line: 111)
!92 = !DISubprogram(name: "fputc", scope: !45, file: !45, line: 549, type: !93, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!93 = !DISubroutineType(types: !94)
!94 = !{!11, !11, !53}
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !96, file: !42, line: 112)
!96 = !DISubprogram(name: "fputs", scope: !45, file: !45, line: 655, type: !97, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!97 = !DISubroutineType(types: !98)
!98 = !{!11, !84, !70}
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !100, file: !42, line: 113)
!100 = !DISubprogram(name: "fread", scope: !45, file: !45, line: 675, type: !101, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!101 = !DISubroutineType(types: !102)
!102 = !{!103, !106, !103, !103, !70}
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !104, line: 62, baseType: !105)
!104 = !DIFile(filename: "/home/gabriel/Documents/hls-llvm-project/hls-build/lib/clang/7.0.0/include/stddef.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!105 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!106 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !107)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !109, file: !42, line: 114)
!109 = !DISubprogram(name: "freopen", scope: !45, file: !45, line: 265, type: !110, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!110 = !DISubroutineType(types: !111)
!111 = !{!53, !84, !84, !70}
!112 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !113, file: !42, line: 115)
!113 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !45, file: !45, line: 434, type: !89, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !115, file: !42, line: 116)
!115 = !DISubprogram(name: "fseek", scope: !45, file: !45, line: 713, type: !116, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!116 = !DISubroutineType(types: !117)
!117 = !{!11, !53, !118, !11}
!118 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !120, file: !42, line: 117)
!120 = !DISubprogram(name: "fsetpos", scope: !45, file: !45, line: 765, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!121 = !DISubroutineType(types: !122)
!122 = !{!11, !53, !123}
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !44)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !126, file: !42, line: 118)
!126 = !DISubprogram(name: "ftell", scope: !45, file: !45, line: 718, type: !127, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!127 = !DISubroutineType(types: !128)
!128 = !{!118, !53}
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !130, file: !42, line: 119)
!130 = !DISubprogram(name: "fwrite", scope: !45, file: !45, line: 681, type: !131, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DISubroutineType(types: !132)
!132 = !{!103, !133, !103, !103, !70}
!133 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !134)
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !135, size: 64)
!135 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !137, file: !42, line: 120)
!137 = !DISubprogram(name: "getc", scope: !45, file: !45, line: 514, type: !56, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!138 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !139, file: !42, line: 121)
!139 = !DISubprogram(name: "getchar", scope: !45, file: !45, line: 520, type: !140, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!140 = !DISubroutineType(types: !141)
!141 = !{!11}
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !143, file: !42, line: 126)
!143 = !DISubprogram(name: "perror", scope: !45, file: !45, line: 804, type: !144, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!144 = !DISubroutineType(types: !145)
!145 = !{null, !85}
!146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !147, file: !42, line: 127)
!147 = !DISubprogram(name: "printf", scope: !45, file: !45, line: 356, type: !148, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!148 = !DISubroutineType(types: !149)
!149 = !{!11, !84, null}
!150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !151, file: !42, line: 128)
!151 = !DISubprogram(name: "putc", scope: !45, file: !45, line: 550, type: !93, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !153, file: !42, line: 129)
!153 = !DISubprogram(name: "putchar", scope: !45, file: !45, line: 556, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!154 = !DISubroutineType(types: !155)
!155 = !{!11, !11}
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !157, file: !42, line: 130)
!157 = !DISubprogram(name: "puts", scope: !45, file: !45, line: 661, type: !158, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!158 = !DISubroutineType(types: !159)
!159 = !{!11, !85}
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !161, file: !42, line: 131)
!161 = !DISubprogram(name: "remove", scope: !45, file: !45, line: 152, type: !158, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !163, file: !42, line: 132)
!163 = !DISubprogram(name: "rename", scope: !45, file: !45, line: 154, type: !164, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!164 = !DISubroutineType(types: !165)
!165 = !{!11, !85, !85}
!166 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !167, file: !42, line: 133)
!167 = !DISubprogram(name: "rewind", scope: !45, file: !45, line: 723, type: !51, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!168 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !169, file: !42, line: 134)
!169 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !45, file: !45, line: 437, type: !148, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !171, file: !42, line: 135)
!171 = !DISubprogram(name: "setbuf", scope: !45, file: !45, line: 328, type: !172, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!172 = !DISubroutineType(types: !173)
!173 = !{null, !70, !79}
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !175, file: !42, line: 136)
!175 = !DISubprogram(name: "setvbuf", scope: !45, file: !45, line: 332, type: !176, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!176 = !DISubroutineType(types: !177)
!177 = !{!11, !70, !79, !11, !103}
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !179, file: !42, line: 137)
!179 = !DISubprogram(name: "sprintf", scope: !45, file: !45, line: 358, type: !180, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!180 = !DISubroutineType(types: !181)
!181 = !{!11, !79, !84, null}
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !183, file: !42, line: 138)
!183 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !45, file: !45, line: 439, type: !184, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!184 = !DISubroutineType(types: !185)
!185 = !{!11, !84, !84, null}
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !187, file: !42, line: 139)
!187 = !DISubprogram(name: "tmpfile", scope: !45, file: !45, line: 188, type: !188, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!188 = !DISubroutineType(types: !189)
!189 = !{!53}
!190 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !191, file: !42, line: 141)
!191 = !DISubprogram(name: "tmpnam", scope: !45, file: !45, line: 205, type: !192, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!192 = !DISubroutineType(types: !193)
!193 = !{!77, !77}
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !195, file: !42, line: 143)
!195 = !DISubprogram(name: "ungetc", scope: !45, file: !45, line: 668, type: !93, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !197, file: !42, line: 144)
!197 = !DISubprogram(name: "vfprintf", scope: !45, file: !45, line: 365, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!198 = !DISubroutineType(types: !199)
!199 = !{!11, !70, !84, !200}
!200 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !201, size: 64)
!201 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !29, size: 192, flags: DIFlagTypePassByValue, elements: !202, identifier: "_ZTS13__va_list_tag")
!202 = !{!203, !205, !206, !207}
!203 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !201, file: !29, baseType: !204, size: 32)
!204 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !201, file: !29, baseType: !204, size: 32, offset: 32)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !201, file: !29, baseType: !107, size: 64, offset: 64)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !201, file: !29, baseType: !107, size: 64, offset: 128)
!208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !209, file: !42, line: 145)
!209 = !DISubprogram(name: "vprintf", scope: !45, file: !45, line: 371, type: !210, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!210 = !DISubroutineType(types: !211)
!211 = !{!11, !84, !200}
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !213, file: !42, line: 146)
!213 = !DISubprogram(name: "vsprintf", scope: !45, file: !45, line: 373, type: !214, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!214 = !DISubroutineType(types: !215)
!215 = !{!11, !79, !84, !200}
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !218, file: !42, line: 175)
!217 = !DINamespace(name: "__gnu_cxx", scope: null)
!218 = !DISubprogram(name: "snprintf", scope: !45, file: !45, line: 378, type: !219, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DISubroutineType(types: !220)
!220 = !{!11, !79, !103, !84, null}
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !222, file: !42, line: 176)
!222 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !45, file: !45, line: 479, type: !198, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !224, file: !42, line: 177)
!224 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !45, file: !45, line: 484, type: !210, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !226, file: !42, line: 178)
!226 = !DISubprogram(name: "vsnprintf", scope: !45, file: !45, line: 382, type: !227, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DISubroutineType(types: !228)
!228 = !{!11, !79, !103, !84, !200}
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !230, file: !42, line: 179)
!230 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !45, file: !45, line: 487, type: !231, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!231 = !DISubroutineType(types: !232)
!232 = !{!11, !84, !84, !200}
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !218, file: !42, line: 185)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !222, file: !42, line: 186)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !224, file: !42, line: 187)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !226, file: !42, line: 188)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !230, file: !42, line: 189)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !239, file: !241, line: 52)
!239 = !DISubprogram(name: "abs", scope: !240, file: !240, line: 848, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!240 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!241 = !DIFile(filename: "/usr/include/c++/11/bits/std_abs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !243, file: !245, line: 127)
!243 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !240, line: 63, baseType: !244)
!244 = !DICompositeType(tag: DW_TAG_structure_type, file: !240, line: 59, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!245 = !DIFile(filename: "/usr/include/c++/11/cstdlib", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !247, file: !245, line: 128)
!247 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !240, line: 71, baseType: !248)
!248 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !240, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !249, identifier: "_ZTS6ldiv_t")
!249 = !{!250, !251}
!250 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !248, file: !240, line: 69, baseType: !118, size: 64)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !248, file: !240, line: 70, baseType: !118, size: 64, offset: 64)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !253, file: !245, line: 130)
!253 = !DISubprogram(name: "abort", scope: !240, file: !240, line: 598, type: !254, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!254 = !DISubroutineType(types: !255)
!255 = !{null}
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !257, file: !245, line: 134)
!257 = !DISubprogram(name: "atexit", scope: !240, file: !240, line: 602, type: !258, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!258 = !DISubroutineType(types: !259)
!259 = !{!11, !260}
!260 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !254, size: 64)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !262, file: !245, line: 137)
!262 = !DISubprogram(name: "at_quick_exit", scope: !240, file: !240, line: 607, type: !258, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !264, file: !245, line: 140)
!264 = !DISubprogram(name: "atof", scope: !240, file: !240, line: 102, type: !265, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!265 = !DISubroutineType(types: !266)
!266 = !{!267, !85}
!267 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !269, file: !245, line: 141)
!269 = !DISubprogram(name: "atoi", scope: !240, file: !240, line: 105, type: !158, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !271, file: !245, line: 142)
!271 = !DISubprogram(name: "atol", scope: !240, file: !240, line: 108, type: !272, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!272 = !DISubroutineType(types: !273)
!273 = !{!118, !85}
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !275, file: !245, line: 143)
!275 = !DISubprogram(name: "bsearch", scope: !240, file: !240, line: 828, type: !276, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!276 = !DISubroutineType(types: !277)
!277 = !{!107, !134, !134, !103, !103, !278}
!278 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !240, line: 816, baseType: !279)
!279 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !280, size: 64)
!280 = !DISubroutineType(types: !281)
!281 = !{!11, !134, !134}
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !283, file: !245, line: 144)
!283 = !DISubprogram(name: "calloc", scope: !240, file: !240, line: 543, type: !284, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DISubroutineType(types: !285)
!285 = !{!107, !103, !103}
!286 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !287, file: !245, line: 145)
!287 = !DISubprogram(name: "div", scope: !240, file: !240, line: 860, type: !288, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!288 = !DISubroutineType(types: !289)
!289 = !{!243, !11, !11}
!290 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !291, file: !245, line: 146)
!291 = !DISubprogram(name: "exit", scope: !240, file: !240, line: 624, type: !292, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!292 = !DISubroutineType(types: !293)
!293 = !{null, !11}
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !295, file: !245, line: 147)
!295 = !DISubprogram(name: "free", scope: !240, file: !240, line: 555, type: !296, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!296 = !DISubroutineType(types: !297)
!297 = !{null, !107}
!298 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !299, file: !245, line: 148)
!299 = !DISubprogram(name: "getenv", scope: !240, file: !240, line: 641, type: !300, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!300 = !DISubroutineType(types: !301)
!301 = !{!77, !85}
!302 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !303, file: !245, line: 149)
!303 = !DISubprogram(name: "labs", scope: !240, file: !240, line: 849, type: !304, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!304 = !DISubroutineType(types: !305)
!305 = !{!118, !118}
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !307, file: !245, line: 150)
!307 = !DISubprogram(name: "ldiv", scope: !240, file: !240, line: 862, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DISubroutineType(types: !309)
!309 = !{!247, !118, !118}
!310 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !311, file: !245, line: 151)
!311 = !DISubprogram(name: "malloc", scope: !240, file: !240, line: 540, type: !312, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!312 = !DISubroutineType(types: !313)
!313 = !{!107, !103}
!314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !315, file: !245, line: 153)
!315 = !DISubprogram(name: "mblen", scope: !240, file: !240, line: 930, type: !316, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!316 = !DISubroutineType(types: !317)
!317 = !{!11, !85, !103}
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !319, file: !245, line: 154)
!319 = !DISubprogram(name: "mbstowcs", scope: !240, file: !240, line: 941, type: !320, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!320 = !DISubroutineType(types: !321)
!321 = !{!103, !322, !84, !103}
!322 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !323)
!323 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !324, size: 64)
!324 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !326, file: !245, line: 155)
!326 = !DISubprogram(name: "mbtowc", scope: !240, file: !240, line: 933, type: !327, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!327 = !DISubroutineType(types: !328)
!328 = !{!11, !322, !84, !103}
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !330, file: !245, line: 157)
!330 = !DISubprogram(name: "qsort", scope: !240, file: !240, line: 838, type: !331, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!331 = !DISubroutineType(types: !332)
!332 = !{null, !107, !103, !103, !278}
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !334, file: !245, line: 160)
!334 = !DISubprogram(name: "quick_exit", scope: !240, file: !240, line: 630, type: !292, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !336, file: !245, line: 163)
!336 = !DISubprogram(name: "rand", scope: !240, file: !240, line: 454, type: !140, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !338, file: !245, line: 164)
!338 = !DISubprogram(name: "realloc", scope: !240, file: !240, line: 551, type: !339, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!339 = !DISubroutineType(types: !340)
!340 = !{!107, !107, !103}
!341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !342, file: !245, line: 165)
!342 = !DISubprogram(name: "srand", scope: !240, file: !240, line: 456, type: !343, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!343 = !DISubroutineType(types: !344)
!344 = !{null, !204}
!345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !346, file: !245, line: 166)
!346 = !DISubprogram(name: "strtod", scope: !240, file: !240, line: 118, type: !347, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!347 = !DISubroutineType(types: !348)
!348 = !{!267, !84, !349}
!349 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !350)
!350 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !352, file: !245, line: 167)
!352 = !DISubprogram(name: "strtol", scope: !240, file: !240, line: 177, type: !353, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!353 = !DISubroutineType(types: !354)
!354 = !{!118, !84, !349, !11}
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !356, file: !245, line: 168)
!356 = !DISubprogram(name: "strtoul", scope: !240, file: !240, line: 181, type: !357, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!357 = !DISubroutineType(types: !358)
!358 = !{!105, !84, !349, !11}
!359 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !360, file: !245, line: 169)
!360 = !DISubprogram(name: "system", scope: !240, file: !240, line: 791, type: !158, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !362, file: !245, line: 171)
!362 = !DISubprogram(name: "wcstombs", scope: !240, file: !240, line: 945, type: !363, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!363 = !DISubroutineType(types: !364)
!364 = !{!103, !79, !365, !103}
!365 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !366)
!366 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !367, size: 64)
!367 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !324)
!368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !369, file: !245, line: 172)
!369 = !DISubprogram(name: "wctomb", scope: !240, file: !240, line: 937, type: !370, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!370 = !DISubroutineType(types: !371)
!371 = !{!11, !77, !324}
!372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !373, file: !245, line: 200)
!373 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !240, line: 81, baseType: !374)
!374 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !240, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !375, identifier: "_ZTS7lldiv_t")
!375 = !{!376, !378}
!376 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !374, file: !240, line: 79, baseType: !377, size: 64)
!377 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!378 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !374, file: !240, line: 80, baseType: !377, size: 64, offset: 64)
!379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !380, file: !245, line: 206)
!380 = !DISubprogram(name: "_Exit", scope: !240, file: !240, line: 636, type: !292, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !382, file: !245, line: 210)
!382 = !DISubprogram(name: "llabs", scope: !240, file: !240, line: 852, type: !383, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!383 = !DISubroutineType(types: !384)
!384 = !{!377, !377}
!385 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !386, file: !245, line: 216)
!386 = !DISubprogram(name: "lldiv", scope: !240, file: !240, line: 866, type: !387, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!387 = !DISubroutineType(types: !388)
!388 = !{!373, !377, !377}
!389 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !390, file: !245, line: 227)
!390 = !DISubprogram(name: "atoll", scope: !240, file: !240, line: 113, type: !391, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!391 = !DISubroutineType(types: !392)
!392 = !{!377, !85}
!393 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !394, file: !245, line: 228)
!394 = !DISubprogram(name: "strtoll", scope: !240, file: !240, line: 201, type: !395, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!395 = !DISubroutineType(types: !396)
!396 = !{!377, !84, !349, !11}
!397 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !398, file: !245, line: 229)
!398 = !DISubprogram(name: "strtoull", scope: !240, file: !240, line: 206, type: !399, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!399 = !DISubroutineType(types: !400)
!400 = !{!401, !84, !349, !11}
!401 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!402 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !403, file: !245, line: 231)
!403 = !DISubprogram(name: "strtof", scope: !240, file: !240, line: 124, type: !404, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!404 = !DISubroutineType(types: !405)
!405 = !{!406, !84, !349}
!406 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !408, file: !245, line: 232)
!408 = !DISubprogram(name: "strtold", scope: !240, file: !240, line: 127, type: !409, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!409 = !DISubroutineType(types: !410)
!410 = !{!411, !84, !349}
!411 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !373, file: !245, line: 240)
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !380, file: !245, line: 242)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !382, file: !245, line: 244)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !416, file: !245, line: 245)
!416 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !217, file: !245, line: 213, type: !387, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !386, file: !245, line: 246)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !390, file: !245, line: 248)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !403, file: !245, line: 249)
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !394, file: !245, line: 250)
!421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !398, file: !245, line: 251)
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !408, file: !245, line: 252)
!423 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !424, entity: !425, file: !426, line: 58)
!424 = !DINamespace(name: "__gnu_debug", scope: null)
!425 = !DINamespace(name: "__debug", scope: !2)
!426 = !DIFile(filename: "/usr/include/c++/11/debug/debug.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !428, file: !443, line: 64)
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !429, line: 6, baseType: !430)
!429 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!430 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !431, line: 21, baseType: !432)
!431 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!432 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !431, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !433, identifier: "_ZTS11__mbstate_t")
!433 = !{!434, !435}
!434 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !432, file: !431, line: 15, baseType: !11, size: 32)
!435 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !432, file: !431, line: 20, baseType: !436, size: 32, offset: 32)
!436 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !432, file: !431, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !437, identifier: "_ZTSN11__mbstate_tUt_E")
!437 = !{!438, !439}
!438 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !436, file: !431, line: 18, baseType: !204, size: 32)
!439 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !436, file: !431, line: 19, baseType: !440, size: 32)
!440 = !DICompositeType(tag: DW_TAG_array_type, baseType: !78, size: 32, elements: !441)
!441 = !{!442}
!442 = !DISubrange(count: 4)
!443 = !DIFile(filename: "/usr/include/c++/11/cwchar", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !445, file: !443, line: 141)
!445 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !446, line: 20, baseType: !204)
!446 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !448, file: !443, line: 143)
!448 = !DISubprogram(name: "btowc", scope: !449, file: !449, line: 285, type: !450, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!449 = !DIFile(filename: "/usr/include/wchar.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!450 = !DISubroutineType(types: !451)
!451 = !{!445, !11}
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !453, file: !443, line: 144)
!453 = !DISubprogram(name: "fgetwc", scope: !449, file: !449, line: 744, type: !454, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!454 = !DISubroutineType(types: !455)
!455 = !{!445, !456}
!456 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !457, size: 64)
!457 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !458, line: 5, baseType: !40)
!458 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!459 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !460, file: !443, line: 145)
!460 = !DISubprogram(name: "fgetws", scope: !449, file: !449, line: 773, type: !461, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!461 = !DISubroutineType(types: !462)
!462 = !{!323, !322, !11, !463}
!463 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !456)
!464 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !465, file: !443, line: 146)
!465 = !DISubprogram(name: "fputwc", scope: !449, file: !449, line: 758, type: !466, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!466 = !DISubroutineType(types: !467)
!467 = !{!445, !324, !456}
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !469, file: !443, line: 147)
!469 = !DISubprogram(name: "fputws", scope: !449, file: !449, line: 780, type: !470, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!470 = !DISubroutineType(types: !471)
!471 = !{!11, !365, !463}
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !473, file: !443, line: 148)
!473 = !DISubprogram(name: "fwide", scope: !449, file: !449, line: 588, type: !474, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!474 = !DISubroutineType(types: !475)
!475 = !{!11, !456, !11}
!476 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !477, file: !443, line: 149)
!477 = !DISubprogram(name: "fwprintf", scope: !449, file: !449, line: 595, type: !478, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!478 = !DISubroutineType(types: !479)
!479 = !{!11, !463, !365, null}
!480 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !481, file: !443, line: 150)
!481 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !449, file: !449, line: 657, type: !478, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !483, file: !443, line: 151)
!483 = !DISubprogram(name: "getwc", scope: !449, file: !449, line: 745, type: !454, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !485, file: !443, line: 152)
!485 = !DISubprogram(name: "getwchar", scope: !449, file: !449, line: 751, type: !486, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!486 = !DISubroutineType(types: !487)
!487 = !{!445}
!488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !489, file: !443, line: 153)
!489 = !DISubprogram(name: "mbrlen", scope: !449, file: !449, line: 308, type: !490, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!490 = !DISubroutineType(types: !491)
!491 = !{!103, !84, !103, !492}
!492 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !493)
!493 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !428, size: 64)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !495, file: !443, line: 154)
!495 = !DISubprogram(name: "mbrtowc", scope: !449, file: !449, line: 297, type: !496, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DISubroutineType(types: !497)
!497 = !{!103, !322, !84, !103, !492}
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !499, file: !443, line: 155)
!499 = !DISubprogram(name: "mbsinit", scope: !449, file: !449, line: 293, type: !500, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DISubroutineType(types: !501)
!501 = !{!11, !502}
!502 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !503, size: 64)
!503 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !428)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !505, file: !443, line: 156)
!505 = !DISubprogram(name: "mbsrtowcs", scope: !449, file: !449, line: 338, type: !506, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!506 = !DISubroutineType(types: !507)
!507 = !{!103, !322, !508, !103, !492}
!508 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !509)
!509 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !511, file: !443, line: 157)
!511 = !DISubprogram(name: "putwc", scope: !449, file: !449, line: 759, type: !466, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !513, file: !443, line: 158)
!513 = !DISubprogram(name: "putwchar", scope: !449, file: !449, line: 765, type: !514, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DISubroutineType(types: !515)
!515 = !{!445, !324}
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !517, file: !443, line: 160)
!517 = !DISubprogram(name: "swprintf", scope: !449, file: !449, line: 605, type: !518, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!518 = !DISubroutineType(types: !519)
!519 = !{!11, !322, !103, !365, null}
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !521, file: !443, line: 162)
!521 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !449, file: !449, line: 664, type: !522, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DISubroutineType(types: !523)
!523 = !{!11, !365, !365, null}
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !525, file: !443, line: 163)
!525 = !DISubprogram(name: "ungetwc", scope: !449, file: !449, line: 788, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DISubroutineType(types: !527)
!527 = !{!445, !445, !456}
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !529, file: !443, line: 164)
!529 = !DISubprogram(name: "vfwprintf", scope: !449, file: !449, line: 613, type: !530, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DISubroutineType(types: !531)
!531 = !{!11, !463, !365, !200}
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !533, file: !443, line: 166)
!533 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !449, file: !449, line: 711, type: !530, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !535, file: !443, line: 169)
!535 = !DISubprogram(name: "vswprintf", scope: !449, file: !449, line: 626, type: !536, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!536 = !DISubroutineType(types: !537)
!537 = !{!11, !322, !103, !365, !200}
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !539, file: !443, line: 172)
!539 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !449, file: !449, line: 718, type: !540, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!540 = !DISubroutineType(types: !541)
!541 = !{!11, !365, !365, !200}
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !543, file: !443, line: 174)
!543 = !DISubprogram(name: "vwprintf", scope: !449, file: !449, line: 621, type: !544, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!544 = !DISubroutineType(types: !545)
!545 = !{!11, !365, !200}
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !547, file: !443, line: 176)
!547 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !449, file: !449, line: 715, type: !544, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !549, file: !443, line: 178)
!549 = !DISubprogram(name: "wcrtomb", scope: !449, file: !449, line: 302, type: !550, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!550 = !DISubroutineType(types: !551)
!551 = !{!103, !79, !324, !492}
!552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !553, file: !443, line: 179)
!553 = !DISubprogram(name: "wcscat", scope: !449, file: !449, line: 97, type: !554, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!554 = !DISubroutineType(types: !555)
!555 = !{!323, !322, !365}
!556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !557, file: !443, line: 180)
!557 = !DISubprogram(name: "wcscmp", scope: !449, file: !449, line: 106, type: !558, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!558 = !DISubroutineType(types: !559)
!559 = !{!11, !366, !366}
!560 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !561, file: !443, line: 181)
!561 = !DISubprogram(name: "wcscoll", scope: !449, file: !449, line: 131, type: !558, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !563, file: !443, line: 182)
!563 = !DISubprogram(name: "wcscpy", scope: !449, file: !449, line: 87, type: !554, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !565, file: !443, line: 183)
!565 = !DISubprogram(name: "wcscspn", scope: !449, file: !449, line: 188, type: !566, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!566 = !DISubroutineType(types: !567)
!567 = !{!103, !366, !366}
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !569, file: !443, line: 184)
!569 = !DISubprogram(name: "wcsftime", scope: !449, file: !449, line: 852, type: !570, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!570 = !DISubroutineType(types: !571)
!571 = !{!103, !322, !103, !365, !572}
!572 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !573)
!573 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !574, size: 64)
!574 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !575)
!575 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !449, line: 83, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !577, file: !443, line: 185)
!577 = !DISubprogram(name: "wcslen", scope: !449, file: !449, line: 223, type: !578, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!578 = !DISubroutineType(types: !579)
!579 = !{!103, !366}
!580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !581, file: !443, line: 186)
!581 = !DISubprogram(name: "wcsncat", scope: !449, file: !449, line: 101, type: !582, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!582 = !DISubroutineType(types: !583)
!583 = !{!323, !322, !365, !103}
!584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !585, file: !443, line: 187)
!585 = !DISubprogram(name: "wcsncmp", scope: !449, file: !449, line: 109, type: !586, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!586 = !DISubroutineType(types: !587)
!587 = !{!11, !366, !366, !103}
!588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !589, file: !443, line: 188)
!589 = !DISubprogram(name: "wcsncpy", scope: !449, file: !449, line: 92, type: !582, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !591, file: !443, line: 189)
!591 = !DISubprogram(name: "wcsrtombs", scope: !449, file: !449, line: 344, type: !592, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!592 = !DISubroutineType(types: !593)
!593 = !{!103, !79, !594, !103, !492}
!594 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !595)
!595 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !366, size: 64)
!596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !597, file: !443, line: 190)
!597 = !DISubprogram(name: "wcsspn", scope: !449, file: !449, line: 192, type: !566, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !599, file: !443, line: 191)
!599 = !DISubprogram(name: "wcstod", scope: !449, file: !449, line: 378, type: !600, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!600 = !DISubroutineType(types: !601)
!601 = !{!267, !365, !602}
!602 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !603)
!603 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !323, size: 64)
!604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !605, file: !443, line: 193)
!605 = !DISubprogram(name: "wcstof", scope: !449, file: !449, line: 383, type: !606, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!606 = !DISubroutineType(types: !607)
!607 = !{!406, !365, !602}
!608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !609, file: !443, line: 195)
!609 = !DISubprogram(name: "wcstok", scope: !449, file: !449, line: 218, type: !610, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!610 = !DISubroutineType(types: !611)
!611 = !{!323, !322, !365, !602}
!612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !613, file: !443, line: 196)
!613 = !DISubprogram(name: "wcstol", scope: !449, file: !449, line: 429, type: !614, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!614 = !DISubroutineType(types: !615)
!615 = !{!118, !365, !602, !11}
!616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !617, file: !443, line: 197)
!617 = !DISubprogram(name: "wcstoul", scope: !449, file: !449, line: 434, type: !618, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!618 = !DISubroutineType(types: !619)
!619 = !{!105, !365, !602, !11}
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !621, file: !443, line: 198)
!621 = !DISubprogram(name: "wcsxfrm", scope: !449, file: !449, line: 135, type: !622, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!622 = !DISubroutineType(types: !623)
!623 = !{!103, !322, !365, !103}
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !625, file: !443, line: 199)
!625 = !DISubprogram(name: "wctob", scope: !449, file: !449, line: 289, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!626 = !DISubroutineType(types: !627)
!627 = !{!11, !445}
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !629, file: !443, line: 200)
!629 = !DISubprogram(name: "wmemcmp", scope: !449, file: !449, line: 259, type: !586, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !631, file: !443, line: 201)
!631 = !DISubprogram(name: "wmemcpy", scope: !449, file: !449, line: 263, type: !582, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !633, file: !443, line: 202)
!633 = !DISubprogram(name: "wmemmove", scope: !449, file: !449, line: 268, type: !634, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!634 = !DISubroutineType(types: !635)
!635 = !{!323, !323, !366, !103}
!636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !637, file: !443, line: 203)
!637 = !DISubprogram(name: "wmemset", scope: !449, file: !449, line: 272, type: !638, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!638 = !DISubroutineType(types: !639)
!639 = !{!323, !323, !324, !103}
!640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !641, file: !443, line: 204)
!641 = !DISubprogram(name: "wprintf", scope: !449, file: !449, line: 602, type: !642, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!642 = !DISubroutineType(types: !643)
!643 = !{!11, !365, null}
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !645, file: !443, line: 205)
!645 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !449, file: !449, line: 661, type: !642, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !647, file: !443, line: 206)
!647 = !DISubprogram(name: "wcschr", scope: !449, file: !449, line: 165, type: !648, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!648 = !DISubroutineType(types: !649)
!649 = !{!323, !366, !324}
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !651, file: !443, line: 207)
!651 = !DISubprogram(name: "wcspbrk", scope: !449, file: !449, line: 202, type: !652, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!652 = !DISubroutineType(types: !653)
!653 = !{!323, !366, !366}
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !655, file: !443, line: 208)
!655 = !DISubprogram(name: "wcsrchr", scope: !449, file: !449, line: 175, type: !648, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !657, file: !443, line: 209)
!657 = !DISubprogram(name: "wcsstr", scope: !449, file: !449, line: 213, type: !652, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !659, file: !443, line: 210)
!659 = !DISubprogram(name: "wmemchr", scope: !449, file: !449, line: 254, type: !660, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!660 = !DISubroutineType(types: !661)
!661 = !{!323, !366, !324, !103}
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !663, file: !443, line: 251)
!663 = !DISubprogram(name: "wcstold", scope: !449, file: !449, line: 385, type: !664, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!664 = !DISubroutineType(types: !665)
!665 = !{!411, !365, !602}
!666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !667, file: !443, line: 260)
!667 = !DISubprogram(name: "wcstoll", scope: !449, file: !449, line: 442, type: !668, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!668 = !DISubroutineType(types: !669)
!669 = !{!377, !365, !602, !11}
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !217, entity: !671, file: !443, line: 261)
!671 = !DISubprogram(name: "wcstoull", scope: !449, file: !449, line: 449, type: !672, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!672 = !DISubroutineType(types: !673)
!673 = !{!401, !365, !602, !11}
!674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !663, file: !443, line: 267)
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !667, file: !443, line: 268)
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !671, file: !443, line: 269)
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !605, file: !443, line: 283)
!678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !533, file: !443, line: 286)
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !539, file: !443, line: 289)
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !547, file: !443, line: 292)
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !663, file: !443, line: 296)
!682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !667, file: !443, line: 297)
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !671, file: !443, line: 298)
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !685, file: !690, line: 47)
!685 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !686, line: 24, baseType: !687)
!686 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!687 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !688, line: 37, baseType: !689)
!688 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!689 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!690 = !DIFile(filename: "/usr/include/c++/11/cstdint", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !692, file: !690, line: 48)
!692 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !686, line: 25, baseType: !693)
!693 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !688, line: 39, baseType: !694)
!694 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !696, file: !690, line: 49)
!696 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !686, line: 26, baseType: !697)
!697 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !688, line: 41, baseType: !11)
!698 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !699, file: !690, line: 50)
!699 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !686, line: 27, baseType: !700)
!700 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !688, line: 44, baseType: !118)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !702, file: !690, line: 52)
!702 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !703, line: 58, baseType: !689)
!703 = !DIFile(filename: "/usr/include/stdint.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !705, file: !690, line: 53)
!705 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !703, line: 60, baseType: !118)
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !707, file: !690, line: 54)
!707 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !703, line: 61, baseType: !118)
!708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !709, file: !690, line: 55)
!709 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !703, line: 62, baseType: !118)
!710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !711, file: !690, line: 57)
!711 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !703, line: 43, baseType: !712)
!712 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !688, line: 52, baseType: !687)
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !714, file: !690, line: 58)
!714 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !703, line: 44, baseType: !715)
!715 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !688, line: 54, baseType: !693)
!716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !717, file: !690, line: 59)
!717 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !703, line: 45, baseType: !718)
!718 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !688, line: 56, baseType: !697)
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !720, file: !690, line: 60)
!720 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !703, line: 46, baseType: !721)
!721 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !688, line: 58, baseType: !700)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !723, file: !690, line: 62)
!723 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !703, line: 101, baseType: !724)
!724 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !688, line: 72, baseType: !118)
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !726, file: !690, line: 63)
!726 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !703, line: 87, baseType: !118)
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !728, file: !690, line: 65)
!728 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !729, line: 24, baseType: !730)
!729 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!730 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !688, line: 38, baseType: !731)
!731 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !733, file: !690, line: 66)
!733 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !729, line: 25, baseType: !734)
!734 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !688, line: 40, baseType: !735)
!735 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !737, file: !690, line: 67)
!737 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !729, line: 26, baseType: !738)
!738 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !688, line: 42, baseType: !204)
!739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !740, file: !690, line: 68)
!740 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !729, line: 27, baseType: !741)
!741 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !688, line: 45, baseType: !105)
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !743, file: !690, line: 70)
!743 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !703, line: 71, baseType: !731)
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !745, file: !690, line: 71)
!745 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !703, line: 73, baseType: !105)
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !747, file: !690, line: 72)
!747 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !703, line: 74, baseType: !105)
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !749, file: !690, line: 73)
!749 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !703, line: 75, baseType: !105)
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !751, file: !690, line: 75)
!751 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !703, line: 49, baseType: !752)
!752 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !688, line: 53, baseType: !730)
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !754, file: !690, line: 76)
!754 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !703, line: 50, baseType: !755)
!755 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !688, line: 55, baseType: !734)
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !757, file: !690, line: 77)
!757 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !703, line: 51, baseType: !758)
!758 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !688, line: 57, baseType: !738)
!759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !760, file: !690, line: 78)
!760 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !703, line: 52, baseType: !761)
!761 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !688, line: 59, baseType: !741)
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !763, file: !690, line: 80)
!763 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !703, line: 102, baseType: !764)
!764 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !688, line: 73, baseType: !105)
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !766, file: !690, line: 81)
!766 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !703, line: 90, baseType: !105)
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !768, file: !770, line: 53)
!768 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !769, line: 51, size: 768, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!769 = !DIFile(filename: "/usr/include/locale.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!770 = !DIFile(filename: "/usr/include/c++/11/clocale", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !772, file: !770, line: 54)
!772 = !DISubprogram(name: "setlocale", scope: !769, file: !769, line: 122, type: !773, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!773 = !DISubroutineType(types: !774)
!774 = !{!77, !11, !85}
!775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !776, file: !770, line: 55)
!776 = !DISubprogram(name: "localeconv", scope: !769, file: !769, line: 125, type: !777, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!777 = !DISubroutineType(types: !778)
!778 = !{!779}
!779 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !768, size: 64)
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !781, file: !783, line: 64)
!781 = !DISubprogram(name: "isalnum", scope: !782, file: !782, line: 108, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!782 = !DIFile(filename: "/usr/include/ctype.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!783 = !DIFile(filename: "/usr/include/c++/11/cctype", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !785, file: !783, line: 65)
!785 = !DISubprogram(name: "isalpha", scope: !782, file: !782, line: 109, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !787, file: !783, line: 66)
!787 = !DISubprogram(name: "iscntrl", scope: !782, file: !782, line: 110, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !789, file: !783, line: 67)
!789 = !DISubprogram(name: "isdigit", scope: !782, file: !782, line: 111, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !791, file: !783, line: 68)
!791 = !DISubprogram(name: "isgraph", scope: !782, file: !782, line: 113, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !793, file: !783, line: 69)
!793 = !DISubprogram(name: "islower", scope: !782, file: !782, line: 112, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !795, file: !783, line: 70)
!795 = !DISubprogram(name: "isprint", scope: !782, file: !782, line: 114, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !797, file: !783, line: 71)
!797 = !DISubprogram(name: "ispunct", scope: !782, file: !782, line: 115, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !799, file: !783, line: 72)
!799 = !DISubprogram(name: "isspace", scope: !782, file: !782, line: 116, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !801, file: !783, line: 73)
!801 = !DISubprogram(name: "isupper", scope: !782, file: !782, line: 117, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !803, file: !783, line: 74)
!803 = !DISubprogram(name: "isxdigit", scope: !782, file: !782, line: 118, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !805, file: !783, line: 75)
!805 = !DISubprogram(name: "tolower", scope: !782, file: !782, line: 122, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !807, file: !783, line: 76)
!807 = !DISubprogram(name: "toupper", scope: !782, file: !782, line: 125, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !809, file: !783, line: 87)
!809 = !DISubprogram(name: "isblank", scope: !782, file: !782, line: 130, type: !154, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !811, file: !812, line: 68)
!811 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !813, file: !812, line: 90, size: 64, flags: DIFlagTypePassByReference, elements: !814, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!812 = !DIFile(filename: "/usr/include/c++/11/bits/exception_ptr.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!813 = !DINamespace(name: "__exception_ptr", scope: !2)
!814 = !{!815, !816, !820, !823, !824, !829, !830, !834, !840, !844, !848, !851, !852, !855, !858}
!815 = !DIDerivedType(tag: DW_TAG_member, name: "_M_exception_object", scope: !811, file: !812, line: 92, baseType: !107, size: 64)
!816 = !DISubprogram(name: "exception_ptr", scope: !811, file: !812, line: 94, type: !817, isLocal: false, isDefinition: false, scopeLine: 94, flags: DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!817 = !DISubroutineType(types: !818)
!818 = !{null, !819, !107}
!819 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !811, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!820 = !DISubprogram(name: "_M_addref", linkageName: "_ZNSt15__exception_ptr13exception_ptr9_M_addrefEv", scope: !811, file: !812, line: 96, type: !821, isLocal: false, isDefinition: false, scopeLine: 96, flags: DIFlagPrototyped, isOptimized: false)
!821 = !DISubroutineType(types: !822)
!822 = !{null, !819}
!823 = !DISubprogram(name: "_M_release", linkageName: "_ZNSt15__exception_ptr13exception_ptr10_M_releaseEv", scope: !811, file: !812, line: 97, type: !821, isLocal: false, isDefinition: false, scopeLine: 97, flags: DIFlagPrototyped, isOptimized: false)
!824 = !DISubprogram(name: "_M_get", linkageName: "_ZNKSt15__exception_ptr13exception_ptr6_M_getEv", scope: !811, file: !812, line: 99, type: !825, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPrototyped, isOptimized: false)
!825 = !DISubroutineType(types: !826)
!826 = !{!107, !827}
!827 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !828, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!828 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !811)
!829 = !DISubprogram(name: "exception_ptr", scope: !811, file: !812, line: 107, type: !821, isLocal: false, isDefinition: false, scopeLine: 107, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!830 = !DISubprogram(name: "exception_ptr", scope: !811, file: !812, line: 109, type: !831, isLocal: false, isDefinition: false, scopeLine: 109, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!831 = !DISubroutineType(types: !832)
!832 = !{null, !819, !833}
!833 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !828, size: 64)
!834 = !DISubprogram(name: "exception_ptr", scope: !811, file: !812, line: 112, type: !835, isLocal: false, isDefinition: false, scopeLine: 112, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!835 = !DISubroutineType(types: !836)
!836 = !{null, !819, !837}
!837 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !2, file: !838, line: 302, baseType: !839)
!838 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/c++config.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!839 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!840 = !DISubprogram(name: "exception_ptr", scope: !811, file: !812, line: 116, type: !841, isLocal: false, isDefinition: false, scopeLine: 116, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!841 = !DISubroutineType(types: !842)
!842 = !{null, !819, !843}
!843 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !811, size: 64)
!844 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSERKS0_", scope: !811, file: !812, line: 129, type: !845, isLocal: false, isDefinition: false, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!845 = !DISubroutineType(types: !846)
!846 = !{!847, !819, !833}
!847 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !811, size: 64)
!848 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSEOS0_", scope: !811, file: !812, line: 133, type: !849, isLocal: false, isDefinition: false, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!849 = !DISubroutineType(types: !850)
!850 = !{!847, !819, !843}
!851 = !DISubprogram(name: "~exception_ptr", scope: !811, file: !812, line: 140, type: !821, isLocal: false, isDefinition: false, scopeLine: 140, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!852 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr13exception_ptr4swapERS0_", scope: !811, file: !812, line: 143, type: !853, isLocal: false, isDefinition: false, scopeLine: 143, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!853 = !DISubroutineType(types: !854)
!854 = !{null, !819, !847}
!855 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt15__exception_ptr13exception_ptrcvbEv", scope: !811, file: !812, line: 155, type: !856, isLocal: false, isDefinition: false, scopeLine: 155, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!856 = !DISubroutineType(types: !857)
!857 = !{!13, !827}
!858 = !DISubprogram(name: "__cxa_exception_type", linkageName: "_ZNKSt15__exception_ptr13exception_ptr20__cxa_exception_typeEv", scope: !811, file: !812, line: 176, type: !859, isLocal: false, isDefinition: false, scopeLine: 176, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!859 = !DISubroutineType(types: !860)
!860 = !{!861, !827}
!861 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !862, size: 64)
!862 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !863)
!863 = !DICompositeType(tag: DW_TAG_class_type, name: "type_info", scope: !2, file: !864, line: 88, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt9type_info")
!864 = !DIFile(filename: "/usr/include/c++/11/typeinfo", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!865 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !813, entity: !866, file: !812, line: 84)
!866 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !2, file: !812, line: 80, type: !867, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!867 = !DISubroutineType(types: !868)
!868 = !{null, !811}
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !870, file: !874, line: 82)
!870 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !871, line: 48, baseType: !872)
!871 = !DIFile(filename: "/usr/include/wctype.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!872 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !873, size: 64)
!873 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !697)
!874 = !DIFile(filename: "/usr/include/c++/11/cwctype", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !876, file: !874, line: 83)
!876 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !877, line: 38, baseType: !105)
!877 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !445, file: !874, line: 84)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !880, file: !874, line: 86)
!880 = !DISubprogram(name: "iswalnum", scope: !877, file: !877, line: 95, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !882, file: !874, line: 87)
!882 = !DISubprogram(name: "iswalpha", scope: !877, file: !877, line: 101, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !884, file: !874, line: 89)
!884 = !DISubprogram(name: "iswblank", scope: !877, file: !877, line: 146, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !886, file: !874, line: 91)
!886 = !DISubprogram(name: "iswcntrl", scope: !877, file: !877, line: 104, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !888, file: !874, line: 92)
!888 = !DISubprogram(name: "iswctype", scope: !877, file: !877, line: 159, type: !889, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!889 = !DISubroutineType(types: !890)
!890 = !{!11, !445, !876}
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !892, file: !874, line: 93)
!892 = !DISubprogram(name: "iswdigit", scope: !877, file: !877, line: 108, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !894, file: !874, line: 94)
!894 = !DISubprogram(name: "iswgraph", scope: !877, file: !877, line: 112, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !896, file: !874, line: 95)
!896 = !DISubprogram(name: "iswlower", scope: !877, file: !877, line: 117, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !898, file: !874, line: 96)
!898 = !DISubprogram(name: "iswprint", scope: !877, file: !877, line: 120, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !900, file: !874, line: 97)
!900 = !DISubprogram(name: "iswpunct", scope: !877, file: !877, line: 125, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !902, file: !874, line: 98)
!902 = !DISubprogram(name: "iswspace", scope: !877, file: !877, line: 130, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !904, file: !874, line: 99)
!904 = !DISubprogram(name: "iswupper", scope: !877, file: !877, line: 135, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !906, file: !874, line: 100)
!906 = !DISubprogram(name: "iswxdigit", scope: !877, file: !877, line: 140, type: !626, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !908, file: !874, line: 101)
!908 = !DISubprogram(name: "towctrans", scope: !871, file: !871, line: 55, type: !909, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!909 = !DISubroutineType(types: !910)
!910 = !{!445, !445, !870}
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !912, file: !874, line: 102)
!912 = !DISubprogram(name: "towlower", scope: !877, file: !877, line: 166, type: !913, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!913 = !DISubroutineType(types: !914)
!914 = !{!445, !445}
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !916, file: !874, line: 103)
!916 = !DISubprogram(name: "towupper", scope: !877, file: !877, line: 169, type: !913, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !918, file: !874, line: 104)
!918 = !DISubprogram(name: "wctrans", scope: !871, file: !871, line: 52, type: !919, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!919 = !DISubroutineType(types: !920)
!920 = !{!870, !85}
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !922, file: !874, line: 105)
!922 = !DISubprogram(name: "wctype", scope: !877, file: !877, line: 155, type: !923, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!923 = !DISubroutineType(types: !924)
!924 = !{!876, !85}
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !253, file: !926, line: 38)
!926 = !DIFile(filename: "/usr/include/c++/11/stdlib.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !257, file: !926, line: 39)
!928 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !291, file: !926, line: 40)
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !262, file: !926, line: 43)
!930 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !334, file: !926, line: 46)
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !243, file: !926, line: 51)
!932 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !247, file: !926, line: 52)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !934, file: !926, line: 54)
!934 = !DISubprogram(name: "abs", linkageName: "_ZSt3absg", scope: !2, file: !241, line: 103, type: !935, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!935 = !DISubroutineType(types: !936)
!936 = !{!937, !937}
!937 = !DIBasicType(name: "__float128", size: 128, encoding: DW_ATE_float)
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !264, file: !926, line: 55)
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !269, file: !926, line: 56)
!940 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !271, file: !926, line: 57)
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !275, file: !926, line: 58)
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !283, file: !926, line: 59)
!943 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !416, file: !926, line: 60)
!944 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !295, file: !926, line: 61)
!945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !299, file: !926, line: 62)
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !303, file: !926, line: 63)
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !307, file: !926, line: 64)
!948 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !311, file: !926, line: 65)
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !315, file: !926, line: 67)
!950 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !319, file: !926, line: 68)
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !326, file: !926, line: 69)
!952 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !330, file: !926, line: 71)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !336, file: !926, line: 72)
!954 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !338, file: !926, line: 73)
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !342, file: !926, line: 74)
!956 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !346, file: !926, line: 75)
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !352, file: !926, line: 76)
!958 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !356, file: !926, line: 77)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !360, file: !926, line: 78)
!960 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !362, file: !926, line: 80)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !369, file: !926, line: 81)
!962 = !{i32 2, !"Dwarf Version", i32 4}
!963 = !{i32 2, !"Debug Info Version", i32 3}
!964 = !{i32 1, !"wchar_size", i32 4}
!965 = !{i32 7, !"PIC Level", i32 2}
!966 = !{!"clang version 7.0.0 "}
!967 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !3, file: !3, line: 74, type: !254, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!968 = !DILocation(line: 74, column: 25, scope: !967)
!969 = distinct !DISubprogram(name: "check_results", linkageName: "_Z13check_resultsRiPiS0_S0_S0_PA320_hNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE", scope: !29, file: !29, line: 19, type: !970, isLocal: false, isDefinition: true, scopeLine: 27, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!970 = !DISubroutineType(types: !971)
!971 = !{null, !972, !973, !973, !973, !973, !974, !978}
!972 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !11, size: 64)
!973 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!974 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !975, size: 64)
!975 = !DICompositeType(tag: DW_TAG_array_type, baseType: !731, size: 2560, elements: !976)
!976 = !{!977}
!977 = !DISubrange(count: 320)
!978 = !DIDerivedType(tag: DW_TAG_typedef, name: "string", scope: !2, file: !979, line: 79, baseType: !980)
!979 = !DIFile(filename: "/usr/include/c++/11/bits/stringfwd.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!980 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_string<char, std::char_traits<char>, std::allocator<char> >", scope: !982, file: !981, line: 1627, size: 256, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE")
!981 = !DIFile(filename: "/usr/include/c++/11/bits/basic_string.tcc", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!982 = !DINamespace(name: "__cxx11", scope: !2, exportSymbols: true)
!983 = !DILocalVariable(name: "result_size", arg: 1, scope: !969, file: !29, line: 20, type: !972)
!984 = !DILocation(line: 20, column: 10, scope: !969)
!985 = !DILocalVariable(name: "result_x", arg: 2, scope: !969, file: !29, line: 21, type: !973)
!986 = !DILocation(line: 21, column: 9, scope: !969)
!987 = !DILocalVariable(name: "result_y", arg: 3, scope: !969, file: !29, line: 22, type: !973)
!988 = !DILocation(line: 22, column: 9, scope: !969)
!989 = !DILocalVariable(name: "result_w", arg: 4, scope: !969, file: !29, line: 23, type: !973)
!990 = !DILocation(line: 23, column: 9, scope: !969)
!991 = !DILocalVariable(name: "result_h", arg: 5, scope: !969, file: !29, line: 24, type: !973)
!992 = !DILocation(line: 24, column: 9, scope: !969)
!993 = !DILocalVariable(name: "Data", arg: 6, scope: !969, file: !29, line: 25, type: !974)
!994 = !DILocation(line: 25, column: 19, scope: !969)
!995 = !DILocalVariable(name: "outFile", arg: 7, scope: !969, file: !29, line: 26, type: !978)
!996 = !DILocation(line: 26, column: 17, scope: !969)
!997 = !DILocalVariable(name: "ofile", scope: !969, file: !29, line: 28, type: !998)
!998 = !DIDerivedType(tag: DW_TAG_typedef, name: "ofstream", scope: !2, file: !999, line: 165, baseType: !1000)
!999 = !DIFile(filename: "/usr/include/c++/11/iosfwd", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!1000 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ofstream<char, std::char_traits<char> >", scope: !2, file: !1001, line: 1088, size: 4096, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt14basic_ofstreamIcSt11char_traitsIcEE")
!1001 = !DIFile(filename: "/usr/include/c++/11/bits/fstream.tcc", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!1002 = !DILocation(line: 28, column: 17, scope: !969)
!1003 = !DILocation(line: 29, column: 9, scope: !969)
!1004 = !DILocation(line: 30, column: 13, scope: !1005)
!1005 = distinct !DILexicalBlock(scope: !969, file: !29, line: 30, column: 7)
!1006 = !DILocation(line: 30, column: 7, scope: !969)
!1007 = !DILocation(line: 32, column: 5, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !1005, file: !29, line: 31, column: 3)
!1009 = !DILocation(line: 32, column: 11, scope: !1008)
!1010 = !DILocation(line: 32, column: 36, scope: !1008)
!1011 = !DILocation(line: 32, column: 33, scope: !1008)
!1012 = !DILocation(line: 32, column: 48, scope: !1008)
!1013 = !DILocalVariable(name: "result", scope: !1008, file: !29, line: 34, type: !1014)
!1014 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1015, size: 12800, elements: !1022)
!1015 = !DIDerivedType(tag: DW_TAG_typedef, name: "MyRect", file: !34, line: 49, baseType: !1016)
!1016 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !34, line: 43, size: 128, flags: DIFlagTypePassByValue, elements: !1017, identifier: "_ZTS6MyRect")
!1017 = !{!1018, !1019, !1020, !1021}
!1018 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !1016, file: !34, line: 45, baseType: !11, size: 32)
!1019 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !1016, file: !34, line: 46, baseType: !11, size: 32, offset: 32)
!1020 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !1016, file: !34, line: 47, baseType: !11, size: 32, offset: 64)
!1021 = !DIDerivedType(tag: DW_TAG_member, name: "height", scope: !1016, file: !34, line: 48, baseType: !11, size: 32, offset: 96)
!1022 = !{!1023}
!1023 = !DISubrange(count: 100)
!1024 = !DILocation(line: 34, column: 12, scope: !1008)
!1025 = !DILocalVariable(name: "j", scope: !1026, file: !29, line: 36, type: !11)
!1026 = distinct !DILexicalBlock(scope: !1008, file: !29, line: 36, column: 5)
!1027 = !DILocation(line: 36, column: 14, scope: !1026)
!1028 = !DILocation(line: 36, column: 10, scope: !1026)
!1029 = !DILocation(line: 36, column: 21, scope: !1030)
!1030 = distinct !DILexicalBlock(scope: !1026, file: !29, line: 36, column: 5)
!1031 = !DILocation(line: 36, column: 23, scope: !1030)
!1032 = !DILocation(line: 36, column: 5, scope: !1026)
!1033 = !DILocation(line: 38, column: 21, scope: !1034)
!1034 = distinct !DILexicalBlock(scope: !1030, file: !29, line: 37, column: 5)
!1035 = !DILocation(line: 38, column: 30, scope: !1034)
!1036 = !DILocation(line: 38, column: 14, scope: !1034)
!1037 = !DILocation(line: 38, column: 7, scope: !1034)
!1038 = !DILocation(line: 38, column: 17, scope: !1034)
!1039 = !DILocation(line: 38, column: 19, scope: !1034)
!1040 = !DILocation(line: 39, column: 21, scope: !1034)
!1041 = !DILocation(line: 39, column: 30, scope: !1034)
!1042 = !DILocation(line: 39, column: 14, scope: !1034)
!1043 = !DILocation(line: 39, column: 7, scope: !1034)
!1044 = !DILocation(line: 39, column: 17, scope: !1034)
!1045 = !DILocation(line: 39, column: 19, scope: !1034)
!1046 = !DILocation(line: 40, column: 25, scope: !1034)
!1047 = !DILocation(line: 40, column: 34, scope: !1034)
!1048 = !DILocation(line: 40, column: 14, scope: !1034)
!1049 = !DILocation(line: 40, column: 7, scope: !1034)
!1050 = !DILocation(line: 40, column: 17, scope: !1034)
!1051 = !DILocation(line: 40, column: 23, scope: !1034)
!1052 = !DILocation(line: 41, column: 26, scope: !1034)
!1053 = !DILocation(line: 41, column: 35, scope: !1034)
!1054 = !DILocation(line: 41, column: 14, scope: !1034)
!1055 = !DILocation(line: 41, column: 7, scope: !1034)
!1056 = !DILocation(line: 41, column: 17, scope: !1034)
!1057 = !DILocation(line: 41, column: 24, scope: !1034)
!1058 = !DILocation(line: 42, column: 5, scope: !1034)
!1059 = !DILocation(line: 36, column: 39, scope: !1030)
!1060 = !DILocation(line: 36, column: 5, scope: !1030)
!1061 = distinct !{!1061, !1032, !1062}
!1062 = !DILocation(line: 42, column: 5, scope: !1026)
!1063 = !DILocation(line: 69, column: 1, scope: !969)
!1064 = !DILocalVariable(name: "i", scope: !1065, file: !29, line: 44, type: !11)
!1065 = distinct !DILexicalBlock(scope: !1008, file: !29, line: 44, column: 5)
!1066 = !DILocation(line: 44, column: 14, scope: !1065)
!1067 = !DILocation(line: 44, column: 10, scope: !1065)
!1068 = !DILocation(line: 44, column: 20, scope: !1069)
!1069 = distinct !DILexicalBlock(scope: !1065, file: !29, line: 44, column: 5)
!1070 = !DILocation(line: 44, column: 24, scope: !1069)
!1071 = !DILocation(line: 44, column: 22, scope: !1069)
!1072 = !DILocation(line: 44, column: 5, scope: !1065)
!1073 = !DILocation(line: 46, column: 7, scope: !1074)
!1074 = distinct !DILexicalBlock(scope: !1069, file: !29, line: 45, column: 5)
!1075 = !DILocation(line: 46, column: 13, scope: !1074)
!1076 = !DILocation(line: 47, column: 7, scope: !1074)
!1077 = !DILocation(line: 47, column: 23, scope: !1074)
!1078 = !DILocation(line: 47, column: 16, scope: !1074)
!1079 = !DILocation(line: 47, column: 26, scope: !1074)
!1080 = !DILocation(line: 47, column: 13, scope: !1074)
!1081 = !DILocation(line: 47, column: 28, scope: !1074)
!1082 = !DILocation(line: 47, column: 45, scope: !1074)
!1083 = !DILocation(line: 47, column: 38, scope: !1074)
!1084 = !DILocation(line: 47, column: 48, scope: !1074)
!1085 = !DILocation(line: 47, column: 35, scope: !1074)
!1086 = !DILocation(line: 47, column: 50, scope: !1074)
!1087 = !DILocation(line: 47, column: 67, scope: !1074)
!1088 = !DILocation(line: 47, column: 60, scope: !1074)
!1089 = !DILocation(line: 47, column: 70, scope: !1074)
!1090 = !DILocation(line: 47, column: 57, scope: !1074)
!1091 = !DILocation(line: 47, column: 76, scope: !1074)
!1092 = !DILocation(line: 47, column: 93, scope: !1074)
!1093 = !DILocation(line: 47, column: 86, scope: !1074)
!1094 = !DILocation(line: 47, column: 96, scope: !1074)
!1095 = !DILocation(line: 47, column: 83, scope: !1074)
!1096 = !DILocation(line: 48, column: 7, scope: !1074)
!1097 = !DILocation(line: 48, column: 13, scope: !1074)
!1098 = !DILocation(line: 49, column: 5, scope: !1074)
!1099 = !DILocation(line: 44, column: 39, scope: !1069)
!1100 = !DILocation(line: 44, column: 5, scope: !1069)
!1101 = distinct !{!1101, !1072, !1102}
!1102 = !DILocation(line: 49, column: 5, scope: !1065)
!1103 = !DILocation(line: 50, column: 11, scope: !1008)
!1104 = !DILocation(line: 52, column: 5, scope: !1008)
!1105 = !DILocalVariable(name: "i", scope: !1106, file: !29, line: 55, type: !11)
!1106 = distinct !DILexicalBlock(scope: !1008, file: !29, line: 55, column: 5)
!1107 = !DILocation(line: 55, column: 13, scope: !1106)
!1108 = !DILocation(line: 55, column: 9, scope: !1106)
!1109 = !DILocation(line: 55, column: 20, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !1106, file: !29, line: 55, column: 5)
!1111 = !DILocation(line: 55, column: 24, scope: !1110)
!1112 = !DILocation(line: 55, column: 22, scope: !1110)
!1113 = !DILocation(line: 55, column: 5, scope: !1106)
!1114 = !DILocalVariable(name: "r", scope: !1115, file: !29, line: 57, type: !1015)
!1115 = distinct !DILexicalBlock(scope: !1110, file: !29, line: 56, column: 5)
!1116 = !DILocation(line: 57, column: 14, scope: !1115)
!1117 = !DILocation(line: 57, column: 25, scope: !1115)
!1118 = !DILocation(line: 57, column: 18, scope: !1115)
!1119 = !DILocation(line: 58, column: 21, scope: !1115)
!1120 = !DILocation(line: 58, column: 27, scope: !1115)
!1121 = !DILocation(line: 58, column: 7, scope: !1115)
!1122 = !DILocation(line: 59, column: 5, scope: !1115)
!1123 = !DILocation(line: 55, column: 39, scope: !1110)
!1124 = !DILocation(line: 55, column: 5, scope: !1110)
!1125 = distinct !{!1125, !1113, !1126}
!1126 = !DILocation(line: 59, column: 5, scope: !1106)
!1127 = !DILocalVariable(name: "flag", scope: !1008, file: !29, line: 61, type: !11)
!1128 = !DILocation(line: 61, column: 9, scope: !1008)
!1129 = !DILocation(line: 61, column: 33, scope: !1008)
!1130 = !DILocation(line: 61, column: 42, scope: !1008)
!1131 = !DILocation(line: 61, column: 16, scope: !1008)
!1132 = !DILocation(line: 63, column: 5, scope: !1008)
!1133 = !DILocation(line: 64, column: 3, scope: !1008)
!1134 = !DILocation(line: 67, column: 15, scope: !1135)
!1135 = distinct !DILexicalBlock(scope: !1005, file: !29, line: 66, column: 3)
!1136 = !DILocation(line: 67, column: 50, scope: !1135)
!1137 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_check_result.cpp", scope: !29, file: !29, type: !1138, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !28, variables: !30)
!1138 = !DISubroutineType(types: !30)
!1139 = !DILocation(line: 0, scope: !1137)
