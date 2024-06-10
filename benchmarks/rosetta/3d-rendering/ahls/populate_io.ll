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
@.str.2 = private unnamed_addr constant [46 x i8] c"%hhu %hhu %hhu %hhu %hhu %hhu %hhu %hhu %hhu\0A\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"Image After Rendering: \0A\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline optnone uwtable
define void @populateInput(i8* %filename, %struct.Triangle_3D* %triangle_3ds) #0 {
entry:
  %filename.addr = alloca i8*, align 8
  %triangle_3ds.addr = alloca %struct.Triangle_3D*, align 8
  %file = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  store i8* %filename, i8** %filename.addr, align 8
  store %struct.Triangle_3D* %triangle_3ds, %struct.Triangle_3D** %triangle_3ds.addr, align 8
  %0 = load i8*, i8** %filename.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %file, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8
  %cmp = icmp eq %struct._IO_FILE* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i32 0, i32 0))
  call void @exit(i32 1) #3
  unreachable

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %2, 3192
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8
  %4 = load %struct.Triangle_3D*, %struct.Triangle_3D** %triangle_3ds.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %4, i64 %idxprom
  %x0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx, i32 0, i32 0
  %6 = load %struct.Triangle_3D*, %struct.Triangle_3D** %triangle_3ds.addr, align 8
  %7 = load i32, i32* %i, align 4
  %idxprom3 = sext i32 %7 to i64
  %arrayidx4 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %6, i64 %idxprom3
  %y0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx4, i32 0, i32 1
  %8 = load %struct.Triangle_3D*, %struct.Triangle_3D** %triangle_3ds.addr, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom5 = sext i32 %9 to i64
  %arrayidx6 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %8, i64 %idxprom5
  %z0 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx6, i32 0, i32 2
  %10 = load %struct.Triangle_3D*, %struct.Triangle_3D** %triangle_3ds.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom7 = sext i32 %11 to i64
  %arrayidx8 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %10, i64 %idxprom7
  %x1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx8, i32 0, i32 3
  %12 = load %struct.Triangle_3D*, %struct.Triangle_3D** %triangle_3ds.addr, align 8
  %13 = load i32, i32* %i, align 4
  %idxprom9 = sext i32 %13 to i64
  %arrayidx10 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %12, i64 %idxprom9
  %y1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx10, i32 0, i32 4
  %14 = load %struct.Triangle_3D*, %struct.Triangle_3D** %triangle_3ds.addr, align 8
  %15 = load i32, i32* %i, align 4
  %idxprom11 = sext i32 %15 to i64
  %arrayidx12 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %14, i64 %idxprom11
  %z1 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx12, i32 0, i32 5
  %16 = load %struct.Triangle_3D*, %struct.Triangle_3D** %triangle_3ds.addr, align 8
  %17 = load i32, i32* %i, align 4
  %idxprom13 = sext i32 %17 to i64
  %arrayidx14 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %16, i64 %idxprom13
  %x2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx14, i32 0, i32 6
  %18 = load %struct.Triangle_3D*, %struct.Triangle_3D** %triangle_3ds.addr, align 8
  %19 = load i32, i32* %i, align 4
  %idxprom15 = sext i32 %19 to i64
  %arrayidx16 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %18, i64 %idxprom15
  %y2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx16, i32 0, i32 7
  %20 = load %struct.Triangle_3D*, %struct.Triangle_3D** %triangle_3ds.addr, align 8
  %21 = load i32, i32* %i, align 4
  %idxprom17 = sext i32 %21 to i64
  %arrayidx18 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %20, i64 %idxprom17
  %z2 = getelementptr inbounds %struct.Triangle_3D, %struct.Triangle_3D* %arrayidx18, i32 0, i32 8
  %call19 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.2, i32 0, i32 0), i8* %x0, i8* %y0, i8* %z0, i8* %x1, i8* %y1, i8* %z1, i8* %x2, i8* %y2, i8* %z2)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare noalias %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noinline optnone uwtable
define void @populateOutput([256 x i8]* %output) #0 {
entry:
  %output.addr = alloca [256 x i8]*, align 8
  %ofile = alloca %struct._IO_FILE*, align 8
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %pix = alloca i32, align 4
  store [256 x i8]* %output, [256 x i8]** %output.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %ofile, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %cmp = icmp eq %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.1, i32 0, i32 0))
  call void @exit(i32 1) #3
  unreachable

if.end:                                           ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.5, i32 0, i32 0))
  store i32 255, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc14, %if.end
  %2 = load i32, i32* %j, align 4
  %cmp3 = icmp sge i32 %2, 0
  br i1 %cmp3, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body
  %3 = load i32, i32* %i, align 4
  %cmp5 = icmp slt i32 %3, 256
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %4 = load [256 x i8]*, [256 x i8]** %output.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* %4, i64 %idxprom
  %6 = load i32, i32* %j, align 4
  %idxprom7 = sext i32 %6 to i64
  %arrayidx8 = getelementptr inbounds [256 x i8], [256 x i8]* %arrayidx, i64 0, i64 %idxprom7
  %7 = load i8, i8* %arrayidx8, align 1
  %conv = zext i8 %7 to i32
  store i32 %conv, i32* %pix, align 4
  %8 = load i32, i32* %pix, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then9, label %if.else

if.then9:                                         ; preds = %for.body6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call10 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  br label %if.end12

if.else:                                          ; preds = %for.body6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i32 0, i32 0))
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then9
  br label %for.inc

for.inc:                                          ; preds = %if.end12
  %11 = load i32, i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0))
  br label %for.inc14

for.inc14:                                        ; preds = %for.end
  %13 = load i32, i32* %j, align 4
  %dec = add nsw i32 %13, -1
  store i32 %dec, i32* %j, align 4
  br label %for.cond

for.end15:                                        ; preds = %for.cond
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
