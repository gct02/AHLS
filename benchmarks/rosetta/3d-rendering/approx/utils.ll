; ModuleID = '../src/utils.cpp'
source_filename = "../src/utils.cpp"
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
%struct.Triangle_3D = type { i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%"class.std::basic_ifstream" = type { %"class.std::basic_istream.base", %"class.std::basic_filebuf", %"class.std::basic_ios" }
%"class.std::basic_istream.base" = type { i32 (...)**, i64 }
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
%"class.std::basic_istream" = type { i32 (...)**, i64, %"class.std::basic_ios" }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@__dso_handle = external hidden global i8
@.str = private unnamed_addr constant [32 x i8] c"usage: %s input_triangles_file\0A\00", align 1
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str.1 = private unnamed_addr constant [21 x i8] c"Reading input file: \00", align 1
@.str.2 = private unnamed_addr constant [34 x i8] c"Error: failed to open input file\0A\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"Number of triangles: \00", align 1
@.str.4 = private unnamed_addr constant [36 x i8] c"Error: invalid number of triangles\0A\00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"Reading triangle data...\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_utils.cpp, i8* null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" !dbg !925 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !926
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3, !dbg !926
  ret void, !dbg !926
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: noinline optnone uwtable
define void @_Z11print_usagePc(i8* %filename) #4 !dbg !927 {
entry:
  %filename.addr = alloca i8*, align 8
  store i8* %filename, i8** %filename.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %filename.addr, metadata !930, metadata !DIExpression()), !dbg !931
  %0 = load i8*, i8** %filename.addr, align 8, !dbg !932
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i32 0, i32 0), i8* %0), !dbg !933
  ret void, !dbg !934
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #5

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline optnone uwtable
define void @_Z23parse_command_line_argsiPPcRiPP11Triangle_3D(i32 %argc, i8** %argv, i32* dereferenceable(4) %num_triangles, %struct.Triangle_3D** %triangles) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !935 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %num_triangles.addr = alloca i32*, align 8
  %triangles.addr = alloca %struct.Triangle_3D**, align 8
  %infile = alloca %"class.std::basic_ifstream", align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %x0 = alloca i32, align 4
  %y0 = alloca i32, align 4
  %z0 = alloca i32, align 4
  %x1 = alloca i32, align 4
  %y1 = alloca i32, align 4
  %z1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %y2 = alloca i32, align 4
  %z2 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !955, metadata !DIExpression()), !dbg !956
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !957, metadata !DIExpression()), !dbg !958
  store i32* %num_triangles, i32** %num_triangles.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %num_triangles.addr, metadata !959, metadata !DIExpression()), !dbg !960
  store %struct.Triangle_3D** %triangles, %struct.Triangle_3D*** %triangles.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Triangle_3D*** %triangles.addr, metadata !961, metadata !DIExpression()), !dbg !962
  %0 = load i32*, i32** %num_triangles.addr, align 8, !dbg !963
  store i32 0, i32* %0, align 4, !dbg !964
  %1 = load i32, i32* %argc.addr, align 4, !dbg !965
  %cmp = icmp slt i32 %1, 2, !dbg !967
  br i1 %cmp, label %if.then, label %if.end, !dbg !968

if.then:                                          ; preds = %entry
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !969
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 0, !dbg !969
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !969
  call void @_Z11print_usagePc(i8* %3), !dbg !971
  call void @exit(i32 -1) #8, !dbg !972
  unreachable, !dbg !972

if.end:                                           ; preds = %entry
  %call = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0)), !dbg !973
  %4 = load i8**, i8*** %argv.addr, align 8, !dbg !974
  %arrayidx1 = getelementptr inbounds i8*, i8** %4, i64 1, !dbg !974
  %5 = load i8*, i8** %arrayidx1, align 8, !dbg !974
  %call2 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call, i8* %5), !dbg !975
  %call3 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call2, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_), !dbg !976
  call void @llvm.dbg.declare(metadata %"class.std::basic_ifstream"* %infile, metadata !977, metadata !DIExpression()), !dbg !982
  %6 = load i8**, i8*** %argv.addr, align 8, !dbg !983
  %arrayidx4 = getelementptr inbounds i8*, i8** %6, i64 1, !dbg !983
  %7 = load i8*, i8** %arrayidx4, align 8, !dbg !983
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode(%"class.std::basic_ifstream"* %infile, i8* %7, i32 8), !dbg !982
  %call5 = invoke zeroext i1 @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ifstream"* %infile)
          to label %invoke.cont unwind label %lpad, !dbg !984

invoke.cont:                                      ; preds = %if.end
  br i1 %call5, label %if.end9, label %if.then6, !dbg !986

if.then6:                                         ; preds = %invoke.cont
  %call8 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.2, i32 0, i32 0))
          to label %invoke.cont7 unwind label %lpad, !dbg !987

invoke.cont7:                                     ; preds = %if.then6
  call void @exit(i32 -1) #8, !dbg !989
  unreachable, !dbg !989

lpad:                                             ; preds = %for.end, %invoke.cont44, %invoke.cont42, %invoke.cont40, %invoke.cont38, %invoke.cont36, %invoke.cont34, %invoke.cont32, %invoke.cont30, %for.body, %invoke.cont25, %invoke.cont23, %if.end22, %if.then19, %invoke.cont14, %invoke.cont12, %invoke.cont10, %if.end9, %if.then6, %if.end
  %8 = landingpad { i8*, i32 }
          cleanup, !dbg !990
  %9 = extractvalue { i8*, i32 } %8, 0, !dbg !990
  store i8* %9, i8** %exn.slot, align 8, !dbg !990
  %10 = extractvalue { i8*, i32 } %8, 1, !dbg !990
  store i32 %10, i32* %ehselector.slot, align 4, !dbg !990
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %infile) #3, !dbg !991
  br label %eh.resume, !dbg !991

if.end9:                                          ; preds = %invoke.cont
  %11 = bitcast %"class.std::basic_ifstream"* %infile to %"class.std::basic_istream"*, !dbg !992
  %12 = load i32*, i32** %num_triangles.addr, align 8, !dbg !993
  %call11 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* %11, i32* dereferenceable(4) %12)
          to label %invoke.cont10 unwind label %lpad, !dbg !994

invoke.cont10:                                    ; preds = %if.end9
  %call13 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i32 0, i32 0))
          to label %invoke.cont12 unwind label %lpad, !dbg !995

invoke.cont12:                                    ; preds = %invoke.cont10
  %13 = load i32*, i32** %num_triangles.addr, align 8, !dbg !996
  %14 = load i32, i32* %13, align 4, !dbg !996
  %call15 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call13, i32 %14)
          to label %invoke.cont14 unwind label %lpad, !dbg !997

invoke.cont14:                                    ; preds = %invoke.cont12
  %call17 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call15, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont16 unwind label %lpad, !dbg !998

invoke.cont16:                                    ; preds = %invoke.cont14
  %15 = load i32*, i32** %num_triangles.addr, align 8, !dbg !999
  %16 = load i32, i32* %15, align 4, !dbg !999
  %cmp18 = icmp sle i32 %16, 0, !dbg !1001
  br i1 %cmp18, label %if.then19, label %if.end22, !dbg !1002

if.then19:                                        ; preds = %invoke.cont16
  %call21 = invoke i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.4, i32 0, i32 0))
          to label %invoke.cont20 unwind label %lpad, !dbg !1003

invoke.cont20:                                    ; preds = %if.then19
  call void @exit(i32 -1) #8, !dbg !1005
  unreachable, !dbg !1005

if.end22:                                         ; preds = %invoke.cont16
  %17 = load i32*, i32** %num_triangles.addr, align 8, !dbg !1006
  %18 = load i32, i32* %17, align 4, !dbg !1006
  %conv = sext i32 %18 to i64, !dbg !1006
  %19 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %conv, i64 9), !dbg !1007
  %20 = extractvalue { i64, i1 } %19, 1, !dbg !1007
  %21 = extractvalue { i64, i1 } %19, 0, !dbg !1007
  %22 = select i1 %20, i64 -1, i64 %21, !dbg !1007
  %call24 = invoke i8* @_Znam(i64 %22) #9
          to label %invoke.cont23 unwind label %lpad, !dbg !1007

invoke.cont23:                                    ; preds = %if.end22
  %23 = bitcast i8* %call24 to %struct.Triangle_3D*, !dbg !1007
  %24 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangles.addr, align 8, !dbg !1008
  store %struct.Triangle_3D* %23, %struct.Triangle_3D** %24, align 8, !dbg !1009
  call void @llvm.dbg.declare(metadata i32* %x0, metadata !1010, metadata !DIExpression()), !dbg !1011
  call void @llvm.dbg.declare(metadata i32* %y0, metadata !1012, metadata !DIExpression()), !dbg !1013
  call void @llvm.dbg.declare(metadata i32* %z0, metadata !1014, metadata !DIExpression()), !dbg !1015
  call void @llvm.dbg.declare(metadata i32* %x1, metadata !1016, metadata !DIExpression()), !dbg !1017
  call void @llvm.dbg.declare(metadata i32* %y1, metadata !1018, metadata !DIExpression()), !dbg !1019
  call void @llvm.dbg.declare(metadata i32* %z1, metadata !1020, metadata !DIExpression()), !dbg !1021
  call void @llvm.dbg.declare(metadata i32* %x2, metadata !1022, metadata !DIExpression()), !dbg !1023
  call void @llvm.dbg.declare(metadata i32* %y2, metadata !1024, metadata !DIExpression()), !dbg !1025
  call void @llvm.dbg.declare(metadata i32* %z2, metadata !1026, metadata !DIExpression()), !dbg !1027
  %call26 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.5, i32 0, i32 0))
          to label %invoke.cont25 unwind label %lpad, !dbg !1028

invoke.cont25:                                    ; preds = %invoke.cont23
  %call28 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call26, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont27 unwind label %lpad, !dbg !1029

invoke.cont27:                                    ; preds = %invoke.cont25
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1030, metadata !DIExpression()), !dbg !1032
  store i32 0, i32* %i, align 4, !dbg !1032
  br label %for.cond, !dbg !1033

for.cond:                                         ; preds = %for.inc, %invoke.cont27
  %25 = load i32, i32* %i, align 4, !dbg !1034
  %26 = load i32*, i32** %num_triangles.addr, align 8, !dbg !1036
  %27 = load i32, i32* %26, align 4, !dbg !1036
  %cmp29 = icmp slt i32 %25, %27, !dbg !1037
  br i1 %cmp29, label %for.body, label %for.end, !dbg !1038

for.body:                                         ; preds = %for.cond
  %28 = bitcast %"class.std::basic_ifstream"* %infile to %"class.std::basic_istream"*, !dbg !1039
  %call31 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* %28, i32* dereferenceable(4) %x0)
          to label %invoke.cont30 unwind label %lpad, !dbg !1041

invoke.cont30:                                    ; preds = %for.body
  %call33 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* %call31, i32* dereferenceable(4) %y0)
          to label %invoke.cont32 unwind label %lpad, !dbg !1042

invoke.cont32:                                    ; preds = %invoke.cont30
  %call35 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* %call33, i32* dereferenceable(4) %z0)
          to label %invoke.cont34 unwind label %lpad, !dbg !1043

invoke.cont34:                                    ; preds = %invoke.cont32
  %call37 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* %call35, i32* dereferenceable(4) %x1)
          to label %invoke.cont36 unwind label %lpad, !dbg !1044

invoke.cont36:                                    ; preds = %invoke.cont34
  %call39 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* %call37, i32* dereferenceable(4) %y1)
          to label %invoke.cont38 unwind label %lpad, !dbg !1045

invoke.cont38:                                    ; preds = %invoke.cont36
  %call41 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* %call39, i32* dereferenceable(4) %z1)
          to label %invoke.cont40 unwind label %lpad, !dbg !1046

invoke.cont40:                                    ; preds = %invoke.cont38
  %call43 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* %call41, i32* dereferenceable(4) %x2)
          to label %invoke.cont42 unwind label %lpad, !dbg !1047

invoke.cont42:                                    ; preds = %invoke.cont40
  %call45 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* %call43, i32* dereferenceable(4) %y2)
          to label %invoke.cont44 unwind label %lpad, !dbg !1048

invoke.cont44:                                    ; preds = %invoke.cont42
  %call47 = invoke dereferenceable(280) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"* %call45, i32* dereferenceable(4) %z2)
          to label %invoke.cont46 unwind label %lpad, !dbg !1049

invoke.cont46:                                    ; preds = %invoke.cont44
  %29 = load i32, i32* %x0, align 4, !dbg !1050
  %conv48 = trunc i32 %29 to i8, !dbg !1050
  %30 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangles.addr, align 8, !dbg !1051
  %31 = load %struct.Triangle_3D*, %struct.Triangle_3D** %30, align 8, !dbg !1052
  %32 = load i32, i32* %i, align 4, !dbg !1053
  %idxprom = sext i32 %32 to i64, !dbg !1054
  %arrayidx49 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %31, i64 %idxprom, !dbg !1054
  %x050 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx49, i32 0, i32 0, !dbg !1055
  store i8 %conv48, i8* %x050, align 1, !dbg !1056
  %33 = load i32, i32* %y0, align 4, !dbg !1057
  %conv51 = trunc i32 %33 to i8, !dbg !1057
  %34 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangles.addr, align 8, !dbg !1058
  %35 = load %struct.Triangle_3D*, %struct.Triangle_3D** %34, align 8, !dbg !1059
  %36 = load i32, i32* %i, align 4, !dbg !1060
  %idxprom52 = sext i32 %36 to i64, !dbg !1061
  %arrayidx53 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %35, i64 %idxprom52, !dbg !1061
  %y054 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx53, i32 0, i32 1, !dbg !1062
  store i8 %conv51, i8* %y054, align 1, !dbg !1063
  %37 = load i32, i32* %z0, align 4, !dbg !1064
  %conv55 = trunc i32 %37 to i8, !dbg !1064
  %38 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangles.addr, align 8, !dbg !1065
  %39 = load %struct.Triangle_3D*, %struct.Triangle_3D** %38, align 8, !dbg !1066
  %40 = load i32, i32* %i, align 4, !dbg !1067
  %idxprom56 = sext i32 %40 to i64, !dbg !1068
  %arrayidx57 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %39, i64 %idxprom56, !dbg !1068
  %z058 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx57, i32 0, i32 2, !dbg !1069
  store i8 %conv55, i8* %z058, align 1, !dbg !1070
  %41 = load i32, i32* %x1, align 4, !dbg !1071
  %conv59 = trunc i32 %41 to i8, !dbg !1071
  %42 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangles.addr, align 8, !dbg !1072
  %43 = load %struct.Triangle_3D*, %struct.Triangle_3D** %42, align 8, !dbg !1073
  %44 = load i32, i32* %i, align 4, !dbg !1074
  %idxprom60 = sext i32 %44 to i64, !dbg !1075
  %arrayidx61 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %43, i64 %idxprom60, !dbg !1075
  %x162 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx61, i32 0, i32 3, !dbg !1076
  store i8 %conv59, i8* %x162, align 1, !dbg !1077
  %45 = load i32, i32* %y1, align 4, !dbg !1078
  %conv63 = trunc i32 %45 to i8, !dbg !1078
  %46 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangles.addr, align 8, !dbg !1079
  %47 = load %struct.Triangle_3D*, %struct.Triangle_3D** %46, align 8, !dbg !1080
  %48 = load i32, i32* %i, align 4, !dbg !1081
  %idxprom64 = sext i32 %48 to i64, !dbg !1082
  %arrayidx65 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %47, i64 %idxprom64, !dbg !1082
  %y166 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx65, i32 0, i32 4, !dbg !1083
  store i8 %conv63, i8* %y166, align 1, !dbg !1084
  %49 = load i32, i32* %z1, align 4, !dbg !1085
  %conv67 = trunc i32 %49 to i8, !dbg !1085
  %50 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangles.addr, align 8, !dbg !1086
  %51 = load %struct.Triangle_3D*, %struct.Triangle_3D** %50, align 8, !dbg !1087
  %52 = load i32, i32* %i, align 4, !dbg !1088
  %idxprom68 = sext i32 %52 to i64, !dbg !1089
  %arrayidx69 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %51, i64 %idxprom68, !dbg !1089
  %z170 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx69, i32 0, i32 5, !dbg !1090
  store i8 %conv67, i8* %z170, align 1, !dbg !1091
  %53 = load i32, i32* %x2, align 4, !dbg !1092
  %conv71 = trunc i32 %53 to i8, !dbg !1092
  %54 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangles.addr, align 8, !dbg !1093
  %55 = load %struct.Triangle_3D*, %struct.Triangle_3D** %54, align 8, !dbg !1094
  %56 = load i32, i32* %i, align 4, !dbg !1095
  %idxprom72 = sext i32 %56 to i64, !dbg !1096
  %arrayidx73 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %55, i64 %idxprom72, !dbg !1096
  %x274 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx73, i32 0, i32 6, !dbg !1097
  store i8 %conv71, i8* %x274, align 1, !dbg !1098
  %57 = load i32, i32* %y2, align 4, !dbg !1099
  %conv75 = trunc i32 %57 to i8, !dbg !1099
  %58 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangles.addr, align 8, !dbg !1100
  %59 = load %struct.Triangle_3D*, %struct.Triangle_3D** %58, align 8, !dbg !1101
  %60 = load i32, i32* %i, align 4, !dbg !1102
  %idxprom76 = sext i32 %60 to i64, !dbg !1103
  %arrayidx77 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %59, i64 %idxprom76, !dbg !1103
  %y278 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx77, i32 0, i32 7, !dbg !1104
  store i8 %conv75, i8* %y278, align 1, !dbg !1105
  %61 = load i32, i32* %z2, align 4, !dbg !1106
  %conv79 = trunc i32 %61 to i8, !dbg !1106
  %62 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangles.addr, align 8, !dbg !1107
  %63 = load %struct.Triangle_3D*, %struct.Triangle_3D** %62, align 8, !dbg !1108
  %64 = load i32, i32* %i, align 4, !dbg !1109
  %idxprom80 = sext i32 %64 to i64, !dbg !1110
  %arrayidx81 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %63, i64 %idxprom80, !dbg !1110
  %z282 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx81, i32 0, i32 8, !dbg !1111
  store i8 %conv79, i8* %z282, align 1, !dbg !1112
  br label %for.inc, !dbg !1113

for.inc:                                          ; preds = %invoke.cont46
  %65 = load i32, i32* %i, align 4, !dbg !1114
  %inc = add nsw i32 %65, 1, !dbg !1114
  store i32 %inc, i32* %i, align 4, !dbg !1114
  br label %for.cond, !dbg !1115, !llvm.loop !1116

for.end:                                          ; preds = %for.cond
  invoke void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE5closeEv(%"class.std::basic_ifstream"* %infile)
          to label %invoke.cont83 unwind label %lpad, !dbg !1118

invoke.cont83:                                    ; preds = %for.end
  call void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"* %infile) #3, !dbg !991
  ret void, !dbg !991

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !991
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !991
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !991
  %lpad.val84 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !991
  resume { i8*, i32 } %lpad.val84, !dbg !991
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #6

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"*, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* dereferenceable(272)) #1

declare void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEEC1EPKcSt13_Ios_Openmode(%"class.std::basic_ifstream"*, i8*, i32) unnamed_addr #1

declare zeroext i1 @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ifstream"*) #1

declare i32 @__gxx_personality_v0(...)

declare dereferenceable(280) %"class.std::basic_istream"* @_ZNSirsERi(%"class.std::basic_istream"*, i32* dereferenceable(4)) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #5

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #7

declare void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEE5closeEv(%"class.std::basic_ifstream"*) #1

; Function Attrs: nounwind
declare void @_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ifstream"*) unnamed_addr #2

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_utils.cpp() #0 section ".text.startup" !dbg !1119 {
entry:
  call void @__cxx_global_var_init(), !dbg !1121
  ret void
}

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable willreturn }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nobuiltin "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind }
attributes #9 = { builtin }

!llvm.dbg.cu = !{!28}
!llvm.module.flags = !{!920, !921, !922, !923}
!llvm.ident = !{!924}

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
!28 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !29, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !30, globals: !31, imports: !32)
!29 = !DIFile(filename: "../src/utils.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!30 = !{}
!31 = !{!0}
!32 = !{!33, !37, !56, !59, !64, !72, !80, !84, !91, !95, !99, !101, !103, !107, !119, !123, !129, !135, !137, !141, !145, !149, !153, !165, !167, !171, !175, !179, !181, !187, !191, !195, !197, !199, !203, !211, !215, !219, !223, !225, !231, !233, !240, !245, !249, !254, !258, !262, !266, !268, !270, !274, !278, !282, !284, !288, !292, !294, !296, !300, !306, !311, !316, !317, !318, !319, !320, !321, !322, !323, !324, !325, !326, !333, !337, !340, !343, !346, !348, !350, !352, !355, !358, !361, !364, !367, !369, !374, !378, !381, !384, !386, !388, !390, !392, !395, !398, !401, !404, !407, !409, !413, !417, !422, !428, !430, !432, !434, !436, !438, !440, !442, !444, !446, !448, !450, !452, !454, !458, !462, !468, !472, !477, !479, !483, !487, !491, !501, !505, !509, !513, !517, !521, !525, !529, !533, !537, !541, !545, !549, !551, !555, !559, !563, !569, !573, !577, !579, !583, !587, !593, !595, !599, !603, !607, !611, !615, !619, !623, !624, !625, !626, !628, !629, !630, !631, !632, !633, !634, !638, !644, !649, !653, !655, !657, !659, !661, !668, !672, !676, !680, !684, !688, !693, !697, !699, !703, !709, !713, !718, !720, !722, !726, !730, !732, !734, !736, !738, !742, !744, !746, !750, !754, !758, !762, !766, !770, !772, !776, !780, !784, !788, !790, !792, !796, !800, !801, !802, !803, !804, !805, !860, !864, !870, !873, !874, !876, !878, !880, !882, !886, !888, !890, !892, !894, !896, !898, !900, !902, !906, !910, !912, !916}
!33 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !34, entity: !35, file: !36, line: 58)
!34 = !DINamespace(name: "__gnu_debug", scope: null)
!35 = !DINamespace(name: "__debug", scope: !2)
!36 = !DIFile(filename: "/usr/include/c++/11/debug/debug.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!37 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !38, file: !55, line: 64)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !39, line: 6, baseType: !40)
!39 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !41, line: 21, baseType: !42)
!41 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!42 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !41, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !43, identifier: "_ZTS11__mbstate_t")
!43 = !{!44, !45}
!44 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !42, file: !41, line: 15, baseType: !11, size: 32)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !42, file: !41, line: 20, baseType: !46, size: 32, offset: 32)
!46 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !42, file: !41, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !47, identifier: "_ZTSN11__mbstate_tUt_E")
!47 = !{!48, !50}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !46, file: !41, line: 18, baseType: !49, size: 32)
!49 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !46, file: !41, line: 19, baseType: !51, size: 32)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 32, elements: !53)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !{!54}
!54 = !DISubrange(count: 4)
!55 = !DIFile(filename: "/usr/include/c++/11/cwchar", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!56 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !57, file: !55, line: 141)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !58, line: 20, baseType: !49)
!58 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !60, file: !55, line: 143)
!60 = !DISubprogram(name: "btowc", scope: !61, file: !61, line: 285, type: !62, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!61 = !DIFile(filename: "/usr/include/wchar.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!62 = !DISubroutineType(types: !63)
!63 = !{!57, !11}
!64 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !65, file: !55, line: 144)
!65 = !DISubprogram(name: "fgetwc", scope: !61, file: !61, line: 744, type: !66, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!66 = !DISubroutineType(types: !67)
!67 = !{!57, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !70, line: 5, baseType: !71)
!70 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!71 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !70, line: 4, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!72 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !73, file: !55, line: 145)
!73 = !DISubprogram(name: "fgetws", scope: !61, file: !61, line: 773, type: !74, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!74 = !DISubroutineType(types: !75)
!75 = !{!76, !78, !11, !79}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!78 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !76)
!79 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !68)
!80 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !81, file: !55, line: 146)
!81 = !DISubprogram(name: "fputwc", scope: !61, file: !61, line: 758, type: !82, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!82 = !DISubroutineType(types: !83)
!83 = !{!57, !77, !68}
!84 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !85, file: !55, line: 147)
!85 = !DISubprogram(name: "fputws", scope: !61, file: !61, line: 780, type: !86, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!86 = !DISubroutineType(types: !87)
!87 = !{!11, !88, !79}
!88 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !89)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !77)
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !92, file: !55, line: 148)
!92 = !DISubprogram(name: "fwide", scope: !61, file: !61, line: 588, type: !93, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!93 = !DISubroutineType(types: !94)
!94 = !{!11, !68, !11}
!95 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !96, file: !55, line: 149)
!96 = !DISubprogram(name: "fwprintf", scope: !61, file: !61, line: 595, type: !97, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!97 = !DISubroutineType(types: !98)
!98 = !{!11, !79, !88, null}
!99 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !100, file: !55, line: 150)
!100 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !61, file: !61, line: 657, type: !97, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !102, file: !55, line: 151)
!102 = !DISubprogram(name: "getwc", scope: !61, file: !61, line: 745, type: !66, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !104, file: !55, line: 152)
!104 = !DISubprogram(name: "getwchar", scope: !61, file: !61, line: 751, type: !105, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!105 = !DISubroutineType(types: !106)
!106 = !{!57}
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !108, file: !55, line: 153)
!108 = !DISubprogram(name: "mbrlen", scope: !61, file: !61, line: 308, type: !109, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!109 = !DISubroutineType(types: !110)
!110 = !{!111, !114, !111, !117}
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !112, line: 62, baseType: !113)
!112 = !DIFile(filename: "/home/gabriel/Documents/hls-llvm-project/hls-build/lib/clang/7.0.0/include/stddef.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!113 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!114 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !115)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !52)
!117 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !118)
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!119 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !120, file: !55, line: 154)
!120 = !DISubprogram(name: "mbrtowc", scope: !61, file: !61, line: 297, type: !121, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!121 = !DISubroutineType(types: !122)
!122 = !{!111, !78, !114, !111, !117}
!123 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !124, file: !55, line: 155)
!124 = !DISubprogram(name: "mbsinit", scope: !61, file: !61, line: 293, type: !125, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!125 = !DISubroutineType(types: !126)
!126 = !{!11, !127}
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !128, size: 64)
!128 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !38)
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !130, file: !55, line: 156)
!130 = !DISubprogram(name: "mbsrtowcs", scope: !61, file: !61, line: 338, type: !131, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DISubroutineType(types: !132)
!132 = !{!111, !78, !133, !111, !117}
!133 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !134)
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !136, file: !55, line: 157)
!136 = !DISubprogram(name: "putwc", scope: !61, file: !61, line: 759, type: !82, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !138, file: !55, line: 158)
!138 = !DISubprogram(name: "putwchar", scope: !61, file: !61, line: 765, type: !139, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!139 = !DISubroutineType(types: !140)
!140 = !{!57, !77}
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !142, file: !55, line: 160)
!142 = !DISubprogram(name: "swprintf", scope: !61, file: !61, line: 605, type: !143, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DISubroutineType(types: !144)
!144 = !{!11, !78, !111, !88, null}
!145 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !146, file: !55, line: 162)
!146 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !61, file: !61, line: 664, type: !147, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!147 = !DISubroutineType(types: !148)
!148 = !{!11, !88, !88, null}
!149 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !150, file: !55, line: 163)
!150 = !DISubprogram(name: "ungetwc", scope: !61, file: !61, line: 788, type: !151, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!151 = !DISubroutineType(types: !152)
!152 = !{!57, !57, !68}
!153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !154, file: !55, line: 164)
!154 = !DISubprogram(name: "vfwprintf", scope: !61, file: !61, line: 613, type: !155, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!155 = !DISubroutineType(types: !156)
!156 = !{!11, !79, !88, !157}
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64)
!158 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !29, size: 192, flags: DIFlagTypePassByValue, elements: !159, identifier: "_ZTS13__va_list_tag")
!159 = !{!160, !161, !162, !164}
!160 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !158, file: !29, baseType: !49, size: 32)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !158, file: !29, baseType: !49, size: 32, offset: 32)
!162 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !158, file: !29, baseType: !163, size: 64, offset: 64)
!163 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!164 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !158, file: !29, baseType: !163, size: 64, offset: 128)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !166, file: !55, line: 166)
!166 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !61, file: !61, line: 711, type: !155, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !168, file: !55, line: 169)
!168 = !DISubprogram(name: "vswprintf", scope: !61, file: !61, line: 626, type: !169, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!169 = !DISubroutineType(types: !170)
!170 = !{!11, !78, !111, !88, !157}
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !172, file: !55, line: 172)
!172 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !61, file: !61, line: 718, type: !173, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!173 = !DISubroutineType(types: !174)
!174 = !{!11, !88, !88, !157}
!175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !176, file: !55, line: 174)
!176 = !DISubprogram(name: "vwprintf", scope: !61, file: !61, line: 621, type: !177, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!177 = !DISubroutineType(types: !178)
!178 = !{!11, !88, !157}
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !180, file: !55, line: 176)
!180 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !61, file: !61, line: 715, type: !177, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !182, file: !55, line: 178)
!182 = !DISubprogram(name: "wcrtomb", scope: !61, file: !61, line: 302, type: !183, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!183 = !DISubroutineType(types: !184)
!184 = !{!111, !185, !77, !117}
!185 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !186)
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !188, file: !55, line: 179)
!188 = !DISubprogram(name: "wcscat", scope: !61, file: !61, line: 97, type: !189, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DISubroutineType(types: !190)
!190 = !{!76, !78, !88}
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !192, file: !55, line: 180)
!192 = !DISubprogram(name: "wcscmp", scope: !61, file: !61, line: 106, type: !193, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DISubroutineType(types: !194)
!194 = !{!11, !89, !89}
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !196, file: !55, line: 181)
!196 = !DISubprogram(name: "wcscoll", scope: !61, file: !61, line: 131, type: !193, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !198, file: !55, line: 182)
!198 = !DISubprogram(name: "wcscpy", scope: !61, file: !61, line: 87, type: !189, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!199 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !200, file: !55, line: 183)
!200 = !DISubprogram(name: "wcscspn", scope: !61, file: !61, line: 188, type: !201, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!201 = !DISubroutineType(types: !202)
!202 = !{!111, !89, !89}
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !204, file: !55, line: 184)
!204 = !DISubprogram(name: "wcsftime", scope: !61, file: !61, line: 852, type: !205, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DISubroutineType(types: !206)
!206 = !{!111, !78, !111, !88, !207}
!207 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !208)
!208 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !209, size: 64)
!209 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !210)
!210 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !61, line: 83, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !212, file: !55, line: 185)
!212 = !DISubprogram(name: "wcslen", scope: !61, file: !61, line: 223, type: !213, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!213 = !DISubroutineType(types: !214)
!214 = !{!111, !89}
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !216, file: !55, line: 186)
!216 = !DISubprogram(name: "wcsncat", scope: !61, file: !61, line: 101, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!217 = !DISubroutineType(types: !218)
!218 = !{!76, !78, !88, !111}
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !220, file: !55, line: 187)
!220 = !DISubprogram(name: "wcsncmp", scope: !61, file: !61, line: 109, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!221 = !DISubroutineType(types: !222)
!222 = !{!11, !89, !89, !111}
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !224, file: !55, line: 188)
!224 = !DISubprogram(name: "wcsncpy", scope: !61, file: !61, line: 92, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !226, file: !55, line: 189)
!226 = !DISubprogram(name: "wcsrtombs", scope: !61, file: !61, line: 344, type: !227, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DISubroutineType(types: !228)
!228 = !{!111, !185, !229, !111, !117}
!229 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !230)
!230 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !232, file: !55, line: 190)
!232 = !DISubprogram(name: "wcsspn", scope: !61, file: !61, line: 192, type: !201, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !234, file: !55, line: 191)
!234 = !DISubprogram(name: "wcstod", scope: !61, file: !61, line: 378, type: !235, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!235 = !DISubroutineType(types: !236)
!236 = !{!237, !88, !238}
!237 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!238 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !239)
!239 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !241, file: !55, line: 193)
!241 = !DISubprogram(name: "wcstof", scope: !61, file: !61, line: 383, type: !242, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!242 = !DISubroutineType(types: !243)
!243 = !{!244, !88, !238}
!244 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !246, file: !55, line: 195)
!246 = !DISubprogram(name: "wcstok", scope: !61, file: !61, line: 218, type: !247, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!247 = !DISubroutineType(types: !248)
!248 = !{!76, !78, !88, !238}
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !250, file: !55, line: 196)
!250 = !DISubprogram(name: "wcstol", scope: !61, file: !61, line: 429, type: !251, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!251 = !DISubroutineType(types: !252)
!252 = !{!253, !88, !238, !11}
!253 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !255, file: !55, line: 197)
!255 = !DISubprogram(name: "wcstoul", scope: !61, file: !61, line: 434, type: !256, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DISubroutineType(types: !257)
!257 = !{!113, !88, !238, !11}
!258 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !259, file: !55, line: 198)
!259 = !DISubprogram(name: "wcsxfrm", scope: !61, file: !61, line: 135, type: !260, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!260 = !DISubroutineType(types: !261)
!261 = !{!111, !78, !88, !111}
!262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !263, file: !55, line: 199)
!263 = !DISubprogram(name: "wctob", scope: !61, file: !61, line: 289, type: !264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!264 = !DISubroutineType(types: !265)
!265 = !{!11, !57}
!266 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !267, file: !55, line: 200)
!267 = !DISubprogram(name: "wmemcmp", scope: !61, file: !61, line: 259, type: !221, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !269, file: !55, line: 201)
!269 = !DISubprogram(name: "wmemcpy", scope: !61, file: !61, line: 263, type: !217, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!270 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !271, file: !55, line: 202)
!271 = !DISubprogram(name: "wmemmove", scope: !61, file: !61, line: 268, type: !272, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!272 = !DISubroutineType(types: !273)
!273 = !{!76, !76, !89, !111}
!274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !275, file: !55, line: 203)
!275 = !DISubprogram(name: "wmemset", scope: !61, file: !61, line: 272, type: !276, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!276 = !DISubroutineType(types: !277)
!277 = !{!76, !76, !77, !111}
!278 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !279, file: !55, line: 204)
!279 = !DISubprogram(name: "wprintf", scope: !61, file: !61, line: 602, type: !280, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!280 = !DISubroutineType(types: !281)
!281 = !{!11, !88, null}
!282 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !283, file: !55, line: 205)
!283 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !61, file: !61, line: 661, type: !280, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !285, file: !55, line: 206)
!285 = !DISubprogram(name: "wcschr", scope: !61, file: !61, line: 165, type: !286, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!286 = !DISubroutineType(types: !287)
!287 = !{!76, !89, !77}
!288 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !289, file: !55, line: 207)
!289 = !DISubprogram(name: "wcspbrk", scope: !61, file: !61, line: 202, type: !290, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!290 = !DISubroutineType(types: !291)
!291 = !{!76, !89, !89}
!292 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !293, file: !55, line: 208)
!293 = !DISubprogram(name: "wcsrchr", scope: !61, file: !61, line: 175, type: !286, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !295, file: !55, line: 209)
!295 = !DISubprogram(name: "wcsstr", scope: !61, file: !61, line: 213, type: !290, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!296 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !297, file: !55, line: 210)
!297 = !DISubprogram(name: "wmemchr", scope: !61, file: !61, line: 254, type: !298, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!298 = !DISubroutineType(types: !299)
!299 = !{!76, !89, !77, !111}
!300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !302, file: !55, line: 251)
!301 = !DINamespace(name: "__gnu_cxx", scope: null)
!302 = !DISubprogram(name: "wcstold", scope: !61, file: !61, line: 385, type: !303, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!303 = !DISubroutineType(types: !304)
!304 = !{!305, !88, !238}
!305 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !307, file: !55, line: 260)
!307 = !DISubprogram(name: "wcstoll", scope: !61, file: !61, line: 442, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DISubroutineType(types: !309)
!309 = !{!310, !88, !238, !11}
!310 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !312, file: !55, line: 261)
!312 = !DISubprogram(name: "wcstoull", scope: !61, file: !61, line: 449, type: !313, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!313 = !DISubroutineType(types: !314)
!314 = !{!315, !88, !238, !11}
!315 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !302, file: !55, line: 267)
!317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !307, file: !55, line: 268)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !312, file: !55, line: 269)
!319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !241, file: !55, line: 283)
!320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !166, file: !55, line: 286)
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !172, file: !55, line: 289)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !180, file: !55, line: 292)
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !302, file: !55, line: 296)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !307, file: !55, line: 297)
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !312, file: !55, line: 298)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !327, file: !332, line: 47)
!327 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !328, line: 24, baseType: !329)
!328 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!329 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !330, line: 37, baseType: !331)
!330 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!331 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!332 = !DIFile(filename: "/usr/include/c++/11/cstdint", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !334, file: !332, line: 48)
!334 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !328, line: 25, baseType: !335)
!335 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !330, line: 39, baseType: !336)
!336 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !338, file: !332, line: 49)
!338 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !328, line: 26, baseType: !339)
!339 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !330, line: 41, baseType: !11)
!340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !341, file: !332, line: 50)
!341 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !328, line: 27, baseType: !342)
!342 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !330, line: 44, baseType: !253)
!343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !344, file: !332, line: 52)
!344 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !345, line: 58, baseType: !331)
!345 = !DIFile(filename: "/usr/include/stdint.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!346 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !347, file: !332, line: 53)
!347 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !345, line: 60, baseType: !253)
!348 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !349, file: !332, line: 54)
!349 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !345, line: 61, baseType: !253)
!350 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !351, file: !332, line: 55)
!351 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !345, line: 62, baseType: !253)
!352 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !353, file: !332, line: 57)
!353 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !345, line: 43, baseType: !354)
!354 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !330, line: 52, baseType: !329)
!355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !356, file: !332, line: 58)
!356 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !345, line: 44, baseType: !357)
!357 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !330, line: 54, baseType: !335)
!358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !359, file: !332, line: 59)
!359 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !345, line: 45, baseType: !360)
!360 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !330, line: 56, baseType: !339)
!361 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !362, file: !332, line: 60)
!362 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !345, line: 46, baseType: !363)
!363 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !330, line: 58, baseType: !342)
!364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !365, file: !332, line: 62)
!365 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !345, line: 101, baseType: !366)
!366 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !330, line: 72, baseType: !253)
!367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !368, file: !332, line: 63)
!368 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !345, line: 87, baseType: !253)
!369 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !370, file: !332, line: 65)
!370 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !371, line: 24, baseType: !372)
!371 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!372 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !330, line: 38, baseType: !373)
!373 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !375, file: !332, line: 66)
!375 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !371, line: 25, baseType: !376)
!376 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !330, line: 40, baseType: !377)
!377 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !379, file: !332, line: 67)
!379 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !371, line: 26, baseType: !380)
!380 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !330, line: 42, baseType: !49)
!381 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !382, file: !332, line: 68)
!382 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !371, line: 27, baseType: !383)
!383 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !330, line: 45, baseType: !113)
!384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !385, file: !332, line: 70)
!385 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !345, line: 71, baseType: !373)
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !387, file: !332, line: 71)
!387 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !345, line: 73, baseType: !113)
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !389, file: !332, line: 72)
!389 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !345, line: 74, baseType: !113)
!390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !391, file: !332, line: 73)
!391 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !345, line: 75, baseType: !113)
!392 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !393, file: !332, line: 75)
!393 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !345, line: 49, baseType: !394)
!394 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !330, line: 53, baseType: !372)
!395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !396, file: !332, line: 76)
!396 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !345, line: 50, baseType: !397)
!397 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !330, line: 55, baseType: !376)
!398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !399, file: !332, line: 77)
!399 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !345, line: 51, baseType: !400)
!400 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !330, line: 57, baseType: !380)
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !402, file: !332, line: 78)
!402 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !345, line: 52, baseType: !403)
!403 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !330, line: 59, baseType: !383)
!404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !405, file: !332, line: 80)
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !345, line: 102, baseType: !406)
!406 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !330, line: 73, baseType: !113)
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !408, file: !332, line: 81)
!408 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !345, line: 90, baseType: !113)
!409 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !410, file: !412, line: 53)
!410 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !411, line: 51, size: 768, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!411 = !DIFile(filename: "/usr/include/locale.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!412 = !DIFile(filename: "/usr/include/c++/11/clocale", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !414, file: !412, line: 54)
!414 = !DISubprogram(name: "setlocale", scope: !411, file: !411, line: 122, type: !415, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!415 = !DISubroutineType(types: !416)
!416 = !{!186, !11, !115}
!417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !418, file: !412, line: 55)
!418 = !DISubprogram(name: "localeconv", scope: !411, file: !411, line: 125, type: !419, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!419 = !DISubroutineType(types: !420)
!420 = !{!421}
!421 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !410, size: 64)
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !423, file: !427, line: 64)
!423 = !DISubprogram(name: "isalnum", scope: !424, file: !424, line: 108, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!424 = !DIFile(filename: "/usr/include/ctype.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!425 = !DISubroutineType(types: !426)
!426 = !{!11, !11}
!427 = !DIFile(filename: "/usr/include/c++/11/cctype", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !429, file: !427, line: 65)
!429 = !DISubprogram(name: "isalpha", scope: !424, file: !424, line: 109, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!430 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !431, file: !427, line: 66)
!431 = !DISubprogram(name: "iscntrl", scope: !424, file: !424, line: 110, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !433, file: !427, line: 67)
!433 = !DISubprogram(name: "isdigit", scope: !424, file: !424, line: 111, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !435, file: !427, line: 68)
!435 = !DISubprogram(name: "isgraph", scope: !424, file: !424, line: 113, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!436 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !437, file: !427, line: 69)
!437 = !DISubprogram(name: "islower", scope: !424, file: !424, line: 112, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !439, file: !427, line: 70)
!439 = !DISubprogram(name: "isprint", scope: !424, file: !424, line: 114, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!440 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !441, file: !427, line: 71)
!441 = !DISubprogram(name: "ispunct", scope: !424, file: !424, line: 115, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !443, file: !427, line: 72)
!443 = !DISubprogram(name: "isspace", scope: !424, file: !424, line: 116, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !445, file: !427, line: 73)
!445 = !DISubprogram(name: "isupper", scope: !424, file: !424, line: 117, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !447, file: !427, line: 74)
!447 = !DISubprogram(name: "isxdigit", scope: !424, file: !424, line: 118, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !449, file: !427, line: 75)
!449 = !DISubprogram(name: "tolower", scope: !424, file: !424, line: 122, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !451, file: !427, line: 76)
!451 = !DISubprogram(name: "toupper", scope: !424, file: !424, line: 125, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !453, file: !427, line: 87)
!453 = !DISubprogram(name: "isblank", scope: !424, file: !424, line: 130, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !455, file: !457, line: 52)
!455 = !DISubprogram(name: "abs", scope: !456, file: !456, line: 848, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!456 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!457 = !DIFile(filename: "/usr/include/c++/11/bits/std_abs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !459, file: !461, line: 127)
!459 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !456, line: 63, baseType: !460)
!460 = !DICompositeType(tag: DW_TAG_structure_type, file: !456, line: 59, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!461 = !DIFile(filename: "/usr/include/c++/11/cstdlib", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !463, file: !461, line: 128)
!463 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !456, line: 71, baseType: !464)
!464 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !456, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !465, identifier: "_ZTS6ldiv_t")
!465 = !{!466, !467}
!466 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !464, file: !456, line: 69, baseType: !253, size: 64)
!467 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !464, file: !456, line: 70, baseType: !253, size: 64, offset: 64)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !469, file: !461, line: 130)
!469 = !DISubprogram(name: "abort", scope: !456, file: !456, line: 598, type: !470, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!470 = !DISubroutineType(types: !471)
!471 = !{null}
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !473, file: !461, line: 134)
!473 = !DISubprogram(name: "atexit", scope: !456, file: !456, line: 602, type: !474, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!474 = !DISubroutineType(types: !475)
!475 = !{!11, !476}
!476 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !470, size: 64)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !478, file: !461, line: 137)
!478 = !DISubprogram(name: "at_quick_exit", scope: !456, file: !456, line: 607, type: !474, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !480, file: !461, line: 140)
!480 = !DISubprogram(name: "atof", scope: !456, file: !456, line: 102, type: !481, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!481 = !DISubroutineType(types: !482)
!482 = !{!237, !115}
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !484, file: !461, line: 141)
!484 = !DISubprogram(name: "atoi", scope: !456, file: !456, line: 105, type: !485, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!485 = !DISubroutineType(types: !486)
!486 = !{!11, !115}
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !488, file: !461, line: 142)
!488 = !DISubprogram(name: "atol", scope: !456, file: !456, line: 108, type: !489, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!489 = !DISubroutineType(types: !490)
!490 = !{!253, !115}
!491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !492, file: !461, line: 143)
!492 = !DISubprogram(name: "bsearch", scope: !456, file: !456, line: 828, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!493 = !DISubroutineType(types: !494)
!494 = !{!163, !495, !495, !111, !111, !497}
!495 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !496, size: 64)
!496 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!497 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !456, line: 816, baseType: !498)
!498 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !499, size: 64)
!499 = !DISubroutineType(types: !500)
!500 = !{!11, !495, !495}
!501 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !502, file: !461, line: 144)
!502 = !DISubprogram(name: "calloc", scope: !456, file: !456, line: 543, type: !503, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!503 = !DISubroutineType(types: !504)
!504 = !{!163, !111, !111}
!505 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !506, file: !461, line: 145)
!506 = !DISubprogram(name: "div", scope: !456, file: !456, line: 860, type: !507, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!507 = !DISubroutineType(types: !508)
!508 = !{!459, !11, !11}
!509 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !510, file: !461, line: 146)
!510 = !DISubprogram(name: "exit", scope: !456, file: !456, line: 624, type: !511, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!511 = !DISubroutineType(types: !512)
!512 = !{null, !11}
!513 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !514, file: !461, line: 147)
!514 = !DISubprogram(name: "free", scope: !456, file: !456, line: 555, type: !515, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!515 = !DISubroutineType(types: !516)
!516 = !{null, !163}
!517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !518, file: !461, line: 148)
!518 = !DISubprogram(name: "getenv", scope: !456, file: !456, line: 641, type: !519, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!519 = !DISubroutineType(types: !520)
!520 = !{!186, !115}
!521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !522, file: !461, line: 149)
!522 = !DISubprogram(name: "labs", scope: !456, file: !456, line: 849, type: !523, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!523 = !DISubroutineType(types: !524)
!524 = !{!253, !253}
!525 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !526, file: !461, line: 150)
!526 = !DISubprogram(name: "ldiv", scope: !456, file: !456, line: 862, type: !527, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!527 = !DISubroutineType(types: !528)
!528 = !{!463, !253, !253}
!529 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !530, file: !461, line: 151)
!530 = !DISubprogram(name: "malloc", scope: !456, file: !456, line: 540, type: !531, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!531 = !DISubroutineType(types: !532)
!532 = !{!163, !111}
!533 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !534, file: !461, line: 153)
!534 = !DISubprogram(name: "mblen", scope: !456, file: !456, line: 930, type: !535, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!535 = !DISubroutineType(types: !536)
!536 = !{!11, !115, !111}
!537 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !538, file: !461, line: 154)
!538 = !DISubprogram(name: "mbstowcs", scope: !456, file: !456, line: 941, type: !539, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!539 = !DISubroutineType(types: !540)
!540 = !{!111, !78, !114, !111}
!541 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !542, file: !461, line: 155)
!542 = !DISubprogram(name: "mbtowc", scope: !456, file: !456, line: 933, type: !543, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!543 = !DISubroutineType(types: !544)
!544 = !{!11, !78, !114, !111}
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !546, file: !461, line: 157)
!546 = !DISubprogram(name: "qsort", scope: !456, file: !456, line: 838, type: !547, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!547 = !DISubroutineType(types: !548)
!548 = !{null, !163, !111, !111, !497}
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !550, file: !461, line: 160)
!550 = !DISubprogram(name: "quick_exit", scope: !456, file: !456, line: 630, type: !511, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !552, file: !461, line: 163)
!552 = !DISubprogram(name: "rand", scope: !456, file: !456, line: 454, type: !553, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!553 = !DISubroutineType(types: !554)
!554 = !{!11}
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !556, file: !461, line: 164)
!556 = !DISubprogram(name: "realloc", scope: !456, file: !456, line: 551, type: !557, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!557 = !DISubroutineType(types: !558)
!558 = !{!163, !163, !111}
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !560, file: !461, line: 165)
!560 = !DISubprogram(name: "srand", scope: !456, file: !456, line: 456, type: !561, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!561 = !DISubroutineType(types: !562)
!562 = !{null, !49}
!563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !564, file: !461, line: 166)
!564 = !DISubprogram(name: "strtod", scope: !456, file: !456, line: 118, type: !565, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!565 = !DISubroutineType(types: !566)
!566 = !{!237, !114, !567}
!567 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !568)
!568 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !570, file: !461, line: 167)
!570 = !DISubprogram(name: "strtol", scope: !456, file: !456, line: 177, type: !571, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !DISubroutineType(types: !572)
!572 = !{!253, !114, !567, !11}
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !574, file: !461, line: 168)
!574 = !DISubprogram(name: "strtoul", scope: !456, file: !456, line: 181, type: !575, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!575 = !DISubroutineType(types: !576)
!576 = !{!113, !114, !567, !11}
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !578, file: !461, line: 169)
!578 = !DISubprogram(name: "system", scope: !456, file: !456, line: 791, type: !485, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !580, file: !461, line: 171)
!580 = !DISubprogram(name: "wcstombs", scope: !456, file: !456, line: 945, type: !581, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!581 = !DISubroutineType(types: !582)
!582 = !{!111, !185, !88, !111}
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !584, file: !461, line: 172)
!584 = !DISubprogram(name: "wctomb", scope: !456, file: !456, line: 937, type: !585, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!585 = !DISubroutineType(types: !586)
!586 = !{!11, !186, !77}
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !588, file: !461, line: 200)
!588 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !456, line: 81, baseType: !589)
!589 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !456, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !590, identifier: "_ZTS7lldiv_t")
!590 = !{!591, !592}
!591 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !589, file: !456, line: 79, baseType: !310, size: 64)
!592 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !589, file: !456, line: 80, baseType: !310, size: 64, offset: 64)
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !594, file: !461, line: 206)
!594 = !DISubprogram(name: "_Exit", scope: !456, file: !456, line: 636, type: !511, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !596, file: !461, line: 210)
!596 = !DISubprogram(name: "llabs", scope: !456, file: !456, line: 852, type: !597, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!597 = !DISubroutineType(types: !598)
!598 = !{!310, !310}
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !600, file: !461, line: 216)
!600 = !DISubprogram(name: "lldiv", scope: !456, file: !456, line: 866, type: !601, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!601 = !DISubroutineType(types: !602)
!602 = !{!588, !310, !310}
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !604, file: !461, line: 227)
!604 = !DISubprogram(name: "atoll", scope: !456, file: !456, line: 113, type: !605, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!605 = !DISubroutineType(types: !606)
!606 = !{!310, !115}
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !608, file: !461, line: 228)
!608 = !DISubprogram(name: "strtoll", scope: !456, file: !456, line: 201, type: !609, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!609 = !DISubroutineType(types: !610)
!610 = !{!310, !114, !567, !11}
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !612, file: !461, line: 229)
!612 = !DISubprogram(name: "strtoull", scope: !456, file: !456, line: 206, type: !613, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!613 = !DISubroutineType(types: !614)
!614 = !{!315, !114, !567, !11}
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !616, file: !461, line: 231)
!616 = !DISubprogram(name: "strtof", scope: !456, file: !456, line: 124, type: !617, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!617 = !DISubroutineType(types: !618)
!618 = !{!244, !114, !567}
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !620, file: !461, line: 232)
!620 = !DISubprogram(name: "strtold", scope: !456, file: !456, line: 127, type: !621, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!621 = !DISubroutineType(types: !622)
!622 = !{!305, !114, !567}
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !588, file: !461, line: 240)
!624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !594, file: !461, line: 242)
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !596, file: !461, line: 244)
!626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !627, file: !461, line: 245)
!627 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !301, file: !461, line: 213, type: !601, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !600, file: !461, line: 246)
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !604, file: !461, line: 248)
!630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !616, file: !461, line: 249)
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !608, file: !461, line: 250)
!632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !612, file: !461, line: 251)
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !620, file: !461, line: 252)
!634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !635, file: !637, line: 98)
!635 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !636, line: 7, baseType: !71)
!636 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!637 = !DIFile(filename: "/usr/include/c++/11/cstdio", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!638 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !639, file: !637, line: 99)
!639 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !640, line: 84, baseType: !641)
!640 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!641 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !642, line: 14, baseType: !643)
!642 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!643 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !642, line: 10, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !645, file: !637, line: 101)
!645 = !DISubprogram(name: "clearerr", scope: !640, file: !640, line: 786, type: !646, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!646 = !DISubroutineType(types: !647)
!647 = !{null, !648}
!648 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !635, size: 64)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !650, file: !637, line: 102)
!650 = !DISubprogram(name: "fclose", scope: !640, file: !640, line: 178, type: !651, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!651 = !DISubroutineType(types: !652)
!652 = !{!11, !648}
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !654, file: !637, line: 103)
!654 = !DISubprogram(name: "feof", scope: !640, file: !640, line: 788, type: !651, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !656, file: !637, line: 104)
!656 = !DISubprogram(name: "ferror", scope: !640, file: !640, line: 790, type: !651, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !658, file: !637, line: 105)
!658 = !DISubprogram(name: "fflush", scope: !640, file: !640, line: 230, type: !651, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!659 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !660, file: !637, line: 106)
!660 = !DISubprogram(name: "fgetc", scope: !640, file: !640, line: 513, type: !651, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !662, file: !637, line: 107)
!662 = !DISubprogram(name: "fgetpos", scope: !640, file: !640, line: 760, type: !663, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!663 = !DISubroutineType(types: !664)
!664 = !{!11, !665, !666}
!665 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !648)
!666 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !667)
!667 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !639, size: 64)
!668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !669, file: !637, line: 108)
!669 = !DISubprogram(name: "fgets", scope: !640, file: !640, line: 592, type: !670, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!670 = !DISubroutineType(types: !671)
!671 = !{!186, !185, !11, !665}
!672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !673, file: !637, line: 109)
!673 = !DISubprogram(name: "fopen", scope: !640, file: !640, line: 258, type: !674, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!674 = !DISubroutineType(types: !675)
!675 = !{!648, !114, !114}
!676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !677, file: !637, line: 110)
!677 = !DISubprogram(name: "fprintf", scope: !640, file: !640, line: 350, type: !678, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!678 = !DISubroutineType(types: !679)
!679 = !{!11, !665, !114, null}
!680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !681, file: !637, line: 111)
!681 = !DISubprogram(name: "fputc", scope: !640, file: !640, line: 549, type: !682, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!682 = !DISubroutineType(types: !683)
!683 = !{!11, !11, !648}
!684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !685, file: !637, line: 112)
!685 = !DISubprogram(name: "fputs", scope: !640, file: !640, line: 655, type: !686, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!686 = !DISubroutineType(types: !687)
!687 = !{!11, !114, !665}
!688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !689, file: !637, line: 113)
!689 = !DISubprogram(name: "fread", scope: !640, file: !640, line: 675, type: !690, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!690 = !DISubroutineType(types: !691)
!691 = !{!111, !692, !111, !111, !665}
!692 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !163)
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !694, file: !637, line: 114)
!694 = !DISubprogram(name: "freopen", scope: !640, file: !640, line: 265, type: !695, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!695 = !DISubroutineType(types: !696)
!696 = !{!648, !114, !114, !665}
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !698, file: !637, line: 115)
!698 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !640, file: !640, line: 434, type: !678, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !700, file: !637, line: 116)
!700 = !DISubprogram(name: "fseek", scope: !640, file: !640, line: 713, type: !701, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!701 = !DISubroutineType(types: !702)
!702 = !{!11, !648, !253, !11}
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !704, file: !637, line: 117)
!704 = !DISubprogram(name: "fsetpos", scope: !640, file: !640, line: 765, type: !705, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!705 = !DISubroutineType(types: !706)
!706 = !{!11, !648, !707}
!707 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !708, size: 64)
!708 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !639)
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !710, file: !637, line: 118)
!710 = !DISubprogram(name: "ftell", scope: !640, file: !640, line: 718, type: !711, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!711 = !DISubroutineType(types: !712)
!712 = !{!253, !648}
!713 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !714, file: !637, line: 119)
!714 = !DISubprogram(name: "fwrite", scope: !640, file: !640, line: 681, type: !715, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!715 = !DISubroutineType(types: !716)
!716 = !{!111, !717, !111, !111, !665}
!717 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !495)
!718 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !719, file: !637, line: 120)
!719 = !DISubprogram(name: "getc", scope: !640, file: !640, line: 514, type: !651, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !721, file: !637, line: 121)
!721 = !DISubprogram(name: "getchar", scope: !640, file: !640, line: 520, type: !553, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !723, file: !637, line: 126)
!723 = !DISubprogram(name: "perror", scope: !640, file: !640, line: 804, type: !724, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!724 = !DISubroutineType(types: !725)
!725 = !{null, !115}
!726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !727, file: !637, line: 127)
!727 = !DISubprogram(name: "printf", scope: !640, file: !640, line: 356, type: !728, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!728 = !DISubroutineType(types: !729)
!729 = !{!11, !114, null}
!730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !731, file: !637, line: 128)
!731 = !DISubprogram(name: "putc", scope: !640, file: !640, line: 550, type: !682, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !733, file: !637, line: 129)
!733 = !DISubprogram(name: "putchar", scope: !640, file: !640, line: 556, type: !425, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !735, file: !637, line: 130)
!735 = !DISubprogram(name: "puts", scope: !640, file: !640, line: 661, type: !485, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !737, file: !637, line: 131)
!737 = !DISubprogram(name: "remove", scope: !640, file: !640, line: 152, type: !485, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !739, file: !637, line: 132)
!739 = !DISubprogram(name: "rename", scope: !640, file: !640, line: 154, type: !740, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!740 = !DISubroutineType(types: !741)
!741 = !{!11, !115, !115}
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !743, file: !637, line: 133)
!743 = !DISubprogram(name: "rewind", scope: !640, file: !640, line: 723, type: !646, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !745, file: !637, line: 134)
!745 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !640, file: !640, line: 437, type: !728, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !747, file: !637, line: 135)
!747 = !DISubprogram(name: "setbuf", scope: !640, file: !640, line: 328, type: !748, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!748 = !DISubroutineType(types: !749)
!749 = !{null, !665, !185}
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !751, file: !637, line: 136)
!751 = !DISubprogram(name: "setvbuf", scope: !640, file: !640, line: 332, type: !752, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!752 = !DISubroutineType(types: !753)
!753 = !{!11, !665, !185, !11, !111}
!754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !755, file: !637, line: 137)
!755 = !DISubprogram(name: "sprintf", scope: !640, file: !640, line: 358, type: !756, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!756 = !DISubroutineType(types: !757)
!757 = !{!11, !185, !114, null}
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !759, file: !637, line: 138)
!759 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !640, file: !640, line: 439, type: !760, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!760 = !DISubroutineType(types: !761)
!761 = !{!11, !114, !114, null}
!762 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !763, file: !637, line: 139)
!763 = !DISubprogram(name: "tmpfile", scope: !640, file: !640, line: 188, type: !764, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!764 = !DISubroutineType(types: !765)
!765 = !{!648}
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !767, file: !637, line: 141)
!767 = !DISubprogram(name: "tmpnam", scope: !640, file: !640, line: 205, type: !768, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!768 = !DISubroutineType(types: !769)
!769 = !{!186, !186}
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !771, file: !637, line: 143)
!771 = !DISubprogram(name: "ungetc", scope: !640, file: !640, line: 668, type: !682, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!772 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !773, file: !637, line: 144)
!773 = !DISubprogram(name: "vfprintf", scope: !640, file: !640, line: 365, type: !774, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!774 = !DISubroutineType(types: !775)
!775 = !{!11, !665, !114, !157}
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !777, file: !637, line: 145)
!777 = !DISubprogram(name: "vprintf", scope: !640, file: !640, line: 371, type: !778, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!778 = !DISubroutineType(types: !779)
!779 = !{!11, !114, !157}
!780 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !781, file: !637, line: 146)
!781 = !DISubprogram(name: "vsprintf", scope: !640, file: !640, line: 373, type: !782, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!782 = !DISubroutineType(types: !783)
!783 = !{!11, !185, !114, !157}
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !785, file: !637, line: 175)
!785 = !DISubprogram(name: "snprintf", scope: !640, file: !640, line: 378, type: !786, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!786 = !DISubroutineType(types: !787)
!787 = !{!11, !185, !111, !114, null}
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !789, file: !637, line: 176)
!789 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !640, file: !640, line: 479, type: !774, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !791, file: !637, line: 177)
!791 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !640, file: !640, line: 484, type: !778, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !793, file: !637, line: 178)
!793 = !DISubprogram(name: "vsnprintf", scope: !640, file: !640, line: 382, type: !794, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!794 = !DISubroutineType(types: !795)
!795 = !{!11, !185, !111, !114, !157}
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !301, entity: !797, file: !637, line: 179)
!797 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !640, file: !640, line: 487, type: !798, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!798 = !DISubroutineType(types: !799)
!799 = !{!11, !114, !114, !157}
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !785, file: !637, line: 185)
!801 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !789, file: !637, line: 186)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !791, file: !637, line: 187)
!803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !793, file: !637, line: 188)
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !797, file: !637, line: 189)
!805 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !806, file: !807, line: 68)
!806 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !808, file: !807, line: 90, size: 64, flags: DIFlagTypePassByReference, elements: !809, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!807 = !DIFile(filename: "/usr/include/c++/11/bits/exception_ptr.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!808 = !DINamespace(name: "__exception_ptr", scope: !2)
!809 = !{!810, !811, !815, !818, !819, !824, !825, !829, !835, !839, !843, !846, !847, !850, !853}
!810 = !DIDerivedType(tag: DW_TAG_member, name: "_M_exception_object", scope: !806, file: !807, line: 92, baseType: !163, size: 64)
!811 = !DISubprogram(name: "exception_ptr", scope: !806, file: !807, line: 94, type: !812, isLocal: false, isDefinition: false, scopeLine: 94, flags: DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!812 = !DISubroutineType(types: !813)
!813 = !{null, !814, !163}
!814 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !806, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!815 = !DISubprogram(name: "_M_addref", linkageName: "_ZNSt15__exception_ptr13exception_ptr9_M_addrefEv", scope: !806, file: !807, line: 96, type: !816, isLocal: false, isDefinition: false, scopeLine: 96, flags: DIFlagPrototyped, isOptimized: false)
!816 = !DISubroutineType(types: !817)
!817 = !{null, !814}
!818 = !DISubprogram(name: "_M_release", linkageName: "_ZNSt15__exception_ptr13exception_ptr10_M_releaseEv", scope: !806, file: !807, line: 97, type: !816, isLocal: false, isDefinition: false, scopeLine: 97, flags: DIFlagPrototyped, isOptimized: false)
!819 = !DISubprogram(name: "_M_get", linkageName: "_ZNKSt15__exception_ptr13exception_ptr6_M_getEv", scope: !806, file: !807, line: 99, type: !820, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPrototyped, isOptimized: false)
!820 = !DISubroutineType(types: !821)
!821 = !{!163, !822}
!822 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !823, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!823 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !806)
!824 = !DISubprogram(name: "exception_ptr", scope: !806, file: !807, line: 107, type: !816, isLocal: false, isDefinition: false, scopeLine: 107, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!825 = !DISubprogram(name: "exception_ptr", scope: !806, file: !807, line: 109, type: !826, isLocal: false, isDefinition: false, scopeLine: 109, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!826 = !DISubroutineType(types: !827)
!827 = !{null, !814, !828}
!828 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !823, size: 64)
!829 = !DISubprogram(name: "exception_ptr", scope: !806, file: !807, line: 112, type: !830, isLocal: false, isDefinition: false, scopeLine: 112, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!830 = !DISubroutineType(types: !831)
!831 = !{null, !814, !832}
!832 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !2, file: !833, line: 302, baseType: !834)
!833 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/c++config.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!834 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!835 = !DISubprogram(name: "exception_ptr", scope: !806, file: !807, line: 116, type: !836, isLocal: false, isDefinition: false, scopeLine: 116, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!836 = !DISubroutineType(types: !837)
!837 = !{null, !814, !838}
!838 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !806, size: 64)
!839 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSERKS0_", scope: !806, file: !807, line: 129, type: !840, isLocal: false, isDefinition: false, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!840 = !DISubroutineType(types: !841)
!841 = !{!842, !814, !828}
!842 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !806, size: 64)
!843 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSEOS0_", scope: !806, file: !807, line: 133, type: !844, isLocal: false, isDefinition: false, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!844 = !DISubroutineType(types: !845)
!845 = !{!842, !814, !838}
!846 = !DISubprogram(name: "~exception_ptr", scope: !806, file: !807, line: 140, type: !816, isLocal: false, isDefinition: false, scopeLine: 140, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!847 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr13exception_ptr4swapERS0_", scope: !806, file: !807, line: 143, type: !848, isLocal: false, isDefinition: false, scopeLine: 143, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!848 = !DISubroutineType(types: !849)
!849 = !{null, !814, !842}
!850 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt15__exception_ptr13exception_ptrcvbEv", scope: !806, file: !807, line: 155, type: !851, isLocal: false, isDefinition: false, scopeLine: 155, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!851 = !DISubroutineType(types: !852)
!852 = !{!13, !822}
!853 = !DISubprogram(name: "__cxa_exception_type", linkageName: "_ZNKSt15__exception_ptr13exception_ptr20__cxa_exception_typeEv", scope: !806, file: !807, line: 176, type: !854, isLocal: false, isDefinition: false, scopeLine: 176, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!854 = !DISubroutineType(types: !855)
!855 = !{!856, !822}
!856 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !857, size: 64)
!857 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !858)
!858 = !DICompositeType(tag: DW_TAG_class_type, name: "type_info", scope: !2, file: !859, line: 88, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt9type_info")
!859 = !DIFile(filename: "/usr/include/c++/11/typeinfo", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !808, entity: !861, file: !807, line: 84)
!861 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !2, file: !807, line: 80, type: !862, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!862 = !DISubroutineType(types: !863)
!863 = !{null, !806}
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !865, file: !869, line: 82)
!865 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !866, line: 48, baseType: !867)
!866 = !DIFile(filename: "/usr/include/wctype.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!867 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !868, size: 64)
!868 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !339)
!869 = !DIFile(filename: "/usr/include/c++/11/cwctype", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !871, file: !869, line: 83)
!871 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !872, line: 38, baseType: !113)
!872 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !57, file: !869, line: 84)
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !875, file: !869, line: 86)
!875 = !DISubprogram(name: "iswalnum", scope: !872, file: !872, line: 95, type: !264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !877, file: !869, line: 87)
!877 = !DISubprogram(name: "iswalpha", scope: !872, file: !872, line: 101, type: !264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!878 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !879, file: !869, line: 89)
!879 = !DISubprogram(name: "iswblank", scope: !872, file: !872, line: 146, type: !264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!880 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !881, file: !869, line: 91)
!881 = !DISubprogram(name: "iswcntrl", scope: !872, file: !872, line: 104, type: !264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !883, file: !869, line: 92)
!883 = !DISubprogram(name: "iswctype", scope: !872, file: !872, line: 159, type: !884, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!884 = !DISubroutineType(types: !885)
!885 = !{!11, !57, !871}
!886 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !887, file: !869, line: 93)
!887 = !DISubprogram(name: "iswdigit", scope: !872, file: !872, line: 108, type: !264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!888 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !889, file: !869, line: 94)
!889 = !DISubprogram(name: "iswgraph", scope: !872, file: !872, line: 112, type: !264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!890 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !891, file: !869, line: 95)
!891 = !DISubprogram(name: "iswlower", scope: !872, file: !872, line: 117, type: !264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !893, file: !869, line: 96)
!893 = !DISubprogram(name: "iswprint", scope: !872, file: !872, line: 120, type: !264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!894 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !895, file: !869, line: 97)
!895 = !DISubprogram(name: "iswpunct", scope: !872, file: !872, line: 125, type: !264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !897, file: !869, line: 98)
!897 = !DISubprogram(name: "iswspace", scope: !872, file: !872, line: 130, type: !264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!898 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !899, file: !869, line: 99)
!899 = !DISubprogram(name: "iswupper", scope: !872, file: !872, line: 135, type: !264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!900 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !901, file: !869, line: 100)
!901 = !DISubprogram(name: "iswxdigit", scope: !872, file: !872, line: 140, type: !264, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!902 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !903, file: !869, line: 101)
!903 = !DISubprogram(name: "towctrans", scope: !866, file: !866, line: 55, type: !904, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!904 = !DISubroutineType(types: !905)
!905 = !{!57, !57, !865}
!906 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !907, file: !869, line: 102)
!907 = !DISubprogram(name: "towlower", scope: !872, file: !872, line: 166, type: !908, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!908 = !DISubroutineType(types: !909)
!909 = !{!57, !57}
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !911, file: !869, line: 103)
!911 = !DISubprogram(name: "towupper", scope: !872, file: !872, line: 169, type: !908, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !913, file: !869, line: 104)
!913 = !DISubprogram(name: "wctrans", scope: !866, file: !866, line: 52, type: !914, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!914 = !DISubroutineType(types: !915)
!915 = !{!865, !115}
!916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !917, file: !869, line: 105)
!917 = !DISubprogram(name: "wctype", scope: !872, file: !872, line: 155, type: !918, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!918 = !DISubroutineType(types: !919)
!919 = !{!871, !115}
!920 = !{i32 2, !"Dwarf Version", i32 4}
!921 = !{i32 2, !"Debug Info Version", i32 3}
!922 = !{i32 1, !"wchar_size", i32 4}
!923 = !{i32 7, !"PIC Level", i32 2}
!924 = !{!"clang version 7.0.0 "}
!925 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !3, file: !3, line: 74, type: !470, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!926 = !DILocation(line: 74, column: 25, scope: !925)
!927 = distinct !DISubprogram(name: "print_usage", linkageName: "_Z11print_usagePc", scope: !29, file: !29, line: 20, type: !928, isLocal: false, isDefinition: true, scopeLine: 21, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!928 = !DISubroutineType(types: !929)
!929 = !{null, !186}
!930 = !DILocalVariable(name: "filename", arg: 1, scope: !927, file: !29, line: 20, type: !186)
!931 = !DILocation(line: 20, column: 24, scope: !927)
!932 = !DILocation(line: 22, column: 46, scope: !927)
!933 = !DILocation(line: 22, column: 3, scope: !927)
!934 = !DILocation(line: 23, column: 1, scope: !927)
!935 = distinct !DISubprogram(name: "parse_command_line_args", linkageName: "_Z23parse_command_line_argsiPPcRiPP11Triangle_3D", scope: !29, file: !29, line: 25, type: !936, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!936 = !DISubroutineType(types: !937)
!937 = !{null, !11, !568, !938, !939}
!938 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !11, size: 64)
!939 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !940, size: 64)
!940 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !941, size: 64)
!941 = !DIDerivedType(tag: DW_TAG_typedef, name: "Triangle_3D", file: !942, line: 34, baseType: !943)
!942 = !DIFile(filename: "../src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!943 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !942, line: 23, size: 72, flags: DIFlagTypePassByValue, elements: !944, identifier: "_ZTS11Triangle_3D")
!944 = !{!945, !947, !948, !949, !950, !951, !952, !953, !954}
!945 = !DIDerivedType(tag: DW_TAG_member, name: "x0", scope: !943, file: !942, line: 25, baseType: !946, size: 8)
!946 = !DIDerivedType(tag: DW_TAG_typedef, name: "bit8", file: !942, line: 19, baseType: !373)
!947 = !DIDerivedType(tag: DW_TAG_member, name: "y0", scope: !943, file: !942, line: 26, baseType: !946, size: 8, offset: 8)
!948 = !DIDerivedType(tag: DW_TAG_member, name: "z0", scope: !943, file: !942, line: 27, baseType: !946, size: 8, offset: 16)
!949 = !DIDerivedType(tag: DW_TAG_member, name: "x1", scope: !943, file: !942, line: 28, baseType: !946, size: 8, offset: 24)
!950 = !DIDerivedType(tag: DW_TAG_member, name: "y1", scope: !943, file: !942, line: 29, baseType: !946, size: 8, offset: 32)
!951 = !DIDerivedType(tag: DW_TAG_member, name: "z1", scope: !943, file: !942, line: 30, baseType: !946, size: 8, offset: 40)
!952 = !DIDerivedType(tag: DW_TAG_member, name: "x2", scope: !943, file: !942, line: 31, baseType: !946, size: 8, offset: 48)
!953 = !DIDerivedType(tag: DW_TAG_member, name: "y2", scope: !943, file: !942, line: 32, baseType: !946, size: 8, offset: 56)
!954 = !DIDerivedType(tag: DW_TAG_member, name: "z2", scope: !943, file: !942, line: 33, baseType: !946, size: 8, offset: 64)
!955 = !DILocalVariable(name: "argc", arg: 1, scope: !935, file: !29, line: 25, type: !11)
!956 = !DILocation(line: 25, column: 34, scope: !935)
!957 = !DILocalVariable(name: "argv", arg: 2, scope: !935, file: !29, line: 25, type: !568)
!958 = !DILocation(line: 25, column: 47, scope: !935)
!959 = !DILocalVariable(name: "num_triangles", arg: 3, scope: !935, file: !29, line: 25, type: !938)
!960 = !DILocation(line: 25, column: 58, scope: !935)
!961 = !DILocalVariable(name: "triangles", arg: 4, scope: !935, file: !29, line: 25, type: !939)
!962 = !DILocation(line: 25, column: 87, scope: !935)
!963 = !DILocation(line: 27, column: 3, scope: !935)
!964 = !DILocation(line: 27, column: 17, scope: !935)
!965 = !DILocation(line: 29, column: 7, scope: !966)
!966 = distinct !DILexicalBlock(scope: !935, file: !29, line: 29, column: 7)
!967 = !DILocation(line: 29, column: 12, scope: !966)
!968 = !DILocation(line: 29, column: 7, scope: !935)
!969 = !DILocation(line: 31, column: 17, scope: !970)
!970 = distinct !DILexicalBlock(scope: !966, file: !29, line: 30, column: 3)
!971 = !DILocation(line: 31, column: 5, scope: !970)
!972 = !DILocation(line: 32, column: 5, scope: !970)
!973 = !DILocation(line: 36, column: 13, scope: !935)
!974 = !DILocation(line: 36, column: 42, scope: !935)
!975 = !DILocation(line: 36, column: 39, scope: !935)
!976 = !DILocation(line: 36, column: 50, scope: !935)
!977 = !DILocalVariable(name: "infile", scope: !935, file: !29, line: 40, type: !978)
!978 = !DIDerivedType(tag: DW_TAG_typedef, name: "ifstream", scope: !2, file: !979, line: 162, baseType: !980)
!979 = !DIFile(filename: "/usr/include/c++/11/iosfwd", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!980 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ifstream<char, std::char_traits<char> >", scope: !2, file: !981, line: 1087, size: 4160, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt14basic_ifstreamIcSt11char_traitsIcEE")
!981 = !DIFile(filename: "/usr/include/c++/11/bits/fstream.tcc", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/3d-rendering/hls-approx")
!982 = !DILocation(line: 40, column: 17, scope: !935)
!983 = !DILocation(line: 40, column: 24, scope: !935)
!984 = !DILocation(line: 41, column: 15, scope: !985)
!985 = distinct !DILexicalBlock(scope: !935, file: !29, line: 41, column: 7)
!986 = !DILocation(line: 41, column: 7, scope: !935)
!987 = !DILocation(line: 43, column: 5, scope: !988)
!988 = distinct !DILexicalBlock(scope: !985, file: !29, line: 42, column: 3)
!989 = !DILocation(line: 44, column: 5, scope: !988)
!990 = !DILocation(line: 81, column: 1, scope: !985)
!991 = !DILocation(line: 81, column: 1, scope: !935)
!992 = !DILocation(line: 47, column: 3, scope: !935)
!993 = !DILocation(line: 47, column: 13, scope: !935)
!994 = !DILocation(line: 47, column: 10, scope: !935)
!995 = !DILocation(line: 50, column: 13, scope: !935)
!996 = !DILocation(line: 50, column: 43, scope: !935)
!997 = !DILocation(line: 50, column: 40, scope: !935)
!998 = !DILocation(line: 50, column: 57, scope: !935)
!999 = !DILocation(line: 53, column: 7, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !935, file: !29, line: 53, column: 7)
!1001 = !DILocation(line: 53, column: 21, scope: !1000)
!1002 = !DILocation(line: 53, column: 7, scope: !935)
!1003 = !DILocation(line: 55, column: 5, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !1000, file: !29, line: 54, column: 3)
!1005 = !DILocation(line: 56, column: 5, scope: !1004)
!1006 = !DILocation(line: 59, column: 32, scope: !935)
!1007 = !DILocation(line: 59, column: 16, scope: !935)
!1008 = !DILocation(line: 59, column: 4, scope: !935)
!1009 = !DILocation(line: 59, column: 14, scope: !935)
!1010 = !DILocalVariable(name: "x0", scope: !935, file: !29, line: 60, type: !11)
!1011 = !DILocation(line: 60, column: 7, scope: !935)
!1012 = !DILocalVariable(name: "y0", scope: !935, file: !29, line: 60, type: !11)
!1013 = !DILocation(line: 60, column: 11, scope: !935)
!1014 = !DILocalVariable(name: "z0", scope: !935, file: !29, line: 60, type: !11)
!1015 = !DILocation(line: 60, column: 15, scope: !935)
!1016 = !DILocalVariable(name: "x1", scope: !935, file: !29, line: 60, type: !11)
!1017 = !DILocation(line: 60, column: 19, scope: !935)
!1018 = !DILocalVariable(name: "y1", scope: !935, file: !29, line: 60, type: !11)
!1019 = !DILocation(line: 60, column: 23, scope: !935)
!1020 = !DILocalVariable(name: "z1", scope: !935, file: !29, line: 60, type: !11)
!1021 = !DILocation(line: 60, column: 27, scope: !935)
!1022 = !DILocalVariable(name: "x2", scope: !935, file: !29, line: 60, type: !11)
!1023 = !DILocation(line: 60, column: 31, scope: !935)
!1024 = !DILocalVariable(name: "y2", scope: !935, file: !29, line: 60, type: !11)
!1025 = !DILocation(line: 60, column: 35, scope: !935)
!1026 = !DILocalVariable(name: "z2", scope: !935, file: !29, line: 60, type: !11)
!1027 = !DILocation(line: 60, column: 39, scope: !935)
!1028 = !DILocation(line: 63, column: 13, scope: !935)
!1029 = !DILocation(line: 63, column: 43, scope: !935)
!1030 = !DILocalVariable(name: "i", scope: !1031, file: !29, line: 66, type: !11)
!1031 = distinct !DILexicalBlock(scope: !935, file: !29, line: 66, column: 3)
!1032 = !DILocation(line: 66, column: 12, scope: !1031)
!1033 = !DILocation(line: 66, column: 8, scope: !1031)
!1034 = !DILocation(line: 66, column: 19, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1031, file: !29, line: 66, column: 3)
!1036 = !DILocation(line: 66, column: 23, scope: !1035)
!1037 = !DILocation(line: 66, column: 21, scope: !1035)
!1038 = !DILocation(line: 66, column: 3, scope: !1031)
!1039 = !DILocation(line: 68, column: 5, scope: !1040)
!1040 = distinct !DILexicalBlock(scope: !1035, file: !29, line: 67, column: 3)
!1041 = !DILocation(line: 68, column: 12, scope: !1040)
!1042 = !DILocation(line: 68, column: 18, scope: !1040)
!1043 = !DILocation(line: 68, column: 24, scope: !1040)
!1044 = !DILocation(line: 68, column: 30, scope: !1040)
!1045 = !DILocation(line: 68, column: 36, scope: !1040)
!1046 = !DILocation(line: 68, column: 42, scope: !1040)
!1047 = !DILocation(line: 68, column: 48, scope: !1040)
!1048 = !DILocation(line: 68, column: 54, scope: !1040)
!1049 = !DILocation(line: 68, column: 60, scope: !1040)
!1050 = !DILocation(line: 69, column: 26, scope: !1040)
!1051 = !DILocation(line: 69, column: 7, scope: !1040)
!1052 = !DILocation(line: 69, column: 6, scope: !1040)
!1053 = !DILocation(line: 69, column: 18, scope: !1040)
!1054 = !DILocation(line: 69, column: 5, scope: !1040)
!1055 = !DILocation(line: 69, column: 21, scope: !1040)
!1056 = !DILocation(line: 69, column: 24, scope: !1040)
!1057 = !DILocation(line: 70, column: 26, scope: !1040)
!1058 = !DILocation(line: 70, column: 7, scope: !1040)
!1059 = !DILocation(line: 70, column: 6, scope: !1040)
!1060 = !DILocation(line: 70, column: 18, scope: !1040)
!1061 = !DILocation(line: 70, column: 5, scope: !1040)
!1062 = !DILocation(line: 70, column: 21, scope: !1040)
!1063 = !DILocation(line: 70, column: 24, scope: !1040)
!1064 = !DILocation(line: 71, column: 26, scope: !1040)
!1065 = !DILocation(line: 71, column: 7, scope: !1040)
!1066 = !DILocation(line: 71, column: 6, scope: !1040)
!1067 = !DILocation(line: 71, column: 18, scope: !1040)
!1068 = !DILocation(line: 71, column: 5, scope: !1040)
!1069 = !DILocation(line: 71, column: 21, scope: !1040)
!1070 = !DILocation(line: 71, column: 24, scope: !1040)
!1071 = !DILocation(line: 72, column: 26, scope: !1040)
!1072 = !DILocation(line: 72, column: 7, scope: !1040)
!1073 = !DILocation(line: 72, column: 6, scope: !1040)
!1074 = !DILocation(line: 72, column: 18, scope: !1040)
!1075 = !DILocation(line: 72, column: 5, scope: !1040)
!1076 = !DILocation(line: 72, column: 21, scope: !1040)
!1077 = !DILocation(line: 72, column: 24, scope: !1040)
!1078 = !DILocation(line: 73, column: 26, scope: !1040)
!1079 = !DILocation(line: 73, column: 7, scope: !1040)
!1080 = !DILocation(line: 73, column: 6, scope: !1040)
!1081 = !DILocation(line: 73, column: 18, scope: !1040)
!1082 = !DILocation(line: 73, column: 5, scope: !1040)
!1083 = !DILocation(line: 73, column: 21, scope: !1040)
!1084 = !DILocation(line: 73, column: 24, scope: !1040)
!1085 = !DILocation(line: 74, column: 26, scope: !1040)
!1086 = !DILocation(line: 74, column: 7, scope: !1040)
!1087 = !DILocation(line: 74, column: 6, scope: !1040)
!1088 = !DILocation(line: 74, column: 18, scope: !1040)
!1089 = !DILocation(line: 74, column: 5, scope: !1040)
!1090 = !DILocation(line: 74, column: 21, scope: !1040)
!1091 = !DILocation(line: 74, column: 24, scope: !1040)
!1092 = !DILocation(line: 75, column: 26, scope: !1040)
!1093 = !DILocation(line: 75, column: 7, scope: !1040)
!1094 = !DILocation(line: 75, column: 6, scope: !1040)
!1095 = !DILocation(line: 75, column: 18, scope: !1040)
!1096 = !DILocation(line: 75, column: 5, scope: !1040)
!1097 = !DILocation(line: 75, column: 21, scope: !1040)
!1098 = !DILocation(line: 75, column: 24, scope: !1040)
!1099 = !DILocation(line: 76, column: 26, scope: !1040)
!1100 = !DILocation(line: 76, column: 7, scope: !1040)
!1101 = !DILocation(line: 76, column: 6, scope: !1040)
!1102 = !DILocation(line: 76, column: 18, scope: !1040)
!1103 = !DILocation(line: 76, column: 5, scope: !1040)
!1104 = !DILocation(line: 76, column: 21, scope: !1040)
!1105 = !DILocation(line: 76, column: 24, scope: !1040)
!1106 = !DILocation(line: 77, column: 26, scope: !1040)
!1107 = !DILocation(line: 77, column: 7, scope: !1040)
!1108 = !DILocation(line: 77, column: 6, scope: !1040)
!1109 = !DILocation(line: 77, column: 18, scope: !1040)
!1110 = !DILocation(line: 77, column: 5, scope: !1040)
!1111 = !DILocation(line: 77, column: 21, scope: !1040)
!1112 = !DILocation(line: 77, column: 24, scope: !1040)
!1113 = !DILocation(line: 78, column: 3, scope: !1040)
!1114 = !DILocation(line: 66, column: 39, scope: !1035)
!1115 = !DILocation(line: 66, column: 3, scope: !1035)
!1116 = distinct !{!1116, !1038, !1117}
!1117 = !DILocation(line: 78, column: 3, scope: !1031)
!1118 = !DILocation(line: 80, column: 10, scope: !935)
!1119 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_utils.cpp", scope: !29, file: !29, type: !1120, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !28, variables: !30)
!1120 = !DISubroutineType(types: !30)
!1121 = !DILocation(line: 0, scope: !1119)
