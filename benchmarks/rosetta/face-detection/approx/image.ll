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
define i8* @_Z6strrevPc(i8* %str) #0 !dbg !263 {
entry:
  %retval = alloca i8*, align 8
  %str.addr = alloca i8*, align 8
  %p1 = alloca i8*, align 8
  %p2 = alloca i8*, align 8
  store i8* %str, i8** %str.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %str.addr, metadata !266, metadata !DIExpression()), !dbg !267
  call void @llvm.dbg.declare(metadata i8** %p1, metadata !268, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.declare(metadata i8** %p2, metadata !270, metadata !DIExpression()), !dbg !271
  %0 = load i8*, i8** %str.addr, align 8, !dbg !272
  %tobool = icmp ne i8* %0, null, !dbg !272
  br i1 %tobool, label %lor.lhs.false, label %if.then, !dbg !274

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8*, i8** %str.addr, align 8, !dbg !275
  %2 = load i8, i8* %1, align 1, !dbg !276
  %tobool1 = icmp ne i8 %2, 0, !dbg !276
  br i1 %tobool1, label %if.end, label %if.then, !dbg !277

if.then:                                          ; preds = %lor.lhs.false, %entry
  %3 = load i8*, i8** %str.addr, align 8, !dbg !278
  store i8* %3, i8** %retval, align 8, !dbg !279
  br label %return, !dbg !279

if.end:                                           ; preds = %lor.lhs.false
  %4 = load i8*, i8** %str.addr, align 8, !dbg !280
  store i8* %4, i8** %p1, align 8, !dbg !282
  %5 = load i8*, i8** %str.addr, align 8, !dbg !283
  %6 = load i8*, i8** %str.addr, align 8, !dbg !284
  %call = call i64 @strlen(i8* %6) #5, !dbg !285
  %add.ptr = getelementptr inbounds i8, i8* %5, i64 %call, !dbg !286
  %add.ptr2 = getelementptr inbounds i8, i8* %add.ptr, i64 -1, !dbg !287
  store i8* %add.ptr2, i8** %p2, align 8, !dbg !288
  br label %for.cond, !dbg !289

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i8*, i8** %p2, align 8, !dbg !290
  %8 = load i8*, i8** %p1, align 8, !dbg !292
  %cmp = icmp ugt i8* %7, %8, !dbg !293
  br i1 %cmp, label %for.body, label %for.end, !dbg !294

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %p2, align 8, !dbg !295
  %10 = load i8, i8* %9, align 1, !dbg !297
  %conv = sext i8 %10 to i32, !dbg !297
  %11 = load i8*, i8** %p1, align 8, !dbg !298
  %12 = load i8, i8* %11, align 1, !dbg !299
  %conv3 = sext i8 %12 to i32, !dbg !299
  %xor = xor i32 %conv3, %conv, !dbg !299
  %conv4 = trunc i32 %xor to i8, !dbg !299
  store i8 %conv4, i8* %11, align 1, !dbg !299
  %13 = load i8*, i8** %p1, align 8, !dbg !300
  %14 = load i8, i8* %13, align 1, !dbg !301
  %conv5 = sext i8 %14 to i32, !dbg !301
  %15 = load i8*, i8** %p2, align 8, !dbg !302
  %16 = load i8, i8* %15, align 1, !dbg !303
  %conv6 = sext i8 %16 to i32, !dbg !303
  %xor7 = xor i32 %conv6, %conv5, !dbg !303
  %conv8 = trunc i32 %xor7 to i8, !dbg !303
  store i8 %conv8, i8* %15, align 1, !dbg !303
  %17 = load i8*, i8** %p2, align 8, !dbg !304
  %18 = load i8, i8* %17, align 1, !dbg !305
  %conv9 = sext i8 %18 to i32, !dbg !305
  %19 = load i8*, i8** %p1, align 8, !dbg !306
  %20 = load i8, i8* %19, align 1, !dbg !307
  %conv10 = sext i8 %20 to i32, !dbg !307
  %xor11 = xor i32 %conv10, %conv9, !dbg !307
  %conv12 = trunc i32 %xor11 to i8, !dbg !307
  store i8 %conv12, i8* %19, align 1, !dbg !307
  br label %for.inc, !dbg !308

for.inc:                                          ; preds = %for.body
  %21 = load i8*, i8** %p1, align 8, !dbg !309
  %incdec.ptr = getelementptr inbounds i8, i8* %21, i32 1, !dbg !309
  store i8* %incdec.ptr, i8** %p1, align 8, !dbg !309
  %22 = load i8*, i8** %p2, align 8, !dbg !310
  %incdec.ptr13 = getelementptr inbounds i8, i8* %22, i32 -1, !dbg !310
  store i8* %incdec.ptr13, i8** %p2, align 8, !dbg !310
  br label %for.cond, !dbg !311, !llvm.loop !312

for.end:                                          ; preds = %for.cond
  %23 = load i8*, i8** %str.addr, align 8, !dbg !314
  store i8* %23, i8** %retval, align 8, !dbg !315
  br label %return, !dbg !315

return:                                           ; preds = %for.end, %if.then
  %24 = load i8*, i8** %retval, align 8, !dbg !316
  ret i8* %24, !dbg !316
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare i64 @strlen(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define void @_Z7itochariPci(i32 %x, i8* %szBuffer, i32 %radix) #0 !dbg !317 {
entry:
  %x.addr = alloca i32, align 4
  %szBuffer.addr = alloca i8*, align 8
  %radix.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %xx = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !320, metadata !DIExpression()), !dbg !321
  store i8* %szBuffer, i8** %szBuffer.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %szBuffer.addr, metadata !322, metadata !DIExpression()), !dbg !323
  store i32 %radix, i32* %radix.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %radix.addr, metadata !324, metadata !DIExpression()), !dbg !325
  call void @llvm.dbg.declare(metadata i32* %i, metadata !326, metadata !DIExpression()), !dbg !327
  store i32 0, i32* %i, align 4, !dbg !327
  call void @llvm.dbg.declare(metadata i32* %n, metadata !328, metadata !DIExpression()), !dbg !329
  call void @llvm.dbg.declare(metadata i32* %xx, metadata !330, metadata !DIExpression()), !dbg !331
  %0 = load i32, i32* %x.addr, align 4, !dbg !332
  store i32 %0, i32* %n, align 4, !dbg !333
  br label %while.cond, !dbg !334

while.cond:                                       ; preds = %while.body, %entry
  %1 = load i32, i32* %n, align 4, !dbg !335
  %cmp = icmp sgt i32 %1, 0, !dbg !336
  br i1 %cmp, label %while.body, label %while.end, !dbg !334

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %n, align 4, !dbg !337
  %3 = load i32, i32* %radix.addr, align 4, !dbg !339
  %rem = srem i32 %2, %3, !dbg !340
  store i32 %rem, i32* %xx, align 4, !dbg !341
  %4 = load i32, i32* %n, align 4, !dbg !342
  %5 = load i32, i32* %radix.addr, align 4, !dbg !343
  %div = sdiv i32 %4, %5, !dbg !344
  store i32 %div, i32* %n, align 4, !dbg !345
  %6 = load i32, i32* %xx, align 4, !dbg !346
  %add = add nsw i32 48, %6, !dbg !347
  %conv = trunc i32 %add to i8, !dbg !348
  %7 = load i8*, i8** %szBuffer.addr, align 8, !dbg !349
  %8 = load i32, i32* %i, align 4, !dbg !350
  %inc = add nsw i32 %8, 1, !dbg !350
  store i32 %inc, i32* %i, align 4, !dbg !350
  %idxprom = sext i32 %8 to i64, !dbg !349
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %idxprom, !dbg !349
  store i8 %conv, i8* %arrayidx, align 1, !dbg !351
  br label %while.cond, !dbg !334, !llvm.loop !352

while.end:                                        ; preds = %while.cond
  %9 = load i8*, i8** %szBuffer.addr, align 8, !dbg !354
  %10 = load i32, i32* %i, align 4, !dbg !355
  %idxprom1 = sext i32 %10 to i64, !dbg !354
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %idxprom1, !dbg !354
  store i8 0, i8* %arrayidx2, align 1, !dbg !356
  %11 = load i8*, i8** %szBuffer.addr, align 8, !dbg !357
  %call = call i8* @_Z6strrevPc(i8* %11), !dbg !358
  ret void, !dbg !359
}

; Function Attrs: noinline optnone uwtable
define i32 @writePgm(i8* %fileName, [320 x i8]* %Data) #3 !dbg !360 {
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
  call void @llvm.dbg.declare(metadata i8** %fileName.addr, metadata !368, metadata !DIExpression()), !dbg !369
  store [320 x i8]* %Data, [320 x i8]** %Data.addr, align 8
  call void @llvm.dbg.declare(metadata [320 x i8]** %Data.addr, metadata !370, metadata !DIExpression()), !dbg !371
  call void @llvm.dbg.declare(metadata [5 x i8]* %parameters_str, metadata !372, metadata !DIExpression()), !dbg !376
  call void @llvm.dbg.declare(metadata i32* %i, metadata !377, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.declare(metadata i8** %format, metadata !379, metadata !DIExpression()), !dbg !380
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8** %format, align 8, !dbg !380
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %fp, metadata !381, metadata !DIExpression()), !dbg !387
  %0 = load i8*, i8** %fileName.addr, align 8, !dbg !388
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0)), !dbg !389
  store %struct._IO_FILE* %call, %struct._IO_FILE** %fp, align 8, !dbg !387
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !390
  %tobool = icmp ne %struct._IO_FILE* %1, null, !dbg !390
  br i1 %tobool, label %if.end, label %if.then, !dbg !392

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %fileName.addr, align 8, !dbg !393
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i32 0, i32 0), i8* %2), !dbg !395
  store i32 -1, i32* %retval, align 4, !dbg !396
  br label %return, !dbg !396

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %format, align 8, !dbg !397
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !398
  %call2 = call i32 @fputs(i8* %3, %struct._IO_FILE* %4), !dbg !399
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !400
  %call3 = call i32 @fputc(i32 10, %struct._IO_FILE* %5), !dbg !401
  %arraydecay = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i32 0, i32 0, !dbg !402
  call void @_Z7itochariPci(i32 320, i8* %arraydecay, i32 10), !dbg !403
  %arraydecay4 = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i32 0, i32 0, !dbg !404
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !405
  %call5 = call i32 @fputs(i8* %arraydecay4, %struct._IO_FILE* %6), !dbg !406
  %arrayidx = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i64 0, i64 0, !dbg !407
  store i8 0, i8* %arrayidx, align 1, !dbg !408
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !409
  %call6 = call i32 @fputc(i32 32, %struct._IO_FILE* %7), !dbg !410
  %arraydecay7 = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i32 0, i32 0, !dbg !411
  call void @_Z7itochariPci(i32 240, i8* %arraydecay7, i32 10), !dbg !412
  %arraydecay8 = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i32 0, i32 0, !dbg !413
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !414
  %call9 = call i32 @fputs(i8* %arraydecay8, %struct._IO_FILE* %8), !dbg !415
  %arrayidx10 = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i64 0, i64 0, !dbg !416
  store i8 0, i8* %arrayidx10, align 1, !dbg !417
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !418
  %call11 = call i32 @fputc(i32 10, %struct._IO_FILE* %9), !dbg !419
  %arraydecay12 = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i32 0, i32 0, !dbg !420
  call void @_Z7itochariPci(i32 255, i8* %arraydecay12, i32 10), !dbg !421
  %arraydecay13 = getelementptr inbounds [5 x i8], [5 x i8]* %parameters_str, i32 0, i32 0, !dbg !422
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !423
  %call14 = call i32 @fputs(i8* %arraydecay13, %struct._IO_FILE* %10), !dbg !424
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !425
  %call15 = call i32 @fputc(i32 10, %struct._IO_FILE* %11), !dbg !426
  store i32 0, i32* %i, align 4, !dbg !427
  br label %for.cond, !dbg !429

for.cond:                                         ; preds = %for.inc23, %if.end
  %12 = load i32, i32* %i, align 4, !dbg !430
  %cmp = icmp slt i32 %12, 240, !dbg !432
  br i1 %cmp, label %for.body, label %for.end25, !dbg !433

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %j, metadata !434, metadata !DIExpression()), !dbg !436
  store i32 0, i32* %j, align 4, !dbg !436
  br label %for.cond16, !dbg !437

for.cond16:                                       ; preds = %for.inc, %for.body
  %13 = load i32, i32* %j, align 4, !dbg !438
  %cmp17 = icmp slt i32 %13, 320, !dbg !440
  br i1 %cmp17, label %for.body18, label %for.end, !dbg !441

for.body18:                                       ; preds = %for.cond16
  %14 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8, !dbg !442
  %15 = load i32, i32* %i, align 4, !dbg !443
  %idxprom = sext i32 %15 to i64, !dbg !442
  %arrayidx19 = getelementptr inbounds [320 x i8], [320 x i8]* %14, i64 %idxprom, !dbg !442
  %16 = load i32, i32* %j, align 4, !dbg !444
  %idxprom20 = sext i32 %16 to i64, !dbg !442
  %arrayidx21 = getelementptr inbounds [320 x i8], [320 x i8]* %arrayidx19, i64 0, i64 %idxprom20, !dbg !442
  %17 = load i8, i8* %arrayidx21, align 1, !dbg !442
  %conv = zext i8 %17 to i32, !dbg !442
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !445
  %call22 = call i32 @fputc(i32 %conv, %struct._IO_FILE* %18), !dbg !446
  br label %for.inc, !dbg !446

for.inc:                                          ; preds = %for.body18
  %19 = load i32, i32* %j, align 4, !dbg !447
  %inc = add nsw i32 %19, 1, !dbg !447
  store i32 %inc, i32* %j, align 4, !dbg !447
  br label %for.cond16, !dbg !448, !llvm.loop !449

for.end:                                          ; preds = %for.cond16
  br label %for.inc23, !dbg !450

for.inc23:                                        ; preds = %for.end
  %20 = load i32, i32* %i, align 4, !dbg !451
  %inc24 = add nsw i32 %20, 1, !dbg !451
  store i32 %inc24, i32* %i, align 4, !dbg !451
  br label %for.cond, !dbg !452, !llvm.loop !453

for.end25:                                        ; preds = %for.cond
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %fp, align 8, !dbg !455
  %call26 = call i32 @fclose(%struct._IO_FILE* %21), !dbg !456
  store i32 0, i32* %retval, align 4, !dbg !457
  br label %return, !dbg !457

return:                                           ; preds = %for.end25, %if.then
  %22 = load i32, i32* %retval, align 4, !dbg !458
  ret i32 %22, !dbg !458
}

declare noalias %struct._IO_FILE* @fopen(i8*, i8*) #4

declare i32 @printf(i8*, ...) #4

declare i32 @fputs(i8*, %struct._IO_FILE*) #4

declare i32 @fputc(i32, %struct._IO_FILE*) #4

declare i32 @fclose(%struct._IO_FILE*) #4

; Function Attrs: noinline nounwind optnone uwtable
define void @drawRectangle([320 x i8]* %Data, i64 %r.coerce0, i64 %r.coerce1) #0 !dbg !459 {
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
  call void @llvm.dbg.declare(metadata [320 x i8]** %Data.addr, metadata !469, metadata !DIExpression()), !dbg !470
  call void @llvm.dbg.declare(metadata %struct.MyRect* %r, metadata !471, metadata !DIExpression()), !dbg !472
  call void @llvm.dbg.declare(metadata i32* %i, metadata !473, metadata !DIExpression()), !dbg !474
  call void @llvm.dbg.declare(metadata i32* %col, metadata !475, metadata !DIExpression()), !dbg !476
  store i32 320, i32* %col, align 4, !dbg !476
  store i32 0, i32* %i, align 4, !dbg !477
  br label %for.cond, !dbg !479

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, i32* %i, align 4, !dbg !480
  %width = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 2, !dbg !482
  %4 = load i32, i32* %width, align 4, !dbg !482
  %cmp = icmp slt i32 %3, %4, !dbg !483
  br i1 %cmp, label %for.body, label %for.end, !dbg !484

for.body:                                         ; preds = %for.cond
  %5 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8, !dbg !485
  %y = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 1, !dbg !486
  %6 = load i32, i32* %y, align 4, !dbg !486
  %idxprom = sext i32 %6 to i64, !dbg !485
  %arrayidx = getelementptr inbounds [320 x i8], [320 x i8]* %5, i64 %idxprom, !dbg !485
  %x = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 0, !dbg !487
  %7 = load i32, i32* %x, align 4, !dbg !487
  %8 = load i32, i32* %i, align 4, !dbg !488
  %add = add nsw i32 %7, %8, !dbg !489
  %idxprom1 = sext i32 %add to i64, !dbg !485
  %arrayidx2 = getelementptr inbounds [320 x i8], [320 x i8]* %arrayidx, i64 0, i64 %idxprom1, !dbg !485
  store i8 -1, i8* %arrayidx2, align 1, !dbg !490
  br label %for.inc, !dbg !485

for.inc:                                          ; preds = %for.body
  %9 = load i32, i32* %i, align 4, !dbg !491
  %inc = add nsw i32 %9, 1, !dbg !491
  store i32 %inc, i32* %i, align 4, !dbg !491
  br label %for.cond, !dbg !492, !llvm.loop !493

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4, !dbg !495
  br label %for.cond3, !dbg !497

for.cond3:                                        ; preds = %for.inc15, %for.end
  %10 = load i32, i32* %i, align 4, !dbg !498
  %height = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 3, !dbg !500
  %11 = load i32, i32* %height, align 4, !dbg !500
  %cmp4 = icmp slt i32 %10, %11, !dbg !501
  br i1 %cmp4, label %for.body5, label %for.end17, !dbg !502

for.body5:                                        ; preds = %for.cond3
  %12 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8, !dbg !503
  %y6 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 1, !dbg !504
  %13 = load i32, i32* %y6, align 4, !dbg !504
  %14 = load i32, i32* %i, align 4, !dbg !505
  %add7 = add nsw i32 %13, %14, !dbg !506
  %idxprom8 = sext i32 %add7 to i64, !dbg !503
  %arrayidx9 = getelementptr inbounds [320 x i8], [320 x i8]* %12, i64 %idxprom8, !dbg !503
  %x10 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 0, !dbg !507
  %15 = load i32, i32* %x10, align 4, !dbg !507
  %width11 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 2, !dbg !508
  %16 = load i32, i32* %width11, align 4, !dbg !508
  %add12 = add nsw i32 %15, %16, !dbg !509
  %idxprom13 = sext i32 %add12 to i64, !dbg !503
  %arrayidx14 = getelementptr inbounds [320 x i8], [320 x i8]* %arrayidx9, i64 0, i64 %idxprom13, !dbg !503
  store i8 -1, i8* %arrayidx14, align 1, !dbg !510
  br label %for.inc15, !dbg !503

for.inc15:                                        ; preds = %for.body5
  %17 = load i32, i32* %i, align 4, !dbg !511
  %inc16 = add nsw i32 %17, 1, !dbg !511
  store i32 %inc16, i32* %i, align 4, !dbg !511
  br label %for.cond3, !dbg !512, !llvm.loop !513

for.end17:                                        ; preds = %for.cond3
  store i32 0, i32* %i, align 4, !dbg !515
  br label %for.cond18, !dbg !517

for.cond18:                                       ; preds = %for.inc32, %for.end17
  %18 = load i32, i32* %i, align 4, !dbg !518
  %width19 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 2, !dbg !520
  %19 = load i32, i32* %width19, align 4, !dbg !520
  %cmp20 = icmp slt i32 %18, %19, !dbg !521
  br i1 %cmp20, label %for.body21, label %for.end34, !dbg !522

for.body21:                                       ; preds = %for.cond18
  %20 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8, !dbg !523
  %y22 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 1, !dbg !524
  %21 = load i32, i32* %y22, align 4, !dbg !524
  %height23 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 3, !dbg !525
  %22 = load i32, i32* %height23, align 4, !dbg !525
  %add24 = add nsw i32 %21, %22, !dbg !526
  %idxprom25 = sext i32 %add24 to i64, !dbg !523
  %arrayidx26 = getelementptr inbounds [320 x i8], [320 x i8]* %20, i64 %idxprom25, !dbg !523
  %x27 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 0, !dbg !527
  %23 = load i32, i32* %x27, align 4, !dbg !527
  %width28 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 2, !dbg !528
  %24 = load i32, i32* %width28, align 4, !dbg !528
  %add29 = add nsw i32 %23, %24, !dbg !529
  %25 = load i32, i32* %i, align 4, !dbg !530
  %sub = sub nsw i32 %add29, %25, !dbg !531
  %idxprom30 = sext i32 %sub to i64, !dbg !523
  %arrayidx31 = getelementptr inbounds [320 x i8], [320 x i8]* %arrayidx26, i64 0, i64 %idxprom30, !dbg !523
  store i8 -1, i8* %arrayidx31, align 1, !dbg !532
  br label %for.inc32, !dbg !523

for.inc32:                                        ; preds = %for.body21
  %26 = load i32, i32* %i, align 4, !dbg !533
  %inc33 = add nsw i32 %26, 1, !dbg !533
  store i32 %inc33, i32* %i, align 4, !dbg !533
  br label %for.cond18, !dbg !534, !llvm.loop !535

for.end34:                                        ; preds = %for.cond18
  store i32 0, i32* %i, align 4, !dbg !537
  br label %for.cond35, !dbg !539

for.cond35:                                       ; preds = %for.inc48, %for.end34
  %27 = load i32, i32* %i, align 4, !dbg !540
  %height36 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 3, !dbg !542
  %28 = load i32, i32* %height36, align 4, !dbg !542
  %cmp37 = icmp slt i32 %27, %28, !dbg !543
  br i1 %cmp37, label %for.body38, label %for.end50, !dbg !544

for.body38:                                       ; preds = %for.cond35
  %29 = load [320 x i8]*, [320 x i8]** %Data.addr, align 8, !dbg !545
  %y39 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 1, !dbg !546
  %30 = load i32, i32* %y39, align 4, !dbg !546
  %height40 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 3, !dbg !547
  %31 = load i32, i32* %height40, align 4, !dbg !547
  %add41 = add nsw i32 %30, %31, !dbg !548
  %32 = load i32, i32* %i, align 4, !dbg !549
  %sub42 = sub nsw i32 %add41, %32, !dbg !550
  %idxprom43 = sext i32 %sub42 to i64, !dbg !545
  %arrayidx44 = getelementptr inbounds [320 x i8], [320 x i8]* %29, i64 %idxprom43, !dbg !545
  %x45 = getelementptr inbounds %struct.MyRect, %struct.MyRect* %r, i32 0, i32 0, !dbg !551
  %33 = load i32, i32* %x45, align 4, !dbg !551
  %idxprom46 = sext i32 %33 to i64, !dbg !545
  %arrayidx47 = getelementptr inbounds [320 x i8], [320 x i8]* %arrayidx44, i64 0, i64 %idxprom46, !dbg !545
  store i8 -1, i8* %arrayidx47, align 1, !dbg !552
  br label %for.inc48, !dbg !545

for.inc48:                                        ; preds = %for.body38
  %34 = load i32, i32* %i, align 4, !dbg !553
  %inc49 = add nsw i32 %34, 1, !dbg !553
  store i32 %inc49, i32* %i, align 4, !dbg !553
  br label %for.cond35, !dbg !554, !llvm.loop !555

for.end50:                                        ; preds = %for.cond35
  ret void, !dbg !557
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!258, !259, !260, !261}
!llvm.ident = !{!262}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus, file: !1, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, globals: !3, imports: !13)
!1 = !DIFile(filename: "../src/image.cpp", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!2 = !{}
!3 = !{!4, !9, !11}
!4 = !DIGlobalVariableExpression(var: !5, expr: !DIExpression(DW_OP_constu, 320, DW_OP_stack_value))
!5 = distinct !DIGlobalVariable(name: "IMAGE_WIDTH", scope: !0, file: !6, line: 14, type: !7, isLocal: true, isDefinition: true)
!6 = !DIFile(filename: "../src/typedefs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!7 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression(DW_OP_constu, 240, DW_OP_stack_value))
!10 = distinct !DIGlobalVariable(name: "IMAGE_HEIGHT", scope: !0, file: !6, line: 13, type: !7, isLocal: true, isDefinition: true)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression(DW_OP_constu, 255, DW_OP_stack_value))
!12 = distinct !DIGlobalVariable(name: "IMAGE_MAXGREY", scope: !0, file: !6, line: 16, type: !7, isLocal: true, isDefinition: true)
!13 = !{!14, !21, !25, !32, !36, !41, !43, !51, !55, !59, !73, !77, !81, !85, !89, !94, !98, !102, !106, !110, !118, !122, !126, !128, !132, !136, !141, !147, !151, !155, !157, !165, !169, !177, !179, !183, !187, !191, !195, !200, !205, !210, !211, !212, !213, !215, !216, !217, !218, !219, !220, !221, !223, !224, !225, !226, !227, !228, !229, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257}
!14 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !16, file: !20, line: 52)
!15 = !DINamespace(name: "std", scope: null)
!16 = !DISubprogram(name: "abs", scope: !17, file: !17, line: 848, type: !18, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!17 = !DIFile(filename: "/usr/include/stdlib.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!18 = !DISubroutineType(types: !19)
!19 = !{!8, !8}
!20 = !DIFile(filename: "/usr/include/c++/11/bits/std_abs.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!21 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !22, file: !24, line: 127)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !17, line: 63, baseType: !23)
!23 = !DICompositeType(tag: DW_TAG_structure_type, file: !17, line: 59, size: 64, align: 32, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!24 = !DIFile(filename: "/usr/include/c++/11/cstdlib", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!25 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !26, file: !24, line: 128)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !17, line: 71, baseType: !27)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !17, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !28, identifier: "_ZTS6ldiv_t")
!28 = !{!29, !31}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !27, file: !17, line: 69, baseType: !30, size: 64)
!30 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !27, file: !17, line: 70, baseType: !30, size: 64, offset: 64)
!32 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !33, file: !24, line: 130)
!33 = !DISubprogram(name: "abort", scope: !17, file: !17, line: 598, type: !34, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !37, file: !24, line: 134)
!37 = !DISubprogram(name: "atexit", scope: !17, file: !17, line: 602, type: !38, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!38 = !DISubroutineType(types: !39)
!39 = !{!8, !40}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!41 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !42, file: !24, line: 137)
!42 = !DISubprogram(name: "at_quick_exit", scope: !17, file: !17, line: 607, type: !38, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!43 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !44, file: !24, line: 140)
!44 = !DISubprogram(name: "atof", scope: !17, file: !17, line: 102, type: !45, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !48}
!47 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !50)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !52, file: !24, line: 141)
!52 = !DISubprogram(name: "atoi", scope: !17, file: !17, line: 105, type: !53, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!53 = !DISubroutineType(types: !54)
!54 = !{!8, !48}
!55 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !56, file: !24, line: 142)
!56 = !DISubprogram(name: "atol", scope: !17, file: !17, line: 108, type: !57, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!57 = !DISubroutineType(types: !58)
!58 = !{!30, !48}
!59 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !60, file: !24, line: 143)
!60 = !DISubprogram(name: "bsearch", scope: !17, file: !17, line: 828, type: !61, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !64, !64, !66, !66, !69}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !67, line: 62, baseType: !68)
!67 = !DIFile(filename: "/home/gabriel/Documents/hls-llvm-project/hls-build/lib/clang/7.0.0/include/stddef.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!68 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !17, line: 816, baseType: !70)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DISubroutineType(types: !72)
!72 = !{!8, !64, !64}
!73 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !74, file: !24, line: 144)
!74 = !DISubprogram(name: "calloc", scope: !17, file: !17, line: 543, type: !75, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!75 = !DISubroutineType(types: !76)
!76 = !{!63, !66, !66}
!77 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !78, file: !24, line: 145)
!78 = !DISubprogram(name: "div", scope: !17, file: !17, line: 860, type: !79, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!79 = !DISubroutineType(types: !80)
!80 = !{!22, !8, !8}
!81 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !82, file: !24, line: 146)
!82 = !DISubprogram(name: "exit", scope: !17, file: !17, line: 624, type: !83, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!83 = !DISubroutineType(types: !84)
!84 = !{null, !8}
!85 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !86, file: !24, line: 147)
!86 = !DISubprogram(name: "free", scope: !17, file: !17, line: 555, type: !87, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!87 = !DISubroutineType(types: !88)
!88 = !{null, !63}
!89 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !90, file: !24, line: 148)
!90 = !DISubprogram(name: "getenv", scope: !17, file: !17, line: 641, type: !91, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!91 = !DISubroutineType(types: !92)
!92 = !{!93, !48}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!94 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !95, file: !24, line: 149)
!95 = !DISubprogram(name: "labs", scope: !17, file: !17, line: 849, type: !96, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!96 = !DISubroutineType(types: !97)
!97 = !{!30, !30}
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !99, file: !24, line: 150)
!99 = !DISubprogram(name: "ldiv", scope: !17, file: !17, line: 862, type: !100, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!100 = !DISubroutineType(types: !101)
!101 = !{!26, !30, !30}
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !103, file: !24, line: 151)
!103 = !DISubprogram(name: "malloc", scope: !17, file: !17, line: 540, type: !104, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!104 = !DISubroutineType(types: !105)
!105 = !{!63, !66}
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !107, file: !24, line: 153)
!107 = !DISubprogram(name: "mblen", scope: !17, file: !17, line: 930, type: !108, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!108 = !DISubroutineType(types: !109)
!109 = !{!8, !48, !66}
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !111, file: !24, line: 154)
!111 = !DISubprogram(name: "mbstowcs", scope: !17, file: !17, line: 941, type: !112, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!112 = !DISubroutineType(types: !113)
!113 = !{!66, !114, !117, !66}
!114 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !115)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!117 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !48)
!118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !119, file: !24, line: 155)
!119 = !DISubprogram(name: "mbtowc", scope: !17, file: !17, line: 933, type: !120, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!120 = !DISubroutineType(types: !121)
!121 = !{!8, !114, !117, !66}
!122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !123, file: !24, line: 157)
!123 = !DISubprogram(name: "qsort", scope: !17, file: !17, line: 838, type: !124, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!124 = !DISubroutineType(types: !125)
!125 = !{null, !63, !66, !66, !69}
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !127, file: !24, line: 160)
!127 = !DISubprogram(name: "quick_exit", scope: !17, file: !17, line: 630, type: !83, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !129, file: !24, line: 163)
!129 = !DISubprogram(name: "rand", scope: !17, file: !17, line: 454, type: !130, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!130 = !DISubroutineType(types: !131)
!131 = !{!8}
!132 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !133, file: !24, line: 164)
!133 = !DISubprogram(name: "realloc", scope: !17, file: !17, line: 551, type: !134, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!134 = !DISubroutineType(types: !135)
!135 = !{!63, !63, !66}
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !137, file: !24, line: 165)
!137 = !DISubprogram(name: "srand", scope: !17, file: !17, line: 456, type: !138, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!138 = !DISubroutineType(types: !139)
!139 = !{null, !140}
!140 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !142, file: !24, line: 166)
!142 = !DISubprogram(name: "strtod", scope: !17, file: !17, line: 118, type: !143, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!143 = !DISubroutineType(types: !144)
!144 = !{!47, !117, !145}
!145 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !146)
!146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !148, file: !24, line: 167)
!148 = !DISubprogram(name: "strtol", scope: !17, file: !17, line: 177, type: !149, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!149 = !DISubroutineType(types: !150)
!150 = !{!30, !117, !145, !8}
!151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !152, file: !24, line: 168)
!152 = !DISubprogram(name: "strtoul", scope: !17, file: !17, line: 181, type: !153, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!153 = !DISubroutineType(types: !154)
!154 = !{!68, !117, !145, !8}
!155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !156, file: !24, line: 169)
!156 = !DISubprogram(name: "system", scope: !17, file: !17, line: 791, type: !53, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!157 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !158, file: !24, line: 171)
!158 = !DISubprogram(name: "wcstombs", scope: !17, file: !17, line: 945, type: !159, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!159 = !DISubroutineType(types: !160)
!160 = !{!66, !161, !162, !66}
!161 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !93)
!162 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !163)
!163 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !164, size: 64)
!164 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !116)
!165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !166, file: !24, line: 172)
!166 = !DISubprogram(name: "wctomb", scope: !17, file: !17, line: 937, type: !167, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!167 = !DISubroutineType(types: !168)
!168 = !{!8, !93, !116}
!169 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !170, entity: !171, file: !24, line: 200)
!170 = !DINamespace(name: "__gnu_cxx", scope: null)
!171 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !17, line: 81, baseType: !172)
!172 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !17, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !173, identifier: "_ZTS7lldiv_t")
!173 = !{!174, !176}
!174 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !172, file: !17, line: 79, baseType: !175, size: 64)
!175 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !172, file: !17, line: 80, baseType: !175, size: 64, offset: 64)
!177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !170, entity: !178, file: !24, line: 206)
!178 = !DISubprogram(name: "_Exit", scope: !17, file: !17, line: 636, type: !83, isLocal: false, isDefinition: false, flags: DIFlagPrototyped | DIFlagNoReturn, isOptimized: false)
!179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !170, entity: !180, file: !24, line: 210)
!180 = !DISubprogram(name: "llabs", scope: !17, file: !17, line: 852, type: !181, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!181 = !DISubroutineType(types: !182)
!182 = !{!175, !175}
!183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !170, entity: !184, file: !24, line: 216)
!184 = !DISubprogram(name: "lldiv", scope: !17, file: !17, line: 866, type: !185, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!185 = !DISubroutineType(types: !186)
!186 = !{!171, !175, !175}
!187 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !170, entity: !188, file: !24, line: 227)
!188 = !DISubprogram(name: "atoll", scope: !17, file: !17, line: 113, type: !189, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!189 = !DISubroutineType(types: !190)
!190 = !{!175, !48}
!191 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !170, entity: !192, file: !24, line: 228)
!192 = !DISubprogram(name: "strtoll", scope: !17, file: !17, line: 201, type: !193, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!193 = !DISubroutineType(types: !194)
!194 = !{!175, !117, !145, !8}
!195 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !170, entity: !196, file: !24, line: 229)
!196 = !DISubprogram(name: "strtoull", scope: !17, file: !17, line: 206, type: !197, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!197 = !DISubroutineType(types: !198)
!198 = !{!199, !117, !145, !8}
!199 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !170, entity: !201, file: !24, line: 231)
!201 = !DISubprogram(name: "strtof", scope: !17, file: !17, line: 124, type: !202, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!202 = !DISubroutineType(types: !203)
!203 = !{!204, !117, !145}
!204 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!205 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !170, entity: !206, file: !24, line: 232)
!206 = !DISubprogram(name: "strtold", scope: !17, file: !17, line: 127, type: !207, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!207 = !DISubroutineType(types: !208)
!208 = !{!209, !117, !145}
!209 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !171, file: !24, line: 240)
!211 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !178, file: !24, line: 242)
!212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !180, file: !24, line: 244)
!213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !214, file: !24, line: 245)
!214 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !170, file: !24, line: 213, type: !185, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !184, file: !24, line: 246)
!216 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !188, file: !24, line: 248)
!217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !201, file: !24, line: 249)
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !192, file: !24, line: 250)
!219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !196, file: !24, line: 251)
!220 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !15, entity: !206, file: !24, line: 252)
!221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !33, file: !222, line: 38)
!222 = !DIFile(filename: "/usr/include/c++/11/stdlib.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!223 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !37, file: !222, line: 39)
!224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !82, file: !222, line: 40)
!225 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !42, file: !222, line: 43)
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !127, file: !222, line: 46)
!227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !22, file: !222, line: 51)
!228 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !26, file: !222, line: 52)
!229 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !230, file: !222, line: 54)
!230 = !DISubprogram(name: "abs", linkageName: "_ZSt3absg", scope: !15, file: !20, line: 103, type: !231, isLocal: false, isDefinition: false, flags: DIFlagPrototyped, isOptimized: false)
!231 = !DISubroutineType(types: !232)
!232 = !{!233, !233}
!233 = !DIBasicType(name: "__float128", size: 128, encoding: DW_ATE_float)
!234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !44, file: !222, line: 55)
!235 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !52, file: !222, line: 56)
!236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !56, file: !222, line: 57)
!237 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !60, file: !222, line: 58)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !74, file: !222, line: 59)
!239 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !214, file: !222, line: 60)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !86, file: !222, line: 61)
!241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !90, file: !222, line: 62)
!242 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !95, file: !222, line: 63)
!243 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !99, file: !222, line: 64)
!244 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !103, file: !222, line: 65)
!245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !107, file: !222, line: 67)
!246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !111, file: !222, line: 68)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !119, file: !222, line: 69)
!248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !123, file: !222, line: 71)
!249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !129, file: !222, line: 72)
!250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !133, file: !222, line: 73)
!251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !137, file: !222, line: 74)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !142, file: !222, line: 75)
!253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !148, file: !222, line: 76)
!254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !152, file: !222, line: 77)
!255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !156, file: !222, line: 78)
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !158, file: !222, line: 80)
!257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !0, entity: !166, file: !222, line: 81)
!258 = !{i32 2, !"Dwarf Version", i32 4}
!259 = !{i32 2, !"Debug Info Version", i32 3}
!260 = !{i32 1, !"wchar_size", i32 4}
!261 = !{i32 7, !"PIC Level", i32 2}
!262 = !{!"clang version 7.0.0 "}
!263 = distinct !DISubprogram(name: "strrev", linkageName: "_Z6strrevPc", scope: !1, file: !1, line: 6, type: !264, isLocal: false, isDefinition: true, scopeLine: 7, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!264 = !DISubroutineType(types: !265)
!265 = !{!93, !93}
!266 = !DILocalVariable(name: "str", arg: 1, scope: !263, file: !1, line: 6, type: !93)
!267 = !DILocation(line: 6, column: 20, scope: !263)
!268 = !DILocalVariable(name: "p1", scope: !263, file: !1, line: 8, type: !93)
!269 = !DILocation(line: 8, column: 9, scope: !263)
!270 = !DILocalVariable(name: "p2", scope: !263, file: !1, line: 8, type: !93)
!271 = !DILocation(line: 8, column: 14, scope: !263)
!272 = !DILocation(line: 9, column: 8, scope: !273)
!273 = distinct !DILexicalBlock(scope: !263, file: !1, line: 9, column: 7)
!274 = !DILocation(line: 9, column: 12, scope: !273)
!275 = !DILocation(line: 9, column: 17, scope: !273)
!276 = !DILocation(line: 9, column: 16, scope: !273)
!277 = !DILocation(line: 9, column: 7, scope: !263)
!278 = !DILocation(line: 10, column: 11, scope: !273)
!279 = !DILocation(line: 10, column: 4, scope: !273)
!280 = !DILocation(line: 11, column: 13, scope: !281)
!281 = distinct !DILexicalBlock(scope: !263, file: !1, line: 11, column: 3)
!282 = !DILocation(line: 11, column: 11, scope: !281)
!283 = !DILocation(line: 11, column: 23, scope: !281)
!284 = !DILocation(line: 11, column: 36, scope: !281)
!285 = !DILocation(line: 11, column: 29, scope: !281)
!286 = !DILocation(line: 11, column: 27, scope: !281)
!287 = !DILocation(line: 11, column: 41, scope: !281)
!288 = !DILocation(line: 11, column: 21, scope: !281)
!289 = !DILocation(line: 11, column: 8, scope: !281)
!290 = !DILocation(line: 11, column: 46, scope: !291)
!291 = distinct !DILexicalBlock(scope: !281, file: !1, line: 11, column: 3)
!292 = !DILocation(line: 11, column: 51, scope: !291)
!293 = !DILocation(line: 11, column: 49, scope: !291)
!294 = !DILocation(line: 11, column: 3, scope: !281)
!295 = !DILocation(line: 13, column: 12, scope: !296)
!296 = distinct !DILexicalBlock(scope: !291, file: !1, line: 12, column: 3)
!297 = !DILocation(line: 13, column: 11, scope: !296)
!298 = !DILocation(line: 13, column: 5, scope: !296)
!299 = !DILocation(line: 13, column: 8, scope: !296)
!300 = !DILocation(line: 14, column: 12, scope: !296)
!301 = !DILocation(line: 14, column: 11, scope: !296)
!302 = !DILocation(line: 14, column: 5, scope: !296)
!303 = !DILocation(line: 14, column: 8, scope: !296)
!304 = !DILocation(line: 15, column: 12, scope: !296)
!305 = !DILocation(line: 15, column: 11, scope: !296)
!306 = !DILocation(line: 15, column: 5, scope: !296)
!307 = !DILocation(line: 15, column: 8, scope: !296)
!308 = !DILocation(line: 16, column: 3, scope: !296)
!309 = !DILocation(line: 11, column: 55, scope: !291)
!310 = !DILocation(line: 11, column: 61, scope: !291)
!311 = !DILocation(line: 11, column: 3, scope: !291)
!312 = distinct !{!312, !294, !313}
!313 = !DILocation(line: 16, column: 3, scope: !281)
!314 = !DILocation(line: 17, column: 10, scope: !263)
!315 = !DILocation(line: 17, column: 3, scope: !263)
!316 = !DILocation(line: 18, column: 1, scope: !263)
!317 = distinct !DISubprogram(name: "itochar", linkageName: "_Z7itochariPci", scope: !1, file: !1, line: 20, type: !318, isLocal: false, isDefinition: true, scopeLine: 21, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!318 = !DISubroutineType(types: !319)
!319 = !{null, !8, !93, !8}
!320 = !DILocalVariable(name: "x", arg: 1, scope: !317, file: !1, line: 20, type: !8)
!321 = !DILocation(line: 20, column: 18, scope: !317)
!322 = !DILocalVariable(name: "szBuffer", arg: 2, scope: !317, file: !1, line: 20, type: !93)
!323 = !DILocation(line: 20, column: 27, scope: !317)
!324 = !DILocalVariable(name: "radix", arg: 3, scope: !317, file: !1, line: 20, type: !8)
!325 = !DILocation(line: 20, column: 41, scope: !317)
!326 = !DILocalVariable(name: "i", scope: !317, file: !1, line: 22, type: !8)
!327 = !DILocation(line: 22, column: 7, scope: !317)
!328 = !DILocalVariable(name: "n", scope: !317, file: !1, line: 22, type: !8)
!329 = !DILocation(line: 22, column: 14, scope: !317)
!330 = !DILocalVariable(name: "xx", scope: !317, file: !1, line: 22, type: !8)
!331 = !DILocation(line: 22, column: 17, scope: !317)
!332 = !DILocation(line: 23, column: 7, scope: !317)
!333 = !DILocation(line: 23, column: 5, scope: !317)
!334 = !DILocation(line: 24, column: 3, scope: !317)
!335 = !DILocation(line: 24, column: 10, scope: !317)
!336 = !DILocation(line: 24, column: 12, scope: !317)
!337 = !DILocation(line: 26, column: 9, scope: !338)
!338 = distinct !DILexicalBlock(scope: !317, file: !1, line: 25, column: 3)
!339 = !DILocation(line: 26, column: 11, scope: !338)
!340 = !DILocation(line: 26, column: 10, scope: !338)
!341 = !DILocation(line: 26, column: 7, scope: !338)
!342 = !DILocation(line: 27, column: 8, scope: !338)
!343 = !DILocation(line: 27, column: 10, scope: !338)
!344 = !DILocation(line: 27, column: 9, scope: !338)
!345 = !DILocation(line: 27, column: 6, scope: !338)
!346 = !DILocation(line: 28, column: 26, scope: !338)
!347 = !DILocation(line: 28, column: 24, scope: !338)
!348 = !DILocation(line: 28, column: 20, scope: !338)
!349 = !DILocation(line: 28, column: 4, scope: !338)
!350 = !DILocation(line: 28, column: 14, scope: !338)
!351 = !DILocation(line: 28, column: 18, scope: !338)
!352 = distinct !{!352, !334, !353}
!353 = !DILocation(line: 29, column: 3, scope: !317)
!354 = !DILocation(line: 30, column: 3, scope: !317)
!355 = !DILocation(line: 30, column: 12, scope: !317)
!356 = !DILocation(line: 30, column: 15, scope: !317)
!357 = !DILocation(line: 31, column: 10, scope: !317)
!358 = !DILocation(line: 31, column: 3, scope: !317)
!359 = !DILocation(line: 32, column: 1, scope: !317)
!360 = distinct !DISubprogram(name: "writePgm", scope: !1, file: !1, line: 35, type: !361, isLocal: false, isDefinition: true, scopeLine: 36, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!361 = !DISubroutineType(types: !362)
!362 = !{!8, !48, !363}
!363 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !364, size: 64)
!364 = !DICompositeType(tag: DW_TAG_array_type, baseType: !365, size: 2560, elements: !366)
!365 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!366 = !{!367}
!367 = !DISubrange(count: 320)
!368 = !DILocalVariable(name: "fileName", arg: 1, scope: !360, file: !1, line: 35, type: !48)
!369 = !DILocation(line: 35, column: 26, scope: !360)
!370 = !DILocalVariable(name: "Data", arg: 2, scope: !360, file: !1, line: 35, type: !363)
!371 = !DILocation(line: 35, column: 50, scope: !360)
!372 = !DILocalVariable(name: "parameters_str", scope: !360, file: !1, line: 37, type: !373)
!373 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 40, elements: !374)
!374 = !{!375}
!375 = !DISubrange(count: 5)
!376 = !DILocation(line: 37, column: 8, scope: !360)
!377 = !DILocalVariable(name: "i", scope: !360, file: !1, line: 38, type: !8)
!378 = !DILocation(line: 38, column: 7, scope: !360)
!379 = !DILocalVariable(name: "format", scope: !360, file: !1, line: 39, type: !48)
!380 = !DILocation(line: 39, column: 15, scope: !360)
!381 = !DILocalVariable(name: "fp", scope: !360, file: !1, line: 40, type: !382)
!382 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !383, size: 64)
!383 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !384, line: 7, baseType: !385)
!384 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!385 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !386, line: 49, size: 1728, align: 64, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!386 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "/home/gabriel/Documents/UFRGS/RAISE/Approx/benchmarks/rosetta/face-detection/approx")
!387 = !DILocation(line: 40, column: 9, scope: !360)
!388 = !DILocation(line: 40, column: 20, scope: !360)
!389 = !DILocation(line: 40, column: 14, scope: !360)
!390 = !DILocation(line: 42, column: 8, scope: !391)
!391 = distinct !DILexicalBlock(scope: !360, file: !1, line: 42, column: 7)
!392 = !DILocation(line: 42, column: 7, scope: !360)
!393 = !DILocation(line: 43, column: 40, scope: !394)
!394 = distinct !DILexicalBlock(scope: !391, file: !1, line: 42, column: 11)
!395 = !DILocation(line: 43, column: 5, scope: !394)
!396 = !DILocation(line: 44, column: 5, scope: !394)
!397 = !DILocation(line: 47, column: 9, scope: !360)
!398 = !DILocation(line: 47, column: 17, scope: !360)
!399 = !DILocation(line: 47, column: 3, scope: !360)
!400 = !DILocation(line: 48, column: 15, scope: !360)
!401 = !DILocation(line: 48, column: 3, scope: !360)
!402 = !DILocation(line: 50, column: 24, scope: !360)
!403 = !DILocation(line: 50, column: 3, scope: !360)
!404 = !DILocation(line: 51, column: 9, scope: !360)
!405 = !DILocation(line: 51, column: 25, scope: !360)
!406 = !DILocation(line: 51, column: 3, scope: !360)
!407 = !DILocation(line: 52, column: 3, scope: !360)
!408 = !DILocation(line: 52, column: 21, scope: !360)
!409 = !DILocation(line: 53, column: 14, scope: !360)
!410 = !DILocation(line: 53, column: 3, scope: !360)
!411 = !DILocation(line: 55, column: 25, scope: !360)
!412 = !DILocation(line: 55, column: 3, scope: !360)
!413 = !DILocation(line: 56, column: 9, scope: !360)
!414 = !DILocation(line: 56, column: 25, scope: !360)
!415 = !DILocation(line: 56, column: 3, scope: !360)
!416 = !DILocation(line: 57, column: 3, scope: !360)
!417 = !DILocation(line: 57, column: 21, scope: !360)
!418 = !DILocation(line: 58, column: 15, scope: !360)
!419 = !DILocation(line: 58, column: 3, scope: !360)
!420 = !DILocation(line: 60, column: 26, scope: !360)
!421 = !DILocation(line: 60, column: 3, scope: !360)
!422 = !DILocation(line: 61, column: 9, scope: !360)
!423 = !DILocation(line: 61, column: 25, scope: !360)
!424 = !DILocation(line: 61, column: 3, scope: !360)
!425 = !DILocation(line: 62, column: 15, scope: !360)
!426 = !DILocation(line: 62, column: 3, scope: !360)
!427 = !DILocation(line: 64, column: 10, scope: !428)
!428 = distinct !DILexicalBlock(scope: !360, file: !1, line: 64, column: 3)
!429 = !DILocation(line: 64, column: 8, scope: !428)
!430 = !DILocation(line: 64, column: 15, scope: !431)
!431 = distinct !DILexicalBlock(scope: !428, file: !1, line: 64, column: 3)
!432 = !DILocation(line: 64, column: 17, scope: !431)
!433 = !DILocation(line: 64, column: 3, scope: !428)
!434 = !DILocalVariable(name: "j", scope: !435, file: !1, line: 65, type: !8)
!435 = distinct !DILexicalBlock(scope: !431, file: !1, line: 65, column: 5)
!436 = !DILocation(line: 65, column: 14, scope: !435)
!437 = !DILocation(line: 65, column: 10, scope: !435)
!438 = !DILocation(line: 65, column: 21, scope: !439)
!439 = distinct !DILexicalBlock(scope: !435, file: !1, line: 65, column: 5)
!440 = !DILocation(line: 65, column: 23, scope: !439)
!441 = !DILocation(line: 65, column: 5, scope: !435)
!442 = !DILocation(line: 66, column: 14, scope: !439)
!443 = !DILocation(line: 66, column: 19, scope: !439)
!444 = !DILocation(line: 66, column: 22, scope: !439)
!445 = !DILocation(line: 66, column: 26, scope: !439)
!446 = !DILocation(line: 66, column: 8, scope: !439)
!447 = !DILocation(line: 65, column: 40, scope: !439)
!448 = !DILocation(line: 65, column: 5, scope: !439)
!449 = distinct !{!449, !441, !450}
!450 = !DILocation(line: 66, column: 28, scope: !435)
!451 = !DILocation(line: 64, column: 34, scope: !431)
!452 = !DILocation(line: 64, column: 3, scope: !431)
!453 = distinct !{!453, !433, !454}
!454 = !DILocation(line: 66, column: 28, scope: !428)
!455 = !DILocation(line: 68, column: 10, scope: !360)
!456 = !DILocation(line: 68, column: 3, scope: !360)
!457 = !DILocation(line: 69, column: 3, scope: !360)
!458 = !DILocation(line: 70, column: 1, scope: !360)
!459 = distinct !DISubprogram(name: "drawRectangle", scope: !1, file: !1, line: 73, type: !460, isLocal: false, isDefinition: true, scopeLine: 74, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!460 = !DISubroutineType(types: !461)
!461 = !{null, !363, !462}
!462 = !DIDerivedType(tag: DW_TAG_typedef, name: "MyRect", file: !6, line: 49, baseType: !463)
!463 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 43, size: 128, flags: DIFlagTypePassByValue, elements: !464, identifier: "_ZTS6MyRect")
!464 = !{!465, !466, !467, !468}
!465 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !463, file: !6, line: 45, baseType: !8, size: 32)
!466 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !463, file: !6, line: 46, baseType: !8, size: 32, offset: 32)
!467 = !DIDerivedType(tag: DW_TAG_member, name: "width", scope: !463, file: !6, line: 47, baseType: !8, size: 32, offset: 64)
!468 = !DIDerivedType(tag: DW_TAG_member, name: "height", scope: !463, file: !6, line: 48, baseType: !8, size: 32, offset: 96)
!469 = !DILocalVariable(name: "Data", arg: 1, scope: !459, file: !1, line: 73, type: !363)
!470 = !DILocation(line: 73, column: 34, scope: !459)
!471 = !DILocalVariable(name: "r", arg: 2, scope: !459, file: !1, line: 73, type: !462)
!472 = !DILocation(line: 73, column: 74, scope: !459)
!473 = !DILocalVariable(name: "i", scope: !459, file: !1, line: 75, type: !8)
!474 = !DILocation(line: 75, column: 7, scope: !459)
!475 = !DILocalVariable(name: "col", scope: !459, file: !1, line: 76, type: !8)
!476 = !DILocation(line: 76, column: 7, scope: !459)
!477 = !DILocation(line: 78, column: 10, scope: !478)
!478 = distinct !DILexicalBlock(scope: !459, file: !1, line: 78, column: 3)
!479 = !DILocation(line: 78, column: 8, scope: !478)
!480 = !DILocation(line: 78, column: 15, scope: !481)
!481 = distinct !DILexicalBlock(scope: !478, file: !1, line: 78, column: 3)
!482 = !DILocation(line: 78, column: 21, scope: !481)
!483 = !DILocation(line: 78, column: 17, scope: !481)
!484 = !DILocation(line: 78, column: 3, scope: !478)
!485 = !DILocation(line: 79, column: 5, scope: !481)
!486 = !DILocation(line: 79, column: 12, scope: !481)
!487 = !DILocation(line: 79, column: 17, scope: !481)
!488 = !DILocation(line: 79, column: 21, scope: !481)
!489 = !DILocation(line: 79, column: 19, scope: !481)
!490 = !DILocation(line: 79, column: 24, scope: !481)
!491 = !DILocation(line: 78, column: 29, scope: !481)
!492 = !DILocation(line: 78, column: 3, scope: !481)
!493 = distinct !{!493, !484, !494}
!494 = !DILocation(line: 79, column: 26, scope: !478)
!495 = !DILocation(line: 80, column: 10, scope: !496)
!496 = distinct !DILexicalBlock(scope: !459, file: !1, line: 80, column: 3)
!497 = !DILocation(line: 80, column: 8, scope: !496)
!498 = !DILocation(line: 80, column: 15, scope: !499)
!499 = distinct !DILexicalBlock(scope: !496, file: !1, line: 80, column: 3)
!500 = !DILocation(line: 80, column: 21, scope: !499)
!501 = !DILocation(line: 80, column: 17, scope: !499)
!502 = !DILocation(line: 80, column: 3, scope: !496)
!503 = !DILocation(line: 81, column: 5, scope: !499)
!504 = !DILocation(line: 81, column: 12, scope: !499)
!505 = !DILocation(line: 81, column: 14, scope: !499)
!506 = !DILocation(line: 81, column: 13, scope: !499)
!507 = !DILocation(line: 81, column: 19, scope: !499)
!508 = !DILocation(line: 81, column: 25, scope: !499)
!509 = !DILocation(line: 81, column: 21, scope: !499)
!510 = !DILocation(line: 81, column: 32, scope: !499)
!511 = !DILocation(line: 80, column: 30, scope: !499)
!512 = !DILocation(line: 80, column: 3, scope: !499)
!513 = distinct !{!513, !502, !514}
!514 = !DILocation(line: 81, column: 34, scope: !496)
!515 = !DILocation(line: 82, column: 10, scope: !516)
!516 = distinct !DILexicalBlock(scope: !459, file: !1, line: 82, column: 3)
!517 = !DILocation(line: 82, column: 8, scope: !516)
!518 = !DILocation(line: 82, column: 15, scope: !519)
!519 = distinct !DILexicalBlock(scope: !516, file: !1, line: 82, column: 3)
!520 = !DILocation(line: 82, column: 21, scope: !519)
!521 = !DILocation(line: 82, column: 17, scope: !519)
!522 = !DILocation(line: 82, column: 3, scope: !516)
!523 = !DILocation(line: 83, column: 5, scope: !519)
!524 = !DILocation(line: 83, column: 12, scope: !519)
!525 = !DILocation(line: 83, column: 18, scope: !519)
!526 = !DILocation(line: 83, column: 14, scope: !519)
!527 = !DILocation(line: 83, column: 28, scope: !519)
!528 = !DILocation(line: 83, column: 34, scope: !519)
!529 = !DILocation(line: 83, column: 30, scope: !519)
!530 = !DILocation(line: 83, column: 42, scope: !519)
!531 = !DILocation(line: 83, column: 40, scope: !519)
!532 = !DILocation(line: 83, column: 45, scope: !519)
!533 = !DILocation(line: 82, column: 29, scope: !519)
!534 = !DILocation(line: 82, column: 3, scope: !519)
!535 = distinct !{!535, !522, !536}
!536 = !DILocation(line: 83, column: 47, scope: !516)
!537 = !DILocation(line: 84, column: 10, scope: !538)
!538 = distinct !DILexicalBlock(scope: !459, file: !1, line: 84, column: 3)
!539 = !DILocation(line: 84, column: 8, scope: !538)
!540 = !DILocation(line: 84, column: 15, scope: !541)
!541 = distinct !DILexicalBlock(scope: !538, file: !1, line: 84, column: 3)
!542 = !DILocation(line: 84, column: 21, scope: !541)
!543 = !DILocation(line: 84, column: 17, scope: !541)
!544 = !DILocation(line: 84, column: 3, scope: !538)
!545 = !DILocation(line: 85, column: 5, scope: !541)
!546 = !DILocation(line: 85, column: 12, scope: !541)
!547 = !DILocation(line: 85, column: 18, scope: !541)
!548 = !DILocation(line: 85, column: 14, scope: !541)
!549 = !DILocation(line: 85, column: 27, scope: !541)
!550 = !DILocation(line: 85, column: 25, scope: !541)
!551 = !DILocation(line: 85, column: 32, scope: !541)
!552 = !DILocation(line: 85, column: 35, scope: !541)
!553 = !DILocation(line: 84, column: 30, scope: !541)
!554 = !DILocation(line: 84, column: 3, scope: !541)
!555 = distinct !{!555, !544, !556}
!556 = !DILocation(line: 85, column: 37, scope: !538)
!557 = !DILocation(line: 86, column: 1, scope: !459)
