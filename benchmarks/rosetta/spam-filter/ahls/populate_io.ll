; ModuleID = '../src/iolib/populate_io.cpp'
source_filename = "../src/iolib/populate_io.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.DataSet_s = type { float*, i8*, float*, i64, i64 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1 = private unnamed_addr constant [30 x i8] c"Failed to open data file %s!\0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"Failed to open label file %s!\0A\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.7 = private unnamed_addr constant [29 x i8] c"Failed to open output file!\0A\00", align 1
@.str.8 = private unnamed_addr constant [26 x i8] c"\0Amain parameter vector: \0A\00", align 1
@.str.9 = private unnamed_addr constant [13 x i8] c"m[%d]: %f | \00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"\0A\0A\00", align 1
@.str.11 = private unnamed_addr constant [18 x i8] c"Training TPR: %f\0A\00", align 1
@.str.12 = private unnamed_addr constant [18 x i8] c"Training FPR: %f\0A\00", align 1
@.str.13 = private unnamed_addr constant [20 x i8] c"Training Error: %f\0A\00", align 1
@.str.14 = private unnamed_addr constant [17 x i8] c"Testing TPR: %f\0A\00", align 1
@.str.15 = private unnamed_addr constant [17 x i8] c"Testing FPR: %f\0A\00", align 1
@.str.16 = private unnamed_addr constant [19 x i8] c"Testing Error: %f\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define float @_Z10dotProductPfS_m(float* %param_vector, float* %data_point_i, i64 %num_features) #0 {
entry:
  %param_vector.addr = alloca float*, align 8
  %data_point_i.addr = alloca float*, align 8
  %num_features.addr = alloca i64, align 8
  %result = alloca float, align 4
  %i = alloca i32, align 4
  store float* %param_vector, float** %param_vector.addr, align 8
  store float* %data_point_i, float** %data_point_i.addr, align 8
  store i64 %num_features, i64* %num_features.addr, align 8
  store float 0.000000e+00, float* %result, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %conv = sext i32 %0 to i64
  %1 = load i64, i64* %num_features.addr, align 8
  %cmp = icmp ult i64 %conv, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load float*, float** %param_vector.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds float, float* %2, i64 %idxprom
  %4 = load float, float* %arrayidx, align 4
  %5 = load float*, float** %data_point_i.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %6 to i64
  %arrayidx2 = getelementptr inbounds float, float* %5, i64 %idxprom1
  %7 = load float, float* %arrayidx2, align 4
  %mul = fmul float %4, %7
  %8 = load float, float* %result, align 4
  %add = fadd float %8, %mul
  store float %add, float* %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load float, float* %result, align 4
  ret float %10
}

; Function Attrs: noinline nounwind optnone uwtable
define zeroext i8 @_Z13getPredictionPfS_md(float* %parameter_vector, float* %data_point_i, i64 %num_features, double %treshold) #0 {
entry:
  %retval = alloca i8, align 1
  %parameter_vector.addr = alloca float*, align 8
  %data_point_i.addr = alloca float*, align 8
  %num_features.addr = alloca i64, align 8
  %treshold.addr = alloca double, align 8
  %parameter_vector_dot_x_i = alloca float, align 4
  store float* %parameter_vector, float** %parameter_vector.addr, align 8
  store float* %data_point_i, float** %data_point_i.addr, align 8
  store i64 %num_features, i64* %num_features.addr, align 8
  store double %treshold, double* %treshold.addr, align 8
  %0 = load float*, float** %parameter_vector.addr, align 8
  %1 = load float*, float** %data_point_i.addr, align 8
  %2 = load i64, i64* %num_features.addr, align 8
  %call = call float @_Z10dotProductPfS_m(float* %0, float* %1, i64 %2)
  store float %call, float* %parameter_vector_dot_x_i, align 4
  %3 = load float, float* %parameter_vector_dot_x_i, align 4
  %conv = fpext float %3 to double
  %4 = load double, double* %treshold.addr, align 8
  %cmp = fcmp ogt double %conv, %4
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i8 1, i8* %retval, align 1
  br label %return

if.else:                                          ; preds = %entry
  store i8 0, i8* %retval, align 1
  br label %return

return:                                           ; preds = %if.else, %if.then
  %5 = load i8, i8* %retval, align 1
  ret i8 %5
}

; Function Attrs: noinline nounwind optnone uwtable
define double @_Z16computeErrorRate9DataSet_sRdS0_S0_(%struct.DataSet_s* byval align 8 %data_set, double* dereferenceable(8) %cumulative_true_positive_rate, double* dereferenceable(8) %cumulative_false_positive_rate, double* dereferenceable(8) %cumulative_error) #0 {
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
  store double* %cumulative_true_positive_rate, double** %cumulative_true_positive_rate.addr, align 8
  store double* %cumulative_false_positive_rate, double** %cumulative_false_positive_rate.addr, align 8
  store double* %cumulative_error, double** %cumulative_error.addr, align 8
  store i64 0, i64* %true_positives, align 8
  store i64 0, i64* %true_negatives, align 8
  store i64 0, i64* %false_positives, align 8
  store i64 0, i64* %false_negatives, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8
  %num_data_points = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 3
  %1 = load i64, i64* %num_data_points, align 8
  %cmp = icmp ult i64 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %parameter_vector = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 2
  %2 = load float*, float** %parameter_vector, align 8
  %data_points = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 0
  %3 = load float*, float** %data_points, align 8
  %4 = load i64, i64* %i, align 8
  %num_features = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 4
  %5 = load i64, i64* %num_features, align 8
  %mul = mul i64 %4, %5
  %arrayidx = getelementptr inbounds float, float* %3, i64 %mul
  %num_features1 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 4
  %6 = load i64, i64* %num_features1, align 8
  %call = call zeroext i8 @_Z13getPredictionPfS_md(float* %2, float* %arrayidx, i64 %6, double 0.000000e+00)
  store i8 %call, i8* %prediction, align 1
  %7 = load i8, i8* %prediction, align 1
  %conv = zext i8 %7 to i32
  %labels = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 1
  %8 = load i8*, i8** %labels, align 8
  %9 = load i64, i64* %i, align 8
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i64 %9
  %10 = load i8, i8* %arrayidx2, align 1
  %conv3 = zext i8 %10 to i32
  %cmp4 = icmp ne i32 %conv, %conv3
  br i1 %cmp4, label %if.then, label %if.else9

if.then:                                          ; preds = %for.body
  %11 = load i8, i8* %prediction, align 1
  %conv5 = zext i8 %11 to i32
  %cmp6 = icmp eq i32 %conv5, 1
  br i1 %cmp6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.then
  %12 = load i64, i64* %false_positives, align 8
  %inc = add i64 %12, 1
  store i64 %inc, i64* %false_positives, align 8
  br label %if.end

if.else:                                          ; preds = %if.then
  %13 = load i64, i64* %false_negatives, align 8
  %inc8 = add i64 %13, 1
  store i64 %inc8, i64* %false_negatives, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  br label %if.end17

if.else9:                                         ; preds = %for.body
  %14 = load i8, i8* %prediction, align 1
  %conv10 = zext i8 %14 to i32
  %cmp11 = icmp eq i32 %conv10, 1
  br i1 %cmp11, label %if.then12, label %if.else14

if.then12:                                        ; preds = %if.else9
  %15 = load i64, i64* %true_positives, align 8
  %inc13 = add i64 %15, 1
  store i64 %inc13, i64* %true_positives, align 8
  br label %if.end16

if.else14:                                        ; preds = %if.else9
  %16 = load i64, i64* %true_negatives, align 8
  %inc15 = add i64 %16, 1
  store i64 %inc15, i64* %true_negatives, align 8
  br label %if.end16

if.end16:                                         ; preds = %if.else14, %if.then12
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end17
  %17 = load i64, i64* %i, align 8
  %inc18 = add i64 %17, 1
  store i64 %inc18, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %18 = load i64, i64* %false_positives, align 8
  %19 = load i64, i64* %false_negatives, align 8
  %add = add i64 %18, %19
  %conv19 = uitofp i64 %add to double
  %num_data_points20 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %data_set, i32 0, i32 3
  %20 = load i64, i64* %num_data_points20, align 8
  %conv21 = uitofp i64 %20 to double
  %div = fdiv double %conv19, %conv21
  store double %div, double* %error_rate, align 8
  %21 = load i64, i64* %true_positives, align 8
  %conv22 = uitofp i64 %21 to double
  %22 = load i64, i64* %true_positives, align 8
  %23 = load i64, i64* %false_negatives, align 8
  %add23 = add i64 %22, %23
  %conv24 = uitofp i64 %add23 to double
  %div25 = fdiv double %conv22, %conv24
  %24 = load double*, double** %cumulative_true_positive_rate.addr, align 8
  %25 = load double, double* %24, align 8
  %add26 = fadd double %25, %div25
  store double %add26, double* %24, align 8
  %26 = load i64, i64* %false_positives, align 8
  %conv27 = uitofp i64 %26 to double
  %27 = load i64, i64* %false_positives, align 8
  %28 = load i64, i64* %true_negatives, align 8
  %add28 = add i64 %27, %28
  %conv29 = uitofp i64 %add28 to double
  %div30 = fdiv double %conv27, %conv29
  %29 = load double*, double** %cumulative_false_positive_rate.addr, align 8
  %30 = load double, double* %29, align 8
  %add31 = fadd double %30, %div30
  store double %add31, double* %29, align 8
  %31 = load double, double* %error_rate, align 8
  %32 = load double*, double** %cumulative_error.addr, align 8
  %33 = load double, double* %32, align 8
  %add32 = fadd double %33, %31
  store double %add32, double* %32, align 8
  %34 = load double, double* %error_rate, align 8
  ret double %34
}

; Function Attrs: noinline optnone uwtable
define void @populateInput(i8* %str_points_filepath, i8* %str_labels_filepath, float* %data_points, i8* %labels) #1 {
entry:
  %str_points_filepath.addr = alloca i8*, align 8
  %str_labels_filepath.addr = alloca i8*, align 8
  %data_points.addr = alloca float*, align 8
  %labels.addr = alloca i8*, align 8
  %data_file = alloca %struct._IO_FILE*, align 8
  %label_file = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  %tmp = alloca float, align 4
  %i9 = alloca i32, align 4
  %tmp13 = alloca i32, align 4
  store i8* %str_points_filepath, i8** %str_points_filepath.addr, align 8
  store i8* %str_labels_filepath, i8** %str_labels_filepath.addr, align 8
  store float* %data_points, float** %data_points.addr, align 8
  store i8* %labels, i8** %labels.addr, align 8
  %0 = load i8*, i8** %str_points_filepath.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %data_file, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %data_file, align 8
  %tobool = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %str_points_filepath.addr, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.1, i32 0, i32 0), i8* %2)
  call void @exit(i32 1) #5
  unreachable

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %3, 5120000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %data_file, align 8
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), float* %tmp)
  %5 = load float, float* %tmp, align 4
  %6 = load float*, float** %data_points.addr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom = sext i32 %7 to i64
  %arrayidx = getelementptr inbounds float, float* %6, i64 %idxprom
  store float %5, float* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %data_file, align 8
  %call3 = call i32 @fclose(%struct._IO_FILE* %9)
  %10 = load i8*, i8** %str_labels_filepath.addr, align 8
  %call4 = call noalias %struct._IO_FILE* @fopen(i8* %10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %call4, %struct._IO_FILE** %label_file, align 8
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %label_file, align 8
  %tobool5 = icmp ne %struct._IO_FILE* %11, null
  br i1 %tobool5, label %if.end8, label %if.then6

if.then6:                                         ; preds = %for.end
  %12 = load i8*, i8** %str_labels_filepath.addr, align 8
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.3, i32 0, i32 0), i8* %12)
  call void @exit(i32 1) #5
  unreachable

if.end8:                                          ; preds = %for.end
  store i32 0, i32* %i9, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc17, %if.end8
  %13 = load i32, i32* %i9, align 4
  %cmp11 = icmp slt i32 %13, 5000
  br i1 %cmp11, label %for.body12, label %for.end19

for.body12:                                       ; preds = %for.cond10
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %label_file, align 8
  %call14 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32* %tmp13)
  %15 = load i32, i32* %tmp13, align 4
  %conv = trunc i32 %15 to i8
  %16 = load i8*, i8** %labels.addr, align 8
  %17 = load i32, i32* %i9, align 4
  %idxprom15 = sext i32 %17 to i64
  %arrayidx16 = getelementptr inbounds i8, i8* %16, i64 %idxprom15
  store i8 %conv, i8* %arrayidx16, align 1
  br label %for.inc17

for.inc17:                                        ; preds = %for.body12
  %18 = load i32, i32* %i9, align 4
  %inc18 = add nsw i32 %18, 1
  store i32 %inc18, i32* %i9, align 4
  br label %for.cond10

for.end19:                                        ; preds = %for.cond10
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %label_file, align 8
  %call20 = call i32 @fclose(%struct._IO_FILE* %19)
  ret void
}

declare noalias %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: noinline optnone uwtable
define void @populateOutput(float* %param_vector, float* %data_points, i8* %labels) #1 {
entry:
  %param_vector.addr = alloca float*, align 8
  %data_points.addr = alloca float*, align 8
  %labels.addr = alloca i8*, align 8
  %ofile = alloca %struct._IO_FILE*, align 8
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
  %agg.tmp16 = alloca %struct.DataSet_s, align 8
  store float* %param_vector, float** %param_vector.addr, align 8
  store float* %data_points, float** %data_points.addr, align 8
  store i8* %labels, i8** %labels.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %ofile, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %cmp = icmp eq %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

if.end:                                           ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.8, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4
  %cmp3 = icmp slt i32 %2, 30
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %4 = load i32, i32* %i, align 4
  %5 = load float*, float** %param_vector.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds float, float* %5, i64 %idxprom
  %7 = load float, float* %arrayidx, align 4
  %conv = fpext float %7 to double
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.9, i32 0, i32 0), i32 %4, double %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0))
  store double 0.000000e+00, double* %training_tpr, align 8
  store double 0.000000e+00, double* %training_fpr, align 8
  store double 0.000000e+00, double* %training_error, align 8
  store double 0.000000e+00, double* %testing_tpr, align 8
  store double 0.000000e+00, double* %testing_fpr, align 8
  store double 0.000000e+00, double* %testing_error, align 8
  %10 = load float*, float** %data_points.addr, align 8
  %data_points6 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %training_set, i32 0, i32 0
  store float* %10, float** %data_points6, align 8
  %11 = load i8*, i8** %labels.addr, align 8
  %labels7 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %training_set, i32 0, i32 1
  store i8* %11, i8** %labels7, align 8
  %num_data_points = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %training_set, i32 0, i32 3
  store i64 4500, i64* %num_data_points, align 8
  %num_features = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %training_set, i32 0, i32 4
  store i64 1024, i64* %num_features, align 8
  %12 = load float*, float** %param_vector.addr, align 8
  %parameter_vector = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %training_set, i32 0, i32 2
  store float* %12, float** %parameter_vector, align 8
  %13 = bitcast %struct.DataSet_s* %agg.tmp to i8*
  %14 = bitcast %struct.DataSet_s* %training_set to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %13, i8* align 8 %14, i64 40, i1 false)
  %call8 = call double @_Z16computeErrorRate9DataSet_sRdS0_S0_(%struct.DataSet_s* byval align 8 %agg.tmp, double* dereferenceable(8) %training_tpr, double* dereferenceable(8) %training_fpr, double* dereferenceable(8) %training_error)
  %15 = load float*, float** %data_points.addr, align 8
  %arrayidx9 = getelementptr inbounds float, float* %15, i64 4608000
  %data_points10 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %testing_set, i32 0, i32 0
  store float* %arrayidx9, float** %data_points10, align 8
  %16 = load i8*, i8** %labels.addr, align 8
  %arrayidx11 = getelementptr inbounds i8, i8* %16, i64 4500
  %labels12 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %testing_set, i32 0, i32 1
  store i8* %arrayidx11, i8** %labels12, align 8
  %num_data_points13 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %testing_set, i32 0, i32 3
  store i64 500, i64* %num_data_points13, align 8
  %num_features14 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %testing_set, i32 0, i32 4
  store i64 1024, i64* %num_features14, align 8
  %17 = load float*, float** %param_vector.addr, align 8
  %parameter_vector15 = getelementptr inbounds %struct.DataSet_s, %struct.DataSet_s* %testing_set, i32 0, i32 2
  store float* %17, float** %parameter_vector15, align 8
  %18 = bitcast %struct.DataSet_s* %agg.tmp16 to i8*
  %19 = bitcast %struct.DataSet_s* %testing_set to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %18, i8* align 8 %19, i64 40, i1 false)
  %call17 = call double @_Z16computeErrorRate9DataSet_sRdS0_S0_(%struct.DataSet_s* byval align 8 %agg.tmp16, double* dereferenceable(8) %testing_tpr, double* dereferenceable(8) %testing_fpr, double* dereferenceable(8) %testing_error)
  %20 = load double, double* %training_tpr, align 8
  %mul = fmul double %20, 1.000000e+02
  store double %mul, double* %training_tpr, align 8
  %21 = load double, double* %training_fpr, align 8
  %mul18 = fmul double %21, 1.000000e+02
  store double %mul18, double* %training_fpr, align 8
  %22 = load double, double* %training_error, align 8
  %mul19 = fmul double %22, 1.000000e+02
  store double %mul19, double* %training_error, align 8
  %23 = load double, double* %testing_tpr, align 8
  %mul20 = fmul double %23, 1.000000e+02
  store double %mul20, double* %testing_tpr, align 8
  %24 = load double, double* %testing_fpr, align 8
  %mul21 = fmul double %24, 1.000000e+02
  store double %mul21, double* %testing_fpr, align 8
  %25 = load double, double* %testing_error, align 8
  %mul22 = fmul double %25, 1.000000e+02
  store double %mul22, double* %testing_error, align 8
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %27 = load double, double* %training_tpr, align 8
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.11, i32 0, i32 0), double %27)
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %29 = load double, double* %training_fpr, align 8
  %call24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.12, i32 0, i32 0), double %29)
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %31 = load double, double* %training_error, align 8
  %call25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.13, i32 0, i32 0), double %31)
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %33 = load double, double* %testing_tpr, align 8
  %call26 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.14, i32 0, i32 0), double %33)
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %35 = load double, double* %testing_fpr, align 8
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.15, i32 0, i32 0), double %35)
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %37 = load double, double* %testing_error, align 8
  %call28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16, i32 0, i32 0), double %37)
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call29 = call i32 @fclose(%struct._IO_FILE* %38)
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #4

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 "}
