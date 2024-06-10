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
@.str.2 = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.4 = private unnamed_addr constant [35 x i8] c"Error: could not open output file\0A\00", align 1
@.str.5 = private unnamed_addr constant [19 x i8] c"\0Aresult_size = %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [40 x i8] c"\0A [Test Bench (main) ] detected rects: \00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"%d %d %d %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [37 x i8] c"\0A-- saving output image [Start] --\0D\0A\00", align 1
@.str.9 = private unnamed_addr constant [17 x i8] c"output_image.pgm\00", align 1
@.str.10 = private unnamed_addr constant [36 x i8] c"\0A-- saving output image [Done] --\0D\0A\00", align 1

; Function Attrs: noinline optnone uwtable
define void @populateInput(i8* %filename, [320 x i8]* %input_image) #0 {
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
  call void @exit(i32 1) #4
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

declare noalias %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: noinline optnone uwtable
define void @populateOutput(i32 %result_size, i32* %result_x, i32* %result_y, i32* %result_w, i32* %result_h, [320 x i8]* %Data) #0 {
entry:
  %result_size.addr = alloca i32, align 4
  %result_x.addr = alloca i32*, align 8
  %result_y.addr = alloca i32*, align 8
  %result_w.addr = alloca i32*, align 8
  %result_h.addr = alloca i32*, align 8
  %Data.addr = alloca [320 x i8]*, align 8
  %ofile = alloca %struct._IO_FILE*, align 8
  %result = alloca [100 x %struct.MyRect], align 16
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %i40 = alloca i32, align 4
  %r = alloca %struct.MyRect, align 4
  %agg.tmp = alloca %struct.MyRect, align 4
  %flag = alloca i32, align 4
  store i32 %result_size, i32* %result_size.addr, align 4
  store i32* %result_x, i32** %result_x.addr, align 8
  store i32* %result_y, i32** %result_y.addr, align 8
  store i32* %result_w, i32** %result_w.addr, align 8
  store i32* %result_h, i32** %result_h.addr, align 8
  store [320 x i8]* %Data, [320 x i8]** %Data.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %ofile, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %cmp = icmp eq %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 1) #4
  unreachable

if.end:                                           ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %2 = load i32, i32* %result_size.addr, align 4
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.5, i32 0, i32 0), i32 %2)
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %j, align 4
  %cmp3 = icmp slt i32 %3, 100
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %result_x.addr, align 8
  %5 = load i32, i32* %j, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom
  %6 = load i32, i32* %arrayidx, align 4
  %7 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %7 to i64
  %arrayidx5 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom4
  %x = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx5, i32 0, i32 0
  store i32 %6, i32* %x, align 16
  %8 = load i32*, i32** %result_y.addr, align 8
  %9 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %9 to i64
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %idxprom6
  %10 = load i32, i32* %arrayidx7, align 4
  %11 = load i32, i32* %j, align 4
  %idxprom8 = sext i32 %11 to i64
  %arrayidx9 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom8
  %y = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx9, i32 0, i32 1
  store i32 %10, i32* %y, align 4
  %12 = load i32*, i32** %result_w.addr, align 8
  %13 = load i32, i32* %j, align 4
  %idxprom10 = sext i32 %13 to i64
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10
  %14 = load i32, i32* %arrayidx11, align 4
  %15 = load i32, i32* %j, align 4
  %idxprom12 = sext i32 %15 to i64
  %arrayidx13 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom12
  %width = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx13, i32 0, i32 2
  store i32 %14, i32* %width, align 8
  %16 = load i32*, i32** %result_h.addr, align 8
  %17 = load i32, i32* %j, align 4
  %idxprom14 = sext i32 %17 to i64
  %arrayidx15 = getelementptr inbounds i32, i32* %16, i64 %idxprom14
  %18 = load i32, i32* %arrayidx15, align 4
  %19 = load i32, i32* %j, align 4
  %idxprom16 = sext i32 %19 to i64
  %arrayidx17 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom16
  %height = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx17, i32 0, i32 3
  store i32 %18, i32* %height, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %j, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc35, %for.end
  %21 = load i32, i32* %i, align 4
  %22 = load i32, i32* %result_size.addr, align 4
  %cmp19 = icmp slt i32 %21, %22
  br i1 %cmp19, label %for.body20, label %for.end37

for.body20:                                       ; preds = %for.cond18
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.6, i32 0, i32 0))
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %25 = load i32, i32* %i, align 4
  %idxprom22 = sext i32 %25 to i64
  %arrayidx23 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom22
  %x24 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx23, i32 0, i32 0
  %26 = load i32, i32* %x24, align 16
  %27 = load i32, i32* %i, align 4
  %idxprom25 = sext i32 %27 to i64
  %arrayidx26 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom25
  %y27 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx26, i32 0, i32 1
  %28 = load i32, i32* %y27, align 4
  %29 = load i32, i32* %i, align 4
  %idxprom28 = sext i32 %29 to i64
  %arrayidx29 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom28
  %width30 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx29, i32 0, i32 2
  %30 = load i32, i32* %width30, align 8
  %31 = load i32, i32* %i, align 4
  %idxprom31 = sext i32 %31 to i64
  %arrayidx32 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom31
  %height33 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %arrayidx32, i32 0, i32 3
  %32 = load i32, i32* %height33, align 4
  %call34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.7, i32 0, i32 0), i32 %26, i32 %28, i32 %30, i32 %32)
  br label %for.inc35

for.inc35:                                        ; preds = %for.body20
  %33 = load i32, i32* %i, align 4
  %inc36 = add nsw i32 %33, 1
  store i32 %inc36, i32* %i, align 4
  br label %for.cond18

for.end37:                                        ; preds = %for.cond18
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call38 = call i32 @fclose(%struct._IO_FILE* %34)
  %call39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.8, i32 0, i32 0))
  store i32 0, i32* %i40, align 4
  br label %for.cond41

for.cond41:                                       ; preds = %for.inc46, %for.end37
  %35 = load i32, i32* %i40, align 4
  %36 = load i32, i32* %result_size.addr, align 4
  %cmp42 = icmp slt i32 %35, %36
  br i1 %cmp42, label %for.body43, label %for.end48

for.body43:                                       ; preds = %for.cond41
  %37 = load i32, i32* %i40, align 4
  %idxprom44 = sext i32 %37 to i64
  %arrayidx45 = getelementptr inbounds [100 x %struct.MyRect], [100 x %struct.MyRect]* %result, i64 0, i64 %idxprom44
  %38 = bitcast %struct.MyRect* %r to i8*
  %39 = bitcast %struct.MyRect* %arrayidx45 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %38, i8* align 4 %39, i64 16, i1 false)
  %40 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8
  %41 = bitcast %struct.MyRect* %agg.tmp to i8*
  %42 = bitcast %struct.MyRect* %r to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %41, i8* align 4 %42, i64 16, i1 false)
  %43 = bitcast %struct.MyRect* %agg.tmp to { i64, i64 }*
  %44 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %43, i32 0, i32 0
  %45 = load i64, i64* %44, align 4
  %46 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %43, i32 0, i32 1
  %47 = load i64, i64* %46, align 4
  call void @drawRectangle([320 x i8]* %40, i64 %45, i64 %47)
  br label %for.inc46

for.inc46:                                        ; preds = %for.body43
  %48 = load i32, i32* %i40, align 4
  %inc47 = add nsw i32 %48, 1
  store i32 %inc47, i32* %i40, align 4
  br label %for.cond41

for.end48:                                        ; preds = %for.cond41
  %49 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8
  %call49 = call i32 @writePgm(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.9, i32 0, i32 0), [320 x i8]* %49)
  store i32 %call49, i32* %flag, align 4
  %call50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.10, i32 0, i32 0))
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #3

declare void @drawRectangle([320 x i8]*, i64, i64) #1

declare i32 @writePgm(i8*, [320 x i8]*) #1

attributes #0 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 "}
