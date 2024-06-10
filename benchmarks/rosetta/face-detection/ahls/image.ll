; ModuleID = '../src/image.cpp'
source_filename = "../src/image.cpp"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.MyRect = type { i32, i32, i32, i32 }

@.str = private unnamed_addr constant [3 x i8] c"P5\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Unable to open file %s\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i8* @_Z6strrevPc(i8* %str) #0 {
entry:
  %retval = alloca i8*, align 8
  %str.addr = alloca i8*, align 8
  %p1 = alloca i8*, align 8
  %p2 = alloca i8*, align 8
  store i8* %str, i8** %str.addr, align 8
  %0 = load i8*, i8** %str.addr, align 8
  %tobool = icmp ne i8* %0, null
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %str.addr, align 8
  %2 = load i8, i8* %1, align 1
  %tobool1 = icmp ne i8 %2, 0
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i8*, i8** %str.addr, align 8
  store i8* %3, i8** %retval, align 8
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i8*, i8** %str.addr, align 8
  store i8* %4, i8** %p1, align 8
  %5 = load i8*, i8** %str.addr, align 8
  %6 = load i8*, i8** %str.addr, align 8
  %call = call i64 @strlen(i8* %6) #4
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 %call
  %add.ptr2 = getelementptr inbounds i8, i8* %add.ptr, i64 -1
  store i8* %add.ptr2, i8** %p2, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i8*, i8** %p2, align 8
  %8 = load i8*, i8** %p1, align 8
  %cmp = icmp ugt i8* %7, %8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %p2, align 8
  %10 = load i8, i8* %9, align 1
  %conv = sext i8 %10 to i32
  %11 = load i8*, i8** %p1, align 8
  %12 = load i8, i8* %11, align 1
  %conv3 = sext i8 %12 to i32
  %xor = xor i32 %conv3, %conv
  %conv4 = trunc i32 %xor to i8
  store i8 %conv4, i8* %11, align 1
  %13 = load i8*, i8** %p1, align 8
  %14 = load i8, i8* %13, align 1
  %conv5 = sext i8 %14 to i32
  %15 = load i8*, i8** %p2, align 8
  %16 = load i8, i8* %15, align 1
  %conv6 = sext i8 %16 to i32
  %xor7 = xor i32 %conv6, %conv5
  %conv8 = trunc i32 %xor7 to i8
  store i8 %conv8, i8* %15, align 1
  %17 = load i8*, i8** %p2, align 8
  %18 = load i8, i8* %17, align 1
  %conv9 = sext i8 %18 to i32
  %19 = load i8*, i8** %p1, align 8
  %20 = load i8, i8* %19, align 1
  %conv10 = sext i8 %20 to i32
  %xor11 = xor i32 %conv10, %conv9
  %conv12 = trunc i32 %xor11 to i8
  store i8 %conv12, i8* %19, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %21 = load i8*, i8** %p1, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %21, i32 1
  store i8* %incdec.ptr, i8** %p1, align 8
  %22 = load i8*, i8** %p2, align 8
  %incdec.ptr13 = getelementptr inbounds i8, i8* %22, i32 -1
  store i8* %incdec.ptr13, i8** %p2, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %23 = load i8*, i8** %str.addr, align 8
  store i8* %23, i8** %retval, align 8
  br label %return

return:                                           ; preds = %for.end, %if.then
  %24 = load i8*, i8** %retval, align 8
  ret i8* %24
}

; Function Attrs: nounwind readonly willreturn
declare i64 @strlen(i8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define void @_Z7itochariPci(i32 %x, i8* %szBuffer, i32 %radix) #0 {
entry:
  %x.addr = alloca i32, align 4
  %szBuffer.addr = alloca i8*, align 8
  %radix.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %xx = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i8* %szBuffer, i8** %szBuffer.addr, align 8
  store i32 %radix, i32* %radix.addr, align 4
  store i32 0, i32* %i, align 4
  %0 = load i32, i32* %x.addr, align 4
  store i32 %0, i32* %n, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i32, i32* %n, align 4
  %cmp = icmp sgt i32 %1, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %n, align 4
  %3 = load i32, i32* %radix.addr, align 4
  %rem = srem i32 %2, %3
  store i32 %rem, i32* %xx, align 4
  %4 = load i32, i32* %n, align 4
  %5 = load i32, i32* %radix.addr, align 4
  %div = sdiv i32 %4, %5
  store i32 %div, i32* %n, align 4
  %6 = load i32, i32* %xx, align 4
  %add = add nsw i32 48, %6
  %conv = trunc i32 %add to i8
  %7 = load i8*, i8** %szBuffer.addr, align 8
  %8 = load i32, i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %idxprom
  store i8 %conv, i8* %arrayidx, align 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %9 = load i8*, i8** %szBuffer.addr, align 8
  %10 = load i32, i32* %i, align 4
  %idxprom1 = sext i32 %10 to i64
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %idxprom1
  store i8 0, i8* %arrayidx2, align 1
  %11 = load i8*, i8** %szBuffer.addr, align 8
  %call = call i8* @_Z6strrevPc(i8* %11)
  ret void
}

; Function Attrs: noinline optnone uwtable
define i32 @writePgm(i8* %fileName, [320 x i8]* %Data) #2 {
entry:
  %retval = alloca i32, align 4
  %fileName.addr = alloca i8*, align 8
  %Data.addr = alloca [320 x i8]*, align 8
  %parameters_str = alloca [5 x i8], align 1
  %i = alloca i32, align 4
  %format = alloca i8*, align 8
  %fp = alloca %struct._IO_FILE*, align 8
  %j = alloca i32, align 4
  store i8* %fileName, i8** %fileName.addr, align 8
  store [320 x i8]* %Data, [320 x i8]** %Data.addr, align 8
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8** %format, align 8
  %0 = load i8*, i8** %fileName.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %tobool = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %fileName.addr, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i32 0, i32 0), i8* %2)
  store i32 -1, i32* %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %format, align 8
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call2 = call i32 @fputs(i8* %3, %struct._IO_FILE* %4)
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call3 = call i32 @fputc(i32 10, %struct._IO_FILE* %5)
  %arraydecay = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i32 0, i32 0
  call void @_Z7itochariPci(i32 320, i8* %arraydecay, i32 10)
  %arraydecay4 = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i32 0, i32 0
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call5 = call i32 @fputs(i8* %arraydecay4, %struct._IO_FILE* %6)
  %arrayidx = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i64 0, i64 0
  store i8 0, i8* %arrayidx, align 1
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call6 = call i32 @fputc(i32 32, %struct._IO_FILE* %7)
  %arraydecay7 = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i32 0, i32 0
  call void @_Z7itochariPci(i32 240, i8* %arraydecay7, i32 10)
  %arraydecay8 = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i32 0, i32 0
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call9 = call i32 @fputs(i8* %arraydecay8, %struct._IO_FILE* %8)
  %arrayidx10 = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i64 0, i64 0
  store i8 0, i8* %arrayidx10, align 1
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call11 = call i32 @fputc(i32 10, %struct._IO_FILE* %9)
  %arraydecay12 = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i32 0, i32 0
  call void @_Z7itochariPci(i32 255, i8* %arraydecay12, i32 10)
  %arraydecay13 = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i32 0, i32 0
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call14 = call i32 @fputs(i8* %arraydecay13, %struct._IO_FILE* %10)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call15 = call i32 @fputc(i32 10, %struct._IO_FILE* %11)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc23, %if.end
  %12 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %12, 240
  br i1 %cmp, label %for.body, label %for.end25

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc, %for.body
  %13 = load i32, i32* %j, align 4
  %cmp17 = icmp slt i32 %13, 320
  br i1 %cmp17, label %for.body18, label %for.end

for.body18:                                       ; preds = %for.cond16
  %14 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8
  %15 = load i32, i32* %i, align 4
  %idxprom = sext i32 %15 to i64
  %arrayidx19 = getelementptr inbounds [320 x i8], [320 x i8]* %14, i64 %idxprom
  %16 = load i32, i32* %j, align 4
  %idxprom20 = sext i32 %16 to i64
  %arrayidx21 = getelementptr inbounds [320 x i8], [320 x i8]* %arrayidx19, i64 0, i64 %idxprom20
  %17 = load i8, i8* %arrayidx21, align 1
  %conv = zext i8 %17 to i32
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call22 = call i32 @fputc(i32 %conv, %struct._IO_FILE* %18)
  br label %for.inc

for.inc:                                          ; preds = %for.body18
  %19 = load i32, i32* %j, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond16

for.end:                                          ; preds = %for.cond16
  br label %for.inc23

for.inc23:                                        ; preds = %for.end
  %20 = load i32, i32* %i, align 4
  %inc24 = add nsw i32 %20, 1
  store i32 %inc24, i32* %i, align 4
  br label %for.cond

for.end25:                                        ; preds = %for.cond
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8
  %call26 = call i32 @fclose(%struct._IO_FILE* %21)
  store i32 0, i32* %retval, align 4
  br label %return

return:                                           ; preds = %for.end25, %if.then
  %22 = load i32, i32* %retval, align 4
  ret i32 %22
}

declare noalias %struct._IO_FILE* @fopen(i8*, i8*) #3

declare i32 @printf(i8*, ...) #3

declare i32 @fputs(i8*, %struct._IO_FILE*) #3

declare i32 @fputc(i32, %struct._IO_FILE*) #3

declare i32 @fclose(%struct._IO_FILE*) #3

; Function Attrs: noinline nounwind optnone uwtable
define void @drawRectangle([320 x i8]* %Data, i64 %r.coerce0, i64 %r.coerce1) #0 {
entry:
  %r = alloca %struct.MyRect, align 4
  %Data.addr = alloca [320 x i8]*, align 8
  %i = alloca i32, align 4
  %col = alloca i32, align 4
  %0 = bitcast %struct.MyRect* %r to { i64, i64 }*
  %1 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 0
  store i64 %r.coerce0, i64* %1, align 4
  %2 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %0, i32 0, i32 1
  store i64 %r.coerce1, i64* %2, align 4
  store [320 x i8]* %Data, [320 x i8]** %Data.addr, align 8
  store i32 320, i32* %col, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4
  %width = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 2
  %4 = load i32, i32* %width, align 4
  %cmp = icmp slt i32 %3, %4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8
  %y = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 1
  %6 = load i32, i32* %y, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds [320 x i8], [320 x i8]* %5, i64 %idxprom
  %x = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 0
  %7 = load i32, i32* %x, align 4
  %8 = load i32, i32* %i, align 4
  %add = add nsw i32 %7, %8
  %idxprom1 = sext i32 %add to i64
  %arrayidx2 = getelementptr inbounds [320 x i8], [320 x i8]* %arrayidx, i64 0, i64 %idxprom1
  store i8 -1, i8* %arrayidx2, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc15, %for.end
  %10 = load i32, i32* %i, align 4
  %height = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 3
  %11 = load i32, i32* %height, align 4
  %cmp4 = icmp slt i32 %10, %11
  br i1 %cmp4, label %for.body5, label %for.end17

for.body5:                                        ; preds = %for.cond3
  %12 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8
  %y6 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 1
  %13 = load i32, i32* %y6, align 4
  %14 = load i32, i32* %i, align 4
  %add7 = add nsw i32 %13, %14
  %idxprom8 = sext i32 %add7 to i64
  %arrayidx9 = getelementptr inbounds [320 x i8], [320 x i8]* %12, i64 %idxprom8
  %x10 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 0
  %15 = load i32, i32* %x10, align 4
  %width11 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 2
  %16 = load i32, i32* %width11, align 4
  %add12 = add nsw i32 %15, %16
  %idxprom13 = sext i32 %add12 to i64
  %arrayidx14 = getelementptr inbounds [320 x i8], [320 x i8]* %arrayidx9, i64 0, i64 %idxprom13
  store i8 -1, i8* %arrayidx14, align 1
  br label %for.inc15

for.inc15:                                        ; preds = %for.body5
  %17 = load i32, i32* %i, align 4
  %inc16 = add nsw i32 %17, 1
  store i32 %inc16, i32* %i, align 4
  br label %for.cond3

for.end17:                                        ; preds = %for.cond3
  store i32 0, i32* %i, align 4
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc32, %for.end17
  %18 = load i32, i32* %i, align 4
  %width19 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 2
  %19 = load i32, i32* %width19, align 4
  %cmp20 = icmp slt i32 %18, %19
  br i1 %cmp20, label %for.body21, label %for.end34

for.body21:                                       ; preds = %for.cond18
  %20 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8
  %y22 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 1
  %21 = load i32, i32* %y22, align 4
  %height23 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 3
  %22 = load i32, i32* %height23, align 4
  %add24 = add nsw i32 %21, %22
  %idxprom25 = sext i32 %add24 to i64
  %arrayidx26 = getelementptr inbounds [320 x i8], [320 x i8]* %20, i64 %idxprom25
  %x27 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 0
  %23 = load i32, i32* %x27, align 4
  %width28 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 2
  %24 = load i32, i32* %width28, align 4
  %add29 = add nsw i32 %23, %24
  %25 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %add29, %25
  %idxprom30 = sext i32 %sub to i64
  %arrayidx31 = getelementptr inbounds [320 x i8], [320 x i8]* %arrayidx26, i64 0, i64 %idxprom30
  store i8 -1, i8* %arrayidx31, align 1
  br label %for.inc32

for.inc32:                                        ; preds = %for.body21
  %26 = load i32, i32* %i, align 4
  %inc33 = add nsw i32 %26, 1
  store i32 %inc33, i32* %i, align 4
  br label %for.cond18

for.end34:                                        ; preds = %for.cond18
  store i32 0, i32* %i, align 4
  br label %for.cond35

for.cond35:                                       ; preds = %for.inc48, %for.end34
  %27 = load i32, i32* %i, align 4
  %height36 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 3
  %28 = load i32, i32* %height36, align 4
  %cmp37 = icmp slt i32 %27, %28
  br i1 %cmp37, label %for.body38, label %for.end50

for.body38:                                       ; preds = %for.cond35
  %29 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8
  %y39 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 1
  %30 = load i32, i32* %y39, align 4
  %height40 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 3
  %31 = load i32, i32* %height40, align 4
  %add41 = add nsw i32 %30, %31
  %32 = load i32, i32* %i, align 4
  %sub42 = sub nsw i32 %add41, %32
  %idxprom43 = sext i32 %sub42 to i64
  %arrayidx44 = getelementptr inbounds [320 x i8], [320 x i8]* %29, i64 %idxprom43
  %x45 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 0
  %33 = load i32, i32* %x45, align 4
  %idxprom46 = sext i32 %33 to i64
  %arrayidx47 = getelementptr inbounds [320 x i8], [320 x i8]* %arrayidx44, i64 0, i64 %idxprom46
  store i8 -1, i8* %arrayidx47, align 1
  br label %for.inc48

for.inc48:                                        ; preds = %for.body38
  %34 = load i32, i32* %i, align 4
  %inc49 = add nsw i32 %34, 1
  store i32 %inc49, i32* %i, align 4
  br label %for.cond35

for.end50:                                        ; preds = %for.cond35
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly willreturn }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0 "}
