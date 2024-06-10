; ModuleID = '../src/iolib/populate_io.cpp'
source_filename = "../src/iolib/populate_io.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"Error opening files\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"Failed to create output file!\0A\00", align 1
@.str.5 = private unnamed_addr constant [37 x i8] c"Test %d: expected = %d, result = %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"\0A\09 %d / %d correct!\0A\00", align 1

; Function Attrs: noinline optnone uwtable
define void @populateInput(i8* %training_samples_filename, i8* %training_labels_filename, i8* %test_samples_filename, i8* %test_labels_filename, i64* %training_samples, i8* %training_labels, i64* %test_samples, i8* %test_labels) #0 {
entry:
  %training_samples_filename.addr = alloca i8*, align 8
  %training_labels_filename.addr = alloca i8*, align 8
  %test_samples_filename.addr = alloca i8*, align 8
  %test_labels_filename.addr = alloca i8*, align 8
  %training_samples.addr = alloca i64*, align 8
  %training_labels.addr = alloca i8*, align 8
  %test_samples.addr = alloca i64*, align 8
  %test_labels.addr = alloca i8*, align 8
  %training_samples_file = alloca %struct._IO_FILE*, align 8
  %training_labels_file = alloca %struct._IO_FILE*, align 8
  %test_samples_file = alloca %struct._IO_FILE*, align 8
  %test_labels_file = alloca %struct._IO_FILE*, align 8
  store i8* %training_samples_filename, i8** %training_samples_filename.addr, align 8
  store i8* %training_labels_filename, i8** %training_labels_filename.addr, align 8
  store i8* %test_samples_filename, i8** %test_samples_filename.addr, align 8
  store i8* %test_labels_filename, i8** %test_labels_filename.addr, align 8
  store i64* %training_samples, i64** %training_samples.addr, align 8
  store i8* %training_labels, i8** %training_labels.addr, align 8
  store i64* %test_samples, i64** %test_samples.addr, align 8
  store i8* %test_labels, i8** %test_labels.addr, align 8
  %0 = load i8*, i8** %training_samples_filename.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %training_samples_file, align 8
  %1 = load i8*, i8** %training_labels_filename.addr, align 8
  %call1 = call noalias %struct._IO_FILE* @fopen(i8* %1, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %call1, %struct._IO_FILE** %training_labels_file, align 8
  %2 = load i8*, i8** %test_samples_filename.addr, align 8
  %call2 = call noalias %struct._IO_FILE* @fopen(i8* %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %call2, %struct._IO_FILE** %test_samples_file, align 8
  %3 = load i8*, i8** %test_labels_filename.addr, align 8
  %call3 = call noalias %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %call3, %struct._IO_FILE** %test_labels_file, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %training_samples_file, align 8
  %tobool = icmp ne %struct._IO_FILE* %4, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %training_labels_file, align 8
  %tobool4 = icmp ne %struct._IO_FILE* %5, null
  br i1 %tobool4, label %lor.lhs.false5, label %if.then

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %test_samples_file, align 8
  %tobool6 = icmp ne %struct._IO_FILE* %6, null
  br i1 %tobool6, label %lor.lhs.false7, label %if.then

lor.lhs.false7:                                   ; preds = %lor.lhs.false5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %test_labels_file, align 8
  %tobool8 = icmp ne %struct._IO_FILE* %7, null
  br i1 %tobool8, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false7, %lor.lhs.false5, %lor.lhs.false, %entry
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0))
  call void @exit(i32 -1) #3
  unreachable

if.end:                                           ; preds = %lor.lhs.false7
  %8 = load i64*, i64** %training_samples.addr, align 8
  %9 = bitcast i64* %8 to i8*
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %training_samples_file, align 8
  %call10 = call i64 @fread(i8* %9, i64 8, i64 72000, %struct._IO_FILE* %10)
  %11 = load i8*, i8** %training_labels.addr, align 8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %training_labels_file, align 8
  %call11 = call i64 @fread(i8* %11, i64 1, i64 18000, %struct._IO_FILE* %12)
  %13 = load i64*, i64** %test_samples.addr, align 8
  %14 = bitcast i64* %13 to i8*
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %test_samples_file, align 8
  %call12 = call i64 @fread(i8* %14, i64 8, i64 8000, %struct._IO_FILE* %15)
  %16 = load i8*, i8** %test_labels.addr, align 8
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %test_labels_file, align 8
  %call13 = call i64 @fread(i8* %16, i64 1, i64 2000, %struct._IO_FILE* %17)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %training_samples_file, align 8
  %call14 = call i32 @fclose(%struct._IO_FILE* %18)
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** %training_labels_file, align 8
  %call15 = call i32 @fclose(%struct._IO_FILE* %19)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %test_samples_file, align 8
  %call16 = call i32 @fclose(%struct._IO_FILE* %20)
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %test_labels_file, align 8
  %call17 = call i32 @fclose(%struct._IO_FILE* %21)
  ret void
}

declare noalias %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: noinline optnone uwtable
define void @populateOutput(i8* %result, i8* %expected) #0 {
entry:
  %result.addr = alloca i8*, align 8
  %expected.addr = alloca i8*, align 8
  %correct_cnt = alloca i32, align 4
  %ofile = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  store i8* %result, i8** %result.addr, align 8
  store i8* %expected, i8** %expected.addr, align 8
  store i32 0, i32* %correct_cnt, align 4
  %call = call noalias %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %ofile, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %tobool = icmp ne %struct._IO_FILE* %0, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 -1) #3
  unreachable

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %1, 2000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %result.addr, align 8
  %3 = load i32, i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 %idxprom
  %4 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %4 to i32
  %5 = load i8*, i8** %expected.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom2 = sext i32 %6 to i64
  %arrayidx3 = getelementptr inbounds i8, i8* %5, i64 %idxprom2
  %7 = load i8, i8* %arrayidx3, align 1
  %conv4 = zext i8 %7 to i32
  %cmp5 = icmp ne i32 %conv, %conv4
  br i1 %cmp5, label %if.then6, label %if.else

if.then6:                                         ; preds = %for.body
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %9 = load i32, i32* %i, align 4
  %10 = load i8*, i8** %expected.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %11 to i64
  %arrayidx8 = getelementptr inbounds i8, i8* %10, i64 %idxprom7
  %12 = load i8, i8* %arrayidx8, align 1
  %conv9 = zext i8 %12 to i32
  %13 = load i8*, i8** %result.addr, align 8
  %14 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %14 to i64
  %arrayidx11 = getelementptr inbounds i8, i8* %13, i64 %idxprom10
  %15 = load i8, i8* %arrayidx11, align 1
  %conv12 = zext i8 %15 to i32
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.5, i32 0, i32 0), i32 %9, i32 %conv9, i32 %conv12)
  br label %if.end14

if.else:                                          ; preds = %for.body
  %16 = load i32, i32* %correct_cnt, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %correct_cnt, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.else, %if.then6
  br label %for.inc

for.inc:                                          ; preds = %if.end14
  %17 = load i32, i32* %i, align 4
  %inc15 = add nsw i32 %17, 1
  store i32 %inc15, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %19 = load i32, i32* %correct_cnt, align 4
  %call16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i32 0, i32 0), i32 %19, i32 2000)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call17 = call i32 @fclose(%struct._IO_FILE* %20)
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

attributes #0 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 "}
