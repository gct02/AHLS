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
@.str.2 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"Failed to open output file!\0A\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"_raw\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.6 = private unnamed_addr constant [37 x i8] c"Test %d: expected = %d, result = %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [21 x i8] c"\0A\09 %d / %d correct!\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i8* @_Z9removeExtPKc(i8* %filename) #0 {
entry:
  %retval = alloca i8*, align 8
  %filename.addr = alloca i8*, align 8
  %retStr = alloca i8*, align 8
  %lastExt = alloca i8*, align 8
  store i8* %filename, i8** %filename.addr, align 8
  %0 = load i8*, i8** %filename.addr, align 8
  %cmp = icmp eq i8* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i8* null, i8** %retval, align 8
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %filename.addr, align 8
  %call = call i64 @strlen(i8* %1) #6
  %add = add i64 %call, 1
  %call1 = call noalias i8* @malloc(i64 %add) #7
  store i8* %call1, i8** %retStr, align 8
  %2 = load i8*, i8** %retStr, align 8
  %cmp2 = icmp eq i8* %2, null
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i8* null, i8** %retval, align 8
  br label %return

if.end4:                                          ; preds = %if.end
  %3 = load i8*, i8** %retStr, align 8
  %4 = load i8*, i8** %filename.addr, align 8
  %call5 = call i8* @strcpy(i8* %3, i8* %4) #7
  %5 = load i8*, i8** %retStr, align 8
  %call6 = call i8* @strrchr(i8* %5, i32 46) #6
  store i8* %call6, i8** %lastExt, align 8
  %6 = load i8*, i8** %lastExt, align 8
  %cmp7 = icmp ne i8* %6, null
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end4
  %7 = load i8*, i8** %lastExt, align 8
  store i8 0, i8* %7, align 1
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end4
  %8 = load i8*, i8** %retStr, align 8
  store i8* %8, i8** %retval, align 8
  br label %return

return:                                           ; preds = %if.end9, %if.then3, %if.then
  %9 = load i8*, i8** %retval, align 8
  ret i8* %9
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind readonly willreturn
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind readonly willreturn
declare i8* @strrchr(i8*, i32) #2

; Function Attrs: noinline optnone uwtable
define void @populateInput(i8* %training_samples_filename, i8* %training_labels_filename, i8* %test_samples_filename, i8* %test_labels_filename, i64* %training_samples, i8* %training_labels, i64* %test_samples, i8* %test_labels) #3 {
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
  call void @exit(i32 -1) #8
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

declare noalias %struct._IO_FILE* @fopen(i8*, i8*) #4

declare i32 @printf(i8*, ...) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #4

declare i32 @fclose(%struct._IO_FILE*) #4

; Function Attrs: noinline optnone uwtable
define void @populateOutput(i8* %result, i8* %expected, i8* %filename) #3 {
entry:
  %result.addr = alloca i8*, align 8
  %expected.addr = alloca i8*, align 8
  %filename.addr = alloca i8*, align 8
  %correct_cnt = alloca i32, align 4
  %ofile = alloca %struct._IO_FILE*, align 8
  %filenameNoExt = alloca i8*, align 8
  %ext = alloca i8*, align 8
  %filenameLen = alloca i32, align 4
  %rawFilename = alloca i8*, align 8
  %rawOutput = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  store i8* %result, i8** %result.addr, align 8
  store i8* %expected, i8** %expected.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i32 0, i32* %correct_cnt, align 4
  %0 = load i8*, i8** %filename.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %ofile, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %cmp = icmp eq %struct._IO_FILE* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 1) #8
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %filename.addr, align 8
  %call2 = call i8* @_Z9removeExtPKc(i8* %2)
  store i8* %call2, i8** %filenameNoExt, align 8
  %3 = load i8*, i8** %filename.addr, align 8
  %call3 = call i8* @strrchr(i8* %3, i32 46) #6
  store i8* %call3, i8** %ext, align 8
  %4 = load i8*, i8** %filename.addr, align 8
  %call4 = call i64 @strlen(i8* %4) #6
  %conv = trunc i64 %call4 to i32
  store i32 %conv, i32* %filenameLen, align 4
  %5 = load i32, i32* %filenameLen, align 4
  %add = add nsw i32 %5, 5
  %conv5 = sext i32 %add to i64
  %call6 = call noalias i8* @malloc(i64 %conv5) #7
  store i8* %call6, i8** %rawFilename, align 8
  %6 = load i8*, i8** %rawFilename, align 8
  %7 = load i8*, i8** %filenameNoExt, align 8
  %call7 = call i8* @strcpy(i8* %6, i8* %7) #7
  %8 = load i8*, i8** %rawFilename, align 8
  %call8 = call i8* @strcat(i8* %8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0)) #7
  %9 = load i8*, i8** %rawFilename, align 8
  %10 = load i8*, i8** %ext, align 8
  %call9 = call i8* @strcat(i8* %9, i8* %10) #7
  %11 = load i8*, i8** %rawFilename, align 8
  %call10 = call noalias %struct._IO_FILE* @fopen(i8* %11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  store %struct._IO_FILE* %call10, %struct._IO_FILE** %rawOutput, align 8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %rawOutput, align 8
  %cmp11 = icmp eq %struct._IO_FILE* %12, null
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.end
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 1) #8
  unreachable

if.end14:                                         ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end14
  %13 = load i32, i32* %i, align 4
  %cmp15 = icmp slt i32 %13, 2000
  br i1 %cmp15, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %rawOutput, align 8
  %15 = load i8*, i8** %result.addr, align 8
  %16 = load i32, i32* %i, align 4
  %idxprom = sext i32 %16 to i64
  %arrayidx = getelementptr inbounds i8, i8* %15, i64 %idxprom
  %17 = load i8, i8* %arrayidx, align 1
  %conv16 = zext i8 %17 to i32
  %call17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i32 0, i32 0), i32 %conv16)
  %18 = load i8*, i8** %result.addr, align 8
  %19 = load i32, i32* %i, align 4
  %idxprom18 = sext i32 %19 to i64
  %arrayidx19 = getelementptr inbounds i8, i8* %18, i64 %idxprom18
  %20 = load i8, i8* %arrayidx19, align 1
  %conv20 = zext i8 %20 to i32
  %21 = load i8*, i8** %expected.addr, align 8
  %22 = load i32, i32* %i, align 4
  %idxprom21 = sext i32 %22 to i64
  %arrayidx22 = getelementptr inbounds i8, i8* %21, i64 %idxprom21
  %23 = load i8, i8* %arrayidx22, align 1
  %conv23 = zext i8 %23 to i32
  %cmp24 = icmp ne i32 %conv20, %conv23
  br i1 %cmp24, label %if.then25, label %if.else

if.then25:                                        ; preds = %for.body
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %25 = load i32, i32* %i, align 4
  %26 = load i8*, i8** %expected.addr, align 8
  %27 = load i32, i32* %i, align 4
  %idxprom26 = sext i32 %27 to i64
  %arrayidx27 = getelementptr inbounds i8, i8* %26, i64 %idxprom26
  %28 = load i8, i8* %arrayidx27, align 1
  %conv28 = zext i8 %28 to i32
  %29 = load i8*, i8** %result.addr, align 8
  %30 = load i32, i32* %i, align 4
  %idxprom29 = sext i32 %30 to i64
  %arrayidx30 = getelementptr inbounds i8, i8* %29, i64 %idxprom29
  %31 = load i8, i8* %arrayidx30, align 1
  %conv31 = zext i8 %31 to i32
  %call32 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.6, i32 0, i32 0), i32 %25, i32 %conv28, i32 %conv31)
  br label %if.end33

if.else:                                          ; preds = %for.body
  %32 = load i32, i32* %correct_cnt, align 4
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %correct_cnt, align 4
  br label %if.end33

if.end33:                                         ; preds = %if.else, %if.then25
  br label %for.inc

for.inc:                                          ; preds = %if.end33
  %33 = load i32, i32* %i, align 4
  %inc34 = add nsw i32 %33, 1
  store i32 %inc34, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %35 = load i32, i32* %correct_cnt, align 4
  %call35 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.7, i32 0, i32 0), i32 %35, i32 2000)
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call36 = call i32 @fclose(%struct._IO_FILE* %36)
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** %rawOutput, align 8
  %call37 = call i32 @fclose(%struct._IO_FILE* %37)
  ret void
}

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 "}
