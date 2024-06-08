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
@.str = private unnamed_addr constant [81 x i8] c"usage: %s -t training_samples -l training_labels -s test_samples -e test_labels\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"t:s:e:l:\00", align 1
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
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str, i32 0, i32 0), i8* %0), !dbg !972
  ret void, !dbg !973
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #5

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline optnone uwtable
define void @_Z23parse_command_line_argsiPPcRiS1_PPyS3_PPhS5_(i32 %argc, i8** %argv, i32* dereferenceable(4) %num_training, i32* dereferenceable(4) %num_test, i64** %training_data, i64** %test_data, i8** %training_labels, i8** %expected) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !974 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %num_training.addr = alloca i32*, align 8
  %num_test.addr = alloca i32*, align 8
  %training_data.addr = alloca i64**, align 8
  %test_data.addr = alloca i64**, align 8
  %training_labels.addr = alloca i8**, align 8
  %expected.addr = alloca i8**, align 8
  %c = alloca i32, align 4
  %training_data_filename = alloca %"class.std::__cxx11::basic_string", align 8
  %test_data_filename = alloca %"class.std::__cxx11::basic_string", align 8
  %training_labels_filename = alloca %"class.std::__cxx11::basic_string", align 8
  %expected_filename = alloca %"class.std::__cxx11::basic_string", align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %training_data_file = alloca %"class.std::basic_ifstream", align 8
  %test_data_file = alloca %"class.std::basic_ifstream", align 8
  %expected_file = alloca %"class.std::basic_ifstream", align 8
  %training_labels_file = alloca %"class.std::basic_ifstream", align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %i99 = alloca i32, align 4
  %j103 = alloca i32, align 4
  %i119 = alloca i32, align 4
  %i130 = alloca i32, align 4
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
  store i8** %training_labels, i8*** %training_labels.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %training_labels.addr, metadata !997, metadata !DIExpression()), !dbg !998
  store i8** %expected, i8*** %expected.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %expected.addr, metadata !999, metadata !DIExpression()), !dbg !1000
  call void @llvm.dbg.declare(metadata i32* %c, metadata !1001, metadata !DIExpression()), !dbg !1002
  store i32 0, i32* %c, align 4, !dbg !1002
  call void @llvm.dbg.declare(metadata %"class.std::__cxx11::basic_string"* %training_data_filename, metadata !1003, metadata !DIExpression()), !dbg !1009
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev(%"class.std::__cxx11::basic_string"* %training_data_filename) #3, !dbg !1009
  call void @llvm.dbg.declare(metadata %"class.std::__cxx11::basic_string"* %test_data_filename, metadata !1010, metadata !DIExpression()), !dbg !1011
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev(%"class.std::__cxx11::basic_string"* %test_data_filename) #3, !dbg !1011
  call void @llvm.dbg.declare(metadata %"class.std::__cxx11::basic_string"* %training_labels_filename, metadata !1012, metadata !DIExpression()), !dbg !1013
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev(%"class.std::__cxx11::basic_string"* %training_labels_filename) #3, !dbg !1013
  call void @llvm.dbg.declare(metadata %"class.std::__cxx11::basic_string"* %expected_filename, metadata !1014, metadata !DIExpression()), !dbg !1015
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1Ev(%"class.std::__cxx11::basic_string"* %expected_filename) #3, !dbg !1015
  br label %while.cond, !dbg !1016

while.cond:                                       ; preds = %sw.epilog, %entry
  %0 = load i32, i32* %argc.addr, align 4, !dbg !1017
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !1018
  %call = call i32 @getopt(i32 %0, i8** %1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0)) #3, !dbg !1019
  store i32 %call, i32* %c, align 4, !dbg !1020
  %cmp = icmp ne i32 %call, -1, !dbg !1021
  br i1 %cmp, label %while.body, label %while.end, !dbg !1016

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %c, align 4, !dbg !1022
  switch i32 %2, label %sw.default [
    i32 116, label %sw.bb
    i32 115, label %sw.bb2
    i32 101, label %sw.bb5
    i32 108, label %sw.bb8
    i32 63, label %sw.bb11
  ], !dbg !1024

sw.bb:                                            ; preds = %while.body
  %3 = load i8*, i8** @optarg, align 8, !dbg !1025
  %call1 = invoke dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEPKc(%"class.std::__cxx11::basic_string"* %training_data_filename, i8* %3)
          to label %invoke.cont unwind label %lpad, !dbg !1027

invoke.cont:                                      ; preds = %sw.bb
  br label %sw.epilog, !dbg !1028

lpad:                                             ; preds = %if.end37, %if.then34, %sw.default, %if.end25, %if.else22, %if.then19, %if.then, %sw.bb8, %sw.bb5, %sw.bb2, %sw.bb
  %4 = landingpad { i8*, i32 }
          cleanup, !dbg !1029
  %5 = extractvalue { i8*, i32 } %4, 0, !dbg !1029
  store i8* %5, i8** %exn.slot, align 8, !dbg !1029
  %6 = extractvalue { i8*, i32 } %4, 1, !dbg !1029
  store i32 %6, i32* %ehselector.slot, align 4, !dbg !1029
  br label %ehcleanup146, !dbg !1029

sw.bb2:                                           ; preds = %while.body
  %7 = load i8*, i8** @optarg, align 8, !dbg !1030
  %call4 = invoke dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEPKc(%"class.std::__cxx11::basic_string"* %test_data_filename, i8* %7)
          to label %invoke.cont3 unwind label %lpad, !dbg !1031

invoke.cont3:                                     ; preds = %sw.bb2
  br label %sw.epilog, !dbg !1032

sw.bb5:                                           ; preds = %while.body
  %8 = load i8*, i8** @optarg, align 8, !dbg !1033
  %call7 = invoke dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEPKc(%"class.std::__cxx11::basic_string"* %expected_filename, i8* %8)
          to label %invoke.cont6 unwind label %lpad, !dbg !1034

invoke.cont6:                                     ; preds = %sw.bb5
  br label %sw.epilog, !dbg !1035

sw.bb8:                                           ; preds = %while.body
  %9 = load i8*, i8** @optarg, align 8, !dbg !1036
  %call10 = invoke dereferenceable(32) %"class.std::__cxx11::basic_string"* @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEaSEPKc(%"class.std::__cxx11::basic_string"* %training_labels_filename, i8* %9)
          to label %invoke.cont9 unwind label %lpad, !dbg !1037

invoke.cont9:                                     ; preds = %sw.bb8
  br label %sw.epilog, !dbg !1038

sw.bb11:                                          ; preds = %while.body
  %10 = load i32, i32* @optopt, align 4, !dbg !1039
  %cmp12 = icmp eq i32 %10, 116, !dbg !1041
  br i1 %cmp12, label %if.then, label %lor.lhs.false, !dbg !1042

lor.lhs.false:                                    ; preds = %sw.bb11
  %11 = load i32, i32* @optopt, align 4, !dbg !1043
  %cmp13 = icmp eq i32 %11, 101, !dbg !1044
  br i1 %cmp13, label %if.then, label %lor.lhs.false14, !dbg !1045

lor.lhs.false14:                                  ; preds = %lor.lhs.false
  %12 = load i32, i32* @optopt, align 4, !dbg !1046
  %cmp15 = icmp eq i32 %12, 115, !dbg !1047
  br i1 %cmp15, label %if.then, label %if.else, !dbg !1048

if.then:                                          ; preds = %lor.lhs.false14, %lor.lhs.false, %sw.bb11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1049
  %14 = load i32, i32* @optopt, align 4, !dbg !1050
  %call17 = invoke i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i32 0, i32 0), i32 %14)
          to label %invoke.cont16 unwind label %lpad, !dbg !1051

invoke.cont16:                                    ; preds = %if.then
  br label %if.end25, !dbg !1051

if.else:                                          ; preds = %lor.lhs.false14
  %15 = load i32, i32* @optopt, align 4, !dbg !1052
  %call18 = call i32 @isprint(i32 %15) #9, !dbg !1054
  %tobool = icmp ne i32 %call18, 0, !dbg !1054
  br i1 %tobool, label %if.then19, label %if.else22, !dbg !1055

if.then19:                                        ; preds = %if.else
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1056
  %17 = load i32, i32* @optopt, align 4, !dbg !1057
  %call21 = invoke i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0), i32 %17)
          to label %invoke.cont20 unwind label %lpad, !dbg !1058

invoke.cont20:                                    ; preds = %if.then19
  br label %if.end, !dbg !1058

if.else22:                                        ; preds = %if.else
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1059
  %19 = load i32, i32* @optopt, align 4, !dbg !1060
  %call24 = invoke i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.4, i32 0, i32 0), i32 %19)
          to label %invoke.cont23 unwind label %lpad, !dbg !1061

invoke.cont23:                                    ; preds = %if.else22
  br label %if.end

if.end:                                           ; preds = %invoke.cont23, %invoke.cont20
  br label %if.end25

if.end25:                                         ; preds = %if.end, %invoke.cont16
  %20 = load i8**, i8*** %argv.addr, align 8, !dbg !1062
  %arrayidx = getelementptr inbounds i8*, i8** %20, i64 0, !dbg !1062
  %21 = load i8*, i8** %arrayidx, align 8, !dbg !1062
  invoke void @_Z11print_usagePc(i8* %21)
          to label %invoke.cont26 unwind label %lpad, !dbg !1063

invoke.cont26:                                    ; preds = %if.end25
  call void @exit(i32 -1) #10, !dbg !1064
  unreachable, !dbg !1064

sw.default:                                       ; preds = %while.body
  %22 = load i8**, i8*** %argv.addr, align 8, !dbg !1065
  %arrayidx27 = getelementptr inbounds i8*, i8** %22, i64 0, !dbg !1065
  %23 = load i8*, i8** %arrayidx27, align 8, !dbg !1065
  invoke void @_Z11print_usagePc(i8* %23)
          to label %invoke.cont28 unwind label %lpad, !dbg !1066

invoke.cont28:                                    ; preds = %sw.default
  call void @exit(i32 -1) #10, !dbg !1067
  unreachable, !dbg !1067

sw.epilog:                                        ; preds = %invoke.cont9, %invoke.cont6, %invoke.cont3, %invoke.cont
  br label %while.cond, !dbg !1016, !llvm.loop !1068

while.end:                                        ; preds = %while.cond
  %call29 = call zeroext i1 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5emptyEv(%"class.std::__cxx11::basic_string"* %training_data_filename) #3, !dbg !1070
  br i1 %call29, label %if.then34, label %lor.lhs.false30, !dbg !1072

lor.lhs.false30:                                  ; preds = %while.end
  %call31 = call zeroext i1 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5emptyEv(%"class.std::__cxx11::basic_string"* %test_data_filename) #3, !dbg !1073
  br i1 %call31, label %if.then34, label %lor.lhs.false32, !dbg !1074

lor.lhs.false32:                                  ; preds = %lor.lhs.false30
  %call33 = call zeroext i1 @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5emptyEv(%"class.std::__cxx11::basic_string"* %expected_filename) #3, !dbg !1075
  br i1 %call33, label %if.then34, label %if.end37, !dbg !1076

if.then34:                                        ; preds = %lor.lhs.false32, %lor.lhs.false30, %while.end
  %24 = load i8**, i8*** %argv.addr, align 8, !dbg !1077
  %arrayidx35 = getelementptr inbounds i8*, i8** %24, i64 0, !dbg !1077
  %25 = load i8*, i8** %arrayidx35, align 8, !dbg !1077
  invoke void @_Z11print_usagePc(i8* %25)
          to label %invoke.cont36 unwind label %lpad, !dbg !1079

invoke.cont36:                                    ; preds = %if.then34
  call void @exit(i32 -1) #10, !dbg !1080
  unreachable, !dbg !1080

if.end37:                                         ; preds = %lor.lhs.false32
  call void @llvm.dbg.declare(metadata %"class.std::basic_ifstream"* %training_data_file, metadata !1081, metadata !DIExpression()), !dbg !1086
  %call38 = call i8* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%"class.std::__cxx11::basic_string"* %training_data_filename) #3, !dbg !1087
  invoke void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode(%"class.std::basic_ifstream"* %training_data_file, i8* %call38, i32 8)
          to label %invoke.cont39 unwind label %lpad, !dbg !1086

invoke.cont39:                                    ; preds = %if.end37
  call void @llvm.dbg.declare(metadata %"class.std::basic_ifstream"* %test_data_file, metadata !1088, metadata !DIExpression()), !dbg !1089
  %call40 = call i8* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%"class.std::__cxx11::basic_string"* %test_data_filename) #3, !dbg !1090
  invoke void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode(%"class.std::basic_ifstream"* %test_data_file, i8* %call40, i32 8)
          to label %invoke.cont42 unwind label %lpad41, !dbg !1089

invoke.cont42:                                    ; preds = %invoke.cont39
  call void @llvm.dbg.declare(metadata %"class.std::basic_ifstream"* %expected_file, metadata !1091, metadata !DIExpression()), !dbg !1092
  %call43 = call i8* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%"class.std::__cxx11::basic_string"* %expected_filename) #3, !dbg !1093
  invoke void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode(%"class.std::basic_ifstream"* %expected_file, i8* %call43, i32 8)
          to label %invoke.cont45 unwind label %lpad44, !dbg !1092

invoke.cont45:                                    ; preds = %invoke.cont42
  call void @llvm.dbg.declare(metadata %"class.std::basic_ifstream"* %training_labels_file, metadata !1094, metadata !DIExpression()), !dbg !1095
  %call46 = call i8* @_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE5c_strEv(%"class.std::__cxx11::basic_string"* %training_labels_filename) #3, !dbg !1096
  invoke void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode(%"class.std::basic_ifstream"* %training_labels_file, i8* %call46, i32 8)
          to label %invoke.cont48 unwind label %lpad47, !dbg !1095

invoke.cont48:                                    ; preds = %invoke.cont45
  %call51 = invoke zeroext i1 @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ifstream"* %training_data_file)
          to label %invoke.cont50 unwind label %lpad49, !dbg !1097

invoke.cont50:                                    ; preds = %invoke.cont48
  br i1 %call51, label %lor.lhs.false52, label %if.then61, !dbg !1099

lor.lhs.false52:                                  ; preds = %invoke.cont50
  %call54 = invoke zeroext i1 @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ifstream"* %test_data_file)
          to label %invoke.cont53 unwind label %lpad49, !dbg !1100

invoke.cont53:                                    ; preds = %lor.lhs.false52
  br i1 %call54, label %lor.lhs.false55, label %if.then61, !dbg !1101

lor.lhs.false55:                                  ; preds = %invoke.cont53
  %call57 = invoke zeroext i1 @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ifstream"* %expected_file)
          to label %invoke.cont56 unwind label %lpad49, !dbg !1102

invoke.cont56:                                    ; preds = %lor.lhs.false55
  br i1 %call57, label %lor.lhs.false58, label %if.then61, !dbg !1103

lor.lhs.false58:                                  ; preds = %invoke.cont56
  %call60 = invoke zeroext i1 @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ifstream"* %training_labels_file)
          to label %invoke.cont59 unwind label %lpad49, !dbg !1104

invoke.cont59:                                    ; preds = %lor.lhs.false58
  br i1 %call60, label %if.end64, label %if.then61, !dbg !1105

if.then61:                                        ; preds = %invoke.cont59, %invoke.cont56, %invoke.cont53, %invoke.cont50
  %call63 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i32 0, i32 0))
          to label %invoke.cont62 unwind label %lpad49, !dbg !1106

invoke.cont62:                                    ; preds = %if.then61
  call void @exit(i32 -1) #10, !dbg !1108
  unreachable, !dbg !1108

lpad41:                                           ; preds = %invoke.cont39
  %26 = landingpad { i8*, i32 }
          cleanup, !dbg !1109
  %27 = extractvalue { i8*, i32 } %26, 0, !dbg !1109
  store i8* %27, i8** %exn.slot, align 8, !dbg !1109
  %28 = extractvalue { i8*, i32 } %26, 1, !dbg !1109
  store i32 %28, i32* %ehselector.slot, align 4, !dbg !1109
  br label %ehcleanup145, !dbg !1109

lpad44:                                           ; preds = %invoke.cont42
  %29 = landingpad { i8*, i32 }
          cleanup, !dbg !1109
  %30 = extractvalue { i8*, i32 } %29, 0, !dbg !1109
  store i8* %30, i8** %exn.slot, align 8, !dbg !1109
  %31 = extractvalue { i8*, i32 } %29, 1, !dbg !1109
  store i32 %31, i32* %ehselector.slot, align 4, !dbg !1109
  br label %ehcleanup144, !dbg !1109

lpad47:                                           ; preds = %invoke.cont45
  %32 = landingpad { i8*, i32 }
          cleanup, !dbg !1109
  %33 = extractvalue { i8*, i32 } %32, 0, !dbg !1109
  store i8* %33, i8** %exn.slot, align 8, !dbg !1109
  %34 = extractvalue { i8*, i32 } %32, 1, !dbg !1109
  store i32 %34, i32* %ehselector.slot, align 4, !dbg !1109
  br label %ehcleanup, !dbg !1109

lpad49:                                           ; preds = %invoke.cont142, %invoke.cont141, %for.end140, %for.body133, %for.body122, %for.body106, %for.body91, %invoke.cont83, %invoke.cont80, %invoke.cont76, %if.end75, %if.then72, %invoke.cont65, %if.end64, %if.then61, %lor.lhs.false58, %lor.lhs.false55, %lor.lhs.false52, %invoke.cont48
  %35 = landingpad { i8*, i32 }
          cleanup, !dbg !1110
  %36 = extractvalue { i8*, i32 } %35, 0, !dbg !1110
  store i8* %36, i8** %exn.slot, align 8, !dbg !1110
  %37 = extractvalue { i8*, i32 } %35, 1, !dbg !1110
  store i32 %37, i32* %ehselector.slot, align 4, !dbg !1110
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %training_labels_file) #3, !dbg !1109
  br label %ehcleanup, !dbg !1109

if.end64:                                         ; preds = %invoke.cont59
  %38 = bitcast %"class.std::basic_ifstream"* %training_data_file to %"class.std::basic_istream"*, !dbg !1111
  %39 = load i32*, i32** %num_training.addr, align 8, !dbg !1112
  %40 = bitcast i32* %39 to i8*, !dbg !1113
  %call66 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSi4readEPcl(%"class.std::basic_istream"* %38, i8* %40, i64 4)
          to label %invoke.cont65 unwind label %lpad49, !dbg !1114

invoke.cont65:                                    ; preds = %if.end64
  %41 = bitcast %"class.std::basic_ifstream"* %test_data_file to %"class.std::basic_istream"*, !dbg !1115
  %42 = load i32*, i32** %num_test.addr, align 8, !dbg !1116
  %43 = bitcast i32* %42 to i8*, !dbg !1117
  %call68 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSi4readEPcl(%"class.std::basic_istream"* %41, i8* %43, i64 4)
          to label %invoke.cont67 unwind label %lpad49, !dbg !1118

invoke.cont67:                                    ; preds = %invoke.cont65
  %44 = load i32*, i32** %num_training.addr, align 8, !dbg !1119
  %45 = load i32, i32* %44, align 4, !dbg !1119
  %cmp69 = icmp sle i32 %45, 0, !dbg !1121
  br i1 %cmp69, label %if.then72, label %lor.lhs.false70, !dbg !1122

lor.lhs.false70:                                  ; preds = %invoke.cont67
  %46 = load i32*, i32** %num_test.addr, align 8, !dbg !1123
  %47 = load i32, i32* %46, align 4, !dbg !1123
  %cmp71 = icmp sle i32 %47, 0, !dbg !1124
  br i1 %cmp71, label %if.then72, label %if.end75, !dbg !1125

if.then72:                                        ; preds = %lor.lhs.false70, %invoke.cont67
  %call74 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str.6, i32 0, i32 0))
          to label %invoke.cont73 unwind label %lpad49, !dbg !1126

invoke.cont73:                                    ; preds = %if.then72
  call void @exit(i32 -1) #10, !dbg !1128
  unreachable, !dbg !1128

if.end75:                                         ; preds = %lor.lhs.false70
  %48 = load i32*, i32** %num_training.addr, align 8, !dbg !1129
  %49 = load i32, i32* %48, align 4, !dbg !1129
  %mul = mul nsw i32 %49, 4, !dbg !1130
  %conv = sext i32 %mul to i64, !dbg !1129
  %50 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %conv, i64 8), !dbg !1131
  %51 = extractvalue { i64, i1 } %50, 1, !dbg !1131
  %52 = extractvalue { i64, i1 } %50, 0, !dbg !1131
  %53 = select i1 %51, i64 -1, i64 %52, !dbg !1131
  %call77 = invoke i8* @_Znam(i64 %53) #11
          to label %invoke.cont76 unwind label %lpad49, !dbg !1131

invoke.cont76:                                    ; preds = %if.end75
  %54 = bitcast i8* %call77 to i64*, !dbg !1131
  %55 = load i64**, i64*** %training_data.addr, align 8, !dbg !1132
  store i64* %54, i64** %55, align 8, !dbg !1133
  %56 = load i32*, i32** %num_test.addr, align 8, !dbg !1134
  %57 = load i32, i32* %56, align 4, !dbg !1134
  %mul78 = mul nsw i32 %57, 4, !dbg !1135
  %conv79 = sext i32 %mul78 to i64, !dbg !1134
  %58 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %conv79, i64 8), !dbg !1136
  %59 = extractvalue { i64, i1 } %58, 1, !dbg !1136
  %60 = extractvalue { i64, i1 } %58, 0, !dbg !1136
  %61 = select i1 %59, i64 -1, i64 %60, !dbg !1136
  %call81 = invoke i8* @_Znam(i64 %61) #11
          to label %invoke.cont80 unwind label %lpad49, !dbg !1136

invoke.cont80:                                    ; preds = %invoke.cont76
  %62 = bitcast i8* %call81 to i64*, !dbg !1136
  %63 = load i64**, i64*** %test_data.addr, align 8, !dbg !1137
  store i64* %62, i64** %63, align 8, !dbg !1138
  %64 = load i32*, i32** %num_training.addr, align 8, !dbg !1139
  %65 = load i32, i32* %64, align 4, !dbg !1139
  %conv82 = sext i32 %65 to i64, !dbg !1139
  %call84 = invoke i8* @_Znam(i64 %conv82) #11
          to label %invoke.cont83 unwind label %lpad49, !dbg !1140

invoke.cont83:                                    ; preds = %invoke.cont80
  %66 = load i8**, i8*** %training_labels.addr, align 8, !dbg !1141
  store i8* %call84, i8** %66, align 8, !dbg !1142
  %67 = load i32*, i32** %num_test.addr, align 8, !dbg !1143
  %68 = load i32, i32* %67, align 4, !dbg !1143
  %conv85 = sext i32 %68 to i64, !dbg !1143
  %call87 = invoke i8* @_Znam(i64 %conv85) #11
          to label %invoke.cont86 unwind label %lpad49, !dbg !1144

invoke.cont86:                                    ; preds = %invoke.cont83
  %69 = load i8**, i8*** %expected.addr, align 8, !dbg !1145
  store i8* %call87, i8** %69, align 8, !dbg !1146
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1147, metadata !DIExpression()), !dbg !1149
  store i32 0, i32* %i, align 4, !dbg !1149
  br label %for.cond, !dbg !1150

for.cond:                                         ; preds = %for.inc96, %invoke.cont86
  %70 = load i32, i32* %i, align 4, !dbg !1151
  %71 = load i32*, i32** %num_training.addr, align 8, !dbg !1153
  %72 = load i32, i32* %71, align 4, !dbg !1153
  %cmp88 = icmp slt i32 %70, %72, !dbg !1154
  br i1 %cmp88, label %for.body, label %for.end98, !dbg !1155

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !1156, metadata !DIExpression()), !dbg !1159
  store i32 0, i32* %j, align 4, !dbg !1159
  br label %for.cond89, !dbg !1160

for.cond89:                                       ; preds = %for.inc, %for.body
  %73 = load i32, i32* %j, align 4, !dbg !1161
  %cmp90 = icmp slt i32 %73, 4, !dbg !1163
  br i1 %cmp90, label %for.body91, label %for.end, !dbg !1164

for.body91:                                       ; preds = %for.cond89
  %74 = bitcast %"class.std::basic_ifstream"* %training_data_file to %"class.std::basic_istream"*, !dbg !1165
  %75 = load i64**, i64*** %training_data.addr, align 8, !dbg !1167
  %76 = load i64*, i64** %75, align 8, !dbg !1168
  %77 = load i32, i32* %i, align 4, !dbg !1169
  %mul92 = mul nsw i32 %77, 4, !dbg !1170
  %78 = load i32, i32* %j, align 4, !dbg !1171
  %add = add nsw i32 %mul92, %78, !dbg !1172
  %idxprom = sext i32 %add to i64, !dbg !1173
  %arrayidx93 = getelementptr inbounds i64, i64* %76, i64 %idxprom, !dbg !1173
  %79 = bitcast i64* %arrayidx93 to i8*, !dbg !1174
  %call95 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSi4readEPcl(%"class.std::basic_istream"* %74, i8* %79, i64 8)
          to label %invoke.cont94 unwind label %lpad49, !dbg !1175

invoke.cont94:                                    ; preds = %for.body91
  br label %for.inc, !dbg !1176

for.inc:                                          ; preds = %invoke.cont94
  %80 = load i32, i32* %j, align 4, !dbg !1177
  %inc = add nsw i32 %80, 1, !dbg !1177
  store i32 %inc, i32* %j, align 4, !dbg !1177
  br label %for.cond89, !dbg !1178, !llvm.loop !1179

for.end:                                          ; preds = %for.cond89
  br label %for.inc96, !dbg !1181

for.inc96:                                        ; preds = %for.end
  %81 = load i32, i32* %i, align 4, !dbg !1182
  %inc97 = add nsw i32 %81, 1, !dbg !1182
  store i32 %inc97, i32* %i, align 4, !dbg !1182
  br label %for.cond, !dbg !1183, !llvm.loop !1184

for.end98:                                        ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %i99, metadata !1186, metadata !DIExpression()), !dbg !1188
  store i32 0, i32* %i99, align 4, !dbg !1188
  br label %for.cond100, !dbg !1189

for.cond100:                                      ; preds = %for.inc116, %for.end98
  %82 = load i32, i32* %i99, align 4, !dbg !1190
  %83 = load i32*, i32** %num_test.addr, align 8, !dbg !1192
  %84 = load i32, i32* %83, align 4, !dbg !1192
  %cmp101 = icmp slt i32 %82, %84, !dbg !1193
  br i1 %cmp101, label %for.body102, label %for.end118, !dbg !1194

for.body102:                                      ; preds = %for.cond100
  call void @llvm.dbg.declare(metadata i32* %j103, metadata !1195, metadata !DIExpression()), !dbg !1198
  store i32 0, i32* %j103, align 4, !dbg !1198
  br label %for.cond104, !dbg !1199

for.cond104:                                      ; preds = %for.inc113, %for.body102
  %85 = load i32, i32* %j103, align 4, !dbg !1200
  %cmp105 = icmp slt i32 %85, 4, !dbg !1202
  br i1 %cmp105, label %for.body106, label %for.end115, !dbg !1203

for.body106:                                      ; preds = %for.cond104
  %86 = bitcast %"class.std::basic_ifstream"* %test_data_file to %"class.std::basic_istream"*, !dbg !1204
  %87 = load i64**, i64*** %test_data.addr, align 8, !dbg !1206
  %88 = load i64*, i64** %87, align 8, !dbg !1207
  %89 = load i32, i32* %i99, align 4, !dbg !1208
  %mul107 = mul nsw i32 %89, 4, !dbg !1209
  %90 = load i32, i32* %j103, align 4, !dbg !1210
  %add108 = add nsw i32 %mul107, %90, !dbg !1211
  %idxprom109 = sext i32 %add108 to i64, !dbg !1212
  %arrayidx110 = getelementptr inbounds i64, i64* %88, i64 %idxprom109, !dbg !1212
  %91 = bitcast i64* %arrayidx110 to i8*, !dbg !1213
  %call112 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSi4readEPcl(%"class.std::basic_istream"* %86, i8* %91, i64 8)
          to label %invoke.cont111 unwind label %lpad49, !dbg !1214

invoke.cont111:                                   ; preds = %for.body106
  br label %for.inc113, !dbg !1215

for.inc113:                                       ; preds = %invoke.cont111
  %92 = load i32, i32* %j103, align 4, !dbg !1216
  %inc114 = add nsw i32 %92, 1, !dbg !1216
  store i32 %inc114, i32* %j103, align 4, !dbg !1216
  br label %for.cond104, !dbg !1217, !llvm.loop !1218

for.end115:                                       ; preds = %for.cond104
  br label %for.inc116, !dbg !1220

for.inc116:                                       ; preds = %for.end115
  %93 = load i32, i32* %i99, align 4, !dbg !1221
  %inc117 = add nsw i32 %93, 1, !dbg !1221
  store i32 %inc117, i32* %i99, align 4, !dbg !1221
  br label %for.cond100, !dbg !1222, !llvm.loop !1223

for.end118:                                       ; preds = %for.cond100
  call void @llvm.dbg.declare(metadata i32* %i119, metadata !1225, metadata !DIExpression()), !dbg !1227
  store i32 0, i32* %i119, align 4, !dbg !1227
  br label %for.cond120, !dbg !1228

for.cond120:                                      ; preds = %for.inc127, %for.end118
  %94 = load i32, i32* %i119, align 4, !dbg !1229
  %95 = load i32*, i32** %num_training.addr, align 8, !dbg !1231
  %96 = load i32, i32* %95, align 4, !dbg !1231
  %cmp121 = icmp slt i32 %94, %96, !dbg !1232
  br i1 %cmp121, label %for.body122, label %for.end129, !dbg !1233

for.body122:                                      ; preds = %for.cond120
  %97 = bitcast %"class.std::basic_ifstream"* %training_labels_file to %"class.std::basic_istream"*, !dbg !1234
  %98 = load i8**, i8*** %training_labels.addr, align 8, !dbg !1236
  %99 = load i8*, i8** %98, align 8, !dbg !1237
  %100 = load i32, i32* %i119, align 4, !dbg !1238
  %idxprom123 = sext i32 %100 to i64, !dbg !1239
  %arrayidx124 = getelementptr inbounds i8, i8* %99, i64 %idxprom123, !dbg !1239
  %call126 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSi4readEPcl(%"class.std::basic_istream"* %97, i8* %arrayidx124, i64 1)
          to label %invoke.cont125 unwind label %lpad49, !dbg !1240

invoke.cont125:                                   ; preds = %for.body122
  br label %for.inc127, !dbg !1241

for.inc127:                                       ; preds = %invoke.cont125
  %101 = load i32, i32* %i119, align 4, !dbg !1242
  %inc128 = add nsw i32 %101, 1, !dbg !1242
  store i32 %inc128, i32* %i119, align 4, !dbg !1242
  br label %for.cond120, !dbg !1243, !llvm.loop !1244

for.end129:                                       ; preds = %for.cond120
  call void @llvm.dbg.declare(metadata i32* %i130, metadata !1246, metadata !DIExpression()), !dbg !1248
  store i32 0, i32* %i130, align 4, !dbg !1248
  br label %for.cond131, !dbg !1249

for.cond131:                                      ; preds = %for.inc138, %for.end129
  %102 = load i32, i32* %i130, align 4, !dbg !1250
  %103 = load i32*, i32** %num_test.addr, align 8, !dbg !1252
  %104 = load i32, i32* %103, align 4, !dbg !1252
  %cmp132 = icmp slt i32 %102, %104, !dbg !1253
  br i1 %cmp132, label %for.body133, label %for.end140, !dbg !1254

for.body133:                                      ; preds = %for.cond131
  %105 = bitcast %"class.std::basic_ifstream"* %expected_file to %"class.std::basic_istream"*, !dbg !1255
  %106 = load i8**, i8*** %expected.addr, align 8, !dbg !1257
  %107 = load i8*, i8** %106, align 8, !dbg !1258
  %108 = load i32, i32* %i130, align 4, !dbg !1259
  %idxprom134 = sext i32 %108 to i64, !dbg !1260
  %arrayidx135 = getelementptr inbounds i8, i8* %107, i64 %idxprom134, !dbg !1260
  %call137 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSi4readEPcl(%"class.std::basic_istream"* %105, i8* %arrayidx135, i64 1)
          to label %invoke.cont136 unwind label %lpad49, !dbg !1261

invoke.cont136:                                   ; preds = %for.body133
  br label %for.inc138, !dbg !1262

for.inc138:                                       ; preds = %invoke.cont136
  %109 = load i32, i32* %i130, align 4, !dbg !1263
  %inc139 = add nsw i32 %109, 1, !dbg !1263
  store i32 %inc139, i32* %i130, align 4, !dbg !1263
  br label %for.cond131, !dbg !1264, !llvm.loop !1265

for.end140:                                       ; preds = %for.cond131
  invoke void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE5closeEv(%"class.std::basic_ifstream"* %training_data_file)
          to label %invoke.cont141 unwind label %lpad49, !dbg !1267

invoke.cont141:                                   ; preds = %for.end140
  invoke void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE5closeEv(%"class.std::basic_ifstream"* %test_data_file)
          to label %invoke.cont142 unwind label %lpad49, !dbg !1268

invoke.cont142:                                   ; preds = %invoke.cont141
  invoke void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE5closeEv(%"class.std::basic_ifstream"* %expected_file)
          to label %invoke.cont143 unwind label %lpad49, !dbg !1269

invoke.cont143:                                   ; preds = %invoke.cont142
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %training_labels_file) #3, !dbg !1109
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %expected_file) #3, !dbg !1109
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %test_data_file) #3, !dbg !1109
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %training_data_file) #3, !dbg !1109
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %expected_filename) #3, !dbg !1109
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %training_labels_filename) #3, !dbg !1109
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %test_data_filename) #3, !dbg !1109
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %training_data_filename) #3, !dbg !1109
  ret void, !dbg !1109

ehcleanup:                                        ; preds = %lpad49, %lpad47
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %expected_file) #3, !dbg !1109
  br label %ehcleanup144, !dbg !1109

ehcleanup144:                                     ; preds = %ehcleanup, %lpad44
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %test_data_file) #3, !dbg !1109
  br label %ehcleanup145, !dbg !1109

ehcleanup145:                                     ; preds = %ehcleanup144, %lpad41
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %training_data_file) #3, !dbg !1109
  br label %ehcleanup146, !dbg !1109

ehcleanup146:                                     ; preds = %ehcleanup145, %lpad
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %expected_filename) #3, !dbg !1109
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %training_labels_filename) #3, !dbg !1109
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %test_data_filename) #3, !dbg !1109
  call void @_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev(%"class.std::__cxx11::basic_string"* %training_data_filename) #3, !dbg !1109
  br label %eh.resume, !dbg !1109

eh.resume:                                        ; preds = %ehcleanup146
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !1109
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !1109
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !1109
  %lpad.val150 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !1109
  resume { i8*, i32 } %lpad.val150, !dbg !1109
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
define internal void @_GLOBAL__sub_I_utils.cpp() #0 section ".text.startup" !dbg !1270 {
entry:
  call void @__cxx_global_var_init(), !dbg !1272
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
!971 = !DILocation(line: 20, column: 97, scope: !966)
!972 = !DILocation(line: 20, column: 5, scope: !966)
!973 = !DILocation(line: 21, column: 1, scope: !966)
!974 = distinct !DISubprogram(name: "parse_command_line_args", linkageName: "_Z23parse_command_line_argsiPPcRiS1_PPyS3_PPhS5_", scope: !29, file: !29, line: 23, type: !975, isLocal: false, isDefinition: true, scopeLine: 31, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!975 = !DISubroutineType(types: !976)
!976 = !{null, !11, !347, !977, !977, !978, !978, !982, !982}
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
!997 = !DILocalVariable(name: "training_labels", arg: 7, scope: !974, file: !29, line: 29, type: !982)
!998 = !DILocation(line: 29, column: 15, scope: !974)
!999 = !DILocalVariable(name: "expected", arg: 8, scope: !974, file: !29, line: 30, type: !982)
!1000 = !DILocation(line: 30, column: 15, scope: !974)
!1001 = !DILocalVariable(name: "c", scope: !974, file: !29, line: 32, type: !11)
!1002 = !DILocation(line: 32, column: 7, scope: !974)
!1003 = !DILocalVariable(name: "training_data_filename", scope: !974, file: !29, line: 33, type: !1004)
!1004 = !DIDerivedType(tag: DW_TAG_typedef, name: "string", scope: !2, file: !1005, line: 79, baseType: !1006)
!1005 = !DIFile(filename: "/usr/include/c++/11/bits/stringfwd.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!1006 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_string<char, std::char_traits<char>, std::allocator<char> >", scope: !1008, file: !1007, line: 1627, size: 256, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE")
!1007 = !DIFile(filename: "/usr/include/c++/11/bits/basic_string.tcc", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!1008 = !DINamespace(name: "__cxx11", scope: !2, exportSymbols: true)
!1009 = !DILocation(line: 33, column: 15, scope: !974)
!1010 = !DILocalVariable(name: "test_data_filename", scope: !974, file: !29, line: 33, type: !1004)
!1011 = !DILocation(line: 33, column: 39, scope: !974)
!1012 = !DILocalVariable(name: "training_labels_filename", scope: !974, file: !29, line: 33, type: !1004)
!1013 = !DILocation(line: 33, column: 59, scope: !974)
!1014 = !DILocalVariable(name: "expected_filename", scope: !974, file: !29, line: 33, type: !1004)
!1015 = !DILocation(line: 33, column: 85, scope: !974)
!1016 = !DILocation(line: 35, column: 3, scope: !974)
!1017 = !DILocation(line: 35, column: 22, scope: !974)
!1018 = !DILocation(line: 35, column: 28, scope: !974)
!1019 = !DILocation(line: 35, column: 15, scope: !974)
!1020 = !DILocation(line: 35, column: 13, scope: !974)
!1021 = !DILocation(line: 35, column: 47, scope: !974)
!1022 = !DILocation(line: 37, column: 13, scope: !1023)
!1023 = distinct !DILexicalBlock(scope: !974, file: !29, line: 36, column: 3)
!1024 = !DILocation(line: 37, column: 5, scope: !1023)
!1025 = !DILocation(line: 40, column: 34, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1023, file: !29, line: 38, column: 5)
!1027 = !DILocation(line: 40, column: 32, scope: !1026)
!1028 = !DILocation(line: 41, column: 9, scope: !1026)
!1029 = !DILocation(line: 134, column: 1, scope: !1026)
!1030 = !DILocation(line: 43, column: 30, scope: !1026)
!1031 = !DILocation(line: 43, column: 28, scope: !1026)
!1032 = !DILocation(line: 44, column: 9, scope: !1026)
!1033 = !DILocation(line: 46, column: 29, scope: !1026)
!1034 = !DILocation(line: 46, column: 27, scope: !1026)
!1035 = !DILocation(line: 47, column: 9, scope: !1026)
!1036 = !DILocation(line: 49, column: 36, scope: !1026)
!1037 = !DILocation(line: 49, column: 34, scope: !1026)
!1038 = !DILocation(line: 50, column: 9, scope: !1026)
!1039 = !DILocation(line: 52, column: 13, scope: !1040)
!1040 = distinct !DILexicalBlock(scope: !1026, file: !29, line: 52, column: 13)
!1041 = !DILocation(line: 52, column: 20, scope: !1040)
!1042 = !DILocation(line: 52, column: 27, scope: !1040)
!1043 = !DILocation(line: 52, column: 30, scope: !1040)
!1044 = !DILocation(line: 52, column: 37, scope: !1040)
!1045 = !DILocation(line: 52, column: 44, scope: !1040)
!1046 = !DILocation(line: 52, column: 47, scope: !1040)
!1047 = !DILocation(line: 52, column: 54, scope: !1040)
!1048 = !DILocation(line: 52, column: 13, scope: !1026)
!1049 = !DILocation(line: 53, column: 20, scope: !1040)
!1050 = !DILocation(line: 53, column: 66, scope: !1040)
!1051 = !DILocation(line: 53, column: 11, scope: !1040)
!1052 = !DILocation(line: 54, column: 27, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !1040, file: !29, line: 54, column: 18)
!1054 = !DILocation(line: 54, column: 18, scope: !1053)
!1055 = !DILocation(line: 54, column: 18, scope: !1040)
!1056 = !DILocation(line: 55, column: 20, scope: !1053)
!1057 = !DILocation(line: 55, column: 55, scope: !1053)
!1058 = !DILocation(line: 55, column: 11, scope: !1053)
!1059 = !DILocation(line: 57, column: 20, scope: !1053)
!1060 = !DILocation(line: 57, column: 67, scope: !1053)
!1061 = !DILocation(line: 57, column: 11, scope: !1053)
!1062 = !DILocation(line: 58, column: 21, scope: !1026)
!1063 = !DILocation(line: 58, column: 9, scope: !1026)
!1064 = !DILocation(line: 59, column: 9, scope: !1026)
!1065 = !DILocation(line: 61, column: 21, scope: !1026)
!1066 = !DILocation(line: 61, column: 9, scope: !1026)
!1067 = !DILocation(line: 62, column: 9, scope: !1026)
!1068 = distinct !{!1068, !1016, !1069}
!1069 = !DILocation(line: 64, column: 3, scope: !974)
!1070 = !DILocation(line: 66, column: 30, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !974, file: !29, line: 66, column: 7)
!1072 = !DILocation(line: 66, column: 38, scope: !1071)
!1073 = !DILocation(line: 66, column: 60, scope: !1071)
!1074 = !DILocation(line: 66, column: 68, scope: !1071)
!1075 = !DILocation(line: 66, column: 89, scope: !1071)
!1076 = !DILocation(line: 66, column: 7, scope: !974)
!1077 = !DILocation(line: 68, column: 17, scope: !1078)
!1078 = distinct !DILexicalBlock(scope: !1071, file: !29, line: 67, column: 3)
!1079 = !DILocation(line: 68, column: 5, scope: !1078)
!1080 = !DILocation(line: 69, column: 5, scope: !1078)
!1081 = !DILocalVariable(name: "training_data_file", scope: !974, file: !29, line: 73, type: !1082)
!1082 = !DIDerivedType(tag: DW_TAG_typedef, name: "ifstream", scope: !2, file: !1083, line: 162, baseType: !1084)
!1083 = !DIFile(filename: "/usr/include/c++/11/iosfwd", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!1084 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ifstream<char, std::char_traits<char> >", scope: !2, file: !1085, line: 1087, size: 4160, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt14basic_ifstreamIcSt11char_traitsIcEE")
!1085 = !DIFile(filename: "/usr/include/c++/11/bits/fstream.tcc", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/digit-recognition/approx")
!1086 = !DILocation(line: 73, column: 17, scope: !974)
!1087 = !DILocation(line: 73, column: 59, scope: !974)
!1088 = !DILocalVariable(name: "test_data_file", scope: !974, file: !29, line: 74, type: !1082)
!1089 = !DILocation(line: 74, column: 17, scope: !974)
!1090 = !DILocation(line: 74, column: 51, scope: !974)
!1091 = !DILocalVariable(name: "expected_file", scope: !974, file: !29, line: 75, type: !1082)
!1092 = !DILocation(line: 75, column: 17, scope: !974)
!1093 = !DILocation(line: 75, column: 49, scope: !974)
!1094 = !DILocalVariable(name: "training_labels_file", scope: !974, file: !29, line: 76, type: !1082)
!1095 = !DILocation(line: 76, column: 17, scope: !974)
!1096 = !DILocation(line: 76, column: 63, scope: !974)
!1097 = !DILocation(line: 78, column: 27, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !974, file: !29, line: 78, column: 7)
!1099 = !DILocation(line: 78, column: 37, scope: !1098)
!1100 = !DILocation(line: 78, column: 56, scope: !1098)
!1101 = !DILocation(line: 78, column: 66, scope: !1098)
!1102 = !DILocation(line: 78, column: 84, scope: !1098)
!1103 = !DILocation(line: 78, column: 94, scope: !1098)
!1104 = !DILocation(line: 78, column: 119, scope: !1098)
!1105 = !DILocation(line: 78, column: 7, scope: !974)
!1106 = !DILocation(line: 80, column: 5, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1098, file: !29, line: 79, column: 3)
!1108 = !DILocation(line: 81, column: 5, scope: !1107)
!1109 = !DILocation(line: 134, column: 1, scope: !974)
!1110 = !DILocation(line: 134, column: 1, scope: !1098)
!1111 = !DILocation(line: 85, column: 3, scope: !974)
!1112 = !DILocation(line: 85, column: 35, scope: !974)
!1113 = !DILocation(line: 85, column: 27, scope: !974)
!1114 = !DILocation(line: 85, column: 22, scope: !974)
!1115 = !DILocation(line: 86, column: 3, scope: !974)
!1116 = !DILocation(line: 86, column: 31, scope: !974)
!1117 = !DILocation(line: 86, column: 23, scope: !974)
!1118 = !DILocation(line: 86, column: 18, scope: !974)
!1119 = !DILocation(line: 88, column: 7, scope: !1120)
!1120 = distinct !DILexicalBlock(scope: !974, file: !29, line: 88, column: 7)
!1121 = !DILocation(line: 88, column: 20, scope: !1120)
!1122 = !DILocation(line: 88, column: 25, scope: !1120)
!1123 = !DILocation(line: 88, column: 28, scope: !1120)
!1124 = !DILocation(line: 88, column: 37, scope: !1120)
!1125 = !DILocation(line: 88, column: 7, scope: !974)
!1126 = !DILocation(line: 90, column: 5, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1120, file: !29, line: 89, column: 3)
!1128 = !DILocation(line: 91, column: 5, scope: !1127)
!1129 = !DILocation(line: 95, column: 34, scope: !974)
!1130 = !DILocation(line: 95, column: 47, scope: !974)
!1131 = !DILocation(line: 95, column: 20, scope: !974)
!1132 = !DILocation(line: 95, column: 4, scope: !974)
!1133 = !DILocation(line: 95, column: 18, scope: !974)
!1134 = !DILocation(line: 96, column: 30, scope: !974)
!1135 = !DILocation(line: 96, column: 39, scope: !974)
!1136 = !DILocation(line: 96, column: 16, scope: !974)
!1137 = !DILocation(line: 96, column: 4, scope: !974)
!1138 = !DILocation(line: 96, column: 14, scope: !974)
!1139 = !DILocation(line: 97, column: 36, scope: !974)
!1140 = !DILocation(line: 97, column: 22, scope: !974)
!1141 = !DILocation(line: 97, column: 4, scope: !974)
!1142 = !DILocation(line: 97, column: 20, scope: !974)
!1143 = !DILocation(line: 98, column: 29, scope: !974)
!1144 = !DILocation(line: 98, column: 15, scope: !974)
!1145 = !DILocation(line: 98, column: 4, scope: !974)
!1146 = !DILocation(line: 98, column: 13, scope: !974)
!1147 = !DILocalVariable(name: "i", scope: !1148, file: !29, line: 101, type: !11)
!1148 = distinct !DILexicalBlock(scope: !974, file: !29, line: 101, column: 3)
!1149 = !DILocation(line: 101, column: 12, scope: !1148)
!1150 = !DILocation(line: 101, column: 8, scope: !1148)
!1151 = !DILocation(line: 101, column: 19, scope: !1152)
!1152 = distinct !DILexicalBlock(scope: !1148, file: !29, line: 101, column: 3)
!1153 = !DILocation(line: 101, column: 23, scope: !1152)
!1154 = !DILocation(line: 101, column: 21, scope: !1152)
!1155 = !DILocation(line: 101, column: 3, scope: !1148)
!1156 = !DILocalVariable(name: "j", scope: !1157, file: !29, line: 103, type: !11)
!1157 = distinct !DILexicalBlock(scope: !1158, file: !29, line: 103, column: 5)
!1158 = distinct !DILexicalBlock(scope: !1152, file: !29, line: 102, column: 3)
!1159 = !DILocation(line: 103, column: 14, scope: !1157)
!1160 = !DILocation(line: 103, column: 10, scope: !1157)
!1161 = !DILocation(line: 103, column: 21, scope: !1162)
!1162 = distinct !DILexicalBlock(scope: !1157, file: !29, line: 103, column: 5)
!1163 = !DILocation(line: 103, column: 23, scope: !1162)
!1164 = !DILocation(line: 103, column: 5, scope: !1157)
!1165 = !DILocation(line: 105, column: 7, scope: !1166)
!1166 = distinct !DILexicalBlock(scope: !1162, file: !29, line: 104, column: 5)
!1167 = !DILocation(line: 105, column: 41, scope: !1166)
!1168 = !DILocation(line: 105, column: 40, scope: !1166)
!1169 = !DILocation(line: 105, column: 56, scope: !1166)
!1170 = !DILocation(line: 105, column: 58, scope: !1166)
!1171 = !DILocation(line: 105, column: 74, scope: !1166)
!1172 = !DILocation(line: 105, column: 72, scope: !1166)
!1173 = !DILocation(line: 105, column: 39, scope: !1166)
!1174 = !DILocation(line: 105, column: 31, scope: !1166)
!1175 = !DILocation(line: 105, column: 26, scope: !1166)
!1176 = !DILocation(line: 106, column: 5, scope: !1166)
!1177 = !DILocation(line: 103, column: 39, scope: !1162)
!1178 = !DILocation(line: 103, column: 5, scope: !1162)
!1179 = distinct !{!1179, !1164, !1180}
!1180 = !DILocation(line: 106, column: 5, scope: !1157)
!1181 = !DILocation(line: 107, column: 3, scope: !1158)
!1182 = !DILocation(line: 101, column: 38, scope: !1152)
!1183 = !DILocation(line: 101, column: 3, scope: !1152)
!1184 = distinct !{!1184, !1155, !1185}
!1185 = !DILocation(line: 107, column: 3, scope: !1148)
!1186 = !DILocalVariable(name: "i", scope: !1187, file: !29, line: 110, type: !11)
!1187 = distinct !DILexicalBlock(scope: !974, file: !29, line: 110, column: 3)
!1188 = !DILocation(line: 110, column: 12, scope: !1187)
!1189 = !DILocation(line: 110, column: 8, scope: !1187)
!1190 = !DILocation(line: 110, column: 19, scope: !1191)
!1191 = distinct !DILexicalBlock(scope: !1187, file: !29, line: 110, column: 3)
!1192 = !DILocation(line: 110, column: 23, scope: !1191)
!1193 = !DILocation(line: 110, column: 21, scope: !1191)
!1194 = !DILocation(line: 110, column: 3, scope: !1187)
!1195 = !DILocalVariable(name: "j", scope: !1196, file: !29, line: 112, type: !11)
!1196 = distinct !DILexicalBlock(scope: !1197, file: !29, line: 112, column: 5)
!1197 = distinct !DILexicalBlock(scope: !1191, file: !29, line: 111, column: 3)
!1198 = !DILocation(line: 112, column: 14, scope: !1196)
!1199 = !DILocation(line: 112, column: 10, scope: !1196)
!1200 = !DILocation(line: 112, column: 21, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1196, file: !29, line: 112, column: 5)
!1202 = !DILocation(line: 112, column: 23, scope: !1201)
!1203 = !DILocation(line: 112, column: 5, scope: !1196)
!1204 = !DILocation(line: 114, column: 7, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !1201, file: !29, line: 113, column: 5)
!1206 = !DILocation(line: 114, column: 37, scope: !1205)
!1207 = !DILocation(line: 114, column: 36, scope: !1205)
!1208 = !DILocation(line: 114, column: 48, scope: !1205)
!1209 = !DILocation(line: 114, column: 50, scope: !1205)
!1210 = !DILocation(line: 114, column: 66, scope: !1205)
!1211 = !DILocation(line: 114, column: 64, scope: !1205)
!1212 = !DILocation(line: 114, column: 35, scope: !1205)
!1213 = !DILocation(line: 114, column: 27, scope: !1205)
!1214 = !DILocation(line: 114, column: 22, scope: !1205)
!1215 = !DILocation(line: 115, column: 5, scope: !1205)
!1216 = !DILocation(line: 112, column: 39, scope: !1201)
!1217 = !DILocation(line: 112, column: 5, scope: !1201)
!1218 = distinct !{!1218, !1203, !1219}
!1219 = !DILocation(line: 115, column: 5, scope: !1196)
!1220 = !DILocation(line: 116, column: 3, scope: !1197)
!1221 = !DILocation(line: 110, column: 34, scope: !1191)
!1222 = !DILocation(line: 110, column: 3, scope: !1191)
!1223 = distinct !{!1223, !1194, !1224}
!1224 = !DILocation(line: 116, column: 3, scope: !1187)
!1225 = !DILocalVariable(name: "i", scope: !1226, file: !29, line: 119, type: !11)
!1226 = distinct !DILexicalBlock(scope: !974, file: !29, line: 119, column: 3)
!1227 = !DILocation(line: 119, column: 12, scope: !1226)
!1228 = !DILocation(line: 119, column: 8, scope: !1226)
!1229 = !DILocation(line: 119, column: 19, scope: !1230)
!1230 = distinct !DILexicalBlock(scope: !1226, file: !29, line: 119, column: 3)
!1231 = !DILocation(line: 119, column: 23, scope: !1230)
!1232 = !DILocation(line: 119, column: 21, scope: !1230)
!1233 = !DILocation(line: 119, column: 3, scope: !1226)
!1234 = !DILocation(line: 121, column: 5, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1230, file: !29, line: 120, column: 3)
!1236 = !DILocation(line: 121, column: 41, scope: !1235)
!1237 = !DILocation(line: 121, column: 40, scope: !1235)
!1238 = !DILocation(line: 121, column: 58, scope: !1235)
!1239 = !DILocation(line: 121, column: 39, scope: !1235)
!1240 = !DILocation(line: 121, column: 26, scope: !1235)
!1241 = !DILocation(line: 122, column: 3, scope: !1235)
!1242 = !DILocation(line: 119, column: 38, scope: !1230)
!1243 = !DILocation(line: 119, column: 3, scope: !1230)
!1244 = distinct !{!1244, !1233, !1245}
!1245 = !DILocation(line: 122, column: 3, scope: !1226)
!1246 = !DILocalVariable(name: "i", scope: !1247, file: !29, line: 125, type: !11)
!1247 = distinct !DILexicalBlock(scope: !974, file: !29, line: 125, column: 3)
!1248 = !DILocation(line: 125, column: 12, scope: !1247)
!1249 = !DILocation(line: 125, column: 8, scope: !1247)
!1250 = !DILocation(line: 125, column: 19, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1247, file: !29, line: 125, column: 3)
!1252 = !DILocation(line: 125, column: 23, scope: !1251)
!1253 = !DILocation(line: 125, column: 21, scope: !1251)
!1254 = !DILocation(line: 125, column: 3, scope: !1247)
!1255 = !DILocation(line: 127, column: 5, scope: !1256)
!1256 = distinct !DILexicalBlock(scope: !1251, file: !29, line: 126, column: 3)
!1257 = !DILocation(line: 127, column: 34, scope: !1256)
!1258 = !DILocation(line: 127, column: 33, scope: !1256)
!1259 = !DILocation(line: 127, column: 44, scope: !1256)
!1260 = !DILocation(line: 127, column: 32, scope: !1256)
!1261 = !DILocation(line: 127, column: 19, scope: !1256)
!1262 = !DILocation(line: 128, column: 3, scope: !1256)
!1263 = !DILocation(line: 125, column: 34, scope: !1251)
!1264 = !DILocation(line: 125, column: 3, scope: !1251)
!1265 = distinct !{!1265, !1254, !1266}
!1266 = !DILocation(line: 128, column: 3, scope: !1247)
!1267 = !DILocation(line: 131, column: 22, scope: !974)
!1268 = !DILocation(line: 132, column: 18, scope: !974)
!1269 = !DILocation(line: 133, column: 17, scope: !974)
!1270 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_utils.cpp", scope: !29, file: !29, type: !1271, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !28, variables: !30)
!1271 = !DISubroutineType(types: !30)
!1272 = !DILocation(line: 0, scope: !1270)
