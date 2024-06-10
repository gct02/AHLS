; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.BinOpInfo = type { i32, i32, i8, i8, i32, double, double, double, double, double, %struct.BinOpInfo* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.MyRect = type { i32, i32, i32, i32 }

@ops = global %struct.BinOpInfo* null, align 8
@.str = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"%u|%u|%u|%u|%u|%u|%lf|%lf|%lf|%lf|\0A\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Unable to open %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.1.4 = private unnamed_addr constant [31 x i8] c"Error: could not open file %s\0A\00", align 1
@.str.2.5 = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str.3.6 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.4 = private unnamed_addr constant [35 x i8] c"Error: could not open output file\0A\00", align 1
@.str.5 = private unnamed_addr constant [19 x i8] c"\0Aresult_size = %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [40 x i8] c"\0A [Test Bench (main) ] detected rects: \00", align 1
@.str.7 = private unnamed_addr constant [13 x i8] c"%d %d %d %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [37 x i8] c"\0A-- saving output image [Start] --\0D\0A\00", align 1
@.str.9 = private unnamed_addr constant [17 x i8] c"output_image.pgm\00", align 1
@.str.10 = private unnamed_addr constant [36 x i8] c"\0A-- saving output image [Done] --\0D\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define void @profOp(i64 %instID, i8 zeroext %instOpcode, i64 %signedIntValue, i64 %unsignedIntValue, double %fpValue, i1 zeroext %isSignedValue, i1 zeroext %isFpValue, i32 %bitwidth) #0 {
entry:
  %instID.addr = alloca i64, align 8
  %instOpcode.addr = alloca i8, align 1
  %signedIntValue.addr = alloca i64, align 8
  %unsignedIntValue.addr = alloca i64, align 8
  %fpValue.addr = alloca double, align 8
  %isSignedValue.addr = alloca i8, align 1
  %isFpValue.addr = alloca i8, align 1
  %bitwidth.addr = alloca i32, align 4
  %isNewOp = alloca i8, align 1
  %currentOp = alloca %struct.BinOpInfo*, align 8
  %oldNumOccurs = alloca double, align 8
  %oldMean = alloca double, align 8
  %oldVariance = alloca double, align 8
  %newNumOccurs = alloca double, align 8
  %squaredValue = alloca double, align 8
  %newMean = alloca double, align 8
  %newVariance = alloca double, align 8
  %newOp = alloca %struct.BinOpInfo*, align 8
  store i64 %instID, i64* %instID.addr, align 8
  store i8 %instOpcode, i8* %instOpcode.addr, align 1
  store i64 %signedIntValue, i64* %signedIntValue.addr, align 8
  store i64 %unsignedIntValue, i64* %unsignedIntValue.addr, align 8
  store double %fpValue, double* %fpValue.addr, align 8
  %frombool = zext i1 %isSignedValue to i8
  store i8 %frombool, i8* %isSignedValue.addr, align 1
  %frombool1 = zext i1 %isFpValue to i8
  store i8 %frombool1, i8* %isFpValue.addr, align 1
  store i32 %bitwidth, i32* %bitwidth.addr, align 4
  store i8 1, i8* %isNewOp, align 1
  %0 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  store %struct.BinOpInfo* %0, %struct.BinOpInfo** %currentOp, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end52, %entry
  %1 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %cmp = icmp ne %struct.BinOpInfo* %1, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %opID = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %2, i32 0, i32 0
  %3 = load i32, i32* %opID, align 8
  %conv = zext i32 %3 to i64
  %4 = load i64, i64* %instID.addr, align 8
  %cmp2 = icmp eq i64 %conv, %4
  br i1 %cmp2, label %if.then, label %if.else51

if.then:                                          ; preds = %while.body
  %5 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %numOccurs = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %5, i32 0, i32 5
  %6 = load double, double* %numOccurs, align 8
  store double %6, double* %oldNumOccurs, align 8
  %7 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %mean = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %7, i32 0, i32 6
  %8 = load double, double* %mean, align 8
  store double %8, double* %oldMean, align 8
  %9 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %variance = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %9, i32 0, i32 7
  %10 = load double, double* %variance, align 8
  store double %10, double* %oldVariance, align 8
  %11 = load double, double* %oldNumOccurs, align 8
  %add = fadd double %11, 1.000000e+00
  store double %add, double* %newNumOccurs, align 8
  %12 = load i8, i8* %isFpValue.addr, align 1
  %tobool = trunc i8 %12 to i1
  br i1 %tobool, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.then
  %13 = load double, double* %fpValue.addr, align 8
  %call = call double @pow(double %13, double 2.000000e+00) #6
  store double %call, double* %squaredValue, align 8
  %14 = load double, double* %oldMean, align 8
  %15 = load double, double* %fpValue.addr, align 8
  %16 = load double, double* %oldMean, align 8
  %sub = fsub double %15, %16
  %17 = load double, double* %newNumOccurs, align 8
  %div = fdiv double %sub, %17
  %add5 = fadd double %14, %div
  store double %add5, double* %newMean, align 8
  %18 = load double, double* %oldNumOccurs, align 8
  %19 = load double, double* %newNumOccurs, align 8
  %div6 = fdiv double %18, %19
  %20 = load double, double* %oldVariance, align 8
  %mul = fmul double %div6, %20
  %21 = load double, double* %fpValue.addr, align 8
  %22 = load double, double* %oldMean, align 8
  %sub7 = fsub double %21, %22
  %23 = load double, double* %newNumOccurs, align 8
  %div8 = fdiv double %sub7, %23
  %24 = load double, double* %fpValue.addr, align 8
  %25 = load double, double* %newMean, align 8
  %sub9 = fsub double %24, %25
  %mul10 = fmul double %div8, %sub9
  %add11 = fadd double %mul, %mul10
  store double %add11, double* %newVariance, align 8
  br label %if.end45

if.else:                                          ; preds = %if.then
  %26 = load i8, i8* %isSignedValue.addr, align 1
  %tobool12 = trunc i8 %26 to i1
  br i1 %tobool12, label %if.then13, label %if.else29

if.then13:                                        ; preds = %if.else
  %27 = load i64, i64* %signedIntValue.addr, align 8
  %conv14 = sitofp i64 %27 to double
  %call15 = call double @pow(double %conv14, double 2.000000e+00) #6
  store double %call15, double* %squaredValue, align 8
  %28 = load double, double* %oldMean, align 8
  %29 = load i64, i64* %signedIntValue.addr, align 8
  %conv16 = sitofp i64 %29 to double
  %30 = load double, double* %oldMean, align 8
  %sub17 = fsub double %conv16, %30
  %31 = load double, double* %newNumOccurs, align 8
  %div18 = fdiv double %sub17, %31
  %add19 = fadd double %28, %div18
  store double %add19, double* %newMean, align 8
  %32 = load double, double* %oldVariance, align 8
  %33 = load double, double* %newNumOccurs, align 8
  %div20 = fdiv double %32, %33
  %34 = load double, double* %oldNumOccurs, align 8
  %mul21 = fmul double %div20, %34
  %35 = load double, double* %newMean, align 8
  %36 = load i64, i64* %signedIntValue.addr, align 8
  %conv22 = sitofp i64 %36 to double
  %sub23 = fsub double %35, %conv22
  %37 = load double, double* %newNumOccurs, align 8
  %div24 = fdiv double %sub23, %37
  %38 = load double, double* %newMean, align 8
  %39 = load i64, i64* %signedIntValue.addr, align 8
  %conv25 = sitofp i64 %39 to double
  %sub26 = fsub double %38, %conv25
  %mul27 = fmul double %div24, %sub26
  %add28 = fadd double %mul21, %mul27
  store double %add28, double* %newVariance, align 8
  br label %if.end

if.else29:                                        ; preds = %if.else
  %40 = load i64, i64* %unsignedIntValue.addr, align 8
  %conv30 = uitofp i64 %40 to double
  %call31 = call double @pow(double %conv30, double 2.000000e+00) #6
  store double %call31, double* %squaredValue, align 8
  %41 = load double, double* %oldMean, align 8
  %42 = load i64, i64* %unsignedIntValue.addr, align 8
  %conv32 = uitofp i64 %42 to double
  %43 = load double, double* %oldMean, align 8
  %sub33 = fsub double %conv32, %43
  %44 = load double, double* %newNumOccurs, align 8
  %div34 = fdiv double %sub33, %44
  %add35 = fadd double %41, %div34
  store double %add35, double* %newMean, align 8
  %45 = load double, double* %oldVariance, align 8
  %46 = load double, double* %newNumOccurs, align 8
  %div36 = fdiv double %45, %46
  %47 = load double, double* %oldNumOccurs, align 8
  %mul37 = fmul double %div36, %47
  %48 = load double, double* %newMean, align 8
  %49 = load i64, i64* %unsignedIntValue.addr, align 8
  %conv38 = uitofp i64 %49 to double
  %sub39 = fsub double %48, %conv38
  %50 = load double, double* %newNumOccurs, align 8
  %div40 = fdiv double %sub39, %50
  %51 = load double, double* %newMean, align 8
  %52 = load i64, i64* %unsignedIntValue.addr, align 8
  %conv41 = uitofp i64 %52 to double
  %sub42 = fsub double %51, %conv41
  %mul43 = fmul double %div40, %sub42
  %add44 = fadd double %mul37, %mul43
  store double %add44, double* %newVariance, align 8
  br label %if.end

if.end:                                           ; preds = %if.else29, %if.then13
  br label %if.end45

if.end45:                                         ; preds = %if.end, %if.then4
  %53 = load double, double* %newNumOccurs, align 8
  %54 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %numOccurs46 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %54, i32 0, i32 5
  store double %53, double* %numOccurs46, align 8
  %55 = load double, double* %newMean, align 8
  %56 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %mean47 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %56, i32 0, i32 6
  store double %55, double* %mean47, align 8
  %57 = load double, double* %newVariance, align 8
  %58 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %variance48 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %58, i32 0, i32 7
  store double %57, double* %variance48, align 8
  %59 = load double, double* %newVariance, align 8
  %call49 = call double @sqrt(double %59) #6
  %60 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %standardDev = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %60, i32 0, i32 8
  store double %call49, double* %standardDev, align 8
  %61 = load double, double* %squaredValue, align 8
  %62 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %sumOfSquares = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %62, i32 0, i32 9
  %63 = load double, double* %sumOfSquares, align 8
  %add50 = fadd double %63, %61
  store double %add50, double* %sumOfSquares, align 8
  store i8 0, i8* %isNewOp, align 1
  br label %while.end

if.else51:                                        ; preds = %while.body
  %64 = load %struct.BinOpInfo*, %struct.BinOpInfo** %currentOp, align 8
  %next = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %64, i32 0, i32 10
  %65 = load %struct.BinOpInfo*, %struct.BinOpInfo** %next, align 8
  store %struct.BinOpInfo* %65, %struct.BinOpInfo** %currentOp, align 8
  br label %if.end52

if.end52:                                         ; preds = %if.else51
  br label %while.cond

while.end:                                        ; preds = %if.end45, %while.cond
  %66 = load i8, i8* %isNewOp, align 1
  %tobool53 = trunc i8 %66 to i1
  br i1 %tobool53, label %if.then54, label %if.end91

if.then54:                                        ; preds = %while.end
  %call55 = call noalias i8* @malloc(i64 64) #6
  %67 = bitcast i8* %call55 to %struct.BinOpInfo*
  store %struct.BinOpInfo* %67, %struct.BinOpInfo** %newOp, align 8
  %68 = load i64, i64* %instID.addr, align 8
  %conv56 = trunc i64 %68 to i32
  %69 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %opID57 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %69, i32 0, i32 0
  store i32 %conv56, i32* %opID57, align 8
  %70 = load i8, i8* %instOpcode.addr, align 1
  %conv58 = zext i8 %70 to i32
  %71 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %opCode = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %71, i32 0, i32 1
  store i32 %conv58, i32* %opCode, align 4
  %72 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %numOccurs59 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %72, i32 0, i32 5
  store double 1.000000e+00, double* %numOccurs59, align 8
  %73 = load i8, i8* %isFpValue.addr, align 1
  %tobool60 = trunc i8 %73 to i1
  br i1 %tobool60, label %if.then61, label %if.else65

if.then61:                                        ; preds = %if.then54
  %74 = load double, double* %fpValue.addr, align 8
  %75 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %mean62 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %75, i32 0, i32 6
  store double %74, double* %mean62, align 8
  %76 = load double, double* %fpValue.addr, align 8
  %call63 = call double @pow(double %76, double 2.000000e+00) #6
  %77 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %sumOfSquares64 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %77, i32 0, i32 9
  store double %call63, double* %sumOfSquares64, align 8
  br label %if.end80

if.else65:                                        ; preds = %if.then54
  %78 = load i8, i8* %isSignedValue.addr, align 1
  %tobool66 = trunc i8 %78 to i1
  br i1 %tobool66, label %if.then67, label %if.else73

if.then67:                                        ; preds = %if.else65
  %79 = load i64, i64* %signedIntValue.addr, align 8
  %conv68 = sitofp i64 %79 to double
  %80 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %mean69 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %80, i32 0, i32 6
  store double %conv68, double* %mean69, align 8
  %81 = load i64, i64* %signedIntValue.addr, align 8
  %conv70 = sitofp i64 %81 to double
  %call71 = call double @pow(double %conv70, double 2.000000e+00) #6
  %82 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %sumOfSquares72 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %82, i32 0, i32 9
  store double %call71, double* %sumOfSquares72, align 8
  br label %if.end79

if.else73:                                        ; preds = %if.else65
  %83 = load i64, i64* %unsignedIntValue.addr, align 8
  %conv74 = uitofp i64 %83 to double
  %84 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %mean75 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %84, i32 0, i32 6
  store double %conv74, double* %mean75, align 8
  %85 = load i64, i64* %unsignedIntValue.addr, align 8
  %conv76 = uitofp i64 %85 to double
  %call77 = call double @pow(double %conv76, double 2.000000e+00) #6
  %86 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %sumOfSquares78 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %86, i32 0, i32 9
  store double %call77, double* %sumOfSquares78, align 8
  br label %if.end79

if.end79:                                         ; preds = %if.else73, %if.then67
  br label %if.end80

if.end80:                                         ; preds = %if.end79, %if.then61
  %87 = load i8, i8* %isSignedValue.addr, align 1
  %tobool81 = trunc i8 %87 to i1
  %88 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %isSignedValue82 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %88, i32 0, i32 2
  %frombool83 = zext i1 %tobool81 to i8
  store i8 %frombool83, i8* %isSignedValue82, align 8
  %89 = load i8, i8* %isFpValue.addr, align 1
  %tobool84 = trunc i8 %89 to i1
  %90 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %isFpValue85 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %90, i32 0, i32 3
  %frombool86 = zext i1 %tobool84 to i8
  store i8 %frombool86, i8* %isFpValue85, align 1
  %91 = load i32, i32* %bitwidth.addr, align 4
  %92 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %bitwidth87 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %92, i32 0, i32 4
  store i32 %91, i32* %bitwidth87, align 4
  %93 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %variance88 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %93, i32 0, i32 7
  store double 0.000000e+00, double* %variance88, align 8
  %94 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %standardDev89 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %94, i32 0, i32 8
  store double 0.000000e+00, double* %standardDev89, align 8
  %95 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %96 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  %next90 = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %96, i32 0, i32 10
  store %struct.BinOpInfo* %95, %struct.BinOpInfo** %next90, align 8
  %97 = load %struct.BinOpInfo*, %struct.BinOpInfo** %newOp, align 8
  store %struct.BinOpInfo* %97, %struct.BinOpInfo** @ops, align 8
  br label %if.end91

if.end91:                                         ; preds = %if.end80, %while.end
  ret void
}

; Function Attrs: nounwind
declare double @pow(double, double) #1

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: noinline nounwind optnone uwtable
define void @saveProfile(i8* %fileName) #0 {
entry:
  %fileName.addr = alloca i8*, align 8
  %count = alloca i32, align 4
  %nextOp = alloca %struct.BinOpInfo*, align 8
  %outputFile = alloca %struct._IO_FILE*, align 8
  store i8* %fileName, i8** %fileName.addr, align 8
  store i32 0, i32* %count, align 4
  %0 = load i8*, i8** %fileName.addr, align 8
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %outputFile, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %outputFile, align 8
  %tobool = icmp ne %struct._IO_FILE* %1, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then
  %2 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %cmp = icmp ne %struct.BinOpInfo* %2, null
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %outputFile, align 8
  %4 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %opID = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %4, i32 0, i32 0
  %5 = load i32, i32* %opID, align 8
  %6 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %opCode = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %6, i32 0, i32 1
  %7 = load i32, i32* %opCode, align 4
  %8 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %isSignedValue = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %8, i32 0, i32 2
  %9 = load i8, i8* %isSignedValue, align 8
  %tobool1 = trunc i8 %9 to i1
  %conv = zext i1 %tobool1 to i32
  %10 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %isFpValue = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %10, i32 0, i32 3
  %11 = load i8, i8* %isFpValue, align 1
  %tobool2 = trunc i8 %11 to i1
  %conv3 = zext i1 %tobool2 to i32
  %12 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %bitwidth = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %12, i32 0, i32 4
  %13 = load i32, i32* %bitwidth, align 4
  %14 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %numOccurs = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %14, i32 0, i32 5
  %15 = load double, double* %numOccurs, align 8
  %conv4 = fptoui double %15 to i32
  %16 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %mean = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %16, i32 0, i32 6
  %17 = load double, double* %mean, align 8
  %18 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %variance = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %18, i32 0, i32 7
  %19 = load double, double* %variance, align 8
  %20 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %standardDev = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %20, i32 0, i32 8
  %21 = load double, double* %standardDev, align 8
  %22 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %sumOfSquares = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %22, i32 0, i32 9
  %23 = load double, double* %sumOfSquares, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i32 0, i32 0), i32 %5, i32 %7, i32 %conv, i32 %conv3, i32 %13, i32 %conv4, double %17, double %19, double %21, double %23)
  %24 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %next = getelementptr inbounds %struct.BinOpInfo, %struct.BinOpInfo* %24, i32 0, i32 10
  %25 = load %struct.BinOpInfo*, %struct.BinOpInfo** %next, align 8
  store %struct.BinOpInfo* %25, %struct.BinOpInfo** %nextOp, align 8
  %26 = load %struct.BinOpInfo*, %struct.BinOpInfo** @ops, align 8
  %27 = bitcast %struct.BinOpInfo* %26 to i8*
  call void @free(i8* %27) #6
  %28 = load %struct.BinOpInfo*, %struct.BinOpInfo** %nextOp, align 8
  store %struct.BinOpInfo* %28, %struct.BinOpInfo** @ops, align 8
  %29 = load i32, i32* %count, align 4
  %inc = add nsw i32 %29, 1
  store i32 %inc, i32* %count, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** %outputFile, align 8
  %call6 = call i32 @fclose(%struct._IO_FILE* %30)
  br label %if.end

if.else:                                          ; preds = %entry
  %31 = load i8*, i8** %fileName.addr, align 8
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i32 0, i32 0), i8* %31)
  br label %if.end

if.end:                                           ; preds = %if.else, %while.end
  ret void
}

declare noalias %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare void @free(i8*) #1

declare i32 @fclose(%struct._IO_FILE*) #2

declare i32 @printf(i8*, ...) #2

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
  %call = call noalias %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %file, align 8
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %file, align 8
  %cmp = icmp eq %struct._IO_FILE* %1, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %filename.addr, align 8
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1.4, i32 0, i32 0), i8* %2)
  call void @exit(i32 1) #7
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

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #2

; Function Attrs: noinline optnone uwtable
define void @populateOutput(i32 %result_size, i32* %result_x, i32* %result_y, i32* %result_w, i32* %result_h, [320 x i8]* %Data) #3 {
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
  %call = call noalias %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2.5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3.6, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %ofile, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %ofile, align 8
  %cmp = icmp eq %struct._IO_FILE* %0, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 1) #7
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

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #5

declare void @drawRectangle([320 x i8]*, i64, i64) #2

declare i32 @writePgm(i8*, [320 x i8]*) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0, !0}
!llvm.module.flags = !{!1}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 1, !"wchar_size", i32 4}
