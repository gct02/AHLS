; ModuleID = '../src/utils.cpp'
source_filename = "../src/utils.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%"class.std::__cxx11::basic_string" = type { %"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider", i64, %union.anon }
%"struct.std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_Alloc_hider" = type { i8* }
%union.anon = type { i64, [8 x i8] }
%"class.std::basic_ifstream" = type { %"class.std::basic_istream.base", %"class.std::basic_filebuf", %"class.std::basic_ios" }
%"class.std::basic_istream.base" = type { i32 (...)**, i64 }
%"class.std::basic_filebuf" = type { %"class.std::basic_streambuf", %union.pthread_mutex_t, %"class.std::__basic_file", i32, %struct.__mbstate_t, %struct.__mbstate_t, %struct.__mbstate_t, i8*, i64, i8, i8, i8, i8, i8*, i8*, i8, %"class.std::codecvt"*, i8*, i64, i8*, i8* }
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%"class.std::__basic_file" = type <{ %struct._IO_FILE*, i8, [7 x i8] }>
%struct.__mbstate_t = type { i32, %union.anon.0 }
%union.anon.0 = type { i32 }
%"class.std::codecvt" = type { %"class.std::__codecvt_abstract_base.base", %struct.__locale_struct* }
%"class.std::__codecvt_abstract_base.base" = type { %"class.std::locale::facet.base" }
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::basic_istream" = type { i32 (...)**, i64, %"class.std::basic_ios" }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@__dso_handle = external hidden global i8
@.str = private unnamed_addr constant [53 x i8] c"usage: %s -t training_data -s test_data -e expected\0A\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"t:s:e:\00", align 1
@optarg = external global i8*, align 8
@optopt = external global i32, align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [34 x i8] c"Option -%c requires an argument.\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"Unknown option `-%c'.\0A\00", align 1
@.str.4 = private unnamed_addr constant [34 x i8] c"Unknown option character `\5Cx%x'.\0A\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Error opening files\0A\00", align 1
@.str.6 = private unnamed_addr constant [44 x i8] c"Invalid number of training or test samples\0A\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_utils.cpp, i8* null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" !dbg !964 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !965
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3, !dbg !965
  ret void, !dbg !965
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: noinline optnone uwtable
define void @_Z11print_usagePc(i8* %filename) #4 !dbg !966 {
entry:
  %filename.addr = alloca i8*, align 8
  store i8* %filename, i8** %filename.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %filename.addr, metadata !969, metadata !DIExpression()), !dbg !970
  %0 = load i8*, i8** %filename.addr, align 8, !dbg !971
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str, i32 0, i32 0), i8* %0), !dbg !972
  ret void, !dbg !973
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #5

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline optnone uwtable
define void @_Z23parse_command_line_argsiPPcRiS1_PPyS3_PPh(i32 %argc, i8** %argv, i32* dereferenceable(4) %num_training, i32* dereferenceable(4) %num_test, i64** %training_data, i64** %test_data, i8** %expected) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !974 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %num_training.addr = alloca i32*, align 8
  %num_test.addr = alloca i32*, align 8
  %training_data.addr = alloca i64**, align 8
  %test_data.addr = alloca i64**, align 8
  %expected.addr = alloca i8**, align 8
  %c = alloca i32, align 4
  %training_data_filename = alloca %"class.std::__cxx11::basic_string", align 8
  %test_data_filename = alloca %"class.std::__cxx11::basic_string", align 8
  %expected_filename = alloca %"class.std::__cxx11::basic_string", align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %training_data_file = alloca %"class.std::basic_ifstream", align 8
  %test_data_file = alloca %"class.std::basic_ifstream", align 8
  %expected_file = alloca %"class.std::basic_ifstream", align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %i87 = alloca i32, align 4
  %j91 = alloca i32, align 4
  %i107 = alloca i32, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !985, metadata !DIExpression()), !dbg !986
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !987, metadata !DIExpression()), !dbg !988
  store i32* %num_training, i32** %num_training.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %num_training.addr, metadata !989, metadata !DIExpression()), !dbg !990
  store i32* %num_test, i32** %num_test.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %num_test.addr, metadata !991, metadata !DIExpression()), !dbg !992
  store i64** %training_data, i64*** %training_data.addr, align 8
  call void @llvm.dbg.declare(metadata i64*** %training_data.addr, metadata !993, metadata !DIExpression()), !dbg !994
  store i64** %test_data, i64*** %test_data.addr, align 8
  call void @llvm.dbg.declare(metadata i64*** %test_data.addr, metadata !995, metadata !DIExpression()), !dbg !996
  store i8** %expected, i8*** %expected.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %expected.addr, metadata !997, metadata !DIExpression()), !dbg !998
  call void @llvm.dbg.declare(metadata i32* %c, metadata !999, metadata !DIExpression()), !dbg !1000
  store i32 0, i32* %c, align 4, !dbg !1000
  call void @llvm.dbg.declare(metadata %"class.std::__cxx11::basic_string"* %training_data_filename, metadata !1001, metadata !DIExpression()), !dbg !1007
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev(%"class.std::__cxx11::basic_string"* %training_data_filename) #3, !dbg !1007
  call void @llvm.dbg.declare(metadata %"class.std::__cxx11::basic_string"* %test_data_filename, metadata !1008, metadata !DIExpression()), !dbg !1009
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev(%"class.std::__cxx11::basic_string"* %test_data_filename) #3, !dbg !1009
  call void @llvm.dbg.declare(metadata %"class.std::__cxx11::basic_string"* %expected_filename, metadata !1010, metadata !DIExpression()), !dbg !1011
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev(%"class.std::__cxx11::basic_string"* %expected_filename) #3, !dbg !1011
  br label %while.cond, !dbg !1012

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load i32, i32* %argc.addr, align 4, !dbg !1013
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !1014
  %call = call i32 @getopt(i32 %0, i8** %1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0)) #3, !dbg !1015
  store i32 %call, i32* %c, align 4, !dbg !1016
  %cmp = icmp ne i32 %call, -1, !dbg !1017
  br i1 %cmp, label %while.body, label %while.end, !dbg !1012

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %c, align 4, !dbg !1018
  switch i32 %2, label %sw.default [
    i32 116, label %sw.bb
    i32 115, label %sw.bb2
    i32 101, label %sw.bb5
    i32 63, label %sw.bb8
  ], !dbg !1020

sw.bb:                                            ; preds = %while.body
  %3 = load i8*, i8** @optarg, align 8, !dbg !1021
  %call1 = invoke dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEPKc(%"class.std::__cxx11::basic_string"* %training_data_filename, i8* %3)
          to label %invoke.cont unwind label %lpad, !dbg !1023

invoke.cont:                                      ; preds = %sw.bb
  br label %sw.epilog, !dbg !1024

lpad:                                             ; preds = %if.end34, %if.then31, %sw.default, %if.end22, %if.else19, %if.then16, %if.then, %sw.bb5, %sw.bb2, %sw.bb
  %4 = landingpad { i8*, i32 }
          cleanup, !dbg !1025
  %5 = extractvalue { i8*, i32 } %4, 0, !dbg !1025
  store i8* %5, i8** %exn.slot, align 8, !dbg !1025
  %6 = extractvalue { i8*, i32 } %4, 1, !dbg !1025
  store i32 %6, i32* %ehselector.slot, align 4, !dbg !1025
  br label %ehcleanup122, !dbg !1025

sw.bb2:                                           ; preds = %while.body
  %7 = load i8*, i8** @optarg, align 8, !dbg !1026
  %call4 = invoke dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEPKc(%"class.std::__cxx11::basic_string"* %test_data_filename, i8* %7)
          to label %invoke.cont3 unwind label %lpad, !dbg !1027

invoke.cont3:                                     ; preds = %sw.bb2
  br label %sw.epilog, !dbg !1028

sw.bb5:                                           ; preds = %while.body
  %8 = load i8*, i8** @optarg, align 8, !dbg !1029
  %call7 = invoke dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEPKc(%"class.std::__cxx11::basic_string"* %expected_filename, i8* %8)
          to label %invoke.cont6 unwind label %lpad, !dbg !1030

invoke.cont6:                                     ; preds = %sw.bb5
  br label %sw.epilog, !dbg !1031

sw.bb8:                                           ; preds = %while.body
  %9 = load i32, i32* @optopt, align 4, !dbg !1032
  %cmp9 = icmp eq i32 %9, 116, !dbg !1034
  br i1 %cmp9, label %if.then, label %lor.lhs.false, !dbg !1035

lor.lhs.false:                                    ; preds = %sw.bb8
  %10 = load i32, i32* @optopt, align 4, !dbg !1036
  %cmp10 = icmp eq i32 %10, 101, !dbg !1037
  br i1 %cmp10, label %if.then, label %lor.lhs.false11, !dbg !1038

lor.lhs.false11:                                  ; preds = %lor.lhs.false
  %11 = load i32, i32* @optopt, align 4, !dbg !1039
  %cmp12 = icmp eq i32 %11, 115, !dbg !1040
  br i1 %cmp12, label %if.then, label %if.else, !dbg !1041

if.then:                                          ; preds = %lor.lhs.false11, %lor.lhs.false, %sw.bb8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1042
  %13 = load i32, i32* @optopt, align 4, !dbg !1043
  %call14 = invoke i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i32 0, i32 0), i32 %13)
          to label %invoke.cont13 unwind label %lpad, !dbg !1044

invoke.cont13:                                    ; preds = %if.then
  br label %if.end22, !dbg !1044

if.else:                                          ; preds = %lor.lhs.false11
  %14 = load i32, i32* @optopt, align 4, !dbg !1045
  %call15 = call i32 @isprint(i32 %14) #9, !dbg !1047
  %tobool = icmp ne i32 %call15, 0, !dbg !1047
  br i1 %tobool, label %if.then16, label %if.else19, !dbg !1048

if.then16:                                        ; preds = %if.else
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1049
  %16 = load i32, i32* @optopt, align 4, !dbg !1050
  %call18 = invoke i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0), i32 %16)
          to label %invoke.cont17 unwind label %lpad, !dbg !1051

invoke.cont17:                                    ; preds = %if.then16
  br label %if.end, !dbg !1051

if.else19:                                        ; preds = %if.else
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1052
  %18 = load i32, i32* @optopt, align 4, !dbg !1053
  %call21 = invoke i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.4, i32 0, i32 0), i32 %18)
          to label %invoke.cont20 unwind label %lpad, !dbg !1054

invoke.cont20:                                    ; preds = %if.else19
  br label %if.end

if.end:                                           ; preds = %invoke.cont20, %invoke.cont17
  br label %if.end22

if.end22:                                         ; preds = %if.end, %invoke.cont13
  %19 = load i8**, i8*** %argv.addr, align 8, !dbg !1055
  %arrayidx = getelementptr inbounds i8*, i8** %19, i64 0, !dbg !1055
  %20 = load i8*, i8** %arrayidx, align 8, !dbg !1055
  invoke void @_Z11print_usagePc(i8* %20)
          to label %invoke.cont23 unwind label %lpad, !dbg !1056

invoke.cont23:                                    ; preds = %if.end22
  call void @exit(i32 -1) #10, !dbg !1057
  unreachable, !dbg !1057

sw.default:                                       ; preds = %while.body
  %21 = load i8**, i8*** %argv.addr, align 8, !dbg !1058
  %arrayidx24 = getelementptr inbounds i8*, i8** %21, i64 0, !dbg !1058
  %22 = load i8*, i8** %arrayidx24, align 8, !dbg !1058
  invoke void @_Z11print_usagePc(i8* %22)
          to label %invoke.cont25 unwind label %lpad, !dbg !1059

invoke.cont25:                                    ; preds = %sw.default
  call void @exit(i32 -1) #10, !dbg !1060
  unreachable, !dbg !1060

sw.epilog:                                        ; preds = %invoke.cont6, %invoke.cont3, %invoke.cont
  br label %while.cond, !dbg !1012, !llvm.loop !1061

while.end:                                        ; preds = %while.cond
  %call26 = call zeroext i1 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5emptyEv(%"class.std::__cxx11::basic_string"* %training_data_filename) #3, !dbg !1063
  br i1 %call26, label %if.then31, label %lor.lhs.false27, !dbg !1065

lor.lhs.false27:                                  ; preds = %while.end
  %call28 = call zeroext i1 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5emptyEv(%"class.std::__cxx11::basic_string"* %test_data_filename) #3, !dbg !1066
  br i1 %call28, label %if.then31, label %lor.lhs.false29, !dbg !1067

lor.lhs.false29:                                  ; preds = %lor.lhs.false27
  %call30 = call zeroext i1 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5emptyEv(%"class.std::__cxx11::basic_string"* %expected_filename) #3, !dbg !1068
  br i1 %call30, label %if.then31, label %if.end34, !dbg !1069

if.then31:                                        ; preds = %lor.lhs.false29, %lor.lhs.false27, %while.end
  %23 = load i8**, i8*** %argv.addr, align 8, !dbg !1070
  %arrayidx32 = getelementptr inbounds i8*, i8** %23, i64 0, !dbg !1070
  %24 = load i8*, i8** %arrayidx32, align 8, !dbg !1070
  invoke void @_Z11print_usagePc(i8* %24)
          to label %invoke.cont33 unwind label %lpad, !dbg !1072

invoke.cont33:                                    ; preds = %if.then31
  call void @exit(i32 -1) #10, !dbg !1073
  unreachable, !dbg !1073

if.end34:                                         ; preds = %lor.lhs.false29
  call void @llvm.dbg.declare(metadata %"class.std::basic_ifstream"* %training_data_file, metadata !1074, metadata !DIExpression()), !dbg !1079
  %call35 = call i8* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%"class.std::__cxx11::basic_string"* %training_data_filename) #3, !dbg !1080
  invoke void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode(%"class.std::basic_ifstream"* %training_data_file, i8* %call35, i32 8)
          to label %invoke.cont36 unwind label %lpad, !dbg !1079

invoke.cont36:                                    ; preds = %if.end34
  call void @llvm.dbg.declare(metadata %"class.std::basic_ifstream"* %test_data_file, metadata !1081, metadata !DIExpression()), !dbg !1082
  %call37 = call i8* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%"class.std::__cxx11::basic_string"* %test_data_filename) #3, !dbg !1083
  invoke void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode(%"class.std::basic_ifstream"* %test_data_file, i8* %call37, i32 8)
          to label %invoke.cont39 unwind label %lpad38, !dbg !1082

invoke.cont39:                                    ; preds = %invoke.cont36
  call void @llvm.dbg.declare(metadata %"class.std::basic_ifstream"* %expected_file, metadata !1084, metadata !DIExpression()), !dbg !1085
  %call40 = call i8* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%"class.std::__cxx11::basic_string"* %expected_filename) #3, !dbg !1086
  invoke void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode(%"class.std::basic_ifstream"* %expected_file, i8* %call40, i32 8)
          to label %invoke.cont42 unwind label %lpad41, !dbg !1085

invoke.cont42:                                    ; preds = %invoke.cont39
  %call45 = invoke zeroext i1 @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ifstream"* %training_data_file)
          to label %invoke.cont44 unwind label %lpad43, !dbg !1087

invoke.cont44:                                    ; preds = %invoke.cont42
  br i1 %call45, label %lor.lhs.false46, label %if.then52, !dbg !1089

lor.lhs.false46:                                  ; preds = %invoke.cont44
  %call48 = invoke zeroext i1 @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ifstream"* %test_data_file)
          to label %invoke.cont47 unwind label %lpad43, !dbg !1090

invoke.cont47:                                    ; preds = %lor.lhs.false46
  br i1 %call48, label %lor.lhs.false49, label %if.then52, !dbg !1091

lor.lhs.false49:                                  ; preds = %invoke.cont47
  %call51 = invoke zeroext i1 @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ifstream"* %expected_file)
          to label %invoke.cont50 unwind label %lpad43, !dbg !1092

invoke.cont50:                                    ; preds = %lor.lhs.false49
  br i1 %call51, label %if.end55, label %if.then52, !dbg !1093

if.then52:                                        ; preds = %invoke.cont50, %invoke.cont47, %invoke.cont44
  %call54 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i32 0, i32 0))
          to label %invoke.cont53 unwind label %lpad43, !dbg !1094

invoke.cont53:                                    ; preds = %if.then52
  call void @exit(i32 -1) #10, !dbg !1096
  unreachable, !dbg !1096

lpad38:                                           ; preds = %invoke.cont36
  %25 = landingpad { i8*, i32 }
          cleanup, !dbg !1097
  %26 = extractvalue { i8*, i32 } %25, 0, !dbg !1097
  store i8* %26, i8** %exn.slot, align 8, !dbg !1097
  %27 = extractvalue { i8*, i32 } %25, 1, !dbg !1097
  store i32 %27, i32* %ehselector.slot, align 4, !dbg !1097
  br label %ehcleanup121, !dbg !1097

lpad41:                                           ; preds = %invoke.cont39
  %28 = landingpad { i8*, i32 }
          cleanup, !dbg !1097
  %29 = extractvalue { i8*, i32 } %28, 0, !dbg !1097
  store i8* %29, i8** %exn.slot, align 8, !dbg !1097
  %30 = extractvalue { i8*, i32 } %28, 1, !dbg !1097
  store i32 %30, i32* %ehselector.slot, align 4, !dbg !1097
  br label %ehcleanup, !dbg !1097

lpad43:                                           ; preds = %invoke.cont119, %invoke.cont118, %for.end117, %for.body110, %for.body94, %for.body79, %invoke.cont71, %invoke.cont67, %if.end66, %if.then63, %invoke.cont56, %if.end55, %if.then52, %lor.lhs.false49, %lor.lhs.false46, %invoke.cont42
  %31 = landingpad { i8*, i32 }
          cleanup, !dbg !1098
  %32 = extractvalue { i8*, i32 } %31, 0, !dbg !1098
  store i8* %32, i8** %exn.slot, align 8, !dbg !1098
  %33 = extractvalue { i8*, i32 } %31, 1, !dbg !1098
  store i32 %33, i32* %ehselector.slot, align 4, !dbg !1098
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %expected_file) #3, !dbg !1097
  br label %ehcleanup, !dbg !1097

if.end55:                                         ; preds = %invoke.cont50
  %34 = bitcast %"class.std::basic_ifstream"* %training_data_file to %"class.std::basic_istream"*, !dbg !1099
  %35 = load i32*, i32** %num_training.addr, align 8, !dbg !1100
  %36 = bitcast i32* %35 to i8*, !dbg !1101
  %call57 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSi4readEPcl(%"class.std::basic_istream"* %34, i8* %36, i64 4)
          to label %invoke.cont56 unwind label %lpad43, !dbg !1102

invoke.cont56:                                    ; preds = %if.end55
  %37 = bitcast %"class.std::basic_ifstream"* %test_data_file to %"class.std::basic_istream"*, !dbg !1103
  %38 = load i32*, i32** %num_test.addr, align 8, !dbg !1104
  %39 = bitcast i32* %38 to i8*, !dbg !1105
  %call59 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSi4readEPcl(%"class.std::basic_istream"* %37, i8* %39, i64 4)
          to label %invoke.cont58 unwind label %lpad43, !dbg !1106

invoke.cont58:                                    ; preds = %invoke.cont56
  %40 = load i32*, i32** %num_training.addr, align 8, !dbg !1107
  %41 = load i32, i32* %40, align 4, !dbg !1107
  %cmp60 = icmp sle i32 %41, 0, !dbg !1109
  br i1 %cmp60, label %if.then63, label %lor.lhs.false61, !dbg !1110

lor.lhs.false61:                                  ; preds = %invoke.cont58
  %42 = load i32*, i32** %num_test.addr, align 8, !dbg !1111
  %43 = load i32, i32* %42, align 4, !dbg !1111
  %cmp62 = icmp sle i32 %43, 0, !dbg !1112
  br i1 %cmp62, label %if.then63, label %if.end66, !dbg !1113

if.then63:                                        ; preds = %lor.lhs.false61, %invoke.cont58
  %call65 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.6, i32 0, i32 0))
          to label %invoke.cont64 unwind label %lpad43, !dbg !1114

invoke.cont64:                                    ; preds = %if.then63
  call void @exit(i32 -1) #10, !dbg !1116
  unreachable, !dbg !1116

if.end66:                                         ; preds = %lor.lhs.false61
  %44 = load i32*, i32** %num_training.addr, align 8, !dbg !1117
  %45 = load i32, i32* %44, align 4, !dbg !1117
  %mul = mul nsw i32 %45, 4, !dbg !1118
  %conv = sext i32 %mul to i64, !dbg !1117
  %46 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %conv, i64 8), !dbg !1119
  %47 = extractvalue { i64, i1 } %46, 1, !dbg !1119
  %48 = extractvalue { i64, i1 } %46, 0, !dbg !1119
  %49 = select i1 %47, i64 -1, i64 %48, !dbg !1119
  %call68 = invoke i8* @_Znam(i64 %49) #11
          to label %invoke.cont67 unwind label %lpad43, !dbg !1119

invoke.cont67:                                    ; preds = %if.end66
  %50 = bitcast i8* %call68 to i64*, !dbg !1119
  %51 = load i64**, i64*** %training_data.addr, align 8, !dbg !1120
  store i64* %50, i64** %51, align 8, !dbg !1121
  %52 = load i32*, i32** %num_test.addr, align 8, !dbg !1122
  %53 = load i32, i32* %52, align 4, !dbg !1122
  %mul69 = mul nsw i32 %53, 4, !dbg !1123
  %conv70 = sext i32 %mul69 to i64, !dbg !1122
  %54 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %conv70, i64 8), !dbg !1124
  %55 = extractvalue { i64, i1 } %54, 1, !dbg !1124
  %56 = extractvalue { i64, i1 } %54, 0, !dbg !1124
  %57 = select i1 %55, i64 -1, i64 %56, !dbg !1124
  %call72 = invoke i8* @_Znam(i64 %57) #11
          to label %invoke.cont71 unwind label %lpad43, !dbg !1124

invoke.cont71:                                    ; preds = %invoke.cont67
  %58 = bitcast i8* %call72 to i64*, !dbg !1124
  %59 = load i64**, i64*** %test_data.addr, align 8, !dbg !1125
  store i64* %58, i64** %59, align 8, !dbg !1126
  %60 = load i32*, i32** %num_test.addr, align 8, !dbg !1127
  %61 = load i32, i32* %60, align 4, !dbg !1127
  %conv73 = sext i32 %61 to i64, !dbg !1127
  %call75 = invoke i8* @_Znam(i64 %conv73) #11
          to label %invoke.cont74 unwind label %lpad43, !dbg !1128

invoke.cont74:                                    ; preds = %invoke.cont71
  %62 = load i8**, i8*** %expected.addr, align 8, !dbg !1129
  store i8* %call75, i8** %62, align 8, !dbg !1130
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1131, metadata !DIExpression()), !dbg !1133
  store i32 0, i32* %i, align 4, !dbg !1133
  br label %for.cond, !dbg !1134

for.cond:                                         ; preds = %for.inc84, %invoke.cont74
  %63 = load i32, i32* %i, align 4, !dbg !1135
  %64 = load i32*, i32** %num_training.addr, align 8, !dbg !1137
  %65 = load i32, i32* %64, align 4, !dbg !1137
  %cmp76 = icmp slt i32 %63, %65, !dbg !1138
  br i1 %cmp76, label %for.body, label %for.end86, !dbg !1139

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1140, metadata !DIExpression()), !dbg !1143
  store i32 0, i32* %j, align 4, !dbg !1143
  br label %for.cond77, !dbg !1144

for.cond77:                                       ; preds = %for.inc, %for.body
  %66 = load i32, i32* %j, align 4, !dbg !1145
  %cmp78 = icmp slt i32 %66, 4, !dbg !1147
  br i1 %cmp78, label %for.body79, label %for.end, !dbg !1148

for.body79:                                       ; preds = %for.cond77
  %67 = bitcast %"class.std::basic_ifstream"* %training_data_file to %"class.std::basic_istream"*, !dbg !1149
  %68 = load i64**, i64*** %training_data.addr, align 8, !dbg !1151
  %69 = load i64*, i64** %68, align 8, !dbg !1152
  %70 = load i32, i32* %i, align 4, !dbg !1153
  %mul80 = mul nsw i32 %70, 4, !dbg !1154
  %71 = load i32, i32* %j, align 4, !dbg !1155
  %add = add nsw i32 %mul80, %71, !dbg !1156
  %idxprom = sext i32 %add to i64, !dbg !1157
  %arrayidx81 = getelementptr inbounds i64, i64* %69, i64 %idxprom, !dbg !1157
  %72 = bitcast i64* %arrayidx81 to i8*, !dbg !1158
  %call83 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSi4readEPcl(%"class.std::basic_istream"* %67, i8* %72, i64 8)
          to label %invoke.cont82 unwind label %lpad43, !dbg !1159

invoke.cont82:                                    ; preds = %for.body79
  br label %for.inc, !dbg !1160

for.inc:                                          ; preds = %invoke.cont82
  %73 = load i32, i32* %j, align 4, !dbg !1161
  %inc = add nsw i32 %73, 1, !dbg !1161
  store i32 %inc, i32* %j, align 4, !dbg !1161
  br label %for.cond77, !dbg !1162, !llvm.loop !1163

for.end:                                          ; preds = %for.cond77
  br label %for.inc84, !dbg !1165

for.inc84:                                        ; preds = %for.end
  %74 = load i32, i32* %i, align 4, !dbg !1166
  %inc85 = add nsw i32 %74, 1, !dbg !1166
  store i32 %inc85, i32* %i, align 4, !dbg !1166
  br label %for.cond, !dbg !1167, !llvm.loop !1168

for.end86:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i87, metadata !1170, metadata !DIExpression()), !dbg !1172
  store i32 0, i32* %i87, align 4, !dbg !1172
  br label %for.cond88, !dbg !1173

for.cond88:                                       ; preds = %for.inc104, %for.end86
  %75 = load i32, i32* %i87, align 4, !dbg !1174
  %76 = load i32*, i32** %num_test.addr, align 8, !dbg !1176
  %77 = load i32, i32* %76, align 4, !dbg !1176
  %cmp89 = icmp slt i32 %75, %77, !dbg !1177
  br i1 %cmp89, label %for.body90, label %for.end106, !dbg !1178

for.body90:                                       ; preds = %for.cond88
  call void @llvm.dbg.declare(metadata i32* %j91, metadata !1179, metadata !DIExpression()), !dbg !1182
  store i32 0, i32* %j91, align 4, !dbg !1182
  br label %for.cond92, !dbg !1183

for.cond92:                                       ; preds = %for.inc101, %for.body90
  %78 = load i32, i32* %j91, align 4, !dbg !1184
  %cmp93 = icmp slt i32 %78, 4, !dbg !1186
  br i1 %cmp93, label %for.body94, label %for.end103, !dbg !1187

for.body94:                                       ; preds = %for.cond92
  %79 = bitcast %"class.std::basic_ifstream"* %test_data_file to %"class.std::basic_istream"*, !dbg !1188
  %80 = load i64**, i64*** %test_data.addr, align 8, !dbg !1190
  %81 = load i64*, i64** %80, align 8, !dbg !1191
  %82 = load i32, i32* %i87, align 4, !dbg !1192
  %mul95 = mul nsw i32 %82, 4, !dbg !1193
  %83 = load i32, i32* %j91, align 4, !dbg !1194
  %add96 = add nsw i32 %mul95, %83, !dbg !1195
  %idxprom97 = sext i32 %add96 to i64, !dbg !1196
  %arrayidx98 = getelementptr inbounds i64, i64* %81, i64 %idxprom97, !dbg !1196
  %84 = bitcast i64* %arrayidx98 to i8*, !dbg !1197
  %call100 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSi4readEPcl(%"class.std::basic_istream"* %79, i8* %84, i64 8)
          to label %invoke.cont99 unwind label %lpad43, !dbg !1198

invoke.cont99:                                    ; preds = %for.body94
  br label %for.inc101, !dbg !1199

for.inc101:                                       ; preds = %invoke.cont99
  %85 = load i32, i32* %j91, align 4, !dbg !1200
  %inc102 = add nsw i32 %85, 1, !dbg !1200
  store i32 %inc102, i32* %j91, align 4, !dbg !1200
  br label %for.cond92, !dbg !1201, !llvm.loop !1202

for.end103:                                       ; preds = %for.cond92
  br label %for.inc104, !dbg !1204

for.inc104:                                       ; preds = %for.end103
  %86 = load i32, i32* %i87, align 4, !dbg !1205
  %inc105 = add nsw i32 %86, 1, !dbg !1205
  store i32 %inc105, i32* %i87, align 4, !dbg !1205
  br label %for.cond88, !dbg !1206, !llvm.loop !1207

for.end106:                                       ; preds = %for.cond88
  call void @llvm.dbg.declare(metadata i32* %i107, metadata !1209, metadata !DIExpression()), !dbg !1211
  store i32 0, i32* %i107, align 4, !dbg !1211
  br label %for.cond108, !dbg !1212

for.cond108:                                      ; preds = %for.inc115, %for.end106
  %87 = load i32, i32* %i107, align 4, !dbg !1213
  %88 = load i32*, i32** %num_test.addr, align 8, !dbg !1215
  %89 = load i32, i32* %88, align 4, !dbg !1215
  %cmp109 = icmp slt i32 %87, %89, !dbg !1216
  br i1 %cmp109, label %for.body110, label %for.end117, !dbg !1217

for.body110:                                      ; preds = %for.cond108
  %90 = bitcast %"class.std::basic_ifstream"* %expected_file to %"class.std::basic_istream"*, !dbg !1218
  %91 = load i8**, i8*** %expected.addr, align 8, !dbg !1220
  %92 = load i8*, i8** %91, align 8, !dbg !1221
  %93 = load i32, i32* %i107, align 4, !dbg !1222
  %idxprom111 = sext i32 %93 to i64, !dbg !1223
  %arrayidx112 = getelementptr inbounds i8, i8* %92, i64 %idxprom111, !dbg !1223
  %call114 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSi4readEPcl(%"class.std::basic_istream"* %90, i8* %arrayidx112, i64 1)
          to label %invoke.cont113 unwind label %lpad43, !dbg !1224

invoke.cont113:                                   ; preds = %for.body110
  br label %for.inc115, !dbg !1225

for.inc115:                                       ; preds = %invoke.cont113
  %94 = load i32, i32* %i107, align 4, !dbg !1226
  %inc116 = add nsw i32 %94, 1, !dbg !1226
  store i32 %inc116, i32* %i107, align 4, !dbg !1226
  br label %for.cond108, !dbg !1227, !llvm.loop !1228

for.end117:                                       ; preds = %for.cond108
  invoke void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE5closeEv(%"class.std::basic_ifstream"* %training_data_file)
          to label %invoke.cont118 unwind label %lpad43, !dbg !1230

invoke.cont118:                                   ; preds = %for.end117
  invoke void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE5closeEv(%"class.std::basic_ifstream"* %test_data_file)
          to label %invoke.cont119 unwind label %lpad43, !dbg !1231

invoke.cont119:                                   ; preds = %invoke.cont118
  invoke void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE5closeEv(%"class.std::basic_ifstream"* %expected_file)
          to label %invoke.cont120 unwind label %lpad43, !dbg !1232

invoke.cont120:                                   ; preds = %invoke.cont119
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %expected_file) #3, !dbg !1097
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %test_data_file) #3, !dbg !1097
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %training_data_file) #3, !dbg !1097
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %expected_filename) #3, !dbg !1097
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %test_data_filename) #3, !dbg !1097
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %training_data_filename) #3, !dbg !1097
  ret void, !dbg !1097

ehcleanup:                                        ; preds = %lpad43, %lpad41
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %test_data_file) #3, !dbg !1097
  br label %ehcleanup121, !dbg !1097

ehcleanup121:                                     ; preds = %ehcleanup, %lpad38
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %training_data_file) #3, !dbg !1097
  br label %ehcleanup122, !dbg !1097

ehcleanup122:                                     ; preds = %ehcleanup121, %lpad
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %expected_filename) #3, !dbg !1097
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %test_data_filename) #3, !dbg !1097
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %training_data_filename) #3, !dbg !1097
  br label %eh.resume, !dbg !1097

eh.resume:                                        ; preds = %ehcleanup122
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !1097
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !1097
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !1097
  %lpad.val125 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !1097
  resume { i8*, i32 } %lpad.val125, !dbg !1097
}

; Function Attrs: nounwind
declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev(%"class.std::__cxx11::basic_string"*) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @getopt(i32, i8**, i8*) #2

declare dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEPKc(%"class.std::__cxx11::basic_string"*, i8*) #1

declare i32 @__gxx_personality_v0(...)

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind readonly willreturn
declare i32 @isprint(i32) #6

; Function Attrs: noreturn nounwind
declare void @exit(i32) #7

; Function Attrs: nounwind
declare zeroext i1 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5emptyEv(%"class.std::__cxx11::basic_string"*) #2

; Function Attrs: nounwind
declare i8* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%"class.std::__cxx11::basic_string"*) #2

declare void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode(%"class.std::basic_ifstream"*, i8*, i32) unnamed_addr #1

declare zeroext i1 @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ifstream"*) #1

declare dereferenceable(280) %"class.std::basic_istream"* @_ZNSi4readEPcl(%"class.std::basic_istream"*, i8*, i64) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #5

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #8

declare void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE5closeEv(%"class.std::basic_ifstream"*) #1

; Function Attrs: nounwind
declare void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"*) unnamed_addr #2

; Function Attrs: nounwind
declare void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"*) unnamed_addr #2

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_utils.cpp() #0 section ".text.startup" !dbg !1233 {
entry:
  call void @__cxx_global_var_init(), !dbg !1235
  ret void
}

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable willreturn }
attributes #6 = { nounwind readonly willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind readonly willreturn }
attributes #10 = { noreturn nounwind }
attributes #11 = { builtin }

!llvm.dbg.cu = !{!28}
!llvm.module.flags = !{!959, !960, !961, !962}
!llvm.ident = !{!963}

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
!28 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !29, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !30, retainedTypes: !31, globals: !34, imports: !35)
!29 = !DIFile(filename: "../src/utils.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!30 = !{}
!31 = !{!32}
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!34 = !{!0}
!35 = !{!36, !42, !48, !53, !57, !59, !61, !63, !65, !72, !77, !84, !88, !92, !96, !105, !109, !111, !116, !122, !126, !133, !135, !139, !143, !147, !149, !153, !157, !159, !163, !165, !167, !171, !175, !179, !183, !187, !191, !193, !205, !209, !213, !218, !220, !222, !226, !230, !231, !232, !233, !234, !235, !239, !243, !249, !253, !258, !260, !265, !267, !271, !279, !283, !287, !291, !295, !299, !303, !307, !311, !315, !322, !326, !330, !332, !334, !338, !342, !348, !352, !356, !358, !365, !369, !376, !378, !382, !386, !390, !394, !399, !404, !409, !410, !411, !412, !414, !415, !416, !417, !418, !419, !420, !422, !423, !424, !425, !426, !427, !428, !433, !434, !435, !436, !437, !438, !439, !440, !441, !442, !443, !444, !445, !446, !447, !448, !449, !450, !451, !452, !453, !454, !455, !456, !457, !474, !477, !482, !489, !494, !498, !502, !506, !510, !512, !514, !518, !524, !528, !534, !540, !542, !546, !550, !554, !558, !562, !564, !568, !572, !576, !578, !582, !586, !590, !592, !594, !598, !606, !610, !614, !618, !620, !626, !628, !634, !638, !642, !646, !650, !654, !658, !660, !662, !666, !670, !674, !676, !680, !684, !686, !688, !692, !696, !700, !704, !705, !706, !707, !708, !709, !710, !711, !712, !713, !714, !769, !773, !777, !784, !788, !791, !794, !797, !799, !801, !803, !806, !809, !812, !815, !818, !820, !825, !829, !832, !835, !837, !839, !841, !843, !846, !849, !852, !855, !858, !860, !864, !868, !873, !877, !879, !881, !883, !885, !887, !889, !891, !893, !895, !897, !899, !901, !903, !909, !912, !913, !915, !917, !919, !921, !925, !927, !929, !931, !933, !935, !937, !939, !941, !945, !949, !951, !955}
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !37, file: !41, line: 98)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !38, line: 7, baseType: !39)
!38 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!39 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !40, line: 49, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!40 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!41 = !DIFile(filename: "/usr/include/c++/11/cstdio", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!42 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !43, file: !41, line: 99)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !44, line: 84, baseType: !45)
!44 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !46, line: 14, baseType: !47)
!46 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!47 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !46, line: 10, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!48 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !49, file: !41, line: 101)
!49 = !DISubprogram(name: "clearerr", scope: !44, file: !44, line: 786, type: !50, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!50 = !DISubroutineType(types: !51)
!51 = !{null, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!53 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !54, file: !41, line: 102)
!54 = !DISubprogram(name: "fclose", scope: !44, file: !44, line: 178, type: !55, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!55 = !DISubroutineType(types: !56)
!56 = !{!11, !52}
!57 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !58, file: !41, line: 103)
!58 = !DISubprogram(name: "feof", scope: !44, file: !44, line: 788, type: !55, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !60, file: !41, line: 104)
!60 = !DISubprogram(name: "ferror", scope: !44, file: !44, line: 790, type: !55, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!61 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !62, file: !41, line: 105)
!62 = !DISubprogram(name: "fflush", scope: !44, file: !44, line: 230, type: !55, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !64, file: !41, line: 106)
!64 = !DISubprogram(name: "fgetc", scope: !44, file: !44, line: 513, type: !55, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !66, file: !41, line: 107)
!66 = !DISubprogram(name: "fgetpos", scope: !44, file: !44, line: 760, type: !67, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!67 = !DISubroutineType(types: !68)
!68 = !{!11, !69, !70}
!69 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !52)
!70 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !71)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !73, file: !41, line: 108)
!73 = !DISubprogram(name: "fgets", scope: !44, file: !44, line: 592, type: !74, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!74 = !DISubroutineType(types: !75)
!75 = !{!32, !76, !11, !69}
!76 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !32)
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !78, file: !41, line: 109)
!78 = !DISubprogram(name: "fopen", scope: !44, file: !44, line: 258, type: !79, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!79 = !DISubroutineType(types: !80)
!80 = !{!52, !81, !81}
!81 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !82)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !33)
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !85, file: !41, line: 110)
!85 = !DISubprogram(name: "fprintf", scope: !44, file: !44, line: 350, type: !86, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!86 = !DISubroutineType(types: !87)
!87 = !{!11, !69, !81, null}
!88 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !89, file: !41, line: 111)
!89 = !DISubprogram(name: "fputc", scope: !44, file: !44, line: 549, type: !90, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!90 = !DISubroutineType(types: !91)
!91 = !{!11, !11, !52}
!92 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !93, file: !41, line: 112)
!93 = !DISubprogram(name: "fputs", scope: !44, file: !44, line: 655, type: !94, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!94 = !DISubroutineType(types: !95)
!95 = !{!11, !81, !69}
!96 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !97, file: !41, line: 113)
!97 = !DISubprogram(name: "fread", scope: !44, file: !44, line: 675, type: !98, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!98 = !DISubroutineType(types: !99)
!99 = !{!100, !103, !100, !100, !69}
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !101, line: 62, baseType: !102)
!101 = !DIFile(filename: "/home/gabriel/Documents/hls-llvm-project/hls-build/lib/clang/7.0.0/include/stddef.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!102 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!103 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !104)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !106, file: !41, line: 114)
!106 = !DISubprogram(name: "freopen", scope: !44, file: !44, line: 265, type: !107, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!107 = !DISubroutineType(types: !108)
!108 = !{!52, !81, !81, !69}
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !110, file: !41, line: 115)
!110 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !44, file: !44, line: 434, type: !86, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !112, file: !41, line: 116)
!112 = !DISubprogram(name: "fseek", scope: !44, file: !44, line: 713, type: !113, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!113 = !DISubroutineType(types: !114)
!114 = !{!11, !52, !115, !11}
!115 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!116 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !117, file: !41, line: 117)
!117 = !DISubprogram(name: "fsetpos", scope: !44, file: !44, line: 765, type: !118, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!118 = !DISubroutineType(types: !119)
!119 = !{!11, !52, !120}
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!121 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !43)
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !123, file: !41, line: 118)
!123 = !DISubprogram(name: "ftell", scope: !44, file: !44, line: 718, type: !124, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!124 = !DISubroutineType(types: !125)
!125 = !{!115, !52}
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !127, file: !41, line: 119)
!127 = !DISubprogram(name: "fwrite", scope: !44, file: !44, line: 681, type: !128, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!128 = !DISubroutineType(types: !129)
!129 = !{!100, !130, !100, !100, !69}
!130 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !131)
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!132 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !134, file: !41, line: 120)
!134 = !DISubprogram(name: "getc", scope: !44, file: !44, line: 514, type: !55, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !136, file: !41, line: 121)
!136 = !DISubprogram(name: "getchar", scope: !44, file: !44, line: 520, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DISubroutineType(types: !138)
!138 = !{!11}
!139 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !140, file: !41, line: 126)
!140 = !DISubprogram(name: "perror", scope: !44, file: !44, line: 804, type: !141, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!141 = !DISubroutineType(types: !142)
!142 = !{null, !82}
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !144, file: !41, line: 127)
!144 = !DISubprogram(name: "printf", scope: !44, file: !44, line: 356, type: !145, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DISubroutineType(types: !146)
!146 = !{!11, !81, null}
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !148, file: !41, line: 128)
!148 = !DISubprogram(name: "putc", scope: !44, file: !44, line: 550, type: !90, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !150, file: !41, line: 129)
!150 = !DISubprogram(name: "putchar", scope: !44, file: !44, line: 556, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DISubroutineType(types: !152)
!152 = !{!11, !11}
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !154, file: !41, line: 130)
!154 = !DISubprogram(name: "puts", scope: !44, file: !44, line: 661, type: !155, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DISubroutineType(types: !156)
!156 = !{!11, !82}
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !158, file: !41, line: 131)
!158 = !DISubprogram(name: "remove", scope: !44, file: !44, line: 152, type: !155, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !160, file: !41, line: 132)
!160 = !DISubprogram(name: "rename", scope: !44, file: !44, line: 154, type: !161, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DISubroutineType(types: !162)
!162 = !{!11, !82, !82}
!163 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !164, file: !41, line: 133)
!164 = !DISubprogram(name: "rewind", scope: !44, file: !44, line: 723, type: !50, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !166, file: !41, line: 134)
!166 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !44, file: !44, line: 437, type: !145, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !168, file: !41, line: 135)
!168 = !DISubprogram(name: "setbuf", scope: !44, file: !44, line: 328, type: !169, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!169 = !DISubroutineType(types: !170)
!170 = !{null, !69, !76}
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !172, file: !41, line: 136)
!172 = !DISubprogram(name: "setvbuf", scope: !44, file: !44, line: 332, type: !173, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!173 = !DISubroutineType(types: !174)
!174 = !{!11, !69, !76, !11, !100}
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !176, file: !41, line: 137)
!176 = !DISubprogram(name: "sprintf", scope: !44, file: !44, line: 358, type: !177, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DISubroutineType(types: !178)
!178 = !{!11, !76, !81, null}
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !180, file: !41, line: 138)
!180 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !44, file: !44, line: 439, type: !181, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DISubroutineType(types: !182)
!182 = !{!11, !81, !81, null}
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !184, file: !41, line: 139)
!184 = !DISubprogram(name: "tmpfile", scope: !44, file: !44, line: 188, type: !185, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DISubroutineType(types: !186)
!186 = !{!52}
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !188, file: !41, line: 141)
!188 = !DISubprogram(name: "tmpnam", scope: !44, file: !44, line: 205, type: !189, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DISubroutineType(types: !190)
!190 = !{!32, !32}
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !192, file: !41, line: 143)
!192 = !DISubprogram(name: "ungetc", scope: !44, file: !44, line: 668, type: !90, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !194, file: !41, line: 144)
!194 = !DISubprogram(name: "vfprintf", scope: !44, file: !44, line: 365, type: !195, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!195 = !DISubroutineType(types: !196)
!196 = !{!11, !69, !81, !197}
!197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !198, size: 64)
!198 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !29, size: 192, flags: DIFlagTypePassByValue, elements: !199, identifier: "_ZTS13__va_list_tag")
!199 = !{!200, !202, !203, !204}
!200 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !198, file: !29, baseType: !201, size: 32)
!201 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !198, file: !29, baseType: !201, size: 32, offset: 32)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !198, file: !29, baseType: !104, size: 64, offset: 64)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !198, file: !29, baseType: !104, size: 64, offset: 128)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !206, file: !41, line: 145)
!206 = !DISubprogram(name: "vprintf", scope: !44, file: !44, line: 371, type: !207, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!207 = !DISubroutineType(types: !208)
!208 = !{!11, !81, !197}
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !210, file: !41, line: 146)
!210 = !DISubprogram(name: "vsprintf", scope: !44, file: !44, line: 373, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DISubroutineType(types: !212)
!212 = !{!11, !76, !81, !197}
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !215, file: !41, line: 175)
!214 = !DINamespace(name: "__gnu_cxx", scope: null)
!215 = !DISubprogram(name: "snprintf", scope: !44, file: !44, line: 378, type: !216, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!216 = !DISubroutineType(types: !217)
!217 = !{!11, !76, !100, !81, null}
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !219, file: !41, line: 176)
!219 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !44, file: !44, line: 479, type: !195, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !221, file: !41, line: 177)
!221 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !44, file: !44, line: 484, type: !207, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !223, file: !41, line: 178)
!223 = !DISubprogram(name: "vsnprintf", scope: !44, file: !44, line: 382, type: !224, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!224 = !DISubroutineType(types: !225)
!225 = !{!11, !76, !100, !81, !197}
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !227, file: !41, line: 179)
!227 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !44, file: !44, line: 487, type: !228, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!228 = !DISubroutineType(types: !229)
!229 = !{!11, !81, !81, !197}
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !215, file: !41, line: 185)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !219, file: !41, line: 186)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !221, file: !41, line: 187)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !223, file: !41, line: 188)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !227, file: !41, line: 189)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !236, file: !238, line: 52)
!236 = !DISubprogram(name: "abs", scope: !237, file: !237, line: 848, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!237 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!238 = !DIFile(filename: "/usr/include/c++/11/bits/std_abs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !240, file: !242, line: 127)
!240 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !237, line: 63, baseType: !241)
!241 = !DICompositeType(tag: DW_TAG_structure_type, file: !237, line: 59, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!242 = !DIFile(filename: "/usr/include/c++/11/cstdlib", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !244, file: !242, line: 128)
!244 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !237, line: 71, baseType: !245)
!245 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !237, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !246, identifier: "_ZTS6ldiv_t")
!246 = !{!247, !248}
!247 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !245, file: !237, line: 69, baseType: !115, size: 64)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !245, file: !237, line: 70, baseType: !115, size: 64, offset: 64)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !250, file: !242, line: 130)
!250 = !DISubprogram(name: "abort", scope: !237, file: !237, line: 598, type: !251, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!251 = !DISubroutineType(types: !252)
!252 = !{null}
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !254, file: !242, line: 134)
!254 = !DISubprogram(name: "atexit", scope: !237, file: !237, line: 602, type: !255, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!255 = !DISubroutineType(types: !256)
!256 = !{!11, !257}
!257 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !251, size: 64)
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !259, file: !242, line: 137)
!259 = !DISubprogram(name: "at_quick_exit", scope: !237, file: !237, line: 607, type: !255, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !261, file: !242, line: 140)
!261 = !DISubprogram(name: "atof", scope: !237, file: !237, line: 102, type: !262, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!262 = !DISubroutineType(types: !263)
!263 = !{!264, !82}
!264 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !266, file: !242, line: 141)
!266 = !DISubprogram(name: "atoi", scope: !237, file: !237, line: 105, type: !155, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !268, file: !242, line: 142)
!268 = !DISubprogram(name: "atol", scope: !237, file: !237, line: 108, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!269 = !DISubroutineType(types: !270)
!270 = !{!115, !82}
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !272, file: !242, line: 143)
!272 = !DISubprogram(name: "bsearch", scope: !237, file: !237, line: 828, type: !273, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!273 = !DISubroutineType(types: !274)
!274 = !{!104, !131, !131, !100, !100, !275}
!275 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !237, line: 816, baseType: !276)
!276 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !277, size: 64)
!277 = !DISubroutineType(types: !278)
!278 = !{!11, !131, !131}
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !280, file: !242, line: 144)
!280 = !DISubprogram(name: "calloc", scope: !237, file: !237, line: 543, type: !281, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!281 = !DISubroutineType(types: !282)
!282 = !{!104, !100, !100}
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !284, file: !242, line: 145)
!284 = !DISubprogram(name: "div", scope: !237, file: !237, line: 860, type: !285, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!285 = !DISubroutineType(types: !286)
!286 = !{!240, !11, !11}
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !288, file: !242, line: 146)
!288 = !DISubprogram(name: "exit", scope: !237, file: !237, line: 624, type: !289, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!289 = !DISubroutineType(types: !290)
!290 = !{null, !11}
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !292, file: !242, line: 147)
!292 = !DISubprogram(name: "free", scope: !237, file: !237, line: 555, type: !293, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!293 = !DISubroutineType(types: !294)
!294 = !{null, !104}
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !296, file: !242, line: 148)
!296 = !DISubprogram(name: "getenv", scope: !237, file: !237, line: 641, type: !297, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!297 = !DISubroutineType(types: !298)
!298 = !{!32, !82}
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !300, file: !242, line: 149)
!300 = !DISubprogram(name: "labs", scope: !237, file: !237, line: 849, type: !301, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!301 = !DISubroutineType(types: !302)
!302 = !{!115, !115}
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !304, file: !242, line: 150)
!304 = !DISubprogram(name: "ldiv", scope: !237, file: !237, line: 862, type: !305, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!305 = !DISubroutineType(types: !306)
!306 = !{!244, !115, !115}
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !308, file: !242, line: 151)
!308 = !DISubprogram(name: "malloc", scope: !237, file: !237, line: 540, type: !309, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!309 = !DISubroutineType(types: !310)
!310 = !{!104, !100}
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !312, file: !242, line: 153)
!312 = !DISubprogram(name: "mblen", scope: !237, file: !237, line: 930, type: !313, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!313 = !DISubroutineType(types: !314)
!314 = !{!11, !82, !100}
!315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !316, file: !242, line: 154)
!316 = !DISubprogram(name: "mbstowcs", scope: !237, file: !237, line: 941, type: !317, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!317 = !DISubroutineType(types: !318)
!318 = !{!100, !319, !81, !100}
!319 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !320)
!320 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !321, size: 64)
!321 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !323, file: !242, line: 155)
!323 = !DISubprogram(name: "mbtowc", scope: !237, file: !237, line: 933, type: !324, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!324 = !DISubroutineType(types: !325)
!325 = !{!11, !319, !81, !100}
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !327, file: !242, line: 157)
!327 = !DISubprogram(name: "qsort", scope: !237, file: !237, line: 838, type: !328, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!328 = !DISubroutineType(types: !329)
!329 = !{null, !104, !100, !100, !275}
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !331, file: !242, line: 160)
!331 = !DISubprogram(name: "quick_exit", scope: !237, file: !237, line: 630, type: !289, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !333, file: !242, line: 163)
!333 = !DISubprogram(name: "rand", scope: !237, file: !237, line: 454, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !335, file: !242, line: 164)
!335 = !DISubprogram(name: "realloc", scope: !237, file: !237, line: 551, type: !336, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!336 = !DISubroutineType(types: !337)
!337 = !{!104, !104, !100}
!338 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !339, file: !242, line: 165)
!339 = !DISubprogram(name: "srand", scope: !237, file: !237, line: 456, type: !340, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!340 = !DISubroutineType(types: !341)
!341 = !{null, !201}
!342 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !343, file: !242, line: 166)
!343 = !DISubprogram(name: "strtod", scope: !237, file: !237, line: 118, type: !344, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!344 = !DISubroutineType(types: !345)
!345 = !{!264, !81, !346}
!346 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !347)
!347 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !349, file: !242, line: 167)
!349 = !DISubprogram(name: "strtol", scope: !237, file: !237, line: 177, type: !350, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!350 = !DISubroutineType(types: !351)
!351 = !{!115, !81, !346, !11}
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !353, file: !242, line: 168)
!353 = !DISubprogram(name: "strtoul", scope: !237, file: !237, line: 181, type: !354, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!354 = !DISubroutineType(types: !355)
!355 = !{!102, !81, !346, !11}
!356 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !357, file: !242, line: 169)
!357 = !DISubprogram(name: "system", scope: !237, file: !237, line: 791, type: !155, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !359, file: !242, line: 171)
!359 = !DISubprogram(name: "wcstombs", scope: !237, file: !237, line: 945, type: !360, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!360 = !DISubroutineType(types: !361)
!361 = !{!100, !76, !362, !100}
!362 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !363)
!363 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !364, size: 64)
!364 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !321)
!365 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !366, file: !242, line: 172)
!366 = !DISubprogram(name: "wctomb", scope: !237, file: !237, line: 937, type: !367, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!367 = !DISubroutineType(types: !368)
!368 = !{!11, !32, !321}
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !370, file: !242, line: 200)
!370 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !237, line: 81, baseType: !371)
!371 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !237, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !372, identifier: "_ZTS7lldiv_t")
!372 = !{!373, !375}
!373 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !371, file: !237, line: 79, baseType: !374, size: 64)
!374 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!375 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !371, file: !237, line: 80, baseType: !374, size: 64, offset: 64)
!376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !377, file: !242, line: 206)
!377 = !DISubprogram(name: "_Exit", scope: !237, file: !237, line: 636, type: !289, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !379, file: !242, line: 210)
!379 = !DISubprogram(name: "llabs", scope: !237, file: !237, line: 852, type: !380, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!380 = !DISubroutineType(types: !381)
!381 = !{!374, !374}
!382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !383, file: !242, line: 216)
!383 = !DISubprogram(name: "lldiv", scope: !237, file: !237, line: 866, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!384 = !DISubroutineType(types: !385)
!385 = !{!370, !374, !374}
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !387, file: !242, line: 227)
!387 = !DISubprogram(name: "atoll", scope: !237, file: !237, line: 113, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!388 = !DISubroutineType(types: !389)
!389 = !{!374, !82}
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !391, file: !242, line: 228)
!391 = !DISubprogram(name: "strtoll", scope: !237, file: !237, line: 201, type: !392, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!392 = !DISubroutineType(types: !393)
!393 = !{!374, !81, !346, !11}
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !395, file: !242, line: 229)
!395 = !DISubprogram(name: "strtoull", scope: !237, file: !237, line: 206, type: !396, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!396 = !DISubroutineType(types: !397)
!397 = !{!398, !81, !346, !11}
!398 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !400, file: !242, line: 231)
!400 = !DISubprogram(name: "strtof", scope: !237, file: !237, line: 124, type: !401, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!401 = !DISubroutineType(types: !402)
!402 = !{!403, !81, !346}
!403 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !405, file: !242, line: 232)
!405 = !DISubprogram(name: "strtold", scope: !237, file: !237, line: 127, type: !406, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!406 = !DISubroutineType(types: !407)
!407 = !{!408, !81, !346}
!408 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !370, file: !242, line: 240)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !377, file: !242, line: 242)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !379, file: !242, line: 244)
!412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !413, file: !242, line: 245)
!413 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !214, file: !242, line: 213, type: !384, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !383, file: !242, line: 246)
!415 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !387, file: !242, line: 248)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !400, file: !242, line: 249)
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !391, file: !242, line: 250)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !395, file: !242, line: 251)
!419 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !405, file: !242, line: 252)
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !250, file: !421, line: 38)
!421 = !DIFile(filename: "/usr/include/c++/11/stdlib.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !254, file: !421, line: 39)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !288, file: !421, line: 40)
!424 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !259, file: !421, line: 43)
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !331, file: !421, line: 46)
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !240, file: !421, line: 51)
!427 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !244, file: !421, line: 52)
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !429, file: !421, line: 54)
!429 = !DISubprogram(name: "abs", linkageName: "_ZSt3absg", scope: !2, file: !238, line: 103, type: !430, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!430 = !DISubroutineType(types: !431)
!431 = !{!432, !432}
!432 = !DIBasicType(name: "__float128", size: 128, encoding: DW_ATE_float)
!433 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !261, file: !421, line: 55)
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !266, file: !421, line: 56)
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !268, file: !421, line: 57)
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !272, file: !421, line: 58)
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !280, file: !421, line: 59)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !413, file: !421, line: 60)
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !292, file: !421, line: 61)
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !296, file: !421, line: 62)
!441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !300, file: !421, line: 63)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !304, file: !421, line: 64)
!443 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !308, file: !421, line: 65)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !312, file: !421, line: 67)
!445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !316, file: !421, line: 68)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !323, file: !421, line: 69)
!447 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !327, file: !421, line: 71)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !333, file: !421, line: 72)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !335, file: !421, line: 73)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !339, file: !421, line: 74)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !343, file: !421, line: 75)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !349, file: !421, line: 76)
!453 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !353, file: !421, line: 77)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !357, file: !421, line: 78)
!455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !359, file: !421, line: 80)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !28, entity: !366, file: !421, line: 81)
!457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !458, file: !473, line: 64)
!458 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !459, line: 6, baseType: !460)
!459 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!460 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !461, line: 21, baseType: !462)
!461 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!462 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !461, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !463, identifier: "_ZTS11__mbstate_t")
!463 = !{!464, !465}
!464 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !462, file: !461, line: 15, baseType: !11, size: 32)
!465 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !462, file: !461, line: 20, baseType: !466, size: 32, offset: 32)
!466 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !462, file: !461, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !467, identifier: "_ZTSN11__mbstate_tUt_E")
!467 = !{!468, !469}
!468 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !466, file: !461, line: 18, baseType: !201, size: 32)
!469 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !466, file: !461, line: 19, baseType: !470, size: 32)
!470 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 32, elements: !471)
!471 = !{!472}
!472 = !DISubrange(count: 4)
!473 = !DIFile(filename: "/usr/include/c++/11/cwchar", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !475, file: !473, line: 141)
!475 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !476, line: 20, baseType: !201)
!476 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !478, file: !473, line: 143)
!478 = !DISubprogram(name: "btowc", scope: !479, file: !479, line: 285, type: !480, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!479 = !DIFile(filename: "/usr/include/wchar.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!480 = !DISubroutineType(types: !481)
!481 = !{!475, !11}
!482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !483, file: !473, line: 144)
!483 = !DISubprogram(name: "fgetwc", scope: !479, file: !479, line: 744, type: !484, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!484 = !DISubroutineType(types: !485)
!485 = !{!475, !486}
!486 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !487, size: 64)
!487 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !488, line: 5, baseType: !39)
!488 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!489 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !490, file: !473, line: 145)
!490 = !DISubprogram(name: "fgetws", scope: !479, file: !479, line: 773, type: !491, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!491 = !DISubroutineType(types: !492)
!492 = !{!320, !319, !11, !493}
!493 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !486)
!494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !495, file: !473, line: 146)
!495 = !DISubprogram(name: "fputwc", scope: !479, file: !479, line: 758, type: !496, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!496 = !DISubroutineType(types: !497)
!497 = !{!475, !321, !486}
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !499, file: !473, line: 147)
!499 = !DISubprogram(name: "fputws", scope: !479, file: !479, line: 780, type: !500, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DISubroutineType(types: !501)
!501 = !{!11, !362, !493}
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !503, file: !473, line: 148)
!503 = !DISubprogram(name: "fwide", scope: !479, file: !479, line: 588, type: !504, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DISubroutineType(types: !505)
!505 = !{!11, !486, !11}
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !507, file: !473, line: 149)
!507 = !DISubprogram(name: "fwprintf", scope: !479, file: !479, line: 595, type: !508, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!508 = !DISubroutineType(types: !509)
!509 = !{!11, !493, !362, null}
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !511, file: !473, line: 150)
!511 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !479, file: !479, line: 657, type: !508, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !513, file: !473, line: 151)
!513 = !DISubprogram(name: "getwc", scope: !479, file: !479, line: 745, type: !484, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !515, file: !473, line: 152)
!515 = !DISubprogram(name: "getwchar", scope: !479, file: !479, line: 751, type: !516, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!516 = !DISubroutineType(types: !517)
!517 = !{!475}
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !519, file: !473, line: 153)
!519 = !DISubprogram(name: "mbrlen", scope: !479, file: !479, line: 308, type: !520, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!520 = !DISubroutineType(types: !521)
!521 = !{!100, !81, !100, !522}
!522 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !523)
!523 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !458, size: 64)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !525, file: !473, line: 154)
!525 = !DISubprogram(name: "mbrtowc", scope: !479, file: !479, line: 297, type: !526, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!526 = !DISubroutineType(types: !527)
!527 = !{!100, !319, !81, !100, !522}
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !529, file: !473, line: 155)
!529 = !DISubprogram(name: "mbsinit", scope: !479, file: !479, line: 293, type: !530, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!530 = !DISubroutineType(types: !531)
!531 = !{!11, !532}
!532 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !533, size: 64)
!533 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !458)
!534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !535, file: !473, line: 156)
!535 = !DISubprogram(name: "mbsrtowcs", scope: !479, file: !479, line: 338, type: !536, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!536 = !DISubroutineType(types: !537)
!537 = !{!100, !319, !538, !100, !522}
!538 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !539)
!539 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !541, file: !473, line: 157)
!541 = !DISubprogram(name: "putwc", scope: !479, file: !479, line: 759, type: !496, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !543, file: !473, line: 158)
!543 = !DISubprogram(name: "putwchar", scope: !479, file: !479, line: 765, type: !544, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!544 = !DISubroutineType(types: !545)
!545 = !{!475, !321}
!546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !547, file: !473, line: 160)
!547 = !DISubprogram(name: "swprintf", scope: !479, file: !479, line: 605, type: !548, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!548 = !DISubroutineType(types: !549)
!549 = !{!11, !319, !100, !362, null}
!550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !551, file: !473, line: 162)
!551 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !479, file: !479, line: 664, type: !552, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!552 = !DISubroutineType(types: !553)
!553 = !{!11, !362, !362, null}
!554 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !555, file: !473, line: 163)
!555 = !DISubprogram(name: "ungetwc", scope: !479, file: !479, line: 788, type: !556, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!556 = !DISubroutineType(types: !557)
!557 = !{!475, !475, !486}
!558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !559, file: !473, line: 164)
!559 = !DISubprogram(name: "vfwprintf", scope: !479, file: !479, line: 613, type: !560, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!560 = !DISubroutineType(types: !561)
!561 = !{!11, !493, !362, !197}
!562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !563, file: !473, line: 166)
!563 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !479, file: !479, line: 711, type: !560, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !565, file: !473, line: 169)
!565 = !DISubprogram(name: "vswprintf", scope: !479, file: !479, line: 626, type: !566, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!566 = !DISubroutineType(types: !567)
!567 = !{!11, !319, !100, !362, !197}
!568 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !569, file: !473, line: 172)
!569 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !479, file: !479, line: 718, type: !570, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!570 = !DISubroutineType(types: !571)
!571 = !{!11, !362, !362, !197}
!572 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !573, file: !473, line: 174)
!573 = !DISubprogram(name: "vwprintf", scope: !479, file: !479, line: 621, type: !574, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!574 = !DISubroutineType(types: !575)
!575 = !{!11, !362, !197}
!576 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !577, file: !473, line: 176)
!577 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !479, file: !479, line: 715, type: !574, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!578 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !579, file: !473, line: 178)
!579 = !DISubprogram(name: "wcrtomb", scope: !479, file: !479, line: 302, type: !580, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!580 = !DISubroutineType(types: !581)
!581 = !{!100, !76, !321, !522}
!582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !583, file: !473, line: 179)
!583 = !DISubprogram(name: "wcscat", scope: !479, file: !479, line: 97, type: !584, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!584 = !DISubroutineType(types: !585)
!585 = !{!320, !319, !362}
!586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !587, file: !473, line: 180)
!587 = !DISubprogram(name: "wcscmp", scope: !479, file: !479, line: 106, type: !588, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!588 = !DISubroutineType(types: !589)
!589 = !{!11, !363, !363}
!590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !591, file: !473, line: 181)
!591 = !DISubprogram(name: "wcscoll", scope: !479, file: !479, line: 131, type: !588, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !593, file: !473, line: 182)
!593 = !DISubprogram(name: "wcscpy", scope: !479, file: !479, line: 87, type: !584, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !595, file: !473, line: 183)
!595 = !DISubprogram(name: "wcscspn", scope: !479, file: !479, line: 188, type: !596, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!596 = !DISubroutineType(types: !597)
!597 = !{!100, !363, !363}
!598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !599, file: !473, line: 184)
!599 = !DISubprogram(name: "wcsftime", scope: !479, file: !479, line: 852, type: !600, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!600 = !DISubroutineType(types: !601)
!601 = !{!100, !319, !100, !362, !602}
!602 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !603)
!603 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !604, size: 64)
!604 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !605)
!605 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !479, line: 83, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!606 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !607, file: !473, line: 185)
!607 = !DISubprogram(name: "wcslen", scope: !479, file: !479, line: 223, type: !608, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!608 = !DISubroutineType(types: !609)
!609 = !{!100, !363}
!610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !611, file: !473, line: 186)
!611 = !DISubprogram(name: "wcsncat", scope: !479, file: !479, line: 101, type: !612, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!612 = !DISubroutineType(types: !613)
!613 = !{!320, !319, !362, !100}
!614 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !615, file: !473, line: 187)
!615 = !DISubprogram(name: "wcsncmp", scope: !479, file: !479, line: 109, type: !616, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!616 = !DISubroutineType(types: !617)
!617 = !{!11, !363, !363, !100}
!618 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !619, file: !473, line: 188)
!619 = !DISubprogram(name: "wcsncpy", scope: !479, file: !479, line: 92, type: !612, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !621, file: !473, line: 189)
!621 = !DISubprogram(name: "wcsrtombs", scope: !479, file: !479, line: 344, type: !622, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!622 = !DISubroutineType(types: !623)
!623 = !{!100, !76, !624, !100, !522}
!624 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !625)
!625 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !363, size: 64)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !627, file: !473, line: 190)
!627 = !DISubprogram(name: "wcsspn", scope: !479, file: !479, line: 192, type: !596, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !629, file: !473, line: 191)
!629 = !DISubprogram(name: "wcstod", scope: !479, file: !479, line: 378, type: !630, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!630 = !DISubroutineType(types: !631)
!631 = !{!264, !362, !632}
!632 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !633)
!633 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !320, size: 64)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !635, file: !473, line: 193)
!635 = !DISubprogram(name: "wcstof", scope: !479, file: !479, line: 383, type: !636, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!636 = !DISubroutineType(types: !637)
!637 = !{!403, !362, !632}
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !639, file: !473, line: 195)
!639 = !DISubprogram(name: "wcstok", scope: !479, file: !479, line: 218, type: !640, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!640 = !DISubroutineType(types: !641)
!641 = !{!320, !319, !362, !632}
!642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !643, file: !473, line: 196)
!643 = !DISubprogram(name: "wcstol", scope: !479, file: !479, line: 429, type: !644, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!644 = !DISubroutineType(types: !645)
!645 = !{!115, !362, !632, !11}
!646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !647, file: !473, line: 197)
!647 = !DISubprogram(name: "wcstoul", scope: !479, file: !479, line: 434, type: !648, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!648 = !DISubroutineType(types: !649)
!649 = !{!102, !362, !632, !11}
!650 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !651, file: !473, line: 198)
!651 = !DISubprogram(name: "wcsxfrm", scope: !479, file: !479, line: 135, type: !652, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!652 = !DISubroutineType(types: !653)
!653 = !{!100, !319, !362, !100}
!654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !655, file: !473, line: 199)
!655 = !DISubprogram(name: "wctob", scope: !479, file: !479, line: 289, type: !656, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!656 = !DISubroutineType(types: !657)
!657 = !{!11, !475}
!658 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !659, file: !473, line: 200)
!659 = !DISubprogram(name: "wmemcmp", scope: !479, file: !479, line: 259, type: !616, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !661, file: !473, line: 201)
!661 = !DISubprogram(name: "wmemcpy", scope: !479, file: !479, line: 263, type: !612, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!662 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !663, file: !473, line: 202)
!663 = !DISubprogram(name: "wmemmove", scope: !479, file: !479, line: 268, type: !664, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!664 = !DISubroutineType(types: !665)
!665 = !{!320, !320, !363, !100}
!666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !667, file: !473, line: 203)
!667 = !DISubprogram(name: "wmemset", scope: !479, file: !479, line: 272, type: !668, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!668 = !DISubroutineType(types: !669)
!669 = !{!320, !320, !321, !100}
!670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !671, file: !473, line: 204)
!671 = !DISubprogram(name: "wprintf", scope: !479, file: !479, line: 602, type: !672, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!672 = !DISubroutineType(types: !673)
!673 = !{!11, !362, null}
!674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !675, file: !473, line: 205)
!675 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !479, file: !479, line: 661, type: !672, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !677, file: !473, line: 206)
!677 = !DISubprogram(name: "wcschr", scope: !479, file: !479, line: 165, type: !678, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!678 = !DISubroutineType(types: !679)
!679 = !{!320, !363, !321}
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !681, file: !473, line: 207)
!681 = !DISubprogram(name: "wcspbrk", scope: !479, file: !479, line: 202, type: !682, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!682 = !DISubroutineType(types: !683)
!683 = !{!320, !363, !363}
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !685, file: !473, line: 208)
!685 = !DISubprogram(name: "wcsrchr", scope: !479, file: !479, line: 175, type: !678, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!686 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !687, file: !473, line: 209)
!687 = !DISubprogram(name: "wcsstr", scope: !479, file: !479, line: 213, type: !682, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !689, file: !473, line: 210)
!689 = !DISubprogram(name: "wmemchr", scope: !479, file: !479, line: 254, type: !690, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!690 = !DISubroutineType(types: !691)
!691 = !{!320, !363, !321, !100}
!692 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !693, file: !473, line: 251)
!693 = !DISubprogram(name: "wcstold", scope: !479, file: !479, line: 385, type: !694, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!694 = !DISubroutineType(types: !695)
!695 = !{!408, !362, !632}
!696 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !697, file: !473, line: 260)
!697 = !DISubprogram(name: "wcstoll", scope: !479, file: !479, line: 442, type: !698, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!698 = !DISubroutineType(types: !699)
!699 = !{!374, !362, !632, !11}
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !214, entity: !701, file: !473, line: 261)
!701 = !DISubprogram(name: "wcstoull", scope: !479, file: !479, line: 449, type: !702, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!702 = !DISubroutineType(types: !703)
!703 = !{!398, !362, !632, !11}
!704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !693, file: !473, line: 267)
!705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !697, file: !473, line: 268)
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !701, file: !473, line: 269)
!707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !635, file: !473, line: 283)
!708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !563, file: !473, line: 286)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !569, file: !473, line: 289)
!710 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !577, file: !473, line: 292)
!711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !693, file: !473, line: 296)
!712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !697, file: !473, line: 297)
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !701, file: !473, line: 298)
!714 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !715, file: !716, line: 68)
!715 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !717, file: !716, line: 90, size: 64, flags: DIFlagTypePassByReference, elements: !718, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!716 = !DIFile(filename: "/usr/include/c++/11/bits/exception_ptr.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!717 = !DINamespace(name: "__exception_ptr", scope: !2)
!718 = !{!719, !720, !724, !727, !728, !733, !734, !738, !744, !748, !752, !755, !756, !759, !762}
!719 = !DIDerivedType(tag: DW_TAG_member, name: "_M_exception_object", scope: !715, file: !716, line: 92, baseType: !104, size: 64)
!720 = !DISubprogram(name: "exception_ptr", scope: !715, file: !716, line: 94, type: !721, isLocal: false, isDefinition: false, scopeLine: 94, flags: DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!721 = !DISubroutineType(types: !722)
!722 = !{null, !723, !104}
!723 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !715, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!724 = !DISubprogram(name: "_M_addref", linkageName: "_ZNSt15__exception_ptr13exception_ptr9_M_addrefEv", scope: !715, file: !716, line: 96, type: !725, isLocal: false, isDefinition: false, scopeLine: 96, flags: DIFlagPrototyped, isOptimized: false)
!725 = !DISubroutineType(types: !726)
!726 = !{null, !723}
!727 = !DISubprogram(name: "_M_release", linkageName: "_ZNSt15__exception_ptr13exception_ptr10_M_releaseEv", scope: !715, file: !716, line: 97, type: !725, isLocal: false, isDefinition: false, scopeLine: 97, flags: DIFlagPrototyped, isOptimized: false)
!728 = !DISubprogram(name: "_M_get", linkageName: "_ZNKSt15__exception_ptr13exception_ptr6_M_getEv", scope: !715, file: !716, line: 99, type: !729, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPrototyped, isOptimized: false)
!729 = !DISubroutineType(types: !730)
!730 = !{!104, !731}
!731 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !732, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!732 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !715)
!733 = !DISubprogram(name: "exception_ptr", scope: !715, file: !716, line: 107, type: !725, isLocal: false, isDefinition: false, scopeLine: 107, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!734 = !DISubprogram(name: "exception_ptr", scope: !715, file: !716, line: 109, type: !735, isLocal: false, isDefinition: false, scopeLine: 109, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!735 = !DISubroutineType(types: !736)
!736 = !{null, !723, !737}
!737 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !732, size: 64)
!738 = !DISubprogram(name: "exception_ptr", scope: !715, file: !716, line: 112, type: !739, isLocal: false, isDefinition: false, scopeLine: 112, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!739 = !DISubroutineType(types: !740)
!740 = !{null, !723, !741}
!741 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !2, file: !742, line: 302, baseType: !743)
!742 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/c++config.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!743 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!744 = !DISubprogram(name: "exception_ptr", scope: !715, file: !716, line: 116, type: !745, isLocal: false, isDefinition: false, scopeLine: 116, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!745 = !DISubroutineType(types: !746)
!746 = !{null, !723, !747}
!747 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !715, size: 64)
!748 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSERKS0_", scope: !715, file: !716, line: 129, type: !749, isLocal: false, isDefinition: false, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!749 = !DISubroutineType(types: !750)
!750 = !{!751, !723, !737}
!751 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !715, size: 64)
!752 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSEOS0_", scope: !715, file: !716, line: 133, type: !753, isLocal: false, isDefinition: false, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!753 = !DISubroutineType(types: !754)
!754 = !{!751, !723, !747}
!755 = !DISubprogram(name: "~exception_ptr", scope: !715, file: !716, line: 140, type: !725, isLocal: false, isDefinition: false, scopeLine: 140, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!756 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr13exception_ptr4swapERS0_", scope: !715, file: !716, line: 143, type: !757, isLocal: false, isDefinition: false, scopeLine: 143, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!757 = !DISubroutineType(types: !758)
!758 = !{null, !723, !751}
!759 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt15__exception_ptr13exception_ptrcvbEv", scope: !715, file: !716, line: 155, type: !760, isLocal: false, isDefinition: false, scopeLine: 155, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!760 = !DISubroutineType(types: !761)
!761 = !{!13, !731}
!762 = !DISubprogram(name: "__cxa_exception_type", linkageName: "_ZNKSt15__exception_ptr13exception_ptr20__cxa_exception_typeEv", scope: !715, file: !716, line: 176, type: !763, isLocal: false, isDefinition: false, scopeLine: 176, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!763 = !DISubroutineType(types: !764)
!764 = !{!765, !731}
!765 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !766, size: 64)
!766 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !767)
!767 = !DICompositeType(tag: DW_TAG_class_type, name: "type_info", scope: !2, file: !768, line: 88, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt9type_info")
!768 = !DIFile(filename: "/usr/include/c++/11/typeinfo", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !717, entity: !770, file: !716, line: 84)
!770 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !2, file: !716, line: 80, type: !771, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!771 = !DISubroutineType(types: !772)
!772 = !{null, !715}
!773 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !774, entity: !775, file: !776, line: 58)
!774 = !DINamespace(name: "__gnu_debug", scope: null)
!775 = !DINamespace(name: "__debug", scope: !2)
!776 = !DIFile(filename: "/usr/include/c++/11/debug/debug.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !778, file: !783, line: 47)
!778 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !779, line: 24, baseType: !780)
!779 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!780 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !781, line: 37, baseType: !782)
!781 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!782 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!783 = !DIFile(filename: "/usr/include/c++/11/cstdint", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !785, file: !783, line: 48)
!785 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !779, line: 25, baseType: !786)
!786 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !781, line: 39, baseType: !787)
!787 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !789, file: !783, line: 49)
!789 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !779, line: 26, baseType: !790)
!790 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !781, line: 41, baseType: !11)
!791 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !792, file: !783, line: 50)
!792 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !779, line: 27, baseType: !793)
!793 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !781, line: 44, baseType: !115)
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !795, file: !783, line: 52)
!795 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !796, line: 58, baseType: !782)
!796 = !DIFile(filename: "/usr/include/stdint.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !798, file: !783, line: 53)
!798 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !796, line: 60, baseType: !115)
!799 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !800, file: !783, line: 54)
!800 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !796, line: 61, baseType: !115)
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !802, file: !783, line: 55)
!802 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !796, line: 62, baseType: !115)
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !804, file: !783, line: 57)
!804 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !796, line: 43, baseType: !805)
!805 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !781, line: 52, baseType: !780)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !807, file: !783, line: 58)
!807 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !796, line: 44, baseType: !808)
!808 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !781, line: 54, baseType: !786)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !810, file: !783, line: 59)
!810 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !796, line: 45, baseType: !811)
!811 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !781, line: 56, baseType: !790)
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !813, file: !783, line: 60)
!813 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !796, line: 46, baseType: !814)
!814 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !781, line: 58, baseType: !793)
!815 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !816, file: !783, line: 62)
!816 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !796, line: 101, baseType: !817)
!817 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !781, line: 72, baseType: !115)
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !819, file: !783, line: 63)
!819 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !796, line: 87, baseType: !115)
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !821, file: !783, line: 65)
!821 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !822, line: 24, baseType: !823)
!822 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!823 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !781, line: 38, baseType: !824)
!824 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!825 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !826, file: !783, line: 66)
!826 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !822, line: 25, baseType: !827)
!827 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !781, line: 40, baseType: !828)
!828 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !830, file: !783, line: 67)
!830 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !822, line: 26, baseType: !831)
!831 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !781, line: 42, baseType: !201)
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !833, file: !783, line: 68)
!833 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !822, line: 27, baseType: !834)
!834 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !781, line: 45, baseType: !102)
!835 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !836, file: !783, line: 70)
!836 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !796, line: 71, baseType: !824)
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !838, file: !783, line: 71)
!838 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !796, line: 73, baseType: !102)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !840, file: !783, line: 72)
!840 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !796, line: 74, baseType: !102)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !842, file: !783, line: 73)
!842 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !796, line: 75, baseType: !102)
!843 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !844, file: !783, line: 75)
!844 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !796, line: 49, baseType: !845)
!845 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !781, line: 53, baseType: !823)
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !847, file: !783, line: 76)
!847 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !796, line: 50, baseType: !848)
!848 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !781, line: 55, baseType: !827)
!849 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !850, file: !783, line: 77)
!850 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !796, line: 51, baseType: !851)
!851 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !781, line: 57, baseType: !831)
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !853, file: !783, line: 78)
!853 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !796, line: 52, baseType: !854)
!854 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !781, line: 59, baseType: !834)
!855 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !856, file: !783, line: 80)
!856 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !796, line: 102, baseType: !857)
!857 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !781, line: 73, baseType: !102)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !859, file: !783, line: 81)
!859 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !796, line: 90, baseType: !102)
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !861, file: !863, line: 53)
!861 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !862, line: 51, size: 768, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!862 = !DIFile(filename: "/usr/include/locale.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!863 = !DIFile(filename: "/usr/include/c++/11/clocale", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !865, file: !863, line: 54)
!865 = !DISubprogram(name: "setlocale", scope: !862, file: !862, line: 122, type: !866, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!866 = !DISubroutineType(types: !867)
!867 = !{!32, !11, !82}
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !869, file: !863, line: 55)
!869 = !DISubprogram(name: "localeconv", scope: !862, file: !862, line: 125, type: !870, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!870 = !DISubroutineType(types: !871)
!871 = !{!872}
!872 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !861, size: 64)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !874, file: !876, line: 64)
!874 = !DISubprogram(name: "isalnum", scope: !875, file: !875, line: 108, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!875 = !DIFile(filename: "/usr/include/ctype.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!876 = !DIFile(filename: "/usr/include/c++/11/cctype", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!877 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !878, file: !876, line: 65)
!878 = !DISubprogram(name: "isalpha", scope: !875, file: !875, line: 109, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !880, file: !876, line: 66)
!880 = !DISubprogram(name: "iscntrl", scope: !875, file: !875, line: 110, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !882, file: !876, line: 67)
!882 = !DISubprogram(name: "isdigit", scope: !875, file: !875, line: 111, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !884, file: !876, line: 68)
!884 = !DISubprogram(name: "isgraph", scope: !875, file: !875, line: 113, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !886, file: !876, line: 69)
!886 = !DISubprogram(name: "islower", scope: !875, file: !875, line: 112, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !888, file: !876, line: 70)
!888 = !DISubprogram(name: "isprint", scope: !875, file: !875, line: 114, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !890, file: !876, line: 71)
!890 = !DISubprogram(name: "ispunct", scope: !875, file: !875, line: 115, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !892, file: !876, line: 72)
!892 = !DISubprogram(name: "isspace", scope: !875, file: !875, line: 116, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !894, file: !876, line: 73)
!894 = !DISubprogram(name: "isupper", scope: !875, file: !875, line: 117, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !896, file: !876, line: 74)
!896 = !DISubprogram(name: "isxdigit", scope: !875, file: !875, line: 118, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !898, file: !876, line: 75)
!898 = !DISubprogram(name: "tolower", scope: !875, file: !875, line: 122, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !900, file: !876, line: 76)
!900 = !DISubprogram(name: "toupper", scope: !875, file: !875, line: 125, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !902, file: !876, line: 87)
!902 = !DISubprogram(name: "isblank", scope: !875, file: !875, line: 130, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !904, file: !908, line: 82)
!904 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !905, line: 48, baseType: !906)
!905 = !DIFile(filename: "/usr/include/wctype.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!906 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !907, size: 64)
!907 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !790)
!908 = !DIFile(filename: "/usr/include/c++/11/cwctype", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !910, file: !908, line: 83)
!910 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !911, line: 38, baseType: !102)
!911 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !475, file: !908, line: 84)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !914, file: !908, line: 86)
!914 = !DISubprogram(name: "iswalnum", scope: !911, file: !911, line: 95, type: !656, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !916, file: !908, line: 87)
!916 = !DISubprogram(name: "iswalpha", scope: !911, file: !911, line: 101, type: !656, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !918, file: !908, line: 89)
!918 = !DISubprogram(name: "iswblank", scope: !911, file: !911, line: 146, type: !656, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !920, file: !908, line: 91)
!920 = !DISubprogram(name: "iswcntrl", scope: !911, file: !911, line: 104, type: !656, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !922, file: !908, line: 92)
!922 = !DISubprogram(name: "iswctype", scope: !911, file: !911, line: 159, type: !923, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!923 = !DISubroutineType(types: !924)
!924 = !{!11, !475, !910}
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !926, file: !908, line: 93)
!926 = !DISubprogram(name: "iswdigit", scope: !911, file: !911, line: 108, type: !656, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !928, file: !908, line: 94)
!928 = !DISubprogram(name: "iswgraph", scope: !911, file: !911, line: 112, type: !656, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!929 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !930, file: !908, line: 95)
!930 = !DISubprogram(name: "iswlower", scope: !911, file: !911, line: 117, type: !656, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!931 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !932, file: !908, line: 96)
!932 = !DISubprogram(name: "iswprint", scope: !911, file: !911, line: 120, type: !656, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!933 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !934, file: !908, line: 97)
!934 = !DISubprogram(name: "iswpunct", scope: !911, file: !911, line: 125, type: !656, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!935 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !936, file: !908, line: 98)
!936 = !DISubprogram(name: "iswspace", scope: !911, file: !911, line: 130, type: !656, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!937 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !938, file: !908, line: 99)
!938 = !DISubprogram(name: "iswupper", scope: !911, file: !911, line: 135, type: !656, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !940, file: !908, line: 100)
!940 = !DISubprogram(name: "iswxdigit", scope: !911, file: !911, line: 140, type: !656, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!941 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !942, file: !908, line: 101)
!942 = !DISubprogram(name: "towctrans", scope: !905, file: !905, line: 55, type: !943, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!943 = !DISubroutineType(types: !944)
!944 = !{!475, !475, !904}
!945 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !946, file: !908, line: 102)
!946 = !DISubprogram(name: "towlower", scope: !911, file: !911, line: 166, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!947 = !DISubroutineType(types: !948)
!948 = !{!475, !475}
!949 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !950, file: !908, line: 103)
!950 = !DISubprogram(name: "towupper", scope: !911, file: !911, line: 169, type: !947, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!951 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !952, file: !908, line: 104)
!952 = !DISubprogram(name: "wctrans", scope: !905, file: !905, line: 52, type: !953, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!953 = !DISubroutineType(types: !954)
!954 = !{!904, !82}
!955 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !956, file: !908, line: 105)
!956 = !DISubprogram(name: "wctype", scope: !911, file: !911, line: 155, type: !957, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!957 = !DISubroutineType(types: !958)
!958 = !{!910, !82}
!959 = !{i32 2, !"Dwarf Version", i32 4}
!960 = !{i32 2, !"Debug Info Version", i32 3}
!961 = !{i32 1, !"wchar_size", i32 4}
!962 = !{i32 7, !"PIC Level", i32 2}
!963 = !{!"clang version 7.0.0 "}
!964 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !3, file: !3, line: 74, type: !251, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!965 = !DILocation(line: 74, column: 25, scope: !964)
!966 = distinct !DISubprogram(name: "print_usage", linkageName: "_Z11print_usagePc", scope: !29, file: !29, line: 18, type: !967, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!967 = !DISubroutineType(types: !968)
!968 = !{null, !32}
!969 = !DILocalVariable(name: "filename", arg: 1, scope: !966, file: !29, line: 18, type: !32)
!970 = !DILocation(line: 18, column: 24, scope: !966)
!971 = !DILocation(line: 20, column: 69, scope: !966)
!972 = !DILocation(line: 20, column: 5, scope: !966)
!973 = !DILocation(line: 21, column: 1, scope: !966)
!974 = distinct !DISubprogram(name: "parse_command_line_args", linkageName: "_Z23parse_command_line_argsiPPcRiS1_PPyS3_PPh", scope: !29, file: !29, line: 23, type: !975, isLocal: false, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!975 = !DISubroutineType(types: !976)
!976 = !{null, !11, !347, !977, !977, !978, !978, !982}
!977 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !11, size: 64)
!978 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !979, size: 64)
!979 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !980, size: 64)
!980 = !DIDerivedType(tag: DW_TAG_typedef, name: "DigitType", file: !981, line: 17, baseType: !398)
!981 = !DIFile(filename: "../src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!982 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !983, size: 64)
!983 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !984, size: 64)
!984 = !DIDerivedType(tag: DW_TAG_typedef, name: "LabelType", file: !981, line: 18, baseType: !824)
!985 = !DILocalVariable(name: "argc", arg: 1, scope: !974, file: !29, line: 24, type: !11)
!986 = !DILocation(line: 24, column: 7, scope: !974)
!987 = !DILocalVariable(name: "argv", arg: 2, scope: !974, file: !29, line: 24, type: !347)
!988 = !DILocation(line: 24, column: 20, scope: !974)
!989 = !DILocalVariable(name: "num_training", arg: 3, scope: !974, file: !29, line: 25, type: !977)
!990 = !DILocation(line: 25, column: 8, scope: !974)
!991 = !DILocalVariable(name: "num_test", arg: 4, scope: !974, file: !29, line: 26, type: !977)
!992 = !DILocation(line: 26, column: 8, scope: !974)
!993 = !DILocalVariable(name: "training_data", arg: 5, scope: !974, file: !29, line: 27, type: !978)
!994 = !DILocation(line: 27, column: 15, scope: !974)
!995 = !DILocalVariable(name: "test_data", arg: 6, scope: !974, file: !29, line: 28, type: !978)
!996 = !DILocation(line: 28, column: 15, scope: !974)
!997 = !DILocalVariable(name: "expected", arg: 7, scope: !974, file: !29, line: 29, type: !982)
!998 = !DILocation(line: 29, column: 15, scope: !974)
!999 = !DILocalVariable(name: "c", scope: !974, file: !29, line: 31, type: !11)
!1000 = !DILocation(line: 31, column: 7, scope: !974)
!1001 = !DILocalVariable(name: "training_data_filename", scope: !974, file: !29, line: 32, type: !1002)
!1002 = !DIDerivedType(tag: DW_TAG_typedef, name: "string", scope: !2, file: !1003, line: 79, baseType: !1004)
!1003 = !DIFile(filename: "/usr/include/c++/11/bits/stringfwd.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!1004 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_string<char, std::char_traits<char>, std::allocator<char> >", scope: !1006, file: !1005, line: 1627, size: 256, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE")
!1005 = !DIFile(filename: "/usr/include/c++/11/bits/basic_string.tcc", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!1006 = !DINamespace(name: "__cxx11", scope: !2, exportSymbols: true)
!1007 = !DILocation(line: 32, column: 15, scope: !974)
!1008 = !DILocalVariable(name: "test_data_filename", scope: !974, file: !29, line: 32, type: !1002)
!1009 = !DILocation(line: 32, column: 39, scope: !974)
!1010 = !DILocalVariable(name: "expected_filename", scope: !974, file: !29, line: 32, type: !1002)
!1011 = !DILocation(line: 32, column: 59, scope: !974)
!1012 = !DILocation(line: 34, column: 3, scope: !974)
!1013 = !DILocation(line: 34, column: 22, scope: !974)
!1014 = !DILocation(line: 34, column: 28, scope: !974)
!1015 = !DILocation(line: 34, column: 15, scope: !974)
!1016 = !DILocation(line: 34, column: 13, scope: !974)
!1017 = !DILocation(line: 34, column: 45, scope: !974)
!1018 = !DILocation(line: 36, column: 13, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !974, file: !29, line: 35, column: 3)
!1020 = !DILocation(line: 36, column: 5, scope: !1019)
!1021 = !DILocation(line: 39, column: 34, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !1019, file: !29, line: 37, column: 5)
!1023 = !DILocation(line: 39, column: 32, scope: !1022)
!1024 = !DILocation(line: 40, column: 9, scope: !1022)
!1025 = !DILocation(line: 122, column: 1, scope: !1022)
!1026 = !DILocation(line: 42, column: 30, scope: !1022)
!1027 = !DILocation(line: 42, column: 28, scope: !1022)
!1028 = !DILocation(line: 43, column: 9, scope: !1022)
!1029 = !DILocation(line: 45, column: 29, scope: !1022)
!1030 = !DILocation(line: 45, column: 27, scope: !1022)
!1031 = !DILocation(line: 46, column: 9, scope: !1022)
!1032 = !DILocation(line: 48, column: 13, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1022, file: !29, line: 48, column: 13)
!1034 = !DILocation(line: 48, column: 20, scope: !1033)
!1035 = !DILocation(line: 48, column: 27, scope: !1033)
!1036 = !DILocation(line: 48, column: 30, scope: !1033)
!1037 = !DILocation(line: 48, column: 37, scope: !1033)
!1038 = !DILocation(line: 48, column: 44, scope: !1033)
!1039 = !DILocation(line: 48, column: 47, scope: !1033)
!1040 = !DILocation(line: 48, column: 54, scope: !1033)
!1041 = !DILocation(line: 48, column: 13, scope: !1022)
!1042 = !DILocation(line: 49, column: 20, scope: !1033)
!1043 = !DILocation(line: 49, column: 66, scope: !1033)
!1044 = !DILocation(line: 49, column: 11, scope: !1033)
!1045 = !DILocation(line: 50, column: 27, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1033, file: !29, line: 50, column: 18)
!1047 = !DILocation(line: 50, column: 18, scope: !1046)
!1048 = !DILocation(line: 50, column: 18, scope: !1033)
!1049 = !DILocation(line: 51, column: 20, scope: !1046)
!1050 = !DILocation(line: 51, column: 55, scope: !1046)
!1051 = !DILocation(line: 51, column: 11, scope: !1046)
!1052 = !DILocation(line: 53, column: 20, scope: !1046)
!1053 = !DILocation(line: 53, column: 67, scope: !1046)
!1054 = !DILocation(line: 53, column: 11, scope: !1046)
!1055 = !DILocation(line: 54, column: 21, scope: !1022)
!1056 = !DILocation(line: 54, column: 9, scope: !1022)
!1057 = !DILocation(line: 55, column: 9, scope: !1022)
!1058 = !DILocation(line: 57, column: 21, scope: !1022)
!1059 = !DILocation(line: 57, column: 9, scope: !1022)
!1060 = !DILocation(line: 58, column: 9, scope: !1022)
!1061 = distinct !{!1061, !1012, !1062}
!1062 = !DILocation(line: 60, column: 3, scope: !974)
!1063 = !DILocation(line: 62, column: 30, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !974, file: !29, line: 62, column: 7)
!1065 = !DILocation(line: 62, column: 38, scope: !1064)
!1066 = !DILocation(line: 62, column: 60, scope: !1064)
!1067 = !DILocation(line: 62, column: 68, scope: !1064)
!1068 = !DILocation(line: 62, column: 89, scope: !1064)
!1069 = !DILocation(line: 62, column: 7, scope: !974)
!1070 = !DILocation(line: 64, column: 17, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1064, file: !29, line: 63, column: 3)
!1072 = !DILocation(line: 64, column: 5, scope: !1071)
!1073 = !DILocation(line: 65, column: 5, scope: !1071)
!1074 = !DILocalVariable(name: "training_data_file", scope: !974, file: !29, line: 69, type: !1075)
!1075 = !DIDerivedType(tag: DW_TAG_typedef, name: "ifstream", scope: !2, file: !1076, line: 162, baseType: !1077)
!1076 = !DIFile(filename: "/usr/include/c++/11/iosfwd", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!1077 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ifstream<char, std::char_traits<char> >", scope: !2, file: !1078, line: 1087, size: 4160, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt14basic_ifstreamIcSt11char_traitsIcEE")
!1078 = !DIFile(filename: "/usr/include/c++/11/bits/fstream.tcc", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!1079 = !DILocation(line: 69, column: 17, scope: !974)
!1080 = !DILocation(line: 69, column: 59, scope: !974)
!1081 = !DILocalVariable(name: "test_data_file", scope: !974, file: !29, line: 70, type: !1075)
!1082 = !DILocation(line: 70, column: 17, scope: !974)
!1083 = !DILocation(line: 70, column: 51, scope: !974)
!1084 = !DILocalVariable(name: "expected_file", scope: !974, file: !29, line: 71, type: !1075)
!1085 = !DILocation(line: 71, column: 17, scope: !974)
!1086 = !DILocation(line: 71, column: 49, scope: !974)
!1087 = !DILocation(line: 73, column: 27, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !974, file: !29, line: 73, column: 7)
!1089 = !DILocation(line: 73, column: 37, scope: !1088)
!1090 = !DILocation(line: 73, column: 56, scope: !1088)
!1091 = !DILocation(line: 73, column: 66, scope: !1088)
!1092 = !DILocation(line: 73, column: 84, scope: !1088)
!1093 = !DILocation(line: 73, column: 7, scope: !974)
!1094 = !DILocation(line: 75, column: 5, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1088, file: !29, line: 74, column: 3)
!1096 = !DILocation(line: 76, column: 5, scope: !1095)
!1097 = !DILocation(line: 122, column: 1, scope: !974)
!1098 = !DILocation(line: 122, column: 1, scope: !1088)
!1099 = !DILocation(line: 80, column: 3, scope: !974)
!1100 = !DILocation(line: 80, column: 35, scope: !974)
!1101 = !DILocation(line: 80, column: 27, scope: !974)
!1102 = !DILocation(line: 80, column: 22, scope: !974)
!1103 = !DILocation(line: 81, column: 3, scope: !974)
!1104 = !DILocation(line: 81, column: 31, scope: !974)
!1105 = !DILocation(line: 81, column: 23, scope: !974)
!1106 = !DILocation(line: 81, column: 18, scope: !974)
!1107 = !DILocation(line: 83, column: 7, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !974, file: !29, line: 83, column: 7)
!1109 = !DILocation(line: 83, column: 20, scope: !1108)
!1110 = !DILocation(line: 83, column: 25, scope: !1108)
!1111 = !DILocation(line: 83, column: 28, scope: !1108)
!1112 = !DILocation(line: 83, column: 37, scope: !1108)
!1113 = !DILocation(line: 83, column: 7, scope: !974)
!1114 = !DILocation(line: 85, column: 5, scope: !1115)
!1115 = distinct !DILexicalBlock(scope: !1108, file: !29, line: 84, column: 3)
!1116 = !DILocation(line: 86, column: 5, scope: !1115)
!1117 = !DILocation(line: 90, column: 34, scope: !974)
!1118 = !DILocation(line: 90, column: 47, scope: !974)
!1119 = !DILocation(line: 90, column: 20, scope: !974)
!1120 = !DILocation(line: 90, column: 4, scope: !974)
!1121 = !DILocation(line: 90, column: 18, scope: !974)
!1122 = !DILocation(line: 91, column: 30, scope: !974)
!1123 = !DILocation(line: 91, column: 39, scope: !974)
!1124 = !DILocation(line: 91, column: 16, scope: !974)
!1125 = !DILocation(line: 91, column: 4, scope: !974)
!1126 = !DILocation(line: 91, column: 14, scope: !974)
!1127 = !DILocation(line: 92, column: 29, scope: !974)
!1128 = !DILocation(line: 92, column: 15, scope: !974)
!1129 = !DILocation(line: 92, column: 4, scope: !974)
!1130 = !DILocation(line: 92, column: 13, scope: !974)
!1131 = !DILocalVariable(name: "i", scope: !1132, file: !29, line: 95, type: !11)
!1132 = distinct !DILexicalBlock(scope: !974, file: !29, line: 95, column: 3)
!1133 = !DILocation(line: 95, column: 12, scope: !1132)
!1134 = !DILocation(line: 95, column: 8, scope: !1132)
!1135 = !DILocation(line: 95, column: 19, scope: !1136)
!1136 = distinct !DILexicalBlock(scope: !1132, file: !29, line: 95, column: 3)
!1137 = !DILocation(line: 95, column: 23, scope: !1136)
!1138 = !DILocation(line: 95, column: 21, scope: !1136)
!1139 = !DILocation(line: 95, column: 3, scope: !1132)
!1140 = !DILocalVariable(name: "j", scope: !1141, file: !29, line: 97, type: !11)
!1141 = distinct !DILexicalBlock(scope: !1142, file: !29, line: 97, column: 5)
!1142 = distinct !DILexicalBlock(scope: !1136, file: !29, line: 96, column: 3)
!1143 = !DILocation(line: 97, column: 14, scope: !1141)
!1144 = !DILocation(line: 97, column: 10, scope: !1141)
!1145 = !DILocation(line: 97, column: 21, scope: !1146)
!1146 = distinct !DILexicalBlock(scope: !1141, file: !29, line: 97, column: 5)
!1147 = !DILocation(line: 97, column: 23, scope: !1146)
!1148 = !DILocation(line: 97, column: 5, scope: !1141)
!1149 = !DILocation(line: 99, column: 7, scope: !1150)
!1150 = distinct !DILexicalBlock(scope: !1146, file: !29, line: 98, column: 5)
!1151 = !DILocation(line: 99, column: 41, scope: !1150)
!1152 = !DILocation(line: 99, column: 40, scope: !1150)
!1153 = !DILocation(line: 99, column: 56, scope: !1150)
!1154 = !DILocation(line: 99, column: 58, scope: !1150)
!1155 = !DILocation(line: 99, column: 74, scope: !1150)
!1156 = !DILocation(line: 99, column: 72, scope: !1150)
!1157 = !DILocation(line: 99, column: 39, scope: !1150)
!1158 = !DILocation(line: 99, column: 31, scope: !1150)
!1159 = !DILocation(line: 99, column: 26, scope: !1150)
!1160 = !DILocation(line: 100, column: 5, scope: !1150)
!1161 = !DILocation(line: 97, column: 39, scope: !1146)
!1162 = !DILocation(line: 97, column: 5, scope: !1146)
!1163 = distinct !{!1163, !1148, !1164}
!1164 = !DILocation(line: 100, column: 5, scope: !1141)
!1165 = !DILocation(line: 101, column: 3, scope: !1142)
!1166 = !DILocation(line: 95, column: 38, scope: !1136)
!1167 = !DILocation(line: 95, column: 3, scope: !1136)
!1168 = distinct !{!1168, !1139, !1169}
!1169 = !DILocation(line: 101, column: 3, scope: !1132)
!1170 = !DILocalVariable(name: "i", scope: !1171, file: !29, line: 104, type: !11)
!1171 = distinct !DILexicalBlock(scope: !974, file: !29, line: 104, column: 3)
!1172 = !DILocation(line: 104, column: 12, scope: !1171)
!1173 = !DILocation(line: 104, column: 8, scope: !1171)
!1174 = !DILocation(line: 104, column: 19, scope: !1175)
!1175 = distinct !DILexicalBlock(scope: !1171, file: !29, line: 104, column: 3)
!1176 = !DILocation(line: 104, column: 23, scope: !1175)
!1177 = !DILocation(line: 104, column: 21, scope: !1175)
!1178 = !DILocation(line: 104, column: 3, scope: !1171)
!1179 = !DILocalVariable(name: "j", scope: !1180, file: !29, line: 106, type: !11)
!1180 = distinct !DILexicalBlock(scope: !1181, file: !29, line: 106, column: 5)
!1181 = distinct !DILexicalBlock(scope: !1175, file: !29, line: 105, column: 3)
!1182 = !DILocation(line: 106, column: 14, scope: !1180)
!1183 = !DILocation(line: 106, column: 10, scope: !1180)
!1184 = !DILocation(line: 106, column: 21, scope: !1185)
!1185 = distinct !DILexicalBlock(scope: !1180, file: !29, line: 106, column: 5)
!1186 = !DILocation(line: 106, column: 23, scope: !1185)
!1187 = !DILocation(line: 106, column: 5, scope: !1180)
!1188 = !DILocation(line: 108, column: 7, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1185, file: !29, line: 107, column: 5)
!1190 = !DILocation(line: 108, column: 37, scope: !1189)
!1191 = !DILocation(line: 108, column: 36, scope: !1189)
!1192 = !DILocation(line: 108, column: 48, scope: !1189)
!1193 = !DILocation(line: 108, column: 50, scope: !1189)
!1194 = !DILocation(line: 108, column: 66, scope: !1189)
!1195 = !DILocation(line: 108, column: 64, scope: !1189)
!1196 = !DILocation(line: 108, column: 35, scope: !1189)
!1197 = !DILocation(line: 108, column: 27, scope: !1189)
!1198 = !DILocation(line: 108, column: 22, scope: !1189)
!1199 = !DILocation(line: 109, column: 5, scope: !1189)
!1200 = !DILocation(line: 106, column: 39, scope: !1185)
!1201 = !DILocation(line: 106, column: 5, scope: !1185)
!1202 = distinct !{!1202, !1187, !1203}
!1203 = !DILocation(line: 109, column: 5, scope: !1180)
!1204 = !DILocation(line: 110, column: 3, scope: !1181)
!1205 = !DILocation(line: 104, column: 34, scope: !1175)
!1206 = !DILocation(line: 104, column: 3, scope: !1175)
!1207 = distinct !{!1207, !1178, !1208}
!1208 = !DILocation(line: 110, column: 3, scope: !1171)
!1209 = !DILocalVariable(name: "i", scope: !1210, file: !29, line: 113, type: !11)
!1210 = distinct !DILexicalBlock(scope: !974, file: !29, line: 113, column: 3)
!1211 = !DILocation(line: 113, column: 12, scope: !1210)
!1212 = !DILocation(line: 113, column: 8, scope: !1210)
!1213 = !DILocation(line: 113, column: 19, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1210, file: !29, line: 113, column: 3)
!1215 = !DILocation(line: 113, column: 23, scope: !1214)
!1216 = !DILocation(line: 113, column: 21, scope: !1214)
!1217 = !DILocation(line: 113, column: 3, scope: !1210)
!1218 = !DILocation(line: 115, column: 5, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1214, file: !29, line: 114, column: 3)
!1220 = !DILocation(line: 115, column: 34, scope: !1219)
!1221 = !DILocation(line: 115, column: 33, scope: !1219)
!1222 = !DILocation(line: 115, column: 44, scope: !1219)
!1223 = !DILocation(line: 115, column: 32, scope: !1219)
!1224 = !DILocation(line: 115, column: 19, scope: !1219)
!1225 = !DILocation(line: 116, column: 3, scope: !1219)
!1226 = !DILocation(line: 113, column: 34, scope: !1214)
!1227 = !DILocation(line: 113, column: 3, scope: !1214)
!1228 = distinct !{!1228, !1217, !1229}
!1229 = !DILocation(line: 116, column: 3, scope: !1210)
!1230 = !DILocation(line: 119, column: 22, scope: !974)
!1231 = !DILocation(line: 120, column: 18, scope: !974)
!1232 = !DILocation(line: 121, column: 17, scope: !974)
!1233 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_utils.cpp", scope: !29, file: !29, type: !1234, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !28, variables: !30)
!1234 = !DISubroutineType(types: !30)
!1235 = !DILocation(line: 0, scope: !1233)
