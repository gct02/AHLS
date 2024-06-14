; ModuleID = '../src/iolib/populate_io.cpp'
source_filename = "../src/iolib/populate_io.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.MyRect = type { i32, i32, i32, i32 }

@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"Error: could not open file %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"Failed to open output file!\0A\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"_raw\00", align 1
@.str.5 = private unnamed_addr constant [19 x i8] c"\0Aresult_size = %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [40 x i8] c"\0A [Test Bench (main) ] detected rects: \00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"%d %d %d %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [37 x i8] c"\0A-- saving output image [Start] --\0D\0A\00", align 1
@.str.9 = private unnamed_addr constant [17 x i8] c"output_image.pgm\00", align 1
@.str.10 = private unnamed_addr constant [36 x i8] c"\0A-- saving output image [Done] --\0D\0A\00", align 1

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
  %call = call i64 @strlen(i8* %1) #7
  %add = add i64 %call, 1
  %call1 = call noalias i8* @malloc(i64 %add) #8
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
  %call5 = call i8* @strcpy(i8* %3, i8* %4) #8
  %5 = load i8*, i8** %retStr, align 8
  %call6 = call i8* @strrchr(i8* %5, i32 46) #7
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
define void @populateInput(i8* %filename, [320 x i8]* %input_image) #3 {
entry:
  %filename.addr = alloca i8*, align 8
  %input_image.addr = alloca [320 x i8]*, align 8
  %file = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 8
  store [320 x i8]* %input_image, [320 x i8]** %input_image.addr, align 8
  %0 = load i8*, i8** %filename.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %file, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8
  %cmp = icmp eq %struct._IO_FILE* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %filename.addr, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i32 0, i32 0), i8* %2)
  call void @exit(i32 1) #9
  unreachable

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc9, %if.end
  %3 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %3, 240
  br i1 %cmp2, label %for.body, label %for.end11

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %j, align 4
  %cmp4 = icmp slt i32 %4, 320
  br i1 %cmp4, label %for.body5, label %for.end

for.body5:                                        ; preds = %for.cond3
  %5 = load [320 x i8]*, [320 x i8]** %input_image.addr, align 8
  %6 = load i32, i32* %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds [320 x i8], [320 x i8]* %5, i64 %idxprom
  %7 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %7 to i64
  %arrayidx7 = getelementptr inbounds [320 x i8], [320 x i8]* %arrayidx, i64 0, i64 %idxprom6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8
  %call8 = call i64 @fread(i8* %arrayidx7, i64 1, i64 1, %struct._IO_FILE* %8)
  br label %for.inc

for.inc:                                          ; preds = %for.body5
  %9 = load i32, i32* %j, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond3

for.end:                                          ; preds = %for.cond3
  br label %for.inc9

for.inc9:                                         ; preds = %for.end
  %10 = load i32, i32* %i, align 4
  %inc10 = add nsw i32 %10, 1
  store i32 %inc10, i32* %i, align 4
  br label %for.cond

for.end11:                                        ; preds = %for.cond
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8
  %call12 = call i32 @fclose(%struct._IO_FILE* %11)
  ret void
}

declare noalias %struct._IO_FILE* @fopen(i8*, i8*) #4

declare i32 @printf(i8*, ...) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #4

declare i32 @fclose(%struct._IO_FILE*) #4

; Function Attrs: noinline optnone uwtable
define void @populateOutput(i32 %result_size, i32* %result_x, i32* %result_y, i32* %result_w, i32* %result_h, [320 x i8]* %Data, i8* %filename) #3 {
entry:
  %result_size.addr = alloca i32, align 4
  %result_x.addr = alloca i32*, align 8
  %result_y.addr = alloca i32*, align 8
  %result_w.addr = alloca i32*, align 8
  %result_h.addr = alloca i32*, align 8
  %Data.addr = alloca [320 x i8]*, align 8
  %filename.addr = alloca i8*, align 8
  %ofile = alloca %struct._IO_FILE*, align 8
  %filenameNoExt = alloca i8*, align 8
  %ext = alloca i8*, align 8
  %filenameLen = alloca i32, align 4
  %rawFilename = alloca i8*, align 8
  %rawOutput = alloca %struct._IO_FILE*, align 8
  %result = alloca [100 x %struct.MyRect], align 16
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %i67 = alloca i32, align 4
  %r = alloca %struct.MyRect, align 4
  %agg.tmp = alloca %struct.MyRect, align 4
  %flag = alloca i32, align 4
  store i32 %result_size, i32* %result_size.addr, align 4
  store i32* %result_x, i32** %result_x.addr, align 8
  store i32* %result_y, i32** %result_y.addr, align 8
  store i32* %result_w, i32** %result_w.addr, align 8
  store i32* %result_h, i32** %result_h.addr, align 8
  store [320 x i8]* %Data, [320 x i8]** %Data.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  %0 = load i8*, i8** %filename.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %ofile, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %cmp = icmp eq %struct._IO_FILE* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 1) #9
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i8*, i8** %filename.addr, align 8
  %call2 = call i8* @_Z9removeExtPKc(i8* %2)
  store i8* %call2, i8** %filenameNoExt, align 8
  %3 = load i8*, i8** %filename.addr, align 8
  %call3 = call i8* @strrchr(i8* %3, i32 46) #7
  store i8* %call3, i8** %ext, align 8
  %4 = load i8*, i8** %filename.addr, align 8
  %call4 = call i64 @strlen(i8* %4) #7
  %conv = trunc i64 %call4 to i32
  store i32 %conv, i32* %filenameLen, align 4
  %5 = load i32, i32* %filenameLen, align 4
  %add = add nsw i32 %5, 5
  %conv5 = sext i32 %add to i64
  %call6 = call noalias i8* @malloc(i64 %conv5) #8
  store i8* %call6, i8** %rawFilename, align 8
  %6 = load i8*, i8** %rawFilename, align 8
  %7 = load i8*, i8** %filenameNoExt, align 8
  %call7 = call i8* @strcpy(i8* %6, i8* %7) #8
  %8 = load i8*, i8** %rawFilename, align 8
  %call8 = call i8* @strcat(i8* %8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0)) #8
  %9 = load i8*, i8** %rawFilename, align 8
  %10 = load i8*, i8** %ext, align 8
  %call9 = call i8* @strcat(i8* %9, i8* %10) #8
  %11 = load i8*, i8** %rawFilename, align 8
  %call10 = call noalias %struct._IO_FILE* @fopen(i8* %11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  store %struct._IO_FILE* %call10, %struct._IO_FILE** %rawOutput, align 8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %rawOutput, align 8
  %cmp11 = icmp eq %struct._IO_FILE* %12, null
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.end
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i32 0, i32 0))
  call void @exit(i32 1) #9
  unreachable

if.end14:                                         ; preds = %if.end
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %14 = load i32, i32* %result_size.addr, align 4
  %call15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i32 0, i32 0), i32 %14)
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end14
  %15 = load i32, i32* %j, align 4
  %cmp16 = icmp slt i32 %15, 100
  br i1 %cmp16, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %16 = load i32*, i32** %result_x.addr, align 8
  %17 = load i32, i32* %j, align 4
  %idxprom = sext i32 %17 to i64
  %arrayidx = getelementptr inbounds i32, i32* %16, i64 %idxprom
  %18 = load i32, i32* %arrayidx, align 4
  %19 = load i32, i32* %j, align 4
  %idxprom17 = sext i32 %19 to i64
  %arrayidx18 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom17
  %x = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx18, i32 0, i32 0
  store i32 %18, i32* %x, align 16
  %20 = load i32*, i32** %result_y.addr, align 8
  %21 = load i32, i32* %j, align 4
  %idxprom19 = sext i32 %21 to i64
  %arrayidx20 = getelementptr inbounds i32, i32* %20, i64 %idxprom19
  %22 = load i32, i32* %arrayidx20, align 4
  %23 = load i32, i32* %j, align 4
  %idxprom21 = sext i32 %23 to i64
  %arrayidx22 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom21
  %y = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx22, i32 0, i32 1
  store i32 %22, i32* %y, align 4
  %24 = load i32*, i32** %result_w.addr, align 8
  %25 = load i32, i32* %j, align 4
  %idxprom23 = sext i32 %25 to i64
  %arrayidx24 = getelementptr inbounds i32, i32* %24, i64 %idxprom23
  %26 = load i32, i32* %arrayidx24, align 4
  %27 = load i32, i32* %j, align 4
  %idxprom25 = sext i32 %27 to i64
  %arrayidx26 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom25
  %width = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx26, i32 0, i32 2
  store i32 %26, i32* %width, align 8
  %28 = load i32*, i32** %result_h.addr, align 8
  %29 = load i32, i32* %j, align 4
  %idxprom27 = sext i32 %29 to i64
  %arrayidx28 = getelementptr inbounds i32, i32* %28, i64 %idxprom27
  %30 = load i32, i32* %arrayidx28, align 4
  %31 = load i32, i32* %j, align 4
  %idxprom29 = sext i32 %31 to i64
  %arrayidx30 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom29
  %height = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx30, i32 0, i32 3
  store i32 %30, i32* %height, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %32 = load i32, i32* %j, align 4
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc61, %for.end
  %33 = load i32, i32* %i, align 4
  %34 = load i32, i32* %result_size.addr, align 4
  %cmp32 = icmp slt i32 %33, %34
  br i1 %cmp32, label %for.body33, label %for.end63

for.body33:                                       ; preds = %for.cond31
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.6, i32 0, i32 0))
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %37 = load i32, i32* %i, align 4
  %idxprom35 = sext i32 %37 to i64
  %arrayidx36 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom35
  %x37 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx36, i32 0, i32 0
  %38 = load i32, i32* %x37, align 16
  %39 = load i32, i32* %i, align 4
  %idxprom38 = sext i32 %39 to i64
  %arrayidx39 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom38
  %y40 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx39, i32 0, i32 1
  %40 = load i32, i32* %y40, align 4
  %41 = load i32, i32* %i, align 4
  %idxprom41 = sext i32 %41 to i64
  %arrayidx42 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom41
  %width43 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx42, i32 0, i32 2
  %42 = load i32, i32* %width43, align 8
  %43 = load i32, i32* %i, align 4
  %idxprom44 = sext i32 %43 to i64
  %arrayidx45 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom44
  %height46 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx45, i32 0, i32 3
  %44 = load i32, i32* %height46, align 4
  %call47 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0), i32 %38, i32 %40, i32 %42, i32 %44)
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** %rawOutput, align 8
  %46 = load i32, i32* %i, align 4
  %idxprom48 = sext i32 %46 to i64
  %arrayidx49 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom48
  %x50 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx49, i32 0, i32 0
  %47 = load i32, i32* %x50, align 16
  %48 = load i32, i32* %i, align 4
  %idxprom51 = sext i32 %48 to i64
  %arrayidx52 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom51
  %y53 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx52, i32 0, i32 1
  %49 = load i32, i32* %y53, align 4
  %50 = load i32, i32* %i, align 4
  %idxprom54 = sext i32 %50 to i64
  %arrayidx55 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom54
  %width56 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx55, i32 0, i32 2
  %51 = load i32, i32* %width56, align 8
  %52 = load i32, i32* %i, align 4
  %idxprom57 = sext i32 %52 to i64
  %arrayidx58 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom57
  %height59 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx58, i32 0, i32 3
  %53 = load i32, i32* %height59, align 4
  %call60 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0), i32 %47, i32 %49, i32 %51, i32 %53)
  br label %for.inc61

for.inc61:                                        ; preds = %for.body33
  %54 = load i32, i32* %i, align 4
  %inc62 = add nsw i32 %54, 1
  store i32 %inc62, i32* %i, align 4
  br label %for.cond31

for.end63:                                        ; preds = %for.cond31
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call64 = call i32 @fclose(%struct._IO_FILE* %55)
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** %rawOutput, align 8
  %call65 = call i32 @fclose(%struct._IO_FILE* %56)
  %call66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.8, i32 0, i32 0))
  store i32 0, i32* %i67, align 4
  br label %for.cond68

for.cond68:                                       ; preds = %for.inc73, %for.end63
  %57 = load i32, i32* %i67, align 4
  %58 = load i32, i32* %result_size.addr, align 4
  %cmp69 = icmp slt i32 %57, %58
  br i1 %cmp69, label %for.body70, label %for.end75

for.body70:                                       ; preds = %for.cond68
  %59 = load i32, i32* %i67, align 4
  %idxprom71 = sext i32 %59 to i64
  %arrayidx72 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom71
  %60 = bitcast %struct.MyRect* %r to i8*
  %61 = bitcast %struct.MyRect* %arrayidx72 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %60, i8* align 4 %61, i64 16, i1 false)
  %62 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8
  %63 = bitcast %struct.MyRect* %agg.tmp to i8*
  %64 = bitcast %struct.MyRect* %r to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %63, i8* align 4 %64, i64 16, i1 false)
  %65 = bitcast %struct.MyRect* %agg.tmp to { i64, i64 }*
  %66 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %65, i32 0, i32 0
  %67 = load i64, i64* %66, align 4
  %68 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %65, i32 0, i32 1
  %69 = load i64, i64* %68, align 4
  call void @drawRectangle([320 x i8]* %62, i64 %67, i64 %69)
  br label %for.inc73

for.inc73:                                        ; preds = %for.body70
  %70 = load i32, i32* %i67, align 4
  %inc74 = add nsw i32 %70, 1
  store i32 %inc74, i32* %i67, align 4
  br label %for.cond68

for.end75:                                        ; preds = %for.cond68
  %71 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8
  %call76 = call i32 @writePgm(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.9, i32 0, i32 0), [320 x i8]* %71)
  store i32 %call76, i32* %flag, align 4
  %call77 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.10, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #6

declare void @drawRectangle([320 x i8]*, i64, i64) #4

declare i32 @writePgm(i8*, [320 x i8]*) #4

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 "}
