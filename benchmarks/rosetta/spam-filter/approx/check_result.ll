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
%struct.DataSet_s = type { float*, i8*, float*, i64, i64 }
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
@.str = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"\0Amain parameter vector: \0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"m[\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"]: \00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c" | \00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Training TPR: \00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Training FPR: \00", align 1
@.str.7 = private unnamed_addr constant [17 x i8] c"Training Error: \00", align 1
@.str.8 = private unnamed_addr constant [14 x i8] c"Testing TPR: \00", align 1
@.str.9 = private unnamed_addr constant [14 x i8] c"Testing FPR: \00", align 1
@.str.10 = private unnamed_addr constant [16 x i8] c"Testing Error: \00", align 1
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str.11 = private unnamed_addr constant [30 x i8] c"Failed to create output file!\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_check_result.cpp, i8* null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" !dbg !934 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !935
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3, !dbg !935
  ret void, !dbg !935
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

; Function Attrs: noinline nounwind optnone uwtable
define float @_Z10dotProductPfS_m(float* %param_vector, float* %data_point_i, i64 %num_features) #4 !dbg !936 {
entry:
  %param_vector.addr = alloca float*, align 8
  %data_point_i.addr = alloca float*, align 8
  %num_features.addr = alloca i64, align 8
  %result = alloca float, align 4
  %i = alloca i32, align 4
  store float* %param_vector, float** %param_vector.addr, align 8
  call void @llvm.dbg.declare(metadata float** %param_vector.addr, metadata !944, metadata !DIExpression()), !dbg !945
  store float* %data_point_i, float** %data_point_i.addr, align 8
  call void @llvm.dbg.declare(metadata float** %data_point_i.addr, metadata !946, metadata !DIExpression()), !dbg !947
  store i64 %num_features, i64* %num_features.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %num_features.addr, metadata !948, metadata !DIExpression()), !dbg !949
  call void @llvm.dbg.declare(metadata float* %result, metadata !950, metadata !DIExpression()), !dbg !951
  store float 0.000000e+00, float* %result, align 4, !dbg !951
  call void @llvm.dbg.declare(metadata i32* %i, metadata !952, metadata !DIExpression()), !dbg !954
  store i32 0, i32* %i, align 4, !dbg !954
  br label %for.cond, !dbg !955

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !956
  %conv = sext i32 %0 to i64, !dbg !956
  %1 = load i64, i64* %num_features.addr, align 8, !dbg !958
  %cmp = icmp ult i64 %conv, %1, !dbg !959
  br i1 %cmp, label %for.body, label %for.end, !dbg !960

for.body:                                         ; preds = %for.cond
  %2 = load float*, float** %param_vector.addr, align 8, !dbg !961
  %3 = load i32, i32* %i, align 4, !dbg !962
  %idxprom = sext i32 %3 to i64, !dbg !961
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom, !dbg !961
  %4 = load float, float* %arrayidx, align 4, !dbg !961
  %5 = load float*, float** %data_point_i.addr, align 8, !dbg !963
  %6 = load i32, i32* %i, align 4, !dbg !964
  %idxprom1 = sext i32 %6 to i64, !dbg !963
  %arrayidx2 = getelementptr inbounds float, float* %5, i64 %idxprom1, !dbg !963
  %7 = load float, float* %arrayidx2, align 4, !dbg !963
  %mul = fmul float %4, %7, !dbg !965
  %8 = load float, float* %result, align 4, !dbg !966
  %add = fadd float %8, %mul, !dbg !966
  store float %add, float* %result, align 4, !dbg !966
  br label %for.inc, !dbg !967

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !968
  %inc = add nsw i32 %9, 1, !dbg !968
  store i32 %inc, i32* %i, align 4, !dbg !968
  br label %for.cond, !dbg !969, !llvm.loop !970

for.end:                                          ; preds = %for.cond
  %10 = load float, float* %result, align 4, !dbg !972
  ret float %10, !dbg !973
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #5

; Function Attrs: noinline nounwind optnone uwtable
define zeroext i8 @_Z13getPredictionPfS_md(float* %parameter_vector, float* %data_point_i, i64 %num_features, double %treshold) #4 !dbg !974 {
entry:
  %parameter_vector.addr = alloca float*, align 8
  %data_point_i.addr = alloca float*, align 8
  %num_features.addr = alloca i64, align 8
  %treshold.addr = alloca double, align 8
  %parameter_vector_dot_x_i = alloca float, align 4
  store float* %parameter_vector, float** %parameter_vector.addr, align 8
  call void @llvm.dbg.declare(metadata float** %parameter_vector.addr, metadata !979, metadata !DIExpression()), !dbg !980
  store float* %data_point_i, float** %data_point_i.addr, align 8
  call void @llvm.dbg.declare(metadata float** %data_point_i.addr, metadata !981, metadata !DIExpression()), !dbg !982
  store i64 %num_features, i64* %num_features.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %num_features.addr, metadata !983, metadata !DIExpression()), !dbg !984
  store double %treshold, double* %treshold.addr, align 8
  call void @llvm.dbg.declare(metadata double* %treshold.addr, metadata !985, metadata !DIExpression()), !dbg !986
  call void @llvm.dbg.declare(metadata float* %parameter_vector_dot_x_i, metadata !987, metadata !DIExpression()), !dbg !988
  %0 = load float*, float** %parameter_vector.addr, align 8, !dbg !989
  %1 = load float*, float** %data_point_i.addr, align 8, !dbg !990
  %2 = load i64, i64* %num_features.addr, align 8, !dbg !991
  %call = call float @_Z10dotProductPfS_m(float* %0, float* %1, i64 %2), !dbg !992
  store float %call, float* %parameter_vector_dot_x_i, align 4, !dbg !988
  %3 = load float, float* %parameter_vector_dot_x_i, align 4, !dbg !993
  %conv = fpext float %3 to double, !dbg !993
  %4 = load double, double* %treshold.addr, align 8, !dbg !994
  %cmp = fcmp ogt double %conv, %4, !dbg !995
  %5 = zext i1 %cmp to i64, !dbg !996
  %cond = select i1 %cmp, i32 1, i32 0, !dbg !996
  %conv1 = trunc i32 %cond to i8, !dbg !996
  ret i8 %conv1, !dbg !997
}

; Function Attrs: noinline nounwind optnone uwtable
define double @_Z16computeErrorRate9DataSet_sRdS0_S0_(%struct.DataSet_s* byval align 8 %data_set, double* dereferenceable(8) %cumulative_true_positive_rate, double* dereferenceable(8) %cumulative_false_positive_rate, double* dereferenceable(8) %cumulative_error) #4 !dbg !998 {
entry:
  %cumulative_true_positive_rate.addr = alloca double*, align 8
  %cumulative_false_positive_rate.addr = alloca double*, align 8
  %cumulative_error.addr = alloca double*, align 8
  %true_positives = alloca i64, align 8
  %true_negatives = alloca i64, align 8
  %false_positives = alloca i64, align 8
  %false_negatives = alloca i64, align 8
  %i = alloca i64, align 8
  %prediction = alloca i8, align 1
  %error_rate = alloca double, align 8
  call void @llvm.dbg.declare(metadata %struct.DataSet_s* %data_set, metadata !1011, metadata !DIExpression()), !dbg !1012
  store double* %cumulative_true_positive_rate, double** %cumulative_true_positive_rate.addr, align 8
  call void @llvm.dbg.declare(metadata double** %cumulative_true_positive_rate.addr, metadata !1013, metadata !DIExpression()), !dbg !1014
  store double* %cumulative_false_positive_rate, double** %cumulative_false_positive_rate.addr, align 8
  call void @llvm.dbg.declare(metadata double** %cumulative_false_positive_rate.addr, metadata !1015, metadata !DIExpression()), !dbg !1016
  store double* %cumulative_error, double** %cumulative_error.addr, align 8
  call void @llvm.dbg.declare(metadata double** %cumulative_error.addr, metadata !1017, metadata !DIExpression()), !dbg !1018
  call void @llvm.dbg.declare(metadata i64* %true_positives, metadata !1019, metadata !DIExpression()), !dbg !1020
  store i64 0, i64* %true_positives, align 8, !dbg !1020
  call void @llvm.dbg.declare(metadata i64* %true_negatives, metadata !1021, metadata !DIExpression()), !dbg !1022
  store i64 0, i64* %true_negatives, align 8, !dbg !1022
  call void @llvm.dbg.declare(metadata i64* %false_positives, metadata !1023, metadata !DIExpression()), !dbg !1024
  store i64 0, i64* %false_positives, align 8, !dbg !1024
  call void @llvm.dbg.declare(metadata i64* %false_negatives, metadata !1025, metadata !DIExpression()), !dbg !1026
  store i64 0, i64* %false_negatives, align 8, !dbg !1026
  call void @llvm.dbg.declare(metadata i64* %i, metadata !1027, metadata !DIExpression()), !dbg !1029
  store i64 0, i64* %i, align 8, !dbg !1029
  br label %for.cond, !dbg !1030

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !1031
  %num_data_points = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 3, !dbg !1033
  %1 = load i64, i64* %num_data_points, align 8, !dbg !1033
  %cmp = icmp ult i64 %0, %1, !dbg !1034
  br i1 %cmp, label %for.body, label %for.end, !dbg !1035

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i8* %prediction, metadata !1036, metadata !DIExpression()), !dbg !1038
  %parameter_vector = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 2, !dbg !1039
  %2 = load float*, float** %parameter_vector, align 8, !dbg !1039
  %data_points = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 0, !dbg !1040
  %3 = load float*, float** %data_points, align 8, !dbg !1040
  %4 = load i64, i64* %i, align 8, !dbg !1041
  %num_features = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 4, !dbg !1042
  %5 = load i64, i64* %num_features, align 8, !dbg !1042
  %mul = mul i64 %4, %5, !dbg !1043
  %arrayidx = getelementptr inbounds float, float* %3, i64 %mul, !dbg !1044
  %num_features1 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 4, !dbg !1045
  %6 = load i64, i64* %num_features1, align 8, !dbg !1045
  %call = call zeroext i8 @_Z13getPredictionPfS_md(float* %2, float* %arrayidx, i64 %6, double 0.000000e+00), !dbg !1046
  store i8 %call, i8* %prediction, align 1, !dbg !1038
  %7 = load i8, i8* %prediction, align 1, !dbg !1047
  %conv = zext i8 %7 to i32, !dbg !1047
  %labels = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 1, !dbg !1049
  %8 = load i8*, i8** %labels, align 8, !dbg !1049
  %9 = load i64, i64* %i, align 8, !dbg !1050
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !1051
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !1051
  %conv3 = zext i8 %10 to i32, !dbg !1051
  %cmp4 = icmp ne i32 %conv, %conv3, !dbg !1052
  br i1 %cmp4, label %if.then, label %if.else9, !dbg !1053

if.then:                                          ; preds = %for.body
  %11 = load i8, i8* %prediction, align 1, !dbg !1054
  %conv5 = zext i8 %11 to i32, !dbg !1054
  %cmp6 = icmp eq i32 %conv5, 1, !dbg !1057
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !1058

if.then7:                                         ; preds = %if.then
  %12 = load i64, i64* %false_positives, align 8, !dbg !1059
  %inc = add i64 %12, 1, !dbg !1059
  store i64 %inc, i64* %false_positives, align 8, !dbg !1059
  br label %if.end, !dbg !1060

if.else:                                          ; preds = %if.then
  %13 = load i64, i64* %false_negatives, align 8, !dbg !1061
  %inc8 = add i64 %13, 1, !dbg !1061
  store i64 %inc8, i64* %false_negatives, align 8, !dbg !1061
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  br label %if.end17, !dbg !1062

if.else9:                                         ; preds = %for.body
  %14 = load i8, i8* %prediction, align 1, !dbg !1063
  %conv10 = zext i8 %14 to i32, !dbg !1063
  %cmp11 = icmp eq i32 %conv10, 1, !dbg !1066
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1067

if.then12:                                        ; preds = %if.else9
  %15 = load i64, i64* %true_positives, align 8, !dbg !1068
  %inc13 = add i64 %15, 1, !dbg !1068
  store i64 %inc13, i64* %true_positives, align 8, !dbg !1068
  br label %if.end16, !dbg !1069

if.else14:                                        ; preds = %if.else9
  %16 = load i64, i64* %true_negatives, align 8, !dbg !1070
  %inc15 = add i64 %16, 1, !dbg !1070
  store i64 %inc15, i64* %true_negatives, align 8, !dbg !1070
  br label %if.end16

if.end16:                                         ; preds = %if.else14, %if.then12
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.end
  br label %for.inc, !dbg !1071

for.inc:                                          ; preds = %if.end17
  %17 = load i64, i64* %i, align 8, !dbg !1072
  %inc18 = add i64 %17, 1, !dbg !1072
  store i64 %inc18, i64* %i, align 8, !dbg !1072
  br label %for.cond, !dbg !1073, !llvm.loop !1074

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata double* %error_rate, metadata !1076, metadata !DIExpression()), !dbg !1077
  %18 = load i64, i64* %false_positives, align 8, !dbg !1078
  %19 = load i64, i64* %false_negatives, align 8, !dbg !1079
  %add = add i64 %18, %19, !dbg !1080
  %conv19 = uitofp i64 %add to double, !dbg !1081
  %num_data_points20 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 3, !dbg !1082
  %20 = load i64, i64* %num_data_points20, align 8, !dbg !1082
  %conv21 = uitofp i64 %20 to double, !dbg !1083
  %div = fdiv double %conv19, %conv21, !dbg !1084
  store double %div, double* %error_rate, align 8, !dbg !1077
  %21 = load i64, i64* %true_positives, align 8, !dbg !1085
  %conv22 = uitofp i64 %21 to double, !dbg !1085
  %22 = load i64, i64* %true_positives, align 8, !dbg !1086
  %23 = load i64, i64* %false_negatives, align 8, !dbg !1087
  %add23 = add i64 %22, %23, !dbg !1088
  %conv24 = uitofp i64 %add23 to double, !dbg !1089
  %div25 = fdiv double %conv22, %conv24, !dbg !1090
  %24 = load double*, double** %cumulative_true_positive_rate.addr, align 8, !dbg !1091
  %25 = load double, double* %24, align 8, !dbg !1092
  %add26 = fadd double %25, %div25, !dbg !1092
  store double %add26, double* %24, align 8, !dbg !1092
  %26 = load i64, i64* %false_positives, align 8, !dbg !1093
  %conv27 = uitofp i64 %26 to double, !dbg !1093
  %27 = load i64, i64* %false_positives, align 8, !dbg !1094
  %28 = load i64, i64* %true_negatives, align 8, !dbg !1095
  %add28 = add i64 %27, %28, !dbg !1096
  %conv29 = uitofp i64 %add28 to double, !dbg !1097
  %div30 = fdiv double %conv27, %conv29, !dbg !1098
  %29 = load double*, double** %cumulative_false_positive_rate.addr, align 8, !dbg !1099
  %30 = load double, double* %29, align 8, !dbg !1100
  %add31 = fadd double %30, %div30, !dbg !1100
  store double %add31, double* %29, align 8, !dbg !1100
  %31 = load double, double* %error_rate, align 8, !dbg !1101
  %32 = load double*, double** %cumulative_error.addr, align 8, !dbg !1102
  %33 = load double, double* %32, align 8, !dbg !1103
  %add32 = fadd double %33, %31, !dbg !1103
  store double %add32, double* %32, align 8, !dbg !1103
  %34 = load double, double* %error_rate, align 8, !dbg !1104
  ret double %34, !dbg !1105
}

; Function Attrs: noinline optnone uwtable
define void @_Z13check_resultsPfS_Ph(float* %param_vector, float* %data_points, i8* %labels) #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !1106 {
entry:
  %param_vector.addr = alloca float*, align 8
  %data_points.addr = alloca float*, align 8
  %labels.addr = alloca i8*, align 8
  %ofile = alloca %"class.std::basic_ofstream", align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %i = alloca i32, align 4
  %training_tpr = alloca double, align 8
  %training_fpr = alloca double, align 8
  %training_error = alloca double, align 8
  %testing_tpr = alloca double, align 8
  %testing_fpr = alloca double, align 8
  %testing_error = alloca double, align 8
  %training_set = alloca %struct.DataSet_s, align 8
  %agg.tmp = alloca %struct.DataSet_s, align 8
  %testing_set = alloca %struct.DataSet_s, align 8
  %agg.tmp27 = alloca %struct.DataSet_s, align 8
  store float* %param_vector, float** %param_vector.addr, align 8
  call void @llvm.dbg.declare(metadata float** %param_vector.addr, metadata !1109, metadata !DIExpression()), !dbg !1110
  store float* %data_points, float** %data_points.addr, align 8
  call void @llvm.dbg.declare(metadata float** %data_points.addr, metadata !1111, metadata !DIExpression()), !dbg !1112
  store i8* %labels, i8** %labels.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %labels.addr, metadata !1113, metadata !DIExpression()), !dbg !1114
  call void @llvm.dbg.declare(metadata %"class.std::basic_ofstream"* %ofile, metadata !1115, metadata !DIExpression()), !dbg !1120
  call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev(%"class.std::basic_ofstream"* %ofile), !dbg !1120
  invoke void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_ofstream"* %ofile, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 16)
          to label %invoke.cont unwind label %lpad, !dbg !1121

invoke.cont:                                      ; preds = %entry
  %call = invoke zeroext i1 @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ofstream"* %ofile)
          to label %invoke.cont1 unwind label %lpad, !dbg !1122

invoke.cont1:                                     ; preds = %invoke.cont
  br i1 %call, label %if.then, label %if.else, !dbg !1124

if.then:                                          ; preds = %invoke.cont1
  %0 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !1125
  %call3 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %0, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i32 0, i32 0))
          to label %invoke.cont2 unwind label %lpad, !dbg !1127

invoke.cont2:                                     ; preds = %if.then
  call void @llvm.dbg.declare(metadata i32* %i, metadata !1128, metadata !DIExpression()), !dbg !1130
  store i32 0, i32* %i, align 4, !dbg !1130
  br label %for.cond, !dbg !1131

for.cond:                                         ; preds = %for.inc, %invoke.cont2
  %1 = load i32, i32* %i, align 4, !dbg !1132
  %cmp = icmp slt i32 %1, 30, !dbg !1134
  br i1 %cmp, label %for.body, label %for.end, !dbg !1135

for.body:                                         ; preds = %for.cond
  %2 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !1136
  %call5 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0))
          to label %invoke.cont4 unwind label %lpad, !dbg !1137

invoke.cont4:                                     ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !1138
  %call7 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call5, i32 %3)
          to label %invoke.cont6 unwind label %lpad, !dbg !1139

invoke.cont6:                                     ; preds = %invoke.cont4
  %call9 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call7, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0))
          to label %invoke.cont8 unwind label %lpad, !dbg !1140

invoke.cont8:                                     ; preds = %invoke.cont6
  %4 = load float*, float** %param_vector.addr, align 8, !dbg !1141
  %5 = load i32, i32* %i, align 4, !dbg !1142
  %idxprom = sext i32 %5 to i64, !dbg !1141
  %arrayidx = getelementptr inbounds float, float* %4, i64 %idxprom, !dbg !1141
  %6 = load float, float* %arrayidx, align 4, !dbg !1141
  %call11 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEf(%"class.std::basic_ostream"* %call9, float %6)
          to label %invoke.cont10 unwind label %lpad, !dbg !1143

invoke.cont10:                                    ; preds = %invoke.cont8
  %call13 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call11, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0))
          to label %invoke.cont12 unwind label %lpad, !dbg !1144

invoke.cont12:                                    ; preds = %invoke.cont10
  br label %for.inc, !dbg !1136

for.inc:                                          ; preds = %invoke.cont12
  %7 = load i32, i32* %i, align 4, !dbg !1145
  %inc = add nsw i32 %7, 1, !dbg !1145
  store i32 %inc, i32* %i, align 4, !dbg !1145
  br label %for.cond, !dbg !1146, !llvm.loop !1147

lpad:                                             ; preds = %invoke.cont71, %if.else, %invoke.cont67, %invoke.cont65, %invoke.cont63, %invoke.cont61, %invoke.cont59, %invoke.cont57, %invoke.cont55, %invoke.cont53, %invoke.cont51, %invoke.cont49, %invoke.cont47, %invoke.cont45, %invoke.cont43, %invoke.cont41, %invoke.cont39, %invoke.cont37, %invoke.cont35, %invoke.cont28, %invoke.cont18, %invoke.cont14, %for.end, %invoke.cont10, %invoke.cont8, %invoke.cont6, %invoke.cont4, %for.body, %if.then, %invoke.cont, %entry
  %8 = landingpad { i8*, i32 }
          cleanup, !dbg !1149
  %9 = extractvalue { i8*, i32 } %8, 0, !dbg !1149
  store i8* %9, i8** %exn.slot, align 8, !dbg !1149
  %10 = extractvalue { i8*, i32 } %8, 1, !dbg !1149
  store i32 %10, i32* %ehselector.slot, align 4, !dbg !1149
  call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* %ofile) #3, !dbg !1149
  br label %eh.resume, !dbg !1149

for.end:                                          ; preds = %for.cond
  %11 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !1150
  %call15 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %11, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont14 unwind label %lpad, !dbg !1151

invoke.cont14:                                    ; preds = %for.end
  call void @llvm.dbg.declare(metadata double* %training_tpr, metadata !1152, metadata !DIExpression()), !dbg !1153
  store double 0.000000e+00, double* %training_tpr, align 8, !dbg !1153
  call void @llvm.dbg.declare(metadata double* %training_fpr, metadata !1154, metadata !DIExpression()), !dbg !1155
  store double 0.000000e+00, double* %training_fpr, align 8, !dbg !1155
  call void @llvm.dbg.declare(metadata double* %training_error, metadata !1156, metadata !DIExpression()), !dbg !1157
  store double 0.000000e+00, double* %training_error, align 8, !dbg !1157
  call void @llvm.dbg.declare(metadata double* %testing_tpr, metadata !1158, metadata !DIExpression()), !dbg !1159
  store double 0.000000e+00, double* %testing_tpr, align 8, !dbg !1159
  call void @llvm.dbg.declare(metadata double* %testing_fpr, metadata !1160, metadata !DIExpression()), !dbg !1161
  store double 0.000000e+00, double* %testing_fpr, align 8, !dbg !1161
  call void @llvm.dbg.declare(metadata double* %testing_error, metadata !1162, metadata !DIExpression()), !dbg !1163
  store double 0.000000e+00, double* %testing_error, align 8, !dbg !1163
  call void @llvm.dbg.declare(metadata %struct.DataSet_s* %training_set, metadata !1164, metadata !DIExpression()), !dbg !1165
  %12 = load float*, float** %data_points.addr, align 8, !dbg !1166
  %data_points16 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %training_set, i32 0, i32 0, !dbg !1167
  store float* %12, float** %data_points16, align 8, !dbg !1168
  %13 = load i8*, i8** %labels.addr, align 8, !dbg !1169
  %labels17 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %training_set, i32 0, i32 1, !dbg !1170
  store i8* %13, i8** %labels17, align 8, !dbg !1171
  %num_data_points = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %training_set, i32 0, i32 3, !dbg !1172
  store i64 4500, i64* %num_data_points, align 8, !dbg !1173
  %num_features = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %training_set, i32 0, i32 4, !dbg !1174
  store i64 1024, i64* %num_features, align 8, !dbg !1175
  %14 = load float*, float** %param_vector.addr, align 8, !dbg !1176
  %parameter_vector = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %training_set, i32 0, i32 2, !dbg !1177
  store float* %14, float** %parameter_vector, align 8, !dbg !1178
  %15 = bitcast %struct.DataSet_s* %agg.tmp to i8*, !dbg !1179
  %16 = bitcast %struct.DataSet_s* %training_set to i8*, !dbg !1179
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %15, i8* align 8 %16, i64 40, i1 false), !dbg !1179
  %call19 = invoke double @_Z16computeErrorRate9DataSet_sRdS0_S0_(%struct.DataSet_s* byval align 8 %agg.tmp, double* dereferenceable(8) %training_tpr, double* dereferenceable(8) %training_fpr, double* dereferenceable(8) %training_error)
          to label %invoke.cont18 unwind label %lpad, !dbg !1180

invoke.cont18:                                    ; preds = %invoke.cont14
  call void @llvm.dbg.declare(metadata %struct.DataSet_s* %testing_set, metadata !1181, metadata !DIExpression()), !dbg !1182
  %17 = load float*, float** %data_points.addr, align 8, !dbg !1183
  %arrayidx20 = getelementptr inbounds float, float* %17, i64 4608000, !dbg !1183
  %data_points21 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %testing_set, i32 0, i32 0, !dbg !1184
  store float* %arrayidx20, float** %data_points21, align 8, !dbg !1185
  %18 = load i8*, i8** %labels.addr, align 8, !dbg !1186
  %arrayidx22 = getelementptr inbounds i8, i8* %18, i64 4500, !dbg !1186
  %labels23 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %testing_set, i32 0, i32 1, !dbg !1187
  store i8* %arrayidx22, i8** %labels23, align 8, !dbg !1188
  %num_data_points24 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %testing_set, i32 0, i32 3, !dbg !1189
  store i64 500, i64* %num_data_points24, align 8, !dbg !1190
  %num_features25 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %testing_set, i32 0, i32 4, !dbg !1191
  store i64 1024, i64* %num_features25, align 8, !dbg !1192
  %19 = load float*, float** %param_vector.addr, align 8, !dbg !1193
  %parameter_vector26 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %testing_set, i32 0, i32 2, !dbg !1194
  store float* %19, float** %parameter_vector26, align 8, !dbg !1195
  %20 = bitcast %struct.DataSet_s* %agg.tmp27 to i8*, !dbg !1196
  %21 = bitcast %struct.DataSet_s* %testing_set to i8*, !dbg !1196
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %20, i8* align 8 %21, i64 40, i1 false), !dbg !1196
  %call29 = invoke double @_Z16computeErrorRate9DataSet_sRdS0_S0_(%struct.DataSet_s* byval align 8 %agg.tmp27, double* dereferenceable(8) %testing_tpr, double* dereferenceable(8) %testing_fpr, double* dereferenceable(8) %testing_error)
          to label %invoke.cont28 unwind label %lpad, !dbg !1197

invoke.cont28:                                    ; preds = %invoke.cont18
  %22 = load double, double* %training_tpr, align 8, !dbg !1198
  %mul = fmul double %22, 1.000000e+02, !dbg !1198
  store double %mul, double* %training_tpr, align 8, !dbg !1198
  %23 = load double, double* %training_fpr, align 8, !dbg !1199
  %mul30 = fmul double %23, 1.000000e+02, !dbg !1199
  store double %mul30, double* %training_fpr, align 8, !dbg !1199
  %24 = load double, double* %training_error, align 8, !dbg !1200
  %mul31 = fmul double %24, 1.000000e+02, !dbg !1200
  store double %mul31, double* %training_error, align 8, !dbg !1200
  %25 = load double, double* %testing_tpr, align 8, !dbg !1201
  %mul32 = fmul double %25, 1.000000e+02, !dbg !1201
  store double %mul32, double* %testing_tpr, align 8, !dbg !1201
  %26 = load double, double* %testing_fpr, align 8, !dbg !1202
  %mul33 = fmul double %26, 1.000000e+02, !dbg !1202
  store double %mul33, double* %testing_fpr, align 8, !dbg !1202
  %27 = load double, double* %testing_error, align 8, !dbg !1203
  %mul34 = fmul double %27, 1.000000e+02, !dbg !1203
  store double %mul34, double* %testing_error, align 8, !dbg !1203
  %28 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !1204
  %call36 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %28, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i32 0, i32 0))
          to label %invoke.cont35 unwind label %lpad, !dbg !1205

invoke.cont35:                                    ; preds = %invoke.cont28
  %29 = load double, double* %training_tpr, align 8, !dbg !1206
  %call38 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* %call36, double %29)
          to label %invoke.cont37 unwind label %lpad, !dbg !1207

invoke.cont37:                                    ; preds = %invoke.cont35
  %call40 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call38, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont39 unwind label %lpad, !dbg !1208

invoke.cont39:                                    ; preds = %invoke.cont37
  %30 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !1209
  %call42 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %30, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i32 0, i32 0))
          to label %invoke.cont41 unwind label %lpad, !dbg !1210

invoke.cont41:                                    ; preds = %invoke.cont39
  %31 = load double, double* %training_fpr, align 8, !dbg !1211
  %call44 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* %call42, double %31)
          to label %invoke.cont43 unwind label %lpad, !dbg !1212

invoke.cont43:                                    ; preds = %invoke.cont41
  %call46 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call44, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont45 unwind label %lpad, !dbg !1213

invoke.cont45:                                    ; preds = %invoke.cont43
  %32 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !1214
  %call48 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.7, i32 0, i32 0))
          to label %invoke.cont47 unwind label %lpad, !dbg !1215

invoke.cont47:                                    ; preds = %invoke.cont45
  %33 = load double, double* %training_error, align 8, !dbg !1216
  %call50 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* %call48, double %33)
          to label %invoke.cont49 unwind label %lpad, !dbg !1217

invoke.cont49:                                    ; preds = %invoke.cont47
  %call52 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call50, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont51 unwind label %lpad, !dbg !1218

invoke.cont51:                                    ; preds = %invoke.cont49
  %34 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !1219
  %call54 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %34, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.8, i32 0, i32 0))
          to label %invoke.cont53 unwind label %lpad, !dbg !1220

invoke.cont53:                                    ; preds = %invoke.cont51
  %35 = load double, double* %testing_tpr, align 8, !dbg !1221
  %call56 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* %call54, double %35)
          to label %invoke.cont55 unwind label %lpad, !dbg !1222

invoke.cont55:                                    ; preds = %invoke.cont53
  %call58 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call56, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont57 unwind label %lpad, !dbg !1223

invoke.cont57:                                    ; preds = %invoke.cont55
  %36 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !1224
  %call60 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %36, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.9, i32 0, i32 0))
          to label %invoke.cont59 unwind label %lpad, !dbg !1225

invoke.cont59:                                    ; preds = %invoke.cont57
  %37 = load double, double* %testing_fpr, align 8, !dbg !1226
  %call62 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* %call60, double %37)
          to label %invoke.cont61 unwind label %lpad, !dbg !1227

invoke.cont61:                                    ; preds = %invoke.cont59
  %call64 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call62, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont63 unwind label %lpad, !dbg !1228

invoke.cont63:                                    ; preds = %invoke.cont61
  %38 = bitcast %"class.std::basic_ofstream"* %ofile to %"class.std::basic_ostream"*, !dbg !1229
  %call66 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %38, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.10, i32 0, i32 0))
          to label %invoke.cont65 unwind label %lpad, !dbg !1230

invoke.cont65:                                    ; preds = %invoke.cont63
  %39 = load double, double* %testing_error, align 8, !dbg !1231
  %call68 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* %call66, double %39)
          to label %invoke.cont67 unwind label %lpad, !dbg !1232

invoke.cont67:                                    ; preds = %invoke.cont65
  %call70 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call68, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont69 unwind label %lpad, !dbg !1233

invoke.cont69:                                    ; preds = %invoke.cont67
  br label %if.end, !dbg !1234

if.else:                                          ; preds = %invoke.cont1
  %call72 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.11, i32 0, i32 0))
          to label %invoke.cont71 unwind label %lpad, !dbg !1235

invoke.cont71:                                    ; preds = %if.else
  %call74 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call72, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %invoke.cont73 unwind label %lpad, !dbg !1237

invoke.cont73:                                    ; preds = %invoke.cont71
  br label %if.end

if.end:                                           ; preds = %invoke.cont73, %invoke.cont69
  call void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"* %ofile) #3, !dbg !1149
  ret void, !dbg !1149

eh.resume:                                        ; preds = %lpad
  %exn = load i8*, i8** %exn.slot, align 8, !dbg !1149
  %sel = load i32, i32* %ehselector.slot, align 4, !dbg !1149
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !1149
  %lpad.val75 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !1149
  resume { i8*, i32 } %lpad.val75, !dbg !1149
}

declare void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEEC1Ev(%"class.std::basic_ofstream"*) unnamed_addr #1

declare void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode(%"class.std::basic_ofstream"*, i8*, i32) #1

declare i32 @__gxx_personality_v0(...)

declare zeroext i1 @_ZNSt14basic_ofstreamIcSt11char_traitsIcEE7is_openEv(%"class.std::basic_ofstream"*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEf(%"class.std::basic_ostream"*, float) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"*, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)*) #1

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* dereferenceable(272)) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #7

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"*, double) #1

; Function Attrs: nounwind
declare void @_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev(%"class.std::basic_ofstream"*) unnamed_addr #2

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_check_result.cpp() #0 section ".text.startup" !dbg !1238 {
entry:
  call void @__cxx_global_var_init(), !dbg !1240
  ret void
}

attributes #0 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable willreturn }
attributes #6 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!28}
!llvm.module.flags = !{!929, !930, !931, !932}
!llvm.ident = !{!933}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !2, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "std", scope: null)
!3 = !DIFile(filename: "/usr/include/c++/11/iostream", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!4 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !6, file: !5, line: 626, size: 8, flags: DIFlagTypePassByReference, elements: !7, identifier: "_ZTSNSt8ios_base4InitE")
!5 = !DIFile(filename: "/usr/include/c++/11/bits/ios_base.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!6 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !2, file: !5, line: 228, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt8ios_base")
!7 = !{!8, !12, !14, !18, !19, !24}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "_S_refcount", scope: !4, file: !5, line: 639, baseType: !9, flags: DIFlagStaticMember)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Atomic_word", file: !10, line: 32, baseType: !11)
!10 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/atomic_word.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
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
!28 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !29, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !30, retainedTypes: !31, globals: !33, imports: !42)
!29 = !DIFile(filename: "../src/check_result.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!30 = !{}
!31 = !{!32}
!32 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!33 = !{!0, !34, !38, !40}
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression(DW_OP_constu, 4500, DW_OP_stack_value))
!35 = distinct !DIGlobalVariable(name: "NUM_TRAINING", scope: !28, file: !36, line: 15, type: !37, isLocal: true, isDefinition: true)
!36 = !DIFile(filename: "../src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!37 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !11)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression(DW_OP_constu, 1024, DW_OP_stack_value))
!39 = distinct !DIGlobalVariable(name: "NUM_FEATURES", scope: !28, file: !36, line: 13, type: !37, isLocal: true, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression(DW_OP_constu, 500, DW_OP_stack_value))
!41 = distinct !DIGlobalVariable(name: "NUM_TESTING", scope: !28, file: !36, line: 16, type: !37, isLocal: true, isDefinition: true)
!42 = !{!43, !62, !65, !70, !78, !86, !90, !97, !101, !105, !107, !109, !113, !125, !129, !135, !141, !143, !147, !151, !155, !159, !171, !173, !177, !181, !185, !187, !193, !197, !201, !203, !205, !209, !217, !221, !225, !229, !231, !237, !239, !245, !250, !254, !259, !263, !267, !271, !273, !275, !279, !283, !287, !289, !293, !297, !299, !301, !305, !311, !316, !321, !322, !323, !324, !325, !326, !327, !328, !329, !330, !331, !386, !390, !394, !401, !405, !408, !411, !414, !416, !418, !420, !423, !426, !429, !432, !435, !437, !442, !446, !449, !452, !454, !456, !458, !460, !463, !466, !469, !472, !475, !477, !481, !485, !490, !496, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !526, !530, !536, !540, !545, !547, !551, !555, !559, !569, !573, !577, !581, !585, !589, !593, !597, !601, !605, !609, !613, !617, !619, !623, !627, !631, !637, !641, !645, !647, !651, !655, !661, !663, !667, !671, !675, !679, !683, !687, !691, !692, !693, !694, !696, !697, !698, !699, !700, !701, !702, !706, !712, !717, !721, !723, !725, !727, !729, !736, !740, !744, !748, !752, !756, !761, !765, !767, !771, !777, !781, !786, !788, !790, !794, !798, !800, !802, !804, !806, !810, !812, !814, !818, !822, !826, !830, !834, !838, !840, !844, !848, !852, !856, !858, !860, !864, !868, !869, !870, !871, !872, !873, !879, !882, !883, !885, !887, !889, !891, !895, !897, !899, !901, !903, !905, !907, !909, !911, !915, !919, !921, !925}
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !44, file: !61, line: 64)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !45, line: 6, baseType: !46)
!45 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !47, line: 21, baseType: !48)
!47 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !47, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !49, identifier: "_ZTS11__mbstate_t")
!49 = !{!50, !51}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !48, file: !47, line: 15, baseType: !11, size: 32)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !48, file: !47, line: 20, baseType: !52, size: 32, offset: 32)
!52 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !48, file: !47, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !53, identifier: "_ZTSN11__mbstate_tUt_E")
!53 = !{!54, !56}
!54 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !52, file: !47, line: 18, baseType: !55, size: 32)
!55 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !52, file: !47, line: 19, baseType: !57, size: 32)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 32, elements: !59)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !{!60}
!60 = !DISubrange(count: 4)
!61 = !DIFile(filename: "/usr/include/c++/11/cwchar", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!62 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !63, file: !61, line: 141)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !64, line: 20, baseType: !55)
!64 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!65 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !66, file: !61, line: 143)
!66 = !DISubprogram(name: "btowc", scope: !67, file: !67, line: 285, type: !68, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!67 = !DIFile(filename: "/usr/include/wchar.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!68 = !DISubroutineType(types: !69)
!69 = !{!63, !11}
!70 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !71, file: !61, line: 144)
!71 = !DISubprogram(name: "fgetwc", scope: !67, file: !67, line: 744, type: !72, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!72 = !DISubroutineType(types: !73)
!73 = !{!63, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !76, line: 5, baseType: !77)
!76 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!77 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !76, line: 4, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!78 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !79, file: !61, line: 145)
!79 = !DISubprogram(name: "fgetws", scope: !67, file: !67, line: 773, type: !80, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !84, !11, !85}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !82)
!85 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !74)
!86 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !87, file: !61, line: 146)
!87 = !DISubprogram(name: "fputwc", scope: !67, file: !67, line: 758, type: !88, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!88 = !DISubroutineType(types: !89)
!89 = !{!63, !83, !74}
!90 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !91, file: !61, line: 147)
!91 = !DISubprogram(name: "fputws", scope: !67, file: !67, line: 780, type: !92, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!92 = !DISubroutineType(types: !93)
!93 = !{!11, !94, !85}
!94 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !83)
!97 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !98, file: !61, line: 148)
!98 = !DISubprogram(name: "fwide", scope: !67, file: !67, line: 588, type: !99, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!99 = !DISubroutineType(types: !100)
!100 = !{!11, !74, !11}
!101 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !102, file: !61, line: 149)
!102 = !DISubprogram(name: "fwprintf", scope: !67, file: !67, line: 595, type: !103, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!103 = !DISubroutineType(types: !104)
!104 = !{!11, !85, !94, null}
!105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !106, file: !61, line: 150)
!106 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !67, file: !67, line: 657, type: !103, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !108, file: !61, line: 151)
!108 = !DISubprogram(name: "getwc", scope: !67, file: !67, line: 745, type: !72, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !110, file: !61, line: 152)
!110 = !DISubprogram(name: "getwchar", scope: !67, file: !67, line: 751, type: !111, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!111 = !DISubroutineType(types: !112)
!112 = !{!63}
!113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !114, file: !61, line: 153)
!114 = !DISubprogram(name: "mbrlen", scope: !67, file: !67, line: 308, type: !115, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!115 = !DISubroutineType(types: !116)
!116 = !{!117, !120, !117, !123}
!117 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !118, line: 62, baseType: !119)
!118 = !DIFile(filename: "/home/gabriel/Documents/hls-llvm-project/hls-build/lib/clang/7.0.0/include/stddef.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!119 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!120 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !121)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!122 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !58)
!123 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !124)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !126, file: !61, line: 154)
!126 = !DISubprogram(name: "mbrtowc", scope: !67, file: !67, line: 297, type: !127, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!127 = !DISubroutineType(types: !128)
!128 = !{!117, !84, !120, !117, !123}
!129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !130, file: !61, line: 155)
!130 = !DISubprogram(name: "mbsinit", scope: !67, file: !67, line: 293, type: !131, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!131 = !DISubroutineType(types: !132)
!132 = !{!11, !133}
!133 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !134, size: 64)
!134 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !44)
!135 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !136, file: !61, line: 156)
!136 = !DISubprogram(name: "mbsrtowcs", scope: !67, file: !67, line: 338, type: !137, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!137 = !DISubroutineType(types: !138)
!138 = !{!117, !84, !139, !117, !123}
!139 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !140)
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !142, file: !61, line: 157)
!142 = !DISubprogram(name: "putwc", scope: !67, file: !67, line: 759, type: !88, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !144, file: !61, line: 158)
!144 = !DISubprogram(name: "putwchar", scope: !67, file: !67, line: 765, type: !145, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!145 = !DISubroutineType(types: !146)
!146 = !{!63, !83}
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !148, file: !61, line: 160)
!148 = !DISubprogram(name: "swprintf", scope: !67, file: !67, line: 605, type: !149, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DISubroutineType(types: !150)
!150 = !{!11, !84, !117, !94, null}
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !152, file: !61, line: 162)
!152 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !67, file: !67, line: 664, type: !153, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DISubroutineType(types: !154)
!154 = !{!11, !94, !94, null}
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !156, file: !61, line: 163)
!156 = !DISubprogram(name: "ungetwc", scope: !67, file: !67, line: 788, type: !157, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DISubroutineType(types: !158)
!158 = !{!63, !63, !74}
!159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !160, file: !61, line: 164)
!160 = !DISubprogram(name: "vfwprintf", scope: !67, file: !67, line: 613, type: !161, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!161 = !DISubroutineType(types: !162)
!162 = !{!11, !85, !94, !163}
!163 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !164, size: 64)
!164 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !29, size: 192, flags: DIFlagTypePassByValue, elements: !165, identifier: "_ZTS13__va_list_tag")
!165 = !{!166, !167, !168, !170}
!166 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !164, file: !29, baseType: !55, size: 32)
!167 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !164, file: !29, baseType: !55, size: 32, offset: 32)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !164, file: !29, baseType: !169, size: 64, offset: 64)
!169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !164, file: !29, baseType: !169, size: 64, offset: 128)
!171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !172, file: !61, line: 166)
!172 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !67, file: !67, line: 711, type: !161, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!173 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !174, file: !61, line: 169)
!174 = !DISubprogram(name: "vswprintf", scope: !67, file: !67, line: 626, type: !175, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!175 = !DISubroutineType(types: !176)
!176 = !{!11, !84, !117, !94, !163}
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !178, file: !61, line: 172)
!178 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !67, file: !67, line: 718, type: !179, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!179 = !DISubroutineType(types: !180)
!180 = !{!11, !94, !94, !163}
!181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !182, file: !61, line: 174)
!182 = !DISubprogram(name: "vwprintf", scope: !67, file: !67, line: 621, type: !183, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!183 = !DISubroutineType(types: !184)
!184 = !{!11, !94, !163}
!185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !186, file: !61, line: 176)
!186 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !67, file: !67, line: 715, type: !183, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !188, file: !61, line: 178)
!188 = !DISubprogram(name: "wcrtomb", scope: !67, file: !67, line: 302, type: !189, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DISubroutineType(types: !190)
!190 = !{!117, !191, !83, !123}
!191 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !192)
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!193 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !194, file: !61, line: 179)
!194 = !DISubprogram(name: "wcscat", scope: !67, file: !67, line: 97, type: !195, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!195 = !DISubroutineType(types: !196)
!196 = !{!82, !84, !94}
!197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !198, file: !61, line: 180)
!198 = !DISubprogram(name: "wcscmp", scope: !67, file: !67, line: 106, type: !199, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!199 = !DISubroutineType(types: !200)
!200 = !{!11, !95, !95}
!201 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !202, file: !61, line: 181)
!202 = !DISubprogram(name: "wcscoll", scope: !67, file: !67, line: 131, type: !199, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !204, file: !61, line: 182)
!204 = !DISubprogram(name: "wcscpy", scope: !67, file: !67, line: 87, type: !195, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !206, file: !61, line: 183)
!206 = !DISubprogram(name: "wcscspn", scope: !67, file: !67, line: 188, type: !207, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!207 = !DISubroutineType(types: !208)
!208 = !{!117, !95, !95}
!209 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !210, file: !61, line: 184)
!210 = !DISubprogram(name: "wcsftime", scope: !67, file: !67, line: 852, type: !211, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!211 = !DISubroutineType(types: !212)
!212 = !{!117, !84, !117, !94, !213}
!213 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !214)
!214 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !215, size: 64)
!215 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !216)
!216 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !67, line: 83, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !218, file: !61, line: 185)
!218 = !DISubprogram(name: "wcslen", scope: !67, file: !67, line: 223, type: !219, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!219 = !DISubroutineType(types: !220)
!220 = !{!117, !95}
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !222, file: !61, line: 186)
!222 = !DISubprogram(name: "wcsncat", scope: !67, file: !67, line: 101, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!223 = !DISubroutineType(types: !224)
!224 = !{!82, !84, !94, !117}
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !226, file: !61, line: 187)
!226 = !DISubprogram(name: "wcsncmp", scope: !67, file: !67, line: 109, type: !227, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!227 = !DISubroutineType(types: !228)
!228 = !{!11, !95, !95, !117}
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !230, file: !61, line: 188)
!230 = !DISubprogram(name: "wcsncpy", scope: !67, file: !67, line: 92, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!231 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !232, file: !61, line: 189)
!232 = !DISubprogram(name: "wcsrtombs", scope: !67, file: !67, line: 344, type: !233, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!233 = !DISubroutineType(types: !234)
!234 = !{!117, !191, !235, !117, !123}
!235 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !236)
!236 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !238, file: !61, line: 190)
!238 = !DISubprogram(name: "wcsspn", scope: !67, file: !67, line: 192, type: !207, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !240, file: !61, line: 191)
!240 = !DISubprogram(name: "wcstod", scope: !67, file: !67, line: 378, type: !241, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!241 = !DISubroutineType(types: !242)
!242 = !{!32, !94, !243}
!243 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !244)
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !246, file: !61, line: 193)
!246 = !DISubprogram(name: "wcstof", scope: !67, file: !67, line: 383, type: !247, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!247 = !DISubroutineType(types: !248)
!248 = !{!249, !94, !243}
!249 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !251, file: !61, line: 195)
!251 = !DISubprogram(name: "wcstok", scope: !67, file: !67, line: 218, type: !252, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!252 = !DISubroutineType(types: !253)
!253 = !{!82, !84, !94, !243}
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !255, file: !61, line: 196)
!255 = !DISubprogram(name: "wcstol", scope: !67, file: !67, line: 429, type: !256, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!256 = !DISubroutineType(types: !257)
!257 = !{!258, !94, !243, !11}
!258 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !260, file: !61, line: 197)
!260 = !DISubprogram(name: "wcstoul", scope: !67, file: !67, line: 434, type: !261, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!261 = !DISubroutineType(types: !262)
!262 = !{!119, !94, !243, !11}
!263 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !264, file: !61, line: 198)
!264 = !DISubprogram(name: "wcsxfrm", scope: !67, file: !67, line: 135, type: !265, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!265 = !DISubroutineType(types: !266)
!266 = !{!117, !84, !94, !117}
!267 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !268, file: !61, line: 199)
!268 = !DISubprogram(name: "wctob", scope: !67, file: !67, line: 289, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!269 = !DISubroutineType(types: !270)
!270 = !{!11, !63}
!271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !272, file: !61, line: 200)
!272 = !DISubprogram(name: "wmemcmp", scope: !67, file: !67, line: 259, type: !227, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !274, file: !61, line: 201)
!274 = !DISubprogram(name: "wmemcpy", scope: !67, file: !67, line: 263, type: !223, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !276, file: !61, line: 202)
!276 = !DISubprogram(name: "wmemmove", scope: !67, file: !67, line: 268, type: !277, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!277 = !DISubroutineType(types: !278)
!278 = !{!82, !82, !95, !117}
!279 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !280, file: !61, line: 203)
!280 = !DISubprogram(name: "wmemset", scope: !67, file: !67, line: 272, type: !281, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!281 = !DISubroutineType(types: !282)
!282 = !{!82, !82, !83, !117}
!283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !284, file: !61, line: 204)
!284 = !DISubprogram(name: "wprintf", scope: !67, file: !67, line: 602, type: !285, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!285 = !DISubroutineType(types: !286)
!286 = !{!11, !94, null}
!287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !288, file: !61, line: 205)
!288 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !67, file: !67, line: 661, type: !285, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !290, file: !61, line: 206)
!290 = !DISubprogram(name: "wcschr", scope: !67, file: !67, line: 165, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!291 = !DISubroutineType(types: !292)
!292 = !{!82, !95, !83}
!293 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !294, file: !61, line: 207)
!294 = !DISubprogram(name: "wcspbrk", scope: !67, file: !67, line: 202, type: !295, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!295 = !DISubroutineType(types: !296)
!296 = !{!82, !95, !95}
!297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !298, file: !61, line: 208)
!298 = !DISubprogram(name: "wcsrchr", scope: !67, file: !67, line: 175, type: !291, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !300, file: !61, line: 209)
!300 = !DISubprogram(name: "wcsstr", scope: !67, file: !67, line: 213, type: !295, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !302, file: !61, line: 210)
!302 = !DISubprogram(name: "wmemchr", scope: !67, file: !67, line: 254, type: !303, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!303 = !DISubroutineType(types: !304)
!304 = !{!82, !95, !83, !117}
!305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !307, file: !61, line: 251)
!306 = !DINamespace(name: "__gnu_cxx", scope: null)
!307 = !DISubprogram(name: "wcstold", scope: !67, file: !67, line: 385, type: !308, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!308 = !DISubroutineType(types: !309)
!309 = !{!310, !94, !243}
!310 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !312, file: !61, line: 260)
!312 = !DISubprogram(name: "wcstoll", scope: !67, file: !67, line: 442, type: !313, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!313 = !DISubroutineType(types: !314)
!314 = !{!315, !94, !243, !11}
!315 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!316 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !317, file: !61, line: 261)
!317 = !DISubprogram(name: "wcstoull", scope: !67, file: !67, line: 449, type: !318, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!318 = !DISubroutineType(types: !319)
!319 = !{!320, !94, !243, !11}
!320 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !307, file: !61, line: 267)
!322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !312, file: !61, line: 268)
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !317, file: !61, line: 269)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !246, file: !61, line: 283)
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !172, file: !61, line: 286)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !178, file: !61, line: 289)
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !186, file: !61, line: 292)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !307, file: !61, line: 296)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !312, file: !61, line: 297)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !317, file: !61, line: 298)
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !332, file: !333, line: 68)
!332 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !334, file: !333, line: 90, size: 64, flags: DIFlagTypePassByReference, elements: !335, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!333 = !DIFile(filename: "/usr/include/c++/11/bits/exception_ptr.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!334 = !DINamespace(name: "__exception_ptr", scope: !2)
!335 = !{!336, !337, !341, !344, !345, !350, !351, !355, !361, !365, !369, !372, !373, !376, !379}
!336 = !DIDerivedType(tag: DW_TAG_member, name: "_M_exception_object", scope: !332, file: !333, line: 92, baseType: !169, size: 64)
!337 = !DISubprogram(name: "exception_ptr", scope: !332, file: !333, line: 94, type: !338, isLocal: false, isDefinition: false, scopeLine: 94, flags: DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!338 = !DISubroutineType(types: !339)
!339 = !{null, !340, !169}
!340 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !332, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!341 = !DISubprogram(name: "_M_addref", linkageName: "_ZNSt15__exception_ptr13exception_ptr9_M_addrefEv", scope: !332, file: !333, line: 96, type: !342, isLocal: false, isDefinition: false, scopeLine: 96, flags: DIFlagPrototyped, isOptimized: false)
!342 = !DISubroutineType(types: !343)
!343 = !{null, !340}
!344 = !DISubprogram(name: "_M_release", linkageName: "_ZNSt15__exception_ptr13exception_ptr10_M_releaseEv", scope: !332, file: !333, line: 97, type: !342, isLocal: false, isDefinition: false, scopeLine: 97, flags: DIFlagPrototyped, isOptimized: false)
!345 = !DISubprogram(name: "_M_get", linkageName: "_ZNKSt15__exception_ptr13exception_ptr6_M_getEv", scope: !332, file: !333, line: 99, type: !346, isLocal: false, isDefinition: false, scopeLine: 99, flags: DIFlagPrototyped, isOptimized: false)
!346 = !DISubroutineType(types: !347)
!347 = !{!169, !348}
!348 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !349, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!349 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !332)
!350 = !DISubprogram(name: "exception_ptr", scope: !332, file: !333, line: 107, type: !342, isLocal: false, isDefinition: false, scopeLine: 107, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!351 = !DISubprogram(name: "exception_ptr", scope: !332, file: !333, line: 109, type: !352, isLocal: false, isDefinition: false, scopeLine: 109, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!352 = !DISubroutineType(types: !353)
!353 = !{null, !340, !354}
!354 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !349, size: 64)
!355 = !DISubprogram(name: "exception_ptr", scope: !332, file: !333, line: 112, type: !356, isLocal: false, isDefinition: false, scopeLine: 112, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!356 = !DISubroutineType(types: !357)
!357 = !{null, !340, !358}
!358 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !2, file: !359, line: 302, baseType: !360)
!359 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/12/../../../../include/x86_64-linux-gnu/c++/12/bits/c++config.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!360 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!361 = !DISubprogram(name: "exception_ptr", scope: !332, file: !333, line: 116, type: !362, isLocal: false, isDefinition: false, scopeLine: 116, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!362 = !DISubroutineType(types: !363)
!363 = !{null, !340, !364}
!364 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !332, size: 64)
!365 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSERKS0_", scope: !332, file: !333, line: 129, type: !366, isLocal: false, isDefinition: false, scopeLine: 129, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!366 = !DISubroutineType(types: !367)
!367 = !{!368, !340, !354}
!368 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !332, size: 64)
!369 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSEOS0_", scope: !332, file: !333, line: 133, type: !370, isLocal: false, isDefinition: false, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!370 = !DISubroutineType(types: !371)
!371 = !{!368, !340, !364}
!372 = !DISubprogram(name: "~exception_ptr", scope: !332, file: !333, line: 140, type: !342, isLocal: false, isDefinition: false, scopeLine: 140, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!373 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr13exception_ptr4swapERS0_", scope: !332, file: !333, line: 143, type: !374, isLocal: false, isDefinition: false, scopeLine: 143, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!374 = !DISubroutineType(types: !375)
!375 = !{null, !340, !368}
!376 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt15__exception_ptr13exception_ptrcvbEv", scope: !332, file: !333, line: 155, type: !377, isLocal: false, isDefinition: false, scopeLine: 155, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, isOptimized: false)
!377 = !DISubroutineType(types: !378)
!378 = !{!13, !348}
!379 = !DISubprogram(name: "__cxa_exception_type", linkageName: "_ZNKSt15__exception_ptr13exception_ptr20__cxa_exception_typeEv", scope: !332, file: !333, line: 176, type: !380, isLocal: false, isDefinition: false, scopeLine: 176, flags: DIFlagPublic | DIFlagPrototyped, isOptimized: false)
!380 = !DISubroutineType(types: !381)
!381 = !{!382, !348}
!382 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !383, size: 64)
!383 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !384)
!384 = !DICompositeType(tag: DW_TAG_class_type, name: "type_info", scope: !2, file: !385, line: 88, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt9type_info")
!385 = !DIFile(filename: "/usr/include/c++/11/typeinfo", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !334, entity: !387, file: !333, line: 84)
!387 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !2, file: !333, line: 80, type: !388, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!388 = !DISubroutineType(types: !389)
!389 = !{null, !332}
!390 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !391, entity: !392, file: !393, line: 58)
!391 = !DINamespace(name: "__gnu_debug", scope: null)
!392 = !DINamespace(name: "__debug", scope: !2)
!393 = !DIFile(filename: "/usr/include/c++/11/debug/debug.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !395, file: !400, line: 47)
!395 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !396, line: 24, baseType: !397)
!396 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!397 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !398, line: 37, baseType: !399)
!398 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!399 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!400 = !DIFile(filename: "/usr/include/c++/11/cstdint", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!401 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !402, file: !400, line: 48)
!402 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !396, line: 25, baseType: !403)
!403 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !398, line: 39, baseType: !404)
!404 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!405 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !406, file: !400, line: 49)
!406 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !396, line: 26, baseType: !407)
!407 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !398, line: 41, baseType: !11)
!408 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !409, file: !400, line: 50)
!409 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !396, line: 27, baseType: !410)
!410 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !398, line: 44, baseType: !258)
!411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !412, file: !400, line: 52)
!412 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !413, line: 58, baseType: !399)
!413 = !DIFile(filename: "/usr/include/stdint.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!414 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !415, file: !400, line: 53)
!415 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !413, line: 60, baseType: !258)
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !417, file: !400, line: 54)
!417 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !413, line: 61, baseType: !258)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !419, file: !400, line: 55)
!419 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !413, line: 62, baseType: !258)
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !421, file: !400, line: 57)
!421 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !413, line: 43, baseType: !422)
!422 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !398, line: 52, baseType: !397)
!423 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !424, file: !400, line: 58)
!424 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !413, line: 44, baseType: !425)
!425 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !398, line: 54, baseType: !403)
!426 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !427, file: !400, line: 59)
!427 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !413, line: 45, baseType: !428)
!428 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !398, line: 56, baseType: !407)
!429 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !430, file: !400, line: 60)
!430 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !413, line: 46, baseType: !431)
!431 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !398, line: 58, baseType: !410)
!432 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !433, file: !400, line: 62)
!433 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !413, line: 101, baseType: !434)
!434 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !398, line: 72, baseType: !258)
!435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !436, file: !400, line: 63)
!436 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !413, line: 87, baseType: !258)
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !438, file: !400, line: 65)
!438 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !439, line: 24, baseType: !440)
!439 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!440 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !398, line: 38, baseType: !441)
!441 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !443, file: !400, line: 66)
!443 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !439, line: 25, baseType: !444)
!444 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !398, line: 40, baseType: !445)
!445 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !447, file: !400, line: 67)
!447 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !439, line: 26, baseType: !448)
!448 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !398, line: 42, baseType: !55)
!449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !450, file: !400, line: 68)
!450 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !439, line: 27, baseType: !451)
!451 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !398, line: 45, baseType: !119)
!452 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !453, file: !400, line: 70)
!453 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !413, line: 71, baseType: !441)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !455, file: !400, line: 71)
!455 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !413, line: 73, baseType: !119)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !457, file: !400, line: 72)
!457 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !413, line: 74, baseType: !119)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !459, file: !400, line: 73)
!459 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !413, line: 75, baseType: !119)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !461, file: !400, line: 75)
!461 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !413, line: 49, baseType: !462)
!462 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !398, line: 53, baseType: !440)
!463 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !464, file: !400, line: 76)
!464 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !413, line: 50, baseType: !465)
!465 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !398, line: 55, baseType: !444)
!466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !467, file: !400, line: 77)
!467 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !413, line: 51, baseType: !468)
!468 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !398, line: 57, baseType: !448)
!469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !470, file: !400, line: 78)
!470 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !413, line: 52, baseType: !471)
!471 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !398, line: 59, baseType: !451)
!472 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !473, file: !400, line: 80)
!473 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !413, line: 102, baseType: !474)
!474 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !398, line: 73, baseType: !119)
!475 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !476, file: !400, line: 81)
!476 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !413, line: 90, baseType: !119)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !478, file: !480, line: 53)
!478 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !479, line: 51, size: 768, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!479 = !DIFile(filename: "/usr/include/locale.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!480 = !DIFile(filename: "/usr/include/c++/11/clocale", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !482, file: !480, line: 54)
!482 = !DISubprogram(name: "setlocale", scope: !479, file: !479, line: 122, type: !483, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!483 = !DISubroutineType(types: !484)
!484 = !{!192, !11, !121}
!485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !486, file: !480, line: 55)
!486 = !DISubprogram(name: "localeconv", scope: !479, file: !479, line: 125, type: !487, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!487 = !DISubroutineType(types: !488)
!488 = !{!489}
!489 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !478, size: 64)
!490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !491, file: !495, line: 64)
!491 = !DISubprogram(name: "isalnum", scope: !492, file: !492, line: 108, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!492 = !DIFile(filename: "/usr/include/ctype.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!493 = !DISubroutineType(types: !494)
!494 = !{!11, !11}
!495 = !DIFile(filename: "/usr/include/c++/11/cctype", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !497, file: !495, line: 65)
!497 = !DISubprogram(name: "isalpha", scope: !492, file: !492, line: 109, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !499, file: !495, line: 66)
!499 = !DISubprogram(name: "iscntrl", scope: !492, file: !492, line: 110, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !501, file: !495, line: 67)
!501 = !DISubprogram(name: "isdigit", scope: !492, file: !492, line: 111, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !503, file: !495, line: 68)
!503 = !DISubprogram(name: "isgraph", scope: !492, file: !492, line: 113, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !505, file: !495, line: 69)
!505 = !DISubprogram(name: "islower", scope: !492, file: !492, line: 112, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !507, file: !495, line: 70)
!507 = !DISubprogram(name: "isprint", scope: !492, file: !492, line: 114, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !509, file: !495, line: 71)
!509 = !DISubprogram(name: "ispunct", scope: !492, file: !492, line: 115, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !511, file: !495, line: 72)
!511 = !DISubprogram(name: "isspace", scope: !492, file: !492, line: 116, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !513, file: !495, line: 73)
!513 = !DISubprogram(name: "isupper", scope: !492, file: !492, line: 117, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !515, file: !495, line: 74)
!515 = !DISubprogram(name: "isxdigit", scope: !492, file: !492, line: 118, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !517, file: !495, line: 75)
!517 = !DISubprogram(name: "tolower", scope: !492, file: !492, line: 122, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !519, file: !495, line: 76)
!519 = !DISubprogram(name: "toupper", scope: !492, file: !492, line: 125, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !521, file: !495, line: 87)
!521 = !DISubprogram(name: "isblank", scope: !492, file: !492, line: 130, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !523, file: !525, line: 52)
!523 = !DISubprogram(name: "abs", scope: !524, file: !524, line: 848, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!524 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!525 = !DIFile(filename: "/usr/include/c++/11/bits/std_abs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !527, file: !529, line: 127)
!527 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !524, line: 63, baseType: !528)
!528 = !DICompositeType(tag: DW_TAG_structure_type, file: !524, line: 59, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!529 = !DIFile(filename: "/usr/include/c++/11/cstdlib", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !531, file: !529, line: 128)
!531 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !524, line: 71, baseType: !532)
!532 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !524, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !533, identifier: "_ZTS6ldiv_t")
!533 = !{!534, !535}
!534 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !532, file: !524, line: 69, baseType: !258, size: 64)
!535 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !532, file: !524, line: 70, baseType: !258, size: 64, offset: 64)
!536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !537, file: !529, line: 130)
!537 = !DISubprogram(name: "abort", scope: !524, file: !524, line: 598, type: !538, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!538 = !DISubroutineType(types: !539)
!539 = !{null}
!540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !541, file: !529, line: 134)
!541 = !DISubprogram(name: "atexit", scope: !524, file: !524, line: 602, type: !542, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!542 = !DISubroutineType(types: !543)
!543 = !{!11, !544}
!544 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !538, size: 64)
!545 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !546, file: !529, line: 137)
!546 = !DISubprogram(name: "at_quick_exit", scope: !524, file: !524, line: 607, type: !542, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !548, file: !529, line: 140)
!548 = !DISubprogram(name: "atof", scope: !524, file: !524, line: 102, type: !549, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!549 = !DISubroutineType(types: !550)
!550 = !{!32, !121}
!551 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !552, file: !529, line: 141)
!552 = !DISubprogram(name: "atoi", scope: !524, file: !524, line: 105, type: !553, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!553 = !DISubroutineType(types: !554)
!554 = !{!11, !121}
!555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !556, file: !529, line: 142)
!556 = !DISubprogram(name: "atol", scope: !524, file: !524, line: 108, type: !557, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!557 = !DISubroutineType(types: !558)
!558 = !{!258, !121}
!559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !560, file: !529, line: 143)
!560 = !DISubprogram(name: "bsearch", scope: !524, file: !524, line: 828, type: !561, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!561 = !DISubroutineType(types: !562)
!562 = !{!169, !563, !563, !117, !117, !565}
!563 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !564, size: 64)
!564 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!565 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !524, line: 816, baseType: !566)
!566 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !567, size: 64)
!567 = !DISubroutineType(types: !568)
!568 = !{!11, !563, !563}
!569 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !570, file: !529, line: 144)
!570 = !DISubprogram(name: "calloc", scope: !524, file: !524, line: 543, type: !571, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!571 = !DISubroutineType(types: !572)
!572 = !{!169, !117, !117}
!573 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !574, file: !529, line: 145)
!574 = !DISubprogram(name: "div", scope: !524, file: !524, line: 860, type: !575, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!575 = !DISubroutineType(types: !576)
!576 = !{!527, !11, !11}
!577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !578, file: !529, line: 146)
!578 = !DISubprogram(name: "exit", scope: !524, file: !524, line: 624, type: !579, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!579 = !DISubroutineType(types: !580)
!580 = !{null, !11}
!581 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !582, file: !529, line: 147)
!582 = !DISubprogram(name: "free", scope: !524, file: !524, line: 555, type: !583, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!583 = !DISubroutineType(types: !584)
!584 = !{null, !169}
!585 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !586, file: !529, line: 148)
!586 = !DISubprogram(name: "getenv", scope: !524, file: !524, line: 641, type: !587, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!587 = !DISubroutineType(types: !588)
!588 = !{!192, !121}
!589 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !590, file: !529, line: 149)
!590 = !DISubprogram(name: "labs", scope: !524, file: !524, line: 849, type: !591, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!591 = !DISubroutineType(types: !592)
!592 = !{!258, !258}
!593 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !594, file: !529, line: 150)
!594 = !DISubprogram(name: "ldiv", scope: !524, file: !524, line: 862, type: !595, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!595 = !DISubroutineType(types: !596)
!596 = !{!531, !258, !258}
!597 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !598, file: !529, line: 151)
!598 = !DISubprogram(name: "malloc", scope: !524, file: !524, line: 540, type: !599, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!599 = !DISubroutineType(types: !600)
!600 = !{!169, !117}
!601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !602, file: !529, line: 153)
!602 = !DISubprogram(name: "mblen", scope: !524, file: !524, line: 930, type: !603, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!603 = !DISubroutineType(types: !604)
!604 = !{!11, !121, !117}
!605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !606, file: !529, line: 154)
!606 = !DISubprogram(name: "mbstowcs", scope: !524, file: !524, line: 941, type: !607, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!607 = !DISubroutineType(types: !608)
!608 = !{!117, !84, !120, !117}
!609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !610, file: !529, line: 155)
!610 = !DISubprogram(name: "mbtowc", scope: !524, file: !524, line: 933, type: !611, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!611 = !DISubroutineType(types: !612)
!612 = !{!11, !84, !120, !117}
!613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !614, file: !529, line: 157)
!614 = !DISubprogram(name: "qsort", scope: !524, file: !524, line: 838, type: !615, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!615 = !DISubroutineType(types: !616)
!616 = !{null, !169, !117, !117, !565}
!617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !618, file: !529, line: 160)
!618 = !DISubprogram(name: "quick_exit", scope: !524, file: !524, line: 630, type: !579, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !620, file: !529, line: 163)
!620 = !DISubprogram(name: "rand", scope: !524, file: !524, line: 454, type: !621, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!621 = !DISubroutineType(types: !622)
!622 = !{!11}
!623 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !624, file: !529, line: 164)
!624 = !DISubprogram(name: "realloc", scope: !524, file: !524, line: 551, type: !625, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!625 = !DISubroutineType(types: !626)
!626 = !{!169, !169, !117}
!627 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !628, file: !529, line: 165)
!628 = !DISubprogram(name: "srand", scope: !524, file: !524, line: 456, type: !629, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!629 = !DISubroutineType(types: !630)
!630 = !{null, !55}
!631 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !632, file: !529, line: 166)
!632 = !DISubprogram(name: "strtod", scope: !524, file: !524, line: 118, type: !633, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!633 = !DISubroutineType(types: !634)
!634 = !{!32, !120, !635}
!635 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !636)
!636 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !192, size: 64)
!637 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !638, file: !529, line: 167)
!638 = !DISubprogram(name: "strtol", scope: !524, file: !524, line: 177, type: !639, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!639 = !DISubroutineType(types: !640)
!640 = !{!258, !120, !635, !11}
!641 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !642, file: !529, line: 168)
!642 = !DISubprogram(name: "strtoul", scope: !524, file: !524, line: 181, type: !643, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!643 = !DISubroutineType(types: !644)
!644 = !{!119, !120, !635, !11}
!645 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !646, file: !529, line: 169)
!646 = !DISubprogram(name: "system", scope: !524, file: !524, line: 791, type: !553, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !648, file: !529, line: 171)
!648 = !DISubprogram(name: "wcstombs", scope: !524, file: !524, line: 945, type: !649, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!649 = !DISubroutineType(types: !650)
!650 = !{!117, !191, !94, !117}
!651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !652, file: !529, line: 172)
!652 = !DISubprogram(name: "wctomb", scope: !524, file: !524, line: 937, type: !653, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!653 = !DISubroutineType(types: !654)
!654 = !{!11, !192, !83}
!655 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !656, file: !529, line: 200)
!656 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !524, line: 81, baseType: !657)
!657 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !524, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !658, identifier: "_ZTS7lldiv_t")
!658 = !{!659, !660}
!659 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !657, file: !524, line: 79, baseType: !315, size: 64)
!660 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !657, file: !524, line: 80, baseType: !315, size: 64, offset: 64)
!661 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !662, file: !529, line: 206)
!662 = !DISubprogram(name: "_Exit", scope: !524, file: !524, line: 636, type: !579, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !664, file: !529, line: 210)
!664 = !DISubprogram(name: "llabs", scope: !524, file: !524, line: 852, type: !665, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!665 = !DISubroutineType(types: !666)
!666 = !{!315, !315}
!667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !668, file: !529, line: 216)
!668 = !DISubprogram(name: "lldiv", scope: !524, file: !524, line: 866, type: !669, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!669 = !DISubroutineType(types: !670)
!670 = !{!656, !315, !315}
!671 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !672, file: !529, line: 227)
!672 = !DISubprogram(name: "atoll", scope: !524, file: !524, line: 113, type: !673, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!673 = !DISubroutineType(types: !674)
!674 = !{!315, !121}
!675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !676, file: !529, line: 228)
!676 = !DISubprogram(name: "strtoll", scope: !524, file: !524, line: 201, type: !677, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!677 = !DISubroutineType(types: !678)
!678 = !{!315, !120, !635, !11}
!679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !680, file: !529, line: 229)
!680 = !DISubprogram(name: "strtoull", scope: !524, file: !524, line: 206, type: !681, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!681 = !DISubroutineType(types: !682)
!682 = !{!320, !120, !635, !11}
!683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !684, file: !529, line: 231)
!684 = !DISubprogram(name: "strtof", scope: !524, file: !524, line: 124, type: !685, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!685 = !DISubroutineType(types: !686)
!686 = !{!249, !120, !635}
!687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !688, file: !529, line: 232)
!688 = !DISubprogram(name: "strtold", scope: !524, file: !524, line: 127, type: !689, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!689 = !DISubroutineType(types: !690)
!690 = !{!310, !120, !635}
!691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !656, file: !529, line: 240)
!692 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !662, file: !529, line: 242)
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !664, file: !529, line: 244)
!694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !695, file: !529, line: 245)
!695 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !306, file: !529, line: 213, type: !669, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!696 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !668, file: !529, line: 246)
!697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !672, file: !529, line: 248)
!698 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !684, file: !529, line: 249)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !676, file: !529, line: 250)
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !680, file: !529, line: 251)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !688, file: !529, line: 252)
!702 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !703, file: !705, line: 98)
!703 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !704, line: 7, baseType: !77)
!704 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!705 = !DIFile(filename: "/usr/include/c++/11/cstdio", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !707, file: !705, line: 99)
!707 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !708, line: 84, baseType: !709)
!708 = !DIFile(filename: "/usr/include/stdio.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!709 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !710, line: 14, baseType: !711)
!710 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!711 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !710, line: 10, size: 128, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !713, file: !705, line: 101)
!713 = !DISubprogram(name: "clearerr", scope: !708, file: !708, line: 786, type: !714, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!714 = !DISubroutineType(types: !715)
!715 = !{null, !716}
!716 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !703, size: 64)
!717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !718, file: !705, line: 102)
!718 = !DISubprogram(name: "fclose", scope: !708, file: !708, line: 178, type: !719, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!719 = !DISubroutineType(types: !720)
!720 = !{!11, !716}
!721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !722, file: !705, line: 103)
!722 = !DISubprogram(name: "feof", scope: !708, file: !708, line: 788, type: !719, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !724, file: !705, line: 104)
!724 = !DISubprogram(name: "ferror", scope: !708, file: !708, line: 790, type: !719, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !726, file: !705, line: 105)
!726 = !DISubprogram(name: "fflush", scope: !708, file: !708, line: 230, type: !719, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !728, file: !705, line: 106)
!728 = !DISubprogram(name: "fgetc", scope: !708, file: !708, line: 513, type: !719, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !730, file: !705, line: 107)
!730 = !DISubprogram(name: "fgetpos", scope: !708, file: !708, line: 760, type: !731, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!731 = !DISubroutineType(types: !732)
!732 = !{!11, !733, !734}
!733 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !716)
!734 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !735)
!735 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !707, size: 64)
!736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !737, file: !705, line: 108)
!737 = !DISubprogram(name: "fgets", scope: !708, file: !708, line: 592, type: !738, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!738 = !DISubroutineType(types: !739)
!739 = !{!192, !191, !11, !733}
!740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !741, file: !705, line: 109)
!741 = !DISubprogram(name: "fopen", scope: !708, file: !708, line: 258, type: !742, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!742 = !DISubroutineType(types: !743)
!743 = !{!716, !120, !120}
!744 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !745, file: !705, line: 110)
!745 = !DISubprogram(name: "fprintf", scope: !708, file: !708, line: 350, type: !746, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!746 = !DISubroutineType(types: !747)
!747 = !{!11, !733, !120, null}
!748 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !749, file: !705, line: 111)
!749 = !DISubprogram(name: "fputc", scope: !708, file: !708, line: 549, type: !750, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!750 = !DISubroutineType(types: !751)
!751 = !{!11, !11, !716}
!752 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !753, file: !705, line: 112)
!753 = !DISubprogram(name: "fputs", scope: !708, file: !708, line: 655, type: !754, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!754 = !DISubroutineType(types: !755)
!755 = !{!11, !120, !733}
!756 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !757, file: !705, line: 113)
!757 = !DISubprogram(name: "fread", scope: !708, file: !708, line: 675, type: !758, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!758 = !DISubroutineType(types: !759)
!759 = !{!117, !760, !117, !117, !733}
!760 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !169)
!761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !762, file: !705, line: 114)
!762 = !DISubprogram(name: "freopen", scope: !708, file: !708, line: 265, type: !763, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!763 = !DISubroutineType(types: !764)
!764 = !{!716, !120, !120, !733}
!765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !766, file: !705, line: 115)
!766 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !708, file: !708, line: 434, type: !746, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !768, file: !705, line: 116)
!768 = !DISubprogram(name: "fseek", scope: !708, file: !708, line: 713, type: !769, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!769 = !DISubroutineType(types: !770)
!770 = !{!11, !716, !258, !11}
!771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !772, file: !705, line: 117)
!772 = !DISubprogram(name: "fsetpos", scope: !708, file: !708, line: 765, type: !773, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!773 = !DISubroutineType(types: !774)
!774 = !{!11, !716, !775}
!775 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !776, size: 64)
!776 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !707)
!777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !778, file: !705, line: 118)
!778 = !DISubprogram(name: "ftell", scope: !708, file: !708, line: 718, type: !779, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!779 = !DISubroutineType(types: !780)
!780 = !{!258, !716}
!781 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !782, file: !705, line: 119)
!782 = !DISubprogram(name: "fwrite", scope: !708, file: !708, line: 681, type: !783, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!783 = !DISubroutineType(types: !784)
!784 = !{!117, !785, !117, !117, !733}
!785 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !563)
!786 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !787, file: !705, line: 120)
!787 = !DISubprogram(name: "getc", scope: !708, file: !708, line: 514, type: !719, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !789, file: !705, line: 121)
!789 = !DISubprogram(name: "getchar", scope: !708, file: !708, line: 520, type: !621, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !791, file: !705, line: 126)
!791 = !DISubprogram(name: "perror", scope: !708, file: !708, line: 804, type: !792, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!792 = !DISubroutineType(types: !793)
!793 = !{null, !121}
!794 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !795, file: !705, line: 127)
!795 = !DISubprogram(name: "printf", scope: !708, file: !708, line: 356, type: !796, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!796 = !DISubroutineType(types: !797)
!797 = !{!11, !120, null}
!798 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !799, file: !705, line: 128)
!799 = !DISubprogram(name: "putc", scope: !708, file: !708, line: 550, type: !750, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !801, file: !705, line: 129)
!801 = !DISubprogram(name: "putchar", scope: !708, file: !708, line: 556, type: !493, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !803, file: !705, line: 130)
!803 = !DISubprogram(name: "puts", scope: !708, file: !708, line: 661, type: !553, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !805, file: !705, line: 131)
!805 = !DISubprogram(name: "remove", scope: !708, file: !708, line: 152, type: !553, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !807, file: !705, line: 132)
!807 = !DISubprogram(name: "rename", scope: !708, file: !708, line: 154, type: !808, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!808 = !DISubroutineType(types: !809)
!809 = !{!11, !121, !121}
!810 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !811, file: !705, line: 133)
!811 = !DISubprogram(name: "rewind", scope: !708, file: !708, line: 723, type: !714, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !813, file: !705, line: 134)
!813 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !708, file: !708, line: 437, type: !796, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !815, file: !705, line: 135)
!815 = !DISubprogram(name: "setbuf", scope: !708, file: !708, line: 328, type: !816, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!816 = !DISubroutineType(types: !817)
!817 = !{null, !733, !191}
!818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !819, file: !705, line: 136)
!819 = !DISubprogram(name: "setvbuf", scope: !708, file: !708, line: 332, type: !820, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!820 = !DISubroutineType(types: !821)
!821 = !{!11, !733, !191, !11, !117}
!822 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !823, file: !705, line: 137)
!823 = !DISubprogram(name: "sprintf", scope: !708, file: !708, line: 358, type: !824, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!824 = !DISubroutineType(types: !825)
!825 = !{!11, !191, !120, null}
!826 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !827, file: !705, line: 138)
!827 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !708, file: !708, line: 439, type: !828, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!828 = !DISubroutineType(types: !829)
!829 = !{!11, !120, !120, null}
!830 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !831, file: !705, line: 139)
!831 = !DISubprogram(name: "tmpfile", scope: !708, file: !708, line: 188, type: !832, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!832 = !DISubroutineType(types: !833)
!833 = !{!716}
!834 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !835, file: !705, line: 141)
!835 = !DISubprogram(name: "tmpnam", scope: !708, file: !708, line: 205, type: !836, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!836 = !DISubroutineType(types: !837)
!837 = !{!192, !192}
!838 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !839, file: !705, line: 143)
!839 = !DISubprogram(name: "ungetc", scope: !708, file: !708, line: 668, type: !750, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !841, file: !705, line: 144)
!841 = !DISubprogram(name: "vfprintf", scope: !708, file: !708, line: 365, type: !842, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!842 = !DISubroutineType(types: !843)
!843 = !{!11, !733, !120, !163}
!844 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !845, file: !705, line: 145)
!845 = !DISubprogram(name: "vprintf", scope: !708, file: !708, line: 371, type: !846, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!846 = !DISubroutineType(types: !847)
!847 = !{!11, !120, !163}
!848 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !849, file: !705, line: 146)
!849 = !DISubprogram(name: "vsprintf", scope: !708, file: !708, line: 373, type: !850, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!850 = !DISubroutineType(types: !851)
!851 = !{!11, !191, !120, !163}
!852 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !853, file: !705, line: 175)
!853 = !DISubprogram(name: "snprintf", scope: !708, file: !708, line: 378, type: !854, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!854 = !DISubroutineType(types: !855)
!855 = !{!11, !191, !117, !120, null}
!856 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !857, file: !705, line: 176)
!857 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !708, file: !708, line: 479, type: !842, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !859, file: !705, line: 177)
!859 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !708, file: !708, line: 484, type: !846, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !861, file: !705, line: 178)
!861 = !DISubprogram(name: "vsnprintf", scope: !708, file: !708, line: 382, type: !862, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!862 = !DISubroutineType(types: !863)
!863 = !{!11, !191, !117, !120, !163}
!864 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !306, entity: !865, file: !705, line: 179)
!865 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !708, file: !708, line: 487, type: !866, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!866 = !DISubroutineType(types: !867)
!867 = !{!11, !120, !120, !163}
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !853, file: !705, line: 185)
!869 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !857, file: !705, line: 186)
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !859, file: !705, line: 187)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !861, file: !705, line: 188)
!872 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !865, file: !705, line: 189)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !874, file: !878, line: 82)
!874 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !875, line: 48, baseType: !876)
!875 = !DIFile(filename: "/usr/include/wctype.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!876 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !877, size: 64)
!877 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !407)
!878 = !DIFile(filename: "/usr/include/c++/11/cwctype", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!879 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !880, file: !878, line: 83)
!880 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !881, line: 38, baseType: !119)
!881 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!882 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !63, file: !878, line: 84)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !884, file: !878, line: 86)
!884 = !DISubprogram(name: "iswalnum", scope: !881, file: !881, line: 95, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !886, file: !878, line: 87)
!886 = !DISubprogram(name: "iswalpha", scope: !881, file: !881, line: 101, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !888, file: !878, line: 89)
!888 = !DISubprogram(name: "iswblank", scope: !881, file: !881, line: 146, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !890, file: !878, line: 91)
!890 = !DISubprogram(name: "iswcntrl", scope: !881, file: !881, line: 104, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !892, file: !878, line: 92)
!892 = !DISubprogram(name: "iswctype", scope: !881, file: !881, line: 159, type: !893, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!893 = !DISubroutineType(types: !894)
!894 = !{!11, !63, !880}
!895 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !896, file: !878, line: 93)
!896 = !DISubprogram(name: "iswdigit", scope: !881, file: !881, line: 108, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !898, file: !878, line: 94)
!898 = !DISubprogram(name: "iswgraph", scope: !881, file: !881, line: 112, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !900, file: !878, line: 95)
!900 = !DISubprogram(name: "iswlower", scope: !881, file: !881, line: 117, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !902, file: !878, line: 96)
!902 = !DISubprogram(name: "iswprint", scope: !881, file: !881, line: 120, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !904, file: !878, line: 97)
!904 = !DISubprogram(name: "iswpunct", scope: !881, file: !881, line: 125, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !906, file: !878, line: 98)
!906 = !DISubprogram(name: "iswspace", scope: !881, file: !881, line: 130, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !908, file: !878, line: 99)
!908 = !DISubprogram(name: "iswupper", scope: !881, file: !881, line: 135, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !910, file: !878, line: 100)
!910 = !DISubprogram(name: "iswxdigit", scope: !881, file: !881, line: 140, type: !269, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !912, file: !878, line: 101)
!912 = !DISubprogram(name: "towctrans", scope: !875, file: !875, line: 55, type: !913, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!913 = !DISubroutineType(types: !914)
!914 = !{!63, !63, !874}
!915 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !916, file: !878, line: 102)
!916 = !DISubprogram(name: "towlower", scope: !881, file: !881, line: 166, type: !917, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!917 = !DISubroutineType(types: !918)
!918 = !{!63, !63}
!919 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !920, file: !878, line: 103)
!920 = !DISubprogram(name: "towupper", scope: !881, file: !881, line: 169, type: !917, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !922, file: !878, line: 104)
!922 = !DISubprogram(name: "wctrans", scope: !875, file: !875, line: 52, type: !923, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!923 = !DISubroutineType(types: !924)
!924 = !{!874, !121}
!925 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !926, file: !878, line: 105)
!926 = !DISubprogram(name: "wctype", scope: !881, file: !881, line: 155, type: !927, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!927 = !DISubroutineType(types: !928)
!928 = !{!880, !121}
!929 = !{i32 2, !"Dwarf Version", i32 4}
!930 = !{i32 2, !"Debug Info Version", i32 3}
!931 = !{i32 1, !"wchar_size", i32 4}
!932 = !{i32 7, !"PIC Level", i32 2}
!933 = !{!"clang version 7.0.0 "}
!934 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !3, file: !3, line: 74, type: !538, isLocal: true, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!935 = !DILocation(line: 74, column: 25, scope: !934)
!936 = distinct !DISubprogram(name: "dotProduct", linkageName: "_Z10dotProductPfS_m", scope: !29, file: !29, line: 26, type: !937, isLocal: false, isDefinition: true, scopeLine: 27, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!937 = !DISubroutineType(types: !938)
!938 = !{!249, !939, !941, !943}
!939 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !940, size: 64)
!940 = !DIDerivedType(tag: DW_TAG_typedef, name: "FeatureType", file: !36, line: 22, baseType: !249)
!941 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !942, size: 64)
!942 = !DIDerivedType(tag: DW_TAG_typedef, name: "DataType", file: !36, line: 23, baseType: !249)
!943 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !117)
!944 = !DILocalVariable(name: "param_vector", arg: 1, scope: !936, file: !29, line: 26, type: !939)
!945 = !DILocation(line: 26, column: 31, scope: !936)
!946 = !DILocalVariable(name: "data_point_i", arg: 2, scope: !936, file: !29, line: 26, type: !941)
!947 = !DILocation(line: 26, column: 55, scope: !936)
!948 = !DILocalVariable(name: "num_features", arg: 3, scope: !936, file: !29, line: 26, type: !943)
!949 = !DILocation(line: 26, column: 82, scope: !936)
!950 = !DILocalVariable(name: "result", scope: !936, file: !29, line: 28, type: !940)
!951 = !DILocation(line: 28, column: 15, scope: !936)
!952 = !DILocalVariable(name: "i", scope: !953, file: !29, line: 30, type: !11)
!953 = distinct !DILexicalBlock(scope: !936, file: !29, line: 30, column: 3)
!954 = !DILocation(line: 30, column: 12, scope: !953)
!955 = !DILocation(line: 30, column: 8, scope: !953)
!956 = !DILocation(line: 30, column: 19, scope: !957)
!957 = distinct !DILexicalBlock(scope: !953, file: !29, line: 30, column: 3)
!958 = !DILocation(line: 30, column: 23, scope: !957)
!959 = !DILocation(line: 30, column: 21, scope: !957)
!960 = !DILocation(line: 30, column: 3, scope: !953)
!961 = !DILocation(line: 31, column: 15, scope: !957)
!962 = !DILocation(line: 31, column: 28, scope: !957)
!963 = !DILocation(line: 31, column: 33, scope: !957)
!964 = !DILocation(line: 31, column: 46, scope: !957)
!965 = !DILocation(line: 31, column: 31, scope: !957)
!966 = !DILocation(line: 31, column: 12, scope: !957)
!967 = !DILocation(line: 31, column: 5, scope: !957)
!968 = !DILocation(line: 30, column: 39, scope: !957)
!969 = !DILocation(line: 30, column: 3, scope: !957)
!970 = distinct !{!970, !960, !971}
!971 = !DILocation(line: 31, column: 47, scope: !953)
!972 = !DILocation(line: 33, column: 10, scope: !936)
!973 = !DILocation(line: 33, column: 3, scope: !936)
!974 = distinct !DISubprogram(name: "getPrediction", linkageName: "_Z13getPredictionPfS_md", scope: !29, file: !29, line: 37, type: !975, isLocal: false, isDefinition: true, scopeLine: 38, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!975 = !DISubroutineType(types: !976)
!976 = !{!977, !939, !941, !117, !978}
!977 = !DIDerivedType(tag: DW_TAG_typedef, name: "LabelType", file: !36, line: 24, baseType: !441)
!978 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !32)
!979 = !DILocalVariable(name: "parameter_vector", arg: 1, scope: !974, file: !29, line: 37, type: !939)
!980 = !DILocation(line: 37, column: 38, scope: !974)
!981 = !DILocalVariable(name: "data_point_i", arg: 2, scope: !974, file: !29, line: 37, type: !941)
!982 = !DILocation(line: 37, column: 66, scope: !974)
!983 = !DILocalVariable(name: "num_features", arg: 3, scope: !974, file: !29, line: 37, type: !117)
!984 = !DILocation(line: 37, column: 87, scope: !974)
!985 = !DILocalVariable(name: "treshold", arg: 4, scope: !974, file: !29, line: 37, type: !978)
!986 = !DILocation(line: 37, column: 114, scope: !974)
!987 = !DILocalVariable(name: "parameter_vector_dot_x_i", scope: !974, file: !29, line: 39, type: !249)
!988 = !DILocation(line: 39, column: 9, scope: !974)
!989 = !DILocation(line: 39, column: 47, scope: !974)
!990 = !DILocation(line: 39, column: 65, scope: !974)
!991 = !DILocation(line: 39, column: 79, scope: !974)
!992 = !DILocation(line: 39, column: 36, scope: !974)
!993 = !DILocation(line: 40, column: 11, scope: !974)
!994 = !DILocation(line: 40, column: 38, scope: !974)
!995 = !DILocation(line: 40, column: 36, scope: !974)
!996 = !DILocation(line: 40, column: 10, scope: !974)
!997 = !DILocation(line: 40, column: 3, scope: !974)
!998 = distinct !DISubprogram(name: "computeErrorRate", linkageName: "_Z16computeErrorRate9DataSet_sRdS0_S0_", scope: !29, file: !29, line: 44, type: !999, isLocal: false, isDefinition: true, scopeLine: 49, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!999 = !DISubroutineType(types: !1000)
!1000 = !{!32, !1001, !1010, !1010, !1010}
!1001 = !DIDerivedType(tag: DW_TAG_typedef, name: "DataSet", file: !29, line: 22, baseType: !1002)
!1002 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "DataSet_s", file: !29, line: 15, size: 320, flags: DIFlagTypePassByValue, elements: !1003, identifier: "_ZTS9DataSet_s")
!1003 = !{!1004, !1005, !1007, !1008, !1009}
!1004 = !DIDerivedType(tag: DW_TAG_member, name: "data_points", scope: !1002, file: !29, line: 17, baseType: !941, size: 64)
!1005 = !DIDerivedType(tag: DW_TAG_member, name: "labels", scope: !1002, file: !29, line: 18, baseType: !1006, size: 64, offset: 64)
!1006 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !977, size: 64)
!1007 = !DIDerivedType(tag: DW_TAG_member, name: "parameter_vector", scope: !1002, file: !29, line: 19, baseType: !939, size: 64, offset: 128)
!1008 = !DIDerivedType(tag: DW_TAG_member, name: "num_data_points", scope: !1002, file: !29, line: 20, baseType: !117, size: 64, offset: 192)
!1009 = !DIDerivedType(tag: DW_TAG_member, name: "num_features", scope: !1002, file: !29, line: 21, baseType: !117, size: 64, offset: 256)
!1010 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !32, size: 64)
!1011 = !DILocalVariable(name: "data_set", arg: 1, scope: !998, file: !29, line: 45, type: !1001)
!1012 = !DILocation(line: 45, column: 13, scope: !998)
!1013 = !DILocalVariable(name: "cumulative_true_positive_rate", arg: 2, scope: !998, file: !29, line: 46, type: !1010)
!1014 = !DILocation(line: 46, column: 13, scope: !998)
!1015 = !DILocalVariable(name: "cumulative_false_positive_rate", arg: 3, scope: !998, file: !29, line: 47, type: !1010)
!1016 = !DILocation(line: 47, column: 13, scope: !998)
!1017 = !DILocalVariable(name: "cumulative_error", arg: 4, scope: !998, file: !29, line: 48, type: !1010)
!1018 = !DILocation(line: 48, column: 13, scope: !998)
!1019 = !DILocalVariable(name: "true_positives", scope: !998, file: !29, line: 51, type: !117)
!1020 = !DILocation(line: 51, column: 10, scope: !998)
!1021 = !DILocalVariable(name: "true_negatives", scope: !998, file: !29, line: 51, type: !117)
!1022 = !DILocation(line: 51, column: 30, scope: !998)
!1023 = !DILocalVariable(name: "false_positives", scope: !998, file: !29, line: 51, type: !117)
!1024 = !DILocation(line: 51, column: 50, scope: !998)
!1025 = !DILocalVariable(name: "false_negatives", scope: !998, file: !29, line: 51, type: !117)
!1026 = !DILocation(line: 51, column: 71, scope: !998)
!1027 = !DILocalVariable(name: "i", scope: !1028, file: !29, line: 53, type: !117)
!1028 = distinct !DILexicalBlock(scope: !998, file: !29, line: 53, column: 3)
!1029 = !DILocation(line: 53, column: 15, scope: !1028)
!1030 = !DILocation(line: 53, column: 8, scope: !1028)
!1031 = !DILocation(line: 53, column: 22, scope: !1032)
!1032 = distinct !DILexicalBlock(scope: !1028, file: !29, line: 53, column: 3)
!1033 = !DILocation(line: 53, column: 35, scope: !1032)
!1034 = !DILocation(line: 53, column: 24, scope: !1032)
!1035 = !DILocation(line: 53, column: 3, scope: !1028)
!1036 = !DILocalVariable(name: "prediction", scope: !1037, file: !29, line: 55, type: !977)
!1037 = distinct !DILexicalBlock(scope: !1032, file: !29, line: 54, column: 3)
!1038 = !DILocation(line: 55, column: 15, scope: !1037)
!1039 = !DILocation(line: 55, column: 51, scope: !1037)
!1040 = !DILocation(line: 55, column: 79, scope: !1037)
!1041 = !DILocation(line: 55, column: 91, scope: !1037)
!1042 = !DILocation(line: 55, column: 104, scope: !1037)
!1043 = !DILocation(line: 55, column: 93, scope: !1037)
!1044 = !DILocation(line: 55, column: 70, scope: !1037)
!1045 = !DILocation(line: 55, column: 128, scope: !1037)
!1046 = !DILocation(line: 55, column: 28, scope: !1037)
!1047 = !DILocation(line: 56, column: 9, scope: !1048)
!1048 = distinct !DILexicalBlock(scope: !1037, file: !29, line: 56, column: 9)
!1049 = !DILocation(line: 56, column: 32, scope: !1048)
!1050 = !DILocation(line: 56, column: 39, scope: !1048)
!1051 = !DILocation(line: 56, column: 23, scope: !1048)
!1052 = !DILocation(line: 56, column: 20, scope: !1048)
!1053 = !DILocation(line: 56, column: 9, scope: !1037)
!1054 = !DILocation(line: 58, column: 11, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !1056, file: !29, line: 58, column: 11)
!1056 = distinct !DILexicalBlock(scope: !1048, file: !29, line: 57, column: 5)
!1057 = !DILocation(line: 58, column: 22, scope: !1055)
!1058 = !DILocation(line: 58, column: 11, scope: !1056)
!1059 = !DILocation(line: 59, column: 24, scope: !1055)
!1060 = !DILocation(line: 59, column: 9, scope: !1055)
!1061 = !DILocation(line: 61, column: 24, scope: !1055)
!1062 = !DILocation(line: 62, column: 5, scope: !1056)
!1063 = !DILocation(line: 65, column: 11, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1065, file: !29, line: 65, column: 11)
!1065 = distinct !DILexicalBlock(scope: !1048, file: !29, line: 64, column: 5)
!1066 = !DILocation(line: 65, column: 22, scope: !1064)
!1067 = !DILocation(line: 65, column: 11, scope: !1065)
!1068 = !DILocation(line: 66, column: 23, scope: !1064)
!1069 = !DILocation(line: 66, column: 9, scope: !1064)
!1070 = !DILocation(line: 68, column: 23, scope: !1064)
!1071 = !DILocation(line: 70, column: 3, scope: !1037)
!1072 = !DILocation(line: 53, column: 53, scope: !1032)
!1073 = !DILocation(line: 53, column: 3, scope: !1032)
!1074 = distinct !{!1074, !1035, !1075}
!1075 = !DILocation(line: 70, column: 3, scope: !1028)
!1076 = !DILocalVariable(name: "error_rate", scope: !998, file: !29, line: 72, type: !32)
!1077 = !DILocation(line: 72, column: 10, scope: !998)
!1078 = !DILocation(line: 72, column: 32, scope: !998)
!1079 = !DILocation(line: 72, column: 50, scope: !998)
!1080 = !DILocation(line: 72, column: 48, scope: !998)
!1081 = !DILocation(line: 72, column: 31, scope: !998)
!1082 = !DILocation(line: 72, column: 78, scope: !998)
!1083 = !DILocation(line: 72, column: 69, scope: !998)
!1084 = !DILocation(line: 72, column: 67, scope: !998)
!1085 = !DILocation(line: 74, column: 44, scope: !998)
!1086 = !DILocation(line: 74, column: 62, scope: !998)
!1087 = !DILocation(line: 74, column: 79, scope: !998)
!1088 = !DILocation(line: 74, column: 77, scope: !998)
!1089 = !DILocation(line: 74, column: 61, scope: !998)
!1090 = !DILocation(line: 74, column: 59, scope: !998)
!1091 = !DILocation(line: 74, column: 3, scope: !998)
!1092 = !DILocation(line: 74, column: 33, scope: !998)
!1093 = !DILocation(line: 75, column: 45, scope: !998)
!1094 = !DILocation(line: 75, column: 64, scope: !998)
!1095 = !DILocation(line: 75, column: 82, scope: !998)
!1096 = !DILocation(line: 75, column: 80, scope: !998)
!1097 = !DILocation(line: 75, column: 63, scope: !998)
!1098 = !DILocation(line: 75, column: 61, scope: !998)
!1099 = !DILocation(line: 75, column: 3, scope: !998)
!1100 = !DILocation(line: 75, column: 34, scope: !998)
!1101 = !DILocation(line: 76, column: 23, scope: !998)
!1102 = !DILocation(line: 76, column: 3, scope: !998)
!1103 = !DILocation(line: 76, column: 20, scope: !998)
!1104 = !DILocation(line: 78, column: 10, scope: !998)
!1105 = !DILocation(line: 78, column: 3, scope: !998)
!1106 = distinct !DISubprogram(name: "check_results", linkageName: "_Z13check_resultsPfS_Ph", scope: !29, file: !29, line: 82, type: !1107, isLocal: false, isDefinition: true, scopeLine: 83, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !30)
!1107 = !DISubroutineType(types: !1108)
!1108 = !{null, !939, !941, !1006}
!1109 = !DILocalVariable(name: "param_vector", arg: 1, scope: !1106, file: !29, line: 82, type: !939)
!1110 = !DILocation(line: 82, column: 33, scope: !1106)
!1111 = !DILocalVariable(name: "data_points", arg: 2, scope: !1106, file: !29, line: 82, type: !941)
!1112 = !DILocation(line: 82, column: 57, scope: !1106)
!1113 = !DILocalVariable(name: "labels", arg: 3, scope: !1106, file: !29, line: 82, type: !1006)
!1114 = !DILocation(line: 82, column: 81, scope: !1106)
!1115 = !DILocalVariable(name: "ofile", scope: !1106, file: !29, line: 84, type: !1116)
!1116 = !DIDerivedType(tag: DW_TAG_typedef, name: "ofstream", scope: !2, file: !1117, line: 165, baseType: !1118)
!1117 = !DIFile(filename: "/usr/include/c++/11/iosfwd", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!1118 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ofstream<char, std::char_traits<char> >", scope: !2, file: !1119, line: 1088, size: 4096, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTSSt14basic_ofstreamIcSt11char_traitsIcEE")
!1119 = !DIFile(filename: "/usr/include/c++/11/bits/fstream.tcc", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/spam-filter/approx")
!1120 = !DILocation(line: 84, column: 17, scope: !1106)
!1121 = !DILocation(line: 85, column: 9, scope: !1106)
!1122 = !DILocation(line: 86, column: 13, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1106, file: !29, line: 86, column: 7)
!1124 = !DILocation(line: 86, column: 7, scope: !1106)
!1125 = !DILocation(line: 88, column: 5, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1123, file: !29, line: 87, column: 3)
!1127 = !DILocation(line: 88, column: 11, scope: !1126)
!1128 = !DILocalVariable(name: "i", scope: !1129, file: !29, line: 89, type: !11)
!1129 = distinct !DILexicalBlock(scope: !1126, file: !29, line: 89, column: 5)
!1130 = !DILocation(line: 89, column: 13, scope: !1129)
!1131 = !DILocation(line: 89, column: 9, scope: !1129)
!1132 = !DILocation(line: 89, column: 20, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1129, file: !29, line: 89, column: 5)
!1134 = !DILocation(line: 89, column: 22, scope: !1133)
!1135 = !DILocation(line: 89, column: 5, scope: !1129)
!1136 = !DILocation(line: 90, column: 7, scope: !1133)
!1137 = !DILocation(line: 90, column: 13, scope: !1133)
!1138 = !DILocation(line: 90, column: 24, scope: !1133)
!1139 = !DILocation(line: 90, column: 21, scope: !1133)
!1140 = !DILocation(line: 90, column: 26, scope: !1133)
!1141 = !DILocation(line: 90, column: 38, scope: !1133)
!1142 = !DILocation(line: 90, column: 51, scope: !1133)
!1143 = !DILocation(line: 90, column: 35, scope: !1133)
!1144 = !DILocation(line: 90, column: 54, scope: !1133)
!1145 = !DILocation(line: 89, column: 30, scope: !1133)
!1146 = !DILocation(line: 89, column: 5, scope: !1133)
!1147 = distinct !{!1147, !1135, !1148}
!1148 = !DILocation(line: 90, column: 57, scope: !1129)
!1149 = !DILocation(line: 138, column: 1, scope: !1106)
!1150 = !DILocation(line: 92, column: 5, scope: !1126)
!1151 = !DILocation(line: 92, column: 11, scope: !1126)
!1152 = !DILocalVariable(name: "training_tpr", scope: !1126, file: !29, line: 95, type: !32)
!1153 = !DILocation(line: 95, column: 12, scope: !1126)
!1154 = !DILocalVariable(name: "training_fpr", scope: !1126, file: !29, line: 96, type: !32)
!1155 = !DILocation(line: 96, column: 12, scope: !1126)
!1156 = !DILocalVariable(name: "training_error", scope: !1126, file: !29, line: 97, type: !32)
!1157 = !DILocation(line: 97, column: 12, scope: !1126)
!1158 = !DILocalVariable(name: "testing_tpr", scope: !1126, file: !29, line: 98, type: !32)
!1159 = !DILocation(line: 98, column: 12, scope: !1126)
!1160 = !DILocalVariable(name: "testing_fpr", scope: !1126, file: !29, line: 99, type: !32)
!1161 = !DILocation(line: 99, column: 12, scope: !1126)
!1162 = !DILocalVariable(name: "testing_error", scope: !1126, file: !29, line: 100, type: !32)
!1163 = !DILocation(line: 100, column: 12, scope: !1126)
!1164 = !DILocalVariable(name: "training_set", scope: !1126, file: !29, line: 103, type: !1001)
!1165 = !DILocation(line: 103, column: 13, scope: !1126)
!1166 = !DILocation(line: 104, column: 32, scope: !1126)
!1167 = !DILocation(line: 104, column: 18, scope: !1126)
!1168 = !DILocation(line: 104, column: 30, scope: !1126)
!1169 = !DILocation(line: 105, column: 27, scope: !1126)
!1170 = !DILocation(line: 105, column: 18, scope: !1126)
!1171 = !DILocation(line: 105, column: 25, scope: !1126)
!1172 = !DILocation(line: 106, column: 18, scope: !1126)
!1173 = !DILocation(line: 106, column: 34, scope: !1126)
!1174 = !DILocation(line: 107, column: 18, scope: !1126)
!1175 = !DILocation(line: 107, column: 31, scope: !1126)
!1176 = !DILocation(line: 108, column: 37, scope: !1126)
!1177 = !DILocation(line: 108, column: 18, scope: !1126)
!1178 = !DILocation(line: 108, column: 35, scope: !1126)
!1179 = !DILocation(line: 109, column: 22, scope: !1126)
!1180 = !DILocation(line: 109, column: 5, scope: !1126)
!1181 = !DILocalVariable(name: "testing_set", scope: !1126, file: !29, line: 112, type: !1001)
!1182 = !DILocation(line: 112, column: 13, scope: !1126)
!1183 = !DILocation(line: 113, column: 32, scope: !1126)
!1184 = !DILocation(line: 113, column: 17, scope: !1126)
!1185 = !DILocation(line: 113, column: 29, scope: !1126)
!1186 = !DILocation(line: 114, column: 27, scope: !1126)
!1187 = !DILocation(line: 114, column: 17, scope: !1126)
!1188 = !DILocation(line: 114, column: 24, scope: !1126)
!1189 = !DILocation(line: 115, column: 17, scope: !1126)
!1190 = !DILocation(line: 115, column: 33, scope: !1126)
!1191 = !DILocation(line: 116, column: 17, scope: !1126)
!1192 = !DILocation(line: 116, column: 30, scope: !1126)
!1193 = !DILocation(line: 117, column: 36, scope: !1126)
!1194 = !DILocation(line: 117, column: 17, scope: !1126)
!1195 = !DILocation(line: 117, column: 34, scope: !1126)
!1196 = !DILocation(line: 118, column: 22, scope: !1126)
!1197 = !DILocation(line: 118, column: 5, scope: !1126)
!1198 = !DILocation(line: 120, column: 18, scope: !1126)
!1199 = !DILocation(line: 121, column: 18, scope: !1126)
!1200 = !DILocation(line: 122, column: 20, scope: !1126)
!1201 = !DILocation(line: 123, column: 17, scope: !1126)
!1202 = !DILocation(line: 124, column: 17, scope: !1126)
!1203 = !DILocation(line: 125, column: 19, scope: !1126)
!1204 = !DILocation(line: 127, column: 5, scope: !1126)
!1205 = !DILocation(line: 127, column: 11, scope: !1126)
!1206 = !DILocation(line: 127, column: 34, scope: !1126)
!1207 = !DILocation(line: 127, column: 31, scope: !1126)
!1208 = !DILocation(line: 127, column: 47, scope: !1126)
!1209 = !DILocation(line: 128, column: 5, scope: !1126)
!1210 = !DILocation(line: 128, column: 11, scope: !1126)
!1211 = !DILocation(line: 128, column: 34, scope: !1126)
!1212 = !DILocation(line: 128, column: 31, scope: !1126)
!1213 = !DILocation(line: 128, column: 47, scope: !1126)
!1214 = !DILocation(line: 129, column: 5, scope: !1126)
!1215 = !DILocation(line: 129, column: 11, scope: !1126)
!1216 = !DILocation(line: 129, column: 36, scope: !1126)
!1217 = !DILocation(line: 129, column: 33, scope: !1126)
!1218 = !DILocation(line: 129, column: 51, scope: !1126)
!1219 = !DILocation(line: 130, column: 5, scope: !1126)
!1220 = !DILocation(line: 130, column: 11, scope: !1126)
!1221 = !DILocation(line: 130, column: 33, scope: !1126)
!1222 = !DILocation(line: 130, column: 30, scope: !1126)
!1223 = !DILocation(line: 130, column: 45, scope: !1126)
!1224 = !DILocation(line: 131, column: 5, scope: !1126)
!1225 = !DILocation(line: 131, column: 11, scope: !1126)
!1226 = !DILocation(line: 131, column: 33, scope: !1126)
!1227 = !DILocation(line: 131, column: 30, scope: !1126)
!1228 = !DILocation(line: 131, column: 45, scope: !1126)
!1229 = !DILocation(line: 132, column: 5, scope: !1126)
!1230 = !DILocation(line: 132, column: 11, scope: !1126)
!1231 = !DILocation(line: 132, column: 35, scope: !1126)
!1232 = !DILocation(line: 132, column: 32, scope: !1126)
!1233 = !DILocation(line: 132, column: 49, scope: !1126)
!1234 = !DILocation(line: 133, column: 3, scope: !1126)
!1235 = !DILocation(line: 136, column: 15, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1123, file: !29, line: 135, column: 3)
!1237 = !DILocation(line: 136, column: 50, scope: !1236)
!1238 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_check_result.cpp", scope: !29, file: !29, type: !1239, isLocal: true, isDefinition: true, flags: DIFlagArtificial, isOptimized: false, unit: !28, variables: !30)
!1239 = !DISubroutineType(types: !30)
!1240 = !DILocation(line: 0, scope: !1238)
