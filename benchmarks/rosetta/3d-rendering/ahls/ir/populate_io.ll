; ModuleID = '../src/iolib/populate_io.cpp'
source_filename = "../src/iolib/populate_io.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Triangle_3D = type { i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1 = private unnamed_addr constant [28 x i8] c"Failed to open input file!\0A\00", align 1
@.str.2 = private unnamed_addr constant [45 x i8] c"Failed to allocate memory for triangle_3ds!\0A\00", align 1
@.str.3 = private unnamed_addr constant [46 x i8] c"%hhu %hhu %hhu %hhu %hhu %hhu %hhu %hhu %hhu\0A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"Failed to open output file!\0A\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"_raw\00", align 1
@.str.7 = private unnamed_addr constant [25 x i8] c"Image After Rendering: \0A\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.10 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

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
define void @populateInput(i8* %filename, %struct.Triangle_3D** %triangle_3ds, i32 %num_3d_tri) #3 {
entry:
  %filename.addr = alloca i8*, align 8
  %triangle_3ds.addr = alloca %struct.Triangle_3D**, align 8
  %num_3d_tri.addr = alloca i32, align 4
  %file = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 8
  store %struct.Triangle_3D** %triangle_3ds, %struct.Triangle_3D*** %triangle_3ds.addr, align 8
  store i32 %num_3d_tri, i32* %num_3d_tri.addr, align 4
  %0 = load i8*, i8** %filename.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %file, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8
  %cmp = icmp eq %struct._IO_FILE* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i32 0, i32 0))
  call void @exit(i32 1) #8
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %num_3d_tri.addr, align 4
  %conv = sext i32 %2 to i64
  %mul = mul i64 %conv, 9
  %call2 = call noalias i8* @malloc(i64 %mul) #7
  %3 = bitcast i8* %call2 to %struct.Triangle_3D*
  %4 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangle_3ds.addr, align 8
  store %struct.Triangle_3D* %3, %struct.Triangle_3D** %4, align 8
  %5 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangle_3ds.addr, align 8
  %6 = load %struct.Triangle_3D*, %struct.Triangle_3D** %5, align 8
  %cmp3 = icmp eq %struct.Triangle_3D* %6, null
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.2, i32 0, i32 0))
  call void @exit(i32 1) #8
  unreachable

if.end6:                                          ; preds = %if.end
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end6
  %7 = load i32, i32* %i, align 4
  %8 = load i32, i32* %num_3d_tri.addr, align 4
  %cmp7 = icmp slt i32 %7, %8
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8
  %10 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangle_3ds.addr, align 8
  %11 = load %struct.Triangle_3D*, %struct.Triangle_3D** %10, align 8
  %12 = load i32, i32* %i, align 4
  %idxprom = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %11, i64 %idxprom
  %x0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx, i32 0, i32 0
  %13 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangle_3ds.addr, align 8
  %14 = load %struct.Triangle_3D*, %struct.Triangle_3D** %13, align 8
  %15 = load i32, i32* %i, align 4
  %idxprom8 = sext i32 %15 to i64
  %arrayidx9 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %14, i64 %idxprom8
  %y0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx9, i32 0, i32 1
  %16 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangle_3ds.addr, align 8
  %17 = load %struct.Triangle_3D*, %struct.Triangle_3D** %16, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom10 = sext i32 %18 to i64
  %arrayidx11 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %17, i64 %idxprom10
  %z0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx11, i32 0, i32 2
  %19 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangle_3ds.addr, align 8
  %20 = load %struct.Triangle_3D*, %struct.Triangle_3D** %19, align 8
  %21 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %21 to i64
  %arrayidx13 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %20, i64 %idxprom12
  %x1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx13, i32 0, i32 3
  %22 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangle_3ds.addr, align 8
  %23 = load %struct.Triangle_3D*, %struct.Triangle_3D** %22, align 8
  %24 = load i32, i32* %i, align 4
  %idxprom14 = sext i32 %24 to i64
  %arrayidx15 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %23, i64 %idxprom14
  %y1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx15, i32 0, i32 4
  %25 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangle_3ds.addr, align 8
  %26 = load %struct.Triangle_3D*, %struct.Triangle_3D** %25, align 8
  %27 = load i32, i32* %i, align 4
  %idxprom16 = sext i32 %27 to i64
  %arrayidx17 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %26, i64 %idxprom16
  %z1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx17, i32 0, i32 5
  %28 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangle_3ds.addr, align 8
  %29 = load %struct.Triangle_3D*, %struct.Triangle_3D** %28, align 8
  %30 = load i32, i32* %i, align 4
  %idxprom18 = sext i32 %30 to i64
  %arrayidx19 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %29, i64 %idxprom18
  %x2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx19, i32 0, i32 6
  %31 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangle_3ds.addr, align 8
  %32 = load %struct.Triangle_3D*, %struct.Triangle_3D** %31, align 8
  %33 = load i32, i32* %i, align 4
  %idxprom20 = sext i32 %33 to i64
  %arrayidx21 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %32, i64 %idxprom20
  %y2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx21, i32 0, i32 7
  %34 = load %struct.Triangle_3D**, %struct.Triangle_3D*** %triangle_3ds.addr, align 8
  %35 = load %struct.Triangle_3D*, %struct.Triangle_3D** %34, align 8
  %36 = load i32, i32* %i, align 4
  %idxprom22 = sext i32 %36 to i64
  %arrayidx23 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %35, i64 %idxprom22
  %z2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx23, i32 0, i32 8
  %call24 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.3, i32 0, i32 0), i8* %x0, i8* %y0, i8* %z0, i8* %x1, i8* %y1, i8* %z1, i8* %x2, i8* %y2, i8* %z2)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %37 = load i32, i32* %i, align 4
  %inc = add nsw i32 %37, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare noalias %struct._IO_FILE* @fopen(i8*, i8*) #4

declare i32 @printf(i8*, ...) #4

; Function Attrs: noreturn nounwind
declare void @exit(i32) #5

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #4

; Function Attrs: noinline optnone uwtable
define void @populateOutput([256 x i8]* %output, i8* %filename) #3 {
entry:
  %output.addr = alloca [256 x i8]*, align 8
  %filename.addr = alloca i8*, align 8
  %ofile = alloca %struct._IO_FILE*, align 8
  %filenameNoExt = alloca i8*, align 8
  %ext = alloca i8*, align 8
  %filenameLen = alloca i32, align 4
  %rawFilename = alloca i8*, align 8
  %rawOutput = alloca %struct._IO_FILE*, align 8
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %pix = alloca i32, align 4
  store [256 x i8]* %output, [256 x i8]** %output.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  %0 = load i8*, i8** %filename.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %ofile, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %cmp = icmp eq %struct._IO_FILE* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i32 0, i32 0))
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
  %call8 = call i8* @strcat(i8* %8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0)) #7
  %9 = load i8*, i8** %rawFilename, align 8
  %10 = load i8*, i8** %ext, align 8
  %call9 = call i8* @strcat(i8* %9, i8* %10) #7
  %11 = load i8*, i8** %rawFilename, align 8
  %call10 = call noalias %struct._IO_FILE* @fopen(i8* %11, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %call10, %struct._IO_FILE** %rawOutput, align 8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %rawOutput, align 8
  %cmp11 = icmp eq %struct._IO_FILE* %12, null
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.end
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.5, i32 0, i32 0))
  call void @exit(i32 1) #8
  unreachable

if.end14:                                         ; preds = %if.end
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.7, i32 0, i32 0))
  store i32 255, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc35, %if.end14
  %14 = load i32, i32* %j, align 4
  %cmp16 = icmp sge i32 %14, 0
  br i1 %cmp16, label %for.body, label %for.end36

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc, %for.body
  %15 = load i32, i32* %i, align 4
  %cmp18 = icmp slt i32 %15, 256
  br i1 %cmp18, label %for.body19, label %for.end

for.body19:                                       ; preds = %for.cond17
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %rawOutput, align 8
  %17 = load [256 x i8]*, [256 x i8]** %output.addr, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom = sext i32 %18 to i64
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* %17, i64 %idxprom
  %19 = load i32, i32* %j, align 4
  %idxprom20 = sext i32 %19 to i64
  %arrayidx21 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx, i64 0, i64 %idxprom20
  %20 = load i8, i8* %arrayidx21, align 1
  %conv22 = zext i8 %20 to i32
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i32 %conv22)
  %21 = load [256 x i8]*, [256 x i8]** %output.addr, align 8
  %22 = load i32, i32* %i, align 4
  %idxprom24 = sext i32 %22 to i64
  %arrayidx25 = getelementptr inbounds [256 x i8], [256 x i8]* %21, i64 %idxprom24
  %23 = load i32, i32* %j, align 4
  %idxprom26 = sext i32 %23 to i64
  %arrayidx27 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx25, i64 0, i64 %idxprom26
  %24 = load i8, i8* %arrayidx27, align 1
  %conv28 = zext i8 %24 to i32
  store i32 %conv28, i32* %pix, align 4
  %25 = load i32, i32* %pix, align 4
  %tobool = icmp ne i32 %25, 0
  br i1 %tobool, label %if.then29, label %if.else

if.then29:                                        ; preds = %for.body19
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call30 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0))
  br label %if.end32

if.else:                                          ; preds = %for.body19
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call31 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.10, i32 0, i32 0))
  br label %if.end32

if.end32:                                         ; preds = %if.else, %if.then29
  br label %for.inc

for.inc:                                          ; preds = %if.end32
  %28 = load i32, i32* %i, align 4
  %inc = add nsw i32 %28, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond17

for.end:                                          ; preds = %for.cond17
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call33 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0))
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %rawOutput, align 8
  %call34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0))
  br label %for.inc35

for.inc35:                                        ; preds = %for.end
  %31 = load i32, i32* %j, align 4
  %dec = add nsw i32 %31, -1
  store i32 %dec, i32* %j, align 4
  br label %for.cond

for.end36:                                        ; preds = %for.cond
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call37 = call i32 @fclose(%struct._IO_FILE* %32)
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** %rawOutput, align 8
  %call38 = call i32 @fclose(%struct._IO_FILE* %33)
  ret void
}

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #4

declare i32 @fclose(%struct._IO_FILE*) #4

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
